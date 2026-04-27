# 11 Emergence of Spacetime Geometry (Operational Continuum Branch)

This section details the emergence of effective spacetime geometry from the underlying discrete MPU network. The continuum layer is not an additional ontology: the real world does not have to become an actual continuum. It only has to generate continuum behavior as a finite-resolution effective closure. Theorem 43 supplies the regularity-necessity theorem, Theorem 43.5 packages the operational-continuum branch on the $M=24$, $D=4$ shell under its stated hypotheses, and Appendix F supplies the algebraic AQFT bridge under its controlled generator-convergence hypotheses. The emergence process is presented in stages: obtaining the operational continuum compression of the discrete propagation-cost metric, identifying the metric tensor, and deriving a finite operational causal speed from MPU interactions and importing Lorentzian signature from the Appendix O hyperbolic-principal-symbol branch. The interpretation of curvature as predictive holonomy is also discussed.

**11.1 The MPU Network as Pre-Geometric Structure**

The foundational substrate, according to Hypothesis 1, is a dynamic network $\mathcal{N} = (\mathcal{V}, \mathcal{E}, \{w_{uv}\})$ where vertices $v \in \mathcal{V}$ represent MPUs (Definition 23) and weighted edges $(u,v) \in \mathcal{E}$ represent potential interaction pathways governed by ND-RID. The weights $w_{uv}$ quantify the cost or difficulty of propagating predictive information between MPUs $u$ and $v$. This network is inherently discrete and relational; concepts like continuous distance, dimension, and geometry must emerge from the properties of information propagation within this structure.

**11.2 Metric Distance from ND-RID Propagation Costs**

The fundamental interaction process, ND-RID ('Evolve', Definition 27), is thermodynamically irreversible ($\varepsilon \ge \ln 2$, Theorem 31) and information-limited (strictly contractive $f_{RID} < 1$, Lemma E.1). Propagating information incurs costs related to these limitations.

**11.2.1 Definition 35 (Def 35): Propagation Cost Metric $d_{\mathcal{N}}$**

We define a metric distance $d_{\mathcal{N}}(u,v)$ between any two MPUs $u, v \in \mathcal{V}$ based on the minimum cumulative cost of propagating information along paths in the network $\mathcal{N}$. The dimensionless cost $w_{xy}$ of traversing edge $(x,y)$ incorporates fidelity loss ($f_{RID}^{(xy)}$) and minimum entropy production ($\Delta S_{min}^{(xy)} \ge k_B \varepsilon$) associated with the ND-RID step (derived in Appendix E). As derived in Appendix E (**Sections E.2 and E.3**), the cost is fundamentally related to the channel contractivity and the irreversible cost $\varepsilon$. A functionally motivated form capturing these dependencies is $w_{xy} \approx -\ln f_{RID}^{(xy)} + c_S (\Delta S_{min}^{(xy)} / k_B)$, which is strictly positive (with constant $c_S>0$). Introducing a fundamental microscopic length scale $\delta$ (units $[L]$, the MPU spacing derived in Appendix Q) associated with a single interaction step, the **propagation cost metric** is the shortest path distance:
$$
d_{\mathcal{N}}(u,v) = \min_{\gamma: u \to v} \sum_{(x,y) \in \gamma} \delta w_{xy} \qquad \text{(64)}
$$
where the minimum is over all finite paths $\gamma$ connecting $u$ and $v$. Assume the undirected network underlying $\mathcal{E}$ is connected on the viability domain; otherwise set $d_{\mathcal{N}}(u,v)=\infty$ when no path exists and restrict attention to a connected component. With symmetric positive edge weights $w_{xy}=w_{yx}>0$, the shortest‑path construction defines a valid metric on that component. If the primitive edge attribute encodes throughput rather than cost, replace it by a positive cost weight (e.g. $c_{xy}:=1/w_{xy}$) before applying (64).

**11.3 Geometric Regularity: A Necessary Condition for Viability**

For the discrete metric space $(\mathcal{V}, d_{\mathcal{N}})$ to admit a stable finite-resolution continuum compression, the network structure must possess large-scale geometric regularity.

**11.3.1 Definition 36 (Def 36): Uniform D-dim Polynomial Volume Growth**

A sequence of MPU networks $\{\mathcal{N}_n\}$ exhibits uniform D-dimensional polynomial volume growth if there exist constants $K_1, K_2 > 0$, dimension $D \ge 1$, and scale $R_0$ such that for large $n$, all $v \in \mathcal{V}_n$, and all radii $R > R_0$:
$$
K_1 \left(\frac{R}{\delta_{eff, n}}\right)^D \leq |B_{R}(v)| \leq K_2 \left(\frac{R}{\delta_{eff, n}}\right)^D \quad \text{(65)}
$$
where $B_{R}(v)$ is the metric ball, $|B_{R}(v)|$ its vertex count, and $\delta_{eff, n}$ the characteristic microscopic scale $\delta \langle w_{uv} \rangle_{avg}$. This ensures consistent effective dimension $D$.

**11.3.2 Definition 37 (Def 37): Uniformly Bounded Synthetic Ricci Curvature**

A network $\mathcal{N}$ has uniformly bounded synthetic Ricci curvature if it belongs to a class for which there exists a constant $K$ and a discrete curvature-dimension / Bochner control, or an equivalent radius-2 curvature-transfer theorem, yielding $\text{Ric}_N \ge -K$ uniformly and, together with Definition 36, uniform volume-doubling and a (1,2) Poincaré-type inequality for the associated counting measure on $(\mathcal{V}, d_{\mathcal{N}})$. This controls local divergence/convergence of geodesics in the sense required for the measured compactness and rectifiability statements used in Theorem 44. A stand-alone one-step Ollivier-Ricci lower bound counts here only when accompanied by such a transfer mechanism.

**Theorem 43 (Necessary Emergence of Geometric Regularity)**

Assume the regularity-penalty hypotheses established in Appendix C and the variational/stochastic hypotheses of Appendix D, including the existence of the PCE potential $V$, the coercivity/compactness hypotheses used in Theorem D.3, and, when stationary concentration is invoked, the low-noise detailed-balance hypotheses of Theorem D.5. Then geometric regularity, encompassing both uniform $D$-dimensional polynomial volume growth (Definition 36) and uniformly bounded synthetic Ricci curvature (Definition 37), is a necessary condition for membership in the global-minimum sector of $V$. In particular, every global minimum of the PCE potential is geometrically regular, and in the low-noise detailed-balance regime the invariant measure of Theorem D.5 concentrates near that regular low-potential sector.

*Proof.* Appendix C provides the necessity estimates: anomalous dimension destroys viability/coherence (Theorem C.2), large curvature fluctuations raise operational cost and destabilize local dynamics (Theorem C.4), and Theorem C.6 packages these requirements as local doubling/Poincaré control. Appendix D incorporates these penalties into the optimization dynamics: Lemma D.3 quantifies the geometric penalty, Theorem D.2 shows that irregular configurations incur a strict increase in the core potential, and Theorem D.3 concludes that every global minimizer of $V$ is geometrically regular. Under the additional low-noise detailed-balance hypotheses (A1)–(A6) of Appendix D, Theorem D.5 yields the invariant-measure concentration statement. Combining these results proves the theorem. ∎

**Theorem 43.5 (Operational Continuum Branch Package).** On the minimal $M=24$, $D=4$ mode-channel branch, let the microscopic adaptation dynamics use the continuum-control PCE potential $V_n^{\mathrm{cont}}$ of Theorem D.6e. Assume the $D_4$ branch of Theorem C.6e supplies a competitor sequence with $\mathfrak d_n^*\to 0$ in the global core-minimum class. Then the low-noise detailed-balance adaptation dynamics concentrate on the asymptotically defect-free operational-continuum branch, and every selected subsequential limit with $\mathfrak D_n\to0$ satisfies:

1. the rescaled MPU network spaces are precompact in pointed measured Gromov-Hausdorff topology;
2. the limit is noncollapsed $\mathrm{RCD}^*(K,4)$;
3. the rescaled propagation-cost Dirichlet forms Mosco-converge to the quadratic Cheeger energy;
4. tangent cones are Euclidean $\mathbb R^4$ at $\mu$-almost every point;
5. on the $\mathfrak H_n\to0$ rigidity subbranch, the regular set carries a $C^{1,\alpha}$ Riemannian metric, and after adjoining the finite ND-RID update clock the corresponding Lorentzian metric is obtained as in Corollary O.7b.1.

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
so the first-shell odd moments vanish, the second moment is positive and isotropic, and rank collapse is excluded. Theorem C.6e supplies fixed-radius four-dimensional noncollapse, shell isotropy, and the canonical interpolation data on this branch.

Theorem D.6e inserts the finite continuum-control defects $\mathfrak B_n,\mathfrak C_n,\mathfrak R_n,\mathfrak H_n$ into the microscopic PCE potential with positive coefficients. Since a competitor sequence with $\mathfrak d_n^*\to 0$ exists in the same global core-minimum class, and since Proposition D.6f shows that this is the sharp condition for defect removal within that class, global minimizers of $V_n^{\mathrm{cont}}$ satisfy $\mathfrak D_n\to0$ along the selected sequence. The detailed-balance low-noise concentration estimate follows from Theorem D.5 applied to $V_n^{\mathrm{cont}}$, giving the displayed exponential bound.

Along the selected sequence, $\mathfrak B_n\to0$ is the asymptotic radius-2 $\mathrm{BE}(K,4)$ curvature transfer required by Theorem C.6c, and Theorem C.6e supplies noncollapse. Therefore every measured-GH limit is noncollapsed $\mathrm{RCD}^*(K,4)$ and has Euclidean $\mathbb R^4$ tangent cones at $\mu$-almost every point. The identities $\mathfrak C_n\to0$ and $\mathfrak R_n\to0$ give the finite-core and recovery-map compatibility required for the Mosco argument in Theorem D.6e; hence the rescaled propagation-cost forms converge to the quadratic Cheeger energy. Finally, $\mathfrak H_n\to0$ is the quantitative Euclidean-rigidity and harmonic-coordinate input of Theorem 44a, so the regular branch carries a $C^{1,\alpha}$ spatial metric. Corollary O.7b.1 adjoins the finite ND-RID update clock and yields the Lorentzian extension. Theorem K.10.3a excludes exact continuum ontology under finite-resource PPI, so the limit is an effective finite-resolution compression of the discrete MPU branch. ∎

**11.4 Geometric Convergence to an Operational Continuum Manifold**

Assuming Theorem 43, the operational-continuum branch is packaged in Theorem 43.5. Appendix C supplies the first-shell $D_4$ isotropy and noncollapse closure; Appendix D supplies the finite-defect microscopic selection mechanism and the Mosco–Cheeger closure; and Theorem 44a supplies the regular-branch manifold upgrade when the rigidity defect vanishes along the selected sequence. The resulting continuum description is an effective finite-resolution compression of the MPU network, not an assertion that the physical substrate becomes an exact real-number continuum.

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

*Proof:* Theorem 43.5 supplies the selected sequence with $\mathfrak D_n\to 0$ from microscopic adaptation dynamics. Theorem C.6e supplies first-shell isotropy and fixed-radius noncollapse. Theorem D.6e gives the finite-core, recovery, and Mosco–Cheeger closure once the corresponding defects vanish. Theorem C.6c gives the stable noncollapsed $\mathrm{RCD}^*(K,4)$ limit because $\mathfrak B_n\to 0$ supplies the required uniform curvature-transfer input. Theorem 44a gives the regular-branch Euclidean-rigidity conclusion when $\mathfrak H_n\to0$. Therefore the family is precompact, the limit Cheeger energy is quadratic, the limit is infinitesimally Hilbertian, and the full-measure regular set has Euclidean $\mathbb R^4$ tangents on the PU branch selected by Theorem Z.11, with the stronger $C^{1,\alpha}$ regularity available on the Theorem 44a subbranch. ∎

**11.5 Emergence of the Metric Tensor (Conditional on Thm 43, Thm 44)**

On the selected continuum branch, the quadratic limit energy together with Euclidean tangent cones on the regular set allows definition of an a.e. Riemannian metric tensor compatible with the limit distance.

**11.5.1 Theorem 45 (Metric Tensor $g_{\mu\nu}$)**

Conditional on Theorem 44, the limit space admits an a.e. defined, symmetric, non-degenerate rank-2 tensor field $g_{\mu\nu}(x)$ on the regular set $M_{reg}\subseteq M$ (with $\mu_\infty(M\setminus M_{reg})=0$). It relates to infinitesimal distance via:
$$
ds^2 = g_{\mu\nu}(x) dx^\mu dx^\nu \quad \text{(66)}
$$
On $M_{reg}$, the quadraticity of the limit Cheeger energy makes the first-order differential structure infinitesimally Hilbertian, and the branch-appropriate Euclidean-rigidity/regularity theorem assumed in Theorem 44 yields the stated $C^{1,\alpha}$ regularity in appropriate coordinates. This metric tensor endows $(M_{reg}, g_{\mu\nu})$ with a compatible (a.e.) differentiable structure, establishing it as a (pseudo-)Riemannian manifold on the regular set induced by the underlying ND-RID propagation cost metric $d_{\mathcal{N}}$.

*Proof:* The quadratic Cheeger energy from Theorem 44 implies infinitesimal Hilbertianity, so the first-order differential structure on the doubling PI limit carries a pointwise inner product a.e. On $M_{reg}$, the Euclidean tangent cones $T_xM\cong\mathbb{R}^D$ provide the canonical local model; on the PU branch, $D=4$. Choosing measurable coordinate charts on $M_{reg}$ from the regularity theorem invoked in Theorem 44, define
$$
g_{\mu\nu}(x):=\langle \partial_\mu,\partial_\nu\rangle_x
$$
a.e. Symmetry and non-degeneracy follow from the Euclidean inner product on the tangent cone. By construction, (66) matches the quadratic approximation of $d_\infty$ in local coordinates on $M_{reg}$. The stated $C^{1,\alpha}$ regularity is exactly the regularity furnished on the selected branch by the Euclidean-rigidity/regularity hypothesis assumed in Theorem 44. ∎

## 11.5.2 Continuum Relabeling Symmetry and Diffeomorphism Invariance

The emergent manifold description obtained via Gromov–Hausdorff convergence (Theorem 44) and the existence of a metric tensor (Theorem 45) does not endow the theory with a preferred coordinate chart: coordinates are bookkeeping devices introduced only after the substrate has been compressed into an effective continuum representation. Because the substrate description is fundamentally relational and label-free, any coordinate chart used to represent the continuum limit is physically redundant.

Concretely, the PU dynamics and objective are expressed in terms of relational/predictive quantities (Definition D.1; Equation D.0) and graph-induced cost distances (Definition 35). These are invariant under relabelings of underlying degrees of freedom, and in the continuum limit this relabeling freedom becomes coordinate freedom. Operational predictions must therefore be invariant under diffeomorphisms of the induced (a.e.) differentiable structure on the emergent manifold (Theorem 45). This is the continuum expression of the same structural principle: *no physical content is carried by labels.*

As a result, the effective description must be expressible in a diffeomorphism-covariant form. Appendix X makes this concrete by identifying the gravitational sector of the effective action as a scalar-density integral over the emergent manifold (Equation X.7), and Section 12 then uses the standard locality and second-order consistency constraints (Lovelock uniqueness [Lovelock 1971]) to isolate the Einstein–Hilbert structure as the correct leading-order covariant dynamics at the MPU scale (Theorem 50).

**11.5.3 Theorem 45a (Relabeling–Covariance Closure)**

Let $M_{\mathrm{reg}}$ be the regular set of Theorem 45 with emergent metric $g_{\mu\nu}$, and let $\Psi$ denote the full collection of continuum fields obtained as $\Gamma$-limits of the coarse-grained PU dynamics.

**Hypothesis 11.5.3.1** (Local finite-order continuum description). For every precompact chart domain $U\Subset M_{\mathrm{reg}}$ and every chart $(\phi,U)$, the effective action has the local form
$$
S_U[\Psi] \;=\; \int_{\phi(U)} L\bigl(x,j^k\Psi(x)\bigr)\,d^4 x,\tag{67a}
$$
for some finite jet order $k$, where $j^k\Psi$ denotes the $k$-jet of $\Psi$. This is the Wilsonian truncation of Appendix X, also used in §11.3 and §12.

**Hypothesis 11.5.3.2** (Geometric-object status of the fields). The fields $\Psi$ are tensor/spinor geometric objects on $M_{\mathrm{reg}}$ with covariant pushforward under diffeomorphisms. This follows from the $\Gamma$-limit construction of §O.7.1 which produces tensor-valued continuum limits from the discrete PU substrate.

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

(b) *Diffeomorphism invariance of the global action.* For every compactly supported diffeomorphism $\varphi$ of $M_{\mathrm{reg}}$,
$$
S[\varphi^*\Psi] \;=\; S[\Psi].\tag{67d}
$$

Continuum diffeomorphism invariance is therefore a derived consequence of the substrate-level relabeling neutrality of §11.5.2. ∎

*Proof.* (a) In one chart, $S_U[\Psi]=\int_{\phi(U)} L\,d^4x$. In a second chart $(\phi',U')$, the same physical functional has $S_{U'}[\chi_*\Psi]=\int_{\phi'(U')} L'\,d^4x'$. By Hypothesis 11.5.3.3 these are equal for every admissible field configuration. Pulling back via $\chi$:
$$
\int_{\phi(U)} L\bigl(x,j^k\Psi(x)\bigr)\,d^4x \;=\; \int_{\phi(U)} L'\bigl(\chi(x),j^k(\chi_*\Psi)(\chi(x))\bigr)\,|\det D\chi(x)|\,d^4x.
$$
Since the equality holds for arbitrary $U$ and arbitrary local field data, the integrands satisfy the pointwise density transformation law $L'(x',\,\cdot\,)=L(x,\,\cdot\,)\,|\det D\chi^{-1}(x')|$. This is exactly the weight-one scalar-density transformation. The metric determinant $\sqrt{|g|}$ transforms by the same Jacobian factor under coordinate changes (Wald 1984, §2.4), so the ratio $\mathcal L:=L/\sqrt{|g|}$ is a scalar, giving (67c).

(b) Equivalence of passive coordinate relabeling (used in (a)) and active diffeomorphism of the manifold is standard (Wald 1984, §2.4; Hawking & Ellis 1973, §2.4): on a compactly supported region, the active diffeomorphism $\varphi$ acting on fields as $\Psi\mapsto\varphi^*\Psi$ is equivalent to a passive coordinate change. Applied to (67c): $\varphi$ acts on $\mathcal L$ as a scalar, on $\sqrt{|g|}\,d^4x$ as an invariant volume form, giving $S[\varphi^*\Psi]=S[\Psi]$. ∎

**Corollary 45a.1 (Derived Noether Identity for the Matter Sector).** Let $S[\Psi,g]=S_{\mathrm{geom}}[g]+S_{\mathrm{MPU}}[\Psi,g]$ with $S_{\mathrm{MPU}}$ of the scalar-density form of Theorem 45a, and define the matter stress-energy tensor
$$
T^{\mu\nu} \;:=\; -\frac{2}{\sqrt{|g|}}\,\frac{\delta S_{\mathrm{MPU}}}{\delta g_{\mu\nu}}.\tag{67e}
$$
If the matter fields satisfy their Euler–Lagrange equations, then $\nabla_\mu T^{\mu\nu}=0$.

*Proof.* Let $\xi^\mu$ be a compactly supported smooth vector field on $M_{\mathrm{reg}}$, and consider the infinitesimal diffeomorphism it generates. By Theorem 45a(b),
$$
0 \;=\; \delta_\xi S_{\mathrm{MPU}} \;=\; \int d^4x\,\sqrt{|g|}\,\Bigl[\frac{1}{\sqrt{|g|}}\frac{\delta S_{\mathrm{MPU}}}{\delta\Psi}\,\delta_\xi\Psi + \frac{1}{\sqrt{|g|}}\frac{\delta S_{\mathrm{MPU}}}{\delta g_{\mu\nu}}\,\delta_\xi g_{\mu\nu}\Bigr].
$$
On-shell $\delta S_{\mathrm{MPU}}/\delta\Psi=0$, so only the metric variation contributes. Using $\delta_\xi g_{\mu\nu}=\mathcal L_\xi g_{\mu\nu}=\nabla_\mu\xi_\nu+\nabla_\nu\xi_\mu$, the symmetry of $T^{\mu\nu}$, and integration by parts against compactly supported $\xi$:
$$
0 \;=\; \int d^4x\,\sqrt{|g|}\,(\nabla_\mu T^{\mu\nu})\,\xi_\nu.
$$
Since $\xi$ is arbitrary, $\nabla_\mu T^{\mu\nu}=0$. ∎

Premise (A4) of §12 is therefore a derived consequence of Theorem 45a together with the matter equations of motion.

**11.6 Finite Operational Causal Speed and Lorentzian Signature (Conditional on Thm 43, Thm 45)**

The emergent metric $g_{\mu\nu}$ inherits its causal structure and its signature from the ND-RID substrate. Theorem 46 establishes the finite invariant causal speed. The promotion of this causal cone to a Lorentzian principal symbol is then carried out by Appendix O, Theorems O.7a and O.7b, and imported into the main text by Corollary 46a.

**11.6.1 Theorem 46 (Finite Invariant Causal Speed)**

The causal structure inherent in ND-RID interactions imposes a finite, invariant maximum speed $c$ for causal influence propagation across the emergent manifold $(M,g_{\mu\nu})$. Finiteness arises from the minimum MPU processing time $\tau_{min}>0$ (Theorem 29) together with the existence of a nonzero microscopic interaction length scale $\delta>0$ (Appendix Q) and the fact that, in the viable regular regime, one-step propagation weights are uniformly bounded,
$$
0<w_{min}\le w_{xy}\le w_{max}<\infty,
$$
as established by the regularity necessity argument (Appendix C, Theorem C.2) and used in the induced propagation-cost metric (Definition 35).

Let $d_{\mathcal{N}}$ be the propagation-cost metric (Definition 35),
$$
d_{\mathcal{N}}(u,v)=\min_{\gamma:u\to v}\sum_{(x,y)\in\gamma}\delta \cdot w_{xy}.
$$
Each ND-RID edge-update requires time at least $\tau_{min}$ (Theorem 29). Consequently, causal influence propagation in the discrete substrate admits a finite maximal speed $c < \infty$, with $c \le \delta w_{max}/\tau_{min}$ in the regular regime and $c = \delta/\tau_{min}$ on the PCE-optimal uniform-weight branch (Appendix E, Theorem E.10.2). The promotion of this finite causal cone to a Lorentzian principal symbol is carried out in Corollary 46a below, which imports the signature theorem of Appendix O (Theorems O.7a and O.7b).

*Proof:* Consider any causal propagation along a path $\gamma$ consisting of $n$ successive ND-RID interaction edges. By Theorem 29, each edge crossing requires time at least $\tau_{min}$, hence the total propagation time satisfies
$$
t(\gamma)\ge n\,\tau_{min}.
$$
By Definition 35 and the uniform bound $w_{xy}\le w_{max}$, the metric length accumulated per edge is at most $\delta w_{max}$, so the total metric displacement satisfies
$$
d_{\mathcal{N}}(u,v)\le \sum_{(x,y)\in\gamma}\delta\, w_{xy}\le n\,\delta\, w_{max}.
$$
Therefore the effective propagation speed measured in the $d_{\mathcal{N}}$-induced continuum geometry is bounded by
$$
\frac{d_{\mathcal{N}}(u,v)}{t(\gamma)}\le \frac{n\,\delta\, w_{max}}{n\,\tau_{min}}=\frac{\delta\, w_{max}}{\tau_{min}}<\infty.
$$
Defining $c$ as the supremum causal speed in the continuum description yields $c\le \delta w_{max}/\tau_{min}$, hence $c$ is finite. Because this bound depends only on the substrate constants $\delta$, $\tau_{min}$, and the uniform regularity bounds on admissible link weights, the same maximal-speed bound applies in every local regular patch. In the PCE-optimal uniform-weight regime, Appendix E (Theorem E.10.2) shows that one-link propagation saturates the bound at
$$
v_{max}=\frac{\delta}{\tau_{min}},
$$
so in that regime $c=v_{max}=\delta/\tau_{min}$.

A finite invariant maximal speed $c$ defines a nontrivial operational causal frontier on the emergent manifold. This frontier supplies the nondegenerate-cone input (Hypothesis O.7.2.4) of the Appendix O signature closure theorem. The promotion of the causal frontier to a Lorentzian principal symbol requires three further structural inputs: a positive-definite spatial block from §O.7.1 (Hypothesis O.7.2.1), an entropy-selected time coordinate from Theorem 31 and Appendix J (Hypothesis O.7.2.2), and a second-order continuum principal symbol (Hypothesis O.7.2.3). Under those four hypotheses together with the three-spatial-dimensional branch fixed by Theorem Z.11, the Lorentzian signature conclusion $(-,+,+,+)$ is supplied by Corollary 46a below, which imports Theorems O.7a–O.7b and Corollary O.7b.1 of Appendix O. This theorem establishes the finite causal-speed bound; the Lorentzian signature conclusion is supplied by Corollary 46a under the Appendix O hypotheses.

Finally, superluminal propagation contradicts the instantiation bounds formalized in Appendix E: exceeding $c=\delta/\tau_{\text{min}}$ on the uniform-weight branch would require either completing an ND-RID update in time $<\tau_{\text{min}}$ (violating Theorem 29) or traversing multiple links within one minimal cycle while reducing the per-link irreducible entropy cost below $\ln 2$ (contradicting $\varepsilon \ge \ln 2$ of Theorem 31), exactly as stated in Appendix E (Corollary E.10.2). ∎

**Corollary 46a (Lorentzian Signature and Local Lorentz Kinematics from Theorem 46 and Appendix O).** The finite operational causal frontier of Theorem 46, together with the positive-definite spatial $\Gamma$-limit of §O.7.1, the entropy-selected time coordinate of Hypothesis O.7.2.2, and the second-order continuum principal symbol of Hypothesis O.7.2.3, supplies the four hypotheses of Theorem O.7a. By Theorems O.7a and O.7b and Corollary O.7b.1 of Appendix O, this package forces a Lorentzian principal symbol on the emergent manifold and derives local Lorentz invariance with structure group $SO^+(1,3)$. Premise (A5) of §12 is therefore a theorem of the emergent-spacetime branch, and the Lorentzian factor $\mathrm{Spin}(1,3)$ in the principal bundle $G=\mathrm{Spin}(1,3)\times U(d_0)$ of Theorem 48 is structurally forced conditional on the spin obstruction $w_2(M_{\mathrm{reg}})=0$.

*Proof.* Direct application of Theorems O.7a (signature forcing), O.7b (speed normalization), and Corollary O.7b.1 (derived local Lorentz invariance and frame-bundle structure) to the output of Theorem 46 and §O.7.1. The three-spatial-dimensional hypothesis of Theorem O.7a is supplied on the Appendix Z tangent-kissing mode-channel branch of Theorem Z.11. ∎

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

**Theorem 46b (Causal-Diamond Reconstruction of the Emergent Metric Branch).** Let $(M,g,V_{\mathrm{cap}})$ and $(M',g',V'_{\mathrm{cap}})$ be two connected, time-oriented, past-and-future distinguishing, globally hyperbolic regular Lorentzian branches satisfying Definition 46b. Suppose there is a bijection
$$
\Phi:\mathcal D_{\mathrm{op}}(M)\to\mathcal D_{\mathrm{op}}(M')
$$
such that
$$
D_1\subseteq D_2
\quad\Longleftrightarrow\quad
\Phi(D_1)\subseteq\Phi(D_2)
$$
and
$$
V_{\mathrm{cap}}(D)=V'_{\mathrm{cap}}(\Phi(D))
$$
for every operational diamond $D$. Then:

1. $\Phi$ induces a homeomorphism $F:M\to M'$.
2. $F$ preserves the causal order.
3. $F$ determines the conformal Lorentzian metric:
$$
F^*[g']=\Omega^2[g]
$$
for a positive function $\Omega$ on the regular set.
4. If both branches use the same capacity density normalization
$$
V_{\mathrm{cap}}(D)=\sigma_{\mathrm{cap}}\operatorname{Vol}_g(D),
\qquad
V'_{\mathrm{cap}}(D')=\sigma_{\mathrm{cap}}\operatorname{Vol}_{g'}(D')
$$
on sufficiently small diamonds, then $\Omega=1$ almost everywhere on the regular set, so the metric scale is fixed by the capacity valuation.

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

2. For an infinitesimal coordinate parallelogram $\square_{\mu\nu}$ based at $x$, the unitary component $U_{\square_{\mu\nu}}^{\mathrm{pred}}$ of closed-system predictive transport satisfies
$$
U_{\square_{\mu\nu}}^{\mathrm{pred}}
=
\mathbb I
+
\mathcal F_{\mu\nu}^{\mathrm{pred}}(x)\,\Delta x^\mu\Delta x^\nu
+
O(|\Delta x|^3).
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

Theorem 47 identifies $\mathcal F_{\mu\nu}^{\mathrm{pred}}$ as the closed-system curvature of predictive-frame transport in the continuum limit, with Riemann curvature and internal gauge field strength obtained by projection. When ND-RID holds, transport between neighboring "contexts" is generically *open* (not strictly unitary) because irreversibility enforces contractivity at the operational level (Appendix E, Lemma E.1). The appropriate object is therefore a completely positive, trace-preserving (CPTP) transport map on reduced states, not a pure unitary parallel transport.

**Infinitesimal Transport Structure.**
Let $\mathcal{E}_{\Delta\tau}$ denote the CPTP transport channel associated with proper time displacement $\Delta\tau$ along a timelike worldline in emergent coordinates. In the Markovian regime, its generator admits the standard GKSL decomposition [Gorini, Kossakowski & Sudarshan 1976; Lindblad 1976]:
$$
\mathcal{E}_{\Delta\tau}(\rho) = \rho + \Delta\tau \, \mathcal{L}(\rho) + O(\Delta\tau^2),
$$
$$
\mathcal{L}(\rho) = -i[H, \rho] + \sum_a \left( L_a \rho L_a^\dagger - \frac{1}{2}\{L_a^\dagger L_a, \rho\} \right),
$$
with $H$ the unitary (Hamiltonian/connection) component and the $\{L_a\}$ encoding dissipation/decoherence.

For spatial transport, the analogous structure requires path-ordering. Let $\gamma: [0,1] \to M$ be a smooth spatial curve with tangent $\dot{\gamma}^\mu$. The finite transport map $\mathcal{E}_\gamma$ is constructed as:
$$
\mathcal{E}_\gamma = \overleftarrow{\mathcal{P}} \exp\!\left( \int_0^1 ds \, \dot{\gamma}^\mu(s) \, \mathcal{L}_\mu \right),
$$
where $\overleftarrow{\mathcal{P}}$ denotes path-ordering and each $\mathcal{L}_\mu$ is a GKSL generator along the $\mu$-direction. This path-ordered exponential is necessary because the generators at different points generically do not commute.

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
In the weak-field static branch used in Appendix S,
$$
\frac{d\tau}{dt}=1+\frac{\Phi}{c^2}+O(c^{-4}),
$$
so the exact leading chronometric phase-rate invariant is
$$
|\dot\Theta_{ij}|
=
\frac{|\Delta E_{ij}|}{\hbar}\frac{|\Delta\Phi|}{c^2}
+
O(c^{-4}).
$$
Equivalently,
$$
\mathcal D_{ij}^{\phi}
:=
\frac{\hbar|\dot\Theta_{ij}|}{|\Delta E_{ij}|}
=
\frac{|\Delta\Phi|}{c^2}
+
O(c^{-4}).
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
\frac{|\Delta E_{ij}|}{\hbar}\frac{|\Delta\Phi|}{c^2}
+
O(c^{-4}),
$$
and the normalized dephasing invariant is
$$
\mathcal D_{ij}^{\Gamma}
:=
\frac{\hbar\Gamma_{\mathrm{ch}}^{(ij)}}{|\Delta E_{ij}|}
=
\frac{|\Delta\Phi|}{c^2}
+
O(c^{-4}).
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

*Proof.* The spin-lift obstruction theorem applied to the orthonormal frame bundle; the internal $U(d_0)$ part carries no analogous obstruction class in the present construction. ∎

**11.8.3 Theorem 48c (Conditional Global CPTP Transport Closure).** Let $P(M_{\mathrm{reg}},\mathrm{Spin}(1,3)\times U(d_0))$ be the principal bundle of Theorem 48 (globally exact under Theorem 48b), and let $\mathcal W=S\otimes E$ be the associated spin-internal bundle (Theorem G.4b). Assume:

(i) *Bundle-respecting Stinespring dilation.* The local CPTP transport maps $\Phi_\gamma$ admit Stinespring dilations whose system-side unitary factor lifts the parallel transport of the product connection on $\mathcal W=S\otimes E$ (Theorem G.4b); equivalently, the dilation environment is chosen so that the system-side unitary $U_\gamma|_{\mathcal W}$ commutes with the bundle gauge action and reduces to the product-connection holonomy in the closed-system limit $\mathcal H_{\mathrm{env}}\to\mathbb C$.

(ii) *Markovian semigroup limit.* On bounded local time windows, the family $\{\Phi_\gamma\}$ admits a strongly continuous Markovian semigroup limit on $\mathrm{End}(\mathcal W_x)$.

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

*Proof.* Every CPTP map admits a minimal Stinespring dilation [Stinespring 1955]; hypothesis (i) selects the bundle-respecting realization in which the system-side unitary factor lifts the parallel transport of the product connection on $S\otimes E$ (Theorem G.4b). Tracing out the environment gives the open-system transport. Under hypothesis (ii), the Lindblad–GKSL form is the standard classification of completely positive Markov semigroups [Gorini–Kossakowski–Sudarshan 1976; Lindblad 1976]. Covariance follows because the Hamiltonian part is built from the same product connection on every chart overlap, so $H_D$ transforms covariantly under the bundle's transition functions. ∎

Theorem 48c closes the gap between Theorem 47 (predictive holonomy as curvature) and Theorem 48 (fibre-bundle representation): under the stated open-system hypotheses, the CPTP transport law is a completion of the same underlying bundle transport.

**11.9 Role of MPU Stress-Energy Tensor**

As established by Theorem 47 and the connection dynamics of Theorem 48, non-frame-removable inhomogeneities in MPU activity enter the predictive connection and are measured by its curvature. This activity is quantitatively captured by the macroscopic MPU Stress-Energy Tensor ($T_{\mu\nu}^{(MPU)}$, Definition B.8 in Appendix B), derived by coarse-graining microscopic MPU costs/activity. It is this macroscopic tensor $T_{\mu\nu}^{(MPU)}$ that serves as the source term driving the spacetime curvature $R^{\rho}{}_{\sigma\mu\nu}$ and appearing on the right-hand side of the emergent gravitational field equations derived thermodynamically in the next section. The operational causal-speed branch—the frontier speed $c=\delta/\tau_{\text{min}}$ in the PCE-optimal uniform-weight regime (Theorem 46; Appendix E, Theorem E.10.2)—is thus tied to the entropy costs of information propagation. Its promotion to a Lorentzian light cone is the Appendix O branch imported by Corollary 46a, and the exact values of $\delta$ and $\tau_{\min}$ inherit the Appendix Q discretization branches.

