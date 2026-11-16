# <a id="appendix-d-variational-perspective-and-dynamical-convergence-to-alignment-regularity"></a>Appendix D: Variational Perspective and Dynamical Convergence to Alignment & Regularity

## D.1 Introduction: Optimization Landscape and Convergence

This appendix studies how the model's cost landscape can guide slow adaptation. It shows when a stable state aligns its internal complexity estimate with its true cost, when noisy updates remain close to that alignment, and when the lowest-cost network geometry is regular. Each conclusion depends on the stated cost, comparison, and stochastic assumptions.

**Technical ledger.**

This Appendix develops the variational perspective on the Predictive Universe (PU) framework's dynamics, providing rigorous dynamical justifications for two cornerstone results presented in the main text:
1.  **Dynamical justification of Theorem 2 (Dynamically Enforced Functional Correspondence):** Isolating the exact equilibrium condition $C_P(v)=\langle \hat{C}_v \rangle$ for true stable PCE equilibria, together with the quantitative operational tracking bound that drives the proxy toward that condition.
2.  **Conditional dynamical justification of Theorem 43 (Geometric Regularity on the Strict-Comparison Branch):** Showing that geometric regularity characterizes the lowest-potential sector only when the declared monotonicity and regular-comparator hypotheses hold, and is selected by the low-noise detailed-balance stationary regime only under the additional stochastic hypotheses.

We introduce the **Principle of Compression Efficiency (PCE) Potential $V(x)$**, a branch-defined effective potential whose admissible terms, weights, and physical identification must be independently specified or derived. Axiom 1 (POP) and Definition 15 (PCE) provide the optimization grammar; they do not uniquely determine the physical function $V$. The system's slow adaptation dynamics, governing the evolution of the network configuration $x(t)$, are modeled as a stochastic gradient flow on the landscape defined by $V(x)$. The stochastic differential equation (SDE) governing these dynamics is:
$$
\mathrm{d}x_t \;=\; -\eta(x_t)\,\nabla V(x_t)\,\mathrm{d}t \;+\; \sqrt{2D(x_t)}\,\mathrm{d}W_t,
\quad \text{(D.0)}
$$
where the potential $V(x_t)$ serves as a stochastic Lyapunov function (after an irrelevant additive normalization one may take $V\ge 0$). Under suitable conditions (detailed in Section D.6.2), the expected rate of change satisfies $\frac{\mathrm{d}}{\mathrm{d}t}\mathbb{E}[V(x_t)]\le 0$ when far from equilibrium, driving the system towards lower-potential regions. The stability of this process requires that the gradient $\nabla V$ be well-defined, which in turn requires the declared regularity and response-coordinate hypotheses. As detailed in Appendix X, additional branch hypotheses connect this potential to a 1PI effective action and a functional-renormalization-group representation. By analyzing the structure of $V(x)$ and the properties of this process, we prove three complementary conditional results: exact alignment at true stable PCE equilibria on the faithful-force-identifiability branch, quantitative proxy tracking with an explicit expected-misalignment upper bound under the operational stochastic hypotheses, and geometric regularity of the lowest-potential sector on the strict-comparison branch. These are implications of the named potential, comparison, and stochastic premises.

## D.2 The Instantaneous PCE Potential ($V(x)$)

The PCE principle mandates that the MPU network seeks configurations $x$ that optimize the trade-off between maximizing predictive utility (Benefit) and minimizing comprehensive costs (Operational, Propagation, Adaptation). The PCE Potential $V(x)$ quantifies this trade-off, such that configurations minimizing $V(x)$ correspond to the PCE-optimal states. $V(x)$ represents the effective potential governing the *slow* adaptation dynamics of the network configuration $x(t)$, encompassing network structure $\mathcal{N}(t)$, local MPU complexities $\{C_v(t) = \langle \hat{C}_v \rangle_{x(t)}\}$, and related macroscopic variables influencing costs and benefits.

<a id="definition-d1-structure-of-the-pce-potential-vx"></a>**Definition D.1 (Structure of the PCE Potential $V(x)$).** Let $x$ represent the complete configuration state of the MPU network within the admissible state space $\mathcal{X}_{adm}$. The effective PCE Potential $V(x)$, representing the net cost rate the system seeks to minimize under its operational dynamics, is constructed as:
$$
V(x) = V_{op}(x) + V_{\mathrm{prop}}(x) - V_{\mathrm{benefit}}(x) + V_{\mathrm{penalty}}(x)
\quad \text{(D.1)}
$$
where:
*   **$V_{op}(x) = \sum_{v} \langle \lambda \hat{R}(C_v) + \hat{R}_I(C_v) \rangle_{\rho^{(v)}(x)}$**: The total expected operational cost rate (power) associated with the complexity configuration $\{C_v = \langle \hat{C}_v \rangle_x\}$, including physical costs $R(C)$ and informational costs $R_I(C)$ (Definition 3), weighted by the scarcity factor $\lambda$ (Definition 20).
*   **$V_{\mathrm{prop}}(x) = \sum_{(u,v)} \langle \Phi(w_{uv}) \rangle_{\rho(x)}$**: The total expected propagation cost rate associated with maintaining predictive coherence and communication infrastructure across the network. The link weight $w_{uv}$ uses the separately registered reset, capacity, and refresh-contraction coordinates of Definition 35 on their respective branches. The information-rate dependence of $\Phi$ and its relation to the finite channel capacity must be specified for the chosen communication model. A propagation-cost increase for an irregular geometry requires the quantitative comparison hypotheses of Appendix C or the certificate of Lemma D.3. Appendix G.8 supplies one model of communication cost for gauge coherence within the total network cost in Equation G.8.5.
*   **$V_{\mathrm{benefit}}(x) = \sum_{v} \Gamma_0 B(PP_v(x))$**: The total effective power-equivalent predictive benefit derived from the network's performance. $PP_v(x)$ is the local Predictive Performance (Definition 7) of MPU $v$ in configuration $x$, dependent on $C_v = \langle \hat{C}_v \rangle_x$ and the local effective target complexity $\hat{C}_{\mathrm{target}}(v, x)$ via the Law of Prediction (Theorem 19, Equation 22). $B(PP)$ is a monotonically increasing benefit function (e.g., $B(PP) = PP$ or related to reduction in prediction error), and $\Gamma_0$ is the power conversion factor (Definition 20).
*   **$V_{\mathrm{penalty}}(x)$**: Represents effective penalty terms supplied on the corresponding branch. Sections D.3 and D.4 show the consequences of a faithful misalignment restoring force and of a strict geometric-comparator penalty.

The potential $V(x)$ is assumed to be continuously differentiable ($C^1$) with respect to the relevant components of configuration $x$ within $\mathcal{X}_{adm}$, and bounded below. The system's adaptation dynamics aim to minimize this operational potential $V(x)$, subject to the resource-order gate below.

<a id="definition-d1b-pce-resource-preorder-and-dual-certificates"></a>**Definition D.1b (PCE Resource Preorder and Dual Certificates).** For each admissible configuration $x\in\mathcal X_{adm}$ define its PCE resource vector
$$
r(x)
=
\big(
V_{op}(x),
V_{\mathrm{prop}}(x),
V_{\mathrm{penalty}}(x),
-V_{\mathrm{benefit}}(x)
\big)
\in\mathbb R^4.
$$
Let $K=\mathbb R_{\ge0}^4$ be the positive resource cone. Define
$$
x\preceq_{\mathrm{PCE}}y
\quad\Longleftrightarrow\quad
r(y)-r(x)\in K.
\tag{D.1b}
$$
Thus $x$ is no more costly than $y$ in every PCE component and at least as beneficial in the benefit coordinate. A dual PCE certificate is any vector
$$
w\in K^*=\mathbb R_{\ge0}^4
$$
and its scalar certificate functional is
$$
V_w(x)=w\cdot r(x).
\tag{D.1c}
$$
The potential (D.1) is the positive certificate $w=(1,1,1,1)$.

<a id="theorem-d1c-pce-dual-certificate-gate"></a>**Theorem D.1c (PCE Dual-Certificate Gate).** Let $x,y\in\mathcal X_{adm}$.

1. If $x\preceq_{\mathrm{PCE}}y$, then $V_w(x)\le V_w(y)$ for every dual PCE certificate $w\in K^*$.
2. If $x\preceq_{\mathrm{PCE}}y$ and at least one component of $r(y)-r(x)$ is strictly positive, then $V_w(x)<V_w(y)$ for every $w\in\mathrm{int}\,K^*$.
3. Therefore no PCE-admissible scalarization with strictly positive weights may select $y$ over $x$ when $x$ strictly PCE-dominates $y$.
4. Conversely, if $x^*$ uniquely minimizes $V_w$ over a compact admissible branch $\mathcal F\subset\mathcal X_{adm}$ for some $w\in K^*$, then $w$ is a dual certificate for that branch selection.

*Proof.* By Definition D.1b, $x\preceq_{\mathrm{PCE}}y$ means $r(y)-r(x)\in K$. For any $w\in K^*$,
$$
V_w(y)-V_w(x)
=
w\cdot(r(y)-r(x))
\ge0,
$$
which proves (1). If $r(y)-r(x)$ has at least one strictly positive component and $w\in\mathrm{int}\,K^*$, then every component of $w$ is strictly positive, so the dot product is strictly positive; this proves (2). Statement (3) is the contrapositive of (2) applied to branch selection by a strictly positive PCE scalarization. For (4), the assumed unique minimizing property of $x^*$ gives
$$
V_w(x^*)<V_w(y)
$$
for every $y\in\mathcal F\setminus\{x^*\}$, so $w$ separates the selected point from every rejected branch point in the scalar certificate order. ∎

<a id="theorem-d1d-pce-dominance-and-no-surplus-branch-elimination"></a>**Theorem D.1d (PCE Dominance and No-Surplus Branch Elimination).** Work on a separating, protocol-complete PPI branch in the sense of Definitions P.6.1b.1–P.6.1b.2, with selection by a strictly positive dual certificate $w\in\mathrm{int}\,K^*$. Let $x,y\in\mathcal X_{adm}$ be PPI-admissible configurations with naturally isomorphic finite protocol-response presheaves,
$$
\mathcal R_x\simeq\mathcal R_y.
$$
If $x\preceq_{\mathrm{PCE}}y$ and $r(y)-r(x)$ has at least one strictly positive component, then $y$ is not a primitive physical branch at the PCE-Attractor. It is either the same physical branch as $x$ in the PPI quotient or is strictly PCE-dominated by $x$.

*Proof.* Since $\mathcal R_x\simeq\mathcal R_y$, Theorem P.6.1b.3 identifies $x$ and $y$ as representing the same physical invariant in the operational quotient unless an additional retained label changes a finite protocol response. By hypothesis no finite response differs. Thus any difference between $x$ and $y$ is a response-null implementation difference.

Because $x\preceq_{\mathrm{PCE}}y$ and the domination is strict in at least one component, Theorem D.1c gives
$$
V_w(x)<V_w(y)
$$
for every strictly positive dual certificate $w\in\mathrm{int}\,K^*$. Therefore no PCE-admissible scalarization can select $y$ over $x$. If the response-null distinction is quotiented out, $x$ and $y$ are the same physical branch. If it is retained, it carries strictly higher PCE cost without changing any finite protocol response and is eliminated by PCE dominance. These alternatives exhaust the PPI-admissible cases. ∎

<a id="theorem-d1e-operational-quotient-and-minimal-representative-existence"></a>**Theorem D.1e (Operational Quotient and Minimal Representative Existence).** Let $\mathcal X_{\mathrm{adm}}$ be the PPI-admissible configuration class on a separating, protocol-complete finite-resolution protocol branch $\mathsf P_{\mathrm{PU}}$ in the sense of Definitions P.6.1b.1–P.6.1b.2. Define
$$
x\sim_{\mathcal R}y
\quad\Longleftrightarrow\quad
\mathcal R_x\simeq\mathcal R_y.
$$
Then:

1. $\sim_{\mathcal R}$ is an equivalence relation, and the quotient
$$
\mathcal Q_{\mathrm{phys}}:=\mathcal X_{\mathrm{adm}}/{\sim_{\mathcal R}}
$$
is the PPI physical configuration space on this branch.

2. For any strictly positive dual certificate $w\in\mathrm{int}\,K^*$, the descended scalar potential
$$
\bar V_w([x])
:=
\inf_{y\in[x]}V_w(y)
$$
is well defined whenever the infimum is attained in each response class.

3. If the branch is nonempty and compact after PPI quotienting and $\bar V_w$ is lower semicontinuous, then at least one PCE-minimal physical class exists:
$$
[x_{\mathrm{phys}}]\in
\operatorname*{argmin}_{[x]\in\mathcal Q_{\mathrm{phys}}}\bar V_w([x]).
$$

4. If the strict branch-separation hypotheses of Theorem P.6.1b.7 hold for the same descended scalarization, this PCE-minimal physical class is unique.

*Proof.* Natural isomorphism of finite protocol-response presheaves is reflexive, symmetric, and transitive, so $\sim_{\mathcal R}$ is an equivalence relation. Theorem P.6.1b.3 states that naturally isomorphic response presheaves represent the same physical invariant; therefore quotienting by $\sim_{\mathcal R}$ gives exactly the PPI physical configuration space on the branch.

For (2), if $x'\in[x]$, then $[x']=[x]$ by definition. The quantity $\inf_{y\in[x]}V_w(y)$ therefore depends only on the equivalence class and not on the representative. Attainment gives a minimal representative inside the response class. For the chosen scalarization, if $y,z\in[x]$ satisfy $V_w(y)>V_w(z)$, then $y$ does not attain this infimum. Theorem D.1d supplies the stronger exclusion for every strictly positive scalarization when the lower-cost representative also strictly dominates in the componentwise resource order.

For (3), compactness of $\mathcal Q_{\mathrm{phys}}$ and lower semicontinuity of $\bar V_w$ give existence of a minimizer by the direct method. For (4), apply the scalar branch of Theorem P.6.1b.7 to the same descended cost. If two distinct classes minimized it, the assumed nontrivial operational interpolation and strict convexity would produce an intermediate class of strictly smaller cost, a contradiction. Hence the minimizer is unique under those additional hypotheses. ∎

<a id="definition-d1f-pce-branch-contract"></a>**Definition D.1f (PCE Branch Contract).** A finite-resolution PCE branch contract is a tuple
$$
\mathfrak B=
\bigl(
\mathcal X_{\mathfrak B},
\mathsf P_{\mathfrak B},
\mathcal R_{\mathfrak B},
K_{\mathfrak B},
r_{\mathfrak B},
W_{\mathfrak B}
\bigr)
$$
where:

1. $\mathcal X_{\mathfrak B}$ is the admissible configuration space for the branch;
2. $\mathsf P_{\mathfrak B}$ is the finite protocol family retained at that resolution;
3. $\mathcal R_{\mathfrak B}(x)$ is the finite protocol-response presheaf induced by $x\in\mathcal X_{\mathfrak B}$ on $\mathsf P_{\mathfrak B}$;
4. $K_{\mathfrak B}$ is a closed pointed convex resource cone whose dual cone has nonempty interior;
5. $r_{\mathfrak B}:\mathcal X_{\mathfrak B}\to K_{\mathfrak B}$ is the branch resource vector;
6. $W_{\mathfrak B}\subseteq K_{\mathfrak B}^*$ is the admissible set of dual PCE certificates.

For $w\in W_{\mathfrak B}$, the branch scalarization is
$$
V_{\mathfrak B,w}(x):=w\cdot r_{\mathfrak B}(x).
$$
The branch quotient is defined by
$$
x\sim_{\mathfrak B}y
\quad\Longleftrightarrow\quad
\mathcal R_{\mathfrak B}(x)\simeq\mathcal R_{\mathfrak B}(y).
$$

<a id="theorem-d1g-branch-indexed-pce-variational-grammar"></a>**Theorem D.1g (Branch-Indexed PCE Variational Grammar).** On separating, protocol-complete PPI branches in the sense of Definitions P.6.1b.1–P.6.1b.2, the PCE applications share the variational grammar:
$$
\text{choose } \mathfrak B,\quad
\text{quotient by } \sim_{\mathfrak B},\quad
\text{minimize } V_{\mathfrak B,w}=w\cdot r_{\mathfrak B}
\text{ over the quotient.}
$$
This is a common resource-order grammar, not a claim that every branch has the same numerical Lagrangian, the same state space, or the same physical units.

More explicitly, for every finite-resolution branch contract $\mathfrak B$ and every $w\in W_{\mathfrak B}$:

1. if $r_{\mathfrak B}(y)-r_{\mathfrak B}(x)\in K_{\mathfrak B}$, then
$$
V_{\mathfrak B,w}(x)\le V_{\mathfrak B,w}(y);
$$

2. if $w\in\mathrm{int}\,K_{\mathfrak B}^*$ and $r_{\mathfrak B}(y)-r_{\mathfrak B}(x)\in K_{\mathfrak B}\setminus\{0\}$, then
$$
V_{\mathfrak B,w}(x)<V_{\mathfrak B,w}(y);
$$

3. if $w\in\mathrm{int}\,K_{\mathfrak B}^*$, $\mathcal R_{\mathfrak B}(x)\simeq\mathcal R_{\mathfrak B}(y)$, and one representative is strictly more costly in the resource order, the higher-cost representative is response-null surplus and is removed by that scalarization;

4. if the quotient $\mathcal X_{\mathfrak B}/\sim_{\mathfrak B}$ is nonempty and compact and the descended scalarization is lower semicontinuous, a PCE-minimal response class exists.

*Proof.* Items (1) and (2) are the dual-cone argument of Theorem D.1c applied with $K_{\mathfrak B}$ and $r_{\mathfrak B}$ in place of $K$ and $r$. If $r_{\mathfrak B}(y)-r_{\mathfrak B}(x)\in K_{\mathfrak B}$, then for $w\in K_{\mathfrak B}^*$,
$$
V_{\mathfrak B,w}(y)-V_{\mathfrak B,w}(x)
=
w\cdot\bigl(r_{\mathfrak B}(y)-r_{\mathfrak B}(x)\bigr)
\ge0.
$$
If $w\in\mathrm{int}\,K_{\mathfrak B}^*$ and the resource difference is a nonzero element of $K_{\mathfrak B}$, the standard dual-cone separation property gives a strict positive pairing, so the inequality is strict.

Item (3) is Theorem D.1d applied inside the branch contract: naturally isomorphic response presheaves define the same PPI physical invariant on $\mathsf P_{\mathfrak B}$, and strict resource dominance eliminates the more costly representative as surplus.

Item (4) is Theorem D.1e applied to the quotient of $\mathcal X_{\mathfrak B}$ by $\sim_{\mathfrak B}$. Compactness and lower semicontinuity give existence of a minimizer by the direct method. ∎

<a id="theorem-d1h-populated-four-state-physical-pce-branch"></a>**Theorem D.1h (Populated Four-State Physical PCE Branch).** Let
$$
\mathcal H=\mathbb C^2_{\mathrm{out}}\otimes\mathbb C^2_{\mathrm{impl}},
\qquad
\mathcal X_{\mathfrak B}=\{x_{bj}=|b,j\rangle\langle b,j|:b,j\in\{0,1\}\}.
$$
Retain the read protocol with POVM
$$
E_b=|b\rangle\langle b|\otimes I,
$$
and response instrument
$$
\mathcal M(\rho)=\sum_{b=0}^1\operatorname{Tr}(E_b\rho)|b\rangle\langle b|_Y.
\tag{D.1h.1}
$$
Then $x_{b0}\sim_{\mathfrak B}x_{b1}$ and no configuration with output $0$ is equivalent to one with output $1$, so the response quotient is exactly
$$
\mathcal Q_{\mathfrak B}=\{q_0,q_1\}.
\tag{D.1h.2}
$$

Let $K_{\mathfrak B}=\mathbb R_{\ge0}^3$, give every resource coordinate power units, and define the diagonal power observables so that
$$
r(x_{00})=(1,1,1)\,\mathrm W,
\quad r(x_{01})=(2,2,2)\,\mathrm W,
\quad r(x_{10})=(2,2,1)\,\mathrm W,
\quad r(x_{11})=(3,3,2)\,\mathrm W.
\tag{D.1h.3}
$$
For $w=(1,1,1)\in\operatorname{int}K_{\mathfrak B}^*$, minimization within each response class gives
$$
\bar V_w(q_0)=3\,\mathrm W,
\qquad
\bar V_w(q_1)=5\,\mathrm W.
\tag{D.1h.4}
$$
Thus $q_0$ is the unique selected physical response class with strict gap $2\,\mathrm W$.

Finally, the CPTP adaptation channel
$$
\mathcal E(\rho)=\operatorname{Tr}(\rho)x_{00}
\tag{D.1h.5}
$$
maps every member of $\mathcal X_{\mathfrak B}$ to $x_{00}$, has $x_{00}$ as its unique stationary state, and obeys $\mathcal E^n=\mathcal E$ for every $n\ge1$. Hence the selected quotient class is realized by an explicit finite physical response instrument and strict adaptation channel on the declared state space.

*Proof.* Equation (D.1h.1) returns the deterministic law $\delta_b$ on $x_{bj}$, proving the two-class quotient. The resource preorder is the coordinate order of the closed pointed cone $\mathbb R_{\ge0}^3$; the listed diagonal observables are positive and have the stated power expectations. Inside $q_0$, $x_{00}$ strictly dominates $x_{01}$, while inside $q_1$, $x_{10}$ strictly dominates $x_{11}$. Summing coordinates gives (D.1h.4), its strict gap, and unique selection. The quotient is finite and therefore compact Hausdorff, and every function on it is lower semicontinuous.

Equation (D.1h.5) is the replacement channel, hence is CPTP. It sends each declared basis-state configuration to $x_{00}$ and is idempotent. A fixed point obeys $\rho=\mathcal E(\rho)=x_{00}$. This proves strict physical realization and one-step convergence on the declared configuration space. ∎

Thermodynamic heat for implementing the replacement channel requires its own bath and reset ledger; it is not inferred from complete positivity or from the power-coordinate table.

## D.3 Dynamic Complexity Alignment Mechanism ($C_P \leftrightarrow \langle \hat{C}_v \rangle$)

This section provides the rigorous justification for Theorem 2. We separate two statements: exact alignment as a necessary condition for true stable PCE equilibria, and quantitative operational tracking of that condition under the stochastic gradient dynamics.

<a id="lemma-d1-alignment-from-faithful-force-identifiability"></a>**Lemma D.1 (Alignment from Faithful Force Identifiability).**
Write $q_v(x):=\langle\hat C_v\rangle_x$. Let $F_v^{\mathrm{op}}(x)$ and $F_v^{\mathrm{phys}}(x)$ be, respectively, the operational and physical adaptation forces in the $q_v$ coordinate. Assume that the branch has the per-MPU force-identifiability property
$$
F_v^{\mathrm{phys}}(x)-F_v^{\mathrm{op}}(x)=0
\quad\Longleftrightarrow\quad
q_v(x)=C_P(v)
$$
for every $v$, with no cancellation between distinct MPU coordinates. If $x^*$ is a joint stable equilibrium of the two ledgers,
$$
F_v^{\mathrm{op}}(x^*)=F_v^{\mathrm{phys}}(x^*)=0
\qquad\text{for every }v,
$$
then
$$
C_P(v)=\langle\hat C_v\rangle_{x^*}
\qquad\text{for every }v.
$$
Without per-MPU force identifiability, stationarity yields only the aggregate relations encoded by the kernel of the force-mismatch map.

*Proof.* At a joint equilibrium,
$$
F_v^{\mathrm{phys}}(x^*)-F_v^{\mathrm{op}}(x^*)=0-0=0.
$$
The forward implication in the force-identifiability hypothesis gives $q_v(x^*)=C_P(v)$ for each $v$. Since $q_v(x^*)=\langle\hat C_v\rangle_{x^*}$ by definition, the asserted alignment follows. If the mismatch map has a nontrivial kernel across MPU coordinates, its vanishing determines only the corresponding aggregate quotient, so componentwise alignment does not follow. ∎

*(Note on notation: In this Lemma, we used $\nabla_{op}$ and $\nabla_{\mathrm{true}}$ to explicitly distinguish the operational system's calculation from the underlying physical optimum. In all subsequent sections of this appendix, we revert to the shorthand $\nabla V$ to denote the gradient of the operational potential $V(x)$ that drives the system dynamics according to Equation D.8.)*

<a id="corollary-d1-alignment-condition-at-joint-stable-equilibria-on-the-faithful-force-identifiability-branch"></a>**Corollary D.1 (Alignment Condition at Joint Stable Equilibria on the Faithful-Force-Identifiability Branch).**
On the per-MPU force-identifiability branch of Lemma D.1, any configuration $x^*$ that is a joint stable equilibrium of the operational and physical adaptation dynamics, with $F_v^{\mathrm{op}}(x^*)=F_v^{\mathrm{phys}}(x^*)=0$ for every constituent MPU $v$, satisfies $C_P(v)=\langle\hat C_v\rangle_{x^*}$ for every $v$.

<a id="theorem-d1-quadratic-representation-of-linear-alignment-feedback"></a>**Theorem D.1 (Quadratic Representation of Linear Alignment Feedback).**
Let $q_v:=\langle\hat C_v\rangle_x$ and suppose the operational adaptation force contains the linear feedback
$$
F_v^{\mathrm{align}}(x)=k_1\bigl(C_P(v)-q_v\bigr),
\qquad k_1>0,
$$
with the targets $C_P(v)$ independent of the proxy coordinates on the adaptation window. Then this feedback is the negative proxy-coordinate gradient of
$$
V_{\mathrm{proxy}}(x)
=
\frac{k_1}{2}
\sum_v\bigl(C_P(v)-\langle\hat C_v\rangle_x\bigr)^2.
\quad \text{(D.1a)}
$$
For each specified value of the other coordinates, let the proxy-coordinate domain be open. On each connected component of that domain, this representation is unique up to an additive constant. The constant may depend on the other coordinates and on the selected component.

*Proof.* For each $v$,
$$
\frac{\partial V_{\mathrm{proxy}}}{\partial q_v}
=
k_1(q_v-C_P(v)).
$$
Therefore
$$
-\frac{\partial V_{\mathrm{proxy}}}{\partial q_v}
=
k_1(C_P(v)-q_v)
=F_v^{\mathrm{align}}.
$$
If another differentiable potential $U$ has the same negative gradient in every proxy coordinate, then $\partial_{q_v}(U-V_{\mathrm{proxy}})=0$ for every $v$. Any two points of a connected open proxy-coordinate component can be joined by a polygonal path in that component. The derivative of $U-V_{\mathrm{proxy}}$ along every segment is zero, so its endpoint values agree. This proves constancy on that component; the gradient equations do not compare distinct components. ∎

### D.3.1 Physical Realization via Observable Work-Cost Gap Feedback

The system does not need direct access to the uncomputable $C_P(v)$ to achieve alignment. Instead, alignment is enforced dynamically via an observable physical feedback signal: the discrepancy between actual work dissipated and the work expected based on the operational proxy.

<a id="definition-d2-observable-work-cost-gap-delta-w_v"></a>**Definition D.2 (Observable Work-Cost Gap $\Delta W_v$).**
The Observable Work-Cost Gap $\Delta W_v$ for MPU $v$ over a sufficiently long averaging time interval $\tau$ is the difference between the actual physical work dissipated $W_{physical, v}(\tau)$ (empirically accessible, e.g., via heat flow measurements or thermodynamic cycle analysis) and the work expected based on the operational proxy cost function $R(\langle \hat{C}_v \rangle)$:
$$
\Delta W_v(\tau) = W_{physical, v}(\tau) - \int_t^{t+\tau} R(\langle \hat{C}_v(t') \rangle) dt'
\quad \text{(D.2)}
$$

<a id="lemma-d2-signed-work-cost-gap-decomposition"></a>**Lemma D.2 (Signed Work-Cost Gap Decomposition).**
Assume the efficiency-saturated regime where the instantaneous physical dissipation rate equals the minimal operational cost evaluated at the true complexity:
$$
\frac{dW_{physical, v}}{dt}(t)=R(C_P(v,t)).
$$
Define the instantaneous misalignment $\delta_v(t):=C_P(v,t)-\langle \hat{C}_v(t)\rangle$. If $R$ is twice continuously differentiable on the viable complexity range, then for any averaging window length $\tau>0$,
$$
\frac{\Delta W_v(\tau)}{\tau}
= \frac{1}{\tau}\int_t^{t+\tau} R'(\langle \hat{C}_v(t')\rangle)\,\delta_v(t')\,dt'
+ \frac{1}{2\tau}\int_t^{t+\tau} R''(\xi_v(t'))\,\delta_v(t')^2\,dt'
\quad \text{(D.3)}
$$
where for each $t'\in[t,t+\tau]$ the intermediate value $\xi_v(t')$ lies between $\langle \hat{C}_v(t')\rangle$ and $C_P(v,t')$.

In particular, if $|R''(C)|\le L_R$ on the viable complexity range, then the remainder term is bounded by
$$
\left|\frac{1}{2\tau}\int_t^{t+\tau} R''(\xi_v(t'))\,\delta_v(t')^2\,dt'\right|
\le \frac{L_R}{2\tau}\int_t^{t+\tau}\delta_v(t')^2\,dt'.
$$

*Proof.* By Taylor's theorem with remainder, for each $t'$ there exists $\xi_v(t')$ between $\langle \hat{C}_v(t')\rangle$ and $C_P(v,t')$ such that
$$
R(C_P(v,t')) = R(\langle \hat{C}_v(t')\rangle) + R'(\langle \hat{C}_v(t')\rangle)\delta_v(t') + \frac{1}{2}R''(\xi_v(t'))\delta_v(t')^2.
$$
Subtract $R(\langle \hat{C}_v(t')\rangle)$, integrate from $t$ to $t+\tau$, divide by $\tau$, and use Definition D.2. The stated bound follows immediately from $|R''|\le L_R$. QED

**Scope of the work-cost signal:** Definition 3a gives $dW_{physical,v}/dt\ge R(C_P(v,t))$, with equality only on the efficiency-saturated branch used in Lemma D.2. That lemma supplies a signed time-averaged Taylor decomposition, not an injective estimator of misalignment: $R'$ may vanish on the operating interval, and signed contributions may cancel within the averaging window. Proposition D.1 proves its mean-square contraction estimate on its separately stated Euclidean Itô branch with affine proxy coordinates, a quadratic proxy potential and an invariant proxy subspace. Implementing that drift from $\Delta W_v$ requires a gain/sign/noncancellation certificate on the same operating domain. The stopped certificate of Theorem D.2a controls the drift before exit; applying the global tracking bound requires the global hypotheses of Proposition D.1. A measured feedback certificate must specify its law and interval and verify a coercive drift inequality for the misalignment drift $F_v^{\mathrm{meas}}$, for example
$$
\sum_v \delta_v F_v^{\mathrm{meas}}
\le -\gamma\sum_v\delta_v^2+B,
\qquad \gamma>0,
$$
with declared bias bound $B$; positive lower gain and windowwise sign control are sufficient routes. No such inequality follows from Equation (D.3) alone.

**Noise-model boundary:** An additive observation model $\Delta W_v^{\mathrm{obs}}=\Delta W_v+\xi_W$ does not by itself identify $\xi_W$ with the diffusion in Equation (D.8). That identification requires a registered feedback implementation proving the martingale property, quadratic-variation bound, and treatment of any bias as part of the forcing in Proposition D.1. Once those entries and that proposition's remaining hypotheses hold, Corollary D.2 gives an upper bound on expected mean-square misalignment.

<a id="theorem-d2a-randomized-work-gap-feedback-certificate"></a>**Theorem D.2a (Randomized Work-Gap Feedback Certificate).** Consider one MPU with target complexity $c$ constant on the window and an open operating interval $I$ containing $c$. Assume $q_0$ is $\mathcal F_0$-measurable, $q_0\in I$ almost surely, and $\mathbb E[q_0^2]<\infty$. On $I$, the efficiency-saturated cost law is affine:
$$
R(u)=R_0+g u,\qquad g>0.
\tag{D.3a.1}
$$
Let $B_t$ be a standard Brownian motion for the registered filtration, and let $b_t,\sigma_t$ be progressively measurable with $|b_t|\le b_*$ and $|\sigma_t|\le\sigma_*$. Until the first exit time $\tau$ of $q_t$ from $I$, use
$$
dY_t=g(c-q_t)\,dt+b_t\,dt+\sigma_t\,dB_t,
\qquad dq_t=\kappa\,dY_t,\qquad\kappa>0.
\tag{D.3a.2}
$$
After $\tau$, hold both $Y$ and $q$ at their values at $\tau$. Embed the wire in a carrier $x=(q,z)$ by updating only $q$, with mobility and diffusion blocks diagonal between $q$ and $z$. For the stopped misalignment $\delta_t=c-q_t$ and $\mathcal M_t=\delta_t^2/2$, the certificate has:

1. positive gain $\kappa g$ before exit and the semimartingale drift
$$
\mathbb E[d\delta_t\mid\mathcal F_t]
=\mathbf 1_{\{t<\tau\}}(-\kappa g\delta_t-\kappa b_t)\,dt;
\tag{D.3a.3}
$$
2. the corresponding coercive drift bound
$$
\delta_t\,\mathbb E[d\delta_t/dt\mid\mathcal F_t]
\le\mathbf 1_{\{t<\tau\}}
\left(-\frac{\kappa g}{2}\delta_t^2+\frac{\kappa b_*^2}{2g}\right);
\tag{D.3a.4}
$$
3. the martingale noise and its quadratic variation
$$
N_t=-\kappa\int_0^{t\wedge\tau}\sigma_s\,dB_s,
\qquad
\langle N\rangle_t
=\kappa^2\int_0^{t\wedge\tau}\sigma_s^2\,ds
\le\kappa^2\sigma_*^2(t\wedge\tau);
\tag{D.3a.5}
$$
4. an invariant proxy-coordinate subspace, because the wire's drift and noise have no $z$ component.

*Proof.* Before exit, $c,q_t\in I$, so efficiency saturation gives $R(c)-R(q_t)=g(c-q_t)$. Subtracting $dq_t$ from $dc=0$ and stopping the integrals gives (D.3a.3). The inequality $|\delta b|\le g\delta^2/2+b_*^2/(2g)$ gives (D.3a.4). Bounded progressive volatility makes the stopped Brownian integral a square-integrable martingale on every finite window, with the quadratic variation in (D.3a.5). The declared blocks prove invariance. The drift bound contains the exit indicator and supplies no global contraction of the proxy held after exit. ∎

### D.3.2 Mean-Square Alignment Convergence

<a id="definition-d3-mean-square-misalignment-mathcalm"></a>**Definition D.3 (Mean-Square Misalignment $\mathcal{M}$).**
The total mean-square misalignment over the network in configuration $x$ is defined as:
$$
\mathcal M(x) = \frac{1}{2} \sum_{v} \bigl(C_P(v) - \langle \hat{C}_v \rangle_{x} \bigr)^2 = k_1^{-1} V_{\mathrm{proxy}}(x)
\quad \text{(D.4)}
$$

<a id="proposition-d1-stochastic-contraction-of-misalignment"></a>**Proposition D.1 (Stochastic Contraction of Misalignment).**
Consider a Euclidean carrier $x=(q,z)\in\mathbb R^{N+m}$, with affine proxy coordinates $q\in\mathbb R^N$, constant target vector $c$, and
$$
\mathcal M(x)=\frac12\|q-c\|^2,\qquad
V(x)=V_{\mathrm{core}}(x)+V_{\mathrm{proxy}}(x),\qquad
V_{\mathrm{proxy}}=k_1\mathcal M,\quad k_1>0.
$$
Assume $V_{\mathrm{core}}\in C^2$ and the global Itô equation
$$
dx_t=b(x_t)\,dt+\sigma(x_t)\,dW_t,\qquad
b=-\eta\nabla V,\qquad D=\frac12\sigma\sigma^T.
$$
Here $W$ is a standard Brownian motion for the registered filtration and $x_0$ is $\mathcal F_0$-measurable. Require $b$ and $\sigma$ to be globally Lipschitz, $\mathbb E\|x_0\|^2<\infty$, and $\eta$ symmetric with
$$
0<\eta_{\min}I\le\eta(x)\le\eta_{\max}I.
$$
The mobility must preserve the proxy-coordinate subspace at every $x$. Let $\nabla_C$ and $D_{CC}$ denote the proxy gradient and diffusion block, and require
$$
B_{\mathrm{core}}:=\sup_{x\in\mathbb R^{N+m}}\|\nabla_CV_{\mathrm{core}}(x)\|<\infty,
\qquad
D_*:=\sup_{x\in\mathbb R^{N+m}}\operatorname{Tr}D_{CC}(x)<\infty.
$$
Then $y(t):=\mathbb E[\mathcal M(x_t)]$ is locally absolutely continuous and, for almost every $t\ge0$,
$$
y'(t)\le-k_1\eta_{\min}y(t)+C_{\mathcal M},
\quad\text{(D.5)}
$$
where
$$
C_{\mathcal M}
:=\frac{\eta_{\max}^2 B_{\mathrm{core}}^2}{2k_1\eta_{\min}}+D_*.
$$

*Proof.* The global Lipschitz hypotheses give a nonexplosive Itô solution with finite second moments on finite windows. The affine proxy coordinates give
$$
\nabla_CV_{\mathrm{proxy}}=k_1(q-c),\qquad
\|\nabla_CV_{\mathrm{proxy}}\|^2=2k_1^2\mathcal M,\qquad
\nabla_C^2V_{\mathrm{proxy}}=k_1I.
$$
Symmetry and invariance of the proxy subspace make $\eta$ block diagonal relative to that subspace and its orthogonal complement. Writing $\delta=q-c$, Itô's formula therefore gives
$$
\mathcal L\mathcal M
=-k_1\delta^T\eta_{CC}\delta
-\delta^T\eta_{CC}\nabla_CV_{\mathrm{core}}
+\operatorname{Tr}D_{CC}.
$$
The mobility bounds and Young's inequality imply
$$
-\delta^T\eta_{CC}\nabla_CV_{\mathrm{core}}
\le\eta_{\max}B_{\mathrm{core}}\|\delta\|
\le\frac{k_1\eta_{\min}}2\|\delta\|^2
+\frac{\eta_{\max}^2B_{\mathrm{core}}^2}{2k_1\eta_{\min}}.
$$
Consequently $\mathcal L\mathcal M\le-k_1\eta_{\min}\mathcal M+C_{\mathcal M}$. Its drift is integrable on finite windows. The martingale integrand has square norm at most $2D_*\|\delta\|^2$, so the stochastic integral has zero expectation. Taking expectations in the integrated Itô formula proves local absolute continuity and (D.5) almost everywhere. This proposition uses its stated Euclidean hypotheses; the intrinsic compact-manifold assumptions (A1)--(A6) do not supply affine proxy coordinates or this Hessian identity. ∎

<a id="corollary-d2-mean-square-alignment-upper-bound"></a>**Corollary D.2 (Mean-Square Alignment Upper Bound).**
Under all hypotheses of Proposition D.1 on its global Euclidean Itô branch, Gronwall's inequality applied to the almost-everywhere inequality (D.5) gives:
$$
\mathbb E[\mathcal M(x(t))] \le e^{-k_1\eta_{\min}t}\mathbb E[\mathcal M(x(0))] + \frac{C_{\mathcal M}}{k_1\eta_{\min}}\bigl(1-e^{-k_1\eta_{\min}t}\bigr),
$$
and therefore the long-time expectation of the mean-square misalignment satisfies the asymptotic upper bound:
$$
\limsup_{t\to\infty} \mathbb E[\mathcal M(x(t))] \le \frac{C_{\mathcal M}}{k_1\eta_{\min}}
\quad \text{(D.6)}
$$
The right-hand side of (D.6) contains both the core-gradient forcing and the proxy diffusion contribution in $C_{\mathcal M}$. It need not be attained or strictly positive. A small value certifies small expected mean-square misalignment after the transient. Time-average convergence requires a separate ergodic theorem for this same Euclidean process and integrability of $\mathcal M$ under its invariant law; the compact-manifold theorem D.5 does not supply those premises. Corollary D.1 supplies the exact equilibrium condition, and Corollary D.2 supplies this conditional upper tracking bound.

*Proof.* Put
$$
y(t):=\mathbb E[\mathcal M(x(t))],
\qquad
a:=k_1\eta_{\min}>0,
\qquad
C:=C_{\mathcal M}\ge0.
$$
Equation (D.5) is $y'(t)\le-ay(t)+C$. Multiplying by $e^{at}$ gives
$$
\frac d{dt}\bigl(e^{at}y(t)\bigr)
=e^{at}(y'(t)+ay(t))
\le Ce^{at}.
$$
Integration from $0$ to $t$ yields
$$
e^{at}y(t)-y(0)
\le C\int_0^te^{as}\,ds
=\frac Ca(e^{at}-1).
$$
After multiplication by $e^{-at}$,
$$
y(t)
\le e^{-at}y(0)+\frac Ca(1-e^{-at}),
$$
which is the asserted bound. Since $e^{-at}\to0$,
$$
\limsup_{t\to\infty}y(t)\le\frac Ca
=\frac{C_{\mathcal M}}{k_1\eta_{\min}},
$$
proving (D.6). ∎

<a id="remark-d1-reparameterization-scope-of-the-operational-complexity-proxy"></a>**Remark D.1: Reparameterization Scope of the Operational Complexity Proxy.**
The operational proxy $\hat C_v$ is identified with quantum circuit complexity by Definition B.1. The alignment results do not make that coordinate unique. Let $f$ be a strictly monotone bijection on the viable complexity interval, set $C'=f(C)$, and transform the cost law by
$$
R_f(C'):=R(f^{-1}(C')).
$$
Then $R_f(f(C))=R(C)$, so the physical cost, work-cost gap, and PCE ordering are unchanged after the corresponding coordinate transformation. A non-affine $f$ is penalized only if one applies the untransformed law $R$ to $f(C)$, which describes a different cost model. Thus Theorem 2 and Section D.3 identify a cost-relevant proxy up to response- and cost-preserving reparameterization. Selection of quantum circuit complexity among that equivalence class is the modeling choice of Definition B.1 unless an additional calibration or comparison theorem fixes the coordinate.

## D.4 Dynamical Emergence of Geometric Regularity

This section provides the conditional dynamical justification for Theorem 43: minimizing $V(x)$ selects geometrically regular configurations only under the monotonicity and regular equal-proxy comparator hypotheses stated in Theorem D.3.

<a id="lemma-d3-quantitative-cost-of-irregularity-from-a-verifiable-comparison-certificate"></a>**Lemma D.3 (Quantitative Cost of Irregularity from a Verifiable Comparison Certificate).**
Fix a finite registered family $\mathcal I$ of irregular configurations. An irregularity comparison certificate is a record
$$
\mathfrak C_{\mathrm{irr}}
=
\bigl\{(x,x^{\mathrm{reg}},L,\gamma,a,b,c_1,c_2,c_3,
I_{\mathrm{prop}},I_{\mathrm{op}},I_{\mathrm{benefit}},I_{\mathrm{rem}})\bigr\}_{x\in\mathcal I}
$$
with $\gamma>1$, $a,b>0$, $c_1,c_2,c_3\ge0$, and outward-rounded intervals for the four component differences. It is accepted only when direct evaluation of Definition D.1 verifies, for every record,
$$
x^{\mathrm{reg}}\text{ is admissible and regular},
\qquad
V_{\mathrm{proxy}}(x^{\mathrm{reg}})=V_{\mathrm{proxy}}(x),
$$
$$
I_{\mathrm{prop}}\subseteq[aL^\gamma-c_1,\infty),
\quad
I_{\mathrm{op}}\subseteq[bL-c_2,\infty),
\quad
I_{\mathrm{benefit}}\subseteq(-\infty,c_3],
\quad
I_{\mathrm{rem}}\subseteq[0,\infty),
\tag{D.7a}
$$
where the intervals enclose respectively the propagation, operational, benefit, and remaining-core-penalty differences between $x$ and $x^{\mathrm{reg}}$. Then every certified pair obeys
$$
V_{\mathrm{core}}(x)-V_{\mathrm{core}}(x^{\mathrm{reg}})
\ge aL^\gamma+bL-c,
\qquad c:=c_1+c_2+c_3.
\tag{D.7}
$$

For an infinite family, the same conclusion holds only when the certificate is replaced by a terminating verifier together with a checked proof that (D.7a) holds for every encoded family member.

*Proof.* Definition D.1 writes the core-potential difference as the propagation and operational differences plus the remaining penalty difference minus the benefit difference. The four verified interval inclusions give
$$
V_{\mathrm{core}}(x)-V_{\mathrm{core}}(x^{\mathrm{reg}})
\ge(aL^\gamma-c_1)+(bL-c_2)+0-c_3,
$$
which is (D.7). Every premise is a direct evaluation or a finite interval-containment test, rather than an inference from monotonicity alone. ∎

<a id="theorem-d2-global-geometric-comparison-in-vx"></a>**Theorem D.2 (Global Geometric Comparison in $V(x)$).**
Under the hypotheses of Lemma D.3, if an irregular configuration $x_{\mathrm{irreg}}$ and its comparison configuration $x_{\mathrm{reg}}$ have the same proxy-complexity coordinates and satisfy
$$
aL^\gamma+bL-c>0,
$$
then
$$
V(x_{\mathrm{irreg}})>V(x_{\mathrm{reg}}).
$$
This is a global comparison statement. A claim about the direction of $-\nabla V$ requires the additional local-regularization hypothesis used in Theorem D.4(iii).

*Proof.* Lemma D.3 gives
$$
V_{\mathrm{core}}(x_{\mathrm{irreg}})-V_{\mathrm{core}}(x_{\mathrm{reg}})
\ge aL^\gamma+bL-c>0.
$$
Equality of the proxy coordinates gives
$$
V_{\mathrm{proxy}}(x_{\mathrm{irreg}})=V_{\mathrm{proxy}}(x_{\mathrm{reg}}).
$$
Adding the two relations proves the strict inequality for $V$. No local gradient conclusion follows from this argument. ∎

<a id="lemma-d4-regular-configurations-as-global-minima-candidate-set-for-v_core"></a>**Lemma D.4 (Regular Configurations as Global Minima Candidate Set for $V_{\mathrm{core}}$).**
Assume that every geometrically irregular $x\in\mathcal X_{adm}$ has a geometrically regular comparator $x_{\mathrm{reg}}\in\mathcal X_{\mathrm{reg}}$ with the same proxy-complexity coordinates and
$$
V_{\mathrm{core}}(x_{\mathrm{reg}})<V_{\mathrm{core}}(x).
$$
Then every global minimizer of $V_{\mathrm{core}}$, if one exists, belongs to $\mathcal X_{\mathrm{reg}}$.

*Proof.* Let $x_*$ be a global minimizer of $V_{\mathrm{core}}$. If $x_*$ were irregular, the hypothesis would provide $x_{\mathrm{reg}}\in\mathcal X_{\mathrm{reg}}$ satisfying
$$
V_{\mathrm{core}}(x_{\mathrm{reg}})<V_{\mathrm{core}}(x_*),
$$
contradicting the defining inequality $V_{\mathrm{core}}(x_*)\le V_{\mathrm{core}}(x)$ for every $x\in\mathcal X_{adm}$. Hence $x_*\in\mathcal X_{\mathrm{reg}}$. ∎

<a id="theorem-d3-regularity-of-global-minima-under-strict-comparison"></a>**Theorem D.3 (Regularity of Global Minima under Strict Comparison).**
Assume that every geometrically irregular admissible configuration $x$ has a geometrically regular admissible comparator $\widetilde x$ with the same proxy-complexity coordinates and
$$
V_{\mathrm{core}}(\widetilde x)<V_{\mathrm{core}}(x).
$$
Then every global minimizer $x^*$ of $V=V_{\mathrm{core}}+V_{\mathrm{proxy}}$ is geometrically regular. If, in addition, $x^*$ is interior in the proxy-complexity coordinates, then
$$
\nabla_CV_{\mathrm{core}}(x^*)
+k_1\bigl(\langle\hat C\rangle_{x^*}-C_P\bigr)=0
$$
and
$$
\bigl\|\langle\hat C\rangle_{x^*}-C_P\bigr\|
\le
k_1^{-1}\bigl\|\nabla_CV_{\mathrm{core}}(x^*)\bigr\|.
$$

*Proof.* If a global minimizer $x^*$ were irregular, the strict-comparison hypothesis would supply $\widetilde x$ with equal proxy coordinates. Hence
$$
V_{\mathrm{proxy}}(\widetilde x)=V_{\mathrm{proxy}}(x^*)
$$
and
$$
V(\widetilde x)-V(x^*)
=
V_{\mathrm{core}}(\widetilde x)-V_{\mathrm{core}}(x^*)<0,
$$
contradicting global minimality. Thus $x^*$ is regular.

At an interior minimizer, the proxy-coordinate first-order condition is $\nabla_CV(x^*)=0$. Since
$$
\nabla_CV_{\mathrm{proxy}}
=k_1(\langle\hat C\rangle-C_P),
$$
the balance equation follows. Taking norms and dividing by $k_1>0$ gives the bound. ∎

## D.5 System Dynamics as Stochastic Gradient Flow on $V(x)$

The effective slow adaptation dynamics governing the evolution of the MPU network configuration $x(t)$ (which includes network structure variables like effective link weights $w_{uv}$, geometric parameters, and local complexities $\langle \hat{C}_v \rangle$) are modeled as a stochastic gradient flow seeking to minimize the PCE potential $V(x)$ in the presence of fluctuations:
$$
dx(t) = -\eta(x(t)) \nabla_xV(x(t)) dt + \sqrt{2D(x(t))} dW(t)
\quad \text{(D.8, repeated from D.0)}
$$
where:
*   $x(t)$ is the state vector in the high-dimensional configuration space $\mathcal{X}_{adm}$.
*   $\eta(x)$ is a symmetric, positive-definite matrix representing state-dependent adaptation rates or mobility. It encapsulates the responsiveness of different configuration parameters to the optimization drive.
*   $V(x)$ is the PCE Potential (Equation D.1), incorporating the core cost/benefit terms and the implicit penalties $V_{\mathrm{proxy}}$ and $V_{\mathrm{geom}}$.
*   $\nabla_xV(x)$ is the gradient of the potential $V$ with respect to the configuration variables $x$.
*   $D(x)$ is a positive semi-definite diffusion matrix representing stochastic fluctuations. These arise from the underlying discrete, probabilistic ND-RID interactions, thermal noise in the environment, and potentially quantum fluctuations affecting the adaptation process.
*   $dW(t)$ is a standard vector Wiener process, representing uncorrelated white noise sources.

This equation describes the configuration $x(t)$ evolving "downhill" on the potential landscape $V(x)$, driven by the negative gradient, while being perturbed by stochastic noise.

## D.6 Dynamical Convergence Proof

We use stochastic Lyapunov methods to characterize the ergodic stationary regime of the dynamics (Equation D.8) and its low-noise detailed-balance localization near the global-minimum set $\mathcal{E}_{*}^{\text{global}}$. This set is geometrically regular only on the strict-comparison branch of Theorem D.3.

### D.6.1 Assumptions for Convergence

We make standard technical assumptions required for the convergence theorems, justifying them from the physical principles of the PU framework.
*   **(A1) Potential Properties:** $V(x)$ is twice continuously differentiable ($C^2$) on the retained state space $\mathcal K$. *Physical Justification:* The $C^2$ hypothesis supplies the gradient and Hessian used in Lemma D.5. Compactness of the boundaryless state space in (A5), together with continuity, supplies boundedness below, attainment of minima, tightness, and confinement in Theorem D.5; no boundary or large-norm coercivity premise is used on this branch.
*   **(A2) Mobility Bounds:** The mobility matrix $\eta(x)$ is symmetric positive definite, bounded, and Lipschitz on $\mathcal{X}_{adm}$: there exist constants $0<\eta_{\min}\le \eta_{\max}<\infty$ such that for all $x\in\mathcal{X}_{adm}$ and all vectors $v$,
$\eta_{\min}\|v\|^2 \le v^T\eta(x)v \le \eta_{\max}\|v\|^2$, and $\|\eta(x)-\eta(y)\|\le L_\eta\|x-y\|$ for all $x,y$. *Physical scope:* Here bounded, Lipschitz $\eta$ is an analytic hypothesis on the retained stochastic branch. A physical realization may derive such bounds from a registered finite-cycle implementation and near-equilibrium response ledger. Theorem 31 constrains only separately registered resets and therefore does not bound every ND-RID update rate or prove (A4).
*   **(A3) Diffusion regularity and ellipticity:** The noise coefficient $\sigma(x)$ in $dx=b(x)dt+\sigma(x)dW_t$ is globally Lipschitz on the retained state space and satisfies $\sigma(x)\sigma(x)^T=2D(x)$. There are constants $0<d_{\min}\le d_{\max}<\infty$ such that
$$
d_{\min}\|v\|^2\le v^TD(x)v\le d_{\max}\|v\|^2
$$
for every tangent vector $v$.
*   **(A4) Drift regularity:** The drift $b(x)=-\eta(x)\nabla V(x)$ is globally Lipschitz on the retained state space.
*   **(A5) Compact intrinsic state-space branch:** The retained state space $\mathcal K$ is a connected compact Riemannian manifold without boundary. Equation (D.8) denotes the intrinsic diffusion whose generator on $C^2(\mathcal K)$ is
    $$
    \mathcal L f
    =-\langle\eta\,\operatorname{grad}V,\operatorname{grad}f\rangle
    +\operatorname{tr}\!\bigl(D\,\operatorname{Hess}f\bigr),
    $$
    where $\eta$ is a symmetric positive tangent-bundle endomorphism, $D$ is a symmetric positive contravariant diffusion tensor, and the gradient and Hessian are taken with respect to the declared Riemannian metric. Any local-coordinate Itô representation must include the connection correction needed to realize this generator. A branch with boundary requires a separately specified reflecting diffusion and no-flux boundary condition.
*   **(A6) Irreducibility:** For every nonempty open $U\subset\mathcal K$, every $t>0$, and every $x\in\mathcal K$, one has $\mathbb P_x(X_t\in U)>0$.

### D.6.2 Lyapunov Analysis

<a id="lemma-d5-stochastic-drift-bound-for-vx"></a>**Lemma D.5 (Stochastic Drift Bound for $V(x)$).**
Under assumptions (A1)–(A5), Itô's formula for the intrinsic generator of (D.8) yields the following drift identity and bound for $V$. They do not by themselves make $V(X_t)$ a global supermartingale.
$$
\mathcal{L}V(x) = \lim_{\Delta t \to 0} \frac{\mathbb{E}[V(x(t+\Delta t)) - V(x(t)) | x(t)=x]}{\Delta t}
$$
$$
\mathcal{L}V(x) = \nabla V(x)^T (-\eta(x) \nabla V(x)) + \frac{1}{2} \mathrm{tr}\left( ( \sqrt{2D(x)} )^T (\nabla^2 V(x)) (\sqrt{2D(x)}) \right)
$$
$$
\mathcal{L}V(x) = -\nabla V(x)^T \eta(x) \nabla V(x) + \mathrm{tr}(D(x) \nabla^2 V(x))
\quad \text{(D.9)}
$$
Using the bounds on $\eta(x)$ (A2) and $D(x)$ (A3), and noting that the Hessian $\nabla^2 V(x)$ is bounded on the compact set $\mathcal{K}$ (which follows from the $C^2$ clause in assumption (A1) together with the compact confinement clause (A5) of §D.6.1), we get:
$$
\mathcal{L}V(x) \le -\eta_{\min} \|\nabla V(x)\|^2 + \mathrm{tr}(D(x) \nabla^2 V(x))
\le -\eta_{\min} \|\nabla V(x)\|^2 + C_{\mathrm{noise}}
\quad \text{(D.10)}
$$
where
$$
C_{\mathrm{noise}}
:=
\sup_{x\in\mathcal K}
\left|
\operatorname{tr}\!\left(D(x)\operatorname{Hess}V(x)\right)
\right|
<\infty.
$$
Consequently,
$$
\mathcal LV(x)<0
\quad\text{whenever}\quad
\|\operatorname{grad}V(x)\|^2
>
\frac{C_{\mathrm{noise}}}{\eta_{\min}}.
$$
Thus $V(X_{t\wedge\tau})$ is a supermartingale only after localization on a region where the displayed nonpositive drift condition holds, with $\tau$ its exit time. The estimate supplies no global monotonicity, almost-sure point convergence, or convergence to a single minimizer without additional recurrence, invariance, and asymptotic-stability hypotheses.

### <a id="d63-characterization-of-the-critical-set-mathcale_"></a>D.6.3 Characterization of the Critical Set $\mathcal{E}_{*}$

<a id="definition-d4-critical-set-mathcale_"></a>**Definition D.4 (Critical Set $\mathcal{E}_{*}$).**
The critical set $\mathcal{E}_{*}$ consists of all configurations $x^* \in \mathcal{X}_{adm}$ where the deterministic drift term vanishes:
$$
\mathcal{E}_{*} = \{x^* \in \mathcal{X}_{adm} \mid \nabla V(x^*) = 0\}
\quad \text{(D.11)}
$$
This set includes all local minima, maxima, and saddle points of the potential $V(x)$.

<a id="theorem-d4-conditional-properties-of-local-minimizers"></a>**Theorem D.4 (Conditional Properties of Local Minimizers).**
Let $x^*$ be a local minimizer of $V=V_{\mathrm{core}}+V_{\mathrm{proxy}}$, and write $\langle\hat C\rangle_{x^*}:=(\langle\hat C_v\rangle_{x^*})_v$ and $C_P:=(C_P(v))_v$.

(i) If $x^*$ is interior in the proxy-complexity coordinates, then
$$
\nabla_CV_{\mathrm{core}}(x^*)
+k_1\bigl(\langle\hat C\rangle_{x^*}-C_P\bigr)=0
$$
and
$$
\bigl\|\langle\hat C\rangle_{x^*}-C_P\bigr\|
\le
k_1^{-1}\bigl\|\nabla_CV_{\mathrm{core}}(x^*)\bigr\|.
$$
At a proxy-coordinate boundary, the corresponding conclusion is the first-order variational inequality
$$
\Bigl[\nabla_CV_{\mathrm{core}}(x^*)
+k_1\bigl(\langle\hat C\rangle_{x^*}-C_P\bigr)\Bigr]\cdot h_C\ge0
$$
for every feasible one-sided proxy tangent $h_C$. Per-MPU exact alignment follows from the equality only when $\nabla_CV_{\mathrm{core}}(x^*)=0$ and the faithful-cost-identifiability branch of Lemma D.1 is in force.

(ii) Assume the strict-comparison hypothesis of Theorem D.3: every geometrically irregular admissible configuration has a geometrically regular admissible comparator with the same proxy coordinates and strictly smaller core potential. Then every global minimizer is geometrically regular.

(iii) Assume the local-regularization hypothesis that every irregular admissible configuration has arbitrarily close geometric perturbations with unchanged proxy coordinates and strictly smaller core potential. Then every local minimizer is geometrically regular.

*Proof.* For (i), differentiability and local minimality give a nonnegative directional derivative in every feasible one-sided proxy direction. Since
$$
\nabla_CV
=
\nabla_CV_{\mathrm{core}}
+k_1(\langle\hat C\rangle-C_P),
$$
this is the displayed variational inequality. At an interior point both $h_C$ and $-h_C$ are feasible for every proxy direction, so the directional derivative vanishes in every direction and the equality follows. Taking norms gives the bound.

For (ii), if a global minimizer $x^*$ were irregular, the strict-comparison hypothesis would supply a regular $\widetilde x$ with equal proxy coordinates. Thus $V_{\mathrm{proxy}}(\widetilde x)=V_{\mathrm{proxy}}(x^*)$ and $V_{\mathrm{core}}(\widetilde x)<V_{\mathrm{core}}(x^*)$, contradicting global minimality.

For (iii), if a local minimizer $x^*$ were irregular, the local-regularization hypothesis would supply arbitrarily close $\widetilde x$ with equal proxy coordinates and lower core potential. The proxy term is unchanged, so $V(\widetilde x)<V(x^*)$, contradicting local minimality. ∎

### D.6.4 Noise-Driven Escape from Non-Global Minima

<a id="lemma-d6-almost-sure-exit-from-a-proper-relatively-compact-domain-under-non-degenerate-noise"></a>**Lemma D.6 (Almost-Sure Exit from a Proper Relatively Compact Domain Under Non-Degenerate Noise).**
Let $\mathcal K$ be the connected compact invariant state manifold from (A5), equipped with a finite full-support reference measure $m$. Assume the stochastic PCE dynamics have, for every $T>0$, a jointly continuous transition density $p_T(x,y)>0$ on $\mathcal K\times\mathcal K$ with respect to $m$. Let $\mathcal D$ be an open set such that
$$
\overline{\mathcal D}\subsetneq\mathcal K
$$
and $\mathcal K\setminus\overline{\mathcal D}$ contains a nonempty open set. Define
$$
\tau_{\mathcal D}
:=
\inf\{t\ge0:X_t\notin\mathcal D\}.
$$
Then
$$
\mathbb P_x(\tau_{\mathcal D}<\infty)=1
\qquad
\text{for every }x\in\mathcal D.
\qquad\text{(D.11a)}
$$

*Proof.* Choose a nonempty open set $O$ with $\overline O\subset\mathcal K\setminus\overline{\mathcal D}$ and choose $T>0$. Joint continuity and strict positivity on the compact set $\overline{\mathcal D}\times\overline O$ give
$$
q
:=
\inf_{x\in\overline{\mathcal D}}
\int_Op_T(x,y)\,m(dy)
>
0.
$$
If $X_T\in O$, the path has exited $\mathcal D$ no later than $T$, so
$$
\inf_{x\in\overline{\mathcal D}}
\mathbb P_x(\tau_{\mathcal D}\le T)
\ge q.
$$
The strong Markov property at the times $T,2T,\ldots$ therefore gives inductively
$$
\mathbb P_x(\tau_{\mathcal D}>nT)
\le
(1-q)^n.
$$
The events $\{\tau_{\mathcal D}>nT\}$ decrease to $\{\tau_{\mathcal D}=\infty\}$, and continuity from above yields
$$
\mathbb P_x(\tau_{\mathcal D}=\infty)
\le
\lim_{n\to\infty}(1-q)^n
=0.
$$
Thus $\tau_{\mathcal D}<\infty$ almost surely. ∎

### D.6.5 Global Ergodicity and Low-Noise Concentration

<a id="theorem-d5-ergodic-long-run-behavior-low-noise-concentration-in-detailed-balance-regimes"></a>**Theorem D.5 (Ergodic Long-Run Behavior; Low-Noise Concentration in Detailed-Balance Regimes).**
Under Assumptions (A1)–(A6), assume additionally that for each $t>0$ the diffusion has a jointly continuous, strictly positive transition density $p_t(x,y)$ with respect to Riemannian volume on $\mathcal K$. This is an additional analytic hypothesis for this theorem; its derivation from (A3)–(A5) has not been established here. Then the stochastic dynamics (D.8) define a strong Markov diffusion on the compact state space $\mathcal K$ (A5). For strictly non-vanishing noise ($d_{\min}>0$ in (A3)), the process admits a unique invariant probability measure $\pi$ and is ergodic. If $\mathcal K$ contains at least two points, the process does **not** converge almost surely to a single equilibrium point. For any bounded measurable observable $f$,
$$
\frac{1}{T}\int_0^T f(x(t))\,dt \xrightarrow[T\to\infty]{a.s.} \int_{\mathcal{K}} f(x)\,\pi(dx). \qquad \text{(D.12)}
$$

To identify when this stationary regime localizes near the PCE-optimal set, consider a "temperature-scaled" family of dynamics obtained by scaling the diffusion as $D_\theta(x):=\theta\,D(x)$ for $\theta>0$ (so the noise strength decreases as $\theta\downarrow 0$). Let $\pi_\theta$ denote the invariant measure of the corresponding diffusion. The Gibbs form is available on the registered reversible subbranch, namely when $D_\theta=\theta\eta$ and the generator is the divergence-form operator
$$
\mathcal L_\theta f
=\theta\,e^{V/\theta}\operatorname{div}\!\left(e^{-V/\theta}\,\eta\operatorname{grad}f\right)
=\theta\operatorname{div}(\eta\operatorname{grad}f)-\langle\eta\operatorname{grad}V,\operatorname{grad}f\rangle,
$$
with $\eta$ a symmetric positive-definite mobility field on $\mathcal K$. On that subbranch the invariant probability measure is
$$
\pi_\theta(dx)
=Z_\theta^{-1}\exp\!\left(-\frac{V(x)}{\theta}\right)d\operatorname{vol}(x).
\tag{D.12a}
$$
On a flat compact torus with constant $\eta$ this generator coincides with $-\langle\eta\nabla V,\nabla f\rangle+\theta\operatorname{tr}(\eta\nabla^2f)$; on a curved manifold or with state-dependent mobility the two differ by the noise-induced drift $\theta\langle\operatorname{div}\eta,\operatorname{grad}f\rangle$, so (D.12a) does not follow from $D_\theta=\theta\eta$ alone. On this reversible subbranch, the family concentrates on the global-minimizer set
$$
\mathcal E_*^{\mathrm{global}}:=\operatorname*{argmin}_{x\in\mathcal K}V(x)
$$
as $\theta\downarrow0$. For $\delta>0$, let
$$
A_\delta:=\{x:\operatorname{dist}(x,\mathcal E_*^{\mathrm{global}})>\delta\},
\qquad
\Delta_\delta:=\inf_{x\in A_\delta}(V(x)-V_{\min}).
$$
If $A_\delta$ is nonempty, then $\Delta_\delta>0$, and for every $\varepsilon\in(0,\Delta_\delta)$ there is $C_{\delta,\varepsilon}<\infty$ such that
$$
\pi_\theta(A_\delta)
\le
C_{\delta,\varepsilon}
\exp\left(-\frac{\Delta_\delta-\varepsilon}{\theta}\right)
\qquad(\theta>0).
\tag{D.12b}
$$

If the strict-comparison hypothesis of Theorem D.3 also holds, every configuration in $\mathcal E_*^{\mathrm{global}}$ is geometrically regular. A configuration in that set satisfies the proxy-coordinate balance relation of Theorem D.3 only when it is also interior in the proxy-complexity coordinates.

*Proof.* Under (A3)--(A5), the intrinsic generator in a smooth chart is
$$
\mathcal L f=(b^k-D^{ij}\Gamma^k_{ij})\partial_k f+D^{ij}\partial_i\partial_j f,
\qquad \sigma\sigma^T=2D.
$$
The chartwise Itô drift includes this connection correction. Smoothness of the metric and the Lipschitz conditions in (A3)--(A4) make the coordinate drift and noise locally Lipschitz on relatively compact subcharts. Hsu (2002, Theorem 1.1.8) gives a pathwise-unique strong solution of each stopped coordinate equation. The Itô coordinate-change formula makes these solutions agree on overlaps; pathwise uniqueness glues them across a finite cover by nested charts. Infinitely many exits across the positive collars of this cover in a finite time would contradict continuity of a path on compact $\mathcal K$, so there is no finite explosion. Restarting the unique solution at any stopping time with independent subsequent Brownian increments proves the strong Markov property. Thus the solution defines a conservative strong Markov semigroup $(P_t)_{t\ge0}$. The additional transition-density hypothesis gives $P_tf(x)=\int_{\mathcal K}f(y)p_t(x,y)\,d\operatorname{vol}(y)$. For bounded measurable $f$ and fixed $t>0$, joint continuity of $p_t$ on the compact product makes it uniformly continuous and bounded; hence $x\mapsto P_tf(x)$ is continuous. Thus $P_t$ is strong Feller. Strict positivity of $p_t$ also implies the topological irreducibility stated in (A6).

For $x\in\mathcal K$, define
$$
\mu_T:=\frac1T\int_0^T\delta_xP_t\,dt.
$$
Fix $T_n=n$. Since $\mathcal K$ is compact metric, the probabilities $\mu_{T_n}$ have a weakly convergent subsequence: diagonalize their integrals over a countable sup-norm dense family in $C(\mathcal K)$, extend the limiting positive bounded functional to $C(\mathcal K)$, and represent it by a probability measure $\pi$. Thus $T_j\to\infty$ and $\mu_{T_j}\Rightarrow\pi$. For $s>0$ and $g\in C(\mathcal K)$, the Feller property and the semigroup law give
$$
\begin{aligned}
\mu_T(P_sg)-\mu_T(g)
&=\frac1T\int_0^T(P_{t+s}g(x)-P_tg(x))\,dt\\
&=\frac1T\left(\int_T^{T+s}P_ug(x)\,du-\int_0^sP_ug(x)\,du\right).
\end{aligned}
$$
Its absolute value is at most $2s\lVert g\rVert_\infty/T$. Passing to $T_j\to\infty$ yields $\pi(P_sg)=\pi(g)$ for every $g\in C(\mathcal K)$, hence $\pi P_s=\pi$. Thus the displayed compactness-and-averaging argument constructs an invariant probability measure under the stated Feller and weak-compactness premises.

Given the conservative, stochastically continuous Markov transition semigroup and the strong-Feller property established above, the uniqueness conclusion of Gerlach and Nittka (2012, Proposition 4.3(i) and Theorem 4.10) applies to the invariant probability $\pi$: $\mathcal K$ is second countable, its transition kernels are Borel measures, (A6) excludes any nontrivial closed invariant ideal, and stochastic continuity together with invariance gives the required $L^1(\pi)$ continuity. Hence $\pi$ is the unique invariant probability measure. The assumed jointly continuous, strictly positive density on compact $\mathcal K\times\mathcal K$ has a positive minimum for each fixed $t>0$. Thus $P_t(x,A)\ge\varepsilon_t\nu(A)$ for every $x$ and measurable $A$, where $\nu$ is normalized Riemannian volume and $\varepsilon_t:=\operatorname{vol}(\mathcal K)\min_{x,y}p_t(x,y)>0$. Invariance gives $\pi\ge\varepsilon_t\nu$ and $\pi\ll\nu$, so $\pi$ and $\nu$ are equivalent. The fixed-time skeleton has a uniform minorization, hence is positive Harris recurrent. The conservative strong-Markov process is therefore positive Harris recurrent, and the continuous-time ergodic theorem (Meyn and Tweedie 1993, Theorem 8.1(i)) gives, for every initial state and every bounded measurable $f$,
$$
\frac1T\int_0^Tf(X_t)\,dt\longrightarrow\int_{\mathcal K}f\,d\pi
\quad\text{almost surely},
$$
which is (D.12).

If $\mathcal K$ contains at least two points, irreducibility gives $\operatorname{supp}\pi=\mathcal K$, so $\pi$ is not a point mass. Were $X_t\to X_\infty$ almost surely, Cesàro convergence would give
$$
\frac1T\int_0^Tf(X_t)\,dt\longrightarrow f(X_\infty)
$$
for every $f\in C(\mathcal K)$. Comparing with (D.12) on a countable point-separating dense subset of $C(\mathcal K)$ would imply $f(X_\infty)=\int f\,d\pi$ for all continuous $f$, which is possible only if $\pi=\delta_{X_\infty}$. This contradiction proves the nonconvergence clause on the nontrivial-state-space branch.

For the low-noise concentration statement, work on the registered reversible subbranch stated in the theorem, where $\mathcal L_\theta f=\theta e^{V/\theta}\operatorname{div}(e^{-V/\theta}\eta\operatorname{grad}f)$. Put $\pi_\theta:=Z_\theta^{-1}e^{-V/\theta}d\operatorname{vol}$. For $f,g\in C^\infty(\mathcal K)$ the divergence theorem on the closed manifold $\mathcal K$ gives
$$
\int_{\mathcal K}g\,\mathcal L_\theta f\,d\pi_\theta
=-\theta Z_\theta^{-1}\int_{\mathcal K}\langle\eta\operatorname{grad}f,\operatorname{grad}g\rangle\,e^{-V/\theta}\,d\operatorname{vol},
$$
which is symmetric in $f$ and $g$ because $\eta$ is symmetric. Taking $g\equiv1$ gives $\int_{\mathcal K}\mathcal L_\theta f\,d\pi_\theta=0$ for every such $f$, so $\pi_\theta$ is reversible and invariant, proving (D.12a) on the stated branch. On the flat torus with constant $\eta$ the same computation reduces to the stationary Fokker-Planck identity $\nabla\cdot(\eta(\nabla V\,p_\theta+\theta\nabla p_\theta))=0$, whose probability current vanishes identically at $p_\theta=Z_\theta^{-1}e^{-V/\theta}$.

Let $A_\delta$ and $\Delta_\delta$ be as in (D.12b), choose $\varepsilon\in(0,\Delta_\delta)$, and choose a minimizer $x_*$. Continuity of $V$ makes
$$
U_\varepsilon:=\{x\in\mathcal K:V(x)<V_{\min}+\varepsilon\}
$$
a nonempty open set, so $\operatorname{Vol}(U_\varepsilon)>0$. The numerator and denominator obey
$$
\int_{A_\delta}e^{-V/\theta}dx
\le
\operatorname{Vol}(\mathcal K)e^{-(V_{\min}+\Delta_\delta)/\theta}
$$
and
$$
\int_{\mathcal K}e^{-V/\theta}dx
\ge
\int_{U_\varepsilon}e^{-V/\theta}dx
\ge
\operatorname{Vol}(U_\varepsilon)e^{-(V_{\min}+\varepsilon)/\theta}.
$$
Division gives
$$
\pi_\theta(A_\delta)
\le
\frac{\operatorname{Vol}(\mathcal K)}{\operatorname{Vol}(U_\varepsilon)}
e^{-(\Delta_\delta-\varepsilon)/\theta},
$$
which is (D.12b) with $C_{\delta,\varepsilon}=\operatorname{Vol}(\mathcal K)/\operatorname{Vol}(U_\varepsilon)$. The final sentence follows from Theorem D.3 under its strict-comparison and interior hypotheses. ∎

<a id="theorem-d5c-reversible-cycle-chains-converging-to-a-periodic-pce-diffusion"></a>**Theorem D.5c (Reversible Cycle Chains Converging to a Periodic PCE Diffusion).** Let $\mathbb T=\mathbb R/\mathbb Z$, let $V\in C^4(\mathbb T)$, and fix $D,\theta>0$. For $N\ge3$, put $h_N=N^{-1}$, $X_N=\{0,\ldots,N-1\}$ with indices modulo $N$, and $V_i=V(ih_N)$. Define
$$
K_N(i,i\!+\!1)
=\frac{D}{h_N^2}
\exp\!\left[-\frac{V_{i+1}-V_i}{2\theta}\right],
\quad
K_N(i\!+\!1,i)
=\frac{D}{h_N^2}
\exp\!\left[\frac{V_{i+1}-V_i}{2\theta}\right],
\tag{D.12c.1}
$$
and no other off-diagonal rates. Let
$$
L_Nf(i)=\sum_jK_N(i,j)(f(j)-f(i)),
\qquad
\pi_N(i)=Z_N^{-1}e^{-V_i/\theta}.
\tag{D.12c.2}
$$
Then every $L_N$ is an irreducible conservative generator on its full finite domain, is reversible with invariant law $\pi_N$, and converges on sampled $C^4$ periodic functions uniformly to
$$
Lf=Df''-\frac D\theta V'f'.
\tag{D.12c.3}
$$
The closed limiting generator acts on $C(\mathbb T)$ with core $C^2(\mathbb T)$, represented on $[0,1]$ by the boundary conditions
$$
f^{(j)}(0)=f^{(j)}(1),\qquad j=0,1,2.
\tag{D.12c.4}
$$
Its diffusion is nonexplosive, positive Harris recurrent, reversible with the unique invariant law
$$
\pi(dx)=Z^{-1}e^{-V(x)/\theta}dx,
\tag{D.12c.5}
$$
and converges to $\pi$ in total variation from every initial point. Under the embedding $i\mapsto ih_N$, the stationary laws converge weakly. For process convergence, require that the embedded initial laws $\mu_N$ converge weakly to a probability law $\mu$ on $\mathbb T$. Then, on every finite time interval $[0,T]$, the embedded cycle processes converge in distribution in $D([0,T],\mathbb T)$, with the circle metric and the Skorokhod topology, to the diffusion generated by $L$ with initial law $\mu$.

*Proof.* The cycle graph is connected and every displayed rate is positive, so $L_N$ is irreducible and conservative. Directly,
$$
\pi_N(i)K_N(i,i+1)
=\frac{D}{Z_Nh_N^2}
e^{-(V_i+V_{i+1})/(2\theta)}
=\pi_N(i+1)K_N(i+1,i),
$$
which proves detailed balance, invariance and finite positive recurrence. Taylor expansion for sampled $C^4$ periodic functions gives, uniformly in $i$,
$$
L_N(f|_{X_N})(i)
=Df''(ih_N)-\frac D\theta V'(ih_N)f'(ih_N)+O(h_N^2).
$$
These smooth tests form a core for the same closed generator. Apply the jump martingale decomposition to the smooth circle embedding $(\cos(2\pi x),\sin(2\pi x))$. Its drift is uniformly bounded by the generator expansion, its conditional second-moment rate is uniformly bounded, and its jumps tend uniformly to zero. The martingale tightness criterion on the compact circle gives tightness on each finite time interval and continuous subsequential limits. The assumed initial-law convergence and generator convergence identify every limit as a solution of the martingale problem for (D.12c.3) with initial law $\mu$. Smooth uniformly elliptic coefficients on the circle give uniqueness for that problem, so the full sequence converges.

Periodic integration by parts gives
$$
\int gLf\,d\pi
=-D\int g'f'\,d\pi
=\int fLg\,d\pi,
$$
so (D.12c.5) is reversible and invariant. Uniform ellipticity on the connected compact circle gives a strictly positive continuous transition density for every positive time. Compactness then supplies a Doeblin minorization, hence positive Harris recurrence, uniqueness and geometric total-variation convergence. Finally, $h_NZ_N\to\int_0^1e^{-V/\theta}dx$ by Riemann sums, proving $\pi_N\Rightarrow\pi$. ∎

**Theorem D.6.5a (Finite Detailed-Balance PCE H-Theorem).** On a finite detailed-balance PCE branch, let $X$ be a finite state set and let $L$ be an irreducible continuous-time Markov generator acting on functions $f:X\to\mathbb R$ by
$$
Lf(x)=\sum_{y\in X}K(x,y)\bigl(f(y)-f(x)\bigr),
$$
where the rate kernel $K:X\times X\to[0,\infty)$ satisfies $K(x,y)\ge0$ for $x\ne y$ and the off-diagonal entries are the transition rates from $x$ to $y$. Let $\pi$ be the unique stationary law of $L$ on the irreducible branch, and impose detailed balance
$$
\pi(x)K(x,y)=\pi(y)K(y,x).
$$
Writing
$$
\mu_t(x)=\rho_t(x)\pi(x),
\qquad
\rho_t(x)>0,
$$
define the finite PCE free-cost functional
$$
H_{\mathrm{PCE}}(\mu_t\mid\pi)
=
D(\mu_t\Vert\pi)
=
\sum_{x\in X}\rho_t(x)\log\rho_t(x)\,\pi(x).
$$
Then
$$
\frac{d}{dt}D(\mu_t\Vert\pi)
=
-\frac12\sum_{x,y\in X}\pi(x)K(x,y)
(\rho_t(y)-\rho_t(x))(\log\rho_t(y)-\log\rho_t(x))
\le0.
$$
Equality holds, under irreducibility, exactly at $\mu_t=\pi$.

This is the detailed-balance entropy monotone underlying the low-noise concentration part of Theorem D.5. It is relative entropy to the stationary PCE law, not raw entropy and not the reset entropy ledger.

*Proof.* The forward equation and detailed balance give
$$
\begin{aligned}
\pi(x)\dot\rho_t(x)
&=
\sum_y\bigl[\rho_t(y)\pi(y)K(y,x)-\rho_t(x)\pi(x)K(x,y)\bigr]\\
&=
\pi(x)\sum_yK(x,y)\bigl(\rho_t(y)-\rho_t(x)\bigr).
\end{aligned}
$$
Thus
$$
\dot\rho_t(x)=\sum_yK(x,y)(\rho_t(y)-\rho_t(x)).
$$
Differentiating the relative entropy yields
$$
\frac d{dt}D(\mu_t\Vert\pi)
=
\sum_x\pi(x)(1+\log\rho_t(x))\dot\rho_t(x).
$$
The contribution of $1$ vanishes because $\sum_x\pi(x)\dot\rho_t(x)=d(\sum_x\mu_t(x))/dt=0$. Substitution of the preceding evolution equation gives
$$
\frac d{dt}D(\mu_t\Vert\pi)
=
\sum_{x,y}\pi(x)K(x,y)
\log\rho_t(x)\bigl(\rho_t(y)-\rho_t(x)\bigr).
$$
Interchanging $x$ and $y$ in one copy of this sum and using $\pi(x)K(x,y)=\pi(y)K(y,x)$ gives
$$
\frac d{dt}D(\mu_t\Vert\pi)
=
-\frac12\sum_{x,y}\pi(x)K(x,y)
(\rho_t(y)-\rho_t(x))
(\log\rho_t(y)-\log\rho_t(x)).
$$
Because the logarithm is strictly increasing, every summand after the minus sign is nonnegative. Equality forces $\rho_t(x)=\rho_t(y)$ on every positive-rate edge. Irreducibility makes $\rho_t$ constant on $X$, and normalization then gives $\rho_t\equiv1$, equivalently $\mu_t=\pi$. Conversely, $\mu_t=\pi$ makes every summand zero. ∎

**Definition D.6.5c (Predictive Free-Energy Envelope Certificate $\mathfrak C_{\mathrm{Pred2}}$).** On a retained PCE branch define the predictive free energy by
$$
F_{\mathrm{pred}}(x):=-V(x)
$$
after the additive normalization of $V$ has been fixed. A predictive-envelope certificate is a finite record
$$
\mathfrak C_{\mathrm{Pred2}}
=
(F_{\mathrm{pred}},\mathcal L_t,\mathcal X_{\mathrm{viab}},\mathcal S_{\mathrm{sel}},\mathcal I_{\mathrm{inh}},\mathcal A_{\mathrm{arch}},\mathcal H_{\mathrm{DB}},\text{coarse-graining window},\text{outcome independence}),
$$
where $\mathcal L_t$ is the finite lineage or learning-trajectory ensemble under comparison, $\mathcal X_{\mathrm{viab}}$ is the retained viability set $PP\in(\alpha,\beta)$, $\mathcal S_{\mathrm{sel}}$ is the selection/removal rule for sub-viable branches, $\mathcal I_{\mathrm{inh}}$ records inheritance or model-copy maps, $\mathcal A_{\mathrm{arch}}$ records whether the reported envelope is an archive/running supremum or an instantaneous survivor supremum, and $\mathcal H_{\mathrm{DB}}$ records the detailed-balance or Lyapunov hypotheses used for monotonicity. The running viable envelope is
$$
\widehat F_{\max}(t)
:=
\sup\{F_{\mathrm{pred}}(x_\ell(s)):
0\le s\le t,
\ell\in\mathcal L_s,
 x_\ell(s)\in\mathcal X_{\mathrm{viab}}
\}.
$$
The instantaneous survivor envelope $F_{\max}(t)$ is obtained by restricting the supremum to $s=t$.

**Proposition D.6.5d (Second-Law-of-Prediction Status).** On a branch carrying $\mathfrak C_{\mathrm{Pred2}}$, the following are the theorem-level monotonicity statements and no stronger ones.

1. Wherever the localized drift condition of Lemma D.5 gives $\frac{d}{dt}\mathbb E[V(x_t)]\le0$ on the recorded window, the same window satisfies
$$
\frac{d}{dt}\mathbb E[F_{\mathrm{pred}}(x_t)]\ge0.
$$
On a finite detailed-balance reduction in which $H_{\mathrm{PCE}}=D(\mu_t\Vert\pi)$ is the retained free-cost coordinate, Theorem D.6.5a gives monotone decrease of that coordinate and hence monotone increase of its negative.
2. The running viable envelope $\widehat F_{\max}(t)$ is nondecreasing by its definition. The instantaneous survivor envelope $F_{\max}(t)$ is nondecreasing only when $\mathcal I_{\mathrm{inh}}$ and $\mathcal A_{\mathrm{arch}}$ certify that the previously best viable retained structure is inherited, archived, or otherwise not removed from the reported survivor class.
3. Equality of the expected scalar on a recorded window does not by itself imply stationarity of the law. On the irreducible finite detailed-balance branch of Theorem D.6.5a, equality in its relative-entropy dissipation formula does imply the stationary law. Equality of an envelope means that no larger certified score enters the reported envelope on that window. The proposition does not say that every lineage improves, does not identify $F_{\mathrm{pred}}$ with raw thermodynamic entropy, and does not prove open-ended non-saturation without a separate opportunity certificate.

*Proof.* Item 1 is the identity $F_{\mathrm{pred}}=-V$ applied to the Lyapunov drift inequality, together with Theorem D.6.5a on the finite detailed-balance coordinate. Item 2 follows from the supremum over the larger time interval $[0,t]$ for the running envelope; the instantaneous version requires the explicit no-loss or archive entry because stochastic extinction or removal of the current best lineage can otherwise lower the instantaneous maximum. Item 3 is the status audit: monotonicity of an expectation or of a running supremum is weaker than monotonic improvement of every trajectory and does not by itself supply a domain mechanism for endless novelty. ∎

<a id="theorem-d65f-complete-discrete-envelope-ledger-classification-and-saturation-split"></a>**Theorem D.6.5f (Complete Discrete Envelope-Ledger Classification and Saturation Split).** At integer time $n$, let $R_n$ be the nonempty finite set of viable retained records after the declared coarse-graining, inheritance and archive operations, and let $F_n:R_n\to\mathbb R$ be their common-unit predictive scores. Put
$$
E_n:=\max_{r\in R_n}F_n(r).
\tag{D.12f.1}
$$
Let $T_n(r)\subseteq R_{n+1}$ be the descendants, coarse images or archived copies of $r$, and let $U_{n+1}$ be the genuinely new records, so

$$
R_{n+1}=U_{n+1}\cup\bigcup_{r\in R_n}T_n(r).
$$

In every maximum below, use $\max\varnothing=-\infty$. Then:

1. the realized envelope is nondecreasing at step $n$ if and only if
$$
\max\!\left\{
\max_{u\in U_{n+1}}F_{n+1}(u),
\max_{r\in R_n}\max_{s\in T_n(r)}F_{n+1}(s)
\right\}\ge E_n;
\tag{D.12f.2}
$$
2. on a comparison branch where each incumbent-successor union $\bigcup_{r\in R_n}T_n(r)$ is nonempty and the empty entrant set is admissible at every ledger state, a policy guarantees (D.12f.2) for every admitted entrant set if and only if, for every admitted ledger state,
$$
\max_{s\in\bigcup_{r\in R_n}T_n(r)}F_{n+1}(s)\ge E_n,
\tag{D.12f.2a}
$$
this equivalence concerns the stated comparison branch;
3. the running archive of Definition D.6.5c has this property by retaining an exact scored copy, while a policy whose every incumbent successor scores below $E_n$ and that admits no compensating entrant fails it;
4. a nondecreasing envelope is nonsaturating, in the sense of not being eventually constant, exactly when strict record events $E_{n+1}>E_n$ occur infinitely often;
5. universal open-ended non-saturation is false. The same exact-copy archive policy admits the saturated branch $E_n\equiv0$ and the nonsaturating branch
$$
E_n=1-2^{-n}.
\tag{D.12f.3}
$$
If all admitted scores lie in one finite set, every nondecreasing envelope saturates after finitely many strict record events.

*Proof.* Equation (D.12f.2) is the maximum over the displayed union forming $R_{n+1}$, proving item 1 without any disjointness requirement. If the incumbent-successor maximum in (D.12f.2a) is at least $E_n$, (D.12f.2) holds without any entrant. Conversely, on the comparison branch in item 2, the empty entrant set is admissible and leaves a nonempty successor record set. If the incumbent-successor maximum is below $E_n$, that choice makes $E_{n+1}<E_n$, so the claimed guarantee fails. This proves item 2, and item 3 is its direct specialization. Item 4 is the definition of eventual constancy for a nondecreasing sequence. Exact-copy archives realize both examples in item 5, and a strictly increasing sequence cannot visit a finite score set more times than that set has elements. ∎

**Remark D.6.5e (Evolution, Learning, and Cosmic Structure as Projections).** When $\mathfrak C_{\mathrm{Pred2}}$ is instantiated by a biological lineage ensemble, a learning system, or a cosmological structure-formation ledger, Proposition D.6.5d permits the common phrase “second law of prediction” for the covered envelope. The branch input is the finite certificate that the same $F_{\mathrm{pred}}$ ledger, viability cut, inheritance/archive rule, and coarse-graining window are being compared. Without that record, the statement remains an analogy to PCE descent rather than a law-level conclusion.

**Theorem D.6.5b (Regular Morse--Smale Basin Decomposition of Deterministic PCE Flow).** Let $\mathcal X$ be a compact smooth Riemannian manifold without boundary, let $V_{\mathrm{PCE}}\in C^2(\mathcal X)$ be Morse, and assume the negative-gradient flow
$$
\dot x
=
-\nabla V_{\mathrm{PCE}}(x)
$$
is Morse--Smale. Then
$$
\mathcal X
=
\bigsqcup_{c\in\mathrm{Crit}(V_{\mathrm{PCE}})}W^s(c).
$$
For every set $A$ of local minima,
$$
\mathcal B(A)
:=
\{x:\omega(x)\subseteq A\}
=
\bigsqcup_{a\in A}W^s(a).
$$
The basin $\mathcal B(A)$ is open, and
$$
\partial\mathcal B(A)
\subseteq
\bigsqcup_{\substack{c\in\mathrm{Crit}(V_{\mathrm{PCE}})\\
\operatorname{ind}(c)>0}}
W^s(c).
$$
If $[u,v]$ contains no critical value, the sublevel sets $\{V_{\mathrm{PCE}}\le u\}$ and $\{V_{\mathrm{PCE}}\le v\}$ are diffeomorphic. Crossing a critical value containing critical points of indices $\lambda_1,\ldots,\lambda_k$ changes the sublevel by attachment of the corresponding $\lambda_j$-handles.

For the geometric small-noise diffusion on $\mathcal X$ with generator
$$
\mathcal L_\theta f
=
-\langle\nabla V_{\mathrm{PCE}},\nabla f\rangle_g
+\theta\Delta_g f,
\qquad X_0^\theta=x_0\in\mathcal X,
$$
the finite-time path laws on $C([0,T],\mathcal X)$ obey a good large-deviation principle with speed $1/\theta$ and rate
$$
I_T^{x_0}(\phi)
=
\frac14\int_0^T
\left|\dot\phi+\nabla V_{\mathrm{PCE}}(\phi)\right|_g^2dt
$$
for absolutely continuous paths starting at $x_0$, and $+\infty$ otherwise. In the formulas below write $I_T=I_T^a$ when the initial point is the local minimum $a$.
If $a$ is a local minimum and $B$ is a target set outside its basin, define the path-barrier height and quasipotential over the same free time horizon:
$$
H(a,B)
:=
\inf_{\substack{T>0,\ \phi(0)=a,\ \phi(T)\in B\\ \phi\ {\rm absolutely\ continuous}}}
\max_{0\le t\le T}V_{\mathrm{PCE}}(\phi(t)),
\qquad
\mathcal Q(a,B)
:=
\inf_{\substack{T>0,\ \phi(0)=a,\ \phi(T)\in B\\ \phi\ {\rm absolutely\ continuous}}}
I_T^a(\phi).
$$
Then
$$
\mathcal Q(a,B)\ge H(a,B)-V_{\mathrm{PCE}}(a).
$$

For a Morse--Bott potential the analogous decomposition is indexed by connected critical submanifolds, $A$ must be a union of complete minimum components, and crossing a critical value attaches the disk bundle of the negative normal bundle rather than an individual handle.

*Proof.* Compactness and absence of boundary make the gradient flow complete. Along every trajectory,
$$
\frac{d}{dt}V_{\mathrm{PCE}}(x(t))
=
-|\nabla V_{\mathrm{PCE}}(x(t))|^2
\le0.
$$
Thus $V_{\mathrm{PCE}}(x(t))$ converges and every omega-limit point is critical: if $|\nabla V_{\mathrm{PCE}}|$ were bounded below on a neighborhood of an omega-limit point, each return to that neighborhood would decrease $V_{\mathrm{PCE}}$ by a uniform positive amount, contradicting convergence. A Morse function on a compact manifold has finitely many critical points, while an omega-limit set is connected; hence every trajectory converges to one critical point. This proves the disjoint stable-manifold decomposition and the formula for $\mathcal B(A)$.

At a local minimum the Hessian is positive definite, so the minimum has an attracting neighborhood. If $x\in W^s(a)$, continuity of the time-$T$ flow map carries a neighborhood of $x$ into that attracting neighborhood for sufficiently large $T$. Hence every $W^s(a)$ for a minimum is open. If $x\in\partial\mathcal B(A)$ and $x\in W^s(c)$, then $c$ cannot be a minimum in $A$, because $x$ would be interior to $\mathcal B(A)$; it cannot be a minimum outside $A$, because $x$ would be interior to the complement. Therefore $c$ is nonminimal and $\operatorname{ind}(c)>0$, proving the frontier inclusion. Smale (1961, *Annals of Mathematics* 74, 199--206) formulates the corresponding stable-manifold and transverse-intersection conditions for smooth gradient systems. Here $V_{\mathrm{PCE}}\in C^2$ gives a $C^1$ negative-gradient field, and Morse--Smale transversality is an explicit premise; the basin-frontier inclusion follows from the preceding argument.

The no-critical-value diffeomorphism theorem and the handle-attachment theorem apply because $\mathcal X$ is compact without boundary and $V_{\mathrm{PCE}}$ is Morse; these are the hypotheses of Milnor's Morse theory theorem (Milnor 1963a, *Morse Theory*, Princeton University Press). The Morse--Bott lemma gives the stated negative-normal-bundle attachment for a critical submanifold.

For the path-law assertion, choose a smooth embedding $\iota:\mathcal X\hookrightarrow\mathbb R^N$ and finitely many smooth tangent fields $E_j$ with $\sum_j E_j\otimes E_j=g^{-1}$; local orthonormal frames and a squared partition of unity provide such fields. In ambient coordinates, the push-forward of the diffusion has noise columns $\sqrt{2\theta}\,d\iota(E_j)$ and Itô drift $d\iota(-\nabla V_{\mathrm{PCE}})+\theta\Delta_g\iota$. Extend these coefficients with a bounded smooth cutoff to a tubular neighborhood and then to $\mathbb R^N$. Compactness, $V_{\mathrm{PCE}}\in C^2$, and smoothness of the geometric data give locally Lipschitz coefficients of sublinear growth, uniformly for small $\theta$, and drift convergence on bounded sets. Chiarini and Fischer (2014, Theorem 2) therefore give a good Euclidean finite-time path LDP. The solution started on $\iota(\mathcal X)$ is the embedded intrinsic diffusion, so its path laws are supported on that closed embedded path space and transfer to $C([0,T],\mathcal X)$. The limiting controlled equation is $\dot\phi=-\nabla V_{\mathrm{PCE}}+\sqrt2\sum_jE_ju_j$. Minimizing $\tfrac12\int_0^T|u|^2dt$ subject to this tangent equation gives $\tfrac14\int_0^T|\dot\phi+\nabla V_{\mathrm{PCE}}|_g^2dt$, because the fields' covariance is $g^{-1}$. All norms and inner products in the following calculation are Riemannian. For every absolutely continuous path,
$$
\begin{aligned}
I_T(\phi)
&=
\frac14\int_0^T
|\dot\phi-\nabla V_{\mathrm{PCE}}(\phi)|^2dt
+
\int_0^T
\langle\dot\phi,\nabla V_{\mathrm{PCE}}(\phi)\rangle dt\\
&=
\frac14\int_0^T
|\dot\phi-\nabla V_{\mathrm{PCE}}(\phi)|^2dt
+
V_{\mathrm{PCE}}(\phi(T))-V_{\mathrm{PCE}}(a).
\end{aligned}
$$
Applying the same identity up to the first time the path reaches its maximum potential gives
$$
I_T(\phi)
\ge
\max_tV_{\mathrm{PCE}}(\phi(t))-V_{\mathrm{PCE}}(a)
\ge
H(a,B)-V_{\mathrm{PCE}}(a).
$$
Taking the infimum over all admissible paths proves the quasipotential bound. ∎

## D.7 Formal Justification of Theorems 2 and 43

The results derived in this appendix provide conditional dynamical justifications for Theorems 2 and 43 under their faithful-identifiability, comparison, regularity, and stochastic hypotheses. The convergence from the discrete MPU network to a continuum description governed by a standard action is likewise conditional on the hypotheses of the following theorem.

<a id="lemma-d6a-equicoercivity-of-the-discrete-predictive-action-from-pu-bounded-geometry"></a>**Lemma D.6a (Equicoercivity of the discrete predictive action from PU bounded geometry).**

Let $\{(\mathcal G_h,d_h,\mu_h)\}_{h\downarrow 0}$ be the family of PU weighted graphs used in Theorem D.6, with the PU macroscopic rescaling already applied. Assume
$$
\mathcal F_h=\mathcal F_h^{EH}+\mathcal F_h^{MPU},
\qquad
\mathcal F_h^{EH}\ge 0,
\quad
\mathcal F_h^{MPU}\ge 0.
$$
Assume further that for every fixed sublevel $M<\infty$ there exists $h_0(M)>0$ such that for all $h<h_0(M)$, every configuration with $\mathcal F_h\le M$ satisfies the bounded-geometry hypotheses already established in Appendix C, namely:

- uniform $D$-dimensional two-sided volume bounds,
- local doubling,
- bounded degree, properness, and minimal link length.

Equip each graph with the normalized measure $\bar\mu_h:=h^D\mu_h$. Require constants $K_1,K_2>0$, independent of $h$, the sublevel configuration, the center $x$, and the radius, such that
$$
K_1r^D
\le
\bar\mu_h(B_{d_h}(x,r))
\le
K_2r^D
\tag{D.6a.1}
$$
for every $h<h_0(M)$ and every $r\ge h$.

Then every sequence $h_j\downarrow0$ with
$$
(\mathcal G_{h_j},d_{h_j},\bar\mu_{h_j})\in
\mathfrak S_{h_j}(M):=\{(\mathcal G_h,d_h,\bar\mu_h):\mathcal F_h\le M\},
$$
and with chosen basepoints has a pointed measured Gromov--Hausdorff convergent subsequence. Thus the sublevels are asymptotically equicoercive in this pointed metric-measure topology. If the variational state retains additional fields, joint compactness of those fields is a separate requirement.

*Proof.* Consider such a sequence and basepoints $x_j$. Omit the finite prefix for which $h_j\ge h_0(M)$.

**Step 1 (packing on the small-mesh tail).** Let $R>0$ and $0<\varepsilon<R$. For all sufficiently large $j$, $h_j<\varepsilon/3$. The volume bounds apply to closed balls: if the balls in (D.6a.1) are open, the upper bound for a closed ball follows by continuity from above for open radii decreasing to its radius, and the lower bound follows by inclusion. Let $S$ be a maximal $\varepsilon$-separated subset of the compact closed ball $\overline B(x_j,R)$. The closed balls $\overline B(s,\varepsilon/3)$, $s\in S$, are pairwise disjoint because $2\varepsilon/3<\varepsilon$. They lie in $\overline B(x_j,R+\varepsilon/3)$. Therefore
$$
|S|K_1(\varepsilon/3)^D
\le\sum_{s\in S}\bar\mu_{h_j}(\overline B(s,\varepsilon/3))
\le K_2(R+\varepsilon/3)^D,
$$
and hence
$$
|S|\le\frac{K_2}{K_1}
\left(\frac{3R+\varepsilon}{\varepsilon}\right)^D
\le\frac{K_2}{K_1}\left(\frac{4R}{\varepsilon}\right)^D.
$$
Maximality makes $S$ an $\varepsilon$-net. For each $R,\varepsilon$, this bounds the covering number on the tail; the finitely many omitted proper spaces have finite covering numbers on their compact radius-$R$ balls.

**Step 2 (metric realization).** For each fixed radius and covering scale, Step 1 bounds the tail uniformly; the finitely many omitted compact balls contribute a finite additional bound. The pointed proper-space covering criterion (Bate 2022, Theorem 2.27) gives a subsequence converging to a proper pointed metric space $(X,d,x)$. Use the proper ambient realization of pointed Gromov--Hausdorff convergence: the subsequence and $X$ embed isometrically as closed subsets of one proper metric space $Z$, their basepoints $z_j$ tend to $z$, and the embedded spaces converge locally in Hausdorff distance. Write $\nu_j$ for the pushforward of the entire measure $\bar\mu_{h_j}$ to $Z$.

**Step 3 (compatible local measure limits).** For each integer $m\ge1$, choose a continuous distance cutoff $0\le\chi_m\le1$ equal to one on $\overline B_Z(z,m)$ and zero outside $B_Z(z,m+1)$. Its support is compact because $Z$ is proper. For large $j$, $d_Z(z_j,z)<1$ and $h_j<m+2$, so
$$
\nu_j(\operatorname{supp}\chi_m)
\le\bar\mu_{h_j}(\overline B(z_j,m+2))
\le K_2(m+2)^D.
$$
Thus the finite measures $\chi_m\nu_j$ have bounded mass on a common compact set. On each compact support, diagonalize the integrals over a countable sup-norm dense subset of continuous functions. The uniform mass bound extends the limit to a positive bounded functional, which is represented by a finite Borel measure. A second diagonal extraction over $m$ gives weak limits $\nu^{(m)}$ for all $m$.

For $f\in C_c(B_Z(z,m))$ and every integer $k\ge m$, $\chi_k=1$ on the support of $f$. Hence
$$
\int f\,d\nu^{(k)}
=\lim_j\int f\chi_k\,d\nu_j
=\lim_j\int f\,d\nu_j
=\int f\,d\nu^{(m)}.
$$
Uniqueness of Radon measures from continuous compactly supported tests shows that these limits agree on the open sets $B_Z(z,m)$. They glue to a locally finite Radon measure $\nu$ on $Z$. Every compactly supported continuous test lies in one such open ball, so $\nu_j\to\nu$ against all these tests. This argument uses cutoffs of the whole measures; it makes no assertion that restrictions to closed-ball boundaries commute with weak limits.

Local Hausdorff convergence implies that any compact set at positive distance from $X$ misses all embedded spaces for large $j$. Testing there gives $\nu(Z\setminus X)=0$. The lower volume bound also gives full support on $X$: for $y\in X$ and $r>0$, choose $y_j\to y$ in the embedded spaces and a continuous cutoff supported in $B_Z(y,r)$ and equal to one on $\overline B_Z(y,r/2)$. For large $j$ its integral against $\nu_j$ is at least $K_1(r/3)^D$, using $\overline B(y_j,r/3)\subset\overline B_Z(y,r/2)$ and $h_j<r/3$. The same positive lower bound holds in the limit. Restricting $\nu$ to $X$ yields the required pointed measured limit. This proves the stated asymptotic metric-measure equicoercivity. ∎

<a id="theorem-d6-conditional-gamma-convergence-fundamental-theorem"></a>**Theorem D.6 (Conditional Gamma-Convergence Fundamental Theorem).** Let the varying-space realization be metrizable, let $\mathcal F_h$ and $\mathcal F$ be proper extended-real functionals, and assume $\inf_h\inf\mathcal F_h> -\infty$. Assume the sequential Gamma-liminf and recovery inequalities and equicoercivity, and assume $\mathcal F(x_0)<\infty$ for at least one $x_0$. Then
$$
\mathcal F_h\xrightarrow{\Gamma}\mathcal F,\qquad\lim_{h\downarrow0}\inf\mathcal F_h=\min\mathcal F.
$$
Every sequence satisfying $\mathcal F_h(x_h)-\inf\mathcal F_h\to0$ has convergent subsequences, and every cluster point minimizes $\mathcal F$. Identification of $\mathcal F$ with a displayed continuum action requires separate liminf and recovery proofs; an unconstrained Lorentzian Einstein--Hilbert expression is not generally coercive or bounded below.

*Proof.* Write $m_h:=\inf\mathcal F_h$. A recovery sequence $x_{0,h}\to x_0$ gives
$$
\limsup_{h\downarrow0}m_h
\le
\limsup_{h\downarrow0}\mathcal F_h(x_{0,h})
\le
\mathcal F(x_0)<\infty.
$$
Together with $\inf_hm_h> -\infty$, this bounds the energies of every sequence $x_h$ satisfying $\mathcal F_h(x_h)\le m_h+o(1)$. Equicoercivity therefore gives a convergent subsequence $x_{h_j}\to x$.

Choose the indices $h_j$ so that $m_{h_j}\to\liminf_{h\downarrow0}m_h$ and choose $x_{h_j}$ with $\mathcal F_{h_j}(x_{h_j})\le m_{h_j}+1/j$. The liminf inequality yields
$$
\mathcal F(x)
\le
\liminf_{j\to\infty}\mathcal F_{h_j}(x_{h_j})
=
\liminf_{h\downarrow0}m_h.
$$
For every $y$ with $\mathcal F(y)<\infty$, a recovery sequence $y_h\to y$ gives
$$
\limsup_{h\downarrow0}m_h
\le
\limsup_{h\downarrow0}\mathcal F_h(y_h)
\le
\mathcal F(y).
$$
The two inequalities imply $\mathcal F(x)\le\mathcal F(y)$ for every admissible $y$; hence $x$ minimizes $\mathcal F$. They also give
$$
\min\mathcal F
\le
\liminf_{h\downarrow0}m_h
\le
\limsup_{h\downarrow0}m_h
\le
\min\mathcal F,
$$
where the last inequality uses a recovery sequence for $x$. Thus $m_h\to\min\mathcal F$.

Finally, let $z_h$ be any approximate-minimizer sequence. Its energies are bounded, so equicoercivity gives a convergent subsequence $z_{h_j}\to z$. The liminf inequality and convergence of $m_h$ give
$$
\mathcal F(z)
\le
\liminf_{j\to\infty}\mathcal F_{h_j}(z_{h_j})
=
\min\mathcal F.
$$
Therefore every cluster point $z$ minimizes $\mathcal F$. ∎

**D.6bis Cell-Averaged Closure of the Variational Limit**

<a id="theorem-d6b-cell-averaged-curvature-closure"></a>**Theorem D.6b (Cell-Averaged Curvature Closure).** Let $U\Subset M$ be a precompact chart domain, equip the admissible metric realizations with the declared metrizable local topology, and assume $R_g\in L^1(U,dV_g)$ for every admissible limit metric $g$. Let
$$
\mathcal F^{\mathrm{curv}}_{h,U}[g_h]
:=
\alpha_h\sum_{v\in V_h(U)}\mu_h(v)R_h(v;g_h),
\qquad
\alpha_h\to\alpha\in\mathbb R.
$$
Assume the following universal consistency condition: whenever $g_h\to g$ and
$$
\liminf_{h\downarrow0}\mathcal F^{\mathrm{curv}}_{h,U}[g_h]<\infty,
$$
there are compatible quasi-uniform cells $\{C_v^{(h)}\}$, covering $U$ up to a null set and satisfying $\mu_h(v)=\int_{C_v^{(h)}}dV_g$, for which
$$
\sum_v\mu_h(v)
\left|
R_h(v;g_h)
-
\frac{1}{\mu_h(v)}\int_{C_v^{(h)}}R_g\,dV_g
\right|
\longrightarrow0.
$$
Assume also that every admissible $g$ with finite $\mathcal F_U^{\mathrm{curv}}[g]:=\alpha\int_UR_g\,dV_g$ has a recovery discretization $I_hg\to g$ satisfying the same estimate. Then
$$
\mathcal F^{\mathrm{curv}}_{h,U}
\xrightarrow{\Gamma}
\mathcal F^{\mathrm{curv}}_U
$$
in the declared local topology. Moreover, the curvature actions converge along every convergent sequence covered by the universal consistency condition.

*Proof.* For such a sequence define
$$
\overline R_g^{(h)}(v)
:=
\frac{1}{\mu_h(v)}\int_{C_v^{(h)}}R_g\,dV_g.
$$
The cell partition gives $\sum_v\mu_h(v)\overline R_g^{(h)}(v)=\int_UR_g\,dV_g$, and hence
$$
\begin{aligned}
\left|
\mathcal F^{\mathrm{curv}}_{h,U}[g_h]
-
\alpha\int_UR_g\,dV_g
\right|
&\le
|\alpha_h|
\sum_v\mu_h(v)|R_h(v;g_h)-\overline R_g^{(h)}(v)|\\
&\quad+
|\alpha_h-\alpha|
\left|\int_UR_g\,dV_g\right|.
\end{aligned}
$$
Both terms tend to zero for every sequence whose action liminf is less than $+\infty$, as required by the hypothesis. The action therefore converges to the finite continuum integral on every such sequence, which also rules out a liminf of $-\infty$. The only remaining case is liminf $+\infty$, for which the liminf inequality is automatic. Applying the same computation to $I_hg$ proves the recovery inequality. These are the two defining inequalities of $\Gamma$-convergence. ∎

<a id="corollary-d6b1-volume-term-closure"></a>**Corollary D.6b.1 (Volume-Term Closure).** Suppose compatible cells cover $U$ up to a null set, $\mu_h(v)=\int_{C_v^{(h)}}dV_g$, and $\beta_h\to\beta$. Then
$$
\mathcal V_{h,U}[g_h]
:=
\beta_h\sum_v\mu_h(v)
\longrightarrow
\beta\int_UdV_g
$$
along every admissible convergent sequence, and the associated liminf and recovery inequalities hold.

*Proof.* The cell identity gives $\sum_v\mu_h(v)=\int_UdV_g$; multiplication by $\beta_h\to\beta$ gives the conclusion. ∎

<a id="theorem-d6c-cell-averaged-matter-closure"></a>**Theorem D.6c (Cell-Averaged Matter Closure).** Equip pairs $(g,\phi)$ with the declared metrizable local topology and assume $\mathcal L_{\mathrm{MPU}}(g,\phi)\in L^1(U,dV_g)$. Define
$$
\mathcal F^{\mathrm{MPU}}_{h,U}[g_h,\phi_h]
:=
\sum_v\mu_h(v)\ell_h(v;g_h,\phi_h).
$$
Assume that for every convergent sequence $(g_h,\phi_h)\to(g,\phi)$ with $\liminf_{h\downarrow0}\mathcal F^{\mathrm{MPU}}_{h,U}[g_h,\phi_h]<+\infty$ there are compatible cells for which
$$
\sum_v\mu_h(v)
\left|
\ell_h(v;g_h,\phi_h)
-
\frac{1}{\mu_h(v)}
\int_{C_v^{(h)}}\mathcal L_{\mathrm{MPU}}(g,\phi)\,dV_g
\right|
\longrightarrow0,
$$
and assume a recovery discretization satisfying this estimate for every finite-energy pair $(g,\phi)$. Then
$$
\mathcal F^{\mathrm{MPU}}_{h,U}
\xrightarrow{\Gamma}
\int_U\mathcal L_{\mathrm{MPU}}(g,\phi)\,dV_g.
$$

*Proof.* Summing the cell averages gives the finite continuum integral. The triangle inequality bounds the absolute difference between the discrete matter action and this integral by the assumed weighted cell error. It therefore proves convergence for every sequence with liminf less than $+\infty$, including the exclusion of a liminf equal to $-\infty$. A liminf equal to $+\infty$ satisfies the lower-bound inequality automatically. The declared recovery discretization proves the limsup inequality. ∎

<a id="corollary-d6c1-predictive-action-additive-closure"></a>**Corollary D.6c.1 (Predictive-Action Additive Closure).** Assume the hypotheses of Theorem D.6b, Corollary D.6b.1, and Theorem D.6c, assume their componentwise liminf inequalities hold on the same topology, assume they admit a common recovery discretization, and assume the summed functionals are equicoercive. Assume also that the summed functionals and their limit satisfy the properness, uniform lower-bound, and finite-limit-value hypotheses of Theorem D.6. Then
$$
\mathcal F_{h,U}
:=
\mathcal F^{\mathrm{curv}}_{h,U}
+
\mathcal V_{h,U}
+
\mathcal F^{\mathrm{MPU}}_{h,U}
\xrightarrow{\Gamma}
\alpha\int_UR_g\,dV_g
+
\beta\int_UdV_g
+
\int_U\mathcal L_{\mathrm{MPU}}\,dV_g,
$$
and every approximate-minimizer sequence has convergent subsequences whose cluster points minimize the limit functional.

*Proof.* Adding the three componentwise liminf inequalities gives the liminf inequality for $\mathcal F_{h,U}$. Evaluating all three summands on the common recovery discretization gives the limsup inequality. Equicoercivity and Theorem D.6 give the assertion about approximate minimizers. ∎

<a id="theorem-d6d-signature-qualified-einstein-hilbert-mpu-gamma-limit"></a>**Theorem D.6d (Signature-Qualified Einstein--Hilbert + MPU $\Gamma$-Limit).** Assume Corollary D.6c.1 on an equicoercive positive-definite Riemannian branch, and assume that its local actions assemble into global actions on $M$ satisfying the same componentwise liminf, common recovery, equicoercivity, and Theorem-D.6 functional hypotheses. Assume also a signature bridge identifying its two gravitational coefficients with the four-dimensional Wald/diffeomorphism normalization of Theorem 12.1a. Then
$$
\alpha
=
\frac{c^3}{16\pi G},
\qquad
\beta
=
-\frac{c^3\Lambda}{8\pi G},
$$
and the Riemannian $\Gamma$-limit is
$$
\mathcal F_E[g,\phi]
=
\frac{c^3}{16\pi G}
\int_M(R_g-2\Lambda)\,dV_g
+
\int_M\mathcal L_{\mathrm{MPU}}(g,\phi)\,dV_g.
$$
Every approximate-minimizer sequence covered by the common equicoercivity hypothesis has subsequences converging to minimizers of $\mathcal F_E$.

Under the same signature bridge, the coefficient correspondence gives the Lorentzian action
$$
\mathcal S_L[g,\phi]
=
\frac{c^3}{16\pi G}
\int_M(R_g-2\Lambda)\sqrt{-g}\,d^4x
+
\int_M\mathcal L_{\mathrm{MPU}}(g,\phi)\sqrt{-g}\,d^4x.
$$
This coefficient correspondence does not assert Lorentzian $\Gamma$-convergence or convergence of Lorentzian minimizers. In the vacuum-absorbed convention of Corollary B.8d.2, the constant term is absorbed geometrically and $\Lambda$ occurs as an integration constant in §12.

*Proof.* Corollary D.6c.1 gives the Riemannian limit
$$
\alpha\int_MR_g\,dV_g
+
\beta\int_MdV_g
+
\int_M\mathcal L_{\mathrm{MPU}}\,dV_g.
$$
Substitution of the two coefficient identities yields $\mathcal F_E$. The common equicoercivity hypothesis and Theorem D.6 give the Riemannian minimizer conclusion. The signature bridge transfers the coefficients to $\mathcal S_L$, but no compactness or lower-bound inference is made for the Lorentzian functional. ∎

<a id="theorem-d6e-conditional-mosco-cheeger-closure-of-the-spatial-sector"></a>**Theorem D.6e (Conditional Mosco–Cheeger Closure of the Spatial Sector).** Let $(X_n,d_n,\mu_n)$ be the rescaled MPU network metric-measure spaces on the geometric branch, and let the rescaled propagation-cost Dirichlet forms be
$$
\mathcal E_n(f)
=
\frac12\sum_{x\sim y}c^{(n)}_{xy}\bigl(f(x)-f(y)\bigr)^2.
$$
On the minimal $M=24$, $D=4$ branch, fix the curvature parameter $K$ used in the target $\mathrm{BE}(K,4)$ condition. For each finite configuration $\mathcal C$ at resolution $n$, define the continuum-control defect
$$
\mathfrak D_n(\mathcal C)
:=
\mathfrak B_n(\mathcal C)
+
\mathfrak C_n(\mathcal C)
+
\mathfrak R_n(\mathcal C)
+
\mathfrak H_n(\mathcal C).
$$

The radius-2 Bakry–Émery defect is
$$
\mathfrak B_n(\mathcal C)
=
\sup_x
\sup_{\substack{f\in\mathcal P_2(B_2(x))\\ \|f\|_{\mathcal P_2(B_2(x))}\le1}}
\left[
K\Gamma_{n,\mathcal C}(f)(x)
+
\frac14(L_{n,\mathcal C}f(x))^2
-
\Gamma_{2,n,\mathcal C}(f)(x)
\right]_+^2,
\tag{D.6e.1}
$$
where $\mathcal P_2(B_2(x))$ is the finite polynomial core generated by constants, affine shell coordinates, and their quadratic products on the radius-2 $D_4$ neighborhood, with any fixed coefficient norm on this finite-dimensional core.

Let $\mathcal L_n^{(2)}(\mathcal C)$ be the graph Lipschitz core generated by these local $\mathcal P_2$ functions. The finite-core defect is
$$
\mathfrak C_n(\mathcal C)
=
\sup_{\|u\|_{L^2(\mu_n)}^2+\mathcal E_n(u)\le1}
\inf_{v\in\mathcal L_n^{(2)}(\mathcal C)}
\left(
\|u-v\|_{L^2(\mu_n)}^2+\mathcal E_n(u-v)
\right).
\tag{D.6e.2}
$$
The recovery defect is
$$
\mathfrak R_n(\mathcal C)
=
\sup_{f\in\mathcal C_{\mathrm{Lip}},\ \|f\|_{\mathrm{Lip}}+\|f\|_\infty\le1}
\left(
\|I_nE_nf-f\|_{L^2}
+
\left|\mathcal E_n(E_nf)-\mathcal E_\infty^{\mathrm{cand}}(f)\right|
\right),
\tag{D.6e.3}
$$
where $E_n$ is the sampling map, $I_n$ is the canonical cell interpolation, and $\mathcal E_\infty^{\mathrm{cand}}$ is the quadratic form determined by the limiting shell tensor. The quantitative-rigidity defect is
$$
\mathfrak H_n(\mathcal C)
=
\sup_{x,r}
\left[
\frac{d_{GH}(B_r(x),B_r^{\mathbb R^4})}{r}
+
\left|
\frac{\mu_n(B_r(x))}{\omega_4r^4}-1
\right|
+
\mathrm{HarmEx}_n(x,r)
\right]^2,
\tag{D.6e.4}
$$
with the supremum taken over the fixed-radius noncollapsed chart range and with $\mathrm{HarmEx}_n$ the normalized harmonic-coordinate excess.

Let the continuum-control part of the microscopic PCE potential be
$$
V_n^{\mathrm{cont}}(\mathcal C)
=
V_n(\mathcal C)
+
\lambda_{\mathrm{BE}}\mathfrak B_n(\mathcal C)
+
\lambda_{\mathrm{core}}\mathfrak C_n(\mathcal C)
+
\lambda_{\mathrm{rec}}\mathfrak R_n(\mathcal C)
+
\lambda_{\mathrm{rig}}\mathfrak H_n(\mathcal C),
\qquad
\lambda_{\mathrm{BE}},\lambda_{\mathrm{core}},\lambda_{\mathrm{rec}},\lambda_{\mathrm{rig}}>0.
\tag{D.6e.5}
$$
Let $\lambda_{\min}$ and $\lambda_{\max}$ be the minimum and maximum of these four positive coefficients, let
$$
\mathcal M_n:=\arg\min V_n,
\qquad
\mathfrak d_n^*
:=
\inf_{\mathcal C\in\mathcal M_n}\mathfrak D_n(\mathcal C).
\tag{D.6e.6}
$$
Assume an independent continuum-bridge certificate supplies a competitor sequence in $\mathcal M_n$ with $\mathfrak d_n^*\to0$; Theorem C.6e supplies only the fixed-trace shell-isotropy and shell-tensor rank statement. Then every global minimizer $\mathcal C_n^*$ of $V_n^{\mathrm{cont}}$ satisfies
$$
\mathfrak D_n(\mathcal C_n^*)
\le
\frac{\lambda_{\max}}{\lambda_{\min}}\mathfrak d_n^*,
\tag{D.6e.7}
$$
and hence lies on a vanishing-defect sequence. Moreover, in the detailed-balance low-noise regime of Theorem D.5, for every $\varepsilon>0$ and each fixed $n$ there are constants $c_{n,\varepsilon},C_{n,\varepsilon}>0$ such that
$$
\pi_{\theta,n}\!\left(
\mathfrak D_n>
\frac{\lambda_{\max}}{\lambda_{\min}}\mathfrak d_n^*+\varepsilon
\right)
\le
C_{n,\varepsilon}e^{-c_{n,\varepsilon}/\theta}.
\tag{D.6e.8}
$$
Assume, relative to the declared measured-Gromov--Hausdorff identifications, that weak convergence $f_n\rightharpoonup f$ implies
$$
\mathcal E_\infty(f)\le\liminf_{n\to\infty}\mathcal E_n(f_n),
$$
and that every $f$ admits $f_n\to f$ strongly with
$$
\limsup_{n\to\infty}\mathcal E_n(f_n)\le\mathcal E_\infty(f).
$$
Assume also that $\mathcal E_\infty$ is the closed quadratic strongly local regular Cheeger energy. Then $\mathcal E_n$ Mosco-converges to $\mathcal E_\infty$ relative to those identifications. The defect condition $\mathfrak D_n\to0$ alone implies neither Mosco inequality nor the candidate-form identification.

*Proof.* Each defect in (D.6e.1)–(D.6e.4) is nonnegative and finite on the normalized finite-resolution cores. Let $\mathcal Y_n\in\mathcal M_n$ be a competitor with $\mathfrak D_n(\mathcal Y_n)$ arbitrarily close to $\mathfrak d_n^*$. Since $\mathcal C_n^*$ minimizes $V_n^{\mathrm{cont}}$ and $V_n(\mathcal C_n^*)\ge V_n(\mathcal Y_n)=\min V_n$,
$$
\lambda_{\min}\mathfrak D_n(\mathcal C_n^*)
\le
\sum_\bullet\lambda_\bullet\mathfrak D_{n,\bullet}(\mathcal C_n^*)
\le
\sum_\bullet\lambda_\bullet\mathfrak D_{n,\bullet}(\mathcal Y_n)
\le
\lambda_{\max}\mathfrak D_n(\mathcal Y_n).
$$
Taking the infimum over such competitors gives (D.6e.7). Since $\mathfrak d_n^*\to0$, the selected minimizers have $\mathfrak D_n\to0$.

For (D.6e.8), use the compact Gibbs branch of Theorem D.5 with a finite full-support reference measure $m_n$, continuous finite potential $W_n:=V_n^{\mathrm{cont}}$, and measurable defect $\mathfrak D_n$. Write $v_n=\min V_n$ and $w_n=\min W_n$. Comparison with core minimizers whose defects approach $\mathfrak d_n^*$ gives
$$
w_n\le v_n+\lambda_{\max}\mathfrak d_n^*,
\qquad
W_n(\mathcal C)\ge v_n+\lambda_{\min}\mathfrak D_n(\mathcal C).
$$
Hence
$$
W_n(\mathcal C)-w_n
\ge\lambda_{\min}\mathfrak D_n(\mathcal C)
-\lambda_{\max}\mathfrak d_n^*.
$$
For $\delta=\lambda_{\min}\varepsilon>0$, the measurable event in (D.6e.8) is contained in $\{W_n-w_n>\delta\}$. The nonempty open set $U=\{W_n<w_n+\delta/2\}$ has $m_n(U)>0$. The Gibbs numerator on that event is at most $m_n(\mathcal X_{\mathrm{adm}})e^{-(w_n+\delta)/\theta}$, while its normalizer is at least $m_n(U)e^{-(w_n+\delta/2)/\theta}$. Their ratio proves (D.6e.8) with
$$
c_{n,\varepsilon}=\frac{\lambda_{\min}\varepsilon}{2},
\qquad
C_{n,\varepsilon}=\frac{m_n(\mathcal X_{\mathrm{adm}})}{m_n(U)}.
$$
This argument uses the declared Gibbs-branch hypotheses and does not require continuity of the individual defects.

The defect estimates select a candidate branch but do not prove the two Mosco inequalities. Under the additional liminf and recovery hypotheses above, Mosco convergence follows by definition; the separately assumed candidate-form identification gives the strongly local regular Cheeger-energy conclusion. ∎

<a id="proposition-d6f-sharp-global-core-competitor-condition"></a>**Proposition D.6f (Sharp Global-Core Competitor Condition).** In Theorem D.6e, the weakest condition that can force asymptotic defect removal while selection remains inside the global core-minimum class is
$$
\mathfrak d_n^*
=
\inf_{\mathcal C\in\mathcal M_n}\mathfrak D_n(\mathcal C)
\longrightarrow 0.
\tag{D.6f.1}
$$
Equivalently, there exists a sequence $\mathcal Y_n\in\mathcal M_n$ with $\mathfrak D_n(\mathcal Y_n)\to0$ if and only if Equation (D.6f.1) holds. The $D_4$ shell moment closure, noncollapse, and local Bakry-Émery transfer data by themselves do not imply Equation (D.6f.1), because they do not rank the zero-defect configurations inside the core potential $V_n$.

*Proof.* If Equation (D.6f.1) holds, choose $\mathcal Y_n\in\mathcal M_n$ with
$$
\mathfrak D_n(\mathcal Y_n)
\le
\mathfrak d_n^*+\frac1n.
$$
Then $\mathfrak D_n(\mathcal Y_n)\to0$. Conversely, if $\mathcal Y_n\in\mathcal M_n$ and $\mathfrak D_n(\mathcal Y_n)\to0$, then
$$
0\le \mathfrak d_n^*\le \mathfrak D_n(\mathcal Y_n)\to0,
$$
so Equation (D.6f.1) holds.

The condition is necessary for any theorem whose selected configurations are required to remain in $\mathcal M_n$. If Equation (D.6f.1) fails, there are $\varepsilon_0>0$ and a subsequence $n_j$ such that $\mathfrak d_{n_j}^*\ge\varepsilon_0$. By the definition of $\mathfrak d_n^*$, every $\mathcal C\in\mathcal M_{n_j}$ then satisfies $\mathfrak D_{n_j}(\mathcal C)\ge\varepsilon_0$, so no sequence selected inside the global core-minimum class can have vanishing total continuum defect.

The sharpness is independent of the local $D_4$ data. At a fixed resolution, take two admissible configurations $r_n$ and $s_n$ with the same first-shell $D_4$ carrier and the same noncollapse data, but with $\mathfrak D_n(r_n)=0$ and $\mathfrak D_n(s_n)=1$. Define a core potential with $V_n(s_n)=0$ and $V_n(r_n)=1$. Then $\mathcal M_n=\{s_n\}$ and $\mathfrak d_n^*=1$, although a zero-defect $D_4$ competitor exists outside $\mathcal M_n$. Thus zero-defect local geometry does not imply zero-defect membership in the global core-minimum class. The extra hypothesis in Theorem D.6e is exactly the assertion that the zero-defect competitor exists inside $\mathcal M_n$. ∎

<a id="definition-d6f1-fractal-to-smooth-scale-audit"></a>**Definition D.6f.1 (Fractal-to-Smooth Scale Audit).** For a finite configuration $\mathcal C$ at resolution $n$, let $p_t^{(n,\mathcal C)}(x,y)$ be the heat kernel of the rescaled propagation-cost Dirichlet form and define the averaged return probability
$$
P_{n,\mathcal C}(\tau)
=
\int p_\tau^{(n,\mathcal C)}(x,x)\,d\mu_n(x).
\tag{D.6f.2}
$$
The finite spectral dimension on the audited scale window is the logarithmic finite-difference quantity
$$
d_{s,n}^{\mathcal C}(\tau)
=
-2\,\Delta_{\log\tau}\log P_{n,\mathcal C}(\tau).
\tag{D.6f.3}
$$
Let $\mathfrak A_n(\mathcal C)$ denote the macroscopic anomalous chemical-distance excess relative to the $D=4$ operational-continuum scaling window. The scale audit is
$$
\mathfrak S_n(\mathcal C)
=
\sup_{\tau\in[\tau_{\mathrm{IR}},\tau_{\mathrm{UV}}]}
\left|d_{s,n}^{\mathcal C}(\tau)-4\right|^2
+
\mathfrak A_n(\mathcal C),
\tag{D.6f.4}
$$
where $[\tau_{\mathrm{IR}},\tau_{\mathrm{UV}}]$ is the fixed macroscopic operational window of the selected continuum branch. UV recursive or fractal behavior below this window is not penalized by $\mathfrak S_n$ unless it propagates into macroscopic spectral dimension or chemical-distance excess.

<a id="theorem-d6f2-scale-audit-sufficient-condition-for-the-global-core-competitor"></a>**Theorem D.6f.2 (Scale-Audit Sufficient Condition for the Global-Core Competitor).** Suppose that, on the selected microscopic branch, the global core-minimum class $\mathcal M_n$ satisfies:

1. a scale-audit competitor condition
$$
\inf_{\mathcal C\in\mathcal M_n}\mathfrak S_n(\mathcal C)\to0;
\tag{D.6f.5}
$$

2. a continuum-defect domination certificate with constants $A<\infty$ and $b_n\to0$,
$$
\mathfrak D_n(\mathcal C)
\le
A\,\mathfrak S_n(\mathcal C)+b_n
\qquad
\text{for every }\mathcal C\in\mathcal M_n.
\tag{D.6f.6}
$$

Then the sharp global-core competitor condition of Proposition D.6f follows:
$$
\mathfrak d_n^*\to0.
\tag{D.6f.7}
$$
Consequently the selected minimizers of Theorem D.6e have $\mathfrak D_n\to0$. The domination estimate (D.6f.6) is an explicit branch certificate; it is not derived from the definition of $\mathfrak S_n$ alone.

*Proof.* Set $A_+:=\max\{A,0\}$. Since $\mathfrak S_n\ge0$, (D.6f.6) also holds with $A_+$ in place of $A$. By (D.6f.5), for every $\epsilon>0$ and all sufficiently large $n$ there exists $\mathcal Y_n\in\mathcal M_n$ with
$$
\mathfrak S_n(\mathcal Y_n)\le\epsilon.
$$
Consequently,
$$
0\le\mathfrak d_n^*
\le\mathfrak D_n(\mathcal Y_n)
\le A_+\epsilon+b_n.
$$
Taking the upper limit as $n\to\infty$ and then letting $\epsilon\downarrow0$ gives $\mathfrak d_n^*\to0$. The final claim is Theorem D.6e applied to this conclusion. ∎

<a id="proposition-d6f2a-protocol-response-domination-criterion-for-the-global-core-competitor"></a>**Proposition D.6f.2a (Protocol-Response Domination Criterion for the Global-Core Competitor).** Let $d_{\mathrm{resp},n}$ be the declared distance between finite protocol-response presheaves. Suppose that the core potential $V_n$ factors through those responses up to $o(1)$. Assume in addition a defect-stable minimizer-selection certificate: there are nondecreasing moduli $\omega_n:[0,\infty)\to[0,\infty)$ such that
$$
\lim_{\varepsilon\downarrow0}\limsup_{n\to\infty}\omega_n(\varepsilon)=0,
$$
and whenever an admissible configuration $Y$ satisfies
$$
\inf_{Z\in\mathcal M_n}
d_{\mathrm{resp},n}(Y,Z)
\le
\varepsilon,
$$
there exists $P_nY\in\mathcal M_n$ with
$$
\mathfrak D_n(P_nY)
\le
\mathfrak D_n(Y)+\omega_n(\varepsilon).
$$
Suppose there are $D_4$ shell approximants $Y_n$ and numbers $\varepsilon_n\downarrow0$ such that
$$
\mathfrak D_n(Y_n)\to0,
\qquad
\inf_{Z\in\mathcal M_n}
d_{\mathrm{resp},n}(Y_n,Z)
\le
\varepsilon_n.
$$
Then
$$
\mathfrak d_n^*
=
\inf_{\mathcal C\in\mathcal M_n}
\mathfrak D_n(\mathcal C)
\longrightarrow0.
$$

*Proof.* Apply the selection certificate to $Y_n$ and choose $\widehat Y_n:=P_nY_n\in\mathcal M_n$. Then
$$
0
\le
\mathfrak d_n^*
\le
\mathfrak D_n(\widehat Y_n)
\le
\mathfrak D_n(Y_n)+\omega_n(\varepsilon_n).
$$
The first term on the right tends to zero by hypothesis. The modulus condition and $\varepsilon_n\downarrow0$ give $\omega_n(\varepsilon_n)\to0$ along the selected branch. Hence $\mathfrak d_n^*\to0$. ∎

<a id="theorem-d6f2b-quantitative-defect-coercivity-of-the-continuum-control-potential"></a>**Theorem D.6f.2b (Quantitative Defect Coercivity of the Continuum-Control Potential).** In the setting of Theorem D.6e, let
$$
V_{n,\min}^{\mathrm{cont}}
=
\inf_{\mathcal C}V_n^{\mathrm{cont}}(\mathcal C).
$$
Then every admissible configuration $\mathcal C$ satisfies
$$
V_n^{\mathrm{cont}}(\mathcal C)-V_{n,\min}^{\mathrm{cont}}
\ge
\lambda_{\min}\mathfrak D_n(\mathcal C)
-
\lambda_{\max}\mathfrak d_n^*.
\tag{D.6f.8}
$$
Consequently, for every $\varepsilon>0$,
$$
\mathfrak D_n(\mathcal C)
\ge
\frac{\lambda_{\max}}{\lambda_{\min}}\mathfrak d_n^*+\varepsilon
\quad\Longrightarrow\quad
V_n^{\mathrm{cont}}(\mathcal C)-V_{n,\min}^{\mathrm{cont}}
\ge
\lambda_{\min}\varepsilon.
\tag{D.6f.9}
$$

*Proof.* By definition,
$$
V_n^{\mathrm{cont}}(\mathcal C)
=
V_n(\mathcal C)
+
\sum_{\bullet}
\lambda_\bullet\mathfrak D_{n,\bullet}(\mathcal C),
$$
where the four defects are the Bakry-Émery, finite-core, recovery, and rigidity defects. Since $V_n(\mathcal C)\ge\min V_n$ and each defect is nonnegative,
$$
V_n^{\mathrm{cont}}(\mathcal C)
\ge
\min V_n+\lambda_{\min}\mathfrak D_n(\mathcal C).
\tag{D.6f.10}
$$
For every $\eta>0$, choose $\mathcal Y_n\in\mathcal M_n$ with
$$
\mathfrak D_n(\mathcal Y_n)\le\mathfrak d_n^*+\eta.
$$
Then
$$
V_{n,\min}^{\mathrm{cont}}
\le
V_n^{\mathrm{cont}}(\mathcal Y_n)
=
\min V_n+
\sum_{\bullet}
\lambda_\bullet\mathfrak D_{n,\bullet}(\mathcal Y_n)
\le
\min V_n+\lambda_{\max}(\mathfrak d_n^*+\eta).
\tag{D.6f.11}
$$
Subtracting (D.6f.11) from (D.6f.10) and sending $\eta\downarrow0$ gives (D.6f.8). Equation (D.6f.9) follows immediately by substituting the displayed lower bound on $\mathfrak D_n(\mathcal C)$ into (D.6f.8). ∎

<a id="corollary-d6f2c-no-continuum-limit-with-persistent-positive-defect"></a>**Corollary D.6f.2c (No Continuum Limit with Persistent Positive Defect).** Suppose $\mathfrak d_n^*\to0$ and $\mathcal C_n$ is any sequence with
$$
V_n^{\mathrm{cont}}(\mathcal C_n)-V_{n,\min}^{\mathrm{cont}}\to0.
$$
Then
$$
\mathfrak D_n(\mathcal C_n)\to0.
\tag{D.6f.12}
$$
Thus a selected operational-continuum branch cannot retain persistent positive Bakry-Émery, finite-core, recovery, or rigidity defect while also remaining asymptotically PCE-minimal.

*Proof.* Rearranging (D.6f.8) gives
$$
\lambda_{\min}\mathfrak D_n(\mathcal C_n)
\le
V_n^{\mathrm{cont}}(\mathcal C_n)-V_{n,\min}^{\mathrm{cont}}
+
\lambda_{\max}\mathfrak d_n^*.
$$
The two terms on the right tend to zero by hypothesis. Since $\lambda_{\min}>0$, (D.6f.12) follows. ∎

<a id="corollary-d6f2d-bravais-candidates-carry-a-persistent-rigidity-defect"></a>**Corollary D.6f.2d (Bravais Candidates Carry a Persistent Rigidity Defect).** In Theorem D.6e compute the rigidity defect $\mathfrak H_n$ from the rescaled propagation-cost metric (64). Let $\mathcal Y_n$ be induced subgraphs of Bravais networks of Theorem C.6c.1 in $\mathbb R^4$ whose triples $(\Lambda,S,c)$ range over a finite set, with $\delta_n\to0$ and with vertex sets containing $\delta_n\Lambda\cap B_{R_n}(x_n)$ for radii $R_n\to\infty$ in the norm $\|\cdot\|_{S,c}$ about admitted chart centers $x_n$. Then
$$
\liminf_{n\to\infty}\mathfrak D_n(\mathcal Y_n)
\ge
\liminf_{n\to\infty}\mathfrak H_n(\mathcal Y_n)
\ge
\min_{(\Lambda,S,c)}g_{S,c}^2>0.
\tag{D.6f.13}
$$
Hence no such sequence has vanishing continuum defect, and by Proposition D.6f no such sequence in $\mathcal M_n$ witnesses the competitor condition (D.6f.1). For the candidate $\delta_nD_4$ of Corollary 43.5a with uniform root-edge costs, $g_{S,c}$ is the Gromov–Hausdorff distance between the unit ball of the $24$-cell norm $\max(\|u\|_\infty,\frac12\|u\|_1)$ and the Euclidean unit ball, and item 4 of $\mathfrak Z_{\mathrm{cont}}$ fails for that candidate under the metric (64). A zero-defect global-core competitor in the sense of Proposition D.6f therefore lies outside this class of Bravais sequences.

*Proof.* The defect $\mathfrak D_n$ is a sum of nonnegative terms that includes $\mathfrak H_n$, and (D.6e.4) is at least the square of its Gromov–Hausdorff term at any admitted center and radius $r$. For large $n$, Theorem C.6c.1 item 1 shows that the truncation leaves the distances on the audited ball unchanged, and item 3 bounds the Gromov–Hausdorff term below by $g_{S,c}-o(1)$ for the triple used at level $n$; the finite set of triples gives (D.6f.13). Proposition D.6f characterizes (D.6f.1) by the existence of a sequence in $\mathcal M_n$ with $\mathfrak D_n\to0$, which (D.6f.13) excludes for these sequences. Theorem C.6c.1 item 5 identifies the $D_4$ norm, and the Gromov–Hausdorff lower bound at every radius contradicts the $o(1)$ distance from Euclidean charts required by item 4 of $\mathfrak Z_{\mathrm{cont}}$. ∎

<a id="theorem-d6f2e-finite-point-sampling-recovery-obstruction"></a>**Theorem D.6f.2e (Finite Point-Sampling Recovery Obstruction).** Let $(M,g)$ be a compact connected smooth boundaryless Riemannian manifold of positive dimension and diameter $D$, and let $m$ be a positive finite measure absolutely continuous with respect to Riemannian volume. Put
$$
\mathcal E(f)=c_E\int\langle A\nabla f,\nabla f\rangle_gdm,
\qquad c_E>0,\quad A\succeq\alpha I,\quad\alpha>0,\quad A\in L^\infty(m).
$$
For every nonempty finite sample set $S_n$, point-sampling map $E_n$ and discrete energy with $\mathcal E_n(0)=0$,
$$
\sup_{\operatorname{Lip}(f)+\|f\|_\infty\le1}
|\mathcal E_n(E_nf)-\mathcal E(f)|
\ge\frac{c_E\alpha m(M)}{(1+D)^2}.
\tag{D.6f.2e.1}
$$
Here $\operatorname{Lip}$ is the seminorm; if the displayed Lipschitz norm already includes the sup norm, replace $1+D$ by $1+2D$.

*Proof.* The distance $d_n(x)=d_g(x,S_n)$ is $1$-Lipschitz, bounded by $D$ and zero at the samples. At every differentiability point $x\notin S_n$, choose a nearest sample and a minimizing unit-speed geodesic of length $l=d_n(x)$ ending at $x$. Along its final backwards segment, the Lipschitz bound and comparison with that sample give $d_n(\gamma(l-t))=l-t$. Its directional derivative has magnitude one, so $|\nabla d_n|=1$. Rademacher differentiability and absolute continuity make this an $m$-almost-everywhere statement. The function $d_n/(1+D)$ is admissible, samples to zero and has the energy lower bound (D.6f.2e.1). ∎

For the flat unit $d$-torus grid of spacing $1/N$, the smooth witness $f_N(x)=\sin(2\pi Nx_1)/(2\pi N+1)$ also samples to zero and has $\operatorname{Lip}(f_N)+\|f_N\|_\infty=1$, while
$$
\frac12\int|\nabla f_N|^2dx=\frac{(2\pi N)^2}{4(2\pi N+1)^2}\longrightarrow\frac14.
$$
Thus a smoothness label without a uniform higher-order restriction leaves the uniform recovery obstruction present.

<a id="theorem-d6f2f-sharp-finite-linear-information-energy-obstruction"></a>**Theorem D.6f.2f (Sharp Finite-Linear-Information Energy Obstruction).** On the unit flat torus $\mathbb T^d$, $d\ge1$, set
$$
\mathcal B=\{f\in C^\infty(\mathbb T^d;\mathbb R):\operatorname{Lip}(f)+\|f\|_\infty\le1\},
\qquad\mathcal E(f)=\frac12\int|\nabla f|^2dx.
$$
For every finite list of real linear functionals $\ell_1,\ldots,\ell_r$ on $C^\infty$, put $Af=(\ell_j(f))_j$. The functionals may be discontinuous. Then
$$
\sup_{f\in\mathcal B,\ Af=0}\mathcal E(f)=\frac12.
\tag{D.6f.2f.1}
$$
For every scalar decoder $D:\mathbb R^r\to\mathbb R$ with $D(0)=0$, its worst-case absolute energy error is at least $1/2$, attained as a minimax value by $D=0$. Over arbitrary scalar decoders the minimax error is exactly $1/4$.

The same lower bounds hold for a deterministic adaptive linear-query algorithm that terminates after finitely many queries on zero, when all its queries, stopping decisions and output depend solely on previous query values and fixed algorithm data. The $1/2$ bound requires zero output on zero; the $1/4$ bound allows any finite output there.

*Proof.* For any real $r\times m$ matrix $B$, $m>r$, the cube section $\ker B\cap[-1,1]^m$ has an extreme point $a$. If more than $\operatorname{rank}B$ coordinates are nonsaturated, the corresponding columns have a dependence supported on those coordinates, allowing two opposite small motions inside the section and contradicting extremality. Therefore $Ba=0$, $\|a\|_\infty\le1$ and $\sum_ja_j^2\ge m-r$.

For every $\varepsilon>0$ choose $\psi\in C_c^\infty((0,1)^d)$ with $\|\nabla\psi\|_\infty\le1$, $\|\psi\|_\infty\le1/2$ and $\kappa:=\int|\nabla\psi|^2\ge1-\varepsilon$. Write $d_\partial$ for the cube's distance-to-boundary function, take $(d_\partial-b)_+$ with $0<b<1/2$, extend it by zero, and convolve with a nonnegative unit-integral smooth kernel of radius less than $b/2$: before mollification its gradient energy is $(1-2b)^d$, convolution preserves the two sup bounds, and its gradients converge in $L^2$ as the smoothing radius tends to zero.

Partition the torus into $m=q^d>r$ cubes of side $h=1/q$. In cube $j$ place $\psi_j(x)=h\psi((x-x_j)/h)$, extended by zero. These smooth functions have disjoint supports. Apply the cube-section result to $B_{ij}=\ell_i(\psi_j)$ and define
$$
f=\frac1{1+h/2}\sum_ja_j\psi_j.
$$
Then $Af=0$, its gradient and sup bounds sum to at most one, and
$$
\mathcal E(f)=\frac{\kappa\sum_ja_j^2}{2m(1+1/(2q))^2}
\ge\frac{1-\varepsilon}{2(1+1/(2q))^2}\left(1-\frac r{q^d}\right).
\tag{D.6f.2f.2}
$$
Let $q\to\infty$ and then $\varepsilon\downarrow0$. All energies are at most $1/2$, proving (D.6f.2f.1). This is a supremum statement. It does not require a maximizer.

The zero-information fiber contains zero and functions with energies approaching $1/2$. If $z=D(0)$, its worst error is at least $\max(|z|,|z-1/2|)\ge1/4$. The constant decoder $1/4$ attains that bound since all energies lie in $[0,1/2]$; for $z=0$ the corresponding sharp bound is $1/2$. For an adaptive algorithm, record the finite query list on zero and use that list as $A$. Every witness in its zero fiber follows the identical deterministic transcript by induction, so it stops with the same output and obeys the same bound. ∎

Replacing the normalization by $\operatorname{Lip}(f)+2\|f\|_\infty\le1$ leaves both sharp constants unchanged: replace $1+h/2$ by $1+h$ in the witnesses. The theorem covers linear information including point values, cell averages, moments, Fourier coefficients and derivative samples on their declared smooth domain. Its deterministic quantifiers do not cover randomized information with a different input/seed order, and nonlinear measurement of the energy itself belongs to a different information class. If (D.6e.3) uses this full ball, finite linear $E_n$ and a quadratic discrete energy, its recovery defect is at least $1/2$ at every resolution, independently of Bravais geometry or global-core selection.

<a id="proposition-d6f2g-exact-finite-core-rank-test"></a>**Proposition D.6f.2g (Exact Finite-Core Rank Test).** At a finite resolution let $H_n$ be the full real vertex-function space with positive node masses and a nonnegative quadratic energy. If $\mathcal L_n^{(2)}\subset H_n$ in (D.6e.2) is a linear subspace, then
$$
\mathfrak C_n=\begin{cases}0,&\mathcal L_n^{(2)}=H_n,\\1,&\mathcal L_n^{(2)}\ne H_n.\end{cases}
$$
Consequently $\mathfrak C_n\to0$ holds exactly when these linear cores span the whole finite function space eventually.

*Proof.* The norm $\|u\|_*^2=\|u\|_{L^2(\mu_n)}^2+\mathcal E_n(u)$ is an inner-product norm. For a proper subspace choose a $*$-orthogonal unit vector $u$. Pythagoras gives $\inf_{v\in\mathcal L_n^{(2)}}\|u-v\|_*^2=1$, while choosing $v=0$ bounds the supremum by one. The full-subspace case gives zero. A sequence taking values in $\{0,1\}$ tends to zero exactly when it is eventually zero. ∎

<a id="theorem-d6f2h-uniform-recovery-on-energy-compact-cores"></a>**Theorem D.6f.2h (Uniform Recovery on Energy-Compact Cores).** Let $P_N$ retain Fourier modes $|k|_\infty\le N$ on $\mathbb T^d$, and let $\mathcal K\subset H^1(\mathbb T^d)$ be $L^2$-bounded. The following are equivalent: $\mathcal K$ is relatively compact in $H^1$; the field errors $\|P_Nf-f\|_2$ and energy errors $|\mathcal E(P_Nf)-\mathcal E(f)|$ tend to zero uniformly on $\mathcal K$; and
$$
\sup_{f\in\mathcal K}\sum_{|k|_\infty>N}(1+4\pi^2|k|^2)|\widehat f(k)|^2\longrightarrow0.
\tag{D.6f.2h.1}
$$
On the envelope $\sum_k(1+4\pi^2|k|^2)^{1+s}|\widehat f(k)|^2\le R^2$, $s>0$, put $b_N=1+4\pi^2(N+1)^2$. The common finite Fourier-information map has
$$
\|P_Nf-f\|_2\le Rb_N^{-(1+s)/2},\qquad
0\le\mathcal E(f)-\mathcal E(P_Nf)\le\tfrac12R^2b_N^{-s}.
\tag{D.6f.2h.2}
$$

*Proof.* Parseval identifies the tail in (D.6f.2h.1) with
$$
\|P_Nf-f\|_{H^1}^2=\|P_Nf-f\|_2^2+2[\mathcal E(f)-\mathcal E(P_Nf)].
$$
Both summands are nonnegative. On a compact $H^1$ closure the contractions $I-P_N$, converging pointwise to zero, converge uniformly by a finite-net argument. Conversely uniformly small tails approximate the family in $H^1$ by a finite-dimensional projected set; its coefficients are bounded by the assumed $L^2$ bound, so it is precompact. Finite nets prove total boundedness and hence relative compactness. Each omitted frequency has $|k|\ge N+1$, giving (D.6f.2h.2) by comparison of Fourier weights. ∎

<a id="proposition-d6f2i-bounded-hessian-point-sampling-recovery"></a>**Proposition D.6f.2i (Bounded-Hessian Point-Sampling Recovery).** On the unit torus let $h=1/N$, let $E_h$ sample the vertices of the cubic grid, and let $I_h$ interpolate constantly on its half-open cells. Define
$$
\mathcal E_h(v)=\frac{h^d}{2}\sum_x\sum_{i=1}^d
\left(\frac{v(x+he_i)-v(x)}h\right)^2.
$$
Uniformly for $C^2$ functions with $\|\nabla f\|_\infty\le L$ and $\|D^2f\|_{\mathrm{op},\infty}\le H$,
$$
\|I_hE_hf-f\|_2\le\sqrt dLh,\qquad
|\mathcal E_h(E_hf)-\mathcal E(f)|
\le\frac{3\sqrt d}{2}LHh+\frac d8H^2h^2.
\tag{D.6f.2i.1}
$$

*Proof.* Cell diameter gives the first bound. Each difference quotient differs from $\partial_if$ by at most $Hh/2$, so the vector error is at most $\sqrt dHh/2$. Expanding its squared norm bounds half the pointwise squared-gradient error by $\sqrt dLHh/2+dH^2h^2/8$. The gradient of $|\nabla f|^2/2$ has norm at most $LH$, so vertex quadrature contributes at most $\sqrt dLHh$. Summation proves the energy bound. ∎

Theorems D.6f.2e–D.6f.2f decide the full-ball finite-information route negatively. Propositions D.6f.2g and D.6f.2i and Theorem D.6f.2h give exact tests and affirmative recovery maps for separately specified cores. The admitted meaning of $\mathcal C_{\mathrm{Lip}}$, its norm, and the local-polynomial support/gluing rules in (D.6e.2)–(D.6e.3) determine which result applies. Theorem D.6f.2m supplies a common sequence in $\mathcal M_n=\arg\min V_n$ with all four defects tending to zero, the common metric/Mosco comparisons and source/response ownership on its registered compact normal-source branch. These recovery theorems supply their own stated test classes without replacing the governing definition.

**Protocol binding of the recovery and core defects.** Equations (D.6e.2)–(D.6e.3) require a branch record fixing the continuum test domain and its norm, every component of $E_n$, the cell partition and interpolation normalization, and the extension and gluing rules for the local polynomial generators. Definition F.10.4a.4.2 supplies a finite-band cell-sampling protocol, and Definition 46f retains that band on its own certificate. Their sampling map becomes the $E_n$ of (D.6e.3) only through a declared identification of domains, measures, coordinates and responses. Definitions F.0c, F.10.4g.1 and F.10.4g.3 retain the D.6e defects, the interpolation/Mosco records and the required carré-du-champ closure; their branch instance must identify the same test and assembly data. Definition P.6.1b.1 specifies finite outcome distributions; finiteness of their outcome sets supplies neither linearity in a continuum test field nor the full smooth Lipschitz ball.

On a branch whose tests contain the normalized real smooth Lipschitz ball of Theorem D.6f.2f on the unit flat torus, whose candidate energy is $\frac12\int|\nabla f|^2dx$, and whose $E_n$ consists of finitely many real linear functionals, that theorem gives $\mathfrak R_n\ge\frac12$. Indeed the discrete quadratic energy is a zero-preserving scalar decoder of $E_nf$, and the interpolation error is nonnegative. Therefore $\mathfrak D_n\ge\frac12$ on every configuration satisfying those premises. If all members of $\mathcal M_n$ satisfy them, then $\mathfrak d_n^*\ge\frac12$ and the competitor condition (D.6f.1) fails. The norm convention with an additional sup-norm term has the same sharp bound by Theorem D.6f.2f. A smaller independently declared test class is decided using its own information map and recovery estimates.

<a id="proposition-d6f2j-polynomial-core-assembly-and-gluing-rank"></a>**Proposition D.6f.2j (Polynomial-Core Assembly and Gluing Rank).** Fix a finite vertex set $V$, positive node masses, a nonnegative quadratic energy, and local coordinate patches. List the monomials of degree at most two on each patch. Let $c\in\mathbb R^m$ be their combined coefficient vector, let $Gc=0$ be the declared homogeneous linear gluing constraints, and let $Ac\in\mathbb R^V$ be the declared assembled vertex values. Thus the nominated linear core is
$$
\mathcal L=A\ker G.
$$
Then its exact dimension and finite-core defect are
$$
\dim\mathcal L
=\operatorname{rank}\begin{pmatrix}G\\ A\end{pmatrix}
-\operatorname{rank}G,
\qquad
\mathfrak C=0
\quad\Longleftrightarrow\quad
\operatorname{rank}\begin{pmatrix}G\\ A\end{pmatrix}
-\operatorname{rank}G=|V|.
$$
Otherwise $\mathfrak C=1$. These ranks are invariant under invertible changes of local polynomial basis and under insertion of redundant gluing equations.

The following two support/gluing specifications give different answers on the same local $D_4$ polynomial data. They are separately specified cores. Put
$$
\Lambda=D_4=\{z\in\mathbb Z^4:\textstyle\sum_i z_i\in2\mathbb Z\},
\qquad
S=\{\pm e_i\pm e_j:i<j\},
\qquad V_N=\Lambda/N\Lambda,
\quad N\ge7.
$$
Use the root Cayley graph, $B_1=\{0\}\cup S$, $B_2=B_1\cup(S+S)$, and the ordered monomials
$$
b(u)=(1,u_1,u_2,u_3,u_4,u_1^2,u_1u_2,u_1u_3,u_1u_4,
 u_2^2,u_2u_3,u_2u_4,u_3^2,u_3u_4,u_4^2).
$$
There are $|V_N|=N^4$ vertices, $|B_1|=25$ and $|B_2|=169$.

1. **Compatible local sections.** At each $x\in V_N$ assign $p_x(u)=b(u)c_x$ on $x+B_2$. For every $r\in S$ and $u\in B_2\cap(r+B_2)$ impose
   $$
   b(u)c_x-b(u-r)c_{x+r}=0.
   $$
   These are the rows of $G_N$; set $(A_Nc)_x=c_{x,0}$. Then
   $$
   \operatorname{rank}G_N=15N^4-1,
   \qquad
   \operatorname{rank}\begin{pmatrix}G_N\\A_N\end{pmatrix}=15N^4,
   \qquad
   \mathcal L_N=\operatorname{span}\{1\},
   \qquad\mathfrak C_N=1.
   $$

2. **Localized polynomial generators.** Set $G_N=0$ and
   $$
   (A_N)_{v,(x,\alpha)}
   =\mathbf1_{B_1}(v-x)(v-x)^\alpha,
   \qquad |\alpha|\le2,
   $$
   using the unique $B_1$ lift where the indicator is nonzero. This specifies a radius-one cutoff inside each radius-two patch and imposes no coefficient agreement between patches. Then
   $$
   \operatorname{rank}A_N=N^4,
   \qquad\mathcal L_N=\mathbb R^{V_N},
   \qquad\mathfrak C_N=0.
   $$

*Proof.* The kernel of $A$ restricted to $\ker G$ is $\ker\binom GA$. Rank-nullity gives
$$
\dim A\ker G
=(m-\operatorname{rank}G)
-\left(m-\operatorname{rank}\begin{pmatrix}G\\A\end{pmatrix}\right).
$$
Proposition D.6f.2g now gives the stated defect. Basis changes preserve both the represented subspace and the displayed rank difference, and redundant equations preserve $\ker G$.

For the lattice specifications, $\Lambda$ has rank four, so its quotient by $N\Lambda$ has $N^4$ vertices. Two distinct lifts in any translate of $B_2$ differ by a vector of graph length at most four. Every nonzero $N\lambda$, $\lambda\in\Lambda$, has root-graph length at least $N$: each root changes a coordinate by at most one, and $\lambda$ has a nonzero integer coordinate. Thus the chosen patches have unique lifts for $N\ge7$. The squared Euclidean lengths in $B_2$ are $0,2,4,6,8$ with multiplicities $1,24,24,96,24$, giving $169$ vertices. The nonzero types are the roots, $(\pm2,0,0,0)$ and $(\pm1,\pm1,\pm1,\pm1)$, permutations of $(\pm2,\pm1,\pm1,0)$, and permutations of $(\pm2,\pm2,0,0)$.

The set $B_1$ is unisolvent for degree-two polynomials. To prove this, let $p(u)=a+b\cdot u+u^{\mathsf T}Cu$, with $C$ symmetric, vanish on $B_1$. Evaluation at zero gives $a=0$. Subtraction at opposite roots gives $b\cdot r=0$ for every root $r$, hence $b=0$ because the roots span $\mathbb R^4$. Subtracting the values at $e_i+e_j$ and $e_i-e_j$ gives $4C_{ij}=0$. Their common zero value gives $C_{ii}+C_{jj}=0$ for all $i\ne j$. Three distinct indices force every diagonal entry to vanish. Consequently $p=0$.

For neighboring centers $x$ and $x+r$, the overlap of their radius-two balls contains $x+B_1$, since every point of $x+B_1$ is at graph distance at most two from $x+r$. Therefore compatibility identifies their degree-two polynomials in the same lifted ambient coordinates. Pull the coefficient field back from $V_N$ to $\Lambda$. Connectedness of the root graph and unisolvence show that all lifted polynomials are one polynomial $P(t)$ on $\mathbb R^4$. For $\lambda\in\Lambda$, the coefficients at $x$ and $x+N\lambda$ agree in their local coordinates; hence
$$
P(t+N\lambda)=P(t).
$$
A quadratic polynomial with four independent periods is constant. Explicitly, write $P(t)=a+b\cdot t+t^{\mathsf T}Ct$; its difference under a period $h$ is $b\cdot h+2t^{\mathsf T}Ch+h^{\mathsf T}Ch$. Vanishing for four spanning periods gives $C=0$ and then $b=0$. Constant coefficient fields satisfy all constraints. Thus $\ker G_N$ is one-dimensional and its image under $A_N$ is the constants, proving both displayed ranks and item 1.

For item 2 use on the patch at $x$ the polynomial
$$
q_x(v)=1-\frac12|v-x|^2.
$$
Its product with $\mathbf1_{x+B_1}$ equals the nodal vector $\delta_x$: its value at the center is one and its value at every root neighbor is zero. Every nodal vector therefore belongs to the core, giving full rank and item 2. Finite graph functions have finite graph Lipschitz constants on every fixed graph with positive edge lengths, so both cores satisfy that finite-resolution description. ∎

<a id="theorem-d6f2k-sharp-zero-field-stability-obstruction"></a>**Theorem D.6f.2k (Sharp Zero-Field Stability Obstruction).** On the full smooth Lipschitz ball \(\mathcal B\) and energy \(\mathcal E\) of Theorem D.6f.2f, let \(F:\mathcal B\to\mathbb R\) be any map continuous at zero for the uniform norm. Its information need not be linear or finite dimensional. Then
\[
 \sup_{f\in\mathcal B}|F(f)-\mathcal E(f)|\ge\frac14,
 \qquad
 F(0)=0\ \Longrightarrow\ 
 \sup_{f\in\mathcal B}|F(f)-\mathcal E(f)|\ge\frac12.
 \tag{D.6f.2k.1}
\]
Both constants are sharp within their respective classes.

The same constants hold for expected absolute error of a finite-outcome randomized experiment. Precisely, let \(p_f\) be its complete outcome law on a fixed finite set, with \(\|p_f-p_0\|_{\rm TV}\to0\) whenever \(f\in\mathcal B\) tends uniformly to zero, and let \(Z\) be any fixed real decoder of the complete outcome. Then
\[
 \sup_{f\in\mathcal B}\mathbb E_{p_f}|Z-\mathcal E(f)|\ge\frac14.
 \tag{D.6f.2k.2}
\]
If \(Z=0\) almost surely under \(p_0\), the bound is \(1/2\). This includes every fixed finite adaptive quantum instrument whose input states \(\rho_f\) satisfy \(\|\rho_f-\rho_0\|_1\to0\) under that uniform convergence; all ancillary preparation is independent of \(f\), and the complete output includes the adaptive transcript.

*Proof.* On the unit circle put \(g(t)=\operatorname{dist}(t,\mathbb Z)\). It is periodic, \(1\)-Lipschitz, bounded by \(1/2\), and \(|g'|=1\) almost everywhere. Periodic convolution with a nonnegative smooth unit-integral kernel gives smooth \(g_\varepsilon\) with the same two bounds and
\[
 \int_0^1|g'_\varepsilon|^2dt\longrightarrow1
 \quad(\varepsilon\downarrow0).
\]
For integers \(q\to\infty\), choose \(\varepsilon_q\downarrow0\) and set
\[
 f_q(x)=\frac{g_{\varepsilon_q}(qx_1)}{q(1+1/(2q))}.
 \tag{D.6f.2k.3}
\]
These are real smooth periodic functions. Their Lipschitz and sup-norm bounds sum to at most one, \(\|f_q\|_\infty\to0\), and periodic change of variables gives
\[
 \mathcal E(f_q)
 =\frac{\int_0^1|g'_{\varepsilon_q}|^2dt}
 {2(1+1/(2q))^2}\longrightarrow\frac12.
\]
Writing \(z=F(0)\), continuity gives \(F(f_q)\to z\). The error at zero and the limiting error on this sequence therefore bound the supremum below by
\(\max\{|z|,|z-1/2|\}\ge1/4\), and by \(1/2\) when \(z=0\).

For the randomized statement, finiteness of the output set and convergence in total variation give
\[
 \mathbb E_{p_{f_q}}|Z-\mathcal E(f_q)|
 \longrightarrow\mathbb E_{p_0}|Z-1/2|.
\]
The pointwise triangle inequality
\(|Z|+|Z-1/2|\ge1/2\) makes at least one of the error at zero and this limit at least \(1/4\). If \(Z=0\) under \(p_0\), the limit is \(1/2\). The constant decoders \(Z=1/4\) and \(Z=0\) attain these bounds, since \(0\le\mathcal E(f)\le1/2\) throughout \(\mathcal B\).

A fixed finite adaptive instrument, including all branches and retained records, is one quantum-to-classical channel. Trace-distance contractivity bounds its output total variation by \(\tfrac12\|\rho_f-\rho_0\|_1\); adjoining a fixed ancillary state preserves that trace distance. This proves the stated quantum specialization. The same proof works for \(\operatorname{Lip}(f)+2\|f\|_\infty\le1\), replacing the denominator in (D.6f.2k.3) by \(q(1+1/q)\). ∎

The same witnesses give a quantitative necessary response separation without a continuity assumption. If any finite-outcome experiment and fixed decoder have expected absolute energy error at most \(\varepsilon\) throughout \(\mathcal B\), then along the witnesses \(f_j\) of (D.6f.2k.3), taken at \(q=j\to\infty\),
\[
 \liminf_{j\to\infty}\|p_{f_j}-p_0\|_{\rm TV}
 \ge\max\{0,1-4\varepsilon\}.
 \tag{D.6f.2k.4}
\]
If its decoder is zero almost surely under \(p_0\), replace \(1-4\varepsilon\) by \(1-2\varepsilon\). Indeed clip the decoder to \([0,1/2]\), which improves every absolute error, and compare its two expectations: their difference is at least \(\mathcal E(f_j)-2\varepsilon\), or \(\mathcal E(f_j)-\varepsilon\) in the zero-output case, while it is at most half the total variation. Thus a uniformly accurate nonlinear energy port must keep these uniformly vanishing fields operationally separated from zero.

For a branch using the full ball, a quadratic discrete energy and an information map \(E_n\) continuous at zero from the uniform norm into the finite graph space, \(F_n=\mathcal E_n\circ E_n\) satisfies the theorem. If \(E_n0=0\), the recovery defect (D.6e.3) obeys \(\mathfrak R_n\ge1/2\). This applies to nonlinear maps as well as linear ones. Theorem D.6f.2f separately covers its finite linear information maps without this continuity hypothesis.

<a id="theorem-d6f2l-exact-nonlinear-energy-completing-recovery-on-the-varying-stencil-graph"></a>**Theorem D.6f.2l (Exact Nonlinear Energy-Completing Recovery on the Varying-Stencil Graph).** Use the very same graphs, masses, rates, forms and cell interpolation of Theorem C.6c.4 with \(\theta=1/2\); write \(\mathcal E_n\) for the graph form and \(I_n\) for constant interpolation on the half-open grid cells. Let \(n\) be an admitted odd level and \(q=(n-1)/2\). Use the product Fejer operator
\[
 J_qf=\sum_{k\in\mathbb Z^4}w_q(k)\widehat f(k)e^{2\pi ik\cdot x},\qquad
 w_q(k)=\prod_{i=1}^4(1-|k_i|/q)_+.
\]
Its support is \(|k|_\infty\le q-1\). Put
\[
 \kappa_n=(q,0,0,0),\quad
 z_n(x)=\sqrt2\cos(2\pi qx_1),\quad
 \Lambda_n=\lambda_n(\kappa_n),
 \tag{D.6f.2l.1}
\]
where \(\lambda_n\) is the actual varying-stencil eigenvalue (C.6c.4.7), not the nearest-neighbor eigenvalue. Let \(S_n\) denote evaluation of trigonometric polynomials on the graph. For every real \(f\in H^1(\mathbb T^4)\), define
\[
 \begin{split}
 u_n(f)&=S_nJ_qf,\\
 r_n(f)&=\mathcal E(f)-\mathcal E_n(u_n(f)),\\
 T_nf&=u_n(f)+\sqrt{2r_n(f)/\Lambda_n}\,S_nz_n.
 \end{split}
 \tag{D.6f.2l.2}
\]
This is a finite-information nonlinear map: its information consists of the finitely many retained real Fourier coefficients and the single scalar \(\mathcal E(f)\). Its residual is nonnegative, \(T_n0=0\), and
\[
 \mathcal E_n(T_nf)=\mathcal E(f).
 \tag{D.6f.2l.3}
\]
Uniformly on the entire set \(\{f\in H^1(\mathbb T^4;\mathbb R):\|\nabla f\|_2\le1\}\),
\[
 \|I_nT_nf-f\|_2
 \le \frac2n+\frac1{\pi q}+\frac1{\sqrt8\,q}.
 \tag{D.6f.2l.4}
\]
In particular the original normalized full smooth Lipschitz ball is retained, and its recovery supremum with this map is \(O(n^{-1})\). The forms and comparison topology are unchanged, so the weak Mosco liminf and energy-plus-norm equicoercivity are precisely those of Theorem C.6c.4. For every Lipschitz input, the output additionally obeys
\[
 \operatorname{Lip}_{d_n}(T_nf)\le(1+\pi)\operatorname{Lip}_{d_0}(f).
 \tag{D.6f.2l.5}
\]
Thus the normalized full Lipschitz ball has a uniform graph-Lipschitz output bound, without imposing an output normalization absent from (D.6e.3).

*Proof.* Discrete Fourier orthogonality makes \(S_n\) an isometry on the centered frequency box \(\{-q,\ldots,q\}^4\). The two frequencies of \(z_n\) lie outside the retained box, and \(S_nz_n\) has graph \(L^2\) norm one. It is an eigenvector of the actual graph generator, energy-orthogonal to \(u_n(f)\). By (C.6c.4.7), with \(\theta=1/2\),
\[
 8|k|^2\le\lambda_n(k)\le4\pi^2|k|^2.
\]
Since \(0\le w_q(k)\le1\), consequently \(\mathcal E_n(u_n(f))\le\mathcal E(J_qf)\le\mathcal E(f)\), proving nonnegativity of the residual, and \(\Lambda_n\ge8q^2>0\). Orthogonality now gives
\[
 \mathcal E_n(T_nf)
 =\mathcal E_n(u_n(f))
 +\frac{2r_n(f)}{\Lambda_n}\frac{\Lambda_n}2
 =\mathcal E(f).
\]

For \(g=J_qf\), the elementary product bound gives
\[
 0\le1-w_q(k)\le\sum_i\min\{|k_i|/q,1\}
 \le\frac{2|k|}{q}.
\]
Parseval therefore yields \(\|g-f\|_2\le\|\nabla f\|_2/(\pi q)\).
For each \(t\in[0,1/n)^4\), discrete Fourier orthogonality applied to \(g(\cdot+t)-g\) yields
\[
 n^{-4}\sum_{x\in X_n}|g(x+t)-g(x)|^2
 =\sum_k|\widehat g(k)|^2|e^{2\pi ik\cdot t}-1|^2
 \le |t|^2\|\nabla g\|_2^2.
\]
Integrating over the cell offsets against \(n^4dt\), and using \(|t|\le2/n\), proves
\(\|I_nS_ng-g\|_2\le(2/n)\|\nabla g\|_2\).
Finally \(r_n(f)\le\mathcal E(f)\le1/2\), and the cell interpolation is an isometry, so the correcting mode has interpolated norm at most \(\Lambda_n^{-1/2}\le(\sqrt8\,q)^{-1}\). The triangle inequality proves (D.6f.2l.4).

The multiplier \(w_q\) is convolution with the product of the nonnegative unit-integral kernels
\(q^{-1}|\sum_{j=0}^{q-1}e^{2\pi ijt}|^2\). Hence \(\operatorname{Lip}(J_qf)\le\operatorname{Lip}(f)\). Since \(d_n\ge d_0\), sampling does not increase this Lipschitz seminorm. The correcting mode has graph Lipschitz seminorm at most its Euclidean bound
\[
 2\pi q\sqrt2\sqrt{2r_n(f)/\Lambda_n}
 \le 2\pi q\sqrt2\frac{\|\nabla f\|_2}{\sqrt{8}q}
 \le\pi\operatorname{Lip}(f).
\]
Adding the two bounds proves (D.6f.2l.5). ∎

The nonlinear scalar in (D.6f.2l.2) is explicit information, not an energy computed from the retained linear coefficients. For each fixed \(n\), the witnesses \(f_j\) of (D.6f.2k.3) have retained coefficients tending to zero and \(r_n(f_j)\to1/2\); hence \(T_nf_j\to\Lambda_n^{-1/2}S_nz_n\ne0\). The map therefore fails exactly the zero-field continuity required by Theorem D.6f.2k. A source realizing this information must provide that additional energy response on its declared input domain; the finite field-table interface, the local-polynomial assembly and the core potential \(V_n\) are unchanged by the construction.

<a id="theorem-d6f2m"></a>

<a id="theorem-d6f2m-a-registered-normal-source-global-core-competitor"></a>**Theorem D.6f.2m (A Registered Normal-Source Global-Core Competitor).** There is an explicitly registered normal-source branch in the sense of Definition D.1f and Theorem D.1g, using the complete reservation potential of Theorem F.1c.5a, for which one common source sequence belongs exactly to the branch minimum classes $M_n=\operatorname{argmin}V_n$ and has all four defects of Theorem D.6e tending to zero. The minimum class is $\{(g,m):g\in G_n\}$: it contains every admitted metric, and the sequence is its flat member $g=I$. The sequence has the common metric/measure, Mosco/Cheeger, compactness, response and complete resource records specified below. Its recovery domain is the compact regular controller domain of Lemma F.1c.14, a proper subclass of the full smooth Lipschitz ball. The minimizers are exact for the admitted normal inner sources at each finite graph resolution; their finite Hermite approximants and other hardware architectures have their own potentials.

#### D.6f.2m — Fixed data and actual graph formulas

Retain the entire original compact uniformly elliptic unimodular metric-controller family $G_{n}$ of Lemma F.1c.13 and regular forecast family $F_{n}$ of Lemma F.1c.14, with constant mean $m$ admitted for every $g$ and the zero log-metric ($g=I$) admitted. All their original $(g,\phi)$ comparators remain. At stage $n$, these are finite real normal-controller prefixes; their compact closures and uniform derivative envelopes are the original ones. Choose once

$$
0<c<\min(1,\inf_{g,x} \lambda_{\min}(g(x)^{-1})).
$$

For nested stages $n=3^{2j}$, put $\delta=1/n$, $m_{\mathrm{st}}=\sqrt{n}$, $h=\delta m_{\mathrm{st}}$, $X_n=(\delta\mathbb{Z}/\mathbb{Z})^{4}$, $\mu_n(x)=\delta^{4}$, $S_m=\{s\in\mathbb{Z}^4:0<|s|\le m_{\mathrm{st}}\}$, and $Q_m=\sum_s|s|^{2}$. The symbol $m_{\mathrm{st}}$ is the stencil radius, distinct from the teacher mean $m$. Discard a fixed finite prefix when needed for the uniform period/injectivity margins.

For every original controlled g, use the same node/cell/field record and define

$$
A(x)=g(x)^{-1},\quad B(x)=A(x)-cI,
$$

$$
w_B(u)=\det(B)^{-1/2}(u^{\mathsf T} B^{-1} u)^{-3},
$$

$$
q_g(x,s)=\sqrt{s^{\mathsf T} g(x+\delta s/2)s},
$$

$$
\mathrm{length}_g(x,s)=\ell_*\,\delta\,q_g(x,s),
$$

$$
a_n^g(x,s)=c\,\delta^{-2}\,\mathbf{1}_{s=\pm e_i}+8/(\delta^2 Q_m)\,w_{B(x+\delta s/2)}(s/|s|),
$$

$$
L_n^g f(x)=\sum_s a_n^g(x,s)[f(x+\delta s)-f(x)],
$$

$$
E_n^g(f)=(1/2)\langle f,-L_n^g f\rangle_{\mu_n}.
$$

The midpoint short lift is unique. The metric is the paid shortest-path metric of these edge services. At $I$ this is exactly Theorem C.6c.4 with $\theta=1-c$, including its forms, masses and cell maps. The positive physical clock $\tau_*$ and length $\ell_*$ are fixed for the whole source family. The normal-controller timer and reservation law is stated in part D; on this branch it takes the place of the rational/integer example of Corollary C.6c.7.1 and of the tariff of Definition C.6c.4a.

All field information in the recovery map comes from public supplied deterministic controller coordinates. Source state, task, callback, controller, timing, purity, pointer and archived records are retained throughout.

### D.6f.2m — Proof and complete source registration

#### D.6f.2m.A. Branch, comparators and ownership of the scalar precision

Definition D.1f and Theorem D.1g permit branch-indexed complete configuration spaces. Section 2 of Lemma F.1c.5 fixes every prescribed program and hardware item as a function of `(g,phi)` and excludes freely variable alternative hardware. Register the joint branch once as the graph-enabled extension of this space: every original `(g,phi)` remains, and graph rates, timers, padding, source states and programs are prescribed functions of the same finite geometry/field controller records. Admission imposes no condition on g. The unimodular class contains curved metrics, and all its competitors are retained. The source grammar is this normal-controller extension, in place of the rational/integer example of Theorem C.6c.7; the cost functional of Definition D.1 and Lemma F.1c.5 and the Gaussian task are unchanged.

Theorem D.6e defines the propagation form $E_{n}$ separately from the core potential $V_{n}$ and requires no finite equality between the massive scalar precision $K$ of Lemma F.1c.5 and the propagation Laplacian. The precision $K$ and the stencil of (F.1c.14.G1) are unchanged. The principal continuum tensor of $K$ is $g^{-1}$ by (F.1c.14.G4)–(F.1c.14.G5). The graph has the same tensor by part B, uses the same nodes and cells and consumes the same registered finite scalar-field values. Exact finite equality of these two operators, one massive and one a conservative graph generator, would be an additional requirement.

At finite outer n, the original source uses finitely many real controller knobs. Exact normal-source formulas refer to that admitted normal interface; finite binary descriptions of arbitrary reals are outside it. At every finite accuracy/observable prefix, the existing finite-register approximation and a finite precision of those same knobs supply an actual finite precursor. The minimizers of such a precursor are distinct from the normal-source minimizers.

#### D.6f.2m.B. Complete positive-rate and generator proof

Let $A=g^{-1}$ and $B=A-cI$ as above. The Gaussian integral

$$
\int_{\mathbb{R}^4} xx^{\mathsf T} \exp(-x^{\mathsf T} B^{-1} x)\,dx = (\pi^2/2)\det(B)^{1/2} B
$$

and radial identity $\int_0^\infty r^{5}\exp(-ar^{2})\,dr=a^{-3}$ prove the sphere formula $(1/|S^3|)\int_{S^3}uu^{T}w_B(u)\,d\sigma(u)=B/4$, since $|S^3|=2\pi^{2}$. In particular $w_{bI}=b$ exactly.

For each smooth compactly controlled $B$, lattice Riemann sums of $yy^{T}w_B(y/|y|)$ on the unit ball converge uniformly, including the finitely many $x$/controller derivatives required below. The integrand extends continuously as zero at $y=0$; its ball boundary is null. Uniformity follows by compactness of the coefficient family and the common modulus away from an arbitrarily small ball at zero. The denominator is the corresponding radial moment $\sum|s|^{2}$. Thus the frozen second moment

$$
\Sigma_n(x)=2cI+(8/Q_m)\sum_s w_B(x)(s/|s|)\,ss^{\mathsf T}
$$

converges to $2A(x)$ in every retained $C^k$ coefficient norm. Midpoint weights are even under $(x,s)\to(x+\delta s,-s)$, so the uniform measure is exactly reversible at every finite stage.

Write $z=\delta s$. Expand $w(x+z/2,u)$ and $f(x+z)-f(x)$ at $x$. Odd frozen sums vanish. The Hessian term is $(1/2)\Sigma_n:D^2f$, and the coefficient-gradient term is $(1/2)(\partial_i\Sigma_n^{ij})\partial_jf$. All third-order products are bounded by $C\sum_s a_s|z|^{3}\le Ch\sum_s a_s|z|^{2}\le C'h$ uniformly. Thus

$$
\lVert L_n^g f - \partial_i(A^{ij}\partial_j f)\rVert_\infty \le C_f h + e_m C_f,
$$

where $e_{m}$ is the uniform angular quadrature error at stencil radius $m_{\mathrm{st}}$, including the required coefficient derivatives, and tends to zero. Since $\det g=1$, $dx$ is exactly $dV_g$ and this limit is $\Delta_{g}$, with no volume drift term. At $I$ the coefficients are exactly those of (C.6c.4.1) with $\theta=1-c$, so the Mosco and curvature statements of Theorem C.6c.4 apply to the selected sequence.

#### D.6f.2m.C. Full-g metric proof

All metrics lie in one compact uniformly elliptic $C^2$ family on the torus, with a uniform positive injectivity radius. For sufficiently short displacement $z$, the midpoint straight-segment length differs from the geodesic endpoint distance by at most $C|z|^{3}$, uniformly in the family. One direct proof expands the energy about its affine segment: the minimizing geodesic differs from that segment by $O(|z|^{2})$, its first-order length change from path variation vanishes at the constant metric, and the coefficient Taylor remainder and resulting variation are $O(|z|^{3})$. The midpoint quadrature error along the segment is also $O(|z|^{3})$. Constants depend only on ellipticity and the common $C^2$ bound.

Each graph edge has $|z|\le h$; hence

$$
d_g(x,x+z) \le (1+C h^2)\,\mathrm{length}_g(x,z)/\ell_*.
$$

Triangle inequality and summation over any path prove $d_g\le(1+Ch^{2})d_n^g$ in dimensionless units.

For the upper bound take a minimizing $g$-geodesic and partition it into arcs with coordinate chord at most $\delta(m_{\mathrm{st}}-2)$, using ellipticity to compare its coordinate and Riemannian arclength. Round partition points to nearest grid centers; in four dimensions rounding error is at most $\delta$. Each resulting chord has length at most $\delta m_{\mathrm{st}}$ and is an edge of the graph. Remove repeated vertices. Endpoint perturbations cost at most $C\delta$ per segment, so their total is at most $C(\delta/h)d_g+C\delta$. The midpoint/geodesic discrepancy sums to at most $Ch^{2}d_g$ plus the same rounding remainder. Consequently

$$
d_n^g(x,y) \le [1+C(h^2+\delta/h)]\,d_g(x,y)+C\delta,
$$

uniformly for the entire controller class. All local lifts are taken within the uniform short-geodesic radius; partitioning handles global geodesics. Together the inequalities prove that the same controlled g is the metric limit for every competitor. Constant cell measures are actual g-volumes because det $g=1$; their center pushforward gives measured convergence. At I the sharper inequality (C.6c.4.2) applies.

#### D.6f.2m.D. Normal-source cycle and tariff: no omitted g-dependent work

The graph-timer extension has an explicit generator. Choose $\eta_{n}$ independent of $g$ by the compact word-duration bound. On a link put $t_e(g)=\eta_nq_e(g)$. For an involution $U$, put $\rho(s)=30s^{2}(1-s)^{2}$ on $[0,1]$ and zero outside, and execute $H_U(t)=\rho(t/t_e(g))\,\pi\hbar(I-U)/(2t_e(g))$. Its integrated area is $\pi\hbar(I-U)/2$, so its endpoint unitary is exactly $U$. Both $\rho$ and $\rho'$ vanish at the endpoints; $\rho\le 15/8$ and $|\rho'|\le 15$ give finite bounds $\lVert H_U\rVert\le 15\pi\hbar/(8t_e)$ and $\lVert\dot{H}_U\rVert\le 15\pi\hbar/t_e^{2}$. A separate completion qubit uses the analogous smoothly enveloped $X$ generator. General finite local preparations use their certified finite unitary and a self-adjoint logarithm, with compact positive clock duration. Pulse Hamiltonians have zero-storage endpoints; any switch/ramp and its work is retained. The completion instrument is read only at its registered endpoint. Uniform positive $t_{e}$ and the finite compact preparation family give bounded graph-side control generators at each stage. This is an explicitly driven finite source.

Every public real diagnostic knob is an admitted normal-interface parameter. When a graph probe has a bounded real expected response z, a finite outcome instrument can encode it by a calibrated Bernoulli mean (after its declared bounded scaling), using the same supplied control parameter. The mean is an exact statement about the source law; finite-precision compiled inputs and finite-sample reports carry their own errors. The deterministic acquisition map of (D.6e.3) is the programmed numerical/controller map.

| Owned component | Actual preparation/evolution | Actual endpoint/cost treatment |
|---|---|---|
| Graph pure bits, source/purifier/controller/clock/register blanks | One common declared pure stock; g-dependent finite normalized unitary preparation | Same number and dimensions for every g; incoming pure-stock supply is paid once; every output/failed/status record remains retained; no reset or erasure |
| Qualified cores of Theorem C.6c.P17a | Unchanged core law/tasks and original ready source; graph control labels depend on g | Original qualification loops and fixed original/typed-null benefits are retained; their whole finite horizon and records are paid |
| Graph gate and clock drives | Finite bounded self-adjoint controls with zero storage Hamiltonian before and after each graph service block | For a closed driven block, $W=\int\operatorname{Tr}(\rho\dot{H})\,dt=\operatorname{Tr}\rho_fH_f-\operatorname{Tr}\rho_iH_i=0$, for every input and $g$. Peak, power, action and timing remain recorded; zero net running work is not zero reservation cost |
| Graph projective records | Explicit finite normalized instruments, or unitary pointer dilation with retained pointer/environment | Fixed pure pointer supply and fixed readout-service reservation; no unowned entropy disposal. Their complete outcome law remains present |
| Lanes | Dedicated lane per edge reserved over one fixed physical lifetime $T_n$ | Busy interval has actual length $\eta_nq_e(g)$; standby is its actual complement. Under the same physical-time reservation price their sum is fixed; the $\eta/\tau$ normalizations of Definition C.6c.4a are not used |
| Graph preparation and calculation programs | Finite g-parametric template, all branches padded; finite coefficient/angle precision at finite precursor | Same fixed compact parameter envelope and prescribed precision budget; compilation, routing and ready records included in reserved inventory |
| Reservation completion flags | Actual fixed positive-gap flags, loaded once by paid drive and retained | Their real final energy is the prescribed positive reservation fee. For a flag initially at its ground and finally excited, actual work equals its gap. The incoming supply and outgoing charge are one debit, not two charges for the same energy |
| Gaussian teacher/encoder/physical observation/echo | The cycle of section 4 of Lemma F.1c.5, including its scalar reference choices | Original drive/charge/decharge work identity and exact inverse return to teacher; graph records are spectators, not erased by the inverse |
| Final Gaussian error charge | $H_{\mathrm{err}}(g,\phi)$ of (F.1c.5.3.2) on the returned normal teacher | This is the only remaining configuration-dependent final charge; its expected value is $\mathbb{E}_m[\Gamma(g,\phi)+d/2]$ |

All source factors are allocated for the full reserved window, so bit-time reservations do not depend on the record-write time. The graph is executed in its declared interval outside the Gaussian observation/echo window; the full common $T_{n}$ includes both and every preparation/delivery/qualification interval. Fixed stored flags may stay charged throughout: their Hamiltonians act on disjoint factors and their energies are the already counted constant boundary terms. They are not dropped in the first-law computation.

The reservation vector (F.1c.5.5.1) is enlarged by the graph inventory: blank-nats, time slots, finite control/precision envelopes, readout slots, complete allocated lane-time/link-service slots, and their positive physical reservation fees. These are supplied services with charged acceptance flags, as in section 5.1 of Lemma F.1c.5. Actual graph peak/action and all g-dependent timing records are retained. The objective prices the reservation envelope and not each actual amplitude; this is the pricing contract of section 5.1 of Lemma F.1c.5. Normal Gaussian blocks retain their original expected-energy/moment scope. Only finite precursors have hard finite operator-norm envelopes.

It follows by the exact endpoint first-law identities (F.1c.5.4.1)–(F.1c.5.4.2) and the unchanged four prices (F.1c.5.5.3) that

$$
T_n V_{\mathrm{joint}}(g,\phi)=C_{\mathrm{joint},n}+E_{\mathrm{eff}}\,\Gamma_n(g,\phi)
$$

for every admitted complete $(g,\phi)$ configuration. $C_{\mathrm{joint},n}$ is the original explicitly priced constant plus the actual fixed graph reservation charges and fixed original-host contributions. Therefore the exact global minimum is $\{(g,m):g\in G_n\}$. The potential contains no defect penalty and no fitted reward, and no original geometry is excluded.

#### D.6f.2m.E. Period and qualification are uniform over all g

The compact angular weights give $\sup_{x,g}\sum_s a_n^g(x,s)\le Cn^{2}$ for a fixed $C$. Choose the first retained $n$ sufficiently large that $\Delta_n=n^{-4}$ obeys $\Delta_n\sup q_{\mathrm{exit}}<1/8$ for every competitor; finite discarded prefixes do not affect the limit. Freeze $\Delta_{n}$, the core arming marks and all word lengths before comparison.

The graph-general endpoint compiler of Definition 35b.15 and Theorem 35b.16 uses $P_g=\exp(\Delta_nL_g)$ and the positive row law $R_g=4P_g-3I$ for its active conditional branch. The strict period bound makes all diagonal entries positive; connected positive rates make off-diagonal entries positive. At each fixed $n$ the compact controller family therefore has a positive minimum for every active row entry. Its Householder preparation has no singular denominator and has bounded retained parameter derivatives. The inactive identity branch remains fixed; there is no g-dependent control-count branch.

The delivered fair-bit qualification of Theorems C.6c.P17a and 35b.16 uses independent AND bits $F_{j1},F_{j2}$, with $X_1=F_{j1}$ and $X_2=X_1\oplus F_{j2}$. Its Brier risk $3/16$, fair-null risk $1/4$ and strict margin are independent of the heat row and hence $g$. The marked indices depend only on the original core durations and common $\Delta_{n}$. Every graph node is the same qualified persistent core of Theorem C.6c.P17a for every $g$.

Choose $\eta_{n}$ using the compact maximum of the complete word's sum of $q_{e}$ and local/clock weights, so its full macro fits the fixed physical period $\tau_*\Delta_n$ with explicit idle slack. If a common subslot is used, choose it below $\eta_n\min(1,q_{\min})/4$; $q_{\min}>0$ follows from ellipticity. Alternatively the displayed full-duration involution implements each link. At the completion endpoint the exact channel is $P_{g}$, irrespective of these internal durations. All internal time changes, slack, controller actions and raw work records remain owned. The physical logarithm is exactly $L_g/\tau_*$ at that common period.

#### D.6f.2m.F. Recovery acquisition from supplied controller coordinates

Sections 2 and 3.2 of Lemma F.1c.5 make $\phi$ a deterministic program/forecast coordinate, distinct from a data-dependent function of the hidden Gaussian teacher Q. Lemmas F.1c.13 and F.1c.14 admit finite smooth Fourier/metric controllers. The recovery source uses those public normal controller coordinates as its information interface; teacher samples and a continuum energy oracle are not part of it.

For the limiting compact regular test family $K_{\phi}$, define $J_{q}$ as the product Fejer map retaining finitely many supplied Fourier controller coordinates. Let $q=\lfloor n^{1/4}\rfloor$; reserve a finite diagnostic-coordinate prefix large enough to represent that polynomial. The optimization family is unchanged; the Gaussian operator and source response are defined on the ambient finite coordinate space before restriction to the compact forecast subset, so the Fejer image of a test is used as a diagnostic coordinate and need not lie in that subset. The finite source computes/distributes its nodal values and retains the coefficient/table records; its same node-field values feed both the original scalar source controller and the graph probe. Exact formulas describe the admitted normal-coordinate interface. Finite-bit precursors approximate those coordinates and table operations with their explicit finite precision, counted with the precision inventory of Lemma F.1c.5.

Set $E_nf=S_nJ_qf$ and let $I_{n}$ be the same half-open-cell interpolation used by Theorem C.6c.4. This is a finite-coordinate acquisition map on the declared regular source domain.

Let $L=\sup_K\lVert\nabla f\rVert_\infty$, $H=\sup_K\lVert D^2f\rVert_\infty$, finite on the regular domain of Lemma F.1c.14. Put $\beta_q=(1+(1/2)\log q)/q$. Since the one-dimensional Fejer kernel is bounded by $\min(q,1/(4qt^{2}))$, its first absolute moment on the circle is at most $\beta_{q}$. Product convolution and positivity give

$$
\begin{aligned}
\lVert J_q f-f\rVert_\infty &\le 4L\beta_q, \\
\lVert \nabla J_q f-\nabla f\rVert_\infty &\le 4H\beta_q, \\
\lVert \nabla J_q f\rVert_\infty &\le L,\quad \lVert D^2 J_q f\rVert_\infty\le H.
\end{aligned}
$$

Thus interpolation error is at most $2L\delta+4L\beta_q$. The pointwise $\Gamma$ estimate of Theorem C.6c.4 and cell quadrature give

$$
|E_n(S_n J_q f)-\mathrm{Ch}(J_q f)| \le 2LHh+(H^2/2)h^2+2LH\delta.
$$

Also $|\mathrm{Ch}(J_qf)-\mathrm{Ch}(f)|\le 4LH\beta_q$. Hence the recovery supremum (D.6e.3) on this registered compact normal-source test class is bounded by

$$
2L\delta+4L\beta_q+2LHh+(H^2/2)h^2+2LH\delta+4LH\beta_q \to 0.
$$

The bound is uniform on the whole registered class. The full normalized smooth Lipschitz ball lies outside the registered domain, and Theorems D.6f.2e, D.6f.2f and D.6f.2k apply to it unchanged.

### D.6f.2m — Core, charts, responses and normal-source admission

#### D.6f.2m.G. Exact D4 polynomial extension and full-rank assembly

At each node $x$ take local lifted physical coordinate $z=y-x$. Let $R=\{\pm e_i\pm e_j:i<j\}$. The center and $\delta R$ are unisolvent for polynomials of degree at most two. Indeed if $p(z)=a+b\cdot z+z^{T}Cz$ vanishes there, the center gives $a=0$, opposite roots give $b=0$, differences between $e_i+e_j$ and $e_i-e_j$ give $C_{ij}=0$, and $C_{ii}+C_{jj}=0$ for every pair forces all diagonal entries zero. Scaling by $\delta$ does not change this argument. Consequently the original degree-two $D_4$ local data specify a unique polynomial, which is explicitly extended to the entire growing-stencil two-step neighborhood. For retained $n$, $n>4m_{\mathrm{st}}$, so there is no two-step torus alias. This supplies all values needed by $L$, $\Gamma$ and $\Gamma_2$.

At $g=I$, the exact moments $\sum a_sz_s=0$ and $\sum a_sz_sz_s^{T}=2I$ give, for $p=a+b\cdot z+(1/2)z^{T}Hz$,

$$
\begin{aligned}
L_n p &= \operatorname{tr} H, \\
\Gamma_{2,n}(p) &= (1/4)\sum_{s,t} a_s a_t (z_s^{\mathsf T} H z_t)^2=\operatorname{tr}(H^2).
\end{aligned}
$$

Hence the normalized polynomial-core defect (D.6e.1) with $K=0$ is exactly zero, independently of its fixed coefficient norm. The statement concerns the polynomial core; $\mathrm{BE}(0,4)$ for arbitrary node functions of the finite graph is a different statement.

For assembly use the localized-support convention of Proposition D.6f.2j, item 2, with $G=0$ (no equality-of-coefficient gluing). The generator at $x$ is $1_{x+(\{0\}\cup\delta R)}(y)\,[1-|y-x|^{2}/(2\delta^{2})]$. It equals $\delta_{x}$ exactly. These are finite graph-Lipschitz functions; every vertex has such a column in the assembly matrix. Its rank is therefore $|X_n|$, giving $C_{n}=0$ by Proposition D.6f.2g. All cutoffs, supports, extensions and coefficient assembly maps are now fixed parts of the branch record. The local polynomial carrier has the 24 $D_4$ root directions; the growing propagation-service lanes are separately owned auxiliaries, and the total service degree grows with $n$.

#### D.6f.2m.H. Chart range and quantitative rigidity

Fix once $0<r_-<r_+<1/8$ in dimensionless torus units; all centers and every radius in that interval are retained; radii comparable to the mesh lie outside the chart range. For sufficiently large $n$, the $r_++2h$ neighborhood has one Euclidean lift. Define its harmonic coordinate functions $z_i=y_i-x_i$. On the inner $r_+$ ball they satisfy exactly $L_nz_i=0$ and $\Gamma_n(z_i,z_j)=\delta_{ij}$.

The normalized harmonic-coordinate record consists of the actual Laplacian residual, Gram residual and same-cell interpolation error in these coordinates. The first two vanish identically; the last is bounded by $2\delta/r_-$ after dividing coordinates by the chart radius. Thus its normalized harmonic excess tends to zero. This is the harmonic-coordinate convention of the branch record.

Inequality (C.6c.4.2) gives $d_0\le d_n\le(1+\epsilon_n)d_0+2\delta$, with $\epsilon_n=2/(m_{\mathrm{st}}-2)$. Restrict the center correspondence to balls, and radially shorten any continuum comparison point near a graph-ball boundary by $O(\epsilon_nr+\delta)$. Its distortion and coverage errors are $O(\epsilon_nr+\delta)$, uniformly in $x$ and $r$ in the retained interval. Thus the normalized ball GH error is $O(\epsilon_n+\delta/r_-)$.

For volume, the graph ball contains all grid centers of Euclidean radius $(r-2\delta)/(1+\epsilon_n)$. Their cells cover the Euclidean ball with that radius minus $2\delta$, while cells above the graph ball lie in the Euclidean ball of radius $r+2\delta$. Taking four-dimensional volumes and dividing by $\omega_4r^{4}$ gives volume-ratio error $O(\epsilon_n+\delta/r_-)$, uniformly on the retained chart range. Hence $H_{n}$ of (D.6e.4) tends to zero.

The source measure is the actual uniform position law, with physical volume atom $\ell_*^{4}\delta^{4}$; the physical chart radii are $\ell_*$ times these fixed radii. All unit changes are fixed, not chosen after taking the limit.

#### D.6f.2m.I. Diagnostic input versus optimization variable

The selected baseline has forecast $\phi=m$. A test $f$ of (D.6e.3) is a public diagnostic/controller input on fresh owned test registers; the baseline forecast stays $\phi=m$ and the baseline stays in $M_{n}$. Its field-coordinate labels, nodes, cells and geometry controls are the same as the original scalar controller. The scalar precision's principal form and graph probes are compared on those same numerical directions.

The finite diagnostic prefix (Fourier coordinate count, node table, local polynomial probes, desired numerical accuracy and number of retained calls) is reserved before comparing g,phi. Graph probe gates are zero-storage drives with owned input/pointer resources and retained outputs. Their reservation fees are included in part D. Optional separate Gaussian response experiments retain the source/observable maps of Lemma F.1c.5 and their own paid requested prefix.

If a finite precursor's node values differ from $E_{n}f$ by at most $\zeta_{n}$, then $E_n(\text{error})\le b_n\zeta_n^{2}$, where $b_{n}$ is the maximal flat exit rate $O(n^{2})$. Polarization gives energy error at most $2\sqrt{E_n(E_nf)}\sqrt{b_n}\,\zeta_n+b_n\zeta_n^{2}$; the interpolation error changes by at most $\zeta_{n}$. Thus, for example, $\zeta_n\le n^{-3}$ makes the extra recovery error vanish uniformly. Finite arithmetic and coefficient precision can be chosen to this deterministic accuracy on the original bounded controller domain; the supremum (D.6e.3) is evaluated on these deterministic values.

#### D.6f.2m.J. Full finite response ownership and common limiting comparison

At each n the abstract registered source includes all the graph, core, Gaussian, pointer, clock and archive factors. Its physical realization uses the prescribed unitary/instrument for every named primitive, the same normal teacher preparation, and the same shared controller record. The ready-host isometry and the graph-general qualified-node construction intertwine these operations on their actual supported domains. Composition proves equality of the complete finite joint law, including an arbitrary reference for an unknown graph payload, all qualification/null records and all owned source records. Occurrence-list ownership is a bijection: each lane interval, factor holding, pulse, preparation and readout is charged once to its declared owner. This is an exact within-level source/response map.

At the selected $g=I$, the graph's completed channel and clock are exactly

$$
P_n=\exp(\Delta_nL_n),\quad\text{physical completion period }\tau_*\Delta_n,
$$

so its unique self-adjoint transfer logarithm is $L_n/\tau_*$. The physical length is $\ell_*d_{n}$, and the metric-normalized form is $E_n/\ell_*^{2}$ when paired with normalized probability $\mu_{n}$. With the physical volume measure $\ell_*^{4}\mu_n$ instead, the physical Cheeger form is $\ell_*^{2}E_n$. The two expressions differ by this normalization conversion. The field/coordinate cells and pairing are those of the Mosco proof of Theorem C.6c.4. The Gaussian Euclidean transfer mesh $\epsilon$ and the physical second are distinct registered times.

For fixed smooth $f$ and bounded physical time $T$, contractivity and Duhamel give the estimate (C.6c.7.8) with $\theta=1-c$:

$$
\lVert P_n^{\lfloor t/\Delta_n\rfloor} S_n f-S_n \exp(t\Delta)f\rVert_\infty
$$

$$
\le (4/3)\,t h \lVert D^3 f\rVert_\infty + \Delta_n \lVert \Delta f\rVert_\infty,\quad t=T/\tau_*.
$$

The third-moment constant 4/3 holds for every $\theta$ in (0,1). Cell averages give the common strong L2 extension; the adjoint cell maps retain exact measure pushforward on the nested levels. A fixed finite protocol with bounded smooth position effects is a finite product of contraction semigroups and multiplication operators. Expanding the difference as a telescoping sum bounds its response error by the sum of the corresponding semigroup and cell-effect errors, hence by a quantity tending to zero on the registered finite protocol prefix. Polynomial-core/energy probes have the exact stated finite means and their existing moment tests. Normal scalar source/metric-response comparisons are those of Lemmas F.1c.5 and F.1c.14 on the same controlled g and node-field coordinates.

Complete raw archives and resource records generally grow and need not possess a continuum joint-law limit. They are retained with their actual costs; only the explicitly named response projections and fixed finite test prefixes are compared across levels.

Because the selected configuration is an exact member of $M_{n}$, the within-level comparison to a global-core representative has response error zero: it is the same realized source, and the projection of Proposition D.6f.2a is the identity. The competitor condition (D.6f.1) follows from this sequence.

#### D.6f.2m.K. Normal finite-resolution source and its actual finite approximants

At each outer n there are finitely many graph vertices, finitely many normal Gaussian modes, finitely many controller knobs, and a registered finite protocol/observable prefix. The normal inner source is admitted by sections G2 and G4, item 6, of Lemma F.1c.14 and by section 5.1 of Lemma F.1c.5. The finite-resolution contract of Definition D.1f specifies a finite protocol family; an admitted normal factor may have an infinite-dimensional Hilbert space. The normal branch has finite expected source energies and the prescribed finite weighted moments; hard peak bounds and finite binary storage belong to its finite precursors.

The finite-register path of Lemma F.1c.2a is kept. At each fixed $n$, select its common tensor-Hermite cutoff after the full compact parameter/test prefix. The additional graph is finite-dimensional and its normalized preparation matrices, timers and generators depend smoothly on a compact real controller domain with strict positive row/timer margins. Therefore ordinary finite-dimensional continuity/Duhamel bounds supply a common finite coefficient/angle/timer precision for any requested finite graph error. Combine these with the weighted Gaussian bounds of Lemma F.1c.2a and sum the finite occurrence errors. Every resulting precursor has its actual finite registers, pure stock, pulses, duration, envelopes, records and fixed reservation flags. Its requested error can be made, for example, $n^{-4}$ on the whole registered prefix; its cost may grow with $n$ and with the requested accuracy.

$M_{n}$ is the minimum set of the admitted normal finite-resolution branch, whose exact objective is proved in parts D and L. The finite Hermite precursor is an operational approximation path with its own finite potential, whose minimizers are not determined here.

#### D.6f.2m — Conclusion

On this explicitly registered compact normal-source branch, choose $Y_{n}$ to be the complete realized configuration with $g=I$ and $\phi=m$. The exact four-term reservation potential gives $Y_{n}$ in $M_{n}$ over every admitted full `(g,phi)` comparator. The records of Theorem D.6e fixed above give

$$
B_n(Y_n)=0,\quad C_n(Y_n)=0,\quad R_n(Y_n)\to 0,\quad H_n(Y_n)\to 0.
$$

By Theorem C.6c.4 at $\theta=1-c$, the same source/cell sequence has noncollapse, uniform graph-energy PI, common Mosco weak liminf and full $H^1$ recovery, energy-plus-$L^2$ equicoercivity, and the flat quadratic strongly local regular Cheeger limit. Full within-level source/response ownership is exact; named finite continuum responses have the stated errors and units.

#### D.6f.2m.L. Exact original four-price substitution and constant

Use the positive prices of section 5.1 of Lemma F.1c.5 and the calibration (F.1c.5.2.2), $E_m=\hbar/[(1+b)\tau_*]$, $E_{\mathrm{eff}}=(1+b)E_m=\hbar/\tau_*$. Let $R_{\mathrm{op}}^{F5}$ and $R_{\mathrm{prop}}^{F5}$ be the Gaussian/host reservation records (F.1c.5.5.1), evaluated on the enlarged common service window with their actual host tick contributions integrated over that window; the host tick keeps its own duration. Denote the additionally supplied graph inventory by

$$
D_{\mathrm{gr}},\ n_{t,\mathrm{gr}},\ E_{\mathrm{gr}}^{\mathrm{res}},\ P_{\mathrm{gr}}^{\mathrm{res}},\ n_{c,\mathrm{gr}},\ n_{q,\mathrm{gr}},\ n_{l,\mathrm{gr}},
$$

and its separately owned fixed incoming stock/preparation charge by $W_{\mathrm{gr,input}}$. Each is the preregistered compact envelope/count and its actual supplied reservation service, as in part D; all are independent of $g,\phi$. Normal expected-moment reservations use the original normal convention; finite hard envelopes apply only to the corresponding finite factors/precursors. Double ownership of the same pure-stock supply, flag charge or lane holding is prohibited.

Set

$$
\begin{aligned}
&R_{\mathrm{op}}^{\mathrm{joint}} = R_{\mathrm{op}}^{F5} + W_{\mathrm{gr},\mathrm{input}} + p_D D_{\mathrm{gr}} + p_t n_{t,\mathrm{gr}} \\
&\qquad + p_E E_{\mathrm{gr}}^{\mathrm{res}} + p_P P_{\mathrm{gr}}^{\mathrm{res}} + p_c n_{c,\mathrm{gr}} + p_q n_{q,\mathrm{gr}},
\end{aligned}
$$

$$
R_{\mathrm{prop}}^{\mathrm{joint}} = R_{\mathrm{prop}}^{F5} + p_l n_{l,\mathrm{gr}}.
$$

The full original-host fixed contribution is $B_{\mathrm{host}}^{\mathrm{joint}}$, the sum of the actual unchanged task contributions for all qualified cores in the assembled source. It is independent of $g$ because the entire original/null task laws and durations are unchanged. Its cost is already included in the actual host inventories; it is not added twice. Let $R_{\mathrm{fixed}}^{\mathrm{joint}}$ be the actual fixed acceptance-charge record, including any newly supplied mandatory fixed service flag not already owned by those inventories.

Use the same Gaussian canonical performance coordinate $PP=(1+k_{PP}r_n)^{-1}$, the same increasing benefit $B(PP)=R_{\max,n}-(PP^{-1}-1)/k_{PP}$, and one $R_{\max,n}$ fixed above the entire actual normal risk range before comparison. Then the four terms of Definition D.1, in the form (F.1c.5.5.3), are

$$
V_{\mathrm{op}} = R_{\mathrm{op}}^{\mathrm{joint}}/T_n,
$$

$$
V_{\mathrm{prop}} = R_{\mathrm{prop}}^{\mathrm{joint}}/T_n,
$$

$$
V_{\mathrm{penalty}} = [R_{\mathrm{fixed}}^{\mathrm{joint}} + E_m r_n(g,\phi)]/T_n,
$$

$$
V_{\mathrm{benefit}} = B_{\mathrm{host}}^{\mathrm{joint}}/T_n + (b E_m/T_n)[R_{\max,n}-r_n(g,\phi)].
$$

The normal teacher has exactly $r_n(g,\phi)=\Gamma_n(g,\phi)+d_n/2$; here $d_{n}$ is the scalar history-coordinate dimension, not the graph distance. Thus direct substitution gives

$$
T_n V_{\mathrm{joint}} = C_{\mathrm{joint},n} + E_{\mathrm{eff}}\,\Gamma_n(g,\phi),
$$

$$
\begin{aligned}
&C_{\mathrm{joint},n} = R_{\mathrm{op}}^{\mathrm{joint}} + R_{\mathrm{prop}}^{\mathrm{joint}} + R_{\mathrm{fixed}}^{\mathrm{joint}} \\
&\qquad - B_{\mathrm{host}}^{\mathrm{joint}} - b E_m R_{\max,n} + E_{\mathrm{eff}}\,d_n/2.
\end{aligned}
$$

Every entry is either an actual positive source charge, an original utility valuation or the exact Gaussian trace term. No g-dependent cost is subtracted as a reference. Graph outcome entropy creates no reset debit: all records and purifiers persist, and the initial stock and its holding are paid.

The complete objective equality therefore holds under the reservation pricing convention of section 5.1 of Lemma F.1c.5. A contract charging actual pulse amplitude, unreserved precision or erasure is a different branch with its own potential.

#### D.6f.2m — Service-window lineage

If the joint source is compared with the Gaussian-only source of Theorem F.1c.5a on a separately registered service window $T_{\mathrm{old}}$, with potential $V_{F5}$, the exact relation is $T_nV_{\mathrm{joint}}=T_{\mathrm{old}}V_{F5}+\text{constant}$ after including the new fixed host-window contributions; the potentials themselves are related through this time conversion. $T_{n}$ is fixed before any $g,\phi$ comparison and is the complete actual joint service duration. The positive common rescaling does not change the minimizing configurations. This preserves the definition of $V$ as power over the full lifecycle clock. ∎

<a id="theorem-d6f2n"></a>

<a id="theorem-d6f2n-selected-variable-metric-mosco-passage-and-curved-quadratic-core-curvature"></a>**Theorem D.6f.2n (Selected Variable-Metric Mosco Passage and Curved Quadratic-Core Curvature).** Retain the complete normal-source implementation, reservation potential, original metric/forecast competitors, positive midpoint rates, half-open cells, fixed nearest-axis rate floor $c$, physical clock and physical length of Theorem D.6f.2m. Let $g_{n}$ be any sequence of its admitted unimodular controller metrics converging in $C^2$ to $g$. Put $A_n=g_n^{-1}$, $A=g^{-1}$ and retain $n=3^{2j}$, $\delta=1/n$, $m_{\mathrm{st}}=\sqrt{n}$, $h=m_{\mathrm{st}}\delta=1/m_{\mathrm{st}}$. In the proof below $m$ denotes the stencil radius $m_{\mathrm{st}}$, not the teacher mean.

The same cell extensions $I_{n}$ and adjoint cell averages $P_{n}$ identify the forms

$$
E_n(u)=(1/4)\sum_{x,s} \mu_x a_n(x,s)[u(x+\delta s)-u(x)]^2
$$

with an equicoercive Mosco limit

$$
\mathrm{Ch}_g(u)=(1/2)\int \nabla u^{\mathsf T} g^{-1} \nabla u\,dx.
$$

The measured metric limit of part C of Theorem D.6f.2m is $(\mathbb{T}^4,d_g,dx)$, so this is its quadratic Cheeger energy. The noncollapsed limit is $\mathrm{RCD}^*(K,4)$ for a uniform finite $K$ on the compact $C^2$ metric branch. If, in addition, the metric sequence has a uniform $C^6$ envelope and uniform ellipticity, there is a finite $K_{\mathrm{core}}$ independent of $n$ and the chosen admitted metric such that, on the registered local radius-two quadratic polynomial core,

$$
\Gamma_{2,n}(p)(x) \ge (L_n p(x))^2/4 + K_{\mathrm{core}}\,\Gamma_n(p)(x).
$$

Here $\Gamma_n(f,g)=(1/2)\sum_s a_n(x,s)\Delta_sf\,\Delta_{s}g$ and $\Gamma_{2,n}(p)=(1/2)L_n\Gamma_n(p)-\Gamma_n(p,L_np)$. The inequality is stated on the quadratic core, and the $C^6$ envelope is a hypothesis of this curvature estimate only. The reservation potential, its comparators and its minimum classes are those of Theorem D.6f.2m.

At every level the baseline forecast is the original admitted constant teacher mean, so the full realized configuration is an exact global minimum by the price identity of Theorem D.6f.2m. The within-level source/response and inventory ownership are those of Theorem D.6f.2m. With normalized probability measure the physical form is $E_n/\ell_*^{2}$; with physical volume $\ell_*^{4}\mu_n$ it is $\ell_*^{2}E_n$.

*Proof.*

#### D.6f.2n.A — Uniform form bounds and compactness

The positive angular weights are bounded above and below on the compact metric family. Therefore each graph form is bounded below by c times the nearest-neighbor form and above by a fixed multiple of the varying-stencil form of Theorem C.6c.4. The same Fourier/cell identification as in Theorem C.6c.4 shows that energy-plus-L2 bounded sequences have uniformly controlled Fourier tails and are strongly L2 precompact. In particular any weak limit of an energy-bounded sequence lies in H1. This statement is independent of whether the limiting g is flat.

For cell averages $P_{n}$ f and any f in H1, Jensen and translation invariance of the cells give

$$
\delta^4 \sum_x |P_n f(x+z)-P_n f(x)|^2 \le \lVert f(\cdot+z)-f\rVert_2^2 \le |z|^2 \lVert \nabla f\rVert_2^2.
$$

The uniform upper rate bound and second-moment bound yield

$$
E_n^g(P_n f)\le C \lVert \nabla f\rVert_2^2,
$$

with $C$ independent of $n$ and of the admitted $g$. Also $I_nP_nf\to f$ strongly in $L^2$.

#### D.6f.2n.B — Weak liminf by a discrete dual flux

For a smooth periodic vector field $p$, put $z_s=\delta s$ and $F_n(x,s)=p(x+z_s/2)\cdot z_s$. The inequality $a^{2}\ge 2ab-b^{2}$ gives

$$
\begin{aligned}
&E_n(u_n) \ge (1/2)\sum_{x,s} \mu_x a_n(x,s)\,\Delta_s u_n\,F_n \\
&\qquad -(1/4)\sum_{x,s} \mu_x a_n(x,s) F_n^2.
\end{aligned}
$$

Exact midpoint reversibility gives the summation-by-parts identity

$$
\sum_{x,s} \mu_x a_n \Delta_s u_n F_n = -2 \sum_x \mu_x u_n(x) B_{n,p}(x),
$$

where $B_{n,p}=\sum_s a_n(x,s)\,p(x+z_s/2)\cdot z_s$. The midpoint expansion used for the generator in part B of Theorem D.6f.2m, with its angular moment identity, gives

$$
\begin{aligned}
B_{n,p} &\to \operatorname{div}(A p)\ \text{uniformly}, \\
(1/4)\sum_{x,s} \mu_x a_n F_n^2 &\to (1/2) \int p^{\mathsf T} A p\,dx.
\end{aligned}
$$

If $I_nu_n$ converges weakly to $u$ in $L^2$, the first pairing therefore converges to $-\int u\operatorname{div}(Ap)$. Thus

$$
\liminf E_n(u_n) \ge -\int u\,\operatorname{div}(Ap) -(1/2)\int p^{\mathsf T} A p
$$

for every smooth p. The already established H1 membership permits integration by parts. Taking the supremum over smooth p, dense in L2, gives exactly

$$
\liminf E_n(u_n) \ge (1/2)\int \nabla u^{\mathsf T} A \nabla u\,dx.
$$

This is the weak liminf inequality for every weakly convergent sequence.

#### D.6f.2n.C — Full strong recovery

For smooth f, Taylor expansion and the exact uniform moment convergence give

$$
I_n P_n f\to f,\quad E_n(P_n f)\to(1/2)\int \nabla f^{\mathsf T} A \nabla f\,dx.
$$

The displayed uniform H1 form bound extends recovery to every H1 f by smooth density and a diagonal choice. For f of infinite energy the upper energy inequality is vacuous and L2 density still supplies strong approximants. Hence the forms Mosco-converge in the same cell topology to

$$
\mathrm{Ch}_g(f)=(1/2)\int \nabla f^{\mathsf T} g^{-1} \nabla f\,dx.
$$

Because $\det g=1$, $dx$ is $dV_g$, so this is precisely the quadratic Cheeger energy of the already proved metric limit $d_{g}$. The limit is a compact $C^2$ Riemannian torus (smooth when the chosen controller limit is smooth), with a uniform Ricci lower bound $K$ from compact $C^2$ control, hence noncollapsed $\mathrm{RCD}^*(K,4)$. Uniform noncollapse, doubling and graph PI follow by ellipticity comparison with Theorem C.6c.4 and the same positive coordinate-rate floor.

#### D.6f.2n.D — Uniform curvature on the local quadratic core

Assume now the explicit compact $C^6$ metric envelope. The following argument proves the displayed uniform core inequality. The symbol $A_n^{\mathrm{eff}}$ is the frozen finite second-moment tensor, distinct from the controlled inverse metric $A_n=g_n^{-1}$ used in the Mosco passage.

**Step A: moments and derivatives.** Write the rates as a finite sum of terms

$$
a_z(x)=\beta_z k_z(x+z/2),
$$

where $\beta_{z}\ge 0$ is independent of $x$, $k_{-z}=k_z$, the $k_{z}$ are uniformly positive with uniformly bounded derivatives through order 6, and the symmetric $\beta_{z}$ are the constant coordinate-rate and growing-stencil weights. Splitting their sum into these two terms is harmless. Uniformly,

$$
\sum_z \beta_z |z|^2 \le C,\quad \sum_z \beta_z |z|^4 \le C h^2.
$$

Define $A_n^{\mathrm{eff}}(x)=(1/2)\sum_z\beta_zk_z(x)\,z\otimes z$. The same ball quadrature used for the second-moment identity, applied also after $x$ differentiation, gives

$$
\lVert A_n^{\mathrm{eff}}-g_n^{-1}\rVert_{C^2} \le C/m=C h.
$$

One direct justification of the $O(1/m)$ error is to scale the lattice ball to unit radius: the moment integrand is homogeneous of degree 2, is uniformly Lipschitz on that ball including its zero extension at the origin before treating the boundary, and has bounded surface trace. Interior cell errors and the boundary layer each have total size $O(1/m)$; the same bounds hold for its first two $x$ derivatives. The denominator $Q_{m}$ has the identical nonzero leading Riemann integral and $O(1/m)$ relative error. Also $A_n^{\mathrm{eff}}$ is uniformly elliptic and its derivatives through order 6 remain bounded, by the moment bound and the corresponding bounds on $k_{z}$. In particular, $V_n=-(1/2)\log\det A_n^{\mathrm{eff}}$ has gradient $O(h)$.

**Step B: quadratic coercivity.** Put $p(x+z)-p(x)=b\cdot z+(1/2)z^{T}Hz$. Pairing $z$ and $-z$ and using the uniform lower bound for $k_{z}$ gives a lower bound by a positive constant times

$$
\sum_z \beta_z [(b\cdot z)^2+(1/4)(z^{\mathsf T} H z)^2].
$$

The coordinate-rate part bounds $|b|^{2}$ below. For the growing part,

$$
(\delta^2/Q_m)\sum_{0<|s|\le m} (s^{\mathsf T} H s)^2 \ge c h^2 |H|^2.
$$

Indeed, dividing the numerator by $m^{8}$ and $Q_{m}$ by $m^{6}$ gives their ball integrals uniformly for $|H|=1$. The quartic integral is strictly positive on the compact unit sphere of symmetric matrices: a quadratic polynomial that vanishes on the ball is identically zero. Thus its minimum is positive. Increasing $n_0$ if needed gives

$$
\Gamma_n(p)(x) \ge c_0 (|b|^2+h^2 |H|^2).
$$

The radius-two no-alias condition ensures the same polynomial is used at every point entering $\Gamma_{2}$.

**Step C: midpoint remainder.** Let $D_n=\operatorname{div}(A_n^{\mathrm{eff}}\nabla)$ and $\Gamma_D(f,g)=\nabla f^{T}A_n^{\mathrm{eff}}\nabla g$. Pair the $\pm z$ Taylor expansions. Their odd total powers cancel. The second-order terms of $L$ are exactly $A_n^{\mathrm{eff}}:D^{2}f+(\operatorname{div}A_n^{\mathrm{eff}})\cdot\nabla f$, and the second-order terms of $\Gamma$ are exactly $\Gamma_{D}$. The fourth-moment bound then gives, on the local lifted neighborhood,

$$
\lVert L_n f-D_n f\rVert_{C^2} \le C h^2 \lVert f\rVert_{C^6},
$$

$$
\lVert \Gamma_n(f,g)-\Gamma_D(f,g)\rVert_{C^2} \le C h^2 \lVert f\rVert_{C^5}\lVert g\rVert_{C^5}.
$$

These local norms may exclude the constant term of $f$ or $g$, since every expression uses differences. For the polynomial $p$ centered at $x$, all needed nonconstant local norms on a fixed-radius neighborhood are bounded by $C(|b|+|H|)$. The coefficients and their derivatives are uniformly bounded. Applying the first estimate to $\Gamma_D(p,p)$, the second to $(p,D_np)$, and the same elementary second-moment bound to the $C^2$/$C^1$ remainders proves

$$
|\Gamma_{2,n}(p)-\Gamma_{2,D}(p)| \le C h^2 (|b|^2+|H|^2).
$$

Here L acting on a C2 remainder is bounded by its C2 norm times the second moment, with the first moment bounded by midpoint symmetry and coefficient gradients; the diverging exit rate does not enter. The same reasoning gives

$$
|(L_n p)^2-(D_n p)^2| \le C h^2 (|b|^2+|H|^2).
$$

**Step D: the weighted Bochner cross term.** Regard $A_n^{\mathrm{eff}}$ as inverse metric, so $dx=\exp(-V_n)\,dV_{(A_n^{\mathrm{eff}})^{-1}}$ and $D_{n}$ is its weighted Laplacian. The metric and weighted Ricci tensors are uniformly bounded. With $J=\operatorname{Hess}_{(A_n^{\mathrm{eff}})^{-1}}p$ and $v=\langle\nabla V_n,\nabla p\rangle$, weighted Bochner and the matrix trace inequality give

$$
\Gamma_{2,D}(p)-(D_n p)^2/4
$$

$$
= |J|^2-(\operatorname{tr} J-v)^2/4 + (\operatorname{Ric}+\operatorname{Hess} V_n)(\nabla p,\nabla p)
$$

$$
\ge -C |b|^2-C h |b||H|.
$$

Here $|v|\le Ch|b|$ and $|J|\le C(|H|+|b|)$. The determinant of $A_n^{\mathrm{eff}}$ need not equal 1; its log-density gradient is retained in this estimate.

Combining Steps C and D gives the lower bound

$$
-C (|b|^2+h |b||H|+h^2|H|^2).
$$

Since $h|b||H|\le(|b|^{2}+h^{2}|H|^{2})/2$, Step B absorbs it into $K_{\mathrm{core}}\Gamma_n$ for a uniform finite negative $K_{\mathrm{core}}$. This proves the stated lemma.

#### D.6f.2n.E — Quantitative constants

The moment constants in Step A can be made explicit without estimating the diverging exit rate. Separate the coordinate terms ($k_z=1$, $\beta_z=c\delta^{-2}$) and the growing terms ($k_z=w_B$, $\beta_z=8/(\delta^{2}Q_m)$). Then exactly

$$
M_2:=\sum \beta_z |z|^2=8(c+1),
$$

$$
M_4:=\sum \beta_z |z|^4 \le 8(c+1)h^2=M_2 h^2.
$$

Let $W_{-}>0$ be the common lower bound of $w_{B}$ and let $K_{6}\ge 1$ bound its multilinear derivatives through order 6, also including the constant coordinate term. All bounds below depend only on $c$, $W_{-}$, $K_{6}$ and the compact ellipticity constants; they are independent of $n$, $x$ and $p$.

The ball integrals used in Step B are

$$
\int_{B_1} |s|^2\,ds=|S^3|/6,
$$

$$
\int_{B_1} (s^{\mathsf T} H s)^2\,ds=|S^3|[(\operatorname{tr} H)^2+2|H|^2]/192.
$$

Their ratio is at least $|H|^{2}/16$. Uniform Riemann convergence on $|H|=1$ therefore supplies a fixed $m_0$ such that the discrete ratio is at least $m^{2}|H|^{2}/32$ for all $m\ge m_0$. The paired-square lower bound gives the usable coercivity constant

$$
c_0=\min(c,W_-/32).
$$

Increasing m0 affects only the discarded finite initial prefix. One can retain its exact definition as the first threshold for the displayed uniform quartic inequality; it is independent of the metric/controller parameters because that inequality uses only the unweighted integer ball.

In the Step C remainder inequalities the odd terms cancel pairwise before absolute values are taken, and the remaining constants are finite products of $K_6$, $M_2$ and binomial factors from the product rule and the order-four paired Taylor remainders. Let $C_{B}$ be the resulting constant for the total error in the dimension-four Bochner defect, including one quarter of the squared-generator difference, so that its absolute value is at most $C_Bh^{2}B^{2}$ with $B=|b|+|H|$.

Choose finite $C_R,C_X$ so the weighted differential estimate of Step D is

$$
\Gamma_{2,D}(p)-(D_n p)^2/4 \ge -C_R |b|^2-C_X h|b||H|.
$$

Such constants are obtained from the compact $A_n^{\mathrm{eff}}$ ellipticity/$C^{2}$ bounds, the uniform weighted-Ricci bound, the Christoffel bound, and $\sup_n h^{-1}\lVert\nabla V_n\rVert$; these are precisely the bounds already established in Step A. Since $B^{2}\le 2(|b|^{2}+|H|^{2})$ and $h\le 1$, one explicit sufficient choice is

$$
K_{\mathrm{core}}= -[C_R+C_X/2+2 C_B]/c_0.
$$

This completes the uniform constant accounting for the quadratic-core statement.

The constructed configurations retain exact normal-source global-core membership for every admitted $g_{n}$ at the baseline forecast. The result extends the metric, form and local quadratic-curvature record to these variable metrics; the four-defect conclusion of Theorem D.6f.2m is proved at the flat member. ∎

<a id="theorem-44a-quantitatively-regular-branch-manifold-closure"></a>**Theorem 44a (Quantitatively Regular Branch Manifold Closure).** Assume the hypotheses of Theorem C.6c and the Mosco-liminf, recovery, and candidate-form identification hypotheses of Theorem D.6e. Write $\mathrm{Ch}_\infty=\mathcal E_\infty$ for the imported Cheeger energy in the one-half convention of Theorem C.6c.4, and define the full Dirichlet energy $\mathcal Q_\infty:=2\mathrm{Ch}_\infty$. The no-half integral below describes $\mathcal Q_\infty$, not an identity between these two scalar functionals. Let $X_{\mathrm{reg}}$ be the set of points $x\in X$ for which there are $r_x>0$, $C_x<\infty$, and $\alpha\in(0,1)$ such that every $y\in B_{r_x}(x)$ and every $r\in(0,r_x]$ admit compatible harmonic-coordinate charts along the approximating sequence with
$$
\limsup_{n\to\infty}
\left[
\frac{d_{GH}(B_r(y),B_r^{\mathbb R^4})}{r}
+
\left|
\frac{\mu_n(B_r(y))}{\omega_4r^4}-1
\right|
+
\mathrm{HarmEx}_n(y,r)
\right]
\le
C_xr^\alpha.
$$
Assume in those charts that the metric coefficients are uniformly elliptic, uniformly bounded in $C^{1,\alpha}$ on compact subcharts, and converge together with the quadratic energy coefficients. Then $X_{\mathrm{reg}}$ is open, every point of $X_{\mathrm{reg}}$ has unique tangent cone $\mathbb R^4$, and $X_{\mathrm{reg}}$ carries a $C^{1,\alpha}$ Riemannian metric $h_{ij}$ satisfying
$$
d\mu
=
\sqrt{\det h}\,d^4x,
\qquad
\mathcal Q_\infty(f)
=
2\mathcal E_\infty(f)
=
\int_{X_{\mathrm{reg}}}
h^{ij}\partial_i f\,\partial_j f\,
\sqrt{\det h}\,d^4x
$$
for every compactly supported Lipschitz function $f$ in a regular chart.

The metric $h$ in this theorem is a four-dimensional Riemannian auxiliary metric. Corollary O.7b.1 supplies a four-dimensional Lorentzian principal symbol only on its independent causal branch. If that branch also supplies a compatible $3+1$ foliation, a lapse $a\in C^{1,\alpha}$ satisfying $a>0$, vanishing shift, and a three-dimensional induced metric $\gamma_{ab}\in C^{1,\alpha}$, then its local Lorentzian metric has the form
$$
g
=
-a(x)^{-1}dt^2
+
\gamma_{ab}dx^adx^b,
\qquad a,b\in\{1,2,3\}.
$$

*Proof.* The defining quantitative certificate holds uniformly throughout $B_{r_x}(x)$, so each such ball is contained in $X_{\mathrm{reg}}$; hence $X_{\mathrm{reg}}$ is open. Dividing the first estimate by the scale and sending $r\downarrow0$ shows that every rescaled ball converges to the Euclidean unit ball, independently of the chosen sequence of scales. Thus the tangent cone is uniquely $\mathbb R^4$.

Uniform ellipticity and the local $C^{1,\alpha}$ bounds give, by Arzelà--Ascoli on nested compact subcharts, limiting coefficients $h_{ij}\in C^{1,\alpha}$. Compatibility of the harmonic charts makes these coefficients a Riemannian metric. The volume-ratio convergence and convergence of the chart measures identify the limit measure with $\sqrt{\det h}\,d^4x$. The Mosco liminf and recovery inequalities identify the Cheeger energy $\mathcal E_\infty$ imported from Theorem D.6e with its candidate quadratic form. In these Riemannian charts it has the Cheeger normalization of Theorem 35b.10, $\mathcal E_\infty(f)=\tfrac12\int h^{ij}\partial_i f\,\partial_j f\,d\mu$; doubling gives the displayed formula for $\mathcal Q_\infty$. Fixed positive scaling preserves Mosco convergence: for $c>0$, multiply the weak-liminf inequality by $c$, using $\liminf c a_n=c\liminf a_n$, and multiply the strong-recovery limsup inequality by $c$ on the same recovery sequence. Applying the same argument to $1/c$ gives the converse. Thus $\mathcal Q_\infty$ and $\mathcal E_\infty$ have the same domains and comparison maps, and the same metric, reference measure, physical clock and price. For the same nonpositive Laplace generator $L$, the $L^2$ gradient flow of $\mathcal E_\infty$ has generator $L$, the polarized Dirichlet form of $\mathcal Q_\infty$ is $-\langle f,Lg\rangle$, and the gradient flow of $\mathcal Q_\infty$ has generator $2L$; the heat flow imported here is the gradient flow of $\mathcal E_\infty$. On the independent causal branch, the $3+1$ foliation has one time coordinate and three spatial coordinates. Positivity of $a$ and positive-definiteness of $\gamma$ therefore give signature $(-,+,+,+)$. ∎

<a id="remark-d61-pu-motivation-for-hypotheses"></a>**Remark D.6.1 (PU motivation for hypotheses).**
(i) Theorem C.5 proves non-viability only on a registered quantitative branch where a super-linear-distance coherence certificate, a non-amortized traffic and budget certificate, a strong-convexity variance-cost certificate, or an independent-failure certificate yields a strict GC, RE, or LV inequality. Failure of Definition C.1 or C.2 alone gives no such conclusion. In the low-noise detailed-balance subcase of Theorem D.5, any potential gap established by one of those certificates produces exponentially larger stationary weight for the lower-potential sector. Equicoercivity for $\Gamma$-convergence remains a separate hypothesis and is not implied by the qualitative geometric definitions.
(ii) Remark C.3.3a supplies, conditional on the weighted-shell/local-isotropy bridge input or an equivalent replacement, an explicit local scalar curvature estimator built from Ollivier-Ricci curvature at mesh scale $h$, providing a concrete realization of the locality/consistency requirement for the Einstein-Hilbert term at the action level. It does not by itself furnish the Mosco/quadratic limit-energy or Euclidean-rigidity input used later in Section 11.4.
(iii) On the capacity-achieving, entropy-saturating, additive-ledger branch, Appendix E proves the operational area law and defines $G_{\mathrm{op}}$ (Theorem E.6), supplying the operational normalization used in Theorem D.6d. Identifying $G_{\mathrm{op}}$ with measured Newton $G$ is a separate calibration.

**Remark D.6.2 (Location of the Variational Hypotheses).** The variational conclusion uses three logically distinct entries. Theorems D.6b and D.6c supply the componentwise liminf inequalities on every relevant convergent sequence. Corollary D.6c.1 assumes a common recovery discretization and equicoercivity of the summed functional. Under those entries, adding the componentwise liminf inequalities and evaluating the sum on the common recovery discretization proves $\Gamma$-convergence; Theorem D.6 then proves convergence of minimum values and the cluster-point statement for approximate minimizers.

This appendix thus provides the conditional variational and action-level part of the PU dynamical bridge. Theorem D.6e selects vanishing continuum-control defects only under its competitor certificate and separately assumes the Mosco liminf, recovery, and Cheeger-energy identification hypotheses. The quantitative charts and metric-coefficient convergence used for manifold closure are additional hypotheses of Theorem 44a. The AQFT coarse-graining closure remains the separate Appendix F bridge.

<a id="summary-of-theorem-2-conditional-dynamical-functional-correspondence"></a>**Summary of Theorem 2 (Conditional Dynamical Functional Correspondence):**

Stable alignment is exact only when the measured per-MPU force faithfully identifies the true cost. Under the independently imposed quadratic proxy drift of Proposition D.1, expected mean-square misalignment obeys the upper bound of Corollary D.2. Lemma D.2 supplies the signed work-cost decomposition, and Theorem D.2a realizes that drift from the work-gap signal on its stopped affine-cost branch.

**Technical ledger.**
Corollary D.1 gives the exact equilibrium statement on its faithful-cost-identifiability branch. Proposition D.1 and Corollary D.2 give conditional proxy contraction and an asymptotic upper bound under their drift, invariant-subspace, and diffusion hypotheses. A work-gap implementation additionally requires the gain/sign/noncancellation certificate stated after Lemma D.2. Theorem D.5 identifies long-run averages with invariant-measure expectations under (A1)--(A6); its detailed-balance subbranch gives low-noise concentration near the global-minimum set. Calling that set regular additionally requires Theorem D.3's strict-comparison hypothesis.

*Proof Reference:* Corollary D.1 supplies exact alignment; Proposition D.1 and Corollary D.2 supply the conditional tracking bound; Lemma D.2 supplies the work-gap identity, and Theorem D.2a its stopped feedback realization. Theorem D.5 supplies ergodic averaging and detailed-balance concentration. Theorem D.3 supplies regularity only under strict comparison.

<a id="summary-of-theorem-43-geometric-regularity-on-the-strict-comparison-branch"></a>**Summary of Theorem 43 (Geometric Regularity on the Strict-Comparison Branch):**

On the detailed-balance branch of Theorem D.5, low-noise invariant measures concentrate near the configurations with the smallest total potential. Those configurations are geometrically regular when every irregular configuration has a regular admissible comparator with the same proxy-complexity coordinates and strictly smaller core potential, as in Theorem D.3.

**Technical ledger.**
Under (A1)–(A6), Equation (D.8) has the ergodic stationary regime of Theorem D.5. Under detailed balance, its low-noise invariant measures concentrate near the global-minimum set of $V$. If every irregular admissible configuration has a regular equal-proxy comparator with strictly smaller core potential, Theorem D.3 makes every such global minimizer geometrically regular. Without that comparison premise, Theorem D.5 still gives concentration near global minimizers but does not identify their geometry.

*Proof Reference:* Theorem D.5 gives ergodicity and conditional Gibbs concentration. The strict-comparison hypothesis followed by Theorem D.3 gives regularity of the minimizer set. ∎

**D.8 Rigorous Convergence Analysis for Complexity Adaptation**

This section studies the gradient flow of an effective complexity potential $V_{\mathrm{eff}}(C)$ obtained by constrained reduction of the full PCE potential $V(x)$. Application to the complexity adaptation dynamics of Section 6.4 requires a separate branch certificate identifying $-V_{\mathrm{eff}}'(C)$ with the Adaptation Driving Force of Definition 20. Under that identification and the interval and curvature hypotheses below, the convergence results give quantitative adaptation rates.

### D.8.1 Effective Complexity Potential and Equilibrium

<a id="definition-d5-effective-complexity-potential"></a>**Definition D.5 (Effective Complexity Potential).** 
The effective potential $V_{\mathrm{eff}}(C)$ is obtained by reducing the full PCE potential $V(x)$ (Definition D.1) to the complexity coordinate $C$, with the rigorous reduction supplied by Theorem D.5a below. The deterministic complexity dynamics are:

$$
\dot{C}(t) = \eta_{adapt} \Psi(C(t)), \quad \Psi(C) = -\frac{\partial V_{\mathrm{eff}}(C)}{\partial C}
\tag{D.13}
$$

<a id="theorem-d5a-constrained-reduction-and-free-energy-representation-of-v_eff"></a>**Theorem D.5a (Constrained Reduction and Free-Energy Representation of $V_{\mathrm{eff}}$).** Let $\mathcal{K}\subset\mathcal{X}_{adm}$ be the compact invariant set from assumption (A5), let $V\in C^2(\mathcal{K})$ be the PCE potential of Definition D.1, and let $\mathcal{C}:\mathcal{K}\to [C_{op},\infty)$ be a continuous complexity projection. For each admissible $C$ with nonempty level set
$$
\Sigma_C:=\{x\in\mathcal{K}:\mathcal{C}(x)=C\},
$$
define
$$
V_{\mathrm{eff}}(C):=\min_{x\in\Sigma_C}V(x).
\tag{D.13a}
$$
Then:

1. $V_{\mathrm{eff}}(C)$ is well-defined and the minimum is attained on $\Sigma_C$.

2. If $\sigma_C$ is any finite Borel measure on $\Sigma_C$ with full support, then the low-noise free-energy reduction
$$
V_{\mathrm{eff}}(C;\theta):=-\theta\ln\int_{\Sigma_C}e^{-V(x)/\theta}\,d\sigma_C(x)
\tag{D.13b}
$$
satisfies
$$
\lim_{\theta\downarrow0}V_{\mathrm{eff}}(C;\theta)=V_{\mathrm{eff}}(C).
\tag{D.13c}
$$

3. If locally $x=(C,y)$ and the constrained minimizer on $\Sigma_C$ is unique, written $x_*(C)=(C,y_*(C))$, then
$$
V_{\mathrm{eff}}(C)=V(C,y_*(C)).
$$

*Proof.* Because $\mathcal{C}$ is continuous, $\Sigma_C$ is closed in the compact set $\mathcal{K}$ and is therefore compact. Continuity of $V$ on $\Sigma_C$ implies that the minimum in (D.13a) is attained by the Weierstrass theorem, proving (1). For (2), let $m_C:=V_{\mathrm{eff}}(C)$. Since $V\ge m_C$ on $\Sigma_C$,
$$
\int_{\Sigma_C}e^{-V/\theta}\,d\sigma_C \le e^{-m_C/\theta}\sigma_C(\Sigma_C),
$$
hence
$$
-\theta\ln\int_{\Sigma_C}e^{-V/\theta}\,d\sigma_C \ge m_C-\theta\ln\sigma_C(\Sigma_C).
$$
Conversely, for any $\varepsilon>0$, the strict sublevel set
$$
U_\varepsilon
:=
\{x\in\Sigma_C:V(x)<m_C+\varepsilon\}
$$
is nonempty and relatively open in $\Sigma_C$. Full support therefore gives $\sigma_C(U_\varepsilon)>0$. Since $V(x)<m_C+\varepsilon$ on $U_\varepsilon$,
$$
\int_{\Sigma_C}e^{-V/\theta}\,d\sigma_C
\ge
e^{-(m_C+\varepsilon)/\theta}\sigma_C(U_\varepsilon),
$$
and hence
$$
-\theta\ln\int_{\Sigma_C}e^{-V/\theta}\,d\sigma_C
\le
m_C+\varepsilon-\theta\ln\sigma_C(U_\varepsilon).
$$
Letting $\theta\downarrow0$ and then $\varepsilon\downarrow0$ yields (D.13c). Statement (3) is immediate from the definition of the constrained minimizer in the local split $x=(C,y)$. ∎

<a id="remark-d5a1-relation-to-the-informal-marginalization-language"></a>**Remark D.5a.1 (Relation to the informal marginalization language).** The phrase “marginalizing over the remaining degrees of freedom at quasi-equilibrium conditioned on $C$” is represented rigorously here by constrained minimization, and equivalently by the low-noise free-energy reduction (D.13b)–(D.13c). In the detailed-balance low-noise regime of Theorem D.5, both constructions select the same reduced potential.

On a branch where an independent certificate identifies the reduced force $-V_{\mathrm{eff}}'(C)$ with the local Adaptation Driving Force of Equation (24), their common value is:
$$
\Psi(C) = \Gamma_0 \frac{\partial PP}{\partial C}(C) - \lambda R'(C) - R_I'(C)
$$

<a id="theorem-d5b-schur-complement-hessian-formula-for-v_eff"></a>**Theorem D.5b (Schur-Complement Hessian Formula for $V_{\mathrm{eff}}$).** Under the hypotheses of Theorem D.5a, assume a local coordinate split $x=(C,y)$ and a unique $C^1$ branch of constrained minimizers $y_*(C)$ satisfying $V_y(C,y_*(C))=0$ and with $V_{yy}(C,y_*(C))$ positive definite. Then $V_{\mathrm{eff}}(C)=V(C,y_*(C))$ is twice continuously differentiable and
$$
V_{\mathrm{eff}}''(C)=V_{CC}(C,y_*(C)) - V_{Cy}(C,y_*(C))V_{yy}(C,y_*(C))^{-1}V_{yC}(C,y_*(C)).
\tag{D.13d}
$$
Consequently,
$$
V_{\mathrm{eff}}''(C)=-\Psi'(C).
\tag{D.13e}
$$

*Proof.* Since $V_y(C,y_*(C))=0$ and $V_{yy}(C,y_*(C))$ is positive definite, the implicit-function theorem gives a $C^1$ branch $y_*(C)$ on the neighborhood under consideration. Differentiating $V_{\mathrm{eff}}(C)=V(C,y_*(C))$ once gives
$$
V_{\mathrm{eff}}'(C)=V_C(C,y_*(C))+V_y(C,y_*(C))y_*'(C)=V_C(C,y_*(C)),
$$
because $V_y$ vanishes on the minimizing branch. Differentiating the first-order condition $V_y(C,y_*(C))=0$ yields
$$
V_{yC}+V_{yy}y_*'(C)=0,
$$
hence
$$
y_*'(C)=-V_{yy}^{-1}V_{yC}.
$$
Differentiating $V_{\mathrm{eff}}'(C)=V_C(C,y_*(C))$ once more gives
$$
V_{\mathrm{eff}}''(C)=V_{CC}+V_{Cy}y_*'(C)=V_{CC}-V_{Cy}V_{yy}^{-1}V_{yC},
$$
which is (D.13d). Identity (D.13e) follows immediately from $\Psi(C)=-V_{\mathrm{eff}}'(C)$. ∎

<a id="corollary-d5b1-explicit-reduced-curvature-at-the-pce-optimum"></a>**Corollary D.5b.1 (Explicit Reduced Curvature at the PCE Optimum).** Assume the differentiable constrained-reduction hypotheses of Theorem D.5b, the local-force identification with Equation (24), and the exponential-response branch of Theorem 19. With $\hat{C}_{\mathrm{target}}$ held constant, let $C^\star>C_{op}$ be an interior PCE-optimal complexity. Then $\Psi(C^\star)=0$ by Equation (18), and the reduced curvature
$$
\kappa_C:=V_{\mathrm{eff}}''(C^\star)
$$
is
$$
\kappa_C = -\Gamma_0\,PP''(C^\star) + \lambda R''(C^\star) - \frac{r_I}{(C^\star)^2\ln 2}.
\tag{D.13f}
$$
Using Equation (22),
$$
PP''(C)=-(\beta-\alpha)\frac{\kappa_{\mathrm{eff}}^2}{\hat{C}_{\mathrm{target}}^2}e^{-\kappa_{\mathrm{eff}}(C-C_{op})/\hat{C}_{\mathrm{target}}},
$$
so
$$
\kappa_C = \Gamma_0(\beta-\alpha)\frac{\kappa_{\mathrm{eff}}^2}{\hat{C}_{\mathrm{target}}^2}e^{-\kappa_{\mathrm{eff}}(C^\star-C_{op})/\hat{C}_{\mathrm{target}}} + \lambda R''(C^\star) - \frac{r_I}{(C^\star)^2\ln 2}.
\tag{D.13g}
$$

*Proof.* From Equation (35), at fixed $\hat{C}_{\mathrm{target}}$,
$$
\Psi'(C)=\Gamma_0 PP''(C)-\lambda R''(C)+\frac{r_I}{C^2\ln 2}.
$$
Applying (D.13e) at $C=C^\star$ gives (D.13f). Substituting the second derivative of the Law of Prediction yields (D.13g). On the additional local strong-concavity branch of Theorem 22, $\Psi'(C^\star)\le-\mu<0$, so $\kappa_C\ge\mu>0$. ∎

<a id="theorem-d7-existence-uniqueness-and-stability-of-optimal-complexity"></a>**Theorem D.7 (Existence, Uniqueness, and Stability of Optimal Complexity).**
Let the viable complexity range be a compact interval $[C_-,C_+]$. Assume $\Psi\in C^1([C_-,C_+])$, DSC gives $\Psi'(C)<0$ throughout the interval, and
$$
\Psi(C_-)>0,
\qquad
\Psi(C_+)<0.
$$
Then there is a unique $C^\star\in(C_-,C_+)$ such that $\Psi(C^\star)=0$. It is the unique global minimizer of $V_{\mathrm{eff}}$, and
$$
\Psi(C)>0\quad(C<C^\star),
\qquad
\Psi(C)<0\quad(C>C^\star).
$$
Every solution of $\dot C=\eta_{\mathrm{adapt}}\Psi(C)$ with $C(0)\in[C_-,C_+]$ and $\eta_{\mathrm{adapt}}>0$ remains in the interval and converges to $C^\star$.

*Proof.* Continuity and the endpoint signs give at least one zero by the intermediate value theorem. Strict decrease of $\Psi$ makes the zero unique and gives the two sign statements. Since
$$
V_{\mathrm{eff}}''(C)=-\Psi'(C)>0,
$$
$V_{\mathrm{eff}}$ is strictly convex, so its unique critical point is its unique global minimizer on the interval. At $C_-$ the vector field points inward and at $C_+$ it points inward, so the interval is positively invariant. Along any nonstationary solution,
$$
\frac d{dt}V_{\mathrm{eff}}(C(t))
=
-\eta_{\mathrm{adapt}}\Psi(C(t))^2<0.
$$
Monotonicity of the scalar vector field makes a solution below $C^\star$ increase without crossing it and a solution above $C^\star$ decrease without crossing it. In either case the limit exists; continuity of $\Psi$ forces the limit to be its unique zero $C^\star$. ∎

### <a id="d82-polyak-łojasiewicz-condition-and-linear-convergence"></a>D.8.2 Polyak–Łojasiewicz Condition and Linear Convergence

Near the unique optimum, the strict convexity ensures a strong local gradient dominance condition that guarantees exponential convergence.

<a id="definition-d6-polyak-łojasiewicz-inequality"></a>**Definition D.6 (Polyak–Łojasiewicz Inequality).**
A function $V(C)$ satisfies the PL inequality with constant $\mu_{PL} > 0$ in a neighborhood $|C - C^\star| \le r$ if:

$$
\frac{1}{2}|\nabla V(C)|^2 \ge \mu_{PL} \big(V(C) - V(C^\star)\big)
\tag{D.14}
$$

A radius $r>0$ with a positive lower curvature bound can be chosen from continuity of $V_{\mathrm{eff}}''$ and $V_{\mathrm{eff}}''(C^\star)>0$. Quantitative bounds on higher derivatives can supply an explicit radius when those derivatives exist. A convergence guarantee based only on this local neighborhood requires the initial point and the resulting trajectory to remain in it; Theorem D.8 states its curvature bound on the whole invariant interval.

<a id="lemma-d7-pl-constant-from-stability"></a>**Lemma D.7 (PL Constant from Stability).**
Fix a neighborhood $|C-C^\star|\le r$ on which $\Psi$ is continuously differentiable. Define the strong monotonicity constant
$$
\underline{\lambda} := \inf_{|C-C^\star|\le r}\bigl(-\Psi'(C)\bigr).
$$
Assume the closed neighborhood $[C^\star-r,C^\star+r]$ is contained in the viable interval $[C_-,C_+]$ of Theorem D.7. Its hypothesis $\Psi'(C)<0$ throughout that interval and continuity imply, by compactness of the neighborhood, that $\underline{\lambda}>0$. On this neighborhood the effective potential $V_{\mathrm{eff}}$ satisfies the PL inequality with constant
$$
\mu_{PL} = \underline{\lambda}
\tag{D.14a}
$$

*Proof.* Since $\Psi(C)=-V'_{\mathrm{eff}}(C)$, we have $V''_{\mathrm{eff}}(C)=-\Psi'(C)\ge\underline{\lambda}$ on $|C-C^\star|\le r$, so $V_{\mathrm{eff}}$ is $\underline{\lambda}$-strongly convex there. Let $C^\star$ be its unique minimizer (Theorem D.7), so $V'_{\mathrm{eff}}(C^\star)=0$. Strong convexity implies for any $C$ in the neighborhood
$$
V_{\mathrm{eff}}(C^\star)\ge V_{\mathrm{eff}}(C)+V'_{\mathrm{eff}}(C)(C^\star-C)+\frac{\underline{\lambda}}{2}(C^\star-C)^2.
$$
Rearranging and applying Cauchy–Schwarz and Young's inequality,
$$
V_{\mathrm{eff}}(C)-V_{\mathrm{eff}}(C^\star)
\le |V'_{\mathrm{eff}}(C)|\,|C-C^\star|-\frac{\underline{\lambda}}{2}|C-C^\star|^2
\le \frac{1}{2\underline{\lambda}}|V'_{\mathrm{eff}}(C)|^2.
$$
Multiplying by $\underline{\lambda}$ yields $\frac{1}{2}|V'_{\mathrm{eff}}(C)|^2 \ge \underline{\lambda}\bigl(V_{\mathrm{eff}}(C)-V_{\mathrm{eff}}(C^\star)\bigr)$, which is exactly (D.14) with $\mu_{PL}=\underline{\lambda}$. QED

### D.8.3 Convergence Theorem with Explicit Rates

<a id="theorem-d8-exponential-convergence-of-complexity-adaptation"></a>**Theorem D.8 (Exponential Convergence of Complexity Adaptation).**
Let $I=[C_-,C_+]$ be the invariant viable interval of Theorem D.7 and assume throughout $I$ that
$$
0<\underline\lambda
\le
V_{\mathrm{eff}}''(C)
\le
L_{\mathrm{eff}}<\infty.
$$

**Part I (Deterministic Rate).** Every deterministic solution of (D.13) with $C(0)\in I$ satisfies
$$
|C(t)-C^\star|
\le
e^{-\underline\lambda\eta_{\mathrm{adapt}}t}|C(0)-C^\star|.
\tag{D.15}
$$

**Part II (Stochastic Expected-Gap Upper Bound).** Assume that the complexity coordinate is an Itô diffusion on $I$,
$$
dC_t
=
\eta_{\mathrm{adapt}}\Psi(C_t)dt
+
\sqrt{2D_{CC}(x(t))}\,dB_t,
$$
with boundary behavior making $I$ invariant and producing no boundary local-time term in Itô's formula for $V_{\mathrm{eff}}$ (for example, $D_{CC}=0$ at the endpoints with inward drift), and with
$$
0\le D_{CC}(x)\le D_{CC}^{\max}<\infty.
$$
Then
$$
\mathbb E\bigl[V_{\mathrm{eff}}(C_t)-V_{\mathrm{eff}}(C^\star)\bigr]
\le
e^{-2\underline\lambda\eta_{\mathrm{adapt}}t}
\bigl(V_{\mathrm{eff}}(C_0)-V_{\mathrm{eff}}(C^\star)\bigr)
+
\frac{D_{CC}^{\max}L_{\mathrm{eff}}}{2\underline\lambda\eta_{\mathrm{adapt}}}
\left(1-e^{-2\underline\lambda\eta_{\mathrm{adapt}}t}\right).
\tag{D.16}
$$

*Proof.*

**Part I:** Let $e(t):=C(t)-C^\star$. Since $\Psi(C^\star)=0$ and $\Psi'(C)\le-\underline{\lambda}$ throughout the invariant interval $I$, the segment between $C(t)$ and $C^\star$ lies in that interval. The mean-value theorem gives
$$
e(t)\,\Psi(C(t)) = e(t)\bigl(\Psi(C(t))-\Psi(C^\star)\bigr) \le -\underline{\lambda}|e(t)|^2.
$$
Using $\dot e(t)=\eta_{adapt}\Psi(C(t))$,
$$
\frac{d}{dt}\frac{|e(t)|^2}{2} = e(t)\dot e(t) = \eta_{adapt}e(t)\Psi(C(t)) \le -\underline{\lambda}\eta_{adapt}|e(t)|^2.
$$
Gronwall's inequality yields (D.15).

**Part II:** Apply Ito's formula to the potential gap
$$
G(C_t):=V_{\mathrm{eff}}(C_t)-V_{\mathrm{eff}}(C^\star).
$$
Using $V'_{\mathrm{eff}}(C)=-\Psi(C)$ and $dC_t = -\eta_{adapt}V'_{\mathrm{eff}}(C_t)dt + \sqrt{2D_{CC}(x(t))}\,dB_t$, we obtain
$$
dG(C_t)= -\eta_{adapt}|V'_{\mathrm{eff}}(C_t)|^2dt + V'_{\mathrm{eff}}(C_t)\sqrt{2D_{CC}(x(t))}\,dB_t + D_{CC}(x(t))V''_{\mathrm{eff}}(C_t)dt.
$$
Taking expectations eliminates the martingale term and gives
$$
\frac{d}{dt}\mathbb E[G(C_t)]
\le -\eta_{adapt}\,\mathbb E\bigl[|V'_{\mathrm{eff}}(C_t)|^2\bigr] + D_{CC}^{\max}L_{\mathrm{eff}}.
$$
By the PL inequality (D.14) with $\mu_{PL}=\underline{\lambda}$ (Lemma D.7),
$$
\frac{1}{2}|V'_{\mathrm{eff}}(C)|^2 \ge \underline{\lambda}\bigl(V_{\mathrm{eff}}(C)-V_{\mathrm{eff}}(C^\star)\bigr)=\underline{\lambda}G(C),
$$
hence
$$
\frac{d}{dt}\mathbb E[G(C_t)]
\le -2\underline{\lambda}\eta_{adapt}\,\mathbb E[G(C_t)] + D_{CC}^{\max}L_{\mathrm{eff}}.
$$
Solving this linear differential inequality yields (D.16). Its second term is an upper bound on the long-time expected potential gap. A positive stochastic noise floor would require an independent lower diffusion bound and a stationary-variance argument. ∎

### D.8.4 Physical Interpretation

**Conditional Local Relaxation:** On the invariant interval and under the two-sided curvature bounds of Theorem D.8, the deterministic complexity coordinate converges exponentially to $C^\star$ with rate $\underline{\lambda}\eta_{\mathrm{adapt}}$. The theorem fixes no absolute comparison with an environmental timescale; such a comparison requires calibrated values of $\underline{\lambda}$, $\eta_{\mathrm{adapt}}$, and the environmental rate.

**Stochastic Upper Bound:** For the projected Itô branch of Theorem D.8, Equation (D.16) gives an exponentially relaxing upper bound on the expected potential gap,
$$
\limsup_{t\to\infty}\mathbb E\!\left[V_{\mathrm{eff}}(C_t)-V_{\mathrm{eff}}(C^\star)\right]
\le
\frac{D_{CC}^{\max}L_{\mathrm{eff}}}{2\underline{\lambda}\eta_{\mathrm{adapt}}}.
$$
A positive floor requires an independent lower diffusion bound and a stationary-variance theorem, and identifying the diffusion with ND--RID or registered-reset physics requires a separate realization map.

**Connection to Global Dynamics:** This local analysis complements Theorem D.5. The global theorem gives ergodic stationary averaging for the full configuration dynamics and, in detailed-balance low-noise regimes, concentration of stationary mass near the lowest-potential set. Theorem D.8 supplies the deterministic local rate and the stochastic expected-gap upper bound on its declared invariant branch. These results provide a conditional local tracking component for Theorem 2.

### D.8.5 PCE Marginality and 1/f Spectra

This subsection records the spectral consequence of stochastic PCE dynamics near a marginal viability surface. It is the linear response form of Equation D.8 when the active relaxation spectrum has no preferred update scale inside a finite operational band.

<a id="definition-d8a-prediction-error-spectral-observable"></a>**Definition D.8a (Prediction-Error Spectral Observable).** Let $x^*$ be a PCE operating point for the stochastic dynamics (D.8), and write $\xi_t=x_t-x^*$ in a local chart. A scalar prediction-error observable is any centered linear readout
$$
e(t)=\ell(\xi_t),
\tag{D.17}
$$
where $\ell$ is a continuous linear functional on the local tangent space. Its two-sided angular-frequency power spectrum is
$$
S_e(\omega)=\int_{-\infty}^{\infty} e^{-i\omega\tau}\,\mathbb E[e(t+\tau)e(t)]\,d\tau.
\tag{D.18}
$$

<a id="lemma-d8a-modal-lorentzian-spectrum"></a>**Lemma D.8a (Modal Lorentzian Spectrum).** Suppose one stable relaxation mode of the linearized PCE flow has the stationary Ornstein-Uhlenbeck form
$$
dy_t=-\lambda y_t\,dt+\sqrt{2\lambda a}\,dB_t,
\qquad \lambda>0,\quad a>0.
\tag{D.19}
$$
Then its stationary variance is $a$, its autocovariance is $a e^{-\lambda|\tau|}$, and its power spectrum is
$$
S_\lambda(\omega)=\frac{2a\lambda}{\omega^2+\lambda^2}.
\tag{D.20}
$$

*Proof.* The stationary variance of (D.19) solves
$$
0=-2\lambda\,\mathrm{Var}(y_t)+2\lambda a,
$$
hence $\mathrm{Var}(y_t)=a$. The Markov solution gives
$$
\mathbb E[y(t+\tau)y(t)]=a e^{-\lambda|\tau|}.
$$
Taking the Fourier transform,
$$
\int_{-\infty}^{\infty}a e^{-\lambda|\tau|}e^{-i\omega\tau}\,d\tau
=
2a\int_0^\infty e^{-\lambda\tau}\cos(\omega\tau)\,d\tau
=
\frac{2a\lambda}{\omega^2+\lambda^2}.
$$
This proves (D.20). ∎

<a id="definition-d8b-marginal-pce-relaxation-band"></a>**Definition D.8b (Marginal PCE Relaxation Band).** A PCE operating point $x^*$ has an active marginal relaxation band $[\lambda_{\min},\lambda_{\max}]$ if the linearized prediction-error observable decomposes into stable relaxation modes whose rates fill the interval with logarithmic rate density $q(\lambda)\,d\log\lambda$, amplitudes $a(\lambda)>0$, and
$$
0<\lambda_{\min}\ll \lambda_{\max}<\infty.
$$
The band is called locally scale-neutral when the active mode-weight product
$$
h(\lambda):=a(\lambda)q(\lambda)
\tag{D.21}
$$
has no resolved rate dependence on the band, i.e. $h(\lambda)=h_0+o(1)$ over the operationally observed inertial interval.

<a id="theorem-d8a-spectral-exponent-from-the-pce-relaxation-density"></a>**Theorem D.8a (Spectral Exponent from the PCE Relaxation Density).** Let the centered observable be a superposition of stationary modes satisfying Lemma D.8a, and assume distinct modes have zero cross spectrum, equivalently
$$
\mathbb E[y_\lambda(t+\tau)y_{\lambda'}(t)]=0
\qquad(\lambda\ne\lambda',\ \tau\in\mathbb R).
$$
Consider a scaling regime in which
$$
\frac{\lambda_{\min}}{\omega}\to0,
\qquad
\frac{\lambda_{\max}}{\omega}\to\infty,
\tag{D.22}
$$
and suppose
$$
h(\lambda)=A_0\lambda^s(1+r_\omega(\lambda)),
\qquad
-1<s<1,\quad A_0>0,
\tag{D.23}
$$
where $r_\omega(\omega u)\to0$ pointwise for $u>0$ in the scaling regime. Assume there is one function $G\in L^1((0,\infty),du)$ such that, throughout that regime,
$$
\mathbf 1_{[\lambda_{\min}/\omega,\lambda_{\max}/\omega]}(u)
\frac{u^s}{1+u^2}\,\lvert r_\omega(\omega u)\rvert
\le G(u)
\quad\text{for almost every }u>0.
$$
This is a domination hypothesis on the rescaled error integrand.
Then
$$
S_e(\omega)
\sim
\frac{\pi A_0}{\cos(\pi s/2)}\,\omega^{s-1},
\tag{D.24}
$$
and therefore the observed power-law exponent in $S_e(f)\propto f^{-\beta_{\mathrm{spec}}}$ is
$$
\boxed{\beta_{\mathrm{spec}}=1-s.}
\tag{D.25}
$$
In particular, the locally scale-neutral case $s=0$ gives
$$
S_e(\omega)\sim \frac{\pi A_0}{\omega},
\qquad
S_e(f)\propto \frac{1}{f}.
\tag{D.26}
$$

*Proof.* Summing the modal spectra (D.20) over the logarithmic rate density gives
$$
S_e(\omega)
=
\int_{\lambda_{\min}}^{\lambda_{\max}}
\frac{2a(\lambda)\lambda}{\omega^2+\lambda^2}\,q(\lambda)\,d\log\lambda.
$$
Since $d\log\lambda=d\lambda/\lambda$, this reduces to
$$
S_e(\omega)
=
\int_{\lambda_{\min}}^{\lambda_{\max}}
\frac{2h(\lambda)}{\omega^2+\lambda^2}\,d\lambda.
\tag{D.27}
$$
Using (D.23) and setting $\lambda=\omega u$,
$$
S_e(\omega)
=
2A_0\omega^{s-1}
\int_{\lambda_{\min}/\omega}^{\lambda_{\max}/\omega}
\frac{u^s}{1+u^2}\,du\,(1+o(1)).
$$
Under (D.22), the lower limit tends to $0$ and the upper limit tends to $\infty$. Since $-1<s<1$,
$$
\int_0^\infty \frac{u^s}{1+u^2}\,du
=
\frac{\pi}{2\cos(\pi s/2)}.
\tag{D.28}
$$
Substituting (D.28) yields (D.24), and (D.25) follows by comparison with $S_e(f)\propto f^{-\beta_{\mathrm{spec}}}$. The case $s=0$ gives (D.26). ∎

<a id="theorem-d8b-pce-selection-of-pink-spectra-on-the-scale-neutral-marginal-branch"></a>**Theorem D.8b (PCE Selection of Pink Spectra on the Scale-Neutral Marginal Branch).** Assume the stationary-mode and zero-cross-spectrum hypotheses of Theorem D.8a. Suppose a marginal relaxation band satisfies the following PCE neutrality conditions:

1. the band is inside the viable Space of Becoming, so no mode in the band is individually prohibited by Axiom 3;
2. the coarse-grained predictive benefit of retaining an active mode is independent of $\log\lambda$ across the band;
3. the resource cost of retaining an active mode is independent of $\log\lambda$ across the band after the fixed endpoints $\lambda_{\min},\lambda_{\max}$ are set by the fastest and slowest physically available update processes;
4. the endpoints obey $0<\lambda_{\min}<\lambda_{\max}<\infty$, the total active weight $W=\int_I h(e^u)\,du$ is prescribed with $0<W<\infty$, and the admissible normalized profiles include $\rho_0(u)=|I|^{-1}$ on $I=[\log\lambda_{\min},\log\lambda_{\max}]$. Among profiles with this total weight, the only profile-dependent term in the reduced PCE potential is
$$
V_{\mathrm{spec}}[\rho]
=
\chi D_{\mathrm{KL}}\!\left(\rho\middle\| |I|^{-1}\right)
=
\chi\int_I\rho(u)\log\frac{\rho(u)}{|I|^{-1}}\,du,
\qquad
\chi>0,
$$
where $u=\log\lambda$ and $\rho(u)=h(e^u)/W$ is a probability density. Profiles that agree almost everywhere are identified.

Then PCE selects a locally scale-neutral active profile $h(\lambda)=h_0$ on the band. Consequently, in the scaling regime (D.22), the prediction-error spectrum satisfies
$$
S_e(\omega)\sim\frac{\pi h_0}{\omega},\qquad \omega=2\pi f>0.
$$
The finite-band endpoint corrections are given by Equation (D.30).

*Proof.* Let $u=\log\lambda$ and let $I=[u_{\min},u_{\max}]$. Normalize the active mode-weight profile on $I$ by
$$
\rho(u)=\frac{h(e^u)}{\int_I h(e^v)\,dv}.
$$
Assumptions 1–3 remove rate-dependent benefit and physical resource terms within the admitted comparison. Assumption 4 separately supplies the relative-description cost below and admits the uniform profile. Its minimum is therefore obtained by minimizing this nonnegative functional over the admissible profiles:
$$
V_{\mathrm{spec}}[\rho]
=
\chi\int_I \rho(u)\log\frac{\rho(u)}{|I|^{-1}}\,du,
\qquad \chi>0.
\tag{D.29}
$$
By Gibbs' inequality,
$$
V_{\mathrm{spec}}[\rho]\ge 0,
$$
with equality if and only if $\rho(u)=|I|^{-1}$ almost everywhere. Thus PCE selects the rate-unlabeled profile. In the modal representation (D.27), this is exactly the locally scale-neutral branch $h(\lambda)=h_0$ over the observed band, up to endpoint corrections. Theorem D.8a with $s=0$ then gives $S_e(f)\propto 1/f$. ∎

<a id="corollary-d8b1-finite-pink-band-and-endpoint-cutoffs"></a>**Corollary D.8b.1 (Finite Pink Band and Endpoint Cutoffs).** In the exactly scale-neutral case $h(\lambda)=h_0$ on $[\lambda_{\min},\lambda_{\max}]$,
$$
S_e(\omega)
=
\frac{2h_0}{\omega}
\left[
\arctan\left(\frac{\lambda_{\max}}{\omega}\right)
-
\arctan\left(\frac{\lambda_{\min}}{\omega}\right)
\right].
\tag{D.30}
$$
Hence no PU system predicts exact $1/f$ behavior at all frequencies. Pink scaling holds only in the finite operational window
$$
\lambda_{\min}\ll \omega\ll \lambda_{\max}.
$$

*Proof.* Substitute $h(\lambda)=h_0$ into (D.27):
$$
S_e(\omega)=2h_0\int_{\lambda_{\min}}^{\lambda_{\max}}\frac{d\lambda}{\omega^2+\lambda^2}.
$$
The antiderivative is $\omega^{-1}\arctan(\lambda/\omega)$, giving (D.30). If $\lambda_{\min}\ll\omega\ll\lambda_{\max}$, the bracket tends to $\pi/2$, so $S_e(\omega)\sim \pi h_0/\omega$. Outside that interval, one of the endpoint cutoffs is resolved and exact pink scaling is lost. ∎

<a id="corollary-d8b2-failure-modes-away-from-criticality"></a>**Corollary D.8b.2 (Failure Modes Away from Criticality).** Departures from $1/f$ are not failures of PCE. Under the stationary-mode, zero-cross-spectrum, scaling, and remainder hypotheses of Theorem D.8a, an active profile $h(\lambda)\sim\lambda^s$ with $-1<s<1$ gives $\beta_{\mathrm{spec}}=1-s$. If damage, overload, or loss of adaptive degrees of freedom narrows the band so that $\lambda_{\min}$ and $\lambda_{\max}$ are not widely separated, the spectrum is governed by the finite-band integral (D.27); Equation (D.30) applies when $h(\lambda)=h_0$.

<a id="theorem-d85c-coverage-complete-relaxation-mixture-inversion-and-ou-source"></a>**Theorem D.8.5c (Coverage-Complete Relaxation-Mixture Inversion and OU Source).** Fix $0<a<b<\infty$. A nonnegative even spectrum $S$ belongs to the finite-band independent-relaxation class exactly when
$$
F(z):=S(\sqrt z)
=\int_{[a^2,b^2]}\frac{\nu(dt)}{t+z}
\qquad(z>0)
\tag{D.31}
$$
for a finite positive Borel measure $\nu$. In that case $\nu$ is unique, and the unique modal weight measure $m$ in
$$
S(\omega)=\int_{[a,b]}
\frac{2\lambda}{\lambda^2+\omega^2}\,m(d\lambda)
\tag{D.32}
$$
is determined by
$$
\nu(B)=\int_{\{\lambda:\lambda^2\in B\}}2\lambda\,m(d\lambda).
\tag{D.33}
$$
At every continuity point, the cumulative measure is recovered by the Stieltjes boundary formula
$$
\nu((u,v))
=-\frac1\pi\lim_{\epsilon\downarrow0}
\int_u^v\operatorname{Im}F(-t+i\epsilon)\,dt.
\tag{D.34}
$$

Every such measure has a formal microscopic source: take mutually orthogonal stationary OU coordinates with rate $\lambda$ and variance measure $m$, or equivalently the Gaussian stochastic integral whose covariance is
$$
C(\tau)=\int_{[a,b]}e^{-\lambda|\tau|}\,m(d\lambda).
\tag{D.35}
$$
Its Fourier spectrum is exactly (D.32). Atomic approximations to $m$ give finite independent OU banks whose covariance functions and spectra converge pointwise to (D.35) and (D.32).

For the scale-neutral density $m(d\lambda)=h_0\lambda^{-1}d\lambda$ after conversion to the logarithmic-mode convention of Definition D.8b, Equation (D.32) is Equation (D.30), with endpoints $a,b$. Replacing $h_0$ by $A_0\lambda^s$ gives the exponent $\beta_{\mathrm{spec}}=1-s$ only for $-1<s<1$ in the scaling regime (D.22) covered by Theorem D.8a.

*Proof.* The change of variables $t=\lambda^2$ converts (D.32) into (D.31) with (D.33). Uniqueness and (D.34) are the Stieltjes inversion theorem for finite positive measures on a compact interval; hence the representation is coverage-complete rather than merely sufficient. A stationary OU coordinate of rate $\lambda$ and variance element $m(d\lambda)$ contributes covariance $e^{-\lambda|\tau|}m(d\lambda)$ and Lorentzian spectrum $2\lambda(\lambda^2+\omega^2)^{-1}m(d\lambda)$. Orthogonality removes cross terms, proving (D.35)--(D.32). Approximation of a finite measure by atomic measures and dominated convergence give the finite-bank limits. The final claims are direct substitutions into Theorem D.8a and Corollary D.8b.1. ∎

<a id="theorem-d85d-finite-clock-gated-source-fluctuation-limit-and-psd-error"></a>**Theorem D.8.5d (Finite Clock-Gated Source, Fluctuation Limit and PSD Error).** Fix attempt rate $\nu>0$, inverse-energy parameter $\beta>0$, barriers $0\le E_-<E_+<\infty$, readout variance $W>0$, and integers $N,M\ge1$. Define
$$
E_j=E_+-\frac{j-1/2}{N}(E_+-E_-),\quad
a=\nu e^{-\beta E_+},\quad b=\nu e^{-\beta E_-},\quad
L=\ln(b/a),\quad\lambda_j=ae^{(j-1/2)L/N}.
$$
Each of $NM$ independent spins $\sigma_{j,r}\in\{-1,1\}$ has a Poisson attempt clock of rate $\nu/2$ and independently accepts each flip with probability $e^{-\beta E_j}$. These clocks, gates, barrier spacing and readout gains are the prescribed kinetic source. On the finite state space its generator and readout are
$$
(\mathcal L_{N,M}F)(\sigma)=\sum_{j,r}\frac{\lambda_j}{2}[F(\sigma^{j,r})-F(\sigma)],\quad
Y_j^{(M)}=\sqrt{\frac W{NM}}\sum_r\sigma_{j,r},\quad e_{N,M}=\sum_jY_j^{(M)}.
\tag{D.8.5d.1}
$$
Initialize uniformly and independently. The uniform law is the unique detailed-balance equilibrium, the readout has variance $W$, and for every finite $M$ its exact stationary covariance and two-sided angular-frequency spectrum are
$$
C_N(t)=\frac WN\sum_je^{-\lambda_j|t|},\qquad
S_N(\omega)=\frac WN\sum_j\frac{2\lambda_j}{\lambda_j^2+\omega^2}.
\tag{D.8.5d.2}
$$
The slowest and fastest readout relaxation rates are $ae^{L/(2N)}$ and $be^{-L/(2N)}$. The accepted flip rate is half the corresponding relaxation rate. Modal conditional means obey $\mathbb E[Y_j^{(M)}(t)\mid Y_j^{(M)}(0)=y]=e^{-\lambda_jt}y$.

For fixed $N$ and inputs, as $M\to\infty$ the stationary path law on $D([0,T],\mathbb R^N)$ converges for every finite $T$ to independent stationary coordinates
$$
dY_j=-\lambda_jY_jdt+\sqrt{2\lambda_jW/N}\,dB_j.
\tag{D.8.5d.3}
$$
This is the Euclidean stochastic PCE model with $V_N(y)=N|y|^2/(2W)$ and mobility and diffusion matrix both equal to $\operatorname{diag}(\lambda_jW/N)$. Its confining Gaussian equilibrium is proportional to $e^{-V_N}$.

Put, for $\omega>0$,
$$
S(\omega)=\frac{2W}{L\omega}[\arctan(b/\omega)-\arctan(a/\omega)],\qquad
P(\omega)=\frac{\pi W}{L\omega}.
$$
Then
$$
|S_N(\omega)-S(\omega)|\le\frac{WL^2}{24N^2\omega},\qquad
\sup_{\omega\in\mathbb R}|S_N(\omega)-S(\omega)|\le\frac{WL^2}{12N^2a},
\tag{D.8.5d.4}
$$
$$
\sup_t\left|C_N(t)-\frac WL\int_{\ln a}^{\ln b}e^{-|t|e^u}du\right|
\le\frac{WL^2}{24N^2},\qquad
\left|\frac{S_N(\omega)}{P(\omega)}-1\right|
\le\frac2\pi\left(\frac a\omega+\frac\omega b\right)+\frac{L^3}{24\pi N^2}.
\tag{D.8.5d.5}
$$
In particular, relative tolerance $\varepsilon\in(0,1)$ is certified when
$$
N^2\ge\frac{L^3}{12\pi\varepsilon},\qquad
\frac{8a}{\pi\varepsilon}\le\omega\le\frac{\pi\varepsilon b}{8}.
\tag{D.8.5d.6}
$$
This interval is nonempty if $b/a\ge64/(\pi^2\varepsilon^2)$.

*Proof.* Thinning a Poisson clock gives rate $\nu e^{-\beta E_j}/2=\lambda_j/2$, establishing the generator. Every reverse transition has the same positive rate; irreducibility gives the unique uniform equilibrium and Theorem D.6.5a gives its relative-entropy decrease. One spin satisfies $\mathcal L\sigma=-\lambda_j\sigma$, so its stationary covariance is $e^{-\lambda_j|t|}$ and its conditional mean is $e^{-\lambda_jt}\sigma(0)$. Independence and the readout normalization give covariance and variance in (D.8.5d.2). Fourier transformation of the exponential gives the displayed spectrum. The first and last nodes give the endpoint rates.

Set $c_M=\sqrt{W/(NM)}$. The martingale
$$
Z_j^{(M)}(t)=Y_j^{(M)}(t)-Y_j^{(M)}(0)+\lambda_j\int_0^tY_j^{(M)}(s)ds
$$
has jumps bounded by $2c_M$ and exact predictable covariations
$$
\langle Z_i^{(M)},Z_j^{(M)}\rangle_t=\mathbf1_{i=j}\,2\lambda_j(W/N)t.
$$
The initial characteristic functions $(\cos(c_Mz))^M$ converge to $e^{-Wz^2/(2N)}$. Variation of constants and Doob's inequality give a uniform bound on $\mathbb E\sup_{t\le T}|Y_j^{(M)}(t)|^2$. For a bounded stopping time and an increment of length $h$, martingale second moments are at most $2\lambda_j(W/N)h$, and drift second moments are bounded by a constant times $h^2$ using that sup bound. These estimates give tightness, and vanishing jumps make every limit continuous. Taylor expansion of a compactly supported smooth test function in the finite generator gives, locally uniformly,
$$
\mathcal A_M\varphi(y)=\sum_j[-\lambda_jy_j\partial_j\varphi+\lambda_j(W/N)\partial_{jj}\varphi]+O(M^{-1/2});
$$
the remainder is the sum of $O(M)$ jumps with cubically bounded increments $O(M^{-3/2})$. Localization passes its martingale identities to the limit. The resulting linear martingale problem is unique, by the explicit variation-of-constants solution and continuous-martingale Brownian characterization, yielding (D.8.5d.3) with independent Brownian noises and stationary Gaussian initial law. The martingale convergence theorem and tightness criteria are those of (Whitt 2007, Theorem 2.1 and §§3–5). Substitution of $V_N$ and the mobility gives the stated PCE drift and diffusion, preserving the modal mean and all stationary second-order responses in the same units.

For an interval of length $L$, midpoint quadrature of its average has error at most $L^2\|g''\|_\infty/(24N^2)$. The spectral kernel is $g_\omega(u)=\omega^{-1}\operatorname{sech}(u-\ln\omega)$, and $|g_\omega''|\le g_\omega\le\min(1/\omega,2/a)$. At zero frequency use $g_0(u)=2e^{-u}$. These bounds give (D.8.5d.4). For $g_t(u)=e^{-|t|e^u}$, its second derivative is $(z^2-z)e^{-z}$, $z=|t|e^u$, of absolute value at most $4/e^2+1/e<1$, proving the covariance estimate. Finally
$$
\frac{S(\omega)}{P(\omega)}=1-\frac2\pi[\arctan(a/\omega)+\arctan(\omega/b)].
$$
Use $0\le\arctan x\le x$, divide the quadrature bound by $P$, and substitute (D.8.5d.6). Each endpoint term is at most $\varepsilon/4$ and the quadrature term at most $\varepsilon/2$. ∎

The construction is a finite formal update source with a response-preserving fluctuation limit for modal means and stationary second-order readouts. Its normalization is $h_0=W/\ln(b/a)$ and $(2\pi)^{-1}\int S_N(\omega)d\omega=W$. The input rate and gain records fix these values before evaluating the spectrum. A physical realization requires a domain-frozen PU update source and an independently specified export that supply these kinetic and readout inputs and the retained protocol map; comparison with observed spectra is a separate empirical test.

<a id="proposition-d85e-stationary-cost-does-not-identify-clock-and-readout-scales"></a>**Proposition D.8.5e (Stationary Cost Does Not Identify Clock and Readout Scales).** In the class of finite irreducible detailed-balance chains with the same uniform stationary law and its relative-entropy PCE cost, that cost determines neither the relaxation-clock scale nor the readout normalization.

*Proof.* Multiplying every positive rate by $c>0$ preserves the state space, detailed balance, stationary law and relative-entropy functional. It replaces $C(t)$ by $C(ct)$ and $S(\omega)$ by $c^{-1}S(\omega/c)$, changing every relaxation endpoint by $c$. Independently multiplying the readout by $g$ changes the covariance and spectrum by $g^2$ without changing the chain or its stationary cost. The spin family of Theorem D.8.5d realizes both variations. ∎

This identifies pink noise as the macroscopic spectral signature of PCE-regulated predictive systems operating near a marginal viability surface with no privileged update scale.

<a id="definition-d85k-finite-pce-task-loss-collision-source"></a>**Definition D.8.5k (Finite PCE Task-Loss Collision Source).** Retain the finite reset-link source and task of Definition Q.2.4c and Theorem Q.2.4d. The following construction supplies its explicitly extended fixed-fixture, stationary-preparation, native collision, snapshot and complete-record interface; those additional services are declared parts of this source.

##### 1. Frozen numerical source and the meaning of its readout

The actual finite menu is fixed before any observed spectrum: $L=1$, $A=4$, Q10 frame duration $\tau_{Q}=1$ second, primitive Q10 service prices one resource unit, $(a,b,c,r,\gamma)=(2,2,3,1,1/2)$, and a frozen inverse total-resource noise parameter $\eta_{\mathrm{noise}}=2\ln 2$ per resource unit. The production/comparison objective uses the actual full descriptor duration $D_{\mathrm{new}}$ below, so its rate-conjugate $\beta_{\mathrm{new}}=\eta_{\mathrm{noise}}D_{\mathrm{new}}$. The one-second frame of Definition Q.2.4c uses the numerically equal legacy rate-conjugate $\beta_{Q}=2\ln 2$; these conjugate parameters must not be conflated. The independent collision clock has $\nu=1$ per second. No clock rate is inferred from a stationary objective. The finite physical periodogram protocol has $J=16$, sample spacing $\Delta=1$ second, snapshot pulse duration $\epsilon=2^{-30}$ seconds, event budget $B=127$ plus retained overflow event 128, and live interval $T=15+\epsilon$ seconds. All other additional unitary slots have duration $\delta=1/160$ second. This agrees with the Q10 slot duration $\tau_Q/(32A+32)$. The complete finite schedule fixes $D_{\mathrm{new}}$ first; $\eta_{\mathrm{noise}}$ is then independently nominated as $2\ln 2$ per resource unit and $\beta_{\mathrm{new}}$ is obtained by the stated unit conversion. None is selected from a spectrum observation. These are fixed calibrated source coefficients, not runtime arbitrary-real inputs.

Index $x=4(q-1)+2(k-1)+(g-1)$, $q,k,g$ in $\{1,2\}$. The actual production module below re-executes the net-cost menu of Theorem Q.2.4d. Its resource-cost differences are 4 times the differences of $h=(17/2,25/4,17/4,25/8,12,9,6,9/2)$. Thus its full objective is $V_{\mathrm{new},x}=(C_{\mathrm{common}}+4h_x)/D_{\mathrm{new}}$. Put

$$
\begin{aligned}
d&=(68,50,34,25,96,72,48,36),\\
\pi_x&=2^{-d_x}/\sum_z 2^{-d_z},\\
P_{xy}&=(1/14)\min(1,2^{-(d_y-d_x)})\quad\text{for } y\ne x,\\
P_{xx}&=1-\sum_{y\ne x}P_{xy}.
\end{aligned}
$$

These are the lazy-Metropolis probabilities of Theorem Q.2.4d, not a newly fitted relaxation matrix. $P$ is positive, stochastic and $\pi$-reversible. The new continuous-time source generator on its state label is $\nu(P-I)$. Its event rate is $\nu$, including self-marked attempts. Using only off-diagonal moves as a clock would be a different complete-record source.

The actual Q10 task has eight fair target bits and base-2 logarithmic loss. In configuration x its realized score is pathwise

$$
\ell_x=2A-qA/(kg)=(4,6,6,7,0,4,4,6)_x.
$$

Every correctly revealed bit contributes exactly zero loss and every unrevealed fair bit exactly one, for every target realization in the task support. Thus this is stronger than an equality of means. Eight positive-duration preflight task trials physically produce these scores and copy them into an immutable calibration bank. The 16 sampled labels subsequently feed 16 fresh, positive-duration Q10 task trials, producing actual task-score words. The error readout is their raw logarithmic loss in bits; gain is exactly one. Centering $e=\ell-\mu$, $\mu=\sum\pi_x\ell_x$, is exact finite rational arithmetic in the declared verifier. No analog centering or gain device is hidden in this convention.

The jumping label is a calibrated configuration/error coordinate. A collision is not an instantaneous execution, reconfiguration or completion of the spatial Q10 communication network. No new environmental trial is asserted to run at a jump. The physical trial executions occur in the separately invoiced preflight and post-freeze schedules. This binding fixes the declared PCE task-error observable of this extended source.

##### 2. Actual fixed-configuration Q10 trials, without instantaneous overrides

Use 25 independent complete one-frame Q10 task packages: eight calibration trials, 16 sampled diagnostic trials, and one actual production/comparison trial. Every package owns its original three initial $X_{\mathrm{old}}$-seed cells, its entire original adaptation apparatus, all unused stocks, all Q10 target/forecast/score registers, phase flags, operation receipts, ROM and drivers. Its original padded adaptation executes normally, including proposal, acceptance and retained shadows.

Immediately after the adaptation lookup and before Q10 mode seeding, insert three actual SWAP pulses, each of duration $\delta$, exchanging $X_{\mathrm{new}}$ with a three-bit configuration fixture. In the eight preflight packages the fixture is supplied in the respective known basis setting 000 through 111. The separate production/comparison package is supplied in its chosen basis setting x. Its eight possible ready-fixture types form an explicitly delivered finite preparation menu with the same positive three-cell readiness tariff, independent of x; this basis-state preparation is part of the source nomination, not an unpriced runtime overwrite. In each of the 16 subsequent packages the fixture is initially zero and is loaded, by three paid CNOT pulses after computational-basis measurement, from that package's sampled label. After the SWAPs $X_{\mathrm{new}}$ holds the desired configuration and the fixture retains the original random adaptation result. No original output is overwritten or erased. All remaining original Q10 mode-distribution, environment, reset, pinching, courier, crossing, forecast and score calls run unchanged, at their original positive durations and fixed configuration.

Each added SWAP has one fresh receipt and two fresh phase flags. Its target-plus-receipt work port and the two phase ports are distinct priced apparatus. The fixture adds three cells; the three swaps add nine record/phase cells and nine actuator ports. Total duration per modified Q10 frame before score aggregation is $\tau_Q+3\delta$. This is explicitly a new finite interface, not a claim that Q10's original initial law or command menu already supplied arbitrary fixed configurations.

The Q10 local score symbols are two bits, with 3 denoting INF. Let $w=\lceil\log_2(2A+1)\rceil=4$ and $d_{\mathrm{acc}}=w+1=5$. Each trial owns $A+1$ fresh accumulator banks of $d_{\mathrm{acc}}$ bits, the first zero. For site $i$ use the actual reversible lookup

$$
U_f:\ |u,s,v\rangle \to |u,s,v\oplus f(u,s)\rangle.
$$

Here $u=(n,h)$ consists of a $w$-bit integer and an invalid flag, $s$ is the actual two-bit local score, and $f$ adds $s=0,1,2$ modulo $2^{w}$, setting its output invalid flag if $h=1$, $s=3$, or an integer overflow occurs. For $s=3$ use increment zero and set invalid. This rule defines every truth-table row, including off-task inputs. The new accumulator is fresh; inputs remain retained. The exact complete table per stage has $2^{d_{\mathrm{acc}}+2}d_{\mathrm{acc}}=640$ physical ROM bits. There are $A=4$ distinct stage ports per trial. Each $U_{f}$ is an involution, so the finite pulse construction below realizes it exactly. Its arity is finite; no unproved universal local compiler is invoked.

After all $A$ stages, $w=4$ actual CNOTs copy the numerical score to a fresh output word. The final invalid flag and every intermediate accumulator remain retained. On the nominated task all invalid flags are zero and the copied word is $\ell_x$. The eight preflight words form the read-only calibration bank. The 16 later output words and the separate production output are actual independently executed task scores. Their equality to the selected bank entry is a full-support source identity and a verification check, not replacement of the trials by a table assertion.

##### 3. Stationary preparation, finite classical collision ports and conservation

The live configuration register $X$ has eight basis states. Before the collision window, prepare its actual classical stationary law $\pi$, retaining a three-bit preparation shadow and a distinct three-bit measurement outcome. A supplied exact native Householder $W_{\pi}$ maps $|000\rangle$ to $\sum_x\sqrt{\pi_x}|x\rangle$; with $v$ proportional to $|000\rangle-\sum\sqrt{\pi_x}|x\rangle$, $W_\pi=I-2|v\rangle\langle v|$. Three actual CNOTs copy $X$ into the preparation shadow. One paid positive-duration computational-basis instrument on the shadow retains its outcome in the separate fresh three-bit register. Its specified branch maps are the eight projectors with their corresponding record labels. On these classical retained outputs the resulting $X$ law is exactly $\pi$. The unconditioned preparation instrument, including its classical outcome output, is newly nominated; it is not supplied by a finite rational random-bit decoding algorithm. Its exact coefficient and native measurement boundary require explicit admission. There are five preparation slots, all duration $\delta$; no unpriced sampling loop exists.

The collision apparatus has a count $n$, energy reservoir $q$ and retained receipt counter $z$, each encoded in $c_B=\lceil\log_2(B+2)\rceil=8$ physical two-level cells. Initially $(n,q,z)=(0,B+1,0)$. It has $B+1$ fresh eight-bit event-shadow words. Each stores origin (3 bits), destination (3 bits) and kind (2 bits): unused, regular, overflow, or reserved. It also has a separate overflow bit. Regular self-events $x\to x$ have kind regular, so they are not confused with no attempt.

For $n<B$ and each reachable retained history $h=(x_0,\dots,x_n)$, supply eight actual rank-one native collision channels

$$
J_{h,y}=\sqrt{\nu P_{x_n,y}}\, |F_{h,y}\rangle\langle h|.
$$

The map $F$ changes $X$ to $y$, raises $n$ and $z$ by one, lowers $q$ by one, and writes the next fresh shadow with $(x_n,y,\text{regular})$. Every old record is unchanged. For $n=B$ there is one channel per history, of amplitude $\sqrt{\nu}$, which retains $X$, raises $n$ and $z$, lowers $q$, writes $(x_n,x_n,\text{overflow})$, and sets the overflow bit. All rates then vanish. There is no mark/update draw on the overflow event. Thus there are at most $B$ normal updates and $B+1$ clock events, and the overflow event itself is retained and charged.

On each reachable active history sector, $\sum_yJ_{(h,y)}^*J_{(h,y)}=\nu|h\rangle\langle h|$. Including all sectors gives $\nu I_{\mathrm{active}}$. At $n=B$ the same identity follows from the single overflow channel. Each channel is tensored with the identity on all calibration, snapshot, trial, controller and old-output systems. The identity therefore holds on correlated full states, including snapshots during a copy pulse. The event hazard is exactly $\nu$ until stop and independent of the state, snapshot quantum state and initial preparation. Its marks have the nominated $P$ rows. This is the concrete reason a Poisson attempt clock applies; payment or an informal programmable-clock assertion is not its proof.

A fully literal, deliberately generous actuator census uses one installed rank-one channel for each history/destination pair, rather than assuming free programmable history control. The finite number is

$$
\begin{aligned}
N_{\mathrm{jump}}&=\sum_{n=0}^{B-1} 8^{n+2}+8^{B+1} \\
&=64(8^B-1)/7+8^{B+1}.
\end{aligned}
$$

All of these ports are purchased and retained, including unused ones. Their rate coefficients are delivered native physical parameters. This very large but finite ideal apparatus makes no practical-manufacturing or resource-efficiency claim. A compressed implementation would require a new explicit control audit.

Fix independently positive $E_{\mathrm{col}}$. On the valid source sector use $H_{\mathrm{resource}}=E_{\mathrm{col}}(q+z)$. Every regular and overflow attempt transfers exactly one quantum from reservoir to retained receipt, and $q+z=B+1$ on every path. The initial $(B+1)E_{\mathrm{col}}$ energy stock, both counters, every fresh shadow and all disabled ports remain owned. No constant energy is discarded, no tariff is identified with joules, and no heat or thermodynamic minimum is inferred. The exact native jumps and Poisson timing are ideal open collision services of the open, externally driven native-instrument type of Definition Q.2.4c, not a claim that a finite isolated bath produces an exact semigroup.

##### 4. Paid finite-duration snapshot protocol and its exact error budget

Activate the independent source clock only after preflight, stationary preparation and positive-duration ready/start flag pulses complete. A supplied fixed-horizon timing gate exposes the collision channels on [0,T] and removes them at T; the new exact hazard gate and timeout are paid native source services. This is the same kind of externally stopped source boundary as Q03, not an instantaneous Q10 unitary. The freeze record is then written with positive-duration pulses. No continuous event times are stored or required.

For each $j=0,\dots,15$, during $[j\Delta,j\Delta+\epsilon]$ perform three simultaneous diagonal-$X$-controlled CNOT pulses into a fresh three-bit snapshot register. Their finite Hamiltonians commute with all $X$ basis projectors, so they leave the $X$ marginal population law unchanged even on correlated full states. Each has a separate operation receipt; each window has two fresh phase flags. The copy pulses are real positive-duration interactions. If no clock attempt falls in the entire window, their endpoint is exactly the three-bit copy of $X(j\Delta)$. If a jump occurs, all resulting snapshot outcomes remain; none is discarded or silently relabeled as an exact snapshot.

At $T=15+\epsilon$ the timeout removes every collision rate. Only after freeze, perform a separate computational-basis measurement instrument on each three-bit snapshot, retaining its three-bit outcome. Each measurement has positive duration $\delta$, a fresh operation receipt and two fresh phase flags. Copy the measured label into a fresh configuration fixture in three positive-duration slots. Execute the corresponding full Q10 task trial and its actual accumulator/copy schedule. All 16 measurements, labels, task targets, complete trial records, invalid flags and final losses remain. These later operations cannot disturb a past live interval.

Couple to the ideal stationary uncapped process using the same event process and conditional marks. On the event of no overflow and no attempt during any snapshot window, the 16 retained loss outputs equal $\ell_{X(j\Delta)}$ pathwise. Therefore the complete protocol record, augmented with the corresponding real trial records, has an explicit coupling error at most

$$
\begin{aligned}
\delta_{\mathrm{total}} &\le \delta_B + J \nu \epsilon, \\
\delta_B&=\Pr\{\mathrm{Pois}(\nu T)\ge 128\} \le (3/8)^{128}, \\
J \nu \epsilon&=2^{-26}.
\end{aligned}
$$

The Poisson bound uses $\nu T<16$, Chernoff's bound $(e\mu/128)^{128}$, and $e<3$. The bound is conservative and includes self-marked attempts. The ideal comparison can be extended by a distinguished overflow output of probability zero. No stationarity is claimed for the finite stopped apparatus after overflow; the exact stationary covariance and spectrum belong to the underlying source law, and the displayed bound transports its finite sampled predictions to this actual complete record.

The extraction map returns the actual measured scores on all non-overflow branches, including perturbed-snapshot branches. For periodogram comparison only, assign the fixed zero vector on overflow, while retaining the overflow flag and raw outputs separately. Do not condition on successful/non-overflow trials. Any periodogram expectation allowance must include both $\delta_{B}$ and $J\nu\epsilon$, multiplied by the appropriate deterministic range bound of its statistic. Observation windows, frequencies, centering and decision threshold are to be frozen in the companion PSD packet.

##### 5. Positive-duration work ports and literal apparatus census

For every additional finite involution W, including SWAP, CNOT, Householder and the accumulator $U_{f}$, use a zero-idle working register and

$$
H_W(s)=(\pi \hbar/(2d)) [1-\cos(2\pi s/d)](I-W),\quad 0\le s\le d.
$$

The endpoint unitary is exactly W and the peak norm is at most 2pi hbar/d. Here d is $\delta$, except snapshot copies use $\epsilon$. Each used target port writes its own fresh receipt by an independent X pulse; each ordinary slot writes two fresh phase flags. A target/receipt/two-phase slot has a conservative simultaneous peak reservation 8pi hbar/d. The three parallel snapshot targets, their three receipts and two phase flags require at most 16pi hbar/epsilon. These are openly large but finite reservations. The native measurement, collision and stopped timing services are separately supplied open instruments, with positive finite service/stock reservations; they are not asserted to follow from this unitary formula.

The Q10 invoice at $A=4$ has $S=160$, $B_Q=684$ non-ROM cells, $R_{Q}=2048$ ROM cells and $P_{Q}=460$ actuator ports. Its three initial configuration cells are additional. Its full fixed service bill with all its original primitive service prices one is $F_{Q}=560$ resource units. A modified fixed-fixture Q10 trial therefore has 699 cells, 2048 ROM cells and 469 ports, including its three initial cells and every fixture/SWAP addition.

Each trial's score-aggregation/output module has 53 cells: 25 accumulator bits, 4 output bits, 8 receipts and 16 phase flags. It has 2560 ROM cells and 24 actuator ports. It executes four accumulator calls and four output-copy calls, eight ordinary clock slots and 16 phase writes.

The eight preflight trial modules therefore have, exactly, 6016 cells, 36864 ROM cells and 3944 ports. Each of the 16 post-freeze trials additionally has a measurement module (3 outcome cells, 1 receipt, 2 phase flags, 3 ports) and three fixture-copy slots (3 receipts, 6 phase flags, 9 ports). Thus the 16 post-freeze trial modules have 12272 cells, 73728 ROM cells and 8080 ports. Their original snapshot cells are counted next, not again here.

The 16 snapshot modules have 128 cells (3 snapshot bits, 3 target receipts and 2 phase flags each) and 80 ports (3 target/receipt drivers plus 2 phase drivers each). Each window has one clock/phase reservation and three simultaneous copy services.

The remaining common collision/preparation/control module has 1093 cells: $X$/preparation-shadow/preparation-outcome 9; count/reservoir/receipt counters 24; event shadows 1024; ready, start, timeout, frozen, finished and overflow flags 6; and 10 ordinary-operation receipts plus 20 phase flags. Its 10 ordinary operations are five stationary-preparation calls and five non-overflow stage-flag writes. It has $N_{\mathrm{jump}}+32$ ports: $N_{\mathrm{jump}}$ collision ports, 10 ordinary target/receipt ports, 20 phase ports, and two distinct activation/timeout hazard-gate ports. Exact coefficients of the Householder, jump rates, measurement instruments and timing gates are delivered with these actual apparatus ports, not claimed to reside in uncharged finite digital strings.

The additional actual production/comparison trial has 752 cells, 4608 ROM cells and 493 ports: precisely one modified fixed-fixture Q10 trial and its actual score module. It has no extra snapshot or measurement module.

The complete periodogram-plus-production descriptor therefore owns exactly

  $B_{\mathrm{total}}=20261$ physical two-level cells,
  $R_{\mathrm{total}}=115200$ physical ROM cells,
  $P_{\mathrm{total}}=N_{\mathrm{jump}}+12629$ native actuator ports.

Unused binary counter codes, unused truth-table rows, all unrealized event ports and all unused Q10 stocks remain purchased. The energy-reservoir register and receipt register are already in $B_{\mathrm{total}}$; their initial energy endowment is separately priced below, rather than counting their hardware twice. No detector, score adder, fixture, measurement outcome, copy record, phase pulse or source-only archive is omitted.

##### 6. Complete finite positive invoice and common debit

All stocks are delivered at descriptor start and retained through the common end. The complete elapsed duration, including preflight, the live collision interval, every post-freeze trial and every new positive-duration control operation, is

$$
\begin{aligned}
D_{\mathrm{new}}&=25\tau_Q+75\delta+200\delta+64\delta+10\delta+T\\
&=6749/160+\epsilon\ \text{seconds}.
\end{aligned}
$$

The 75delta term is the three fixture SWAPs in all 25 trials; 200delta is their score aggregation/copy; 64delta is 16 snapshot measurements plus 48 fixture copies; 10delta is the stationary preparation and stage-flag writes. Snapshot copy windows occur inside T and are not added to elapsed time a second time.

Choose independently positive $r_{\mathrm{cell}},r_{\mathrm{ROM}},r_{\mathrm{port}}$ and holding rates $h_{\mathrm{cell}},h_{\mathrm{ROM}},h_{\mathrm{port}}$. The complete stock/holding debit is

$$
\begin{aligned}
C_{\mathrm{stock}}&=r_{\mathrm{cell}} B_{\mathrm{total}}+r_{\mathrm{ROM}} R_{\mathrm{total}}+r_{\mathrm{port}} P_{\mathrm{total}}, \\
C_{\mathrm{hold}}&=D_{\mathrm{new}}(h_{\mathrm{cell}} B_{\mathrm{total}}+h_{\mathrm{ROM}} R_{\mathrm{total}}+h_{\mathrm{port}} P_{\mathrm{total}}).
\end{aligned}
$$

These count every realized or unused stock until the same deadline. There is no erasure/recycling and no infinite-duration protection claim.

The eight preflight trials have their actual Q10 variable service bills $G=(36,26,18,13,52,38,26,19)$, summing to 228 resource units. More generally their sum is $A[6a+9b+(27/4)(c+r)]$. In each of the 16 sampled trials reserve every possible original variable-service port at its positive primitive price, whether used or not. With the actual primitive-one tariff this is $15A=60$ units per trial: enable $2A$, load $2A$, reset $2A$, pointer $2A$, dephasing-shadow $2A$, source couriers $3A$ and crossing $2A$. The realized operations are still precisely those required by the sampled configuration. The remainder is an openly paid unused reservation, not fictitious executed work. This makes the full new task-trial debit independent of all sampled configurations.

The actual production/comparison trial executes its fixed-$x$ original Q10 service calls, so its variable bill is the realized $G_{x}$, not the 60-unit diagnostic reservation. Its fresh task supplies $qM$ actually revealed target bits and the actual copied loss $\ell_x$. Consequently the complete Q10 executed/reserved supplier contribution is

$$
C_{\mathrm{Q10},x}=25F_Q+228+16(60)+G_x=15188+G_x\ \text{resource units}.
$$

No $\gamma$ benefit is subtracted from this positive supplier invoice. Production benefit is separately $\gamma$ qM for this one explicitly designated production task. The other 24 trials are predeclared calibration/verification work and receive no additional production-benefit credit. This role distinction and its objective are fixed before any outputs, not chosen to cancel a realized diagnostic score.

Let all following additional service prices be finite, independently positive and declared before output. They include their stated finite waveform and own receipt-writing service; physical record cells are already counted above. The exact additional ordinary-service debit is

$$
\begin{aligned}
C_{\mathrm{extra}}={}&75\, s_{\mathrm{swap}} \\
&+100\, s_{\mathrm{add}} \\
&+(100+48+3)\, s_{\mathrm{copy}} \\
&+17\, s_{\mathrm{measure}} \\
&+s_{\pi\,\mathrm{prepare}} \\
&+5\, s_{\mathrm{stage\,flag}} \\
&+48\, s_{\mathrm{snapshot\,copy}} \\
&+730\, s_{\mathrm{phase}} \\
&+365\, s_{\mathrm{clock}}.
\end{aligned}
$$

Here phase and ordinary-clock counts are: swaps (150,75), aggregation/output (400,200), fixture copies (96,48), post-freeze measurements (32,16), common preparation/control (20,10), and snapshot windows (32,16). Their totals are respectively 730 and 365.

The distinct stationary preparation measurement is included in $17\,s_{\mathrm{measure}}$ (16 snapshots plus one preparation); the Householder is $s_{\pi,\mathrm{prepare}}$ and its three shadow copies are included in $s_{\mathrm{copy}}$. The five stage flag writes exclude overflow, which is written by the collision port itself. The snapshot-copy tariff explicitly includes the $\epsilon$-duration peak reservation; it is not borrowed from a slower gate tariff without a supplied reservation.

The collision/timing/energy service debit is

$$
C_{\mathrm{collision}}=s_{\mathrm{activate}}+s_{\mathrm{timeout}}+T\, s_{\mathrm{hazard}}+(B+1)s_{\mathrm{attempt\,reserve}}+(B+1)s_E,
$$

where $s_{E}$ prices one initially supplied $E_{\mathrm{col}}$ quantum and $s_{\mathrm{attempt\_reserve}}$ pays each potential event slot, regular or overflow, whether realized or not. Its service includes that event's native state update, shadow writing, energy transfer and retained receipt update. Each installed collision channel is already purchased in $C_{\mathrm{stock}}$. The no-event branch still pays all $B+1$ reservations and all initial energy stock; the energy not transferred remains in $q$. The hazard price is per unit live-window reservation; it is paid through $T$ even if overflow stopped the source earlier. The activation and timeout ports are different installed controls and separately used services.

The full finite worst-case and actual reservation invoice is exactly

$$
\begin{aligned}
C_{\mathrm{descriptor},x}&=C_{\mathrm{stock}}+C_{\mathrm{hold}}+C_{\mathrm{Q10},x}+C_{\mathrm{extra}}+C_{\mathrm{collision}} \\
&=C_{\mathrm{common}}+G_x.
\end{aligned}
$$

Every term is positive and finite for this finite $B$, despite the intentionally large $N_{\mathrm{jump}}$. $C_{\mathrm{common}}$ is identical across the eight production configurations and all live initial states, event histories, overflow outcomes and sampled diagnostic configurations. The sole physical production-dependent debit $G_{x}$ is executed by the actual additional task module. The production objective and its true time denominator are

$$
\begin{aligned}
V_{\mathrm{new},x}&=[C_{\mathrm{descriptor},x}-\gamma qM]/D_{\mathrm{new}} \\
&=[C_{\mathrm{common}}+G_x-\gamma qM]/D_{\mathrm{new}} \\
&=[C_{\mathrm{common}}+4h_x]/D_{\mathrm{new}}.
\end{aligned}
$$

The physically specified production-comparator menu consists of the eight complete fixed-fixture descriptor variants $x=0,\dots,7$, each executing the same actual modified Q10 production task and its corresponding original service calls. The eight preflight executions also realize every fixed-$x$ task once and retain its actual score and gate receipts. Each descriptor has only one additional production trial; the normal operating descriptor selects $x^*=3$, $(q,k,g)=(1,2,2)$, from this menu. This selected production setting is distinct from the live stationary controller $X$, whose finite-temperature law $\pi$ has full support on all eight configurations. The controller labels the calibrated cost/error menu and does not execute production instantaneously at each jump. Its complete eight-way comparison, minimizer $x=3$, and strict total-resource gap $9/2$ follow from these actual new invoices, not from a historical table alone. The physical rate gap is $(9/2)/D_{\mathrm{new}}$. The adopted Q10 subframe remains one second, but the operating objective is not incorrectly divided by that subframe duration.

With $\eta_{\mathrm{noise}}=2\ln 2$ fixed in inverse resource units and $\beta_{\mathrm{new}}=\eta_{\mathrm{noise}}D_{\mathrm{new}}$ fixed in inverse resource-rate units,

$$
\begin{aligned}
\beta_{\mathrm{new}}(V_{\mathrm{new},y}-V_{\mathrm{new},x})&=\eta_{\mathrm{noise}}[(G_y-\gamma q_y M_y)-(G_x-\gamma q_x M_x)] \\
&=(d_y-d_x) \ln 2.
\end{aligned}
$$

Therefore the actual cost-indexed lazy-Metropolis kernel and stationary preparation are exactly the $P$ and $\pi$ in section 1. $\beta_{\mathrm{new}}$ is a declared unit-conjugacy conversion using the fully invoiced source duration, not a fitted spectral parameter. Keeping the number $2\ln 2$ as an inverse-rate $\beta$ while changing the denominator to $D_{\mathrm{new}}$ would instead change $P$ and is not this source. The finite production-comparison menu and this full operating objective are retained parts of the declared source.

Signed working-register endpoint work, finite interaction peaks, collision energy transfer, positive resource tariffs and production benefit remain separately typed.

##### 7. Complete Output Boundary and Protocol Map

The complete retained output contains stationary preparation outcomes; all attempt shadows including self attempts and overflow; counters and energy receipts; all snapshot registers and measurement outcomes; all 25 original Q10 environmental, source, receiver, controller, adaptation, pinching/reset and grader records; fixtures retaining original adaptation values; accumulator histories and invalid flags; the eight calibration words, 16 sampled actual score words and actual production score; every phase, operation, ready/timeout/freeze flag; and the supplied finite timing/parameter descriptor. Nothing is excluded because it was paid for. The protocol has no receiver-facing unknown message input. There are no additional coherent controls, bath-opening commands, mid-run verification interventions or clock-rate-changing actions in its nominated menu.

On the finite classical record grammar, send each state/outcome label to the corresponding diagonal basis state and each actual primitive to its displayed joint instrument. The response map then preserves each admitted outcome law, post-outcome classical state, coarse-graining and subsequent verification by composition of the same finite kernels. The live snapshot instrument is included as the actual finite-duration interaction, not replaced by an instantaneous diagonal sampler. Its comparison with the ideal sampler has the explicit error above. No claim of full quantum equivalence or equality to a Gaussian/OU source is made from equality of covariance alone.

A simpler optional terminal-pair protocol can avoid the snapshot error: copy initial X before activation, evolve for a declared lag, freeze with the same paid timeout, then read initial/final labels by positive-duration gates and select their calibrated loss bank entries. It requires its own finite pair-readout stock/service invoice and does not reuse the present 16-snapshot invoice unchanged. The actual numerical PSD packet here uses the fully invoiced 16-sample protocol.

<a id="theorem-d85l-exact-task-error-spectrum-and-finite-psd-export"></a>**Theorem D.8.5l (Exact Task-Error Spectrum and Finite PSD Export).** The source of Definition D.8.5k has the following derived physical band, task-error normalization and complete finite-window response packet.

##### 1. Independently fixed operating point

Use Theorem Q.2.4d's primitive-service-one example, score price $\gamma=1/2$, $L=1$, $A=4$ and episode duration $\tau_{Q}=1$ second. Thus $a=2,b=2,c=3,r=1$. Add the actual production/comparison task specified in Definition D.8.5k to the common diagnostic descriptor. Freeze its full campaign duration $D'=6749/160+2^{-30}$ seconds before choosing temperature. Then independently choose inverse total-resource temperature $\eta=2\ln 2$ per resource unit; the conjugate inverse rate unit is $\beta_{\mathrm{rate}}=\eta D'$, not $2\ln 2$. The full campaign objective is $V_x=(C_{\mathrm{common}}+G_x-\gamma qM)/D'$. Thus $\beta_{\mathrm{rate}}(V_y-V_x)=\eta A(f_y-f_x)$, with $\eta A=8\ln 2$. The dimensionless net production costs $f_x=(D'V_x-C_{\mathrm{common}})/A$ in lexicographic $x=(q,k,g)$ order are

  (17/2,25/4,17/4,25/8,12,9,6,9/2).

The eight physically supplied fixed-configuration production comparators have unique cost-rate minimum $x^*=3$, i.e. $(q,k,g)=(1,2,2)$. This selected minimum is distinct from the full-support finite-temperature stationary controller distribution $\pi$. Production is not run at each jump. The fixed independently calibrated attempt frequency is $\nu=1\,\mathrm{s}^{-1}$. No spectral output or observed PSD was used to set these quantities. $P$ is exactly the lazy Metropolis matrix of Theorem Q.2.4d, $P_{xy}=\min(1,\pi_y/\pi_x)/14$ for $y\ne x$ and $P_{xx}=1-\sum_{y\ne x}P_{xy}$. Its stationary weights are

$$
\begin{aligned}
\pi_x&=2^{-d_x}/\sum_y 2^{-d_y}, \\
d&=(68,50,34,25,96,72,48,36).
\end{aligned}
$$

The actual pathwise completed-task losses, in base-2 log-loss bits, are

  $$
  \ell=(4,6,6,7,0,4,4,6).
  $$

These are populated by eight actual paid positive-duration Q10 trials and finite score aggregation, not by naming a configuration index an error. Their exactness follows because every known-bit forecast is correct and every unknown-bit forecast has log loss one on every registered source history. Let $m=\sum\pi_x\ell_x$ and $b_x=\ell_x-m$. The unit gain is one recorded error-bit per actual base-2 log-loss bit; no free voltage/temperature normalization is claimed. Centering is an exact finite rational extraction from the digital loss records.

The newly nominated continuous-time ideal comparison generator is $Q=\nu(P-I)$. Its native marked jump source includes self/rejection attempts in the constant total attempt rate $\nu$, with every attempt paid and retained. The actual finite source is capped and instrumented as specified below.

##### 2. Complete exact spectral diagonalization

Order states by decreasing $\pi$: $i=(3,2,7,6,1,0,5,4)$, with positions $r=1,\dots,8$. All inequalities are strict. Let $T_r=\sum_{s>r}\pi_{i_s}$. For $r=1,\dots,7$ define a real vector

 $v_r(i_s)=0$ for $s<r$; $v_r(i_r)=-T_r/\pi_{i_r}$; $v_r(i_s)=1$ for $s>r$.

Then $\sum\pi v_r=0$, and $v_{r}$ is orthogonal to $v_{t}$ in $L^{2}(\pi)$ for $r\ne t$. Directly substituting the actual Metropolis rates gives

$$
\begin{aligned}
-Qv_r&=\lambda_r v_r, \\
\lambda_r&=(\nu/14)[r+T_r/\pi_{i_r}].
\end{aligned}
$$

For $s<r$, the contributions cancel by $\sum_{t\ge r}\pi_{i_t}v_r(i_t)=0$. For $s\ge r$, split transitions into earlier and later ordered states; the heavier-target rates are $\nu/14$ and the lighter-target rates are $(\nu/14)\pi_{\mathrm{target}}/\pi_{\mathrm{current}}$, which gives the displayed eigenvalue. Seven nonzero orthogonal vectors and the constant vector exhaust the eight-dimensional state space. This is a full source diagonalization, not sampled spectral fitting.

Put $n_r=\sum\pi_xv_r(x)^{2}>0$ and

$$
w_r=\Bigl[\sum \pi_x b_x v_r(x)\Bigr]^{2}/n_r.
$$

All $\lambda_{r}$ and $w_{r}$ are exact positive rational multiples of the registered units. In particular every one of the seven modes is active for the actual loss observable; no zero-projection mode is included in the band.

The resulting active physical rates are approximately, in s⁻¹,

  0.07160296823, 0.16071973529, 0.21430751257,
  0.30357150095, 0.35714314665, 0.43303571455, 0.50000000426.

The exact rational values in the finite record below define the band. Thus $a=\lambda_1$ and $b=\lambda_7$ are derived physical update endpoints, with $0<a<b<\infty$. The full source normalization is $C(0)=\sum w_r\approx 0.00243062659345$ error-bit². It is derived from the actual task, source $\pi$ and unit gain, not set by a desired PSD coefficient.

At stationary initialization the ideal task-error covariance and its whole-axis two-sided angular-frequency PSD are

$$
\begin{aligned}
C(t)&=\sum_{r=1}^7 w_r \exp(-\lambda_r|t|), \\
S(\omega)&=\sum_{r=1}^7 2w_r\lambda_r/(\lambda_r^{2}+\omega^{2}), \\
\int_{\mathbb{R}} S(\omega)\,d\omega/(2\pi)&=\sum_r w_r.
\end{aligned}
$$

This is the finite positive relaxation-measure class of Theorem D.8.5c. Equality to an independent OU model is only a second-order representation; no full-state Gaussian or independent-mode law is asserted. The physical source retains its actual finite-state jump law.

##### 3. Actual finite record, instrument and overflow allowances

Forward-lock $J=16$ sample windows with start times $t_j=j\Delta$, $\Delta=1$ second, $j=0,\dots,15$; pulse width $\theta=2^{-30}$ seconds; source horizon $T=15+\theta<16$ seconds. Freeze $B=127$ ordinary attempt slots plus one overflow slot. The 128th attempt sets the explicit overflow flag and disables further source jumps. The native source owns all 128 possible consumed reservoir/receipt/shadow packages whether used or unused.

The ideal uncapped number of marked attempts before $T$ is $\mathrm{Poisson}(\nu T)$. Since $\nu T<16$, the Chernoff bound and $e<3$ give

$$
\delta_{\mathrm{cap}}=\Pr[N(T)\ge 128] \le (e\nu T/128)^{128} < (3/8)^{128}.
$$

All finite instruments and source histories couple exactly to the ideal generator until overflow. Actual overflow is retained as an outcome. The numerical spectral extractor returns the all-zero sample vector on overflow; this is an explicit reporting rule, not postselection on successful runs.

During each window a finite positive-duration controlled copying pulse writes $x$ into a fresh protected three-bit snapshot register. Its Hamiltonian is block-diagonal in the classical source label. Therefore it does not alter the $X$ marginal even when a native source jump occurs during the pulse. On the event of no source attempt during that window, the snapshot is exactly the state at the window start; if an attempt overlaps, the possibly imperfect snapshot and all source records remain. After the live source has frozen at $T$, a paid computational-basis measurement of each protected snapshot produces and retains a definite configuration $x$. The subsequent trial uses that outcome. The completed-task score is timestamped by its nominal sampling-window start, not by the later trial completion time. Native jump ports act on the complete correlated state and have total effect $\sum J^\dagger J=\nu I$ on the active source sector, preserving the constant attempt hazard during copying. Coupling the ideal instantaneous samples to this actual finite instrument gives

$$
\begin{aligned}
\delta_{\mathrm{inst}} &\le 1-\exp(-\nu J\theta) \le J\nu\theta, \\
\delta_{\mathrm{total}} &\le \delta_{\mathrm{cap}}+J\nu\theta.
\end{aligned}
$$

After the source is frozen, each snapshot is supplied to a separate, fully paid fixed-configuration Q10 task trial. Positive-duration preparation, actual channel gates, forecast, local scoring, score aggregation and causal receipt-copy all occur then. The actual loss is exactly ℓ of the recorded configuration, on every trial branch. Hence this is an actual predictive-error measurement, with the declared capture error, rather than an instantaneous execution of a Q10 network at each source jump.

Use $|b|\le M=8$ error-bits. For the $J$-sample two-sided finite-window periodogram

$$
I_J(\omega)=(\Delta/J)\Bigl|\sum_{j=0}^{J-1} b_j \exp(-i\omega j\Delta)\Bigr|^{2},
$$

one has $0\le I_J\le M^{2}J\Delta$. The actual mean differs from the ideal mean by at most $M^{2}J\Delta\,\delta_{\mathrm{total}}$. This allowance owns both overflow and the finite sampler; none is hidden in an OU approximation.

##### 4. Forward prediction and decision record

The ideal sampled PSD and finite-window mean are exactly

$$
\begin{aligned}
S_\Delta(\omega)&=\Delta\sum_r w_r(1-r_r^{2})/(1-2r_r \cos(\omega\Delta)+r_r^{2}),\quad r_r=\exp(-\lambda_r\Delta), \\
\mu_J(\omega)&=\Delta\Bigl[C(0)+2\sum_{k=1}^{J-1}(1-k/J)C(k\Delta)\cos(\omega k\Delta)\Bigr].
\end{aligned}
$$

These are the actual generator's alias and finite-window formulas, not the PSD of Q10's old fixed-period chain. On $|\omega|\le\pi/\Delta$, retain the nonnegative alias bound $(2/3)\Delta^{2}\sum w_r\lambda_r$ and the exact finite-window bound

  $$
  |\mu_J(\omega)-S_\Delta(\omega)|\le(2\Delta/J)\sum_r w_rr_r(1-r_r^{J})/(1-r_r)^{2}.
  $$

The formal direct data comparator uses $\mu_{J}$, so no large window or alias allowance is silently dropped or needed twice. Forward-lock the finite angular-frequency set $\{0,\pi/2,\pi\}\,\mathrm{s}^{-1}$. The finite record below supplies rational interval enclosures for every $\mu_{J}$, obtained with alternating-series bounds on $\exp(-\lambda_r)$ and exact $\cos(k\pi/2)$, $\cos(k\pi)$. These values are fixed before observed interval data.

For an optional $N_{\mathrm{rep}}=2^{20}$ independent complete-source records, each raw $I_{J}$ is bounded by $K=M^{2}J\Delta=1024$ error-bit² seconds. A Hoeffding interval with per-frequency failure $\alpha/3$, $\alpha=1/20$, has radius $K\sqrt{\log(6/\alpha)/(2N_{\mathrm{rep}})}$. This is a forward reporting rule, not a claim that this conservative radius is experimentally efficient. Each repetition requires a new complete invoice. Given observed intervals $[l_k,u_k]$, enlarge the theoretical $\mu_{J}$ interval by $K\delta_{\mathrm{total}}$ and compare their intersections. Return `incompatible` if any required intersection is empty; otherwise return `compatible-unresolved`. This is a finite exact decision functional on the registered intervals, not a claim that compatibility proves this source uniquely.

The supplied finite atomic spectrum is not asserted to have a wide 1/f plateau. The original finite-band class permits a negative pink-shape outcome. The source's frequency band, normalization and finite-error predictions are forward consequences of the physical operating point, which remains to be constructed.

<a id="record-d85m-exact-finite-psd-predictions"></a>**Record D.8.5m (Exact Finite PSD Predictions).** These values belong to the same source, calibration tuple and finite-window convention. Rates are in inverse seconds and weights in squared error bits.

| Mode | Rate | Weight |
|---|---|---|
| 1 | 2366948200801862942721/33056565380087516495872 | 78488676744119172799071384499758236726247432438550416588800/32297860778262102420006661056689824137100594067758154296328193 |
| 2 | 10376645385467723777/64563604257983430656 | 162389399905572925072989562583008943984097624064/1748536694736395518877088056437535300676233802949314448953 |
| 3 | 3459116357826641921/16140901064495857664 | 5799621425199033038321055806536033713717772288/15245111923399020934003426963236196704099225875247039 |
| 4 | 1196268936232961/3940649673949184 | 796455185661762696104838930759330832580608/8371869143236512590943955788234329576476681924023 |
| 5 | 50263429442999/140737488355328 | 22896939448303777350512803840000/47504979322123989840400181377372704494059521 |
| 6 | 232484279/536870912 | 4294967296/11326024439626993812398737604539842561 |
| 7 | 117440513/234881024 | 268435456/39710803592612428594288787457 |

The exact error center is 16562871883295476416512/2366948200801862942721 and the normalization is 13617448852835876290481631761053484318720/5602443785279176098483332283309181726883841.

| Angular frequency | Finite-window mean lower endpoint | Upper endpoint |
|---|---|---|
| 0 | 107504115972502449950213468322281337/3906250000000000000000000000000000000 | 275210536889606271872546478905040222721/10000000000000000000000000000000000000000 |
| pi/2 | 2768981728584188243450347471982945281/10000000000000000000000000000000000000000 | 1384490864292094121725173735991472641/5000000000000000000000000000000000000000 |
| $\pi$ | 693799821929460033497407902907774633/5000000000000000000000000000000000000000 | 1387599643858920066994815805815549267/10000000000000000000000000000000000000000 |

The common mean-bias allowance is 587135645693458306972370149197334256843920637238870152254561326054573129140064629531602961188468016867080705/38478521676166483605741250097796497856523182881313912761668255277583712667477744737709244389536050430475222646784. The complete-record coupling allowance is 587135645693458306972370149197334256843920637238870152254561326054573129140064629531602961188468016867080705/39402006196394479212279040100143613805079739270465446667948293404245721771497210611414266254884915640806627990306816. The retained overflow extractor, sixteen nominal capture starts, positive pulse duration, source horizon, finite cap and compatibility decision are those of Definition D.8.5k and Theorem D.8.5l.

### D.8.6 PCE-Ricci Metric Flow

<a id="definition-d86a-metric-pce-functional"></a>**Definition D.8.6a (Metric PCE Functional).** On a compact smooth Riemannian metric-measure branch $(M,g,e^{-f}d\mathrm{vol}_g)$ without boundary, with prescribed normalized measure
$$
\int_M e^{-f}d\mathrm{vol}_g=1,
$$
define the geometric PCE functional
$$
\mathcal V_{\mathrm{geom}}[g,f,\Psi]
=
\int_M
\left(
R_g+|\nabla f|_g^2+\lambda_{\mathrm{pred}}\mathcal U_{\mathrm{pred}}(g,\Psi)
\right)
e^{-f}d\mathrm{vol}_g,
\tag{D.8.6.1}
$$
where $\Psi$ denotes retained predictive matter fields and $\mathcal U_{\mathrm{pred}}$ is the local predictive energy-cost density. Define the ordinary predictive stress tensor by
$$
T^{\mathrm{pred}}_{\mu\nu}
=
-\frac{2}{\sqrt{|g|}}
\frac{\delta}{\delta g^{\mu\nu}}
\left(
\sqrt{|g|}\mathcal U_{\mathrm{pred}}
\right).
\tag{D.8.6.2}
$$
For the metric variation $h_{\mu\nu}=\delta g_{\mu\nu}$ with $\Psi$ held constant, vary $f$ by $\delta f=\frac12\operatorname{tr}_g h$ so that $dm:=e^{-f}d\mathrm{vol}_g$ is preserved pointwise. Assume the weighted matter first variation has a tensor representative $\mathcal T_{\mathrm{pred}}$ with no boundary contribution, defined by
$$
\delta\int_M\mathcal U_{\mathrm{pred}}\,dm
=
\frac12\int_M\mathcal T_{\mathrm{pred}}^{\mu\nu}h_{\mu\nu}\,dm.
\tag{D.8.6.2a}
$$
When $\mathcal U_{\mathrm{pred}}$ is independent of $f$ and depends algebraically on the metric, this tensor is
$$
\mathcal T_{\mathrm{pred}}^{\mu\nu}
=
T_{\mathrm{pred}}^{\mu\nu}
-\mathcal U_{\mathrm{pred}}g^{\mu\nu}.
\tag{D.8.6.2b}
$$
For more general metric dependence, Equation (D.8.6.2a) is the required weighted response definition.

<a id="theorem-d86b-variational-sign-of-the-pce-ricci-flow"></a>**Theorem D.8.6b (Variational Sign of the PCE-Ricci Flow).** With $dm$ held pointwise and under Definition D.8.6a's first-variation hypotheses, twice the positive $L^2(dm)$ metric gradient of $\mathcal V_{\mathrm{geom}}$ is
$$
-2\left(
\operatorname{Ric}_{\mu\nu}
+
\nabla_\mu\nabla_\nu f
-
\frac{\lambda_{\mathrm{pred}}}{2}\mathcal T^{\mathrm{pred}}_{\mu\nu}
\right).
$$
If a separately registered metric-normalization convention adds the spatially constant multiplier $\chi(\tau)$, the displayed flow is
$$
\partial_\tau g_{\mu\nu}
=
-2\left(
\operatorname{Ric}_{\mu\nu}
+
\nabla_\mu\nabla_\nu f
-
\frac{\lambda_{\mathrm{pred}}}{2}\mathcal T^{\mathrm{pred}}_{\mu\nu}
\right)
+
\chi(\tau)g_{\mu\nu}.
\tag{D.8.6.3}
$$
The gradient part is negative-gradient flow for $-\mathcal V_{\mathrm{geom}}$. The added normalization term is separate from that gradient; pointwise preservation of $dm$ alone does not supply it. At a constant-$f$ configuration,
$$
\partial_\tau g_{\mu\nu}
=
-2\operatorname{Ric}_{\mu\nu}
+
\lambda_{\mathrm{pred}}\mathcal T^{\mathrm{pred}}_{\mu\nu}
+
\chi(\tau)g_{\mu\nu}.
\tag{D.8.6.4}
$$

*Proof.* Perelman's first-variation formula (Perelman 2002, §1.1), with $dm$ preserved pointwise, gives
$$
\delta\int_M(R+|\nabla f|^2)dm
=
-\int_M
(\operatorname{Ric}^{\mu\nu}+\nabla^\mu\nabla^\nu f)
h_{\mu\nu}\,dm.
$$
Equation (D.8.6.2a) therefore makes the covariant-metric gradient
$$
-\left(\operatorname{Ric}_{\mu\nu}+\nabla_\mu\nabla_\nu f\right)
+\frac{\lambda_{\mathrm{pred}}}{2}\mathcal T^{\mathrm{pred}}_{\mu\nu}.
$$
Twice this gradient, followed by the separately declared normalization term, gives (D.8.6.3). The Hessian term vanishes at a constant-$f$ configuration, giving (D.8.6.4). On the algebraic-metric matter branch, the ordinary stress convention gives
$$
\delta(\sqrt{|g|}\mathcal U_{\mathrm{pred}})
=
\frac12\sqrt{|g|}T_{\mathrm{pred}}^{\mu\nu}h_{\mu\nu},
\qquad
\delta\sqrt{|g|}
=
\frac12\sqrt{|g|}g^{\mu\nu}h_{\mu\nu}.
$$
Subtracting the volume variation gives (D.8.6.2b). In particular, a spatially varying $\mathcal U_{\mathrm{pred}}g_{\mu\nu}$ cannot be absorbed into the spatially constant $\chi(\tau)g_{\mu\nu}$. ∎

<a id="corollary-d86c-stationary-predictive-metric-flow-in-the-declared-representative"></a>**Corollary D.8.6c (Stationary Predictive Metric Flow in the Declared Representative).** For the displayed metric representative of (D.8.6.3) and a prescribed normalization multiplier $\chi(\tau)$, stationarity holds if and only if
$$
\operatorname{Ric}_{\mu\nu}
+
\nabla_\mu\nabla_\nu f
-
\frac{\lambda_{\mathrm{pred}}}{2}\mathcal T^{\mathrm{pred}}_{\mu\nu}
=
\frac{\chi}{2}g_{\mu\nu}.
\tag{D.8.6.5}
$$
At a constant-$f$ configuration this is an Einstein-type balance involving the weighted matter response. Stationarity modulo additional diffeomorphisms requires its own Lie-derivative term and quotient convention.

*Proof.* Setting the full right-hand side of (D.8.6.3) equal to zero gives (D.8.6.5). In dimension $d=\dim M$, its trace requires
$$
\chi=\frac2d\left(
R+\Delta f-\frac{\lambda_{\mathrm{pred}}}{2}\operatorname{tr}_g\mathcal T^{\mathrm{pred}}
\right).
$$
Thus the right-hand expression must also be spatially constant when the declared multiplier is $\chi(\tau)$. Vanishing of the traceless tensor alone does not discharge that scalar condition. ∎

<a id="definition-d86d-finite-entropic-ricci-pce-generator"></a>**Definition D.8.6d (Finite Entropic-Ricci PCE Generator).** Let $X$ be a finite set and let $L$ be an irreducible continuous-time Markov generator
$$
Lf(x)=\sum_{y\in X}K(x,y)(f(y)-f(x))
$$
with stationary law $\pi$ and detailed balance
$$
\pi(x)K(x,y)=\pi(y)K(y,x).
\tag{D.8.6.6}
$$
Write a probability law as $\mu=\rho\pi$, where $\rho:X\to(0,\infty)$ and $\sum_x\rho(x)\pi(x)=1$. The finite PCE free cost is the relative entropy
$$
\mathcal V_{\mathrm{fin}}(\rho)
=
\sum_{x\in X}\rho(x)\log\rho(x)\,\pi(x).
\tag{D.8.6.7}
$$
Let
$$
\theta(r,s)
=
\begin{cases}
\dfrac{r-s}{\log r-\log s}, & r\ne s,\\
r, & r=s,
\end{cases}
\tag{D.8.6.8}
$$
be the logarithmic mean. The Maas-Mielke transport distance $\mathcal W_L$ is defined by
$$
\mathcal W_L(\rho_0,\rho_1)^2
=
\inf_{(\rho_t,\psi_t)}
\int_0^1
\frac12
\sum_{x,y\in X}
(\psi_t(y)-\psi_t(x))^2
\theta(\rho_t(x),\rho_t(y))
K(x,y)\pi(x)\,dt,
\tag{D.8.6.9}
$$
where the infimum is over smooth positive curves satisfying the discrete continuity equation
$$
\dot\rho_t(x)
+
\sum_{y\in X}
(\psi_t(y)-\psi_t(x))
\theta(\rho_t(x),\rho_t(y))
K(x,y)
=
0.
\tag{D.8.6.10}
$$
The generator has entropic Ricci curvature at least $\lambda$ when $\mathcal V_{\mathrm{fin}}$ is $\lambda$-geodesically convex along $\mathcal W_L$ geodesics.

<a id="theorem-d86e-finite-entropic-ricci-pce-stability"></a>**Theorem D.8.6e (Finite Entropic-Ricci PCE Stability).** For a finite detailed-balance generator of Definition D.8.6d, the Markov semigroup $P_t=e^{tL}$ is the $\mathcal W_L$-gradient flow of $\mathcal V_{\mathrm{fin}}$. Moreover, the following are equivalent on the positive probability simplex:

1. the generator has entropic Ricci curvature at least $\lambda$;

2. $P_t$ satisfies the evolution variational inequality
$$
\frac12\frac{d}{dt}
\mathcal W_L(P_t\rho,\nu)^2
+
\frac{\lambda}{2}
\mathcal W_L(P_t\rho,\nu)^2
\le
\mathcal V_{\mathrm{fin}}(\nu)
-
\mathcal V_{\mathrm{fin}}(P_t\rho)
\tag{D.8.6.11}
$$
for every positive density $\nu$;

3. the finite PCE free cost is locally $\lambda$-stable in the entropic-transport geometry.

If $\lambda>0$, then for all positive densities $\rho,\nu$,
$$
\mathcal W_L(P_t\rho,P_t\nu)
\le
e^{-\lambda t}
\mathcal W_L(\rho,\nu),
\tag{D.8.6.12}
$$
and
$$
\mathcal V_{\mathrm{fin}}(P_t\rho)
\le
e^{-2\lambda t}
\mathcal V_{\mathrm{fin}}(\rho).
\tag{D.8.6.13}
$$
Consequently
$$
\lVert P_t\rho-1\rVert_{L^1(\pi)}
\le
e^{-\lambda t}
\sqrt{2\mathcal V_{\mathrm{fin}}(\rho)}.
\tag{D.8.6.14}
$$

*Proof.* Detailed balance makes the Onsager operator associated with (D.8.6.9) symmetric and positive on the tangent space of the probability simplex. The logarithmic mean identity
$$
\theta(r,s)(\log r-\log s)=r-s
$$
turns the continuity equation into the Markov equation when the potential is $\psi=-\log\rho$: the corresponding velocity is
$$
\dot\rho(x)
=
\sum_y K(x,y)(\rho(y)-\rho(x))
=
L\rho(x).
$$
Thus $P_t=e^{tL}$ is the $\mathcal W_L$-gradient flow of $\mathcal V_{\mathrm{fin}}$.

Let $g_L$ denote the smooth Riemannian metric induced by $\mathcal W_L$ on the positive probability simplex. In item (3), local $\lambda$-stability means
$$
\operatorname{Hess}_{g_L}\mathcal V_{\mathrm{fin}}(\rho)[v,v]
\ge \lambda\,g_L(\rho)[v,v]
$$
for every positive density $\rho$ and tangent vector $v$.

Choose $q>0$ with $q>\max_x\sum_{y\ne x}K(x,y)$ and put $Q=I+L/q$. This is an irreducible reversible stochastic kernel with stationary law $\pi$. Rescaling the continuity-equation potential by $\psi_Q=q\psi_L$ gives
$$
\mathcal W_Q^2=q\mathcal W_L^2,\qquad
g_Q=qg_L,\qquad
e^{tL}=e^{qt(Q-I)}.
$$
Thus the curvature parameter in the normalized-kernel convention is $\kappa=\lambda/q$. Theorem 4.5 of Erbar and Maas (2012) identifies entropy geodesic convexity, the positive-density EVI and the interior Hessian bound for this kernel. Its Theorem 2.4 and Lemma 2.9 identify the positive smooth-curve distance with the restriction of the complete transport metric on nonnegative densities, with $0\log0=0$. Local geodesic convexity yields the Hessian bound by differentiation along short interior geodesics; the cited equivalence then supplies the global statement. These facts establish (1)–(3) for the declared logarithmic-mean geometry.

In (D.8.6.11), the ordinary derivative is understood almost everywhere in time. The squared distance to a positive comparison density is locally absolutely continuous along $P_t\rho$. The stronger assertion at every $t\ge0$ uses the upper-right derivative
$$
\frac{d^+}{dt}F(t):=\limsup_{h\downarrow0}\frac{F(t+h)-F(t)}h,
$$
as in the cited theorem. Smoothness of the density curve alone is not an assertion of everywhere differentiability of squared distance.

The contraction estimate (D.8.6.12) follows by applying (D.8.6.11) twice, once to $(P_t\rho,P_t\nu)$ and once to $(P_t\nu,P_t\rho)$, and adding:
$$
\frac{d}{dt}\mathcal W_L(P_t\rho,P_t\nu)^2
\le
-2\lambda\mathcal W_L(P_t\rho,P_t\nu)^2.
$$
Gronwall's inequality gives (D.8.6.12).

Let $1$ denote the equilibrium density. Since $\mathcal V_{\mathrm{fin}}(1)=0$ and $1$ is the unique minimizer, $\lambda$-convexity gives the gradient-dominance inequality
$$
|\nabla_{\mathcal W_L}\mathcal V_{\mathrm{fin}}|^2(\rho)
\ge
2\lambda\mathcal V_{\mathrm{fin}}(\rho).
\tag{D.8.6.15}
$$
Indeed, along a geodesic from $\rho$ to $1$,
$$
0
\ge
\mathcal V_{\mathrm{fin}}(\rho)
+
\langle \nabla\mathcal V_{\mathrm{fin}}(\rho),\dot\gamma(0)\rangle
+
\frac{\lambda}{2}\mathcal W_L(\rho,1)^2,
$$
so
$$
\mathcal V_{\mathrm{fin}}(\rho)
\le
|\nabla\mathcal V_{\mathrm{fin}}|(\rho)\mathcal W_L(\rho,1)
-
\frac{\lambda}{2}\mathcal W_L(\rho,1)^2
\le
\frac{|\nabla\mathcal V_{\mathrm{fin}}|^2(\rho)}{2\lambda}.
$$
Along the gradient flow,
$$
\frac{d}{dt}\mathcal V_{\mathrm{fin}}(P_t\rho)
=
-|\nabla_{\mathcal W_L}\mathcal V_{\mathrm{fin}}|^2(P_t\rho)
\le
-2\lambda\mathcal V_{\mathrm{fin}}(P_t\rho).
$$
Gronwall's inequality gives (D.8.6.13). Finally, Pinsker's inequality gives
$$
\lVert P_t\rho-1\rVert_{L^1(\pi)}^2
\le
2\mathcal V_{\mathrm{fin}}(P_t\rho),
$$
and (D.8.6.14) follows from (D.8.6.13). ∎

<a id="corollary-d86f-finite-entropic-ricci-limit-of-pce-density-flow"></a>**Corollary D.8.6f (Finite Entropic-Ricci Limit of PCE Density Flow).** Let $(X_N,L_N,\pi_N)$ be finite detailed-balance PCE generators with entropic Ricci curvature bounded below by $\lambda_N\to\lambda$. Suppose their metric-measure realizations converge to a compact regular metric-measure branch $(M,g,m)$, where $m=e^{-f}d\mathrm{vol}_g$. Assume an energy-dissipation convergence certificate for the finite entropic transport flows: the energies
$$
\mathcal H_N(\rho_N)
=
D(\rho_N\pi_N\Vert\pi_N)
+
\int \mathcal U_{\mathrm{pred},N}\rho_N\,d\pi_N
$$
$\Gamma$-converge to
$$
\mathcal H(\rho)
=
\int_M\rho\log\rho\,dm
+
\int_M\mathcal U_{\mathrm{pred}}\rho\,dm,
$$
the initial states converge to a declared $\rho_0$ and their energies converge to $\mathcal H(\rho_0)<\infty$, and the metric derivatives and descending slopes satisfy the action and slope liminf inequalities along the retained trajectory convergence. Assume the corresponding energy sublevels are compact. Require the trajectory convergence to identify the time-zero state and endpoint states and the liminf inequalities to supply an absolutely continuous limiting $W_2$ curve. Assume also that $\mathcal H$ is proper and lower semicontinuous and that its descending slope is a strong upper gradient on this domain. Then every subsequence converging in this declared trajectory topology has a limit that is a curve of maximal slope for $\mathcal H$ on the prescribed metric-measure space $(M,g,m)$. Existence of a convergent trajectory subsequence requires the corresponding temporal compactness certificate. Uniqueness follows only on an additional branch where an applicable EVI existence-and-uniqueness theorem is certified.

For a stationary limiting density on a branch admitting the usual transport first-variation calculus, assume $\rho$ is positive and $C^1$ and $\mathcal U_{\mathrm{pred}}$ is $C^1$ on the component under consideration. Then
$$
\log\rho+1+\mathcal U_{\mathrm{pred}}=\text{constant}
$$
on that connected component.

This conclusion concerns density evolution on $(M,g,m)$. It supplies no evolution equation for $g$ and no tensor equation of the form (D.8.6.5). A continuum limit yielding (D.8.6.3) requires an independent microscopic metric variable together with convergence of its metric action, energy, slopes, and dissipation.

*Proof.* The finite curves in this corollary are gradient flows of the full energies $\mathcal H_N$ in the metrics $\mathcal W_{L_N}$. Writing
$$
z_N(x)=\log\rho_N(x)+\mathcal U_{\mathrm{pred},N}(x),
$$
their positive-density equations are
$$
\dot\rho_N(x)
=
\sum_yK_N(x,y)\theta(\rho_N(x),\rho_N(y))
\bigl(z_N(y)-z_N(x)\bigr).
$$
The logarithmic part equals $L_N\rho_N$; the potential contributes the remaining drift. Consequently the entropy semigroup $e^{tL_N}$ is the full-energy flow only when $\mathcal U_{\mathrm{pred},N}$ is constant on the irreducible state space. Along a positive finite gradient flow, the energy derivative is minus the squared gradient norm, and its metric speed equals that norm. Each such finite flow therefore satisfies the energy-dissipation inequality
$$
\mathcal H_N(\rho_N(T))
+
\frac12\int_0^T
\left(
|\dot\rho_N|_N^2
+
|\partial\mathcal H_N|_N^2(\rho_N)
\right)dt
\le
\mathcal H_N(\rho_N(0)).
$$
Consider a subsequence converging in the declared trajectory topology. Apply the assumed $\Gamma$-liminf inequality to the endpoint energy and the two assumed liminf inequalities to the action and slope terms. The initial-state and initial-energy convergence yield
$$
\mathcal H(\rho(T))
+
\frac12\int_0^T
\left(
|\dot\rho|_{W_2}^2
+
|\partial\mathcal H|_{W_2}^2(\rho)
\right)dt
\le
\mathcal H(\rho_0).
$$
Put $v(t)=|\dot\rho|_{W_2}(t)$ and $h(t)=|\partial\mathcal H|_{W_2}(\rho(t))$. The strong-upper-gradient property and Young's inequality give
$$
\mathcal H(\rho_0)-\mathcal H(\rho(T))
\le \int_0^T h(t)v(t)\,dt
\le \frac12\int_0^T\bigl(h(t)^2+v(t)^2\bigr)\,dt.
$$
The limiting energy-dissipation inequality supplies the reverse bound. Hence equality holds, $h=v$ almost everywhere, and the locally absolutely continuous energy satisfies
$$
\frac{d}{dt}\mathcal H(\rho(t))=-h(t)^2=-v(t)^2
$$
almost everywhere. This proves that the limit is a curve of maximal slope. No uniqueness or temporal compactness assertion follows from this passage alone. On the regular stationary branch, the inequality forces zero descending slope. For every admitted smooth vector field $\xi$ compactly supported in the positive component, the transport first variation is
$$
\delta\mathcal H[-\operatorname{div}_m(\rho\xi)]
=
\int_M\rho\,\nabla(\log\rho+\mathcal U_{\mathrm{pred}})\cdot\xi\,dm.
$$
Zero slope makes this expression vanish for both signs of $\xi$. Positivity of $\rho$ and the stated regularity give $\nabla(\log\rho+\mathcal U_{\mathrm{pred}})=0$, hence the componentwise constant. No step varies $g$, so no metric-flow or tensor-balance conclusion is available. ∎

<a id="corollary-d86g-bravais-propagation-cost-variables-have-crystalline-limits"></a>**Corollary D.8.6g (Bravais Propagation-Cost Variables Have Crystalline Limits).** Take as microscopic metric variables translation-invariant symmetric edge costs $c\in(0,\infty)^S$ on a Bravais carrier $(\Lambda,S)$ in $\mathbb R^D$, $D\ge2$, and let the represented metric be the propagation-cost metric (64). For every $c$ the rescaled metrics converge to the polyhedral norm $\|\cdot\|_{S,c}$ of Theorem C.6c.1, and no norm in the family $\{\|\cdot\|_{S,c}:c\in(0,\infty)^S\}$ is induced by a scalar product. The flat Riemannian metrics, which by Corollary D.8.6c are stationary for (D.8.6.3) at constant $f$, vanishing weighted matter response and $\chi=0$, are therefore not represented by these variables, and on this flat sector no convergence of their energy, slope or dissipation to (D.8.6.3) holds at the level of the represented metric. A microscopic metric variable meeting the requirement stated after Corollary D.8.6f therefore lies outside this class: it uses edge costs that are not translation invariant, a carrier other than a fixed Bravais carrier $(\Lambda,S)$, or a metric map other than (64), such as the intrinsic metric of the limiting Dirichlet form.

*Proof.* Theorem C.6c.1 items 1–2 give the limit $\|\cdot\|_{S,c}$ for each fixed $c$, and its unit ball $\operatorname{conv}\{s/c_s\}$ is a polytope. A norm induced by a scalar product has an ellipsoid as unit ball, whose boundary contains no segment, while every facet of a polytope in dimension $D\ge2$ contains one. At constant $f$ with $\mathcal T^{\mathrm{pred}}=0$ and $\chi=0$, a flat metric has $\operatorname{Ric}=0$ and satisfies (D.8.6.5). Along any family $c(\tau)$ each represented limit metric is polyhedral, so it is never a Riemannian metric, which excludes metric-level convergence to a flow of Riemannian metrics. ∎

<a id="theorem-d86h-polyhedral-product-round-metric-flow"></a>**Theorem D.8.6h (Polyhedral Product-Round Metric Flow).**

Consider the finite metric class consisting of homothetic intrinsic polyhedral spheres, and products of $k$ such spheres, with independent scale variables. For $k=2$ the continuum dimension is four and the two radii may differ. The finite variables are actual edge lengths and finite cell metrics. The continuum limit is the nonstationary product-round Ricci flow until its first extinction time.

The scope is restricted: matter is absent, the spatial normalization multiplier is $\chi=0$, the measure is normalized and held pointwise under the natural scale identification, and the geometric degrees of freedom are homothetic on each factor. This supplies neither the admissibility of this class under every MPU/PPI axiom nor convergence for arbitrary metric perturbations. The MPU realization and arbitrary-perturbation limits are separate conclusions.

#### 3.1 Finite carriers and energy, defined before evolution

For each level $n$ and factor $i=1,\dots,k$, choose a finite $\epsilon_n$-net $Z_{i,n}$ on the unit sphere $S^2\subset\mathbb{R}^3$, with $\epsilon_n\to 0$, using angular distance, and let $P_{i,n}$ be its convex hull. Assume $\epsilon_n<\pi/2$; then the origin lies in its interior. Triangulate any polygonal faces without adding vertices. Equip its boundary $\Sigma_{i,n}$ with the intrinsic piecewise-Euclidean metric $g_{i,n}^0$. Denote its area by $A_{i,n}$ and its vertex angle defects by

\[
\delta_{v,i,n}=2\pi-\sum_{T\ni v}\angle_T(v).
\]

The microscopic variables are $a=(a_1,\dots,a_k)\in(0,\infty)^k$, equivalently the finite edge lengths

\[
\ell_{e,i,n}(a)=\sqrt{a_i}\,\ell_{e,i,n}^0.
\]

They determine the product cell metric

\[
g_n(a)=\bigoplus_{i=1}^k a_i g_{i,n}^0
\]

on $X_n=\prod\Sigma_{i,n}$. Distances are intrinsic length distances through the cells, not shortest paths restricted to the graph's edge set.

Normalize the product volume to one. Under the canonical underlying-polyhedron identification,

\[
dm_n=\prod_i\frac{dA_{i,n}^0}{A_{i,n}}
\]

is independent of $a$. The corresponding spatially constant $f_n$ is $\log\prod_i(a_i A_{i,n})$. Thus the source's pointwise measure constraint is satisfied, and $\delta f_n=\sum_i \delta a_i/a_i=(1/2)\operatorname{tr}_{g_n}\delta g_n$.

Define the finite geometric functional from the local angle-defect ledger by

\[
V_n(a)=\sum_{i=1}^k\frac{2\sum_v\delta_{v,i,n}}{a_i A_{i,n}},
\qquad E_n(a)=-V_n(a). \tag{D.8.6h.A1}
\]

The factor `2` converts Gaussian curvature to scalar curvature in dimension two. In a product, the normalized scalar-curvature ledger is the sum of the factor ledgers: each factor's vertex defect is multiplied by the volume of the other factors, which cancels under normalization. This defines the finite product energy entirely from its finite cells.

The metric on scale velocities is **derived**, not tuned: restrict the source's normalized $L^2(dm_n)$ metric on covariant metric variations, then divide by two to encode the source's “twice positive gradient” convention. Since the $i$-th block has dimension two,

\[
\|\delta g_n\|_{L^2(dm_n)}^2
=2\sum_i\frac{(\delta a_i)^2}{a_i^2},
\qquad
G_n(a)[v,v]=\sum_i\frac{v_i^2}{a_i^2}. \tag{D.8.6h.A2}
\]

Gradient descent of $E_n=-V_n$ in $G_n$ is therefore exactly twice positive $L^2$ gradient flow of $V_n$ in the restricted metric family, matching Theorem D.8.6b.

#### 3.2 Conclusions

Let $a_n(0)\to a^0\in(0,\infty)^k$, and set $C_{i,n}=8\pi/A_{i,n}$. Then:

1. $A_{i,n}\to 4\pi$, so $C_{i,n}\to 2$.
2. On the unconstrained positive-scale parameter manifold, the finite negative gradient equation and its maximal positive-scale solution are exactly
   \[
   \dot a_{i,n}=-C_{i,n},\qquad a_{i,n}(t)=a_{i,n}(0)-C_{i,n}t. \tag{D.8.6h.A3}
   \]
3. On every $0\le t\le T<\min_i a_i^0/2$, these curves converge uniformly, together with their derivatives, to
   \[
   a_i(t)=a_i^0-2t. \tag{D.8.6h.A4}
   \]
   The represented metric-measure spaces converge uniformly in time to the product-round spaces
   \[
   g(t)=\bigoplus_i a_i(t)g_{S^2},\qquad
   dm=\prod_i dA_{S^2}/(4\pi).
   \]
4. On each compact positive-scale box, $E_n\to E=-\sum_i 2/a_i$ locally uniformly, hence $\Gamma$-convergently, and its descending slopes obey
   \[
   |\partial E_n|_{G_n}^2(a)=\sum_i\frac{C_{i,n}^2}{a_i^2}
   \longrightarrow\sum_i\frac4{a_i^2}=|\partial E|_G^2(a). \tag{D.8.6h.A5}
   \]
5. Along the solutions, speeds and slopes coincide and converge uniformly on each such time window; both integrated action and integrated squared slope converge. The exact finite and limiting energy–dissipation identities are
   \[
   E_n(a_n(T))+\frac12\int_0^T
   (|\dot a_n|_{G_n}^2+|\partial E_n|_{G_n}^2)dt=E_n(a_n(0)), \tag{D.8.6h.A6}
   \]
   and the same identity with subscript $n$ removed.
6. The limiting tensor solves precisely the source equation (D.8.6.3) with zero predictive stress, $\chi=0$, and spatially constant $f(t)=\log\prod_i(4\pi a_i(t))$:
   \[
   \partial_tg=-2\operatorname{Ric}(g).
   \tag{D.8.6h.A7}
   \]
   The fixed radial maps and product coordinates provide an explicit representative; no unspecified gauge or diffeomorphism limit is needed on this branch.

#### 3.3 Complete proof

**Finite Gauss–Bonnet ledger.** Every triangular face has angle sum $\pi$. For a closed triangular sphere, $3F=2E$ and Euler's identity is $V-E+F=2$. Therefore

\[
\sum_v\delta_v=2\pi V-\pi F
=2\pi(V-E+F)=4\pi.
\]

Scaling edge lengths leaves all triangle angles unchanged, while area multiplies by `a_i`. Thus (D.8.6h.A1) becomes the exact expression

\[
V_n(a)=\sum_i C_{i,n}/a_i,\qquad E_n(a)=-\sum_i C_{i,n}/a_i. \tag{D.8.6h.A8}
\]

This step is an explicit curvature computation, not an assumed energy-consistency certificate.

**Metric and area convergence.** Let $c_n=\cos\epsilon_n$. For any outward unit face normal $\nu$, the supporting-plane distance is $c=\max_{z\in Z}\langle\nu,z\rangle\ge c_n$, because the net contains a point of angular distance at most $\epsilon_n$ from $\nu$. Also $c\le|x|\le 1$ on that face. Radial projection $p(x)=x/|x|$ is a homeomorphism from the convex polyhedral boundary to $S^2$. On a face, its derivative has largest singular value $1/|x|\le 1/c_n$ and smallest singular value

\[
\frac{\langle\nu,x/|x|\rangle}{|x|}
=\frac c{|x|^2}\ge c_n.
\]

Consequently for every face-tangent vector,

\[
c_n|v|\le|Dp(v)|\le c_n^{-1}|v|.
\]

Integrating along piecewise-smooth curves, and then taking infima, gives the same bilipschitz constants for intrinsic distances. Curves crossing edges are handled by subdivision and approximation; the finite union of vertices/edges does not affect the intrinsic length bound. The two-dimensional area Jacobian is between $c_n^2$ and $c_n^{-2}$, whence

\[
c_n^2 A_{i,n}\le4\pi\le c_n^{-2} A_{i,n}.
\]

This proves $A_{i,n}\to 4\pi$. The normalized pushforward area densities converge uniformly to the normalized round area density up to these same bounds. Taking products preserves a common bilipschitz bound for the product length metrics; its volume distortion tends to one. Scaling by $a_i$ in a compact positive box preserves uniform control. This proves the required uniform-in-time measured metric convergence once the scale convergence is shown.

**Mobility and flow.** At an interior point of a product cell, the variation in block $i$ is $v_i g_{i,n}^0=(v_i/a_i)g_{i,n}$. Its squared covariant-tensor norm is $2(v_i/a_i)^2$; different blocks are orthogonal. The normalized measure has total mass one, giving (D.8.6h.A2). Thus $G_n^{-1}=\operatorname{diag}(a_i^2)$. Since $\partial_i E_n=C_{i,n}/a_i^2$, negative $G_n$ gradient flow gives $\dot a_i=-C_{i,n}$. This proves (D.8.6h.A3), including positivity until first extinction. It also verifies the sign and factor of two against the owner.

**Energy and trajectory limits.** The coefficient convergence and initial convergence immediately give (D.8.6h.A4) and derivative convergence. For any $T$ strictly below first limiting extinction, all coordinates eventually lie in one interval $[\eta,R]$ with $\eta>0$. On that box, (D.8.6h.A8) and all its first derivatives converge uniformly. For any sequence $a_n\to a$ in the box, $E_n(a_n)\to E(a)$; this proves both the $\Gamma$-liminf and recovery inequalities, with recovery $a_n=a$. Compactness supplies equicoercivity on this declared box. There is no claim of global equicoercivity near extinction: the energy tends to minus infinity as any scale tends to zero.

**Slopes and dissipation.** For a smooth function on this finite-dimensional Riemannian manifold the descending slope is its gradient norm. Applying $G_n^{-1}$ to the derivative in (D.8.6h.A8) gives (D.8.6h.A5). Along (D.8.6h.A3), the speed squared is the same expression. Direct differentiation gives

\[
\frac d{dt}E_n(a_n(t))
=-\sum_i C_{i,n}^2/a_{i,n}(t)^2.
\]

Integrating proves (D.8.6h.A6), with no inequality gap. Every integrand converges uniformly on `[0,T]` because scales are bounded below; this proves convergence of both action and slope integrals. An additional exact check is

\[
\int_0^T C_{i,n}^2/a_{i,n}(t)^2dt
=C_{i,n}\left(\frac1{a_{i,n}(T)}-\frac1{a_{i,n}(0)}\right).
\]

**Tensor identification.** On the unit round sphere, the Ricci tensor is $g_{S^2}$. Under constant metric scaling $a_i g_{S^2}$, its covariant Ricci tensor is still $g_{S^2}$; the product Ricci tensor is the block sum. Thus $\dot a_i=-2$ is exactly $\dot g=-2\operatorname{Ric}(g)$. The spatially constant $f(t)$ has zero Hessian, and $e^{-f}\,d\mathrm{vol}_g$ equals the fixed normalized product measure. Differentiating gives $\dot f=\sum_i\dot a_i/a_i=(1/2)\operatorname{tr}_g\dot g$, as required. This proves (D.8.6h.A7) and all claims. ∎

#### 4. An explicit common family and adversarial checks

For an entirely explicit net, take the north and south poles and all points of colatitude $j\pi/n$, $j=1,\dots,n-1$, and longitude $k\pi/n$, $k=0,\dots,2n-1$. Every point of the sphere can first move along a meridian to a nearest colatitude and then along that latitude to a nearest longitude. Each leg has length at most $\pi/(2n)$, since a latitude-circle arc is no longer than its longitude increment. Hence these points are a $\pi/n$-net. For $n\ge 4$ all hypotheses above hold, with explicit $\epsilon_n=\pi/n\to 0$. Taking their convex hull and triangulating faces gives the common finite carrier. The net and hull definitions specify the finite carrier.

For a four-dimensional example, use two copies with $a_1(0)=3$, $a_2(0)=5$, and $T=1$. The limiting product has unequal time-dependent sectional curvatures $1/(3-2t)$ and $1/(5-2t)$. It is genuinely nonstationary, curved, and not confined to the Einstein single-scale locus. Both scale variables, both response lengths, and their separate dissipation terms are retained.

The metric conventions are distinct:

- Using $+V_n$ as a descent potential reverses the Ricci-flow sign. The correct potential is $-V_n$ with half the source $L^{2}$ metric, equivalently positive gradient $2\operatorname{grad}_{L^2}V_n$.
- Using graph-edge shortest paths instead of the filled-cell intrinsic metric changes the represented metric. The present proof cannot license that substitution.

<a id="theorem-d86i"></a>

<a id="theorem-d86i-paid-spectral-prediction-metric-source-and-arbitrary-perturbation-ricci-limit"></a>**Theorem D.8.6i (Paid Spectral-Prediction Metric Source and Arbitrary-Perturbation Ricci Limit).**

##### D.8.6i.1 Statement and scope

The theorem constructs a reduced normal-source branch and a compensated update programme on it: the incremental KL minimization of section 7 followed by the registered gauge and chart retraction of Part IV. Its finite sources, positive prices, fixed ground preparation, solver, clocks, source transport and gauge/retraction defects are specified below, and the weighted parabolic estimates are proved in Part V; no finite-trajectory regularity is assumed.

The scope is the connected material four-torus with arbitrary smooth positive-definite initial metrics and arbitrary smooth tensor perturbations, including trace and off-diagonal directions. Matter is absent and $\chi=0$. The conclusion is on every supplied finite smooth Ricci–DeTurck window with uniform ellipticity and a finite $H^{s+2}$ bound, integer $s>d/2+8$ with $d=4$. It includes the short smooth window available for each smooth initial metric.

The energy is the source-derived reduced energy −lambda, with its equivariant ground-selected measure: section 12 identifies it with the matter-free functional of Definition D.8.6a evaluated at the ground-state density, which is recomputed at every metric, so the fixed-measure initial-value problem is not used. Definition D.1f and Theorem D.1g admit branch-indexed source contracts, and the source below is registered as one such contract.

All physical stock, work, precision, control, time, propagation, source, frame, solver and record charges are retained. Only grade-wide state-independent constants are subtracted for the mathematical energy comparison; no geometry-dependent irreducible predictive risk is removed. The primary dynamical action observable is the retained-record gauge-corrected speed; the diffeomorphism quotient enters only through this corrected speed and, where used, a local regular slice.

##### D.8.6i.2 Input boundary: no future-solution oracle

The controller/compiler receives only the initial metric (or its supplied finite/effective prefixes), fixed source/domain and a priori regular-window bounds, the requested tolerances, and the horizon. It does not receive the future Ricci/Ricci–DeTurck solution, its future metric values, or a target trajectory. Every transition table is computed from the actual finite predictive/KL source cost and the declared gauge/retraction programme. The exact smooth solution and the tube centered on it in the analytical continuation proof are comparison objects only. Cutoffs and resource envelopes use the declared a priori norm/ellipticity/gap/window bounds, not observations of future geometric outputs. Precomputing a finite path means iterating the already source-defined finite transition table from the supplied initial controller, not copying a continuum solution. The same boundary excludes private future hazard outcomes.

##### D.8.6i.3 Integral comparator versus actual quadrature source

The exact off-shell stress identities in Technical Appendix A use the ideal integral Ritz matrices $A_m,W_m$ and their eigenpair $(\lambda_m,u_m)$. The physically installed finite source of Part I uses its actual positive quadrature matrices $(A_N^q,W_N^q)$, eigenpair $(\lambda_N^q,u_N^q)$, spatial mass isometry and categorical sensor. The two differ at finite grade. Source sections use the subscript $N$ for these actual finite quantities. After $n,m$ are fixed, matrix quadrature and its needed parameter/spatial jets are chosen through the uniform spectral-gap/resolvent bounds so that, in particular,

$$
\lVert D\lambda_N^{q} - D\lambda_m\rVert_{(V_n, L^{2})^{*}} \le \epsilon_n,
$$

and the corresponding compensated-vector and mass-derivative discrepancies satisfy the high/low Sobolev/operator tolerances in Part IV and Technical Appendix C. Thus exact ideal stress/cancellation plus a controlled actual-source quadrature residual is what enters the proof. The actual source cost, gate laws, normalization and invoices always use the installed matrices.

##### D.8.6i.4 Main regular-window conclusion

For the actual static source and transition tasks specified below, choose metric cutoff $n$, an independently larger scalar spectral cutoff, then categorical/source quadrature and matrix/gate precision; finally choose the physical step and solver/gauge tolerances. There is a grade-wide paid compensated programme whose endpoint metrics exist on the whole supplied regular window, converge in $C_tH^{s-2}$, and obey the squared error estimate

$$
\begin{aligned}
\sup_t \lVert Q_n - Q\rVert_{H^{s-2}}^{2} + \int \lVert Q_n - Q\rVert_{H^{s-1}}^{2}\, dt \\
&\le C_T(\mathrm{initial\,error}^{2} + n^{-4} + \epsilon_n^{2} + C_{\mathrm{shift},n}^{-2} \\
&\qquad + \mathrm{temporal/controller\,error}^{2}).
\end{aligned}
$$

Here $g=\exp Q$, every retained symmetric Fourier mode is admitted, and $C_{T}$ depends on the supplied smooth-window/ellipticity/gap bounds, not an $n^{2}$ finite-ODE Lipschitz constant. The normalized actual prediction energies, all-retained-direction slopes, ground/source measures, corrected physical speeds and both energy-dissipation integrals converge. Every finite projected-gauge/retraction defect is retained and shown to vanish. The common clocks are fixed $t=t_0s$, physical energy unit $E_0$ and length unit $\ell_0$, with no state-dependent time change.

The proof combines the finite sign and mobility identities with the source, controller, weighted continuation and corrected-action estimates below.

#### D.8.6i.5 Part I. Literal predictive source, transition task and complete invoices

##### D.8.6i.6 0. Branch admission

Definition D.1f and Theorem D.1g admit an independently registered branch contract and do not require all branches to share one numerical objective. Lemma F.1c.5, section 2, treats a different loss as a different contract with its own full ledger, and section 5.2 of that lemma admits a physically installed error-completion battery, the canonical performance $\mathrm{PP}=(1+kr)^{-1}$ and the same-task utility $B=R_{\max}-r$. Preparation and programme data may be prescribed functions of the admitted controls before comparison.

The branch defines its own source experiment, distinct from the Gaussian risk source of Theorem D.6f.2m. Its finite sign follows from its measured survival event and raw quadratic forecast loss, with no geometry-dependent Bayes risk subtracted, and its ground-state preparation is a fixed part of the source task. Its mobility follows from a second covariance-prediction transition service and an incremental minimization rule.

The source is driven, finite-grade, and supplied with normal-controller inputs and their finite-precision approximation path, as in the source grammar of Lemma F.1c.5 and Theorem D.6f.2m; its clocks are externally driven, and its power and computation are paid. A finite metric-controller chart is a full symmetric log-Fourier family $g=\exp Q$ on the material four-torus, including trace components. The extension to the complete evolving metric, density and response quotient is proved below.

##### D.8.6i.7 1. Independently installed finite geometric operator

Fix physical units $E_0>0$, $t_0>0$ and length $\ell_0>0$ once, before all grades. $H_N$, $C_N$ and $\lambda_{N}$ are dimensionless in the fixed $\ell_0$-based spectral normalization; $\tau_{N}$ is dimensionless exposure, not automatically pulse time. All formulas below for $F_N$, $E_{\mathrm{eff},N}$ and $\kappa_{N}$ are initially dimensionless energies divided by $E_0$, and $\delta$ is dimensionless Ricci/adaptation time $s=t/t_0$. Thus the actual risk scale is $E_0/(\tau_Nd_0)$, the actual adaptation battery scale is $E_0/\delta=E_0t_0/\Delta t$, and physical drift is $dg/dt=-G_N^{-1}dF_N/t_0$. Pulse times are separately scheduled in physical seconds. This is one preregistered positive unit and clock calibration, independent of the state.

At grade $N$ fix a compact metric-controller domain, a finite-dimensional carrier, and a real symmetric geometric operator $H_N(g)$. It is the same controlled geometry used for paid propagation lengths and covariance sensors below, installed and calibrated before any source outcome or forecast comparison. The operator used is the finite stiffness-plus-curvature realization of $-4\Delta_g+R_g$ displayed next, with its actual mass normalization. The source calculations below apply exactly to its actual finite matrix, not only to a continuum approximation.

Choose a fixed real trigonometric basis $\phi_{a}$, actual quadrature nodes $x_{i}$ and positive weights $v_i(g)$, and install

$$
\begin{aligned}
W_{ab}(g) &= \sum_i v_i(g)\, \phi_a(x_i) \phi_b(x_i), \\
A_{ab}(g) &= \sum_i v_i(g)[4 g^{jk}(x_i)\, \partial_j \phi_a\, \partial_k \phi_b \\
&\qquad + R_N(g, x_i)\, \phi_a \phi_b], \\
H_N &= W^{-1/2} A W^{-1/2}.
\end{aligned}
$$

Every matrix entry is computed from the supplied finite metric controller, local inverse-metric/curvature calibration and retained quadrature. Hardware control/programme and routing are paid. The installed object is this geometric operator; no $\lambda$-dependent tariff is installed. The theorem uses the displayed independently oversampled Galerkin version, whose all-direction consistency and flow limit are proved in Technical Appendices A–C; a graph operator is used only for the separately typed propagation response of section 13.

Assume this actual finite $H_{N}$ is $C^3$ on the compact domain, has simple lowest eigenvalue $\lambda_N(g)$ with a registered positive gap $\gamma_{N}$, and a smoothly phase-fixed unit vector $u_N(g)$. These conditions can be enforced on a sufficiently small full-dimensional compact metric chart around a certified simple eigenpair. For an irreducible real matrix with negative off-diagonals positivity fixes its phase globally; for the displayed Galerkin version a positive overlap with a fixed reference is a sufficient phase chart. The phase choice is recorded.

Choose from explicit entry/norm envelopes a number

$$
C_N > 2\max(1, \sup_g \lVert H_N(g)\rVert).
$$

All spectral and inverse-gap bounds are source/compiler data. The matrix has finitely many entries, so interval bisection/inertia or standard finite spectral arithmetic with the gap can compute its spectral projector and a chosen vector to any nominated finite precision; resolvent contour differentiation bounds their first/second/third controller jets by finite polynomials in $\gamma_{N}^{-1}$ and the matrix-jet bounds. These computations use only the installed finite matrix. Exact normal-controller formulas and effective finite-precision implementations are kept distinct throughout.

##### D.8.6i.8 2. Paid fixed ground preparation

Adjoin an orthogonal blank $|b\rangle$. For a normalized phase-fixed $u=u_N(g)$, put

$$
w = (|b\rangle - u)/\sqrt{2}, \qquad U_g = I - 2|w\rangle\langle w|.
$$

Then $U_g|b\rangle=u$, $U_g$ is Hermitian/unitary, and $H_{\mathrm{prep}}=\pi\hbar(I-U_g)/(2t_p)$ implements $U_{g}$ in time $t_{p}$. A smooth unit-area envelope replaces the square pulse, with zero endpoint Hamiltonians and a finite recorded amplitude/derivative bound. The denominator is fixed because blank and carrier are orthogonal; no coordinate singularity appears. Coefficient calculation, source stock, purifier, routing, preparation time, phase reference and all records are owned.

The branch configuration consists of $g$ and the forecasts; the initial spectral state is fixed by the source task. Preparing precisely this prescribed $u_N(g)$, to the stated finite precursor tolerance when applicable, is part of implementing the registered source task. Admitting arbitrary spectral states would define a different source contract, on which minimization could select the largest eigenvalue instead of the ground eigenvalue $\lambda$.

##### D.8.6i.9 3. A finite normalized survival experiment, with all records retained

Put $A_{\mathrm{haz}}=C_NI-H_N(g)>0$, $a_0=1/4$ and $\tau_N=a_0/C_N$. Define

$$
\begin{aligned}
K_0 &= \exp(-\tau_N A_{\mathrm{haz}}/2), \\
K_1 &= (I - \exp(-\tau_N A_{\mathrm{haz}}))^{1/2}.
\end{aligned}
$$

These commute and $K_0^*K_0+K_1^*K_1=I$. The exact finite isometry

$$
V_g \psi = |0\rangle K_0 \psi + |1\rangle K_1 \psi
$$

has a unitary dilation on one fresh flag and the carrier. Explicitly $\Theta=\arccos(\exp(-\tau_NA_{\mathrm{haz}}/2))$; a $\sigma_y$-controlled rotation with angle $\Theta$ gives $V_{g}$ on blank flag $|0\rangle$. Its compact eigenvalue range stays away from problematic inverse-function endpoints: $\tau_N\operatorname{spec}(A_{\mathrm{haz}})$ is contained in $(a_0/2,3a_0/2)$. Smooth matrix functional calculus therefore has finite uniform controller-jet bounds at this grade.

This is an actual finite one-window survival/absorption instrument, distinct from a continuous-time jump-time archive. If an absorbed carrier convention is required, route K1's output coherently into a fresh retained environment and put the live register into an absorbing blank. Its full internal/environment state is retained and paid, rather than traced away for cost accounting.

On the prescribed ground state,

$$
\begin{aligned}
V_g u &= \sqrt{q_g}\,|0\rangle u + \sqrt{1 - q_g}\,|1\rangle u, \\
q_g &= \exp[-\tau_N(C_N - \lambda_N(g))], \qquad p_g = 1 - q_g.
\end{aligned}
$$

Since $0<\tau_N(C_N-\lambda_N)<3/8<\log 2$, $0<p_g<1/2$. The flag $X$ has exact Bernoulli law $P(X=1)=p_g$. An optional projective outcome is a finite pointer copy with retained purifier; no reset/bath is needed. For the quadrature operator of section 1, the finite spatial density has an exact same-source map: $S_{ia}=\sqrt{v_i}\,\phi_a(x_i)$, $W=S^*S$, and $E=SW^{-1/2}$ is an isometry. Route the prepared coefficient ground state through $E$, implemented with its paid unitary extension, and copy its spatial label to a private pointer. Then $w_i=|(Eu_N)_i|^{2}$ sum to one exactly and are the probabilities used in section 6. No separate density label is attached by hand. The corresponding reconstructed wavefunction is $\sum_a(W^{-1/2}u_N)_a\phi_a$. Positive lower site weights can be certified on a sufficiently fine compact ground-state approximation chart; this certification is required where controller-metric definiteness uses them.

The predictor has no access to the private flag before its forecast. The ground-state label, programmed metric and phase are source data, not advance access to X.

The survival pulse installs the operator $A_{\mathrm{haz}}$. Its elementary survival response on the separately prepared ground state produces the $\lambda$ dependence, so no computed scalar $\lambda$ enters any tariff.

##### D.8.6i.10 4. Raw quadratic predictive completion and its finite sign

Before outcome release, the predictor supplies $m\in[0,1]$. Install the final nonnegative physical flag battery

$$
H_{\mathrm{err}} = E_0\, E_{m,N} (X - m)^{2}.
$$

Ramp it from zero to its final value smoothly and leave it charged. It is diagonal in the flag, so this operation preserves its law. Its exact stored energy expectation is

$$
\begin{aligned}
&E_0\, E_{m,N}\, r_N(g,m), \\
&r_N(g,m) = (m - p_g)^{2} + p_g(1 - p_g).
\end{aligned}
$$

Every forecast/programme $m$ remains a competitor. Minimizing over $m$ gives $m=p_g$ and raw risk $r_N^*(g)=p_g(1-p_g)=q_g-q_g^{2}$. This risk depends on $g$ and is the geometry cost; it stays in the invoice. Random forecasts or histories of independent earlier trials cannot improve it, since conditional expected squared loss is the same expression with the conditional forecast $m$. Later source flags remain inaccessible at forecast time.

Use the original canonical performance $\mathrm{PP}=(1+kr_N)^{-1}$, a fixed $R_{\max}>1$, and same-task benefit $R_{\max}-r_N$, with independently registered $b>0$. Then effective PCE risk price is $(1+b)E_{m,N}$. Define $q_0=\exp(-a_0)$, $d_0=q_0(2q_0-1)>0$, and preregister

$$
E_{\mathrm{eff},N} = (1 + b)E_{m,N} = 1/(\tau_N d_0).
$$

This is a positive finite-grade meter stiffness and utility calibration, independent of g. The physical battery scale diverges with $C_{N}$; its full invoice is retained.

The reduced risk energy is $F_N(g)=E_{\mathrm{eff},N}(q_g-q_g^{2})$, with

$$
\begin{aligned}
D F_N[g]h &= -b_N(g)\, D\lambda_N[g]h, \\
b_N(g) &= q_g(2q_g - 1)/d_0 > 0.
\end{aligned}
$$

Thus descent has the Ricci-compatible sign at every admitted grade. If $\lambda$ stays bounded and $C_N\to\infty$, $b_N\to 1$ uniformly and its $\lambda$ derivatives beyond order zero are $O(\tau_N)$. For the analysis define the state-independent reference

$$
B_{\mathrm{risk},N} = E_{\mathrm{eff},N}(q_0 - q_0^{2}).
$$

The mean-value theorem gives

$$
F_N - B_{\mathrm{risk},N} \to -\lambda_N
$$

uniformly on bounded-$\lambda$ intervals, with scalar first and second derivative errors $O(\tau_N)$ on those intervals. For a compact controller family with uniform $\lambda_{N}$ first/second jets, this yields $C^2$ controller convergence to $-\lambda_N$. Convergence of $\lambda_{N}$ itself is proved in Technical Appendix A. The subtraction is an analysis normalization: $F_N$, $B_{\mathrm{risk},N}$, the full battery and stock and every divergent reservation remain explicit in the source invoice, and no geometry-dependent Bayes risk is subtracted.

##### D.8.6i.11 5. Complete finite-grade accounting for the new predictive service

Freeze the whole compact source/controller domain, named protocol prefix, desired precision, finite gate template and actual service window $T_{N}$ before comparing g,m. Include all:

- qualified ready host and its original task/cost; metric-controller registers and phase/frame labels;
- geometric $H_N/W/R_N$ calculation and calibration, spectral gap certificate, finite eigenvector and matrix-function arithmetic;
- ground blank, flag, pointers, reference/purifier and all source preparation;
- all routed wires, gate/clock slots, source interval, forecast installation and release;
- power/action/precision envelopes, completion flags, storage/holding and archives;
- the actual static error battery. The separate transition batteries of section 6 belong to the full step invoice of section 7.

For each smooth finite gate family choose a common routed template and a compact norm/derivative envelope. Reserve actual stock/register/slot/power/precision services at the positive endpoint prices of Lemma F.1c.5, section 5.1, as in Theorem D.6f.2m, padded before comparison. The full source need not have uniformly bounded resources as N increases. The implementation has no unreserved g-dependent runtime: finite-precision spectral and matrix arithmetic has a uniform operation-count bound from the finite size, gap, coefficient envelopes and requested error, and unused steps are padded. Its actual work registers/garbage remain retained or are reversed before final source release.

All coherent prep/dilation/routing segments have zero endpoint storage Hamiltonian. For the closed enlarged system, including source, reference, drives as the recorded external work service, pointers and retained environments,

$$
\begin{aligned}
W_{\mathrm{segment}} &= \int \operatorname{Tr}(\rho\, \dot{H})\, dt \\
&= \operatorname{Tr} \rho_{\mathrm{final}} H_{\mathrm{final}} - \operatorname{Tr} \rho_{\mathrm{initial}} H_{\mathrm{initial}} = 0.
\end{aligned}
$$

Action, switching power and reservation price are charged separately. The final error battery stays charged; its actual charge remains $E_{m,N}r_N$. The compulsory reserve flags have their actual fixed positive final charges. Fresh pure input stock and all outputs are paid; no erasure credit appears.

Let $R_{\mathrm{op},N}$, $R_{\mathrm{prop},N}$ and $R_{\mathrm{fixed},N}$ be the sums (in energy units divided by $E_0$) of these explicit supplied resource charges, and $B_{\mathrm{host},N}$ the unchanged host's utility over the same actual common window. Conditional on the prescribed uniformly frozen implementation/complete inventory, the four prices of Lemma F.1c.5 give the exact static predictive-service subinvoice

$$
\begin{aligned}
T_N V_N(g,m)/E_0 &= C_{\mathrm{source},N} + E_{\mathrm{eff},N}\, r_N(g,m), \\
C_{\mathrm{source},N} &= R_{\mathrm{op},N} + R_{\mathrm{prop},N} + R_{\mathrm{fixed},N} \\
&\qquad - B_{\mathrm{host},N} - b\, E_{m,N} R_{\max}.
\end{aligned}
$$

Every constant depends on the grade and the whole prescribed prefix, and not on $g$ or $m$. Utility is signed, so $C_{\mathrm{source},N}$ may have either sign; the actual physical final charges are nonnegative and listed separately. A tariff charging unreserved amplitude or irreversible switching defines a different branch. The reservation-service pricing is that of Lemma F.1c.5, section 5.1, as used in Theorem D.6f.2m, here with a new target law and final battery.

Qualification is joined through the qualified host of Theorem O.7.2.3m: the actual host update controls a retained invertible frame on the source flag/output label and its inverse decoder, as in section 4 of that theorem. The raw X is the decoded label. All host calibration/forecast/update records and frame gates are paid. Qualification rests on this host participation. Part III defines the full catalog/horizon event inventory and Part IV fixes its single common refinement order.

##### D.8.6i.12 6. New finite covariance-prediction adaptation service

The mobility is derived from this second service.

At each site $i$ retain an old metric $g_{i}$ and a source-selected weight $w_i(g)>0$, $\sum_iw_i=1$. They are exactly the normalized ground density weights from the geometric operator and the mass-isometry map in section 3. Technical Appendix A supplies their continuum identification on the common sequence.

Choose a finite symmetric covector alphabet $Z_{R,a}=[-R,R]^d\cap a\mathbb{Z}^d$ containing enough covectors to distinguish every symmetric quadratic form (0, coordinate vectors and pairwise coordinate sums suffice). Install the finite local covariance source

$$
P_G(z) = \exp(-z^{T} G^{-1} z/2)/Z(G), \qquad z \in Z_{R,a}.
$$

This is the explicitly prepared normalized finite discrete Gaussian on the alphabet. The same local $g^{-1}$ is calibrated by its quadratic spring/probe response before the prediction comparison. The probe $z$ has covector components, covariance $G_{ij}$, and energy $z^{T}G^{-1}z/2$. Under $x=x(y)$, $J=dx/dy$, transport both $G_y=J^{T}G_xJ$ and $z_y=J^{T}z_x$. The finite alphabet is transported as a labelled set, not regenerated as a rectangular lattice in the new chart. This makes the quadratic energies and all finite probabilities exactly invariant under a simultaneous coordinate/source transport. Site quadrature nodes, basis functions, weights, coframes and retained records must be transported together.

Its normalized state is $\sum_z\sqrt{P_G(z)}|z\rangle$ with a retained purifier/pointer, prepared by the blank-plus-Householder construction of section 2. Every coefficient is an actual local geometry-derived source parameter. Its coefficients are fixed by the local geometry before any mobility is computed.

Sample $i$ with the old retained weights $w_i(g)$, then $z$ with $P_{g_i}$. During the candidate comparison $g'$, both sampling laws remain frozen. Charge candidate $g'$ by the actual diagonal logratio battery

$$
H_{\mathrm{adapt}}(i, z; g, g') = E_0 \kappa_N [B_N + \log(P_{g_i}(z)/P_{g'_i}(z))].
$$

On an elliptic domain $\alpha I\le G,G'\le\beta I$,

$$
\begin{aligned}
|\log(P_G(z)/P_{G'}(z))| \\
&\le d R^{2}(1/\alpha - 1/\beta).
\end{aligned}
$$

Indeed each exponent difference is bounded in absolute value by half the right side, and the log-normalizer difference is bounded by the same half via termwise comparison. Therefore a single $B_N=1+dR^{2}(1/\alpha-1/\beta)$, independent of the old and new metrics, makes every physical battery charge positive. Its scale, operator coefficients, preparation, sample-site routing and retained sample/purifier are paid. An unbounded Gaussian has no finite uniform offset, which is why the finite alphabet is used at every grade.

The expected adaptation charge divided by E0 is exactly

$$
\begin{aligned}
&\kappa_N[B_N + D_N(g, g')], \\
&D_N(g, g') = \sum_i w_i(g)\, \mathrm{KL}(P_{g_i} \,\Vert\, P_{g'_i}) \ge 0.
\end{aligned}
$$

The old-dependent entropy contribution is physically present in the logratio battery and stays in the invoice. This is a two-configuration transition service, with the old source held fixed only during one candidate comparison. The uniform $B_{N}$ and the complete transition invoice remain in cumulative accounting.

###### D.8.6i.13 Exact finite Hessian and its tensor limit

At $g'=g$, $D_N=0$ and $D_2D_N=0$. For local symmetric variations $h,k$, direct differentiation of the normalized exponential family gives

$$
\begin{aligned}
I_G(h,k) = {}&1/4\, \operatorname{Cov}_{P_G} \\
&(z^{T} G^{-1} h G^{-1} z,\ z^{T} G^{-1} k G^{-1} z).
\end{aligned}
$$

Thus the candidate-coordinate Hessian of $D_{N}$ is

$$
G_N(g)[h,k] = \sum_i w_i(g)\, I_{g_i}(h_i, k_i).
$$

The chosen alphabet makes this positive on nonzero local symmetric directions: zero variance of a quadratic form implies it is constant on the alphabet, its value at zero is zero, coordinate and pairwise vectors then force every coefficient to vanish. A metric-controller sampling map must be injective for positivity on controller coordinates.

As $R\to\infty$ and $a\to 0$, Gaussian tails and quadrature give uniformly on compact elliptic $G$,

$$
I_G(h,k) \to (1/2) \operatorname{tr}(G^{-1} h G^{-1} k).
$$

Proof: all derivatives of normalized finite Gaussian moments through the required order are ratios of sums with polynomial factors in $z$ and coefficients bounded by compact ellipticity. The Gaussian bound $\exp(-|z|^{2}/(2\beta))$ dominates every such polynomial; split a fixed large ball and its uniformly small tail, then use uniform Riemann-sum convergence on the ball. Denominators have uniform positive lower bounds. Wick's elementary fourth-moment identity for the limiting centered Gaussian gives $\operatorname{Cov}(z^{T}Az,z^{T}Bz)=2\operatorname{tr}(AGBG)$, proving the formula. The same domination provides uniform third-jet control needed in the incremental expansion.

If the same weights converge to $dm_g$, the limiting tensor metric is therefore

$$
G_g(h,k) = (1/2) \int \operatorname{tr}(g^{-1} h g^{-1} k)\, dm_g.
$$

This weighted half tensor-L2 metric is the response of the physically specified covariance-prediction service.

##### D.8.6i.14 7. Finite incremental minimization, speed, slope and dissipation

Freeze a grade $N$ and an interior finite controller chart. Register a dimensionless step $\delta$ (physical duration $\Delta t=t_0\delta$) and choose the adaptation battery price $\kappa_N=1/\delta$ in the same physical energy units as $F_{N}$. This positive price is a physical battery scale and is paid, including its baseline $B_N/\delta$.

After optimizing the separately committed forecast, the one-step PCE candidate cost, with all common reserve/utility constants retained, has variable part

$$
J_{g,\delta}(g') = F_N(g') + (1/\delta)\, D_N(g, g').
$$

The full step invoice is, in dimensionless energy units, $T_{\mathrm{step}}V_{\mathrm{step}}/E_0=C_{\mathrm{all},N,\delta}+E_{\mathrm{eff},N}r_N(g',m)+(1/\delta)D_N(g,g')$. $C_{\mathrm{all}}$ includes the uniform $B_N/\delta$ adaptation baseline and the complete old/new/solver/record reservation prefix. Unlike the static subinvoice in section 5, it includes the final adaptation charge, and it is a transition cost in which the old-source entropy stays. The scalarization gives $J$ after optimizing $m$ and retaining these grade/step constants. Choosing the next controller by this incremental PCE minimization is an additional registered adaptation rule of the branch, beyond the static grammar of Theorem D.1g.

For small enough $\delta$ and an interior starting point, the local minimizer near g is unique by positive Hessian $G_{N}$ and the implicit function theorem. Taylor expansion of its first-order condition yields

$$
\begin{aligned}
0 &= dF_N(g') + (1/\delta)\, D_2 D_N(g, g'), \\
g' - g &= -\delta\, G_N(g)^{-1} dF_N(g) + O(\delta^{2}).
\end{aligned}
$$

All constants are finite and uniform on a fixed compact interior chart. A finite trust region is registered before comparison; within its uniformly convex normal-coordinate subchart, $G_N$'s lower bound dominates the bounded energy and divergence Hessian perturbations for sufficiently small $\delta$. For a global compact comparison, additional exclusion of far minima follows if $D_N(g,g')$ has a positive minimum off every fixed neighborhood; injectivity and compactness give that separation. Boundary arrivals require a separately stated stopping/restriction rule, not unrestricted smooth flow.

The continuous $\delta\to 0$ limit at fixed grade is therefore the finite ODE

$$
\dot{g} = -G_N^{-1} dF_N = b_N G_N^{-1} d\lambda_N,
$$

where the dot is $d/ds$ for $s=t/t_0$; physical derivative is this divided by $t_0$.

Its exact state-energy slope and speed identities are

$$
\begin{aligned}
|\partial F_N|_{G_N}^{2} &= dF_N^{T} G_N^{-1} dF_N, \\
|\dot{g}|_{G_N}^{2} &= |\partial F_N|_{G_N}^{2}, \\
dF_N/ds &= -|\partial F_N|_{G_N}^{2}.
\end{aligned}
$$

Their integrated equality gives both dissipation terms. The discrete minimizer also satisfies

$$
F_N(g_{k+1}) + (1/\delta)\, D_N(g_k, g_{k+1}) \le F_N(g_k).
$$

Since $D_N=(1/2)G_N[\Delta g,\Delta g]+O(|\Delta g|^{3})$, this has the expected one-half speed term. The full limiting slope term follows from the first-order condition and the ODE. The physical transition invoices include $B_N/\delta$ and all archives; the decrease concerns the state energy, while the cumulative supplied work is nondecreasing.

The finite algorithmic approximation in Part III uses exhaustive actual-circuit interval evaluation on a full finite catalog and the strongly convex local objective, with finite operation/precision bounds frozen before candidate selection. Error tolerances make the aggregate step error vanish, and the global minimization is charged its computational cost. Part III supplies the finite solver/error and occurrence schedule; Part IV joins its tolerances to the spatial construction.

#### D.8.6i.15 Part II. Actual metric, volume, spectral-density and gauge response maps

##### D.8.6i.16 11. Exact finite simultaneous source transport under a supplied coordinate diffeomorphism

This finite map proves covariance of a supplied representation; the fixed-chart retraction error is estimated separately in Technical Appendix B.

Let $x=\phi(y)$ be a supplied smooth orientation-preserving diffeomorphism on the admitted compact chart, with its inverse/Jacobian bounds and computation programme paid. Start from the actual finite quadrature data $(x_i,v_i,\phi_a,g,R_N)$ used to define $A,W$, and transport it as follows:

$$
\begin{aligned}
y_i &= \phi^{-1}(x_i), \qquad v_i^{\mathrm{new}} = v_i, \\
\mathrm{basis}_a^{\mathrm{new}}(y) &= \mathrm{basis}_a(\phi(y)), \\
g_{\mathrm{new}} &= \phi^{*} g, \qquad R_N^{\mathrm{new}}(y_i) = R_N(x_i).
\end{aligned}
$$

Here $R_N^{\mathrm{new}}$ is the transported calibrated scalar record; a recomputation by a coordinate finite-difference formula carries its own covariance error, which is then estimated separately. For the transported data, the chain rule and inverse-metric transformation give termwise invariance of the stiffness integrand; mass terms are also identical. Therefore

$$
W_{\mathrm{new}} = W, \quad A_{\mathrm{new}} = A, \quad H_{\mathrm{new}} = H,
$$

exactly in the same finite basis-label Hilbert space. The phase-fixed ground vector, spectral flag probability and complete finite hazard instrument are identical up to the declared label/unitary response transport. The source density map satisfies $S_{\mathrm{new}}=S$, so $w_{i}$ is identical as a probability on transported site labels.

At site $i$ put $J_i=D\phi(y_i)$, and transport the covector alphabet and both old/new candidate metrics by

$$
\begin{aligned}
z_i^{\mathrm{new}} &= J_i^{T} z_i, \\
G_i^{\mathrm{new}} &= J_i^{T} G_i J_i, \\
G_i^{\mathrm{prime,new}} &= J_i^{T} G_i' J_i.
\end{aligned}
$$

Each quadratic energy, finite normalizer, normalized probability, logratio battery coefficient and candidate KL divergence is then exactly unchanged. Every source sample retains the same abstract finite label; physical coordinates, covector values and controller records are transported. The alphabet is transported, not regenerated, and every Jacobian record and both sides of the old/new comparison are transported.

For a paid metric graph, retain the abstract edge, actual timer/length, path and source ownership labels, and transport its coordinate embedding/path by $\phi^{-1}$. Its finite shortest-path metric is exactly unchanged. A nonlinear coordinate transformation does not preserve a fresh midpoint-straight-segment formula at fixed integer edge descriptors; that recomputation would be a different finite graph and needs an error estimate. Transporting the actual edge/path rather than substituting a new formula supplies the exact graph response intertwiner.

All new gauge-controller arithmetic, inverse/Jacobian evaluation, label routing and representation records have a fixed paid envelope over the nominated compact gauge prefix. The physical source probabilities and battery charges above are invariant; its extra gauge-control service cost is a separately owned grade/prefix term. A subsequent projection to a fixed Fourier controller/grid is an approximation, estimated in Technical Appendix B; both the transported and the projected records are retained.

##### D.8.6i.17 12. Exact reduced-energy owner bridge and continuum gauge calculus

Definition D.1 leaves the potential V branch-defined, and Theorem D.1g states that branches need not share one numerical Lagrangian. The reduced branch therefore uses its own energy: the full selected functional, with its ground measure retained, through the following exact reduction.

On a compact connected smooth manifold, let $u_{g}>0$ be the normalized simple lowest eigenfunction of $H_g=-4\Delta_g+R_g$, $\int u_g^{2}\,dV_g=1$, and set $f_g=-2\log u_{g}$ and $dm_g=u_g^{2}dV_g$. Then directly

$$
\begin{aligned}
F(g, f_g) &= \int (R_g + |\nabla f_g|^{2})\, dm_g \\
&= \int (R_g u_g^{2} + 4|\nabla u_g|^{2})\, dV_g = \lambda(g).
\end{aligned}
$$

This is equality of the full selected continuum energy, including its density term; no geometry-dependent baseline is omitted. The selected f is part of the source record.

For a metric variation $h$ and induced density variation $\psi=\delta f_g$, the full first variation has the form

$$
\begin{aligned}
\delta F = \int \{&-\langle \mathrm{Ric} + \operatorname{Hess} f, h\rangle \\
&+ (\operatorname{tr}_g h/2 - \psi)(2\Delta f - |\nabla f|^{2} + R)\}\, dm.
\end{aligned}
$$

The eigen-equation gives $2\Delta f_g-|\nabla f_g|^{2}+R=\lambda(g)$, spatially constant. Normalization gives $\int(\operatorname{tr}_gh/2-\psi)\,dm_g=0$. Therefore all induced density/preparation terms cancel by their actual stationary normalized source equation, and

$$
D\lambda(g)[h] = -\int \langle S_g, h\rangle\, dm_g, \qquad S_g = \mathrm{Ric}_g + \operatorname{Hess}_g f_g.
$$

This is an envelope calculation: the derivative of the ground preparation is included and cancels. With the covariance-derived metric

$$
G_g(h,k) = (1/2) \int \operatorname{tr}(g^{-1} h g^{-1} k)\, dm_g,
$$

the reduced energy $e(g)=-\lambda(g)$ has gradient $2S_g$, so its descent equation is

$$
dg/ds = -2(\mathrm{Ric}_g + \operatorname{Hess}_g f_g).
$$

It is the vacuum tensor expression of (D.8.6.3) with $\chi=0$ and the selected $f_{g}$. The measure is recomputed by its ground-state source at every metric.

For a diffeomorphism $\phi$, spectral covariance and uniqueness give $u_{\phi^*g}=u_g\circ\phi$, $f_{\phi^*g}=f_g\circ\phi$, $dm_{\phi^*g}=\phi^*dm_g$ and $\lambda(\phi^*g)=\lambda(g)$. This is the continuum counterpart of the exact finite source map in section 11. Differentiating invariance in a smooth vector field $X$ gives

$$
G_g(-2S_g, \mathrm{Lie}_X g) = D\lambda(g)[\mathrm{Lie}_X g] = 0.
$$

Thus the descent velocity is orthogonal to all smooth coordinate-gauge directions, which is sufficient for the explicit corrected-action extractor: for every smooth X,

$$
\begin{aligned}
\lVert -2S_g + \mathrm{Lie}_X g\rVert_G^{2} \\
&= \lVert -2S_g\rVert_G^{2} + \lVert \mathrm{Lie}_X g\rVert_G^{2} \ge \lVert -2S_g\rVert_G^{2}.
\end{aligned}
$$

This pointwise minimization uses no global structure of the diffeomorphism quotient. A supplied additional gauge velocity $\mathcal{L}_Yg$ has the same quotient norm by choosing $X=-Y$; its computational/record cost remains paid separately.

If $\psi_{s}$ is generated by $+\nabla_gf_g$, the pullback $h(s)=\psi_s^*g(s)$ obeys $dh/ds=-2\,\mathrm{Ric}_h$. All source measures, fields, operator/basis/coframe and archive labels transform together; $\psi_s^*dm_{g(s)}$ is retained and is generally not time independent. Here the selected $-\lambda$ energy, its full derivative and its quotient speed and slope are identified explicitly.

In a smooth window, the exact reduced identities are

$$
\begin{aligned}
|\partial e|_G^{2} &= |dg/ds|_{\mathrm{quot},G}^{2} = 2\int |S_g|^{2}\, dm_g, \\
de/ds &= -2\int |S_g|^{2}\, dm_g, \\
e(g(S)) + (1/2)\int_0^S \\
&(|dg/ds|_{\mathrm{quot},G}^{2} + |\partial e|_G^{2})\, ds = e(g(0)).
\end{aligned}
$$

Physical units use $e_{\mathrm{phys}}=E_0 e$, $t=t_0 s$ and friction metric $E_0 t_0 G$, so the same equality holds in physical work/time units after multiplying by $E_0$. These are continuum identities of the reduced source; the finite-to-continuum passage is proved in Technical Appendices A–C with the implementation and source error diagonal of Parts III–IV.

The continuum first variation is that of Perelman (2002, §§1.1–1.2 and 2.2), in the form used in the proof of Theorem D.8.6b.

##### D.8.6i.18 13. Actual metric/volume representative on the same unrestricted controls

This section supplies a static geometric response map for the source, including trace directions. Fix a compact uniformly elliptic $C^2$ metric family on $\mathbb{T}^4$, with $\alpha I\le g\le\beta I$ and a common $C^2$ bound. At spatial grade $j$ choose grid spacing $\epsilon_j\to 0$, integer stencil radius $m_j\to\infty$ with $h_j=\epsilon_j m_j\to 0$ and $\epsilon_j/h_j\to 0$. Use the finite grid vertices $x\in(\epsilon_j\mathbb{Z}/\mathbb{Z})^4$ and every nonzero integer edge displacement $s$ with $|s|\le m_j$. For sufficiently fine grades take the unique short coordinate lift.

Install the actual owned edge service with dimensionless length

$$
l_g(x,s) = \epsilon_j \sqrt{s^{T} g(x + \epsilon_j s/2)\, s}.
$$

Its physical length is $\ell_0 l_{g}$; its paid timer can use a preregistered conversion $t_{\mathrm{length}} l_g$ with fixed $t_{\mathrm{length}}>0$, independently recorded from $t_0$, survival exposure and the adaptation step. This is the growing-port normal-controller edge-service class of Theorem D.6f.2m, here without the unimodularity premise. The complete link/timer/source/record inventory is reserved over the compact full metric family and charged as an actual service. Every edge and all additional ports are auxiliary services, separate from the distinguished 24-root shell.

Let $d_{j}^{g}$ be its shortest-path length. For $z=\epsilon_j s$, bounded $C^2$ coefficients and ellipticity give

$$
|l_g(x,s) - d_g(x, x+z)| \le C|z|^{3}.
$$

One derivation expands the metric along the affine segment about its midpoint; midpoint quadrature has third-order length error. The minimizing short geodesic differs from the affine segment by $O(|z|^{2})$ from the bounded Christoffel equation; the first variation vanishes at constant metric, so the induced length correction is also $O(|z|^{3})$. Uniform lower length $c|z|$ converts this to a relative $O(h_j^{2})$ error. Consequently summing along any graph path gives

$$
d_g(x,y) \le (1 + C h_j^{2})\, d_j^{g}(x,y).
$$

For the reverse bound partition a minimizing $g$-geodesic into coordinate chords of length at most $\epsilon_j(m_j-2)$, then round intermediate endpoints to grid vertices. Each rounded chord is an admitted edge because in four dimensions the rounding displacement is at most $\epsilon_{j}$ per endpoint. Repeated vertices can be removed. The number of chords is at most $C d_g/h_j+C$, and rounding changes their summed lengths by at most $C\epsilon_{j}$ per chord. The same local cubic bound yields

$$
d_j^{g}(x,y) \le [1 + C(h_j^{2} + \epsilon_j/h_j)]\, d_g(x,y) + C\epsilon_j.
$$

The constants are uniform over the full compact metric family, including all admitted trace/off-diagonal perturbations. Distances therefore converge uniformly under the actual node/cell correspondence to the same g used by the spectral and covariance sources. The stencil radius grows, so this graph lies outside the class of Corollary D.8.6g.

Use the actual cell masses

$$
v_i(g) = \int_{\mathrm{cell}_i} \sqrt{\det g(x)}\, dx.
$$

Unlike the unimodular source of Theorem D.6f.2m, these vary with $g$ and are retained as normal-controller preparation/volume records. They are positive, sum to $\operatorname{Vol}_g(\mathbb{T}^4)$, and exactly implement cell volume for every $g$. Paid finite arithmetic/quadrature supplies finite-precision realizations with a uniform relative error budget from the compact ellipticity envelope. The physical volume is $\ell_0^{4} v_i$. The normalized geometric measure is $v_i/\operatorname{Vol}_g$, while the ground source density is $w_i=|(S W^{-1/2}u_N)_i|^{2}$. Both measures are recorded, and their relation is the eigenfunction density map.

In section 1 take these same nodes and cell masses for the spectral quadrature, with its mesh selected after the metric and eigenfunction cutoffs and derivative envelopes. The actual local metric inverse and curvature-jet coefficients come from the same supplied finite smooth controller. This identifies the finite spectral matrix's geometry with the paid metric source. Uniform quadrature/first-variation estimates are supplied by Technical Appendix A and the common diagonal; the final proof below states the named dynamic response comparisons.

A smooth compactly controlled path of metrics has the same uniform distance/volume bounds at every time. Named finite responses made from bounded continuous geometric effects, the fixed finite spectral/covector instruments and their paid controller records therefore have ordinary finite-parameter continuity estimates at each grade. Uniform-in-grade response transport uses the explicit finite-prefix precision diagonal and concerns fixed named responses. All raw archives remain retained and priced; the fixed named projections are the ones with a continuum limit.

###### D.8.6i.19 13a. Same-volume reversible propagation generator

Write $\rho(x)=\sqrt{\det g(x)}$, $v_i=\int_{\mathrm{cell}_i}\rho\,dx$, $\bar{\rho}_i=v_i/\epsilon_j^{4}$, and choose one compact-family constant $c>0$ below the least eigenvalue of $\rho g^{-1}$. Put $B(x)=\rho(x)g(x)^{-1}-cI>0$ and, for $u\in S^3$,

$$
\begin{aligned}
w_B(u) &= \det(B)^{-1/2}(u^{T} B^{-1} u)^{-3}, \\
Q_m &= \sum_{0<|s|\le m} |s|^{2}, \\
k_g(x,s) &= c\,\epsilon_j^{-2}\, 1_{s=\pm e_a} \\
&\quad + 8/(\epsilon_j^{2} Q_m)\, w_{B(x+\epsilon_j s/2)}(s/|s|), \\
L_j^g f(x_i) &= \bar{\rho}_i^{-1} \sum_s k_g(x_i,s) \\
&\qquad [f(x_i + \epsilon_j s) - f(x_i)].
\end{aligned}
$$

All rates are positive. Midpoint symmetry gives $k_g(x,s)=k_g(x+\epsilon_j s,-s)$, so the actual site law $\mu_i=v_i/\operatorname{Vol}_g$ is exactly reversible:

$$
\begin{aligned}
\mu_i (L_j)_{i,i+s} &= \epsilon_j^{4} k_g(x_i,s)/\mathrm{Vol}_g \\
&= \mu_{i+s} (L_j)_{i+s,i}.
\end{aligned}
$$

The angular Gaussian identity (proved by radial integration of $xx^T\exp(-x^T B^{-1}x)$) gives the frozen second moment tending to $2\rho g^{-1}$. Compact-family lattice quadrature on the expanding stencil is uniform with the retained coefficient derivatives. Midpoint Taylor expansion, with odd terms canceling, therefore gives for every uniformly $C^3$ controlled $f$

$$
L_j^g S_j f \to \rho^{-1} \partial_a(\rho g^{ab} \partial_b f) = \Delta_g f
$$

uniformly. More explicitly the error is bounded by $C_f(h_j+e_m+\epsilon_j)$, where $e_m\to 0$ is the uniform angular quadrature error and the final term controls $\bar{\rho}_i-\rho(x_i)$. This supplies the volume drift, which vanishes in the determinant-one specialization of Theorem D.6f.2m. The exact cell masses and the normalized geometric probability are distinct from the ground weights $w_{i}$.

The edge-length/timer diagnostics and the endpoint heat sampler are distinct named, paid services under the same complete $g$-controlled source. The sampler has its own fully delivered endpoint instrument/control/routing service and clock and does not traverse the fixed-latency edges, so no causal finite-speed conclusion is drawn from it. The actual finite endpoint channel $P_j^g=\exp(\Delta_j L_j^g)$ is a normalized stochastic kernel at every grade. Its finite source implementation uses paid prepared random/flag stock, the complete finite kernel/instrument and its retained records, on physical completion periods $t_{\mathrm{heat}}\Delta_j$ with an independently fixed $t_{\mathrm{heat}}>0$. It is a finite-prefix driven endpoint service. All coefficient/norm/rate/programme envelopes cover the whole compact $(g,\rho)$ family. Its physical generator clock is $L_j/t_{\mathrm{heat}}$ and is distinct from the slow deformation clock $t_0$ and hazard exposure parameter.

For a smooth static g and smooth f, contractivity and a finite telescoping/Duhamel comparison give on each fixed heat-time prefix

$$
\begin{aligned}
\lVert (P_j^g)^{\lfloor t/\Delta_j \rfloor} S_j f - S_j \exp(t\Delta_g) f\rVert_\infty \\
&\le t \sup_{0 \le s \le t} \mathrm{consistency\,error}(\exp(s\Delta_g) f) \\
&\quad + \Delta_j \sup_{0 \le s \le t} \lVert \Delta_g \exp(s\Delta_g) f\rVert_\infty.
\end{aligned}
$$

Uniform compact geometric regularity bounds the needed smooth heat responses. The same g, nodes and actual cell masses are used in the spectral source quadrature. The graph Laplacian and the Galerkin Schrödinger matrix are different finite operators, related through their common limiting tensor and operator. Finite products of these channels and bounded named source/position effects have the corresponding summed telescoping response errors. Entire growing archives are retained with cost; convergence concerns the named finite responses.

###### D.8.6i.20 Clock hierarchy

The clock convention is noncircular: $\tau_{N}$ is only the dimensionless spectral exposure entering the installed endpoint rotation $\Theta$. That rotation is executed in its assigned actual positive physical subwindow $\sigma_{N}$, with the calibrated finite generator $\hbar\Theta/\sigma_N$, and $\sigma_{N}$ is not tied to $t_0\tau_{N}$. Thus the scalar and sensor choices and $C_{N}$ are frozen before the update step and solver tolerances are chosen, as the triangular construction requires.

#### D.8.6i.21 Part III. Finite effective controller, physical clocks and all-outcome error budgets

##### D.8.6i.22 1. Scope and effective inputs

Fix one finite geometric grade, compact controller domain $Q$, time unit $t_0$, energy unit $E_0$, dimensionless step $h>0$, and finite horizon $K$ steps. Supply rational finite metric catalog $C\subset Q$ (all reachable old states lie in $C$), finite forecast catalog $M\subset[0,1]$, and effective certified bounds for the actual finite $H(q)$, its spectral gap, weights $w(q)$, normalized finite Gibbs probabilities, and source gates. The finite catalog can have arbitrarily many elements. Its size and all resources below may diverge under refinement.

The source contract is the explicitly driven branch of Lemma F.1c.5: finite Hermitian controls, paid incoming pure stock and external controls, exact accounting of actual endpoint work, and physically loaded fixed reservation records. No black-box expectation access is an input. Source coefficients are independently specified computable functions of supplied finite controller data; interval arithmetic evaluates those functions and the finite matrices actually installed.

Let $A=1/(\tau d_0)>0$ be the normalized effective risk coefficient, $p(q)$ the ideal finite survival probability, and

$$
\begin{aligned}
&\ell(q,r;i,z)=\log[P_{q_i}(z)/P_{r_i}(z)],\\
&|\ell|\le L=dR^{2}(1/\alpha-1/\beta),\quad B=1+L.
\end{aligned}
$$

Both bounds cover all old/new pairs, not only the chosen step. Let $\mu_q(i,z)=w_i(q)P_{q_i}(z)$. The ideal variable expected cost on complete candidates $a=(r,m)$ is

$$
J_q(a)=A\, \mathbb{E}_{X\sim\mathrm{Bern}(p(r))}(X-m)^{2} + h^{-1} \mathbb{E}_{Y\sim\mu_q}\ell(q,r;Y).
$$

Its common physical adaptation offset is $B/h$. Minimize over forecasts continuously only for analysis: $j_q(r)=A p(r)(1-p(r))+D(q,r)/h$. Raw risk is not subtracted.

##### D.8.6i.23 2. Install an actual finite approximation before compiling its solver

For every catalog point and pair compile finite rational descriptions of preparation/rotation gates, battery coefficients, and routing. All entries have finite effective approximation algorithms because the finite spectral gap, positive normalization floors, and compact functional-calculus ranges are certified. A concrete universal gate implementation is sufficient; arbitrary real coefficients need not fit in classical memory. Preserve a certificate and complete program for every entry, including unused ones.

Use fresh fixed-dimension stock with degenerate storage Hamiltonians for intermediate flags, arithmetic, ROM and garbage; the stock's actual input charge and supplied blank-nats are nevertheless paid. Final measurement is not needed: copying a basis label into a retained pointer gives the relevant outcome law. Nothing is erased. Register a finite grid of rational logratio approximants $\hat{\ell}$ with $|\hat{\ell}-\ell|\le b<1/2$; then $B+\hat{\ell}\ge 1/2$ for every outcome/pair. The actual final adaptation battery is $E_0(B+\hat{\ell})/h$. The actual final risk battery uses the selected rational $m$ and physical coefficient $E_0 A/(1+b_{\mathrm{util}})$; the same-task utility has price $b_{\mathrm{util}}>0$, giving effective coefficient $A$. Here $b_{\mathrm{util}}$ and battery approximation $b$ are distinct constants.

Let $t_{X}$ uniformly bound the TV distance of the actual digital survival flag from $\mathrm{Bern}(p(r))$, and $t_{Y}$ the TV distance of the actual digital old-source label from $\mu_{q}$. TV means $\sup_{\mathrm{events}}|P-Q|$. Then, after removing only the genuinely common $B/h$ and reservation/utility constants, the actual expected scalarized cost $\hat{J}$ obeys

  $$
  |\hat{J}_q(r,m)-J_q(r,m)|\le e_{\mathrm{phys}}:=A t_{X}+(2L t_Y+b)/h.
  \tag{1}
  $$

Proof: squared loss lies in [0,1]; ell lies in [−L,L]; coefficient approximation contributes at most b. These bounds are uniform in old/new/forecast. Any additional coefficient calibration error is added to $e_{\mathrm{phys}}$. Telescoping operator-norm gate errors imply trace-distance and hence these TV bounds; paid stock errors are included in the same telescope. Choose all tolerances after A,L,h and the full gate count are fixed. Normalized finite-source exact formulas and actual finite digital formulas remain distinct.

##### D.8.6i.24 3. Finite interval compilation

For every $q\in C$ and $a\in C\times M$, evaluate the expectation of the actual finite implemented circuit and its actual batteries to certified interval radius $\varepsilon$. This is finite matrix arithmetic on known matrices and known incoming states: multiply matrices, take finite traces, and evaluate the computable gate functions with interval remainder bounds. No physical trial output is supplied to this calculation. Uniform positive denominators and a priori precision bounds make it terminate. It can be exponentially expensive.

Choose the smallest midpoint with fixed index tie breaking. Strict separation of minimizers is unnecessary. Store the entire table $q\mapsto(r(q),m(q))$, every evaluated interval, gate/pulse table and all compilation records. Reversible Boolean arithmetic with retained history implements the finite computation; pad to the maximum declared operation count. Alternatively the full catalog is generated in a completely paid pre-observation preparation stage and its completed actual inventory is frozen before any initial/path comparison. The whole catalog is charged, not only its visited entries.

For each old q the selector satisfies exactly

$$
\hat J_q(\text{selected}) \le \min_{C\times M} \hat J_q + 2\varepsilon,
\tag{2}
$$

$$
J_q(\text{selected}) \le \min_{C\times M} J_q + 2\varepsilon+2e_{\mathrm{phys}}.
\tag{3}
$$

The objective is the expected PCE charge; a single run need not realize its expectation. No calibration run is used; adding one adds its charged batteries and stock to the ledger.

If $C$ is a $\zeta$-cover of the comparison domain and $j_{q}$ has a uniform Lipschitz bound $L_{h}$ there, while $M$ is a $\nu$-cover of $[0,1]$, completing the square yields

$$
\begin{aligned}
J_q(\text{selected}) - \min_{r\in Q} j_q(r) \\
&\le E := 2\varepsilon+2e_{\mathrm{phys}}+L_h \zeta+A \nu^{2}.
\end{aligned}
\tag{4}
$$

The baseline B/h remains charged and is not part of the error. If the continuous minimizer r* is interior and $j_{q}$ is c/h strongly convex on a convex neighborhood containing selected r and r*, then

  $$
  |r-r^*|\le\sqrt{2h E/c}.
  \tag{5}
  $$

Indeed $j_q(r)\le J_q(r,m)$ and strong convexity gives the quadratic lower bound. To guarantee that this neighborhood contains the selected $r$, use a positive uniform objective gap outside it (section 7) and choose $E$ smaller than that gap; a local Hessian bound controls only a neighborhood. To obtain step error $\le h\eta$, choose $E\le c h\eta^{2}/2$. Forecast optimality contributes the exact nonnegative $A(m-p(r))^{2}$ and cannot defeat this estimate.

A concrete tolerance allocation (for $c,\eta>0$) is $\varepsilon\le c h\eta^{2}/16$, $e_{\mathrm{phys}}\le c h\eta^{2}/16$, $L_h\zeta\le c h\eta^{2}/8$ and $A\nu^{2}\le c h\eta^{2}/8$; then $E\le c h\eta^{2}/2$. Given the target $e_{\mathrm{phys}}=e$, enforce $t_X\le e/(3A)$, $t_Y\le he/(6L)$ when $L>0$, and $b\le\min(1/4,he/3)$. For $L=0$ the $t_{Y}$ term vanishes. Certified finite arithmetic and gate approximations achieve each positive tolerance; their potentially extreme costs are retained. Also shrink $E$ below the off-neighborhood gap before using (5). This is a finite dependency order of the tolerances.

##### D.8.6i.25 4. Physical clock and occurrence schedule

Pre-observation: supply qualified host, all K online blocks, complete ROM/compilation/certificates and all retained startup records. Charge actual host tick and all startup input/time/clock/precision/link costs. Its duration $T_{\mathrm{start}}$ is a separate ledger entry. Physical evolution is compared on [0,Kt0h] after startup, and $T_{\mathrm{start}}$ stays in the lifecycle time.

For each step use a fixed padded sequence: (1) copy old basis-controller label and ROM lookup; (2) prepare the private old site/Gibbs source while old geometry is registered; (3) commit forecast and selected new label; (4) perform paid metric switch; (5) prepare new prescribed ground state; (6) execute new survival dilation; (7) copy/retain flags as required, ramp both final batteries, and route to fresh archives. Old-law samples are never regenerated with the new metric. All previous controller/source/solver/failure histories survive. Neither run battery is subsequently inverted or reset. The retained actual host update f1 controls a nontrivial label permutation and inverse decoder on each source record, with all calibration outcomes retained. Theorem O.7.2.3m, sections 4–5, executes the H.8 calibration of its host once and uses that snapshot for all subsequent source tables and coherent tick blocks. Its paid factory occurs before $t=0$, and its ticks permit shorter subwindows with stronger paid pulses, so this supplier needs no fresh fixed-duration qualification tick per step. Any other external service carries its own schedule.

There are $S$ finite stages (including routing/switches), padded to the same $S$ for all catalog inputs. Allocate each a fixed positive duration $\sigma=t_0h/S$, subdividing if necessary. Exposure $\tau$ is a dimensionless coefficient in the survival rotation; the rotation runs for its allocated duration $\sigma$, which avoids a $C$-versus-step hierarchy cycle.

For a finite gate $U=e^{-iK}$, $\lVert K\rVert\le\pi$, use $H(t)=\hbar K\rho(t/\sigma)/\sigma$ with $\rho(s)=30s^{2}(1-s)^{2}$. Its integral is one, endpoints and first endpoint derivatives vanish, and it implements $U$ exactly. Peak $\le 15\pi\hbar/(8\sigma)$, derivative $\le 60\pi\hbar/\sigma^{2}$ (safe explicit bound), and zero endpoint storage means total closed enlarged-system net work is zero. Actual temporary work, peak/action/precision reservation, fresh stock and clock prices are charged. Finite approximate gates use their actual generators in this statement. Battery ramps retain positive final charge; they are not zero-endpoint gates.

###### D.8.6i.26 Speed-compatible refinement of the schedule

Equal slots suffice for the endpoint/selector statements but not for the speed and dissipation statements. If the entire metric change occurs in fraction $\theta$ of a step, its quadratic action is inflated by at least $1/\theta$. Therefore the following finite paid schedule is used when comparing actual controller speed. Pick a finite grade-dependent $a\in(0,1/4)$, tending to zero only along the intended refinement. Compress all non-switch stages into initial/final subwindows of total duration $a t_0h$ (each retains its positive allotted duration); old source preparation and commitment occur first, new source preparation and batteries last. Keep the actual metric-controller interpolation in the middle interval of length $(1-a)t_0h$.

Take a smooth nonnegative speed profile $v_{a}$ on $[0,1]$, zero near endpoints, integral one, and $\int v_a^{2}=1+O(a)$, with $v_{a}$ constant except on two boundary layers of width $O(a)$. Such profiles follow by smoothing a clipped constant and normalizing; their derivative bounds are finite $O(a^{-1})$, explicitly part of the controller precision/power envelope. Write $q(t)=q+\chi_a(s)(r-q)$, $\chi_a'=v_a$, during that middle interval, and hold $q$/$r$ in the initial/final intervals. Then the Euclidean controller action is exactly

$$
\begin{aligned}
\int_{\mathrm{step}} |dq/dt|^{2}\, dt &= |r-q|^{2}/(t_0h) \cdot \Bigl[\int v_a^{2}/(1-a)\Bigr] \\
&= |r-q|^{2}/(t_0h) \cdot (1+O(a)).
\end{aligned}
$$

For a smooth finite-grade positive tensor $G$, its value along an $O(h)$ update differs from $G(q)$ by $O(h)$, giving the analogous relative/absolute controlled tensor-action error at fixed grade. Thus the physical schedule does not introduce a nonvanishing speed factor. This statement is finite-grade calculus; the dimension-uniform estimates are those of Technical Appendix C. Peak controls/derivatives increase as $a$ shrinks and are paid. The pulse exposure is independent of the pulse duration. The metric path stays in the admitted convex controller chart; otherwise supply a certified chart path and its action estimate.

Serial routing is already included in $S$. Any fixed non-compressible propagation delay, stock-supplier latency, required new qualification tick or autonomous-control limitation must instead be explicitly added to the schedule. If such a latency $\ell>0$ is required inside every step, then $t_0h\ge\ell$ and the source cannot realize a physical-time $h\to 0$ sequence; pre-supplying stock does not shorten a newly required service. The clock statement therefore holds for the admitted externally driven finite-operation services with advance stock, and the host participation it uses is the one proved in Theorem O.7.2.3m.

##### D.8.6i.27 5. Paid horizon ledger, no path-dependent baseline

For the full catalog and K-step prefix freeze dimensions, all supplied blanks/purifiers, full ROM and compilation registers, every stock-preparation/provider service, S slots per step, all routes, hold/archive duration, controller/precision fields, and maximum generator/battery/ramp envelopes. Price them as the positive reservation service of Lemma F.1c.5, section 5.1, and actually load the corresponding fixed completion records. Precompute upper bounds over the entire finite catalog and every reachable old/new pair; it is finite enumeration. Common initial stock is supplied before any path and candidate selection. All outputs occupy distinct retained slots through the common horizon. Later service/disposal is outside this finite contract unless explicitly added.

With risk utility as above, the physical scalarized expected step invoice is

$$
(t_0 h/E_0) V_{\mathrm{step}}(q,a)=C_{\mathrm{step}} + B/h + \hat J_q(a),
\tag{6}
$$

where $C_{\mathrm{step}}$ consists of the genuinely fixed positive reserve charges and declared fixed utility offset, in units $E_0$. Physical stored charges themselves are nonnegative; utility is a price, not a battery refund. Full lifecycle additionally includes actual startup charge $C_{\mathrm{start}}$ and duration $T_{\mathrm{start}}$. The same fixed grade/horizon constant applies to every compared path. Summing $K$ performed steps retains $KB/h$, $K$ fixed stocks, archives and the actual variable charges. Apparatus constants can diverge arbitrarily fast with grade, $h^{-1}$ and precision; they stay in the absolute invoice.

If stopping is allowed, either compare a separately declared fixed prefix length, or execute the same allocated padded stock/reservation blocks to its end and retain stop flags. Charges of unperformed source runs are not subtracted. Equation (6) applies to each performed run; stopped paths require a separately named controller rule.

##### D.8.6i.28 6. Failure and postprocessing types

The deterministic finite arithmetic/selector has failure probability zero in the specified ideal finite-gate model; uncertainty is its certified interval width. Digital source approximations are bounded by (1), unconditionally. All stochastic source outcomes including rare ones stay in the archive and battery calculation.

If an additional physical-fault model supplies per-step probability $\rho$, retain every fault flag and specify a safe finite catalog fallback. Across $K$ steps, probability of any fault is $\le K\rho$ without independence. With objective oscillation bounded by $R_{J}$, unconditional excess is bounded by the good-event bound plus $\rho R_J$ for each step (or $K\rho$ times the nominated horizon bound). Reliability bounds require such a supplied fault model; the invoice is never conditioned on success.

A uniformly computable finite-catalog diffeomorphism/retraction program may be appended with its own padded gates/stock/tolerance and records. Retain both the raw minimizing r and the processed $\bar{r}$. Equations (2)–(5) concern the raw minimizing run. Replacing it by $\bar{r}$ uses the source covariance of Part II, section 11, or the explicit objective and response defect bounds of Technical Appendix B, since finite catalogs are in general not exactly diffeomorphism invariant. Slopes are those of the smooth finite-grade source; a finite catalog has no infinitesimal slope.

#### D.8.6i.29 Part IV. Precisely registered compensated update and common refinement

##### D.8.6i.30 1. Paid source algorithm

The raw step minimizes the actual joined expected PCE invoice of Part I: fresh-new spectral prediction risk plus old-law covariance logratio adaptation charge. Part III computes this comparison without observing future trial outcomes, retains the raw minimizer run and pays every candidate/solver entry. All ground states, covariance laws and apparatus programmes are fixed by the supplied geometric controller; they are not free variables of the minimization.

After the raw normal-controller step $Q_{\mathrm{raw}}$, compute the source scalar $b_n=-e_C'(\lambda_m)>0$ and the actual finite ground field $f_m=-2\log u_m$. With the independently fixed DeTurck reference metric $b$, define

$$
X_n = b_n(\nabla f_m + W(g,b)), \qquad g = \exp Q_{\mathrm{raw}}.
$$

This is a registered gauge convention; it adds no force or utility tariff. The extra stage is a paid deterministic source representation change followed by a deliberately approximate chart retraction. Source matrices, nodes, basis, coframes, covector alphabets, actual graph paths/timers and complete record labels are simultaneously transported by the explicit isomorphism of Part II.

For a fully explicit torus implementation one may use $\phi_h(y)=y+h X_n(y)$, with $h\lVert DX_n\rVert_\infty<1/2$. Its periodic lift has a unique inverse by contraction $y=x-hX_n(y)$, so it is a global degree-one smooth diffeomorphism. The exact flow of $X_{n}$ may also be used. Both have the same first derivative $\mathrm{Lie}_X g$ and differ only by a fixed-grade $O(h^{2})$ local defect, which is retained in the temporal tolerance. No exact numerical-flow oracle is required.

Let $\tilde{Q}=\log(\phi_h^*\exp Q_{\mathrm{raw}})$. With $J_Q=D\exp_Q$ and the actual source tensor metric pulled back to log coordinates, $A_Q(v,w)=G_{\mathrm{sensor}}(J_Qv,J_Qw)$, set

$$
Q_{\mathrm{next}} = Q_{\mathrm{raw}} + P_n^{A_{Q_{\mathrm{raw}}}}(\tilde{Q} - Q_{\mathrm{raw}}).
$$

This weighted projection is part of the paid controller table and approximates the diffeomorphism, with the error estimated in Technical Appendix B. Retain both transported raw source and rebuilt fixed-chart source and their difference. Numerical retraction errors have their explicit uniform norm budgets. Ideal ground-metric versus categorical projection discrepancies are included in $\epsilon_{n}$. All source recomputation and chart records use the full candidate-wide fixed schedule and actual duty loads of Parts I/III, so they introduce no unpriced candidate-dependent objective term.

The raw source trial precedes this postprocessing, and its charged battery is the one recorded. The new state energy is the same independently specified static source functional evaluated at $Q_{\mathrm{next}}$. The difference from the raw-stage energy is controlled by the finite gauge/retraction energy-defect identity in the analytical appendix. An extra diagnostic run, if executed, adds its own charge.

##### D.8.6i.31 2. Physical schedule and corrected speed

Use the serial speed-compatible schedule of Part III, not its preliminary equal-slot endpoint schedule. Raw gradient deformation occupies fraction $1-a_n$ of each physical step with a nearly constant smooth speed profile. The remaining source/computation/gauge/retraction operations occupy positive subwindows totaling $a_n\to 0$, with all generator/derivative/precision/rated-duty envelopes paid. Spectral $\tau$ is dimensionless exposure in the finite endpoint instrument and imposes no minimum physical pulse duration.

During the exact coordinate gauge stage record the actual time-dependent vector field: for $\phi_\theta(y)=y+\theta(t)hX_n(y)$, the old-coordinate Eulerian field is $V_t=\dot{\phi}_\theta$ composed with $\phi_\theta^{-1}$, while the current pulled-back metric uses $Z_t=\phi_\theta^*V_t=(D\phi_\theta)^{-1}\dot{\phi}_\theta=(I+\theta h\,DX_n)^{-1}\theta'(t)hX_n(y)$. Record this current field $Z_{t}$, zero outside the gauge stage. The primary action extractor is $\dot{g}-\mathrm{Lie}_{Z_t}g$, with the separate finite retraction defect retained. This is the field of the fast actual gauge stage; total coordinate speed and physical gauge-actuator costs are recorded and charged.

If $e_{n}$ bounds the horizontal retraction/projection error per unit step, choose $a_n\to 0$ with $e_n^{2}/a_n\to 0$, and make the numerical/time defects satisfy the same condition. The actual retraction action is bounded by $C_T e_n^{2}/a_n$ and cross-action errors by $C_T e_n/\sqrt{a_n}$. This, together with the raw deformation profile, gives the corrected-action limit.

##### D.8.6i.32 3. One noncircular complete sequence

Fix the declared a priori regular-window bounds and integer s. The analytic tame continuation proof supplies a grade-independent high-norm bound B from those bounds, initial data and a chosen residual envelope, before selecting finite outcomes. The compiler domain is the entire corresponding elliptic Sobolev controller ball; the solution-centered tube used in the proof is a comparison and continuation device.

1. Choose full log-metric Fourier cutoff $n$ and the compact controller ball of radius $B+1$ with ellipticity margin. Every fixed smooth perturbation is represented by its Fourier approximants; no homothetic/trace restriction is introduced.
2. Choose the scalar cutoff $m(n)$, matrix quadrature and their first/second parameter-jet precision to make the off-shell residual, mass map and compensated vector errors $\le\epsilon_n$ in the norm-typed list in the appendix. Ground positivity/gap are certified before the grade is admitted.
3. Refine covector box/grid and spatial source quadrature after $n$ and $m$, so the mass matrix and its required mixed/parameter operators are uniformly close, not only fixed-test entries. Include the actual graph/volume/response mesh on these same supplied controls, with its separate consistency bounds.
4. Choose the grade-wide hazard shift $C_{n}$ above twice the complete operator norm and tending to infinity, e.g. at least $\epsilon_n^{-1}$. Fix its positive meter scale and full divergent baseline/inventory now. No later physical $\tau$-duration constraint is added.
5. Choose $a_{n}$ from the spatial gauge/retraction defects. Then, with all spatial/source choices frozen, choose $h_{n}$, the finite catalog, precision and solver/gauge/retraction errors small enough for the fixed-grade time comparison and $e_n^{2}/a_n$ corrected-action requirement. Fixed-grade exponential Gronwall constants are used only here; spatial convergence uses the uniform parabolic estimate.
6. Compile and pay the whole candidate/transition/postprocessing catalog and whole horizon, including all inactive rated-duty padding, input stock and source/clock records, before any finite observed outcome. Execute the actual finite approximation with the selector error bounds of Part III. Preserve normal-smooth finite-source versus discrete-digital-path typing.

All finite steps are effective when the initial finite controller and bounds have effective supplied names; the exact normal-interface statement uses real coefficients through their finite-precision approximation path. Source-access and finite-precision approximation obligations remain exactly as in the admitted normal-controller branch.

#### D.8.6i.33 Part V. Complete analytic estimates for the source and compensated programme

##### D.8.6i.34 Technical Appendix A: spectral stress, hazard and covariance source estimates

##### D.8.6i.35 1. Reference discretization, without product-round or trace restriction

Fix any connected compact smooth manifold $M$ without boundary, dimension $d$, and a smooth reference metric $b$. Choose a real orthonormal eigenbasis of the reference scalar Laplacian for scalar functions and of a positive reference connection Laplacian on $\mathrm{Sym}^{2}T^*M$ for symmetric tensors. The reference choice is fixed before candidate comparison. On a torus these are ordinary real Fourier modes and symmetric matrix components. On general $M$ they supply equally finite matrix definitions using a fixed finite atlas and partition of unity.

Let $V_{n}$ be the tensor span through reference frequency $n$, and let $g=b+v$, $v\in V_n$. No determinant, conformal, homothetic or symmetry restriction is imposed. Every smooth metric and every smooth symmetric perturbation has approximants in these charts. Positivity is imposed by $\alpha b\le g\le\beta b$. Restrict temporarily to a regular compact domain $K$, precompact in $C^s$ for $s>d/2+8$, with a fixed bound in a stronger smooth norm when an explicit spectral rate is used. All constants below are uniform on $K$ or a declared regular neighborhood. That the finite trajectories stay in the compact domain is proved in Technical Appendix C.

Use an independent scalar cutoff $m=m(n)$. For a fixed scalar basis $\psi_1,\dots,\psi_M$ define exact matrices

$$
\begin{aligned}
W_{ab}(g)&=\int \psi_a \psi_b\, dV_g, \\
A_{ab}(g)&=\int [4\langle d\psi_a,d\psi_b\rangle_g+R_g \psi_a\psi_b]\,dV_g.
\end{aligned}
$$

$W$ is positive; $A$ is real symmetric. Set $H_m=W^{-1/2} A W^{-1/2}$. Its lowest normalized eigenvector yields $u_m=\sum c_a\psi_a$ with $\int u_m^{2}dV_g=1$ and eigenvalue $\lambda_{m}$. These are finite geometric Schrödinger matrices. Curvature is computed from the actual metric controller through its first/second spatial jets. Matrix entries can be integrated to specified precision by a separate quadrature; those matrix/derivative errors belong to $\varepsilon_{m}$ below. Exact real matrix entries define the ideal finite source; a finite-precision source needs the stated approximation ledger.

On compact $K$ the true operator $H_g=-4\Delta_g+R_g$ has a simple positive normalized ground state $u_{g}$. Connectedness is essential. Uniform ellipticity, compactness and continuity give a uniform positive ground spectral gap $\gamma$, a positive lower bound $u_g\ge c$, and uniform elliptic regularity bounds. Smooth Ritz approximation then gives uniformly, for sufficiently large $m$,

 $$
 \begin{gathered}
 |\lambda_m-\lambda|+\lVert u_m-u\rVert_{C^{2}}+\lVert r_m\rVert_{L^{2}}\le\varepsilon_m\to 0, \\
 r_m=(-4\Delta_g+R_g-\lambda_m)u_m.
 \end{gathered}
 \tag{1}
 $$

In particular $u_m>c/2$, although a raw Galerkin ground eigenfunction is not automatically positive at every finite cutoff. Only these sufficiently fine grades are admitted. One proof of (1) combines the variational $H^1$ eigenfunction estimate with the uniform gap, smooth reference projection error, and reference spectral inverse estimates to upgrade the projected error to $H^k$, $k>d/2+2$. With regularity order $S$ sufficiently large this yields $\varepsilon_m\le C m^{-p}$ for a positive $p$ determined by $S,d,k$. For a compact $C^\infty$ family the rate is faster than any prescribed power, with constants depending on the corresponding norm. The exponent $p$ depends on the regularity order. $C^{2}$ parameter-jet convergence on bounded $C^s$ perturbations follows by differentiating the finite/continuum resolvent on the $\gamma$-separated ground complement; the same approximation argument applies to each first/second derivative equation. These statements are not uniform over unit $L^{2}$ perturbations of the operator coefficients; the next identity supplies that derivative estimate.

##### D.8.6i.36 2. Exact off-shell first variation and dual-norm control

For any smooth covariant metric direction h, with the scalar Galerkin subspace kept fixed, Hellmann–Feynman gives

$$
\begin{aligned}
D\lambda_m[h]&=\int \langle T_m,h\rangle_g\, dV_g, \\
T_m&=-u_m^{2}(\mathrm{Ric}_g+\mathrm{Hess}_g f_m)+(1/2)u_m r_m g, \\
f_m&=-2\log u_m.
\end{aligned}
\tag{2}
$$

This is exact, including the mass matrix derivative, for the Galerkin eigenfunction, which solves the differential eigen-equation only up to the residual $r_{m}$.

Proof: differentiate $A-\lambda_mW$ at the normalized eigenvector; its coefficient derivative cancels. The gradient term contributes $-4du_m\otimes du_m$. The scalar-curvature variation, after two integrations by parts on the closed manifold, contributes $-u_m^{2}\mathrm{Ric}+\mathrm{Hess}(u_m^{2})-\Delta(u_m^{2})g$. The volume and normalization terms contribute $(1/2)(4|du_m|^{2}+(R-\lambda_m)u_m^{2})g$. The non-trace terms combine into $-u_m^{2}(\mathrm{Ric}+\mathrm{Hess}\,f_m)$; the trace coefficient is $-2u_m\Delta u_m+(1/2)(R-\lambda_m)u_m^{2}=(1/2)u_mr_m$. This proves (2).

For the true ground $r=0$, so $T=-u^{2}(\mathrm{Ric}+\mathrm{Hess}\,f)$. Equation (1) and the regular bounds imply

 $$
 |D\lambda_m[h]-D\lambda[h]|\le C\varepsilon_m\lVert h\rVert_{L^{2}(b)}
 \tag{3}
 $$

for every h, including high-frequency directions and directions with unbounded derivatives. Thus this estimate is also uniform on $V_{n}$, even when m and n differ. The norm equivalence constants are uniform.

The limit tensor metric is

$$
G_g(h,k)=(1/2)\int \langle h,k\rangle_g u_g^{2}\,dV_g.
$$

For $E=-\lambda$ its negative gradient is $F(g)=-2(\mathrm{Ric}+\mathrm{Hess}\,f)$. Equation (2) gives the corresponding finite residual stress explicitly.

##### D.8.6i.37 3. Hazard-energy error, including its actual coefficient

Fix $0<a_0<\log 2$, $q_0=\exp(-a_0)$, $\tau=a_0/C$ and

$$
\begin{aligned}
E_{\mathrm{bat}}&=[\tau q_0(2q_0-1)]^{-1}, \\
e_C(x)&=E_{\mathrm{bat}}[q_0 \exp(\tau x)-q_0^{2}\exp(2\tau x)-q_0+q_0^{2}].
\end{aligned}
$$

The last two terms subtract only the x-independent baseline. Then

$$
\begin{aligned}
e_C(0)&=0,\quad e_C'(0)=-1, \\
\sup_{|x|\le L} \{|e_C(x)+x|+|e_C'(x)+1|+|e_C''(x)|\}&\le K_{a_0,L}/C.
\end{aligned}
\tag{4}
$$

Indeed $e_C'=[q_0e^{\tau x}-2q_0^{2}e^{2\tau x}]/[q_0(2q_0-1)]$ and its next derivative is $O(\tau)$. Taylor's theorem proves (4). Take $C$ above the entire operator norm of $H_{m}$ over the admitted family, not just above $\lambda_{m}$, and let $C\to\infty$. Then the hazard is positive and its Bernoulli probability is below $1/2$ eventually, uniformly. Since $\lambda_{m}$ is uniformly bounded even though $\lVert H_m\rVert$ grows, the constants in (4) are independent of its excited-state cutoff.

For $E_{nm}=e_C(\lambda_m)$, (1)–(4) imply

 $$
 \begin{gathered}
 |E_{nm}+\lambda|\le C(\varepsilon_m+C^{-1}), \\
 \lVert DE_{nm}-D(-\lambda)\rVert_{L^{2}\,\text{dual}}\le C(\varepsilon_m+C^{-1}).
 \end{gathered}
 \tag{5}
 $$

The stronger $C^{2}$ parameter statement holds on fixed bounded smooth perturbation sets if the differentiated spectral estimates above are included. The slopes are controlled by (2) without it. Parts I and III retain every other invoice; their globally uniform $B$ offset is distinguished from the old-source entropy inside the actual transition battery.

##### D.8.6i.38 4. Complete finite covariance sensor and its tensor metric

At fixed quadrature locations $x_{j}$, use fixed local $b$-orthonormal frames and the actual finite alphabet $Z_{R,a}=[-R,R]^d\cap a\mathbb{Z}^d$ with

$$
P_g(z|j)=Z_j(g)^{-1}\exp[-(1/2)z^{\mathsf T}g(x_j)^{-1}z].
$$

This is a directly prepared complete finite Gibbs source, with no overflow outcome.

Use positive spatial quadrature coefficients $a_{j}$ and frozen old-state weights

$$
w_j(g)=a_j u_m(x_j)^{2}(dV_g/db)(x_j) \Big/ \sum_l a_l u_m(x_l)^{2}(dV_g/db)(x_l).
$$

For an atlas, include the fixed partition-of-unity factors in $a_{j}$ and use the corresponding frame at each label. Define the actual transition divergence

$$
D_g(g')=\sum_j w_j(g)\, \mathrm{KL}(P_g(\cdot|j)\Vert P_{g'}(\cdot|j)).
$$

Only the second argument varies within the comparison. At equality its exact Hessian is

$$
\begin{aligned}
G_N(h,k)=(1/4)\sum_j w_j \operatorname{Cov}_P(&z^{\mathsf T}g^{-1}h\, g^{-1}z, \\
&z^{\mathsf T}g^{-1}k\, g^{-1}z).
\end{aligned}
\tag{6}
$$

All partition derivatives are included in the covariance. Gaussian fourth moments give the limit $(1/2)\operatorname{tr}(g^{-1}h g^{-1}k)$. Uniform polynomial-times-Gaussian tail estimates and ordinary grid quadrature give convergence of the local second and third parameter jets on $\alpha I\le g\le\beta I$. The spatial quadrature is refined after selecting $V_{n}$, so that its error is small in bilinear operator norm on $V_{n}$. Convergence on fixed test functions would not suffice. Finite-dimensional norm equivalence/inverse bounds give an explicit finite tolerance criterion; choose spatial mesh sufficiently small that the maximum matrix-entry error times $\dim(V_n)$ is $\le\eta_N$ in a reference $L^{2}$-orthonormal basis. This is expensive but finite, and it controls the high-frequency quadrature error.

With independently refined R,a, spatial quadrature and m,

 $$
 \begin{gathered}
 |G_N(h,k)-G_g(h,k)|\le\eta_N\lVert h\rVert_{L^{2}}\lVert k\rVert_{L^{2}}, \\
 c\lVert h\rVert_{L^{2}}^{2}\le G_N(h,h)\le C\lVert h\rVert_{L^{2}}^{2}.
 \end{gathered}
 \tag{7}
 $$

The positive finite source permits the uniform outcome logratio offset $B=1+dR^{2}(1/\alpha-1/\beta)$; it must remain paid. With a sufficiently rich grid (0, coordinate directions, and pair sums suffice for identifiability) and a spatially unisolvent quadrature, $D_g(g')$ separates the metric controllers. Uniform local coercivity follows from (7); global $D\ge c\lVert g'-g\rVert^{2}$ on a compact pair domain follows from local coercivity plus compactness/identifiability. A uniform-in-$n$ version may instead be obtained by the local matrix Gaussian KL lower bound and spatial norm quadrature on $V_{n}$; its finite-sensor perturbation is then uniformly relative, not only additive near the diagonal.

##### D.8.6i.39 5. Slopes on the full retained controller space

Let $P_n^g$ denote $G_g$-orthogonal projection to $V_{n}$ and let $F_N=-G_N^{-1}DE_{nm}$. From (5)–(7),

 $$
 \lVert F_N-P_n^g F(g)\rVert_{L^{2}}\le C(\varepsilon_m+C^{-1}+\eta_N).
 $$

Let $a_n=\sup_{g\in K\cap(b+V_n)}\inf_{v\in V_n}\lVert F(g)-v\rVert_{L^{2}}$. Compact regularity makes $a_n\to 0$; a reference Sobolev bound of order $r$ gives $a_n\le C n^{-r}$. Set

$$
\delta_N=\varepsilon_m+C^{-1}+\eta_N+a_n.
$$

Then uniformly on the regular controller domain,

 $$
 \begin{gathered}
 \lVert F_N-F(g)\rVert_{L^{2}}\le C\delta_N, \\
 \bigl||\partial E_N|_{G_N}^{2}-\lVert F(g)\rVert_{G_g}^{2}\bigr|\le C\delta_N.
 \end{gathered}
 \tag{8}
 $$

The second line uses the exact finite smooth slope identity $|\partial E_N|^{2}=DE_N G_N^{-1}DE_N$. Equations (5),(8) prove energy and slope convergence for arbitrary retained perturbations. Local $\Gamma$ convergence follows as a weaker consequence on this compact regular topology. Equicoercivity is local, on this compact regular topology.

##### D.8.6i.40 6. Actual KL minimizer step and its error

For each finite grade use

$$
g_{k+1}\in \operatorname{argmin}_{g'} [E_N(g')+D_{g_k}(g')/h].
\tag{9}
$$

Suppose the selected minimizers and their straight segment interpolations remain in a declared regular compact neighborhood, are interior relative to $V_{n}$, and the comparison domain supports a uniform coercivity bound $D\ge c\lVert g'-g\rVert^{2}$ and an $L^{2}$-Lipschitz energy bound $|E_N(g')-E_N(g)|\le L\lVert g'-g\rVert$. The latter follows from (2) on regular convex segments; it is not valid on an arbitrary nonconvex set without a path control. Comparison with $g'=g_k$ gives

 $$
 \lVert g_{k+1}-g_k\rVert_{L^{2}}\le(L/c)h.
 \tag{10}
 $$

At an interior exact minimizer,

$$
DE_N(g_{k+1})+(1/h)D_2 D_{g_k}(g_{k+1})=0.
\tag{11}
$$

Let $L_{N}$ be a bound for the energy Hessian in $L^{2}$ coordinates on this finite domain and $M_{N}$ a corresponding third-derivative bound for $D$. Both are finite; they need not be uniform in $n$. Taylor expansion in (11), using (10), yields for $v_k=(g_{k+1}-g_k)/h$,

 $$
 \lVert v_k-F_N(g_k)\rVert_{L^{2}}\le C h(L_N+M_N).
 \tag{12}
 $$

Choose $h_{N}$ so that $h_N(L_N+M_N)\to 0$. This is possible by a diagonal choice, and the physical source clock implements this $h_{N}$ (Part III, section 4). A solver with first-order residual $\zeta_{N}$ adds $C\zeta_N$ to (12). A solver objective-value error alone is not the same residual; on the locally strongly convex step objective it gives a distance error $O(\sqrt{h\varepsilon_{\mathrm{obj}}})$ and velocity error $O(\sqrt{\varepsilon_{\mathrm{obj}}/h})$, so $\varepsilon_{\mathrm{obj}}=o(h)$ is necessary in that bound and sharper accumulated tolerances may be required for other norms. Part III uses local strong convexity together with the off-neighborhood gap and the explicit actual-circuit selector error to select this branch.

With $\theta_N=\delta_N+h_N(L_N+M_N)+\zeta_N$, the piecewise-linear trajectory obeys

 $$
 \lVert g_N'-F(g_N)\rVert_{L^\infty_t L^{2}_x}\le C\theta_N,
 \tag{13}
 $$

provided also $h_{N}$ times the finite-space modulus of continuity of $F$ and $G$ on the segments tends to zero. Such finite constants may be absorbed into $L_N+M_N$ by increasing it. This vector equation is extracted directly from the actual frozen-old-source KL step.

Taylor expansion of the endpoint energy and (11) gives, with the same finite step remainder controls,

 $$
 |E_N(g_K)-E_N(g_0)+\sum_k h\lVert v_k\rVert_{G_N(g_k)}^{2}|\le CT\theta_N.
 \tag{14}
 $$

Similarly the action sum and slope sum differ by at most $CT\theta_N$. Exact minimization alone gives only the familiar inequality with $D/h\approx(h/2)\lVert v\rVert^{2}$; the factor of two is recovered by the stationarity/Taylor argument.

##### D.8.6i.41 Technical Appendix B: compensation, retraction and gauge-corrected action

##### D.8.6i.42 A. Exact compensated vector and eigen residual

Use the scalar Galerkin eigenpair $(\lambda_m,u_m)$, $r_m=(-4\Delta+R-\lambda_m)u_m$, $f_m=-2\log u_m$. Let

$$
\begin{aligned}
G_m(h,k)&=.5\int u_m^{2}\langle h,k\rangle_g\, dV_g, \\
E_N&=e_C(\lambda_m),\quad b_N=-e_C'(\lambda_m)>0.
\end{aligned}
$$

On the finite metric tangent space, the exact ideal-mobility vector is

$$
F_N=b_N P_n^{G_m}[-2(\mathrm{Ric}+\mathrm{Hess}\, f_m)+(r_m/u_m)g].
\tag{A1}
$$

Here $P_{n}$ denotes the weighted tangent projection onto the finite chart. This follows directly from the exact off-shell stress identity in Technical Appendix A. For sufficiently large $C$, $b_{N}$ lies in $[1/2,2]$ and $b_N-1=O(C^{-1})$, with bounded smooth parameter derivatives on the admitted domain.

Let $W(g,b)$ be the DeTurck vector in the sign convention

$$
F_{\mathrm{DT}}(g)=-2\mathrm{Ric}_g+\mathrm{Lie}_W g,
$$

whose principal symbol in a fixed reference chart is $g^{ab}\partial_a\partial_b g$. Define the gauge field

$$
X_N=b_N(\nabla f_m+W).
$$

Because $b_{N}$ is a spatially constant scalar for each metric,

$$
\begin{aligned}
F_N+P_n^{G_m}\mathrm{Lie}_{X_N}g \\
&=b_N P_n^{G_m}[F_{\mathrm{DT}}(g)+(r_m/u_m)g].
\end{aligned}
\tag{A2}
$$

Thus the Hessian of the ground density cancels exactly, before any estimate, and $b_{N}$ is kept at finite resolution. A categorical/quadrature mobility $G_{\mathrm{sensor}}$ approximating $G_{m}$ adds an explicit vector error. Since each metric controller space is finite-dimensional, sensor precision and scalar oversampling can be selected so the error and needed parameter jets are arbitrarily small in the retained Sobolev operator norms, after paying the corresponding costs.

##### D.8.6i.43 B. Actual finite-stage realization of that vector

On the material torus use the source's $Q\in V_n$, $g=\exp Q$, with full symmetric log-metric modes. Let $A_m(Q)$ be the pullback of $G_{m}$ through $D\exp_Q$. It is a positive weighted $L^{2}$ metric. For a general compact manifold replace Fourier modes by fixed background tensor eigensections and $\exp$ by the fibrewise $b$-relative exponential.

One finite step is:

1. Run the actual KL minimizer/certified finite catalog controller to obtain $Q_{\mathrm{raw}}$, retaining its raw task outcome and source invoice.
2. Compute $X_{N}$ from $Q_{\mathrm{raw}}$ to the declared finite precision. Run the diffeomorphism generated by this vector field for duration $h$. Let $\tilde{Q}=\log(\phi_h^*\exp Q_{\mathrm{raw}})$, with the appropriate $b$-relative interpretation.
3. Return to the finite metric chart by the explicitly defined weighted retraction

$$
Q_{\mathrm{next}}=Q_{\mathrm{raw}}+P_n^{A_m(Q_{\mathrm{raw}})}(\tilde Q-Q_{\mathrm{raw}}).
\tag{B1}
$$

In a finite implementation the projected integrals, diffeomorphism integration, logarithm and spectral data are computed to uniform tolerances by the finite catalog programme. This is an additional paid controller stage. At finite n it approximates the gauge transformation, and the raw-stage and $Q_{\mathrm{next}}$ source states are both recorded.

For fixed $n$ all maps in a compact chart are smooth and all derivative constants finite. The Taylor expansion of (B1) at $h=0$ has increment $h$ times the weighted projection of $D\exp^{-1}\mathrm{Lie}_Xg$, exactly the projected gauge in (A2). Its local time-step defect is bounded by $C_n h^{2}$ plus the certified numerical/categorical optimizer error. Ordinary finite-dimensional ODE stability is used only for this time-discretization comparison: choose $h$ and per-step tolerance so that $C_n\exp(L_n T)(h+\text{velocity error})\to 0$ in the desired finite Sobolev norm. This possibly exponential refinement is an existential finite-resource construction. Spatial error is controlled by the uniform parabolic estimate of Technical Appendix C, never by the factor $\exp(L_nT)$.

The scalar ground cutoff, sensor grid and spatial quadrature are selected separately after $n$. On a finite-dimensional compact $H^s$ controller ball, all higher spatial and parameter derivatives have finite $n$-dependent bounds. Uniform gapped spectral approximation then allows a diagonal selection $m(n)$ and sensor/precision tolerances such that the discrepancy between (A2) and the true-ground-weighted Ricci–DeTurck Galerkin vector is $\le\varepsilon_n$ in $H^{s-1}$, including the parameter-jet bounds used in stability. This is a precise tolerance construction. The construction uses this diagonal selection; an explicit polynomial $m(n)=n^p$ follows only after carrying the elliptic approximation and inverse-estimate exponents.

##### D.8.6i.44 C. Exact finite gauge energy identity

For any smooth vector field X,

$$
D\lambda_m[\mathrm{Lie}_X g]=-2\int r_m X(u_m)\,dV_g.
\tag{C1}
$$

Proof: the normalized Rayleigh quotient is invariant under simultaneous pullback of $g$ and the scalar $u_{m}$. Its scalar first variation at fixed $g$ is $2\int r_m\,\delta u\,dV$, with the normalization multiplier already included. Differentiate the pullback path, $\delta u=X(u_m)$. This proves (C1). The scalar Galerkin space itself need not be invariant; hence (C1) is a defect identity.

A simultaneous exact pullback of metric, scalar basis, quadrature, sensor frames and outcome dictionary would preserve the finite matrix/probability labels. The fixed-chart retraction (B1) is an approximate source change.

##### D.8.6i.45 D. Projection/quotient/EDI defect

On a uniformly elliptic $H^s$ ball with $s>d/2+8$, the ground-map tame bounds give $\lVert f\rVert_{H^s}\le C$ and, after sufficiently fine scalar approximation, the same bound for $f_{m}$. Hence

 $$
 \lVert\mathrm{Lie}_Xg\rVert_{H^{s-2}}\le C.
 $$

Weighted $L^{2}$ projection is uniformly quasioptimal. Reference spectral approximation therefore gives

 $$
 \lVert P_n^{G_m}\mathrm{Lie}_Xg-\mathrm{Lie}_Xg\rVert_{L^{2}}\le C n^{-(s-2)}.
 \tag{D1}
 $$

In log coordinates, apply the same argument to $D\exp_Q^{-1}\mathrm{Lie}_Xg$ and use the uniform tame bounds for $D\exp$ and its inverse. Finite sensor/precision errors add their declared tolerance to (D1).

The energy derivative $DE_N$ has uniformly bounded $L^{2}$ dual norm by the off-shell stress identity. Combining (C1),(D1), and $\lVert r_m\rVert_{L^{2}}\le\varepsilon_n$ gives

 $$
 |DE_N[P_n\mathrm{Lie}_Xg]|\le C[\varepsilon_n+n^{-(s-2)}].
 \tag{D2}
 $$

The compensated finite ODE consequently satisfies

$$
\begin{aligned}
dE_N/dt&=-\lVert F_N\rVert_{G_m}^{2}+\rho_n(t), \\
|\rho_n|&\le C[\varepsilon_n+n^{-(s-2)}+\text{sensor error}].
\end{aligned}
\tag{D3}
$$

In the actual split scheme, add the uniform accumulated O(T $C_{n}$ h) Taylor defect and the certified optimizer/gauge/retraction error. Thus both the raw gradient-stage action and the raw slope dissipation converge to their common limit once the parabolic trajectory theorem and the stated tolerance choices hold.

The total DeTurck-gauged coordinate speed contains the gauge velocity in addition to the gradient speed. In the continuum the $\lambda$ gradient F is orthogonal to diffeomorphism directions because $\lambda$ is diffeomorphism invariant; the gauge-corrected speed is ||F||_G; a local quotient-speed interpretation additionally uses an appropriate regular slice. The finite compensated curve has the same quotient velocity up to (D1) and the off-shell residual. Equivalently pull it back by the inverse gauge flow; the remaining nonvertical error is controlled by (D1), transported by a uniformly regular diffeomorphism. This is the explicit retained-record corrected-action identification.

##### D.8.6i.46 E. Concrete diagonal precision prescription

Oversampling is the following sequence of finite tolerance choices; no uniform same-cutoff statement is used. Fix an integer $s>d/2+8$, a regular $H^s$ controller ball, and a requested analytical tolerance $\varepsilon_{n}$ (for example $n^{-4}$). Fix the Fourier controller cutoff $n$ first.

1. Choose $S>k\ge s+1$. Reference spectral approximation, the ground gap, elliptic estimates and finite inverse inequalities yield a bound of the form

 $$
 \lVert u_m-u\rVert_{H^k}+\lVert r_m\rVert_{H^{k-2}}+|\lambda_m-\lambda|\le B_{n,S,k}\,m^{-(S-k)}.
 \tag{E1}
 $$

Here $B$ depends on the prescribed finite controller-ball coefficient bounds, gap and ellipticity, but not $m$. For $Q\in V_n$ with $\lVert Q\rVert_{H^s}\le K$, its higher derivatives have explicit Bernstein bounds; smooth $\exp$/$\log$ composition and elliptic bootstrapping therefore provide finite $B_{n,S,k}$. First/second parameter-jet versions have analogous constants, after using the finite-dimensional inverse bounds for the metric directions. The $H^1$ Ritz estimate is $C m^{1-S}\lVert u\rVert_{H^S}$; applying the scalar inverse inequality to $u_m-P_m u$ gives $H^k$ error $C m^{k-S}\lVert u\rVert_{H^S}$. Applying $H_{g}$ to that difference gives the residual term. Differentiated reduced-resolvent equations give the parameter-jet estimates. These estimates are applied with enough extra scalar regularity to control every requested norm.

2. Collect the finite list of constants and inverse-norm amplifications required for the compensated vector and the mass's first parameter derivative. Let $B_{n}$ be an upper bound for this finite collection. Choose

$$
m(n)\ge\max(m_{\mathrm{gap}},m_{\mathrm{positive}},(B_n/\varepsilon_n)^{1/(S-k)}).
\tag{E2}
$$

A larger integer is allowed. This is a finite, norm-typed prescription. The scalar cutoffs controlling the mass derivative and residual may be combined by taking their maximum. Quadrature approximations to A,W and their derivatives must satisfy the same final tolerance after gap/resolvent amplification.

3. Let $D_n=\dim V_n$ and collect all basis evaluation, inverse Sobolev and parameter-jet bounds in $K_{n}$. Refine categorical box/grid and spatial quadrature so each relevant mass-matrix entry and parameter derivative has error at most $\varepsilon_n/(D_n K_n)$. Entrywise control then implies the required retained operator-norm control. Gaussian domination gives local jet errors bounded by a polynomial tail times $\exp(-cR^{2})$ plus a finite-grid quadrature term; choose $R$ to make the former smaller than half the tolerance and then a small enough lattice spacing for the latter. Positive spatial quadrature of sufficiently small mesh handles the finite smooth coefficient family. This procedure specifies a finite direct alphabet. All constants are grade-wide and candidate independent.

4. Choose the hazard shift $C_{n}$ greater than the grade-wide $\lVert H_m\rVert$ bound and at least $\varepsilon_n^{-1}$. Then $b_n-1=O(\varepsilon_n)$. Keep $b_{n}$ in the principal parabolic coefficient; when comparing with the exact smooth target, its difference from one is a controlled small perturbation.

5. Once all spatial choices are frozen, let $L_{n}$ and $J_{n}$ bound the finite compensated ODE Lipschitz constant and split-step local truncation constant on the chosen compact chart. Choose $h_{n}$ and optimizer/gauge/retraction velocity tolerance $\eta_{n}$ so that

$$
\exp(L_nT)J_n(h_n+\eta_n)\le\varepsilon_n
$$

in $H^s$. For example choose both below $\varepsilon_n/[2J_n\exp(L_nT)]$. This is a possibly very expensive finite refinement; its physical-time realization and entire padded cost are those of Parts I, III and IV.

The tolerance hierarchy is triangular: controller cutoff → scalar/sensor/precision cutoffs → finite time/solver/gauge tolerances. No selected $\lambda$ or chosen optimum is used to set the grade-wide operator shift, resource envelope or precision.

##### D.8.6i.47 F. Physical interpolation and quotient action

If preparation/computation/gauge stages occupy a fraction $a_{n}$ of each physical step and the raw gradient switch occupies the remainder, Part III's smooth speed-compatible profile gives gradient-stage action distortion $O(a_n)$, not a fixed $1/\theta$ factor. The exact gauge is vertical for the quotient metric. The chart retraction, however, has a horizontal increment of order $h e_{n}$, where

 $$
 e_n=C[\varepsilon_n+n^{-(s-2)}]+\text{finite projection tolerance}.
 $$

If that retraction occurs in duration $a_{n}h$, its extra quotient action is bounded by $C T e_n^{2}/a_n$, plus the squared time-discretization/finite-tolerance contribution with the same timing factor. Choose $a_n\to 0$ while $e_n^{2}/a_n\to 0$; for example $a_n=\sqrt{e_n}$ for positive $e_{n}$, enlarged if necessary to dominate numerical timing errors. Cross terms in action comparisons are bounded by $C e_n/\sqrt{a_n}$ through Cauchy–Schwarz. This makes the quotient action converge while retaining the full actual gauge-control resource invoice.

The retained gauge record supplies the horizontal/quotient extractor, and this extracted speed is the one identified with $\lambda$-gradient dissipation; the total coordinate $G$-speed during a fast gauge and its physical actuator cost are recorded and charged.

##### D.8.6i.48 Technical Appendix C: uniform weighted-Galerkin existence, stability and continuation

##### D.8.6i.49 1. Equation and assumptions

Take $\mathbb{T}^d$, $V_n$ the Fourier symmetric tensors of frequency at most $n$, and $P_{n}$ the fixed reference $L^{2}$ projection. Let $s$ be an integer with $s>d/2+3$ (using a slightly larger $s$ avoids endpoint estimates). Write the weighted Ebin metric as

$$
\begin{aligned}
G_g(v,w)&=\int v:A(g)w\,dx,\\
A(g)&=.5\,u_g^{2}\sqrt{\det g}\,(g^{-1}\otimes g^{-1})|_{\mathrm{Sym}^{2}}.
\end{aligned}
$$

On $\alpha I\le g\le\beta I$ and $\lVert g\rVert_{H^s}\le K$, assume the ground state of $-4\Delta_g+R_g$ is normalized and positive. The following bounds follow from the uniform elliptic estimates, ground spectral gap and Sobolev multiplication:

$$
\begin{aligned}
aI\le A(g)&\le bI,\quad \lVert A(g)\rVert_{H^s}\le C_K, \\
\lVert DA(g)[h]\rVert_{H^r}&\le C_K\lVert h\rVert_{H^r},\quad r=s-1.
\end{aligned}
\tag{1}
$$

The last estimate is order zero, not order two. To see why, differentiate the ground eigen-equation. The source $\delta H_g[h]u$ has $H^{r-2}$ norm $\le C_K\lVert h\rVert_{H^r}$, including the second derivatives of $h$ in $\delta R$. The reduced resolvent on the normalized ground complement maps $H^{r-2}$ to $H^r$ uniformly. The mass normalization derivative is also order zero. Thus $\delta u$ is $H^r$-bounded by $h$; differentiating the algebraic factors in $A$ gives (1). The spectral gap and lower bound for $u$ are uniform on this elliptic $H^s$ ball: it is precompact in $C^{2}$, its closure stays elliptic, and the connected-manifold ground is simple and positive. Volume is bounded above/below by ellipticity.

For a finite oversampled ground approximation $A_{n,m}$, (1) must also hold for its parameter derivative. Fixed-direction convergence is not sufficient. For each $n$ the metric ball is compact finite-dimensional, so uniform Galerkin/resolvent convergence permits choosing $m(n)$ so large that the operator derivative error in $H^r$ on $V_{n}$ is at most (say) $1/n$. Higher metric derivatives may grow with $n$; the scalar cutoff must dominate the resulting inverse-estimate powers. This is a diagonal existence statement.

Let $W^k=g^{ij}(\Gamma(g)^k_{ij}-\Gamma(b)^k_{ij})$ be the DeTurck field. Define

$$
\begin{aligned}
F_{\mathrm{DT}}(g)&=-2\mathrm{Ric}(g)+\mathrm{Lie}_W g \\
&=g^{ij}\partial_i\partial_j g+Q(g,\partial g),
\end{aligned}
\tag{2}
$$

in reference coordinates, where $Q$ is smooth in $g,g^{-1}$ and quadratic in first derivatives. The candidate finite ODE is

$$
P_n[A(g)g_t]=P_n[A(g)F_{\mathrm{DT}}(g)]+P_n[A(g)r_n],\quad g(t)\in V_n\ (\text{affinely}).
\tag{3}
$$

Equivalently $g_t=P_n^G F_{\mathrm{DT}}(g)+P_n^G r_n$. The affine base is retained; differences lie in $V_{n}$. A log-metric controller $g=\exp Q$ has the same structure: the pulled-back mass matrix is $J_Q^T A(g)J_Q$, and the principal term for $Q$ is again $g^{ij}\partial_{ij} Q$, with additional lower-order terms. Uniform bounded log-metric charts make $J_{Q}$ and its inverse uniformly bounded.

##### D.8.6i.50 2. Uniform inverse of the compressed multiplier

Let $M_n v=P_n(Av)$ for $v\in V_n$. Its $L^{2}$ inverse norm is at most $a^{-1}$. For $r=s-1>d/2+1$, $\Lambda^r$ commutes with $P_{n}$. If $M_n v=P_n z$, coercivity gives

$$
a\lVert\Lambda^r v\rVert_2\le\lVert\Lambda^r z\rVert_2+\lVert[\Lambda^r,A]v\rVert_2.
$$

Kato–Ponce/product estimates bound the commutator by

 $$
 C(\lVert\nabla A\rVert_\infty\lVert v\rVert_{H^{r-1}}+\lVert A\rVert_{H^r}\lVert v\rVert_\infty).
 $$

Choose $\varepsilon>0$ with $r-\varepsilon>d/2$. Sobolev embedding and interpolation bound both lower norms by $\varepsilon_0\lVert v\rVert_{H^r}+C_{\varepsilon_0,K}\lVert v\rVert_2$. Absorb $\varepsilon_0$ using coercivity and apply the $L^{2}$ inverse estimate. Therefore

 $$
 \lVert M_n^{-1}P_n z\rVert_{H^r}\le C_K\lVert z\rVert_{H^r},
 \tag{4}
 $$

with $C_{K}$ independent of $n$. Apply this with $z=A(F_{\mathrm{DT}}+r_n)$. From (2), product estimates and (4),

 $$
 \lVert g_t\rVert_{H^{s-1}}\le C_K(1+\lVert g\rVert_{H^{s+1}}+\lVert r_n\rVert_{H^{s-1}}).
 \tag{5}
 $$

No $e^{n^{2}t}$ estimate is used.

##### D.8.6i.51 3. Weighted H^s energy

Use

$$
E_s(g)=\sum_{|\alpha|\le s}\int D^\alpha g:A(g)D^\alpha g\, dx.
$$

On the bootstrap ball this is uniformly equivalent to $\lVert g\rVert_{H^s}^{2}$. Differentiate (3) spatially and pair with $D^\alpha g\in V_n$. The leading second-order term is

 $$
 \int D^\alpha g:A(g)\,g^{ij}\partial_{ij}D^\alpha g,
 $$

which, by integration by parts, is at most $-c\lVert\nabla D^\alpha g\rVert_2^{2}$ plus $C_K\lVert D^\alpha g\rVert_2\lVert\nabla D^\alpha g\rVert_2$. Derivatives of the coefficients and the $Q$ term are bounded by $C_K(1+\lVert g\rVert_{H^{s+1}})$ on the bootstrap ball.

There are two mass-specific terms:

 (i) $\int D^\alpha g:A_t D^\alpha g$;
 (ii) the commutator $[D^\alpha,A](F_{\mathrm{DT}}+r_n-g_t)$.

For (i), (1) and (5) give $\lVert A_t\rVert_\infty\le C_K\lVert g_t\rVert_{H^{s-1}}\le C_K(1+\lVert g\rVert_{H^{s+1}}+\lVert r_n\rVert_{H^{s-1}})$. Since $\lVert g\rVert_{H^s}\le K$, its contribution is bounded by the same linear expression times $C_{K}$.

For (ii), the integer commutator/product estimate needs only $H^{s-1}$ of its second argument and $H^s$ of $A$, because $s-1>d/2$. Equations (2),(5) give precisely that bound. Its pairing with $D^\alpha g$ is again $\le C_K(1+\lVert g\rVert_{H^{s+1}}+\lVert r_n\rVert_{H^{s-1}})$.

The top derivative of the forcing is interpreted by integrating one derivative by parts; $r_{n}$ in $H^{s-1}$ suffices. Young's inequality absorbs every linear $H^{s+1}$ term. Hence

$$
\begin{aligned}
dE_s/dt+c_K\lVert g\rVert_{H^{s+1}}^{2} \\
&\le C_K(1+\lVert r_n\rVert_{H^{s-1}}^{2}).
\end{aligned}
\tag{6}
$$

To close the bootstrap without circularity, use the displacement $w_n=g_n-g_n(0)$ rather than an absolute radius chosen from $K$-dependent norm-equivalence constants. Take initial Fourier projections of one smooth metric, uniformly bounded in $H^{s+2}$, and fix a small $H^s$ radius $R$ and an ellipticity neighborhood first. Sobolev embedding permits $R$ small enough that every metric in this ball stays inside that ellipticity neighborhood. All ground, mass and norm-equivalence constants $a_R,C_R$ are then fixed independently of $n$. The equation for $w_{n}$ has principal part $a(g_n)\partial^{2}w_n$ and bounded background forcing from $g_n(0)$, including its $H^{s+2}$ norm. The identical calculation gives

$$
\begin{aligned}
dE_s(w_n)/dt+c_R\lVert w_n\rVert_{H^{s+1}}^{2} \\
&\le C_R(1+\lVert r_n\rVert_{H^{s-1}}^{2}),\quad E_s(w_n(0))=0.
\end{aligned}
$$

If the constructed residual has a uniform pointwise $H^{s-1}$ bound $B$, choose $T$ so $C_R T(1+B^{2})<a_R R^{2}/4$. Then $\lVert w_n\rVert_{H^s}<R/2$ on the entire bootstrap interval, strictly inside the selected ball. More generally it suffices to have a uniformly small integral of the residual square on this interval; a global $L^{2}$ bound without uniform integrability does not allow shrinking $T$ to make that integral small. The finite spectral/solver residual is prescribed uniformly over the controller ball (Technical Appendix B, section E), which gives the pointwise bound needed here. The finite ODE is smooth on the interior, so ordinary finite-dimensional existence plus this strict estimate gives the uniform interval. For a longer smooth window, continuation uses the tame high-norm estimate of section 7 together with the lower-norm stability estimate.

The same estimate applies if the finite spectral/sensor errors are incorporated in $r_{n}$ with uniformly bounded (or vanishing) $L^{2}_t H^{s-1}$ norm. This high-norm residual bound is stronger than the dual $L^{2}$ slope estimate; the separate scalar cutoff and sensor quadrature of Technical Appendix B, section E, supply it on the finite $V_{n}$ ball, with the norms and tolerances listed there.

##### D.8.6i.52 4. Quantitative projected-gauge and energy defect

Let the exact finite scalar energy be $E_m(g)=e_C(\lambda_m(g))$. For a smooth vector field $X$, simultaneous diffeomorphism covariance of the continuum Rayleigh quotient evaluated at the trial function $u_{m}$ gives the exact off-shell identity

$$
\begin{aligned}
D\lambda_m[\mathrm{Lie}_X g]&=-2\int r_m X(u_m)\,dV_g, \\
DE_m[\mathrm{Lie}_X g]&=-2e_C'(\lambda_m)\int r_m X(u_m)\,dV_g.
\end{aligned}
\tag{7}
$$

Here the finite scalar trial subspace is held fixed in $D\lambda_m$; the nonzero right side measures precisely its failure of gauge invariance. Proof: along a simultaneous pullback of $(g,u_m)$, the Rayleigh quotient is constant. Its scalar-function derivative at normalized $u_{m}$ is $2\int r_m\,\delta u$. The scalar variation of pullback is $\delta u=X(u_m)$; moving it to the other side yields (7). The normalization term is already inside $r_{m}$.

Set $X=b_m(g)(\operatorname{grad} f_m+W)$, where $b_m=-e_C'(\lambda_m)>0$ on the admitted hazard branch. The scalar $b_{m}$ is spatially constant. On the $H^s$ metric ball with uniform $H^s$ ground approximation, $L=\mathrm{Lie}_Xg$ is bounded in $H^{s-2}$. Let $H_n=P_n^{G_m}L$, with exact ground-weighted tensor metric $G_{m}$ (or a sufficiently fine categorical approximation with its operator error separately included). Weighted best approximation and uniform norm equivalence give

 $$
 \lVert H_n-L\rVert_{L^{2}}\le C\inf_{v\in V_n}\lVert v-L\rVert_{L^{2}}\le C n^{-(s-2)}\lVert L\rVert_{H^{s-2}}.
 \tag{8}
 $$

Consequently, using the exact off-shell dual tensor bound,

 $$
 |DE_m[H_n]|\le C(\lVert r_m\rVert_{L^{2}}+n^{-(s-2)}).
 \tag{9}
 $$

If the categorical metric differs from $G_{m}$ by $\eta_{n}$ in the relevant extended bilinear operator norm, add $C\eta_n$ to (8),(9). For a consistency estimate on $V_n\times V_n$ only, the mixed test involving $L$ must be checked separately; spatial quadrature can be refined to include it or its bounded smooth family.

Thus a controller algorithm that performs the projected compensated move has an asymptotically pure-gauge quotient displacement and a vanishing scalar-energy defect. Over fixed time $T$, the total gauge-work defect is bounded by $CT$ times the right side of (9), plus splitting/solver errors. Its gradient-stage dissipation converges to the $\lambda$/Ricci dissipation once the trajectory estimates hold (section 15.4), while the total representative speed also contains the gauge velocity; the two are distinct observables.

Part IV registers this algorithm together with its projection and retraction work.

##### D.8.6i.53 5. Effective lower-Sobolev stability estimate

The following gives an $n$-independent rate for equation (3), for every source/gauge algorithm satisfying that equation with the stated residual. Take $s>d/2+8$, $r=s-2$. Let $q(t)$ be a smooth exact Ricci–DeTurck solution with a uniform $H^{s+2}$ bound and fixed ellipticity on $[0,T]$. Here $q$ may be $g$ itself in an affine chart or the logarithmic metric controller, with the pulled-back coefficients as above. Let $q_{n}$ solve (3), with the uniform $H^s$ bound proved by (6), and let $\varepsilon_n=\lVert r_n\rVert_{L^{2}_t H^{s-3}}$. For existence via (6) one also retains a bounded $L^{2}_t H^{s-1}$ residual; these are different requirements.

Set $v=P_n q$ and $e=q_n-v$. Define the exact projected comparison defect

$$
\rho_n=v_t-P_n^{A(v)}F_{\mathrm{DT}}(v)\in V_n.
$$

Uniform Sobolev multiplier inverse bounds imply

 $$
 \lVert\rho_n\rVert_{H^{r-1}}\le C n^{-2}.
 \tag{10}
 $$

The $H^{s+2}$ exact bound gives $n^{-3}$ in this norm; the weaker rate $n^{-2}$ is used. For completeness, split $\rho$ into $P_n^{A(v)}[F_{\mathrm{DT}}(q)-F_{\mathrm{DT}}(v)]$ plus $(P_n-P_n^{A(v)})F_{\mathrm{DT}}(q)$. The first is bounded by $C\lVert q-v\rVert_{H^{r+1}}$, using the second-order tame Lipschitz estimate. For the second use

$$
(P_n^{A}-P_n)z=M_n^{-1}P_n A(I-P_n)z.
$$

Since $F_{\mathrm{DT}}(q)$ is $H^s$ and $q-v$ has Fourier tail $H^{s-1}$, both terms have the bound (10). All constants depend on the exact regular-window bound, not $n$.

The weighted projection difference is retained when subtracting the equations. Define

$$
\begin{aligned}
B_v&=v_t-F_{\mathrm{DT}}(v)-\rho_n \\
&=P_n^{A(v)}F_{\mathrm{DT}}(v)-F_{\mathrm{DT}}(v).
\end{aligned}
$$

Then $P_n(A(v)B_v)=0$. Subtraction gives

$$
\begin{aligned}
P_n[A(q_n)e_t] \\
&=P_n[A(q_n)(F_{\mathrm{DT}}(q_n)-F_{\mathrm{DT}}(v)+r_n-\rho_n)] \\
&\quad -P_n[(A(q_n)-A(v))B_v].
\end{aligned}
\tag{11}
$$

The last term is not zero. Nevertheless $B_{v}$ is uniformly $H^{r-1}$-bounded (and is actually a small spectral tail), while the order-zero ground/mass map gives

 $$
 \lVert A(q_n)-A(v)\rVert_{H^r}\le C_K\lVert e\rVert_{H^r}.
 $$

Because $r-1>d/2$, Sobolev multiplication bounds the final term in (11), after the compressed inverse, by $C_K\lVert e\rVert_{H^r}$ in $H^{r-1}$.

The principal difference is

$$
\begin{aligned}
F_{\mathrm{DT}}(q_n)-F_{\mathrm{DT}}(v)&=a(q_n)^{ij}\partial_{ij} e+R(e), \\
\lVert R(e)\rVert_{H^{r-1}}&\le C_K\lVert e\rVert_{H^r}.
\end{aligned}
$$

The background $v$ is uniformly $H^{r+2}=H^s$, so the coefficient-difference term $[a(q_n)-a(v)]\partial^{2}v$ satisfies that bound. The quadratic first-derivative terms do also. The compressed inverse estimate applied to (11) therefore yields

 $$
 \lVert e_t\rVert_{H^{r-1}}\le C_K(\lVert e\rVert_{H^{r+1}}+\lVert e\rVert_{H^r}+\lVert r_n-\rho_n\rVert_{H^{r-1}}).
 \tag{12}
 $$

Use the differentiated weighted difference energy $E_r(e)=\sum_{|\alpha|\le r}\int D^\alpha e:A(q_n)D^\alpha e$. The principal part is coercive in $H^{r+1}$. The mass commutator is controlled by (12), and the time derivative of the mass satisfies $\lVert A(q_n)_t\rVert_\infty\le C_K\lVert q_{n,t}\rVert_{H^{s-1}}$. Integrate one derivative by parts in the forcing. Young's inequality gives

$$
\begin{aligned}
dE_r/dt+c_K\lVert e\rVert_{H^{r+1}}^{2} \\
&\le C_K[1+\lVert q_{n,t}\rVert_{H^{s-1}}]E_r \\
&\quad +C_K\lVert r_n-\rho_n\rVert_{H^{r-1}}^{2}.
\end{aligned}
\tag{13}
$$

The coefficient is integrable with an n-independent bound by (5),(6) and Cauchy–Schwarz. Grönwall now has no $n^{2}$ coefficient. Combining (10),(13) gives

$$
\begin{aligned}
&\sup_{0\le t\le T}\lVert q_n(t)-q(t)\rVert_{H^{s-2}}^{2} \\
&+\int_0^T\lVert q_n-P_n q\rVert_{H^{s-1}}^{2}\,dt \\
&\le C_T[\lVert q_n(0)-P_n q(0)\rVert_{H^{s-2}}^{2}+n^{-4}+\varepsilon_n^{2}].
\end{aligned}
\tag{14}
$$

The omitted projection tail in the integrated term is also controlled by the same right side, so it may be restored there. Equation (12) further gives an $L^{2}_t H^{s-3}$ velocity error of the same order after taking square roots and adding the exact projection tail of $q_{t}$.

This is an effective stability estimate for the declared smooth-window bounds. It holds for every finite algorithm giving equation (3) with the specified high/low Sobolev residual on the smooth exact window, and its constants are bounded from ellipticity, ground gap, Sobolev radii, T and the retained residual envelope. The residual bounds of the actual source are supplied by Technical Appendix B, section E, and section 15.3.

##### D.8.6i.54 6. Actual positive hazard multiplier

The actual compensated source may yield $b_n(g)P_n^G F_{\mathrm{DT}}(g)$, with $b_n=-e_C'(\lambda_m)\in[1/2,2]$, rather than coefficient exactly one. Keep $b_{n}$ in the principal operator. It is spatially constant and positive, so (6) and the displacement bootstrap retain uniform ellipticity. The term $(b_n-1)F_{\mathrm{DT}}(g_n)$ is therefore not treated as an $H^{s-1}$ forcing.

For comparison with the smooth exact coefficient-one flow, $b_n-1=O(C_n^{-1})$ multiplies the smooth comparison $F_{\mathrm{DT}}(v)$, giving a controlled lower-norm defect. The coefficient difference $b_n(q_n)-b_n(v)$ is bounded by its scalar $\lambda$ derivative and $\lVert e\rVert_{L^{2}}$ (up to the retained eigen approximation), so it enters the lower-order remainder in (13). Thus the right side of (14) adds $C_n^{-2}$ to the squared error budget, with no uncontrolled high-norm forcing.

##### D.8.6i.55 7. Tame continuation over an arbitrary declared smooth window

Continuation over the whole window combines the lower-norm estimate with the following tame high-norm bound. Assume $s>d/2+8$ and choose $r_0$ with

 $$
 d/2+1<r_0<s-4.
 $$

Fix an elliptic tube with $\lVert g\rVert_{H^{s-2}}\le L$. All constants in this subsection depend on $L$, the ellipticity bounds and the connected reference torus, not the high $H^s$ norm or $n$. The low metric bound controls the ground gap, positive ground lower bound, and low ground Sobolev norms uniformly. Elliptic regularity has the tame high-order form

 $$
 \begin{gathered}
 \lVert u_g\rVert_{H^s}\le C_L(1+\lVert g\rVert_{H^s}), \\
 \lVert A(g)\rVert_{H^s}\le C_L(1+\lVert g\rVert_{H^s}), \\
 \lVert DA(g)[h]\rVert_{H^{r_0}}\le C_L\lVert h\rVert_{H^{r_0}}.
 \end{gathered}
 \tag{15}
 $$

The first estimate is linear in the high norm: in the equation $-4\Delta_g u+R_g u=\lambda u$, the high derivatives of $R$ contain at most one high derivative of $g$, multiplied by bounded low derivatives; the principal/first-order coefficient commutators likewise contain one high coefficient derivative times a low derivative of $u$. The low $u$ norm is already bounded by the low metric norm. The tame elliptic estimate therefore bounds $u$ in $H^s$ by a constant times $1+g$ in $H^s$. The algebraic/composition factors in $A$ retain this tame form. For the third estimate, differentiate the ground equation; the reduced resolvent gains two derivatives, compensating $\delta R$'s two derivatives of $h$. At level $r_0$ all coefficient and ground norms required by this estimate lie strictly below the fixed low regularity $s-2$. These statements can equivalently be proved with the integer Leibniz/Sobolev product bounds and a fixed uniformly elliptic parametrix on the compact tube; $C_{L}$ contains no high-derivative norm.

Apply the compressed inverse first at the low level $r_0$. Since $F_{\mathrm{DT}}(g)$ in $H^{r_0}$ requires only $g$ in $H^{r_0+2}$, which is below $H^{s-2}$, one obtains

 $$
 \lVert g_t\rVert_{H^{r_0}}\le C_L(1+\lVert r_n\rVert_{H^{r_0}}).
 \tag{16}
 $$

Thus for uniformly bounded residuals at this low level, $\lVert A_t\rVert_\infty\le C_L$ by (15),(16). This is stronger than the earlier estimate through $g_{t}$ in $H^{s-1}$.

At the high level $s-1$ the compressed multiplier inverse is tame. In its commutator estimate, $\nabla A$ is bounded by the low radius, the term involving $A$ in $H^{s-1}$ multiplies $g_{t}$ in $L^\infty$ (already bounded by (16)), and the intermediate $g_{t}$ norm is absorbed by interpolation against its low norm. Consequently

 $$
 \lVert g_t\rVert_{H^{s-1}}\le C_L(1+\lVert g\rVert_{H^{s+1}}+\lVert r_n\rVert_{H^{s-1}}).
 \tag{17}
 $$

The source multiplier $b_n\in[1/2,2]$ remains in the principal part and does not change these bounds.

Repeat the weighted $H^s$ calculation, now retaining high×low structure rather than replacing every norm by $K$. The coefficient commutators have bounds of the form

 $$
 C_L[\lVert g\rVert_{H^{s+1}}+(1+\lVert g\rVert_{H^s})],
 $$

and their pairing with $D^s g$ is bounded by a small part of $\lVert g\rVert_{H^{s+1}}^{2}$ plus $C_L(1+\lVert g\rVert_{H^s}^{2})$. The high $A$ derivative in the mass commutator multiplies the low $L^\infty$ norm of $F_{\mathrm{DT}}-g_t$; the other mass commutator term uses (17). The $A_{t}$ term is bounded by $C_L E_s$ because of (16). The forcing is handled by one integration by parts. Therefore

$$
\begin{aligned}
dE_s/dt+c_L\lVert g\rVert_{H^{s+1}}^{2} \\
&\le C_L(1+E_s+\lVert r_n\rVert_{H^{s-1}}^{2}).
\end{aligned}
\tag{18}
$$

The pointwise norm-equivalence constants for $E_{s}$ depend only on the low tube, since $A$'s eigenvalue bounds do. If the constructed high-norm residual is uniformly bounded, (18) yields an explicit finite $H^s$ bound $B(L,T,\text{initial data},\text{residual bound})$, exponentially in $C_{L}T$, for every time the trajectory remains in the low tube.

Now let $q_{\mathrm{exact}}$ be the prescribed smooth Ricci–DeTurck solution on $[0,T]$, and choose a low $H^{s-2}$ tube of sufficiently small radius about its path, preserving ellipticity. Bootstrap until the finite trajectory first reaches that tube boundary. On this interval (18) bounds $H^s$ by the predetermined $B$. Choose the scalar cutoff, sensor quadrature, source precision and physical step sizes to give the required residual bounds uniformly on the $H^s$ ball of radius $B+1$. The stability estimate (14), whose constants now depend on this fixed $B$ rather than $n$, makes the low trajectory error smaller than $1/2$ for all sufficiently fine grades. The low boundary is therefore never reached; the high boundary $B+1$ is excluded by (18). This extends the finite ODE through the full specified $[0,T]$ and closes both bootstrap assumptions.

This is a continuation theorem relative to an existing smooth exact window. It proves uniform finite-trajectory $H^s$ regularity on that window for every finite compensated source algorithm satisfying equation (3) with the uniform high-norm residual. The finite ground and sensor approximation must inherit (15),(16), or be close enough in the corresponding parameter/operator norms on the $B+1$ ball to preserve them. An oversampled scalar/grid diagonal can enforce these finite-dimensional compact-domain tolerances; Parts I, III and IV state that common choice and retain its invoices.

#### D.8.6i.56 Part VI. Exact inherited positive-control source and final proof assembly

##### D.8.6i.57 14. Exact tagged-unitary control tariff

The source uses the following finite Hermitian-control primitive on a supplied ready, fully delivered support; no free arbitrary unitary is postulated. For each finite unitary $U$ on its fully delivered support adjoin a fresh degenerate tag $|0\rangle$ and put

$$
\begin{aligned}
W_U &= U \otimes |1\rangle\langle 0| + U^{*} \otimes |0\rangle\langle 1|, \\
H_c(t) &= \hbar\gamma(t)(I - W_U), \\
\gamma &\ge 0, \qquad \int \gamma\, dt = \pi/2.
\end{aligned}
$$

Then $W_U=W_U^*$, $W_U^{2}=I$. Initially $\langle W_U\rangle=0$ for every payload, including a payload entangled with an arbitrary reference; it remains zero because the pulse commutes with $W_{U}$. The endpoint implements $U$ and flips the tag to $|1\rangle$, up to one global phase. Thus mean positive control action is exactly $\pi\hbar/2$ and integrated operator norm $\pi\hbar$, independent of $g$, source state and controlled-identity branch. With $\gamma(t)=\pi\rho(t/\sigma)/(2\sigma)$, zero endpoint amplitudes and their derivatives are smooth; peak norm is $15\pi\hbar/(8\sigma)$ and all other waveform bounds are explicitly finite.

The tag is archived, never reset. Full support, all input tags, matrix/table coefficients, clocks, routes, controller waveforms and retention intervals are counted. The physical action is measured in energy times time and priced with the supplied conversion and native prices. Zero net endpoint work leaves the positive action, peak, duty and holding charges in place.

Use this primitive for the ground Householder, spectral flag dilation, spatial-density isometry extension, covector preparation, predictor/decoder/frame operations, ROM/arithmetic permutations, pointer copies and every inactive padded unitary. For a finite digital catalog, the entire multiplexed unitary controlled by q is one fixed delivered programme; all catalog entries and full support are priced before q is selected. For the admitted normal family, its finite smooth control-template/range/precision specification is fixed before comparison, exactly as in the normal inner branch of Lemma F.1c.5. In both cases every law evaluation is a paid finite computation, and a multiplexed matrix is priced at its full size.

Final risk/logratio batteries are not tagged: their positive stored charges and ramps remain separate actual source outputs. They are diagonal on retained source labels, with their full state-dependent risk/KL expectations included in the PCE potential. Any nondegenerate drift is explicitly commuted or included in the supplied interaction picture; the construction's computational/source storage factors have declared degenerate baselines between these final charging strokes.

This makes the finite control action/load contribution exactly independent of the controller value on this tariff; the constant mean energy is exact, not an operator-norm envelope.

##### D.8.6i.58 15. Proof on the registered sequence

###### D.8.6i.59 15.1 Source contract and finite exact quantities

The static predictive trial, covariance transition trial, tagged positive-control primitive and complete catalog/horizon programme together define one branch contract of Definition D.1f. Its supplied configuration consists of the old controller, candidate controller/forecast, prescribed geometric and source matrices, full clocks/stock/programmes, and all source/gauge/solver/record ports. Every prescribed preparation, coframe, rate, matrix, table and geometry is a function of these same controller records. The ground state is fixed by the source grammar; it is not a comparator. Forecasts are committed before private source flags. All actual outcomes, including rare events, remain in the archive.

At fixed grade and physical step $\Delta t=t_0 h$, the complete expected PCE scalarization has exactly the form

$$
\begin{aligned}
(\Delta t/E_0) V_{\mathrm{step}} \\
&= C_{\mathrm{grade,step}} + e_{\mathrm{raw},N}(g_{\mathrm{raw}}, m) + (1/h) D_g(g_{\mathrm{raw}}),
\end{aligned}
$$

where $C$ includes the positive $B/h$ transition baseline, every actual fixed source/control/stock/clock/holding charge and the independently fixed utility reference. The normal raw risk $e_{\mathrm{raw},N}=E_{\mathrm{eff},N}[(m-p)^{2}+p(1-p)]$ is physical final battery work divided by $E_0$, together with its same-task utility price. The separately performed gauge and retraction have their complete fixed positive programme/control prices inside $C$; their finite source-energy defect is not subtracted from the physical invoice. Tagged controls establish constant actual mean control action on their inherited tariff, including identity branches. Final risk and transition batteries remain charged.

The state potential used in the gradient limit is the optimized static prediction energy

$$
E_N(g) = E_{\mathrm{eff},N}[p_g(1 - p_g) - p_0(1 - p_0)].
$$

Its reference is grade-only and is displayed in the full invoice. The transition cost supplies the positive local metric $G_{N}$ through its exact Hessian. These are the separate energy and dissipation components of the actual incremental PCE objective. Multiplication of the original power by its common actual service duration is explicit.

Part III supplies an actual finite implemented-source selector with total objective error small enough for the normal-source local strong convexity estimate, with no exact expectation or minimizer oracle. A finite normal source has smooth real controller variables; its digital catalog is a paid approximation of its selected trajectories and named responses, and slopes are taken on the smooth controller space.

###### D.8.6i.60 15.2 All-direction energy and mobility consistency

For each retained metric controller space, independent scalar oversampling gives, for the ideal integral Ritz comparator, the exact off-shell tensor

$$
T_m = -u_m^{2}(\mathrm{Ric} + \operatorname{Hess} f_m) + (1/2) u_m r_m g.
$$

Its $L^2$ convergence, together with the separately budgeted actual-quadrature gap/resolvent error $\lVert D\lambda_N^q-D\lambda_m\rVert_{(V_n,L^2)^*}\le\epsilon_n$, supplies the dual derivative estimate for every retained metric direction. After the positive hazard calibration, $E_N\to-\lambda$ and $DE_N\to D(-\lambda)$ in that dual norm. Independent spatial/covector quadrature gives the actual sensor metric in operator norm on the whole retained tangent space, its needed parameter derivatives and the mixed gauge test family. Consequently the finite source slopes satisfy

$$
\begin{aligned}
|\partial E_N|^{2} &= DE_N\, G_N^{-1} DE_N \\
&\to 2\int |\mathrm{Ric} + \operatorname{Hess} f_g|^{2}\, dm_g
\end{aligned}
$$

uniformly on the regular controller domains. Strict interior margins make all tangent directions available; no boundary normal-cone force enters. The local continuum slope is taken on this uniformly regular metric domain.

This also proves local $\Gamma$ convergence and compact-domain equicoercivity in the stated regular topology: the energies converge uniformly, and the prescribed uniformly bounded high-Sobolev domains embed compactly in the weaker topology used for recovery/trajectory comparison.

###### D.8.6i.61 15.3 Uniform trajectory theorem and finite programme realization

The normal raw source gradient plus the explicitly registered projected gauge has the ideal compensated vector of Technical Appendix B plus the controlled actual-quadrature/categorical/source residual stated above. Its principal part is $b_{n}$ times Ricci–DeTurck, with $b_{n}$ positive and tending to one; the off-shell/categorical/source discrepancy is selected small in the $H^{s-1}$ and parameter norms required by Technical Appendix C.

That appendix first proves a uniform Sobolev inverse for the compressed positive mass multiplier, then a noncircular local displacement estimate, a lower-norm difference estimate with the weighted-projection defect included, and a tame high-norm continuation theorem. Choosing the finite cutoffs uniformly on the resulting B+1 ball excludes both the high and low bootstrap boundaries over the supplied regular window. This derives uniform finite-trajectory regularity. The displayed n-independent comparison estimate in the main statement follows.

For each frozen spatial grade, the raw minimizer step, exact supplied diffeomorphism (or its explicit Euler diffeomorphism), and weighted log-chart retraction have local defect $O(J_n h^{2})$ plus the certified source/controller tolerances. The finite temporal step is chosen after those constants so that the fixed-grade time error is below the nominated $\epsilon_{n}$, even if this requires exponentially small $h$. This exponential factor multiplies the temporal error only. The actual paid finite controller and clock then implement that selected temporal refinement under the declared driven-source supplier. All tag/control/duty/stock/precision costs may diverge and remain recorded.

###### D.8.6i.62 15.4 Corrected speeds and both dissipation integrals

Let $Z_n(t)$ be the actual current-coordinate gauge field recorded during the gauge stage and zero outside it, as defined in Part IV. Let $v_n^{\mathrm{corr}}$ be the represented metric velocity after subtracting $\mathrm{Lie}_{Z_n}g_n$, with the explicit chart-retraction velocity retained. The raw deformation uses the speed-compatible profile; its action distortion is $O(a_n+\eta_n)$. The horizontal retraction increment per step is $O(h e_n)$, so its total corrected action is $O(T e_n^{2}/a_n)$ and the cross term is $O(T e_n/\sqrt{a_n})$. The chosen diagonal makes all these errors vanish. Gauge-actuator energy and total coordinate speed remain recorded.

Strong trajectory convergence, uniform spectral/sensor consistency and the source slope identities now give

$$
\begin{aligned}
\int_0^S |v_n^{\mathrm{corr}}|^{2}_{G_N}\, ds \\
&\to 2\int_0^S \int |\mathrm{Ric} + \operatorname{Hess} f_g|^{2}\, dm_g\, ds, \\
\int_0^S |\partial E_N|^{2}_{G_N}\, ds \\
&\to 2\int_0^S \int |\mathrm{Ric} + \operatorname{Hess} f_g|^{2}\, dm_g\, ds.
\end{aligned}
$$

The finite energy derivative along the compensated ODE is $-|F_N|^{2}$ plus the explicit off-shell/projected-gauge defect. Its integral is bounded by $C_T(\epsilon_n+n^{-(s-2)}+\text{sensor error})$ plus the selected splitting/solver errors. Passing to the limit yields

$$
\begin{aligned}
-\lambda(g(S)) + (1/2)\int_0^S \\
&[|v^{\mathrm{corr}}|^{2}_G + |\partial(-\lambda)|^{2}_G]\, ds = -\lambda(g(0)).
\end{aligned}
$$

Thus both action and slope integrals converge, and the limiting energy-dissipation identity holds with equality. Corrected speed is the primary modulo-gauge record; a local quotient interpretation follows where a regular slice is used.

###### D.8.6i.63 15.5 Actual geometric/source/clock comparison

The midpoint edge timers and actual cell volumes represent the same full $g_{n}$, including trace variations, with uniform distance/volume errors from Part II. The volume-reversible diagnostic generator has the stated $\rho^{-1}\operatorname{div}(\rho g^{-1}\operatorname{grad})$ limit. Edge-time diagnostics and the endpoint heat sampler are distinct fully priced services with distinct clocks.

The finite spectral ground state maps by the exact mass isometry to the spatial Born weights used by the covariance trial. Under the common reconstruction, their densities converge to $u_g^{2}dV_g$; in a fixed reference volume representation the positive wavefunctions $\rho_g^{1/2}u_g$ converge in $L^2$. Scalar eigenvalues, finite normalized response matrices and the retained frame/covector effects converge on every nominated finite regular response prefix by the same uniform source/precision estimates. Complete raw archives and all invoices remain retained; convergence concerns the named finite responses.

For time-varying controllers, conditional finite response comparisons are composed in their actual event order. A fixed retained finite protocol is a finite product of contractive channels/effects and finite source preparations. The difference telescopes into the sum of the recorded source, geometry, timing and effect errors. Choose their finite tolerances after the nominated protocol count/window, as in the full catalog invoice. For each retained static macroscopic heat/geometry diagnostic, record its capture time $t_\star$, the copied public controller $q(t_\star)$, the frozen private diagnostic source, its actual completion time/latencies and the full source/metric labels. The live controller may continue evolving; the diagnostic is a frozen captured-source test. Its full positive time, stock, holding and cost are retained, and it runs on its own service, outside the fixed-latency edges. All capture/completion records use the common physical seconds, with $t_{\mathrm{heat}}$, $t_0$ and $t_{\mathrm{length}}$ distinct calibrated constants.

The convergent energy is the analytically controlled expected PCE cost. The raw flag law tends to the reference Bernoulli law while $E_{\mathrm{eff},N}$ grows; centered single-run battery variables need not be tight and generally have variance of order $C_N^{2}$. Every growing invoice and raw archive is retained outside the fixed bounded-response limit. If an actual estimator of a mean to accuracy $\epsilon$ and failure $\alpha$ is requested, its independent trial count may be chosen by the bounded-loss concentration bound (of order $E_{\mathrm{eff},N}^{2}\log(1/\alpha)/\epsilon^{2}$), and all those repetitions, batteries, pointers and precision services are paid. The expected-cost controller itself needs no empirical estimator or uncharged calibration run.

The source time is physical $t=t_0 s$, all pulse durations are their actual positive scheduled subwindows, and spectral $\tau$ is a controlled dimensionless exposure. With physical metric $g_{\mathrm{phys}}=\ell_0^{2}g$, its Ricci-type deformation coefficient is explicitly $\ell_0^{2}/t_0$. Physical energy is $E_0$ times the normalized source energy, and physical friction metric is $E_0 t_0 G$. These are independently registered source calibrations, fixed before comparison.

The underlying reduced measure is selected and transported equivariantly. The exact envelope cancellation identifies its full continuum energy with $F(g,f_g)=\lambda$ and its metric equation with the vacuum expression of (D.8.6.3). After the recorded gradient-gauge pullback this is Ricci flow. The measure $m_g(t)$ evolves with the metric.

###### D.8.6i.64 15.6 Arbitrary perturbations and the end of the window

On T4 every smooth symmetric perturbation has full Fourier approximants in the log chart, including trace/shear components. For any smooth initial metric, choose a regular time interval and controller envelopes with a strict interior margin; sufficiently small fixed smooth perturbations retain that margin, and the same construction applies with its uniform bounds. The theorem therefore covers every smooth perturbation, beyond the product-round branch of Theorem D.8.6h. Uniform bounds and the compensated estimates hold on the declared smooth interval, which ends before any extinction, curvature blow-up or loss of chart, gap or ellipticity.

This completes the proof on the registered driven, source-selected, vacuum $\chi=0$ regular-window branch. ∎

##### D.8.6i.65 Imported results

- Perelman (2002, §§1–2): the continuum first variation, the ground reduction and the gradient-gauge relation.
- DeTurck (1983): the parabolic Ricci–DeTurck gauge, whose principal part is used in Technical Appendix C.
- Kato and Ponce (1988): the Sobolev commutator and product bounds used in Technical Appendix C.

The source admission and the primitive transfers use Definition D.1f, Theorem D.1g, Lemma F.1c.5, Theorem D.6f.2m and Theorem O.7.2.3m, each on its stated source and tariff scope.

### D.8.7 Thermodynamic Length Bound for Varying Effective Constants

<a id="definition-d87a-predictive-coupling-manifold"></a>**Definition D.8.7a (Predictive Coupling Manifold).** Let $\Lambda$ be a finite-dimensional manifold of effective constants or couplings $\lambda=(\lambda^1,\dots,\lambda^n)$ on a regular coarse-grained branch. Suppose the branch defines a locally asymptotically normal predictive family $p_\lambda$ with Fisher/PCE metric
$$
G_{ij}(\lambda)
=
\mathbb E_\lambda
\left[
\partial_i\log p_\lambda\,
\partial_j\log p_\lambda
\right],
\tag{D.8.7.1}
$$
positive definite on the retained identifiable directions. For $0<\tau<\infty$ and an absolutely continuous drift path $\lambda:[0,\tau]\to\Lambda$ with finite metric energy $\int_0^\tau\dot\lambda^iG_{ij}(\lambda)\dot\lambda^j\,dt$, define its thermodynamic length
$$
L_G(\lambda)
=
\int_0^\tau
\sqrt{
\dot\lambda^iG_{ij}(\lambda)\dot\lambda^j
}\,dt.
\tag{D.8.7.2}
$$

<a id="theorem-d87b-thermodynamic-length-bound"></a>**Theorem D.8.7b (Thermodynamic Length Bound).** Suppose the entropy production of the drift obeys the local Onsager-PCE lower bound
$$
\Sigma[\lambda]
\ge
\int_0^\tau
\dot\lambda^iG_{ij}(\lambda)\dot\lambda^j\,dt.
\tag{D.8.7.3}
$$
Then every drift from $\lambda_0$ to $\lambda_1$ in time $\tau$ satisfies
$$
\boxed{
\Sigma[\lambda]\ge \frac{d_G(\lambda_0,\lambda_1)^2}{\tau}
}
\tag{D.8.7.4}
$$
where $d_G$ is the geodesic distance induced by $G$.

*Proof.* Let
$$
v(t)=
\sqrt{
\dot\lambda^iG_{ij}(\lambda)\dot\lambda^j
}.
$$
Then
$$
L_G(\lambda)=\int_0^\tau v(t)\,dt.
$$
By Cauchy-Schwarz,
$$
L_G(\lambda)^2
\le
\left(\int_0^\tau 1^2\,dt\right)
\left(\int_0^\tau v(t)^2\,dt\right)
=
\tau
\int_0^\tau
\dot\lambda^iG_{ij}(\lambda)\dot\lambda^j\,dt.
$$
Using (D.8.7.3),
$$
L_G(\lambda)^2\le \tau\,\Sigma[\lambda].
$$
Since $d_G(\lambda_0,\lambda_1)$ is the infimum of $L_G$ over all paths with the same endpoints,
$$
d_G(\lambda_0,\lambda_1)^2
\le
L_G(\lambda)^2
\le
\tau\,\Sigma[\lambda].
$$
Dividing by $\tau$ gives (D.8.7.4). ∎

<a id="corollary-d87c-finite-dissipation-bound-on-varying-constants"></a>**Corollary D.8.7c (Finite-Dissipation Bound on Varying Constants).** If a single effective constant $\lambda$ drifts on an interval where
$$
G_{\lambda\lambda}(\lambda)\ge G_{\min}>0,
$$
then
$$
|\lambda(\tau)-\lambda(0)|
\le
\sqrt{\frac{\Sigma[\lambda]\tau}{G_{\min}}}.
\tag{D.8.7.5}
$$

*Proof.* In one dimension,
$$
d_G(\lambda(0),\lambda(\tau))
\ge
\sqrt{G_{\min}}\,
|\lambda(\tau)-\lambda(0)|.
$$
Substitute this into Theorem D.8.7b and solve for the drift magnitude. ∎

<a id="corollary-d87d-conditional-predictive-price-of-cosmological-drift"></a>**Corollary D.8.7d (Conditional Predictive Price of Cosmological Drift).** On a branch satisfying Theorem D.8.7b's independent Onsager-PCE lower bound, in its declared time coordinate and metric normalization, a drift of effective constants obeys the Fisher-distance entropy-production bound (D.8.7.4). This includes $\alpha$, $G$, masses, threshold scales or dark-sector parameters only after their response family and dissipation have been identified with that branch. A drift with zero entropy production has zero metric speed almost everywhere and is constant on the retained identifiable quotient.

*Proof.* If $\Sigma[\lambda]=0$, the nonnegative integral in (D.8.7.3) vanishes, so $\dot\lambda^iG_{ij}(\lambda)\dot\lambda^j=0$ almost everywhere. Absolute continuity and positive definiteness on the retained identifiable quotient make the quotient path constant; (D.8.7.4) also gives $d_G(\lambda_0,\lambda_1)=0$. Fisher information alone does not establish the assumed dissipation inequality. ∎

<a id="theorem-d87h-two-state-driven-response-family-and-derived-onsager-metric"></a>**Theorem D.8.7h (Two-State Driven Response Family and Derived Onsager Metric).** Let
$$
p_\lambda(1)=p(\lambda):=\frac{e^\lambda}{1+e^\lambda},
\qquad
p_\lambda(0)=1-p(\lambda),
\tag{D.8.7.11}
$$
and let the controlled two-state generator have rates
$$
k_\lambda(0,1)=rp(\lambda),
\qquad
k_\lambda(1,0)=r(1-p(\lambda)),
\qquad r>0.
\tag{D.8.7.12}
$$
For a $C^2$ slow protocol $\lambda^\epsilon(t)=\lambda(\epsilon t)$, $0<\epsilon<1$, whose range lies in a compact interval, let $p^\epsilon(t):=p(\lambda^\epsilon(t))$ and let $m^\epsilon(t)$ be the probability of state $1$, initialized at equilibrium. On every registered compact slow-time interval with uniformly bounded first and second protocol derivatives, with constant registered rate $r>0$ independent of $\epsilon$,
$$
\dot m^\epsilon=r(p^\epsilon-m^\epsilon),
\qquad
m^\epsilon
=
p^\epsilon-\frac1r\dot p^\epsilon
+\frac1r\dot p^\epsilon(0)e^{-rt}
+R^\epsilon(t),
\qquad
|R^\epsilon(t)|
\le\frac{\sup_{s\le t}|\ddot p^\epsilon(s)|}{r^2}
=O(\epsilon^2).
\tag{D.8.7.13}
$$
The transient is generically $O(\epsilon e^{-rt})$. For the registered rate $r>0$, the reduced lag formula $m^\epsilon=p^\epsilon-r^{-1}\dot p^\epsilon+O(\epsilon^2)$ holds uniformly when $e^{-rt}\le\epsilon$, for example after $t\ge r^{-1}\log(1/\epsilon)$. The instantaneous Markov entropy production
$$
\sigma^\epsilon
=J^\epsilon
\log\frac{(1-m^\epsilon)k_{\lambda^\epsilon}(0,1)}
{m^\epsilon k_{\lambda^\epsilon}(1,0)},
\qquad
J^\epsilon=r(p^\epsilon-m^\epsilon),
\tag{D.8.7.14}
$$
satisfies, uniformly after that burn-in,
$$
\sigma^\epsilon(t)
=\zeta_{\lambda\lambda}(\lambda^\epsilon)
(\dot\lambda^\epsilon)^2+O(\epsilon^3)
=\frac1r\,p(\lambda^\epsilon)(1-p(\lambda^\epsilon))
(\dot\lambda^\epsilon)^2+O(\epsilon^3).
\tag{D.8.7.15}
$$
Thus the finite driven family derives both the Fisher information metric and the friction/Onsager metric,
$$
G_{\lambda\lambda}(\lambda)
=\mathbb E_\lambda[(\partial_\lambda\log p_\lambda)^2]
=p(\lambda)(1-p(\lambda)),
\qquad
\zeta_{\lambda\lambda}(\lambda)
=\frac1rG_{\lambda\lambda}(\lambda).
\tag{D.8.7.16}
$$
For the registered rate $r$, the path-prediction functional
$$
\mathcal P[\lambda]
=\int_0^\tau
\zeta_{\lambda\lambda}(\lambda(t))\dot\lambda(t)^2dt
=\frac1r\int_0^\tau
\frac{\dot p(t)^2}{p(t)(1-p(t))}\,dt
\tag{D.8.7.17}
$$
is determined by the time-parametrized labeled binary response path, because $\lambda=\log(p/(1-p))$. The response path alone does not identify $r$. With the same registered $r$, the functional is invariant under smooth one-to-one changes of the state coordinate on that response path; it is not invariant under an arbitrary reparameterization of time.

*Proof.* The master equation gives
$$
m^\epsilon(t)-p^\epsilon(t)
=
-\int_0^t e^{-r(t-s)}\dot p^\epsilon(s)\,ds
=
-\frac{\dot p^\epsilon(t)}r
+\frac{\dot p^\epsilon(0)}r e^{-rt}
+\frac1r\int_0^t e^{-r(t-s)}\ddot p^\epsilon(s)\,ds.
$$
The last integral has the bound in (D.8.7.13). Since $\dot p^\epsilon=O(\epsilon)$ and $\ddot p^\epsilon=O(\epsilon^2)$ on the compact protocol range, $e^{-rt}\le\epsilon$ gives the reduced lag expansion. Put $\delta=m^\epsilon-p^\epsilon$. Taylor expansion at $m^\epsilon=p^\epsilon$ gives
$$
\log\frac{(1-m^\epsilon)p^\epsilon}{m^\epsilon(1-p^\epsilon)}
=-\frac{\delta}{p^\epsilon(1-p^\epsilon)}+O(\delta^2),
\qquad
J^\epsilon=-r\delta.
$$
After the stated burn-in, $\delta=-\dot p^\epsilon/r+O(\epsilon^2)$, so their product is $(\dot p^\epsilon)^2/[rp^\epsilon(1-p^\epsilon)]+O(\epsilon^3)$. Since $\dot p^\epsilon=p^\epsilon(1-p^\epsilon)\dot\lambda^\epsilon$ and the Bernoulli Fisher information is $p(1-p)$, this proves (D.8.7.15) and $\zeta=G/r$. Equation (D.8.7.17) is the same quadratic form in the observable coordinate $p$ with $r$ retained, proving the stated identifiability and state-coordinate invariance. ∎

<a id="definition-d87e-classical-predictive-record-current"></a>**Definition D.8.7e (Classical Predictive Record Current).** Let $X$ be a finite record alphabet and let $(X_t)_{t\ge0}$ be an irreducible continuous-time Markov jump process with finite rates $k(x,y)$. Let its stationary law $\pi$ satisfy
$$
\sum_x\pi(x)k(x,y)
=
\pi(y)\sum_zk(y,z),
\tag{D.8.7.6}
$$
assume $X_0\sim\pi$, and assume dynamic reversibility,
$$
k(x,y)>0
\quad\Longleftrightarrow\quad
k(y,x)>0.
$$
For an antisymmetric increment $d(x,y)=-d(y,x)$, define
$$
J_T
=
\sum_{0<t\le T}d(X_{t^-},X_t).
\tag{D.8.7.7}
$$
The total steady entropy production is
$$
\Sigma_T
=
T\sum_{x<y}
\left(\pi(x)k(x,y)-\pi(y)k(y,x)\right)
\log
\frac{\pi(x)k(x,y)}{\pi(y)k(y,x)},
\tag{D.8.7.8}
$$
where pairs with both rates zero contribute zero. Irreducibility makes $\pi(x)>0$ for every $x$, and dynamic reversibility makes every remaining logarithm finite.

<a id="theorem-d87f-predictive-thermodynamic-uncertainty-bound"></a>**Theorem D.8.7f (Predictive Thermodynamic Uncertainty Bound).** Under Definition D.8.7e, for every $T>0$ and every current with $\langle J_T\rangle\ne0$,
$$
\frac{\operatorname{Var}(J_T)}{\langle J_T\rangle^2}\,\Sigma_T
\ge
2,
\tag{D.8.7.9}
$$
or equivalently
$$
\Sigma_T
\ge
2\,\frac{\langle J_T\rangle^2}{\operatorname{Var}(J_T)}.
\tag{D.8.7.10}
$$
The bound applies to a measurement, update, anomaly-ledger, or memory-ledger output only after that output independently satisfies Definition D.8.7e.

*Proof.* The hypotheses are precisely those of the finite-time thermodynamic uncertainty relation of Horowitz and Gingrich (2017, *Physical Review E* 96, 020103): a finite stationary continuous-time Markov jump process and an integrated antisymmetric jump current. Their theorem gives
$$
\operatorname{Var}(J_T)\,\Sigma_T
\ge
2\langle J_T\rangle^2.
$$
Because $\langle J_T\rangle\ne0$, division by its square gives (D.8.7.9). If $\operatorname{Var}(J_T)=0$, the displayed inequality forces $\langle J_T\rangle=0$ whenever $\Sigma_T<\infty$, so the nonzero-mean branch has positive variance and rearrangement gives (D.8.7.10). ∎

<a id="corollary-d87g-tur-gate-for-a-classical-readout"></a>**Corollary D.8.7g (TUR Gate for a Classical Readout).** Let a noncommutative finite protocol be read out through a channel
$$
\mathcal M:\mathfrak A\to C(X).
$$
The reported current obeys (D.8.7.9) only when the induced output record independently satisfies Definition D.8.7e: it is a finite irreducible stationary continuous-time Markov jump process and the observable is the registered antisymmetric jump current. Commutativity of $C(X)$ alone implies neither Markovianity nor stationarity.

*Proof.* The independent Definition D.8.7e entry supplies exactly the hypotheses of Theorem D.8.7f; apply that theorem. Without the entry, no TUR conclusion follows. ∎

**Conditional reciprocity identity.** Let $\Psi(\lambda_1,\ldots,\lambda_n)$ be one scalar value function on an open coordinate domain, with $\Psi\in C^2$, and define the response matrix $L_{ab}:=\partial_a\partial_b\Psi$. Then
$$
L_{ab}=L_{ba}
$$
by equality of mixed partial derivatives. A physical response matrix inherits this symmetry only after an accepted bridge identifies its entries with this Hessian in fixed coordinates and controls constraints, contact terms, frame choices, and time-reversal parity. In magnetic or other time-reversal-odd backgrounds the relevant relation may instead be Onsager--Casimir reciprocity. Detailed balance does not eliminate every antisymmetric response, and this identity does not make unrelated constants KKT multipliers of one optimization problem.

### D.8.8 Tropical Predictive Action

<a id="definition-d88a-finite-update-history-free-cost"></a>**Definition D.8.8a (Finite Update-History Free Cost).** Let $\mathcal H$ be a nonempty finite set of admissible update histories $\gamma$, each with predictive cost $C(\gamma)\in\mathbb R$. For $\beta>0$, define
$$
Z_\beta=\sum_{\gamma\in\mathcal H}e^{-\beta C(\gamma)}
$$
and the free predictive cost
$$
F_\beta=-\frac1\beta\log Z_\beta.
\tag{D.8.8.1}
$$

<a id="theorem-d88b-tropical-limit-of-predictive-action"></a>**Theorem D.8.8b (Tropical Limit of Predictive Action).** For a finite update-history family,
$$
\lim_{\beta\to\infty}F_\beta
=
\min_{\gamma\in\mathcal H}C(\gamma).
\tag{D.8.8.2}
$$
More precisely, if
$$
C_{\min}=\min_{\gamma}C(\gamma),
\qquad
m=\#\{\gamma:C(\gamma)=C_{\min}\},
\qquad
N=\#\mathcal H,
$$
then
$$
C_{\min}-\frac{\log N}{\beta}
\le
F_\beta
\le
C_{\min}-\frac{\log m}{\beta}.
\tag{D.8.8.3}
$$

*Proof.* Write
$$
Z_\beta
=
e^{-\beta C_{\min}}
\sum_{\gamma\in\mathcal H}
e^{-\beta(C(\gamma)-C_{\min})}.
$$
The sum contains exactly $m$ terms equal to $1$ and at most $N$ terms bounded by $1$, hence
$$
m
\le
\sum_{\gamma\in\mathcal H}
e^{-\beta(C(\gamma)-C_{\min})}
\le
N.
$$
Taking logarithms and multiplying by $-1/\beta$ gives (D.8.8.3). Letting $\beta\to\infty$ gives (D.8.8.2). ∎

<a id="corollary-d88c-least-action-shortest-paths-and-minimum-cuts-as-one-tropical-limit"></a>**Corollary D.8.8c (Least Action, Shortest Paths, and Minimum Cuts as One Tropical Limit).** Whenever a PU branch supplies a nonempty finite family of histories, paths or cuts with finite costs $C(\gamma)$, the limiting free cost is the least-cost value. Selection of an individual minimizing object requires uniqueness or a separate tie-breaking certificate. In this limit,
$$
\text{ordinary addition of weights becomes minimization,}
$$
and
$$
\text{ordinary multiplication of weights becomes addition of costs.}
$$

*Proof.* Theorem D.8.8b identifies the limiting free cost with the minimum of $C$. Products of weights satisfy
$$
e^{-\beta C_1}e^{-\beta C_2}
=
e^{-\beta(C_1+C_2)},
$$
so multiplication of weights corresponds to addition of costs. Sums of weights are dominated by the least exponent in the $\beta\to\infty$ limit, so addition of weights corresponds to minimization. ∎

### D.8.9 Strict Finite-Certificate Closure

**Remark D.8.9.0 (Global Ledger Anchor).** The strict PPI/PCE certificate object defined below is the local sector record consumed by the Global Strict-Certificate Ledger of Convention P.14.1k and the No-Overclaim Discipline of Convention P.14.1l. Theorem D.8.9b is the local closure theorem; Theorem D.8.9c is the acyclic compatible-tuple theorem; Corollary D.8.9d is the sectorwise closure criterion. Ambient realization retains the separate restriction-fiber gate of Theorem P.14.1k.3.

<a id="definition-d89a-strict-ppipce-certificate"></a>**Definition D.8.9a (Strict PPI/PCE Certificate).** For a sector $S$ with fixed parent data, a strict PPI/PCE certificate is a tuple
$$
\mathfrak C_S=(Q_S,\sim_S,\mathcal R_S,V_S,q_S^*,g_S,\Pi_S)
$$
with the following entries.

1. $Q_S$ is the finite or compact set of PPI-admissible finite-response candidates for $S$ at the fixed parent data.
2. $\sim_S$ is the operational equivalence relation generated by equality of all retained finite protocol-response presheaves in $\mathcal R_S$.
3. $\bar Q_S:=Q_S/\sim_S$ is finite or compact Hausdorff, and $V_S: \bar Q_S\to\mathbb R$ is lower semicontinuous.
4. $q_S^*\in\bar Q_S$ is the proposed retained sector value.
5. $g_S>0$ is a strict separation gap satisfying
$$
V_S(q)\ge V_S(q_S^*)+g_S
\qquad
\text{for all }q\in\bar Q_S\setminus\{q_S^*\}.
$$
6. $\Pi_S$ is the finite list of overlap maps to previously fixed sectors; $q_S^*$ satisfies all overlap equations in $\Pi_S$.

A sector is certificate-complete exactly when such a tuple has been supplied and every entry has the status required by Convention P.14.1a.

<a id="theorem-d89b-strict-certificate-implies-forced-sector-selection"></a>**Theorem D.8.9b (Strict Certificate Implies Forced Sector Selection).** If $\mathfrak C_S$ is a strict PPI/PCE certificate, then $q_S^*$ is the unique PCE-selected representative of $S$ modulo response equivalence. Moreover, for any perturbation $\Delta V$ on $\bar Q_S$ with $\lVert\Delta V\rVert_\infty<g_S/2$, the perturbed functional $V_S+\Delta V$ has the same unique minimizer $q_S^*$.

*Proof.* Since $\bar Q_S$ is finite or compact Hausdorff and $V_S$ is lower semicontinuous, the direct method gives at least one minimizer of $V_S$. The gap condition gives, for every $q\ne q_S^*$,
$$
V_S(q)>V_S(q_S^*),
$$
so no $q\ne q_S^*$ can be a minimizer. Thus $q_S^*$ is the unique minimizer on $\bar Q_S$. Because $\bar Q_S$ is the quotient by equality of all finite protocol responses, choosing any representative of $q_S^*$ gives the same physical sector, and any label outside that class either changes a retained response or is response-null surplus. For the perturbation claim, for $q\ne q_S^*$,
$$
(V_S+\Delta V)(q)-(V_S+\Delta V)(q_S^*)
\ge g_S-2\lVert\Delta V\rVert_\infty>0.
$$
Therefore $q_S^*$ remains the unique minimizer. ∎

**Attainment scope.** The finite-or-compact clause of Definition D.8.9a is the current sufficient attainment route. For a separately declared noncompact extension, a lower-semicontinuous real functional $V$ also attains its global minimum when one sublevel
$$
L_c:=\{q:V(q)\le c\}
$$
is nonempty and compact: $V$ attains a minimum on $L_c$, while every point outside $L_c$ has value greater than $c$. Such an extension must enter the compact-sublevel witness in its certificate; definability by itself supplies no attainment record.

**Strict-gap scope.** Item 5 in Definition D.8.9a implies attainment and uniqueness at the named class, but attainment and uniqueness do not imply item 5. On $\bar Q=[-1,1]$ with $V(x)=x^2$, the point $0$ is the unique attained minimizer, but
$$
\inf_{x\in[-1,1]\setminus\{0\}}\bigl(V(x)-V(0)\bigr)=0.
$$
For a continuous functional on a metric quotient, item 5 therefore forces the selected class to be isolated in the admissible domain. A lower-semicontinuous functional may instead carry a separately proved downward jump at the selected class. A positive gap outside a declared neighborhood is a weaker robustness statement and does not discharge the all-competitor gap in item 5.

**Boundary-certificate routing.** Suppose a sector is first reduced to a continuous residual $F:X\to\mathbb R^m$ on a closed set $X\subseteq\mathbb R^n$. If
$$
\inf_{x\in X}\lVert F(x)\rVert=0,
\qquad
F^{-1}(0)=\varnothing,
$$
then every residual-minimizing sequence eventually leaves each bounded subset of $X$; otherwise a bounded subsequence would converge in $X$ and continuity would produce a zero. For such a sequence $x_j$, the targets $y_j:=F(x_j)\to0$ make the perturbed equations $F(x)=y_j$ exactly feasible. An infeasibility-certificate class whose verdict is proved to persist under every sufficiently small right-hand-side perturbation therefore cannot certify $F(x)=0$ in this border case. This diagnostic applies after the finite-dimensional residual and closed domain are registered and classifies the proof method without promoting the sector's status.

**Quantitative polynomial-certificate scope.** Fix a polynomial presentation
$$
F=(f_1,\ldots,f_m):\mathbb R^n\to\mathbb R^m,
\qquad
\mu(R):=\min_{\lVert x\rVert\le R}\lVert F(x)\rVert_2,
$$
and suppose $\mu(R)>0$. Consider a ball-restricted identity certificate
$$
-1
=
\sigma_0(x)
+\sigma_1(x)\bigl(R^2-\lVert x\rVert^2\bigr)
+\sum_{i=1}^m\lambda_i(x)f_i(x),
$$
where $\sigma_0,\sigma_1$ are sums of squares and the $\lambda_i$ are polynomials. If
$$
L_R:=\max_i\sup_{\lVert x\rVert\le R}|\lambda_i(x)|,
$$
then evaluation at a minimizer $x_R$ gives
$$
1
\le
\left|\sum_i\lambda_i(x_R)f_i(x_R)\right|
\le
\sqrt m\,L_R\mu(R),
\qquad
L_R\ge\frac{1}{\sqrt m\,\mu(R)}.
$$
Thus, along any sequence with $\mu(R_j)=R_j^{-e+o(1)}$, the equality-multiplier norm is at least $R_j^{e-o(1)}/\sqrt m$. In fixed coordinates and a fixed monomial encoding, if every $\lambda_i$ has degree at most $D_R$ and coefficient $\ell^1$-norm at most $C_R$, then
$$
L_R\le C_R(1+R)^{D_R},
\qquad
\log C_R+D_R\log(1+R)
\ge
-\log\mu(R)-\tfrac12\log m.
$$
This is a representation-relative lower bound for the equality multipliers in the displayed certificate form. It is neither a coefficient-independent degree bound nor a lower bound on total proof size. Applying it to a PU sector requires a fixed residual normalization and encoding, a response-faithful sector reduction, and proofs that the zero set is empty while the residual infimum vanishes.

<a id="theorem-d89e-strict-gap-empirical-certificate-stability"></a>**Theorem D.8.9e (Strict-Gap Empirical Certificate Stability).** Let $S$ be a sector with strict PPI/PCE certificate $\mathfrak C_S$ and selected class $q_S^*$ in the sense of Definition D.8.9a. Let $\mathsf P_S$ be its nonempty finite retained protocol family, let $0\le L_S<\infty$ and $\varepsilon>0$, and set
$$
d_S(q,q')
:=
\max_{P\in\mathsf P_S}
\operatorname{TV}\bigl(R_P(q),R_P(q')\bigr).
\tag{D.8.9e.1}
$$
Assume that the certificate score is $L_S$-Lipschitz for this response distance,
$$
|V_S(q)-V_S(q')|
\le
L_S d_S(q,q')
\tag{D.8.9e.2}
$$
on the tested quotient family, and that an empirical score $\widehat V_S$ induced by empirical protocol frequencies satisfies
$$
\sup_{q\in\bar Q_S}|\widehat V_S(q)-V_S(q)|
\le
L_S\varepsilon.
\tag{D.8.9e.3}
$$
If
$$
2L_S\varepsilon<g_S,
\tag{D.8.9e.4}
$$
then $q_S^*$ remains the unique selected class for the empirical certificate score $\widehat V_S$.

A sufficient finite-sample condition for (D.8.9e.3), subject to the empirical-score calibration below, is the following. Let $m,N$ be positive integers and $0<\delta<1$. Suppose every retained protocol has at most $m$ outcomes and, for each $P\in\mathsf P_S$, the $N$ runs are independent and identically distributed with the declared response law $R_P$. Then the conservative bound
$$
N
\ge
\frac{m^2}{2\varepsilon^2}
\log\frac{2|\mathsf P_S|m}{\delta}
\tag{D.8.9e.5}
$$
implies uniform total-variation accuracy at scale $\varepsilon$ with probability at least $1-\delta$, whenever the empirical score is calibrated so that this uniform response error implies (D.8.9e.3). This supplies a sufficient robustness guarantee. When $L_S>0$, an observed response outside the $g_S/(2L_S)$ response tube is outside that guarantee; it does not by itself prove loss of the selected minimizer or failure of the strict certificate. A failed empirical-realization status requires a violation of a separately registered response, calibration, or acceptance condition after its declared tolerances are included.

*Proof.* The first claim is Theorem D.8.9b applied to the perturbation $\Delta V=\widehat V_S-V_S$, since (D.8.9e.3) gives $\lVert\Delta V\rVert_\infty\le L_S\varepsilon$ and (D.8.9e.4) is exactly the strict-gap stability condition $2\lVert\Delta V\rVert_\infty<g_S$.

For the sampling statement, Hoeffding's inequality bounds each empirical outcome-coordinate error, and a union bound over at most $|\mathsf P_S|m$ retained coordinates gives simultaneous coordinate control with probability at least $1-\delta$. The displayed value of $N$ is conservative enough to imply the required total-variation control for every retained protocol. These estimates establish a sufficient condition; failure of that condition has no converse implication for selection. For example, with two candidate scores $V(q_0)=0$ and $V(q_1)=g_S$, the perturbation $\Delta V(q_0)=3g_S/4$, $\Delta V(q_1)=0$ exceeds the $g_S/2$ sufficient radius while preserving $q_0$ as the unique minimizer. ∎

Theorem D.8.9b supplies strict-gap stability. The following instruments turn primitive implementation residuals into the calibrated score budget used by Theorem D.8.9e.

Use column-vector probability conventions. Let $S,S'$ be finite internal-state sets, $Y$ a finite recorded-outcome set, and $A$ a finite primitive-action set. Each action has a stochastic instrument matrix
$$
F_a:\mathbb R^S\longrightarrow\mathbb R^{Y\times S},
\qquad F'_a:\mathbb R^{S'}\longrightarrow\mathbb R^{Y\times S'}.
$$
All entries are nonnegative and each column sums to one. Failed, pending, and aborted outcomes are included in $Y$; they are not removed by conditioning. A stopped computation can be padded with an absorbing recorded state.

Let $J:\mathbb R^S\to\mathbb R^{S'}$ be stochastic. Define the primitive defect
$$
d_a=\max_{s\in S}\sum_{y,s'}
\left|\bigl[F'_aJ-(I_Y\otimes J)F_a\bigr]_{(y,s'),s}\right|.
\tag{D.8.9e.6.1}
$$
Thus every defect is a finite column-sum calculation. Let $p_0,p'_0$ be normalized initial laws with $\|p'_0-Jp_0\|_1\le\varepsilon_0$. A shared adaptive policy chooses its next primitive from the complete earlier outcome history, using the same conditional action probabilities in both models.

<a id="theorem-d89e6-adaptive-transcript-transfer"></a>**Theorem D.8.9e.6 (Adaptive transcript transfer).** For a protocol of at most $n$ steps, suppose $d_a\le\varepsilon_t$ for every action that the policy can request at step $t$. Let $p_t,p'_t$ denote the joint history/internal-state laws. Then
$$
\left\|p'_t-(I_{Y^t}\otimes J)p_t\right\|_1
\le\varepsilon_0+\sum_{i=1}^t\varepsilon_i.
\tag{D.8.9e.6.2}
$$
In particular, the total variation distance between full recorded histories is at most
$$
\beta_n=\min\left\{1,\frac12\left(\varepsilon_0+
\sum_{i=1}^n\varepsilon_i\right)\right\}.
\tag{D.8.9e.6.3}
$$
The conclusion remains valid for arbitrary initial correlations with an untouched finite reference register $R$, provided the initial error bound is imposed on the joint laws:
$$
\|p'_{0,S'R}-(J\otimes I_R)p_{0,SR}\|_1\le\varepsilon_0.
$$
An error bound on internal-state marginals alone does not control their correlations with a reference.

*Proof.* A stochastic matrix $T$ contracts the $\ell^1$ norm: by its nonnegative entries and column sums,
$\|Tv\|_1\le\sum_{i,j}T_{ij}|v_j|=\|v\|_1$.
At history $h$, a randomized policy replaces $F_a$ by its convex combination with the policy probabilities. Its defect is bounded by the same convex combination of $d_a$, hence by $\varepsilon_t$. The corresponding history-controlled update $T_t$, and its primed version, are stochastic on the direct sums of history blocks. Their intertwining defect applied to the positive block $p_{t-1}(h,\cdot)$ has norm at most $\varepsilon_t$ times that block's mass. Summing over histories gives a total defect at most $\varepsilon_t$.

Insert and subtract $T'_t(I\otimes J)p_{t-1}$. Contractivity bounds the propagated old error, while the preceding defect estimate bounds the new error. Thus $e_t\le e_{t-1}+\varepsilon_t$, proving (D.8.9e.6.2) by induction. Marginalizing internal states is stochastic, and $J$ preserves their total mass, giving (D.8.9e.6.3). For a reference register, tensor every matrix with its identity. The maximum column-sum defect is unchanged, so the same proof applies to correlated initial laws. $\square$

<a id="corollary-d89e6a-readout-and-calibration"></a>**Corollary D.8.9e.6a (Readout and calibration).** Let final readout matrices $R_h,R'_h$ have a common output alphabet $Z$, and suppose
$\max_h\|R'_hJ-R_h\|_{1\to1}\le\eta$.
The joint history/readout distance is bounded by
$$
\beta=\min\left\{1,\frac{\varepsilon_0+\sum_i\varepsilon_i+\eta}{2}\right\}.
\tag{D.8.9e.6.4}
$$
If the two implementations assign numerical readings $f,f'$ to corresponding transcripts, with $\|f'-f\|_\infty\le\zeta$, then
$$
\left|\mathbb E_{P'}f'-\mathbb E_Pf\right|
\le\operatorname{osc}(f)\,\beta+\zeta,
\quad\operatorname{osc}(f)=\max f-\min f.
\tag{D.8.9e.6.5}
$$

*Proof.* The additional readout is one more stochastic step with defect $\eta$. For (D.8.9e.6.5), first compare both laws using $f$, subtract the constant $(\max f+\min f)/2$, and bound by half its oscillation times the $\ell^1$ distance. The difference between $f'$ and $f$ contributes at most $\zeta$. $\square$

Corresponding numerical readings must refer to the same observable, unit, clock, source condition, and retained event. A different ruler or clock can enter (D.8.9e.6.5) only through an established $\zeta$ bound on the stated finite domain. Equality of raw output labels does not establish that calibration bound.

**Reference-stable quantum transport.**

<a id="theorem-d89e7-finite-quantum-instrument-transport"></a>**Theorem D.8.9e.7 (Finite quantum-instrument transport).** Replace the stochastic instruments by finite-dimensional CPTP maps into a classical outcome register and a retained quantum memory. Let $J$ be a CPTP encoding between the two memories. Assume each primitive defect satisfies, for every finite reference $R$ and every normalized joint input $\rho$,
$$
\left\|\left([F'_aJ-(I_Y\otimes J)F_a]\otimes I_R\right)(\rho)\right\|_1
\le\varepsilon_t.
\tag{D.8.9e.6.6}
$$
Suppose the initial encoded-state error is at most $\varepsilon_0$, and the final complete-readout defect is at most $\eta$, in the same reference-stable sense. Use the same classical-history adaptive controller in both models, choosing only from the certified primitive family; every additional operation touching encoded memory must have its own intertwining bound. Every such finite adaptive protocol, including its retained controller memory and an arbitrary untouched reference, has final state trace-norm error at most
$$
\varepsilon_0+\sum_{t=1}^n\varepsilon_t+\eta.
\tag{D.8.9e.6.7}
$$
Consequently every common final measurement has total variation error bounded by (D.8.9e.6.4). A primitive diamond-norm bound $\varepsilon_t$ is sufficient for (D.8.9e.6.6). With exact preparation/readout and a uniform primitive bound $\varepsilon$, the transcript bound is $\min\{1,n\varepsilon/2\}$.

*Proof.* A positive trace-preserving map contracts the trace norm on Hermitian inputs: write $X=X_+-X_-$ and use
$\|\Phi(X)\|_1\le\operatorname{Tr}\Phi(X_+)+\operatorname{Tr}\Phi(X_-)=\|X\|_1$.
CPTP maps retain this property after tensoring a reference identity. Classical history blocks have additive trace norm. Apply (D.8.9e.6.6) to each normalized positive history block and multiply by its mass. Their total mass is one. The insertion-and-subtraction induction of D.8.9e.6 therefore gives (D.8.9e.6.7), including adaptive choices and retained memory. Measurement is CPTP, so its classical $\ell^1$ error obeys the same bound. $\square$

The reference-stable defect is an explicit hypothesis about whole outcome-labeled instruments. Bounds on selected outcomes or on normalized postselected states do not suffice. In finite dimensions a diamond-norm bound is a finite matrix optimization; a supplied rational or interval certificate must verify its claimed upper bound. When a unitary implementation obeys $\|U-V\|\le r$, its induced channel defect is at most $2r$: expand $U\rho U^\dagger-V\rho V^\dagger$ into two terms and apply the trace-norm product bound, also with a reference. Thus the source's $2\sum_j r_j$ whole-instrument estimate has the same normalization as (D.8.9e.6.7).

**Selection transported through complete candidate classes.**

<a id="theorem-d89e8-transported-strict-gap-stability"></a>**Theorem D.8.9e.8 (Transported strict-gap stability).** Let $\bar Q,\bar Q'$ be complete compared response-quotient candidate classes, with a bijection $\phi:\bar Q\to\bar Q'$. A representative-level bijection induces such a quotient bijection when it preserves and reflects response equivalence. Let real objectives $V,V'$ obey
$$
\sup_{q\in\bar Q}|V'(\phi(q))-V(q)|\le\delta.
$$
Suppose $q_*\in\bar Q$ has gap $g>0$:
$$
V(q)\ge V(q_*)+g\qquad(q\ne q_*).
$$
Then every target competitor satisfies
$$
V'(\phi(q))-V'(\phi(q_*))\ge g-2\delta.
\tag{D.8.9e.6.8}
$$
If $2\delta<g$, $\phi(q_*)$ is the unique target minimizer with gap at least $g-2\delta$.

*Proof.* Write each target value as its source value plus an error of magnitude at most $\delta$, and subtract. Surjectivity covers every target competitor; injectivity distinguishes it from the selected class. The strict positive lower bound proves the conclusion directly. $\square$

The constant two cannot be reduced uniformly. Two source candidates with values $0,g$, perturbed respectively by $+\delta,-\delta$, have target gap exactly $g-2\delta$. At $2\delta=g$, a tie is possible. Small response error alone does not prove the required quotient bijection: arbitrarily small nonzero response changes can split exact equivalence classes.

<a id="corollary-d89e8a-finite-response-to-selection-budget"></a>**Corollary D.8.9e.8a (Finite response-to-selection budget).** Suppose uniformly over the candidate classes the objectives have the same calibrated form
$$
V(q)=C(q)+\sum_{j=1}^m w_j\mathbb E_{P_{q,j}}f_j,
\qquad
V'(\phi(q))=C'(\phi(q))+\sum_{j=1}^m w_j\mathbb E_{P'_{\phi(q),j}}f'_j.
$$
Assume $|C'(\phi(q))-C(q)|\le c$, transcript errors $\beta_j$ from D.8.9e.6 or D.8.9e.7, and calibration errors $\|f'_j-f_j\|_\infty\le\zeta_j$. Then D.8.9e.8 applies with
$$
\delta=c+\sum_{j=1}^m|w_j|
\left[\operatorname{osc}(f_j)\beta_j+\zeta_j\right].
\tag{D.8.9e.6.9}
$$

*Proof.* Apply (D.8.9e.6.5) to each score and sum absolute errors. $\square$

This specializes the source's strict-gap stability result by deriving its score perturbation from primitive implementation, preparation, readout, and calibration residuals. The cost bound $c$ includes the complete compared resource ledger; uncounted controller or archive costs cannot be absorbed by declaring them zero.

**Transfer of the source's calibrated CC reader.**

<a id="theorem-d89e9-bias-norm-transport-on-a-fixed-reader-domain"></a>**Theorem D.8.9e.9 (Bias-norm transport on a fixed reader domain).** Let $\mathcal D$ be the common nonempty admitted input/effect/protocol domain. For a neutral setting and an active setting let $p_0(d),p_1(d)$, $d\in\mathcal D$, be source event probabilities, and let $p'_0(d),p'_1(d)$ be their target counterparts. Suppose
$$
\sup_d|p'_i(d)-p_i(d)|\le\beta_i\quad(i=0,1).
$$
Define $\alpha=\sup_d|p_1(d)-p_0(d)|$ and the corresponding $\alpha'$. Then
$$
|\alpha'-\alpha|\le\beta_0+\beta_1.
\tag{D.8.9e.6.10}
$$

*Proof.* For each $d$, the difference between the two absolute bias values is bounded by $|p'_1-p_1|+|p'_0-p_0|$. Taking suprema in both directions proves (D.8.9e.6.10). $\square$

For the enabled nominal probe reader of Theorem 9.7n, $\alpha=1/4$. Thus an implementation meeting D.8.9e.6 or D.8.9e.7 on exactly that input/effect domain has
$$
\alpha'\in[\max\{0,1/4-\beta_0-\beta_1\},
\min\{1,1/4+\beta_0+\beta_1\}].
$$
For the phase-controller probe channel of Theorem 9.7o.1 with response $\alpha=q/4$, replace $1/4$ by $q/4$. The same finite error record then transports the entire declared controller family when its bounds are uniform in $q$. Retaining an environment or sign record does not identify the designated probe norm with the norm of the full archive channel; these are separately specified reader domains.

<a id="theorem-d89c-acyclic-gluing-of-strict-certificates"></a>**Theorem D.8.9c (Acyclic Gluing of Strict Certificates).** Let $S_1,\ldots,S_N$ be sectors ordered by an acyclic dependency graph. Suppose each $S_j$ has a strict certificate
$$
\mathfrak C_{S_j}=(Q_{S_j},\sim_{S_j},\mathcal R_{S_j},V_{S_j},q_{S_j}^*,g_{S_j},\Pi_{S_j})
$$
conditional only on parent values among $S_1,\ldots,S_{j-1}$, and suppose every overlap map in $\Pi_{S_j}$ is satisfied by the previously selected parent tuple. Then the product branch has a unique global PPI/PCE-selected tuple
$$
(q_{S_1}^*,\ldots,q_{S_N}^*)
$$
modulo response equivalence.

*Proof.* Induct on $j$. For $j=1$, Theorem D.8.9b gives a unique selected quotient class $q_{S_1}^*$. Assume $q_{S_1}^*,\ldots,q_{S_{j-1}}^*$ are uniquely fixed. The certificate for $S_j$ is evaluated at these fixed parent data; its overlap equations are satisfied by hypothesis, and Theorem D.8.9b gives a unique selected quotient class $q_{S_j}^*$. The dependency graph is acyclic, so no later sector can alter an earlier parent value; later sectors may only fail an overlap equation, in which case the product branch is inadmissible, or satisfy it, in which case the already selected value remains fixed. After $N$ steps the tuple is unique. ∎

<a id="theorem-d89c1-affine-cycle-consistency-audit-for-selected-sector-overlaps"></a>**Theorem D.8.9c.1 (Affine Cycle-Consistency Audit for Selected Sector Overlaps).** Let $G=(V,E)$ be a connected finite comparison graph with $|V|\ge2$, and let $y\in\mathcal H^E$ be the overlap record obtained after the sector representatives have already been selected by the existing acyclic certificate stack and transported into one nonzero finite-dimensional real inner-product space $\mathcal H$. Assume the overlap transports are flat and gauge-trivialized. The audit asks whether there are common-chart vertex coordinates $q_i$ such that an oriented edge $e:i\to j$ obeys
$$
q_j-q_i=y_e.
\tag{D.8.9c.1.1}
$$
Let
$$
D:\mathcal H^V\to\mathcal H^E,
\qquad
(Dq)_e=q_j-q_i,
\qquad
\Delta=D^*D.
\tag{D.8.9c.1.2}
$$
Then:

1. a global glued tuple exists if and only if
$$
y\in\operatorname{im}D
\quad\Longleftrightarrow\quad
P_{\ker D^*}y=0
\quad\Longleftrightarrow\quad
\sum_{e\in\gamma}\operatorname{sgn}_\gamma(e)y_e=0
\tag{D.8.9c.1.3}
$$
for every cycle $\gamma$; checking a cycle basis is sufficient;
2. solutions are unique up to one global translation in $\mathcal H$; this translation must be response-null or fixed by an accepted root datum, and a root or mean-zero gauge then makes the audit solution unique;
3. every noisy overlap record has the orthogonal decomposition
$$
y=y_{ex}+h,
\qquad
y_{ex}=D\Delta^+D^*y,
\qquad
h=(I-D\Delta^+D^*)y\in\ker D^*,
\tag{D.8.9c.1.4}
$$
and $\|h\|$ is exactly the least attainable overlap residual;
4. the mean-zero least-squares correction $q_*=\Delta^+D^*y$ obeys
$$
\|q_*\|
\le
\frac{\|y_{ex}\|}{\sqrt{\lambda_{\mathrm{gap}}(\Delta)}},
\tag{D.8.9c.1.5}
$$
where $\lambda_{\mathrm{gap}}(\Delta):=\min(\operatorname{spec}\Delta\setminus\{0\})$, equivalently the scalar graph-Laplacian $\lambda_2$.

*Proof.* The finite graph Hodge decomposition gives
$$
\mathcal H^E=\operatorname{im}D\oplus\ker D^*.
$$
Exactness is therefore equivalent to vanishing harmonic/cycle projection, which is equivalent to zero signed sum on a cycle basis. Connectedness gives $\ker D$ as the constant vertex fields, proving uniqueness modulo global translation. Orthogonal projection onto $\operatorname{im}D$ gives (D.8.9c.1.4) and its least-squares interpretation. On the orthogonal complement of the constant vertex fields, $\Delta\succeq\lambda_{\mathrm{gap}}(\Delta)I$; singular-value inversion gives (D.8.9c.1.5). ∎

<a id="remark-d89c2-scope-audit-not-cyclic-selection"></a>**Remark D.8.9c.2 (Scope: Audit, Not Cyclic Selection).** Theorem D.8.9c.1 audits compatibility only after local representatives have been selected. It does not remove the acyclicity requirement on PU's parent-dependency graph and does not prove a fixed point for cyclic parent-dependent certificate selection. Non-flat or nonabelian overlap maps require twisted cohomology or ordered holonomy; applying the ordinary incidence formulas there is not licensed.

<a id="theorem-d89c3-finite-ordered-holonomy-audit-for-selected-group-overlaps"></a>**Theorem D.8.9c.3 (Finite Ordered-Holonomy Audit for Selected Group Overlaps).** Let $\Gamma=(V,E)$ be a connected finite graph, choose an orientation of each edge, and let $G$ be a finite group with exact multiplication and equality. Give every oriented edge $u\to v$ a label $g_{vu}\in G$ and the reverse traversal the label $g_{uv}=g_{vu}^{-1}$. Assume that local representatives have already been selected and that their overlap equations are
$$
h_v=g_{vu}h_u,
\qquad h_u\in G.
\tag{D.8.9c.3.1}
$$
For a closed walk $\gamma=(v_0,v_1,\ldots,v_m=v_0)$ define its ordered holonomy by
$$
\operatorname{Hol}(\gamma)
=
g_{v_0v_{m-1}}\cdots g_{v_2v_1}g_{v_1v_0}.
\tag{D.8.9c.3.2}
$$
Then the following statements hold.

1. Equation (D.8.9c.3.1) has a solution if and only if $\operatorname{Hol}(\gamma)=1_G$ for every cycle $\gamma$.
2. For any spanning tree $T\subseteq\Gamma$, it is sufficient to test the fundamental cycle associated with each chord $e\in E\setminus T$.
3. When a solution exists, its solution set is one free and transitive right $G$-orbit: if $h$ is one solution, every solution is uniquely $h'_v=h_vk$ for one $k\in G$.
4. Tree propagation from a fixed root terminates after finitely many group operations and returns either a solution or the first chord whose fundamental-cycle holonomy is nonidentity.

*Proof.* Fix a root $r$, set $h_r=1_G$, and propagate (D.8.9c.3.1) along the unique tree path from $r$ to each vertex. Every tree equation then holds. For a chord $u\to v$, its equation holds exactly when the product around the chord and the two tree paths is $1_G$. These are precisely the fundamental-cycle tests, and every closed walk reduces to a product of conjugates of fundamental cycles and their inverses, proving items 1 and 2. If $h$ and $h'$ are solutions, then along every edge
$$
h_v^{-1}h'_v=h_u^{-1}h'_u.
$$
Connectedness makes this ratio one constant $k$, which proves item 3. A finite spanning tree and finite chord set give the terminating algorithm and exact obstruction witness in item 4. ∎

The admitted class is nonempty. For the $S_3$ triangle with $g_{10}=(01)$, $g_{21}=(12)$, and $g_{20}=(12)(01)$, tree propagation succeeds. Replacing $g_{20}$ by $1_{S_3}$ returns a nonidentity fundamental-cycle obstruction. Proposition F.10.12h executes both fixtures exactly. This theorem completes the selected finite-group overlap audit. Cyclic parent-dependent selection remains the fixed-point problem named in Remark D.8.9c.2; continuous-group or module-valued twisted-cohomology cases require their own exact carrier; and ambient realization remains the restriction-fiber gate of Theorem P.14.1k.3.

<a id="theorem-d89c4-cyclic-parent-dependent-selection-as-feedback-fixed-points"></a>**Theorem D.8.9c.4 (Cyclic Parent-Dependent Selection as Feedback Fixed Points).** Let $\mathsf G=(\mathsf V,\mathsf A)$ be a finite directed dependency graph on sectors $S_v$, $v\in\mathsf V$, with an arc $u\to v$ when $S_u$ is a parent of $S_v$; directed cycles are allowed. For each $v$ let $\bar Q_v$ be a nonempty set of response classes and write $\bar Q_{\mathrm{pa}(v)}:=\prod_{u\in\mathrm{pa}(v)}\bar Q_u$. Suppose that at every parent tuple $p\in\bar Q_{\mathrm{pa}(v)}$ the sector $S_v$ carries a strict certificate in the sense of Definition D.8.9a with selected class $\sigma_v(p)$. A *global selection* is a tuple $q\in\prod_v\bar Q_v$ with
$$
q_v=\sigma_v\bigl(q_{\mathrm{pa}(v)}\bigr)\qquad\text{for every }v\in\mathsf V
\tag{D.8.9c.4.1}
$$
that satisfies every registered overlap equation. Let $F\subseteq\mathsf V$ be a feedback vertex set, so that $\mathsf G-F$ is acyclic, and define $\Phi_F:\prod_{f\in F}\bar Q_f\to\prod_{f\in F}\bar Q_f$ by propagating $q_F$ through $\mathsf G-F$ in a topological order and setting $\Phi_F(q_F)_f:=\sigma_f(q_{\mathrm{pa}(f)})$. Then:

1. restriction $q\mapsto q_F$ is a bijection from the solutions of (D.8.9c.4.1) onto the fixed-point set $\operatorname{Fix}\Phi_F$, and the global selections correspond to the fixed points whose propagated tuples satisfy the overlap equations;
2. for a directed cycle $S_1\to S_2\to\cdots\to S_N\to S_1$ without further parents, $F=\{S_1\}$ and $\Phi_F=\sigma_1\circ\sigma_N\circ\cdots\circ\sigma_2$;
3. for every integer $m\ge0$ there is a two-sector cycle with strict certificates at every parent value and exactly $m$ global selections;
4. when every $\bar Q_f$ with $f\in F$ is finite, evaluating $\Phi_F$ on $\prod_{f\in F}\bar Q_f$ and testing the overlaps terminates and returns every global selection, or certifies that none exists;
5. if $\prod_{f\in F}\bar Q_f$ is a complete metric space on which $\Phi_F$ is a contraction with constant $\theta<1$, then (D.8.9c.4.1) has exactly one solution and the iterates of $\Phi_F$ from any start converge to its feedback coordinates with error $O(\theta^k)$; if it is a complete lattice on which $\Phi_F$ is order-preserving, the solutions of (D.8.9c.4.1) form a nonempty complete lattice in the order of their feedback coordinates.

Strict local certificates therefore determine neither existence nor uniqueness of a global selection on a cyclic dependency graph; the feedback map $\Phi_F$ together with the overlap test decides both.

*Proof.* Item 1. For a solution $q$ of (D.8.9c.4.1), every $v\notin F$ has its parents in $F$ or earlier in the topological order of $\mathsf G-F$, so $q_v$ is determined by $q_F$ through propagation, and the equations at $f\in F$ state $\Phi_F(q_F)=q_F$. Conversely the propagation of a fixed point satisfies every equation. Hence restriction is injective with image $\operatorname{Fix}\Phi_F$. Item 2 is item 1 for this graph. Item 3. Let $\bar Q_1=\bar Q_2=\{0,1,\ldots,m+1\}$, let $\sigma_2$ be the identity, and let $\sigma_1$ fix $0,\ldots,m-1$ and exchange $m$ and $m+1$. The functionals $V_v(q;p):=0$ for $q=\sigma_v(p)$ and $V_v(q;p):=1$ otherwise are strict certificates with gap $1$ on these finite quotients, there are no overlap equations, and by item 2 the global selections correspond to the $m$ fixed points of $\sigma_1$. Item 4 is a finite search. Item 5 follows from item 1 with the Banach and Tarski fixed-point theorems. ∎

<a id="theorem-d89c5-twisted-general-group-and-linear-fiber-overlap-audits"></a>**Theorem D.8.9c.5 (Twisted, General-Group and Linear-Fiber Overlap Audits).** Let $\Gamma=(V,E)$ be a connected finite graph with an orientation of each edge, a spanning tree $T$ and a root $r$.

1. **Bijective carriers.** Let sets $X_v$ carry bijections $\tau_e:X_u\to X_v$ for oriented edges $e:u\to v$, with reverse traversal $\tau_e^{-1}$, and overlap equations $q_v=\tau_e(q_u)$. Let $P_v:X_r\to X_v$ be the composite along the tree path from $r$ to $v$, and for each chord $e:u\to v$ put $\operatorname{Hol}_e:=P_v^{-1}\circ\tau_e\circ P_u$. Then $q\mapsto q_r$ is a bijection from the solution set onto $\bigcap_{e\in E\setminus T}\operatorname{Fix}(\operatorname{Hol}_e)$.
2. **Twisted affine carriers.** If every $X_v$ is one finite-dimensional real inner-product space $\mathcal H$ and every $\tau_e(x)=A_ex+b_e$ is affine and invertible, then every $\operatorname{Hol}_e(x)=H_ex+h_e$ is affine and the solution set corresponds to
$$
\mathcal S=\bigl\{x\in\mathcal H:(H_e-I)x=-h_e\ \text{for every chord }e\bigr\},
\tag{D.8.9c.5.1}
$$
an affine subspace. It is nonempty exactly when the stacked system is consistent; otherwise some family $(y_e)$ with $\sum_e(H_e-I)^{\mathsf T}y_e=0$ and $\sum_e\langle y_e,h_e\rangle\ne0$ exists and certifies the obstruction. A nonempty $\mathcal S$ has dimension $\dim\bigcap_e\ker(H_e-I)$, so the glued tuple is unique exactly when this intersection is zero. For exact rational or number-field data, Gaussian elimination decides both properties in finitely many exact operations. When every $A_e=I$, each $H_e=I$ and $h_e$ is the signed sum of the translations around the fundamental cycle of $e$, so $\mathcal S$ is empty or all of $\mathcal H$, as in Theorem D.8.9c.1.
3. **General groups.** Items 1–3 of Theorem D.8.9c.3 hold for every group $G$, finite or infinite, and item 4 holds whenever multiplication, inversion and equality in $G$ are exactly computable.
4. **Quantitative bi-invariant audit.** If $G$ carries a bi-invariant metric $\rho$, for instance a compact Lie group with a bi-invariant Riemannian metric, and $\operatorname{def}(h):=\max_{e:u\to v}\rho(h_v,g_{vu}h_u)$ for $h\in G^V$, then
$$
\sup_\gamma\frac{\rho\bigl(\operatorname{Hol}(\gamma),1_G\bigr)}{|\gamma|}
\le
\inf_{h\in G^V}\operatorname{def}(h)
\le
\max_{e\in E\setminus T}\rho\bigl(\operatorname{Hol}(\gamma_e),1_G\bigr),
\tag{D.8.9c.5.2}
$$
where $\gamma$ ranges over closed walks of length $|\gamma|\ge1$, $\gamma_e$ is the fundamental cycle of the chord $e$, and tree propagation attains the upper bound.
5. **Linear restriction fibers.** Let the ambient candidates form a finite-dimensional real inner-product space $\mathcal A$ with affine restriction map $\operatorname{res}(a)=Ra+c$ into the tuple space, and let $q^*$ be the selected compatible tuple. The fiber $\operatorname{res}^{-1}(q^*)$ is nonempty exactly when $q^*-c\in\operatorname{im}R$; otherwise some $y\in\ker R^{\mathsf T}$ has $\langle y,q^*-c\rangle\ne0$ and certifies the obstruction. A nonempty fiber is a singleton exactly when $\ker R=\{0\}$. For a finite ambient candidate set the fiber is obtained by enumeration.

On a triangle whose two tree edges carry the identity of $\mathcal H=\mathbb R^2$ and whose chord carries $x\mapsto Hx+h$, the rotation $H=J$ by $\pi/2$ gives the single glued tuple determined by $(I-J)^{-1}h$; the reflection $H=\operatorname{diag}(1,-1)$ gives the line $\{x_2=h_2/2\}$ when $h_1=0$, and the empty set, certified by $y=(1,0)$, when $h_1\ne0$.

*Proof.* Item 1. The tree equations force $q_v=P_v(q_r)$, and a chord equation $q_v=\tau_e(q_u)$ then reads $P_v(q_r)=\tau_e(P_u(q_r))$, that is, $q_r\in\operatorname{Fix}(\operatorname{Hol}_e)$; conversely every common fixed point propagates to a solution. Item 2. Composites and inverses of invertible affine maps are affine, so each chord condition is the linear system in (D.8.9c.5.1). For the stacked matrix $M$ with blocks $H_e-I$ and the stacked vector $h$, the Fredholm alternative $\operatorname{im}M=(\ker M^{\mathsf T})^\perp$ gives consistency exactly when $h\perp\ker M^{\mathsf T}$, which is the stated certificate, and a nonempty solution set is a translate of $\ker M=\bigcap_e\ker(H_e-I)$. In the flat case the holonomy of a chord is translation by the signed sum of the translations around its fundamental cycle, which recovers (D.8.9c.1.3) and uniqueness modulo global translation. Item 3. The proof of Theorem D.8.9c.3 uses only the group axioms; finiteness of $G$ enters only through exact decidability in its item 4. Item 4. Tree propagation from $h_r=1_G$ makes every tree edge exact, and for a chord $e:u\to v$ the ordered holonomy of $\gamma_e$ based at $r$ is $h_v^{-1}g_{vu}h_u$, so left invariance gives $\rho(h_v,g_{vu}h_u)=\rho(\operatorname{Hol}(\gamma_e),1_G)$; this is the upper bound. For the lower bound let $h\in G^V$ and $\gamma=(v_0,\ldots,v_m=v_0)$, and put $\varepsilon_i:=h_{v_{i+1}}^{-1}g_{v_{i+1}v_i}h_{v_i}$. Left invariance gives $\rho(\varepsilon_i,1_G)=\rho(g_{v_{i+1}v_i}h_{v_i},h_{v_{i+1}})\le\operatorname{def}(h)$, also for edges traversed against their orientation, because $\rho(h_u,g_{vu}^{-1}h_v)=\rho(g_{vu}h_u,h_v)$. The product telescopes to $\varepsilon_{m-1}\cdots\varepsilon_0=h_{v_0}^{-1}\operatorname{Hol}(\gamma)h_{v_0}$, and bi-invariance with the triangle inequality gives $\rho(\operatorname{Hol}(\gamma),1_G)=\rho(\varepsilon_{m-1}\cdots\varepsilon_0,1_G)\le\sum_i\rho(\varepsilon_i,1_G)\le m\operatorname{def}(h)$. Item 5 is the Fredholm alternative $\operatorname{im}R=(\ker R^{\mathsf T})^\perp$ together with $\operatorname{res}^{-1}(q^*)=a_0+\ker R$ for any $a_0$ in the fiber. The displayed instances follow from (D.8.9c.5.1), because $J-I$ is invertible and $\operatorname{diag}(1,-1)-I=\operatorname{diag}(0,-2)$. ∎

<a id="theorem-d89c6-continuous-parent-rigidity-of-strict-selection"></a>**Theorem D.8.9c.6 (Continuous-Parent Rigidity of Strict Selection).** Let $P$ be connected and $Q$ a fixed nonempty candidate set. Suppose every $V_p:Q\to\mathbb R$ has a selected point $\sigma(p)$ and an all-competitor gap $g(p)>0$, and $p\mapsto V_p$ is continuous in the uniform norm. Then $\sigma$ is locally constant and hence constant. A uniform positive lower bound on all $g(p)$ is unnecessary.

*Proof.* At $p_0$, uniform continuity in $p$ gives a neighborhood with $\sup_q|V_p(q)-V_{p_0}(q)|<g(p_0)/3$. For $q\ne\sigma(p_0)$ this implies $V_p(q)-V_p(\sigma(p_0))\ge g(p_0)/3>0$, so the selected point stays fixed. Its fibers are open, and complements are unions of other open fibers; connectedness permits one nonempty fiber. ∎

For compact $Q$, jointly continuous $V:Q\times P\to\mathbb R$ has the required uniform parent continuity by a finite-cover argument on $Q$. On a finite sector graph whose parent-product spaces are connected, these hypotheses on each fixed candidate quotient make every selector constant and give exactly one solution of the selection equations. The resulting tuple still passes the registered overlap and ambient-fiber tests. Nonconstant parent response therefore requires a disconnected parent branch, a changing candidate quotient, loss of the all-competitor gap, or failure of uniform parent continuity. The example $Q=\{0,1\}$, $P=[0,1]$, $V_p(0)=p$, $V_p(1)=p+1$ shows nonvacuity.

<a id="theorem-d89c7-cyclic-gain-and-componentwise-error-certificate"></a>**Theorem D.8.9c.7 (Cyclic Gain and Componentwise Error Certificate).** Let finitely many nonempty complete metric spaces $Q_i$ carry selectors with
$$
d_i(\sigma_i(x),\sigma_i(y))\le\sum_jB_{ij}d_j(x_j,y_j),\qquad B\ge0,\quad\rho(B)<1,
$$
where nonparent entries are zero. The selection equations have a unique solution $q^*$. For every approximate tuple $\widehat q$, put $\varepsilon_i=d_i(\widehat q_i,\sigma_i(\widehat q))$. Then
$$
(d_i(\widehat q_i,q_i^*))_i\le(I-B)^{-1}\varepsilon.
\tag{D.8.9c.7.1}
$$

*Proof.* The nonnegative series $(I-B)^{-1}=\sum_{m\ge0}B^m$ converges. For $w=(I-B)^{-1}\mathbf1$, $Bw=w-\mathbf1$ and $w_i\ge1$. The complete product metric $d_w(x,y)=\max_i d_i(x_i,y_i)/w_i$ has contraction factor $\max_i(Bw)_i/w_i<1$. Geometric convergence of iterates gives the fixed point and uniqueness. The triangle inequality yields $d\le\varepsilon+Bd$ for the error vector; iteration and $B^md\to0$ prove (D.8.9c.7.1). ∎

If a selector minimizes a $C^2$ objective $\phi_i(z;p)$ on a fixed compact convex Euclidean set, with $\nabla^2_{zz}\phi_i\succeq\mu_iI$, $\mu_i>0$, and $\|\partial_{p_j}\nabla_z\phi_i\|\le K_{ij}$ along all segments in a convex parent product, then $B_{ij}=K_{ij}/\mu_i$ is valid. Indeed the two minimizing variational inequalities give $\langle\nabla\phi_i(x;p)-\nabla\phi_i(y;p'),x-y\rangle\le0$. Strong monotonicity bounds the fixed-parent part below by $\mu_i|x-y|^2$, and integration of the cross derivatives bounds the remaining part by $\sum_jK_{ij}|p_j-p_j'|\,|x-y|$. Division proves the gain estimate. This smooth route gives a distance-dependent gap; a registered strict certificate additionally supplies Definition D.8.9a's positive all-competitor gap.

<a id="theorem-d89c8-nonlinear-restriction-fiber-certificate"></a>**Theorem D.8.9c.8 (Nonlinear Restriction-Fiber Certificate).** Let $F:U\subset\mathbb R^m\to\mathbb R^m$ be $C^1$ on an open set, and let the closed sup-norm ball $K=\{a:|a-a_0|_\infty\le r\}$ lie in $U$. Suppose an invertible matrix $C$ and certified bounds satisfy
$$
\sup_{a\in K}\|I-CDF(a)\|_\infty\le\kappa<1,\quad
\delta=\|C(F(a_0)-q)\|_\infty,\quad\delta+\kappa r\le r.
$$
Then $F^{-1}(q)\cap K$ has exactly one point, at distance at most $\delta/(1-\kappa)$ from $a_0$.

*Proof.* The map $T(a)=a-C(F(a)-q)$ is $\kappa$-Lipschitz on the convex ball and $\|T(a)-a_0\|_\infty\le\kappa r+\delta\le r$. Its unique contraction fixed point solves $F(a)=q$ by invertibility of $C$. Substitution of its actual displacement into the same inequality proves the error bound. ∎

Global uniqueness additionally requires coverage outside $K$. For an overdetermined restriction map, every output equation omitted from $F$ is a separate compatibility test.

<a id="proposition-d89c9-a-continuous-nonlinear-strict-cycle-and-its-global-fibers"></a>**Proposition D.8.9c.9 (A Continuous Nonlinear Strict Cycle and Its Global Fibers).** Take $Q_1=Q_2=[0,1]$ with equality as retained-response equivalence, no extra overlaps, and
$$
\sigma_1(y)=\frac{1+y^2}{4},\quad\sigma_2(x)=\frac{1+x}{2},\qquad
V_i(q;p)=\begin{cases}0,&q=\sigma_i(p),\\1,&q\ne\sigma_i(p).\end{cases}
$$
These jointly lower-semicontinuous costs have strict gap one. Their unique two-cycle selection is
$$
x_*=7-2\sqrt{11},\qquad y_*=4-\sqrt{11},\qquad \frac13<x_*<\frac38.
$$
For the nonlinear restriction $R(t)=(t^2,(1+t^2)/2)$ and retained global response $t$, the selected fiber is respectively $\{\sqrt{x_*}\}$ on $[0,1]$, $\{-\sqrt{x_*},\sqrt{x_*}\}$ on $[-1,1]$, and empty on $[4/5,1]$.

*Proof.* Each selector graph is closed, so the strict superlevel sets of its indicator-complement cost are open, giving lower semicontinuity. Each cost has its unique gap-one minimizer. Substitution gives the scalar map $\Phi(x)=(5+2x+x^2)/16$, with $0\le\Phi'\le1/4$ on $[0,1]$. Its fixed polynomial is $p(x)=x^2-14x+5$, with $p(1/3)=4/9$, $p(3/8)=-7/64$ and $p'<0$ there. The root and uniqueness follow. The full selector gains are $B_{12}=B_{21}=1/2$, giving $(I-B)^{-1}=\frac43\left(\begin{smallmatrix}1&1/2\\1/2&1\end{smallmatrix}\right)$. The restriction equations reduce to $t^2=x_*$ and $y_*=(1+x_*)/2$. The signs of the two square roots and $16/25>3/8$ give all three fibers, with nonempty ambient spaces in each case.

A local certificate for the positive fiber uses $F(t)=t^2$, $a_0=3/5$, $r=1/10$, $C=5/6$. On $[1/2,7/10]$, $|1-CF'|\le1/6$, while $|9/25-x_*|\le2/75$ gives $\delta\le1/45$ and $\delta+\kappa r\le7/180<1/10$. Theorem D.8.9c.8 applies; global positive-fiber uniqueness follows from strict monotonicity of $t^2$ on $[0,1]$. ∎

The moving indicator costs have uniform distance one between distinct selected-parent slices, so they meet the lower-semicontinuous strict-certificate class while escaping Theorem D.8.9c.6's parent-continuity hypothesis. These results provide continuity, cyclic-error and nonlinear-fiber tests. Applying them to PU's sector system requires its actual parent spaces, selectors, overlaps and total ambient restriction map; the populated two-sector example fixes its own dimensionless response class.

<a id="theorem-d89c11-compact-parent-finite-image-selection-census"></a>**Theorem D.8.9c.11 (Compact-Parent Finite-Image Selection Census).** Let the finite directed graph of Theorem D.8.9c.4 have nonempty compact Hausdorff response quotients $Q_i$, and fixed candidate quotient $Q_i$ at every parent tuple in $P_i=\prod_{j\in\mathrm{pa}(i)}Q_j$. At each $p\in P_i$, suppose the source cost $V_i(\cdot;p)$ has a selected class $\sigma_i(p)$ and a positive all-competitor gap $g_i(p)$. Suppose the parent-to-cost map is continuous for the uniform difference seminorm
$$
\|V_i(\cdot;p)-V_i(\cdot;p')\|_\infty
=\sup_{q\in Q_i}|V_i(q;p)-V_i(q;p')|.
$$
Then each selector has finite image $F_i=\sigma_i(P_i)$, and its nonempty fibers form a finite clopen partition of $P_i$. No bound on the number of connected components of $Q_i$ or $P_i$ is required. Every solution of the selection equations belongs to $\prod_iF_i$.

For a terminating census, suppose the source supplies a finite cover $P_i=\bigcup_{a=1}^{m_i}U_{i,a}$, parent witnesses $p_{i,a}\in U_{i,a}$, their exact selected classes $q_{i,a}=\sigma_i(p_{i,a})$, positive gaps $g_{i,a}$, and verified bounds
$$
\sup_{p\in U_{i,a}}\|V_i(\cdot;p)-V_i(\cdot;p_{i,a})\|_\infty
<\frac{g_{i,a}}2.
\tag{D.8.9c.11.1}
$$
Assume equality of supplied response classes, membership in these cover sets on the finite candidate tuples, and the registered overlap tests are decidable. Remove repeated classes from each list $\{q_{i,a}\}_a$. Its resulting list is exactly $F_i$. Evaluating the selection and overlap equations on $\prod_iF_i$ returns every global selection and terminates after at most $\prod_i m_i$ tuple tests. Alternatively, for any feedback vertex set $F$, enumeration of $\prod_{f\in F}F_f$ followed by the propagation of D.8.9c.4 gives the same selections.

*Proof.* Fix $p_0\in P_i$ and write $q_0=\sigma_i(p_0)$. Uniform parent continuity gives an open neighborhood on which the cost difference is less than $g_i(p_0)/3$. For $q\ne q_0$ the score difference at any point of this neighborhood is at least $g_i(p_0)-2g_i(p_0)/3>0$. Hence $\sigma_i$ is locally constant. Every nonempty selector fiber is open, and its complement is a union of other open fibers, making it clopen. These disjoint nonempty fibers cover the compact space $P_i$. A finite subcover must contain every nonempty fiber, so there are finitely many of them. The product is compact because it is a finite product of compact spaces; roots have the one-point parent product. A solution obeys $q_i=\sigma_i(q_{\mathrm{pa}(i)})$, placing its coordinate in $F_i$.

For the supplied cover, let the left side of (D.8.9c.11.1) be $e_{i,a}<g_{i,a}/2$. The same score comparison gives
$$
V_i(q;p)-V_i(q_{i,a};p)\ge g_{i,a}-2e_{i,a}>0
\quad(p\in U_{i,a},\ q\ne q_{i,a}).
$$
Thus $\sigma_i=q_{i,a}$ throughout $U_{i,a}$. On a nonempty overlap two certified constants agree by uniqueness. Covering every parent point shows that the image is contained in the supplied list; each witness $p_{i,a}$ proves the reverse containment. Given a finite tuple, membership identifies a cover member for each parent tuple, and its certified constant evaluates the selector exactly. Every solution is enumerated by the first part; every retained tuple passes precisely the original selection and overlap equations. The representation assumptions make each test terminate. The feedback version is the bijection of D.8.9c.4, restricted to the finite images which necessarily contain its solution coordinates. ∎

The compact-parent conclusion supplies a finite mathematical reduction even when the source quotient has infinitely many connected components. Compactness alone supplies neither an executable cover nor the original all-parent source record. The continuity and strict-gap hypotheses are essential: on $P=Q=[0,1]$, the lower-semicontinuous score $V_p(q)=\mathbf1_{q\ne p}$ has gap one and infinite selector image but fails uniform parent continuity; the continuous score $(q-p)^2$ has the same infinite image but has no positive all-competitor gap. A finite selection census still leaves the exhaustive ambient restriction fiber of Theorem P.14.1k.3 to be decided on the source's complete ambient quotient.

<a id="theorem-d89c12-continuous-carriers-gap-obstruction-existence-multiplicity-and-spectral-sharpness"></a>**Theorem D.8.9c.12 (Continuous Carriers: Gap Obstruction, Existence, Multiplicity and Spectral Sharpness).** Keep $\mathsf G=(\mathsf V,\mathsf A)$, the carriers $\bar Q_v$, the selectors $\sigma_v$, equation (D.8.9c.4.1) and the feedback map $\Phi_F$ of Theorem D.8.9c.4. A *potential family* assigns to every $v$ a function $V_v:\bar Q_v\times\bar Q_{\mathrm{pa}(v)}\to\mathbb R$, where $\bar Q_{\mathrm{pa}(v)}$ is a one-point space when $v$ has no parent. It is a *continuous unique-minimizer family* when every $\bar Q_v$ is compact and metrizable, every $V_v$ is jointly continuous, and $V_v(\cdot\,;p)$ has exactly one minimizer $\sigma_v(p)$ for every parent tuple $p$. This is Definition D.8.9a with item 5 replaced by uniqueness of the minimizer.

1. *Gap obstruction.* Let $\bar Q$ be a $T_1$ space, $V:\bar Q\to\mathbb R$, and $q^\ast$ a non-isolated point of $\bar Q$ at which $V$ is upper semicontinuous. Then $\inf_{q\neq q^\ast}\big(V(q)-V(q^\ast)\big)\le 0$, so no $g>0$ satisfies item 5 of Definition D.8.9a at $q^\ast$. A connected $T_1$ carrier with at least two points has no isolated point. Hence on such a carrier no potential that is continuous in $q$ carries a strict certificate: a strict certificate has $\liminf_{q\to q^\ast}V(q)\ge V(q^\ast)+g>V(q^\ast)$, so its potential is discontinuous at the selected class.

2. *Strict certificates on a continuum do not give existence.* On the cycle $S_1\to S_2\to S_1$ with $\bar Q_1=\bar Q_2=[0,1]$ let $\sigma_2=\mathrm{id}$, $\sigma_1(p)=1$ for $p<\tfrac12$, $\sigma_1(p)=0$ for $p\ge\tfrac12$, and $V_v(q;p)=0$ for $q=\sigma_v(p)$, $V_v(q;p)=1$ otherwise. Every $V_v(\cdot\,;p)$ is lower semicontinuous with gap $1$, and (D.8.9c.4.1) has no solution.

3. *Continuous unique-minimizer families give existence.* For such a family every $\sigma_v$ is continuous. If, for some feedback vertex set $F$, the product $\prod_{f\in F}\bar Q_f$ is homeomorphic to a nonempty compact convex subset of a Euclidean space, then $\Phi_F$ is continuous, $\operatorname{Fix}\Phi_F$ is nonempty and compact, and (D.8.9c.4.1) has at least one solution; the global selections are the solutions that pass the overlap test. If $\bar Q_v$ is a closed convex subset of a Euclidean space and $V_v(\cdot\,;p)$ is $\mu_v$-strongly convex, then every minimizer $q'$ of $V_v(\cdot\,;p)+\Delta V$ with $\|\Delta V\|_\infty\le\delta$ obeys

$$\|q'-\sigma_v(p)\|\le 2\sqrt{\delta/\mu_v},\tag{D.8.9c.12.1}$$

which replaces the gap-stability clause of Theorem D.8.9b on continuous carriers.

4. *They do not give uniqueness.* On $S_1\to S_2\to S_1$ with $\bar Q_1=\bar Q_2=[-1,1]$, $V_2(q;p)=(q-p)^2$ and $V_1(q;p)=(q-\tanh(gp+u))^2$, the solutions of (D.8.9c.4.1) are the fixed points of $x\mapsto\tanh(gx+u)$, that is, the equilibria of (L.4.6a.1). For $0\le g\le1$ there is exactly one; for $g>1$ and $u=0$ there are exactly three, $0$ and $\pm c_g$ with $c_g=\tanh(gc_g)\in(0,1)$.

5. *Convexity and compactness cannot be dropped in item 3.* On the unit circle $\bar Q_1=\bar Q_2=\mathbb S^1\subset\mathbb R^2$ with $V_2(q;p)=\|q-p\|^2$ and $V_1(q;p)=\|q-R_\theta p\|^2$, where $R_\theta$ is the rotation by an angle $\theta\notin2\pi\mathbb Z$, the family is a continuous unique-minimizer family and (D.8.9c.4.1) has no solution. On $\bar Q_1=\bar Q_2=\mathbb R$ with $V_2(q;p)=(q-p)^2$ and $V_1(q;p)=(q-p-1)^2$ it has none either.

6. *Spectral gain.* Let every $(\bar Q_v,d_v)$ be a complete metric space and let the selectors satisfy

$$d_v\big(\sigma_v(p),\sigma_v(p')\big)\le\sum_{u\in\mathrm{pa}(v)}k_{vu}\,d_u(p_u,p'_u)\tag{D.8.9c.12.2}$$

with constants $k_{vu}\ge 0$; put $k_{vu}=0$ for $u\notin\mathrm{pa}(v)$ and $\mathsf K=(k_{vu})_{v,u\in\mathsf V}$. If $\rho(\mathsf K)<1$, Theorem D.8.9c.7 with $B=\mathsf K$ gives exactly one solution of (D.8.9c.4.1) and its componentwise error certificate. For a directed cycle $S_1\to\cdots\to S_N\to S_1$ without further parents and with constants $k_1,\dots,k_N$ on its arcs, $\rho(\mathsf K)=(k_1\cdots k_N)^{1/N}$; for an acyclic $\mathsf G$, $\rho(\mathsf K)=0$.

7. *Sharpness of the spectral bound.* For every nonnegative matrix $\mathsf K$ supported on the arcs of $\mathsf G$ with $\rho(\mathsf K)\ge 1$ there is a continuous unique-minimizer family on the carriers $[0,1]$ whose selectors satisfy (D.8.9c.12.2) and whose solution set is infinite, and there are affine selectors on the carriers $\mathbb R$ satisfying (D.8.9c.12.2) with no solution. In particular the bound $\rho(B)<1$ of Theorem D.8.9c.7 cannot be relaxed to $\rho(B)\le1$.

*Proof.* Item 1. Every neighbourhood of the non-isolated point $q^\ast$ contains some $q\neq q^\ast$, and upper semicontinuity gives, for each $\varepsilon>0$, a neighbourhood on which $V<V(q^\ast)+\varepsilon$; the infimum is therefore at most $\varepsilon$ for every $\varepsilon>0$. If $\{q^\ast\}$ were open in a connected $T_1$ space containing a second point, it would be a proper nonempty closed and open subset.

Item 2. The sublevel sets of $V_v(\cdot\,;p)$ are $\emptyset$, $\{\sigma_v(p)\}$ or $[0,1]$, all closed, and the gap is $1$. By Theorem D.8.9c.4(2) the solutions correspond to the fixed points of $\sigma_1$; a fixed point $q<\tfrac12$ would equal $1$ and a fixed point $q\ge\tfrac12$ would equal $0$.

Item 3. Let $p_n\to p$. By compactness every subsequence of $(\sigma_v(p_n))$ has a further subsequence converging to some $\bar q$. For each $q$, $V_v(\sigma_v(p_n);p_n)\le V_v(q;p_n)$, and joint continuity gives $V_v(\bar q;p)\le V_v(q;p)$ in the limit. Hence $\bar q$ minimizes $V_v(\cdot\,;p)$, so $\bar q=\sigma_v(p)$ and $\sigma_v(p_n)\to\sigma_v(p)$. Propagation through $\mathsf G-F$ in a topological order composes continuous maps, so $\Phi_F$ is continuous, and the Brouwer fixed-point theorem applies to the compact convex model of $\prod_{f\in F}\bar Q_f$; the fixed set is closed. The proof of Theorem D.8.9c.4(1) uses only that the $\sigma_v$ are maps, so fixed points and solutions correspond. For (D.8.9c.12.1) put $q^\ast=\sigma_v(p)$ and $V=V_v(\cdot\,;p)$. For $q\in\bar Q_v$ and $0<t<1$, minimality and strong convexity give $V(q^\ast)\le V(q^\ast+t(q-q^\ast))\le(1-t)V(q^\ast)+tV(q)-\tfrac{\mu_v}{2}t(1-t)\|q-q^\ast\|^2$; dividing by $t$ and letting $t\downarrow0$ gives $V(q)\ge V(q^\ast)+\tfrac{\mu_v}{2}\|q-q^\ast\|^2$. Then $V(q')\le(V+\Delta V)(q')+\delta\le(V+\Delta V)(q^\ast)+\delta\le V(q^\ast)+2\delta$, so $\tfrac{\mu_v}{2}\|q'-q^\ast\|^2\le2\delta$.

Item 4. Both potentials are jointly continuous with the unique minimizers $\sigma_2(p)=p$ and $\sigma_1(p)=\tanh(gp+u)\in(-1,1)$; by Theorem D.8.9c.4(2) the solutions are the fixed points of $x\mapsto\tanh(gx+u)$. Put $h(x)=\tanh(gx+u)-x$, so $h(-1)>0>h(1)$. For $g\le1$, $h'(x)=g\operatorname{sech}^2(gx+u)-1\le0$ with equality at most at one point, so $h$ is strictly decreasing and has exactly one zero. For $g>1$ and $u=0$, $h$ is odd, $h'(0)=g-1>0$, $h(1)<0$ and $h''(x)=-2g^2\operatorname{sech}^2(gx)\tanh(gx)<0$ on $(0,1)$; the concave function $h$ with $h(0)=0$ is positive just right of $0$ and negative at $1$, so it has exactly one zero in $(0,1)$ and, by oddness, exactly three zeros in $[-1,1]$.

Item 5. On $\mathbb S^1$ the unique nearest point to a point of $\mathbb S^1$ is that point, so $\sigma_2=\mathrm{id}$, $\sigma_1=R_\theta$, and $R_\theta$ has no fixed point on $\mathbb S^1$. On $\mathbb R$ the feedback map is $p\mapsto p+1$.

Item 6. The first statement is Theorem D.8.9c.7. For the cycle, $\mathsf K^N=(k_1\cdots k_N)I$, so every eigenvalue is an $N$-th root of $k_1\cdots k_N$. For acyclic $\mathsf G$ the matrix is strictly triangular in a topological order.

Item 7. Put $\mathsf K'=\mathsf K/\rho(\mathsf K)$, so $\mathsf K'\le\mathsf K$ entrywise and $\rho(\mathsf K')=1$. By the Perron–Frobenius theorem for nonnegative matrices there are nonzero vectors $x,y\ge0$ with $\mathsf K'x=x$ and $y^{\mathsf T}\mathsf K'=y^{\mathsf T}$; normalize $\max_vx_v=1$. On the carriers $[0,1]$ put $\sigma_v(p)=\min\{1,\sum_uk'_{vu}p_u\}$ and $V_v(q;p)=(q-\sigma_v(p))^2$. Truncation at $1$ is $1$-Lipschitz, so (D.8.9c.12.2) holds with $k'_{vu}\le k_{vu}$, and every $q=tx$ with $t\in[0,1]$ is a solution because $\sum_uk'_{vu}tx_u=tx_v\le1$. On the carriers $\mathbb R$ put $\sigma_v(p)=\sum_uk'_{vu}p_u+1$; a solution $q$ would give $y^{\mathsf T}q=y^{\mathsf T}\mathsf K'q+y^{\mathsf T}\mathbf 1=y^{\mathsf T}q+y^{\mathsf T}\mathbf 1$ with $y^{\mathsf T}\mathbf 1>0$. $\blacksquare$

<a id="corollary-d89c13-cyclic-blocks-of-final-calibrated-vertices"></a>**Corollary D.8.9c.13 (Cyclic Blocks of Final-Calibrated Vertices).** The final-calibrated vertices of Convention P.14.1k carry the continuous calibration simplices $\Delta(\Omega_\ast)$; by Principle V.3.11b and Theorem V.3.11c their selection is a strictly convex minimization, so it has a unique minimizer and, when its feasible polytope has more than one point, no strict gap (Theorem D.8.9c.12(1)). On the registered acyclic graph Theorem V.3.11c fixes each of them once its parent constraint values are fixed. Consider instead a cyclic extension: final-calibrated vertices $S_1\to S_2\to\cdots\to S_N\to S_1$ (indices modulo $N$). For each $i$ fix every entry of the datum of Definition V.3.11a except the constraint values: atom set $\Omega_i$, full-support reference measure $\nu_i$, independent moment functions $m^{(i)}=(m_a)_{a\in A_i}$, coefficient symbols $\sigma_B$ and bridges $s_B$ for $B\in\mathcal I_i$. Let $M_i^\circ\subseteq\mathbb R^{A_i}$ be the set of constraint vectors $c$ that admit a full-support witness as in (V.3.11a.8), let $\omega^{(i)}_\ast(c)$ be the calibrated state of Theorem V.3.11c, let $Y_i(c)=\big(s_B\langle\sigma_B\rangle_{\omega^{(i)}_\ast(c)}\big)_{B\in\mathcal I_i}$ be the coefficient record of Definition V.3.11e, and let the overlap maps $\Pi_{i+1}:\mathbb R^{\mathcal I_i}\to\mathbb R^{A_{i+1}}$ supply the constraint values of $S_{i+1}$ from the coefficient record of $S_i$. A *cyclic calibration* is a tuple $(c^{(i)})_i$ with $c^{(i)}\in M_i^\circ$ and

$$c^{(i+1)}=\Pi_{i+1}\big(Y_i(c^{(i)})\big)\qquad(i=1,\dots,N).\tag{D.8.9c.13.1}$$

1. The multiplier map $\theta\mapsto c(\theta)=-\nabla\log Z(\theta)$ of Corollary V.3.11d is a $C^1$ diffeomorphism of $\mathbb R^{A_i}$ onto $M_i^\circ$, and $Y_i$ is $C^1$ on $M_i^\circ$.
2. *Existence.* If the $\Pi_i$ are continuous and a nonempty compact convex $\mathcal K\subseteq M_1^\circ$ is mapped into itself by the return map $\mathsf P=\Pi_1\circ Y_N\circ\Pi_N\circ\cdots\circ\Pi_2\circ Y_1$, with all intermediate constraint vectors in the sets $M_i^\circ$, then a cyclic calibration with $c^{(1)}\in\mathcal K$ exists.
3. *Uniqueness.* Let moreover $\Pi_{i+1}$ be $\ell_i$-Lipschitz, let $\mathcal K_i\subseteq M_i^\circ$ with $\mathcal K_1=\mathcal K$ and $\Pi_{i+1}(Y_i(\mathcal K_i))\subseteq\mathcal K_{i+1}$, and suppose that for all $\theta$ in the convex hull of the multipliers of $\mathcal K_i$ one has $\mathrm{Cov}_{\omega_\theta}(m^{(i)})\succeq\gamma_iI$ with $\gamma_i>0$ and $\|\mathrm{Cov}_{\omega_\theta}(\sigma_B,m^{(i)})\|\le K_B$. Put $K_i=\big(\sum_{B\in\mathcal I_i}s_B^2K_B^2\big)^{1/2}$. Then $Y_i$ is $(K_i/\gamma_i)$-Lipschitz on $\mathcal K_i$, and if

$$\prod_{i=1}^{N}\frac{\ell_iK_i}{\gamma_i}<1\tag{D.8.9c.13.2}$$

there is exactly one cyclic calibration with $c^{(1)}\in\mathcal K$, and sequential recalibration around the cycle converges to it geometrically.
4. *Without (D.8.9c.13.2) uniqueness fails.* Let $N=2$ and give both vertices the formal datum $\Omega=\{-1,0,1\}$, $\nu=(\tfrac14,\tfrac12,\tfrac14)$, $m(\alpha)=\alpha$, one coefficient symbol $\sigma_B=\mathbf 1_{\{\alpha=0\}}$ with $s_B=1$, and the overlap maps $\Pi(y)=\tfrac85y+\tfrac15$. Then $M^\circ=(-1,1)$, $\omega_\ast(c)=\big((1-q)^2,2q(1-q),q^2\big)$ with $q=\tfrac{1+c}{2}$, $Y(c)=\tfrac{1-c^2}{2}$, $\gamma=\tfrac{1-c^2}{2}$, $K_B=|c|\tfrac{1-c^2}{2}$, and the one-step map is $f(c)=1-\tfrac45c^2$, which maps $\mathcal K=[0.2,\,0.968]$ into itself. There are exactly three cyclic calibrations, all with full support:

$$
(c^{(1)},c^{(2)})\in\Big\{\big(\tfrac{\sqrt{105}-5}{8},\tfrac{\sqrt{105}-5}{8}\big),\ \big(\tfrac{5+\sqrt5}{8},\tfrac{5-\sqrt5}{8}\big),\ \big(\tfrac{5-\sqrt5}{8},\tfrac{5+\sqrt5}{8}\big)\Big\}.
$$

With $\Pi(y)=\tfrac{9}{10}y+\tfrac1{10}$ instead, (D.8.9c.13.2) holds on $[0.1,0.55]$ and the cyclic calibration is unique, $c^{(1)}=c^{(2)}=(\sqrt{1.99}-1)/0.9$.

*Proof.* Item 1. For $c\in M_i^\circ$ the datum is final-calibration admissible, so Theorem V.3.11c gives a calibrated state of full support and Corollary V.3.11d gives it the exponential form with a unique multiplier vector; conversely each $\omega_\theta$ has full support and is the calibrated state for its own moment vector, because the exponential form satisfies the stationarity conditions of a convex problem. Hence $\theta\mapsto c(\theta)$ is a bijection onto $M_i^\circ$. Its Jacobian is $-\mathrm{Cov}_{\omega_\theta}(m^{(i)})$, negative definite by Corollary V.3.11d, so the inverse function theorem makes the inverse $C^1$; $Y_i$ is the composition of that inverse with $\theta\mapsto(s_B\langle\sigma_B\rangle_{\omega_\theta})_B$. Item 2 is the Brouwer theorem for the continuous map $\mathsf P$ on $\mathcal K$. Item 3. For $c,c'\in\mathcal K_i$ the multiplier segment lies in the stated convex hull, so (V.3.11c.2.4) gives $|s_B\langle\sigma_B\rangle'-s_B\langle\sigma_B\rangle|\le|s_B|K_B\|c'-c\|/\gamma_i$ for every $B$; summing squares gives the Lipschitz constant $K_i/\gamma_i$. Then $\mathsf P$ is a contraction of the complete set $\mathcal K$ with constant (D.8.9c.13.2), and the Banach theorem gives the claim. Item 4. The exponential family of $\nu$ with statistic $\alpha$ is the binomial family $\big((1-q)^2,2q(1-q),q^2\big)$, whose mean is $2q-1=c$; this gives $\omega_\ast$, $Y(c)=2q(1-q)$, $\mathrm{Var}(m)=2q(1-q)$ and $\mathrm{Cov}(\sigma_B,m)=-c\,(1-c^2)/2$. A cyclic calibration is a point $c^{(1)}\in(-1,1)$ with $f(f(c^{(1)}))=c^{(1)}$ and $f(c^{(1)})\in(-1,1)$. One has $f(f(c))-c=-\tfrac{1}{125}(4c^2+5c-5)(16c^2-20c+5)$; its roots are $(-5\pm\sqrt{105})/8$ and $(5\pm\sqrt5)/8$, of which $(-5-\sqrt{105})/8<-1$ is excluded and the other three lie in $(0.2,0.968)$. For the second overlap map $f(c)=0.55-0.45c^2$ maps $[-1,1]$ into $[0.1,0.55]$, where $|f'|\le0.495$. $\blacksquare$

<a id="theorem-d89c14-restriction-fibers-over-convex-ambient-candidate-sets"></a>**Theorem D.8.9c.14 (Restriction Fibers over Convex Ambient Candidate Sets).** Let $\mathcal A$ be a finite-dimensional real inner-product space, let the admissible ambient candidates form a nonempty compact convex set $\mathcal A_+\subseteq\mathcal A$, let $\mathrm{res}(a)=Ra+c$ be affine into the tuple space $\mathcal T$, let $q^\ast$ be the selected compatible tuple, and put $\mathfrak F=\{a\in\mathcal A_+:\mathrm{res}(a)=q^\ast\}$.

1. $\mathfrak F\neq\emptyset$ exactly when

$$\langle y,q^\ast-c\rangle\le h_+(R^{\mathsf T}y)\quad\text{for every }y\in\mathcal T,\qquad h_+(z)=\max_{a\in\mathcal A_+}\langle z,a\rangle;\tag{D.8.9c.14.1}$$

otherwise some $y$ violating (D.8.9c.14.1) certifies the obstruction. The linear condition $q^\ast-c\in\operatorname{im}R$ of Theorem D.8.9c.5(5) is necessary and is not sufficient.
2. If $\mathfrak F\neq\emptyset$, let $a_0$ be a point of its relative interior and put $\mathrm{Lin}_{a_0}(\mathcal A_+)=\{v\in\mathcal A:\ a_0\pm tv\in\mathcal A_+\text{ for some }t>0\}$. This is a linear subspace, the affine hull of $\mathfrak F$ is $a_0+\big(\ker R\cap\mathrm{Lin}_{a_0}(\mathcal A_+)\big)$, and $\mathfrak F$ is a singleton exactly when $\ker R\cap\mathrm{Lin}_{a_0}(\mathcal A_+)=\{0\}$. Thus $\ker R=\{0\}$ is sufficient and is not necessary for a unique lift.
3. *Density operators.* Let $\mathcal A=\mathrm{Herm}(\mathcal H)$ with $\dim\mathcal H=d$, $\mathcal A_+=\mathfrak D(\mathcal H)$ the density operators, $E(\rho)=(\operatorname{tr}\rho O_\alpha)_{\alpha=1}^{m}$ for Hermitian $O_\alpha$, $W=E(\mathfrak D(\mathcal H))$ and $\mathfrak D_c=E^{-1}(c)\cap\mathfrak D(\mathcal H)$; here the translation of $\mathrm{res}$ is zero and $c$ denotes a point of the tuple space $\mathbb R^m$. Then $c\in W$ exactly when

$$\lambda\cdot c\le\lambda_{\max}\Big(\sum_\alpha\lambda_\alpha O_\alpha\Big)\quad\text{for every }\lambda\in\mathbb R^m.\tag{D.8.9c.14.2}$$

For $c\in W$ let $P_c$ be the support projection of a state in the relative interior of $\mathfrak D_c$. Then $\dim\mathfrak D_c=\dim\{X=X^\dagger=P_cXP_c:\ \operatorname{tr}X=0,\ \operatorname{tr}(XO_\alpha)=0\ \forall\alpha\}$, and $\mathfrak D_c$ is a singleton exactly when $\{P_c\}\cup\{P_cO_\alpha P_c\}_\alpha$ spans $\mathrm{Herm}(P_c\mathcal H)$. If $c$ lies in the relative interior of $W$, then $P_c=I$ and

$$\dim\mathfrak D_c=d^2-\dim\operatorname{span}_{\mathbb R}\{I,O_1,\dots,O_m\},\tag{D.8.9c.14.3}$$

so over the relative interior of $W$ the lift is unique exactly when the family is informationally complete. If $\lambda\cdot c=\lambda_{\max}(\sum_\alpha\lambda_\alpha O_\alpha)$ for some $\lambda$ whose top eigenvalue is simple with eigenvector $\psi$, then $\mathfrak D_c=\{|\psi\rangle\langle\psi|\}$.

*Proof.* Item 1. $\mathrm{res}(\mathcal A_+)$ is compact and convex with support function $y\mapsto\langle y,c\rangle+h_+(R^{\mathsf T}y)$; a point outside a closed convex set is strictly separated from it by a hyperplane. For the last sentence take a qubit, $O=\sigma_z$ and $c=2$: $X=\mathrm{diag}(\tfrac32,-\tfrac12)$ solves $\operatorname{tr}X=1$, $\operatorname{tr}(X\sigma_z)=2$, while $\lambda=1$ violates (D.8.9c.14.2).

Item 2. If $a_0\pm tv$ and $a_0\pm t'w$ lie in $\mathcal A_+$ and $\tau=\min\{t,t'\}$, then $a_0\pm\tfrac\tau2(v+w)=\tfrac12(a_0\pm\tau v)+\tfrac12(a_0\pm\tau w)\in\mathcal A_+$; closure under scalar multiples is immediate. If $v\in\ker R\cap\mathrm{Lin}_{a_0}(\mathcal A_+)$ then $a_0\pm tv\in\mathfrak F$. Conversely let $a\in\mathfrak F$ and $v=a-a_0\in\ker R$; because $a_0$ is a relative interior point of $\mathfrak F$, $a_0-sv\in\mathfrak F$ for some $s\in(0,1]$, and convexity gives $a_0\pm sv\in\mathcal A_+$.

Item 3. $h_+(R^{\mathsf T}\lambda)=\max_\rho\operatorname{tr}(\rho\sum_\alpha\lambda_\alpha O_\alpha)=\lambda_{\max}$, which is (D.8.9c.14.2). If $\rho_0\pm tX\ge0$ and $\psi\perp\operatorname{supp}\rho_0$, then $\pm t\langle\psi|X|\psi\rangle\ge0$ for both signs, so $\langle\psi|(\rho_0\pm tX)|\psi\rangle=0$ and positivity gives $(\rho_0\pm tX)\psi=0$, hence $X\psi=0$ and $X=P_cXP_c$; conversely $\rho_0\ge\varepsilon P_c$ for some $\varepsilon>0$, so $\rho_0\pm tX\ge0$ for small $t$ when $X=P_cXP_c$. Thus $\mathrm{Lin}_{\rho_0}(\mathfrak D)=\{X=X^\dagger=P_cXP_c,\ \operatorname{tr}X=0\}$ and item 2 gives the dimension; a family of linear functionals on $\mathrm{Herm}(P_c\mathcal H)$ has trivial common kernel exactly when the representing operators span. Let $c$ be in the relative interior of $W$ and $c_0=E(I/d)$. For small $\varepsilon>0$, $c'=c+\varepsilon(c-c_0)\in W$; choose $\rho'$ with $E(\rho')=c'$. Then $\rho=(\rho'+\varepsilon I/d)/(1+\varepsilon)$ has $E(\rho)=c$ and full rank. A relative interior point $\rho_0$ of $\mathfrak D_c$ satisfies $\rho\le C\rho_0$ for some $C$, because $\rho_0+s(\rho_0-\rho)\in\mathfrak D_c$ for small $s>0$; hence $\rho_0$ has full rank, $P_c=I$, and the kernel in question is the set of traceless Hermitian $X$ orthogonal to all $O_\alpha$, of dimension $d^2-\dim\operatorname{span}\{I,O_\alpha\}$. Finally, $\operatorname{tr}(\rho\sum_\alpha\lambda_\alpha O_\alpha)=\lambda_{\max}$ forces $\rho$ to be supported on the top eigenspace. $\blacksquare$

For general rational data, (D.8.9c.14.2) is a semidefinite feasibility problem; a violating certificate $\lambda$ or $y$ is checked by one eigenvalue computation.

<a id="proposition-d89c15-one-arc-cyclic-extensions-of-an-accepted-acyclic-record"></a>**Proposition D.8.9c.15 (One-Arc Cyclic Extensions of an Accepted Acyclic Record).** Let an acyclic certified record in the sense of Theorem D.8.9c have selected tuple $q^\ast$, and let $R\to S$ be one of its arcs with $|\bar Q_R|\ge2$ and $|\bar Q_S|\ge2$. Let $\mathsf G^+$ be the graph obtained by adjoining the arc $S\to R$. A *completion* is a family of strict certificates at every parent tuple of $\mathsf G^+$, as Theorem D.8.9c.4 requires; it is *conservative* when its selectors satisfy $\sigma_v(q^\ast_{\mathrm{pa}(v)})=q^\ast_v$ for every $v$. The accepted record contains certificates at the selected parent tuples only, and:

1. every conservative completion has $q^\ast$ as a solution of (D.8.9c.4.1);
2. for every integer $m$ with $1\le m\le\min\{|\bar Q_R|,|\bar Q_S|\}$ there is a conservative completion with exactly $m$ solutions of (D.8.9c.4.1);
3. there is a completion with no solution;
4. a conservative completion whose selectors satisfy (D.8.9c.12.2) with $\rho(\mathsf K)<1$ (Theorem D.8.9c.7), or whose $\Phi_F$ is a contraction as in Theorem D.8.9c.4(5), has $q^\ast$ as its only solution.

Hence the accepted acyclic record determines neither existence nor uniqueness of a global selection on $\mathsf G^+$; the missing datum is the certificate family of $R$ and $S$ as functions of the parent coordinates of $\mathsf G^+$, including those of the new arcs, and a solution other than $q^\ast$ is a global selection exactly when it also passes overlap equations that the acyclic record does not contain.

*Proof.* Put $\sigma_v\equiv q^\ast_v$ for $v\notin\{R,S\}$, $\sigma_S(p)=\tau(p_R)$ and $\sigma_R(p)=\varsigma(p_S)$ for maps $\tau:\bar Q_R\to\bar Q_S$, $\varsigma:\bar Q_S\to\bar Q_R$. The solutions are the tuples with $q_v=q^\ast_v$ off $\{R,S\}$, $q_S=\tau(q_R)$ and $\varsigma(\tau(q_R))=q_R$. Choose distinct $r_1=q^\ast_R,r_2,\dots,r_m$ and distinct $s_1=q^\ast_S,s_2,\dots,s_m$. With $\tau(r_i)=s_i$, $\tau(r)=s_1$ otherwise, $\varsigma(s_i)=r_i$ and $\varsigma(s)=r_1$ otherwise, the fixed points of $\varsigma\circ\tau$ are exactly $r_1,\dots,r_m$, and the completion is conservative; this is item 2, and item 1 is the definition. For item 3 keep this $\tau$ with $m=2$ and put $\varsigma(s_1)=r_2$, $\varsigma(s)=r_1$ otherwise; then $\varsigma\circ\tau$ maps $r_1\mapsto r_2$, $r_2\mapsto r_1$ and every other $r\mapsto r_2$. The potentials $V_v(q;p)=0$ for $q=\sigma_v(p)$ and $1$ otherwise, used at every non-selected parent tuple, are strict certificates as in the proof of Theorem D.8.9c.4(3). Item 4 combines item 1 with the uniqueness statements cited. $\blacksquare$

<a id="prop-d89c16"></a>

<a id="proposition-d89c16-stationary-lifts-of-the-context-control-loop"></a>**Proposition D.8.9c.16 (Stationary Lifts of the Context–Control Loop).** On a finite-dimensional aggregate Hilbert space of dimension \(d\), let \(\mathcal D\) be the density matrices and \(E(\rho)=(\operatorname{Tr}\rho O_\alpha)_\alpha\) the expectation map of Definition L.1. Let \(W=E(\mathcal D)\), let \(\mathcal M:W\to\mathbb R^m\) be continuous, and supply a continuous family of CPTP maps \(\Lambda_p\) on the same aggregate. Its closed-loop update is \(G(\rho)=\Lambda_{\mathcal M(E(\rho))}(\rho)\).

1. \(G\) has a stationary state. Suppose in addition that each \(\Lambda_p\) has exactly one stationary state \(\rho_p\). Define the induced feedback map \(F(p)=E(\rho_p)\). Then \(E\) restricts to a bijection
   $$
   \operatorname{Fix}(G)\ \xrightarrow{\ \sim\ }\ \operatorname{Fix}(F\circ\mathcal M),
   \qquad c\longmapsto \rho_{\mathcal M(c)}\quad\text{for the inverse}.
   \tag{D.8.9c.16.1}
   $$
   If \(F\circ\mathcal M\) is a contraction on \(W\), the stationary aggregate lift is unique.
2. At any \(c\in W\) the kinematic fiber \(E^{-1}(c)\) is compact and convex, and for \(c\in\operatorname{relint}W\) has affine dimension \(d^2-1-\dim W\). Every fiber is a singleton exactly when the identity and the \(O_\alpha\) span the real vector space of Hermitian operators. Without the unique stationarity assumption, the stationary lifts of \(c\) are exactly \(E^{-1}(c)\cap\operatorname{Fix}(\Lambda_{\mathcal M(c)})\).
3. If a prescribed feedback law on a larger context space gives a fixed context \(c\), it has a kinematic lift exactly when
   $$
   \lambda\cdot c\le\lambda_{\max}\!\left(\sum_\alpha\lambda_\alpha O_\alpha\right)
   \quad\text{for every }\lambda\in\mathbb R^{|\mathcal I|}.
   \tag{D.8.9c.16.2}
   $$
   For a qubit with \(O_1=\sigma_z\), the constant feedback \(F=2\) on \([-3,3]\) has a unique attracting context \(2\) and an empty kinematic fiber.

*Proof.* The density set \(\mathcal D\) is compact and convex and \(G\) is a continuous self-map, so Brouwer's theorem gives a fixed state. For \(p_j\to p\), every limit point \(\sigma\) of \(\rho_{p_j}\) obeys \(\Lambda_p(\sigma)=\sigma\) by continuity. Uniqueness and compactness give \(\rho_{p_j}\to\rho_p\). If \(G(\rho)=\rho\), then \(\rho=\rho_{\mathcal M(E(\rho))}\) and \(E(\rho)=F(\mathcal M(E(\rho)))\). If \(c=F(\mathcal M(c))\), the state \(\rho_{\mathcal M(c)}\) has context \(c\) and is fixed by \(G\). The contraction result now follows from the fixed-point theorem on the compact set \(W\).

For the fiber dimension, the expectation map has rank \(\dim W\) on the trace-zero directions because \(\mathcal D\) spans the trace-one affine hyperplane. Let \(c_0=E(I/d)\). For \(c\in\operatorname{relint}W\), choose \(0<\eta<1\) small enough that \(c'=(c-\eta c_0)/(1-\eta)\) belongs to \(W\). A lift \(\rho'\) of \(c'\) gives the strictly positive lift \(\eta I/d+(1-\eta)\rho'\) of \(c\), so the fiber contains a relatively open set of the full affine fiber. The kernel on trace-zero Hermitian operators is trivial exactly when the stated observables together with \(I\) span. If the kernel contains \(X\ne0\), then \(I/d\pm\epsilon X\) give distinct lifts of \(c_0\) for sufficiently small \(\epsilon>0\). Intersecting the fiber with the stationary states of the selected channel gives the asserted set of stationary lifts. Finally the right side of (D.8.9c.16.2) is the support function of the compact convex \(W\), by the spectral variational principle. Separation proves the criterion, and for \(\sigma_z\) one has \(W=[-1,1]\). ∎

The controlled channel family is the supplied physical update datum. The proposition distinguishes stationarity under that family from kinematic compatibility of the sector records. It leaves the derivation of the controlled family from the retained PU aggregate and the population of the full sector graph to the respective source and overlap records.

<a id="theorem-d89c17"></a>

<a id="theorem-d89c17-an-actual-strict-certificate-subgraph-with-a-nontrivial-restriction-fiber"></a>**Theorem D.8.9c.17 (An Actual Strict-Certificate Subgraph with a Nontrivial Restriction Fiber).** On the finite source of Theorem 46g.53, the operational-continuum, AQFT and topological-bandwidth response records admit three linked strict sector certificates on a single bounded finite control menu. Each parent tuple of the declared finite graph has a physical local realization and a positive gap. The unique selected compatible tuple has an explicitly classified physical ambient restriction fiber. The global sector registry of Convention P.14.1k retains its other population requirements.

*Actual carrier and parent arcs.* Fix $\ell_*>0$, physical speed $c>0$, energy unit $\hbar c/\ell_*$ and the paid graph, scalar calibration, observation field and predictive tags of Theorems F.0z.8 and 46g.53. Use the finite source before the chosen refinement and retained protocol schedules are evaluated. Denote the three vertices by $C$ for operational continuum, $A$ for the local AQFT route, and $B$ for the topological-bandwidth response. Their directed arc set is exactly
$$
\{C\longrightarrow A,\ C\longrightarrow B,\ A\longrightarrow B\}.
$$
An arc transports the actual typed parent records to the child. The first transports the calibrated rod, chart and physical clock. The second transports those records to the spatial addresses, tag clock and graph-band normalization of the third vertex. The third transports the actual field and tag carrier, stationary preparation, exact embeddings and local evolution. At $B$, the copy of the rod and clock obtained through $A$ is compared with the direct one from $C$. Both are unchanged reads of the same retained label and calibrated clock, giving the required overlap equality at every compatible parent tuple.

Use two rod choices $r\in\{0,1\}$ with physical periods $\ell_r=2^r\ell_*$. At either rod install the source of Theorem F.0z.8 with its positive physical clock, actual mesh $a_j=\ell_r/n_j$, and calibration tick $a_j/(8c)$. The comparison multiplies lengths by $2^r$, volume by $2^{4r}$, and the form and band operators by $2^{-2r}$ under the corresponding Hilbert-space normalization. Both choices retain the same bounded-degree graph, normalized masks and completed-clock comparison. Their rod-length responses are distinct on the fixed external unit. The factor $2^r$ changes the physically supplied rod and clock intervals, while the speed $c$ is unchanged.

At either parent $r$, let $a\in\{0,1\}$ designate an onsite observation-field excitation energy $E_{r,a}=\hbar c(1+a)/\ell_r$. Keep the ground preparation and the complete tag/field tensor inclusion of Theorem F.0z.8. The onsite term and the local Heisenberg generator have uniform bounds on this two-choice menu. Its exact projective embeddings, positive-energy ground state and state restrictions hold at both energies. A product-state Ramsey response on one retained qubit distinguishes the choices: prepare $|+\rangle$ and observe $X$ at physical duration $\pi\ell_r/c$, yielding expectation $-1$ for $a=0$ and $+1$ for $a=1$. The calibration and all observations are at actual positive clock intervals. The cone comes from the same scalar/rail sector as before.

For each pair $(r,a)$ use two density choices $b\in\{0,1\}$ for the exclusive settings of Proposition 46g.52, with $\sigma_{r,a,b}=\sigma_0(1+a+b)$ in a fixed physical volume unit. Fix $\sigma_0>0$ and discard an initial prefix for which any of their angles would exceed $\pi/4$. The capacities at a fixed physical diamond differ at the two density choices. They use the same active tags, full receiver, private ready states and capacity angle rule, with the parent excitation energy and clock kept in their original carrier and timing records. On each choice use the appropriate graph band from Proposition 46g.50 after the rod rescaling, and the exact quotient and finite amplitude service of Theorem 46g.53. The source takes $a$ as the registered energy label, rather than inferring that label from a capacity. Every possible triple $(r,a,b)$ therefore has its own actual controlled responses on the same finite carrier type. Each inherited menu includes all its stated older finite ports and stocks.

*Strict scores and parent-dependent choices.* The finite controller supports an additional physical binary forecast task at each vertex. Its target word is produced from already prepared and verifiable calibration labels before the forecast choice is evaluated. At $C$ use a known length-reference choice $t_C=0$. At $A$ copy the parent rod bit and set $t_A=r$. At $B$ compute $t_B=r\mathbin{\mathrm{xor}}a$ on the two registered parent labels. The deterministic reference may be implemented on a private initialized register by fixed unitary copies and a controlled XOR, leaving all old labels retained. At a separate actual forecast cut each candidate commits its own bit. On a later reference comparison cut the predictive score is one for matching the physical target and zero for the other outcome. The same-length messages, verification, reference communication and retained mismatch registers are charged. Prepare, reserve and pad the finite support and holding budgets for both candidate settings at each parent, using common maximum reserves, idle identities, and the same priced source-control calls. Fix the complete comparison record and its two actual candidate settings before the forecast is scored.

In the declared reservation objective, at each fixed parent the complete common-duration baseline charge is a constant $C_v(p)$ across that vertex's two candidates. This is the same reserved-envelope convention used for the normal-controller teacher tasks of Theorem F.0z.8. All differences in gate Hamiltonians, activation widths, physical source responses and any realized operating expenditure remain in their own records. The compared objective prices the reserved slots, not an unregistered run-dependent replacement. Taking one fixed positive predicted-benefit weight $g_v$ at each vertex gives the physically verified score potential
$$
V_v(q;p)=C_v(p)+g_v\,\mathbf1_{\{q\ne t_v(p)\}}.
$$
At $C$ the clock and measurement hosts for the two rod choices are included in a single maximum reserve on the fixed finite budget. At $A$ both onsite energy settings use the same field stock, calibration time menu and maximum pulse reserve. At $B$ the capacities use the same tag stock and all receiver routes and fresh copies for the registered finite accuracy prefix. The entire finite joined prefix is padded before comparison, as opposed to assigning different uncharged measurement accuracy to the two settings.

The finite response-class carriers are $\{0,1\}$ at each vertex. Their indicated rod, excitation and capacity responses distinguish the two candidate bits; equality of the complete finite retained responses therefore yields exactly these classes at each fixed parent. The costs above are lower semicontinuous on these finite classes. They give the strict positive gaps $g_v$ and the parent-dependent selectors $0,r,r\mathbin{\mathrm{xor}}a$. The overlap maps are the three actual retained-label and calibrated carrier restrictions stated above. Every fixed parent tuple has a strict certificate, including the off-selected values. By direct propagation or Theorem D.8.9c.4, the fixed-point set is the singleton $(0,0,0)$. Each of the three selection and verification steps can be executed in this parent-before-child order without replacing a later constraint by an earlier input.

*Ambient carrier and full selected fiber.* Add two actual finite neutral archive bits $X,Y$ to the control stock. Their local marginal states are fair at the respective input cuts, all four words have owned classical storage, and the complete decoder includes their later joint readout. These bits never affect the forecast targets, scalar calibration, field preparation, activation switches or sample controls. Prepare a fair seed $X$ and an independent private choice bit $J$ with $\mathbb P(J=0)=s$. The single-qubit rotation with real first column $(\sqrt s,\sqrt{1-s})$ followed by a record instrument gives this law in the declared finite-parameter source convention. Use a fresh target for $Y=X\mathbin{\mathrm{xor}}J$, by two reversible copies, retaining both original inputs. This realizes exactly every binary joint law with fair marginals in the ideal finite-probability source. For computable supplied $s$ the rotation can be synthesized to any requested finite comparison tolerance. The two extreme laws are exact finite circuits with fixed $J$.

For the registered cross-window comparison retain the actual $X,Y$ in the ambient outcome record but make no joint archive outcome a response of the three local sectors. The full ambient response distinguishes their joint law by $\mathbb P(X=Y)$. The other archive registers are generated by the fixed preparation and decoder protocol conditional on the retained pair and configuration. Their availability and finite law are fixed by this source rule, with preparation seeds retained and kept private under that fixed receiver contract. Define $Q_\Omega$ to consist of the complete admitted source responses for all eight control triples and all permitted $s$, with the clock, carrier and joint archive outcome law retained. The quotient identifies exactly equal complete declared global responses. The restriction to each vertex keeps its sector record, input/clock alignment and its locally fair archive reference, and forgets the additional joint readout. Use $X$ at $C$ and $B$ and $Y$ at $A$, with identity transports on repeated uses of $X$. In a local calibration the reference is an input-independent fair bit. The typed overlap maps transport the calibrated source data used by each child; they do not request a joint readout of the two archive cuts. This is an actual restriction of the physical instrument families.

For the selected tuple the fiber is exactly
$$
\left\{
\begin{pmatrix}
s/2&(1-s)/2\\
(1-s)/2&s/2
\end{pmatrix}: 0\leq s\leq1
\right\}
$$
in the order of the two binary indices. The row and column marginal equations give this formula directly. Conversely each displayed law is the declared randomization of the two reversible preparation protocols, and produces the same strict sector records. The affine restriction therefore has a nonempty one-dimensional fiber. Distinct values of $s$ are physically distinguishable in the full global receiver, so response equivalence does not remove the fiber. If the joint readout is included in a sector restriction, the associated affine equality selects a singleton at the same $s$. This is the physical restriction comparison of Theorem D.8.9c.14; the proof here gives its full explicit fiber.

The source supplies the actual arc transports, a strict parent-dependent census and all physical lifts on this subgraph. It supplies neither the remaining sector vertices of Convention P.14.1k nor the restrictions and joint certifying sources they need. $\square$

<a id="theorem-d89c18"></a>

<a id="theorem-d89c18-physical-feedback-completions-of-the-continuum-aqft-bandwidth-subgraph"></a>**Theorem D.8.9c.18 (Physical Feedback Completions of the Continuum–AQFT–Bandwidth Subgraph).** Use the finite source, calibrated rod and clock records, field preparation and paid bandwidth settings of Theorem D.8.9c.17. Adjoin a feedback port from the topological-bandwidth sector to the operational-continuum sector, using the completed setting latch from the preceding epoch. There are three registered binary teacher rules on one bounded controller and carrier menu, with respectively zero, one and two global selections. Each rule has actual strict certificates at every parent tuple and an explicitly realized global restriction map. For every selected tuple its restriction fiber is the full fair two-bit archive interval of Theorem D.8.9c.17. The rules give distinct physical feedback dynamics at the same fixed external clock unit.

*Carrier, parent data and delayed feedback.* Use the three vertex names $C,A,B$ and bit labels $r,a,b$ of Theorem D.8.9c.17, with the original parent arcs $C\to A$, $C\to B$, and $A\to B$. The candidate carrier menu includes the two rod lengths $2^r\ell_*$, the energies $E_{r,a}=\hbar c(1+a)/(2^r\ell_*)$, and the bandwidth settings with densities $\sigma_{r,a,b}=\sigma_0(1+a+b)$. Each such carrier retains the same state, graph and readout comparisons as that theorem. The labels of supplied parent records are readable physical latches, and each local certificate retains the calibration, field and capacity responses distinguishing its two candidate settings.

Use a finite common prefix of the schedules as in Theorem D.8.9c.17, and pad all eight runs to a common physical epoch time $T>0$, with the same externally calibrated time unit. The physical ticks internal to each rod-dependent run keep their own values. At the end of an epoch the completed $B$ controller writes its actual chosen setting into an output latch by a reversible copy. Route a copy on fixed finite paid supports to a separate $C$ input latch, and let $C$ read it only after the transfer has completed. The feedback arc transports this physical latch and its clock record, without an instantaneous dependency on the setting whose run is about to begin. Reserve and charge the route, output and input memories, holding times, signal moves, release and verification on every candidate of the finite menu. Use fresh initialized destination latches for any finite number of epochs, retaining earlier records. A single trial and any finite iteration are therefore finite physical services. The epoch iteration describes their compatible finite prefixes.

For every declared parent tuple one can prepare its parent setting through an actual run of the corresponding carrier, copy its marked output and verify the retained rod, field or capacity response. This preparation is the forced comparison run used to evaluate the candidate, so it need not be selected by the teacher rule. In particular both $b=0,1$ occur as completed carrier preparations and can furnish the prior latch in the $C$ comparison. At $B$ the two routes for the common rod and clock are the unchanged reads of $C$'s records from Theorem D.8.9c.17. In the feedback use the same physical value of the $b$-label at the completed source cut and the receiver cut. The compatibility test at a stationary tuple identifies the preceding and current completed setting labels and their epoch-normalized clock. These are comparisons of actual marked records.

*Strict sector families.* Fix a rule tag $j\in\{0,1,2\}$ as part of each experiment's controller program, with
$$
f_0(b)=1-b,\qquad f_1(b)=0,\qquad f_2(b)=b .
$$
At $C$ the teacher target is $f_j(b)$ for the transported completed latch. At $A$ it is the copied rod bit $r$. At $B$ it is the copied onsite setting $a$. The two accepted parent arcs into $B$ still transport the actual rod, clock and field data required by its preparations; the score target is allowed to use only $a$. The teacher target is formed on a fresh private register by fixed reversible copies and, when necessary, a complement. It is verified after the candidate commits. Use a common reserved finite baseline $C_v(p)$ at each supplied parent tuple, with the separate run-dependent operating records retained as in Theorem D.8.9c.17. Charging the same target, comparator, holding and occupied slot envelope for both candidate settings and the two possible latch values gives
$$
V_v(q;p)=C_v(p)+g_v\,\mathbf 1_{\{q\ne t_v(p)\}},\qquad g_v>0,
$$
where $t_C=f_j(b)$, $t_A=r$, $t_B=a$. Thus each fixed parent tuple has a strict certificate with gap $g_v$. The two response classes are still distinct by the physical rod, Ramsey or capacity comparison, even if the candidate outcomes share the same reservation cost. The feedback rule and all reference preparations are fixed before scoring. A teacher rule is an explicit source input and does not assert that a particular feedback law follows from the original acyclic source.

*Feedback test and physical lift.* Remove $C$ as the feedback vertex of Theorem D.8.9c.4. Propagation gives $a=r$, $b=a=r$; consequently $\Phi_{\{C\}}(r)=f_j(r)$. At a fixed point the forward copies and feedback copy all agree on their shared label and clock records by construction. For $j=0$ there is no global selection and the actual successive rod settings alternate. For $j=1$ the unique solution is $(0,0,0)$, reached after one feedback update from either seed. For $j=2$ the two solutions are $(0,0,0)$ and $(1,1,1)$, each held by its own initialized setting. In the controller execution, process $C$ using the preceding completed latch, then $A$, then $B$, and finally perform the feedback transfer. The computed map is therefore the map of completed epoch settings, with no use of a same-epoch output before it exists.

Keep the independent physical archive protocol of Theorem D.8.9c.17, with the fair local $X,Y$ records and the retained joint decoder. Use one pair law with parameter $s=\Pr(X=Y)\in[0,1]$ for the marked ambient stationary preparation. The finite transition and every retained work register other than this archive are generated by the fixed controller rules from the seed, carrier and local instrument preparations. Define the ambient response domain by these actual compatible finite histories and the owned archive stock, allowing either initial setting and every admitted archive parameter, and keep the complete histories in the quotient. Restrict to the indicated sector windows and retain only the fair local archive marginals there. At a global selection compare the stationary preparation, seeded by its own completed label, so every epoch setting and every nonarchive response is fixed. Equivalently include the initial labelled epoch in the compared restriction, which excludes histories entering the fixed point from a different seed. The stationary lift fiber at each selected tuple is exactly
$$
\left\{\begin{pmatrix}s/2&(1-s)/2\\(1-s)/2&s/2\end{pmatrix}:0\le s\le1\right\}.
$$
Its members are realized by the same locally controlled archive law as in Theorem D.8.9c.17. The local restrictions agree for every $s$, and the ambient joint probability of matching separates all members. The rule $j=0$ has no stationary selected fiber. This computes the fixed-point and restriction-fiber tests on a physical cyclic extension of the actual registered subgraph. It leaves the remaining sectors of Convention P.14.1k outside the populated domain. $\square$

<a id="theorem-d89c19"></a>

<a id="theorem-d89c19-guarded-dependency-census-for-the-fifty-eight-sector-rows"></a>**Theorem D.8.9c.19 (Guarded Dependency Census for the Fifty-Eight Sector Rows).** Number the fifty-eight output rows of Convention P.14.1k in their displayed order. The guarded source-use record below has sixty-one distinct directed arcs. It is a record of typed dependencies to be instantiated on their named branches. Its entire possible feedback consists of the two opposed flavor and strong-CP arcs. An acyclic population using these arcs must resolve at least one of those two guards to an independently supplied record or a proved shared-record projection. If both arcs carry live selector dependence, the fixed-point problem on this graph reduces exactly to one return map on the two-sector block. Every remaining sector is evaluated by forward propagation, with its own certificate and overlap checks.

*Source-use record.* The row numbers agree by sector name with the source-use audit *Shared-source joins and the complete 58-row reduction audit*, with row 31 named Electroweak threshold and Higgs source finite parts. Each nonempty outgoing set is displayed below. Each successor list records distinct arcs, with the source-use conditions following the display.
$$
\begin{array}{r|l@{\qquad}r|l@{\qquad}r|l}
1&4,11&2&3,11&3&4,5\\
4&5,8,11&5&6,7,12,33,41&6&46\\
7&11,12,41&8&9,41&9&33,51\\
10&9&11&39&12&13,20\\
13&14,20&14&20,23,53&15&20\\
17&26,29,30,31,32&18&17,19&20&21,22,39,58\\
23&24,25&27&29&28&29\\
31&32,37&32&33,34,37&33&32\\
34&35&36&35&39&40\\
43&44&45&58&49&45\\
50&45&52&54&&
\end{array}
\tag{D.8.9c.19.1}
$$

On rows 1–8 the first structural arcs transport the registered binary verification, reachable carrier, rank-two active projector, marked mode and shell, and inactive flag on their actual shared structural source. The arcs into row 11 require its accepted QFI contraction and normalization. The arc $8\to9$ consumes the actual gauge representation and global form, and $10\to9$ is required when the matter source consumes the family record. An external fixed family representation has its own input record. The arcs $5,7\to12$ consume the mode and shell on the geometry source. For $12\to13$ the child uses the same continuum comparison, generator and clock. The accepted source of Theorem F.0z.8 gives a physical instance of this transport. Theorem D.8.9c.17 uses it for both of its admitted rod choices.

The arc $13\to14$ requires the actual shared regional field and state when the KMS/Wightman branch consumes them. The three slots of Definition 12.5.3k name the continuum, AQFT and KMS parents of the Einstein row, supplying $12,13,14\to20$ with the original certificate hypotheses. The bridge and overlap slots supply $15\to20$ on that source. The finite-area, flux, modular descent and covariance conditions retain their own status. Theorem F.10.12i supplies the selected thermodynamic branch and its own source comparisons. Theorem F.10.12j supplies the finite trace/identity case. Completing a Wightman output in row 14 requires the corresponding field realization independently.

The arcs $17\to26,29,30,31,32$ consume the named projections of the common master spectral record when simultaneous completion is claimed. The arcs $18\to17,19$ require the shared closed operator or the common-flow response projections on the indicated branches. The arcs $20\to21,22,39,58$ consume the Einstein-source fields only for the corresponding common metric, stress or curvature claims. The arc $14\to23$ consumes the selected KMS descent of Definition E.9.5d, and $23\to24,25$ uses the actual retained horizon record when recovery or spectroscopy uses that record. The arc $14\to53$ consumes the faithful KMS reference and strip for the registered scrambling response.

The arcs $27,28\to29$ use respectively the marked bounce/action record and the independent exponent reference when the conversion actually consumes that reference. The arcs $31\to32,37$ use the actual threshold and matching records. The arcs $9\to33$, $5\to33$ and $32\to33$ require respectively the same full native quark masses on the matter branch, the marked Grassmann parameter and determinant-line bridge of Theorem K.6.1 on that branch, and the flavor masses only when the strong-CP source takes those masses as inputs. The reverse arc $33\to32$ requires the actual strong-CP subrecord when the flavor package reports that coordinate. The arcs $32\to34,37$ use the elementary flavor data or CP record when those routes require them. The latter allows a separately proved flavor-independent CP route. The arcs $34,36\to35$ require respectively a literal common self-adjoint aggregate operator and an accepted Leech-to-boundary identification on their branches.

The arcs $11\to39\to40$ consume the acceleration bridge and the common dark-response record when the backreaction is a projection of that record. The arc $43\to44$ uses the same stationary acquisition and clock. The arcs $49,50\to45$ require the actual metric comparison and principal symbol on the cone branch. The arc $6\to46$ is the Golay bootstrap route to the QEC record. Definition A.0.1q also permits the direct certificate, whose own physical noise, code, protected instruments, threshold and cost fields remain mandatory. The arcs $5,7,8\to41$ transport the marked mode, shell and flag for the recurrent subledger. The arc $9\to51$ uses the actual fermion representation and anomaly inventory on the joint tangential branch. The arc $52\to54$ requires the common engine/task ledger when those services are identified. The arc $45\to58$ uses the cone or finite-speed response when that projection is part of the predictive equivalence certificate.

*Exact feedback test.* Remove $32\to33$ from (D.8.9c.19.1). A topological order of all fifty-eight vertices is the numerical order with $10$ immediately before $9$, $18$ immediately before $17$, $33$ immediately before $32$, $36$ immediately before $35$, and $45$ immediately after $50$. Each listed operation moves the indicated vertex while preserving the relative order of the other vertices. Direct checking of (D.8.9c.19.1) gives an increasing edge at every position in that order. Removing $33\to32$ instead uses the same ordering changes except that $32$ and $33$ remain in numerical order. Therefore any directed cycle in any activated subgraph uses both opposed arcs. Those two arcs themselves give a cycle, and the two vertices form the only nonsingleton strongly connected component of the full list. Indeed the two orders of the graphs with one arc removed exclude any other return path between the opposed vertices or any return path through an outside vertex. The printed row order is an inventory order. Six arrows of the guarded list point backward in it.

When both opposed guards carry actual selector dependence and the two source records have been accepted as a cyclic block, evaluate all ancestors outside the block by an order on the condensed acyclic graph. Denote those fixed typed parent data by $p$. Write $M_{\mathrm{fl}}(q;p)$ for the actual mass input transported from the flavor value $q$ and $R_{\mathrm{CP}}(s;p)$ for the actual strong-CP subrecord transported from the strong-CP value $s$. The two physical selectors, when supplied on their complete parent domains, give
$$
\Phi_p(q)
=
\sigma_{\mathrm{fl}}\bigl(
R_{\mathrm{CP}}(\sigma_{\mathrm{CP}}(M_{\mathrm{fl}}(q;p);p);p);p
\bigr).
\tag{D.8.9c.19.2}
$$
The block solutions are exactly the fixed points of $\Phi_p$ for which the typed overlaps pass. The strong-CP value is then evaluated from $M_{\mathrm{fl}}(q;p)$. Each such pair extends uniquely by forward selection at every downstream vertex having an accepted selector on the supplied parent record, with retention of the overlap tests. This is Theorem D.8.9c.4 with a one-vertex feedback set. It also identifies which actual finite-response maps are needed in order to apply its finite or continuous decision criteria. Removing a live feedback arc by a shared-record reduction requires equations for the two outputs over the common mass and orientation record, with inverse reconstruction on the original domains. The fixed native-mass route in Theorem K.6.6d and Definition K.6.6e exhibits the alternative to a live $32\to33$ selector. Its mass words are actual input data. Assigning the output value of a flavor calculation to those words requires a same-source map.

*Boundary of the census.* Convention P.14.1k and Definition P.14.1k.0 require the typed overlap maps for the sector arcs. The full registry of Definition P.14.1m also includes support vertices and their separate dependency edges. Equation (D.8.9c.19.1) records the guarded output-to-output source incidences, including the guards under which an independently supplied input replaces a live selector. The accepted finite graph requires the activated edges and overlap cells on one branch. Additional dependencies of any newly accepted source must be tested against its actual certificate. The existing finite continuum source supplies one native arc and its controlled alternatives as above. The full same-source certificate families, finite overlap-cell population, and global restriction map retain their physical realization and decision tests. $\square$

<a id="theorem-d89c20"></a>

<a id="theorem-d89c20-physical-flavor-to-strong-cp-transport-and-its-selected-fiber"></a>**Theorem D.8.9c.20 (Physical Flavor-to-Strong-CP Transport and Its Selected Fiber).** The prepared U34 flavor output of Theorem Y.11.7j and the fixed-stock Gauss/Wilson delivery source of Theorem K.6.6p populate the forward flavor-to-strong-CP dependency of Theorem D.8.9c.19 on their common colored source record. On the declared two-angle control menu below, the unique selected native output has $z_{\rm CP}=1$ and a positive operative gap. Two physical reference preparations yield the same selected local sector records and inequivalent ambient responses.

*The common physical record.* Use the U34 source at its fixed background $H_0=(0,Q)$, with its paired finite momentum carrier, actual heavy field, marked generation labels and native clock $t_c=\hbar/Q$. Theorem Y.11.7j imports the U34 flavor package of Theorem Y.8a, proof component 3, with the threshold of its proof component 4. In that package the complete conditioned flavor output includes charged fermions, Dirac neutrinos, mixing, the associated physical current and positive determinant orientation. Its strong-angle slot is empty. Use the actual common scalar $g_*=\sqrt{\pi/6}$, line phase word $D_{\rm phase}$, positive heat matrix $h$ and positive $T_Q$ of that source. Theorem K.6.6d gives the retained colored restriction in the energy unit $Q$.
$$
\begin{aligned}
M_u&=Q\,\frac{3T_Q}{\sqrt{43}\,g_*}\,h,\\
M_d&=Q\,\frac{3T_Q}{\sqrt{43}\,g_*}\,D_{\rm phase}^{\dagger}hD_{\rm phase},\\
M_E&=\operatorname{diag}(M_u,M_d,D_{\rm old}).
\end{aligned}
\tag{D.8.9c.20.1}
$$
Here $D_{\rm old}$ is the separately supplied heavy mass matrix on the three colored copies of the vectorlike multiplet. Its native kinetic normalization gives its coefficient directly. The retained labeled weak rest-pole current of Theorem K.6.6d is $F_u^\dagger J_+F_d=V/2$ in its stated convention. The overlap keeps the complete left and right generation frames, the same weak current and its compression, the color representation, the mass coefficients in their common frame, and the time and energy units. Weak-current insertions are used with their stated domains. The $H_0$ restriction removes neither the U34 singlets nor its charged and neutral heavy fields from that source's own record.

For a single supplied U34 word, prepare the U34 and Gauss/Wilson instruments on their respective owned factors, with their registered controls and records. Both constructors read the same unchanged coefficient and frame inputs. Formula (W1) of Definition K.6.6e places the exact $M_E$ of (D.8.9c.20.1) into the Gauss/Wilson Hamiltonian. Theorem K.6.6l identifies the left-to-right term with this same matrix and preserves the source's labeled current insertions. This is an equality of complete typed input matrices and their current dictionary. In particular all nine positive masses and the phases of the full generation matrices are carried into their specified roles. The separate finite Wilson regulator, U34 carrier, clock triggers, controls and recording support keep their own stocks and work. One may run the finite instrument prefixes in disjoint control intervals on the joined source, using the common calibrated unit $t_c$ and retaining both interval records and their actual auxiliary charges. This construction requires neither a common ultraviolet trace nor interactions between the two regulators.

On this prepared branch the U34 flavor instrument and all its outputs are independent of the delivered Wilson angle and state. Thus the forward overlap is activated and the reverse selector guard is inactive. Its absence here follows from the declared flavor output and its source action. The strong-CP coordinate comes from the native based current and operative comparison of Theorems K.6.6l and K.6.6p. Its value has no input role in the U34 matrices, mixing or thresholds.

*Finite response candidates and operative separation.* Use the source, prescribed active-flag endpoint, exact analog preparation and fixed complete delivery workstation of Definition K.6.6n and Theorem K.6.6p. Let $H(\theta)$ denote the unchanged full finite native energy matrix, $E(\theta)=\min\operatorname{spec}H(\theta)$, and $P_0=|g_0\rangle\langle g_0|$ its simple ground at zero in the globally periodic seam chart. In the declared finite comparison menu use the source state $P_0$ at each of $\theta=0,\pi$. Both settings use the same certified preparation expression for $g_0$, evaluated at the one fixed reference matrix $H(0)$ and then held fixed. The source is inactive during preparation. Activation delivers the original native energy and the separate active flag, with the common norm bound, signal duration, receiver, information cut and episode duration $T$ of Theorem K.6.6p. The angle menu is chosen by the two conjugation-fixed points $e^{i\theta}=\pm1$ of the based character circle.

For each setting allow either of the two preparations of the already paid reference $R$, $|r_\pm\rangle=(|0\rangle\pm|1\rangle)/\sqrt2$, on a two-dimensional subspace of its supplied degenerate Hamiltonian. In the actual preparation pulse use the flag-orthogonal rank-two rotation of Theorem K.6.6p with target $g_0\otimes r_\pm\otimes|1\rangle$, in place of $g_0\otimes|0\rangle\otimes|1\rangle$. The vectors in the target are normalized, the ready and target flags are orthogonal, and the pulse norm and its intermediate mean-work bound are unchanged. The additional reference state expression uses rational amplitudes and a positive square root. All signal, source-current and receiver instruments act trivially on this particular delivered reference. The local strong-CP restriction retains the complete native source state and its future native energy/current responses, the fixed operative receiver outputs and the active flag. The reference and its preparation record are physically retained at the ambient output and accessed there after the operative receiver cut. Their states do not enter the local equivalence. This choice is a restriction of the full instrument family, including its declared reference readout.

At each angle both reference settings have identical local responses and identical complete operative costs. In the preparation pulse the source is inactive and the endpoint Hamiltonians of the prepared auxiliaries are degenerate. The reference therefore changes neither the pulse work nor the downstream controlled-energy statistics. It uses the same supplied support and maintenance charge. Any installed U34 instrument prefix is common to the four settings and can be accounted on its own boundary without changing their operative differences. The two angular classes have different local energy responses, by the native cone comparison.
$$
\operatorname{Tr}(P_0H(\pi))\geq E(\pi)>E(0)
=\operatorname{Tr}(P_0H(0)).
$$
Theorem K.6.6p gives an exact attaining realization at $0,P_0$ with either reference. The complete work and information comparison in its §5 applies also to every $\pi$ realization and gives the positive separation
$$
V_\pi - V_0 \ \geq\ \frac{E(\pi)-E(0)}{T}\ >0.
\tag{D.8.9c.20.2}
$$
Here $V_\theta$ is the fixed workstation potential in its native episode units. The whole preparation and receiver are counted in it. The finite-dimensional source energy difference gives a computable strict lower bound by certified eigenvalue enclosures at the two fixed matrices and the already proved strict inequality. On the finite menu, (D.8.9c.20.2) gives the gap for Definition D.8.9a, with the actual common record (D.8.9c.20.1) as the parent overlap. The unrestricted all-angle and all-state selector continues to have its own comparison of Theorem K.6.6p. In particular the positive gap here is across the two registered response classes.

*Ambient restriction.* Let $Q_\Omega$ be the four complete physical settings just constructed, with their full retained records and fixed preparations apart from $\theta$ and $r_\pm$. Keep in the ambient comparison the reference itself and a projective $X$ readout on its indicated subspace at a later cut. The readout may use a degenerate pointer and the bounded measurement port of Definition K.6.6n after delivery, or a separately reserved finite clock interval and pointer with the same charged stock for all four settings. In the latter implementation a bounded controlled copy in the $X$ basis yields the two deterministic outcomes; its input and output pointer states are retained and its endpoint mean work is zero. All operating cost differences in (D.8.9c.20.2) are computed at the original common delivery boundary. A common padded ambient readout contributes equally to every branch.

The map to the two local records sends $(\theta,r_\pm)$ to the fixed U34 output and the Wilson record of $(\theta,P_0)$. The source response keeps the exact color/coefficient/current overlap (D.8.9c.20.1). Therefore the fiber over the unique selected pair has exactly two response classes on the delivered source and reference.
$$
\left\{P_0\otimes|r_+\rangle\langle r_+|,
       P_0\otimes|r_-\rangle\langle r_-|\right\}
\tag{D.8.9c.20.3}
$$
The fixed protocols determine the other records in each class. The specified preparation pulses attain both classes. The retained $X$ response distinguishes their ambient classes. If a larger ambient state domain admits arbitrary correlations with $R$, every lift of the same exact selected source state still has the form $P_0\otimes\sigma_R$. Indeed, positivity and $\operatorname{Tr}((I-P_0)\otimes I\,\rho_{\Omega})=0$ imply $((I-P_0)\otimes I)\rho_{\Omega}^{1/2}=0$, so $\rho_{\Omega}$ is supported on $\operatorname{ran}P_0\otimes R$. A full ambient classification in that larger domain requires the physical preparation and remaining restriction conditions on $\sigma_R$. In particular, allowing correlations alone introduces no mixed or excited Wilson state into an exact lift of the selected response. $\square$

<a id="theorem-d89c21"></a>

<a id="theorem-d89c21-uniform-strong-cp-selection-over-the-native-u34-phase-family"></a>**Theorem D.8.9c.21 (Uniform Strong-CP Selection over the Native U34 Phase Family).** Fix the positive native U34 mass and coupling inputs, the marked geometric source, and the physical clock of Theorem D.8.9c.20. Vary the flavor parent over the actual phase settings of Theorem Y.11.7j, source component 2, §§2 and 4, with $\lambda\in[0,1]$. Each setting supplies its own complete conditioned flavor record, including its native current and phase transport. On the fixed two-angle delivery menu of Theorem D.8.9c.20, the forward flavor-to-strong-CP overlap has a strict certificate at every such parent. The positive gap has one common lower bound and the selected ambient restriction fiber has exactly two response classes at every parent. On the same workstation, the unique selected native output persists when the competitor class includes all native states at the zero character or all strong characters at fixed preparation. Each enlarged comparison has physically attained competitors with potential excess arbitrarily close to zero.

*Native source family.* Keep $Q$, $\hbar$, $g_*=\sqrt{\pi/6}$, $t_c=\hbar/Q$, the positive Quillen scalar $T_Q$, the positive heat matrix $h$ and the full heavy word $D_{\mathrm{old}}$. In the marked generation frame put $\vartheta=\pi\lambda/2$ and use the actual line phases $D_\lambda=\operatorname{diag}(z_i/|z_i|)$ with $z_i=1-p_i+p_i e^{i\vartheta}$. The line and current producers are the paid short-geodesic and full-field instruments of Theorem Y.11.7j, source component 2. In particular $|z_i|\geq 1/\sqrt 2$ and the transported matrices use no phase inferred from the selected strong angle. Write $a=3QT_Q/(\sqrt{43}\,g_*)$. The shared colored input is
$$
M_E(\lambda)=\operatorname{diag}\bigl(ah,\ aD_\lambda^\dagger hD_\lambda,\ D_{\mathrm{old}}\bigr).
\tag{D.8.9c.21.1}
$$
The same parent supplies its left and right frames, native current provider and source schedule. The actual massive rest-pole weak current is $F_u^\dagger J_+F_d=Q_h^{\mathsf T}D_\lambda^\dagger Q_h/2$ in the native convention, with $Q_h$ the fixed ordered real eigenframe of $h$. The factor $1/2$ and the physical canonical current $g_*J$ remain in their respective roles. The positive mass bounds and the full heavy block stay unchanged. Each fixed phase is a separately programmed member of the paid source family, with its line control, projector paths, finite response estimates and retained records. A continuum of settings here specifies the parent domain of the family. Its members use the source's exact analog setting or its registered finite approximants and do not occupy distinct orthogonal register states of a single device. Distinct parent values give distinct marked mass/current records on this family. Indeed, for the supplied $(2,4,2)$ tuple of Theorems T.79.5e–f, $p_1=1$, $0<p_2<1$, and $h_{12}>0$ in the marked frame. The phase of the $(1,2)$ entry of $D_\lambda^\dagger hD_\lambda$ is $\arg z_2-\vartheta$, whose derivative with respect to $\vartheta$ is
$$
-\frac{(1-p_2)(1-p_2+p_2\cos\vartheta)}{|z_2|^2}<0.
$$
This phase remains in $[-\pi/2,0]$ and is injective there as a function of the setting. This test uses the retained marked relative phase and complete current, while the four mass spectra remain constant.

*Full colored response at every phase.* Use the complete finite $K=3$ seam-chart source of Definitions K.6.6e and K.6.6m and the paid delivery law of Theorem K.6.6p. The parameter $\theta$ in that source is the strong character, independent of $\vartheta$. For a fixed $\lambda$, let
$$
U_\lambda=\operatorname{diag}(I_3,D_\lambda^\dagger,I_3)
$$
act on the colored generation space. Its lift $\mathcal U_\lambda$ is the identity on seam nodes and the probe and the full canonical exterior lift of $I_{\mathrm{site,color,spin}}\otimes U_\lambda$ on the fermion Fock space. Then $M_E(\lambda)=U_\lambda M_E(0)U_\lambda^\dagger$. The one-particle Wilson shifts and spin coefficients act trivially on generation, so this identity conjugates the complete one-particle operator (W1). The lift commutes with every sitewise color action, hence with the Cartan projection, its compensated probe sectors, the differentiated total-charge operators in (W5), and the charged seam. The absolute reference and magnetic scalar, hopping weights, energy unit and clock are fixed. Consequently, on the full physical carrier,
$$
H_\lambda(\theta)=\mathcal U_\lambda H_0(\theta)\mathcal U_\lambda^\dagger .
\tag{D.8.9c.21.2}
$$
Here $H_0(\theta)$ uses the zero flavor setting at the same retained massive background; the label $0$ has no Higgs-background role. The vectorlike lift acts on both Dirac chiralities, preserves every Fock sector and introduces no axial determinant phase. The scalar seam derivative and its source-owned strong current identity of Theorem K.6.6l are transported by the same lift. The weak insertion dictionary is instead evaluated literally at the supplied parent phase, with the native weak frames and charged providers of Theorem K.6.6d and Theorem Y.11.7j. The proof of (D.8.9c.21.2) uses the unprobed strong Hamiltonian. It makes no equality claim for the responses to identical weak insertions at distinct parent phases.

*Uniform operative certificate.* Set $E(\theta)=\min\operatorname{spec}H_0(\theta)$ and let $P_\lambda=\mathcal U_\lambda P_0\mathcal U_\lambda^\dagger$, where $P_0$ is the simple ground projector of $H_0(0)$. Equations (D.8.9c.21.1)–(D.8.9c.21.2) give exactly the native positive mass convention and the same based strong character throughout the phase family. The source Hamiltonian norm bound, activated flag energy, gap $E(\pi)-E(0)>0$, ground energy and reference signal duration of Theorems K.6.6i and K.6.6p are independent of $\lambda$. In each parent run, the delivery task uses the same comparison with candidates $(0,P_\lambda)$ and $(\pi,P_\lambda)$, prepared in the idle block by the flag-orthogonal pulse of Theorem D.8.9c.20. Its target vector is $\mathcal U_\lambda g_0$ in the native factor, with $P_0=|g_0\rangle\langle g_0|$. The prepared source's native matrix recipe takes the supplied phase word in (D.8.9c.21.1), and (D.8.9c.21.2) binds its simple-ground proof to the known baseline. On the fixed full occupation basis the exterior map multiplies each occupation vector by the finite product of its occupied down-flavor phases, leaving all other occupations and the probe unchanged. The phase formulas use the certified positive denominators above. Thus the native matrix and target vector are finite supplied expressions with total requested-precision evaluation as in Theorem K.6.6o. They are parameter data of the declared analog port. There is no additional pulse on the active source to change its flavor setting. The source and reference remain inactive during preparation, with the same preparation norm and work bounds.

At each parent, install its common U34 producer and readonly overlap input in both angular settings. Its schedule and any auxiliary work are accounted on their own supplied boundaries before the fresh native forecasting trial. At a fixed parent these charges are common to the competing strong outputs. Each angle uses the complete paid source delivery, with the same readiness, episode time $T$ in native units, information cut, active flag and allowance for other owned devices of Theorem K.6.6p. The reference alternatives and later readout are those of Theorem D.8.9c.20. The zero character has the same saturating information and work witness because the native energy signal and its reference ground are transported together. For the operative potentials at fixed parent,
$$
V_{\lambda,\pi}-V_{\lambda,0}
\ \geq\ g_*^{\rm del}:=\frac{E(\pi)-E(0)}{T}>0.
\tag{D.8.9c.21.3}
$$
Here $E$ is expressed in the energy unit of the workstation scalarization; $g_*^{\rm del}$ is an operative rate and is distinct from the coupling $g_*$. The bound holds against every admitted implementation of the $\pi$ candidate under the stated paid-delivery law. One verified positive lower enclosure for the baseline energy difference serves every phase. In particular the comparison includes the zero flavor phase and phases where the independent weak-CP contrast need not be positive. The local winner is always $(0,P_\lambda)$ with $z_{\rm CP}=1$. The finite two-class carrier and the stated gap provide the strict certificate on the fixed strong menu for every parent phase.

*Fixed point and ambient restriction on the joined family.* The upstream flavor records are prepared source settings. They do not read the strong output. For each supplied setting the forward selector propagates to the unique selected strong output above, with the exact transported matrix, current, clock and frame overlaps. The full declared ambient family consists of these two angular experiments and both reference preparations over every supplied parent. The parent record, including its marked phase and clock, is retained in the restriction. The two ambient classes over a selected tuple at fixed parent have native/reference endpoint states
$$
P_\lambda\otimes |r_+\rangle\langle r_+|,
\qquad
P_\lambda\otimes |r_-\rangle\langle r_-|.
\tag{D.8.9c.21.4}
$$
The paid late $X$ measurement separates them, while all local source and native receiver records are independent of the reference choice. Every ambient member has one of the two declared reference preparations and its given parent's paid schedules, which proves exhaustion of the selected fiber on this domain. Since the parent is supplied rather than selected by a flavor objective, the complete selected relation over the parent family is the graph of this strong selector with the stated fibers.

*Attained competitors on larger local domains.* At any fixed $\lambda$ and $\theta=0$, let $g$ span $P_\lambda$ and let $P_j$ project onto one seam node on the full native carrier. Faithfulness of the baseline ground at each seam node in Theorem K.6.6h gives $0<p:=\|P_jg\|^2<1$, preserved by $\mathcal U_\lambda$. For rational $0<\epsilon<1$, use the same paid preparation with target $b_\epsilon=e^{-i\epsilon P_j}g$ and the same source signal. The finite phase gate on $P_j$ defines the target expression of the original preparation pulse. Its value at the source endpoint uses no additional active-source pulse. The orthogonal component of $b_\epsilon$ relative to $g$ has squared norm
$$
w_\epsilon=p(1-p)|e^{-i\epsilon}-1|^2>0 .
$$
If $f_\epsilon$ is the normalized orthogonal component, the native energy excess is $w_\epsilon(\langle f_\epsilon,H_\lambda(0)f_\epsilon\rangle-E(0))$, strictly positive by the simple ground and bounded by $2B w_\epsilon$ in workstation energy units. The energy expectation survives the signal, which is a function of the native Hamiltonian on the source factor. Thus the complete native response distinguishes this delivered class from the ground. On a successful native trial the actual meter distribution is the convex mixture of the ground and $f_\epsilon$ signal distributions with weights $1-w_\epsilon$ and $w_\epsilon$. The cross terms vanish on tracing the source since $g$ is an eigenvector and the source signal preserves $g^\perp$. The unchanged $Y$ readout has error at most $w_\epsilon$. The information deficit from $s\ln 2$ is at most $s h_2(w_\epsilon)$, where $s$ is the original success probability and $h_2$ is binary entropy. The preparation uses the same stock and its endpoints are degenerate before source activation. The native energy excess is the only additional net work. Theorem K.6.6p bounds the positive potential excess by $(2B w_\epsilon+\Gamma s h_2(w_\epsilon))/T$. This tends to zero with $\epsilon$.

A second sequence uses the same preparation $P_\lambda$ and rational nonzero $\theta\to 0$. In the normalized seam chart only the two mutually adjoint seam blocks change. Their difference is an off-diagonal block and its adjoint with seam magnitude $t>0$ and unitary charged clutch. Consequently
$$
d(\theta):=\|H_\lambda(\theta)-H_\lambda(0)\|
=t|e^{i\nu\theta}-1|.
$$
The same source signal and readout use the unchanged duration $\tau$ of Theorem K.6.6p, now expressed in physical seconds with $H_\lambda$ and $d$ in physical energy units. For either protected message, the signal generator is $(H_\lambda(\theta)+\Delta I)\otimes(I\pm Z)$, where $\Delta$ is the common active-flag energy. Its change has norm $2d(\theta)$. The finite Duhamel norm bound for the two signal unitaries is $2\tau d(\theta)/\hbar$. The wrong-outcome projector in the registered meter kills the corresponding zero-character output, so the probability of error on success is at most $(2\tau d(\theta)/\hbar)^2$. The native energy excess at delivery lies between $E(\theta)-E(0)>0$ and $d(\theta)$, and the other endpoint and readiness terms are unchanged. In the operative scalarization, with $d(\theta)$ converted by the common energy unit as in Theorem K.6.6p, the potential excess tends to zero by the energy bound and binary Fano inequality.

Both sequences retain actual native responses distinct from the selected class and use the same paid workstation. They violate every positive gap in Definition D.8.9a on their respective enlarged domains, while the all-implementation comparison in Theorem K.6.6p still supplies the unique selected native output. The strict certificate in (D.8.9c.21.3) uses the declared two-angle, fixed-state candidate menu. $\square$

<a id="theorem-d89c22"></a>

<a id="theorem-d89c22-physical-reverse-strong-cp-record-and-finite-u34-feedback"></a>**Theorem D.8.9c.22 (Physical Reverse Strong-CP Record and Finite U34 Feedback).** Retain the native U34 phase settings $\lambda=0,1$ and the Gauss/Wilson delivery settings $\theta=0,\pi$ of Theorem D.8.9c.21. Add a fixed paid source-response test in a fresh copy of the same physical Gauss/Wilson representation. One deterministic two-outcome test identifies the delivered character at either setting and either phase. Its outcome can be transported to the flavor output as the actual strong-CP coordinate. The original forward overlap and this reverse overlap admit a finite delayed two-sector completion with strict certificates at both parents of each sector, one fixed selection, and two ambient response classes over that selection.

*Native binary readout.* In the globally periodic normalized seam chart, let $H_{\lambda,b}=H_\lambda(b\pi)$ for $b\in\{0,1\}$ and let $H_{\lambda,c}=(H_{\lambda,0}+H_{\lambda,1})/2$. Write $t>0$ for the native seam hopping in physical energy units. On the full physical carrier the difference is
$$
H_{\lambda,b}-H_{\lambda,c}=(-1)^b t B,\qquad
\|B\|=1,
\tag{D.8.9c.22.1}
$$
where $B$ consists of the two seam blocks with the normalized charged clutch and its adjoint, including the common sign of the original Hamiltonian hop. This follows from the primitive winding $\nu=-1$ of Theorem K.6.6l: at $\theta=\pi$ its seam phase is $-1$, and the other blocks in the seam chart remain fixed. The physical internal vector given by the empty fermion Fock state and the normalized identity of $\operatorname{End}(\mathbb C^3)$ in the probe is fixed by all gauge actions, the charged clutch, and the exterior flavor transport of Theorem D.8.9c.21. Use the two normalized vectors $u,v$ at the two seam nodes with this internal vector, with the relative sign chosen so that $Bu=v$ and $Bv=u$.

On a fresh paid test factor run the native Hamiltonian at the completed source's actual setting, with the single added control $-H_{\lambda,c}$. The latter depends on the supplied mass/current word $\lambda$ and both reference matrices of the fixed native menu. It has no dependence on the character being tested. The two reference matrices and the control are finite bounded expressions in the physical matrix syntax of Definition K.6.6n. The added test has its own declared control amplitude and clock duration, with sufficient capacity for this unscaled midpoint control on the full Gauss carrier. Hold the control for the common physical duration $\pi\hbar/(4t)$. From input $u$, equation (D.8.9c.22.1) gives the two unit output vectors
$$
\xi_b=\frac{u-i(-1)^b v}{\sqrt2},\qquad
\langle\xi_0,\xi_1\rangle=0.
\tag{D.8.9c.22.2}
$$
The two-outcome projective measurement with effect $|\xi_0\rangle\langle\xi_0|$ therefore reads $b$ exactly. The effect on the other outcome is its complement on the full test carrier. A bounded unitary copies the projector outcome to a fresh degenerate record; the unused physical levels and the test state are retained. The outcome is a response to the actual seam Hamiltonian, with no access to the source's program value of $b$. The owned test hardware receives the same external native setting as the delivery carrier. On the two-setting comparison this is a joint preparation of two copies of the same declared source member. No unknown state is copied, and the delivered state's factor is left intact. During the test the auxiliary control is common and bounded, and its work and switching enter the test's independent physical boundary. If the integrated perturbation norm of the test generator divided by $\hbar$ is at most $\epsilon$, Duhamel's inequality bounds the wrong-outcome probability by $\epsilon^2$ with the exact preparation and effect.

*Paid delayed completion.* Use the same native phase, color and current records in the two phase settings, with the same two delivered angular candidates and reference states of Theorem D.8.9c.21. Reserve the test on a separate factor after the original operative cut and return its classical result to a flavor record in the next epoch. An owned ready latch permits either incoming result for the first epoch. Retain at the flavor cut the native phase and its full charged and neutral output, the returned bit, and the physical character $(-1)^b$ as an additional coordinate. The positive full native mass orientation and the fixed winding normalization of Theorem K.6.6l identify that coordinate with $z_{\mathrm{CP}}$ on this branch. The reverse arrow transports the actual readout, and its value changes the reported strong coordinate at the flavor cut. The forward arrow keeps the complete native mass matrices, frames and weak-current providers, which distinguish the two phase labels by the injectivity test of Theorem D.8.9c.21. Each arrow reads only a completed record in its declared epoch.

For the flavor comparison choose the paid reserved-resource forecast grammar of Theorem D.8.9c.17. At a fixed incoming bit $b$, the native phase candidate $a\in\{0,1\}$ commits a bit equal to its phase label. The target is a retained reversible copy of the supplied readout, whose actual output is available for verification after the commitment. The readiness contract restricts the comparison to these two phase programs, each with its fixed copied commitment. The equality test distinguishes both candidates. Set aside the same stock, common clock duration, maximum reserves, fixed control routes and output registers for both, padding the shorter local schedule with identity controls. Both native phase words and their producers remain in the same owned inventory. For this reserved-resource potential, at fixed $b$ the common charge is $C(b)$ and the positive score weight is $g$. Thus the flavor cost is $C(b)+g\mathbf1_{\{a\ne b\}}$, yielding $a=b$ as its strict selector at each parent. The measured work, both program schedules and all comparison outcomes remain in the response record. This flavor objective is a supplied finite comparison with a measured target bit from the strong-source protocol. It uses neither an empirical flavor value nor a claimed optimum on the full native flavor domain.

The strong comparison uses its original operative delivery cost, at the original cut, for each fixed phase. The independent post-cut test and the separately priced flavor comparison leave that delivery objective well defined. This completion declares those local cost boundaries and the positive time of both readout and return in one common schedule. Its ambient receiver retains the original delivery, the test, the returned records, and the two reference states with their later $X$ readout. At a fixed phase the strong selector still chooses $b=0$ by (D.8.9c.21.3). The two parent-conditioned response quotients have two distinct classes each: the phase matrix distinguishes $a$, and the actual character readout distinguishes $b$. Their local strict gaps are $g$ and the uniform positive delivery gap of Theorem D.8.9c.21. Matching the returned records enforces the fixed equations $a=b$, $b=0$, with the unique solution $(a,b)=(0,0)$. The fixed tuple's ambient fiber consists exactly of the two reference states of (D.8.9c.21.4). Indeed every admitted prepared source uses one of those states; all other included records and instruments at the fixed tuple are prescribed and independent of the reference choice until its late readout. The two states are distinguished by that readout. This gives a physical selection and restriction fiber for this prepared two-sector completion. $\square$

<a id="theorem-d89c23"></a>

<a id="theorem-d89c23-minimal-parallel-route-equality-census-for-the-guarded-sector-graph"></a>**Theorem D.8.9c.23 (Minimal Parallel-Route Equality Census for the Guarded Sector Graph).** Use the fifty-eight vertices and guarded incidence list (D.8.9c.19.1). Let $G_-$ remove $32\to33$, let $G_+$ remove $33\to32$, and let $G_0$ remove both. For the comparison of maps in this theorem, each vertex carries one declared typed object and every arc is a map between its endpoint objects. Equality is equality of the resulting typed composites, including equality in a response quotient when every arc descends to that quotient. On each of the three acyclic graphs every equality between parallel paths follows from the same thirteen route equations below. Thirteen is the minimum number of equations between raw parallel paths for this universal implication.

For a finite acyclic graph and a pair $(u,v)$ with a path of positive length, form the finite undirected graph whose nodes are all paths $u\rightsquigarrow v$. Join two paths when they share a vertex distinct from their endpoints. Let $c_{uv}$ be the number of connected components. A minimal generating list of parallel-path equalities has $\sum_{u,v}(c_{uv}-1)$ equations, summed over pairs with a positive-length path. One such list picks a route in each component and equates the first picked route to each of the others. The counts for the three guarded graphs are
$$
\begin{array}{c|r|r|r|r}
&\text{arcs}&\text{paths of positive length}&\text{endpoint pairs with several paths}&\sum(c_{uv}-1)\\\hline
G_-&60&674&129&13\\
G_+&60&620&115&13\\
G_0&59&614&113&13
\end{array}
\tag{D.8.9c.23.1}
$$
The route equations are listed as pairs of vertex words in the direction of travel:
$$
\begin{array}{c|c}
(1,4,5,7,11)&(1,11)\\
(2,3,4,5,7,11)&(2,11)\\
(3,4,5)&(3,5)\\
(4,5,7,11)&(4,11)\\
(4,5,33)&(4,8,9,33)\\
(4,5,7,41)&(4,8,41)\\
(5,7,12)&(5,12)\\
(5,7,41)&(5,41)\\
(7,11,39)&(7,12,13,14,20,39)\\
(12,13,14,20)&(12,20)\\
(13,14,20)&(13,20)\\
(17,31,32)&(17,32)\\
(31,32,37)&(31,37)
\end{array}
\tag{D.8.9c.23.2}
$$

*Proof of generation and sharpness.* Induct in increasing endpoint span in a topological ordering. If paths $p,q$ from $u$ to $v$ meet at an interior vertex $w$, apply the induction hypothesis to their two prefixes from $u$ to $w$ and to their suffixes from $w$ to $v$. Composing the shorter equalities gives $p=q$. Therefore equalities within each path component follow, and the listed cross-component equations connect the components. For the lower bound, consider the free path category and its congruence generated by a proposed list. A single application of an equation with any nontrivial prefix or suffix preserves the component of the resulting $u$-to-$v$ path: the common prefix or suffix contains an interior endpoint of the replaced segment. Thus different components for $(u,v)$ can be joined only by equations with endpoints exactly $(u,v)$. At least $c_{uv}-1$ of these are needed. This formal obstruction is realized by actual set maps whenever the proposed list is insufficient. Let $\mathcal C$ be the quotient path category by the given equations and assign vertex $v$ the finite set $\bigsqcup_x\operatorname{Hom}_{\mathcal C}(x,v)$. Each arc acts by postcomposition. The proposed equations hold as maps, and any two paths still distinct in $\mathcal C$ act differently on the identity at their common source. This establishes the stated universal minimum, with a finite witness when a needed equation is omitted.

*Finite census.* In reverse topological order construct lists $P(u,v)$ of positive-length paths. For every successor $w$ of $u$, add $(u,w)$ to $P(u,w)$ and prepend $u$ to every member of $P(w,v)$ for every $v$. The graph is acyclic and the first-edge decompositions are disjoint. For each pair with at least two paths, begin with a singleton component for each word. For each interior vertex, merge all components containing a word with that vertex. Count the resulting components and take the lexicographically first word in each. Applied to (D.8.9c.19.1), the three recurrences give (D.8.9c.23.1). In each graph precisely the thirteen endpoint pairs in (D.8.9c.23.2) have two components; all other path graphs are connected. The listed words are their first representatives. This procedure uses only finite incidence and literal vertex words, and checks every path.

For an actual overlap audit under Definition P.14.1k.0, the equations apply to maps with a common source, common destination and compatible composition through each intermediate object. If a sector has different ports or domain restrictions along two routes, type the ports and retained common domains first, and run the recurrence on the resulting graph or prove separately that the listed equalities restrict and compose on the required domain. Additional activated support vertices of Definition P.14.1m require their own incidence and typing record. Deleting further guarded arcs can disconnect a path component, so a proper activated subgraph can use the same recurrence on its own incidence list. $\square$

<a id="theorem-d89c24"></a>

<a id="theorem-d89c24-quantum-archive-compatibility-and-sharp-hidden-response-on-the-three-sector-source"></a>**Theorem D.8.9c.24 (Quantum Archive Compatibility and Sharp Hidden Response on the Three-Sector Source).** Retain the three physical sector menus and forward strict selectors of Theorem D.8.9c.17, or the three delayed controller rules of Theorem D.8.9c.18. Extend their common finite hardware with three marked archive qubits $A,B,C$. The continuum, local-net and topological-bandwidth restrictions respectively retain the whole pair states on $AB,BC,CA$. They share the literal singleton restrictions. Keep the original two classical archive records of Theorem D.8.9c.17 at a fixed independently supplied pair law. The new archive factors carry no control, score or reference target of the original sectors. At each sector fix its local pair state through the family
$$
W_i(q_i)=q_i P_i+\frac{1-q_i}{3}(I-P_i),\qquad 0\le q_i\le1,
\tag{D.8.9c.24.1}
$$
where $i=AB,BC,CA$ and $P_i$ projects onto the pair singlet. The retained local operations can perform full tomography of their marked pair. Every such local family has actual sector certificates on the padded comparison. Every singleton overlap is the maximally mixed qubit, and the original strict selections and their gaps are unchanged. For each selected tuple with these pair records, set $S=\sum_i q_i$ and $E=\sum_i(q_i-S/3)^2$. Then its ambient archive fiber is nonempty exactly when
$$
S\le\frac32,\qquad E\le \frac{S^2}{6}.
\tag{D.8.9c.24.2}
$$
It contains a full-rank state exactly when $0<S<3/2$ and $E<S^2/6$. On that strict interior the exact affine dimension of the full ambient fiber is $27$. Every boundary fiber has the finite support and dimension test below. There is a fixed norm-one physical readout $K$ whose attained response interval over the full fiber is
$$
\left[-\frac23\sqrt{S^2-6E},\ \frac23\sqrt{S^2-6E}\right].
\tag{D.8.9c.24.3}
$$
If $q_i=q>1/2$ for all three pairs, the minimal worst-pair total-variation error of any joint preparation is $q-1/2$ under the stated tomography comparison. Thus three full-rank local archive preparations, with all singleton overlaps passing, can leave the selected physical ambient fiber empty on the original strict-selector carrier.

*Physical source and maps.* Add one finite preparation, reference and archive retention service with a positive clock interval and fixed resource capacity. The three marked two-level factors are part of this supplied extension. In each locally tested sector prepare its specified pair by a fixed finite spectral purification and leave the third logical archive factor outside the pair's experiment. For the common ambient protocol admit all three-qubit density matrices prepared by a purification on an eight-dimensional auxiliary factor. For both protocols choose the same stock by padding the local purification and use a positive-duration finite matrix-control preparation that takes a ready vector to the supplied purification. A unitary mapping these vectors exists on the fixed finite carrier, and a self-adjoint logarithm of norm at most $\pi$ gives a uniform pulse-capacity reservation at the fixed clock step. The archive and its purifying source stock have separate ownership. The purifier's output is restricted to its supplying preparation boundary, with its ownership and release retained. It supplies no response port of the compared archive. Finite precision in a supplied state or pulse requires its own preparation and readout errors. The exact source class is the finite supplied-state matrix-control branch.

At the local and joint archive release boundaries use the ordinary marked Pauli tomography, including the appropriate marginal readout when part of a pair is forgotten. Every measurement uses its own complete ready pointer and retains all outcomes. Repetition for a diagnostic uses fresh copies. The three singleton restrictions are literal partial traces and inherit the same qubit frames. For every sector and every parent setting the added pair preparation is fixed before comparing that sector's original two candidates. It is independent of the score, the original preparation noise, and every decision and latch. Factorization of the original operations with archive identity preserves their full response and strict scores. The archive's complete stock and control tariffs are fixed within the comparison and enter the common reservation. Thus the original selector equations hold on the extended domain at every parent. Once the tuple of original sector outputs is selected, its global restrictions are exactly the old outputs and the three indicated pair states. The ambient comparison keeps the complete three-qubit archive state by full tomography, and includes no additional variable accessible purifier coordinate. Equality of its response therefore identifies exactly equality of the density matrix. This specifies the complete restriction map and physical carrier for this archive extension. In the delayed case compare stationary lifts as in Theorem D.8.9c.18.

*Compatibility and maximal support.* The scalar feasibility calculation is the three-qubit case of tripartite Werner joinability (Johnson and Viola 2013). The common spin decomposition is
$$
(\mathbb C^2)^{\otimes3}=H_{3/2}\oplus(H_{1/2}\otimes\mathbb C^2),
\qquad \dim H_{3/2}=4,\quad\dim H_{1/2}=2.
$$
For clarity, the symmetric quartet is the spin-$3/2$ summand and the remaining two spin doublets have identical spin action. The swaps $T_i$ of the three pairs act as the identity on the symmetric quartet and as $I_{H_{1/2}}\otimes n_i\cdot\sigma$ on the second summand. Indeed they are three traceless real reflections on the standard two-dimensional representation of the permutation group. The product of any two different swaps has order three and trace $-1$ there, so the three unit Bloch vectors $n_i$ lie in a common plane with pairwise inner product $-1/2$ and sum zero. Choose the plane's orientation once, with unit normal $n_\perp$. The singlet projections on the full space are $(I-T_i)/2$. Let $K$ be zero on the quartet and $I_{H_{1/2}}\otimes(n_\perp\cdot\sigma)$ on the doublets. Equivalently it is one of the two signs of $i[T_{AB},T_{BC}]/\sqrt3$. This bounded self-adjoint readout has spectrum contained in $\{-1,0,1\}$ and is a finite measurement on the same ambient archive. The orientation is fixed by the order of the marked qubits.

Average any joint state under the common spin action. The three reduced states (D.8.9c.24.1) are preserved, as is $\operatorname{Tr}(\rho K)$. The averaged state has the form
$$
\rho_{\rm av}=(1-w)\frac{I_{H_{3/2}}}{4}
\ \oplus\ \frac{I_{H_{1/2}}}{2}\otimes\frac{wI+(v+z n_\perp)\cdot\sigma}{2},
\qquad |v|^2+z^2\le w^2,\quad 0\le w\le1,
\tag{D.8.9c.24.4}
$$
where $v$ is planar. This follows from the two irreducible spin types and their multiplicities (Eggeling and Werner 2001). Taking the singlet expectations gives $q_i=(w-n_i\cdot v)/2$. Therefore $w=2S/3$ and
$$
|v|^2=\frac83 E,
\qquad z=\operatorname{Tr}(\rho K).
\tag{D.8.9c.24.5}
$$
The planar vector is fixed by the three equations, since the three $n_i$ span the plane and their only relation is their zero sum. The norm formula follows from $\sum_i n_in_i^{\mathsf T}=(3/2)I$ on that plane. Every density of the form (D.8.9c.24.4) has exactly the specified reduced Werner states when those equations hold: rotational invariance gives precisely the singlet and uniform-triplet mixture, with the weight determined by $q_i$. Consequently choosing $z=0$ proves sufficiency of (D.8.9c.24.2), and varying $z$ gives all and only the values in (D.8.9c.24.3), including the endpoints. Necessity follows by averaging any hypothetical lift. The averaged center at $z=0$ is strictly positive on both spin blocks exactly under the stated strict interior conditions. Conversely the average of a full-rank state is full rank, so the criterion is exact.

*All lifts, including those that are not rotation invariant.* Put $\rho_0=\rho_{\rm av}$ with $z=0$, and let $P$ be its support projection. If $w=0$ or $w=1$, every compatible state is supported away from the respective missing block because its population is fixed by the sum of the pair singlet tests. When $w>0$ and $|v|=w$, the averaged state of every compatible lift has $z=0$ and the same rank-one multiplicity support inside the spin-doublet part. Its orthogonal complement is invariant under common rotation. A compatible state has zero expectation of that complement because its average does. A positive matrix with zero expectation of an orthogonal projection has no support there. These facts prove that $P$ contains every compatible support, and $\rho_0$ attains that whole support. The complete fiber is the following explicit spectrahedron:
$$
\left\{\rho_0+H:\ H=H^*=PHP,\quad \operatorname{Tr}_{A}H=\operatorname{Tr}_{B}H=\operatorname{Tr}_{C}H=0,\quad \rho_0+H\succeq0\right\}.
\tag{D.8.9c.24.6}
$$
Every sufficiently small Hermitian perturbation in the indicated kernel remains positive on $P$. Its real affine dimension is therefore $(\operatorname{rank}P)^2$ minus the real rank of the compressed Hermitian Pauli words $P(\sigma_a\otimes\sigma_b\otimes\sigma_c)P$ with at least one identity letter. The rank is computed by the Gram matrix on the support. There are exactly $1+9+27=37$ such constraints. For $P=I$ they are orthogonal, giving $64-37=27$. When $S=3/2$ and $E=S^2/6$, the support is one spin doublet. The total spin components, sums of single-qubit Pauli matrices divided by two, restrict to the three independent spin matrices on that support. Together with the identity they give rank four and hence one unique lift. This finite formula covers the other boundary cases with their actual support projection. The interval (D.8.9c.24.3) describes one ambient distinction inside this full fiber.

*Sharp obstruction with complete local records.* If $q_i=q>1/2$ and the proposed joint state is arbitrary, let $p_i$ be its singlet probabilities. The pointwise operator bound $\sum_i P_i\preceq(3/2)I$ gives $\min_i p_i\le1/2$. One local singlet test then differs by at least $q-1/2$ in total variation. The joint state (D.8.9c.24.4) with $w=1$ and $v=z=0$ has all pair states $W_i(1/2)$. Their trace distance to $W_i(q)$ is exactly $q-1/2$, and the singlet test attains it. Thus this error is optimal over all ambient preparations for a comparison retaining the complete pair laws. For $1/2<q<1$ all supplied local states have full rank and all shared singleton restrictions agree exactly. The exact obstruction comes from the joint archive on the declared same carrier. A change of archive interface, a different global source or the remaining activated sectors requires its own compatibility test. $\square$

<a id="theorem-d89c25"></a>

<a id="theorem-d89c25-qualified-physical-link-and-retained-observer-overlap"></a>**Theorem D.8.9c.25 (Qualified Physical Link and Retained-Observer Overlap).** Take two complete $R_{14}$ hosts in the byte-exact classical source presentation of Definition 2.4.1i and Theorem 2.4.1k. Add a finite protected or unprotected one-way link on a common paid service boundary. The sender uses its actual immutable initial bit $I_0$ as the link input. A receiver prediction port sees only the released output before its own report is committed. On the independently prepared code-capacity noise family below, this common source supplies the direct QEC record of Definition A.0.1q for the one-bit transmission task, together with the original level-zero retained-algebra record of Definition O.3c for each host. This instantiates the QEC and retained-algebra output rows 46 and 48 of Theorem D.8.9c.19 on a single prospective source with a checked common host restriction. The QEC task has an explicit strict same-window comparison. The original host qualification remains source-relative to its unchanged presentation.

*Carrier, control and noise.* The two independently initialized hosts run their native instruments on the original schedule $[0,14\tau]$. They retain every original preparation, collision, verifier, receipt and abort branch. Fix a positive tick duration for a finite link schedule after the native qualification window, with paid common waits from launch through report release. The bit $X=I_0$ of the sending host is a fair classical record, also retained in its initial snapshot. Couple that register to a ready transmission qubit by controlled $X$ in the computational basis. A Hermitian involution $U$ on a finite paid support is effected in duration $d>0$ by $\pi\hbar(I-U)/(2d)$. The control preserves the host record, commutes with its diagonal readout, and has no inverse path into any native update or score. The receiver stock and command selection are prepared independently of $X$. The carrier keeps the host records, the ready stock, all link noise registers, syndrome pointers and recovery records, the report, and the final truth copy. Only the final decoded qubit and independent receiver ancillas can be used to make the report. An immutable latch closes its write port before the truth and private records can be released. The verifier and meter act after this latch. The independent source law, support of the conditional operations and the fixed release time verify this access condition directly.

For each $q\in(0,1/64]$ use a supplied independent pair of Bernoulli-$q$ flags at each physical channel slot. Apply controlled $X$ and then controlled $Z$ from the corresponding flags, retaining both. There is one slot in the bare link and there are twenty-three slots in the protected link. This implements $\mathcal N_q$ and its twenty-three-fold product on arbitrary input states and arbitrary untouched references. All other operations are exact on this declared code-capacity source. For the protected carrier, encode the input with Proposition A.0.2d's $[[23,1,7]]$ CSS code. An explicit isometry sends $|b\rangle$ to the uniform superposition of $C_{23}^{\perp}+b\mathbf1$. The two cosets are orthogonal, so Gram completion gives a finite unitary on the full twenty-three-qubit carrier from twenty-two ready qubits. For each of the twenty-two stabilizers $S_j$ use the two branch maps with Kraus projections $(I\pm S_j)/2$, realized by a controlled stabilizer from a fresh plus pointer and its $X$ readout. Apply the two syndrome-leader corrections from Proposition A.0.2d and then the inverse encoding. The two eleven-bit tables are obtained by enumerating every weight-at-most-three vector and computing its syndrome. No syndrome, private fault flag or failed transmission is discarded. This constructs the complete required gate, syndrome and recovery word. Under the given independent physical exposure its decoded channel is $\mathcal N_{f_{23}(q)}$, by the independent logical $X$ and $Z$ laws (A.0.2d.2). The statement keeps the actual larger instrument that records the flags and syndromes.

The operations can use a sending bank, two endpoint-owned access banks and a finite ordered rail of named auxiliary registers. Finite matrix gates on a bank have self-adjoint logarithms on the whole finite support, with norm at most $\pi\hbar/d$ for a duration $d$ after an irrelevant global phase. Carry each physical channel qubit along the rail by adjacent swaps, expose its independently initialized flags at the receiver-side slot, and use the receiver bank for correction and decoding. Reserve the full finite schedule of positive-duration gates, routes, reads, holds and truth release in both branches. The bare branch pads with identity services at the same boundaries. Include all link stock and power supplies, its timing and classical lookup controls, the native host holds, and the private measurement and meter stock in the service account. This uses the explicitly enlarged local supports of Definition B.4. Spatial separation and all intermediate rail addresses are fixed before the input, and the reserve intervals allow the registered propagation time. There is no earlier release in an error branch. The LINK test exposes an independent input to the actual channel interface with the indicated norm domain. Its free one-qubit input is a different command from the fixed host-bit prediction preparation.

*Exact error and paid strict comparison.* For an unassisted single-qubit input, the channel shrinks Bloch coordinates by $1-2q,(1-2q)^2,1-2q$ in $X,Y,Z$ order. Its maximum half trace distance from the ideal output is therefore $p_0(q)=2q(1-q)$, attained on a $Y$ eigenstate. The same computation gives $2f_{23}(q)(1-f_{23}(q))$ for the protected link. An admissible conservative threshold in this error coordinate is $p_{\rm th}=2(1/32)(31/32)=31/512$. Indeed $2q(1-q)$ is strictly increasing on $[0,1/2]$ and $1/32$ is below the code-capacity threshold in Proposition A.0.2d. In the reference-extended test the error coordinate is instead $1-(1-q)^2$: the triangle inequality for the mixture gives that upper bound and a Bell input gives it by the orthogonal Pauli outputs. Its corresponding threshold is $63/1024$. Neither error coordinate is that of the unchanged host-only restriction.

In the scored command the task is to report the fair sender bit in the computational basis, and the loss is the probability of a wrong bit. For any bare one-use encoding without a receiver-correlated input reference, the two emitted density matrices differ by a traceless qubit operator. The Bloch contraction gives half trace distance at the receiver at most $1-2q$. For equiprobable states the optimal binary test has success at most $1-q$: if its effect for the first state is $F$, the success is $(1+\operatorname{tr} F(\rho_0-\rho_1))/2$, with $0\le F\le I$. The positive-part projector attains the trace-distance bound, and every adaptive receiver instrument ending in one guess defines such an effect. Computational-basis encoding and readout attain $1-q$. The protected identity encoding followed by correction and computational readout has wrong-bit probability $f_{23}(q)$. The fixed native task and this additional correctness task use different physical verdicts and meters.

Let $C$ be a finite upper bound on all noncommon protected expenditure other than the value of one meter excitation. Fix the stock, schedule, supplier prices and the complete account for its installation and maintenance before choosing the meter energy. In this supplied-service branch the support size, times, charge for preparing and driving degenerate control factors, and charge for holding meter factors are fixed independently of that energy. Reserve an excitation of gap $B$ in both branches, with the same paid preparation. The verifier reversibly computes equality of the retained truth and report and routes the excitation by a conditional swap into either an equally gapped useful register or an equally gapped dump. The swap commutes with the three-register energy, has the same bounded logarithm for each $B$, and has exactly one retained output excitation. The verifier, both destination registers, supply and every result are charged and retained. The common charged input $B$ cancels in the comparison. This is the funded binary accuracy calibration of Construction A.0.2p.3 on the present verdict. On any fixed interval $[q_-,1/64]$ with $q_->0$, choose
$$
B>2C/q_- .
\tag{D.8.9c.25.1}
$$
Indeed $f_{23}(q)<8855q^4<q/2$ throughout this interval, so the protected rate minus the rate of any bare competitor on the registered task is at most $(C-B(q-f_{23}(q)))/W<0$, where $W$ is their common full elapsed window. Unused meter energy and records remain at their physical ports. If a consuming apparatus imposes another energy cap or an additional $B$-dependent noncommon tariff, the strict comparison uses the intersection with that record. This source has a finite nonempty comparison family with a uniform strict gap on the indicated interval. The fault and optimizer conclusions of Theorem A.0.2p.5 have their separate source predicates.

*Actual common restriction.* All added scored commands can change the signal and its outcome histories but preserve the original host law on its own algebras when the other records are summed. Before ingress the hosts are independent, and ingress is controlled by a block-diagonal immutable bit. At every later fixed cut each channel branch acts on disjoint auxiliary factors. Normalization then gives the original marginal host laws, including original verifier failures, as an equality of maps on the declared diagonal input sectors. Denote the supported original snapshot prefixes by $\mathcal H_j$ at $0,7\tau,14\tau$. The algebra $\mathbb C^{\mathcal H_j}$ of Definition O.3c is represented by the original snapshot projections tensored with identities on the added factors. The connecting map pulls back along deletion of later snapshots. Those maps are injective because the supported prefixes are unchanged and the deletion maps are surjective. The same inclusion composition and state restrictions therefore hold on the common carrier. Conditioning and the entropy of that observer use exactly its old algebra, as in Proposition O.3d. The receiver's newly visible report is a separate observer port. On the QEC side the common overlap reads the same $I_0$ projection as the sending host's first snapshot, with the same actual support and calibration. Taking the host restriction before reading that bit or taking the bit directly gives identical channels on the supported native domain. This realizes the overlap and both output records without activating the optional $6\to46$ selector guard. The code consumes the declared Golay code artifact as a support input, as required by Definition P.14.1m.

*Prepared restriction fiber and the enlarged archive test.* At the fixed cut immediately after classical ingress, let $\mu_x$ denote the native history distribution of the hosts conditional on $X=x$, including their elapsed schedules and all retained original records. The control record can be copied into a separately paid private audit cell at this cut, using a basis copy with the same readout restriction. For unnormalized auxiliary blocks $T_x$ including any allowed reference, the physical prepared-image embedding and its left inverse are
$$
J:\bigoplus_x T_x\longmapsto\bigoplus_x \mu_x\otimes T_x,
\qquad L=\operatorname{Tr}_{\rm hosts},\qquad LJ=I.
\tag{D.8.9c.25.2}
$$
Both maps are CPTP on their block algebras. The independent ready supplies, the control by $X$ and the fixed native schedule give precisely the product in each block. Complete outcome instruments on the auxiliary side propagate unnormalized blocks in the same identity. The final verifier reads the truth from the private audit copy, with no report-write path. Thus for every subsequent retained restriction $r$ of those blocks the fiber of $r\circ L$ on the reachable image $J(\operatorname{dom}r)$ is in bijection with $r^{-1}(r_0)$ at any selected value $r_0$. In particular fixing the complete auxiliary block record gives a singleton on that image.

If the common source also admits a passive separately supplied quantum archive after report commitment, one can instead keep only its marginal state $\rho_x$ and the classical native history marginal $\mu_x$ in each block. At this later cut use the elapsed history distribution and let $m_x$ be its positive support size and $r_x=\operatorname{rank}\rho_x$. The full fiber consists exactly of positive archive matrices $T_{x,h}$ on $\operatorname{supp}\rho_x$ with $\operatorname{tr}T_{x,h}=\mu_x(h)$ and $\sum_h T_{x,h}=\rho_x$. Necessity follows by tracing the two retained systems. Sufficiency is physical on the stated enlarged archive branch: after report commitment a read of the allowed completed history controls a finite purification of $T_{x,h}/\mu_x(h)$ in a fresh owned archive and a charged purification stock. A common finite-dimensional stock and a fixed positive pulse interval suffice for every such state by unitary completion. This control changes neither the previous native trajectory nor the link decision. The product point $T_{x,h}=\mu_x(h)\rho_x$ is strictly positive on the support in every positive history block. Consequently the exact affine dimension of the conditional fiber is $(m_x-1)(r_x^2-1)$: eliminate one block by the sum and impose zero trace on each independent Hermitian perturbation. It is a singleton exactly when $m_x=1$ or $r_x=1$ for each positively weighted $x$. For example if the archive is a fair qubit and a completed host history event has conditional probability $p\in(0,1)$, a joint test of that event and one qubit atom has the exact conditional range $[\max(0,p-1/2),\min(p,1/2)]$. The classical coupling of the two Bernoulli marginals attains both endpoints with diagonal conditional archive states. Thus the prepared-image and marginal-only physical restrictions can have different fibers while using identical local records. $\square$

<a id="theorem-d89c26"></a>

<a id="theorem-d89c26-actualization-timing-and-meter-rate-from-the-native-protected-link"></a>**Theorem D.8.9c.26 (Actualization Timing and Meter Rate from the Native Protected Link).** Use the two qualified hosts, physical link, private syndrome and fault records, and immutable scored report of Theorem D.8.9c.25 on its declared independent code-capacity noise family. The scored receiver alone never reaches the one-bit threshold $\ln2$ on a single transmission at positive noise. After its report is committed, a paid read-only recovery of the same transmitted bit from the actual endpoint records supplies a distinct retained acquisition link. On the ideal fixed-coupling schedule of Theorem E.2a.14 this link has the exact capacity and acquisition ledger
$$
C_{\max}=\ln2,
\qquad I_\ell(t)=I_{\rm acq}^{R}(t)=\min\{vt,\ln2\},
\qquad \tau_s=\frac{\ln2}{v},
\qquad \Gamma_{\rm Evolve}^{(R)}=\frac v{\ln2}.
\tag{D.8.9c.26.1}
$$
The timing and meter certificates are the projections of the same retained process and give the typed dependency $43\to44$ of Theorem D.8.9c.19. Its physical input is a restriction of row 46 on this source, and its completed retained bit agrees with the sending host's original snapshot restriction of row 48. The added ports preserve the original scored link, and the common account below preserves its strict comparison on an explicit funded branch.

*Obstruction on the scored port.* Write $r=q$ for the bare link and $r=f_{23}(q)$ for the protected link. The two conditional scored receiver states under the computational basis preparation are diagonal and form a binary symmetric channel of crossover $r$. Independent receiver resources, arbitrary receiver-only finite instruments, and all finite report processing define a stochastic channel from that classical output to the complete report transcript. Hence its accessible information is exactly $\ln2-h_2(r)$, attained by the computational measurement, where $h_2$ is the binary entropy in nats. The total variation separation is $1-2r<1$. In particular the threshold $\ln2$ cannot be certified even if the terminal report is retained indefinitely, as long as the private archives remain inaccessible and there is just this one transmission. The protected error is strictly positive for $q>0$ by Proposition A.0.2d, for example a nonzero logical $X$ error of weight seven is in the noise support. This failure concerns the actual finite port and cannot be remedied by assigning its event rate a different time unit.

*Bit recovery from the actual endpoint archive.* In the protected branch let $e$ be the physical bit-flip word of length twenty-three, supplied by the original private flags, and let $s=H_{23}e$ be its actual syndrome. After the registered recovery, the residual word $e+l_s$ belongs to $C_{23}$. Its parity $\lambda$ is the logical $X$ flag because the even subcode is $C_{23}^{\perp}$, as in Proposition A.0.2d. In the bare branch $\lambda$ is the original physical $X$ flag. Logical $Z$ flags can affect phases but cannot change the bit in the computational preparation. On each noise word the physical decoded data at the final receiver bank are therefore the basis state $|X\mathbin\oplus\lambda\rangle$. At the same ready boundary supply a private zero register and make a basis copy of that output. This commutes with every conditional output density on the scored input domain. The copy is owned by an isolated audit bank with no access or feedback before report commitment. The LINK command of Theorem D.8.9c.25 bypasses this copy by its already distinct command flag and has the original arbitrary quantum-input and reference channel. Thus the original scored source and its separate quantum channel test each keep their full input domains.

After report commitment compute $\lambda$ from the retained fault word and syndrome in a finite reversible Boolean table. Form a fresh classical control bit $X_{\rm rec}$ by copying the private decoded bit and applying the computed parity as a controlled flip. Keep the inputs and the recovered bit and uncompute the temporary workspace. This is a complete finite word, including every flag and every report outcome. It uses no future truth value or sender operation. On every supported history, including every scored error, $X_{\rm rec}=X$. The bit is stored in the endpoint-side bank. Its next link is a local one-way coupling to a separately owned receiver register $R$. The earlier report, decoded output, private flags, syndrome, host histories and all audit work remain in other named ports. The acquiring receiver has no access to those ports before or during the new acquisition, and its ready states and clock are independent of $X$. In particular giving that receiver the earlier report would change its initial information and the following calculation would require a different receiver cut.

*The same-source capacity, meter and control.* The three receiver factors $Q_M,Q_P,R$ and their fresh auxiliary and outcome log are the actual finite factors of the instrument in Theorem E.2a.14, initialized independently of $X_{\rm rec}$. Apply its controlled $Y$ acquisition with the actual projector $P_{1,X_{\rm rec}}$ as control. The phases of the earlier logical output do not enter this classical-control branch. On the local acquisition clock use $\theta(t)=A^{-1}(\min\{vt,\ln2\})$, where $A$ is (E.2a.13.1). This is exactly the ideal integrable endpoint waveform in (E.2a.14.1), with total norm action $\pi\hbar/2$. Its instantaneous amplitude is unbounded at the endpoints. The local clock starts at a common deterministic endpoint of the postcommit Boolean word. A fixed positive common offset converts it to the whole source clock, without resetting any native timing record. Theorem E.2a.13 applies to all finite causal interrogation and feedback at this port: all signal interactions use that same total coupling clock, and all other operations are independent of the source value and act within the receiver's admitted support. It gives (D.8.9c.26.1) as the exact optimized information over these complete transcripts.

At the first threshold crossing, the register states are orthogonal and the full commit instrument is (E.2a.14.3), with the same reset stock and archive exclusion. The output carrier and log have precisely a two-dimensional span on arbitrary inputs of the three receiver factors. The two orthogonal register inputs attain one bit. The exported input archive is retained globally and isolated from all future receiver words. The receiver capacity is therefore $\ln2$ by the exact support and attainment proof of Theorem E.2a.14. The threshold equals its operational capacity. The operative arming flag is a clock-read of (D.8.9c.26.1), the overwrite bound and information residual are zero, and the two commit Kraus blocks sum to a normalized full-input instrument. Use the fixed perspective kernel of that theorem. Nonselective continuations act as the identity on earlier record factors and preserve their marginals, including those of the original scored link and host snapshots. All preset branch data, controls, prices and clocks are independent of the realized forecast and noise values. These identify the capacity route, flux shape, physical bridge, causal process and forward lock required by Definitions E.2a.6 and E.2a.8 on this same source.

*Timing optimum and complete price.* For a common fixed $a>0$ and maintenance rent $\Phi>0$, the registered cost per verified nat of the acquisition mode is
$$
\frac{a+\Phi t}{\min\{vt,\ln2\}} .
\tag{D.8.9c.26.2}
$$
The constant $a$ includes the priced ready controls, definite transport and pre-acquisition history, auxiliary supply, the fixed-duration terminal instrument and retention. The tariff uses the priced supplier boundary of Theorem E.2a.14. In timing comparisons the same stopped clock and optimal terminal readout are used on both choices of original link. Exact fixed per-use and positive linear maintenance prices are declared independently of outcomes. Formula (D.8.9c.26.2) is strictly decreasing up to $\tau_s$ and strictly increasing after it. Its pointwise expected-cost inequality gives the same unique source-independent randomized arming time, since the time is retained and the corresponding acquired information is the average of (D.8.9c.26.1). The nominal acquisition rate excludes the earlier host run, original link, private decoding, commit service and next ready handoff, which remain in the full clock and price. No absolute rate calibration is used. Each finite multiuse record uses fresh independent host preparations, meter auxiliary and retained outcome stocks as in Theorem E.2a.14.

Choose a compact interval $[q_-,1/64]$ with $q_->0$ as in Theorem D.8.9c.25. Reserve a common full schedule $W'$ with the longer of the finite bare and protected Boolean preparations, padding each to the same release and arming epochs. The waveform, meter auxiliary and commit stock are identical on the two branches, and every additional gate, priced hold, diagnostic copy and record is included. Their noncommon protected cost has a finite upper bound $C'$ independent of the original correctness excitation $B$, using the same fixed service tariff; the new dynamics never act on those energetic reward factors. The original useful-energy expectation difference is still at least $B(q-f_{23}(q))$ because the scored latch is immutable before the new recovered bit can be used. Choosing $B>2C'/q_-$ gives a strictly negative rate difference bounded above by $(C'-Bq_-/2)/W'$. This is the complete common-epoch comparison, with new duration and a new explicit bound. An additional restriction on the supplied work or the ideal waveform requires its own intersection with this branch.

*The instantiated overlap.* The row 43 restriction keeps the actual recovered-input projection, receiver cut, clock and saturated link ledger. The row 44 restriction uses precisely that same projection, cut, clock and curve as the acquired-information map. The overlap map is the identity on those marked fields; a receiver reset that admits the private archive or reuses the scored report would fail the cut test. The logical frame calculation gives a finite witness for the map from row 46's retained endpoint blocks to the common input. The same map agrees on every supported history with reading $I_0$ from row 48's first native snapshot, and the acquired terminal log is exactly that bit. This equality on the joined block algebra remains true under mixtures and all unchanged retained history marginals. The two local certificate families therefore agree on the actual typed domain for every declared noise parameter and every fixed positive flux setting, including source preparations that fail a scored trial. The scope includes this occupied branch of the timing-to-rate arc. Other sectors and any broader ambient realization retain their own tests. $\square$

<a id="theorem-d89c27"></a>

<a id="theorem-d89c27-exact-charged-reset-and-predictive-engine-record-on-the-r14-link"></a>**Theorem D.8.9c.27 (Exact Charged Reset and Predictive-Engine Record on the R14 Link).** Use the common source of Theorems D.8.9c.25 and D.8.9c.26, with each verified meter output held behind a charged release gate. Supply one private fair binary permit, two marked pure two-level auxiliaries and one normal Gibbs bath for each gate. On the countable thermal branch below the gate returns its permit and auxiliaries to ready exactly, charges finite positive mean work and releases one retained structural event. The result supplies a populated interval-rate certificate of Definition B.8e on the same physical record as rows 43, 44, 46 and 48 of Theorem D.8.9c.19. The certificate uses the actual common release and clock restriction. It includes a bounded finite-table verification and an explicit finite-bath approximating family. The exact thermal branch uses a countable bath and two bounded interaction-picture pulses.

*Exact reset map and its returned support.* Write $P$ for the permit, $D$ for its private cyclic auxiliary, and $B$ for a bath with number basis $|n\rangle$, $n\ge0$. The register and auxiliary have degenerate Hamiltonians. Fix $T>0$ and a rational $s>1$ before the run, and set
$$
E_n=k_BT s\ln(n+1),\qquad w_n=\frac{(n+1)^{-s}}{Z_s},\qquad Z_s=\sum_{n\ge0}(n+1)^{-s}.
\tag{D.8.9c.27.1}
$$
The supplied bath state $\sum_nw_n|n\rangle\langle n|$ is faithful, independent of all other stocks, and has finite entropy and mean energy by the integral test for $(1+\ln x)x^{-s}$. The auxiliary is initially $|0\rangle_D$. Define the following permutation on the complete basis $(p,n,d)$ of $PBD$. On the prepared auxiliary lane put
$$
(p,n,0)\longmapsto(0,2n+p,0).
\tag{D.8.9c.27.2}
$$
These images exhaust the output lane $(0,*,0)$. For $(p,n,1)$ form $m=2n+p$ and write $m=3n'+j$, $j\in\{0,1,2\}$. Send it to $(p',n',d')$, with $(p',d')=(1,0),(0,1),(1,1)$ for $j=0,1,2$, respectively. These images exhaust all remaining output lanes once. Thus the map is a unitary permutation $U$ with explicit inverse. On the prepared lane the final $PD$ is the fixed pure ready pair, product with all other degrees of freedom. The entropy of the erased permit goes to the bath. No bit determining it remains in an unchanged non-bath record.

Use a second degenerate auxiliary $S$ initialized in $|0\rangle$. For each basis word $x$ of $PBD$, define the involution $V$ by $(x,0)\leftrightarrow(Ux,1)$. Follow it by the bit flip of $S$. Each involution $T_*$ is implemented over a positive-duration slot by integrating its bounded interaction-picture generator proportional to $I-T_*$ to $\pi\hbar(I-T_*)/2$. Its interaction vanishes at the endpoints and its norm action is at most $\pi\hbar$. The two pulses apply $U$ and return $S$ exactly to zero. The laboratory controls are conjugated by the free bath propagator, whose phases preserve the output probabilities. The energy displacement $U^*H_BU-H_B$ is bounded on the whole basis. On the prepared lane $(2n+p+1)/(n+1)$ belongs to $[1,2]$. On the other lane $n'=\lfloor(2n+p)/3\rfloor$ gives $(n'+1)/(n+1)\in[1/2,1]$. The inverse permutation has the same absolute energy-displacement bound. At each intermediate time of the first pulse the state of a basis input is a superposition of its initial and permuted states in orthogonal lanes, so its mean bare energy stays within that bound of its initial energy. The second pulse leaves the bath energy unchanged. This gives finite energy throughout the pulses, as well as finite endpoint work. Work is the change of mean bath energy with all other Hamiltonians degenerate and the interactions switched off at the endpoints, in the cyclic convention of Definition 28. The separate control reserve and all auxiliary, bath and metering stock remain in the source account.

*Heat, exactness and the finite cut.* Conditional on every admitted history before this gate, $P$ is a fresh fair stock. Its input value has no separate retained record, and no earlier service uses or measures it. The actual reset changes $H(P\mid R)$ from $\ln2$ to zero for the complete unchanged classical record $R$. The bath output distribution is $w_n/2$ in both levels $2n$ and $2n+1$. It is independent of the unchanged records, and has entropy $S(B_{\rm in})+\ln2$. Thus the finite exact entropy identity and its heat are
$$
\frac{Q_s}{k_BT}=s\sum_{n\ge0}w_n\frac12
\ln\!\left(\frac{2n+1}{n+1}\frac{2n+2}{n+1}\right)
=\ln2+D(B_{\rm out}\Vert B_{\rm in}).
\tag{D.8.9c.27.3}
$$
The relative entropy is strictly positive. For example the output probability at level zero is $w_0/2$, and the original probability is $w_0>0$. The logarithm average in (D.8.9c.27.3) is strictly below $\ln2$, since its second factor has ratio $2$ and its first ratio is smaller than $2$ at every finite $n$. Consequently $\ln2<Q_s/(k_BT)<s\ln2$. The exact pure return has finite heat, and the mean heat approaches the positive entropy floor as $s\downarrow1$. Every such comparison changes a recorded bath law. In particular this family has no attained zero-excess member.

There is also an explicit finite-resource convergence certificate at fixed $s>1$. On a bath of $2N$ levels use its truncated Gibbs law, apply (D.8.9c.27.2) on inputs $(p,n,0)$ with $n<N$, and extend these distinct assignments to a permutation of all $8N$ basis states by matching the remaining ordered input and output lists. The same two-pulse construction implements that finite permutation. The probability of the unspecified part of the ready lane is at most
$$
\sum_{n=N}^{2N-1}\frac{(n+1)^{-s}}{\sum_{j=1}^{2N}j^{-s}}
\le\frac{N^{1-s}}{s-1}.
\tag{D.8.9c.27.4}
$$
On the prescribed inputs the ready state is exact and all low-level bath transitions coincide. On every finite input the absolute bath energy displacement is at most $k_BT s\ln(2N)$, so the remaining contribution to the finite mean heat tends to zero by (D.8.9c.27.4). The prescribed part converges to (D.8.9c.27.3) by its uniform $k_BT s\ln2$ bound and convergence of the normalizations. The conditional entropy of the returned binary register tends to zero, by its vanishing probability of leaving the ready value and the binary entropy bound. The finite members can have an auxiliary return error on the tail. Theorem E.1b excludes an exact finite thermal realization with the same positive conditional entropy and cyclic resources. In the exact countable member the returned pure auxiliary provides the prepared lane. A unitary on the permit and a faithful bath alone preserves faithfulness, while a pure final permit requires a nonzero kernel.

*Actual release, payer and overlap records.* Install the gate only after the meter has irrevocably committed its bit in Theorem D.8.9c.26. One permit per event is consumed by the thermal gate. Before thermal coupling a ready latch is closed. In the release slot a fresh normalized two-outcome read of the returned permit and both auxiliaries tests their joint ready state. The positive outcome enables copying the already committed meter bit into the public retained structural log. The other outcome is a retained failure, with no public structural event. The instrument is defined on both outcome branches. On the exact declared source the positive outcome has probability one, and the counted event is assigned to that one reset. The permit authorizes the actual release. Keep the original meter log, all source and verifier records, the reset check and the bath as separate paid outputs. Before release the engine may read the reset-ready test and the committed meter bit only. Its thermal control acts on independent stocks and leaves the prior score, private QEC archives, meter process and native host snapshots unchanged. It carries the same nominal rate and the exact additional release latency on the common clock. Public release does not feed any earlier task.

Take any finite number of uses with fresh bath, permit and auxiliary stocks at each scheduled release. Assign each event and its reset to its complete service interval, with disjoint intervals fixed by the clock independently of histories. The indicator $J_j(I)$ for any registered union of consecutive complete intervals is therefore known before the reset. The common positive temperature is $T$, $h_{\min}=\ln2$, and (D.8.9c.27.3) is the conditional mean work on every admitted prior history. Use the source's actual separate work and overhead accounts. Per interval supply a thermal service reserve $k_BT s\ln2$, which covers every ready-lane work difference and exceeds its actual mean. Retain unused work capacity, meter supplies and any independently stocked ancillary energy. The nonnegative overhead account includes the upstream R14 and QEC services, the acquisition, clock and readout, the control reserve and the consumed preparation and retention service. These common resources retain their original unit conventions. To register an energy-work comparison, use independently declared energy-funded service prices and include their transfers, storage and returns once. The thermal payment is outside that overhead. No relocation credit is used. If $O_j$ denotes a certified upper energy expenditure for these other services in interval $I_j$, take its available-work flux record to be $(k_BT s\ln2+O_j)/|I_j|$ on $I_j$. This is the window-averaged supplied budget for complete intervals. For any admitted interval $I$, the distinct assignment and complete ledger give
$$
\Delta N_{\rm str}(I)=\sum_{I_j\subseteq I}1,
\qquad C_{\rm ret}^{\rm nat}=\ln2\,N_{\rm str},
\qquad
\sum_{I_j\subseteq I}Q_s+\mathcal O_{\rm oh}(I)\le\int_I\Phi_F(t)\,dt.
\tag{D.8.9c.27.5}
$$
All sums are finite. The conditional hypotheses and the conclusion of Proposition B.8f thus hold on this same physical branch with the exact released-event record. This is an interval certificate. At deterministic release times the mean count has jumps, so its use as an absolutely continuous differential rate would require a different counting and timing record.

The projection to row 44 uses the original commit log and acquisition clock. The row 52 count uses the same commit bit together with the additional marked release condition and actual latency. Restricting away the extra release fields returns the original full meter response, and every completed public bit is its literal copy. Reading that bit through the prior row 46 recovery or the original row 48 snapshot agrees on every supported input of the joined branch by Theorem D.8.9c.26. These are exact overlap identities on the declared source, with all earlier failure branches retained. Keeping the thermostat and thermal work separate from the fixed correctness reward allows the original strict protected comparison of Theorem D.8.9c.26 to persist after charging the common added service and padding both schedules to the same longer window. The supply and clocks are fixed before outcomes. The finite verifier checks the two inverse integer rules, the integral tail for the power-law Gibbs weights, and finite-prefix energy sums to any specified precision. It also checks the normalized release maps and the clock and account projections in (D.8.9c.27.5). The source theorem supplies the all-input proof for every named parent setting. A self/world allocation task consuming its rate bound needs its own SPAP-gap and cost-transfer record. $\square$

<a id="theorem-d89c28"></a>

<a id="theorem-d89c28-native-engine-and-spap-allocation-on-one-retained-task"></a>**Theorem D.8.9c.28 (Native Engine and SPAP Allocation on One Retained Task).** Use the actual protected R14 link, the committed meter and the reset-ready release gate of Theorems D.8.9c.25–D.8.9c.27. Fix a nonempty finite census of rational self gaps $0<\delta\le1/8$, a rational link noise $q\in(0,1/64]$, a finite number of prospective uses and a common positive unit of account. There is one occupied shared source with the original engine interval certificate and the fixed-system SPAP self/world certificate of Definition 14.1d. Its external target is the actual released meter bit, and its report is the original scored receiver report. The new world verifier reads that released bit through a causal read-only port. The combined allocation has the exact cost bridge and closed finite feasibility test below, with a strict lower bound on the cost per verified external task that includes the engine reset. This populates the typed $52\to54$ arc of Theorem D.8.9c.19, with the overlapping release events, clock, work accounts and full bit law checked on the actual shared source.

*Occupied self task.* At the receiver append the controller and own model $M=(p,b,c)$ of Theorem B.2f, with its protected immutable sign and fresh acquisition triples. The physical controller is the finite programmable operation system of that theorem. For each challenge in the finite census use $a=2\delta$ and the checked odd majority size $N_\delta$ of Proposition 14.1h.d. Pad program, counter and prepared registers to the largest required size; retain and charge unused stock. Every acquisition writes the diagonal response $X_{\rm self}=\mathbf1\{p\le1/2\}$ from the current model and the actual independent noisy sign sample and amplitude bit of (B.5s). The model is updated from its own retained training record, committed, then evaluated once on a fresh triple with the score (B.5l). The program that supplies and verifies the algebraic $p_\delta$ and computes its majority is precisely the one in Proposition 14.1h.d. It has a complete charged preparation trace $D_\delta$. Its self-operation count is
$$
F_\delta=D_\delta+2N_\delta+4,
\qquad PP_{\rm self}=\frac47-\delta,
\qquad \Pr\{P_{\theta,2\delta}(M)<4/7-\delta\}=e_{N_\delta}(2\delta)\le\delta
\tag{D.8.9c.28.1}
$$
under either fixed initial sign. In particular this consumes the self task, not just the operational syntax, of Theorem B.2e. None of the shared dispatcher, native R14 and link sources, engine permits, thermal bath or account clocks takes the hidden sign as an input. Their source laws are independent of it. The self controller has no bypass to the hidden sign. Allowing it to retain any previous world outputs and joint clock fields only enlarges the sign-independent variable $U$ of (B.5q): all their random stock is independently prepared, and adaptive commands depending on previously observed self samples can be computed from that stock and the same preceding samples. The fixed schedule uses padded reservations and does not encode the sign in completion time. Thus the identical hard pair, exact boundary $4/7$ and lower bound (B.5p) hold for all finite strategies on this joined task interface.

*Occupied world task and response transport.* For each world use run fresh copies of the original two hosts and the paid protected link. Make the binary receiver report by the fixed computational-basis readout and close its write latch. Keep the sender truth, syndrome and fault histories under the original separate access locks. After the scored report, let the protected endpoint recover the actual meter input and run the acquisition and commit of Theorem D.8.9c.26. Use the exact thermal branch and release test of Theorem D.8.9c.27. The newly supplied verifier compares the already immutable scored report with the physical public release bit. On a missing or failed release it writes the distinct failure symbol, with every prior record preserved. The new verifier is a causal outcome map on the release and report factors. It sends no signal to the earlier report, meter or self acquisition. It consumes the released bit as a target, since it has no other truth input. The receiver's original truth copy and score are retained on their original instruments. On all supported exact histories the new comparison is equal to the old correctness bit: the release bit equals the native source bit by Theorems D.8.9c.26 and D.8.9c.27. Thus each world trial has accuracy $1-f_{23}(q)$ and the verifier retains precisely one successful release per admitted trial. Both its target and its report vary across the declared source histories. One common dispatcher writes the two enable fields for the self and world controllers. The dispatcher reads neither sign, link noise nor scored outcome. Its operation, source reservation and log are included once in shared expenditure. A use-specific service grant and its corresponding release event share a single retained address.

*Paid common unit and split.* Use a fixed positive energy price $u$ for each registered self-operation service. A supplied service can be funded by a two-level purse and an isolated ready provider receipt of equal gap $u$. The complete funded service uses a positive-duration swap and an enable latch. Failed funding has its own complete rejection branch. The service includes the specified acquisition or Boolean operation, its drive, ready stock and all receipts. It is paid once per operation occurrence in (D.8.9c.28.1), including all public preprocessing. This is a supplied-operation tariff of the type in Construction A.0.2p.3, with no assertion that the tariff equals intrinsic dissipation. Include the supplier stocks, exact gate controls, preparation and reserve in the shared or task-exclusive source inventory at their declared positive prices. When external stock is common to all finite census rows, charge it to the common budget once. Divide the accounted energy by $u$ to use the exact cost unit of Theorems B.2e and B.2f. The thermal work can be added to this same account because its value is an energy from (D.8.9c.27.3). Its paid reserve and mean expenditure are distinct controls.

Here is an explicit finite accounting choice. Use the same whole-world service grant for each enabled world trial. Its amount in energy units is $G_w=k_BT s\ln2+O$, where $O$ is a certified complete per-trial reserve for the other services of Theorem D.8.9c.27 and the extra verification operation and retention. This is the amount reserved and funded on the prospective source, including the original QEC circuit, host timing, forecast, meter, correctness excitation and readout. Keep the split into thermal reserve and other reserve, the actual used amount and the unused balances on separate marks. The bath work is drawn only from its thermal reserve. Its mean is $Q_s$ and its entropy bound is $k_BT\ln2$. Because the account charges the full grant, neither the paid work nor the already included control services are charged again. Independent supplier installation and full carrier holds for the common finite census, including padded idle stock, are counted by a shared baseline. Alternatively, an identified task-exclusive price is put in the corresponding task account and is never also included in the common baseline. There is no recycling of a retained reward output into the current forecast budget. The time windows and work grants are registered before the acquired outcomes. For each admitted tuple, let $C_{\rm sh}$ be its fixed common baseline including the dispatcher, write $b_w=G_w/u>0$, and let $K$ be the number of enabled world trials. The resulting outcome-independent expense coordinates are
$$
C_{\rm self}=F_\delta,
\qquad C_{\rm world}=K b_w,
\qquad C_{\rm sh}+F_\delta+K b_w\le B_C(T).
\tag{D.8.9c.28.2}
$$
The budget also includes the allowed finite horizon and supplies. It can be chosen before the run to make any one declared pair feasible. Each occupation of the larger source has one payer per service, and the common stock is held through the padded maximum horizon. No funding primitive reads a future score or branch result. The complete release law and resource records are those of the common declared forward source.

*Actual rate-to-cost projection and frontier.* The engine's row 52 restriction for the world window carries the chronological reset assignments, the acquired log, the public release tests and the work reserve and expenditure controls of Theorem D.8.9c.27. The row 54 world verifier consumes these same public release tests and their bits, with the same deterministic assignment of each gate to its service interval. Its world count equals $\Delta N_{\rm str}=K$ on that occupied branch. The expense map reads the same thermal reserve and work accounts and divides by $u$. The verifier register and holding cost are counted in the indicated additional expense. The projection that forgets the extra verifier and all self records gives the original engine process and its local rate record on the world intervals. In the other route the common source projects to that engine process first and then copies its release records and grants to the world ledger. The two outputs agree on every supported history, including their times, bit values, supply labels and reset dispositions. This proves the common parent-data equality for the $52\to54$ cell in the funded service unit.

Equations (D.8.9c.28.1)–(D.8.9c.28.2) are the populated allocation certificate. The physical acquisition operations are the same ones whose number enters (B.5p), so
$$
C_{\rm self}\ge C_{\rm uni}(\delta)\ge
\frac{3}{128\delta^2}\ln\!\left(\frac1{4\delta}\right).
\tag{D.8.9c.28.3}
$$
In particular the same count and work budget give the two simultaneous tests
$$
K b_w\le B_C(T)-C_{\rm sh}-\frac{3}{128\delta^2}\ln\!\left(\frac1{4\delta}\right),
\qquad
K\frac{k_BT\ln2}{u}\le K\frac{Q_s}{u}\le C_{\rm world}.
\tag{D.8.9c.28.4}
$$
The left inequality in the second test is strict for a nonempty world allocation on this exact Gibbs branch. It is work for the assigned reset, with the other protected and verification costs already inside $C_{\rm world}$. For the declared finite architecture family with fixed checked implementation and reserve, feasibility is exactly $0\le K\le\lfloor(B_C(T)-C_{\rm sh}-F_\delta)/b_w\rfloor$ intersected with the fixed finite horizon. A negative numerator gives no feasible member at that gap. This is attained by enabling exactly that many independently supplied world slots in the common controller. Exact comparison can take rational expense prices in the unit $u$, for example with $k_BT\ln2/u$ rational. For the finite census the achieved utilities $4/7-\delta$ and $K(1-f_{23}(q))$ and the expense coordinates are then rational, and Proposition 14.1h.a gives an exact Pareto census or a checked scalar choice for any declared rational objective. The ambient countable Gibbs control, occupation and heat scopes are those of Theorem D.8.9c.27. This construction gives an exact finite comparison and work split on that source. Wider architecture comparisons and the other guarded dependencies retain their tests. $\square$

<a id="theorem-d89c29"></a>

<a id="theorem-d89c29-absolutely-continuous-engine-rate-on-the-native-r14-source"></a>**Theorem D.8.9c.29 (Absolutely Continuous Engine Rate on the Native R14 Source).** Retain the R14 engine, committed meter and self/world verification of Theorems D.8.9c.25–D.8.9c.28. Fix all source parameters and the protected world-task procedure. Supply a finite number of independent ready copies of its complete scheduled world service, with one exact thermal reset and one public release per copy. There is a common calibrated clock and an independently phased finite schedule of these copies on which the mean number of released events is absolutely continuous. On each interior accounting interval the exact differential and integral claims of Proposition B.8f hold, with positive mean count rate. The rate, true thermal work and world verification use the same retained reset and release records. The construction uses a supplied continuous clock-phase law and the exact thermal branch of Theorem D.8.9c.27.

*Finite schedule and explicit interior.* Let $D>0$ bound the elapsed duration from the start of one service copy through its terminal release and world verification. Include every setup, control, route, acquisition, reset, readout and retention interval that the physical source requires. Fix a period $L>D$ and an integer $M\ge4$. Take exactly $M$ complete copies with independent ready supplies, including fresh paired hosts, source and control stocks, score archives, thermal baths, permits and returned auxiliaries. The optional SPAP self task is a separately clocked part of the common source and uses the same already fixed cost unit. Its preparation does not select any phase or alter a world-service response. Supply one independent variable $U$ uniform on $[0,L)$ from a classical reference clock and retain its value as the common launch offset. The $j$th copy starts at $U+jL$ for $j=0,\ldots,M-1$. The clock operates prospectively with this measured supplied phase and does not read any forecast, noise, permit or hidden-sign value. Every delay and pulse is a translate on the same clock of the fixed physical template. Since $L>D$, copies of the world service do not overlap. The initial ready stocks and the finite maintenance through the last possible release are charged. All source responses, including records outside the comparison interval, remain in the source.

Let $d_e\in(0,D]$ be the release offset from the start of each service, fixed by the verified schedule, and $t_j=U+jL+d_e$ its exact time. The thermal reset starts at a fixed earlier offset and ends before this release. The release test passes with probability one on this branch, independently of $U$ and all native outcomes. The comparison interval is $[L,(M-1)L]$. For any $t$ in its interior, the law of release times has constant expected counting density $1/L$. In fact the individual densities are $1/L$ on the adjacent intervals $[jL+d_e,(j+1)L+d_e)$, whose union contains the comparison interval. The endpoint choice of counting convention has zero measure in expectation. The same argument applies to any other fixed offset in $[0,D]$ and to the expectation of any nonnegative integrable payment profile supported there. This proves absolute continuity of the mean count using a finite source, with no infinite stationary apparatus.

*All-subinterval assignment and actual payer record.* Fix any accounting subinterval $I=[t_0,t_1]$ of the comparison interval, and charge reset $j$ to $I$ exactly when $t_j\in(t_0,t_1]$. This is a ledger assignment of the complete work of the reset to its associated event. Its indicator is known before the reset because $U$ and the template are then known. The conditional permit law is still fair given every such pre-reset history, including $U$. Thus the mean work of every assigned reset is the same $Q_s$ of (D.8.9c.27.3). The stored-work allocation has no dependence on the observed heat. Any entropy-bearing source stocks and returned auxiliaries have the roles in Theorem D.8.9c.27. Their finite mean energy and the work performed there are retained. The thermal work and any separate other expenses are carried once by the paid service account.

For each copy irrevocably reserve the thermal amount $A=k_BT s\ln2$ of Theorem D.8.9c.27 and a funded nonnegative grant $O$ covering every other charge assigned to that world service, including its share of clock/phase supply, route, native controls, meter, score records, world verifier and whole finite-horizon retention. A larger explicit supplied grant can be used. The grant covers any finite one-time charge allocated among the $M$ copies before the phase is drawn. For an independent self-task expense outside that world grant, keep its actual funded source record, with a separate nonnegative mean overhead and available-work entry when that expense is charged to the comparison. Set both of those entries to zero for the engine-only projection. Each charge belongs to exactly one account. The grant $A+O$ is held in the service work and price record. Its commitment is timed by a fixed source offset $d_a\in[0,D]$, no later than the first paid use of the corresponding allowance. Its subsequent transfers and unused balances are retained. The calculation uses the mean of this complete funded supply, including the stored amounts reserved before the actual reset. It does not infer the paid budget from a trace of only the instantaneous bath heating.

The expected funded supply assigned to any $I$ by these commitment times equals $(A+O)|I|/L$, because the commitments have the same uniform mean density on the interior. If the supply is registered over a fixed positive interval instead of as a point commitment, spread its complete amount over that interval by a nonnegative template of integral $A+O$. Translation and integration give the same constant mean density on the entire comparison interval. More explicitly, for any integrable template $w(a)\ge0$ supported on $[0,D]$, its averaged translated sum at interior $t$ is
$$
\frac1L\int_0^L\sum_{j=0}^{M-1}w(t-z-jL)\,dz
=\frac1L\int_0^{ML}w(t-x)\,dx
=\frac1L\int_0^Dw(a)\,da.
\tag{D.8.9c.29.1}
$$
Here the second equality uses $D<L$ and the choice of comparison interval. It also applies to the expectation of a random nonnegative template conditional on the independent phase. The price record charges all assigned reset work and the nonnegative overhead once, with the work-stock change and release record explicitly paired. In individual histories the work commitment and the release can occur in different subintervals. The claim is the mean interval budget of Proposition B.8f, verified for every subinterval by (D.8.9c.29.1) and the distinct assignments, together with physical prior funding on every history. It does not require those two times to coincide.

*Exact rates, strict slack and world-task transport.* The projected engine-only account satisfies for every admitted subinterval
$$
\Delta N_{\rm str}(I)=\frac{|I|}{L},\qquad
\overline W_{\rm reset}(I)=\frac{Q_s|I|}{L},\qquad
\mathcal O_{\rm oh}(I)\le \frac{O|I|}{L},\qquad
\Phi_F=\frac{A+O}{L}.
\tag{D.8.9c.29.2}
$$
Since $Q_s<A$, the complete interval budget has strict slack for every positive-length $I$. Its finiteness and all-subinterval validity verify the hypothesis of the differential form of Proposition B.8f. With $h_{\min}=\ln2$ the same source gives
$$
\frac{dN_{\rm str}}{dt}=\frac1L,
\qquad \frac{dC_{\rm ret}^{\rm nat}}{dt}=\frac{\ln2}{L},
\qquad \frac1L<\frac{\Phi_F}{k_BT\ln2}
\tag{D.8.9c.29.3}
$$
almost everywhere on the comparison interval. The strict inequality follows already from $s>1$. If the self task's funded overhead is included in the joint record, its nonnegative contribution and full funding add to the right-hand budget, without changing the count or heat. The clock offset for the exact acquired meter and the physical thermal and release latencies are retained. In particular the scheduled release rate $1/L$ and the local ideal meter's acquisition rate $v/\ln2$ use their distinct source intervals.

On this source the existing world report is always committed before its assigned public release. The row 54 verifier consumes the actual released truth, exactly as in Theorem D.8.9c.28. The average density of correct verified world forecasts is $(1-f_{23}(q))/L$, since the conditional correctness law of every copy is independent of $U$. If $A_j$ is a measurable condition on the one-use outcome mark of copy $j$ and $p_j(A_j)$ is its actual probability, its expected marked count in $I$ is $p_j(A_j)|I\cap[jL+d_e,(j+1)L+d_e)|/L$. The address is retained in this formula. For a common mark condition that is independent of the address, summing over the copies gives $|I|/L$ times the actual one-use probability. Thus projecting from the common source to engine release and then to world verification, or reading the verified world records directly, gives the same local task count, bit and supplied price on every history. The matched rates follow from this actual projected law. The proof verifies the differential rate on this phased source, including every accounting subinterval. A deterministic single schedule or a discrete phase stock generally leaves jumps in the mean count. The continuous phase law is part of the declared source. The remaining guarded sector and global-realizer tests retain their scopes. $\square$

<a id="theorem-d89c30"></a>

<a id="theorem-d89c30-exact-joint-noise-fiber-of-the-native-protected-r14-link"></a>**Theorem D.8.9c.30 (Exact Joint Noise Fiber of the Native Protected R14 Link).** Use $M\ge2$ completed copies of the protected R14 world service of Theorems D.8.9c.25–D.8.9c.28, on a fixed common schedule, with no control from one world service to another. Use the actual $46$ private physical fault flags in each copy. Fix $q\in(0,1/64]$. Retain the full one-use records of every copy, with all original independent Bernoulli-$q$ flag coordinates within each use. In the ambient comparison allow arbitrary joint preparations of the private flags between uses, with those fixed marginals. All other source stocks remain independent as specified below. There is a complete physical ambient restriction fiber. Its affine dimension is $2^{46M}-1-M(2^{46}-1)$. The achievable probability of $k$ wrong scored forecasts has an exact finite linear comparison, and every specified subset of $k$ uses can fail simultaneously with any probability in the sharp interval below. Even testing independence across uses separately at every physical flag position does not determine the joint fiber or the simultaneous logical-failure response.

*Physical realization and restriction.* Let $\mathcal A=\{0,1\}^{46}$ and let $\mu$ be the full-support product law of $46$ Bernoulli-$q$ bits. The $j$th world service uses the flags $(e_j,z_j)\in\mathcal A$ in precisely their original controlled Pauli slots. Install a private joint preparation before any service starts. Given a probability table $p$ on $\mathcal A^M$ with all its one-use marginals equal to $\mu$, choose amplitudes $\sqrt{p(w)}$ on the full finite basis indexed by $w\in\mathcal A^M$. A bounded unitary maps the ready vector to that state. A complete basis-read instrument prepares the actual classical flag word. Its full pointer and all supplying registers are retained at the private supply boundary, outside the local receiver ports. A positive-duration spectral-logarithm pulse with a fixed norm reserve and full finite preparation stock suffices for this entire family of tables. The preparation may be co-located with the flag storage and the resulting words delivered to their prescribed slots on a finite paid rail. All command timings, target bits and separate thermal preparations are independently fixed or sampled as in the source, with no input-dependent supply route. The original scored reports, ideal acquisition, reset-ready release and world comparisons run on the actual conditional flag histories. Their faults are never replaced by a declared logical shortcut.

The $j$th world service depends only on its own flags and its own independent inputs and supplies, and the complete $j$th flag word has its original product law. Consequently its direct QEC witness, protected forecast score, capacity and release responses coincide with the original one-use records. The joint supply does not activate any adaptive inter-use port. Each complete local response keeps its original private records at their local cuts. The shared schedule and any retained common independent clock phase can be conditioned on when taking these local restrictions. The common self-model procedure, when included, keeps its own independent supplies, schedule and operation prices. For all candidate tables fix and fund the same maximum joint preparation support, clock duration and control reserve as a shared source service. Every table then has the same added setup charge, and the per-use operating and thermal work accounts retain their original values. The local comparison consists of these one-use restrictions and the original common work/count and world expectation records, with the shared supply cost attached once. The full ambient comparison adds the late private joint flag readout, which distinguishes any two different tables. The preparation uses the fixed ready-vector-to-positive-amplitude convention for each table, and all later conditional laws and responses are fixed by their original protocols. This defines the actual realizer space and its restriction map for the declared family.

*Exhaustion of the fiber.* Write $d=2^{46}$. The fiber above the tuple of the original one-use responses is exactly
$$
\mathcal F_M(\mu)=
\left\{p\in\mathbb R_{\ge0}^{\mathcal A^M}:
  \sum_{w:w_j=a}p(w)=\mu(a)\text{ for every }j,a\right\} .
\tag{D.8.9c.30.1}
$$
Indeed the one-use records retain the complete flags, so each marginal equation is necessary. The fixed conditional source kernels give sufficiency and the joint preparation attains every table in (D.8.9c.30.1). The uniform identification of the other conditional source data leaves exactly these response classes. Their affine dimension is $d^M-1-M(d-1)$. To see this, take one constant function and the $M$ independent blocks of $d-1$ centered coordinate functions on $\mathcal A^M$, with centering under the product law $\mu^{\otimes M}$. Independence of those blocks follows by their orthogonality in the product inner product. They span the marginal constraints. The product table is strictly positive and satisfies all of them, so positivity does not reduce the affine dimension. An arbitrary linear functional of the complete flag law has its exact extrema over this finite compact polytope. For rational $q$ both the constraints and the flags' deterministic responses are rational, so a finite exact linear program decides each such extremum. Numerical observed output plays no role in fixing the fiber.

*Exact logical-failure projections.* Let $F(w)\in\{0,1\}$ be the actual wrong-report flag on the protected computational-basis forecast when the physical error word is $w=(e,z)$. By the marked syndrome recovery of Proposition A.0.2d and Theorem D.8.9c.25, it is the parity of $e$ plus its leader. Its one-use probability is $r=f_{23}(q)>0$. It is strictly less than $1/2$ on this branch. The full image of (D.8.9c.30.1) under the wrong-report pattern $(F(w_1),\ldots,F(w_M))$ is exactly the binary probability tables with one-use Bernoulli-$r$ marginals. Necessity follows from the marginal equations. For sufficiency first choose any such binary table, then independently choose each word conditional on its prescribed value of $F$ using $\mu(\cdot\mid F)$, which is defined for both values. The resulting word table has every required one-use marginal. This lifting is a finite preparation of the same physical flag inputs and so attains its given logical table. Consequently the attainable probabilities $a_k$ that exactly $k$ copies fail are precisely
$$
a_k\ge0,\qquad \sum_{k=0}^M a_k=1,\qquad \sum_{k=0}^M k a_k=Mr.
\tag{D.8.9c.30.2}
$$
Necessity is the expectation of the sum of the fail bits. Sufficiency follows by choosing a size-$k$ subset uniformly conditional on $k$. In particular for any specified $k$ copies the probability they all fail ranges over
$$
[\max\{0,kr-k+1\},r].
\tag{D.8.9c.30.3}
$$
The upper bound is obtained by taking their fail indicators all equal. The lower bound follows from the union bound on their complements. It is attained by choosing the failure count on those $k$ copies supported on the floor and ceiling of $kr$ and using uniform subsets, or by the corresponding two endpoint counts when $kr$ is an integer. The other copies can use fresh independent fail bits. Convex interpolation attains the whole interval. Since $r<1/2$, the two-copy range is $[0,r]$, while independent ambient preparation gives $r^2$. All one-use reports and conditional local response channels retain their original values throughout.

*Even independent flag-position traces leave a strict ambiguity.* Take $M=2$ and let $d_0=46$ denote the number of binary flag positions in one use. Add the $d_0$ exact restrictions that the $i$th flag in the first use and the $i$th flag in the second use have their product law, for each $i=1,\ldots,d_0$. They fix $d_0$ additional independent scalar coordinates of the fiber. Indeed with fixed single-word marginals, each such pair law is specified by its centered correlation, the coefficient of $(w_{1i}-q)(w_{2i}-q)$ under the product inner product. The $d_0$ functions are mutually orthogonal and orthogonal to all one-word terms, with positive norm. The positive product table still gives a relative interior point. Hence the dimension under all these extra tests is $(d-1)^2-d_0$.

These tests still allow a different logical-failure correlation. Put $f=F-r$ and let $f_\perp$ be its orthogonal projection off the span of the centered single-position functions in $L^2(\mu)$. It has zero mean and is nonzero. If it vanished, the Boolean function $F$ would be an affine sum of single-position binary functions on the entire cube, because $\mu$ has full support. A Boolean function of that form can depend on at most one coordinate: on a two-coordinate square with both coefficients nonzero its four values include three distinct values. The actual $F$ vanishes on the zero word and on every single-position flip because the code corrects them. It equals one on a zero-syndrome logical bit flip of weight seven. Therefore it is neither constant nor a single-coordinate function. For real $t$ with $|t|\le\|f_\perp\|_\infty^{-2}$, the joint table
$$
p_t(x,y)=\mu(x)\mu(y)\bigl[1+t f_\perp(x) f_\perp(y)\bigr]
\tag{D.8.9c.30.4}
$$
is nonnegative and normalized. It has both correct one-use marginals and every required independent flag-position trace, by centering and orthogonality. Its two-failure probability is $r^2+t\|f_\perp\|_2^4$, which changes strictly with $t$. Thus two complete preparations on the declared source can pass every single-position test and still have different joint scored-failure responses. The stated local projections, cost accounts and reset-ready observations continue to agree.

This construction classifies the complete physically admitted joint flag-preparation fiber for the finite world-service family, including a strengthened comparison with all separate two-use flag-position tests. Independence between uses on the full flag words is a stronger source prescription. Adaptive cross-use selectors, other guarded sectors, and the full global-realizer space of Convention P.14.1k require their own restrictions. $\square$

<a id="theorem-d89c31"></a>

<a id="theorem-d89c31-marked-golay-parent-transport-to-the-protected-r14-link"></a>**Theorem D.8.9c.31 (Marked Golay Parent Transport to the Protected R14 Link).** Take the accepted predictive-recovery code of Theorem Z.13b in the marked systematic presentation of Theorem Z.13c. Supply one of its 24 coordinate marks through a physically retained port, together with the complete marked code word table or generator. On the declared paid R14 link window of Theorem D.8.9c.25, the guarded $6\to46$ dependency of Theorem D.8.9c.19 can consume that actual parent. Every marked puncture gives a full protected link with the same strict error and expense comparison and the same logical quantum channel. Its code, fault, syndrome and recovery records have explicit marked transport. The unmarked coordinate-permutation class alone has no equivariant rule selecting a literal puncture of its carrier.

*Typed parent and source construction.* Use the row-6 predictive-recovery certificate on its original domain. Its selected code is a coordinate-permutation class; we keep the supplied representative and mark as additional input data to the protected link. On the 24-address parent memory the actual descriptor $j$ is copied to the child service and to the retained overlap register by reversible basis copies into ready registers. Before the protected run, the finite source constructor forms the puncture $C_j$ and shortening $S_j$ by Definition Z.13b.6, using the same word table. Here all surviving coordinates keep their original distinct parent addresses. The fixed compiler installs a basis of the shortened code, its two complete syndrome leader tables, the actual encode isometry, and the corresponding decoding schedule. The finite word and controller stock, the copied mark, the retained coordinate assignment and every prepared bit used by the compiler or runtime are supplied and counted. External compilation supplies the prepared input as a counted service. If executed internally, the finite word enumeration, table writes, verification and holding services are paid as part of the same reservation. The original R14 host labels, forecast lock, and physical clock are preserved.

Each $C_j$ is perfect, with dual $S_j$, by Proposition Z.13b.7. For a marked basis $(s_\ell)_{\ell=1}^{11}$ of $S_j$, put $\varsigma_j(e)=(s_\ell\cdot e)_\ell$. There is exactly one vector of weight at most three for every syndrome, and the constructor stores that leader $l_j(\varsigma)$. The physical input is encoded as the two coset vectors with equal positive amplitudes on $S_j+b\mathbf1$, $b=0,1$. This fixes the logical frame. The code and correction maps are implemented by the same finite controlled gates and complete retained measurement instruments of Theorem D.8.9c.25, on the rail with the marked surviving addresses. Each survivor receives its own independent Bernoulli-$q$ pair in the same prescribed Pauli order. For every input and untouched reference the resulting conditional decoded channel is conjugation by the residual logical frame
$$
X^{\lambda_j(e)} Z^{\lambda_j(z)},\qquad
\lambda_j(w)=\operatorname{wt}\!\bigl(w+l_j(\varsigma_j(w))\bigr)\bmod 2.
\tag{D.8.9c.31.1}
$$
The flags, both syndrome words and the control and clock outputs are retained. This follows from the logical representatives $X(\mathbf1)$, $Z(\mathbf1)$ and $C_j/S_j$ on this fixed frame. A scalar Pauli phase does not change the conditional channel. The same error polynomial of Proposition A.0.2d holds at every mark, since coordinate changes preserve weights and map the unique leaders to unique leaders.

For the overlap, let a coordinate permutation $\pi$ send the supplied marked presentation $(\mathcal G_{24},j)$ to $(\pi\mathcal G_{24},\pi j)$. It induces the ordered coordinate transport $\bar\pi$ on survivors. Deleting the marked coordinate commutes with this transport. Shortening commutes too, because $(\pi c)_{\pi j}=c_j$. Transport each check basis with its labels, or record the invertible binary change from the transported basis to the installed one. It follows that the syndrome of $\bar\pi w$ is the transported syndrome of $w$, and its unique leader is $\bar\pi l_j(\varsigma_j(w))$. Thus the residual logical frame in (D.8.9c.31.1) is identical along both routes. The physical permutation of the marked tensor factors also carries the encoded coset states exactly to the transported states. It preserves the product fault law. The two routes therefore agree on all flagged branches and arbitrary reference matrix units. This provides a typed $6\to46$ parent overlap using the retained puncture and code, with the same clock and prospective address record. The native sender bit and later scored and release operations use their established R14 restrictions.

*Common protected-window certificate.* There are 24 mark settings and all their finite encoding and extraction schedules can be padded to one elapsed window $W>0$ with the same maximum support and control reservation. The original finite bank-and-rail architecture permits every such finite marked gate word. Choose a proved common bound $C$ on the noncommon protected expense on that inventory, including the new retained code service. Take one fixed prospective reward excitation $B>2C/q_-$ on $q\in[q_-,1/64]$ with $q_->0$, using the independent reward-gap implementation of Theorem D.8.9c.25. The native protected and bare forecast losses are $f_{23}(q)$ and $q$. Since $f_{23}(q)<q/2$, the protected excess rate is at most $(C-Bq_-/2)/W<0$ uniformly over the marked menu. The common instrument normalization, error thresholds, and physical locality-window fields retain their Definition A.0.1q meanings. Together with the accepted MacWilliams code certificate, the marked puncture, the live recovery and threshold proof, and the overlap above, these instantiate the Golay-bootstrap parent fields on the declared protected R14 transmission window. The test uses the actual native forecast and verification gate. Universal noisy protected execution or a different RUD window requires its own certificate.

*Failure of a mark-free parent map.* In the systematic generator of Theorem Z.13c the matrix $P$ is symmetric and $P^2=I$ over $\mathbb F_2$. Hence the literal half swap sends $(u,uP)$ to $(uP,u)$, another codeword of the same parent. This is a parent automorphism with no fixed coordinate. An equivariant output puncture on the unmarked code would have to be fixed by that automorphism. The retained child port can distinguish the two marks directly from its address record. Thus the unmarked response quotient cannot transport a distinguished physical puncture into this marked child. The explicit marked input resolves the dependency. A child whose response quotient also forgets the address is a different typing with its own overlap.

*Exact finite verification.* The following checker uses the displayed 12 by 12 parent block, in its printed order. It enumerates the parent words, verifies each physical shortening and puncture, and constructs every syndrome leader table. It tests the marked transport on every low-weight error using the actual half swap, including the potentially different chosen check bases. For any higher-weight error, linearity fixes the transformed syndrome and the leader rule then gives the same transport. The all-input channel identity follows from (D.8.9c.31.1), separately from the finite enumeration.

```python
from collections import Counter
from itertools import combinations

def audit_marked_golay(rows):
    if len(rows) != 12 or any(len(row) != 12 for row in rows):
        raise ValueError('wrong parent block size')
    if any(bit not in (0, 1) for row in rows for bit in row):
        raise ValueError('nonbinary parent block')
    parent = [1 << i | sum(bit << (12 + k) for k, bit in enumerate(row))
              for i, row in enumerate(rows)]
    words = [0]
    for generator in parent:
        words += [word ^ generator for word in words]
    if Counter(word.bit_count() for word in words) != {
            0: 1, 8: 759, 12: 2576, 16: 759, 24: 1}:
        raise ValueError('incorrect parent weight census')

    def half_swap(word):
        return ((word & 4095) << 12) | (word >> 12)

    def delete(word, mark):
        low = (1 << mark) - 1
        return (word & low) | ((word >> (mark + 1)) << mark)

    if set(map(half_swap, words)) != set(words):
        raise ValueError('half swap does not preserve the parent')
    tables = []
    bases = []
    for mark in range(24):
        punctured = {delete(word, mark) for word in words}
        short = {delete(word, mark) for word in words if not (word >> mark & 1)}
        if len(punctured) != 4096 or len(short) != 2048 or not short <= punctured:
            raise ValueError('incorrect marked deletion')
        if min(word.bit_count() for word in punctured if word) != 7:
            raise ValueError('incorrect puncture distance')
        if min(word.bit_count() for word in short if word) != 8:
            raise ValueError('incorrect shortening distance')

        basis = []
        span = {0}
        for word in sorted(short):
            if word not in span:
                basis.append(word)
                span |= {item ^ word for item in span}
        if span != short or len(basis) != 11:
            raise ValueError('incorrect shortened basis')
        if any((a & b).bit_count() % 2 for a in basis for b in punctured):
            raise ValueError('dual mismatch')
        bases.append(basis)

        leaders = {}
        for weight in range(4):
            for support in combinations(range(23), weight):
                error = sum(1 << i for i in support)
                syndrome = tuple((error & check).bit_count() % 2 for check in basis)
                if syndrome in leaders:
                    raise ValueError('syndrome collision')
                leaders[syndrome] = error
        if len(leaders) != 2048:
            raise ValueError('syndrome omission')
        tables.append(leaders)

    checked = 0
    for mark, leaders in enumerate(tables):
        target = (mark + 12) % 24
        low = (1 << mark) - 1
        for error in leaders.values():
            source_word = (error & low) | ((error & ~low) << 1)
            moved = delete(half_swap(source_word), target)
            syndrome = tuple((moved & b).bit_count() % 2 for b in bases[target])
            if tables[target][syndrome] != moved:
                raise ValueError('marked leader transport failed')
            checked += 1
    return len(words), len(tables), checked
```

With the systematic parent block the checker returns 4096 words, 24 marked tables, and 49,152 transported leader entries. A table mismatch, unrecorded coordinate permutation, broken parent-code input, or incompatible physical address would fail this overlap. On the marked source the code parent supplies the actual syndrome and correction tables of the link. The remaining guarded arcs and full global realization retain their separate tests. $\square$

<a id="theorem-d89c32"></a>

<a id="theorem-d89c32-all-angle-native-strong-cp-readout-and-reverse-transport"></a>**Theorem D.8.9c.32 (All-Angle Native Strong-CP Readout and Reverse Transport).** Retain the full U34 phase parent family and the actual finite Gauss/Wilson seam source of Theorem D.8.9c.21, including its fixed physical clock and all angle settings $\theta\in\mathbb R/(2\pi\mathbb Z)$. A paid source readout determines the retained strong character on this entire domain by two exact probability coordinates. The character map has a uniform inverse error bound, and the corresponding finite instrument supplies a reverse strong-to-flavor record for every native parent phase. No deterministic finite-outcome perfect label readout exists for the whole circle. The reverse record uses the response laws and their finite estimates.

*Fixed cancellation on the actual carrier.* Use the normalized periodic seam chart with one charged seam as in Theorem D.8.9c.22. At fixed flavor parent $\lambda\in[0,1]$ let
$$
H_{\lambda,\circ}=\frac12\bigl(H_\lambda(0)+H_\lambda(\pi)\bigr).
\tag{D.8.9c.32.1}
$$
The two opposite seam phases cancel and every other term is unchanged. Both reference matrices are produced from the actual supplied parent by the same source constructor. The full comparison of Theorem D.8.9c.21 gives a common bound $B$ for their norms and hence for $H_{\lambda,\circ}$. The control $-H_{\lambda,\circ}$ depends on the known source parent and the two fixed reference settings, with no dependence on the setting being tested. Install it on a fresh, paid native test copy during its positive interrogation interval. The original delivery carrier executes its native dynamics through the operative cut. The paid readout runs on the fresh copy. The fresh copy uses the actual common setting $\theta$ of that source member. No record of the unknown setting is read to construct the control.

Take the two physical seam-node vectors $u,v$ of Theorem D.8.9c.22 with its normalized empty-fermion and identity-probe factors. Order their orientation so that the surviving seam operator sends $u$ to $tzv$, where $t>0$ is the native hopping in energy units and $z=e^{i\nu\theta}$ with the fixed primitive orientation $\nu=-1$. It sends $v$ to $t\bar z u$. The conjugation of Theorem D.8.9c.21 acts trivially on the chosen internal vectors, so these equations hold at every parent phase. They follow on the full physical carrier after (D.8.9c.32.1) is applied. At the common physical duration $\tau_{\mathrm{read}}=\pi\hbar/(4t)$ the actual test state starting at $u$ is
$$
\xi(z)=\frac{u-izv}{\sqrt2}.
\tag{D.8.9c.32.2}
$$

*Complete response map and inverse.* On the marked two-dimensional seam subspace define
$$
A_R=i|u\rangle\langle v|-i|v\rangle\langle u|,
\qquad
A_I=|u\rangle\langle v|+|v\rangle\langle u|.
$$
Set each operator to zero on the complement. Their normalized binary effects on the complete test carrier are $(I\pm A_R)/2$ and $(I\pm A_I)/2$. Use separate ready copies for the two settings and keep the test setting, result, and all pointer and control outputs. These are complete effects, implementable by a finite controlled unitary with the same positive duration and resource conventions as Theorem D.8.9c.22. The exact expectation pair in (D.8.9c.32.2) is $(\operatorname{Re}z,\operatorname{Im}z)$. Thus for the two positive-result probabilities $p_R,p_I$ the source-response inverse is
$$
z=(2p_R-1)+i(2p_I-1).
\tag{D.8.9c.32.3}
$$
The strong CP character is $z^{\nu}$ because the native mass determinant is positive and $\nu=\pm1$ on this branch. In the orientation $\nu=-1$ this uses complex conjugation. This inverse and the assigned physical angles never use an independently inferred flavor phase, a fitted angle, or an angle branch cut. Conversely two different characters give a different result probability in at least one actual test. If a finite candidate menu has chordal separation $\Delta_z>0$, the nearest-character rule applied to a complex estimate of (D.8.9c.32.3) gives the exact class whenever its error is less than $\Delta_z/2$.

*Same-source accuracy and time transport.* If the test has generator error with integrated operator norm at most $\hbar\epsilon$ on the full carrier, Duhamel's inequality bounds the outgoing unit-vector error by $\epsilon$. Each effect then has bias at most $2\epsilon$, before any separate preparation and measurement errors. With ideal preparation and effects, use $n$ independent ready copies for each quadrature. For both empirical positive-result frequencies to be within $\delta$ of their true probabilities, the probability of failure is at most $1/(2n\delta^2)$ by the variance bound and union bound. With this probability guarantee the complex estimate before circular normalization has error at most
$$
e=2\sqrt2(\delta+2\epsilon).
\tag{D.8.9c.32.4}
$$
Other independently certified effect biases can be added to the parenthesis. If $e<1$, the estimate is nonzero. Normalizing it to the circle changes it by at most $e$, by the reverse triangle inequality, so its chordal error is at most $2e$. All these constants are independent of the native phase and strong angle. The duration, full comparison matrices, support and interference records remain physically owned. Every precision request uses a finite preparation and finite sample budget.

After the original operative delivery cut, make these actual source queries and send the completed result records with their reference and clock labels to the next flavor epoch. The next flavor output can carry the full two-setting response law and its estimating protocol, or the specified finite precision record. Comparing the strong-source projection first and then the reported character, or taking the character test directly on the joined prepared source, gives the same two marked output laws because the added copy uses the same parent word, physical setting, phase orientation, and exact test maps. This supplies the reverse coordinate of (D.8.9c.19.2) on the whole native circular domain in the declared probability-law type. For nontrivial coherent character superpositions a different input type would require its own physical instrument comparison. A perfect deterministic label in a single finite-outcome observation would require one disjoint nonempty subset of its finite outcome set for each angle, which is impossible. The binary two-angle readout of Theorem D.8.9c.22 remains a separate perfect finite-menu realization.

This settles the reverse native character-readout and transport requirement on the stated all-angle prepared-source domain. The strict-gap obstruction of Theorem D.8.9c.21 on the enlarged angle and state menus still applies, and the original flavor objective and full guarded graph retain their tests. $\square$

<a id="theorem-d89c33"></a>

<a id="theorem-d89c33-marked-qfi-to-shell-to-acceleration-overlap"></a>**Theorem D.8.9c.33 (Marked QFI-to-Shell-to-Acceleration Overlap).** On the actual common Ramsey, signed-score and 24-mode source of Construction H.4.2.8f, there is a marked regular-24-cell extension preserving every original mode response. It supplies the $5\to7\to11$ and $5\to11$ routes of Theorem D.8.9c.19 on this branch. The common destination retains the ordered groups of eight physical response ports, all their original measurement and reference laws, and the calibrated acceleration coefficient. The two routes agree on that destination, including all actual responses preceding the local derivative. The direct QFI Gram matrix and the new shell kernel have distinct measured roles.

*Common source and shell control.* Keep the full sensing and response experiment of Construction H.4.2.8f, including its calibrated acceleration/clock source, active router, spatial partial trace, independent setting laws, signed score and all 24 control/readout paths. Write a mode label as $(j,v,u,h)$ with $j\in\{1,2,3\}$ the actual output group and $v,u,h\in\{0,1\}$. Its installed complex control direction is
$$
B_{\mathrm{jvuh}}=i^h E_{2(j-1)+v,u}/\sqrt2.
$$
These are the native unit-QFI modes with their native real response Gram $I_{24}$. For each group fix the ordered spatial-coordinate pairs
$$
\begin{array}{c|cc}
j & v=0 & v=1\\ \hline
1&(1,2)&(3,4)\\
2&(1,3)&(2,4)\\
3&(1,4)&(2,3)
\end{array}
$$
and at pair $(r,s)$ assign the root $n_{\mathrm{jvuh}}=(-1)^u e_r+(-1)^h e_s$. These 24 distinct integer roots give disjoint tangent unit-radius cells with centers $\sqrt2\,n_{\mathrm{jvuh}}$. Each group is exactly one of the three frames of Definition Z.9a's construction. All centers are at distance two from the center of the central unit cell, and distinct centers have separation at least two. The 24 control operations, their original basis order, and the shell wiring are fixed before observations.

The shell extension has two parts. First put a read-only root descriptor on each actual mode port, with the full bijective decoder in the registered interface. A marked mode-address request selects the same native pulse and readout through either address convention. Fixed reversible copies of the classical address and root descriptor into fresh ready records preserve the original quantum carrier, all visible and private outputs, and any untouched reference. This is the positive-duration finite controlled-source convention of Construction H.4.2.8f. If the request is a prescribed word of mode tests with retained adaptive choices, each new label merely adds a deterministic record to that step. The actual native conditional instrument is unchanged on every supplied history. Thus every retained finite native mode response is recovered exactly by forgetting the new record, and the shell-addressed version preserves it by the inverse address lookup. The position of an earlier response, pulse or clock event is not moved by the address lookup.

Second, add a separate two-mode shell test. For each ordered pair of mode ports prepare the marked four-axis auxiliary source in the vacuum-to-axis code spanned by an orthogonal vacuum and four real unit excitations. The same address decoder gives the real unit preparation vector $x_\mu=n_\mu/\sqrt2$ on the excitation code at mode $\mu$. For the pair $(\mu,\nu)$ prepare
$$
\frac{|0\rangle x_\mu+|1\rangle x_\nu}{\sqrt2}
$$
on a fresh control and auxiliary, and measure $X$ on the control. The expectation is $x_\mu\cdot x_\nu$. Both outcomes, the auxiliary and the control record are retained. The preparations are normalized and implemented by the controlled finite rotations of the declared ideal source convention, with charged stock, positive intervals, and a common maximum norm reserve over the finite pair menu. They leave all native response factors untouched. The actual measured pair kernel is therefore the regular-24-cell Gram. This registered shell test is distinct from the native ordered mode-insertion Gram $I_{24}$. In particular the two antipodal cell labels can carry different native responses. The auxiliary has no input from the unknown sensing deformation and supplies no extra metrological QFI for it.

*Feasibility and typed comparison.* In the registered comparison, each candidate keeps every full native mode protocol, its predictive benefit, and the declared shell-kernel test. It uses one physical support register per Euclidean support coordinate, with the same positive reservation per coordinate. The new clock, pair query and labeling controllers are counted in the common maximum support and finite task reservation. In a higher-dimensional extension the actual same kernel and native responses are realized by appending null coordinate registers to the four-axis source, retaining their full stock and holds at a strictly positive excess support price. Any faithful carrier must support 24 tangent cells and cannot have dimension at most three by Theorem Z.10. Its measured kernel has rank four, since the three signed frames span the four axes. The supplied marked support attains dimension four, so it meets the least-support selection of Theorem Z.11 in this declared physical comparison. The original H.4.2.8f four-dimensional sensing setting space and this shell carrier are registered with the displayed coordinate identification. No claim of a four-dimensional isometry of the native 24-dimensional QFI tangent space is used.

The direct parent map from row 5 to row 11 takes the native mode label, its output group $j$, its fixed pulse, and all the retained response and clock data. The composite through row 7 inserts the actual root descriptor and then obtains the identical mode and group from that descriptor. Group $j$ is determined by the support partition of the root, not by a projection of its signs onto the physical spatial output axes. Both paths consume the same independent four-dimensional sensing and signed-score record. For every finite source history the direct and shell routes select the same native instrument with the same calibrated controls. Coupling either route to an arbitrary untouched reference preserves equality of each branch map, because the added copy acts only on its classical label. This is the required overlap on the common destination, which reads the original acceleration ports. The separately registered shell query remains an observable of the larger source.

The same eight native susceptibilities in each output group still have the derivative $\eta=3/(8\sqrt3)$ of Theorem H.4.2.8g. Both paths sum these eight responses and divide by the same counted eight modes. Thus both give that coefficient and its original output calibration. The ensemble spatial ratio still follows from the independent four-dimensional setting law and the actual partial trace. It is unaffected by the auxiliary root test. This fills the stated overlap without requiring an equation of state or a common continuum geometry on this source.

*Finite verifier.* The complete label and Gram checks require 24 labels and 576 ordered pairs. Each ordered label decodes back to the identical original address and the same group on its frame. The rank check follows from the exact rational covariance $I_4/4$ of the uniform roots. The executable evaluates these claims before the analytical native-instrument equality and calibration proof above are applied.

```python
from fractions import Fraction
from itertools import product

def check_acceleration_shell(labels=None):
    frame = (((0, 1), (2, 3)), ((0, 2), (1, 3)), ((0, 3), (1, 2)))
    addresses = list(product(range(3), range(2), range(2), range(2)))
    roots = {}
    for j, v, u, h in addresses:
        root = [0, 0, 0, 0]
        a, b = frame[j][v]
        root[a], root[b] = (-1)**u, (-1)**h
        roots[j, v, u, h] = tuple(root)
    if labels is not None and labels != roots:
        raise ValueError('physical mode-to-root dictionary changed')
    inverse = {root: key for key, root in roots.items()}
    if len(inverse) != 24:
        raise ValueError('missing or repeated shell location')
    for address, root in roots.items():
        support = tuple(i for i, value in enumerate(root) if value)
        groups = [j for j, pairs in enumerate(frame) if support in pairs]
        if groups != [address[0]] or inverse[root] != address:
            raise ValueError('original mode address or output group lost')
    gram = [[sum(a*b for a, b in zip(x, y)) for y in roots.values()]
            for x in roots.values()]
    for i, row in enumerate(gram):
        for j, value in enumerate(row):
            if (i == j and value != 2) or (i != j and value > 1):
                raise ValueError('noncontact or overlapping shell cell')
    for i, j in product(range(4), repeat=2):
        second_moment = Fraction(sum(x[i]*x[j] for x in roots.values()), 48)
        if second_moment != Fraction(int(i == j), 4):
            raise ValueError('incorrect measured shell rank or moment')
    return roots, gram
```

The verifier gives three ordered eight-port frames, 24 roots and 576 pair coefficients. Exchanging two root labels from different groups preserves the unmarked set and every unmarked shell inequality but fails the actual address check. The resulting audit supplies this marked route equality on the accepted acceleration source. The other incoming structural routes, Einstein and dark-sector outputs, and the global realizer retain their own predicates. $\square$

<a id="theorem-d89c34"></a>

<a id="theorem-d89c34-all-angle-u34-feedback-and-quantitative-selection"></a>**Theorem D.8.9c.34 (All-Angle U34 Feedback and Quantitative Selection).** Use the native U34 phase settings $\lambda=0,1$ of Theorem D.8.9c.22, with their full marked weak-current and mass records, and the all-angle and all-state strong delivery domain of Theorem K.6.6p transported at each phase by Theorem D.8.9c.21. Use the paid reverse response of Theorem D.8.9c.32 and the two phase programs with fixed forecast commitments described below. The native strong minimizer, the complete flavor minimizer relation over the circle, and the fixed selections of the resulting guarded block are all determined. The block has a unique selected tuple. The stated physically prepared ambient family has exactly two classes over it. An explicit angular and state margin controls approximate fixed selections.

*Actual source and local decisions.* Use the normalized seam coordinate $z=e^{i\nu\theta}$ of Theorem D.8.9c.32. Both source routes keep the full native U34 mass and current record and the complete native Gauss/Wilson carrier, clock and reference data. The prior strong task retains its full physical source delivery and its operative boundary. The two new reverse tests use separately priced, fresh copies of the same prepared source setting after that boundary. Their actual readout laws are independent of the delivered density matrix. The angular record is their typed probability law, with independent finite estimation if required. It is not a claim that one finite outcome supplies a deterministic exact angle label.

Write $a=0,1$ for the actual flavor phase programs. Use the reserved-stock, two-commitment forecast task of Theorem D.8.9c.22 with the positive real-quadrature result as the truth-zero event. Commit the candidate bit $a$ before revealing this independently prepared readout, with a paid comparison and full native source and controller records. Retain the imaginary-quadrature result in its separate test and use both laws in the transported character record. The reverse test of the previous completed source uses the strong candidate's marked setting and flavor parent. The copy, latch and delivery of its truth record are owned operations; the next program cannot use that unrevealed truth sample to choose its own commitment. Both programs use the same finite reservation at each supplied parent, with the same unit convention and positive loss weight $g$. The score costs at fixed parent differ only through their probabilities of error. With $p_R=(1+\operatorname{Re}z)/2$, the flavor costs are
$$
V_{\mathrm{fl}}(0;z)=C(z)+g(1-p_R),\qquad
V_{\mathrm{fl}}(1;z)=C(z)+gp_R .
\tag{D.8.9c.34.1}
$$
Thus the complete minimizer set is $\{0\}$ when $\operatorname{Re}z>0$, $\{1\}$ when $\operatorname{Re}z<0$, and $\{0,1\}$ when $\operatorname{Re}z=0$. At $z=1,-1$ this is the original scored decision on the two-angle source. Here the flavor record accepts the full circular domain and carries its actual ties. The comparison is the declared two-program flavor score, which does not replace the original larger flavor optimization predicate.

On the full strong domain use the first-law comparison and fixed supplied workstation of Theorem K.6.6p. Its hypotheses and source admission remain those of that theorem. The conjugacy of Theorem D.8.9c.21 transports its positive-flag energy shift, exact attaining preparation, clock, meter and source work bound to both flavor parents. At either parent $a$, it gives the unique selected native output $(\theta,\rho)=(0,P_a)$, where $P_a$ is the ground projector of $H_a(0)$. The uniform strong positive gap on the old two-angle menu has the more precise angular replacement below. The source comparison on the full circle still has arbitrarily close response-distinct competitors. In particular its use as an attained selector here does not furnish the uniform strict separation of Definition D.8.9a on that full domain.

*Feedback and prepared ambient fiber.* For an exact fixed selection, first the strong selection enforces $\theta=0$, $\rho=P_a$. The actual reverse probability law then gives $p_R=1$. Equation (D.8.9c.34.1) forces $a=0$ with gap $g$. Conversely these outputs meet the two physical transport equations, so the complete fixed tuple on this branch is $(a,\theta,\rho)=(0,0,P_0)$. This conclusion is unaffected by how any tie away from the selected strong character is reported.

For the physical ambient family use the explicit finite-control preparations of Theorems K.6.6p and D.8.9c.21, with one fixed canonical purification and control convention for each supplied density, the same two existing late reference alternatives of Theorem D.8.9c.21, and the paid reverse instruments above. Every finite program and all its measured outcomes remain owned. This family is defined by the specified preparation and control maps, while the stronger lower comparison for native selection can include every implementation allowed by Theorem K.6.6p. The restriction to the selected tuple keeps the full local native source/state, the physical test laws and flavor output, and leaves the separately prepared late reference for its declared later read. The private late reference enters neither physical test, score, nor local restriction. At the fixed tuple the controls, preparation and native state are fixed by the family; its two late reference choices both remain and their actual $X$ test distinguishes them. Hence the selected fiber on this family consists exactly of those two classes. Other implementations of the same local output have their own ambient restriction record.

*Quantitative test.* Use one inverse-energy heat parameter $\beta>0$ and the positive winding comparison constant $\delta_{\rm w}$ in Theorem K.6.6i, common to the two parents by their exact conjugacy. Let $R=T(V_{\mathrm{str}}-V_{\mathrm{str}}^*)$ be the energy-unit excess at a fixed parent, converting the source's scalarized work unit to its physical energy unit. For a definite angle setting, the actual all-implementation comparison gives $R\ge E(\theta)-E(0)$ and $R\ge\operatorname{Tr}(\rho H_a(\theta))-E(0)$, with $\rho$ the delivered state. Applying the winding inequality of Theorem K.6.6i and $-\log(1-x)\ge x$ gives
$$
R\ \ge\ \frac{\delta_{\rm w}}{4\beta}|z-1|^2 .
\tag{D.8.9c.34.2}
$$
Indeed $1-|\cos(\nu\theta/2)|\ge |z-1|^2/8$. The full native seam identity also gives $\|H_a(\theta)-H_a(0)\|=t|z-1|$, with $t$ its physical hopping. If $\Delta_{\rm g}>0$ is the zero-angle simple ground gap, the spectral theorem therefore gives
$$
1-\operatorname{Tr}(P_a\rho)
 \le \frac{R+t\sqrt{4\beta R/\delta_{\rm w}}}{\Delta_{\rm g}} .
\tag{D.8.9c.34.3}
$$
The observable is the actual retained native source state; the bound concerns its population outside the ground projector on the same carrier.

In particular if $R\le\delta_{\rm w}/(4\beta)$ then $|z-1|\le1$ and $\operatorname{Re}z\ge1/2$. If the registered real-quadrature estimate satisfies $|(2\widehat p_R-1)-\operatorname{Re}z|<1/4$, the estimated cost difference between the two flavor programs is at least $g/4$ in favor of phase zero. The same conclusion holds for the actual mean score on an implementation whose real-quadrature bias satisfies that bound in the real coordinate. Thus a flavor excess below $g/4$ forces phase zero for that fixed supplied strong candidate and declared comparison. The finite-sample confidence and independent implementation errors come from the physical source test of Theorem D.8.9c.32. They are not hidden in the energy inequality. The exact fixed tuple uses the probability laws and attaining source, while the displayed thresholds give a reproducible approximate selection test on each definite-angle history. The global registry and other guarded source families retain their tests. $\square$

<a id="theorem-d89c35"></a>

<a id="theorem-d89c35-sharp-mixing-obstruction-on-the-selected-kms-ports"></a>**Theorem D.8.9c.35 (Sharp Mixing Obstruction on the Selected KMS Ports).** In the guarded $14\to53$ dependency of Theorem D.8.9c.19, take the faithful KMS state and physical boost clock from the actual retained crossing-port factors of Construction F.10.12i.13, or the exact trace memory of Proposition F.10.12j. Keep those same factors as the complete retained scrambling output and use their actual autonomous adjoint evolution between the nominated input and output cuts. The finite KMS state and its OTOC strip are available on this overlap. The same-port evolution has zero dissipative mixing gap and a sharp, time-independent separation from replacement by that state, including arbitrary untouched references. Thus these source restrictions cannot supply the mixing datum of Definition F.10.4b.6a through their own autonomous dynamics. The decision applies to every clock duration, every observable choice and every sample interval on these retained factors.

*Actual overlap.* In the nontracial case, the independently calibrated receiver gap is $g=k_BT_U\log((1-p)/p)$ with $0<p<1/2$. On each selected $M_2$ the actual captured physical evolution is conjugation by the receiver Hamiltonian $gN$, transported by the exact two-capture comparison of Construction F.10.12i.13. This comparison pulls the full output matrix algebra back to the actual incoming factor. It is an identity channel in its marked coordinates, including arbitrary untouched references. The same comparison transports its faithful state $\tau_p=\operatorname{diag}(1-p,p)$. A chart containing the same factor uses its original identity overlap maps. With $m\ge1$ distinct retained ports the product state $\tau=\tau_p^{\otimes m}$ and the Hamiltonian $H=g\sum_{j=1}^m N_j$ are therefore on the same marked output. The selected source contains no interaction between these actual port factors during their calibrated comparison. Its other material and field factors remain in the apparatus. In the trace case use the full retained $M_2$, its actual $\tau=I/2$ and its scalar Hamiltonian. This proof concerns these selected factors and physical clocks.

At these cuts, the strip identity is the finite Gibbs identity for the same Hamiltonian and faithful density. On the registered temperature the inverse modular and physical adjoint actions agree with the sign and units of Definition F.10.12a. Every finite quarter-density OTOC numerator of Definition F.10.4b.4 is therefore the same matrix trace along the thermal route and along the actual capture-and-read route. The trace is entire as a function of the complex physical time. A supplied nonzero disconnected denominator has its own domain and bound. These comparisons populate the state, clock and OTOC-numerator part of the guarded overlap. They do not infer a normalized disk bound from the finite Gibbs identity.

*Exact norm and gap test.* Let $\mathcal U_s$ be conjugation by $e^{-isH/\hbar}$ in the Schrödinger picture on the actual full selected carrier and let $\mathcal R_\tau(X)=\operatorname{Tr}(X)\tau$. For every faithful density $\tau$ on a finite matrix carrier the following identity holds:
$$
\frac12\|\mathcal U_s-\mathcal R_\tau\|_\diamond
=1-\frac1{\operatorname{Tr}(\tau^{-1})}.
\tag{D.8.9c.35.1}
$$
Precomposition by the inverse unitary reduces this to the identity channel, since the replacer preserves its rule under that precomposition. To prove the upper bound for the identity, diagonalize $\tau$ with eigenvalues $t_i>0$ and use the unnormalized vector $\Gamma=\sum_i |ii\rangle$ on two copies of the carrier. Its projector and $I\otimes\tau$ are the Choi matrices of the identity and replacer, respectively. For $S=\sum_i t_i^{-1}$, Cauchy–Schwarz gives $\Gamma\Gamma^*\preceq S(I\otimes\tau)$ because $\|(I\otimes\tau^{-1/2})\Gamma\|^2=S$. Hence $\mathcal R_\tau-S^{-1}\operatorname{id}$ is completely positive. Its trace multiplier is $1-S^{-1}$. In dimension greater than one, dividing by that scalar gives a channel, so the half diamond norm of the original difference is at most $1-S^{-1}$. The scalar dimension case is immediate. The upper bound holds for arbitrary reference size.

For equality, use the actual normalized input and reference vector $\psi=\sum_i(t_i^{-1}/S)^{1/2}|ii\rangle$. The identity output is its pure state. After replacement the joint output is the product of $\tau$ and the original reference marginal. The expectation of the binary effect $|\psi\rangle\langle\psi|$ is $S^{-1}$ on that product and one on the identity output. This attains the upper bound. For the original clock channel use the corresponding input with its inverse unitary applied, or rotate the readout equivalently. On the finite ideal control branch the preparation and binary effect have finite positive-duration dilations with the registered support and reference. The norm equality is a response comparison and adds no free auxiliary to the autonomous evolution.

Thus on the nontracial branch the exact separation is $1-[p(1-p)]^m$, and on the actual trace memory it is $3/4$. On traceless matrices conjugation has Hilbert–Schmidt norm one, and each difference of diagonal eigenprojectors is fixed. On the subspace of observables with zero $\tau$ mean there is likewise a nonzero fixed observable, for example a centered occupation. The sampled autonomous channel has no positive spectral contraction gap on this space. In particular it cannot mix all complete retained inputs to $\tau$ even without a reference. No change of the sampling interval removes that fixed observable.

*Time domain and scope of the exclusion.* On the nontracial branch the common gap makes the full retained evolution periodic with period $2\pi\hbar/g$. Its quarter-density numerators are finite Fourier polynomials, with frequencies drawn from the integer differences of sums of at most two occupation eigenvalues. This follows by expanding the two copies of the evolved observable in the eigenbasis. At each period the full channel and all those correlations return to their initial values. On the scalar trace branch every such correlation is constant. These statements retain all probe choices. The stronger operator-norm conclusion (D.8.9c.35.1) rules out a positive mixing certification even if a transient OTOC signal has a useful nonconstant interval. The original finite exact exponential exclusions of Theorems F.10.4b.7b and F.10.4b.7c retain their stated hypotheses on the denominator and dynamics.

This decides the same-selected-port autonomous mixing test of the guarded overlap: the thermal parent supplies its actual state and clock, and the child cannot use that clock on this complete retained output as a strictly mixing channel. A distinct driven channel, a larger output including field or reservoir modes, or the alternative infinite-first branch of Definition F.10.4b.7h has its own physical comparison. The full sector graph remains open. $\square$

<a id="theorem-d89c36"></a>

<a id="theorem-d89c36-time-composition-test-on-the-retained-thermal-car-source"></a>**Theorem D.8.9c.36 (Time-Composition Test on the Retained Thermal CAR Source).** Take the thermal CAR source of Definition F.10.4b.7h with $n=2^m\ge2$ blocks and its retained channels $\Phi_{n,t}$ of Theorem F.10.4b.7h.3: one independent-input preparation (F.10.4b.7h.R4), one autonomous evolution for the elapsed time $t\ge0$ and the complete retained output. Put $u_n=T_n/2$ and let $\Delta^{\rm comp}_n=\tfrac12\|\Phi_{n,T_n}-\Phi_{n,u_n}\circ\Phi_{n,u_n}\|_\diamond$ be the separation of one uninterrupted packet delay from two freshly prepared half-delay services. In one block $j$, compare the retained vacuum with the one-particle input $a^*(G_{j1})|0\rangle$, with any common input on the other blocks, and read the even occupation effect $N_F=a^*(F_{j1})a(F_{j1})$ on that block. The probabilities of the outcome one for the two inputs differ by exactly $s^2=1/16$ after $\Phi_{n,T_n}$ and by exactly $s^2\eta_n^2$ after $\Phi_{n,u_n}\circ\Phi_{n,u_n}$, where $m(t)=\langle f,e^{ith_0/\hbar}f\rangle$ and
$$
\eta_n=\frac{m(u_n)^2\,[2-(1+s^2)m(T_n)]}{1-s^2m(T_n)^2},\qquad
0<\eta_n\le\bar\eta_n=\frac{512\,n}{15(4n+1)^2}.
\tag{D.8.9c.36.1}
$$
Consequently $\Delta^{\rm comp}_n\ge(1-\bar\eta_n^2)/32>1/112$ for every $n$, and $\Delta^{\rm comp}_n>3/100$ for $n\ge16$. On the common finite regulators of Theorem F.10.4b.7h.6 with horizon $R\ge T_n$ and complete-channel bound $\varepsilon$ in (F.10.4b.7h.R22), the same separation $\Delta^{\rm comp}_{n,M}$ of the regulated channels is at least $\Delta^{\rm comp}_n-3\varepsilon$. Every $n$ has regulators with $\varepsilon<1/672$, and they keep $\Delta^{\rm comp}_{n,M}>1/224$. Moreover, for every nonzero finite-dimensional one-particle subspace $S\subset\mathfrak h_0$ of one block, $\operatorname{CAR}(S)$ is not invariant under the physical flow $\tau_t$, $t\ge0$, of Definition F.10.4b.7h. If $S$ also lies in the domain of $h_0$, the independent-input channels $\Phi^S_t$ given by (F.10.4b.7h.R4) with $S$ in place of $S_{n,0}$ do not satisfy $\Phi^S_{t+t'}=\Phi^S_t\circ\Phi^S_{t'}$ for all $t,t'\ge0$.

*Retained compression.* Write $U_t=e^{ith_0/\hbar}$, so that $\tau_t(a^*(v))=a^*(U_tv)$ and $m(t)=\int w(E)e^{iEt/\hbar}\,dE$. In (F.10.4b.7h.1.1) write $\cosh(\beta E/2)$ as the mean of $e^{\pm\beta E/2}$. Both sides of (F.10.4b.7h.1.2) are analytic for $|\operatorname{Im}t|<\kappa\hbar$, and $\beta/2<\kappa$, so the identity continues to the complex times $t\pm i\beta\hbar/2$ and gives
$$
m(t)=c\operatorname{Re}\operatorname{sech}(\alpha t+ib)=\frac{c^2\cosh(\alpha t)}{\sinh^2(\alpha t)+c^2}.
\tag{D.8.9c.36.2}
$$
Thus $m$ is even, $m(0)=1$ and $0<m(t)<1$ for $t\ne0$. Moreover $m(t)\le\operatorname{sech}(\alpha t)$, since $c^2\cosh^2(\alpha t)\le\sinh^2(\alpha t)+c^2$. The flow acts on the energy factor alone, so it preserves blocks, replicas and flavors. In replica $r$ of block $j$ write $F=F_{jr}$, $G=G_{jr}$, $(v_1,v_2)=(F,G)$ and $\mu_n=m(T_n)$. Since $g_n=U_{T_n}f$ and the flavor overlap is $s$, the Gram matrix and raw evolution matrix $M_{ab}(t)=\langle v_a,U_tv_b\rangle$ are
$$
\Gamma=\begin{pmatrix}1&s\mu_n\\ s\mu_n&1\end{pmatrix},\qquad
M(t)=\begin{pmatrix}m(t)&s\,m(t+T_n)\\ s\,m(t-T_n)&m(t)\end{pmatrix}.
$$
The retained projection of that replica is $\sum_{a,b}|v_a\rangle(\Gamma^{-1})_{ab}\langle v_b|$. The two replicas are orthogonal and each is carried into itself by $U_t$.

*Response of the occupation test.* For a retained input $\sigma$ of the block define its covariance $C_\sigma$ on $\operatorname{ran}P$ by $\langle w,C_\sigma v\rangle=\sigma(a^*(v)a(w))$. The vacuum has $C_\sigma=0$, the input $a^*(G)|0\rangle$ has $C_\sigma=|G\rangle\langle G|$, and $\operatorname{Tr}(\sigma N_x)=\langle x,C_\sigma x\rangle$ for $N_x=a^*(x)a(x)$. Split $U_tv=PU_tv+QU_tv$. In the Klein factorization of Theorem F.10.4b.7h.3 a mixed term $a^*(PU_tv)a(QU_tw)$ becomes $a_S^*(PU_tv)P_S\otimes a_E(QU_tw)$, and the term in the other order factors in the same way. Its expectation in $\sigma\otimes\omega_E$ vanishes because the even state $\omega_E$ has zero odd expectations. Hence
$$
C_{\Phi_t(\sigma)}=X_t^*C_\sigma X_t+E_t,\qquad X_t=PU_tV,
\tag{D.8.9c.36.3}
$$
where $E_t$, the covariance of the vectors $QU_tv$ in $\omega_E$, is independent of $\sigma$. A second half-delay service applies (D.8.9c.36.3) again with a fresh copy of $\omega_E$. For two inputs with covariances $C_1,C_0$ the output covariances therefore differ by $X_{T_n}^*(C_1-C_0)X_{T_n}$ after one delay and by $(X_{u_n}X_{u_n})^*(C_1-C_0)X_{u_n}X_{u_n}$ after two half-delay services. For the two inputs of the statement the probability differences for $N_F$ are $|\langle G,X_{T_n}F\rangle|^2$ and $|\langle G,X_{u_n}X_{u_n}F\rangle|^2$. Since $F,G\in\operatorname{ran}P$, the first amplitude is $\langle G,U_{T_n}F\rangle=M_{21}(T_n)=s\,m(0)=s$. Inserting the replica projection gives $\langle G,X_uX_uF\rangle=\sum_{a,b}M_{2a}(u)(\Gamma^{-1})_{ab}M_{b1}(u)$. At $u=u_n$ evenness gives $M_{21}(u_n)=s\,m(u_n)$ and $M_{11}(u_n)=M_{22}(u_n)=m(u_n)$, so
$$
\langle G,X_{T_n}F\rangle=s,\qquad
\langle G,X_{u_n}X_{u_n}F\rangle=\frac{s\,m(u_n)^2[2-(1+s^2)\mu_n]}{1-s^2\mu_n^2}=s\,\eta_n.
\tag{D.8.9c.36.4}
$$
Since $0<\mu_n<1$, the bracket lies in $(1-s^2,2)$ and the denominator in $(1-s^2,1)$. Hence $0<\eta_n<2m(u_n)^2/(1-s^2)=\tfrac{32}{15}m(u_n)^2$. From $e^{\alpha u_n}=2\sqrt n$ and (D.8.9c.36.2), $m(u_n)\le\operatorname{sech}(\alpha u_n)=4\sqrt n/(4n+1)$, which gives $\eta_n\le\bar\eta_n$.

*Diamond separation.* The global channels are $\Phi_{T_n}^{\otimes n}$ and $(\Phi_{u_n}\circ\Phi_{u_n})^{\otimes n}$, so for the product inputs of the statement the block probabilities above are probabilities of the complete channels. For a traceless Hermitian $Z$ and an effect $0\le N\le I$ one has $|\operatorname{Tr}(NZ)|\le\tfrac12\|Z\|_1$. Hence the probability for each input changes by at most $\Delta^{\rm comp}_n$ between the two channels. The contrasts $s^2$ and $s^2\eta_n^2$ of the two channels are their probability differences between the two inputs, so their difference $s^2(1-\eta_n^2)$ is the difference of the two changes. Therefore
$$
\Delta^{\rm comp}_n\ge\frac{1-\eta_n^2}{32}\ge\frac{1-\bar\eta_n^2}{32}.
\tag{D.8.9c.36.5}
$$
The function $n/(4n+1)^2$ decreases for $n\ge1$. With $\bar\eta_2=1024/1215$ the right side of (D.8.9c.36.5) is at least $427649/47239200>1/112$ for every $n\ge2$. With $\bar\eta_{16}=8192/63375$ it exceeds $3/100$ for $n\ge16$, and it tends to $1/32$ as $n\to\infty$. At least one of the two inputs changes its probability by $(1-\eta_n^2)/32$ or more. Both inputs are parity eigenstates and $N_F$ is even, so the witness uses no parity-coherent preparation and no reference.

*Common regulators.* Theorem F.10.4b.7h.6 compares $\Phi_{n,M,t}$ with $\Phi_{n,t}$ in the same logical coordinates, with half diamond distance at most $\varepsilon$ for $0\le t\le R$; the times $u_n$ and $T_n$ lie in this window. Submultiplicativity of the diamond norm and the unit diamond norm of channels give $\|\Phi_{n,M,u_n}\circ\Phi_{n,M,u_n}-\Phi_{n,u_n}\circ\Phi_{n,u_n}\|_\diamond\le2\|\Phi_{n,M,u_n}-\Phi_{n,u_n}\|_\diamond$. The triangle inequality then gives $\Delta^{\rm comp}_{n,M}\ge\Delta^{\rm comp}_n-3\varepsilon$. At fixed $n$ and $R$ the quantity $e_R$ of (F.10.4b.7h.R21) tends to zero as $\Lambda\to\infty$ and $\Delta E\to0$, so regulators with $\varepsilon<1/672$ exist, and for them $\Delta^{\rm comp}_{n,M}>1/112-1/224=1/224$.

*Finite retained subspaces.* Let $S\subset\mathfrak h_0$ be nonzero and finite-dimensional, and suppose $\tau_t(\operatorname{CAR}(S))\subset\operatorname{CAR}(S)$ for all $t\ge0$. For $w\perp S$ the field $a(w)$ anticommutes with the generators of $\operatorname{CAR}(S)$, hence with each of its odd elements. For $v\in S$ the odd element $a^*(U_tv)$ of $\operatorname{CAR}(S)$ then gives $\langle w,U_tv\rangle I=\{a(w),a^*(U_tv)\}=0$. Hence $U_tS\subset S$, and unitarity in finite dimension gives $U_tS=S$ for all real $t$. The restriction of $t\mapsto U_t$ to $S$ is a continuous unitary group on a finite-dimensional space, so it has a common eigenvector $v\ne0$ with $U_tv=e^{i\lambda t}v$ for all $t$. Then $(e^{itE/\hbar}-e^{i\lambda t})v(E)=0$ for almost every $E$, simultaneously for all rational $t$. This forces $v(E)=0$ for almost every $E\ne\hbar\lambda$, so $v=0$, a contradiction.

Now let $S$ also lie in the domain of $h_0$, with projection $P_S$, inclusion $V_S$ and compression $X^S_t=P_SU_tV_S$. The derivation of (D.8.9c.36.3) used only the Klein split and the evenness of the complement state, so it holds for $\Phi^S_t$ with $X^S_t$. Suppose $\Phi^S_{t+t'}=\Phi^S_t\circ\Phi^S_{t'}$ for all $t,t'\ge0$. Comparing $a^*(\psi)|0\rangle$ with the vacuum for normalized $\psi\in S$ shows that $\mathcal L_t(D)=X^{S*}_tDX^S_t$ satisfies $\mathcal L_{t+t'}(D)=\mathcal L_t(\mathcal L_{t'}(D))$ for $D=|\psi\rangle\langle\psi|$. These rank-one projections span the Hermitian operators on $S$ over $\mathbb R$, so $\mathcal L$ is a one-parameter semigroup on that finite-dimensional space. It is continuous because $X^S_t$ is a finite-rank compression of a strongly continuous unitary group, and $\mathcal L_0$ is the identity. Hence $\mathcal L_t=e^{tK}$, where $K$ is the derivative at zero. For $v\in S$ one has $(U_t-I)v=(it/\hbar)h_0v+o(t)$, so $X^S_t=I+(it/\hbar)h_S+o(t)$ with the Hermitian compression $h_S=P_Sh_0V_S$, and $K(D)=(i/\hbar)(Dh_S-h_SD)$. Therefore $\mathcal L_t(D)=e^{-ith_S/\hbar}De^{ith_S/\hbar}$ preserves the operator norm. On the other hand $\langle x,X^S_ty\rangle=\int e^{iEt/\hbar}\langle x(E),y(E)\rangle\,dE\to0$ by the Riemann–Lebesgue lemma, so $\|X^S_t\|\to0$ and $\|\mathcal L_t(D)\|\le\|X^S_t\|^2\|D\|\to0$. This contradiction proves the failure of the semigroup law.

*Scope of the comparison.* The uninterrupted channel $\Phi_{n,2t}$ evolves the reservoir once. The composed channel $\Phi_{n,t}\circ\Phi_{n,t}$ discards the complement after the first interval and prepares a fresh copy of $\omega_E$ for the second, with that output and preparation service charged in the source ledger of Construction F.10.4b.7h.8. Proposition F.10.4b.7h.7 certifies the spectral gap of the single sampled channel and bounds its iterates, which are such repeated services. This decides the time-composition test on the source: its retained channels do not form a semigroup in elapsed time, and at the packet delay two half-delay services differ from one uninterrupted evolution of the same total duration by (D.8.9c.36.5). The alternative infinite-first branch named in Theorem D.8.9c.35 therefore supplies its mixing retained channel through a reservoir restriction, and its sampled gap is a one-shot service datum with the preparation and duration of Proposition F.10.4b.7h.7. The proof uses Definition F.10.4b.7h and Theorems F.10.4b.7h.3 and F.10.4b.7h.6. Identification of this reservoir with the local KMS descent of Definition F.10.12a is a separate datum of the guarded $14\to53$ dependency. $\square$

<a id="corollary-d89d-sectorwise-strict-certificate-closure-criterion"></a>**Corollary D.8.9d (Sectorwise Strict-Certificate Closure Criterion).** Suppose every live sector in a finite acyclic dependency graph has a strict PPI/PCE certificate with theorem-level entries and all typed overlap maps commute. Then Theorem D.8.9c selects a unique compatible tuple of sector response classes. This conclusion neither constructs an ambient global realizer nor proves a unique lift of the tuple; those claims require a declared restriction map with a nonempty, respectively singleton, fiber as in Theorem P.14.1k.3. If a sector lacks one finite entry required by this route, Convention P.14.1a and Corollary P.14.1g retain the weakest unresolved status until an equivalent theorem-level record is supplied.

*Proof.* Theorem D.8.9c gives existence and uniqueness of the compatible product tuple. A lift through an ambient restriction map is additional data, so it cannot follow from product compatibility alone. The unresolved-entry statement follows because Definition D.8.9a cannot select the affected sector class when its candidate family, quotient, response record, cost, minimizer, strict gap, or overlap map is missing. ∎

<a id="remark-d89d1-structural-invariant-projection-on-a-strict-branch"></a>**Remark D.8.9d.1 (Structural-Invariant Projection on a Strict Branch).** Let $S$ be a sector with strict PPI/PCE certificate $\mathfrak C_S$ in the sense of Definition D.8.9a, and let $q_S^*\in\bar Q_S$ be its unique selected class from Theorem D.8.9b. If

$$
\mathcal O:\bar Q_S\longrightarrow\mathcal Y
$$

is an internal finite invariant that is well-defined on response-equivalence classes, then the branch value

$$
\mathcal O_{\mathrm{phys}}
:=
\mathcal O(q_S^*)
$$

is unique on that strict branch. Consequently, once $\mathfrak C_S$ is accepted, the strict-separation proof need not be repeated for every invariant that factors through the same selected quotient class. If two derivation chains are shown to factor through the same $q_S^*$ and the same invariant $\mathcal O$, their common value is a projection of one selected response class rather than an additional independent coincidence.

This remark does not collapse the recurrent-ledger source roles of Theorem R.3.5e.3. On the minimal Appendix Z / attractor branch, the tuple

$$
(K_0,d_0,\varepsilon_0,a,b,M,k,D)=(3,8,\ln2,2,6,24,12,4)
$$

retains exactly the status assigned by Proposition T.59, Corollary T.59a, Proposition R.3.5e, and Theorem R.3.5e.3: it is closed on the stated branch, with the current source-role non-collapse still in force.

*Proof.* Theorem D.8.9b states that $q_S^*$ is the unique minimizer in $\bar Q_S$. Since $\mathcal O$ is a function on $\bar Q_S$, evaluating it at $q_S^*$ gives a unique value. The second statement is the same observation applied to derivation chains whose maps have both been proved to factor through $q_S^*$. The final paragraph is a status-preservation clause: Theorem R.3.5e.3 records non-collapse of the present source roles, while Proposition T.59 and Corollary T.59a record the closed minimal-branch tuple. ∎

<a id="theorem-d89f-branch-degeneracy-observable-stratification"></a>**Theorem D.8.9f (Branch-Degeneracy Observable Stratification).** Let $\bar Q_S$ be a compact finite-response quotient and let $V_S:\bar Q_S\to\mathbb R\cup\{+\infty\}$ be lower semicontinuous. Then the minimizer set
$$
M_S
:=
\operatorname*{argmin}_{q\in\bar Q_S}V_S(q)
\tag{D.8.9f.1}
$$
is compact and nonempty whenever $V_S$ is finite somewhere.

A retained observable $O:\bar Q_S\to\mathcal Y$ has theorem-level value on the non-strict sector exactly when $O$ is constant on $M_S$. If $O$ separates two points of $M_S$, then the value of $O$ is certificate-pending until a further strict certificate, calibration datum, empirical protocol, or ledger-accepted branch condition reduces the minimizer set.

If, in addition, $M_S$ is a convex polytope in the retained affine response coordinates and the admissible tie-breaking perturbations are affine protocol-cost functionals restricted to $M_S$, then any finite lexicographic list of such perturbations selects a nonempty face of $M_S$. A sufficient route is that $K_B(S)$ is a compact response polytope and $V_S$ is affine on all of $K_B(S)$, so that its minimum set is a face. Piecewise affinity alone does not establish this convexity premise. The possible selected faces belong to the finite face lattice of $M_S$, whose relative interiors give a finite face stratification.

*Proof.* A lower semicontinuous function that is finite somewhere on the compact quotient attains a finite minimum; its minimum set is a nonempty closed compact sublevel. Constancy of $O$ on $M_S$ is precisely independence from the unresolved minimizer choice. Under the additional convex-polytope hypothesis, an affine functional attains its minimum on a nonempty exposed face. Minimizing each later functional on the face retained by the earlier ones gives a nested list of nonempty faces, each also a face of $M_S$. Every face of a polytope is exposed, and there are finitely many faces. For a given finite list, sufficiently small successive positive weights realize the same lexicographic choice: at the finitely many vertices, each positive earlier-stage gap can be made larger than the total contribution of all later stages. This proves the finite-face conclusion without treating a nonconvex union as a convex polytope. ∎

## D.9 Conclusion

Under the stated identification, comparison, and stochastic assumptions, the appendix shows how cost minimization aligns internal complexity estimates, favors regular geometry, and drives adaptation toward stable states, and how a broad range of relaxation rates produces pink-noise behavior.

**Technical ledger.**

This appendix has provided a rigorous analysis grounded in the variational perspective of minimizing the PCE Potential $V(x)$ (Definition D.1), modeling the slow adaptation dynamics of the MPU network as a stochastic gradient flow (Equation D.8). We demonstrated through formal proofs and analysis of the potential structure and dynamics that:

1.  **Alignment (Theorem 2)** has two conditional levels. On the faithful-cost-identifiability and efficiency-saturated branch, Corollary D.1 makes $C_P(v)=\langle\hat C_v\rangle$ necessary at a true stable PCE equilibrium. On Proposition D.1's global Euclidean Itô branch, its quadratic proxy drift, invariant proxy subspace, constant target, coefficient regularity and moment hypotheses give Corollary D.2's upper bound on expected mean-square misalignment. Theorem D.2a supplies the gain/sign/noncancellation certificate that realizes that drift from the measured work gap on its stopped affine-cost branch. Remark D.1 records the remaining response- and cost-preserving reparameterization freedom, while Definition B.1 supplies the chosen quantum-circuit-complexity coordinate.

2.  **Geometric Regularity (Theorem 43)** holds for full-potential global minimizers on the strict-comparison branch of Theorem D.3. The certified cost estimates of Lemma D.3 give $V(x_{\mathrm{irreg}})>V(x_{\mathrm{reg}})$ for every certified pair with $aL^\gamma+bL-c>0$ (Theorem D.2). If every irregular configuration has a regular equal-proxy comparator with strictly lower core potential, no irregular configuration can minimize the full potential.

3.  **Complexity Adaptation Convergence (Section D.8):** On Theorem D.8's invariant interval and two-sided curvature branch, the deterministic flow converges exponentially to the unique minimizer $C^\star$ of the registered $V_{\mathrm{eff}}$ on that interval, with rate $\underline\lambda\eta_{adapt}$. For the projected Itô branch, Equation (D.16) gives an exponentially relaxing upper bound on the expected potential gap.

4.  **Spectral Marginality and 1/f Noise (Section D.8.5):** On the stationary OU-mode branch of Lemma D.8a with zero cross spectra, Equation (D.27) sums the Lorentzian mode spectra. The neutrality and KL profile-cost hypotheses of Theorem D.8b select a constant active mode-weight profile, giving asymptotic $1/f$ scaling in the regime (D.22). Under the exponent and remainder hypotheses of Theorem D.8a, $\beta_{\mathrm{spec}}=1-s$ for $-1<s<1$. Corollary D.8b.1 gives the exact endpoint corrections for the declared finite band; identifying those endpoints with physical update rates requires the corresponding realization record.

Section D.6.5 establishes ergodicity of the full stochastic dynamics under Assumptions (A1)–(A6), and its detailed-balance low-noise subcase yields Gibbs concentration near the global-minimum sector of $V(x)$. That sector is geometrically regular only under the strict-comparison hypothesis of Theorem D.3. Exact alignment, local-minimizer regularity, pink spectra, and continuum closure likewise retain the faithful-cost, local-regularization, scale-neutral, and continuum-certificate hypotheses stated in their respective results. The subsequent spacetime and gravity arguments may consume only the branches on which those records are jointly satisfied.

<a id="remark-d91-scope-of-pce-cost-minimization"></a>**Remark D.9.1 (Scope of PCE Cost Minimization).** PCE declares minimization of the registered potential $V(x)=V_{\mathrm{op}}(x)+V_{\mathrm{prop}}(x)-V_{\mathrm{benefit}}(x)+V_{\mathrm{penalty}}(x)$ within a specified admissible class. On the fluctuation--dissipation branch of Theorem D.5, the declared stochastic dynamics has $V$ as its potential and its low-noise stationary measure concentrates near global minimizers under that theorem's hypotheses. Theorem 31 supplies only a conditional reset-heat bound; it neither generates this dynamics nor proves descent. Selection-pressure language is an application only after a population model links resource savings to differential persistence. If the retained configuration space is a finite-dimensional smooth manifold and the operative $V$ is Morse, then its critical points are isolated; these are additional hypotheses, not consequences of Theorems E.2 or K.10.4, and they do not identify the critical values with physical constants or particle spectra without separate observable maps. On a registered branch that independently asserts exact global-minimizer selection, a certified selected configuration with a strictly lower-potential admissible competitor contradicts that assertion. A nonminimizing finite-temperature sample or adaptation transient alone does not contradict Gibbs concentration or the conditional convergence results.
