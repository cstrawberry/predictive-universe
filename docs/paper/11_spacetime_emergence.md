# 11. Emergence of Spacetime Geometry (Operational Continuum Branch)

This section details the emergence of effective spacetime geometry from the underlying discrete MPU network. The continuum layer is not an additional ontology: the real world does not have to become an actual continuum. It only has to generate continuum behavior as a finite-resolution effective closure. Theorem 43 supplies the regularity-necessity theorem, Theorem 43.5 packages the operational-continuum branch on the $M=24$, $D=4$ shell under its stated hypotheses, and Corollary 43.5a supplies the zero-defect $D_4$ gluing certificate $\mathfrak Z_{\mathrm{cont}}$ that discharges the global-core competitor condition on the strict gluing branch. Appendix F supplies the algebraic AQFT bridge under controlled generator-convergence hypotheses, with Definition F.0c and Theorem F.0d giving the Mosco-Bochner certificate route and Definition F.0e with Theorem F.0f giving the projective single-clock route from finite local algebras to the stable local AQFT envelope. The emergence process is presented in stages: obtaining the operational continuum compression of the discrete propagation-cost metric, identifying the metric tensor, and deriving a uniform operational causal-speed upper bound from MPU interactions, while treating frontier attainment separately and importing Lorentzian signature from the Appendix O hyperbolic-principal-symbol branch. Definition 46f and Theorem 46g then package the topological-bandwidth closure of this branch: operational inclusion gives topology and causal order, predictive capacity gives metric scale, and the finite Paley-Wiener sector gives retained field reconstruction below the accepted operational bandwidth. The interpretation of curvature as predictive holonomy is also discussed.

**Definition 46a.1 (Predictive Well-Posedness Signature Certificate $\mathfrak C_{\mathrm{sig}}$).** The finite-frontier and cone constructions determine a causal order only up to the supplied operational certificate. To read a covered second-order sector as genuinely Lorentzian, add the certificate $\mathfrak C_{\mathrm{sig}}(U)$. It records the principal symbol of the retained second-order operator on $U$, one-time Cauchy well-posedness, exclusion of elliptic and ultrahyperbolic alternatives by the PPI/PCE comparison, exclusion of higher-derivative or Ostrogradsky branches from the retained sector, and agreement of the resulting characteristic cone with $\mathfrak C_{\mathrm{cone}}$ up to the stated tolerance. With $\mathfrak C_{\mathrm{sig}}$, the metric signature is a certified branch datum. Without it, finite propagation remains a causal-order result rather than a proof of Lorentzian signature.

**11.1 The MPU Network as Pre-Geometric Structure**

The foundational substrate, according to Hypothesis 1, is a dynamic network $\mathcal{N} = (\mathcal{V}, \mathcal{E}, \{w_{uv}\})$ where vertices $v \in \mathcal{V}$ represent MPUs (Definition 23) and weighted edges $(u,v) \in \mathcal{E}$ represent potential interaction pathways governed by ND-RID. The weights $w_{uv}$ quantify the cost or difficulty of propagating predictive information between MPUs $u$ and $v$. This network is inherently discrete and relational; concepts like continuous distance, dimension, and geometry must emerge from the properties of information propagation within this structure.

**11.2 Metric Distance from ND-RID Propagation Costs**

Definition 27 nominates ND-RID (`Evolve`) as an interaction/update law. On a cycle that separately implements a registered reset, Theorem 31 gives $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)$; a positive floor inferred from this entropy bound requires $H_q(P\mid R)\ge h_{\min}>0$, and Proposition E.2a's completed reset-support deficit belongs to the same reset ledger. On a refresh/minorization branch Lemma E.1 additionally gives strict contraction $f_{RID}<1$. Definition 27 alone implies neither thermodynamic irreversibility, a positive reset cost, nor strict contraction; propagation costs may use these entries only on their accepted branches.

**11.2.1 Definition 35 (Def 35): Propagation Cost Metric $d_{\mathcal{N}}$**

We define a metric distance $d_{\mathcal{N}}(u,v)$ between any two MPUs $u, v \in \mathcal{V}$ based on the minimum cumulative cost of propagating retained predictive information along paths in the network $\mathcal{N}$. The dimensionless cost $w_{xy}$ of traversing edge $(x,y)$ incorporates the completed-update entropy cost
$$
\frac{\langle Q_{\mathrm{bath}}^{(xy)}\rangle}{T_{xy}}\ge k_B H_{q_{xy}}(P\mid R)\quad\text{on a registered reset edge}
$$
and the finite transfer budget of the edge. On the completed reset-support branch, the per-link information budget is bounded by Proposition E.2a. On refresh/minorization branches, the same edge may also carry a strict trace-distance contraction factor $f_{RID}^{(xy)}<1$ from Lemma E.1.

Choose a symmetric edge-cost representative satisfying the uniform bounds
$$
0<w_{\min}\le w_{xy}=w_{yx}\le w_{\max}<\infty
$$
on the connected component under consideration. On a registered reset edge, one possible calibrated representative is
$$
w_{xy}
=
c_S\frac{\Delta S_{\min}^{(xy)}}{k_B}
+
c_C\frac{\ln d_0-C_{xy}}{\ln d_0}
+
c_f[-\ln f_{RID}^{(xy)}]_{\mathrm{ref}},
$$
where $c_S,c_C>0$, $c_f\ge0$, $C_{xy}\le\ln d_0$, and the contraction term is present only on a refresh/minorization branch. The reset theorem supplies the branch-dependent inequality $\Delta S_{\min}^{(xy)}/k_B\ge H_{q_{xy}}(P\mid R)$; it supplies a positive uniform contribution only when a positive entropy floor is separately registered. The displayed representative is admissible only when the resulting weights satisfy the stated uniform bounds. Two cost representatives have the same metric scaling limit only under a separate uniform-equivalence or convergence certificate.

With microscopic length $\delta>0$, define
$$
d_{\mathcal N}(u,v)
=
\inf_{\gamma:u\to v}
\sum_{(x,y)\in\gamma}\delta w_{xy}
\qquad \text{(64)}.
$$
The infimum is over finite paths. Connectedness makes it finite. Symmetry is immediate, concatenation proves the triangle inequality, and every nontrivial path contains at least one edge, so $d_{\mathcal N}(u,v)\ge\delta w_{\min}>0$ when $u\ne v$. Thus $d_{\mathcal N}$ is a metric. If the network is finite, the infimum is attained and may be written as a minimum. For disconnected networks, set the distance to infinity between components and restrict metric statements to one component. Latency, capacity, and dissipation remain separately registered edge coordinates under Definition 35a.



**Definition 35a (Latency--Capacity--Dissipation Edge Ledger).** On a finite retained directed MPU graph, each edge $e$ carries the vector datum
$$
(\ell_e,u_e,\varepsilon_e),
\qquad
\ell_e>0,
\quad
u_e\ge0,
\quad
\varepsilon_e\ge0,
\tag{64a}
$$
where $\ell_e$ is a certified minimum intervention-to-retained-response signaling delay including registered node processing, $u_e$ is a composable reliable-rate upper bound measured in completed retained-update symbols per unit time in one declared alphabet, and $\varepsilon_e$ is a registered dimensionless lower bound on entropy exported per completed retained update on that edge. For the entropy coordinate, the certificate must partition physical reset resources into nonoverlapping edge ledgers, or allocate every shared reset cost to exactly one edge; otherwise only the corresponding non-double-counted aggregate bound is admissible. A realized $f_e$ uses the same alphabet and has units of completed updates per unit time; write $\dot\Sigma_{flow}:=k_B^{-1}dS_{env}/dt$. For distinct vertices $s,t$, define
$$
L_{st}
=\min_{P:s\leadsto t}\sum_{e\in P}\ell_e,
\qquad
U_{st}
=\min_{\mathcal C:s|t}\sum_{e\in\partial^+\mathcal C}u_e.
\tag{64b}
$$
Set $L_{st}=+\infty$ when $t$ is unreachable from $s$. With $\mathcal P_{st}(L)$ the directed $s$--$t$ paths whose summed delay is at most $L$, the delay-constrained routing bound is
$$
\mathcal U_{st}(L)
=
\max_{x_P\ge0}
\left\{
\sum_{P\in\mathcal P_{st}(L)}x_P:
\sum_{P\ni e}x_P\le u_e\ \text{for every }e
\right\}.
\tag{64c}
$$

**Theorem 35b (Latency--Capacity Non-Equivalence and Pareto Unification).** On a finite causal edge ledger:

1. no intervention at $s$ affects a retained observable at $t$ before $L_{st}$;
2. every reliable asymptotic rate obeys the cut-set bound $R_{s\to t}\le U_{st}$; equality to maximum flow holds only on the registered independent classical memoryless routing branch when each $u_e$ is an achievable edge capacity and flow conservation and pipelining are available;
3. neither $L_{st}$ nor $U_{st}$ determines the other. There are finite ledgers in which changing $u_e$ while holding $\ell_e$ fixed changes throughput without changing the causal frontier, and finite ledgers in which changing $\ell_e$ while holding $u_e$ fixed changes the frontier without changing the cut capacity;
4. $\mathcal U_{st}(L)$ is nondecreasing,
$$
\inf\{L:\mathcal U_{st}(L)>0\}=L_{st}
\tag{64d}
$$
when every edge on a minimum-latency path has positive capacity, and
$$
\lim_{L\to\infty}\mathcal U_{st}(L)=U_{st}
\tag{64e}
$$
on the max-flow/min-cut routing branch;
5. for any realized edge flow $f_e\ge0$ on the certified non-double-counting entropy ledger, the entropy export rate satisfies
$$
\dot\Sigma_{flow}\ge\sum_e\varepsilon_e f_e.
\tag{64f}
$$

*Proof.* Causal composition along the event DAG requires the sum of edge latencies on every used path, proving item 1. Data processing across any directed cut bounds the end-to-end rate by the sum of registered edge bounds, proving item 2; classical max-flow/min-cut supplies equality only on its stated routing branch. One-edge examples with the same latency and different capacities, or the same capacity and different latencies, prove item 3. The feasible path set grows with $L$, proving monotonicity. Its first nonzero value occurs at a positive-capacity minimum-latency path, and removal of the delay constraint yields the ordinary maximum-flow problem, proving item 4. On the registered partition, each physical reset contribution appears once, so summing the edgewise per-update floors against the realized rates proves item 5. ∎

**Corollary 35b.1 (Causal-Speed and Area-Capacity Scope).** The emergent causal speed is calibrated from the latency/length branch, whereas the horizon entropy density and $G$ are calibrated from the cut-capacity/area branch. They are projections of one edge ledger but no theorem identifies either from the other without an additional response-active constitutive relation.

*Proof.* Theorem 35b(1) composes path latency from the edge values $\ell_e$, while Theorem 35b(2) composes cut capacity from the edge values $u_e$. Item 3 of that theorem supplies one-edge ledgers having equal latency and unequal capacity and ledgers having equal capacity and unequal latency. Hence neither functional determines the other. The causal-speed calibration uses path length divided by path latency, whereas the horizon entropy and $G$ calibration uses capacity per cut area. An implication between those calibrations would therefore require an additional relation between $\ell_e$ and $u_e$, which is not present in Theorem 35b. ∎

**Proposition 35b.2 (Propagation-Metric Representative Stability and Fixed-Scale Counterexample).** Let $d_n$ and $d'_n$ be the path metrics on the same connected weighted graph, with the same microscopic factor $\delta_n$, induced by positive edge weights $w_{n,e}$ and $w'_{n,e}$. If $0\le\epsilon_n<1$ and
$$
(1-\epsilon_n)w_{n,e}\le w'_{n,e}\le(1+\epsilon_n)w_{n,e}
\qquad\text{for every }e,
\tag{64g}
$$
then
$$
(1-\epsilon_n)d_n\le d'_n\le(1+\epsilon_n)d_n.
\tag{64h}
$$
When $\epsilon_n\to0$ and the rescaled diameters are uniformly bounded on each tested ball, the identity correspondences have vanishing distortion, so the two sequences have the same metric subsequential limits on those balls.

A fixed bi-Lipschitz constant does not suffice. On the path with vertices $0,\ldots,n$, take $\delta_n=1/n$, $w_{n,e}=1$, and $w'_{n,e}=2$. The two metrics are uniformly $2$-bi-Lipschitz, but their endpoint distances are respectively $1$ and $2$ and their limits are $([0,1],|\cdot|)$ and $([0,1],2|\cdot|)$. Thus uniform bi-Lipschitz equivalence alone does not prove representative-independent metric limits. Equality of retained response limits additionally requires the response intertwiners and form convergence declared by the continuum certificate.

*Proof.* Every path length satisfies the two inequalities in (64g); taking the infimum over paths gives (64h). Under the stated boundedness, the identity distortion is at most $\epsilon_n$ times the tested diameter and tends to zero. The path example has $d'_n=2d_n$ exactly, proving the negative statement. ∎

**Proposition 35b.3 ($\Gamma$-Stability and Retained-Response Intertwining).** Let $\mathcal F_n,\mathcal F'_n:X_n\to[0,\infty]$ be nonnegative propagation forms on one declared varying-space topology. Suppose $\mathcal F_n$ $\Gamma$-converges to $\mathcal F$, is equicoercive, and, for some $\epsilon_n\to0$ with $0\le\epsilon_n<1$,
$$
(1-\epsilon_n)\mathcal F_n
\le
\mathcal F'_n
\le
(1+\epsilon_n)\mathcal F_n.
\tag{64i}
$$
Then $\mathcal F'_n$ $\Gamma$-converges to the same $\mathcal F$ and is equicoercive. If $R_n,R'_n:X_n\to Y$ are retained-response maps into a metric space and, on every common energy sublevel,
$$
\sup_{\mathcal F_n(x)\le C}d_Y(R_nx,R'_nx)\longrightarrow0,
\tag{64j}
$$
then every bounded-energy sequence has the same response limit through $R_n$ and $R'_n$ whenever either limit exists.

*Proof.* If $x_n\to x$, (64i) gives
$$
\liminf_n\mathcal F'_n(x_n)
\ge
\liminf_n(1-\epsilon_n)\mathcal F_n(x_n)
\ge
\mathcal F(x).
$$
For a recovery sequence $x_n\to x$ of $\mathcal F_n$, its energies are bounded whenever $\mathcal F(x)<\infty$, and the upper inequality in (64i) gives $\limsup_n\mathcal F'_n(x_n)\le\mathcal F(x)$. The infinite-value case is automatic. For large $n$, a bounded $\mathcal F'_n$ sublevel lies in a bounded $\mathcal F_n$ sublevel by the lower inequality, so equicoercivity transfers. Finally, (64j) and the triangle inequality show that the two response sequences have vanishing mutual distance on every bounded-energy sequence. ∎

**Resolution TV-CONT-01-R2.** Equation (64i) gives `positive-discharge` of form/$\Gamma$ representative invariance on the vanishing relative-form class, and (64j) is the exact retained-response intertwiner gate on that class. Proposition 35b.2 continues to refute replacement of the vanishing distortion by a fixed bi-Lipschitz constant.

For finite diagnostic comparisons on a fixed connected MPU population graph with $2\le |\mathcal V|<\infty$, the corresponding dimensionless propagation-efficiency observable is
$$
E_{\mathcal N}
=
\frac{1}{|\mathcal V|(|\mathcal V|-1)}
\sum_{\substack{u,v\in\mathcal V\\u\ne v}}
\frac{\delta}{d_{\mathcal N}(u,v)}.
$$
For disconnected finite graphs, the summand is taken as $0$ whenever $d_{\mathcal N}(u,v)=\infty$. This is the average reciprocal propagation-cost distance induced by (64); it is not the harmonic mean itself. It is admissible only after the edge-cost representative, microscopic scale $\delta$, and branch status of the finite graph have been fixed.

**11.3 Geometric Regularity: A Necessary Condition for Viability**

For the discrete metric space $(\mathcal{V}, d_{\mathcal{N}})$ to admit a stable finite-resolution continuum compression, the network structure must possess large-scale geometric regularity.

**11.3.1 Definition 36 (Def 36): Uniform Mesoscopic $D$-Dimensional Polynomial Volume Growth**

A sequence of MPU networks $\{\mathcal N_n\}$ exhibits uniform mesoscopic $D$-dimensional polynomial volume growth if there exist constants $K_1,K_2>0$, an exponent $D\ge1$, an $n$-independent macroscopic lower scale $R_0>0$, microscopic scales $\delta_{eff,n}>0$, and upper cutoffs $R_{max,n}\le\operatorname{diam}(\mathcal N_n)$ such that $R_0<R_{max,n}$ eventually and
$$
\frac{R_{max,n}-R_0}{\delta_{eff,n}}\longrightarrow\infty.
$$
For all sufficiently large $n$, every admissible center $v$ away from any declared boundary layer, and every radius $R$ with $R_0<R\le R_{max,n}$,
$$
K_1\left(\frac{R}{\delta_{eff,n}}\right)^D
\le |B_R(v)|
\le K_2\left(\frac{R}{\delta_{eff,n}}\right)^D
\quad \text{(65)}.
$$
Here $B_R(v)$ is the propagation-metric ball and $\delta_{eff,n}$ is a declared characteristic microscopic cost length. For an infinite network the upper scale may be infinite. This condition defines a uniform effective dimension only on the registered scale windows.

**11.3.2 Definition 37 (Def 37): Uniform Synthetic-Ricci/Bochner Transfer Package**

A network $\mathcal{N}$ has uniformly bounded synthetic Ricci curvature if it belongs to a class for which there exists a constant $K$ and a discrete curvature-dimension / Bochner control, or an equivalent radius-2 curvature-transfer theorem, yielding $\text{Ric}_N \ge -K$ uniformly and, together with Definition 36, uniform volume-doubling and a (1,2) Poincaré-type inequality for the associated counting measure on $(\mathcal{V}, d_{\mathcal{N}})$. This controls local divergence/convergence of geodesics in the sense required for the measured compactness and rectifiability statements used in Theorem 44. A stand-alone one-step Ollivier-Ricci lower bound counts here only when accompanied by such a transfer mechanism.

**Theorem 43 (Geometric Regularity under a Verified Strict Comparator)**

Let $V=V_{\mathrm{core}}+V_{\mathrm{proxy}}$. Assume a registered regular-comparator certificate
$$
\mathfrak C_{\mathrm{reg}}=(\mathcal R,\delta,\mathcal V)
$$
for the declared admissible class. Its verifier $\mathcal V$ must terminate on every encoded irregular configuration $x$ and certify, by exact or outward-rounded evaluation,
$$
\mathcal R(x)\text{ is admissible and geometrically regular},
\qquad
V_{\mathrm{proxy}}(\mathcal R(x))=V_{\mathrm{proxy}}(x),
$$
$$
\delta(x)>0,
\qquad
V_{\mathrm{core}}(\mathcal R(x))
\le V_{\mathrm{core}}(x)-\delta(x).
\tag{11.43.1}
$$
For an infinite encoded class, acceptance additionally requires a machine-checked termination and coverage proof for $\mathcal V$. Then every global minimizer of $V$ is geometrically regular. If assumptions (A1)--(A6) and the reversible low-noise subbranch of Theorem D.5 also hold, the invariant measures concentrate near this regular global-minimum sector.

*Proof.* If a global minimizer $x^*$ were irregular, (11.43.1) would give
$$
V(\mathcal R(x^*))-V(x^*)
=V_{\mathrm{core}}(\mathcal R(x^*))-V_{\mathrm{core}}(x^*)
\le-\delta(x^*)<0,
$$
contradicting minimality. The last statement is exactly the additional concentration conclusion of Theorem D.5. Lemma D.3 supplies a finite implementation of the comparison verifier on registered families; the bare PCE grammar does not supply $\mathfrak C_{\mathrm{reg}}$. ∎

**Proposition 43a (Bare-PCE Nonentailment of Regular Global Minima).** There is a nonempty finite admissible class satisfying the bare decomposition $V=V_{\mathrm{core}}+V_{\mathrm{proxy}}$ whose global-minimum set contains an irregular configuration and admits no strict regular comparator of the form (11.43.1).

*Proof.* Take the admissible class $X=\{r,i\}$, declare $r$ regular and $i$ irregular, and set
$$
V_{\mathrm{core}}(r)=V_{\mathrm{core}}(i)=0,
\qquad
V_{\mathrm{proxy}}(r)=V_{\mathrm{proxy}}(i)=0.
$$
Both configurations are global minimizers. The only regular image available to a comparator at $i$ is $r$, but $V_{\mathrm{core}}(r)=V_{\mathrm{core}}(i)$, so no $\delta(i)>0$ can satisfy (11.43.1). The class is nonempty and consistent, and therefore negatively refutes regular-minimum selection from the bare PCE decomposition alone. Theorem 43 remains valid because its strict-comparator certificate excludes this countermodel. ∎

**Theorem 43.5 (Operational Continuum Branch Package).** On the minimal $M=24$, $D=4$ mode-channel branch, let the microscopic adaptation dynamics use the continuum-control PCE potential $V_n^{\mathrm{cont}}$ of Theorem D.6e. Assume an independent continuum-bridge certificate supplies a competitor sequence with $\mathfrak d_n^*\to0$ in the global core-minimum class. Separately assume the D.6e weak-liminf, strong-recovery, and Cheeger-identification hypotheses; the C.6c generator-core/$\Gamma_2$, domain-closure, ambient, and Sobolev-to-Lipschitz hypotheses; fixed-radius geometric noncollapse and interpolation; and $\mu=\mathcal H^4$ whenever strict noncollapse is claimed. Then the low-noise detailed-balance adaptation dynamics concentrate on the asymptotically defect-free operational-continuum branch, and every selected subsequential limit with $\mathfrak D_n\to0$ satisfies:

1. the rescaled MPU network spaces are precompact in pointed measured Gromov-Hausdorff topology;
2. the limit is noncollapsed $\mathrm{RCD}^*(K,4)$;
3. the rescaled propagation-cost Dirichlet forms Mosco-converge to the quadratic Cheeger energy;
4. tangent cones are Euclidean $\mathbb R^4$ at $\mu$-almost every point;
5. on the $\mathfrak H_n\to0$ rigidity subbranch, the regular set carries a $C^{1,\alpha}$ four-dimensional Riemannian metric. A $3+1$ Lorentzian interpretation additionally requires an Appendix O certificate that selects one of these four operational directions as temporal and identifies a three-dimensional positive spatial complement. Adjoining an independent clock direction would produce a $4+1$ extension and is not part of this conclusion.

Moreover, for every $\varepsilon>0$ and each fixed finite-resolution level $n$, the stationary probability of configurations whose total continuum defect exceeds the selected minimum by more than $\varepsilon$ satisfies
$$
\pi_{\theta,n}\!\left(\mathfrak D_n>\frac{\lambda_{\max}}{\lambda_{\min}}\mathfrak d_n^*+\varepsilon\right)
\le
C_{n,\varepsilon}e^{-c_{n,\varepsilon}/\theta}
$$
in the detailed-balance low-noise regime of Theorem D.5, where $\mathfrak d_n^*$ is the core-minimum defect infimum from Theorem D.6e. This is an operational finite-resolution continuum compression theorem: by Theorem K.10.3a it does not assert that the physical substrate is an exact real-number continuum.

*Proof.* The minimal mode-channel branch has $M=24$ and $D=4$ by Theorem Z.11. Lemma C.6d identifies the $24$ first-shell directions with the $D_4$ root shell
$$
\Xi_{D_4}=\{\pm e_i\pm e_j:1\le i<j\le4\},
$$
so the first-shell odd moments vanish, the second moment is positive and isotropic, and rank collapse is excluded. Theorem C.6e supplies shell isotropy and excludes rank collapse of the fixed-trace shell tensor. Fixed-radius geometric noncollapse and interpolation are independent entries of the continuum-bridge certificate.

Theorem D.6e inserts the finite continuum-control defects $\mathfrak B_n,\mathfrak C_n,\mathfrak R_n,\mathfrak H_n$ into the microscopic PCE potential with positive coefficients. Since a competitor sequence with $\mathfrak d_n^*\to 0$ exists in the same global core-minimum class, and since Proposition D.6f shows that this is the sharp condition for defect removal within that class, global minimizers of $V_n^{\mathrm{cont}}$ satisfy $\mathfrak D_n\to0$ along the selected sequence. The detailed-balance low-noise concentration estimate follows from Theorem D.5 applied to $V_n^{\mathrm{cont}}$, giving the displayed exponential bound.

Along the selected sequence, $\mathfrak B_n\to0$ is the asymptotic radius-2 $\mathrm{BE}(K,4)$ curvature transfer required by Theorem C.6c, while geometric noncollapse is an independent volume-certificate input. Under the separately assumed C.6c generator-core/$\Gamma_2$ passage and $\mu=\mathcal H^4$ normalization, C.6c gives strict noncollapse; under the separately assumed D.6e liminf, recovery, and Cheeger-identification hypotheses, D.6e gives Mosco convergence. Vanishing defects alone give neither conclusion. Therefore every measured-GH limit is noncollapsed $\mathrm{RCD}^*(K,4)$ and has Euclidean $\mathbb R^4$ tangent cones at $\mu$-almost every point. The identities $\mathfrak C_n\to0$ and $\mathfrak R_n\to0$ give the finite-core and recovery-map compatibility required for the Mosco argument in Theorem D.6e; hence the rescaled propagation-cost forms converge to the quadratic Cheeger energy. Finally, $\mathfrak H_n\to0$ is the quantitative Euclidean-rigidity and harmonic-coordinate input of Theorem 44a, so the regular branch carries a $C^{1,\alpha}$ four-dimensional Riemannian metric. A $3+1$ Lorentzian metric follows only on an Appendix O branch that selects one operational tangent direction as temporal and proves that its positive complement has dimension three. Theorem K.10.3a excludes exact continuum ontology under finite-resource PPI, so the limit is an effective finite-resolution compression of the discrete MPU branch. ∎

**Corollary 43.5a (Quantitative $D_4$ Stability and Gluing Certificate).** Let $\delta_n\downarrow0$ and let the candidate core at level $n$ be a finite truncation of $\delta_nD_4$ with boundary exhaustion. On interior vertices define
$$
\mu_n
=
2\delta_n^4\sum_{x\in\delta_nD_4}\delta_x
$$
and
$$
\mathcal E_n(f)
=
\frac{\delta_n^2}{12}
\sum_x\sum_{r\in\Xi_{D_4}}
|f(x+\delta_nr)-f(x)|^2.
\tag{43.5a.1}
$$
A quantitative $D_4$ stability record $\mathfrak Z_{\mathrm{cont}}$ contains:

1. the exact shell identity
   $$
   \sum_{r\in\Xi_{D_4}}rr^{\mathsf T}=12I_4
   $$
   and covolume $\operatorname{covol}(D_4)=2$;
2. uniform local Ahlfors-$4$ bounds, a fixed-radius noncollapse bound, and boundary-exhaustion control;
3. finite interpolation charts and overlap maps whose metric, cocycle, and recovery defects tend to zero;
4. pointed measured-Gromov–Hausdorff distance $o(1)$ from the corresponding Euclidean candidate charts;
5. Mosco liminf and recovery estimates for $\mathcal E_n$, together with a common generator core on which the discrete generators converge to the flat Laplacian;
6. membership of the candidate in the same global core-minimum class as the PCE-selected branch and
   $$
   \mathfrak B_n+\mathfrak C_n+\mathfrak R_n+\mathfrak H_n\le\varepsilon_n,
   \qquad
   \varepsilon_n\downarrow0.
   $$

Then the competitor hypothesis $\mathfrak d_n^*\to0$ in Theorem 43.5 is discharged, and the candidate forms converge to the flat quadratic Cheeger energy on a noncollapsed four-dimensional limit. Consequently the operational-continuum row is closed on $\mathfrak Z_{\mathrm{cont}}$.

*Proof.* The covolume normalization makes $\mu_n$ converge locally to Lebesgue measure. Taylor expansion on the common core and the second-moment identity give
$$
\mathcal E_n(f)\longrightarrow\frac12\int_{\mathbb R^4}|\nabla f|^2\,dx.
$$
Items 2–5 supply tightness, noncollapse, the Mosco liminf, recovery, and generator identification, so the limit is the flat noncollapsed $\operatorname{RCD}(0,4)$ model on each candidate chart. Item 3 glues the charts in the response quotient. Finally,
$$
0\le\mathfrak d_n^*
\le
\mathfrak B_n+\mathfrak C_n+\mathfrak R_n+\mathfrak H_n
\le\varepsilon_n\to0.
$$
Theorem 43.5 therefore applies with its previously independent competitor and convergence entries explicitly supplied by the finite stability record. ∎

**Proposition 43.5b (Componentwise Certificates Do Not Assemble a Common Sequence).** Separate existential certificates for continuum defects do not imply a joint operational-continuum certificate. At each refinement level let the admissible set be $X_n=\{a_n,b_n\}$ and define two nonnegative defects by
$$
(d_n^{(1)}(a_n),d_n^{(2)}(a_n))=(0,1),
\qquad
(d_n^{(1)}(b_n),d_n^{(2)}(b_n))=(1,0).
\tag{43.5b.1}
$$
The sequence $(a_n)$ makes the first defect vanish, and $(b_n)$ makes the second defect vanish, but every common choice $x_n\in X_n$ obeys
$$
d_n^{(1)}(x_n)+d_n^{(2)}(x_n)=1.
$$
Hence no common selected sequence makes both defects vanish. This finite abstract record is a countermodel to every assembly rule whose premises retain only the separate existential-vanishing statements for two slots. A valid joint continuum certificate must therefore place noncollapse, curvature transfer, Mosco convergence, recovery, and rigidity on one frozen refinement sequence; coexistence of those physical entries remains the constructive target.

*Proof.* The displayed values verify each separate witness directly. Their sum is identically one for both admissible choices at every level, which excludes joint convergence to zero. ∎

**Theorem 43.5c (Finite Convex Joint-Certificate Criterion).** At refinement level $n$, let $X_n\subseteq\mathbb R^d$ be a common finite-dimensional parameter envelope and let
$$
K_{n,j}\subseteq X_n,
\qquad j=1,\ldots,m_n,
\tag{43.5c.1}
$$
be the convex feasible set for the $j$th certificate slot at its registered tolerance. There is one parameter $x_n$ satisfying every slot exactly when every subfamily of at most $d+1$ sets in (43.5c.1) has nonempty intersection. Consequently, if the sets are sublevel sets
$$
K_{n,j}=\{x\in X_n:d_{n,j}(x)\le\varepsilon_n\},
\qquad \varepsilon_n\downarrow0,
\tag{43.5c.2}
$$
then the subfamily test at every $n$ constructs a common sequence satisfying
$$
\max_{1\le j\le m_n}d_{n,j}(x_n)\le\varepsilon_n\longrightarrow0.
\tag{43.5c.3}
$$
This criterion is complete for a supplied finite convex certificate envelope. Nonconvex slots, changing semantic identifications, and the population of the continuum records remain outside that envelope.

*Proof.* Necessity is immediate. For sufficiency, suppose a finite family of convex sets has empty total intersection and choose an inclusion-minimal empty subfamily $K_1,\ldots,K_m$. For every $i$, minimality supplies
$$
x_i\in\bigcap_{j\ne i}K_j.
$$
If $m>d+1$, the $m$ points are affinely dependent, so there are real coefficients $\alpha_i$, not all zero, with $\sum_i\alpha_i=0$ and $\sum_i\alpha_ix_i=0$. The coefficients have both signs. After normalizing their positive and negative parts, one point $y$ is expressed both as a convex combination of the $x_i$ with $\alpha_i>0$ and as a convex combination of those with $\alpha_i<0$. For each $K_j$, one of these two representations omits $x_j$, while every other $x_i$ lies in $K_j$; convexity therefore gives $y\in K_j$. This contradicts empty total intersection. Hence every minimal empty subfamily has at most $d+1$ members, proving the criterion by contraposition. Applying it to (43.5c.2) at each level and choosing $x_n$ in the total intersection gives (43.5c.3). ∎

**11.4 Geometric Convergence to an Operational Continuum Manifold**

Assuming Theorem 43, the operational-continuum branch is packaged in Theorem 43.5. Appendix C supplies first-shell $D_4$ isotropy; the independent continuum certificate supplies geometric noncollapse; Appendix D supplies the finite-defect microscopic selection mechanism and the Mosco–Cheeger closure; and Theorem 44a supplies the regular-branch manifold upgrade when the rigidity defect vanishes along the selected sequence. The resulting continuum description is an effective finite-resolution compression of the MPU network.

**11.4.1 Theorem 44 (Gromov-Hausdorff Limit)**

On the operational-continuum branch of Theorem 43.5, use the common macroscopic metric normalization supplied by its continuum certificate. The propagation-cost metric already includes the microscopic length in Definition 35. Consider the pointed network spaces
$$
\{(X_n,o_n)\}=\{(\mathcal V_n,d_{\mathcal N_n},o_n)\},
\qquad
\delta_{eff,n}\to0,
$$
equipped with the certificate's scaled counting measures $\mu_n$ and length-space interpolations whose pointed measured-Gromov--Hausdorff discrepancy from the vertex models tends to zero on bounded sets. Retain the declared measure calibration $\mu_\infty=\mathcal H^4$ on the strict-noncollapse branch; an auxiliary unit-ball normalization used for compactness must be converted back before that identification is asserted. Then the family is precompact in pointed measured Gromov--Hausdorff topology. Consequently, a subsequence converges in the measured sense to a limit pointed metric-measure space
$$
(M,d_\infty,\mu_\infty,o_\infty).
$$
Moreover, $(M,d_\infty,\mu_\infty)$ is a doubling PI space, the limit Cheeger energy is quadratic, and hence the limit is infinitesimally Hilbertian. Under the tangent-cone regularity hypotheses carried from Theorem 43.5 and discharged on the Theorem 44a subbranch, there exists a Borel regular set $M_{reg}\subseteq M$ with $\mu_\infty(M\setminus M_{reg})=0$ such that for every $p\in M_{reg}$ the tangent cones are Euclidean $\mathbb{R}^D$; on the PU branch selected by Theorem Z.11, this means $\mathbb{R}^4$. The Euclidean tangent is unique $\mu_\infty$-a.e.

*Proof:* Theorem 43.5 supplies the selected sequence with $\mathfrak D_n\to 0$ from microscopic adaptation dynamics. Theorem C.6e supplies first-shell tensor isotropy only. Fixed-radius geometric noncollapse, D.6e liminf/recovery/Cheeger identification, and the C.6c generator-core/$\Gamma_2$ passage are separate hypotheses; defect convergence records a selected branch but proves none of them. Theorem D.6e gives the finite-core, recovery, and Mosco–Cheeger closure once the corresponding defects vanish. Theorem C.6c gives the stable noncollapsed $\mathrm{RCD}^*(K,4)$ limit because $\mathfrak B_n\to 0$ supplies the required uniform curvature-transfer input. Theorem 44a gives the regular-branch Euclidean-rigidity conclusion when $\mathfrak H_n\to0$. Therefore the family is precompact, the limit Cheeger energy is quadratic, the limit is infinitesimally Hilbertian, and the full-measure regular set has Euclidean $\mathbb R^4$ tangents on the PU branch selected by Theorem Z.11, with the stronger $C^{1,\alpha}$ regularity available on the Theorem 44a subbranch. ∎

**11.5 Emergence of the Metric Tensor (Conditional on Thm 43, Thm 44)**

On the selected continuum branch, the quadratic limit energy together with Euclidean tangent cones on the regular set allows definition of an a.e. Riemannian metric tensor compatible with the limit distance.

**11.5.1 Theorem 45 (Riemannian Metric Tensor $g_{\mu\nu}$)**

Conditional on Theorem 44, the limit space admits an almost-everywhere defined symmetric positive-definite rank-2 tensor $g_{\mu\nu}(x)$ on $M_{reg}$, with $\mu_\infty(M\setminus M_{reg})=0$, such that
$$
ds^2=g_{\mu\nu}(x)dx^\mu dx^\nu \quad \text{(66)}.
$$
This is the measurable Riemannian tensor associated with the quadratic Cheeger energy. On the separate Euclidean-rigidity subbranch invoked by Theorem 44a, it has the stated $C^{1,\alpha}$ regularity in the corresponding charts. A pseudo-Riemannian or Lorentzian signature is not supplied by the Cheeger construction and requires the additional Appendix O time-orientation, principal-symbol, and cone certificate.

*Proof.* Quadraticity of the Cheeger energy makes the first-order differential module infinitesimally Hilbertian and therefore supplies a positive pointwise inner product almost everywhere. On $M_{reg}$, the Euclidean tangent cones provide the local model. In the measurable charts of the regular branch, define
$$
g_{\mu\nu}(x):=\langle\partial_\mu,\partial_\nu\rangle_x.
$$
The Euclidean tangent inner product gives symmetry and positive definiteness, and its associated quadratic form is the infinitesimal quadratic approximation of $d_\infty$, proving (66). The $C^{1,\alpha}$ conclusion follows only on the rigidity subbranch that assumes the corresponding harmonic-coordinate theorem. ∎

**Corollary 45b (Fisher-Propagation Compatibility).**
Let $U\Subset M_{reg}$ be a regular chart domain. Suppose the finite protocol family used to define the local propagation-cost distance on $U$ has a smooth identifiable response map
$$
\theta:U\to\Theta
$$
into the MPU response-state chart of Corollary 23c.1. Define the pullback predictive Fisher tensor
$$
h_x(v,w)
=
\frac14F^Q_{\theta(x)}(d\theta_xv,d\theta_xw),
\qquad
v,w\in T_xU.
\tag{45b.1}
$$
Then $h$ is a positive semidefinite quadratic tensor on $U$ and becomes positive definite after quotienting response-null tangent directions. Let $g^E$ denote the positive rank-four operational-distance tensor supplied by the Cheeger/Mosco branch of Theorem 45 on that quotient. On a Lorentzian-promotion branch carrying a local time function $t$ with $dt_x\ne0$, define
$$
S_x:=\ker dt_x\subset T_xM_{\mathrm{reg}},
\qquad
h_x^{sp}:=h_x|_{S_x\times S_x},
\qquad
g_x^{sp}:=g_x^E|_{S_x\times S_x}.
$$
Rank-nullity gives $\dim S_x=3$, and both restricted forms are positive definite after the response-null quotient. If the same retained finite-response protocol family supplies both:

1. the restriction to $S_x$ of the statistical-distinguishability variation in Corollary 23c.1, and
2. the restriction to $S_x$ of the rescaled propagation-cost variation whose Mosco--Cheeger limit defines $g^{sp}$,

then
$$
h_{\mu\nu}^{sp}=g_{\mu\nu}^{sp}
\tag{45b.2}
$$
on the spatial positive operational-distance sector. This equality is a certificate statement about the same retained protocol family supplying both restricted quadratic forms. Absent that identification, capacity saturation, PCE minimality, or a change of cost units does not force the comparison endomorphism below to be the identity. More generally, whenever $h^{sp}$ and $g^{sp}$ are positive definite on $S_x$ after the quotient, there is a unique positive $g^{sp}$-self-adjoint bundle endomorphism $B:S_x\to S_x$ such that
$$
h^{sp}(v,w)=g^{sp}(Bv,w).
\tag{45b.3}
$$
The Lorentzian metric of Section 11.6 is obtained only after selecting one direction already present in the rank-four carrier as temporal and supplying the cone-orientation structure; no fifth direction is appended. The Fisher tensor $h^{sp}$ is the positive distinguishability tensor on the operational spatial/response quotient.

*Proof.* The pullback of a positive semidefinite bilinear form is positive semidefinite, so (45b.1) follows from Corollary 23c.1. Its kernel consists of tangent vectors whose image under $d\theta$ is response-null; the PPI quotient removes exactly those vectors. Since $dt_x\ne0$ on a rank-four tangent space, rank-nullity gives $\dim S_x=3$. Restricting the positive-definite quotient forms $h$ and $g^E$ to $S_x$ gives the positive-definite forms $h^{sp}$ and $g^{sp}$. If the retained protocol certificate identifies their quadratic variations, they agree on every spatial tangent vector. Polarization proves (45b.2). Otherwise the finite-dimensional Riesz representation theorem gives a unique $B:S_x\to S_x$ satisfying (45b.3); symmetry of $h^{sp}$ makes $B$ self-adjoint with respect to $g^{sp}$, and positivity makes $B$ positive. ∎

**Definition 45c (Geometric-Naturality Certificate $\mathfrak C_{\mathrm{geo}}$).** A geometric-naturality certificate for a regular chart domain $U\Subset M_{reg}$ is a finite record
$$
\mathfrak C_{\mathrm{geo}}
=
(\mathsf{PU}_{\mathrm{fin}}|_U,\;\theta,\;\mathcal E_{\mathrm{Mosco}},\;\mathcal Q_{\mathrm{Fisher}},\;\Pi_{\mathrm{PPI}},\;t,\;\lambda_{\mathrm{QFI}},\;\text{naturality squares},\;\text{forward lock})
$$
where the finite Markov/CPTP morphisms used to define the response-state Fisher tensor and the Mosco--Cheeger propagation tensor are the same admissible quotient functor after the PPI projection $\Pi_{\mathrm{PPI}}$. The record must identify the response-null quotient, a nonvanishing $dt$, the spatial kernel $S=\ker dt$, the restrictions $\mathcal E_{\mathrm{Mosco}}|_S$ and $\mathcal Q_{\mathrm{Fisher}}|_S$, and the fixed QFI scale $\lambda_{\mathrm{QFI}}$ before comparison.

**Proposition 45d (Metric Calibration Removes $B$ on the Covered Branch).** Suppose an accepted $\mathfrak C_{\mathrm{geo}}$ explicitly certifies
$$
\mathcal Q_{\mathrm{Fisher}}|_S
=
\lambda_{\mathrm{QFI}}\mathcal E_{\mathrm{Mosco}}|_S
$$
on the spatial positive operational-distance quotient. Then
$$
h^{sp}=\lambda_{\mathrm{QFI}}g^{sp}.
$$
If the branch calibration sets $\lambda_{\mathrm{QFI}}=1$, the comparison endomorphism of Corollary 45b is $B=\mathbb 1_S$. Without the explicit proportionality entry, $B$ remains a response-active comparison datum: CPTP monotonicity and naturality alone do not select a unique quantum monotone metric.

*Proof.* The certificate states
$$
h^{sp}(v,v)=\lambda_{\mathrm{QFI}}g^{sp}(v,v)
$$
for every quotient vector $v\in S$. Polarization gives equality of the associated symmetric bilinear forms. Equation (45b.3) and nondegeneracy of $g^{sp}$ give $B=\lambda_{\mathrm{QFI}}\mathbb 1_S$, and unit calibration gives $B=\mathbb 1_S$. ∎

**Proposition 45e (Commutant Criterion for Fisher-Propagation Scalarization).** At a point of the spatial response quotient $(S,g^{sp})$, let $\mathcal G$ be the group generated by the accepted finite-response intertwiners, acting by $g^{sp}$-orthogonal maps. Naturality of (45b.3) is the condition
$$
BU=UB\qquad(U\in\mathcal G).
\tag{45e.1}
$$
Every positive $g^{sp}$-self-adjoint natural comparison is of the form $B=\lambda\mathbb 1_S$ if and only if
$$
\{A=A^{*_{g}}:AU=UA\text{ for every }U\in\mathcal G\}
=\mathbb R\mathbb 1_S.
\tag{45e.2}
$$
The full orthogonal group satisfies (45e.2). If (45e.2) fails, naturality permits an anisotropic positive comparison. This criterion fixes the shape of $B$ but leaves the positive scale $\lambda$ to the independent unit bridge in $\mathfrak C_{\mathrm{geo}}$.

*Proof.* If (45e.2) holds, a positive self-adjoint $B$ satisfying (45e.1) belongs to the displayed commutant and is scalar. Conversely, if (45e.2) fails, choose a non-scalar self-adjoint $A$ in the commutant. For sufficiently small nonzero $\epsilon$, the operator
$$
B=\mathbb 1_S+\epsilon A
$$
is positive, self-adjoint, commutes with every $U\in\mathcal G$, and is not scalar. For the full orthogonal group, commuting with every reflection forces every unit vector to be an eigenvector with one common eigenvalue, proving (45e.2). ∎

## 11.5.2 Continuum Relabeling Symmetry and Diffeomorphism Invariance

The emergent manifold branch of Theorems 44–45 admits coordinate charts without making a chart label an observable. Discrete vertex-relabeling invariance motivates coordinate redundancy.

Continuum diffeomorphism covariance is obtained on the closure branch of §11.5.3: the effective theory must admit a local finite-order action, its fields must transform as geometric objects, and Hypothesis 11.5.3.3 must identify continuum bookkeeping relabelings with orientation-preserving diffeomorphisms. Under those three hypotheses, Theorem 45a gives the scalar-density action and diffeomorphism invariance.

The Einstein–Hilbert specialization requires further inputs. Appendix X supplies a local covariant action branch, while Section 12 adds four-dimensional Lorentzian geometry, a metric-only second-order field equation, and the Wald entropy-density and source certificates used by the Lovelock–Wald closure. Those hypotheses, rather than discrete relabeling alone, select the leading Einstein branch.

**11.5.3 Relabeling–Covariance Closure**

Let $M_{\mathrm{reg}}$ be the regular set of Theorem 45 with emergent metric $g_{\mu\nu}$, and let $\Psi$ denote the full collection of continuum fields obtained as $\Gamma$-limits of the coarse-grained PU dynamics.

**Hypothesis 11.5.3.1** (Local finite-order continuum description). For every precompact chart domain $U\Subset M_{\mathrm{reg}}$ and every chart $(\phi,U)$, the effective action has the local form
$$
S_U[\Psi] \;=\; \int_{\phi(U)} L\bigl(x,j^k\Psi(x)\bigr)\,d^4 x,\tag{67a}
$$
for some finite jet order $k$, where $j^k\Psi$ denotes the $k$-jet of $\Psi$. This is the Wilsonian truncation of Appendix X, also used in §11.3 and §12.

**Hypothesis 11.5.3.2** (Geometric-object status of the fields). The fields $\Psi$ are tensor/spinor geometric objects on $M_{\mathrm{reg}}$ with covariant pushforward under diffeomorphisms. Appendix O §O.7.1 supplies the positive-definite spatial $\Gamma$-limit used by this branch; the tensor/spinor transformation law is an additional continuum-bridge hypothesis.

**Hypothesis 11.5.3.3** (Relabeling neutrality). For any orientation-preserving $C^\infty$ diffeomorphism $\chi:U\to U'$ representing a change of continuum bookkeeping coordinates,
$$
S_U[\Psi] \;=\; S_{U'}[\chi_*\Psi].\tag{67b}
$$

**Theorem 45a (Relabeling–Covariance Closure).** Under Hypotheses 11.5.3.1–11.5.3.3:

(a) *Scalar density form.* There exists a scalar local Lagrangian $\mathcal L$ — a function of the $k$-jet of $\Psi$ transforming as a scalar under orientation-preserving diffeomorphisms — such that
$$
S_U[\Psi] \;=\; \int_U \sqrt{|g|}\,\mathcal L(j^k\Psi)\,d^4 x,\tag{67c}
$$
equivalently the density $L=\sqrt{|g|}\,\mathcal L$ is a scalar density of weight one.

(b) *Diffeomorphism covariance of the global action.* For every compactly supported orientation-preserving diffeomorphism $\varphi$ of $M_{\mathrm{reg}}$,
$$
S[\varphi^*\Psi,\varphi^*g]\;=\;S[\Psi,g].\tag{67d}
$$

Continuum diffeomorphism invariance is therefore a consequence of the conjunction of Hypotheses 11.5.3.1–11.5.3.3; substrate-level relabeling neutrality alone supplies neither locality and finite jet order nor the geometric-field transformation laws.

*Proof.* (a) In one chart, $S_U[\Psi]=\int_{\phi(U)} L\,d^4x$. In a second chart $(\phi',U')$, the same physical functional has $S_{U'}[\chi_*\Psi]=\int_{\phi'(U')} L'\,d^4x'$. By Hypothesis 11.5.3.3 these are equal for every admissible field configuration. Pulling back via $\chi$:
$$
\int_{\phi(U)} L\bigl(x,j^k\Psi(x)\bigr)\,d^4x \;=\; \int_{\phi(U)} L'\bigl(\chi(x),j^k(\chi_*\Psi)(\chi(x))\bigr)\,|\det D\chi(x)|\,d^4x.
$$
Since the equality holds for arbitrary $U$ and arbitrary local field data, the integrands satisfy the pointwise density transformation law $L'(x',\,\cdot\,)=L(x,\,\cdot\,)\,|\det D\chi^{-1}(x')|$. This is exactly the weight-one scalar-density transformation. The metric determinant $\sqrt{|g|}$ transforms by the same Jacobian factor under coordinate changes (Nakahara 2003, §7.9.1), so the ratio $\mathcal L:=L/\sqrt{|g|}$ is a scalar, giving (67c).

(b) Under a compactly supported orientation-preserving active diffeomorphism, every geometric field is pulled back: $(\Psi,g)\mapsto(\varphi^*\Psi,\varphi^*g)$. The Lagrangian is a scalar on this branch and the metric volume form obeys $d\operatorname{vol}_{\varphi^*g}=\varphi^*(d\operatorname{vol}_g)$. Therefore the change-of-variables formula gives
$$
S[\varphi^*\Psi,\varphi^*g]
=
\int_M\varphi^*\!\left(\mathcal L(\Psi,g)d\operatorname{vol}_g\right)
=
S[\Psi,g].
$$
This proves (67d). ∎

**Proposition 45a.2 (Finite Relabeling Does Not Select the Continuum Transformation Law).** Invariance under simultaneous relabeling of a finite vertex set does not entail diffeomorphism covariance of a continuum action. The permutation-invariant functional
$$
F_n(z)=\sum_{v\in V_n}z_v
\tag{67f}
$$
admits a covariant continuum dictionary in which $z_v$ is a scalar multiplied by its metric cell volume and $F_n\to\int_M\phi\,d\operatorname{vol}_g$. The same finite arrays also admit a fixed-chart dictionary in which $z_v$ is a scalar multiplied by coordinate cell volume and the limiting prescription is $\int\phi(x)\,d^4x$ while $\phi$ is transformed as a scalar and the coordinate measure is kept as fixed background data. The latter prescription changes under a diffeomorphism with nonunit Jacobian.

*Proof.* Equation (67f) is unchanged by every simultaneous permutation of the labels and array entries. Both continuum prescriptions are ordinary Riemann-sum limits of (67f) after the corresponding meaning of $z_v$ is chosen. The metric-volume prescription is covariant by change of variables. For the fixed-chart prescription, a coordinate change $x'=\chi(x)$ gives the transformed scalar $\phi'(x')=\phi(\chi^{-1}(x'))$; re-evaluation against fixed $d^4x'$ differs by the missing factor $|\det D\chi^{-1}|$ whenever that Jacobian is not one. Thus the finite symmetry does not select the field type or density weight. Hypotheses 11.5.3.1–11.5.3.3 supply exactly those missing data. ∎

**Corollary 45a.1 (Derived Noether Identity for the Matter Sector).** Let $S[\Psi,g]=S_{\mathrm{geom}}[g]+S_{\mathrm{MPU}}[\Psi,g]$ with $S_{\mathrm{MPU}}$ of the scalar-density form of Theorem 45a. With covariant metric variations, define the matter stress-energy tensor by
$$
T^{\mu\nu}
:=
\frac{2}{\sqrt{|g|}}\,
\frac{\delta S_{\mathrm{MPU}}}{\delta g_{\mu\nu}}.
\tag{67e}
$$
Equivalently, with inverse-metric variations,
$$
T_{\mu\nu}
=
-\frac{2}{\sqrt{|g|}}\,
\frac{\delta S_{\mathrm{MPU}}}{\delta g^{\mu\nu}},
\tag{67e'}
$$
because $\delta g^{\alpha\beta}=-g^{\alpha\mu}g^{\beta\nu}\delta g_{\mu\nu}$. If the matter fields satisfy their Euler–Lagrange equations, then $\nabla_\mu T^{\mu\nu}=0$.

*Proof.* Let $\xi^\mu$ be a compactly supported smooth vector field on $M_{\mathrm{reg}}$, and consider the infinitesimal diffeomorphism it generates. By Theorem 45a(b),
$$
0
=
\delta_\xi S_{\mathrm{MPU}}
=
\int d^4x\,\sqrt{|g|}
\left[
\frac{1}{\sqrt{|g|}}\frac{\delta S_{\mathrm{MPU}}}{\delta\Psi}\,\delta_\xi\Psi
+
\frac{1}{\sqrt{|g|}}\frac{\delta S_{\mathrm{MPU}}}{\delta g_{\mu\nu}}\,\delta_\xi g_{\mu\nu}
\right].
$$
On-shell $\delta S_{\mathrm{MPU}}/\delta\Psi=0$. By (67e),
$$
\frac{1}{\sqrt{|g|}}\frac{\delta S_{\mathrm{MPU}}}{\delta g_{\mu\nu}}
=
\frac12 T^{\mu\nu}.
$$
Using $\delta_\xi g_{\mu\nu}=\mathcal L_\xi g_{\mu\nu}=\nabla_\mu\xi_\nu+\nabla_\nu\xi_\mu$ and the symmetry of $T^{\mu\nu}$,
$$
0
=
\frac12\int d^4x\,\sqrt{|g|}\,
T^{\mu\nu}(\nabla_\mu\xi_\nu+\nabla_\nu\xi_\mu)
=
\int d^4x\,\sqrt{|g|}\,
T^{\mu\nu}\nabla_\mu\xi_\nu.
$$
Integration by parts against compactly supported $\xi$ gives
$$
0
=
-\int d^4x\,\sqrt{|g|}\,
(\nabla_\mu T^{\mu\nu})\xi_\nu.
$$
Since $\xi$ is arbitrary, $\nabla_\mu T^{\mu\nu}=0$. ∎

Input (T4) of §12 is therefore a derived consequence of Theorem 45a together with the matter equations of motion.

**11.6 Finite Operational Causal Speed and Lorentzian Signature (Conditional on Thm 43, Thm 45)**

The ND-RID substrate supplies the emergent metric with a uniform operational causal-speed upper bound through Theorem 46. An attained frontier is an additional branch input; normalized uniform-weight one-link saturation is required for $c=\delta/\tau_{\min}$. Promotion of a separately accepted attained frontier to a Lorentzian principal symbol is carried out by Appendix O, Theorems O.7a and O.7b, and imported into the main text by Corollary 46a under the full signature package or an accepted cone-saturation certificate for the covered retained sectors.

**11.6.1 Theorem 46 (Finite Operational Causal-Speed Bound)**

Assume a positive link scale $\delta$, successive edge-by-edge serialized propagation in the propagation-cost metric, a registered lower time $\tau_{\min}>0$ for each edge update, and uniformly bounded positive weights $0<w_{xy}\le w_{\max}<\infty$. Then every nonempty retained causal path obeys the uniform upper bound
$$
\frac{d_{\mathcal N}(u,v)}{t(\gamma)}
\le c_*:=\frac{\delta w_{\max}}{\tau_{\min}}<\infty.
$$
This theorem does not prove that $c_*$ is attained, that a local frontier speed is position-independent, or that the bound is a Lorentzian characteristic cone. On the separately declared uniform-weight, one-link-saturating branch with normalized weight $w=1$, the attained frontier is $c=\delta/\tau_{\min}$. Lorentzian promotion requires Corollary 46a and the complete Appendix O package.

*Proof.* If a retained causal path $\gamma$ contains $n$ successive edge updates, serialization and the registered per-edge lower time give
$$
t(\gamma)\ge n\tau_{\min}.
$$
The propagation-cost metric and the edge-weight upper bound give
$$
d_{\mathcal N}(u,v)
\le\sum_{(x,y)\in\gamma}\delta w_{xy}
\le n\delta w_{\max}.
$$
Division yields the displayed uniform bound. The hypotheses give no lower bound on an attained speed and no equality case. Equality on the normalized uniform-weight branch is an additional one-link attainment hypothesis. The Lorentzian conclusion is not used in this proof. ∎

**Corollary 46a (Lorentzian Signature and Local Lorentz Kinematics from Theorem 46 and Appendix O).** The uniform operational causal-speed bound of Theorem 46, together with a separately accepted attained operational frontier and the positive-definite spatial $\Gamma$-limit of §O.7.1, the entropy-selected time coordinate of Hypothesis O.7.2.2, the second-order continuum principal symbol supplied directly by Hypothesis O.7.2.3 or, for covered sectors, by an accepted second-order positivity certificate $\mathfrak C_2$ (Definition O.7.2.3a), and either the cone-coincidence/nondegeneracy clause of Hypothesis O.7.2.4 or an accepted cone-saturation certificate $\mathfrak C_{\mathrm{cone}}$ supplying that clause for the covered retained sectors (Definition O.7.2.5), supplies the four hypotheses of Theorem O.7a. When the latter two inputs are supplied by finite sector certificates, the well-posedness/signature audit is recorded by $\mathfrak C_{\mathrm{sig}}$ (Definition 46a.1). By Theorems O.7a and O.7b of Appendix O, this package forces a Lorentzian principal symbol on the emergent manifold. With the additional registered global orientation of $S=\ker dt$, Corollary O.7b.1 derives local Lorentz invariance with structure group $SO^+(1,3)$. The tangent-frame Lorentz-kinematics component of input (T5) of §12 follows on this branch with the registered global spatial orientation; full matter-dynamical covariance and metric universality retain the additional records stated in (T5). The Lorentzian factor $\mathrm{Spin}(1,3)$ in the principal bundle $G=\mathrm{Spin}(1,3)\times U(d_0)$ of Theorem 48 is structurally forced only on the spin-admissible branch $w_2(M_{\mathrm{reg}})=0$ or on a strict-spin tangential-structure certificate $\mathfrak C_{\mathrm{tan}}$ (Definition 48b.2). Charged or twisted fermionic sectors may instead require a $\mathrm{Spin}^c$ or gauge-twisted tangential structure, in which case Theorem 48 must be read with the corresponding replacement bundle rather than as the global product $\mathrm{Spin}(1,3)\times U(d_0)$. The $D_4$ continuum gluing certificate supplies local regular-continuum data used by the branch, but it does not by itself assert global frame triviality, remove the spin obstruction, or discharge the second-order, cone-coincidence, and signature gates for uncovered sectors.

*Proof.* Direct application of Theorems O.7a (signature forcing), O.7b (speed normalization), and Corollary O.7b.1 (tangent-frame Lorentz group and local kinematics) to the separately accepted attained frontier, the upper-bound output of Theorem 46, and §O.7.1, with the second-order input supplied either by Hypothesis O.7.2.3 or by $\mathfrak C_2$, and with the fourth cone input supplied either by Hypothesis O.7.2.4 or by $\mathfrak C_{\mathrm{cone}}$ as stated. When the finite certificate route is used, $\mathfrak C_{\mathrm{sig}}$ records the well-posedness exclusion of non-Lorentzian representatives. Definition Z.9a and Theorem Z.11 supply only the four-dimensional Euclidean response carrier. The rank-three spatial subspace follows only after the rank-four continuum realization and the nonvanishing time covector of Hypotheses O.7.2.1–O.7.2.2 are accepted. The global spin-bundle clause is then exactly the obstruction statement of Theorem 48b and Corollary 48b.1, optionally discharged by $\mathfrak C_{\mathrm{tan}}$ on the strict-spin branch. Full matter-dynamical Lorentz covariance additionally requires common-cone and covariant interaction certificates. ∎

**Proposition 46a.2 (Cone-Only Signature and Order Nonentailment).** On a four-dimensional cotangent space, the quadratic symbols
$$
q_L(\xi)=-\xi_0^2+\xi_1^2+\xi_2^2+\xi_3^2,
\qquad
q_U(\xi)=-\xi_0^2-\xi_1^2+\xi_2^2+\xi_3^2
\tag{46a.2.1}
$$
are both nondegenerate and have nonempty real characteristic cones, but their inertia is respectively Lorentzian and ultrahyperbolic. Moreover, the fourth-order symbol $q_L(\xi)^2$ has exactly the same characteristic set as $q_L$. Therefore the existence or attainment of one nonempty nondegenerate characteristic cone, even when shared by all retained sectors, does not by itself exclude an ultrahyperbolic index or a higher-order representative. The one-time Cauchy well-posedness and second-order entries of $\mathfrak C_{\mathrm{sig}}$ are independent necessary gates for those exclusions.

*Proof.* The matrices of $q_L$ and $q_U$ are diagonal with no zero eigenvalues and inertia $(1,3)$ and $(2,2)$. Each displayed polynomial vanishes on nonzero real covectors. Finally, $q_L^2=0$ if and only if $q_L=0$, while its polynomial degree is four. ∎

**Theorem 46a.3 (Second-Order Lorentz-Cone Rigidity).** Let $V$ be a real vector space of dimension $n\ge3$, let $q$ be a nondegenerate Lorentzian quadratic form on $V$, and let $q'$ be a nonzero real quadratic form. If
$$
\{\xi\in V\setminus\{0\}:q'(\xi)=0\}
=
\{\xi\in V\setminus\{0\}:q(\xi)=0\},
\tag{46a.3.1}
$$
then $q'=cq$ for a unique $c\ne0$. Thus, after one retained second-order sector has passed the one-time Lorentzian well-posedness gate, every other second-order sector with exactly the same characteristic cone is conformally proportional to it. A common cone still does not exclude the higher-order representative $q^2$ of Proposition 46a.2; the second-order hypothesis is indispensable.

*Proof.* Choose coordinates in which
$$
q(t,x)=-t^2+|x|^2,
\qquad x\in\mathbb R^{n-1},
$$
and write
$$
q'(t,x)=at^2+2t\,b^{\mathsf T}x+x^{\mathsf T}Cx
$$
with $C=C^{\mathsf T}$. Every $(1,u)$ with $|u|=1$ is $q$-null, so (46a.3.1) gives
$$
a+2b^{\mathsf T}u+u^{\mathsf T}Cu=0
\qquad(|u|=1).
$$
Replacing $u$ by $-u$ gives $b=0$. Hence $u^{\mathsf T}Cu=-a$ on the unit sphere. Homogeneity and polarization give $C=-aI$, so $q'=-a q$. If $a=0$, then $q'$ is the zero form and its null set is all of $V$, contrary to the hypothesis. Therefore $c=-a\ne0$, and uniqueness follows because $q$ is nonzero. ∎

### 11.6.3 Causal-Diamond Reconstruction from Predictive Inclusion


**Definition 46b (Operational Causal-Diamond Valuation).** On a regular Lorentzian branch, let $\mathcal D_{\mathrm{op}}$ be the set of relatively compact operational causal diamonds. Each $D\in\mathcal D_{\mathrm{op}}$ carries a finite predictive algebra $\mathfrak A(D)$ satisfying isotony:
$$
D_1\subseteq D_2
\quad\Longrightarrow\quad
\mathfrak A(D_1)\subseteq\mathfrak A(D_2).
$$
Assume the branch is inclusion-faithful:
$$
\mathfrak A(D_1)\subseteq\mathfrak A(D_2)
\quad\Longrightarrow\quad
D_1\subseteq D_2
$$
for operational diamonds. Let
$$
V_{\mathrm{cap}}(D)
$$
be the finite predictive capacity valuation of $D$, equal to the supremal reliable nats stored or transmitted by $\mathfrak A(D)$ at the stated resolution.

**Theorem 46b (Causal-Diamond Reconstruction of the Emergent Metric Branch).** Let $(M,g,V_{\mathrm{cap}})$ and $(M',g',V'_{\mathrm{cap}})$ be connected smooth four-dimensional manifolds with smooth Lorentzian metrics, chosen time orientations, past-and-future distinguishing causal structures, and global hyperbolicity. Smooth metric regularity is an additional branch premise beyond the measurable or $C^{1,\alpha}$ tensor conclusions of Theorem 45. Suppose there is a bijection
$$
\Phi:\mathcal D_{\mathrm{op}}(M)\to\mathcal D_{\mathrm{op}}(M')
$$
that preserves and reflects inclusion and satisfies
$$
V_{\mathrm{cap}}(D)=V'_{\mathrm{cap}}(\Phi(D))
$$
for every operational diamond. Assume additionally:

1. the basis-order isomorphism extends to an isomorphism of the generated topological frames, equivalently it maps the completely prime filters representing manifold points to such point filters, and its induced point map $F$ satisfies $\Phi(D)=F(D)$;
2. each completed operational family contains every relatively compact chronological diamond $I^+(p)\cap I^-(q)$ with $p\ll q$, and $F$ sends its ordered past/future tip pair $(p,q)$ to the ordered tip pair of $\Phi(I^+(p)\cap I^-(q))$.

Then:

1. $\Phi$ induces a homeomorphism $F:M\to M'$;
2. $F$ preserves the directed causal order;
3. $F$ determines the conformal Lorentzian metric,
$$
F^*g'=\Omega^2g,
$$
for a positive function $\Omega$ on the regular set;
4. if both branches use one positive capacity-density normalization with $\sigma_{\mathrm{cap}}>0$,
$$
V_{\mathrm{cap}}(D)=\sigma_{\mathrm{cap}}\operatorname{Vol}_g(D),
\qquad
V'_{\mathrm{cap}}(D')=\sigma_{\mathrm{cap}}\operatorname{Vol}_{g'}(D')
$$
on sufficiently small diamonds, then $\Omega=1$ almost everywhere on the regular set.

If the same completed-diamond and point-map data satisfy ordered-tip compatibility after one global reversal of the chosen time orientation, the metric conclusion is unchanged and the reconstructed directed order is reversed. No causal reconstruction is asserted from the frame-extension premise alone.

*Proof.* Hypothesis 1 supplies the topological-frame isomorphism and its bijection of point filters. Let $F$ be the induced point map. Its compatibility $F(D)=\Phi(D)$ gives $F^{-1}(\Phi(D))=D$ for every basis diamond. The inverse frame isomorphism gives the same statement in the other direction. Since these diamonds form bases, $F$ and $F^{-1}$ are continuous.

If $p\ll q$, global hyperbolicity makes $I^+(p)\cap I^-(q)$ relatively compact. Hypothesis 2 and the ordered tips of its image give $F(p)\ll F(q)$. Applying the same argument to the inverse bijection proves reflection of chronology. On a globally hyperbolic spacetime, $J^+$ is closed and equals the closure of $I^+$ in the product topology: every causal pair is approximated by moving its second endpoint a short distance to its timelike future, and closedness gives the reverse inclusion. The homeomorphism $F\times F$ therefore preserves and reflects $J^+$.

The causal/conformal reconstruction theorem for the declared smooth four-dimensional, past-and-future distinguishing Lorentzian class [Hawking, King & McCarthy 1976; Malament 1977] then makes $F$ a conformal diffeomorphism, so
$$
F^*g'=\Omega^2g
$$
for a positive function $\Omega$.

For the scale, take sufficiently small diamonds $D_\epsilon(p)$ shrinking regularly to $p$. In four dimensions,
$$
\operatorname{Vol}_{F^*g'}(D_\epsilon(p))
=
\Omega(p)^4\operatorname{Vol}_{g}(D_\epsilon(p))+o(\operatorname{Vol}_{g}(D_\epsilon(p))).
$$
Capacity preservation and the common normalization give
$$
\sigma_{\mathrm{cap}}\operatorname{Vol}_{g}(D_\epsilon(p))
=
\sigma_{\mathrm{cap}}\operatorname{Vol}_{g'}(\Phi(D_\epsilon(p))).
$$
Pulling back the right side and dividing by $\sigma_{\mathrm{cap}}\operatorname{Vol}_{g}(D_\epsilon(p))$ gives
$$
1=\Omega(p)^4+o(1).
$$
Letting $\epsilon\to0$ gives $\Omega(p)=1$ for almost every regular point. Thus the causal-diamond inclusion order fixes the conformal geometry, and the predictive capacity valuation fixes the conformal scale. ∎

**Corollary 46c (Spacetime as the Regular Representation of Predictive Inclusion).** Assume the complete branch package of Theorem 46b, including smooth-metric regularity: connected, time-oriented, past- and future-distinguishing globally hyperbolic Lorentzian representatives; inclusion-faithful operational diamond algebras; a completed family containing every relatively compact chronological diamond; an inclusion-preserving diamond bijection extending to the generated topological frame and point map; ordered-tip compatibility, possibly after one declared global time-orientation reversal; and one common positive small-diamond capacity-density normalization. On that class, the data
$$
(\mathcal D_{\mathrm{op}},\subseteq,V_{\mathrm{cap}})
$$
determine the Lorentzian metric-measure structure up to the declared operational equivalence and capacity normalization.

*Proof.* The complete frame-extension and ordered-tip hypotheses invoke Theorem 46b's causal reconstruction and determine the conformal class. The common positive small-diamond capacity density determines the conformal scale. Ordered-tip compatibility determines the chosen time orientation; allowing one declared global reversal reverses the directed order while preserving the metric conclusion. ∎

**Corollary 46d (Landauer-Count Form of Causal-Diamond Reconstruction).** Suppose each completed operational causal diamond $D$ on each of two connected, time-oriented, past-and-future distinguishing, globally hyperbolic regular Lorentzian branches has a registered refinement sequence of finite update-cell counts
$$
N_{L,n}(D)\in\mathbb N_0
$$
and common positive cell valuations $\nu_{L,n}\to0$ such that
$$
V_{\mathrm{cap}}(D)=\lim_{n\to\infty}\nu_{L,n}N_{L,n}(D),
\qquad
V'_{\mathrm{cap}}(D')=\lim_{n\to\infty}\nu_{L,n}N'_{L,n}(D').
\tag{46d.1}
$$
Both limits must exist and be finite for every completed diamond. Assume all hypotheses of Theorem 46b, including smooth-metric regularity, completed-diamond availability, frame-extension, ordered-tip compatibility, and positive common small-diamond capacity density. If its diamond bijection $\Phi$ also satisfies
$$
N_{L,n}(D)=N'_{L,n}(\Phi(D))
$$
for every $D$ and every refinement level $n$, then the two branches determine the same emergent metric-measure structure up to the operational equivalence of Theorem 46b. Each physical count is integral; the completed capacity valuation is its certified refinement limit.

*Proof.* The common cell valuations and matched counts give
$$
V_{\mathrm{cap}}(D)
=\lim_{n\to\infty}\nu_{L,n}N_{L,n}(D)
=\lim_{n\to\infty}\nu_{L,n}N'_{L,n}(\Phi(D))
=V'_{\mathrm{cap}}(\Phi(D)).
$$
The remaining hypotheses are precisely the registered hypotheses of Theorem 46b, so that theorem supplies the metric-measure conclusion. ∎

**Corollary 46e (Boundary-Sufficiency Metric Universality).** Work on a regular Lorentzian branch satisfying Definition 46b and the finite Markov-boundary hypotheses of Definition F.10.6a. For each retained matter species $s$, let $\mathcal R_s(D)$ be the finite protocol-response functor generated by $s$-sector instruments localized in an operational diamond $D$, and let $\subseteq_s$ and $V_s$ be the inclusion relation and capacity valuation reconstructed from $\mathcal R_s$ by the same operational test used in Definition 46b. Assume that each species reconstruction and its comparison with the common branch satisfy the complete smooth-metric regularity, connectedness, distinguishing, global-hyperbolicity, topological-frame, ordered-tip, and positive capacity-density hypotheses of Theorem 46b. Assume additionally:

1. for every sufficiently small operational diamond $D$, the same finite boundary syndrome or boundary algebra $B_D$ is PCE-minimal and Markov-sufficient for every retained species,
$$
I_s(\mathfrak A_s(D):\mathfrak A_s(\bar D)\mid B_D)_\rho=0,
\tag{46e.1}
$$
or, on the classical branch, $X_D^{(s)}\perp E_{\bar D}^{(s)}\mid B_D$;

2. the branch is specieswise separating and inclusion-reflecting: equal $s$-sector and common boundary responses identify equal PPI objects, and every registered species inclusion $D_1\subseteq_s D_2$ certifies the full operational inclusion $D_1\subseteq D_2$;

3. the boundary capacity normalization is common,
$$
V_s(D)=V_{\mathrm{cap}}(D)
\tag{46e.2}
$$
for the same channel units used in Corollary 46d.

Then every retained species reconstructs the same operational diamond poset and the same metric-measure structure:
$$
\subseteq_s=\subseteq,
\qquad
V_s=V_{\mathrm{cap}},
\qquad
[g_s]=[g],
$$
and the common capacity normalization fixes $g_s=g$ almost everywhere on the regular set. A species-dependent metric that changes no finite protocol response is PPI-null; a species-dependent metric that changes a retained response is a different finite-response branch and must carry its own certificate.

*Proof.* By Theorem F.10.6b, condition (46e.1) gives exact recovery of every exterior $s$-sector response from the common boundary datum $B_D$. Corollary F.10.6c removes an additional boundary label only when it changes no retained exterior response. For a retained species $s$, restriction of a full operational protocol inclusion preserves that inclusion in the $s$-sector, giving $D_1\subseteq D_2\Rightarrow D_1\subseteq_s D_2$. The explicit inclusion-reflection entry of condition 2 gives the reverse implication. Thus $\subseteq_s=\subseteq$ for every retained species. Object separation identifies the corresponding diamond objects in the common PPI quotient.

Equation (46e.2) gives equality of the species capacity valuation with the common predictive capacity valuation. Theorem 46b applied to the identity bijection of the common diamond poset then fixes the conformal metric reconstructed by each species, and the shared valuation fixes the conformal scale. Thus every retained species sees the same metric tensor on the regular branch. If a proposed $g_s$ differs while preserving all finite responses, it is precisely a response-null relabeling in the protocol-response presheaf. If it changes a finite response, it violates the same-branch hypotheses and is a separate branch. ∎

**Definition 46e.1 (Finite Causal Order-Fraction Record).** Let $D\ge2$ be an integer and $N\ge2$. Let $X_1,\ldots,X_N$ be iid points sampled uniformly with respect to volume measure in one flat $D$-dimensional Alexandrov interval, equivalently an operational Poisson-sampling protocol conditioned on $N$. This is a sampling model for a retained response record, not a new causal-set ontology. Define
$$
U_N
=
\binom N2^{-1}
\sum_{i<j}
\mathbf1\{X_i\prec X_j\ \text{or}\ X_j\prec X_i\}.
\tag{46e.1.1}
$$

**Theorem 46e.1 (Four-Dimensional Causal Order-Fraction Lock).** For the record of Definition 46e.1,
$$
\mathbb E[U_N]
=r_D
:=
\frac{\Gamma(D+1)\Gamma(D/2)}{2\Gamma(3D/2)}.
\tag{46e.1.2}
$$
On the PU $D=4$ branch,
$$
r_4=\frac{\Gamma(5)\Gamma(2)}{2\Gamma(6)}=\frac1{10}.
\tag{46e.1.3}
$$
Moreover,
$$
\Pr\!\left(|U_N-r_4|\ge\epsilon\right)
\le
2\exp\!\left(-\frac{N\epsilon^2}{2}\right).
\tag{46e.1.4}
$$

*Proof.* For an interval $I(p,q)$ of volume $V_I$, the comparable-pair probability is
$$
\frac{2}{V_I^2}\int_{I(p,q)}V\bigl(I(x,q)\bigr)\,d^Dx.
$$
Scale invariance and evaluation of this standard Myrheim--Meyer integral in light-cone coordinates give (46e.1.2) [Abajian & Carlip 2018], and (46e.1.3) is exact arithmetic. Replacing one sampled point changes at most $N-1$ pair indicators, so it changes $U_N$ by at most $2/N$. McDiarmid's bounded-difference inequality therefore gives (46e.1.4). ∎

**Corollary 46e.1a (Independent Dimension Cross-Certificate).** The order-fraction record uses only causal comparability. It is independent of the Appendix Z kissing-number derivation and of volume-growth fitting. A flat-diamond $D=4$ certificate must therefore satisfy (46e.1.3) within the registered sampling error. Curvature, nonuniform sampling, detector-order error, and curved-background finite-size or detector-window effects must be specified as a preregistered bias interval; the exact $1/10$ value is not asserted outside the flat uniform branch.

*Proof.* Definition 46e.1 constructs $U_N$ solely from the pair indicators $\mathbf1_{x_i\prec x_j}$. Neither a kissing number nor a fitted volume-growth exponent occurs in that statistic or in the expectation calculation of Theorem 46e.1, which proves the stated derivational independence. On the $D=4$ flat uniform branch,
$$
r_4
=\frac{\Gamma(5)\Gamma(2)}{2\Gamma(6)}
=\frac{24\cdot1}{2\cdot120}
=\frac1{10}.
$$
Equation (46e.1.4) supplies the registered sampling deviation about this value. Curvature, a nonuniform sampling law, order misclassification, or a detector-window distortion changes a hypothesis used in the expectation integral; its contribution must therefore enter through the declared bias interval rather than through the exact flat-uniform value. ∎

**Remark 46e.1b (Neighboring-Dimension Values of the Order Fraction).** Direct evaluation of (46e.1.2) gives the exact neighboring values
$$
r_2=\frac{\Gamma(3)\Gamma(1)}{2\Gamma(3)}=\frac12,
\qquad
r_3=\frac{\Gamma(4)\Gamma(3/2)}{2\Gamma(9/2)}=\frac8{35},
\qquad
r_5=\frac{\Gamma(6)\Gamma(5/2)}{2\Gamma(15/2)}=\frac{128}{3003}=0.0426240\ldots,
$$
and the five values $r_D$ are strictly decreasing for integer dimensions $D\in\{2,3,4,5,6\}$, so the order-fraction record separates the neighboring dimensions: the $D=4$ value $1/10$ lies strictly between $r_5$ and $r_3$. The value $r_2=1/2$ has an independent verification: in two dimensions, light-cone coordinates order two independently sampled points compatibly exactly when both coordinates order alike, an event of probability $1/2$ for the flat-uniform Alexandrov-diamond law, whose light-cone coordinates are independent and continuous.

*Proof.* The three displayed values are exact $\Gamma$-function arithmetic from (46e.1.2): $\Gamma(3/2)=\sqrt\pi/2$, $\Gamma(9/2)=105\sqrt\pi/16$ give $r_3=6\cdot(\sqrt\pi/2)/(2\cdot105\sqrt\pi/16)=8/35$; $\Gamma(5/2)=3\sqrt\pi/4$, $\Gamma(15/2)=135135\sqrt\pi/128$ give $r_5=120\cdot(3\sqrt\pi/4)/(2\cdot135135\sqrt\pi/128)=128/3003$; the $D=2$ ratio cancels to $1/2$. Strict monotonicity on the listed range is direct comparison of the five exact values $1/2,8/35,1/10,128/3003,\Gamma(7)\Gamma(3)/(2\Gamma(9))=1/56$. For the independent $D=2$ check, in light-cone coordinates $u=t+x$, $v=t-x$ the causal relation $x_i\prec x_j$ holds if and only if $u_i<u_j$ and $v_i<v_j$; for two independent samples from the flat-uniform Alexandrov-diamond law, the $u$- and $v$-coordinates are independent and continuous, so their two rankings are independent and each ordering is equally probable, so the comparability probability is $2\cdot\tfrac12\cdot\tfrac12=\tfrac12$, agreeing with the formula. ∎

**Definition 46f (Topological-Bandwidth Completion Certificate).** Fix $0<\Omega<\infty$ on a regular Lorentzian branch satisfying Theorem 43.5, Corollary 46a, and Definition 46b. Define
$$
\mathsf{TB}_\Omega=
(\mathcal D_{\mathrm{op}},\subseteq,V_{\mathrm{cap}},
L_{\mathrm{PU}},PW_\Omega,\mathcal C_\Omega,\mathcal A_\Omega),
$$
where
$$
PW_\Omega:=\operatorname{Ran}\mathbf1_{[0,\Omega]}(L_{\mathrm{PU}}),
\qquad
\mathcal A_\Omega f=(\langle f,\phi_i\rangle)_{i=1}^N.
$$
The completed causal-diamond basis $\mathcal D_{\mathrm{op}}$ belongs to the effective regular-continuum representation and need not be finite as a set. Every physical comparison is restricted to a declared finite diamond subfamily, finite local algebras, and the finite cover $\mathcal C_\Omega$. Thus $\mathsf{TB}_\Omega$ is assembled from finite-response subrecords; it is not an exactly instantiated continuum object.

An accepted certificate $\mathfrak C_{\mathrm{TB}}^\Omega$ contains, on one forward-locked branch:

1. a continuum record discharging Theorem 43.5;
2. the complete hypotheses of Theorem 46b, including smooth-metric regularity, connectedness, time orientation, distinguishing, global hyperbolicity, inclusion faithfulness, completed-diamond availability, topological-frame extension, ordered-tip compatibility, and a positive common capacity-density normalization;
3. compatible cone, second-order, and signature records;
4. a complete AQFT bridge for Theorem F.0 on the retained diamonds—$\mathfrak C_{\mathrm{gen}}$ is sufficient only together with every other F.0 compatibility hypothesis;
5. an injective sampling map $\mathcal A_\Omega:PW_\Omega\to\mathbb C^N$; and
6. a PPI quotient identifying representatives only when all declared diamond, capacity, and finite-band responses agree.

**Theorem 46g (Conditional Topological-Bandwidth Completion).** On an accepted $\mathfrak C_{\mathrm{TB}}^\Omega$:

1. within the branch class of Theorem 46b, the completed ordered diamond basis determines topology and causal order up to that theorem's equivalence; a finite protocol sees only its retained subposet;
2. the common capacity valuation fixes the conformal scale almost everywhere on the regular set; and
3. every $f\in PW_\Omega$ is reconstructed from the finite samples by
   $$
   f=\sum_{i=1}^N\langle f,\phi_i\rangle
   S_\Omega^{-1}P_\Omega\phi_i,
   \qquad
   P_\Omega=\mathbf1_{[0,\Omega]}(L_{\mathrm{PU}}).
   $$

This proves representation of the declared band; it neither reconstructs an exact continuum from an arbitrary finite subposet nor excludes modes used by a different protocol with a larger accepted bandwidth.

*Proof.* Item 1 is Theorem 46b applied to completed operational-diamond bases; no prime-filter representation is asserted for an arbitrary finite subposet. The same theorem gives a conformal pullback $F^*g'=\Omega_c^2g$. For diamonds shrinking regularly to $p$,
$$
\frac{\operatorname{Vol}_{\Omega_c^2g}(D_\epsilon(p))}
{\operatorname{Vol}_{g}(D_\epsilon(p))}
\longrightarrow \Omega_c(p)^4.
$$
Capacity preservation with the common normalization makes the limit equal to $1$, so positivity gives $\Omega_c=1$ almost everywhere. Finally, injectivity of $\mathcal A_\Omega$ invokes Theorem F.10.4a.4.3 and yields the displayed frame reconstruction. Theorems K.10.3a and K.10.4 exclude an independently physical exact subresolution carrier; exclusion above $\Omega$ is limited to the response problem declared by this certificate. ∎

**Corollary 46g.1 (Finite-Diamond Global-Reconstruction No-Go).** On the nonempty class of connected globally hyperbolic static four-manifolds, a finite operational-diamond record is not a globally injective invariant. There exist two members with nonhomeomorphic Cauchy surfaces and a common relatively compact causally convex diamond $U$ such that every finite family of subdiamonds of $U$ has identical inclusion order, tip orientation, local volume, and every capacity valuation fixed by the same local density in both members.

*Proof.* Take product spacetimes $\mathbb R\times\Sigma$ and $\mathbb R\times\Sigma'$, where $\Sigma=\mathbb R^3$ and $\Sigma'=\mathbb R^3\mathbin{\#}(S^1\times S^2)$. Choose complete spatial metrics that are isometric on a ball $B_R(o)$ and place the added handle outside that ball. Equip the products with the corresponding static metrics $-dt^2+h$ and $-dt^2+h'$. These spacetimes are connected and globally hyperbolic. Choose $0<T<R/4$ and the common diamond
$$
U=I^+((-T,o))\cap I^-((T,o)).
$$
The static causal-distance criterion keeps $U$ inside $(-T,T)\times B_T(o)$, so the spatial isometry identifies $U$ in the two products; as a diamond, $U$ is causally convex. Every finite family of its subdiamonds consequently has the same inclusion, orientation, volume, and local-density capacity record. The Cauchy surfaces are not homeomorphic because their fundamental groups are respectively trivial and $\mathbb Z$. Theorem 46g avoids this counterexample by requiring the completed diamond basis and its topological-frame extension; each physical finite subrecord remains a test of that completion rather than a replacement for it. ∎

**Definition 46h (Finite Metric-Response Conditioning Certificate).** Fix one causal-order/inclusion stratum; the discrete inclusion record selects this stratum and is not differentiated. On a compact regular branch, let $\theta\in U\subset\mathbb R^p$ parameterize a declared finite-dimensional local metric envelope $g(\theta)$. Let
$$
\mathcal R:U\to\mathbb R^m
\tag{46h.1}
$$
collect only the continuously differentiable causal-diamond capacity, proper-time, volume, and finite-band response coordinates used by that envelope. Assume $m\ge p$ and $D\mathcal R(\theta_*)$ has full column rank. At $\theta_*$ the certificate records
$$
\sigma_*
:=\sigma_{min}(D\mathcal R(\theta_*))>0,
\tag{46h.2}
$$
a radius $r_*>0$ with the closed ball $\overline B(\theta_*,r_*)\subset U$, a derivative-Lipschitz constant $L_*$ on that ball, and a metric-chart Lipschitz constant $M_*$ in the registered tensor norm. When $L_*=0$, set $\sigma_*/L_*=+\infty$.

**Theorem 46i (Finite-Error Rigidity of Causal-Diamond Metric Reconstruction).** Under Definition 46h, every $h$ satisfying
$$
\|h\|\le\min\{r_*,\sigma_*/L_*\}
\tag{46i.1}
$$
obeys
$$
\|\mathcal R(\theta_*+h)-\mathcal R(\theta_*)\|
\ge\frac{\sigma_*}{2}\|h\|.
\tag{46i.2}
$$
Hence a same-branch candidate $\theta=\theta_*+h$ in this radius whose retained response vector differs from the reference response $\mathcal R(\theta_*)$ by at most $\epsilon$ satisfies
$$
\|\theta-\theta_*\|\le\frac{2\epsilon}{\sigma_*},
\qquad
\|g(\theta)-g(\theta_*)\|
\le\frac{2M_*\epsilon}{\sigma_*}.
\tag{46i.3}
$$

*Proof.* Taylor's theorem with a Lipschitz derivative gives
$$
\mathcal R(\theta_*+h)-\mathcal R(\theta_*)
=D\mathcal R(\theta_*)h+r(h),
\qquad
\|r(h)\|\le\frac{L_*}{2}\|h\|^2.
$$
The smallest-singular-value bound gives $\|D\mathcal R(\theta_*)h\|\ge\sigma_*\|h\|$. Under (46i.1), subtraction of the remainder yields (46i.2). The first inequality in (46i.3) follows by inversion of (46i.2), and the second follows from the registered Lipschitz bound for $g$. ∎

**Remark 46i.1 (No Universal Stability Without Conditioning).** Exact Theorem 46b does not imply a branch-independent finite-error constant. If $\sigma_*=0$, if the response quotient changes rank, or if the candidate leaves the certified radius, arbitrarily small response errors may coexist with large coordinate or conformal changes. Such cases require a different branch chart or remain non-identifiable.

**11.7 Spacetime Curvature as Predictive Holonomy (Conditional on Thm 43, Thm 45)**

Curvature of the emergent Lorentzian spacetime $(M, g_{\mu\nu})$ arises from the failure of local predictive-frame transport to close consistently around loops. The same transport statement applies to the internal predictive frame bundle, so the regular continuum branch has a single closed-system curvature object whose projections are the geometric and gauge curvatures.

**11.7.1 Theorem 47 (Predictive Holonomy and Riemann Curvature)**

On the regular product-bundle branch of Theorem 48 (globally exact under Theorem 48b) let $S\to M_{\mathrm{reg}}$ be the spinor bundle, let $E\to M_{\mathrm{reg}}$ be the internal Hermitian predictive bundle, and let
$$
\mathcal W := S\otimes E .
$$
Let $\Omega_\mu$ be the local spin connection and $A_\mu^{\mathrm{int}}$ the local internal connection supplied by Theorem G.4b. Define the **predictive connection**
$$
D_\mu^{\mathrm{pred}}
:=
\partial_\mu + A_\mu^{\mathrm{pred}},
\qquad
A_\mu^{\mathrm{pred}}
:=
\Omega_\mu\otimes 1 + 1\otimes A_\mu^{\mathrm{int}} .
$$
Its curvature is
$$
\mathcal F_{\mu\nu}^{\mathrm{pred}}
:=
[D_\mu^{\mathrm{pred}},D_\nu^{\mathrm{pred}}]
=
\partial_\mu A_\nu^{\mathrm{pred}}
-\partial_\nu A_\mu^{\mathrm{pred}}
+
[A_\mu^{\mathrm{pred}},A_\nu^{\mathrm{pred}}].
$$
Then:

1. The curvature factorizes as
$$
\mathcal F_{\mu\nu}^{\mathrm{pred}}
=
R_{\mu\nu}(\Omega)\otimes 1
+
1\otimes F_{\mu\nu}(A^{\mathrm{int}}),
$$
where
$$
R_{\mu\nu}(\Omega)
=
\partial_\mu\Omega_\nu-\partial_\nu\Omega_\mu+[\Omega_\mu,\Omega_\nu],
\qquad
F_{\mu\nu}(A^{\mathrm{int}})
=
\partial_\mu A_\nu^{\mathrm{int}}
-\partial_\nu A_\mu^{\mathrm{int}}
+
[A_\mu^{\mathrm{int}},A_\nu^{\mathrm{int}}].
$$

2. Assume the local connection coefficients are $C^2$ on the chart. Let an infinitesimal parallelogram based at $x$ have independent side vectors $a^\mu$ and $b^\nu$, and traverse its boundary in the order $a,b,-a,-b$. Define parallel transport by $\dot U=-\dot\gamma^\mu A_\mu^{\mathrm{pred}}U$, consistently with $D^{\mathrm{pred}}=\partial+A^{\mathrm{pred}}$. Its transport operator satisfies
$$
U_{\square(a,b)}^{\mathrm{pred}}
=
\mathbb I
-
\mathcal F_{\mu\nu}^{\mathrm{pred}}(x)a^\mu b^\nu
+
O\!\left((|a|+|b|)^3\right).
$$

3. The spin projection of $\mathcal F_{\mu\nu}^{\mathrm{pred}}$ is the Riemann curvature of the emergent Lorentzian metric:
$$
R_{\mu\nu}(\Omega)=\frac14 R_{\mu\nu ab}\gamma^{ab},
$$
equivalently $R^\rho{}_{\sigma\mu\nu}$ in the tangent representation. The internal projection is the gauge field strength $F_{\mu\nu}(A^{\mathrm{int}})$.

Consequently, on this branch the **Predictive Curvature Principle** holds: spacetime curvature and internal gauge curvature are projections of the same obstruction to path-independent predictive-frame translation. A local context dependence of ND-RID transport is physically curvature-producing exactly when it is not removable by a smooth choice of predictive frame; the frame-removable case is pure gauge and has $\mathcal F_{\mu\nu}^{\mathrm{pred}}=0$ on simply connected neighborhoods.

*Proof.* For any section $\Psi$ of $\mathcal W$,
$$
D_\mu^{\mathrm{pred}}D_\nu^{\mathrm{pred}}\Psi
=
\partial_\mu\partial_\nu\Psi
+
(\partial_\mu A_\nu^{\mathrm{pred}})\Psi
+
A_\nu^{\mathrm{pred}}\partial_\mu\Psi
+
A_\mu^{\mathrm{pred}}\partial_\nu\Psi
+
A_\mu^{\mathrm{pred}}A_\nu^{\mathrm{pred}}\Psi .
$$
Subtracting the same expression with $\mu$ and $\nu$ interchanged and using $[\partial_\mu,\partial_\nu]=0$ in a coordinate chart gives
$$
[D_\mu^{\mathrm{pred}},D_\nu^{\mathrm{pred}}]\Psi
=
\bigl(\partial_\mu A_\nu^{\mathrm{pred}}
-\partial_\nu A_\mu^{\mathrm{pred}}
+
[A_\mu^{\mathrm{pred}},A_\nu^{\mathrm{pred}}]\bigr)\Psi .
$$
Substitute
$$
A_\mu^{\mathrm{pred}}=\Omega_\mu\otimes 1+1\otimes A_\mu^{\mathrm{int}} .
$$
The cross commutators vanish because $(\Omega_\mu\otimes 1)(1\otimes A_\nu^{\mathrm{int}})=\Omega_\mu\otimes A_\nu^{\mathrm{int}}=(1\otimes A_\nu^{\mathrm{int}})(\Omega_\mu\otimes 1)$. Hence
$$
\mathcal F_{\mu\nu}^{\mathrm{pred}}
=
(\partial_\mu\Omega_\nu-\partial_\nu\Omega_\mu+[\Omega_\mu,\Omega_\nu])\otimes 1
+
1\otimes(\partial_\mu A_\nu^{\mathrm{int}}-\partial_\nu A_\mu^{\mathrm{int}}+[A_\mu^{\mathrm{int}},A_\nu^{\mathrm{int}}]),
$$
which proves the factorization.

For the loop statement, put $A=a^\mu A_\mu^{\mathrm{pred}}(x)$, $B=b^\mu A_\mu^{\mathrm{pred}}(x)$, and $\partial_a=a^\mu\partial_\mu$, $\partial_b=b^\mu\partial_\mu$. The transport equation gives
$$
U_a(x)=I-A+\frac12(A^2-\partial_aA)+O(3),
\qquad
U_b(x)=I-B+\frac12(B^2-\partial_bB)+O(3),
$$
where $O(3)$ is bounded in operator norm by a constant times $(|a|+|b|)^3$ on the chosen chart. Taylor expansion at the displaced starting points gives the corresponding $U_b(x+a)$ and $U_a(x+b)$. The positively oriented boundary transport is
$$
U_{\square(a,b)}^{\mathrm{pred}}
=U_b(x)^{-1}U_a(x+b)^{-1}U_b(x+a)U_a(x).
$$
Multiplication cancels the first-order and pure $a^2,b^2$ terms and gives
$$
U_{\square(a,b)}^{\mathrm{pred}}
=I-\partial_aB+\partial_bA-[A,B]+O(3)
=I-\mathcal F_{\mu\nu}^{\mathrm{pred}}(x)a^\mu b^\nu+O(3),
$$
giving the stated holonomy expansion. Finally, on the spin branch the standard spin representation of the Levi-Civita curvature is $R_{\mu\nu}(\Omega)=\frac14R_{\mu\nu ab}\gamma^{ab}$, and the tetrad identifies $R_{\mu\nu ab}$ with $R^\rho{}_{\sigma\mu\nu}$. The internal term is exactly the gauge curvature by Definition G.4.1 and Theorem G.4b. For a smooth $U(1)$ connection on a simply connected neighborhood, Corollary G.4a.1 gives the equivalence between vanishing curvature and a pure-gauge connection. For the full spin--internal product connection, the implication from $\mathcal F_{\mu\nu}^{\mathrm{pred}}=0$ to a pure-gauge frame requires a separate flat-connection trivialization result for a smooth connection on a connected, simply connected neighborhood. Corollary G.4a.1 does not establish that non-Abelian implication. A pure-gauge product connection has zero curvature by direct substitution. ∎

## 11.7.2 Dissipative Companion to Predictive Holonomy

Theorem 47 identifies $\mathcal F_{\mu\nu}^{\mathrm{pred}}$ as the curvature of product-connection transport, with Riemann curvature and internal gauge field strength obtained by projection. Its finite Lorentz-spin factor is not generally unitary for a positive Hermitian fibre metric. A quantum-state transport interpretation therefore requires the additional Hermitian compatibility and unitary closed-transport certificate of Theorem 48c on the admitted curves. On that branch, a retained subsystem may have open dynamics because it is part of a larger closed predictive ledger. A completed reset supplies the finite transfer and entropy ledger of Proposition E.2a; a refresh/minorization branch additionally supplies strict trace-distance contraction (Appendix E, Lemma E.1). The reduced-state transport is then described by a CPTP map under its separately registered open-system hypotheses.

**Infinitesimal Transport Structure.**
Let $\mathcal{E}_{\Delta\tau}$ denote the CPTP transport channel associated with proper time displacement $\Delta\tau$ along a timelike worldline in emergent coordinates. On a finite-dimensional reduced fibre, assume that after a fixed unitary identification of the fibres these channels form a strongly continuous one-parameter CPTP semigroup for $\Delta\tau\ge0$. Its bounded generator then admits the standard GKSL decomposition [Gorini, Kossakowski & Sudarshan 1976; Lindblad 1976]:
$$
\mathcal{E}_{\Delta\tau}(\rho) = \rho + \Delta\tau \, \mathcal{L}(\rho) + O(\Delta\tau^2),
$$
$$
\mathcal{L}(\rho) = -i[H, \rho] + \sum_a \left( L_a \rho L_a^\dagger - \frac{1}{2}\{L_a^\dagger L_a, \rho\} \right),
$$
Here $H$ is a self-adjoint frequency generator, equal to the physical Hamiltonian divided by $\hbar$, and the $\{L_a\}$ encode dissipation and decoherence with the units required for $\mathcal L$ to have inverse-time dimension.

For transport along a smooth oriented curve $\gamma:[0,1]\to M$, assume the branch supplies a measurable family $\mathcal L_{\gamma,s}$ such that $\mathcal L_{\gamma,s}$ is a GKSL generator for almost every $s$ and its coefficients satisfy the boundedness conditions required for the evolution equation. Define
$$
\mathcal E_\gamma
=
\overleftarrow{\mathcal P}
\exp\!\left(\int_0^1\mathcal L_{\gamma,s}\,ds\right).
$$
Then the propagator is CPTP. A representation $\mathcal L_{\gamma,s}=\dot\gamma^\mu(s)\mathcal L_\mu$ is admissible only when this contracted generator has GKSL form along the selected orientation; directionwise GKSL form of the individual $\mathcal L_\mu$ does not imply that condition.

* The **Hamiltonian part** describes unitary dynamics on the declared positive-Hermitian reduced-state carrier. Its identification with the product connection of Theorem 47 requires the unitary-compatibility and Hamiltonian-matching certificate of Theorem 48c.
* The **dissipative part** $\{L_{\mu,a}\}$ describes the registered open-system loss of coherence or distinguishability. Strict trace-distance contraction requires its separate channel certificate. On the corresponding effective-action branch, Section X.5 supplies the Schwinger--Keldysh/CTP noise and response description.

**Chronometric Phase and Curvature-Dephasing.**
A concrete gravitational example appears in Appendix S, where differential proper-time accumulation induces phase gradients. For an internal clock transition $i\leftrightarrow j$ with constant nonzero energy splitting
$$
\Delta E_{ij}:=E_i-E_j\ne0,
$$
and for two branches with proper times $\tau_0(t)$ and $\tau_1(t)$ relative to the same external bookkeeping parameter $t$, define the chronometric phase difference
$$
\Theta_{ij}(t):=-\frac{\Delta E_{ij}}{\hbar}\bigl(\tau_1(t)-\tau_0(t)\bigr).
$$
For branches at rest in the chosen static coordinates, in a weak field with $|\Phi|/c^2\ll1$,
$$
\frac{d\tau}{dt}
=
1+\frac{\Phi}{c^2}
+
O\!\left(\frac{\Phi^2}{c^4}\right).
$$
For branch potentials $\Phi_0,\Phi_1$, this gives
$$
|\dot\Theta_{ij}|
=
\frac{|\Delta E_{ij}|}{\hbar}
\left[
\frac{|\Delta\Phi|}{c^2}
+
O\!\left(\frac{\Phi_0^2+\Phi_1^2}{c^4}\right)
\right].
$$
Equivalently,
$$
\mathcal D_{ij}^{\phi}
:=
\frac{\hbar|\dot\Theta_{ij}|}{|\Delta E_{ij}|}
=
\frac{|\Delta\Phi|}{c^2}
+
O\!\left(\frac{\Phi_0^2+\Phi_1^2}{c^4}\right).
$$
This statement is a coherent phase-rate statement. A deterministic, fully tracked $\Theta_{ij}$ is a unitary phase rotation and does not by itself suppress coherence.

**Theorem 47c (Chronometric Curvature-Dephasing Principle).** Work in Fermi normal coordinates $(t,x^m)$ about a freely falling reference worldline on the regular Lorentzian branch, using $x^0=ct$ for the dimensionless metric coefficient $g_{00}$. Assume the metric coefficients are $C^3$ with bounded spatial derivatives through order three on the retained patch. Let the two branch worldlines be timelike and remain at the coordinate locations $x_0^m,x_1^m$ inside that patch, and use the constant nonzero clock gap declared above. Suppose the saturated chronometric ND-RID branch is selected: unresolved proper-time phase slip is represented by the minimal two-level pure-dephasing GKSL generator
$$
\mathcal L_{\mathrm{ch}}^{(ij)}(\rho)
=
L_{ij}\rho L_{ij}^{\dagger}
-\frac12\{L_{ij}^{\dagger}L_{ij},\rho\},
\qquad
L_{ij}:=\sqrt{\frac{\Gamma_{\mathrm{ch}}^{(ij)}}{2}}\bigl(|i\rangle\langle i|-|j\rangle\langle j|\bigr),
$$
with the minimal chronometric identification
$$
\Gamma_{\mathrm{ch}}^{(ij)}:=|\dot\Theta_{ij}|.
$$
Then the residual dephasing rate is
$$
\Gamma_{\mathrm{ch}}^{(ij)}
=
\frac{|\Delta E_{ij}|}{\hbar}
\left[
\frac{|\Delta\Phi|}{c^2}
+
O\!\left(\frac{\Phi_0^2+\Phi_1^2}{c^4}\right)
\right],
$$
and the normalized dephasing invariant is
$$
\mathcal D_{ij}^{\Gamma}
:=
\frac{\hbar\Gamma_{\mathrm{ch}}^{(ij)}}{|\Delta E_{ij}|}
=
\frac{|\Delta\Phi|}{c^2}
+
O\!\left(\frac{\Phi_0^2+\Phi_1^2}{c^4}\right).
$$
In Fermi normal coordinates,
$$
g_{00}(t,x)=-1-R_{0m0n}(t,0)x^m x^n+O(|x|^3),
$$
hence
$$
\frac{\Delta\Phi}{c^2}
=
\frac12 R_{0m0n}(t,0)(x_1^m x_1^n-x_0^m x_0^n)
+
O(|x_0|^3+|x_1|^3).
$$
For a reference-anchored branch pair $x_0^m=0$, $x_1^m=L_q^m$,
$$
\Gamma_{\mathrm{ch}}^{(ij)}
=
\frac{|\Delta E_{ij}|}{2\hbar}
\left|
R_{0m0n}(t,0)L_q^mL_q^n
\right|
+
O\!\left(\frac{|\Delta E_{ij}|}{\hbar}|L_q|^3\right).
$$
For a branch pair centered at $X^m$ with $x_0^m=X^m-\frac12L_q^m$ and $x_1^m=X^m+\frac12L_q^m$,
$$
\Gamma_{\mathrm{ch}}^{(ij)}
=
\frac{|\Delta E_{ij}|}{\hbar}
\left|
R_{0m0n}(t,0)X^mL_q^n
\right|
+
O\!\left(\frac{|\Delta E_{ij}|}{\hbar}\bigl(|X|^2|L_q|+|X||L_q|^2+|L_q|^3\bigr)\right).
$$

*Proof.* The weak-field relation $d\tau/dt=1+\Phi/c^2+O(c^{-4})$ gives
$$
\dot\Theta_{ij}
=
-\frac{\Delta E_{ij}}{\hbar}
\left(
\frac{d\tau_1}{dt}-\frac{d\tau_0}{dt}
\right)
=
-\frac{\Delta E_{ij}}{\hbar}\frac{\Delta\Phi}{c^2}
+
O(c^{-4}),
$$
which proves the phase-rate invariant. For the stated GKSL generator, the off-diagonal element in the $\{|i\rangle,|j\rangle\}$ basis obeys
$$
\frac{d}{dt}\rho_{ij}
=
-\Gamma_{\mathrm{ch}}^{(ij)}\rho_{ij}.
$$
Thus the coherence envelope satisfies
$$
|\rho_{ij}(t)|=|\rho_{ij}(0)|\exp\!\left[-\int_0^t\Gamma_{\mathrm{ch}}^{(ij)}(s)\,ds\right].
$$
The branch identification $\Gamma_{\mathrm{ch}}^{(ij)}=|\dot\Theta_{ij}|$ gives the displayed dephasing formula.

For the curvature form, the Fermi expansion gives
$$
-g_{00}(t,x)=1+R_{0m0n}(t,0)x^m x^n+O(|x|^3).
$$
Taking the square root yields
$$
\frac{d\tau}{dt}
=
\sqrt{-g_{00}}
=
1+\frac12 R_{0m0n}(t,0)x^m x^n+O(|x|^3).
$$
Comparing with $d\tau/dt=1+\Phi/c^2+O(c^{-4})$ gives
$$
\frac{\Phi(x)}{c^2}
=
\frac12 R_{0m0n}(t,0)x^m x^n+O(|x|^3).
$$
Subtracting the branch values proves
$$
\frac{\Delta\Phi}{c^2}
=
\frac12R_{0m0n}(t,0)(x_1^m x_1^n-x_0^m x_0^n)+O(|x_0|^3+|x_1|^3).
$$
Setting $(x_0,x_1)=(0,L_q)$ gives the reference-anchored formula. For the centered pair, the $C^3$ Taylor remainder $r(x)$ satisfies $|\nabla r(x)|\le C|x|^2$ on the retained patch. Integrating its derivative along the segment from $X-\frac12L_q$ to $X+\frac12L_q$ bounds the remainder difference by $C'|L_q|(|X|+|L_q|)^2$, which has the order stated in the theorem. The quadratic part satisfies
$$
x_1^m x_1^n-x_0^m x_0^n
=
X^mL_q^n+L_q^mX^n,
$$
and contraction with the symmetric tensor $R_{0m0n}$ gives $2R_{0m0n}X^mL_q^n$, hence the centered-pair formula after the prefactor $\frac12$. ∎

**Corollary 47d (Geometry-Reversal Complement to the Clock-Gap Law).** On the saturated chronometric branch of Theorem 47c, perform a registered exchange of the two branch geometries,
$$
(\tau_0,\tau_1)\mapsto(\tau_1,\tau_0),
\qquad
\Theta_{ij}\mapsto-\Theta_{ij},
\qquad
\Gamma_{\mathrm{ch}}^{(ij)}\mapsto\Gamma_{\mathrm{ch}}^{(ij)}.
\tag{47d.1}
$$
In the retained weak-field notation this exchange sends $\Delta\Phi\mapsto-\Delta\Phi$. Thus a forward-locked exchange test separates the odd signed coherent phase from the even saturated dephasing envelope. Together with Theorem S.7.3a's exact same-geometry multi-gap ratio, this gives a two-axis chronometric signature without rederiving the owner theorem.

*Proof.* The definition $\Theta_{ij}=-(\Delta E_{ij}/\hbar)(\tau_1-\tau_0)$ makes the first transformation exact under branch exchange. The saturated identification $\Gamma_{\mathrm{ch}}^{(ij)}=|\dot\Theta_{ij}|$ makes the rate invariant. Equation S.54 gives the stated weak-field potential reversal, and Theorem S.7.3a supplies the independent clock-gap ratio. ∎

**Theorem 47e (Covariant Commuting-Dephasing Bundle Normal Form).** Let $\mathcal W\to M$ be a finite-rank Hermitian bundle. Suppose a common connection supplies smooth Hermitian endomorphism sections $H,L_1,\ldots,L_r$ satisfying
$$
[H,L_a]=[L_a,L_b]=0,
\tag{47e.1}
$$
and suppose their local representatives transform by conjugation on every bundle overlap. For a fixed real symmetric matrix $C\succeq0$, define
$$
\mathcal L(\rho)
=-\frac{i}{\hbar}[H,\rho]
+\sum_{a,b=1}^r C_{ab}
\left(L_a\rho L_b-\frac12\{L_bL_a,\rho\}\right).
\tag{47e.2}
$$
Then (47e.2) is a globally defined covariant GKSL generator. At each specified fibre choose any simultaneous orthonormal eigenbasis,
$$
H|i\rangle=E_i|i\rangle,
\qquad
L_a|i\rangle=\ell_{a i}|i\rangle.
$$
For the autonomous evolution with this fibre generator held constant in time, its exact solution is
$$
\rho_{ij}(t)
=
\exp\!\left[
-\frac{i}{\hbar}(E_i-E_j)t
-\frac t2(\ell_i-\ell_j)^{\mathsf T}C(\ell_i-\ell_j)
\right]\rho_{ij}(0).
\tag{47e.3}
$$
Hence a signed branch exchange that reverses $E_i-E_j$ and $\ell_i-\ell_j$ makes the coherent phase odd and the dephasing rate even. Positivity of $C$ is sufficient for complete positivity. If the coefficient matrix is tested without that sufficient gate, nonnegative decay of the displayed coherences is equivalent exactly to nonnegativity of its quadratic form on every realized difference vector $\ell_i-\ell_j$; this weaker rate test need not imply complete positivity away from those vectors.

*Proof.* Diagonalize $C=R^{\mathsf T}\operatorname{diag}(\gamma_s)R$ with $\gamma_s\ge0$ and set $M_s=\sum_aR_{sa}L_a$. The dissipator in (47e.2) becomes
$$
\sum_s\gamma_s\left(M_s\rho M_s-\frac12\{M_s^2,\rho\}\right),
$$
which is GKSL. Conjugation covariance of every $H,L_a$ makes the complete superoperator agree on overlaps. At each fibre, diagonalize $H$ and then diagonalize the commuting Hermitian $L_a$ successively inside the invariant eigenspaces. This gives a simultaneous orthonormal eigenbasis at that fibre without asserting a smooth eigenbasis across degeneracies. Direct evaluation on $|i\rangle\langle j|$ gives the scalar generator eigenvalue $-i(E_i-E_j)/\hbar-\tfrac12(\ell_i-\ell_j)^{\mathsf T}C(\ell_i-\ell_j)$. The autonomous scalar differential equation gives (47e.3). The parity statement follows because the Hamiltonian term is linear in the signed differences while the dissipative term is quadratic. The final equivalence follows by the sign of each realized decay rate; positivity on those difference vectors alone need not imply positivity of $C$. ∎

**Testable PU discriminator against self-gravity collapse models.**
The deterministic chronometric phase-rate invariant and the saturated chronometric ND-RID dephasing branch scale linearly with the magnitude of the internal energy splitting at the same geometry. For two-branch interferometers engineered so that the branches have the same mass-density distribution but differ by internal clock splitting, the PU chronometric branch predicts the following ratio whenever the reference rate $\Gamma_{\mathrm{ch}}^{(kl)}$ is nonzero:
$$
\frac{\Gamma_{\mathrm{ch}}^{(ij)}}{\Gamma_{\mathrm{ch}}^{(kl)}}
=
\frac{|\Delta E_{ij}|}{|\Delta E_{kl}|}
$$
for transitions measured in the same geometry. Penrose-Diósi-type self-gravity collapse rates depend primarily on branch mass-density difference and therefore do not produce this energy-gap ratio when the mass-density difference is held fixed. Conversely, because the PU branch is curvature-controlled, the reference-anchored tidal contribution vanishes at this order when $R_{0m0n}=0$ and is invariant under removal of pure uniform acceleration in a freely falling Fermi frame.

This identifies a precise sense in which curvature, clock phase, and ND-RID dephasing belong to the same operational transport structure: the holonomy component defines the emergent geometry (Theorem 47), the chronometric phase measures proper-time mismatch along that geometry, and the saturated chronometric companion describes coherence loss under the pure-dephasing branch postulated in Theorem 47c and Appendix S, Section S.7.

**11.8 Fibre Bundle Structure**

Unifying external spacetime and internal MPU degrees of freedom requires a principal fibre bundle structure.

**11.8.1 Theorem 48 (Fibre-Bundle Representation)**

Assume in addition to Theorems 44-46 that the emergent Lorentzian manifold $M$ is oriented, time-oriented, and spin, and that the internal rank-$d_0$ Hilbert bundle carries a Hermitian structure. Then the combined spin and unitary frame data define a principal fibre bundle $P(M,G)$ over $M$, with structure group $G=\text{Spin}(1,3)\times U(d_0)$. This construction supplies a kinematic carrier and its associated bundles; it does not by itself select an MPU state, a connection, an action, a generator, or the full network dynamics.

1.  **Fibre:** At each spacetime point $x \in M$, the fibre $\pi^{-1}(x)$ represents the space of possible local reference frames. It consists of pairs $(\mathcal{F}_x, \mathcal{P}_x)$, where $\mathcal{F}_x$ is a spin frame above an oriented, time-oriented orthonormal frame of $T_x M$, and $\mathcal{P}_x$ is a unitary frame for the internal Hilbert fibre $E_x \cong \mathbb{C}^{d_0}$.
2.  **Structure Group Action:** An element $g = (\Lambda, u) \in G$, where $\Lambda \in \text{Spin}(1,3)$ and $u \in U(d_0)$, acts freely and transitively on the fibre elements by $(\mathcal{F}_x, \mathcal{P}_x) \mapsto (\Lambda \cdot \mathcal{F}_x, u \cdot \mathcal{P}_x)$. The $U(d_0)$ factor represents the local gauge freedom in choosing the internal reference basis.
3.  **Associated Bundles:** Physical fields are sections of associated vector bundles $E_\rho = P \times_\rho V_\rho$. For example, the MPU state amplitude field $\Psi(x)$, taking values $|\psi(x)\rangle \in E_x$, is a section of the vector bundle associated with the fundamental representation of $U(d_0)$ and, when required, a spinor representation of $\text{Spin}(1,3)$.
4.  **Connection:** A connection 1-form $A_\mu(x)$ valued in the Lie algebra $\mathfrak{g} = \mathfrak{spin}(1,3) \oplus \mathfrak{u}(d_0)$ defines parallel transport and allows consistent comparison of field values between infinitesimally separated points. It decomposes as $A_\mu = \omega_\mu \oplus A_\mu^{\text{int}}$, where $\omega_\mu$ is the spin connection compatible with $g_{\mu\nu}$ and $A_\mu^{\text{int}}$ is the internal gauge connection. The corresponding covariant derivative $D_\mu$ acting on a field $\Phi$ transforming under representation $\rho = (\rho^{\text{Lor}}, \rho^{\text{int}})$ is:
$$D_{\mu}\Phi = \partial_{\mu}\Phi + \rho_{*}(A_{\mu})\Phi = \partial_{\mu}\Phi + \rho^{\mathrm{Lor}}_{*}(\omega_{\mu})\Phi + \rho^{\mathrm{int}}_{*}(A^{\mathrm{int}}_{\mu})\Phi \tag{67}$$
where $\rho_*$ denotes the corresponding Lie algebra representation. This ensures $D_\mu \Phi$ transforms covariantly under local frame and internal-basis changes.
5.  **Curvature and Dynamics:** The curvature 2-form $F_{\mu\nu} = \partial_\mu A_\nu - \partial_\nu A_\mu + [A_\mu, A_\nu]$ decomposes into the spacetime curvature determined by $\omega_\mu$ and the internal gauge field strength determined by $A_\mu^{\text{int}}$. The internal dynamics may then be expressed by Yang-Mills type equations sourced by the coarse-grained MPU currents.

*Proof.* Because $M$ is Lorentzian, oriented, and time-oriented, it has a principal $SO^+(1,3)$ bundle of orthonormal frames. The spin hypothesis lifts this bundle to a principal $\text{Spin}(1,3)$ bundle $P_{\mathrm{Spin}}(M)$. The internal Hermitian rank-$d_0$ bundle has principal unitary frame bundle $P_U(E)$. Their fibre product
$$
P := P_{\mathrm{Spin}}(M) \times_M P_U(E)
$$
is a principal $\text{Spin}(1,3)\times U(d_0)$ bundle whose fibre over $x$ consists exactly of the pairs $(\mathcal{F}_x,\mathcal{P}_x)$ described above. The right action is free and transitive because each factor action is free and transitive. For any representation $\rho$ of the product group, the standard associated-bundle construction gives $E_\rho=P\times_\rho V_\rho$. A principal connection on the product bundle is equivalently a pair $(\omega_\mu,A_\mu^{\mathrm{int}})$, so the covariant derivative has the displayed direct-sum form, and the curvature splits because the Lie algebra is the direct sum $\mathfrak{spin}(1,3)\oplus\mathfrak{u}(d_0)$. These are the standard bundle constructions of gauge theory and general relativity, now applied with the hypotheses verified in the present setting [Nakahara 2003, §§9.4, 10.1–10.4]. QED

**11.8.2 Theorem 48b (Global Product-Bundle Gluing).** Let $M_{\mathrm{reg}}$ be the connected, oriented, time-oriented regular Lorentzian branch, $F_{SO^+(1,3)}\to M_{\mathrm{reg}}$ its orthonormal frame bundle, and $E\to M_{\mathrm{reg}}$ the rank-$d_0$ Hermitian predictive bundle determined by local predictive fibers and their unitary transition maps. Assume
$$
w_2(M_{\mathrm{reg}}) \;=\; 0.
$$
Then:

1. $F_{SO^+(1,3)}$ admits a spin lift $P_{\mathrm{spin}}\to M_{\mathrm{reg}}$ with structure group $\mathrm{Spin}(1,3)$.
2. The unitary bundle $E$ is associated to a principal $U(d_0)$-bundle $P_{\mathrm{int}}\to M_{\mathrm{reg}}$.
3. The fiber product $P:=P_{\mathrm{spin}}\times_{M_{\mathrm{reg}}} P_{\mathrm{int}}$ is a principal bundle with structure group $G=\mathrm{Spin}(1,3)\times U(d_0)$.

Theorem 48 therefore becomes exact globally on the spin-admissible branch.

*Proof.* Choose a good cover $\{U_i\}$ of $M_{\mathrm{reg}}$. The oriented time-oriented orthonormal frame bundle has transition maps $\Lambda_{ij}:U_{ij}\to SO^+(1,3)$ satisfying the Čech cocycle condition. The condition $w_2(M_{\mathrm{reg}})=0$ is exactly the obstruction-vanishing condition for lifting $\Lambda_{ij}$ to $\widetilde\Lambda_{ij}:U_{ij}\to\mathrm{Spin}(1,3)$. Similarly the Hermitian bundle $E$ has unitary transition maps $u_{ij}:U_{ij}\to U(d_0)$ with the cocycle condition. Then
$$
g_{ij} \;:=\; (\widetilde\Lambda_{ij},u_{ij}) : U_{ij}\to\mathrm{Spin}(1,3)\times U(d_0)
$$
is again a cocycle, hence defines a principal $\mathrm{Spin}(1,3)\times U(d_0)$-bundle. ∎

**Corollary 48b.1 (Exact Obstruction).** On a connected oriented time-oriented branch, the only obstruction to globalizing the $\mathrm{Spin}(1,3)$ factor is $w_2(M_{\mathrm{reg}})$. Theorem 48 is therefore globally exact on the spin-admissible branch $w_2=0$ and otherwise only local.

*Proof.* Orientation and time orientation reduce the Lorentzian orthonormal frame bundle to structure group $SO^+(1,3)$. Choose a good cover $\{U_i\}$ and transition maps $\Lambda_{ij}:U_{ij}\to SO^+(1,3)$. Choose local lifts $\widetilde\Lambda_{ij}:U_{ij}\to\mathrm{Spin}(1,3)$. On every triple overlap their product lies in the kernel $\{\pm1\}$ of $\mathrm{Spin}(1,3)\to SO^+(1,3)$:
$$
c_{ijk}
:=\widetilde\Lambda_{ij}\widetilde\Lambda_{jk}\widetilde\Lambda_{ki}
\in\{\pm1\}.
$$
The signs $c_{ijk}$ form a Čech $2$-cocycle representing $w_2(M_{\mathrm{reg}})$. If $w_2=0$, there is a sign-valued Čech $1$-cochain $b_{ij}$ with $c_{ijk}=b_{ij}b_{jk}b_{ki}$. Replacing $\widetilde\Lambda_{ij}$ by $b_{ij}\widetilde\Lambda_{ij}$ makes the triple products equal to $1$, so the lifts form a spin cocycle. Conversely, any spin cocycle has all triple products equal to $1$, so its obstruction class vanishes. Thus a global spin lift exists exactly when $w_2=0$.

The Hermitian bundle $E$ already has unitary transition maps $u_{ij}:U_{ij}\to U(d_0)$ satisfying $u_{ij}u_{jk}u_{ki}=I$. Once the spin cocycle exists, $(\widetilde\Lambda_{ij},u_{ij})$ is a $\mathrm{Spin}(1,3)\times U(d_0)$ cocycle; the unitary factor introduces no additional lifting problem. Hence the only obstruction to the stated product construction is $w_2(M_{\mathrm{reg}})$. ∎

**Definition 48b.2 (Tangential-Structure Certificate $\mathfrak C_{\mathrm{tan}}$).** A tangential-structure certificate for retained fermionic response sectors is a finite record
$$
\mathfrak C_{\mathrm{tan}}
=
(\Sigma_{\mathrm{ferm}},\;\tau_{\mathrm{tan}},\;\{g_{ij}\},\;\alpha_{\mathrm{anom}},\;\mathcal B_{\mathrm{bord}},\;\mathcal P_{\mathrm{cost}},\;\text{forward lock})
$$
where $\Sigma_{\mathrm{ferm}}$ lists the retained fermionic sectors, $\tau_{\mathrm{tan}}$ specifies the claimed tangential target (strict spin, $\mathrm{Spin}^c$, or gauge-twisted spin), $\{g_{ij}\}$ records the relevant Čech transition data on a good cover, $\alpha_{\mathrm{anom}}$ and $\mathcal B_{\mathrm{bord}}$ record anomaly/bordism cancellation, and $\mathcal P_{\mathrm{cost}}$ records the PCE comparison against surplus double-cover or sign-holonomy bookkeeping. The strict-spin target requires
$$
w_1(M_{\mathrm{reg}})=0,
\qquad
w_2(M_{\mathrm{reg}})=0.
$$
A $\mathrm{Spin}^c$ target instead records the corresponding lift condition, for example $w_2(M_{\mathrm{reg}})=c_1(L)\bmod 2$ for the chosen determinant line, and a gauge-twisted target records the analogous cancellation equation.

**Proposition 48b.3 (Fermionic Sectors Force a Tangential Record, not Always Strict Spin).** On a branch with retained response-active fermionic sectors, global transport requires an accepted $\mathfrak C_{\mathrm{tan}}$ for those sectors. If $\tau_{\mathrm{tan}}$ is strict spin, Theorem 48 is globally exact because the certificate supplies $w_1=w_2=0$. If $\tau_{\mathrm{tan}}$ is $\mathrm{Spin}^c$ or gauge-twisted, the retained fermions are globally defined on that replacement tangential structure, but the strict product bundle $\mathrm{Spin}(1,3)\times U(d_0)$ is not thereby asserted. A branch with no retained fermionic response sectors does not force a spin lift.

*Proof.* Fermionic parallel transport is a response datum, so an obstruction to defining it globally is not removable by a coordinate relabeling. The Čech and anomaly entries of $\mathfrak C_{\mathrm{tan}}$ supply the finite obstruction calculation for the selected tangential target. In the strict-spin case, vanishing $w_1$ and $w_2$ are exactly the orientation and spin-lift conditions, so Corollary 48b.1 applies. In the $\mathrm{Spin}^c$ or twisted cases, the obstruction is cancelled only after including the specified auxiliary gauge data, yielding the corresponding replacement bundle rather than the strict spin product. ∎

**Proposition 48b.4 (Finite Čech Decision Procedure for Tangential Lifts).** Fix a finite good-cover nerve $K$ for a supplied time-oriented Lorentzian branch, its integer and $\mathbb F_2$ coboundary matrices, and cocycle representatives $w_1\in Z^1(K;\mathbb F_2)$ and $w_2\in Z^2(K;\mathbb F_2)$. In the systems below, $b_0\in C^0(K;\mathbb F_2)$ and $b_1\in C^1(K;\mathbb F_2)$. Then:

1. the strict-spin obstruction vanishes exactly when the finite systems
   $$
   \delta_0b_0=w_1,
   \qquad
   \delta_1b_1=w_2
   \tag{48b.4.1}
   $$
   are solvable over $\mathbb F_2$;
2. a $\mathrm{Spin}^c$ lift exists exactly when $\delta_0b_0=w_1$ is solvable and there are an integral cocycle $c\in Z^2(K;\mathbb Z)$ and $b_1\in C^1(K;\mathbb F_2)$ such that
   $$
   c\bmod2=w_2+\delta_1b_1;
   \tag{48b.4.2}
   $$
3. for a supplied twist cocycle $\alpha\in Z^2(K;\mathbb F_2)$, the corresponding oriented twisted obstruction vanishes exactly when $\delta_0b_0=w_1$ is solvable and
   $$
   \delta_1b_1=w_2+\alpha
   \tag{48b.4.3}
   $$
   is solvable.

Gaussian elimination over $\mathbb F_2$ decides (48b.4.1) and (48b.4.3), and Smith normal form together with mod-two reduction decides (48b.4.2). These tests decide existence of the stated cohomological lifts for the supplied finite cover. The anomaly, bordism, matter-realization, cost, and forward-lock records remain independent entries of $\mathfrak C_{\mathrm{tan}}$.

*Proof.* A cocycle represents the zero cohomology class exactly when it lies in the image of the preceding coboundary, which proves the orientation, strict-spin, and supplied-twist tests. On the oriented branch, the obstruction to a $\mathrm{Spin}^c$ lift vanishes exactly when $w_2$ has an integral degree-two lift, which is the finite cochain statement (48b.4.2). The stated normal-form algorithms decide membership in these finite images and kernels. ∎

**Corollary 48b.5 (Finite Lift-Moduli Torsor and Exact Count).** Work on an oriented finite good-cover nerve $K$ for which either the strict-spin equation
$$
\delta_1b=w_2
\tag{48b.5.1}
$$
or the equation for a fixed supplied twist
$$
\delta_1b=w_2+\alpha
\tag{48b.5.2}
$$
is solvable over $\mathbb F_2$. Modulo the gauge relation $b\sim b+\delta_0c$, the solution classes form an affine torsor for
$$
H^1(K;\mathbb F_2)=\ker\delta_1/\operatorname{im}\delta_0.
\tag{48b.5.3}
$$
In particular, their exact number is
$$
2^{\beta_1(K)},
\qquad
\beta_1(K)=\dim_{\mathbb F_2}\ker\delta_1-\operatorname{rank}_{\mathbb F_2}\delta_0.
\tag{48b.5.4}
$$
The same row-reduction pass that decides existence therefore classifies and counts every strict-spin or fixed-twist lift on the supplied nerve. Anomaly cancellation, matter coupling, and physical selection among these classes remain separate entries of $\mathfrak C_{\mathrm{tan}}$.

*Proof.* Fix one solution $b_*$. Every other solution has the form $b_*+z$ with $z\in\ker\delta_1$, and every such $z$ gives a solution. Gauge changes identify $z$ and $z+\delta_0c$, so the quotient is the affine space modeled on (48b.5.3). A vector space of dimension $\beta_1(K)$ over $\mathbb F_2$ has $2^{\beta_1(K)}$ elements. Gaussian elimination computes both dimensions and supplies representatives. ∎

**11.8.3 Theorem 48c (Conditional Global CPTP Transport Closure).** Let $P(M_{\mathrm{reg}},\mathrm{Spin}(1,3)\times U(d_0))$ be the principal bundle of Theorem 48, globally exact under Theorem 48b, and let $\mathcal W=S\otimes E$ be its associated spin-internal bundle. Assume:

(i) *Hermitian-compatible transport and Hamiltonian certificate.* A declared positive Hermitian metric on $\mathcal W$ is preserved by the product-connection transport $T_\gamma:\mathcal W_x\to\mathcal W_y$ along the admitted curves. Use unitary local frames for this metric. The record identifies the closed-system channel as $\operatorname{Ad}_{T_\gamma}$ and separately supplies a selected GKSL representation whose Hamiltonian frequency operator is the infinitesimal generator of that declared transport. Any retained environmental Hamiltonian correction must be included in the declared connection or certified absent from that generator. These are additional compatibility premises; a general finite Lorentz-spin connection need not satisfy them.

(ii) *Markovian semigroup limit.* On each registered bounded time window, after the declared unitary identification of successive fibres, the local CPTP evolution has a strongly continuous semigroup limit on the finite-dimensional system endomorphism algebra.

(iii) *Endpoint covariance.* For unitary frame transitions $g_{ij}$, the local transport representatives satisfy
$$
\Phi_\gamma^{(j)}
=\operatorname{Ad}_{g_{ij}(y)}\circ\Phi_\gamma^{(i)}\circ\operatorname{Ad}_{g_{ij}(x)^{-1}},
$$
where $\operatorname{Ad}_U(\rho)=U\rho U^*$. The record supplies the corresponding infinitesimal relation on overlaps, including the derivative of a frame transition along a moving endpoint.

Then each local CPTP transport map admits a finite-dimensional Stinespring realization
$$
\Phi_\gamma(\rho)
=\operatorname{Tr}_{\mathrm{env}}\!\left(U_\gamma(\rho\otimes|0\rangle\langle0|)U_\gamma^*\right),
$$
where $U_\gamma$ is a unitary map from $\mathcal W_x\otimes\mathcal H_{\mathrm{env}}$ to $\mathcal W_y\otimes\mathcal H_{\mathrm{env}}$ after any required finite enlargement. The full dilation unitary has no asserted restriction to the system factor. On the separately certified closed-system branch, the transport is the unitary $T_\gamma$.

In a registered unitary identification, the semigroup generator has GKSL form
$$
\mathcal L(\rho)
=-i[H_D,\rho]
+\sum_a\left(L_a\rho L_a^*-\tfrac12\{L_a^*L_a,\rho\}\right),
$$
with $H_D$ self-adjoint and measured in inverse time; its physical Hamiltonian is $\hbar H_D$. Identification of this Hamiltonian term with the declared product connection uses the independent matching entry of hypothesis (i). The endpoint relations make the resulting evolution globally compatible.

*Proof.* Finite-dimensional Stinespring dilation [Stinespring 1955] gives an isometry $V_\gamma:{\mathcal W}_x\to{\mathcal W}_y\otimes\mathcal H_{\mathrm{env}}$ with $\Phi_\gamma(\rho)=\operatorname{Tr}_{\mathrm{env}}(V_\gamma\rho V_\gamma^*)$. After enlarging the finite environment as necessary, identify $V_\gamma$ with the prescribed action on $\mathcal W_x\otimes|0\rangle$ and complete orthonormal bases to extend it to the displayed unitary $U_\gamma$. This construction does not identify a system-only restriction. Hypothesis (i) supplies the separate closed-system transport and Hamiltonian match.

Hypothesis (ii) satisfies the finite-dimensional Gorini--Kossakowski--Sudarshan--Lindblad classification hypotheses [Gorini, Kossakowski & Sudarshan 1976; Lindblad 1976], giving the displayed generator. For a moving endpoint $y(t)$, put $\mathcal G_t=\operatorname{Ad}_{g_{ij}(y(t))}$. Differentiating the endpoint relation gives
$$
\mathcal L_t^{(j)}
=\dot{\mathcal G}_t\mathcal G_t^{-1}
+\mathcal G_t\mathcal L_t^{(i)}\mathcal G_t^{-1}.
$$
Because $g_{ij}$ is unitary, $\dot g_{ij}g_{ij}^{-1}$ is anti-Hermitian, and the first term is its commutator action, hence a Hamiltonian generator. Unitary conjugation preserves the GKSL form of the remaining term. Thus the local evolutions agree on overlaps, including time-dependent frame changes. Hypothesis (i), rather than dilation or the semigroup theorem, supplies their declared connection interpretation. ∎

Theorem 48c closes the gap between Theorem 47 (predictive holonomy as curvature) and Theorem 48 (fibre-bundle representation): under the stated open-system hypotheses, the CPTP transport law is a completion of the same underlying bundle transport.

**Resolution ledger 48d-R1 (Finite Operational-Continuum Classifications).** Each row registers the exact mathematical artifact shown; the physical continuum, carrier, calibration, or experiment named by the target remains an independent required record.

| Target | Exact domain and premises | Equivalence and budget | Registered polarity | Verifier, falsifier and nonvacuity | Provenance and downstream consumers |
|:--|:--|:--|:--|:--|:--|
| `TV-CONT-01` | Sequences of connected weighted graphs with common $\delta_n$ and positive edge weights; the positive branch assumes (64g), $\epsilon_n\to0$, and bounded tested-ball diameters, while the negative branch is the displayed path family. | Metrics are compared by the identity correspondence on the same vertices and by equality of metric subsequential limits on tested balls. Budget: every edge at each submitted level and the symbolic path sequence. | Asymptotically unit edge comparison is `positive-discharge`; fixed-constant bi-Lipschitz comparison forcing equal limits is `negative-refutation`. | Check (64g)--(64h), identity distortion, and $d'_n=2d_n$. A violated metric bound or equal endpoint limits in the displayed path family falsifies the corresponding artifact. The unit path family proves nonvacuity. | Source-internal finite metric geometry. Consumers: Theorem 35b, propagation representatives, and `RT-T8`. |
| `TV-CONT-02` | The two-point admissible class of Proposition 43a with one regular point, one irregular point, and the displayed decomposed potential. | Equality preserves the regular/irregular labels and both potential components. Budget: both points and the sole candidate regular comparator. | Bare-PCE regular-minimum selection is `negative-refutation`. | Evaluate both total costs and the strict-comparator inequality (11.43.1). A strict regular comparator in this class falsifies the artifact. The displayed two-point class proves nonvacuity. | Source-internal finite optimization countermodel. Consumers: Theorem 43 and the regular-global-core gate. |
| `TV-CONT-03` | The refinement family $X_n=\{a_n,b_n\}$ with the two defects in (43.5b.1); premises retain only separate existential-vanishing sequences. | Witnesses are equivalent only when one selected refinement sequence carries both defect records. Budget: two candidates per level over the symbolic countable family. | Separate componentwise convergence forcing a common sequence is `negative-refutation`. | Evaluate both constant witness sequences and exhaust the two choices at each level. A sequence on which both defects vanish falsifies the artifact. The two supplied sequences prove nonvacuity. | Source-internal finite-per-level convergence countermodel. Consumers: Theorem 43.5 and the joint continuum certificate. |
| `TV-CONT-04` | The permutation-invariant finite functional (67f) together with its scalar/metric-volume and fixed-chart/density continuum dictionaries. | Finite arrays are equivalent under simultaneous vertex relabeling; continuum outputs are compared under their declared field type and measure. Budget: every submitted finite array plus the two symbolic Riemann-limit dictionaries. | Finite relabeling entailing a unique diffeomorphism-covariant continuum law is `nonentailment`. | Check permutation invariance and the Jacobian under a non-unit coordinate change. If both dictionaries acquire the same transformation law without extra typing data, the artifact is falsified. A nonconstant-Jacobian chart proves nonvacuity. | Source-internal finite-to-continuum countermodel. Consumers: Hypotheses 11.5.3.1--11.5.3.3 and the continuum action. |
| `TV-CONT-05` | Four-dimensional cotangent space with the nondegenerate symbols $q_L$, $q_U$, and $q_L^2$ of Proposition 46a.2. | Symbols are compared by characteristic set, inertia, and polynomial order; sharing a cone does not identify different inertia or degree. Budget: the three displayed exact symbols. | Cone-only signature index and differential-order selection are `negative-refutation`. | Compute both inertia pairs and verify $q_L^2=0\iff q_L=0$. Forced Lorentzian inertia or second order from those common zeros falsifies the artifact. The three symbols prove nonvacuity. | Source-internal exact quadratic-form algebra. Consumers: Definition 46a.1, the one-time Cauchy gate, and `RT-T8`. |
| `TV-CONT-06` | Two connected globally hyperbolic static four-manifolds locally isometric on the common causally convex diamond $U$ but with the nonhomeomorphic Cauchy surfaces of Corollary 46g.1. | Records are equivalent when every retained subdiamond has the same inclusion, tip orientation, local volume, and fixed-density capacity valuation; global spaces remain distinguished by homeomorphism type. Budget: any finite subdiamond family inside $U$ and the two explicit completions. | Global injectivity of an arbitrary finite diamond subrecord is `negative-refutation`. | Verify the local isometry, causal convexity, and fundamental groups $0$ and $\mathbb Z$. A differing retained local record or homeomorphic Cauchy surfaces falsifies the witness. The two products prove nonvacuity. | Source-internal Lorentzian/topological countermodel. Consumers: Theorems 46b and 46g and $\mathfrak C_{\mathrm{TB}}^\Omega$. |
| `TV-CONT-07` | One finite-dimensional tangent response space, its supplied $g^{sp}$-orthogonal intertwiner group $\mathcal G$, and positive $g^{sp}$-self-adjoint comparisons $B$. | Comparisons are equivalent under the declared $\mathcal G$ action; budget is the complete finite matrix commutant. | The exact commutant test for scalarization is `positive-discharge`, with anisotropic positive witnesses when the self-adjoint commutant is larger than $\mathbb RI$. | Solve (45e.1), take the self-adjoint commutant, and shift a nonscalar member by $cI$ when needed. A nonscalar positive natural comparison with self-adjoint commutant $\mathbb RI$, or failure to construct one in the larger case, falsifies the artifact. Scalar and reducible representations prove nonvacuity. | Source-internal finite representation theory. Consumers: (45b.3), Fisher/propagation naturality, and the scale certificate. |
| `TV-CONT-08` | A supplied finite good-cover nerve with integer and $\mathbb F_2$ coboundary matrices, cocycles $w_1,w_2$, and, where applicable, an integral lift or supplied twist $\alpha$. | Cocycles are equivalent modulo the stated coboundaries; budget is every finite cochain entry and the three finite systems (48b.4.1)--(48b.4.3). | Exact strict-spin, $\mathrm{Spin}^c$, and supplied-twist existence decisions are `positive-discharge`. | Run Gaussian elimination and Smith normal form with mod-two reduction. A solver answer disagreeing with the represented cohomology class falsifies the artifact. Zero and nonzero finite cocycles prove nonvacuity. | Source-internal finite cohomology. Consumers: $\mathfrak C_{\mathrm{tan}}$, Theorem 48b, and matter gluing. |
| `TV-CONT-09` | The saturated chronometric branch of Theorem 47c under the registered geometry exchange, together with Theorem S.7.3a's same-geometry gap comparison. | Runs are equivalent after preserving branch labels, gap labels, orientation, and the common geometry ledger. Budget: two exchanged geometries and every submitted finite transition pair. | Odd coherent phase, even saturated dephasing, and the owner theorem's multi-gap ratio are `positive-discharge` on this branch. | Reverse the branches in (47d.1) and evaluate the same-geometry rate ratio. An even signed phase, odd saturated rate, or failed owner ratio falsifies the artifact. A nonzero proper-time rate difference and two nonzero gaps prove nonvacuity. | Source-internal conditional chronometric algebra consuming owner Theorem S.7.3a. Consumers: CPTP transport and the reversal/multi-gap protocol. |
| `TV-CONT-10` | Definition 46e.1's iid flat-uniform Alexandrov-interval sample conditioned on $N$ at $D=4$, and Definition 46h's finite metric chart with $\sigma_*>0$, radius, derivative-Lipschitz, and metric-chart bounds. | Samples are equivalent by their causal comparability record; chart candidates are compared in the certificate-fixed response and tensor norms. Budget: all $\binom N2$ pair indicators and the complete finite Jacobian/chart record inside (46i.1). | The exact mean $1/10$, concentration bound, and conditional inverse-stability estimate are `positive-discharge`. | Recompute (46e.1.2)--(46e.1.4) and the singular-value/Taylor bounds (46i.1)--(46i.3). Wrong expectation, tail, or inverse bound falsifies the artifact. The flat $D=4$ model and any full-column-rank chart prove nonvacuity. | Source-internal probability and finite-dimensional analysis. Consumers: the dimension cross-certificate, metric conditioning, and the forward-locked sampling test. |

**11.9 Role of MPU Stress-Energy Tensor**

Theorem 47 and the connection decomposition of Theorem 48 identify non-frame-removable inhomogeneity of predictive transport with curvature of the predictive connection. A macroscopic MPU stress-energy source $T_{\mu\nu}^{(MPU)}$ is available on the separate Appendix B branch carrying admissible bounded-variation coarse-graining, a paired or unique continuum limit, the momentum-flux and Belinfante derivative certificates, variational first-variation consistency, local equilibrium, and the global horizon-flux consistency and quadrature record of Theorem B.8d. On the operational-continuum, local-horizon, area-law, KMS/Clausius, and finite Einstein-closure branch of Section 12, that same certified tensor is the source on the right-hand side of the emergent field equation. Theorem 46 supplies only a uniform operational causal-speed upper bound. The identification $c=\delta/\tau_{\min}$ additionally requires the separately accepted normalized uniform-weight one-link-attainment branch of Appendix E, Theorem E.10.2; only on that branch is the attained value tied to the registered costs and timing of information propagation. Its promotion to a Lorentzian light cone is the Appendix O branch imported by Corollary 46a, and the exact values of $\delta$ and $\tau_{\min}$ inherit the Appendix Q discretization branches.
