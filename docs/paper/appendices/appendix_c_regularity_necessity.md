# Appendix C: Necessity of Geometric Regularity

## C.1 Introduction: The Requirement for Geometric Order

This appendix asks when highly irregular network shapes become too costly or unreliable to sustain prediction. It develops separate tests based on long communication paths, uneven local geometry, coherence, and finite resource budgets. Passing those tests supports an orderly large-scale geometry; a separate continuum construction supplies the further step to a smooth effective description.

**Technical ledger.**

This appendix formulates conditional exclusion gates supporting Theorem 43. The anomalous-distance gate applies to network families carrying uniform edge-cost comparability together with a registered global-coherence synchronization task or a non-amortized traffic ledger, per-step channel or clock data, and the corresponding extensive resource bound. The curvature-fluctuation gate applies after fixing the graph metric and response kernel and supplying curvature-load coupling, adaptation variance transfer, convex operational cost, and any distant-failure independence model used by the viability estimate. Under those premises, sufficiently severe irregularity violates at least one registered requirement:

*   **(LV) Local Viability:** Each MPU $v$ must maintain its registered predictive performance within the task-dependent Space of Becoming $(\alpha,\beta)$.
*   **(GC) Global Coherence:** The declared aggregate task must preserve the specified encoded distinction or synchronization record across its macroscopic window.
*   **(RE) Resource Efficiency:** The registered propagation and operation ledgers must remain within their declared sustainable budgets.

Section C.2 defines the geometric properties. Section C.3 constructs a representative Ollivier-curvature response only for its specified metric, kernel, smoothness, and homogeneity data. Sections C.4–C.5 derive the conditional GC, RE, and LV penalties, while Section C.6 collects them. The separate continuum package of Section 11 additionally requires noncollapse, curvature-transfer, Mosco, and rigidity certificates; Appendix C alone does not yield a smooth manifold.

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
The effective cost-rate function $I(c)$, reflecting the local contribution to the global PCE Potential $V(x)$ (main text Definition D.1) due to complexity $c=C_P$, is shaped by the interplay of predictive performance benefits and resource costs. Based on the properties of $PP(c)$ (concave, main text Definition 19), $R(c)$ (convex, main text Definition 3), and $R_I(c)$ (concave, main text Definition 3b), it is assumed that for PCE-optimal configurations, $I(c)$ is both $m$-strongly convex (i.e., $I''(c) \ge m > 0$, ensuring it has a well-defined minimum and certain growth properties facilitating stable optimization) and $M$-smooth (i.e., $|I''(c)| \le M < \infty$) over the relevant range of complexities $c \in [C_{op}, C_{\max,\mathrm{phys}}]$ (where $C_{\max,\mathrm{phys}}$ is the maximum physically sustainable complexity). The $M$-smoothness implies its derivative $I'(c) = \partial_{C_P}I(c)$ is $M$-Lipschitz continuous:
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
This establishes a strictly positive lower bound only for this Ollivier-Ricci model under the local hypotheses in Lemma C.3.3, the baseline-row discrepancy bound, and $\eta_R<1$. It does not establish a Bakry-Émery lower bound, a measured-Gromov-Hausdorff-stable curvature class, or the Section 11.4 continuum branch. Those transfers require the additional weighted-shell/local-isotropy input of Remark C.3.3a or an equivalent replacement, radius-2 or curvature-matrix control, and the separate convergence hypotheses isolated in Theorem C.6a and Appendix F.


¹ Footnote: The parameter $\lambda_R$ is specific to this curvature model (Equation C.2) and represents the sensitivity of local transition probabilities to gradients in the effective cost-rate $I'$. It should not be confused with the resource scarcity Lagrange multiplier $\lambda$ from main text Definition 20.


**Remark C.3.3a (From Ollivier-Ricci to a continuum scalar curvature estimator).**
This estimator is an additional continuum-bridge hypothesis, not a consequence of the Appendix C theorem stack. Let $(\mathcal N_h,d_h)$ be a sequence of MPU networks sampling a $C^3$ Riemannian manifold $(M,g)$, with adjacent rescaled edge lengths $h+O(h^2)$. Assume first-shell weights $\omega_{xy}\geq0$ satisfying
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


## C.4 Penalization of Anomalous Network Dimension

We first demonstrate that anomalous dimension (Definition C.1 violated) leads to violations of global coherence (R2) and resource efficiency (R3).

**Theorem C.1 (Cost-Distance Scaling under Quasi-Isometry and Uniform Edge-Cost Comparability).**
Let $\mathcal N=(\mathcal V,\mathcal E)$ be embedded in Euclidean space. Write $c_e>0$ for the cost length of edge $e$ in $d_{\mathcal N}$ and assume that constants $0<c_-\leq c_+<\infty$, independent of system size, satisfy
$$
c_-\leq c_e\leq c_+\qquad(e\in\mathcal E).
$$

* (a) If the unweighted graph metric is quasi-isometric to the embedding,
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
If the admissible resource budget is extensive,
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

This section derives two conditional penalties from curvature fluctuations. The resource-efficiency estimate requires the curvature-load and external-innovation certificates together with uniform strong convexity of the operational cost. The local-viability estimate requires mutually independent failure events and an external tracking bound relating their mean probability to complexity variance. Curvature variance or absence of a positive curvature lower bound alone implies neither penalty.

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
2. With the registered inputs subtracted, the controller state is observable from $y_0,\ldots,y_{n-1}$ exactly when
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



* **(i) Excess Operational Cost (conditional RE penalty):** Assume that a registered adaptation/tracking estimate supplies a quantitative lower bound $\operatorname{Var}(C_v)\geq s_C^2$ for the configuration under study. The curvature-load coupling and Equation (30) alone do not supply this variance-transfer bound. Let $f(C_v) = \langle \lambda \hat{R}(C_v) + \hat{R}_I(C_v) \rangle_{\rho^{(v)}}$ represent the local expected operational cost rate associated with complexity $C_v$. The physical cost function $R(C)$ is strictly convex ($\gamma_p>1$), while $R_I(C)$ is concave (Definition 3). For the total cost $f(C)$ to be convex ($f''(C) > 0$), we require $\lambda R''(C) > |R_I''(C)|$. This condition is satisfied if the **Dominance of Stabilizing Costs (DSC)** condition (introduced in the statement of Theorem 22, Section 6.5.2) holds, ensuring $f''(C) \ge f''_{min} > 0$. In addition, since $f$ is increasing, any locally forced increase in $C$ (needed to match local targets under curvature fluctuations) raises $V_{op}$ pointwise; combined with convexity this yields the quantitative variance penalty $\Delta V_{op}\ge \frac{N}{2}f''_{min}\,\text{Var}(C_v)$ (Equation C.15). This convexity reflects that fundamental costs increase super-linearly with complexity. The total operational cost across the network is $V_{op} = \sum_{v=1}^N f(C_v)$. By Jensen's inequality for convex functions, $\frac{1}{N}\sum f(C_v) \ge f(\frac{1}{N}\sum C_v)$, or $V_{op} \ge N f(\bar{C})$, where $\bar{C}$ is the average complexity. Assume that every $C_v$ lies in an interval on which $f\in C^2$ and $f''(C)\geq f''_{min}>0$. Taylor's theorem with integral remainder gives, for $x=C_v-\bar C$,
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

**Theorem C.5 (Quantitative Non-Viability on the Registered Penalty Branches).** Let $\mathcal C$ be an MPU-network configuration. It is non-viable, $\mathcal V[\mathcal C]<1$, if at least one of the following certified conditions holds:

1. The super-linear chemical-distance hypotheses of Theorem C.2 hold and the branch-specific coherence bound gives $MP_{Global}<MP_{min}$.
2. The effective-average routing and extensive-budget hypotheses of Theorem C.2(ii) hold and give $V_{prop}>V_{max}$.
3. The curvature-load coupling, external innovation certificate, and DSC hypotheses hold, $s_C^2:=\operatorname{Var}(C_v)$ is certified, and
$$
V_{base}+\frac{N}{2}f''_{min}s_C^2>V_{max},
$$
where $V_{base}$ contains all non-variance contributions to $V_{total}$.
4. On the independent-failure branch, the certified mean failure probability $\bar p$ satisfies
$$
P_{stability}\leq e^{-N\bar p}<P_{min}.
$$

Failure of Definition C.1 or C.2 without one of these quantitative branch certificates does not by itself imply non-viability.

*Proof.* In case 1,
$$
Q_{\mathrm{GC}}=\frac{MP_{Global}}{MP_{min}}<1.
$$
In case 2, $V_{total}\geq V_{prop}>V_{max}$, so
$$
Q_{\mathrm{RE}}=\frac{V_{max}}{V_{total}}<1.
$$
In case 3, Equation (C.15) gives $V_{total}\geq V_{base}+Nf''_{min}s_C^2/2>V_{max}$, and again $Q_{\mathrm{RE}}<1$. In case 4,
$$
Q_{\mathrm{LV}}=\frac{P_{stability}}{P_{min}}<1.
$$
In every case at least one entry in the minimum defining $\mathcal V$ is strictly below $1$; hence $\mathcal V[\mathcal C]<1$. ∎

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

**Theorem C.6 (Conditional coarse-grained doubling and $(1,2)$-Poincaré bounds).**

Let $(\mathcal N,d_{\mathcal N},\mu)$ be a locally finite predictive network with counting measure, maximum degree $\Delta_{max}<\infty$, and coarse-graining resolution $\delta$. For a finite induced subgraph $U$, define
$$
h(U):=\min_{\substack{\varnothing\neq A\subset U\\
\mu(A)\leq\mu(U)/2}}
\frac{|\partial_UA|}{\mu(A)},
\qquad
|\nabla f|^2(v):=\frac12\sum_{u\sim v,\,u\in U}|f(u)-f(v)|^2.
$$
Assume that the registered packing/isoperimetric certificate gives, for every $x$ and $r\geq10\delta$,
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
Applying the doubling certificate at $s=r$ and $s=2r$ yields $\mu(U)/\mu(B)\leq D_\star^2$. For the unnormalized graph Laplacian on the finite induced graph $U$, the discrete Cheeger inequality [Chung 1997] gives
$$
\lambda_1(U)\geq\frac{h(U)^2}{2\Delta_{max}}.
$$
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

Lemma D.6a then gives pointed measured Gromov–Hausdorff precompactness for bounded-action families once its separate bounded-geometry hypotheses are imposed, while Theorem D.6 concerns only convergence of the discrete action functional to the Einstein-Hilbert plus MPU action. It does not prove Mosco convergence of the rescaled Dirichlet forms, quadraticity of the limit Cheeger energy, or Euclidean tangent cones.

Finally, Definition C.2 provides a discrete curvature bound, but the present Appendix C/D theorem stack contains no theorem transferring it to a measured-Gromov–Hausdorff-stable synthetic curvature class such as the one invoked in Theorem 44. These four missing ingredients are exactly the additional inputs isolated in Section 11.4. Therefore the Euclidean-tangent conclusion of Theorem 44 is not derivable from Theorem 43 together with the current Appendix D bridge alone. ∎

**Remark C.6b (Sufficient additional ingredients for closure).** Any theorem closing the bridge to Theorem 44 must supply at least one result in each of the following categories:

| Category | Required statement |
|:---|:---|
| First-shell averaging | Asymptotically equal shell weights and the empirical isotropy tensor of Remark C.3.3a, or an equivalent replacement strong enough to justify the scalar-curvature averaging step |
| Scale-free non-collapse | $\mu_n(B_r(x)) \geq c\,r^D$ for all bounded $x$ and fixed $0 < r \leq 1$ after rescaling |
| Limit-energy identification | Mosco convergence of the rescaled random-walk Dirichlet forms, or another route identifying the limit Cheeger energy as quadratic |
| Curvature-class transfer | A discrete $CD(K,D)$ or $RCD(K,D)$ condition, or an equivalent radius-2 curvature-transfer theorem, uniform in $n$ and stable under measured Gromov–Hausdorff convergence |

Without all four, Theorem 44 remains genuinely conditional.

**Theorem C.6c (Conditional Noncollapsed $\mathrm{RCD}^*(K,4)$ Bridge).** Let $(X_n,d_n,\mu_n,x_n)$ converge in pointed measured-Gromov--Hausdorff topology to $(X,d,\mu,x)$. Assume:

1. Every $X_n$ and $X$ is a complete separable length metric-measure space with full-support locally finite measure, quadratic Cheeger energy, and the Sobolev-to-Lipschitz and integrability properties used in the Bakry-Émery characterization.
2. The global generator-domain inequalities $\mathrm{BE}(K_n,4)$ hold on $X_n$, where $K_n\to K$.
3. Under declared varying-space identifications, the Cheeger energies Mosco-converge and the heat-flow/carré-du-champ test quantities in the integrated $\mathrm{BE}(K_n,4)$ inequality converge strongly enough to pass that inequality to the limit.

Then $(X,d,\mu)$ is $\mathrm{RCD}^*(K,4)$. If, after a declared normalization, $\mu=\mathcal H^4$, the limit is noncollapsed.

*Proof.* Fix an admissible nonnegative test function and an admissible generator-domain function on $X$. Assumption 3 provides approximating tests and functions on $X_n$ for which every term in the integrated $\mathrm{BE}(K_n,4)$ inequality converges to the corresponding term on $X$. Passing to the limit and using $K_n\to K$ yields $\mathrm{BE}(K,4)$ on $X$. Assumption 1 supplies quadraticity, Sobolev-to-Lipschitz, completeness, full support, and the required integrability. The Bakry-Émery characterization of Riemannian curvature-dimension spaces therefore implies that $X$ is $\mathrm{RCD}^*(K,4)$ [Ambrosio, Gigli & Savaré 2015]. By definition, an $\mathrm{RCD}^*(K,4)$ space whose reference measure is the normalized four-dimensional Hausdorff measure is noncollapsed. ∎

A radius-2 polynomial-core estimate, local Ahlfors estimates, or vanishing finite defects does not supply Assumption 3; a separate stability certificate remains necessary.

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

Consequently the minimal degree of a $\Gamma^{+}$-invariant polynomial that is not a polynomial in $|x|^2$ is exactly six. Moreover $\frac1MT_6$ is the full contraction of the equal-weight sixth-moment tensor of Lemma C.6f with $x^{\otimes6}$, so the two displayed anisotropic moment components of the degree-six stratum on the equal-weight shell are the Lemma C.6f defects $-1/d_0$ and $+1/M$. Modulo the radial sextic, the invariant anisotropy is one-dimensional; the two displayed moments are components of that single pattern. Theorem C.6g shows that this degree-six anisotropy cannot be cancelled by reweighting the shell; the present proposition shows that no $\Gamma^{+}$-invariant structure can carry anisotropy below degree six.

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

## C.7 Conclusion and status boundary

Local symmetry of the model's nearest-neighbor shell is only one part of large-scale geometric order. A continuum description also needs independent control of collapse, convergence, energy, and rigidity. Under the stated cost, communication, and viability conditions, the appendix excludes sufficiently severe irregularity and identifies the extra records needed for the continuum branch.

**Technical ledger.**

This appendix separates local shell isotropy from global continuum closure. Theorem C.6e controls only the fixed-trace shell tensor and Lemma C.6f only the exact fourth-moment shell tensor; geometric noncollapse, measured-Gromov--Hausdorff compactness, Mosco convergence, and Cheeger-energy identification remain independent hypotheses.

Appendix C does not by itself construct the full AQFT net or the local-horizon KMS/Clausius bridge. Those are supplied separately by Theorem F.0 and Theorem 48a. The operational-continuum branch proves a finite-resolution manifold compression after the microscopic continuum-control defects of Theorem D.6e are included in the adaptation potential and selected by Theorem 43.5; the exact real-number continuum remains an effective completion, not an additional physical substrate.

On the registered edge-comparability, traffic or synchronization, clock or contraction, curvature-response, adaptation-tracking, convex-cost, and viability-budget branches, the Appendix C estimates exclude sufficiently severe irregularity. Theorem 43.5 separately packages the $M=24$, $D=4$ operational-continuum branch with its noncollapse, curvature-transfer, Mosco, recovery, and rigidity certificates, while Appendix F states the independent algebraic AQFT requirements.


