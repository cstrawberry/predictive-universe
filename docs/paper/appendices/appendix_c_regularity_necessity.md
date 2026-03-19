# Appendix C: Necessity of Geometric Regularity

## C.1 Introduction: The Requirement for Geometric Order

This Appendix provides the detailed technical analysis rigorously justifying Theorem 43 (Necessary Emergence of Geometric Regularity). It establishes that large-scale geometric irregularities in the underlying Minimal Predictive Unit (MPU) network structure are fundamentally incompatible with the operational requirements mandated by the Predictive Universe (PU) framework's core principles. Specifically, we demonstrate that networks lacking geometric regularity inevitably violate one or more of the following essential conditions for sustained, efficient operation:

*   **(LV) Local Viability:** Each MPU $v$ must maintain its Predictive Performance $PP(v)$ within the Space of Becoming $(\alpha, \beta)$ (Axiom 3). This requires stable local adaptation dynamics.
*   **(GC) Global Coherence:** The network must support the propagation and maintenance of coherent predictive information over macroscopic scales to effectively solve the aggregate Prediction Optimization Problem (POP, Axiom 1).
*   **(RE) Resource Efficiency:** The network configuration must represent an efficient allocation of resources (complexity, energy, time) according to the Principle of Compression Efficiency (PCE, Definition 15), avoiding prohibitive costs.

The argument proceeds by first defining geometric regularity (Section C.2), then providing a constructive microscopic basis for a positive Ricci curvature bound from PU principles (Section C.3), which is a key component of regularity. Subsequently, we demonstrate how violations of regularity—specifically anomalous dimension (Section C.4) and large curvature fluctuations (Section C.5)—lead to quantifiable functional failures or unsustainable resource costs. This culminates in proving that geometric regularity is a necessary condition for any stable, viable MPU network configuration (Section C.6). This result is crucial for justifying the emergence of a smooth, regular spacetime manifold (Section 11) from the underlying discrete MPU network.

## C.2 Formal Definitions of Geometric Properties

We precisely define the geometric properties of the MPU network $\mathcal{N}=(\mathcal{V}, \mathcal{E}, \{w_{uv}\})$ relevant to our analysis, using the ND-RID propagation cost metric $d_{\mathcal{N}}$ (Definition 35), which measures the minimum cost path length between vertices $u, v \in \mathcal{V}$.

**Definition C.1 (Uniform D-dimensional Polynomial Volume Growth).** A sequence of MPU networks $\{\mathcal{N}_n\}$ (indexed by size $n \to \infty$) exhibits uniform D-dimensional polynomial volume growth if there exist positive constants $K_1, K_2$, a dimension $D \ge 1$, and a macroscopic scale $R_0$ such that for all sufficiently large $n$, for all vertices $v \in \mathcal{V}_n$, and all radii $R > R_0$:
$$
K_1 \left(\frac{R}{\delta_{eff, n}}\right)^D \leq |B_{R}(v)| \leq K_2 \left(\frac{R}{\delta_{eff, n}}\right)^D
\tag{C.1}
$$
where $B_{R}(v) = \{u \in \mathcal{V}_n \mid d_{\mathcal{N}_n}(v, u) \leq R\}$ is the metric ball defined by the cost metric $d_{\mathcal{N}_n}$, $|B_{R}(v)|$ denotes the number of vertices in the ball, and $\delta_{eff, n}$ is the characteristic microscopic cost distance scale (e.g., $\ell_0 \langle w_{uv} \rangle_{avg}$) for network $\mathcal{N}_n$. Networks failing to satisfy this condition for a single integer $D$ over relevant scales exhibit anomalous dimension.

**Definition C.2 (Uniformly Bounded Synthetic Ricci Curvature).** An MPU network $\mathcal{N}$ has uniformly bounded synthetic Ricci curvature if there exists a constant $K \in \mathbb{R}$ such that a suitable measure of discrete Ricci curvature (e.g., Ollivier-Ricci curvature $\kappa_{\mathcal{N}}(x,y)$ for edges [Ollivier 2009], or related spectral measures [Lin & Yau 2010]) satisfies $\kappa_{\mathcal{N}}(x,y) \ge -K$ uniformly across the network. As argued in Section C.3, PU principles favor a positive lower bound. Networks where the lower bound $K$ effectively diverges (i.e., curvature is not bounded below) or where the spatial variance of the curvature Var$(\kappa_{\mathcal{N}})$ is large over macroscopic regions exhibit large or unbounded curvature fluctuations.

**Definition C.3 (Geometric Regularity).** An MPU network $\mathcal{N}$ exhibits geometric regularity if it satisfies both Definition C.1 (Uniform D-dim Polynomial Volume Growth for some integer D) and Definition C.2 (Uniformly Bounded Synthetic Ricci Curvature with a positive lower bound $\kappa_R > 0$ and bounded variance). Geometric irregularity refers to the violation of either or both of these conditions.

## C.3 Microscopic Basis for a Positive Ricci Curvature Bound from PU Principles

This section provides a constructive argument demonstrating how local MPU interaction rules, consistent with the Predictive Universe (PU) principles, can lead to an emergent positive lower bound on a specific discrete measure of Ricci curvature—the Ollivier-Ricci curvature ($\operatorname{Ric}_{\mathrm{OR}}$) [Ollivier 2009]. This offers a microscopic basis for satisfying the "uniformly bounded synthetic Ricci curvature" condition (Definition C.2; main text Definition 37), which is an essential component of geometric regularity (Definition C.3).

This derivation uses a representative admissible one-step law for the transition probabilities $\mathcal{P}\delta_v(u) = P_{vu}$ from an MPU $v$ to a neighboring MPU $u$ (where $d(v,u)=1$ in the underlying MPU graph, using the cost metric $d_{\mathcal{N}}$ from main text Definition 35). The purpose of the model is to exhibit a concrete local response kernel whose sensitivity to the local Predictive Physical Complexity $C_P(x)$ can be estimated. The exact functional form is not claimed to be unique; the regularity argument uses only positivity of neighbor weights, bounded comparability of the baseline kernel, and finite local sensitivity to changes in $C_P$.

Let the transition probability from $v$ to a neighbor $u$ be given by the representative model
$$
P_{vu} = \frac{P^{(0)}_{vu} \exp(-\lambda_{R} I'(C_P(u)))}{Z_v}
\tag{C.2}
$$
where $P^{(0)}_{vu}$ is a baseline transition probability (e.g. $1/\deg(v)$ in the unbiased case), $I'(C_P(u))$ is the derivative of an effective local cost-rate function $I(c)$ evaluated at $c=C_P(u)$, $\lambda_{R} > 0$ is a sensitivity parameter,¹ and $Z_v = \sum_{w \sim v} P^{(0)}_{vw} \exp(-\lambda_{R} I'(C_P(w)))$ is the local normalization factor ensuring $\sum_{u \sim v} P_{vu} = 1$. The function $I(c)$ represents the PCE-optimal effective cost associated with operating at complexity $c$.

The Ollivier-Ricci curvature for an edge directed from $v$ to $u$ is defined using the Wasserstein-1 distance $W_1$ between the probability distributions $\mathcal{P}\delta_v = \{P_{vx}\}_{x \sim v}$ and $\mathcal{P}\delta_u = \{P_{ux}\}_{x \sim u}$:
$$
\operatorname{Ric}_{\mathrm{OR}}(v \to u) = 1 - \frac{W_1(\mathcal{P}\delta_v, \mathcal{P}\delta_u)}{d(v,u)}
\tag{C.3}
$$
For adjacent nodes where $d(v,u)=1$ (representing a single effective link cost unit), this simplifies to $\operatorname{Ric}_{\mathrm{OR}}(v \to u) = 1 - W_1(\mathcal{P}\delta_v, \mathcal{P}\delta_u)$. We utilize the standard estimate $W_1(p,q) \le \operatorname{diam}(\operatorname{supp} p \cup \operatorname{supp} q)\,\mathrm{TV}(p,q) = \frac{\operatorname{diam}}{2}\,\|p - q\|_1$ for probability measures on a finite metric space. For adjacent $v \sim u$ and one-step neighbor laws, $\operatorname{supp}(\mathcal{P}\delta_v) \cup \operatorname{supp}(\mathcal{P}\delta_u)$ has diameter at most $3$ in the graph metric (worst case: a neighbor of $v$ at distance $1$ from $v$, plus the edge $v \to u$ of length $1$, plus a neighbor of $u$ at distance $1$ from $u$; when $v$ and $u$ share many neighbors, the effective diameter reduces to $2$), so
$$
W_1(\mathcal{P}\delta_v, \mathcal{P}\delta_u) \;\le\; \frac{3}{2}\,\|P_{v\bullet} - P_{u\bullet}\|_1,
$$
and the constant factor (at most $\frac{3}{2}$, often closer to $1$ for high-overlap neighborhoods) can be absorbed into the geometric constant $C_{geom}$ used below.

### C.3.1 Properties of the Effective Cost-Rate Function $I(c)$
The effective cost-rate function $I(c)$, reflecting the local contribution to the global PCE Potential $V(x)$ (main text Definition D.1) due to complexity $c=C_P$, is shaped by the interplay of predictive performance benefits and resource costs. Based on the properties of $PP(c)$ (concave, main text Definition 19), $R(c)$ (convex, main text Definition 3), and $R_I(c)$ (concave, main text Definition 3b), it is assumed that for PCE-optimal configurations, $I(c)$ is both $m$-strongly convex (i.e., $I''(c) \ge m > 0$, ensuring it has a well-defined minimum and certain growth properties facilitating stable optimization) and $M$-smooth (i.e., $|I''(c)| \le M < \infty$) over the relevant range of complexities $c \in [C_{op}, C_{max_phys}]$ (where $C_{max_phys}$ is the maximum physically sustainable complexity). The $M$-smoothness implies its derivative $I'(c) = \partial_{C_P}I(c)$ is $M$-Lipschitz continuous:
$$
|I'(C_P(v))-I'(C_P(u))| \;\le\; M\,|C_P(v)-C_P(u)|.
\tag{C.4}
$$

### C.3.2 Bound on Spatial $C_P$ Variation Across Links
The adaptation dynamics driven by PCE (e.g., Law of Prediction, main text Section 6, and the global minimization of $V(x)$ as per main text Appendix D) lead to a spatially correlated complexity distribution. For neighboring vertices $v, u$ (connected by a single ND-RID link, $d(v,u)=1$), the difference in instantaneous Predictive Physical Complexity $C_P$ is bounded:
$$
|C_P(v)-C_P(u)| \;\le\; L_{C_P},
\tag{C.5}
$$
where $L_{C_P} < \infty$ is an effective Lipschitz constant for the spatial variation of $C_P$ between adjacent MPUs. This bound arises because PCE disfavors excessively sharp spatial gradients in $C_P$, which would incur high propagation costs (part of $V_{prop}$ in main text Def D.1) or lead to inefficient resource allocation. The finite rate of complexity adaptation (main text Equation 30) and the local nature of MPU interactions contribute to this emergent spatial smoothness.

### C.3.3 Bounding Total Variation and Deriving the Ricci Lower Bound
The difference between the probability distributions $P_{v\bullet}$ and $P_{u\bullet}$ is primarily driven by the difference in the exponential weighting terms $\exp(-\lambda_{R} I'(C_P(x)))$. Applying the Mean Value Inequality to these exponential factors:
$$
\Bigl|\exp(-\lambda_{R} I'(C_P(v)))-\exp(-\lambda_{R} I'(C_P(u)))\Bigr| \;\le\; \lambda_{R}\,e^{-\lambda_{R} I'_{\!*}}\, |I'(C_P(v))-I'(C_P(u))|,
\tag{C.6}
$$
where $I'_{\!*}$ is some value between $I'(C_P(v))$ and $I'(C_P(u))$.
Combining (C.4)–(C.6) yields a complete $L_1$ control with explicit normalization dependence (no $Z_v \approx Z_u$ assumption).

**Lemma C.3.3 (Rigorous $L_1$ stability for the complexity-weighted kernel).**
Let $P$ be given by (C.2) and write $\mu_v := P^{(0)}_{v\bullet}$, extended by zero to all of $\mathcal{V}$ (i.e., $\mu_v(x) := P^{(0)}_{vx}$ for $x \sim v$ and $\mu_v(x) := 0$ otherwise, so that $\mu_v$ is a probability measure on $\mathcal{V}$ supported on the neighbors of $v$). Assume:

1. (**Operating-range monotonicity**) $I'(c) \ge 0$ for $c \in [C_{op}, C_{max\_phys}]$, and define
$$
B := \sup_w I'(C_P(w)) < \infty.
$$

2. (**Smoothness**) $I'$ is $M$-Lipschitz (Equation (C.4)).

3. (**Spatial regularity**) $C_P$ obeys the edgewise bound (C.5), hence for the graph metric $d$ one has
$$
|C_P(x) - C_P(y)| \le L_{C_P}\,d(x,y) \quad \text{for all } x, y.
$$

4. (**Bounded local baseline geometry**) For adjacent vertices $v \sim u$, the baseline rows satisfy
$$
W_1(\mu_v, \mu_u) \le C_{geom},
$$
for some constant $C_{geom} = \mathcal{O}(1)$ depending only on bounded local graph geometry and the chosen baseline kernel $P^{(0)}$.

Then for adjacent $v \sim u$ one has the general estimate
$$
\|P_{v\bullet} - P_{u\bullet}\|_1
\le e^{\lambda_R B}\,\|\mu_v - \mu_u\|_1
+ C_{geom}\,\lambda_R\,e^{\lambda_R B}\,M\,L_{C_P}.
$$
In particular, under a locally homogeneous baseline (the "locally symmetric $P^{(0)}$" regime used here), $\mu_v = \mu_u$ for all adjacent $v \sim u$, so $\|\mu_v - \mu_u\|_1 = 0$ and the first term vanishes identically. More generally, whenever $\|\mu_v - \mu_u\|_1 \le \delta_{\mu}$ for some $\delta_{\mu} \ge 0$, the full bound reads $\|P_{v\bullet} - P_{u\bullet}\|_1 \le e^{\lambda_R B}\,\delta_{\mu} + C_{geom}\,\lambda_R\,e^{\lambda_R B}\,M\,L_{C_P}$. In the locally homogeneous regime ($\delta_{\mu} = 0$) one obtains the advertised bound
$$
\|P_{v\bullet} - P_{u\bullet}\|_{1} \;\le\; C_{geom} \cdot \lambda_{R}\,e^{\lambda_{R} B}\,M\,L_{C_P}.
\tag{C.7}
$$

*Proof.* Define $w(x) := \exp(-\lambda_R I'(C_P(x)))$ and $Z_v := \sum_x \mu_v(x) w(x)$. Since $0 \le I'(C_P(x)) \le B$, one has $w(x) \in [e^{-\lambda_R B}, 1]$ and therefore $Z_v \in [e^{-\lambda_R B}, 1]$, so $1/Z_v \le e^{\lambda_R B}$. For any $x$,
$$
P_{vx} - P_{ux}
= \frac{\mu_v(x) w(x)}{Z_v} - \frac{\mu_u(x) w(x)}{Z_u}
= \frac{w(x)}{Z_v}\bigl(\mu_v(x) - \mu_u(x)\bigr) + \mu_u(x) w(x)\Big(\frac{1}{Z_v} - \frac{1}{Z_u}\Big).
$$
Taking $\ell_1$ norms and using $\sum_x \mu_u(x) w(x) = Z_u$ gives
$$
\|P_{v\bullet} - P_{u\bullet}\|_1
\le \frac{1}{Z_v}\|\mu_v - \mu_u\|_1 + \frac{|Z_v - Z_u|}{Z_v}
\le e^{\lambda_R B}\|\mu_v - \mu_u\|_1 + e^{\lambda_R B}|Z_v - Z_u|.
$$
Moreover $Z_v = \mathbb{E}_{\mu_v}[w]$. Using (C.4) and the global consequence of (C.5), the function $I'(C_P(\cdot))$ is $M L_{C_P}$-Lipschitz, and since $z \mapsto e^{-\lambda_R z}$ has derivative bounded by $\lambda_R$ on $z \ge 0$, one has
$$
|w(x) - w(y)| \le \lambda_R\,|I'(C_P(x)) - I'(C_P(y))|
\le \lambda_R M L_{C_P}\,d(x,y),
$$
so $\operatorname{Lip}(w) \le \lambda_R M L_{C_P}$. By Kantorovich–Rubinstein duality,
$$
|Z_v - Z_u|
= \bigl|\mathbb{E}_{\mu_v}[w] - \mathbb{E}_{\mu_u}[w]\bigr|
\le \operatorname{Lip}(w)\,W_1(\mu_v, \mu_u)
\le \lambda_R M L_{C_P}\,C_{geom}.
$$
Substituting this bound into the previous display yields the stated estimate and hence (C.7) in the locally homogeneous baseline regime. □ We define the parameter with the geometric factor kept explicit:

$$
\eta_{R} \;:=\; C_{geom}\,\lambda_{R}\,e^{\lambda_{R} B}\,M\,L_{C_P}.
\tag{C.8}
$$
For the MPU network to function in the regular-response regime relevant for the later geometric argument, it is sufficient that the induced Wasserstein response between adjacent one-step evolution laws be uniformly strictly smaller than the edge length. For the representative kernel (C.2), the quantitative sufficient condition is
$$
\eta_{R} < 1.
$$
Thus the exact expression (C.8) is a convenient sufficient bound for this kernel, not a separate theorem-level axiom of PU.

Using the local-support estimate $W_1 \le \frac{3}{2}\|\cdot\|_1$ (absorbed into $C_{geom}$ as noted after (C.3)) together with (C.7), we have
$$
W_1\bigl(\mathcal P\delta_v,\mathcal P\delta_u\bigr)\;\le\;\eta_{R}.
\tag{C.9}
$$
Substituting this into the definition of Ollivier-Ricci curvature (Equation C.3) with $d(v,u)=1$:
$$
\operatorname{Ric}_{\mathrm{OR}}(v \to u)\;\ge\;1-\eta_{R}.
$$
Defining $\kappa_{R} := 1-\eta_{R}$:

$$
\kappa_{R} = 1 - C_{geom}\,\lambda_{R}\,e^{\lambda_{R} B}\,M\,L_{C_P}.
\tag{C.10}
$$

Since the regular-response regime requires $\eta_{R} < 1$ for the representative kernel, it follows that $\kappa_{R} > 0$. Equivalently, adopting a lazy one-step kernel with idleness $\alpha\in(0,1)$ reduces $W_1$ and can strictly increase $\kappa_R$ for fixed local parameters. This establishes a strictly positive lower bound on this measure of discrete Ricci curvature, arising from the interplay of PCE-optimized local complexity variations and the information-theoretic constraints of the underlying MPU interactions. A network with such a positive lower bound on Ricci curvature (meaning it is bounded below by $\kappa_R > 0$) satisfies a key component of geometric regularity (Definition C.2, Definition C.3), providing a constructive basis for the emergence of a well-behaved spacetime geometry. The subsequent sections of this appendix detail why violations of such regularity are penalized by PCE.


¹ Footnote: The parameter $\lambda_R$ is specific to this curvature model (Equation C.2) and represents the sensitivity of local transition probabilities to gradients in the effective cost-rate $I'$. It should not be confused with the resource scarcity Lagrange multiplier $\lambda$ from main text Definition 20.


**Remark C.3.3a (From Ollivier-Ricci to a continuum scalar curvature estimator).**
This estimator remark belongs to the later continuum bridge. It is not part of the regular-global-minimum theorem itself; it is used only when connecting discrete curvature control to the locality/consistency clause of Theorem D.6 and the continuum discussion of Section 11.4. Let $(\mathcal N_h,d_h)$ be a sequence of MPU networks whose rescaled edge lengths satisfy $d_h(x,y)\approx h$ for adjacent vertices and whose lazy random-walk kernels define Ollivier-Ricci curvature $\kappa_h(x,y)$ via Equation (C.3). In the PU scaling one may identify $h\approx\delta_{eff}$ (Section 11). Under quasi-uniform sampling and local isotropy (the empirical second-moment matrix of neighbor direction vectors satisfies $\frac{1}{\deg(x)}\sum_{y\sim x}\hat v_{x\to y}\hat v_{x\to y}^T=\frac{1}{D}I+o(1)$), the small-scale expansion gives
$$
\kappa_h(x,y)=\frac{h^2}{2(D+2)}\,\mathrm{Ric}_g(v,v)+O(h^3),
\tag{C.10a}
$$
where $v$ is the unit tangent in the $x\to y$ direction and $\mathrm{Ric}_g$ is the continuum Ricci tensor. Averaging over neighbors yields a local scalar curvature proxy
$$
R_h(x):=\frac{2D(D+2)}{h^2}\cdot\frac{1}{\deg(x)}\sum_{y\sim x}\kappa_h(x,y)=R_g(x)+O(h),
\tag{C.10b}
$$
so that $R_h\to R_g$ in $L^1_{\mathrm{loc}}$ under refinement. This is the discrete-to-continuum bridge used later in the locality/consistency hypothesis of Theorem D.6 [Ollivier 2009; van der Hoorn et al. 2020].

*Justification of the neighbor-average step.* Under the local isotropy condition (which improves as the mesh refines, with error $O(h)$ relative to the continuum limit)
$$
\frac{1}{\deg(x)}\sum_{y \sim x} \hat{v}_{x \to y}\,\hat{v}_{x \to y}^{\mathsf{T}}
= \frac{1}{D} I + O(h),
$$
write $\mathrm{Ric}_g(x)$ in an orthonormal basis at $x$. Then
$\mathrm{Ric}_g(\hat{v}, \hat{v}) = \hat{v}^{\mathsf{T}} \mathrm{Ric}_g(x) \hat{v}$ and therefore
$$
\frac{1}{\deg(x)}\sum_{y \sim x} \mathrm{Ric}_g(\hat{v}_{x \to y}, \hat{v}_{x \to y})
= \mathrm{Tr}\!\left(\mathrm{Ric}_g(x) \cdot \frac{1}{\deg(x)}\sum_{y \sim x} \hat{v}_{x \to y} \hat{v}_{x \to y}^{\mathsf{T}}\right)
= \frac{1}{D}\,\mathrm{Tr}(\mathrm{Ric}_g(x)) + O(h)
= \frac{1}{D} R_g(x) + O(h).
$$
Averaging (C.10a) over neighbors and substituting the previous display gives (C.10b).


## C.4 Penalization of Anomalous Network Dimension

We first demonstrate that anomalous dimension (Definition C.1 violated) leads to violations of global coherence (R2) and resource efficiency (R3).

**Theorem C.1 (Path Length Scaling in Regular Geometries and in Irregular Families with $d_{min}>1$).**
Let $\mathcal{N}=(\mathcal{V}, \mathcal{E})$ be an MPU network with cost distance $d_{\mathcal{N}}$. Let $L$ denote a characteristic macroscopic Euclidean distance scale within the network's embedding.
* (a) **Regular Geometry:** If $\mathcal{N}$ exhibits uniform D-dimensional polynomial volume growth (Def C.1), the average cost distance $\langle d_{\mathcal{N}}(L) \rangle$ and the maximum cost distance $d_{\mathcal{N}, max}(L)$ between points separated by Euclidean distance $L$ scale approximately linearly with $L$:
  $$
    \langle d_{\mathcal{N}}(L) \rangle \approx c_{avg} L, \quad d_{\mathcal{N}, max}(L) \approx c_{max} L
    \tag{C.11}
    $$
where $c_{avg}, c_{max}$ depend on the average microscopic cost $\delta_{eff}$ and the discrete graph structure.
* (b) **Irregular Geometry in Families with Super-Linear Chemical Distance:** If $\mathcal{N}$ belongs to an irregular graph family for which the chemical distance satisfies $d_{graph}(L)\propto L^{d_{min}}$ with $d_{min}>1$ (as in the fractal/percolation examples cited below), then the maximum cost path distance scales super-linearly:
$$
d_{\mathcal{N}, max}(L) \propto L^{\gamma}, \quad \gamma=d_{min}>1.
\tag{C.12}
$$
The average cost distance may also be super-linear in such families, but that requires an additional family-specific estimate and is not proved here.

*Proof:*
* **(a) Regular:** A network satisfying Def C.1 implies that the number of vertices grows like $R^D$, characteristic of a D-dimensional space. In such spaces, for points separated by Euclidean distance $L$, the shortest path length in terms of graph steps ($d_{graph}$) scales linearly with $L$ on average, $d_{graph} \approx L / \delta_{graph}$, where $\delta_{graph}$ is the typical distance per step. The cost metric $d_{\mathcal{N}}$ (Definition 35) accumulates costs $w_{uv} \approx \delta_{eff}/\delta_{graph}$ along the path, where $\delta_{eff}$ is the average cost per step. Thus, the total cost distance is $d_{\mathcal{N}} \approx d_{graph} \times (\delta_{eff})$. Substituting the linear scaling of $d_{graph}$ yields $d_{\mathcal{N}}(L) \approx (L / \delta_{graph}) \times \delta_{eff} = (\delta_{eff}/\delta_{graph}) L$. Since $\delta_{eff}/\delta_{graph}$ is a ratio of microscopic scales, $d_{\mathcal{N}}(L)$ scales linearly with $L$. Both average and maximum path lengths are expected to exhibit this linear scaling in well-behaved, regular D-dimensional structures.
* **(b) Irregular family with $d_{min}>1$:** In the cited fractal/percolation families, shortest path lengths (chemical distance $d_{graph}$) scale as $d_{graph} \propto L^{d_{min}}$ with $d_{min}>1$ [Havlin & Ben-Avraham 1987]. Since the cost metric accumulates costs along such paths, $d_{\mathcal{N}} \approx \delta_{eff} d_{graph}$, the maximum cost path distance inherits the same exponent:
$$
d_{\mathcal{N}, max}(L)\propto L^{d_{min}}.
$$
This proves the stated super-linear worst-case scaling for that class of irregular families. ∎

**Theorem C.2 (Quantitative Viability Failure due to Anomalous Dimension).** MPU networks $\mathcal{N}_{irreg}$ exhibiting anomalous dimension, leading to super-linear maximum path scaling $d_{\mathcal{N}, max}(L) \propto L^{\gamma}$ with $\gamma > 1$ (Theorem C.1(b)), necessarily violate the core PU framework requirements (GC: Global Coherence, RE: Resource Efficiency) for sufficiently large system size $L$, rendering them non-viable.

* **(i) Violation of Global Coherence (GC):** Coherent propagation of predictive information across a macroscopic scale $L$ requires transmission along network paths. Let $MP_{Global}(L)$ be a measure of predictive coherence maintained after signal transmission across scale $L$. This transmission occurs along network paths, with the maximum cost distance being $d_{\mathcal{N}, max}(L)$. Each ND-RID step in the path acts as a noisy channel, characterized by strict contractivity $f_{RID} < 1$ (Lemma E.1). The number of effective steps is $N_{steps} \approx d_{\mathcal{N}, max}(L) / \delta_{eff}$. Signal fidelity, measured for instance by the trace distance $D$ relative to an ideal transmission, decays exponentially with the number of steps: $D(N_{steps}) \le D_0 \cdot (f_{RID})^{N_{steps}}$ (assuming effectively independent errors per step, justified by rapid mixing due to contractivity). Using the scaling from Theorem C.1(b), $d_{\mathcal{N}, max}(L) \approx c_{max}' L^\gamma$. We define the coherence measure $MP_{Global}(L)$ based on this worst-case fidelity:
    $$
    MP_{Global}(L) \equiv D(N_{steps}) \le D_0 \cdot (f_{RID})^{\frac{c_{max}' L^\gamma}{\delta_{eff}}} = D_0 \exp\left(-\frac{c_{max}' |\ln f_{RID}|}{\delta_{eff}} L^\gamma\right)
    \tag{C.13}
    $$
    Since $\gamma > 1$ and $|\ln f_{RID}| > 0$ (because $f_{RID}<1$), the coherence decays faster than exponentially with $L$. For any minimum required level of global coherence $MP_{min} > 0$ necessary to solve the aggregate POP (Axiom 1), there exists a finite critical system size $L_{crit}^{(GC)}(\gamma)$ beyond which this requirement is violated ($MP_{Global}(L) < MP_{min}$). This critical size is given by solving $MP_{min} = D_0 \exp(- (\dots) (L_{crit}^{(GC)})^\gamma)$:
    $$
    L_{crit}^{(GC)}(\gamma) = \left( \frac{\delta_{eff} \ln(D_0 / MP_{min})}{c_{max}' |\ln f_{RID}|} \right)^{1/\gamma}
    \tag{C.14}
    $$
    The finiteness of $L_{crit}^{(GC)}$ for $\gamma > 1$ guarantees that anomalous dimension leads to a breakdown of global predictive coherence (violation of GC) in large enough systems. This decay in coherence translates to a reduction in the $V_{benefit}(x)$ term of the PCE Potential (Definition D.1), penalizing such configurations.
* **(ii) Violation of Resource Efficiency (RE):** The Principle of Compression Efficiency (PCE, Definition 15) requires minimizing resource costs, represented in the PCE Potential $V(x)$ (Definition D.1) which includes a propagation cost term $V_{prop}$. $V_{prop}$ accounts for the resources needed to maintain communication infrastructure and transmit information across the network. In a network of size $N$ (number of MPUs), the total available resource budget $V_{max}$ is expected to scale extensively, $V_{max} \propto N$. For a D-dimensional regular network, $N \propto L^D$. If the network has anomalous dimension such that the *average* path distance scales super-linearly, $\langle d_{\mathcal{N}}(L) \rangle \propto L^{\beta}$ with $\beta > 1$, the total integrated path length needed for global communication might scale as $N \times \langle d_{\mathcal{N}}(L) \rangle \propto L^D \cdot L^{\beta} = L^{D+\beta}$. Since $\beta > 1$, this total cost $V_{prop}$ scales super-extensively ($V_{prop} \propto L^{D+\beta}$ where $D+\beta > D$). Even if the average path length scales linearly ($\beta=1$), the super-linear scaling of maximum paths ($\gamma>1$) often implies higher average costs per link or higher costs for robust routing, leading to $V_{prop}$ growing faster than $L^D$. A super-extensive cost $V_{prop}$ will inevitably exceed an extensive budget $V_{max}$ for sufficiently large $L$; this represents an unsustainable increase in the $V_{prop}(x)$ component of the PCE Potential (Definition D.1). Thus, anomalous dimension leads to unsustainable propagation costs, violating resource efficiency (RE).

*Proof:*
* **(i)** The proof follows from the standard properties of signal decay under repeated application of a strictly contractive map ($f_{RID}<1$) over a path whose length $N_{steps}$ scales super-linearly with the system's Euclidean size $L$. The exponential decay combined with the super-linear exponent $L^\gamma$ guarantees that coherence falls below any fixed threshold $MP_{min}$ at a finite size $L_{crit}^{(GC)}$, derived explicitly in Equation (C.14).
* **(ii)** The proof compares the scaling of the necessary communication cost $V_{prop}$ with the scaling of the available resource budget $V_{max}$. Super-linear scaling of average or effective path lengths leads to $V_{prop}$ growing faster than $N \propto L^D$, while resources $V_{max}$ are expected to scale as $N$. The inequality $V_{prop} > V_{max}$ must eventually hold for large $L$ if $V_{prop}$ scales super-extensively, demonstrating a violation of resource efficiency demanded by PCE. QED

## C.5 Penalization of Unbounded Curvature Fluctuations

We now demonstrate that large variations in local geometry, quantified by curvature fluctuations (violating Definition C.2 if no positive lower bound $\kappa_R > 0$ exists or if variance is large), lead to violations of local viability (R1) and resource efficiency (R3).

**Theorem C.3 (Predictive Load Volatility from Curvature Fluctuations).** Regions $R_{fluct} \subset \mathcal{V}$ within an MPU network exhibiting large spatial fluctuations in effective synthetic Ricci curvature (high Var$(\kappa_{\mathcal{N}})$ or regions where $\kappa_{\mathcal{N}}$ is not bounded below by $\kappa_R > 0$) necessarily induce high spatial volatility in the local effective environmental complexity scale $\hat{C}_{target}(v)$ (Definition 21) that each MPU $v \in R_{fluct}$ must track to maintain its target Predictive Performance $PP(v) \approx PP_{op}$ within the viable range $(\alpha, \beta)$.

*Proof:* Discrete Ricci curvature quantifies the local divergence or convergence of information propagation pathways relative to a flat reference geometry. Positive curvature (like $\kappa_R > 0$) implies pathways converge locally, potentially simplifying the task of integrating information from neighbors and predicting local dynamics (lower *actual* complexity $\hat{C}_{actual}$). Negative or highly fluctuating curvature implies pathways diverge unpredictably, potentially making local prediction harder due to rapid information dispersion or unstable focusing (higher or more volatile $\hat{C}_{actual}$). Therefore, large spatial variations in curvature Var$(\kappa_{\mathcal{N}})$ or the absence of a uniform positive lower bound directly correlate with large spatial variations or volatility in the local predictive environment's complexity, Var$(\hat{C}_{actual}(v))$. The MPU's internal estimate $\hat{C}_{target}(v)$ is dynamically adjusted (Equation 38) to track this actual local complexity $\hat{C}_{actual}(v)$ in order to maintain optimal performance $PP_{op}$. Consequently, high Var$(\hat{C}_{actual}(v))$ necessitates high Var$(\hat{C}_{target}(v))$ for MPUs operating in the fluctuating region. QED

**Theorem C.4 (Operational Cost and Stability Penalty for Curvature Fluctuations).** MPU networks $\mathcal{N}_{unbounded}$ exhibiting large curvature fluctuations (or lacking a uniform positive lower bound), which induce high spatial variance Var$(\hat{C}_{target}(v))$ (Theorem C.3), incur significant penalties violating resource efficiency (RE) and/or local viability (LV):

* **(i) Excess Operational Cost (RE Violation):** High Var$(\hat{C}_{target}(v))$ forces the adapted MPU complexities $C_v = \langle \hat{C}_v \rangle$ to also exhibit high spatial variance Var$(C_v)$, as $C_v$ must track $\hat{C}_{target}(v)$ via the adaptation dynamics (Equation 30, driven by $\Psi$ which depends on $\hat{C}_{target}$). Let $f(C_v) = \langle \lambda \hat{R}(C_v) + \hat{R}_I(C_v) \rangle_{\rho^{(v)}}$ represent the local expected operational cost rate associated with complexity $C_v$. The physical cost function $R(C)$ is strictly convex ($\gamma_p>1$), while $R_I(C)$ is concave (Definition 3). For the total cost $f(C)$ to be convex ($f''(C) > 0$), we require $\lambda R''(C) > |R_I''(C)|$. This condition is satisfied if the **Dominance of Stabilizing Costs (DSC)** condition (introduced in the statement of Theorem 22, Section 6.5.2) holds, ensuring $f''(C) \ge f''_{min} > 0$. In addition, since $f$ is increasing, any locally forced increase in $C$ (needed to match local targets under curvature fluctuations) raises $V_{op}$ pointwise; combined with convexity this yields the quantitative variance penalty $\Delta V_{op}\ge \frac{N}{2}f''_{min}\,\text{Var}(C_v)$ (Equation C.15). This convexity reflects that fundamental costs increase super-linearly with complexity. The total operational cost across the network is $V_{op} = \sum_{v=1}^N f(C_v)$. By Jensen's inequality for convex functions, $\frac{1}{N}\sum f(C_v) \ge f(\frac{1}{N}\sum C_v)$, or $V_{op} \ge N f(\bar{C})$, where $\bar{C}$ is the average complexity. A second-order Taylor expansion around $\bar{C}$ clarifies the variance penalty: $f(C_v) \approx f(\bar{C}) + f'(\bar{C})(C_v-\bar{C}) + \frac{1}{2}f''(\bar{C})(C_v-\bar{C})^2$. Summing over $v$: $V_{op} \approx N f(\bar{C}) + 0 + \frac{1}{2}f''(\bar{C}) \sum (C_v-\bar{C})^2 = N f(\bar{C}) + \frac{N}{2}f''(\bar{C})\text{Var}(C_v)$. The excess cost compared to a uniform configuration where all $C_v = \bar{C}$ is:
$$
\Delta V_{op} = V_{op}[\{C_v\}] - V_{op}[\{\bar{C}\}] \approx \frac{N}{2}f''(\bar{C})\text{Var}(C_v) \ge \frac{N}{2}f''_{min}\text{Var}(C_v)
\tag{C.15}
$$
Since $f''_{min} > 0$, large Var$(C_v)$ (driven by large Var$(\kappa_{\mathcal{N}})$ or absence of uniform positive bound) leads to a significant excess operational cost $\Delta V_{op}$. This excess $\Delta V_{op}$ directly contributes to a higher $V_{op}(x)$ component in the PCE Potential (Definition D.1), representing an inefficient allocation of resources penalized by PCE, thus violating RE.
* **(ii) Reduced Local Stability (LV Violation):** High variance Var$(C_v)$ means a significant fraction of MPUs operate far from the average complexity $\bar{C}$. Furthermore, large and rapid fluctuations in the local target $\hat{C}_{target}(v)$ (due to curvature fluctuations) make it difficult for the adaptation dynamics ($dC/dt = \eta_{adapt} \Psi$, Equation 30) to precisely track the instantaneous local optimum $C^*(v)$. This leads to larger transient mismatches $|C_v(t) - C^*(v, t)|$. Such mismatches cause the actual performance $PP(C_v, \hat{C}_{target}(v))$ to deviate from the target $PP_{op}$, potentially falling below $\alpha$ or exceeding $\beta$. Let $p_{fail}(v)$ be the probability that MPU $v$ violates the viability bounds $(\alpha, \beta)$ over a characteristic adaptation timescale. This probability increases with the magnitude and frequency of the adaptation mismatch, which scales with Var$(C_v)$ (driven by Var$(\kappa_{\mathcal{N}})$). Assuming failures are approximately independent across distant MPUs in a large network, the probability that the entire network remains viable (all MPUs satisfy LV) is $P_{stability} = \prod_{v=1}^N (1 - p_{fail}(v))$. If the average failure probability scales with variance, $\langle p_{fail} \rangle \approx c_{fail} \text{Var}(C_v)$ for some constant $c_{fail}>0$, then for large N:
$$
P_{stability} \approx (1 - c_{fail} \text{Var}(C_v))^N \approx \exp(-N c_{fail} \text{Var}(C_v))
\tag{C.16}
$$
Stability decays exponentially with network size $N$ and the complexity variance Var$(C_v)$. High curvature fluctuations, by inducing high Var$(C_v)$, make widespread local viability failures highly probable in large networks, thus violating LV.

*Proof:*
* **(i)** The derivation relies on the convexity of the operational cost function $f(C)$ with respect to complexity $C$. Jensen's inequality or a Taylor expansion directly shows that variance in complexity leads to an increased average cost compared to the cost at the average complexity. The minimum second derivative $f''_{min}$ being positive ensures this penalty is non-zero.
* **(ii)** The argument connects large variance in the target complexity $\hat{C}_{target}$ to increased errors in the adaptive tracking of the optimal complexity $C^*$. These errors cause performance deviations. Assuming a relationship between variance and the probability of performance boundary violation $p_{fail}$, the exponential decay of overall stability $P_{stability}$ follows from standard reliability theory for systems composed of many components susceptible to failure. QED

## C.6 Synthesized Necessity Argument

We now combine the results to demonstrate formally that geometric regularity is necessary for viability.

**Definition C.4 (Viability Functional).** Let $\mathcal{C} = (\mathcal{N}, \{C_v\}, \rho_{agg})$ represent a complete configuration of the MPU network. We define the Viability Functional $\mathcal{V}[\mathcal{C}] \in [0, \infty)$ which quantifies the degree to which configuration $\mathcal{C}$ simultaneously satisfies the core requirements (LV), (GC), and (RE). A configuration is viable only if all requirements are met. We define $\mathcal{V}[\mathcal{C}]$ such that $\mathcal{V}[\mathcal{C}] \ge 1$ indicates viability, using normalized measures for each requirement:
 $$
    \mathcal{V}[\mathcal{C}] = \min\left\{ Q_{\mathrm{LV}}[\mathcal{C}], Q_{\mathrm{GC}}[\mathcal{C}], Q_{\mathrm{RE}}[\mathcal{C}] \right\}
    \tag{C.17}
    $$
where:
*   **$Q_{\mathrm{LV}}[\mathcal{C}]$ (Local Viability):** A measure reflecting the stability of local adaptation dynamics. $Q_{\mathrm{LV}}[\mathcal{C}] = P_{stability}[\mathcal{C}] / P_{min}$, where $P_{stability}$ is the probability the network remains viable (Equation C.16) and $P_{min}$ is the minimum required stability level. Requires $Q_{\mathrm{LV}} \ge 1$.
*   **$Q_{\mathrm{GC}}[\mathcal{C}]$ (Global Coherence):** A measure reflecting the maintenance of predictive coherence across the network. $Q_{\mathrm{GC}}[\mathcal{C}] = MP_{Global}[\mathcal{C}] / MP_{min}$, where $MP_{min}$ is the minimum required coherence level. Requires $Q_{\mathrm{GC}} \ge 1$.
*   **$Q_{\mathrm{RE}}[\mathcal{C}]$ (Resource Efficiency):** A measure reflecting cost efficiency. $Q_{\mathrm{RE}}[\mathcal{C}] = V_{max} / V_{total}[\mathcal{C}]$, where $V_{total}[\mathcal{C}]$ is the total effective cost rate (e.g., from PCE Potential $V(x)$ components related to operation and propagation) and $V_{max}$ is the maximum sustainable rate based on available resources. Requires $Q_{\mathrm{RE}} \ge 1$.

**Definition C.5 (Viable Configuration).** A configuration $\mathcal{C}$ is viable if and only if it satisfies all core requirements simultaneously, represented by the condition $\mathcal{V}[\mathcal{C}] \ge 1$.

**Theorem C.5 (Quantitative Non-Viability of Irregular Geometries).** If an MPU network configuration $\mathcal{C}$ exhibits significant geometric irregularity (violating Def C.1 or Def C.2 as refined in Def C.3), then its Viability Functional $\mathcal{V}[\mathcal{C}]$ falls below 1 for sufficiently large system size $L$ or sufficiently large curvature variance Var$(\kappa_{\mathcal{N}})$ (or absence of $\kappa_R > 0$). Such configurations are non-viable.

*Proof:*
1.  **Consequences of Irregularity:** Geometric irregularity means either anomalous dimension (violating Def C.1) or failure to maintain a positive lower bound on Ricci curvature and/or presence of large curvature fluctuations (violating Def C.2 as refined in Def C.3), or both.
2.  **Impact of Anomalous Dimension:** If Def C.1 is violated, then by Theorem C.2, for sufficiently large $L$, either global coherence $MP_{Global}$ falls below $MP_{min}$ (forcing $Q_{\mathrm{GC}}[\mathcal{C}] < 1$) or resource cost $V_{total}[\mathcal{C}]$ (due to $V_{prop}$) exceeds $V_{max}$ (forcing $Q_{\mathrm{RE}}[\mathcal{C}] < 1$).
3.  **Impact of Curvature Issues:** If Def C.2 (as refined by Def C.3, requiring $\kappa_R>0$ and bounded variance) is violated (e.g., large Var$(\kappa_{\mathcal{N}})$ or $\kappa_R \le 0$ in significant regions), then by Theorem C.4, for sufficiently large $N$ or Var$(\kappa_{\mathcal{N}})$, either the excess operational cost makes the total cost $V_{total}[\mathcal{C}]$ (due to $V_{op}$) exceed $V_{max}$ (forcing $Q_{\mathrm{RE}}[\mathcal{C}] < 1$) or the network stability $P_{stability}$ falls below $P_{min_stability}$ (forcing $Q_{\mathrm{LV}}[\mathcal{C}] < 1$).
4.  **Minimum Condition:** Since $\mathcal{V}[\mathcal{C}] = \min\{Q_{\mathrm{LV}}, Q_{\mathrm{GC}}, Q_{\mathrm{RE}}\}$ (Equation C.17), if any requirement measure falls below 1 due to irregularity, then $\mathcal{V}[\mathcal{C}]$ must be less than 1.
5.  **Conclusion:** Significant geometric irregularity inevitably leads to the violation of at least one core requirement ((LV), (GC), or (RE)) under sufficiently challenging conditions (large size or high variance/insufficient positive curvature), rendering the configuration non-viable according to Definition C.5 ($\mathcal{V}[\mathcal{C}] < 1$). QED

**Corollary C.1 (Asymptotic Non-Viability).** There exist finite thresholds for system size $L_{crit}$ and curvature variance $\kappa_{var,crit}$ (or degree of violation of $\kappa_R>0$) such that any configuration exhibiting geometric irregularity exceeding these thresholds is guaranteed to be non-viable ($\mathcal{V}[\mathcal{C}] < 1$).

*Proof:* Follows directly from the finite critical scales ($L_{crit}^{(GC)}$) derived or implied in the proofs of Theorems C.2 and C.4, which show that violations become inevitable beyond certain thresholds of irregularity. QED

**Theorem C.6 (Conditional coarse-grained doubling and $(1,2)$-Poincaré bounds)**

Let $(\mathcal{N},d_{\mathcal{N}},\mu)$ be the predictive network endowed with the cost-metric $d_{\mathcal{N}}$ and counting measure $\mu$ coarse-grained at resolution $\delta$ (App. E/Q). Assume:

1. **Uniform PCE saturation:** on every ball $B(x,r)$ with $r\ge 10\delta$, the per-edge capacity weights satisfy
   $$
   1-\varepsilon_C \le \frac{w_e}{C_{\max}^*}\le 1+\varepsilon_C,\qquad C_{\max}^*=2\ln 2,
   $$
   with $\varepsilon_C \le \frac{1-f_{\mathrm{RID}}}{1+f_{\mathrm{RID}}}$.
2. **Bounded geometry:** $\Delta_{\min}\le \deg(v)\le \Delta_{\max}$, minimal link length $\delta$, and bounded packing/link-density parameters as in App. E/Q.
3. **Coarse-grained packing and isoperimetry:** for $r\ge 10\delta$, balls admit the packing comparison and boundary-area lower bound used below, with distortion factors $\eta^\uparrow/\eta^\downarrow$, $\rho^\uparrow/\rho^\downarrow$, and $\chi$.

Then for all $r\ge 10\delta$ and all $x\in\mathcal N$:

- **Doubling**
  $$
  \mu(B(x,2r))\le D_\star\,\mu(B(x,r)),
  \qquad
  D_\star:=2^D(1+4\varepsilon_C)\frac{\Delta_{\max}}{\Delta_{\min}}\frac{\eta^\uparrow}{\eta^\downarrow}.
  $$

- **Local $(1,2)$-Poincaré inequality**
  there exist $\lambda=4$ and
  $$
  C_{\mathrm{PI}}(r):=\frac{\sqrt{2\Delta_{\max}}}{3\chi}\frac{1+\varepsilon_C}{1-\varepsilon_C}\frac{\rho^\uparrow(r)}{\rho^\downarrow(r)}
  $$
  such that for every locally Lipschitz $f$,
  $$
  \fint_{B(x,r)}|f-f_{B(x,r)}|\,d\mu
  \le
  C_{\mathrm{PI}}(r)\,r
  \left(\fint_{B(x,4r)} |\nabla f|^2\,d\mu\right)^{1/2}.
  $$

*Proof.* Under assumptions (1) and (2), the local edge weights and degrees are uniformly controlled. Assumption (3) supplies the coarse-grained ball-packing comparison, which yields the displayed doubling constant after inserting the weight and degree distortion factors. The same assumption supplies the boundary-area lower bound
$$
h(B)\ge \frac{3\chi}{\rho^\uparrow(r)}\frac{1-\varepsilon_C}{r(1+\varepsilon_C)}.
$$
Cheeger’s inequality then gives
$$
\lambda_1(B)\ge \frac{h(B)^2}{2\Delta_{\max}},
$$
and the standard variance-versus-Dirichlet-form estimate produces the stated local $(1,2)$-Poincaré inequality with $\lambda=4$ and the displayed constant $C_{\mathrm{PI}}(r)$. ∎

## C.7 Conclusion and status boundary

This appendix establishes a regularity-necessity theorem, not the whole continuum bridge. Sections C.1–C.6 show that large-scale geometric irregularity is penalized by the viability requirements (LV), (GC), and (RE), and Theorem C.6 packages these penalties as conditional coarse-grained doubling and local $(1,2)$-Poincaré bounds under its stated hypotheses. In this precise sense, Theorem 43 is the manuscript's formal regularity theorem.

What remains additional should stay explicit. The present Appendix C theorem stack does not by itself supply (i) the non-collapsed synthetic-Ricci regime invoked in Section 11.4 to obtain a.e. Euclidean tangent structure on the limit space, (ii) the AQFT convergence hypotheses of Theorem F.0—bounded-degree/short-range control, a uniform Lieb-Robinson bound, controlled coarse-graining, compatible embeddings, and lightcone identification—or (iii) the local-horizon KMS/Clausius bridge used in Section 12, which is formalized separately in Theorem 48a.

Read this way, regularity is not an arbitrary add-on: it is forced as a viability requirement, while the later continuum, AQFT, and gravity consequences are conditional on the additional bridge assumptions exactly where the manuscript states them.


