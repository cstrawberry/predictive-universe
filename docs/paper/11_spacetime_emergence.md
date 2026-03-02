# 11 Emergence of Spacetime Geometry (Conditional Derivation)

This section details the proposed emergence of continuum spacetime geometry from the underlying discrete MPU network, conditional upon the Necessary Emergence of Geometric Regularity (Theorem 43) justified in Appendices C and D. The emergence process is presented in stages: demonstrating convergence of the discrete network metric space to a continuous manifold, identifying the metric tensor, and deriving the Lorentzian signature and invariant speed from the causal structure of MPU interactions. The interpretation of curvature as predictive holonomy is also discussed.

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

For the discrete metric space $(\mathcal{V}, d_{\mathcal{N}})$ to yield a smooth continuum spacetime, the network structure must possess large-scale geometric regularity.

**11.3.1 Definition 36 (Def 36): Uniform D-dim Polynomial Volume Growth**

A sequence of MPU networks $\{\mathcal{N}_n\}$ exhibits uniform D-dimensional polynomial volume growth if there exist constants $K_1, K_2 > 0$, dimension $D \ge 1$, and scale $R_0$ such that for large $n$, all $v \in \mathcal{V}_n$, and all radii $R > R_0$:
$$
K_1 \left(\frac{R}{\delta_{eff, n}}\right)^D \leq |B_{R}(v)| \leq K_2 \left(\frac{R}{\delta_{eff, n}}\right)^D \quad \text{(65)}
$$
where $B_{R}(v)$ is the metric ball, $|B_{R}(v)|$ its vertex count, and $\delta_{eff, n}$ the characteristic microscopic scale $\delta \langle w_{uv} \rangle_{avg}$. This ensures consistent effective dimension $D$.

**11.3.2 Definition 37 (Def 37): Uniformly Bounded Synthetic Ricci Curvature**

A network $\mathcal{N}$ has uniformly bounded synthetic Ricci curvature if there exists a constant $K$ such that the chosen discrete curvature notion (e.g. a Bakry–Émery curvature‑dimension inequality or an Ollivier‑Ricci lower bound) satisfies $\text{Ric}_N \ge -K$ uniformly and, together with Definition 36, yields uniform volume‑doubling and a (1,2) Poincaré‑type inequality for the associated counting measure on $(\mathcal{V}, d_{\mathcal{N}})$. This controls local divergence/convergence of geodesics in the sense required for the pGH compactness and rectifiability statements in Theorem 44.

**Theorem 43 (Necessary Emergence of Geometric Regularity)**

Geometric regularity, encompassing both uniform D-dimensional polynomial volume growth (Definition 36) and uniformly bounded synthetic Ricci curvature (Definition 37), is a necessary condition for any MPU network configuration to be a stable, viable equilibrium state under the optimizing dynamics driven by POP (Axiom 1) and PCE (Definition 15), as rigorously justified by necessity arguments in **Appendix C** and long-run dynamical concentration in **Appendix D**. Geometric irregularity increases propagation and operational costs and is therefore dynamically penalized by the POP/PCE objective, so configurations lacking geometric regularity are dynamically selected against.

*Proof Summary and Mechanism:* Geometric regularity emerges as a necessary condition for viability through two complementary arguments detailed in **Appendix C** and **Appendix D**. Appendix C establishes *necessity*, demonstrating that configurations significantly violating regularity (Defs 36, 37) suffer operational failures (coherence decay, super-extensive costs, volatility) incompatible with sustained viability under POP/PCE (Thms C.2, C.4, C.6). Appendix D provides the *dynamical justification* by analyzing the PCE Potential $V(x)$ (Def D.1) that the system's adaptation dynamics minimize. The mechanism relies on the assertion (Lemma D.3) that geometric irregularities inherently increase the core cost components of $V(x)$ and decrease the benefit component, conditional upon assumptions regarding cost convexity and the structure of the potential landscape. Specifically, anomalous dimension increases propagation costs $V_{prop}$ (Thm C.2), while curvature fluctuations increase operational costs $V_{op}$ (via cost convexity, Thm C.4) and decrease achievable benefits $V_{benefit}$ (due to instability/coherence loss). Consequently, irregular configurations correspond to higher values of the core potential $V_{core} = V_{op} + V_{prop} - V_{benefit}$ (Thm D.2, Lemma D.4). The system's adaptation dynamics are modeled as a stochastic gradient flow on the full potential $V(x)$ (Eq D.8), which includes $V_{core}$ plus alignment/consistency penalties. This flow, combined with stochastic noise that ensures escape from potential local, irregular minima (Lemma D.6), produces an ergodic process whose long-run stationary regime concentrates on the lower-potential set $\mathcal{E}_{*}^{\text{reg}}$ of regular configurations (which constitute the global minima, Thm D.3). Therefore, geometric regularity emerges dynamically as the favoured outcome of the framework's core optimization principles (POP/PCE), selected via the Gibbs concentration mechanism of Thm D.5. QED

**11.4 Geometric Convergence to a Continuous Manifold (Conditional on Thm 43)**

Assuming the necessary geometric regularity holds (Theorem 43), Gromov-style compactness [Gromov 1999] yields a continuum limit of the discrete MPU network metric space. Under the non‑collapse and synthetic‑Ricci hypotheses encoded in Definitions 36–37, the limit admits an a.e. Euclidean (regular) set supporting an effective manifold description.

**11.4.1 Theorem 44 (Gromov-Hausdorff Limit)**

**Conditional on Theorem 43**, consider a sequence of pointed, rescaled MPU network metric spaces $\{(X_n, o_n) = (\mathcal{V}_n, \delta_{eff, n}^{-1} d_{\mathcal{N}_n}, o_n)\}$ where mesh size $\delta_{eff, n} \to 0$. Equip each rescaled space with the normalized counting measure $\mu_n$ (normalized so that $\mu_n(B_1(o_n))=1$ after rescaling). Geometric regularity (Definitions 36 and 37) provides uniform volume doubling and a (1,2)-Poincaré‑type inequality on fixed-radius balls in the rescaled spaces. This ensures pre‑compactness in the pointed Gromov–Hausdorff (pGH) topology [Gromov 1999]. Consequently, a subsequence converges in pGH sense to a limit pointed metric space $(M, d_\infty, o_\infty)$. Moreover, along the same subsequence the measures $\mu_n$ subconverge in the corresponding measured sense to a Radon measure $\mu_\infty$ on $M$, so $(M,d_\infty,\mu_\infty)$ is a doubling PI space whose effective dimension matches the volume growth exponent $D$ from Definition 36. In particular, there exists a Borel regular set $M_{reg}\subseteq M$ with $\mu_\infty(M\setminus M_{reg})=0$ such that for every $p\in M_{reg}$, tangent cones are Euclidean $\mathbb{R}^D$; under the non‑collapsing normalization implicit in Definition 36, the $D$-dimensional Euclidean tangent is unique $\mu_\infty$‑a.e.
*Proof:* By Definitions 36–37 the rescaled spaces satisfy uniform doubling and a uniform (1,2)-Poincaré inequality on bounded balls. Gromov's precompactness theorem yields a pGH-convergent subsequence to a complete proper limit $(M,d_\infty,o_\infty)$ [Gromov 1999]. Stability of doubling/PI under measured Gromov–Hausdorff convergence yields a Radon limit measure $\mu_\infty$ with $(M,d_\infty,\mu_\infty)$ doubling and PI. The existence (and, in the non‑collapsed synthetic‑Ricci regime) a.e. uniqueness of Euclidean tangents on a full‑measure regular set is provided by the standard regularity theory for such limits (e.g. Cheeger–Colding theory; RCD$(K,N)$ frameworks) [Cheeger & Colding 1997, 2000]. ∎

**11.5 Emergence of the Metric Tensor (Conditional on Thm 43, Thm 44)**

The existence of Euclidean tangent cones on the regular set allows definition of an a.e. Riemannian metric tensor compatible with the limit distance.

**11.5.1 Theorem 45 (Metric Tensor $g_{\mu\nu}$)**

Conditional on Theorem 44, the limit space admits an a.e. defined, symmetric, non-degenerate rank-2 tensor field $g_{\mu\nu}(x)$ on the regular set $M_{reg}\subseteq M$ (with $\mu_\infty(M\setminus M_{reg})=0$). It relates to infinitesimal distance via:
$$
ds^2 = g_{\mu\nu}(x) dx^\mu dx^\nu \quad \text{(66)}
$$
On $M_{reg}$, the non‑collapsed synthetic‑Ricci regime yields $C^{1,\alpha}$ regularity in appropriate coordinates (e.g. harmonic coordinates on the regular set) [Cheeger & Colding 2000]. This metric tensor endows $(M_{reg}, g_{\mu\nu})$ with a compatible (a.e.) differentiable structure, establishing it as a (pseudo-)Riemannian manifold on the regular set induced by the underlying ND-RID propagation cost metric $d_{\mathcal{N}}$.
*Proof:* On $M_{reg}$, Euclidean tangent cones $T_xM\cong\mathbb{R}^D$ provide a canonical inner product $\langle\cdot,\cdot\rangle_x$ a.e. Choosing measurable coordinate charts on $M_{reg}$ from the differentiable structure associated with doubling+Poincaré (as ensured in Theorem 44), define $g_{\mu\nu}(x):=\langle \partial_\mu,\partial_\nu\rangle_x$ a.e. Symmetry and non-degeneracy follow from properties of the Euclidean inner product on the tangent cone. By construction, (66) matches the quadratic approximation of $d_\infty$ in local coordinates on $M_{reg}$. Regularity statements follow from the regularity theory for non‑collapsed synthetic‑Ricci limits on the regular set [Cheeger & Colding 2000]. ∎

## 11.5.2 Continuum Relabeling Symmetry and Diffeomorphism Invariance

The emergent manifold description obtained via Gromov–Hausdorff convergence (Theorem 44) and the existence of a metric tensor (Theorem 45) does not endow the theory with a preferred coordinate chart: coordinates are bookkeeping devices introduced only after the substrate has been compressed into an effective continuum representation. Because the substrate description is fundamentally relational and label-free, any coordinate chart used to represent the continuum limit is physically redundant.

Concretely, the PU dynamics and objective are expressed in terms of relational/predictive quantities (Definition D.1; Equation D.0) and graph-induced cost distances (Definition 35). These are invariant under relabelings of underlying degrees of freedom, and in the continuum limit this relabeling freedom becomes coordinate freedom. Operational predictions must therefore be invariant under diffeomorphisms of the induced (a.e.) differentiable structure on the emergent manifold (Theorem 45). This is the continuum expression of the same structural principle: *no physical content is carried by labels.*

As a result, the effective description must be expressible in a diffeomorphism-covariant form. Appendix X makes this concrete by identifying the gravitational sector of the effective action as a scalar-density integral over the emergent manifold (Equation X.7), and Section 12 then uses the standard locality and second-order consistency constraints (Lovelock uniqueness [Lovelock 1971]) to isolate the Einstein–Hilbert structure as the correct leading-order covariant dynamics at the MPU scale (Theorem 50).


**11.6 Lorentzian Signature and Invariant Speed (Conditional on Thm 43, Thm 45)**

The emergent metric $g_{\mu\nu}$ inherits its signature from the causal structure of MPU interactions.

**11.6.1 Theorem 46 (Lorentzian Metric and Speed $c$)**

The causal structure inherent in ND-RID interactions imposes a finite, invariant maximum speed $c$ for causal influence propagation across the emergent manifold $(M,g_{\mu\nu})$. Finiteness arises from the minimum MPU processing time $\tau_{min}>0$ (Theorem 29) together with the existence of a nonzero microscopic interaction length scale $\delta>0$ (Appendix Q) and the fact that, in the viable regular regime, one-step propagation weights are uniformly bounded,
$$
0<w_{min}\le w_{xy}\le w_{max}<\infty,
$$
as established by the regularity necessity argument (Appendix C, Theorem C.2) wherein PCE-viable configurations require bounded weight uniformity, and used in the induced propagation-cost metric (Definition 35).

Let $d_{\mathcal{N}}$ be the propagation-cost metric (Definition 35),
$$
d_{\mathcal{N}}(u,v)=\min_{\gamma:u\to v}\sum_{(x,y)\in\gamma}\delta \cdot w_{xy}.
$$
Each ND-RID edge-update requires time at least $\tau_{min}$ (Theorem 29). Consequently, causal influence propagation in the discrete substrate admits a finite maximal speed. In the continuum limit, the existence of a finite invariant cone speed forces the effective metric $g_{\mu\nu}$ to be indefinite (pseudo-Riemannian), admitting nontrivial null directions ($ds^2=0$ for some nonzero $dx^\mu$). Given time directionality (Theorem 4) and emergent dimension $D=4$ (Theorem Z.11), the signature is Lorentzian (conventionally $(-+++)$ or $(+---)$).

*Proof:* Consider any causal propagation along a path $\gamma$ consisting of $n$ successive ND-RID interaction edges. By Theorem 29, each edge crossing requires time at least $\tau_{min}$, hence the total propagation time satisfies
$$
t(\gamma)\ge n\,\tau_{min}.
$$
By Definition 35 and the uniform bound $w_{xy}\le w_{max}$ (Appendix C), the metric length accumulated per edge is at most $\delta w_{max}$, so the total metric displacement satisfies
$$
d_{\mathcal{N}}(u,v)\le \sum_{(x,y)\in\gamma}\delta\, w_{xy}\le n\,\delta\, w_{max}.
$$
Therefore the effective propagation speed measured in the $d_{\mathcal{N}}$-induced continuum geometry is bounded by
$$
\frac{d_{\mathcal{N}}(u,v)}{t(\gamma)}\le \frac{n\,\delta\, w_{max}}{n\,\tau_{min}}=\frac{\delta\, w_{max}}{\tau_{min}}<\infty.
$$
Defining $c$ as the supremum causal speed in the continuum description yields $c\le \delta w_{max}/\tau_{min}$, hence $c$ is finite. The bound is saturated for PCE-optimal configurations: Appendix E (Theorem E.10.2) derives that information propagation through the MPU network achieves maximum velocity
$$
v_{max}=\frac{\delta}{\tau_{min}},
$$
which is identified with the emergent invariant speed $c$ (Appendix Q, Proposition Q.6.1). In PCE-optimal regular configurations where propagation costs are uniform ($w_{xy} \approx 1$ for typical links), the general bound $c \le \delta w_{max}/\tau_{min}$ reduces to $c = \delta/\tau_{min}$. Local null cones then represent propagation at the maximal causal rate permitted by the MPU substrate.

A finite invariant maximal speed $c$ defines a nontrivial cone structure (null directions saturating the bound). Encoding such cones in a metric requires null vectors, hence an indefinite (pseudo-Riemannian) metric. With time directionality (Theorem 4) selecting a time orientation and with $D=4$ fixed by Theorem Z.11, the resulting non-degenerate signature class is Lorentzian.

Finally, superluminal propagation contradicts the instantiation bounds formalized in Appendix E: exceeding $c=\delta/\tau_{\text{min}}$ would require either completing an ND-RID update in time $<\tau_{\text{min}}$ (violating Theorem 29) or traversing multiple links within one minimal cycle while reducing the per-link irreducible entropy cost below $\ln 2$ (contradicting $\varepsilon \ge \ln 2$ of Theorem 31), exactly as stated in Appendix E (Corollary E.10.2). ∎

**11.7 Spacetime Curvature as Predictive Holonomy (Conditional on Thm 43, Thm 45)**

Curvature of the emergent Lorentzian spacetime $(M, g_{\mu\nu})$ arises from path-dependence of information transport within the MPU network.

**11.7.1 Theorem 47 (Predictive Holonomy and Riemann Curvature)**

The Riemann curvature tensor $R^{\rho}{}_{\sigma\mu\nu}$ of the emergent manifold $(M, g_{\mu\nu})$ is the geometric component of the infinitesimal Predictive Holonomy: the net frame/perspective transformation induced by transporting MPU information around an infinitesimal closed loop. Let $\mathcal{E}_\gamma$ denote the (generally open) ND-RID transport along a curve $\gamma$, and let $U_\gamma$ be the unitary (Hamiltonian/connection) component of this transport (equivalently, the unitary part generated by the $-i[H,\cdot]$ sector in the GKSL generators of Section 11.7.2). Define a Lie-algebra valued connection 1-form $A_\mu$ by the first-order expansion of transport along an infinitesimal displacement:
$$
U_{x\to x+\Delta x}= \mathbb I + A_\mu(x)\,\Delta x^\mu + O(|\Delta x|^2).
$$
Then the holonomy around an infinitesimal coordinate parallelogram $\square_{\mu\nu}$ based at $x$ with sides $\Delta x^\mu$ and $\Delta x^\nu$ satisfies
$$
U_{\square_{\mu\nu}}
=
\mathbb I + F_{\mu\nu}(x)\,\Delta x^\mu \Delta x^\nu + O(|\Delta x|^3),
$$
where
$$
F_{\mu\nu}=\partial_\mu A_\nu-\partial_\nu A_\mu+[A_\mu,A_\nu].
$$
With the bundle decomposition (Theorem 48) $A_\mu=\omega_\mu\oplus A_\mu^{\mathrm{int}}$, one has $F_{\mu\nu}=R_{\mu\nu}\oplus F_{\mu\nu}^{\mathrm{int}}$, and the $\mathfrak{spin}(1,3)$ component $R_{\mu\nu}$ corresponds to the Riemann curvature 2-form and tensor $R^{\rho}{}_{\sigma\mu\nu}$. Because local ND-RID transport rules are context-dependent (Assumption 1), and the coarse-grained context is parameterized by the local activity tensor $T_{\mu\nu}^{(MPU)}$ (Definition B.8, Appendix B), spatial variation of $T_{\mu\nu}^{(MPU)}$ generically induces nontrivial $\partial_\mu A_\nu-\partial_\nu A_\mu$ and/or noncommutativity $[A_\mu,A_\nu]\neq 0$, hence nonzero predictive holonomy and geometric curvature.
*Proof:* By definition of $A_\mu$, transport along an infinitesimal segment in the $\mu$ direction is $U_\mu:=\mathbb I+A_\mu(x)\Delta x^\mu+O(|\Delta x|^2)$, while transport along the $\nu$ direction from the displaced point is $U_\nu':=\mathbb I+\big(A_\nu(x)+(\partial_\mu A_\nu)\Delta x^\mu\big)\Delta x^\nu+O(|\Delta x|^2)$. The loop holonomy is
$$
U_{\square_{\mu\nu}}=U_\nu' U_\mu \,U_\nu^{-1} U_\mu^{-1}.
$$
Expanding to second order and using $U_\mu^{-1}=\mathbb I-A_\mu\Delta x^\mu+O(|\Delta x|^2)$ (and similarly for $U_\nu^{-1}$) yields
$$
U_{\square_{\mu\nu}}
=
\mathbb I+\big(\partial_\mu A_\nu-\partial_\nu A_\mu+[A_\mu,A_\nu]\big)\Delta x^\mu\Delta x^\nu+O(|\Delta x|^3),
$$
which identifies the curvature $F_{\mu\nu}$. Decomposing $A_\mu=\omega_\mu\oplus A_\mu^{\mathrm{int}}$ yields $F_{\mu\nu}=R_{\mu\nu}\oplus F_{\mu\nu}^{\mathrm{int}}$, with $R_{\mu\nu}$ the geometric curvature 2-form determining $R^{\rho}{}_{\sigma\mu\nu}$. If the local transport generator depends on context (Assumption 1), then $A_\mu(x)$ depends on local coarse-grained state data, in particular on $T_{\mu\nu}^{(MPU)}(x)$; spatial inhomogeneity of this data implies $A_\mu$ is not pure gauge globally and generically produces $F_{\mu\nu}\neq 0$, i.e. path dependence and curvature. ∎

## 11.7.2 Dissipative Companion to Predictive Holonomy

Theorem 47 identifies the geometric curvature tensor as the geometric component of predictive holonomy in the continuum limit. When ND-RID holds, transport between neighboring "contexts" is generically *open* (not strictly unitary) because irreversibility enforces contractivity at the operational level (Appendix E, Lemma E.1). The appropriate object is therefore a completely positive, trace-preserving (CPTP) transport map on reduced states, not a pure unitary parallel transport.

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

**Gravitational Decoherence from Curvature.**
A concrete gravitational example appears in Appendix S, where differential time-dilation induces phase gradients. The gravitationally induced phase difference between two branches of a spatial superposition is (Equation S.54):
$$
\Delta\phi_{ij}^{(\mathrm{grav})} = -\frac{\Delta E_{ij}}{\hbar}\,\Delta\tau_{diff}
= -\frac{\Delta E_{ij}}{\hbar}\left(\frac{\Delta\Phi}{c^2}\tau_c\right).
$$

To connect $\Delta\Phi$ to curvature in a coordinate-invariant way, work in Fermi normal coordinates $(t, x^m)$ about a freely falling reference worldline [Manasse & Misner 1963]. To quadratic order in spatial distance:
$$
g_{00}(t, x) = -1 - R_{0m0n}(t, 0) \, x^m x^n + O(|x|^3),
$$
and in the weak-field identification $g_{00} \approx -(1 + 2\Phi/c^2)$ this yields the local tidal potential:
$$
\Phi(x) = +\frac{c^2}{2} \, R_{0m0n}(t, 0) \, x^m x^n + O(|x|^3).
$$

*Derivation.* Equating the two expressions for $g_{00}$:
$$
-1 - R_{0m0n} x^m x^n = -1 - \frac{2\Phi}{c^2}
\quad \Longrightarrow \quad
\Phi = +\frac{c^2}{2} R_{0m0n} x^m x^n.
$$

For two branches separated by displacement $L_q^m$ about a reference location $x^m$, one obtains:
$$
\Delta\Phi = \Phi(x + L_q) - \Phi(x)
= +c^2 \, R_{0m0n} \, x^m L_q^n + \frac{c^2}{2} \, R_{0m0n} \, L_q^m L_q^n + O(|x|^2|L_q|, |x||L_q|^2, |L_q|^3).
$$
Substituting into the phase formula (S.54) and using the decoherence-rate definition (S.56),
$$
\Gamma_{\mathrm{deco}}^{(ij)} := \frac{|\Delta\phi_{ij}^{(\mathrm{grav})}|}{\tau_c},
$$
one obtains the exact operational form
$$
\Gamma_{\mathrm{deco}}^{(ij)} = \frac{|\Delta E_{ij}|}{\hbar}\,\frac{|\Delta\Phi|}{c^2}.
$$
Using the curvature expansion for $\Delta\Phi$ above then gives, to the displayed order,
$$
\Gamma_{\mathrm{deco}}^{(ij)} =
\frac{|\Delta E_{ij}|}{2\hbar}\left|
R_{0m0n}(t,0)\left(2x^m L_q^n + L_q^m L_q^n\right)
\right|
+O\!\left(\frac{|\Delta E_{ij}|}{\hbar}\Big(|x|^2|L_q|+|x||L_q|^2+|L_q|^3\Big)\right).
$$
In particular, for a symmetric superposition centered on the reference worldline ($x=0$),
$$
\Gamma_{\mathrm{deco}}^{(ij)} =
\frac{|\Delta E_{ij}|}{2\hbar}\left|R_{0m0n}(t,0)\,L_q^m L_q^n\right|
+O\!\left(\frac{|\Delta E_{ij}|}{\hbar}|L_q|^3\right),
$$
while for off-center separations the mixed term proportional to $x^m L_q^n$ dominates at the displayed order.

**Testable PU discriminator against self-gravity collapse models.**
The predicted irreversible dephasing rate depends on the tidal curvature tensor and the internal energy splitting $\Delta E_{ij}$. For two-branch interferometers engineered so that the branches have the *same* mass density distribution but differ by an internal clock splitting $\Delta E_{ij}$, the PU prediction above gives $\Gamma_{\mathrm{deco}}^{(ij)} \propto \Delta E_{ij}$ at fixed geometry; Penrose–Diósi-type self-gravity collapse rates depend primarily on the branch mass-density difference and are insensitive to internal $\Delta E_{ij}$. Conversely, because the PU rate is curvature-controlled, it vanishes at this order in flat spacetime ($R_{0m0n}=0$) and is invariant under removing a purely uniform-acceleration contribution (no tidal curvature).

This identifies a precise sense in which curvature (as predictive holonomy) and decoherence (as ND-RID dissipation in transport) are two faces of the same operational transport structure: the holonomy component defines the emergent geometry (Theorem 47), while the contractive component quantifies the irreducible loss of predictive distinguishability along that geometry (Lemma E.1; Appendix S, Section S.7).

**11.8 Fibre Bundle Structure**

Unifying external spacetime and internal MPU degrees of freedom requires a principal fibre bundle structure.

**11.8.1 Theorem 48 (Fibre-Bundle Representation)**

Conditional on Theorems 44-46, the full state and dynamics of the MPU network can be described using a principal fibre bundle $P(M,G)$ over the emergent spacetime manifold $M$, with structure group $G = \text{Spin}(1,3) \times U(d_0)$.

1.  **Fibre:** At each spacetime point $x \in M$, the fibre $\pi^{-1}(x)$ represents the space of possible local reference frames. It consists of pairs $(\mathcal{F}_x, \mathcal{P}_x)$, where $\mathcal{F}_x$ is a local Lorentz frame (an orthonormal basis for the tangent space $T_x M$), and $\mathcal{P}_x$ is a chosen local reference orthonormal basis for the internal MPU Hilbert space $\mathcal{H}_0$.
2.  **Structure Group Action:** An element $g = (\Lambda, u) \in G$, where $\Lambda \in \text{Spin}(1,3)$ and $u \in U(d_0)$, acts freely and transitively on the fibre elements. The action transforms the local frames: $(\mathcal{F}_x, \mathcal{P}_x) \mapsto (\Lambda \cdot \mathcal{F}_x, u \cdot \mathcal{P}_x)$. The $U(d_0)$ factor represents the local gauge freedom in choosing the reference basis used to describe states in the internal Hilbert space $\mathcal{H}_0$ at point $x$.
3.  **Associated Bundles:** Physical fields are sections of associated vector bundles $E_\rho = P \times_\rho V_\rho$. For example, the MPU state amplitude field $\Psi(x)$, taking values $|\psi(x)\rangle \in \mathcal{H}_0$, is a section of the vector bundle associated with the fundamental representation of $U(d_0)$ (and potentially a spinor representation of $\text{Spin}(1,3)$).
4.  **Connection:** A connection 1-form $A_\mu(x)$ valued in the Lie algebra $\mathfrak{g} = \mathfrak{spin}(1,3) \oplus \mathfrak{u}(d_0)$ defines parallel transport and allows consistent comparison of field values between infinitesimally separated points. It decomposes as $A_\mu = \omega_\mu \oplus A_\mu^{\text{int}}$, where $\omega_\mu$ is the standard spin connection (valued in $\mathfrak{spin}(1,3)$) compatible with the metric $g_{\mu\nu}$, and $A_\mu^{\text{int}}$ is the **internal gauge connection** (valued in $\mathfrak{u}(d_0)$) which compensates for local changes in the choice of the internal reference basis $\mathcal{P}_x$. The corresponding covariant derivative $D_\mu$ acting on a field $\Phi$ transforming under representation $\rho = (\rho^{\text{Lor}}, \rho^{\text{int}})$ is:
$$D_{\mu}\Phi = \partial_{\mu}\Phi + \rho_{*}(A_{\mu})\Phi = \partial_{\mu}\Phi + \rho^{\mathrm{Lor}}_{*}(\omega_{\mu})\Phi + \rho^{\mathrm{int}}_{*}(A^{\mathrm{int}}_{\mu})\Phi \tag{67}$$
where $\rho_*$ denotes the corresponding Lie algebra representation. This ensures $D_\mu \Phi$ transforms covariantly under local frame changes and internal reference basis changes. The internal connection $A_\mu^{\text{int}}$ is related to the path-dependence of information transport discussed in Theorem 47.
5.  **Curvature and Dynamics:** The curvature 2-form $F_{\mu\nu} = \partial_\mu A_\nu - \partial_\nu A_\mu + [A_\mu, A_\nu]$ encodes the field strength. It decomposes into the Riemann curvature tensor $R_{\mu\nu}$ (from $\omega_\mu$) and the internal gauge field strength $F_{\mu\nu}^{\text{int}}$ (from $A_\mu^{\text{int}}$). The dynamics of the internal gauge field $A_\mu^{\text{int}}$ emerge from minimizing the Principle of Compression Efficiency (PCE) potential for field configurations (as derived in Appendix G), leading potentially to Yang-Mills type equations, e.g., $D^{\mu}F^{\mathrm{int}}_{\mu\nu} = \kappa_{c}\,J^{\mathrm{int}}_{\nu}$, sourced by an internal matter current $J^{\mathrm{int}}_{\nu}$ derived ultimately from the conserved MPU stress-energy tensor $T_{\mu\nu}^{(MPU)}$ and related Noether currents.

*Proof Summary:* This theorem follows from applying the standard mathematical construction of principal fibre bundles and associated vector bundles to the specific degrees of freedom identified in the PU framework: the local spacetime orientation (Lorentz frame $\mathcal{F}_x$) and the local description of the internal MPU state space (reference basis $\mathcal{P}_x$). The structure group $G$ captures the relevant local symmetries (Lorentz transformations and unitary basis changes in $\mathcal{H}_0$). The connection $A_\mu$ and covariant derivative $D_\mu$ are necessary structures for defining consistent dynamics (parallel transport, derivatives) for fields defined over the emergent curved spacetime manifold $M$ possessing these local symmetries. The decomposition of the connection and curvature follows from the product structure of the group $G$. Details are analogous to standard constructions in gauge theory and general relativity [Nakahara 2003; Wald 1984]. QED

**11.9 Role of MPU Stress-Energy Tensor**

As established qualitatively (Theorem 47) and implicitly in the connection dynamics (Theorem 48), inhomogeneities in MPU activity source curvature. This activity is quantitatively captured by the macroscopic MPU Stress-Energy Tensor ($T_{\mu\nu}^{(MPU)}$, Definition B.8 in Appendix B), derived by coarse-graining microscopic MPU costs/activity. It is this macroscopic tensor $T_{\mu\nu}^{(MPU)}$ that serves as the source term driving the spacetime curvature $R^{\rho}{}_{\sigma\mu\nu}$ and appearing on the right-hand side of the emergent gravitational field equations derived thermodynamically in the next section. The causal structure of spacetime—the light cone defined by $c = \delta/\tau_{\text{min}}$ in the PCE-optimal uniform-weight regime (Theorem 46; Appendix E, Theorem E.10.2)—is thus derived from the entropy costs of information propagation, with the emergent speed of light identified as the ratio of fundamental length to fundamental time scales, both determined by PCE optimization.

