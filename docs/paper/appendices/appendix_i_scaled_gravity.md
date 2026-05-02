# Appendix I: A PCE-Driven, Environment-Dependent Model for Emergent Gravity

**I.1 Aim and Scope**

Within the Predictive-Universe (PU) framework, this appendix develops the dark-sector response stack as a multi-scale, environment-dependent model of emergent gravity. The theorem-level inputs are the emergent-gravity bridge of Sections 11–12 and the acceleration-scale identity of Appendix H conditional on Definition H.0 and Equation H.4b. The galaxy-scale law modification $G(R)$ is a phenomenological kernel constrained by those inputs and by local-gravity limits. The cluster-scale "predictive matter" response is a separate non-local source-modification kernel. The composite model is PCE-motivated and falsifiable, with the parameter roles and T1/T2/T3 dependencies stated explicitly below. The galaxy-scale law modification is **environment-dependent** and does not imply a universal large-scale shift of $G$ relevant for the CMB.

**I.2 Foundations of Emergent Gravity in PU**

The emergence of gravity in the PU framework is a multi-step process (Sections 11, 12):

*   **MPU network and ND-RID:** The fundamental substrate is an adaptive network of Minimal Predictive Units (MPUs) coupled by Non-Deterministic Reflexive Interaction Dynamics (ND-RID, Definition A.2.2).
*   **Information limits:** ND-RID is inherently irreversible ($\varepsilon\!\ge\!\ln2$, Theorem 31), and the averaged 'Evolve' channel includes a nonzero input-independent refresh component (Lemma E.1), yielding strict trace-distance contraction ($f_{\mathrm{RID}}\!<\!1$) and therefore a strict capacity bound $C_{\max}(f_{\mathrm{RID}})\!<\!\ln d_{0}$ (Theorem E.2 in Appendix E).
*   **Emergent geometry:** Prediction-Optimization (POP) and PCE drive the network towards geometrically regular configurations (Theorem 43), giving rise to a Lorentzian manifold $(M,g_{\mu\nu})$ (Theorem 46).
*   **Area law:** The channel capacity bound plus emergent geometric regularity give rise to the Horizon Entropy Area Law $S=k_B\mathcal A/(4L_P^2)$ (Theorem 49).
*   **Newton constant:** Identifying the coefficient in the Area Law links the emergent gravitational scale $L_P^2=G\hbar/c^3$ to microscopic MPU parameters (derived in Appendix E, Equation E.9):
    $$
    G(\delta, C_{\max}, \chi) \simeq \frac{\eta \delta^2 c^3}{4 \hbar \chi C_{\max}(f_{RID})}.
    \tag{I.1}
    $$
(where $\delta$ is the effective microscopic MPU spacing, $\eta$ is a geometric packing factor, $\chi$ is the correlation factor reducing effective channel density, and $C_{\max}(f_{RID})$ is the channel capacity. The effective boundary channel density is $\sigma_{eff_link} = \chi / (\eta \delta^2)$, as per Theorem E.3). This appendix uses the PCE equilibrium value $\chi^*=1$ (Lemma Q.2.2) for its subsequent scale-dependent arguments, effectively using $G \propto \delta^2/C_{\max}$. Equation (I.1) is dimensionally consistent as shown in Appendix H.
*   **Einstein field equations:** Applying thermodynamic principles (Clausius relation) to causal horizons in the emergent geometry, using the Area Law and the MPU stress-energy tensor $T_{\mu\nu}^{(\mathrm{MPU})}$ (Definition B.8, Appendix B) as the source, yields the Einstein field equations (Theorem 50).

**I.3 Complexity Saturation in Prediction**

The MPU network's adaptation is driven by balancing predictive gain against resource cost according to the Principle of Compression Efficiency (PCE, Definition 15). The effective aggregate complexity $\bar C_{\mathrm{agg}}(R)$ in a region of scale $R$ adapts to match the perceived predictive difficulty $\hat C_{\mathrm{target}}(R)$ for that region (Equation 38), achieving a Predictive Performance $PP(C,\hat C_{target})$ determined by the Law of Prediction (Equation 22). The optimal complexity $C^*$ for a given $\hat C_{\mathrm{target}}$ is determined by the condition where the marginal predictive benefit equals the marginal resource cost (Definition 14, Equation 18):
$$
\Gamma_0\,\frac{\partial PP}{\partial C}\bigg|_{C^*} = \lambda\,R'(\bar C_{\mathrm{agg}}^*)
     + R'_I(\bar C_{\mathrm{agg}}^*).
\tag{I.2}
$$
As complexity $\bar C_{\mathrm{agg}}$ increases, the marginal predictive gain $\partial PP/\partial C$ decreases (diminishing returns, $\partial^2 PP/\partial C^2 < 0$), while the marginal resource costs ($R', R_I'$) generally increase or remain non-negative ($R'' \ge 0$, $R_I'' \propto -1/C^2 < 0$ for $C>K_0$, but total marginal cost typically non-decreasing). This creates a balance point.

**Proposition I.2 (Finite Saturation of Aggregate Complexity).**
Given the diminishing returns in predictive performance from increasing complexity ($\partial^2 PP/\partial C^2 < 0$) and the positive, non-decreasing marginal costs ($R' \ge 0, R_I' > 0$ for $C>K_0$), PCE excludes runaway complexity investment in Equation (I.2): the optimal aggregate complexity $\bar C_{\mathrm{agg,sat}}$ is finite. Whether the optimum is attained at the lower admissible boundary $C = K_0$ or at an interior point depends on the environment and the perceived predictive difficulty $\hat C_{\mathrm{target}}$.

*Proof:* The marginal benefit term $\Gamma_0 (\partial PP/\partial C)$ decreases from a finite value towards zero as $C \to \infty$ (Equation 25), while the marginal cost term $\lambda R' + R_I'$ remains bounded below by a positive constant for $C > K_0$ (Definition 3). For sufficiently large $C$, marginal cost strictly exceeds marginal benefit, so PCE disfavors arbitrarily large complexity and $\bar C_{\mathrm{agg,sat}}$ is finite. An interior solution $C^* > K_0$ to the marginal-balance equation (I.2) exists when the marginal predictive benefit initially exceeds the marginal cost at $C = K_0$, $\Gamma_0 (\partial PP/\partial C)|_{C=K_0} > \lambda R'(K_0) + R_I'(K_0)$, and the relevant functions are continuous; otherwise the optimum lies at the boundary $\bar C_{\mathrm{agg,sat}} = K_0$. ∎

**I.4 Predictive-Information Saturation in Sparse Regimes**

The perceived predictive difficulty $\hat C_{\mathrm{target}}$ (Definition 21) for an MPU aggregate in a given environment reflects the complexity of patterns that can be exploited for prediction.

*   **Hypothesis I.1:** In low-density, sparse regions of the MPU network (e.g., the voids of large-scale structure, galactic outskirts), the available density of predictive information is lower and less complex than in high-density regions (e.g., galactic cores). This results in a lower effective target complexity $\hat C_{\mathrm{target}}(R)$ for a predictive system operating at scale $R$.
*   **Corollary I.2:** Under Hypothesis I.1 and the Law of Prediction (Equation 22), achieving high predictive performance $PP$ requires allocating complexity $C(PP, \hat C_{\mathrm{target}})$ proportional to $\hat C_{\mathrm{target}}$ (Equation 23). Equation (I.2) determines the optimal saturation complexity $\bar C_{\mathrm{agg,sat}}(\hat C_{\mathrm{target}})$. A lower $\hat C_{\mathrm{target}}$ in sparse environments implies that the PCE optimization balancing benefit and cost will lead to a lower saturation threshold $\bar C_{\mathrm{agg,sat}}$ compared to dense regions. The system saturates its complexity investment sooner because there are fewer exploitable predictive patterns to justify higher costs.

**I.5 Parameter-Relaxation Mechanism due to Early Saturation**

When the MPU network in sparse regions saturates at a lower complexity level $\bar C_{\mathrm{agg,sat}}$ (Corollary I.2), the selection pressure on the microscopic MPU parameters governing network structure and interaction efficiency is altered. Specifically, PCE (Definition 15) drives configurations that minimize costs. If the density of predictive information does not warrant maintaining high complexity, the pressure to maintain the high-fidelity, densely packed configurations optimal for high complexity is reduced. This drives a "relaxation" of the effective microscopic MPU parameters:

*   **Effective Microscopic Spacing $\delta(R)$ increases:** Maintaining a tight packing (small $\delta$) is costly (e.g., propagation costs $\propto 1/\delta^2$ or $\ln \delta$ type terms). If the predictive benefit from close spacing is low, PCE favors larger effective spacing, reducing propagation cost.
*   **Effective Channel Capacity $C_{\max}(R)$ decreases:** High channel capacity requires maintaining high-fidelity evolution, i.e. a small refresh weight $p$ in the decomposition $\mathcal{E}_N=(1-p)\Psi+pT_\sigma$ (equivalently $f_{RID}=1-p$ close to $1$, Lemma E.1). In sparse environments where additional fidelity yields little predictive benefit, PCE can favor allowing a larger refresh component (and thus smaller $C_{\max}$), while remaining consistent with the irreducible per-cycle entropy floor $\varepsilon_{\mathrm{phys}}\ge\varepsilon_0=\ln2$ (Theorem 31).

These parameter variations, $\delta(R)$ increasing and $C_{\max}(R)$ decreasing in sparse, large-scale regions ($R \gg L_0$), combine to raise the factor $\eta\delta^2/C_{\max}$ in Equation (I.1).

**I.5.1 Crossover Scale from Information Resolution Limits**

The parameter relaxation described in Section I.5 implies that the MPU network's equilibrium structure depends on the local information environment. We derive the transition scale $a_0$ from the resolution limits of the MPU in the cosmic vacuum.

**Proposition I.3 (Information Resolution Threshold).**

If the MPU network relaxes its parameters when the local environmental information density drops below the thermodynamic threshold required to distinguish a predictive gradient against the vacuum background, then, in a de Sitter background with cosmological constant $\Lambda>0$, the crossover acceleration is uniquely determined by $\Lambda$.

**Physical Setup:**

**1. Cosmic Resolution Floor:** In a universe dominated by cosmological constant $\Lambda>0$, the de Sitter horizon defines a minimum resolvable energy quantum. The associated de Sitter temperature is [Gibbons & Hawking 1977]:
$$
T_{dS} = \frac{\hbar c}{2\pi k_B}\sqrt{\frac{\Lambda}{3}}
\tag{I.3.1}
$$

**2. Local Gradient Detection:** An MPU experiencing proper acceleration $a$ behaves as a thermal detector at Unruh temperature [Unruh 1976]:
$$
T_U(a) = \frac{\hbar a}{2\pi c k_B}
\tag{I.3.2}
$$

**The Crossover Criterion:** Parameter relaxation is triggered when the local Unruh temperature drops to the cosmic de Sitter temperature, rendering local gradients indistinguishable from vacuum fluctuations. Setting $T_U(a_0) = T_{dS}$:
$$
\frac{\hbar a_0}{2\pi c k_B} = \frac{\hbar c}{2\pi k_B}\sqrt{\frac{\Lambda}{3}}
$$
$$
\boxed{a_0 = c^2\sqrt{\frac{\Lambda}{3}}}
\tag{I.3.3}
$$

*Proof.* By hypothesis, the crossover occurs precisely at the threshold where the local Unruh temperature equals the de Sitter background temperature. Substituting Equations (I.3.1) and (I.3.2) into the threshold condition $T_U(a_0)=T_{dS}$ gives
$$
\frac{\hbar a_0}{2\pi c k_B} = \frac{\hbar c}{2\pi k_B}\sqrt{\frac{\Lambda}{3}}.
$$
Multiplying both sides by $2\pi c k_B/\hbar$ yields
$$
a_0 = c^2\sqrt{\frac{\Lambda}{3}}.
$$
This proves existence of a threshold acceleration with the stated value. For uniqueness, observe that for $a\ge0$ the function $T_U(a)=\hbar a/(2\pi c k_B)$ is strictly increasing in $a$, while $T_{dS}$ is a fixed positive constant when $\Lambda>0$. Therefore the equation $T_U(a)=T_{dS}$ has exactly one nonnegative solution, namely Equation (I.3.3). ∎

**Physical Interpretation:**
- For $a \gg a_0$: $T_U \gg T_{dS}$, local gradients detectable $\to$ high-fidelity channels $\to$ $G \approx G_0$
- For $a \ll a_0$: $T_U \ll T_{dS}$, gradients masked by cosmic noise $\to$ channel relaxation $\to$ $G$ increases

**Numerical Estimate:** Using $\Lambda \approx 1.1 \times 10^{-52}$ m$^{-2}$ [Planck Collaboration 2020a]:
$$
a_0 \approx 5.4 \times 10^{-10} \text{ m/s}^2
\tag{I.3.4}
$$

**Connection to Empirical Scale:** The relationship to the empirical MOND scale $g_0 \approx 1.2 \times 10^{-10}$ m/s$^2$ involves an efficiency factor $\eta' = 3/(8\sqrt{3}) \approx 0.2165$ fixed once the bridge-law normalization of Appendix H (Definition H.0 and Equation H.4b) is adopted. Within that normalization the factor arises from the product of four terms:
- Active participation fraction $a/d_0 = 1/4$ (isotropy theorem)
- Repetition multiplier $C/\varepsilon = 2$ (QFI additivity for i.i.d.)
- Spatial projection $(D-1)/D = 3/4$ (rotational invariance)
- Democratic normalization $1/\sqrt{K_0} = 1/\sqrt{3}$ (QFI additivity for generators)

**Corollary I.3a (Cosmological Acceleration Lock in the Dark-Sector Branch).** On the Appendix H operating-point bridge representative,
$$
g_0
=
\eta' a_0
=
\frac{c^2\sqrt{\Lambda}}{8}.
$$
Define
$$
g_\Lambda:=\frac{c^2\sqrt{\Lambda}}{8}.
$$
Then every galaxy-sector transition written in terms of $g_0$ on this branch is equivalently written in terms of the cosmology-fixed scale $g_\Lambda$. The dimensionless local dark-sector trigger variable is
$$
\chi_b(x)
:=
\frac{|\nabla\Phi_b(x)|}{g_\Lambda}.
$$
No independent MOND-scale fit parameter is present once Definition H.0 and Equation H.4b are adopted.

*Proof.* Proposition I.3 gives $a_0=c^2\sqrt{\Lambda/3}$. Appendix H, Equation H.4b gives $\eta'=3/(8\sqrt3)$. Therefore
$$
g_0=\eta'a_0
=
\frac{3}{8\sqrt3}c^2\frac{\sqrt{\Lambda}}{\sqrt3}
=
\frac{c^2\sqrt{\Lambda}}{8}.
$$
The definition of $\chi_b$ is the unique dimensionless ratio formed from the local baryonic acceleration $|\nabla\Phi_b|$ and the locked acceleration scale $g_\Lambda$. ∎

**Remark I.1.** The functional form $a_0 \propto c^2\sqrt{\Lambda}$ follows from equating two well-established temperatures (Unruh and de Sitter). The additional factor $\eta' = 3/(8\sqrt{3})$ is not obtained from that temperature equality alone; it is the conditional consequence of the QFI linear-response bridge law adopted in Appendix H, Definition H.0. Once that bridge-law normalization is fixed, no continuously adjustable parameter remains in the galactic-scale prediction; the scale is locked to $\Lambda$ by Corollary I.3a.

**Definition I.3b (Predictive Focusing and Susceptibility Datum).** On a regular emergent metric/channel-capacity thermodynamic branch, let $k^\mu$ be an affine null generator of a local causal horizon, let $a(\lambda)$ be the transverse area density along the generator, and let $S_{\mathrm{pred}}(\lambda)$ be the retained predictive entropy crossing the same generator. Define the predictive generalized expansion
$$
\Theta_{\mathrm{PU}}(\lambda)
=
\frac{d}{d\lambda}
\left(
\frac{a(\lambda)}{4G}+S_{\mathrm{pred}}(\lambda)
\right).
\tag{I.3b.1}
$$
A metric/channel-capacity susceptibility datum is a linear response function
$$
\chi_g(\omega,\mathbf k)
=
\frac{\delta g_{\mathrm{eff}}(\omega,\mathbf k)}
{\delta T_{\mathrm{bar}}(\omega,\mathbf k)}
\tag{I.3b.2}
$$
for the effective metric response to a retained baryonic stress perturbation, with the response normalization specified by the same operating branch as Definition H.0.

**Theorem I.3c (Predictive Focusing and Susceptibility Sum Rule).** Suppose a local null branch satisfies the channel-capacity focusing equation
$$
\frac{1}{4G}\frac{d^2a}{d\lambda^2}
=
-2\pi T^{\mathrm{PU}}_{kk}
-
\mathcal S_{\mathrm{ch}},
\qquad
\mathcal S_{\mathrm{ch}}\ge0,
\tag{I.3c.1}
$$
where $T^{\mathrm{PU}}_{kk}=T^{\mathrm{PU}}_{\mu\nu}k^\mu k^\nu$ and $\mathcal S_{\mathrm{ch}}$ is the nonnegative shear/defect channel term. Suppose also that the retained predictive entropy satisfies the null entropy-curvature bound
$$
\frac{d^2S_{\mathrm{pred}}}{d\lambda^2}
\le
2\pi T^{\mathrm{PU}}_{kk}.
\tag{I.3c.2}
$$
Then
$$
\frac{d\Theta_{\mathrm{PU}}}{d\lambda}
\le
-\mathcal S_{\mathrm{ch}}
\le0.
\tag{I.3c.3}
$$

If, in addition, $\chi_g(\omega,\mathbf k)$ is causal and passive for fixed $\mathbf k$, meaning that it is analytic in the upper half $\omega$-plane, obeys the reality condition $\chi_g(-\omega,\mathbf k)=\overline{\chi_g(\omega,\mathbf k)}$ for real $\omega$, has finite limits $\chi_g(0,\mathbf k)$ and $\chi_g(\infty,\mathbf k)$, and satisfies the falloff needed for the unsubtracted dispersion relation, then
$$
\boxed{
\chi_g(0,\mathbf k)-\chi_g(\infty,\mathbf k)
=
\frac{2}{\pi}
\int_0^\infty
\frac{\operatorname{Im}\chi_g(\omega,\mathbf k)}{\omega}\,d\omega.
}
\tag{I.3c.4}
$$

*Proof.* Differentiating (I.3b.1) gives
$$
\frac{d\Theta_{\mathrm{PU}}}{d\lambda}
=
\frac{1}{4G}\frac{d^2a}{d\lambda^2}
+
\frac{d^2S_{\mathrm{pred}}}{d\lambda^2}.
$$
Substituting (I.3c.1) and then applying (I.3c.2) yields
$$
\frac{d\Theta_{\mathrm{PU}}}{d\lambda}
\le
(-2\pi T^{\mathrm{PU}}_{kk}-\mathcal S_{\mathrm{ch}})
+
2\pi T^{\mathrm{PU}}_{kk}
=
-\mathcal S_{\mathrm{ch}}
\le0,
$$
which proves (I.3c.3).

For the susceptibility statement, analyticity in the upper half-plane and the stated falloff give the Kramers-Kronig relation
$$
\operatorname{Re}\chi_g(0,\mathbf k)-\chi_g(\infty,\mathbf k)
=
\frac{2}{\pi}
\int_0^\infty
\frac{\operatorname{Im}\chi_g(\omega,\mathbf k)}{\omega}\,d\omega.
$$
The static response is real by the reality condition, so $\operatorname{Re}\chi_g(0,\mathbf k)=\chi_g(0,\mathbf k)$. This proves (I.3c.4). ∎

**Corollary I.3d (No Replacement of the H-Bridge by the Sum Rule Alone).** The sum rule (I.3c.4) is a consistency and spectral-reconstruction gate for any dark-sector susceptibility model. It does not by itself fix the numerical factor $\eta'=3/(8\sqrt3)$ in Corollary I.3a. That factor remains fixed by Appendix H, Definition H.0 and Equation H.4b unless a separate PU-internal theorem derives the same static normalization from the spectral density $\operatorname{Im}\chi_g$.

*Proof.* Equation (I.3c.4) determines the difference $\chi_g(0,\mathbf k)-\chi_g(\infty,\mathbf k)$ only after the spectral density and high-frequency normalization are fixed. It is therefore a dispersion constraint on an already specified susceptibility datum, not a substitute for the operating-point normalization of Appendix H. ∎

**Definition I.3e (RCD-Buchert-Cheeger Backreaction Datum).** On a regular emergent metric/channel-capacity thermodynamic branch, let $D$ be a compact averaging domain in the noncollapsed $\mathrm{RCD}^*(K,4)$ limit of Theorem C.6c, with normalized measure $\langle f\rangle_D$. A backreaction datum consists of:

1. an expansion scalar $\theta\in W^{1,2}(D)$ and shear magnitude $\sigma\in L^2(D)$ for the retained cosmological congruence;

2. the first nonzero Neumann spectral gap $\lambda_1(D)>0$ of the Cheeger energy $\mathrm{Ch}_D$;

3. the Buchert-type kinematical backreaction
$$
\mathcal Q_D^{\mathrm{PU}}
=
\frac23
\left(
\langle\theta^2\rangle_D-\langle\theta\rangle_D^2
\right)
-
2\langle\sigma^2\rangle_D;
\tag{I.3e.1}
$$

4. an elliptic source-control estimate supplied by the emergent metric/channel-capacity thermodynamic field equation on the retained branch:
$$
\frac{2}{3\lambda_1(D)}\mathrm{Ch}_D(\theta)
+
2\langle\sigma^2\rangle_D
\le
B_D[
\operatorname{Var}_D(T_{\mathrm{pred}}),
\dot\rho_{\mathrm{src}},
\mathfrak B_D,
\mathfrak H_D
],
\tag{I.3e.2}
$$
where $T_{\mathrm{pred}}$ is the retained predictive stress tensor, $\dot\rho_{\mathrm{src}}$ is the source-energy rate density when present, and $\mathfrak B_D,\mathfrak H_D$ are the finite Bakry-Émery and horizon-transfer defect budgets on the branch.

**Theorem I.3f (RCD-Buchert-Cheeger Backreaction Bound).** On any branch carrying the datum of Definition I.3e,
$$
|\mathcal Q_D^{\mathrm{PU}}|
\le
\frac{2}{3\lambda_1(D)}\mathrm{Ch}_D(\theta)
+
2\langle\sigma^2\rangle_D
\tag{I.3f.1}
$$
and therefore
$$
|\mathcal Q_D^{\mathrm{PU}}|
\le
B_D[
\operatorname{Var}_D(T_{\mathrm{pred}}),
\dot\rho_{\mathrm{src}},
\mathfrak B_D,
\mathfrak H_D
].
\tag{I.3f.2}
$$

*Proof.* By definition,
$$
|\mathcal Q_D^{\mathrm{PU}}|
\le
\frac23\operatorname{Var}_D(\theta)
+
2\langle\sigma^2\rangle_D.
$$
The RCD/Poincaré inequality with first nonzero Neumann spectral gap gives
$$
\operatorname{Var}_D(\theta)
\le
\lambda_1(D)^{-1}\mathrm{Ch}_D(\theta).
$$
Substituting gives (I.3f.1). The source-control estimate (I.3e.2), which is the elliptic regularity form of the emergent metric/channel-capacity thermodynamic field equation on the retained branch, gives (I.3f.2). ∎

**Corollary I.3g (Backreaction Status Boundary).** Cosmological backreaction on the PU regular branch is not an unconstrained phenomenological term. It is bounded by Cheeger energy, shear, predictive stress variance, source-energy rate density, and the retained finite-defect budgets. If the datum of Definition I.3e is not supplied for a cosmological domain, Appendix I makes no theorem-level backreaction estimate for that domain.

*Proof.* The first sentence is exactly Theorem I.3f. The second is the contrapositive of the theorem's branch hypothesis. ∎



**Definition I.3h (RCD Elliptic Scale-Bridge Datum).** Let $(X_n,d_n,m_n,\mathcal E_n)$ be the finite MPU metric-measure networks on a regular operational-continuum branch. The branch carries an RCD elliptic scale-bridge datum when:

1. the finite networks have a uniform Bakry-Émery lower bound $K$ in the sense of the discrete curvature form used in Theorem C.6c;

2. the channel-capacity volume bounds are noncollapsed:
$$
v_- r^4\le m_n(B_r(x))\le v_+r^4
\tag{I.3h.1}
$$
for fixed $v_-,v_+>0$ on retained local scales;

3. the finite networks have uniform local doubling and $(1,2)$-Poincaré constants;

4. $(X_n,d_n,m_n)$ converge in the measured Gromov-Hausdorff sense to $(X,d,m)$;

5. the Dirichlet forms $\mathcal E_n$ converge to the limit Cheeger energy in the Mosco sense;

6. on each retained cosmological averaging domain $D$, the emergent metric/channel-capacity thermodynamic field equation admits an elliptic gauge in which
$$
\mathrm{Ch}_D(\theta)+\langle\sigma^2\rangle_D
\le
C_D
\left(
\operatorname{Var}_D(T_{\mathrm{pred}})
+
\dot\rho_{\mathrm{src}}
+
\mathfrak B_D+
\mathfrak H_D
\right)
\tag{I.3h.2}
$$
for a finite domain constant $C_D$.

**Theorem I.3i (RCD Elliptic Scale-Bridge Completion).** On a branch carrying the RCD elliptic scale-bridge datum, the limit space $(X,d,m)$ is an $\mathrm{RCD}^*(K,4)$ space, the limit Cheeger energy is quadratic, and the backreaction estimate of Theorem I.3f becomes
$$
|\mathcal Q_D^{\mathrm{PU}}|
\le
C_D'
\left(
\operatorname{Var}_D(T_{\mathrm{pred}})
+
\dot\rho_{\mathrm{src}}
+
\mathfrak B_D+
\mathfrak H_D
\right)
\tag{I.3i.1}
$$
for a finite constant $C_D'$ depending only on the branch constants and the averaging domain.

*Proof.* Uniform Bakry-Émery lower bounds, noncollapse, doubling, Poincaré control, and measured Gromov-Hausdorff convergence give stability of the synthetic Ricci lower bound, so the limit is $\mathrm{RCD}^*(K,4)$. Mosco convergence of $\mathcal E_n$ identifies the limit Dirichlet form with the Cheeger energy, and the RCD condition gives quadraticity of that energy. Theorem I.3f gives
$$
|\mathcal Q_D^{\mathrm{PU}}|
\le
\frac{2}{3\lambda_1(D)}\mathrm{Ch}_D(\theta)
+
2\langle\sigma^2\rangle_D.
$$
Applying the elliptic estimate (I.3h.2) and absorbing the spectral-gap and numerical constants into $C_D'$ proves (I.3i.1). ∎

**Corollary I.3j (Scale-Bridge Scope).** The RCD-Buchert-Cheeger estimate is theorem-level on branches satisfying Definition I.3h. If noncollapse, uniform doubling/Poincaré control, Mosco convergence, or the elliptic gauge estimate fails, Appendix I retains only the local Cheeger/Poincaré inequality of Theorem I.3f and not the full predictive-stress backreaction estimate.

*Proof.* This is the branch-status boundary of Theorem I.3i. The theorem uses each of the listed hypotheses: removing any one of them blocks either RCD stability, Mosco identification, or the elliptic passage from geometry to predictive stress. ∎


**Remark I.3k (Definite Answer to the RCD Elliptic-Backreaction Question).** The RCD elliptic-regularity step is not presently a computed numerical closure in Appendix I. The conditional theorem-level form is the following: if an averaging domain $D$ on a noncollapsed $\mathrm{RCD}^*(K,4)$ branch supplies $\lambda_1(D)>0$, $\theta\in W^{1,2}(D)$, $\sigma\in L^2(D)$, and an elliptic scale-bridge estimate
$$
\mathrm{Ch}_D(\theta)+\langle\sigma^2\rangle_D
\le
C_D
\left(
\operatorname{Var}_D(T_{\mathrm{pred}})
+
\dot\rho_{\mathrm{src}}
+
\mathfrak B_D+
\mathfrak H_D
\right),
\tag{I.3k.1}
$$
then the Buchert-type backreaction is bounded by the same predictive-stress and defect budgets up to the Poincaré/Cheeger constants. Without (I.3k.1), Appendix I has only a conditional analytic target, not a theorem-level numerical estimate.

In particular, no current Appendix I calculation fixes a canonical-domain value such as $C_D\approx10^{20}$ in Planck units. Such a number may be integrated only after the domain geometry, Poincaré constant, Hölder regularity scale, field-equation elliptic gauge, and finite defect budgets are computed on the same branch.

---

The PCE-driven relaxation of network parameters can be formalized by modeling the local contribution to the global PCE Potential:
$$
V_{struct}(\delta, C_{\max}; \rho_b) = V_{cost}(\delta, C_{\max}) - V_{benefit}(\delta, C_{\max}; \rho_b)
\tag{I.3.5}
$$
The system dynamically adjusts its effective local parameters $\delta$ and $C_{\max}$ to minimize this potential.

*   **Analysis of Cost and Benefit:**
    *   **Structural Cost $V_{cost}$:** This term represents the physical resources needed to maintain the network infrastructure. A denser network (smaller $\delta$) implies higher resource density and potentially higher propagation costs. Higher-fidelity channels (larger $C_{\max}$, which requires minimizing the irreversibility cost $\varepsilon$) also demand more resources (as analyzed in Appendix A.0.4, $V_{rel}$). Thus, $V_{cost}$ generally increases as $\delta$ decreases and increases as $C_{\max}$ increases.
    *   **Predictive Benefit $V_{benefit}$:** The benefit arises from the network's ability to form complex predictive models of the local environment. This ability, $PP_{agg}$, depends on having a dense (small $\delta$) and high-fidelity (large $C_{\max}$) network. The total benefit is proportional to the amount of "stuff to predict," which is directly related to $\rho_b$. Thus, $V_{benefit}$ generally increases as $\delta$ decreases, increases as $C_{\max}$ increases, and increases with $\rho_b$.

*   **Derivation of Crossover Behavior:** The system's minimization of $V_{struct}$ leads to two distinct equilibrium regimes:
    *   **High $\rho_b$ (e.g., galactic cores):** The benefit term $V_{benefit}$ is large and dominates the optimization. PCE drives the network to a high-cost, high-performance state to maximize predictive gain. This corresponds to an equilibrium with a small spacing $\delta_0$ and a large channel capacity $C_{max,0}$.
    *   **Low $\rho_b$ (e.g., galactic outskirts):** The benefit term is weak. PCE drives the network to a low-cost, low-performance state to conserve resources. This corresponds to an equilibrium with a large spacing $\delta_{large}$ and a small channel capacity $C_{max,low}$.
    
This analysis proves that the equilibrium values $(\delta*, C_{\max}*)$ must be functions of $\rho_b$, and that the system must transition between these two distinct regimes as $\rho_b$ changes. The functional form of the scale-dependent $G(R)$ introduced in the next section is a physically-motivated phenomenological model of this derived crossover behavior.


**I.6 Scale-Dependent Newton Constant**

The variation of the microscopic parameters $\delta$ and $C_{\max}$ with the scale $R$ (associated with the density of predictive information and effective $\hat C_{\mathrm{target}}(R)$) due to the PCE-driven parameter relaxation mechanism (Section I.5) leads to a scale-dependent emergent Newton constant $G(R)$, as given by Equation (I.1). We model this scale dependence using a minimal phenomenological interpolation function (consistent with the robustness discussion in Section 6.7), where $G_0$ is the value approached at small scales $R \ll L_0$, $A_G$ is the total fractional enhancement ($A_G = G_{\mathrm{large}}/G_0 - 1$), $L_0$ is a characteristic transition scale at which $G$ begins to increase, and $m \ge 1$ (typically $m \gtrsim 2$) is a parameter determining the steepness of the transition.

This yields the explicit running of the Newton constant with scale $R$; as a robustness check, replacing the exponential by a logistic or Hill-type transition function preserves the qualitative baryon-tracking behavior for the same $(L_0,A_G,m)$ scale hierarchy:

$$
\boxed{\,G(R)=G_0
          \Bigl[1+A_G\bigl(1-e^{-(R/L_0)^m}\bigr)\Bigr]\,}.
\tag{I.4}
$$

The parameter roles in Equation I.4 are:
$$
G_0:\text{ local normalization},\qquad
L_0:\text{ coarse-graining transition scale tied to }g_\Lambda,\qquad
(A_G,m):\text{ phenomenological-kernel parameters},
$$
where
$$
g_\Lambda:=\frac{c^2\sqrt{\Lambda}}{8}.
$$
Within the present manuscript, only the crossover scale $L_0$ is directly tied to the Appendix H acceleration scale, and that tie is conditional on Definition H.0 and Equation H.4b. The amplitude $A_G$ and steepness $m$ remain phenomenological parameters pending either rotation-curve fits or a first-principles closure of the relaxation sector. Thus $(L_0,A_G,m)$ should be tested for universality, but only $L_0$ currently has a framework-internal bridge relation. On the acceleration-lock branch, all low-acceleration transition plots should be expressed using
$$
\chi_b=\frac{|\nabla\Phi_b|}{g_\Lambda}
$$
rather than by fitting a separate acceleration scale.

**I.7 A Multi-Scale Solution from Global PCE Optimization**

The PU framework provides two distinct mechanisms to augment gravity: adapting local network parameters to modify the emergent law ($G$), or collectively reconfiguring the substrate to modify the emergent source ($T_{\mu\nu}$). The choice of mechanism is not arbitrary but is determined by a global PCE optimization that balances local resource costs against global consistency costs.

**I.7.1 Galactic Scales: Law Modification as the Low-Cost Solution**

In the weak-field, spherically symmetric regime this is formally equivalent to an effective dark matter density:
$$
\nabla^2\Phi \simeq 4\pi G_0 \left[ \rho_b(r) + \rho_{\mathrm{DM,eff}}(r) \right],
\quad \text{where} \quad
\rho_{\mathrm{DM,eff}}(r)
=
\left[ \frac{G(r)}{G_0} - 1 \right] \rho_b(r)
+
\frac{G'(r)\,M_b(r)}{4\pi G_0\,r^2}.
\tag{I.6}
$$
Here $M_b'(r)=4\pi r^2\rho_b(r)$. When $G'(r)=0$, this reduces to the simpler proportional-tracking form.

**Local‑tests limit.** In high‑acceleration, small‑scale regimes (Solar System, binary pulsars), the adaptation saturates and $G_{\rm eff}(L)\to G_0$. Equivalently, the local running index
$$
\bar\gamma(L):=\frac{d\ln G_{\rm eff}(L)}{d\ln L}
$$
satisfies $\bar\gamma(L\!\ll\!L_0)\to 0$, preserving precision‑gravity bounds.

This adaptation is **environment‑dependent** and does not alter the homogeneous early‑Universe limit relevant for the CMB.

**I.7.2 Cluster Scales: Non-Local Source Modification as the Necessary Solution**

In the deep potential wells of galaxy clusters, the required gravitational enhancement is large. A "Law Modification" ($G(R)$) that could produce this effect is ruled out *a priori* by the global consistency requirement, as it would violate precise CMB constraints on the value of $G$ in the early universe.

Within the present model, global PCE optimization favors the remaining globally consistent mechanism: "Source Modification." A purely local response ($\rho_{\rm PM}(r)\propto\rho_b(r)$) is treated as informationally suboptimal in this regime because it ignores the global potential structure. The non-local gravitational environment, characterized by the baryonic potential $\Phi_b$, is therefore modeled as the dominant feature. This is a phenomenological-kernel step until the non-local susceptibility is derived from the microscopic adaptation dynamics.

Therefore, PCE **preferentially selects** a **non‑local "predictive matter" (PM) response**, a collective reconfiguration of the MPU substrate that is a functional of the baryonic potential. The minimal mathematical implementation of this required non‑local principle is an integral model:

$$
\rho_{\rm PM}(r)=A_{\rm PM}\!\int K\!\big(|\mathbf r-\mathbf r'|;L_0\big)\,\rho_b(r')\!\left(\frac{|\nabla\Phi_b(r')|}{g_\ast}\right)^{q}\! d^3r',
\tag{I.7}
$$

where $K$ is a causally supported kernel representing the network's correlation length, $\Phi_b$ is the baryonic potential, $g_\ast$ is a characteristic acceleration, and $q$ is a universal nonlinearity exponent. This model, where predictive matter tracks the gravitational potential rather than baryonic density directly, naturally predicts the observed offsets between lensing and baryonic mass in systems like the Bullet Cluster. With $\int K d^3x=1$, the total PM mass is $M_{\rm PM} = A_{\rm PM} \int \rho_b(r') \left(\frac{|\nabla\Phi_b(r')|}{g_\ast}\right)^{q} d^3r' = A_{\rm PM} \left\langle\left(\frac{|\nabla\Phi_b|}{g_\ast}\right)^{q}\right\rangle_{\rho_b} M_b$; thus, once $q$ and $g_\ast$ are fixed, cluster baryon budgets constrain the combination $A_{\rm PM} \left\langle\left(\frac{|\nabla\Phi_b|}{g_\ast}\right)^{q}\right\rangle_{\rho_b}$ (not $A_{\rm PM}$ alone). For $q>0$, $\rho_{\rm PM}$ vanishes in homogeneous backgrounds, keeping the recombination-era coupling unchanged and satisfying CMB bounds. We take $\rho_{\rm PM}$ to arise from an effective nonlocal susceptibility (or action) so that the associated stress-energy tensor $T^{\mu\nu}_{\rm PM}$ ensures covariant conservation of the total: $\nabla_\mu (T^{\mu\nu}_{\rm b}+T^{\mu\nu}_{\rm PM})=0$.

**Anisotropic stress.** The lensing–dynamics identity (I.8) assumes a metric theory with minimal coupling and negligible anisotropic stress so that both probes are sensitive to the same potential; departures from this condition are separately testable.

**Theorem I.5 (Lensing–dynamics identity).**
For any axisymmetric lens with kinematic measurement at $r_\sigma$ and Einstein radius $b_E$ within a scale window where $G_{\rm eff}(L) \approx G_0(L/L_0)^{\bar\gamma}$, assume that the emergent gravity remains a **metric theory with minimal coupling**, that anisotropic stress is negligible, that the lensing and dynamical masses are inferred using the standard constant-$G_0$ templates from the same underlying potential, and that the comparison is performed in a window where the same enclosed baryonic mass normalization applies to both probes. Then
$$
\boxed{\ \frac{M_{\rm lens}}{M_{\rm dyn}}\ \approx\ C_{\rm geom}\,\Big(\frac{b_E}{r_\sigma}\Big)^{\bar\gamma}\ }
\tag{I.8}
$$
where $C_{\rm geom}$ collects the measurable geometry factors and equals $1$ in the idealized symmetric limit. Thus, after dividing out the known geometry factors, the ratio is controlled by the running slope $\bar\gamma$.

*Proof.* Let $M_b$ denote the common enclosed baryonic mass normalization in the comparison window. If the true force law at radius $L$ uses $G_{\rm eff}(L)$ but the observer infers mass with the standard constant-$G_0$ formula, then the inferred dynamical mass at $r_\sigma$ is proportional to
$$
M_{\rm dyn}\propto \frac{v^2(r_\sigma)\,r_\sigma}{G_0}
= \frac{G_{\rm eff}(r_\sigma)}{G_0}\,M_b \times C_{\rm dyn},
$$
where $C_{\rm dyn}$ is the geometry factor converting the exact kinematic observable into the enclosed-mass normalization. Likewise the inferred lensing mass at impact scale $b_E$ is proportional to
$$
M_{\rm lens}\propto \frac{\hat\alpha(b_E)\,b_E\,c^2}{4G_0}
= \frac{G_{\rm eff}(b_E)}{G_0}\,M_b \times C_{\rm lens},
$$
because in a metric theory with negligible anisotropic stress the deflection normalization is linear in the same potential and, by hypothesis, the same enclosed baryonic-mass normalization is being compared. Therefore
$$
\frac{M_{\rm lens}}{M_{\rm dyn}}
=
\frac{C_{\rm lens}}{C_{\rm dyn}}\,
\frac{G_{\rm eff}(b_E)}{G_{\rm eff}(r_\sigma)}
=
C_{\rm geom}\,
\frac{G_0(b_E/L_0)^{\bar\gamma}}{G_0(r_\sigma/L_0)^{\bar\gamma}}
=
C_{\rm geom}\Big(\frac{b_E}{r_\sigma}\Big)^{\bar\gamma}.
$$
This is Equation (I.8). ∎

**I.8 Consistency with Local Tests of GR**

The scale-dependent gravity model (Equation I.4) must be consistent with the classic precision tests of General Relativity in the solar system and binary pulsars. Define the fractional enhancement
$$
\varepsilon_G(R)\ \coloneqq\ \frac{G(R)}{G_0}-1\ =\ A_G\!\left(1-e^{-(R/L_0)^m}\right),
$$
so for $R\ll L_0$ we have the small‑argument approximation $\varepsilon_G(R)\simeq A_G\,(R/L_0)^m$ (from (I.4)).

*   **Scale separation:** Local tests operate on scales $R_\odot\sim 10^{-6}\,\mathrm{kpc}$, vastly smaller than the transition scale $L_0 \sim \mathrm{kpc}$. For $R \ll L_0$, Equation (I.4) gives $\varepsilon_G(R) \approx A_G (R/L_0)^m$. With $m \ge 1$ and $A_G = \mathcal O(1)$, $\varepsilon_G(R_\odot)$ is extremely small (e.g., for $A_G=1, L_0=1$ kpc, $m=2$, $\varepsilon_G(10^{-6} \text{ kpc}) \approx (10^{-6})^2 = 10^{-12}$).
*   **Recovery of $G_0$:** For $R \ll L_0$, $G(R) \approx G_0$, effectively recovering constant Newton gravity.
*   **PPN parameters:** The smallness of $\varepsilon_G(R)$ on solar system scales implies that the parameterized post-Newtonian (PPN) parameters, which quantify deviations from Newtonian gravity and flat spacetime, remain consistent with observations ($\gamma_{\mathrm{PPN}}\simeq\beta_{\mathrm{PPN}}\simeq1$). Deviations would only appear at scales comparable to or larger than $L_0$.

**I.9 Numerical Plausibility and Cosmological Bounds**

The parameters $(G_0, L_0, A_G, m)$ in Equation (I.4) must align with astronomical observations.

*   **Galaxy dynamics:** Observed rotation curves and galaxy scaling relations (e.g., baryonic Tully-Fisher Relation [McGaugh 2012], Radial Acceleration Relation [McGaugh et al. 2016]) indicate that the effective gravitational field requires an enhancement over Newtonian gravity by factors of $2$ to $10$ on scales $R \sim 1$–$100\,\mathrm{kpc}$. For $R\gg L_0$, the local coupling satisfies $G(R)\to G_0(1+A_G)$, while for a bounded baryonic system the asymptotic field enhancement is $1+\langle\varepsilon_G\rangle_b \le 1 + A_G$, where $\langle\varepsilon_G\rangle_b$ is the baryon‑mass‑weighted average of $\varepsilon_G(R)$. This requires $A_G = 1$ to $9$, consistent with $A_G = \mathcal O(1)$.
*   **Transition scale:** The transition scale $L_0$ corresponds to the acceleration scale $g_0$ (Proposition H.1, Appendix H). The empirical $g_0 \sim 1.2 \times 10^{-10}\,\mathrm{m\,s}^{-2}$ aligns with scales of galactic discs (few kpc). Thus, $L_0$ is expected to be of order a few kiloparsecs, consistent with Equation (H.4) if $\Lambda$ and $\eta'$ are of the expected magnitude.
*   **Steepness:** The sharpness of the transition in the Radial Acceleration Relation suggests $m \gtrsim 2$.
*   **Cosmological variation:** If the fundamental parameters $(\delta, C_{\max})$ that determine $(L_0, A_G, m)$ evolve on cosmological timescales (e.g., Hubble time), current bounds on temporal variation of $G$ (e.g., $|\dot G/G|\!\lesssim\!10^{-12}\,\mathrm{yr}^{-1}$ from cosmology and solar system) can still be met, provided the cosmological evolution is slow (Section I.14, [Uzan 2011]).

**I.10 Phenomenological Predictions**

Within the status classes of Convention P.14.1a, the scale-dependent gravity framework gives model-level predictions whose parameters must be tested with a common T1/T2/T3 ledger:

1.  **Model-level force law:** The enhancement factor $\varepsilon_G(R)$ is modeled as a function of scale and baryonic environment through Equation I.4 and Hypothesis I.1. Tight baryon-tracking relations such as the baryonic Tully-Fisher Relation and the Radial Acceleration Relation are therefore predictions of the phenomenological kernel $(L_0,A_G,m)$, not theorem-level consequences of Appendix H alone.
2.  **Acceleration-lock test:** The acceleration variable controlling the transition is fixed by
$$
g_\Lambda=\frac{c^2\sqrt{\Lambda}}{8}.
$$
Galaxy acceleration data should therefore collapse when plotted against
$$
\chi_b=\frac{|\nabla\Phi_b|}{g_\Lambda}
$$
without fitting an independent MOND scale.
3.  **Parameter-universality test:** The parameter set $(L_0,A_G,m)$ should be approximately universal across the galaxy class to which Equation I.4 is applied. $L_0$ inherits the bridge-normalization status of $g_\Lambda$; $A_G$ and $m$ remain phenomenological until derived from the relaxation sector or inferred with a hierarchical population model.
4.  **Surface-density lock:** Thin-disk transition data should be consistent with
$$
\Sigma_\dagger
=
\frac{g_\Lambda}{2\pi G}
=
\frac{c^2\sqrt{\Lambda}}{16\pi G}.
$$
5.  **Redshift lock:** On a constant-$\Lambda$ branch, high-redshift acceleration thresholds should remain fixed at $g_\Lambda$ rather than scaling with the full Hubble rate $H(z)$. More generally, if an effective vacuum curvature $\Lambda_{\mathrm{eff}}(z)$ is used, the branch predicts
$$
\frac{g_0(z)}{g_0(0)}
=
\sqrt{
\frac{\Lambda_{\mathrm{eff}}(z)}
{\Lambda_{\mathrm{eff}}(0)}
}.
$$
6.  **Absence of particle DM in the modeled branch:** The observed phenomena are explained without conventional particle dark matter in this branch, predicting null results for direct detection experiments searching for conventional dark matter particles if this branch is the correct explanation of the relevant anomalies.
7.  **Cosmological signatures:** The scale dependence of gravity could influence structure growth and cosmological observables. Deviations from $\Lambda$CDM predictions might be observable in cosmic microwave background (CMB) or large-scale structure surveys if $G$ varies with local density or cosmic time.
8.  **Transient stresses:** The dynamics of complexity adaptation and parameter relaxation may lead to transient effects, such as $\rho_\Pi$ in Equation I.7, in highly dynamic events like galaxy cluster mergers. These effects would be tested through discrepancies between baryonic matter distribution and gravitational lensing maps under the same kernel and conservation assumptions.

**I.11 Prospective Rotation-Curve Analysis**

A direct test of the scale-dependent $G(R)$ model is to fit it to observed galaxy rotation curves. The SPARC database [Lelli et al. 2016], providing high-quality rotation curves and detailed baryonic mass models for 152 disk galaxies, offers an ideal dataset. A full comparison requires:

*   Accurate baryonic mass models for each galaxy, requiring estimates of stellar mass-to-light ratios $\Upsilon_\ast$.
**Theorem I.6 (Well-posed generalized Poisson law).** Let $\Omega\subset\mathbb R^3$ be a bounded Lipschitz domain and consider the local energy functional
$$
\mathcal E[\Phi]=\int_\Omega \left[ \frac{1}{8\pi G}\Psi(|\nabla\Phi|^2)+\rho\,\Phi\right]\,d^3x,
$$
where $\Psi(u)$ is $C^1$, strictly convex, coercive, and nondecreasing in $u=|\nabla\Phi|^2$. Then the Euler–Lagrange equation is
$$
\nabla\\!\cdot\\!\big(\mu(|\nabla\Phi|)\,\nabla\Phi\big)=4\pi G\,\rho,\qquad \text{with}\quad \mu(s) := \Psi'(s^2).
$$
With homogeneous Dirichlet boundary condition $\Phi|_{\partial\Omega}=0$, the generalized Poisson equation admits a unique weak solution in $H_0^1(\Omega)$ [Minty 1962; Evans 2010]. For inhomogeneous Dirichlet data, the same argument applies after a standard $H^1$ lifting of the boundary values.

*Proof.* Let $\Omega\subset\mathbb{R}^3$ be bounded Lipschitz and impose homogeneous Dirichlet data. Set $V=H_0^1(\Omega)$ and define the nonlinear operator $A:V\to V^*$ by
$$
\langle A(\phi),\psi\rangle := \int_{\Omega} \mu(|\nabla\phi|)\,\nabla\phi\cdot\nabla\psi\,dx,
\qquad \mu(s)=\Psi'(s^2).
$$
Define the continuous functional $\ell\in V^*$ by
$$
\langle \ell,\psi\rangle := -4\pi G\int_{\Omega}\rho\,\psi\,dx.
$$
Then $\phi\in V$ is a weak solution of the Euler–Lagrange equation iff $A(\phi)=\ell$.

**Hemicontinuity.** For fixed $\phi,\psi,\eta\in V$, the map $t\mapsto\langle A(\phi+t\eta),\psi\rangle$ is continuous because $\nabla(\phi+t\eta)$ depends linearly on $t$ and $\mu$ is continuous.

**Strict monotonicity.** Let $F(\xi):=\frac12\Psi(|\xi|^2)$ on $\mathbb{R}^3$. Since $\Psi$ is strictly convex and nondecreasing, $F$ is strictly convex. Its gradient is $\nabla_\xi F(\xi)=\mu(|\xi|)\xi=:a(\xi)$. The gradient of a strictly convex $C^1$ function is strictly monotone, hence
$$
(a(\xi)-a(\eta))\cdot(\xi-\eta)>0\quad(\xi\ne\eta).
$$
Therefore, for $\phi_1\ne\phi_2$,
$$
\langle A(\phi_1)-A(\phi_2),\phi_1-\phi_2\rangle
=
\int_\Omega (a(\nabla\phi_1)-a(\nabla\phi_2))\cdot(\nabla\phi_1-\nabla\phi_2)\,dx>0.
$$

**Coercivity.** For convex differentiable $\Psi$, the supporting-hyperplane inequality at $u$ with $v=0$ gives $\Psi(0)\ge \Psi(u)-\Psi'(u)u$, hence $\Psi'(u)u\ge \Psi(u)-\Psi(0)$ for all $u\ge0$. Applying this with $u=|\nabla\phi|^2$ yields
$$
\langle A(\phi),\phi\rangle
=\int_{\Omega}\Psi'(|\nabla\phi|^2)|\nabla\phi|^2dx
\ge \int_{\Omega}\big(\Psi(|\nabla\phi|^2)-\Psi(0)\big)\,dx.
$$
By coercivity of $\Psi$ and Poincaré's inequality, the right-hand side tends to $+\infty$ as $\|\phi\|_{V}\to\infty$, so $A$ is coercive.

By the Minty–Browder theorem, hemicontinuity, strict monotonicity, and coercivity imply that there exists a unique $\phi\in V$ such that $A(\phi)=\ell$.

**Uniqueness (direct).** If $\phi_1,\phi_2\in V$ both satisfy $A(\phi)=\ell$, then subtracting gives $\langle A(\phi_1)-A(\phi_2),\phi_1-\phi_2\rangle=0$, which forces $\nabla\phi_1=\nabla\phi_2$ a.e. by strict monotonicity. With homogeneous Dirichlet data, $\phi_1=\phi_2$. $\square$

**Theorem I.7 (Flat-curve asymptotics).** For a point mass $M$, if the response function $\mu(s)$ has the asymptotic behavior $\mu(s) \sim s/a_0$ as $s\to0^+$ for some characteristic acceleration $a_0$, then the gravitational field strength $g(r)=|\nabla\Phi|$ and circular velocity $v_{\rm circ}(r)$ satisfy
$$
g(r)\sim \frac{\sqrt{GMa_0}}{r},\qquad v_{\rm circ}^4(r)\sim GMa_0.
$$

*Proof.* Outside the point source, spherical symmetry reduces the generalized Poisson law to
$$
\frac{1}{r^2}\frac{d}{dr}\big(r^2\mu(g(r))\,g(r)\big)=0,
$$
so there exists a constant $C$ such that
$$
r^2\mu(g(r))\,g(r)=C.
$$
Matching to the enclosed mass $M$ gives $C=GM$. In the large-$r$ regime one has $g(r)\to0$, so the assumed asymptotic law $\mu(s)\sim s/a_0$ gives
$$
r^2\,\frac{g(r)}{a_0}\,g(r)\sim GM,
$$
that is,
$$
g(r)^2\sim \frac{GMa_0}{r^2}.
$$
Taking the positive square root yields
$$
g(r)\sim \frac{\sqrt{GMa_0}}{r}.
$$
The circular velocity satisfies $v_{\rm circ}^2(r)=r\,g(r)$, hence
$$
v_{\rm circ}^2(r)\sim \sqrt{GMa_0},
\qquad
v_{\rm circ}^4(r)\sim GMa_0.
$$
This is the baryonic Tully–Fisher scaling. ∎

*   A joint Bayesian inference analysis (e.g., using nested sampling [Feroz & Hobson 2008; Feroz et al. 2009, 2019]) to determine the universal parameter set $(L_0,A_G,m)$ and the per-galaxy $\Upsilon_\ast$ values by comparing predicted and observed rotation curves. When inferring $A_G$ from rotation curves, the effective far‑field enhancement reflects the baryon‑mass‑weighted $\langle\varepsilon_G\rangle_b$ rather than $A_G$ itself; the numerical fits naturally absorb this via the $\rho_{\mathrm{DM,eff}}(R)=\varepsilon_G(R)\,\rho_b(R)$ source.

**I.12 Robustness and Systematics**

The analysis must account for potential systematic errors. Robustness can be gauged by:

*   **Bootstrap resampling:** Assessing sensitivity to uncertainties in distances, inclinations, and photometric measurements.
*   **Comparison to NFW fits:** Comparing the quality of fit and consistency of parameters to standard $\Lambda$CDM models fitting NFW dark matter halos plus baryonic components.
*   **$\Upsilon_\ast$ consistency:** Checking if fitted stellar $\Upsilon_\ast$ values are consistent with stellar population synthesis models.

**I.12a Dark-Sector Discriminator Protocol**

**Definition I.12a.1 (Matched Residual Experiment).** A matched dark-sector comparison consists of a data vector $y$, covariance matrix $C>0$, shared nuisance parameter vector $\nu$, shared nuisance domain $\mathcal N$, and two model families
$$
y_{PU}(\theta_{PU},\nu),\qquad y_{NFW}(\theta_{NFW},\nu),
$$
where the same baryonic data, distance priors, inclination priors, stellar mass-to-light priors, and covariance conventions are used for both families. The whitened residuals are
$$
r_M(\theta_M,\nu)=C^{-1/2}\bigl(y-y_M(\theta_M,\nu)\bigr),
\qquad
\chi^2_M(\theta_M,\nu)=\|r_M(\theta_M,\nu)\|_2^2,
$$
for $M\in\{PU,NFW\}$.

**Definition I.12a.2 (PU/NFW Matched Discriminator).** The matched discriminator is
$$
\mathcal D_{PU/NFW}
=
\min_{\theta_{NFW},\nu\in\mathcal N}\chi^2_{NFW}(\theta_{NFW},\nu)
-
\min_{\theta_{PU},\nu\in\mathcal N}\chi^2_{PU}(\theta_{PU},\nu),
$$
with both minima computed under the same masking, covariance, nuisance priors, and baryonic preprocessing. Positive $\mathcal D_{PU/NFW}$ favors the PU scaled-gravity family at the matched-residual level; negative $\mathcal D_{PU/NFW}$ favors the NFW family.

For a sample of systems $s=1,\dots,N$, the universality residual for the galaxy-scale triple $\Theta_G=(L_0,A_G,m)$ is
$$
\mathcal U_G=\sum_{s=1}^N\left(\Theta_{G,s}-\bar\Theta_G\right)^T\Sigma_{G,s}^{-1}\left(\Theta_{G,s}-\bar\Theta_G\right),
$$
where $\Theta_{G,s}$ and $\Sigma_{G,s}$ are the system-level posterior mean and covariance under the same inference convention, and $\bar\Theta_G$ is the pooled inverse-covariance weighted mean.

**Proposition I.12a.3 (Nuisance-Matched Likelihood Separation).** Under Gaussian observational errors with covariance $C$, equal nuisance domain $\mathcal N$, and equal nuisance priors for the two model families, $\mathcal D_{PU/NFW}$ is twice the maximized log-likelihood ratio in favor of PU over NFW, up to model-family constants independent of the fitted parameters. Therefore a nonzero discriminator cannot be produced by using different baryonic nuisance freedom in the two fits.

*Proof.* For either model family $M$, the Gaussian log-likelihood is
$$
\log L_M(\theta_M,\nu)
=-\frac12\bigl(y-y_M(\theta_M,\nu)\bigr)^TC^{-1}\bigl(y-y_M(\theta_M,\nu)\bigr)+K_C,
$$
where $K_C$ depends only on $C$ and the data dimension. This is
$$
\log L_M(\theta_M,\nu)=-\frac12\chi_M^2(\theta_M,\nu)+K_C.
$$
Maximizing over the same nuisance domain and the model-specific parameters gives
$$
2\left(\max\log L_{PU}-\max\log L_{NFW}\right)
=\min\chi^2_{NFW}-\min\chi^2_{PU}
=\mathcal D_{PU/NFW}.
$$
Equal nuisance priors and equal nuisance domains ensure that the maximization does not grant one model extra baryonic freedom unavailable to the other. Thus the discriminator measures matched model separation rather than nuisance double counting. ∎

**Corollary I.12a.4 (Dark-Sector Failure Criteria).** The galaxy-scale PU branch fails on a matched sample if any one of the following holds under Definition I.12a.1:

1. $\mathcal D_{PU/NFW}<0$ by a preregistered significance threshold on the primary sample.
2. The pooled universality statistic $\mathcal U_G$ rejects one common $(L_0,A_G,m)$ at the preregistered level after baryonic nuisance propagation.
3. The parameter triple that fits galaxies violates the early-universe, local-gravity, or lensing-safety constraints stated elsewhere in Appendix I.
4. The same universal parameters cannot be transported to the cluster-lensing comparison without adding a new unconstrained response function.

*Proof.* The first condition says the matched likelihood favors NFW on the primary observable. The second says the claimed universal galaxy-scale triple does not exist within the propagated uncertainties. The third says the successful galaxy fit is incompatible with independent sectors of the same theory. The fourth says the cross-scale branch requires a new free function rather than a transported universal law. Each condition contradicts a distinct necessary component of the Appendix I scaled-gravity claim. ∎

### I.12b Adjudicated Multifractal PCE Cascade for Dark-Sector Response

**Definition I.12b.1 (Covariant Multifractal Response Branch Package).** A covariant multifractal response branch package on the Appendix I branch consists of:

1. a finite scale cover $\mathcal U_\ell$ of the baryonic/predictive source distribution;

2. positive predictive-capacity measures $\mu_i(\ell)$ on the cells of $\mathcal U_\ell$;

3. finite partition sums
$$
Z_q(\ell)
=
\sum_{i\in\mathcal U_\ell}\mu_i(\ell)^q
\sim
\ell^{\tau_{\mathrm{PU}}(q)}
\tag{I.12b.1}
$$
on the operational scaling window;

4. the associated singularity spectrum and PCE rate function
$$
f_{\mathrm{PU}}(\alpha)
=
\inf_q\left(q\alpha-\tau_{\mathrm{PU}}(q)\right),
\qquad
D_{\mathrm{eff}}=-\tau_{\mathrm{PU}}(0),
\qquad
I_{\mathrm{PCE}}(\alpha)=D_{\mathrm{eff}}-f_{\mathrm{PU}}(\alpha),
\tag{I.12b.2}
$$
with $I_{\mathrm{PCE}}$ replaced by its lower-semicontinuous convex envelope when the finite branch records only the convex large-deviation envelope;

5. a diffeomorphism-invariant response functional
$$
\Gamma_{\mathrm{mf}}[g,\chi]
=
\int
\sqrt{-g}\,
\Psi\!\left(I_{\mathrm{PCE}}(\alpha_\chi),g_\Lambda,\chi\right)\,d^4x,
\tag{I.12b.3}
$$
where $\chi$ denotes the retained baryonic, predictive-matter, and environment variables, and $\alpha_\chi$ is their local scaling exponent on the branch;

6. a branch-status record for $\tau_{\mathrm{PU}}$, $I_{\mathrm{PCE}}$, $\Psi$, and the support condition under Convention P.14.1e.

The induced multifractal dark response tensor is
$$
T_{\mu\nu}^{\mathrm{mf}}
=
-\frac{2}{\sqrt{-g}}
\frac{\delta\Gamma_{\mathrm{mf}}}{\delta g^{\mu\nu}}.
\tag{I.12b.4}
$$

**Theorem I.12b.2 (Multifractal Response Branch Criterion).** On a covariant multifractal response branch, the scale-dependent galaxy and cluster response kernels are fixed by the single spectrum $\tau_{\mathrm{PU}}(q)$ and its associated rate function $I_{\mathrm{PCE}}$. Suppose the branch also supplies a fixed quasistatic projection norm and ansatz tensor
$$
T_{\mu\nu}^{\mathrm{ans}}(L_0,A_G,m,q)
$$
so that the projection functional
$$
\mathcal J(L_0,A_G,m,q)
=
\left\|
\Pi_{\mathrm{qs}}T_{\mu\nu}^{\mathrm{mf}}
-
T_{\mu\nu}^{\mathrm{ans}}(L_0,A_G,m,q)
\right\|_{\mathrm{br}}^2
\tag{I.12b.5}
$$
has a unique minimum in the parameter family
$$
(L_0,A_G,m,q).
\tag{I.12b.6}
$$
Then those parameters are selected before observational comparison. The multifractal branch is preferred over the simpler Appendix I relaxation kernel only if either:

1. it has strictly lower fixed PCE description cost at the same prediction class; or

2. it uniquely selects parameters that the simpler kernel leaves branch-supplied.

Moreover,
$$
\nabla^\mu T_{\mu\nu}^{\mathrm{mf}}=0
\tag{I.12b.7}
$$
on shell, and the response remains CMB-safe whenever the package support condition suppresses $\Gamma_{\mathrm{mf}}$ on the early homogeneous branch.

*Proof.* The finite partition sums determine $\tau_{\mathrm{PU}}(q)$ on the operational scaling window. With the sign convention $Z_q(\ell)\sim\ell^{\tau(q)}$, the singularity spectrum is the Legendre-Fenchel envelope $f_{\mathrm{PU}}(\alpha)=\inf_q(q\alpha-\tau_{\mathrm{PU}}(q))$, and the associated nonnegative large-deviation cost relative to the support dimension is $I_{\mathrm{PCE}}=D_{\mathrm{eff}}-f_{\mathrm{PU}}$. Thus the rate input used by the response functional is fixed by the package.

The response functional (I.12b.3) depends on the source variables only through this fixed rate function and the retained covariant variables, so the kernel obtained by variation is fixed by the package. Projection onto a finite ansatz family is an ordinary finite-dimensional minimization problem once the branch norm and ansatz tensor in (I.12b.5) are fixed; uniqueness of the minimum gives pre-comparison selection of $(L_0,A_G,m,q)$.

The adjudication rule follows from PCE: if two branches predict the same class of observations, the lower fixed description cost is selected; if one branch fixes quantities that the other leaves supplied, it is more closed at the same status level. Diffeomorphism invariance of $\Gamma_{\mathrm{mf}}$ gives the Ward identity
$$
\nabla^\mu T_{\mu\nu}^{\mathrm{mf}}=0
$$
after imposing the Euler-Lagrange equations for the retained variables $\chi$. If the package support condition sets the multifractal response to zero on the early homogeneous branch, then no universal early-time shift of $G$ is induced. The result is an emergent metric/channel-capacity thermodynamic response law, not a microscopic gravitational Hilbert sector. ∎

**I.13 Expected Parameter Ranges**

Order-of-magnitude reasoning based on galaxy scaling laws and the empirical $g_0$ scale suggests the following ranges for the universal parameters:
$$
L_0\sim1\!-\!10\,\mathrm{kpc},\qquad
A_G\sim1\!-\!9,\qquad
m\simeq2\!-\!4.
$$
These ranges will be constrained by the forthcoming rotation-curve fits. Note that the range for $A_G$ is widened here compared to Section I.9 to accommodate the full range of needed enhancements (2-10 times). No theorem-level value of $A_G$ is derived in the present appendix.

**I.14 Timescale Separation (Quasistatic Local-Relaxation Branch)**

On the quasistatic local-relaxation branch, the adaptation dynamics of local MPU parameters ($\delta, C_{\max}$) governing $G(R)$ are assumed to reach local PCE equilibrium on timescales (Myr–Gyr in this branch) short compared with potential cosmological drift of the environment or fundamental parameters that might cause $(L_0, A_G, m)$ to evolve (Gyr–Hubble time). Under this branch assumption, $G(R)$ may be treated as quasi-static when analyzing galaxy dynamics, while allowing for a slow cosmic evolution of the universal parameters themselves. A first-principles derivation of the Myr–Gyr local equilibration scale from the Appendix D adaptation dynamics ($\eta_{\mathrm{adapt}}$ and the local-PL neighborhood structure of Theorem D.8) remains a separate closure lemma; the galaxy-scale phenomenology of Sections I.6-I.13 inherits this quasistatic branch label.

**I.15 Conclusion**

The PU framework proposes a multi-scale solution to the phenomena attributed to dark matter, driven by the Principle of Compression Efficiency.
1.  **At galaxy scales,** a PCE-driven parameter relaxation mechanism causes the emergent Newton constant to increase with scale ($G(R)$, Equation I.4), providing a physically motivated framework that naturally explains galaxy rotation curves and baryonic scaling relations while respecting local tests of GR, **as an environment‑dependent relaxation** that leaves the CMB‑era effective $G$ unchanged.
2.  **At cluster scales**, where a running $G(R)$ is cosmologically constrained, the mass discrepancy is modeled by a **non‑local predictive‑matter response**. A linear, single‑scale kernel is sufficient for **stacked profiles**, while **high‑concentration outliers** (e.g., A1689) demand either a **mild nonlinearity $q>0$** or a **multi‑scale kernel**. All options remain **CMB‑safe** with $A_G\simeq 0$ and are quantitatively testable against lensing data.

This composite model provides a status-separated dark-sector program: theorem-level identities fix the acceleration scale only after the Appendix H bridge normalization is adopted, with the adopted representative giving the exact lock $g_\Lambda=c^2\sqrt{\Lambda}/8$; the galaxy response law is a phenomenological kernel with testable universal parameters; and the cluster response is a non-local source kernel whose conservation and lensing consequences are explicit model assumptions. The strongest common test is whether galaxy dynamics, baryonic surface-density thresholds, and cluster/lensing response can all be written with the same $g_\Lambda$ rather than with independent acceleration scales.