# Appendix C: Necessity of Geometric Regularity

## C.1 Introduction: The Requirement for Geometric Order

This appendix asks when highly irregular network shapes become too costly or unreliable to sustain prediction. It develops separate tests based on long communication paths, uneven local geometry, coherence, and finite resource budgets. Passing those tests supports an orderly large-scale geometry; a separate continuum construction supplies the further step to a smooth effective description.

**Technical ledger.**

This appendix formulates conditional exclusion gates supporting Theorem 43. The anomalous-distance gate applies to network families carrying uniform edge-cost comparability together with a registered global-coherence synchronization task or a non-amortized traffic ledger, per-step channel or clock data, and the corresponding extensive resource bound. The curvature-fluctuation gate applies after fixing the graph metric and response kernel and supplying curvature-load coupling, adaptation variance transfer, convex operational cost, and any distant-failure independence model used by the viability estimate. Under those premises, sufficiently severe irregularity violates at least one registered requirement:

*   **(LV) Local Viability:** Each MPU $v$ must maintain its registered predictive performance within the task-dependent Space of Becoming $(\alpha,\beta)$.
*   **(GC) Global Coherence:** The declared aggregate task must preserve the specified encoded distinction or synchronization record across its macroscopic window.
*   **(RE) Resource Efficiency:** The registered propagation and operation ledgers must remain within their declared sustainable budgets.

Section C.2 defines the geometric properties. Section C.3 constructs a representative Ollivier-curvature response only for its specified metric, kernel, smoothness, and homogeneity data. Sections C.4–C.5 derive the conditional GC, RE, and LV penalties, while Section C.6 collects them. The separate continuum package of Section 11 additionally requires noncollapse, curvature-transfer, Mosco, and rigidity certificates.

## C.2 Formal Definitions of Geometric Properties

We precisely define the geometric properties of the MPU network $\mathcal{N}=(\mathcal{V}, \mathcal{E}, \{w_{uv}\})$ relevant to our analysis, using the ND-RID propagation cost metric $d_{\mathcal{N}}$ (Definition 35), which measures the minimum cost path length between vertices $u, v \in \mathcal{V}$.

<a id="definition-c1-uniform-d-dimensional-polynomial-volume-growth"></a>**Definition C.1 (Uniform D-dimensional Polynomial Volume Growth).** A sequence of finite connected MPU networks $\{\mathcal{N}_n\}$ (indexed by size $n \to \infty$) exhibits uniform D-dimensional polynomial volume growth if there exist positive constants $K_1, K_2$, a dimension $D \ge 1$, an $n$-independent macroscopic scale $R_0$, and cutoffs $R_{max,n}$ such that $R_{max,n}\leq\operatorname{diam}(\mathcal N_n)$, $R_0<R_{max,n}$ eventually, and
$$
\frac{R_{max,n}-R_0}{\delta_{eff,n}}\longrightarrow\infty.
$$
For all sufficiently large $n$, all vertices $v \in \mathcal{V}_n$, and all radii $R$ satisfying $R_0<R\leq R_{max,n}$,
$$
K_1 \left(\frac{R}{\delta_{eff, n}}\right)^D \leq |B_{R}(v)| \leq K_2 \left(\frac{R}{\delta_{eff, n}}\right)^D.
\tag{C.1}
$$
Here $B_{R}(v) = \{u \in \mathcal{V}_n \mid d_{\mathcal{N}_n}(v, u) \leq R\}$ is the metric ball defined by the cost metric $d_{\mathcal{N}_n}$, $|B_{R}(v)|$ is its number of vertices, and $\delta_{eff, n}$ is the characteristic microscopic cost-distance scale (e.g., $\ell_0 \langle w_{uv} \rangle_{\mathrm{avg}}$) for network $\mathcal{N}_n$. Networks failing to satisfy this condition for a single integer $D$ on an expanding range of scales exhibit anomalous dimension.

<a id="definition-c2-uniformly-bounded-synthetic-ricci-curvature"></a>**Definition C.2 (Uniformly Bounded Synthetic Ricci Curvature).** An MPU network $\mathcal{N}$ has uniformly bounded synthetic Ricci curvature if there exists a constant $K \in \mathbb{R}$ such that a suitable measure of discrete Ricci curvature (e.g., Ollivier-Ricci curvature $\kappa_{\mathcal{N}}(x,y)$ for edges Ollivier 2009, or related spectral measures Lin and Yau 2010) satisfies $\kappa_{\mathcal{N}}(x,y) \ge -K$ uniformly across the network. As argued in Section C.3, PU principles favor a positive lower bound. Networks where the lower bound $K$ effectively diverges (i.e., curvature is not bounded below) or where the spatial variance $\operatorname{Var}(\kappa_{\mathcal{N}})$ is large over macroscopic regions exhibit large or unbounded curvature fluctuations.

<a id="definition-c3-geometric-regularity"></a>**Definition C.3 (Geometric Regularity).** An MPU network $\mathcal{N}$ exhibits geometric regularity if it satisfies both Definition C.1 (Uniform D-dim Polynomial Volume Growth for some integer D) and Definition C.2 (Uniformly Bounded Synthetic Ricci Curvature with a positive lower bound $\kappa_R > 0$ and bounded variance). Geometric irregularity refers to the violation of either or both of these conditions. For uses requiring linear path-length comparability to the macroscopic embedding, geometric regularity additionally includes the quasi-isometry condition stated in Theorem C.1(a).

## C.3 Microscopic Basis for a Positive Ricci Curvature Bound from PU Principles

This section studies Ollivier-Ricci curvature for the unweighted graph metric $d_G$. This metric choice is required for the unit-edge and support-diameter estimates below. It is distinct from the weighted propagation-cost metric $d_{\mathcal N}$ of Definition 35; comparison with curvature built from $d_{\mathcal N}$ requires a separate uniform bi-Lipschitz comparison of the two metrics.

Let $\mathcal P\delta_v(u)=P_{vu}$ be a representative one-step law supported on graph neighbors, and set
$$
P_{vu} = \frac{P^{(0)}_{vu} \exp(-\lambda_{R} I'(C_P(u)))}{Z_v},
\qquad
Z_v = \sum_{w \sim v} P^{(0)}_{vw}
\exp(-\lambda_R I'(C_P(w))).
\tag{C.2}
$$
Here $P^{(0)}_{v\bullet}$ is a probability distribution on the neighbors of $v$, $\lambda_R>0$, and $I$ is the effective local cost-rate function.

Let $W_1^G$ denote Wasserstein-1 distance with transport cost $d_G$. For an edge $v\sim u$, define
$$
\operatorname{Ric}_{OR}^G(v,u)
:=1-\frac{W_1^G(\mathcal P\delta_v,\mathcal P\delta_u)}{d_G(v,u)}
=1-W_1^G(\mathcal P\delta_v,\mathcal P\delta_u).
\tag{C.3}
$$
The union of the two one-step supports has $d_G$-diameter at most $3$. Therefore
$$
W_1^G(\mathcal P\delta_v,\mathcal P\delta_u)
\leq3\,\operatorname{TV}(P_{v\bullet},P_{u\bullet})
=\frac32\|P_{v\bullet}-P_{u\bullet}\|_1.
$$
All curvature and Wasserstein quantities in Sections C.3.1-C.3.3 refer to $d_G$ unless a weighted metric is explicitly declared.

### C.3.1 Properties of the Effective Cost-Rate Function $I(c)$
The effective cost-rate function $I(c)$, reflecting the local contribution to the global PCE Potential $V(x)$ (Appendix D, Definition D.1) due to complexity $c=C_P$, is shaped by the interplay of predictive performance benefits and resource costs. Based on the properties of $PP(c)$ (concave, main text Definition 19), $R(c)$ (convex, main text Definition 3), and $R_I(c)$ (concave, main text Definition 3b), it is assumed that for PCE-optimal configurations, $I(c)$ is both $m$-strongly convex (i.e., $I''(c) \ge m > 0$, ensuring it has a well-defined minimum and certain growth properties facilitating stable optimization) and $M$-smooth (i.e., $|I''(c)| \le M < \infty$) over the relevant range of complexities $c \in [C_{op}, C_{\max,\mathrm{phys}}]$ (where $C_{\max,\mathrm{phys}}$ is the maximum physically sustainable complexity). The $M$-smoothness implies its derivative $I'(c) = \partial_{C_P}I(c)$ is $M$-Lipschitz continuous:
$$
|I'(C_P(v))-I'(C_P(u))| \;\le\; M\,|C_P(v)-C_P(u)|.
\tag{C.4}
$$

### C.3.2 Bound on Spatial $C_P$ Variation Across Links
Assume the common bounded operating range stated in Section C.3.1:
$$
C_P(v)\in[C_{op},C_{\max,\mathrm{phys}}]
\qquad\text{for every }v.
$$
Then neighboring vertices $v,u$ satisfy
$$
|C_P(v)-C_P(u)|
\le C_{\max,\mathrm{phys}}-C_{op}
=:L_{C_P}<\infty.
\tag{C.5}
$$
This is the uniform diameter bound of the assumed operating interval. PCE, locality, and the finite temporal adaptation rate of Equation (30) do not by themselves establish a smaller edgewise spatial modulus or spatial correlation; any such strengthened estimate requires an additional registered gradient or comparison certificate.

### C.3.3 Bounding Total Variation and Deriving the Ricci Lower Bound
The difference between the probability distributions $P_{v\bullet}$ and $P_{u\bullet}$ is primarily driven by the difference in the exponential weighting terms $\exp(-\lambda_{R} I'(C_P(x)))$. Applying the Mean Value Inequality to these exponential factors:
$$
\Bigl|\exp(-\lambda_{R} I'(C_P(v)))-\exp(-\lambda_{R} I'(C_P(u)))\Bigr| \;\le\; \lambda_{R}\,e^{-\lambda_{R} I'_{\!*}}\, |I'(C_P(v))-I'(C_P(u))|,
\tag{C.6}
$$
where $I'_{\!*}$ is some value between $I'(C_P(v))$ and $I'(C_P(u))$.
Combining (C.4)–(C.6) yields a complete $L_1$ control with explicit normalization dependence (no $Z_v \approx Z_u$ assumption).

<a id="lemma-c33-rigorous-l_1-stability-for-the-complexity-weighted-kernel"></a>**Lemma C.3.3 (Rigorous $L_1$ stability for the complexity-weighted kernel).**
Let $P$ be given by (C.2) and write $\mu_v := P^{(0)}_{v\bullet}$, extended by zero to all of $\mathcal{V}$ (i.e., $\mu_v(x) := P^{(0)}_{vx}$ for $x \sim v$ and $\mu_v(x) := 0$ otherwise, so that $\mu_v$ is a probability measure on $\mathcal{V}$ supported on the neighbors of $v$). Assume:

1. (**Operating-range monotonicity**) $I'(c) \ge 0$ for $c \in [C_{op}, C_{\max,\mathrm{phys}}]$, and define
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
W_1(\mu_v, \mu_u) \le C_{\mathrm{geom}},
$$
for some constant $C_{\mathrm{geom}} = \mathcal{O}(1)$ depending only on bounded local graph geometry and the chosen baseline kernel $P^{(0)}$.

Then for adjacent $v \sim u$ one has the general estimate
$$
\|P_{v\bullet} - P_{u\bullet}\|_1
\le e^{\lambda_R B}\,\|\mu_v - \mu_u\|_1
+ C_{\mathrm{geom}}\,\lambda_R\,e^{\lambda_R B}\,M\,L_{C_P}.
$$
Assume in addition that the baseline rows, extended to the common vertex set as above, satisfy the uniform discrepancy bound
$$
\delta_\mu:=\sup_{v\sim u}\|\mu_v-\mu_u\|_1<\infty.
$$
Then the estimate takes the form
$$
\|P_{v\bullet} - P_{u\bullet}\|_{1}
\;\le\;e^{\lambda_R B}\left(\delta_\mu+C_{\mathrm{geom}}\lambda_R M L_{C_P}\right).
\tag{C.7}
$$
Translation invariance or local symmetry of $P^{(0)}$ does not imply $\delta_\mu=0$ after the rows are embedded as measures on $\mathcal V$; the zero-discrepancy specialization is available only when equality of the adjacent baseline measures is imposed explicitly.

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
so $\operatorname{Lip}(w)\le\lambda_RML_{C_P}$. Let $\pi$ be any coupling of $\mu_v$ and $\mu_u$. Its marginal identities give
$$
Z_v-Z_u
=\int\bigl(w(x)-w(y)\bigr)\,d\pi(x,y).
$$
Therefore
$$
|Z_v-Z_u|
\le\operatorname{Lip}(w)\int d(x,y)\,d\pi(x,y).
$$
Taking the infimum over all couplings, which is the definition of $W_1$, yields
$$
|Z_v-Z_u|
\le\operatorname{Lip}(w)W_1(\mu_v,\mu_u)
\le\lambda_RML_{C_P}C_{\mathrm{geom}}.
$$
Substituting this bound into the previous display proves the general estimate and, under the additional baseline-row discrepancy hypothesis, Equation (C.7). ∎

Define
$$
\eta_{R} \;:=\; \frac32 e^{\lambda_R B}
\left(\delta_\mu+C_{\mathrm{geom}}\lambda_R M L_{C_P}\right).
\tag{C.8}
$$
For the representative kernel (C.2), a sufficient regular-response condition is
$$
\eta_{R}<1.
$$
Indeed, the local-support estimate and Equation (C.7) give
$$
W_1\bigl(\mathcal P\delta_v,\mathcal P\delta_u\bigr)
\leq \frac32\|P_{v\bullet}-P_{u\bullet}\|_1
\leq\eta_R.
\tag{C.9}
$$
Substitution in Equation (C.3), with $d(v,u)=1$, gives
$$
\operatorname{Ric}_{\mathrm{OR}}(v\to u)\geq1-\eta_R.
$$
Thus, on the explicitly assumed branch $\eta_R<1$, the representative kernel has the positive lower bound
$$
\kappa_R:=1-\eta_R
=1-\frac32 e^{\lambda_R B}
\left(\delta_\mu+C_{\mathrm{geom}}\lambda_R M L_{C_P}\right)>0.
\tag{C.10}
$$
This establishes a strictly positive lower bound only for this Ollivier-Ricci model under the local hypotheses in Lemma C.3.3, the baseline-row discrepancy bound, and $\eta_R<1$. Transfer to a Bakry-Émery lower bound, a measured-Gromov-Hausdorff-stable curvature class, or the Section 11.4 continuum branch requires the additional weighted-shell/local-isotropy input of Remark C.3.3a or an equivalent replacement, radius-2 or curvature-matrix control, and the separate convergence hypotheses isolated in Theorem C.6a and Appendix F.

¹ Footnote: The parameter $\lambda_R$ is specific to this curvature model (Equation C.2) and represents the sensitivity of local transition probabilities to gradients in the effective cost-rate $I'$. It should not be confused with the resource scarcity Lagrange multiplier $\lambda$ from main text Definition 20.

<a id="remark-c33a-from-ollivier-ricci-to-a-continuum-scalar-curvature-estimator"></a>**Remark C.3.3a (From Ollivier-Ricci to a continuum scalar curvature estimator).**
This estimator is an additional continuum-bridge hypothesis. Let $(\mathcal N_h,d_h)$ be a sequence of MPU networks sampling a $C^3$ Riemannian manifold $(M,g)$, with adjacent rescaled edge lengths $h+O(h^2)$. Assume first-shell weights $\omega_{xy}\geq0$ satisfying
$$
\sum_{y\sim x}\omega_{xy}=1,
\qquad
\max_{y\sim x}\left|\omega_{xy}-\frac{1}{\deg(x)}\right|=o(1),
$$
and the locally uniform isotropy condition
$$
\sum_{y\sim x}\omega_{xy}\,
\hat v_{x\to y}\hat v_{x\to y}^{\mathsf T}
=\frac1D I+O(h).
$$
In addition, assume that the chosen lazy kernels, including their idleness and normalization, satisfy the kernel-specific directional expansion
$$
\kappa_h(x,y)
=\frac{h^2}{2(D+2)}\operatorname{Ric}_g(v,v)+r_h(x,y),
\qquad
\sup_{x\in K,\,y\sim x}|r_h(x,y)|\leq C_Kh^3
\tag{C.10a}
$$
for every compact $K\subset M$, where $v$ is the unit tangent in the $x\to y$ direction. Then
$$
R_h(x):=\frac{2D(D+2)}{h^2}
\sum_{y\sim x}\omega_{xy}\kappa_h(x,y)
=R_g(x)+O_K(h).
\tag{C.10b}
$$
If the continuum reference measure is locally finite and the discrete interpolation preserves the compact-uniform remainder bound, then $R_h\to R_g$ in $L^1_{\mathrm{loc}}$. Ollivier (2009) supplies expansions of this form for specified small-ball kernels; it does not make the coefficient universal for arbitrary lazy graph kernels. The transfer from one-shell data to a Bakry-Émery or RCD bound still requires independent radius-2 control.

*Justification of the neighbor-average step.* Under the weighted local-isotropy condition,
$$
\sum_{y \sim x} \omega_{xy}\,\hat{v}_{x \to y}\hat{v}_{x \to y}^{\mathsf{T}}
= \frac{1}{D} I + O(h),
$$
write $\mathrm{Ric}_g(x)$ in an orthonormal basis at $x$. Then
$\mathrm{Ric}_g(\hat{v}, \hat{v}) = \hat{v}^{\mathsf{T}} \mathrm{Ric}_g(x) \hat{v}$ and therefore
$$
\sum_{y \sim x} \omega_{xy}\, \mathrm{Ric}_g(\hat{v}_{x \to y}, \hat{v}_{x \to y})
= \mathrm{Tr}\!\left(\mathrm{Ric}_g(x) \cdot \sum_{y \sim x} \omega_{xy}\, \hat{v}_{x \to y} \hat{v}_{x \to y}^{\mathsf{T}}\right)
= \frac{1}{D}\,\mathrm{Tr}(\mathrm{Ric}_g(x)) + O(h)
= \frac{1}{D} R_g(x) + O(h).
$$
Averaging (C.10a) with the shell weights and substituting the previous display gives (C.10b).

<a id="proposition-c33b-positive-ollivier-curvature-does-not-transfer-to-a-bakry-émery-lower-bound"></a>**Proposition C.3.3b (Positive Ollivier Curvature Does Not Transfer to a Bakry–Émery Lower Bound).** Let $G_7$ be the graph on $\{0,1,\ldots,6\}$ obtained from the complete graph on $\{1,2,3,4\}$ by adding the vertex $0$, joined to $1,3,4,5,6$, and the edge $\{5,6\}$. In (C.2) take the uniform baseline $P^{(0)}_{vu}=1/\deg(v)$ for $u\sim v$ and a constant field $I'(C_P)$, so that $\mathcal P\delta_v$ is the uniform law on the neighbors of $v$. For $0\le\alpha<1$ put $\mathcal P_\alpha\delta_v:=\alpha\delta_v+(1-\alpha)\mathcal P\delta_v$, let $L_\alpha:=(1-\alpha)(\mathcal P-I)$ be the generator of this lazy kernel, and write
$$
\Gamma_\alpha(f,g):=\frac12\bigl(L_\alpha(fg)-fL_\alpha g-gL_\alpha f\bigr),
\qquad
\Gamma_{2,\alpha}(f):=\frac12L_\alpha\Gamma_\alpha(f,f)-\Gamma_\alpha(f,L_\alpha f).
$$
Then:

1. every edge $v\sim u$ satisfies
$$
\kappa_\alpha(v,u):=1-W_1^G(\mathcal P_\alpha\delta_v,\mathcal P_\alpha\delta_u)\ge\frac{1-\alpha}{10},
\tag{C.10c}
$$
with equality at $\alpha=0$ on the edges $\{0,5\}$ and $\{0,6\}$;

2. the function with values $(f(0),f(1),\ldots,f(6))=(0,-1,-2,-1,-1,1,1)$ satisfies
$$
\Gamma_\alpha(f,f)(0)=\frac{1-\alpha}2,
\qquad
\Gamma_{2,\alpha}(f)(0)=-\frac{(1-\alpha)^2}{200}.
\tag{C.10d}
$$

Hence, for every idleness $0\le\alpha<1$, the lazy kernel has Ollivier–Ricci curvature at least $(1-\alpha)/10$ on every edge, while the curvature-dimension inequality $\Gamma_{2,\alpha}(f)\ge N^{-1}(L_\alpha f)^2+K\Gamma_\alpha(f,f)$ fails at vertex $0$ for every $K\ge0$ and every $N\in(0,\infty]$, and the largest admissible $K$ there with $N=\infty$ is at most $-(1-\alpha)/100$. No implication from a uniform positive Ollivier–Ricci lower bound for the kernels (C.2)–(C.3) to a Bakry–Émery bound $\mathrm{BE}(K,N)$ with $K\ge0$ holds without further data; the radius-2 control required in Remark C.3.3a is an independent input.

*Proof.* The permutations of $\{1,3,4\}$ and the transposition of $5$ and $6$ are automorphisms of $G_7$, so for $\alpha=0$ it suffices to bound the transport cost on the edges $\{1,3\}$, $\{1,2\}$, $\{5,6\}$, $\{0,1\}$ and $\{0,5\}$. The following couplings keep all unmentioned common mass in place.

- $\{1,3\}$: from the uniform law on $\{0,2,3,4\}$ to the uniform law on $\{0,1,2,4\}$, move the mass $\frac14$ at $3$ to $1$; the cost is $\frac14$.
- $\{1,2\}$: from the uniform law on $\{0,2,3,4\}$ to the uniform law on $\{1,3,4\}$, keep $\frac14$ at $3$ and at $4$, move $\frac14$ from $2$ to $1$, and send $\frac1{12}$ from $0$ to each of $1,3,4$; every move has length one, so the cost is $\frac12$.
- $\{5,6\}$: from the uniform law on $\{0,6\}$ to the uniform law on $\{0,5\}$, move $\frac12$ from $6$ to $5$; the cost is $\frac12$.
- $\{0,1\}$: from the uniform law on $\{1,3,4,5,6\}$ to the uniform law on $\{0,2,3,4\}$, keep $\frac15$ at $3$ and at $4$, move $\frac15$ from $1$ to $2$ and from $5$ to $0$, and send $\frac1{20}$ from $6$ to each of $0,3,4,2$, at distances $1,2,2,3$; the cost is $\frac15+\frac15+\frac8{20}=\frac45$.
- $\{0,5\}$: from the uniform law on $\{1,3,4,5,6\}$ to the uniform law on $\{0,6\}$, keep $\frac15$ at $6$, move $\frac15$ from $5$ to $6$ and $\frac1{10}$ from $1$ to $6$ at distance $2$, and move the remaining $\frac1{10}$ at $1$ and $\frac15$ at each of $3,4$ to $0$; the cost is $\frac15+\frac2{10}+\frac1{10}+\frac25=\frac9{10}$.

Hence $\kappa_0\ge\frac34,\frac12,\frac12,\frac15,\frac1{10}$ on these five edge classes, so $\kappa_0\ge\frac1{10}$ on every edge. On $\{0,5\}$ the function with values $(1,0,1,0,0,1,2)$ at $0,\ldots,6$ changes by at most one along every edge, hence is $1$-Lipschitz for $d_G$, and its mean under $\mathcal P\delta_5$ minus its mean under $\mathcal P\delta_0$ equals $\frac32-\frac35=\frac9{10}$; Kantorovich duality gives $W_1^G=\frac9{10}$ there, and the automorphism exchanging $5$ and $6$ gives the same value on $\{0,6\}$. For $\alpha>0$, combining the coupling that sends the idle mass $\alpha\delta_v$ to $\alpha\delta_u$ with an optimal coupling of the non-lazy laws gives
$$
W_1^G(\mathcal P_\alpha\delta_v,\mathcal P_\alpha\delta_u)\le\alpha+(1-\alpha)\bigl(1-\kappa_0(v,u)\bigr),
$$
so $\kappa_\alpha\ge(1-\alpha)\kappa_0\ge(1-\alpha)/10$, which is (C.10c).

For item 2 write $L=\mathcal P-I$ and $\Gamma$, $\Gamma_2$ for the case $\alpha=0$. The degrees at $0,\ldots,6$ are $5,4,3,4,4,2,2$, the values of $Lf$ are $\bigl(-\frac15,0,1,0,0,-\frac12,-\frac12\bigr)$, and
$$
\Gamma(f,f)(v)=\frac1{2\deg v}\sum_{u\sim v}\bigl(f(u)-f(v)\bigr)^2
$$
equals $\frac12$ at $0$ and $\frac14$ at each of $1,3,4,5,6$. Therefore
$$
L\Gamma(f,f)(0)=\frac15\cdot5\Bigl(\frac14-\frac12\Bigr)=-\frac14,
\qquad
\Gamma(f,Lf)(0)=\frac1{10}\Bigl(3(-1)\Bigl(0+\frac15\Bigr)+2(1)\Bigl(-\frac12+\frac15\Bigr)\Bigr)=-\frac3{25},
$$
and $\Gamma_2(f)(0)=-\frac18+\frac3{25}=-\frac1{200}$. Since $\Gamma_\alpha=(1-\alpha)\Gamma$ and $\Gamma_{2,\alpha}=(1-\alpha)^2\Gamma_2$, (C.10d) follows. A negative value of $\Gamma_{2,\alpha}(f)(0)$ violates the curvature-dimension inequality for every $K\ge0$ and $N\in(0,\infty]$, and the ratio $\Gamma_{2,\alpha}(f)(0)/\Gamma_\alpha(f,f)(0)=-(1-\alpha)/100$ bounds the admissible $K$ at $N=\infty$. ∎

## C.4 Penalization of Anomalous Network Dimension

We derive conditional global-coherence (GC) and resource-efficiency (RE) penalties for network families with super-linear chemical-distance scaling under the hypotheses of Theorems C.1–C.2.

<a id="theorem-c1-cost-distance-scaling-under-quasi-isometry-and-uniform-edge-cost-comparability"></a>**Theorem C.1 (Cost-Distance Scaling under Quasi-Isometry and Uniform Edge-Cost Comparability).**
Let $\mathcal N=(\mathcal V,\mathcal E)$ be embedded in Euclidean space. Write $c_e>0$ for the cost length of edge $e$ in $d_{\mathcal N}$ and assume that constants $0<c_-\leq c_+<\infty$, independent of system size, satisfy
$$
c_-\leq c_e\leq c_+\qquad(e\in\mathcal E).
$$

* (a) For the network family, assume common constants $\lambda\geq1$ and $C\geq0$, independent of system size and of the vertex pair, such that the unweighted graph metric and the embedding satisfy
$$
\lambda^{-1}\|u-v\|_{\mathrm{Euc}}-C
\leq d_{\mathrm{graph}}(u,v)
\leq\lambda\|u-v\|_{\mathrm{Euc}}+C,
$$
then every pair with $\|u-v\|_{\mathrm{Euc}}=L$ satisfies
$$
c_-\bigl(\lambda^{-1}L-C\bigr)
\leq d_{\mathcal N}(u,v)
\leq c_+\bigl(\lambda L+C\bigr).
\tag{C.11}
$$
Consequently, whenever the set of pairs at scale $L$ is nonempty, both its average and its maximum cost distance are $\Theta(L)$ as $L\to\infty$. Uniform polynomial volume growth is an independent regularity property; it is not needed for this metric comparison.

* (b) If a graph family satisfies
$$
d_{\mathrm{graph},max}(L)=\Theta(L^{d_{\min}}),
\qquad d_{\min}>1,
$$
then
$$
d_{\mathcal N,max}(L)=\Theta(L^{d_{\min}}).
\tag{C.12}
$$
No corresponding conclusion about the average cost distance follows without an average chemical-distance estimate.

*Proof.* For every path $\pi$ containing $|\pi|$ edges,
$$
c_-|\pi|\leq\sum_{e\in\pi}c_e\leq c_+|\pi|.
$$
Taking the infimum over paths from $u$ to $v$ gives
$$
c_-d_{\mathrm{graph}}(u,v)
\leq d_{\mathcal N}(u,v)
\leq c_+d_{\mathrm{graph}}(u,v).
$$
Combining these inequalities with the quasi-isometry bounds proves (C.11). Averaging or maximizing preserves the two uniform bounds, so both quantities are $\Theta(L)$. Maximizing the same cost-versus-graph comparison over pairs at Euclidean scale $L$ gives
$$
c_-d_{\mathrm{graph},max}(L)
\leq d_{\mathcal N,max}(L)
\leq c_+d_{\mathrm{graph},max}(L),
$$
which proves (C.12). ∎

<a id="theorem-c2-quantitative-penalty-from-super-linear-chemical-distance"></a>**Theorem C.2 (Quantitative Penalty from Super-Linear Chemical Distance).** Let an MPU network family exhibit super-linear maximum path scaling
$$
d_{\mathcal N,\max}(L)\ge c_{\max}'L^\gamma,
\qquad
\gamma>1,
$$
as in Theorem C.1(b). Then:

1. Suppose every traversed edge has cost length at most $\delta_{\mathrm{eff}}$, every step has trace-distance contraction coefficient at most $f_{RID}\in[0,1)$, and the global-coherence task requires a specified pair of encoded states to retain distinguishability $MP_{\mathrm{Global}}\geq MP_{\min}$ along a worst-case path. For $0<MP_{\min}<D_0$, this requirement fails at a finite scale; the case $f_{RID}=0$ fails after one step.

2. Independently of strict contraction, suppose every completed step has registered duration at least $\tau_{\min}>0$. Then the worst-case latency satisfies
$$
\tau_{\max}(L)\geq\tau_{\min}c_{\max}'L^\gamma/\delta_{\mathrm{eff}}.
$$
Without the edge-cost and clock hypotheses, the chemical-distance estimate alone supplies no channel-count or physical-latency bound.

3. If the global-coherence branch requires synchronization or refresh in a window $\tau_{sync}(L)=O(L^q)$ for some $q<\gamma$, or if the resource-efficiency branch requires the effective-average communication cost to fit an extensive volume budget under the hypotheses in part (ii), then the corresponding GC or RE condition fails for sufficiently large $L$.

Thus anomalous chemical-distance families are excluded as PCE-selected large-scale substrates on the stated GC/RE branches; the theorem-level content is the explicit super-linear penalty, while the non-viability conclusion uses the named finite-window or extensive-budget branch condition.

* **(i) Violation of Global Coherence (GC):** On the refresh/minorization branch, let $\Phi_j$ be the channel at step $j$ and assume its trace-distance contraction coefficient is at most $f_{RID}\in[0,1)$. Choose two encoded input states $\rho_0,\rho_1$ whose distinction the global-coherence task must retain, set $D_0:=D(\rho_0,\rho_1)>0$, and define
$$
MP_{\mathrm{Global}}(L):=D(\Phi_{N_{\mathrm{steps}}}\circ\cdots\circ\Phi_1(\rho_0),
\Phi_{N_{\mathrm{steps}}}\circ\cdots\circ\Phi_1(\rho_1)).
$$
If every cost step has length at most $\delta_{\mathrm{eff}}$ and $d_{\mathcal N,max}(L)\geq c_{\max}'L^\gamma$, then
$$
N_{\mathrm{steps}}(L)\geq\frac{c_{\max}'L^\gamma}{\delta_{\mathrm{eff}}}.
$$
For $0<f_{RID}<1$, repeated application of the contraction inequality gives
$$
MP_{\mathrm{Global}}(L)
\leq D_0 f_{RID}^{N_{\mathrm{steps}}(L)}
\leq D_0\exp\left(-\frac{c_{\max}'|\ln f_{RID}|}{\delta_{\mathrm{eff}}}L^\gamma\right).
\tag{C.13}
$$
For a registered threshold $0<MP_{\min}<D_0$, the upper bound is below $MP_{\min}$ whenever
$$
L>
L_{crit}^{(GC)}(\gamma):=
\left(\frac{\delta_{\mathrm{eff}}\ln(D_0/MP_{\min})}
{c_{\max}'|\ln f_{RID}|}\right)^{1/\gamma}.
\tag{C.14}
$$
If $f_{RID}=0$, one channel use gives $MP_{\mathrm{Global}}=0$, so every path containing at least one step violates every positive coherence threshold. No independence assumption is needed: the bound follows from composition of the contraction inequalities.
* **(ii) Resource-Efficiency Gate (RE).** Assume on this branch that, during each unit time interval, at least
$$
M(L)\geq aL^D
$$
retained-information transmissions must be completed, each such transmission requires at least $bL^\beta$ edge traversals with $\beta>1$, and the propagation ledger charges at least $r_{\min}>0$ per traversal without broadcast, coding, shared-edge, or temporal amortization between the counted transmissions. Then additivity of the registered ledger gives
$$
V_{\mathrm{prop}}(L)
\geq r_{\min}M(L)bL^\beta
\geq abr_{\min}L^{D+\beta}.
$$
If the admissible resource budget is positive and extensive,
$$
V_{\max}(L)\leq CL^D,
$$
then
$$
\frac{V_{\mathrm{prop}}(L)}{V_{\max}(L)}
\geq\frac{abr_{\min}}C L^\beta
\longrightarrow\infty.
$$
Hence RE fails for sufficiently large $L$ on this additive, non-amortized traffic branch. A super-linear maximum cost distance alone does not imply this traffic lower bound; if routing avoids the long paths or amortizes shared transmissions, a separate GC or traffic certificate is required.

*Proof:*
* **(i)** Suppose first that $0<f_{RID}<1$. The contraction-coefficient inequality applied successively to the two encoded states gives
$$
MP_{\mathrm{Global}}(L)\leq D_0f_{RID}^{N_{\mathrm{steps}}(L)}.
$$
Because $N_{\mathrm{steps}}(L)\geq c_{\max}'L^\gamma/\delta_{\mathrm{eff}}$ and $x\mapsto f_{RID}^x$ is decreasing,
$$
MP_{\mathrm{Global}}(L)
\leq D_0\exp\!\left(
-\frac{c_{\max}'|\ln f_{RID}|}{\delta_{\mathrm{eff}}}L^\gamma
\right).
$$
For $0<MP_{\min}<D_0$, the right-hand side equals $MP_{\min}$ at the scale in (C.14) and is strictly smaller above that scale; hence $MP_{\mathrm{Global}}<MP_{\min}$ there. If $f_{RID}=0$, the first channel use makes the two outputs identical, so $MP_{\mathrm{Global}}=0<MP_{\min}$ for every positive threshold.

The latency statement is independent of contraction but conditional on item 2's registered clock. Every completed path update then requires at least $\tau_{\min}$ per step, and therefore
$$
\tau_{\max}(L)
\geq\tau_{\min}N_{\mathrm{steps}}(L)
\geq\tau_{\min}c_{\max}'L^\gamma/\delta_{\mathrm{eff}}.
$$
If $\tau_{sync}(L)\leq AL^q$ for some $A>0$ and $q<\gamma$, then
$$
\frac{\tau_{\max}(L)}{\tau_{sync}(L)}
\geq\frac{\tau_{\min}c_{\max}'}{A\delta_{\mathrm{eff}}}L^{\gamma-q}\longrightarrow\infty,
$$
so the registered synchronization window is exceeded for all sufficiently large $L$.

* **(ii)** The additive ledger hypotheses give
$$
V_{\mathrm{prop}}(L)
\geq r_{\min}M(L)bL^\beta
\geq abr_{\min}L^{D+\beta}.
$$
Together with $V_{\max}(L)\leq CL^D$, this yields
$$
\frac{V_{\mathrm{prop}}(L)}{V_{\max}(L)}
\geq\frac{abr_{\min}}C L^\beta\longrightarrow\infty.
$$
Thus RE fails for all sufficiently large $L$ on the registered non-amortized traffic branch. The conclusion does not follow from worst-case distance alone. ∎

## C.5 Penalization of Unbounded Curvature Fluctuations

This section derives two conditional penalties from curvature fluctuations. The resource-efficiency estimate requires the curvature-load and external-innovation certificates together with uniform strong convexity of the operational cost. The local-viability estimate requires mutually independent failure events and an external tracking bound relating their mean probability to complexity variance.

<a id="theorem-c3-scope-of-the-curvature-load-coupling-branch"></a>**Theorem C.3 (Scope of the Curvature–Load Coupling Branch).** Let $\hat C_{\mathrm{actual}}:\mathcal V\to[0,\infty)$ be a registered external-load field. Equations (C.1)–(C.14) and Equation (38) do not by themselves imply a lower bound on $\operatorname{Var}(\hat C_{\mathrm{actual}})$ from curvature variance or from the absence of a positive curvature lower bound. Such an inference requires an independently registered quantitative curvature-to-load transfer certificate. An inference for $\operatorname{Var}(\hat C_{\mathrm{target}})$ additionally requires an external innovation or tracking certificate relating $\hat C_{\mathrm{target}}$ to $\hat C_{\mathrm{actual}}$ within a stated error.

*Proof.* Equations (C.1)–(C.14) define the graph metric, transition kernels, synthetic curvature, and their dependence on $C_P$ and $I'$. None contains $\hat C_{\mathrm{actual}}$. Fix any graph, kernel, and $C_P$ data satisfying those equations and assign the constant external-load field $\hat C_{\mathrm{actual}}(v)=c$. This assignment leaves every preceding equation and every curvature value unchanged while giving
$$
\operatorname{Var}(\hat C_{\mathrm{actual}})=0.
$$
Hence curvature variance alone cannot imply positive external-load variance. Equation (38) supplies an internal target-update law but no quantitative comparison between $\hat C_{\mathrm{target}}$ and $\hat C_{\mathrm{actual}}$, so the corresponding target-variance inference also requires an independent tracking certificate. ∎

<a id="theorem-c3a-finite-linear-curvature-load-controller-classification"></a>**Theorem C.3a (Finite Linear Curvature--Load--Controller Classification).** Freeze a finite intervention class
$$
\ell_t=T\kappa_t,
\qquad
z_{t+1}=Az_t+B\ell_t+Gu_t,
\qquad
y_t=Cz_t,
\tag{C.14a}
$$
where the curvature features $\kappa_t\in\mathbb R^p$ and interventions $u_t$ are registered inputs, $\ell_t\in\mathbb R^m$ is the external-load vector, and all matrices except the transfer $T$ are fixed. Then:

1. From directly registered pairs $(\kappa_j,\ell_j)$, $T$ is uniquely identifiable exactly when the intervention design matrix $K=[\kappa_1\ \cdots\ \kappa_N]$ has rank $p$. When it has full row rank,
   $$
   T=LK^{\mathsf T}(KK^{\mathsf T})^{-1},
   \qquad
   L=[\ell_1\ \cdots\ \ell_N].
   \tag{C.14b}
   $$
2. Assume the forced sequence $B\ell_t+Gu_t$ over the observation window is known, for example because $\ell_t$ is directly registered or $T$ has been identified from the data in part 1. After subtracting its contributions to the outputs, the controller state is observable from $y_0,\ldots,y_{n-1}$ exactly when
   $$
   \operatorname{rank}
   \begin{bmatrix}
   C\\CA\\\vdots\\CA^{n-1}
   \end{bmatrix}
   =n,
   \qquad n=\dim z.
   \tag{C.14c}
   $$
3. For the feedback $u_t=K_c(r-y_t)$ and constant $(\kappa,r)$, put $A_c=A-GK_cC$. If $\rho(A_c)<1$, every initial state converges to the unique equilibrium
   $$
   z_*=(I-A_c)^{-1}(BT\kappa+GK_cr).
   \tag{C.14d}
   $$
   Exact tracking $y_*=r$ for every constant $(\kappa,r)$ in the declared full input spaces holds if and only if
   $$
   C(I-A_c)^{-1}BT=0,
   \qquad
   C(I-A_c)^{-1}GK_c=I.
   \tag{C.14e}
   $$

*Proof.* The data equation is $L=TK$. If $K$ has full row rank, right multiplication by $K^{\mathsf T}(KK^{\mathsf T})^{-1}$ gives (C.14b). If $K$ is rank deficient, choose nonzero $v\in\ker K^{\mathsf T}$ and any nonzero $a\in\mathbb R^m$; then $T$ and $T+av^{\mathsf T}$ give the same $L$, proving necessity. Iterating the state equation and subtracting the known forced terms gives the standard linear map from $z_0$ to the output stack with matrix (C.14c); injectivity is equivalent to full column rank. Under feedback, the recurrence is $z_{t+1}=A_cz_t+BT\kappa+GK_cr$. The spectral-radius condition makes $A_c^t\to0$ and sums the geometric series, proving (C.14d). Multiplication by $C$ shows that $y_*=r$ for every independent $\kappa,r$ exactly when the two coefficient identities (C.14e) hold. ∎

<a id="theorem-c3b-finite-graph-switch-curvature-load-and-tracking-realization"></a>**Theorem C.3b (Finite Graph-Switch Curvature, Load and Tracking Realization).** Let the registered finite operational graph carrier have vertices $\{0,1,2\}$, edges $01,12$, and the optional edge $02$ controlled by a registered graph-switch input $b_t\in\{0,1\}$. At each update use the current unweighted graph metric $d_G$, the neighbor-uniform baseline row, and constant $I'(C_P)$ in (C.2). On the common edge $01$ register the curvature feature
$$
\kappa_t=2\operatorname{Ric}_{OR}^G(0,1)=b_t.
\tag{C.14f}
$$
An independently registered finite task transducer reads the two current kernel rows, computes their exact $W_1^G$, and issues one unit work request exactly when $\kappa_t=1$. Its separate request counter is the external actual-load record $\ell_t=\kappa_t$. The reference $r_t\in\{0,1\}$ is set independently of the graph switch. This transducer supplies the curvature-to-load task source on this branch.

Take a signed-integer controller register $z_t=(x_t,w_t)\in\{-1,0,1,2\}\times\{0,1\}$, retained output $y_t=x_t$, and feedback intervention $u_t=r_t-y_t$. The exact finite arithmetic transition is
$$
z_{t+1}=
\begin{pmatrix}1&1\\0&0\end{pmatrix}z_t+
\begin{pmatrix}-1\\1\end{pmatrix}\ell_t+
\begin{pmatrix}1\\0\end{pmatrix}u_t,\quad
y_t=\begin{pmatrix}1&0\end{pmatrix}z_t,\quad
K_c=T=1.
\tag{C.14g}
$$
The graph switch, exact kernel rows, task requests, reference, intervention, state and output are retained response records. The register transition stays in the displayed finite state set for every switch/reference sequence under this feedback. The graph-to-feature, feature-to-task and task-to-controller maps are response faithful: different graph switches give different recorded curvature and load, and any two distinct controller states are separated by the present and next outputs under a common registered input.

This instance has a full-rank transfer design, an observable controller, a stable closed loop and exact tracking of every constant $(\kappa,r)\in\{0,1\}^2$ after two updates. The displayed real matrices satisfy both identities of (C.14b)--(C.14e), while the realized finite transition is restricted to binary graph/reference inputs under the prescribed feedback. The signed output represents the registered controller response. Relating it to nonnegative target complexity or adaptation law (38) requires an output map; extension to arbitrary open-loop inputs or a continuum requires a corresponding carrier. Theorem C.4 separately supplies its variance conclusion under its innovation and cost premises.

*Proof.* With $b=0$ the graph is the path $0-1-2$. Its neighbor rows at $0,1$ are $\delta_1$ and $(\delta_0+\delta_2)/2$, so $W_1^G=1$ and $\operatorname{Ric}_{OR}^G(0,1)=0$. With $b=1$ the graph is a triangle. The rows are $(\delta_1+\delta_2)/2$ and $(\delta_0+\delta_2)/2$; the common half-mass at $2$ stays put and the other half crosses edge $01$, so $W_1^G=1/2$ and the curvature is $1/2$. Constant $I'(C_P)$ cancels from the normalization in (C.2), establishing (C.14f). The separately implemented task transducer counts exactly $b$ requests and makes $\ell=\kappa$ without identifying external load with curvature by definition.

For the independent design inputs $b=0,1$, the feature matrix $K=[0\ 1]$ has rank one and the measured load matrix is $L=[0\ 1]$, so (C.14b) returns $T=1$. In (C.14g), $C=[1\ 0]$ and $CA=[1\ 1]$, hence the observability matrix has determinant one. The closed-loop matrix is
$$
A_c=A-GK_cC=
\begin{pmatrix}0&1\\0&0\end{pmatrix},
\qquad A_c^2=0.
$$
Since $(I-A_c)^{-1}=I+A_c$, direct multiplication gives
$C(I-A_c)^{-1}BT=0$ and $C(I-A_c)^{-1}GK_c=1$. Under the declared feedback the finite transition reduces to
$$
x_{t+1}=w_t-\kappa_t+r_t,\qquad w_{t+1}=\kappa_t.
\tag{C.14h}
$$
It stays in the stated state set. If $\kappa_t=\kappa$ and $r_t=r$ from time $t$ onward, then $w_{t+1}=\kappa$ and $x_{t+2}=r$, proving exact tracking from every allowed initial state. Present output gives $x_t$; after subtracting the known forcing from the next output, $CAz_t=x_t+w_t$ gives $w_t$, proving response separation. Every operation is a finite graph switch, finite rational transport computation, unit request count or exact finite-register arithmetic, and the retained records commute with the displayed linear model. ∎

<a id="theorem-c4-operational-cost-and-stability-penalty-for-curvature-fluctuations"></a>**Theorem C.4 (Operational Cost and Stability Penalty for Curvature Fluctuations).** On the curvature-load branch together with the external innovation certificate required by Theorem C.3, MPU networks $\mathcal N_{\mathrm{unbounded}}$ whose curvature fluctuations induce high certified spatial variance $\operatorname{Var}(\hat C_{\mathrm{target}}(v))$ incur the following conditional resource-efficiency (RE) and local-viability (LV) penalties:

* **(i) Excess Operational Cost (conditional RE penalty):** Assume that a registered adaptation/tracking estimate supplies a quantitative lower bound $\operatorname{Var}(C_v)\geq s_C^2$ for the configuration under study. The curvature-load coupling and Equation (30) alone do not supply this variance-transfer bound. On a common operating interval $J$ containing every $C_v$, assume a single scalar function $f\in C^2(J)$ represents the expected local operational costs at all vertices:
$$
f(C_v)=\langle\lambda\hat R(C_v)+\hat R_I(C_v)\rangle_{\rho^{(v)}},
\qquad
V_{op}=\sum_{v=1}^N f(C_v).
$$
This common cost-law representation is a separate certificate. The identification $C_v=\langle\hat C_v\rangle_{\rho^{(v)}}$ alone does not identify an operator-cost expectation with a function of that mean, as explained after Theorem 3. Assume $f$ is nondecreasing on $J$ and
$$
f''(C)\geq f''_{\min}>0\qquad(C\in J).
$$
Monotonicity gives the pointwise cost comparison, while the uniform second-derivative bound supplies the variance penalty. On the additional exact scalar branch $f(C)=\lambda R(C)+R_I(C)$, with common temperature and parameters, the condition $f''(C)>0$ is equivalent to $\lambda R''(C)>-R_I''(C)$ when $R_I''(C)\leq0$; a uniform positive lower bound must still be supplied. The DSC discussion in the note on Corollary 3 concerns the net benefit, and Theorem 22 in Section 6.5.2 assumes concavity of that net benefit; neither supplies this cost-law certificate or strong convexity of $f$ alone. Put $\bar C=N^{-1}\sum_v C_v$. Jensen's inequality gives $V_{op}\geq Nf(\bar C)$. The quantity $Nf(\bar C)$ is the equal-mean cost benchmark; its use does not assert that a uniform physical configuration is realizable. Taylor's theorem with integral remainder gives, for $x=C_v-\bar C$,
$$
f(\bar C+x)
=f(\bar C)+f'(\bar C)x
+x^2\int_0^1(1-t)f''(\bar C+tx)\,dt
\geq f(\bar C)+f'(\bar C)x+\frac{f''_{\min}}2x^2.
$$
Summing over $v$ and using $\sum_v(C_v-\bar C)=0$ yields the exact variance penalty
$$
\Delta V_{op}
:=V_{op}[\{C_v\}]-V_{op}[\{\bar C\}]
\geq\frac{f''_{\min}}2\sum_{v=1}^N(C_v-\bar C)^2
=\frac N2f''_{\min}\operatorname{Var}(C_v).
\tag{C.15}
$$
Since $f''_{\min}>0$, a certified lower bound on $\operatorname{Var}(C_v)$ gives a positive excess operational cost $\Delta V_{op}$. This excess directly contributes to the $V_{op}(x)$ component of the PCE Potential (Definition D.1), representing a resource penalty relative to the uniform configuration at the same mean. It constitutes an RE violation only when the resulting lower bound on $V_{\mathrm{total}}$ exceeds $V_{\max}$, as required in Theorem C.5(3); Equation (C.15) alone does not establish that inequality.
* **(ii) Reduced Local Stability (conditional LV penalty):** Let $F_v$ be the event that MPU $v$ violates the viability bounds $(\alpha,\beta)$ during the registered adaptation interval, and write $p_v:=\mathbb P(F_v)$. Assume on this branch that the events $F_1,\ldots,F_N$ are mutually independent and that an external tracking estimate supplies the quantitative bound
$$
\bar p:=\frac1N\sum_{v=1}^Np_v
\geq c_{\mathrm{fail}}\operatorname{Var}(C_v),
\qquad c_{\mathrm{fail}}>0.
$$
Then the probability that no MPU fails is
$$
P_{stability}=\prod_{v=1}^N(1-p_v).
$$
The arithmetic-geometric mean inequality and $1-x\leq e^{-x}$ give
$$
P_{stability}
\leq(1-\bar p)^N
\leq e^{-N\bar p}
\leq\exp\!\left[-Nc_{\mathrm{fail}}\operatorname{Var}(C_v)\right].
\tag{C.16}
$$
Thus, on this explicitly registered branch, $P_{stability}<P_{\min}$ whenever $Nc_{\mathrm{fail}}\operatorname{Var}(C_v)>\ln(1/P_{\min})$. No such bound follows from curvature variance alone without the tracking estimate and dependence hypothesis.

*Proof.* For item (i), the registered tracking estimate gives
$$
\operatorname{Var}(C_v)\ge s_C^2.
$$
The strong-convexity hypotheses and Taylor's theorem with integral remainder give Equation (C.15), hence
$$
\Delta V_{op}
\ge \frac N2f''_{\min}\operatorname{Var}(C_v)
\ge \frac N2f''_{\min}s_C^2.
$$
This is the asserted conditional resource penalty.

For item (ii), mutual independence of the registered failure events gives
$$
P_{stability}=\prod_{v=1}^N(1-p_v).
$$
The arithmetic-geometric mean inequality applied to the nonnegative numbers $1-p_v$ gives
$$
\prod_{v=1}^N(1-p_v)
\le\left(1-\frac1N\sum_{v=1}^Np_v\right)^N.
$$
Using $1-x\le e^{-x}$ for $x\in[0,1]$ and the registered estimate $N^{-1}\sum_vp_v\ge c_{\mathrm{fail}}\operatorname{Var}(C_v)$ yields
$$
P_{stability}
\le \exp\!\left[-Nc_{\mathrm{fail}}\operatorname{Var}(C_v)\right],
$$
which is Equation (C.16). Thus both penalties follow exactly on the declared tracking, strong-convexity, and independent-failure branch. ∎

## C.6 Synthesized Necessity Argument

We combine the registered penalty estimates into the quantitative non-viability criterion of Theorem C.5.

<a id="definition-c4-viability-functional"></a>**Definition C.4 (Viability Functional).** Let $\mathcal C=(\mathcal N,\{C_v\},\rho_{\mathrm{agg}})$ be a complete network configuration with the following registered requirement data. The stability threshold satisfies $0<P_{\min}\leq1$, and $P_{stability}\in[0,1]$ is the probability in Equation (C.16). The resource budget satisfies $0<V_{\max}<\infty$, and $V_{\mathrm{total}}\in[0,\infty)$ is the nonnegative operational and propagation cost ledger, including every charged contribution. In particular, $V_{\mathrm{total}}\geq V_{\mathrm{prop}}$ on the routing branch; a signed net-benefit potential is not used as this denominator.

The global-coherence task declares an encoded-distinction requirement, a synchronization requirement, or both. For a distinction requirement, take finite $MP_{\mathrm{Global}}\geq0$ and $MP_{\min}>0$ and put $Q_{dist}=MP_{\mathrm{Global}}/MP_{\min}$. For a synchronization requirement, take a finite deadline $\tau_{sync}>0$ and finite task latency $\tau_{\max}\geq0$ and put $Q_{sync}=\tau_{sync}/\tau_{\max}$ when $\tau_{\max}>0$, with $Q_{sync}=+\infty$ when $\tau_{\max}=0$. Define $Q_{\mathrm{GC}}$ as the minimum of the ratios for the declared global-coherence requirements. Set
$$
Q_{\mathrm{LV}}=\frac{P_{stability}}{P_{\min}},
\qquad
Q_{\mathrm{RE}}=
\begin{cases}
V_{\max}/V_{\mathrm{total}},&V_{\mathrm{total}}>0,\\
+\infty,&V_{\mathrm{total}}=0,
\end{cases}
$$
and
$$
\mathcal V[\mathcal C]
=\min\{Q_{\mathrm{LV}},Q_{\mathrm{GC}},Q_{\mathrm{RE}}\}.
\tag{C.17}
$$
The minimum is finite and nonnegative because $Q_{\mathrm{LV}}\leq1/P_{\min}<\infty$.

<a id="definition-c5-viable-configuration"></a>**Definition C.5 (Viable Configuration).** A configuration is viable for the registered requirements if and only if $\mathcal V[\mathcal C]\geq1$. Equivalently, its stability probability meets the threshold, every declared distinction or synchronization requirement is met, and its nonnegative cost ledger does not exceed the budget.

<a id="theorem-c5-quantitative-non-viability-on-the-registered-penalty-branches"></a>**Theorem C.5 (Quantitative Non-Viability on the Registered Penalty Branches).** Let $\mathcal C$ satisfy the domain and ledger premises of Definition C.4. It is non-viable, $\mathcal V[\mathcal C]<1$, if at least one of the following certified conditions holds:

1. The super-linear chemical-distance hypotheses of Theorem C.2 give either $MP_{\mathrm{Global}}<MP_{\min}$ for a declared distinction requirement or $\tau_{\max}>\tau_{sync}$ for a declared synchronization requirement.
2. The effective-average routing and extensive-budget hypotheses of Theorem C.2(ii) give $V_{\mathrm{prop}}>V_{\max}$.
3. The common scalar cost-law and strong-convexity premises of Theorem C.4(i) hold, $s_C^2:=\operatorname{Var}(C_v)$ is certified, and the registered cost decomposition gives
$$
V_{\mathrm{total}}\geq V_{\mathrm{base}}+\frac N2f''_{\min}s_C^2>V_{\max},
$$
where $V_{\mathrm{base}}$ includes the equal-mean operational benchmark and all other non-variance contributions. A deduction of this variance bound from curvature additionally requires the curvature-load and adaptation/tracking certificates of Theorem C.4; DSC alone does not supply it.
4. On the independent-failure branch, the certified mean failure probability $\bar p$ satisfies
$$
P_{stability}\leq e^{-N\bar p}<P_{\min}.
$$

Failure of Definition C.1 or C.2 without one of these quantitative branch certificates does not by itself imply non-viability.

*Proof.* In case 1, the applicable ratio $Q_{dist}$ or $Q_{sync}$ is strictly below $1$, so $Q_{\mathrm{GC}}<1$. In case 2, $V_{\mathrm{total}}\geq V_{\mathrm{prop}}>V_{\max}>0$ gives $Q_{\mathrm{RE}}<1$. In case 3 the displayed lower bound gives the same conclusion. In case 4, $Q_{\mathrm{LV}}=P_{stability}/P_{\min}<1$. In every case at least one entry of the minimum defining $\mathcal V$ is strictly below $1$, proving non-viability. ∎

<a id="corollary-c1-branch-conditional-asymptotic-non-viability"></a>**Corollary C.1 (Branch-Conditional Asymptotic Non-Viability).** On any branch satisfying one of the quantitative hypotheses of Theorem C.5, the corresponding strict inequality defines a finite non-viability threshold whenever its penalty is monotone and unbounded in the declared scale parameter. No universal threshold follows from geometric irregularity alone.

*Proof.* On the contractive chemical-distance branch, Equation (C.14) gives the finite threshold when $0<f_{RID}<1$, and $f_{RID}=0$ gives failure after one step. On the latency branch, $L^{\gamma-q}\to\infty$ for $q<\gamma$. On the extensive-budget branch, $V_{\mathrm{prop}}/V_{\max}\to\infty$. On the convex-cost branch, the threshold is the first $N$ or certified variance for which
$$
V_{\mathrm{base}}+\frac N2f''_{\min}\operatorname{Var}(C_v)>V_{\max}.
$$
On the independent-failure branch, Equation (C.16) gives the threshold
$$
N\bar p>\ln(1/P_{\min}).
$$
Each threshold invokes Theorem C.5; outside these branches no threshold has been proved. ∎

<a id="proposition-c5a-sparse-irregularity-is-amortized-by-density-normalized-ledgers"></a>**Proposition C.5a (Sparse Irregularity Is Amortized by Density-Normalized Ledgers).** Let $G_n=C_n$ be the $n$-cycle and let $G_n^+$ be obtained by attaching one pendant vertex to a fixed cycle vertex. Fix a radius $R$ and let $p_R(v,G)$ be any nonnegative local irregularity penalty depending only on the rooted radius-$R$ ball, bounded by $P_R<\infty$. If the two penalties agree whenever the rooted balls are isomorphic, then
$$
\left|
\frac1{|V(G_n^+)|}\sum_{v\in V(G_n^+)}p_R(v,G_n^+)
-
\frac1{|V(G_n)|}\sum_{v\in V(G_n)}p_R(v,G_n)
\right|
=O_R(n^{-1}).
\tag{C.16a.1}
$$

For uniform all-pairs traffic, route by shortest paths and charge one unit per traversed edge. The pendant modification changes the total ordered-pair route cost by $O(n^2)$ while the cycle total is $\Theta(n^3)$; hence its relative propagation surcharge is $O(n^{-1})$. It affects only $O(n)$ of the $\Theta(n^2)$ ordered pairs by an additional single edge. The same $O(n^{-1})$ conclusion holds for any bounded per-vertex LV loss averaged over vertices and supported in a fixed-radius neighborhood of the defect.

*Proof.* Only the pendant vertex and the at most $2R+1$ cycle vertices within distance $R$ of the attachment can have changed rooted radius-$R$ balls. Their total contribution is bounded by $(2R+2)P_R$, and the difference between the normalizing factors $n^{-1}$ and $(n+1)^{-1}$ is $O(n^{-2})$ times an $O(n)$ sum, proving (C.16a.1).

Distances between two original cycle vertices are unchanged. Each ordered pair involving the new vertex has distance one plus the distance from the attachment vertex, so the extra total over those $2n$ ordered pairs is $O(n^2)$. The cycle's ordered-pair distance sum is $\Theta(n^3)$, because a positive fraction of its $n^2$ ordered pairs have distance $\Theta(n)$. The relative surcharge is therefore $O(n^{-1})$. The LV statement is the same bounded-support count as the first claim. ∎

Thus no size-independent strict GC/RE/LV exclusion gap follows from density-normalized or uniformly amortized penalties alone. The non-amortized worst-case traffic, synchronization, contraction, or independent-failure hypotheses in Theorem C.5 are genuine and cannot be dropped.

<a id="theorem-c5b-exact-worst-case-viability-classification-and-discrimination-windows"></a>**Theorem C.5b (Exact Worst-Case Viability Classification and Discrimination Windows).** Let a network family be indexed by an unbounded set of scales $L$. At each scale let $N(L)\in\mathbb Z_{\ge0}$ be the hop count of the registered worst-case route, $M(L)\ge0$ the number of transmissions charged per unit time, $\bar N(L)$ the hop count of each charged transmission, and $p_v(L)\in[0,1)$ the failure probabilities of the vertices. Consider the following exact ledger classes.

1. **Exact-contraction distinction.** Every step of the worst-case route applies a channel $\Phi_j$ with $D(\Phi_j\rho,\Phi_j\sigma)=f\,D(\rho,\sigma)$ for all states $\rho,\sigma$, for one $f\in(0,1)$. For encoded states $\rho_0,\rho_1$ with $D_0:=D(\rho_0,\rho_1)>0$, $MP_{\mathrm{Global}}(L)$ as in Theorem C.2(i), and a threshold $0<MP_{\min}(L)\le D_0$,
$$
MP_{\mathrm{Global}}(L)=D_0f^{N(L)},
\qquad
MP_{\mathrm{Global}}(L)\ge MP_{\min}(L)
\iff
N(L)\,|\ln f|\le\ln\frac{D_0}{MP_{\min}(L)}.
\tag{C.16b.1}
$$
2. **Exact-clock synchronization.** Every step lasts exactly $\tau_{\mathrm{step}}>0$. Then $\tau_{\max}(L)=\tau_{\mathrm{step}}N(L)$, and the synchronization requirement holds exactly when $\tau_{\mathrm{step}}N(L)\le\tau_{sync}(L)$.
3. **Exact non-amortized traffic.** Every hop of every charged transmission is charged exactly $r>0$, without broadcast, coding, shared-edge or temporal amortization, and $V_{\mathrm{total}}=V_{\mathrm{prop}}$. Then $V_{\mathrm{prop}}(L)=rM(L)\bar N(L)$, and RE holds exactly when $rM(L)\bar N(L)\le V_{\max}(L)$.
4. **Independent failures.** The failure events are mutually independent. Then LV holds exactly when $\sum_v-\ln\bigl(1-p_v(L)\bigr)\le\ln(1/P_{\min})$, and LV implies $\sum_vp_v(L)\le\ln(1/P_{\min})$.

Consequently:

(a) on the class of item 1 with a scale-independent threshold $0<MP_{\min}<D_0$, every family with $N(L)\to\infty$ violates the distinction requirement at all sufficiently large $L$; a family obeying the quasi-isometry bounds of Theorem C.1(a), with worst-case pairs at Euclidean separation $L$, has $N(L)\ge\lambda^{-1}L-C$, so on this class regular families fail this gate as the anomalous families of Theorem C.2 do, and the exponent $\gamma$ enters only through the crossover scale (C.14);

(b) on the class of item 3 with $M(L)\ge aL^D$, $\bar N(L)\ge bL$ and $V_{\max}(L)\le C_VL^D$ for constants $a,b,C_V>0$, RE fails at all sufficiently large $L$ for every family, regular families included;

(c) for two families in the class of item 1 with $N_1(L)\le c_1L$ and $N_2(L)\ge c_2L^\gamma$, $\gamma>1$, at all large $L$, the threshold $MP_{\min}(L)=D_0e^{-AL^q}$ with $A>0$ retains the first family at all large $L$ when $q>1$, or $q=1$ and $A\ge c_1|\ln f|$, and excludes the second at all large $L$ when $q<\gamma$, or $q=\gamma$ and $A<c_2|\ln f|$; the same window holds on the class of item 2 for $\tau_{sync}(L)=AL^q$ with $\tau_{\mathrm{step}}$ in place of $|\ln f|$, and on the class of item 3 for $M(L)=mL^D$, $\bar N_i=N_i$ and $V_{\max}(L)=AL^{D+q}$ with $rm$ in place of $|\ln f|$;

(d) on the class of item 4 with a scale-independent $P_{\min}$, a floor $p_v(L)\ge p_0>0$ on a number $n(L)\to\infty$ of vertices violates LV at all sufficiently large $L$, for regular and irregular families alike.

On these classes a gate that retains an unbounded regular family with worst-case hop counts $N_1(L)\to\infty$ requires, by items 1 and 2, a threshold with $\ln(D_0/MP_{\min}(L))\ge|\ln f|N_1(L)$ or a window $\tau_{sync}(L)\ge\tau_{\mathrm{step}}N_1(L)$, each growing without bound in $L$. By item 3 it requires a budget $V_{\max}(L)\ge rM_1(L)\bar N_1(L)$, where $M_1(L)$ and $\bar N_1(L)$ are the charged transmission count and the traffic hop count of that family. The required budget $rM_1(L)\bar N_1(L)$ grows without bound when $M_1(L)\ge m_0$ and $\bar N_1(L)\ge c\,N_1(L)$ at all large $L$ for constants $m_0,c>0$, and it stays bounded when $\sup_LM_1(L)\bar N_1(L)<\infty$, for every growth of $N_1(L)$. Item (c) gives the resulting windows in which the gate separates regular from anomalous chemical-distance scaling.

*Proof.* Item 1: applying the exact contraction identity along the $N(L)$ steps gives $MP_{\mathrm{Global}}(L)=D_0f^{N(L)}$, and taking logarithms gives the equivalence. The qubit depolarizing channel $\rho\mapsto f\rho+(1-f)I/2$ belongs to this class because it maps $\rho-\sigma$ to $f(\rho-\sigma)$. Items 2 and 3 are additivity of the registered durations and of the non-amortized charges. Item 4: independence gives $P_{stability}=\prod_v(1-p_v)$, the condition $P_{stability}\ge P_{\min}$ is the displayed logarithmic inequality, and $-\ln(1-p)\ge p$ gives the implication.

For (a), $N(L)|\ln f|$ eventually exceeds the fixed number $\ln(D_0/MP_{\min})$; under Theorem C.1(a) every route between points at Euclidean separation $L$ has at least $d_{\mathrm{graph}}\ge\lambda^{-1}L-C$ hops. For (b), $rM(L)\bar N(L)\ge rabL^{D+1}>C_VL^D$ for large $L$. For (c), item 1 gives retention when $|\ln f|c_1L\le AL^q$ and exclusion when $|\ln f|c_2L^\gamma>AL^q$ at all large $L$, and both comparisons hold under the stated exponent and constant conditions; items 2 and 3 give the other two gates by the same comparison. For (d), $\sum_vp_v(L)\ge p_0n(L)\to\infty$ contradicts the implication in item 4. The final paragraph restates items 1 and 2 for a retained family with $N_1(L)\to\infty$, and item 3 gives $V_{\mathrm{prop}}(L)=rM_1(L)\bar N_1(L)$, which is at least $rm_0c\,N_1(L)\to\infty$ under the two stated floors and is bounded whenever $M_1(L)\bar N_1(L)$ is bounded, for example when $M_1(L)=1/\bar N_1(L)$. ∎

<a id="theorem-c5c-source-funded-routing-and-synchronization-window"></a>**Theorem C.5c (Source-Funded Routing and Synchronization Window).**

R14 denotes Definition 2.4.1g and Theorem 2.4.1h, with its original premises retained. Construction C.5d owns the base apparatus; Construction C.5e supplies the actual-score receipt for private routing/decoder histories.

#### 1. Source and task before graph choice

Fix a positive time $\tau$, an energy quantum $E_0$, a hop-energy price $r>0$, an integer $K\ge 2$, a finite horizon $H\ge 1$ and a maximum vertex count $V$. Fix all of these before choosing a connected graph $G$, distinguished vertices $s,t$, or a route. Only graphs with at most $V$ vertices and $d_G(s,t)\le H$ are admitted. Every link joins two declared local auxiliary registers of actual R14 MPU cores. The source uses the original R14 task and its protected second forecast, with its physical clock calibrated so that the original preparation deadline is $\tau_{R}$. Its completion probability $p$ satisfies $1/2<p<1$. The original independent motor law makes completion independent of the target bits.

Let $B$ be the original completion flag, publicly distributed before the global task begins. Conditional on $B=1$, set $F$ equal to the protected second forecast and $Y_0=Y_2$. The source law is

$$
\begin{aligned}
P(B=1) &= p,\quad P(F=0\mid B=1)=P(F=1\mid B=1)=1/2, \\
P(Y_{0}=1\mid B=1,F=0) &= 1/4, \\
P(Y_{0}=1\mid B=1,F=1) &= 3/4.
\end{aligned}
$$

The public $B$ record is independent of $Y_{0}$. On $B=0$ the global predictor uses its prior and sends nothing. Only the committed $F$, together with $B$, crosses the global-task interface. Later predictive memory, the source environment and its protected outcome archive are not readable by an encoder. The original R14 local task and its attained presentation-relative $C_P=C_{\mathrm{op}}=8$ are unchanged. Aggregate constructors use the delayed universal namespace; no program shorter than eight is altered.

The public herald is an actual one-bit transmission along the selected graph before the target-noise clock is enabled. It has an $H$-slot preparation reservation. A shortest route uses $d\le H$ occupied slots; the remaining $H-d$ slots transfer their reserved energy locally into the same owned preparation receiver. Thus the fixed preparation charge contains exactly $H$ hop-price units and $H$ clock slots, whether or not the message arrives early. The target and source both retain $B$. This is an owned, target-independent preparation stage, not a free nonlocal flag. The flip sequence below begins only after that stage has ended. All branches, including $B=0$, own this stage and the entire original R14 attempt.

Prepare $H$ independent bits $A_{j}$ with $P(A_j=1)=1/(2K)$. At successive ticks of the same physical clock, apply the reversible controlled flip

$$
Y_{j}=Y_{j-1}\oplus A_{j}.
$$

The noise cells and all records are supplied initially. There is no infinite collision stream or unowned reset. Put $\rho_K=1-1/K$. Independence gives

$$
\mathbb{E}[Y_{n}-1/2\mid B,F]=\rho_{K}^{n}\mathbb{E}[Y_{0}-1/2\mid B,F].
\tag{C.5c.1}
$$

The single-step target channel is $\exp(\tau Q_K)$ on diagonal states, where

$$
Q_{K}=\nu_{K}\begin{bmatrix} -1 & 1 \\ 1 & -1 \end{bmatrix},\quad\nu_{K}=-\log(\rho_{K})/(2\tau).
$$

This identifies its sampled relaxation pole from the actual finite collision law and physical clock. The physical model uses the displayed finite collision sequence at its tick times; the continuous interpolation does not assert an exact finite closed bath realization between ticks.

At a preselected tick $n$, the remote predictor must commit $q\in[0,1]$ for $Y_{n}$. The score is the strictly proper Brier reward $1-(q-Y_n)^{2}$. The task prior is uniform, so the no-information forecast $q=1/2$ has mean loss $1/4$ at every $n$.

#### Finite physical payoff and one energy identity

The task supplies $K$ excited two-level battery cells, each of gap $E_0$, a ready useful-work receiver and a ready unused-output receiver. A coin with conditional success probability $1-(q-y)^{2}$ controls an energy-conserving permutation. On success it moves all $K$ excitations to the useful receiver; on failure it moves them to the unused-output receiver. The spent source battery is ground-state in both cases. Thus, sample by sample,

$$
\begin{aligned}
K E_{0} &= E_{\mathrm{useful}}+E_{\mathrm{unused}}, \\
E_{\mathrm{useful}} &= K E_{0}I_{\mathrm{success}},\quad E_{\mathrm{unused}}=K E_{0}(1-I_{\mathrm{success}}).
\end{aligned}
\tag{C.5c.2}
$$

No unused energy is credited as recovered useful work. Both receivers and the score coin remain in the retained trial inventory. There is no cyclic erasure or heat identification in (C.5c.2). Any later recovery or reset is a different registered cycle.

Let C contain the complete, nonnegative, prepaid preparation/control/maintenance resource charge for the fixed finite trial, converted to energy-valued credits by fixed declared positive prices. C includes the source-noise cells, clock, all MPU cores, controller ROM, memory, score-coin control and receiver hardware, but excludes the K E0 source-battery energy and actual hop debits. The positive input-resource ledger and the PCE potential are respectively

$$
\begin{aligned}
V_{\mathrm{total}} &= C+K E_{0}+r\,\mathbb{E}[\text{number of occupied-hop uses}], \\
V_{\mathrm{PCE}} &= V_{\mathrm{total}}-\mathbb{E}[E_{\mathrm{useful}}] \\
&= C+r\,\mathbb{E}[\text{number of occupied-hop uses}]+K E_{0}\mathbb{E}[(q-Y_{n})^{2}].
\end{aligned}
\tag{C.5c.3}
$$

Equation (C.5c.3) counts the payoff once. The expected unused-output energy is already the last term; it is not charged again. An energy coordinate and a resource-credit coordinate remain separate before the declared objective prices are applied.

A deterministic forecast grid suffices. Choose $D=4K^{H}$ and permit $q=j/D$, $j=0,\dots,D$. Every minimizing vertex posterior used below lies on this grid; other forecasts appear only in the outer-relaxation coverage proof. A finite ROM stores the source task, permitted encoder table, decoder table and tick. A controlled one-qubit rotation prepares the score coin, followed by a controlled battery-to-receiver swap. With degenerate control registers, a rotation through $\theta\in[0,\pi]$ has a finite Hamiltonian of norm at most $\pi\hbar/(2\tau_c)$ over the owned duration $\tau_{c}$. Its controller work and preparation resources are in $C$. The exact adopted coherent-control primitive and the reliable prepared cells are physical-model inputs, as in the original finite-source admission; no empirical implementation is asserted.

#### 2. Complete routing interface

The network interface is classical, noiseless and one-token. After the public-herald preparation stage, one occupied-hop use lasts exactly $\tau$ and consumes exactly r from a separately supplied finite hop battery, transferring it to an owned energy receiver. The payload can distinguish the two successful forecast labels. Local controller and scratch spaces are prepaid through the full fixed horizon, including idle slots. Actual hop debits are additional and occur only when an occupied token advances. Silence is a legitimate received symbol at the declared deadline. Intermediate pulse coherences and mid-slot probes are outside this clocked interface; $\tau$ is the completed protocol-step duration, not a claimed lower bound on every possible microscopic intervention-to-observable response.

The comparison class contains every source-dependent stochastic encoder from F to silence or a finite payload, conditional on the public $B=1$, every forecast kernel on the resulting remote record, every causal route and all finite mixtures of such implementations, within the fixed resource inventory. No node other than s initially possesses information about F or $Y_{0}$. Shared preparation randomness is independent of the target. There is no additional side channel. Source and receiver may share the chosen encoder/decoder description; this is charged controller data, not target information. Local scores can be evaluated from the source's actual encoder outcome and the registered deterministic decoder. A private randomized decoder requires an owned return record and is dominated by its conditional mean forecast.

The class is specified by its physical interfaces and available resources, not by a desired winner. It includes the prior-only implementation, every uninformative encoder, inverted forecasts, unnecessarily long routes and all allowed stochastic choices.

#### Coverage lemma

At any fixed deadline $n\tau$, any informative payload received at $t$ must traverse at least $d=d_G(s,t)$ occupied hops. Revealing the complete source label $F$ whenever a payload is sent cannot increase its Brier loss and uses the same payload alphabet and hop count. Sending by a shortest route reaches $t$ by $d\tau$. Earlier arrival and the earlier registered target snapshot improve (C.5c.1), while deleting detours reduces cost. Thus the minimum over deadlines and routes is attained at $n=d$ and by shortest routing. A protocol that sends nothing has the prior option with zero hop debit.

For the encoder optimization at $n=d$ and $B=1$, let $a_{f}$ in [0,1] be the probability of sending the complete label $f$. A received label reveals $f$; silence combines the unsent labels. Write $w_f=1/2$, $m_0=-1/4$, $m_1=1/4$, $u_f=w_f(1-a_f)$, $U=u_0+u_1$. The posterior-variance gain before the target decay factor is

$$
B(a)=\sum_{f}w_{f}a_{f}m_{f}^{2}+\Bigl(\sum_{f}u_{f}m_{f}\Bigr)^{2}/U,
\tag{C.5c.4}
$$

where the last term is zero at $U=0$. It is convex in $a$: the second term is the perspective $x^{2}/U$ of a convex quadratic, with its continuous value on the feasible zero-mass boundary. The expected hop charge $rd(a_0+a_1)/2$ is affine. Hence

$$
r\,d\,(a_{0}+a_{1})/2-K E_{0}\rho_{K}^{2d}B(a)
\tag{C.5c.5}
$$

is concave on the complete square $[0,1]^{2}$ and has a minimum at a vertex. Expressing $a$ as a convex combination of vertices proves its potential is at least the minimum vertex potential. This covers every stochastic encoder, including private randomness. Conditional expectation uniquely minimizes Brier loss for each received record, since

$$
\mathbb{E}[(q-Y)^{2}\mid\text{record}]=\operatorname{Var}(Y\mid\text{record})+(q-\mathbb{E}[Y\mid\text{record}])^{2}.
$$

Randomized forecasts cannot improve that value. The vertex posteriors are $1/2$ and $1/2\pm\rho_K^{d}/4$, all on the finite grid of section 1. Therefore continuous competing forecast choices cannot lower the attained finite-grid optimum. For the attained deterministic vertex decoder the source reconstructs its prediction from the sent/silent outcome. For private routing/decoder histories, Construction C.5e returns the actual protected forecast after commitment. Neither route feeds a score back into the prediction.

A causally transmitted token that carries less information, incurs a detour, drops before delivery, or carries independent randomness is dominated by the construction just given. On $B=0$, the interface contains no target information and any send incurs a positive unnecessary charge. The complete minimum therefore reduces to the four send-subset vertices on $B=1$ and the prior on $B=0$. This is a proved coverage map, rather than a hand-picked candidate census.

#### 3. Exact PCE classifier and derived cutoff

At $B=1$ the four vertices have these expected occupied-hop counts and posterior-variance gains:

$$
\begin{aligned}
\text{send neither:}\quad &0\text{ hops},\qquad\text{gain }0; \\
\text{send only }0\text{:}\quad &d/2\text{ hops},\qquad\text{gain }\rho_{K}^{2d}/16; \\
\text{send only }1\text{:}\quad &d/2\text{ hops},\qquad\text{gain }\rho_{K}^{2d}/16; \\
\text{send both:}\quad &d\text{ hops},\qquad\text{gain }\rho_{K}^{2d}/16.
\end{aligned}
$$

The two one-label encoders reveal F completely: silence uniquely identifies the other value. Sending both is strictly dominated for $d>0$. Consequently the exact global minimum is

$$
\begin{aligned}
\min V_{\mathrm{PCE}} &= C+K E_{0}/4 \\
&\quad+p\min(0,\,r\,d/2-K E_{0}\rho_{K}^{2d}/16).
\end{aligned}
\tag{C.5c.6}
$$

This is attained by the prior-only class or a one-label encoder with the proper posterior decoder. The two one-label encoders are related by target-label symmetry. The minimum over stochastic protocols follows from the coverage lemma. Public pretrial random mixtures of equal minimizing classes have the same value; private mixtures retain the convexity inequality and their equality conditions.

A strict predictive-service improvement exists exactly when

$$
r\,d<K E_{0}\rho_{K}^{2d}/8.
\tag{C.5c.7}
$$

At equality the prior and the two one-label codes are minimizers. The R14 preparation and all failed attempts are still charged; their common success probability p multiplies both the incremental hop cost and the predictive gain, and cancels only from this comparison.

Put $a_K=-2\log(\rho_K)>0$. The two sides of (C.5c.7) have opposite strict monotonicity. The unique positive real crossover is

$$
N_{*}(K)=W(a_{K}K E_{0}/(8r))/a_{K},
\tag{C.5c.8}
$$

where $W$ is the nonnegative inverse of $x\to x\exp(x)$. The synchronization window $\tau_{\mathrm{sync}}=\tau N_*(K)$ is derived by minimizing (C.5c.3); it was not supplied as a viability premise. Integer hop counts below the crossover strictly prefer service; those above it prefer the prior. Equality is recorded separately.

#### Fixed-stakes obstruction and source-funded scaling

If the battery reward is a fixed energy $S$ instead of $KE_0$, (C.5c.7) implies $d<S/(8r)$. Thus a growing correlation lifetime alone cannot produce an unbounded accepted route. The source's bounded Brier improvement is essential to this conclusion; the per-successful-trial expected send cost is $rd/2$ because silent encoding was included.

For the actual source-funded family, $Ka_K\to 2$. Consequently

$$
N_{*}(K)/K\to x_{*}=(1/2)W(E_{0}/(4r))>0.
\tag{C.5c.9}
$$

The scaling comes from two independently owned source coordinates: the K-cell score battery and the flip probability 1/(2K). It is not a universal PCE prediction of either coordinate. The finite battery, its full input energy and its controller/maintenance costs are present before graph comparison.

#### 4. Graph-uniform discrimination and absolute budgets

Equations (C.5c.6)-(C.5c.8) hold for every admitted finite graph and source/target pair. They classify the entire declared class by its shortest-route distance, without identifying geometry with that distance. A graph with a sparse pendant defect and a below-cutoff registered pair remains admitted. No size-independent penalty for every irregular graph is inferred.

For a concrete nonempty scale family, let $m\ge 2$, $L=2m^{2}$, $K=m^{3}$, and use the common vertex set $\{0,\dots,L\}^{2}$ with fixed source $(0,0)$ and target $(L,L)$. Set $V=(L+1)^{2}$ and $H=V-1$, and allow every connected nearest-neighbor edge mask. The full grid has $d_{\mathrm{grid}}=2L=4m^{2}$. Since $L$ is even, the row-wise Hamiltonian snake begins at $(0,0)$, ends at $(L,L)$, and has $d_{\mathrm{snake}}=(L+1)^{2}-1=4m^{4}+4m^{2}$. Take the source calibration $E_0=r$, independent of the mask. For every $m\ge 64$, Bernoulli's inequality gives $\rho_K^{2d_{\mathrm{grid}}}\ge(1-8/m)\ge 7/8$. Hence $K\rho_K^{2d_{\mathrm{grid}}}/8\ge 7m^{3}/64\ge 7m^{2}>4m^{2}=d_{\mathrm{grid}}$. Conversely $d_{\mathrm{snake}}\ge 4m^{4}>K/8\ge K\rho_K^{2d_{\mathrm{snake}}}/8$. Thus the grid is strictly retained and the snake strictly excluded for every $m\ge 64$, with an explicit crossover certificate rather than only asymptotic notation. Every intermediate mask is decided by (C.5c.6). The source battery and noise-cell rules depend on $m$, not on which mask is used.

For a selected encoder, the literal positive resource ledger is

$$
V_{\mathrm{total}}(G)=C_{m}+K E_{0}+r\,d_{G}P(\text{send}).
\tag{C.5c.10}
$$

For the full architecture the score battery and common maintenance baseline remain in this absolute ledger. They cancel only in the comparison of potentials. The PCE-derived synchronization window may be inserted directly as the C.4 GC gate. A sufficient absolute budget for every service at or below that window is

$$
V_{\max}=C_{m}+K E_{0}+r N_{*}(K),
\tag{C.5c.11}
$$

and the sharper encoder-specific budget uses $P(\text{send})$. Equation (C.5c.11) is an overhead-aware resource gate. It is not the literal C.5b(3) identity $V_{\mathrm{total}}=rM\bar{N}$.

The bounded common hardware is reserved through one fixed horizon $\tau_R+(2H+10)\tau$ and all candidates own the same reservation. The maximum-hop battery contains $H$ energy debits. Mask installation and route selection are finite, charged pretrial control steps; a common full truth-table controller realizes every admitted mask and route, so the reservation does not depend on the chosen result. A positive baseline is permitted and fully retained. This is fixed-architecture PCE in the sense of original Definition 15, not a global architecture or regular-continuum theorem.

#### 5. Finite local channels, physical clock and auxiliary admission

Every vertex is an actual original R14 core with the original task environment, stopped motor, protected records and complete finite supplies. During routing, the core's archived output is frozen. Its local auxiliary payload register and frame register belong to Appendix B's explicitly allowed auxiliary enlargement. On a traversed edge, a controlled frame flip by the host's success flag is followed by the data transfer; the frame records that same flip. Decoding removes the frame, while the retained frame/core records exhibit source-active coupling. The local core tasks and outputs are retained even at vertices not on the selected route.

All logical auxiliary registers are degenerate. Battery/receiver Hamiltonians retain their stated gaps; their exchange gates commute with total native energy on each initialized fixed-energy fibre. For any finite involutive gate J, including a reversible controlled Boolean permutation after adding a phase flag, the constant pulse

$$
H_{J}=(\pi\hbar/(2\delta))(I-J),\quad 0\le t\le\delta,
$$

has norm at most $\pi\hbar/\delta$ and $\exp(-iH_J\delta/\hbar)=J$ exactly. A hop is a fixed finite sequence of these gates with subintervals summing to $\tau$. The debit/receiver update is completed to a permutation on its finite equal-total-energy sector with a retained history/phase flag. Thus the battery identity, transfer map and clock duration refer to the same finite operation. Each gate's finite duration, strength, support, prepared cells and timing apparatus are owned. There is no instantaneous-pulse substitution.

The full semantic state maps injectively to the computational-basis hardware state, including core, noise, counter, receiver, frame and shadow registers. Each Boolean gate, prepared probability law and readout effect is the corresponding exact matrix-unit or permutation map. Hence each primitive commutes with this injection. Multiplication proves the intertwiner for every finite protocol word, and conditional decomposition proves it for every finite adaptive protocol. The target response (C.5c.1), received-message law (C.5c.4), clock time and energy identities (C.5c.2)-(C.5c.3) are actual responses of this same source.

#### Three literal C.5b interfaces and the outstanding fourth

1. Exact contraction is realized by a qubit payload and an independent per-hop Pauli seed with probabilities $(1+3f)/4,(1-f)/4,(1-f)/4,(1-f)/4$. Controlled Pauli application and discarding the seed from the target response gives $\Phi(\rho)=f\rho+(1-f)I/2$. Thus $D(\Phi\rho,\Phi\sigma)=fD(\rho,\sigma)$, including all input states. The seed, purification, discarded-information location and any later reset remain owned outside that target channel. For $f=1/2$, three fair seed bits give probabilities $5/8,1/8,1/8,1/8$ exactly.
2. Exact-clock synchronization is the finite pulse sequence just constructed, with latency $\tau$ times the number of sequential hops.
3. Independent failures are separately prepared Bernoulli flags $F_{v}$ on actual vertex auxiliaries, read by the shutoff instrument. Product preparation and independent local controls give $P(\text{no failure})=\prod_v(1-p_v)$ exactly. The flags are independent of the R14 task and target noise, and their full preparation/readout resources are charged. They are not inferred from curvature. The discrimination example takes $p_{v}=0$.
4. The occupied-hop energy subledger is exactly $rM\bar{N}$ with no broadcast, coding or shared-hop discount. The complete source ledger also contains $C+KE_0$. Consequently this source realizes an extension of the exact traffic class, not its literal zero-other-cost hypothesis. The overhead-aware source does not establish that zero-other-cost hypothesis or an unrestricted network classification.

<a id="construction-c5d-finite-routing-source-and-resource-reservation"></a>**Construction C.5d (Finite Routing Source and Resource Reservation).**

R14 is the source of Definition 2.4.1g and Theorem 2.4.1h, with its original premises and supplies retained.

#### 1. Source grammar and support

The inputs are integers $V\ge 2,H\ge 1,K\ge 2$, a graph mask on at most $V$ labelled vertices, a distinguished pair $s\ne t$, and finite positive calibrations $\tau,\tau_R,E_0,r$. The admitted mask is connected and its registered pair distance is at most $H$. The common architecture stores every possible adjacency bit and reserves every possible local link port. A mask enables only its listed link primitives. No operation sends target information along a disabled edge.

There are V copies of the original R14 apparatus, including its motor, task environment, battery, recorder, shadows, protected archive and verifier. Their source laws are independent except for the nominated core at s whose future bit is used in the global task. Every copy retains the original local predictive task and its qualifying response. The cores are frozen after their original finite preparation deadline. The global task uses only the source core's completion flag and previously committed second forecast. The hierarchy/program-minimum assertion applies to each original component with its original interface, not to the larger network's description length.

Auxiliary supports are: source target/noise cells; local occupied/vacant payload and frame cells at each vertex; edge-port flags; the three K-cell scoring energy stores; H-cell transmission fuel and receiver; H-cell preparation-herald fuel and receiver; public herald archives at s,t; local tick/control flags; immutable route and forecast-decoder programs; all scratch, shadow and score records. The entire finite apparatus is retained through the end of the trial. The target response may discard environment coordinates only through its declared readout map.

The auxiliary supports and self-adjoint edge-operator types use original Appendix B Definitions B.3-B.4. Their autonomous energy-density/current theorem is not applied to this globally driven protocol; each constant-pulse segment has its stated autonomous generator, and the switches have their separate work owner. An edge Hamiltonian acts on its endpoints and the explicitly included fuel/control auxiliary for that edge. The finite controller is external calibrated control in the same sense as the original R14 timing primitive. It is not claimed to be an autonomous time crystal or a finite closed bath.

#### 2. Explicit capacity and cost reservation

Let R be the original R14 counted register/ROM bound,

$$
R=6978+68\cdot 2^{72}+2^{1332}.
$$

Its calibrated timing apparatus remains the original separate physical-model primitive and has its own priced module coordinate. It is not identified with a newly assigned number of hardware bits. The new wrapper adds 64 timing-control bits per vertex and a finite global stage controller; these fit in the auxiliary bound below. Each original R14 factor and its original source code remain unchanged.

Put $D=4K^{H}$, $b=\lceil\log_2(D+1)\rceil$, and

$$
\begin{aligned}
M &= V R+100[V^{2}+(H+K+1)^{2}+(D+1)^{2}], \\
J &= 2H+10, \\
B &= (J+20)(M+8), \\
S &= M\cdot 2^{M+8}, \\
G_{\mathrm{ctrl}} &= 16(M+8)^{2}S, \\
T &= \tau_{R}+J\tau.
\end{aligned}
$$

M bounds the mutable semantic state. B is a conservative ready/register capacity, including J fresh M-bit shadows and reversible-computation workspace. It covers all original cores, adjacency and route descriptions, target/noise cells, three score stores, transmission and herald fuel/receivers, all local ports and frames, and the fixed finite encoder/decoder tables. It also covers J copies of the complete mutable semantic field as fresh shadows. In particular, the b-bit forecast-grid register and a complete list of D+1 possible scores fit. The enlarged controller truth table on M mutable bits and at most eight binary external control flags has at most S output bits. A sum-of-minterms reversible compilation uses at most $G_{\mathrm{ctrl}}$ Boolean gates with owned clean workspace. Reserving the same table and full gate budget at every one of J stages covers every mask, path and allowed encoder/decoder. Identity padding consumes that reserved controller service when fewer logical gates are needed.

The encoder probabilities are $j/256$, $j=0,\dots,256$, prepared using eight independent fair source bits and a reversible comparison. This complete finite grid includes all four vertex encoders. Forecasts lie in $\{0,1/D,\dots,1\}$. Arbitrary continuous stochastic encoders and real forecasts used in the coverage proof are an outer relaxation, so the attained finite optimum remains globally optimal within the actual source grammar. There are no exact transcendentally calibrated decoder parameters.

The capacities are deliberately excessive. Their role is to give a closed finite budget and source coverage. The source model adopts reliable ready cells and finite isolated memory over T; their prices are positive. No exact pure state is claimed to be prepared from a positive-temperature Gibbs state at finite work.

Register the nonenergy resource vector

$$
\begin{aligned}
\text{acquisition/preparation:}\quad &B+S\text{ ready cells}, \\
\text{representation:}\quad &S\text{ ROM cells, included in acquisition}, \\
\text{processing/update:}\quad &J\,G_{\mathrm{ctrl}}\text{ reserved gate uses}, \\
\text{maintenance:}\quad &(B+S)\,T\text{ cell-time}, \\
\text{verification/adaptation:}\quad &V\text{ original bounded verifiers plus} \\
&\text{one pretrial mask/path/decoder installation}, \\
\text{clock/control:}\quad &J\text{ timed stage triggers plus }V\text{ original timers}.
\end{aligned}
$$

The verification/installation is implemented by the reserved controller and does not add a second charge to the same gate uses. Its dedicated logical interface and output records are included in B. A positive price is declared for each independently charged service; the representation, verification and adaptation descriptions are allocation labels on those services, not second bills for the same source. Original R14 internal collision/controller and verifier energies are reserved once at their original 20 energy units per core; each original source and its qualification is used at that scope.

The common charge C is the dot product of this complete reservation vector with its fixed positive prices, plus the V original finite R14 energy reservations, the H herald-hop energy units rH, and the finite control-work capacity reservation described below. All rows have a fixed source owner. A field is never omitted because it cancels in the comparison. The entire fixed reservation lasts T on every branch, including the prior-only branch. The optional global service changes only the transmission fuel consumed and the useful score output.

For one fully populated choice, price a prepared cell, a reserved gate use and a timing action/module at E0 resource credits each, price maintained cell-time at E0/tau, and choose the original core energy unit equal to E0. With unit price for the control-work-capacity reservation, the exact common charge is

$$
\begin{aligned}
C &= E_{0}[(B+S)+J\,G_{\mathrm{ctrl}}+(B+S)T/\tau+(J+V)+20V] \\
&\quad+rH+W_{\mathrm{ctrl}}.
\end{aligned}
$$

The last term is a capacity-service price in the objective. Actual control-work energy is borrowed and returned as described below; it is not simultaneously counted as a consumed energy debit. These prices are fixed with the source tuple and do not depend on which graph or encoder minimizes the potential.

C is a resource objective, in energy-valued credits after fixed pricing. A ready-cell credit is not asserted to equal an actual Hamiltonian energy. The physical energy statements below concern only the corresponding energy coordinates.

#### 3. Physical clock, collision preparation and native drift

R14's motor scale is $\kappa=14/\tau_R$, so its original deadline equals $\tau_{R}$ in the same clock used by every subsequent pulse. After $\tau_{R}$ the core records are protected. The public herald uses $H$ fixed-duration clock slots and fixed total preparation-fuel consumption $rH$. Its first $d$ slots send $B$ along a shortest allowed route; the remaining slots consume their allocated fuel in a local source receiver while leaving $B$ unchanged. The source noise process starts after that common preparation interval. It uses $H$ prepared independent noise bits, one reversible controlled flip at each step. In the declared trial every candidate reserves the full $H$ target-update slots, even if it reads the target at an earlier tick $n$.

At each target tick, the source flip, local message gates and decoder operations act on disjoint designated data or on their ordered subslots. Allocate, for example, eight equal subslots per hop: source flip, local frame read/write, payload transfer, fuel transfer, frame restore/record, endpoint decode, endpoint commit and source snapshot. Unused subslots implement the identity. Their total duration is $\tau$. The target snapshot $Y_{n}$ and remote forecast commitment refer to the same endpoint of this composite step. Subsequent ticks act on the live target, not on its frozen scoring snapshot.

Degenerate logical registers have zero native Hamiltonian. Energy stores have their stated gaps. Their exchange permutation $J$ commutes with the total native energy $H_0$, and each initialized exchange fibre has fixed total energy. For a self-adjoint involution $J$, a finite control $H_c=(\pi\hbar/(2\delta))(I-J)$ implements $J$ over $\delta$; native $H_0$ contributes only a common fibre phase. A general reversible table is made involutive by adjoining a direction flag and using $J(x,0)=(Ux,1)$, $J(y,1)=(U^{-1}y,0)$. Its exact physical action is therefore a finite pulse, with norm at most $\pi\hbar/\delta$. No native drift is dropped.

The direct physical implementation of a finite local table is its displayed finite-dimensional Hamiltonian, rather than an assertion that $G_{\mathrm{ctrl}}$ sequential elementary gates fit into one subslot. The reversible compilation supplies a finite representation/control bound; the adopted local auxiliary Hamiltonian is the actual pulse generator. There is no fixed internal two-body-degree restriction in this declared auxiliary model. If that additional hardware restriction is imposed, its serial time must be added and the present exact-clock instance does not automatically transfer.

Switching work is also owned. On each initialized exchange fibre, $[H_0,H_c]=0$ and the expectation of $H_c$ is constant through the pulse. Switch-on borrows at most $\lVert H_c\rVert$ energy and switch-off returns the same expectation; net switching work is zero for this ideal cyclic-control primitive. A finite control-work reservation of

$$
W_{\mathrm{ctrl}}=32\pi\hbar(V+1)/\min(\tau,\tau_{R}/17)
$$

bounds the simultaneous auxiliary pulses and the registered timing/pulse service. Its capacity, controller and restoration are included once in C. This is a capacity bound for the adopted driven-control source, not an autonomous work-battery dilation theorem. The source's actual finite control law and borrowed/returned work, rather than a zero-duration gate, are the interface being admitted.

For the score coin, the controlled rotation angle is the explicit algebraic-amplitude gate with success probability $1-(j/D-y)^{2}$. Its entries are square roots of rational numbers. The finite list of such gates is part of the controller description, and each has a bounded finite-pulse implementation. The shared source/receiver decoder table determines the same $q$ from the actual received/silent record; the score is evaluated only after the remote commitment.

#### 4. Energy recovery and no double counting

Transmission fuel begins with H excitations of gap r. If L occupied hops occur, exactly L excitations move to the transmission receiver. The unused H-L source excitations are returned unchanged to the fuel supplier at the end. Thus

$$
\begin{aligned}
E_{\mathrm{hop},\mathrm{in}} &= rH, \\
E_{\mathrm{hop},\mathrm{returned}} &= r(H-L), \\
E_{\mathrm{hop},\mathrm{receiver}} &= rL.
\end{aligned}
$$

The consumed transmission cost is rL; the positive capacity/maintenance cost of the full fuel stores remains in C. This is a return of unused fuel, not a subtraction of useful predictive benefit from $V_{\mathrm{total}}$. The preparation-herald fuel is all consumed and its rH is in C.

The score battery satisfies $KE_0=E_{\mathrm{useful}}+E_{\mathrm{unused}}$ on every sample. Its input energy $KE_0$ is in $V_{\mathrm{total}}$. The potential subtracts $E_{\mathrm{useful}}$ exactly once. The unused-output receiver retains the rest; neither its energy nor a hypothetical future reset is billed twice. Together the task-energy identity is

$$
\begin{aligned}
K E_{0}+rH+rH \\
&= E_{\mathrm{useful}}+E_{\mathrm{unused}}+E_{\mathrm{hop},\mathrm{returned}} \\
&\quad+E_{\mathrm{hop},\mathrm{receiver}}+E_{\mathrm{herald},\mathrm{receiver}}.
\end{aligned}
$$

Original core energy stores satisfy their original independent identities. Degenerate logical controls and energy-preserving swaps do not alter the displayed bare-energy sums. Their finite control resources are in the separate C vector. This source is one finite trial; no cyclic Landauer floor is inferred from discarding a target-channel coordinate.

#### 5. Typed response maps and all-word faithfulness

The semantic carrier is the finite product of the original core states and the explicitly bounded auxiliary coordinates. Its computational-basis injection $J_{\mathrm{sem}}$ includes every resource coordinate. Source preparation pushes forward the original R14 law and the independent rational noise/encoder preparations. A local logical gate is its actual basis permutation; a stochastic coin is its stated ancilla preparation followed by the controlled permutation; a target readout is the corresponding diagonal effect. For the optional qubit contraction interface, use the full 2-dimensional target matrix algebra and the displayed controlled-Pauli unitary.

Every primitive kernel or quantum instrument obeys the commuting source/hardware square by its construction. The clock waits of the R14 source obey the original generator intertwiner. New gates obey the explicit finite Hamiltonian identity above. Composition and finite outcome conditioning prove the square for every admitted finite protocol and readout. The global forecast map, score effect, link-fuel count and source target snapshot are therefore responses of one apparatus.

The exact-contraction module has source states $\rho_0,\rho_1$, per-link random-Pauli channel, target operator $E$, response $\operatorname{Tr}[E\,\Phi_N\cdots\Phi_1(\rho)]$. Its independent seed environments are owned even when not in the target algebra. The failure module has product source state $\bigotimes_v\operatorname{diag}(1-p_v,p_v)$, target effect $\bigotimes_v|0\rangle\langle 0|$ and response $\prod_v(1-p_v)$. The clock module has input token at $s$, actual finite gate schedule, target occupied/committed pointer at $t$ and latency $\tau$ times the route length. The resource module has the physical fuel number operator and its expected decrement $r\,\mathbb{E}[L]$, together with the complete positive common reservation $C$ and score input $KE_0$.

#### 6. Source admission boundary

The imported physical-model primitives are exactly the original attained R14 source, reliable finite ready cells and protected records, calibrated finite timing, finite coherent/control gates on declared auxiliaries, and the chosen nonnegative resource prices. The target-noise law, typed transfer map, score-energy identity, encoder optimum and synchronization cutoff are derived here from those primitives. A universal architecture census, a continuum metric and a claim that every geometric irregularity fails the task are outside this theorem.

<a id="construction-c5e-owned-serial-receipt-and-actual-remote-score"></a>**Construction C.5e (Owned Serial Receipt and Actual Remote Score).**

Use Theorem C.5c and Construction C.5d; this extension replaces source-only inference of a private forecast by its protected receipt.

#### 1. Chronology and information path

Fix the original tuple $(V,H,K,\tau,\tau_R,E_0,r)$ before the enabled connected graph, with every admitted source-target distance $d$ at most $H$. Let $D=4K^{H}$ and $b=\lceil\log_2(D+1)\rceil$. The candidate protocol commits its forecast $q=j/D$ at its preselected prediction tick $n\le H$. The target's immutable $b$-bit register $Q_{t}$ contains the actual $j$, including any intermediate drop, receiver observation and private decoder randomness. The source takes its protected snapshot $Y_{n}$ at that same physical tick. Later target flips never modify this snapshot. There is no subsequent forecast revision.

The H prediction slots always finish before the receipt starts. In particular, no candidate can use a receipt signal to improve its already committed forecast. The receipt stage is mandatory on every candidate and on $B=0$ as well as $B=1$. Its controller is part of the scoring apparatus; the candidate routing program has no write access to it or to the protected $Q_{t}$. Candidate tokens and all their histories are retained in separate registers during this stage.

Choose a shortest enabled path $t=v_0,\dots,v_d=s$ during the charged pretrial table installation. For each bit $i=0,\dots,b-1$ in fixed order:

1. Copy $Q_t[i]$ reversibly into a ready receipt token. The token is occupied for both bit values. Its payload is exactly one classical bit; no $b$-bit wide link is assumed.
2. In $d$ consecutive slots move that token along the selected path. Every occupied hop takes $\tau$ and transfers one gap-$r$ excitation to the owned local receipt-energy receiver. Each vertex uses its original source-active frame coupling and its separate receipt buffer. No disabled edge is used.
3. At $s$ copy the received bit into $Q_s[i]$. During the $H-d$ remaining slots, transfer the remaining $H-d$ allocated excitations locally into the source receipt receiver, one per slot. Retain the token, its frame/history, and every receiver record.

The source and target local copies and commits occupy the eight already defined subslots of the corresponding first/last hop or overhead stage. In the case $d=1$ these are ordered subslots of one slot. The endpoints are distinct, so $d\ge 1$. The packet has H fuel cells and is transported with the one-bit token; after each hop one excitation remains at that hop's receiver. Its unused H-d excitations arrive at s and are consumed by the padding operations there. This is an explicit local fuel path, not remote access to a battery left at t. A ready packet for every bit is prepared at t before the trial. Packet width is an owned fuel auxiliary: the classical predictive/receipt payload remains one bit, while the finite local exchange Hamiltonian acts on that bit, its fuel cells and adjacent endpoint buffers. This local many-body auxiliary primitive is the same admitted finite-table type as the original source, with no fixed internal two-body-degree restriction.

Each bit therefore consumes $H$ slots and exactly $rH$ bare energy. The entire receipt takes $bH\tau$ and consumes exactly $brH$ on every branch and graph. Bit-serial transmission, rather than a silent parallel-width assumption, is the reason for the factor $b$ in the duration. At the end $Q_s=Q_t$ pointwise, even when the prediction route was dropped, delayed, randomized or uninformative. The reliable mandatory receipt is an admitted distinct stage; the optional independent-failure module is not silently superposed on it.

Only then does the source apply the score coin with actual inputs $(Q_s,Y_n)$. The success probability is exactly $1-(Q_s/D-Y_n)^{2}$. Therefore the conditional useful-energy expectation equals $KE_0[1-(q-Y_n)^{2}]$ for every candidate history, not only the attained optimum.

#### 2. Complete finite reservation and physical control

Let R and M be the bounds of Construction C.5d. Define the enlarged mutable bound and full trial reservation by

$$
\begin{aligned}
M' &= M+100V(H+1)(b+1)+100(b+1)^{2}, \\
J' &= (b+2)H+12, \\
B' &= (J'+20)(M'+8), \\
S' &= M'\,2^{M'+8}, \\
G' &= 16(M'+8)^{2}S', \\
T' &= \tau_{R}+J'\tau.
\end{aligned}
$$

The added polynomial term covers b immutable remote forecast bits, b source accumulator bits, bH ready fuel cells and matching local receipt receivers, vertex-local fuel-packet buffers and frame/history fields, the registered length-at-most-H return path, serial-bit/slot counters, and the protected snapshot. For example, even reserving a separate H-cell packet buffer and receiver field at every vertex for every bit uses at most 4V(H+1)(b+1) bits. The displayed factor 100 also covers direction and stage flags. The original M term still owns all prediction protocols, original R14 cores, noise, score stores, optional modules and decoder tables. The B' bound retains a fresh M'-bit shadow per timed stage, so no history is erased to free a workspace. The table and finite minterm bounds S',G' now apply to this enlarged semantic carrier. All stores remain retained through T'.

The actual local generator for an involutive exchange $J_{e}$ during $\delta=\tau/8$ is

$$
H_{e}=H_{0}+(\pi\hbar/(2\delta))(I-J_{e}).
$$

Here $J_{e}$ includes transport of the token's remaining fuel and delivery of one excitation. It preserves the total native gap energy on the two endpoints and their packet/receiver auxiliaries. Hence $[H_0,J_e]=0$. On every initialized equal-energy fibre its exact propagator is $J_{e}$ times the common native phase. Completing the ready-domain injection to a finite equal-energy permutation, and adjoining a direction flag when needed, gives the same statement for the local copies, counter updates and score readout. Logical records are degenerate. No new instantaneous control or faster hop is used.

To own capacity and positive switching throughput separately, set

$$
\begin{aligned}
W' &= 64\pi\hbar(V+1)/\min(\tau,\tau_{R}/17), \\
Q' &= J'W'.
\end{aligned}
$$

At most V+1 simultaneous auxiliary pulse blocks occur in a subslot. Each has norm at most 8 $\pi$ hbar/tau, and there are at most eight subslots per new stage. Thus W' bounds peak simultaneous borrowed control energy, and Q' bounds the sum of all positive switch-on energies of the auxiliary controls over the full trial. Every constant segment has unchanged expectation of its control Hamiltonian, so switch-off returns the borrowed mean work. Q' is a reservation upper bound, not a claim that each state has the same realized work record. The original R14 motor/timing energy and calibrated timer remain their separate original source primitives. The source adopts finite external calibrated control; no autonomous clock/work reservoir dilation is asserted.

The same finite control list contains the actual rational/algebraic gate parameters. The extended source does not derive a universal bandwidth or precision tariff. It owns the original finite timing service, an exact finite list of control settings, the enlarged table/gate service, peak work capacity, and gross positive switching-throughput reservation. All adopted primitives and tariffs are fixed before graph comparison.

For a fully populated strictly positive pricing instance, charge one E0 credit per ready cell, reserved Boolean gate use, timing action/module, and original core energy unit, and E0/tau per maintained cell-time. Charge one energy-valued resource credit per unit of peak control-work capacity and per unit of reserved positive switching throughput. The exact common charge is

$$
\begin{aligned}
C' &= E_{0}[(B'+S')+J'G'+(B'+S')T'/\tau+(J'+V)+20V] \\
&\quad+rH+brH+W'+Q'.
\end{aligned}
$$

The rH term is the original public-herald fuel; brH is receipt fuel. W' and Q' price two distinct services, peak reusable capacity and cumulative positive-work throughput. Neither is misreported as net consumed control energy. Table representation, adaptation, verification, source retention and local receipt programming are allocated within the displayed charged services, not billed a second time. Common reservations may be wasteful but are complete and finite. They depend on the original source tuple and maximum inventory, not the selected graph, encoder, deadline or realized private coin.

#### 3. Energy identity and unchanged objective

Let $L$ be the number of occupied prediction-hop uses. The prediction fuel input is $rH$ and its unchanged returned remainder is $r(H-L)$. The herald consumes $rH$. The receipt consumes $brH$, including local padding. The score battery consumes $KE_0$ into its useful and unused receivers. Thus, sample by sample,

$$
\begin{aligned}
&K E_{0}+(b+2)rH \\
&\quad=E_{\mathrm{useful}}+E_{\mathrm{unused}}+r(H-L)+rL+rH+brH.
\end{aligned}
$$

All receiver energies are retained physical outputs. Net auxiliary control work is zero under the adopted switch/recovery primitive, while its peak and cumulative positive-work reservations are charged in C'. The actual original core energy identity is retained separately. This is one finite trial with retained histories; no reset/heat conclusion is inferred.

Consequently the complete positive ledger and PCE potential are exactly

$$
\begin{aligned}
V_{\mathrm{total}} &= C'+K E_{0}+r\,\mathbb{E}[L], \\
V_{\mathrm{PCE}} &= C'+r\,\mathbb{E}[L]+K E_{0}\mathbb{E}[(q-Y_{n})^{2}].
\end{aligned}
$$

The receipt has removed the scoring information gap and added a topology-independent constant. The original conditional-mean identity, delivered-label enlargement, shortest-path bound and silence-aware convex-perspective proof now apply to actual scored protocols throughout the stated finite class. Hidden drops cannot beat the relaxation: delivered records may be enriched to F at the same delivery probability, all wasted prediction hops are nonnegative costs, and at least d paid hops are needed for delivery. Public independent randomness may be conditioned on; private encoding/routing/decoder randomness is included in the same finite source. The attained one-label witnesses still lie in that class.

The exact minimum therefore is

$$
C'+K E_{0}/4+p\min(0,\,rd/2-K E_{0}(1-1/K)^{2d}/16).
$$

The cutoff, fixed-stakes obstruction and topology-independent source-funded asymptotics are unchanged. Every result in Theorem C.5f holds after C is replaced by C'. Its update remains a single pretrial graph/table-quotient operation with the old record retained, not an autonomous recurrent attractor.

#### 4. Source and response commutative squares

Use the enlarged computational-basis injection into the actual finite carrier. The local receipt primitives are basis permutations whose semantic action is the one explicitly described above; their physical generators prove the primitive squares. Induction over the $d$-hop path gives the received bit equal to the committed remote bit. Induction over $b$ bit blocks gives $Q_s=Q_t$. The $H-d$ local padding steps act only on fuel/receiver histories and leave that equality intact. Conditional decomposition over all hidden prediction histories then proves the score square for each history and hence for every source mixture. The score effect is evaluated on the actual snapshot and returned forecast; no inference from an unobserved intermediate route outcome enters it.

A simple counterexample from the first review illustrates the repair. On $s$--$u$--$t$, let $s$ always send $F$ and let $u$ privately drop with probability $1/2$. At the two-tick deadline $t$ commits its posterior if the token arrived and $1/2$ if it did not. The returned $Q_{s}$ takes those actual values. Conditional on success $B$, the score loss is $1/4-\rho^{4}/32$, rather than the incorrectly reconstructed $1/4-\rho^{4}/16$. The four $(F,\text{drop})$ histories give both losses and pointwise receipt equality.

<a id="theorem-c5f-all-pair-routing-window-and-complete-mask-minima"></a>**Theorem C.5f (All-Pair Routing Window and Complete Mask Minima).**

Use Theorem C.5c and the actual-score source of Constructions C.5d–C.5e.

#### 2. A common worst-case-query apparatus

Fix $V,H,K,\tau,\tau_R,E_0,r$ and the universal finite architecture before the graph mask, and admit only connected masks with diameter at most $H$. The task admits every ordered distinct endpoint query $(u,v)$. Queries are selected before the R14 source attempts and before any target/noise realization; they contain no target data. Every vertex has its original independent R14 core, and every possible selected source has the same local task/noise law. Conditional on the public query, the source's completion probability and the balanced forecast/target law are exactly the original $p$, $1/4,3/4$ law. The chosen target has no initial target information.

The task's fixed geometric query rule is: compute the graph's hop diameter and choose the lexicographically first ordered pair attaining it. This is a deterministic function of the initial adjacency mask, not a data-dependent choice of a favorable forecast. It is fixed for the entire comparison class. A second registered task evaluates a policy's worst-case expected potential over all pretrial endpoint queries. The two tasks have the same attained optimal value by the proof below; they need not agree on a suboptimal policy that performs poorly on another query. The all-pair policy interface is important: a policy table specifies an allowed protocol for every pair, with the same reserved source and controller. The finite source includes that whole table, not one graph-selected protocol with uncharged alternatives.

Preparing the classical graph/query description is an owned pretrial operation. The description is copied into the local initial control records before the independent R14 attempts begin. Its all-pair distance verifier is the finite truth table (or the ordinary finite all-source shortest-path algorithm) on the already supplied adjacency bits. Its representation, computation, local installation and retained verification output are covered by the enlarged controller below. This initialization is not a post-preparation nonlocal transmission of F or Y. Every subsequent information-bearing prediction or receipt transfer uses enabled graph edges.

To make this one physical apparatus rather than a relabelled source for each query, prepare at every potential source the H noise cells and K-cell score battery, with its two ready output receivers. Prepare the prediction/herald/receipt fuel packs at every potential sender. Only the nominated packs are used; every unselected energy pack is returned unchanged at trial end. All the installed ready hardware and its full maintenance are charged, including the unselected modules. The source target is the actual Y2 record of the nominated R14 core, followed by its owned independent noise cells. The selected remote record is the actual q of that pair, returned by the mandatory serial receipt. All original core tasks and all histories remain retained.

For explicit capacity use Construction C.5e's M', b and J', and set

$$
\begin{aligned}
M_{G} &= M'+100V[(H+1)(b+3)+3K+V+1], \\
J_{G} &= J'+2, \\
B_{G} &= (J_{G}+20)(M_{G}+8), \\
S_{G} &= M_{G}\,2^{M_{G}+8}, \\
G_{G} &= 16(M_{G}+8)^{2}S_{G}, \\
T_{G} &= \tau_{R}+J_{G}\tau, \\
W_{G} &= 2W',\quad Q_{G}=J_{G}W_{G}.
\end{aligned}
$$

The added term contains all endpoint-query labels, $V$ source-noise/score/fuel alternatives, the finite all-pair routing/verification data and local installation records. $J_{G}$ adds two pretrial stages. The full table on the resulting finite semantic state contains every mask and every pair; the same shadow and gate bounds give its direct finite realization. Local gate norms and the maximum simultaneous auxiliary pulse count remain below $W_G$; $Q_G$ owns cumulative positive switching work capacity. The original R14 calibrated timer remains a named physical input on the same clock.

Using the original positive tariffs, the exact complete common charge is

$$
\begin{aligned}
C_{G} &= E_{0}[(B_{G}+S_{G})+J_{G}G_{G}+(B_{G}+S_{G})T_{G}/\tau \\
&\qquad+(J_{G}+V)+20V] \\
&\quad+rH+brH+W_{G}+Q_{G}.
\end{aligned}
$$

Every term is independent of mask and endpoint query at the fixed scale. The score input supplied over all alternative modules is V K E0; (V-1) K E0 is returned untouched, leaving the K E0 consumed by the nominated task. Similarly, of the total V(b+2)rH prepared fuel, all unselected packs and unused prediction fuel are returned. The retained consumed fuel is rH+brH+rL. Thus the full positive ledger is

$$
V_{\mathrm{total}}=C_{G}+K E_{0}+r\,\mathbb{E}[L].
$$

The corresponding actual score potential is $C_G+r\,\mathbb{E}[L]+KE_0\,\mathbb{E}[(q-Y_n)^{2}]$. Construction C.5e proves the score equality for every admitted finite history. The all-pair preparation does not change any conditional source law or information budget.

#### 3. Complete worst-case policy classification

For a fixed pair at distance d, Theorem C.5c with Construction C.5e gives

$$
\begin{aligned}
v(d) &= C_{G}+K E_{0}/4+p\min(0,F(d)), \\
F(d) &= rd/2-K E_{0}\rho^{2d}/16,\quad\rho=1-1/K.
\end{aligned}
$$

Its increase satisfies

$$
F(d+1)-F(d)=r/2+(K E_{0}/16)\rho^{2d}(1-\rho^{2})>r/2.
$$

Therefore $v(d)$ is nondecreasing. Let a complete policy table $\Pi$ specify one allowed protocol for each query. The common finite inventory permits the table of all individually optimal shortest-route one-label policies. Hence

$$
\begin{aligned}
&\min_{\Pi}\max_{u\ne v}V_{\Pi}(u,v) \\
&\quad=\max_{u\ne v}\min_{\pi}V_{\pi}(u,v) \\
&\quad=v(\operatorname{diam}G).
\end{aligned}
$$

The first inequality in either direction follows directly: every $\Pi$ is bounded below by the largest individual optimum, and the combined table attains each individual optimum. This does not invoke a minimax interchange theorem on an unspecified class. There are finitely many pairs and all their policy entries are jointly owned. The deterministic diametral-query implementation attains the same value and has an actual source/target response map.

A strict useful worst-case service is preferred exactly when

$$
r\operatorname{diam}(G)<K E_{0}\rho^{2\operatorname{diam}(G)}/8,
$$

or equivalently $\operatorname{diam}(G)<N_*(K)$, where

$$
\begin{aligned}
N_{*}(K) &= W(a_{K}K E_{0}/(8r))/a_{K}, \\
a_{K} &= -2\log(1-1/K).
\end{aligned}
$$

At equality service and the prior tie. The inclusive synchronization gate is therefore $\tau\operatorname{diam}(G)\le\tau N_*(K)$. Its strict service decision and its boundary convention are both explicit. Every mask in the declared family is covered by this formula; its graph property is its actual diameter, not merely the nominated corner distance.

#### 4. The retained linear-distance family and excluded anomalous family

Let $m\ge 64$, $L=2m^{2}$, $K=m^{3}$, $V=(L+1)^{2}$, $H=V-1$, $E_0=r$, and take all connected nearest-neighbor edge masks on the square vertex set $\{0,\dots,L\}^{2}$. Fixed unit edge positions and hop prices are common to every mask. The routing cost submetric uses the declared uniform marginal hop charge $r$, so its distance is $r$ times hop distance; the complete baseline $C_{G}$ is still charged separately in $V_{\mathrm{total}}$. No curvature or continuum theorem is inferred by conflating that metric with the full trial budget. The full grid satisfies

$$
|x-y|_{2}\le d_{\mathrm{grid}}(x,y)=|x-y|_{1}\le\sqrt{2}\,|x-y|_{2},
$$

so it has uniform Euclidean comparison constants on these expanding boxes. Its worst-case hop count is $N_1=2L=4m^{2}$ and tends to infinity. The row-wise Hamiltonian snake has diameter $N_2=V-1=4m^{4}+4m^{2}$ and opposite corner endpoints because $L$ is even. Thus it has superlinear chemical-distance scaling relative to the same registered two-dimensional macroscopic embedding and task. A path can be regular as a one-dimensional graph under a different task or embedding; this proof does not call it intrinsically irregular merely because its hop diameter is large. In this fixed two-dimensional comparison it violates the size-independent quasi-isometry required for linear embedding-distance comparison.

Bernoulli's inequality gives $\rho^{2N_1}\ge 1-8/m\ge 7/8$ and consequently $K\rho^{2N_1}/8\ge 7m^{3}/64>4m^{2}=N_1$. Meanwhile $N_2>K/8\ge K\rho^{2N_2}/8$. These strict statements hold for every $m\ge 64$. Therefore the PCE-derived exact-clock window retains the linear-distance full grid and excludes the snake. The optional curvature/source record is Proposition C.5i; its curvature lower bound is memberwise, not uniform over scale.

Since K $a_{K}$ tends to 2,

$$
N_{*}(K)/K\text{ tends to }(1/2)W(1/4)>0.
$$

In terms of $L$, the window grows as $L^{3/2}$, between the regular $L$ and anomalous $L^{2}$ route scales, precisely the type of growing discrimination window in Theorem C.5b(2). Its scaling is funded by the topology-independent $K$-cell payoff source and its independent $1/(2K)$ noise rule; it is not a universal derivation of those source parameters. All their absolute hardware, energy and clock charges appear in $C_{G}$ and $V_{\mathrm{total}}$.

A sufficient full positive budget on the admitted service branch is $C_G+KE_0+rN_*(K)$. This is an overhead-aware bound, not a claim that total resources equal the transmission subledger. The exact-traffic class remains a separate branch.

#### 5. All-mask minimizers and strict gap

Every mask has diameter at least $2L$ by opposite-corner Euclidean coordinates, and the full grid attains $2L$. Since $F(2L)<0$, exactly the masks with diameter $2L$ minimize the worst-case potential. This is a complete finite graph class, decided by all-pair distances. It is broader than the full grid and is not characterized merely by the existence of one monotone corner path.

Every nonminimizing mask has diameter at least $2L+1$. When its service term is still negative, strict increase of $F$ gives a potential gap greater than $pr/2$. If its optimum is the prior, the previously proved bound $F(2L)\le -3rm^2/2$ gives an even larger gap. Thus the complete source-relative minimizing mask class has a uniform gap greater than $pr/2$ for $m\ge 64$. Sparse changes that preserve diameter remain minimizers, consistently with the original sparse-defect nonentailment.

One charged pretrial update may replace a nonminimizing mask by the full-grid mask and retain its old bits in a fresh shadow; it fixes the minimizing mask/table quotient. This is a finite strict-descent implementation on that quotient. It is not a recurrent autonomous attractor or a full-state fixed point.

<a id="theorem-c5g-recorded-service-quantum-cutoff"></a>**Theorem C.5g (Recorded-Service Quantum Cutoff).**

Use the forecast source and score law of Theorem C.5c, the receipt of Construction C.5e and the all-pair reservation of Theorem C.5f.

The herald/receipt fuel gap in Constructions C.5d–C.5e and Theorem C.5f is here $r_0$; $\sigma$ is the separate recorded-service gap.

#### 1. Interface and causal schedule

Fix a finite connected graph $G$, endpoints $s,t$, $H\ge d_G(s,t)$, $K\ge 2$, and positive calibrations $\tau,\tau_R,E_0,r_0,\sigma$ before the source bits are generated. The parameters $K,E_0,\sigma,\tau$ are fixed before graph comparison. $r_0$ is the separate herald/receipt fuel gap. The completed original source packet owns the actual R14 cores, herald, independent noise flips, score battery, score readout and protected source/target registers. The new record replaces the optional prediction interface and its consumed fuel coordinate only. Its accessible predictive input is exactly $(B,F)$; other original core task records and all target/noise cells are protected. Conditional on $F$ and $B$, the candidate quantum auxiliaries are independent of $Y_0$ and the noise sequence. Arbitrary local instruments mean arbitrary instruments on the registered accessible algebra, not access to the scoring oracle or protected archives.

Each tick has three causal layers: local preparation, one parallel layer of adjacent port interactions, and local readout/commitment. Every directed edge has separate endpoint port factors. Thus even incident edges act on disjoint ports in the interaction layer; an arriving port cannot feed a different outgoing port until the next tick. Arbitrary finite vertex-local quantum instruments may act before and after that layer. Their finite memories, environments, classical records and control descriptions are owned. There are $Z=H V(V-1)$ possible directed edge slots in the common reservation; disabled edges have no intervertex operation. This complete-port bound is also valid for the smaller grid-mask family.

For each enabled slot the initiator is its directed-edge tail, selected in the pretrial calendar. A local binary instrument $\{A_0,A_1\}$ produces an activation record $a$. Its orthogonal archive is outside the candidate's accessible control algebra through commitment. The branch $a=0$ has no operation on the other endpoint. The branch $a=1$ consumes one service excitation $\sigma$ and permits an arbitrary finite CPTP map $\Lambda$ on the two endpoint ports and its explicitly owned environment. In formulas, suppressing independent local background maps,

$$
\begin{aligned}
&E_{0}=A_{0}\otimes\mathrm{id}, \\
&E_{1}=\Lambda\circ(A_{1}\otimes\mathrm{id}), \\
&A_{0}+A_{1}\text{ is local CPTP}.
\end{aligned}
$$

This describes CP maps, so an activation instrument may have several hidden Kraus outcomes. $\Lambda$ may retain, destroy or transmit arbitrary quantum information. It may be a coherently controlled apply/skip gate. Once $a=1$, that complete invocation pays $\sigma$, even on a vacuum input or a control branch on which the payload stays put. An identity service also pays if it is activated.

Only local stored records may select the activation instrument or local controls. Public coins and the calendar are independent of the forecast bit. A remote request, acknowledgment, branch announcement or scheduler update carrying source-dependent information is an endpoint operation inside an activated service. There is no globally informed classical scheduler with free access to source records. Every finite classically adaptive local schedule can be represented by these fixed slots and local histories, with unused slots padded. A schedule requiring more rounds or ports owns those resources separately.

The theorem is uniform in all finite local dimensions and instruments. Its physical admission is every actually specified finite instrument/control menu in the registered inventory, with a finite parameter description and preparation/control record. Continuous CPTP maps and arbitrary real forecasts form a mathematical outer relaxation. The attained elementary classical witnesses belong to the actual finite algebraic source. This distinction does not affect the exact optimum.

Initially the complement of any source-containing cut has the same reduced state for $F=0$ and $F=1$. The original source has product preparation and satisfies this directly. The proof also permits separately owned pre-existing entanglement, provided the conditional complement marginals coincide and no complement controller is independently given F. Entanglement and its preparation are then explicit additional source resources.

#### 2. A no-service comparison valid with entanglement

Fix any cut A|B with s in A and t in B. For each crossing slot replace its paid map $E_{1}$ by the local neutral map

$$
E_{1}^{0}=A_{1}\otimes\mathrm{id}.
$$

Keep $E_{0}$ and all within-side operations unchanged. The activation archive remains at its initiator. A branch record or communication that $\Lambda$ would have delivered across the cut is not delivered by the neutral map. The sum $E_0+E_1^0$ is a local CPTP operation. A slot initiated on $B$ is treated symmetrically. The resulting neutral protocol uses only local channels on the two sides and the original source-independent public randomness. It therefore produces a common final $B$ marginal $\sigma_{B}$ for both $F$ values. This conclusion uses non-signaling of local trace-preserving maps and remains true for initially entangled states.

Let $q_{f}$ be the actual probability that at least one paid cross-cut activation occurs, conditional on $F=f$. The actual and neutral protocols have identical CP histories until the first such activation. Their subnormalized no-activation final state $\eta_{f}$ is identical, and their first-activation probabilities are identical. Grouping every remaining history gives

$$
\begin{aligned}
\rho_{f}^{B} &= \eta_{f}+\tau_{f}, \\
\sigma_{B} &= \eta_{f}+\omega_{f}, \\
\tau_{f},\omega_{f} &\ge 0, \\
\operatorname{Tr}(\tau_{f}) &= \operatorname{Tr}(\omega_{f})=q_{f}.
\end{aligned}
$$

No assertion that the normalized no-activation state is independent of f is needed. In particular $\eta_{0}$ and $\eta_{1}$ may differ through conditioning or steering. The equality follows by replacing every crossing paid map by its neutral completion and grouping the finite instrument expansion into no-event/first-event histories. All decisions are local, so this replacement introduces no unowned announcement.

Consequently

$$
\begin{aligned}
\lVert\rho_{f}^{B}-\sigma_{B}\rVert_{1} &\le 2q_{f}, \\
D(\rho_{0}^{B},\rho_{1}^{B}) &\le q_{0}+q_{1},
\end{aligned}
$$

where $D(\rho,\sigma)=\lVert\rho-\sigma\rVert_1/2$. If $N_{\mathrm{cut}}$ is the number of paid crossing services, then

$$
\begin{aligned}
q_{0}+q_{1} &\le \mathbb{E}[N_{\mathrm{cut}}|F=0]+\mathbb{E}[N_{\mathrm{cut}}|F=1] \\
&= 2\mathbb{E}[N_{\mathrm{cut}}]
\end{aligned}
$$

for the balanced source. This proof includes protocols with arbitrary internally generated entanglement, private quantum measurements, local feedback and silent branches.

#### 3. Posterior information and distance-layer bound

Let $R$ be the classical target record available at its actual commitment, including the committed forecast $q$, its certified tick $n$, and any explicitly archived stopped local outcome. This record is protected thereafter. Observations acquired after commitment are excluded from $R$, even if the target retains them elsewhere. Let $P_{f}$ be the distribution of this stopped record conditioned on $F=f$. The cut argument applies to its final protected readout effect; it does not read a later, more informative target state into an earlier commitment. Define $Z_F=2F-1$ and $z(R)=\mathbb{E}[Z_F|R]$. For $P=(P_0+P_1)/2$,

$$
\begin{aligned}
g &:= \mathbb{E}[z(R)^{2}] \\
&= \sum_{R}(P_{1}(R)-P_{0}(R))^{2}/[2(P_{1}(R)+P_{0}(R))].
\end{aligned}
$$

Terms with zero denominator are zero. Since $|P_1-P_0|\le P_1+P_0$,

$$
\begin{aligned}
0\le g &\le\operatorname{TV}(P_{0},P_{1}) \\
&\le D(\rho_{0}^{B},\rho_{1}^{B}) \\
&\le q_{0}+q_{1}\le 2\mathbb{E}[N_{\mathrm{cut}}].
\end{aligned}
$$

The measurement inequality is trace-norm contraction. Thus the normalization is fixed; there is no missing factor of two.

For $k=0,\dots,d-1$ take $A_k=\{v:d_G(s,v)\le k\}$. Every source-target route crosses each cut. More importantly, every nearest-neighbor edge crosses at most one of these layer cuts, since its endpoint distances from $s$ differ by at most one. Summing the preceding inequality therefore gives

$$
\mathbb{E}[N_{\mathrm{services}}]\ge\sum_{k}\mathbb{E}[N_{\mathrm{cut},k}]\ge d\,g/2.
\tag{C.5g.1}
$$

This is an information/cost bound, rather than an arrival-event claim. No-arrival records can be informative. A phase-only service, an empty-token probe and an entanglement-assisted receiver measurement are already covered by (C.5g.1).

#### 4. Actual clock and proper-score optimum

Condition on the original success flag $B=1$. The source forecast F is balanced and

$$
\mathbb{E}[Y_{n}-1/2\mid F]=\rho^{n}(2F-1)/4.
$$

The H independent noise bits and the protected source snapshots are inaccessible to the routing candidate. The network may use F, independent private/shared randomness and its own quantum states. Conditional on F, its records are independent of the noise sequence.

One interaction layer per tick gives exact circuit causality: before tick d, every retained target record has the same distribution for both values of F. This follows by induction on the backward port light cone, including activation instruments and local scheduler records. A common calibrated clock by itself conveys no F information.

The target may commit at a preselected tick or at a local, classically recorded stopping time $0\le n\le H$. A protected write-once register stores the actual tick and forecast. The source freezes all $H+1$ snapshots, including $Y_0$. The mandatory post-prediction receipt returns both the actual forecast index and commitment tick; scoring uses that snapshot. Thus a target cannot choose an earlier nominal tick after receiving later information. Every stopped record with $n<d$ has $z(R)=0$. Later paid interactions may remain in $N_{\mathrm{services}}$, but their outcomes cannot enlarge $R$ or alter the committed forecast and tick.

For any real forecast, its conditional Brier loss is at least the Bayes loss. The maximum possible improvement over 1/4 is therefore

$$
(1/16)\mathbb{E}[\rho^{2n}z(R)^{2}]\le\rho^{2d}g/16.
\tag{C.5g.2}
$$

The actual finite rational forecast alphabet only decreases this upper bound. Equations (C.5g.1) and (C.5g.2) imply, with $A_d=K E_0\rho^{(2d)}$,

$$
\begin{aligned}
&\sigma \mathbb{E}[N_{\mathrm{services}}]-K E_{0}\,(\text{Brier improvement}) \\
&\quad\ge(\sigma d/2-A_{d}/16)\,g \\
&\quad\ge\min\{0,\sigma d/2-A_{d}/16\},
\end{aligned}
\tag{C.5g.3}
$$

because $0\le g\le 1$. All supplementary resources outside the common reservation have nonnegative separately owned charges and cannot improve this bound by being omitted.

Both endpoints of (C.5g.3) are attained. The prior-only candidate activates no service and commits $q=1/2$. For the informative candidate, if $F=1$ the source activates a service sending a fixed classical flag along a preinstalled shortest path, with one relay per tick; if $F=0$ all these services remain idle. At tick $d$ the target distinguishes arrival from silence exactly. It knows $F$, so $g=1$, and $\mathbb{E}[N_{\mathrm{services}}]=d/2$. The forecasts

$$
q=1/2\pm\rho^{d}/4
$$

belong to $D=4K^{H}$. Every activated relay has the owned service map below. Hence (C.5g.3) is an exact attained optimum, rather than only a no-go bound. On $B=0$ the prior branch is used; adding the original completion probability $p$ gives the displayed theorem.

The resulting $N_\star$ is the positive real root of

$$
\begin{aligned}
\sigma N_{\star} &= K E_{0}\rho^{2N_{\star}}/8, \\
N_{\star} &= W(a_{K}K E_{0}/(8\sigma))/a_{K}, \\
a_{K} &= -2\log(1-1/K).
\end{aligned}
$$

Integer service distances satisfy the strict version of this inequality. With fixed $K$-independent stakes $S$, the necessary inequality $d<S/(8\sigma)$ is bounded. With the independently prepared $K$-cell battery, $N_\star/K$ tends to $W(E_0/(4\sigma))/2$. The all-pair and diametral minimax argument of Theorem C.5f applies after replacing the occupied-token price $r$ by $\sigma$ and the baseline by $C_{S}$. Proposition C.5i states the memberwise-curvature boundary.

#### 5. Finite physical service and full positive reservation

The following is an explicit finite, externally driven source, adopting the original reliable ready-cell, protected-memory and calibrated-control primitives. It owns its pulse waveform rather than assuming an instantaneous gate.

At each possible directed slot, a gap-sigma fuel cell begins excited, a provider receiver begins unexcited, and a degenerate provider archive begins at 0. On the ready domain an energy-preserving local isometry performs

$$
\begin{aligned}
&|a\rangle|1\rangle_{\mathrm{fuel}}|0\rangle_{\mathrm{receiver}}|0\rangle_{\mathrm{archive}} \\
&\quad\to|a\rangle|1-a\rangle_{\mathrm{fuel}}|a\rangle_{\mathrm{receiver}}|a\rangle_{\mathrm{archive}}.
\end{aligned}
$$

It extends to a unitary on each native-energy fibre. The provider archive/receiver and its shadow are inaccessible to candidate controls through commitment. Tracing that archive in the candidate channel exactly dephases the activation alternative. All records remain physically retained; no thermal reset or pure-state erasure cost is asserted. The provider retains the consumed service excitations, while unused fuel cells are returned unchanged after the trial. Their energy is an actual input/output record, not a price adjusted after observing the optimizer.

Every chosen finite CPTP service has a finite Stinespring isometry and a unitary extension on its owned degenerate ports/environment. Its controlled version acts only when the recorded $a=1$. The complete local/adjacent operator therefore commutes with native energy, after the fuel transfer has been included in an equal-energy fibre. Take a Hermitian logarithm $h$ of the finite unitary $U$ with $\exp(-ih\delta/\hbar)=U$ and $\lVert h\rVert\le\pi\hbar/\delta$. During $\delta=\tau/16$ use the smooth pulse

$$
H(t)=H_{0}+2\sin^{2}(\pi t/\delta)\,h,\quad 0\le t\le\delta.
$$

Because $[H_0,h]=0$ and the envelope integral equals $\delta$, the propagator is $U$ times its native fibre phase. The envelope and its first derivative vanish at the endpoints. The peak control norm is at most $2\pi\hbar/\delta$, integrated norm-action at most $\pi\hbar$, derivative norm at most $2\pi^{2}\hbar/\delta^{2}$, and total positive switching-work throughput at most $2\pi\hbar/\delta$ per pulse. Net switching work is zero because the expectation of $h$ is constant and the envelope returns to zero. These are distinct resource coordinates. This is a registered finite waveform; no claim of simultaneous compact time support and strict Fourier band limitation is made.

The sixteen ordered subslots accommodate source noise, local instrument dilation, archive/debit, adjacent service, local merge/readout, actual commitment, and snapshot. The parallel edge blocks have disjoint ports. Padding uses the same reserved stages. Thus each interaction layer takes exactly $\tau$ and no payload crosses two edges in one tick.

For explicit bounds let $M_G,J_G$ be the resource bounds of Theorem C.5f, let $m$ bound the total accessible quantum memory/port qubits, and let $\ell$ bound the finite descriptions of the actual instrument menu and preparation controls. These inventory bounds and the menu are registered before the graph comparison, so the common reservation is not a topology-dependent discount. Put $\beta=b+\lceil\log_2(H+1)\rceil$, adding the time receipt, and

$$
\begin{aligned}
M_{S} &= M_{G}+\ell+100(m+1)[Z+2VH+V^{2}+(H+1)(\beta+1)+1], \\
J_{S} &= J_{G}+4+(\beta-b)H, \\
B_{S} &= (16J_{S}+20)(M_{S}+8), \\
S_{S} &= M_{S}\,2^{M_{S}+8}, \\
G_{S} &= 16(M_{S}+8)^{2}S_{S}, \\
T_{S} &= \tau_{R}+J_{S}\tau.
\end{aligned}
$$

The added term owns the quantum ports, finite Stinespring environments, one archive/fuel/receiver per directed slot, local instrument records, H+1 source snapshots, protected commitment-time field and its receipt. A channel on m qubits needs at most 2m environment qubits; the displayed factor 100 is a conservative bound for the finite number of local and edge instruments. The Boolean table bound $G_{S}$ is a representation/controller reservation; arbitrary quantum channels are implemented by their registered logarithm pulse, not by claiming that this Boolean compilation is their quantum generator.

Set

$$
\begin{aligned}
W_{S} &= 256\pi\hbar(V^{2}+V+1)/\min(\tau,\tau_{R}/17), \\
Q_{S} &= 16J_{S}W_{S}, \\
A_{S} &= 16\pi\hbar J_{S}(V^{2}+V+1), \\
D_{S} &= 512\pi^{2}\hbar(V^{2}+V+1)/\tau^{2}.
\end{aligned}
$$

These bound peak simultaneous auxiliary work capacity, gross positive work throughput, integrated norm-action and peak derivative norm respectively. Original R14 timing/energy remains separately owned. All control settings have the stated finite description ell; additional precision/settings require a new declared entry. The source does not derive a universal laboratory calibration tariff.

One fixed positive pricing instance, chosen before topology, is

$$
\begin{aligned}
C_{S} &= E_{0}[(B_{S}+S_{S})+16J_{S}G_{S} \\
&\qquad+(B_{S}+S_{S})T_{S}/\tau+(16J_{S}+V)+20V] \\
&\quad+r_{0}H+\beta r_{0}H+W_{S}+Q_{S}+A_{S}/\tau+\tau D_{S}.
\end{aligned}
$$

Common hardware and action reservations are charged even for an idle prediction candidate. Ready cells, controller capacity, actual control description, retention, external clock, peak work, work throughput, norm-action and derivative service are present. Resource credits are not identified with physical heat.

On each sample the variable-energy identity is

$$
\begin{aligned}
&K E_{0}+\sigma Z+(\beta+1)r_{0}H \\
&\quad=E_{\mathrm{useful}}+E_{\mathrm{unused}} \\
&\qquad+\sigma(Z-N_{\mathrm{services}})+\sigma N_{\mathrm{services}} \\
&\qquad+(\beta+1)r_{0}H.
\end{aligned}
$$

The first service term is unchanged returned fuel; the second is energy delivered to the protected provider receiver. The remaining terms are the actual score and mandatory herald/receipt outputs. Core energy has its original separate identity, and the cyclic auxiliary control has zero net work with the positive reservations already displayed. Consequently

$$
\begin{aligned}
V_{\mathrm{total}} &= C_{S}+K E_{0}+\sigma \mathbb{E}[N_{\mathrm{services}}], \\
V_{\mathrm{PCE}} &= C_{S}+\sigma \mathbb{E}[N_{\mathrm{services}}]+K E_{0}\mathbb{E}[(q-Y_{n})^{2}].
\end{aligned}
$$

The useful score output is subtracted once. A particular finite platform owns one common $C_{S}$; the theorem is uniform over all such platforms. It does not compare a mandatory platform with a different architecture whose hardware costs have been silently removed.

#### 6. Coherent schedules and the expected-projector boundary

Within this source, a coherent apply/skip control is part of $\Lambda$ after a recorded activation. It pays one full service charge. A coherent routing circuit built from several adjacent gates pays for every activated physical slot in its implementation. If every possible branch gate is activated and its internal quantum control selects a branch, every such invocation is charged. If the outer activation itself is placed in coherent superposition, the protected provider archive dephases it. No appeal to an absence-of-arrival principle occurs.

For a genuinely different tariff that charges only the expectation of an undephased coherent query projector, the bound can fail. Let a receiver start in $\sqrt{1-t}|0\rangle+\sqrt{t}|1\rangle$, independent of balanced $F$, and apply the adjacent phase oracle

$$
U_{F}=|0\rangle\langle 0|+(-1)^{F}|1\rangle\langle 1|.
$$

The two pure target states have opposite signs on their $|1\rangle$ amplitudes. An $X$ measurement has posterior-sign information $g=4t(1-t)$. If the stipulated query-action charge is $\sigma$ times the expectation of $|1\rangle\langle 1|$, its value is $\sigma t$. The incremental objective is

$$
\sigma t-At(1-t)/4,\quad A=K E_{0}\rho^{2},
$$

which improves on zero whenever $A>4\sigma$ for sufficiently small $t$. For example $t=1/5$ and $A=6\sigma$ give $g=16/25$ and increment $-\sigma/25$, while the recorded-service threshold $A>8\sigma$ rejects. This witness can use the original rational forecast grid: choose $K=10,H=2,E_0=20\sigma/27$ before graph comparison. Then $\rho=9/10$, $A=6\sigma$, the $X$ outcome probabilities are $9/10$ and $1/10$ in opposite orders, and its proper forecasts $17/25$ and $8/25$ belong to $D=400$. The oracle is a finite adjacent gate, but the expectation-only charge is a different resource interface. If its fuel/activation alternative is recorded in the protected provider archive, the required coherence is destroyed; if the hardware invocation is charged in full, its charge is $\sigma$ rather than $\sigma t$.

This is an exact mathematical counterexample to replacing the recorded-service ledger by an undephased projector tariff. It is not asserted to be a dissipative fuel-debit implementation with the same protected receiver. A coherent charge register accessible to the receiver can be uncomputed, so an irreversible consumed-energy claim would need its own physical accounting. The source-specific recorded service above supplies that accounting and the cutoff proof together.

<a id="theorem-c5g1-exact-pure-bias-obstruction-with-unbounded-stopping"></a>**Theorem C.5g.1 (Exact Pure-Bias Obstruction with Unbounded Stopping).** Let $K\subset\mathbb C$ be a number field closed under complex conjugation. Fix finite-dimensional preparation density matrices, Kraus matrices and readout effects with entries in $K$. An admitted service may use finite tensor products of these resources, finite classical program words, permutations, discarding, adaptive control and a countable tree of finite-outcome operations. Each terminating history uses finitely many operations and finite ancillary dimension. Termination may be almost sure with no uniform time bound. A declared success event may contain any set of terminating histories and must have strictly positive probability. No output is assigned at an infinite, nonterminating history.

If the conditional output on success is exactly a pure state $|\psi\rangle\langle\psi|$, then
$$
\frac{\psi_a}{\psi_b}\in K
\qquad\text{whenever }\psi_b\ne0.
\tag{C.5g.1.1}
$$
Equivalently, its ray has a nonzero representative with every coordinate in $K$. This necessary condition applies with arbitrary discarded environments, adaptive stopping and postselection. It does not assert that every such ray is reachable by the supplied alphabet.

For computational-basis resources and the alphabet $H,T,\mathrm{CNOT}$ with computational-basis instruments, take $K=\mathbb Q(e^{i\pi/4})$. A standalone finite example has two independent survival probabilities $1-2^{-3}=7/8$ and attenuation input $s=1/2$, giving
$$
F=\frac{49}{64},\qquad \alpha=\frac{s}{F}=\frac{32}{49},\qquad
q=1-\alpha=\frac{17}{49}.
\tag{C.5g.1.2}
$$
The corresponding specified pure bias state,
$$
|\psi_q\rangle=\frac{\sqrt{32}|0\rangle+\sqrt{17}|1\rangle}{7},
\tag{C.5g.1.3}
$$
is unreachable in this service class, even with almost-sure termination or a positive-probability postselected success event.

*Proof.* Fix a terminating history $h$. Work with unnormalized density matrices throughout its finite operation sequence. Tensor products, matrix products, adjoints, finite Kraus sums and partial traces preserve entries in $K$; conjugation closure supplies the adjoint step. Basis-state control and wire permutations have rational entries. Thus the unnormalized output matrix $\tau_h$ has entries in $K$ and is positive semidefinite. This calculation includes every environment and ancillary index before tracing it out; no purity of the initial resources or of an individual Kraus branch is required.

Finite words over finite outcome sets form a countable set. Let $\mathcal S$ be the success histories, with total probability $p_{\mathcal S}>0$. The hypothesis is the trace-norm convergent positive sum
$$
\sum_{h\in\mathcal S}\tau_h
=p_{\mathcal S}|\psi\rangle\langle\psi|.
$$
For every $v\perp\psi$, positivity gives
$0=\sum_h\langle v,\tau_hv\rangle$ with all summands nonnegative, so every summand is zero. A positive matrix with $\langle v,\tau_hv\rangle=0$ annihilates $v$, as follows from its positive square root. Hence every $\tau_h$ has range contained in $\mathbb C\psi$. Some $\tau_h$ is nonzero because $p_{\mathcal S}>0$; it equals $t_h|\psi\rangle\langle\psi|$ for $t_h>0$. For $\psi_b\ne0$,
$$
\frac{(\tau_h)_{ab}}{(\tau_h)_{bb}}
=\frac{\psi_a\overline{\psi_b}}{|\psi_b|^2}
=\frac{\psi_a}{\psi_b}\in K.
$$
Dividing the vector by its nonzero $b$th coordinate proves the ray statement. Conversely a ray with a $K$-valued representative has all these ratios in $K$, establishing the stated equivalence of necessary conditions. The argument never normalizes an intermediate branch and never assumes the possibly infinite sum or its total probability lies in $K$.

The Clifford-plus-$T$ matrices lie in $K=\mathbb Q(i,\sqrt2)$, and $K\cap\mathbb R=\mathbb Q(\sqrt2)$: every element is $a+b\sqrt2+i(c+d\sqrt2)$ for rational $a,b,c,d$, and reality forces $c=d=0$. Equations (C.5g.1.2) follow from two independent hop survivals $1-2^{-3}=7/8$. The nonzero-coordinate ratio in (C.5g.1.3) is $\sqrt{34}/8$. If $\sqrt{34}=a+b\sqrt2$ with $a,b\in\mathbb Q$, squaring and comparing the rational and irrational parts gives $ab=0$. The case $b=0$ would make $34$ a rational square; the case $a=0$ would make $17=b^2$ a rational square. Both fail by prime valuation. Thus (C.5g.1.1) excludes the prescribed state. ∎

Computational-basis measurement of the displayed pure state has the same law as the mixed coin $\operatorname{diag}(32/49,17/49)$. The theorem classifies exact pure-state preparation by the fixed coefficient alphabet. A stopping-time probability service or an approximate pure preparation is compared by its actual complete output, stopping law, error and physical preparation/control/clock ledger.

<a id="theorem-c5h-controlled-hop-receiver-optimum-and-fixed-channel-boundary"></a>**Theorem C.5h (Controlled-Hop Receiver Optimum and Fixed-Channel Boundary).**

Use the actual-score receipt and resource parameters of Construction C.5e.

#### 1. Finite source channel

Condition on the original public R14 success flag $B=1$. Its balanced classical forecast F has target conditional mean 1/2+(2F-1)rho/4 at one noise tick. Encode $F=0$ as vacuum at s and $F=1$ as an occupied token at s. The adjacent receiver t independently prepares

$$
|\psi_{t}\rangle=\sqrt{1-t}\,|0\rangle+\sqrt{t}\,|1\rangle,\quad 0\le t\le 1,
$$

in a degenerate control qubit. Here t is a control parameter, not time. Let J be the finite energy-preserving hop involution that swaps each ready occupied source/fuel state with its target/debited-receiver image and fixes vacuum states exactly. The two occupied images have equal total native energy. A direction/history flag may be used on the occupied transposition; no such flag changes on vacuum. Consequently a coherently controlled operation

$$
U=|0\rangle\langle 0|_{c}\otimes I+|1\rangle\langle 1|_{c}\otimes J
$$

is an involution, preserves native energy and acts as the identity on a vacuum token. Its finite generator $\pi\hbar(I-U)/(2\delta)$, together with the commuting native Hamiltonian, realizes $U$ in duration $\delta$. It is supported on the adjacent source/target registers, receipt-free prediction fuel and the target control qubit. The same eight-subslot prediction tick contains the hop, local measurement and commitment. This is actual receiver-controlled intervertex hardware, rather than an uncharged classical decision to invoke the original channel.

After tracing the source token and owned fuel/history coordinates from the target's readout, its conditional states are

$$
\begin{aligned}
\rho_{0} &= |\mathrm{vac}\rangle\langle\mathrm{vac}|\otimes|\psi_{t}\rangle\langle\psi_{t}|, \\
\rho_{1} &= (1-t)|\mathrm{vac}\rangle\langle\mathrm{vac}|\otimes|0\rangle\langle 0| \\
&\quad+t\,|\mathrm{arrived}\rangle\langle\mathrm{arrived}|\otimes|1\rangle\langle 1|.
\end{aligned}
$$

Both are normalized. Expected occupied-hop fuel consumption is $rt/2$ on $B=1$. The no-arrival receiver state depends on $F$ because $\rho_{0}$ retains coherence whereas $\rho_1$'s no-arrival branch has control state $|0\rangle$. Thus “no token arrived” does not imply a target-independent record for this enlarged intervertex coupling.

The actual remote finite forecast is protected and returned by the post-commit receipt of Construction C.5e. The source scores its returned value against the original same-tick snapshot. Every fuel, environment, control and measurement record remains retained.

For explicit full resource ownership, enlarge Construction C.5e's source bound to $M''=M'+256$, $J''=J'+2$ and recompute $B'',S'',G'',T''$ by the same formulas. Put $W''=2W'$ and $Q''=J''W''$. For the explicit $t=1/2$ and $X$-readout witness below, the added records and stages cover the control qubit, local measurement/commitment records, occupied-involution flag and its fixed finite algebraic gate-setting descriptions. An arbitrary additional algebraic $t$/SLD instance needs its own finite description length and a corresponding parameter-dependent enlargement of $M''$; the $+256$ bound is not a uniform allowance for unbounded descriptions. The positive common charge is Construction C.5e's formula with these double-primed values; herald and serial-receipt fuel remain $rH$ and $brH$. Both the classical comparator and the controlled-hop candidate own this same reservation $C''$. Each auxiliary pulse has the same constant norm bound; the capacity and positive switching-throughput bounds therefore apply. All source costs are charged before choosing the candidate. No reset is performed.

#### 2. Complete receiver-measurement optimization for this family

For a balanced hidden sign $Z=2F-1$, put

$$
\begin{aligned}
\bar{\rho} &= (\rho_{0}+\rho_{1})/2, \\
\Delta &= (\rho_{1}-\rho_{0})/2.
\end{aligned}
$$

For any target POVM $\{E_m\}$, $p_m=\operatorname{Tr}(E_m\bar{\rho})$, and its posterior sign mean is $z_m=\operatorname{Tr}(E_m\Delta)/p_m$ on $p_{m}>0$. The proper Brier improvement is

$$
(\rho^{2}/16)\sum_{m}(\operatorname{Tr}(E_{m}\Delta))^{2}/\operatorname{Tr}(E_{m}\bar{\rho}).
$$

Let $L$ be the Hermitian solution of $(\bar{\rho}L+L\bar{\rho})/2=\Delta$ on the support. Hilbert-Schmidt Cauchy-Schwarz gives

$$
\begin{aligned}
&(\operatorname{Re}\operatorname{Tr}(E_{m}\bar{\rho}L))^{2} \\
&\quad\le\operatorname{Tr}(E_{m}\bar{\rho})\operatorname{Tr}(E_{m}L\bar{\rho}L).
\end{aligned}
$$

Summing proves the measurement bound $\sum p_m z_m^{2}\le\operatorname{Tr}(\bar{\rho}L^{2})$. The spectral measurement of $L$ attains equality, because on each spectral projection $\operatorname{Tr}(E_m\Delta)=l_m\operatorname{Tr}(E_m\bar{\rho})$. This proves the optimum over every POVM, not only a chosen readout basis.

For $0<t<1$, let $s=\sqrt{t(1-t)}$. On the vacuum control block,

$$
\begin{aligned}
\bar{\rho}_{\mathrm{vac}} &= \begin{bmatrix} 1-t & s/2 \\ s/2 & t/2 \end{bmatrix}, \\
\Delta_{\mathrm{vac}} &= \begin{bmatrix} 0 & -s/2 \\ -s/2 & -t/2 \end{bmatrix}, \\
L_{\mathrm{vac}} &= \begin{bmatrix} t & -2s \\ -2s & -t \end{bmatrix}/(2-t).
\end{aligned}
$$

On the arrival block $L=1$. Direct multiplication verifies the SLD equation. Since $L_{\mathrm{vac}}^{2}=t(4-3t)I/(2-t)^{2}$ and $\operatorname{Tr}(\bar{\rho}_{\mathrm{vac}})=(2-t)/2$,

$$
\begin{aligned}
g(t) &:= \max_{\mathrm{POVM}}\sum p_{m}z_{m}^{2} \\
&= t(3-2t)/(2-t).
\end{aligned}
$$

The limiting values are $g(0)=0$ and $g(1)=1$. Therefore the exact incremental potential, after optimizing the receiver, is

$$
F_{A}(t)=rt/2-A\,g(t)/16,\quad A=K E_{0}\rho^{2}.
$$

The identities $g'(t)=2-2/(2-t)^{2}$ and $g''(t)=-4/(2-t)^{3}$ show that $F_{A}$ is convex. If $A\le 16r/3$, $t=0$ is its unique minimizer and its minimum is zero. If $A>16r/3$,

$$
\begin{aligned}
t_{*} &= 2-\sqrt{A/(A-4r)}, \\
\min F_{A} &= r-5A/16+\sqrt{A(A-4r)}/4<0.
\end{aligned}
$$

The actual overall improvement is multiplied by the same source completion probability p. Arbitrary real t and POVMs form the analytic outer family. A specified algebraic t and its finite algebraic measurement are physically realizable using owned finite controls; that does not identify all continuous controls with a finite menu. SLD-optimal forecasts may require an enlarged algebraic score alphabet, so the exact SLD optimum is kept distinct from the original rational-grid realization below.

#### 3. A counterexample on the original finite forecast grid

Choose $K=20,H=2,n=1$ and $E_0=140r/361$ before reading the graph, so $\rho=19/20$ and $A=7r$. The graph has one enabled hop between the registered endpoints; $H$ is the common two-step inventory. Use $t=1/2$ and measure the receiver control in the $X$ basis on the no-arrival subspace, while distinguishing arrivals. The joint probabilities of $F$ and the three records are

| record | $P(F=0,\text{record})$ | $P(F=1,\text{record})$ | total |
|---|---:|---:|---:|
| arrival | 0 | 1/4 | 1/4 |
| minus | 0 | 1/8 | 1/8 |
| plus | 1/2 | 1/8 | 5/8 |

The posterior sign means are 1,1,-3/5, giving normalized gain 3/5 and expected occupied hops 1/4. The exact proper forecasts are

$$
\begin{aligned}
q_{\mathrm{arrival}} &= q_-=1/2+\rho/4=59/80, \\
q_+ &= 1/2-3\rho/20=143/400.
\end{aligned}
$$

Both lie in the original $D=4K^{H}=1600$ grid. The controlled candidate's incremental potential is

$$
r/4-(7r)(3/80)=-r/80.
$$

The fixed-channel classical minimum is zero, since $r/2-7r/16=r/16>0$. Thus the controlled operation strictly improves the prior in a source where that classical gate rejects service. The finite receipt returns indices 1180 and 572 respectively, so this is an actual scored source realization rather than an ideal unreturned posterior.

For comparison, the optimal SLD measurement at $t=1/2$ has $g=2/3$ and yields $-r/24$ at $A=7r$, on its enlarged algebraic-forecast branch. The rational $X$-readout witness above is sufficient for the original finite-grid counterexample.

#### 4. Coverage consequence

The fixed-channel window proof remains valid for its recorded-debit channel grammar with classically adaptive routes and local instruments. It cannot be promoted to every finite two-endpoint controlled interaction merely from a product source and a one-token label. The counterexample identifies the added source operator and its response explicitly. This is a constructive change of physical comparison class, and an exact solvable subfamily of that larger class; it is not a complete optimization over all coherent intervertex mechanisms or all network geometries.

<a id="proposition-c5i-owned-grid-probe-and-memberwise-curvature"></a>**Proposition C.5i (Owned Grid Probe and Memberwise Curvature).**

Use the grid-mask source and inventory of Theorem C.5f.

#### 2. Geometry of the retained grid

For the square grid $\{0,\dots,L\}^{2}$ with unit edge metric, Manhattan distance satisfies

$$
|x-y|_{2}\le d_{G}(x,y)\le\sqrt{2}\,|x-y|_{2}.
$$

For integer radii $1\le R\le L/2$, every vertex has an inward coordinate quadrant containing the rectangle with side lengths $\lfloor R/2\rfloor$, so its graph ball contains at least $(\lfloor R/2\rfloor+1)^{2}\ge R^{2}/4$ vertices. Its ball is contained in the coordinate square of side $2R+1$, hence has at most $9R^{2}$ vertices. For real $R>2$, $B(x,R)=B(x,\lfloor R\rfloor)$ and $\lfloor R\rfloor\ge R/2$, so the lower constant can be taken as $1/16$ and the upper as $9$, with $R_0=2$. Constants are independent of $L$, and $R_{\max}=L/2$ tends to infinity. This gives the required uniform two-dimensional polynomial growth on an expanding range and the linear-distance comparison used by C.5b(c).

The ordinary translation-symmetric nearest-neighbor kernel is not a source of a strictly positive scale-uniform Ollivier bound. A different finite local kernel can give a positive bound on each member, but that bound necessarily decreases with size under the local-support assumptions below.

#### 3. An explicit positive memberwise kernel

The lazy interface of Proposition C.3.3b applies: it applies (C.3) to $P_\alpha=\alpha I+(1-\alpha)P$, including $\alpha=1/2$. Proposition C.6c.2 likewise treats lazy kernels. These existing definitions are used only as the narrow kernel-type prerequisite; their separate curvature-to-continuum results are not used here. The nonlazy representative is the same normalized neighbor-only Ehrenfest law with denominator $2L$, followed by the registered idleness $1/2$.

For $z=(x,y)$, define a lazy Ehrenfest kernel on the full grid by

$$
\begin{aligned}
&P(z,z+e_{x})=(L-x)/(4L),\quad P(z,z-e_{x})=x/(4L), \\
&P(z,z+e_{y})=(L-y)/(4L),\quad P(z,z-e_{y})=y/(4L), \\
&P(z,z)=1/2.
\end{aligned}
$$

Boundary terms vanish automatically. These probabilities are nonnegative and sum to one. The kernel is an actual finite classical channel: choose uniformly one of 2L binary positions, reset it to a fresh fair bit, and retain the two block counts, or implement the resulting finite rational transition table directly. The preparation coin and all reset-old-bit records are retained; “reset” here denotes a reversible write into a fresh bit with the old value archived, not a cyclic thermodynamic erasure. A finite controlled neighbor transfer uses the same local edge and clock primitives as the other source modules. This is a separately owned geometry-probe interface; it does not alter the predictive noise law or optimize a different task by stealth.

For an adjacent pair $z,z+e_x$, use representative $2L$-bit configurations differing in exactly one first-block bit. Draw the same position and fair new bit in both configurations. With probability $1/(2L)$ the differing bit is selected and the two count outputs coincide; otherwise their count vectors remain adjacent. This is a coupling of the displayed marginals, so

$$
W_{1}(P_{z},P_{z+e_{x}})\le 1-1/(2L).
$$

The first-coordinate function is 1-Lipschitz and its two expected outputs differ by exactly 1-1/(2L), giving the reverse inequality. The same argument holds on vertical edges and at boundaries. Thus

$$
\kappa(z,z')=1/(2L)
$$

on every edge, with curvature variance zero. The invariant probability measure is $\pi(x,y)=2^{-2L}\binom{L}{x}\binom{L}{y}$, as follows from detailed balance on every neighbor edge. This binomial invariant measure is distinct from the counting volume in Definition C.1. The growth proof concerns vertex counts, and the transport curvature uses the displayed conditional laws with hop transport cost; neither identifies $\pi$ with uniform counting measure or a continuum Hausdorff measure.

This is a positive memberwise curvature certificate with one actual kernel. It is not a scale-independent positive lower bound as L tends to infinity.

If this optional probe is consumed, its full finite source ownership is added uniformly before graph comparison. A pretrial probe-vertex label w chooses the initial occupied probe register independently of every target bit. Reserve 2L count-witness bits, a fresh uniform-4L seed, their shadows and local endpoint records at every possible probe vertex, one extra timed probe stage after all forecasts have committed, and the same finite table/controlled-hop primitives. A move consumes one carried gap-r excitation through the occupied-hop map; a self-loop consumes that same excitation by a local padding transfer. Thus exactly one probe debit r is consumed on every branch. Prepare a fuel cell at every potential starting vertex and return the V-1 unselected excitations unchanged.

For explicit bounds add $100V(L+1)^{2}$ mutable bits to $M_{G}$, replace $J_{G}$ by $J_G+1$, and recompute $B,S,G,T,W,Q$ by the displayed formulas. Recompute their positive common cost and then add the distinct bare probe-energy term $r$. This owns both hardware/control services and the actual probe fuel. The probe uses the actual local core-controlled frame, restored on decoding, and retains its frame/core record. The preparation is the occupied position basis state at $w$ with the owned seed; the step channel is the controlled neighbor/self-loop permutation; the target operator for endpoint $z$ is its local occupied-pointer effect. Its response is exactly $\operatorname{Tr}(E_z\Phi(|w\rangle\langle w|))=P(w,z)$. Composition of these finite primitive squares is the required source-to-kernel map. Its one-step duration is the same $\tau$, after the prediction phase, so it neither changes the earlier source noise nor supplies prediction information.

Missing edges on other masks redirect the corresponding attempted move to a retained self-loop with the same r debit; every mask has a normalized actual probe. The positive-curvature computation is asserted only on the full grid. The enlarged common reservation is fixed for all candidates and changes no predictive comparison. No empirical or unpriced bath is used.

#### 4. Why a fixed positive local-kernel floor cannot be hidden in an unbounded grid

Let a connected graph have one-step laws $P_{x}$ supported within graph distance 1 of x and suppose every adjacent edge has Ollivier curvature at least a single $\kappa_*>0$. The triangle inequality along a shortest path gives

$$
W_{1}(P_{x},P_{y})\le(1-\kappa_{*})\,d_{G}(x,y).
$$

Also $W_1(\delta_x,P_x)\le 1$ and $W_1(P_y,\delta_y)\le 1$. Hence

$$
\begin{aligned}
d_{G}(x,y) &\le 2+(1-\kappa_{*})\,d_{G}(x,y), \\
\operatorname{diam}(G) &\le 2/\kappa_{*}.
\end{aligned}
$$

This elementary diameter bound proves that an unbounded-hop family with this uniformly local kernel cannot have a scale-independent positive $\kappa_*$. More generally, a uniform jump-radius bound $R$ gives $\operatorname{diam}\le 2R/\kappa_*$. Thus the distinction between positive memberwise and positive uniform-in-scale curvature is mathematically essential. A full C.3-admission decision must read its intended quantifier or supply a different physical metric/kernel/jump-range record; it cannot assign a constant curvature floor to the existing source.

<a id="theorem-c5j-pce-optimal-reliability-expenditure-on-a-classical-erasure-route"></a>**Theorem C.5j (PCE-Optimal Reliability Expenditure on a Classical Erasure Route).** Fix $p,s\in(0,1)$ and a route with $N\ge1$ hops. At hop $j$, transmit $k_j\ge1$ independent copies of a classical symbol through erasure channels of erasure probability $p$, retaining the symbol when at least one copy survives. Erasure is absorbing between hops. Reserve every slot, including those after an earlier erasure, and charge the formal source-complete module ledger
$$
C(k)=c_0+c\sum_{j=1}^Nk_j,\qquad c>0,\quad c_0\ge0.
\tag{C.5j.1}
$$
The module price includes transmission, classical copying, decoding, ancilla cleanup and reset. The final module, priced $c_0$, independently erases a surviving symbol with probability $1-s/F(k)$, where $F(k)=\prod_j(1-p^{k_j})\ge s$. Every feasible allocation then has exactly the same retained endpoint erasure channel with survival $s$.

On this response-equivalent formal comparison class PCE minimizes the total slot count. For $B\ge N$, write $B=Nq+r$ with $0\le r<N$. The exact best survival and least budget are
$$
F_N(B)=(1-p^q)^{N-r}(1-p^{q+1})^r,\qquad
B_*(N;p,s)=\min\{B\ge N:F_N(B)\ge s\}.
\tag{C.5j.2}
$$
The maximizing allocations have $r$ entries $q+1$ and $N-r$ entries $q$, up to permutation. The minimum is finite, $F_N$ is strictly increasing, and $B_*(N+1)\ge B_*(N)+1$. With $\eta=-\ln p$ and $x_N=-\ln(1-s^{1/N})/\eta$,
$$
\lceil Nx_N\rceil\le B_*(N;p,s)\le N\lceil x_N\rceil,
\qquad B_*(N;p,s)=\frac{N\ln N}{\eta}+O_{p,s}(N).
\tag{C.5j.3}
$$
Consequently a benchmark route of length $\lceil c_{\mathrm{hop}}L\rceil$ has attained PCE budget $c_0+cB_*(\lceil c_{\mathrm{hop}}L\rceil;p,s)=O(L\ln L)$. This budget retains every route no longer than the benchmark and excludes routes of length at least $aL^\gamma$, $a>0$, $\gamma>1$, for sufficiently large $L$.

*Proof.* The finite stochastic erasure, classical copier and decoder compose to survival $F(k)$; final attenuation makes it $s$. These maps also act as CPTP maps on diagonal classical algebras. Let $g(x)=\ln(1-e^{-\eta x})$. Then $g'>0$ and $g''=-\eta^2e^{\eta x}/(e^{\eta x}-1)^2<0$. Replacing a pair $k_i\ge k_j+2$ by $k_i-1,k_j+1$ strictly increases $\sum_jg(k_j)$ while decreasing the integer $\sum_jk_j^2$. Iteration terminates at precisely the balanced allocations in (C.5j.2), proving both optimum and equality class. An extra slot strictly increases survival, and balanced survival tends to one with $B$, proving existence and monotonicity. Removing a hop from a feasible $(N+1)$-hop route preserves feasibility and removes at least one slot, giving the asserted inequality for $B_*$.

Jensen's inequality gives $\ln F(k)\le Ng(B/N)$, so feasibility implies $B\ge Nx_N$. Taking all $k_j=\lceil x_N\rceil$ gives the upper bound. If $a_s=-\ln s$, then $1-s^{1/N}=a_s/N+O(N^{-2})$ and $x_N=[\ln N-\ln a_s]/\eta+O(N^{-1})$. Rounding costs less than $N$, proving the asymptotic. For large $L$, $aL^\gamma>\lceil c_{\mathrm{hop}}L\rceil$, so strict budget monotonicity proves discrimination. ∎

This is a formal operation-cost realization with fixed endpoint performance. Its independently specified module contract supplies the costs, including the final biased ancilla. The same task with $M(L)$ independently charged messages multiplies the route ledger by $M(L)$, so extensive $M(L)\asymp L^D$ needs order $L^{D+1}\ln L$. Classes with correlated erasures, shared routing or other coding operations require their own comparison census and module costs. The remaining question is whether that enlarged MPU source class retains the derived ordering and discriminates the intended irregularity classes.

<a id="theorem-c5k-non-polynomial-growth-global-minimizers-among-nearest-neighbor-masks"></a>**Theorem C.5k (Non-polynomial-growth global minimizers among nearest-neighbor masks).**

Use the entire nearest-neighbor mask comparison of Theorem C.5f, with its actual source, complete all-pair policy table, common full positive ledger and parameter sequence
$$
m\ge64,\qquad L=2m^2,\quad K=m^3,\quad V=(L+1)^2,\quad H=V-1,\quad E_0=r.
$$
Let $A_L$ have vertex set $\{0,\ldots,L\}^2$, all vertical grid edges, and only the horizontal grid edges on rows $y=0$ and $y=L$. Then:

1. $\operatorname{diam}A_L=2L$, so $A_L$ is an exact global minimizer over every connected nearest-neighbor mask and every protocol admitted by Theorem C.5f.
2. The family $A_L$ fails Definition C.1 for every real $D\ge1$, every fixed positive pair of volume constants, and every permitted expanding cutoff. In particular it fails geometric regularity regardless of its curvature convention.
3. The same conclusion holds for the full locally adaptive quantum-instrument comparison of Theorem C.5g, including all internally coherent two-endpoint services, pre-existing source-independent entanglement and recorded stopping, with $\sigma=E_0$ and the same $K,L,H,V$. All common hardware, service, herald, receipt and clock charges remain those of Theorem C.5g.

*Proof.* If two vertices $(x,y),(x',y')$ are in different columns, every horizontal movement must occur on one of the two boundary rows. A route using the lower row has length $|x-x'|+y+y'$, and a route using the upper row has length $|x-x'|+2L-y-y'$. Multiple boundary switches cannot shorten either route: the first passage from one boundary to the other already costs $L$, and the total necessary horizontal movement is at least $|x-x'|$. Equivalently, any route has a first horizontal edge at a boundary and either stays with that boundary or pays an additional full vertical traverse. Thus
$$
d_{A_L}((x,y),(x',y'))=|x-x'|+\min\{y+y',2L-y-y'\}\quad(x\ne x').
$$
For vertices in one column the vertical path gives distance $|y-y'|$. Since $\min\{a,2L-a\}\le L$, all distances are at most $2L$; opposite corners have Manhattan distance $2L$, so equality holds.

Every nearest-neighbor mask has opposite-corner distance at least $2L$. By Theorem C.5f the attained all-pair objective is
$$
v(d)=C_G+KE_0/4+p\min\{0,rd/2-KE_0\rho^{2d}/16\},\qquad \rho=1-1/K,
$$
at $d=\operatorname{diam}G$. The inner service expression is strictly increasing in $d$, and it is strictly negative at $2L$ on the stated parameter sequence. Therefore precisely the diameter-$2L$ masks are global minimizers. The displayed $A_L$ belongs to that full equality class. Its complete all-pair shortest-route policy is one of the already reserved finite tables.

For the growth claim use unit hop length first. Suppose Definition C.1 held with $R_0,K_1,K_2,D$ and expanding cutoffs $R_{\max,L}$. The source has $\delta_{\mathrm{eff},L}=1$, so $R_{\max,L}\to\infty$. Choose integers
$$
r_L=\left\lfloor\min\{L/8,R_{\max,L}/2\}\right\rfloor\longrightarrow\infty.
$$
Eventually $r_L>R_0$ and both balls below lie in the asserted range. Put $x_L=\lfloor L/2\rfloor$, $z_L=(x_L,\lfloor L/2\rfloor)$, and $b_L=(x_L,0)$. The ball around $z_L$ cannot reach either horizontal row; it is exactly a vertical interval with
$$
|B(z_L,r_L)|=2r_L+1.
$$
The ball around $b_L$ cannot reach the top row or either side boundary. Its vertices are exactly the points with $|x-x_L|+y\le r_L$, giving
$$
|B(b_L,r_L)|=\sum_{h=-r_L}^{r_L}(r_L-|h|+1)=(r_L+1)^2.
$$
Definition C.1 would bound the ratio of any two radius-$r_L$ ball volumes by $K_2/K_1$. But
$$
\frac{|B(b_L,r_L)|}{|B(z_L,r_L)|}=\frac{(r_L+1)^2}{2r_L+1}\longrightarrow\infty.
$$
This is a contradiction independent of the proposed exponent. Multiplying every edge length and $\delta_{\rm eff}$ by the same positive source unit leaves the normalized argument unchanged.

For Theorem C.5g, its complete all-instrument lower bound and attained one-label witness give exactly the same function $v(d)$ with $r$ replaced by $\sigma$ and $C_G$ by $C_S$. The all-pair table argument of Theorem C.5f applies after this replacement, as Theorem C.5g states. With $\sigma=E_0$, the strict service inequality at $2L$ is unchanged. This is an optimum over the whole recorded-service quantum grammar of Theorem C.5g. The map and all source ownership are inherited from its finite Stinespring/pulse construction, with the concrete mask $A_L$. ∎

**Consequence.** The diameter window of Theorem C.5f excludes the long snake but not every failure of uniform polynomial volume growth: on these sources some global minimizing masks fail Definition C.1, so regularity in the sense of Definition C.1 requires a selection beyond the diameter window.

<a id="theorem-c5l-bounded-coupling-all-pair-forecast-source-an-exponential-growth-wiring-below-every-polynomial-growth-family"></a>**Theorem C.5l (Bounded-Coupling All-Pair Forecast Source: An Exponential-Growth Wiring Below Every Polynomial-Growth Family).** Fix a degree capacity $\Delta\ge4$, a coupling bound $J>0$, the tick $\delta=\pi\hbar/J$, a score quantum $E_0>0$, an action price $a>0$ and a completion probability $p\in(\tfrac12,1]$. For $k\ge1$ put $N=2^k$ and $\rho=1-1/N$. The source is declared before any wiring is chosen.

1. **Wirings.** A wiring is a simple connected graph $G$ on $N$ labelled vertices of maximum degree at most $\Delta$. Vertex $v$ carries a finite-dimensional Hilbert factor $\mathcal H_v$ containing its core, registers, records, fuel and clock.
2. **Mechanisms.** A protocol $\pi$ on $G$ evolves $\bigotimes_v\mathcal H_v$ by a piecewise continuous Hamiltonian
$$
H_G(t)=\sum_vh_v(t)+\sum_{e\in E(G)}h_e(t),\qquad\|h_e(t)\|\le J,
\tag{C.5l.1}
$$
with $h_v(t)$ acting on $\mathcal H_v$ and $h_e(t)$ on the two endpoint factors of $e$. The bound $J$ applies to the whole interaction carried by an edge, coherent controls and parallel wires included. Local instruments and local adaptive control are unitaries on the local factor with retained records, classical communication between vertices passes through the couplers $h_e$, and states shared between vertices before the task are admitted.
3. **Task.** An ordered pair $(s,t)$, $s\ne t$, is drawn uniformly and announced before the task; schedules may depend on it. A public flag $B$ has $P(B=1)=p$. A fair bit $F$ is held at $s$, the retained target has $P(Y_0=1\mid F,B)=\tfrac12+B(2F-1)/4$, and $Y_j=Y_{j-1}\oplus A_j$ for $1\le j\le N$ with independent noise bits $A_j$ of probability $1/(2N)$. The global states prepared for $F=1$ and for $F=0$ differ by a unitary on $\mathcal H_s$, and $(Y_0,A_1,\dots,A_N)$ is conditionally independent of every record of the protocol given $(F,B)$.
4. **Commitment.** The receiver $t$ latches a stopping tick $\tau\in\{0,\dots,N\}$ and a forecast $q\in[0,1]$ by an instrument on $\mathcal H_t$ at time $\tau\delta$. Without a commitment the evaluator records $(\tau,q)=(N,\tfrac12)$.
5. **Ledger.** The evaluator runs on every branch and transfers the score energy $NE_0$ to the useful receiver with probability $1-(q-Y_\tau)^2$. Let $C_k$ be the reservation common to all wirings and protocols, exclusive of the score energy, and $D_\pi\ge0$ the separately metered operating debit, in which every elementary pulse of duration $\delta$ and every latched record bit costs at most $a$. The complete ledger net of the expected useful output is
$$
V(\pi)=C_k+D_\pi+NE_0\,\mathbb E\bigl[(q-Y_\tau)^2\bigr].
\tag{C.5l.2}
$$

Put $v_\Delta=4e\Delta J/\hbar$, so that $v_\Delta\delta=4\pi e\Delta$, and $L_{\mathrm{ideal}}=\tfrac14-\tfrac p{16}$. Then:

(i) **Signalling bound.** For every protocol on $G$, every time $T\ge0$ and every record $R_0$ produced by an instrument on $\mathcal H_t$ at time $T$,
$$
\mathrm{TV}\bigl(P(R_0\mid F=0),P(R_0\mid F=1)\bigr)\le\exp\bigl(v_\Delta T-d_G(s,t)\bigr).
\tag{C.5l.3}
$$

(ii) **Loss floor on polynomial-growth wirings.** Let $C_g>0$ and $D\ge1$, put
$$
d_0=\Bigl\lfloor\Bigl(\frac{N-1}{2C_g}\Bigr)^{1/D}\Bigr\rfloor-1,\qquad
n_0=\min\Bigl\{\Bigl\lfloor\frac{d_0}{2v_\Delta\delta}\Bigr\rfloor,\Bigl\lfloor\frac N2\Bigr\rfloor\Bigr\},
$$
and let $G$ satisfy $|B_G(u,r)|\le C_g(1+r)^D$ for all vertices $u$ and all integers $0\le r\le d_0$. If $n_0\ge1$ and $e^{-d_0/2}\le\tfrac12$, every protocol $\pi$ on $G$ has
$$
\mathbb E\bigl[(q-Y_\tau)^2\bigr]\ge L_{\mathrm{ideal}}+\frac{n_0}{128N},\qquad
V(\pi)\ge C_k+NE_0L_{\mathrm{ideal}}+\frac{E_0n_0}{128}.
\tag{C.5l.4}
$$

(iii) **Shift protocol on the de Bruijn wiring.** Let $D_k$ be the simple graph on the binary words $x=x_1\cdots x_k$ whose edges join $x$ to $x_2\cdots x_kb$, $b\in\{0,1\}$, whenever the two words differ. It has maximum degree at most four. The protocol $\pi_D$ copies $F$ into a message qubit at $s$ and applies, at tick $j=1,\dots,k$, the swap of the message qubits across $\{x^{j-1},x^j\}$, where $x^j=s_{j+1}\cdots s_kt_1\cdots t_j$, whenever $x^{j-1}\ne x^j$. The receiver commits at $\tau=k+1$ with $q=\tfrac14+\tfrac F2$ on $B=1$ and $q=\tfrac12$ on $B=0$. This protocol belongs to the class of item 2, and
$$
\mathbb E\bigl[(q-Y_\tau)^2\bigr]=L_{\mathrm{ideal}}+\frac{p\,(1-\rho^{k+1})}{8}\le L_{\mathrm{ideal}}+\frac{k+1}{8N},\qquad
V(\pi_D)\le C_k+NE_0L_{\mathrm{ideal}}+\frac{E_0(k+1)}8+a(2k+4).
\tag{C.5l.5}
$$

(iv) **Strict comparison.** For fixed $C_g,D,\Delta,J,E_0,a,p$ and every sequence of wirings $G_k$ obeying the ball bound of (ii),
$$
V(\pi_D)-\inf_{\pi\ \mathrm{on}\ G_k}V(\pi)\le a(2k+4)+\frac{E_0(k+1)}8-\frac{E_0\,n_0(k)}{128}<0
\tag{C.5l.6}
$$
for all sufficiently large $k$, because $n_0(k)\ge c\,2^{k/D}$ with a constant $c>0$ depending only on $C_g$, $D$ and $\Delta$.

(v) **Growth of the winner.** $|B_{D_k}(x,r)|\ge2^r$ for $0\le r\le k$ and $\operatorname{diam}D_k\le k$. On the unit-weight calibration $d_{\mathcal N}=\delta_{\mathrm{eff}}\,d_G$ the family $D_k$ violates the upper bound in (C.1) for every dimension $D$, every constant $K_2$ and every expanding window.

*Proof.* (i) The estimate is the Lieb–Robinson iteration (Lieb and Robinson 1972; Nachtergaele and Sims 2010) for the time-dependent edge terms. In the interaction picture of the on-site terms each $h_e(t)$ is replaced by a term with the same support and norm, the on-site terms disappear, and an operator on one factor stays an operator of the same norm on that factor. Let $U(t)$ be the resulting propagator and let $A$ act on $\mathcal H_s$ with $\|A\|\le1$. For a vertex set $Z$ put $C(Z,t)=\sup\|[U(t)^*OU(t),A]\|$ over operators $O$ of norm at most one on $\bigotimes_{v\in Z}\mathcal H_v$. With $H_Z(t)$ the sum of the edge terms meeting $Z$, the function $f(t)=[U(t)^*OU(t),A]$ obeys, by the Jacobi identity,
$$
f'(t)=\frac i\hbar\bigl[U^*H_Z(t)U,f(t)\bigr]-\frac i\hbar\bigl[U^*OU,[U^*H_Z(t)U,A]\bigr].
$$
The first term generates a norm-preserving evolution, so
$$
C(Z,t)\le C(Z,0)+\frac{2J}\hbar\sum_{e\cap Z\ne\emptyset}\int_0^tC(e,u)\,du .
$$
Here $C(Z,0)\le2$ when $s\in Z$ and $C(Z,0)=0$ otherwise. Iterating from $Z=\{t\}$ gives
$$
\bigl\|[U(T)^*OU(T),A]\bigr\|\le2\sum_{n\ge1}\frac{(2JT/\hbar)^n}{n!}\,c_n,
$$
where $c_n$ is the number of edge chains $e_1,\dots,e_n$ with $t\in e_1$, $e_i\cap e_{i+1}\ne\emptyset$ and $s\in e_n$. Such a chain has $n\ge d:=d_G(s,t)$, and $c_n\le\Delta(2\Delta-1)^{n-1}\le(2\Delta)^n$. Since $\mathbb 1_{n\ge d}\le e^{n-d}$, the right-hand side is at most $2\exp(v_\Delta T-d)$. Let $W$ be the unitary on $\mathcal H_s$ relating the two prepared states, $\varrho_0$ the state prepared for $F=0$, and $E$ a sum of effects of the instrument on $\mathcal H_t$. Then
$$
P(E\mid F=1)-P(E\mid F=0)=\operatorname{tr}\varrho_0W^*\bigl[U(T)^*(E-\tfrac12)U(T),W\bigr],
$$
and $\|E-\tfrac12\|\le\tfrac12$ gives the bound $\exp(v_\Delta T-d)$ for every such $E$, which is (C.5l.3).

(ii) Condition on $B=1$ and write $z(R)=\mathbb E[2F-1\mid R]$ for the latched record $R$, which contains $\tau$ and $q$. For a fair bit, $\mathbb E|z(R)|=\mathrm{TV}(P(R\mid F=0),P(R\mid F=1))$ and $z^2\le|z|$. Item 3 gives $\mathbb E[Y_j-\tfrac12\mid F,B=1]=\rho^j(2F-1)/4$ and hence $\mathbb E[Y_\tau-\tfrac12\mid R,B=1]=\rho^\tau z(R)/4$. The Brier loss on $B=1$ is therefore at least $\tfrac14-\mathbb E[\rho^{2\tau}z(R)^2]/16$, and on $B=0$ it is at least $\tfrac14$ because $Y_\tau$ is then a fair bit independent of the record. Thus every protocol has loss at least $L_{\mathrm{ideal}}$ on every pair. Let $d_G(s,t)>d_0$ and let $R_0$ be the record at time $n_0\delta$ that equals $R$ when $\tau<n_0$ and a blank symbol otherwise. The latch makes $R_0$ the outcome of an instrument on $\mathcal H_t$ at time $n_0\delta$, and $v_\Delta n_0\delta\le d_0/2$, so (C.5l.3) gives
$$
\mathbb E\bigl[z(R)^2\mathbb 1_{\tau<n_0}\bigr]\le\mathbb E\,z(R_0)^2\le\epsilon:=e^{-d_0/2}.
$$
With $\alpha=\rho^{2n_0}$,
$$
\mathbb E\bigl[\rho^{2\tau}z(R)^2\bigr]\le\alpha\,\mathbb E\,z(R)^2+(1-\alpha)\,\mathbb E\bigl[z(R)^2\mathbb 1_{\tau<n_0}\bigr]\le\alpha+(1-\alpha)\epsilon,
$$
so the loss on such a pair is at least $L_{\mathrm{ideal}}+p(1-\alpha)(1-\epsilon)/16$. The ball bound at $r=d_0$ gives $|B_G(s,d_0)|\le C_g(1+d_0)^D\le(N-1)/2$, so at least half of the ordered pairs have $d_G(s,t)>d_0$. Averaging over pairs with $\epsilon\le\tfrac12$ and $p>\tfrac12$ gives loss at least $L_{\mathrm{ideal}}+(1-\alpha)/128$, and $1-\alpha\ge1-e^{-2n_0/N}\ge n_0/N$ because $2n_0\le N$. The bound on $V$ follows from $D_\pi\ge0$.

(iii) The word $x^j$ is $x^{j-1}$ with its first letter deleted and $t_j$ appended, so consecutive distinct words are adjacent in $D_k$, $x^0=s$ and $x^k=t$; a vertex has at most two neighbours of each orientation. For an involution $P$ the Hamiltonian $(J/2)(I-P)$ has norm at most $J$ and $\exp(-i\delta(J/2)(I-P)/\hbar)=P$. The copy is such an on-site pulse and each swap is such an edge pulse obeying (C.5l.1), and the schedule depends only on the announced pair. After tick $k$ the message qubit at $t$ holds $F$. On $B=1$, $P(Y_\tau=1\mid F=1)=\tfrac12+\rho^\tau/4$, so the forecast $q=\tfrac14+\tfrac F2$ has loss $\tfrac5{16}-\rho^\tau/8=\tfrac3{16}+(1-\rho^\tau)/8$; on $B=0$ the loss is $\tfrac14$. Averaging over $B$ at $\tau=k+1$ gives the displayed value, and $1-\rho^{k+1}\le(k+1)/N$. The metered actions are one copy pulse, at most $k$ swap pulses and the $k+3$ latched bits of $(\tau,q)$.

(iv) Subtract (C.5l.4) from (C.5l.5). For large $k$, $d_0\ge\tfrac12(2^{k}/(4C_g))^{1/D}$ and $n_0=\lfloor d_0/(8\pi e\Delta)\rfloor$, which exceeds every polynomial in $k$.

(v) Appending the $2^r$ binary words of length $r$ to $x$ reaches $2^r$ distinct vertices in at most $r$ steps, and $r=k$ reaches every vertex. A window of normalized radii of diverging length inside $[0,k]$ contains radii $r\to\infty$, at which $2^{\lfloor r\rfloor}\le K_2r^D$ fails. ∎

Theorem C.5l covers every coherent, adaptive and pre-entangled mechanism within the edge-norm capability (C.5l.1): on this source the complete ledger places a wiring of exponential ball growth strictly below every bounded-degree family of polynomial growth with fixed $(C_g,D)$, the square torus at even $k$, with $(C_g,D)=(4,2)$, included. The score stake $NE_0$, the noise rate $1/(2N)$ and the horizon $N$ are source rules fixed before the wiring, and the cap $J$ is a declared apparatus capability. The comparison is memberwise in $(C_g,D,\Delta)$; families whose ball bound holds only below the radius $d_0(k)$, constants growing with $k$, couplers of unbounded aggregate strength and a wire-length tariff define other source classes.

<a id="theorem-c5m-all-pair-literal-hop-ledger-ordering-by-distance-sum"></a>**Theorem C.5m (All-Pair Literal Hop Ledger: Ordering by Distance Sum).** On the ledger class of Theorem C.5b, item 3, let a connected wiring $G$ on $N\ge3$ vertices carry in each registered period $T$ exactly one charged transmission for every ordered pair $(s,t)$, $s\ne t$, each routed along a path of $G$ and charged $r>0$ per hop. Put $P=N(N-1)$ and
$$
H(G)=\sum_{s\ne t}d_G(s,t).
\tag{C.5m.1}
$$
The least ledger of $G$ is $V_{\mathrm{prop}}(G)=rH(G)/T$, attained by geodesic routing, with $M=P/T$ and $\bar N=H(G)/P$ in the notation of Theorem C.5b. RE holds exactly when $H(G)\le V_{\max}T/r$, so every budget gate that retains $G$ retains every wiring of smaller distance sum. Moreover:

(i) **No degree bound.** $H(G)\ge P$, with equality only for the complete graph $K_N$, and $H(G)\ge P+2$ for every other wiring, with equality for $K_N$ minus one edge. $K_N$ has diameter one and admits no window of Definition C.1.

(ii) **Short wirings at bounded degree.** The heap tree $T_N$ on $\{0,\dots,N-1\}$ with parent $\lfloor(v-1)/2\rfloor$ has maximum degree at most three and $H(T_N)\le2P\lfloor\log_2N\rfloor$. For $N=2^k$ the de Bruijn wiring $D_k$ of Theorem C.5l has $H(D_k)\le Pk$. On the unit-weight calibration $d_{\mathcal N}=\delta_{\mathrm{eff}}\,d_G$ both families violate the upper bound in (C.1) on every expanding window.

(iii) **One-scale cover bound.** If every ball of hop radius $r\ge1$ in $G$ has at most $b\ge2$ vertices, then $|B_G(v,mr)|\le b^m$ for every vertex $v$ and every $m\ge1$, and
$$
H(G)\ge\frac P2\,r\,m_*,\qquad m_*=\Bigl\lfloor\frac{\ln(N/2)}{\ln b}\Bigr\rfloor.
\tag{C.5m.2}
$$

(iv) **Polynomial-growth families lie above the tree.** Let $G_N$ satisfy the upper bound in (C.1) on the unit-weight calibration $d_{\mathcal N_N}=\delta_{eff,N}\,d_{G_N}$ with $\sup_NR_0/\delta_{eff,N}<\infty$. Then $H(G_N)/(P\log_2N)\to\infty$. Consequently, at every degree capacity $\Delta\ge3$ and for all large $N$, $H(G_N)>H(T_N)$: every budget that retains $G_N$ retains $T_N$, and no sequence of minimizers of $H$ among connected wirings of maximum degree at most $\Delta$ satisfies Definition C.1 with bounded $R_0/\delta_{eff,N}$.

(v) **Degree capacity two.** The connected wirings of maximum degree at most two are the path $P_N$ and the cycle $C_N$, with
$$
H(C_N)=N\Bigl\lfloor\frac{N^2}4\Bigr\rfloor<\frac{N(N^2-1)}3=H(P_N).
$$
Budgets with $N\lfloor N^2/4\rfloor\le V_{\max}T/r<N(N^2-1)/3$ retain exactly the cycle, which satisfies Definition C.1 with $D=1$.

(vi) **Necessity of the bounded lower cutoff in (iv).** Let $L=\lceil N^{1/3}\rceil$, $M=N-2L$ and $h=2\lfloor\log_2M\rfloor$, and attach a path of $L$ new vertices to each of two leaves of $T_M$. With unit weights, $\delta_{eff,N}=1/(L+h)$, $R_0=1$ and $R_{max,N}=\tfrac32L\,\delta_{eff,N}$, this tree on $N$ vertices has maximum degree three and satisfies both bounds of (C.1) with $D=3$, $K_1=1/54$ and $K_2=1$ for all large $N$, while $H\le P\,(h+o(1))$.

*Proof.* A transmission from $s$ to $t$ uses at least $d_G(s,t)$ hops and item 3 of Theorem C.5b charges $r$ for each, so the ledger per period is at least $rH(G)$, with equality for geodesic routes; the RE statement is item 3 with $M\bar N=H(G)/T$.

(i) Every distance is at least one, with equality exactly for adjacent pairs, and a non-adjacent pair contributes at least two in each order; in $K_N$ minus one edge the two endpoints are joined through a third vertex. Definition C.1 requires $R_{max,n}\le\operatorname{diam}$ and $(R_{max,n}-R_0)/\delta_{eff,n}\to\infty$, which a family of diameter one hop excludes.

(ii) The depth of $v$ in $T_N$ is $\lfloor\log_2(v+1)\rfloor\le\lfloor\log_2N\rfloor$, so two vertices are joined through the root by at most $2\lfloor\log_2N\rfloor$ hops; a vertex has one parent and at most two children. In $D_k$ the shift route of Theorem C.5l joins every ordered pair in at most $k$ hops. For a radius $q\ge1$ at most the diameter, the ball of radius $q$ about the root of $T_N$ has at least $2^{q/2}$ vertices, and $|B_{D_k}(x,q)|\ge2^{\lfloor q\rfloor}$; an expanding window contains radii $q\to\infty$, at which $K_2q^D$ is smaller.

(iii) A geodesic of length at most $(m+1)r$ from $v$ passes through a vertex of $B_G(v,mr)$ within $r$ hops of its endpoint, so $B_G(v,(m+1)r)\subseteq\bigcup_{u\in B_G(v,mr)}B_G(u,r)$ and $|B_G(v,mr)|\le b^m$ by induction. Since $b^{m_*}\le N/2$, at least $N/2$ vertices lie farther than $m_*r$ from each $v$, and $H(G)\ge N\cdot\tfrac N2\cdot m_*r$.

(iv) Let $\varrho_0=\sup_NR_0/\delta_{eff,N}$ and fix an integer $r>\varrho_0$. Since $(R_{max,N}-R_0)/\delta_{eff,N}\to\infty$, the hop radius $r$ lies in the window for all large $N$, and every ball of hop radius $r$ then has at most $b_r=\max\{2,\lfloor K_2r^D\rfloor\}$ vertices. By (C.5m.2),
$$
\frac{H(G_N)}P\ge\frac r2\Bigl(\frac{\ln(N/2)}{\ln b_r}-1\Bigr),
$$
so $\liminf_NH(G_N)/(P\ln N)\ge r/(2\ln b_r)$, which is unbounded in $r$. Choosing $r$ with $r/(2\ln b_r)\ge3/\ln2$ gives $H(G_N)/P\ge3\log_2(N/2)-r/2>2\log_2N\ge H(T_N)/P$ once $\log_2N>3+r/2$. The tree $T_N$ belongs to every census with $\Delta\ge3$, so a minimizer has distance sum at most $H(T_N)$ and cannot be $G_N$.

(v) A connected graph of maximum degree at most two is a path or a cycle. In $C_N$ the distances from a vertex sum to $\lfloor N^2/4\rfloor$; in $P_N$ the ordered pairs at distance $d$ number $2(N-d)$, and $2\sum_{d=1}^{N-1}d(N-d)=N(N^2-1)/3$, which exceeds $N^3/4$ for $N\ge3$. In $C_N$ the ball of hop radius $q\ge1$ below $N/2$ has $2\lfloor q\rfloor+1\in[q,3q]$ vertices.

(vi) A leaf of $T_M$ acquires degree two, so the maximum degree is three. Every vertex is within $L$ hops of the core $T_M$, whose diameter is at most $h$, so every ball of hop radius $q>L+h$ contains the $M$ core vertices and $M\le|B|\le N$. The normalized window is $L+h<q\le\tfrac32L$; its length $L/2-h$ diverges and $\tfrac32L$ is below the diameter, which is at least $2L$. For large $N$, $M\ge N/2$ and $N\le L^3\le8N$, so $\tfrac1{54}q^3\le\tfrac1{54}\cdot\tfrac{27}8L^3\le\tfrac N2\le M$ and $N\le L^3\le q^3$. Finally $H\le M(M-1)h+4ML(L+h)+4L^2(2L+h)$, counting core pairs, core–tail pairs and tail pairs, and the last two terms are $o(P)$. ∎

On the literal all-pair ledger the distance sum is the whole PCE ordering. Without a degree bound it selects $K_N$; at degree capacity at least three it places an exponential-growth tree below every bounded-cutoff polynomial-growth family, so the window of Theorem C.5b(c) on this class separates regular families from wirings with longer routes and from no wiring with shorter ones; at degree capacity two it selects the cycle. Item (vi) shows that Definition C.1 with $R_0/\delta_{eff,N}\to\infty$ admits families whose mean distance is logarithmic.

<a id="theorem-c5n"></a>

<a id="theorem-c5n-euclidean-wire-length-bound-from-edge-expansion"></a>**Theorem C.5n (Euclidean Wire-Length Bound from Edge Expansion).** Let a finite connected undirected graph $G=(V,E)$ have $N\ge2$ vertices, maximum degree at most $\Delta$, and edge expansion
$$
|\partial_E S|\ge h\min\{|S|,N-|S|\}\qquad(S\subseteq V).
\tag{C.5n.1}
$$
Place its vertices at points $x_v\in\mathbb R^D$, with $D\ge1$, and suppose the placement has packing bound $\#\{v:x_v\in B(x,R)\}\le C_D(1+R/a)^D$ for every $x$ and $R\ge0$, where $a>0$ is a length unit. With $R_N=a[(N/(2C_D))^{1/D}-1]_+$, the installed wire length and mean edge length satisfy
$$
W(G)=\sum_{\{u,v\}\in E}\|x_u-x_v\|_2\ge \frac{hNR_N}{2\sqrt D},
\qquad
\frac{W(G)}{|E|}\ge \frac{hR_N}{\Delta\sqrt D}.
\tag{C.5n.2}
$$
On a maintenance ledger $\kappa_0|E|+\kappa_1W(G)/a$ with fixed $\kappa_0\ge0$ and $\kappa_1>0$, this separates fixed-degree families with $h$ bounded away from zero from nearest-neighbor grid comparators at spacing $a$ whenever both are admitted at the same sizes. Logarithmic hop diameter alone does not give (C.5n.2) with a uniform positive $h$.

*Proof.* For coordinate $j$ and threshold $s$, write $S_j(s)=\{v:x_{v,j}>s\}$ and let $m_j$ be a median of the coordinates. Integration of the indicator that an edge crosses the threshold gives
$$
\sum_{\{u,v\}\in E}|x_{u,j}-x_{v,j}|
=\int_{\mathbb R}|\partial_E S_j(s)|\,ds
\ge h\int_{\mathbb R}\min\{|S_j(s)|,N-|S_j(s)|\}\,ds
=h\sum_v|x_{v,j}-m_j|.
\tag{C.5n.3}
$$
Above the median the minimum counts coordinates above $s$. Below the median it counts coordinates at or below $s$. Integrating these two counts proves the last equality, including ties. Summing over coordinates and using $\|z\|_1\le\sqrt D\|z\|_2$ on each edge gives $W(G)\ge (h/\sqrt D)\sum_v\|x_v-m\|_1$. If $R_N>0$, packing places at most $N/2$ vertices in the closed ball about $m$ of radius $R_N$. The other vertices have $\|x_v-m\|_1\ge R_N$. If $R_N=0$, the claimed length bound is immediate. Finally $2|E|\le\Delta N$ gives the mean bound. A nearest-neighbor grid has all edge lengths $a$ and at most $DN$ edges, so its stated maintenance cost is at most $DN(\kappa_0+\kappa_1)$. The fixed-expansion lower bound on that cost grows faster than $N$ for fixed $D,C_D,\kappa_1$.

For the diameter example take the complete binary tree of depth $k$ on $N=2^{k+1}-1$ vertices. Place the vertices in inorder sequence at successive points spaced by $a$ on one coordinate axis. This placement satisfies the packing bound with a constant independent of $k$. At depth $j\in\{1,\ldots,k\}$ there are $2^j$ edges to parents, each of length $a2^{k-j}$. Thus $W(G)=ak2^k$ and $W(G)/|E|=O(a\log N)$, although the maximum degree is three and the diameter is $2k$. For every fixed $D$ this mean is $o(aN^{1/D})$. ∎

The packing bound and maintenance tariff are supplied inputs. The separation concerns the installed-wire term. A full comparison under Definition C.4 also requires the common resource and response ledger. The zero-other-cost transmission law of Theorem C.5b, item 3, continues to charge per hop.

<a id="theorem-c5o"></a>

<a id="theorem-c5o-degree-three-short-hop-wirings-with-linear-euclidean-wire-length"></a>**Theorem C.5o (Degree-Three Short-Hop Wirings with Linear Euclidean Wire Length).** Fix an integer $D\ge2$ and a length unit $a>0$. For every $k\ge2$ there is a tree $T_k$ of degree at most three on $N=2^k-1$ distinct sites in $a\mathbb Z^D$, with logarithmic hop diameter, that satisfies
$$
W(T_k)\le C_D aN,\qquad
C_D=\frac{2^{2+1/D}\sqrt D}{1-2^{-(1-1/D)}}.
\tag{C.5o.1}
$$
For $0\le r\le k-1$, the root's hop ball has $2^{r+1}-1$ vertices. Let $P=N(N-1)$, $H(G)=\sum_{u\ne v}d_G(u,v)$, and use the complete comparison functional on the stated class
$$
J_N(G)=b_N+\lambda\frac{H(G)}P+\kappa_0\frac{|E(G)|}N+
                \kappa_1\frac{W(G)}{aN},
\qquad \lambda>0,\quad \kappa_0,\kappa_1\ge0,
\tag{C.5o.2}
$$
where $b_N$ is common to the wirings at size $N$ and the other coefficients are fixed. On every candidate class containing these trees at degree capacity at least three, no lower budget gate in this functional eventually retains a family satisfying the upper bound of (C.1), with the bounded normalized lower cutoff of Theorem C.5m(4), while excluding the trees. The same conclusion holds after intersecting the candidate class with a bound $W(G)/(aN)\le C_D$.

*Proof.* Use the complete binary tree of depth $k-1$. Identify a vertex by its binary path word $w$, of length $j$. Assign it the $k$-bit label $w1\,0^{k-j-1}$. The last $1$ recovers $j$ and the path, so the labels are distinct. Split a label into $D$ subsequences by assigning its successive bits cyclically to coordinates $1,\ldots,D$, using earlier bits as more significant in each coordinate. Interpret each subsequence as an integer and multiply by $a$. Interleaving the coordinate digits with their assigned lengths recovers the label. This gives distinct lattice sites. Every ball of radius $R$ is contained in an axis-aligned cube of side $2R$, hence contains at most $(1+2R/a)^D$ of the sites.

An edge into depth $j$ has both endpoints with the same first $j-1$ label bits. Each coordinate has at most $\lceil(k-j+1)/D\rceil$ unfixed bits, so the edge length is at most $a\sqrt D\,2^{\lceil(k-j+1)/D\rceil}$. There are $2^j$ such edges. Writing $m=k-j$ and using $2^k\le 2N$ gives
$$
W(T_k) \le a\sqrt D\,2^{1+1/D}2^k
   \sum_{m=1}^{k-1}2^{-m(1-1/D)}\le C_DaN.
\tag{C.5o.3}
$$
The root's depth census gives the ball formula. The diameter is $2(k-1)$, so $H(T_k)/P\le2(k-1)$. Its degree and installed-wire terms are bounded above independently of $k$. For a regular family in the scope of Theorem C.5m(4), $H(G)/(P\log_2N)\to\infty$. Since the two installed-resource terms in (C.5o.2) are nonnegative, $J_N(G)>J_N(T_k)$ eventually along the comparison sizes. A lower budget gate retaining $G$ then also retains $T_k$. ∎

The edge installation component of Theorem C.5n excludes uniform edge expanders under its maintenance-only comparison. The degree-three trees in Theorem C.5o have small balanced cuts and violate the upper growth bound in (C.1). The result covers a fixed linear charge for average installed length alongside a fixed positive uniform all-pair charge per hop. Candidate coverage, other traffic laws, distance-dependent traversal charges, and a derivation of the actual complete MPU ledger remain separate conditions.

<a id="theorem-c5p"></a>

<a id="theorem-c5p-exact-non-amortized-routing-on-a-qualified-finite-source"></a>**Theorem C.5p (Exact Non-Amortized Routing on a Qualified Finite Source).** Fix $N\ge2$, positive energy-valued raw tariffs for finite ready stock, timed control, retained storage and coupling capacity, a pulse duration $\delta>0$, and a positive energy gap $\varepsilon$. On every connected simple graph on the same $N$ labeled sites, retain a prescribed simple route for each of finitely many ordered unicast demands, each between distinct sites. There is a finite, reset-free supplied-stock source on the local pulse branch of Construction C.5d with the following properties.

1. Each vertex contains the unchanged qualifying $R_{14}$ source of Definition 2.4.1g, with the registered baseline and qualification of Theorem 2.4.1k. Each demand has its own input, output, intermediate transport registers, incident-port controls, and fresh hop kit for every hop. On the postqualification input cut, the full channel transfers all payloads to their respective destinations exactly, including payloads entangled with one another or with an arbitrary spectator. Each hop occupies the same positive duration and has the same independent charge $r>0$.
2. The complete raw operational invoice is common across graphs and routes at fixed $N$ and fixed demand list. It realizes the operational cost law of Definition D.1 on a one-shell raw-cost resolution. In the boundary branch $\lambda=r_I=0$ of Definition 20 and Definition 3b, the charged nonnegative ledger of Definition C.4 satisfies
$$
V_{\rm total}=V_{\rm prop}=\frac r{T_N}\sum_{j=1}^{P} n_j ,
\tag{C.5p.1}
$$
where $n_j$ is the actual number of hops of demand $j$, $P$ is the number of demands, and $T_N$ is the common positive accounting duration. If every demand has the same number $n$ of hops, this is the exact class of Theorem C.5b(3) with $M=P/T_N$ and $\bar N=n$. For unequal routes the sum in (C.5p.1) charges every occupied hop separately.
3. For the all-pair list on the whole finite connected graph class, the minimum is attained by shortest routes, and Theorem C.5m applies to the resulting graph ordering. The positive raw operational invoices and their finite budgets remain part of the complete retained record. At $\lambda>0$ with $r_I=0$, their charged value shifts the exact budget threshold by a common nonnegative term.

*Proof.* Before the traffic window run the original $R_{14}$ episode and its verifier at every vertex, including its three snapshots and all original source and resource records. All new registers are in independent supplied states through that episode, their controls are disabled there, and no new ports occur in the original constructor language. On the subsequent traffic window the added controls act only on their own factors. Thus restriction to the original qualified apparatus gives exactly its original complete instrument, including its failures and the original program-complexity minimum at the qualifying state. The routing channel is supplied by the extended MPU apparatus, with the same task-relative qualification of the local cores. No minimum for the enlarged apparatus is used.

Freeze a serial calendar with $P$ blocks of $N-1$ slots, each slot lasting $\tau=3\delta$. With a fixed qualification and setup duration $T_0>0$, including the local preparations and scheduled readout service, the common full interval is $T_N=T_0+P(N-1)\tau$. Every simple route fits in its block. The supplied incidence word connects only adjacent enabled vertices and uses the first $n_j$ slots for demand $j$. Each route carries one payload at a time. Independently of its route, demand $j$ has at every vertex a degenerate ready buffer qubit and a dedicated local input/output interface. The source buffer contains the incoming payload at the input cut. All other buffers start in a fixed ready state. Each active slot has one fresh hop kit. It comprises a local gap-$\varepsilon$ two-level fuel cell at the tail prepared in its excited state, a gap-$\varepsilon$ receiver at the head in its ground state, its two timed end-port controls, the edge coupling, and a scheduled occupied-use record. No such kit is shared across demands or repeated uses of an edge. The calendar has a finite uniform stock of slots, clocks and classical tables. For each entry, its route descriptors, pulse specifications and unused code sectors are retained. Only the fresh kits counted in the propagation invoice are supplied for active entries. Every inactive entry holds identity, with its local clock/controller/store already included in the operational invoice. At the block end the target buffer is the designated output and is retained.

For one active slot use three subslots: an occupation-label record, the tensor product of the payload swap with the fuel/receiver swap, and the endpoint record release. The occupation and endpoint labels are fixed by the calendar and do not measure the payload. The swaps implement the full permutation on arbitrary inputs. Each added pulse for an involution $J$ is generated on its subslot by
$$
H_0+\frac{\pi\hbar}{2\delta}(I-J),
\tag{C.5p.2}
$$
with degenerate logical records and the native fuel energy $H_0$ from the equal gaps. The two swaps commute with $H_0$, so the known native phase is common on the initialized fuel sector. The pulse is exact there even for inputs entangled with a spectator. Its control norm is at most $\pi\hbar/\delta$, and its borrowed mean switching work is returned on switch-off because the control Hamiltonian commutes with $H_0$ and with the full constant segment. The occupied pulse reservation and the corresponding gross positive control throughput are included as independent capacity services with pre-fixed valuations. The active use consumes $\varepsilon$ once from the supplied fuel and leaves it in the retained receiver. The energy already assigned to this transferred excitation is counted once in $r$. Unused buffers, route records, slot triggers, and source work capacities remain in their owners' records. Composing the tensor-factor swaps along the route delivers the payload and restores intermediate buffers to their prepared states. Composing across demands gives an exact permutation on all admitted payload/reference inputs. No intervertex operation exists outside its installed kit and slot. A demanded output depending on its arbitrary input therefore has a causal path through the charged adjacent slots, and the count of those slots is at least the graph distance. There is no per-payload readout, reuse of hop fuel, or reset.

The operational stock includes the unchanged local cores and episodes, the one buffer and local input/output record space per site and demand, every slot's route/clock labels and their retention, and all reserved local non-kit readout, time and table services. Each active kit owns two one-bit gap-$\varepsilon$ energy stores, two one-bit degenerate records, two constant-size end-port control modules and one installed edge coupling. It also owns its three positive subslots and the per-kit peak and gross positive throughput reservations $\pi\hbar/\delta$ and $3\pi\hbar/\delta$. These are fixed capacity bounds, so variations of the borrowed work with input do not change their valuation. The three service templates and subslot durations are identical for every active kit. Inactive slots use no kit. Every physical stock and service has one of these owners. The itinerary is supplied as padded fixed-width classical data with one table entry per slot, and its inventory is common across graphs. Each entry has two endpoint indices of $\lceil\log_2N\rceil$ bits and one active flag. A copy of the frozen $N$-by-$N$ adjacency mask also fits in a fixed number of bits. These are retained records of the supplied wiring and calendar. The actual physical end ports and their clock triggers are already charged by the owning kits or the common local control stock. There is no runtime query to a route oracle. The graph may use parallel kit couplings on a nominated edge at disjoint times. For a graph that keeps additional installed edges available, reserve one inactive template per possible edge in the common local stock before choosing the mask, with its unused modes retained; only the separately counted fresh kit may carry a payload. This is the finite supplied-table model of Construction C.5d. It prices the actual end-port couplings at the declared constant-size tariff. To keep the per-hop price fixed across sizes, each kit is procured at the start of its assigned slot from the same finite supplied-ready service and released intact with its spent receiver and records at the end of that slot. Each release transfers custody to an external output store and is recorded by the apparatus. A local copy of the release label is stored for the rest of the word in the fixed operational reservation. The per-kit invoice includes its three-subslot lifetime and output delivery. It ends the apparatus's kit custody at that delivery. A branch extending responsibility to a longer output-storage period adds the actual owner and debit. All kit lifetimes within the source are $3\delta$, and the longer local records remain in the common operational stock. Distinct slots and repeated words consume distinct kits.

Use replicated fixed operational reservations per site. In particular each site can own its copy of the full finite itinerary and mask, its $P$ local buffers, its local core, readout and preparation ports, and enough local snapshot, input/output and time registers for every slot at that site. Original core energies are reserved once at their source values. All controls and their timing/retention can be reserved on a finite common calendar with the same positive pulse bound; idle allocations remain in the invoice. The external timer and source tables have their own predeclared positive service tariffs as in Construction C.5d. A padded stock bound and its actual supplied reservation, including unused factors, suffice because the branch charges those reservations in full. The per-site raw invoice divided by $T_N$ is the same finite $b_N>0$ at every site. Its rate observable on the full owned local carrier is $b_N I$ for every retained state, including correlated inputs.

At the declared cost resolution use one shell $\hat P_0=I$ and $\hat C_v=K_0I$ on the local core. The sum of these local coordinates is additive on disjoint sites, its single cost eigenvalue is accessible from the fixed inventory, and its spectral cost order is automatic for the one shell. The core retains its separate predictive program and task observables. This supplies the finite-shell proxy of Theorem 1 at the resolution of the raw invoice. Independently calibrate $R(K_0)=b_N$ and take $R(C)=b_N+a(C-K_0)+b(C-K_0)^2$ for $C\ge K_0$, with fixed positive off-shell coefficients of the appropriate units. The positive coefficients do not enter the source comparison. Restriction to the core pulls back $R(K_0)I$ to exactly the full local raw invoice operator. Here $K_0$ labels the lowest shell of the cost observable. The unchanged task-relative program minimum in Theorem 2.4.1k is computed on its own constructor language. The construction identifies neither these complexity coordinates nor the response equivalence of different programs.

The fixed per-kit invoice $r$ consists of $\varepsilon$ for the delivered fuel plus its independent positive setup, retained stock, timing and pulse services. A coefficient in this invoice is assigned to the physical operation that uses it, including all active end-port work and support. No global installed common reservation is divided by the number of traversed hops. Thus the propagation amount is $r\sum_j n_j$, with no common charge canceled in that identity. Definition D.1 evaluates the separately calibrated operational component as $\sum_v\langle\lambda \widehat R_v+\widehat R_{I,v}\rangle$. Definition 20 permits $\lambda=0$, and the nonnegative coefficient $r_I$ of Definition 3b permits $r_I=0$. On that frozen boundary the entire weighted operational rate is identically zero on every retained state, while the nonzero raw stock and service entries remain present and costed. There is no additional charged term in this feasibility comparison. This proves (C.5p.1) over the full finite window. For any positive $\lambda$ and $r_I=0$, the term $\lambda N b_N$ is positive and remains in the charged budget. Fixed duration and positive per-hop charges give shortest-path attainment. ∎

<a id="cor-c5p1"></a>

<a id="corollary-c5p1-exact-classical-broadcast-routing-cost"></a>**Corollary C.5p.1 (Exact Classical Broadcast Routing Cost).** Use the finite pulse and fixed-price hop-kit source of Theorem C.5p. Before the word begins, each demand $j$ has one independent binary symbol at its nominated sender $s_j$ and a nonempty target set $A_j$. Demands use disjoint payload and kit factors. Freeze the set of charged edge slots before revealing the symbols, optionally by independent public randomness, and charge each reserved kit at the fixed price for the complete use, including a reserved null delivery. Each charged slot can carry one classical bit over an enabled edge. A controller can choose the bit or the null delivery at its reserved slot using all accessible local history. All symbol-dependent controls and records remain local except for their communication through the charged slots. The side registers, controller state and shared supplies have a common joint initial law independent of the symbol values, which occur initially only in the designated sender factors. Require exact delivery to all targets for both symbol values and retain the records of all intermediate copies. Then the least number of paid hops for demand $j$ is the least number $\operatorname{st}_G(s_j,A_j)$ of edges in a connected subgraph of $G$ containing $\{s_j\}\cup A_j$. On the $\lambda=r_I=0$ branch the attained minimum charged ledger is
$$
V_{\rm total}^*(G)=V_{\rm prop}^*(G)
=\frac r{T_N}\sum_j\operatorname{st}_G(s_j,A_j).
\tag{C.5p.3}
$$
In particular, when every sender broadcasts to all other vertices, each demand costs exactly $r(N-1)$ in the accounting interval, for every connected graph. On the full connected comparison class at degree capacity at least three, the resulting budget gate retains every irregular degree-three binary tree whenever it retains a regular cycle at the same size.

*Proof.* Condition on the complete public calendar seed. With exact delivery, each target's output law depends on the symbol because it must return that symbol on each of the two inputs. If the seed is random, this statement holds for almost every seed simultaneously for both inputs and all finitely many targets. Propagate possible dependence sets in chronological order on the fixed charged schedule, allowing every reserved edge gate to convey dependence between its endpoints. Each vertex-local operation leaves upstream dependence within its vertex, including when its controls use local symbol-dependent records. Each charged edge slot can add only the other endpoint and its upstream set. This remains true for symbol-dependent transmission or null decisions within the slot because the complete service, including any observable null event, has already been charged. Each target therefore has an ancestry path from $s_j$ in the charged slots. The union of their undirected edges has a component containing $s_j$ and every target, with at most as many distinct edges as paid uses. This yields the lower bound for each such calendar, and then for its expected cost. The same proof applies with public preparation or local control seeds independent of the symbols. A remote symbol-dependent trigger outside the reserved slots would change the declared interface.

A minimizing connected subgraph can be chosen to be a tree by deleting cycle edges, and its number of edges is at most $N-1$. Root the tree at $s_j$ and schedule its edges with parents preceding children. At each site and for each demand supply one degenerate copy register and one degenerate ready transport buffer. The root's copy register starts with the symbol and all other copy registers start ready. Before sending to a child, copy the parent's bit by a reversible controlled NOT into the parent's ready transport buffer. The payload swap of Theorem C.5p moves that copy into the child's ready copy register and restores the parent's transport buffer to ready. The parent retains its own copy. The fuel, pulse, output release and ownership of each active kit remain as in Theorem C.5p. The additional local copy control occupies the first subslot, on a support disjoint from the occupied-use record gate. Its preparation, service and retention fit in the predeclared local operating reservation. No shortening of the word on unused slots is used. After the last tree edge, all targets have the symbol. The local instruments preserve the full classical joint law and every copy record. Induction over the tree edges proves the complete source law for any input distribution and correlated classical external reference. The single-qubit coherent transfer of Theorem C.5p supplies the port implementation. The entire extra fixed reservation is valued in the raw operating invoice and the boundary weights give (C.5p.3).

If $A_j$ is all vertices other than the sender, every connected graph has a spanning tree with exactly $N-1$ edges and requires at least that many. The complete trees on $2^k-1$ sites have degree at most three and exponentially growing root balls by Theorem C.5o. Cycles on the same sizes have linear growth and are admitted at that degree cap. Equal charged costs therefore give equal budget decisions. ∎

The exact ordering in Corollary C.5p.1 uses classical broadcast with disjoint demand factors and a non-amortized kit for each tree-edge use. A model that charges solely for actual sends and also gives the receiver a free observable timeout has different costs. On a single edge, a fair bit can be delivered by sending on value one and using the timeout for zero, at expected cost $r/2$. Coding across demands, such uncharged symbol-bearing activation, and amortization of intervertex service require their own traffic and ownership maps.

<a id="theorem-c5p2"></a>

<a id="theorem-c5p2-diameter-and-growth-of-nearly-minimal-literal-routing"></a>**Theorem C.5p.2 (Diameter and Growth of Nearly Minimal Literal Routing).** Fix a degree cap $\Delta\ge3$ and let $H_*(N)$ be the minimum of the ordered distance sum $H$ of Theorem C.5m over all connected simple $N$-vertex wirings of degree at most $\Delta$. Let $G$ be any such wiring, with $N\ge3$ and $H(G)\le H_*(N)+\mathcal E$. Set
$$
\begin{aligned}
L&=2\lceil\log_2 N\rceil+2\Delta, & k&=2\lceil\log_2 N\rceil+\mathcal E/N^2,\\
r_0&=\left\lceil\max\{8(L+2),4k\}\right\rceil, & r_j&=16^j r_0,\qquad J=\left\lceil\sqrt{\log_4N}\right\rceil.
\end{aligned}
\tag{C.5p.4}
$$
For the smallest $j\ge J$ with $r_j\ge\mathcal E/N$, one has $\operatorname{diam}(G)\le16r_j$. Thus for exact minimizers and, more generally, sequences with $1+\mathcal E/N=N^{o(1)}$, the diameter is $N^{o(1)}$. On any such sequence there cannot be a window of hop radii of diverging width below the diameter on which every ball obeys a uniform upper bound $C(1+r)^D$ with fixed $C,D>0$. The lower endpoint of the window may diverge. In particular this excludes regularity as in (C.1) on the unit-edge calibration at arbitrary microscopic rescaling in this class. The conclusions apply to the attained mandatory all-pair literal source of Theorem C.5p, whose full ledger is ordered by $H$. Its positive per-hop price translates a cost tolerance to the corresponding $\mathcal E$.

*Proof.* The heap tree of Theorem C.5m has degree at most three and $H\le2N(N-1)\lceil\log_2N\rceil$. Averaging radial distances over centers gives a vertex $c$ with mean distance at most $k$. Write $\rho(v)=d_G(c,v)$ and $M(r)=|\{v:\rho(v)>r\}|$.

Fix an integer cutoff $R$ and keep the graph on $K=\{v:\rho(v)\le R\}$ unchanged. Each component $U$ of the complement is connected and has an attachment to $K$. If $m=|U|<2\Delta$, retain it and its attachments. Otherwise replace its internal graph by a balanced binary heap tree, leaving the number $d_a$ of attachments from each $a\in K$ to this component unchanged. To do this, for a vertex $v$ of the replacement tree use capacity $c_v=\Delta-\deg_U(v)$, with the degree now computed in that tree. The total capacity $(\Delta-2)m+2$ is at least the old boundary edge count because the old component had at least $m-1$ internal edges. Each $a$ may use each $v$ at most once. For any $t$ core vertices the total available capacity is $\sum_v\min(c_v,t)$. If $t\le\Delta-1$, the tree has at least $\Delta$ leaves of capacity $\Delta-1$, so the bound is at least $\Delta t\ge\sum_a d_a$ over those vertices. If $t\ge\Delta-1$ the entire capacity is available, since every tree vertex has degree at least one. These are all bipartite cut inequalities, so an integral flow supplies the attachments. All core degrees are preserved and the competitor $G_R$ stays connected, simple and degree-capped. The proof of this replacement and the exact-optimum tail argument use the same graph comparison as the ordered distance sum, with the following estimate retaining the tolerance.

Every replacement component has internal diameter at most $L$. The core distances from $c$ do not increase because radial geodesics stay in the core. Each exterior component attaches to the old radius-$R$ layer, so every new radius is at most $R+1+L$. For an old geodesic from $s$ to $t$, replace each maximal block of exterior vertices by a path in its replacement component with the corresponding boundary edges. The walk length increases by at most $L+2$ per block, including blocks containing an endpoint. Call the block count $b_R(s,t)$.

Take any integer $r\ge r_0$ and average over $R=r,\ldots,2r-1$. Every old distance at least $6r$ cannot increase because the new diameter is at most $2(R+1+L)\le6r-2$. An old shortest path of length less than $6r$ crosses fewer than $6r$ of the radial cuts counted with multiplicity, since each path edge crosses at most one integer cutoff. Its mean block count is therefore at most $7$, including a possible starting exterior block. If both endpoints have radius at most $r/2$, their shortest path stays within radius $r$: any path vertex $z$ satisfies $2\rho(z)\le\rho(s)+\rho(t)+d_G(s,t)\le2r$. Such distances cannot increase. With $m_r=M(r/2)$, there are at most $2Nm_r$ remaining ordered pairs. The average sum of positive distance increments is at most $14Nm_r(L+2)$.

If $\rho(s)>8r$ and $\rho(t)\le r/2$, then $d_G(s,t)>8r-\rho(t)$ while $d_{G_R}(s,t)\le R+1+L+\rho(t)\le3r-1+\rho(t)$. Their distance decreases by at least $4r$ for each cutoff. There are $2M(8r)(N-m_r)$ such ordered pairs, and $m_r\le2Nk/r\le N/2$ by Markov's inequality. The average sum of decreases is at least $4rN M(8r)$. Since $H(G_R)-H(G)\ge-\mathcal E$, comparison gives
$$
M(8r)\le\frac{7(L+2)}{2r}M(r/2)+\frac{\mathcal E}{4rN}.
\tag{C.5p.5}
$$
For $r_j$ in (C.5p.4), iteration yields
$$
M(8r_j)\le N(7/16)^{j+1}16^{-j(j+1)/2}+\frac{\mathcal E}{2Nr_j}.
\tag{C.5p.6}
$$
The starting value uses $M(r_0/2)\le N$. For the error induction use $r_j/2=8r_{j-1}$ and $7(L+2)/(2r_{j-1})\le7/16$; this makes the propagated error plus the new error at most $\mathcal E/(2Nr_j)$. At $j\ge J$ the first term is less than $1/2$, since $N\le4^{J^2}$ and $J\ge1$. The second term is at most $1/2$ at the stipulated $j$. The integer tail count is zero, giving the diameter bound. For fixed $\Delta$, the choice of $j$ gives $r_j\le \max\{r_J,16\mathcal E/N\}$, which is $N^{o(1)}$ under the claimed tolerance condition.

If a uniform polynomial-growth window existed, choose an integer radius $r_N$ in the window tending to infinity. Its diameter bound gives $r_N=N^{o(1)}$. With $b_N=\max\{2,\lceil C(1+r_N)^D\rceil\}$, one has $\log b_N=o(\log N)$ and $r_N/\log b_N\to\infty$. Apply the one-scale cover bound of Theorem C.5m(iii) at this radius, even if its iterated cover uses radii beyond the given window. It implies $H(G)/(N(N-1)\log N)\to\infty$. But the heap competitor and the assumed tolerance bound that quotient. This proves the exclusion. ∎

<a id="theorem-c5p3"></a>

<a id="theorem-c5p3-exact-shared-packet-traffic-on-trees-and-the-all-gather-limit"></a>**Theorem C.5p.3 (Exact Shared-Packet Traffic on Trees and the All-Gather Limit).** Retain the protected local cores and finite-clock accounting of Theorem C.5p. Fix a positive integer $b$. A paid slot enables one directed adjacent port of alphabet size $2^b$. The slot calendar and direction are fixed independently of the source word. Each slot uses the whole priced service, including padding, and no signal crosses an edge outside a paid slot. Initially there are independent fair bits $X_j$, each at one vertex $s_j$. A demand asks for that bit at every vertex in a specified set $A_j$. Vertex-local coding, copying and control may depend on the entire local history. Shared initial side data and controller random seeds may be correlated with one another and are independent of the source bits. Require exact joint delivery of the requested bits. Then the following hold.

1. On a tree $G$, for an oriented edge $e$ let $m_e$ count the distinct bits sourced on its tail side and requested at least once on its head side. The minimum number of paid slots is
   $$
   K_b(G)=\sum_{e\ \mathrm{oriented}}\left\lceil\frac{m_e}{b}\right\rceil .
   \tag{C.5p.7}
   $$
   A finite reversible copying, packing and transport schedule attains it. At fixed clock duration $T$ and complete positive per-slot charge $r_b$, the charged propagation rate is $r_bK_b(G)/T$.
2. Suppose each of the $N\ge2$ vertices starts with one bit and requires the complete word. If $b\ge N-1$, the minimum on every connected $N$-vertex graph is $2(N-1)$ slots, allowing arbitrary exact interactive coding under this slot contract. Thus on the branch $\lambda=r_I=0$ the full charged ordering at this capacity is constant over the connected class. In particular a growth gate based on that ordering admits the same-size degree-three heap tree whenever it admits a cycle.

*Proof.* First fix a calendar and all independent random tapes, including any local tapes used after processing a message. Exactness for the finitely many possible source words implies that almost every fixed tape works for all of them simultaneously. For a cut, fix the initial word on the receiving side. In this deterministic conditional execution, that side's final records are a function of its initial data and the ordered incoming symbols. Its local outgoing symbols and controller actions are already determined by these data. If it must recover $m$ different independent bits from the other side, the incoming transcript has at least $2^m$ distinguishable values. With $k$ incoming slots the number is at most $2^{bk}$. Hence $k\ge\lceil m/b\rceil$. A tree edge is the only port across its cut, which proves the sum lower bound in (C.5p.7) for every fixed tape and calendar and thus also for their expected charge.

Root the tree. The paths from each source to its requested vertices form one subtree. Every oriented edge belonging to these directed routes carries the bit exactly once, even when multiple targets on the far side request it. Process all upward edges in decreasing depth and then all downward edges in increasing depth. At an upward edge, each bit to be sent originated in the subtree below it and all earlier upward edges needed to bring it to the tail have already run. At a downward edge a requested bit is already at its tail, either from an upward transfer or from an earlier downward edge. Group the available bits for the edge into batches of size at most $b$, using a fixed ordering and filling its remaining coordinates with ready zeros. The calendar and packing map depend only on the graph and demand list. This uses exactly (C.5p.7) and proves simultaneous exact recovery.

For all-gather, consider the first vertex at which the complete word is available. The union of edges used up to that instant contains a connected component including this vertex and every source vertex. Indeed, an initially missing bit could not affect its records without a chain of slots from its source. At least $N-1$ slots have elapsed. A slot changes the information at only one receiving vertex, since the specified channel is one-way and the sender has no return or remote-timing port. Every other vertex was still incomplete at that instant, and each requires at least one later slot. This yields $2(N-1)$. On any connected graph choose a spanning tree. On each of its two edge orientations the all-gather demand load is the number of vertices on the tail side, in $[1,N-1]$. The tree schedule attains one slot per orientation when $b\ge N-1$. Degree-three heap trees and cycles of size $2^k-1$ are both in the degree-capped class. The root of the heap has exponentially growing balls up to its depth, whereas every cycle ball has size at most $2r+1$ at radius $r$. Equal costs therefore preclude their separation by a budget threshold on this branch.

The attaining physical implementation begins after the local $R_{14}$ episodes. Each node has ready degenerate copy and packing banks. Local controlled XORs copy needed data, including for repeated delivery, into ready packet registers. In a paid slot swap the $b$-bit packet into a ready receiving bank and use the separate fuel swap and occupancy records of Theorem C.5p. The tensor product packet swap is an involution, so its pulse in the owned two-site port uses (C.5p.2) and has norm at most $\pi\hbar/\delta$. The receiving bank is ready in every admitted use. Sending into it gives one-way data transfer with known ready return to the sender. Distinct slots have distinct kits and all occupied packet data, padding, local copies, controls and fuel records are retained. The preallocated local control stock includes the reversible packing schedule, and its source-table and clock bounds can be fixed uniformly over wirings at fixed size, demand list and capacity. For example one common finite calendar with at most $P(N-1)$ paid slots for $P$ source bits suffices for the tree construction, with unused time padded at the common operating reservation. The batch tariff $r_b$ includes the actual positive fuel, both $b$-bit endpoint reservations, installed port, control throughput and release, with no charge divided by the number of active bits. The source uses each kit once while sharing each slot across multiple demands. Positive graph-independent weighted operating stock adds the same rate offset to the charge comparisons. ∎

<a id="theorem-c5p4"></a>

<a id="theorem-c5p4-exact-two-bit-all-gather-on-hamiltonian-wirings"></a>**Theorem C.5p.4 (Exact Two-Bit All-Gather on Hamiltonian Wirings).** Retain the shared-packet source of Theorem C.5p.3 with capacity $b=2$. At each of $N\ge2$ vertices put one independent fair bit and require exact recovery of the entire word at every vertex. On every wiring with a spanning cycle, the least number of charged directed slots, allowing all the local coding and independent side data of Theorem C.5p.3, is
$$
K_2(G)=N\left\lceil\frac{N-1}{2}\right\rceil+\mathbf 1_{\{N\text{ odd}\}}.
\tag{C.5p.9}
$$
The lower bound holds on every connected wiring. For $N=2$ the single link gives the same formula by one slot in each direction. With the source-complete price $r_2$ per slot and common duration $T_N$, the zero-operational-weight ordering cannot separate polynomial-growth wirings from the irregular Hamiltonian family exhibited below at any degree cap at least three under unit-hop calibration.

*Information lower bound.* Fix a calendar and independent random tapes as in Theorem C.5p.3. For each vertex, its own input bit and its incoming transcript determine every local output. Fixing its own bit, there are $2^{N-1}$ distinct words that must be recovered. At most four values arrive in each paid slot, so every vertex needs at least $m=\lceil(N-1)/2\rceil$ incoming slots. The first paid slot in the whole calendar has at most two possible values: its sender has only its own input bit and the fixed independent side data before any message. In the receiving vertex's transcript this slot therefore supplies at most a factor two. If $N$ is odd, $N-1=2m$, and this vertex needs more than $m$ incoming slots, since $2\cdot 4^{m-1}<2^{N-1}$. Adding the individual lower bounds gives (C.5p.9). Exactness on the finite input set justifies fixing one full-measure set of random tapes that works for every word, so the same lower bound holds after averaging over independent calendars and tapes.

*Cycle schedule.* Number the vertices $0,1,\ldots,N-1$ in the directed order of a spanning cycle, and read subscripts modulo $N$. A vertex $j$ always retains its own bit and a contiguous backward interval of $\ell_j$ predecessor bits, initially $\ell_j=0$. A slot from $j-1$ to $j$ can extend the interval at $j$ by $a\in\{1,2\}$ precisely when
$$
\ell_j+a\le \min\{N-1,1+\ell_{j-1}\}.
\tag{C.5p.10}
$$
In that case send exactly the next $a$ missing bits, in their fixed order, with one zero pad when $a=1$. First send one bit from $0$ to $1$. Then perform $\lfloor(N-2)/2\rfloor$ complete sweeps, each with one two-bit slot to each recipient in order $2,3,\ldots,N-1,0,1$. After $t$ such sweeps the interval lengths are $2t$ everywhere except at $1$, where the length is $2t+1$. For the induction, recipient $2$ can use the previous length $2t+1$ of vertex $1$. Each following recipient up to $0$ can use its predecessor's newly extended length $2t+2$. Recipient $1$ can extend to $2t+3$ using vertex $0$. The prescribed number of full sweeps keeps these lengths at most $N-1$.

If $N=2m+1$ is odd, the full sweeps leave length $N-3$ at every vertex except $1$, where it is $N-2$. Send two bits to each recipient in order $2,3,\ldots,N-1,0$ and one final bit to $1$. This is feasible by (C.5p.10) and leaves length $N-1$ everywhere. The total is $1+N(m-1)+(N-1)+1=Nm+1$. If $N=2m$ is even, the full sweeps leave length $N-2$ everywhere except at $1$, which is complete. Send one final bit to each recipient in order $2,3,\ldots,N-1,0$. The total is $1+N(m-1)+(N-1)=Nm$. This reaches the information lower bound in both cases.

*Source and contrasting growth.* Each transmitted packet uses exactly one two-bit kit, with the physical fuel, two endpoint registers, timed swap, release and record of Theorem C.5p.3. The one-bit deliveries still use the complete paid two-bit kit. The packing and copying are fixed local reversible controlled additions, with fresh receiving slots and all earlier local copies retained. At fixed $N$ use the same slot reservation on every candidate, with unused operating time padded. The exhibited optimum uses (C.5p.9) slots, within a common finite budget such as $N(N-1)$ slots. The weighted operating and informational charges vanish on the stated boundary branch. The positive raw operating reservation remains in the full source record.

For a same-size contrast, start with the complete binary tree on $N=2^k-1$ vertices for $k\ge3$. A proper three-edge coloring exists by assigning unused colors recursively from its root. Delete the edges of one color. The remaining spanning forest is a disjoint union of paths, including possible singleton paths. Traverse each path in a chosen direction and join successive paths, including the final and initial paths, to make a spanning cycle. Restore the deleted edges, merging duplicates if a cycle edge already uses one. All restored edges form a matching, so the resulting simple Hamiltonian graph has degree at most three and contains the original binary tree. Its root balls contain at least $2^{r+1}-1$ vertices for $0\le r\le k-1$. For $r\le\lfloor k/2\rfloor$ its diameter is at least $r$: every maximum-degree-three graph has balls of radius $r-1$ of size at most $1+3(2^{r-1}-1)$, smaller than $N$. Thus the expanding window witnesses the failure of every uniform polynomial upper bound in (C.1) at the bounded unit-hop lower cutoff. The ordinary cycle on the same labels satisfies the linear growth bounds. Both are Hamiltonian and attain the same charged cost $r_2K_2(G)/T_N$ under the same slot law. Consequently a budget threshold on this charged ledger that retains the cycle at these sizes also retains the irregular Hamiltonian family. ∎

<a id="theorem-c5p5"></a>

<a id="theorem-c5p5-exact-all-gather-for-every-packet-capacity-on-hamiltonian-wirings"></a>**Theorem C.5p.5 (Exact All-Gather for Every Packet Capacity on Hamiltonian Wirings).** Retain the directed paid-slot source, independent local input bits and exact all-gather requirement of Theorem C.5p.3. Let $N\ge2$, let $b\ge1$ be the capacity in bits per slot, and put $m=N-1$, $k=\lceil m/b\rceil$ and $a=m-1-b(k-1)$. Every connected wiring requires at least $Nk+a$ charged slots, allowing arbitrary coding and the independent side data of that theorem. A spanning cycle attains this bound. For $N=2$ a single link suffices. In particular, for each capacity sequence $b=b_N$, the same-size regular cycles and degree-three irregular Hamiltonian wirings of Theorem C.5p.4 have the same minimum charged propagation rate on the source's zero-operational-weight branch.

*Universal lower bound.* Condition on a fixed independent calendar and all random tapes, as in Theorem C.5p.3. Exactness for the finite input set makes this a deterministic exact protocol for almost every choice. Expose the first $a$ charged slots, keeping their order, and let $S_v$ be the undirected component of vertex $v$ in the union of the edges used so far. Each such component has at most $a+1$ vertices. The state at $v$ after this prefix depends only on input bits from $S_v$. Indeed, before each slot the current information dependencies are contained in the components of the edges used up to that time, and one more edge combines only its two components. Local computation, memory and access to fixed side data do not add another dependency. If the total slot count is smaller than $a$, this argument already excludes complete recovery, since $a\le m-1$.

Fix all bits in $S_v$ and vary the other bits independently. At least $N-(a+1)=m-a=b(k-1)+1$ bits must still be recovered at $v$. Its final record is a function of its state at the end of the prefix and its subsequent incoming symbols. Each such symbol has at most $2^b$ values. A receiving transcript of fewer than $k$ later slots cannot distinguish all outside bit words. This applies at every vertex and each paid slot has only one receiver. There are therefore at least $Nk$ further slots and at least $Nk+a$ overall. The same bound holds for randomized calendars and controllers by conditioning. This strengthens the first-slot argument of Theorem C.5p.4 by allowing an entire early prefix of limited dependence.

*Attaining cycle schedule.* For the construction set $B=\min\{b,m\}$, so $k=\lceil m/B\rceil$. Label a directed spanning cycle $0,1,\ldots,N-1$. At each vertex $j$ retain its own bit and a contiguous interval of $\ell_j$ predecessor bits. A slot from $j-1$ to $j$ can add any number $d\le B$ of its next missing predecessor bits whenever $\ell_j+d\le\min\{m,1+\ell_{j-1}\}$. The sender has each of those bits under this inequality, with no coding or value-dependent scheduling. Use one seed slot to each vertex $j=1,\ldots,B-1$ in that order, delivering $j$ bits. Inductively the sender has its own bit and $j-1$ predecessor bits. The seed lengths are $s_j=j$ for $1\le j\le B-1$, and $s_j=0$ elsewhere.

Then sweep repeatedly in the order $B,B+1,\ldots,N-1,0,1,\ldots,B-1$. In each sweep give each unfinished recipient the next $\min(B,m-\ell_j)$ bits and skip completed vertices. Before sweep $t+1$, with $t\ge0$, the lengths are $\ell_j=\min(m,tB+s_j)$. For recipient $B$ its predecessor $B-1$ starts the sweep with length $\min(m,tB+B-1)$, which suffices. For each following vertex through $0$ the predecessor has already been processed, so it has length $\min(m,(t+1)B)$. For the seeded recipients $j=1,\ldots,B-1$ the processed predecessor has length $\min(m,(t+1)B+j-1)$, again sufficient. These checks prove the induction including sweeps in which some vertices are already complete. After $k$ sweeps all are complete.

Each unseeded vertex receives $k$ slots. Each seeded vertex $j$ receives one seed slot and $\lceil(m-j)/B\rceil$ later slots. Write $m=B(k-1)+r$ with $1\le r\le B$. Among the seeded vertices, the $r-1$ with $j<r$ receive $k$ later slots and the rest receive $k-1$. Thus the total is $Nk+r-1=Nk+a$. This includes $b\ge m$, for which $r=m$ and the total is $2(N-1)$, and $b=1$, for which the total is $N(N-1)$. For $b=2$ it agrees with (C.5p.9).

*Physical price and growth comparison.* The same ready packet buffers, reversible local copying and directed payload and fuel swaps of Theorem C.5p.3 implement this finite slot list. The packets shorter than $b$ use the same complete paid kit with fixed zero padding. Its times and ownership are fixed independently of every bit. For fixed $N$ and $b$ use one common serial calendar of at most $N(N-1)$ slots and pad unused operating time in its common reservation. All occupied packets, unused payload coordinates, copying records and fuel cells remain retained. Hence the minimum propagation ledger is $r_b(Nk+a)/T_N$, with the positive raw operating resources recorded at their original weight. Degree-three Hamiltonian completions of the complete binary trees and the ordinary cycles both attain it at each of the same sizes. Their unit-hop growth distinction from Theorem C.5p.4 is unaffected by the capacity $b$. Thus the charged ledger cannot retain the cycle while excluding those irregular graphs at any degree cap at least three. ∎

<a id="theorem-c5p6"></a>

<a id="theorem-c5p6-exact-finite-coding-census-for-the-paid-slot-source"></a>**Theorem C.5p.6 (Exact Finite Coding Census for the Paid-Slot Source).** On every finite connected graph $G$, consider the full shared-packet traffic of Theorem C.5p.3. Each of $P$ independent fair bits has one source, each has any specified finite set of destination vertices, and each directed paid slot has alphabet size $2^b$. There is a finite exact algorithm returning the least number of charged slots over all exact local coding protocols in that source, with their permitted independent shared side data and fixed calendars. The algorithm returns an attaining finite protocol with the complete stock, calendar and packet charge of the same source. In particular it decides the charged propagation ordering between any two finite wirings for any such demand list and any positive integer capacity $b$.

*Finite state space.* Let $\mathcal X=\{0,1\}^P$. For a deterministic protocol at a fixed time, assign to each vertex $v$ the partition $\mathcal P_v$ of $\mathcal X$ whose classes are the words giving identical available local histories at $v$. Retain all prior local records. Initially $\mathcal P_v$ is the partition by its own source bits. A paid slot $u\to v$ is specified by a coloring $f$ of the classes of $\mathcal P_u$ by at most $2^b$ letters. The receiver's partition becomes the common refinement of $\mathcal P_v$ with the partition by $f$ of the source word. All other partitions stay the same. The sender already knows its chosen symbol, and retaining it does not refine its partition. Thus a state is an $N$-tuple of partitions of a fixed finite set, and its complete one-slot successor list is finite. It suffices to enumerate colorings up to a renaming of the letters; the unrenamed enumeration is also finite. A state is accepting when for each $v$ the requested bit projection is constant on every class of $\mathcal P_v$.

*Correctness.* For the lower bound, fix a pre-input calendar and all random tapes, including shared data and any tapes used at later local operations. Because $\mathcal X$ is finite and all words have positive probability, almost every fixed choice gives an exact deterministic protocol on the entire cube. Its local symbol is necessarily a function of the sender's available history. Its execution therefore maps to a walk in the partition graph. If the protocol forgets a record, retain it in the analysis as a shadow, which can only refine its partition and cannot change its original decisions. This gives the same walk for the shadow-retaining execution. A deterministic exact protocol terminates only at an accepting state. Hence any such realized schedule uses at least the shortest walk length, including after averaging independent calendar choices.

For the upper bound, choose an actual shortest accepting walk and retain a class label at every vertex. The local initialization is the table of source bit projections. In a transition, the sender computes the specified letter from its current class label. After the paid slot the receiver computes its new class label by the table of nonempty intersections of one old class and a letter class. This is a function of the available local data. Keep the old label, sent and received symbols and the new label in separate finite registers. At the end each vertex reads the requested projection from its terminal class label. The resulting classical input/output channel is exact on every word and hence on all mixtures and with arbitrary classical reference correlations. Padding and every unoccupied alphabet coordinate are fixed in advance. This walk supplies one common fixed schedule, so the lower bound and construction agree.

*Termination and source realization.* The partition graph has at most $\operatorname{Bell}(2^P)^N$ states. At each state inspect each directed edge and each coloring of its sender classes. The unrenamed successor count is at most $2|E|\,2^{b2^P}$. Breadth-first search computes the exact minimum and a predecessor list for the first accepting state. A finite explicit length upper bound is $P(N-1)$: choose a spanning tree and send each source bit once along each required edge of the subtree joining that source to its destinations. Pad every single-bit packet to the allowed alphabet. Thus a search through length $P(N-1)$ already terminates with an answer, and no unbounded protocol is assumed.

At fixed size, demand list and capacity, put $S=P(N-1)$ and reserve one common physical word of $S$ slot times and initial/final setup. The selected walk fixes the direction and endpoints of each active slot before input, with inactive slots serving only the common operating reservation. Represent the full alphabet by the $2^b$ words of a physical $b$-bit buffer. Each class label uses at most $P$ bits. At every vertex allocate a fresh $P$-bit label bank for each possible update time, a fresh $b$-bit send and receive bank for each possible slot, and a final output bank of at most $P$ bits. Initial labels need one further $P$-bit bank per vertex. This is bounded by $N[(S+2)P+2Sb]$ bits before controller, input and reference stocks. A local function table has at most $2^{P+b}$ input rows and at most $\max(P,b)$ output bits in each of the update, letter and readout cases. Use reversible controlled copying into fresh zero output registers, retaining all old arguments. Each indicator minterm can be computed by a reversible AND ladder with at most $P+b$ fresh work bits if desired, XORed into its target, and uncomputed by reversing the ladder. This costs at most $2(P+b)+1$ elementary Boolean controls per minterm, excluding fixed single-bit complement conventions, which can also be counted. Alternatively compile the whole table as one finite local controlled permutation. The total number of table calls is at most $N(2S+2)$ with a common upper bound on table size and time per call. Charge those ready controllers, program tables, ancillary work factors and target registers in the common operating reservation. All active packet slots separately use the directed adjacent payload swap of Theorem C.5p.3 with the fresh receiving and fuel factors. The sender's old symbol can be retained locally before the swap. The return buffer of the swap is known ready and carries no receiver bit. Even when the table chooses the zero letter, its active slot uses the complete positive kit. The native $R_{14}$ verification, all inactive slot holdings, operation and informational weights, and all pulse and packet records keep their original ownership. On the branch $\lambda=r_I=0$ the resulting minimum charged rate is $r_b$ times the shortest walk length divided by the common time. Common graph-independent weighted operating stock adds its common offset if retained under a positive operational weight.

This gives a complete finite decision for the declared coded slot source. A different activation rule with a signal-bearing uncharged timeout, a different physical coupling, or a graph-dependent duration or price uses a different state transition or cost and is not used in this comparison. ∎

<a id="theorem-c5p7"></a>

<a id="theorem-c5p7-exact-entanglement-assisted-paid-slot-ordering-on-trees-and-hamiltonian-wirings"></a>**Theorem C.5p.7 (Exact Entanglement-Assisted Paid-Slot Ordering on Trees and Hamiltonian Wirings).** Use the fixed-calendar packet source of Theorems C.5p.3–C.5p.6 with one $b$-qubit directed transmission in each paid slot, $b\ge1$. Allow arbitrary finite input-independent shared quantum stock, local instruments and feedforward. Each slot has a single receiver. All information that crosses a cut during execution must use the charged packet; local operation records can remain on their own side. Keep the independent classical source bits and exact joint delivery requirement. On a tree the least number of slots is
$$
K_b^{\rm q}(G)=\sum_{e\ \mathrm{oriented}}\left\lceil\frac{m_e}{2b}\right\rceil ,
\tag{C.5p.10a}
$$
where $m_e$ is the distinct-bit cut demand of Theorem C.5p.3. For all-gather with one bit per vertex on any connected $N$-vertex wiring, $N\ge2$, write $m=N-1$, $k=\lceil m/(2b)\rceil$, and $a=m-1-2b(k-1)$. Every wiring costs at least $Nk+a$ slots. A spanning cycle attains the bound, with the two-vertex single link also attaining it. Each attained comparison uses a finite reset-free stock of shared Bell pairs and charges the complete directed transmission even on a padded packet.

*Quantum cut bound.* Use entropy in bits. For a classical input string $X$ and all the registers $R$ on a receiving side, acquisition of a quantum packet $Q$ changes its information about $X$ by
$$
I(X:RQ)-I(X:R)=I(X:Q\mid R)\le 2\log_2\dim Q\le 2b .
$$
Indeed each of $S(Q\mid R)$ and $S(Q\mid XR)$ lies between $-\log_2\dim Q$ and $\log_2\dim Q$ by subadditivity and the Araki–Lieb inequality. Local operations on the receiver side or removal of an outgoing packet cannot increase the information by data processing. Local operations on the other side leave the unconditional receiver marginal fixed. These statements allow adaptive local controls conditioned on locally retained classical outcomes. The schedule and direction are independent of the source input, and no external outcome or timing signal enters the receiver state.

Delete an edge of the tree and read one side as the receiver. The required $m_e$ outside bits are initially independent of that side's state, including its shared input-independent stock. At delivery they are recoverable by a joint readout on its output registers, since the individual destination records are jointly exact. The information increase is $m_e$ and must pass through inward slots on the one edge. This gives $\lceil m_e/(2b)\rceil$ slots for each orientation. For an attaining construction, apply the classical tree schedule of Theorem C.5p.3 with capacity $2b$. Encode its packets using $b$ fresh Bell pairs with one half initially on each side of the transmitting edge. A Pauli on the sending half of a Bell pair produces four orthogonal Bell states, and joint readout after transmitting that half recovers exactly two bits. The tensor of $b$ copies realizes the entire $2b$-bit alphabet on one charged $b$-qubit packet (Bennett and Wiesner 1992).

*All-gather lower bound with arbitrary shared entanglement.* After the first $a$ slots, let $S_v$ be the undirected component of $v$ in their used edges. It contains at most $a+1$ vertices. No packet in the prefix crossed the cut of $S_v$. For each fixed word on $S_v$, its entire unconditional marginal after the prefix is independent of the word outside $S_v$. This follows by commuting the operations on the two sides of this cut and using trace preservation on the outside, even if its initial registers were entangled with $S_v$. In particular vertex $v$ has zero information about the uniformly independent outside bits. There are at least $N-(a+1)=2b(k-1)+1$ such bits. The cut argument now applied to the single receiver $v$ shows that it needs at least $k$ later incoming slots to read the outside word exactly. Summing over vertices counts each later slot once, giving $Nk+a$. If the proposed schedule is shorter than the prefix, its components give the same independence obstruction to exact recovery. Input-independent random schedules also obey the bound upon conditioning on the schedule and any initial public seed. The attaining cycle is the classical schedule of Theorem C.5p.5 with capacity $2b$, implemented with the same dense-coding packets. For $N=2$ use one slot in each direction.

*Physical stock and comparison.* At fixed $N$, demand list, and $b$, one can provision $b$ Bell pairs per possible active slot in the common finite reservation. The chosen fixed schedule prescribes their endpoint locations. Total ready stock, Bell-pair preparation budget, registers, clock and local control envelope can be made common by padding to the spanning-tree upper bound $P(N-1)$ for $P$ source bits. Every pair, including unused pairs, has its own ready registers and is entered in the initial stock ledger. The initial shared stock is part of the supplied preparation. If it must be generated by traffic during the paid run, that source has a different cost problem. Bell readout and classical packet processing can use reversible finite local unitaries with fresh records and a final readout, as in Theorem C.5p.6. The charged transmission itself is the directed swap of the complete $b$-qubit packet into the ready receive bank, and its return register is fixed ready. On the zero-operational-weight branch the cost is $r_b K_b^{\rm q}(G)/T_N$, with $r_b>0$ the complete packet price and $T_N$ the common reserved duration. The regular cycles and the irregular degree-three Hamiltonian comparators of Theorem C.5p.4 therefore have equal minimum all-gather propagation cost at every capacity sequence $b=b_N$, even with arbitrary shared entanglement and quantum local coding. $\square$

<a id="theorem-c5p8"></a>

<a id="theorem-c5p8-sharp-installed-wire-moments-for-packed-binary-trees"></a>**Theorem C.5p.8 (Sharp Installed-Wire Moments for Packed Binary Trees).** Take the complete binary tree of depth \(k-1\) with \(N=2^k-1\) vertices and physical length unit \(a>0\). Fix an integer \(D\ge2\), a uniform packing constant \(C\ge1\), and exponent \(p\ge1\). Allow placements with \(\#\{v:x_v\in B(x,R)\}\le C(1+R/a)^D\) for every Euclidean ball, counting vertices with their labels. For
$$
W_p(T_k)=\sum_{uv\in E(T_k)}(|x_u-x_v|/a)^p,
$$
every such placement has the respective lower order \(N\), \(N\log N\), or \(N^{p/D}\) as \(p<D\), \(p=D\), or \(p>D\). The lattice placements of Theorem C.5o attain these upper orders with a fixed packing constant. In particular the critical order cannot be lowered by rearranging the same labeled binary trees under the uniform packing bound.

*Upper orders.* At edge depth \(l\), Theorem C.5o gives \(2^l\) edges of length at most \(a\sqrt D\,2^{\lceil(k-l+1)/D\rceil}\). Raising that bound to \(p\) and summing gives at most a constant times
$$
2^{kp/D}\sum_{l=1}^{k-1}2^{l(1-p/D)} .
\tag{C.5p.11}
$$
The three orders follow from the geometric sum. Doubling the lattice spacing of that construction multiplies its wire moment by \(2^p\). Each coordinate interval of length \(2R\) then contains at most \(1+R/a\) lattice coordinates. The enclosing cube gives packing constant one, so the upper construction is admitted for every \(C\ge1\).

*Lower orders.* Write \(h=k-1\), and let \(E_l\) be the sum of the dimensionless length powers of edges at depth \(l\), \(1\le l\le h\). For a vertex at depth \(j\), its \(2^{h-j}\) descendant leaves are equally weighted. Choose a fixed integer \(r_0\) so large that \((2^{r_0}/(2C))^{1/D}\ge2\). Whenever \(h-j\ge r_0\), at least half of these leaves have distance from their ancestor at least \(a[(2^{h-j}/(2C))^{1/D}-1]\). This follows directly by applying the packing bound to that ball, and the lower radius is at least \(a(2^{h-j}/(2C))^{1/D}/2\). The mean dimensionless distance is at least \(c_0 2^{(h-j)/D}\), with \(c_0=(2C)^{-1/D}/4\). Average over all depth-\(j\) ancestors and their descendant leaves, or equivalently over all leaves with their own depth-\(j\) ancestor. On each connecting path the Euclidean distance is at most the sum of its edge lengths. Each level-\(l\) edge then occurs with probability \(2^{-l}\). The power-mean inequality gives
$$
c_0 2^{(h-j)/D}\le\sum_{l=j+1}^h (E_l/2^l)^{1/p},\qquad 0\le j\le h-r_0 .
\tag{C.5p.12}
$$
Taking \(j=h-r_0\), each term on the right is at most \((W_p/2^{h-r_0})^{1/p}\). The resulting inequality gives \(W_p\ge c_1 N\) for all sufficiently large \(k\), including all \(p<D\). Taking \(j=0\) instead bounds the right side by \(W_p^{1/p}\sum_{l\ge1}2^{-l/p}\) and gives \(W_p\ge c_2 N^{p/D}\), including \(p>D\).

At the critical value \(p=D\), divide (C.5p.12) by \(2^{(h-j)/p}\) and sum over \(j\). Then
$$
c_0(h-r_0+1)\le\sum_{l=1}^h(E_l/2^h)^{1/p}\sum_{j=0}^{l-1}2^{-(l-j)/p}
\le c_3 h^{1-1/p}(W_p/2^h)^{1/p} .
\tag{C.5p.13}
$$
The extended inner sum only enlarges the bound, and the last step is the power-mean inequality. This gives \(W_p\ge c_4 N\log N\) with fixed constants. The proof allows any admissible packed placement and uses the physical triangle inequality, including when some individual edges have arbitrarily small length.

*Consequence for the charged comparison.* In (C.5o.2), replace the linear installed-wire term by any fixed finite sum of terms \(\kappa_i W_{p_i}/N\) with \(1\le p_i\le D\) and \(\kappa_i\ge0\). Retain the common offset, the fixed positive all-pair per-hop price and the same graph candidate class. The explicit packed binary trees have installed-wire terms of order at most \(\log N\), logarithmic mean hop count and exponential root-ball growth on the expanding range \(0\le r\le k-1\). Any regular family in the scope of Theorem C.5m(4) has mean hop count divided by \(\log N\) tending to infinity. Its nonnegative installation terms cannot reverse the eventual inequality. Thus wire moments through the critical exponent cannot make this ledger retain that regular family while excluding the irregular comparator. The critical and supercritical lower orders above concern this particular binary-tree family. Deriving a physical wire-price law and deciding the corresponding ordering against other irregular graphs retain their tests. $\square$

<a id="theorem-c5p9"></a>

<a id="theorem-c5p9-sparse-branching-defects-under-every-fixed-wire-moment"></a>**Theorem C.5p.9 (Sparse Branching Defects under Every Fixed Wire Moment).** In the unit-hop all-pair source of Theorem C.5p, compare graphs at equal vertex count with the functional (C.5o.2), allowing any fixed finite nonnegative combination of installed-wire terms \(W_p/N\) for finite exponents \(p\ge1\). Fix a positive per-hop coefficient \(\lambda\), any Euclidean packing dimension \(D\ge2\), and degree capacity at least three. There are uniformly packed lattice placements of regular cycles and connected degree-three competitors of the same size such that the competitor is eventually strictly cheaper for every fixed choice of the wire-moment prices. Its branching balls violate the upper bound of (C.1) on every expanding unit-hop window with a bounded normalized lower cutoff. A single choice of the two graph sequences works for all fixed finite exponents and prices.

*Wiring and physical lengths.* Take even \(n\to\infty\) and choose \(h=\lfloor\log_2\log_2 n\rfloor\), with \(m=2^{h+1}-1\). Attach the root of a complete binary tree of depth \(h\) to one vertex of an \(n\)-cycle by a single bridge. Put \(N=n+m\). The root has degree three, as does the cycle attachment vertex. At the root the ball of hop radius \(r\le h\) contains at least \(2^{r+1}-1\) vertices. If the upper radius of an expanding window tends to infinity and its lower radius is bounded in hop units, taking the lesser of \(h\) and the integer upper radius gives arbitrarily large tested radii with this exponential lower count. The regular comparator is the \(N\)-cycle, with linear unit-hop growth.

Use lattice spacing \(2a\) in \(\mathbb R^D\). The \(n\)-cycle lies on the perimeter of a one-cell-wide rectangular strip with \(n\) lattice vertices, all at first coordinate at least zero. Its attachment is at one end. The tree is placed by the binary digit assignment of Theorem C.5o, scaled to the same lattice, reflected and translated into the negative first-coordinate half-space. Its enclosing cube and its distance from the attachment have side or length at most \(O_D(a m^{1/D})\). Its vertices therefore have disjoint lattice addresses from the cycle, and the bridge has length at most \(O_D(a m^{1/D})\). The enclosing-cube estimate gives packing constant one. The comparator \(N\)-cycle, with \(N\) odd, can be placed by deleting one corner vertex from a one-cell-wide rectangular perimeter of \(N+1\) lattice vertices and connecting its former neighbors by a diagonal. It too has packing constant one. Since all the long-cycle perimeter edges have length \(2a\), for every fixed \(p\ge1\) the two wire moments have a difference bounded in absolute value by
$$
O_{p,D}(m+ m\log(2m)+m^{p/D}) .
\tag{C.5p.14}
$$
Indeed the comparison of the two perimeter contributions costs at most \(O_p(m+1)\), while the tree moments are bounded by Theorem C.5p.8 and the bridge contributes at most \(O_{p,D}(m^{p/D})\). The number of edges is \(N\) in both graphs. This makes their edge-count charges equal.

*Exact hop-cost comparison.* Write \(H(G)=\sum_{x\ne y}d_G(x,y)\), with directed pair counting. For the even \(n\)-cycle the sum of distances from the attachment vertex is \(n^2/4\), and \(H(C_n)=n^3/4\). Write \(d_T(x)\) for the tree depth of a vertex. The attached graph \(G\) has
$$
H(G)=\frac{n^3}{4}+\frac{mn^2}{2}+2n\sum_{x\in T}(1+d_T(x))+H(T).
\tag{C.5p.15}
$$
Cycle–cycle and tree–tree distances are unchanged within their subgraphs. Every cross pair uses the bridge, which gives the second and third terms. The last two terms together are \(O(nm(1+h)+m^2h)\). The odd cycle has \(H(C_N)=N(N^2-1)/4\). Subtracting (C.5p.15) gives
$$
\frac{H(C_N)-H(G)}{N(N-1)}=\frac m4+o(m),
\tag{C.5p.16}
$$
because \(m=O(\log n)\), \(h=O(\log\log n)\), and \(n^2/N(N-1)\to1\). The installed-wire difference in (C.5p.14), divided by \(N\), tends to zero for every fixed finite \(p\). The same holds for any fixed finite sum with fixed prices. In (C.5o.2) the positive hop advantage therefore makes \(G\) strictly cheaper for all sufficiently large \(n\). The exact physical routing and common raw calendar are those of Theorem C.5p. The Euclidean installation charge is the supplied additional comparison term and the packet time remains the registered hop time. $\square$

<a id="theorem-c5p10"></a>

<a id="theorem-c5p10-equal-length-wiring-with-incompatible-local-growth"></a>**Theorem C.5p.10 (Equal-Length Wiring with Incompatible Local Growth).** Retain the attained all-pair routing source of Theorem C.5p. For every integer Euclidean packing dimension \(d\ge2\) and length \(a>0\), there are connected simple wirings \(G_n\) of maximum degree three and cycles \(C_{N_n}\) with the following properties. At each common size \(N_n\) both wirings have exactly \(N_n\) installed wires, all of length \(2a\), and both have packing constant one in the convention of Theorem C.5p.8. The mean directed hop count is \(O(\sqrt{N_n})\) on \(G_n\) and \(N_n^2/[4(N_n-1)]\) on \(C_{N_n}\). On every expanding hop-radius window below its diameter with bounded normalized lower cutoff, \(G_n\) fails the two-sided volume law (C.1) for every fixed positive exponent and fixed positive constants. The cycle has linear growth.

Consequently a lower cost gate that retains the cycles also retains the irregular wirings for all sufficiently large \(n\) on this branch. This holds for any installation charge that depends only on the installed length multiset and common size, and for any common upper wire cap of at least \(2a\). If the positive per-use cost or the positive transit time is supplied as a function of an edge's physical length, every occupied edge has the same corresponding value at \(2a\). The same distance ordering holds when the common reserved calendar of Theorem C.5p uses that slot duration.

*Construction and exact length census.* Work in \(2a\mathbb Z^d\) and give coordinates below in lattice units. For even \(n\ge4\) take the \(n\times n\) square of sites \((i,j)\) with \(0\le i,j<n\), using two coordinate axes. Install all vertical nearest-neighbor edges and the \(n-1\) horizontal nearest-neighbor edges on row \(j=0\). This is a tree. Install one further horizontal edge from \((0,n-1)\) to \((1,n-1)\). Attach the \(n\)-vertex path with vertices \((-1,0),\ldots,(-n,0)\) to \((0,0)\). The resulting \(G_n\) has \(N_n=n^2+n\) vertices and the same number of edges, since the extra top edge is its only addition beyond a spanning tree. The bottom row has degree at most three including the path junction. The added top edge joins two vertices of prior degree one. The even number \(N_n\) permits a rectangular cycle of \(N_n\) lattice sites, using two rows of \(N_n/2\) vertices and their two end connections. Its wires also have length \(2a\). A Euclidean ball of radius \(R\) is contained in a coordinate cube with side \(2R\), so either placement has at most \((1+R/a)^d\) sites in the ball.

*Hop ordering and growth.* Two square sites can use the bottom row and each travel vertically at most \(n-1\). A path vertex can reach any square site in at most \(n+2(n-1)\) hops. Hence the diameter is at most \(3n\), and the normalized directed hop sum is at most \(3n\). On the even cycle the sum from one vertex is \(N_n^2/4\), giving the claimed average. For any integer \(1\le r\le\lfloor n/4\rfloor\), the ball about \((0,0)\) contains the square sites with \(i+j\le r\), at least \((r+1)(r+2)/2\) sites. The ball about \((-n/2,0)\) has exactly \(2r+1\) sites, since it stays away from both the junction and the far end of the path. An expanding window with bounded lower cutoff contains arbitrarily large such test radii: choose the lesser of its integer upper endpoint and \(\lfloor n/4\rfloor\). The ratio of these ball sizes at that same radius tends to infinity. Both inequalities in (C.1) would bound the ratio by \(K_2/K_1\), independently of the exponent, which is impossible.

The installed wire inputs and size are equal and geodesic routing is attained in both graphs with the common calendar and complete raw-stock invoice of Theorem C.5p. Thus the comparison also defeats a hard uniform length cap combined with every fixed wire moment of Theorem C.5p.9. The construction tests a regular cycle and an irregular wiring. Deriving a PCE embedding premise with additional geometric constraints and deciding other traffic or path-dependent prices require their own comparisons. \(\square\)

<a id="theorem-c5p11"></a>

<a id="theorem-c5p11-equal-length-all-gather-comparators-at-every-packet-capacity"></a>**Theorem C.5p.11 (Equal-Length All-Gather Comparators at Every Packet Capacity).** Use the paid-slot all-gather source of Theorem C.5p.5 or the supplied-entanglement version of Theorem C.5p.7. There are equal-size regular and irregular Hamiltonian wirings of maximum degree three with identical installed length multisets, all lengths \(2a>0\), and uniform packing constant one in every Euclidean packing dimension \(d\ge2\). For every packet capacity and on both sources, their attained propagation charges are equal. Their common positive slot duration can be fixed by the physical edge length. The irregular wiring fails the two-sided hop-volume law (C.1) on every expanding window below its diameter with bounded normalized lower cutoff. The regular wiring satisfies (C.1) with exponent one.

*Hamiltonian placements.* Take even \(n\ge16\), work on \(2a\mathbb Z^d\), and give coordinates in lattice units. In the square \(0\le x,y<n\), use the return column \(x=0\). Starting at \((0,0)\), sweep row zero through \((1,0),\ldots,(n-1,0)\), step to the next row and sweep its columns \(n-1,\ldots,1\), alternating direction through row \(n-1\). Connect \((1,n-1)\) to \((0,n-1)\) and return along \(x=0\). Replace its edge between \((0,0)\) and \((0,1)\) by the path along \(y=0\) to \((-n,0)\), across to \((-n,1)\), and back along \(y=1\) to \((0,1)\). This is a Hamiltonian cycle on \(N=n^2+2n\) vertices. In addition install the vertical edges \((x,y)(x,y+1)\) with \(2\le x\le n-2\), \(0\le y\le n-2\), and \(x\equiv y\pmod 2\). These added edges are disjoint from the cycle and form a matching, since the two boundaries of an interior row have opposite parity requirements. If their number is \(m\), then \(2m\le(n-3)n\), so \(m\le N/2-2\). The graph has degree at most three and exactly \(N+m\) edges.

For the regular comparator take a two-row strip of length \(N/2\) in lattice units. Use its perimeter cycle and add \(m\) distinct vertical rungs at interior columns. The graph is also Hamiltonian of degree at most three with \(N+m\) edges. In both placements every wire is a lattice neighbor of length \(2a\), and the cube enclosing a Euclidean ball of radius \(R\) contains at most \((1+R/a)^d\) lattice sites. Thus both length multisets and packing bounds agree.

*Two volume tests.* Every hop changes the strip's column by at most one, so a ball of radius \(r\ge1\) contains at most \(2(2\lfloor r\rfloor+1)\) vertices there. From either row each vertex can reach at least \(\lfloor r\rfloor+1\) vertices along its own row for \(1\le r\le N/2-1\). This supplies an expanding window below the strip diameter and a linear law.

In the irregular graph, columns two and three suffice to move from \((2,0)\) to any row \(y\) at cost at most \(2y\), by alternating between the adjacent columns to take the available vertical edge. In that row every column from \(2\) through \(2+\lfloor r/4\rfloor\) is then reachable with at most \(\lfloor r/4\rfloor+1\) further hops. Thus for each integer \(4\le r\le n/4\), the radius-\(r\) ball at \((2,0)\) contains at least \((1+\lfloor r/4\rfloor)^2\) vertices, using rows zero through \(\lfloor r/4\rfloor\). By contrast, the radius-\(r\) ball at \((-n/2,0)\) consists of precisely \(2r+1\) vertices on the exterior path. It reaches neither end of that path nor the far turnaround. Any expanding window with bounded lower cutoff contains radii in this range tending to infinity, by taking the smaller of its integer upper endpoint and \(\lfloor n/4\rfloor\). The ratio of the two ball sizes diverges. A common upper and lower power bound with fixed constants would bound it by \(K_2/K_1\).

*Attained comparison.* For classical capacity \(b\ge1\) put \(B=b\); for quantum capacity \(b\ge1\) put \(B=2b\). Both wirings attain the universal lower bound
$$
N\left\lceil\frac{N-1}{B}\right\rceil+N-2-
B\left(\left\lceil\frac{N-1}{B}\right\rceil-1\right)
\tag{C.5p.17}
$$
of their respective sources using the spanning cycles. The fixed packet tariff, pulse duration, available side stock and common reserved calendar are those of the respective source. The same independently supplied positive slot price or time depending only on edge length applies to each used edge. If an additional installation term depends on size and the installed length multiset, it is equal in the two graphs. The two graphs also have the same feasibility under a common hard wire cap. Their equality in the charged ordering rules out separating this regular and irregular pair by an upper budget on the declared ledger. $\square$

<a id="theorem-c5p12"></a>

<a id="theorem-c5p12-tree-cut-residues-and-equal-length-all-gather-ties"></a>**Theorem C.5p.12 (Tree Cut Residues and Equal-Length All-Gather Ties).** Use the fixed-calendar paid all-gather source of Theorem C.5p.3 or Theorem C.5p.7 with one independent fair bit per vertex. Let $B=b$ for classical capacity $b$, and $B=2b$ for the supplied-entanglement quantum capacity $b$. On a tree of $N\ge2$ vertices the exact optimum depends on the edge cuts only through their sizes modulo $B$. For $N\equiv1\pmod B$ it is independent of the tree. For every fixed finite menu of classical and supplied-entanglement capacities, and also for a menu that grows with the grade, there are equal-size regular and irregular trees attaining the same optimum at every capacity on the menu. Both trees have maximum degree at most three, with identical installed length multisets and uniform planar packing. Their common packet costs and durations can be calibrated to the same edge length.

*Complete cut statistic.* Write $N=qB+r$, $0\le r<B$. If one side of an edge has $i$ vertices, the two oriented cut loads are $i$ and $N-i$. Theorems C.5p.3 and C.5p.7 make the optimal sum of the two charges in packet-slot units exactly $\lceil i/B\rceil+\lceil(N-i)/B\rceil$, allowing coding and the stated side stock. Writing $j=i\bmod B$ in $0,\ldots,B-1$, the sum is
$$
\begin{cases}
q+\mathbf1_{\{j>0\}},&r=0,\\
q+1+\mathbf1_{\{0<j<r\}},&1\le r<B .
\end{cases}
\tag{C.5p.18}
$$
This follows by splitting off the integer quotients of $i$ and $N-i$, whose remainders add to either $r$ or $B+r$. The expression is unchanged by exchanging the two sides. If $r=1$, every edge costs $q+1$. For $B=1$ every edge costs $N$. In the classical source, fixing the receiving-side inputs and independent controller tapes makes each of the $i$ independent outside bits recoverable only from the inward alphabet of at most $2^b$ values per slot. This gives the cut bound of Theorem C.5p.3. In the quantum source with supplied entanglement, each inward $b$-qubit slot increases mutual information about those outside bits by at most $2b$, even with prior communication and arbitrary input-independent entangled stock, by Theorem C.5p.7. The two-pass tree schedule attains the classical bound by packing $b$ bits at a time and the supplied-entanglement bound by packing $2b$ bits with $b$ fresh Bell pairs per slot. Every used packet and pair is counted in its own source inventory. Quantum packets without the stipulated shared entanglement have a different optimization problem, since earlier transmissions could themselves establish entanglement. No unassisted $2b$-bit capacity is used here.

*Equal-length tree construction.* Fix a grade $m\ge16$, let $\mathcal B_m$ be a nonempty finite set of tested effective capacities, and choose any integer $\ell_m\ge m$ divisible by each $B\in\mathcal B_m$. In units of a common positive edge length $2a$, take an axis backbone with vertices $(x,0)$, $-m\le x\le m$, and attach at each $x=0,\ldots,m-1$ one vertical path of $\ell_m$ edges from $(x,0)$ to $(x,\ell_m)$. Install only backbone and vertical path edges. Thus the comb is a tree of degree at most three with $N=2m+1+m\ell_m$ vertices. Take the other tree to be a straight path with $N$ vertices on the same lattice. Both have $N-1$ edges of length $2a$, and both obey the packing bound $\#B_{\mathrm{Eucl}}(R)\le(1+R/a)^d$ in every dimension $d\ge2$, by inclusion in the lattice $2a\mathbb Z^d$.

Root the comb at $(-m,0)$ and use the away-from-root cut size at each edge. A backbone cut has size equal to its suffix size on the backbone plus the sizes of the teeth attached to that suffix. All those tooth sizes are divisible by every tested $B$. Consequently the backbone cuts give exactly the residue multiset of $1,\ldots,2m$, for each tested $B$. Each of the $m$ teeth gives the cut sizes $1,\ldots,\ell_m$, with exactly $\ell_m/B$ occurrences of each residue. The path cuts have sizes $1,\ldots,N-1$, whose first $2m$ values give the same backbone residues. Its remaining $m\ell_m$ consecutive sizes give exactly the same additional uniform residue counts. Thus the full cut-residue histograms agree. Applying (C.5p.18) at every edge proves the claimed tie at every capacity in $\mathcal B_m$, with the same complete packet price and physical duration. The operating reservation and rate conventions of the paid-slot source are retained. On the zero-operational-weight branch the propagation tie is the charged ordering, and any common added size and installed-length tariff also ties.

*Volume comparison.* For the path, every graph ball of integer radius $1\le R\le N-1$ has at least $R+1$ and at most $2R+1$ vertices, so it has uniform exponent one in the unit-hop metric. For the comb, for every $4\le R\le\lfloor m/4\rfloor$, the ball centered at $(0,0)$ contains all $(x,y)$ with $0\le x,y\le\lfloor R/2\rfloor$. Their graph distance is $x+y$, and all such teeth and heights exist. Its cardinality is at least $(1+\lfloor R/2\rfloor)^2$. The ball about $(-\lfloor m/2\rfloor,0)$ on the bare tail has exactly $2R+1$ vertices in this range. Their ratio diverges along any sequence of radii in this range tending to infinity. Thus no uniform two-sided bound in (C.1) holds on an expanding window with bounded normalized lower cutoff. More generally the failure holds whenever the window intersects $[4,\lfloor m/4\rfloor]$ in radii tending to infinity. The slot comparison itself has no cutoff restriction.

Neither the hard common length cap nor a tariff depending only on the identical installed length multiset separates this pair under the stated all-gather ledger. The schedules use no Hamiltonian cycle and include every tested finite packet capacity. Other traffic demands, physical couplers and geometry-dependent costs retain their tests. $\square$

<a id="theorem-c5p13"></a>

<a id="theorem-c5p13-tree-all-gather-without-supplied-entanglement"></a>**Theorem C.5p.13 (Tree All-Gather Without Supplied Entanglement).** Use the independent source bits and fixed-calendar directed $b$-qubit paid slots of Theorem C.5p.7. Start with no quantum entanglement across vertices, allowing input-independent shared classical randomness and arbitrary subsequent generation and use of entanglement by paid transmissions. There is no other cross-cut communication. On a tree of $N$ vertices, every exact all-gather protocol uses, on each edge, at least
$$
\max\left\{
\left\lceil\frac{N}{b}\right\rceil,\,
\left\lceil\frac{i}{2b}\right\rceil+\left\lceil\frac{N-i}{2b}\right\rceil
\right\}
\tag{C.5p.19}
$$
slots, where the two sides have $i$ and $N-i$ vertices. A computational-basis implementation of the classical tree schedule costs $\lceil i/b\rceil+\lceil(N-i)/b\rceil$ on that edge, at most one more than the lower bound. In particular the exact optimum is $\left(N-1\right)\lceil N/b\rceil$ on every tree whenever $b=1$ or $N\equiv1\pmod b$, and is $2(N-1)$ whenever $b\ge N-1$. This gives exact regular–irregular all-gather ties without supplied entanglement.

*Cut accounting.* Delete one tree edge, and combine each side's registers into a single party, called $A$ and $B$. Condition on the shared classical seed. The independence of the source bits and exactness on their finite alphabet imply almost-sure exactness for the conditioned protocol. Fixing this seed also fixes any randomized input-independent calendar. Purify every local initial mixed register within its own party. Dilate local instruments to local isometries while keeping all their environment records and classical control records on their original sides. For fixed classical input words $(X,Y)$ on the two sides, the joint physical and retained purification state is then pure at all times, and is initially a product across the cut. Retention can only increase the accessible information and does not add a crossing slot. Local operations internal to one side, including all other graph transmissions, are isometries on that side in the retained description.

Let $\mathcal I_A=I(Y:A\mid X)$ and $\mathcal I_B=I(X:B\mid Y)$ in bits in the resulting classical–quantum state. Let $E$ be the average entanglement entropy of the two parties conditional on both words. Initially all three quantities vanish. At the end, exact recovery gives $\mathcal I_A=|Y|$ and $\mathcal I_B=|X|$, where the lengths count the outside source bits demanded by all-gather. Also $E\ge0$. At one crossing transmission $A\to B$ of register $Q$, the information at $A$ cannot increase since it loses a register. Write $B$ for the receiver stock before transfer. The receiver gain is
$$
\Delta\mathcal I_B=S(Q\mid B,Y)-S(Q\mid B,X,Y).
$$
For each fixed pair of words, the receiver entropy change is the conditional entropy of the newly received register, so the second term is exactly $\Delta E$. The first term is at most $\log_2\dim Q\le b$. Thus the increment of $\mathcal I_A+\mathcal I_B+E$ is at most $b$. The reverse direction gives the same bound. All within-side isometries preserve this potential. Summing across the cut gives $bK\ge |X|+|Y|=N$ at any exact schedule. In each separate direction the mutual information gain is at most $2b$ as in Theorem C.5p.7, and hence the sum of the two directional slot bounds also applies. These are the two entries of (C.5p.19).

*Exact classes and common stock.* The classical tree algorithm sends only orthogonal computational-basis packet words through the quantum port. Its charge counts the whole $b$-qubit packet even for incomplete payloads, and it uses no prepared entanglement. Its count per edge exceeds $\lceil N/b\rceil$ by either zero or one, by the residue formula of Theorem C.5p.12. When $b=1$ or $N\equiv1\pmod b$, that residue formula makes every edge attain $\lceil N/b\rceil$. If $b\ge N-1$, each direction uses exactly one slot per edge, and both are required by the nonempty outside bits, so the count is $2(N-1)$. All these constructions use the same finite paid clock and packet tariff within a comparison, with independent setup records and equal padded reserves as in Theorem C.5p.7. For the exact topology-independent grades one can use the same-size path and degree-three tree families on unit-hop links, or the equal-length planar comb construction of Theorem C.5p.12 on grades chosen to have $N\equiv1\pmod b$. At every edge the lower bound includes any local creation, retention and later use of entanglement within the paid protocol. The general intermediate-capacity case retains the one-slot-per-edge interval rather than a claim of attainment. $\square$

<a id="theorem-c5p14"></a>

<a id="theorem-c5p14-exact-tree-all-gather-with-entanglement-generated-in-the-run"></a>**Theorem C.5p.14 (Exact Tree All-Gather with Entanglement Generated in the Run).** Use the fixed-calendar directed $b$-qubit paid source of Theorem C.5p.13, with no shared initial entanglement and one independent fair bit at each vertex of a tree of $N\ge2$ vertices. Local operations can generate Bell pairs, and every pair crossing an edge must use that edge's charged packet. The exact optimum is
$$
K_b^{\rm gen}(T)=(N-1)\max\left\{2,\left\lceil\frac{N}{b}\right\rceil\right\}
\tag{C.5p.20}
$$
for every tree and every integer $b\ge1$. A single upward and downward traversal attains it with the complete finite packet and preparation ledger. Hence the charged propagation ordering on this source is independent of the tree at each size and capacity.

*Lower bound.* For each tree edge, Theorem C.5p.13 gives at least $\lceil N/b\rceil$ charged crossings, allowing arbitrary in-run entanglement generation and interactive local quantum controls. Each side also needs an inward crossing, because it must recover nonempty independent input data initially held on the other side. Thus each edge costs at least $K=\max\{2,\lceil N/b\rceil\}$. Every slot crosses just one tree edge, so the lower bounds add.

*Upward gather with reserved entanglement.* Root the tree at a centroid, a vertex whose removal leaves no component larger than $N/2$. To see existence, start at any vertex and move toward its component of size greater than $N/2$, if one exists. The side behind that move has size less than $N/2$, and any next large component is strictly smaller than the previous one. The process terminates at a centroid. For an edge with child subtree size $i$, set $j=N-i$, so $1\le i\le j$. Put $a=\lceil i/b\rceil$ and $c=\lceil j/b\rceil$. Their sum lies between $K$ and $K+1$, by the ceiling inequality and positivity of both sides.

Process child edges in decreasing depth. The child has all $i$ bits of its subtree by its own earlier gather. It sends those bits to its parent in $a$ charged $b$-qubit packets, encoding the bits in computational-basis coordinates. If $a+c=K$, no entanglement is needed on this edge. If $a+c=K+1$, the parent will instead use $c-1$ downward packets. In that case $c\ge2$, since $i\le j$ and $c=1$ would give $a=c=1$ and $a+c=K=2$. Define
$$
d=j-b(c-1),\qquad 1\le d\le b .
$$
Since $a+c-1=K\ge\lceil N/b\rceil$, the slack in the $a$ upward packets satisfies
$$
ab-i\ge j-b(c-1)=d .
$$
The child prepares $d$ Bell pairs locally, keeps one half of each, and sends the other halves in $d$ otherwise padded upward coordinates. These qubits occupy real charged packet positions, separately from the $i$ computational-basis data coordinates. The parent retains the received halves without a measurement. No quantum stock crosses a cut before its first charged use.

If $j$ is divisible by $b$, the displayed deficit would be $d=b$, whereas $ab-i<b$ by the definition of $a$. Thus this divisibility case never triggers the reduction. Equivalently, reducing by one requires both cut loads to have nonzero remainders and their sum to fit in one $b$-coordinate block.

*Downward distribution.* After the gather, the root has the whole word. Process parent edges in increasing depth. On each edge the parent has the whole word when its downward packets are sent, and the child already knows its own subtree word. The child therefore needs only the $j$ outside bits. When $a+c=K$, the parent sends them in $c$ basis packets. Otherwise, place the $d$ received halves into the $c-1$ downward packets, and apply one of the four Pauli encodings to each for $2d$ of the outside bits. The other $b(c-1)-d$ coordinates carry ordinary basis bits. There are $b(c-1)+d=j$ bit positions in total. Each half sent back is decoded against its original half at the child. Since $c-1\ge1$ and $d\le b$, the chosen halves fit even in the first of these packets. This yields the full word at the child. It now serves its own children in the same order. The two traversals therefore give exact joint all-gather for every input word with exactly $K$ charged packets on each edge.

*Physical packet accounting.* The direction, buffer layout, word positions, local pair preparations and pulse list are determined by $T,N,b$ before the bits are supplied. Both sides reserve the same positive duration and full $b$-qubit packet service of Theorem C.5p.7. Prepare each Bell pair with a Hadamard and controlled copy into a fresh ready pair of registers. For each returned half, the receiver's inverse Bell preparation transform produces a two-bit computational-basis label, up to an irrelevant phase on that input word. Copy the label into the retained output bank and keep the two decoded qubits as spent records. There is no discarded ancillary state or implicit reset. Basis data and Pauli controls use retained local copies, and all output registers can be read after the last operation. Exact correctness on each independent classical input word gives correctness on all mixtures and with external references classically correlated with that input. The comparison does not require transfer of a coherent superposition of input words. Each generated pair is prepared and stored locally until its outbound half is actually transmitted upward. Distinct paid slots have distinct receive and fuel factors. The entanglement used for dense coding is exactly the stock generated in those upward slots, and both its preparation and decoding are charged in the local operating reservation. For fixed $N,b$, one can use a common padded upper bound of $b(N-1)$ locally prepared pairs, common local memory and control envelope, and the same occupied slot count $K(N-1)$ across the tree comparison. Thus on the original zero-operational-weight branch the common complete propagation price is $r_b K(N-1)/T_N$. The same propagation tie holds with common added operating and installation charges under the corresponding reservation convention.

For the entirely classical $b$-bit packet comparison, arbitrary coding already attains its minimum $\sum_e(\lceil i_e/b\rceil+\lceil (N-i_e)/b\rceil)$ by Theorem C.5p.3. Hence the exact quantum saving is the number of edges on which that classical sum is $K+1$. In the rooted schedule these are precisely the edges using the Bell-half procedure. If no quantum entanglement is ever generated and all packets are classical basis symbols, the same tree cut formula applies to the resulting transcript.

In particular the equal-size equal-length path and comb of Theorem C.5p.12 have equal exact unassisted-source all-gather costs for every capacity, without a modular restriction on the tooth lengths for this comparison. Their unit-hop growth distinction holds on the same expanding windows. Other demands and physical coupler classes require their own tests. $\square$

<a id="theorem-c5p15"></a>

<a id="theorem-c5p15-a-strict-quantum-multicast-scheduling-premium-on-a-tree"></a>**Theorem C.5p.15 (A Strict Quantum Multicast Scheduling Premium on a Tree).** Use the fixed-calendar directed $b$-qubit source of Theorems C.5p.13–C.5p.14, with $b\ge2$ and no shared initial entanglement. Consider the three-vertex path $A-C-B$. The endpoints hold independent words $X,Y$ of $b+1$ fair bits each. The centre $C$ must recover both words, and the other endpoint must recover a designated first bit of each word: $B$ needs $X_1$ and $A$ needs $Y_1$. The directional and total information inequalities in Theorem C.5p.13, applied separately to each demand cut, allow two slots on each edge. On each edge the two-slot bound is attainable in isolation with its incoming bit available at the sender. On the actual three-vertex tree the exact multicast optimum is five paid slots.

*The two-slot cut condition.* At either edge the two cut demand counts are $b+1$ toward the centre and one toward the endpoint. They require one crossing in each direction and permit this count according to the inequalities $2b\ge b+1$ for a direction and $2b\ge b+2$ overall. In a schedule with only two slots across that cut, the outward slot from the centre side must precede the inward slot. Otherwise the unique inward packet has no earlier shared entanglement across the cut. Conditional on the cut-side inputs and any fixed input-independent shared classical seed, its information gain about the $b+1$ outside bits is at most $b$. This follows from the conditional pure-state entanglement identity in Theorem C.5p.13 because the cut entanglement starts at zero and becomes nonnegative, or from the Holevo bound for the first packet with independent receiving stock. The later outward slot and all subsequent operations on the centre side cannot increase its information about those outside bits. Thus recovery of the $b+1$ bits is impossible in this order. In the reverse order the centre can transmit one classical bit and one locally prepared Bell half in the outward packet. The endpoint then uses the shared pair for two input bits and the remaining $b-1$ coordinates for the other input bits, realizing both cut demands in two slots when that centre-side bit is available.

*Causal contradiction for four slots.* A four-slot tree schedule would have precisely one slot in each direction on each edge. Write $x$ and $y$ for the times of $A\to C$ and $B\to C$, and $u$ and $v$ for $C\to A$ and $C\to B$. The two-slot cut condition implies $u<x$ and $v<y$. The requested bit $Y_1$ at $A$ requires $y<u$. Indeed with no $B\to C$ crossing before $u$, all registers on the $A,C$ side are independent of $Y$ conditional on $X$ and the fixed seed. Local operations at $B$, including controls on any shared stock produced by earlier outward transmission, cannot signal this bit without an inward packet. After the unique $C\to A$ slot, trace-preserving operations outside $A$ and its own outward transmission cannot provide it. The same argument for $X_1$ at $B$ requires $x<v$. The resulting chain $u<x<v<y<u$ is impossible. This proof applies to arbitrary local quantum controls and input-independent shared classical randomness by conditioning on an exact fixed seed. It needs no assumption that the intermediate quantum states are classical.

*An attaining five-slot source.* First send $X$ from $A$ to $C$ in two basis packets. Next send $X_1$ from $C$ to $B$ in one basis coordinate, and use one other coordinate of that same paid packet for the outbound half of a fresh Bell pair prepared at $C$. Then $B\to C$ returns the half carrying two dense-coded bits of $Y$ and carries the other $b-1$ bits as basis coordinates. Finally $C\to A$ sends $Y_1$ in one packet. This is a fixed calendar of five paid slots, with known ready padding, separate fresh receive and fuel factors, retained basis and Bell decoder records and one locally prepared pair owned and paid as in Theorem C.5p.14. Every message is a function or controlled encoding of data available at its sender by that cut. The protocol delivers the full requested classical response on every word, including mixtures with classical references.

Thus optimizing each edge's two-party demand counts does not in general give an attainable simultaneous tree optimum. The obstruction uses causal dependence of the actual outbound payloads, in addition to entanglement accounting. The full general tree multicast optimum outside the stated example retains its test. $\square$

<a id="theorem-c5p16"></a>

<a id="theorem-c5p16-exact-causal-premium-for-quantum-star-multicast"></a>**Theorem C.5p.16 (Exact Causal Premium for Quantum Star Multicast).** Use the paid directed $b$-qubit slots of Theorems C.5p.13–C.5p.15, with $b\ge2$ and no shared initial entanglement. On a star with centre $c$ and $n\ge1$ leaves, each leaf $i$ holds an independent fair word $X_i$ of $b+1$ bits, and $c$ must recover every word. Let $D$ be a loopless directed graph on the leaves with in-degree at most $b-1$. For each arc $i\to j$, leaf $j$ must recover the designated bit $X_{i,1}$. If a leaf has no incoming arcs, require it to recover one independent fair bit held at $c$. The fixed-calendar optimum over all local quantum controls is
$$
K_b(D)=2n+\tau(D),
\tag{C.5p.21}
$$
where $\tau(D)$ is the minimum cardinality of a vertex set meeting every directed cycle of $D$. Thus the exact gap above the sum of the individually attainable cut bounds is the minimum number of leaves whose additional slots break all causal cycles. The optimum is attained with finite registers, independently prepared ready stock and a paid schedule.

*Cuts and information order.* Every leaf edge needs at least one transmission toward $c$, for the full independent word, and one toward the leaf, for its independent required payload. Condition on any fixed input-independent shared classical seed. Across that leaf cut no shared entanglement is supplied at the start, and only this edge can establish it. If the edge uses exactly two slots, write $d_i$ for its outbound time from $c$ and $u_i$ for its inbound time. Then $d_i<u_i$. Otherwise the leaf's sole inbound transmission is the first crossing on its cut. Its recipient has no previously shared entanglement with the leaf. A $b$-qubit packet can then convey at most $b$ bits of information about the independent word across the cut. This is the first-packet bound in the proof of Theorem C.5p.15. Once that crossing has occurred, subsequent operations within either side and the sole transmission away from $c$ cannot increase the centre side's information about that word. Exact recovery of $b+1$ bits therefore requires the stated order.

If $i\to j$ and both edges use exactly two slots, one also needs $u_i<d_j$. Before $i$'s sole inbound slot, the registers on the other side of its cut have no information about $X_{i,1}$. Local controls at leaf $i$ cannot signal the bit through any earlier entanglement preparation. If $j$'s sole outbound slot from $c$ occurred before $u_i$, it would have conveyed no information to $j$ about that bit. Later local operations, including any joint action on the other leaves and centre, and the inward transmission from $j$, cannot change this. This is the marginal no-signalling argument for a fixed calendar; it applies to arbitrary intermediate entanglement and retained memory. A directed cycle of exactly-two-slot leaves would therefore require the strict temporal inequalities $d_i<u_i<d_j$ around the cycle, which is impossible. The set of leaves whose edges use more than two slots meets every cycle. Each such edge costs at least three, and slots are charged separately on each edge. This gives $K_b(D)\ge 2n+\tau(D)$.

*An attaining calendar.* Choose a minimum cycle-meeting set $S$, with its exact finite certificate obtained by enumerating vertex subsets and testing directed acyclicity of the complement. First gather the full words of all leaves in $S$ using two ordinary $b$-qubit basis packets per leaf. Then process the other leaves in a topological order of $D\setminus S$. For the current leaf $j$, the centre already has the requested bits from every predecessor, including those in $S$, or it has the designated centre bit. The payload contains at most $b-1$ bits. Send those bits in ordinary basis coordinates and a fresh Bell half in one further coordinate of a single paid packet. The leaf recovers the payload and encodes two bits of its word by a unitary on the supplied Bell half and returns it, together with its remaining $b-1$ bits in basis coordinates. The centre decodes the two Bell bits and the ordinary coordinates, recovering the entire word. This is one packet in each direction. Finally, deliver the required payload to each leaf in $S$ using one ordinary packet, after all words are known at $c$. Local Bell preparation, padding, receive registers, decoding and retained outputs are paid by the same finite source as in Theorem C.5p.14. No pair crosses an edge except in its counted packet. The schedule acts on every classical word and on every mixture with retained classical references. It has $3|S|+2(n-|S|)$ slots (Bennett and Wiesner 1992).

For a single directed cycle the gap is one, recovering the three-vertex example when the cycle has two vertices. For a disjoint union of $r$ nonempty directed cycles the gap is $r$, with the same two-slot isolated demand on every edge. Acyclic $D$ attains all the cut bounds together. The result classifies the stated family of genuinely joint multicast schedules, including arbitrary directed dependencies within the in-degree budget. General tree topologies and other payload classes require their own comparison. $\square$

<a id="theorem-c5p17"></a>

<a id="theorem-c5p17-weighted-quantum-star-multicast-with-unequal-payloads"></a>**Theorem C.5p.17 (Weighted Quantum Star Multicast with Unequal Payloads).** Use the fixed-calendar paid directed $b$-qubit source of Theorem C.5p.16 on a star, with $b\ge2$ and no shared initial entanglement. Leaf $i$ holds $l_i$ independent fair bits, with $1\le l_i\le 2b$, and the centre must recover its full word. Leaf $i$ requests $d_i$ distinct independent bits, with $1\le d_i\le b$, held initially at other leaves or at the centre. Some of these bits may also be requested by other leaves. Let the two prices on leaf edge $i$ be $w_i^\uparrow>0$ toward the centre and $w_i^\downarrow>0$ away from it. Each price is for one full physical slot, including padding, and is independent of input and time. Define
$$
H=\{i:l_i>b\},\qquad S_0=\{i\in H:l_i+d_i>2b\},\qquad
c_i=\min(w_i^\uparrow,w_i^\downarrow).
$$
On the leaves draw an arc $i\to j$ whenever $j$ requests any bit of $i$. Let $\tau_c$ be the minimum sum of $c_i$ over sets meeting every directed cycle in the graph induced by $H\setminus S_0$. The exact minimum paid slot charge is
$$
\sum_i(w_i^\uparrow+w_i^\downarrow)+\sum_{i\in S_0}c_i+\tau_c .
\tag{C.5p.22}
$$
An explicit finite paid protocol attains it for every input word and for every retained classical reference. The comparison counts the designated slot charge with all supplied preparation and native resources retained, as on the source of Theorem C.5p.16.

*Information and causal lower bounds.* Condition on a fixed input-independent shared seed. Each edge needs at least one slot in each direction since each side demands a nonempty independent word from the other. For an edge with only two slots and $l_i>b$, the outbound slot must occur first by the first-packet bound of Theorem C.5p.15. The generated-entanglement cut potential of Theorem C.5p.13 also gives $l_i+d_i\le2b$ for any two-slot edge. To apply it, take the full independent input on each side of the cut and keep all within-side purifications. At exact recovery the two mutual informations used in the potential are at least $l_i$ and $d_i$, because those subsets of the words have been decoded. The final conditional entanglement is nonnegative. Each crossing increases the potential by at most $b$. Consequently every edge in $S_0$ needs at least one additional slot, costing at least $c_i$.

For two leaves $i,j\in H$ whose edges each use only two slots, an arc $i\to j$ requires the inward slot at $i$ before the outward slot at $j$. Before the first transmission from $i$, the other side of its cut has no information about that independent bit, even if it has sent entanglement to $i$. The only outbound slot to $j$ must convey the bit's influence. These are exactly the no-signalling and fixed-calendar order constraints of Theorem C.5p.16. A directed cycle of such leaves is impossible since each also needs its own outward slot before its own inward slot. Thus among $H\setminus S_0$ the leaves with an extra slot meet every directed cycle. The individual slot charges add, giving (C.5p.22) as a lower bound.

*Attaining the weighted bound.* Choose $S$ attaining $\tau_c$, and put $B=S_0\cup S$. First gather every word with $l_i\le b$ in one ordinary basis packet. Also gather every word in $B$. If the inward slot is cheaper at $i\in B$, use two ordinary inward packets. If the outward slot is cheaper, send $l_i-b$ fresh Bell halves from the centre in one early outward packet, with any remaining coordinates padded. The leaf uses them to encode $2(l_i-b)$ bits and uses its remaining $2b-l_i$ coordinates as ordinary bits in its single inward packet. This sends all $l_i$ bits. Both protocols leave one final outward slot for the requested payload, after the centre knows all words.

Process the leaves of $H\setminus B$ in a topological order of their induced dependency graph. The centre already has every requested bit at such a leaf, including bits from earlier processed leaves, the gathered leaves and its own stock. Send the $d_i$ requested bits and $l_i-b$ fresh Bell halves in one outward packet. They fit because $l_i+d_i\le2b$. The leaf sends the complete word inward in one packet by the same dense and ordinary encoding just described. Finally send the required payload in one outward packet to each gathered leaf, including each leaf of $B$. Every slot uses the ordinary paid preparation, receive stock and reference-retaining decoders of Theorem C.5p.16. The schedule uses only already available bits, and each Bell half that crosses a cut has a charged slot. Its charge is exactly (C.5p.22). Finite subset enumeration and directed acyclicity give a verifier for the optimizing set; the quantum lower bound applies to arbitrary local controls. Equal prices and $l_i=b+1$, $d_i\le b-1$ recover Theorem C.5p.16. General tree topologies and other traffic classes retain their tests. $\square$

<a id="theorem-c5p18"></a>

<a id="theorem-c5p18-exact-robust-erasure-routing-and-its-growth-obstruction"></a>**Theorem C.5p.18 (Exact Robust Erasure Routing and Its Growth Obstruction).** Fix $0<p,s<1$. Use the classical route and fixed reservation convention of Theorem C.5j. Each used hop transmits a fixed positive integer number of copies. Its copy-erasure indicators have product Bernoulli law with erasure probability $p$. Between different hops their joint law is arbitrary, independent of the input symbol. A relay copies any surviving symbol and passes an erasure if none survives. A route allocation must guarantee survival at least $s$ against every admitted coupling. The route's actual joint law is a supplied source datum for the final attenuation, and can depend on neither the symbol nor an observed response to it. Let $F(d)$ be the least reserved copy count on a route of $d$ hops that guarantees the required survival. For every $d\ge1$,
$$
F(d)=\min\left\{B\ge d:\ p^q(d-r+pr)\le1-s,\quad q=\lfloor B/d\rfloor,\quad r=B-dq\right\}.
\tag{C.5p.23}
$$
The minimum is attained by the indicated balanced allocation, and the source can give the same exact endpoint erasure channel of survival $s$ at every graph and allocation admitted by the guarantee. If all ordered distinct pairs are demanded independently on the finite supplied-stock source of Theorem C.5p with this erasure port, the exact graph-dependent charge is ordered by
$$
J(G)=\sum_{u\ne v}F(d_G(u,v)).
\tag{C.5p.24}
$$
At every fixed degree cap $\Delta\ge3$, every sequence with $J(G_N)\le \min_{\deg G\le\Delta}J(G)+\mathcal E_N$ and $1+\mathcal E_N/N=N^{o(1)}$ has subpolynomial diameter. It fails a uniform polynomial upper ball bound on every expanding unit-hop window below its diameter, including windows with diverging lower endpoint. Thus an attained budget gate that retains a uniform polynomial-growth family at this degree cap also retains an irregular comparator on the same source.

*Exact survival and physical endpoint.* Given copy counts $k_j$, let $A_j$ be the event that all copies on hop $j$ are erased. Its probability is $a_j=p^{k_j}$. Success is the complement of $\bigcup_j A_j$. Its exact achievable range is
$$
\left[\max\{0,1-\textstyle\sum_j a_j\},\ 1-\max_j a_j\right].
\tag{C.5p.25}
$$
For the upper endpoint nest intervals of lengths $a_j$ on the unit interval. For the lower endpoint place arcs of lengths $a_j$ end to end on a unit circle, using their images modulo one, so their union has length $\min\{1,\sum_j a_j\}$. In either case the finitely many interval endpoints define a finite atom distribution for the all-erased flags. Conditional on $A_j$, use the all-erased pattern. Conditional on its complement, use the product Bernoulli law for that hop conditioned on at least one successful copy. Drawing these residual patterns independently given the flags restores the full product marginal within each hop. Hence the two extremizers satisfy the complete within-hop requirements. Mixing their atom laws gives every intermediate survival. Every such law is on finitely many binary words, with rational weights when the probabilities are rational. Preparing its diagonal mixture is a finite supplied-state input with the correlated masks owned at the respective ports. These masks have no access to the input symbol and can only control the named copy-erasure modules. Branches after an erasure still consume their reserved slots. The record retains all erasure flags and the erased transport contents in their own modules. This implements the displayed channel using classical controlled swaps with separate ready and history registers. To make the endpoint survival exactly $s$ when its certified preattenuation survival is $S\ge s$, the final module independently erases a surviving symbol with probability $1-s/S$. This attenuation uses the supplied probability word $S$ and a separate finite ready coin. No trial is used to choose $S$. The projected endpoint record is the delivered symbol or the erasure flag. Erasure histories remain owned and priced, and can distinguish implementations on an interface that retains them as outputs.

To guarantee survival at least $s$ the necessary and sufficient condition is $\sum_jp^{k_j}\le1-s$. For fixed total $B$, moving one copy from a count at least two larger than another to that smaller count strictly decreases this sum, since the decrement $p^k-p^{k+1}$ is strictly decreasing in $k$. Iteration gives (C.5p.23). The minimum is finite by taking every $k_j$ large. Deleting a hop from a feasible allocation preserves feasibility and removes at least one copy, so $F(d+1)\ge F(d)+1$. Thus the cheapest route uses a geodesic. All ordered pairs may run as disjoint demands, with independent source fixtures across demands. Install the protected local cores, finite serial calendars, local record banks, hop kits and common reserves of Theorem C.5p. At fixed $N$ a common finite upper bound on the reserved copy count is $F(N-1)$ per demand, and every allocation attaining (C.5p.23) fits that comparison. The old qualification takes place with the new ports disabled. A positive tariff $c$ prices each reserved copy with its actual erasure, preparation, history and release modules, and a common per-demand charge owns the final coin and its readout. The reserves also include every local control and intermediate flag. The raw reservation can be padded before choosing the graph as in Theorem C.5p, with the same fixed positive comparison duration. The graph-dependent term is $cJ(G)$ divided by that duration on its zero-operational-weight branch, and the common raw-stock contribution gives a common offset if positively weighted. Each ordinary transport use remains a paid kit, including when the mask suppresses useful delivery. The projected output of each demand is the same channel after attenuation, including for symbol inputs correlated with a retained classical reference. This is the stated fixed-calendar route class with independent demand fixtures. A controller with cross-demand coding or control of the coupling law has a different optimization.

*Bounds for the routing cost.* Put $a=1-s$ and $\eta=-\ln p$. Let $f$ be the continuous strictly decreasing interpolation of $k\mapsto p^k$ on $[1,\infty)$, linear on every integer interval. When $a/d\ge p$, set $x(d)=1$; otherwise set $x(d)=f^{-1}(a/d)$. Formula (C.5p.23) gives $F(d)=\lceil d x(d)\rceil$. This follows since a balanced allocation of $B$ copies gives the mean $f(B/d)$. In the active inverse region, $x(d)=(\ln(d/a))/\eta+O(1)$ because $f$ lies between the two successive powers in each unit interval. Away from the interpolation breakpoints, if $q\le x(d)<q+1$ then
$$
\frac{d}{dd}[d x(d)]=x(d)+\frac{a}{d(1-p)p^q},\qquad
\frac{p}{1-p}\le\frac{a}{d(1-p)p^q}\le\frac{1}{1-p}.
\tag{C.5p.26}
$$
The inactive region has derivative one. Each compact interval has finitely many breakpoints, and the function is continuous there. Integrating over each unit interval, then accounting for the rounding error of at most one in an increment, gives constants $c_1,c_2>0$, depending only on $p,s$, such that
$$
c_1\bigl(1+\ln d\bigr)\le F(d+1)-F(d)\le c_2\bigl(1+\ln d\bigr),\qquad d\ge1.
\tag{C.5p.27}
$$
For the finitely many small values use $F(d+1)-F(d)\ge1$. Also $F(d)=d\ln d/\eta+O_{p,s}(d)$ and $F(d)\ge d$.

*Near-minimal diameter.* Write $N=|V(G)|$ and $\mathcal E=\mathcal E_N$. The heap tree of Theorem C.5m is admissible and has diameter at most $2\lceil\log_2 N\rceil$, so $J(G)/N^2\le k:=F(2\lceil\log_2 N\rceil)+\mathcal E/N^2$. Since $F(d)\ge d$, there is a centre $u$ with mean ordinary hop distance at most $k$. Let $M(R)$ count vertices with distance from $u$ greater than $R$, and use the same degree-preserving exterior-component replacement at each integer cutoff $R$ as Theorem C.5p.2. Write $L=2\lceil\log_2 N\rceil+2\Delta$ for its replacement-diameter bound. For each integer $r\ge \max\{8(L+2),4k\}$, average the replacement over $R=r,\ldots,2r-1$. The proof of Theorem C.5p.2 gives new diameter at most $6r$ and the mean sum of positive ordinary distance increments at most $14N M(r/2)(L+2)$. A positive increment has both distances at most $6r$. By (C.5p.27) the mean positive increment in $J$ is therefore at most $C_1(1+\ln r)N M(r/2)(L+2)$ for a constant $C_1$ depending only on the source parameters.

For a pair with one endpoint outside radius $8r$ and the other within $r/2$, the old distance is greater than $15r/2$ and the new distance at most $7r/2$. Thus the distance-cost decrease includes all increments from $4r$ through $7r$, and is at least $C_2r(1+\ln r)$ for a fixed $C_2>0$. Since $M(r/2)\le 2Nk/r\le N/2$, at least $NM(8r)$ ordered pairs have this property. For each replacement, $J(G_R)-J(G)\ge-\mathcal E$. The averaged bound and division by the common logarithmic factor give a constant $K\ge1$ depending only on $p,s$ with
$$
M(8r)\le\frac{K(L+2)}r M(r/2)+\frac{K\mathcal E}{Nr}.
\tag{C.5p.28}
$$
Choose $r_0=\lceil\max\{64K(L+2),4k\}\rceil$ and $r_j=16^j r_0$. At $j=0$ use $M(r_0/2)\le N$. The relation $r_j/2=8r_{j-1}$ and (C.5p.28) then give, by induction,
$$
M(8r_j)\le N\,64^{-(j+1)}16^{-j(j+1)/2}+\frac{2K\mathcal E}{Nr_j}.
\tag{C.5p.29}
$$
For the error term, multiplication of the preceding bound by $K(L+2)/r_j$ contributes at most one quarter of $2K\mathcal E/(Nr_j)$, and the new term contributes one half of that value. Take $j\ge\lceil\sqrt{\log_4 N}\rceil$ minimal with $r_j\ge4K\mathcal E/N$. The first term is strictly less than $1/2$ and the second at most $1/2$, so the integer tail count is zero. Thus $\operatorname{diam}G\le16r_j$. The assumed tolerance, $k=O(\log N\log\log N)+\mathcal E/N^2$, and the fixed cap give $r_j=N^{o(1)}$.

*Volume-law exclusion.* Suppose every ball has size at most $C(1+r)^D$ on an expanding hop window with fixed $C,D>0$. Choose integer radii $r_N\to\infty$ in that window. The diameter bound gives $r_N=N^{o(1)}$. With $b_N=\max\{2,\lceil C(1+r_N)^D\rceil\}$ and $m_N=\lfloor\ln(N/2)/\ln b_N\rfloor$, the one-scale cover argument of Theorem C.5m gives at least $N^2/2$ ordered pairs with distance greater than $m_N r_N$. Here $\ln b_N=o(\ln N)$ and $r_N/\ln b_N\to\infty$, so $m_Nr_N/\ln N\to\infty$. The lower bound $J(G_N)\ge (N^2/2)F(m_Nr_N)$ then contradicts the heap upper bound and the stated tolerance because $F(d)\sim d\ln d/\eta$. The argument uses the normalized hop window and therefore applies to (C.1) at any microscopic rescaling on the unit-edge branch. Exact minima exist at each size by the finite connected degree-capped census. The budget implication follows since a lower cost budget retaining any regular family also retains these attained irregular minima. $\square$

<a id="theorem-c5p19"></a>

<a id="theorem-c5p19-adaptive-erasure-retry-ledger-under-arbitrary-cross-hop-dependence"></a>**Theorem C.5p.19 (Adaptive Erasure-Retry Ledger under Arbitrary Cross-Hop Dependence).** Fix $0<p,s<1$. Use the finite route sources of Theorems C.5j and C.5p.18, with fixed positive integer caps $k_j$ and product Bernoulli erasures of probability $p$ within each hop. Allow arbitrary dependence between the entire mask words of different hops, independent of the input. On reaching a hop, activate successive copies only until the first success or the cap. A reliable acknowledged-attempt package is paid for each activation, including its feedback, work and records. If a hop exhausts its cap, the downstream hops remain inactive. All idle reservations are kept in a common stock and clock, and only actual activations enter the varying part of the charged ledger. The package price and the common stock convention are held fixed over the graph comparison. Let $C(d)$ be the minimum, over caps on a $d$-hop route that guarantee survival at least $s$, of the worst expected number of activated packages. Then $C(d)$ is attained, and a finite exact calculation is given below. It satisfies
$$
s\le C(d+1)-C(d)\le p+\frac1{1-p}\qquad(d\ge1).
\tag{C.5p.30}
$$
Consequently on the independent ordered-pair source the graph-dependent ledger is ordered by $\sum_{u\ne v}C(d_G(u,v))$. At each fixed degree cap $\Delta\ge3$, exact minima and all near minima with excess $\mathcal E_N$ satisfying $1+\mathcal E_N/N=N^{o(1)}$ have subpolynomial diameter and fail every expanding uniform polynomial upper-volume window below their diameter. This includes diverging lower cutoffs. The statement treats the specified adaptive stop and retry class, with cap choice before input and mask realization.

*Exact fixed-cap adversarial cost.* Let $a_j=p^{k_j}$. Define a hop's failure flag as the event that its first $k_j$ copies are erased. The event that the route fails is the union of those flags, whether or not all hops were reached. By the coupling construction of Theorem C.5p.18, the robust reliability condition is exactly
$$
\sum_{j=1}^d a_j\le 1-s.
\tag{C.5p.31}
$$
Let $T_j$ be the number of attempts that hop $j$ would use if reached. Its failure atom has mass $a_j$ and $T_j=k_j$. Its successful atoms have mass $(1-p)p^{i-1}$ at $T_j=i$ for $1\le i\le k_j$. Denote the successful atom measure by $\nu_j$, of total mass $1-a_j$. For $v\in[0,1-a_j]$ put
$$
L_j(v)=\min_{\substack{0\le\nu\le\nu_j\\\nu(\mathbb R)=v}}\int u\,d\nu(u).
$$
The minimum fills the least successful retry counts first, with a partial last atom if needed. In particular $L_j$ is an explicit convex piecewise linear function.

Write $b_j$ for the probability that some hop through $j$ fails, with $b_0=0$. If $b=b_{j-1}$ and $t$ is the probability that the current failure flag overlaps the previous failure union, then
$$
\max(0,b+a_j-1)\le t\le\min(b,a_j),\qquad
b_j=b+a_j-t .
$$
Among the probability mass $b$ that cannot reach this hop, $t$ comes from the current failure atom and the rest from its successful atoms. The least lost cost is $k_jt+L_j(b-t)$. Thus the maximum expected activated packages for the given caps equals
$$
\max_{(b_j,t_j)}
\sum_{j=1}^d\left[
\frac{1-p^{k_j}}{1-p}
-k_jt_j-L_j(b_{j-1}-t_j)\right],
\tag{C.5p.32}
$$
subject to the displayed linear overlap constraints at each step. The first term is $\mathbb E T_j$ by the truncated geometric sum. To attain every optimizer, successively partition the probability space into the previous failure union and its complement. Allocate the current failure atom with mass $t$ inside the former and $a_j-t$ outside. Allocate the successful atoms inside that union by the minimizing mass assignment for $L_j(b-t)$, and their remaining mass outside. This may split earlier atoms without changing any earlier law or expected cost. Assign complete within-hop mask words by the product conditional law given the first success or total failure. The resulting law has the required full product marginal on every hop. At each stage finitely many atoms suffice. Hence the upper bound in (C.5p.32) is attained. It is a finite linear optimization after representing each $L_j$ by its finitely many supporting affine functions, or one may optimize over the finitely many pieces directly. The coupling maximizing the invoice need not minimize survival.

*Finite optimal cap search.* Increasing any single cap can only increase the worst expected cost. Indeed an arbitrary smaller-cap coupling extends by independently appending product-mask coordinates, and in that extension the enlarged protocol never uses fewer attempts or reaches fewer later hops. Conversely the longer run truncated at the old cap is a valid old coupling, so comparing costs can be done on the same complete masks. Any feasible cap vector lies above a coordinatewise minimal feasible vector, by integer coordinate decrements. There are finitely many such vectors, and they can be found by a finite recursion. For the residual reliability budget $r>0$ with $m$ caps left, if $m=1$ take the least positive cap with $p^k\le r$. For $m>1$, at least one of the remaining caps is at most the least positive $k$ with $p^k\le r/m$. Otherwise all cap entries could be reduced by one while preserving feasibility, contrary to coordinatewise minimality. Choose such a coordinate and enumerate its possible values up to that threshold. Retain only positive residual budgets and recurse. A coordinatewise minimal original vector is minimal on every residual problem after its earlier choices are fixed, so no minimal vector is missed. Discard nonminimal candidates after enumeration if desired. Feasible caps exist by taking all caps sufficiently large. Applying (C.5p.32) to the finite list and minimizing therefore attains $C(d)$.

*Route growth and graph ordering.* Given any feasible $(d+1)$-hop caps, its first $d$ caps are feasible by (C.5p.31). Take a worst invoice coupling of that prefix and extend it by an independent product mask for the last hop. Prefix survival is at least $s$, and every reached hop costs at least one package. Thus its full worst invoice is at least $C(d)+s$. For the converse take optimal $d$-hop caps and increase only the last old cap $k$ by one. This frees $(1-p)p^k>0$ of the union-bound budget. Choose the new appended cap sufficiently large that its failure mass fits in the freed budget. For every new coupling the prefix truncated at the old cap costs at most $C(d)$. The extra attempt at the old last hop costs at most $p^k\le p$ in expectation, since the first $k$ copies must all fail. The new hop costs in expectation at most the mean of its own truncated geometric variable, bounded by $(1-p)^{-1}$ regardless of its correlations with arrival. This proves (C.5p.30). Also $sd\le C(d)\le d/(1-p)$, since every reached probability is at least $s$ for feasible caps and the product marginal bounds each expected charge from above. Strict growth makes a geodesic optimal for each independent demand.

To realize the ledger, use the classical controlled-swap mask and record modules of Theorem C.5p.18. Following each activated copy a reliable reverse control reports success or retry, with a separate paid record and fixed positive price included in the package. The next forward copy is enabled only by the reached and retry flags. The fixed outer schedule reserves enough time for all caps, with disabled slots holding their actual stock. The finite search supplies a finite common upper bound on caps for all optimal routes of a given finite graph size. Pad the stocks and comparison clock before choosing the graph as in Theorem C.5p. Each correlated mask fixture is a finite joint ready distribution independent of the input. Charges are for activated packages, even when the copy erases. The endpoint attenuation uses the supplied survival of that fixture to make the projected output channel exactly the erasure channel of survival $s$. All ACK, erased copy, idle-reserve and attenuation records stay on their paid supports. Thus on the stated operating-price branch the graph-dependent robust invoice is a common positive multiple of the displayed sum. Different coupling laws may be distinguished by a fuller response that reads the retained flags.

For the diameter conclusion, apply the degree-preserving radial replacement of Theorem C.5p.2 to the ordinary distance pairs. The heap-tree comparator has diameter at most $2\lceil\log_2N\rceil$ and route prices at most $(1-p)^{-1}$ times distance. Hence some vertex has mean distance $k=O_{p,s}(\log N)+O_s(\mathcal E_N/N^2)$ by $C(d)\ge sd$. In the averaged replacement estimate the positive increments of the price are bounded by $p+(1-p)^{-1}$ times the positive increments of ordinary distance. Each distance decrease is worth at least $s$ times that decrease. With $M(R)$ the number of vertices outside radius $R$ from the selected centre and $L=2\lceil\log_2N\rceil+2\Delta$, this gives
$$
M(8r)\le\frac{K(L+2)}r M(r/2)+\frac{K\mathcal E_N}{Nr}
$$
for all integer $r\ge\max\{8(L+2),4k\}$, with a constant $K$ depending only on the fixed source parameters. The derivation is the same comparison of the positive average increment with the decrease from every pair across radii $r/2$ and $8r$. Choose $r_0=\lceil\max\{64K(L+2),4k\}\rceil$, $r_j=16^jr_0$ and iterate as in (C.5p.29). The resulting tail is at most $N\,64^{-(j+1)}16^{-j(j+1)/2}+2K\mathcal E_N/(Nr_j)$. Taking $j\ge\lceil\sqrt{\log_4N}\rceil$ minimal with $r_j\ge4K\mathcal E_N/N$ makes this less than one, giving diameter at most $16r_j=N^{o(1)}$. If a uniform polynomial upper ball bound holds at some diverging radius in an expanding window, the one-scale cover argument of Theorem C.5m gives a positive fraction of pairs at distances $\omega(\log N)$, since the radius divided by the logarithm of its polynomial ball bound diverges and the radius is subpolynomial. Their prices exceed $s$ times those distances. This contradicts the heap upper bound and the stated excess. Thus a robust budget retaining a uniform polynomial-growth family also admits an irregular minimum on the same adaptive source. $\square$

<a id="theorem-c6-conditional-coarse-grained-doubling-and-12-poincaré-bounds"></a>**Theorem C.6 (Conditional coarse-grained doubling and $(1,2)$-Poincaré bounds).**

Let $(\mathcal N,d_{\mathcal N},\mu)$ be a locally finite predictive network with counting measure, maximum degree $\Delta_{\max}<\infty$, and coarse-graining resolution $\delta>0$. Assume every ball $U=B(x,4r)$ used below, with $r\geq10\delta$, is finite. Assume the certificate parameters satisfy $D\geq1$, $0\leq\varepsilon_C<1$, $0<\Delta_{\min}\leq\Delta_{\max}<\infty$, $0<\eta^\downarrow\leq\eta^\uparrow<\infty$, $0<\chi<\infty$ and $0<\rho^\downarrow(r)\leq\rho^\uparrow(r)<\infty$ at every admitted radius. These domains make the displayed constants finite with $D_\star\geq1$ and $H(r)>0$. If $U$ has one vertex, the asserted Poincaré inequality holds with both sides zero. For a finite induced subgraph $U$ with at least two vertices, define
$$
h(U):=\min_{\substack{\varnothing\neq A\subset U\\
\mu(A)\leq\mu(U)/2}}
\frac{|\partial_UA|}{\mu(A)},
\qquad
|\nabla f|^2(v):=\frac12\sum_{u\sim v,\,u\in U}|f(u)-f(v)|^2.
$$
Assume that the registered packing/isoperimetric certificate gives, for every $x$ and $r\geq10\delta$ with $|B(x,4r)|\geq2$,
$$
\mu(B(x,2s))\leq D_\star\mu(B(x,s))
\quad(s=r,2r),
$$
where
$$
D_\star:=2^D(1+4\varepsilon_C)
\frac{\Delta_{\max}}{\Delta_{\min}}
\frac{\eta^\uparrow}{\eta^\downarrow},
$$
and, for $U=B(x,4r)$,
$$
h(U)\geq\frac{H(r)}r,
\qquad
H(r):=3\chi\frac{1-\varepsilon_C}{1+\varepsilon_C}
\frac{\rho^\downarrow(r)}{\rho^\uparrow(r)}>0.
$$
Then
$$
\mu(B(x,2r))\leq D_\star\mu(B(x,r)),
$$
and every function $f:U\to\mathbb R$ satisfies
$$
\fint_{B(x,r)}|f-f_{B(x,r)}|\,d\mu
\leq C_{PI}(r)r
\left(\fint_{B(x,4r)}|\nabla f|^2\,d\mu\right)^{1/2},
$$
with dilation $\lambda=4$ and
$$
C_{PI}(r):=
\frac{2D_\star\sqrt{2\Delta_{\max}}}{3\chi}
\frac{1+\varepsilon_C}{1-\varepsilon_C}
\frac{\rho^\uparrow(r)}{\rho^\downarrow(r)}.
$$

*Proof.* The doubling conclusion is the first certificate inequality with $s=r$. Put $B=B(x,r)$ and $U=B(x,4r)$. For any constant $a$,
$$
\fint_B|f-f_B|\,d\mu
\leq2\fint_B|f-a|\,d\mu,
$$
because $|f_B-a|\leq\fint_B|f-a|\,d\mu$. Taking $a=f_U$ and applying Cauchy-Schwarz gives
$$
\fint_B|f-f_B|\,d\mu
\leq2\left(\fint_B|f-f_U|^2\,d\mu\right)^{1/2}
\leq2\left(\frac{\mu(U)}{\mu(B)}
\fint_U|f-f_U|^2\,d\mu\right)^{1/2}.
$$
Applying the doubling certificate at $s=r$ and $s=2r$ yields $\mu(U)/\mu(B)\leq D_\star^2$. For the unnormalized Laplacian on the finite induced graph $U$, the needed counting-measure Cheeger estimate is
$$
\lambda_1(U)\geq\frac{h(U)^2}{2\Delta_{\max}}.
$$
Here is a direct proof of the convention and constant. For a nonconstant real function $g$ on $U$, choose a median $m$ and set $p=(g-m)_+$ and $n=(m-g)_+$. Each support has at most $\mu(U)/2$ vertices. For either $a=p$ or $a=n$, layer-cake summation of $a^2$ and the definition of $h(U)$ give
$$
\sum_{\{u,v\}\in E(U)}|a(u)^2-a(v)^2|\geq h(U)\sum_{v\in U}a(v)^2.
$$
Cauchy–Schwarz and the maximum-degree bound give
$$
\left(\sum_{E(U)}|a(u)^2-a(v)^2|\right)^2
\leq\left(\sum_{E(U)}(a(u)-a(v))^2\right)
\left(\sum_{E(U)}(a(u)+a(v))^2\right)
\leq 2\Delta_{\max}\left(\sum_{E(U)}(a(u)-a(v))^2\right)
\left(\sum_U a(v)^2\right).
$$
Thus the edge energy of each nonzero part is at least $h(U)^2/(2\Delta_{\max})$ times its squared norm. The edge energy of $g$ is at least the sum of the energies of $p$ and $n$, while $\sum_U(g-m)^2\geq\min_b\sum_U(g-b)^2$. Taking the Rayleigh infimum proves the displayed estimate. This counting-measure proof uses the same coarea mechanism as the degree-weighted normalized-Laplacian inequality in Chung (1997), but does not identify the two conventions.
The Rayleigh-quotient definition of $\lambda_1(U)$ and the declared gradient normalization give
$$
\fint_U|f-f_U|^2\,d\mu
\leq\frac1{\lambda_1(U)}
\fint_U|\nabla f|^2\,d\mu
\leq\frac{2\Delta_{\max}r^2}{H(r)^2}
\fint_U|\nabla f|^2\,d\mu.
$$
Combining the last three displays gives the asserted inequality with
$C_{PI}=2D_\star\sqrt{2\Delta_{\max}}/H(r)$, which is the displayed formula. ∎

<a id="theorem-c6a-obstruction-to-deriving-the-section-114-non-collapsed-synthetic-ricci-regime-from-the-present-theorem-stack"></a>**Theorem C.6a (Obstruction to deriving the Section 11.4 non-collapsed synthetic-Ricci regime from the present theorem stack).**
Consider the rescaled spaces of Theorem 44,
$$
X_n := (\mathcal{V}_n,\delta_{eff,n}^{-1}d_{\mathcal N_n},o_n),
\qquad \delta_{eff,n}\to 0.
$$
Assume only the hypotheses and conclusions already established in Definitions C.1–C.3, Theorem C.6, Theorem 43, Lemma D.6a, and Theorem D.6. Then these results do not suffice to derive the Euclidean-tangent conclusion of Theorem 44. More precisely:

1. **Weighted-shell/local-isotropy closure.** The hypotheses listed in this theorem do not prove asymptotically equal first-shell weights, the empirical tensor condition of Remark C.3.3a, or an equivalent replacement sufficient to justify the scalar-curvature averaging step.
2. **Scale-invariant non-collapse.** Definition C.1 does not furnish fixed-radius lower-density bounds on the rescaled spaces, and Theorem C.6 does not by itself upgrade to family-uniform fixed-radius doubling/Poincaré control for the rescaled sequence.
3. **Limit-energy identification.** The listed Appendix D results provide pointed measured Gromov–Hausdorff precompactness of bounded-action families and action-level consistency; identification of the limit Cheeger energy as a quadratic form requires additional data.
4. **Curvature-class transfer.** The discrete curvature control of Definition C.2, together with the other listed hypotheses, supplies no uniform synthetic-curvature condition stable under the convergence used in Theorem 44.

Consequently, under the current PU hypotheses one can justify at most the compactness part of the continuum bridge once the separate bounded-geometry hypotheses of Lemma D.6a are imposed, while the first-shell averaging step, the quadraticity of the limit energy, and the existence of a full-measure regular set with unique Euclidean $\mathbb{R}^D$ tangent cones remain additional assumptions.

*Proof.* Remark C.3.3a already states the scalar-curvature estimator only under extra first-shell hypotheses. The listed hypotheses contain no derivation of asymptotically equal shell weights or the weighted local-isotropy tensor from the discrete PU dynamics. Hence even the first-shell averaging step is conditional.

For a fixed rescaled radius $\rho>0$, the corresponding original-space radius is
$$
R=\rho\,\delta_{eff,n}.
$$
Definition C.1 applies only for $R>R_0$, equivalently
$$
\rho>R_0/\delta_{eff,n}.
$$
Because $\delta_{eff,n}\to 0$, any fixed $\rho$ eventually lies below this threshold. Hence Definition C.1 does not supply fixed-radius lower-density or two-sided volume-growth control on the rescaled sequence.

Theorem C.6 is a coarse-grained single-network statement: it assumes $r\ge 10\delta$ and yields constants $D_\star$ and $C_{\mathrm{PI}}(r)$ depending on the coarse-graining/distortion data. The listed hypotheses provide no family-uniform choice of these data on every bounded radius range. Therefore Theorem C.6 does not by itself furnish the family-uniform fixed-radius doubling/Poincaré package required for a non-collapsed limit theory.

Lemma D.6a gives pointed measured Gromov–Hausdorff precompactness for bounded-action families once its separate bounded-geometry hypotheses are imposed. Theorem D.6 gives Gamma-convergence and convergence of almost minimizers under its liminf, recovery, equicoercivity, and lower-bound hypotheses. Identification of its limit with an Einstein–Hilbert plus MPU action requires separate liminf and recovery proofs. These results do not prove Mosco convergence of the rescaled Dirichlet forms, quadraticity of the limit Cheeger energy, or Euclidean tangent cones.

Finally, Definition C.2 provides a discrete curvature bound, but the listed hypotheses provide no transfer to a measured-Gromov–Hausdorff-stable synthetic curvature class such as the one invoked in Theorem 44. These four missing ingredients are exactly the additional inputs isolated in Section 11.4. Therefore the Euclidean-tangent conclusion of Theorem 44 is not derivable from Theorem 43 together with the current Appendix D bridge alone. ∎

<a id="remark-c6b-sufficient-additional-ingredients-for-closure"></a>**Remark C.6b (Sufficient additional ingredients for closure).** Any theorem closing the bridge to Theorem 44 must supply at least one result in each of the following categories:

| Category | Required statement |
|:---|:---|
| First-shell averaging | Asymptotically equal shell weights and the empirical isotropy tensor of Remark C.3.3a, or an equivalent replacement strong enough to justify the scalar-curvature averaging step |
| Scale-free non-collapse | $\mu_n(B_r(x)) \geq c\,r^D$ for all bounded $x$ and fixed $0 < r \leq 1$ after rescaling |
| Limit-energy identification | Mosco convergence of the rescaled random-walk Dirichlet forms, or another route identifying the limit Cheeger energy as quadratic |
| Curvature-class transfer | A discrete $CD(K,D)$ or $RCD(K,D)$ condition, or an equivalent radius-2 curvature-transfer theorem, uniform in $n$ and stable under measured Gromov–Hausdorff convergence |

Theorem 43.5 packages all four on the $M=24$, $D=4$ operational-continuum branch on which Theorem 44 is stated.

<a id="theorem-c6c-conditional-noncollapsed-mathrmrcdk4-bridge"></a>**Theorem C.6c (Conditional Noncollapsed $\mathrm{RCD}^*(K,4)$ Bridge).** Let $(X_n,d_n,\mu_n,x_n)$ converge in pointed measured-Gromov--Hausdorff topology to $(X,d,\mu,x)$. Assume:

1. Every $X_n$ and $X$ is a complete separable length metric-measure space with full-support locally finite measure, quadratic Cheeger energy, and the Sobolev-to-Lipschitz and integrability properties used in the Bakry-Émery characterization.
2. The global generator-domain inequalities $\mathrm{BE}(K_n,4)$ hold on $X_n$, where $K_n\to K$.
3. Under declared varying-space identifications, the Cheeger energies Mosco-converge and the heat-flow/carré-du-champ test quantities in the integrated $\mathrm{BE}(K_n,4)$ inequality converge strongly enough to pass that inequality to the limit.

Then $(X,d,\mu)$ is $\mathrm{RCD}^*(K,4)$. If, after a declared normalization, $\mu=\mathcal H^4$, the limit is noncollapsed.

*Proof.* Fix an admissible nonnegative test function and an admissible generator-domain function on $X$. Assumption 3 provides approximating tests and functions on $X_n$ for which every term in the integrated $\mathrm{BE}(K_n,4)$ inequality converges to the corresponding term on $X$. Passing to the limit and using $K_n\to K$ yields $\mathrm{BE}(K,4)$ on $X$. Assumption 1 supplies quadraticity, Sobolev-to-Lipschitz, completeness, full support, and the required integrability. The finite-dimensional Bakry-Émery characterization, with the length, full-support, quadratic-energy, Sobolev-to-Lipschitz and integrability hypotheses retained above, therefore implies that $X$ is $\mathrm{RCD}^*(K,4)$ (Erbar et al. 2013, Theorem 7 and Assumption 4.2). By definition, an $\mathrm{RCD}^*(K,4)$ space whose reference measure is the normalized four-dimensional Hausdorff measure is noncollapsed. ∎

A radius-2 polynomial-core estimate, local Ahlfors estimates, or vanishing finite defects does not supply Assumption 3; a separate stability certificate remains necessary.

<a id="theorem-c6c1-bravais-propagation-cost-networks-have-polyhedral-normed-limits"></a>**Theorem C.6c.1 (Bravais Propagation-Cost Networks Have Polyhedral Normed Limits).** Let $\Lambda\subset\mathbb R^D$, $D\ge2$, be a lattice, let $S\subset\Lambda\setminus\{0\}$ be a finite set with $S=-S$ that generates $\Lambda$ as a group, and let $c:S\to(0,\infty)$ satisfy $c_{-s}=c_s$. For $\delta>0$ let $\mathcal N_\delta$ be the Bravais network with vertex set $\delta\Lambda$, edges $\{x,x+\delta s\}$ for $x\in\delta\Lambda$ and $s\in S$, and edge costs $w_{x,x+\delta s}=c_s$, and let $d_\delta$ be its propagation-cost metric (64) with microscopic length $\delta$. Define
$$
\|u\|_{S,c}:=\min\Bigl\{\sum_{s\in S}c_st_s:\ t_s\ge0,\ \sum_{s\in S}t_ss=u\Bigr\}
\qquad(u\in\mathbb R^D).
\tag{C.6c.1.1}
$$
Then:

1. $\|\cdot\|_{S,c}$ is a norm whose closed unit ball is the polytope $P_{S,c}:=\operatorname{conv}\{s/c_s:s\in S\}$, and there is a constant $C_{S,c}<\infty$ such that
$$
\|x-y\|_{S,c}\le d_\delta(x,y)\le\|x-y\|_{S,c}+C_{S,c}\delta
\qquad(x,y\in\delta\Lambda);
\tag{C.6c.1.2}
$$
every path from $x$ of cost at most $\|x-y\|_{S,c}+C_{S,c}\delta$, in particular every geodesic from $x$ to $y$, stays in the $\|\cdot\|_{S,c}$-ball of that radius about $x$, so a truncation containing $\delta\Lambda\cap B_{3r+C_{S,c}\delta}(o)$ has the same distances on $\delta\Lambda\cap B_r(o)$, balls taken in $\|\cdot\|_{S,c}$;
2. for every choice of base vertices, $(\delta\Lambda,d_\delta)$ converges as $\delta\to0$ in the pointed Gromov–Hausdorff sense to the normed space $(\mathbb R^D,\|\cdot\|_{S,c})$, and every tangent cone of this limit, at every point, is $(\mathbb R^D,\|\cdot\|_{S,c})$;
3. no closed ball of positive radius in $(\mathbb R^D,\|\cdot\|_{S,c})$ is isometric to a Euclidean ball, so $g_{S,c}:=d_{GH}\bigl(B_1^{\|\cdot\|_{S,c}},B_1^{\mathbb R^D}\bigr)>0$ and, for every fixed $r>0$ and all base vertices $x_\delta$,
$$
\liminf_{\delta\to0}\frac1r\,d_{GH}\bigl(B_r^{d_\delta}(x_\delta),B_r^{\mathbb R^D}\bigr)\ge g_{S,c};
$$
4. $(\mathbb R^D,\|\cdot\|_{S,c},\mathcal L^D)$ is not infinitesimally Hilbertian, so its Cheeger energy is not quadratic and it is not $\mathrm{RCD}(K,N)$ for any $K\in\mathbb R$ and $N\in[1,\infty]$;
5. for $\Lambda=D_4$, $S=\Xi_{D_4}$ and constant cost $c\equiv w$, the unit ball $P_{S,c}$ is $w^{-1}$ times the $24$-cell $\{u:\|u\|_\infty\le1,\ \|u\|_1\le2\}$,
$$
\|u\|_{S,c}=w\max\Bigl(\|u\|_\infty,\frac12\|u\|_1\Bigr),
$$
and $C_{S,c}=0$, so $d_\delta$ is the restriction of this norm to $\delta D_4$, which for $w=1$ is (43.5e.2) of Proposition 43.5e; on the Euclidean unit sphere $w^{-1}\|u\|_{S,c}$ takes every value in $[2^{-1/2},1]$, the extreme values being attained at $(e_1+e_2)/\sqrt2$ and $e_1$.

Consequently, along every sequence $\mathcal N_{\delta_n}$ with fixed $(\Lambda,S,c)$ and $\delta_n\to0$, including the candidate $\delta_nD_4$ of Corollary 43.5a with uniform root-edge costs and the metric (64), the propagation-cost limit has non-Euclidean tangent cones at every point and non-quadratic Cheeger energy. The conclusion of Theorem 44 and conclusions 2–4 of Theorem 43.5 therefore fail along every such sequence, so no such sequence satisfies their hypotheses; assumption 1 of Theorem C.6c fails at the limit; and at every fixed chart radius the Gromov–Hausdorff term of the rigidity defect (D.6e.4) has lower limit at least $g_{S,c}$, so that defect has lower limit at least $g_{S,c}^2$.

*Proof.* Item 1. Since $S=-S$ spans $\mathbb R^D$, every $u$ is a nonnegative combination of elements of $S$, so the linear program in (C.6c.1.1) is feasible; its value is nonnegative and is attained at a basic optimal solution with at most $D$ nonzero coordinates. The value is positively homogeneous, subadditive because sums of feasible representations are feasible, symmetric because $S=-S$ and $c_{-s}=c_s$, and positive for $u\ne0$ because $|u|\le\sum_st_s|s|\le\max_s(|s|/c_s)\sum_sc_st_s$. A point has norm at most one exactly when it equals $\sum_st_ss$ with $\sum_sc_st_s\le1$, that is, when it lies in the convex hull of $\{s/c_s\}\cup\{0\}$, which is $P_{S,c}$ because $0=\frac12(s/c_s)+\frac12(-s/c_{-s})$. A path from $x$ to $y$ that traverses $n_s$ edges in direction $s$ satisfies $\sum_sn_s\delta s=y-x$, so its cost $\delta\sum_sc_sn_s$ is at least $\|y-x\|_{S,c}$; this is the lower bound, and it persists under truncation, which can only increase distances. For the upper bound let $t$ be a basic optimal solution for $u=(y-x)/\delta\in\Lambda$ and write $t_s=\lfloor t_s\rfloor+\theta_s$. The remainder $u-\sum_s\lfloor t_s\rfloor s=\sum_s\theta_ss$ lies in $\Lambda$ and in the bounded set of combinations of at most $D$ elements of $S$ with coefficients in $[0,1)$, hence in a finite set $Z_S$; let $C_{S,c}$ be the largest weighted word length of an element of $Z_S$, finite because $S$ generates $\Lambda$. Traversing $\lfloor t_s\rfloor$ edges in each direction $s$ and then a geodesic for the remainder costs at most $\|y-x\|_{S,c}+C_{S,c}\delta$. Geodesics exist because the network is locally finite with edge costs at least $\delta\min_sc_s$. The lower bound applied to initial segments shows that every vertex of a path from $x$ of cost at most $\|y-x\|_{S,c}+C_{S,c}\delta$, in particular of every geodesic from $x$ to $y$, lies within that $\|\cdot\|_{S,c}$-distance of $x$; for $x,y\in B_r(o)$ these paths stay in $B_{3r+C_{S,c}\delta}(o)$, so a truncation containing this ball contains a geodesic of the full network and has the same distance between $x$ and $y$.

Item 2. Let $\rho$ be the covering radius of $\Lambda$ for $\|\cdot\|_{S,c}$. By (C.6c.1.2) the inclusion $\delta\Lambda\subset\mathbb R^D$ has additive distortion at most $C_{S,c}\delta$ and $\rho\delta$-dense image. Matching each lattice point with itself, and each point of $B_R^{\|\cdot\|_{S,c}}(x)$ with a nearest lattice point of its radial contraction by $(\rho+C_{S,c})\delta$ toward $x$, which lies in $B_R^{d_\delta}(x)$, gives correspondences between corresponding balls of radius $R$ with distortion $O(\delta)$. This is pointed Gromov–Hausdorff convergence (Burago, Burago and Ivanov 2001, §§7.3–8.1). Translations are isometries of the limit and dilations $u\mapsto\lambda u$ multiply distances by $\lambda$, so every rescaling about every point is isometric to $(\mathbb R^D,\|\cdot\|_{S,c})$, which is therefore the tangent cone everywhere.

Item 3. Because $D\ge2$, a facet $F$ of $P_{S,c}$ contains two distinct points $u\ne v$, and $\frac12(u+v)\in F$ has norm one. In the ball $B_r^{\|\cdot\|_{S,c}}(0)$ the points $0$ and $\frac r2(u+v)$ are at distance $r$ and have the two distinct midpoints $\frac r2u$ and $\frac r2v$, whereas strict convexity of the Euclidean norm makes every midpoint in a Euclidean ball unique. Isometries preserve midpoints, so no ball of the normed space is isometric to a Euclidean ball; since compact metric spaces at Gromov–Hausdorff distance zero are isometric, $g_{S,c}>0$. Dilations give $d_{GH}(B_r^{\|\cdot\|_{S,c}},B_r^{\mathbb R^D})=rg_{S,c}$, and the triangle inequality for $d_{GH}$ together with item 2 gives the displayed lower bound.

Item 4. The space is doubling and supports a Poincaré inequality, being bi-Lipschitz equivalent to Euclidean space, so for $C^1$ functions the minimal weak upper gradient equals the pointwise Lipschitz constant $\|df\|_{S,c,*}$ almost everywhere (Cheeger 1999), where $\|\cdot\|_{S,c,*}$ is the dual norm. In an infinitesimally Hilbertian space the squared minimal weak upper gradient satisfies the parallelogram identity almost everywhere (Ambrosio, Gigli and Savaré 2014). Applied to $C^1$ functions that equal two linear forms $\ell_1,\ell_2$ on a ball, it would give $\|\ell_1+\ell_2\|_{S,c,*}^2+\|\ell_1-\ell_2\|_{S,c,*}^2=2\|\ell_1\|_{S,c,*}^2+2\|\ell_2\|_{S,c,*}^2$, so the dual norm and hence $\|\cdot\|_{S,c}$ would be induced by scalar products; an ellipsoid has no segment in its boundary, whereas the facets of $P_{S,c}$ do. The definition of $\mathrm{RCD}(K,N)$ includes infinitesimal Hilbertianity.

Item 5. Each root satisfies $\|s\|_\infty=1$ and $\|s\|_1=2$, so $\operatorname{conv}\Xi_{D_4}\subseteq Q:=\{\|u\|_\infty\le1,\ \|u\|_1\le2\}$. Conversely, let $u$ be an extreme point of $Q$; after a signed permutation, which preserves $Q$ and $\Xi_{D_4}$, $u\ge0$. If $\|u\|_1<2$, then $u$ is extreme in the cube $[-1,1]^4$, hence lies in $\{\pm1\}^4$, where $\|u\|_1=4$; so $\sum_iu_i=2$. The hypersimplex $\{x\in[0,1]^4:\sum_ix_i=2\}$ lies in $Q$ and contains $u$, so $u$ is one of its extreme points $e_i+e_j$. Hence $Q=\operatorname{conv}\Xi_{D_4}$, which gives the gauge formula. For $C_{S,c}=0$ it suffices, by the lower bound, to show that every nonzero $a\in D_4$ has a root $s$ with $\|a-s\|_P=\|a\|_P-1$, where $\|\cdot\|_P:=\max(\|\cdot\|_\infty,\frac12\|\cdot\|_1)$ is integer-valued on $D_4$. After a signed permutation $a_1\ge a_2\ge a_3\ge a_4\ge0$; put $m=\|a\|_P$ and $s=e_1+e_2$. If $a_2\ge1$, the half $\ell^1$-norm drops by one and the new largest coordinate is $a_1-1\le m-1$ or $a_3$, with $a_3\le m-1$ unless $a_1=a_2=a_3=k$, in which case $m\ge\frac12(3k+a_4)\ge k+1$ because $(k,a_4)=(1,0)$ would give an odd coordinate sum. If $a_2=0$, then $a=(a_1,0,0,0)$ with $a_1\ge2$ even and $\|a-s\|_P=\max(a_1-1,\frac{a_1}2)=a_1-1$. In both cases $\|a-s\|_P\le m-1$, and the triangle inequality gives equality. Induction on $m$ shows that the word length of $a$ equals $\|a\|_P$, hence $C_{S,c}=0$. On the Euclidean unit sphere, $\|u\|_\infty\le1$ and $\|u\|_1\le2$ give $\|u\|_P\le1$; if $\|u\|_P<2^{-1/2}$, then $1=\sum_iu_i^2\le\|u\|_\infty\|u\|_1<2^{-1/2}\cdot2^{1/2}=1$, a contradiction. The two displayed vectors attain the bounds, and connectedness of the sphere gives every intermediate value.

The concluding paragraph follows from items 2–4: Theorem 44 asserts a quadratic limit Cheeger energy and Euclidean tangent cones; Theorem 43.5 asserts a noncollapsed $\mathrm{RCD}^*(K,4)$ limit, Mosco convergence to the quadratic Cheeger energy and Euclidean tangent cones; Theorem C.6c assumes quadratic Cheeger energy at the limit; and (D.6e.4) contains the Gromov–Hausdorff term of item 3. ∎

<a id="proposition-c6c2-exact-curvature-data-of-the-d_4-bravais-network-and-nonentailment-of-the-rcd-transfer"></a>**Proposition C.6c.2 (Exact Curvature Data of the $D_4$ Bravais Network and Nonentailment of the RCD Transfer).** On the network $\delta D_4$ of Theorem C.6c.1 item 5, with root edges of cost $w$, write $\Delta_sf(x):=f(x+\delta s)-f(x)$ for $s\in\Xi_{D_4}$, take the generator $Lf:=c\sum_{s\in\Xi_{D_4}}\Delta_sf$ with conductance $c>0$, and define $\Gamma$ and $\Gamma_2$ from $L$ as in Proposition C.3.3b. Then:

1. for every idleness $\alpha\in[0,1]$ and every step law $p$ on $\Xi_{D_4}$ with $p_{-s}=p_s$, the kernel $m_x:=\alpha\delta_x+(1-\alpha)\sum_sp_s\delta_{x+\delta s}$ has Ollivier–Ricci curvature $1-W_1^{d_\delta}(m_x,m_y)/d_\delta(x,y)=0$ on every edge $x\sim y$;
2. at every vertex $x$ and for every $f$,
$$
\Gamma_2(f)(x)=\frac{c^2}4\sum_{s,t\in\Xi_{D_4}}\bigl(\Delta_s\Delta_tf(x)\bigr)^2\ge\frac18\bigl(Lf(x)\bigr)^2,
\tag{C.6c.2.1}
$$
with equality for the function equal to $0$ at $x$, to $1$ at the $24$ neighbors and to $2$ at the other $144$ vertices of the radius-2 ball; hence $\mathrm{CD}(0,N)$ holds at every vertex exactly for $N\ge8$, and $\mathrm{CD}(K,N)$ fails for every $K>0$ and every $N$;
3. for the restriction to the radius-2 ball of $f(y)=y^{\mathsf T}Ay+b^{\mathsf T}y+e$, with $A$ symmetric,
$$
\Gamma_2(f)(x)-\frac14\bigl(Lf(x)\bigr)^2=36c^2\delta^4\bigl(4\operatorname{tr}(A^2)-(\operatorname{tr}A)^2\bigr)\ge0,
\tag{C.6c.2.2}
$$
with equality exactly when $A$ is a multiple of $I_4$; hence the radius-2 defect (D.6e.1) of this network with uniform conductances vanishes for every $K\le0$, and the dimension $4$ is sharp on this core;
4. the counting measures $\mu_\delta:=2\delta^4\sum_{x\in\delta D_4}\delta_x$ satisfy $\mu_\delta\bigl(B_r^{d_\delta}(x)\bigr)\to8(r/w)^4$ as $\delta\to0$, for every $r>0$.

The sequence $\delta_nD_4$, $\delta_n\to0$, therefore carries zero Ollivier–Ricci curvature for every lazy symmetric kernel, the sharp radius-2 bounds of items 2–3 with vanishing polynomial-core Bakry–Émery defect for $K\le0$, four-dimensional volume growth, and the shell moment closures of Lemmas C.6d and C.6f, while by Theorem C.6c.1 its propagation-cost limit is the $24$-cell normed space, with non-Euclidean tangent cones and non-quadratic Cheeger energy. These discrete curvature, volume and moment data do not entail an $\mathrm{RCD}(K,N)$ bound, Euclidean tangent cones or a quadratic Cheeger identification for the limit; an Ollivier-to-BE/RCD transfer therefore needs an input beyond these data, such as a metric–energy compatibility certificate.

*Proof.* Item 1. The translation $z\mapsto z+(y-x)$ is an automorphism of the weighted network and maps $m_x$ to $m_y$; the coupling it induces moves every unit of mass by $d_\delta(x,y)$, so $W_1^{d_\delta}(m_x,m_y)\le d_\delta(x,y)$. For the reverse bound let $y=x+\delta s_0$ with $s_0=\sigma e_i+\sigma'e_j$, and put $\varphi(z):=\frac w2(\sigma z_i+\sigma'z_j)$. Every root $s$ has $|\sigma s_i+\sigma's_j|\le2$, so $\varphi$ changes by at most the edge cost $\delta w$ along every edge and is $1$-Lipschitz for $d_\delta$, while $\varphi(y)-\varphi(x)=\delta w=d_\delta(x,y)$ by Theorem C.6c.1 item 5. The symmetric step law has $\sum_sp_ss=0$, so $\varphi$ has mean $\varphi(x)$ under $m_x$ and mean $\varphi(y)$ under $m_y$, and Kantorovich duality gives $W_1^{d_\delta}(m_x,m_y)\ge d_\delta(x,y)$.

Item 2. Translations commute, so $\Delta_tL=L\Delta_t$. With $\Gamma(f)=\frac c2\sum_s(\Delta_sf)^2$ and $\Delta_sf(x+\delta t)=\Delta_sf(x)+\Delta_t\Delta_sf(x)$,
$$
\frac12L\Gamma(f)=\frac{c^2}4\sum_{s,t}\Bigl(2\Delta_sf\,\Delta_t\Delta_sf+(\Delta_t\Delta_sf)^2\Bigr),
\qquad
\Gamma(f,Lf)=\frac{c^2}2\sum_{s,t}\Delta_tf\,\Delta_t\Delta_sf,
$$
so $\Gamma_2(f)$ equals the sum in (C.6c.2.1) plus $\frac{c^2}2\sum_{s,t}(\Delta_sf-\Delta_tf)\Delta_s\Delta_tf$, which vanishes because its summand is antisymmetric under $s\leftrightarrow t$. Write $u_s:=\Delta_sf(x)$. For $t=-s$ one has $\Delta_s\Delta_{-s}f(x)=-(u_s+u_{-s})$, and for $s\cdot t=-1$ the vector $s+t$ is a root and $\Delta_s\Delta_tf(x)=u_{s+t}-u_s-u_t$. Discarding the other terms gives $\Gamma_2(f)(x)\ge\mathcal Q(u)$ with
$$
\mathcal Q(u):=\frac{c^2}4\Bigl(\sum_s(u_s+u_{-s})^2+\sum_{s\cdot t=-1}(u_{s+t}-u_s-u_t)^2\Bigr).
$$
Signed permutations of coordinates act transitively on $\Xi_{D_4}$ and preserve inner products, so they permute the terms of the convex form $\mathcal Q$; averaging $u$ over them produces the constant vector $\bar u$ with entries $a=\frac1{24}\sum_su_s$, and $\mathcal Q(\bar u)\le\mathcal Q(u)$ while $\sum_s\bar u_s=\sum_su_s$. Each root $s$ has exactly $8$ roots $t$ with $s\cdot t=-1$; for $s=e_1+e_2$ these have one of $t_1,t_2$ equal to $-1$, the other zero, and one nonzero coordinate among $t_3,t_4$. Hence $\mathcal Q(\bar u)=\frac{c^2}4(24\cdot4a^2+192a^2)=72c^2a^2=\frac18(24ca)^2=\frac18(Lf(x))^2$, which proves the inequality. For the displayed function, $u\equiv1$, and every pair with $s\cdot t\ge0$ has $|s+t|^2\ge4$, so $x+\delta(s+t)$ lies in the outer shell of the radius-2 ball and $\Delta_s\Delta_tf(x)=2-1-1=0$; hence $\Gamma_2(f)(x)=\mathcal Q(1)=72c^2=\frac18(24c)^2$. For a linear $f$ all $\Delta_s\Delta_tf$ vanish and $Lf=0$ by antipodality, while $\Gamma(f)>0$ when $f$ is nonconstant, which excludes $K>0$.

Item 3. For the quadratic $f$, $\Delta_s\Delta_tf(x)=2\delta^2s^{\mathsf T}At$, so by (C.6c.2.1) and Lemma C.6d, with $\Sigma:=\sum_sss^{\mathsf T}=12I_4$,
$$
\Gamma_2(f)(x)=c^2\delta^4\sum_{s,t}(s^{\mathsf T}At)^2=c^2\delta^4\operatorname{tr}(A\Sigma A\Sigma)=144c^2\delta^4\operatorname{tr}(A^2),
$$
while antipodality cancels the odd terms in $Lf(x)=c\sum_s\bigl(2\delta x^{\mathsf T}As+\delta^2s^{\mathsf T}As+\delta b^{\mathsf T}s\bigr)=12c\delta^2\operatorname{tr}A$. Subtraction gives (C.6c.2.2), and $(\operatorname{tr}A)^2\le4\operatorname{tr}(A^2)$ is Cauchy–Schwarz for the eigenvalues of $A$, with equality exactly for equal eigenvalues. For $K\le0$ the bracket in (D.6e.1) is then nonpositive on the core, and $f(y)=|y|^2$ attains equality, which makes $N=4$ sharp.

Item 4. By Theorem C.6c.1 item 5, $B_r^{d_\delta}(x)$ consists of the lattice points of $x+(r/w)Q$, where $Q$ is the $24$-cell of volume $8$: each of the $16$ orthants contributes $\{u\in[0,1]^4:\sum_iu_i\le2\}$, of volume $\frac12$ by the symmetry $u\mapsto\mathbf 1-u$ of the unit cube. The lattice $\delta D_4$ has covolume $2\delta^4$, so lattice-point counting in dilated convex bodies gives $\mu_\delta(B_r^{d_\delta}(x))\to\operatorname{vol}((r/w)Q)=8(r/w)^4$. The concluding paragraph combines items 1–4, Lemmas C.6d and C.6f, and Theorem C.6c.1 items 2–4. ∎

<a id="lemma-c6d-the-d_4-shell-moment-closure"></a>**Lemma C.6d (The $D_4$ Shell Moment Closure).** Let
$$
\Xi_{D_4}:=\{\pm e_i\pm e_j:1\le i<j\le4\}\subset\mathbb R^4,
$$
where $\{e_i\}_{i=1}^4$ is the standard orthonormal basis. Then
$$
|\Xi_{D_4}|=24,\qquad \sum_{\xi\in\Xi_{D_4}}\xi=0,
$$
and the second-moment tensor satisfies
$$
\frac1{24}\sum_{\xi\in\Xi_{D_4}}\xi^i\xi^j=\frac12\delta^{ij}.
$$
Consequently the $24$-mode $D_4$ shell has zero first moment and isotropic nondegenerate second moment.

*Proof.* There are $\binom42=6$ unordered pairs $(i,j)$ and $4$ sign choices for each pair, hence $|\Xi_{D_4}|=24$. For each pair $(i,j)$, the four vectors $\pm e_i\pm e_j$ sum to zero; summing over all pairs gives $\sum_\xi\xi=0$.

For the diagonal second moments, fix $i$. The coordinate $i$ appears in exactly three pairs $(i,j)$ with $j\ne i$, and for each such pair there are four sign choices with $(\xi^i)^2=1$. Thus
$$
\sum_{\xi\in\Xi_{D_4}}(\xi^i)^2=3\cdot4=12,
$$
so the diagonal average is $12/24=1/2$. For $i\ne j$, only the pair $(i,j)$ contributes to $\sum_\xi \xi^i\xi^j$, and the four sign choices give products $1,-1,-1,1$, whose sum is zero. Hence the off-diagonal averages vanish. ∎

<a id="theorem-c6e-local-pce-shell-isotropy-closure"></a>**Theorem C.6e (Local PCE Shell-Isotropy Closure).** Assume the feasible shell tensors are positive semidefinite, contain $(C_\Sigma/4)I_4$, and satisfy $\operatorname{tr}Q=C_\Sigma>0$. Define
$$
V_{\mathrm{shell}}(Q)=
\begin{cases}
-\log\det Q,&Q>0,\\
+\infty,&Q\text{ singular}.
\end{cases}
$$
Then the unique minimizer is $Q_*=(C_\Sigma/4)I_4$, and every minimizing sequence converges to $Q_*$. Thus rank collapse of this fixed-trace shell tensor is excluded.

*Proof.* Let $\lambda_1,\ldots,\lambda_4\geq0$ be the eigenvalues of a feasible $Q$. Since $\sum_i\lambda_i=C_\Sigma$, AM--GM gives
$$
\det Q=\prod_{i=1}^4\lambda_i
\leq\left(\frac{C_\Sigma}{4}\right)^4,
$$
with equality if and only if $\lambda_1=\cdots=\lambda_4=C_\Sigma/4$. A symmetric matrix all of whose eigenvalues equal $C_\Sigma/4$ is $(C_\Sigma/4)I_4$. This matrix is feasible by hypothesis, so it is the unique minimizer of $-\log\det Q$; singular matrices have infinite objective and cannot minimize.

Let $(Q_n)$ be a minimizing sequence. Then
$$
\det Q_n\longrightarrow(C_\Sigma/4)^4.
$$
The ambient set of positive-semidefinite $4\times4$ matrices with trace $C_\Sigma$ is compact. If $Q_n$ did not converge to $Q_*=(C_\Sigma/4)I_4$, a subsequence would remain a positive distance from $Q_*$ and would have a further subsequence converging to some $Q_\infty$ in the ambient set. Continuity of trace and determinant would give $\operatorname{tr}Q_\infty=C_\Sigma$ and $\det Q_\infty=(C_\Sigma/4)^4$. The equality case above forces $Q_\infty=Q_*$, contradicting the positive-distance condition. Therefore every minimizing sequence converges to $Q_*$. ∎

This local tensor result does not prove a global bi-Lipschitz atlas, fixed-radius geometric noncollapse, a global quasi-isometry, or interpolation and recovery maps; those are independent continuum-bridge hypotheses.

<a id="lemma-c6f-exact-fourth-moment-isotropy-and-sixth-moment-defects-of-the-equal-weight-d_4-shell"></a>**Lemma C.6f (Exact Fourth-Moment Isotropy and Sixth-Moment Defects of the Equal-Weight $D_4$ Shell).** Let $\Xi$ be the $M=24$ vectors of the $D_4$ root shell in $\mathbb R^4$, the signed permutations of $(1,1,0,0)$, each with $|\xi|^2=2$, taken with equal weight $1/M$. Then the fourth-moment tensor is exactly isotropic,
$$
\frac1M\sum_{\xi\in\Xi}\xi^i\xi^j\xi^k\xi^l
=c_4\bigl(\delta^{ij}\delta^{kl}+\delta^{ik}\delta^{jl}+\delta^{il}\delta^{jk}\bigr),
\qquad
c_4=\frac{|\xi|^4}{D(D+2)}=\frac16,
$$
and every odd moment vanishes. The sixth-moment tensor is not isotropic: with $c_6=|\xi|^6/\bigl(D(D+2)(D+4)\bigr)=1/24$, the two independent defects are
$$
\frac1M\sum_\xi(\xi^1)^6-15c_6=-\frac18=-\frac1{d_0},
\qquad
\frac1M\sum_\xi(\xi^1)^4(\xi^2)^2-3c_6=+\frac1{24}=+\frac1M,
$$
in exact ratio $-3:1$. Consequently, on the equal-weight $D_4$ orbit the scalar-curvature averaging step that uses fourth moments is exact, there is no anisotropic correction at fourth-moment order, and the first anisotropy enters only through sixth moments. This lemma supplies one input to the continuum chain; the noncollapse, compactness, Mosco, recovery, and generator-core hypotheses of Theorems D.6e, C.6c, and 44a are unaffected, and vanishing defects alone give neither conclusion.

*Proof.* The shell is invariant under the group $\Gamma$ of coordinate permutations and independent sign flips, and under $\xi\mapsto-\xi$; the latter annihilates every odd moment, and sign flips annihilate every even-order component in which some index appears an odd number of times. The surviving components of the fourth-moment tensor are determined by two numbers. Coordinate $1$ is nonzero on exactly the $12$ shell vectors pairing it with one of the other $3$ coordinates under $4$ sign choices, and there its value is $\pm1$, so
$$
\frac1M\sum_\xi(\xi^1)^4=\frac{12}{24}=\frac12,
\qquad
\frac1M\sum_\xi(\xi^1)^2(\xi^2)^2=\frac4{24}=\frac16,
$$
the second count being the $4$ sign choices on the single vector type supported on coordinates $\{1,2\}$. A $\Gamma$-invariant fully symmetric fourth-order tensor has the form $\alpha(\delta^{ij}\delta^{kl}+\delta^{ik}\delta^{jl}+\delta^{il}\delta^{jk})+\beta\,\Delta^{ijkl}$ with $\Delta$ the diagonal tensor $\Delta^{ijkl}=1$ iff $i=j=k=l$. Evaluating on $(1,1,2,2)$ gives $\alpha=1/6$, and on $(1,1,1,1)$ gives $3\alpha+\beta=1/2$, hence $\beta=0$, which is the displayed isotropy with $c_4=1/6=|\xi|^4/(D(D+2))=4/24$. For the sixth moments,
$$
\frac1M\sum_\xi(\xi^1)^6=\frac{12}{24}=\frac12,
\qquad
\frac1M\sum_\xi(\xi^1)^4(\xi^2)^2=\frac4{24}=\frac16,
$$
by the same counts, while the isotropic values at $|\xi|^2=2$ are $15c_6=5/8$ and $3c_6=1/8$ with $c_6=8/192=1/24$. Subtraction gives the displayed defects $-1/8=-1/d_0$ and $+1/24=+1/M$, whose ratio is $-3$; the second defect is nonzero, so the sixth-moment tensor is not proportional to the isotropic tensor. All arithmetic is exact rational arithmetic on the finite shell. The scope sentences restate which continuum-chain hypotheses this lemma does and does not touch. ∎

<a id="theorem-c6g-no-weighted-d_4-root-shell-has-an-isotropic-sixth-moment"></a>**Theorem C.6g (No Weighted $D_4$ Root Shell Has an Isotropic Sixth Moment).** Let $\Xi_{D_4}$ be the $24$ roots $\pm e_i\pm e_j$ and let arbitrary real weights $w_\xi$ satisfy only
$$
\sum_{\xi\in\Xi_{D_4}}w_\xi=1.
\tag{C.6g.1}
$$
Then the weighted sixth moment cannot equal the rotationally isotropic sixth moment of any measure supported on the sphere $|x|^2=2$. This remains impossible for nonnegative weights, antipodally symmetric weights, and every full-rank weighted second moment.

*Proof.* Every $D_4$ root has exactly two coordinates equal to $\pm1$ and the other two equal to zero. Hence pointwise on the shell
$$
\sum_{i=1}^4\xi_i^6=2,
$$
and therefore every normalized weighting satisfies
$$
\sum_\xi w_\xi\sum_{i=1}^4\xi_i^6=2.
\tag{C.6g.2}
$$
For a rotationally invariant measure on the radius-$\sqrt2$ sphere in $D=4$, the sixth-moment formula gives
$$
\mathbb E[x_i^6]
=\frac{15|x|^6}{D(D+2)(D+4)}
=\frac{15\cdot8}{4\cdot6\cdot8}
=\frac58.
$$
Summing over four coordinates gives $5/2$, contradicting (C.6g.2). The argument used neither positivity, antipodal symmetry, nor the rank of the second moment, so none of those restrictions removes the obstruction. ∎

Thus reweighting the fixed $24$-point root shell cannot cancel its sixth-order anisotropy. A higher-moment-isotropic branch must enlarge or change the support, and global atlas-transition data remain a separate obligation for any such replacement.

<a id="proposition-c6h-shell-point-symmetry-and-the-degree-six-invariant-floor"></a>**Proposition C.6h (Shell Point Symmetry and the Degree-Six Invariant Floor).** Let $\Gamma\subset O(4)$ be the group generated by coordinate permutations and coordinate sign changes, let $v:=\frac12(1,1,1,1)$, let $r_v(x):=x-2(x\cdot v)v$ denote the reflection in $v$, and let $\Gamma^{+}:=\langle\Gamma,r_v\rangle$. Then:

1. $\Gamma^{+}$ preserves the root shell $\Xi_{D_4}$ and the $D_4$ lattice $\{x\in\mathbb Z^4:x_1+x_2+x_3+x_4\in2\mathbb Z\}$.

2. Every $\Gamma^{+}$-invariant homogeneous polynomial of degree at most $5$ on $\mathbb R^4$ is a real multiple of a power of $|x|^2$: constants in degree $0$, multiples of $|x|^2$ in degree $2$, multiples of $|x|^4$ in degree $4$, and zero in the odd degrees.

3. The $\Gamma^{+}$-invariant homogeneous polynomials of degree $6$ form a two-dimensional space spanned by $|x|^6$ and
$$
T_6(x):=\sum_{\xi\in\Xi_{D_4}}(\xi\cdot x)^6=60\,|x|^2\sum_{i=1}^4x_i^4-48\sum_{i=1}^4x_i^6,
\tag{C.6h.1}
$$
and $T_6$ is not a multiple of $|x|^6$.

Consequently the minimal degree of a $\Gamma^{+}$-invariant polynomial that is not a polynomial in $|x|^2$ is exactly six. Moreover $\frac1MT_6$ is the full contraction of the equal-weight sixth-moment tensor of Lemma C.6f with $x^{\otimes6}$, so the two displayed anisotropic moment components of the degree-six stratum on the equal-weight shell are the Lemma C.6f defects $-1/d_0$ and $+1/M$. Modulo the radial sextic, the invariant anisotropy is one-dimensional; the two displayed moments are components of that single pattern. Theorem C.6g shows that this degree-six anisotropy cannot be cancelled by reweighting the shell; the present proposition excludes nonradial $\Gamma^{+}$-invariant homogeneous polynomials of degree below six.

*Proof.* Item 1. Coordinate permutations and sign changes preserve both sets. Since $|v|=1$, $r_v(x)=x-\left(x_1+x_2+x_3+x_4\right)v$, so each coordinate of $r_v(x)$ equals $x_i-\frac{S}{2}$ with $S:=x_1+x_2+x_3+x_4$. If $x$ lies in the $D_4$ lattice then $S$ is even, so $r_v(x)$ has integer coordinates, and its coordinate sum equals $S-4\cdot\frac{S}{2}=-S$, which is even; hence $r_v(x)$ lies in the lattice. An integer vector of squared norm $2$ has exactly two coordinates equal to $\pm1$ and the rest zero, so its coordinate sum is $0$ or $\pm2$ and it lies in the lattice; thus the vectors of squared norm $2$ in the lattice are exactly $\Xi_{D_4}$, and the isometry $r_v$ preserves this set.

Item 2. The map $x\mapsto-x$ is the product of the four sign changes and lies in $\Gamma$, so an invariant homogeneous polynomial of odd degree equals its own negative and vanishes. If some monomial of an invariant $f$ were odd in the variable $x_i$, averaging $f$ over the sign change in coordinate $i$ would remove that monomial while returning $f$; hence every monomial of $f$ carries even exponents, and by permutation invariance $f$ is a symmetric polynomial in the squared variables $u_i:=x_i^2$, homogeneous of degree $m$ in $u$ when $\deg f=2m$. For $m=1$ the symmetric linear forms are the multiples of $u_1+u_2+u_3+u_4=|x|^2$. For $m=2$ the symmetric homogeneous quadratics in four variables form a two-dimensional space: the monomial symmetric polynomials attached to the two partitions of $2$ are a basis, and the pair $\left(\sum_iu_i\right)^2=|x|^4$, $\sum_iu_i^2=\sum_ix_i^4$ expands triangularly against it, so this pair is also a basis. Write $f=a\,|x|^4+b\sum_ix_i^4$. Since $r_v(e_1)=\left(\frac12,-\frac12,-\frac12,-\frac12\right)$ has unit norm and $\sum_i\left(r_v(e_1)\right)_i^4=\frac4{16}=\frac14$, invariance evaluated at $e_1$ gives $a+b=a+\frac{b}{4}$, hence $b=0$.

Item 3. For $m=3$ the symmetric homogeneous cubics in four variables form a three-dimensional space: the monomial symmetric polynomials $m_{(3)}$, $m_{(2,1)}$, $m_{(1,1,1)}$ attached to the three partitions of $3$ are a basis, and the triple $\sum_iu_i^3=m_{(3)}$, $\left(\sum_iu_i\right)\left(\sum_iu_i^2\right)=m_{(3)}+m_{(2,1)}$, $\left(\sum_iu_i\right)^3=m_{(3)}+3m_{(2,1)}+6m_{(1,1,1)}$ expands triangularly against it, so $\left\{|x|^6,\ |x|^2\sum_ix_i^4,\ \sum_ix_i^6\right\}$ is a basis of the $\Gamma$-invariant homogeneous sextics. Write $f=a\,|x|^6+b\,|x|^2\sum_ix_i^4+c\sum_ix_i^6$. With $\sum_i\left(r_v(e_1)\right)_i^6=\frac4{64}=\frac1{16}$, invariance under $r_v$ evaluated at $e_1$ gives $a+b+c=a+\frac{b}{4}+\frac{c}{16}$, hence $12b+15c=0$, so the $\Gamma^{+}$-invariant subspace has dimension at most two. Both displayed polynomials are $\Gamma^{+}$-invariant: $|x|^6$ because $\Gamma^{+}\subset O(4)$, and $\sum_{\xi\in\Xi_{D_4}}(\xi\cdot x)^6$ because for $g\in\Gamma^{+}$, item 1 and orthogonality give
$$
\sum_{\xi\in\Xi_{D_4}}\left(\xi\cdot gx\right)^6=\sum_{\xi\in\Xi_{D_4}}\left(\left(g^{-1}\xi\right)\cdot x\right)^6=\sum_{\xi'\in\Xi_{D_4}}\left(\xi'\cdot x\right)^6.
$$
For the closed form in (C.6h.1): both sides are $\Gamma$-invariant homogeneous sextics and lie in the three-dimensional space above; at the points $e_1$, $(1,1,0,0)$, $(1,1,1,1)$ the basis takes the value triples $(1,1,1)$, $(8,4,2)$, $(64,16,4)$, whose determinant is $-48\ne0$, and the shell sum takes the values $12$, $144$, $768$: at $e_1$ exactly the twelve roots supported on coordinate $1$ contribute $(\pm1)^6=1$ each; at $(1,1,0,0)$ the two roots $\pm(1,1,0,0)$ contribute $(\pm2)^6=64$ each and the sixteen roots with exactly one support coordinate in $\{1,2\}$ contribute $1$ each; at $(1,1,1,1)$ each of the six coordinate pairs carries two roots with $\xi\cdot x=\pm2$, contributing $2\cdot64$ per pair. The unique solution of the resulting invertible linear system is $(a,b,c)=(0,60,-48)$, which satisfies $12b+15c=0$. Finally $T_6$ is not a multiple of $|x|^6$: at the unit vectors $e_1$ and $\frac1{\sqrt2}(1,1,0,0)$ the values of $T_6$ are $12$ and $\frac{144}{8}=18$, while $|x|^6=1$ at both. This proves item 3 and, with items 1 and 2, the minimal-degree statement. The contraction statement is multilinearity: $\frac1M\sum_\xi\left(\xi\cdot x\right)^6$ is the pairing of $\frac1M\sum_\xi\xi^{\otimes6}$ with $x^{\otimes6}$, and Lemma C.6f identifies the two displayed anisotropic moment components of that tensor as $-1/d_0$ and $+1/M$. ∎

<a id="proposition-c6i-a-registered-four-dimensional-shell-class-and-its-anisotropy-floors"></a>**Proposition C.6i (A Registered Four-Dimensional Shell Class and Its Anisotropy Floors).** For a finite set $S\subset\mathbb R^4\setminus\{0\}$ of equal-norm vectors spanning $\mathbb R^4$, closed under $x\mapsto-x$, with a designated symmetry group $\Gamma_S\subseteq O(4)$ preserving $S$, define the anisotropy floor $a(S)$ as the smallest positive integer $d$ such that either the equal-weight moment tensor $\frac1{|S|}\sum_{\xi\in S}\xi^{\otimes d}$ is not isotropic or some homogeneous $\Gamma_S$-invariant polynomial of degree $d$ is not a polynomial in $|x|^2$. Compare shells at one fixed norm and up to orthogonal equivalence, carrying their designated symmetry groups under that equivalence. Register the competitor class $\mathcal C_4$ consisting of: (a) any shell whose designated symmetry group preserves a nontrivial orthogonal splitting $\mathbb R^4=V_1\oplus V_2$, possibly together with a swap of the summands when $\dim V_1=\dim V_2=2$; (b) the $A_4$ root shell, the $20$ vectors $e_i-e_j$, $i\ne j$, in the sum-zero hyperplane $H\subset\mathbb R^5$; (c) the $A_4^{*}$ minimal shell, the $10$ vectors $\pm v_i$ with $v_i:=e_i-\frac15\sum_{j=1}^5e_j$ in $H$; (d) the $D_4$ root shell $\Xi_{D_4}$ with $\Gamma_S=\Gamma^{+}$ of Proposition C.6h. Then $a(S)\le4$ in cases (a), (b), (c), while $a(\Xi_{D_4})=6$.

*Proof.* First a normalization used twice. For an equal-norm shell in a $D$-dimensional carrier, if the fourth-moment tensor is isotropic it equals $c_4\left(\delta^{ij}\delta^{kl}+\delta^{ik}\delta^{jl}+\delta^{il}\delta^{jk}\right)$, whose double trace is $c_4D(D+2)$; the double trace of the moment tensor itself is $\frac1{|S|}\sum_\xi|\xi|^4$, so $c_4=|\xi|^4/\left(D(D+2)\right)$ and isotropy forces
$$
\frac1{|S|}\sum_{\xi\in S}(\xi\cdot u)^4=3c_4|u|^4
$$
for every $u$. A single $u$ violating this equality therefore certifies a nonzero anisotropic part.

Case (a). Without the swap, $|x_{V_1}|^2-|x_{V_2}|^2$ is a $\Gamma_S$-invariant of degree $2$ taking the values $1$ and $-1$ at unit vectors of $V_1$ and $V_2$; with the swap, its square is a $\Gamma_S$-invariant of degree $4$ taking the values $1$ at a unit vector of $V_1$ and $0$ at a unit vector with equal squared components in the two summands. A polynomial in $|x|^2$ is constant on the unit sphere, so neither invariant is one, giving $a(S)\le4$.

Case (b). Here $D=4$, $|\alpha|^2=2$, $\frac1{20}\sum_\alpha|\alpha|^4=4$, so $3c_4=\frac12$. At $u=e_1-e_2$, $|u|^2=2$: the two roots $\pm(e_1-e_2)$ contribute $2^4=16$ each, the twelve roots with exactly one index in $\{1,2\}$ contribute $1$ each, and the six roots supported in $\{3,4,5\}$ contribute $0$, so
$$
\frac1{20}\sum_\alpha(\alpha\cdot u)^4=\frac{44}{20}=\frac{11}5
\ne
2=\frac12|u|^4,
$$
and the fourth moment is not isotropic, giving $a(S)\le4$.

Case (c). Here $|v_i|^2=\frac45$, so $3c_4=\frac{|v|^4}8=\frac2{25}$. At $u=v_1$, using $v_i\cdot v_1=\delta_{i1}-\frac15$,
$$
\frac1{10}\sum_{\xi\in S}(\xi\cdot u)^4
=\frac15\left[\left(\frac45\right)^4+4\left(\frac15\right)^4\right]
=\frac{52}{625}
\ne
\frac{32}{625}=\frac2{25}|u|^4,
$$
and the fourth moment is not isotropic, giving $a(S)\le4$.

Case (d). The second moment is $\frac12I_4$: coordinate sign changes annihilate every off-diagonal entry, coordinate permutations equalize the diagonal, and the common diagonal value is $\frac{12}{24}=\frac12$. Odd moments vanish by antipodality. The fourth moment is exactly isotropic and the sixth is not, with defects $-1/d_0$ and $+1/M$, by Lemma C.6f. Every $\Gamma^{+}$-invariant homogeneous polynomial of degree at most $5$ is a polynomial in $|x|^2$, and an anisotropic invariant of degree $6$ exists, by Proposition C.6h. Hence no anisotropy of either kind occurs below degree six and both kinds occur at degree six, so $a(\Xi_{D_4})=6$. ∎

<a id="proposition-c6j-isotropy-economy-selection-of-the-d_4-shell-and-the-cardinality-m-24"></a>**Proposition C.6j (Isotropy-Economy Selection of the $D_4$ Shell and the Cardinality $M=24$).** Let $\mathcal J$ be any comparison functional on the class $\mathcal C_4$ of Proposition C.6i that is strictly decreasing in the anisotropy floor: $a(S)>a(S')$ implies $\mathcal J(S)<\mathcal J(S')$, a registered strict ordering of these competitors. A physical PCE functional realizes this comparison when its registered coefficient and defect map certifies the strict ordering of these shells. Then the unique orthogonal-equivalence class of $\mathcal J$-minimizers on $\mathcal C_4$ is the $D_4$ root shell, and its cardinality is $M=|\Xi_{D_4}|=24$. This records an isotropy-economy selection of the $M=24$ shell that is independent of, and convergent with, the Appendix Z interface-ledger derivation of $M=24$ and with the kissing-optimality and spherical-design records of the $24$-cell, whose Gegenbauer moments vanish for degrees one through five and first fail at degree six by Theorem U.30; that theorem records no uniqueness claim, which the present registered-class selection supplies. Theorems C.6l and C.6n extend the floor and equality classification to the full-symmetry crystallographic class.

*Proof.* By Proposition C.6i, $a(S)\le4$ for every member of cases (a), (b), (c) and $a(\Xi_{D_4})=6$, so the $D_4$ shell strictly maximizes the anisotropy floor on $\mathcal C_4$, and strict monotonicity of $\mathcal J$ in the floor makes it the unique minimizing class. The cardinality count is the $24$ signed pairs $\pm e_i\pm e_j$, $1\le i<j\le4$. ∎

<a id="theorem-c6k-reflection-designated-shell-census-and-crystallographic-selection-of-d_4"></a>**Theorem C.6k (Reflection-Designated Shell Census and Crystallographic Selection of $D_4$).** Let $\mathcal S_4$ be the class of all shells admitted in Proposition C.6i, namely finite sets $S\subset\mathbb R^4\setminus\{0\}$ of equal-norm vectors spanning $\mathbb R^4$ and closed under $x\mapsto-x$, compared up to orthogonal equivalence and scaling. Give each $S$ the canonical designated group $\Gamma_S:=\operatorname{Refl}(S)$ generated by all orthogonal reflections of $\mathbb R^4$ that preserve $S$, and let $\mathcal S_4^{\mathrm{cr}}\subset\mathcal S_4$ be the crystallographic subclass, whose members have discrete $\mathbb Z$-span. For a finite group $\Gamma\subset O(4)$ let $f(\Gamma)$ be the least positive degree of a $\Gamma$-invariant homogeneous polynomial that is not a polynomial in $|x|^2$. Then:

1. for every admissible shell $S$ and every finite designated group $\Gamma_S\subseteq O(4)$ preserving it, $a(S)=f(\Gamma_S)$;
2. $a(S)=1$ when $\operatorname{Refl}(S)$ fixes a nonzero vector, $a(S)=2$ when it fixes no nonzero vector but acts reducibly, and otherwise $\operatorname{Refl}(S)$ is a Coxeter group of type $A_4$, $B_4$, $D_4$, $F_4$ or $H_4$, with
$$
a(S)=3,\ 4,\ 4,\ 6,\ 12
\tag{C.6k.1}
$$
respectively;
3. on $\mathcal S_4$ the maximum of $a$ is $12$, attained exactly when $\operatorname{Refl}(S)$ has type $H_4$; among these shells the least cardinality is $120$, attained exactly by the vertex sets of regular $600$-cells. In particular $a(\Xi_{D_4})=6<12$, so $\Xi_{D_4}$ is not a minimizer on $\mathcal S_4$ of any comparison functional strictly decreasing in $a$;
4. on $\mathcal S_4^{\mathrm{cr}}$ the maximum of $a$ is $6$, attained exactly when $\operatorname{Refl}(S)$ has type $F_4$; among these shells the least cardinality is $24$, attained exactly by the shells orthogonally equivalent, after scaling, to $\Xi_{D_4}$. The $96$ vectors of squared norm $6$ in the $D_4$ lattice form a crystallographic shell with $a=6$, so ties occur at the maximal floor. Every comparison functional on $\mathcal S_4^{\mathrm{cr}}$ that is strictly decreasing in $a$ and, at equal $a$, strictly increasing in $|S|$ therefore has the unique minimizing class $\Xi_{D_4}$, with $M=24$.

*Proof.* Item 1. For $d\ge1$ put $m_d(x):=\frac1{|S|}\sum_{\xi\in S}(\xi\cdot x)^d$, the contraction of the $d$-th equal-weight moment tensor with $x^{\otimes d}$. Polarization recovers a symmetric tensor from its form and commutes with the action of $O(4)$, so the moment tensor is isotropic exactly when $m_d$ is $O(4)$-invariant, that is, a multiple of $|x|^d$ for even $d$ and zero for odd $d$, because an $O(4)$-invariant homogeneous polynomial is constant on spheres and $-I\in O(4)$ annihilates odd degrees. These are exactly the homogeneous polynomials of degree $d$ that are polynomials in $|x|^2$. Since $\Gamma_S$ is orthogonal and preserves $S$, $m_d$ is $\Gamma_S$-invariant, so a moment defect at degree $d$ produces a non-radial invariant of degree $d$ and $a(S)=f(\Gamma_S)$. This number is finite: for a unit vector $u$, the invariant $\prod_{g\in\Gamma_S}\bigl(|x|^2-(gu\cdot x)^2\bigr)$ vanishes on the unit sphere exactly at the finitely many points $\pm gu$, so it is not a polynomial in $|x|^2$.

Item 2. $\operatorname{Refl}(S)$ lies in the finite group of orthogonal maps preserving the finite spanning set $S$, so it is a finite reflection group. A nonzero fixed vector $u$ gives the linear invariant $u\cdot x$. Without fixed vectors but with an invariant orthogonal splitting $V_1\oplus V_2$, there is no linear invariant and the quadratic invariant $|x_{V_1}|^2$ is not a multiple of $|x|^2$. Otherwise the group is irreducible, hence by the classification of finite reflection groups of rank four of type $A_4$, $B_4$, $D_4$, $F_4$ or $H_4$. By Chevalley's theorem its invariant algebra is a polynomial algebra on algebraically independent homogeneous basic invariants, of degrees $(2,3,4,5)$, $(2,4,6,8)$, $(2,4,4,6)$, $(2,6,8,12)$ and $(2,12,20,30)$ respectively, and the group orders are $120$, $384$, $192$, $1152$ and $14400$ (Humphreys 1990, Chs. 2–3). For an irreducible group the degree-two basic invariant is a multiple of $|x|^2$, so every invariant of degree below the second degree $d_2$ is a polynomial in $|x|^2$, while the basic invariant of degree $d_2$ is not, by algebraic independence. Hence $f=d_2$, which is (C.6k.1).

Item 3. The root system of type $H_4$ can be taken to be the $120$ unit icosians, the vertices of the regular $600$-cell, which form one orbit of $W(H_4)$. For a finite reflection group the stabilizer of a point of the closed fundamental chamber is the standard parabolic subgroup generated by the simple reflections fixing it (Humphreys 1990, §1.12), so the least orbit size of a nonzero point is $|W|$ divided by the largest order of a proper standard parabolic subgroup. For $H_4$ the maximal proper standard parabolic subgroups have types $H_3$, $A_3$, $I_2(5)\times A_1$ and $A_2\times A_1$, of orders $120$, $24$, $20$ and $12$, so the least orbit size is $14400/120=120$, attained only on the orbit of the fixed line of the $H_3$ parabolic, which is the root orbit up to scaling. A shell with $\operatorname{Refl}(S)$ of type $H_4$ is a union of orbits of a conjugate of $W(H_4)$, so $|S|\ge120$, with equality exactly for a scaled image of the $600$-cell. Conversely, $\operatorname{Refl}$ of the $600$-cell contains $W(H_4)$, acts irreducibly and has order at least $14400$; by item 2 it equals $W(H_4)$. Item 2 then gives $a=12$ and the maximality.

Item 4. If the $\mathbb Z$-span $\Lambda$ of $S$ is discrete, it is a lattice preserved by $\operatorname{Refl}(S)$, so every element has an integral matrix in a basis of $\Lambda$ and an integral trace. A Coxeter group of type $H_4$ contains the product of two simple reflections whose mirrors meet at the angle $\pi/5$; it is a rotation by $2\pi/5$ in a plane fixing the orthogonal complement, with trace $2+2\cos(2\pi/5)=(3+\sqrt5)/2\notin\mathbb Z$. Type $H_4$ is therefore excluded, and item 2 gives $a\le6$, with equality exactly for type $F_4$. The maximal proper standard parabolic subgroups of $F_4$ have types $B_3$, $C_3$, $A_2\times A_1$ and $A_1\times A_2$, of orders $48$, $48$, $12$ and $12$, so the least orbit size is $1152/48=24$, attained exactly on the long-root orbit $\Xi_{D_4}$ and the short-root orbit $\{\pm e_i\}\cup\{\frac12(\pm1,\pm1,\pm1,\pm1)\}$, up to scaling. The orthogonal map $(u_1,u_2,u_3,u_4)\mapsto2^{-1/2}(u_1+u_2,u_1-u_2,u_3+u_4,u_3-u_4)$ sends $\sqrt2$ times the short-root orbit onto $\Xi_{D_4}$. The reflections in the $48$ roots of $F_4$ preserve $\Xi_{D_4}$, so $\operatorname{Refl}(\Xi_{D_4})$ contains $W(F_4)$; it is crystallographic and irreducible, so by item 2 and the exclusion of $H_4$ it equals $W(F_4)$, and $a(\Xi_{D_4})=6$. The $96$ vectors of squared norm $6$ in $D_4$ are the signed permutations of $(2,1,1,0)$, which form one $W(F_4)$-orbit; the same argument gives $a=6$ for this shell. The final statement follows by comparing first $a$ and then $|S|$. ∎

<a id="theorem-c6l-full-symmetry-crystallographic-floor-classification"></a>**Theorem C.6l (Full-Symmetry Crystallographic Floor Classification).** For a finite antipodal equal-norm spanning shell $S\subset\mathbb R^4\setminus\{0\}$ with discrete integer span, designate its full orthogonal symmetry group $G(S)$. Then its anisotropy floor from Proposition C.6i belongs to $\{2,4,6\}$. It equals two exactly when the real representation of $G(S)$ is reducible; on the irreducible branch it equals four exactly when the invariant quartic space has dimension greater than one, and otherwise equals six. A floor-six group is orthogonally conjugate to a subgroup of $W(F_4)$. All three floors occur.

*Proof.* The finite spanning shell makes $G(S)$ finite, its lattice span gives an integral representation, and antipodality gives $-I\in G(S)$. The moment–invariant identity of Theorem C.6k(1) applies to every finite designated group. An invariant orthogonal splitting gives a nonradial quadratic; conversely the eigenspaces of a nonradial invariant self-adjoint quadratic give such a splitting. Odd invariants vanish.

The classification of rational maximal finite irreducible groups in degree four has three classes, represented by $W(F_4)$, $D_{12} ≀ C_2$ and $C_2\times S_5$, with $D_{12}$ of order twelve [GAP 3, §38.12]. Every irreducible group here embeds rationally in one of these. In the orthogonal models the intertwiner $A$ has $A^{\mathsf T}A$ in the self-adjoint commutant of $G(S)$. Its eigenspaces are invariant, so real irreducibility forces $A^{\mathsf T}A=cI$; rescaling $A$ gives an orthogonal conjugacy.

The wreath group preserves an unordered orthogonal splitting into two planes, and therefore the nonradial quartic $|x_{V_1}|^4+|x_{V_2}|^4$. This splitting holds in every faithful irreducible four-dimensional orthogonal representation: its two central base involutions have product $-I$, their joint eigenspaces have signs $(+,-)$ and $(-,+)$, and the swapping involution exchanges them, forcing dimension two each. The standard $\pm S_5$ model on $\sum_i y_i=0\subset\mathbb R^5$ preserves the nonradial quartic $\sum_i y_i^4$. Its order $240$ divides neither $1152$ nor $288$, so it is the imported rational maximal class of that order. Similarly the rational reflection model of $F_4$ has order $1152$ and is the corresponding maximal class. Proposition C.6h supplies its nonradial invariant sextic. These three maximal models give the upper bound six; absence of nonradial quartics excludes the two other models. The radial quartic always spans one dimension, proving the criterion.

The $D_4$ root shell realizes six by Proposition C.6h. The coordinate cross-polytope realizes four. For floor two take the equal-radius orthogonal union of a regular hexagon and a square: the graph joining points with nonzero inner product has components of sizes six and two antipodal pairs of size two. Every symmetry preserves the six-point component and its plane, so the representation is reducible. Its integer span is a full lattice. ∎

The imported classification supplies coverage of rational groups; the invariant and orthogonal-conjugacy arguments supply the stated floor test. For a shell supplied in exact algebraic coordinates its full group can be enumerated by fixing an independent ordered quadruple in $S$, testing every image quadruple with the same Gram matrix and retaining precisely the resulting maps that preserve $S$. The quadratic and quartic tests are then exact invariant-nullspace computations in dimensions ten and thirty-five.

<a id="theorem-c6l1-full-symmetry-shell-census-on-the-whole-admissible-class"></a>**Theorem C.6l.1 (Full-Symmetry Shell Census on the Whole Admissible Class).** Let $\mathcal S_4$, $f$ and $a$ be as in Proposition C.6i and Theorem C.6k. Designate to each shell $S\in\mathcal S_4$ its full orthogonal symmetry group $G(S)=\{g\in O(4):gS=S\}$, a finite group, and write $a_{\mathrm{full}}(S):=f(G(S))$; by Theorem C.6k(1) this is the anisotropy floor for that designation. Identify $\mathbb R^4$ with the quaternions, let $\mathcal T$ be the group of the $24$ Hurwitz units $\pm1,\pm i,\pm j,\pm k,\tfrac12(\pm1\pm i\pm j\pm k)$, let $\mathcal O:=\mathcal T\cup\tfrac{1+i}{\sqrt2}\mathcal T$ be the binary octahedral group, and call a group of unit quaternions *binary icosahedral* when it is conjugate to the group of the $120$ unit icosians. For a finite group $\mathcal F$ of unit quaternions put $\mathcal F_L:=\{x\mapsto qx:q\in\mathcal F\}$ and $\mathcal F_R:=\{x\mapsto xq:q\in\mathcal F\}$. Let $\operatorname{Harm}_d$ be the space of harmonic homogeneous polynomials of degree $d$ on $\mathbb R^4$.

1. For every finite $\Gamma\subset O(4)$, $f(\Gamma)=\min\{d\ge1:\operatorname{Harm}_d^{\Gamma}\ne0\}$.
2. For every finite $\Gamma\subset O(4)$: $f(\Gamma)=12$ if $\Gamma$ contains $\mathcal I_L$ or $\mathcal I_R$ for some binary icosahedral group $\mathcal I$, and $f(\Gamma)\le8$ otherwise. Hence $f(\Gamma)\in\{1,\dots,8\}\cup\{12\}$.
3. On $\mathcal S_4$ the maximum of $a_{\mathrm{full}}$ is $12$. It is attained exactly when $G(S)$ contains $\mathcal I_L$ or $\mathcal I_R$; every such shell is a disjoint union of vertex sets of regular $600$-cells with common centre and radius, so $|S|\ge120$, with equality exactly for the vertex sets of regular $600$-cells. The floor-then-cardinality ordering therefore selects the $600$-cell, $M=120$, under the full-symmetry designation as under the reflection designation of Theorem C.6k(3).
4. The two designations differ on $\mathcal S_4$. The $48$-vector shell $S_{48}:=\Xi_{D_4}\cup\sqrt2\,\mathcal T=\sqrt2\,\mathcal O$ has $\operatorname{Refl}(S_{48})$ of type $F_4$, hence reflection floor $6$, while $a_{\mathrm{full}}(S_{48})=8$. Its $\mathbb Z$-span contains $2e_1$ and $\sqrt2e_1$, so $S_{48}\notin\mathcal S_4^{\mathrm{cr}}$.

*Proof.* Item 1. The Fischer decomposition $\operatorname{Pol}_d=\bigoplus_{0\le2m\le d}|x|^{2m}\operatorname{Harm}_{d-2m}$ is $O(4)$-equivariant, so the components of a $\Gamma$-invariant polynomial are $\Gamma$-invariant, and the polynomial is a polynomial in $|x|^2$ exactly when its components in $\operatorname{Harm}_e$, $e>0$, vanish. A non-radial invariant of degree $d$ therefore exists exactly when $\operatorname{Harm}_e^\Gamma\ne0$ for some $0<e\le d$ with $e\equiv d$ mod $2$.

Item 2. Every element of $SO(4)$ is $x\mapsto lx\bar r$ with unit quaternions $l,r$ determined up to a common sign, every other element of $O(4)$ is $x\mapsto a\bar x\bar b$, and $\operatorname{Harm}_d\otimes\mathbb C\cong V_d\otimes V_d$ as a representation of $S^3\times S^3$, where $V_d$ is the space of binary forms of degree $d$, the irreducible representation of $S^3=SU(2)$ of dimension $d+1$. For a finite $\Gamma$ let $\Gamma^{+}=\Gamma\cap SO(4)$, let $\hat\Gamma\subset S^3\times S^3$ be its full preimage, $L,R$ the two projections of $\hat\Gamma$, and $L_K=\{l:(l,1)\in\hat\Gamma\}$, $R_K=\{r:(1,r)\in\hat\Gamma\}$. Then $(L_K)_L,(R_K)_R\subseteq\Gamma$, $L$ and $R$ contain $-1$, and $L/L_K\cong R/R_K$. The finite subgroups of $S^3$ containing $-1$ are cyclic of even order $n$, binary dihedral of order $4n$, binary tetrahedral, binary octahedral and binary icosahedral, with fundamental invariants in the binary forms of degrees $(2,n,n)$, $(4,2n,2n+2)$, $(6,8,12)$, $(8,12,18)$ and $(12,20,30)$ (Klein 1884). Hence $(\star)$: $V_8^{H}\ne0$ for every such $H$ that is not binary icosahedral, $V_{12}^{H}\ne0$ for every such $H$, and $V_d^{H}=0$ for $0<d<12$ when $H$ is binary icosahedral.

(a) *Bound from the projections.* Let $d$ be even with $V_d^{L}\ne0\ne V_d^{R}$, and put $W:=V_d^{L}\otimes V_d^{R}\subseteq(V_d\otimes V_d)^{\hat\Gamma}$. If $\Gamma=\Gamma^{+}$ this gives $\operatorname{Harm}_d^\Gamma\ne0$. Otherwise choose $\sigma\in\Gamma\setminus\Gamma^{+}$, $\sigma(x)=a\bar x\bar b$. Conjugation by $\sigma$ sends $(l,r)$ to $(ar\bar a,\,bl\bar b)$, so $L=aR\bar a$ and $R=bL\bar b$, and $\sigma^2$ is $x\mapsto(ab)x\overline{(ba)}$, so $ab\in L$. The map $x\mapsto\bar x$ acts on $V_d\otimes V_d$ as $c\,\tau$ with $\tau(v\otimes w)=w\otimes v$ and $c=\pm1$, by Schur's lemma and because it is an involution; its trace on $\operatorname{Harm}_d$ is the coefficient of $t^d$ in $(1-t^2)/((1-t)(1+t)^3)=(1+t)^{-2}$, namely $(-1)^d(d+1)$, so $c=(-1)^d$. For even $d$, $\sigma$ therefore acts as $\Sigma=(\rho_d(a)\otimes\rho_d(b))\tau$. It preserves $W$, it is an involution on $W$ because $\sigma^2\in\Gamma^{+}$, and its trace on $W$ is $\operatorname{tr}(\rho_d(ab)|_{V_d^{L}})=\dim V_d^{L}=:n$, while $\dim W=n^2$. Its fixed space in $W$ has dimension $\tfrac12(n^2+n)>0$, so $\operatorname{Harm}_d^{\Gamma}\ne0$ and $f(\Gamma)\le d$. By $(\star)$, $f(\Gamma)\le12$ always and $f(\Gamma)\le8$ when neither $L$ nor $R$ is binary icosahedral.

(b) If $L_K$ or $R_K$ is a binary icosahedral group $\mathcal I$, then $\Gamma\supseteq\mathcal I_L$ or $\mathcal I_R$ and $\operatorname{Harm}_d^{\Gamma}\subseteq V_d^{\mathcal I}\otimes V_d=0$ for $0<d<12$; with (a), $f(\Gamma)=12$.

(c) Let $L$ be binary icosahedral with $L_K\ne L$. The normal subgroups of $L$ are $1$, $\{\pm1\}$ and $L$, so $R$ has a quotient isomorphic to $L$ or to $A_5$; the other finite subgroups of $S^3$ are solvable, so $R$ is binary icosahedral and $|R_K|=|L_K|\le2$. The commutator subgroup of $\hat\Gamma$ is a perfect central extension of $A_5$, hence of order at most $120$, and it maps onto $L$ and onto $R$; it is therefore the graph of an isomorphism $\varphi:L\to R$. The representation $\rho_1\circ\varphi$ of $L$ is one of its two faithful two-dimensional irreducible representations, $\rho_1$ or its Galois conjugate $\rho_1'$. If $\rho_1\circ\varphi\cong\rho_1$, then $\varphi(l)=cl\bar c$ for a unit quaternion $c$, every element of $\Gamma^{+}$ is $x\mapsto\pm lx\,c\bar l\bar c$, and $\Gamma^{+}$ preserves the line $\mathbb R\bar c$ and acts irreducibly on its orthogonal complement. $\Gamma$ normalizes $\Gamma^{+}$ and permutes its isotypic components, which have dimensions $1$ and $3$, so $\Gamma$ preserves the line and $(x\cdot\bar c)^2$ is a non-radial invariant: $f(\Gamma)\le2$. If $\rho_1\circ\varphi\cong\rho_1'$, the graph of $\varphi$ acts on $\mathbb R^4$ through the four-dimensional irreducible representation of $A_5$, so after an orthogonal change of coordinates its image $\Gamma_0$ is the rotation subgroup of $W(A_4)$. $\Gamma_0$ is the commutator subgroup of $\Gamma^{+}$, so $\Gamma$ normalizes it. The centralizer of $\Gamma_0$ in $O(4)$ is $\{\pm1\}$ and $\operatorname{Aut}(A_5)\cong S_5$, so the normalizer has order at most $240$ and equals $W(A_4)\times\{\pm1\}$. Its invariants include the basic invariant of $W(A_4)$ of degree $4$, which is algebraically independent of $|x|^2$; hence $f(\Gamma)\le4$.

Collecting: a finite subgroup of $S^3$ containing a binary icosahedral group equals it, so $\Gamma$ contains $\mathcal I_L$ or $\mathcal I_R$ for a binary icosahedral $\mathcal I$ exactly when $L_K$ or $R_K$ is binary icosahedral, and then $f=12$ by (b). In every other case $f\le8$: by (a) when neither $L$ nor $R$ is binary icosahedral, and by (c) and its mirror image when one of them is, since its kernel is then a proper subgroup. This is item 2.

Item 3. By item 2 and Theorem C.6k(1), $a_{\mathrm{full}}\le12$ with equality exactly when $G(S)\supseteq\mathcal I_L$ or $\mathcal I_R$. Then $S$ is a union of orbits $\mathcal Iv$ or $v\mathcal I$; each is the image of the $120$ unit icosians, the vertices of a regular $600$-cell, under a similarity of ratio $|v|$, and distinct orbits are disjoint. A regular $600$-cell is an orthogonal image of the scaled unit icosians, whose symmetry group contains their left multiplications; conjugation by a rotation carries these to $\mathcal I_L$ for a conjugate group $\mathcal I$, and conjugation by an orientation-reversing map carries them to $\mathcal I_R$.

Item 4. $\sqrt2\cdot\tfrac{1+i}{\sqrt2}\mathcal T=(1+i)\mathcal T=\Xi_{D_4}$, so $S_{48}=\sqrt2\,\mathcal O$ and $G(S_{48})\supseteq\mathcal O_L$. Then $\operatorname{Harm}_d^{G(S_{48})}\subseteq V_d^{\mathcal O}\otimes V_d=0$ for $0<d<8$, and $G(S_{48})$ contains no $\mathcal I_L$ or $\mathcal I_R$ because every orbit of such a group has $120$ points and $120$ does not divide $48$; item 2 gives $a_{\mathrm{full}}(S_{48})=8$. The $48$ vectors are the long roots of $F_4$ and $\sqrt2$ times its short roots. The reflections in them generate $W(F_4)$, which permutes long and short roots separately and so preserves $S_{48}$; a finite reflection group properly containing $W(F_4)$ would be irreducible of rank four and order above $1152$, hence of type $H_4$, whose order $14400$ is not a multiple of $1152$. So $\operatorname{Refl}(S_{48})=W(F_4)$ and (C.6k.1) gives the reflection floor $6$. Finally $(e_1+e_2)+(e_1-e_2)=2e_1$ and $\sqrt2\cdot1=\sqrt2e_1$ lie in the $\mathbb Z$-span, which therefore meets the line $\mathbb Re_1$ in a dense set. ∎

<a id="proposition-c6m-the-sharp-antipodal-cardinality-bound"></a>**Proposition C.6m (The Sharp Antipodal Cardinality Bound).** Every antipodal equal-norm shell in $\mathbb R^4$ with radial second and fourth moments has at least $24$ points. The $D_4$ shell attains the bound.

*Proof.* Normalize to unit radius and write one representative from each antipodal pair as $v_i$, $1\le i\le r$. Tracing the radial moments gives
$$
\sum_iv_iv_i^{\mathsf T}=\frac r4I,\qquad
\sum_i(v_i^{\mathsf T}Av_i)^2=\frac r{12}\operatorname{tr}(A^2)
\quad(A=A^{\mathsf T},\ \operatorname{tr}A=0).
$$
In the nine-dimensional Euclidean space $\operatorname{Sym}_0(4)$ put $H_i=v_iv_i^{\mathsf T}-I/4$ and let $H$ have these columns. Then $\sum_iH_i=0$, $\|H_i\|^2=3/4$, and $HH^{\mathsf T}=(r/12)I$. Therefore $P=(12/r)H^{\mathsf T}H$ is a rank-nine orthogonal projection with diagonal $9/r$ and $P\mathbf1=0$. Hence $r\ge10$.

If $r=10$, $P=I-J/10$, so $(v_i\cdot v_j)^2=1/6$ for $i\ne j$. The Gram matrix $G=(v_i\cdot v_j)$ has eigenvalues $5/2$ of multiplicity four and zero of multiplicity six. Thus the integer matrix $\sqrt6(G-I)$ has eigenvalues $3\sqrt6/2$ and $-\sqrt6$. An integer characteristic polynomial with root $-\sqrt6$ must also have root $+\sqrt6$, absent from this list, a contradiction. If $r=11$, $I-P-J/11=uu^{\mathsf T}$ is a rank-one orthogonal projection with $u\perp\mathbf1$ and $u_i^2=1/11$. Eleven signs $\pm1$ cannot sum to zero, another contradiction. Hence $r\ge12$. Lemmas C.6d and C.6f give the equality example. ∎

<a id="theorem-c6n-full-symmetry-d_4-orbit-decomposition-and-equality"></a>**Theorem C.6n (Full-Symmetry $D_4$ Orbit Decomposition and Equality).** Under Theorem C.6l's shell hypotheses, assume the $G(S)$-invariant quartic space is one-dimensional. Then one orthogonally conjugate binary tetrahedral group preserves $S$, and its orbits partition $S$ into $24$-point orthogonal copies of the $D_4$ root shell at the common radius. Thus $24$ divides $|S|$, and $|S|=24$ implies orthogonal equivalence to $D_4$ after normalization. Consequently maximizing the full-symmetry crystallographic floor and then minimizing cardinality selects uniquely $D_4$, with $M=24$.

*Proof.* Theorem C.6l places $G(S)$ orthogonally in $W(F_4)$, and $-I\in G(S)$. The finite lemma certified below states that every subgroup of $W(F_4)$ containing $-I$ with one-dimensional invariant quartics contains a conjugate of the left or right quaternionic group
$$
T=\{\pm1,\pm i,\pm j,\pm k\}\cup
\{(\pm1\pm i\pm j\pm k)/2\}.
$$
For any nonzero quaternion $v$, multiplication $q\mapsto qv/|v|$ is a real orthogonal map and the action $a\mapsto av$ is free. Therefore $Tv$ is a $24$-point orthogonal copy, scaled by $|v|$, of $T$; right multiplication gives the same conclusion. The orthogonal map
$$
U(x)=2^{-1/2}(x_1+x_2,x_1-x_2,x_3+x_4,x_3-x_4)
$$
sends $T$ onto $2^{-1/2}\Xi_{D_4}$. Its orbits partition $S$, proving divisibility and equality for every orbit parameter. Theorem C.6l and Proposition C.6m finish the ordering statement. ∎

**Finite certificate for Theorem C.6n.** Encode a matrix of $W(F_4)$ by twice its entries, and identify opposite matrices by choosing the first nonzero entry positive. The ambient projective group consists of the canonical representatives of all signed permutation matrices times two and all signed $4\times4$ Hadamard matrices. Sort their sixteen-entry row-major integer tuples lexicographically and index them from zero. There are $576$ indices. Encoded multiplication is integer matrix multiplication, exact division by two and sign normalization. Adjacent coordinate swaps, one coordinate sign change and $I-J/2$ generate the group; independently, reflections in $(0,1,-1,0)$, $(0,0,1,-1)$, $(0,0,0,1)$ and $(1,-1,-1,-1)$ generate all $1152$ signed matrices before projectivization. Every matrix preserves $\Xi_{D_4}$.

For a list of indices, obtain its subgroup by starting at the identity and repeatedly adjoining right products by its listed generators until no new element appears. The following lists generate the complete $128$ conjugacy-class representatives in this fixed indexing. An empty tuple denotes the trivial group.

| Class indices | Generating tuples |
|:--|:--|
| 0, 1, 2, 3 | $()$; $(0)$; $(1)$; $(2)$ |
| 4, 5, 6, 7 | $(3)$; $(10)$; $(11)$; $(13)$ |
| 8, 9, 10, 11 | $(18)$; $(19)$; $(20)$; $(145)$ |
| 12, 13, 14, 15 | $(147)$; $(162)$; $(163)$; $(183)$ |
| 16, 17, 18, 19 | $(0,1)$; $(0,2)$; $(0,3)$; $(0,7)$ |
| 20, 21, 22, 23 | $(0,9)$; $(0,18)$; $(0,19)$; $(0,20)$ |
| 24, 25, 26, 27 | $(0,29)$; $(0,41)$; $(0,144)$; $(0,145)$ |
| 28, 29, 30, 31 | $(0,146)$; $(0,147)$; $(0,148)$; $(0,153)$ |
| 32, 33, 34, 35 | $(0,158)$; $(0,163)$; $(0,167)$; $(0,179)$ |
| 36, 37, 38, 39 | $(1,3)$; $(1,6)$; $(1,12)$; $(1,18)$ |
| 40, 41, 42, 43 | $(1,19)$; $(1,26)$; $(1,40)$; $(1,145)$ |
| 44, 45, 46, 47 | $(1,147)$; $(1,193)$; $(1,195)$; $(1,211)$ |
| 48, 49, 50, 51 | $(1,218)$; $(1,232)$; $(2,3)$; $(2,8)$ |
| 52, 53, 54, 55 | $(2,35)$; $(2,146)$; $(2,154)$; $(2,187)$ |
| 56, 57, 58, 59 | $(3,4)$; $(3,10)$; $(3,11)$; $(3,13)$ |
| 60, 61, 62, 63 | $(3,20)$; $(3,147)$; $(3,148)$; $(3,166)$ |
| 64, 65, 66, 67 | $(3,183)$; $(10,11)$; $(10,13)$; $(10,18)$ |
| 68, 69, 70, 71 | $(10,19)$; $(10,20)$; $(10,154)$; $(10,155)$ |
| 72, 73, 74, 75 | $(11,13)$; $(11,18)$; $(11,19)$; $(11,155)$ |
| 76, 77, 78, 79 | $(13,20)$; $(13,35)$; $(13,144)$; $(13,154)$ |
| 80, 81, 82, 83 | $(13,160)$; $(13,162)$; $(18,19)$; $(18,20)$ |
| 84, 85, 86, 87 | $(18,21)$; $(18,64)$; $(18,162)$; $(18,164)$ |
| 88, 89, 90, 91 | $(19,20)$; $(19,29)$; $(19,70)$; $(19,72)$ |
| 92, 93, 94, 95 | $(19,147)$; $(19,158)$; $(19,163)$; $(19,211)$ |
| 96, 97, 98, 99 | $(20,72)$; $(20,158)$; $(20,163)$; $(20,189)$ |
| 100, 101, 102, 103 | $(162,163)$; $(0,1,18)$; $(0,3,144)$; $(0,7,19)$ |
| 104, 105, 106, 107 | $(0,9,144)$; $(0,20,29)$; $(1,6,19)$; $(1,19,26)$ |
| 108, 109, 110, 111 | $(1,19,193)$; $(1,19,218)$; $(1,26,193)$; $(1,26,211)$ |
| 112, 113, 114, 115 | $(1,40,193)$; $(3,4,9)$; $(3,13,160)$; $(10,11,18)$ |
| 116, 117, 118, 119 | $(10,13,19)$; $(11,13,35)$; $(11,19,29)$; $(13,20,26)$ |
| 120, 121, 122, 123 | $(18,19,20)$; $(18,19,64)$; $(19,20,26)$; $(19,20,72)$ |
| 124, 125, 126, 127 | $(19,20,163)$; $(19,70,211)$; $(1,19,26,193)$; $(19,20,26,65)$ |

Expand each listed subgroup by conjugation with all $576$ elements. Exact closure verifies that these conjugacy classes are pairwise disjoint and contain $1880$ subgroups. For every one of the $128$ representatives $H$ and every ambient element $x$, generate $\langle H,x\rangle$ and check its presence in the conjugacy-expanded collection. All $128\cdot576=73728$ adjunctions are present. This is a coverage proof: the collection contains the trivial subgroup, is conjugacy closed and is closed under adjoining an arbitrary element. Induction on a finite generating list therefore includes every subgroup.

For each actual representative matrix $g$, compute $p_j=\operatorname{tr}(g^j)$ without projectivizing the powers. Its quartic character is
$$
\chi_4(g)=\frac{p_1^4+6p_1^2p_2+3p_2^2+8p_1p_3+6p_4}{24}.
$$
It is unchanged by $g\mapsto-g$. Averaging over each projective subgroup gives its invariant quartic dimension. Exactly fourteen classes pass the dimension-one test; their counts by actual, unprojectivized order are
$$
(24,1),\ (48,2),\ (72,1),\ (96,3),\ (144,1),\
(192,1),\ (288,1),\ (576,3),\ (1152,1).
$$
Construct the left and right multiplication matrices of the displayed $24$ Hurwitz units. Each projective image has twelve elements. Every passing representative contains one of these whole images; all ambient conjugates of the left image are the left and right images. Since $-I\in G(S)$, projective containment lifts to containment of the entire $24$-element group. These finite integer checks establish the lemma used in the proof. Direct expansion on the thirty-five degree-four monomials gives the same characters, providing an independent invariant calculation.

The certificate uses the rational-group coverage theorem in C.6l. Its exact finite computation establishes the subgroup assertion inside that orthogonal representation. The group-level quartic condition is essential: radial moments of one shell give the cardinality bound C.6m, while equality in C.6n uses invariant quartics of the full symmetry group.

<a id="proposition-c6n1-crystallographic-moment-isotropy-does-not-imply-the-equality-hypothesis"></a>**Proposition C.6n.1 (Crystallographic Moment Isotropy Does Not Imply the Equality Hypothesis).** There is an antipodal crystallographic $24$-point shell of squared radius two with radial second and fourth moments that is not orthogonally equivalent to $D_4$. Its full-symmetry floor is two.

*Proof.* Let $\Xi=\Xi_{D_4}$ and define
$$
R=\frac12\begin{pmatrix}-1&-1&-1&-1\\1&-1&-1&1\\1&1&-1&-1\\1&-1&1&-1\end{pmatrix},\qquad
A=\frac{15I+8R}{13},\qquad
H=\{\pm R^j(1,1,0,0)^{\mathsf T}:j=0,1,2\}.
$$
Direct multiplication gives $R^2+R+I=0$, $R^{\mathsf T}R=I$ and $A^{\mathsf T}A=I$. The set $H$ is a regular hexagon contained in $\Xi$, and $S=(\Xi\setminus H)\cup AH$ consists of $24$ distinct antipodal vectors of squared norm two in $(1/13)\mathbb Z^4$. The map $A$ rotates the plane of $H$. A regular hexagon has rotationally invariant second and fourth moment forms on its plane: summing the Fourier terms of degrees at most four over six equally spaced angles annihilates every nonconstant term. Replacing $H$ by $AH$ therefore preserves those moments of $\Xi$, giving
$$
\sum_{s\in S}(s\cdot x)^2=12|x|^2,\qquad
\sum_{s\in S}(s\cdot x)^4=12|x|^4.
$$
The second moment proves spanning, and the rational coordinates prove discrete integer span. Exact cross inner products between the six moved and eighteen unmoved vectors are $\pm7/13,\pm8/13,\pm15/13$, whereas $D_4$ inner products lie in $\{0,\pm1,\pm2\}$. This proves inequivalence. Intrinsically join points whose inner product lies outside that latter set. Every moved point has degree eighteen and every unmoved point degree six, so each full orthogonal symmetry preserves the moved hexagon and its two-plane. The representation is reducible; Theorem C.6l gives floor two. ∎

<a id="corollary-c6n1a-labeled-gram-separation-of-the-moment-isotropic-shell"></a>**Corollary C.6n.1a (Labeled-Gram Separation of the Moment-Isotropic Shell).** Normalize $\Xi_{D_4}$ and the shell $S$ of Proposition C.6n.1 to unit radius, fix an order of the roots of $\Xi_{D_4}$, and give each moved vector $Ah$ the label of $h\in H$. Let $K^{D_4}$ and $K^{S}$ be the two labeled $24\times24$ Gram matrices. Both satisfy $K^2=6K$ and $\operatorname{tr}K=24$, so both have spectrum $6^{(4)},0^{(20)}$, and the two shells have equal moment tensors of degrees two and four, while

$$
\max_{i<j}\bigl|K^S_{ij}-K^{D_4}_{ij}\bigr|=\frac4{13},
\qquad
\frac1{276}\sum_{i<j}\bigl(K^S_{ij}-K^{D_4}_{ij}\bigr)^2=\frac6{299},
$$

with exactly $108$ of the $276$ off-diagonal entries changed. The largest off-diagonal entry of $K^S$ is $15/26>1/2$, so $S$ is not a kissing configuration. Consequently the spectrum and the moments of degree at most four of a $24$-label response kernel do not separate the regular $24$-cell Gram of Theorem Z.11 from $K^S$, whereas the labeled off-diagonal entries do: a comparison of a registered kernel with the $24$-cell Gram is a comparison of labeled entries.

*Proof.* The second and fourth moments are those of Proposition C.6n.1, and $K^2=6K$ is the second-moment identity $\sum_ss s^{\mathsf T}=6I_4$ at unit radius, which with $\operatorname{tr}K=24$ gives the spectrum. The remaining values are exact rational arithmetic with the matrices $R$ and $A$ of Proposition C.6n.1: the $6\cdot18=108$ entries between moved and unmoved vectors change, with values $\pm7/26$, $\pm8/26$, $\pm15/26$ in $K^S$, and the entries among the six moved vectors are unchanged because $A$ is orthogonal. ∎

<a id="proposition-c6o-cardinality-cost-obstruction-to-universal-floor-precedence"></a>**Proposition C.6o (Cardinality-Cost Obstruction to Universal Floor Precedence).** On the full-symmetry crystallographic shell class of Theorem C.6l, suppose a scalar ledger satisfies $\mathcal J(S)\ge c|S|-B$ for fixed $c>0$, $B<\infty$, and some floor-four shell $S_0$ has finite cost. Then the rule $a(S)>a(S')\Rightarrow\mathcal J(S)<\mathcal J(S')$ fails on this whole class.

*Proof.* In the rational orthogonal model $F=W(F_4)$, rational unit vectors are infinite, as witnessed by
$$
v(t)=\frac{(1-|t|^2,2t_1,2t_2,2t_3)}{1+|t|^2},\qquad t\in\mathbb Q^3.
$$
Choose successively vectors outside earlier finite $F$-orbits and let $S_J=\bigcup_{j\le J}Fv_j$. Each shell is finite, antipodal and spanning; clearing denominators makes its integer span discrete. Its full group contains $F$, so its floor is at least six, and Theorem C.6l makes the floor exactly six. The disjoint orbits give $|S_J|\to\infty$, hence $\mathcal J(S_J)\to\infty$. Eventually it exceeds $\mathcal J(S_0)$, contradicting universal floor precedence. ∎

The hypothesis permits strictly positive per-channel maintenance with a uniformly bounded compensating benefit. A finite architecture budget or an unbounded compensating benefit changes that hypothesis and requires its own source ledger. Theorems C.6l and C.6n settle the full-symmetry crystallographic census and its floor-then-cardinality ordering. The formal physical justification of crystallography, the cardinality tie-break, the source-complete coefficient/defect objective and the response-faithful shell map remain separate requirements; the Appendix Z saturation and dimensional-selection ledgers are treated separately.

<a id="theorem-c6p-sharp-cardinality-floor-cost-selection"></a>**Theorem C.6p (Sharp Cardinality--Floor Cost Selection).** Let $\mathcal S_{\mathrm{cr}}$ be the entire shell class of Theorem C.6l at one fixed positive radius, modulo orthogonal equivalence, with its full symmetry designation. Fix $c>0$ and three real numbers $h_2,h_4,h_6$ before comparison, and suppose the complete comparison functional is
$$
\mathcal J(S)=c|S|+h_{a(S)}.
\tag{C.6p.1}
$$
Then its minimum is attained and equals
$$
\min\{8c+h_2,\ 8c+h_4,\ 24c+h_6\}.
\tag{C.6p.2}
$$
Every minimizer has the least cardinality of one of the layers attaining this minimum. The floor-two and floor-four least cardinalities are eight; the floor-six least cardinality is twenty-four and its equality class is $D_4$. Consequently $D_4$ is the unique minimizing shell class exactly when
$$
h_2-h_6>16c,\qquad h_4-h_6>16c.
\tag{C.6p.3}
$$
Replacing both inequalities by weak inequalities characterizes membership of $D_4$ in the minimizer set. If equality holds in either comparison, a lower-floor eight-point shell ties with $D_4$, and a secondary least-cardinality rule selects an eight-point shell. Within each fixed floor, the positive coefficient $c$ already implements the cardinality tie-break.

*Proof.* An antipodal spanning shell contains at least four antipodal pairs, hence at least eight points. The coordinate cross-polytope $S_4=\{\pm e_i:1\le i\le4\}$ has full signed-permutation symmetry, one-dimensional invariant quadratics and the nonradial invariant quartic $\sum_i x_i^4$. Theorem C.6l gives $a(S_4)=4$.

For a floor-two equality witness put
$$
b_1=e_1,\quad b_2=e_2,\quad b_3=e_3,\quad
b_4=\tfrac35 e_1+\tfrac45 e_4,
\qquad S_2=\{\pm b_1,\pm b_2,\pm b_3,\pm b_4\}.
$$
The four $b_i$ form a basis and have unit norm. Their integer span is the image of $\mathbb Z^4$ under an invertible linear map, hence is discrete. Join two distinct shell vectors when their inner product is nonzero. Its connected components have sizes four, two and two: the four-point component is $\{\pm b_1,\pm b_4\}$. Every orthogonal symmetry preserves that component and therefore its two-dimensional span. The full symmetry representation is reducible, so Theorem C.6l gives $a(S_2)=2$. Scaling gives both witnesses at the specified radius.

Theorems C.6l and C.6n give precisely the three possible floors, cardinality divisible by twenty-four at floor six, and the unique normalized twenty-four-point equality class there. Since $c>0$, (C.6p.1) strictly increases with cardinality within each floor. The displayed witnesses and $D_4$ attain the three layer minima. Taking their minimum proves attainment and (C.6p.2), including every equality case. Subtracting $24c+h_6$ from the first two layer minima gives (C.6p.3). At a zero difference the eight-point witness has smaller cardinality than $D_4$, proving the secondary-rule statement. ∎

<a id="corollary-c6p1-pce-coefficient-cone-and-uniform-gap"></a>**Corollary C.6p.1 (PCE Coefficient Cone and Uniform Gap).** Suppose a registered, source-complete resource ledger of Definition D.1b descends to this same shell class and has the exact form
$$
r(S)=r_0+|S|u+b_{a(S)}.
\tag{C.6p.4}
$$
Here all four-vectors and the admissible certificate set are fixed by the source before comparison. For $w\in\mathrm{int}\,\mathbb R^4_{\ge0}$ with $c=w\cdot u>0$, $D_4$ uniquely minimizes $w\cdot r$ exactly when
$$
w\cdot(b_2-b_6-16u)>0,\qquad
w\cdot(b_4-b_6-16u)>0.
\tag{C.6p.5}
$$
On this branch every inequivalent shell has cost above $D_4$ by at least
$$
\min\{w\cdot(b_2-b_6-16u),\ w\cdot(b_4-b_6-16u),\ 24w\cdot u\}>0.
\tag{C.6p.6}
$$
The bound $24w\cdot u$ uses the full-symmetry orbit-divisibility conclusion of Theorem C.6n. No assertion of a forty-eight-point shell is needed. If $u$ is a nonzero element of the positive resource cone, every floor-six shell of larger cardinality is also strictly componentwise PCE-dominated by $D_4$.

*Proof.* The scalar term $w\cdot r_0$ is common to all candidates. Apply Theorem C.6p with $h_a=w\cdot b_a$. Each lower-floor shell has at least eight points, giving the first two gap bounds. A floor-six shell inequivalent to $D_4$ has cardinality at least forty-eight by Theorem C.6n, giving the third bound. For the last statement, its resource-vector difference from $D_4$ is $(|S|-24)u\in\mathbb R^4_{\ge0}\setminus\{0\}$, so Theorem D.1c applies. ∎

Theorem C.6p resolves the cardinality-cost obstruction by a weaker comparison: it proves the global minimizer from two exact layer inequalities, while Proposition C.6o continues to exclude universal strict-floor precedence for (C.6p.1). Indeed, $h_a$ has a finite minimum, so that functional satisfies C.6o's lower bound. The physical use of (C.6p.4) requires the independently populated branch contract of Definition D.1f: its admissible shell image, complete protocol-response law, resource vector and admissible coefficients. The floor alone supplies none of the acquisition, representation, processing, maintenance, update, adaptation or predictive-benefit entries required by Definition 15. A shell-dependent remainder must be retained in the comparison until a source proof removes or bounds it.

<a id="proposition-c6p2-a-cardinality-bound-does-not-supply-attainment"></a>**Proposition C.6p.2 (A Cardinality Bound Does Not Supply Attainment).** A finite bound on the number of shell points leaves infinitely many orthogonal-equivalence classes and does not by itself imply attainment for a continuous bounded-below shell cost. Here normalized finite shells carry the Hausdorff topology and their orthogonal-equivalence classes carry its quotient topology. The failure already occurs at the least possible bound $|S|\le8$.

*Proof.* For $0<t<1$ take
$$
S(t)=\{\pm e_1,\pm e_2,\pm e_3,
\pm(t e_1+\sqrt{1-t^2}e_4)\}.
$$
Each shell has eight unit vectors, spans $\mathbb R^4$, and generates a discrete lattice because its four representatives are a basis. Its nonzero absolute inner products between distinct antipodal pairs consist of the single value $t$, so distinct parameters give inequivalent shells. Every antipodal spanning shell of cardinality at most eight has exactly eight points. Its second-moment matrix
$$
Q(S)=\tfrac18\sum_{s\in S}ss^{\mathsf T}
$$
is positive definite. Thus, for fixed $c,\gamma>0$, the orthogonally invariant continuous cost $8c+\gamma\det Q(S)$ is strictly greater than $8c$ throughout this bounded-cardinality class. For the displayed family,
$$
\det Q(S(t))=\frac{1-t^2}{256}\longrightarrow0
\quad(t\uparrow1).
$$
Its infimum is $8c$ and is unattained. A finite decoded architecture census as in Theorem 23e, or a compact source quotient with a lower-semicontinuous cost as in Theorem D.1e, supplies distinct sufficient hypotheses. ∎

<a id="proposition-c6p3-a-source-cost-tail-cutoff"></a>**Proposition C.6p.3 (A Source-Cost Tail Cutoff).** Suppose a pre-specified complete scalar ledger on any subclass of Theorem C.6l satisfies $\mathcal J(S)\ge c|S|-B$ with $c>0$, finite $B$, and includes a $D_4$ representative with finite cost $J_D$. Every shell that ties or improves on $D_4$ then satisfies
$$
|S|\le\left\lfloor\frac{J_D+B}{c}\right\rfloor.
\tag{C.6p.7}
$$
At floor six the remaining cardinalities are positive multiples of twenty-four. The cutoff is an exact exclusion of the tail, independent of a new architecture-budget assumption; comparison and attainment inside its retained shape classes use their actual source data.

*Proof.* If $\mathcal J(S)\le J_D$, then $c|S|-B\le J_D$. Division by $c$ and integrality give (C.6p.7). Theorem C.6n supplies the floor-six restriction. ∎

<a id="theorem-c6q-finite-lattice-word-response-realization"></a>**Theorem C.6q (Finite Lattice-Word Response Realization).** Supply a shell $S$ of Theorem C.6l together with a basis matrix $A$ for its lattice $\Lambda=\mathbb ZS$ and the integer port vectors $z_s=A^{-1}s\in\mathbb Z^4$. Fix an integer horizon $T\ge1$, let $K=\max_s\|z_s\|_\infty$, and choose an integer $m>2TK$. On $X_m=(\mathbb Z/m\mathbb Z)^4$, put $U_s|x\rangle=|x+z_s\rangle$. Admit the following mathematical protocol grammar: an initial recorded position; at each step a port chosen by any registered classical policy conditional on the entire past record, or a fresh uniform port; application of its translation; recording of the port, position and a fixed tick of duration $\tau>0$; and stopping at or before $T$. This grammar has a total finite-dimensional instrument realization. It preserves the complete joint record, every finite adaptive policy in the grammar, every shell moment inferred from its tagged ports and every word-displacement relation of length at most $T$.

The lattice witness criterion itself is equivalent to crystallography: a finite spanning shell has discrete integer span exactly when it admits an invertible real $A$ and a finite integer coordinate list generating $\mathbb Z^4$ as above. Its admission to a nominated MPU source additionally requires that source's translation, preparation, record, clock, descriptor-calibration and tariff entries.

*Proof.* A discrete subgroup of $\mathbb R^4$ generated by a spanning finite set is a full lattice and has a $\mathbb Z$-basis. Conversely $A\mathbb Z^4$ is discrete for invertible $A$; generation of $\mathbb Z^4$ by the $z_s$ identifies this lattice with $\mathbb ZS$. This criterion treats every shell by the same translation premise.

Every $U_s$ is a permutation unitary. A fresh uniform choice and its retained outcome are realized by Kraus operators $N^{-1/2}U_s$, $N=|S|$, because
$$
\sum_{s\in S}(N^{-1/2}U_s)^*(N^{-1/2}U_s)=I.
$$
For a policy with conditional distribution $\pi_j(s\mid h_{j-1})$, use $\sqrt{\pi_j(s\mid h_{j-1})}U_s$ in the classical history block. Each block is normalized, so their direct sum is a normalized instrument on the complete history carrier. A basis-controlled copy records $s$ and $x$ in fresh finite registers. Store every old coin and history register until the protocol ends. This gives a finite composition of normalized instruments with no unrecorded outcome or postselection.

The initial encoding sends a classical law $p$ to $\sum_xp(x)|x\rangle\langle x|$. Reading the diagonal is its left inverse. For the process before imposing a stopping rule, induction on the history gives the unstopped prefix law
$$
\Pr(x_0,s_1,x_1,\ldots,s_t,x_t)
=p(x_0)\prod_{j=1}^t\left[\pi_j(s_j\mid h_{j-1})
\mathbf1_{\{x_j=x_{j-1}+z_{s_j}\ (\mathrm{mod}\ m)\}}\right],
\tag{C.6q.1}
$$
where a uniform choice means $\pi_j=1/N$. For a registered stopping rule, let $\sigma_j(h_j)\in[0,1]$ be its conditional probability of stopping after $j$ steps, with $\sigma_T=1$. A deterministic stopping rule has values zero and one. Append a retained absorbing halt flag, with values zero for running and one for halted. In the history basis its Kraus operators are
$$
K_{\mathrm{stop},h}=\sqrt{\sigma_j(h)}|h,1\rangle\langle h,0|,\quad
K_{\mathrm{continue},h}=\sqrt{1-\sigma_j(h)}|h,0\rangle\langle h,0|,\quad
K_{\mathrm{absorb},h}=|h,1\rangle\langle h,1|.
$$
Summing $K^*K$ over these outcomes and all histories gives the identity on the complete history--flag carrier. The map preserves the admitted diagonal history states, retains the stop/continue result and fixes every already halted history. If $q_t(h_t)$ denotes the right side of (C.6q.1), the complete terminal law is
$$
\Pr(H_{\mathrm{term}}=h_t,\,\mathrm{stop}=t)
=q_t(h_t)\left[\prod_{j=0}^{t-1}(1-\sigma_j(h_j))\right]\sigma_t(h_t),
\qquad0\le t\le T.
\tag{C.6q.2}
$$
The empty product at $t=0$ is one. Successive conditioning proves this formula, and summing stopped and continuing mass at each stage preserves total mass; $\sigma_T=1$ leaves no mass unstopped. Conditional port choices and stopping hazards may depend on every earlier retained record. Thus the construction handles every classical adaptive composition and stopping rule in the grammar. Any additional implementation records obtained by the controlled copies are deterministic functions of the terminal history and halt record, giving a total encoder and decoder of retained records.

A length-at-most-$T$ word has integer displacement of infinity norm at most $TK$. Two such displacements differ by a vector of infinity norm at most $2TK<m$. If they coincide modulo $m$, their difference is zero. Thus the finite quotient introduces no false displacement relation in this window. Multiplication by $A$ recovers the actual shell displacement. The tagged port observable $s\mapsto s^{\otimes d}$ under uniform choice has expectation $N^{-1}\sum_s s^{\otimes d}$ for every fixed $d$. These are exact finite response functions; a physical readout of them uses the separately supplied descriptor calibration.

Changing the lattice basis to $AB$ with $B\in GL_4(\mathbb Z)$ changes coordinates to $B^{-1}z_s$ and gives an isomorphism of the quotient translation system. Choosing a sufficiently large modulus for each representation preserves the same bounded-word response. Orthogonal changes of the Euclidean frame rotate the tagged displacements and tensors covariantly. For moduli $m\mid m'$, coordinate reduction intertwines the translation and record maps and preserves each port history. The complete adaptive process laws intertwine when the coarser initial law is the reduction pushforward of the finer law and every policy and stopping hazard on the finer carrier is the pullback of its coarser counterpart through reduction of every retained position. Indeed the reduced initial law agrees, and the translation, port-selection and stopping kernels then agree conditionally at each step; induction gives equality of all reduced history laws. A policy with additional dependence on fine positions requires its own descent condition.

All carriers are finite: position requires $m^4$ basis states, each port record $N$ states, the length-$T$ history at most $(m^4)^{T+1}N^T$ states, a stopping clock $T+1$ states, and a halt flag two states. A finite tensor power of any supplied local carrier of dimension at least two contains an isometric copy of their product. Extend every translation by the identity and every instrument by a normalized invalid-code outcome on its orthogonal complement. This gives a full-carrier normalized construction. Definition 23 qualification, source admission of these operations, unit maps and their complete cost belong to the nominated source branch. ∎

<a id="theorem-c6q1"></a>

<a id="theorem-c6q1-faithful-shell-words-and-euclidean-packing"></a>**Theorem C.6q.1 (Faithful Shell Words and Euclidean Packing).** Let $S$ be a finite antipodal equal-norm spanning shell in $\mathbb R^4$ of positive radius. Write $L=\mathbb ZS$, $r=\operatorname{rank}_{\mathbb Z}L$ and $B_S(T)=\{s_1+\cdots+s_j:0\le j\le T,\ s_i\in S\}$. A repeated translation word acts on one Euclidean position coordinate with a fixed displacement per port, so its endpoint at an initial position $p$ is $p+x$ for $x\in B_S(T)$.

1. Supply a $\mathbb Z$-basis $g_1,\ldots,g_r$ of the actual displacement group $L$ and the integer port coordinates $z_s\in\mathbb Z^r$, $s=\sum_i(z_s)_i g_i$. For each finite $T$, there is a finite normalized instrument preserving the complete tagged translation-word response of Theorem C.6q, including equality of exact displacements and their calibrated four-dimensional values, for this broader class of shells. In particular the algebraic unit $600$-cell admits such finite instruments for every $T$.
2. Suppose a common source realizes arbitrarily large horizons with one physical site for each distinct reached position, in the same Euclidean length units. Suppose that for some fixed $\rho>0$ and integer $M<\infty$, every ball of radius $\rho$ contains at most $M$ such sites, uniformly in the horizon. Then $r=4$ and $L$ is a full lattice. Conversely every such lattice satisfies a uniform packing bound on its reached positions at every fixed $\rho$.
3. For $r>4$, the minimum Euclidean distance $d_{\min}(T)$ between distinct points of $B_S(T)$ satisfies $d_{\min}(T)\le C_S T^{1-r/4}$ for all sufficiently large $T$, where $C_S<\infty$ depends only on a fixed choice of basis and representative shell words. Thus a fixed positive exclusion distance for separate positions is a stronger form of the packing premise and gives the same crystallographic restriction.

*Proof.* The group $L$ is finitely generated and torsion-free as a subgroup of the additive group of $\mathbb R^4$, hence has an integer basis. Equivalently, its presentation is $\mathbb Z^{|S|}/\ker (n\mapsto\sum_s n_s s)$, whose kernel is saturated. With $A:\mathbb R^r\to\mathbb R^4$, $Av=\sum_i v_i g_i$, the restriction of $A$ to $\mathbb Z^r$ is injective. Its real rank is four. Thus $r\ge4$, and $r=4$ implies that $A$ is invertible and $A\mathbb Z^4$ is a full lattice.

For item 1, choose $m>2T\max_s\|z_s\|_\infty$. Use the permutation $U_s|x\rangle=|x+z_s\rangle$ on $(\mathbb Z/m\mathbb Z)^r$ and the normalized history-conditioned translation and stop/continue instruments of Theorem C.6q. Every recorded word of length at most $T$ has a unique lift of its displacement to the integer box of radius $T\max_s\|z_s\|_\infty$ about zero. Therefore two recorded displacements are equal exactly when their lifts agree, and application of $A$ gives their Euclidean values. The Kraus normalization, stopped-law formula and finite adaptive induction hold with $m^r$ position codes. A fixed-length history space uses $T+1$ position slots, $T$ port slots, a halt flag and a clock. Its dimension is at most $2(T+1)(m^r)^{T+1}(|S|+1)^T$, using a blank port label and padding unused position slots. The fixed calibration uses the supplied $A$. A basis change produces the same bounded-word laws and Euclidean outputs after decoding. If $S$ has algebraic coordinates, rational linear relations among these entries determine the integer relations: use a common number field, expand its elements in a rational basis, clear denominators and take an integer basis of the image of the resulting integer matrix. The matrices of the $H_4$ root reflections admit algebraic entries in an orthonormal frame, obtained from the positive-definite simple-root Gram matrix with algebraic entries and its algebraic Cholesky factor. The finite root orbit in Theorem C.6k therefore gives the $600$-cell an algebraic instance. The trace test in that theorem excludes crystallography for this instance.

For items 2 and 3, the antipodal port list gives a positive-length representative word for each $g_i$, since each negative coefficient in an integer combination can use the opposite port. Fix such words of lengths $\ell_i\ge1$ and put $L_0=\sum_i\ell_i$, $R_0=\sum_i\|g_i\|$. For each integer $n\ge1$ the $(n+1)^r$ points
$$
\left\{\sum_{i=1}^r k_i g_i:0\le k_i\le n,\ k_i\in\mathbb Z\right\}
\subseteq B_S(nL_0)\cap[-nR_0,nR_0]^4
\tag{C.6q.1.1}
$$
are distinct. A grid of cubes of side $\rho$ covers this box with $O((1+nR_0/\rho)^4)$ cubes, each lying in a ball of radius $\rho$. The physical packing hypothesis bounds the number of sites by $M$ times this cube count. Since arbitrarily large horizons admit these words, $r\le4$. For the converse let $r=4$ and $\delta=\|A^{-1}\|_{\rm op}^{-1}>0$. Any two lattice points are at least $\delta$ apart. Comparing the volume of disjoint open $\delta/2$-balls around lattice points within a radius-$\rho$ ball with that of the radius-$\rho+\delta/2$ ball bounds their number by $(1+2\rho/\delta)^4$.

To obtain the quantitative near-return, partition the box in (C.6q.1.1) into $q^4$ cubes of side $2nR_0/q$, where $q=\lfloor((n+1)^r-1)^{1/4}\rfloor$. Two distinct endpoints lie in the same cube, with distance at most $4nR_0/q$. Since $q$ grows at least as a fixed multiple of $n^{r/4}$, choose $n=\lfloor T/L_0\rfloor$ and use $B_S(nL_0)\subseteq B_S(T)$ to obtain the bound. ∎

**Example (Displacement Rank of the $600$-Cell).** Use unit simple roots $\alpha_1,\ldots,\alpha_4$ of $H_4$ in the order along the Coxeter diagram with edge labels $5,3,3$. In this basis each simple reflection has entries in $\mathbb Q(\varphi)$, where $\varphi=2\cos(\pi/5)=(1+\sqrt5)/2$. Hence the rational span of the root orbit has dimension at most eight. If $R_i$ is the simple reflection in the hyperplane perpendicular to $\alpha_i$, the first edge gives $R_1\alpha_2-\alpha_2=\varphi\alpha_1$ and $R_2\alpha_1-\alpha_1=\varphi\alpha_2$. The displacement group is preserved by every $R_i$. Each subsequent edge with label three gives $R_{i+1}(\varphi\alpha_i)-\varphi\alpha_i=\varphi\alpha_{i+1}$ for $i=2,3$. Thus all four $\alpha_i$ and all four $\varphi\alpha_i$ belong to the group. They are rationally independent because the simple roots are real linearly independent and $\varphi$ is irrational. The rank is eight, and item 3 gives $d_{\min}(T)\le C_S/T$ for the $600$-cell.

Finite tagged records can store distinct positions as digital codes and recover their exact Euclidean values using a calibrated map. The packing hypothesis concerns distinct spatial sites realizing those values in common physical units. It is sufficient and necessary for the uniform packing property of the exact Euclidean word endpoint sets. A source that physically enforces it admits only crystallographic shells, so Theorems C.6k and C.6l.1 give the corresponding census. Theorem C.6q.2 gives another sufficient premise, a bounded regional quantum input for endpoint discrimination at fixed nonzero success. Theorem C.6q.3 supplies the physical endpoint and complete tariff on the stated site array, with a per-grade gap from its actual verification and delivery work.

<a id="theorem-c6q2"></a>

<a id="theorem-c6q2-finite-regional-readout-capacity-and-shell-rank"></a>**Theorem C.6q.2 (Finite Regional Readout Capacity and Shell Rank).** Use the shell, exact word endpoints and Euclidean units of Theorem C.6q.1. Fix a physical ball radius $\rho>0$ and an error allowance $0\le\varepsilon<1$. At horizon $T$, require that any set of reached endpoints in a ball of radius $\rho$ can be discriminated with average success at least $1-\varepsilon$ when its endpoints are equiprobable. All endpoint-dependent input to the discriminator in that ball is supplied in a quantum register of dimension at most $d_T$. The discriminator may also use a reference with the same marginal state for every endpoint, including prior entanglement with the register. The reference condition is imposed before the readout for the test; prior histories correlated with the endpoint belong in the endpoint-dependent input. Then there is a constant $c_S>0$ such that
$$
d_T^2\ge c_S(1-\varepsilon)T^{r-4}
\qquad(T\text{ sufficiently large}).
\tag{C.6q.2.1}
$$
The left side can be replaced by $d_T$ in the absence of a reference or if it is in a fixed product state with every encoded register. In particular a common finite regional capacity bound forces $r=4$. For the $600$-cell, $r=8$, and the register must carry at least $2\log_2 T-O(1)$ qubits with the reference allowed, or $4\log_2 T-O(1)$ without it. The bound concerns finite-region physical endpoint readout, with a fixed nonzero success fraction. A global register that stores a word and returns its Euclidean value may have a different access and capacity law.

*Proof.* Use the $(n+1)^r$ distinct reached points of (C.6q.1.1) with $n=\lfloor T/L_0\rfloor$. Partition their bounding box into cells of side at most $\rho$, each contained in a ball of radius $\rho$ in four dimensions. For $n\ge1$ the number of cells is at most $(1+2nR_0/\rho)^4\le n^4(1+2R_0/\rho)^4$. At least one ball therefore contains
$$
M_T\ge\frac{(n+1)^r}{n^4(1+2R_0/\rho)^4}
\ge c_S T^{r-4},\qquad
c_S=(2L_0)^{-(r-4)}(1+2R_0/\rho)^{-4},
\tag{C.6q.2.2}
$$
where the last step uses $T\ge2L_0$ and $r\ge4$.

Write $A$ for the ball's register, of dimension $d\le d_T$, and $R$ for the reference. For each endpoint $j$ let $\omega_j$ be its encoded state on $A R$ and let $\sigma$ be the common marginal on $R$. Let $F_j$ be the positive effect for output $j$ of the full readout, with $\sum_j F_j\le I$. Every such state satisfies
$$
\omega_j\le d I_A\otimes\sigma .
\tag{C.6q.2.3}
$$
To see this, block-decompose $\omega_j$ in a basis of $A$. For a test vector with components $v_i$ in $R$, positivity bounds each block cross term by the geometric mean of the two diagonal terms. Cauchy–Schwarz then bounds the full form by $d\sum_i\langle v_i,(\omega_j)_{ii}v_i\rangle$. Each diagonal block is bounded by the sum of all diagonal blocks, which is $\sigma$. This proves (C.6q.2.3). Thus
$$
\frac1{M_T}\sum_j\operatorname{Tr}(F_j\omega_j)
\le\frac{d}{M_T}\operatorname{Tr}\bigl((\textstyle\sum_j F_j)(I_A\otimes\sigma)\bigr)
\le\frac{d^2}{M_T}.
\tag{C.6q.2.4}
$$
With no reference, use $\omega_j\le I_A$ to get $d/M_T$. A fixed product reference can be absorbed into the readout effects by taking their expectation in $\sigma$. Requiring the declared success gives (C.6q.2.1). The factor $d^2$ is optimal for a general quantum register with an endpoint-independent reference marginal: a maximally entangled pair of dimension $d$ and its $d^2$ Weyl translates on one factor give an orthogonal family with the same reference marginal. With no reference, an orthonormal register basis attains the corresponding bound at $M_T=d$. These examples concern the local readout inequality itself. ∎

For $r=4$ a finite regional register can implement this discrimination on the supplied-site lattice of Theorem C.6q.1. Label the endpoints in each ball by distinct basis states and use the local Euclidean decoder for those labels. The same packing constant bounds its dimension uniformly in $T$. Distinct balls may reuse the same labels. Implementing the entire source with a regional bound still requires a specification of each ball's accessible ports, references and routing. The theorem also gives a necessary resource test if a source prices information in the ball: with a fixed positive debit per qubit of the discriminating register, the debit at the crowded ball grows at least logarithmically with the horizon for $r>4$. No calibration of a floor coefficient or cardinality tariff is used.

<a id="theorem-c6q3"></a>

<a id="theorem-c6q3-shell-selection-on-a-site-array-with-harmonic-verification"></a>**Theorem C.6q.3 (Shell Selection on a Site Array with Harmonic Verification).** Fix a physical site spacing $a>0$ and use the four-dimensional cubic position array $a\mathbb Z^4$. Install an independent translation port at the origin for every registered displacement in a chosen shell
$$
S\subseteq S_{\mathrm{grid}}=\{av:v\in\mathbb Z^4,\ |v|^2=50\}.
$$
Admit every antipodal spanning subset, and retain its marked displacement records. The common source is the site, clock, translation and verification service below, with two ordered harmonic checks and its protected delivery reserve. At every finite word horizon it gives the exact site response, a common uniform spatial packing bound, and a complete resource ordering that first maximizes the full-symmetry harmonic floor and then minimizes port count. The selected unmarked shell class is $5aD_4$, with 24 ports. The conclusion is on this known-frame integer-site source with the specified verification and energy service.

*Sites and complete word responses.* Each physical site is a module for one position in $a\mathbb Z^4$. A ball of radius $\rho$ projects on each coordinate axis to an interval of length $2\rho$. It contains at most $(2\lceil\rho/a\rceil+1)^4$ site modules, uniformly in the word horizon. A displacement port is a local control on the transported position excitation with the fixed calibrated action $x\mapsto x+s$, a common physical tick and a retained tag $s$. Intermediate hardware for a finite grade can use the four axial unit translations in a fixed padded sequence of at most 28 steps, since each integer coordinate of a port has magnitude at most seven. Each signed axial unit translation on an array is implemented by two layers of disjoint nearest-neighbor swaps between two site tracks: first swap the active and buffer tracks within every site, then swap the buffer track at $x$ with the active track at $x\pm a e_j$. For the admitted single-position input with the buffer initialized at zero, the composition translates the active excitation by $\pm a e_j$ and leaves the buffer ready. The action on all other states is the same complete permutation. The zero-step padding slot uses the same timed tagged control on the full support. Site initialization and the record clocks and supports remain physical.

At word horizon $T$, take the integer box of radius $28(T+1)$ in each coordinate with an outer boundary. In each axial direction perform only the swaps that have both endpoints in this box. For every admitted word and intermediate elementary move the excitation is strictly inside the box, and so the boundary creates no wraparound. The per-axis swap counts, including identity padding, can be charged on the whole common array. The transported coordinate is first recorded in four signed integer words, obtained by basis-controlled readout from the position excitation. Independently registered classical policy and stopping slots use the full normalized construction of Theorem C.6q. Every past port, position, failure, halt and timing record is retained. Public conditional policies may use only the available prefix. Verification scratch remains private until its check. At each resolution the comparison uses the finite protocol family of all port words up to $T$ and all allowed deterministic stop and port choices on the finite alphabet. Their finite randomizations extend the response laws affinely. The policy and halt decision use declared padded work slots common to all candidate shell comparisons. They can act on the whole physical port-code alphabet, with a retained invalid-code record if an absent port is requested. On policies choosing admitted ports, the translated and recorded process is the normalized word and stopped-response laws of Theorem C.6q on actual positions. Every permitted shell translation is a literal displacement in the same length unit. Two distinct endpoints are at distinct sites even when their port words differ only by a long relation. The direct tagged one-step readout supplies the complete displacement table and its Gram products.

*Common harmonic verification.* The installed array has $N_*=|S_{\mathrm{grid}}|=744$ possible port locations. This follows by writing 50 as four squares. The possible sorted absolute coordinate lists are $(0,0,1,7)$, $(0,0,5,5)$, $(0,3,4,5)$, $(1,2,3,6)$ and $(3,3,4,4)$, with respective multiplicities $48,24,192,384,96$. These are obtained by sorting the coordinates, checking each of $0\le v_1\le v_2\le v_3\le v_4\le7$ against the squared norm, and counting permutations and signs.

Let $G(S)\subset O(4)$ be the full shell symmetry. From the exact one-step displacement records, pick the first ordered linearly independent four-frame in the common port order. Scan every ordered four-tuple in the fixed potential port alphabet and recover the unique linear matrix sending this frame to that tuple. Accept its matrix exactly when its image entries correspond to present ports, it is orthogonal and it permutes the whole observed shell. This terminates by exact integer and rational arithmetic. Every element of $G(S)$ occurs once, since a linear map is determined by its images on the frame. Missing and invalid records remain in the complete verification transcript. All arithmetic registers have uniform finite widths for the finite branch, and control loops run over the same input supports with padding. Neither the shell floor nor any candidate's harmonic ranks enter the program.

For $\ell=2,4$, let $H_\ell$ be the complexification of real homogeneous harmonic polynomials of degree $\ell$ on $\mathbb R^4$, with the $L^2(S^3)$ inner product. Its dimension is $d_\ell=(\ell+1)^2$. A fixed frame of harmonic basis functions and the real-space symmetry matrices give the unitary action $\rho_\ell(g)f(x)=f(g^{-1}x)$. The exact group mean
$$
P_\ell(S)=|G(S)|^{-1}\sum_{g\in G(S)}\rho_\ell(g)
$$
is an orthogonal projection, by multiplication and inversion in the finite group. Thus it can be used as an actual finite quantum test, with the complete effects $P_\ell,I-P_\ell$. For a literal common controller, the reversible register records the exact rational group mean in a fixed rational harmonic-polynomial basis with the associated fixed Gram matrix. After passing to a fixed orthonormal carrier, for each computed projector $P$ apply the controlled pointer unitary $P\otimes X+(I-P)\otimes I$ with a ready pointer in state $|0\rangle$, where $X$ flips the two pointer states. This Hermitian involution gives the two projector effects exactly. The positive tagged implementation of Definition W.6a.6 used in Theorem R.5.1e implements this unitary on its complete support. The full finite controlled table for this pulse is fixed over every register word, including invalid values, and uses a padded full-support slot. This is a finite native control under the declared supplied-ready tariff, with its complete table, precision, norm, timing, complement and apparatus costs. Both checks are always executed. No active record of either harmonic rank is needed in the preparation.

To turn each harmonic test into an exact one-bit diagnosis, prepare the normalized antisymmetric vector in $H_\ell^{\otimes d_\ell}$ that fills all $d_\ell$ directions. The preparations are independent of $S$. The no-alarm effect is $(I-P_\ell)^{\otimes d_\ell}$, and the alarm effect is its complement. The former is a projector that preserves the antisymmetric line. On that line it is the scalar $\det(I-P_\ell)$, as follows by expanding the wedge of the $d_\ell$ transformed basis vectors. The alarm bit $A_\ell$ therefore equals $1$ exactly when $H_\ell^{G(S)}$ has positive dimension, and $0$ otherwise. Both effects and all full tensor factors are retained. At finite approximate precision an operator-norm error $\epsilon$ in either complete diagnostic effect and a trace-norm preparation error $\eta$ change its alarm probability by at most $\epsilon+\eta$. The exact statements below refer to the ideal finite-source instrument and its separately controlled approximation. A common supplied pulse tolerance can be tightened until the cost-order gap below is preserved.

*Protected delivery task and complete resource map.* The service uses two protective stages on the same shell array. It guarantees that a work-delivery register comes with both checks for low-degree nonradial symmetry invariants. The service interprets the two checks as its qualification criteria for the routine delivery channel. A detected degree-two invariant fails the first stage and invokes two independent full-array verification deliveries, one for each stage. A degree-four invariant with no degree-two alarm fails the second stage and invokes one full-array verification delivery. These loads are directional test supplies furnished at all the addresses of the fixed instrument. Stage one certifies the source before either order can use its routine supplies. If it fails, both orders receive their own full reserve. A stage-two failure with stage one passed releases only the second-order reserve. This operational task specifies which loads must arrive for each diagnostic result. On clean stages the ready delivery cells pass through idle slots. This work-delivery contract is the same for all port tables. It uses a vector-space symmetry diagnostic followed by a literal two-stage delivery operation, with a fixed energy gap and clock. The contract gives an application of the source for which the diagnostic outcomes matter. The comparison objective is the total holding and delivered energy per horizon, with all control and source costs carried. These prices specify the service before shell nomination. In particular each delivery uses the full potential array to meet its registered coverage, regardless of the number of active translation ports. 

Use the same two-level storage gap $E>0$ for active port readiness and delivery loads. At the beginning, the addressable active-port holding register at each potential location is in its excited state if that translation is installed, and in its ground state otherwise. These registers are retained until the end of the fixed horizon $H$. The complete address table may be formed by exciting the indicated port cells with a fixed controlled pulse from the measured presence bits; all controls have full padded support. Every installed port carries $E$ of energy relative to the all-ground reference, and the initial supply work is exactly $E|S|$. Read-only copies are coupled independently of subsequent diagnostic outcomes. They retain the actual shell setting without an unpriced memory reset.

Each of two delivery banks owns $N_*$ two-level loads initialized at ground and a common guarded work pulse. The first bank excites all its loads iff $A_2=1$. The second excites all its loads iff $A_2=1$ or $A_4=1$. These predicates may also be implemented by retaining a reversible three-input logic record. Each conditional operation acts on the full support with a padded fixed pulse. Its work is the difference of the final and initial energies of the loads, and is $N_* E$ when its control is true and zero otherwise. The output load energy is retained through the horizon and exported as the required delivery record. The source retains the exported loads and both stage histories, including the ready loads on clean stages. A clean stage's idle cells remain physically present and priced. The two banks are sized by the installed address array, without using a cardinality or floor from a nominated shell. The work stroke uses the same two-level gap as each installed port.

Here is one uniform complete comparison tariff for the admitted controlled service. Choose a fixed positive duration $\tau$ for each elementary timed operation and pad every translation to 28 two-layer moves. The controller slots include registration of all $N_*$ address bits, reading the fixed ordered displacement table, frame selection, one complete $N_*^4$-tuple scan with padded full permutation and membership checks per tuple, both harmonic preparations and tests, the two guarded delivery banks, and all archival steps. For an explicit finite schedule, each deterministic bounded arithmetic map can write its output reversibly into a ready register by $(u,v)\mapsto(u,v\oplus F(u))$, with all input and scratch words retained. Each such full controlled map receives one native tagged slot. A fixed frame search can run over all $N_*^4$ ordered tuples and write every independence bit. The subsequent scan writes one candidate matrix and its validity bits per ordered tuple, using a fixed full membership check over all addresses. Matrix inversions only occur on accepted nonsingular frames, with fixed dummy outputs on the failure branches. The register widths are bounded by the exact integer numerators and denominators appearing in this finite algorithm on the fixed address range, before any shell is chosen. For example $|\det F|\le 2500$ for any four-frame matrix $F$ by Hadamard's inequality on its length-$\sqrt{50}$ columns, so all matrix entries in the scan are rational with denominators dividing one of $1,\ldots,2500$. A single native full-support arithmetic gate is sufficient for any one of these finite write operations under the declared tariff. Their complete tables enter the stock. This gives a finite, shell-independent slot count and stock on every address mask, including invalid masks. A maximal word horizon adds exactly $T$ reserved translation, arbitration, recording and stop blocks, with the same idle slots after stopping. The arbiter acts on one command word each tick. It authorizes a present-port command while the halt flag is zero, retains an invalid event on an absent-port command, and sends a stopped or absent command through the idle control. There is one active position path per fixture. Each timed operation has its own tagged slot and each retained diagnostic its own registers. Each supported comparison is run from a fresh, separately prepared fixture or a disjoint retained fixture, according to a fixed serial schedule. This is a comparison of complete, single-fixture programs with the same slot horizon $H$; a full batch pays the sum of those invoices.

For a fixed finite schedule $j=1,\ldots,L_T$ and its owned apparatus list, the common invoice can be written $C_T=(K_{\rm stock,T}+\sum_j K_{\rm slot}(D_j,\tau_j,P_j,A_j)+K_{\rm retain,T})/H$. Here the stock and retention charges price the complete lists of site tracks, port and delivery reserves, working and archive registers, all controller and supplier tables, clocks, pulse hardware, inactive words, and exact or tolerance-bounded reference preparations. The slot charge is a fixed positive function of the full gate support dimension $D_j$, duration $\tau_j$, reserved peak power $P_j$ and reserved integrated action $A_j$. All these arguments and the stock and retention intervals are common. Slots for the energy loads also use a fixed drive reserve proportional to the number of physical loads on that port; their actual net energy transfer is charged separately. The full address and translation schedules run in every comparison, including on inactive locations. Use the drift-tracked pulse of Definition W.6a.6 and the positive tag involution of Theorem R.5.1e on each complete control slot. With $W_U=U\otimes|1\rangle\langle0|+U^\dagger\otimes|0\rangle\langle1|$ and $A=\pi(I-W_U)/2$, the generator has $\|A\|=\pi$ on the full support and integrated norm action $\pi\hbar$ in every slot. The $\sin^2$ envelope in Definition W.6a.6 gives peak added norm $2\pi\hbar/\tau_j$. Fixed reserved drive and control-action prices are independent of the input and the tagged operation. For the work cells the diagonal bare Hamiltonian is physically retained, so the exact occupation changes also carry the stated energy transfers. To implement the drift-tracked pulse, in the interaction picture use the common tag-flip involution pulse for the required controlled unitary. Conjugating its added generator by the free bare evolution preserves positivity and norm. The bare diagonal evolution changes phases and preserves the prepared occupation, record and load energies, which are the priced outputs. Any phase-sensitive harmonic meter can be driven in the same declared interaction-picture clock. The supplier owns all waveform and power support. The ideal closed pulses leave the net bare excitation work as calculated, with no hidden setting-dependent heat during the isolated slot. Preparation and holding supplies stay in the stock and retention invoices.

The position and record cells outside the priced energy loads may have zero bare Hamiltonian in the controlled windows with a fixed stock and slot cost. Auxiliary energy states for failed, idle and successful commands are treated in the complete common slot price. The finite service comparison reserves all addresses and archives, and installs no additional shell-dependent ports beyond the marked active readiness record. Candidate production, port registration, diagnostics and guarded load preparation all run within this source. Its only setting-dependent supplied energies are the actual occupied-port and delivery energies just derived. Thus with $c=E/H$, the scalar resource cost is
$$
J_T(S)=C_T+c|S|+N_*cA_2+N_*c(A_2\vee A_4).
$$
The physical common term $C_T$ retains the full support, program and timing of the fixed operations. Under a uniform bound $\delta$ on each alarm error probability, a union bound gives an expected delivery-cost perturbation at most $3N_*c\delta$. To preserve the shape gap between two settings, it suffices that $\delta<4/N_*$ and that other measured systematic energy errors are absent. The exact resource ordering uses the full projective instruments above. Equivalently use a positive resource cone with coordinates for common stock, port supply and delivery supply, and positive unit scalarization. This gives the components of Definition D.1f for the finite full array, with branch domain all the declared shell masks and fixed service family; the responses include every calibration, test and translation outcome. The budget may grow with horizon and arithmetic or pulse precision. There is no uniform bound on total apparatus size in the proof.

*Selection, witnesses and scope.* Theorem C.6l gives exactly the possible full-symmetry floors $2,4,6$ on this crystallographic branch. Central inversion removes odd harmonics. By the harmonic criterion of Theorem C.6l.1, at floor two $A_2=1$, at floor four $A_2=0,A_4=1$, and at floor six $A_2=A_4=0$. The derived defect costs are respectively $2N_*c,N_*c,0$. Since every candidate has between 8 and $N_*$ ports, each successive defect-cost difference $N_*c$ dominates any admissible cardinality difference. The occupied-port work gives strict cardinality ordering within a layer.

All three layers occur at the same array spacing and radius. The shell $5aD_4$ supplies a floor-six candidate. An eight-point cross-polytope uses the antipodal pairs of $(5,5,0,0)$, $(5,-5,0,0)$, $(0,0,5,5)$ and $(0,0,5,-5)$, all times $a$, and has floor four. Replace its first vector by $(7,1,0,0)$ and its negative to obtain a floor-two shell. The latter is still spanning since the determinant of its four representative columns is nonzero. Its graph of nonzero inner products between distinct shell points has one component of size four and two of size two. Every orthogonal symmetry preserves the four-point component and its plane, giving a nonradial invariant quadratic. Theorem C.6n makes $5aD_4$ the unique 24-point orthogonal class at floor six, and every larger floor-six shell has at least 48 points. Thus the optimal shape is unique and has a cost gap at least $24c$ from any inequivalent shape. The registered coordinate outputs can distinguish several placements of the same shape, and those placements tie. The geometric conclusion identifies them only after passing to the unmarked shape. The complete marked protocol retains their physical labels.

The spatial packing certificate uses actual sites of the cubic array in the common physical length unit. The floor is obtained by two finite harmonic instruments operating on readout data. The cost ordering belongs to the specified protected delivery service with its installed gap, reserve and access. Changing the service can change the ordering. The domain is all admissible masks on this particular integer-site radius. It is a proper subset of the full crystallographic class. $\square$

The [grid shell census](../related/calculation_companions/appendix_c/c6q3-site-array-census.md) gives the finite arithmetic checks.

<a id="theorem-c6r-rational-floor-two-deformation-and-continuous-ledger-obstruction"></a>**Theorem C.6r (Rational Floor-Two Deformation and Continuous-Ledger Obstruction).**

#### 1. Rational shell family

Use the original squared-radius-two $D_4$ shell $\Xi=\{\pm e_i\pm e_j:i<j\}$. Put

$$
\begin{aligned}
R&=(1/2)\begin{bmatrix}-1&-1&-1&-1\\1&-1&-1&1\\1&1&-1&-1\\1&-1&1&-1\end{bmatrix}, \\
v&=(1,1,0,0),\quad H=\{\pm R^j v:j=0,1,2\}.
\end{aligned}
$$

$R$ is orthogonal and $R^{2}+R+I=0$. $H$ is a regular hexagon in a two-plane. For rational $t$ in $(1/2,3/5)$, put

$$
\begin{aligned}
d&=t^{2}-t+1,\\
a&=(1-t^{2})/d,\\
b&=(1-2t)/d,\\
A_t&=aI+bR,\\
S_t&=(\Xi\setminus H)\cup A_t H.
\end{aligned}
$$

Since $a^{2}-ab+b^{2}=1$ and $R+R^{T}=-I$, $A_t$ is orthogonal. All coordinates are rational. Each $S_{t}$ has 24 distinct antipodal points, radius $\sqrt{2}$, and spans $\mathbb{R}^4$: its second moment equals that of $\Xi$. Clearing denominators places its integer span inside a rescaled $\mathbb{Z}^4$, so it is crystallographic. $A_{t}$ tends to $I$ as $t$ decreases to $1/2$, and hence $S_{t}$ tends to $\Xi$ in Hausdorff distance, even with a pointwise labeling.

A regular hexagon has radial second and fourth moments on its own plane. $A_{t}$ preserves that plane and rotates it, so replacing H by $A_{t}$ H preserves those tensors exactly:

$$
\begin{aligned}
\sum_{s\in S_t} (s\cdot x)^{2}&=12|x|^{2}, \\
\sum_{s\in S_t} (s\cdot x)^4&=12|x|^4.
\end{aligned}
$$

The 108 moved–unmoved cross inner products have just six values:

$$
\pm(2t-1)/d,\quad \pm(1-t^{2})/d,\quad \pm t(2-t)/d.
$$

On $(1/2,3/5)$, their positive magnitudes lie respectively in $(0,1)$, $(0,1)$, and $(1,2)$, with none equal to $0,1,2$. Within each of the two parts, inner products still belong to $\{0,\pm1,\pm2\}$. Thus the intrinsic graph joining pairs with inner products outside that set is exactly $K_{6,18}$. Its degree classes distinguish the moved hexagon from the other 18 vertices. Every full orthogonal shell symmetry therefore preserves the moved hexagon's two-plane. Its full symmetry representation is reducible. A nonradial invariant quadratic exists; antipodality excludes invariant linear forms. Consequently its full-symmetry anisotropy floor is exactly 2, whereas $\Xi$ has floor 6.

This is a convergent rational family with unchanged cardinality and low moments. A second/fourth angular-moment prediction task alone cannot detect the required full-symmetry floor.

#### 2. Conditional finite-source obstruction

Consider a nominated common source on the labeled neighborhood above satisfying all the following explicit assumptions:

1. Its finite preparation/readout protocol has a fixed finite number of slots and a common finite carrier, or a common isometric embedding of the used carriers.
2. Its preparations and complete instruments, including all output flags and retained side records, depend continuously on the geometric parameters in trace/diamond norm.
3. The task, score, permitted controller menu, feasible-certificate set and finite horizon are fixed independently of the shell; every compared controller remains admissible throughout this neighborhood. The losses are bounded, and the registered PP/scalarization map is continuous. For a fixed controller, the complete resource debit also varies continuously; a finite controller menu can be optimized.
4. No extra perfectly distinguishable exact-floor or exact-symmetry descriptor is provided to the receiver or tariff controller for free.

Then every fixed-controller complete record law is continuous at $D_4$. Indeed, telescoping a finite composition bounds its output trace distance by initial-state distance plus the sum of the instrument diamond-norm differences. Recorded classical outcome total variation is bounded by this trace distance. The difference in expected bounded scores tends to zero. Applying the continuous registered PP map preserves convergence. The complete cost and benefit objective therefore converges: $J(S_t)\to J(D_4)$. The same holds after minimizing over any fixed finite controller menu whose admissibility is unchanged, since a finite minimum of continuous functions is continuous. Fixed finite instruments alone do not guarantee this: an exact-feasibility constraint may make a cheap controller inadmissible at every $t\ne 1/2$ even when its error tends to zero. That mechanism is excluded by hypothesis 3 and remains a possible source route outside this theorem.

For the exact floor-indexed objective $J(S)=c|S|+h_{a(S)}$ with $c>0$ and $h_2-h_6>16c$, such a source cannot realize that objective on this full class: both shells have cardinality24, so the required difference is the fixed positive h2−h6, contradicting continuity. More generally, this neighborhood prevents any uniform positive lower objective gap against all floor-two shells for a source satisfying the four hypotheses.

The failure is not uncertainty in the existing finite subgroup census. It is a missing operational map from continuously approaching physical geometries to a discontinuous invariant-floor reward. 

The obstruction is conditional on all four continuity and access premises. It does not exclude a continuous objective with a unique minimum and vanishing gaps, a geometrically separated finite menu, paid orthogonal exact descriptors, changing feasibility, or unbounded preparation resources.

<a id="theorem-c6r1-uniform-finite-source-bounds-for-complete-budgeted-controller-classes"></a>**Theorem C.6r.1 (Uniform Finite-Source Bounds for Complete Budgeted Controller Classes).** Fix two source settings $x,y$ and one common nonempty class $\mathcal A_B$ of admissible controllers. A controller may use arbitrary ancillary/reference systems, quantum processing, intermediate measurements, classical feedback, retained histories and an observed stopping rule. At most $n_B$ parameter-sensitive source calls occur; stopped histories are padded with a common identity call. All other operations are independent of the source setting. Admit every controller satisfying this same access and budget contract, rather than a finite list.

After a common embedding of the used carriers, let the complete initial joint states, including every source-correlated reference, preparation, descriptor and retained record, have trace distance at most $\epsilon_0(x,y)$ uniformly over $A\in\mathcal A_B$. Appending a common independent controller ancilla preserves this bound. At slot $k$, suppose the complete controlled source channels, including every command branch, exposed side channel, flag and record used by the score or invoice, have half-diamond distance at most $\epsilon_k(x,y)$ on their common input domain. Any parameter-dependent source memory is included in this initial state and channel contract. Put
\[
\omega_B(x,y)=\min\left\{1,\epsilon_0(x,y)+\sum_{k=1}^{n_B}\epsilon_k(x,y)\right\}.
\tag{C.6r.1.1}
\]
Then every $A\in\mathcal A_B$ has complete scored-output states satisfying
\[
D\bigl(\rho_x^A,\rho_y^A\bigr)\le\omega_B(x,y).
\tag{C.6r.1.2}
\]
The bound is uniform over the whole controller class.

Suppose its full scalar objective, in one fixed unit, has the form
\[
J_x(A)=d_x(A)+\operatorname{tr}(F_A\rho_x^A),
\tag{C.6r.1.3}
\]
where $F_A$ is independent of $x$, its spectral range has length at most $L_B$, and
\[
\sup_{A\in\mathcal A_B}|d_x(A)-d_y(A)|\le\ell_B(x,y).
\tag{C.6r.1.4}
\]
The deterministic debit $d_x$ and the record-scored debit in $F_A$ together include every applicable Definition 15 acquisition, representation, processing, update, maintenance and adaptation entry, as well as the registered predictive benefit. In particular, a descriptor, installation cost or clock debit cannot be omitted to obtain (C.6r.1.4). If the infima are finite, the complete optimized values obey
\[
\left|\inf_{A\in\mathcal A_B}J_x(A)-\inf_{A\in\mathcal A_B}J_y(A)\right|
\le \ell_B(x,y)+L_B\omega_B(x,y).
\tag{C.6r.1.5}
\]
No finiteness, compactness or attainment of the controller set is needed for this inequality.

More generally, let $J_x(A)=d_x(A)+\Phi_A(m_x^A)$, where the finitely many components of $m_x^A$ are expectations of fixed observables with spectral ranges at most $L_{\max}$. If the registered maps $\Phi_A$ share a uniform modulus $\mu_B$ in the maximum norm, then the right side of (C.6r.1.5) is instead
\[
\ell_B(x,y)+\mu_B\bigl(L_{\max}\omega_B(x,y)\bigr).
\tag{C.6r.1.6}
\]
For nonnegative loss, $r\mapsto1/(1+r)$ is $1$-Lipschitz. Thus the PP map used in Proposition C.6t satisfies this condition; its registered conversion price multiplies the bound. A scalarization with no common modulus is a separate source assumption.

*Proof.* Compare the two executions after each slot. A common controller channel contracts trace distance. Replacing the next source channel adds at most its half-diamond distance, including when its input is entangled with controller memory and a reference. Starting with $\epsilon_0$ and iterating gives (C.6r.1.2); common final readout and partial traces cannot increase it. Feedback and intermediate outputs are carried in the memory input of the next controlled channel. An observed halt flag makes later common padding operations act as identity on halted branches, so the same induction applies.

For any Hermitian $F$ with spectral range of length $L$, subtracting the infimum of its spectrum and using the trace-distance variational inequality gives $|\operatorname{tr}F(\rho-\sigma)|\le LD(\rho,\sigma)$. Equations (C.6r.1.2)--(C.6r.1.4) therefore give the same bound $\eta=\ell_B+L_B\omega_B$ for $|J_x(A)-J_y(A)|$, uniformly in $A$. Taking infima in $J_x(A)\ge J_y(A)-\eta$ and in the reversed inequality proves (C.6r.1.5). Applying the same trace-distance estimate to each score mean and then its uniform scalarization modulus gives (C.6r.1.6). Finally, $|1/(1+r)-1/(1+s)|=|r-s|/[(1+r)(1+s)]\le|r-s|$ for $r,s\ge0$. $\square$

<a id="corollary-c6r2-exact-deformation-port-modulus-and-paid-query-bound"></a>**Corollary C.6r.2 (Exact Deformation-Port Modulus and Paid Query Bound).** Use the matrices $R,A_t$ and the labeled shells $S_t$ of Theorem C.6r, with $t_0=1/2$, $d=t^2-t+1$ and $q=2t-1$. Let $P_H$ project onto the six labels of the moved hexagon in a $24$-dimensional label register. A common native geometry port on $\mathbb C^{24}\otimes\mathbb C^4$ is
\[
U_t=P_H\otimes A_t+(I-P_H)\otimes I.
\tag{C.6r.2.1}
\]
On the fixed ready input $|j\rangle\otimes |s_j(t_0)/\sqrt2\rangle$, it returns the labeled direction $|j\rangle\otimes |s_j(t)/\sqrt2\rangle$. The full unitary port, its inverse and its coherently controlled version are admitted; every additional source access must be parameter-independent or included in the same source-distance account. An exact finite native realization uses $J=(R-R^{\mathsf T})/\sqrt3$, $K=P_H\otimes(-iJ)$ and $\theta(t)=2\arctan(2(t-1/2)/\sqrt3)$. Since $J^2=-I$ and $K$ is Hermitian with norm one, the supplied positive Hamiltonian $H_t=(\hbar/\tau)(2\pi I+\theta(t)K)$ on a fixed slot $\tau>0$ has endpoint $U_t$. Its installation, calibrated coefficient and clock/drive services remain part of the debit in (C.6r.1.3); a Hamiltonian norm is not substituted for their actual invoice. The source supplies no further parameter-bearing descriptor. Then each counted port call has half-diamond distance from its $t_0$ call at most
\[
\epsilon(t)=\|U_t-I\|=\frac{2t-1}{\sqrt{t^2-t+1}}
=\frac{2\delta}{\sqrt{3/4+\delta^2}}
\le\frac{4\delta}{\sqrt3},\qquad \delta=t-\frac12.
\tag{C.6r.2.2}
\]
Consequently every common $n$-call controller class satisfying (C.6r.1.3)--(C.6r.1.4) has optimized-value difference at most
\[
\ell_B(t,t_0)+L_B\min\{1,n\epsilon(t)\}.
\tag{C.6r.2.3}
\]
This source has the complete controller coverage stated in Theorem C.6r.1: the source's interaction list contains precisely the listed geometry port and parameter-independent operations. A different physical supplier requires its own reduction to that list or its own complete-channel bound.

On a common prepaid-reservation source, let each controller's complete six-category debit be independent of $t$, and let its remaining terminal benefit have a fixed range $L>0$. If every actual call has a separately owned gross debit at least $e_0>0$ and the common hard gross-cost budget is $C$, then any optimized-value gap $\Gamma>0$ requires
\[
\Gamma\le L\min\{1,\lfloor C/e_0\rfloor\epsilon(t)\},
\qquad
C\ge\frac{e_0\Gamma}{L\epsilon(t)}.
\tag{C.6r.2.4}
\]
Thus no fixed finite budget on this source realizes a uniform positive floor-two versus floor-six objective gap along $t\downarrow t_0$. In particular it cannot realize (C.6p.1) with $h_2-h_6>16c$, since $|S_t|=|S_{t_0}|=24$ and that objective requires the fixed gap $h_2-h_6$.

*Proof.* Directly from Theorem C.6r,
\[
A_t-I=-\frac qd(tI+R),\qquad
(tI+R)^{\mathsf T}(tI+R)=dI.
\tag{C.6r.2.5}
\]
Hence $\|A_t-I\|=q/\sqrt d$, and the direct-sum form of $U_t$ gives (C.6r.2.2). The norm difference is unchanged for inverse or controlled ports. For any pure input with any reference, the output-vector difference is at most this operator norm, and the output trace distance is at most that vector difference. Convexity covers mixed inputs. This proves the half-diamond bound and (C.6r.2.3). The common initial preparation has $\epsilon_0=0$. On the prepaid branch $\ell_B=0$, only the terminal benefit remains in $F_A$, and nonnegative complete gross charges imply at most $\lfloor C/e_0\rfloor$ calls. Apply (C.6r.1.5). The cardinality and floor conclusions are those proved in Theorem C.6r. $\square$

<a id="corollary-c6r3-expected-stopping-bound-for-a-retained-floor-statistic"></a>**Corollary C.6r.3 (Expected-Stopping Bound for a Retained Floor Statistic).** Replace the hard call bound by an observed classical stopping time $N$ for one common protocol, with almost-sure termination and
\[
\max\{\mathbb E_xN,\mathbb E_yN\}\le M<\infty.
\]
Suppose every parameter-sensitive call has half-diamond difference at most $\epsilon$ on its complete interface, and the initial-state difference is at most $\epsilon_0$. All stopping flags and histories are retained; a coherent controlled query is counted whenever the primitive source call is made. Then its final output states satisfy, for every integer $n\ge1$,
\[
D(\rho_x,\rho_y)\le\min\left\{1,\epsilon_0+n\epsilon+\frac{2M}{n}\right\}.
\tag{C.6r.3.1}
\]
If a retained Hermitian statistic with spectral range $L>0$ has expectation difference at least $\Gamma$, set $g=\Gamma/L$ and $a=g-\epsilon_0$. For $a>0$ and $\epsilon>0$,
\[
M\ge\max\left\{0,\frac{a^2}{8\epsilon}-\frac a4\right\}.
\tag{C.6r.3.2}
\]
When $\epsilon=0$, finite $M$ is incompatible with $a>0$. If every actual call has a gross paid debit at least $e_0$, any upper bound $\overline C$ on both expected gross costs satisfies the same right side multiplied by $e_0$.

*Proof.* Truncate the protocol after its $n$th call and return one common timeout flag on unhalted histories. The truncated protocols have output distance at most $\epsilon_0+n\epsilon$. Their difference from the corresponding full outputs is at most the respective tail probability, because the observed stopped-history mixture agrees on all already halted histories. Markov's inequality bounds each tail by $M/n$. The triangle inequality gives (C.6r.3.1). The statistic implies $D(\rho_x,\rho_y)\ge g$. Choose $n=\max\{1,\lceil4M/a\rceil\}$. Then $2M/n\le a/2$ and $n\le4M/a+1$, so
\[
\frac a2\le n\epsilon\le(4M/a+1)\epsilon.
\]
Rearranging gives (C.6r.3.2). For $\epsilon=0$, send $n\to\infty$ in (C.6r.3.1). The gross-cost conclusion uses $M=\max\{\mathbb E_xN,\mathbb E_yN\}\le\overline C/e_0$. $\square$

**Application to the shell-source ledger.** These bounds extend Theorem C.6r from finite controller menus to the whole common budgeted controller class, with an explicit source modulus. For Construction C.6s, a common supplied geometry-to-table source giving zero copy loss at $D_4$ and lower-floor loss at least $9/560$ gives the same copy controller an expectation difference at least $9/560$ in a statistic with range $256$. If that supplier reduces to (C.6r.2.1), (C.6r.2.2) and (C.6r.3.2) therefore impose the displayed hard- or expected-call divergence, with $g=9/143360$. Its actual geometry-to-table reduction and paid invoice remain the original source obligations.

An exact symmetry/floor descriptor is a separate initial input or source output and contributes its actual trace/diamond distance; a perfectly distinguishable descriptor can have distance one even as the geometries converge. A changing admissibility set lies outside the common-class hypothesis. A shell-dependent installation/tariff discontinuity lies outside a vanishing $\ell_B$. These are exactly the source routes preserved in Theorem C.6r. A query count becomes an energy, elapsed-time or physical-work bound only through a separately registered positive debit or exposure law. The expected-stopping result concerns a bounded retained statistic; it does not bound an unbounded random invoice without an additional uniform-integrability estimate.

<a id="construction-c6s-finite-table-commitment-instrument-and-complete-wrapper-invoice"></a>**Construction C.6s (Finite Table Commitment Instrument and Complete Wrapper Invoice).**

#### 1. Supplied table and native preparation

Let $p(j,t,b)$ be a supplied normalized nonnegative table on $j=0,\ldots,767$ and $t,b=0,\ldots,256$. Index this table by a fixed public label $G$. There are $D=768\cdot257^2=50,725,632$ entries. Any geometry certificate, derivation of these coefficients, or geometry-dependent supplier tariff is separate input; this construction implements the given table. A table entry is a native coupling coefficient rather than an exact real bit string. The preparation and its errors are retained in the source record.

The following unitary implements the supplied table with the specified access boundary.

#### 2. Fresh preparation and dephasing

Use a 28-qubit supplier register $A$ with fixed fields $(J:10,T:9,B:9)$, and a fresh 28-qubit supplier environment $E$. Unused encodings have zero probability. All working cells start in $|0\rangle$ and are independent of every receiver/system reference; their readiness is paid.

Let $|\psi_G\rangle=\sum_{j,t,b}\sqrt{p(j,t,b)}\,|j,t,b\rangle$. The normalized table implies $\lVert\psi_G\rVert=1$. If $\psi_G\ne|0\rangle$, put $|v\rangle=(|0\rangle-|\psi_G\rangle)/\lVert|0\rangle-|\psi_G\rangle\rVert$ and $H_G=I-2|v\rangle\langle v|$. Since all amplitudes are real nonnegative, $H_G|0\rangle=|\psi_G\rangle$. In the exceptional identity case use $H_G=I$.

This is an actual Hermitian involution. On one positive-duration slot $\theta$, the native Hamiltonian

$$
h_G=(\pi \hbar/(2\theta))(I-H_G)
$$

gives $\exp(-i\theta h_G/\hbar)=H_G$ exactly and $\lVert h_G\rVert\le\pi\hbar/\theta$. Its apparatus and all $D$ calibrated native entries are separately paid. No assertion that this high-dimensional native port is a local two-qubit compilation is made.

Next perform 28 individually owned CNOTs $A_k\to E_k$. The resulting global state is $\sum_i\sqrt{p_i}|i\rangle_A|i\rangle_E$. Retaining $E$ privately and tracing it at the receiver gives the exact classical source mixture, including in the presence of arbitrary receiver reference systems. No purification register is exposed before commitment.

#### 3. Owned interface and fixed schedule

Copy only J and B to a fresh19-qubit receiver register R with 19 individually owned CNOTs. A and E remain supplier-side. All receiver/supplier couplings are exactly the following named ports; in particular no receiver command, field-query selector, pose selector or controlled access to $H_{G}$ exists.

After a fixed positive processing window, capture a 9-qubit receiver report register $I$ by nine SWAPs into a fresh supplier $Q$ register. $I$ becomes zero and the raw report stays in $Q$. Copy $Q$ into a fresh 9-qubit supplier $F$ by nine CNOTs; $F$ is retained. This pinches coherent reports in the computational basis at the source interface. Decode the raw integer $r\in\{0,\dots,511\}$ to $\min(r,256)$ into a fresh 9-qubit $M$ via one reversible finite lookup. Thus every quantum or invalid classical report has a total physical meaning, with no rejected or unpriced branch.

Compute the score index $k=|M-T|$ into a fresh 9-qubit $K$ using one reversible lookup; the actual squared-loss score is $k^{2}/256$. Then, and only then, copy $T$ into a receiver 9-qubit disclosure register and $K$ into a receiver 9-qubit score register, requiring 18 further CNOTs. Every raw report, target, sensor, source environment, decoded report and score remains retained through the declared horizon. Later disclosures cannot change the already captured forecast.

Every trial uses an independent fresh preparation and supplier package. Old transcripts do not give access to its hidden target. Public geometry records may be exposed before the trial only when independent of its fresh source variables; their production is outside this wrapper invoice.

There are 86 active native work slots and one positive processing-window slot, all of duration $\theta$; total wrapper duration is 87theta. No branch-dependent completion time leaks source data. The last 18 output-copy slots occur strictly after capture, pinch, decode and scoring.

#### 4. Full-reference noninterference

Immediately after the first receiver copy the receiver-accessible source law is exactly

$$
\sum_{j,b} p(j,b)\, |j,b\rangle\langle j,b|_R,
$$

with hidden $T$ having its declared conditional law $p(t|j,b)$. For any arbitrary preexisting receiver reference $W$ independent of the freshly prepared source, the joint state is the same classical mixture tensored with $\rho_{W}$ (conditional on the public geometry). Supplier registers $A,E$ are inaccessible tensor factors. Subsequent admissible receiver operations act only on $R,W$ and receiver work cells. Capture and computational pinching therefore induce some classical report kernel $q(r|j,b,W)$; after tracing any residual quantum output, $T$ cannot affect that kernel except through $j,b$. Equivalently $T-(J,B)-\text{report}$ is a Markov chain, also allowing shared randomness independent of $T$ conditional on $J,B$.

The complete precommitment transcript includes all fixed timing flags, execution receipts and public geometry records. They are deterministic or independent of the fresh source variables and therefore do not alter this conclusion. Intermediate receiver instruments, ancillary entanglement, and adaptive local processing remain postprocessings of the same classical input. Every receiver strategy is therefore bounded by the Bayes risk of the supplied table conditional on $J,B$. If that table has $T=B$ almost surely, the simple nine-bit copy of $B$ into $I$ reports $T$ exactly. Its controller has an additional separately priced nine-CNOT implementation; it is not included as free behavior in the wrapper.

The access boundary is enforced by the actual source interaction list and factor ownership. A different supplier exposing an oracle, raw field samples, repeated same-field queries, or coherent access to A/E is a different implementation and is not covered by this proof. A comparison admitting additional readouts must include them in its operation class.

#### 5. Literal finite wrapper resource census

Working cells, each separately supplied ready and retained:

- A28 and E28:56
- R19 and receiver report I9:28
- supplier Q9,F9,M9,K9:36
- postcommitment target/score disclosure registers9+9:18

Total 138 two-level working cells. No cell is counted in two categories.

The 9-input/9-output clamp ROM has $9\cdot 2^{9}=4{,}608$ literal bits. The 18-input/9-output score ROM has $9\cdot 2^{18}=2{,}359{,}296$ literal bits. Invalid unused values can be assigned a total fixed output in the score table; the actual $M,T$ support remains $0\dots 256$. ROM stock is 2,363,904 bits. Each table has a distinct reversible lookup actuator, counted in the active-port total.

Active work ports: one $H_{G}$ preparation,74 CNOTs,9 SWAPs and 2 lookup ports, total 86. Each has its own actuator stock and one positive service reservation. The processing window has no supplier work port. Supply87 ordinary slot-clock stocks,174 fresh phase cells (start/completion per slot), and 87 retained execution-receipt cells. The working-cell count excludes these clock/receipt objects. The exact phase/clock mechanism is a new native timing assumption, not a microscopic closed-clock theorem.

There are $D=50{,}725{,}632$ delivered native calibration entries for preparation. Their readiness and validation against the admitted mathematical source domain have a named positive tariff coordinate; they are not asserted to be $D$ finite digital encodings of exact reals. The full preparation actuator is separately paid. Both are physical supplier obligations in any proposed adoption.

For any pre-fixed positive tariff vector, the exact wrapper invoice is the dot product of this census with its stock, ROM, calibration, actuator, work, clock and retention prices. Let $H_{\mathrm{ret}}\ge 87\theta$ be the pre-fixed retention horizon. The working cells, ROM, phase and receipt cells, calibrated apparatus and clock stocks each carry their own positive holding-service entry through $H_{\mathrm{ret}}$; a common holding rate may be used only if explicitly supplied. Receipt production and old-environment retention are not free reset credits. Each campaign gets a fresh paid package.

The Hamiltonian construction supplies native endpoint transformations and a norm bound. It does not equate their microscopic driving work with their service prices. Every driver, ready-cell source, clock, external control, calibration and holding service is the expressly priced open boundary, exactly as a nominated native instrument requires. None is an uncharged bath.

This wrapper cost is common in resource counts across shell shapes. Its native coefficient values vary by their derived p table. Claiming a uniform delivered calibration/actuator tariff is an additional explicit supplier premise; the current construction does not infer it from uniform dimension or Hamiltonian norm.

The construction supplies a normalized finite instrument and its commitment/access/resource proof for the given table. It does not derive a harmonic geometry-to-table map, a full-symmetry descriptor, or an independently selected physical tariff.

<a id="proposition-c6t-uniform-commitment-law-error-and-risk-gap-preservation"></a>**Proposition C.6t (Uniform Commitment-Law Error and Risk-Gap Preservation).**

Assume the supplied ideal comparison tables have lower-floor Bayes risk at least $a=9/560$ and a nominated comparison table has a zero-risk copy predictor, with the access/score interface of Construction C.6s. Let $\epsilon$ bound trace distance between the actual and ideal complete precommitment source states, uniformly over the supplied comparison family and any allowed input reference. The source must preserve the same causal access structure. More generally $\epsilon$ can be the complete interface strategy-distance bound including imperfect source ports and any calibration flags; individual channel half-diamond distances add by telescoping through a fixed finite schedule. A parameter-error claim without a response-norm certificate is not $\epsilon$.

Every admitted actual score lies in[0,256]. For any fixed receiver strategy, trace-distance/data-processing and boundedness change expected loss by at most 256 $\epsilon$. This is uniform over strategies, so the actual lower-floor optimal risk is at least a−256 $\epsilon$, whereas the nominated copy predictor has risk at most 256 $\epsilon$. No continuity of an optimized feasible set is assumed: the interface and admitted reports are unchanged, and every strategy is compared with itself.

If an additional nonnegative score-meter map differs from the intended squared loss by at most $\eta$ on every admitted record, the total risk perturbation is at most 256 epsilon+eta: first compare the bounded ideal score under the two laws, then compare the score maps under the actual law. This also covers an independently certified uniform expected score bias $\eta$ for every receiver strategy. It is separate from channel errors already included in $\epsilon$ and must not be counted twice.

Put $r=256\epsilon+\eta$. When $2r<a$, the registered PP gap is at least

$$
\begin{aligned}
1/(1+r)-1/(1+a-r) \\
&=(a-2r)/[(1+r)(1+a-r)] >0.
\end{aligned}
$$

Thus $256\epsilon+\eta<9/1120$ suffices. For an exact score meter, $\epsilon<9/286720$ suffices to preserve a strictly positive performance gap. This bound is derived from the actual task margin; it is not a calibrated error value or a tariff chosen to force shell selection. A source with larger certified error must retain the resulting weaker comparison.

For a preparation table $p$ and realized table $\tilde{p}$, total variation $\lVert p-\tilde{p}\rVert_1/2\le\epsilon$ directly supplies the condition after the supplier dephasing. For coherent preparation vectors, pure-state trace distance $\le\lVert\psi-\tilde{\psi}\rVert_2$ supplies a sufficient condition. Errors in the receiver copies, commitment pinching, lookups or timing must also be included; a perfect probability table alone does not certify the full interface.

The risk premises are properties of the supplied ideal tables. The error estimate neither supplies their geometric derivation nor an operating calibration or tariff.

### <a id="theorem-c6cp17a-task-local-75-bit-predictive-host"></a>Theorem C.6c.P17a — Task-Local 75-Bit Predictive Host

### H.1 Source-exact scope

This section is a self-contained restatement of the admitted finite host needed by this certificate. It is an **ideal, finitely driven Hilbert/instrument branch with implementation error exactly zero**. Its source, controller, compilation, workspace, clock and retained records are owned resources. It proves neither noisy manufacture nor indefinite bounded-memory reuse. No heat/reset, PCE-minimality, cosmological-selection or complexity–capacity identification is asserted.

The host uses the following definitions and capability statements:

1. Definition A.0.1, not the similarly numbered theorem, requires an MPU network capable of the declared protocol's finite representation, simulation/reasoning, predicate evaluation, logical memory, Boolean processing and diagonal wrappers with its registered finite error. The QEC/selected-error-minimizer clauses are conditional on the protected route through Theorem A.0.2. This section uses ideal finite instruments directly; it does not invoke Theorem A.0.6 or infer QEC from a carrier dimension.
2. Theorem A.0.1 and Corollary A.0.1 provide uniform bounded Turing simulation under composition, memory, uniform specification and finite-arithmetic coding. All four premises are implemented below. No one finite machine is assigned unbounded memory.
3. Definition M.10.1 requires Effective Operational Property R, an internal model of the receiver's own states, predictions, accuracy and dynamics, and the strict inequality \(C_{\mathrm{agg}}(S)>C_{op}\). On the perspectival branch its state type is \((\rho,s)\), not a vector assigned to a mixed state.
4. §2.4.1 and Theorem 2.4.1a use original binary program length, a fixed universal machine, fixed reference microstate and a decreasing independently defined physical-program hierarchy. On the common-realizer domain the complexity is the shortest common-program length. It is not register count or \(\log_2\dim\mathcal H\).
5. Definition 13 defines the task-specific infimum over physically admitted, domain-defined full adaptive loops beating the registered matched random baseline by a positive margin. **Definition 23** calls an attained qualifying minimum an MPU. **Definition 29** sets \(C_{\mathrm{agg}}=C_P(\mu_{\mathrm{agg}})\) for the interacting MPU aggregate.
6. Definitions 24, 26 and 27 in §7 supply density-operator state typing, reset-free unitary transport and normalized registered interaction instruments. Arming is explicit branch data here. Theorem 29's energetic interpretation and Theorem 31's reset bounds are unused.

These statements leave the selected protocol law, its live prohibited-request challenge, prediction map and continuum approximation to the protocol sections of this certificate. The present host is their explicit finite execution substrate, not a prohibition-membership oracle.

### H.2 The actual adaptive cell and its task

Freeze the following physical cell and calibration task before choosing the prohibited-candidate examples. A ready cell has six data qubits \((m,y,d,w,f_0,f_1)\), a 66-bit immutable local ROM and a three-bit cursor: **75 carrier bits total**. The payload \(w\) is the only cell bit exposed to aggregate computation. The other five data bits, ROM and cursor form an insulated adaptive core. All mutable bits start zero; the ROM is loaded explicitly.

The owned environmental interface supplies a binary Markov process
\[
X_0=0,\qquad X_{t+1}=X_t\mathbin{\mathrm{XOR}}F_{t+1},
\qquad F_t=A_t\land B_t,
\]
where the four fair bits \(A_1,B_1,A_2,B_2\) are mutually independent and independent of receiver inputs. Thus the flip probability is exactly \(1/4\). The task window includes a forecast of \(X_1\), its verification, an outcome-conditioned update, and a retained forecast of \(X_2\) scored after that update. The comparator is the same task/window with the registered fair-chance distribution forecast \(q_{\mathrm{random}}=1/2\); it is not an unspecified optimal predictor.

The ROM consists of the following six CNOT descriptors:
\[
(0,4),(6,1),(0,2),(1,2),(2,0),(0,5),
\]
where addresses 0 through 5 mean the six named data bits and address 6 is the supplied basis outcome \(X_1\). A descriptor is `01 || src[3] || dst[3] || 000`, so each has 11 bits. These six words have exactly 16 ones: loading the ROM requires 16 X writes. After the respective CNOTs, X is applied to cursor bits 0,1,0,2,0,1. The cursor therefore follows the Gray sequence \(0,1,3,2,6,7,5\). These are six actual clock operations, not free control progression.

The six CNOTs have the following meanings:

- \(m\to f_0\) retains the first forecast \(q_0=(1+2f_0)/4\).
- \(X_1\to y\) is actual outcome ingress.
- \(m\to d\), then \(y\to d\), compute discrepancy \(d=m_{\mathrm{old}}\oplus X_1\).
- \(d\to m\) changes the model to \(m=X_1\).
- \(m\to f_1\) retains the next forecast \(q_1=(1+2f_1)/4\).

The physical schedule freezes \(f_0\) first, then consumes the first fresh source pair and computes \(X_1=A_1\land B_1\) into port 6, executes ingress/verification/update and freezes \(f_1\), and only then consumes the second fresh pair to generate \(X_2\). Thus both forecasts genuinely precede their scored outcomes. The source ANDs and XORs are the explicit Toffoli/CNOT primitives below. Exhaustive checker enumeration over coin strings is an exact sum over these measurement branches; it is not an admission of presampled full physical starting states.

No record is erased: \(m_{\mathrm{old}}=m\oplus d\), \(y=X_1\), and both forecasts remain available. The local task uses six CNOTs and six cursor X gates. Its source, terminal scoring/readout and any extra copies are separate owned resources in H.8.

Conditionally on \(X_1=x\), the actual next-outcome law is Bernoulli with parameter \((1+2x)/4\), hence
\[
\mathbb E[(q_1-X_2)^2\mid X_1=x]=3/16,
\qquad \mathbb E[(1/2-X_2)^2]=1/4.
\]
Use Definition 13's dimensionless accuracy \(A=1-\mathbb E[(q-X)^2]\) and margin \(\epsilon_{acc}=1/32\). The strict gain is \(1/16>1/32\). The cell has actual state distinction, pre-outcome predictive generation, discrepancy verification and an outcome-conditioned model transition. A forecast-only device would fail the loop predicate regardless of score. Removing the \(d\to m\) gate breaks both the update relation and the gain on this declared initial law: its second-prediction risk becomes \(1/4\). This defect is exercised below.

At least one aggregate core executes this very calibration task. Consequently the cell and aggregate use the same Definition-13 task, baseline, window and margin. The additional selected request task does not silently replace the definition of \(C_{op}\).

### H.3 Fixed typed presentation and the optimal prefix machine

First fix an effective finite binary syntax for finite circuit/instrument descriptors: carrier locations, basis-initialization bits, ports, retained buffers, schedule, allowed instructions, source law, clock and controller ownership. Invalid syntax, nonexistent addresses, invalid port types, bad gate support and violations of fresh-target contracts are rejected. The syntax is the ordinary finite tuple/list serialization using length-delimited binary words; one can take
\[
\operatorname{enc}(w)=1^{|w|}0w
\]
for every variable binary field, with finite opcode/type tags. A count field precedes every finite list; integers have their canonical binary representation. No field calls the object an MPU or tests its complexity. A well-typed descriptor constructs the declared finite Hilbert carrier and the explicit ideal operations in H.4. Other output words have a nonphysical type and do not qualify for Definition 13.

Let \(V\) be the following partial computable prefix interpreter:

- `0 enc(w)` prints \(w\);
- `1 enc(e) enc(x)` simulates the finite TM transition-table description \(e\) on finite input \(x\), printing its output if it halts.

Reject incomplete fields, trailing junk, invalid transition tables, and unused branch strings. Each domain is prefix-free: complete `enc` fields are prefix-free, concatenations have fixed field count, and the initial tags distinguish the branches. There is no valid \(V\)-program of length zero or one. \(V\) is a computability-universal interpreter; **optimality is not inferred from that fact**.

For optimality, fix independently of all candidate examples an effective enumeration \(E_e\) of machines enumerating pairs \((q,y)\) of finite binary words in deterministic order. In each enumerator, accept a pair only when its input \(q\) is prefix-incomparable with every previously accepted input; ignore repeats and conflicts. Let \(D_e(q)\) be the output on its accepted pair, undefined otherwise. The acceptance filter is computable at each finite enumeration stage. Thus every \(D_e\) is a partial computable prefix machine. If \(E_e\) enumerates the graph of a partial computable prefix machine \(M\), no distinct graph input conflicts, so \(D_e=M\). Such a graph enumerator exists effectively by dovetailing all executions of \(M\).

Define
\[
W(1^e0q)=D_e(q).
\]
The words \(1^e0\) are pairwise prefix-incomparable. Inside any fixed tag, \(\operatorname{dom}D_e\) is prefix-free. Hence \(W\) is prefix-free. For every partial computable prefix machine \(M\), its graph enumerator supplies an index \(e\) with
\[
K_W(y)\le K_M(y)+e+1.
\]
This is precisely optimal prefix universality; the constant depends on the machine, not its input or output.

Let \(w_0\) be the fixed descriptor of H.2's ready physical cell. Define the raw output machine by the three branches
\[
U_*(0)=w_0,\qquad U_*(10q)=V(q),\qquad U_*(1100q)=W(q),
\]
and leave it undefined elsewhere. Applying the same typed physical decoder to its outputs gives the physical shorthand \(U_*(0)=\mu_0\). The tags `0`, `10`, `1100` are prefix-incomparable, so \(U_*\) is prefix-free and
\[
K_{U_*}(y)\le 4+K_W(y).
\]
Thus it is optimal, including on all raw words; restricting which outputs count as physical cannot admit a malformed word into the qualifying physical class.

Freeze \(\mu_{\mathrm{ref}}\) as the blank finite-source preparation and set \(\mathcal L_n=\mathcal L\) for every \(n\), where \(\mathcal L\) is the set of programs whose output is a well-typed descriptor under the above physical law/decoder. This is a constant decreasing hierarchy, specified without reference to \(C_P,C_{op}\), MPU status or any desired semantic classification. Membership need not be decided by the physical receiver: submitted constructors have finite execution and type-checking traces. This constructs an anchored presentation-relative branch. The general cosmological hierarchy still requires its own structural construction.

For any assembled finite receiver descriptor \(w_S\), the unchanged literal constructor is
\[
P_S=10\,0\,\operatorname{enc}(w_S),\qquad |P_S|=2|w_S|+4.
\]
It emits the exact typed descriptor; the decoder then installs and executes its registered law. This is a common full-constraint realizer at every level of the constant hierarchy. The descriptor's algorithmic construction, installation input and transcript are charged in the experiment ledger; \(w_S\) need not recursively contain its own external installation archive.

There is no empty program. Among the fifteen binary words of lengths 0 through 3, the **only defined physical output is `0`**, yielding \(\mu_0\): `10q` needs at least two further bits for \(V\), and the optimal tag already has length four. The qualifying adaptive cell therefore has \(C_P(\mu_0)=C_{op}=1\), attained as required by Definition 23. The assembled receiver has at least two cells and a distinct typed aggregate carrier/interface, so it is not \(\mu_0\). Consequently
\[
\boxed{\quad 4\le C_{\mathrm{agg}}(S)=C_P(\mu_S)\le 2|w_S|+4<\infty,
\qquad C_{\mathrm{agg}}(S)>C_{op}=1.\quad}
\]
The lower bound is the exhaustive short-program exclusion, not a capacity argument. Every ready cell is an instance of the same minimum physical module; their payloads interact while their qualifying cores remain insulated. Later interacting states need not themselves remain minimum-complexity ready states. No three-bit horizon or complexity–capacity bridge is used or contradicted.

### H.4 Actual finite gates, instruments and physical interface

For each needed payload/control bit allocate a 75-bit cell. If there are \(N\) such bits, take \(n=\max(2,N)\) cells and Hilbert space \((\mathbb C^{2^{75}})^{\otimes n}\). The addressed payload supports the basis gates
\[
X:z\mapsto z\oplus1,\quad
\mathrm{CNOT}:(a,z)\mapsto(a,z\oplus a),\quad
\mathrm{Toffoli}:(a,b,z)\mapsto(a,b,z\oplus ab).
\]
They are permutation matrices, exact unitaries and Hermitian involutions. Copying into fresh zero with CNOT preserves the source and is restricted to the registered basis interface; it is not arbitrary-state cloning. NOT into fresh uses CNOT then X. AND into fresh uses Toffoli. OR into fresh uses two CNOTs and a Toffoli, because \(a\lor b=a\oplus b\oplus ab\). An optional Hadamard source gate \(H=2^{-1/2}\left(\begin{smallmatrix}1&1\\1&-1\end{smallmatrix}\right)\) is also a Hermitian involution.

For every such gate \(U\), fix a positive actuation duration \(\tau_g\) and the finite generator
\[
H_U=\frac{\pi\hbar}{2\tau_g}(I-U).
\]
The eigenvalues of \(H_U\) are 0 and \(\pi\hbar/\tau_g\); hence it is bounded and self-adjoint on its finite support, and \(e^{-iH_U\tau_g/\hbar}=U\) exactly. The declared drive is a finite piecewise-constant schedule of these pulses. A scalar Hamiltonian shift changes only an overall phase and leaves every density-operator response and measurement law invariant. No baseline-energy or heat conclusion is inferred from this finite generator.

A basis measurement on nominated bit/register \(R\) uses \(\mathcal I_z(\rho)=P_z\rho P_z\). Orthogonal projectors sum to identity, so the instrument is completely positive and its sum is trace preserving. Each outcome is written to its fresh retained record. Equivalently the outcome-retaining map is \(\rho\mapsto\sum_z P_z\rho P_z\otimes|z\rangle\langle z|_{\mathrm{rec}}\); every new record has a counted fresh carrier. On a basis state the operation is probability-one correct and nondemolition.

A fair source can use an H pulse on a fresh zero followed by this instrument, retaining both source and recorded outcome. Alternatively one explicitly registered fair-source instrument has Kraus operators
\[
K_i=2^{-1/2}X_C^i X_R^i,\qquad i=0,1,
\]
on a fresh source pair initially \(|0,0\rangle\); it yields \(|i,i\rangle\) and outcome \(i\). Since \(\sum_iK_i^\dagger K_i=I\), it is CP/normalized on the entire carrier. Its initial-zero contract makes both bits faithful records of the emitted value. Independent fresh source pairs with product source law supply independent coins. For the selected protocol use the H/readout route specifically: unused future source factors are pristine, mutually independent \( |+\rangle \) qubits, independent of the retained past and input, and are measured only when consumed. A coin that is already sampled and fixed in the complete initial state is not in this fresh-factor domain. This distinction is essential to any pointwise lumpability assertion on full physical states. Both alternatives have specified finite primitive/instrument durations and counted records. Intentional source randomness is separate from implementation error. An H-plus-readout implementation counts both events; a source H applied before the initial protocol readout is a preparation pulse counted in \(G_{\mathrm{prep}}\), while its eventual measurement is counted in the run. No H is charged twice. The direct instrument counts one event and its two carriers.

The physical input alphabet consists of finite declared-length binary records at owned basis ports. A finite parser/type predicate is compiled from the syntax. Out-of-range program encodings and malformed requests therefore have a finite explicit status path; there is no implicit acceptance of arbitrary analog values. The protocol section specifies the actual candidate encoder and input-dependent actuator operations. The host supplies gates for these operations rather than declaring a sampled Markov row to be a primitive.

Fix one physical perspective \(s_0\), its computational ONB and the identity perspective transition kernel \(G(s'\mid s_0,i,N,\Delta t)=\mathbf1_{s'=s_0}\). The complete physical state is \((\rho,s_0)\), with \(\rho\) generally a mixture if coin outcomes are not conditioned upon. These are direct instances of Definitions 24 and 27 on the registered arming schedule. Conditional basis histories may be written as pure vectors. No context-capacity-triggered actualization mechanism is assumed.

### H.5 Uniform variable-program bounded simulation

Fix a TM description \(e\), input-length bound \(r\), state count \(k\), alphabet count \(a\), and time bound \(T\). Use a tape of \(h=r+2T+1\) cells, with the initial input starting \(T\) cells from the left. A configuration has width
\[
\ell=\lceil\log_2k\rceil+\lceil\log_2h\rceil+h\lceil\log_2a\rceil.
\]
Assume \(k,a\ge2\) and include blank and halt conventions. The next-step map decodes state/head/scanned symbol, consults the finite transition table, writes that symbol, changes state and moves the head. Extend it to a total map on \(\{0,1\}^{\ell}\) by self-loops on invalid encodings, halting states and attempted exits. A valid first-\(T\)-step computation never exits the allocated segment. This map is generated from transition semantics, not from desired final answers.

For a **single programmable receiver at each resource bound**, also freeze a program-record width \(B_{\mathrm{prg}}\), maximum state/alphabet/tape counts and \(T\). A fixed parser accepts canonical shorter records with declared length and zero padding. It computes the total transition function \(F(e,c)\) of width \(q=B_{\mathrm{prg}}+\ell\), returning the next \(\ell\)-bit configuration. Invalid programs/states self-loop with retained validity information. The program bits remain unchanged and feed every layer. The resulting circuit is generated once from the bounds and is not rewired for different input programs.

Here is a uniform fresh-wire DNF compiler for any such \(q\)-input, \(\ell\)-output map. Enumerate the \(2^q\) inputs, execute one parser/transition step for each, and enumerate the minterms of each output. Make \(q\) complement wires using CNOT+X. A minterm uses a copied first literal and \(q-1\) Toffolis into fresh wires: exactly \(q\) gates and \(q\) fresh wires. Combine \(a_j>0\) minterms with \(a_j-1\) fresh ORs, each three gates and one wire. An output with no minterms is a fresh zero. With \(A=\sum_ja_j\) and \(b=|\{j:a_j>0\}|\), this gives exactly
\[
G_{\mathrm{layer}}=2q+qA+3(A-b),\qquad
W_{\mathrm{layer}}=q+qA+(A-b)+(\ell-b).
\]
Since \(A\le\ell2^q\), the bounds are finite and effective. Compose \(T\) layers without reclaiming any wire. The full variable-program simulation uses
\[
G_{cap}=TG_{\mathrm{layer}},\qquad
B_{cap}=B_{\mathrm{prg}}+\ell+TW_{\mathrm{layer}},
\]
plus any final predicate/wrapper circuit and its records. Induction on the layer number proves exactness of every admitted bounded computation. A fixed finite instance handles its fixed bounds; the uniform family handles every finite choice of bounds. Exponential cost is charged and no efficiency claim is made.

All finite strings have the injective arithmetic code \(\operatorname{code}(w)=2^{|w|}+\sum_iw_i2^i\); finite tuple pairing codes programs, inputs, circuits and traces. Take PA as the representational arithmetic for these finite relations. Verification of an initial configuration, each transition, and a final predicate is a finite conjunction of Boolean conditions, compilable by the same method. The retained wires supply logical memory; gate composition supplies Boolean composition; the parser and DNF algorithm supply uniform specification. This instantiates the actual Theorem A.0.1/Corollary A.0.1 route and all finite capability clauses of Definition A.0.1 used here, at zero error. It does not assert that arbitrary proof searches terminate or that infinite PA computations fit finite hardware.

### H.6 Finite diagonal wrapper and its exact scope

For a nominated predictor program \(e\) and bound \(T\), use a finite wrapper template with embedded data \((e,T)\). Its serialization \(d(e,T)\) contains that template and parameter tuple; the template can reconstruct this same finite serialization using the fixed serializer, load it as predictor input, simulate \(e\) for \(T\) steps, and test whether its binary report appeared. If so, retain the report and append its complement; otherwise retain a timeout status. This is a syntactic finite self-code constructor, not a halting detector. Compile its bounded simulation and report predicate by H.5. The complement alone costs two gates and one fresh bit.

A four-program executable witness uses opcodes COPY, NOT, ZERO, ONE, each reading its first input bit, writing the indicated bit/function, moving right and halting. A predictor code is `0 || e`; its wrapper code is `1 || e`. Feed the actual three-bit wrapper code into the predictor. Two padded transitions retain report and complement. These codes are **internal program data**, not physical constructor inputs to \(U_*\); for example, internal word `111` need not be a valid physical program.

The checker exhausts every six-bit configuration for each opcode, then compiles one immutable eight-input/six-output circuit with two variable program bits and verifies all 256 inputs. That circuit has 9,502 gates, 7,778 fresh bits and 7,786 total bits. Its minterm counts are \((192,128,160,128,128,128)\). It also tests all four self-code wrappers. The largest tested specialized wrapper has 4,022 gates and 3,143 configuration/workspace bits, plus two retained program bits. These are data-path counts; H.8 adds control, source, initialization and cell overhead.

This formal wrapper is **not by itself the selected physical live challenge**. That challenge must additionally route the frozen prediction bits to independently nominated response actuators before commit and then independently read the actual operations. The selected protocol supplies that wiring. A later observation of a transcript is not substituted for the required read-before-commit response.

### H.7 Operational self-model and complete-state types

The adaptive core has a literal finite model of its own named registers: memory/forecast/discrepancy fields \((m,f_0,f_1,d)\), its current cursor and immutable transition program. Their register types and update equations are stored by the finite descriptor. The prediction fields predate the corresponding outcomes; the discrepancy is computed from actual ingress; the model state changes conditionally on that discrepancy. If an independently readable core-state snapshot is requested, CNOT-copy the nominated basis fields to a fresh snapshot and charge every bit/gate. Its symbolic density representation is the finite initial-law record plus exact circuit/source description; conditional realized basis data and unconditional mixed predictions remain distinct.

For the assembled receiver, the protocol supplies explicit fresh/retained fields for: actual current self-state estimate; proposed/candidate target; request/program and validity; pending/accepted/rejected/aborted/completed status; prediction records; actual receiver actuator state; independent observed response; score/verification record; and law/program/source/controller/archive data. Self-model state is not identified with a candidate label or a request asking for impossible completed integration. These records, H.5's capability, and H.3's strict complexity inequality populate Definition M.10.1 on the finite declared branch. The parameter/Fisher chart, admissibility gauge and metric evaluation points belong to the separate selected-model registration, rather than being selected by this host's program coding.

The **complete physical state** retains all code, actual input records, source outcomes, failed attempts, intermediate work wires, controller/clock state and archives. Only a named mathematical decoder is allowed to take a response marginal. Equality of that marginal never implies equality of complete states. Growing finite-horizon archives preclude any automatic assertion of a stationary complete machine state; a stationary response subsystem requires the explicit intertwining proof given for the selected kernel. Fixed-horizon fresh banks are permitted and counted, with no claim of indefinite reuse at fixed resources.

### H.8 Controller, positive clock and complete finite resource interface

The following ledger applies to any concatenated selected-protocol/capability schedule after its compiler emits the concrete instruction list. It keeps the selected protocol costs symbolic until that list is supplied, without assuming any of its operations are free.

Let \(B_{\mathrm{prot}}\) include all selected-protocol input, current-state, candidate, prediction, actuator, response, validity/status, probability, source, scratch, proof, archive and retained output bits. Let \(G_{\mathrm{prot}}\) count all its unitary primitives, including every ingress/copy/comparison/source H and any explicit loading performed during execution. Let \(J_{\mathrm{coin}}\) count direct fair-source instruments and \(J_{\mathrm{read}}\) count readout instruments; an H-plus-readout coin counts its H in \(G_{\mathrm{prot}}\) and its readout in \(J_{\mathrm{read}}\), not also in \(J_{\mathrm{coin}}\). Add the variable-program/wrapper counts \((B_{cap},G_{cap})\), and separately counted calibration source/scoring bits and gates. Unused but required ready banks still count in \(B\).

Here is one fully populated calibration instance. Reserve 30 logical address entries: the active core's six data and three cursor fields, four pristine source qubits, four distinct source-outcome records, fresh \(F_1,F_2,X_2\) bits, two independent terminal observation records for \(f_1,X_2\), and two four-bit score numerators. Generate \(F_i=A_i\land B_i\) with two Toffolis and \(X_2=F_1\oplus F_2\) with two CNOTs. The actual Brier numerator is \(1+8(f_1\oplus X_2)\): one X writes its low bit and two CNOTs from the independently observed fields write bit 3. The fair-null numerator is 4, requiring one X. Hence this explicit calibration instance has
\[
B_{cal}=30,\quad G_{cal}=12+2+2+3+1=20,\quad
J_{read,cal}=4+2=6,\quad G_{prep,cal}=4\text{ Hadamards}.
\]
There are no direct-coin instruments in this calibration instance. All four source qubits are measured only after the corresponding prediction freezes. Its source law and score calculation therefore fit the actual declared causal schedule. The core fields were already present in one cell; the 30-entry count intentionally reserves spare payload capacity for them rather than understating address or carrier requirements. The interface's \(J_{\mathrm{read}}\) includes these six measurements in addition to the selected protocol's readouts, and \(G_{\mathrm{prep}}\) includes these four H pulses in addition to its preparations.

An admissible conservative assembly interface is
\[
B=B_{\mathrm{prot}}+B_{cap}+B_{\mathrm{meta}}+B_{cal},\qquad
G=G_{\mathrm{prot}}+G_{cap}+G_{cal},\qquad E=G+J_{\mathrm{coin}}+J_{\mathrm{read}},
\]
where \(B_{\mathrm{meta}}\) contains every finite program/parameter/compiled-list record not already included and \(B_{cal}\), \(G_{cal}\) are read directly from the chosen calibration circuit and source/scoring apparatus. The local core's 12 operations are included in \(G_{cal}\). For global instruction addressing, include its named core fields among the \(B\) address entries, even though their physical bits already occur in the 75-bit cell overhead; allocating a spare payload cell for each such entry makes the carrier formula below a conservative upper bound. The fixed address map routes those entries to their actual core fields, and every extra spare cell is still counted. Boundary ownership may use separate appliances; then each appliance gets its own cell/control ledger and the common experiment cost is the sum. No external appliance is silently absorbed into the receiver's self-state.

To drive all \(E\) computational/source/readout events, allocate one-hot clock bits \(c_0,\ldots,c_E\), initialize \(c_0=1\), and after event \(j\) apply X to \(c_j\) then X to \(c_{j+1}\). There are exactly \(2E\) clock gates and \(3E\) complete driven events. Each stage begins and ends with one clock bit high. These are reversible X updates, not erased timestamps. All data-path branch choices are implemented by the circuit's controls or retained instruments; branch-dependent padding uses fixed idle slots so that a public terminal clock is well defined.

Use a three-bit global opcode for X/CNOT/Toffoli/H/COIN/READ/IDLE, with three padded addresses per event. With
\[
a_{addr}=\max\{1,\lceil\log_2(B+E+1)\rceil\},
\]
the complete immutable global ROM has exactly
\[
B_{ROM}=3E(3+3a_{addr}),\qquad B_{\mathrm{control}}=E+1+B_{ROM}
\]
bits. The larger three-bit global opcode is distinct from the unchanged two-bit local-cell descriptor. The immutable ROM need not be addressed by the computation's data ports; its fixed read-and-drive source presents its \(3E\) words in their registered order. It owns exactly \(3E\) delivery events, rather than an uncounted external learning algorithm. The physical source is a finite drive sequence on the declared branch, not an autonomous perpetual mechanism.

The total carrier is at most
\[
N_{\mathrm{cell}}=\max(2,B+B_{\mathrm{control}}),\qquad B_{\mathrm{carrier}}=75N_{\mathrm{cell}}
\]
if all global data/control bits occupy cell payloads. This includes 74 insulated/core bits per payload plus every cell's own ROM/cursor. Any separately located source or apparatus carrier is added explicitly. Cell-ROM factory loading costs \(16N_{\mathrm{cell}}\) X pulses, global-ROM loading costs its exact Hamming weight, other ready basis-input loading costs its exact Hamming weight, and clock initialization costs one X. Preparing \(N_+\) future pristine source factors costs exactly \(N_+\) Hadamard pulses, with separate preparation slots; the number of zero-prepared source and later result-record bits is also charged. Fresh zero preparation of all allocated carriers is an owned initial resource, not a free recycled bath. The installation descriptor and constructor-program input are retained in a separate finite fabrication archive; their lengths and the compiler's storage/time are added to the preparation resource vector rather than recursively placed inside their own descriptor.

Register positive durations \(\tau_{\mathrm{delivery}},\tau_g,\tau_{inst}>0\). Pad every event slot to
\[
\tau=\tau_{\mathrm{delivery}}+\max\{\tau_g,\tau_{inst}\}>0.
\]
Then the complete run has duration \(3E\tau\), with factory/preparation and code-generation durations additional and finite. This is a chosen physical clock convention. It does not identify one simulation transition, one Kleene stage, or one gate count with elapsed time absent this schedule. A fixed endpoint readout occurs only after its nominated readout event and clock updates. The Hamiltonian matrices certify gate action over the registered positive actuation interval, without a speed-limit or energetic claim.

The compiler is a finitely specified terminating algorithm at every resource bound. Record its input, output description, complete transition count \(T_{\mathrm{comp}}\), and used workspace \(B_{\mathrm{comp}}\). These are finite effectively measurable integers; a coarse analytic bound follows by enumerating \(2^q\) transition inputs per layer and emitting the displayed finite gate list. If its execution is required on the same ideal substrate, compile that finite trace using H.5 and add the resulting finite gate/carrier counts to the preparation ledger. This ends at the explicitly admitted primitive physical operations; it does not assume manufacturing work or infinite precision for free.

The complete resource is the finite vector
\[
(B_{\mathrm{carrier}},B_{\mathrm{comp}},|P_S|,|w_S|,B_{\mathrm{archive}}^{\mathrm{fab}},
T_{\mathrm{comp}},G,G_{\mathrm{prep}},2E,J_{\mathrm{coin}},J_{\mathrm{read}},3E,
N_{zero-prep},N_{X-prep},3E\tau,T_{\mathrm{prep}}),
\]
with the executed event list resolving any aliases. Retained bit-time is bounded by the total allocated carrier/archive count times the finite total preparation/run window. Any further mutable driver record must be added; this branch uses precisely the fixed finite source/ROM/clock specification stated above. No reset/renewal term is omitted by assuming cyclic reuse: there is no such reuse claim.

<a id="theorem-c6c3-directed-d_4-kernels-and-the-exact-drift-criterion"></a>**Theorem C.6c.3 (Directed $D_4$ Kernels and the Exact Drift Criterion).** Let $S=\Xi_{D_4}$ and give every root edge of $D_4$ the cost $w>0$. For every finitely supported probability law $\nu$ on $D_4$, every $\alpha\in[0,1]$ and all distinct $x,y$, the translated lazy laws
$$
P_\alpha(x)=\alpha\delta_x+(1-\alpha)\tau_x\nu
$$
satisfy $W_1^d(P_\alpha(x),P_\alpha(y))=d(x,y)$, and hence have zero Ollivier curvature. Symmetry and zero drift are unnecessary for this conclusion.

For strictly positive directed rates $a_s>0$, put
$$
Lf(x)=\sum_{s\in S}a_s[f(x+s)-f(x)],\qquad b=\sum_sa_ss.
$$
Define $\Gamma,\Gamma_2$ by this generator. For every radius-two function,
$$
\Gamma_2(f)(x)=\frac14\sum_{s,t\in S}a_sa_t[\Delta_s\Delta_tf(x)]^2.
\tag{C.6c.3.1}
$$
A finite $N>0$ with $\Gamma_2\ge(Lf)^2/N$ on the whole radius-two function space exists exactly when $b=0$. In that case the sharp value is
$$
N_*(a)=a^{\mathsf T}Q(a)^+a\ge4,
\tag{C.6c.3.2}
$$
where $Q^+$ is the Moore–Penrose inverse and the following construction defines $Q$ exactly. Index the standard basis of $\mathbb R^{24}$ by $S$. For $z\in S+S$, set $I_z=\{(s,t):s+t=z\}$ and $B_{st}=e_s+e_t$. For $z\in S\cup\{0\}$ put $c_z=e_z$ when $z\in S$ and $c_0=0$. Its contribution to $4Q$ is
$$
\sum_{I_z}a_sa_t(c_z-B_{st})(c_z-B_{st})^{\mathsf T}.
$$
For each remaining $z$, put $W_z=\sum_{I_z}a_sa_t$ and $h_z=\sum_{I_z}a_sa_tB_{st}$; its contribution is
$$
\sum_{I_z}a_sa_tB_{st}B_{st}^{\mathsf T}-\frac{h_zh_z^{\mathsf T}}{W_z}.
\tag{C.6c.3.3}
$$
The entries are rational functions of the rates, and are rational numbers for rational rates. For symmetric rates $N_*\le24$. Common positive scaling of the rates leaves $N_*$ unchanged; idleness $\alpha=1$ gives the separate zero generator.

*Proof.* Theorem C.6c.1 identifies $d(x,y)$ with the restriction of the norm $w\max(\|y-x\|_\infty,\|y-x\|_1/2)$. Translation couples the two laws at cost $d(x,y)$. A supporting dual-unit linear functional $\ell$ at $y-x$ is $1$-Lipschitz and has expectation difference $\ell(y-x)=d(x,y)$, because the offset laws agree. This proves equality.

The identity $\Gamma(f)=\frac12\sum_sa_s(\Delta_sf)^2$, the product difference identity $\Delta_t(g^2)=2g\Delta_tg+(\Delta_tg)^2$, and commutation of translations cancel the cross terms in $\frac12L\Gamma(f)-\Gamma(f,Lf)$, giving (C.6c.3.1). Set $f(0)=0$ and $u_s=f(s)$. Every free outer value $f(z)$ occurs precisely in $I_z$. Completing its square gives the minimizing value $h_z^{\mathsf T}u/W_z$ and (C.6c.3.3). Thus
$$
\inf_{\text{outer values}}\Gamma_2(f)(0)=u^{\mathsf T}Qu,\qquad Lf(0)=a^{\mathsf T}u.
$$
Since all rates are positive, a zero of this sum of squares obeys $u_{-s}=-u_s$ and $u_{s+t}=u_s+u_t$ whenever $s,t,s+t$ are roots. Choose simple roots $\alpha_1=e_1-e_2$, $\alpha_2=e_2-e_3$, $\alpha_3=e_3-e_4$, $\alpha_4=e_3+e_4$. Besides these, the positive roots are
$$
\alpha_1+\alpha_2,\ \alpha_2+\alpha_3,\ \alpha_2+\alpha_4,\
\alpha_1+\alpha_2+\alpha_3,\ \alpha_1+\alpha_2+\alpha_4,\
\alpha_2+\alpha_3+\alpha_4,\ \alpha_1+\alpha_2+\alpha_3+\alpha_4,\
\alpha_1+2\alpha_2+\alpha_3+\alpha_4.
$$
Each is a sum of earlier roots; for the final three use $(\alpha_2+\alpha_3)+\alpha_4$, then addition of $\alpha_1$, then addition of $\alpha_2$. The simple-root values therefore determine $u_s=v\cdot s$. Conversely this assignment extends affinely and makes every second difference zero. Hence $\ker Q=\{(v\cdot s)_s:v\in\mathbb R^4\}$ and $\operatorname{rank}Q=20$.

The inequality $u^{\mathsf T}Qu\ge(a^{\mathsf T}u)^2/N$ is possible exactly when $a$ annihilates that kernel, equivalently $b=0$. On its orthogonal complement Cauchy–Schwarz gives the sharp constant $a^{\mathsf T}Q^+a$, attained at $u=Q^+a$ with the minimizing outer extension. For the lower bound write $B=\sum_sa_sss^{\mathsf T}>0$ and test $f(z)=z^{\mathsf T}B^{-1}z$. At zero, $Lf=4$ and (C.6c.3.1) gives $\Gamma_2=\operatorname{tr}[(B^{-1}B)^2]=4$, so $N_*\ge4$. For symmetric rates retain the ordered pairs $t=-s$ in (C.6c.3.1):
$$
\Gamma_2\ge\frac12\sum_{\{s,-s\}}a_s^2(u_s+u_{-s})^2.
$$
Cauchy–Schwarz on the twelve pairs gives $(Lf)^2\le24\Gamma_2$. Finally $Q(ta)=t^2Q(a)$ proves scaling invariance. ∎

The theorem classifies all positive directed root-rate templates on this fixed propagation metric. Theorem C.6c.3b, Proposition C.6c.3c and Theorems C.6c.3d–C.6c.3e extend the exact local test to finite spatially varying templates, identify the reversible-measure and retained-refinement conditions, and give an explicit metric–energy limit-transfer criterion. Theorem C.6c.1 continues to determine the fixed metric's polyhedral limit. The admitted kernel/metric census, source prices and total physical response map remain separate inputs.

<a id="definition-c6c3a-local-kernel-measure-and-propagation-datum"></a>**Definition C.6c.3a (Local Kernel, Measure and Propagation Datum).** A finite datum consists of a vertex set $V$, an undirected connected propagation graph, symmetric lengths $\ell_{xy}>0$ on its edges, rates $q_{xy}\ge0$ for distinct vertices supported on those edges, and masses $\mu_x>0$. Its generator, path distance and quadratic expression are
$$
Lf(x)=\sum_yq_{xy}(f(y)-f(x)),\qquad d=d_\ell,\qquad
\mathcal E(f)=\frac12\langle f,-Lf\rangle_\mu.
$$
The rates have units of inverse time, the lengths have length units and the masses have the declared reference-measure units. A symmetric Dirichlet realization of this generator uses $\mu_xq_{xy}=\mu_yq_{yx}$; its conductance is $c_{xy}=\mu_xq_{xy}$ and $\mathcal E(f)=\frac12\sum_{\{x,y\}}c_{xy}(f(y)-f(x))^2$. The discrete $\Gamma,\Gamma_2$ use $L$ as in Proposition C.3.3b. For (C.2), write $F_y=\exp[-\lambda_R I'(C_P(y))]>0$, $Z_x=\sum_yP^{(0)}_{xy}F_y$, and specify a clock $r_x\ge0$ before setting $q_{xy}=r_xP^{(0)}_{xy}F_y/Z_x$. A common one-step clock $\tau$ with idleness $\alpha$ gives $r_x=(1-\alpha)/\tau$; an absorbing row has $r_x=0$.

<a id="theorem-c6c3b-collision-preserving-radius-two-classification"></a>**Theorem C.6c.3b (Collision-Preserving Radius-Two Classification).** Fix a datum of Definition C.6c.3a and a vertex $x$ with nonzero exit rate, writing $d_y=\sum_zq_{yz}$ for every vertex $y$. Let $S_x=\{y:q_{xy}>0\}$ and let $O_x$ contain the vertices reached in two positive-rate steps that belong to neither $S_x$ nor $\{x\}$. Each vertex has one coordinate even when several two-step paths reach it. Put $f(x)=0$, index vectors by $S_x\cup O_x$, set $e_x=0$, and define
$$
a=\sum_{y\in S_x}q_{xy}e_y,\qquad
G=\frac12\sum_{y\in S_x}q_{xy}e_ye_y^{\mathsf T},
$$
$$
M=\frac12aa^{\mathsf T}
+\sum_{y\in S_x}\frac{q_{xy}(3d_y-d_x)}4e_ye_y^{\mathsf T}
+\sum_{y\in S_x,z}\!q_{xy}q_{yz}
\left[\frac14e_ze_z^{\mathsf T}
-\frac12(e_ye_z^{\mathsf T}+e_ze_y^{\mathsf T})\right].
\tag{C.6c.3b.1}
$$
Partition $M=\left(\begin{smallmatrix}A&B\\B^{\mathsf T}&D\end{smallmatrix}\right)$ into first and outer coordinates. Then $D$ is diagonal with
$$
D_{zz}=\frac14\sum_{y\in S_x}q_{xy}q_{yz}>0,
\qquad Q_x=A-BD^{-1}B^{\mathsf T},
\tag{C.6c.3b.2}
$$
where an empty outer block contributes zero. Write $a_1$ and $G_1$ for the first-coordinate restrictions. For $K\in\mathbb R$ and $0<N<\infty$, the full radius-two inequality $\Gamma_2\ge K\Gamma+(Lf)^2/N$ holds at $x$ exactly when
$$
Q_x-KG_1-\frac1N a_1a_1^{\mathsf T}\succeq0.
\tag{C.6c.3b.3}
$$
Equivalently, $T=Q_x-KG_1\succeq0$, $a_1\in\operatorname{ran}T$, and $N\ge a_1^{\mathsf T}T^+a_1$. For $N=\infty$ the condition is $T\succeq0$. At fixed $N$, with $1/\infty=0$, the largest curvature is
$$
K_x(N)=\lambda_{\min}\!\left[G_1^{-1/2}
\left(Q_x-\frac1N a_1a_1^{\mathsf T}\right)G_1^{-1/2}\right].
\tag{C.6c.3b.4}
$$
At a zero-exit vertex $Lf=\Gamma=\Gamma_2=0$, so every such inequality holds there. A finite graph satisfies the inequality exactly when every vertex passes its test. Rational rates give rational matrices; exact elimination or principal-minor signs decide each proposed $(K,N)$ when these constants are rational. Specified algebraic rates and constants are decided by real-algebraic sign tests. For a finite parameterized graph, (C.6c.3b.3), with its positive denominators cleared, gives a complete semialgebraic classification in the positive weights $F$, baseline entries and clocks.

For translation-invariant positive $D_4$ root rates, $Q_x$ is the matrix $Q(a)$ of Theorem C.6c.3. Its complete $K=0$ classification is therefore the accepted drift test $\sum_sa_ss=0$, followed by $N\ge a^{\mathsf T}Q(a)^+a$. Common clock rescaling $q\mapsto tq$, $t>0$, sends $K_x(N)$ to $tK_x(N)$ and leaves the sharp zero-curvature dimension unchanged.

The positive varying-stencil family $S_m$ of Theorem C.6c.4 has a Schur matrix obtained from the same collision buckets $s+t=z$ as (C.6c.3.3), now indexed by $S_m$. At every admitted $m$ and $\theta$, its kernel consists exactly of the four linear restrictions, and its full-function zero-curvature dimension is
$$
N_{*,m}(\theta)=a_n^{\mathsf T}Q_{S_m}(a_n)^+a_n,\qquad
4\le N_{*,m}(\theta)\le|S_m|.
\tag{C.6c.3b.5}
$$
The ratio is independent of the common $\delta^{-2}$ clock factor. Here $Q_{S_m}(a_n)$ denotes the Schur matrix; $Q_m$ in Theorem C.6c.4 remains its scalar moment normalization.

For the degree-three sequence of Theorem C.6c.5, choose a tree vertex at depth two. Its radius-two rate datum is a three-regular tree with common rate $R_n=k_n\delta^{-4}$ on every edge out of the center and its first neighbors. At that vertex,
$$
Q_x=\frac{R_n^2}{2}(\mathbf1\mathbf1^{\mathsf T}-I_3),\quad
G_1=\frac{R_n}{2}I_3,\quad a_1=R_n\mathbf1,
$$
$$
K_x(N)=R_n\min\{-1,\,2-6/N\},\qquad K_x(\infty)=-R_n.
\tag{C.6c.3b.6}
$$
Consequently that sequence has no full-function $\mathrm{CD}(K,N)$ lower bound with $K$ independent of $n$, even for $N=\infty$. The corrected-field metric/form construction retains its stated domain in Corollary C.6c.5a.

*Proof.* Direct substitution in the definitions gives
$$
\Gamma(f)(x)=\frac12\sum_yq_{xy}f(y)^2,
$$
$$
\Gamma_2(f)(x)=\frac14\sum_{y,z}q_{xy}q_{yz}f(z)^2
-\sum_{y,z}q_{xy}q_{yz}f(y)f(z)
+\frac14\sum_yq_{xy}(3d_y-d_x)f(y)^2
+\frac12\left(\sum_yq_{xy}f(y)\right)^2.
$$
Indeed, $\frac12L\Gamma$ contributes $\frac14\sum_{y,z}q_{xy}q_{yz}(f(z)-f(y))^2-\frac14d_x\sum_yq_{xy}f(y)^2$, while $-\Gamma(f,Lf)$ contributes $-\frac12\sum_{y,z}q_{xy}q_{yz}f(y)(f(z)-f(y))+\frac12(\sum_yq_{xy}f(y))^2$. Expansion yields the display and hence $\Gamma=f^{\mathsf T}Gf$, $\Gamma_2=f^{\mathsf T}Mf$, $Lf=a^{\mathsf T}f$.

An outer coordinate occurs quadratically only in the first double sum. Its diagonal is the positive number in (C.6c.3b.2); no two different outer coordinates multiply. Writing $f=(u,v)$, completing the square gives
$$
f^{\mathsf T}Mf=(v+D^{-1}B^{\mathsf T}u)^{\mathsf T}D
(v+D^{-1}B^{\mathsf T}u)+u^{\mathsf T}Q_xu.
$$
The other two terms of the curvature-dimension inequality depend on $u$ alone. Minimization over $v$ proves (C.6c.3b.3), with the minimizing extension $v=-D^{-1}B^{\mathsf T}u$.

For any real symmetric $T$, the condition $T-aa^{\mathsf T}/N\succeq0$ implies $T\succeq0$. Evaluating on $\ker T$ gives $a\perp\ker T$, equivalently $a\in\operatorname{ran}T$. On that range, set $w=T^{+1/2}a$. Cauchy--Schwarz gives $(a^{\mathsf T}u)^2\le\|w\|^2u^{\mathsf T}Tu$, with equality at $u=T^+a$ when $a\ne0$. Thus the exact threshold is $\|w\|^2=a^{\mathsf T}T^+a$. Since every first-coordinate rate is positive, $G_1$ is positive definite, and conjugation by $G_1^{-1/2}$ proves (C.6c.3b.4). At a zero-exit vertex all defining sums vanish.

This construction depends on the actual vertex incidence table and the rates in the first two outgoing layers. It therefore covers every finite template with those data, including cycles, shared second neighbors, zero-rate deletions and spatially varying rows. For fixed positive support the Schur denominators are positive polynomials, so the principal-minor criterion gives the asserted exact parameter test; finitely many support patterns cover zero rates. The abelian second-difference identity of Theorem C.6c.3 gives the same quadratic minimization on positive root templates, identifying the two Schur matrices. Scaling gives $M(tq)=t^2M(q)$, $G(tq)=tG(q)$ and $a(tq)=ta(q)$, which proves the clock law.

For $S_m$, commuting translations give the second-difference sum of squares used in the proof of Theorem C.6c.4. A zero of its minimized form obeys $u_{-s}=-u_s$ and $u_{s+t}=u_s+u_t$ whenever $s,t,s+t\in S_m$. The values at $\pm e_i$ therefore determine every $u_s$: for $|s|>1$, remove a signed coordinate vector $e$ in a nonzero coordinate of $s$. Then $0<|s-e|<|s|\le m$, and induction in $\sum_i|s_i|$ applies to $s=e+(s-e)$. This gives $u_s=v\cdot s$, and an affine extension proves the converse. The source has $n>4m$ for its odd $n$, $m=\lfloor\sqrt n\rfloor\ge4$, so its two-step buckets have no additional torus identifications. The drift is zero by antipodal rates, and the Schur/range test gives the exact dimension. For $B=\sum_sa_n(s)ss^{\mathsf T}$, testing $f(z)=z^{\mathsf T}B^{-1}z$ gives $Lf=4$, $\Gamma_2=4$, hence the lower bound. Retaining the opposite pairs in the sum of squares and applying Cauchy--Schwarz over the $|S_m|/2$ pairs gives $(Lf)^2\le|S_m|\Gamma_2$, proving the upper bound.

For the degree-three sequence, $|S_m|\ge8m\ge32$, so its full binary trees have height at least five. A vertex at depth two and its three neighbors are internal vertices of degree three with no external edge. Every internal conductance is one and every tree mass is $\delta^4/k_n$, giving rate $R_n$. Its six outer vertices are distinct. Substituting in (C.6c.3b.1) gives $A=\frac32R_n^2I_3+\frac12R_n^2\mathbf1\mathbf1^{\mathsf T}$. Each of the two outer vertices below a first neighbor has diagonal $R_n^2/4$ and coupling $-R_n^2/2$, so elimination subtracts $2R_n^2I_3$. This proves the displayed $Q_x$. The constant and zero-sum eigenspaces in (C.6c.3b.4) give (C.6c.3b.6). Since $R_n\to\infty$, every fixed $K$ eventually fails. Equivalently, $u=(1,-1,0)$ with each outer value twice its parent value gives $Lf=0$, $\Gamma=R_n$ and $\Gamma_2=-R_n^2$. ∎

<a id="proposition-c6c3c-baseline-freedom-reversible-measure-and-metric-tests"></a>**Proposition C.6c.3c (Baseline Freedom, Reversible Measure and Metric Tests).** The following statements apply to Definition C.6c.3a.

1. For each fixed positive field $F$ and each neighbor probability row $p_{x\bullet}$, the baseline
$$
P^{(0)}_{xy}=\frac{p_{xy}/F_y}{\sum_zp_{xz}/F_z}
\tag{C.6c.3c.1}
$$
produces $P_{xy}=p_{xy}$ in (C.2). Thus (C.2), without a further baseline census, admits every neighbor probability row.
2. On a connected bidirected positive support with $r_x>0$, a reversible measure for $q$ exists exactly when a reversible measure $\pi^{(0)}$ for $P^{(0)}$ exists. In that case every reversible measure is proportional to
$$
\mu_x=\frac{\pi_x^{(0)}F_xZ_x}{r_x}.
\tag{C.6c.3c.2}
$$
Existence is decidable by equality of forward and backward products around every cycle; a spanning tree and its fundamental cycles suffice. With a prescribed $\mu$, the individual equations $\mu_xq_{xy}=\mu_yq_{yx}$ are necessary and sufficient. On $D_4$, or a finite homogeneous root quotient with distinct oriented root neighbors, counting-measure balance becomes $a_s=a_{-s}$, stronger than zero drift.
3. On any fixed finite graph with positive propagation lengths, all distances are the minima of the lengths of finitely many simple paths. For prescribed lazy laws, every Ollivier value is decided by a finite transport linear program with those distances. With the metric and non-lazy rows fixed, $W_1(P_\alpha(x),P_\alpha(y))$ is a convex piecewise-affine function of $\alpha\in[0,1]$, and the curvature is concave piecewise affine. Rational data admit exact rational primal and dual certificates.
4. Let two connected weighted graphs have the same vertex set and metrics $d,d'$. The identity is an isometry exactly when every edge of the first graph has length at least its $d'$ endpoint distance and every edge of the second has length at least its $d$ endpoint distance. If $\mu$ and $q$ are retained, an isometry satisfying this test preserves the generator and Dirichlet responses. Two-sided multiplicative edge comparisons on a common graph imply the same path comparisons, with the constants unchanged.

*Proof.* For item 1 put $A_x=\sum_zp_{xz}/F_z$. Then $Z_x=1/A_x$ and substitution yields $P_{xy}=p_{xy}$, including zero entries. For item 2 substitution gives $\mu_xq_{xy}=\pi_x^{(0)}F_xP^{(0)}_{xy}F_y$, which is symmetric exactly when the baseline is reversible. Conversely, from a reversible $\mu$ define $\pi_x^{(0)}=\mu_xr_x/(F_xZ_x)$ and reverse the calculation. Positivity and connectedness give uniqueness up to a scalar. Multiplying detailed-balance ratios around a cycle proves necessity of the cycle condition. For sufficiency, fix one vertex mass and define all others by products of ratios along a spanning tree. Fundamental-cycle equalities make every non-tree edge consistent, giving all detailed-balance equations. A one-way positive edge precludes positive reversible masses.

For the final assertion of item 2, counting-measure balance compares the two orientations of each root edge. For example, on a root torus whose period introduces no radius-two identifications, take rate $3/2$ on $e_1-e_2$, $e_2-e_3$, $e_3-e_1$, rate $1/2$ on their negatives, and rate $1$ on the other roots. The drift vanishes, while the oriented triangle has forward/backward product ratio $27$. It passes the finite-dimension test of Theorem C.6c.3 and fails every positive reversible-measure test. This distinguishes the dimension and symmetric-energy predicates on one carrier.

A shortest path with positive edge lengths has no repeated vertex, proving the first assertion of item 3. The transport primal minimizes $\sum_{uv}d(u,v)\gamma_{uv}$ over nonnegative matrices with the two declared marginals; the dual maximizes the difference of their expectations over $1$-Lipschitz potentials. After one potential value is fixed, its feasible polytope is bounded and has finitely many vertices. The objective at each vertex is affine in $\alpha$, so its maximum is convex piecewise affine. Exact linear programming supplies matching rational primal and dual values for rational data. Applying these finite constructions on every shortest-path chamber and every positive rate support gives the full finite-parametric test.

For item 4, the first edge condition implies $d'\le d$ by summation along every path; the second gives $d\le d'$. Necessity follows since endpoint distance is no larger than edge length. Retaining the same $q$ and $\mu$ retains the defining operator and form. Summing a common-graph edge comparison along paths and taking infima proves its quantitative version. ∎

<a id="theorem-c6c3d-exact-retained-refinement-and-a-nonempty-construction"></a>**Theorem C.6c.3d (Exact Retained Refinement and a Nonempty Construction).** Let $\pi:W\to V$ be a surjection of finite vertex sets, let $\nu$ and $\mu$ be positive masses, and let $\widehat L,L$ be Markov generators with rates $\widehat q,q$. Put $Jf=f\circ\pi$. The identities
$$
\pi_*\nu=\mu,\qquad
\sum_{b\in\pi^{-1}(y)}\widehat q_{ab}=q_{xy}
\quad(a\in\pi^{-1}(x),\ y\ne x)
\tag{C.6c.3d.1}
$$
are necessary and sufficient for $J$ to be an isometry and $\widehat LJ=JL$. They preserve $\Gamma$, $\Gamma_2$, all heat and resolvent responses on $J$, and the complete finite-time record of the projected Markov process under every initial law. If both generators are reversible for their declared masses, they also preserve the Dirichlet form and every bilinear form response on $J$.

If every fine edge $ab$ has length at least $d(\pi a,\pi b)$, then $\pi$ is $1$-Lipschitz. If each pair of distinct fibers admits, from each prescribed start to each prescribed end, a lifted base shortest path of exactly the same total length, then
$$
\widehat d(a,b)=d(\pi a,\pi b)\quad\text{when }\pi a\ne\pi b.
\tag{C.6c.3d.2}
$$
If the diameters of the fibers are at most $\eta$, the projection has distortion at most $\eta$ and preserves the masses exactly.

There is a simultaneous construction for every finite reversible base datum. Choose $k\ge2$, positive $p_1,\ldots,p_k$ summing to one, $\rho>0$ and $\eta>0$. Set
$$
W=V\times\{1,\ldots,k\},\quad \nu_{(x,i)}=\mu_xp_i,
$$
$$
\widehat q_{(x,i),(y,j)}=q_{xy}p_j\ (y\ne x),\qquad
\widehat q_{(x,i),(x,j)}=\rho p_j\ (j\ne i).
\tag{C.6c.3d.3}
$$
Every lifted base edge has its original length and every internal edge has length $\eta$. This construction satisfies (C.6c.3d.1)–(C.6c.3d.2). For $P=J^*$, the orthogonal splitting $u=JPu+u_\perp$ satisfies
$$
\langle u,-\widehat Lu\rangle_\nu
=\langle Pu,-LPu\rangle_\mu
+\sum_x(\rho+d_x)\sum_i\mu_xp_i|u_\perp(x,i)|^2.
\tag{C.6c.3d.4}
$$
Consequently a sequence of such refinements with $\eta_n\to0$ and $\rho_n\to\infty$ preserves the base measured-GH limit, Mosco limit and energy-plus-norm compactness. The varying-space identification declares $u_n$ weakly convergent when its fine norms are bounded and $P_nu_n$ converges weakly on the base, and strongly convergent when $P_nu_n$ converges strongly and $\|u_n-J_nP_nu_n\|\to0$. At finite stage all projected responses are already exact.

*Proof.* Applying the isometry identity to vertex indicators gives $\sum_{\pi a=x}\nu_a=\mu_x$; these equations also prove sufficiency. Applying $\widehat LJ=JL$ to the indicator of $y\ne x$ at $a\in\pi^{-1}(x)$ gives the row-sum condition in (C.6c.3d.1), and expansion of $\widehat LJf$ proves its sufficiency. Since $J$ preserves multiplication, substitution into the definitions yields $\widehat\Gamma(Jf,Jg)=J\Gamma(f,g)$ and $\widehat\Gamma_2(Jf)=J\Gamma_2(f)$. The power series gives $e^{t\widehat L}J=Je^{tL}$; integration against $e^{-zt}$ gives the resolvent identity for $z>0$. Cylinder probabilities are compositions of these semigroups and multiplication by projected event indicators, both intertwined by $J$. Equality for all such cylinders proves equality of the finite-time records for every projected initial law. Polarizing the isometry and generator identities proves preservation of the bilinear forms.

Summing the fine-edge lower bound along a path proves $d(\pi a,\pi b)\le\widehat d(a,b)$. The exact lifted paths give the reverse bound for distinct fibers. For a single fiber the projected distance is zero and the fine distance is at most $\eta$, proving the distortion assertion.

For (C.6c.3d.3), summing $p_j$ gives the row-sum identities and mass pushforward. Detailed balance follows from $\mu_xq_{xy}=\mu_yq_{yx}$ on external edges and from symmetry of $\mu_x\rho p_ip_j$ on internal edges. Every base path of positive length lifts between any chosen endpoint layers, because every layer choice on an external edge is present. Every fine edge projects to a base edge of no greater distance or to one point, so the metric assertions follow. The fiber average is $(Pu)(x)=\sum_ip_iu(x,i)$. On its zero-average orthogonal complement, the target average in each external jump vanishes and the internal refresh contributes $-\rho u_\perp$; hence $\widehat Lu_\perp(x,i)=-(\rho+d_x)u_\perp(x,i)$. The constant-fiber subspace is invariant and orthogonal to this one, giving (C.6c.3d.4).

The distortion and exact pushforward identify the measured-GH limits. An energy-bounded sequence has $\|u_\perp\|^2\le2\mathcal E_{\widehat L}(u)/\rho_n\to0$. Its projected energies are bounded above by its fine energies, so the base weak liminf gives the fine weak liminf. Lifting every base recovery sequence by $J_n$ gives the same norm and energy, hence recovery. Base energy-plus-norm compactness and the vanishing perpendicular norms give compactness upstairs. These arguments also specify the varying-space identifications. ∎

A source admitting (C.6c.3d.3) must register its $k|V|$ vertex memories, the $k^2$ lifted channels per base edge, internal refresh rates, clock and internal propagation prices. Definition C.6c.3a and Theorem C.6c.3d determine their mathematical responses; the source census and complete debit in SC-03 and SC-16 determine their MPU admission. The degree-three construction of Theorem C.6c.5 retains its separate approximate-resolvent and metric estimates.

<a id="theorem-c6c3e-finite-graph-metric-energy-transfer-with-explicit-test-errors"></a>**Theorem C.6c.3e (Finite-Graph Metric–Energy Transfer with Explicit Test Errors).** Let finite reversible data $(V_n,d_n,\mu_n,L_n)$ converge in measured-Gromov--Hausdorff topology to a compact full-support metric-measure space $(X,d,\mu)$. Suppose the following records are given.

1. Under specified varying-$L^2$ identifications, $\mathcal E_n=\frac12\langle\cdot,-L_n\cdot\rangle_{\mu_n}$ Mosco-converges to the quadratic Cheeger energy $\mathrm{Ch}_{d,\mu}$. The limit is a complete length space, and every function in $D(\mathrm{Ch})$ whose minimal weak upper gradient is at most one has a $1$-Lipschitz representative.
2. Set $L=\Delta$ for that Cheeger energy and $\Gamma(f,g)=\langle\nabla f,\nabla g\rangle$. For every $f\in D(L)$ with $Lf\in W^{1,2}$ and every nonnegative $\phi\in D(L)\cap L^\infty$ with $L\phi\in L^\infty$, there are graph functions $f_n$ and $\phi_n\ge0$. For the four quantities
$$
I_{1,n}=\int\Gamma_n(f_n)L_n\phi_n\,d\mu_n,\quad
I_{2,n}=\int\phi_n\Gamma_n(f_n,L_nf_n)\,d\mu_n,
$$
$$
I_{3,n}=\int\phi_n\Gamma_n(f_n)\,d\mu_n,\quad
I_{4,n}=\int\phi_n(L_nf_n)^2\,d\mu_n,
$$
the corresponding limit quantities $I_j$ are finite and satisfy $|I_{j,n}-I_j|\le\epsilon_{j,n}\to0$.
3. For fixed $N\in[1,\infty)$, $K_n\to K$ and each such approximating pair, the retained radius-two test gives
$$
\int\phi_n\left[\Gamma_{2,n}(f_n)-K_n\Gamma_n(f_n)-\frac1N(L_nf_n)^2\right]d\mu_n\ge-r_n,
\qquad r_n\to0.
\tag{C.6c.3e.1}
$$
The matrices of Theorem C.6c.3b can verify this on the full local function class; a declared restricted core can instead supply (C.6c.3e.1) for these particular approximations.

Then $X$ satisfies $\mathrm{BE}(K,N)$ and $\mathrm{RCD}^*(K,N)$. For every test pair, its limiting Bochner expression obeys the explicit bound
$$
\frac12 I_1-I_2-KI_3-\frac1NI_4
\ge-r_n-\frac12\epsilon_{1,n}-\epsilon_{2,n}
-|K|\epsilon_{3,n}-|K_n-K|\,|I_{3,n}|
-\frac1N\epsilon_{4,n}.
\tag{C.6c.3e.2}
$$
The conclusion is noncollapsed at dimension four when $N=4$ and the separately fixed measure normalization is $\mu=\mathcal H^4$.

*Proof.* Reversibility gives $\int\phi_nL_n\Gamma_n(f_n)\,d\mu_n=\int\Gamma_n(f_n)L_n\phi_n\,d\mu_n$. Substitution in the defining $\Gamma_{2,n}$ identity identifies the left side of (C.6c.3e.1) with $\frac12I_{1,n}-I_{2,n}-K_nI_{3,n}-I_{4,n}/N$. Subtract this expression from the limiting expression, add and subtract $KI_{3,n}$, and use the four error estimates to obtain (C.6c.3e.2). The convergent $I_{3,n}$ are bounded, so its right side tends to zero. This proves the full integrated $\mathrm{BE}(K,N)$ inequality on its stated domain. Quadratic Cheeger identification, completeness, full support, length structure and Sobolev-to-Lipschitz are item 1; compactness supplies the exponential-distance integrability in Assumption 4.2 of the characterization cited in Theorem C.6c. Its Theorem 7 gives $\mathrm{RCD}^*(K,N)$. The final assertion is the declared Hausdorff-measure normalization. ∎

The varying-stencil sequence of Theorem C.6c.4 supplies a nonempty instance at $K=0$, $N=4$. Its common smooth-core estimates, Riemann sums and smooth approximation give the four test limits. On the flat torus, $f\in D(\Delta)$ with $\Delta f\in H^1$ lies in $H^3$ by Fourier coefficients. Smooth convolution converges in $H^3$. For the admissible $\phi$, positive heat convolution remains nonnegative, keeps $\phi$ and $\Delta\phi$ uniformly bounded and converges almost everywhere along a sequence. Dominated convergence handles the terms weighted by $\phi$ or $\Delta\phi$, and the $H^3$ convergence handles $\Gamma(f,\Delta f)\in L^1$. A diagonal choice of sampled smooth approximations supplies the four errors and (C.6c.3e.1). The fixed-stencil obstruction and zero Ollivier classification remain those of Theorems C.6c.1 and C.6c.3.

<a id="theorem-c6c4-one-varying-stencil-euclidean-metric-energy-sequence"></a>**Theorem C.6c.4 (One Varying-Stencil Euclidean Metric–Energy Sequence).** Let $\mathbb T^4=\mathbb R^4/\mathbb Z^4$ have Euclidean geodesic metric $d_0$ and volume one. For odd $n\to\infty$, put $\delta=1/n$, $m=\lfloor\sqrt n\rfloor$, $h_n=\delta m$, and restrict to $m\ge4$, $2m<n$. Set
$$
X_n=(\delta\mathbb Z/\mathbb Z)^4,\quad
\mu_n=\delta^4\sum_{x\in X_n}\delta_x,\quad
S_m=\{s\in\mathbb Z^4:0<|s|\le m\},\quad Q_m=\sum_{s\in S_m}|s|^2.
$$
Join $x$ to $x+\delta s$ with propagation length $\delta|s|$, and let $d_n$ be the shortest-path metric. For fixed $\theta\in(0,1)$ define positive rates and forms on that same graph by
$$
a_n(s)=(1-\theta)\delta^{-2}\mathbf1_{\{\pm e_i\}}(s)
+\frac{8\theta}{\delta^2Q_m},\quad
L_nf=\sum_sa_n(s)\Delta_{\delta s}f,\quad
\mathcal E_n(f)=\frac12\langle f,-L_nf\rangle_{\mu_n}.
\tag{C.6c.4.1}
$$
These data have the following common limit package.

1. For all grid points,
$$
d_0(x,y)\le d_n(x,y)\le\left(1+\frac2{m-2}\right)d_0(x,y)+2\delta.
\tag{C.6c.4.2}
$$
The measured spaces converge to $(\mathbb T^4,d_0,dx)$. For $8\delta\le r\le1/4$,
$$
\omega_4(r/4)^4\le\mu_n(B_r^{d_n}(x))\le\omega_4(r+\delta)^4.
\tag{C.6c.4.3}
$$
2. For $8\delta\le r\le1/40$ and every graph function,
$$
\fint_{B_r^{d_n}(x)}|f-f_{B_r}|^2d\mu_n
\le\frac{25\cdot24^4}{1-\theta}\,r^2
\fint_{B_{5r}^{d_n}(x)}\Gamma_n(f)d\mu_n.
\tag{C.6c.4.4}
$$
3. In the topology of constant interpolation on grid cells, $\mathcal E_n$ Mosco-converges to $\mathrm{Ch}(f)=\frac12\int|\nabla f|^2dx$. Energy-plus-$L^2$ bounded sequences are strongly $L^2$ precompact, and resolvents and heat semigroups converge strongly.
4. For smooth sampled functions, $L_nf\to\Delta f$, $\Gamma_n(f)\to|\nabla f|^2$ and $\Gamma_{2,n}(f)\to\|D^2f\|_F^2$ uniformly. The error is uniform on bounded $C^3$ families. In local lifted coordinates, away from the chart cut by more than $2h_n$,
$$
L_nx_i=0,\qquad\Gamma_n(x_i,x_j)=\delta_{ij}.
\tag{C.6c.4.5}
$$
The limit has Sobolev-to-Lipschitz, its usual harmonic atlas, unique Euclidean tangents, quadratic Cheeger energy and noncollapsed $\mathrm{RCD}^*(0,4)$ structure.

*Proof.* Signed-permutation symmetry gives the exact moments
$$
\sum_sa_n(s)\delta s=0,\qquad
\sum_sa_n(s)(\delta s)(\delta s)^{\mathsf T}=2I_4,\qquad
\sum_sa_n(s)|\delta s|^2=8.
\tag{C.6c.4.6}
$$
Every graph path costs at least its Euclidean torus displacement. For a shortest lifted displacement of length $r>0$, divide its segment into $k=\lceil r/[\delta(m-2)]\rceil$ pieces and round intermediate points to nearest grid points, retaining the endpoints. The rounding error is at most $\delta$ in four dimensions. Every resulting step has length at most $r/k+2\delta\le\delta m$, and total cost at most $r+2k\delta$. Remove repeated vertices and project to the torus. This proves (C.6c.4.2). The grid is $\delta$-dense, and its counting measures converge by Riemann sums. Voronoi cells have radius at most $\delta$. Cells over the $d_n$-ball lie in the Euclidean $(r+\delta)$-ball; the ball contains every grid vertex of Euclidean radius $(r-2\delta)/2$, whose cells cover the Euclidean ball of radius $(r-2\delta)/2-\delta\ge r/4$. This proves (C.6c.4.3).

For the Poincaré estimate take the axis-aligned grid cube $Q$ of coordinate radii $r+\delta$. It contains $B_r^{d_n}$ and, by (C.6c.4.2), lies in $B_{5r}^{d_n}$. Each side has at most $5r/\delta$ vertices. On an interval with $q$ vertices,
$$
\sum_i|g_i-\bar g|^2=\frac1{2q}\sum_{i,j}|g_i-g_j|^2
\le q^2\sum_i|g_{i+1}-g_i|^2.
$$
Tensorization of variance yields $\int_Q|f-f_Q|^2\le25r^2\int_Q\Gamma_{\mathrm{coord},n}(f)$, where coordinate jump rates are $\delta^{-2}$. Since $\Gamma_n\ge(1-\theta)\Gamma_{\mathrm{coord},n}$, minimizing over constants on the smaller ball proves the unnormalized estimate with constant $25/(1-\theta)$. The volume ratio of $B_{5r}$ to $B_r$ is at most $24^4$ by (C.6c.4.3), proving (C.6c.4.4).

Let $K_n=\{-(n-1)/2,\ldots,(n-1)/2\}^4$. Fourier interpolation identifies the discrete $L^2$ space isometrically with the trigonometric polynomials of frequencies $K_n$. Its weak and strong varying-space topologies agree with cell interpolation: on each fixed Fourier mode, the cell coefficient is the discrete coefficient times $\delta^{-4}\int_{[0,\delta)^4}e^{-2\pi ik\cdot t}dt\to1$; density of finite Fourier sums proves weak agreement on bounded sets, and equality of norms proves strong agreement. Extend each form by $+\infty$ outside its finite Fourier space. The eigenvalue of $-L_n$ at $k\in K_n$ is
$$
\lambda_n(k)=4(1-\theta)\delta^{-2}\sum_i\sin^2(\pi\delta k_i)
+\frac{8\theta}{\delta^2Q_m}\sum_s[1-\cos(2\pi\delta k\cdot s)].
$$
The inequalities $\sin(\pi t)\ge2t$ for $0\le t\le1/2$, $1-\cos u\le u^2/2$, and (C.6c.4.6) imply
$$
16(1-\theta)|k|^2\le\lambda_n(k)\le4\pi^2|k|^2,\qquad
|\lambda_n(k)-4\pi^2|k|^2|\le\frac{16}{3}\pi^4h_n^2|k|^4.
\tag{C.6c.4.7}
$$
For the last estimate use the cosine fourth-order remainder and $\sum_sa_n(s)|\delta s|^4\le8h_n^2$. Under weak convergence, each fixed Fourier coefficient converges. Restricting the nonnegative energy sum to any finite frequency set and then exhausting all frequencies proves the weak liminf. Orthogonal Fourier projections of any $f\in H^1$ converge strongly, and the upper bound in (C.6c.4.7) bounds their energies by $\mathrm{Ch}(f)$; the liminf proves recovery. For $f\notin H^1$ the upper energy requirement is vacuous and the same projections converge. The lower bound controls Fourier tails and proves energy-plus-norm compactness. Pointwise convergence and boundedness of $e^{-t\lambda_n(k)}$ and $(z+\lambda_n(k))^{-1}$, $z>0$, followed by finite-mode approximation prove heat and resolvent convergence.

Commuting translations give
$$
\Gamma_{2,n}(f)=\frac14\sum_{s,t}a_n(s)a_n(t)
[\Delta_{\delta s}\Delta_{\delta t}f]^2.
$$
Write $H=\|D^2f\|_{\mathrm{op},\infty}$, $T=\|D^3f\|_{\mathrm{op},\infty}$ and $e_n=4Th_n/3$. Taylor's formula and (C.6c.4.6) give
$$
|L_nf-\Delta f|\le e_n,\qquad
|\Gamma_n(f)-|\nabla f|^2|\le4\|\nabla f\|_\infty Hh_n+H^2h_n^2.
$$
The double integral formula for $\Delta_h\Delta_kf$ differs from $h^{\mathsf T}D^2f(x)k$ by at most $2Th_n|h||k|$. Squaring and using the second moments gives
$$
|\Gamma_{2,n}(f)-\|D^2f\|_F^2|\le64(HT h_n+T^2h_n^2),
$$
and consequently
$$
\Gamma_{2,n}(f)-\frac14(L_nf)^2
\ge-64(HT h_n+T^2h_n^2)-2He_n-e_n^2/4.
\tag{C.6c.4.8}
$$
The limiting Hessian inequality is $\|D^2f\|_F^2\ge(\Delta f)^2/4$. Riemann sums pass its integrated version against every smooth nonnegative test; $H^2$ approximation passes the squared Hessian and Laplacian in $L^1$. The local coordinate identities are immediate from (C.6c.4.6). On the limiting flat torus, mollification preserves the gradient bound one, so every Sobolev function with $|\nabla f|\le1$ has a $1$-Lipschitz representative. The ordinary flat charts identify the tangents and harmonic coordinates. Completeness, full support, length structure, quadratic Cheeger energy and the integrated $\mathrm{BE}(0,4)$ inequality then give the claimed limit structure by the characterization cited in Theorem C.6c. ∎

The theorem supplies all the stated mathematical limit properties on one sequence outside the fixed-stencil class. Its finite-stage statements are graph-energy PI and common-smooth-core curvature stability; the RCD conclusion is proved directly at the limit. Theorem C.6c.4a supplies the finite endpoint source, propagation meter, generator and refinement responses. Corollary C.6c.7.1 supplies the graph-general qualified source with the same analytic metric/measure/rates and its own complete retained records and tariff. Theorems D.6f.2e–D.6f.2f give the full-ball finite-information obstructions; Theorem D.6f.2h and Propositions D.6f.2g/2i–2j give the separately specified recovery and core-assembly results.

<a id="definition-c6c4a-descriptor-timed-endpoint-sources"></a>**Definition C.6c.4a (Descriptor-Timed Endpoint Sources).** Fix once and for all a resource unit $u_*$, time unit $\tau_*>0$, length unit $\ell_*>0$ and positive rational tariff coefficients. Source inputs are a finite connected port graph, positive rational reversible rates and node probabilities, nonzero integer link descriptors $s_e\in\mathbb Z^d$ with $s_{\bar e}=-s_e$, a finite protocol, and a finite controller word. Every source port uses the nominated finite Hilbert/instrument branch of Definition 27 with the three-register carrier of Section 7.1.3 and the ideal-service convention used by E.2a.14. Theorem C.6c.4a constructs its finite endpoint protocol and response map. Theorem C.6c.6 and Corollary C.6c.7.1 bind the represented heat-node roles to the independently qualified ready cell of Theorem C.6c.P17a. Controller, packet and archive registers are explicitly owned auxiliaries of the ideal finite-service branch of E.2a.14.

The admitted source alphabet contains:

1. fresh finite pure registers, with their support size and preparation pulse charged
2. finite local unitary pulses with a finitely described matrix and an explicit normalization/unitarity certificate; the principal-logarithm construction of E.9.5.1a supplies their generator
3. a scheduled descriptor-timed two-port qubit-gate service on a named edge, with the two selected qubits and any finite classical control register local to an endpoint as its complete support; the admitted gates include a CNOT and a locally controlled SWAP. The service timer and busy-lane charge are fixed by the uniform law below. A null/control-conditioned use reserves the same lane interval. The finite local control support is charged as allocated memory and controlled-pulse service, and the gate generator is supplied on this full support
4. local projective record services, classical controlled finite circuits and writes into fresh records
5. a finite controller with a registered reference period and pulse-slot count; every pulse duration, maximum generator norm and archive holding interval is recorded

**Fixed link-service law.** Before choosing a graph or generator, register the following service for every dimension $d$, nonzero integer command $s\in\mathbb Z^d$ and service-clock unit $\eta>0$. An exact integer circuit computes $Q(s)=\sum_i s_i^2$. The service reserves one dedicated interface lane for the interval $[0,\eta\sqrt{Q(s)}]$, executes its selected two-port gate during the first $\eta/2$, and releases its completion flag at the end. The remaining interval holds the lane reserved. The resource meter records the lane's actual busy-time integral in service-clock units,

$$
q(s)=\eta^{-1}\int_0^{\eta\sqrt{Q(s)}}1\,dt
=\sqrt{\sum_i s_i^2}.
$$

The positive-root timer is a finitely specified algebraic control, and the completion time and meter record are retained responses. Since $s\ne0$, the gate pulse fits inside the interval. One unit of this metered resource has price $u_*\alpha_C$, fixed for the entire source class. Thus $q_e=q(s_e)$ is derived from the same occupied-lane service at every edge; it is independent of the generator, node masses, desired limit and observed data. Integer arithmetic, the timer, pulse strength and clock distribution have their separate priced source entries. This is a nominated ideal service law in the sense of E.2a.14's service tariff. Its operative quantity is reserved lane-time, with physical unit $\eta$, and its exact objective charge is obtained by dividing that measured interval by the registered $\eta$. The separate clock term charges changes of $\eta$.

The source inventory contains one dedicated lane per edge. Its busy intervals belong to the link meter; its idle intervals belong to a separately charged standby ledger. Node/controller/archive bit-time excludes these lane intervals, so each maintained factor and interval has one owner. The finite port-allocation count and idle-lane time are also retained in the complete tariff.

**Retained interface.** The source exposes completed diagonal preparation/readout, registered heat and resolvent steps, finite field-table probes, paid payload transport, cell-label maps and finite classical policy branches. Endpoint interventions are normalized classical instruments on the position algebra, tensored with the identity on the passive payload until a registered final payload read. Primitive unitary pulses are implementation calls inside the compiled macros; the access manifest exposes their completed outputs and the specified write-once resource records. The decoder checks both the endpoint protocol type and its prescribed primitive expansion. This interface fixes the response quotient while the physical instruments remain normalized on their complete Hilbert carriers.

Every communication between different ports uses item 3. Initial ready resources and random preparations are independent of an unknown test payload. A source-independent finite schedule fixes all communication slots; local operations and outcome-dependent controls may act inside those slots. Archives have no feedback port into later source preparations. Final record collection, when requested at one port, uses the same charged links. The complete joint record can also remain a tensor product of its local write-once records.

For a source word $w$, let $E(w)$ be its allocated lanes, $I_0(w)$ their idle-time integral in units of $\tau_*$, $B(w)$ be the other allocated bits, $I(w)$ their exact bit-time integral in units of $\tau_*$, $G(w)$ its local pulse count, $J(w)$ its record-service count, $K(w)$ its clock-slot count, and

$$
C_{\mathrm{link}}(w)=\sum_{\text{scheduled link uses }e}q_e.
$$

A complete nominated tariff is, for fixed positive rational coefficients,

$$
V(w)/u_*=\alpha_EE(w)+\alpha_0I_0(w)+\alpha_BB(w)+\alpha_I I(w)+\alpha_GG(w)+\alpha_JJ(w)
+\alpha_CC_{\mathrm{link}}(w)+\alpha_KK(w)
+\alpha_\Omega\frac{\tau_*}{\hbar}\max_t\|H_w(t)\|.
$$

Zero baseline Hamiltonians are used outside the specified pulses. The pulse-action record $\int\|H_w(t)\|dt$ is supplied separately. The tariff is a resource objective in the sense used by E.2a.14; no reset-heat equality is inferred from it. Link costs, local processing, allocated support, maintenance and clock strength have distinct owners in this sum. The link-cost coordinate is the representative used in Definition 35. The whole vector, together with $V$, remains in every source comparison.

All coefficients and source descriptors occur in the finite input before a protocol executes. The same decoder and tariff apply to every graph, rate choice and descriptor set. Changing the tariff, admitting unscheduled uncharged communication, allowing archive feedback, or admitting another initial shared resource produces a different source class.

<a id="theorem-c6c4a-finite-endpoint-source-realization"></a>**Theorem C.6c.4a (Finite Endpoint Source Realization).** On the nominated Hilbert/instrument source branch of Definition C.6c.4a, the $\theta=1/2$ sequence of Theorem C.6c.4 has finite source realizations with the following common retained responses. The source measure and link-meter metric equal $\mu_n$ and $d_n$ after the declared unit maps. The completed heat-step kernel at lag $\Delta_n=n^{-4}$ is exactly $P_n=e^{\Delta_nL_n}$, and its unique self-adjoint logarithm recovers $L_n$. Finite generator, $\Gamma$, $\Gamma_2$, quadratic-form and normalized-resolvent probes use the same carrier and source manifest. Every finite admitted endpoint protocol has the complete mathematical joint law. The nested cell maps preserve state, measure and pairing, and the common-core time-rounding estimate below carries these endpoint laws to the continuum responses of Theorem C.6c.4. The source inventory charges node and controller memory, all local and graph-edge operations, lanes, archives and the calibrated clock.

*Proof.* *Finite instrument and source census.* Each finite word allocates finitely many finite-dimensional factors and composes finitely many unitary and projective instruments. Every constituent is CP and its nonselective sum is trace preserving; composition has the same property after every spectator identity extension. Take the perspective kernel to be the identity on one nominated perspective. These are precisely Definition 27's two update requirements. For a unitary $U$, a slot of duration $d>0$ uses $H=i\hbar\operatorname{Log}(U)/d$, so $\|H\|\le\pi\hbar/d$ and its norm action is at most $\pi\hbar$. The finite reference period and finite slot count make every duration positive and every recorded cost finite. Fresh records and the isolated archive give a finite source/service/record inventory. The word, its matrix identities, its output record, its resource counters and its clock form the dressing required by P.6.2a–c. This proves finite instrument admissibility on the nominated ideal-service branch for every word in the class.

The census is complete by syntax: a source object is a finite typed endpoint protocol, its prescribed finite primitive expansion and the certified parameters; its decoder rejects additional access ports, an untyped endpoint intervention or a primitive word that differs from the specified macro expansion. The primitive normalization proofs and additive resource counter cover every admitted call and every finite composition. This construction proves finite instrument realizability. Definition 15a and Theorem 43b govern the separate PCE architecture-selection comparison, and Theorem C.6c.6 and Corollary C.6c.7.1 supply the independently qualified MPU-source binding of the represented heat-node roles.

*Carrier, units and endpoint instrument.*

Fix $\theta=1/2$ in C.6c.4. Let $N=n^4$, $b_n=\lceil\log_2N\rceil$, $X_n=(\mathbb Z/n\mathbb Z)^4$, $\mu_x=1/N$, and write $s/n$ for the torus displacement. Set

$$
a_n(s)=\frac{n^2}{2}\mathbf1_{\{\pm e_i\}}(s)+\frac{4n^2}{Q_m},
\qquad q_e=|s|,
\qquad\Delta_n=n^{-4}.
$$

The physical source clock period is $\tau_*\Delta_n$. The source measure has atom $v_x=\ell_*^4/N$, its normalized probability is $\mu_x$, its rate coordinate is $r_{xy}=a_n(s)/\tau_*$, its conductance is

$$
\mathfrak c_{xy}=v_xr_{xy}=\frac{\ell_*^4}{\tau_*}n^{-4}a_n(s),
$$

and its propagation length is $\ell_*n^{-1}q_e$. The physical time-generator form uses the normalized measure: $\mathcal E_n^{\mathrm{src}}(f)=\tfrac12\langle f,-(L_n/\tau_*)f\rangle_{\mu_n}=\mathcal E_n(f)/\tau_*$. Thus rates have units $T^{-1}$, reference-measure masses have units $L^4$, conductances have units $L^4T^{-1}$ and propagation lengths have units $L$. These node masses are the atomic reference measure; no inertial-mass identification is used. For a field with units $U$, the time-generator form has units $U^2T^{-1}$ and becomes the mathematical form of C.6c.4 after multiplication by $\tau_*$. The physical diffusion coefficient is $\ell_*^2/\tau_*$. Dividing the time-generator form by that coefficient gives $\mathcal E_n/\ell_*^2$, whose limit is the Cheeger energy for the metric scaled by $\ell_*$ and the normalized limiting measure. The finite-stage energy is the graph form. Using the volume measure $v_x=\ell_*^4\mu_x$ multiplies both corresponding forms by $\ell_*^4$.

In the tensor product of the node carriers, let $|x,b\rangle$ denote one distinguished memory excitation at $x$, with the prediction register at $x$ carrying the basis value $b\in\{0,1\}$ of a passive payload qubit, all other memory/prediction bits ready, and every interface bit ready. The retained source algebra is the direct sum of $N$ two-dimensional payload matrix blocks: position is classical and the payload qubit is retained within each block. The graph-state experiments use $b=0$ and write $|x\rangle=|x,0\rangle$; the metric experiment tests both payload values. Packet swaps carry this passive register with the position, so both experiments use the same allocated carrier. A distribution $p$ is encoded by

$$
\iota_n(p)=\sum_xp_x|x\rangle\langle x|.
$$

The full decoder is the positive payload block $\omega_x=\sum_{b,c}\langle x,b|\rho|x,c\rangle|b\rangle\langle c|$, and the graph marginal is $p_x=\operatorname{Tr}\omega_x$. The source retains the initial position record, subsequent endpoint position records, clock labels, prescribed interventions and their outcomes. For general code-supported quantum inputs, the initial position pinching retains these payload blocks, including their operator-valued extensions against an external spectator. A code-complement outcome is retained for invalid inputs. Every subsequent unitary is defined on the whole allocated carrier, so this domain check uses a normalized instrument rather than postselection.

Define the heat-step operator

$$
P_n=e^{\Delta_nL_n}.
$$

It is symmetric stochastic and has strictly positive entries. To prove stochasticity, let $q=\sum_sa_n(s)$ and $K=I+L_n/q$. Then $K$ is stochastic and

$$
P_n=e^{-q\Delta_n}\sum_{j\ge0}\frac{(q\Delta_n)^j}{j!}K^j.
$$

Every entry is nonnegative and every row sums to one. Connectedness gives a positive finite path term between every pair, hence strict positivity. Translation invariance gives $P_n(x,y)=p_n(y-x)$. A finite expression for this probability is

$$
p_n(v)=N^{-1}\sum_{k\in K_n}e^{-\Delta_n\lambda_n(k)}\cos(2\pi k\cdot v/n).
$$

This expression is used with its proved positivity certificate. It is a finitely described ideal control parameter of the same finite-pulse class used in E.9.5.1a.

Prepare a coin with basis $v\in X_n$ in the pure state

$$
|\chi_n\rangle=\sum_v\sqrt{p_n(v)}|v\rangle.
$$

Unused basis states in a binary encoding have zero amplitude. A Householder reflection sends the ready vector to $|\chi_n\rangle$: for distinct unit vectors $e_0,\chi_n$ with real overlap, take $u=(e_0-\chi_n)/\|e_0-\chi_n\|$ and $W=I-2|u\rangle\langle u|$. Direct multiplication gives $We_0=\chi_n$. The equal-vector case uses the identity. Project the coin and, conditional on $v$, translate the memory packet by $v$. The endpoint Kraus operators on the code are

$$
K_v=\sqrt{p_n(v)}U_v,
\qquad U_v|x,b\rangle=|x+v,b\rangle,
\qquad\sum_vK_v^*K_v=I.
$$

Consequently the full endpoint skeleton has probability

$$
\Pr(x_0,v_1,x_1,\ldots,v_H,x_H)
=p_{x_0}\prod_{j=1}^Hp_n(v_j)\mathbf1_{x_j=x_{j-1}+v_j}.
$$

Each $v_j$ is determined by the adjacent endpoint positions. All controller copies and packet locations during the compiled instruction sequence are deterministic functions of the declared schedule, the retained endpoints and these coins. The fresh coin is independent of the earlier archive. The complete physical record is therefore a deterministic refinement of this skeleton, with a total decoder in the opposite direction.

*Local compilation and resources.*

The heat coin is prepared at a designated controller port. Distribute its $b_n=\lceil\log_2N\rceil$ classical bits along a fixed spanning tree. This uses $b_n(N-1)$ two-port CNOT services into fresh target bits, each charged even when its control value is zero. This direct CNOT is an explicitly admitted two-node primitive; no free remote control or uncounted temporary transfer is used. The seed copies remain in a separately owned archive after the epoch.

Every translation $U_v$ has a finite nearest-neighbor swap word. A unit cyclic shift of one coordinate line is a product of $n-1$ adjacent swaps. There are $n^3$ such lines for each coordinate. Choose the signed representative of each coordinate of $v$ with absolute value at most $(n-1)/2$. At most

$$
W_n=2n^3(n-1)^2
$$

packet swaps implement $U_v$. For a schedule independent of the coin, concatenate the $N$ translation words, controlling the word for $v$ on equality of the locally stored coin with $v$. Each controlled swap is a Hermitian involution on the two neighboring packets and the source-port controller. Swapping the three-qubit packet uses three controlled qubit swaps. Every such gate is on a coordinate edge, already present in $S_m$. Thus no nonedge interaction or controller shortcut is introduced.

After the translation, copy the occupancy pattern into $N$ fresh endpoint-record bits and use the local projective record service. Count preparation, distribution, all controlled swaps, endpoint copying and every projective service. A conservative pulse-slot budget is

$$
G_n=2+ b_nN+3NW_n+2N.
$$

Padding a shorter compiled word by idle slots fixes this budget for every coin outcome. Set the service-clock unit $\eta_n=\tau_*\Delta_n/(G_n+1)$. Every communication in this heat compiler has a coordinate descriptor and hence $q_e=1$, so its reserved interval is exactly $\eta_n$. Give local and record slots the same duration, execute unitary pulses during the first half-slot, and reserve the final slot for the endpoint clock flag. All source Hamiltonians have finite norm at fixed $n$,

$$
\max_t\|H(t)\|\le2\pi\hbar/\eta_n,
\qquad \int_{\mathrm{epoch}}\|H(t)\|dt\le\pi\hbar G_n.
$$

For $H$ epochs the allocated site and raw-record inventory can be bounded by

$$
B_{n,H}=3N+(H+1)N+H(N+1)b_n+B_{\mathrm{code},n}+B_{\mathrm{controller},n,H}.
$$

The initial position record uses an additional $2N$ copy/read slots, and its initialization interval and tariff are charged before the $H$ heat epochs. Preparation of an initial state, when part of the requested protocol, uses the same finite coin/routing template with its specified preparation law and has its own counters. The code and controller terms are the lengths of the explicitly generated finite coin-expression and swap-loop descriptions, including the counters through $H(G_n+1)$ slots. They are counted inputs, rather than a free time-dependent oracle. Preallocating these registers and maintaining them for the complete declared experiment gives the exact conservative rent $B_{n,H}T/\tau_*$ for a physical duration $T$. The tariff counts $HG_n$ scheduled slots, the full tree and swap traffic, $H\pi\hbar G_n$ action bound, the displayed peak strength, $|E_n|=N|S_m|/2$ allocated lanes and their idle-time ledger, source preparation, record production and archive storage. Fresh pure registers are consumed at every epoch; the archive is retained through the finite experiment. Reuse calls a separately registered reset service and its own ledger.

The physical state between endpoints follows the explicit finite pulse circuit. The retained temporal structure consists of completed endpoint records. This convention is fixed in the source definition and enters the response map below.

*Retained structural maps.*

For every finite endpoint protocol, encode its initial distribution, replace each mathematical step by the circuit above, replace each position-diagonal observation by its normalized record instrument, and replace each allowed classical conditional policy by the same conditional controller. The displayed endpoint-kernel identity and induction over the protocol tree prove equality of the entire joint record law. Tensoring a later normalized operation with the identity on earlier records leaves their marginals unchanged. Thus the map is total, respects composition and preserves all retained adaptive endpoint protocols and their causal record. The same induction applies to the payload blocks and every external spectator, since each position transition carries the payload identically.

The probability/observable pairing is preserved exactly:

$$
\operatorname{Tr}(\iota_n(p)\operatorname{diag}f)=\sum_xp_xf_x.
$$

Uniform position preparation supplies $\mu_n$. Reversibility preserves the $L^2(\mu_n)$ adjoint and trace pairing. Since $P_n$ is positive self-adjoint, its self-adjoint logarithm is unique and

$$
\frac1{\tau_*\Delta_n}\log P_n=\frac1{\tau_*}L_n.
$$

This is the retained transfer-generator response, determined by the same endpoint channel and clock. The source does not identify the circuit's intermediate Hamiltonian with $L_n$.

There are also finite direct probes of the graph generator and local energy. For a finitely specified field table $f$, select $S$ with probability $a_n(S)/q$, where $q=\sum_sa_n(s)$. Conditional on starting at $x$, report respectively

$$
q[f_{x+S}-f_x],\quad
\frac q2[f_{x+S}-f_x]^2.
$$

Their expectations are $L_nf(x)$ and $\Gamma_n(f)(x)$. Dividing by $\tau_*$ gives their physical time-generator units, and the corresponding second-iterated probe divides by $\tau_*^2$. Two independent direction selections, with the corresponding double difference and output $q^2(\Delta_S\Delta_Tf)^2/4$, give $\Gamma_{2,n}(f)(x)$ by C.6c.4's commuting-translation identity. Uniform $x$ and output $q(\Delta_Sf)^2/4$ give $\mathcal E_n(f)$. All table access, direction preparation, neighbor communication, arithmetic and output records belong to the finite controller word and its resource counter. The expectation identities identify these responses before any continuum comparison.

For $z>0$ rational, the matrix $z(zI-L_n)^{-1}$ is a rational stochastic matrix. Its positivity and normalization follow by integrating $ze^{-zt}e^{tL_n}$; rationality follows from finite matrix inversion. The same finite preparation-and-routing compiler implements its complete endpoint law. This realizes the normalized resolvent probe on the same state carrier and source manifest.

For the metric test, transmit an unknown bit from port $x$ to $y$, allowing arbitrary local operations and the source's scheduled edge services. A path of edge services implements the identity bit channel with link charge equal to the path sum. Conversely, a circuit whose output at $y$ depends on the input at $x$ contains a directed causal path of paid edge services between these ports. If there is no such path, induction over the circuit makes the output independent of the input. The total nonnegative link charge is at least that path's charge. The same argument applies with arbitrary source-independent coins and local adaptive controls because every scheduled slot is charged, including its null branch. Hence the least link-coordinate charge for exact transmission is the graph shortest-path charge. Multiplying by $\ell_*/n$ gives exactly $\ell_*d_n$. Memory, processing and clock coordinates remain in the complete tariff; the choice of metric coordinate is the explicit Definition-35 representative.

*Refinement and continuum response.*

Use the nested subsequence $n_j=3^{2j}$, $j\ge2$, for an exact coarse/fine record. It lies within the already proved C.6c.4 sequence. Fine-grid labels map to their enclosing coarse half-open cell. Each coarse cell has $(n_{j+1}/n_j)^4$ fine labels, so the uniform source measure pushes forward exactly. Replication of a coarse field and block averaging of a fine field are adjoint maps in the declared $L^2$ pairings; replication is an isometry. Finite deterministic label decoding realizes these maps, with its storage and arithmetic charged. The maps commute exactly with state probability, trace, constant fields, cell support and the source record restriction.

The generator compatibility required by the continuum construction is obtained on the common smooth core. Let $S_nf$ be sampling, $t_n=\Delta_n\lfloor t/\Delta_n\rfloor$, and let $H_tf=e^{t\Delta}f$ on the unit torus. C.6c.4 and Duhamel's formula give, uniformly for $0\le t\le T$,

$$
\|P_n^{\lfloor t/\Delta_n\rfloor}S_nf-S_nH_tf\|_\infty
\le\frac43Th_n\|D^3f\|_\infty+\Delta_n\|\Delta f\|_\infty.
$$

Indeed $\|(L_nS_n-S_n\Delta)H_sf\|_\infty\le(4/3)h_n\|D^3f\|_\infty$ since the torus heat operator contracts each derivative norm. Integrating the generator error through the two contractive semigroups gives the first term at $t_n$. Integrating $\partial_sH_sf=\Delta H_sf$ from $t_n$ to $t$ gives the second. Both terms tend to zero. Contractivity and smooth-core density extend strong convergence to $L^2$ data. The continuum protocol class has a fixed finite number of heat segments and finite-outcome multiplication instruments with smooth bounded effects from the common core. Strong convergence of the heat operators and multiplication maps passes to each unnormalized branch product, and then to its trace. A finite sum of these branch probabilities proves convergence of the complete adaptive record. At each finite stage the source-to-graph law remains exact for every admitted diagonal protocol; the cross-stage convergence claim uses the specified common-core class.

The source's measure, metric, forms and direct $\Gamma/\Gamma_2$ probes equal C.6c.4's data at each stage. Its noncollapse, PI, Mosco limit, common-core curvature, Sobolev-to-Lipschitz and harmonic-chart conclusions therefore apply to this single source sequence. A finite coarse/fine map is not asserted to commute exactly with both generators; the displayed estimate supplies the generator and temporal refinement compatibility actually used. ∎

The endpoint clock is part of this realization's retained protocol. An additional class retaining every intermediate-time local signaling experiment has its own timing predicate: a connected heat kernel has positive off-diagonal entries at every positive time, so carrying an unknown bit by that law contradicts a strictly positive minimum path latency from Definition 35a. The finite endpoint source supplies the original operational-continuum realization through its explicit clock and vanishing time-rounding error.

<a id="proposition-c6c4b-rational-finite-tick-approximation"></a>**Proposition C.6c.4b (Rational Finite-Tick Approximation).** On the ideal finite-instrument source branch of Definition C.6c.4a, retain the varying stencil and rates of Theorem C.6c.4a. Write $M=|S_m|$, set $b=n^4$, and define
$$
\rho=32bn^2,\qquad D=64bQ_m,\qquad
w_s=Q_m\mathbf1_{\{\pm e_i\}}(s)+8,\qquad
w_0=D-8(Q_m+M).
$$
A uniform $D$-ticket instrument, with $w_s$ tickets assigned to translation $s$ and $w_0$ to the identity, has endpoint matrix
$$
\widehat P_n=I+L_n/\rho.
$$
Its stationary measure is $\mu_n$, and its clock-normalized off-diagonal conductances are $\mu_x\rho\widehat P_n(x,y)=\mu_xa_n(y-x)$, the conductances of $\rho(\widehat P_n-I)=L_n$. The source clock assigns physical duration $\tau_*/\rho$ to each completed tick and charges its finite primitive expansion, controller, records and clock strength under Definition C.6c.4a. For dimensionless time $t\ge0$ and $k=\lfloor\rho t\rfloor$,
$$
\|\widehat P_n^k-e^{tL_n}\|_{\infty\to\infty}
\le \frac{8tn^2}{b}+\frac1{2b}.
\tag{C.6c.4b.1}
$$
The corresponding total-variation error for every initial probability law is at most half the right side. A finite adaptive endpoint protocol has error at most the sum of its segment bounds. Thus the error tends to zero uniformly on bounded time windows. The exact rational instrument is admitted by the stated ideal finite-pulse branch; a bounded fair-bit implementation of an arbitrary ticket denominator requires its separately declared approximation or probability primitive.

*Proof.* Every $s\in S_m$ is a nonzero integer vector, so $Q_m=\sum_s|s|^2\ge M$. The total directional ticket count is $8Q_m+8M$, which is at most $16Q_m\le D$, and $w_0$ is a nonnegative integer. The tickets sum to $D$. For every direction,
$$
\frac{\rho w_s}{D}
=\frac{n^2}{2}\mathbf1_{\{\pm e_i\}}(s)+\frac{4n^2}{Q_m}
=a_n(s).
$$
This proves the endpoint matrix and difference-quotient identity. Antipodal ticket counts give detailed balance for the uniform measure. Prepare the finite uniform ticket state, measure its label, and apply the corresponding translation by the local compiler of Theorem C.6c.4a. Padding its finite primitive word fixes the tick period and its resource counters independently of the chosen ticket. Every ticket and endpoint record has its declared archive owner. This gives a normalized full-carrier instrument and its complete finite endpoint law; its clock and tariff are those stated above.

Put $A=\|L_n\|_{\infty\to\infty}$ and $h=1/\rho$. Since
$$
\sum_s a_n(s)=4n^2+4n^2M/Q_m\le8n^2,
$$
we have $A\le16n^2$ and $hA\le1/(2b)$. Both $I+hL_n$ and $e^{hL_n}$ are stochastic contractions. The exponential series gives
$$
\|e^{hL_n}-(I+hL_n)\|
\le\tfrac12h^2A^2e^{hA}.
$$
Telescoping their $k$th powers and using $kh\le t$ and $e^{1/2}<2$ bounds their difference by $thA^2\le8tn^2/b$. For the remaining interval $0\le t-kh<h$, integration of the contraction semigroup gives
$$
\|e^{tL_n}-e^{khL_n}\|
\le(t-kh)A\le1/(2b).
$$
The triangle inequality proves (C.6c.4b.1). For finite kernels, the operator norm on bounded observables is the maximum row $L^1$ norm; total variation is half that norm. Conditioning on each earlier endpoint record, inserting one segment at a time, and applying stochastic contraction proves the adaptive sum bound. Substitution of $b=n^4$ gives uniform convergence on each bounded time window. ∎

<a id="proposition-c6c4c-positive-latency-obstruction-to-an-all-time-walker-law"></a>**Proposition C.6c.4c (Positive-Latency Obstruction to an All-Time Walker Law).** Let $L$ be an irreducible continuous-time Markov generator on a finite connected port graph. Consider a source with source-independent initial ready resources, retained interventions and local records at every real time, and strictly positive minimum signaling delays on every directed signaling edge as in Definition 35a. Every information-bearing inter-port influence uses those edges under the causal hypothesis of Theorem 35b(1). It cannot transmit an unknown bit by a walker whose joint position/payload law is the $e^{tL}$ position law with unchanged payload at every real $t>0$.

*Proof.* Fix distinct reachable ports $x,y$. For any $q$ at least the maximum exit rate, $K=I+L/q$ is stochastic and
$$
e^{tL}=e^{-qt}\sum_{j\ge0}\frac{(qt)^j}{j!}K^j.
$$
Irreducibility supplies a finite positive-rate path from $x$ to $y$, so some $(K^j)_{xy}>0$. Therefore $(e^{tL})_{xy}>0$ for every $t>0$. Prepare the walker at $x$ and intervene there to choose either value of its unknown payload bit. Under the claimed law, the receiver event “walker detected at $y$ with payload one” has positive probability for one intervention and probability zero for the other at every $t>0$. Its retained distribution therefore depends on the intervention.

The finite graph and positive edge delays give a strictly positive minimum path latency $L_{xy}$. Choose $0<t<L_{xy}$. Theorem 35b(1) makes the retained receiver record independent of the intervention at such a time, contradicting the preceding event probability. This proves the stated conjunction impossible. Theorem C.6c.4a instead retains completed endpoint observations at its declared clock boundaries; its common-core time-rounding estimate is the temporal comparison used in its continuum limit. ∎

<a id="proposition-c6c4d-passive-payload-record-rigidity"></a>**Proposition C.6c.4d (Passive-Payload Record Rigidity).** Retain the source algebra and complete endpoint histories of Theorem C.6c.4a, including the initial position, and stop each history before any registered final payload read. Fix an initial position $x$ and let $B\cong\mathbb C^2$ be its arbitrary payload, possibly entangled with an external reference. An admitted extension may add a finite record $z$ but must preserve the complete original endpoint law and the identity payload channel on every history after forgetting $z$. For an original history $h$, let $p_h(x)$ be its probability and let $\mathcal J_{h,z}$ be the resulting CP branch map on $B$, after identifying the endpoint payload with its input copy. Then
$$
\mathcal J_{h,z}=p_h(x)q(z\mid x,h)\,\operatorname{id}_B,
\qquad
\sum_zq(z\mid x,h)=1
\quad\text{when }p_h(x)>0.
\tag{C.6c.4d.1}
$$
Every branch with $p_h(x)=0$ vanishes. Thus a retained auxiliary record can depend on position and heat history, but its conditional law at fixed $(x,h)$ contains no information about the unknown payload. The same conclusion holds separately for every registered null implementation that preserves its own history-conditioned identity payload law.

There is a sharp disturbance bound for a proposed binary payload read. Suppose a normalized instrument preserves each basis input $|b\rangle\langle b|$, $b=0,1$, after summing its finite record $z$. Let $q_b$ be the record law, $\delta=d_{\mathrm{TV}}(q_0,q_1)$, and $\Phi$ its nonselective payload channel. Then
$$
d_{\mathrm{tr}}\!\left(\Phi(|+\rangle\langle+|),|+\rangle\langle+|\right)
\ge \frac{1-\sqrt{1-\delta^2}}2,
\qquad |+\rangle=(|0\rangle+|1\rangle)/\sqrt2,
\tag{C.6c.4d.2}
$$
where $d_{\mathrm{tr}}(\rho,\sigma)=\tfrac12\|\rho-\sigma\|_1$. Equality is attained for every $0\le\delta\le1$ by the two Kraus operators
$$
A_0=\operatorname{diag}\!\left(\sqrt{\frac{1+\delta}{2}},\sqrt{\frac{1-\delta}{2}}\right),
\qquad
A_1=\operatorname{diag}\!\left(\sqrt{\frac{1-\delta}{2}},\sqrt{\frac{1+\delta}{2}}\right).
\tag{C.6c.4d.3}
$$

*Proof.* At fixed $x,h$, preservation of the original law gives
$$
\sum_z\mathcal J_{h,z}=p_h(x)\operatorname{id}_B.
$$
For a linear map $\Psi$ on payload matrices, define its Choi matrix by
$$
J(\Psi)=\sum_{b,c=0}^1|b\rangle\langle c|\otimes\Psi(|b\rangle\langle c|).
$$
Complete positivity makes each $J(\mathcal J_{h,z})$ positive. Their sum is $p_h(x)|\Omega\rangle\langle\Omega|$, where $|\Omega\rangle=|00\rangle+|11\rangle$. For any vector $v$ orthogonal to $\Omega$, positivity and the zero quadratic form of the sum give $\langle v,J(\mathcal J_{h,z})v\rangle=0$ for every $z$. A positive matrix with zero quadratic form on $v$ annihilates $v$, as follows by taking its positive square root. Hence each branch has range in the line spanned by $\Omega$ and equals a nonnegative multiple of $|\Omega\rangle\langle\Omega|$. The Choi map is injective because its $(b,c)$ block is $\Psi(|b\rangle\langle c|)$. The multiples therefore give (C.6c.4d.1); their sum is $p_h(x)$. If $p_h(x)=0$, every positive summand is zero. The identity remains valid after tensoring with every reference identity. Applying the same argument to a null implementation proves the null clause.

For (C.6c.4d.2), write Kraus operators $A_{z,\alpha}$ for the proposed instrument. Since the nonselective output of $|b\rangle\langle b|$ is the rank-one state $|b\rangle\langle b|$, positivity forces every $A_{z,\alpha}|b\rangle$ to be proportional to $|b\rangle$. Thus each Kraus operator is diagonal, with diagonal entries $a_{z,\alpha,0},a_{z,\alpha,1}$. Normalization gives $\sum_{z,\alpha}|a_{z,\alpha,b}|^2=1$, the record law is $q_b(z)=\sum_\alpha|a_{z,\alpha,b}|^2$, and
$$
\Phi(|0\rangle\langle1|)=c|0\rangle\langle1|,
\qquad
c=\sum_{z,\alpha}a_{z,\alpha,0}\overline{a_{z,\alpha,1}}.
$$
Cauchy--Schwarz within each $z$ gives $|c|\le F$, where $F=\sum_z\sqrt{q_0(z)q_1(z)}$. A second Cauchy--Schwarz application gives
$$
2\delta
=\sum_z|\sqrt{q_0(z)}-\sqrt{q_1(z)}|\,|\sqrt{q_0(z)}+\sqrt{q_1(z)}|
\le\sqrt{(2-2F)(2+2F)}.
$$
Consequently $|c|\le\sqrt{1-\delta^2}$. The difference of the two states in (C.6c.4d.2) has zero diagonal and off-diagonal entry $(c-1)/2$, so its trace distance is $|1-c|/2\ge(1-|c|)/2$. This proves the bound. The operators (C.6c.4d.3) sum to the identity in $\sum_zA_z^*A_z$, give record laws $((1+\delta)/2,(1-\delta)/2)$ and their exchange, and multiply coherence by $\sqrt{1-\delta^2}$. They attain every displayed inequality. ∎

Theorem C.6c.4a calls the register carrying $B$ the prediction register and keeps it passive. Proposition C.6c.4d excludes a retained, payload-informative prediction or verification record produced from that register while its complete identity response is preserved. A registered final payload read uses the separate destructive-read interface and is outside that identity-preserving interval. A computational-basis test misses this obstruction: copying the payload bit gives $\delta=1$ and preserves both basis inputs, while its retained copy produces trace-distance error $1/2$ on $|+\rangle$.

A role map using occupancy, an existing controller register or an accessible position-history record is compatible with (C.6c.4d.1). Such a map must specify the forecast before the predicted outcome, its comparison with that outcome, the feedback-driven model update and each Definition-5a typed-null replacement. The retained joint law then determines the original and null scores against one fixed baseline and margin. An isolated archive has no feedback port under Definition C.6c.4a, so using it for a later model update requires an admitted access change and its debit. Each register relabeling must carry these operational maps. A loop using the final destructive payload read must additionally supply its next-cycle preparation and full resource debit. These alternatives leave qualification of the actual heat-node roles as a separate, precisely testable source datum.

<a id="theorem-c6c4e-qualified-node-substitution-and-error-accumulation"></a>**Theorem C.6c.4e (Qualified-Node Substitution and Error Accumulation).** Fix a family of finite heat-source words and protocols from Definition C.6c.4a over its retained refinement stages, including every allocated node, controller, packet, archive, lane and clock factor. Suppose one independently admitted source family supplies the following data for every word and protocol, with the same reference units, source boundary and tariff throughout the refinement family.

1. Every claimed MPU node has a Definition-23 qualification record for its actual operating task and source coupling. The record supplies the physical state and law, the full prediction/verification/update loop, its registered original and typed-null responses, score, matched baseline, margin, full-constraint realizer and original-complexity minimum. A source-census route supplies the original-program coverage certificate for that declared qualification class. The qualification record identifies each logical role with an actual supported operation and assigns the environment, controller and source their owners.
2. An isometric encoding $E$ identifies the complete heat carrier, its invalid-code flag and every retained record with the physical carrier's admitted code. The initial preparations have this encoding, and the encodings and record maps are compatible with protocol extension and the registered coarse/fine restrictions. For each compiler primitive $g$ and each of its outcomes $a$, the physical branch map $\widetilde{\mathcal G}_{g,a}$ obeys
   $$
   \widetilde{\mathcal G}_{g,a}(E\rho E^*)
   =E\mathcal G_{g,a}(\rho)E^*.
   \tag{C.6c.4e.1}
   $$
   The same identities hold for all primitive calls in the qualification and registered null protocols. The record maps cover every physical retained output, with no undeclared side record. Readout and record restriction decode the encoded state, and these maps intertwine its model, forecast, verification and outcome-conditioned updates. The physical coupled execution used here is included in the qualification record of item 1.
3. Every primitive, preparation, allocation and maintained interval has its original duration and physical units. Each complete mapped macro has exactly its original physical start and completion boundaries, including every additional qualification or source operation. Any additional operation must fit within the admitted joint schedule while preserving these boundaries and every retained clock record. A source-exhausted occurrence inventory assigns each resource occurrence and interval exactly one owner and reproduces the full vector of Definition C.6c.4a, including coefficient production and descriptions, controls, active and archived storage, ready resources, link reservation, standby, cleanup, clock distribution, peak strength and pulse action. Any additional qualifying operation or access is listed with its incremental vector $\Delta\mathbf r$, with every reused resource occurrence identified. The exact-ledger branch assumes $\Delta\mathbf r=0$.
4. Every admitted information-bearing inter-port influence still uses the declared paid links. The physical source's complete transport menu obeys the same causal-path bound, and the mapped path compiler attains each path charge.

Then replacing each heat primitive by its mapped physical call defines a total map of all admitted finite adaptive endpoint protocols, preserving the original and registered null laws, state/update maps, records, times and units. Its resource vector is the original vector plus $\Delta\mathbf r$, and equals the original vector on the exact-ledger branch. It binds the heat-node roles to the qualified nodes in item 1. The link-coordinate metric, logarithmic generator, direct probes, cell maps and common-core continuum conclusions of Theorem C.6c.4a transfer under these identifications. The rational-tick route retains precisely the error and clock of Proposition C.6c.4b, and the retained-time domain stays subject to Proposition C.6c.4c.

For an approximate substitution, retain exact initialization, record typing and clock conventions, and compare normalized instrument channels on one common full carrier, including their classical outcome registers and all spectators. If call $j$ has half-diamond error at most $\varepsilon_j$, every length-$m$ protocol has complete-record total-variation error at most
$$
\min\left\{1,\sum_{j=1}^m\varepsilon_j\right\}.
\tag{C.6c.4e.2}
$$
For an adaptive tree, use the largest sum along any branch. Consequently a heat macro with error at most $\varepsilon_n$ at period $\Delta_n$ contributes at most $\lfloor T/\Delta_n\rfloor\varepsilon_n$ on a bounded dimensionless time window $T$. A sufficient uniform vanishing-error condition is $\varepsilon_n=o(\Delta_n)$. The rational-tick comparison adds its segment total-variation bounds from (C.6c.4b.1).

*Proof.* Equation (C.6c.4e.1) holds on the whole encoded state, including all auxiliary factors. Extend it by every spectator identity. For a sequence of outcome labels, apply the identity to its first unnormalized branch state, then to its second, and continue. The resulting unnormalized final states are intertwined by $E$. Their traces agree, so the probability of the complete sequence agrees. Adaptive policies choose the next primitive from the same preceding labels, so induction on the finite protocol tree proves the same statement for every adaptive branch. The initial and final maps give the retained preparations, state responses and readouts. Applying this argument to each declared null protocol proves its own law without identifying a null with the original dynamics. The additional intertwiners in item 2 preserve the full predictive-loop structure. Item 1 supplies qualification and original-complexity minimality for the actual coupled nodes to which this structure is mapped.

The occurrence inventory in item 3 preserves the additive count and integral coordinates; allocated memory and its maintained intervals are counted by their owner rather than once per gate use. The registered joint schedule and full generator records preserve the peak-strength and pulse-action coordinates with their stated aggregation rules. These coordinate identities preserve the fixed-unit scalarization. Item 3 preserves each complete macro's start and completion boundaries, including additional operations; its joint schedule also preserves the internal clock records. Callwise duration equality and the whole-macro boundary condition therefore use the same physical time normalization. These facts also cover initial setup, final collection and cleanup. If a new operation has an incremental resource vector, the same argument gives the original vector plus that increment; equality to the original vector uses the final clause of item 3. Item 4 and the paid-path proof in Theorem C.6c.4a give both inequalities for the transport metric. Endpoint-channel equality with the same clock gives the same self-adjoint logarithm. Probe expectations and the finite state/measure/pairing maps transfer through the state/readout identities. Their common-core limit then follows from the already established estimates in Theorem C.6c.4a. The finite-tick and positive-latency conclusions retain their respective source-clock assumptions. A serial extension that moves a completion boundary fails item 3 and needs a separate recalibrated clock and generator comparison.

For the error statement, include the controller and preceding records in the state so that each adaptive call is a block-controlled normalized channel. Replace the ideal calls by physical calls one at a time. The diamond norm is stable under spectators and is contractive under pre- and postcomposition by normalized channels. Each replacement therefore changes the final state by trace distance at most $\varepsilon_j$. The triangle inequality proves the sum, and trace distance is at most one. For a tree with branch-dependent bounds, the same induction weights each successor error by its branch probability; their weighted sum is bounded by the largest root-to-leaf error sum. Measurement of the complete record contracts trace distance to total variation. There are at most $\lfloor T/\Delta_n\rfloor$ completed macros; substitution gives the stated sufficient condition. A triangle inequality combines this implementation error with the rational-tick comparison. ∎

The macro-error rate in Theorem C.6c.4e cannot be weakened to $\varepsilon_n\to0$ for arbitrary sources. For a two-state generator $L=\lambda(X-I)$, where $X$ exchanges the states, fix $\lambda,c>0$, choose $0<\Delta<1/(2c)$ and set $P_\Delta=e^{\Delta L}$ and
$$
\widetilde P_\Delta=P_\Delta\bigl((1-\varepsilon_\Delta)I+\varepsilon_\Delta X\bigr),
\qquad \varepsilon_\Delta=c\Delta,\quad c>0.
$$
The maximum row total-variation distance of these two one-step kernels is $e^{-2\lambda\Delta}\varepsilon_\Delta\to0$. On the antisymmetric vector, their $\lfloor T/\Delta\rfloor$-step eigenvalues are respectively $e^{-2\lambda\Delta\lfloor T/\Delta\rfloor}$ and that number times $(1-2c\Delta)^{\lfloor T/\Delta\rfloor}$. They converge to $e^{-2\lambda T}$ and $e^{-2(\lambda+c)T}$. Starting from either point mass, the limiting total-variation difference is $\tfrac12e^{-2\lambda T}(1-e^{-2cT})>0$. Thus a vanishing one-macro error can change the clock-normalized heat generator.

<a id="theorem-c6c5-degree-three-metric-energy-and-resolvent-realization"></a>**Theorem C.6c.5 (Degree-Three Metric, Energy and Resolvent Realization).** Let $X$ be a finite connected simple graph with at least two vertices, positive node masses $\mu_x$ of total mass one, positive symmetric conductances $c_{xy}$ and lengths $\ell_{xy}$. Use
$$
a_X(f)=\sum_{\{x,y\}}c_{xy}(f_x-f_y)^2=\langle f,-L_Xf\rangle,\qquad
\mathcal E_X=a_X/2.
$$
At $x$, replace the vertex by a full binary tree with $q_x$ leaves, where $q_x$ is the least power of two at least $\max(2,\deg x)$, and $k_x=2q_x-1$ vertices. Assign distinct leaves to base edges and join their ports with the original conductance and length. Give each tree vertex mass $\mu_x/k_x$, each internal edge conductance $\lambda>0$, and positive internal lengths with tree diameter at most $\eta$. The resulting graph $H$ has degree at most three and mass pushforward $\pi_*\nu=\mu$. Define
$$
Jf=f\circ\pi,\qquad(Pu)_x=k_x^{-1}\sum_{v\in T_x}u_v,\qquad
\rho=\frac{D\max_x\mu_x}{\lambda},\quad
\beta=\frac{2D\max_x\sum_yc_{xy}}{\lambda},
$$
where $D$ is the maximal combinatorial tree diameter. Then $J$ is an isometry, $P=J^*$, $PJ=I$, and
$$
\mathcal E_H(Jf)=\mathcal E_X(f),\quad
\|u-JPu\|^2\le\rho a_{\mathrm{int}}(u),\quad
a_X(Pu)\le(1+\beta)a_H(u),
\tag{C.6c.5.1}
$$
$$
|a_H(u,Jg)-a_X(Pu,g)|\le\sqrt{\beta a_{\mathrm{int}}(u)a_X(g)}.
\tag{C.6c.5.2}
$$
For $A_H=-L_H$, $A_X=-L_X$, $z>0$, $u=(A_H+z)^{-1}Jf$ and $v=(A_X+z)^{-1}f$,
$$
\|Pu-v\|\le\frac{\sqrt\beta}{4z}\|f\|,\qquad
\|u-Jv\|^2\le\left(\frac\rho{4z}+\frac\beta{16z^2}\right)\|f\|^2.
\tag{C.6c.5.3}
$$
The metrics satisfy, for $\ell_{\min}=\min\ell_{xy}$,
$$
d_X(\pi v,\pi w)\le d_H(v,w)
\le(1+\eta/\ell_{\min})d_X(\pi v,\pi w)+\eta.
\tag{C.6c.5.4}
$$

For the sequence of Theorem C.6c.4 take $c_{x,x+\delta s}=\delta^4a_n(s)$, $M_n=|S_m|$, $q_n=2^{\lceil\log_2M_n\rceil}$, $k_n=2q_n-1$, $D_n=2\log_2q_n$, internal conductance $\lambda_n=1$ and every internal length exactly $\delta$. Then
$$
\rho_n=D_n\delta^4,\qquad\beta_n\le16D_n\delta^2,\qquad D_n=O(\log n),
$$
and the sharper common metric estimate is
$$
r\le d_{H_n}(v,w)\le A_nr+b_n,\quad r=d_0(\pi v,\pi w),\quad
A_n=1+\frac{D_n+2}{m-2},\quad b_n=(2D_n+2)\delta.
\tag{C.6c.5.5}
$$
Thus the degree-three graphs have the same measured-GH limit and fixed-scale noncollapse. With cell-compatible interpolation, their energies Mosco-converge to $\mathrm{Ch}_{\mathbb T^4}$, energy-plus-norm bounded sequences are precompact, and their heat and resolvent responses converge strongly. For sufficiently large $n$ and $\max(h_n,16\delta)\le r\le1/100$,
$$
\fint_{B_r^{H_n}(v)}|u-u_{B_r}|^2d\nu_n
\le64^4\left(1+\frac{50}{1-\theta}\right)r^2
\fint_{B_{7r}^{H_n}(v)}\Gamma_{H_n}(u)d\nu_n.
\tag{C.6c.5.6}
$$

*Proof.* Constant fiber fields have zero internal differences and exactly the old external differences. Averaging masses proves the adjoint and isometry identities. For $v,w\in T_x$, Cauchy–Schwarz along at most $D$ tree edges gives $|u_v-u_w|^2\le D a_{\mathrm{int},x}(u)/\lambda$. Averaging over $w$ bounds $|u_v-(Pu)_x|^2$ by the same quantity; summing masses proves the variance bound. Write $e_v=u_v-(Pu)_{\pi v}$. Then
$$
\sum_{\{x,y\}}c_{xy}(e_{v(x,y)}-e_{v(y,x)})^2\le\beta a_{\mathrm{int}}(u).
$$
The weighted Euclidean triangle inequality gives $\sqrt{a_X(Pu)}\le\sqrt{a_{\mathrm{ext}}(u)}+\sqrt{\beta a_{\mathrm{int}}(u)}$, proving (C.6c.5.1); its bilinear version gives (C.6c.5.2). Polarization also gives $PA_HJ=A_X$.

The resolvent equation yields $a_H(u)+z\|u\|^2=\langle Jf,u\rangle$, so $a_H(u)\le\|f\|^2/(4z)$. Test with $Jg$, subtract the base equation and choose $g=Pu-v=w$. Equation (C.6c.5.2) gives $z\|w\|^2+a_X(w)\le\sqrt{\beta a_{\mathrm{int}}(u)a_X(w)}$. Maximizing $c\sqrt y-y$ gives $z\|w\|^2\le\beta a_{\mathrm{int}}(u)/4$. Orthogonally decomposing $u-Jv=(u-JPu)+Jw$ proves both bounds in (C.6c.5.3). Projection of a path discards internal motion and proves the metric lower bound. Lift a base shortest path with at most $d_X/\ell_{\min}$ edges, connecting its ports and two endpoints inside their trees. Each of the at most $d_X/\ell_{\min}+1$ connections costs at most $\eta$, proving (C.6c.5.4).

For the torus construction, $Q_m\ge M_n$ gives $\sum_sa_n(s)\le8\delta^{-2}$ and the bounds for $\rho_n,\beta_n$. Since $M_n\le(2m+1)^4$, $D_n=O(\log n)$. Use the rounded straight route from Theorem C.6c.4, with at most $j=\lceil r/[\delta(m-2)]\rceil$ external edges. Its base cost is at most $r+2j\delta$ and its at most $j+1$ tree connections cost at most $(j+1)D_n\delta$. This proves (C.6c.5.5), including coincident projected endpoints. Here $A_n\to1$, $b_n\to0$; exact mass pushforward proves measured convergence and the ball inclusions give fixed-scale noncollapse.

Split each grid cell measurably into $k_n$ equal-volume subcells, one for each tree vertex, and interpolate constantly there. The squared $L^2$ distance from base-cell interpolation of $Pu$ is at most $2\rho_n\mathcal E_H(u)$. Thus bounded-energy sequences and their base averages have the same weak limits. The base liminf and $\mathcal E_X(Pu)\le(1+\beta_n)\mathcal E_H(u)$ prove the new Mosco liminf. Lift base recovery sequences by $J$; their energies and interpolants agree exactly, proving recovery. Base compactness and the same variance estimate prove compactness. Resolvents minimize $\mathcal E_H(u)+(z/2)\|u-f\|^2$; liminf, recovery and strict convexity give strong convergence to the unique limit minimizer. Density of the cell spaces and resolvent contraction extend this to all $L^2$ data. The uniform scalar spectral approximation $(1+x/p)^{-p}\to e^{-x}$ on $[0,\infty)$ then passes implicit Euler powers to heat semigroups. Uniformity follows by fixing a large cutoff, using uniform convergence on the compact interval and monotonicity to bound both tails by their values at the cutoff.

For PI, write $x=\pi v$. The projection bound gives $B_r^H(v)\subset\pi^{-1}B_r^X(x)$. Variance about the mean on this full-fiber set splits into fiber variance plus base variance. The first is bounded by $\rho_n$ times internal energy; the second is at most $25r^2/(1-\theta)$ times the base $\Gamma_X$ integral over $B_{5r}^X$. Its contributing edges have both endpoints in $B_{6r}^X$, because jumps are at most $h_n\le r$. Apply the localized form comparison (C.6c.5.1) on these edges and their whole endpoint fibers. From (C.6c.5.5), for large $n$ these fibers lie in $B_{7r}^H$, since $A_n\le13/12$ and $b_n/h_n\le1/4$ eventually. With $\beta_n\le1$ and $\rho_n\le r^2$, the unnormalized bound is $[1+50/(1-\theta)]r^2\int_{B_{7r}^H}\Gamma_H$. The same metric estimate contains all fibers over $B_{r/2}^X$ in $B_r^H$. Equation (C.6c.4.3) therefore gives volume ratio at most $(8r/(r/8))^4=64^4$, proving (C.6c.5.6). ∎

<a id="corollary-c6c5a-curvature-failure-of-the-constant-fiber-lift-and-a-resolvent-corrector"></a>**Corollary C.6c.5a (Curvature Failure of the Constant-Fiber Lift and a Resolvent Corrector).** On the degree-three sequence, $\Gamma_H(Jf)$ and $L_H(Jf)$ vanish at every internal vertex without an external edge. Moreover for $f(x)=\sin(2\pi x_1)$,
$$
\int\Gamma_{2,H_n}(Jf)d\nu_n
\ge16k_n(1-\theta)^2\delta^{-2}\longrightarrow\infty.
\tag{C.6c.5.7}
$$
For a smooth $f$, let $f_n$ be base sampling, fix $z>0$, and instead put
$$
g_n=(A_X+z)f_n,\qquad u_n=(A_H+z)^{-1}Jg_n,\qquad
\varepsilon_n=\left(\frac{\rho_n}{4z}+\frac{\beta_n}{16z^2}\right)^{1/2}\|g_n\|.
$$
Then $\|u_n-Jf_n\|\le\varepsilon_n\to0$, $\|A_Hu_n-JA_Xf_n\|\le z\varepsilon_n$, and
$$
\left|\int\Gamma_{2,H_n}(u_n)d\nu_n-\|A_Xf_n\|^2\right|
\le2z\varepsilon_n\|A_Xf_n\|+z^2\varepsilon_n^2\longrightarrow0.
\tag{C.6c.5.8}
$$

*Proof.* On any finite reversible graph integration by parts gives $\int\Gamma_2(u)d\nu=\|Lu\|^2$. Each used port of a constant-fiber field has exactly one nonzero external difference, giving $\|L_HJf\|^2=k_n\sum_x\mu_x\sum_sa_n(s)^2|\Delta_{\delta s}f(x)|^2$. Each of the two coordinate increments in direction $e_1$ has squared grid average $2\sin^2(\pi\delta)$, so the sum is at least $4k_n(1-\theta)^2\delta^{-4}\sin^2(\pi\delta)$. Since $\sin(\pi\delta)\ge2\delta$, (C.6c.5.7) follows. For the corrector apply (C.6c.5.3) to $g_n$ and use $A_Hu_n-JA_Xf_n=-z(u_n-Jf_n)$. Theorem C.6c.4 bounds $\|g_n\|$ and gives strong convergence of $A_Xf_n$ to $-\Delta f$. Squaring the generator bound and using integration by parts proves (C.6c.5.8); the energy convergence follows from $2\mathcal E_H(u_n)=\langle u_n,A_Hu_n\rangle$. ∎

The corrector proves unweighted integrated $\Gamma_2$ convergence. Spatially weighted $\Gamma_2$ tests and radius-two local curvature transfer require a further corrected-field estimate. The graph has exactly $n^4k_n=O(n^6)$ vertices, each internal jump rate is $k_n\delta^{-4}=O(n^6)$, and all internal propagation lengths equal $\delta$. These explicit growing resources enter the formal source/admission ledger of a degree-three MPU realization.

<a id="proposition-c6c5b"></a>

<a id="proposition-c6c5b-spatially-weighted-curvature-transfer-by-a-tree-corrector"></a>**Proposition C.6c.5b (Spatially Weighted Curvature Transfer by a Tree Corrector).** Use the degree-three port trees, masses, external conductances, internal lengths $\delta$ and projection of Theorem C.6c.5 on the flat four-torus sequence of Theorem C.6c.4. Give each internal edge conductance $\lambda=\delta^{-2}$. For every smooth real test $f$ there is an explicitly computed corrected lift $F_\delta$ on the raw bounded-degree graph, with no change of its generator, such that $F_\delta\to f\circ\pi$ and $L_HF_\delta\to(\Delta f)\circ\pi$ uniformly. For every smooth real weight $w$ and smooth real tests $f,g$ one has
$$
\begin{aligned}
\int (w\circ\pi)\Gamma_H(F_\delta,G_\delta)\,d\nu
&\longrightarrow\int_{\mathbb T^4}w\,\nabla f\cdot\nabla g\,dx,\\
\int W_\delta\,\Gamma_{2,H}(F_\delta)\,d\nu
&\longrightarrow\int_{\mathbb T^4}w\,\|\nabla^2 f\|_{\mathrm{HS}}^2\,dx.
\end{aligned}
\tag{C.6c.5.9}
$$
Here $W_\delta$ is the same corrected lift of the smooth weight. These are spatially weighted tests of the raw generator on explicit corrected fields. The uncorrected pointwise radius-two defect of (D.6e.1) is a different test and can still fail as in Proposition F.0z.5.

*Corrector on one tree.* Write $\delta=1/n$, let $k$ be the number of ports per base vertex and $D$ their tree diameter in edges. The flat sequence has $k=O(\delta^{-2})$, $D=O(|\log\delta|)$ and common base mass $\mu_x=\delta^4$. Write $L_H=L_{\rm int}+L_{\rm ext}$ for the generator splitting the internal and external edges, and use the constant-fiber inclusion $J$ of Theorem C.6c.5. For base sampling $f_n$ define $u_f$ on each tree by
$$
L_{\rm int}u_f=JL_X f_n-L_{\rm ext}Jf_n,\qquad Pu_f=0,
\qquad F_\delta=Jf_n+u_f.
\tag{C.6c.5.10}
$$
The right side has zero mass sum on each tree because $PL_{\rm ext}J=L_X$. This is precisely the identity from the matching conductances and masses. The internal connected-tree generator has kernel the constants, so the normalized solution exists and is unique. For an explicit construction, multiply the right side by the port mass $\delta^4/k$. An oriented edge current is the sum of the resulting forcing over the subtree on its tail side, with the sign fixed by $L_{\rm int}$. The voltage drop is that current divided by $\lambda$. Integration along the tree and subtraction of its mean gives $u_f$.

For $C_f$ depending on fixed spatial derivatives of $f$, the total absolute mass-weighted forcing on one fiber is at most $C_f\delta^3$. Indeed the dense-stencil rates are $a_n(s)$ from Theorem C.6c.4. Their first absolute physical moment is at most $C/\delta$ by the minimum step length $\delta$ and the exact second moment. The external term therefore has mass-weighted absolute sum at most $C_f\delta^4/\delta$. The base generator term is $O(\delta^4)$ by the second-order consistency of the same rates. It follows that
$$
\|u_f\|_\infty\le C_f D\delta^3/\lambda.
\tag{C.6c.5.11}
$$
Each used port has only one external edge, of rate at most $Ck\delta^{-2}$, since its mass is $\delta^4/k$ and each base rate is at most $C\delta^{-2}$. Equations (C.6c.5.10) and (C.6c.5.11) give
$$
\|L_HF_\delta-JL_Xf_n\|_\infty
=\|L_{\rm ext}u_f\|_\infty\le C_f Dk\delta/\lambda.
\tag{C.6c.5.12}
$$
With $\lambda=\delta^{-2}$ this is $O_f(D\delta)$. The base generator converges uniformly on the smooth core by Theorem C.6c.4. The internal energy estimate follows by pairing (C.6c.5.10) with $-u_f$ at each tree and using the absolute forcing bound. Summing over the $\delta^{-4}$ trees gives $a_{\rm int}(u_f)\le C_fD\delta^2/\lambda$. For the external energy, use the sup bound and the sum of all base conductances, which is $O(\delta^{-2})$, to obtain $a_{\rm ext}(u_f)\le C_fD^2\delta^4/\lambda^2$. Thus $a_H(u_f)\to0$ as well. The bounds apply also to $g$ and $w$.

*Weighted energy and curvature.* For any bounded weight, the difference of the integrated raw $\Gamma_H$ bilinear pairings for $(F_\delta,G_\delta)$ and for $(Jf_n,Jg_n)$ is bounded by the weight sup norm times a sum of Cauchy–Schwarz energy products with one corrected difference. All these products tend to zero by the preceding estimates and bounded base energies. At the constant-fiber pair, summing against a constant-fiber weight gives exactly the weighted base pairing, since each external conductance is retained and each internal difference vanishes. A smooth base weight gives its continuum integral by the fixed second moment, Taylor expansion and Riemann sums. Uniform perturbations in the weight make a vanishing change, again by the energy bound. This proves the first limit of (C.6c.5.9).

For any finite reversible generator and real functions $U,F$, integration by parts gives the exact identity
$$
\int U\,\Gamma_2(F)\,d\nu
=\tfrac12\int (LU)\Gamma(F)\,d\nu
  +\int U(LF)^2\,d\nu
  +\int (LF)\Gamma(U,F)\,d\nu.
\tag{C.6c.5.13}
$$
For a direct verification of (C.6c.5.13) without a diffusion chain rule, let $dA=A(y)-A(x)$ on an oriented edge. The exact identity $d(AB)=A(x)dB+B(x)dA+dA\,dB$ gives
$$
\int\Gamma(U\,LF,F)\,d\nu
=\int U\Gamma(LF,F)\,d\nu+\int (LF)\Gamma(U,F)\,d\nu
+\tfrac12\sum_{x,y}\nu_x r_{xy}dU\,d(LF)\,dF.
$$
The ordered cubic sum is zero by reversibility because all three differences reverse sign when $x,y$ are exchanged. Integration by parts evaluates the left side as $-\int U(LF)^2d\nu$. Substituting this and using reversibility on the term $\tfrac12\int U L\Gamma(F)$ proves (C.6c.5.13).

Apply (C.6c.5.13) with $F=F_\delta$ and the corrected weight $U=W_\delta$. Uniform convergence of the two generators and the first weighted energy limit identify the right side with the flat continuum counterpart, hence with $\int w\|\nabla^2f\|_{\rm HS}^2$. The weights $W_\delta$ converge uniformly to $w\circ\pi$. When $w\ge0$, add the upper bound in (C.6c.5.11) for $\|u_w\|_\infty$ to $W_\delta$. This makes it nonnegative, preserves its generator, and changes its weighted curvature integral by at most this bound times $\int\Gamma_{2,H}(F_\delta)d\nu=\|L_HF_\delta\|^2$. The change vanishes. The generator estimate for the weight is essential because the first term of (C.6c.5.13) contains $LU$. This proof leaves the comparison with the raw weight $Jw_n$ and the uniform pointwise curvature test as separate predicates. ∎

<a id="theorem-c6c5c"></a>

<a id="theorem-c6c5c-bounded-degree-flat-metric-energy-and-polynomial-curvature-source"></a>**Theorem C.6c.5c (Bounded-Degree Flat Metric–Energy and Polynomial-Curvature Source).** There is a finite qualified endpoint source of maximum port degree eleven on each nested grade $n=3^{2j}$, whose paid propagation metrics converge to the flat four-torus and whose actual reversible heat forms Mosco-converge to its quadratic Cheeger energy. The source has vanishing raw pointwise polynomial-core curvature defect, full supported polynomial assembly, uniform compact-controller recovery and vanishing fixed-chart rigidity in the senses of (D.6e.1)–(D.6e.4). It is a declared alternative to the varying-degree timer graph in Theorem 43.5j. Its geometric source uses the descriptor-rate independence of Definition C.6c.4a. The finite curvature claim concerns the registered lifted affine and quadratic chart functions, with support assembly defined below.

*One physical graph.* Write $\delta=1/n$, $R=\sqrt n$, $h=\delta R$, and $X=(\delta\mathbb Z/\mathbb Z)^4$. Let $F$ be a full binary port tree with the least power of two leaves sufficient to assign a distinct leaf to each sign pair $\{s,-s\}$ with $s\in\mathbb Z^4$, $0<|s|\le R$. Let $k$ be its number of vertices and $D$ its combinatorial diameter. Thus $k=O(R^4)=O(\delta^{-2})$ and $D=O(1+|\log\delta|)$. The physical graph has vertices $(x,v)\in X\times F$ and gives each mass $\delta^4/k$. Its edges and rates are as follows, with identical rates in both directions.

1. For each port label $v$ place all eight axis edges $((x,v),(x\pm\delta e_i,v))$, of length $\delta$ and rate $\delta^{-2}$.
2. For each tree edge $v\sim w$ place the edge $((x,v),(x,w))$, of length $\delta$ and rate $M=\delta^{-6}$.
3. For the assigned leaf $v_s$, place the edges $((x,v_s),(x\pm\delta s,v_s))$, of length $\delta|s|$ and rate $\epsilon=\delta^{12}$. If $s$ is an axis unit vector these edges are already present, so omit the duplicate shortcut and retain its axis rate.

At an internal vertex there are at most eight axis and three tree edges. At a used leaf there are at most eight axis, one tree and two shortcut edges. Thus the total degree is at most eleven. Every occurrence is an actual finite source port; the four geometric chart coordinates are $x$ on every port in its fiber, and distinct ports remain distinct physical records. Use descriptors $\pm e_i$ on the corresponding axes, an independently named unit descriptor with opposite signs on every tree edge, and $\pm s$ on shortcuts. The lengths are the measured busy-lane lengths in Definition C.6c.4a at common physical length scale $\delta$. That definition permits nonzero descriptors independently of the chart-coordinate differences and permits independent rational reversible rates. An internal port thus has positive paid separation, even when its projected geometric position is the same. All base-edge and tree rates are exact rational numbers.

*Metric, measure and rigidity.* Let $\pi(x,v)=x$ and let $d_H$ be the physical descriptor-path metric. Every projected step has flat torus distance at most its actual paid length, so $d_0(\pi z,\pi z')\le d_H(z,z')$. For the reverse comparison choose a shortest flat lift of $x'-x$ of length $r$, break it into $J\le r/[\delta(R-2)]+1$ equal segments, and round each intermediate point to the nearest grid point. A rounded step differs from its segment by at most $2\delta$ in four dimensions and has length at most $\delta R$. Drop zero steps. Every other step has a corresponding shortcut or axis route on some port layer. Switching to the selected layer at each successive point costs at most $D\delta$, with at most $J+1$ fiber switches. Hence
$$
d_0(\pi z,\pi z')\le d_H(z,z')
\le\left(1+\frac{D+2}{R-2}\right)d_0(\pi z,\pi z')+(2D+2)\delta.
\tag{C.6c.5.14}
$$
For equal projected endpoints the direct tree route gives the same bound. This argument uses only positive actual paths. The measure pushforward is exactly the original grid measure. Equation (C.6c.5.14) and the $O(\delta)$ grid covering radius give measured Gromov–Hausdorff convergence. For a fixed chart radius interval $r_-\le r\le r_+$ below the flat injectivity radius, each raw ball projects into the flat ball of radius $r$, and contains all fibers over the flat grid ball of radius $(r-(2D+2)\delta)/(1+(D+2)/(R-2))$. Radial contraction within the flat chart and grid rounding give the corresponding ball distortion and volume-ratio errors bounded by $C_{r_-}[(D+2)/(R-2)+(D+1)\delta]$. This supplies uniform chart convergence and fixed-radius noncollapse. Its normalized harmonic-coordinate excess is checked below using the same residual, Gram and interpolation convention as Theorem D.6f.2m.

*Raw polynomial curvature.* Decompose the actual heat generator as $L=L_0+S$, where $L_0=L_{\rm ax}+L_F$ is the product of the identical axis generator on every layer and the tree generator at each grid point. The shortcut generator $S$ has rate at most $\epsilon$ on each of its at most two edges at any port. A lifted coordinate polynomial $P(x)$ is constant in $v$, and $L_F$ vanishes on $P$, $L_{\rm ax}P$ and $\Gamma_{\rm ax}(P)$. Therefore $\Gamma_{2,0}(P)=\Gamma_{2,\rm ax}(P)$ pointwise, with no error from the large internal rate. In a lifted chart, let $A$ be the symmetric Hessian of an affine or quadratic polynomial. For the symmetric axis rates, the translation-commuting jump identity is
$$
\Gamma_{2,\rm ax}(P)=\tfrac14\sum_{s,t\in\{\pm e_i\}}\delta^{-4}\bigl(\Delta_{\delta s}\Delta_{\delta t}P\bigr)^2
=\|A\|_{\rm HS}^2,\qquad L_0P=\operatorname{tr}A.
\tag{C.6c.5.15}
$$
Indeed each second difference is $\delta^2s^\mathsf TAt$, and the four sign combinations for each pair of axes cancel the prefactor. Cauchy–Schwarz gives $\|A\|_{\rm HS}^2\ge(\operatorname{tr}A)^2/4$. These identities hold at every actual port, including each shortcut leaf. For all sufficiently fine grades the projection of any raw radius-two neighborhood lifts to one chart, since its spatial jumps have length at most $h\to0$. The polynomial coefficient norm is the fixed chart norm at that center, with the projected spatial coordinates and with the port labels retained as physical supports. Thus its values on the radius-two neighborhood are bounded by a constant independent of the grade.

For an arbitrary test with that bound, write $\Gamma=\Gamma_0+\Gamma_S$. On the two-step neighborhoods $\|L_0\|_{\infty\to\infty}\le16\delta^{-2}+6M$, $\|S\|_{\infty\to\infty}\le4\epsilon$. The bilinear edge definitions give analogous $C(\delta^{-2}+M)$ and $C\epsilon$ bounds for $\Gamma_0$ and $\Gamma_S$ as products of sup norms. Expanding $\tfrac12L\Gamma(P)-\Gamma(P,LP)$ gives four cross terms with one $S$ and two terms involving two shortcut factors, each bounded by $C[(\delta^{-2}+M)\epsilon+\epsilon^2]$. The same bound holds for the difference of the two squared generator expressions in (D.6e.1). With the stated powers this is $O(\delta^6)$. Equation (C.6c.5.15) gives a nonpositive unperturbed deficit at $K=0$, so the raw squared positive-part defect is $O(\delta^{12})$. This is a uniform pointwise calculation on the actual generator, not a projected curvature comparison. It requires the prescribed polynomial probes to use one common lifted polynomial on the two-step neighborhood, including where two different paths reach the same port.

The axis generator annihilates each lifted coordinate. The $+s$ and $-s$ shortcuts cancel in the coordinate generator at every leaf, so the raw harmonic residual is zero. The Gram of those coordinate functions under $\Gamma$ is $I_4$ on unused layers and $I_4+\epsilon\delta^2ss^\mathsf T$ on each used shortcut layer. Its operator error is at most $\epsilon h^2$. Split each base grid cell into $k$ equal-volume measurable subcells for its port copies and use constant interpolation on them. The coordinate interpolation error is $O(\delta/r_-)$ on the normalized chart range. Together with (C.6c.5.14) this gives the vanishing rigidity defect, including the harmonic-coordinate residual.

*Core assembly, recovery and actual form operators.* Fix the localized support convention of Proposition D.6f.2j at each actual port, with constant polynomial coefficient allowed and that port's singleton support function. The supported constant gives its $\delta$ vector. Their assembled span is all functions of the actual port labels, so the finite-core defect in (D.6e.2) vanishes. This assembly is a global supported spanning convention. The local curvature probe at a specified center is the uncut common polynomial used in (C.6c.5.15), not a supported $\delta$ vector. No coefficient matching across different local centers is imposed. The distinction is the same as the supported assembly and local curvature tests in Theorem D.6f.2m.

With $P_F$ denoting fiber averaging, Jensen on the $k$ identical axis layers gives $\mathcal E_{\rm ax}(P_F u)\le\mathcal E_H(u)$. For each tree, the variance about its mean is bounded by its combinatorial diameter times the sum of squared tree-edge differences. Since the internal conductance is $\lambda_F=M\delta^4/k$ and the base mass is $\delta^4$, the total squared $L^2$ discrepancy of $u$ from its constant-fiber lift is at most $(Dk/M)a_F(u)$. Here $a_F=2\mathcal E_F$ and the factor $Dk/M=O(D\delta^4)$ tends to zero. The interpolated axis forms converge to the flat Cheeger form by the exact Fourier multiplier $4\delta^{-2}\sum_i\sin^2(\pi\delta b_i)$. On centered grid frequencies it is bounded above and below by fixed multiples of $|b|^2$, and on each fixed frequency it tends to $4\pi^2|b|^2$. The finite-frequency liminf, smooth recovery and uniform tail compactness follow. For a smooth sampled $f$ on a constant-fiber lift the tree energy vanishes and its shortcut energy is bounded by $C_f\epsilon h^2$ since there are at most two jumps per port and total mass is one. Thus the same smooth recovery applies to the raw form. The variance bound and Jensen give the raw weak liminf and energy-plus-norm compactness. Density and a common diagonal yield Mosco convergence. The closed nonnegative form operators and their heat semigroups then have the convergences of Theorem 35b.6 on the given varying cell spaces, with dense continuum form domain. The limit is the flat Riemannian torus with its own noncollapsed $\mathrm{RCD}(0,4)$ structure. This statement uses the flat limit directly, and does not require a full-function finite-graph $\mathrm{BE}(0,4)$ inequality.

For the uniform (D.6e.3) recovery test use the compact regular controller family and the registered finite Fourier Fejér approximation of Theorem D.6f.2m on the base coordinates, evaluated at the actual port labels by constant-fiber copying. The fixed common $C^2$ envelope gives uniform convergence of that approximation and its first derivatives, with finite quantitative bounds from the same Fejér coefficient rule. Axis sampling changes the first difference by $O(\delta)$ under the common Hessian bound, and the interpolation error is also $O(\delta)$. The additional raw shortcut energy is uniformly $O(\epsilon h^2)$ for the normalized controller class. This proves the claimed uniform recovery on that class. The full normalized Lipschitz ball and any different controller-access rule retain the qualifications of Theorems D.6f.2k–D.6f.2m.

*Physical source and comparison.* The raw graph, its degrees, reversible rational rates, rational masses and integer descriptors are admissible inputs of Definition C.6c.4a and Theorem C.6c.7. Choose $\Delta_j=n^{-8}/128$, so $\Delta_j(8\delta^{-2}+3M+2\epsilon)\le1/8$ and the diagonal period test holds. Fixed integer-multiple qualification times in the positive heat-clock unit then use integral period indices at every grade. The compiled finite heat kernel is exactly $\exp(\Delta_j L)$, with the same positive physical source-time units at each level. The independently qualified P17 ready-cell attachment and paid path identity use the graph-general endpoint circuit of Theorems 35b.16 and C.6c.7, as in the graph-port application of Corollary C.6c.7.1. The qualified ready cells, link carriers, finite drive and pointer supports, archive ownership, rates, clocks and declared stopped branches remain in that record. All ports and edge lanes have positive allocated physical stock. No limit-independent bound is claimed for the finite heat-drive peak or total cost.

For a global-core competitor on a normal reservation branch, take the entire compact metric-controller and forecast menus of the normal source of Theorem D.6f.2m as its teacher task, and reserve the just-described graph apparatus as an additional fixed service before comparison. On this alternative branch the paid geometry is fixed independently of the metric control inside that teacher task, rather than requiring the teacher's metric control to change its graph. The complete teacher risk still equals its full positive quadratic forecast excess plus the common normal mean value. Under the same four-price reservation law, all graph, qualification, readout and finite-control resources and their common task benefits are included in a common additive constant at fixed grade and common horizon. Thus the teacher-mean configuration attains the minimum on this fixed-geometry declared source. The comparison does not claim a minimum over other graph architectures or the variable-metric geometric laws of Theorem D.6f.2m. The selected flat source supplies all four stated defects and its Mosco and metric limits. ∎

<a id="corollary-c6c5d"></a>

<a id="corollary-c6c5d-raw-weighted-curvature-and-limiting-generator-domain"></a>**Corollary C.6c.5d (Raw Weighted Curvature and Limiting Generator Domain).** For the bounded-degree product source of Theorem C.6c.5c, use the actual raw graph generator, and write $J_nf=f|_{X_n}\circ\pi_n$ for the uncorrected constant-fiber sample of a fixed smooth torus function. For every smooth real $f$ and smooth bounded real weight $w$,
$$
\begin{aligned}
\int (J_nw)\Gamma_{H_n}(J_nf)\,d\nu_n&\longrightarrow\int w|\nabla f|^2\,dx,\\
\int (J_nw)\Gamma_{2,H_n}(J_nf)\,d\nu_n&\longrightarrow\int w\|\nabla^2 f\|_{\rm HS}^2\,dx,\\
\int (J_nw)(L_{H_n}J_nf)^2\,d\nu_n&\longrightarrow\int w(\Delta f)^2\,dx.
\end{aligned}
$$
The limiting weighted dimension-four Bakry–Émery inequality holds on the flat Laplacian's full $L^2$ generator domain, with every bounded nonnegative measurable weight. Each of these limiting tests has a diagonal of smooth sampled raw tests. The result concerns transfer to the limit and the stipulated smooth probes at finite grades.

*Proof.* Use $L=L_0+S$ of Theorem C.6c.5c. The fiber generator vanishes on $J_nf$, $JL_{\rm ax}f$ and $J\Gamma_{\rm ax}(f)$. Consequently the $L_0$, $\Gamma_0$ and $\Gamma_{2,0}$ tests are exactly the axis tests on the base. Every perturbation in $L$ or $\Gamma$ is bounded by $C_f\epsilon$ in sup norm. Expanding $\tfrac12L\Gamma-\Gamma(f,Lf)$ bounds the $\Gamma_2$ perturbation by $C_f[(M+\delta^{-2})\epsilon+\epsilon^2]=O_f(\delta^6)$, including at the shortcut leaves. The translation-commuting axis formula gives a sum of squares of divided double differences. For each pair of signed axes their double difference divided by $\delta^2$ tends uniformly to its signed Hessian entry, by the integral form of the two differences. Its squared sum tends to $\|\nabla^2 f\|_{\rm HS}^2$. The central second and first differences give the corresponding uniform Laplacian and carré du champ limits. The exact mass pushforward turns the weighted integrals into ordinary grid Riemann sums up to these uniform errors.

The flat generator domain is $H^2(\mathbb T^4)$ by its Fourier multiplier. Heat smoothing, or Fourier truncation, gives smooth $f_j\to f$ in $H^2$. The squared gradient, Hessian and Laplacian terms then converge in $L^1$ by Cauchy–Schwarz. For $w\in L^\infty$, $w\ge0$, convolve periodically with a smooth nonnegative approximate identity to give smooth $w_j$ with $0\le w_j\le\|w\|_\infty$ and almost-everywhere convergence. The $L^1$ bounds and dominated convergence pass each of the three pairings. In particular the pointwise matrix inequality $\|\nabla^2 f\|_{\rm HS}^2\ge(\Delta f)^2/4$ yields the integrated limiting inequality for all such $f,w$. For a finite list of these tests choose a common diagonal of raw graph grades after the smooth approximations, using the three uniform smooth-core limits above. The same construction on successively larger finite lists gives a common diagonal for a prescribed countable list. No correction of the graph field or weight is needed on this product sequence. A global finite-graph curvature inequality for arbitrary port-dependent functions is a separate statement. ∎

<a id="proposition-c6c5e"></a>

<a id="proposition-c6c5e-finite-curvature-obstruction-for-symmetric-bravais-stencils"></a>**Proposition C.6c.5e (Finite Curvature Obstruction for Symmetric Bravais Stencils).** Let a reversible translation-invariant jump generator in a flat $d$-dimensional chart have a finite symmetric jump set that spans $\mathbb R^d$, with positive equal rates on opposite jumps. At a vertex whose two-jump neighborhood has no quotient identifications beyond equality of displacement vectors, the generator fails the full-function $\mathrm{BE}(0,d)$ inequality. This holds for every choice of the rates. For diffusive stencils with at most $m$ jumps of length between $\eta h$ and $h$, where $0<\eta\leq1$, and diffusion matrices between fixed bounds $\lambda I$ and $\Lambda I$, any full-function $\mathrm{BE}(K_h,d)$ bound at such a vertex satisfies $K_h\leq-c h^{-2}$ for a constant $c>0$ depending only on $d,m,\eta,\lambda,\Lambda$. Thus a family of these stencils with $h\to0$ cannot supply the bounded finite-stage curvature constants of Theorem C.6c. The obstruction also applies if the rates and translations of the homogeneous stencil describe the generator at the chosen vertex and each of its one-jump neighbors.

*The local identity.* Write the physical jumps as $hs$ and their rates as $h^{-2}a_s$, with $a_{-s}=a_s>0$. At the chosen vertex translate the origin to $0$, set $D_s f(x)=f(x+hs)-f(x)$, and write
$$
C=\frac12\sum_s a_s ss^{\mathsf T},\qquad A=C^{-1}.
$$
The rate convention is $Lf(0)=h^{-2}\sum_s a_sD_sf(0)$. Expanding $\Gamma(f,g)=\tfrac12(L(fg)-fLg-gLf)$ and $\Gamma_2(f)=\tfrac12 L\Gamma(f)-\Gamma(f,Lf)$, and using the commuting translations in the two-jump neighborhood, gives
$$
\Gamma(f)(0)=\frac1{2h^2}\sum_s a_s(D_sf(0))^2,\qquad
\Gamma_2(f)(0)=\frac1{4h^4}\sum_{s,t}a_sa_t(D_sD_tf(0))^2.
$$
For $q(x)=\tfrac12 x^{\mathsf T}Ax$, the values on this neighborhood satisfy
$$
Lq(0)=\operatorname{tr}(CA)=d,\quad
\Gamma_2(q)(0)=\operatorname{tr}(CACA)=d,\quad
\Gamma(q)(0)=\frac{h^2}{8}\sum_s a_s(s^{\mathsf T}As)^2 .
$$
The first two identities use the actual second moment of the jump rates. Neighborhood values of each test extend by arbitrary values to the rest of the discrete carrier.

*A test on the outermost two-jump sites.* Expose a unique maximizer $v$ of a generic linear functional on the jump set. Symmetry gives positive maximum and unique minimizer $-v$. The sites $\pm2hv$ lie outside the one-jump set and the origin. The only ordered pair of jumps summing to $2hv$ is $(hv,hv)$, and the analogous assertion holds for $-2hv$. Put $\alpha=v^{\mathsf T}Av$ and subtract $h^2\alpha$ from the quadratic test at each of these two sites. The resulting test $f$ has $Lf(0)=d$ and $\Gamma(f)(0)=\Gamma(q)(0)>0$. Exactly the two extreme second differences change, each from $h^2\alpha$ to zero. It follows that
$$
\Gamma_2(f)(0)=d-\frac{a_v^2\alpha^2}{2},
\qquad
K_h\leq
-\frac{4a_v^2\alpha^2}{\sum_s a_s(s^{\mathsf T}As)^2}\,\frac1{h^2}.
$$
In particular, if a full-function $\mathrm{BE}(0,N)$ bound holds on this stencil, then $N\geq d^2/(d-a_v^2\alpha^2/2)>d$. The denominator is positive because the ordered pair $(v,-v)$ still has nonzero second difference and positive rate product. The first conclusion of the proposition uses no uniform comparison of jump lengths.

*Uniform bound for varying stencils.* Rescale the jumps by $h$. Label the opposite jump pairs and permit padding by zero rates in a list of at most $m$ entries. In the annulus $\eta\leq |s|\leq1$, the trace identity bounds every $a_s$ above by $2d\Lambda/\eta^2$. The parameter space of the normalized directions and nonnegative rates with $\lambda I\leq C\leq\Lambda I$ is compact. Limits may have coincident directions or zero rates. Merge coincident positive rates at a limit and discard zero rates. The surviving set is still symmetric and spanning, since its limiting matrix $C_*$ is positive definite.

At a limit choose an exposed direction $v_*$, and set $q_*(y)=\tfrac12y^{\mathsf T}C_*^{-1}y$. Choose a smooth function $g_*$ supported in disjoint small neighborhoods of $\pm2v_*$, taking the value $v_*^{\mathsf T}C_*^{-1}v_*$ at these two sites. Choose the neighborhoods to exclude the origin, the active one-jump sites and every other sum of two active directions at the limit. The normalized test $F_*=q_*-g_*$ has the strictly negative curvature deficit just computed, with $a_{v_*}$ equal to the merged rate. Its normalized $\Gamma$ is strictly positive. For the normalized generator with the nearby parameters, each of $LF_*(0)$, $\Gamma_2(F_*)(0)$ and $\Gamma(F_*)(0)$ is continuous in the full labeled tuple, by the local identities and continuity of $F_*$. Zero-rate directions do not affect the limit, even if their sites occur in the support of $g_*$. Thus there is an open neighborhood of each limit on which this fixed test bounds $(\Gamma_2-(L\cdot)^2/d)/\Gamma$ by a strictly negative constant. A finite subcover yields a common bound $-c<0$. On the physical carrier, use the test $f(hy)=h^2 F_*(y)$ on the local sites. Both $Lf$ and $\Gamma_2(f)$ retain their normalized values, and $\Gamma(f)$ equals $h^2\Gamma(F_*)$. The normalized bound therefore gives $K_h\leq-c h^{-2}$.

In $d=4$, the proposition excludes finite-range fixed Bravais stencils with uniformly elliptic diffusive covariance, including changes of their rates that cause some directions to disappear. It also excludes varying bounded-cardinality symmetric stencils under the stated comparison of jump lengths. A fixed finite stencil has that comparison after $h$ is taken as its largest jump length. The test concerns the full finite graph domain. The smooth-core and limiting integrated curvature estimates of Corollary C.6c.5d have their stated domains. The proof leaves open generators without a homogeneous two-jump neighborhood and changing stencil families outside the bounded-cardinality and jump-length assumptions of the uniform conclusion.

<a id="theorem-c6c5f"></a>

<a id="theorem-c6c5f-full-function-curvature-obstruction-on-reversible-periodic-covers"></a>**Theorem C.6c.5f (Full-Function Curvature Obstruction on Reversible Periodic Covers).** Consider a locally finite jump generator on a $\mathbb Z^d$-periodic carrier with finitely many vertex types and finitely many jump types. Assume the jump rates satisfy detailed balance with a positive periodic vertex measure and the finite type quotient is irreducible. If its effective diffusion matrix in harmonic coordinates has rank $d$, the generator fails the pointwise full-function $\mathrm{BE}(0,d)$ inequality at some vertex. In particular, full rank holds on a connected cover in which the $d$ deck translations give independent chart directions. For any fixed such generator scaled diffusively by $h^{-2}$, a full-function $\mathrm{BE}(K_h,d)$ bound requires $K_h\leq-c h^{-2}$ for some $c>0$. The same conclusion holds on finite quotients whose two-jump neighborhoods agree with those of the cover.

*Periodic harmonic coordinates.* Write a vertex as $(n,i)$, with $n\in\mathbb Z^d$ and $i$ its type, and use an invertible chart period matrix $B$. For $v=(n,i)$, let $w_{vu}\geq0$ be the jump rates in $Lf(v)=\sum_u w_{vu}(f(u)-f(v))$. Reversibility supplies a normalized positive type measure $\pi$ with $\pi_i w_{vu}=\pi_j w_{uv}$ for $u=(n+k,j)$. Pairing each directed jump type with its reverse gives zero $\pi$-mean for the drift of $Bn$. Solve the finite type Poisson equation for the periodic correction $\psi_i$ to obtain harmonic coordinates $X(n,i)=Bn+\psi_i$, with $LX=0$. If $z_{vu}=X(u)-X(v)$, set
$$
C_v=\frac12\sum_u w_{vu}z_{vu}z_{vu}^{\mathsf T},\qquad
\overline C=\sum_i\pi_i C_i .
$$
These matrices are periodic. On a connected cover, a vector in the nullspace of $\overline C$ would have constant inner product with $X$ along every edge, hence along every deck translation. The independence of the columns of $B$ then gives a zero vector. Under the rank assumption, apply $\overline C^{-1/2}$ to $X$ so that $\overline C=I$. Solve the finite type Poisson equation $L\chi=d-\operatorname{tr}C_v$ for a periodic $\chi$. For each $b\in\mathbb R^d$, the function
$$
q_b(v)=\tfrac12|X(v)-b|^2+\chi_v
$$
satisfies $Lq_b=d$. All tests below depend only on values on a two-jump neighborhood. They can be used at a vertex as functions of finite support by keeping those values.

*Consequences of the putative curvature inequality.* Suppose $\Gamma_2(f)(v)\geq(Lf(v))^2/d$ at every vertex for every test. Since $Lq_b=d$, the deficit for $q_b$ is $\tfrac12 L\Gamma(q_b)-d$. For each $a\in\mathbb R^d$, put $b=ta$ and consider this deficit as a polynomial in real $t$. Its quadratic coefficient at $v$ is $\tfrac12 L(a^{\mathsf T}C_v a)$ and must be nonnegative at every type. Its $\pi$-mean is zero, so it vanishes at each type. The irreducibility of the type generator makes $a^{\mathsf T}C_v a$ constant. This holds for all $a$, and $\overline C=I$ gives $C_v=I$ at every vertex. We may now use $\chi=0$.

With $\chi=0$ define the periodic quantities
$$
B_v'=\frac12\sum_u w_{vu}|z_{vu}|^2z_{vu},\qquad
D_v=\frac18\sum_u w_{vu}|z_{vu}|^4 .
$$
Direct expansion gives
$$
\Gamma(q_b)(v)=|X(v)-b|^2+(X(v)-b)\cdot B_v'+D_v.
$$
As $L|X-b|^2=2d$, the deficit is now affine in $b$. Its coefficient is $-\tfrac12 L B_v'$, which must vanish by the inequality for every $b$. Hence $B_v'$ is constant across types. Harmonicity of $X$ reduces the deficit to $\tfrac12 LD_v$. This is nonnegative at every type with zero $\pi$-mean, so it vanishes. In particular, every $q_b$ now saturates the assumed inequality at every vertex.

*The diagonal contradiction.* For each $g$, the nonnegative curvature deficit of $q_b+tg$ has zero constant term as a polynomial in real $t$. Its linear coefficient vanishes, giving $\Gamma_2(q_b,g)=Lq_b\,Lg/d=Lg$. Put $P_b g=\Gamma(q_b,g)$. The bilinear definition and $Lq_b=d$ give $2\Gamma_2(q_b,g)=L(P_b g)-P_b(Lg)$, hence $[L,P_b]=2L$ pointwise. At a vertex $v$ choose $b=X(v)$ and test the diagonal entry with $g=\mathbf1_{\{v\}}$. For $u\ne v$, $(P_b)_{vu}=\tfrac12 w_{vu}(q_b(u)-q_b(v))$. The products of the diagonal entries cancel, and the opposite signs of $(P_b)_{uv}$ and $(P_b)_{vu}$ in the two terms give
$$
[L,P_b]_{vv}=-\sum_u w_{vu}w_{uv}\bigl(q_b(u)-q_b(v)\bigr).
$$
Substituting $q_b(u)-q_b(v)=|z_{vu}|^2/2$ and $L_{vv}=-\sum_u w_{vu}$ into the commutator identity would give
$$
\sum_u w_{vu}w_{uv}\,\frac{|z_{vu}|^2}{2}=2\sum_u w_{vu}.
$$
At each neighbor $u$, its covariance $C_u=I$ contains the positive semidefinite summand $\tfrac12 w_{uv}z_{vu}z_{vu}^{\mathsf T}$. Its operator norm is at most one, hence $w_{uv}|z_{vu}|^2/2\leq1$. The left side of the required identity is at most $\sum_u w_{vu}$, which is strictly positive since $C_v=I$. This contradiction proves failure of the curvature bound.

*Diffusive scaling and uniformity.* A strict violating test has $\Gamma(f)(v)>0$. If $\Gamma(f)(v)=0$, the test has the value $f(v)$ on every neighbor, giving $Lf(v)=0$, $\Gamma(f,Lf)(v)=0$ and $L\Gamma(f)(v)\geq0$. The quotient $(\Gamma_2(f)-(Lf)^2/d)/\Gamma(f)$ is therefore strictly negative for the violating test. It scales by $h^{-2}$ under $L\mapsto h^{-2}L$ and gives the asserted bound.

The constant can be uniform when the vertex types and allowed deck jump list are fixed, the normalized rates are bounded above, the reversible type weights are bounded below, the finite type generator has spectral gap bounded away from zero, and the effective covariance is bounded below by a positive multiple of $I$ in a fixed chart. For a single type, the gap condition is vacuous. The type Poisson solve and the effective covariance are continuous in the normalized rates and the type weights under these conditions. The allowed parameter set with the weak bounds is compact, including parameter values with some zero rates. Every limit remains irreducible on types and has full-rank effective covariance. At each limit choose a type and a strict violating test on its two-jump neighborhood, extended to the finite list of all possible two-jump sites. The ratio for this fixed test is continuous near the limit and remains strictly negative. A finite subcover gives a common negative bound. Finite quotients inherit the same tests if their local neighborhoods realize these sites and rates without additional identifications.

For $d=4$, the theorem excludes the literal finite global dimension-four curvature hypothesis of Theorem C.6c on these fixed periodic carriers and on the uniformly controlled families just specified. It covers periodic rate and port types as well as one-type Bravais stencils. The smooth-core transfer of Corollary C.6c.5d retains its stated domain. Period cells of unbounded complexity, degenerating normalized type quotients, and nonperiodic generators remain outside the uniform conclusion.

<a id="theorem-c6c5g"></a>

<a id="theorem-c6c5g-finite-curvature-obstruction-under-stationary-rooting"></a>**Theorem C.6c.5g (Finite Curvature Obstruction under Stationary Rooting).** Let a random rooted, locally finite graph carry directed jump rates $w_{vu}\geq0$ on an undirected simple edge skeleton of degree at most $m$. Let its exit rates be at most $M$. Give each oriented skeleton edge an antisymmetric displacement mark $z_{vu}\in\mathbb R^d$ with $|z_{vu}|\leq R$. Assume the marks sum to zero on cycles of length at most four and satisfy $\sum_u w_{vu}z_{vu}=0$ at every vertex. Write
$$
LU(v)=\sum_u w_{vu}(U(u)-U(v)),\qquad
C_v=\frac12\sum_u w_{vu}z_{vu}z_{vu}^{\mathsf T}.
$$
Suppose the root law is stationary for the jump generator, in the sense that $\mathbb E[LU(o)]=0$ for every bounded measurable function $U(v)$ of the marked graph rooted at $v$. If $\mathbb P(C_o\succ0)>0$, the full-function $\mathrm{BE}(0,d)$ inequality fails at the root with positive probability.

More quantitatively, fix positive $\lambda$ and $p$ and impose $\mathbb P(C_o\succeq\lambda I)\geq p$. A full-function $\mathrm{BE}(K,d)$ inequality at the root almost surely then requires $K\leq-c$ for a constant $c>0$ depending only on $d,m,M,R,\lambda,p$. With physical rates $h^{-2}w_{vu}$ and physical marks $hz_{vu}$ this gives $K_h\leq-c h^{-2}$. The constant does not depend on a period-cell size or a type spectral gap.

*Local potentials and stationary functions.* The cycle condition makes the sum of the marks along a path of length at most two starting at $v$ independent of the choice of such path to a fixed endpoint. Call this potential $X$ on the two-jump sites, taking $X(v)=0$. Its increments on every edge needed for the local computation are $z_{xy}$, and the mark drift condition makes $LX$ vanish at $v$ and each one-jump neighbor. The quadratic test $q_b(x)=|X(x)-b|^2/2$ on the two-jump sites therefore has $Lq_b(x)=\operatorname{tr} C_x$ at $v$ and at every neighbor. All full-function curvature tests at $v$ use just these local values. For any bounded real stationary function $U$, the identity
$$
L(U^2)(o)-2U(o)LU(o)=\sum_u w_{ou}(U(u)-U(o))^2
$$
shows that $LU(o)=0$ almost surely forces $U(u)=U(o)$ along each positive outgoing jump at the root almost surely. Also, if a covariant property holds at the root almost surely, it holds at every positive outgoing neighbor of the root almost surely. Indeed, apply stationarity to the bounded indicator that the property fails. At the root this indicator vanishes, and the expected weighted sum of the indicator at neighbors is zero.

*Consequences of a rootwise curvature bound.* Suppose $\mathrm{BE}(0,d)$ holds at the root almost surely. For $b=ta$, the quadratic coefficient in the curvature deficit of $q_{ta}$ at the root is $\tfrac12 L(a^{\mathsf T}Ca)(o)$. To see this, the quadratic term in $\Gamma(q_{ta})(x)$ is $t^2 a^{\mathsf T}C_x a$, whereas $\Gamma(q_{ta},Lq_{ta})$ is affine in $t$ and $(Lq_{ta})^2/d$ is constant. The coefficient must be nonnegative. Its expectation is zero by stationarity. Applying the identity for $U^2$ to each of finitely many $a$ determining a symmetric matrix gives $C_u=C_o$ almost surely along every positive outgoing jump at the root.

Let $E=\{C_o\succ0\}$ and condition the law on $E$. The event indicator has identical values at the root and all its positive outgoing neighbors, so stationarity passes to the conditional law by applying it to $\mathbf1_E U$. Neighbor propagation gives the same covariance agreement along paths of positive jumps from the root. Transform the marks at each edge issuing from a vertex $v$ with $C_v\succ0$ by $C_v^{-1/2}$. Along those paths this uses one matrix, the normalized covariance is $I$, and the normalized drift is still zero. For a normalized positive jump write $z'_{vu}=C_v^{-1/2}z_{vu}$. Each term of the covariance gives $w_{vu}|z'_{vu}|^2\leq2$. To use stationarity on bounded quantities without a uniform lower bound on $C_o$, first condition further on $C_o\succeq\epsilon I$ for some $\epsilon>0$ of positive probability. Such an $\epsilon$ exists and this conditioning preserves stationarity for the same reason. All normalized marks on the relevant outgoing edges now have length at most $R/\sqrt\epsilon$.

Use the normalized marks on the two-jump sites and put
$$
B_v=\frac12\sum_u w_{vu}|z'_{vu}|^2z'_{vu},\qquad
D_v=\frac18\sum_u w_{vu}|z'_{vu}|^4.
$$
These are bounded stationary functions on the conditional class, with arbitrary bounded values at vertices outside it. At the root and its positive outgoing neighbors, $Lq_b=d$ and
$$
\Gamma(q_b)(v)=|X(v)-b|^2+(X(v)-b)\cdot B_v+D_v.
$$
The curvature deficit is affine in $b$, with coefficient $-\tfrac12 LB(o)$. Its nonnegativity for every $b$ gives $LB(o)=0$. By the identity for $U^2$, $B$ agrees at the root and all its positive outgoing neighbors almost surely. Using $LX(o)=0$ and $L|X-b|^2(o)=2d$, the deficit reduces to $\tfrac12 LD(o)$. Its sign and stationarity give $LD(o)=0$ almost surely. Thus the rootwise deficit vanishes for every $q_b$.

*Equality gives a contradiction.* Fix a root in the conditional class where the preceding conclusions hold, and set $b=X(o)$. Polarizing the curvature deficit at $q_b$ gives $\Gamma_2(q_b,g)(o)=Lg(o)$ for every local $g$. Because $Lq_b=d$ at the root and all its positive outgoing neighbors, $P_b g=\Gamma(q_b,g)$ then satisfies $[L,P_b]g(o)=2Lg(o)$. Evaluate at $g=\mathbf1_{\{o\}}$. As in Theorem C.6c.5f, the diagonal entry requires
$$
\sum_u w_{ou}w_{uo}\,\frac{|z'_{ou}|^2}{2}=2\sum_u w_{ou}.
$$
For $w_{uo}>0$, the normalized covariance at $u$ bounds $w_{uo}|z'_{ou}|^2/2$ by one. For $w_{uo}=0$ the term vanishes. The left side is at most the root exit rate, which is positive because its normalized covariance is $I$. This contradicts the required identity and proves the first claim.

*Compactness with varying cells.* Use rooted local convergence of the edge skeletons marked by the two directed rates and the displacement of each oriented edge. Retain the skeleton edges when a rate tends to zero. Degree is bounded by $m$ and the mark spaces are compact by $M$ and $R$. For each radius there are finitely many unmarked ball types, each with finitely many entries in compact mark spaces, modulo finite relabelings. Successive subsequences on the radii give compactness of the rooted marked graph space. Laws on this space have weakly convergent subsequences. The local cycle identities, antisymmetry, rate bound and harmonicity pass to limits. The set $C_o\succeq\lambda I$ is closed, so the lower bound $p$ on its probability passes as well.

For bounded continuous local $U$, the expectation of $LU(o)$ passes to a limit because it is itself a bounded continuous local function. These local functions determine finite measures on the rooted graph space. In particular, the measures that integrate $U$ against respectively $\mathbb E\sum_u w_{ou}U(u)$ and $\mathbb E[(\sum_u w_{ou})U(o)]$ agree on all bounded measurable $U$. This gives stationarity in the limit. For each underlying two-jump skeleton, the full-function curvature condition is positive semidefiniteness of the quadratic form in the finitely many site values, with coefficients continuous in the directed rates and $K$. This condition is closed, including when rates vanish. If no common $c>0$ existed, a sequence satisfying $\mathrm{BE}(-1/j,d)$ almost surely would thus have a limit satisfying $\mathrm{BE}(0,d)$ almost surely, contrary to the first claim. Curvature rescales by $h^{-2}$ under $L\mapsto h^{-2}L$.

For a reversible periodic carrier, root in one cell with the stationary probability of its type quotient. Harmonic-coordinate increments on the cover furnish the marks. On a finite quotient they furnish the marks whenever the two-jump neighborhoods retain their cover displacements without new identifications. The uniform conclusion applies to growing period cells when the stated degree, exit, increment and rootwise covariance probability bounds hold. In dimension four it excludes the bounded finite-stage curvature constants of Theorem C.6c on this class. A positive spatially averaged covariance alone does not supply the required probability bound on a full-rank covariance at a single root.

<a id="theorem-c6c6-qualified-endpoint-radius-two-and-metric-energy-transfer"></a>**Theorem C.6c.6 (Qualified Endpoint Radius-Two and Metric–Energy Transfer).** Fix the task-local P17 semantic ready cell of Theorem C.6c.P17a, its unchanged optimal-prefix presentation and Definition-13 task with matched fair baseline and margin $1/32$. Fix the C.6c.4a service alphabet, positive reference units and tariff coefficients. For $n=3^{2j}$, $j\ge 2$, use the unperturbed endpoint-source representative with rates and stencil in Part I (C.6c.6.1). Then there is a finite qualified-node source at every level and finite horizon, including a consistent qualification-completing extension of every shorter heat experiment, with all the following properties.

1. Every graph vertex is the persistent physical occurrence of a ready cell with original $C_P=C_{\mathrm{op}}=1$. Its actual coupled predictive loop retains the original risk $3/16$ versus the fair risk $1/4$. The supported nulls have risk $1/4$. Later loaded or updated microstates are not assigned the ready state's short program.
2. The actual exposed node bits and paid lanes realize the stated shortest-path metric for arbitrary unknown qubits and references. The quantum payload of the heat experiment is never read by the predictive loop.
3. Completed heat steps are exactly $\exp(\Delta_nL_n)$ at unchanged physical period $\tau\Delta_n$. The physical logarithmic generator is $L_n/\tau$; division by the fixed diffusion coefficient $\ell^{2}/\tau$ gives the Markov generator $L_n/\ell^{2}$ for the metric-normalized form. The half-form-operator convention remains distinct.
4. The local direction law, every lazy diagnostic parameter in its declared class, the metered metric and all actual radius-two collision buckets are explicitly populated. The universal finite-data classifier applies without replacing shared outer vertices by duplicated paths.
5. The same finite source probes, cell maps, common smooth core, compact metric limit and quadratic Cheeger identification obey all four quantitative test errors and the radius-two remainder. The diagonal extension covers every generator-domain pair required by the inherited BE/RCD theorem.
6. Every additional control, qualification, record, lane, clock and maintained factor has an owner in one full source ledger. No zero-cost or zero-increment identification with the old unqualified source is asserted. Original-history-dependent heat policies have the original heat law; policies using new records have the explicitly extended joint reference law.

**Proof.** Part II supplies the actual qualified nodes and their exact active-control heat implementation. Its identity $H=3I/4+R/4$ is applied to the very heat kernel of Part I. The physical bit $w_{x}$ at each qualified node is the occupancy bit decoded to $x$; the two other packet qubits are separately owned local auxiliaries. The live source control $F=A\text{ AND }B$ both gates the actual translation and supplies the core's delivered prediction outcome. The same supported six-CNOT cell program therefore qualifies its actual network execution, rather than an unrelated tensor factor.

The graph rates, metered edge lengths, normalized reference measure, endpoint kernel and physical endpoint period are unchanged by that direct recompilation. Therefore the logarithmic generator, moment identities, direction probes, collision matrices and test arrays in Part I are the actual responses of this one network. The added slow core schedule uses disjoint supported factors and fixed physical marked times; the strengthened timing slack preserves every heat endpoint. Its extra source and record factors have their stated conditional law and cannot depend on an unknown quantum payload at fixed original history. The paid SWAP path and causal-path lower bound identify the actual inter-unit propagation metric. Applying Part I's proved four-error theorem and full-domain extension to these identical numerical graph data gives the claimed limit. The complete source composition and its scope are proved in Part II. This establishes every listed conclusion on one source.

The common tariff, with the meaning of its counters fixed by the two parts, is

\[
 V/u_*=\alpha_E E+\alpha_0 I_0+\alpha_B B+\alpha_I I
 +\alpha_G G+\alpha_J J+\alpha_C C_{link}+\alpha_K K
 +\alpha_\Omega(\tau_*/\hbar)\max_t\|H_{\mathrm{joint}}(t)\|.
\]

The simultaneous generator is the actual heat/controller-plus-core generator. Its norm and pulse action are recorded from the finite piecewise schedule. Lane busy intervals and their complementary idle intervals are not counted again as node bit-time. All coefficients are fixed across the family. This objective is not the propagation form, thermodynamic heat or original program complexity.

The combined theorem consumes representative $r_{n}=1$. Part II's optional perturbed representative is not needed here. Its limiting transfer also follows by multiplying $I_1,I_2,I_4$ and the radius remainder by $r_{n}^{2}$ and $I_3$ by $r_{n}$, then using $r_n\to 1$.

#### Part I — Same-Source Radius-Two and Metric–Energy Transfer

## 3 One admitted source and its complete declared local census

Fix the positive source units $\tau$, ell and u, and all the positive rational tariff coefficients of Definition C.6c.4a. They remain fixed along the sequence. Choose only representative 0 of the construction of Definition 35b.15:

\[
 n=3^{2j},\quad j\ge2,\qquad m=\sqrt n=3^j,\quad
 h=m/n,\quad \delta=1/n,\quad V_n=(\mathbb Z/n\mathbb Z)^4,
\]
\[
 S_m=\{s\in\mathbb Z^4:0<|s|\le m\},\quad M=|S_m|,
 \quad Q_m=\sum_{s\in S_m}|s|^2,
\]
\[
 a_s=\frac{n^2}{2}\mathbf{1}_{\{\pm e_i\}}(s)+\frac{4n^2}{Q_m},\quad
 b=\sum_sa_s=4n^2+4n^2M/Q_m,\quad \mu_x=n^{-4}.
 \tag{C.6c.6.1}
\]

All these rates and masses are positive rational; a finite integer enumeration gives the whole stencil. Every vertex is a translate of every other, and every directed edge is listed exactly once by `(x,s)`. Since $n>6m$, there is no ambiguity from identical oriented neighbors or radius-two wrapping. The propagation descriptor is $s$ and its opposite is $-s$. The source service meters $q(s)=|s|$ and charges $u\alpha_{C}|s|$; the mathematical edge length is $|s|/n$ and the physical length is $\ell|s|/n$. The complete lane allocation is $n^{4}M/2$ unordered lanes. This is an exhaustive census of the **declared** graph and local parameters at each $n$, not a claim about every physical architecture.

The generator and graph form are
\[
 L_nf(x)=\sum_sa_s(f(x+s)-f(x)),\qquad
 E_n(f)=\frac12\langle f,-L_nf\rangle_{\mu_n}.
 \tag{C.6c.6.2}
\]
Antipodal rates give detailed balance. Thus all cycle tests pass and the invariant probability is $\mu$. Taking a constant positive field $F$ in (C.2) and baseline $P_0(x,x+s)=a_s/b$ gives the same nonlazy direction row. A nonconstant positive $F$ is merely a reparameterization if the inverse baseline in C.6c.3c.1 is used; it is not a new constraint on the actual row. There is no claim that an arbitrary physical complexity field has thereby been constructed.

Here are the four populated source records, without changing their meanings:

- SC03: the typed finite endpoint source alphabet of C.6c.4a, the graphs (C.6c.6.1), their fixed metered descriptor metric, the actual direction row $a/b$, its lazy diagnostic family, all vertices, every actual radius-two function, and the declared common-core continuum tests. The universal classifier remains valid for every other supplied finite datum; this branch supplies its concrete witness.
- SC15: source measure $\mu$, actual clock $\tau\Delta$ with $\Delta=n^{-4}$, physical generator $L_n/\tau$, code/complement decoder, normalized endpoint instruments and their spectator extensions, source probe identities, and the cell maps below.
- SC16: the *entire* C.6c.4a tariff and finite word inventory, including dedicated lanes, busy/idle lane intervals, node/controller/archive support and bit-time, paid gates and records, ready resources, clock slots, peak strength and action. It is not replaced by the form value or a link-cost total. Every additional diagnostic has its own finite preparation/communication/arithmetic/record counters.
- SC17: exact moment and collision identities, metric distortion, Fourier convergence, the four test-error bounds (C.6c.6.17), radius-two remainder (C.6c.6.19), positive-test diagonal extension, and physical clock conversion.

Finite typed words and their prescribed expansions give a syntax-complete census on this source branch. The fixed primitive alphabet, normalization checks and additive occurrence counters cover every finite composition. Relabeling must transport all rates, masses, edge descriptors, source parameters, units, times and field labels. No source-record equivalence is inferred by retaining only a form response.

## 4 Exact physical response and metric identification

The populated source has the position-classical, payload-quantum code algebra $\bigoplus_x M_2$ inside its full finite carrier. The code check retains its complementary outcome. The completed heat kernel is
\[
 H_n=\exp(\Delta L_n),\qquad \Delta=n^{-4}.
\]
It is symmetric stochastic and strictly positive by uniformization and connectedness. The actual instrument prepares its finite translation coin and compiles each selected translation into paid edge operations, with all spectators and auxiliary identities included. The code decoder $D$ and encoding $\iota$ obey
\[
 D\,\mathcal T_n\,\iota=H_n
\]
blockwise, and the same identity holds for every finite retained adaptive endpoint protocol. At the actual physical epoch $\tau\Delta$,
\[
 (\tau\Delta)^{-1}\log H_n=L_n/\tau.
 \tag{C.6c.6.3}
\]
This is its unique self-adjoint transfer logarithm. The Hamiltonian inside the finite pulse compiler is a separate object.

For a finite field table and $S$ drawn from $a_s/b$, the retained conditional readouts
\[
 b\Delta_Sf,\quad \frac b2(\Delta_Sf)^2,
 \quad \frac{b^2}{4}(\Delta_S\Delta_Tf)^2
 \tag{C.6c.6.4}
\]
with independent $S,T$ have expectations $L_nf$, $\Gamma_n(f)$, $\Gamma_{2,n}(f)$. Polarization gives mixed $\Gamma$. Source-unit versions divide the first two by $\tau$ and the third by $\tau^{2}$. These identities are finite sums on the **same** source; probes are not a definition by fiat of the desired limit. A finite exact expectation identity is not a claim of zero statistical error from a finite random sample.

The source's least link-coordinate charge to transmit an unknown payload between x and y equals the shortest descriptor-weighted path. The upper bound is the paid path compiler. The lower bound follows because any output dependent on an unknown input contains a causal path of paid inter-port services; all scheduled, including null, services have nonnegative charges and every branch is paid. Therefore the source metric is exactly
\[
 d_n^{src}=\ell d_n,\quad
 d_n(x,y)=\min_{\gamma:x\leadsto y}\sum_{s\in\gamma}|s|/n.
 \tag{C.6c.6.5}
\]
The objective coefficient u $\alpha_{C}$ is divided out before interpreting the unpriced meter as a length. No reciprocal-rate/length relation is assumed.

The physical time form is $F_n=E_n/\tau$. With $D_{\mathrm{diff}}=\ell^{2}/\tau$,
\[
 F_n/D_{\mathrm{diff}}=E_n/\ell^2.
 \tag{C.6c.6.6}
\]
This is the normalized form whose limiting Cheeger energy belongs to the actual metric $\ell d_{0}$. Its Markov generator for $\Gamma$ calculus is $L_n/\ell^{2}$. In the separate convention $q(f)=\langle Af,f\rangle$ of Definition 35b.15, the operator for $F_{n}$ is $-L_n/(2\tau)$, so its form-semigroup time $s$ corresponds to physical heat time $s/2$. We never use that half-operator as the Markov generator in the radius-two test.

## 5 The lazy kernel classification on the same finite torus

For $\alpha$ in $[0,1]$, let
\[
 P_\alpha(x)=\alpha\delta_x+(1-\alpha)\sum_{s\in S_m}p_s\delta_{x+s}
 \tag{C.6c.6.7}
\]
for any common probability direction row $p$. In particular, the actual row is $p_s=a_s/b$. For every edge $y=x+v$, $v$ in $S_{m}$, the propagation-metric Ollivier curvature of (C.6c.6.7) is exactly zero.

**Proof.** Translation by $v$ is a metric isometry and couples the two laws at cost $d_n(x,x+v)=|v|/n$. Let $A=\{0\}\cup S_{m}$ and use integer lifts of $A\cup(v+A)$. Any difference between two such lifts has coordinate magnitude at most $3m<n/2$. Its Euclidean torus distance therefore equals its unwrapped Euclidean distance. Since every graph path has cost at least Euclidean torus distance, the function
\[
 \psi(z)=\frac{v\cdot z}{n|v|}
\]
is 1-Lipschitz on this union in $d_{n}$. Its finite McShane extension $\min_{z\in\text{union}}(\psi(z)+d_n(z,w))$ is 1-Lipschitz on the whole torus and preserves these values. The expectation difference is $|v|/n$ because the offset laws agree. Every transport coupling costs at least that expectation difference, while the translation coupling attains it. The two inequalities give equality. Scaling $d_{n}$ by $\ell$ changes both numerator and denominator equally. This proof needs neither zero drift nor reversibility of $p$. The $n>6m$ condition is used for the local potential, not incorrectly replaced by a global linear function on a compact torus. ∎

For rational $\alpha$ and the actual rational row p, this diagnostic law is an admitted finite classical branch of paid payload transport: prepare its finite rational coin, retain the outcome, and compile the selected identity/translation by the existing charged routing compiler. This introduces no new primitive, uncharged access port or external controller. Its pulse, record and archive occurrences remain charged. For $\alpha<1$ one can declare physical tick duration $\tau$ (1-alpha)/b, subdivide it into the finitely many positive padded slots, and recover
\[
 (P_\alpha-I)/(\tau(1-\alpha)/b)=L_n/\tau.
 \tag{C.6c.6.8}
\]
Every such duration is positive at fixed $\alpha<1$; the source allows finite unboundedly strong ideal controls and charges their strength. This is a paid-transport probe at its own explicitly registered tick, **not** the heat macro (C.6c.6.3). The mathematical classification is for every real $\alpha$; only finitely described, admitted coin parameters are claimed as finite physical experiments. At $\alpha=1$ the diagnostic generator is zero, so (C.6c.6.8) is not asserted. The actual continuum source remains the heat endpoint sequence (C.6c.6.3), with its unchanged clock.

The unweighted graph metric $d_{G}$ is a different permitted mathematical diagnostic. For a fixed n,
\[
 d_G/n\le d_n\le (m/n)d_G.
\]
The factor m grows, so this comparison does not convert an unweighted-metric result into a uniform continuum statement. Its exact lazy curvatures remain the finite transport LP of C.6c.3c; no zero-curvature claim for $d_{G}$ is made here. Thus both original metric conventions are explicitly distinguished.

## 6 The actual radius two matrices and collisions

Translate a vertex to 0. Because $n>4m$, the actual two-step vertex set is the integer union $\{0\}\cup S_{m}\cup(S_m+S_m)$, with no extra identifications modulo $n$. For each $z$ define the **single** collision bucket
\[
 I_z=\{(s,t)\in S_m^2:s+t=z\},\quad
 B_{st}=e_s+e_t,\quad
 W_z=\sum_{I_z}a_sa_t,\quad
 h_z=\sum_{I_z}a_sa_tB_{st}.
 \tag{C.6c.6.9}
\]
Let $O=(S_m+S_m)\setminus(S_m\cup\{0\})$. Set $c_z=e_z$ for $z$ in $S_{m}$ and $c_{0}=0$. The exact source Schur matrix is
\[
 4Q_n=
 \sum_{z\in S_m\cup\{0\}}\sum_{I_z}a_sa_t(c_z-B_{st})(c_z-B_{st})^T
 +\sum_{z\in O}\left[\sum_{I_z}a_sa_tB_{st}B_{st}^T-\frac{h_zh_z^T}{W_z}\right].
 \tag{C.6c.6.10}
\]
Empty first-shell buckets contribute zero. Its other matrices are
\[
 G_n=\tfrac12\operatorname{diag}(a_s),\quad a=(a_s)_s,
 \quad D_{zz}=W_z/4,\quad B_{\bullet z}=-h_z/4.
 \tag{C.6c.6.11}
\]
The `B` in (C.6c.6.11) denotes the first/outer block, not $B_{\mathrm{st}}$ in (C.6c.6.9). Formulas (C.6c.6.9)–(C.6c.6.11), together with integer enumeration in (C.6c.6.1), are a finite exact specification of every matrix entry for every source level; they are not a radius-two tree surrogate.

**Proof of the matrix identity.** Commuting translations and the product difference identity give
\[
 \Gamma_{2,n}(f)(0)=\frac14\sum_{s,t}a_sa_t
 [f(s+t)-f(s)-f(t)+f(0)]^2.
 \tag{C.6c.6.12}
\]
Set $f(0)=0$ and $u_s=f(s)$. A single actual outer value $f(z)$ occurs in all the pairs $I_{z}$, so its minimizing value is $h_z^{T}u/W_z$. Completing this one square gives (C.6c.6.10); its raw diagonal and cross block give (C.6c.6.11). This is exactly the Schur complement of the general C.6c.3b matrix, since both are the same quadratic expression before elimination. No two distinct outer variables multiply. ∎

For the complete local function class,
\[
 \Gamma_2\ge K\Gamma+(Lf)^2/N
 \quad\Longleftrightarrow\quad
 Q_n-KG_n-aa^T/N\succeq0.
 \tag{C.6c.6.13}
\]
This supplies every $K,N$ test, not only a bound on a chosen core. The kernel of $Q_{n}$ is the four-dimensional space $u_s=v\cdot s$: zero second differences imply antipodality and local additivity; subtracting a signed coordinate from any longer $s$ stays in $S_{m}$ and inductively determines $u$ from its coordinate values. An affine extension gives the converse. Antipodal $a$ annihilates that kernel. Therefore the exact zero-curvature dimension is
\[
 N_{*,n}=a^TQ_n^+a,\qquad 4\le N_{*,n}\le M.
 \tag{C.6c.6.14}
\]
The lower bound follows by testing a quadratic with moment-normalized identity Hessian; the upper bound follows by retaining opposite pairs in (C.6c.6.12) and Cauchy–Schwarz. The exact positivity/range test or rational linear algebra evaluates (C.6c.6.14) at any supplied finite $n$. No claim $N_{*,n}=4$ is made. Common source clock scaling $c$ multiplies $Q$ by $c^{2}$ and $G$ by $c$, sending $K$ to $cK$ and leaving $N_*$ unchanged.

**A collision that cannot be split.** For $z=(m+1)e_1$, the ordered pairs $(e_1,me_1)$, $(me_1,e_1)$, $(2e_1,(m-1)e_1)$ and its reverse all belong to the same actual outer vertex. Put $u_{e_1}=1$ and all other $u_{s}=0$. In this bucket $B_{st}^{T}u$ is 1 on the first two pairs and 0 on the latter pair. If $p=2a_{e_1}a_{me_1}$, then $W_z>p>0$ and its exact contribution to $u^{T}Q_nu$ is
\[
 \frac14\left(p-\frac{p^2}{W_z}\right)>0.
 \tag{C.6c.6.15}
\]
An independently duplicated “outer vertex” for each ordered path would minimize each square to zero and lose (C.6c.6.15). At the actual source level $n=81$, $m=9$, the bucket has 6,523 ordered paths and (C.6c.6.15) equals
\[
 3448244179042893/9751008380724436.
\]
At $n=729$, $m=27$, the corresponding bucket has 612,685 ordered paths. Both exact values and their enumerations are in the diagnostics. No unwrapped collision is mistaken for a distinct torus vertex.

## 7 Quantitative estimates for all four transfer terms

We first work in the normalized coordinates $(x/n,d_n,\mu_n,L_n)$, and restore physical units in Section 10. Let $f,\phi$ be smooth real periodic functions, $\phi\ge 0$, and sample them at $x/n$. Write $D_j(g)$ for the supremum norm of the $j$th derivative as a multilinear form; $D_{0}$ is the supremum absolute value. Set
\[
 A_n(g)=\tfrac43 hD_3(g),\qquad
 B_n(g,k)=2h[D_1(g)D_2(k)+D_1(k)D_2(g)]+h^2D_2(g)D_2(k).
 \tag{C.6c.6.16}
\]
The exact signed-permutation moments are $\sum_s a_s(s/n)=0$ and $\sum_s a_s(s/n)(s/n)^{T}=2I_4$. In particular $\sum_s a_s|s/n|^{2}=8$. Taylor expansion gives
\[
 \|L_nS_ng-S_n\Delta g\|_\infty\le A_n(g),\quad
 \|\Gamma_n(S_ng,S_nk)-S_n(\nabla g\cdot\nabla k)\|_\infty\le B_n(g,k).
\]
For the first estimate the cubic remainder contributes $(1/6)D_3\sum a|s/n|^{3}\le(4/3)hD_3$; for the second, expand each increment into its gradient term and a remainder at most $D_2|s/n|^{2}/2$. These yield exactly the coefficients in (C.6c.6.16).

Let $U_f=\lVert\Delta f\rVert_\infty$, $U_\phi=\lVert\Delta\phi\rVert_\infty$, $P=\lVert\phi\rVert_\infty$, $A_f=A_n(f)$, $A_\phi=A_n(\phi)$, and $B_{ff}=B_n(f,f)$. Define the four continuum integrands
\[
 g_1=|\nabla f|^2\Delta\phi,\quad
 g_2=\phi\nabla f\cdot\nabla\Delta f,\quad
 g_3=\phi|\nabla f|^2,\quad
 g_4=\phi(\Delta f)^2.
\]
Then the source quantities from C.6c.3e satisfy the following **explicit** estimates:
\[
\begin{split}
 |I_{1,n}-I_1|&\le B_{ff}(U_\phi+A_\phi)+D_1(f)^2A_\phi+2\delta D_1(g_1)=:\epsilon_{1,n},\\
 |I_{2,n}-I_2|&\le P\left[B_n(f,\Delta f)+\tfrac{16}{3}hD_1(f)D_4(f)\right]+2\delta D_1(g_2)=:\epsilon_{2,n},\\
 |I_{3,n}-I_3|&\le PB_{ff}+2\delta D_1(g_3)=:\epsilon_{3,n},\\
 |I_{4,n}-I_4|&\le P(2U_fA_f+A_f^2)+2\delta D_1(g_4)=:\epsilon_{4,n}.
\end{split}
 \tag{C.6c.6.17}
\]
Every right side tends to zero for the fixed smooth pair.

**The mixed second term.** This term cannot be justified by $\Gamma(f)$ convergence alone. Define on the whole continuum torus the smooth residual
\[
 R_n(x)=\sum_sa_s[f(x+s/n)-f(x)]-\Delta f(x).
\]
Differentiation commutes with every translation, so applying the first estimate of (C.6c.6.16) to every unit directional derivative gives
\[
 ||\nabla R_n||_\infty\le\tfrac43hD_4(f).
\]
The mean value estimate and the second moment give
\[
 |\Gamma_n(S_nf,S_nR_n)|\le
 \tfrac12\sum_sa_s|s/n|^2D_1(f)||\nabla R_n||_\infty
 \le\tfrac{16}{3}hD_1(f)D_4(f).
 \tag{C.6c.6.18}
\]
Adding the bilinear $B_n(f,\Delta f)$ error proves the integrand estimate for $I_2$. This avoids the invalid use of a sup-norm residual multiplied by the diverging jump rate.

For I1 use the product difference with $\lVert L_n\phi\rVert\le U_\phi+A_\phi$; for I3 use (C.6c.6.16); for I4 use $|(L_nf)^{2}-(\Delta f)^{2}|\le 2U_fA_f+A_f^{2}$. Finally each half-open grid cell has diameter $2\delta$, so the discrepancy between the point sample and integral of any smooth $g$ is at most $2\delta D_1(g)$. Adding that Riemann error proves all four displays. No finite-stage Cheeger-energy identity is used.

## 8 The retained radius two inequality with its own remainder

Let $H=D_2(f)$, $T=D_3(f)$. The double integral formula for a second difference differs from $(s/n)^{T}D^2f(x)\,(t/n)$ by at most $2Th|s/n||t/n|$. Equation (C.6c.6.12) and the exact moments yield
\[
 ||\Gamma_{2,n}(S_nf)-S_n(\|D^2f\|_F^2)\|_\infty
 \le64(HT h+T^2h^2).
\]
Since $\lVert D^2f\rVert_F^{2}\ge(\Delta f)^{2}/4$ and $|\Delta f|\le 4H$,
\[
 \int\phi_n[\Gamma_{2,n}(f_n)-(L_nf_n)^2/4]d\mu_n\ge-r_n,
\]
\[
 r_n=P[64(HT h+T^2h^2)+2HA_f+A_f^2/4]\longrightarrow0.
 \tag{C.6c.6.19}
\]
The weight $\phi_{n}$ is nonnegative and its average is at most $P$. This is a radius-two result for these sampled tests on the source whose full local matrices are (C.6c.6.10), not a change to the exact full-function dimension (C.6c.6.14).

The constant 64 can be checked directly: after squaring, the absolute remainder is at most $[4HTh+4T^{2}h^{2}]|s/n|^{2}|t/n|^{2}$; the prefactor $1/4$ in (C.6c.6.12) and $(\sum a|s/n|^{2})^{2}=64$ give (C.6c.6.19)'s first term. The Laplacian-square error divided by four is at most $2HA_f+A_f^{2}/4$.

## 9 Compact metric limit and Cheeger identification on this same source

The exact source metric (C.6c.6.5) obeys
\[
 d_0(x/n,y/n)\le d_n(x,y)
 \le(1+2/(m-2))d_0(x/n,y/n)+2/n.
 \tag{C.6c.6.20}
\]
To prove this, subdivide a shortest Euclidean lifted segment into pieces of length at most $(m-2)/n$ and round the intermediate points to nearest grid points. Four-dimensional rounding changes each point by at most $1/n$, so each new increment lies in $S_m/n$, and the total extra length is at most twice the number of pieces divided by $n$. Repeated points may be deleted. The opposite bound is the Euclidean triangle inequality. The torus diameter is one, so the distortion tends to zero, and the uniform cell measures converge to $dx$. This gives compact measured-GH convergence of the very metered metric and masses.

Let $C_{n,x}=x/n+[0,1/n)^{4}$ modulo one,
\[
 J_nf=\sum_xf(x)\mathbf{1}_{C_{n,x}},\quad
 P_ng(x)=n^4\int_{C_{n,x}}g,\quad S_ng(x)=g(x/n).
 \tag{C.6c.6.21}
\]
$J$ is an isometry, $P=J^*$, and $JP$ converges strongly to identity. Sampling is used only for smooth or finitely described continuous tests; arbitrary $L^2$ classes use $P$. On consecutive nested levels the coarse-cell projection $\pi$ pushes the fine measure exactly onto the coarse measure. Replication $Bf=f$ composed with $\pi$ and block averaging $B^*$ are adjoints, and $J_{\mathrm{fine}}B=J_{\mathrm{coarse}}$. The finite label circuit implementing this map is already a paid source operation. No claim $L_{\mathrm{fine}}B=BL_{\mathrm{coarse}}$ is made.

In discrete Fourier coordinates, for $k$ in the centered $n$-box the eigenvalue of $-L_n$ is
\[
 \lambda_n(k)=2n^2\sum_i\sin^2(\pi k_i/n)
 +\frac{4n^2}{Q_m}\sum_s[1-\cos(2\pi k\cdot s/n)].
\]
The same exact moments give
\[
 8|k|^2\le\lambda_n(k)\le4\pi^2|k|^2,\qquad
 |\lambda_n(k)-4\pi^2|k|^2|\le\tfrac{16}{3}\pi^4h^2|k|^4.
 \tag{C.6c.6.22}
\]
Finite-frequency restriction followed by exhaustion proves the weak Mosco lower bound for (C.6c.6.2). Fourier truncations and the upper bound prove recovery for $H^1$; outside $H^1$ recovery is vacuous. Cell and Fourier weak structures agree because their fixed-mode pairing discrepancy tends to zero and norms agree. The lower bound controls Fourier tails for bounded energy-plus-$L^2$-norm sequences, giving strong precompactness. Constants prevent pure-energy-sublevel compactness; no such compactness is asserted.

Thus the limit of $E_{n}$ on (C.6c.6.21) is $\frac{1}{2}\int|\nabla f|^{2}\,dx$ on $H^1$, $\infty$ otherwise. This is the quadratic Cheeger energy of the same Euclidean torus metric $d_0$: smooth Lipschitz slopes equal $|\nabla f|$ and mollification gives the upper approximation; weak $H^1$ lower semicontinuity and the Lipschitz derivative bound give the converse lower bound. Mollifying an $H^1$ function with weak gradient bounded by one yields equi-1-Lipschitz representatives, proving Sobolev-to-Lipschitz. The compact torus is a complete full-support length space. These statements establish the metric–energy identification rather than importing a quadratic form from a different metric.

At physical metric $\ell d_0$ the minimal gradient scales by $\ell^{-1}$. Hence (C.6c.6.6) converges to exactly its Cheeger energy with normalized measure $dx$. With physical volume measure $\ell^{4}dx$, both forms and measures acquire the same factor, and the limiting measure is the standard Hausdorff-volume measure. The normalized probability convention at $\ell\ne 1$ is not mislabeled literally $\mathcal{H}^4$.

## 10 Every admissible generator domain test and physical units

For the normalized limit, an admissible $f$ satisfies $f$ in $D(\Delta)$ and $\Delta f$ in $H^1$. Fourier coefficients imply $f$ in $H^3$. An admissible nonnegative $\phi$ belongs to $D(\Delta)$ intersect $L^\infty$ and $\Delta\phi$ belongs to $L^\infty$.

Choose positive heat regularizations $f_t,\phi_t$ as $t$ decreases to zero. Then $f_{t}$ tends to $f$ in $H^3$, $\phi_{t}$ stays nonnegative, and both $\phi_{t}$ and $\Delta\phi_t$ retain their respective uniform bounds and converge almost everywhere along a sequence. The squared gradient and Laplacian terms converge in $L^1$, while
\[
 \nabla f_t\cdot\nabla\Delta f_t\longrightarrow
 \nabla f\cdot\nabla\Delta f\quad\hbox{in }L^1
\]
after applying Cauchy–Schwarz to the $H^3$ convergence. Uniform bounds and dominated convergence therefore pass all four continuum quantities. The Hessian-square and Laplacian-square terms also converge in $L^1$; thus the limiting integrated radius-two inequality passes to this entire test domain.

One may keep the finite physical test core countable. Approximate each smooth $f_{t}$ in C4 by a real trigonometric polynomial with rational coefficients. Approximate each smooth $\phi_{t}$ in C2 uniformly, including all derivatives through order two, by such a polynomial, and add a positive rational constant exceeding the uniform approximation error. The latter polynomial is nonnegative, its supremum and Laplacian remain uniformly bounded, and its added constant tends to zero. These choices give the same four continuum limits and H3 convergence. Their grid samples have finite algebraic descriptions. No arbitrary uncomputable L2 equivalence class is asserted to be a finite source word.

To choose a single graph sequence, index these nonnegative finite test pairs by $k$. First choose them so every continuum term and the integrated Hessian/Laplacian expression differ from the target by at most $2^{-k}$. Then choose increasing $J_{k}$ so that, at all levels $j\ge J_k$, each of the four explicit fixed-pair errors (C.6c.6.17) and the radius-two bound (C.6c.6.19) is at most $2^{-k}$. Such a tail exists because $\delta$ and $h$ decrease to zero. At graph level $j$ use the $k(j)$th pair, where $k(j)=\max\{k:J_k\le j\}$; before $J_{1}$ choose the first pair. This gives nonnegative $\phi_{n}$ and four errors tending to zero, plus $r_{n}$ tending to zero, on the actual source family. This is a mathematical domain-extension choice; an effective modulus for an arbitrary uncomputable input is not asserted.

Reversibility and (C.6c.6.17)–(C.6c.6.19) now give, with $K_n=K=0$ and $N=4$,
\[
 \tfrac12I_1-I_2-I_4/4
 \ge-r_n-\epsilon_{1,n}/2-\epsilon_{2,n}-\epsilon_{4,n}/4.
 \tag{C.6c.6.23}
\]
The unused coefficient of $\epsilon_3$ is zero because $K=0$, but $\epsilon_3$ is separately proved rather than omitted. Taking the limit yields $\mathrm{BE}(0,4)$ on the full required generator domain. Together with Section 9, the characterization of Theorem C.6c.3e gives $\mathrm{RCD}^*(0,4)$. Its external mathematical input is the finite-dimensional BE/RCD equivalence of Erbar et al. (2013, Theorem 7), with its hypotheses retained. Nothing in this argument infers BE from Ollivier positivity alone; Section 5's zero-Ollivier result is a classification on the same source, while the independent radius-two and metric-energy inputs perform the transfer.

For physical units use the Markov generator $L_n/\ell^{2}$ from (C.6c.6.6). $\Gamma$ scales by $\ell^{-2}$ and $\Gamma_2$ by $\ell^{-4}$. Thus $I_1,I_2,I_4$, their respective errors and $r_{n}$ scale by $\ell^{-4}$, while $I_3$ and its error scale by $\ell^{-2}$. Equation (C.6c.6.23) remains valid with exactly these factors. The source responses (C.6c.6.3)–(C.6c.6.4) convert by multiplying the physical rate by $\tau/\ell^{2}$. This conversion is fixed once, not adjusted along the sequence to conceal a different diffusion constant.

The retained heat refinement also uses the original physical clock. For physical $T$ in $[0,T_0]$ and $t=T/\tau$,
\[
 ||H_n^{\lfloor t/\Delta\rfloor}S_nf-S_ne^{t\Delta_{\mathrm{torus}}}f||_\infty
 \le\tfrac43(T_0/\tau)hD_3(f)+\Delta||\Delta_{\mathrm{torus}}f||_\infty.
 \tag{C.6c.6.24}
\]
Duhamel's formula and heat derivative contraction prove this estimate. It does not replace the four mixed errors; it records the compatible endpoint clock on this same source. Contractivity, density and finite branch-product expansion give the retained finite smooth-effect/heat protocol limit. All-intermediate-time signaling remains outside the endpoint interface.

#### Part II — Qualified Vertex Source Binding

## 3. The actual heat-control coupling

Use the nested levels \(n=3^{2j}\), \(j\ge2\), \(N=n^4\), \(\Delta_n=n^{-4}\), stencil and rates of Definition 35b.15. Either representative \(r_n=1\) or \(r_n=1+1/n\) is allowed. Write

\[
 P_n=e^{r_n\Delta_n L_n},\qquad p_n(v)=P_n(0,v),\qquad
 q_n=r_n\sum_s a_n(s).
\]

Because \(Q_m\ge |S_m|\),

\[
 q_n\le8r_n n^2,\quad
 p_n(0)\ge e^{-q_n\Delta_n}\ge1-8r_n/n^2>3/4.
 \tag{QV2}
\]

Define the residual translation kernel by

$$
 R_n=4P_n-3I,\qquad P_n=\frac34 I+\frac14R_n.
 \tag{C.6c.6.QV1}
$$

The first inequality for $p_n(0)$ is the no-jump term in the Poisson expansion. Together with (C.6c.6.QV1), the bound $p_n(0)>3/4$ makes $R_n$ nonnegative and stochastic. It is symmetric and translation invariant, and its entries have the same finite exponential/Fourier descriptions as $P_n$.

For heat epoch \(j\), consume two pristine independent fair source qubits only after the relevant earlier forecasts have frozen. Measure their basis values \(A_j,B_j\) into fresh records and compute

\[
 F_j=A_j\land B_j.
\]

Conditional on \(F_j=0\), set \(V_j=0\). Conditional on \(F_j=1\), prepare and measure a translation label with law

\[
 r_n(v)=4p_n(v)-3\mathbf1_{v=0}.
\]

Use a controlled Householder reflection on a fresh label register, exactly as in C.6c.4a but with the certified distribution \(r_n\). Its complete matrix is a finite described local unitary; measurement is a normalized projective record instrument. Then execute the paid controlled translation \(U_{V_j}\).

For every admitted input position and every payload/reference state,

\[
 \Pr(V_j=v)=\tfrac34\mathbf1_{v=0}+\tfrac14r_n(v)=p_n(v).
 \tag{QV3}
\]

The source factors for different epochs are independent. The controller, including its fresh randomness, does not read the unknown payload. Consequently the original heat channel and all its endpoint-protocol laws survive exactly after decoding the additional control records.

This coupling is operationally nontrivial: holding the active control at zero makes every heat translation the identity. A nonzero displacement implies \(F_j=1\). The control is not a decoration generated after a heat step.

### Exact additional record law

For a realized translation \(v\),

\[
 \Pr(F=1\mid V=v)=
 \begin{cases}
 1,&v\ne0,\\
 (p_n(0)-3/4)/p_n(0),&v=0.
 \end{cases}
 \tag{QV4}
\]

If \(F=0\), the pairs \((A,B)=(0,0),(0,1),(1,0)\) are equiprobable; if \(F=1\), the pair is \((1,1)\). This completely specifies the extra source records conditional on each original heat history. Their conditional law is independent of the arbitrary quantum payload, precisely as required by C.6c.4d. No prohibited pre-read of that payload is used.

## 4. Vertex, packet, message and predictive roles

At each graph vertex \(x\), instantiate one copy \(C_x\) of P17's ready cell \(\mu_0\), with actual fields

\[
 (m_x,y_x,d_x,w_x,f_{0,x},f_{1,x}),\quad
 \text{66-bit fixed ROM},\quad\text{three-bit cursor}.
\]

The graph's occupancy bit is **the actual exposed bit \(w_x\)**. The passive quantum payload and the old third packet/interface bit occupy two separately owned local auxiliary qubits. Thus a packet swap acts on \(w_x\) and those two auxiliaries at its two endpoints. It never swaps or reads \(m,y,d,f_0,f_1\), the core ROM, or the cursor. This is an explicit support map, not an identification of Hilbert dimensions.

The external heat-control appliance and its live message registers are local owned auxiliaries. Every transfer of a translation label or control message between different vertices uses the same dedicated, descriptor-timed paid lanes. The immutable core ROM is unchanged:

\[
 (m,f_0),\ (X_1,y),\ (m,d),\ (y,d),\ (d,m),\ (m,f_1).
 \tag{QV5}
\]

Select two **marked** heat epochs \(j_1,j_2\). Their active flags are independent Bernoulli(1/4). Define the live message state

\[
 X_0=0,\qquad X_1=F_{j_1},\qquad X_2=X_1\oplus F_{j_2}.
 \tag{QV6}
\]

At the first marked epoch the controller disseminates \(X_1\). At the second it disseminates \(X_2\). Each vertex retains its live first message and reconstructs the second execution-enable bit as \(F_{j_2}=X_1\oplus X_2\). The local translation gates include this enable as an actual control. The existing translation-label equality control is also present. For an inactive step the label is zero and all nontrivial translations are disabled. Requiring the enable explicitly prevents a merely retrospective relabeling of a random record as a control message.

In between marked epochs the same source law supplies ordinary active flags and translations. Only the two marked control-message events are the fixed P17 task's outcome events; unmarked heat steps do not become unobserved extra transitions of the P17 binary process.

Each core freezes \(f_0\) before consumption of \(A_{j_1},B_{j_1}\), receives the **actually delivered** \(X_1\) at its already declared environmental port 6, and executes the remaining five CNOTs and cursor operations of (QV5). It freezes \(f_1\) before consumption of \(A_{j_2},B_{j_2}\). The independently retained second delivered message \(X_2\) is the scored outcome.

Thus the forecast target is an actual execution-control message used at that vertex. Its verification and model update are performed by the same physical cell whose \(w\) register is carrying the heat packet. It is not the unknown quantum payload and not an inaccessible old archive.

## 5. Original task and typed-null table

Marginally, the four marked fair bits are mutually independent and independent of receiver inputs. Equations (QV5)--(QV6) therefore give exactly P17 H.2's original task, source law, causal forecast order, Brier accuracy, matched fair baseline and margin. In particular

\[
 m=X_1,\quad f_1=X_1,\quad
 q_1=(1+2X_1)/4,\quad
 \mathbb E[(q_1-X_2)^2]=3/16.
 \tag{QV7}
\]

The fair baseline has risk \(1/4\), and the accuracy gain is \(1/16>1/32\). The actual feedback is \(d=m_{\mathrm{old}}\oplus X_1\), followed by \(m\leftarrow m\oplus d=X_1\). No forecast-only argument is used.

Here is a finite typed-null family on the same full source. All replacements reserve the same positive slots and retain the same output-register types. Source coins, heat gates, paid message traffic, task, initial law, clocks and score decoder are untouched.

- **Model-write null \(\iota_m\):** replace the designated model-write map \(\mathrm{CNOT}_{d\to m}\) by identity on the same supported registers. The model remains its initial zero. The later forecast is \(1/4\).
- **Forecast null \(\iota_p\):** replace \(\mathrm{CNOT}_{m\to f_1}\) by identity. The fresh second forecast bit remains zero, giving \(1/4\).
- **Verification-feedback null \(\iota_v\):** replace the outcome-dependent discrepancy ingress \(\mathrm{CNOT}_{y\to d}\) by identity. Since the task starts with \(m=d=0\), feedback is zero and the model/second forecast remain zero.

Each null has

\[
 \Pr(X_2=1)=3/8,\qquad
 \mathbb E[(1/4-X_2)^2]
 =\tfrac58\tfrac1{16}+\tfrac38\tfrac9{16}=1/4.
 \tag{QV8}
\]

These replacements specify the designated maps, not an unspecified operation of 'removing memory'. They have the exact Definition-5a typing and common-experiment witnesses by their support and equal-slot implementation. They demonstrate loss of the registered margin. They are not needed to re-prove a stronger universal irreducibility claim.

The full finite response table is particularly small to specify: enumerate the 16 marked fair strings, each with probability \(1/16\), run (QV5) with the specified identity substitution, and retain \((A_1,B_1,A_2,B_2,X_1,X_2,m,y,d,f_0,f_1,\text{cursor},\text{scores})\). Conditional translation distributions are \(r_{F_j}\) as in §3. This formula supplies every original/null branch, including its correlation with the heat endpoint record.

## 6. Original-program minimum: what transfers and what must not be changed

For the **unchanged physical cell**, P17 already proves

\[
 U_*(0)=w_0,\qquad C_P(\mu_0)=C_{op}=1.
 \tag{QV9}
\]

There is no empty program. All other words of length at most three fail to produce a distinct physical cell. The optimum proof concerns original binary program length, not the 75-bit carrier size and not a resource tariff.

The graph construction does not need a minimum over all physical source architectures. It needs (a) one real occurrence of that unchanged \(\mu_0\) at each vertex and (b) the actual coupled task to obey the law just proved. Once those facts are certified, the shorter-program exclusion for complexity one consists only of the empty program. The full graph/controller is an aggregate, not a new complexity-one MPU.

There is a necessary temporal distinction. All cells are instantiated in their ready state before packet loading and forecast execution. Packet loading, subsequent \(w\) interactions and core updates are actual charged operations. P17 expressly does not claim that every later interacting microstate again has complexity one. The construction uses that same convention and assigns no loaded or entangled state the status of a new minimum.

The admission is support-exact. The sole graph computation bit inside the cell is `w`, the aggregate-accessible bit already admitted in H.2/H.4. Core operations are precisely the cell's existing ROM calls, through its actual addressed fields as admitted in H.8. The incoming basis outcome enters the already declared port 6. Its source law remains the same four independent fair bits and Markov transform. A controlled operation on a separately measured source record cannot alter that record's classical law. All other carrier factors and general local unitaries belong to H.8's separately owned appliance, using C.6c.4a's independently admitted service alphabet. Thus no cell field, ROM descriptor, physical decoder branch, constructor output, or task law is changed. The coupling is proved by the concrete supported circuit, not inferred merely from equality of two marginal scores.

### 6a. Sharp state-versus-apparatus diagnostic

The two claims below are different.

1. **Instantaneous-state claim:** every loaded or evolved endpoint state of the cell is itself a Definition-23 minimizing state in the fixed presentation.
2. **Qualified-occurrence claim:** the graph vertex is the continuing physical occurrence of the admitted ready state \(\mu_0\), and the complete actual coupled task, starting at that ready state, has the full-loop qualification just proved.

The first claim is false for this construction. If a changed state \(\mu'\ne\mu_0\) is in the fixed complexity domain, P17's exhaustive short-program exclusion gives \(C_P(\mu')\ge4\); if it is outside that domain it is not in Definition 13's qualifying set at all. Since the original ready cell still gives \(C_{op}=1\), neither case makes \(\mu'\) an instantaneous minimum. In particular, setting \(w=1\), advancing the cursor, or retaining a nonzero forecast cannot be justified by assigning the new state program `0` again.

The construction asserts only the second claim, using exactly P17 H.3's express distinction between ready minimum cells and their later interacting states. The actual cell is not replaced, reinitialized, or renamed when the packet arrives: the same named 75 carrier factors persist, with only the supported gates above acting on them. Its constructor is run once. Its task window begins before loading/forecasting and contains both actual marked messages, the discrepancy and model update. The score is therefore a property of that ready state's actual subsequent coupled execution, not of a detached calibration device.

Definition 23 separately describes an MPU's evolving state and dynamics and does not impose the first claim as an all-times hypothesis. The construction does not prove the first claim. Its actual source-interface instance is the supported construction above, and its continuing vertex identity is the same named physical carrier throughout, not a fresh program0 assignment at each endpoint.

## 7. Clock construction at the fixed core actuation durations

One must not squeeze all twelve core gates into one \(n^{-4}\) heat period while silently changing the fixed P17 cell's actuation durations. There is a direct alternative.

Keep every core actuation and delivery duration fixed at its registered positive value. Choose fixed integers \(K_0,K\ge2\). Let the first forecast/readiness duration be \(T_0\le(K_0-1)\tau_*\), and require the complete post-first-endpoint ingress, five remaining core CNOTs, cursor updates and second-forecast/readiness duration to satisfy \(T_{\mathrm{core}}\le(K-1)\tau_*\). These finite choices are made once for the refinement family. Let

\[
 j_1=K_0n^4,\qquad j_2=(K_0+K)n^4.
 \tag{QV10}
\]

**Fast link delivery and fixed core ingress are different operations.** Paid graph broadcasts write the external live buffers using the heat-service clock. The later instruction delivery to the P17 core and its $\text{port }6\to y$ CNOT retain their original fixed positive durations. At the second mark the outcome can likewise wait in its external buffer for the separately scheduled fixed-duration observation/scoring service. No fixed-duration P17 event is inserted into a shrinking heat slot. The marked endpoint arrivals are exactly \(K_0\tau_*\) and \((K_0+K)\tau_*\), independently of $n$. Each actual delivered control bit is held in its live buffer and presented at the registered endpoint arrival, then enters the core at its fixed local ingress delay. The first marked source bits are consumed no earlier than \(K_0\tau_*-\tau_*\Delta_n\), after the first forecast freezes. Run ingress, verification, update and the second forecast on their original-duration local schedule after the first marked endpoint. The second source bits are consumed no earlier than \((K_0+K)\tau_*-\tau_*\Delta_n\); since \(\Delta_n<1\), the displayed \(T_{\mathrm{core}}\) bound leaves a strict positive safety interval. No claim merely comparing \(T_{\mathrm{core}}\) with \(K\tau_*\) is used. Ordinary heat macros proceed throughout. Their operations use \(w\), packet auxiliaries, and controls; the core pulses use the insulated core and its stable live ingress buffer. On disjoint supports these operations commute. Where the live classical input is shared, both uses are computational-basis controlled and the same commuting controlled-operation identity applies. No archive is opened for feedback.

This is one finite joint schedule, not a serial addition to every heat period. Its physical generator is the explicitly supplied sum of the heat/control and core pulse generators. It preserves the exact heat endpoint flags at \(j\tau_*\Delta_n\).

For complete qualification experiments take a finite horizon \(H\ge j_2\). Every shorter retained heat experiment is a prefix/restriction of such a finite instance; the remaining allocated apparatus and any actually executed continuation must stay charged. This is an extension-compatible finite family, not an assertion that a one-epoch apparatus performed a two-outcome qualification test. Longer finite protocol trees are handled by extending \(H\) and allocating fresh sources/records as in Definition 35b.15.

### Heat-side slot compiler

The qualified control law has extra operations beyond the unqualified heat word, so its slot count is recomputed. A conservative per-epoch bound is

\[
 G'_n=16+(b_n+1)N+3NW_n+64N,
 \qquad b_n=\lceil\log_2N\rceil,
 \qquad W_n=2n^3(n-1)^2.
 \tag{QV11}
\]

This reserves: the two fair-source readouts; one AND; controlled active-coin preparation and label readout; dissemination of the label and one enable/message bit; the original translation word with its enable controls; local parity reconstruction, fresh live copies and endpoint records; and surplus local bookkeeping slots. The finite compiler emits its actual word, verifies that its primitive count is bounded by (QV11), and pads to that count. Core operations on their fixed independent local schedule are **not** falsely charged as short-slot gates.

An explicit event-list bound is smaller than (QV11). Emit five source events (two fair measurements, AND, conditional label preparation, label measurement); at most two local events to form the outgoing message; exactly \((b_n+1)(N-1)\) paid tree CNOTs; at most two local CNOTs per vertex to reconstruct its enable; at most one fresh first-message copy per vertex; the \(3NW_n\) padded controlled qubit swaps; and \(2N\) occupancy copy/read events. Additional live-buffer/output copies may be allotted two per vertex. This totals at most \(7+(b_n+1)(N-1)+3NW_n+7N\), below (QV11). Every local equality test is part of the finite local classical control support of the admitted controlled-swap primitive, as in C.6c.4a. Core pulses and their final scoring/readout are on their separately emitted fixed-duration schedule. Terminal scoring may finish after the last marked heat endpoint; its own completion time is retained and charged without moving that endpoint.

Set

\[
 \eta'_n=\tau_*\Delta_n/(G'_n+1).
 \tag{QV12}
\]

All heat-compiler communications are coordinate-edge services and have reserved duration \(\eta'_n\). Local heat slots have the same duration; the last slot releases the unchanged endpoint flag. Their peak norm bound is \(2\pi\hbar/\eta'_n\). Every fixed-stage source is finite. Its refinement has growing strength and resource consumption, just as the ideal branch of Definition 35b.15 does.

This recompilation changes internal pulse durations and the resource vector relative to the unqualified representative of Definition 35b.15. Accordingly it is **not** an invocation of C.6c.4e's duration-preserving, zero-increment primitive-substitution branch. It proves the same endpoint law/clock directly. Any use of C.6c.4e must compare against this fully registered joint word, or provide the actual nonzero increment and applicable whole-schedule map.

## 8. Resource ownership and propagation metric

The ownership partition is explicit:

1. At each vertex, the actual P17 cell owns its 75 bits, immutable ROM, cursor, core operations, ROM loading and ready preparation.
2. The graph packet's two remaining qubits per vertex are local auxiliaries; they are not counted again as MPU core bits.
3. Every fresh fair-source qubit, measurement record, active coin, label copy, live control-message buffer, parity-work bit, endpoint record and score record belongs to the nominated source/controller. Fresh \(|+\rangle\) preparation and all records are charged.
4. Each dedicated graph lane has the original allocation, occupied intervals and complementary idle intervals. A null controlled invocation reserves and pays the same interval.
5. Immutable controller words, source coefficient expressions, compilation/fabrication input and traces, global clocks, pulse drivers and retained archives are allocated and maintained explicitly.

For any emitted finite word, count the actual finite registers and primitive occurrences, integrate their owned holding intervals, and use the **unchanged tariff coefficients** of C.6c.4a. Compute peak strength from the actual simultaneous generator \(H_{\rm heat}(t)+H_{\rm core}(t)\), not by omitting concurrent core drives. Its finite matrix norm at each of finitely many breakpoints is a complete specification; the bound \(\|H_{\rm heat}\|+\sum_x\|H_{{\rm core},x}\|\) is a check, not a claim of exact equality. Integrate the actual norm for the pulse-action record. All extra quantities constitute a nonzero, retained resource increment.

This is an algorithmically complete counting prescription for the finite source word. The loop-based compiler and its supported primitive list specify that word without expanding its very large finite list on paper. In particular, (QV11) is a conservative proven compiler bound, not an independently executed large-graph ledger certificate. Every concrete requested instance carries the generated list and exact counters as source inputs, as in C.6c.4a.

The transport metric remains exact. Its endpoints are the **actual \(w_x,w_y\) bits of the qualified cells**. A path of the admitted paid two-port SWAP services moves an arbitrary unknown qubit, including its entanglement with an external reference, successively through fresh ready `w` registers. At every step it swaps only the exposed `w` factors, leaving both insulated cores intact. An unconditional SWAP is the constant-true-control instance of the admitted locally controlled SWAP service. Each use costs exactly its edge charge, so this path attains the path sum as an identity quantum channel. For a purely classical probe the admitted CNOT path is an additional witness, but it is not substituted for quantum transport. Conversely, source-independent initial resources and a schedule with no nonedge communication imply that any input dependence at \(y\) has a causal path of charged edge uses from \(x\). Additional local cores and appliances cannot create an inter-port edge. All shared randomness is independent of the unknown test input. Thus the minimum link charge is the same shortest-path charge, and multiplication by \(\ell_*/n\) gives \(\ell_*d_n\). Full resource objectives are retained separately and are not asserted equal to link length.

## 9. Endpoint intertwiners and continuum transfer

Let \(\omega_x\) be the original operator-valued payload blocks, including an arbitrary external spectator. On a branch \((a,b,v)\) the packet map is

\[
 \omega_x\longmapsto \tfrac14 r_{a\land b}(v)\,\omega_x
 \quad\text{at }x+v,
 \qquad r_0(v)=\mathbf1_{v=0},\quad r_1(v)=r_n(v).
 \tag{QV13}
\]

All added live/core/source records follow the explicitly declared finite classical maps. Summing \((a,b)\) gives \(p_n(v)\omega_x\). On each complete original endpoint history the summed payload map is its probability times the identity. The added record probabilities are (QV4) followed by deterministic core/null maps; hence there is no hidden payload-information channel.

Induction over a finite adaptive endpoint protocol tree gives equality of every original unnormalized branch state after the additional records are decoded away **when the policy uses only the original decoded endpoint records**. This includes arbitrary initial payload/reference states, diagonal endpoint interventions and every original-history-dependent classical policy. Policies that read the added active flags, core outputs or extra source records belong to the explicitly extended reference experiment (QV13)/(QV4). Physical execution matches that extended experiment exactly by the same branch induction. No equivalence to a policy denied those records is claimed. Thus extra records are retained and typed, not silently discarded from a purported full-response equivalence. The same induction applied to the three explicit null circuits yields their exact, generally different, joint response tables. Later normalized operations leave earlier retained marginals unchanged.

Because the original endpoint matrix and the physical endpoints are exactly unchanged,

\[
 (\tau_*\Delta_n)^{-1}\log P_n=r_nL_n/\tau_*.
\]

The source's selected form, normalized resolvents, direct probes, paid metric, state/measure pairing, nested cell maps and common-core limit are therefore those of Definition 35b.15 and Theorem 35b.16 once each requested probe is compiled on the same paid support. The extra qualification/control records remain retained source records; they are not asserted to converge to new continuum fields. The construction retains the original fixed finite smooth-effect/heat protocol quotient and the original between-endpoint restrictions. It does not evade the positive-latency obstruction.

## 10. Direct qualified-vertex realization proposition

**Proposition.** Fix P17's qualified semantic ready cell, original prefix presentation, physical law/task/baseline/margin, and the finite descriptor-timed endpoint service class of C.6c.4a. For each level of Definition 35b.15, either rate representative, and sufficiently long finite horizon, the construction in §§3--8 yields a network whose graph vertices are persistent physical occurrences of that qualified ready cell. Its actual paid transport has metric \(\ell_*d_n\). Its retained completed heat channel is \(e^{r_n\Delta_nL_n}\) at period \(\tau_*\Delta_n\). Its actual predictive task concerns its delivered execution-control messages and has the original and null laws of §5. Its resources are the explicitly counted new finite source vector under the unchanged tariff. The original form, cell maps, common-core transfer and endpoint continuum conclusions apply to this same source.

**Proof.** Instantiate the unchanged 75-bit ready cell at every vertex and retain its original constructor and own ROM. Its graph-accessible bit and environmental ingress have exactly the supports already allowed by P17. All new source, packet and controller factors are separately owned. Their finite unitaries have the explicit principal-log generators, their projective services are normalized CP instruments, and all wire crossings use paid edge primitives. These facts establish physical admission of the complete word, rather than assuming composition of two unexplained mechanisms.

The four marked source bits have their original independent fair law; measuring them and applying a source-record-controlled heat operation leaves that law unchanged. The unchanged core gate sequence consequently gives the actual full predictive loop and strict margin of (QV7), and the supported identity replacements give the full null table (QV8). The same ready cell and full-constraint program `0` are present. The empty-program exclusion gives the original-complexity minimum; no expanded apparatus is assigned that code.

The active/idle identity (QV3), with all operators extended by spectator identities, gives (QV13). Finite protocol-tree induction proves the complete original endpoint law and each separate null law with their actual extra records. The paid-path upper and causal-path lower bounds give the transport metric. The schedule in §7 preserves every registered heat endpoint, leaves the core's positive durations unchanged and consumes its two outcome sources only after the corresponding forecasts. The same cell executes its core sequence once; its ROM, cursor and retained records are never reset or reused as fresh resources. Every additional occurrence and maintained interval is charged by §8. The unique self-adjoint logarithm and the exact direct probe/pairing maps therefore give the original graph forms and continuum transfer at the same physical clock. This proves the claims.

The source word is defined by finite nested loops: allocate the named carriers; instantiate the unchanged ready cells; prepare the explicitly named fresh factors; list the marked events; for each epoch emit the source, paid dissemination, controlled translation and endpoint-record primitives; merge the fixed core pulse schedule by time; append requested direct probes/readouts; then compute the occurrence and interval counters from this finite list. Its finite control parameters are the same Fourier/exponential expressions already admitted by C.6c.4a. No instruction queries original-program minimality, future outcomes, or an arbitrary prohibition predicate.

**Relationship to C.6c.4e.** The proof is direct and does not claim its primitive-duration identity against the unaugmented heat word. The whole joint source includes its extra records. Original heat responses are its declared record restriction; qualification and null responses retain those records. The explicit occurrence/role map and direct clock equality provide the data that a consumer needs. The original exact-ledger branch of Theorem C.6c.4e is not invoked.

<a id="theorem-c6c7-descriptor-weighted-full-record-endpoint-source"></a>**Theorem C.6c.7 (Descriptor-Weighted Full-Record Endpoint Source).** Extend Definition 35b.15's graph inputs by allowing, on every oriented edge, a nonzero integer descriptor $s_e\in\mathbb Z^d$ with $s_{\bar e}=-s_e$. Keep the graph, rational symmetric rates, uniform node probability, period test, endpoint access boundary, source alphabet, P17 ready cells and fixed tariff. Set $q_e=|s_e|$. For each macro of the prescribed expansion let $g$ be the number of its heat-side service calls, each followed by its two clock-update calls. Give a link call on $e$ weight $q_e$ and every local or record call weight one; write these weights as $u_1,\ldots,u_g$. Replace (35b.15.2) by
$$
D=1+2g+\sum_{i=1}^g u_i,\qquad
\eta=\frac{\tau_*\delta}{D}.
\tag{C.6c.7.1}
$$
Call $i$ reserves $\eta u_i$, its two clock updates reserve $2\eta$, and the final endpoint flag reserves $\eta$. The fixed-duration predictive-core schedule remains unchanged.

This defines a complete finite source on every admitted descriptor input. Its full state-and-record response is (35b.15.3) with the actual weighted timing and resource records, and its completed heat channel is $e^{\delta Q}$ at physical period $\tau_*\delta$. Its paid transport metric, in any declared microscopic length unit $\ell_0>0$, is
$$
d^{\rm src}(x,y)=\ell_0\min_{\gamma:x\leadsto y}\sum_{e\in\gamma}q_e.
\tag{C.6c.7.2}
$$
All local auxiliaries, core/source records, clocks and occupied/idle lane intervals retain unique owners under the unchanged tariff. Every finite adaptive endpoint protocol and each prescribed original or typed-null qualification circuit has the complete reference law, including external payload references and stopped invalid-input sectors.

*Proof.* A nonzero integer descriptor has $q_e=\sqrt{Q(s_e)}\ge1$, an algebraic number with a finite defining expression and positive-root certificate. The finite input graph and finite prescribed expansion therefore give finite positive $D$ and $\eta$. Every two-port gate fits inside the first $\eta/2$ of its reserved interval, exactly as required by Definition C.6c.4a. The actual occupied interval is $\eta q_e$, and its normalized meter is
$$
\eta^{-1}\int_{\rm busy}1\,dt=q_e.
$$
The entire heat macro has duration $\eta D=\tau_*\delta$. Clock updates, local services and the final flag have their listed positive intervals. The finite drive words and algebraic timestamps specify the complete schedule; their preparation, synchronization, holding and strength records remain charged.

The graph search, current-occupancy gather, row preparation, paid broadcasts and controlled packet paths of Definition 35b.15 use the same finite primitive supports. Replacing a reserved time changes no completed gate matrix. For a local or link unitary $U$, its half-slot generator is $i\hbar\operatorname{Log}(U)/(\eta/2)$, whose norm is at most $2\pi\hbar/\eta$. The code-check projectors, source measurements and endpoint instruments retain their normalized full-carrier maps. All records continue to be written into fresh factors. The decoder checks the same expansion algorithm with the substituted descriptor timers, so every valid input produces an admitted word and every accepted word has that expansion. This is source coverage on the stated finite descriptor class.

The matrix $P=e^{\delta Q}$, the active row $R=4P-3I$, the conditional branch probabilities and the packet path actions are independent of the service descriptors. The input period test still gives $P_{xx}\ge7/8$, so every row preparation remains normalized. Thus each valid branch still maps the arbitrary payload/reference block by
$$
\omega_x\longmapsto\frac14r_{a\land b}(x,y)\omega_x
\quad\text{at }y.
$$
At every retained boundary append the actual circuit-specified source/controller/clock states, and the actual conditional P17 core state, to that block. The measured source labels are all retained; their distinct histories give orthogonal ranges. The resulting isometries obey (35b.16.4) with the new physical times and resource records. The stopped invalid-code sectors use the same complete projectors and residual packet spaces. Branchwise composition and induction on the finite adaptive tree prove the complete joint law, including policies that use the added records.

The predictive core uses the same ready state, original constructor, actual exposed occupancy bit, delivered enable messages and fresh fair source pairs. Its first and second outcome laws, pre-outcome forecasts, supported model/verification/forecast nulls and original-program minimum are therefore unchanged. Choose the generic separated mark indices from Theorem 35b.16 at the declared $\delta$. Since the weighted macro has exactly its original boundary period, these marks preserve both forecast order and every positive fixed core duration. Heat-side and core drives have their already specified disjoint or nondestructively controlled supports. Their actual sum supplies the simultaneous Hamiltonian and its norm/action records.

An unconditional exposed-qubit SWAP along a simple path transfers an unknown qubit and its external reference exactly, with link charge equal to that path's sum of $q_e$. There are finitely many simple paths, so a shortest weighted path attains the displayed minimum. Conversely, a retained output dependent on the unknown input requires a directed circuit ancestry of paid inter-port calls. Removing cycles gives a graph path, and every charged call has its positive $q_e$. The total nonnegative link charge is at least that path's charge. This proves both inequalities in (C.6c.7.2).

Finally, partition actual factor holdings, primitive calls and time intervals by the owners in Theorem 35b.16. Each lane's busy intervals have their substituted lengths and its idle intervals are their complement in the allocated lifetime. Other bit-time excludes all lane intervals. The finite timestamp partition determines the exact simultaneous generators, peak norm and action integral. Disjoint union of occurrence lists and refinement of time partitions preserve every sum and integral. The same fixed tariff therefore supplies the complete new resource vector with exact ownership and recomposition. ∎

<a id="corollary-c6c71-one-qualified-source-for-the-varying-stencil-rcd-limit"></a>**Corollary C.6c.7.1 (One Qualified Source for the Varying-Stencil RCD Limit).** Fix $\theta=1/2$ in Theorem C.6c.4 and the nested stages $n=3^{2j}$, $j\ge2$. On the vertex labels $(\mathbb Z/n\mathbb Z)^4$, let
$$
\begin{aligned}
m&=\sqrt n,\qquad S_m=\{s\in\mathbb Z^4:0<|s|\le m\},\qquad
Q_m=\sum_{s\in S_m}|s|^2,\\
a_n(s)&=\frac{n^2}{2}\mathbf1_{\{\pm e_i\}}(s)+\frac{4n^2}{Q_m},\qquad
\mu_n(x)=n^{-4},\qquad \Delta_n=n^{-4}.
\end{aligned}
\tag{C.6c.7.3}
$$
Give the edge $x\to x+s$ descriptor $s$, and use Theorem C.6c.7 with rate $c_{x,x+s}=a_n(s)$, period $\delta=\Delta_n$ and microscopic physical length $\ell_0=\ell_*/n$. There is one qualified finite source at every stage and every qualification-complete finite horizon whose full retained response, physical clock, measured metric, reference measure and complete source-cost vector are compatible with all of Theorem C.6c.4's noncollapse, graph-energy Poincaré, quadratic Mosco, smooth-core curvature, Sobolev-to-Lipschitz and harmonic-chart conclusions. Its limit metric-measure space is the flat physical torus of side $\ell_*$, with noncollapsed $\mathrm{RCD}^*(0,4)$ structure. Finite vertex stages retain the graph-energy and smooth-core conventions of that theorem.

*Proof.* The stencil is a finite integer enumeration. Since $2m<n$, distinct stencil elements give distinct neighboring labels; antipodal elements give reverse edges. Coordinate directions connect the graph. All rates and node probabilities are positive rational, and antipodal symmetry gives reversibility with respect to the uniform probability. With $M=|S_m|$ and $Q_m\ge M$,
$$
b_n=\sum_sa_n(s)=4n^2+\frac{4n^2M}{Q_m}\le8n^2,
\qquad b_n\Delta_n\le8/n^2<1/8.
\tag{C.6c.7.4}
$$
Thus every stage satisfies the graph-general compiler's period test. Its actual completed channel and transfer logarithm are
$$
P_n=e^{\Delta_nL_n},\qquad
\frac1{\tau_*\Delta_n}\log P_n=\frac{L_n}{\tau_*}.
\tag{C.6c.7.5}
$$
The logarithm is the unique self-adjoint logarithm in $L^2(\mu_n)$, since $P_n$ has strictly positive eigenvalues. Its time normalization is the physical completion period, including the weighted lane reservations and all clock updates. Choose the fixed marked times using indices $K_0n^4$ and $(K_0+K)n^4$ as in Theorem 35b.16. The same actual delivered control messages qualify the persistent P17 cell at every graph vertex, with all other packet and controller factors separately owned.

The meter identity (C.6c.7.2) gives $d_n^{\rm src}=\ell_*d_n$, where $d_n$ is precisely the weighted graph metric of Theorem C.6c.4. Uniform packet preparation by the paid row compiler gives node probability $\mu_n(x)=n^{-4}$. The source reference-volume atom is $v_x=\ell_*^4\mu_n(x)$, and its physical rate and conductance are
$$
r_{xy}=a_n(s)/\tau_*,\qquad
\mathfrak c_{xy}=v_xr_{xy}=\frac{\ell_*^4}{\tau_*}n^{-4}a_n(s).
\tag{C.6c.7.6}
$$
Consequently the probability/observable pairing, reference-volume pairing and detailed-balance adjoint are the ones used by the analytic sequence, with their explicit factors. The normalized-probability time form and metric-normalized form are
$$
\mathcal E_n^{\rm time}(f)
=\frac12\langle f,-(L_n/\tau_*)f\rangle_{\mu_n}
=\frac{\mathcal E_n(f)}{\tau_*},\qquad
\frac{\mathcal E_n^{\rm time}}{\ell_*^2/\tau_*}
=\frac{\mathcal E_n}{\ell_*^2}.
\tag{C.6c.7.7}
$$
For the convention $\mathcal E_n(f)=\langle A_nf,f\rangle$, the form operator is $A_n=-L_n/2$, its Hilbert gradient-flow operator is $2A_n=-L_n$, and the physical heat is $e^{-2TA_n/\tau_*}$. The Markov generator for the metric-normalized $\Gamma$ calculus is $L_n/\ell_*^2$. These factors follow from (C.6c.7.5)–(C.6c.7.7), without substituting the different source normalization of the degree-three sequence.

The direct probes have their original numerical laws on this same source. Draw $S$ with probability $a_n(S)/b_n$ into a fresh source record and use a finitely described field table. The outputs
$$
b_n[f(x+S)-f(x)],\qquad
\frac{b_n}{2}[f(x+S)-f(x)]^2
$$
have expectations $L_nf(x)$ and $\Gamma_n(f)(x)$. Two independent such draws $S,T$ and output $b_n^2[\Delta_S\Delta_Tf(x)]^2/4$ give $\Gamma_{2,n}(f)(x)$, because the torus translations commute. Every table, source draw, arithmetic operation, communication and record belongs to a prescribed finite source word. Divide the first two readouts by $\tau_*$ and the second-iterated readout by $\tau_*^2$ for physical time-generator units. Multiplying the corresponding generators by $\tau_*/\ell_*^2$ gives the metric-normalized probes. Thus the actual source has exactly the moment, radius-two collision and smooth-core test data of Theorems C.6c.4 and C.6c.6.

The source metric and reference measure satisfy (C.6c.4.2)–(C.6c.4.3) after the substitutions $r\mapsto r/\ell_*$ and $\mu\mapsto\ell_*^4\mu$. The graph-energy Poincaré estimate (C.6c.4.4) uses $\Gamma_n/\ell_*^2$ at physical radius $r$. The forms in (C.6c.7.7) are exactly the accepted Mosco sequence in this physical metric and normalized measure; multiplication by the fixed total volume $\ell_*^4$ supplies the volume-measure version. The actual probes obey the smooth-core $\Gamma_2$ estimate (C.6c.4.8), and the four mixed test errors and full-domain diagonal extension proved in Part I of Theorem C.6c.6 apply because every metric, measure, rate and test pairing is identical. Their limiting integrated $\mathrm{BE}(0,4)$ inequality, quadratic Cheeger identification, Sobolev-to-Lipschitz property and harmonic atlas therefore belong to this source's limit. The fixed finite mesh retains graph-energy PI above its stated mesh radius and smooth-core curvature stability.

For the nested stages, a fine position label maps to its containing coarse half-open cell. Every coarse cell has the same number of fine labels. Its source probabilities push forward exactly, and coarse replication and fine averaging are adjoint in the declared pairings. A fresh live label decoder implements the finite map before its output is archived; its circuits and records are charged. Source, core and resource records remain in the full reference fibre. On the common smooth spatial core, with $t=T/\tau_*$ and $H_t=e^{t\Delta}$,
$$
\left\|P_n^{\lfloor t/\Delta_n\rfloor}S_nf-S_nH_tf\right\|_\infty
\le\frac43t h_n\|D^3f\|_\infty
+\Delta_n\|\Delta f\|_\infty,
\qquad h_n=m/n.
\tag{C.6c.7.8}
$$
The generator error in Theorem C.6c.4, integrated by Duhamel between the two contractive semigroups, gives the first term up to the last completed endpoint. Integrating the continuum time derivative from that endpoint to $t$ gives the second. Both tend to zero uniformly on bounded physical time intervals. For an arbitrary $L^2$ load use the cell-average map $(J_nf)(x)=n^4\int_{C_x}f$, where $C_x$ is the corresponding half-open grid cell. Jensen gives $\|J_n\|\le1$, and constant cell interpolation is an isometry with $I_nJ_nf\to f$ strongly. For smooth $f$, the cell diameter gives $\|J_nf-S_nf\|\le2n^{-1}\|\nabla f\|_\infty$; the same bound for $H_tf$ is uniform in $t$ because heat contracts the gradient norm. Adding these two errors to (C.6c.7.8) proves the comparison with $J_n$ on smooth functions. Approximate an arbitrary $L^2$ load by a smooth one; contraction of $J_n$, both heat operators and cell interpolation bounds the remaining error by twice the approximation error. This proves strong $L^2$ comparison with $J_n$, without applying point evaluation to an arbitrary $L^2$ function. For a fixed finite protocol of smooth bounded position effects, multiplication preserves the comparison and expansion of each unnormalized finite branch product gives convergence of its probability. The full finite source law before this registered scalar restriction is exact by Theorem C.6c.7. Hence the same source supplies the endpoint, refinement and continuum responses together with the stated clock, length and source-cost maps. ∎

<a id="theorem-c6cq02a-source-exact-three-qubit-predictive-cell-and-physical-payload-supplier"></a>**Theorem C.6c.Q02a (Source-Exact Three-Qubit Predictive Cell and Physical Payload Supplier).** The consumed source is the finite driven cell/prefix presentation declared below, with its own ready microstate, original-program minimum, full cell response algebra and native operator/control ledger. Its presentation is distinct from the 75-bit P17 host and from the native R14 source of Theorem 2.4.1h. Only the qualifying core/capability and whole-cell payload-source roles are consumed; no global original-baseline MPU classification or EHOLO whole-owner result is inferred. The full finite assembly/controller/clock/archive allocations and driven pulse budgets for the actual Q02 programmes are supplied in Theorems Q.0.1t and Q.0.1v.

#### Physical type and primitive source leaves

1. A source module is exactly three qubits in a one-centimetre cabinet. Its Hilbert space is $\mathbb{C}^8$, not a marginal of a larger insulated cell. Its fixed two-core-qubit wiring supports CNOT(low,high) and CNOT(high,low). The third qubit is an independently addressable payload.
2. Fresh ready preparations supply one pure zero core-high bit, one degenerate maximally mixed core-low bit, and one pure zero payload. The mixed factor is the exact finite-temperature Gibbs state of a two-level zero Hamiltonian. Pure blanks are consumed initial resources, not claimed exact finite-bath erasures. Every one of these preparations and their physical cells is charged. No unlisted physical purifier is postulated.
3. Each finite named $X$, $H$, CNOT, Toffoli and controlled-$H$ pulse is the explicit bounded involution generator $\pi\hbar(I-U)/(2\tau_g)$, with $\tau_{g}>0$. The quarter-phase pulse $Q=\operatorname{diag}(1,-i)$ has generator $\pi\hbar(I-Z)/(4\tau_g)$. A discrete controlled-$Q$ is synthesized with Toffoli(control,target,fresh scratch), $Q(\text{scratch})$, and the same Toffoli; scratch is an explicitly counted qualified-cell payload and returns to zero. There is no additional phase parameter or gate leaf. The two-core update is TWO such CNOT pulses. A layer on $N$ cores owns $N$ couplings and $N$ supports. There is no black-box arbitrary-matrix synthesis leaf.
4. A computational readout has projectors $P_{z}$ and instrument branches $I_z(\rho)=P_z\rho P_z$ (individual branches are unnormalized; their sum is trace preserving). Its fresh owned pointer is coupled by CNOT; the response distribution is its Born distribution. Pointer records are counted, and pointer/measurement auxiliaries are retained where physically present. Mathematical restriction to a classical pointer-response algebra is not erasure of its complete physical carrier.
5. Finite source/control programmes use actual ROM and one-hot cursor payloads in other copies of this module. Source delivery and gate/instrument durations are strictly positive. Every mutable control/record/reserve is in the carrier count. Fixed coupling constants are physical branch parameters, not secretly variable programme states. Their finite descriptions, installation writes and fabrication source are owned.
6. The source admits a finite drive service for exactly those listed pulses and their named addressed supports. Its waveform, amplitude, duration, clock/cursor and native work are registered. This is an ideal finitely driven model, as in the P17 branch of Theorem C.6c.P17a; a closed autonomous implementation or noiseless manufacture is not inferred. A branch requiring either needs its own supplier certificate.
8. The native Appendix-B source has $e_b=\hbar/\tau_0$ per-cell baseline, declared finite proxy/cost functions, all Hermitian pulse/support operators, and explicit drive work. The source-free autonomous conservation theorem and microscopic material stress of the ideal current sheet are not claimed.

These source leaves are finite and compatible as a declared ideal source. The proof establishes the cell's finite full-loop response and original-program minimum from them. It does not prove that a presently manufactured device realizes them. The source is not admitted merely because a cost is positive; the exact Hilbert states, matrices, circuit, instruments, times and ownership are supplied separately.

#### 1. Exact cell and full adaptive task

The cell Hilbert space is

$$
H_{\mathrm{cell}} = H_{\mathrm{core}} \otimes H_w = \mathbb{C}^4 \otimes \mathbb{C}^2 = \mathbb{C}^8.
$$

Write a core basis state as $q=2a+b$, with two actual core qubits $a,b$. The payload $w$ is a third physical qubit. The ready preparation is

$$
\rho_{\mathrm{core}} = (|00\rangle\langle 00| + |01\rangle\langle 01|)/2,\quad w=0.
$$

Thus `a` is a pure ready zero, `b` is one explicitly owned degenerate maximally mixed input bit, and `w` is a pure ready zero. The mixture is an actual density-operator preparation, as permitted by Definition 24. It is not a random string whose label is being used as a complexity lower bound. A purification, if a source variant actually retains one, must be added to its owned cells; the submitted mixed preparation does not assert a physically present but uncounted purifier.

One core update is the actual two-gate circuit

1. CNOT(b,a)
2. CNOT(a,b).

Therefore

$$
U(a,b)=(a\oplus b,a),\quad\text{or}\quad 0\to 0,\quad 1\to 2\to 3\to 1.
$$

These are elementary admitted finite unitaries. Nothing is implemented by a primitive called “ND-RID.” Set the following operational readouts:

- Input/environmental observable of this self-prediction task: $E(q)=1_{q\ne 0}$.
- Current model prediction: $p(q)=a$.
- Stored preceding forecast after an update: $p_{\mathrm{old}}(q)=b$.
- Verification error: $v(q)=a(1-b)=1_{q=2}$.

Three identities hold on **all four** basis states:

$$
E(Uq)=E(q),\quad p_{\mathrm{old}}(Uq)=p(q),\quad v(Uq)=E(q) \oplus p(q).
$$

Thus the update preserves the actual input observable, retains the preceding forecast in a genuine core bit, and writes an exactly readable discrepancy. These are not merely names attached to an output label. They follow from the actual gate transition. The three core states 1,2,3 are distinguishable states of the device's own model/forecast/history; the model is an estimate of the device's own conserved input observable. This meets the self-state role required by Definition 5. A complete model of its own universal interpreter is not a requirement of Definition 23 and is not substituted for this concrete self-model.

The declared **finite** task uses the ready law above and two core updates. Its two possible trajectories are

$$
E=0:\ 0 \to 0 \to 0,
$$

$$
E=1:\ 1 \to 2 \to 3.
$$

At the beginning the forecast is 0. The first update verifies it, retains it, and writes the learned prediction $p=E$. The second update verifies that learned prediction: its discrepancy is 0 on both branches and its current prediction remains $E$. The original outcome is recoverable as $E(q)$ throughout, including at the comparison instants. No postselection on $E$ occurs.

Register accuracy

$$
A = \Pr[p\ \text{after the first update} = E\ \text{at the second update}].
$$

At each of the two reachable pre-update states, the actual feedback value is $e=E(q)\oplus a=b$. The first CNOT therefore performs the causal correction $a_{\mathrm{new}}=a\oplus e=E$; the second stores $a_{\mathrm{old}}$ in $b$. This is the physical feedback path, not an error label inferred only after a forecast has already been produced. The equality $e=b$ is claimed on the declared two-tick reachable domain $\{0,1,2\}$, not on state 3 outside that pre-update window.

The source's score is exactly 1. Its matched baseline is an independent fair **binary prediction**, whose score is 1/2. The declared strict margin is 1/4, so $1>1/2+1/4$. This is not the Brier comparison against the distribution forecast 1/2. Nulling the first core update leaves prediction 0 and gives score 1/2. The initial prediction, actual discrepancy, feedback-dependent change of model/forecast, and subsequent verified prediction are all present; above-chance score alone is not used as a loop certificate.

This uses the fixed task/window allowed by Definition 13, as the P17 host of Theorem C.6c.P17a also uses a fixed finite calibration window. There is no claim of a permanently learned predictor. At the third update the 1-sector returns to state 1. Its long-run fair-E score is 5/6, but that is not the declared qualification theorem. In particular neither a finite task nor its score establishes an autonomous indefinitely reusable learning device.

The input is an actual internal source register, not an external unknown position. Definition 4 explicitly permits interaction with an internal state. The internal input is not supplied as a program label.

#### Registered Evolve instruments and actual outcomes

For the audited cell, the actual two READs before each update implement the joint core-basis instrument. Write $P_q=|q\rangle\langle q|\otimes I_w$. Its update branches are $J_q(\rho)=UP_q\rho P_qU^*$, $q=0,1,2,3$. Each branch is CP and trace-nonincreasing, and their sum is trace preserving. The conditional state is $J_q(\rho)/\operatorname{Tr}J_q(\rho)$, with probability $\operatorname{Tr}J_q(\rho)$. The perspective kernel is the point mass at the fixed perspective, and arming is the counted external clock. Its pointer realizations are the two actual fresh records in the emitted program. The observed $q$ supplies $E(q)$, old forecast and the feedback used by the displayed causal CNOT correction. These are explicit Definition-27/ND-RID branch data, not a primitive named “ND-RID.”

For cells whose cores are not externally audited in this run, the actual calibration channel is the single-outcome instrument $J_*(\rho)=U\rho U^*$; it requires no emitted pointer. The actual ready diagonal law gives the same nonselective core evolution under that instrument and the audited one. They differ on coherent off-diagonal core inputs, and no equality on all $M_8$ is claimed. Every module has the same qualifying protocol capability and the same ready state; only the sensor's audit records are actually emitted in this concrete word. No millions of unlisted audit bits are present. Definition 27 permits a one-outcome instrument and does not itself infer intrinsic stochasticity; the admitted selector and the initial mixed law are explicitly separate source data. The original stochasticity owner is unaffected.

#### State and clock ownership

The core has no local ROM or hidden cursor. Its two CNOT couplings are fixed structural source data, just as a fixed primitive Hamiltonian is structural data. Their finite specification, manufacture/installation record and driver are separately owned. A fixed hardware law does not require a further variable ROM state inside every instance; a ROM that is actually used must be counted.

The two update stages are selected by the owned finite external controller of the declared driven source. The $E=0$ core is a fixed point, so the core itself is **not** claimed to encode the stage. That stage lives in the counted clock. The controller's payload cells have the same predictive core and undergo the same two unprobed calibration updates; they admit the same audited qualifying protocol when requested. Their different payload roles do not change the core qualification or its score. Each physical cell begins as a ready instance of the same minimum module; later interacting states need not each remain minimum-complexity ready states. This is the same per-module versus aggregate distinction used by P17, without importing P17's 75-bit cell.

#### 2. Actual original-program minimum, with no complexity-from-capacity step

Freeze the new finite physical syntax and its typed decoder first, using the complete finite grammar and validity tests below. Its validity tests refer to dimensions, preparations, allowed couplings, finite positive durations, addresses and ownership. They do not refer to MPU status, $C_P$, $C_{\mathrm{op}}$, a desired score or any conclusion proved here. Let $w_0$ be the finite literal descriptor of the ready cell just specified. Fix a blank reference and the constant decreasing hierarchy $L_n=L$, where $L$ is the set of original binary programs terminating at valid physical descriptors under these laws.

For completeness, one can obtain an optimal prefix machine $W$ without assuming that an arbitrary interpreter is optimal. Enumerate graph enumerators. In enumerator $e$ accept an input/output pair only if its input is prefix-incomparable with all previously accepted inputs; ignore repeats and conflicts. The accepted relation defines a prefix partial machine $D_{e}$. Every prefix partial machine occurs, by dovetailing its graph. Then $W(1^e0q)=D_e(q)$ is prefix-free and satisfies $K_W(y)\le K_M(y)+e+1$ for every prefix partial machine $M$ and its corresponding $e$. This is optimal prefix universality.

Let $V$ be the explicit prefix literal/TM interpreter with literal branch `0 enc(w)` and simulation branch `1 enc(e) enc(x)`, where $\mathrm{enc}(w)=1^{|w|}0w$; reject incomplete fields and trailing junk. Define the **original** machine

$$
U_{\mathrm{new}}(000)=w_0,
$$

$$
U_{\mathrm{new}}(010\,q)=V(q),
$$

$$
U_{\mathrm{new}}(111\,q)=W(q).
$$

Leave it undefined otherwise. Tags 000,010,111 are prefix-incomparable, and their suffix domains are prefix-free; hence this is an optimal prefix machine. W has no empty input (its unary machine tag contains at least its final 0), and V has no empty input. Thus all seven strings shorter than length 3 are undefined, and 000 is the only physical output at length 3. The grammar classifies all fifteen strings through length 3 directly; optimal prefix universality follows from the argument above.

The constructor 000 is common to every hierarchy level and realizes this very ready cell. Section 1 proves its physical full-loop qualification on the declared task. Directly applying Definition 23 gives

$$
C_P^{\mathrm{new}}(\mu_0)=C_{\mathrm{op}}^{\mathrm{new}}=3,\quad\text{attained}.
$$

No shorter qualifying physical state exists because no shorter physical output exists at all. This is an original-program exclusion, not a gate-count, input-label or Hilbert-capacity argument. Any distinct aggregate has complexity at least 4 and a finite literal constructor `010 0 enc(w)` of length $2|w|+5$. The actual finite construction/installation records remain owned in the source and compiler ledger. The ready cell's small constructor does not make those physical records free.

This presentation is explicitly target-informed and is distinct from the independently defined hierarchy of §2.4.1. Its minimum is proved above within this presentation. The global original-baseline MPU owner is unchanged.

#### 3. Full native algebra and actual reset channel

The source admits $X$, $H$, the quarter-phase $Q=\operatorname{diag}(1,-i)$, CNOT, Toffoli, controlled-$H$, and basis instruments on the named core/payload ports. Each involution $V$ has the explicit generator $\pi\hbar(I-V)/(2\tau_g)$; $Q$ has generator $\pi\hbar(I-Z)/(4\tau_g)$. A required controlled-$Q$ is synthesized by Toffoli(control,target,fresh payload 24), $Q(24)$, and the same Toffoli; the extra qualified-cell scratch returns exactly to zero. No new phase gate leaf is added. The core $U$ is the displayed two-CNOT circuit. These bounded finite Hamiltonians are physical ideal source leaves; no all-CPTP synthesizer is assumed.

Local Pauli preparations and measurements are obtained by the finite X/H/Q words. The 64 three-qubit Pauli words are orthogonal under trace inner product and span `M8`. Consequently the admitted cell response algebra separates the entire eight-dimensional carrier, including its core. It is not just the exposed payload algebra. This also shows that a faithful carrier for this whole algebra cannot have dimension below 8. It supplies an actual dimension-8 representative; no generic resource/capacity relation is used to infer program minimality.

#### 5. Native Appendix-B operator ledger, not just a currency quotation

Fix $\tau_0=\tau_g=1\ \text{second}$, $e_b=\hbar/\tau_0$, $v_{\mathrm{cell}}=\delta^{3}=10^{-6}\ \mathrm{m}^{3}$, and the physical energy reference $E_0=0$. Each owned cell has idle internal Hamiltonian $H_v=e_bI$. Its actual core/gate dynamics are the explicit registered self-adjoint control interactions. The constant baseline is a nominated physical source datum; it is not inferred from a complexity label or from a noise response. It satisfies the Theorem-29 calibration $\langle H_v\rangle=R(3)\,\tau_0$ with $R(3)=e_b/\tau_0$.

In the fixed complexity unit one bit, register

$$
R(C)=R(3)+r_p(C-3)^2,\quad r_p=e_b/\tau_0,\quad C\ge 3,
$$

$$
R_I(C)=r_I\log_2(C/3),\quad r_I=e_b/\tau_0,\quad C\ge 3.
$$

Take the declared finite coarse bin $\hat C_v=3I$, so $\hat R_v=R(3)I$, $\hat R_{I,v}=0$. This bin is an operational proxy, not a claim that every evolving state has exact algorithmic complexity 3. The ready-state equality to 3 has the independent proof in Section 2. Zero excess reflexive overhead at $K_0=3$ does not make verification free: every carrier, baseline, gate and control is still paid.

For each actual pulse $e$, $V_e(t)$ is its displayed Hermitian generator on its full support. When a pulse uses controller/record auxiliaries, name all those cell ports in that support. A global calibration layer is the sum of $N$ disjoint CNOT generators and has norm at most $N\pi\hbar/\tau_g$. Designate pulse endpoints and allocate half of $V_{e}$ to each, as Definition B.4 permits on explicitly enlarged local auxiliary support. Then

$$
\epsilon_v(t)=H_v+[\hat R_v-R(3)I]\,\tau_0+\hat R_{I,v}\,\tau_0+(1/2)\sum_{\mathrm{incident}} V_e(t),
$$

$$
\hat\rho_v(t)=\epsilon_v(t)/v_{\mathrm{cell}}.
$$

All terms are finite Hermitian operators in energy and energy-density units. Summing v counts each control interaction once and every cell baseline once. No non-Hermitian dissipator is inserted as an energy. On the active fixed-bin sector the sum is the actual driven quantum Hamiltonian plus its registered scalar baseline.

This is explicitly a **driven** source. On smooth pieces $d\langle H_{\mathrm{total}}\rangle/dt=\langle\partial_tH_{\mathrm{total}}\rangle$; at switches include the exact work $\operatorname{Tr}\rho\,\Delta H_{\mathrm{total}}$. We do not invoke Appendix B's source-free autonomous conservation theorem on a driven window. 
## C.7 Conclusion and status boundary

Under the stated cost, communication, and viability conditions, the appendix excludes sufficiently severe irregularity and identifies the extra records needed for the continuum branch. Beyond the local symmetry of the model's nearest-neighbor shell, a continuum description needs independent control of collapse, convergence, energy, and rigidity.

**Technical ledger.**

This appendix separates local shell isotropy from global continuum closure. Theorem C.6e controls the fixed-trace shell tensor and Lemma C.6f the exact fourth-moment tensor. Theorem C.6c.4 proves a common Euclidean metric–energy limit beyond the fixed-stencil obstruction; Theorem C.6c.5 supplies degree-three metric/form/response compression, with the corrected-field boundary in Corollary C.6c.5a. Their formal MPU source maps determine admission to the operational-continuum branch.

Theorem F.0 and Theorem 48a separately supply the full AQFT net and the local-horizon KMS/Clausius bridge. The operational-continuum branch proves a finite-resolution manifold compression after the microscopic continuum-control defects of Theorem D.6e are included in the adaptation potential and selected by Theorem 43.5; the exact real-number continuum remains an effective completion, not an additional physical substrate.

On the registered edge-comparability, traffic or synchronization, clock or contraction, curvature-response, adaptation-tracking, convex-cost, and viability-budget branches, the Appendix C estimates exclude sufficiently severe irregularity. Theorem 43.5 separately packages the $M=24$, $D=4$ operational-continuum branch with its noncollapse, curvature-transfer, Mosco, recovery, and rigidity certificates, while Appendix F states the independent algebraic AQFT requirements.
