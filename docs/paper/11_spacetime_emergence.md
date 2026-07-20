# 11. Emergence of Spacetime Geometry (Operational Continuum Branch)

The topological-bandwidth result below is a conditional band-limited completion on an accepted $\mathfrak C_{\mathrm{TB}}^\Omega$. Its completed diamond basis may be infinite in the effective representation, while each physical protocol uses only finite retained subrecords.

**Placement of D4 data in the spacetime ledger.** The D4 witness does not replace the Lorentzian cone or second-order certificates. It may feed the continuum-recovery side of the spacetime ledger, while $\mathfrak C_{\mathrm{cone}}$, $\mathfrak C_2$, and $\mathfrak C_{\mathrm{sig}}$ still determine the operational cone, second-order closure, and signature branch.

This section details the emergence of effective spacetime geometry from the underlying discrete MPU network. The continuum layer is not an additional ontology: the real world does not have to become an actual continuum. It only has to generate continuum behavior as a finite-resolution effective closure. Theorem 43 supplies the regularity-necessity theorem, Theorem 43.5 packages the operational-continuum branch on the $M=24$, $D=4$ shell under its stated hypotheses, and Corollary 43.5a supplies the zero-defect $D_4$ gluing certificate $\mathfrak Z_{\mathrm{cont}}$ that discharges the global-core competitor condition on the strict gluing branch. Appendix F supplies the algebraic AQFT bridge under controlled generator-convergence hypotheses, with Definition F.0c and Theorem F.0d giving the Mosco-Bochner certificate route and Definition F.0e with Theorem F.0f giving the projective single-clock route from finite local algebras to the stable local AQFT envelope. The emergence process is presented in stages: obtaining the operational continuum compression of the discrete propagation-cost metric, identifying the metric tensor, and deriving a uniform operational causal-speed upper bound from MPU interactions, while treating frontier attainment separately and importing Lorentzian signature from the Appendix O hyperbolic-principal-symbol branch. Definition 46f and Theorem 46g then package the topological-bandwidth closure of this branch: operational inclusion gives topology and causal order, predictive capacity gives metric scale, and the finite Paley-Wiener sector gives retained field reconstruction below the accepted operational bandwidth. The interpretation of curvature as predictive holonomy is also discussed.

**Definition 46a.1 (Predictive Well-Posedness Signature Certificate $\mathfrak C_{\mathrm{sig}}$).** The finite-frontier and cone constructions determine a causal order only up to the supplied operational certificate. To read a covered second-order sector as genuinely Lorentzian, add the certificate $\mathfrak C_{\mathrm{sig}}(U)$. It records the principal symbol of the retained second-order operator on $U$, one-time Cauchy well-posedness, exclusion of elliptic and ultrahyperbolic alternatives by the PPI/PCE comparison, exclusion of higher-derivative or Ostrogradsky branches from the retained sector, and agreement of the resulting characteristic cone with $\mathfrak C_{\mathrm{cone}}$ up to the stated tolerance. With $\mathfrak C_{\mathrm{sig}}$, the metric signature is a certified branch datum. Without it, finite propagation remains a causal-order result rather than a proof of Lorentzian signature.

**11.1 The MPU Network as Pre-Geometric Structure**

The foundational substrate, according to Hypothesis 1, is a dynamic network $\mathcal{N} = (\mathcal{V}, \mathcal{E}, \{w_{uv}\})$ where vertices $v \in \mathcal{V}$ represent MPUs (Definition 23) and weighted edges $(u,v) \in \mathcal{E}$ represent potential interaction pathways governed by ND-RID. The weights $w_{uv}$ quantify the cost or difficulty of propagating predictive information between MPUs $u$ and $v$. This network is inherently discrete and relational; concepts like continuous distance, dimension, and geometry must emerge from the properties of information propagation within this structure.

**11.2 Metric Distance from ND-RID Propagation Costs**

The fundamental interaction process, ND-RID ('Evolve', Definition 27), is thermodynamically irreversible ($\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)\quad(\text{registered reset branch; a positive floor requires }H_q(P\mid R)\ge h_{\min}>0)$, Theorem 31) and information-limited by the completed reset-support deficit of Proposition E.2a. On refresh/minorization branches it is additionally strictly contractive ($f_{RID} < 1$, Lemma E.1). Propagating information incurs costs related to these limitations.

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



**Definition 35a (Latency--Capacity--Dissipation Edge Ledger).** A retained directed MPU edge $e$ carries the vector datum
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
where $\ell_e$ is a certified minimum intervention-to-retained-response signaling delay including registered node processing, $u_e$ is a composable reliable-rate upper bound measured in completed retained-update symbols per unit time in one fixed alphabet, and $\varepsilon_e$ is a registered dimensionless lower bound on entropy exported per completed retained update on that edge. For the entropy coordinate, the certificate must partition physical reset resources into nonoverlapping edge ledgers, or allocate every shared reset cost to exactly one edge; otherwise only the corresponding non-double-counted aggregate bound is admissible. A realized $f_e$ uses the same alphabet and has units of completed updates per unit time; write $\dot\Sigma_{flow}:=k_B^{-1}dS_{env}/dt$. For vertices $s,t$, define
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
5. for any realized edge flow $f_e\ge0$ on the certified non-double-counting entropy ledger, the entropy production satisfies
$$
\dot\Sigma_{flow}\ge\sum_e\varepsilon_e f_e.
\tag{64f}
$$

*Proof.* Causal composition along the event DAG requires the sum of edge latencies on every used path, proving item 1. Data processing across any directed cut bounds the end-to-end rate by the sum of registered edge bounds, proving item 2; classical max-flow/min-cut supplies equality only on its stated routing branch. One-edge examples with the same latency and different capacities, or the same capacity and different latencies, prove item 3. The feasible path set grows with $L$, proving monotonicity. Its first nonzero value occurs at a positive-capacity minimum-latency path, and removal of the delay constraint yields the ordinary maximum-flow problem, proving item 4. On the registered partition, each physical reset contribution appears once, so summing the edgewise per-update floors against the realized rates proves item 5. ∎

**Corollary 35b.1 (Causal-Speed and Area-Capacity Scope).** The emergent causal speed is calibrated from the latency/length branch, whereas the horizon entropy density and $G$ are calibrated from the cut-capacity/area branch. They are projections of one edge ledger but no theorem identifies either from the other without an additional response-active constitutive relation.

*Proof.* Theorem 35b(1) composes path latency from the edge values $\tau_e$, while Theorem 35b(2) composes cut capacity from the edge values $C_e$. Item 3 of that theorem supplies one-edge ledgers having equal latency and unequal capacity and ledgers having equal capacity and unequal latency. Hence neither functional determines the other. The causal-speed calibration uses path length divided by path latency, whereas the horizon entropy and $G$ calibration uses capacity per cut area. An implication between those calibrations would therefore require an additional relation between $\tau_e$ and $C_e$, which is not present in Theorem 35b. ∎

For finite diagnostic comparisons on a fixed connected MPU population graph with $2\le |\mathcal V|<\infty$, the corresponding dimensionless propagation-efficiency observable is
$$
E_{\mathcal N}
=
\frac{1}{|\mathcal V|(|\mathcal V|-1)}
\sum_{\substack{u,v\in\mathcal V\\u\ne v}}
\frac{\delta}{d_{\mathcal N}(u,v)}.
$$
For disconnected finite graphs, the summand is taken as $0$ whenever $d_{\mathcal N}(u,v)=\infty$. This is the average reciprocal propagation-cost distance induced by (64); it is not the harmonic mean itself and it is not a new dynamical law. It is admissible only after the edge-cost representative, microscopic scale $\delta$, and branch status of the finite graph have been fixed.

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

**11.3.2 Definition 37 (Def 37): Uniformly Bounded Synthetic Ricci Curvature**

A network $\mathcal{N}$ has uniformly bounded synthetic Ricci curvature if it belongs to a class for which there exists a constant $K$ and a discrete curvature-dimension / Bochner control, or an equivalent radius-2 curvature-transfer theorem, yielding $\text{Ric}_N \ge -K$ uniformly and, together with Definition 36, uniform volume-doubling and a (1,2) Poincaré-type inequality for the associated counting measure on $(\mathcal{V}, d_{\mathcal{N}})$. This controls local divergence/convergence of geodesics in the sense required for the measured compactness and rectifiability statements used in Theorem 44. A stand-alone one-step Ollivier-Ricci lower bound counts here only when accompanied by such a transfer mechanism.

**Theorem 43 (Necessary Emergence of Geometric Regularity)**

Assume the regularity-penalty hypotheses established in Appendix C and the variational/stochastic hypotheses of Appendix D, including the existence of the PCE potential $V$, the coercivity/compactness hypotheses used in Theorem D.3, and, when stationary concentration is invoked, the low-noise detailed-balance hypotheses of Theorem D.5. Then geometric regularity, encompassing both uniform $D$-dimensional polynomial volume growth (Definition 36) and uniformly bounded synthetic Ricci curvature (Definition 37), is a necessary condition for membership in the global-minimum sector of $V$. In particular, every global minimum of the PCE potential is geometrically regular, and in the low-noise detailed-balance regime the invariant measure of Theorem D.5 concentrates near that regular low-potential sector.

*Proof.* Appendix C provides the necessity estimates: anomalous dimension destroys viability/coherence (Theorem C.2), large curvature fluctuations raise operational cost and destabilize local dynamics (Theorem C.4), and Theorem C.6 packages these requirements as local doubling/Poincaré control. Appendix D incorporates these penalties into the optimization dynamics: Lemma D.3 quantifies the geometric penalty, Theorem D.2 shows that irregular configurations incur a strict increase in the core potential, and Theorem D.3 concludes that every global minimizer of $V$ is geometrically regular. Under the additional low-noise detailed-balance hypotheses (A1)–(A6) of Appendix D, Theorem D.5 yields the invariant-measure concentration statement. Combining these results proves the theorem. ∎

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

**Corollary 43.5a (Zero-Defect $D_4$ Gluing Certificate).** Let $\mathfrak Z_{\mathrm{cont}}$ be a finite record, for each refinement level $n$, consisting of:

1. a finite cover by propagation-cost cells $\{U_i^{(n)}\}$ whose first shells are identified with the $D_4$ root shell $\Xi_{D_4}$ of Lemma C.6d;
2. local interpolation charts $\psi_i^{(n)}:U_i^{(n)}\to\mathbb R^4$ whose first-shell second moments are scalar multiples of the identity and whose odd shell moments vanish;
3. overlap maps $\theta_{ij}^{(n)}$ in the signed $D_4$ orthogonal frame group on nonempty overlaps;
4. finite overlap equalities $\Omega_C^{(n)}$ on every directed overlap cycle, so the cocycle defect vanishes modulo the response-equivalence relation;
5. certified bounds $\varepsilon_n\downarrow0$ such that the continuum-control defects of Theorem D.6e satisfy
$$
\mathfrak B_n+\mathfrak C_n+\mathfrak R_n+\mathfrak H_n\le\varepsilon_n
$$
for the glued candidate in the same global core-minimum class as the PCE-selected branch.

If $\mathfrak Z_{\mathrm{cont}}$ is accepted, then the competitor condition $\mathfrak d_n^*\to0$ used in Theorem 43.5 is satisfied. Hence the operational-continuum manifold row of Convention P.14.1k is closed on the $\mathfrak Z_{\mathrm{cont}}$ branch.

*Proof.* The four defect terms in Theorem D.6e are nonnegative by construction. The candidate supplied by $\mathfrak Z_{\mathrm{cont}}$ lies in the same global core-minimum class by item 5, so the core infimum satisfies
$$
0\le\mathfrak d_n^*\le\mathfrak B_n+\mathfrak C_n+\mathfrak R_n+\mathfrak H_n\le\varepsilon_n.
$$
Since $\varepsilon_n\to0$, one has $\mathfrak d_n^*\to0$. Items 1--4 supply exactly the shell isotropy, noncollapse, overlap compatibility, and vanishing cocycle data required by the Appendix C/D bridge package, so no extra continuum ontology is introduced. Theorem 43.5 therefore applies with its competitor hypothesis discharged by a finite record. ∎

**11.4 Geometric Convergence to an Operational Continuum Manifold**

Assuming Theorem 43, the operational-continuum branch is packaged in Theorem 43.5. Appendix C supplies first-shell $D_4$ isotropy; the independent continuum certificate supplies geometric noncollapse; Appendix D supplies the finite-defect microscopic selection mechanism and the Mosco–Cheeger closure; and Theorem 44a supplies the regular-branch manifold upgrade when the rigidity defect vanishes along the selected sequence. The resulting continuum description is an effective finite-resolution compression of the MPU network, not an assertion that the physical substrate becomes an exact real-number continuum.

**11.4.1 Theorem 44 (Gromov-Hausdorff Limit)**

On the operational-continuum branch of Theorem 43.5, consider a sequence of pointed, rescaled MPU network metric spaces
$$
\{(X_n,o_n)\}=\{(\mathcal{V}_n,\delta_{eff,n}^{-1}d_{\mathcal N_n},o_n)\},
\qquad
\delta_{eff,n}\to 0,
$$
equipped with normalized counting measures $\mu_n$ such that $\mu_n(B_1(o_n))=1$ after rescaling. Then the family is pre-compact in the pointed measured Gromov–Hausdorff topology. Consequently, a subsequence converges in the measured sense to a limit pointed metric-measure space
$$
(M,d_\infty,\mu_\infty,o_\infty).
$$
Moreover, $(M,d_\infty,\mu_\infty)$ is a doubling PI space, the limit Cheeger energy is quadratic, and hence the limit is infinitesimally Hilbertian. Under assumption (4), there exists a Borel regular set $M_{reg}\subseteq M$ with $\mu_\infty(M\setminus M_{reg})=0$ such that for every $p\in M_{reg}$ the tangent cones are Euclidean $\mathbb{R}^D$; on the PU branch selected by Theorem Z.11, this means $\mathbb{R}^4$. The Euclidean tangent is unique $\mu_\infty$-a.e.

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
Then $h$ is a positive semidefinite quadratic tensor on $U$ and becomes positive definite after quotienting response-null tangent directions. Let $g^{sp}$ denote the positive operational-distance tensor supplied by the Cheeger/Mosco branch of Theorem 45 before the causal-clock direction is appended. If the same retained finite-response protocol family supplies both:

1. the second variation of statistical distinguishability in Corollary 23c.1, and  
2. the second variation of the rescaled propagation cost whose Mosco-Cheeger limit defines $g^{sp}$,

then
$$
h_{\mu\nu}=g_{\mu\nu}^{sp}
\tag{45b.2}
$$
on the positive operational-distance sector. This equality is a certificate statement about the same retained protocol family supplying both quadratic forms. Absent that protocol-family identification, capacity saturation, PCE minimality, or a change of cost units does not by itself force the comparison endomorphism below to be the identity. More generally, whenever $h$ and $g^{sp}$ are positive definite on the same quotient tangent space, there is a unique positive $g^{sp}$-self-adjoint bundle endomorphism $B$ such that
$$
h(v,w)=g^{sp}(Bv,w).
\tag{45b.3}
$$
The Lorentzian metric of Section 11.6 is obtained only after adding the causal-clock direction and the cone-orientation structure; the Fisher tensor above is the positive distinguishability tensor on the operational spatial/response quotient.

*Proof.* The pullback of a positive semidefinite bilinear form is positive semidefinite, so (45b.1) follows from Corollary 23c.1. Its kernel consists of tangent vectors whose image under $d\theta$ is response-null; the PPI quotient removes exactly those vectors, leaving a positive definite form. The metric $g^{sp}$ of Theorem 45 is the pointwise quadratic form representing the Mosco-Cheeger limit of the rescaled propagation energy on the regular branch. If the retained protocol certificate identifies that quadratic variation with the Fisher distinguishability variation, the two quadratic forms agree on every tangent vector. Equality of quadratic forms implies equality of the associated symmetric bilinear forms by polarization, proving (45b.2). If the two positive definite forms are not identical, the finite-dimensional Riesz representation theorem gives a unique endomorphism $B$ satisfying (45b.3); symmetry of $h$ makes $B$ self-adjoint with respect to $g^{sp}$, and positivity of $h$ makes $B$ positive. ∎

**Definition 45c (Geometric-Naturality Certificate $\mathfrak C_{\mathrm{geo}}$).** A geometric-naturality certificate for a regular chart domain $U\Subset M_{reg}$ is a finite record
$$
\mathfrak C_{\mathrm{geo}}
=
(\mathsf{PU}_{\mathrm{fin}}|_U,\;\theta,\;\mathcal E_{\mathrm{Mosco}},\;\mathcal Q_{\mathrm{Fisher}},\;\Pi_{\mathrm{PPI}},\;\lambda_{\mathrm{QFI}},\;\text{naturality squares},\;\text{forward lock})
$$
where the finite Markov/CPTP morphisms used to define the response-state Fisher tensor and the Mosco-Cheeger propagation tensor are the same admissible quotient functor after the PPI projection $\Pi_{\mathrm{PPI}}$. The record must identify the pushforward Dirichlet form $\mathcal E_{\mathrm{Mosco}}$, the QFI/Fisher quadratic form $\mathcal Q_{\mathrm{Fisher}}$, the response-null tangent quotient, and the fixed QFI scale $\lambda_{\mathrm{QFI}}$ before comparison.

**Proposition 45d (Metric Calibration Removes $B$ on the Covered Branch).** Suppose an accepted $\mathfrak C_{\mathrm{geo}}$ explicitly certifies, on the positive operational-distance quotient,
$$
\mathcal Q_{\mathrm{Fisher}}=\lambda_{\mathrm{QFI}}\mathcal E_{\mathrm{Mosco}}
$$
at the tangent-quadratic-form level. Then
$$
h=\lambda_{\mathrm{QFI}}g^{sp}.
$$
If the branch calibration sets $\lambda_{\mathrm{QFI}}=1$, the comparison endomorphism of Corollary 45b is $B=\mathbb 1$. Without the explicit proportionality entry, $B$ remains a response-active comparison datum: CPTP monotonicity and naturality alone do not select a unique quantum monotone metric.

*Proof.* The certificate's proportionality entry states that for every quotient tangent vector $v$,
$$
h(v,v)=\lambda_{\mathrm{QFI}}g^{sp}(v,v).
$$
Polarization gives the same equality for the associated symmetric bilinear forms. Corollary 45b defines $B$ by $h(v,w)=g^{sp}(Bv,w)$; nondegeneracy of $g^{sp}$ therefore gives $B=\lambda_{\mathrm{QFI}}\mathbb 1$, and the unit calibration gives $B=\mathbb 1$. ∎

## 11.5.2 Continuum Relabeling Symmetry and Diffeomorphism Invariance

The emergent manifold branch of Theorems 44–45 admits coordinate charts without making a chart label an observable. Discrete vertex-relabeling invariance motivates coordinate redundancy, but it does not by itself establish invariance under the full group of smooth diffeomorphisms of the limiting manifold.

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

(a) *Scalar density form.* There exists a scalar local Lagrangian $\mathcal L$ — a function of the $k$-jet of $\Psi$ transforming as a scalar under diffeomorphisms — such that
$$
S_U[\Psi] \;=\; \int_U \sqrt{|g|}\,\mathcal L(j^k\Psi)\,d^4 x,\tag{67c}
$$
equivalently the density $L=\sqrt{|g|}\,\mathcal L$ is a scalar density of weight one.

(b) *Diffeomorphism covariance of the global action.* For every compactly supported diffeomorphism $\varphi$ of $M_{\mathrm{reg}}$,
$$
S[\varphi^*\Psi,\varphi^*g]\;=\;S[\Psi,g].\tag{67d}
$$

Continuum diffeomorphism invariance is therefore a consequence of the substrate-level relabeling neutrality of §11.5.2.

*Proof.* (a) In one chart, $S_U[\Psi]=\int_{\phi(U)} L\,d^4x$. In a second chart $(\phi',U')$, the same physical functional has $S_{U'}[\chi_*\Psi]=\int_{\phi'(U')} L'\,d^4x'$. By Hypothesis 11.5.3.3 these are equal for every admissible field configuration. Pulling back via $\chi$:
$$
\int_{\phi(U)} L\bigl(x,j^k\Psi(x)\bigr)\,d^4x \;=\; \int_{\phi(U)} L'\bigl(\chi(x),j^k(\chi_*\Psi)(\chi(x))\bigr)\,|\det D\chi(x)|\,d^4x.
$$
Since the equality holds for arbitrary $U$ and arbitrary local field data, the integrands satisfy the pointwise density transformation law $L'(x',\,\cdot\,)=L(x,\,\cdot\,)\,|\det D\chi^{-1}(x')|$. This is exactly the weight-one scalar-density transformation. The metric determinant $\sqrt{|g|}$ transforms by the same Jacobian factor under coordinate changes (Wald 1984, §2.4), so the ratio $\mathcal L:=L/\sqrt{|g|}$ is a scalar, giving (67c).

(b) Under a compactly supported active diffeomorphism, every geometric field is pulled back: $(\Psi,g)\mapsto(\varphi^*\Psi,\varphi^*g)$. The Lagrangian is a scalar and the metric volume form obeys $d\operatorname{vol}_{\varphi^*g}=\varphi^*(d\operatorname{vol}_g)$. Therefore the change-of-variables formula gives
$$
S[\varphi^*\Psi,\varphi^*g]
=
\int_M\varphi^*\!\left(\mathcal L(\Psi,g)d\operatorname{vol}_g\right)
=
S[\Psi,g].
$$
This proves (67d). ∎

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

Premise (A4) of §12 is therefore a derived consequence of Theorem 45a together with the matter equations of motion.

**11.6 Finite Operational Causal Speed and Lorentzian Signature (Conditional on Thm 43, Thm 45)**

The ND-RID substrate supplies the emergent metric with a uniform operational causal-speed upper bound through Theorem 46. An attained frontier is an additional branch input; normalized uniform-weight one-link saturation is required for $c=\delta/\tau_{\min}$. The Lorentzian signature is not determined by the upper bound alone. Promotion of a separately accepted attained frontier to a Lorentzian principal symbol is carried out by Appendix O, Theorems O.7a and O.7b, and imported into the main text by Corollary 46a under the full signature package or an accepted cone-saturation certificate for the covered retained sectors.

**11.6.1 Theorem 46 (Finite Operational Causal-Speed Bound)**

Assume a nonzero link scale $\delta$, successive edge-by-edge serialized propagation in the propagation-cost metric, a registered lower time $\tau_{\min}>0$ for each edge update, and uniformly bounded positive weights $0<w_{xy}\le w_{\max}<\infty$. Then every retained causal path obeys the uniform upper bound
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

**Corollary 46a (Lorentzian Signature and Local Lorentz Kinematics from Theorem 46 and Appendix O).** The uniform operational causal-speed bound of Theorem 46, together with a separately accepted attained operational frontier and the positive-definite spatial $\Gamma$-limit of §O.7.1, the entropy-selected time coordinate of Hypothesis O.7.2.2, the second-order continuum principal symbol supplied directly by Hypothesis O.7.2.3 or, for covered sectors, by an accepted second-order positivity certificate $\mathfrak C_2$ (Definition O.7.2.3a), and either the cone-coincidence/nondegeneracy clause of Hypothesis O.7.2.4 or an accepted cone-saturation certificate $\mathfrak C_{\mathrm{cone}}$ supplying that clause for the covered retained sectors (Definition O.7.2.5), supplies the four hypotheses of Theorem O.7a. When the latter two inputs are supplied by finite sector certificates, the well-posedness/signature audit is recorded by $\mathfrak C_{\mathrm{sig}}$ (Definition 46a.1). By Theorems O.7a and O.7b and Corollary O.7b.1 of Appendix O, this package forces a Lorentzian principal symbol on the emergent manifold and derives local Lorentz invariance with structure group $SO^+(1,3)$. Premise (A5) of §12 is therefore a theorem on precisely this branch or certificate package. The Lorentzian factor $\mathrm{Spin}(1,3)$ in the principal bundle $G=\mathrm{Spin}(1,3)\times U(d_0)$ of Theorem 48 is structurally forced only on the spin-admissible branch $w_2(M_{\mathrm{reg}})=0$ or on a strict-spin tangential-structure certificate $\mathfrak C_{\mathrm{tan}}$ (Definition 48b.2). Charged or twisted fermionic sectors may instead require a $\mathrm{Spin}^c$ or gauge-twisted tangential structure, in which case Theorem 48 must be read with the corresponding replacement bundle rather than as the global product $\mathrm{Spin}(1,3)\times U(d_0)$. The $D_4$ continuum gluing certificate supplies local regular-continuum data used by the branch, but it does not by itself assert global frame triviality, remove the spin obstruction, or discharge the second-order, cone-coincidence, and signature gates for uncovered sectors.

*Proof.* Direct application of Theorems O.7a (signature forcing), O.7b (speed normalization), and Corollary O.7b.1 (derived local Lorentz invariance and frame-bundle structure) to the separately accepted attained frontier, the upper-bound output of Theorem 46, and §O.7.1, with the second-order input supplied either by Hypothesis O.7.2.3 or by $\mathfrak C_2$, and with the fourth cone input supplied either by Hypothesis O.7.2.4 or by $\mathfrak C_{\mathrm{cone}}$ as stated. When the finite certificate route is used, $\mathfrak C_{\mathrm{sig}}$ records the well-posedness exclusion of non-Lorentzian representatives. The three-spatial-dimensional hypothesis of Theorem O.7a is supplied on the Appendix Z channel-complete Bures tangent-cell contract of Definition Z.9a and Theorem Z.11. The global spin-bundle clause is then exactly the obstruction statement of Theorem 48b and Corollary 48b.1, optionally discharged by $\mathfrak C_{\mathrm{tan}}$ on the strict-spin branch. ∎

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

**Theorem 46b (Causal-Diamond Reconstruction of the Emergent Metric Branch).** Let $(M,g,V_{\mathrm{cap}})$ and $(M',g',V'_{\mathrm{cap}})$ be connected, time-oriented, past-and-future distinguishing, globally hyperbolic regular Lorentzian branches. Suppose there is a bijection
$$
\Phi:\mathcal D_{\mathrm{op}}(M)\to\mathcal D_{\mathrm{op}}(M')
$$
that preserves and reflects inclusion and satisfies
$$
V_{\mathrm{cap}}(D)=V'_{\mathrm{cap}}(\Phi(D))
$$
for every operational diamond. Assume additionally:

1. the basis-order isomorphism extends to an isomorphism of the generated topological frames, equivalently it maps the completely prime filters representing manifold points to such point filters, and its induced point map $F$ satisfies $\Phi(D)=F(D)$;
2. $\Phi$ preserves the future/past orientation of diamond tips, or equivalently the induced map $F$ preserves the chosen time orientation.

Then:

1. $\Phi$ induces a homeomorphism $F:M\to M'$;
2. $F$ preserves the directed causal order;
3. $F$ determines the conformal Lorentzian metric,
$$
F^*[g']=\Omega^2[g],
$$
for a positive function $\Omega$ on the regular set;
4. if both branches use one capacity-density normalization
$$
V_{\mathrm{cap}}(D)=\sigma_{\mathrm{cap}}\operatorname{Vol}_g(D),
\qquad
V'_{\mathrm{cap}}(D')=\sigma_{\mathrm{cap}}\operatorname{Vol}_{g'}(D')
$$
on sufficiently small diamonds, then $\Omega=1$ almost everywhere on the regular set.

Without hypothesis 2, the inclusion and capacity data determine the causal structure only up to a global time reversal.

*Proof.* The set of relatively compact causal diamonds is a basis for the manifold topology on a globally hyperbolic distinguishing Lorentzian manifold. Since $\Phi$ preserves and reflects inclusion, it preserves the basis order. For each point $p\in M$, the family of diamonds containing $p$ is a completely prime filter in the inclusion poset. Inclusion preservation sends this filter to a completely prime filter in $\mathcal D_{\mathrm{op}}(M')$, which is the family of diamonds containing a unique point $F(p)\in M'$. This defines a bijection $F:M\to M'$. Because basic neighborhoods are diamonds and $\Phi$ preserves their inclusion relations, $F$ and $F^{-1}$ pull back basic neighborhoods to basic neighborhoods, so $F$ is a homeomorphism.

Causal order is recoverable from diamonds: $p\le q$ if and only if every diamond containing $q$ whose past face is sufficiently small has a predecessor diamond containing $p$, equivalently if the Alexandrov neighborhoods ordered between $p$ and $q$ are nonempty in the diamond poset. Since $\Phi$ preserves the diamond order, $F$ preserves and reflects this causal order.

On a past-and-future distinguishing Lorentzian manifold, the causal order determines the conformal class of the Lorentzian metric on the regular set. Hence
$$
F^*[g']=\Omega^2[g]
$$
for some positive $\Omega$.

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

**Corollary 46c (Spacetime as the Regular Representation of Predictive Inclusion).** On the regular PU branch, the data
$$
(\mathcal D_{\mathrm{op}},\subseteq,V_{\mathrm{cap}})
$$
determine the emergent Lorentzian metric-measure structure up to the explicitly stated capacity-density normalization.

*Proof.* This is exactly Theorem 46b applied to the identity class of operationally equivalent diamond-poset representations. ∎

**Corollary 46d (Landauer-Count Form of Causal-Diamond Reconstruction).** Suppose each operational causal diamond $D$ carries an effective Landauer update-cell count
$$
N_L(D)\in\mathbb N
$$
and a fixed cell valuation $\nu_L>0$ such that
$$
V_{\mathrm{cap}}(D)=\nu_L N_L(D)
\tag{46d.1}
$$
on the branch under consideration. If two regular Lorentzian branches have an inclusion-preserving bijection of operational diamonds and the same Landauer counts,
$$
N_L(D)=N_L'(\Phi(D)),
$$
with the same $\nu_L$, then they determine the same emergent metric-measure structure up to the operational equivalence of Theorem 46b.

*Proof.* Equation (46d.1) converts equality of Landauer counts into equality of predictive capacity valuations:
$$
V_{\mathrm{cap}}(D)=\nu_LN_L(D)=\nu_LN_L'(\Phi(D))=V'_{\mathrm{cap}}(\Phi(D)).
$$
The hypotheses of Theorem 46b are therefore satisfied. The inclusion order fixes the conformal Lorentzian metric and the common valuation fixes the conformal scale. ∎

**Corollary 46e (Boundary-Sufficiency Metric Universality).** Work on a regular Lorentzian branch satisfying Definition 46b and the finite Markov-boundary hypotheses of Definition F.10.6a. For each retained matter species $s$, let $\mathcal R_s(D)$ be the finite protocol-response functor generated by $s$-sector instruments localized in an operational diamond $D$, and let $\subseteq_s$ and $V_s$ be the inclusion relation and capacity valuation reconstructed from $\mathcal R_s$ by the same operational test used in Definition 46b. Assume:

1. for every sufficiently small operational diamond $D$, the same finite boundary syndrome or boundary algebra $B_D$ is PCE-minimal and Markov-sufficient for every retained species,
$$
I_s(\mathfrak A_s(D):\mathfrak A_s(\bar D)\mid B_D)_\rho=0,
\tag{46e.1}
$$
or, on the classical branch, $X_D^{(s)}\perp E_{\bar D}^{(s)}\mid B_D$;

2. the branch is species-separating: if two diamond assignments produce the same $s$-sector responses for every retained species and the same boundary syndrome responses, then they are equal in the PPI quotient;

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

*Proof.* By Theorem F.10.6b, condition (46e.1) is equivalent to exact recovery of every exterior $s$-sector response from the same boundary datum $B_D$. By Corollary F.10.6c, any additional species label at the boundary that changes no exterior response is PCE-degenerate and removed from the quotient. Hence the inclusion test on $s$-sector protocols can differ from the full operational inclusion test only if some retained exterior response distinguishes the two assignments. Condition 2 excludes such an undetected difference: a response-distinct assignment is visible to at least one retained species or to the common boundary syndrome, while a response-indistinct assignment is the same PPI object. Therefore $\subseteq_s=\subseteq$ for every retained species.

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
2. the connectedness, time orientation, distinguishing, global-hyperbolicity, inclusion-faithfulness, and common capacity-density hypotheses of Theorem 46b;
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

**Definition 46h (Finite Metric-Response Conditioning Certificate).** Fix one causal-order/inclusion stratum; the discrete inclusion record selects this stratum and is not differentiated. On a compact regular branch, let $\theta\in U\subset\mathbb R^p$ parameterize a declared finite-dimensional local metric envelope $g(\theta)$. Let
$$
\mathcal R:U\to\mathbb R^m
\tag{46h.1}
$$
collect only the continuously differentiable causal-diamond capacity, proper-time, volume, and finite-band response coordinates used by that envelope. At $\theta_*$ the certificate records
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

2. Let an infinitesimal oriented parallelogram based at $x$ have independent side vectors $a^\mu$ and $b^\nu$. The unitary component of closed-system predictive transport around its boundary satisfies
$$
U_{\square(a,b)}^{\mathrm{pred}}
=
\mathbb I
+
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

For the loop statement, write the infinitesimal transport along the $\mu$ side as
$$
U_\mu=\mathbb I+A_\mu^{\mathrm{pred}}(x)\Delta x^\mu+O(|\Delta x|^2),
$$
and the $\nu$ side from the displaced point as
$$
U_\nu'=\mathbb I+\bigl(A_\nu^{\mathrm{pred}}(x)+(\partial_\mu A_\nu^{\mathrm{pred}})\Delta x^\mu\bigr)\Delta x^\nu+O(|\Delta x|^2),
$$
with analogous inverse expansions. The ordered product
$$
U_{\square_{\mu\nu}}^{\mathrm{pred}}=U_\nu' U_\mu U_\nu^{-1}U_\mu^{-1}
$$
has all first-order terms cancel. The remaining second-order terms are exactly
$$
\bigl(\partial_\mu A_\nu^{\mathrm{pred}}
-\partial_\nu A_\mu^{\mathrm{pred}}
+
[A_\mu^{\mathrm{pred}},A_\nu^{\mathrm{pred}}]\bigr)\Delta x^\mu\Delta x^\nu,
$$
giving the stated holonomy expansion. Finally, on the spin branch the standard spin representation of the Levi-Civita curvature is $R_{\mu\nu}(\Omega)=\frac14R_{\mu\nu ab}\gamma^{ab}$, and the tetrad identifies $R_{\mu\nu ab}$ with $R^\rho{}_{\sigma\mu\nu}$. The internal term is exactly the gauge curvature by Definition G.4.1 and Theorem G.4b. If $\mathcal F_{\mu\nu}^{\mathrm{pred}}=0$ on a simply connected neighborhood, Corollary G.4a.1 and its product-bundle form give a frame in which the connection is pure gauge; conversely a pure-gauge connection has zero curvature by direct substitution. ∎

## 11.7.2 Dissipative Companion to Predictive Holonomy

Theorem 47 identifies $\mathcal F_{\mu\nu}^{\mathrm{pred}}$ as the closed-system curvature of predictive-frame transport in the continuum limit, with Riemann curvature and internal gauge field strength obtained by projection. When ND-RID holds, transport between neighboring "contexts" is generically *open* at the reduced-state level because the retained subsystem is only part of the closed predictive ledger. The completed reset branch supplies the finite transfer and entropy ledger of Proposition E.2a; refresh/minorization branches additionally supply strict trace-distance contraction (Appendix E, Lemma E.1). The appropriate reduced object is therefore a completely positive, trace-preserving (CPTP) transport map on reduced states, not a pure unitary parallel transport.

**Infinitesimal Transport Structure.**
Let $\mathcal{E}_{\Delta\tau}$ denote the CPTP transport channel associated with proper time displacement $\Delta\tau$ along a timelike worldline in emergent coordinates. In the Markovian regime, its generator admits the standard GKSL decomposition [Gorini, Kossakowski & Sudarshan 1976; Lindblad 1976]:
$$
\mathcal{E}_{\Delta\tau}(\rho) = \rho + \Delta\tau \, \mathcal{L}(\rho) + O(\Delta\tau^2),
$$
$$
\mathcal{L}(\rho) = -i[H, \rho] + \sum_a \left( L_a \rho L_a^\dagger - \frac{1}{2}\{L_a^\dagger L_a, \rho\} \right),
$$
with $H$ the unitary (Hamiltonian/connection) component and the $\{L_a\}$ encoding dissipation/decoherence.

For transport along a smooth oriented curve $\gamma:[0,1]\to M$, assume the branch supplies a measurable family $\mathcal L_{\gamma,s}$ such that $\mathcal L_{\gamma,s}$ is a GKSL generator for almost every $s$ and its coefficients satisfy the boundedness conditions required for the evolution equation. Define
$$
\mathcal E_\gamma
=
\overleftarrow{\mathcal P}
\exp\!\left(\int_0^1\mathcal L_{\gamma,s}\,ds\right).
$$
Then the propagator is CPTP. A representation $\mathcal L_{\gamma,s}=\dot\gamma^\mu(s)\mathcal L_\mu$ is admissible only when this contracted generator has GKSL form along the selected orientation; directionwise GKSL form of the individual $\mathcal L_\mu$ does not imply that condition.

* The **unitary part** $H_\mu$ matches the connection structure identified in Theorem 47: its holonomy yields the emergent curvature.
* The **dissipative part** $\{L_{\mu,a}\}$ is the operational signature of ND-RID: it captures the loss of distinguishability under transport required by irreversibility (Appendix E), and it is naturally represented in the Schwinger–Keldysh/CTP effective action formalism (Section X.5) as the stochastic/noise sector accompanying the retarded response sector.

**Chronometric Phase and Curvature-Dephasing.**
A concrete gravitational example appears in Appendix S, where differential proper-time accumulation induces phase gradients. For an internal clock transition $i\leftrightarrow j$ with energy splitting
$$
\Delta E_{ij}:=E_i-E_j,
$$
and for two branches with proper times $\tau_0(t)$ and $\tau_1(t)$ relative to the same external bookkeeping parameter $t$, define the chronometric phase difference
$$
\Theta_{ij}(t):=-\frac{\Delta E_{ij}}{\hbar}\bigl(\tau_1(t)-\tau_0(t)\bigr).
$$
In a static weak field with $|\Phi|/c^2\ll1$,
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

**Theorem 47c (Chronometric Curvature-Dephasing Principle).** Work in Fermi normal coordinates $(t,x^m)$ about a freely falling reference worldline on the regular Lorentzian branch, and let $x_0^m,x_1^m$ be two branch locations inside the Fermi patch. Suppose the saturated chronometric ND-RID branch is selected: unresolved proper-time phase slip is represented by the minimal two-level pure-dephasing GKSL generator
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
|\rho_{ij}(t)|=|\rho_{ij}(0)|e^{-\Gamma_{\mathrm{ch}}^{(ij)}t}.
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
Setting $(x_0,x_1)=(0,L_q)$ gives the reference-anchored formula. Setting $(x_0,x_1)=(X-\frac12L_q,X+\frac12L_q)$ gives
$$
x_1^m x_1^n-x_0^m x_0^n
=
X^mL_q^n+L_q^mX^n,
$$
and contraction with the symmetric tensor $R_{0m0n}$ gives $2R_{0m0n}X^mL_q^n$, hence the centered-pair formula after the prefactor $\frac12$. ∎

**Testable PU discriminator against self-gravity collapse models.**
The deterministic chronometric phase-rate invariant and the saturated chronometric ND-RID dephasing branch both scale linearly with the internal energy splitting $\Delta E_{ij}$ at fixed geometry. For two-branch interferometers engineered so that the branches have the same mass-density distribution but differ by internal clock splitting, the PU chronometric branch predicts
$$
\frac{\Gamma_{\mathrm{ch}}^{(ij)}}{\Gamma_{\mathrm{ch}}^{(kl)}}
=
\frac{|\Delta E_{ij}|}{|\Delta E_{kl}|}
$$
for transitions measured in the same geometry. Penrose-Diósi-type self-gravity collapse rates depend primarily on branch mass-density difference and therefore do not produce this energy-gap ratio when the mass-density difference is held fixed. Conversely, because the PU branch is curvature-controlled, the reference-anchored tidal contribution vanishes at this order when $R_{0m0n}=0$ and is invariant under removal of pure uniform acceleration in a freely falling Fermi frame.

This identifies a precise sense in which curvature, clock phase, and ND-RID dephasing belong to the same operational transport structure: the holonomy component defines the emergent geometry (Theorem 47), the chronometric phase measures proper-time mismatch along that geometry, and the saturated open-system companion quantifies the irreducible loss of predictive distinguishability when that mismatch is not resolved by the retained finite-resolution state (Lemma E.1; Appendix S, Section S.7).

**11.8 Fibre Bundle Structure**

Unifying external spacetime and internal MPU degrees of freedom requires a principal fibre bundle structure.

**11.8.1 Theorem 48 (Fibre-Bundle Representation)**

Assume in addition to Theorems 44-46 that the emergent Lorentzian manifold $M$ is oriented, time-oriented, and spin, and that the internal rank-$d_0$ Hilbert bundle carries a Hermitian structure. Then the full state and dynamics of the MPU network can be described using a principal fibre bundle $P(M,G)$ over $M$, with structure group $G = \text{Spin}(1,3) \times U(d_0)$.

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
is a principal $\text{Spin}(1,3)\times U(d_0)$ bundle whose fibre over $x$ consists exactly of the pairs $(\mathcal{F}_x,\mathcal{P}_x)$ described above. The right action is free and transitive because each factor action is free and transitive. For any representation $\rho$ of the product group, the standard associated-bundle construction gives $E_\rho=P\times_\rho V_\rho$. A principal connection on the product bundle is equivalently a pair $(\omega_\mu,A_\mu^{\mathrm{int}})$, so the covariant derivative has the displayed direct-sum form, and the curvature splits because the Lie algebra is the direct sum $\mathfrak{spin}(1,3)\oplus\mathfrak{u}(d_0)$. These are the standard bundle constructions of gauge theory and general relativity, now applied with the hypotheses verified in the present setting [Nakahara 2003; Wald 1984]. QED

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

**11.8.3 Theorem 48c (Conditional Global CPTP Transport Closure).** Let $P(M_{\mathrm{reg}},\mathrm{Spin}(1,3)\times U(d_0))$ be the principal bundle of Theorem 48 (globally exact under Theorem 48b), and let $\mathcal W=S\otimes E$ be the associated spin-internal bundle (Theorem G.4b). Assume:

(i) *Bundle-respecting Stinespring dilation.* The local CPTP transport maps $\Phi_\gamma$ admit Stinespring dilations whose system-side unitary factor lifts the parallel transport of the product connection on $\mathcal W=S\otimes E$ (Theorem G.4b); equivalently, the dilation environment is chosen so that the system-side unitary $U_\gamma|_{\mathcal W}$ commutes with the bundle gauge action and reduces to the product-connection holonomy in the closed-system limit $\mathcal H_{\mathrm{env}}\to\mathbb C$.

(ii) *Markovian semigroup limit.* On bounded local time windows, the family $\{\Phi_\gamma\}$ admits a strongly continuous Markovian semigroup limit on $\mathrm{End}(\mathcal W_x)$.

(iii) *Overlap covariance of the open-system channel.* If $g_{ij}$ is a transition function of $\mathcal W$ on $U_i\cap U_j$, the local channel representatives satisfy
$$
\Phi_\gamma^{(j)}
=
\operatorname{Ad}_{g_{ij}(y)}\circ
\Phi_\gamma^{(i)}\circ
\operatorname{Ad}_{g_{ij}(x)^{-1}},
$$
and the corresponding generator superoperators satisfy the infinitesimal intertwining relation. Equivalently, the Hamiltonian and dissipative terms together define a global endomorphism-superoperator section.

Then every local CPTP transport map along a curve $\gamma$,
$$
\Phi_\gamma:\mathrm{End}(\mathcal W_x)\to\mathrm{End}(\mathcal W_y),
$$
admits a Stinespring dilation
$$
\Phi_\gamma(\rho) \;=\; \mathrm{Tr}_{\mathrm{env}}\!\bigl(U_\gamma(\rho\otimes|0\rangle\langle 0|)U_\gamma^\dagger\bigr),
$$
with $U_\gamma$ unitary on $\mathcal W\otimes\mathcal H_{\mathrm{env}}$. Moreover, by hypothesis (i) the system-side unitary part $U_\gamma|_{\mathcal W}$ is generated by the product connection on $S\otimes E$ (Theorem G.4b), and by (ii) the Markovian generator takes the globally covariant GKSL form
$$
\mathcal L(\rho) \;=\; -i[H_D,\rho] + \sum_a\Bigl(L_a\rho L_a^\dagger - \tfrac12\{L_a^\dagger L_a,\rho\}\Bigr),
$$
where $H_D$ uses the spin-plus-internal covariant derivative of Definition G.4.1 and Theorem G.4b.

*Proof.* Stinespring's dilation theorem (Stinespring 1955) applies to each finite-dimensional CPTP transport map and gives an isometric dilation, extendable to a unitary after enlarging the environment if necessary. Hypothesis (i) selects a realization whose closed-system restriction is the product-connection transport on $S\otimes E$. Tracing over the environment recovers $\Phi_\gamma$.

Hypothesis (ii) gives a strongly continuous completely positive trace-preserving semigroup on each finite-dimensional endomorphism algebra. The Gorini–Kossakowski–Sudarshan–Lindblad classification (Gorini, Kossakowski & Sudarshan 1976; Lindblad 1976) therefore gives the displayed local GKSL form. Finally, differentiate the channel overlap relation of hypothesis (iii) at semigroup parameter zero. The resulting generator relation intertwines the full superoperator, not only its Hamiltonian commutator. Hence the local generators define a global covariant generator; local Lindblad families on overlaps may differ by the standard representation mixing without changing that superoperator. ∎

Theorem 48c closes the gap between Theorem 47 (predictive holonomy as curvature) and Theorem 48 (fibre-bundle representation): under the stated open-system hypotheses, the CPTP transport law is a completion of the same underlying bundle transport.

**11.9 Role of MPU Stress-Energy Tensor**

Theorem 47 and the connection dynamics of Theorem 48 identify non-frame-removable inhomogeneity of predictive transport with curvature of the predictive connection. A macroscopic MPU stress-energy source $T_{\mu\nu}^{(MPU)}$ is available on the separate Appendix B branch carrying admissible bounded-variation coarse-graining, a paired or unique continuum limit, the momentum-flux and Belinfante derivative certificates, variational first-variation consistency, local equilibrium, and the global horizon-flux consistency and quadrature record of Theorem B.8d. On the operational-continuum, local-horizon, area-law, KMS/Clausius, and finite Einstein-closure branch of Section 12, that same certified tensor is the source on the right-hand side of the emergent field equation. Theorem 46 supplies only a uniform operational causal-speed upper bound. The identification $c=\delta/\tau_{\min}$ additionally requires the separately accepted normalized uniform-weight one-link-attainment branch of Appendix E, Theorem E.10.2; only on that branch is the attained value tied to the registered costs and timing of information propagation. Its promotion to a Lorentzian light cone is the Appendix O branch imported by Corollary 46a, and the exact values of $\delta$ and $\tau_{\min}$ inherit the Appendix Q discretization branches.

