# Appendix I: A PCE-Driven, Environment-Dependent Model for Emergent Gravity

**I.1 Aim and Scope**

This appendix presents a testable dark-sector model at galaxy, cluster, and cosmological scales. Its response laws are model inputs; a common physical construction would turn them into one multi-scale physical model.

**Technical ledger.**

Within the Predictive-Universe (PU) framework, this appendix develops the dark-sector response stack as a multi-scale, environment-dependent model of emergent gravity. The theorem-level inputs are the emergent-gravity bridge of Sections 11–12 and the acceleration-scale identity of Appendix H conditional on Definition H.0 and Equation H.4b. The galaxy-scale law modification $G(R)$ is a phenomenological kernel constrained by those inputs and by local-gravity limits. The cluster-scale "predictive matter" response is a separate non-local source-modification kernel. The composite model is PCE-motivated and falsifiable, with the parameter roles and T1/T2/T3 dependencies stated explicitly below. The galaxy-scale law modification is **environment-dependent** and does not imply a universal large-scale shift of $G$ relevant for the CMB.

**I.2 Foundations of Emergent Gravity in PU**

The emergence of gravity in the PU framework is a multi-step process (Sections 11, 12):

*   **MPU network and ND-RID:** The fundamental substrate is an adaptive network of Minimal Predictive Units (MPUs) coupled by Non-Deterministic Reflexive Interaction Dynamics (ND-RID, Definition A.2.2).
*   **Information limits:** On a registered reset branch, Theorem 31 gives $\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)$; a positive floor requires a separate bound $H_q(P\mid R)\ge h_{\min}>0$, while $\varepsilon_0=\ln2$ is the structural binary reference and becomes a physical reset floor only for a conditionally uniform binary record. A completed binary reset-support event gives $C_{\max}\le\ln d_0-\ln2$ (Proposition E.2a in Appendix E). Separately, on refresh/minorization branches, a nonzero input-independent full-state refresh component gives strict trace-distance contraction $f_{\mathrm{RID}}<1$ (Lemma E.1) and the refresh-branch capacity bound $C_{\max}(f_{\mathrm{RID}})<\ln d_0$ (Theorem E.2).
*   **Emergent geometry:** Prediction-Optimization (POP) and PCE drive the network toward geometrically regular configurations (Theorem 43). Theorem 46 adds a uniform operational causal-speed upper bound under its stated clock and propagation hypotheses; an attained frontier and a Lorentzian manifold $(M,g_{\mu\nu})$ require the complete Corollary 46a/Appendix O promotion branch.
*   **Area law:** Geometric regularity and Lemma E.5.1 give an area-scaling entropy upper bound. The sharper density coefficient requires Theorem E.3's density certificate, and equality $S=k_B\mathcal A/(4L_{P,\mathrm{op}}^2)$ requires the capacity-achieving, entropy-saturating, additive-ledger branch of Theorem E.6.
*   **Operational gravitational scale:** On that positive saturated branch, define $L_{P,\mathrm{op}}^2=G_{\mathrm{op}}\hbar/c^3$ by
    $$
    G_{\mathrm{op}}(\delta,C,\chi)
    =
    \frac{\eta\delta^2c^3}{4\hbar\chi C(\mathcal E_N)}.
    \tag{I.1}
    $$
    Identifying $G_{\mathrm{op}}$ with measured Newton $G$ is a calibration. Here $\delta$ is the effective spacing, $\eta$ the packing factor, $\chi$ the correlation reduction, and $C(\mathcal E_N)$ the certified channel capacity. The density $\sigma_{\mathrm{eff}}=\chi/(\eta\delta^2)$ is used only on Theorem E.3's density-certificate branch. Subsequent scale-dependent arguments additionally adopt the $\chi^*=1$ branch of Lemma Q.2.2 and the same certified channel at every scale.
*   **Einstein field equations:** Applying thermodynamic principles (Clausius relation) to causal horizons in the emergent geometry, using the Area Law and the MPU stress-energy tensor $T_{\mu\nu}^{(\mathrm{MPU})}$ (Definition B.8, Appendix B) as the source, yields the Einstein field equations (Theorem 50).

**I.3 Complexity Saturation in Prediction**

The MPU network's adaptation is driven by balancing predictive gain against resource cost according to the Principle of Compression Efficiency (PCE, Definition 15). The effective aggregate complexity $\bar C_{\mathrm{agg}}(R)$ in a region of scale $R$ adapts under PCE for a registered task-scale coordinate $\hat C_{\mathrm{target}}(R)$, achieving Predictive Performance $PP(C,\hat C_{target})$ under Equation (22). Equation (38) regulates that internal scale; matching it to external environmental difficulty requires a separate innovation certificate.

 The optimal complexity $C^*$ for a given $\hat C_{\mathrm{target}}$ is determined by the condition where the marginal predictive benefit equals the marginal resource cost (Definition 14, Equation 18):
$$
\Gamma_0\,\frac{\partial PP}{\partial C}\bigg|_{C^*} = \lambda\,R'(\bar C_{\mathrm{agg}}^*)
     + R'_I(\bar C_{\mathrm{agg}}^*).
\tag{I.2}
$$
As complexity $\bar C_{\mathrm{agg}}$ increases, the marginal predictive gain $\partial PP/\partial C$ decreases (diminishing returns, $\partial^2 PP/\partial C^2 < 0$), while the marginal resource costs ($R', R_I'$) generally increase or remain non-negative ($R'' \ge 0$, $R_I'' \propto -1/C^2 < 0$ for $C>K_0$, but total marginal cost typically non-decreasing). This creates a balance point.

**Proposition I.2 (Finite Saturation of Aggregate Complexity).**
Let $J(C)$ be the PCE objective on $[K_0,\infty)$ and suppose
$$
J'(C)=B(C)-M(C),\qquad
B(C)=\Gamma_0\frac{\partial PP}{\partial C},\qquad
M(C)=\lambda R'(C)+R_I'(C).
$$
Assume that $B$ and $M$ are continuous, $B$ is strictly decreasing with $B(C)\to0$, $M$ is nondecreasing, and there exist $C_1\ge K_0$ and $m_0>0$ such that $M(C)\ge m_0$ for $C\ge C_1$. Then $J$ attains its global maximum at a finite $\bar C_{\mathrm{agg,sat}}$. If $B(K_0)\le M(K_0)$, the maximizer is $K_0$; if $B(K_0)>M(K_0)$, there is a unique interior maximizer $C^*>K_0$ satisfying Equation (I.2). An environmental interpretation additionally requires the innovation certificate of Definition 21.

*Proof.* Since $B(C)\to0$, choose $C_2\ge C_1$ such that $B(C)<m_0$ for $C\ge C_2$. Then
$$
J'(C)=B(C)-M(C)<m_0-m_0=0
$$
for $C\ge C_2$. Hence $J$ decreases on $[C_2,\infty)$, so its supremum on $[K_0,\infty)$ equals its maximum on the compact interval $[K_0,C_2]$. Continuity of $J$ gives a finite maximizer.

Because $B$ is strictly decreasing and $M$ is nondecreasing, $B-M$ is strictly decreasing. If $B(K_0)\le M(K_0)$, then $J'(C)<0$ for every $C>K_0$, and the maximizer is $K_0$. If $B(K_0)>M(K_0)$, continuity and the negative tail give a zero $C^*>K_0$ of $B-M$ by the intermediate value theorem. Strict decrease makes this zero unique; $J'>0$ before $C^*$ and $J'<0$ after $C^*$, so $C^*$ is the unique global maximizer and satisfies (I.2). ∎

**I.4 Predictive-Information Saturation in Sparse Regimes**

The coordinate $\hat C_{\mathrm{target}}$ is the internal task scale of Definition 21. It represents the complexity of externally exploitable patterns only on a branch with an innovation certificate that compares the coordinate with external records.



*   **Hypothesis I.1:** On a branch carrying an external innovation certificate for Definition 21, low-density sparse regions have a lower externally measured exploitable-pattern scale than high-density regions, and the certificate identifies this difference with a lower effective $\hat C_{\mathrm{target}}(R)$ within its registered error. Without that certificate, sparsity alone does not determine the internal target coordinate.


**Corollary I.2 (Conditional Target-Scale Comparative Statics).** Write $B(C;\theta)=\Gamma_0\partial_CPP(C,\theta)$ with $\theta=\hat C_{\mathrm{target}}$, and let the marginal-cost function $M(C)$ be common across the compared environments. In addition to Proposition I.2, assume that $\theta_1\le\theta_2$ implies $B(C;\theta_1)\le B(C;\theta_2)$ for every $C$, with strict inequality at any interior crossing. Then the unique saturation optimizers obey $C^*(\theta_1)\le C^*(\theta_2)$.

*Proof.* At $C^*(\theta_2)$ one has $B(C^*(\theta_2);\theta_1)\le M(C^*(\theta_2))$. Since $B(\cdot;\theta_1)-M$ is strictly decreasing, its zero cannot lie to the right. Without this monotone-differences premise, Hypothesis I.1 and Equation (23) do not order the PCE optimizers. ∎

**I.5 Conditional Parameter-Relaxation Mechanism after Early Saturation**

Assume a registered optimizer map $(\theta\mapsto\delta^*(\theta),p^*(\theta))$ for the complete PCE potential, with $\delta^*$ nonincreasing and $p^*$ nonincreasing in target scale, and assume the selected channel family has actual capacity $C(\mathcal E_p)$ nonincreasing in $p$ on the admitted interval. These are branch data to be proved for a concrete microscopic model; Theorem E.2 supplies an upper bound, not monotonicity of the actual capacity or of the optimizer. Under these assumptions, the lower sparse-region target of Corollary I.2 gives larger $\delta^*$, larger $p^*$, and lower $C(\mathcal E_{p^*})$. A small-spacing cost may, for example, scale as $1/\delta^2$ or $\ln(\delta_{\mathrm{ref}}/\delta)$ on a declared interval; $\ln\delta$ alone has the opposite monotonicity.

*   **Effective spacing:** $\delta^*$ increases on the assumed monotone optimizer branch.
*   **Effective channel capacity:** $C(\mathcal E_{p^*})$ decreases only under the assumed capacity monotonicity.

On this branch, the two variations raise $\eta(\delta^*)^2/C(\mathcal E_{p^*})$ in Equation (I.1).

**I.5.1 Crossover Scale from Information Resolution Limits**

The parameter relaxation described in Section I.5 implies that the MPU network's equilibrium structure depends on the local information environment. We derive the transition scale $a_0$ from the resolution limits of the MPU in the cosmic vacuum.

**Proposition I.3 (Detector-Calibrated Crossover Threshold).**

Assume an independently registered detector-and-relaxation certificate which (i) validates the Unruh and de Sitter detector temperatures for the selected operational probes and (ii) defines the relaxation crossover as their equality. Then, in a de Sitter background with $\Lambda>0$, the crossover acceleration is uniquely
$$
a_0=c^2\sqrt{\frac{\Lambda}{3}}.
$$
This is an algebraic threshold calibration; temperature equality alone does not prove gradient indistinguishability or parameter relaxation.

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

**The Crossover Criterion on the registered certificate branch:** By definition of that branch, the relaxation threshold is the equality $T_U(a_0) = T_{dS}$:
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

**Physical interpretation on that certificate branch:**
- For $a\gg a_0$, the registered detector inequality is $T_U\gg T_{dS}$; the asserted high-fidelity response additionally uses the optimizer certificate.
- For $a\ll a_0$, the registered detector inequality is $T_U\ll T_{dS}$; the asserted channel relaxation and change of effective coupling additionally use the optimizer and gravity-calibration certificates.

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
The quantity $\chi_b=|\nabla\Phi_b|/g_\Lambda$ is the canonical direct dimensionless ratio of the local baryonic acceleration to the branch acceleration scale. ∎

**Remark I.1.** The functional form $a_0 \propto c^2\sqrt{\Lambda}$ follows from equating two well-established temperatures (Unruh and de Sitter). The additional factor $\eta' = 3/(8\sqrt{3})$ is not obtained from that temperature equality alone; it is the conditional consequence of the QFI linear-response bridge law adopted in Appendix H, Definition H.0. Once that bridge-law normalization is fixed, no continuously adjustable parameter remains in the galactic-scale prediction; the scale is locked to $\Lambda$ by Corollary I.3a.

**Definition I.3b (Predictive Focusing and Susceptibility Datum).** In this subsection use $c=\hbar=k_B=1$, take $\lambda$ to have length dimension, and measure entropy in nats. On a regular emergent metric/channel-capacity thermodynamic branch, let $k^\mu=dx^\mu/d\lambda$ be an affine null generator, let $a(\lambda)$ be the transverse area of one retained horizon pencil, and let $S_{\mathrm{pred}}(\lambda)$ be the retained predictive entropy assigned to that same pencil. Define
$$
\Theta_{\mathrm{PU}}(\lambda)
=
\frac{d}{d\lambda}
\left(
\frac{a(\lambda)}{4G_{\mathrm{op}}}+S_{\mathrm{pred}}(\lambda)
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

**Theorem I.3c (Predictive Focusing and Susceptibility Sum Rule).** Suppose the retained horizon pencil satisfies
$$
\frac{1}{4G_{\mathrm{op}}}\frac{d^2a}{d\lambda^2}
=
-2\pi a(\lambda)T^{\mathrm{PU}}_{kk}
-
\mathcal S_{\mathrm{ch}},
\qquad
\mathcal S_{\mathrm{ch}}\ge0,
\tag{I.3c.1}
$$
where $T^{\mathrm{PU}}_{kk}=T^{\mathrm{PU}}_{\mu\nu}k^\mu k^\nu$ and $\mathcal S_{\mathrm{ch}}$ has dimension $L^{-2}$. Suppose also that
$$
\frac{d^2S_{\mathrm{pred}}}{d\lambda^2}
\le
2\pi a(\lambda)T^{\mathrm{PU}}_{kk}.
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

If, in addition, $\chi_g(\omega,\mathbf k)$ is causal and passive for each retained $\mathbf k$, is analytic in the upper half $\omega$-plane, obeys $\chi_g(-\omega,\mathbf k)=\overline{\chi_g(\omega,\mathbf k)}$ for real $\omega$, has finite limits at zero and infinity, and has the falloff required for the unsubtracted dispersion relation, then
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

*Proof.* Differentiating (I.3b.1), substituting (I.3c.1), and applying (I.3c.2) gives
$$
\frac{d\Theta_{\mathrm{PU}}}{d\lambda}
=
\frac{1}{4G_{\mathrm{op}}}\frac{d^2a}{d\lambda^2}
+
\frac{d^2S_{\mathrm{pred}}}{d\lambda^2}
\le
-2\pi aT^{\mathrm{PU}}_{kk}-\mathcal S_{\mathrm{ch}}
+2\pi aT^{\mathrm{PU}}_{kk}
=-\mathcal S_{\mathrm{ch}}\le0.
$$

On a calibrated branch one may set $G_{\mathrm{op}}=G$; the focusing inequality itself does not perform that calibration.

For the susceptibility, apply the unsubtracted Kramers--Kronig relation to $\chi_g-\chi_g(\infty)$:
$$
\operatorname{Re}\chi_g(0,\mathbf k)-\chi_g(\infty,\mathbf k)
=
\frac{2}{\pi}
\int_0^\infty
\frac{\operatorname{Im}\chi_g(\omega,\mathbf k)}{\omega}\,d\omega.
$$
The reality condition makes both the static limit and the infinite-frequency limit real. Therefore $\operatorname{Re}\chi_g(0,\mathbf k)=\chi_g(0,\mathbf k)$, which proves (I.3c.4). ∎

**Corollary I.3d (No Replacement of the H-Bridge by the Sum Rule Alone).** The sum rule (I.3c.4) is a consistency and spectral-reconstruction gate for any dark-sector susceptibility model. It does not by itself fix the numerical factor $\eta'=3/(8\sqrt3)$ in Corollary I.3a. That factor remains fixed by Appendix H, Definition H.0 and Equation H.4b unless a separate PU-internal theorem derives the same static normalization from the spectral density $\operatorname{Im}\chi_g$.

*Proof.* Equation (I.3c.4) determines the difference $\chi_g(0,\mathbf k)-\chi_g(\infty,\mathbf k)$ only after the spectral density and high-frequency normalization are fixed. It is therefore a dispersion constraint on an already specified susceptibility datum, not a substitute for the operating-point normalization of Appendix H. ∎

**Definition I.3e (RCD-Buchert-Cheeger Backreaction Datum).** On a regular emergent metric/channel-capacity thermodynamic branch, let $D$ be a compact averaging domain in the noncollapsed $\mathrm{RCD}^*(K,4)$ limit of Theorem C.6c, with normalized measure $\langle f\rangle_D$. A backreaction datum consists of:

1. an expansion scalar $\theta\in W^{1,2}(D)$ and shear magnitude $\sigma\in L^2(D)$ for the retained cosmological congruence;

2. the positive Neumann spectral-gap constant
$$
\lambda_1(D)
:=
\inf_{\substack{f\in W^{1,2}(D)\\ \operatorname{Var}_D(f)>0}}
\frac{\mathrm{Ch}_D(f)}{\operatorname{Var}_D(f)}
>0,
$$
so that $\operatorname{Var}_D(f)\le\lambda_1(D)^{-1}\mathrm{Ch}_D(f)$ by definition;

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

**Corollary I.3g (Backreaction Status Boundary).** On a branch carrying Definition I.3e, cosmological backreaction is bounded by Cheeger energy, shear, predictive stress variance, source-energy rate density, and the retained finite-defect budgets. If that datum is not supplied for a cosmological domain, Theorem I.3f supplies no estimate for the domain, and Appendix I states no independent theorem-level backreaction estimate there.

*Proof.* The first sentence is Theorem I.3f. When Definition I.3e is unavailable, the theorem's hypothesis is not satisfied, so its conclusion cannot be invoked. The final clause records the absence of any separate backreaction theorem in this appendix; it is not a contrapositive inference. ∎



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

6. on each retained cosmological averaging domain $D$ with spectral gap $\lambda_1(D)>0$, the emergent metric/channel-capacity field equation admits an elliptic gauge and a dimensionless source-control certificate
$$
\frac{1}{\lambda_1(D)}\mathrm{Ch}_D(\theta)
+
\langle\sigma^2\rangle_D
\le
\mathcal B_D^{\mathrm{ell}}
\left[
\operatorname{Var}_D(T_{\mathrm{pred}}),
\dot\rho_{\mathrm{src}},
\mathfrak B_D,
\mathfrak H_D
\right],
\tag{I.3h.2}
$$
where $\mathcal B_D^{\mathrm{ell}}$ is a finite dimensionless bound in the declared normalization.

**Theorem I.3i (RCD Elliptic Scale-Bridge Completion).** Let a branch carry the datum of Definition I.3h and, in addition, a discrete-to-continuum stability certificate proving that its measured Gromov-Hausdorff limit satisfies $\mathrm{RCD}^*(K,4)$ and that the Mosco limit of $\mathcal E_n$ is the Cheeger energy of $(X,d,m)$. Then the limit Cheeger energy is quadratic and
$$
|\mathcal Q_D^{\mathrm{PU}}|
\le
2\mathcal B_D^{\mathrm{ell}}
\left[
\operatorname{Var}_D(T_{\mathrm{pred}}),
\dot\rho_{\mathrm{src}},
\mathfrak B_D,
\mathfrak H_D
\right].
\tag{I.3i.1}
$$

*Proof.* The stability certificate identifies $(X,d,m)$ as an $\mathrm{RCD}^*(K,4)$ space and identifies the Mosco limit with its Cheeger energy. Infinitesimal Hilbertianity in the definition of an $\mathrm{RCD}$ space makes that Cheeger energy quadratic. Theorem I.3f gives
$$
|\mathcal Q_D^{\mathrm{PU}}|
\le
\frac{2}{3\lambda_1(D)}\mathrm{Ch}_D(\theta)
+
2\langle\sigma^2\rangle_D.
$$
Since both terms are nonnegative and $2/3\le2$,
$$
|\mathcal Q_D^{\mathrm{PU}}|
\le
2\left(
\frac{1}{\lambda_1(D)}\mathrm{Ch}_D(\theta)
+
\langle\sigma^2\rangle_D
\right).
$$
Applying the dimensionless certificate (I.3h.2) proves (I.3i.1). ∎

**Corollary I.3j (Scale-Bridge Scope).** The predictive-stress backreaction estimate (I.3i.1) is established only on branches satisfying Definition I.3h and the discrete-to-continuum stability certificate of Theorem I.3i. If that package is unavailable, the local estimate (I.3f.1) remains available only on domains carrying items 1--3 of Definition I.3e, including the stated positive spectral gap. No estimate in terms of predictive stress and defect budgets follows without the elliptic source-control estimate.

*Proof.* Theorem I.3i requires its entire branch package to derive (I.3i.1). Independently, the proof of Theorem I.3f derives (I.3f.1) from the definition of $\mathcal Q_D^{\mathrm{PU}}$ and the spectral-gap inequality; it derives (I.3f.2) only after applying (I.3e.2). Therefore the local bound has exactly the scope stated here, and the predictive-stress bound additionally requires elliptic source control. ∎


**Remark I.3k (Definite Answer to the RCD Elliptic-Backreaction Question).** The RCD elliptic-regularity step is not presently a computed numerical closure in Appendix I. The conditional theorem-level form is the following: if an averaging domain $D$ on a noncollapsed $\mathrm{RCD}^*(K,4)$ branch supplies $\lambda_1(D)>0$, $\theta\in W^{1,2}(D)$, $\sigma\in L^2(D)$, and a dimensionless elliptic scale-bridge estimate
$$
\frac{1}{\lambda_1(D)}\mathrm{Ch}_D(\theta)
+
\langle\sigma^2\rangle_D
\le
\mathcal B_D^{\mathrm{ell}}
\left[
\operatorname{Var}_D(T_{\mathrm{pred}}),
\dot\rho_{\mathrm{src}},
\mathfrak B_D,
\mathfrak H_D
\right],
\tag{I.3k.1}
$$
then $|\mathcal Q_D^{\mathrm{PU}}|\le2\mathcal B_D^{\mathrm{ell}}$ for the same declared arguments. Without (I.3k.1), Appendix I has only a conditional analytic target, not a theorem-level numerical estimate.

In particular, no current Appendix I calculation fixes a canonical-domain value such as $C_D\approx10^{20}$ in Planck units. Such a number may be integrated only after the domain geometry, Poincaré constant, Hölder regularity scale, field-equation elliptic gauge, and finite defect budgets are computed on the same branch.

---

The PCE-driven relaxation of network parameters can be formalized by modeling the local contribution to the global PCE Potential:
$$
V_{struct}(\delta, C_{\max}; \rho_b) = V_{cost}(\delta, C_{\max}) - V_{benefit}(\delta, C_{\max}; \rho_b)
\tag{I.3.5}
$$
The system dynamically adjusts its effective local parameters $\delta$ and $C_{\max}$ to minimize this potential.

*   **Analysis of Cost and Benefit:**
    *   **Structural Cost $V_{cost}$:** This term records the declared physical resources needed to maintain the network infrastructure. A denser network may carry a specified spacing cost. Channel fidelity is parametrized independently by the registered refresh decomposition $\mathcal E_N=(1-p)\Psi+pT_\sigma$: Lemma E.1 gives $f_{RID}\le1-p$, and Theorem E.2 supplies the associated strict capacity record. Appendix A.0.4's $V_{rel}$ is a reliability/error-correction cost as a function of the declared error model; it does not prove that $C_{\max}$ is monotone in reset heat. Accordingly, a constructive branch must enter an explicit increasing maintenance function $V_{\mathrm{chan}}(p)$ or $V_{\mathrm{chan}}(C_{\max})$ and verify its derivative on the admitted interval. With that registered function, $V_{cost}=V_{\mathrm{spacing}}(\delta)+V_{\mathrm{chan}}(C_{\max})$ has the monotonicity used below.
    *   **Predictive Benefit $V_{benefit}$:** The benefit arises from the network's ability to form complex predictive models of the local environment. This ability, $PP_{agg}$, depends on having a dense (small $\delta$) and high-fidelity (large $C_{\max}$) network. The total benefit is proportional to the amount of "stuff to predict," which is directly related to $\rho_b$. Thus, $V_{benefit}$ generally increases as $\delta$ decreases, increases as $C_{\max}$ increases, and increases with $\rho_b$.

*   **Conditional crossover behavior:** If $V_{struct}(\delta,C_{\max};\rho_b)$ is coercive on the admissible parameter domain, has a unique minimizer for each retained value of $\rho_b$, and its minimizer moves from a small-$\delta$, large-$C_{\max}$ regime at high $\rho_b$ to a large-$\delta$, small-$C_{\max}$ regime at low $\rho_b$, then the equilibrium pair depends on $\rho_b$ and exhibits the stated crossover.
    *   **High $\rho_b$ (e.g., galactic cores):** The assumed minimizer lies in the high-cost, high-performance regime with small spacing $\delta_0$ and large channel capacity $C_{\max,0}$.
    *   **Low $\rho_b$ (e.g., galactic outskirts):** The assumed minimizer lies in the low-cost, low-performance regime with large spacing $\delta_{\mathrm{large}}$ and small channel capacity $C_{\max,\mathrm{low}}$.

The qualitative cost-benefit tendencies motivate these branch hypotheses but do not establish them. Equation (I.4) is a phenomenological interpolation for a branch on which the crossover hypotheses are supplied.


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

**Theorem I.4a (Fixed-Scale Bianchi Integrability and Law--Source Equivalence).** At one fixed coarse-graining scale $\mu$, suppose $\Lambda$ is constant on the retained patch and an emergent metric satisfies
$$
G_{\mu\nu}+\Lambda g_{\mu\nu}
=8\pi G_{\mathrm{eff}}(x;\mu)T_{\mu\nu}+X_{\mu\nu},
\qquad
\nabla^\mu T_{\mu\nu}=0.
\tag{I.4a.1}
$$
Then the Bianchi identity forces
$$
T^{\mu}{}_{\nu}\nabla_\mu G_{\mathrm{eff}}
=-\frac1{8\pi}\nabla^\mu X_{\mu\nu}.
\tag{I.4a.2}
$$
For any positive constant $G_0$, define
$$
T^{\mathrm{DS}}_{\mu\nu}
=
\left(\frac{G_{\mathrm{eff}}}{G_0}-1\right)T_{\mu\nu}
+\frac{X_{\mu\nu}}{8\pi G_0}.
\tag{I.4a.3}
$$
Equations (I.4a.1)--(I.4a.2) are then equivalent to
$$
G_{\mu\nu}+\Lambda g_{\mu\nu}
=8\pi G_0\bigl(T_{\mu\nu}+T^{\mathrm{DS}}_{\mu\nu}\bigr),
\qquad
\nabla^\mu\bigl(T_{\mu\nu}+T^{\mathrm{DS}}_{\mu\nu}\bigr)=0.
\tag{I.4a.4}
$$

*Proof.* Taking $\nabla^\mu$ of (I.4a.1), using $\nabla^\mu G_{\mu\nu}=0$, metric compatibility, constant $\Lambda$ at fixed scale, and matter conservation gives (I.4a.2). Substitution of (I.4a.3) gives the first equation in (I.4a.4), and its divergence vanishes by (I.4a.2). The algebra reverses, proving equivalence. ∎

**Corollary I.4a.1 (Universality Rigidity).** If $X_{\mu\nu}=0$ and the actual tensor $T^\mu{}_\nu(x)$ is nonsingular, then $\nabla_\mu G_{\mathrm{eff}}=0$ at $x$. More generally, the same conclusion follows when one universal gradient $dG_{\mathrm{eff}}|_x$ is required to satisfy (I.4a.2) for every co-realized or independently testable conserved source configuration in a pointwise-separating family
$$
\bigcap_{T\in\mathfrak T_x}
\ker\bigl(\alpha_\mu\mapsto T^{\mu}{}_{\nu}\alpha_\mu\bigr)
=\{0\},
\tag{I.4a.5}
$$
Thus a freely varying universal coupling is incompatible with those conserved sources unless a compensating $X_{\mu\nu}$ is present.

*Proof.* With $X_{\mu\nu}=0$, equation (I.4a.2) places $dG_{\mathrm{eff}}|_x$ in the kernel of the actual stress tensor. Nonsingularity makes that kernel zero. Under the family hypothesis, the same universal gradient lies in every displayed kernel, whose intersection is zero by (I.4a.5). ∎

**Corollary I.4a.2 (PPI Law--Source Identifiability Boundary).** A protocol that observes only the metric response and the total right-hand side of (I.4a.4) cannot distinguish a varying-law representation from its constant-law effective-source representation; they are PPI-equivalent on that protocol family. The descriptions separate only if a finite protocol independently identifies $G_{\mathrm{eff}}$, $T_{\mu\nu}$, or $X_{\mu\nu}$. Scale dependence $G(\mu)$ across distinct fixed-scale effective theories is not a spacetime gradient and is not restricted by (I.4a.2).

*Proof.* Theorem I.4a gives identical field equations and identical conserved total sources for the two representations. They therefore induce the same responses on the stated protocol family and are identified by PPI. An independently identified factor enlarges the response family and can separate the representations. ∎

**I.6--I.7 Bianchi status rule.** A radial profile $G(r)$ is a spacetime-dependent coupling, not merely an RG label $G(\mu)$. Its standalone variable-law reading is licensed only with a covariant correction tensor $X_{\mu\nu}$ satisfying (I.4a.2) and an independent protocol that identifies the factors. Without that certificate, Equation I.6 is read in the constant-$G_0$ effective-source representation (I.4a.3), and the law/source alternatives in I.7 are PPI-equivalent descriptions of the same total response.

**I.7 A Multi-Scale Solution from Global PCE Optimization**

This appendix compares two conditional phenomenological mechanisms: adapting local network parameters to modify the emergent law ($G$), and reconfiguring the substrate to modify the effective source ($T_{\mu\nu}$). Selection between them requires a preregistered common objective, admissible covariant completions, and the observational and conservation certificates stated below; PCE alone does not determine the choice.

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

Environmental dependence does not by itself establish early-Universe safety. A covariant cosmological completion must satisfy the CMB background and perturbation projections of Definition I.13d.

**I.7.2 Cluster Scales: Conditional Non-Local Source-Modification Branch**

A cluster-scale modification of the gravitational law is not excluded by CMB data without specifying a covariant cosmological completion and computing its perturbation-era response. This appendix instead studies a separate phenomenological source-modification branch. Its admissibility requires the local-gravity, lensing, CMB-projection, and covariant-conservation certificates stated later in this appendix; PCE alone does not select this branch over every law-modification alternative.

On this branch, the predictive-matter response is modeled by the quasistatic spatial convolution

$$
\rho_{\rm PM}(r)=A_{\rm PM}\!\int K\!\big(|\mathbf r-\mathbf r'|;L_0\big)\,\rho_b(r')\!\left(\frac{|\nabla\Phi_b(r')|}{g_\ast}\right)^{q}\! d^3r',
\tag{I.7}
$$

Here $K$ is a normalized spatial response kernel, $\int K\,d^3x=1$, $\Phi_b$ is the background-subtracted baryonic potential, $g_\ast$ is a characteristic acceleration, and $q$ is a nonlinearity exponent. Calling this equal-time kernel causal requires an additional construction as the quasistatic reduction of a retarded spacetime susceptibility. For fixed kernel and parameters the model can be tested against cluster lensing and baryonic maps; offsets in merging clusters are outputs to be calculated, not consequences of nonlocality alone.

The integrated predictive-matter mass is
$$
M_{\rm PM}
=A_{\rm PM}\int\rho_b(r')\left(\frac{|\nabla\Phi_b(r')|}{g_\ast}\right)^q d^3r'
=A_{\rm PM}\left\langle\left(\frac{|\nabla\Phi_b|}{g_\ast}\right)^q\right\rangle_{\rho_b}M_b.
$$
Thus cluster baryon budgets constrain the displayed combination rather than $A_{\rm PM}$ alone. For $q>0$, the exactly homogeneous background contribution vanishes only after the declared background subtraction sets $\nabla\Phi_b=0$. This fact does not establish CMB compatibility: perturbations at recombination must satisfy the CMB projection and residual bounds of Definition I.13d. Likewise, covariant conservation does not follow from the scalar density formula (I.7); it requires the action/Ward or retarded-susceptibility conservation certificate used by Theorem I.13e.

**Anisotropic stress.** The lensing–dynamics identity (I.8) assumes a metric theory with minimal coupling and negligible anisotropic stress so that both probes are sensitive to the same potential; departures from this condition are separately testable.

**Theorem I.5 (Conditional lensing–dynamics identity).**
Consider an axisymmetric lens with kinematic scale $r_\sigma$ and Einstein radius $b_E$. Assume that the theory is metric with minimal coupling, anisotropic stress is negligible, the same enclosed baryonic normalization $M_b$ is used for both probes, and the calibrated response maps factorize as
$$
M_{\rm dyn}=C_{\rm dyn}\frac{G_{\rm eff}(r_\sigma)}{G_0}M_b,
\qquad
M_{\rm lens}=C_{\rm lens}\frac{G_{\rm eff}(b_E)}{G_0}M_b.
$$
If $G_{\rm eff}(L)=G_0(L/L_0)^{\bar\gamma}$ throughout the comparison window for one constant exponent $\bar\gamma$, then
$$
\boxed{\ \frac{M_{\rm lens}}{M_{\rm dyn}}=C_{\rm geom}\,\Big(\frac{b_E}{r_\sigma}\Big)^{\bar\gamma}\ },
\qquad
C_{\rm geom}:=\frac{C_{\rm lens}}{C_{\rm dyn}}.
\tag{I.8}
$$
In the idealized symmetric calibration $C_{\rm lens}=C_{\rm dyn}$, one has $C_{\rm geom}=1$.

*Proof.* Dividing the two assumed response maps cancels $M_b$ and $G_0$:
$$
\frac{M_{\rm lens}}{M_{\rm dyn}}
=
\frac{C_{\rm lens}}{C_{\rm dyn}}
\frac{G_{\rm eff}(b_E)}{G_{\rm eff}(r_\sigma)}.
$$
The power law gives
$$
\frac{G_{\rm eff}(b_E)}{G_{\rm eff}(r_\sigma)}
=
\frac{G_0(b_E/L_0)^{\bar\gamma}}{G_0(r_\sigma/L_0)^{\bar\gamma}}
=
\left(\frac{b_E}{r_\sigma}\right)^{\bar\gamma}.
$$
Substitution and the definition of $C_{\rm geom}$ prove (I.8). ∎

**I.8 Consistency with Local Tests of GR**

The scale-dependent gravity model (Equation I.4) must be tested against precision-gravity measurements. Define
$$
x:=\left(\frac{R}{L_0}\right)^m,
\qquad
\varepsilon_G(R):=\frac{G(R)}{G_0}-1=A_G(1-e^{-x}).
$$
For $x\ge0$, Taylor's theorem gives
$$
0\le x-(1-e^{-x})\le\frac{x^2}{2},
$$
and hence
$$
\left|\varepsilon_G(R)-A_G\left(\frac{R}{L_0}\right)^m\right|
\le
\frac{|A_G|}{2}\left(\frac{R}{L_0}\right)^{2m}.
$$

*   **Scale separation:** For $R=10^{-6}\,\mathrm{kpc}$, $L_0=1\,\mathrm{kpc}$, $m=2$, and $A_G=1$, one has $x=10^{-12}$ and
$$
10^{-12}-5\times10^{-25}\le\varepsilon_G(R)\le10^{-12}.
$$
*   **Recovery of $G_0$:** The bound proves $G(R)/G_0\to1$ as $R/L_0\to0$ for finite $A_G$ and $m>0$.
*   **PPN parameters:** The estimate for $\varepsilon_G(R)$ controls only the local Newtonian-coupling component of the model. Bounds on $\gamma_{\mathrm{PPN}}$, $\beta_{\mathrm{PPN}}$, preferred-frame terms, and radiation-sector effects require the covariant local-gravity projection $\Pi_{\mathrm{loc}}$ and its residual interval from Definition I.13d. No PPN conclusion follows from the smallness of $\varepsilon_G$ alone.

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

**Definition I.5a (Capacity-Elastic Weak-Field Branch).** On the quasistatic weak-field emergent metric/channel-capacity thermodynamic branch, let
$$
g_\Lambda:=\frac{c^2\sqrt{\Lambda}}{8}
\tag{I.5a.1}
$$
be the acceleration scale fixed by Corollary I.3a. A capacity-elastic response potential is a radial convex function
$$
\mathcal F(\xi)=g_\Lambda^2F\left(\frac{|\xi|}{g_\Lambda}\right),
\qquad
\xi\in\mathbb R^3,
\tag{I.5a.2}
$$
where $\mathcal F$ is $C^1$, strictly convex, coercive, and normalized so that
$$
\mu(x):=\frac{F'(x)}{x}
\tag{I.5a.3}
$$
has a continuous extension to $x=0$. The corresponding capacity-elastic energy is
$$
\mathcal E_{\mathrm{cap}}[\Phi]
=
\frac{1}{4\pi G}
\int_\Omega
g_\Lambda^2F\left(\frac{|\nabla\Phi|}{g_\Lambda}\right)\,d^3x
+
\int_\Omega\rho_b\Phi\,d^3x.
\tag{I.5a.4}
$$
The saturated high-capacity branch has
$$
\mu(x)\to1\qquad(x\to\infty),
\tag{I.5a.5}
$$
and the unsaturated low-capacity elastic branch has
$$
\mu(x)\sim x\qquad(x\to0).
\tag{I.5a.6}
$$

**Proposition I.5b (Euler-Lagrange Form of Capacity Elasticity).** Critical points of (I.5a.4) satisfy
$$
\nabla\cdot
\left[
\mu\left(\frac{|\nabla\Phi|}{g_\Lambda}\right)\nabla\Phi
\right]
=
4\pi G\rho_b.
\tag{I.5b.1}
$$

*Proof.* For a compactly supported variation $\Phi+\epsilon\eta$,
$$
\frac{d}{d\epsilon}\mathcal E_{\mathrm{cap}}[\Phi+\epsilon\eta]\Big|_{\epsilon=0}
=
\frac{1}{4\pi G}
\int_\Omega
\nabla_\xi\mathcal F(\nabla\Phi)\cdot\nabla\eta\,d^3x
+
\int_\Omega\rho_b\eta\,d^3x.
$$
Since
$$
\nabla_\xi\mathcal F(\xi)
=
g_\Lambda^2F'\left(\frac{|\xi|}{g_\Lambda}\right)
\frac{\xi}{g_\Lambda|\xi|}
=
\frac{F'(x)}{x}\xi
=
\mu(x)\xi,
\qquad x=\frac{|\xi|}{g_\Lambda},
$$
the first variation is
$$
\frac{1}{4\pi G}
\int_\Omega
\mu\left(\frac{|\nabla\Phi|}{g_\Lambda}\right)\nabla\Phi\cdot\nabla\eta\,d^3x
+
\int_\Omega\rho_b\eta\,d^3x.
$$
Integrating by parts and using arbitrary $\eta$ gives (I.5b.1). ∎

**Definition I.5c (Certified RAR Shape Record).** On a fixed quasistatic disk regime, let $g_0>0$, $y=g_{\mathrm{bar}}/g_0$, and
$$
f_{\mathrm{res}}(y):=\frac{g_{\mathrm{bar}}(y)}{g_{\mathrm{obs}}(y)}
=1-e^{-\sqrt y}+R(y),
\qquad R(y)\in I_R(y),
\tag{I.5c.1}
$$
with $0<f_{\mathrm{res}}\le1$. On the PU acceleration-lock branch $g_0=g_\Lambda=c^2\sqrt\Lambda/8$; otherwise $g_0$ is preregistered phenomenological data. No Bures derivation of the exponential kernel is claimed.

**Proposition I.5d (RAR Limits).** One has $g_{\mathrm{obs}}=g_{\mathrm{bar}}/f_{\mathrm{res}}$. When $R=0$,
$$
g_{\mathrm{obs}}\sim\sqrt{g_{\mathrm{bar}}g_0}\quad(y\downarrow0),
\qquad
\frac{g_{\mathrm{obs}}}{g_{\mathrm{bar}}}\to1\quad(y\to\infty).
\tag{I.5d.1}
$$
Nonzero residuals give only the propagated interval.

**Theorem I.6 (Well-posed generalized Poisson law).** Let $\Omega\subset\mathbb R^3$ be bounded and Lipschitz, let $1<p<\infty$, and define
$$
F(\xi):=\frac12\Psi(|\xi|^2),
\qquad
a(\xi):=\nabla_\xi F(\xi)=\Psi'(|\xi|^2)\xi.
$$
Assume that $F\in C^1(\mathbb R^3)$ is strictly convex and that constants $c_1,c_2,c_3>0$ and $c_0\ge0$ satisfy
$$
c_1|\xi|^p-c_0\le F(\xi)\le c_2(1+|\xi|^p),
\qquad
|a(\xi)|\le c_3(1+|\xi|^{p-1}).
$$
Let $\rho\in W^{-1,p'}(\Omega)$, where $p'=p/(p-1)$, and let the Dirichlet datum have a lifting $g\in W^{1,p}(\Omega)$. Then
$$
\mathcal E[\Phi]
=
\frac{1}{4\pi G}\int_\Omega F(\nabla\Phi)\,d^3x
+
\langle\rho,\Phi\rangle
$$
has a unique minimizer in $g+W_0^{1,p}(\Omega)$. This minimizer is the unique weak solution of
$$
\nabla\cdot\bigl(\mu(|\nabla\Phi|)\nabla\Phi\bigr)=4\pi G\rho,
\qquad
\mu(s):=\Psi'(s^2).
$$
For $p=2$ and $g=0$, the solution lies in $H_0^1(\Omega)$.

*Proof.* Write $\Phi=g+u$ with $u\in W_0^{1,p}(\Omega)$. The lower growth bound, Hölder's inequality, the dual estimate, and Poincaré's inequality give
$$
\mathcal E[g+u]
\ge
\frac{c_1}{4\pi G}\|\nabla(g+u)\|_p^p
-\frac{c_0|\Omega|}{4\pi G}
-\|\rho\|_{W^{-1,p'}}\|g+u\|_{W^{1,p}}.
$$
The inequality $|u|^p\le 2^{p-1}(|u+g|^p+|g|^p)$ and Poincaré's inequality show that the positive $p$-power term dominates the linear dual term as $\|u\|_{W^{1,p}}\to\infty$. Thus every minimizing sequence is bounded in the reflexive space $W_0^{1,p}(\Omega)$.

Choose a weakly convergent subsequence $u_n\rightharpoonup u$. The integral of the convex continuous function $F$ is weakly lower semicontinuous, and $\langle\rho,g+u_n\rangle\to\langle\rho,g+u\rangle$ by weak continuity of a bounded linear functional. Hence $g+u$ minimizes $\mathcal E$. Strict convexity of $F$, together with equality of the Dirichlet traces, makes the minimizer unique.

For $\eta\in W_0^{1,p}(\Omega)$, the derivative-growth bound and Hölder's inequality justify differentiation under the integral at the minimizer:
$$
0
=
\frac{d}{dt}\mathcal E[\Phi+t\eta]\Big|_{t=0}
=
\frac{1}{4\pi G}\int_\Omega a(\nabla\Phi)\cdot\nabla\eta,d^3x
+
\langle\rho,\eta\rangle.
$$
Therefore
$$
\int_\Omega
\mu(|\nabla\Phi|)\nabla\Phi\cdot\nabla\eta,d^3x
=-4\pi G\langle\rho,\eta\rangle,
$$
which is the weak form of the displayed equation. Conversely, strict monotonicity of $a=\nabla F$ implies that two weak solutions $\Phi_1,\Phi_2$ with the same trace satisfy
$$
0
=
\int_\Omega
\bigl(a(\nabla\Phi_1)-a(\nabla\Phi_2)\bigr)
\cdot\nabla(\Phi_1-\Phi_2),d^3x.
$$
The nonnegative integrand vanishes only when $\nabla\Phi_1=\nabla\Phi_2$ almost everywhere. Their equal traces then give $\Phi_1=\Phi_2$. ∎

**Theorem I.7 (Flat-curve asymptotics).** Let $\Phi$ be a spherically symmetric weak solution for a point source of mass $M>0$ whose outward flux is normalized by
$$
r^2\mu(g(r))g(r)=GM,
\qquad g(r):=|\nabla\Phi(r)|,
$$
and assume the decaying branch condition $g(r)\to0$ as $r\to\infty$. If
$$
\mu(s)\sim\frac{s}{a_0}
\qquad(s\downarrow0)
$$
for $a_0>0$, then
$$
g(r)\sim \frac{\sqrt{GMa_0}}{r},
\qquad
v_{\rm circ}^4(r)\sim GMa_0
\qquad(r\to\infty).
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

**Corollary I.7a (Capacity-Elastic Dark-Response Law).** On the capacity-elastic branch of Definition I.5a, the high-acceleration limit gives the ordinary Poisson law
$$
\nabla^2\Phi=4\pi G\rho_b
\qquad
(|\nabla\Phi|\gg g_\Lambda),
\tag{I.7a.1}
$$
while the low-acceleration limit gives
$$
g^2\sim g_\Lambda g_N,
\qquad
g_N=\frac{GM}{r^2},
\tag{I.7a.2}
$$
for an isolated point source. Hence
$$
v_{\mathrm{circ}}^4\sim GMg_\Lambda.
\tag{I.7a.3}
$$
The dark response is therefore the elastic constitutive law of unsaturated channel capacity, with the transition scale fixed by $g_\Lambda=c^2\sqrt{\Lambda}/8$ on the Appendix H/I bridge branch.

*Proof.* If $|\nabla\Phi|\gg g_\Lambda$, then $x=|\nabla\Phi|/g_\Lambda\to\infty$ and (I.5a.5) makes (I.5b.1) reduce to the ordinary Poisson equation, proving (I.7a.1). If $|\nabla\Phi|\ll g_\Lambda$, then (I.5a.6) gives
$$
\mu\left(\frac{g}{g_\Lambda}\right)\sim \frac{g}{g_\Lambda}.
$$
The spherical reduction used in Theorem I.7 gives
$$
r^2\mu\left(\frac{g}{g_\Lambda}\right)g=GM,
$$
so
$$
r^2\frac{g^2}{g_\Lambda}\sim GM,
\qquad
g^2\sim\frac{GMg_\Lambda}{r^2}=g_\Lambda g_N.
$$
Multiplying $g$ by $r$ gives $v_{\mathrm{circ}}^2=rg\sim\sqrt{GMg_\Lambda}$ and hence (I.7a.3). ∎

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

**Proposition I.12a.3 (Nuisance-Matched Likelihood Separation).** Under Gaussian observational errors with one shared covariance $C$ and one shared nuisance domain $\mathcal N$, $\mathcal D_{PU/NFW}$ is exactly twice the maximized log-likelihood ratio in favor of PU over NFW. It is a profile-likelihood statistic and contains no prior factor. The shared domain prevents unequal nuisance-domain freedom, although the common nuisance variables may interact differently with the two model maps.

*Proof.* For either model family $M$,
$$
\log L_M(\theta_M,\nu)
=-\frac12\chi_M^2(\theta_M,\nu)+K_C,
$$
where
$$
K_C=-\frac12\log\det(2\pi C)
$$
is identical for the two families because both use the same data vector and covariance. Therefore
$$
2\left(\max_{\theta_{PU},\nu\in\mathcal N}\log L_{PU}
-\max_{\theta_{NFW},\nu\in\mathcal N}\log L_{NFW}\right)
=\min_{\theta_{NFW},\nu\in\mathcal N}\chi^2_{NFW}
-\min_{\theta_{PU},\nu\in\mathcal N}\chi^2_{PU}
=\mathcal D_{PU/NFW}.
$$
No prior appears in this identity. A prior-weighted MAP or marginal-likelihood discriminator would require adding the log-prior or integrating it explicitly. ∎

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

**Theorem I.12b.2 (Multifractal Response Branch Criterion).** On a covariant multifractal response branch satisfying
$$
f_{\mathrm{PU}}(\alpha)\le D_{\mathrm{eff}}
$$
throughout the retained spectrum, the rate function $I_{\mathrm{PCE}}$ is nonnegative. The scale-dependent response kernels are determined by the complete package $(\tau_{\mathrm{PU}},I_{\mathrm{PCE}},\Psi,\chi,\alpha_\chi)$ and its projection maps. Suppose the branch also supplies a quasistatic projection norm and ansatz tensor
$$
T_{\mu\nu}^{\mathrm{ans}}(L_0,A_G,m,q)
$$
so that
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
has a unique minimizer in the parameter family
$$
(L_0,A_G,m,q).
\tag{I.12b.6}
$$
Then those parameters are selected before observational comparison. The multifractal branch is preferred over the simpler Appendix I relaxation kernel only if either:

1. it has strictly lower preregistered PCE description cost at the same prediction class; or

2. it uniquely selects parameters that the simpler kernel leaves branch-supplied.

Moreover,
$$
\nabla^\mu T_{\mu\nu}^{\mathrm{mf}}=0
\tag{I.12b.7}
$$
on shell, and the response remains CMB-safe whenever the package support condition suppresses $\Gamma_{\mathrm{mf}}$ on the early homogeneous branch.

*Proof.* The partition sums determine $\tau_{\mathrm{PU}}(q)$ on the registered operational scaling window. The sign convention $Z_q(\ell)\sim\ell^{\tau(q)}$ gives the Legendre-Fenchel envelope
$$
f_{\mathrm{PU}}(\alpha)=\inf_q\bigl(q\alpha-\tau_{\mathrm{PU}}(q)\bigr).
$$
The assumed inequality $f_{\mathrm{PU}}\le D_{\mathrm{eff}}$ gives
$$
I_{\mathrm{PCE}}(\alpha)=D_{\mathrm{eff}}-f_{\mathrm{PU}}(\alpha)\ge0.
$$
The spectrum determines this rate input, but the stress tensor also depends on $\Psi$, $\chi$, and $\alpha_\chi$ through (I.12b.3). Once all entries of the package are specified, functional variation determines $T_{\mu\nu}^{\mathrm{mf}}$, and the supplied projection determines the response kernels. The unique minimizer of (I.12b.5) gives pre-comparison selection of $(L_0,A_G,m,q)$.

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

**Definition I.13a (Backbone-Channel-Recruitment Benchmark Branch).** The backbone-channel-recruitment benchmark branch is the subbranch of the galaxy-scale relaxation kernel (I.4) on which the discrete backbone is used to choose the preregistered test pair
$$
A_G=d_0-1=7,
\qquad
m=K_0=3.
\tag{I.13a.1}
$$
The choice $A_G=d_0-1$ and $m=K_0$ is a backbone-motivated guess inside the Section I.13 phenomenological range, not a derivation of the pair from the existing Appendix I equations. The pair is preregistered as a falsifiable benchmark only; it carries test-lock status (the pair cannot be re-chosen after a rotation-curve comparison) but not the kernel-forward-lock status of derived backbone constants. The structural obstruction to a theorem-level derivation of $(A_G,m)$ is recorded in Remark I.13c. The scale $L_0$ remains a phenomenological galaxy-scale parameter, and the cluster parameters $(K,q,A_{\mathrm{PM}})$ remain outside this benchmark.

**Proposition I.13b (Benchmark Kernel Form).** On the benchmark branch of Definition I.13a, Equation I.4 becomes
$$
G(R)=G_0\left[1+7\left(1-e^{-(R/L_0)^3}\right)\right].
\tag{I.13b.1}
$$
The branch is falsified if a forward-locked rotation-curve analysis requiring a single universal $(A_G,m)$ excludes $(7,3)$ within its stated model and uncertainty ledger.

*Proof.* Substitute $A_G=d_0-1=7$ and $m=K_0=3$ from (I.13a.1) into Equation I.4. The final sentence is the direct falsification condition for a benchmark subbranch with a fixed parameter pair. ∎

**Remark I.13c (No Capacity-Floor Derivation of $A_G$).** Equation E.9 has $G\propto\eta\delta^2/(\chi C_{\max})$ only after the remaining substrate parameters are fixed. It does not, by itself, imply $G_{\mathrm{large}}/G_0=d_0$. In particular, setting an effective $C_{\max}$ below the structural floor $\varepsilon_0=\ln2$ is not an admissible theorem-level derivation. The pair $(A_G,m)=(7,3)$ is therefore retained as a benchmark branch rather than a closed dark-sector theorem.

**Definition I.13d (Covariant Dark-Susceptibility and Effective-Action Certificate).** A covariant dark-susceptibility certificate is a finite record
$$
\mathfrak X_{\mathrm{DS}}
=
\left(
\mathfrak H_g,
\Gamma_{\mathrm{DS}},
\mathcal K_{\mathrm{DS}},
T_{\mu\nu}^{\mathrm{DS}},
\Theta_{\mathrm{DS}},
\Pi_{\mathrm{wf}},
\Pi_{\mathrm{lens}},
\Pi_{\mathrm{cl}},
\Pi_{\mathrm{loc}},
\Pi_{\mathrm{CMB}},
\Pi_{\mathrm{hom}},
\mathfrak B_D,
\mathcal J_{\mathrm{DS}},
\mathcal R_{\mathrm{DS}},
\chi_{\mathrm{DS}}
\right)
\tag{I.13d.1}
$$
with the following entries fixed before comparison.

1. $\mathfrak H_g$ is the accepted Appendix H acceleration bridge record fixing $g_\Lambda=c^2\sqrt\Lambda/8$ on the same vacuum branch used by the metric sector.

2. $\Gamma_{\mathrm{DS}}[g,T_b;\Theta_{\mathrm{DS}}]$ is either a generally covariant finite effective action or a causal nonlocal susceptibility functional with a finite Ward identity. In the action case,
$$
T_{\mu\nu}^{\mathrm{DS}}
=-\frac{2}{\sqrt{-g}}\frac{\delta\Gamma_{\mathrm{DS}}}{\delta g^{\mu\nu}}.
\tag{I.13d.2}
$$
In the susceptibility case, $\mathcal K_{\mathrm{DS}}$ must supply the retarded kernel and the finite conservation proof replacing (I.13d.2).

3. $T_{\mu\nu}^{\mathrm{DS}}$ is the conserved response tensor, including anisotropic stress. The accepted record must prove
$$
\nabla_\mu\left(T_b^{\mu\nu}+T_{\mathrm{DS}}^{\mu\nu}\right)=0.
\tag{I.13d.3}
$$

4. $\Theta_{\mathrm{DS}}=(L_0,A_G,m,K,q,A_{\mathrm{PM}},\Theta_{\mathrm{hom}})$ is the finite ansatz coordinate vector. $\Theta_{\mathrm{hom}}$ is either strict $\Lambda$ behavior, a finite-parameter law for $w(z)$, a density-dependent relaxation law, or a homogeneous-sparsity law.

5. $\Pi_{\mathrm{wf}}$ proves that the quasistatic galaxy projection of $T_{\mu\nu}^{\mathrm{DS}}$ is equivalent to Equation I.4 with the displayed $(L_0,A_G,m)$.

6. $\Pi_{\mathrm{lens}}$ proves the lensing projection, including the relation between potential response, anisotropic stress, and light deflection.

7. $\Pi_{\mathrm{cl}}$ proves the cluster and merger projections, including Equation I.7 or its accepted replacement with the displayed $(K,q,A_{\mathrm{PM}})$ and the stated merger/offset limits.

8. $\Pi_{\mathrm{loc}}$ proves the local-gravity limit and supplies the solar-system residual interval.

9. $\Pi_{\mathrm{CMB}}$ proves the CMB-era safety condition for the same kernel.

10. $\Pi_{\mathrm{hom}}$ proves the homogeneous late-time law, including conserved stress-energy, the density evolution equation, and the residual interval for $w(z)$ or strict $w=-1$ behavior.

11. $\mathfrak B_D$ is the RCD-Buchert-Cheeger and elliptic scale-bridge ledger. It contains the domain datum of Definition I.3e, the first Neumann spectral gap, predictive-stress variance, source-energy rate density, and finite defect budgets.

12. $\mathcal J_{\mathrm{DS}}$ is the finite PCE susceptibility functional on the retained ansatz family, with a unique minimizer $\Theta_{\mathrm{DS}}^*$ and strict gap $g_{\mathrm{DS}}>0$ modulo response equivalence.

13. $\mathcal R_{\mathrm{DS}}$ is a finite residual interval for weak-field, lensing, cluster, merger, local-gravity, CMB-era, homogeneous, and backreaction projections.

14. $\chi_{\mathrm{DS}}$ records that no entry of $\Theta_{\mathrm{DS}}^*$, $\Gamma_{\mathrm{DS}}$, $\mathcal K_{\mathrm{DS}}$, projection maps, or $\mathcal R_{\mathrm{DS}}$ was selected using the validation data being predicted.

The certificate is accepted only when (I.13d.3) holds, the local high-acceleration projection satisfies $G(R)\to G_0$ with the solar-system residual bounded by $\mathcal R_{\mathrm{DS}}$, the CMB projection is inside its certified residual interval, and the homogeneous projection is either strict $\Lambda$ or the recorded finite-parameter conserved law.

**Theorem I.13e (Dark-Kernel Determinacy from Covariant Susceptibility).** If $\mathfrak X_{\mathrm{DS}}$ is accepted, then the galaxy response kernel, cluster/lensing response, conserved stress-energy tensor, anisotropic-stress projection, merger and cluster limits, local-gravity limit, CMB-era behavior, homogeneous late-time law, RCD-Buchert-Cheeger backreaction bound, elliptic scale bridge, predictive-stress variance, source-energy rate density, and finite defect budgets are deterministic outputs of the accepted susceptibility/effective-action branch, up to $\mathcal R_{\mathrm{DS}}$.

If $\mathfrak X_{\mathrm{DS}}$ is absent, the acceleration-scale identity $g_\Lambda=c^2\sqrt\Lambda/8$ remains available only on an independently accepted Definition H.0 bridge-law branch; it is not thereby identified with a realized observable. The remaining galaxy, cluster, lensing, homogeneous, and backreaction data remain phenomenological or branch-classification data.

*Proof.* Items 2 and 3 supply a generally covariant action or retarded susceptibility with a conserved stress tensor. Items 5--10 are the finite projection maps to galaxy dynamics, lensing, clusters, local tests, CMB-era behavior, and homogeneous late-time evolution. Item 11 supplies the RCD-Buchert-Cheeger and elliptic scale bridge, while item 12 gives a finite admissible ansatz family with a strict PCE gap modulo response equivalence. Theorem D.8.9b fixes $\Theta_{\mathrm{DS}}^*$ uniquely in the retained quotient, and the projection maps then produce the stated kernels and stress-energy components with residuals $\mathcal R_{\mathrm{DS}}$. Without the certificate, at least one of the covariant source, kernel, projection maps, minimizer, conservation proof, or residual ledger is not fixed; Theorem P.14.1f therefore blocks theorem-level promotion beyond the acceleration bridge. ∎

**Theorem I.13f (Harmonic Recoverability Realization of the Dark-Susceptibility Kernel).** Let $\mathcal D_B$ be a finite causal-diamond complex on a regular emergent metric branch, and choose a reference orientation set $E_+$ containing exactly one orientation of each retained unoriented inclusion edge. For $e:D_-\to D_+$ in $E_+$, let
$$
\Phi_{e,*}:\mathcal A(D_+)_{*}\to\mathcal A(B_e)_{*}
$$
be a linear Schrödinger-picture completely positive trace-preserving map on the finite-dimensional predual spaces, restricting to a channel between their convex state spaces. Equivalently, its Heisenberg adjoint $\Phi_e:\mathcal A(B_e)\to\mathcal A(D_+)$ is unital and completely positive. Let $\rho_{D_+}$ and $\omega_{D_+}$ be the retained state and a faithful local PCE/KMS reference state. Define
$$
J_{\mathrm{rec}}(e)
:=
D(\rho_{D_+}\Vert\omega_{D_+})
-
D(\Phi_{e,*}\rho_{D_+}\Vert\Phi_{e,*}\omega_{D_+})
\ge0
\qquad(e\in E_+),
\tag{I.13f.1}
$$
project the result to the retained response quotient, and define the reverse orientation by
$$
J_{\mathrm{rec}}(\bar e):=-J_{\mathrm{rec}}(e).
$$
Then $J_{\mathrm{rec}}\in C^1(\mathcal D_B)$ is an antisymmetric retained edge current. No global vertex potential is assumed.

Equip the finite cochain complex of $\mathcal D_B$ with the BKM/QFI inner products of the accepted local states and write the predictive Hodge decomposition of Theorem X.8l.2 as
$$
J_{\mathrm{rec}}
=d_0\phi+\delta_1\psi+h,
\qquad
h\in\ker\Delta_1.
\tag{I.13f.2}
$$
Assume that the accepted dark-susceptibility certificate $\mathfrak X_{\mathrm{DS}}$ supplies all of the following harmonic realization data:

1. the stationary conditions
$$
d_1J_{\mathrm{rec}}=0,
\qquad
\delta_0J_{\mathrm{rec}}=0;
\tag{I.13f.6}
$$

2. invertibility of the compressed Schur operator
$$
\Lambda_h
:=
\left.\Pi_{\mathrm{harm}}\Lambda_\partial\Pi_{\mathrm{harm}}
\right|_{\ker\Delta_1},
\qquad
\mathcal K_{\mathrm{DS}}
=
\Pi_{\mathrm{harm}}\Lambda_h^{-1}\Pi_{\mathrm{harm}};
$$

3. a finite null-tomography record for the linear map
$$
\mathcal L_x:
\operatorname{Sym}^2(T_x^*M)\big/\operatorname{span}\{g\}
\longrightarrow\mathbb R^9,
\qquad
\mathcal L_x([S])_i=S_{\mu\nu}k_i^\mu k_i^\nu,
\tag{I.13f.3a}
$$
where $k_1,\ldots,k_9$ are null and $\operatorname{rank}\mathcal L_x=9$. The map is well defined because $g_{\mu\nu}k_i^\mu k_i^\nu=0$. Pointwise in an orthonormal Lorentz frame, one exact witness is
$$
\begin{aligned}
k_1&=(1,1,0,0),&k_2&=(1,-1,0,0),\\
k_3&=(1,0,1,0),&k_4&=(1,0,-1,0),\\
k_5&=(1,0,0,1),&k_6&=(1,0,0,-1),\\
k_7&=(1,\tfrac35,\tfrac45,0),&
k_8&=(1,\tfrac35,0,\tfrac45),&
k_9&=(1,0,\tfrac35,\tfrac45).
\end{aligned}
\tag{I.13f.3b}
$$
In the quotient gauge $S_{00}=0$ and ordered coordinates
$$
(S_{01},S_{02},S_{03},S_{11},S_{22},S_{33},S_{12},S_{13},S_{23}),
$$
the exact determinant of the resulting $9\times9$ evaluation matrix is
$$
\det\mathcal L_x=-\frac{884736}{15625}\ne0.
\tag{I.13f.3c}
$$
The record also contains the nine responses
$$
8\pi G\,T^{\mathrm{DS}}_{\mu\nu}k_i^\mu k_i^\nu
=
\mathcal Q_h(k_i),
\qquad i=1,\ldots,9;
\tag{I.13f.3}
$$

4. a tenth scalar datum $\tau_{\mathrm{DS}}=g^{\mu\nu}T^{\mathrm{DS}}_{\mu\nu}$ compatible with the conservation law (I.13d.3) and the cosmological boundary ledger.

Then Theorem 12.1g and the trace datum determine a unique symmetric tensor $T^{\mathrm{DS}}_{\mu\nu}$. The metric equation on this branch is
$$
G_{\mu\nu}+\Lambda g_{\mu\nu}
=
8\pi G\bigl(T^{\mathrm{MPU}}_{\mu\nu}+T^{\mathrm{DS}}_{\mu\nu}\bigr),
\tag{I.13f.4}
$$
with $8\pi G$ replaced by $8\pi G/c^4$ in SI units. If $h=0$ and the ordinary-branch trace datum is $\tau_{\mathrm{DS}}=0$, then $T^{\mathrm{DS}}_{\mu\nu}=0$. The weak-field acceleration scale remains
$$
g_\Lambda=\frac{c^2\sqrt\Lambda}{8}.
\tag{I.13f.5}
$$

*Proof.* Data processing for the CPTP maps in (I.13f.1) gives the nonnegative reference-orientation slacks. Finiteness of $\mathcal D_B$ and positive definiteness of the supplied BKM/QFI quotient inner products give the orthogonal Hodge decomposition (I.13f.2) by Theorem X.8l.2.

The stationary conditions imply
$$
\langle\Delta_1J_{\mathrm{rec}},J_{\mathrm{rec}}\rangle
=
\|d_1J_{\mathrm{rec}}\|^2
+
\|\delta_0J_{\mathrm{rec}}\|^2
=0.
$$
Hence $J_{\mathrm{rec}}\in\ker\Delta_1$. Uniqueness of the orthogonal decomposition then gives $d_0\phi=0$, $\delta_1\psi=0$, and $J_{\mathrm{rec}}=h$. An exact current arising from one global vertex potential has zero harmonic projection, so it cannot yield a nonzero $h$.

Invertibility of $\Lambda_h$ makes $\mathcal K_{\mathrm{DS}}$ a well-defined finite operator on the harmonic subspace. Nullity of the nine vectors in (I.13f.3b) makes $\mathcal L_x$ well defined on the covariant quotient by $\operatorname{span}\{g\}$. Equation (I.13f.3c) proves that this map has rank $9$, equal to the quotient dimension, so the nine values in (I.13f.3) determine the trace-free covariant tensor class uniquely. The trace datum fixes the remaining multiple of $g_{\mu\nu}$, and (I.13d.3) verifies conservation compatibility. This proves uniqueness and the source equation (I.13f.4). If $h=0$, then every recorded $\mathcal Q_h(k_i)$ vanishes; together with $\tau_{\mathrm{DS}}=0$, injectivity gives $T^{\mathrm{DS}}_{\mu\nu}=0$. Equation (I.13f.5) is Corollary I.3a. ∎

**Corollary I.13g (Chern-Simons Inflow as a Dark-Susceptibility Subcertificate).** Let
$$
\mathfrak C_{\mathrm{CS}}
=
(\partial M,A,k,J_\partial,\mathcal G_{\mathrm{ret}},\chi_{\mathrm{CS}})
$$
be preregistered before cluster or lensing comparison. Suppose its variation supplies a conserved retained boundary current $J_\partial$, its anomaly variation cancels a retained boundary/interface anomaly without converting a gauge redundancy into a physical anomaly, and its retarded boundary-to-bulk map $\mathcal G_{\mathrm{ret}}$ supplies the susceptibility-kernel entry $\mathcal K_{\mathrm{DS}}$ of Definition I.13d. Then $\mathfrak C_{\mathrm{CS}}$ is an admissible subcertificate for those entries only. Theorem I.13e applies if and only if the same branch also supplies every remaining entry and every acceptance condition in Definition I.13d, including bulk conservation (I.13d.3), the local, CMB, homogeneous, and backreaction projections, the residual ledger, the strict PCE minimizer, and the validation lock. A Chern-Simons term alone determines neither the cluster kernel $K$ nor the exponent $q$ in Equation I.7.

*Proof.* The stated variation and anomaly hypotheses provide a boundary current and a retarded boundary-to-bulk map. They do not provide the remaining entries enumerated in Definition I.13d. If those entries and acceptance conditions are independently supplied, their union with $\mathfrak C_{\mathrm{CS}}$ is an accepted $\mathfrak X_{\mathrm{DS}}$, so Theorem I.13e applies. If any required entry is absent, the antecedent of Theorem I.13e is false and the theorem cannot be invoked. ∎

**I.14 Timescale Separation (Quasistatic Local-Relaxation Branch)**

On the quasistatic local-relaxation branch, the adaptation dynamics of local MPU parameters ($\delta, C_{\max}$) governing $G(R)$ are assumed to reach local PCE equilibrium on timescales (Myr–Gyr in this branch) short compared with potential cosmological drift of the environment or fundamental parameters that might cause $(L_0, A_G, m)$ to evolve (Gyr–Hubble time). Under this branch assumption, $G(R)$ may be treated as quasi-static when analyzing galaxy dynamics, while allowing for a slow cosmic evolution of the universal parameters themselves. A first-principles derivation of the Myr–Gyr local equilibration scale from the Appendix D adaptation dynamics ($\eta_{\mathrm{adapt}}$ and the local-PL neighborhood structure of Theorem D.8) remains a separate closure lemma; the galaxy-scale phenomenology of Sections I.6-I.13 inherits this quasistatic branch label.

**I.15 Conclusion**

The appendix defines a multi-scale dark-sector research program. Its strongest test is whether one independently fixed response can account for all listed scales at once.

**Technical ledger.**

The appendix defines a multi-scale dark-response candidate program and separates its proved identities from its model coordinates.

1. **Acceleration-scale branch.** Once the independent Appendix H normalization and the same vacuum branch are accepted, the scale is
   $$
   g_\Lambda=\frac{c^2\sqrt{\Lambda}}8.
   $$
   This identity does not determine a galaxy, lensing, cluster, merger, CMB, or homogeneous response kernel.
2. **Galaxy and cluster models.** Equation I.4 and the nonlocal predictive-matter kernels are phenomenological candidate laws until one accepted $\mathfrak X_{\mathrm{DS}}$ supplies their common covariant action or retarded susceptibility, projections, conservation law, parameter selector, and residual intervals. Stacked-profile agreement does not select the kernel, and CMB safety requires the perturbative projection $\Pi_{\mathrm{CMB}}$ for that same accepted record.
3. **Conditional closure and falsification.** Given an accepted $\mathfrak X_{\mathrm{DS}}$, Theorem I.13e makes all registered projections deterministic outputs of one branch. A failure of common conservation, lensing, local-gravity, CMB, homogeneous, or residual tests falsifies that branch. On the harmonic realization of Theorem I.13f, the source is the harmonic part of the finite recoverability current and vanishes on the certified harmonic-zero, trace-zero branch.

The discriminating test is therefore not numerical reuse of $g_\Lambda$, but simultaneous forward prediction of galaxy dynamics, baryonic thresholds, lensing, clusters, local gravity, CMB-era perturbations, and homogeneous evolution from one preregistered covariant response record.