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

**Definition C.1 (Uniform D-dimensional Polynomial Volume Growth).** A sequence of finite connected MPU networks $\{\mathcal{N}_n\}$ (indexed by size $n \to \infty$) exhibits uniform D-dimensional polynomial volume growth if there exist positive constants $K_1, K_2$, a dimension $D \ge 1$, an $n$-independent macroscopic scale $R_0$, and cutoffs $R_{max,n}$ such that $R_{max,n}\leq\operatorname{diam}(\mathcal N_n)$, $R_0<R_{max,n}$ eventually, and
$$
\frac{R_{max,n}-R_0}{\delta_{eff,n}}\longrightarrow\infty.
$$
For all sufficiently large $n$, all vertices $v \in \mathcal{V}_n$, and all radii $R$ satisfying $R_0<R\leq R_{max,n}$,
$$
K_1 \left(\frac{R}{\delta_{eff, n}}\right)^D \leq |B_{R}(v)| \leq K_2 \left(\frac{R}{\delta_{eff, n}}\right)^D.
\tag{C.1}
$$
Here $B_{R}(v) = \{u \in \mathcal{V}_n \mid d_{\mathcal{N}_n}(v, u) \leq R\}$ is the metric ball defined by the cost metric $d_{\mathcal{N}_n}$, $|B_{R}(v)|$ is its number of vertices, and $\delta_{eff, n}$ is the characteristic microscopic cost-distance scale (e.g., $\ell_0 \langle w_{uv} \rangle_{avg}$) for network $\mathcal{N}_n$. Networks failing to satisfy this condition for a single integer $D$ on an expanding range of scales exhibit anomalous dimension.

**Definition C.2 (Uniformly Bounded Synthetic Ricci Curvature).** An MPU network $\mathcal{N}$ has uniformly bounded synthetic Ricci curvature if there exists a constant $K \in \mathbb{R}$ such that a suitable measure of discrete Ricci curvature (e.g., Ollivier-Ricci curvature $\kappa_{\mathcal{N}}(x,y)$ for edges [Ollivier 2009], or related spectral measures [Lin & Yau 2010]) satisfies $\kappa_{\mathcal{N}}(x,y) \ge -K$ uniformly across the network. As argued in Section C.3, PU principles favor a positive lower bound. Networks where the lower bound $K$ effectively diverges (i.e., curvature is not bounded below) or where the spatial variance $\operatorname{Var}(\kappa_{\mathcal{N}})$ is large over macroscopic regions exhibit large or unbounded curvature fluctuations.

**Definition C.3 (Geometric Regularity).** An MPU network $\mathcal{N}$ exhibits geometric regularity if it satisfies both Definition C.1 (Uniform D-dim Polynomial Volume Growth for some integer D) and Definition C.2 (Uniformly Bounded Synthetic Ricci Curvature with a positive lower bound $\kappa_R > 0$ and bounded variance). Geometric irregularity refers to the violation of either or both of these conditions. For uses requiring linear path-length comparability to the macroscopic embedding, geometric regularity additionally includes the quasi-isometry condition stated in Theorem C.1(a).

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

**Lemma C.3.3 (Rigorous $L_1$ stability for the complexity-weighted kernel).**
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
W_1(\mu_v, \mu_u) \le C_{geom},
$$
for some constant $C_{geom} = \mathcal{O}(1)$ depending only on bounded local graph geometry and the chosen baseline kernel $P^{(0)}$.

Then for adjacent $v \sim u$ one has the general estimate
$$
\|P_{v\bullet} - P_{u\bullet}\|_1
\le e^{\lambda_R B}\,\|\mu_v - \mu_u\|_1
+ C_{geom}\,\lambda_R\,e^{\lambda_R B}\,M\,L_{C_P}.
$$
Assume in addition that the baseline rows, extended to the common vertex set as above, satisfy the uniform discrepancy bound
$$
\delta_\mu:=\sup_{v\sim u}\|\mu_v-\mu_u\|_1<\infty.
$$
Then the estimate takes the form
$$
\|P_{v\bullet} - P_{u\bullet}\|_{1}
\;\le\;e^{\lambda_R B}\left(\delta_\mu+C_{geom}\lambda_R M L_{C_P}\right).
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
\le\lambda_RML_{C_P}C_{geom}.
$$
Substituting this bound into the previous display proves the general estimate and, under the additional baseline-row discrepancy hypothesis, Equation (C.7). ∎

Define
$$
\eta_{R} \;:=\; \frac32 e^{\lambda_R B}
\left(\delta_\mu+C_{geom}\lambda_R M L_{C_P}\right).
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
\left(\delta_\mu+C_{geom}\lambda_R M L_{C_P}\right)>0.
\tag{C.10}
$$
This establishes a strictly positive lower bound only for this Ollivier-Ricci model under the local hypotheses in Lemma C.3.3, the baseline-row discrepancy bound, and $\eta_R<1$. Transfer to a Bakry-Émery lower bound, a measured-Gromov-Hausdorff-stable curvature class, or the Section 11.4 continuum branch requires the additional weighted-shell/local-isotropy input of Remark C.3.3a or an equivalent replacement, radius-2 or curvature-matrix control, and the separate convergence hypotheses isolated in Theorem C.6a and Appendix F.


¹ Footnote: The parameter $\lambda_R$ is specific to this curvature model (Equation C.2) and represents the sensitivity of local transition probabilities to gradients in the effective cost-rate $I'$. It should not be confused with the resource scarcity Lagrange multiplier $\lambda$ from main text Definition 20.


**Remark C.3.3a (From Ollivier-Ricci to a continuum scalar curvature estimator).**
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
If the continuum reference measure is locally finite and the discrete interpolation preserves the compact-uniform remainder bound, then $R_h\to R_g$ in $L^1_{loc}$. Ollivier (2009) supplies expansions of this form for specified small-ball kernels; it does not make the coefficient universal for arbitrary lazy graph kernels. The transfer from one-shell data to a Bakry-Émery or RCD bound still requires independent radius-2 control.

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

**Proposition C.3.3b (Positive Ollivier Curvature Does Not Transfer to a Bakry–Émery Lower Bound).** Let $G_7$ be the graph on $\{0,1,\ldots,6\}$ obtained from the complete graph on $\{1,2,3,4\}$ by adding the vertex $0$, joined to $1,3,4,5,6$, and the edge $\{5,6\}$. In (C.2) take the uniform baseline $P^{(0)}_{vu}=1/\deg(v)$ for $u\sim v$ and a constant field $I'(C_P)$, so that $\mathcal P\delta_v$ is the uniform law on the neighbors of $v$. For $0\le\alpha<1$ put $\mathcal P_\alpha\delta_v:=\alpha\delta_v+(1-\alpha)\mathcal P\delta_v$, let $L_\alpha:=(1-\alpha)(\mathcal P-I)$ be the generator of this lazy kernel, and write
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

**Resolution TV-REG-01-R1 (Metadata).** Exact domain: the graph $G_7$ with the lazy kernels $\mathcal P_\alpha$, $0\le\alpha<1$, obtained from (C.2) with uniform baseline and constant $I'$, their generators $L_\alpha$, and the Wasserstein cost $d_G$. Premises: the Ollivier–Ricci definition (C.3) applied to the lazy laws and the carré-du-champ calculus of $L_\alpha$. Equivalence: edges and vertices are identified under automorphisms of $G_7$. Budget: all twelve edges, every idleness in $[0,1)$, and the full function space on the radius-2 ball of vertex $0$, which is the whole vertex set. Verifier: the five displayed couplings with their automorphism images, the displayed Kantorovich potential, and exact rational evaluation of (C.10d). Falsifier: an edge whose non-lazy transport cost exceeds $\frac9{10}$, or a nonnegative value of $\Gamma_{2,0}(f)(0)$ for the displayed $f$. Provenance class: source-internal exact finite computation. Downstream consumers: Remark C.3.3a, Theorem C.6a item 4, Remark C.6b, the radius-2 defect (D.6e.1) and `TV-REG-01`. Nonvacuity: the displayed graph and kernel family. Proposition C.3.3b is `nonentailment` of every transfer from a uniform positive Ollivier–Ricci lower bound on the (C.2)–(C.3) kernels, at any idleness, to $\mathrm{BE}(K,N)$ with $K\ge0$. The radius-2 transfer theorem with explicit constants on the PU carrier and the lazy-kernel and metric classification there remain `M+C+R` under `TV-REG-01`; Proposition C.6c.2 supplies the exact $D_4$ Bravais curvature data.


## C.4 Penalization of Anomalous Network Dimension

We derive conditional global-coherence (GC) and resource-efficiency (RE) penalties for network families with super-linear chemical-distance scaling under the hypotheses of Theorems C.1–C.2.

**Theorem C.1 (Cost-Distance Scaling under Quasi-Isometry and Uniform Edge-Cost Comparability).**
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
d_{\mathrm{graph},max}(L)=\Theta(L^{d_{min}}),
\qquad d_{min}>1,
$$
then
$$
d_{\mathcal N,max}(L)=\Theta(L^{d_{min}}).
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

**Theorem C.2 (Quantitative Penalty from Super-Linear Chemical Distance).** Let an MPU network family exhibit super-linear maximum path scaling
$$
d_{\mathcal N,\max}(L)\ge c_{\max}'L^\gamma,
\qquad
\gamma>1,
$$
as in Theorem C.1(b). Then:

1. Suppose every traversed edge has cost length at most $\delta_{eff}$, every step has trace-distance contraction coefficient at most $f_{RID}\in[0,1)$, and the global-coherence task requires a specified pair of encoded states to retain distinguishability $MP_{Global}\geq MP_{min}$ along a worst-case path. For $0<MP_{min}<D_0$, this requirement fails at a finite scale; the case $f_{RID}=0$ fails after one step.

2. Independently of strict contraction, suppose every completed step has registered duration at least $\tau_{min}>0$. Then the worst-case latency satisfies
$$
\tau_{max}(L)\geq\tau_{min}c_{max}'L^\gamma/\delta_{eff}.
$$
Without the edge-cost and clock hypotheses, the chemical-distance estimate alone supplies no channel-count or physical-latency bound.

3. If the global-coherence branch requires synchronization or refresh in a window $\tau_{sync}(L)=O(L^q)$ for some $q<\gamma$, or if the resource-efficiency branch requires the effective-average communication cost to fit an extensive volume budget under the hypotheses in part (ii), then the corresponding GC or RE condition fails for sufficiently large $L$.

Thus anomalous chemical-distance families are excluded as PCE-selected large-scale substrates on the stated GC/RE branches; the theorem-level content is the explicit super-linear penalty, while the non-viability conclusion uses the named finite-window or extensive-budget branch condition.

* **(i) Violation of Global Coherence (GC):** On the refresh/minorization branch, let $\Phi_j$ be the channel at step $j$ and assume its trace-distance contraction coefficient is at most $f_{RID}\in[0,1)$. Choose two encoded input states $\rho_0,\rho_1$ whose distinction the global-coherence task must retain, set $D_0:=D(\rho_0,\rho_1)>0$, and define
$$
MP_{Global}(L):=D(\Phi_{N_{steps}}\circ\cdots\circ\Phi_1(\rho_0),
\Phi_{N_{steps}}\circ\cdots\circ\Phi_1(\rho_1)).
$$
If every cost step has length at most $\delta_{eff}$ and $d_{\mathcal N,max}(L)\geq c_{max}'L^\gamma$, then
$$
N_{steps}(L)\geq\frac{c_{max}'L^\gamma}{\delta_{eff}}.
$$
For $0<f_{RID}<1$, repeated application of the contraction inequality gives
$$
MP_{Global}(L)
\leq D_0 f_{RID}^{N_{steps}(L)}
\leq D_0\exp\left(-\frac{c_{max}'|\ln f_{RID}|}{\delta_{eff}}L^\gamma\right).
\tag{C.13}
$$
For a registered threshold $0<MP_{min}<D_0$, the upper bound is below $MP_{min}$ whenever
$$
L>
L_{crit}^{(GC)}(\gamma):=
\left(\frac{\delta_{eff}\ln(D_0/MP_{min})}
{c_{max}'|\ln f_{RID}|}\right)^{1/\gamma}.
\tag{C.14}
$$
If $f_{RID}=0$, one channel use gives $MP_{Global}=0$, so every path containing at least one step violates every positive coherence threshold. No independence assumption is needed: the bound follows from composition of the contraction inequalities.
* **(ii) Resource-Efficiency Gate (RE).** Assume on this branch that, during each unit time interval, at least
$$
M(L)\geq aL^D
$$
retained-information transmissions must be completed, each such transmission requires at least $bL^\beta$ edge traversals with $\beta>1$, and the propagation ledger charges at least $r_{min}>0$ per traversal without broadcast, coding, shared-edge, or temporal amortization between the counted transmissions. Then additivity of the registered ledger gives
$$
V_{prop}(L)
\geq r_{min}M(L)bL^\beta
\geq abr_{min}L^{D+\beta}.
$$
If the admissible resource budget is positive and extensive,
$$
V_{max}(L)\leq CL^D,
$$
then
$$
\frac{V_{prop}(L)}{V_{max}(L)}
\geq\frac{abr_{min}}C L^\beta
\longrightarrow\infty.
$$
Hence RE fails for sufficiently large $L$ on this additive, non-amortized traffic branch. A super-linear maximum cost distance alone does not imply this traffic lower bound; if routing avoids the long paths or amortizes shared transmissions, a separate GC or traffic certificate is required.

*Proof:*
* **(i)** Suppose first that $0<f_{RID}<1$. The contraction-coefficient inequality applied successively to the two encoded states gives
$$
MP_{Global}(L)\leq D_0f_{RID}^{N_{steps}(L)}.
$$
Because $N_{steps}(L)\geq c_{max}'L^\gamma/\delta_{eff}$ and $x\mapsto f_{RID}^x$ is decreasing,
$$
MP_{Global}(L)
\leq D_0\exp\!\left(
-\frac{c_{max}'|\ln f_{RID}|}{\delta_{eff}}L^\gamma
\right).
$$
For $0<MP_{min}<D_0$, the right-hand side equals $MP_{min}$ at the scale in (C.14) and is strictly smaller above that scale; hence $MP_{Global}<MP_{min}$ there. If $f_{RID}=0$, the first channel use makes the two outputs identical, so $MP_{Global}=0<MP_{min}$ for every positive threshold.

The latency statement is independent of contraction but conditional on item 2's registered clock. Every completed path update then requires at least $\tau_{min}$ per step, and therefore
$$
\tau_{max}(L)
\geq\tau_{min}N_{steps}(L)
\geq\tau_{min}c_{max}'L^\gamma/\delta_{eff}.
$$
If $\tau_{sync}(L)\leq AL^q$ for some $A>0$ and $q<\gamma$, then
$$
\frac{\tau_{max}(L)}{\tau_{sync}(L)}
\geq\frac{\tau_{min}c_{max}'}{A\delta_{eff}}L^{\gamma-q}\longrightarrow\infty,
$$
so the registered synchronization window is exceeded for all sufficiently large $L$.

* **(ii)** The additive ledger hypotheses give
$$
V_{prop}(L)
\geq r_{min}M(L)bL^\beta
\geq abr_{min}L^{D+\beta}.
$$
Together with $V_{max}(L)\leq CL^D$, this yields
$$
\frac{V_{prop}(L)}{V_{max}(L)}
\geq\frac{abr_{min}}C L^\beta\longrightarrow\infty.
$$
Thus RE fails for all sufficiently large $L$ on the registered non-amortized traffic branch. The conclusion does not follow from worst-case distance alone. ∎

## C.5 Penalization of Unbounded Curvature Fluctuations

This section derives two conditional penalties from curvature fluctuations. The resource-efficiency estimate requires the curvature-load and external-innovation certificates together with uniform strong convexity of the operational cost. The local-viability estimate requires mutually independent failure events and an external tracking bound relating their mean probability to complexity variance.

**Theorem C.3 (Scope of the Curvature–Load Coupling Branch).** Let $\hat C_{\mathrm{actual}}:\mathcal V\to[0,\infty)$ be a registered external-load field. Equations (C.1)–(C.14) and Equation (38) do not by themselves imply a lower bound on $\operatorname{Var}(\hat C_{\mathrm{actual}})$ from curvature variance or from the absence of a positive curvature lower bound. Such an inference requires an independently registered quantitative curvature-to-load transfer certificate. An inference for $\operatorname{Var}(\hat C_{\mathrm{target}})$ additionally requires an external innovation or tracking certificate relating $\hat C_{\mathrm{target}}$ to $\hat C_{\mathrm{actual}}$ within a stated error.

*Proof.* Equations (C.1)–(C.14) define the graph metric, transition kernels, synthetic curvature, and their dependence on $C_P$ and $I'$. None contains $\hat C_{\mathrm{actual}}$. Fix any graph, kernel, and $C_P$ data satisfying those equations and assign the constant external-load field $\hat C_{\mathrm{actual}}(v)=c$. This assignment leaves every preceding equation and every curvature value unchanged while giving
$$
\operatorname{Var}(\hat C_{\mathrm{actual}})=0.
$$
Hence curvature variance alone cannot imply positive external-load variance. Equation (38) supplies an internal target-update law but no quantitative comparison between $\hat C_{\mathrm{target}}$ and $\hat C_{\mathrm{actual}}$, so the corresponding target-variance inference also requires an independent tracking certificate. ∎

**Theorem C.3a (Finite Linear Curvature--Load--Controller Classification).** Freeze a finite intervention class
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

**Resolution TV-REG-03-R1.** The frozen finite linear intervention class (C.14a) has a complete `positive-discharge`: (C.14b) classifies curvature-to-load identifiability, (C.14c) classifies observability, and (C.14d)--(C.14e) classify stable exact target tracking. Admission of a physical curvature/load/controller family to this class remains a separate realization record.

**Theorem C.4 (Operational Cost and Stability Penalty for Curvature Fluctuations).** On the curvature-load branch together with the external innovation certificate required by Theorem C.3, MPU networks $\mathcal N_{unbounded}$ whose curvature fluctuations induce high certified spatial variance $\operatorname{Var}(\hat C_{target}(v))$ incur the following conditional resource-efficiency (RE) and local-viability (LV) penalties:



* **(i) Excess Operational Cost (conditional RE penalty):** Assume that a registered adaptation/tracking estimate supplies a quantitative lower bound $\operatorname{Var}(C_v)\geq s_C^2$ for the configuration under study. The curvature-load coupling and Equation (30) alone do not supply this variance-transfer bound. On a common operating interval $J$ containing every $C_v$, assume a single scalar function $f\in C^2(J)$ represents the expected local operational costs at all vertices:
$$
f(C_v)=\langle\lambda\hat R(C_v)+\hat R_I(C_v)\rangle_{\rho^{(v)}},
\qquad
V_{op}=\sum_{v=1}^N f(C_v).
$$
This common cost-law representation is a separate certificate. The identification $C_v=\langle\hat C_v\rangle_{\rho^{(v)}}$ alone does not identify an operator-cost expectation with a function of that mean, as explained after Theorem 3. Assume $f$ is nondecreasing on $J$ and
$$
f''(C)\geq f''_{min}>0\qquad(C\in J).
$$
Monotonicity gives the pointwise cost comparison, while the uniform second-derivative bound supplies the variance penalty. On the additional exact scalar branch $f(C)=\lambda R(C)+R_I(C)$, with common temperature and parameters, the condition $f''(C)>0$ is equivalent to $\lambda R''(C)>-R_I''(C)$ when $R_I''(C)\leq0$; a uniform positive lower bound must still be supplied. The DSC discussion in the note on Corollary 3 concerns the net benefit, and Theorem 22 in Section 6.5.2 assumes concavity of that net benefit; neither supplies this cost-law certificate or strong convexity of $f$ alone. Put $\bar C=N^{-1}\sum_v C_v$. Jensen's inequality gives $V_{op}\geq Nf(\bar C)$. The quantity $Nf(\bar C)$ is the equal-mean cost benchmark; its use does not assert that a uniform physical configuration is realizable. Taylor's theorem with integral remainder gives, for $x=C_v-\bar C$,
$$
f(\bar C+x)
=f(\bar C)+f'(\bar C)x
+x^2\int_0^1(1-t)f''(\bar C+tx)\,dt
\geq f(\bar C)+f'(\bar C)x+\frac{f''_{min}}2x^2.
$$
Summing over $v$ and using $\sum_v(C_v-\bar C)=0$ yields the exact variance penalty
$$
\Delta V_{op}
:=V_{op}[\{C_v\}]-V_{op}[\{\bar C\}]
\geq\frac{f''_{min}}2\sum_{v=1}^N(C_v-\bar C)^2
=\frac N2f''_{min}\operatorname{Var}(C_v).
\tag{C.15}
$$
Since $f''_{min}>0$, a certified lower bound on $\operatorname{Var}(C_v)$ gives a positive excess operational cost $\Delta V_{op}$. This excess directly contributes to the $V_{op}(x)$ component of the PCE Potential (Definition D.1), representing a resource penalty relative to the uniform configuration at the same mean. It constitutes an RE violation only when the resulting lower bound on $V_{\mathrm{total}}$ exceeds $V_{\max}$, as required in Theorem C.5(3); Equation (C.15) alone does not establish that inequality.
* **(ii) Reduced Local Stability (conditional LV penalty):** Let $F_v$ be the event that MPU $v$ violates the viability bounds $(\alpha,\beta)$ during the registered adaptation interval, and write $p_v:=\mathbb P(F_v)$. Assume on this branch that the events $F_1,\ldots,F_N$ are mutually independent and that an external tracking estimate supplies the quantitative bound
$$
\bar p:=\frac1N\sum_{v=1}^Np_v
\geq c_{fail}\operatorname{Var}(C_v),
\qquad c_{fail}>0.
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
\leq\exp\!\left[-Nc_{fail}\operatorname{Var}(C_v)\right].
\tag{C.16}
$$
Thus, on this explicitly registered branch, $P_{stability}<P_{min}$ whenever $Nc_{fail}\operatorname{Var}(C_v)>\ln(1/P_{min})$. No such bound follows from curvature variance alone without the tracking estimate and dependence hypothesis.

*Proof.* For item (i), the registered tracking estimate gives
$$
\operatorname{Var}(C_v)\ge s_C^2.
$$
The strong-convexity hypotheses and Taylor's theorem with integral remainder give Equation (C.15), hence
$$
\Delta V_{op}
\ge \frac N2f''_{min}\operatorname{Var}(C_v)
\ge \frac N2f''_{min}s_C^2.
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
Using $1-x\le e^{-x}$ for $x\in[0,1]$ and the registered estimate $N^{-1}\sum_vp_v\ge c_{fail}\operatorname{Var}(C_v)$ yields
$$
P_{stability}
\le \exp\!\left[-Nc_{fail}\operatorname{Var}(C_v)\right],
$$
which is Equation (C.16). Thus both penalties follow exactly on the declared tracking, strong-convexity, and independent-failure branch. ∎

## C.6 Synthesized Necessity Argument

We combine the registered penalty estimates into the quantitative non-viability criterion of Theorem C.5.

**Definition C.4 (Viability Functional).** Let $\mathcal C=(\mathcal N,\{C_v\},\rho_{agg})$ be a complete network configuration with the following registered requirement data. The stability threshold satisfies $0<P_{min}\leq1$, and $P_{stability}\in[0,1]$ is the probability in Equation (C.16). The resource budget satisfies $0<V_{max}<\infty$, and $V_{total}\in[0,\infty)$ is the nonnegative operational and propagation cost ledger, including every charged contribution. In particular, $V_{total}\geq V_{prop}$ on the routing branch; a signed net-benefit potential is not used as this denominator.

The global-coherence task declares an encoded-distinction requirement, a synchronization requirement, or both. For a distinction requirement, take finite $MP_{Global}\geq0$ and $MP_{min}>0$ and put $Q_{dist}=MP_{Global}/MP_{min}$. For a synchronization requirement, take a finite deadline $\tau_{sync}>0$ and finite task latency $\tau_{max}\geq0$ and put $Q_{sync}=\tau_{sync}/\tau_{max}$ when $\tau_{max}>0$, with $Q_{sync}=+\infty$ when $\tau_{max}=0$. Define $Q_{\mathrm{GC}}$ as the minimum of the ratios for the declared global-coherence requirements. Set
$$
Q_{\mathrm{LV}}=\frac{P_{stability}}{P_{min}},
\qquad
Q_{\mathrm{RE}}=
\begin{cases}
V_{max}/V_{total},&V_{total}>0,\\
+\infty,&V_{total}=0,
\end{cases}
$$
and
$$
\mathcal V[\mathcal C]
=\min\{Q_{\mathrm{LV}},Q_{\mathrm{GC}},Q_{\mathrm{RE}}\}.
\tag{C.17}
$$
The minimum is finite and nonnegative because $Q_{\mathrm{LV}}\leq1/P_{min}<\infty$.

**Definition C.5 (Viable Configuration).** A configuration is viable for the registered requirements if and only if $\mathcal V[\mathcal C]\geq1$. Equivalently, its stability probability meets the threshold, every declared distinction or synchronization requirement is met, and its nonnegative cost ledger does not exceed the budget.

**Theorem C.5 (Quantitative Non-Viability on the Registered Penalty Branches).** Let $\mathcal C$ satisfy the domain and ledger premises of Definition C.4. It is non-viable, $\mathcal V[\mathcal C]<1$, if at least one of the following certified conditions holds:

1. The super-linear chemical-distance hypotheses of Theorem C.2 give either $MP_{Global}<MP_{min}$ for a declared distinction requirement or $\tau_{max}>\tau_{sync}$ for a declared synchronization requirement.
2. The effective-average routing and extensive-budget hypotheses of Theorem C.2(ii) give $V_{prop}>V_{max}$.
3. The common scalar cost-law and strong-convexity premises of Theorem C.4(i) hold, $s_C^2:=\operatorname{Var}(C_v)$ is certified, and the registered cost decomposition gives
$$
V_{total}\geq V_{base}+\frac N2f''_{min}s_C^2>V_{max},
$$
where $V_{base}$ includes the equal-mean operational benchmark and all other non-variance contributions. A deduction of this variance bound from curvature additionally requires the curvature-load and adaptation/tracking certificates of Theorem C.4; DSC alone does not supply it.
4. On the independent-failure branch, the certified mean failure probability $\bar p$ satisfies
$$
P_{stability}\leq e^{-N\bar p}<P_{min}.
$$

Failure of Definition C.1 or C.2 without one of these quantitative branch certificates does not by itself imply non-viability.

*Proof.* In case 1, the applicable ratio $Q_{dist}$ or $Q_{sync}$ is strictly below $1$, so $Q_{\mathrm{GC}}<1$. In case 2, $V_{total}\geq V_{prop}>V_{max}>0$ gives $Q_{\mathrm{RE}}<1$. In case 3 the displayed lower bound gives the same conclusion. In case 4, $Q_{\mathrm{LV}}=P_{stability}/P_{min}<1$. In every case at least one entry of the minimum defining $\mathcal V$ is strictly below $1$, proving non-viability. ∎

**Corollary C.1 (Branch-Conditional Asymptotic Non-Viability).** On any branch satisfying one of the quantitative hypotheses of Theorem C.5, the corresponding strict inequality defines a finite non-viability threshold whenever its penalty is monotone and unbounded in the declared scale parameter. No universal threshold follows from geometric irregularity alone.

*Proof.* On the contractive chemical-distance branch, Equation (C.14) gives the finite threshold when $0<f_{RID}<1$, and $f_{RID}=0$ gives failure after one step. On the latency branch, $L^{\gamma-q}\to\infty$ for $q<\gamma$. On the extensive-budget branch, $V_{prop}/V_{max}\to\infty$. On the convex-cost branch, the threshold is the first $N$ or certified variance for which
$$
V_{base}+\frac N2f''_{min}\operatorname{Var}(C_v)>V_{max}.
$$
On the independent-failure branch, Equation (C.16) gives the threshold
$$
N\bar p>\ln(1/P_{min}).
$$
Each threshold invokes Theorem C.5; outside these branches no threshold has been proved. ∎

**Proposition C.5a (Sparse Irregularity Is Amortized by Density-Normalized Ledgers).** Let $G_n=C_n$ be the $n$-cycle and let $G_n^+$ be obtained by attaching one pendant vertex to a fixed cycle vertex. Fix a radius $R$ and let $p_R(v,G)$ be any nonnegative local irregularity penalty depending only on the rooted radius-$R$ ball, bounded by $P_R<\infty$. If the two penalties agree whenever the rooted balls are isomorphic, then
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

**Theorem C.5b (Exact Worst-Case Viability Classification and Discrimination Windows).** Let a network family be indexed by an unbounded set of scales $L$. At each scale let $N(L)\in\mathbb Z_{\ge0}$ be the hop count of the registered worst-case route, $M(L)\ge0$ the number of transmissions charged per unit time, $\bar N(L)$ the hop count of each charged transmission, and $p_v(L)\in[0,1)$ the failure probabilities of the vertices. Consider the following exact ledger classes.

1. **Exact-contraction distinction.** Every step of the worst-case route applies a channel $\Phi_j$ with $D(\Phi_j\rho,\Phi_j\sigma)=f\,D(\rho,\sigma)$ for all states $\rho,\sigma$, for one $f\in(0,1)$. For encoded states $\rho_0,\rho_1$ with $D_0:=D(\rho_0,\rho_1)>0$, $MP_{Global}(L)$ as in Theorem C.2(i), and a threshold $0<MP_{min}(L)\le D_0$,
$$
MP_{Global}(L)=D_0f^{N(L)},
\qquad
MP_{Global}(L)\ge MP_{min}(L)
\iff
N(L)\,|\ln f|\le\ln\frac{D_0}{MP_{min}(L)}.
\tag{C.16b.1}
$$
2. **Exact-clock synchronization.** Every step lasts exactly $\tau_{step}>0$. Then $\tau_{max}(L)=\tau_{step}N(L)$, and the synchronization requirement holds exactly when $\tau_{step}N(L)\le\tau_{sync}(L)$.
3. **Exact non-amortized traffic.** Every hop of every charged transmission is charged exactly $r>0$, without broadcast, coding, shared-edge or temporal amortization, and $V_{total}=V_{prop}$. Then $V_{prop}(L)=rM(L)\bar N(L)$, and RE holds exactly when $rM(L)\bar N(L)\le V_{max}(L)$.
4. **Independent failures.** The failure events are mutually independent. Then LV holds exactly when $\sum_v-\ln\bigl(1-p_v(L)\bigr)\le\ln(1/P_{min})$, and LV implies $\sum_vp_v(L)\le\ln(1/P_{min})$.

Consequently:

(a) on the class of item 1 with a scale-independent threshold $0<MP_{min}<D_0$, every family with $N(L)\to\infty$ violates the distinction requirement at all sufficiently large $L$; a family obeying the quasi-isometry bounds of Theorem C.1(a), with worst-case pairs at Euclidean separation $L$, has $N(L)\ge\lambda^{-1}L-C$, so on this class regular families fail this gate as the anomalous families of Theorem C.2 do, and the exponent $\gamma$ enters only through the crossover scale (C.14);

(b) on the class of item 3 with $M(L)\ge aL^D$, $\bar N(L)\ge bL$ and $V_{max}(L)\le C_VL^D$ for constants $a,b,C_V>0$, RE fails at all sufficiently large $L$ for every family, regular families included;

(c) for two families in the class of item 1 with $N_1(L)\le c_1L$ and $N_2(L)\ge c_2L^\gamma$, $\gamma>1$, at all large $L$, the threshold $MP_{min}(L)=D_0e^{-AL^q}$ with $A>0$ retains the first family at all large $L$ when $q>1$, or $q=1$ and $A\ge c_1|\ln f|$, and excludes the second at all large $L$ when $q<\gamma$, or $q=\gamma$ and $A<c_2|\ln f|$; the same window holds on the class of item 2 for $\tau_{sync}(L)=AL^q$ with $\tau_{step}$ in place of $|\ln f|$, and on the class of item 3 for $M(L)=mL^D$, $\bar N_i=N_i$ and $V_{max}(L)=AL^{D+q}$ with $rm$ in place of $|\ln f|$;

(d) on the class of item 4 with a scale-independent $P_{min}$, a floor $p_v(L)\ge p_0>0$ on a number $n(L)\to\infty$ of vertices violates LV at all sufficiently large $L$, for regular and irregular families alike.

On these classes a gate that retains an unbounded regular family with worst-case hop counts $N_1(L)\to\infty$ requires, by items 1 and 2, a threshold with $\ln(D_0/MP_{min}(L))\ge|\ln f|N_1(L)$ or a window $\tau_{sync}(L)\ge\tau_{step}N_1(L)$, each growing without bound in $L$. By item 3 it requires a budget $V_{max}(L)\ge rM_1(L)\bar N_1(L)$, where $M_1(L)$ and $\bar N_1(L)$ are the charged transmission count and the traffic hop count of that family. The required budget $rM_1(L)\bar N_1(L)$ grows without bound when $M_1(L)\ge m_0$ and $\bar N_1(L)\ge c\,N_1(L)$ at all large $L$ for constants $m_0,c>0$, and it stays bounded when $\sup_LM_1(L)\bar N_1(L)<\infty$, for every growth of $N_1(L)$. Item (c) gives the resulting windows in which the gate separates regular from anomalous chemical-distance scaling.

*Proof.* Item 1: applying the exact contraction identity along the $N(L)$ steps gives $MP_{Global}(L)=D_0f^{N(L)}$, and taking logarithms gives the equivalence. The qubit depolarizing channel $\rho\mapsto f\rho+(1-f)I/2$ belongs to this class because it maps $\rho-\sigma$ to $f(\rho-\sigma)$. Items 2 and 3 are additivity of the registered durations and of the non-amortized charges. Item 4: independence gives $P_{stability}=\prod_v(1-p_v)$, the condition $P_{stability}\ge P_{min}$ is the displayed logarithmic inequality, and $-\ln(1-p)\ge p$ gives the implication.

For (a), $N(L)|\ln f|$ eventually exceeds the fixed number $\ln(D_0/MP_{min})$; under Theorem C.1(a) every route between points at Euclidean separation $L$ has at least $d_{\mathrm{graph}}\ge\lambda^{-1}L-C$ hops. For (b), $rM(L)\bar N(L)\ge rabL^{D+1}>C_VL^D$ for large $L$. For (c), item 1 gives retention when $|\ln f|c_1L\le AL^q$ and exclusion when $|\ln f|c_2L^\gamma>AL^q$ at all large $L$, and both comparisons hold under the stated exponent and constant conditions; items 2 and 3 give the other two gates by the same comparison. For (d), $\sum_vp_v(L)\ge p_0n(L)\to\infty$ contradicts the implication in item 4. The final paragraph restates items 1 and 2 for a retained family with $N_1(L)\to\infty$, and item 3 gives $V_{prop}(L)=rM_1(L)\bar N_1(L)$, which is at least $rm_0c\,N_1(L)\to\infty$ under the two stated floors and is bounded whenever $M_1(L)\bar N_1(L)$ is bounded, for example when $M_1(L)=1/\bar N_1(L)$. ∎

**Resolution TV-REG-02-R1 (Metadata).** Exact domain: arbitrary network families on the four exact ledger classes of Theorem C.5b, namely exact per-step trace-distance contraction along the registered worst-case route, exact step duration, exact non-amortized per-hop charge on the charged traffic, with ledger $V_{prop}=rM\bar N$ in the transmission count and traffic hop count, and mutually independent vertex failures. Premises: the ledger identities of Definition C.4 and, for consequence (a), the quasi-isometry bounds of Theorem C.1(a). Equivalence: families with equal hop counts, transmission counts, thresholds, budgets and failure laws at every scale are identified. Budget: every scale, every threshold, window and budget function, and every exponent pair in (c). Verifier: the closed forms in items 1–4 and the eventual comparisons in (a)–(d). Falsifier: a family in one of these classes whose ledger differs from the displayed closed form, or an unbounded family retained by a scale-independent distinction threshold. Provenance class: source-internal exact classification. Downstream consumers: Theorems C.2 and C.5, Corollary C.1, Proposition C.5a, Theorem 43 and `TV-REG-02`. Nonvacuity: the qubit depolarizing channel realizes item 1, and the hop counts $\lceil L\rceil$ and $\lceil L^\gamma\rceil$ realize both families in (c). Theorem C.5b gives `positive-discharge` of the exact worst-case GC/RE/LV classification on these classes and `nonentailment` of regularity selection from scale-independent thresholds, extensive budgets for extensive long-range traffic, or failure floors, since each of these excludes regular families as well. The PCE derivation of a discriminating threshold, window or budget, the classification beyond these exact ledger classes, and the formal realization of the exact classes by MPU channels, clocks and routing remain `N+M+C+R` under `TV-REG-02`.

**Theorem C.6 (Conditional coarse-grained doubling and $(1,2)$-Poincaré bounds).**

Let $(\mathcal N,d_{\mathcal N},\mu)$ be a locally finite predictive network with counting measure, maximum degree $\Delta_{max}<\infty$, and coarse-graining resolution $\delta>0$. Assume every ball $U=B(x,4r)$ used below, with $r\geq10\delta$, is finite. Assume the certificate parameters satisfy $D\geq1$, $0\leq\varepsilon_C<1$, $0<\Delta_{min}\leq\Delta_{max}<\infty$, $0<\eta^\downarrow\leq\eta^\uparrow<\infty$, $0<\chi<\infty$ and $0<\rho^\downarrow(r)\leq\rho^\uparrow(r)<\infty$ at every admitted radius. These domains make the displayed constants finite with $D_\star\geq1$ and $H(r)>0$. If $U$ has one vertex, the asserted Poincaré inequality holds with both sides zero. For a finite induced subgraph $U$ with at least two vertices, define
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
\frac{\Delta_{max}}{\Delta_{min}}
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
\frac{2D_\star\sqrt{2\Delta_{max}}}{3\chi}
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
\lambda_1(U)\geq\frac{h(U)^2}{2\Delta_{max}}.
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
\leq 2\Delta_{max}\left(\sum_{E(U)}(a(u)-a(v))^2\right)
\left(\sum_U a(v)^2\right).
$$
Thus the edge energy of each nonzero part is at least $h(U)^2/(2\Delta_{max})$ times its squared norm. The edge energy of $g$ is at least the sum of the energies of $p$ and $n$, while $\sum_U(g-m)^2\geq\min_b\sum_U(g-b)^2$. Taking the Rayleigh infimum proves the displayed estimate. This counting-measure proof uses the same coarea mechanism as the degree-weighted normalized-Laplacian inequality in [Chung 1997](https://fanchung.ucsd.edu/wp/cheeger.pdf), but does not identify the two conventions.
The Rayleigh-quotient definition of $\lambda_1(U)$ and the declared gradient normalization give
$$
\fint_U|f-f_U|^2\,d\mu
\leq\frac1{\lambda_1(U)}
\fint_U|\nabla f|^2\,d\mu
\leq\frac{2\Delta_{max}r^2}{H(r)^2}
\fint_U|\nabla f|^2\,d\mu.
$$
Combining the last three displays gives the asserted inequality with
$C_{PI}=2D_\star\sqrt{2\Delta_{max}}/H(r)$, which is the displayed formula. ∎

**Theorem C.6a (Obstruction to deriving the Section 11.4 non-collapsed synthetic-Ricci regime from the present theorem stack).**
Consider the rescaled spaces of Theorem 44,
$$
X_n := (\mathcal{V}_n,\delta_{eff,n}^{-1}d_{\mathcal N_n},o_n),
\qquad \delta_{eff,n}\to 0.
$$
Assume only the hypotheses and conclusions already established in Definitions C.1–C.3, Theorem C.6, Theorem 43, Lemma D.6a, and Theorem D.6. Then these results do not suffice to derive the Euclidean-tangent conclusion of Theorem 44. More precisely:

1. **Weighted-shell/local-isotropy closure.** Neither Appendix C nor Appendix D proves asymptotically equal first-shell weights, the empirical tensor condition of Remark C.3.3a, or an equivalent replacement sufficient to justify the scalar-curvature averaging step.
2. **Scale-invariant non-collapse.** Definition C.1 does not furnish fixed-radius lower-density bounds on the rescaled spaces, and Theorem C.6 does not by itself upgrade to family-uniform fixed-radius doubling/Poincaré control for the rescaled sequence.
3. **Limit-energy identification.** Appendix D provides pointed measured Gromov–Hausdorff precompactness of bounded-action families and action-level consistency, but no theorem identifying the limit Cheeger energy as a quadratic form.
4. **Curvature-class transfer.** The discrete curvature control of Definition C.2 is not upgraded anywhere in Appendix C/D to a uniform synthetic-curvature condition stable under the convergence used in Theorem 44.

Consequently, under the current PU hypotheses one can justify at most the compactness part of the continuum bridge once the separate bounded-geometry hypotheses of Lemma D.6a are imposed, while the first-shell averaging step, the quadraticity of the limit energy, and the existence of a full-measure regular set with unique Euclidean $\mathbb{R}^D$ tangent cones remain additional assumptions.

*Proof.* Remark C.3.3a already states the scalar-curvature estimator only under extra first-shell hypotheses. The present theorem stack contains no theorem deriving asymptotically equal shell weights or the weighted local-isotropy tensor from the discrete PU dynamics. Hence even the first-shell averaging step is conditional.

For a fixed rescaled radius $\rho>0$, the corresponding original-space radius is
$$
R=\rho\,\delta_{eff,n}.
$$
Definition C.1 applies only for $R>R_0$, equivalently
$$
\rho>R_0/\delta_{eff,n}.
$$
Because $\delta_{eff,n}\to 0$, any fixed $\rho$ eventually lies below this threshold. Hence Definition C.1 does not supply fixed-radius lower-density or two-sided volume-growth control on the rescaled sequence.

Theorem C.6 is a coarse-grained single-network statement: it assumes $r\ge 10\delta$ and yields constants $D_\star$ and $C_{\mathrm{PI}}(r)$ depending on the coarse-graining/distortion data. The present theorem stack contains no theorem showing that these data can be chosen uniformly across the rescaled family on every bounded radius range. Therefore Theorem C.6 does not by itself furnish the family-uniform fixed-radius doubling/Poincaré package required for a non-collapsed limit theory.

Lemma D.6a gives pointed measured Gromov–Hausdorff precompactness for bounded-action families once its separate bounded-geometry hypotheses are imposed. Theorem D.6 gives Gamma-convergence and convergence of almost minimizers under its liminf, recovery, equicoercivity, and lower-bound hypotheses. Identification of its limit with an Einstein–Hilbert plus MPU action requires separate liminf and recovery proofs. These results do not prove Mosco convergence of the rescaled Dirichlet forms, quadraticity of the limit Cheeger energy, or Euclidean tangent cones.

Finally, Definition C.2 provides a discrete curvature bound, but the present Appendix C/D theorem stack contains no theorem transferring it to a measured-Gromov–Hausdorff-stable synthetic curvature class such as the one invoked in Theorem 44. These four missing ingredients are exactly the additional inputs isolated in Section 11.4. Therefore the Euclidean-tangent conclusion of Theorem 44 is not derivable from Theorem 43 together with the current Appendix D bridge alone. ∎

**Remark C.6b (Sufficient additional ingredients for closure).** Any theorem closing the bridge to Theorem 44 must supply at least one result in each of the following categories:

| Category | Required statement |
|:---|:---|
| First-shell averaging | Asymptotically equal shell weights and the empirical isotropy tensor of Remark C.3.3a, or an equivalent replacement strong enough to justify the scalar-curvature averaging step |
| Scale-free non-collapse | $\mu_n(B_r(x)) \geq c\,r^D$ for all bounded $x$ and fixed $0 < r \leq 1$ after rescaling |
| Limit-energy identification | Mosco convergence of the rescaled random-walk Dirichlet forms, or another route identifying the limit Cheeger energy as quadratic |
| Curvature-class transfer | A discrete $CD(K,D)$ or $RCD(K,D)$ condition, or an equivalent radius-2 curvature-transfer theorem, uniform in $n$ and stable under measured Gromov–Hausdorff convergence |

Theorem 43.5 packages all four on the $M=24$, $D=4$ operational-continuum branch on which Theorem 44 is stated.

**Theorem C.6c (Conditional Noncollapsed $\mathrm{RCD}^*(K,4)$ Bridge).** Let $(X_n,d_n,\mu_n,x_n)$ converge in pointed measured-Gromov--Hausdorff topology to $(X,d,\mu,x)$. Assume:

1. Every $X_n$ and $X$ is a complete separable length metric-measure space with full-support locally finite measure, quadratic Cheeger energy, and the Sobolev-to-Lipschitz and integrability properties used in the Bakry-Émery characterization.
2. The global generator-domain inequalities $\mathrm{BE}(K_n,4)$ hold on $X_n$, where $K_n\to K$.
3. Under declared varying-space identifications, the Cheeger energies Mosco-converge and the heat-flow/carré-du-champ test quantities in the integrated $\mathrm{BE}(K_n,4)$ inequality converge strongly enough to pass that inequality to the limit.

Then $(X,d,\mu)$ is $\mathrm{RCD}^*(K,4)$. If, after a declared normalization, $\mu=\mathcal H^4$, the limit is noncollapsed.

*Proof.* Fix an admissible nonnegative test function and an admissible generator-domain function on $X$. Assumption 3 provides approximating tests and functions on $X_n$ for which every term in the integrated $\mathrm{BE}(K_n,4)$ inequality converges to the corresponding term on $X$. Passing to the limit and using $K_n\to K$ yields $\mathrm{BE}(K,4)$ on $X$. Assumption 1 supplies quadraticity, Sobolev-to-Lipschitz, completeness, full support, and the required integrability. The finite-dimensional Bakry-Émery characterization, with the length, full-support, quadratic-energy, Sobolev-to-Lipschitz and integrability hypotheses retained above, therefore implies that $X$ is $\mathrm{RCD}^*(K,4)$ [Erbar, Kuwada & Sturm, arXiv:1303.4382v2, Theorem 7 and Assumption 4.2](https://arxiv.org/abs/1303.4382v2). By definition, an $\mathrm{RCD}^*(K,4)$ space whose reference measure is the normalized four-dimensional Hausdorff measure is noncollapsed. ∎

A radius-2 polynomial-core estimate, local Ahlfors estimates, or vanishing finite defects does not supply Assumption 3; a separate stability certificate remains necessary.

**Theorem C.6c.1 (Bravais Propagation-Cost Networks Have Polyhedral Normed Limits).** Let $\Lambda\subset\mathbb R^D$, $D\ge2$, be a lattice, let $S\subset\Lambda\setminus\{0\}$ be a finite set with $S=-S$ that generates $\Lambda$ as a group, and let $c:S\to(0,\infty)$ satisfy $c_{-s}=c_s$. For $\delta>0$ let $\mathcal N_\delta$ be the Bravais network with vertex set $\delta\Lambda$, edges $\{x,x+\delta s\}$ for $x\in\delta\Lambda$ and $s\in S$, and edge costs $w_{x,x+\delta s}=c_s$, and let $d_\delta$ be its propagation-cost metric (64) with microscopic length $\delta$. Define
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

Item 2. Let $\rho$ be the covering radius of $\Lambda$ for $\|\cdot\|_{S,c}$. By (C.6c.1.2) the inclusion $\delta\Lambda\subset\mathbb R^D$ has additive distortion at most $C_{S,c}\delta$ and $\rho\delta$-dense image. Matching each lattice point with itself, and each point of $B_R^{\|\cdot\|_{S,c}}(x)$ with a nearest lattice point of its radial contraction by $(\rho+C_{S,c})\delta$ toward $x$, which lies in $B_R^{d_\delta}(x)$, gives correspondences between corresponding balls of radius $R$ with distortion $O(\delta)$. This is pointed Gromov–Hausdorff convergence [Burago, Burago & Ivanov 2001, §§7.3–8.1]. Translations are isometries of the limit and dilations $u\mapsto\lambda u$ multiply distances by $\lambda$, so every rescaling about every point is isometric to $(\mathbb R^D,\|\cdot\|_{S,c})$, which is therefore the tangent cone everywhere.

Item 3. Because $D\ge2$, a facet $F$ of $P_{S,c}$ contains two distinct points $u\ne v$, and $\frac12(u+v)\in F$ has norm one. In the ball $B_r^{\|\cdot\|_{S,c}}(0)$ the points $0$ and $\frac r2(u+v)$ are at distance $r$ and have the two distinct midpoints $\frac r2u$ and $\frac r2v$, whereas strict convexity of the Euclidean norm makes every midpoint in a Euclidean ball unique. Isometries preserve midpoints, so no ball of the normed space is isometric to a Euclidean ball; since compact metric spaces at Gromov–Hausdorff distance zero are isometric, $g_{S,c}>0$. Dilations give $d_{GH}(B_r^{\|\cdot\|_{S,c}},B_r^{\mathbb R^D})=rg_{S,c}$, and the triangle inequality for $d_{GH}$ together with item 2 gives the displayed lower bound.

Item 4. The space is doubling and supports a Poincaré inequality, being bi-Lipschitz equivalent to Euclidean space, so for $C^1$ functions the minimal weak upper gradient equals the pointwise Lipschitz constant $\|df\|_{S,c,*}$ almost everywhere [Cheeger 1999], where $\|\cdot\|_{S,c,*}$ is the dual norm. In an infinitesimally Hilbertian space the squared minimal weak upper gradient satisfies the parallelogram identity almost everywhere [Ambrosio, Gigli & Savaré 2014]. Applied to $C^1$ functions that equal two linear forms $\ell_1,\ell_2$ on a ball, it would give $\|\ell_1+\ell_2\|_{S,c,*}^2+\|\ell_1-\ell_2\|_{S,c,*}^2=2\|\ell_1\|_{S,c,*}^2+2\|\ell_2\|_{S,c,*}^2$, so the dual norm and hence $\|\cdot\|_{S,c}$ would be induced by scalar products; an ellipsoid has no segment in its boundary, whereas the facets of $P_{S,c}$ do. The definition of $\mathrm{RCD}(K,N)$ includes infinitesimal Hilbertianity.

Item 5. Each root satisfies $\|s\|_\infty=1$ and $\|s\|_1=2$, so $\operatorname{conv}\Xi_{D_4}\subseteq Q:=\{\|u\|_\infty\le1,\ \|u\|_1\le2\}$. Conversely, let $u$ be an extreme point of $Q$; after a signed permutation, which preserves $Q$ and $\Xi_{D_4}$, $u\ge0$. If $\|u\|_1<2$, then $u$ is extreme in the cube $[-1,1]^4$, hence lies in $\{\pm1\}^4$, where $\|u\|_1=4$; so $\sum_iu_i=2$. The hypersimplex $\{x\in[0,1]^4:\sum_ix_i=2\}$ lies in $Q$ and contains $u$, so $u$ is one of its extreme points $e_i+e_j$. Hence $Q=\operatorname{conv}\Xi_{D_4}$, which gives the gauge formula. For $C_{S,c}=0$ it suffices, by the lower bound, to show that every nonzero $a\in D_4$ has a root $s$ with $\|a-s\|_P=\|a\|_P-1$, where $\|\cdot\|_P:=\max(\|\cdot\|_\infty,\frac12\|\cdot\|_1)$ is integer-valued on $D_4$. After a signed permutation $a_1\ge a_2\ge a_3\ge a_4\ge0$; put $m=\|a\|_P$ and $s=e_1+e_2$. If $a_2\ge1$, the half $\ell^1$-norm drops by one and the new largest coordinate is $a_1-1\le m-1$ or $a_3$, with $a_3\le m-1$ unless $a_1=a_2=a_3=k$, in which case $m\ge\frac12(3k+a_4)\ge k+1$ because $(k,a_4)=(1,0)$ would give an odd coordinate sum. If $a_2=0$, then $a=(a_1,0,0,0)$ with $a_1\ge2$ even and $\|a-s\|_P=\max(a_1-1,\frac{a_1}2)=a_1-1$. In both cases $\|a-s\|_P\le m-1$, and the triangle inequality gives equality. Induction on $m$ shows that the word length of $a$ equals $\|a\|_P$, hence $C_{S,c}=0$. On the Euclidean unit sphere, $\|u\|_\infty\le1$ and $\|u\|_1\le2$ give $\|u\|_P\le1$; if $\|u\|_P<2^{-1/2}$, then $1=\sum_iu_i^2\le\|u\|_\infty\|u\|_1<2^{-1/2}\cdot2^{1/2}=1$, a contradiction. The two displayed vectors attain the bounds, and connectedness of the sphere gives every intermediate value.

The concluding paragraph follows from items 2–4: Theorem 44 asserts a quadratic limit Cheeger energy and Euclidean tangent cones; Theorem 43.5 asserts a noncollapsed $\mathrm{RCD}^*(K,4)$ limit, Mosco convergence to the quadratic Cheeger energy and Euclidean tangent cones; Theorem C.6c assumes quadratic Cheeger energy at the limit; and (D.6e.4) contains the Gromov–Hausdorff term of item 3. ∎

**Resolution TV-REG-04-R1 (Metadata).** Exact domain: all Bravais propagation-cost networks $\mathcal N_\delta$ in $\mathbb R^D$, $D\ge2$, over every lattice, every finite symmetric generating set and every symmetric positive translation-invariant cost, each triple fixed as $\delta\to0$, and truncations containing $\delta\Lambda\cap B_{3r+C_{S,c}\delta}(o)$ for each audited radius $r$. Premises: the propagation-cost metric (64) and the certificate package of Theorems C.6c, 43.5 and 44. Equivalence: pointed metric spaces up to isometry; networks with the same $(\Lambda,S,c)$ are identified. Budget: every triple $(\Lambda,S,c)$, every base point and every chart radius. Verifier: the linear-programming norm and rounding bound (C.6c.1.2), the midpoint invariant, the cited Lipschitz-constant and parallelogram criteria, and the exact $D_4$ gauge and word-length identity of item 5. Falsifier: a Bravais network whose rescaled propagation-cost balls converge to Euclidean balls, which would contradict the midpoint invariant of item 3, or a pair of lattice points violating (C.6c.1.2). Provenance class: source-internal no-go over a frozen coverage-complete class, with cited metric-measure background. Downstream consumers: Theorems C.6c, 43.5 and 44, Corollary 43.5a, Theorem D.6e, Corollary D.6f.2d, Corollary D.8.6g and `TV-REG-04`. Nonvacuity: the $\delta_nD_4$ network of item 5. Theorem C.6c.1 is `negative-refutation` of the Bravais route to the noncollapsed RCD bridge with the propagation-cost metric: along every member of the class the limit fails quadratic Cheeger identification, Euclidean tangent cones and Euclidean Gromov–Hausdorff rigidity. Certification of noncollapse/PI, $\Gamma_2$ stability, a quadratic Mosco limit, Sobolev-to-Lipschitz and harmonic-chart rigidity on one sequence outside this class remains `M+C+R` under `TV-REG-04`.

**Proposition C.6c.2 (Exact Curvature Data of the $D_4$ Bravais Network and Nonentailment of the RCD Transfer).** On the network $\delta D_4$ of Theorem C.6c.1 item 5, with root edges of cost $w$, write $\Delta_sf(x):=f(x+\delta s)-f(x)$ for $s\in\Xi_{D_4}$, take the generator $Lf:=c\sum_{s\in\Xi_{D_4}}\Delta_sf$ with conductance $c>0$, and define $\Gamma$ and $\Gamma_2$ from $L$ as in Proposition C.3.3b. Then:

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

**Resolution TV-REG-01-R2 (Metadata).** Exact domain: the uniform-cost, uniform-conductance Bravais network $\delta D_4$ with every idleness $\alpha\in[0,1]$ and every symmetric step law on $\Xi_{D_4}$, the full function space on each radius-2 ball, and the radius-2 quadratic polynomial core. Premises: the propagation-cost metric (64), the generator $L$ and Theorem C.6c.1. Equivalence: vertices and edges are identified under translations and signed permutations. Budget: every edge, every vertex, every function on the radius-2 ball and every symmetric matrix $A$. Verifier: the translation coupling and the linear Kantorovich potential, the abelian $\Gamma_2$ identity, the averaging argument over signed permutations, the explicit extremal function, the polynomial identity (C.6c.2.2) and lattice-point counting. Falsifier: an edge with nonzero curvature for a symmetric lazy kernel, a function with $8\Gamma_2(f)(x)<(Lf(x))^2$, or a symmetric $A$ violating (C.6c.2.2). Provenance class: source-internal exact classification on a frozen carrier, with the nonentailment inherited from Theorem C.6c.1. Downstream consumers: Remark C.3.3a, Theorems C.6a and C.6c, the defect (D.6e.1), Corollary 43.5a and `TV-REG-01`. Nonvacuity: the $\delta_nD_4$ sequence. Proposition C.6c.2 gives `positive-discharge` of the lazy-kernel curvature classification and the exact radius-2 $\Gamma_2$ bounds on this carrier, and `nonentailment` of every transfer from these discrete curvature, volume and moment data to an $\mathrm{RCD}(K,N)$ limit. The quantitative Ollivier-to-BE/RCD transfer with its metric–energy compatibility certificate on the PU carrier remains `M+C+R` under `TV-REG-01`.

**Lemma C.6d (The $D_4$ Shell Moment Closure).** Let
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

**Theorem C.6e (Local PCE Shell-Isotropy Closure).** Assume the feasible shell tensors are positive semidefinite, contain $(C_\Sigma/4)I_4$, and satisfy $\operatorname{tr}Q=C_\Sigma>0$. Define
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

**Lemma C.6f (Exact Fourth-Moment Isotropy and Sixth-Moment Defects of the Equal-Weight $D_4$ Shell).** Let $\Xi$ be the $M=24$ vectors of the $D_4$ root shell in $\mathbb R^4$, the signed permutations of $(1,1,0,0)$, each with $|\xi|^2=2$, taken with equal weight $1/M$. Then the fourth-moment tensor is exactly isotropic,
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

**Theorem C.6g (No Weighted $D_4$ Root Shell Has an Isotropic Sixth Moment).** Let $\Xi_{D_4}$ be the $24$ roots $\pm e_i\pm e_j$ and let arbitrary real weights $w_\xi$ satisfy only
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

**Proposition C.6h (Shell Point Symmetry and the Degree-Six Invariant Floor).** Let $\Gamma\subset O(4)$ be the group generated by coordinate permutations and coordinate sign changes, let $v:=\frac12(1,1,1,1)$, let $r_v(x):=x-2(x\cdot v)v$ denote the reflection in $v$, and let $\Gamma^{+}:=\langle\Gamma,r_v\rangle$. Then:

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

**Proposition C.6i (A Registered Four-Dimensional Shell Class and Its Anisotropy Floors).** For a finite set $S\subset\mathbb R^4\setminus\{0\}$ of equal-norm vectors spanning $\mathbb R^4$, closed under $x\mapsto-x$, with a designated symmetry group $\Gamma_S\subseteq O(4)$ preserving $S$, define the anisotropy floor $a(S)$ as the smallest positive integer $d$ such that either the equal-weight moment tensor $\frac1{|S|}\sum_{\xi\in S}\xi^{\otimes d}$ is not isotropic or some homogeneous $\Gamma_S$-invariant polynomial of degree $d$ is not a polynomial in $|x|^2$. Compare shells at one fixed norm and up to orthogonal equivalence, carrying their designated symmetry groups under that equivalence. Register the competitor class $\mathcal C_4$ consisting of: (a) any shell whose designated symmetry group preserves a nontrivial orthogonal splitting $\mathbb R^4=V_1\oplus V_2$, possibly together with a swap of the summands when $\dim V_1=\dim V_2=2$; (b) the $A_4$ root shell, the $20$ vectors $e_i-e_j$, $i\ne j$, in the sum-zero hyperplane $H\subset\mathbb R^5$; (c) the $A_4^{*}$ minimal shell, the $10$ vectors $\pm v_i$ with $v_i:=e_i-\frac15\sum_{j=1}^5e_j$ in $H$; (d) the $D_4$ root shell $\Xi_{D_4}$ with $\Gamma_S=\Gamma^{+}$ of Proposition C.6h. Then $a(S)\le4$ in cases (a), (b), (c), while $a(\Xi_{D_4})=6$.

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

**Proposition C.6j (Isotropy-Economy Selection of the $D_4$ Shell and the Cardinality $M=24$).** Let $\mathcal J$ be any comparison functional on the class $\mathcal C_4$ of Proposition C.6i that is strictly decreasing in the anisotropy floor: $a(S)>a(S')$ implies $\mathcal J(S)<\mathcal J(S')$, a registered strict ordering of these competitors. A physical PCE functional realizes this comparison when its registered coefficient and defect map certifies the strict ordering of these shells. Then the unique orthogonal-equivalence class of $\mathcal J$-minimizers on $\mathcal C_4$ is the $D_4$ root shell, and its cardinality is $M=|\Xi_{D_4}|=24$. This records an isotropy-economy selection of the $M=24$ shell that is independent of, and convergent with, the Appendix Z interface-ledger derivation of $M=24$ and with the kissing-optimality and spherical-design records of the $24$-cell, whose Gegenbauer moments vanish for degrees one through five and first fail at degree six by Theorem U.30; that theorem records no uniqueness claim, which the present registered-class selection supplies. Exhaustion of four-dimensional shells beyond the registered class remains open.

*Proof.* By Proposition C.6i, $a(S)\le4$ for every member of cases (a), (b), (c) and $a(\Xi_{D_4})=6$, so the $D_4$ shell strictly maximizes the anisotropy floor on $\mathcal C_4$, and strict monotonicity of $\mathcal J$ in the floor makes it the unique minimizing class. The cardinality count is the $24$ signed pairs $\pm e_i\pm e_j$, $1\le i<j\le4$. ∎

**Theorem C.6k (Reflection-Designated Shell Census and Crystallographic Selection of $D_4$).** Let $\mathcal S_4$ be the class of all shells admitted in Proposition C.6i, namely finite sets $S\subset\mathbb R^4\setminus\{0\}$ of equal-norm vectors spanning $\mathbb R^4$ and closed under $x\mapsto-x$, compared up to orthogonal equivalence and scaling. Give each $S$ the canonical designated group $\Gamma_S:=\operatorname{Refl}(S)$ generated by all orthogonal reflections of $\mathbb R^4$ that preserve $S$, and let $\mathcal S_4^{\mathrm{cr}}\subset\mathcal S_4$ be the crystallographic subclass, whose members have discrete $\mathbb Z$-span. For a finite group $\Gamma\subset O(4)$ let $f(\Gamma)$ be the least positive degree of a $\Gamma$-invariant homogeneous polynomial that is not a polynomial in $|x|^2$. Then:

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

Item 2. $\operatorname{Refl}(S)$ lies in the finite group of orthogonal maps preserving the finite spanning set $S$, so it is a finite reflection group. A nonzero fixed vector $u$ gives the linear invariant $u\cdot x$. Without fixed vectors but with an invariant orthogonal splitting $V_1\oplus V_2$, there is no linear invariant and the quadratic invariant $|x_{V_1}|^2$ is not a multiple of $|x|^2$. Otherwise the group is irreducible, hence by the classification of finite reflection groups of rank four of type $A_4$, $B_4$, $D_4$, $F_4$ or $H_4$. By Chevalley's theorem its invariant algebra is a polynomial algebra on algebraically independent homogeneous basic invariants, of degrees $(2,3,4,5)$, $(2,4,6,8)$, $(2,4,4,6)$, $(2,6,8,12)$ and $(2,12,20,30)$ respectively, and the group orders are $120$, $384$, $192$, $1152$ and $14400$ [Humphreys 1990, Chs. 2–3]. For an irreducible group the degree-two basic invariant is a multiple of $|x|^2$, so every invariant of degree below the second degree $d_2$ is a polynomial in $|x|^2$, while the basic invariant of degree $d_2$ is not, by algebraic independence. Hence $f=d_2$, which is (C.6k.1).

Item 3. The root system of type $H_4$ can be taken to be the $120$ unit icosians, the vertices of the regular $600$-cell, which form one orbit of $W(H_4)$. For a finite reflection group the stabilizer of a point of the closed fundamental chamber is the standard parabolic subgroup generated by the simple reflections fixing it [Humphreys 1990, §1.12], so the least orbit size of a nonzero point is $|W|$ divided by the largest order of a proper standard parabolic subgroup. For $H_4$ the maximal proper standard parabolic subgroups have types $H_3$, $A_3$, $I_2(5)\times A_1$ and $A_2\times A_1$, of orders $120$, $24$, $20$ and $12$, so the least orbit size is $14400/120=120$, attained only on the orbit of the fixed line of the $H_3$ parabolic, which is the root orbit up to scaling. A shell with $\operatorname{Refl}(S)$ of type $H_4$ is a union of orbits of a conjugate of $W(H_4)$, so $|S|\ge120$, with equality exactly for a scaled image of the $600$-cell. Conversely, $\operatorname{Refl}$ of the $600$-cell contains $W(H_4)$, acts irreducibly and has order at least $14400$; by item 2 it equals $W(H_4)$. Item 2 then gives $a=12$ and the maximality.

Item 4. If the $\mathbb Z$-span $\Lambda$ of $S$ is discrete, it is a lattice preserved by $\operatorname{Refl}(S)$, so every element has an integral matrix in a basis of $\Lambda$ and an integral trace. A Coxeter group of type $H_4$ contains the product of two simple reflections whose mirrors meet at the angle $\pi/5$; it is a rotation by $2\pi/5$ in a plane fixing the orthogonal complement, with trace $2+2\cos(2\pi/5)=(3+\sqrt5)/2\notin\mathbb Z$. Type $H_4$ is therefore excluded, and item 2 gives $a\le6$, with equality exactly for type $F_4$. The maximal proper standard parabolic subgroups of $F_4$ have types $B_3$, $C_3$, $A_2\times A_1$ and $A_1\times A_2$, of orders $48$, $48$, $12$ and $12$, so the least orbit size is $1152/48=24$, attained exactly on the long-root orbit $\Xi_{D_4}$ and the short-root orbit $\{\pm e_i\}\cup\{\frac12(\pm1,\pm1,\pm1,\pm1)\}$, up to scaling. The orthogonal map $(u_1,u_2,u_3,u_4)\mapsto2^{-1/2}(u_1+u_2,u_1-u_2,u_3+u_4,u_3-u_4)$ sends $\sqrt2$ times the short-root orbit onto $\Xi_{D_4}$. The reflections in the $48$ roots of $F_4$ preserve $\Xi_{D_4}$, so $\operatorname{Refl}(\Xi_{D_4})$ contains $W(F_4)$; it is crystallographic and irreducible, so by item 2 and the exclusion of $H_4$ it equals $W(F_4)$, and $a(\Xi_{D_4})=6$. The $96$ vectors of squared norm $6$ in $D_4$ are the signed permutations of $(2,1,1,0)$, which form one $W(F_4)$-orbit; the same argument gives $a=6$ for this shell. The final statement follows by comparing first $a$ and then $|S|$. ∎

**Resolution TV-REG-05-R1 (Metadata).** Exact domain: every admissible shell of Proposition C.6i in $\mathbb R^4$ with the canonical designation $\Gamma_S=\operatorname{Refl}(S)$, and its crystallographic subclass. Premises: the anisotropy floor of Proposition C.6i, the classification of finite reflection groups, Chevalley's theorem with the rank-four degree table, and the parabolic-stabilizer theorem. Equivalence: orthogonal equivalence and scaling. Budget: all shells in $\mathcal S_4$, all fixed-vector and reducible cases, all five irreducible rank-four types, and every orbit of $W(F_4)$ and $W(H_4)$. Verifier: the moment-to-invariant identity of item 1, the degree table, the parabolic orders, the trace obstruction and the explicit similarity. Falsifier: an admissible shell with reflection floor above $12$, a crystallographic shell with floor above $6$, a crystallographic shell of floor $6$ with fewer than $24$ vectors, or a $24$-vector shell of floor $6$ not similar to $\Xi_{D_4}$. Provenance class: exact classification from standard Coxeter-group theory. Downstream consumers: Propositions C.6h–C.6j, Theorem U.30 and `TV-REG-05`. Nonvacuity: the $600$-cell, $\Xi_{D_4}$ and the $96$-vector shell of $D_4$. Theorem C.6k is `negative-refutation` of uniqueness of the $D_4$ minimizer on the full admissible class $\mathcal S_4$, where the floor-then-cardinality ordering selects the $600$-cell with $M=120$, and `positive-discharge` of the unique $D_4$, $M=24$ selection on $\mathcal S_4^{\mathrm{cr}}$ under that ordering. The census concerns the reflection floor alone; the saturation ledger of Theorems Z.7a and Z.9 and the faithful-shell dimensional-selection ledger of Definition Z.9a and Theorems Z.10–Z.11 remain separate cost ledgers, and combining either with this ordering requires an additional theorem. The physical admission of the crystallographic premise and of the cardinality tie-break, the crystallographic census under full-symmetry designation, the source-complete PCE coefficient/defect map realizing the ordering and the response-faithful shell realization remain `M+C+R` under `TV-REG-05`.

## C.7 Conclusion and status boundary

Under the stated cost, communication, and viability conditions, the appendix excludes sufficiently severe irregularity and identifies the extra records needed for the continuum branch. Beyond the local symmetry of the model's nearest-neighbor shell, a continuum description needs independent control of collapse, convergence, energy, and rigidity.

**Technical ledger.**

This appendix separates local shell isotropy from global continuum closure. Theorem C.6e controls only the fixed-trace shell tensor and Lemma C.6f only the exact fourth-moment shell tensor; geometric noncollapse, measured-Gromov--Hausdorff compactness, Mosco convergence, and Cheeger-energy identification remain independent hypotheses.

Theorem F.0 and Theorem 48a separately supply the full AQFT net and the local-horizon KMS/Clausius bridge. The operational-continuum branch proves a finite-resolution manifold compression after the microscopic continuum-control defects of Theorem D.6e are included in the adaptation potential and selected by Theorem 43.5; the exact real-number continuum remains an effective completion, not an additional physical substrate.

On the registered edge-comparability, traffic or synchronization, clock or contraction, curvature-response, adaptation-tracking, convex-cost, and viability-budget branches, the Appendix C estimates exclude sufficiently severe irregularity. Theorem 43.5 separately packages the $M=24$, $D=4$ operational-continuum branch with its noncollapse, curvature-transfer, Mosco, recovery, and rigidity certificates, while Appendix F states the independent algebraic AQFT requirements.


