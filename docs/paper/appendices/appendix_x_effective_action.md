# Appendix X: PU and the Effective Action

## X.0 Overview and Scope

This appendix connects PU's account of prediction and coarse-graining to the standard effective-action description of quantum and statistical systems. It follows that connection through matter, gauge fields, gravity, and open-system dynamics.

### Technical scope and conventions

This appendix states conditional bridges from the Predictive Universe framework to quantum and statistical effective-action formalisms. It relates predictive free energy and natural-gradient flow to Wilsonian coarse-graining, the 1PI effective action $\Gamma$, and functional RG on their registered branches, including gauge and gravitational sectors. Its Schwinger--Keldysh construction applies only when retained macroscopic variables form an open reduced subsystem. Throughout we use natural units $c=\hbar=k_B=1$, spacetime signature $(-,+,+,+)$, and Heaviside--Lorentz electromagnetic conventions.


## X.1 From Predictive Statistics to Generating Functionals

Let $\Theta\ni\theta\mapsto p_\theta$ be the coarse‑grained predictive model on field histories $\varphi$ (including matter/MPU fields and, when appropriate, background geometry). For a set of sufficient statistics $\mathcal O_a[\varphi]$ with sources $J^a(x)$, define the cumulant generating functional

$$
W[J]\;:=\;\ln Z[J] = \ln\!\int\!\mathcal{D}\varphi\;p_\theta[\varphi]\;
\exp\!\Big(\!\int\! d^dx\, J^a(x)\,\mathcal O_a[\varphi](x)\Big).
\tag{X.1}
$$

The classical fields (the expectation values of the operators in the presence of the source $J$) are $\Phi_a(x):=\delta W/\delta J^a(x)=\langle \mathcal O_a(x)\rangle_J$. The **1PI effective action** is the Legendre transform

$$
\Gamma[\Phi]\;:=\;\sup_{J}\Big\{\!\int\! d^dx\,J^a\Phi_a\;-\;W[J]\Big\},
\qquad \frac{\delta \Gamma}{\delta \Phi_a(x)}=J^a(x).
\tag{X.2}
$$

For rigorous convexity and domain control, $W$ and $\Gamma$ are defined in Euclidean signature; Minkowski‑space results follow by analytic continuation where appropriate. In Euclidean conventions, when the probability distribution admits a Boltzmann form, $p_\theta[\varphi] = e^{-S_E[\varphi]} / Z_0$, where $Z_0:=\int\mathcal{D}\varphi\,e^{-S_E[\varphi]}$ is the partition function. The **dimensionless** Euclidean action is

$$
S_E[\varphi]\;:=\;-\ln p_\theta[\varphi]\;-\;\ln Z_0,
$$

defined up to an additive constant. This ensures that $W,\Gamma$ agree with the standard definitions in statistical field theory up to $J$‑independent additive constants, adapted to the PU coarse‑graining context. At vanishing sources $J=0$, configurations satisfying $\delta\Gamma/\delta\Phi=0$ are stationary expectation-field configurations of this generating functional at the chosen resolution. Identifying them with PCE-selected PU macrostates requires the effective-action/PCE bridge hypotheses used later in this appendix.

**Proposition X.1 (Legendre-Dual Response Kernel on the Regular Sector).**
Let $\mathcal G_{ab}(x,y)=\delta^2 W/\delta J^a(x)\delta J^b(y)$ be the connected two‑point kernel, and restrict to a regular sector on which the source-to-field map
$$
\Phi_a(x)=\frac{\delta W}{\delta J^a(x)}
$$
is Fréchet differentiable and locally invertible. Then
$$
\Gamma^{(2)}_{ab}(x,y):=\frac{\delta^2\Gamma}{\delta\Phi_a(x)\delta\Phi_b(y)}
\quad\text{satisfies}\quad
\int\! d^dz\, \mathcal G_{ac}(x,z)\,\Gamma^{(2)}_{cb}(z,y)=\delta_{ab}\delta^{(d)}(x-y).
\tag{X.3}
$$

For a regular exponential family in its natural source coordinates $J$, the source-coordinate Fisher kernel equals the connected covariance $\mathcal G$. If the statistical parameter is $\theta$ and the sources are $J(\theta)$, its Fisher metric is the pullback $F_\theta=(D_\theta J)^*\mathcal G(D_\theta J)$, with the corresponding integral-kernel interpretation for fields. The Hessian of $\Gamma$ is the inverse response kernel on the regular source/expectation sector. LAN supplies an additional asymptotic statistical interpretation and does not identify different coordinate components without this pullback.

*Proof.* By definition of the Legendre transform,
$$
\frac{\delta \Gamma}{\delta \Phi_a(x)}=J^a(x).
$$
Differentiate this identity with respect to $\Phi_b(y)$:
$$
\frac{\delta^2 \Gamma}{\delta \Phi_a(x)\delta \Phi_b(y)}
=
\frac{\delta J^a(x)}{\delta \Phi_b(y)}.
$$
Likewise, differentiating $\Phi_a(x)=\delta W/\delta J^a(x)$ with respect to $J^b(y)$ gives
$$
\frac{\delta \Phi_a(x)}{\delta J^b(y)}
=
\frac{\delta^2 W}{\delta J^a(x)\delta J^b(y)}
=
\mathcal G_{ab}(x,y).
$$
On the regular sector the Jacobians $\delta\Phi/\delta J$ and $\delta J/\delta \Phi$ are inverse operators, so
$$
\int d^dz\,
\frac{\delta \Phi_a(x)}{\delta J^c(z)}
\frac{\delta J^c(z)}{\delta \Phi_b(y)}
=
\delta_{ab}\delta^{(d)}(x-y).
$$
Substituting the two derivative identities yields
$$
\int d^dz\,\mathcal G_{ac}(x,z)\,\Gamma^{(2)}_{cb}(z,y)
=
\delta_{ab}\delta^{(d)}(x-y),
$$
which is (X.3). In natural source coordinates, differentiating the normalized exponential-family log density gives the centered sufficient statistic, so the Fisher kernel is its covariance $\mathcal G$. Under $J=J(\theta)$, the score chain rule gives $F_\theta=(D_\theta J)^*\mathcal G(D_\theta J)$. The stated LAN assumptions govern the additional asymptotic statistical interpretation. ∎


## X.2 Wilsonian Coarse‑Graining and Functional RG

Introduce a momentum‑scale dependent infrared (IR) regulator $R_k$ which suppresses modes with momenta $q\lesssim k$. The scale‑dependent effective average action $\Gamma_k$ is defined via a modified Legendre transform incorporating this regulator. Its (Wetterich) functional RG flow equation is [Wetterich 1993]:

$$
\partial_k \Gamma_k[\Phi]\;=\;\frac{1}{2}\,\mathrm{STr}\!\Big[\big(\Gamma^{(2)}_k[\Phi]+R_k\big)^{-1}\,\partial_k R_k\Big],
\tag{X.4}
$$

with $\mathrm{STr}$ the supertrace, including the fermion/ghost signs. In the Abelian sector, write the leading flow in a scheme whose fermionic threshold is normalized by $\ell_1^{\mathrm F}(0)=1$:
$$
\partial_t\alpha^{-1}(k)
=
-\frac{2}{3\pi}\sum_fN_c^{(f)}Q_f^2\,
\ell_1^{\mathrm F}\!\left(\frac{m_f^2}{k^2}\right)
+O(\alpha),
\qquad t=\ln k.
$$
For an illustrative threshold model, take the mass dependence below as an additional gauge-flow ansatz. Litim (2001), Equation (3.11), obtains $(1+y)^{-1}$ for the normalized potential-flow threshold $\ell_{F,0}^{d}(y)/\ell_{F,0}^{d}(0)$; that result alone does not identify the gauge two-point projection used here, and its index-$1$ threshold has a different mass dependence. The branch must certify the gauge projection before using the ansatz as a derived running law:
$$
\ell_1^{\mathrm F}(y)=\frac{1}{1+y}.
$$
The regulator step function has momentum argument $\Theta(k^2-q^2)$ before loop integration; it is not a factor $\Theta(1-y)$ in the mass threshold. Hence
$$
\alpha^{-1}(k)
=
\alpha^{-1}(\mu^*)
-\frac{2}{3\pi}\sum_fN_c^{(f)}Q_f^2
\int_{\ln\mu^*}^{\ln k}
\ell_1^{\mathrm F}\!\left(\frac{m_f^2}{e^{2t}}\right)dt.
$$
On the unit Predictive-Ward branch of Appendix Z, Theorem Z.14 gives $\kappa^*_{\mathrm{bulk}}=1$ and hence the **boundary condition** $\alpha_{\mathrm{bulk}}(\mu^*)=u^*/(4\pi)$. A predictive **band** for $\alpha^{-1}(m_Z)$ additionally requires a certified gauge threshold function, the matching scale $\mu^*$, the charged spectrum and masses, the physical-current normalization, and a bounded truncation and uncertainty ledger.

**Corollary X.2 (RG Equilibria and Relevant Directions).** Let $t=\log k$, let $g_*$ satisfy $\beta(g_*)=0$, and define the stability matrix by $B^i{}_j=\partial_j\beta^i(g_*)$. An eigenvector of $B$ with eigenvalue $\lambda<0$ is infrared relevant, whereas one with $\lambda>0$ is infrared irrelevant.

*Proof.* Linearizing at $g_*$ gives $\partial_t\delta g=B\delta g+O(\lVert\delta g\rVert^2)$. Along an eigenvector and at linear order,
$$
\delta g(t)=e^{\lambda(t-t_0)}\delta g(t_0).
$$
The infrared limit $k\downarrow0$ is $t\to-\infty$. Thus $e^{\lambda(t-t_0)}$ grows for $\lambda<0$ and decays for $\lambda>0$. The marginal case $\lambda=0$ requires nonlinear terms and is not classified by this corollary. ∎



## X.3 Gauge Sector: Background‑Field Method and Normalization

Let $A_\mu=\bar A_\mu+a_\mu$ with background‑field gauge fixing preserving background invariance. The gauge part of the effective action reads

$$
\Gamma^{\text{gauge}}_k[\bar A]
=\int d^4x\,\Big[-\,\frac{Z_A(k)}{4}\,F_{\mu\nu}(\bar A)F^{\mu\nu}(\bar A)+\cdots\Big],
\tag{X.5}
$$

where dots include gauge‑invariant higher operators and the background‑invariant gauge‑fixing/ghost sector. Assume that the finite-resolution source space carries a continuous $U(1)$ action and that the predictive response functional is continuous and invariant under the SPAP/Landauer subgroup $G_L$. On this branch, Theorem Q.0.7d2 extends that invariance to the closure $U(1)$. The standard background-field Ward identity then ensures that the renormalization of the background gauge coupling depends only on the background-field wavefunction factor $Z_A(k)$. The physical coupling satisfies

$$
e^2(k)=\frac{u(k)}{\kappa(k)},\qquad
\alpha_{\mathrm{em}}(k)=\frac{e^2(k)}{4\pi}=\frac{u(k)}{4\pi\,\kappa(k)},
\tag{X.6}
$$

with $u=g_e^2$ the PU rate-level deformation and $\kappa(k)$ the field-strength normalization. In background-field normalization (X.5) one may take $\kappa(k)=Z_{\text{map}}\,Z_A^{-1}(k)$, where $Z_A(k)$ is the background-field wavefunction factor and $Z_{\text{map}}$ accounts for the PU→canonical field mapping. At the PCE-Attractor, $u^*=8^{1/24}-1$ on the Appendix Z capacity branch. On the separate unit Predictive-Ward branch, Theorem Z.14 gives $\kappa^*_{\mathrm{bulk}}=1$. On the bounded-$C^2$ interface-response branch of Theorem Z.17,
$$
\delta\kappa
=-c_{\mathrm{int}}\frac{a}{d_0}\frac{u^*}{\sqrt{K_0}}+O(u^{*2}),
\qquad c_{\mathrm{int}}>0.
$$
The unit-interface-response specialization sets $c_{\mathrm{int}}=1$.

## X.4 Gravitational Sector: $\Gamma[g]$, Wald Entropy, and Area Law

The geometric sector of the effective action takes the diffeomorphism‑invariant form

$$
\Gamma^{\text{grav}}_k[g]
=\int d^4x\sqrt{-g}\,\Big[\frac{1}{16\pi G(k)}\,\big(R-2\Lambda(k)\big)
+\sum_i c_i(k)\,\mathcal O_i[g]\Big],
\tag{X.7}
$$

with curvature invariants $\mathcal O_i$ such as $R^2$ and $R_{\mu\nu}R^{\mu\nu}$. The area coefficient alone does not eliminate these operators. On the metric-only, local, diffeomorphism-invariant branch of Theorem 12.1a, requiring at-most-second-order metric equations and matching the Wald entropy density on every retained local bifurcate horizon selects the Einstein-Hilbert bulk term in $D=4$, up to a total divergence and the topological Gauss-Bonnet density. On that branch the field equation is

$$
\frac{\delta \Gamma^{\text{grav}}}{\delta g_{\mu\nu}}
= -\,\frac{\sqrt{-g}}{16\pi G}\,\Big(R^{\mu\nu}-\tfrac12 R g^{\mu\nu}+\Lambda g^{\mu\nu}\Big)
= -\,\frac12 \sqrt{-g}\,T^{(MPU)\,\mu\nu}.
\tag{X.8}
$$

Appendix E supplies an operational channel entropy coefficient on its density-and-saturation branch and defines $G_{\mathrm{op}}$ by the Bekenstein-Hawking normalization; identifying $G_{\mathrm{op}}$ with measured $G$ is a separate calibration. Scale dependence is discussed in Appendix I and Section 12.5. In $D>4$, a Lovelock conclusion likewise requires the independent metric-only locality and second-order field-equation hypotheses; it does not follow from the Clausius relation alone.

**Definition X.4a (Constant Vacuum-Shift Response Quotient).** On a fixed-scale Einstein branch, decompose the matter expectation as
$$
T^{\mathrm{full}}_{\mu\nu}=T^{\mathrm{resp}}_{\mu\nu}-\rho_{\mathrm{vac}}g_{\mu\nu},
\qquad
\Lambda_{\mathrm{eff}}=\Lambda_{\mathrm{bare}}+8\pi G\rho_{\mathrm{vac}}.
\tag{X.4a.1}
$$
The constant-shift equivalence relation is
$$
(\Lambda_{\mathrm{bare}},\rho_{\mathrm{vac}})
\sim
(\Lambda_{\mathrm{bare}}-8\pi Gc,\rho_{\mathrm{vac}}+c),
\qquad c\in\mathbb R.
\tag{X.4a.2}
$$

**Theorem X.4b (Local Thermodynamic Invariance under Constant Vacuum Shifts).** On each retained finite modular algebra or trace-class regulator, suppose the constant shift $c$ changes the modular generator only by $\alpha(c)\mathbf1$ for a real dimensionless scalar $\alpha(c)$; this is the explicit identity-response hypothesis for treating that shift as locally response-null. Then the normalized modular state and every local null-horizon Clausius flux are invariant under the quotient (X.4a.2). Consequently the local equation-of-state derivation depends only on the $\Lambda_{\mathrm{eff}}$ equivalence class, not separate values of $\Lambda_{\mathrm{bare}}$ and $\rho_{\mathrm{vac}}$, and does not determine its remaining numerical representative.

*Proof.* Under the stated identity-response hypothesis, a constant modular shift obeys
$$
\frac{e^{-(K+\alpha(c)\mathbf1)}}{\operatorname{tr}e^{-(K+\alpha(c)\mathbf1)}}
=
\frac{e^{-K}}{\operatorname{tr}e^{-K}},
\tag{X.4b.1}
$$
so normalized state responses are unchanged. For every null generator $k^\mu$, the constant vacuum term has zero heat flux because $g_{\mu\nu}k^\mu k^\nu=0$. The field equation becomes
$$
G_{\mu\nu}+\Lambda_{\mathrm{eff}}g_{\mu\nu}
=8\pi G T^{\mathrm{resp}}_{\mu\nu},
\tag{X.4b.2}
$$
which is invariant under (X.4a.2). Therefore no local normalized modular or null-flux protocol separates the two representatives. ∎

**Corollary X.4c (Scope of Vacuum Decoupling).** Theorem X.4b identifies only spacetime-constant multiples of the identity under simultaneous shifts of $\Lambda_{\mathrm{bare}}$ and $\rho_{\mathrm{vac}}$ that preserve $\Lambda_{\mathrm{eff}}$. Curvature counterterms, state-dependent terms, spacetime-varying condensates, phase-transition latent heat, and boundary or topological data are outside that quotient unless a separate response-null certificate is supplied. A continuum type-III AQFT statement additionally requires the stated KMS/AQFT descent certificate. The theorem does not determine the global value of $\Lambda_{\mathrm{eff}}$.

*Proof.* The cancellation in (X.4b.2) uses $T_{\mu\nu}^{\mathrm{vac}}=-\rho_{\mathrm{vac}}g_{\mu\nu}$ with constant $\rho_{\mathrm{vac}}$, and the normalized generating-functional cancellation uses a source-independent scalar factor. Each listed nonconstant, state-dependent, curvature-dependent, or boundary-sensitive term violates at least one of those hypotheses and therefore is not identified by Theorem X.4b. That theorem is finite or trace-class, so it has no type-III conclusion without a descent theorem. Finally, (X.4a.2) is invariant under simultaneous shifts and hence cannot select one value of $\Lambda_{\mathrm{eff}}$. ∎

**Theorem X.4d (Regulator-Free Modular/KMS Invariance under Constant Vacuum Shifts).** Let $(\mathcal M,\tau)$ be a W*-dynamical system of any type, including a type-III local algebra, with $\tau_t=\operatorname{Ad}e^{itH}$ for a self-adjoint generator $H$ on the representation space. Let the constant shift $c$ of (X.4a.2) act by the identity-response rule
$$
H\longmapsto H_c=H+\alpha(c)\mathbf1,
\qquad
\alpha(c)\in\mathbb R,
\tag{X.4d.1}
$$
which holds, with $\alpha(c)=c\int f^{\mu\nu}g_{\mu\nu}$, for every generator $H=\int f^{\mu\nu}T_{\mu\nu}$ smeared with a test tensor $f^{\mu\nu}$ of finite $\int f^{\mu\nu}g_{\mu\nu}$ from a stress tensor whose constant-shift ambiguity is $T_{\mu\nu}\mapsto T_{\mu\nu}+c\,g_{\mu\nu}\mathbf1$. Then, for every $c$:

1. the shifted dynamics $\tau^{(c)}_t=\operatorname{Ad}e^{itH_c}$ equals $\tau_t$ for every $t$;
2. for every $\beta$, the normal $(\tau^{(c)},\beta)$-KMS states are exactly the normal $(\tau,\beta)$-KMS states;
3. every faithful normal state $\omega$ keeps its modular operator, modular conjugation and modular group, which depend only on $(\mathcal M,\omega)$; for a faithful normal $(\tau,\beta)$-KMS state with $\beta\ne0$, $\sigma^\omega_t=\tau_{-\beta t}$; and relative modular operators, Connes cocycles and Araki relative entropies among normal states are unchanged;
4. every map that assigns to a representative of (X.4a.2) a value computed from $\mathcal M$, the dynamics, its KMS states, their modular data or their relative entropies takes a single value on each constant-shift orbit.

Consequently the modular and KMS conclusions of Theorem X.4b hold without a finite regulator on every system of this class. This supplies the type-III modular/KMS statement named in Corollary X.4c on every continuum net satisfying (X.4d.1); the AQFT descent certificate retained there supplies that net, and (X.4d.1) is the identity-response hypothesis of Theorem X.4b stated for it. Selection of the representative of (X.4a.2) requires a law with inputs outside $(\mathcal M,\tau)$ and its states, such as the independent representative law named in Corollary F.10.12g.1.

*Proof.* Item 1. The operator $H_c$ is self-adjoint on $\operatorname{Dom}H_c=\operatorname{Dom}H$ and equals $h_c(H)$ for the real function $h_c(\lambda)=\lambda+\alpha(c)$, so functional calculus gives $e^{itH_c}=e^{it\alpha(c)}e^{itH}$ as an identity of unitary operators. The scalar phase cancels in $e^{itH_c}xe^{-itH_c}=e^{itH}xe^{-itH}$ for every $x\in\mathcal M$.

Item 2. The KMS condition refers only to the state and the automorphism group [Bratteli & Robinson 1997], so item 1 gives equality of the KMS sets.

Item 3. By Tomita-Takesaki theory, $\Delta_\omega$ and $J_\omega$ come from the polar decomposition of the closure of $x\Omega_\omega\mapsto x^*\Omega_\omega$ in the GNS representation of $(\mathcal M,\omega)$, and $\sigma^\omega_t=\operatorname{Ad}\Delta_\omega^{it}$; none of these objects refers to $H$. Takesaki's theorem [Takesaki 1970; Bratteli & Robinson 1997] characterizes $\sigma^\omega$ as the unique $\sigma$-weakly continuous one-parameter automorphism group for which $\omega$ satisfies the KMS condition at inverse temperature $-1$. If $\omega$ is $(\tau,\beta)$-KMS, then $\omega$ satisfies that condition for $t\mapsto\tau_{-\beta t}$, so $\sigma^\omega_t=\tau_{-\beta t}$, and item 1 makes the right-hand side independent of $c$. Relative modular operators, Connes cocycles and Araki relative entropies are built from pairs of normal states on $\mathcal M$ without reference to $H$.

Item 4. By items 1–3 every listed input coincides along the orbit, so the value of the map coincides as well. The null-flux part of Theorem X.4b uses only $g_{\mu\nu}k^\mu k^\nu=0$ and no regulator, which gives the final statement. ∎

**Resolution TV-X-23-R1 (Metadata).** Exact domain: W*-dynamical systems of any type whose dynamics is implemented by a self-adjoint generator, under the identity-response shift rule (X.4d.1) and the constant-shift quotient (X.4a.2). Premises: (X.4d.1), Tomita-Takesaki theory and Takesaki's KMS characterization of the modular group. Equivalence: the constant-shift relation (X.4a.2). Budget: one scalar phase identity; no finite regulator and no descent sequence. Verifier: operator identities in the given representation. Falsifier: a modular, KMS or relative-entropy quantity that changes along a constant-shift orbit under (X.4d.1). Provenance class: source-internal mathematics on standard modular theory. Downstream consumers: Definition X.4a, Theorem X.4b, Corollary X.4c, Corollary F.10.12g.1 and `TV-X-23`. Nonvacuity: on $M_2(\mathbb C)$ with $H=\operatorname{diag}(0,1)$ the Gibbs state $e^{-\beta H}/\operatorname{tr}e^{-\beta H}$ is the same for $H+\alpha\mathbf1$, and every faithful normal state $\omega$ on a type-III factor gives an instance with $\tau_t=\sigma^\omega_{-t}$, implemented by $H=-\log\Delta_\omega$, for which $\omega$ is $(\tau,1)$-KMS. Theorem X.4d gives `positive-discharge` of the regulator-independent modular/KMS component of `TV-X-23` for the quotient (X.4a.2), and item 4 gives `nonentailment` of the physical representative from modular and KMS data. The independently populated global boundary/normalization law selecting the representative (`C+O`) and the physical certification that the constant vacuum shift of the accepted AQFT net of `RT-T8` obeys (X.4d.1) (`R`) remain live under `TV-X-23`.

**Relation to Corollary B.8d.2.** Corollary B.8d.2 already proves that additive metric-proportional vacuum normalization is absorbed into $\Lambda$ and records how the PCE-attractor convention can fix a representative. Definition X.4a and Theorem X.4b identify the corresponding local operational quotient and its modular/null-flux scope; Theorem F.10.12g adds the quantitative finite-cover descent. Corollary F.10.12g.1 proves that every selector depending only on that descent record is constant on the common-shift orbit and therefore cannot determine its mean. Selecting a global $\Lambda_{\mathrm{eff}}$ requires the independent representative law named there, while type-III modular/KMS applicability retains the AQFT descent certificate required by Corollary X.4c.





## X.5 Conditional Open-System ND--RID Branch: Schwinger--Keldysh $\Gamma_{\rm CTP}$

On a branch where the retained macroscopic variables form a proper subsystem and tracing over a registered complement yields a CPTP reduced law, the macroscopic dynamics are open. The CTP construction below is conditional on that reduced-state branch; ND--RID alone does not imply it. Introduce doubled fields $\Phi_\pm$ on the closed-time path and define

$$
e^{\,i W_{\rm CTP}[J_+,J_-]}
=\!\int\!\mathcal{D}\varphi_+\mathcal{D}\varphi_-\,
p_\theta[\varphi_+,\varphi_-]\,
e^{\,i\big(S[\varphi_+]-S[\varphi_-]+\int J_+\mathcal{O}_+-\int J_-\mathcal{O}_-\big)}.
\tag{X.9}
$$

The **CTP effective action** $\Gamma_{\rm CTP}[\Phi_+,\Phi_-]$ is the Legendre transform of $W_{\rm CTP}$. In the Keldysh $r/a$ basis the quadratic kernel has the causal structure

$$
\Gamma^{(2)}(\omega,\mathbf{k}) \equiv
\begin{pmatrix}
0 & \Gamma^{A} \\
\Gamma^{R} & \Gamma^{K}
\end{pmatrix},
$$

with $\Gamma^{R}$ retarded, $\Gamma^{A}=(\Gamma^{R})^\dagger$, and $-i\Gamma^{K}\succeq 0$ (noise positivity). On a thermal KMS branch, the KMS condition relates $\Gamma^{K}$ to the dissipative response as in Theorem X.5c.2. The reset-cost and entropy inequalities of Appendix E are compatible constraints and do not by themselves imply this frequency-resolved fluctuation–dissipation relation. The physical coarse-grained equations follow by varying $\Gamma_{\rm CTP}$ with respect to the difference field $x_a$ and then imposing $x_a=0$ and vanishing physical sources, using the conventions of Definition X.5c.1. Restricting to equal contour fields before variation gives the normalized identity $\Gamma_{\rm CTP}[x_r,0]=0$ and does not supply these equations.

**Theorem X.5a (Conditional Derived Generally Covariant Coarse-Grained Effective Action from ND-RID / PCE).** Assume the regular Lorentzian branch of Sections 11–12. Let $\mathcal P_h$ be an admissible family of cell partitions of $M_{\mathrm{reg}}$ with mesh $h\to 0$, uniformly bounded aspect ratio, and boundary measure $O(h)$ on compact sets. Assume the microscopic ND-RID dynamics satisfy:

1. *Finite-range locality.* For each cell $C\in\mathcal P_h$, one update step depends only on the bounded neighborhood $N(C)$.
2. *Local detailed balance.* The cell transition weights have the form
$$
K_{C,h}(\sigma'\mid\sigma) \;=\; e^{-\ell_{C,h}(\sigma,\sigma')}\,K^{\mathrm{rev}}_{C,h}(\sigma\mid\sigma'),
$$
where $\ell_{C,h}$ is the local entropy-production / predictive-cost increment.
3. *Local additivity of cost.* The total path weight on a finite time slab factors as
$$
\mathbb P_h[\sigma] \;\propto\; \exp\!\left(-\sum_n\sum_{C\in\mathcal P_h}\ell_{C,h}(\sigma_n,\sigma_{n+1})\right)
$$
up to boundary terms supported on overlaps of neighboring cells.
4. *Relabeling neutrality.* Two coordinate descriptions of the same coarse-grained history define the same physical weight.
5. *Regular-field closure.* For the finite list of coarse observables $\Psi^A$ used to describe the branch, the cell variables admit a bounded finite-jet expansion on each compact set with uniformly bounded coefficients.
6. *Boundary-layer / Legendre-locality.* The boundary remainder $R_h[J;g]$ supported on cell-overlap layers vanishes in norm on bounded test sources at rate $O(h)$ on each compact set, and the Legendre transform preserves the additive cell decomposition up to the same boundary-layer remainder.
7. *Local-density compactness and covariant representative.* Along the subsequence under consideration, the local cell Legendre densities and all retained jet coefficients converge locally uniformly on bounded jet sets to a density $\mathcal L(x,\Psi,\nabla\Psi,\dots,\nabla^{(r)}\Psi;g)$. The coarse fields have specified tensorial transformation laws, and the limiting density has a representative for which $\sqrt{|g|}\mathcal L\,d^4x$ is invariant under the relabelings in assumption 4, up to boundary divergences whose compact-set contribution is included in the remainder of assumption 6.

For sources $J_A$, define the cell-empirical generating functional
$$
W_h[J;g] \;:=\; \log\,\mathbb E_{\mathbb P_h}\exp\!\left(\sum_{C\in\mathcal P_h}|C|\,J_A(x_C)\,\Psi_C^A\right),
$$
and let $\Gamma_h[\Psi;g]$ be its Legendre transform with respect to the coarse fields. Then every compact-set subsequential limit satisfying assumption 7 has the form
$$
S_{\mathrm{eff}}[\Psi,g] \;=\; \int_{M_{\mathrm{reg}}}\sqrt{|g|}\,\mathcal L\bigl(x,\Psi,\nabla\Psi,\dots,\nabla^{(r)}\Psi;g\bigr)\,d^4x,\tag{X.9a}
$$
where $\mathcal L$ is a scalar local Lagrangian density, modulo the declared boundary divergences.

*Proof.* Finite-range locality, local detailed balance, local additivity, and assumption 6 give
$$
W_h[J;g]
=
\sum_{C\in\mathcal P_h}|C|\,w_{C,h}\bigl(J(x_C),\Psi_C,j_h\Psi_C;g(x_C)\bigr)+R_h[J;g],
$$
with $R_h[J;g]\to0$ on compact sets. Legendre-locality gives local cell densities $L_{C,h}$ such that
$$
\Gamma_h[\Psi;g]
=
\sum_{C\in\mathcal P_h}|C|\,L_{C,h}\bigl(\Psi_C,j_h\Psi_C;g(x_C)\bigr)+o(1).
$$
By assumption 7, $L_{C,h}$ converges locally uniformly on the bounded jet range of the convergent field sequence to $\mathcal L$. Uniform aspect-ratio control makes the cell sum a Riemann sum, while the uniform density convergence and the vanishing boundary remainder permit passage to the limit. This yields (X.9a).

Assumptions 4 and 7 give the tensorial transformation laws and an invariant density representative. Hence $\sqrt{|g|}\mathcal L\,d^4x$ has the same value in overlapping coordinate charts, apart from the declared boundary divergences, and the limiting action is generally covariant. ∎

**Corollary X.5a.1 (Normalized Matter–Gravity Decomposition of the Derived Action).** Assume that the zero-field configuration $\Psi=0$ belongs to the branch domain. Define
$$
S_{\mathrm{grav}}[g]:=S_{\mathrm{eff}}[0,g],
\qquad
S_{\mathrm{MPU}}[\Psi,g]:=S_{\mathrm{eff}}[\Psi,g]-S_{\mathrm{eff}}[0,g].
$$
Then
$$
S_{\mathrm{eff}}[\Psi,g] \;=\; S_{\mathrm{MPU}}[\Psi,g] + S_{\mathrm{grav}}[g],
\qquad
S_{\mathrm{MPU}}[0,g]=0,
\tag{X.9b}
$$
and this split is unique among decompositions satisfying the displayed normalization. In $D=4$, the leading two-derivative geometric term is
$$
S_{\mathrm{grav}}[g] \;=\; \frac{1}{16\pi G}\int_{M_{\mathrm{reg}}}(R-2\Lambda)\sqrt{|g|}\,d^4x + S_{\mathrm{grav}}^{(\ge 4)}[g],\tag{X.9c}
$$
where $S_{\mathrm{grav}}^{(\ge 4)}$ contains curvature invariants with four or more derivatives.

*Proof.* The definitions give (X.9b) and $S_{\mathrm{MPU}}[0,g]=0$. Suppose $S_{\mathrm{eff}}=A[\Psi,g]+B[g]$ is another split with $A[0,g]=0$. Evaluating at $\Psi=0$ gives $B[g]=S_{\mathrm{eff}}[0,g]=S_{\mathrm{grav}}[g]$, and subtraction gives $A=S_{\mathrm{MPU}}$. Thus the normalized split is unique. Locality and general covariance imply that the pure-metric scalar densities with at most two derivatives are the cosmological density and the Einstein–Hilbert density, up to a boundary divergence. This gives (X.9c), with higher-curvature terms in $S_{\mathrm{grav}}^{(\ge4)}$. ∎

**Corollary X.5a.2 (Leading SM+GR Operator Basis on the Locked Gauge-Matter Branch).** Add to Theorem X.5a the locked Lorentzian branch, the gauge algebra
$$
\mathfrak g_*=
\mathfrak{su}(3)\oplus\mathfrak{su}(2)\oplus\mathfrak u(1),
$$
the one-family anomaly-free chiral package of Theorem G.8.5a and its primitive minimal-support form Corollary G.8.5a.1, the three-family CP-active branch of Appendix R when flavor is retained, and the scalar mass bridge $H=(1,2)_{1/2}$ of Theorem T.2.1a. Restrict also to the minimal curvature-coupling truncation, with the allowed dimension-four invariant $R H^\dagger H$ assigned zero coefficient by a separate branch condition. On this truncation, the displayed leading local invariant action has the operator basis
$$
S_{\mathrm{eff}}^{(0)}
=
S_{\mathrm{EH}}
+
S_{\mathrm{YM}}
+
S_{\mathrm{Weyl}}
+
S_H
+
S_Y
+
S_\nu
+
S_{\mathrm{top}},
$$
where
$$
S_{\mathrm{EH}}
=
\frac{c^3}{16\pi G}
\int
(R-2\Lambda)\sqrt{-g}\,d^4x,
$$
$$
S_{\mathrm{YM}}
=
-\int\sqrt{-g}\,d^4x
\left[
\frac1{4g_3^2}G_{\mu\nu}^AG^{A\mu\nu}
+
\frac1{4g_2^2}W_{\mu\nu}^aW^{a\mu\nu}
+
\frac1{4g_Y^2}B_{\mu\nu}B^{\mu\nu}
\right],
$$
$$
S_{\mathrm{Weyl}}
=
\sum_{\psi}
\int
i\psi^\dagger\bar\sigma^\mu D_\mu\psi
\sqrt{-g}\,d^4x,
$$
$$
S_H
=
\int
\left[
-(D_\mu H)^\dagger(D^\mu H)
+
\mu^2H^\dagger H
-
\lambda(H^\dagger H)^2
\right]\sqrt{-g}\,d^4x,
$$
and
$$
S_Y
=
-\int
\left[
QY_uHu^c
+
QY_dH^\dagger d^c
+
LY_eH^\dagger e^c
+
\mathrm{h.c.}
\right]\sqrt{-g}\,d^4x.
$$
The neutrino effective operator, when the gauge-null sterile sector is not retained, is
$$
S_\nu
=
-\int
\left[
\frac12
\frac{\kappa_\nu^{ij}}{\Lambda_\nu}
(L_iH)(L_jH)
+
\mathrm{h.c.}
\right]\sqrt{-g}\,d^4x.
$$
The topological sector has the form
$$
S_{\mathrm{top}}
=
\frac{\theta_3}{32\pi^2}\int\operatorname{Tr}(G\wedge G)
+
\frac{\theta_2}{32\pi^2}\int\operatorname{Tr}(W\wedge W)
+
\frac{\theta_Y}{32\pi^2}\int F_Y\wedge F_Y
+
\cdots .
$$

*Proof.* Theorem X.5a gives locality and covariance of the continuum action. Corollary X.5a.1 gives the Einstein-Hilbert plus cosmological leading metric sector. Gauge-frame redundancy forces the connection $A_\mu$ and curvature $F_{\mu\nu}=[D_\mu,D_\nu]$; the lowest local Lorentz scalar quadratic in curvature is $\operatorname{Tr}(F_{\mu\nu}F^{\mu\nu})$, giving the Yang-Mills terms for the three simple/abelian factors of $\mathfrak g_*$. The locked chiral matter fields are left-Weyl spinors, so local Lorentz invariance and gauge covariance force the first-order kinetic term $i\psi^\dagger\bar\sigma^\mu D_\mu\psi$. Theorem T.2.1a supplies the unique minimal scalar representation $H=(1,2)_{1/2}$, whose lowest local invariant kinetic and potential terms are $(D_\mu H)^\dagger(D^\mu H)$, $H^\dagger H$, and $(H^\dagger H)^2$. The same theorem supplies the three minimal charged Yukawa bridges. If no sterile singlet is retained, the lowest neutrino mass operator is the dimension-five Weinberg operator $(LH)(LH)/\Lambda_\nu$. The displayed topological terms are the allowed closed four-form densities for the retained gauge factors, with $F_Y=dB$ the abelian field-strength two-form; their coefficients are not fixed by symmetry alone and are routed to the spectral calibration or orientation certificate ledgers. The invariant $R H^\dagger H$ is excluded only by the declared minimal curvature-coupling truncation. Higher-derivative and higher-field operators lie outside the displayed truncation; treating them as PCE-higher-cost corrections requires an admissible full-ledger cost comparison. ∎

**Theorem X.5b (Landauer-CTP Noise Floor on a Local Equilibrium Update Channel).** Let $q(t)$ be a coarse update coordinate on a regular CTP branch, and suppose the quadratic Keldysh action is in a local equilibrium Onsager form with dissipative matrix
$$
\mathcal D
=
\lim_{\omega\downarrow 0}
\frac{-\operatorname{Im}\Gamma^R(\omega)}{\omega}
\succeq 0
$$
and noise covariance kernel
$$
N=2\beta^{-1}\mathcal D,
\tag{X.9d}
$$
where $\beta$ is the local inverse temperature. If the update realizes an irreversible Landauer reset over a time interval $[0,\tau]$ with entropy production
$$
\Delta S_q
=
\beta\int_0^\tau \dot q(t)^T\mathcal D\dot q(t)\,dt
\ge \ln 2,
\tag{X.9e}
$$
then the same update direction has nonzero CTP noise, and quantitatively
$$
\int_0^\tau \dot q(t)^T N\dot q(t)\,dt
\ge
2\beta^{-2}\ln 2.
\tag{X.9f}
$$
In particular, on a local equilibrium CTP branch an actually irreversible MPU update cannot have a vanishing Keldysh noise kernel along the dissipative update direction.

*Proof.* Equation (X.9d) is the local equilibrium fluctuation-dissipation relation in the quadratic CTP branch. Substituting (X.9d) into the quadratic noise integral gives
$$
\int_0^\tau \dot q^T N\dot q\,dt
=
2\beta^{-1}\int_0^\tau \dot q^T\mathcal D\dot q\,dt.
$$
By (X.9e),
$$
\int_0^\tau \dot q^T\mathcal D\dot q\,dt
\ge
\beta^{-1}\ln 2.
$$
Combining the two displayed equations yields (X.9f). If the Keldysh noise vanished on the update direction, the left side of (X.9f) would be zero, contradicting $\ln 2>0$. ∎

**Definition X.5c.1 (Finite Dynamical-KMS Ledger).** Let a finite CTP branch be written in the Keldysh $r/a$ basis for a finite vector of retained fields $x=(x^1,\dots,x^n)$, with quadratic action
$$
\Gamma_{\mathrm{CTP}}^{(2)}
=
\frac12
\int_{\omega}
\begin{pmatrix}
x_r(-\omega)&x_a(-\omega)
\end{pmatrix}
\begin{pmatrix}
0&\Gamma^A(\omega)\\
\Gamma^R(\omega)&\Gamma^K(\omega)
\end{pmatrix}
\begin{pmatrix}
x_r(\omega)\\
x_a(\omega)
\end{pmatrix}.
\tag{X.9g}
$$
Let
$$
N(\omega):=-i\Gamma^K(\omega)
\tag{X.9h}
$$
be the finite noise kernel. For this frequency-space gate, work on a stationary thermal patch with constant $0<\beta<\infty$, real retained bosonic fields, $x_r=(x_++x_-)/2$, $x_a=x_- -x_+$ (backward minus forward), and Fourier convention $x(t)=\int_\omega e^{-i\omega t}x(\omega)$. With $J_r=(J_++J_-)/2$ and $J_a=J_+-J_-$, the source pairing is $J_+x_+-J_-x_-=J_a x_r-J_r x_a$. The Legendre-transform convention gives $\delta\Gamma_{\rm CTP}/\delta x_a=J_r$, and at tree level $\Gamma_{\rm CTP}=S[x_+]-S[x_-]$; thus $\Gamma^R$ is the inverse physical response with these signs. An overbar denotes entrywise complex conjugation, while $P^*=P^\dagger$ denotes the adjoint. Represent the retained time-reversal parities by a real orthogonal involution $E=E^T=E^{-1}$, extended linearly to complexified contour fields. Assume the CTP reality conditions $\Gamma^R(-\omega)=\overline{\Gamma^R(\omega)}$, $\Gamma^A(\omega)=\Gamma^R(\omega)^\dagger$, $N(-\omega)=\overline{N(\omega)}$, $N(\omega)=N(\omega)^\dagger$, and noise positivity. On the time-reversal-invariant parameter branch, require the Onsager--Casimir relation
$$
\Gamma^R(\omega)=E\,\Gamma^R(\omega)^T E.
$$
A time-reversal-odd external parameter must be reversed in this relation; its two parameter branches cannot be identified without an additional symmetry.

The classical dynamical-KMS involution in these conventions is
$$
\mathsf K_{\beta}x_r(\omega)=E x_r(-\omega),
\qquad
\mathsf K_{\beta}x_a(\omega)
=
E\left(x_a(-\omega)+\beta\omega x_r(-\omega)\right).
\tag{X.9i}
$$
The coefficient $\beta\omega$ is the Fourier image of the imaginary time-domain derivative $i\beta\partial_t x_r(-t)$. On the exact finite-frequency branch, the symmetric thermal-contour shifts are $\widetilde x_+(t)=E x_+(-t+i\beta/2)$ and $\widetilde x_-(t)=E x_-(-t-i\beta/2)$. With the stated backward-minus-forward convention they give
$$
\begin{pmatrix}
\mathsf K_\beta x_r(\omega)\\
\mathsf K_\beta x_a(\omega)
\end{pmatrix}
=
M_\beta(\omega)
\begin{pmatrix}
x_r(-\omega)\\
x_a(-\omega)
\end{pmatrix},
\qquad
M_\beta(\omega)=
\begin{pmatrix}
c_\omega E&\tfrac12s_\omega E\\
2s_\omega E&c_\omega E
\end{pmatrix},
\quad
c_\omega=\cosh(\beta\omega/2),\quad
s_\omega=\sinh(\beta\omega/2).
$$
Here $M_\beta(\omega)M_\beta(-\omega)=I$. The classical statistical limit uses the scaling of the $a$ field together with the low-frequency thermal expansion; merely keeping the classical triangular transformation at finite quantum frequency does not give the exact thermal shift.

The finite dynamical-KMS gate requires invariance of the CTP quadratic action under this thermal transformation up to a CTP boundary term. Its fluctuation-dissipation identity is
$$
\Gamma^A(\omega)=\Gamma^R(\omega)^\dagger,
\qquad
N(\omega)
=
\coth\left(\frac{\beta\omega}{2}\right)
\frac{\Gamma^A(\omega)-\Gamma^R(\omega)}{2i}
\succeq0.
\tag{X.9j}
$$
On the classical branch, the corresponding identity uses $2/(\beta\omega)$ in place of $\coth(\beta\omega/2)$. The value at $\omega=0$ is defined by the continuous low-frequency limit whenever that limit exists.

**Theorem X.5c.2 (Dynamical-KMS Gate for Finite CTP Branches).** On the stationary finite quadratic branch with the CTP reality, positivity, and Onsager--Casimir hypotheses of Definition X.5c.1, invariance under the exact thermal transformation is equivalent to (X.9j). Invariance under the classical transformation gives its classical thermal limit. In the low-frequency Onsager regime, suppose
$$
\mathcal D
=
\lim_{\omega\downarrow0}
\frac{-\operatorname{Im}\Gamma^R(\omega)}{\omega}
\succeq0,
\qquad
\operatorname{Im}\Gamma^R=\frac{\Gamma^R-\Gamma^{R\dagger}}{2i}.
$$
The noise relation then gives
$$
N(0)=2\beta^{-1}\mathcal D.
\tag{X.9k}
$$
Thus the retained dissipative response determines its noise partner at quadratic order. Let $P(\omega)$ be a frequency-local finite embedding satisfying $P(-\omega)=\overline{P(\omega)}$ and $E_{\mathrm{full}}P(-\omega)=P(\omega)E_{\mathrm{ret}}$. The induced map on the doubled fields intertwines the full and retained thermal transformations, so its range is invariant. Then
$$
\Gamma_P^R=P^*\Gamma^R P,
\qquad
N_P=P^*NP
\tag{X.9l}
$$
satisfy the retained gate on that same reciprocal branch.

*Proof.* Let $H(\omega)$ be the block kernel in (X.9g). CTP normalization gives its zero $rr$ block; the stated reality and positivity conditions supply its advanced and noise blocks. After frequency reversal, invariance of the quadratic form is the bulk identity
$$
H(\omega)=M_\beta(\omega)^T H(-\omega)M_\beta(-\omega).
$$
Use CTP reality and the Onsager--Casimir relation to move the two parity matrices through the reversed response blocks. Writing $C(\omega)=(\Gamma^A(\omega)-\Gamma^R(\omega))/(2i)$ and $\widehat N(\omega)=E N(-\omega)E$, the transformed $rr$ block is
$$
4i s_\omega\bigl(c_\omega C(\omega)-s_\omega \widehat N(\omega)\bigr).
$$
For nonzero real $\omega$ it vanishes precisely when $\widehat N(\omega)=\coth(\beta\omega/2)C(\omega)$. Applying that condition at $-\omega$ and conjugating by $E$ gives (X.9j). Conversely, (X.9j) and reciprocity imply $\widehat N=N$. Abbreviate $R=\Gamma^R$, $A=\Gamma^A$, $c=c_\omega$, and $s=s_\omega$. Direct block multiplication gives
$$
\begin{aligned}
H'_{rr}&=2cs(A-R)-4is^2\widehat N=0,\\
H'_{ra}&=c^2R-s^2A+2ics\widehat N
=c^2R-s^2A+c^2(A-R)=A,\\
H'_{ar}&=c^2A-s^2R-2ics\widehat N
=c^2A-s^2R-c^2(A-R)=R,\\
H'_{aa}&=i(c^2\widehat N-csC)
=i\frac{c}{s}(c^2-s^2)C=iN.
\end{aligned}
$$
Here $N=(c/s)C$ and $c^2-s^2=1$ were used. The continuous limit handles $\omega=0$. For the triangular classical matrix, put $b=\beta\omega$. Its four blocks are
$$
H'_{rr}=ib(2C-b\widehat N),\quad
H'_{ra}=R+ib\widehat N,\quad
H'_{ar}=A-ib\widehat N,\quad
H'_{aa}=i\widehat N.
$$
The $rr$ condition at both frequencies gives $\widehat N=N=2C/b$, hence $H'_{ra}=R+2iC=A$, $H'_{ar}=A-2iC=R$, and $H'_{aa}=iN$. CTP boundary terms are carried separately. This proves equivalence within the stated reciprocal branch; fluctuation-dissipation alone does not supply the reciprocity hypothesis.

For compression, the two conditions on $P$ give $E_{\rm ret}P^T=P^\dagger E_{\rm full}$ and $\overline P E_{\rm ret}=E_{\rm full}P$ at each frequency. Therefore
$$
E_{\rm ret}(\Gamma_P^R)^T E_{\rm ret}
=P^\dagger E_{\rm full}(\Gamma^R)^T E_{\rm full}P
=P^\dagger\Gamma^R P=\Gamma_P^R.
$$
The condition $P(-\omega)=\overline{P(\omega)}$ also preserves the stated CTP reality conditions.

For $\omega\downarrow0$,
$$
\coth\left(\frac{\beta\omega}{2}\right)
=
\frac{2}{\beta\omega}+O(\omega),
$$
and
$$
\frac{\Gamma^A(\omega)-\Gamma^R(\omega)}{2i}
=
-\operatorname{Im}\Gamma^R(\omega).
$$
Substituting the definition of $\mathcal D$ gives (X.9k). For a compression satisfying the retained-invariance and intertwining hypotheses,
$$
N_P
=
P^*NP
=
\coth\left(\frac{\beta\omega}{2}\right)
\frac{P^*\Gamma^AP-P^*\Gamma^RP}{2i}
=
\coth\left(\frac{\beta\omega}{2}\right)
\frac{\Gamma_P^A-\Gamma_P^R}{2i}.
$$
Congruence gives $N_P\succeq0$. Because $P$ intertwines the two KMS involutions, applying the retained involution to the compressed action is the same as compressing the transformed full action. Its variation is therefore the compressed boundary term, so the retained action satisfies the gate. ∎

**Corollary X.5c.3 (No Dissipation Without the KMS Noise Partner).** Any PU branch that uses a finite dissipative CTP kernel for constraint-coupling influence, washout, adaptive relaxation, dissipative holonomy, or irreversible coarse-grained update must either satisfy the dynamical-KMS gate of Definition X.5c.1 or be marked as outside the local-equilibrium CTP branch. In a gated branch, a positive dissipative coefficient $\mathcal D_v>0$ along any retained direction $v$ forces
$$
v^*N(0)v
=
2\beta^{-1}v^*\mathcal Dv
>
0.
\tag{X.9m}
$$

*Proof.* For each listed sector represented by a frequency-local compression whose range is invariant under the dynamical-KMS involution and which intertwines the full and retained involutions, Theorem X.5c.2 preserves (X.9j) and its low-frequency limit (X.9k). These compression conditions are part of the retained local-equilibrium branch. If $v^*\mathcal Dv>0$, then (X.9k) gives $v^*N(0)v=2\beta^{-1}v^*\mathcal Dv>0$. Thus a branch cannot retain dissipation in a local-equilibrium CTP sector while setting its KMS noise partner to zero. ∎

**Theorem X.5c.4 (KMS Suppression of Off-Diagonal History Coherences).** On a finite quadratic local-equilibrium CTP branch satisfying Definition X.5c.1, suppose the retained history-pair influence factor for two coarse histories $q_1,q_2:[0,\tau]\to\mathbb R^n$ has the Gaussian Keldysh form
$$
\mathcal I[q_1,q_2]
=
\exp\left(
-\frac12\int_0^\tau (q_1-q_2)^T N (q_1-q_2)\,dt
+i\mathcal A[q_1,q_2]
\right),
\tag{X.9m.1}
$$
with $N\succeq0$ the noise kernel of Theorem X.5c.2. If, on a retained transverse coherence subspace $E_\perp$, the noise satisfies $N|_{E_\perp}\succeq\nu I$ with $\nu>0$, and if
$$
q_1(t)-q_2(t)\in E_\perp,
\qquad
\int_0^\tau \lVert q_1(t)-q_2(t)\rVert^2dt\ge L^2,
\tag{X.9m.2}
$$
then
$$
|\mathcal I[q_1,q_2]|
\le
\exp\left(-\frac12\nu L^2\right).
\tag{X.9m.3}
$$
In the low-frequency Onsager regime, any retained direction with $v^*\mathcal Dv>0$ has such a positive KMS noise coefficient by (X.9m), so repeated coarse updates suppress off-diagonal history coherences exponentially in the accumulated noise length.

*Proof.* Taking the absolute value of (X.9m.1) removes the phase $\mathcal A$ and leaves
$$
|\mathcal I[q_1,q_2]|
=
\exp\left(
-\frac12\int_0^\tau (q_1-q_2)^T N (q_1-q_2)\,dt
\right).
$$
On $E_\perp$, the operator inequality $N\succeq\nu I$ gives
$$
(q_1-q_2)^T N(q_1-q_2)
\ge
\nu\lVert q_1-q_2\rVert^2.
$$
Integrating and using (X.9m.2) gives (X.9m.3). The final sentence is Corollary X.5c.3 applied to each retained dissipative direction. ∎

**Corollary X.5c.5 (Decoherence and the Conditional Classical Saddle Gate).** On a branch satisfying Theorem X.5c.4, suppose the accumulated KMS noise length diverges for every non-diagonal retained history pair. Then all non-diagonal retained history-pair amplitudes vanish in that limit, while diagonal histories remain weighted by the diagonal effective action. If, in addition, the branch supplies a semiclassical parameter $\hbar_{\mathrm{eff}}\to0$, a twice differentiable diagonal action, nondegenerate stationary histories, and a stationary-phase estimate showing that contributions outside neighborhoods of those stationary histories vanish as $\hbar_{\mathrm{eff}}\to0$, then the surviving saddle histories on the branch of Theorem 12.3b are its metric-geodesic histories. The decoherence crossover follows from (X.9m.3); the saddle crossover follows from the separate stationary-phase estimate.

*Proof.* Theorem X.5c.4 gives
$$
|\mathcal I[q_1,q_2]|
\le
\exp\!\left(-\frac12\nu L^2\right),
$$
so divergence of the accumulated noise length sends every off-diagonal factor to zero. This step leaves all diagonal histories and therefore does not select an Euler–Lagrange solution. Under the additional stationary-phase hypotheses, the nonstationary diagonal contribution vanishes in the semiclassical limit and the retained contribution is supported near stationary histories. Theorem 12.3b identifies those stationary histories with metric geodesics on its branch. ∎

**Theorem X.5c.6 (Frequency-Resolved KMS Decoherence Floor).** On the stationary finite quadratic branch of Definition X.5c.1, assume the exact identity (X.9j) at every real $\omega\ne0$, normalize the frequency measure of (X.9g) by Plancherel's identity $\int_\omega x(\omega)^\dagger x(\omega)=\int dt\,x(t)^Tx(t)$ for the stated Fourier convention, and put
$$
C(\omega)=\frac{\Gamma^A(\omega)-\Gamma^R(\omega)}{2i}.
$$
Let $E_\perp\subseteq\mathbb R^n$ be a retained subspace with orthogonal projection $P$, and suppose that the dissipative kernel has the Ohmic floor
$$
P\,C(\omega)\,P\succeq D_\perp\,\omega\,P
\qquad(\omega>0)
\tag{X.5c.6.1}
$$
for a constant $D_\perp>0$. Then:

1. for every real $\omega\ne0$,
$$
P\,N(\omega)\,P\succeq\frac{2D_\perp}{\beta}\,P;
\tag{X.5c.6.2}
$$

2. for real square-integrable histories $x_r,x_a$ for which the integrals in (X.9g) converge absolutely, the $ra$ and $ar$ terms of $\Gamma^{(2)}_{\mathrm{CTP}}$ are real and
$$
\bigl|e^{i\Gamma^{(2)}_{\mathrm{CTP}}[x_r,x_a]}\bigr|
=
\exp\left(-\frac12\int_\omega x_a(\omega)^\dagger N(\omega)\,x_a(\omega)\right);
\tag{X.5c.6.3}
$$

3. if in addition $x_a(t)\in E_\perp$ for every $t$ and $\int\lVert x_a(t)\rVert^2dt\ge L^2$, then
$$
\bigl|e^{i\Gamma^{(2)}_{\mathrm{CTP}}[x_r,x_a]}\bigr|
\le
\exp\left(-\frac{D_\perp L^2}{\beta}\right),
\tag{X.5c.6.4}
$$
which is the bound (X.9m.3) with $\nu=2D_\perp/\beta$ for the complete frequency-resolved KMS kernel;

4. the scalar branch $n=1$, $E=1$,
$$
\Gamma^R(\omega)=M\omega^2-\kappa-\frac{i\gamma\Lambda\omega}{\Lambda-i\omega},
\qquad
M,\kappa,\gamma,\Lambda>0,
\tag{X.5c.6.5}
$$
with $\Gamma^A=\overline{\Gamma^R}$ and $N$ given by (X.9j), satisfies every hypothesis of Definition X.5c.1, is analytic in $\operatorname{Im}\omega>0$, and has Onsager coefficient $\mathcal D=\gamma$ and $N(0)=2\gamma/\beta$. It violates (X.5c.6.1) for every $D_\perp>0$. For every $\Omega>0$, every history pair as in item 2 whose difference field $x_a$ has Fourier transform supported in $\Omega\le|\omega|\le\Omega+1$ and squared norm $L^2$ satisfies
$$
\bigl|e^{i\Gamma^{(2)}_{\mathrm{CTP}}[x_r,x_a]}\bigr|
\ge
\exp\left(-\coth\left(\frac{\beta\Omega}{2}\right)\frac{\gamma\Lambda^2L^2}{2\Omega}\right),
\tag{X.5c.6.6}
$$
and the right side tends to $1$ as $\Omega\to\infty$ at fixed $L$.

Thus a floor of the full dissipative kernel suppresses every transverse history difference by its accumulated length, and the quantum factor $(\beta\omega/2)\coth(\beta\omega/2)\ge1$ makes the classical Nyquist level $2D_\perp/\beta$ a lower bound on the noise at all frequencies. On the branch (X.5c.6.5), the Onsager coefficient controls history differences concentrated at low frequency, while at fixed accumulated length the weight of differences carried by frequencies $|\omega|\ge\Omega$ tends to $1$ as $\Omega\to\infty$.

*Proof.* The matrix $C(\omega)$ is Hermitian because $\Gamma^A=\Gamma^{R\dagger}$. CTP reality gives $\Gamma^R(-\omega)=\overline{\Gamma^R(\omega)}$ and $\Gamma^A(-\omega)=\Gamma^R(-\omega)^\dagger=\Gamma^R(\omega)^T$, hence
$$
C(-\omega)=-\overline{C(\omega)}.
$$
Entrywise conjugation preserves the Loewner order of Hermitian matrices, because $\overline A=A^T$ has the spectrum of $A$, and $P$ is real. For $\omega<0$, conjugating (X.5c.6.1) at $-\omega>0$ therefore gives $-P\,C(\omega)P\succeq-D_\perp\omega P$. Dividing by $-\omega>0$ in that case, and by $\omega$ in (X.5c.6.1), yields
$$
P\,\omega^{-1}C(\omega)\,P\succeq D_\perp P
\qquad(\omega\ne0).
$$
Put $s(\omega)=(\beta\omega/2)\coth(\beta\omega/2)$. Since $\tanh y\le y$ for $y\ge0$ and $s$ is even, $s(\omega)\ge1$. Equation (X.9j) gives $PN(\omega)P=(2/\beta)s(\omega)\,P\omega^{-1}C(\omega)P$, and $(s(\omega)-1)P\omega^{-1}C(\omega)P\succeq0$ gives (X.5c.6.2).

For item 2, real histories satisfy $x(-\omega)=\overline{x(\omega)}$. Put $T_R=\int_\omega x_a(-\omega)^T\Gamma^R(\omega)x_r(\omega)$. CTP reality and the substitution $\omega\mapsto-\omega$ give $\overline{T_R}=\int_\omega x_a(\omega)^T\Gamma^R(-\omega)x_r(-\omega)=T_R$, and the same argument applies to the $\Gamma^A$ term. The $aa$ term of (X.9g) equals $\tfrac i2\int_\omega x_a(\omega)^\dagger N(\omega)x_a(\omega)$, whose integrand is nonnegative. Hence $\operatorname{Im}\Gamma^{(2)}_{\mathrm{CTP}}=\tfrac12\int_\omega x_a^\dagger Nx_a$, which is (X.5c.6.3). For item 3, $x_a(\omega)=Px_a(\omega)$ because $P$ is real and commutes with the Fourier transform. Then (X.5c.6.2) and Plancherel's identity give $\int_\omega x_a^\dagger Nx_a\ge(2D_\perp/\beta)\int\lVert x_a(t)\rVert^2dt\ge2D_\perp L^2/\beta$, and (X.5c.6.3) gives (X.5c.6.4).

For item 4, the last term of (X.5c.6.5) satisfies the reality condition, and its only pole is $\omega=-i\Lambda$. A direct computation gives
$$
C(\omega)=-\operatorname{Im}\Gamma^R(\omega)=\frac{\gamma\Lambda^2\omega}{\Lambda^2+\omega^2}.
$$
Hence $N(\omega)=\coth(\beta\omega/2)\gamma\Lambda^2\omega/(\Lambda^2+\omega^2)$ is real, even and nonnegative, the Onsager--Casimir relation is automatic for $n=1$ and $E=1$, $\mathcal D=\lim_{\omega\downarrow0}C(\omega)/\omega=\gamma$, and (X.9k) gives $N(0)=2\gamma/\beta$. Since $\omega^{-1}C(\omega)\to0$ as $\omega\to\infty$, no $D_\perp>0$ satisfies (X.5c.6.1). For $|\omega|\ge\Omega$, monotonicity of $\coth$ on $(0,\infty)$ and $|\omega|/(\Lambda^2+\omega^2)\le1/|\omega|$ give $N(\omega)\le\coth(\beta\Omega/2)\gamma\Lambda^2/\Omega$. Inserting this bound into (X.5c.6.3) with $\int_\omega|x_a(\omega)|^2=L^2$ gives (X.5c.6.6). A nonzero real even smooth function supported in $[\Omega,\Omega+1]\cup[-\Omega-1,-\Omega]$, rescaled to squared norm $L^2$, is the Fourier transform of such a real history. ∎

**Resolution TV-X-02-R1 (Metadata).** Exact domain: stationary finite quadratic CTP branches of Definition X.5c.1 satisfying (X.9j) at every real nonzero frequency, with the Plancherel-normalized frequency measure, together with the scalar branch (X.5c.6.5). Premises: the CTP reality, noise-positivity and Onsager--Casimir conditions of Definition X.5c.1, and the Ohmic floor (X.5c.6.1) for items 1--3. Equivalence: real orthogonal changes of retained basis commuting with $E$ and $P$. Budget: one retained projection, one floor constant and one history pair. Verifier: the inequality $y\coth y\ge1$, the conjugation symmetry $C(-\omega)=-\overline{C(\omega)}$, reality of the $ra$ and $ar$ terms, and Plancherel's identity. Falsifier: a branch satisfying (X.9j) and (X.5c.6.1) for which $PN(\omega)P$ has an eigenvalue on $E_\perp$ below $2D_\perp/\beta$, or a band-limited history on (X.5c.6.5) violating (X.5c.6.6). Provenance class: source-internal finite-frequency theorem with an explicit countermodel. Downstream consumers: Theorem X.5c.4, Corollary X.5c.5 and `TV-X-02`. Nonvacuity: the Ohmic scalar branch $\Gamma^R(\omega)=M\omega^2-\kappa-i\gamma\omega$, which satisfies (X.5c.6.1) with $D_\perp=\gamma$. Items 1--3 give `positive-discharge` of frequency-resolved KMS decoherence on the Ohmic-floor class, and item 4 gives `nonentailment` of history-pair suppression uniform in frequency content from (X.9j) and a positive Onsager coefficient. The microscopic-channel derivation of the CTP kernel together with its identity (X.9j) and Ohmic floor (X.5c.6.1), trace reduction and the stationary-phase remainder of Corollary X.5c.5 remain `M+C+R` under `TV-X-02`.

## X.6 Rate‑Level PCE Potential vs. Effective Potential

For homogeneous deformations $u=g_e^2$, choose a finite regulated spacetime region $\Omega$ with volume $\mathcal V_\Omega$ and branch-compatible boundary conditions. Define
$$
V_{\rm eff}^{(\Omega)}(u;k)
:=
\frac{\Gamma_k^{(\Omega)}[u\ \text{const}]}{\mathcal V_\Omega}.
\tag{X.10}
$$
The infinite-volume effective potential is defined only when the thermodynamic limit $V_{\rm eff}(u;k)=\lim_{\Omega\nearrow M}V_{\rm eff}^{(\Omega)}(u;k)$ exists and is independent of the admitted exhaustion.

Appendix G.9 defines a **rate‑level PCE potential** $\phi(u)$ capturing the power‑benefit trade‑off for maintaining $U(1)$ coherence; in the $U(1)$ sector the rate-level cost term is quadratic as in Appendix W (Equation (W.0.1)), hence $\gamma_{\rm eff}=2$. The PU **capacity constraint** (Appendix W; flat spectrum at the PCE‑Attractor) reads

$$
M\ln(1+\lambda u)=\ln d_0.
\tag{X.11}
$$

At the **PCE-Attractor** (Definition 15a), the system operates at the capacity boundary. In the homogeneous single-coupling truncation used here—where derivative operators, wavefunction renormalization, and all couplings other than $u$ are held fixed—the constrained minimization of the rate-level potential $\phi(u)$ is modeled by the stationary condition of the truncated effective potential $V_{\rm eff}$ under the capacity constraint (X.11). This can be written with a Lagrange multiplier $\zeta$ as:

$$
 \frac{d}{du}\Big(V_{\rm eff}(u;k)+\zeta\,[M\ln(1+\lambda u)-\ln d_0]\Big)\Big|_{u=u^*}=0.
 \tag{X.12}
 $$

Using this truncated equivalence with $\gamma_{\rm eff}=2$ reproduces the zero‑slack condition employed in Appendix Z and the identities **Sections Z.7-Z.8**.

**Theorem X.3 (Predictive Ward Identity and Unity Normalization on the Unit Predictive-Ward Branch).** At the PCE-Attractor, assume the unit Predictive-Ward branch of Theorem Z.14: the Ward map identifies $\mathcal G=\mathcal K^{-1}$ in QFI-natural units, the gauge-subspace map has no additional scalar factor, and the physical quadratic gauge kernel is parametrized as $\Gamma^{(2)}=\kappa^*_{\mathrm{bulk}}\mathcal K$. Then
$$
\kappa^*_{\mathrm{bulk}}=1.
$$

*Proof.* The Ward identity gives $\mathcal G=\mathcal K^{-1}$. On the regular Legendre branch, Proposition X.1 gives
$$
\Gamma^{(2)}=\mathcal G^{-1}=\mathcal K.
$$
The unit-branch parametrization simultaneously gives
$$
\Gamma^{(2)}=\kappa^*_{\mathrm{bulk}}\mathcal K.
$$
The retained QFI kernel is positive definite and therefore nonzero and invertible. Multiplying the equality $\kappa^*_{\mathrm{bulk}}\mathcal K=\mathcal K$ by $\mathcal K^{-1}$ yields $\kappa^*_{\mathrm{bulk}}I=I$, hence $\kappa^*_{\mathrm{bulk}}=1$. ∎

At the MPU operational scale $\mu^*$, the unit Predictive-Ward branch gives $\kappa^*_{\mathrm{bulk}}=1$. On the bounded-$C^2$ interface-response branch of Theorem Z.17,
$$
g^2=u,
\qquad
\kappa_{\mathrm{eff}}(u^*)
=1-c_{\mathrm{int}}\frac{a}{d_0}\frac{u^*}{\sqrt{K_0}}+O(u^{*2}),
$$
and therefore
$$
\alpha^{-1}
=\frac{4\pi\kappa_{\mathrm{eff}}(u^*)}{u^*}
=\frac{4\pi}{u^*}
-\frac{4\pi c_{\mathrm{int}}a}{d_0\sqrt{K_0}}
+O(u^*).
$$
For $a/d_0=1/4$ and $c_{\mathrm{int}}=1$, the displayed constant correction is $-\pi/\sqrt{K_0}$. Theorems Z.24–Z.26 require their additional curvature, projection, and transport branches.

**Theorem X.3a (Stationary-Point and Dynamics Classification of the Rate-Level and Effective Potentials).** Work in the homogeneous single-coupling truncation of this section at fixed $k$, on an open coupling interval $I\supset[0,u^*]$. Let $g_{\rm true}(u)=\sum_{i=1}^M\ln(1+\lambda_iu)$ with $\lambda_i\ge0$ and $\sum_i\lambda_i>0$, let $\mathcal C_{\rm cap}=g_{\rm true}-\ln d_0$, and let $u^*$ be its unique zero; on the flat spectrum $\lambda_i=\lambda$ this is the solution of (X.11). Let $\phi\in C^1(I)$ be the rate-level potential, with units of power, and let $V_{\rm eff}\in C^1(I)$ be $V_{\rm eff}^{(\Omega)}(\cdot;k)$ of (X.10), or its thermodynamic limit when that exists, with units of action per spacetime volume; the coupling $u$ is dimensionless. Let $\mathcal G:I\to(0,\infty)$ be a continuous metric on the coupling chart. For $W\in C^1(I)$ write
$$
\zeta_W=-\frac{W'(u^*)}{g_{\rm true}'(u^*)}.
\tag{X.3a.1}
$$
Then:

1. For every $W\in C^1(I)$, the stationarity condition $\frac{d}{du}\bigl(W+\zeta\,\mathcal C_{\rm cap}\bigr)\big|_{u=u^*}=0$ holds exactly for $\zeta=\zeta_W$. In particular (X.12) holds for every $C^1$ effective potential, with $\zeta=\zeta_{V_{\rm eff}}$, and under the equality form of (X.11) the constrained stationary point $u^*$ is common to every pair $(\phi,V_{\rm eff})$.

2. On the admissible set $\{u\ge0:\mathcal C_{\rm cap}(u)\le0\}=[0,u^*]$, a constrained minimizer at $u^*$ requires $W'(u^*)\le0$, equivalently $\zeta_W\ge0$. For convex $W$ this sign condition is also sufficient, and $u^*$ is then the unique constrained minimizer when $W$ is strictly convex or $W'(u^*)<0$. For the potential (W.0.1), which is strictly convex by Lemma W.1, $u^*$ is the unique constrained minimizer exactly when $\zeta_\phi\ge0$, that is, when $2A_{\mathrm{PCE}}u^*\le\Gamma_0\sum_i\lambda_i/(1+\lambda_iu^*)$; on the flat spectrum $\lambda_i=1$ this reads $2A_{\mathrm{PCE}}u^*(1+u^*)\le\Gamma_0M$, in agreement with Corollary Z.8.2a, and strict inequality is the cap-active hypothesis of Theorem Z.7. Within the convex class, $\phi$ and $V_{\rm eff}$ both select $u^*$ exactly when $\zeta_\phi\ge0$ and $\zeta_{V_{\rm eff}}\ge0$.

3. If $W$ is convex on $I$ and $W'(u^*)<0$, the optimal value $v_W(c)=\min\{W(u):u\ge0,\ g_{\rm true}(u)\le c\}$ is differentiable at $c=\ln d_0$ with
$$
v_W'(\ln d_0)=-\zeta_W,
\tag{X.3a.2}
$$
so $\zeta_W$ is the response of the selected value to the capacity level.

4. The natural-gradient equations $\dot u=-\mathcal G(u)^{-1}\phi'(u)$ and $\dot u=-\mathcal G(u)^{-1}V_{\rm eff}'(u)$ on $I$ have the same stationary points and the same direction of motion at every point exactly when $\operatorname{sign}\phi'(u)=\operatorname{sign}V_{\rm eff}'(u)$ for every $u\in I$. For $\kappa>0$, their solution sets correspond under the time rescaling by $\kappa$, meaning that a $C^1$ curve $w:J\to I$ on an open time interval $J$ solves the first equation exactly when $t\mapsto w(t/\kappa)$, $t\in\kappa J$, solves the second, exactly when
$$
\phi=\kappa V_{\rm eff}+b
\qquad\text{on }I
\tag{X.3a.3}
$$
for a constant $b$. When $\mathcal G^{-1}\phi'$ and $\mathcal G^{-1}V_{\rm eff}'$ are locally Lipschitz on $I$, both equations have unique local flows $\Phi^\phi_t$ and $\Phi^V_t$, and (X.3a.3) is equivalent to the flow identity $\Phi^\phi_t=\Phi^V_{\kappa t}$. The constant $\kappa$ carries the units of $\phi/V_{\rm eff}$; in $\hbar=c=1$ units a power has mass dimension $2$ and an action per spacetime volume has mass dimension $4$, so $\kappa$ has mass dimension $-2$. Under (X.3a.3), $\zeta_\phi=\kappa\zeta_{V_{\rm eff}}$.

5. Agreement of constrained stationary points therefore fixes no further relation between the two potentials. A pair $u_1,u_2\in I$ with $\phi'(u_1)V_{\rm eff}'(u_2)\ne\phi'(u_2)V_{\rm eff}'(u_1)$ refutes the dynamical identification (X.3a.3), and $\zeta_\phi\ne\kappa\zeta_{V_{\rm eff}}$ refutes the shadow-price identification for a declared unit constant $\kappa$. For $M=24$, $\lambda_i=1$, $d_0=8$ and $A_{\mathrm{PCE}}=\Gamma_0$, the potentials $\phi(u)=\Gamma_0\bigl(u^2-24\ln(1+u)\bigr)$ and $V_{\rm eff}(u)=-\epsilon_Vu$ with $\epsilon_V>0$ both satisfy (X.12) and both select $u^*=2^{1/8}-1$ on the admissible set, while $\phi''>0=V_{\rm eff}''$ excludes (X.3a.3).

*Proof.* Item 1. Since $g_{\rm true}'(u^*)=\sum_i\lambda_i/(1+\lambda_iu^*)>0$, the linear equation $W'(u^*)+\zeta g_{\rm true}'(u^*)=0$ has the unique solution (X.3a.1). Taking $W=V_{\rm eff}$ gives (X.12). Because $g_{\rm true}$ is strictly increasing on $[0,\infty)$ by Lemma W.1, the equality constraint $\mathcal C_{\rm cap}(u)=0$ has the single solution $u^*$, which is therefore the constrained stationary point of every potential.

Item 2. If $u^*$ minimizes $W$ on $[0,u^*]$, then $W(u^*-h)\ge W(u^*)$ for small $h>0$; dividing by $h$ and letting $h\downarrow0$ gives $W'(u^*)\le0$. Since $u^*>0$, only the capacity constraint is active there, and the KKT condition $W'(u^*)+\zeta g_{\rm true}'(u^*)=0$ with $\zeta\ge0$ is the statement $\zeta_W\ge0$. If $W$ is convex and $W'(u^*)\le0$, then for $u\in[0,u^*]$,
$$
W(u)\ge W(u^*)+W'(u^*)(u-u^*)\ge W(u^*).
$$
When $W'(u^*)<0$ the second inequality is strict for $u<u^*$, and strict convexity makes the first inequality strict for $u\ne u^*$. For (W.0.1), $\phi'(u^*)=2A_{\mathrm{PCE}}u^*-\Gamma_0\sum_i\lambda_i/(1+\lambda_iu^*)$, which gives the displayed inequality; on the flat spectrum $g_{\rm true}'(u^*)=M/(1+u^*)$ and $\zeta_\phi=\Gamma_0-2A_{\mathrm{PCE}}u^*(1+u^*)/M$, the multiplier of Corollary Z.8.2a. Since $\phi'$ is strictly increasing, $\phi'(u^*)<0$ holds exactly when the unconstrained minimizer lies above $u^*$. The final sentence applies the preceding statements to $\phi$ and to $V_{\rm eff}$.

Item 3. The function $g_{\rm true}$ is $C^1$ with positive derivative, so for $c$ near $\ln d_0$ the cap point $u(c)=g_{\rm true}^{-1}(c)$ is defined and $C^1$ with $u'(c)=1/g_{\rm true}'(u(c))$. Continuity of $W'$ gives $W'(u(c))<0$ for $c$ near $\ln d_0$, and item 2, applied with capacity level $c$, makes $u(c)$ the constrained minimizer. Hence $v_W(c)=W(u(c))$, and the chain rule gives $v_W'(\ln d_0)=W'(u^*)/g_{\rm true}'(u^*)=-\zeta_W$.

Item 4. Write $X_\phi=-\mathcal G^{-1}\phi'$ and $X_V=-\mathcal G^{-1}V_{\rm eff}'$. Because $\mathcal G>0$, the two vector fields vanish at the same points and point in the same direction everywhere exactly when $\phi'$ and $V_{\rm eff}'$ have the same sign everywhere. If (X.3a.3) holds, then $X_\phi=\kappa X_V$, and for a $C^1$ curve $w$ the curve $v(t)=w(t/\kappa)$ satisfies $\dot v(t)-X_V(v(t))=\kappa^{-1}\bigl(\dot w(t/\kappa)-X_\phi(w(t/\kappa))\bigr)$, so $w$ solves the first equation exactly when $v$ solves the second. Conversely, assume this correspondence and fix $u_0\in I$. Since $X_\phi$ is continuous, the Peano existence theorem gives a solution $w$ of the first equation with $w(0)=u_0$; then $v(t)=w(t/\kappa)$ solves the second, and $X_V(u_0)=\dot v(0)=\kappa^{-1}\dot w(0)=\kappa^{-1}X_\phi(u_0)$. Hence $X_\phi=\kappa X_V$, so $\phi'=\kappa V_{\rm eff}'$ on $I$, and integration over the connected interval $I$ gives (X.3a.3). For locally Lipschitz fields the Picard--Lindelöf theorem makes solutions unique, so the correspondence of solutions is the flow identity $\Phi^\phi_t=\Phi^V_{\kappa t}$, and differentiating that identity at $t=0$ returns $X_\phi=\kappa X_V$. Substitution into (X.3a.1) gives $\zeta_\phi=\kappa\zeta_{V_{\rm eff}}$. Since $u$ is dimensionless, $\kappa=\phi'/V_{\rm eff}'$ has the units of $\phi/V_{\rm eff}$; with $\hbar=c=1$, a power is an energy squared and $\Gamma_k$ is dimensionless while a spacetime volume has mass dimension $-4$.

Item 5. Under (X.3a.3), $\phi'(u_1)V_{\rm eff}'(u_2)=\kappa V_{\rm eff}'(u_1)V_{\rm eff}'(u_2)=\phi'(u_2)V_{\rm eff}'(u_1)$, which gives the first refutation by contraposition; the second is the last statement of item 4. In the example, $1+u^*=2^{1/8}$ and $u^*<1$, so $\phi'(u^*)=\Gamma_0\bigl(2u^*-24\cdot2^{-1/8}\bigr)<0$ and $V_{\rm eff}'(u^*)=-\epsilon_V<0$. Item 1 gives (X.12) for both, item 2 gives selection of $u^*$ by the strictly convex $\phi$ and by the linear $V_{\rm eff}$, and $\phi''(u)=\Gamma_0\bigl(2+24(1+u)^{-2}\bigr)>0$ shows that $\phi'$ is not a constant multiple of $V_{\rm eff}'$. ∎

**Resolution TV-X-24-R1 (Metadata).** Exact domain: the homogeneous single-coupling truncation of Section X.6 at fixed $k$, an open coupling interval $I\supset[0,u^*]$, $C^1$ potentials, the capacity coordinate $g_{\rm true}$ with nonnegative, not identically zero spectrum, a continuous positive coupling metric $\mathcal G$, and, for the flow form of item 4, locally Lipschitz fields $\mathcal G^{-1}\phi'$ and $\mathcal G^{-1}V_{\rm eff}'$. Premises: the equality or inequality form of (X.11), the units of Appendix W and (X.10), and convexity wherever items 2 and 3 use it. Equivalence: equality of constrained stationary points; equality of stationary points and directions of motion under the identity coupling map; correspondence of solution sets after a constant time rescaling, which for locally Lipschitz fields is flow identity; equality of shadow prices under a declared unit constant. Budget: one derivative of each potential at $u^*$ and one proportionality test of $\phi'$ and $V_{\rm eff}'$ on $I$. Verifier: exact one-variable calculus and the Peano and Picard--Lindelöf theorems. Falsifier: a $C^1$ potential violating (X.12) at $u^*$, a convex potential with $W'(u^*)\le0$ whose constrained minimum lies below $u^*$, or a time-rescaled correspondence of solution sets without (X.3a.3). Provenance class: source-internal mathematics. Downstream consumers: Equations (X.10)–(X.12), Equation (W.0.1), Lemma W.1, Theorem Z.7, Corollary Z.8.2a and `TV-X-24`. Nonvacuity: the explicit pair of item 5. Theorem X.3a gives `positive-discharge` of the classification component of `TV-X-24`: every $C^1$ pair preserves the constrained stationary point, and the natural-gradient solution sets correspond under a constant time rescaling exactly under the positive affine relation (X.3a.3), with $\kappa$ of mass dimension $-2$. Item 5 gives `nonentailment` of the dynamical and shadow-price identifications from stationary-point agreement. Construction of $V_{\rm eff}^{(\Omega)}(u;k)$ from an accepted $\Gamma_k$ together with a decision of (X.3a.3) and its constant $\kappa$ (`C`), and the physical realization of $\phi$ as a power ledger on the same carrier (`R`), remain live under `TV-X-24`.

## X.7 Computational Pipeline and Renormalization Conditions

1. **Microscopic MPU cycle → LAN block:** extract $(d_0,\varepsilon)$, the active kernel size $a = 2$ on the attractor-saturating branch, and the QFI spectrum $(M,\lambda)$ (Appendix Z; Appendix W).
2. **Construct $W_k[J]$:** choose sufficient statistics consistent with symmetries; include CTP doubling (X.9) when a registered subsystem/complement reduction supplies the open CPTP branch of Section X.5.
3. **Legendre transform → $\Gamma_k$:** enforce background invariances; use background‑field method for gauge/gravity; add regulator $R_k$ and integrate (X.4).
4. **Renormalization conditions:** for $U(1)$, impose the unit Predictive-Ward branch of Theorem Z.14 to obtain $\kappa^*_{\mathrm{bulk}}=1$. Supply the microscopic interface-response coefficient and the bounded-$C^2$ response certificate of Theorem Z.17 to obtain $\delta\kappa=-c_{\mathrm{int}}(a/d_0)u^*/\sqrt{K_0}+O(u^{*2})$; the numerical Appendix Z branch additionally takes $c_{\mathrm{int}}=1$. Determine $G(k)$ through the corresponding Appendix E area-law branch.
5. **Predictions:** evaluate $V_{\rm eff}$ and stationarity (X.10)–(X.12); run $k\downarrow 0$ and compare with protocols in Section 13.



## X.8 Summary of Correspondences

PU's predictive geometry, coarse-graining, gauge normalization, gravitational response, open dynamics, and capacity constraint each have a corresponding effective-action description.

### Technical correspondence ledger

* **Predictive geometry ↔ response:** On the exponential-family/LAN branch of Proposition X.1, the source-coordinate Fisher kernel agrees with the connected kernel $\mathcal{G}=\delta^2W$; on its regular locally invertible sector, $\Gamma^{(2)}=\mathcal{G}^{-1}$ by Equation (X.3). Identifying this kernel with the Appendix D adaptation metric requires the common-form bridge of Theorem X.9.6b.
* **PU RG ↔ FRG:** the KL-monotone coarse-graining functional $c(b)$ in Appendix D and the effective-action flow (X.4) are related only on a branch satisfying the common-form, regulator, and coarse-graining identification hypotheses of Theorem K.10.7.
* **Gauge normalization:** $u=g_e^2$ and $\alpha_{\mathrm{em}}=u/(4\pi\kappa)$ by (X.6). On the unit Predictive-Ward branch, Theorem Z.14 gives $\kappa^*_{\mathrm{bulk}}=1$. On the bounded-$C^2$ branch, operative Theorem Z.17 gives $\kappa_{\mathrm{eff}}=1-c_{\mathrm{int}}(a/d_0)u^*/\sqrt{K_0}+O(u^{*2})$, with $c_{\mathrm{int}}>0$, while the capacity branch gives $u^*=8^{1/24}-1$. On the additional unit-interface-response branch $c_{\mathrm{int}}=1$ and the democratic visible-response, curvature-response, projection, and transport branches of Theorems Z.24–Z.26, the registered core expression is $\alpha^{-1}_{0}=\frac{4\pi}{u^*}-\frac{\pi}{\sqrt{K_0}}+\frac{\pi u^*}{24\sqrt{K_0}}\operatorname{sinc}(u^*)=137.03609205522863\ldots$. The comparison row $\alpha^{-1}_{\mathrm{cert}}=\alpha^{-1}_{0}+R_\alpha$ additionally requires Definition Z.27.11a and Theorem Z.27.11j.1.
* **Constraint-coupling duality:** in regular constrained PCE branches, active admissibility constraints carry KKT shadow prices; canonical couplings are the corresponding normalized stiffness or inverse-stiffness images (Theorem X.8c; Appendix Z, Corollary Z.8.2a).
* **Gravity:** Equation (X.7) yields the Section 12 Einstein branch only with its metric-only locality, second-order field equations, retained-horizon Wald matching, local KMS/Clausius input, and conserved Appendix B source. The Appendix E density-and-saturation branch defines $G_{\mathrm{op}}$; its identification with measured $G$ requires a separate calibration. Scale dependence uses the independent Appendix I response branch.
* **Open dynamics:** on a registered open subsystem with a CPTP reduction and the source/locality hypotheses of Appendix F, the CTP functional (X.9) encodes its response and noise. The KMS fluctuation-dissipation relation additionally requires the thermal KMS and compatible-compression hypotheses of Theorem X.5c.2 and Corollary X.5c.3.
* **Capacity saturation:** On the registered flat-spectrum capacity branch, Equation (X.11) constrains $u$. Relating $\phi(u)$ to $V_{\rm eff}$ requires the independently stipulated homogeneous single-coupling objective bridge of Section X.6; only that combined truncation permits the stationarity equation (X.12).


**Theorem X.8a (Shared Information-Geometric Control of Response, RG, and Perspective Transport).** Assume the regularity, exponential-family, and local-asymptotic-normality hypotheses of Proposition X.1, the unit Predictive-Ward branch of Theorem X.3, the renormalization-PCE correspondence branch of Theorem K.10.7, and the Bakry-Émery lower bound of Equation M.5c. Then:

1. the connected response kernel $\mathcal G$ equals the Fisher kernel on the regular statistical sector and $\Gamma^{(2)}=\mathcal G^{-1}$;
2. the quadratic gauge kernel has unity normalization on the unit Predictive-Ward branch;
3. the FRG flow is a structural continuum representative of PCE-selected compression on the Appendix-K correspondence branch, not a derivation of the PCE functional from MPU dynamics; and
4. the Appendix-M perspective semigroup is $W_2$-contractive.

These are four branch-qualified realizations of information-geometric control; no identity of their state spaces or generators follows without the finite closed-form bridge of Section X.9.6.

*Proof.* Proposition X.1 gives $\Gamma^{(2)}\mathcal G=I$ and identifies $\mathcal G$ with Fisher information under its statistical hypotheses. The unit Predictive-Ward hypothesis permits Theorem X.3 to give item 2. Theorem K.10.7 gives item 3 with its stated correspondence status. Equations M.5a–M.5c and the Bakry-Émery bound give item 4. The final scope statement follows because these results establish a shared structural class, while Section X.9.6 supplies the additional common-operator hypotheses. ∎

**Corollary X.8a.1 (Gradient-Flow Compatibility Across Appendices).** Under the hypotheses of Theorem X.8a, the Appendix D adaptation flow, the Appendix K/X FRG compression flow, and the Appendix M perspective diffusion are branchwise metric-controlled evolutions belonging to the same structural information-geometric class. No common state space, metric, or generator is implied unless the additional finite common-operator bridge of Section X.9.6 is supplied.

*Proof.* The four conclusions of Theorem X.8a establish the stated branchwise structural class. Its final scope clause excludes identification of the underlying state spaces or generators without the Section X.9.6 bridge. ∎

**Remark X.8a.2 (Status of the Stronger Identity Claim).** Theorem X.8a proves a shared information-geometric control structure at the level of a common structural class. Section X.9.6 gives the finite-branch operator statement: after the regular response, RG, and perspective sectors are represented as closed quadratic forms on one direct-sum predictive Hilbert module, their generators are compressions of a single self-adjoint predictive operator. The statement is exact on that finite closed-form branch and inherits precisely the regularity hypotheses stated there.

**Definition X.8a.2a (Čencov-Petz Natural QFI Control Datum).** A regular finite-response branch carries a Čencov-Petz natural QFI control datum when the retained predictive update category has:

1. finite stochastic kernels on classical retained sectors and CPTP kernels on quantum retained sectors;

2. PPI-admissible coarse-graining maps $C$ closed under composition with update kernels $K$;

3. a response metric $g$ that is monotone under every retained stochastic or CPTP kernel:
$$
g_{\Phi(\rho)}(\Phi_*X,\Phi_*X)\le g_\rho(X,X);
\tag{X.8a.2a.1}
$$

4. classical restriction equal to the Fisher metric with the normalization of Proposition X.1;

5. quantum restriction belonging to the normalized symmetric Petz monotone family on the retained quantum sector, with PCE-minimality among normalized CPTP-monotone metrics:
$$
g_\rho(X,X)\le g'_\rho(X,X)
\quad
\text{for every retained tangent }X
\tag{X.8a.2a.2}
$$
whenever $g'$ is another normalized symmetric CPTP-monotone metric inducing the same finite response-presheaf order. Equivalently, on the QFI-active subspace the selected normalized representative is the SLD quantum Fisher metric
$$
g_{\rho}^{\mathrm{SLD}}(X,X)
=
\operatorname{Tr}\!\left(X\,\mathcal L_\rho^{-1}(X)\right),
\qquad
\mathcal L_\rho(A):=\frac{\rho A+A\rho}{2},
\qquad
\mathcal G=\mathcal K^{-1}.
\tag{X.8a.2a.3}
$$
The associated Bures line element is $g_\rho^{\mathrm{Bures}}=\tfrac14g_\rho^{\mathrm{SLD}}$.

6. compatibility with PCE compression, meaning the compressed metric is the pushforward metric on the quotient of operationally equivalent predictive states;

7. sector images $F_\alpha$ constructed as quotient-pushforward functors on branch-preserving kernels.

**Theorem X.8a.2b (Čencov-Petz Natural Control Upgrade).** On a branch carrying the Čencov-Petz natural QFI control datum, the shared control structure of Theorem X.8a is unique up to the QFI scale already fixed by the branch. In particular, response, PCE/RG compression, and perspective transport are natural images of the same predictive update kernel:
$$
F_\alpha(C\circ K)=F_\alpha(C)\circ F_\alpha(K)
\tag{X.8a.2b.1}
$$
for every admissible coarse-graining $C$, update kernel $K$, and retained sector image $F_\alpha$.

*Proof.* On classical retained sectors, condition 4 of Definition X.8a.2a already requires the Fisher metric with the normalization of Proposition X.1. Monotonicity under the retained kernels alone is not used to infer uniqueness over all classical stochastic categories; the classical metric is explicit branch data.

On quantum retained sectors, Petz monotonicity classifies CPTP-monotone quantum metrics by normalized symmetric operator-monotone functions $f$ through
$$
g_\rho^f(X,X)
=
\sum_{i,j}c_f(p_i,p_j)|X_{ij}|^2,
\qquad
c_f(x,y)=\frac{1}{y f(x/y)}
\tag{X.8a.2b.2}
$$
for a faithful finite-dimensional state $\rho=\sum_i p_i|i\rangle\langle i|$ and a self-adjoint traceless tangent $X$, with $f(1)=1$ and $f(t)=t f(1/t)$. For singular $\rho$, restriction to its support covers support-preserving tangents only. Along active-inactive directions, the coefficient limit is $c_f(p,0)=1/[p f(0)]$ for $p>0$; a finite limit requires $f(0):=\lim_{t\downarrow0}f(t)>0$. This condition also governs radial extension to pure states; nonregular metrics may diverge. The SLD quantum Fisher member is regular and corresponds to
$$
f_{\mathrm{SLD}}(t)=\frac{1+t}{2},
\qquad
c_{\mathrm{SLD}}(x,y)=\frac{2}{x+y}.
\tag{X.8a.2b.3}
$$
[Petz–Sudár, Theorems 3.1 and 3.3](https://arxiv.org/pdf/quant-ph/0102132) give the normalized symmetric metric kernel $c_f(x,y)=1/[y f(x/y)]$ and the pointwise SLD minimum on faithful states. Comparing an off-diagonal tangent at any eigenvalue ratio $t>0$ with $f_{\mathrm{SLD}}(t)=(1+t)/2$ therefore gives
$$
f(t)\le\frac{1+t}{2},
$$
and therefore
$$
c_f(x,y)\ge c_{\mathrm{SLD}}(x,y).
$$
Thus the SLD quantum Fisher metric is the pointwise minimal normalized CPTP-monotone metric. The conventional Bures line element is one quarter of it and obeys the same ordering after all metrics are rescaled to the same Bures convention. To apply Corollary P.6.1b.8 to a larger metric, condition (X.8a.2a.2) must be accompanied by an admissible SLD comparator preserving a separating, protocol-complete response record and all other charged ledger entries, with a strictly positive complete-cost excess for the larger metric. On that comparison branch, PCE excludes the excess; the quantum scale still comes from the declared PU QFI normalization.

PCE compression is an admissible Markov/CPTP quotient, so monotonicity and quotient compatibility force the compressed metric to be the pushforward of the same metric. Therefore the response Hessian, FRG/PCE compression kernel, and perspective drift-diffusion generator cannot choose independent control metrics. Condition 7 makes the sector images quotient-pushforward functors on the branch domain. Applying such a sector image after composing $C$ and $K$ therefore gives the same pushed-forward metric and generator as first applying the update image and then the coarse-graining image, proving (X.8a.2b.1). ∎

**Proposition X.8a.2d (Monotonicity and Naturality Admit Distinct Quantum Metrics).** The normalized symmetric Petz functions
$$
f_{\mathrm{SLD}}(t)=\frac{1+t}{2},
\qquad
f_{\mathrm{BKM}}(t)=\frac{t-1}{\ln t},
\qquad
f_{\mathrm{BKM}}(1)=1,
\tag{X.8a.2d.1}
$$
define distinct CPTP-monotone natural metrics. For
$$
\rho=\operatorname{diag}\!\left(\frac14,\frac34\right),
\qquad
X=
\begin{pmatrix}
0&1\\
1&0
\end{pmatrix},
\tag{X.8a.2d.2}
$$
Equation (X.8a.2b.2) gives
$$
g_\rho^{\mathrm{SLD}}(X,X)=4,
\qquad
g_\rho^{\mathrm{BKM}}(X,X)=4\ln3.
\tag{X.8a.2d.3}
$$
Thus CPTP monotonicity and functorial transport do not imply quantum-metric uniqueness. Definition X.8a.2a obtains uniqueness from its additional pointwise PCE-minimality condition, which selects the SLD member.

*Proof.* Both functions in (X.8a.2d.1) are normalized symmetric operator-monotone Petz functions. Their Morozova--Čencov kernels at $(x,y)=(1/4,3/4)$ are
$$
c_{\mathrm{SLD}}(x,y)=\frac{2}{x+y}=2,
\qquad
c_{\mathrm{BKM}}(x,y)
=
\frac{\ln x-\ln y}{x-y}
=2\ln3.
$$
The tangent $X$ has two unit off-diagonal entries, so summing the two ordered pairs in (X.8a.2b.2) proves (X.8a.2d.3). Since $\ln3\ne1$, the metrics differ on the same retained tangent. The ordering argument in Theorem X.8a.2b then supplies the separate minimality selection. ∎

**Corollary X.8a.2c (PCE Selection of the SLD Quantum Fisher Metric).** On a retained quantum finite-response branch satisfying Definition X.8a.2a, assume that every competing metric with strict excess on the QFI-active response quotient has an admissible SLD comparator preserving the separating, protocol-complete response record and all other charged entries, with strictly smaller complete PCE cost. Then the SLD quantum Fisher metric is the unique PCE-minimal normalized symmetric CPTP-monotone metric on that quotient. In the conventional distance normalization, the selected Bures line element is one quarter of this metric.

*Proof.* The Petz classification and maximality of the arithmetic mean give
$$
g_\rho^{\mathrm{SLD}}(X,X)\le g_\rho^f(X,X)
$$
for every normalized symmetric CPTP-monotone metric $g^f$ and retained tangent $X$. Under the stated comparator hypothesis, any strict excess is accompanied by a strict complete-cost reduction preserving the separating, protocol-complete response record and the other charged entries. Corollary P.6.1b.8 therefore excludes that competitor. Equality on all retained tangents identifies the quotient metric. Multiplication by $1/4$ gives the conventional Bures line element. ∎

**Definition X.8a.3 (Fractal Decimation Response Operator).** A fractal decimation response operator on a finite regular response branch is a differentiable map
$$
\mathcal R_{\mathrm{dec}}:\mathcal K\to\mathcal K
\tag{X.8a.3}
$$
on a finite-dimensional cone $\mathcal K$ of retained response kernels together with a branch scaling sequence
$$
t_n=\ell_n^{d_w}\quad\text{with }\ell_n\downarrow0,
\quad
\text{or, more generally, a fixed sequence }t_n\downarrow0
\tag{X.8a.4}
$$
such that:

1. $\mathcal R_{\mathrm{dec}}$ preserves positivity and the PCE admissibility constraints;

2. fixed points of $\mathcal R_{\mathrm{dec}}$ are exactly the PCE-stationary response kernels of the branch;

3. the linearization at a fixed point $K_*$,
$$
D\mathcal R_{\mathrm{dec}}\vert_{K_*},
\tag{X.8a.5}
$$
exists on the retained tangent cone;

4. the branch supplies a determinant-line normalization under which the finite logarithmic determinant
$$
\operatorname{Tr}_{\mathrm{fin}}
\log
\left(
1+D\mathcal R_{\mathrm{dec}}\vert_{K}
\right)
\tag{X.8a.6}
$$
is defined on the branch region used for compression flow;

**Relative Gelfand-Yaglom prefactor certificate.** In four retained dimensions the determinant prefactor is used only through $\mathfrak GY_U^{(4)}$. The record supplies the paired operators $(L_U,L_0)$, boundary conditions, subtraction or relative heat-kernel convention, anomaly-cancellation check, zero-mode and negative-mode bookkeeping, radial ODE normalization, angular-design comparison, measure normalization, and a residual tail estimate. The object certified is the relative quantity, not an absolute scheme-free determinant.

5. the rescaled iterates converge on retained observables:
$$
\lim_{n\to\infty}
\frac{\mathcal R_{\mathrm{dec}}^n-I}{t_n}
=
\mathcal L_{\mathrm{PCE}}.
\tag{X.8a.7}
$$

The scaling sequence in (X.8a.4), the branch symmetrization convention, and the determinant-line normalization are part of the branch data. Without them, (X.8a.6)-(X.8a.7) are not asserted. There is also a degeneracy restriction: if (X.8a.7) is convergence of maps on the entire retained finite-dimensional space and $\mathcal R_{\mathrm{dec}}$ is continuous there, then $t_n\to0$ implies $\mathcal R_{\mathrm{dec}}^n(x)\to x$. Continuity gives $\mathcal R_{\mathrm{dec}}^{n+1}(x)\to\mathcal R_{\mathrm{dec}}(x)$, while the shifted sequence also tends to $x$. Hence $\mathcal R_{\mathrm{dec}}=I$ and $\mathcal L_{\mathrm{PCE}}=0$ on that space. A nonzero diffusion generator therefore requires a separately specified family of resolution-dependent update maps and its scaling-limit certificate; it is not constructed by iterating one such map in (X.8a.7).

**Theorem X.8a.4 (Decimation-Operator Criterion for Shared Control).** If a branch supplies a fractal decimation response operator in the sense of Definition X.8a.3 and also certifies that the retained response Hessian, compression determinant, and rescaled adaptation flow are represented by the following three finite images of that operator, then the three structures in Theorem X.8a are specializations of one finite recursive operator:

1. the Fisher/connected-response kernel is the branch-normalized symmetric part of the fixed-point linearization,
$$
\mathcal G
=
\operatorname{Sym}_{\mathrm{br}}
\left(D\mathcal R_{\mathrm{dec}}\vert_{K_*}\right);
\tag{X.8a.8}
$$

2. the FRG/PCE compression trace is the logarithmic determinant flow generated by (X.8a.6);

3. the Appendix M drift-diffusion generator is the scaled iterate generator (X.8a.7).

Thus Theorem X.8a is upgraded from shared information-geometric control to a single recursive-operator realization only on branches where $\mathcal R_{\mathrm{dec}}$ and the scaling sequence $t_n$ are fixed. Without such data, Theorem X.8a retains exactly its stated branch status.

*Proof.* At a PCE-stationary fixed point $K_*$, the first variation of the response potential vanishes. Under the stated branch certificate, the second response form is represented by the linearization of the response update. Taking its branch-normalized symmetric part gives the Fisher/connected-response kernel on the LAN branch, proving item 1.

For item 2, the determinant-line normalization certificate says that a finite compression step changes the determinant-line response by the trace of the logarithm of the finite linearized update. This is exactly (X.8a.6), the finite version of the trace term appearing in the FRG/PCE correspondence branch.

For item 3, the convergence statement (X.8a.7) is the definition of the generator of the rescaled iteration semigroup under the branch scaling $t_n$. Since the same $\mathcal R_{\mathrm{dec}}$ supplies the linearization, determinant flow, and rescaled iterate generator, response, compression flow, and drift-diffusion are images of the same finite recursive operator on the stated branch. ∎

**Proposition X.8a.4a (Dyadic Flow-Map Decimation Family on a Finite Exponential Branch).** Let $\mathcal X$ be a finite outcome set and $T:\mathcal X\to\mathbb R^n$ a minimal statistic, meaning that the differences $T(x)-T(x')$ span $\mathbb R^n$. Take as retained response kernels the strictly positive laws
$$
p_\theta(x)=\exp\bigl(\theta\cdot T(x)-W(\theta)\bigr),
\qquad
W(\theta)=\ln\sum_{x\in\mathcal X}e^{\theta\cdot T(x)},
\qquad
\theta\in\mathbb R^n,
$$
fix $\theta_*\in\mathbb R^n$, and let the PCE potential be $V(\theta)=D_{\mathrm{KL}}(p_{\theta_*}\Vert p_\theta)$. Let $\Phi_t$ be the flow of $\dot\theta=-\nabla V(\theta)$, fix $t_0>0$, and set
$$
t_j=2^{-j}t_0,
\qquad
\mathcal R_j:=\Phi_{t_j}
\qquad(j\ge0).
\tag{X.8a.4a.1}
$$
Let $\mathcal F_*=W''(\theta_*)$, the Fisher information at $\theta_*$, which is the connected response kernel of Proposition X.1 in the natural source coordinates, and let $f_1,\dots,f_n$ be its eigenvalues. Then:

1. $\Phi_t$ is a global flow of $C^1$ diffeomorphisms of the positive-kernel chart $\mathbb R^n$, and $\mathcal R_{j+1}\circ\mathcal R_{j+1}=\mathcal R_j$ for every $j$;
2. $\operatorname{Fix}(\mathcal R_j)=\{\theta_*\}$ for every $j$, and $\theta_*$ is the unique PCE-stationary kernel;
3. $(\mathcal R_j-I)/t_j\to-\nabla V$ uniformly on $\mathbb R^n$, and $\mathcal R_j^{\,k}=\Phi_{kt_j}$ for every $k\ge0$, so the rescaled iterates have generator $\mathcal L_{\mathrm{PCE}}=-\nabla V$;
4. $D\mathcal R_j(\theta_*)=e^{-t_j\mathcal F_*}$ is symmetric positive definite and
$$
\lim_{j\to\infty}\frac{I-D\mathcal R_j(\theta_*)}{t_j}=\mathcal F_*;
\tag{X.8a.4a.2}
$$
5. $\ln\det D\mathcal R_j(\theta_*)=-t_j\operatorname{Tr}\mathcal F_*$, and the finite logarithmic determinant (X.8a.6) at $\theta_*$ is
$$
\operatorname{Tr}\log\bigl(1+D\mathcal R_j(\theta_*)\bigr)
=
\sum_{i=1}^n\ln\bigl(1+e^{-t_jf_i}\bigr)
=
n\ln2-\frac{t_j}{2}\operatorname{Tr}\mathcal F_*+O(t_j^2);
\tag{X.8a.4a.3}
$$
6. the response kernel (X.8a.4a.2), the linearized generator $D\mathcal L_{\mathrm{PCE}}(\theta_*)=-\mathcal F_*$ and the determinant rate $-\operatorname{Tr}\mathcal F_*$ are functions of the single operator $\mathcal F_*$, so they commute pairwise; the response kernel and the linearized generator determine each other, and each determines the determinant rate.

Reading $\operatorname{Sym}_{\mathrm{br}}$ in (X.8a.8) as the limit (X.8a.4a.2), the family (X.8a.4a.1) is a separately specified family of resolution-dependent update maps with its scaling-limit certificate in the sense of the remark after Definition X.8a.3. On this branch it supplies the response image (X.8a.8), the determinant image (X.8a.6) and the rescaled-iterate generator $-\nabla V$, which is the deterministic PCE drift. The identification of this generator with the Appendix M drift-diffusion generator (M.5a), whose diffusion term $\Delta_\Sigma$ acts on the perspective manifold, is the further certificate required by item 3 of Theorem X.8a.4.

*Proof.* For exponential families, $V(\theta)=W(\theta)-W(\theta_*)-(\theta-\theta_*)\cdot\nabla W(\theta_*)$, so $\nabla V=\nabla W-\nabla W(\theta_*)$ and $V''=W''$. The function $W$ is smooth, $\nabla W(\theta)=\mathbb E_\theta T$ lies in the convex hull of the finite set $T(\mathcal X)$, and $W''(\theta)=\operatorname{Cov}_\theta(T)\preceq(\max_x\lVert T(x)\rVert^2)I$. Hence $\nabla V$ is bounded and globally Lipschitz, and the smooth vector field $-\nabla V$ has a global flow of $C^1$ diffeomorphisms; every $\theta$ gives a strictly positive kernel. If $v\cdot\operatorname{Cov}_\theta(T)v=0$, then $v\cdot T$ is constant on the full support $\mathcal X$, and minimality forces $v=0$. Thus $V$ is strictly convex and $\theta_*$ is its unique critical point. The group law $\Phi_s\circ\Phi_s=\Phi_{2s}$ gives item 1.

The point $\theta_*$ is a zero of the vector field. If $\Phi_t(\theta)=\theta$ for some $t>0$, then $\frac{d}{ds}V(\Phi_s\theta)=-\lVert\nabla V(\Phi_s\theta)\rVert^2\le0$ and $V(\Phi_t\theta)=V(\theta)$, so $\nabla V$ vanishes on the orbit segment, in particular at $\theta$; hence $\theta=\theta_*$. This proves item 2.

Let $B=\sup\lVert\nabla V\rVert$ and let $\ell$ be the Lipschitz constant of $\nabla V$. From $\Phi_t(\theta)-\theta=-\int_0^t\nabla V(\Phi_s\theta)\,ds$ and $\lVert\Phi_s\theta-\theta\rVert\le sB$,
$$
\left\lVert\frac{\Phi_t(\theta)-\theta}{t}+\nabla V(\theta)\right\rVert\le\frac{\ell Bt}{2}
$$
for every $\theta$. The group law gives $\mathcal R_j^{\,k}=\Phi_{kt_j}$, proving item 3.

Along the constant solution $\theta_*$ the variational equation is $\frac{d}{dt}D\Phi_t(\theta_*)=-W''(\theta_*)D\Phi_t(\theta_*)$ with $D\Phi_0=I$, so $D\Phi_t(\theta_*)=e^{-t\mathcal F_*}$. Since $\mathcal F_*$ is symmetric positive definite, so is $e^{-t_j\mathcal F_*}$, and $(I-e^{-t\mathcal F_*})/t\to\mathcal F_*$ as $t\downarrow0$. This proves item 4. The identity $\det e^{-t\mathcal F_*}=e^{-t\operatorname{Tr}\mathcal F_*}$ and the eigenvalues $1+e^{-tf_i}$ of $1+e^{-t\mathcal F_*}$ give item 5, with $\ln(1+e^{-y})=\ln2-y/2+O(y^2)$. Finally $D(-\nabla V)(\theta_*)=-W''(\theta_*)=-\mathcal F_*$; the three displayed images are $\mathcal F_*$, $-\mathcal F_*$ and $-\operatorname{Tr}\mathcal F_*$, which proves item 6. ∎

**Resolution TV-X-04-R1 (Metadata).** Exact domain: minimal finite-outcome exponential families in the natural chart, with Kullback--Leibler PCE potential, gradient flow in the natural coordinates and the dyadic family (X.8a.4a.1). Premises: finite $\mathcal X$, minimal $T$, the Euclidean metric of the natural chart, a fixed stationary kernel $\theta_*$ and a fixed base step $t_0>0$. Equivalence: changes $T\mapsto OT+c$ of the statistic with $O$ orthogonal and $c\in\mathbb R^n$, which induce the isometry $\theta\mapsto O\theta$ of the natural chart and conjugate $\Phi_t$, the maps $\mathcal R_j$ and $\mathcal F_*$ by $O$; the scaling $T\mapsto2T$ multiplies $\mathcal F_*$, and the Euclidean gradient field measured against the transported one, by $4$, so the Euclidean structure of the natural chart is part of the datum. Budget: one statistic, one stationary kernel and one base step. Verifier: the Bregman form of $V$, the bounds $\nabla W\in\operatorname{conv}T(\mathcal X)$ and $W''\preceq(\max_x\lVert T(x)\rVert^2)I$, the variational equation at $\theta_*$, and the determinant identity. Falsifier: a second fixed point of some $\mathcal R_j$, failure of $\mathcal R_{j+1}^2=\mathcal R_j$, or a linearization at $\theta_*$ different from $e^{-t_j\mathcal F_*}$. Provenance class: source-internal finite construction. Downstream consumers: Definition X.8a.3, Theorem X.8a.4, Theorem X.8a and `TV-X-04`. Nonvacuity: the Bernoulli family $\mathcal X=\{0,1\}$, $T(x)=x$, for which $\mathcal F_*=p_*(1-p_*)$ with $p_*=p_{\theta_*}(1)$. This is `positive-discharge` of the construction of a recursive operator family with its scaling sequence and of the pairwise commutation of the response-Hessian, determinant and PCE-drift images on the stated class. Population of the actual PU retained kernel cone and PCE potential, the identification of the rescaled generator with the Appendix M drift-diffusion generator (M.5a), the determinant-line normalization with the relative Gelfand--Yaglom prefactor record, and the physical realization remain `M+C+R` under `TV-X-04`.

**Definition X.8a.5a (Predictive Free-Energy Inverse-Hessian Datum).** A finite predictive free-energy inverse-Hessian datum on a regular finite-mode branch is a tuple
$$
\mathfrak B_{\mathrm{PU}}
=
(\mathscr H_{\mathrm{PU}},W,J_*,\Pi_{\mathrm{field}},\Pi_{\mathrm{RG}},\Pi_{\Sigma},\Pi_{\mathrm{PCE}},R_k)
\tag{X.8a.5a.1}
$$
with the following finite entries.

1. $\mathscr H_{\mathrm{PU}}=\mathscr H_{\mathrm{field}}\oplus\mathscr H_{\mathrm{RG}}\oplus\mathscr H_{\Sigma}\oplus\mathscr H_{\mathrm{PCE}}$ is the closed predictive Hilbert module of Definition X.9.6a.
2. $W:\mathcal U\to\mathbb R$ is a twice differentiable strictly convex generating functional on a convex open subset $\mathcal U$ of the dual chart of $\mathscr H_{\mathrm{PU}}$, and $J_*\in\mathcal U$ is the retained branch point.
3. The connected response Hessian $W''[J_*]$ is strictly positive and invertible on the retained finite-mode sector, and its inverse
$$
\mathfrak L_W
:=
(W''[J_*])^{-1}
\tag{X.8a.5a.2}
$$
represents the closed form of (X.9.6.1), equivalently $\mathfrak L_W=\mathfrak L_{\mathrm{PU}}$ on the branch.
4. $\Pi_\alpha$ are the orthogonal sector projections of Definition X.9.6a, satisfying $\Pi_\alpha^2=\Pi_\alpha=\Pi_\alpha^*$ and $\sum_\alpha\Pi_\alpha=I$ on the form domain.
5. $R_k$ is a positive regulator on $\mathscr H_{\mathrm{RG}}$ with $\partial_kR_k$ trace class on the retained RG sector for the interval of $k$ used.

**Theorem X.8a.5 (Single Inverse-Hessian Realization of the Four Operator Sectors).** Let $\mathfrak B_{\mathrm{PU}}$ be a predictive free-energy inverse-Hessian datum satisfying the form-compatibility hypotheses of Theorem X.9.6b. Define the bilinear form
$$
\mathcal Q_W(u,v)
:=
\langle u,\mathfrak L_W v\rangle
\quad
\text{for }u,v\in\mathcal D_{\mathrm{PU}}.
\tag{X.8a.5.1}
$$
Then the four sector operators of Theorem X.9.6b are obtained from the single inverse Hessian $\mathfrak L_W=(W''[J_*])^{-1}$ by the following deterministic construction:
$$
\Gamma^{(2)}
=
\Pi_{\mathrm{field}}\mathfrak L_W\Pi_{\mathrm{field}}^*
\quad
\text{on }\mathscr H_{\mathrm{field}},
\tag{X.8a.5.2}
$$
$$
\partial_k\Gamma_k
=
\frac12
\operatorname{STr}
\left[
\left(\Pi_{\mathrm{RG}}\mathfrak L_W\Pi_{\mathrm{RG}}^*+R_k\right)^{-1}
\partial_kR_k
\right],
\tag{X.8a.5.3}
$$
$$
\mathcal L_\Sigma
=
-\Pi_\Sigma\mathfrak L_W\Pi_\Sigma^*
\quad
\text{on }\mathscr H_\Sigma,
\tag{X.8a.5.4}
$$
and
$$
\dot x
=
-\nabla_{\Pi_{\mathrm{PCE}}\mathfrak L_W\Pi_{\mathrm{PCE}}^*}V(x)+\text{ND-RID noise}
\quad
\text{on }\mathscr H_{\mathrm{PCE}}.
\tag{X.8a.5.5}
$$
Equations (X.8a.5.2)-(X.8a.5.5) are sector projection, regulator-resolvent functional calculus, sign convention, and natural-gradient passage applied to the same finite inverse Hessian.

*Proof.* Proposition X.1 identifies $W''[J_*]$ with the connected response kernel $\mathcal G$ on the regular branch and identifies the effective-action Hessian $\Gamma^{(2)}$ with its inverse on the same sector. Definition X.8a.5a therefore uses the inverse Hessian $\mathfrak L_W=(W''[J_*])^{-1}$, not $W''[J_*]$ itself, as the closed operator representing the branch form. Item 3 of Definition X.8a.5a identifies this operator with $\mathfrak L_{\mathrm{PU}}$ in (X.9.6.1). Applying Theorem X.9.6b to that same operator gives the field compression (X.8a.5.2), the RG regulator-resolvent trace (X.8a.5.3), the negative perspective generator (X.8a.5.4), and the PCE natural-gradient flow (X.8a.5.5). ∎

**Corollary X.8a.5b (Naturality of the Single Inverse-Hessian Realization).** On the branch carrying both the predictive free-energy inverse-Hessian datum of Definition X.8a.5a and the Čencov-Petz natural QFI control datum of Definition X.8a.2a, assume in addition that the four sector constructions of Theorem X.8a.5 are identified with the quotient-pushforward functors in item 7 of Definition X.8a.2a, including their action on every admissible coarse-graining and update morphism. Then they satisfy
$$
F_\alpha(C\circ K)
=
F_\alpha(C)\circ F_\alpha(K),
\qquad
\alpha\in\{\mathrm{field},\mathrm{RG},\Sigma,\mathrm{PCE}\},
\tag{X.8a.5b.1}
$$
for every PPI-admissible coarse-graining $C$ and update kernel $K$ in the retained branch domain.

*Proof.* Theorem X.8a.2b gives the naturality square (X.8a.2b.1) for the Čencov-Petz control datum. Theorem X.8a.5 identifies each $F_\alpha$ as projection, regulator-resolvent calculus, sign convention, or natural-gradient passage applied to the same branch operator $\mathfrak L_W$. The additional functor identification states that these constructions, on both objects and morphisms, are the quotient-pushforward sector functors required in item 7 of Definition X.8a.2a. Therefore (X.8a.5b.1) is the specialization of (X.8a.2b.1) to the inverse-Hessian realization. ∎

**Corollary X.8a.5c (No Additional Independent Operator Sector from the Same Datum).** Let a competing bridge law assign one of the four sector operators by data not derivable as projection, regulator-resolvent calculus, sign convention, or natural-gradient passage applied to $\mathfrak L_W$ on the same branch. Then the competing law is not a consequence of the predictive free-energy inverse-Hessian datum alone. It is admissible only as a different branch datum, or else it fails the form-compatibility hypothesis of Theorem X.9.6b or the naturality square (X.8a.5b.1).

*Proof.* By Theorem X.9.6b, every retained response, RG, perspective, and PCE operator satisfying the closed-form compatibility hypotheses is an image of the unique self-adjoint operator $\mathfrak L_{\mathrm{PU}}$. By Definition X.8a.5a this operator is $\mathfrak L_W$. Therefore a sector assignment outside the displayed image set is not determined by the same finite datum. If it is retained, it must add or change branch data; if it is not added as new data, it contradicts either the form-compatibility theorem or the functorial naturality condition. ∎

**Corollary X.8a.5d (Quadratic Nonemptiness of the Inverse-Hessian Branch).** Let
$$
\mathscr H_{\mathrm{PU}}
=
\mathscr H_{\mathrm{field}}\oplus
\mathscr H_{\mathrm{RG}}\oplus
\mathscr H_{\Sigma}\oplus
\mathscr H_{\mathrm{PCE}}
$$
be finite-dimensional, and let $\mathfrak L_{\mathrm{PU}}$ be any strictly positive self-adjoint operator satisfying the form-compatibility hypotheses of Theorem X.9.6b. On the inner-product identification of $\mathscr H_{\mathrm{PU}}$ with its dual, set
$$
W[J]
=
\frac12\langle J,\mathfrak L_{\mathrm{PU}}^{-1}J\rangle,
\qquad
J_*=0.
\tag{X.8a.5d.1}
$$
Together with the orthogonal sector projections and any positive finite-dimensional regulator satisfying item 5 of Definition X.8a.5a, this is a predictive free-energy inverse-Hessian datum and
$$
(W''[J_*])^{-1}
=
\mathfrak L_{\mathrm{PU}}.
\tag{X.8a.5d.2}
$$
Consequently the four constructions in Theorem X.8a.5 have a nonempty quadratic realization for every compatible strictly positive finite branch operator.

*Proof.* Strict positivity makes $\mathfrak L_{\mathrm{PU}}^{-1}$ strictly positive, so (X.8a.5d.1) is a twice differentiable strictly convex functional on the full dual chart. Its constant Hessian is $\mathfrak L_{\mathrm{PU}}^{-1}$, proving (X.8a.5d.2). The direct-sum projections satisfy item 4 of Definition X.8a.5a, and in finite dimension every operator used in the regulator trace is trace class. The assumed form compatibility supplies item 3. All entries of the datum are therefore populated, and Theorem X.8a.5 gives the four sector images. ∎

**Proposition X.8a.5e (Sector Decomposition of Compatible Finite Master Operators).** Let $\mathscr H_{\mathrm{PU}}=\bigoplus_\alpha\mathscr H_\alpha$, $\alpha\in\{\mathrm{field},\mathrm{RG},\Sigma,\mathrm{PCE}\}$, be finite-dimensional with orthogonal sector projections $\Pi_\alpha$, and let $\mathfrak L$ be self-adjoint on $\mathscr H_{\mathrm{PU}}$. The following are equivalent: (a) every summand reduces $\mathfrak L$, as Theorem X.9.6b requires; (b) $\mathfrak L\Pi_\alpha=\Pi_\alpha\mathfrak L$ for every $\alpha$; (c) $\mathfrak L=\bigoplus_\alpha\mathfrak L_\alpha$ with $\mathfrak L_\alpha:=\Pi_\alpha\mathfrak L\Pi_\alpha^*$. Under these conditions:

1. $\mathfrak L$ is strictly positive exactly when every $\mathfrak L_\alpha$ is strictly positive, and then $\Pi_\alpha\mathfrak L^{-1}\Pi_\alpha^*=\mathfrak L_\alpha^{-1}$;

2. the quadratic generating functional of Corollary X.8a.5d splits as
$$
W[J]=\sum_\alpha\frac12\bigl\langle\Pi_\alpha J,\mathfrak L_\alpha^{-1}\Pi_\alpha J\bigr\rangle,
\qquad
\Gamma[\Phi]=\sum_\alpha\frac12\bigl\langle\Pi_\alpha\Phi,\mathfrak L_\alpha\Pi_\alpha\Phi\bigr\rangle,
\tag{X.8a.5e.1}
$$
and the Legendre transform of the field-source restriction of $W$ has Hessian $\mathfrak L_{\mathrm{field}}$, which is (X.8a.5.2);

3. the map $(\mathfrak L_{\mathrm{field}},\mathfrak L_{\mathrm{RG}},\mathfrak L_\Sigma,\mathfrak L_{\mathrm{PCE}})\mapsto\bigoplus_\alpha\mathfrak L_\alpha$ is a bijection from quadruples of strictly positive self-adjoint sector operators onto the strictly positive self-adjoint operators reduced by every summand;

4. each of (X.8a.5.2)--(X.8a.5.5) depends on $\mathfrak L$ only through its own block, so replacing one block changes that sector image and leaves the other three unchanged.

Consequently, on the finite branch a populated quadruple of sector forms has a compatible single inverse-Hessian datum exactly when each populated form is strictly positive and satisfies its sector-internal conditions, namely the Dirichlet property on $\mathscr H_\Sigma$, item 5 of Definition X.8a.5a for the regulator, and the identification of the PCE form with the Appendix D response metric. The single-operator realization imposes no relation among the four sector operators.

*Proof.* In finite dimension a subspace with orthogonal projection $\Pi$ reduces $\mathfrak L$ exactly when $\mathfrak L$ maps $\operatorname{ran}\Pi$ and $\operatorname{ran}\Pi^\perp$ into themselves, which is $\Pi\mathfrak L=\mathfrak L\Pi$; this is (a)$\Leftrightarrow$(b). If (b) holds, then $\Pi_\alpha\mathfrak L\Pi_\beta=\mathfrak L\Pi_\alpha\Pi_\beta=0$ for $\alpha\ne\beta$, so $\mathfrak L=\sum_{\alpha,\beta}\Pi_\alpha\mathfrak L\Pi_\beta=\bigoplus_\alpha\mathfrak L_\alpha$; a direct sum commutes with every $\Pi_\alpha$, proving (b)$\Leftrightarrow$(c). The spectrum of a direct sum is the union of the block spectra, and its inverse is the direct sum of the block inverses, proving item 1. Item 1 turns $W[J]=\frac12\langle J,\mathfrak L^{-1}J\rangle$ into the first sum in (X.8a.5e.1); the supremum defining the Legendre transform is attained at $J=\mathfrak L\Phi$ with value $\frac12\langle\Phi,\mathfrak L\Phi\rangle$, which splits in the same way. Restricting the sources to $\mathscr H_{\mathrm{field}}$ leaves $\frac12\langle J_{\mathrm{field}},\mathfrak L_{\mathrm{field}}^{-1}J_{\mathrm{field}}\rangle$, whose Legendre transform has Hessian $\mathfrak L_{\mathrm{field}}$. The blocks are recovered from $\bigoplus_\alpha\mathfrak L_\alpha$ by compression, and every strictly positive operator reduced by all summands has the form (c) with strictly positive blocks, proving item 3. Equations (X.8a.5.2)--(X.8a.5.5) use $\mathfrak L_W$ only through $\Pi_\alpha\mathfrak L_W\Pi_\alpha^*$, together with the separately supplied $R_k$ and $V$, proving item 4. The final statement combines item 3 with Corollary X.8a.5d, whose quadratic datum realizes every compatible strictly positive finite operator. ∎

**Proposition X.8a.5f (Perspective Zero Mode of the Inverse-Hessian Datum).** Let the perspective summand be a finite-dimensional real space $\mathscr H_\Sigma\subset L^2(\Sigma,\nu)$ of functions on the perspective space, with $\nu$ a finite measure and with the constant function $1\in\mathscr H_\Sigma$. Put $B_\Sigma=\Pi_\Sigma\mathfrak L_W\Pi_\Sigma^*$, so that $\mathcal L_\Sigma=-B_\Sigma$ in (X.8a.5.4).

1. If $\mathfrak L_W$ is the strictly positive operator of Definition X.8a.5a and $\lambda_\Sigma>0$ is the least eigenvalue of $B_\Sigma$, then $\lVert e^{t\mathcal L_\Sigma}f\rVert_\nu\le e^{-\lambda_\Sigma t}\lVert f\rVert_\nu$ for every $f\in\mathscr H_\Sigma$ and $t\ge0$. The semigroup has no nonzero invariant vector, $e^{t\mathcal L_\Sigma}1\ne1$ for every $t>0$, and
$$
\left|\int_\Sigma e^{t\mathcal L_\Sigma}f\,d\nu\right|
\le
e^{-\lambda_\Sigma t}\,\nu(\Sigma)^{1/2}\lVert f\rVert_\nu .
\tag{X.8a.5f.1}
$$
Thus, for every inverse-Hessian datum whose perspective summand contains the constants, the total weight $\int_\Sigma e^{t\mathcal L_\Sigma}f\,d\nu$ of the perspective transport of every $f\in\mathscr H_\Sigma$ is bounded in absolute value by the envelope (X.8a.5f.1), which decays to zero with exponential rate $\lambda_\Sigma$.

2. A conservative perspective form, meaning $\mathcal E_\Sigma(f,g)=\langle f,B_\Sigma g\rangle_\nu$ with $B_\Sigma$ self-adjoint and nonnegative on $\mathscr H_\Sigma$ and $\mathcal E_\Sigma(1,g)=0$ for every $g\in\mathscr H_\Sigma$, has $B_\Sigma1=0$. It is therefore the perspective block of no inverse-Hessian datum on a summand containing $1$. This applies to the form of the Appendix M generator (M.5a), $\mathcal E_\Sigma(f,g)=\int_\Sigma\langle\nabla_\Sigma f,\nabla_\Sigma g\rangle e^{-V_k}d\mathrm{vol}_\Sigma$ on $L^2(\Sigma,e^{-V_k}d\mathrm{vol}_\Sigma)$, restricted to any finite mode space of smooth functions containing the constants.

3. For a conservative form put $\mathscr H_\Sigma^0=\{f\in\mathscr H_\Sigma:\langle1,f\rangle_\nu=0\}$. Then $B_\Sigma$ maps $\mathscr H_\Sigma^0$ into itself, and its restriction $B_\Sigma^0$ is strictly positive exactly when $\ker B_\Sigma=\operatorname{span}\{1\}$. In that case, for strictly positive self-adjoint operators $\mathfrak L_{\mathrm{field}},\mathfrak L_{\mathrm{RG}},\mathfrak L_{\mathrm{PCE}}$ on the other three summands, the quadratic construction (X.8a.5d.1) for $\mathfrak L_{\mathrm{field}}\oplus\mathfrak L_{\mathrm{RG}}\oplus B_\Sigma^0\oplus\mathfrak L_{\mathrm{PCE}}$, with $\mathscr H_\Sigma$ replaced by $\mathscr H_\Sigma^0$, the orthogonal sector projections and a positive regulator satisfying item 5, satisfies items 1--5 of Definition X.8a.5a with perspective block $B_\Sigma^0$, and $-B_\Sigma^0$ generates the restriction to $\mathscr H_\Sigma^0$ of the conservative semigroup
$$
e^{-tB_\Sigma}=e^{-tB_\Sigma^0}\oplus I_{\operatorname{span}\{1\}}
\qquad\text{on }\mathscr H_\Sigma^0\oplus\operatorname{span}\{1\}.
\tag{X.8a.5f.2}
$$
The restricted form on a nonzero $\mathscr H_\Sigma^0$ is not a Dirichlet form: for $0\ne f\in\mathscr H_\Sigma^0$ the unit contraction $(0\vee f)\wedge1$ is nonnegative and nonzero, so its $\nu$-mean is positive and it lies outside $\mathscr H_\Sigma^0$. For the (M.5a) form on a connected $\Sigma$, $\ker B_\Sigma=\operatorname{span}\{1\}$ on every finite mode space of smooth functions containing the constants.

*Proof.* For $0\ne f\in\mathscr H_\Sigma$, $\langle f,B_\Sigma f\rangle_\nu=\langle\Pi_\Sigma^*f,\mathfrak L_W\Pi_\Sigma^*f\rangle>0$, so the compression $B_\Sigma$ of the strictly positive self-adjoint operator $\mathfrak L_W$ is strictly positive and self-adjoint on $\mathscr H_\Sigma$, and the spectral theorem gives $\lVert e^{-tB_\Sigma}\rVert\le e^{-\lambda_\Sigma t}<1$ for $t>0$. No nonzero vector is invariant; in particular $e^{-tB_\Sigma}1\ne1$ because $1\ne0$. Self-adjointness and the Cauchy--Schwarz inequality give $|\langle1,e^{-tB_\Sigma}f\rangle_\nu|=|\langle e^{-tB_\Sigma}1,f\rangle_\nu|\le e^{-\lambda_\Sigma t}\lVert1\rVert_\nu\lVert f\rVert_\nu$ with $\lVert1\rVert_\nu=\nu(\Sigma)^{1/2}$, proving item 1. For item 2, $\langle g,B_\Sigma1\rangle_\nu=\mathcal E_\Sigma(g,1)=\mathcal E_\Sigma(1,g)=0$ for every $g\in\mathscr H_\Sigma$, so $B_\Sigma1=0$ and $B_\Sigma$ is not strictly positive, while the compression of a strictly positive $\mathfrak L_W$ to $\mathscr H_\Sigma$ is strictly positive by the first step of item 1. The generator (M.5a) annihilates constants and is symmetric in $L^2(\Sigma,e^{-V_k}d\mathrm{vol}_\Sigma)$ by its divergence form, so integration by parts on the compact boundaryless manifold $\Sigma$ gives the displayed gradient form, and $\nabla_\Sigma1=0$ makes it conservative. For item 3, $\langle1,B_\Sigma f\rangle_\nu=\langle B_\Sigma1,f\rangle_\nu=0$, so $B_\Sigma$ preserves $\mathscr H_\Sigma^0=1^\perp$. Since $B_\Sigma\succeq0$, its restriction to $1^\perp$ is strictly positive exactly when $\ker B_\Sigma\cap1^\perp=\{0\}$, which, because $1\in\ker B_\Sigma$, is $\ker B_\Sigma=\operatorname{span}\{1\}$. The operator $\mathfrak L=\mathfrak L_{\mathrm{field}}\oplus\mathfrak L_{\mathrm{RG}}\oplus B_\Sigma^0\oplus\mathfrak L_{\mathrm{PCE}}$ is strictly positive, so (X.8a.5d.1) is twice differentiable and strictly convex on the full dual chart with $(W'')^{-1}=\mathfrak L$. This operator represents the closed nonnegative form $\langle u,\mathfrak Lv\rangle$ of a finite datum in the sense of Definition X.9.6a on the module with summand $\mathscr H_\Sigma^0$, the direct-sum projections give item 4 and the regulator gives item 5, so items 1--5 of Definition X.8a.5a hold, and the perspective compression of $\mathfrak L$ is $B_\Sigma^0$. The decomposition $B_\Sigma=B_\Sigma^0\oplus0$ gives (X.8a.5f.2). If $0\ne f\in\mathscr H_\Sigma^0$, then $\int f\,d\nu=0$ forces $\nu(\{f>0\})>0$, so $(0\vee f)\wedge1$ has positive integral. For the (M.5a) form, $\mathcal E_\Sigma(f,f)=0$ forces $\nabla_\Sigma f=0$, hence $f$ is constant on a connected $\Sigma$; for a nonnegative self-adjoint $B_\Sigma$, $\ker B_\Sigma=\{f:\mathcal E_\Sigma(f,f)=0\}$. ∎

**Resolution TV-X-05-R1 (Metadata).** Exact domain: finite-dimensional four-sector modules $\mathscr H_{\mathrm{PU}}$ with self-adjoint operators reduced by every summand, and finite perspective summands $\mathscr H_\Sigma\subset L^2(\Sigma,\nu)$ containing the constants. Premises: Definition X.8a.5a, the reducing hypothesis of Theorem X.9.6b, and the conservative form of the Appendix M generator (M.5a). Equivalence: unitary changes of basis inside each summand. Budget: four sector blocks and one perspective mode space. Verifier: block-diagonal commutation, the spectral theorem for direct sums, the Legendre transform of a quadratic form, and the identity $B_\Sigma1=0$. Falsifier: a compatible strictly positive finite operator with a nonzero off-diagonal block, or a strictly positive perspective block with a nonzero invariant vector. Provenance class: source-internal finite classification and scoped no-go with its quotient construction. Downstream consumers: Theorem X.8a.5, Corollaries X.8a.5b--X.8a.5d, Theorem X.9.6b, Corollary X.9.6c and `TV-X-05`. Nonvacuity: on $\mathscr H_\Sigma=\mathbb R^2$ with counting measure, the conservative form $\mathcal E_\Sigma(f,f)=(f_1-f_2)^2$ has $B_\Sigma^0=2$ on $\mathscr H_\Sigma^0$, while $(f_1-f_2)^2+f_1^2$ is a strictly positive nonconservative block. Proposition X.8a.5e gives `positive-discharge` of the compatibility-verification component: on the finite branch, compatibility with one branch operator is equivalent to sectorwise strict positivity and the sector-internal conditions. Proposition X.8a.5f gives `negative-refutation` of realizing a conservative perspective form on a summand containing the constants, and `positive-discharge` of its realization as the perspective block of a Definition X.8a.5a datum on the mean-zero summand. Population of the actual field, RG, mean-zero perspective and PCE forms with their common domains, projections and regulator remains `C` under `TV-X-05`; the sector images of Theorem X.8a.5 for that datum additionally require the form-compatibility hypotheses of Theorem X.9.6b, whose Dirichlet requirement the mean-zero restriction does not meet.

**Corollary X.8b (Effective-Action Projection of Predictive Curvature).** Assume the regular product-bundle branch of Theorem 47 and Theorem G.4b and the effective-action hypotheses of Theorem X.5a. Then
$$
\mathcal F^{\mathrm{pred}}
=R(\Omega)\otimes1+1\otimes F(A^{\mathrm{int}})
$$
projects to the internal gauge-curvature operators of Equation X.5 and the metric-curvature operators of Equation X.7. If, in addition, the Appendix-E area density, Wald normalization, local Rindler/KMS and Clausius bridge, and conserved Appendix-B source hypotheses of Section 12 hold, the leading Einstein-Hilbert coefficient is the coefficient supplied by that gravity branch. The CTP sector adds dissipative and noise kernels without changing the closed-system product-bundle identity.

*Proof.* Theorem 47 and Corollary G.4b.1 give the displayed product-bundle curvature identity. Projection onto the internal factor gives $F(A^{\mathrm{int}})$ and hence the gauge-curvature operator class in X.5; projection onto the spin/metric factor gives $R(\Omega)$ and hence the curvature-invariant class in X.7. These algebraic projections do not determine their numerical coefficients. Under the additional gravity package, Section 12 determines the leading Einstein-Hilbert coefficient through the Wald/area/KMS/Clausius/source chain. The CTP terms belong to the open-system completion and do not alter the algebraic factorization. ∎

**Proposition X.8b.1 (Predictive Curvature Ward Identity and Mixed-Coefficient Lock).** Let $\mathcal A^{\mathrm{pred}}$ be the regular product-bundle predictive connection of Corollary X.8b, with curvature
$$
\mathcal F^{\mathrm{pred}}
=
R(\Omega)\otimes1+1\otimes F(A^{\mathrm{int}}).
$$
Assume the closed-system curvature sector of the effective branch is generated by one predictive-frame invariant functional
$$
\Gamma_{\mathrm{curv}}[\mathcal A^{\mathrm{pred}}]
=
\int_M P(\mathcal F^{\mathrm{pred}},*\mathcal F^{\mathrm{pred}}),
$$
where $P$ is an invariant polynomial or convergent invariant formal power series on the retained finite-mode branch. Define the Euler current
$$
\mathcal J_{\mathrm{pred}}
:=
\frac{\delta\Gamma_{\mathrm{curv}}}{\delta\mathcal A^{\mathrm{pred}}}.
$$
Then
$$
D_{\mathcal A^{\mathrm{pred}}}\mathcal J_{\mathrm{pred}}=0.
$$
Projection onto the Lorentz/spin and internal factors gives the gravitational and gauge Ward identities of the branch. Moreover, all pure and mixed curvature coefficients in this single-connection branch are coefficients of the same invariant $P$; a mixed curvature-gauge term cannot be appended with an independent coefficient without changing the branch functional.

*Proof.* Let $\Xi$ be a compactly supported infinitesimal predictive-frame parameter. The induced infinitesimal variation of the connection is
$$
\delta_\Xi\mathcal A^{\mathrm{pred}}
=
D_{\mathcal A^{\mathrm{pred}}}\Xi.
$$
Predictive-frame invariance gives
$$
0
=
\delta_\Xi\Gamma_{\mathrm{curv}}
=
\int_M
\left\langle
\mathcal J_{\mathrm{pred}},
D_{\mathcal A^{\mathrm{pred}}}\Xi
\right\rangle.
$$
Integrating by parts and using compact support or the boundary conditions of the branch gives
$$
0
=
-\int_M
\left\langle
D_{\mathcal A^{\mathrm{pred}}}\mathcal J_{\mathrm{pred}},
\Xi
\right\rangle.
$$
Since $\Xi$ is arbitrary,
$$
D_{\mathcal A^{\mathrm{pred}}}\mathcal J_{\mathrm{pred}}=0.
$$
The connection decomposition
$$
\mathcal A^{\mathrm{pred}}=\Omega\otimes1+1\otimes A^{\mathrm{int}}
$$
splits this covariant identity into its Lorentz/spin and internal projections. Finally, because $\Gamma_{\mathrm{curv}}$ is generated by the single invariant $P$, the coefficients of the projected $R$ terms, $F$ terms, and admitted mixed terms are the corresponding coefficients of $P$. Adding an independent coefficient not arising from $P$ defines a different invariant functional and therefore a different effective branch. ∎

**Proposition X.8b.2 (No Uncertified Double-Copy Inference from Curvature Projection).** The direct-sum predictive-curvature identity
$$
\mathcal F^{\mathrm{pred}}
=
R(\Omega)\otimes1+1\otimes F(A^{\mathrm{int}})
\tag{X.8b.2.1}
$$
does not by itself imply a multiplicative double-copy relation between internal gauge response coefficients and emergent metric/channel-capacity response coefficients. A perturbative double-copy response branch is admissible only if a separate branch certificate supplies:

1. a finite cubic or factorization graph expansion of the retained response functional;

2. Jacobi-compatible internal ledger factors $c_\Gamma$;

3. kinematic numerators $n_\Gamma$ satisfying the same linear relations as the $c_\Gamma$;

4. a PCE-fixed metric/channel-capacity response normalization;

5. equality between the certified response functional and the effective branch response under the same renormalization conditions.

Without such a certificate, Corollary X.8b and Proposition X.8b.1 give projection, Ward, and mixed-coefficient locks only; they do not license replacing internal ledger data by kinematic numerators.

*Proof.* Equation (X.8b.2.1) is an additive splitting of the curvature of the product-bundle connection. Projection onto the two summands is functorial and gives the two projected Ward identities used in Proposition X.8b.1. A double-copy relation, however, is multiplicative: it requires a graph expansion in which one set of numerator or ledger factors is replaced by another while preserving the denominators, factorization channels, and Jacobi relations. None of those graph-expansion data is contained in the direct-sum identity (X.8b.2.1). Therefore the replacement $c_\Gamma\mapsto n_\Gamma$ is not a consequence of curvature projection. Items 1-5 are precisely the missing data required to make the multiplicative statement a branch theorem rather than an inference from an additive identity. ∎

**Proposition X.8b.3 (Invariant-Polynomial Classification of Mixed Curvature Terms).** On the locked branch of Corollary X.5a.2, let the product-bundle connection of Proposition X.8b.1 take values in
$$
\mathfrak g_{\mathrm{pred}}=\mathfrak{so}(1,3)\oplus\mathfrak g_*,
\qquad
\mathfrak g_*=\mathfrak{su}(3)\oplus\mathfrak{su}(2)\oplus\mathfrak u(1),
$$
let $I^k(\mathfrak h)$ denote the real homogeneous polynomials of degree $k$ on $\mathfrak h$ annihilated by the adjoint action, and let $y$ be the $\mathfrak u(1)$ coordinate. Then:

1. $I^\bullet(\mathfrak g_{\mathrm{pred}})=I^\bullet(\mathfrak{so}(1,3))\otimes I^\bullet(\mathfrak g_*)$, so the mixed Lorentz--internal invariants of degree $k$ form $\bigoplus_{p+q=k,\ p,q\ge1}I^p(\mathfrak{so}(1,3))\otimes I^q(\mathfrak g_*)$;

2. $\dim I^k(\mathfrak{so}(1,3))=0,2,0,3$ for $k=1,2,3,4$, with $I^2(\mathfrak{so}(1,3))$ spanned by $\operatorname{tr}(X^2)$ and $\epsilon(X,X)=\epsilon_{abcd}X^{ab}X^{cd}$; moreover $I^1(\mathfrak g_*)=\mathbb Ry$ and $\dim I^2(\mathfrak g_*)=3$;

3. every invariant bilinear form $b$ on $\mathfrak g_{\mathrm{pred}}$, symmetric or not, satisfies $b(\mathfrak{so}(1,3),\mathfrak g_*)=b(\mathfrak g_*,\mathfrak{so}(1,3))=0$; hence, for every invariant $P$ in Proposition X.8b.1, the part of $\Gamma_{\mathrm{curv}}$ quadratic in $\mathcal F^{\mathrm{pred}}$ contains no $R$--$F$ cross term;

4. the mixed invariants have dimension $0$ in degree $2$; dimension $2$ in degree $3$, spanned by $\operatorname{tr}(X^2)\,y$ and $\epsilon(X,X)\,y$; and dimension $6$ in degree $4$, spanned by the products of $I^2(\mathfrak{so}(1,3))$ with $I^2(\mathfrak g_*)$. Without an abelian internal summand every mixed invariant of degree at most $3$ vanishes;

5. for a representation $V=S\otimes V_{\mathrm{int}}$ with $\rho(X\oplus Y)=\rho_S(X)\otimes1+1\otimes\rho_{\mathrm{int}}(Y)$, the trace invariants $P_k=\operatorname{tr}_V\rho^k$ satisfy
$$
P_k(X\oplus Y)=\sum_{j=0}^k\binom kj\operatorname{tr}_S\bigl(\rho_S(X)^j\bigr)\operatorname{tr}_{V_{\mathrm{int}}}\bigl(\rho_{\mathrm{int}}(Y)^{k-j}\bigr).
\tag{X.8b.3.1}
$$
For the left-handed Weyl module $S=(\tfrac12,0)$ and the one-family package $V_{\mathrm{int}}=R_1$ of Theorem G.8.5a in the convention $y_{e^c}=1$, write $X_S=\rho_S(X)$ and $Y_R=\rho_{\mathrm{int}}(Y)$. Then
$$
P_2=15\operatorname{tr}X_S^2+2\operatorname{tr}Y_R^2,
\qquad
P_3\equiv0,
\qquad
P_4=15\operatorname{tr}X_S^4+6\operatorname{tr}X_S^2\operatorname{tr}Y_R^2+2\operatorname{tr}Y_R^4,
\tag{X.8b.3.2}
$$
with $\operatorname{tr}X_S^4=\tfrac12(\operatorname{tr}X_S^2)^2$ and, for $Y=Y_3+Y_2+Y_{\mathrm{hyp}}$ with $Y_{\mathrm{hyp}}$ acting by $i\,y\,b$ on hypercharge $y$,
$$
\operatorname{tr}_{R_1}Y_R^2=4\operatorname{tr}_{\mathbf 3}Y_3^2+4\operatorname{tr}_{\mathbf 2}Y_2^2-\frac{10}{3}b^2 .
\tag{X.8b.3.3}
$$
The identity $P_3\equiv0$ is equivalent to cancellation of every perturbative gauge anomaly and of the mixed gravitational--hypercharge anomaly of $R_1$. The traces in this item are complex valued: $\rho_S$ takes values in $\mathfrak{sl}(2,\mathbb C)$ and $\rho_{\mathrm{int}}(Y)$ is anti-Hermitian, so each $P_k$ lies in $I^k(\mathfrak g_{\mathrm{pred}})\otimes\mathbb C$, $\operatorname{tr}Y_R^2$ and $\operatorname{tr}Y_R^4$ are real, and $\operatorname{tr}X_S^2=\tfrac14\operatorname{tr}(X^2)+\tfrac{i\tau}8\,\epsilon(X,X)$, with $\operatorname{tr}(X^2)$ taken in the defining representation and $\tau\in\{\pm1\}$ fixed by the orientation of $\epsilon_{abcd}$ and the labeling of the two Weyl modules. A real curvature functional uses $\operatorname{Re}P_k$ and $\operatorname{Im}P_k$, each an element of $I^k(\mathfrak g_{\mathrm{pred}})$.

Thus the real and imaginary parts of the trace-generated curvature invariants on the realized chiral module have no mixed term in degrees $2$ and $3$, and their first mixed term is $6\operatorname{tr}X_S^2\operatorname{tr}Y_R^2$ in degree $4$, with real part $\tfrac32\operatorname{tr}(X^2)\operatorname{tr}Y_R^2$ and imaginary part $\tfrac{3\tau}4\epsilon(X,X)\operatorname{tr}Y_R^2$. Every mixed coefficient of $\Gamma_{\mathrm{curv}}$ is the coefficient of a product of a Lorentz invariant and an internal invariant inside $P$, and Proposition X.8b.2 continues to govern any double-copy reading.

*Proof.* Item 1: $S(\mathfrak g_{\mathrm{pred}}^*)=S(\mathfrak{so}(1,3)^*)\otimes S(\mathfrak g_*^*)$, and $\mathfrak{so}(1,3)$ acts on the first factor only. Expanding an element in a basis $\{e_j\}$ of the second factor as $\sum_ja_j\otimes e_j$, it is $\mathfrak{so}(1,3)$-invariant exactly when every $a_j$ is; the same argument for $\mathfrak g_*$ gives item 1.

Item 2: invariance is a real linear condition, so $I^k(\mathfrak h)\otimes\mathbb C$ is the complex invariant space of $\mathfrak h\otimes\mathbb C$. Since $\mathfrak{so}(1,3)\otimes\mathbb C\cong\mathfrak{sl}(2,\mathbb C)\oplus\mathfrak{sl}(2,\mathbb C)$, item 1 reduces the count to $\mathfrak{sl}(2,\mathbb C)$. A traceless $2\times2$ matrix with nonzero determinant has distinct eigenvalues and is conjugate into the diagonal line $\mathfrak t=\mathbb C\operatorname{diag}(1,-1)$, and such matrices are dense. An invariant polynomial is therefore determined by its restriction to $\mathfrak t$, which is even because $\operatorname{Ad}\begin{pmatrix}0&1\\-1&0\end{pmatrix}$ maps $\operatorname{diag}(1,-1)$ to $\operatorname{diag}(-1,1)$. Hence the invariant space of $\mathfrak{sl}(2,\mathbb C)$ has dimension at most $1$ in even degree and $0$ in odd degree, and powers of $\operatorname{tr}(X^2)$ attain it. The two-factor count is the number of pairs $(i,j)$ with $2i+2j=k$, which is $0,2,0,3$. The forms $\operatorname{tr}(X^2)$ and $\epsilon(X,X)$ are invariant, and they are independent because $\epsilon(X,X)=0\ne\operatorname{tr}(X^2)$ on a rotation generator while $\epsilon\not\equiv0$. A linear invariant of $\mathfrak g_*$ vanishes on $[\mathfrak g_*,\mathfrak g_*]=\mathfrak{su}(3)\oplus\mathfrak{su}(2)$, giving $I^1(\mathfrak g_*)=\mathbb Ry$. The complexifications of $\mathfrak{su}(3)$ and $\mathfrak{su}(2)$ are simple, so Schur's lemma makes each invariant quadratic form a multiple of the trace form; with item 1 and $I^1(\mathfrak{su}(n))=0$ this gives $\dim I^2(\mathfrak g_*)=3$.

Item 3: invariance gives $b([Z,X],Y)=-b(X,[Z,Y])$. For $X,Z\in\mathfrak{so}(1,3)$ and $Y\in\mathfrak g_*$, $[Z,Y]=0$, so $b([Z,X],Y)=0$; since $\mathfrak{so}(1,3)$ is semisimple, $[\mathfrak{so}(1,3),\mathfrak{so}(1,3)]=\mathfrak{so}(1,3)$ and $b(\mathfrak{so}(1,3),\mathfrak g_*)=0$. The same argument in the second slot gives the other identity. The quadratic part of $P(\mathcal F^{\mathrm{pred}},*\mathcal F^{\mathrm{pred}})$ is an invariant bilinear form evaluated on $R\oplus F$ and $*R\oplus*F$, so its cross terms vanish.

Item 4 follows from items 1 and 2. For item 5, the two summands of $\rho$ commute, so the binomial theorem and $\operatorname{tr}(A\otimes B)=\operatorname{tr}A\operatorname{tr}B$ give (X.8b.3.1). On $S$, $X_S$ is traceless and $2\times2$, so $X_S^2=-\det(X_S)I$; hence $\operatorname{tr}X_S=\operatorname{tr}X_S^3=0$ and $\operatorname{tr}X_S^4=\tfrac12(\operatorname{tr}X_S^2)^2$. With $\dim S=2$ and $\dim R_1=15$, (X.8b.3.1) gives $P_2$ and $P_4$ as displayed and $P_3=2\operatorname{tr}Y_R^3+3\operatorname{tr}X_S^2\operatorname{tr}Y_R$. The hypercharge sum over the fifteen states is $6\cdot\tfrac16-3\cdot\tfrac23+3\cdot\tfrac13-2\cdot\tfrac12+1=0$, so $\operatorname{tr}Y_R=0$. Expanding $\operatorname{tr}Y_R^3$, the terms in which $Y_3$ or $Y_2$ appears exactly once vanish because those blocks are traceless, $\operatorname{tr}_{\mathbf 2}Y_2^3=0$, and the remaining coefficients are the anomaly sums $2-1-1=0$ for $SU(3)^3$, $2\cdot\tfrac16-\tfrac23+\tfrac13=0$ for $SU(3)^2U(1)$, $3\cdot\tfrac16-\tfrac12=0$ for $SU(2)^2U(1)$ and $6\cdot\tfrac1{216}-3\cdot\tfrac8{27}+3\cdot\tfrac1{27}-2\cdot\tfrac18+1=0$ for $U(1)^3$; hence $P_3\equiv0$. Conversely, $P_3\equiv0$ at $X=0$ gives $\operatorname{tr}Y_R^3\equiv0$, and then $\operatorname{tr}X_S^2\operatorname{tr}Y_R\equiv0$ gives $\operatorname{tr}Y_R\equiv0$. In (X.8b.3.3), $Q$ contributes two color triplets and three weak doublets, $u^c$ and $d^c$ one color antitriplet each, $L$ one weak doublet, mixed traces vanish, and $\sum y^2=6\cdot\tfrac1{36}+3\cdot\tfrac49+3\cdot\tfrac19+2\cdot\tfrac14+1=\tfrac{10}3$. The eigenvalues of the anti-Hermitian $Y_R$ are imaginary, so its even traces are real. The trace $\operatorname{tr}X_S^2$ is a complex-valued invariant quadratic form on $\mathfrak{so}(1,3)$, so item 2 gives $\operatorname{tr}X_S^2=c_1\operatorname{tr}(X^2)+c_2\epsilon(X,X)$ with $c_1,c_2\in\mathbb C$. For $X$ the sum of a rotation by $\theta$ about the third spatial axis and a boost of rapidity $\beta$ along it, $X_S=\tfrac12(s\beta-i\theta)\operatorname{diag}(1,-1)$ with $s\in\{\pm1\}$ labeling the Weyl module, $\operatorname{tr}(X^2)=2(\beta^2-\theta^2)$ and $\epsilon(X,X)=8s'\theta\beta$ with $s'\in\{\pm1\}$ fixed by the orientation conventions; comparing $\operatorname{tr}X_S^2=\tfrac12(\beta^2-\theta^2)-is\theta\beta$ with these values gives $c_1=\tfrac14$ and $c_2=\tfrac{i\tau}8$, $\tau=-ss'$. ∎

**Resolution TV-X-06-R1 (Metadata).** Exact domain: invariant polynomials of degree at most $4$ and all invariant bilinear forms on $\mathfrak{so}(1,3)\oplus\mathfrak{su}(3)\oplus\mathfrak{su}(2)\oplus\mathfrak u(1)$, and the complex-valued trace invariants of $(\tfrac12,0)\otimes R_1$ with their real and imaginary parts. Premises: the locked gauge algebra of Corollary X.5a.2, the product-bundle connection of Proposition X.8b.1 and the one-family package of Theorem G.8.5a with $y_{e^c}=1$. Equivalence: Lie-algebra automorphisms and rescaling of the hypercharge generator. Budget: polynomial degree $4$ and one chiral module. Verifier: the tensor-product invariant lemma, the diagonal-line restriction for $\mathfrak{sl}(2,\mathbb C)$, Schur's lemma, the identity $X_S^2=-\det(X_S)I$, the evaluation of $\operatorname{tr}X_S^2$ on a rotation--boost pair and the finite hypercharge sums. Falsifier: a nonzero invariant pairing between $\mathfrak{so}(1,3)$ and $\mathfrak g_*$, a nonzero cubic invariant of $\mathfrak{so}(1,3)$, or a nonzero $P_3$ on $(\tfrac12,0)\otimes R_1$. Provenance class: source-internal exact classification and computation. Downstream consumers: Corollary X.8b, Propositions X.8b.1--X.8b.2 and `TV-X-06`. Nonvacuity: for a rotation generator $X$ and the hypercharge generator, $6\operatorname{tr}X_S^2\operatorname{tr}Y_R^2=6\cdot(-\tfrac12)\cdot(-\tfrac{10}3b^2)=10b^2\ne0$. This is `positive-discharge` of the invariant-projection and mixed-term classification through degree $4$ and of the trace normalization on the realized one-family chiral module. The selection of the branch invariant $P$ and its coefficients from the effective branch, with their numerical normalization, remains `C+R` under `TV-X-06`.

**Theorem X.8c (Constraint-Coupling Duality: Predictive Price Principle).** Consider a regular finite-mode truncation of a PU effective branch after quotienting gauge redundancies or imposing the gauge-fixing used in Section X.3. Let the retained coarse variables be $\Phi\in\mathcal U\subset\mathbb R^n$, let $V_{\mathrm{PCE}}(\Phi)$ be the differentiable PCE objective on that chart, and let the physical admissibility constraints be
$$
\mathcal C_A(\Phi)\le 0,
\qquad
A=1,\dots,r.
$$
Assume that $\mathcal U$ is convex in the retained chart, $V_{\mathrm{PCE}}$ is strictly convex on the branch, each $\mathcal C_A$ is differentiable and convex in a neighborhood of the optimum, the branch satisfies a standard KKT constraint qualification such as Slater regularity together with linear independence of active gradients, and the selected multiplier sequence is finite. Let $\Phi_*$ be the unique branch minimizer. Then there are unique multipliers $\lambda_A$ satisfying
$$
D V_{\mathrm{PCE}}[\Phi_*]
+
\sum_{A=1}^r\lambda_A D\mathcal C_A[\Phi_*]
=
0,
$$
$$
\lambda_A\ge 0,
\qquad
\mathcal C_A(\Phi_*)\le 0,
\qquad
\lambda_A\mathcal C_A(\Phi_*)=0.
$$
For every sector whose effective action coefficient is introduced by enforcing an active physical admissibility constraint $\mathcal C_A$, the canonical coefficient is the normalized shadow price
$$
\eta_A=\mathcal N_A\lambda_A,
$$
where $\mathcal N_A>0$ is the branch normalization fixed by the corresponding Ward, Wald/area-law, interface, or PPI mapping theorem. In a stiffness convention,
$$
\Gamma_A
=
-\frac{1}{4g_A^2}\int F_A{}_{\mu\nu}F_A{}^{\mu\nu}\sqrt{-g}\,d^4x+\cdots,
\qquad
g_A^{-2}=\eta_A.
$$
In a rate-coordinate convention with one deformation coordinate $u_A=g_A^2$, capacity function $\mathfrak c_A(u_A)$, and active bound $\mathfrak c_A(u_A)\le C_A^{\max}$, the constrained stationarity condition gives
$$
\phi_A'(u_A^*)+\lambda_A\mathfrak c_A'(u_A^*)=0,
\qquad
\lambda_A
=
-\frac{\phi_A'(u_A^*)}{\mathfrak c_A'(u_A^*)},
$$
and the physical coupling is obtained only after the branch normalization,
$$
\alpha_A=\frac{u_A^*}{4\pi\kappa_A}.
$$
Thus a coupling constant is not an independent continuous input on such a branch: it is the canonical image of an active PCE shadow price, or of the active boundary coordinate together with that shadow price and the fixed normalization map.

*Proof.* Since $V_{\mathrm{PCE}}$ is strictly convex on the retained chart and the feasible set is convex, any minimizer is unique. Let $I=\{A:\mathcal C_A(\Phi_*)=0\}$ be the active set. First-order optimality says that for every feasible first-order direction $v$ in the tangent cone,
$$
D V_{\mathrm{PCE}}[\Phi_*]v\ge 0.
$$
The active tangent cone is determined by
$$
D\mathcal C_A[\Phi_*]v\le 0,
\qquad
A\in I.
$$
If no nonnegative coefficients $\{\lambda_A\}_{A\in I}$ satisfied
$$
D V_{\mathrm{PCE}}[\Phi_*]
+
\sum_{A\in I}\lambda_A D\mathcal C_A[\Phi_*]
=
0,
$$
the finite-dimensional Farkas separation theorem would give a vector $v$ such that
$$
D\mathcal C_A[\Phi_*]v\le 0
\quad
\text{for all }A\in I,
\qquad
D V_{\mathrm{PCE}}[\Phi_*]v<0.
$$
For sufficiently small positive $t$, differentiability and convexity then give a feasible variation $\Phi_*+tv+o(t)$ with strictly smaller $V_{\mathrm{PCE}}$, contradicting minimality. Hence the multipliers exist. Set $\lambda_A=0$ for inactive constraints. This gives feasibility, nonnegativity, stationarity, and complementarity. If two multiplier families satisfied stationarity, subtracting the two stationarity equations would give a linear dependence among the active gradients. Active-gradient independence forces all multiplier differences to vanish, so the multipliers are unique.

The branch effective action obtained from constrained PCE is the Lagrangian functional
$$
\mathcal L_{\mathrm{PCE}}(\Phi,\lambda)
=
V_{\mathrm{PCE}}(\Phi)
+
\sum_A\lambda_A\mathcal C_A(\Phi).
$$
Therefore the coefficient multiplying the active constraint functional is exactly $\lambda_A$ before canonical field normalization. The fixed normalization map of the branch rescales this coefficient by the positive factor $\mathcal N_A$, giving $\eta_A=\mathcal N_A\lambda_A$. If the sector is written in the gauge-field stiffness convention, the canonical quadratic coefficient is $g_A^{-2}$, hence $g_A^{-2}=\eta_A$. If the sector is written instead as a one-dimensional rate-coordinate problem, differentiating the constrained Lagrangian
$$
\phi_A(u_A)+\lambda_A(\mathfrak c_A(u_A)-C_A^{\max})
$$
at the active optimum yields
$$
\phi_A'(u_A^*)+\lambda_A\mathfrak c_A'(u_A^*)=0,
$$
and therefore the displayed expression for $\lambda_A$. The final relation $\alpha_A=u_A^*/(4\pi\kappa_A)$ is the canonical Heaviside-Lorentz normalization used in Equation (X.6). The continuum effective-action statements use the same identity on the retained regular finite-mode truncations and pass along the convergent subsequence of Theorem X.5a whenever the selected branch has convergent multipliers and the objective and constraint differentials converge on the admitted limiting variations. The action-density convergence of Theorem X.5a alone does not imply this differential convergence. ∎

**Corollary X.8c.1 (Multi-Gauge Couplings as a Shadow-Price Vector).** On a regular constrained PCE branch with gauge sectors $A\in\{1,2,3\}$, suppose each retained gauge stiffness is introduced by an active admissibility constraint
$$
\mathcal C_A(\Phi)\le0
$$
and that the hypotheses of Theorem X.8c hold with linearly independent active gradients. Let
$$
\lambda_A>0
$$
be the KKT multiplier of $\mathcal C_A$ for each retained nonzero-stiffness gauge sector, and let $\mathcal N_A>0$ be the fixed Ward/interface normalization of the corresponding sector. Then, in stiffness convention,
$$
\begin{pmatrix}
g_1^{-2}\\
g_2^{-2}\\
g_3^{-2}
\end{pmatrix}
=
\begin{pmatrix}
\mathcal N_1&0&0\\
0&\mathcal N_2&0\\
0&0&\mathcal N_3
\end{pmatrix}
\begin{pmatrix}
\lambda_1\\
\lambda_2\\
\lambda_3
\end{pmatrix}.
$$
Equivalently,
$$
\alpha_A=\frac{g_A^2}{4\pi}
=
\frac{1}{4\pi\mathcal N_A\lambda_A}.
$$
Thus the gauge couplings on this branch are the normalized shadow prices of the active gauge-coherence constraints, not independent continuous inputs. If an active constraint has $\lambda_A=0$, the displayed inverse formula is not a finite coupling statement; that sector is outside the retained nonzero-stiffness hypothesis of this corollary.

*Proof.* Apply Theorem X.8c to each active gauge constraint $\mathcal C_A$. The theorem gives a unique multiplier $\lambda_A$ and the normalized coefficient
$$
\eta_A=\mathcal N_A\lambda_A.
$$
In gauge-field stiffness convention,
$$
g_A^{-2}=\eta_A.
$$
Substituting gives
$$
g_A^{-2}=\mathcal N_A\lambda_A
$$
for each retained sector $A$. Stacking the three equations gives the displayed diagonal vector equation. Since
$$
\alpha_A=\frac{g_A^2}{4\pi},
$$
and $\mathcal N_A\lambda_A>0$, one obtains
$$
\alpha_A=\frac{1}{4\pi\mathcal N_A\lambda_A}.
$$
Uniqueness of the vector follows from uniqueness of the KKT multipliers in Theorem X.8c and positivity of the fixed normalizations $\mathcal N_A$. ∎

**Proposition X.8c.2 (Rate-Coordinate Capacity Branch: Qualification, Regularity and Unit Calibration).** In the rate-coordinate convention of Theorem X.8c, fix one sector $A$ with coordinate $u$ on an open interval $U\subset(-1/\lambda,\infty)$, a strictly convex objective $\phi_A\in C^2(U)$, and the inequality form of the capacity constraint (X.11),
$$
\mathfrak c(u)=M\ln(1+\lambda u)\le\ln d_0,
\qquad
M,\lambda>0,\quad d_0>1 .
$$
Put $u_{\max}=(d_0^{1/M}-1)/\lambda$ and assume $u_{\max}\in U$. Then:

1. the feasible set is $U\cap(-\infty,u_{\max}]$, and $\mathfrak c'(u)=M\lambda/(1+\lambda u)>0$ on $U$, so the linear-independence constraint qualification holds at every feasible point;

2. if $\phi_A'(u_{\max})<0$, the unique constrained minimizer is $u_A^*=u_{\max}$, the constraint is active with strictly positive multiplier
$$
\lambda_A=-\frac{d_0^{1/M}}{M\lambda}\,\phi_A'(u_{\max}),
\tag{X.8c.2.1}
$$
the bordered KKT Jacobian has determinant $-(M\lambda)^2d_0^{-2/M}\ne0$, the active set is locally constant in $b=\ln d_0$, and the optimal value obeys $\partial\phi_A(u_A^*)/\partial b=-\lambda_A$, which is (X.8f.4) for this constraint. If $\phi_A'(u_{\max})\ge0$, every constrained minimizer has zero multiplier;

3. for $\phi_A'(u_{\max})<0$ the active coordinate $u_A^*=u_{\max}$ is the same for every objective, while $\lambda_A$ is proportional to $-\phi_A'(u_{\max})$; for $(M,\lambda,d_0)=(24,1,8)$ it is the value $u^*=8^{1/24}-1$ of Section X.3;

4. if $\phi_A'(u_{\max})<0$ and $\kappa_A>0$, so that $u_A^*=u_{\max}>0$ and $\lambda_A>0$, the stiffness identification $g_A^{-2}=\mathcal N_A\lambda_A$ and the rate identification $g_A^2=u_A^*/\kappa_A$ of (X.6) assign the same coupling exactly when
$$
\mathcal N_A
=
\frac{\kappa_A}{u_A^*\lambda_A}
=
-\frac{\kappa_A M\lambda}{u_A^*d_0^{1/M}\phi_A'(u_A^*)} ;
\tag{X.8c.2.2}
$$
at fixed $\kappa_A$, a normalization $\mathcal N_A$ fixed independently of $\phi_A$ therefore makes the two identifications agree for at most one value of $\phi_A'(u_A^*)$, and the objectives $\phi_s(u)=\tfrac12(u-s)^2$, $s>u_{\max}$, share $u_A^*$ and have pairwise distinct multipliers; on the zero-multiplier branch $\phi_A'(u_{\max})\ge0$ the stiffness identification gives $g_A^{-2}=0$ for every finite $\mathcal N_A$, which matches no finite rate coupling;

5. if $(M,\lambda,d_0)$ are scale independent, each $\phi_{A,k}$ is an objective of the above type, and $(k,u)\mapsto\phi_{A,k}'(u)$ is continuously differentiable with $\phi_{A,k}'(u_{\max})<0$, then $u_A^*$ is scale independent, $\lambda_A(k)$ is $C^1$ with
$$
k\frac{d\lambda_A}{dk}
=
-\frac{d_0^{1/M}}{M\lambda}\,k\,\partial_k\phi_{A,k}'(u_{\max}),
\tag{X.8c.2.3}
$$
the rate-convention coupling runs only through $\kappa_A(k)$, and on the calibrated branch (X.8c.2.2) the price $\eta_A=\mathcal N_A\lambda_A=\kappa_A/u_A^*$ obeys $k\,d\ln\eta_A/dk=k\,d\ln\kappa_A/dk$, so Theorem X.8e gives
$$
\beta_A=-\frac12\,g_A\,k\frac{d\ln\kappa_A}{dk}.
\tag{X.8c.2.4}
$$

*Proof.* The function $\mathfrak c$ is strictly increasing on $(-1/\lambda,\infty)$ and $\mathfrak c(u_{\max})=M\ln d_0^{1/M}=\ln d_0$, which gives the feasible set; in one dimension the constraint qualification is $\mathfrak c'\ne0$. If $\phi_A'(u_{\max})<0$, strict convexity makes $\phi_A'$ strictly increasing, so $\phi_A'<0$ on the feasible set and $\phi_A$ is strictly decreasing there; hence $u_{\max}$ is the unique minimizer. Stationarity $\phi_A'(u^*)+\lambda_A\mathfrak c'(u^*)=0$ and $1+\lambda u_{\max}=d_0^{1/M}$ give (X.8c.2.1). The active KKT system $\phi_A'+\lambda_A\mathfrak c'=0$, $\mathfrak c-b=0$ has Jacobian
$$
\begin{pmatrix}
\phi_A''+\lambda_A\mathfrak c''&\mathfrak c'\\
\mathfrak c'&0
\end{pmatrix},
$$
with determinant $-\mathfrak c'(u^*)^2=-(M\lambda)^2d_0^{-2/M}$. For $b$ near $\ln d_0$, $u_{\max}(b)=(e^{b/M}-1)/\lambda$ is smooth and $\phi_A'(u_{\max}(b))<0$ by continuity, so the constraint stays active, and $\frac{d}{db}\phi_A(u_{\max}(b))=\phi_A'(u_{\max})e^{b/M}/(M\lambda)=-\lambda_A$. If $\phi_A'(u_{\max})\ge0$, a minimizer below $u_{\max}$ has zero multiplier by complementarity, and a minimizer at $u_{\max}$ has $\lambda_A=-\phi_A'(u_{\max})/\mathfrak c'(u_{\max})\le0$, so $\lambda_A=0$ by dual feasibility. This proves items 1--3; the stated value is $u_{\max}=8^{1/24}-1$.

For item 4, $u_A^*=u_{\max}>0$ because $d_0>1$, and $\lambda_A>0$ by item 2, so $g_A^{-2}=\mathcal N_A\lambda_A$ and $g_A^{2}=u_A^*/\kappa_A$ hold together exactly when $\mathcal N_A\lambda_A=\kappa_A/u_A^*$, which with (X.8c.2.1) is (X.8c.2.2). A fixed $\mathcal N_A$ satisfies this identity for at most one value of $\lambda_A$, hence of $\phi_A'(u_A^*)$. For $\phi_s$, $\phi_s'(u_{\max})=u_{\max}-s<0$, so $u_A^*=u_{\max}$ and $\lambda_A=(s-u_{\max})d_0^{1/M}/(M\lambda)$, which is injective in $s$. On the zero-multiplier branch $\mathcal N_A\lambda_A=0$ for finite $\mathcal N_A$, while $u_A^*/\kappa_A$ is finite. For item 5, $u_{\max}$ does not involve $k$, (X.8c.2.1) holds at each $k$, and differentiating it gives (X.8c.2.3). The rate identification $g_A^2=u_A^*/\kappa_A(k)$ has scale-independent numerator. On the calibrated branch $\eta_A=\kappa_A/u_A^*$, so $d\ln\eta_A=d\ln\kappa_A$, and Theorem X.8e gives (X.8c.2.4). ∎

**Resolution TV-X-07-R1 (Metadata).** Exact domain: one-sector rate-coordinate problems with strictly convex $C^2$ objective on an open interval and the inequality form of the capacity constraint (X.11). Premises: $M,\lambda>0$, $d_0>1$, $u_{\max}\in U$, for item 4 the active branch $\phi_A'(u_{\max})<0$ with $\kappa_A>0$, and for item 5 scale-independent capacity data with a $C^1$ objective family. Equivalence: the constraint representations $\mathfrak c(u)\le\ln d_0$ and $u\le u_{\max}$, which have the same feasible set and nonvanishing constraint derivatives. Budget: one objective, three capacity parameters and one normalization. Verifier: the closed forms for $u_{\max}$, $\lambda_A$, the bordered Jacobian determinant and the envelope derivative. Falsifier: an objective with $\phi_A'(u_{\max})<0$ whose constrained minimizer differs from $u_{\max}$, or agreement of the stiffness and rate couplings with $\mathcal N_A\ne\kappa_A/(u_A^*\lambda_A)$. Provenance class: source-internal exact computation with an explicit objective family. Downstream consumers: Theorem X.8c, Corollary X.8c.1, Theorem X.8e, Theorem X.8f.2, Section X.6 and `TV-X-07`. Nonvacuity: $(M,\lambda,d_0)=(24,1,8)$ with $\phi_A(u)=\tfrac12(u-1)^2$ gives $u_A^*=8^{1/24}-1$ and $\lambda_A=(2-8^{1/24})8^{1/24}/24>0$. This is `positive-discharge` of the constraint qualification, strong regularity, active-set stability and unit calibration (X.8c.2.2) on the rate-coordinate capacity branch, and `nonentailment` of agreement between the stiffness and rate identifications under an objective-independent normalization. Derivation of the active constraints from the effective action, the multi-sector price vector with its beta functions, and the scale dependence of $\kappa_A$ remain `M+C+R+O` under `TV-X-07`.

**Definition X.8d.0 (Predictive Anomaly Cocycle).** Fix a regular effective-action sector at MPU resolution $\delta$. Let $\mathcal X$ be the set of local predictive descriptions in that sector, and let
$$
\mathcal R\rightrightarrows \mathcal X
$$
be the groupoid of transformations declared to be redundancies of predictive description. For an arrow $\gamma:x\to y$ in $\mathcal R$, write the induced source transformation as $J\mapsto \gamma\cdot J$. A family of generating functionals $Z_x[J]$ has anomaly cocycle $\mathcal A$ when
$$
Z_y[\gamma\cdot J]
=
e^{i\mathcal A_\gamma[J]}Z_x[J],
$$
with all phases understood modulo $2\pi$, and with the composition law
$$
\mathcal A_{\eta\circ\gamma}[J]
=
\mathcal A_\gamma[J]+\mathcal A_\eta[\gamma\cdot J]
$$
for every composable pair $x\xrightarrow{\gamma}y\xrightarrow{\eta}z$. A local counterterm cochain is a choice of functionals $B_x[J]$. Its coboundary is
$$
(\delta B)_\gamma[J]
=
B_x[J]-B_y[\gamma\cdot J].
$$
The anomaly class is the cohomology class
$$
[\mathcal A]\in H^1(\mathcal R,\mathscr F/2\pi\mathbb Z),
$$
where $\mathscr F$ denotes the permitted local functional class of the branch.

**Theorem X.8d (Predictive Anomaly Descent and Inflow Principle).** In the setting of Definition X.8d.0, restrict the descent equivalence to a connected regular source domain on which $Z_x[J]\ne0$ for every admitted object $x$ and source $J$:

1. The predictive functional descends to the quotient $\mathcal X/\mathcal R$ after permitted local counterterms if and only if
$$
[\mathcal A]=0.
$$

2. If a transformation is declared to be a redundancy and $[\mathcal A]\ne0$, then no counterterm-renormalized predictive functional can be assigned consistently on the quotient. Such a sector is PU-inadmissible as a redundancy sector.

3. If the description is split into bulk, boundary, and interface pieces with multiplicative generating functional
$$
Z^{\mathrm{tot}}
=
Z^{\mathrm{bulk}}Z^{\partial}Z^{\mathrm{int}},
$$
then the total anomaly class is
$$
[\mathcal A^{\mathrm{tot}}]
=
[\mathcal A^{\mathrm{bulk}}]
+
[\mathcal A^{\partial}]
+
[\mathcal A^{\mathrm{int}}].
$$
The split description descends exactly when
$$
[\mathcal A^{\mathrm{bulk}}]
+
[\mathcal A^{\partial}]
+
[\mathcal A^{\mathrm{int}}]
=
0.
$$
This is predictive anomaly inflow.

4. If a transformation is not in $\mathcal R$, then it is not a quotient redundancy. A nonzero variation under that transformation is not a descent failure; it is a physical update channel. For an infinitesimal transformation with parameter $\eta$, the variation of $W=\ln Z$ records the corresponding Ward identity through
$$
\delta_\eta W[J]=i\mathcal A_\eta[J]
$$
together with the ordinary source-contact terms of the chosen operator basis.

*Proof.* Suppose first that $[\mathcal A]=0$. Then there is a permitted counterterm cochain $B$ such that
$$
\mathcal A_\gamma[J]=B_x[J]-B_y[\gamma\cdot J]
$$
for every arrow $\gamma:x\to y$. Define
$$
\widetilde Z_x[J]:=e^{iB_x[J]}Z_x[J].
$$
Then
$$
\widetilde Z_y[\gamma\cdot J]
=
e^{iB_y[\gamma\cdot J]}Z_y[\gamma\cdot J]
=
e^{iB_y[\gamma\cdot J]}e^{i\mathcal A_\gamma[J]}Z_x[J]
=
e^{iB_x[J]}Z_x[J]
=
\widetilde Z_x[J].
$$
Thus $\widetilde Z$ is constant on $\mathcal R$-orbits and descends to the quotient.

Conversely, suppose a permitted counterterm family $B_x$ makes
$$
\widetilde Z_y[\gamma\cdot J]=\widetilde Z_x[J]
$$
for every redundancy arrow $\gamma:x\to y$ and every source in the regular domain. Expanding gives
$$
e^{iB_y[\gamma\cdot J]}e^{i\mathcal A_\gamma[J]}Z_x[J]
=
e^{iB_x[J]}Z_x[J].
$$
The regular-domain hypothesis gives $Z_x[J]\ne0$ pointwise, so cancellation yields
$$
e^{i(\mathcal A_\gamma[J]+B_y[\gamma\cdot J]-B_x[J])}=1.
$$
Therefore
$$
\mathcal A_\gamma[J]=B_x[J]-B_y[\gamma\cdot J]\quad\mathrm{mod}\ 2\pi,
$$
so $\mathcal A=\delta B$ and $[\mathcal A]=0$. This proves the descent criterion.

If $[\mathcal A]\ne0$ for a declared redundancy, the criterion just proved implies that no permitted counterterm can produce a quotient functional. Therefore two descriptions identified by $\mathcal R$ would assign inequivalent predictive responses to the same physical context, contradicting MPU-equivalence and the quotient requirement used in Definition X.9.1. Such a sector cannot be assigned finite PCE cost as a redundancy sector.

For the bulk-boundary-interface split, the multiplicative law gives
$$
Z_y^{\mathrm{tot}}[\gamma\cdot J]
=
Z_y^{\mathrm{bulk}}[\gamma\cdot J]
Z_y^{\partial}[\gamma\cdot J]
Z_y^{\mathrm{int}}[\gamma\cdot J].
$$
Applying the defining anomaly equation to each factor yields the total phase
$$
\mathcal A_\gamma^{\mathrm{tot}}[J]
=
\mathcal A_\gamma^{\mathrm{bulk}}[J]
+
\mathcal A_\gamma^{\partial}[J]
+
\mathcal A_\gamma^{\mathrm{int}}[J].
$$
The descent criterion applied to this total cocycle gives
$$
[\mathcal A^{\mathrm{tot}}]=0
\quad\Longleftrightarrow\quad
[\mathcal A^{\mathrm{bulk}}]+[\mathcal A^{\partial}]+[\mathcal A^{\mathrm{int}}]=0.
$$
Finally, if the transformation is not an arrow of $\mathcal R$, the quotient condition is not being imposed. Differentiating $Z\mapsto e^{i\mathcal A_\eta}Z$ at infinitesimal parameter gives $\delta_\eta W=i\mathcal A_\eta$ with the source-contact terms induced by the transformation of $J$. This is a physical Ward identity rather than a contradiction. ∎

**Corollary X.8d.1 (Gauge Redundancies, Family Charges, Horizons, and Global-Current Channels).** Assume the connected regular source domain of Theorem X.8d, with $Z_x[J]\ne0$ for every admitted object and source. Then:

1. transformations included in the redundancy groupoid must have vanishing anomaly class in the declared local-functional groupoid cohomology for the predictive functional to descend;
2. a family $U(1)_F$ treated as a predictive-frame redundancy is subject to that local descent constraint;
3. boundary, horizon, or interface inflow must satisfy
$$
[\mathcal A^{\mathrm{bulk}}]+[\mathcal A^{\partial}]+[\mathcal A^{\mathrm{int}}]=0;
$$
4. a claim of vanishing total physical anomaly requires a certificate identifying the declared groupoid and local-functional descent problem with the relevant physical anomaly data; any global or bordism obstruction not covered by that certificate requires its own audit; and
5. the electroweak $B+L$ anomaly is an admissible physical update channel when $B+L$ is a retained global current rather than a declared redundancy.

*Proof.* Items 1–3 apply Theorem X.8d on its effective source domain. Item 4 records that Definition X.8d.0 specifies a local-functional groupoid descent problem and does not provide a completeness comparison with all physical bordism anomalies. Its cohomology is not asserted to be torsion-free. For item 5, no quotient identification is imposed for $B+L$, so its anomalous Ward identity records physical charge transport rather than failure of a gauge quotient. ∎

**Definition X.8d.2 (Bordism-Valued PU Anomaly Class).** Let $\mathsf B$ be a regular $d$-dimensional effective-action branch whose declared predictive redundancies are represented by a tangential and internal structure
$$
G_{\mathrm{PU}}(\mathsf B)\to O(d).
$$
This structure includes the spin or pin data used by the branch, the gauge quotient, any finite stabilizer data retained by PPI, and any boundary or interface labels that are declared part of the redundancy descent problem. Let
$$
\Omega_{d+1}^{G_{\mathrm{PU}}(\mathsf B)}
$$
be the corresponding $(d+1)$-dimensional bordism group of closed test manifolds with $G_{\mathrm{PU}}(\mathsf B)$ structure. A bordism anomaly character is a homomorphism
$$
\alpha_{\mathsf B}:
\Omega_{d+1}^{G_{\mathrm{PU}}(\mathsf B)}
\to
U(1).
\tag{X.8d.1}
$$
When the branch is split into bulk, boundary, and interface pieces, write
$$
\alpha_{\mathsf B}^{\mathrm{tot}}
=
\alpha_{\mathsf B}^{\mathrm{bulk}}
+
\alpha_{\mathsf B}^{\partial}
+
\alpha_{\mathsf B}^{\mathrm{int}},
\tag{X.8d.2}
$$
where addition denotes multiplication of $U(1)$ phases after identifying characters additively.

A character of $\Omega_{d+1}^{G_{\mathrm{PU}}(\mathsf B)}$ alone does not specify a local anomaly polynomial or a Chern-Weil projection to the cocycle of Definition X.8d.0. The branch must supply that local anomaly datum and its descent test independently. After the local obstruction is cancelled, an accepted anomaly realization may identify $\alpha_{\mathsf B}$ with the residual global phases on closed test manifolds. Its restriction to finite-order bordism classes records the torsion phases covered by that realization. Any claim that these local and global tests exhaust the physical anomaly problem requires a completeness certificate for the declared structure and protocol family.

**Theorem X.8d.3 (Bordism-PCE Global Anomaly Gate).** On a regular branch admitting Definition X.8d.2, assume that the local anomaly datum and its descent test are supplied independently and that an accepted anomaly realization identifies the character with the physical residual global phases on every declared closed test manifold after cancellation of the local obstruction:

1. If a transformation is declared to be a predictive redundancy, then physical descent requires
$$
\alpha_{\mathsf B}^{\mathrm{tot}}=0
\quad
\text{in }
\operatorname{Hom}
\left(
\Omega_{d+1}^{G_{\mathrm{PU}}(\mathsf B)},U(1)
\right).
\tag{X.8d.3}
$$

2. If $\alpha_{\mathsf B}^{\mathrm{tot}}\ne0$, then there exists a closed $G_{\mathrm{PU}}(\mathsf B)$ test manifold $M^{d+1}$ for which
$$
\alpha_{\mathsf B}^{\mathrm{tot}}([M])\ne1.
\tag{X.8d.4}
$$
The branch cannot treat the corresponding transformation as a redundancy at finite PCE cost.

3. If the independently supplied local anomaly passes the descent test of Theorem X.8d and the residual bordism character satisfies (X.8d.3), the branch passes these two registered anomaly tests. They imply absence of all physical anomaly obstructions only when the realization certificate proves that the tests exhaust the anomaly data for the declared structure and protocol family. A variation under a transformation outside the redundancy groupoid is not a failure of that quotient descent.

4. Theorem X.8d supplies the declared groupoid descent criterion. The bordism character supplies the additional closed-test-manifold phases covered by its realization certificate, including any registered torsion classes. Neither criterion is inferred from the other without a specified comparison map.

*Proof.* A redundancy is an identification of predictive descriptions. If a closed $G_{\mathrm{PU}}(\mathsf B)$ test history $M^{d+1}$ has nontrivial anomaly phase $\alpha_{\mathsf B}^{\mathrm{tot}}([M])\ne1$, then two histories identified by the declared redundancy assign different phases to the same physical quotient datum. This is exactly the failure mode ruled out by MPU-equivalence and by the descent criterion in Theorem X.8d. Thus descent requires (X.8d.3), proving item 1.

If $\alpha_{\mathsf B}^{\mathrm{tot}}\ne0$ as a homomorphism, then by definition of nonzero character there is an element $[M]\in\Omega_{d+1}^{G_{\mathrm{PU}}(\mathsf B)}$ with nontrivial value. Evaluating the branch on that closed test manifold gives (X.8d.4). Since no local observer-independent quotient can assign both phase values to one identified physical history, the declared redundancy is inadmissible at finite PCE cost. This proves item 2.

For item 3, the local descent test gives the permitted counterterm descent of Theorem X.8d on its declared source domain. Vanishing of the accepted character removes the residual phases on every registered closed test manifold. A completeness certificate is needed to infer that no physical anomaly data remain outside these tests. Transformations outside the redundancy groupoid impose no quotient identification, so their Ward variation is not a contradiction to this descent criterion.

For item 4, Theorem X.8d and the accepted bordism realization test their respective declared anomaly data. Any relation between them must be part of the realization certificate; neither Definition X.8d.0 nor Definition X.8d.2 constructs that relation. In particular, torsion phases may already occur in a groupoid cocycle, and no universal torsion-forgetting projection is used. ∎

**Corollary X.8d.4 (Finite-Stabilizer Torsion Audit).** Any finite stabilizer, Golay-Leech, Conway, Monster, flavor, or family label that is promoted from branch-internal data to a declared redundancy must pass the bordism gate
$$
\alpha_{\mathsf B}^{\mathrm{tot}}=0.
$$
If the label has no operational action it is removed by PCE as in Corollary G.8.4h.3. If it has operational action but carries a nontrivial torsion anomaly not canceled by an admissible boundary or interface sector, it cannot be a redundancy of the physical quotient.

*Proof.* Finite groups and finite stabilizer data can carry torsion bordism characters even when the local anomaly polynomial vanishes. If the label is operationally null, Corollary G.8.4h.3 removes it. If it is operationally active and declared to identify descriptions, Theorem X.8d.3 applies. A nonzero torsion character gives a closed test manifold with nontrivial phase and blocks redundancy descent unless the boundary or interface character cancels it. ∎

**Definition X.8d.4a (Finite Anomaly-Bordism Certificate Gate).** For a declared predictive-frame redundancy $G$ acting on a finite branch $\mathsf B$, a finite anomaly-bordism certificate gate is a record

$$
\mathfrak A_{\mathrm{bord}}(G,\mathsf B)
=
(I_{d+2}^{\mathrm{loc}},\alpha_{\mathrm{tors}},\beta_{\mathrm{inflow}},\rho_{\mathrm{matter}},\rho_{\mathrm{edge}},\partial_{\mathrm{PCE}},\mathcal Z,\mathfrak h_A)
$$

where $I_{d+2}^{\mathrm{loc}}$ is the local anomaly representative, $\alpha_{\mathrm{tors}}\in\operatorname{Hom}(\Omega_{d+1}^{G_{\mathrm{PU}}(\mathsf B)},U(1))$ is the torsion/global anomaly character, $\beta_{\mathrm{inflow}}$ is the boundary or interface inflow class, $\rho_{\mathrm{matter}}$ and $\rho_{\mathrm{edge}}$ are the finite matter and edge ledgers, $\partial_{\mathrm{PCE}}$ is the connecting map into the finite predictive obstruction complex of Theorem X.9.5b, $\mathcal Z$ is an explicit zero-total-class witness or accepted defect-filling datum in the sense of Definition X.9.5e, and $\mathfrak h_A$ is the registry commitment fixing these entries before validation comparison.

The total anomaly entry is

$$
\mathcal A_{\mathrm{tot}}
:=
[I_{d+2}^{\mathrm{loc}}]
\oplus
\alpha_{\mathrm{tors}}
\oplus
\partial_{\mathrm{PCE}}(\beta_{\mathrm{inflow}})
\tag{X.8d.4a.1}
$$

after response-null labels are quotiented. The direct-sum decomposition is accepted only when the local, torsion, and inflow entries are sector-separated in the obstruction complex, so that response-null quotienting may be checked componentwise.

**Algorithm X.8d.4b (Anomaly-Bordism Gate).** A declared redundancy passes the finite anomaly-bordism gate only if:

1. the local anomaly representative $I_{d+2}^{\mathrm{loc}}$ is computed on the retained finite regulator branch;
2. the torsion/global character $\alpha_{\mathrm{tors}}$ is computed on the retained finite large-protocol transformations;
3. the boundary or interface inflow class $\beta_{\mathrm{inflow}}$ is pushed through $\partial_{\mathrm{PCE}}$;
4. response-null labels are removed componentwise under the sector-separation hypothesis of Definition X.8d.4a;
5. an explicit witness $\mathcal Z$ proves $\mathcal A_{\mathrm{tot}}=0$ after ordinary cancellation, response-null quotienting, or accepted defect filling;
6. the commitment witness $\mathfrak h_A$ is registered before validation comparison.

If the gate fails, the transformation is not a redundancy of the physical PPI quotient on that branch. It must be excluded, completed by accepted boundary/interface/defect data, or treated as a physical update channel rather than a quotient symmetry.

**Definition X.8d.5 (Retained Global Response Symmetry Under PCE Compression).** Let
$$
\mathcal C_{\Lambda\to\mu}:\mathsf B_{\Lambda}\to\mathsf B_{\mu}
$$
be a regular PCE/RG compression between predictive branches, with $\mu<\Lambda$. Let $\mathcal S$ be a symmetry datum that is not included in the redundancy groupoid of Theorem X.8d. The datum $\mathcal S$ is retained by the compression when there exists a background-field protocol family $\mathcal P_{\mathcal S}$ such that:

1. $\mathcal S$ acts on the protocol-response presheaf of $\mathsf B_{\Lambda}$;

2. the compressed branch $\mathsf B_{\mu}$ still has a nontrivial response to the corresponding background fields;

3. the action is not PCE-null under Definition X.9.1 and Proposition X.9.3.

For a retained $\mathcal S$, write
$$
[\mathcal A_{\Lambda}(\mathcal S)]
$$
for its UV anomaly class and
$$
[\mathcal A_{\mu}(\mathcal S)]
$$
for the total IR anomaly class after including all retained Goldstone, topological, boundary, interface, and defect-response sectors.

**Theorem X.8d.6 (PCE Anomaly Matching for Retained Global Response Symmetries).** Let $\mathcal C_{\Lambda\to\mu}$ be a regular PCE/RG compression that preserves the predictive generating functional up to local counterterms and PPI-equivalence on all background-field protocols for a retained global response symmetry $\mathcal S$. Restrict to a connected background-source domain on which both generating functionals are nonzero and the declared anomaly phases and local counterterms are defined. Then
$$
[\mathcal A_{\Lambda}(\mathcal S)]
=
[\mathcal A_{\mu}(\mathcal S)]
\tag{X.8d.5}
$$
in the anomaly group appropriate to the branch, including the bordism-valued refinement when Definition X.8d.2 is available.

Equivalently, PCE compression may remove redundant states and response-null labels, but it cannot erase the anomaly of a symmetry that remains operationally retained.

*Proof.* Couple the UV branch to nondynamical background fields $B$ for $\mathcal S$. Under a background symmetry transformation $g$, the UV generating functional changes by
$$
Z_{\Lambda}[B^g]
=
e^{i\mathcal A_{\Lambda}(g,B)}
Z_{\Lambda}[B].
\tag{X.8d.6}
$$
Regular PCE/RG compression preserves the generating functional up to a local counterterm $C_{\Lambda\to\mu}[B]$ and PPI-equivalence:
$$
Z_{\Lambda}[B]
=
e^{iC_{\Lambda\to\mu}[B]}
Z_{\mu}[B]
$$
on all retained background-field protocols. Applying this identity to $B^g$ and comparing with (X.8d.6) gives
$$
e^{i\mathcal A_{\Lambda}(g,B)}
=
e^{i(C_{\Lambda\to\mu}[B^g]-C_{\Lambda\to\mu}[B])}
e^{i\mathcal A_{\mu}(g,B)}.
\tag{X.8d.7}
$$
The counterterm difference is a local coboundary. Hence the cohomology or bordism class of the anomaly is unchanged:
$$
[\mathcal A_{\Lambda}(\mathcal S)]
=
[\mathcal A_{\mu}(\mathcal S)].
$$
If the equality failed, there would be a background-field protocol distinguishing the UV and compressed branches by their symmetry variation. That contradicts PPI-equivalence for a retained symmetry. ∎

**Corollary X.8d.7 (No Trivial Symmetric IR for a Nonzero Retained Anomaly).** Suppose $\mathcal S$ is retained and
$$
[\mathcal A_{\Lambda}(\mathcal S)]\ne0.
$$
Then the IR branch cannot be simultaneously:

1. fully gapped;

2. symmetry-preserving for $\mathcal S$;

3. short-range entangled and topologically trivial;

4. free of boundary, interface, Goldstone, or defect sectors carrying the matching anomaly.

*Proof.* A fully gapped, symmetry-preserving, short-range-entangled, topologically trivial IR branch with no boundary, Goldstone, interface, topological, or defect sector has
$$
[\mathcal A_{\mu}(\mathcal S)]=0.
$$
Theorem X.8d.6 would then force
$$
[\mathcal A_{\Lambda}(\mathcal S)]=0,
$$
contradicting the hypothesis. ∎

**Corollary X.8d.8 (Global-Current Channels Under Flow).** A retained family/flavor or finite-stabilizer response symmetry obeys anomaly matching under a compression satisfying the background-protocol and generating-functional hypotheses of Theorem X.8d.6. The electroweak $B+L$ update channel of Appendix Y has the same conclusion only when the branch supplies that background-symmetry realization and preservation certificate; an anomalous current alone does not establish them. A response-null label may be removed when an admissible complete-cost comparison permits it, and no matching claim for that removed label is made on the compressed branch.

*Proof.* Corollary X.8d.1 distinguishes redundancy descent from a physical current variation. For a retained background symmetry satisfying the hypotheses of Theorem X.8d.6, the generating-functional identity changes the anomaly only by a local coboundary, proving matching. An electroweak $B+L$ application requires the same realization certificate. Response nullity removes the matching question only after the branch has admitted a cost-compatible removal of the label; Proposition X.9.3 alone proves invariance for its specified reparameterizations. ∎

**Theorem X.8e (Gauge Coupling Running as Shadow-Price Flow).** On a regular constrained PCE branch with background-field effective action
$$
\Gamma_k^{\mathrm{gauge}}
=
-\frac14\int Z_A(k)F_{\mu\nu}F^{\mu\nu}\sqrt{-g}\,d^4x+\cdots,
$$
suppose the gauge-field stiffness is the normalized multiplier of an active predictive-coherence constraint:
$$
g_A^{-2}(k)=\eta_A(k)=\mathcal N_A(k)\lambda_A(k),
$$
where $\lambda_A(k)$ is the KKT shadow price at resolution $k$ and $\mathcal N_A(k)>0$ is the Ward/interface normalization of the branch. Then the beta function is equivalently the logarithmic price flow
$$
\beta_A(k)
:=
k\frac{dg_A}{dk}
=
-\frac12 g_A(k)\,k\frac{d}{dk}\ln\eta_A(k).
$$
Equivalently,
$$
k\frac{d}{dk}g_A^{-2}(k)
=
k\frac{d}{dk}\eta_A(k).
$$
A scale $\mu_*$ at which canonically normalized gauge prices coincide,
$$
\eta_1(\mu_*)=\eta_2(\mu_*)=\eta_3(\mu_*),
$$
is a price-equalization scale. It is the PCE form of gauge-coupling unification on that branch.

*Proof.* By hypothesis $g_A^{-2}=\eta_A$. Taking logarithms gives
$$
-2\ln g_A=\ln\eta_A.
$$
Differentiating with $k\,d/dk$ yields
$$
-2\frac{k\,dg_A/dk}{g_A}=k\frac{d}{dk}\ln\eta_A.
$$
Solving gives
$$
\beta_A=k\frac{dg_A}{dk}
=
-\frac12 g_A k\frac{d}{dk}\ln\eta_A.
$$
The derivative identity for $g_A^{-2}$ is just differentiation of $g_A^{-2}=\eta_A$. The final statement follows from the definition of canonical price equality: if the physical stiffnesses are the normalized prices, equality of stiffnesses is equality of the corresponding inverse squared couplings. ∎

### X.8f Predictive Noether-KKT Equivalence

**Definition X.8f.1 (Augmented PCE Lagrangian).** Let $x$ be a retained finite-mode coordinate on a regular PCE branch. Let
$$
g_i(x)=0,\qquad h_a(x)\le0
$$
be differentiable admissibility constraints, and let $V_{\mathrm{PCE}}(x)$ be the differentiable PCE objective. The augmented PCE Lagrangian is
$$
\mathscr L_{\mathrm{PCE}}(x,\lambda,\mu)
=
V_{\mathrm{PCE}}(x)
+
\sum_i\lambda_i g_i(x)
+
\sum_a\mu_a h_a(x),
\tag{X.8f.1}
$$
with $\mu_a\ge0$ and complementary slackness $\mu_a h_a(x)=0$.

**Theorem X.8f.2 (KKT Stationarity, Conditional Noether Identities, and Shadow Prices).** Assume the objective and constraints are continuously differentiable and the active constraint gradients satisfy the linear-independence constraint qualification at a local optimum $x^*$. Then:

1. there are unique KKT multipliers $(\lambda^*,\mu^*)$ satisfying primal feasibility, dual feasibility, complementary slackness, and
$$
d_x\mathscr L_{\mathrm{PCE}}(x^*,\lambda^*,\mu^*)=0;
\tag{X.8f.2}
$$
2. if a Lie group $G$ preserves $V_{\mathrm{PCE}}$ and every active constraint, then each infinitesimal generator $\xi_X$ satisfies the independent symmetry identities
$$
dV_{\mathrm{PCE}}(x)[\xi_X(x)]=0,
\qquad
dg_i(x)[\xi_X(x)]=0,
\qquad
dh_a(x)[\xi_X(x)]=0
\tag{X.8f.3}
$$
wherever the corresponding functions are invariant;
3. on a continuum branch, these symmetry identities yield a Noether current only when the branch supplies a differentiable local action, invariance up to a boundary divergence, admissible boundary conditions, and the Euler–Lagrange equations. A local Ward identity additionally requires invariance of the functional measure, or cancellation of the anomaly class, and arbitrary compactly supported gauge parameters;
4. suppose the objective and constraints are twice continuously differentiable jointly in the optimizer variables and the external parameters, with $b_i$ entering the equality constraint as $g_i(x,b)=\bar g_i(x)-b_i$ and no additional explicit $b_i$-dependence in the objective or other constraints, the active set is locally constant under the parameter $b$, and the bordered KKT Jacobian at $(x^*,\lambda^*,\mu^*)$ is nonsingular. Then the local optimizer and multiplier maps are differentiable and
$$
\frac{\partial V^*}{\partial b_i}=-\lambda_i^*.
\tag{X.8f.4}
$$
The same formula holds for an active inequality while these strong-regularity and active-set hypotheses persist.

*Proof.* The KKT theorem under LICQ gives multipliers satisfying stationarity, feasibility, dual feasibility, and complementary slackness. If two multiplier vectors satisfied stationarity, their difference would be a vanishing linear combination of the active gradients. LICQ makes every coefficient vanish, proving uniqueness.

For an invariant function $F$ and the orbit curve $x(t)=\exp(t\xi)\cdot x$, invariance gives $F(x(t))=F(x)$. Differentiation at $t=0$ gives $dF(x)[\xi_X(x)]=0$. Applying this to the objective and constraints proves (X.8f.3). This identity holds independently of KKT stationarity.

Under the continuum hypotheses in item 3, Noether's first theorem (Noether, 1918) applies to the invariant local action: localization of a global parameter, integration by parts, and the Euler–Lagrange equations give the on-shell divergence of the Noether current. For a gauge parameter $\alpha^A(x)$ of compact support, invariance of the effective action and measure gives
$$
0=\delta_\alpha\Gamma
=
\int \alpha^A(x)\mathcal W_A(x)\,d^4x.
$$
The fundamental lemma of the calculus of variations yields $\mathcal W_A=0$. If the measure has a nonzero anomaly, the right-hand side is the corresponding anomaly functional and the homogeneous Ward identity does not follow.

For item 4, nonsingularity of the bordered KKT Jacobian and the implicit-function theorem give differentiable maps $x(b)$ and $\lambda(b)$ on the stable active face. Stationarity gives
$$
dV_{\mathrm{PCE}}(x(b))
=
-\sum_j\lambda_j(b)\,dg_j(x(b)).
$$
Differentiating $g_j(x(b))=b_j$ gives $dg_j(x(b))[\partial x/\partial b_i]=\delta_{ij}$. Therefore
$$
\frac{\partial V^*}{\partial b_i}
=
dV_{\mathrm{PCE}}(x(b))\left[\frac{\partial x}{\partial b_i}\right]
=
-\lambda_i(b),
$$
which proves (X.8f.4). ∎

**Corollary X.8f.3 (Compatibility of Symmetry Identities and KKT Shadow Prices).** On a branch satisfying all hypotheses of Theorem X.8f.2, Noether or Ward identities and KKT shadow prices can be represented in the same augmented variational model. The symmetry identities require the continuum invariance, boundary, equation-of-motion, and measure hypotheses of item 3; the shadow prices require the constraint and strong-regularity hypotheses of items 1 and 4.

*Proof.* Item 3 of Theorem X.8f.2 gives the conditional Noether and Ward conclusions. Items 1 and 4 give the KKT multipliers and their sensitivity interpretation. The conclusions share an augmented functional but follow from disjoint hypothesis sets. ∎

**Remark X.8f.3a (Logical Separation of Conservation Laws and Active Normalizations).** A regular PCE branch may encode symmetry identities and active coupling normalizations in one augmented functional. Charge, stress-energy, and angular-momentum conservation require the corresponding action symmetries and Noether hypotheses. Gauge Ward identities additionally require an invariant measure or anomaly cancellation. Active coupling normalizations require the stated constraint and KKT data. None of these inputs selects the others.

### X.8g Fisher-Symplectic Predictive Response

**Definition X.8g.1 (Hermitian Predictive Response Form).** Let $T$ be a finite-dimensional complex tangent space of retained perturbations on a regular MPU branch. A Hermitian predictive response form is a positive definite Hermitian form
$$
K:T\times T\to\mathbb C,
\qquad
K(u,v)=\overline{K(v,u)}.
$$
On the real tangent space $T_{\mathbb R}$ define
$$
g(u,v)=\operatorname{Re}K(u,v),
\qquad
\omega(u,v)=\operatorname{Im}K(u,v),
\qquad
J u=i u.
\tag{X.8g.1}
$$

**Theorem X.8g.2 (Fisher-Symplectic Response Decomposition).** The triple $(g,\omega,J)$ satisfies:
$$
g(u,v)=g(v,u),
\qquad
g(u,u)>0\text{ for }u\ne0,
$$
$$
\omega(u,v)=-\omega(v,u),
\qquad
J^2=-1,
$$
and
$$
\omega(u,v)=g(Ju,v),
\qquad
g(Ju,Jv)=g(u,v).
\tag{X.8g.2}
$$
Thus the symmetric Fisher/Onsager response and the antisymmetric reversible response are the real and imaginary parts of one Hermitian predictive kernel.

*Proof.* Hermiticity gives
$$
K(v,u)=\overline{K(u,v)}.
$$
Taking real parts gives $g(v,u)=g(u,v)$, and taking imaginary parts gives $\omega(v,u)=-\omega(u,v)$. Positivity of $K$ gives
$$
g(u,u)=K(u,u)>0
$$
for $u\ne0$. Since $J$ is multiplication by $i$, $J^2=-1$. For the compatibility identities, use complex linearity in the second slot and conjugate linearity in the first slot:
$$
K(Ju,v)=K(iu,v)=-iK(u,v).
$$
Writing $K(u,v)=g(u,v)+i\omega(u,v)$ gives
$$
K(Ju,v)=\omega(u,v)-ig(u,v).
$$
Taking real parts yields
$$
g(Ju,v)=\omega(u,v).
$$
Applying this with $u$ replaced by $Ju$ and using $J^2=-1$ gives
$$
g(Ju,Jv)=\omega(u,Jv)=g(Ju,Jv),
$$
and directly from Hermitian invariance under multiplication by $i$,
$$
K(Ju,Jv)=K(u,v),
$$
so taking real parts gives $g(Ju,Jv)=g(u,v)$. ∎

**Corollary X.8g.3 (Dissipative and Reversible Dynamics as Two Projections).** For a real functional $F$ on the regular branch, define the $g$-gradient by
$$
g(\nabla_gF,v)=dF(v)
$$
and the Hamiltonian vector field by
$$
\omega(X_F,v)=dF(v).
$$
Then
$$
X_F=-J\nabla_gF.
\tag{X.8g.3}
$$
Hence PCE relaxation and reversible unitary/classical response are respectively the gradient and symplectic projections of the same Hermitian predictive response form.

*Proof.* By Theorem X.8g.2,
$$
\omega(X_F,v)=g(JX_F,v).
$$
Since $\omega(X_F,v)=dF(v)=g(\nabla_gF,v)$ for every $v$, nondegeneracy of $g$ gives
$$
JX_F=\nabla_gF.
$$
Multiplying by $-J$ and using $J^2=-1$ yields $X_F=-J\nabla_gF$. ∎

**Definition X.8g.4 (Becoming-Flow Compression Datum).** A becoming-flow compression datum on a retained regular branch is a finite record
$$
\mathfrak C_{\Omega}
=
(\mathcal Z,\mathcal G,\mathsf J_{\Omega},\mathsf E_{\Omega},\Phi_{\Omega},\mathcal K_{\Omega},\Pi_{\Omega},\mathfrak o_{\Omega})
$$
with the following entries.

1. $\mathcal Z$ is a finite retained state bundle whose chart projections include the accepted branch variables: the projective Hilbert ray sector $\mathbb P(\mathbb C^{d_0})$ when the Hilbert-carrier branch is used, the perspective sector $\Sigma$, the retained PCE/adaptation coordinates, and any boundary-geometry variables already accepted in the continuum/gravity branch. On the minimal Hilbert branch $d_0=8$, the ray factor is $\mathbb{CP}^7$.
2. $\mathcal G$ is a positive retained response metric whose sector projections agree with the accepted Fisher/QFI/Fubini-Study/Bures or natural-gradient metrics on the corresponding branch, after quotienting response-null directions, with the ray-sector normalization fixed below. On the projective Hilbert ray sector the quantum Fisher, Fubini-Study and Bures metrics are $F_Q=4g_{\mathrm{FS}}$ (Theorem 23c), $g_{\mathrm{FS}}$ and $\tfrac14F_Q=g_{\mathrm{FS}}$; with ray generator $\Phi_{\Omega}|_{\mathrm{ray}}=\langle H\rangle$ the ray projection is the multiple $2g_{\mathrm{FS}}=\tfrac12F_Q$ of these metrics, the normalization under which (X.8g.4a) with $\mathsf E_{\Omega}=0$ on the ray block is the projective Schrödinger flow $[e^{-iHt/\hbar}\psi]$ (Theorem X.8g.7).
3. $\mathsf J_{\Omega}$ is a skew-adjoint reversible-response operator. It restricts to the complex structure $J$ of Theorem X.8g.2 on the reversible Hilbert response subbundle, is zero on purely dissipative/adaptive blocks unless a branch certificate supplies a reversible coupling there, and is recorded block-by-block in $\mathfrak o_{\Omega}$.
4. $\mathsf E_{\Omega}$ is a self-adjoint positive semidefinite verification/adaptation mobility operator. It is supported only on dissipative, verification, coarse-graining, or slow-adaptation blocks supplied by the branch record; it is not a tunable continuum collapse parameter.
5. $\Phi_{\Omega}$ is the retained PCE generator in the units of the flow. When the local generator is first written as a nat-rate $\Phi_{\mathrm{nat}}$, the mechanical generator is $\Phi_{\Omega}=\hbar\Phi_{\mathrm{nat}}$ on branches where Theorem Q.0.1 and Corollary Q.0.1 supply the action-entropy bridge. Thus $\hbar$ is consumed as the existing unit bridge, not rederived here.
6. $\mathcal K_{\Omega}$ is the finite list of active feasibility constraints, written as equalities $g_i(\mathcal Z)=0$ and inequalities $h_a(\mathcal Z)\le0$. Capacity constraints use $h_a=\mathcal C_a-C_a^{\max}$.
7. $\Pi_{\Omega}$ is the finite projection ledger from $\mathcal Z$ to the ray, response, PCE, boundary, KKT, and measurement sectors claimed by the branch.
8. $\mathfrak o_{\Omega}$ is the overlap audit proving that all sector projections use the same retained response presheaves, unit bridges, and branch hypotheses already registered in the strict-certificate ledger.

On an accepted $\mathfrak C_{\Omega}$ branch, the compressed flow is
$$
\hbar\frac{D\mathcal Z}{Dt}
=
\Pi_{T_{\mathcal K}}
\left[-(\mathsf J_{\Omega}+\mathsf E_{\Omega})\operatorname{grad}_{\mathcal G}\Phi_{\Omega}[\mathcal Z]\right],
\tag{X.8g.4a}
$$
where $D/Dt$ is the branch connection on $\mathcal Z$ and $\Pi_{T_{\mathcal K}}$ is projection to the active feasible tangent cone. At a constrained local minimum of $\Phi_{\Omega}$ satisfying the differentiability and linear-independence constraint qualification of Theorem X.8f.2, the KKT condition is
$$
d\Phi_{\Omega}+
\sum_i\lambda_i\,dg_i+
\sum_a\zeta_a\,d(\mathcal C_a-C_a^{\max})=0,
\qquad
\zeta_a\ge0,
\qquad
\zeta_a(\mathcal C_a-C_a^{\max})=0.
\tag{X.8g.4b}
$$
The multiplier sign convention and shadow-price interpretation are inherited from Theorem X.8f.2.

**Proposition X.8g.5 (Projection Guardrail for the Becoming Flow).** Suppose $\mathfrak C_{\Omega}$ is accepted. Then Equation (X.8g.4a) has the following sector readings, and no stronger reading.

1. On the ray sector, if $\Phi_{\Omega}|_{\mathrm{ray}}=\langle H\rangle$, $\mathsf E_{\Omega}=0$ on that sector, and the branch carries the Section 8 Hilbert/Stone data, (X.8g.4a) reduces to the projective Schrödinger/Kähler-Hamiltonian flow by Corollary X.8g.3.
2. On a purely dissipative or slow-adaptation sector, if $\mathsf J_{\Omega}=0$ and $\mathsf E_{\Omega}$ is the accepted mobility, (X.8g.4a) reduces to the corresponding natural-gradient PCE/adaptation flow. The structural binary reference $\varepsilon_0=\ln2$ enters only on a branch carrying the binary quotient of Proposition 5 and Theorem J.1. A physical reset cost enters only for registered resets satisfying Theorem 31 and is bounded by the distribution-sensitive quantity $H_q(P\mid R)$; smooth damping alone does not assert a reset cost or a new collapse law.
3. At constrained local minima satisfying the differentiability and LICQ hypotheses of Theorem X.8f.2, (X.8g.4b) gives KKT stationarity. Noether/Ward identities additionally require that theorem's action-symmetry, boundary, equation-of-motion, and measure or anomaly-cancellation hypotheses; differentiable shadow-price sensitivity also requires its strong-regularity hypotheses. It identifies only those active coupling or capacity entries whose constraints already belong to $\mathcal K_{\Omega}$ and whose unit bridges are present in $\mathfrak o_{\Omega}$.
4. On a local-horizon boundary sector, the KKT reading supplies the variational form used by the gravity branch only when the full Section 12 package is already present: Lorentzian/cone input, local KMS/Clausius input, area-density calibration, and the Appendix B stress-energy source. Equation (X.8g.4a) is not an independent derivation of Theorem 50 without that package.
5. The Born-rule probabilities remain the Section 8 Hilbert/Born operator-structure theorem chain. The becoming-flow datum may use the same response metric and projection ledger, but it does not replace Gleason-Busch or promote non-Hilbert branches.

*Proof.* Item 1 is Corollary X.8g.3 applied to the Hilbert ray projection with generator $\langle H\rangle$ and no dissipative mobility on that block. Item 2 is the definition of natural-gradient descent after restricting the flow to a block with zero reversible operator; the entropy floor is a separate discrete-event theorem and therefore enters only through the event branch. For item 3, Theorem X.8f.2 gives Equation (X.8g.4b) at the stipulated constrained local minimum with LICQ and $h_a=\mathcal C_a-C_a^{\max}$. Its independent symmetry, continuum, and strong-regularity premises supply the respective Noether/Ward and differentiable shadow-price conclusions. Item 4 follows because Theorem 50 uses the Section 12 gravity-bridge hypotheses as inputs; a projected stationarity equation can supply the variational slot only after those inputs exist. Item 5 is a dependency audit: the Born rule is derived by the Section 8 operator-measure route, while $\mathfrak C_{\Omega}$ records a compatible flow on the already accepted branch. ∎

**Remark X.8g.6 (Status of the Equation of Becoming).** On a branch carrying $\mathfrak C_{\Omega}$, Equation (X.8g.4a) may be called the Equation of Becoming. Its status is compression/certificate-level: one retained flow datum recovers already accepted sector dynamics by projection. A failed projection falsifies the accepted $\mathfrak C_{\Omega}$ branch or the offending sector record, not the theorem-level PU backbone. The Landauer phase grid $g_L=e^{i\ln2}$ and related Appendix Q signatures can be read as fingerprints of this compression only on branches where the corresponding Action-Entropy and phase-generator records are already accepted.

**Theorem X.8g.7 (Finite Ray–Perspective–Adaptation Becoming-Flow Datum).** Fix an integer $d\ge2$ and a Hermitian operator $H$ on $\mathbb C^d$; a finite-dimensional real space $\mathscr H_\Sigma\subset L^2(\Sigma,\nu)$ of perspective perturbations, with $\nu$ a finite measure, carrying a nonnegative $\nu$-self-adjoint operator $B_\Sigma$ that represents the retained perspective form $\mathcal E_\Sigma(f,g)=\langle f,B_\Sigma g\rangle_\nu$; an integer $n\ge1$, a positive definite matrix $F\in\mathbb R^{n\times n}$, a mobility $\mu>0$, a convex nat-rate PCE objective $V\in C^1(\mathbb R^n)$, and convex capacity functions $h_a=\mathcal C_a-C_a^{\max}\in C^1(\mathbb R^n)$, $a=1,\dots,r$, with a Slater point $\bar\theta$ satisfying $h_a(\bar\theta)<0$ for every $a$. Put $K=\{\theta\in\mathbb R^n:h_a(\theta)\le0\ \text{for every }a\}$. The matrix $F$ is the Fisher metric of the Gaussian location family $\mathcal N(\theta,F^{-1})$ in its mean coordinate. Represent a tangent vector to $\mathbb{CP}^{d-1}$ at $[\psi]$, $\lVert\psi\rVert=1$, by its horizontal lift $u\in\mathbb C^d$, $\langle\psi,u\rangle=0$, and write $g_{\mathrm{FS}}(u,v)=\operatorname{Re}\langle u,v\rangle$ and $\langle H\rangle_\psi=\langle\psi,H\psi\rangle$. On
$$
\mathcal Z=\mathbb{CP}^{d-1}\times\mathscr H_\Sigma\times K
$$
set
$$
\mathcal G=2g_{\mathrm{FS}}\oplus\langle\cdot,\cdot\rangle_\nu\oplus F,
\qquad
\mathsf J_\Omega=J\oplus0\oplus0,\quad Ju=iu,
\qquad
\mathsf E_\Omega=0\oplus I\oplus\mu I,
\tag{X.8g.7.1}
$$
$$
\Phi_\Omega([\psi],f,\theta)
=
\langle H\rangle_\psi
+\frac\hbar2\langle f,B_\Sigma f\rangle_\nu
+\hbar V(\theta),
\tag{X.8g.7.2}
$$
let $\mathcal K_\Omega$ be the list $h_a\le0$, let $\Pi_\Omega$ consist of the ray, perspective, adaptation and KKT projections, and let $\Pi_{T_{\mathcal K}}$ be the $\mathcal G$-metric projection onto the tangent cone $T_{[\psi]}\mathbb{CP}^{d-1}\times\mathscr H_\Sigma\times T_K(\theta)$. Write $\Pi^F_{T_K(\theta)}$ for the $F$-metric projection onto the tangent cone $T_K(\theta)$ and $N_K(\theta)$ for the normal cone. Then:

1. $\mathcal G$ is a Riemannian metric; on the ray block it is the real part of the positive Hermitian form $2\langle\cdot,\cdot\rangle$, so Theorem X.8g.2 gives the compatible triple $(2g_{\mathrm{FS}},J,2\operatorname{Im}\langle\cdot,\cdot\rangle)$; $\mathsf J_\Omega$ is $\mathcal G$-skew-adjoint; and $\mathsf E_\Omega$ is $\mathcal G$-self-adjoint, positive semidefinite and supported on the perspective and adaptation blocks. The perspective and adaptation generators enter through the unit bridge $\Phi_\Omega=\hbar\Phi_{\mathrm{nat}}$ of Definition X.8g.4.

2. With $D\mathcal Z/Dt$ the velocity of the curve, Equation (X.8g.4a) is the decoupled system
$$
\hbar\,\dot\psi_{\mathrm{hor}}=-i\bigl(H-\langle H\rangle_\psi\bigr)\psi,
\qquad
\dot f=-B_\Sigma f,
\qquad
\dot\theta=\mu\,\Pi^F_{T_K(\theta)}\bigl(-F^{-1}\nabla V(\theta)\bigr),
\tag{X.8g.7.3}
$$
where $\dot\psi_{\mathrm{hor}}$ is the horizontal part of the velocity of a unit lift.

3. The ray projection of every solution is $[e^{-iHt/\hbar}\psi_0]$, the projective Schrödinger flow. If the ray block of $\mathcal G$ is replaced by $c\,g_{\mathrm{FS}}$ with $c>0$ and every other entry is kept, the ray projection becomes $[e^{-2iHt/(c\hbar)}\psi_0]$. Hence the ray projection is the projective Schrödinger flow of $H$ for every Hermitian $H$ exactly when $c=2$. The pure-state SLD quantum Fisher metric, $c=4$, and the Fubini--Study or Bures metric, $c=1$, give the projective Schrödinger flows of $H/2$ and $2H$ respectively.

4. The perspective projection of every solution is $f(t)=e^{t\mathcal L_\Sigma}f_0$ with $\mathcal L_\Sigma=-B_\Sigma$, the sign convention of (X.9.6.3), and $\lVert f(t)\rVert_\nu$ is nonincreasing.

5. For every $\theta_0\in K$ there is a unique Lipschitz curve $\theta:[0,\infty)\to K$ with $\theta(0)=\theta_0$ whose right derivative exists at every $t\ge0$ and satisfies the adaptation equation of (X.8g.7.3). On the interior of $K$ it is the natural-gradient flow $\dot\theta=-\mu F^{-1}\nabla V(\theta)$, and along the whole curve
$$
\frac{d^+}{dt}V(\theta(t))
=
-\mu\,\Bigl\lVert\Pi^F_{T_K(\theta(t))}\bigl(-F^{-1}\nabla V(\theta(t))\bigr)\Bigr\rVert_F^2\le0 .
\tag{X.8g.7.4}
$$

6. For $\theta_*\in K$ the following are equivalent: (a) $\theta_*$ is a rest point of the adaptation equation; (b) there are $\zeta_a\ge0$ with $\zeta_ah_a(\theta_*)=0$ and $\nabla V(\theta_*)+\sum_a\zeta_a\nabla h_a(\theta_*)=0$; (c) $\theta_*$ minimizes $V$ on $K$. The rest points of (X.8g.7.3) are exactly the triples $([\psi_*],f_*,\theta_*)$ with $\psi_*$ an eigenvector of $H$, $f_*\in\ker B_\Sigma$ and $\theta_*$ as in (b), and at each of them $d\Phi_\Omega+\sum_a\hbar\zeta_a\,dh_a=0$ on $T\mathcal Z$, which is (X.8g.4b) with multipliers $\hbar\zeta_a$. When the active gradients $\{\nabla h_a(\theta_*):h_a(\theta_*)=0\}$ are linearly independent, these multipliers are unique and are the KKT shadow prices that Theorem X.8f.2 assigns to the minimizer $\theta_*$ of $\hbar V$ on $K$.

7. Along every solution $\langle H\rangle_{\psi(t)}$ is constant and
$$
\frac{d^+}{dt}\Phi_\Omega
=
-\hbar\lVert B_\Sigma f\rVert_\nu^2
-\hbar\mu\,\Bigl\lVert\Pi^F_{T_K(\theta)}\bigl(-F^{-1}\nabla V(\theta)\bigr)\Bigr\rVert_F^2 ,
\tag{X.8g.7.5}
$$
so $\mathsf J_\Omega$ contributes no dissipation and $\Phi_\Omega$ is stationary exactly at perspective and adaptation rest points.

8. The solution set of (X.8g.4a) on $\mathcal Z$ is the product of the ray, perspective and adaptation solution sets of items 3--5. Every sector law in items 3--6 is therefore the image under $\Pi_\Omega$ of the one datum (X.8g.7.1)--(X.8g.7.2), and no sector law enters separately from $(\mathcal G,\mathsf J_\Omega,\mathsf E_\Omega,\Phi_\Omega,\mathcal K_\Omega)$.

*Proof.* Item 1. The form $2\langle u,v\rangle$ is positive definite on horizontal vectors, $\langle\cdot,\cdot\rangle_\nu$ is positive definite on $\mathscr H_\Sigma$, and $F\succ0$, so $\mathcal G$ is Riemannian. Multiplication by $i$ preserves horizontality because $\langle\psi,iu\rangle=i\langle\psi,u\rangle$, and $2\operatorname{Re}\langle iu,v\rangle=2\operatorname{Im}\langle u,v\rangle=-2\operatorname{Re}\langle u,iv\rangle$, which is $\mathcal G$-skewness; Theorem X.8g.2 applies to the Hermitian form $2\langle\cdot,\cdot\rangle$. The blocks $I$ and $\mu I$ are self-adjoint and positive semidefinite for $\langle\cdot,\cdot\rangle_\nu$ and $F$. Replacing $\psi$ by $e^{i\alpha}\psi$ multiplies horizontal lifts by $e^{i\alpha}$ and leaves $\mathcal G$, $J$ and $\Phi_\Omega$ unchanged, so every expression below is defined on rays.

Item 2. For horizontal $u$, $\lVert\psi+su\rVert^2=1+s^2\lVert u\rVert^2$, hence
$$
\frac{d}{ds}\Big|_{s=0}\frac{\langle\psi+su,H(\psi+su)\rangle}{\lVert\psi+su\rVert^2}
=
2\operatorname{Re}\langle H\psi,u\rangle
=
2\operatorname{Re}\bigl\langle(H-\langle H\rangle_\psi)\psi,u\bigr\rangle,
$$
because $\langle\psi,u\rangle=0$. The vector $(H-\langle H\rangle_\psi)\psi$ is horizontal, so it is the $2g_{\mathrm{FS}}$-gradient of the ray block of $\Phi_\Omega$. Self-adjointness of $B_\Sigma$ gives the $\nu$-gradient $\hbar B_\Sigma f$ of the perspective block, and the $F$-gradient of $\hbar V$ is $\hbar F^{-1}\nabla V$. Therefore
$$
-(\mathsf J_\Omega+\mathsf E_\Omega)\operatorname{grad}_{\mathcal G}\Phi_\Omega
=
\bigl(-i(H-\langle H\rangle_\psi)\psi,\ -\hbar B_\Sigma f,\ -\hbar\mu F^{-1}\nabla V(\theta)\bigr).
$$
The squared $\mathcal G$-distance to a product of closed convex cones is the sum of the blockwise squared distances, so $\Pi_{T_{\mathcal K}}$ acts blockwise; it is the identity on the two linear blocks, and positive homogeneity of $\Pi^F_{T_K(\theta)}$ moves the factor $\hbar\mu$ outside. Dividing the perspective and adaptation blocks by $\hbar$ gives (X.8g.7.3).

Item 3. For $\psi(t)=e^{-iHt/\hbar}\psi_0$, $\lVert\psi(t)\rVert=1$ and $\dot\psi=-i\hbar^{-1}H\psi$, whose horizontal part $\dot\psi-\langle\psi,\dot\psi\rangle\psi$ is $-i\hbar^{-1}(H-\langle H\rangle_\psi)\psi$. The ray equation is a smooth vector field on the compact manifold $\mathbb{CP}^{d-1}$, so its solutions are global and unique, and $[\psi(t)]$ is the solution through $[\psi_0]$. With the ray block $c\,g_{\mathrm{FS}}$ the gradient becomes $(2/c)(H-\langle H\rangle_\psi)\psi$, which is the same computation with $H$ replaced by $2H/c$. If $c\ne2$ and $H$ is not a multiple of $I$, take eigenvectors $e_1,e_2$ with distinct eigenvalues and $\psi=(e_1+e_2)/\sqrt2$; then $(H-\langle H\rangle_\psi)\psi\ne0$, and the two vector fields differ at $[\psi]$. For a pure state and a horizontal tangent $u$, Equation (X.8a.2b.2) with the regular SLD limit $c_{\mathrm{SLD}}(1,0)=c_{\mathrm{SLD}}(0,1)=2$ gives the metric value $4\lVert u\rVert^2$, and the Bures metric is one quarter of it; this gives the values $c=4$ and $c=1$.

Item 4. The perspective equation is linear with the nonnegative self-adjoint operator $B_\Sigma$, so $f(t)=e^{-tB_\Sigma}f_0$ is its unique solution and $\lVert e^{-tB_\Sigma}\rVert\le1$.

Item 5. Give $\mathbb R^n$ the inner product $\langle x,y\rangle_F=x^TFy$. The function $\varphi=\mu(V+\iota_K)$, with $\iota_K$ the convex indicator of $K$, is proper, convex and lower semicontinuous because $K$ is closed, convex and nonempty. Since $V$ is finite and continuous, the subdifferential sum rule gives the $F$-subdifferential $\partial^F\varphi(\theta)=\mu\bigl(F^{-1}\nabla V(\theta)+F^{-1}N_K(\theta)\bigr)$ with domain $K$, and $\partial^F\varphi$ is maximal monotone. The Kōmura--Brezis theorem for evolution equations governed by maximal monotone operators (Kōmura 1967; Brezis 1973, Chapter III) gives, for every $\theta_0\in K$, a unique Lipschitz curve in $K$ with $\dot\theta\in-\partial^F\varphi(\theta)$ almost everywhere, whose right derivative exists at every $t\ge0$ and equals minus the element of least $F$-norm of $\partial^F\varphi(\theta(t))$. The cones $T_K(\theta)$ and $F^{-1}N_K(\theta)$ are mutually polar for $\langle\cdot,\cdot\rangle_F$, so Moreau's decomposition writes every $w$ as the $F$-orthogonal sum $w=\Pi^F_{T_K(\theta)}w+\Pi^F_{F^{-1}N_K(\theta)}w$. For $w=-F^{-1}\nabla V(\theta)$, the least-norm element of $-w+F^{-1}N_K(\theta)$ is $-w+\Pi^F_{F^{-1}N_K(\theta)}w=-\Pi^F_{T_K(\theta)}w$, which gives the adaptation equation. On the interior of $K$ the tangent cone is $\mathbb R^n$. The chain rule for the $C^1$ function $V$ along a curve with right derivative, together with $\nabla V=-Fw$ and the orthogonality in Moreau's decomposition, gives $\frac{d^+}{dt}V(\theta(t))=-\mu\langle w,\Pi^F_{T_K}w\rangle_F=-\mu\lVert\Pi^F_{T_K}w\rVert_F^2$, which is (X.8g.7.4).

Item 6. By Moreau's decomposition, $\Pi^F_{T_K(\theta_*)}w=0$ exactly when $w\in F^{-1}N_K(\theta_*)$, that is, $-\nabla V(\theta_*)\in N_K(\theta_*)$. For convex $V$ this is equivalent to (c): if it holds, then $V(y)\ge V(\theta_*)+\nabla V(\theta_*)\cdot(y-\theta_*)\ge V(\theta_*)$ for $y\in K$; conversely, minimality along the segments $\theta_*+s(y-\theta_*)\in K$ gives $\nabla V(\theta_*)\cdot(y-\theta_*)\ge0$. For (b), let $\mathsf A$ be the active set. Convexity gives $\nabla h_a(\theta_*)\cdot(y-\theta_*)\le h_a(y)\le0$ for $a\in\mathsf A$ and $y\in K$, so every nonnegative combination of active gradients lies in $N_K(\theta_*)$. Conversely, let $n\in N_K(\theta_*)$ and let $v$ satisfy $\nabla h_a(\theta_*)\cdot v\le0$ for $a\in\mathsf A$. For $\epsilon>0$ put $v_\epsilon=v+\epsilon(\bar\theta-\theta_*)$. Convexity gives $\nabla h_a(\theta_*)\cdot(\bar\theta-\theta_*)\le h_a(\bar\theta)<0$ for $a\in\mathsf A$, so $\nabla h_a(\theta_*)\cdot v_\epsilon<0$ and $h_a(\theta_*+sv_\epsilon)<0$ for small $s>0$; inactive constraints remain negative by continuity. Hence $\theta_*+sv_\epsilon\in K$, $n\cdot v_\epsilon\le0$, and letting $\epsilon\to0$ gives $n\cdot v\le0$. Farkas' lemma places $n$ in the cone generated by the active gradients, and setting $\zeta_a=0$ for inactive constraints gives (b). A difference of two multiplier vectors is a vanishing combination of active gradients, so linear independence gives uniqueness, and Theorem X.8f.2 applies to the minimizer $\theta_*$ of $\hbar V$ on $K$. The ray component vanishes exactly when $(H-\langle H\rangle_\psi)\psi=0$, that is, when $\psi$ is an eigenvector, and the perspective component vanishes exactly on $\ker B_\Sigma$. At such a triple the ray and perspective differentials of $\Phi_\Omega$ vanish and the adaptation differential is $\hbar\nabla V(\theta_*)=-\sum_a\hbar\zeta_a\nabla h_a(\theta_*)$.

Item 7. Along the ray flow, $\frac{d}{dt}\langle H\rangle_\psi=2\operatorname{Re}\langle w_\psi,-i\hbar^{-1}w_\psi\rangle=0$ with $w_\psi=(H-\langle H\rangle_\psi)\psi$. Along the perspective flow, $\frac{d}{dt}\frac\hbar2\langle f,B_\Sigma f\rangle_\nu=\hbar\langle B_\Sigma f,\dot f\rangle_\nu=-\hbar\lVert B_\Sigma f\rVert_\nu^2$. Multiplying (X.8g.7.4) by $\hbar$ and adding gives (X.8g.7.5).

Item 8. By (X.8g.7.3), the velocity of each block depends only on that block, so a curve solves (X.8g.4a) exactly when each of its three components solves its own equation. ∎

**Resolution TV-X-09-R1 (Metadata).** Exact domain: the finite class $\mathcal Z=\mathbb{CP}^{d-1}\times\mathscr H_\Sigma\times K$ with the data (X.8g.7.1)--(X.8g.7.2); the minimal Hilbert branch $d_0=8$ gives the ray factor $\mathbb{CP}^7$. Premises: a Hermitian $H$; a finite perspective mode space with nonnegative self-adjoint form operator $B_\Sigma$; the Gaussian-location Fisher metric $F$; a mobility $\mu>0$; a convex $C^1$ objective; convex $C^1$ capacity functions with a Slater point; the unit bridge of Definition X.8g.4; and the Kōmura--Brezis well-posedness theorem. Equivalence: the global phase of the ray representative and orthogonal changes of basis in $\mathscr H_\Sigma$. Budget: one Hamiltonian, one perspective form, one Fisher matrix, one mobility, one objective and $r$ capacity functions. Verifier: the gradient identity $\operatorname{grad}\langle H\rangle=(H-\langle H\rangle_\psi)\psi$ for $2g_{\mathrm{FS}}$, the horizontal velocity of $e^{-iHt/\hbar}\psi_0$, Moreau's decomposition and the Slater normal-cone identity. Falsifier: a ray solution of (X.8g.4a) that differs from projective Schrödinger evolution at $c=2$, a perspective solution different from $e^{t\mathcal L_\Sigma}f_0$, or a rest point that fails the KKT system. Provenance class: source-internal finite construction using the cited well-posedness theorem. Downstream consumers: Definition X.8g.4, Proposition X.8g.5 items 1--3, Remark X.8g.6 and `TV-X-09`. Nonvacuity: $d=8$; $\mathscr H_\Sigma=\mathbb R^2$ with counting measure and $B_\Sigma=\begin{pmatrix}1&-1\\-1&1\end{pmatrix}$; $n=1$, $F=1$, $\mu=1$, $V(\theta)=\tfrac12(\theta-2)^2$ and $h(\theta)=\theta-1$, whose adaptation curve from $\theta_0=0$ is $\theta(t)=2-2e^{-t}$ for $t\le\ln2$ and $\theta(t)=1$ afterwards, with multiplier $\zeta=1$. This is `positive-discharge` of the construction of one $(\mathcal G,\Omega,\mathcal K)$ datum whose ray, perspective, adaptation and KKT sectors are exact projections of (X.8g.4a) on the stated finite class, together with the ray-scale lock $\mathcal G_{\mathrm{ray}}=2g_{\mathrm{FS}}$. Population of the accepted branch data, namely the retained Appendix M perspective form, the PCE objective and capacity constraints, any accepted boundary-geometry variables and the overlap audit $\mathfrak o_\Omega$, remains `C` under `TV-X-09`; the horizon reading of Proposition X.8g.5 item 4 consumes the Section 12 package.

### X.8h Predictive S-Matrix Positivity Cone

**Definition X.8h.1 (Forward Predictive Moment Sequence).** On a gapped regular Lorentzian QFT branch, let $\mathcal A(s)$ be a forward two-to-two amplitude analytic at $s=0$ after $m$ subtractions and satisfying the positive spectral representation
$$
\mathcal A(s)
=
P_{m-1}(s)
+
s^m
\int_{\mu_0}^{\infty}
\frac{d\rho(\mu)}{\mu^m(\mu-s)}
\tag{X.8h.1}
$$
for $|s|<\mu_0$, where $\mu_0>0$, $P_{m-1}$ is a polynomial of degree $m-1$, and $d\rho(\mu)$ is a positive measure with finite inverse moments $\int_{\mu_0}^{\infty}\mu^{-n-1}\,d\rho(\mu)<\infty$ for the coefficients under consideration. The Wilson coefficients above the subtraction order are defined by
$$
\mathcal A(s)-P_{m-1}(s)
=
\sum_{n\ge m}c_ns^n.
\tag{X.8h.2}
$$

**Theorem X.8h.2 (Wilson Coefficients Form a Positive Predictive Moment Cone).** Under Definition X.8h.1,
$$
c_n
=
\int_{\mu_0}^{\infty}
\mu^{-n-1}\,d\rho(\mu),
\qquad n\ge m.
\tag{X.8h.3}
$$
Consequently every Hankel matrix
$$
H^{(r)}_{ij}=c_{r+i+j},
\qquad i,j=0,\dots,N,
\qquad r\ge m,
$$
is positive semidefinite. Therefore the admissible coefficient vector lies in the Stieltjes moment cone determined by the positive predictive spectral measure $d\rho$.

*Proof.* For $|s|<\mu_0$,
$$
\frac{1}{\mu-s}
=
\sum_{\ell=0}^{\infty}\frac{s^\ell}{\mu^{\ell+1}}
$$
with uniform convergence on compact subsets of $|s|<\mu_0$. Substituting this expansion into (X.8h.1) and exchanging the uniformly convergent series with the positive measure integral gives
$$
\mathcal A(s)-P_{m-1}(s)
=
s^m\sum_{\ell=0}^{\infty}
s^\ell
\int_{\mu_0}^{\infty}\mu^{-m-\ell-1}\,d\rho(\mu).
$$
Setting $n=m+\ell$ gives (X.8h.3).

For positive semidefiniteness, let $a_0,\dots,a_N\in\mathbb R$. Then
$$
\sum_{i,j=0}^N a_i a_j H^{(r)}_{ij}
=
\sum_{i,j=0}^N a_i a_j c_{r+i+j}
=
\int_{\mu_0}^{\infty}
\mu^{-r-1}
\left(\sum_{i=0}^N a_i\mu^{-i}\right)^2
d\rho(\mu)
\ge0.
$$
Thus every Hankel matrix is positive semidefinite. ∎

**Corollary X.8h.3 (Finite-Resolution EFT Positivity Test).** A finite Wilson vector $(c_m,\dots,c_{m+2N})$ that violates positivity of any Hankel matrix $H^{(r)}$ cannot be the forward low-energy expansion of a PU-admissible gapped unitary causal branch satisfying Definition X.8h.1.

*Proof.* Theorem X.8h.2 proves Hankel positivity for every such branch. A violation contradicts a necessary condition. ∎

**Corollary X.8h.4 (Convexity of the Predictive EFT Region).** The set of coefficient vectors satisfying (X.8h.3) for positive measures $d\rho$ is a convex cone.

*Proof.* If $c_n^{(1)}$ and $c_n^{(2)}$ are generated by positive measures $d\rho_1$ and $d\rho_2$, then for nonnegative $\lambda_1,\lambda_2$ the vector
$$
\lambda_1c_n^{(1)}+\lambda_2c_n^{(2)}
$$
is generated by the positive measure
$$
\lambda_1d\rho_1+\lambda_2d\rho_2.
$$
Thus the set is closed under nonnegative linear combinations. ∎

**Proposition X.8h.4a (Gap-Localized Moment Conditions and the Three-Coefficient Region).** Fix $m$ and $\mu_0>0$ in Definition X.8h.1, and call a coefficient vector realizable when (X.8h.3) produces it from some positive measure $d\rho$ on $[\mu_0,\infty)$ with finite inverse moments.

1. For every $r\ge m$ and $N\ge0$ the gap-localized Hankel matrix
$$
L^{(r)}_{ij}=c_{r+i+j}-\mu_0c_{r+i+j+1},
\qquad
i,j=0,\dots,N,
\tag{X.8h.4a.1}
$$
is positive semidefinite; in particular $\mu_0c_{n+1}\le c_n$ for every $n\ge m$.

2. A vector $(c_m,c_{m+1},c_{m+2})$ is realizable exactly when it vanishes or satisfies
$$
c_m>0,\quad
c_{m+1}>0,\quad
c_{m+1}^2\le c_mc_{m+2},\quad
\mu_0c_{m+2}\le c_{m+1},
\quad\text{and}\quad
\bigl(\mu_0c_{m+2}=c_{m+1}\Rightarrow\mu_0c_{m+1}=c_m\bigr).
\tag{X.8h.4a.2}
$$

3. The closure of the realizable three-coefficient region is the set cut out by all Hankel conditions of Theorem X.8h.2 and all conditions (X.8h.4a.1) whose entries lie among $c_m,c_{m+1},c_{m+2}$, namely $c_m\ge0$, $c_{m+2}\ge0$, $c_{m+1}^2\le c_mc_{m+2}$ and $\mu_0c_{m+2}\le c_{m+1}$.

4. For $\mu_0=2$, the vector $(1,1,1)$ satisfies every Hankel condition of Corollary X.8h.3 whose entries lie among the three coefficients and violates (X.8h.4a.1). The vectors $(1,0,0)$ and $(1,\tfrac14,\tfrac18)$ satisfy every such Hankel and gap-localized condition and are not realizable.

Thus the Hankel test of Corollary X.8h.3 is a necessary condition whose three-coefficient region is strictly larger than the realizable one. The exact region at this order adds the gap bound $\mu_0c_{m+2}\le c_{m+1}$ and excludes the two boundary faces that would require spectral weight at $\mu=\infty$.

*Proof.* Put $a=1/\mu_0$ and let $\nu$ be the image of $\mu^{-m-1}d\rho(\mu)$ under $\mu\mapsto x=1/\mu$. Then $\nu$ is a finite positive measure on $(0,a]$ and $c_{m+k}=\int x^k\,d\nu(x)$ for $k\ge0$ by (X.8h.3). Conversely, every finite positive measure $\nu$ on $(0,a]$ is obtained in this way from the positive measure $d\rho$ on $[\mu_0,\infty)$ whose image under $\mu\mapsto1/\mu$ is $x^{-m-1}d\nu(x)$, and that $d\rho$ has finite inverse moments $\int\mu^{-n-1}d\rho=\int x^{n-m}d\nu\le a^{n-m}\nu((0,a])$ for $n\ge m$. Write $s_k=c_{m+k}$.

For item 1,
$$
\sum_{i,j=0}^Na_ia_jL^{(r)}_{ij}
=
\int_{\mu_0}^\infty\mu^{-r-1}\Bigl(1-\frac{\mu_0}{\mu}\Bigr)\Bigl(\sum_{i=0}^Na_i\mu^{-i}\Bigr)^2d\rho(\mu)\ge0,
$$
because $\mu\ge\mu_0$ on the support.

For necessity in item 2, $s_0=\nu((0,a])$. If $s_0=0$, then $\nu=0$ and the vector vanishes. Otherwise $s_1>0$ because $x>0$ on $(0,a]$, the Cauchy--Schwarz inequality gives $s_1^2\le s_0s_2$, and $x^2\le ax$ gives $s_2\le as_1$, which is $\mu_0c_{m+2}\le c_{m+1}$. Equality $s_2=as_1$ means $\int x(a-x)\,d\nu=0$, so $\nu=s_0\delta_a$ and $s_1=as_0$. For sufficiency, if $s_1^2=s_0s_2$, take $\nu=s_0\delta_{s_1/s_0}$; here $s_1/s_0=s_2/s_1\le a$. If $s_1^2<s_0s_2$, then $s_2<as_1$, since equality would force $s_1=as_0$ and hence $s_1^2=s_0s_2$, and $s_1<as_0$, since $s_1^2<s_0s_2\le as_0s_1$. Put
$$
y=\frac{as_1-s_2}{as_0-s_1}>0 .
$$
The quadratic $s_0t^2-2s_1t+s_2$ has negative discriminant, so its value $a^2s_0-2as_1+s_2$ at $t=a$ is positive, which is $y<a$. The measure $\nu=w_1\delta_y+w_2\delta_a$ with
$$
w_1=\frac{as_0-s_1}{a-y}>0,
\qquad
w_2=\frac{s_1-ys_0}{a-y}
$$
has moments $s_0$ and $s_1$, and $w_2>0$ is equivalent to $s_0s_2>s_1^2$. Its second moment is $s_2$ because $\int x(a-x)\,d\nu=w_1y(a-y)=y(as_0-s_1)=as_1-s_2$.

For item 3, the listed conditions hold on the realizable region by Theorem X.8h.2 and item 1, and they define a closed set. They force $s_1\ge0$, and $s_0=0$ forces the zero vector. A point satisfying them outside (X.8h.4a.2) therefore has either $s_0>0$ and $s_1=s_2=0$, which is the limit of $s_0\delta_\epsilon$ as $\epsilon\downarrow0$, or $s_1>0$, $s_2=as_1$ and $s_1<as_0$, which is the limit of $(s_0-s_1/a)\delta_\epsilon+(s_1/a)\delta_a$. Item 4 follows with $a=\tfrac12$ from item 2 and the displayed conditions: $(1,1,1)$ has $\mu_0c_{m+2}=2>c_{m+1}$; $(1,0,0)$ has $c_m>0=c_{m+1}$; and $(1,\tfrac14,\tfrac18)$ has $\mu_0c_{m+2}=c_{m+1}$ with $\mu_0c_{m+1}=\tfrac12\ne c_m$. ∎

**Resolution TV-X-10-R1 (Metadata).** Exact domain: positive measures on $[\mu_0,\infty)$ with finite inverse moments as in Definition X.8h.1; all truncation orders for item 1 and the first three coefficients above the subtraction order for items 2--4. Premises: fixed $m$ and $\mu_0>0$. Equivalence: the image measure $\nu$ of $\mu^{-m-1}d\rho$ under $\mu\mapsto1/\mu$. Budget: three coefficients, and every $N$ for item 1. Verifier: the localizing identity, the Cauchy--Schwarz inequality and the explicit one- and two-atom measures. Falsifier: a positive measure violating (X.8h.4a.1), or a vector satisfying (X.8h.4a.2) without a representing measure. Provenance class: source-internal exact classification. Downstream consumers: Theorem X.8h.2, Corollaries X.8h.3--X.8h.4, item 1 of Definition X.8h.5 and `TV-X-10`. Nonvacuity: for $\mu_0=2$ the vector $(1,\tfrac14,\tfrac1{16})$ is realized by $\nu=\delta_{1/4}$, that is, spectral weight at $\mu=4$. Item 1 and item 2 give `positive-discharge` of the gap-localized conditions and of the exact three-coefficient classification, and item 4 gives `nonentailment` of realizability from the Hankel test of Corollary X.8h.3. The region at higher truncation orders, the OPE and crossing solution classification, external states, and the analyticity, unitarity, crossing, factorization and error proofs remain `M+C+R` under `TV-X-10`.

**Definition X.8h.5 (Finite Predictive Factorization Geometry).** On a finite gapped regular branch, define the truncated predictive response region
$$
\mathcal P_{\mathrm{PU}}^{(N)}
$$
as the semialgebraic region cut out by:

1. the Hankel positivity conditions of Theorem X.8h.2 for coefficients through order $N$;

2. the finite PCE min-cut inequalities of Appendix E.8;

3. the finite Golay-matroid circuit and cocircuit constraints of Theorem R.4.2.9b when the marked $M=24$ carrier is active;

4. the protocol-factorization equalities required by the local algebra split on admissible boundary cuts.

A finite predictive factorization geometry is the finite datum
$$
\mathfrak F_{\mathrm{PU}}^{(N)}
=
\left(
\mathcal P_{\mathrm{PU}}^{(N)},
\{\mathcal A_U^{(N)}\}_{U},
\{\mu_{\iota}^{(N)}\}_{\iota},
\{F_C\}_{C}
\right),
\tag{X.8h.5.1}
$$
where $\mathcal A_U^{(N)}$ is the finite-dimensional vector space spanned by retained protocol-response classes in the admissible causal diamond $U$, $\mu_{\iota}^{(N)}$ are the PCE-minimal compression products associated with inclusions and disjoint unions of such diamonds, and $F_C$ is the boundary facet associated with an admissible predictive min-cut $C$. The product maps must satisfy finite prefactorization descent:
$$
\mu_{U_1\sqcup\cdots\sqcup U_m\to U}
:
\mathcal A_{U_1}^{(N)}\otimes\cdots\otimes\mathcal A_{U_m}^{(N)}
\to
\mathcal A_U^{(N)}
\tag{X.8h.5.2}
$$
whenever $U_1,\dots,U_m$ are mutually admissible subdiamonds of $U$, and the maps are functorial under refinement.

For a cut $C$ separating a left region $L$ from a right region $R$ through boundary data $B_C$, the facet $F_C$ is a factorization facet when its retained coordinate algebra is the tensor product representing the declared finite fiber product of response spaces
$$
\mathbb R[F_C]
\cong
\mathbb R[\mathcal P_L^{(N_L)}]
\otimes_{\mathbb R[\mathcal P_C^{(N_C)}]}
\mathbb R[\mathcal P_R^{(N_R)}].
\tag{X.8h.5.3}
$$
This fiber-product condition is part of the finite factorization datum; it is not automatic for an arbitrary semialgebraic response region.

On an exact-scale branch with local retained operators $O_i$, the PCE compression product is written
$$
O_iO_j
\sim
\sum_k C_{ij}^{k}O_k
\tag{X.8h.5.4}
$$
inside admissible finite response functions.

**Theorem X.8h.6 (Predictive Factorization-Compression Equivalence).** On a finite predictive factorization geometry $\mathfrak F_{\mathrm{PU}}^{(N)}$, assume the retained local products close in the finite basis $\{O_m\}$ and that admissible response functionals separate the retained PCE quotient. Then the following are equivalent for every retained local triple $O_i,O_j,O_k$:

1. local predictive compression is path-independent:
$$
\mu_{(ij)k}^{(N)}
\left(
\mu_{ij}^{(N)}(O_i\otimes O_j)\otimes O_k
\right)
=
\mu_{i(jk)}^{(N)}
\left(
O_i\otimes \mu_{jk}^{(N)}(O_j\otimes O_k)
\right);
\tag{X.8h.6.1}
$$

2. the finite OPE coefficients satisfy the crossing equations
$$
\sum_{\ell}C_{ij}^{\ell}C_{\ell k}^{m}
=
\sum_{\ell}C_{jk}^{\ell}C_{i\ell}^{m}
\quad
\text{for every retained }m;
\tag{X.8h.6.2}
$$

3. every admissible finite local response functional $\varphi$ assigns the same compressed protocol response to the two parenthesizations:
$$
\varphi\!\left((O_iO_j)O_k\right)
=
\varphi\!\left(O_i(O_jO_k)\right).
\tag{X.8h.6.3}
$$

For every admissible predictive min-cut $C$, if finite PCE descent is represented by coequalizing the left and right boundary coordinate actions, then that descent condition is equivalent to the factorization-facet identity (X.8h.5.3). Thus scattering-channel factorization, exact-scale OPE associativity, and protocol-compression descent are the same finite algebraic constraint only when they are all represented on the same retained response geometry.

*Proof.* Because every $\mathcal A_U^{(N)}$ is finite-dimensional, choose a retained basis $\{O_m\}$. Expanding the left side of (X.8h.6.1) using (X.8h.5.4) gives
$$
(O_iO_j)O_k
=
\sum_{\ell}C_{ij}^{\ell}O_{\ell}O_k
=
\sum_{\ell,m}C_{ij}^{\ell}C_{\ell k}^{m}O_m.
$$
Expanding the right side gives
$$
O_i(O_jO_k)
=
\sum_{\ell}C_{jk}^{\ell}O_iO_{\ell}
=
\sum_{\ell,m}C_{jk}^{\ell}C_{i\ell}^{m}O_m.
$$
The retained basis is linearly independent in the PCE quotient, so equality of the two compressed products is exactly the coefficient identity (X.8h.6.2). This proves equivalence of items 1 and 2.

If item 1 holds, applying any linear response functional $\varphi$ gives item 3. Conversely, if item 3 holds for every admissible finite response functional, then the difference between the two parenthesizations pairs to zero with every separating protocol response. Separating PPI protocols identify only operationally null differences, so the two products are equal in the retained PCE quotient. This proves equivalence of items 1 and 3.

For a cut $C$, finite PCE descent says that a global response assembled from left and right representatives is independent of the chosen boundary representative exactly when the two boundary actions are coequalized. In finite coordinate algebra, this coequalizer is represented by the tensor product over the boundary coordinate algebra:
$$
\mathbb R[\mathcal P_L^{(N_L)}]
\otimes_{\mathbb R[\mathcal P_C^{(N_C)}]}
\mathbb R[\mathcal P_R^{(N_R)}].
$$
When the factorization facet is defined by this coequalizer, the response points satisfying descent are precisely the points of $F_C$, giving (X.8h.5.3). Therefore the min-cut channel factorization and the local compression associativity are the same descent condition on branches where the stated finite algebraic representation is supplied. ∎

**Corollary X.8h.7 (Canonical Residues on a Descent Facet).** Suppose, in addition to Definition X.8h.5, that the finite branch supplies a logarithmic canonical-form representative
$$
\Omega_{\mathrm{PU}}^{(N)}
$$
whose boundary residue functional is normalized by the finite response push-forward measure on $\mathcal P_{\mathrm{PU}}^{(N)}$. Assume that each residue measure is nondegenerate and uses the boundary orientation of the finite fiber product. Finite PCE descent across $C$ implies that
$$
\operatorname{Res}_{F_C}\Omega_{\mathrm{PU}}^{(N)}
$$
is a well-defined functional on
$$
\mathbb R[\mathcal P_L^{(N_L)}]
\otimes_{\mathbb R[\mathcal P_C^{(N_C)}]}
\mathbb R[\mathcal P_R^{(N_R)}].
$$
If the branch additionally supplies a factorization certificate stating that this functional is decomposable over the boundary algebra, then
$$
\operatorname{Res}_{F_C}\Omega_{\mathrm{PU}}^{(N)}
=
\Omega_L^{(N_L)}\wedge\Omega_R^{(N_R)}.
\tag{X.8h.7.1}
$$
Conversely, (X.8h.7.1) implies descent for the residue functional, but descent of an arbitrary correlated residue does not imply (X.8h.7.1).

*Proof.* Theorem X.8h.6 identifies descent with the balancing relations defining the tensor product over the boundary coordinate algebra. Hence a descended residue is a linear functional on that balanced tensor product. A product or wedge of left and right functionals is one such functional, but a general linear functional need not be decomposable. The additional factorization certificate asserts decomposability and gives (X.8h.7.1). A wedge product is balanced over the shared boundary algebra by the certificate, so it descends. ∎

**Definition X.8h.8 (Finite Predictive Amplitude from PCE Compression).** Let
$$
\mathfrak F_{\mathrm{PU}}^{(N)}
=
\left(
\mathcal P_{\mathrm{PU}}^{(N)},
\{\mathcal A_U^{(N)}\}_U,
\{\mu_{\iota}^{(N)}\}_{\iota},
\{F_C\}_C
\right)
$$
be a finite predictive factorization geometry as in Definition X.8h.5.

Let $U_1,\dots,U_n\subset U$ be mutually admissible finite causal diamonds, and let
$$
O_i\in \mathcal A_{U_i}^{(N)}
$$
be retained finite response classes. For a binary compression tree $\tau$ assembling $U_1,\dots,U_n$ into $U$, write
$$
\mu_\tau^{(N)}
:
\mathcal A_{U_1}^{(N)}\otimes\cdots\otimes\mathcal A_{U_n}^{(N)}
\longrightarrow
\mathcal A_U^{(N)}
$$
for the iterated PCE compression product determined by the maps $\mu_{\iota}^{(N)}$.

For any admissible finite response functional
$$
\varphi_U\in \left(\mathcal A_U^{(N)}\right)^*,
$$
the **finite predictive amplitude** of the protocol $(O_1,\dots,O_n)$ in compression channel $\tau$ is
$$
\mathfrak A_{\mathrm{PU},\varphi_U}^{(N)}
(\tau;O_1,\dots,O_n)
:=
\varphi_U
\left(
\mu_\tau^{(N)}
(O_1\otimes\cdots\otimes O_n)
\right).
\tag{X.8h.8.1}
$$

This definition uses only finite retained response classes, PCE compression, and admissible response evaluation. It does not assume a canonical form, a positive geometry, a Grassmannian external-state map, or a physical scattering $S$-matrix interpretation.

**Theorem X.8h.9 (First-Principles Crossing of Finite Predictive Amplitudes).** On any finite predictive factorization geometry satisfying the hypotheses of Theorem X.8h.6 — in particular, assuming admissible response functionals separate the retained PCE quotient — finite predictive amplitudes are independent of compression parenthesization exactly when the retained PCE compression product is path-independent.

For three retained local response classes
$$
O_i,O_j,O_k,
$$
and any admissible response functional $\varphi$, define
$$
\mathfrak A_{(ij)k}^{\varphi}
:=
\varphi\!\left(
\mu_{(ij)k}^{(N)}
\left(
\mu_{ij}^{(N)}(O_i\otimes O_j)\otimes O_k
\right)
\right),
$$
and
$$
\mathfrak A_{i(jk)}^{\varphi}
:=
\varphi\!\left(
\mu_{i(jk)}^{(N)}
\left(
O_i\otimes \mu_{jk}^{(N)}(O_j\otimes O_k)
\right)
\right).
$$

Then the following are equivalent:

1. finite predictive amplitudes are compression-path independent:
   $$
   \mathfrak A_{(ij)k}^{\varphi}
   =
   \mathfrak A_{i(jk)}^{\varphi}
   $$
   for every admissible finite response functional $\varphi$;

2. local predictive compression is path-independent in the retained PCE quotient:
   $$
   \mu_{(ij)k}^{(N)}
   \left(
   \mu_{ij}^{(N)}(O_i\otimes O_j)\otimes O_k
   \right)
   =
   \mu_{i(jk)}^{(N)}
   \left(
   O_i\otimes \mu_{jk}^{(N)}(O_j\otimes O_k)
   \right);
   $$

3. the retained finite OPE coefficients satisfy the crossing equations
   $$
   \sum_{\ell} C_{ij}^{\ell}C_{\ell k}^{m}
   =
   \sum_{\ell} C_{jk}^{\ell}C_{i\ell}^{m}
   \quad
   \text{for every retained }m.
   \tag{X.8h.9.1}
   $$

Consequently, on the PCE quotient separated by admissible response functionals, the finite predictive amplitude
$$
\mathfrak A_{\mathrm{PU},\varphi}^{(N)}
(O_1,\dots,O_n)
$$
is a well-defined operational quantity independent of the chosen compression tree whenever the finite crossing identities hold.

*Proof.* By Definition X.8h.8, the two three-point compression amplitudes differ by
$$
\mathfrak A_{(ij)k}^{\varphi}
-
\mathfrak A_{i(jk)}^{\varphi}
=
\varphi
\left(
\mu_{(ij)k}^{(N)}
\left(
\mu_{ij}^{(N)}(O_i\otimes O_j)\otimes O_k
\right)
-
\mu_{i(jk)}^{(N)}
\left(
O_i\otimes \mu_{jk}^{(N)}(O_j\otimes O_k)
\right)
\right).
$$

Equality of the two amplitudes for every admissible separating response functional $\varphi$ holds if and only if the difference inside the parenthesis is operationally null in the retained PCE quotient. Since admissible response functionals separate the retained quotient by the hypothesis of Theorem X.8h.6, this is equivalent to path-independence of the compression product itself.

The equivalence between compression path-independence and the finite crossing identities is exactly Theorem X.8h.6. Iterating the three-point associativity move across binary trees gives independence of the full $n$-point compression tree. ∎

**Theorem X.8h.10 (Finite Min-Cut Descent of Predictive Amplitudes).** Let $C$ be an admissible predictive min-cut in a finite predictive factorization geometry, separating a left region $L$ from a right region $R$ through boundary data $B_C$. Suppose finite PCE descent across $C$ is represented by the factorization-facet identity
$$
\mathbb R[F_C]
\cong
\mathbb R[\mathcal P_L^{(N_L)}]
\otimes_{\mathbb R[\mathcal P_C^{(N_C)}]}
\mathbb R[\mathcal P_R^{(N_R)}].
\tag{X.8h.10.1}
$$

Then finite predictive amplitudes descend through the same coequalizer. Equivalently, for every boundary coordinate class
$$
b\in \mathbb R[\mathcal P_C^{(N_C)}],
$$
left response class $a_L$, right response class $a_R$, and admissible response functional $\varphi_C$ on the factorization facet, the amplitude satisfies the balancing relation
$$
\varphi_C\!\left((a_L b)\otimes a_R\right)
=
\varphi_C\!\left(a_L\otimes (b a_R)\right).
\tag{X.8h.10.2}
$$

Therefore the finite predictive amplitude depends only on the balanced tensor class
$$
a_L\otimes_{\mathbb R[\mathcal P_C^{(N_C)}]}a_R,
$$
not on the arbitrary choice of left or right representative for the shared boundary data.

In this precise finite-response sense, predictive amplitudes factorize across admissible min-cuts: the global response is the PCE-balanced gluing of the left and right responses over the shared boundary response algebra.

*Proof.* Finite PCE descent across $C$ says that the assembled global response is independent of the representative chosen for the shared boundary data $B_C$. In coordinate algebra this independence is exactly the coequalizer relation
$$
(a_L b)\otimes a_R
\sim
a_L\otimes (b a_R),
$$
for
$$
b\in\mathbb R[\mathcal P_C^{(N_C)}].
$$

By Definition X.8h.5, the factorization facet $F_C$ has the coordinate algebra of the declared finite fiber product of response spaces, represented by the tensor-product coequalizer
$$
\mathbb R[F_C]
\cong
\mathbb R[\mathcal P_L^{(N_L)}]
\otimes_{\mathbb R[\mathcal P_C^{(N_C)}]}
\mathbb R[\mathcal P_R^{(N_R)}].
$$

Any admissible finite response functional $\varphi_C$ on $F_C$ is therefore a linear functional on the balanced tensor product. Hence it assigns equal values to representatives identified by the coequalizer:
$$
\varphi_C\!\left((a_L b)\otimes a_R\right)
=
\varphi_C\!\left(a_L\otimes (b a_R)\right).
$$

By Definition X.8h.8, finite predictive amplitudes are precisely such response evaluations after PCE compression. Therefore the predictive amplitude descends through the same balanced tensor product and depends only on the glued left/right response class. ∎

**Corollary X.8h.11 (Boundary-Basis Expansion from Pairing and Factorization Certificates).** In the setting of Theorem X.8h.10, suppose the finite boundary response space admits a nondegenerate pairing certificate
$$
\eta_C:
\mathcal B_C^{(N)}\otimes\mathcal B_C^{(N)}
\to \mathbb R
$$
with finite dual bases
$$
\{e_\alpha\},\qquad
\{e^\alpha\},
\qquad
\eta_C(e^\beta,e_\alpha)=\delta_\alpha^\beta.
$$

Suppose also that the branch supplies a finite factorization certificate for the min-cut facet: for each retained left class $a_L$ and right class $a_R$, the facet response functional is represented by compatible left and right boundary response maps
$$
\mathfrak A_L^{(N_L)}(a_L,-):\mathcal B_C^{(N)}\to\mathbb R,
\qquad
\mathfrak A_R^{(N_R)}(-,a_R):\mathcal B_C^{(N)}\to\mathbb R,
$$
whose contraction over the boundary pairing equals the balanced response class of Theorem X.8h.10.

Then the finite min-cut amplitude has the boundary-channel expansion
$$
\mathfrak A_{\mathrm{PU}}^{(N)}(a_L,a_R)
=
\sum_{\alpha}
\mathfrak A_L^{(N_L)}(a_L,e_\alpha)\,
\mathfrak A_R^{(N_R)}(e^\alpha,a_R),
\tag{X.8h.11.1}
$$
with the pairing convention absorbed into the dual basis. Equivalently, for a general matrix pairing
$$
\eta_{\alpha\beta}=\eta_C(e_\alpha,e_\beta),
\qquad
(\eta^{\alpha\beta})=(\eta_{\alpha\beta})^{-1},
$$
one has
$$
\mathfrak A_{\mathrm{PU}}^{(N)}(a_L,a_R)
=
\sum_{\alpha,\beta}
\mathfrak A_L^{(N_L)}(a_L,e_\alpha)\,
\eta^{\alpha\beta}\,
\mathfrak A_R^{(N_R)}(e_\beta,a_R).
\tag{X.8h.11.2}
$$

This is the finite PU analogue of summing over intermediate boundary channels. The primitive theorem-level statement is the balanced descent relation of Theorem X.8h.10. The basis expansion additionally requires both the nondegenerate boundary pairing and the finite factorization certificate; a pairing alone does not force an arbitrary balanced functional to split into left and right channel amplitudes.

*Proof.* Theorem X.8h.10 places the global min-cut response in the balanced tensor class over the boundary response algebra. A nondegenerate finite pairing identifies the boundary space with its dual and supplies the finite identity resolution
$$
\mathrm{id}_{\mathcal B_C^{(N)}}
=
\sum_{\alpha} e_\alpha\otimes e^\alpha
$$
or, in matrix notation,
$$
\mathrm{id}_{\mathcal B_C^{(N)}}
=
\sum_{\alpha,\beta}
e_\alpha\,\eta^{\alpha\beta}\,\eta_C(e_\beta,\cdot).
$$

The factorization certificate states that the facet response functional is obtained by contracting the left and right boundary response maps through this pairing. Substituting the finite identity resolution on the shared boundary gives (X.8h.11.1), and the matrix form gives (X.8h.11.2). Without the factorization certificate, Theorem X.8h.10 still gives balanced descent, but not a distinguished left/right channel-sum representation. ∎

**Corollary X.8h.12 (Certificate-Gated Canonical-Form Representation of Finite Predictive Amplitudes).** Suppose, in addition to the finite PCE data above, that the branch supplies a normalized logarithmic canonical-form representative
$$
\Omega_{\mathrm{PU}}^{(N)}
$$
on $\mathcal P_{\mathrm{PU}}^{(N)}$, nondegenerate boundary residue measures, compatible orientations, and a representation certificate identifying the residue response functional with the amplitude functional of Definition X.8h.8. Then
$$
\mathcal A_{\mathrm{PU}}^{(N)}[C]
=
\operatorname{Res}_{F_C}\Omega_{\mathrm{PU}}^{(N)}.
\tag{X.8h.12.1}
$$
Finite PCE descent makes both sides well-defined on the same balanced response class. If the branch also supplies the decomposable factorization certificate of Corollary X.8h.7, then
$$
\operatorname{Res}_{F_C}\Omega_{\mathrm{PU}}^{(N)}
=
\Omega_L^{(N_L)}\wedge\Omega_R^{(N_R)}.
\tag{X.8h.12.2}
$$

*Proof.* Definition X.8h.8 defines the amplitude by compression and response evaluation, and Theorem X.8h.10 makes it a functional on the balanced tensor class. Corollary X.8h.7 gives the same descent statement for the residue. The representation certificate equates these two functionals and yields (X.8h.12.1). The additional decomposability certificate yields (X.8h.12.2). ∎

**Theorem X.8h.13 (External Scattering Amplitudes Require a Physical-Instantiation Map).** The finite predictive amplitudes of Definition X.8h.8 are theorem-level internal PU quantities. They are not automatically identical to physical scattering $S$-matrix elements.

To identify a physical $n$-external scattering amplitude with a PU finite predictive amplitude, a branch must supply at least:

1. an external protocol or kinematic space
   $$
   \mathcal X_n;
   $$

2. a finite physical-instantiation response map
   $$
   \Phi_n:\mathcal X_n\to \mathcal P_{\mathrm{PU}}^{(N)};
   $$

3. a proof that physical factorization channels in $\mathcal X_n$ map to predictive min-cut facets $F_C$;

4. a normalization theorem matching the PU finite response functional to the physical amplitude normalization.

Without these data, the internal finite predictive amplitude is determined, but its identification with a physical scattering amplitude has not been supplied. Non-identifiability of a specified physical observable additionally requires two admissible completions with equal parent data and unequal target values.

In particular, if two admissible maps
$$
\Phi_n,\Phi_n':\mathcal X_n\to\mathcal P_{\mathrm{PU}}^{(N)}
$$
agree with all internal PU finite-response axioms but differ on the image of a physical channel, then the pulled-back functions
$$
\Phi_n^*\mathfrak A_{\mathrm{PU}}^{(N)}
\qquad\text{and}\qquad
(\Phi_n')^*\mathfrak A_{\mathrm{PU}}^{(N)}
$$
can differ while the internal PU theorem remains unchanged. If such two admissible completions give unequal values of the specified physical observable, they witness its non-identifiability from the internal finite response data. A difference between the maps alone does not establish that witness.

*Proof.* Definitions X.8h.5 and X.8h.8 construct the finite predictive amplitude entirely inside the retained response geometry. No external kinematic labels, asymptotic one-particle states, momentum twistors, LSZ map, color ordering, or physical normalization convention appears in that construction.

A physical scattering amplitude is a function or distribution on a physical external data space $\mathcal X_n$. To compare it with a PU finite predictive amplitude, one must pull the PU response data back to $\mathcal X_n$, which requires a map
$$
\Phi_n:\mathcal X_n\to\mathcal P_{\mathrm{PU}}^{(N)}.
$$

If no such map is supplied, the displayed construction has not supplied an amplitude on $\mathcal X_n$ for physical comparison. Distinct admissible maps need not give distinct pulled-back amplitudes: a constant amplitude is a counterexample. Non-identifiability of a specified scattering observable requires two admissible physical-instantiation completions with the same accepted parent data and unequal values of that observable, as in Theorem P.14.1f. Until a map and normalization certificate are accepted, the physical scattering comparison remains open.

Thus the internal finite predictive amplitude is theorem-level, while the physical scattering $S$-matrix identification is a separate branch theorem. ∎

**Theorem X.8h.14 (Finite-Response Bootstrap Strict-Gap Gate).** Let $\mathcal B_{\mathrm{PU}}$ be a finite or compact family of retained low-energy response data
$$
B=(\Delta_i,C_{ij}^{k},\mathfrak A_{\mathrm{PU}},\mathcal S_{\mathrm{phys}},\mathcal W,\mathfrak A_{\mathrm{anom}},\mathcal N)
\tag{X.8h.14.1}
$$
where $\Delta_i$ are finite spectral labels, $C_{ij}^{k}$ are finite OPE or response-composition coefficients, $\mathfrak A_{\mathrm{PU}}$ is the finite predictive amplitude package, $\mathcal S_{\mathrm{phys}}$ is included only when the physical-instantiation map of Theorem X.8h.13 is supplied, $\mathcal W$ records Ward identities, $\mathfrak A_{\mathrm{anom}}$ records anomaly matching, and $\mathcal N$ records normalization and tail certificates. Let $\mathcal F_{\mathrm{boot}}\subseteq\mathcal B_{\mathrm{PU}}$ be the closed feasible set satisfying finite positivity/unitarity, crossing, associativity, Ward identities, anomaly matching, modular covariance, and capacity bounds. If $\mathcal F_{\mathrm{boot}}$ is nonempty and compact and if $\mathcal C_{\mathrm{desc}}$ is lower semicontinuous, then at least one PCE-minimal bootstrap datum exists:
$$
B_*
\in
\operatorname*{argmin}_{B\in\mathcal F_{\mathrm{boot}}}\mathcal C_{\mathrm{desc}}(B).
\tag{X.8h.14.2}
$$
If the quotient by finite response equivalence has a strict gap
$$
\mathcal C_{\mathrm{desc}}(B)-\mathcal C_{\mathrm{desc}}(B_*)
\ge
\Delta_{\mathrm{boot}}>0
\tag{X.8h.14.3}
$$
for every response-distinct feasible $B\ne B_*$, then every registered projection
$$
I_a(B_*)
\tag{X.8h.14.4}
$$
including masses, thresholds, OPE coefficients, finite predictive amplitudes, Ward residuals, anomaly-matching data, and physical $S$-matrix entries when $\mathcal S_{\mathrm{phys}}$ is supplied, is fixed by one finite-response bootstrap certificate. If any of compactness, closed feasibility, normalization, tail control, physical-instantiation, or strict-gap data is absent, the corresponding output remains a branch/model projection and not a theorem-level joint numerical closure.

*Proof.* Compactness of $\mathcal F_{\mathrm{boot}}$ and lower semicontinuity of $\mathcal C_{\mathrm{desc}}$ give existence by the direct method. If two response-distinct minimizers existed, (X.8h.14.3) would force one to have strictly larger cost than $B_*$, contradiction. Hence the selected response class is unique. A registered observable $I_a$ is a fixed function on the selected response class, so $I_a(B_*)$ is unique. The physical $S$-matrix caveat follows from Theorem X.8h.13: without a physical-instantiation map and normalization theorem, the internal amplitude has no fixed external scattering domain. ∎

### X.8i Predictive Cosmic Galois Filtration

**Definition X.8i.1 (Update-Cost Filtration of the Connes–Kreimer Hopf Algebra).** Let $\mathcal H_{\mathrm{CK}}$ be the connected graded Connes–Kreimer Hopf algebra of the declared renormalizable graph class, with coproduct
$$
\Delta\Gamma
=
\sum_{\gamma\subseteq\Gamma}
\gamma\otimes\Gamma/\gamma.
$$
Let $\mathcal V^{(L)}\subset\mathcal H_{\mathrm{CK}}$ be the declared finite-dimensional computational subspace containing the graphs retained through loop order $L$ and every divergent subgraph and contraction appearing in their coproducts. The subspace $\mathcal V^{(L)}$ is used as a coalgebra truncation; no closure under the graph product is asserted.

Let
$$
\mathfrak c:\{\text{graphs}\}\to\mathbb N
$$
be an update-cost degree satisfying
$$
\mathfrak c(\gamma)+\mathfrak c(\Gamma/\gamma)\le\mathfrak c(\Gamma)
\tag{X.8i.1}
$$
for every divergent subgraph $\gamma\subseteq\Gamma$, and
$$
\mathfrak c(\Gamma_1\Gamma_2)=\mathfrak c(\Gamma_1)+\mathfrak c(\Gamma_2)
$$
for disjoint products in $\mathcal H_{\mathrm{CK}}$. Define
$$
F^n\mathcal H_{\mathrm{CK}}
=
\operatorname{span}\{\Gamma:\mathfrak c(\Gamma)\le n\},
\qquad
F^n\mathcal V^{(L)}=F^n\mathcal H_{\mathrm{CK}}\cap\mathcal V^{(L)}.
\tag{X.8i.2}
$$

**Theorem X.8i.2 (Renormalization Preserves the Predictive Cost Filtration).** Under Definition X.8i.1,
$$
\Delta(F^n\mathcal H_{\mathrm{CK}})
\subseteq
\sum_{r+s\le n}
F^r\mathcal H_{\mathrm{CK}}
\otimes
F^s\mathcal H_{\mathrm{CK}}.
\tag{X.8i.3}
$$
The same inclusion restricts to the declared coproduct-stable computational subspace $\mathcal V^{(L)}$.

Let $A=\bigcup_n A_n$ be a filtered commutative Rota–Baxter algebra with $A_rA_s\subseteq A_{r+s}$, where the linear subtraction operator $R$ satisfies $R(x)R(y)=R(R(x)y+xR(y)-xy)$ for all $x,y\in A$. Let $R(A_n)\subseteq A_n$, and let the regularized Feynman-rule character satisfy $\phi(F^n\mathcal H_{\mathrm{CK}})\subseteq A_n$. Then the counterterm and renormalized characters satisfy
$$
\phi_-(F^n\mathcal H_{\mathrm{CK}})\subseteq A_n,
\qquad
\phi_+(F^n\mathcal H_{\mathrm{CK}})\subseteq A_n.
$$

*Proof.* For a graph $\Gamma$ with $\mathfrak c(\Gamma)\le n$, every coproduct term $\gamma\otimes\Gamma/\gamma$ satisfies
$$
\mathfrak c(\gamma)+\mathfrak c(\Gamma/\gamma)\le n.
$$
This proves (X.8i.3), and coproduct stability gives its restriction to $\mathcal V^{(L)}$.

Use induction on the connected graph grading, for which every proper divergent subgraph and contracted cograph occurring in the reduced coproduct has lower grading than $\Gamma$. The Bogoliubov recursion is
$$
\phi_-(\Gamma)
=
-R\left[
\phi(\Gamma)+
\sum_{\emptyset\ne\gamma\subsetneq\Gamma}
\phi_-(\gamma)\phi(\Gamma/\gamma)
\right].
$$
By the induction hypothesis, the product associated with a coproduct term lies in
$$
A_{\mathfrak c(\gamma)}A_{\mathfrak c(\Gamma/\gamma)}
\subseteq
A_{\mathfrak c(\Gamma)}.
$$
The term $\phi(\Gamma)$ lies in the same filtered piece, and $R$ preserves that piece. Hence $\phi_-(\Gamma)\in A_{\mathfrak c(\Gamma)}$. Finally $\phi_+=\phi_-*\phi$, and (X.8i.3) together with $A_rA_s\subseteq A_{r+s}$ proves the same bound for $\phi_+$. ∎

**Corollary X.8i.3 (Filtered Arithmetic Symmetry).** Let $\mathrm{Per}:\mathcal H_{\mathrm{CK}}\to\mathcal P$ be the registered Feynman-rule period map. A cost-preserving Hopf-algebra automorphism $\varphi$ induces a filtered automorphism of the generated period algebra if
$$
\varphi(\ker\mathrm{Per})=\ker\mathrm{Per}.
$$

*Proof.* Cost preservation gives $\varphi(F^n)\subseteq F^n$, and the same holds for $\varphi^{-1}$. Kernel invariance makes
$$
\overline\varphi(\mathrm{Per}(h)):=\mathrm{Per}(\varphi(h))
$$
well-defined: if $\mathrm{Per}(h_1)=\mathrm{Per}(h_2)$, then $h_1-h_2\in\ker\mathrm{Per}$ and hence $\mathrm{Per}(\varphi(h_1-h_2))=0$. The inverse is induced by $\varphi^{-1}$, and both maps preserve the quotient filtration. ∎

### X.8j Soft Memory as Predictive Ledger Conservation

**Definition X.8j.1 (Finite Boundary Ledger).** Let $\mathscr I_-$ and $\mathscr I_+$ be finite incoming and outgoing boundary cuts of a long-range gauge or emergent-metric sector, and let $f$ be a boundary test function. A predictive ledger charge is a finite sum
$$
Q_f[\mathscr I]
=
\sum_{a\in\mathscr I} f_a\,\ell_a
\tag{X.8j.1}
$$
where $\ell_a$ is the retained update ledger entry at boundary cell $a$. Let $F_f$ be the total flux ledger through the intervening bulk or channel region. The finite ledger conservation law is
$$
Q_f[\mathscr I_+]-Q_f[\mathscr I_-]+F_f=0.
\tag{X.8j.2}
$$

**Theorem X.8j.2 (Soft Ward Identity and Memory Ledger).** Suppose the physical transition functional is invariant under the finite boundary ledger symmetry generated by $Q_f$ and satisfies the conservation law (X.8j.2). Then for every admissible in/out pair,
$$
\langle\mathrm{out}|
Q_f[\mathscr I_+]-Q_f[\mathscr I_-]+F_f
|\mathrm{in}\rangle
=
0.
\tag{X.8j.3}
$$
The measured memory is
$$
\Delta\mathcal M_f
=
Q_f[\mathscr I_+]-Q_f[\mathscr I_-]
=
-F_f.
\tag{X.8j.4}
$$

*Proof.* Equation (X.8j.2) is an operator identity on the finite ledger algebra of the retained boundary sector. Taking its matrix element between any admissible in-state and out-state gives (X.8j.3). Rearranging the same identity gives
$$
Q_f[\mathscr I_+]-Q_f[\mathscr I_-]=-F_f.
$$
The left side is precisely the change in the boundary ledger recorded between the two cuts, which is the memory observable $\Delta\mathcal M_f$. This proves (X.8j.4). ∎

**Corollary X.8j.3 (Gauge-First Soft Theorem Reading).** On a branch with an accepted map identifying the finite ledger charge $Q_f$, flux $F_f$, and their normalization with physical asymptotic gauge charges and soft insertions, and with a certified asymptotic limit preserving Theorem X.8j.2, the finite conservation identity has a soft Ward interpretation. The emergent metric sector admits the analogous asymptotic-memory reading only with its own metric, current, boundary-condition, and limit certificate; the finite identity itself introduces no fundamental graviton degree of freedom.

*Proof.* Theorem X.8j.2 gives the finite boundary-ledger conservation identity. The accepted physical map identifies its charge and flux with the registered gauge charge and soft insertion, and the asymptotic certificate transfers the identity to that limit. Applying the corresponding independent certificate to the emergent metric ledger yields its memory interpretation. Without those maps and limit estimates, the result remains the finite ledger identity. ∎

### X.8j.4 Predictive Infrared Admissibility Gate

**Definition X.8j.4a (Unresolved Soft-Ledger Equivalence).** Fix detector resolution $\lambda>0$ in a massless long-range gauge sector or in the emergent thermodynamic metric ledger sector of Corollary X.8j.3. Two finite scattering records $r,r'$ are unresolved-soft equivalent at resolution $\lambda$, written
$$
r\sim_\lambda r',
\tag{X.8j.5}
$$
when they have the same hard record above $\lambda$, the same total conserved boundary ledger charges, and differ only by ledger refinements supported on boundary or flux cells whose individual energies are below $\lambda$, and when the registered detector protocol family certifies equality of every admissible response distribution for those refinements. The latter operational-indistinguishability condition is independent of the individual-energy bound. An observable $\mathcal O$ is soft-ledger invariant at resolution $\lambda$ when
$$
r\sim_\lambda r'
\quad\Longrightarrow\quad
\mathcal O(r)=\mathcal O(r').
\tag{X.8j.6}
$$

**Theorem X.8j.4b (Necessary Infrared PPI Gate).** A scattering quantity is PPI-observable at detector resolution $\lambda$ only if it is soft-ledger invariant at that resolution. Equivalently, the quantity must descend to the quotient of records by $\sim_\lambda$:
$$
\mathcal O
=
\widetilde{\mathcal O}\circ q_\lambda,
\qquad
q_\lambda:r\mapsto[r]_{\sim_\lambda}.
\tag{X.8j.7}
$$
For a family $\{\mathcal O_\lambda\}_{\lambda>0}$, compatibility of its quotient representatives under refinement must be supplied explicitly. It follows from finite renormalized infrared PCE cost only on a branch whose cost certificate assigns divergent total cost to every failure of that compatibility.

*Proof.* PPI-observability means dependence only on operationally distinguished records. The response-equality condition in Definition X.8j.4a makes every admitted protocol constant on a $\sim_\lambda$ class. An observable assigning different values within one such class therefore fails to define a PPI observable. Constancy on each class is exactly the factorization (X.8j.7). Refinement compatibility is a separate hypothesis unless the specified cost certificate proves that its failure has divergent renormalized cost; under that certificate, finite cost excludes the failure. ∎

**Corollary X.8j.4c (Inclusive and Dressed Representatives of the Same Soft-Ledger Quotient).** Let $R_\lambda$ be the finite set of scattering records at detector resolution $\lambda$, let
$$
q_\lambda:R_\lambda\to Q_\lambda:=R_\lambda/{\sim_\lambda}
$$
be the unresolved-soft quotient, and let $\mu_\lambda$ be the normalized finite transition measure supplied by the action-entropy ledger. For every soft-ledger-invariant observable $\mathcal O=\widetilde{\mathcal O}\circ q_\lambda$,
$$
\langle\mathcal O\rangle_{\lambda}
=
\sum_{Q\in Q_\lambda}
\widetilde{\mathcal O}(Q)\,
(q_\lambda)_*\mu_\lambda(Q).
\tag{X.8j.8}
$$
An inclusive representative computes (X.8j.8) by summing over the whole fiber $q_\lambda^{-1}(Q)$. A dressed representative computes the same quotient value when the branch supplies a coherent section
$$
s_\lambda:Q_\lambda\to R_\lambda,
\qquad
q_\lambda\circ s_\lambda=\mathrm{id}_{Q_\lambda},
$$
and transfers the push-forward measure to that section:
$$
\sum_{r\in R_\lambda}\mathcal O(r)\mu_\lambda(r)
=
\sum_{Q\in Q_\lambda}\widetilde{\mathcal O}(Q)(q_\lambda)_*\mu_\lambda(Q)
=
\sum_{Q\in Q_\lambda}\mathcal O(s_\lambda(Q))(q_\lambda)_*\mu_\lambda(Q).
\tag{X.8j.9}
$$
Inclusive and dressed constructions are therefore two representatives of the same quotient observable whenever they induce the same quotient measure; they are not separate infrared postulates.

*Proof.* Since $\mathcal O=\widetilde{\mathcal O}\circ q_\lambda$,
$$
\sum_{r\in R_\lambda}\mathcal O(r)\mu_\lambda(r)
=
\sum_{r\in R_\lambda}\widetilde{\mathcal O}(q_\lambda(r))\mu_\lambda(r).
$$
Grouping terms by the quotient class $Q=q_\lambda(r)$ gives (X.8j.8). If $s_\lambda$ is a section, then $q_\lambda(s_\lambda(Q))=Q$, so $\mathcal O(s_\lambda(Q))=\widetilde{\mathcal O}(Q)$ for every class. Substituting this into (X.8j.8) gives (X.8j.9). ∎

**Theorem X.8j.4d (Finite Soft-Ledger Quotient Invariance).** Let
$$
(R_\lambda,\mu_\lambda,q_\lambda)
\quad\text{and}\quad
(R'_\lambda,\mu'_\lambda,q'_\lambda)
$$
be two finite unresolved-soft refinements of the same quotient record set $Q_\lambda$. Assume they preserve the same finite boundary ledger charges and have the same quotient transition measure:
$$
(q_\lambda)_*\mu_\lambda
=
(q'_\lambda)_*\mu'_\lambda.
\tag{X.8j.10}
$$
Then every PPI-observable scattering quantity at resolution $\lambda$ has identical expectation on the two refinements:
$$
\sum_{r\in R_\lambda}\mathcal O(r)\mu_\lambda(r)
=
\sum_{r'\in R'_\lambda}\mathcal O'(r')\mu'_\lambda(r'),
\tag{X.8j.11}
$$
where $\mathcal O=\widetilde{\mathcal O}\circ q_\lambda$ and $\mathcal O'=\widetilde{\mathcal O}\circ q'_\lambda$. Thus all dependence on unresolved soft real, virtual, or dressed bookkeeping is invisible to quotient observables after PCE quotienting, provided the branch has established the common push-forward measure (X.8j.10). Physical KLN or Faddeev-Kulish realization remains the sector-level proof that the corresponding refinements satisfy this hypothesis.

*Proof.* By Theorem X.8j.4b, a PPI-observable scattering quantity descends to the quotient, so there exists $\widetilde{\mathcal O}:Q_\lambda\to\mathbb C$ with $\mathcal O=\widetilde{\mathcal O}\circ q_\lambda$ and $\mathcal O'=\widetilde{\mathcal O}\circ q'_\lambda$. Applying the push-forward identity to the first refinement gives
$$
\sum_{r\in R_\lambda}\mathcal O(r)\mu_\lambda(r)
=
\sum_{Q\in Q_\lambda}
\widetilde{\mathcal O}(Q)(q_\lambda)_*\mu_\lambda(Q).
$$
Applying the same identity to the second refinement gives
$$
\sum_{r'\in R'_\lambda}\mathcal O'(r')\mu'_\lambda(r')
=
\sum_{Q\in Q_\lambda}
\widetilde{\mathcal O}(Q)(q'_\lambda)_*\mu'_\lambda(Q).
$$
The quotient measures are equal by (X.8j.10), so the two sums are equal. Any remaining difference is internal to fibers of $q_\lambda$ or $q'_\lambda$, is invisible to all admissible protocols at resolution $\lambda$, and is removed by the PCE quotient. ∎

**Proposition X.8j.4e (Poisson Soft-Ledger Class: Inclusive Finiteness and Regulator Independence).** Fix a hard record, a detector resolution $\lambda>0$ and a soft exponent $A>0$. An admissible infrared regulator profile is a measurable $\psi$ with $\mathbf 1_{[\epsilon,\lambda]}\le\psi\le\mathbf 1_{(0,\lambda]}$ for some $\epsilon\in(0,\lambda)$ and $\int_0^\lambda\psi(\omega)\,d\omega/\omega<\infty$. Let the unresolved soft quanta form a Poisson point process on $(0,\lambda]$ with intensity $A\psi(\omega)\,d\omega/\omega$, let $N^\psi$ be their number, and let $X^\psi=\sum_i\omega_i$ be their total energy, the soft entry of the boundary energy ledger. Register the detector protocol family as the readout of the hard record and of $X^\psi$, so that Definition X.8j.4a identifies records with equal hard record and equal $X^\psi$, and every function of $X^\psi$ is soft-ledger invariant. Let $X^0$ be the total energy for the intensity $A\,d\omega/\omega$ on $(0,\lambda]$, and let $\gamma_{\mathrm E}$ be Euler's constant. Then:

1. with $m_\epsilon=A\ln(\lambda/\epsilon)$, every exclusive count probability satisfies $\mathbb P(N^\psi=k)\le e^{-m_\epsilon}m_\epsilon^k/k!$ whenever $m_\epsilon\ge k$; in particular $\mathbb P(N^\psi=0)\le(\epsilon/\lambda)^A$, and every exclusive count probability tends to $0$ as $\epsilon\to0$;

2. $X^0$ is almost surely finite and positive, $\mathbb E X^0=A\lambda$, and
$$
F_0(E):=\mathbb P(X^0\le E)
=
\frac{e^{-\gamma_{\mathrm E}A}}{\Gamma(1+A)}\Bigl(\frac E\lambda\Bigr)^A
\qquad(0\le E\le\lambda);
\tag{X.8j.4e.1}
$$

3. for every $E\in(0,\lambda)$ and $\delta\in(0,\lambda-E]$,
$$
0\le\mathbb P(X^\psi\le E)-F_0(E)\le F_0(E+\delta)-F_0(E)+\frac{A\epsilon}{\delta},
\tag{X.8j.4e.2}
$$
and, when $\sqrt{\epsilon\lambda}\le\lambda-E$,
$$
0\le\mathbb P(X^\psi\le E)-F_0(E)
\le
A\sqrt{\epsilon/\lambda}\left(1+\frac{e^{-\gamma_{\mathrm E}A}\max\bigl((E/\lambda)^{A-1},1\bigr)}{\Gamma(1+A)}\right);
\tag{X.8j.4e.3}
$$

4. consequently the inclusive soft-ledger-invariant response $\mathbb P(X^\psi\le E)$ converges to the regulator-independent limit $F_0(E)$ with the explicit tail bound (X.8j.4e.3), uniformly over admissible profiles with the same $\epsilon$, and two admissible profiles with the same $\epsilon$ give values differing by at most the right side of (X.8j.4e.3).

*Proof.* Since $0\le\psi\le1$, the superposition theorem for Poisson processes realizes the intensity $A\,d\omega/\omega$ on $(0,\lambda]$ as the union of independent Poisson processes with intensities $A\psi\,d\omega/\omega$ and $A(1-\psi)\,d\omega/\omega$. Hence $X^0$ has the law of $X^\psi+Y$ with $Y\ge0$ independent of $X^\psi$ and, by Campbell's formula, $\mathbb EY=A\int_0^\lambda(1-\psi(\omega))\,d\omega\le A\epsilon$, because $1-\psi\le\mathbf 1_{(0,\epsilon)}$ on $(0,\lambda]$.

Item 1: $N^\psi$ is Poisson with mean $m=A\int_0^\lambda\psi\,d\omega/\omega\ge m_\epsilon$, and $e^{-m}m^k/k!$ is nonincreasing in $m$ for $m\ge k$.

Item 2: Campbell's formula gives $\mathbb EX^0=\int_0^\lambda\omega\,A\,d\omega/\omega=A\lambda$, so $X^0<\infty$ almost surely. The number of points in $[\epsilon,\lambda]$ is Poisson with mean $m_\epsilon\to\infty$, so there are infinitely many points almost surely and $X^0>0$; thus $F_0(0)=0$. The Mecke formula for Poisson processes gives, for measurable $g\ge0$,
$$
\mathbb E\bigl[X^0g(X^0)\bigr]
=
A\int_0^\lambda\mathbb E\bigl[g(X^0+\omega)\bigr]\,d\omega .
$$
With $g=\mathbf 1_{(0,x]}$ and $0<x\le\lambda$ this becomes
$$
\int_{(0,x]}y\,dF_0(y)=A\int_0^\lambda F_0(x-\omega)\,d\omega=A\int_0^xF_0(y)\,dy .
$$
The right side is continuous in $x$, so the measure $y\,dF_0(y)$ on $(0,\lambda]$ has density $AF_0(y)$, and $dF_0(y)=AF_0(y)y^{-1}dy$ there. On every interval $[x_1,\lambda]$ with $x_1>0$, $F_0$ is absolutely continuous with $F_0'=AF_0/y$ almost everywhere, so $F_0(y)y^{-A}$ is constant; hence $F_0(y)=\kappa y^A$ on $(0,\lambda]$. The Laplace functional of the Poisson process and the identity $\int_0^z(1-e^{-u})\,du/u=\gamma_{\mathrm E}+\ln z+E_1(z)$ give
$$
\mathbb E e^{-sX^0}
=
\exp\left(-A\int_0^\lambda(1-e^{-s\omega})\frac{d\omega}{\omega}\right)
=
e^{-\gamma_{\mathrm E}A}(s\lambda)^{-A}e^{-AE_1(s\lambda)} .
$$
On the other hand $\mathbb Ee^{-sX^0}=\kappa A s^{-A}\int_0^{s\lambda}e^{-u}u^{A-1}du+R(s)$ with $0\le R(s)\le e^{-s\lambda}$. Multiplying both expressions by $s^A$ and letting $s\to\infty$ gives $\kappa\Gamma(1+A)=e^{-\gamma_{\mathrm E}A}\lambda^{-A}$, which is (X.8j.4e.1).

Item 3: $X^\psi\le X^\psi+Y$ gives the lower bound. For the upper bound,
$$
\mathbb P(X^\psi\le E)
\le
\mathbb P(X^\psi+Y\le E+\delta)+\mathbb P(Y>\delta)
\le
F_0(E+\delta)+\frac{A\epsilon}{\delta}
$$
by Markov's inequality, which is (X.8j.4e.2). By the mean-value theorem, $F_0(E+\delta)-F_0(E)=e^{-\gamma_{\mathrm E}A}A(\xi/\lambda)^{A-1}(\delta/\lambda)/\Gamma(1+A)$ for some $\xi\in(E,\lambda]$, and $(\xi/\lambda)^{A-1}\le\max\bigl((E/\lambda)^{A-1},1\bigr)$; setting $\delta=\sqrt{\epsilon\lambda}$, for which $\delta/\lambda=\sqrt{\epsilon/\lambda}$ and $A\epsilon/\delta=A\sqrt{\epsilon/\lambda}$, gives (X.8j.4e.3), whose right side depends only on the dimensionless ratios $\epsilon/\lambda$ and $E/\lambda$. Item 4 follows because the bound depends on $\psi$ only through $\epsilon$ and both regulated values lie in the same interval above $F_0(E)$. ∎

**Resolution TV-X-12-R1 (Metadata).** Exact domain: Poisson soft-emission records at detector resolution $\lambda$ with soft intensity $A\psi(\omega)\,d\omega/\omega$ for every admissible regulator profile $\psi$. Premises: a fixed hard record, $A>0$, $\lambda>0$, the profile bounds, and the registered hard-record and total-soft-energy readout. Equivalence: records with equal hard record and equal total soft energy, as in Definition X.8j.4a. Budget: one soft exponent, one resolution and one regulator scale. Verifier: the Poisson superposition coupling, Campbell's and Mecke's formulas, Markov's inequality and the Laplace-functional identity. Falsifier: an admissible profile violating (X.8j.4e.2), or a distribution function of $X^0$ different from (X.8j.4e.1) on $[0,\lambda]$. Provenance class: source-internal exact computation on a frozen stochastic class. Downstream consumers: Definition X.8j.4a, Theorem X.8j.4b, Corollary X.8j.4c, Theorem X.8j.4d and `TV-X-12`. Nonvacuity: $A=\lambda=1$, where (X.8j.4e.1) gives $F_0(1)=e^{-\gamma_{\mathrm E}}$, the Dickman law. This is `positive-discharge` of inclusive response finiteness and regulator independence with explicit tail bounds on the Poisson soft-ledger class, with vanishing exclusive count probabilities. The soft charge and boundary dressing construction, the derivation of the Poisson soft-emission law and of $A$ from a long-range gauge or emergent-metric sector, and correlated soft emission remain `M+C+R` under `TV-X-12`.

### X.8k Predictive Calderón-Schur Boundary Reconstruction

**Definition X.8k.1 (Finite Boundary Response Map).** Let a finite regular predictive network have boundary nodes $\partial N$ and interior nodes $I$. Let the quadratic predictive response operator be a positive block operator
$$
\mathfrak L=
\begin{pmatrix}
L_{\partial\partial} & L_{\partial I}\\
L_{I\partial} & L_{II}
\end{pmatrix},
\qquad
L_{II}>0.
$$
For imposed boundary data $u_{\partial}$, the interior harmonic extension is the unique solution of
$$
L_{II}u_I+L_{I\partial}u_{\partial}=0.
\tag{X.8k.1}
$$
The finite boundary response map is the Schur complement
$$
\Lambda_{\partial}
=
L_{\partial\partial}
-
L_{\partial I}L_{II}^{-1}L_{I\partial},
\tag{X.8k.2}
$$
so that the measured boundary flux is
$$
j_{\partial}=\Lambda_{\partial}u_{\partial}.
$$

**Theorem X.8k.2 (Boundary Protocols Determine the Predictive Schur Operator).** On a finite branch satisfying Definition X.8k.1, the complete set of linear boundary-response protocols determines $\Lambda_{\partial}$ uniquely. Two interior networks are indistinguishable by all such boundary protocols if and only if they have the same $\Lambda_{\partial}$. If the candidate class with a prescribed $\Lambda_{\partial}$ is nonempty and compact, its PCE cost is lower semicontinuous, and that cost is strict on representatives not related by boundary-preserving gauge transformations, then a minimal representative exists and is unique modulo those transformations.

*Proof.* For each boundary basis vector $e_a$, impose $u_{\partial}=e_a$ and solve (X.8k.1). The measured vector
$$
j_{\partial}^{(a)}=\Lambda_{\partial}e_a
$$
is the $a$-th column of $\Lambda_{\partial}$, so the finite protocol list determines the operator.

Equality of Schur operators gives equality of flux for every boundary input. Conversely, equality of flux for every boundary vector gives
$$
(\Lambda_{\partial}^{(1)}-\Lambda_{\partial}^{(2)})u_{\partial}=0
$$
for every $u_{\partial}$, hence equality of the operators. On the additional compact candidate class, lower semicontinuity gives a minimizer. If two minimizers were not boundary-gauge related, strictness would make one have larger cost, a contradiction. ∎

**Corollary X.8k.3 (Interior Effective Structure from Boundary Protocols).** Relative to the complete linear boundary protocol family of Definition X.8k.1, the observable content is exactly the Schur boundary response class. Interior variations preserving $\Lambda_{\partial}$ are invisible to that family. They are PCE-degenerate only when the complete branch cost descends to this response quotient; removal of a surplus representative additionally requires an admissible response-preserving cost comparison.

*Proof.* Theorem X.8k.2 identifies equality of every registered linear boundary response with equality of $\Lambda_{\partial}$. This proves indistinguishability relative to that family. If the complete cost is a function of the Schur response class, the costs also agree. If an admitted comparator preserves all charged response data and strictly lowers the complete cost, PCE excludes the surplus representative. These are distinct additional cost hypotheses. ∎

**Corollary X.8k.4 (Schur Response and Quantum Recovery Data).** On a finite quantum-algebra branch satisfying Definition X.8k.1 and Definition F.10.6a, assume that the complete linear boundary protocol family determines a PCE-minimal boundary syndrome $B_R$ as a specified function of the Schur response operator $\Lambda_{\partial}$. Then:

1. the Schur response class $\Lambda_{\partial}$ determines $B_R$ by the specified syndrome map;

2. the finite Markov condition
$$
I(R:\bar R\mid B_R)_\rho=0
\tag{X.8k.3}
$$
is equivalent to the existence of a CPTP channel $\mathcal R_{B_R\to B_R\bar R}$ such that
$$
\rho_{R B_R\bar R}
=
(\operatorname{id}_R\otimes\mathcal R_{B_R\to B_R\bar R})(\rho_{R B_R});
\tag{X.8k.4}
$$

3. after a representative's blocks $L_{II}$ and $L_{I\partial}$ are supplied, they determine its harmonic interior response
$$
u_I=-L_{II}^{-1}L_{I\partial}u_{\partial}
\tag{X.8k.5}
$$
for every boundary input $u_{\partial}$.

The Schur datum, the quantum Markov datum, and the harmonic representative are equivalent descriptions only on a branch carrying an explicit bridge certificate that identifies their state spaces, response maps, and equivalence relations and proves both directions of the identification. Without that certificate, the implications in items 1–3 are the complete conclusions.

If
$$
I(R:\bar R\mid B_R)_\rho\le\epsilon,
$$
then, under the tripartite recovery hypotheses stated for this branch, there is a recovered state $\widetilde\rho$ satisfying
$$
\lVert\rho_{R B_R\bar R}-\widetilde\rho_{R B_R\bar R}\rVert_1
\le
2\sqrt{1-e^{-\epsilon}}
\le
2\sqrt\epsilon.
\tag{X.8k.6}
$$

*Proof.* Theorem X.8k.2 reconstructs $\Lambda_{\partial}$ from complete linear boundary protocols. Composing that reconstruction with the assumed syndrome map proves item 1. Theorem F.10.6b proves the equivalence in item 2 for finite quantum algebras. Solving the interior block equation
$$
L_{II}u_I+L_{I\partial}u_{\partial}=0
$$
for the supplied representative and using invertibility of $L_{II}$ gives (X.8k.5), proving item 3. Boundary protocols alone determine $\Lambda_{\partial}$ and do not select these interior blocks or their harmonic lift. None of these three deductions identifies a classical Schur extension with a quantum recovery channel. Such an identification follows only from the additional bridge certificate stated above. This proves the exact statements; the approximate-recovery statement is addressed in the following paragraph.

For the approximate statement, apply the Fawzi–Renner recoverability theorem [Fawzi and Renner 2015] directly to the tripartite state on $R:B_R:\bar R$. From $I(R:\bar R\mid B_R)_\rho\le\epsilon$, it supplies a recovery channel with fidelity at least $e^{-\epsilon/2}$. The Fuchs–van de Graaf inequality then gives
$$
\lVert\rho-\widetilde\rho\rVert_1
\le
2\sqrt{1-e^{-\epsilon}}
\le
2\sqrt\epsilon,
$$
which is (X.8k.6). ∎

**Corollary X.8k.4a (Schur-Heat Kernel Boundary Amplitudes).** Let $\mathfrak L$ satisfy Definition X.8k.1, and let $\Lambda_{\partial}$ be the Schur boundary response operator (X.8k.2). For every $\tau>0$, the finite heat operator
$$
K_\tau^\partial:=e^{-\tau\Lambda_{\partial}}
\tag{X.8k.4a.1}
$$
is determined by boundary protocols. Hence every boundary transition amplitude
$$
A_{ij}(\tau)
:=
\langle u_j,K_\tau^\partial u_i\rangle
\tag{X.8k.4a.2}
$$
between retained boundary states $u_i,u_j$ is a PPI-invariant boundary-response scalar.

On a smooth-envelope branch, let a registered family of finite boundary operators converge, with the declared boundary-state and measure normalization, to a positive Laplace-type operator $L=\nabla^*\nabla+E$ on a smooth rank-$r$ bundle over a $d$-dimensional retained boundary manifold. Assume its heat-kernel certificate gives the continuum kernel $K_\tau(x,y)$ at each $\tau>0$, uniformly on compact subsets of a geodesically convex neighborhood $U\times U$. After this continuum limit, the local small-time expansion is
$$
K_\tau(x,y)
=
(4\pi\tau)^{-d/2}
\Delta_{\mathrm{VVM}}(x,y)^{1/2}
\exp\left[-\frac{d_{\partial}(x,y)^2}{4\tau}\right]
\left(\mathcal P_{x\leftarrow y}+O(\tau)\right),
\tag{X.8k.4a.3}
$$
where $\mathcal P_{x\leftarrow y}$ is parallel transport for $\nabla$ along the unique minimizing geodesic in $U$. On the scalar Laplace-Beltrami branch, $\mathcal P_{x\leftarrow y}=1$. Applying this expansion to a finite boundary matrix element at a specified $\tau$ additionally requires a quantitative relative finite-to-continuum comparison, with the same state and measure normalization; convergence at each positive $\tau$ alone does not control a joint refinement and $\tau\downarrow0$ limit.

*Proof.* The finite spectral theorem gives
$$
e^{-\tau\Lambda_{\partial}}=
\sum_a e^{-\tau\lambda_a}P_a,
$$
so boundary protocols determining $\Lambda_{\partial}$ also determine the finite heat operator and all its matrix elements. On the smooth-envelope branch, take the certified continuum limit at each positive $\tau$ to obtain the heat kernel $K_\tau$ of $L$. The subsequent small-time limit concerns that continuum kernel. The Hadamard-Minakshisundaram-Pleijel parametrix gives, on a geodesically convex neighborhood, coefficients $a_j(x,y)$ with
$$
K_\tau(x,y)
\sim
(4\pi\tau)^{-d/2}e^{-d_{\partial}(x,y)^2/(4\tau)}
\Delta_{\mathrm{VVM}}(x,y)^{1/2}
\sum_{j\ge0}\tau^j a_j(x,y),
$$
and its leading transport equation gives $a_0(x,y)=\mathcal P_{x\leftarrow y}$. Truncation after $j=0$ has a uniform $O(\tau)$ remainder on compact subsets of $U\times U$. This proves (X.8k.4a.3) for the continuum kernel on the stated domain. A finite-kernel prediction also carries the independent relative comparison error from the heat-kernel certificate. ∎

**Definition X.8k.5 (Colorless Boundary Impedance Map).** Let $H_{\mathrm{conf}}$ be a finite self-adjoint retained operator on a confined sector decomposed as
$$
\mathcal H_{\mathrm{conf}}
=
\mathcal H_I\oplus\mathcal H_{\partial},
$$
where $\mathcal H_I$ carries color-interior variables and $\mathcal H_{\partial}$ carries colorless boundary protocol variables. Write
$$
H_{\mathrm{conf}}
=
\begin{pmatrix}
H_{II}&H_{I\partial}\\
H_{\partial I}&H_{\partial\partial}
\end{pmatrix}.
$$
For $E\notin\operatorname{spec}(H_{II})$, the colorless boundary impedance map is
$$
\Lambda_{\mathrm{QCD}}(E)
=
H_{\partial\partial}-E
-
H_{\partial I}(H_{II}-E)^{-1}H_{I\partial}.
\tag{X.8k.7}
$$
For a nuclear aggregate sector $(Z,N)$ the same construction is denoted
$$
\Lambda_A^{\mathrm{PU}}(E),
\qquad
A=(Z,N).
\tag{X.8k.8}
$$

**Theorem X.8k.6 (Finite Boundary-Impedance Spectral Criterion).** Let $H_{\mathrm{conf}}$ satisfy Definition X.8k.5. For every $E\notin\operatorname{spec}(H_{II})$:

1. $E$ is an eigenvalue of $H_{\mathrm{conf}}$ with nonzero colorless boundary component if and only if
$$
\det\Lambda_{\mathrm{QCD}}(E)=0.
\tag{X.8k.9}
$$

2. If $0\ne b\in\ker\Lambda_{\mathrm{QCD}}(E)$, the corresponding interior component is uniquely
$$
u_I
=
-(H_{II}-E)^{-1}H_{I\partial}b,
\tag{X.8k.10}
$$
and
$$
u=u_I\oplus b
$$
is an eigenvector of $H_{\mathrm{conf}}$.

3. Interior eigenvectors with zero colorless boundary component are invisible to colorless boundary protocols unless they act through another retained response map. They are therefore not hadron or nuclear boundary-response states in this protocol class.

4. If an exterior colorless channel supplies a finite outgoing impedance $\Lambda_{\mathrm{out}}(E)$, then matched bound or resonance energies on the finite branch are the zeros of
$$
\det\left(\Lambda_{\mathrm{QCD}}(E)-\Lambda_{\mathrm{out}}(E)\right)=0,
\tag{X.8k.11}
$$
with resonance continuation understood only on branches where the exterior finite channel map has been specified.

5. Two confined interiors with the same meromorphic boundary impedance map give the same colorless boundary protocol responses and are PPI-equivalent for those protocols. This response-class quotient is unconditional under the preceding hypotheses. For a concrete PCE selection, let $\mathcal I_{\Lambda}$ be a specified nonempty comparison class of such interiors and let $C_{\Lambda}:\mathcal I_{\Lambda}\to(-\infty,+\infty]$ be the complete descended cost, finite somewhere. If $\mathcal I_{\Lambda}$ is finite, or is compact with $C_{\Lambda}$ lower semicontinuous, then
$$
\operatorname*{argmin}_{I\in\mathcal I_{\Lambda}}C_{\Lambda}(I)\ne\varnothing.
$$
PCE selects this argmin; a unique retained representative follows only when the argmin is a singleton.

*Proof.* Let $u=u_I\oplus b$. The eigenvalue equation $(H_{\mathrm{conf}}-E)u=0$ is the block system
$$
(H_{II}-E)u_I+H_{I\partial}b=0,
\tag{X.8k.12}
$$
$$
H_{\partial I}u_I+(H_{\partial\partial}-E)b=0.
\tag{X.8k.13}
$$
Since $E\notin\operatorname{spec}(H_{II})$, the first equation has the unique solution (X.8k.10). Substituting it into the second equation gives
$$
\left(
H_{\partial\partial}-E
-
H_{\partial I}(H_{II}-E)^{-1}H_{I\partial}
\right)b=0,
$$
which is exactly
$$
\Lambda_{\mathrm{QCD}}(E)b=0.
$$
Thus a nonzero boundary component exists if and only if $\ker\Lambda_{\mathrm{QCD}}(E)\ne0$, equivalently (X.8k.9). This proves items 1 and 2.

If an eigenvector has $b=0$, then its response under every colorless boundary protocol using $\Lambda_{\mathrm{QCD}}$ is zero. Such a state may still be physical if another retained protocol couples to it, but it is invisible in the colorless boundary-response class. This proves item 3.

For an exterior finite channel, matching means equality of the interior boundary flux and exterior boundary flux for the same boundary amplitude $b$. With sign convention absorbed into $\Lambda_{\mathrm{out}}$, this is
$$
\left(\Lambda_{\mathrm{QCD}}(E)-\Lambda_{\mathrm{out}}(E)\right)b=0.
$$
A nonzero matched boundary amplitude exists exactly when (X.8k.11) holds. This proves item 4.

Finally, for each admitted $E\notin\operatorname{spec}(H_{II})$, imposing every boundary basis vector reads off each column of $\Lambda_{\mathrm{QCD}}(E)$. Equality of these matrices is therefore equivalent to equality of all linear colorless boundary responses at that energy. Applying this column argument on the common meromorphic domain identifies the impedance response class; it does not require $H_{\mathrm{conf}}-E$ to satisfy the positivity premise of Theorem X.8k.2. On a finite comparison class the complete cost attains a minimum directly; on a compact class lower semicontinuity gives attainment. PCE therefore selects the nonempty argmin under item 5's declared alternatives, while uniqueness requires that argmin to be a singleton. Without those selection data, only the PPI response-equivalence class is proved. ∎

**Definition X.8k.6a (Finite Nuclear Aggregate Operator Package).** For a fixed proton-neutron sector $A=(Z,N)$, a finite nuclear aggregate operator package is a finite record
$$
\mathfrak B_A^{\mathrm{nuc}}
=
\left(
\mathcal H_A^{\mathrm{adm}},
\mathcal H_A^{\mathrm{ret}},
\mu_A^{\mathrm{ret}},
\mathcal S_A^{\mathrm{mb}},
\mathcal B_A^{\partial},
\mathcal P_A^{\partial},
Z_A^{\mathrm{PU}}(E),
\Lambda_A^{\mathrm{PU}}(E),
\Lambda_{A,\mathrm{out}}(E),
H_A^{\mathrm{PU}},
J_A^{\mathrm{spin}},
\mathcal T_A,
\mathcal D_A,
\mathcal R_A^{\mathrm{open}},
\mathcal U_A,
\Pi_{A\leftarrow T},
V_A^{\mathrm{PCE}},
\chi_A^{\mathrm{nuc}}
\right)
\tag{X.8k.14}
$$
where:

1. $\mathcal H_A^{\mathrm{adm}}$ is the finite set or compact finite-dimensional family of self-adjoint colorless $A$-nucleon aggregate Hamiltonians compatible with the accepted elementary Appendix T parameter vector, cluster separability, unitarity, exchange symmetry, color confinement, finite resolution, and the retained two- and three-body boundary response data.

2. $\mathcal H_A^{\mathrm{ret}}$ is the retained finite Hilbert space for the sector, including proton number, neutron number, spin, parity, isospin convention where used, center-of-mass quotient, antisymmetrization, and any finite shell, cluster, or boundary-channel truncation.

3. $\mu_A^{\mathrm{ret}}$ is the retained Hilbert-space measure and inner-product normalization used for spectra, matrix elements, trace estimates, and uncertainty propagation.

4. $\mathcal S_A^{\mathrm{mb}}$ is the finite many-body effective-action ledger. It lists the one-body, two-body, three-body, exchange, contact, spin-orbit, Coulomb, weak, and finite-size operators retained by the branch; the cutoff or boundary-resolution scale; the symmetrization convention; and the proof that every term descends from accepted elementary data, from accepted boundary-response data, or from a named nuclear model-layer entry.

5. $\mathcal B_A^{\partial}$ is the boundary-response datum: boundary Hilbert space, colorless interface variables, incoming/outgoing channel basis, boundary pairing, exterior matching convention, and finite Schur block decomposition used to define $\Lambda_A^{\mathrm{PU}}(E)$.

6. $\mathcal P_A^{\partial}$ is the finite colorless boundary protocol family used to identify PPI-equivalent interiors.

7. $Z_A^{\mathrm{PU}}(E)$ is the accepted meromorphic colorless boundary impedance record on $\mathcal P_A^{\partial}$.

8. $\Lambda_A^{\mathrm{PU}}(E)$ is the Schur impedance map generated by the selected retained operator on $\mathcal H_A^{\mathrm{ret}}$:
$$
\Lambda_A^{\mathrm{PU}}(E)
=
H_{\partial\partial}^{A}-E
-
H_{\partial I}^{A}(H_{II}^{A}-E)^{-1}H_{I\partial}^{A}.
\tag{X.8k.15}
$$

9. $\Lambda_{A,\mathrm{out}}(E)$ is the accepted exterior open-channel impedance. It includes the sheet, width, threshold, and analytic-continuation convention whenever a resonance pole is claimed.

10. $H_A^{\mathrm{PU}}$ is either an explicit finite self-adjoint operator in $\mathcal H_A^{\mathrm{adm}}$ or the PCE-minimal selected representative of the admissible completion set (X.8k.16) below.

11. $J_A^{\mathrm{spin}}$ is the finite family of retained spin-current operators, including spin quantization, axial/vector current convention, and overlap maps to the elementary weak and electromagnetic currents fixed by Appendix T.

12. $\mathcal T_A$ is the finite transition-operator ledger. For every claimed electromagnetic, weak, beta, gamma, or neutrino-induced transition, it lists the finite operator, selection rules, phase-space normalization, current normalization, and pole/running convention imported from Appendix T.

13. $\mathcal D_A$ is the finite decay-operator ledger. It lists the allowed decay channels, emitted-particle Hilbert spaces, threshold convention, weak-current or strong-current map, and the finite operator whose matrix elements determine the channel rate.

14. $\mathcal R_A^{\mathrm{open}}$ is the open-channel resonance map
$$
E\longmapsto
\det\left(\Lambda_A^{\mathrm{PU}}(E)-\Lambda_{A,\mathrm{out}}(E)\right),
\tag{X.8k.15a}
$$
with its finite root-finding interval, pole-sheet convention, and tail or truncation residual.

15. $\mathcal U_A$ is the uncertainty and covariance ledger. It separates theorem-level residual bounds, model-layer tolerances, finite-cutoff tails, phase-space quadrature errors, and correlated elementary-input uncertainties. No entry of $\mathcal U_A$ may be counted again in Appendix T threshold, flavor, decay, or registry uncertainty rows.

16. $\Pi_{A\leftarrow T}$ is the overlap map from the accepted elementary Appendix T parameter vector to the nuclear package. It records which elementary masses, couplings, CKM/PMNS entries, weak currents, electromagnetic current normalizations, and threshold conventions enter the many-body effective action and proves that the nuclear many-body entries not in this image are independent nuclear effective-action or boundary-response data.

17. $V_A^{\mathrm{PCE}}$ is the branch scalarization of PCE resource cost on $\mathcal H_A^{\mathrm{adm}}$, strict on PPI-distinct representatives when uniqueness is claimed.

18. $\chi_A^{\mathrm{nuc}}$ records that all entries are fixed before isotope-stability, magic-number, spin-dependent, transition-rate, or decay-channel comparison, and that changing any finite part, projector, tail, boundary protocol, open-channel map, or normalization after a dependent row is fixed defines a new nuclear branch.

The admissible completion set is
$$
\mathcal K_A
=
\left\{
H\in\mathcal H_A^{\mathrm{adm}}
:
\Lambda_H(E)|_{\mathcal P_A^{\partial}}
=
Z_A^{\mathrm{PU}}(E),
\quad
J_H^{\mathrm{spin}}=J_A^{\mathrm{spin}},
\quad
\mathcal T_H=\mathcal T_A,
\quad
\mathcal D_H=\mathcal D_A,
\quad
\Pi_{A\leftarrow T}\text{ commutes}
\right\}.
\tag{X.8k.16}
$$
A package is accepted exactly when every component above is finite, $H_A^{\mathrm{PU}}$ is self-adjoint on $\mathcal H_A^{\mathrm{ret}}$, the Schur impedance (X.8k.15) equals the accepted boundary record on $\mathcal P_A^{\partial}$, the exterior channel map is fixed before resonance comparison, all transition and decay operators act on the same retained Hilbert space, the covariance ledger is category-separated, and $\chi_A^{\mathrm{nuc}}=1$.

**Theorem X.8k.6b (Nuclear Spectral Determinacy from an Accepted Operator Package).** If $\mathfrak B_A^{\mathrm{nuc}}$ is accepted and $\mathcal K_A$ is nonempty, compact, and carries lower semicontinuous $V_A^{\mathrm{PCE}}$, then a PCE-minimal aggregate Hamiltonian exists:
$$
H_A^{\mathrm{PU}}
\in
\operatorname*{argmin}_{H\in\mathcal K_A}
V_A^{\mathrm{PCE}}(H).
\tag{X.8k.17}
$$
If $V_A^{\mathrm{PCE}}$ is strict on PPI-distinct representatives, then the minimizing PPI response class is unique. A representative is unique up to boundary-preserving unitary equivalence only if the accepted package additionally certifies that PPI equivalence within $\mathcal K_A$ is exactly boundary-preserving unitary equivalence. For $E\notin\operatorname{spec}(H_{II}^{A})$, its bound-state energies with nonzero retained colorless boundary component are determined by
$$
\det\Lambda_A^{\mathrm{PU}}(E)=0,
\tag{X.8k.18}
$$
and, for an accepted exterior open channel, its matched bound or resonance energies are fixed by
$$
\det\left[
\Lambda_A^{\mathrm{PU}}(E)-\Lambda_{A,\mathrm{out}}(E)
\right]=0.
\tag{X.8k.19}
$$
For eigenvectors $\psi_i,\psi_f$ of $H_A^{\mathrm{PU}}$, every retained spin observable, transition amplitude, and decay-channel amplitude is the finite matrix element
$$
\langle \psi_f,J_A^{\mathrm{spin}}\psi_i\rangle,
\qquad
\langle \psi_f,T\psi_i\rangle\quad(T\in\mathcal T_A),
\qquad
\langle \psi_f,D\psi_i\rangle\quad(D\in\mathcal D_A),
\tag{X.8k.20}
$$
with phase-space and current normalizations supplied by the same package. The certified interval for any listed nuclear observable is the image of $\mathcal U_A$ under the corresponding finite spectral or matrix-element map.

*Proof.* Compactness and nonemptiness of $\mathcal K_A$ are theorem hypotheses. Since $V_A^{\mathrm{PCE}}$ is lower semicontinuous on this compact set, the extreme-value theorem gives a minimizer, proving (X.8k.17). If two minimizers represented distinct PPI response classes, strictness would assign different costs, contradicting equality at the minimum. Thus the minimizing PPI class is unique. When the accepted package also identifies PPI equivalence in $\mathcal K_A$ with boundary-preserving unitary equivalence, any two minimizing representatives are related by such a unitary, and the registered protocol responses and transported matrix elements are invariant by that certificate.

On the domain $E\notin\operatorname{spec}(H_{II}^{A})$ and for nonzero retained boundary components, Equations (X.8k.18) and (X.8k.19) are Theorem X.8k.6 applied to the selected aggregate Hamiltonian $H_A^{\mathrm{PU}}$ and accepted exterior impedance. Given the prepared initial and final states in the same finite retained Hilbert space, the registered operators determine their matrix elements. Within a degenerate eigenspace, individual eigenvectors require the package's state-preparation or basis data; the spectral theorem alone determines the eigenspace projector. The uncertainty ledger $\mathcal U_A$ is a finite list of intervals and covariance entries, so its image under the finite algebraic spectral maps gives the certified observable intervals. ∎

**Theorem X.8k.6c (Nuclear Operator Non-Identifiability without the Package).** Let a specified nuclear observable be evaluated on accepted packages of Definition X.8k.6a. If two packages satisfy every accepted parent constraint, agree on $\Pi_{A\leftarrow T}$ and every accepted elementary Appendix T input, but give unequal values of that observable, those parent data do not determine it. A missing package leaves the calculation unclosed; it does not by itself prove non-identifiability. A response-active difference proves non-identifiability of a protocol that detects it, and need not change every isotope, spin, transition, decay, or resonance observable.

*Proof.* Hold the transported elementary vector and all elementary Appendix T entries constant. Let $Q=Q^*$ preserve the registered particle numbers, exchange symmetry, one-particle masses, global charges, and current normalizations. For real $\eta$, $H_A+\eta Q$ is self-adjoint on the same finite Hilbert space. Assume that both $H_A$ and at least one such perturbation satisfy every accepted parent constraint and package-admission gate. If $Q$ is response-active within this admitted family, the definition of the PPI quotient gives an admitted protocol $P$ and an $\eta$ in the registered neighborhood for which
$$
P(H_A+\eta Q)\ne P(H_A).
$$
That changed response is a spectral value, a registered matrix element, or another protocol output included in the package. Thus the two admitted packages witness non-identifiability of that changed nuclear response from the accepted parent data. The same argument applies to a response-active change of $J_A^{\mathrm{spin}}$, a transition or decay operator, or $\Lambda_{A,\mathrm{out}}(E)$. Consequently the elementary vector alone does not determine those nuclear operator entries. ∎

**Theorem X.8k.6d (Classification of Response-Null Interiors).** Fix the boundary coordinate space, and let $\mathbb K\in\{\mathbb R,\mathbb C\}$ be the scalar field of the branch.

1. *Static Schur class.* For the block operators of Definition X.8k.1 with interior dimension $n_I$, the representatives with Schur response $\Lambda_\partial=\Lambda$ are exactly
$$
\mathfrak L_{A,B}
=
\begin{pmatrix}
\Lambda+B^*A^{-1}B & B^*\\
B & A
\end{pmatrix},
\qquad
A=A^*>0,
\quad
B:\mathbb K^{\partial N}\to\mathbb K^{I},
\tag{X.8k.6d.1}
$$
and $\mathfrak L_{A,B}\ge0$ holds exactly when $\Lambda\ge0$. Two such representatives with the same Schur response and the same boundary block $L_{\partial\partial}$ are related by a boundary-fixing congruence
$$
\mathfrak L'=S^*\mathfrak LS,
\qquad
S=I_{\partial}\oplus G,
\quad
G\in GL(n_I),
\tag{X.8k.6d.2}
$$
and every such congruence preserves both $\Lambda_\partial$ and $L_{\partial\partial}$. The interior Gram operator $L_{\partial I}L_{II}^{-1}L_{I\partial}$, which can be any positive semidefinite operator of rank at most $n_I$, is the complete invariant of the interior modulo (X.8k.6d.2), and every class contains a representative with $L_{II}=I$.

2. *Meromorphic impedance class.* Let $H_{\mathrm{conf}}$ and $H'_{\mathrm{conf}}$ satisfy Definition X.8k.5 on $\mathcal H_I\oplus\mathcal H_\partial$ and $\mathcal H'_I\oplus\mathcal H_\partial$, with $n=\dim\mathcal H_I$ and $n'=\dim\mathcal H'_I$. Define the boundary-controllable interior subspace
$$
\mathcal K_\partial
=
\sum_{k=0}^{n-1}\operatorname{ran}\bigl(H_{II}^kH_{I\partial}\bigr)
\subseteq\mathcal H_I,
\tag{X.8k.6d.3}
$$
and define $\mathcal K'_\partial$ in the same way. Then:

(a) $\mathcal K_\partial$ reduces $H_{II}$, and $\mathcal K_\partial^\perp\oplus0$ is the $H_{\mathrm{conf}}$-invariant subspace spanned by the eigenvectors of $H_{\mathrm{conf}}$ whose colorless boundary component vanishes;

(b) the following are equivalent: (i) $\Lambda_{\mathrm{QCD}}=\Lambda'_{\mathrm{QCD}}$ as meromorphic functions of $E$; (ii) $H_{\partial\partial}=H'_{\partial\partial}$ and
$$
H_{\partial I}H_{II}^kH_{I\partial}
=
H'_{\partial I}H'^{\,k}_{II}H'_{I\partial},
\qquad
0\le k\le n+n'-1;
\tag{X.8k.6d.4}
$$
(iii) $H_{\partial\partial}=H'_{\partial\partial}$ and there is a unitary $U:\mathcal K_\partial\to\mathcal K'_\partial$ with
$$
UH_{II}|_{\mathcal K_\partial}=H'_{II}|_{\mathcal K'_\partial}U,
\qquad
UH_{I\partial}=H'_{I\partial};
\tag{X.8k.6d.5}
$$

(c) the number
$$
r_\partial
=
\dim\mathcal K_\partial
=
\operatorname{rank}\bigl(H_{\partial I}H_{II}^{j+k}H_{I\partial}\bigr)_{j,k=0}^{n-1}
\tag{X.8k.6d.6}
$$
is the minimal interior dimension realizing $\Lambda_{\mathrm{QCD}}$; the representatives attaining it are exactly those with $\mathcal K_\partial=\mathcal H_I$, and any two of them are conjugate by a boundary-preserving unitary $U\oplus I_{\mathcal H_\partial}$;

(d) an interior modification preserves every colorless boundary protocol response exactly when it composes a unitary change of frame (X.8k.6d.5) on $\mathcal K_\partial$ with an arbitrary finite self-adjoint replacement, of any dimension, of the invisible block $H_{II}|_{\mathcal K_\partial^\perp}$.

Complete colorless impedance data therefore determine the confined interior up to these two response-null operations. On a comparison class whose members satisfy $\mathcal K_\partial=\mathcal H_I$ and whose PPI relation is equality of $\Lambda_{\mathrm{QCD}}$, PPI equivalence is exactly boundary-preserving unitary equivalence, which is the certificate entry named in Theorem X.8k.6b.

*Proof.* Item 1. In boundary-first block order,
$$
\mathfrak L_{A,B}
=
T^*(\Lambda\oplus A)T,
\qquad
T=
\begin{pmatrix}
I&0\\
A^{-1}B&I
\end{pmatrix},
$$
and $T$ is invertible. Hence $\mathfrak L_{A,B}\ge0$ exactly when $\Lambda\oplus A\ge0$, that is, when $\Lambda\ge0$, and (X.8k.2) applied to (X.8k.6d.1) returns $\Lambda$. Conversely, a representative with Schur response $\Lambda$ has the form (X.8k.6d.1) with $A=L_{II}$ and $B=L_{I\partial}$, because self-adjointness gives $L_{\partial I}=L_{I\partial}^*$. For $S=I_\partial\oplus G$, the blocks of $S^*\mathfrak LS$ are $L_{\partial\partial}$, $L_{\partial I}G$, $G^*L_{I\partial}$ and $G^*L_{II}G$, and $(L_{\partial I}G)(G^*L_{II}G)^{-1}(G^*L_{I\partial})=L_{\partial I}L_{II}^{-1}L_{I\partial}$, so both $\Lambda_\partial$ and $L_{\partial\partial}$ are preserved. Conversely, let two representatives have the same $\Lambda$ and the same $L_{\partial\partial}$, and put $C=L_{II}^{-1/2}L_{I\partial}$ and $C'=L_{II}'^{-1/2}L'_{I\partial}$. Then $C^*C=L_{\partial\partial}-\Lambda=C'^*C'$, so $\lVert Cx\rVert=\lVert C'x\rVert$ for every boundary vector $x$. The assignment $Cx\mapsto C'x$ is therefore a well-defined isometry of $\operatorname{ran}C$ onto $\operatorname{ran}C'$. Both ranges have dimension $\operatorname{rank}C^*C$, so any isometry between their orthogonal complements extends it to a unitary $Q$ with $QC=C'$. The operator $G=L_{II}^{-1/2}Q^*L_{II}'^{1/2}$ satisfies $G^*L_{II}G=L'_{II}$ and $G^*L_{I\partial}=L_{II}'^{1/2}QC=L'_{I\partial}$, which is (X.8k.6d.2). The Gram operator equals $C^*C$; it is invariant under (X.8k.6d.2), equality of Gram operators produced the congruence, and every positive semidefinite operator $M$ of rank at most $n_I$ equals $C^*C$ for some $C:\mathbb K^{\partial N}\to\mathbb K^{I}$, so that $(A,B)=(I,C)$ realizes it. Taking $G=L_{II}^{-1/2}$ gives the representative with $L_{II}=I$.

Item 2(a). The Cayley-Hamilton theorem expresses $H_{II}^n$ through lower powers, so $H_{II}\mathcal K_\partial\subseteq\mathcal K_\partial$. Since $H_{II}$ is self-adjoint, $\mathcal K_\partial^\perp$ is invariant as well, and $\mathcal K_\partial$ reduces $H_{II}$. Self-adjointness of $H_{\mathrm{conf}}$ gives $H_{\partial I}=H_{I\partial}^*$, and $\operatorname{ran}H_{I\partial}\subseteq\mathcal K_\partial$ gives $H_{\partial I}v=0$ for $v\in\mathcal K_\partial^\perp$. Hence $H_{\mathrm{conf}}(v\oplus0)=H_{II}v\oplus0$, so $\mathcal K_\partial^\perp\oplus0$ is invariant and is spanned by eigenvectors of $H_{II}|_{\mathcal K_\partial^\perp}$, each of which is an eigenvector of $H_{\mathrm{conf}}$ with zero boundary component. Conversely, if $H_{\mathrm{conf}}(u\oplus0)=E(u\oplus0)$, then $H_{II}u=Eu$ and $H_{\partial I}u=0$, so $\langle H_{II}^kH_{I\partial}x,u\rangle=E^k\langle x,H_{\partial I}u\rangle=0$ for every $k$ and every boundary vector $x$, and $u\in\mathcal K_\partial^\perp$.

Item 2(b). Write $F(E)=H_{\partial I}(H_{II}-E)^{-1}H_{I\partial}$, so that $\Lambda_{\mathrm{QCD}}(E)=H_{\partial\partial}-E-F(E)$. For $|E|>\lVert H_{II}\rVert$, the Neumann series gives
$$
F(E)
=
-\sum_{k\ge0}E^{-k-1}H_{\partial I}H_{II}^kH_{I\partial},
$$
so $F(E)\to0$ as $|E|\to\infty$. If (i) holds, then $H_{\partial\partial}=\lim_{|E|\to\infty}(\Lambda_{\mathrm{QCD}}(E)+E)$ agrees for the two operators, hence $F=F'$, and uniqueness of Laurent coefficients at infinity gives equality of all moments, in particular (ii). If (ii) holds, the adjugate formula makes $\det(E-H_{II})(H_{II}-E)^{-1}$ a matrix polynomial of degree at most $n-1$, so
$$
P(E)=\det(E-H_{II})\det(E-H'_{II})\bigl(F(E)-F'(E)\bigr)
$$
is a matrix polynomial of degree at most $n+n'-1$. Equality of the first $n+n'$ Laurent coefficients gives $F(E)-F'(E)=O(|E|^{-n-n'-1})$, hence $P(E)=O(|E|^{-1})$ and $P=0$. Thus $F=F'$ off the finitely many poles, and (i) holds. Under (i) all moments agree, so for every finitely supported family $(x_k)$ of boundary vectors
$$
\Bigl\lVert\sum_kH_{II}^kH_{I\partial}x_k\Bigr\rVert^2
=
\sum_{j,k}\bigl\langle x_j,H_{\partial I}H_{II}^{j+k}H_{I\partial}x_k\bigr\rangle
$$
has the same value for the primed operators. Therefore $U\bigl(\sum_kH_{II}^kH_{I\partial}x_k\bigr):=\sum_kH'^{\,k}_{II}H'_{I\partial}x_k$ is well defined, isometric and onto $\mathcal K'_\partial$, and its defining formula gives (X.8k.6d.5); this proves (iii). If (iii) holds, repeated use of the intertwining relation gives $H'^{\,k}_{II}H'_{I\partial}=UH_{II}^kH_{I\partial}$, and since $H_{II}^kH_{I\partial}$ takes values in $\mathcal K_\partial$, where $U$ is isometric,
$$
H'_{\partial I}H'^{\,k}_{II}H'_{I\partial}
=
(UH_{I\partial})^*UH_{II}^kH_{I\partial}
=
H_{\partial I}H_{II}^kH_{I\partial}
$$
for every $k$, which is (ii).

Item 2(c). By (iii), equal impedances have controllable subspaces of equal dimension, so $r_\partial$ is an invariant of $\Lambda_{\mathrm{QCD}}$ and $n\ge r_\partial$. The block Krylov map $\mathcal C=(H_{I\partial},H_{II}H_{I\partial},\ldots,H_{II}^{n-1}H_{I\partial})$ has range $\mathcal K_\partial$ and Gram matrix $\mathcal C^*\mathcal C=(H_{\partial I}H_{II}^{j+k}H_{I\partial})_{j,k}$, and $\operatorname{rank}\mathcal C^*\mathcal C=\operatorname{rank}\mathcal C$, which proves (X.8k.6d.6). The compressed operator with interior block $H_{II}|_{\mathcal K_\partial}$ and the same $H_{I\partial}$ and $H_{\partial\partial}$ has the same moments, hence the same impedance, and interior dimension $r_\partial$. A representative has interior dimension $r_\partial$ exactly when $\mathcal K_\partial=\mathcal H_I$. For two such representatives, $U$ in (iii) is a unitary $\mathcal H_I\to\mathcal H'_I$, and conjugation by $U\oplus I_{\mathcal H_\partial}$ carries $H_{\mathrm{conf}}$ to $H'_{\mathrm{conf}}$ block by block.

Item 2(d). Theorem X.8k.6, item 5, and the column argument in its proof identify preservation of every linear colorless boundary protocol response with equality of $\Lambda_{\mathrm{QCD}}$. By (iii), equality holds exactly when the controllable parts correspond through (X.8k.6d.5). Every moment in (X.8k.6d.4) is computed inside $\mathcal K_\partial$, so the invisible blocks enter no moment and may be replaced arbitrarily. ∎

**Resolution TV-X-13-R1 (Metadata).** Exact domain: the finite static Schur class of Definition X.8k.1 and the finite self-adjoint colorless impedance class of Definition X.8k.5, each over a fixed boundary coordinate space. Premises: $L_{II}>0$ and self-adjointness of $\mathfrak L$ for item 1; self-adjointness of $H_{\mathrm{conf}}$ for item 2. Equivalence: equality of $\Lambda_\partial$, together with equality of $L_{\partial\partial}$ for the congruence statement; equality of $\Lambda_{\mathrm{QCD}}$ as a meromorphic function of $E$. Budget: $n+n'$ moment blocks, one block Krylov rank and one Gram-operator comparison. Verifier: exact finite linear algebra over the branch field. Falsifier: an impedance-equal pair whose controllable parts are not unitarily conjugate, a moment-equal pair with unequal impedance, or a Schur-equal pair with equal boundary blocks and no interior congruence. Provenance class: source-internal finite mathematics. Downstream consumers: Theorem X.8k.2, Corollary X.8k.3, Theorems X.8k.6 and X.8k.6b, and `TV-X-13`. Nonvacuity: with one boundary coordinate, $H_{\partial\partial}=0$ and $H_{I\partial}=(1,0)^{\mathsf T}$, the interiors $H_{II}=\operatorname{diag}(1,5)$ and $H_{II}=\operatorname{diag}(1,7)$ both give $\Lambda_{\mathrm{QCD}}(E)=-E-(1-E)^{-1}$ and differ only in their invisible blocks, while the controllable interior $H_{II}=\begin{pmatrix}1&1\\1&t\end{pmatrix}$ gives $H_{\partial I}(H_{II}-E)^{-1}H_{I\partial}=(t-E)/\bigl((1-E)(t-E)-1\bigr)$, which changes with $t$. Theorem X.8k.6d gives `positive-discharge` of the response-null-interior classification component of `TV-X-13` on both finite classes, and the registered refutation pattern, two colorless-distinguishable interiors with identical complete impedance data, is excluded there. Instantiation of the PU boundary operator $\mathfrak L$ or $H_{\mathrm{conf}}$ from accepted protocol records (`C`) and its physical boundary-protocol realization (`R`) remain live under `TV-X-13`.

### X.8l Predictive Hodge Decomposition of Update Currents

**Definition X.8l.1 (Finite Predictive Hodge Datum).** Let
$$
C^0\xrightarrow{d_0}C^1\xrightarrow{d_1}C^2
$$
be a finite weighted cochain complex of MPU update variables, with positive inner products on each $C^k$. Let $\delta_k:C^{k+1}\to C^k$ be the adjoint of $d_k$. The degree-one predictive Laplacian is
$$
\Delta_1=d_0\delta_0+\delta_1d_1
$$
on $C^1$.

**Theorem X.8l.2 (Finite Predictive Hodge Decomposition).** Every update current $J\in C^1$ has a unique orthogonal decomposition
$$
J=d_0\phi+\delta_1\psi+h,
\tag{X.8l.1}
$$
where
$$
d_0\phi\in\operatorname{im}d_0,
\qquad
\delta_1\psi\in\operatorname{im}\delta_1,
\qquad
h\in\ker\Delta_1.
$$
Moreover,
$$
\ker\Delta_1=\ker\delta_0\cap\ker d_1
$$
and is naturally isomorphic to the first cohomology
$$
H^1=\ker d_1/\operatorname{im}d_0.
$$

*Proof.* Because the spaces are finite-dimensional with positive inner products,
$$
(\operatorname{im}d_0)^\perp=\ker\delta_0,
\qquad
(\operatorname{im}\delta_1)^\perp=\ker d_1.
$$
Also
$$
\operatorname{im}d_0\perp\operatorname{im}\delta_1
$$
because
$$
\langle d_0\phi,\delta_1\psi\rangle
=
\langle d_1d_0\phi,\psi\rangle
=
0.
$$
Finite-dimensional linear algebra gives
$$
C^1=
\operatorname{im}d_0
\oplus
\operatorname{im}\delta_1
\oplus
(\operatorname{im}d_0\oplus\operatorname{im}\delta_1)^\perp.
$$
The final orthogonal complement is
$$
\ker\delta_0\cap\ker d_1.
$$
For any $u\in C^1$,
$$
\langle u,\Delta_1u\rangle
=
\lVert\delta_0u\rVert^2+\lVert d_1u\rVert^2,
$$
so $\Delta_1u=0$ if and only if $\delta_0u=0$ and $d_1u=0$. Hence the harmonic subspace is $\ker\delta_0\cap\ker d_1$.

Every cohomology class in $\ker d_1/\operatorname{im}d_0$ has a unique representative orthogonal to $\operatorname{im}d_0$, because projecting away the exact component leaves a vector in $\ker d_1\cap\ker\delta_0$. Thus $\ker\Delta_1\cong H^1$. ∎

**Corollary X.8l.3 (Dissipation, Circulation, and Ledger Memory).** In (X.8l.1), the exact, coexact, and harmonic components are the three orthogonal summands of Theorem X.8l.2. Modulo the exact and coexact subspaces, the remaining component is the harmonic representative. Interpreting these summands as dissipative update, circulation, and persistent memory requires a specified evolution that realizes those roles; the Hodge decomposition alone is a kinematic statement.

*Proof.* Exact components lie in $\operatorname{im}d_0$ and vanish in cohomology. Coexact components are orthogonal response circulations. Theorem X.8l.2 identifies the quotient-invariant residue with the harmonic representative of $H^1$. ∎

**Proposition X.8l.4 (Hodge-Role Evolutions).** Let a finite predictive Hodge datum of Definition X.8l.1 be given over $\mathbb K\in\{\mathbb R,\mathbb C\}$, let $P_{\mathrm{ex}}$, $P_{\mathrm{co}}$ and $P_{\mathrm H}$ be the orthogonal projections onto $\operatorname{im}d_0$, $\operatorname{im}\delta_1$ and $\ker\Delta_1$, and consider linear evolutions $\dot J=XJ$ on $C^1$. Call $X$ Hodge-compatible when it commutes with the three projections. Say that $X$ realizes the memory role when $P_{\mathrm H}J(t)$ is constant along every solution; the dissipation role when $\frac{d}{dt}\lVert P_{\mathrm{ex}}J\rVert^2<0$ whenever $P_{\mathrm{ex}}J\ne0$; and the circulation role when $\lVert P_{\mathrm{co}}J(t)\rVert$ is constant along every solution and $XJ\ne0$ for every nonzero coexact current $J$. Then:

1. A Hodge-compatible $X$ realizes the three roles exactly when
$$
X=d_0A\delta_0+\delta_1Bd_1
\tag{X.8l.4.1}
$$
for operators $A$ on $C^0$ and $B$ on $C^2$ such that $X_{\mathrm{ex}}=X|_{\operatorname{im}d_0}$ has negative definite Hermitian part and $X_{\mathrm{co}}=X|_{\operatorname{im}\delta_1}$ is skew-adjoint and invertible. Every operator on $\operatorname{im}d_0$ and every operator on $\operatorname{im}\delta_1$ occurs as a block of (X.8l.4.1).

2. A Hodge-compatible role-realizing evolution exists for every datum over $\mathbb C$. Over $\mathbb R$ it exists exactly when $\operatorname{rank}d_1$ is even; when $\operatorname{rank}d_1$ is odd, every norm-preserving real linear evolution of $\operatorname{im}\delta_1$ has a nonzero stationary coexact current.

3. For $\gamma>0$ and a skew-adjoint $\Theta$ on $C^2$ for which $\delta_1\Theta d_1$ is invertible on $\operatorname{im}\delta_1$, the evolution
$$
\dot J=-\gamma d_0\delta_0J+\delta_1\Theta d_1J
\tag{X.8l.4.2}
$$
realizes the three roles, with
$$
J(t)=e^{-\gamma td_0\delta_0}P_{\mathrm{ex}}J(0)+e^{t\delta_1\Theta d_1}P_{\mathrm{co}}J(0)+P_{\mathrm H}J(0),
\qquad
\frac{d}{dt}\tfrac12\lVert J\rVert^2=-\gamma\lVert\delta_0J\rVert^2,
$$
and $\lVert P_{\mathrm{ex}}J(t)\rVert\le e^{-\gamma\lambda_1t}\lVert P_{\mathrm{ex}}J(0)\rVert$, where $\lambda_1$ is the least positive eigenvalue of $\delta_0d_0$.

4. Along every evolution whose increments lie in $\operatorname{im}d_0\oplus\operatorname{im}\delta_1$, $P_{\mathrm H}J$ is conserved, and the currents reachable from $J_0$ by such increments are exactly those with $P_{\mathrm H}J=P_{\mathrm H}J_0$. The harmonic representative, equivalently the class in $H^1$ of a closed current, is therefore the complete invariant of vertex-potential and face-circulation updates.

5. A Hodge-compatible generator with real spectrum, in particular a Hodge-compatible generator on $C^1$ of the form (X.9.6d.1.1), realizes the circulation role only when $\operatorname{im}\delta_1=0$; nontrivial circulation requires a skew-adjoint component with nonzero imaginary spectrum.

*Proof.* Item 1. For Hodge-compatible $X$, $P_{\mathrm H}J(t)=e^{tX|_{\ker\Delta_1}}P_{\mathrm H}J(0)$, which is constant for all initial data exactly when $X$ vanishes on $\ker\Delta_1$. Since $\ker\delta_0=(\operatorname{im}d_0)^\perp$ and $\ker d_0=(\operatorname{im}\delta_0)^\perp$, the maps $\delta_0:\operatorname{im}d_0\to\operatorname{im}\delta_0$ and $d_0:\operatorname{im}\delta_0\to\operatorname{im}d_0$ are bijections; for an operator $T$ on $\operatorname{im}d_0$, the operator $A$ equal to $(d_0|_{\operatorname{im}\delta_0})^{-1}T(\delta_0|_{\operatorname{im}d_0})^{-1}$ on $\operatorname{im}\delta_0$ and to $0$ on $\ker d_0$ satisfies $d_0A\delta_0=TP_{\mathrm{ex}}$. The same argument with $d_1:\operatorname{im}\delta_1\to\operatorname{im}d_1$ and $\delta_1:\operatorname{im}d_1\to\operatorname{im}\delta_1$ represents every operator on $\operatorname{im}\delta_1$ as $\delta_1Bd_1$. Conversely, $d_0A\delta_0$ takes values in $\operatorname{im}d_0$ and vanishes on $\ker\delta_0\supseteq\operatorname{im}\delta_1\oplus\ker\Delta_1$, and $\delta_1Bd_1$ takes values in $\operatorname{im}\delta_1$ and vanishes on $\ker d_1\supseteq\operatorname{im}d_0\oplus\ker\Delta_1$, so (X.8l.4.1) is Hodge-compatible with zero harmonic block. For Hodge-compatible $X$, $\frac{d}{dt}\lVert P_{\mathrm{ex}}J\rVert^2=2\operatorname{Re}\langle P_{\mathrm{ex}}J,X_{\mathrm{ex}}P_{\mathrm{ex}}J\rangle$, which is negative for every nonzero exact component exactly when the Hermitian part of $X_{\mathrm{ex}}$ is negative definite. The coexact norm is constant along every solution exactly when $\operatorname{Re}\langle y,X_{\mathrm{co}}y\rangle=0$ for every coexact $y$, that is, when $X_{\mathrm{co}}$ is skew-adjoint, and nonstationarity of every nonzero coexact current is injectivity, equivalently invertibility, of $X_{\mathrm{co}}$.

Item 2. The dissipation block $X_{\mathrm{ex}}=-I$ and the zero harmonic block are always available, and $\dim\operatorname{im}\delta_1=\operatorname{rank}d_1$. Over $\mathbb C$, $X_{\mathrm{co}}=i\omega I$ with $\omega\ne0$ is skew-adjoint and invertible. Over $\mathbb R$, a skew-symmetric matrix of odd order $n$ satisfies $\det X_{\mathrm{co}}=\det X_{\mathrm{co}}^{\mathsf T}=(-1)^n\det X_{\mathrm{co}}=-\det X_{\mathrm{co}}$, so it is singular and has a nonzero kernel vector; for even order, the orthogonal direct sum of blocks $\begin{pmatrix}0&-1\\1&0\end{pmatrix}$ in an orthonormal basis is skew-symmetric and invertible.

Item 3. The operator $d_0\delta_0$ is self-adjoint and nonnegative, vanishes on $\ker\delta_0$, and is positive definite on $\operatorname{im}d_0$, where its eigenvalues are the positive eigenvalues of $\delta_0d_0$; hence $-\gamma d_0\delta_0$ is a negative definite block with $\lVert e^{-\gamma td_0\delta_0}y\rVert\le e^{-\gamma\lambda_1t}\lVert y\rVert$ for $y\in\operatorname{im}d_0$. The operator $\delta_1\Theta d_1$ is skew-adjoint because $(\delta_1\Theta d_1)^*=\delta_1\Theta^*d_1=-\delta_1\Theta d_1$, and it is invertible on $\operatorname{im}\delta_1$ by hypothesis, so item 1 applies. The two blocks act on orthogonal invariant summands and the harmonic block vanishes, which gives the displayed solution. Finally, $\operatorname{Re}\langle J,XJ\rangle=-\gamma\lVert\delta_0J\rVert^2+\operatorname{Re}\langle d_1J,\Theta d_1J\rangle=-\gamma\lVert\delta_0J\rVert^2$.

Item 4. By Theorem X.8l.2, $\operatorname{im}d_0\oplus\operatorname{im}\delta_1=(\ker\Delta_1)^\perp$, so such increments leave $P_{\mathrm H}J$ unchanged, and a current with $P_{\mathrm H}J=P_{\mathrm H}J_0$ differs from $J_0$ by one element of $(\ker\Delta_1)^\perp$. For $d_1J=0$, the harmonic representative corresponds to $[J]\in H^1$ by Theorem X.8l.2.

Item 5. The spectrum of the invariant block $X_{\mathrm{co}}$ lies in the spectrum of $X$, hence is real, while a skew-adjoint operator is normal with purely imaginary spectrum. A skew-adjoint $X_{\mathrm{co}}$ with real spectrum therefore has spectrum $\{0\}$ and, being normal, vanishes; it is invertible only on the zero space. Generators of the form (X.9.6d.1.1) have real spectrum by Corollary X.9.6d.1. ∎

**Resolution TV-X-14-R1 (Metadata).** Exact domain: finite predictive Hodge data of Definition X.8l.1 over $\mathbb R$ or $\mathbb C$ and linear evolutions on $C^1$, with the memory, dissipation and circulation roles defined in Proposition X.8l.4. Premises: positive inner products and the Hodge decomposition of Theorem X.8l.2. Equivalence: equality of generators and of Hodge components. Budget: three orthogonal projections, one block decomposition and one parity test of $\operatorname{rank}d_1$. Verifier: exact finite linear algebra. Falsifier: a Hodge-compatible role-realizing generator outside (X.8l.4.1) or violating its sign conditions, an invertible real skew-symmetric coexact block of odd order, or a current reachable by exact and coexact increments with a different harmonic projection. Provenance class: source-internal finite mathematics. Downstream consumers: Definition X.8l.1, Theorem X.8l.2, Corollary X.8l.3, item 5 of Corollary X.9.6d, Corollary X.9.6d.1 and `TV-X-14`. Nonvacuity: the complex with vertices $1,\ldots,5$, edges $12,13,23,24,34,35,45$ and filled triangles $123$ and $234$ has exact, coexact and harmonic dimensions $4$, $2$ and $1$, and (X.8l.4.2) with $\gamma>0$ and $\Theta=\begin{pmatrix}0&1\\-1&0\end{pmatrix}$ realizes all three roles; a complex with a single filled triangle has a one-dimensional real coexact space and admits no Hodge-compatible real circulation role. Proposition X.8l.4 classifies the Hodge-compatible role-realizing evolutions on every finite Hodge datum and gives `positive-discharge` of the evolution-construction component of `TV-X-14` on every complex datum and every real datum with even $\operatorname{rank}d_1$; on real data with odd $\operatorname{rank}d_1$ it proves that no Hodge-compatible evolution realizes the circulation role. It also proves that the harmonic representative is the complete memory invariant. Population of the physical protocol complex, its inner products and the response-faithful current map with complete source ownership (`C`), and the physical realization of a role-realizing evolution on that complex (`R`), remain live under `TV-X-14`.

## X.9 Dualities as PCE-Cost Degeneracies

Dualities enter PU as *operational redundancies*: distinct descriptive formalisms that yield the same predictive content for the same Minimal Predictive Unit (MPU), with the declared readout correspondence and MPU constraints. Operationally equivalent descriptions are cost-degenerate when the complete objective of Definition D.1, including its implementation, energy, and other charged resource costs, descends to their response-equivalence class. They form degenerate minima only when that class also attains the minimum on the admitted candidate domain. Proposition X.9.3 supplies proxy invariance for its specified reparameterizations.

### X.9.1 Operational Description Classes

To formalize duality, we first specify the mathematical structure of a "description" at MPU resolution.

**Definition X.9.0 (Predictive Description Tuple).**
A **predictive description** $\mathcal{D}$ at MPU resolution $(d_0, \varepsilon, \tau_{min})$ consists of a quadruple $\mathcal{D} = (\mathcal{M}, \mathcal{S}_E, \delta, \mathcal{P})$ where:
1. $\mathcal{M}$ is a coarse-grained model class (field content, degrees of freedom),
2. $\mathcal{S}_E$ is an effective action/likelihood family on $\mathcal{M}$,
3. $\delta > 0$ is the MPU coarse-graining scale (mean microscopic MPU spacing) held fixed when comparing descriptions at a given MPU resolution (Definition 35; Appendix E),
4. $\mathcal{P}$ is a measurement/inference protocol specifying how observables $O \in \mathcal{O}$ yield outcome distributions over a measurable outcome space $\Omega_O$.

*Remark: Resolution Identification.* The coarse-graining scale $\delta$ is used both as mean microscopic spacing and as the adopted finest readout binning. This is a branch identification, not a consequence of Theorem 29. Any relation to a positive cycle duration requires a separately registered operational clock and scale map.


**Definition X.9.1 (MPU-Equivalent Descriptions).**
Let $\mathcal{O}$ denote the set of operational observables admissible at MPU resolution, let $\mathcal{C}$ denote the admissible contexts (constraints, preparations, boundary data), and for each $O \in \mathcal{O}$ let $\Omega_O$ denote the outcome space of $O$ equipped with a $\sigma$-algebra. Let $G_\delta: \Omega_O \to \Omega_O^{(\delta)}$ denote the coarse-graining map that bins outcomes at resolution $\delta$.

Two descriptions $\mathcal{D}_1, \mathcal{D}_2$ are **MPU-equivalent** if and only if there exists a family of bimeasurable bijections (measurable with measurable inverses) $\{\sigma_O\}_{O \in \mathcal{O}}$ with $\sigma_O:\Omega_O^{(\delta)} \to \Omega_O^{(\delta)}$ such that, for all observables $O \in \mathcal{O}$, all contexts $c \in \mathcal{C}$, and all measurable outcome events $E \subseteq \Omega_O^{(\delta)}$:
$$
p_{\mathcal{D}_2}(E \mid O, c) = p_{\mathcal{D}_1}(\sigma_O^{-1}(E) \mid O, c).
$$
where $p_{\mathcal{D}}(\cdot \mid O, c)$ denotes the probability measure on coarse-grained outcomes induced by description $\mathcal{D}$ when observable $O$ is measured in context $c$. When the coarse-grained readout labels are already aligned, one may take $\sigma_O=\mathrm{id}$ for all $O$.

Equivalently, let $\mu_{\mathcal{D}}^{O,c}$ denote the probability measure on $\Omega_O$ induced by applying the protocol $\mathcal{P}$ of description $\mathcal{D}$ to measure $O$ in context $c$. Then
$$
p_{\mathcal{D}}(\cdot \mid O, c) = (G_\delta)_\# \mu_{\mathcal{D}}^{O,c},
$$
and MPU-equivalence is the condition
$$
(G_\delta)_\# \mu_{\mathcal{D}_2}^{O,c} = (\sigma_O)_\# (G_\delta)_\# \mu_{\mathcal{D}_1}^{O,c}
\quad\text{for all }(O,c).
$$

**Definition X.9.2 (PCE-Duality).**
A **PCE-duality** between $\mathcal{D}_1$ and $\mathcal{D}_2$ is an MPU-equivalence (Definition X.9.1) that is not a trivial relabeling.

A **trivial relabeling** is a pair $\sigma = (\sigma_{int}, \{\sigma_O\}_{O \in \mathcal{O}})$ where:
- $\sigma_{int}$ is a bijection acting only on primitive internal labels (field-component indices, source-component labels) used to present $\mathcal{M}$ and $\mathcal{S}_E$, and
- for each observable $O \in \mathcal{O}$, $\sigma_O: \Omega_O^{(\delta)} \to \Omega_O^{(\delta)}$ is a bimeasurable bijection acting only on coarse-grained readout labels,

such that the description tuple components (Definition X.9.0) are unchanged except for this label substitution:
- $\mathcal{M}$ and $\mathcal{S}_E$ are the same up to $\sigma_{int}$,
- the coarse-graining scale $\delta$ is identical,
- the measurement protocol $\mathcal{P}$ is identical up to applying $\sigma_O$ to readout values.

The induced coarse-grained outcome measures then differ only by pushforward:
$$
p_{\mathcal{D}_2}(E \mid O, c) = p_{\mathcal{D}_1}(\sigma_O^{-1}(E) \mid O, c)
$$
for all observables $O \in \mathcal{O}$, contexts $c \in \mathcal{C}$, and measurable $E \subseteq \Omega_O^{(\delta)}$. The set of all trivial relabelings forms a group under composition, acting on the space of predictive descriptions by
$$
\sigma \cdot (\mathcal{M},\mathcal{S}_E,\delta,\mathcal{P}) := (\sigma_{int}\mathcal{M},\sigma_{int}\mathcal{S}_E,\delta,\sigma\mathcal{P}),
\qquad
(\sigma\mathcal{P})_O := \sigma_O \circ \mathcal{P}_O,
$$
with group law $(\sigma\circ \tau)_{int}=\sigma_{int}\circ\tau_{int}$ and $(\sigma\circ\tau)_O=\sigma_O\circ\tau_O$.


A **duality** is an MPU-equivalence for which no such $\sigma$ exists. Equivalently, duality is a nontrivial change of descriptive chart (variables, auxiliary representation, bulk-boundary parameterization) that preserves the full operational predictive content at fixed MPU resolution.

*Remark: Scope of Trivial Relabeling.* This definition restricts trivial relabeling to outcome-label and internal-label bijections that preserve the identity of observables and contexts. Transformations mapping observables to different observables (e.g., $F_{\mu\nu} \leftrightarrow {}^\star F_{\mu\nu}$) or transforming the context space are classified as nontrivial dualities by this definition, even when they might be considered changes of variables in other frameworks.

### X.9.2 Why PCE Produces Degeneracy Along Duality Orbits

Definition D.1 includes operational and propagation costs, predictive benefit, and penalty terms; Equation (D.0) supplies a stochastic dynamics driven by that potential. The effective-action proxy built from $W_k[J]$ and $\Gamma_k[\Phi]$ is invariant under the reparameterizations of Proposition X.9.3. Extending that invariance to complete PCE cost requires every charged entry to descend to the same operational equivalence class.

**Proposition X.9.3 (Reparameterization Invariance of the Natural-Gradient Proxy).**
Work at fixed RG scale $k$ with the regulated generating functional $W_k[J]$ and effective average action $\Gamma_k$ of Appendix X, so that the Legendre duality (Appendix X, Equation X.2) is well-defined on the operational source domain.

Suppose two descriptions $\mathcal{D}_1, \mathcal{D}_2$ are related by an invertible change of variables in the regulated functional integral (field redefinition and/or auxiliary-field introduction/elimination) that:
1. preserves the operational operator insertions $\{\mathcal{O}_a\}$ up to MPU-trivial relabeling (Definition X.9.2), and
2. has a functional Jacobian whose contribution is independent of the sources $J$ and either (i) is field-independent (so it factors as an overall constant), or (ii) can be absorbed into $\mathcal{S}_E$ as a $J$-independent counterterm already permitted by the symmetry/renormalization conditions defining the description class.


Then $W_k[J]$ agrees up to a source-independent additive constant, and all positive-order connected correlators of operational observables coincide between $\mathcal{D}_1$ and $\mathcal{D}_2$. Consequently:
1. $\mathcal{D}_1$ and $\mathcal{D}_2$ are MPU-equivalent (Definition X.9.1), and
2. under the conditions of Proposition X.1—specifically, when the coarse-grained family $p_\theta$ satisfies local asymptotic normality (LAN)—the connected two-point kernel $\mathcal{G}_{ab}(x,y)=\delta^2W_k/\delta J^a(x)\delta J^b(y)$ serves as the Fisher information metric, and any natural-gradient flow built from $\mathcal G$ [Amari 1998] is invariant under reparameterization. For dependent MPU records, this conclusion applies only on branches that separately verify differentiability in quadratic mean at the parameter point, a finite nonsingular Fisher information matrix, the required score moments, and a central-limit theorem for the normalized score under stated quantitative mixing conditions. Mixing or ergodicity alone is not a LAN certificate. Under those hypotheses, a PCE-effective proxy constructed from $(W_k,\mathcal G,\Gamma_k)$ cannot distinguish $\mathcal D_1$ and $\mathcal D_2$ within an MPU-equivalence class.

*Proof.* By condition (2), the change of variables maps the regulated partition functional to
$$
Z_k^{(\mathcal{D}_2)}[J] = \mathcal{J}\, Z_k^{(\mathcal{D}_1)}[J],
$$
with $\mathcal{J}$ independent of $J$ (either because the Jacobian is field-independent, or after absorbing any $J$-independent local Jacobian term into $\mathcal{S}_E$ as permitted counterterms). Therefore:
$$
W_k^{(\mathcal{D}_2)}[J] = \ln Z_k^{(\mathcal{D}_2)}[J] = \ln(\mathcal{J} \cdot Z_k^{(\mathcal{D}_1)}[J]) = W_k^{(\mathcal{D}_1)}[J] + \ln \mathcal{J}
$$
Since $\ln \mathcal{J}$ is independent of $J$, all functional derivatives $\delta^n W_k / \delta J^{a_1} \cdots \delta J^{a_n}$ coincide. In particular, the connected correlators and the two-point kernel $\mathcal{G}$ are identical.


By Appendix X (Equation X.2) and the regulated definition of $\Gamma_k$ in Section X.2, the effective average action is defined by the modified Legendre transform
$$
\Gamma_k[\Phi] := \sup_J \left\{ \int J^a \Phi_a - W_k[J] \right\} - \frac{1}{2}\int \Phi_a R_k^{ab} \Phi_b,
$$
with the same regulator kernel $R_k$ in both charts; since $W_k$ differs only by a constant, $\Gamma_k$ is defined consistently for both charts (up to an irrelevant additive constant).


Under the LAN/exponential-family conditions of Proposition X.1, $\mathcal{G}$ coincides with the Fisher information metric on the statistical manifold of coarse-grained distributions. Natural-gradient flow $\dot{\theta}^i = -\mathcal{G}^{ij}(\theta) \partial_j V$ is coordinate-invariant on this manifold [Amari 1998]: under coordinate change $\theta \mapsto \tilde{\theta}(\theta)$, the metric transforms as a $(0,2)$-tensor while its inverse transforms contravariantly, ensuring $\mathcal{G}^{ij} \partial_j V$ transforms as a vector field. Thus a proxy PCE objective expressed through these objects is degenerate on reparameterization-related charts. ∎

*Remark: Anomalies.* Field redefinitions can induce Jacobian terms that are independent of $J$ but not absorbable into the permitted counterterm class while preserving the operational symmetry constraints (e.g., chiral anomalies). Such transformations are excluded by condition (2) and do not generate PCE-dualities.

**Corollary X.9.3a (Duality Orbits as PCE Flat Directions).** Let $\mathcal Y$ be a smooth finite-resolution description manifold on which a group $G_{\mathrm{dual}}$ acts by PCE-dualities in the sense of Definition X.9.2 and Proposition X.9.3. Let
$$
\pi:\mathcal Y\to \mathcal Y/G_{\mathrm{dual}}
$$
be the quotient map onto operational response classes. If a PCE proxy descends to the quotient,
$$
V_{\mathrm{PCE}}=\bar V_{\mathrm{PCE}}\circ\pi,
$$
then every tangent vector $v$ tangent to a duality orbit satisfies
$$
dV_{\mathrm{PCE}}(v)=0.
$$
If $y_*$ is a critical point of $V_{\mathrm{PCE}}$, then the second variation along any smooth duality-orbit curve $\gamma(t)$ with $\gamma(0)=y_*$ is also zero:
$$
\frac{d^2}{dt^2}V_{\mathrm{PCE}}(\gamma(t))\Big|_{t=0}=0.
$$
Thus duality-related descriptions are flat directions of the PCE description space, not competing physical branches.

*Proof.* If $v$ is tangent to a $G_{\mathrm{dual}}$-orbit, then $d\pi(v)=0$. Since $V_{\mathrm{PCE}}=\bar V_{\mathrm{PCE}}\circ\pi$,
$$
dV_{\mathrm{PCE}}(v)
=
d\bar V_{\mathrm{PCE}}(d\pi(v))
=
d\bar V_{\mathrm{PCE}}(0)
=
0.
$$
For any smooth orbit curve $\gamma(t)$, $\pi(\gamma(t))$ is constant, so $V_{\mathrm{PCE}}(\gamma(t))$ is constant. Its first and second derivatives vanish. At a critical point this identifies the orbit directions as Hessian-null directions of the descended PCE proxy. ∎

On branches that independently carry the $U(8)/(U(2)\times U(6))$ orbit certificate of Theorem Z.6.3a and the predictive-recovery MacWilliams Golay certificates of Theorems Z.13 and Z.13b, the syndrome identity of Theorem Z.13a, and the native Leech-rootlessness classification of Theorem Z.8c, the retained structures carry the certified stabilizer symmetries. The size of an orbit of descriptive charts additionally depends on the acting transformation group and its action; a larger stabilizer alone does not establish a larger orbit or an MPU-equivalence between distinct charts.

### X.9.3 Canonical Examples in PU Terms

**(i) Electric–Magnetic Duality as an Operational Symmetry.**
In vacuum Maxwell theory, $dF = 0$ and $d{}^\star F = 0$ are invariant under the $SO(2)$ duality rotations [Deser & Teitelboim 1976]:
$$
F \mapsto F\cos\theta + {}^\star F\sin\theta,
\qquad
{}^\star F \mapsto {}^\star F\cos\theta - F\sin\theta.
$$
With sources, $d{}^\star F = J_e$ and $dF = J_m$, so duality mixes the source doublet $(J_e, J_m)$; therefore duality is an operational symmetry only in (i) source-free sectors, or (ii) sectors with both electric and magnetic sources included and transformed covariantly, together with duality-compatible boundary conditions.

Operationally, "duality-symmetric sector" means the MPU-accessible observable set $\mathcal{O}$ is closed under the duality action (e.g., built from duality-invariant combinations such as the stress-energy tensor and correlators of $F_{\mu\nu}$ packaged in $SO(2)$-covariant form), and the imposed sources/boundary data do not select an electric or magnetic chart.

On the unit Predictive-Ward branch of Theorem X.3 and Theorem Z.14, $\kappa^*_{\mathrm{bulk}}=1$ supplies the bulk quadratic gauge normalization. An electric/magnetic transformation is an MPU-equivalence under Definition X.9.1 only after a declared protocol correspondence identifies its complete response distributions, including sources and boundary conditions; closure of the observable set under rotations does not establish that equality. Complete PCE degeneracy additionally requires equality of all charged resource entries or cost descent to that equivalence class. Definition X.9.2 then determines whether the equivalence is a nontrivial duality.

**(ii) Bulk–Boundary Equivalence from Capacity Saturation (Operational Holography).**
Conditional on Theorem 43's verified strict-comparator geometric-regularity branch, Appendix E derives an area-law boundary budget from the reset-support capacity deficit of Proposition E.2a, with effective channel count scaling as area on Theorem E.3's density-certificate branch. Refresh/minorization branches add strict contractivity when mixing or fidelity decay is needed. At saturation, boundary encoding becomes a PCE minimum only on Theorem E.8.3.2's declared comparison branch.

For bulk and boundary descriptions to be MPU-equivalent (Definition X.9.1), capacity saturation alone is insufficient; one additionally requires a compatible reconstruction map preserving operational distributions. Theorem E.8.2 supplies the capacity-compatible non-AdS boundary-reconstruction gate, while Definition E.8.1b and Theorem E.8.1c supply exact retained-response reconstruction on Petz-sufficient nested encoding branches. Under these reconstruction conditions, a bulk geometric description and a boundary channel description are MPU-equivalent for exterior observables; this is the PU form of finite-response holographic equivalence [Susskind 1995; Bousso 2002]. The duality arises because capacity saturation together with Petz-sufficient reconstruction implies both descriptions yield identical outcome distributions for all retained exterior measurements at the coarse-graining scale $\delta$.

**(iii) Strong/Weak "Duality" as Scheme/Variable Degeneracy at a Fixed Attractor.**
PU does not treat the bare coupling as a freely tunable parameter at the attractor: capacity saturation fixes $u$ through (X.11). Explicitly,
$$
M\ln(1 + \lambda u^*) = \ln d_0 \quad\text{(Equation X.11)}.
$$
At the PCE-Attractor one has $M = 24$ (Theorem Z.5), $d_0 = 8$ on the minimal branch (Theorem Z.2; Theorem 23 gives the lower bound), and the flat QFI spectrum gives $\lambda = 1$ (Theorem Z.5, Step 5). Therefore:
$$
\ln(1 + u^*) = \frac{\ln 8}{24} = \frac{3\ln 2}{24} = \frac{\ln 2}{8},
\qquad
u^* = 2^{1/8} - 1 \approx 0.09051,
$$
agreeing with Theorem Z.7.

**Duality-fixed Thomson-limit electromagnetic coupling.**
In the effective-action bridge (Appendix X), the $U(1)$ gauge normalization is tracked by $\kappa$ through
$$
e^2 = \frac{u}{\kappa},
\qquad
\alpha_{em} := \frac{e^2}{4\pi} = \frac{u}{4\pi\,\kappa}.
$$
At the PCE-Attractor on the unit Predictive-Ward branch, Theorem X.3 fixes $\kappa^*_{\mathrm{bulk}}=1$. Combined with the PCE-duality principle of Section X.9, the bulk chart on that branch yields the duality-symmetric baseline
$$
\alpha_{em,\mathrm{bulk}}^{-1} = \frac{4\pi\kappa^*_{\mathrm{bulk}}}{u^*} = \frac{4\pi}{u^*}.
$$
Operationally, $\alpha_{em}$ is not read off from a bulk chart but inferred from boundary-accessible channel observables, so one must match the bulk normalization to the discrete MPU interface. The active fraction contributing to gauge readout is determined by the attractor-saturating Landauer partition $a=2$ inside $d_0=8$ on the minimal PCE branch, i.e. $a/d_0=1/4$ (Theorem Z.1; Theorem Z.2). Theorem 15 gives $K_0=3$ bits on its (O1)–(O3), (FC) register class. Using that numerical value in the Bures/interface response factor is the separate normalization branch used in Theorem Z.17. On the combined Appendix Z interface-normalization branch — comprising the bulk Predictive-Ward unit-normalization branch of Theorem Z.14, the canonical first-order interface-derivative branch of Theorem Z.17, and the independent democratic visible-response branch $L_{\mathrm{vis}}=1/(ad_0)$ of Theorem Z.24 — the duality-compatible interface dressing of the gauge normalization is:
$$
\delta\kappa := \kappa_{\mathrm{eff}} - \kappa^*_{\mathrm{bulk}}
= -\frac{a}{d_0}\frac{u^*}{\sqrt{K_0}} + O((u^*)^2)
= -\frac{u^*}{4\sqrt{3}} + O((u^*)^2).
$$
Thus, to first nontrivial order, on the same combined Appendix Z branch package,
$$
\alpha_{em}^{-1} = \frac{4\pi\kappa_{\mathrm{eff}}}{u^*}
= \frac{4\pi}{u^*} - \frac{\pi}{\sqrt{K_0}} + O(u^*).
$$
Carrying the next curvature-controlled term from the same interface functional (Theorems Z.24-Z.26), on the canonical separable second-order curvature-response branch (Theorem Z.25) in addition to the named branches, gives the Thomson-limit core
$$
\alpha_{em,0}^{-1} =
\frac{4\pi}{u^*}
-\frac{\pi}{\sqrt{K_0}}
+\frac{\pi u^*}{24\sqrt{K_0}}\operatorname{sinc}(u^*).
$$
With $u^*=2^{1/8}-1$ and $K_0=3$,
$$
\alpha_{em,0}^{-1}=137.03609205522863\ldots .
$$
The certificate-complete comparison row is
$$
\alpha^{-1}_{\mathrm{cert}}=\alpha^{-1}_{0}+R_\alpha.
$$
The Section Z.27.9 budget is a branch comparison budget before residual closure; theorem-level interval status requires the residual gate of Definition Z.27.11a and Theorem Z.27.11j.1.

Consequently, a literal map $u \mapsto 1/u$ is *not* a symmetry of the saturated constraint surface: the attractor selects a unique operational coupling $u^* = 2^{1/8} - 1$, and transformations that would map to $1/u^* \approx 11.05$ violate the capacity constraint (X.11). What can be dual are *descriptions*: distinct field variables or auxiliary-field representations (Appendix X) that represent the same effective $W_k[J]$ and the same operational correlators at the fixed-point physics. In this sense, "strong vs. weak" can be a coordinate artifact of the chosen effective variables, while the operational predictions remain locked to the same PCE optimum.


### X.9.4 Duality Discovery as a Constrained Equivalence Search

Appendix X (Section X.7) already provides a pipeline for connecting PU quantities to an effective action. Duality discovery is a specialization:

1. **Fix the operational sector.** Specify $\mathcal{O}$ (observables), $\mathcal{C}$ (contexts), and the outcome spaces $\{\Omega_O\}$ at MPU resolution (including any imposed symmetries, boundary conditions, and coarse-graining scale $\delta$).

2. **Construct the proxy.** Build $W_k[J]$ and $\Gamma_k[\Phi]$ consistent with those constraints (Appendix X); include CTP structure for ND-RID when appropriate (Section X.5).

3. **Enumerate candidate transforms.** Consider exact transformations that preserve correlators: field redefinitions, Legendre transforms on auxiliary fields, Hubbard–Stratonovich-type rewrites, or boundary restrictions implied by encoding theorems (Appendix E, Theorem E.8.2).

4. **Check operational invariants.** Verify that $p(E\mid O,c)$ is unchanged for every measurable outcome event, retained observable, and context under the declared correspondence. Exact equality of normalized generating functions on a determining source domain can establish this when uniqueness of the induced probability law is certified. LAN or equality of the Fisher metric alone is a local approximation and does not establish equality of the full response distributions.

5. **Conclude degeneracy.** A candidate satisfying the invertible-transform and source-independent-Jacobian hypotheses of Proposition X.9.3 has the proxy invariance proved there. A candidate passing step (4) has response equivalence; complete PCE degeneracy additionally requires equality of every charged cost entry.

**Theorem X.9.4a (Finite Exact Duality Classification).** Let $\mathfrak P$ be a finite set of predictive presentations. Suppose each presentation carries:

1. a finite response table over one exact field with decidable equality;
2. a complete cost vector in one exact ordered field;
3. a finite table of candidate transforms closed under the declared composition and inverse operations, with those operations decidable; and
4. a finite obstruction complex whose cochain groups are finitely generated abelian groups and whose coboundaries are given by integer matrices.

Then the following data are computable by exhaustive exact operations:

1. the response-equivalence classes, obtained by equality of every retained response entry;
2. the cost-preserving response-equivalence classes, obtained by intersecting response equivalence with equality of the complete cost vector; a pair in such a class is a nontrivial duality under Definition X.9.2 only if it also passes that definition's nontriviality test;
3. the subgroupoid generated by the invertible candidate transforms that preserve both tables; and
4. every obstruction group, its torsion invariants, and a representative of each retained class.

A pair with distinct response tables belongs to different response and cost-preserving response-equivalence classes regardless of cost degeneracy.

*Proof.* The first two equivalence relations are decided by finitely many exact equality comparisons. Filtering the finite transform table by source, target, response, cost, composition, and inverse equations leaves a finite groupoid; breadth-first traversal computes its connected components and multiplication tables. Present each coboundary by its integer matrix. Smith normal form computes kernels, images, free ranks, torsion invariant factors, and explicit representatives, hence the cohomology groups. Exhaustion of the finite input tables proves completeness. A response-distinct pair fails the first equivalence predicate and therefore also the intersected cost-preserving response-equivalence predicate. ∎

### X.9.5 Predictive Obstruction Complex

**Definition X.9.5a (Finite PU Obstruction Complex).** Let $\mathcal U=\{U_i\}_{i\in I}$ be a finite operational cover of a regular PU branch, where each $U_i$ denotes a local predictive chart, perspective chart, gauge frame, boundary patch, or effective-action chart. Let $\mathcal F_\varepsilon$ be an abelian sheaf of finite-cost predictive correction functionals: for each $U$, $\mathcal F_\varepsilon(U)$ is the abelian group of signed local correction functionals with finite implementation cost, equipped with the filtration that records irreversible update increments satisfying the Landauer lower bound $\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)\quad(\text{registered reset branch; a positive uniform floor inferred from this entropy bound requires }H_q(P\mid R)\ge h_{\min}>0)$ for admissible positive updates. Define
$$
C^n_{\mathrm{PU}}(\mathcal U,\mathcal F_\varepsilon)
=
\prod_{i_0<\cdots<i_n}
\mathcal F_\varepsilon(U_{i_0}\cap\cdots\cap U_{i_n})
$$
with the Cech coboundary
$$
(\delta c)_{i_0\cdots i_{n+1}}
=
\sum_{r=0}^{n+1}(-1)^r
c_{i_0\cdots\widehat{i_r}\cdots i_{n+1}}
\big|_{U_{i_0}\cap\cdots\cap U_{i_{n+1}}}.
\tag{X.9.5.1}
$$
The predictive obstruction groups are
$$
H^n_{\mathrm{PU}}(\mathcal U,\mathcal F_\varepsilon)
=
\ker(\delta:C^n\to C^{n+1})/
\operatorname{im}(\delta:C^{n-1}\to C^n).
\tag{X.9.5.2}
$$

**Theorem X.9.5b (Obstruction-Exactness Classification).** For every finite operational cover $\mathcal U$ and finite-cost abelian sheaf $\mathcal F_\varepsilon$ as in Definition X.9.5a:

1. $\delta^2=0$, so $H^n_{\mathrm{PU}}(\mathcal U,\mathcal F_\varepsilon)$ is well-defined.
2. $H^0_{\mathrm{PU}}$ consists exactly of globally glueable finite-cost predictive assignments.
3. $H^1_{\mathrm{PU}}$ classifies abelian transition torsors. A nonzero class obstructs removal of all transition corrections by local redefinitions; it does not obstruct existence of a twisted global object when effective descent is available.
4. A degree-two cocycle may classify retained curvature, gerbe, or anomaly-polynomial data. Its class is an obstruction only to a specified lift, lower-degree trivialization, or declared anomaly-free redundancy. Failure of the cocycle equation itself is a descent failure.
5. For a pair $(X,\partial X)$ with boundary cover induced from $\mathcal U$, assume that the restriction cochain map
$$
r:C^n_{\mathrm{PU}}(X)\to C^n_{\mathrm{PU}}(\partial X)
$$
is surjective for every $n$. Then the relative complex
$$
C^n_{\mathrm{PU}}(X,\partial X)=\ker r
$$
has the long exact sequence
$$
\cdots\to H^n_{\mathrm{PU}}(X,\partial X)\to H^n_{\mathrm{PU}}(X)\to H^n_{\mathrm{PU}}(\partial X)\xrightarrow{\Delta}H^{n+1}_{\mathrm{PU}}(X,\partial X)\to\cdots.
\tag{X.9.5.3}
$$
Without degreewise surjectivity, relative cohomology is defined by the shifted mapping cone $\operatorname{Cone}(r)[-1]$, which has the same long exact sequence. Anomaly inflow and horizon compensation are exactness conditions for the specifically declared anomaly or trivialization obstruction in the applicable relative complex.

*Proof.* In the displayed computation of $\delta^2c$, every term obtained by deleting indices $r$ and $s$ appears once in each sum with opposite sign; hence $\delta^2=0$. The descriptions of $H^0$, $H^1$, and $H^2$ follow from cocycle and coboundary definitions and the sheaf gluing axiom. Under degreewise surjectivity, the short exact sequence
$$
0\to\ker r\to C^\bullet_{\mathrm{PU}}(X)\xrightarrow{r}C^\bullet_{\mathrm{PU}}(\partial X)\to0
$$
gives (X.9.5.3). Without surjectivity, the mapping-cone sequence gives the same conclusion. ∎

**Corollary X.9.5c (Typed Exactness for Curvature, Gauge Anomaly, and Horizon Inflow).** When a claimed conclusion requires an untwisted global representative or declares a transformation to be an exact redundancy, the applicable anomaly or trivialization class must be the distinguished trivial class after accepted boundary or defect inflow:
$$
[\omega_{\mathrm{bulk}}]+[\omega_{\mathrm{boundary}}]=0
\quad
\text{in the declared abelian obstruction group}.
\tag{X.9.5.4}
$$
A genuine transition, curvature, or holonomy class may instead be nonzero and label a consistent twisted or curved global object; it is not an anomaly merely by nonvanishing.

*Proof.* Theorem X.9.5b separates physical cocycle classes from obstructions to a declared exact redundancy or required trivialization. Only the latter require exact cancellation in the applicable absolute or relative complex. ∎

**Definition X.9.5c.1 (Finite Bridge-Site Descent Datum).** A finite bridge-site descent datum is a tuple
$$
\mathfrak B_{\mathrm{desc}}
=
(\mathcal U,\mathcal F_{\mathrm{br}},\{r_i\}_{i\in I},\omega_{\mathrm{br}},\chi_{\mathrm{br}})
\tag{X.9.5.5}
$$
with the following finite entries.

1. $\mathcal U=\{U_i\}_{i\in I}$ is a finite operational cover by accepted local cells, such as finite diamonds, KMS patches, threshold blocks, flavor cells, Fredholm cells, or horizon patches.
2. $\mathcal F_{\mathrm{br}}$ assigns to each nonempty intersection $U_{i_0\cdots i_p}$ the retained finite response object used by the local theorem on that cell.
3. $r_i$ is the local accepted representative on $U_i$.
4. $\omega_{\mathrm{br}}=(g_{ij})$ is the finite transition cochain defined by
$$
r_i|_{U_{ij}}
=
g_{ij}\cdot r_j|_{U_{ij}},
\qquad
U_{ij}=U_i\cap U_j,
\tag{X.9.5.6}
$$
where $g_{ij}$ lies in the finite response-gauge groupoid of the branch.
5. $\chi_{\mathrm{br}}$ records that the cover, local representatives, transition maps, and response-gauge groupoid were fixed before any global validation target using the glued object.

The datum is a descent datum when
$$
g_{ij}g_{jk}g_{ki}=1
\quad
\text{on every nonempty }U_i\cap U_j\cap U_k,
\tag{X.9.5.7}
$$
and its transition class is
$$
[g_{\mathrm{br}}]:=[\omega_{\mathrm{br}}]
\in
\check H^1(\mathcal U,\mathcal G_{\mathrm{br}}).
\tag{X.9.5.8}
$$
For a nonabelian response groupoid, this $H^1$ is a pointed set with distinguished trivial class $[1]$; for abelian coefficients $[1]$ may be written $0$. A genuine cocycle class is called an obstruction only when a claimed lift or untwisted trivialization requires $[g_{\mathrm{br}}]=[1]$.

**Theorem X.9.5c.2 (Finite Bridge Descent and Trivialization).** Let $\mathfrak B_{\mathrm{desc}}$ be a genuine finite bridge-site descent datum satisfying $\chi_{\mathrm{br}}$ and the cocycle equation (X.9.5.7). Assume that $\mathcal F_{\mathrm{br}}$ is an effective descent stack for the stated response-gauge groupoid and is separated modulo the declared response equivalence. Then:

1. the local representatives $\{r_i\}$ descend to a global retained response object, unique modulo response equivalence;
2. the descended object admits an untwisted global representative obtained by local redefinitions with identity transition maps if and only if
   $$
   [g_{\mathrm{br}}]=[1];
   \tag{X.9.5.9}
   $$
3. if $[g_{\mathrm{br}}]\ne[1]$, the class records a possibly response-active twist of the descended global object; nonvanishing alone is not an obstruction to existence of that object.

*Proof.* Effective descent is essential surjectivity from global objects to cocycle descent data. Equation (X.9.5.7) therefore supplies a global object whose restrictions are equivalent to the $r_i$, and separatedness gives uniqueness modulo response equivalence. If $[g_{\mathrm{br}}]=[1]$, there are local gauge elements $h_i$ with $g_{ij}=h_i^{-1}h_j$; the adjusted representatives $h_ir_i$ have identity transitions and define an untwisted global representative. Conversely, identity transitions after local redefinition imply $g_{ij}=h_i^{-1}h_j$, so the class is the distinguished point. A nonzero class prevents that global trivialization but is still genuine cocycle descent data, hence still descends by effectiveness. ∎

**Corollary X.9.5c.3 (No Silent Bridge Assumption).** Under Theorem X.9.5c.2, a compatible family of local retained theorems promotes to a theorem about the descended, possibly twisted, global response object when its transition data satisfy the cocycle equation. The equality $[g_{\mathrm{br}}]=[1]$ is required only when the claimed conclusion needs one untwisted global representative. A failure of the cocycle equation, or an independently specified anomaly class that obstructs a required trivialization, must instead be rejected or filled by an accepted response-active defect under Definition X.9.5e.

*Proof.* The first two statements are Theorem X.9.5c.2. Data that fail (X.9.5.7) are not descent data, so effective descent cannot be invoked. For an independently declared obstruction to a required trivialization, Definition X.9.5e supplies exactly the registered defect-filling equation. ∎

**Corollary X.9.5c.4 (Finite Nerve Computation of Transition Classes).** Let $\mathfrak B_{\mathrm{desc}}$ be a finite bridge-site descent datum whose response-gauge groupoid restricts to one group $G$ on every nonempty overlap, with exact multiplication, inversion and equality, and with reverse labels $g_{ji}=g_{ij}^{-1}$ and $g_{ii}=1$. Let $N$ be the nerve of $\mathcal U$ truncated at dimension two: one vertex for each $U_i$, one edge for each nonempty $U_{ij}$, labeled by $g_{ij}$ as the transport from $j$ to $i$ in (X.9.5.6), and one triangle for each nonempty $U_{ijk}$, attached along the closed walk $(i,k,j,i)$. Assume that $N$ is connected. Then:

1. the cocycle equation (X.9.5.7) holds exactly when every triangle of $N$ is flat in the sense of Theorem X.9.6i.8, because the ordered holonomy of $(i,k,j,i)$ in the convention (D.8.9c.3.2) is $g_{ij}g_{jk}g_{ki}$;

2. local redefinitions $r_i\mapsto h_ir_i$ act by $g_{ij}\mapsto h_ig_{ij}h_j^{-1}$, which is the vertex gauge of Theorem X.9.6i.8 with $k_i=h_i^{-1}$, so
$$
\check H^1(\mathcal U,\mathcal G_{\mathrm{br}})
\cong
\operatorname{Hom}\bigl(\pi_1(N,v_0),G\bigr)/G,
\tag{X.9.5c.4.1}
$$
computed through the presentation (X.9.6i.8.3) of $N$, with the distinguished class $[1]$ corresponding to the trivial homomorphism;

3. the alternatives of Theorem X.9.5c.2 and Corollary X.9.5c.3 are decided exactly: a nonflat triangle is a descent failure, to be rejected or filled under Definition X.9.5e; and, under the effective-descent and separatedness hypotheses of Theorem X.9.5c.2, a flat datum with trivial chord holonomies admits an untwisted global representative, while a flat datum with a nontrivial class descends to a twisted global object labeled by its conjugacy class of homomorphisms. Every descent datum on a cover with simply connected nerve is untwisted.

*Proof.* Item 1. By (X.9.5.6), $g_{ij}$ transports the representative from $j$ to $i$, so the ordered product (D.8.9c.3.2) along $(i,k,j,i)$ is $g_{ij}g_{jk}g_{ki}$, and flatness of the triangle is the equation (X.9.5.7) for $U_{ijk}$; the reverse-label convention makes the equations for the other orderings of the same triple equivalent to it, and together with $g_{ii}=1$ it makes every equation with a repeated index hold identically. Item 2. If $r'_i=h_ir_i$, then $r'_i=h_ig_{ij}r_j=h_ig_{ij}h_j^{-1}r'_j$ on $U_{ij}$, which is the stated action. The pointed set (X.9.5.8) is the set of cocycles modulo this action; by item 1 the cocycles are the flat transition records on $N$, and item 2 of Theorem X.9.6i.8 identifies their gauge classes with $\operatorname{Hom}(\Pi_T,G)/G$, where $\Pi_T$ presents $\pi_1(N,v_0)$ and the trivial homomorphism is the class of identity transitions. Item 3 combines items 1 and 2 with items 2 and 3 of Theorem X.9.5c.2; for simply connected $N$, $\operatorname{Hom}(\pi_1(N,v_0),G)$ contains only the trivial homomorphism. ∎

### X.9.5d Higher-Form Predictive Ledger


**Definition X.9.5d.1 (Higher-Form Ledger Complex).** Let $\mathcal U$ be a finite operational cover whose nerve carries oriented cellular chains $C_q(\mathcal U;\mathbb Z)$. A $q$-dimensional protocol operator is a finite assignment
$$
\Gamma_q=\sum_a n_a\sigma_a,
\qquad
\sigma_a\in C_q(\mathcal U;\mathbb Z),
\tag{X.9.5d.1}
$$
together with a response functional supported on the corresponding $q$-cells. Let $\mathcal F_{\varepsilon}^{(q)}$ be the abelian sheaf of finite-cost ledger phases acting on such $q$-dimensional protocol operators. The $q$-form predictive ledger group is
$$
H^{q+1}_{\mathrm{PU}}(\mathcal U,\mathcal F_{\varepsilon}^{(q)})
=
\ker\bigl(\delta:C^{q+1}\to C^{q+2}\bigr)/
\operatorname{im}\bigl(\delta:C^q\to C^{q+1}\bigr).
\tag{X.9.5d.2}
$$
A class is boundary-active when its pairing with at least one admissible boundary or interface $q$-protocol changes the protocol-response presheaf.

**Theorem X.9.5d.2 (Higher-Form Ledger Nullity and Descent).** For every finite cover and every $q\ge0$:

1. $H^{q+1}_{\mathrm{PU}}(\mathcal U,\mathcal F_{\varepsilon}^{(q)})$ is well-defined.

2. A declared exact $q$-form label whose class has no action on any admissible local, boundary, or interface $q$-dimensional protocol operator is PCE-null and is quotiented out.

3. A boundary-active class is retained when it is genuine cocycle data admitting effective descent. If it is asserted to be an exact redundancy, or if the claimed object requires a specified lift or trivialization, the corresponding obstruction must be trivial, response-null, or filled by accepted inflow.

4. For $q=0$, operationally null labels are removed as in Corollary G.8.4h.3, while active cocycles and obstructions retain the distinctions of Theorem X.9.5b. Corollary G.8.4h.3 classifies connected fiberwise actions only when they are implemented by unitary tensor natural automorphisms of $F_{\mathrm{int}}$; it does not exclude all exact operational global symmetries.

*Proof.* The Cech coboundary with coefficients in the abelian sheaf $\mathcal F_{\varepsilon}^{(q)}$ satisfies $\delta^2=0$, proving item 1. For item 2, a label acting on no admissible extended protocol changes no response distribution; PPI identifies it and PCE removes any positive-cost surplus representative. For item 3, nonzero active cocycle data may encode physical curvature, holonomy, or an unbroken center class. Exactness is required only for the separately declared anomaly, redundancy, lift, or trivialization obstruction. Item 4 is the $q=0$ specialization. ∎

**Definition X.9.5d.3 (Electric Center Ledger Confinement Datum).** A finite electric center ledger confinement datum is a tuple
$$
\mathfrak C_{\mathrm{cen}}
=
(\mathcal U,\chi_Z,\mathsf W,\mathsf A_{\min},\sigma_0,\lambda_{\partial})
\tag{X.9.5d.3}
$$
where:

1. $\chi_Z\in H^2_{\mathrm{PU}}(\mathcal U,\mathcal F_{\varepsilon}^{(1)})$ is a $\mathbb Z_3$-valued electric center one-form ledger class acting on line protocols;

2. $\mathsf W(C)$ is the Wilson-line protocol assigned to an admissible closed contour $C$;

3. $\mathsf A_{\min}(C)$ is the minimum number of retained two-cells in any admissible spanning surface for $C$;

4. $\sigma_0>0$ is a uniform center-flux surface cost per retained two-cell;

5. $\lambda_{\partial}\ge0$ is a finite perimeter counterterm for local boundary renormalization.

The center ledger is unbroken on the datum when $\chi_Z$ is nonzero, boundary-active on $\mathsf W(C)$, and no finite-cost endpoint operator exists whose boundary charge cancels the $\mathbb Z_3$ line charge. It is broken or screened when such endpoint operators are admitted or when $\chi_Z$ is made exact by gauging or quotienting.

**Theorem X.9.5d.4 (Center-Ledger Area-Law Criterion).** On a finite line-protocol branch carrying an electric center ledger confinement datum $\mathfrak C_{\mathrm{cen}}$, assume additionally that the normalized Wilson expectation admits a convergent sheet expansion with weights $w_C(S)$ satisfying the aggregate bound
$$
\sum_{S:\,\partial S=C}|w_C(S)|\,e^{\sigma_0|S|}
\le e^{\lambda_{\partial}|\partial C|}.
$$
Here $|S|$ is the retained sheet area and every admitted sheet obeys $|S|\ge\mathsf A_{\min}(C)$. This is a bound on the total normalized weight, including sheet multiplicity and any entropy contribution, not just a cost for each sheet:

1. if the center ledger is unbroken, then every Wilson loop carrying nontrivial center charge satisfies the finite-resolution area bound
$$
|\langle \mathsf W(C)\rangle|
\le
\exp\!\left[
-\sigma_0\,\mathsf A_{\min}(C)+\lambda_{\partial}|\partial C|
\right];
\tag{X.9.5d.4}
$$

2. for rectangular loops with $\mathsf A_{\min}(C)\to\infty$ and $|\partial C|=o(\mathsf A_{\min}(C))$, this is a Wilson-loop area law;

3. if the center ledger is broken or screened by finite-cost endpoints, then this ledger no longer enforces an area law, and a perimeter-law contribution is admissible;

4. finite line-protocol completeness makes $\chi_Z$ the complete ledger of center-charged obstructions, but a perimeter law on the broken branch requires a separate asymptotic estimate for the endpoint contribution.

*Proof.* Every admitted sheet has $|S|\ge\mathsf A_{\min}(C)$. The triangle inequality and the aggregate hypothesis give
$$
|\langle\mathsf W(C)\rangle|
\le\sum_S|w_C(S)|
\le e^{-\sigma_0\mathsf A_{\min}(C)}
\sum_S|w_C(S)|e^{\sigma_0|S|}
\le e^{-\sigma_0\mathsf A_{\min}(C)+\lambda_\partial|\partial C|}.
$$
This proves (X.9.5d.4), including multiplicity and normalization. When $|\partial C|=o(\mathsf A_{\min}(C))$, the positive area term dominates.

If finite-cost endpoints exist, a sheet may terminate and the preceding area-bound argument fails. This permits, but does not prove, perimeter behavior. Completeness excludes an unregistered center obstruction; it does not estimate endpoint weights. Therefore a perimeter law follows only from an additional endpoint asymptotic certificate. ∎

**Corollary X.9.5d.5 (Conditional Leech-Golay Input to the Center-Ledger Gap).** On the predictive-recovery Golay-Leech branch, Theorem Z.8c supplies the rootless norm gap $|v|_{\min}^2=4$. Assume additionally the flux-tube gauge-dynamical hypothesis of Proposition Z.8d, the saturated-activity action–entropy mass calibration used there, specified positive calibration parameters $q,\gamma$, and an identification of one unit of nontrivial electric center flux with the minimal rootless displacement shell. Then the calibrated tube tension
$$
\sigma=\frac{2\gamma\mu_0^{\mathrm{alg}}}{q\delta}
$$
is positive. If this tension is the surface-cost parameter $\sigma_0$ of Definition X.9.5d.3 and the branch also supplies the normalized aggregate-sheet bound of Theorem X.9.5d.4, Theorem X.9.5d.4 gives the center-ledger area law on the combined branch.

*Proof.* Theorem Z.8c supplies the dimensionless norm gap. The additional hypotheses are exactly those under which Proposition Z.8d maps that gap to a prescribed-cross-section flux tube with the displayed positive tension. Registering this value as $\sigma_0$ verifies the positive surface-cost parameter. Together with the independent normalized aggregate-sheet bound, all hypotheses of Theorem X.9.5d.4 are available and its area-law conclusion follows. ∎

**Definition X.9.5d.6 (Asymptotic Color-Record Certificate).** An asymptotic color-record certificate fixes a color-frame distinguishability $D_{\mathrm{col}}(L)$, a screening length $\ell_{\mathrm{scr}}>0$, and a nonnegative residual $\mathcal R_{\mathrm{conf}}(L)$ satisfying
$$
D_{\mathrm{col}}(L)
\le
D_{\mathrm{col}}(0)e^{-L/\ell_{\mathrm{scr}}}
+\mathcal R_{\mathrm{conf}}(L),
\qquad
\lim_{L\to\infty}\mathcal R_{\mathrm{conf}}(L)=0.
\tag{X.9.5d.6.1}
$$
The record covers retained infrared comparisons with $L/\ell_{\mathrm{scr}}\to\infty$.

**Proposition X.9.5d.7 (Operational Asymptotic Color Confinement).** On an accepted certificate,
$$
\lim_{L\to\infty}D_{\mathrm{col}}(L)=0.
\tag{X.9.5d.7.1}
$$
Thus asymptotic color-frame labels are PPI-null only in the registered infrared quotient. No finite-$L$ exact nullity follows, and an area law by itself does not supply the residual-decay entry.

*Proof.* Definition X.9.5d.6 gives, for every $L$,
$$
0\le D_{\mathrm{col}}(L)
\le D_{\mathrm{col}}(0)e^{-L/\ell_{\mathrm{scr}}}+\mathcal R_{\mathrm{conf}}(L).
$$
Because $\ell_{\mathrm{scr}}>0$, the exponential term tends to zero, and the certificate assumes $\mathcal R_{\mathrm{conf}}(L)\to0$. The squeeze theorem gives (X.9.5d.7.1). The inequality permits a positive value at every finite $L$, so finite-distance nullity does not follow. ∎

**Proposition X.9.5d.8 (Exact Center-Flux Classification on the Electric $\mathbb Z_3$ Ledger Hamiltonian).** Let $\Gamma=(V,L)$ be a finite connected graph with oriented link set $L$, give each link the flux register $\mathbb C^3$ with orthonormal flux basis $\{|e\rangle:e\in\mathbb Z_3\}$, and let
$$
H_E=\sum_{\ell\in L}h(E_\ell),
\qquad
h(0)=0,
\quad
h(1)=h(2)=\epsilon>0,
\tag{X.9.5d.8.1}
$$
be the electric term of the $\mathbb Z_3$ Kogut-Susskind lattice Hamiltonian in its strong-coupling limit, with zero plaquette coupling. For a static charge assignment $q:V\to\mathbb Z_3$ with $\sum_{v\in V}q(v)=0$, the condition for a nonzero Gauss sector on the connected graph $\Gamma$, let $\mathcal H_q$ be the Gauss sector $\operatorname{div}E=q$, where $(\operatorname{div}E)(v)$ is the outgoing minus the incoming flux at $v$ modulo $3$. Call $F\subseteq L$ $q$-neutral when every connected component of the graph $(V,F)$ has total charge $0$ in $\mathbb Z_3$, and let $s(q)$ be the least cardinality of a $q$-neutral link set. Then:

1. The ground energy of $H_E$ on $\mathcal H_q$ is $\epsilon\,s(q)$. The ground space is spanned by the flux configurations supported on the minimum $q$-neutral link sets; each such set is a forest, carries exactly one configuration of divergence $q$, and that configuration is nonzero on every edge of the set.

2. For a charge pair $q=\delta_x-\delta_y$ with $x\ne y$, $s(q)=d_\Gamma(x,y)$, so the static potential is
$$
V(x,y)=\epsilon\,d_\Gamma(x,y),
$$
and the minimal flux configurations are exactly the unit flux strings along the geodesics from $x$ to $y$. The electric energy $\epsilon$ is an exact string tension per retained link.

3. For three unit charges $q=\delta_x+\delta_y+\delta_z$ at distinct vertices, $s(q)$ is the Steiner number of $\{x,y,z\}$, the least number of links of a tree containing $x$, $y$ and $z$, and the minimal flux configurations are the flows on the minimum Steiner trees; at a trivalent junction three unit fluxes fuse to zero because $3=0$ in $\mathbb Z_3$.

4. Adding dynamical $\mathbb Z_3$ matter with site charges $n_v$, Gauss law $\operatorname{div}E=q+n$ and mass term $m\sum_{v}[n_v\ne0]$ with $m>0$ supplies charged endpoints at finite cost, and the pair potential becomes
$$
V_m(x,y)=\min\bigl(\epsilon\,d_\Gamma(x,y),\,2m\bigr),
\tag{X.9.5d.8.2}
$$
which saturates for $d_\Gamma(x,y)\ge2m/\epsilon$.

Hence one explicit Hamiltonian exhibits both endpoint alternatives named in Definition X.9.5d.3: on the static-charge branch no finite-cost endpoint exists and center flux costs $\epsilon$ per link, which is linear confinement; on the dynamical-matter branch finite-cost endpoints screen the center charge and bound the pair potential by $2m$, the perimeter-admissible alternative of item 3 of Theorem X.9.5d.4.

*Proof.* Item 1. The operator $H_E$ is diagonal in the flux basis and $\mathcal H_q$ is spanned by the flux configurations of divergence $q$, so the ground energy is $\epsilon$ times the least support size of such a configuration. Let $E$ have divergence $q$ and support $F$, and let $C$ be a component of $(V,F)$. A link with exactly one endpoint in $C$ lies outside $F$ and carries zero flux, while each link inside $C$ contributes its flux once with each sign to the divergence sum over $C$; hence $\sum_{v\in C}q(v)=0$, so $F$ is $q$-neutral and the energy is at least $\epsilon\,s(q)$. Conversely, let $F$ be a minimum $q$-neutral set. If $F$ contained a cycle, deleting one of its links would preserve every component and its charge, contradicting minimality, so $F$ is a forest. On a tree component of total charge $0$ there is exactly one configuration of divergence $q$: removing a leaf $v$ fixes the flux on its link from $q(v)$ and transfers that charge to the neighbor, and the process ends at a last vertex whose remaining charge is the component total $0$. If this configuration vanished on a link $\ell\in F$, deleting $\ell$ would split its tree into two parts, each of total charge $0$ by the divergence sum, so $F\setminus\{\ell\}$ would be $q$-neutral, contradicting minimality. Thus the minimum sets carry configurations of energy $\epsilon\,s(q)$ with full support, and by the first part every ground configuration has a minimum $q$-neutral support.

Item 2. The component of a $q$-neutral set containing $x$ has charge $1$ unless it contains $y$, so it contains an $x$-$y$ path and has at least $d_\Gamma(x,y)$ links; a geodesic path is $q$-neutral. A minimum set therefore equals one geodesic path, and its unique configuration carries flux $1$ from $x$ to $y$.

Item 3. A component containing exactly one or exactly two of $x,y,z$ has charge $1$ or $2$, and a component containing none of them has charge $0$. A $q$-neutral set therefore contains a connected subgraph containing $x$, $y$ and $z$, hence at least a Steiner number of links, and a minimum Steiner tree is $q$-neutral; a minimum $q$-neutral set is therefore a minimum Steiner tree. At a junction of degree three, the leaf-removal construction of item 1 delivers one unit of flux along each leg, and the junction has divergence $-3=0$.

Item 4. The mass term is diagonal in the joint flux-charge basis, so the ground energy is the minimum of $\epsilon|\operatorname{supp}E|+m|\operatorname{supp}n|$ over configurations with $\operatorname{div}E=q+n$. Let $C_x$ be the component of $(V,\operatorname{supp}E)$ containing $x$; the divergence sum gives $\sum_{v\in C_x}(q+n)(v)=0$. If $y\in C_x$, then $C_x$ contains an $x$-$y$ path and the energy is at least $\epsilon\,d_\Gamma(x,y)$. If $y\notin C_x$, then $\sum_{v\in C_x}q(v)=1$, so $n$ is nonzero somewhere in $C_x$, and the same argument applies to the disjoint component $C_y$, so the energy is at least $2m$. The geodesic string with $n=0$ and the configuration $E=0$, $n=-q$ attain the two values. ∎

**Resolution TV-X-17-R1 (Metadata).** Exact domain: finite connected graphs with $\mathbb Z_3$ flux registers, the electric Hamiltonian (X.9.5d.8.1) with $h(1)=h(2)=\epsilon$ and zero plaquette coupling, all static Gauss sectors, and the dynamical-matter extension of item 4. Premises: the Gauss law modulo $3$ and the charge-conjugation-symmetric electric energy. Equivalence: equality of energies and of flux configurations within each Gauss sector. Budget: one minimum neutral-forest computation per sector. Verifier: exact finite combinatorics of the diagonal Hamiltonian. Falsifier: a Gauss-sector configuration below $\epsilon\,s(q)$, a minimum neutral set containing a cycle, or a pair sector below $\min(\epsilon d_\Gamma,2m)$. Provenance class: source-internal finite mathematics on the standard $\mathbb Z_3$ lattice gauge Hamiltonian. Downstream consumers: Definition X.9.5d.3, Theorem X.9.5d.4, Corollary X.9.5d.5 and `TV-X-17`. Nonvacuity: on the $2\times4$ grid graph the pair at $(0,0)$ and $(1,3)$ has energy $4\epsilon$ with four geodesic ground states, three unit charges at $(0,0)$, $(0,3)$ and $(1,1)$ have energy $4\epsilon$ on their Steiner tree, and the neutral sector has the unique zero-flux ground state. Proposition X.9.5d.8 gives `positive-discharge` of the flux-string and endpoint classification and of the tension and screening derivation of `TV-X-17` on the strong-coupling electric $\mathbb Z_3$ Hamiltonian class. A volume-uniform tension bound at nonzero plaquette coupling (`M`), the identification of the PU center-ledger datum with this Gauss law and electric energy (`C`), its physical realization (`R`), and the Wilson-loop and color-record observable map (`O`) remain live under `TV-X-17`.

**Definition X.9.5e (Finite Defect-Filling Datum).** A finite defect-filling datum applies to an independently declared abelian obstruction class that prevents a cocycle condition or a separately required lift or global trivialization. A nontrivial transition class of genuine nonabelian descent data is not by itself such an obstruction: Theorem X.9.5c.2 instead gives a possibly twisted global object. For an obstruction in the stated sense, a finite defect-filling datum is a tuple
$$
\mathfrak D_{\mathrm{fill}}
=
(H_{\mathrm{obs}},[\omega],\mathcal D_{\mathrm{act}},\partial,\otimes,\mathbf 1,C_{\mathrm{def}},\sim_{\mathrm{resp}})
\tag{X.9.5.10}
$$
where $H_{\mathrm{obs}}$ is a finite abelian obstruction group containing $[\omega]$, $\mathcal D_{\mathrm{act}}$ is the finite set of response-active operational defects, $\partial:\mathcal D_{\mathrm{act}}\to H_{\mathrm{obs}}$ is the boundary/inflow map, $\otimes$ is an associative finite fusion product with unit $\mathbf 1$, $C_{\mathrm{def}}$ is the PCE defect cost, and $\sim_{\mathrm{resp}}$ is response equivalence. The datum is accepted only when
$$
\partial(D_1\otimes D_2)
=
\partial D_1+\partial D_2
\tag{X.9.5.11}
$$
for all fusable defects and when all entries are fixed before any global consequence using the filled branch.

A defect $D$ fills $[\omega]$ when
$$
[\omega]+\partial D=0
\quad\text{in }H_{\mathrm{obs}}.
\tag{X.9.5.12}
$$

**Theorem X.9.5e.1 (Descent, Cobordism, and Non-Invertible Defect Completion).** Distinguish a genuine transition class $[g]$ in the pointed set of Theorem X.9.5c.2 from an independently declared abelian obstruction class $[\omega]\in H_{\mathrm{obs}}$ of Definition X.9.5e. For genuine cocycle descent data, assume the effective-descent-stack and separatedness hypotheses. A branch is theorem-admissible under one of the following registered alternatives:

1. $[g]$ is the transition class of a genuine cocycle descent datum, so effective descent gives a global object, possibly twisted; $[g]=[1]$ is additionally required exactly when the claimed conclusion requires an untwisted global representative;
2. $[\omega]$ is an obstruction in the sense of Definition X.9.5e but is response-null and is quotiented by $\sim_{\mathrm{resp}}$; or
3. $[\omega]$ is a response-active obstruction in the sense of Definition X.9.5e and an accepted defect-filling datum supplies $D\in\mathcal D_{\mathrm{act}}$ with $[\omega]+\partial D=0$.

If several filling defects exist and the feasible response-class set has an attained unique minimum of $C_{\mathrm{def}}$, define
$$

\mathcal D([\omega])
:=
\operatorname*{argmin}_{D\in\mathcal D_{\mathrm{act}}:
[\omega]+\partial D=0}
C_{\mathrm{def}}(D)
\quad\text{mod }\sim_{\mathrm{resp}}.
\tag{X.9.5.13}
$$
Non-invertible defects are admitted by the same rule when they possess a finite fusion law, a boundary map, and non-null protocol response.

*Proof.* The first alternative is Theorem X.9.5c.2: every genuine cocycle datum descends under effectiveness, while equality of its pointed transition class with $[1]$ is equivalent only to global trivializability. If an actual obstruction is response-null, PPI identifies all representatives differing by it, so quotienting removes no observable response. If a response-active obstruction remains, exactness of the total obstruction is restored precisely by a defect whose boundary satisfies the cancellation equation (X.9.5.12). Additivity (X.9.5.11) makes fusion compatible with obstruction addition, so non-invertible fusion defects obey the same exactness law even without inverses for individual objects. PCE selects the unique least-cost response class only when the feasible filling set has an attained unique minimum. If none of the three cases holds, the branch contains an unfilled response-active inconsistency and is not theorem-admissible. ∎

**Corollary X.9.5e.2 (No Surplus Symmetry or Unfilled Anomaly).** In PU, a declared exact redundancy must have zero total obstruction after quotienting response-null classes and after including accepted defect inflow. A nonzero genuine transition class may label a twisted global object and is not thereby an anomaly. Any nonzero unfilled response-active obstruction in the sense of Definition X.9.5e is either completed by a physical defect channel under Theorem X.9.5e.1 or the branch is rejected.

*Proof.* This is the contrapositive of the admissibility criterion in Theorem X.9.5e.1. ∎

**Proposition X.9.5e.3 (Finite Filling Classification).** Let $\mathfrak D_{\mathrm{fill}}$ be an accepted finite defect-filling datum.

1. The class $[\omega]$ admits a filling exactly when $-[\omega]\in\partial(\mathcal D_{\mathrm{act}})$.

2. If every pair of accepted defects is fusable, so that $(\mathcal D_{\mathrm{act}},\otimes,\mathbf 1)$ is a finite monoid, then $S=\partial(\mathcal D_{\mathrm{act}})$ is a subgroup of $H_{\mathrm{obs}}$, the fillable classes are exactly the elements of $S$, and the residue of $[\omega]$ in the finite cokernel $H_{\mathrm{obs}}/S$ vanishes exactly when $[\omega]$ is fillable.

3. For a fillable $[\omega]$, the minimal-cost filling response classes form a finite nonempty set, and (X.9.5.13) defines the PCE selection exactly when this set has one element.

4. Let $\mathcal D_{\mathrm{act}}$ consist exactly of the fusion products of elementary defects $e_1,\ldots,e_p$, with every such product defined and the empty product equal to $\mathbf1$, fix generator weights $c_1,\ldots,c_p\ge0$, and let $C_{\mathrm{def}}(D)$ be the least word cost $\sum_kc_{i_k}$ over fusion words $e_{i_1}\otimes\cdots\otimes e_{i_r}=D$. Then the least filling cost of $[\omega]$ is the least total weight of a word in $\partial e_1,\ldots,\partial e_p$ with sum $-[\omega]$, that is, the shortest-path distance from $0$ to $-[\omega]$ in the Cayley digraph of $H_{\mathrm{obs}}$ with generators $\partial e_i$ and edge weights $c_i$, and a label-setting shortest-path computation over the $|H_{\mathrm{obs}}|$ vertices decides it. A cost $C_{\mathrm{def}}$ additive under fusion vanishes identically on this class, because finiteness of $\mathcal D_{\mathrm{act}}$ gives $D^{\otimes m}=D^{\otimes n}$ with $m<n$ for each $D$; it is the case $c_1=\cdots=c_p=0$, in which every fillable class has least filling cost $0$ and (X.9.5.13) selects a class exactly when all fillers of $[\omega]$ are response equivalent.

*Proof.* Item 1 restates (X.9.5.12). Item 2. From $\mathbf1\otimes\mathbf1=\mathbf1$ and (X.9.5.11), $\partial\mathbf1=2\partial\mathbf1$, so $\partial\mathbf1=0\in S$, and (X.9.5.11) makes $S$ closed under addition. For $x\in S$ of order $p$ in the finite group $H_{\mathrm{obs}}$, $-x=(p-1)x\in S$, so $S$ is a subgroup; item 1 then identifies the fillable classes with $-S=S$, and $[\omega]\in S$ exactly when its image in $H_{\mathrm{obs}}/S$ vanishes. Item 3. The fillers of $[\omega]$ form a nonempty subset of the finite set $\mathcal D_{\mathrm{act}}$, so $C_{\mathrm{def}}$ attains its minimum on it and the minimizing response classes are finitely many; the selection rule of Theorem X.9.5e.1 requires a unique minimizing class. Item 4. By (X.9.5.11), a fusion word $e_{i_1}\otimes\cdots\otimes e_{i_r}$ has boundary $\sum_k\partial e_{i_k}$, which is the endpoint of the Cayley-digraph path from $0$ with those steps, and its word cost is the path weight. Every path from $0$ is a word of an accepted defect and every accepted defect has such a word, so minimizing $C_{\mathrm{def}}$ over fillers is minimizing path weight to $-[\omega]$. Deleting a closed subpath does not increase the weight, so the minimum is attained on one of the finitely many simple paths, and with nonnegative weights a label-setting shortest-path algorithm computes it exactly. The least word cost defining $C_{\mathrm{def}}(D)$ is attained because word costs lie in $\{\sum_in_ic_i:n_i\in\mathbb Z_{\ge0}\}$, which has finitely many elements below each bound. If $C_{\mathrm{def}}$ is additive, $\mathbf1\otimes\mathbf1=\mathbf1$ gives $C_{\mathrm{def}}(\mathbf1)=0$, and a repetition $D^{\otimes m}=D^{\otimes n}$, $0\le m<n$, among the finitely many powers of $D$ gives $mC_{\mathrm{def}}(D)=nC_{\mathrm{def}}(D)$, hence $C_{\mathrm{def}}(D)=0$. ∎

**Resolution TV-X-16-R1 (Metadata).** Exact domain: finite covers whose transition coefficients form one exact group on every nonempty overlap (Corollary X.9.5c.4), and accepted finite defect-filling data with finite abelian obstruction group (Proposition X.9.5e.3). Premises: the reverse-label convention, connectedness of the truncated nerve, (X.9.5.11), and in item 4 nonnegative generator weights with the least-word defect cost. Equivalence: the coboundary relation of local redefinitions; response equivalence of defects. Budget: one truncated nerve with its spanning-tree presentation, one image subgroup, and one shortest-path computation over $H_{\mathrm{obs}}$. Verifier: exact group arithmetic and finite shortest-path search. Falsifier: a nonflat nerve triangle accepted as descent data, a flat datum with trivial chord holonomies and no untwisted representative, a filled class outside $-\partial(\mathcal D_{\mathrm{act}})$, or a total fusion monoid whose boundary image is not a subgroup. Provenance class: source-internal finite mathematics. Downstream consumers: Definition X.9.5c.1, Theorem X.9.5c.2, Corollary X.9.5c.3, Definition X.9.5e, Theorem X.9.5e.1, Corollary X.9.5e.2, Theorem X.9.6i.8 and `TV-X-16`. Nonvacuity: three arcs covering a circle with pairwise but no triple overlaps have the triangle boundary as nerve, so $\check H^1$ with $G=S_3$ has three classes, two of them twisted, and a common triple overlap fills the triangle and leaves only $[1]$; for $H_{\mathrm{obs}}=\mathbb Z_4$ and $\mathcal D_{\mathrm{act}}=\{\mathbf 1,D\}$ with $D\otimes D=\mathbf 1$ and $\partial D=2$, the class $2$ is filled by $D$ and the class $1$ has nonzero residue in $\mathbb Z_4/\{0,2\}$; for $\mathcal D_{\mathrm{act}}=\{e^{\otimes j}\}_{j=0}^{3}$ with $e^{\otimes4}=\mathbf1$, $\partial e=1$ in $\mathbb Z_4$ and weight $1$, the class $1$ is filled by $e^{\otimes3}$ with least filling cost $3$. Corollary X.9.5c.4 and Proposition X.9.5e.3 give `positive-discharge` of the finite Čech computation, the separation of twisted descent from anomaly, and the classification of minimal fillings in `TV-X-16` on these classes. Population of the PU covers, response sheaves, obstruction groups and defect catalogs (`C`), higher-form groups whose coefficients lie outside the finitely generated class together with nonconstant response-gauge groupoids (`M`), and the physical realization of filling defects (`R`) remain live under `TV-X-16`.


**Definition X.9.5f (Finite Response Differential Characters).** Let $C_\bullet^B$ be the finite protocol cell complex of a retained budget $B$, with integer chains, real cochains, and the response-null quotient already imposed on cycle evaluations. A degree-$n$ response differential character is a pair
$$
\widehat c=(\chi,\omega)
$$
where
$$
\chi:Z_{n-1}(C_\bullet^B)\to\mathbb R/\mathbb Z
$$
is a homomorphism on retained $(n-1)$-cycles and
$$
\omega\in Z^n(C_\bullet^B;\mathbb R)
$$
is a closed real $n$-cochain with integral periods on retained $n$-cycles, such that for every retained $n$-chain $a$,
$$
\chi(\partial a)
=
\langle\omega,a\rangle
\quad\mathrm{mod}\ \mathbb Z.
\tag{X.9.5f.1}
$$
Two such characters are PPI-equivalent when they agree on all retained protocol cycles and have response-null curvature difference. The quotient group is denoted
$$
\widehat H^n_{\mathrm{PU}}(C_\bullet^B).
$$
Let
$$
Z^n_{\mathbb Z,\mathrm{PU}}(C_\bullet^B;\mathbb R)
$$
denote the closed real $n$-cochains whose periods on retained cycles are integral after the PPI quotient.

**Theorem X.9.5f.1 (Differential-Character Obstruction Spine).** For a finite protocol cell complex $C_\bullet^B$, assume the response-null identifications are induced by a subgroup $N$ of the unquotiented differential-character group. Assume also that $Z^n_{\mathbb Z,\mathrm{PU}}$ is the unquotiented integral-curvature group modulo $\mathrm{curv}(N)$ and that $H^{n-1}_{\mathrm{PU}}$ is the unquotiented flat-character group modulo its intersection with $N$. Under these compatible quotient conventions, there is an exact sequence
$$
0
\to
H^{n-1}_{\mathrm{PU}}(C_\bullet^B;\mathbb R/\mathbb Z)
\to
\widehat H^n_{\mathrm{PU}}(C_\bullet^B)
\xrightarrow{\mathrm{curv}}
Z^n_{\mathbb Z,\mathrm{PU}}(C_\bullet^B;\mathbb R)
\to
0.
\tag{X.9.5f.2}
$$
Consequently:

1. flat torsion or finite frameness labels lie in the left term;
2. gauge, calibration, and perspective curvature, Clausius defects, and local anomaly-polynomial shadows lie in the curvature image;
3. Chern--Simons, anomaly-inflow, horizon, interface, and higher-form protocol charges are relative or higher-degree characters on the same finite complex;
4. a declared exact redundancy is admissible only when its anomaly or required-trivialization obstruction is canceled after quotienting response-null characters and adding accepted defect or boundary inflow. Nonzero differential characters may remain as physical curvature or holonomy.

Thus the exactness test is typed: cocycle failure or an obstruction to a declared redundancy or required trivialization must vanish, be response-null, or be filled by an accepted response-active defect. A genuine transition, curvature, or holonomy character need not vanish.

*Proof.* The curvature map sends $(\chi,\omega)$ to $\omega$. If $\omega=0$, Equation (X.9.5f.1) makes $\chi$ factor through $H_{n-1}(C_\bullet^B)$, so the kernel is $H^{n-1}(C_\bullet^B;\mathbb R/\mathbb Z)$. Conversely, for a closed $\omega$ with integral periods, define $\varphi(\partial a)=\langle\omega,a\rangle$ modulo $\mathbb Z$. Integrality makes this well-defined. Smith normal form and divisibility of $\mathbb R/\mathbb Z$ extend $\varphi$ to a character $\chi$ on cycles, proving surjectivity. Two extensions with the same curvature differ by the unquotiented flat-character group. For the response-null quotient, write $F$ for that flat group. The induced map has target modulo $\mathrm{curv}(N)$. If a class represented by $h$ has zero curvature there, choose $n\in N$ with $\mathrm{curv}(n)=\mathrm{curv}(h)$; then $h-n\in F$. Its kernel is therefore $F/(F\cap N)$, the declared left-hand term, and surjectivity survives quotienting. Items 1--3 are the corresponding degree assignments, and item 4 applies Theorem X.9.5e.1 only to the typed anomaly or trivialization obstruction. ∎

### X.9.6 Master Predictive Operator

**Definition X.9.6a (Closed Predictive Dirichlet Datum).** A closed predictive Dirichlet datum is a quadruple
$$
\mathfrak D_{\mathrm{PU}}
=
(\mathscr H_{\mathrm{PU}},\mathscr Q_{\mathrm{PU}},\mathcal D_{\mathrm{PU}},\Pi)
$$
where:

1. $\mathscr H_{\mathrm{PU}}$ is the finite direct-sum Hilbert module of retained predictive perturbations,
$$
\mathscr H_{\mathrm{PU}}
=
\mathscr H_{\mathrm{field}}
\oplus
\mathscr H_{\mathrm{RG}}
\oplus
\mathscr H_{\Sigma}
\oplus
\mathscr H_{\mathrm{PCE}},
$$
with summands respectively representing effective fields, scale deformations, perspective perturbations, and slow PCE adaptation variables.
2. $\mathscr Q_{\mathrm{PU}}$ is a densely defined, nonnegative, closed quadratic form on $\mathscr H_{\mathrm{PU}}$.
3. $\mathcal D_{\mathrm{PU}}$ is the common dense form domain.
4. $\Pi_\alpha$ denotes the orthogonal projection onto the summand $\mathscr H_\alpha$.

By the representation theorem for closed nonnegative forms there is a unique nonnegative self-adjoint operator $\mathfrak L_{\mathrm{PU}}$ such that
$$
\mathscr Q_{\mathrm{PU}}(u,v)
=
\langle u,\mathfrak L_{\mathrm{PU}}v\rangle
\quad
\text{for }v\in\operatorname{Dom}(\mathfrak L_{\mathrm{PU}}),\ u\in\mathcal D_{\mathrm{PU}}.
\tag{X.9.6.1}
$$
This operator is the master predictive operator of the datum.

**Scope (Datum-Relative Uniqueness).** The uniqueness in Definition X.9.6a is relative to the supplied closed predictive Dirichlet datum, in particular its quadratic form $\mathscr Q_{\mathrm{PU}}$ and common form domain $\mathcal D_{\mathrm{PU}}$. Two admissible data with response-distinct forms, domains, or sector projections are distinct branches unless an accepted strict certificate or an all-completions response-equivalence theorem identifies them.

**Theorem X.9.6b (Projection Theorem for Response, RG, Perspective Transport, and PCE Flow).** Assume the regular finite-mode branch in which the quadratic effective action, Wetterich regulator sector, Appendix M perspective diffusion form, and Appendix D PCE adaptation form are represented by restrictions of one closed predictive Dirichlet datum $\mathfrak D_{\mathrm{PU}}$. Require that every retained summand reduces $\mathfrak L_{\mathrm{PU}}$, that its form and operator domains are invariant under the corresponding orthogonal projection, and that each restricted perspective form is Dirichlet. Require also that $\Pi_{\mathrm{RG}}\mathfrak L_{\mathrm{PU}}\Pi_{\mathrm{RG}}^*+R_k$ is boundedly invertible and that its inverse times $\partial_kR_k$ has a defined supertrace. Finally, assume that the PCE restricted form is the response metric used in the Appendix D natural-gradient equation. Then:


1. The field response Hessian is the field form-compression of the master operator:
$$
\Gamma^{(2)}
=
\Pi_{\mathrm{field}}\mathfrak L_{\mathrm{PU}}\Pi_{\mathrm{field}}^*
\quad
\text{on }\mathscr H_{\mathrm{field}}.
\tag{X.9.6.2}
$$
2. The perspective diffusion generator is the negative Markov generator associated with the perspective compression:
$$
\mathcal L_\Sigma
=
-\Pi_{\Sigma}\mathfrak L_{\mathrm{PU}}\Pi_{\Sigma}^*
\quad
\text{on }\mathscr H_{\Sigma}
\tag{X.9.6.3}
$$
with sign chosen so that $e^{t\mathcal L_\Sigma}$ is contractive.
3. The FRG trace term is a functional-calculus trace of the RG compression:
$$
\partial_k\Gamma_k
=
\frac12\operatorname{STr}
\left[
\left(
\Pi_{\mathrm{RG}}\mathfrak L_{\mathrm{PU}}\Pi_{\mathrm{RG}}^*+R_k
\right)^{-1}
\partial_k R_k
\right]
\tag{X.9.6.4}
$$
whenever the regulator $R_k$ is positive on the retained RG sector.
4. The local PCE adaptation equation is the natural-gradient flow generated by the PCE compression:
$$
\dot x
=
-\nabla_{\Pi_{\mathrm{PCE}}\mathfrak L_{\mathrm{PU}}\Pi_{\mathrm{PCE}}^*}V(x)
+\text{ND-RID noise}.
\tag{X.9.6.5}
$$

*Proof.* The closed-form representation theorem gives the unique operator $\mathfrak L_{\mathrm{PU}}$ satisfying (X.9.6.1). Restricting a form-compatible closed form to a closed orthogonal summand gives a closed restricted form on that summand, and its representing operator is the corresponding self-adjoint form-compression. Applying this to $\mathscr H_{\mathrm{field}}$ gives the quadratic field kernel, which by Proposition X.1 is $\Gamma^{(2)}$, proving (1). Applying it to the Appendix M perspective Dirichlet form gives the nonnegative diffusion form; the Markov generator is its negative operator representative, proving (2). The Wetterich equation depends only on the inverse regularized quadratic kernel on the retained RG sector, so replacing that kernel by the RG compression gives (X.9.6.4), proving (3). Finally, Appendix D writes slow adaptation as natural-gradient descent with respect to the metric or stiffness form controlling local perturbations. The PCE summand compression is exactly that metric representative, proving (4). ∎

**Corollary X.9.6c (No Redundant Flow Postulate).** On the closed finite-mode branch of Theorem X.9.6b, response, RG, measurement-perspective transport, and slow adaptation are not separate structures. They are different compressions or functional-calculus images of $\mathfrak L_{\mathrm{PU}}$.

*Proof.* Each listed operator is one of (X.9.6.2)–(X.9.6.5), hence is obtained from the same self-adjoint operator by projection, sign convention, or functional calculus. ∎

**Corollary X.9.6c.0 (RG Flow as PCE Coarse-Graining).** On the closed finite-mode branch of Theorem X.9.6b, the instantaneous FRG trace is determined by the RG compression and regulator. It is the partial logarithmic-determinant response to the regulator, with the compressed operator held constant in that derivative. A scale trajectory additionally requires its initial or renormalization conditions and a well-posed evolution for the scale-dependent operator:
$$
\partial_k\Gamma_k
=
\frac12\operatorname{STr}
\left[
\left(
\Pi_{\mathrm{RG}}\mathfrak L_{\mathrm{PU}}\Pi_{\mathrm{RG}}^*+R_k
\right)^{-1}
\partial_k R_k
\right].
\tag{X.9.6c.0}
$$

*Proof.* Equation (X.9.6.4) is item 3 of Theorem X.9.6b and determines the trace at each admitted scale from the stated compression and regulator. For a finite invertible matrix $A=L+R_k$, differentiating only the regulator dependence gives $\partial_k^{(R)}\log\det A=\operatorname{Tr}(A^{-1}\partial_kR_k)$, with the registered grading for a supertrace. This does not include $\partial_kL$ and does not specify an initial condition for $\Gamma_k$. A unique full scale trajectory follows only on the additional well-posed initial-value branch. ∎

**Definition X.9.6c.2 (PCE-Descent RG Description Manifold).** A PCE-descent RG description manifold is a finite regular chart
$$
\mathcal Y_k
=
\{\theta^i(k)\}_{i=1}^m
\tag{X.9.6c.2.1}
$$
of retained effective descriptions at scale $k$, equipped with:

1. the Fisher/QFI metric
$$
\mathcal G_{ij}(k,\theta);
\tag{X.9.6c.2.2}
$$

2. a beta vector field
$$
\beta^i(\theta,k):=\frac{d\theta^i}{d\log k};
\tag{X.9.6c.2.3}
$$

3. the RG one-form
$$
\omega_{\mathrm{RG}}
:=
-\mathcal G_{ij}\beta^j\,d\theta^i;
\tag{X.9.6c.2.4}
$$

4. a finite PCE compression potential $V_{\mathrm{RG}}(\theta,k)$ satisfying
$$
d_\theta V_{\mathrm{RG}}=\omega_{\mathrm{RG}}.
\tag{X.9.6c.2.5}
$$

The exactness condition (X.9.6c.2.5) is the PCE-descent gate for RG. In a simply connected chart it is equivalent to the finite curl-vanishing condition
$$
\partial_i(\mathcal G_{j\ell}\beta^\ell)
=
\partial_j(\mathcal G_{i\ell}\beta^\ell)
\qquad
\text{for all }i,j.
\tag{X.9.6c.2.6}
$$

**Theorem X.9.6c.3 (Renormalization Group Flow as PCE Descent).** On a PCE-descent RG description manifold,
$$
\beta^i
=
-\mathcal G^{ij}\partial_j V_{\mathrm{RG}}.
\tag{X.9.6c.3.1}
$$
Consequently the RG trajectory is the natural-gradient descent flow of the PCE compression potential:
$$
\frac{d}{d\log k}V_{\mathrm{RG}}(\theta(k),k)
=
-\mathcal G_{ij}\beta^i\beta^j
+
\partial_{\log k}V_{\mathrm{RG}}.
\tag{X.9.6c.3.2}
$$
On an autonomous scale chart,
$$
\frac{d}{d\log k}V_{\mathrm{RG}}
=
-\lVert\beta\rVert_{\mathcal G}^2
\le0.
\tag{X.9.6c.3.3}
$$
On a nonautonomous chart, the analogous monotonicity conclusion concerns the extended potential $\widetilde V$; it applies to $V_{\mathrm{RG}}$ only when the branch identifies its value along the lifted trajectories with $\widetilde V$ up to a constant. Assume the branch supplies an extended coordinate $s=\log k$, a positive metric $\widetilde{\mathcal G}$, and an extended potential $\widetilde V$ for which the full vector field $(\beta,1)$ satisfies
$$
(\beta,1)=-\operatorname{grad}_{\widetilde{\mathcal G}}\widetilde V.
$$
At any specified scale, the retained-coupling critical points satisfy
$$
\beta=0
\quad\Longleftrightarrow\quad
d_\theta V_{\mathrm{RG}}=0.
\tag{X.9.6c.3.4}
$$

*Proof.* Equation (X.9.6c.2.5) gives
$$
\partial_iV_{\mathrm{RG}}=-\mathcal G_{ij}\beta^j,
$$
and multiplication by $\mathcal G^{ki}$ proves (X.9.6c.3.1). The chain rule gives
$$
\frac{dV_{\mathrm{RG}}}{d\log k}
=
-\mathcal G_{ij}\beta^i\beta^j+\partial_{\log k}V_{\mathrm{RG}},
$$
which is (X.9.6c.3.2). If $\partial_{\log k}V_{\mathrm{RG}}=0$, positivity of $\mathcal G$ gives (X.9.6c.3.3). On the certified extended branch,
$$
\frac{d\widetilde V}{ds}
=
-\widetilde{\mathcal G}((\beta,1),(\beta,1))\le0.
$$
Finally, invertibility of the positive metric makes $\beta=-\mathcal G^{-1}d_\theta V_{\mathrm{RG}}$ equivalent to (X.9.6c.3.4). ∎

**Corollary X.9.6c.4 (RG Exactness Obstructions).** If
$$
d\omega_{\mathrm{RG}}\ne0,
$$
then no local PCE-descent potential exists on any neighborhood where this inequality holds. If $d\omega_{\mathrm{RG}}=0$, the global obstruction is the defined class
$$
[\omega_{\mathrm{RG}}]\in H^1_{\mathrm{dR}}(\mathcal Y_k),
\tag{X.9.6c.4.1}
$$
and a global potential exists if and only if this class vanishes.

*Proof.* If $\omega_{\mathrm{RG}}=dV$, then $d\omega_{\mathrm{RG}}=d^2V=0$, proving the local necessity. Conversely, the Poincare lemma gives a local potential for every closed one-form on a contractible chart. For a closed one-form on the full description manifold, the definition of de Rham cohomology gives $[\omega_{\mathrm{RG}}]=0$ exactly when $\omega_{\mathrm{RG}}$ is globally exact. Hence nonclosure is the local curl obstruction, whereas a nonzero class is the global obstruction for a closed form. ∎

**Remark X.9.6c.1 (Markov-Categorical Naturality Gate).** Theorem X.9.6b may be read as a Markov-categorical discipline without adding a new physical postulate. Let $\mathsf{PU}_{\mathrm{fin}}$ be the finite category whose objects are retained finite predictive interfaces and whose morphisms are PPI-admissible stochastic or CPTP update kernels, with tensor product given by independent interface composition. On the closed finite-mode branch, response, RG, perspective transport, measurement update, and slow PCE adaptation are functorial images of the same finite update kernel only when their compression diagrams commute.

Concretely, for any admissible coarse-graining $C_\ell$ and update kernel $K$, a proposed bridge functor $F_\alpha$ must satisfy the naturality square
$$
F_\alpha(C_\ell\circ K)
=
F_\alpha(C_\ell)\circ F_\alpha(K)
\tag{X.9.6c.1}
$$
on the retained branch domain. A new bridge law that fails (X.9.6c.1) is not a new physical sector; it is an incompatible representation of the closed predictive datum.

*Proof.* Theorem X.9.6b identifies the sector operators with specified compressions or functional-calculus images of $\mathfrak L_{\mathrm{PU}}$. Its reducing-sector hypotheses do not imply that arbitrary admitted stochastic or CPTP kernels intertwine those sector constructions. The present naturality gate separately requires that intertwining for each composable pair $(C_\ell,K)$. Once it is certified, the two composed sector maps agree, which is Equation (X.9.6c.1). Without it, the projection theorem remains valid but the proposed bridge is not certified as a functor on that kernel category. ∎

**Proposition X.9.6c.5 (Reducing-Summand Structure and Construction of the Master Operator).** Let $\alpha$ range over $\{\mathrm{field},\mathrm{RG},\Sigma,\mathrm{PCE}\}$.

1. Let $\mathfrak D_{\mathrm{PU}}$ satisfy the reducing hypotheses of Theorem X.9.6b, and let $L_\alpha$ be the part of $\mathfrak L_{\mathrm{PU}}$ in $\mathscr H_\alpha$. Then each $L_\alpha$ is nonnegative and self-adjoint with $\operatorname{Dom}(L_\alpha)=\Pi_\alpha\operatorname{Dom}(\mathfrak L_{\mathrm{PU}})$, and
$$
\mathfrak L_{\mathrm{PU}}=\bigoplus_\alpha L_\alpha,
\qquad
\mathcal D_{\mathrm{PU}}=\bigoplus_\alpha\operatorname{Dom}\bigl(L_\alpha^{1/2}\bigr),
\qquad
\mathscr Q_{\mathrm{PU}}(u,v)=\sum_\alpha\bigl\langle L_\alpha^{1/2}\Pi_\alpha u,L_\alpha^{1/2}\Pi_\alpha v\bigr\rangle,
\tag{X.9.6c.5.1}
$$
$$
\Pi_\alpha\mathfrak L_{\mathrm{PU}}\Pi_\alpha^*=L_\alpha,
\qquad
(\mathfrak L_{\mathrm{PU}}-z)^{-1}=\bigoplus_\alpha(L_\alpha-z)^{-1},
\qquad
\operatorname{spec}\mathfrak L_{\mathrm{PU}}=\bigcup_\alpha\operatorname{spec}L_\alpha,
\tag{X.9.6c.5.2}
$$
the resolvent identity holding for $z\notin\bigcup_\alpha\operatorname{spec}L_\alpha$. On a finite-mode branch the direct sum in (X.9.6c.5.1) is the sector decomposition of Proposition X.8a.5e, and the poles of the master resolvent are exactly the sector eigenvalues; each is a simple pole whose residue is minus the orthogonal eigenprojection of $\mathfrak L_{\mathrm{PU}}$, the direct sum of the sector eigenprojections for that eigenvalue.

2. Conversely, let $L_\alpha\ge0$ be self-adjoint on $\mathscr H_\alpha$ for each $\alpha$, with $L_\Sigma$ the operator of a Dirichlet form, $L_{\mathrm{RG}}+R_k$ boundedly invertible with a defined supertrace of $(L_{\mathrm{RG}}+R_k)^{-1}\partial_kR_k$, and $L_{\mathrm{PCE}}$ the Appendix D response metric. Then the form in (X.9.6c.5.1) is densely defined, nonnegative and closed, its operator is $\bigoplus_\alpha L_\alpha$, and the resulting closed predictive Dirichlet datum satisfies the reducing, domain-invariance, Dirichlet, regulator and response-metric hypotheses of Theorem X.9.6b with sector compressions $L_\alpha$. When the $L_\alpha$ are the quadratic field kernel, the RG-sector kernel, the operator of the Appendix M perspective diffusion form and the Appendix D response metric of a finite-mode branch, the datum represents those four sector forms and satisfies every hypothesis of Theorem X.9.6b; for strictly positive finite sector operators this is item 3 of Proposition X.8a.5e.

3. Consequently the closed predictive Dirichlet data satisfying the hypotheses of Theorem X.9.6b are exactly the direct sums of four admissible sector operators, and the master operator carries exactly those four operators; this extends Proposition X.8a.5e to nonnegative sector operators given by closed forms. As there, an off-diagonal coupling block lies outside the reducing hypotheses, and a cross-sector relation among the $L_\alpha$, such as a shared spectral value, a common regulator or a common normalization, requires a separately registered datum.

*Proof.* Item 1. Proposition X.8a.5e proves the decomposition in finite dimension; the following argument also covers unbounded sector operators. The reducing hypothesis states that $\Pi_\alpha\operatorname{Dom}(\mathfrak L_{\mathrm{PU}})\subseteq\operatorname{Dom}(\mathfrak L_{\mathrm{PU}})$ and $\Pi_\alpha\mathfrak L_{\mathrm{PU}}u=\mathfrak L_{\mathrm{PU}}\Pi_\alpha u$ on $\operatorname{Dom}(\mathfrak L_{\mathrm{PU}})$. Since the $\Pi_\alpha$ are mutually orthogonal projections with sum $I$, every $u\in\operatorname{Dom}(\mathfrak L_{\mathrm{PU}})$ is $\sum_\alpha\Pi_\alpha u$ with each term in the domain, and $\mathfrak L_{\mathrm{PU}}u=\sum_\alpha L_\alpha\Pi_\alpha u$. Each $L_\alpha$ is symmetric and nonnegative. For nonreal $z$, $\mathfrak L_{\mathrm{PU}}-z$ is a bijection of $\operatorname{Dom}(\mathfrak L_{\mathrm{PU}})$ onto $\mathscr H_{\mathrm{PU}}$ commuting with $\Pi_\alpha$, so $L_\alpha-z$ maps $\Pi_\alpha\operatorname{Dom}(\mathfrak L_{\mathrm{PU}})$ onto $\mathscr H_\alpha$; a symmetric operator with $\operatorname{ran}(L_\alpha\mp i)=\mathscr H_\alpha$ is self-adjoint. For $f\in\mathscr H_{\mathrm{PU}}$ and $u=(\mathfrak L_{\mathrm{PU}}-z)^{-1}f$, the reducing relation gives $(\mathfrak L_{\mathrm{PU}}-z)\Pi_\alpha u=\Pi_\alpha f$, so the resolvent commutes with every $\Pi_\alpha$ and is the direct sum of the sector resolvents. With finitely many sectors, $z$ lies in the resolvent set of $\mathfrak L_{\mathrm{PU}}$ exactly when it lies in the resolvent set of every $L_\alpha$, which gives the spectrum formula. Functional calculus respects the reducing decomposition, so $\mathfrak L_{\mathrm{PU}}^{1/2}=\bigoplus_\alpha L_\alpha^{1/2}$, and the representation theorem for closed nonnegative forms identifies $\mathscr Q_{\mathrm{PU}}$ with $\langle\mathfrak L_{\mathrm{PU}}^{1/2}u,\mathfrak L_{\mathrm{PU}}^{1/2}v\rangle$ on $\mathcal D_{\mathrm{PU}}=\operatorname{Dom}(\mathfrak L_{\mathrm{PU}}^{1/2})$, which gives (X.9.6c.5.1). The restricted form on $\mathscr H_\alpha$ is the form of $L_\alpha$, so its representing operator, the compression in (X.9.6c.5.2), is $L_\alpha$. On a finite-mode branch, $(\mathfrak L_{\mathrm{PU}}-z)^{-1}=\sum_\lambda(\lambda-z)^{-1}E_\lambda$ over the distinct eigenvalues with orthogonal eigenprojections $E_\lambda$, and block diagonality makes $E_\lambda$ the direct sum of the sector eigenprojections.

Item 2. A finite direct sum of nonnegative self-adjoint operators on orthogonal summands is nonnegative and self-adjoint on the direct sum of their domains. Its form is the sum in (X.9.6c.5.1) on $\bigoplus_\alpha\operatorname{Dom}(L_\alpha^{1/2})$, which is dense, and it is closed because its form norm is the direct sum of the complete form norms of the summands. Each $\Pi_\alpha$ reduces the direct sum with invariant form and operator domains, the restricted forms are the given sector forms, so the perspective restriction is Dirichlet, the RG compression plus $R_k$ is the given invertible operator, and the PCE compression is the given metric. These are the reducing, domain-invariance, Dirichlet, regulator and response-metric hypotheses of Theorem X.9.6b, and when the $L_\alpha$ are the four branch sector operators the restricted forms are the four sector forms, which is its representation hypothesis.

Item 3 combines items 1 and 2. ∎

**Corollary X.9.6d (Predictive Resonance Spectrum).** Let $\mathcal L_{\mathrm{PCE}}$ be the finite active ND-RID/PCE transfer generator obtained from the appropriate Markov or response compression of $\mathfrak L_{\mathrm{PU}}$ in Theorem X.9.6b, with faithful stationary PCE/KMS state $\rho_*$. Define the predictive resonance set by the poles of the finite resolvent
$$
R_{\mathrm{PCE}}(z)
=
(z-\mathcal L_{\mathrm{PCE}})^{-1}.
\tag{X.9.6.6}
$$
Then:

1. $0\in\operatorname{Res}_{\mathrm{PU}}$. If $\mathcal L_{\mathrm{PCE}}$ is the Heisenberg generator of a primitive unital semigroup, then
$$
\ker\mathcal L_{\mathrm{PCE}}=\operatorname{span}\{I\},
\qquad
\ker\mathcal L_{\mathrm{PCE}}^*=\operatorname{span}\{\rho_*\}.
$$
Thus the observable zero mode is represented by $I$, while the dual stationary-state zero mode is represented by $\rho_*$.

2. Every nonzero resonance $\lambda$ satisfies
$$
\operatorname{Re}\lambda<0
\tag{X.9.6.7}
$$
on the primitive dissipative quotient.

3. For centered observables $A,B$ in the finite active algebra, the connected response correlation has the finite resonance expansion
$$
C_{AB}(t)
=
\langle A,e^{t\mathcal L_{\mathrm{PCE}}}B\rangle_{\rho_*,c}
=
\sum_{\lambda\in\operatorname{Res}_{\mathrm{PU}}}
e^{\lambda t}
P_{\lambda}^{AB}(t),
\tag{X.9.6.8}
$$
where each $P_{\lambda}^{AB}$ is a polynomial of degree at most one less than the largest Jordan block at $\lambda$, with the zero polynomial also allowed. On a detailed-balance normal branch, the polynomials are constants.

4. The spectral gap
$$
\gamma_{\mathrm{PCE}}
:=
-\max_{\lambda\ne0}\operatorname{Re}\lambda
\tag{X.9.6.9}
$$
is the finite predictive mixing rate. For every $0<\eta<\gamma_{\mathrm{PCE}}$ there is a finite constant $K_{AB,\eta}$ such that
$$
|C_{AB}(t)|\le K_{AB,\eta}e^{-(\gamma_{\mathrm{PCE}}-\eta)t}.
\tag{X.9.6.10}
$$

5. If the branch supplies a quotient isomorphism $U$ from retained Hodge currents to the active transfer space satisfying $U\Delta_{\mathrm{PU}}=-\mathcal L_{\mathrm{PCE}}U$, then Hodge harmonic modes correspond exactly to protected transfer zero modes. For a simple isolated zero mode, choose right and left eigenvectors $v,w$ with $w^*v=1$. A perturbation $-\eta D$ gives a negative-real-part first-order resonance shift when $\operatorname{Re}(w^*Dv)>0$. On a self-adjoint branch this reduces to a positive expectation in a unit eigenvector.

6. Any transport pole, linear-response pole, memory lifetime, or finite OTOC linearization expressible as a Laplace transform of an active MPU correlation has poles contained in $\operatorname{Res}_{\mathrm{PU}}$.

*Proof.* In finite dimension the resolvent $(z-\mathcal L_{\mathrm{PCE}})^{-1}$ is meromorphic, and its poles are exactly the eigenvalues of $\mathcal L_{\mathrm{PCE}}$, with pole order equal to Jordan-block size. Since $\rho_*$ is stationary,
$$
\mathcal L_{\mathrm{PCE}}^*(\rho_*)=0,
$$
so $0$ is a resonance. If the active quotient is primitive, primitivity itself gives a unique faithful stationary state and a one-dimensional stationary eigenspace. Theorem G.1.9.1 supplies one sufficient primitive construction only on the optional active-support refresh branch of Definition G.1.9.1a.

Strict convergence of the primitive finite-dimensional semigroup on the quotient implies that every nonzero spectral value has negative real part. A nonzero eigenvalue with positive real part would generate a growing mode; one with zero real part would generate a nondecaying oscillatory mode; and a nontrivial Jordan block at zero would generate polynomial growth. Each contradicts convergence to the unique stationary state. Hence (X.9.6.7) holds.

The Jordan decomposition of the finite matrix $\mathcal L_{\mathrm{PCE}}$ gives
$$
e^{t\mathcal L_{\mathrm{PCE}}}
=
\sum_{\lambda}
e^{\lambda t}
\sum_{r=0}^{m_\lambda-1}
\frac{t^r}{r!}N_{\lambda}^{r}P_\lambda,
$$
where $P_\lambda$ is the spectral projection and $N_\lambda$ is the nilpotent part on the generalized eigenspace. Pairing this identity with centered observables $A,B$ gives (X.9.6.8). If the generator is normal in the KMS/GNS inner product, then every Jordan block is size one and the polynomials are constants.

The decay bound follows from (X.9.6.8): the largest nonzero real part is $-\gamma_{\mathrm{PCE}}$, and every polynomial factor is bounded by a constant times $e^{\eta t}$ for any fixed $\eta>0$. This proves (X.9.6.10).

For item 5, assume a branch map $U$ from the Hodge current space to the active transfer space satisfying
$$
U\Delta_{\mathrm{PU}}= -\mathcal L_{\mathrm{PCE}}U
$$
on the retained quotient and inducing an isomorphism of the relevant zero-mode spaces. Then Hodge harmonic modes map to transfer zero modes, and the converse follows from injectivity on the quotient. For a simple isolated zero eigenvalue, let $v,w$ be right and left eigenvectors normalized by $w^*v=1$. Under a perturbation $-\eta D$, the first-order shift is $-\eta w^*Dv$. A negative real shift therefore requires $\operatorname{Re}(w^*Dv)>0$. On a self-adjoint branch, $w=v$ for a unit eigenvector, and a positive ordinary expectation suffices. No sign claim is made without the appropriate leakage certificate. Finally, Laplace transforms of the finite expansion (X.9.6.8) have poles only at its resonance values, proving item 6. ∎

**Corollary X.9.6d.1 (Real Resonances on the Compression Branch).** In Corollary X.9.6d, suppose that
$$
\mathcal L_{\mathrm{PCE}}
=
-T\bigl(P\mathfrak L_{\mathrm{PU}}P^*\bigr)T^{-1}
\tag{X.9.6d.1.1}
$$
for a branch-determined finite projection or form-compression $P$ of the master operator and an invertible linear map $T$ from the compressed space onto the active transfer space; $T$ is the identity when the generator is the compression itself, as in (X.9.6.3). Then:

1. $\operatorname{Res}_{\mathrm{PU}}\subset(-\infty,0]$, $\mathcal L_{\mathrm{PCE}}$ is diagonalizable, and every $P_\lambda^{AB}$ in (X.9.6.8) is constant, so $C_{AB}(t)$ is a finite sum of real exponentials $e^{\lambda t}$ with $\lambda\le0$ and carries no oscillatory resonance.

2. If $T$ is unitary onto the centered active space with its KMS/GNS inner product, then $\mathcal L_{\mathrm{PCE}}$ is self-adjoint in that inner product, the detailed-balance normal clause of Corollary X.9.6d applies, and
$$
C_{AA}(t)
=
\sum_{\lambda\in\operatorname{Res}_{\mathrm{PU}}}e^{\lambda t}\lVert E_\lambda A\rVert_{\rho_*}^2
\tag{X.9.6d.1.2}
$$
with orthogonal eigenprojections $E_\lambda$, so $C_{AA}$ is completely monotone: $(-1)^n\frac{d^n}{dt^n}C_{AA}(t)\ge0$ for every $n\ge0$ and $t\ge0$.

3. A generator with a nonreal eigenvalue or a Jordan block of size at least two admits no representation (X.9.6d.1.1). The primitive three-state Markov generator with unit rates $1\to2\to3\to1$,
$$
Q=
\begin{pmatrix}
-1&1&0\\
0&-1&1\\
1&0&-1
\end{pmatrix},
\tag{X.9.6d.1.3}
$$
generates a primitive unital semigroup with the uniform faithful stationary state and has resonances $0$ and $-\tfrac32\pm\tfrac{\sqrt3}{2}i$; it therefore meets the primitivity, unitality and faithful-stationarity structure used in items 1–4 of Corollary X.9.6d while lying outside the form (X.9.6d.1.1).

*Proof.* The compression $P\mathfrak L_{\mathrm{PU}}P^*$ is the operator of a restricted closed nonnegative form on a finite space, hence a nonnegative self-adjoint matrix, unitarily diagonalizable with nonnegative eigenvalues. Similarity by $T$ preserves eigenvalues and Jordan structure, so $\mathcal L_{\mathrm{PCE}}$ is diagonalizable with spectrum in $(-\infty,0]$. In the Jordan expansion used in the proof of Corollary X.9.6d every nilpotent part vanishes, so every $P_\lambda^{AB}$ is constant, proving item 1. Under the unitary hypothesis of item 2, $\mathcal L_{\mathrm{PCE}}$ is unitarily equivalent to a nonpositive self-adjoint matrix, hence self-adjoint and normal in the KMS/GNS inner product with orthogonal eigenprojections, and $C_{AA}(t)=\langle A,e^{t\mathcal L_{\mathrm{PCE}}}A\rangle_{\rho_*,c}$ expands as (X.9.6d.1.2). Each $e^{\lambda t}$ with $\lambda\le0$ satisfies $(-1)^n\frac{d^n}{dt^n}e^{\lambda t}=|\lambda|^ne^{\lambda t}\ge0$, and a nonnegative combination preserves these inequalities. Item 3 is the contrapositive of item 1 together with a computation: $Q=-I+S_{\mathrm{cyc}}$, where $S_{\mathrm{cyc}}$ is the cyclic permutation matrix with eigenvalues $1,\omega,\omega^2$ and $\omega=e^{2\pi i/3}$, so the eigenvalues of $Q$ are $0$ and $\omega-1,\omega^2-1=-\tfrac32\pm\tfrac{\sqrt3}{2}i$. Every row of $Q$ sums to zero, so $Q\mathbf1=0$ and the semigroup is unital; every column also sums to zero, so the uniform distribution is stationary; and $e^{tQ}$ has strictly positive entries for $t>0$ because the transition graph is a directed cycle, which makes the semigroup primitive. ∎

**Resolution TV-X-18-R1 (Metadata).** Exact domain: closed predictive Dirichlet data satisfying the reducing hypotheses of Theorem X.9.6b, with possibly unbounded sector operators in Proposition X.9.6c.5, and finite transfer generators of the form (X.9.6d.1.1) in Corollary X.9.6d.1. Premises: the reducing and domain-invariance hypotheses, the representation theorem for closed nonnegative forms, and the sector conditions of item 2 of Proposition X.9.6c.5. Equivalence: equality of operators and forms on the common carrier; similarity of finite generators. Budget: four sector operators, one direct sum, one similarity map and one finite spectral decomposition. Verifier: operator-theoretic identities and exact finite spectral computation. Falsifier: a datum satisfying the reducing hypotheses with a nonzero off-diagonal block, a sector compression different from the part of $\mathfrak L_{\mathrm{PU}}$ in that sector, or a generator of the form (X.9.6d.1.1) with a nonreal eigenvalue or a nontrivial Jordan block. Provenance class: source-internal mathematics. Downstream consumers: Definition X.9.6a, Theorem X.9.6b, Corollaries X.9.6c, X.9.6d and X.9.6e, Definition X.9.6h and `TV-X-18`. Nonvacuity: $L_{\mathrm{field}}=(1)$, $L_{\mathrm{RG}}=(2)$, the Dirichlet form $(u_1-u_2)^2$ with $L_\Sigma=\begin{pmatrix}1&-1\\-1&1\end{pmatrix}$, and $L_{\mathrm{PCE}}=(3)$ assemble into a master operator whose resolvent has simple poles at $0,1,2,3$, the residue at $2$ being minus the sum of the RG and perspective eigenprojections; the generator (X.9.6d.1.3) witnesses item 3. Proposition X.9.6c.5 gives `positive-discharge` of the construction-and-verification component of `TV-X-18` for every admissible sector quadruple, covering sector domains, compressions, resolvents and resolvent poles; Corollary X.9.6d.1 proves that compression-branch resonances are real and nonpositive, and its example (X.9.6d.1.3) gives `nonentailment` of the compression form (X.9.6d.1.1) from primitivity, unitality and faithful stationarity. Population of the four PU sector operators on one carrier, namely $\Gamma^{(2)}$, the Wetterich RG compression with its regulator $R_k$, the Appendix M perspective Dirichlet form and the Appendix D PCE metric (`C`), and their physical realization (`R`) remain live under `TV-X-18`.

**Corollary X.9.6e (Spectral-Ledger Non-Duplication).** Let $c$ be a scalar branch datum claimed to be PU-internal on the closed finite-mode branch and claimed to arise from a heat trace, zeta determinant, eta invariant, finite resolvent trace, or finite spectral action term. Then $c$ must be expressible as
$$
c
=
\mathcal N\!\left(
\left\{
\operatorname{Tr}_{\mathrm{ren}}
f_j\!\left(
P_j\mathfrak L_{\mathrm{PU}}P_j^*
\right)
\right\}_{j=1}^{m}
\right),
\tag{X.9.6.11}
$$
where each $P_j$ is a projection or form-compression determined by the closed predictive Dirichlet datum $\mathfrak D_{\mathrm{PU}}$, each $f_j$ is fixed before validation comparison, $\operatorname{Tr}_{\mathrm{ren}}$ denotes the ordinary finite trace or the already specified heat/zeta finite part, and $\mathcal N$ is a fixed algebraic normalization map. If no such compression and finite-part prescription is specified, then $c$ is not theorem-level PU-internal and must be recorded as branch, model, or validation input. If two branch scalars use the same compression and the same spectral functional, they are the same ledger datum; if they use orthogonal finite compressions, their trace contributions add for the direct sum of the compressed operators. Identifying that sum with the trace of the same function of the original operator additionally requires the projections to reduce that operator and the included sectors to cover the stated subspace.

*Proof.* By Theorem X.9.6b, every response Hessian, RG kernel, perspective generator, and PCE flow operator on the closed finite-mode branch is a projection, sign convention, or functional-calculus image of the unique self-adjoint operator $\mathfrak L_{\mathrm{PU}}$ associated with $\mathfrak D_{\mathrm{PU}}$. The spectral theorem then fixes $f(P\mathfrak L_{\mathrm{PU}}P^*)$ uniquely for every specified compression $P$ and Borel or holomorphic function $f$ in its domain. Ordinary finite traces are basis-independent. Heat/zeta finite parts are also fixed once the operator, subtraction order, scale, and finite-part convention are fixed. Therefore a scalar claimed to be derived from such spectral data is PU-internal only when its compression and finite-part prescription are part of the branch datum, yielding (X.9.6.11). Equality of the compression and functional gives equality of the spectral value by uniqueness of functional calculus. Orthogonality of compressions gives additivity of traces on direct sums. ∎

**Definition X.9.6f (Predictive Spectral-Response Datum).** On the closed finite-mode branch of Theorem X.9.6b, a predictive spectral-response datum is a tuple
$$
\mathfrak S_{\mathrm{PU}}
=
(\mathfrak A_{\mathrm{res}},\mathscr H_{\mathrm{spin}},D_{\mathrm{PU}},J_{\mathrm{PU}},\Gamma_{\mathrm{PU}},\iota)
\tag{X.9.6.12}
$$
with the following data.

1. $\mathfrak A_{\mathrm{res}}$ is the finite involutive algebra generated by retained protocol projectors, finite internal block labels, and finite response-compatible gauge-frame labels after the PPI quotient.

2. $\iota:\mathfrak A_{\mathrm{res}}\to\mathcal B(\mathscr H_{\mathrm{spin}})$ is a faithful $*$-representation on a finite retained spin-interface submodule
$$
\mathscr H_{\mathrm{spin}}\subseteq\mathscr H_{\mathrm{field}}\subseteq\mathscr H_{\mathrm{PU}}.
$$

3. $D_{\mathrm{PU}}=D_{\mathrm{PU}}^*$ is a finite self-adjoint response operator on $\mathscr H_{\mathrm{spin}}$ whose square is the retained first-order factor of the field-response compression:
$$
D_{\mathrm{PU}}^2
=
\Pi_{\mathrm{spin}}
\mathfrak L_{\mathrm{PU}}
\Pi_{\mathrm{spin}}^*
-
V_{\mathrm{0}},
\tag{X.9.6.13}
$$
where $V_{\mathrm{0}}$ is the finite scalar or block-diagonal zero-order response term already present in the branch ledger. When no first-order factorization is supplied, the datum is not accepted as a spectral-response datum.

4. $J_{\mathrm{PU}}$ is an antiunitary real-structure operator and $\Gamma_{\mathrm{PU}}=\Gamma_{\mathrm{PU}}^*=\Gamma_{\mathrm{PU}}^{-1}$ is a grading satisfying
$$
J_{\mathrm{PU}}^2=\epsilon,
\qquad
J_{\mathrm{PU}}D_{\mathrm{PU}}=\epsilon' D_{\mathrm{PU}}J_{\mathrm{PU}},
\qquad
J_{\mathrm{PU}}\Gamma_{\mathrm{PU}}=\epsilon''\Gamma_{\mathrm{PU}}J_{\mathrm{PU}},
\qquad
\Gamma_{\mathrm{PU}}D_{\mathrm{PU}}+D_{\mathrm{PU}}\Gamma_{\mathrm{PU}}=0,
\qquad
[\Gamma_{\mathrm{PU}},\iota(a)]=0
\tag{X.9.6.14}
$$
for every $a\in\mathfrak A_{\mathrm{res}}$ on the even branch, with $\epsilon,\epsilon',\epsilon''\in\{\pm1\}$ recorded by the finite KO-ledger.

5. The order-zero and first-order response conditions hold:
$$
[\iota(a),J_{\mathrm{PU}}\iota(b)^*J_{\mathrm{PU}}^{-1}]=0,
\tag{X.9.6.15}
$$
and
$$
[[D_{\mathrm{PU}},\iota(a)],J_{\mathrm{PU}}\iota(b)^*J_{\mathrm{PU}}^{-1}]=0
\tag{X.9.6.16}
$$
for all $a,b\in\mathfrak A_{\mathrm{res}}$.

6. The datum is one-form complete on the stated spectral branch: every retained gauge-connection or finite internal-link carrier in this branch is represented, after the PPI quotient, by a self-adjoint element of the real one-form span defined below. A response-changing carrier outside this span is not part of the same spectral-response branch and must be recorded as a distinct finite branch.

The finite one-form space of the datum is
$$
\Omega^1_{D_{\mathrm{PU}}}(\mathfrak A_{\mathrm{res}})
=
\left\{
\sum_i \iota(a_i)[D_{\mathrm{PU}},\iota(b_i)]:
a_i,b_i\in\mathfrak A_{\mathrm{res}}
\right\}.
\tag{X.9.6.17}
$$

**Theorem X.9.6f.1 (Predictive Spectral Triple Descent).** Every predictive spectral-response datum $\mathfrak S_{\mathrm{PU}}$ satisfying Definition X.9.6f is a finite real even spectral triple in the response quotient. Its real self-adjoint inner fluctuations are
$$
D_{\mathrm{PU},A}
=
D_{\mathrm{PU}}+A+\epsilon'J_{\mathrm{PU}}AJ_{\mathrm{PU}}^{-1},
\qquad
A=A^*\in\Omega^1_{D_{\mathrm{PU}}}(\mathfrak A_{\mathrm{res}}).
\tag{X.9.6.18}
$$
Under the one-form-completeness certificate, these are exactly the retained finite gauge-connection and internal-link carriers on that branch.

*Proof.* Finite dimensionality makes the representation and all commutators bounded and makes the resolvent of $D_{\mathrm{PU}}$ compact. Faithfulness, the grading identities in (X.9.6.14), and the order-zero and first-order identities (X.9.6.15)–(X.9.6.16) give the finite real even spectral-triple axioms. If $A=A^*$, antiunitarity of $J_{\mathrm{PU}}$ and reality of $\epsilon'$ give
$$
(\epsilon'J_{\mathrm{PU}}AJ_{\mathrm{PU}}^{-1})^*
=
\epsilon'J_{\mathrm{PU}}AJ_{\mathrm{PU}}^{-1},
$$
so $D_{\mathrm{PU},A}$ is self-adjoint. For a unitary $u\in\mathfrak A_{\mathrm{res}}$, the order-zero and first-order conditions give
$$
UD_{\mathrm{PU},A}U^*
=
D_{\mathrm{PU}}+A^u+\epsilon'J_{\mathrm{PU}}A^uJ_{\mathrm{PU}}^{-1},
\tag{X.9.6.19}
$$
where
$$
U=\iota(u)J_{\mathrm{PU}}\iota(u)J_{\mathrm{PU}}^{-1},
\qquad
A^u=\iota(u)A\iota(u)^*+\iota(u)[D_{\mathrm{PU}},\iota(u)^*].
\tag{X.9.6.20}
$$
Thus the fluctuation law is gauge covariant for either KO sign. The graph and finite internal-matrix interpretations follow by evaluating the commutators in the corresponding represented algebra. Conversely, the one-form-completeness condition states that every retained carrier on this branch has this form; Corollary P.6.1b.8 excludes response-null surplus when a comparator preserves the separating, protocol-complete response record and all other charged entries while strictly reducing complete cost, and a response-active carrier outside the span belongs to a distinct branch. ∎

**Corollary X.9.6f.2 (No Independent Gauge-Higgs Carrier on a Closed Spectral Branch).** On a branch satisfying Definition X.9.6f, the gauge connection, finite Higgs/internal-link sector, and first-order matter response are not independent carriers. They are projections of one finite spectral-response datum:
$$
(\mathfrak A_{\mathrm{res}},\mathscr H_{\mathrm{spin}},D_{\mathrm{PU}},J_{\mathrm{PU}},\Gamma_{\mathrm{PU}}).
\tag{X.9.6.21}
$$

*Proof.* Theorem X.9.6f.1 shows that connection variables and finite internal links are exactly self-adjoint inner fluctuations of $D_{\mathrm{PU}}$. The matter response is represented on the same $\mathscr H_{\mathrm{spin}}$, and the real and chiral structures are part of the same datum. Corollary P.6.1b.8 excludes an additional carrier only when its removal is admissible, preserves the separating, protocol-complete response record and the other charged entries, and strictly lowers complete cost. ∎

**Definition X.9.6g (Master Zeta-Index Ledger).** On the closed finite-mode branch of Theorem X.9.6b, a master zeta-index ledger is a finite family
$$
\mathfrak Z_{\mathrm{PU}}
=
\left(
\{P_j,\sigma_j,\mu_j,B_{j1},\ldots,B_{jr}\}_{j=1}^N,
\{Q_\ell,\tau_\ell,F_{\ell0},C_{\ell1},\ldots,C_{\ell r}\}_{\ell=1}^{N_\eta}
\right)
\tag{X.9.6.22}
$$
where:

1. $P_j$ and $Q_\ell$ are finite branch-determined projections or form-compressions of $\mathfrak L_{\mathrm{PU}}$.

2. $\sigma_j,\tau_\ell\in\{\pm1\}$ are bosonic/fermionic or orientation signs fixed by the branch ledger.

3. $\mu_j>0$ is a fixed infrared regulator for zero modes, removed only by an explicitly stated finite-part prescription.

4. $B_{ja}=B_{ja}^*$ are fixed finite response perturbation matrices.

5. $F_{\ell0}=F_{\ell0}^*$ and $C_{\ell a}=C_{\ell a}^*$ are fixed finite Dirac-type response matrices, with
$$
F_\ell(\mathbf t)=F_{\ell0}+\sum_{a=1}^r t_a C_{\ell a}.
$$
Zero modes are omitted in the eta trace unless a zero-mode insertion rule is explicitly supplied.

For $\mathbf t=(t_1,\ldots,t_r)$ in an open chamber where every
$$
L_j(\mathbf t)
=
P_j\mathfrak L_{\mathrm{PU}}P_j^*
+
\mu_j I
+
\sum_{a=1}^r t_aB_{ja}
\tag{X.9.6.23}
$$
is positive, define
$$
\zeta_{\mathrm{PU}}(s;\mathbf t)
=
\sum_{j=1}^N
\sigma_j\operatorname{Tr}\left(L_j(\mathbf t)^{-s}\right),
\tag{X.9.6.24}
$$
$$
\log\det_{\mathrm{PU}}(\mathbf t)
=
-\left.\frac{\partial}{\partial s}\zeta_{\mathrm{PU}}(s;\mathbf t)\right|_{s=0},
\tag{X.9.6.25}
$$
and
$$
\eta_{\mathrm{PU}}(s;\mathbf t)
=
\sum_{\ell=1}^{N_\eta}
\tau_\ell
\operatorname{Tr}'\left(
F_\ell(\mathbf t)|F_\ell(\mathbf t)|^{-s-1}
\right),
\tag{X.9.6.26}
$$
where $\operatorname{Tr}'$ omits zero modes according to the stated zero-mode ledger.

**Theorem X.9.6g.1 (Single Master Zeta-Index Ledger).** On a branch carrying $\mathfrak Z_{\mathrm{PU}}$, a dimensionless scalar belongs to the aggregate zeta-index projection class only when an accepted factorization certificate expresses it as
$$
c
=
\mathcal N_c
\left(
\operatorname{FP}_{s=s_1}\partial_{\mathbf t}^{\alpha_1}\zeta_{\mathrm{PU}}(s;\mathbf t)\big|_{\mathbf t=\mathbf t_c},
\ldots,
\partial_{\mathbf t}^{\alpha_m}\log\det_{\mathrm{PU}}(\mathbf t)\big|_{\mathbf t=\mathbf t_c},
\eta_{\mathrm{PU}}(0;\mathbf t_c)
\right),
\tag{X.9.6.27}
$$
with all projections, signs, zero-mode rules, finite-part prescriptions, chamber choices, and normalization map $\mathcal N_c$ fixed before validation comparison. On any chamber where the spectra remain separated from zero, mixed derivatives commute:
$$
\partial_{t_a}\partial_{t_b}\log\det_{\mathrm{PU}}(\mathbf t)
=
\partial_{t_b}\partial_{t_a}\log\det_{\mathrm{PU}}(\mathbf t),
\tag{X.9.6.28}
$$
and the same commutation holds for every finite $\zeta_{\mathrm{PU}}$ and $\eta_{\mathrm{PU}}$ derivative appearing in (X.9.6.27). A proposed numerical certificate violating these integrability identities is rejected as non-PU-internal on that branch.

*Proof.* Each $L_j(\mathbf t)$ is a finite positive matrix on the stated chamber. Hence it has finitely many positive eigenvalues $\lambda_{jm}(\mathbf t)$, counted with multiplicity, and
$$
\operatorname{Tr}\left(L_j(\mathbf t)^{-s}\right)
=
\sum_m e^{-s\log\lambda_{jm}(\mathbf t)}.
$$
This is an entire function of $s$ and a smooth function of $\mathbf t$ on the chamber. Equation (X.9.6.25) gives
$$
\log\det_{\mathrm{PU}}(\mathbf t)
=
\sum_{j,m}\sigma_j\log\lambda_{jm}(\mathbf t),
$$
with the stated finite-part convention for zero-mode removal. The eta trace is also a finite sum over nonzero eigenvalues of $F_\ell(\mathbf t)$ on any chamber where the zero-mode ledger is fixed. Therefore all derivatives in (X.9.6.27) are derivatives of finite smooth functions on the chamber, and mixed partial derivatives commute.

Corollary X.9.6e requires each spectral scalar to use registered compressed operators, spectral functions, and normalization data. It does not ensure that a sum of signed sector traces retains every sector value. The additional factorization certificate identifies a scalar in the present aggregate class with Equation (X.9.6.27); sector-resolved functionals remain available under Corollary X.9.6e when this aggregate representation is not certified. Since noncommuting mixed derivatives cannot occur for the finite smooth ledger functions just described, any certificate producing them is incompatible with the claimed single-ledger origin. ∎

**Theorem X.9.6g.1a (Net Spectral Measure of the Aggregate Ledger).** On an open chamber of Definition X.9.6g on which every $L_j(\mathbf t)$ is positive, define the finitely supported integer-valued measures
$$
\nu_{\mathbf t}
=
\sum_{j=1}^N\sigma_j\sum_{\lambda\in\operatorname{spec}L_j(\mathbf t)}\delta_\lambda,
\qquad
\nu^\eta_{\mathbf t}
=
\sum_{\ell=1}^{N_\eta}\tau_\ell\sum_{\mu\in\operatorname{spec}'F_\ell(\mathbf t)}\delta_\mu,
\tag{X.9.6g.1a.1}
$$
with eigenvalues repeated by multiplicity and $\operatorname{spec}'$ the nonzero spectrum retained by the zero-mode ledger. Then:

1. $\zeta_{\mathrm{PU}}(s;\mathbf t)=\int\lambda^{-s}\,d\nu_{\mathbf t}(\lambda)$, $\log\det_{\mathrm{PU}}(\mathbf t)=\int\log\lambda\,d\nu_{\mathbf t}(\lambda)$, and $\eta_{\mathrm{PU}}(s;\mathbf t)=\int\operatorname{sign}(\mu)|\mu|^{-s}\,d\nu^\eta_{\mathbf t}(\mu)$.

2. For fixed $\mathbf t$, the values of $\zeta_{\mathrm{PU}}(\cdot;\mathbf t)$ on any subset of $\mathbb C$ with a finite accumulation point determine $\nu_{\mathbf t}$, and the values of $\eta_{\mathrm{PU}}(\cdot;\mathbf t)$ on such a set determine exactly the odd part $r\mapsto\nu^\eta_{\mathbf t}(\{r\})-\nu^\eta_{\mathbf t}(\{-r\})$, $r>0$.

3. With the finite-part prescriptions, zero-mode ledgers, chamber choices and normalization maps held fixed, every scalar of the aggregate form (X.9.6.27) at $\mathbf t_c$ is a function of the germs at $\mathbf t_c$ of $\mathbf t\mapsto\nu_{\mathbf t}$ and of the odd part of $\nu^\eta_{\mathbf t}$. Two master zeta-index ledgers with equal germs therefore have equal aggregate projections, whatever their sector decompositions.

4. On a class of ledgers sharing one normalization map, a sector scalar admits a factorization certificate (X.9.6.27) only if it takes equal values on ledgers of the class with equal germs. For the one-parameter ledger $A$ with one sector, $\sigma_1=+1$ and $L_1(t)=\operatorname{diag}(1+t,2+t)$, and the ledger $B$ with $\sigma_1=+1$, $L_1(t)=\operatorname{diag}(1+t,2+t,3+t)$, $\sigma_2=-1$ and $L_2(t)=(3+t)$, the net measures agree for every $t>-1$, while the sector-one log-determinants $\log(1+t)+\log(2+t)$ and $\log(1+t)+\log(2+t)+\log(3+t)$ differ; on any class containing both ledgers the sector-one log-determinant is therefore not an aggregate scalar and remains available from sector-resolved data under Corollary X.9.6e.

*Proof.* Item 1. Each $L_j(\mathbf t)$ is a positive matrix, so $\operatorname{Tr}L_j(\mathbf t)^{-s}$ is the sum of $\lambda^{-s}$ over its eigenvalues; summing with the signs $\sigma_j$ gives the first identity, and applying $-\partial_s$ at $s=0$ to $\lambda^{-s}$ gives $\log\lambda$. An eigenvalue $\mu\ne0$ of $F_\ell(\mathbf t)$ contributes $\mu|\mu|^{-s-1}=\operatorname{sign}(\mu)|\mu|^{-s}$ to (X.9.6.26).

Item 2. Grouping equal eigenvalues gives $\zeta_{\mathrm{PU}}(s;\mathbf t)=\sum_{\lambda}\nu_{\mathbf t}(\{\lambda\})e^{-s\log\lambda}$, a finite exponential sum with distinct real frequencies. It is entire in $s$, so its values on a set with a finite accumulation point determine it on $\mathbb C$ by the identity theorem; if two such sums agree, their difference is an exponential sum over the union of their atoms, say $m$ distinct values $\lambda$, and its values at $s=0,1,\ldots,m-1$ form an invertible Vandermonde system in the distinct numbers $\lambda^{-1}$, so every coefficient of the difference vanishes and the two measures coincide. Likewise $\eta_{\mathrm{PU}}(s;\mathbf t)=\sum_{r>0}\bigl(\nu^\eta_{\mathbf t}(\{r\})-\nu^\eta_{\mathbf t}(\{-r\})\bigr)r^{-s}$ determines these differences, and two measures with the same differences give the same function.

Item 3. The entries of (X.9.6.27) are finite parts, derivatives in $\mathbf t$ at $\mathbf t_c$ and values of $\zeta_{\mathrm{PU}}$, $\log\det_{\mathrm{PU}}$ and $\eta_{\mathrm{PU}}$, and these are determined by the three functions on a neighborhood of $\mathbf t_c$, hence by item 1 by the stated germs; the fixed map $\mathcal N_c$ then gives equal outputs. Item 4 is the contrapositive of item 3 for a common normalization map. In the example, $\nu^A_t=\delta_{1+t}+\delta_{2+t}$ and $\nu^B_t=\delta_{1+t}+\delta_{2+t}+\delta_{3+t}-\delta_{3+t}$ coincide for every $t$ in the chamber $t>-1$. ∎

**Resolution TV-X-20-R1 (Metadata).** Exact domain: master zeta-index ledgers of Definition X.9.6g on open chambers where every $L_j(\mathbf t)$ is positive, with fixed finite-part prescriptions, chamber choices, zero-mode ledgers and normalization maps. Premises: finite dimensionality of the ledger operators and the definitions (X.9.6.24)–(X.9.6.26). Equivalence: equality of the germs of the net spectral measure and of the odd part of the net eta measure. Budget: one grouping of the finitely many signed eigenvalues at each point and one Vandermonde inversion. Verifier: exact finite spectral computation. Falsifier: two ledgers with equal germs and unequal aggregate projections under one normalization map, or an aggregate function that fails to determine its net measure. Provenance class: source-internal finite mathematics. Downstream consumers: Definition X.9.6g, Theorem X.9.6g.1, Corollaries X.9.6g.2 and X.9.6g.3, Definition X.9.6g.7 and `TV-X-20`. Nonvacuity: the ledgers $A$ and $B$ of item 4. Theorem X.9.6g.1a gives `positive-discharge` of the identification of the aggregate zeta-index class with functionals of the net spectral germs, and its example gives `nonentailment` of sector values from the aggregate ledger. Construction of one PU spectral source together with verification of every sector projection from sector-resolved data, mixed derivatives, orientations, finite parts, tails and overlaps (`M+C`), its realization (`R`), and its numerical observable map (`O`) remain live under `TV-X-20`.

**Corollary X.9.6g.2 (Anti-Duplication Gate for Constants).** Two PU constants using the same spectral projection, finite-part functional, and normalization are the same ledger datum. For different orthogonal compressions, the traces add on the direct sum of the compressed operators; equality with a trace of the original operator's functional calculus requires reducing projections and the declared sector coverage. A jointly smooth common ledger has commuting mixed derivatives, whether its projections are orthogonal or overlapping. Representing all sector constants through the aggregate functions in (X.9.6.27) additionally requires the factorization certificate of Theorem X.9.6g.1.

*Proof.* Identical projection, functional, finite-part convention, and normalization give identical values. Functional calculus respects a direct sum, so the trace of the direct sum of compressed operators is the sum of their traces. This equals the corresponding trace of the original operator only when the projections reduce it and cover the stated subspace. Commutation of mixed derivatives follows from the joint smoothness assumptions in Theorem X.9.6g.1. Its separate factorization certificate is required before an individual sector value can be recovered from the aggregate ledger functions. ∎

**Theorem X.9.6g.2a (Homogeneous-Sector Zeta Reduction Certificate).** Let a sector projection $P_s$ of the master zeta-index ledger be represented, before comparison, by a compact homogeneous spectral sector
$$
X_s=G_s/H_s,
$$
where $G_s$ is compact, $H_s$ is closed, and $E_{\tau_s}=G_s\times_{H_s}V_{\tau_s}$. Assume the branch supplies:

1. the pair $(G_s,H_s)$, the representation $\tau_s$, and a normal homogeneous metric;
2. an operator $L_s$ whose action on each Peter-Weyl block is the declared $G_s$-Casimir minus the declared $H_s$-Casimir plus the registered zero-order endomorphism;
3. a finite rational polyhedral chamber decomposition on which the required branching multiplicities are given by the registered polynomial or quasi-polynomial formulas;
4. the zero-mode rule, finite-part scheme, scale $\mu_s$, and normalization map $\mathcal N_s$;
5. a tail certificate $\mathcal T_s$ for the retained heat/zeta or determinant sum.

Then the sector zeta datum is an admissible restriction of $\mathfrak Z_{\mathrm{PU}}$. More explicitly, Peter-Weyl decomposition gives
$$
L^2(X_s,E_{\tau_s})
\cong
\bigoplus_{\Lambda\in\widehat G_s}
V_\Lambda\otimes
\operatorname{Hom}_{H_s}(V_\Lambda,V_{\tau_s}),
$$
and $L_s$ acts on each retained block by a finite matrix whose entries are fixed functions of the highest weight $\Lambda$ and the branch symbol. If $L_s$ is scalar on irreducible blocks, the eigenvalues are affine-quadratic Casimir expressions of the form
$$
\lambda_{\Lambda,b}
=
Q_{s,b}(\Lambda)+c_{s,b},
$$
with spectral multiplicities
$$
\operatorname{mult}(\lambda_{\Lambda,b})
=
(\dim V_\Lambda)\,m_{\Lambda,b},
\qquad
m_{\Lambda,b}
=
[V_\Lambda|_{H_s}:\tau_s]_b.
$$
After decomposing the dominant-weight chamber into the finite chamber partition on which the branching multiplicities are polynomial or quasi-polynomial, the regulated zeta and determinant entries are finite sums of Barnes/Shintani-type lattice zeta sums
$$
\sum_{\Lambda\in C_{s,a}\cap(\Lambda_{0,a}+L_a)}
(\dim V_\Lambda)\,m_{s,a,b}(\Lambda)
\left(Q_{s,a,b}(\Lambda)+c_{s,a,b}+\mu_s\right)^{-z},
$$
together with the explicitly certified tail $\mathcal T_s$ and the registered zero-mode finite part.

Consequently, the compact homogeneous sectors already present in the canonical arena hierarchy may feed the same master ledger only through their fixed representation data, finite-part convention, and overlap maps. The reduction is a certificate format: it does not by itself assert the numerical values of $\mathfrak C_{\mathrm{tor}}$, $\mathfrak D_Q$, $\mathfrak F_U^{(4)}$, or any threshold tuple. Those values become theorem-level only after the corresponding sector record is evaluated forward and accepted under the finite-evaluation gate of Corollary P.14.1g and the overlap audit of Definition X.9.6g.7.

*Proof.* The Peter-Weyl theorem for compact $G_s$ gives the displayed Hilbert-space decomposition. For each retained highest weight $\Lambda$, the left $G_s$-module $V_\Lambda$ contributes its Weyl dimension, while the associated bundle condition contributes the $H_s$-branching multiplicity $m_{\Lambda,b}$. Thus a scalar block eigenvalue has multiplicity $(\dim V_\Lambda)m_{\Lambda,b}$, matching the representation-counting convention of Theorem T.70. A $G_s$-invariant differential or finite spectral operator commutes with the left $G_s$-action, hence acts blockwise by Schur's lemma, or by a finite matrix on the finite multiplicity space when multiplicity is greater than one. For the invariant Laplace-type symbols used in the PU spectral ledgers, the principal block eigenvalue is the difference of the $G_s$ and $H_s$ Casimir values plus the registered zero-order term, hence an affine-quadratic function of the highest weight on each chamber. Weyl dimension and branching multiplicities are finite and piecewise polynomial or quasi-polynomial on the chamber decomposition of the dominant-weight cone. Substituting those block eigenvalues and full spectral multiplicities into the heat/zeta trace gives exactly the displayed lattice sums. The finite-part, zero-mode, normalization, and tail entries are part of the accepted record, so the resulting scalar is a deterministic projection of $\mathfrak Z_{\mathrm{PU}}$ and inherits the no-retuning rule of Corollaries X.9.6g.3 and X.9.6g.6, together with Theorem X.9.6g.4 and Definition X.9.6g.5. ∎

**Remark X.9.6g.2b (Flag-Lift Dimension Ledger).** The current PU flag-lift branch uses
$$
\widetilde X=\mathrm{Flag}_{1,2,3}(Q)\cong\mathrm{Flag}(2,3,5;\mathbb C^8)
=
SU(8)/S(U(2)\times U(1)\times U(2)\times U(3)).
$$
By Proposition G.8.4e.1a,
$$
\dim_{\mathbb C}\mathrm{Gr}(2,8)=12,\qquad
\dim_{\mathbb C}\widetilde X=23,\qquad
\dim_{\mathbb R}\widetilde X=46.
$$
The fiber over $\mathrm{Gr}(2,8)$ has complex dimension $11$, not $12$. Any homogeneous zeta certificate for the lifted electroweak threshold sector must use these dimensions. The equality $24=M$ remains the interface-mode count, not the complex dimension of $\widetilde X$.

**Corollary X.9.6g.3 (Cross-Sector Zeta Lock).** Let $s$ be a theorem-level numerical sector whose output is claimed to arise from the master zeta-index ledger $\mathfrak Z_{\mathrm{PU}}$. Then its constant has the form
$$
C_s
=
\mathcal N_s
\left(
\{\zeta_{s,a}(0),\zeta'_{s,a}(0),\eta_{s,a}(0)\}_{a\in A_s},
\mathcal S_s,
\mathcal T_s
\right),
\tag{X.9.6g.3.1}
$$
where $P_{s,a}$, the finite-part scheme $\mathcal S_s$, the tail certificate $\mathcal T_s$, and the normalization map $\mathcal N_s$ are all restrictions of the single accepted ledger $\mathfrak Z_{\mathrm{PU}}$ before comparison with $C_s$. If two sectors share a ledger variable, their mixed finite differences commute because both are restrictions of the same finite trace functional.

*Proof.* Definition X.9.6g supplies the finite operator and perturbation lists, projectors, grading, and zero-mode conventions. Any sector requiring an infinite spectral realization, a measure normalization, or a tail estimate must also supply the corresponding entries and bounds, for example through Theorem X.9.6g.2a and Definition X.9.6g.5. Restricting that complete accepted datum to sector $s$ gives its registered zeta and eta values, scheme, and tail certificate. The common-domain finite-difference operators commute for a jointly defined scalar function on that domain; this does not create missing spectral or tail data. ∎

**Theorem X.9.6g.4 (One-Ledger Numerical Non-Retuning).** Suppose a finite PU branch claims theorem-level values for two or more of the alpha, electroweak-threshold, spectral-Higgs, flavor, cosmological-prefactor, primordial, or baryogenesis numerical sectors through $\mathfrak Z_{\mathrm{PU}}$. Then the branch is closed only if all claimed sector constants are obtained from one accepted master zeta-index ledger by Corollary X.9.6g.3 and by overlap-compatible descent in Theorem X.9.5c.2. In particular, a branch that uses the same spectral source for electroweak thresholds, Higgs finite parts, flavor, baryogenesis, primordial determinants, or vacuum prefactors must obtain all sector projectors and finite parts as restrictions of one accepted ledger. Changing a finite-part scheme, projector, tail bound, grading, determinant-line convention, Dynkin-index normalization, Higgs normalization, or matching map to improve one sector after another sector has been fixed creates a different branch and does not count as a simultaneous PU prediction.

*Proof.* Corollary X.9.6g.3 expresses each claimed sector value as a deterministic restriction of one ledger. Theorem X.9.5c.2 requires the local sector restrictions to glue on overlaps. Therefore a simultaneous branch has one shared finite object and one compatible descent class. Altering any listed ledger entry changes the common finite object, its sector restriction, or its descent datum. The altered object is a distinct branch, not a retuning of the same simultaneous prediction. ∎

**Definition X.9.6g.5 (Strict Determinant-Sector Ledger).** A strict determinant-sector ledger on the master zeta-index branch is a finite record

$$
\mathfrak M_{\mathrm{det}}
=
(\mathfrak L_{\mathrm{PU}},\mathcal R,\chi,\mathscr C_\zeta,\{P_s\}_{s\in\mathcal S},\{\mathcal N_s\}_{s\in\mathcal S},\mathcal T,\mathcal B,\mathfrak h_{\mathrm{det}})
$$

where $\mathfrak L_{\mathrm{PU}}$ is the accepted master predictive operator, $\mathcal R(z)=(\mathfrak L_{\mathrm{PU}}+z)^{-1}$ is the common resolvent on the retained spectral window, $\chi$ is one regulator profile, $\mathscr C_\zeta$ is one contour or heat/zeta prescription, $P_s$ are the retained sector projections, $\mathcal N_s$ are independently justified sector normalization maps, $\mathcal T$ is a finite tail-bound certificate for each regulated trace, $\mathcal B$ is the overlap-commutativity table supplied by Corollary X.9.6g.3, and $\mathfrak h_{\mathrm{det}}$ is the registry commitment specifying the tuple before validation comparison.

For each sector,

$$
\Theta_s
=
\mathcal N_s\left(
\frac{1}{2\pi i}
\int_{\mathscr C_\zeta}
\chi(z)\operatorname{Tr}(P_s\mathcal R(z)P_s)\,dz
\right)
\tag{X.9.6g.5.1}
$$

or the heat/zeta equivalent specified by $\mathscr C_\zeta$. No sector may alter $\mathfrak L_{\mathrm{PU}}$, $\chi$, $\mathscr C_\zeta$, $\mathcal T$, or a shared overlap finite part after $\mathfrak h_{\mathrm{det}}$ has been registered without creating a distinct branch.

**Corollary X.9.6g.6 (No Hidden Sector Retuning on a Strict Determinant-Sector Ledger).** If two numerical sectors are certified by the same strict determinant-sector ledger $\mathfrak M_{\mathrm{det}}$, then any shared spectral subblock has one finite part on the accepted branch. A correction to that shared finite part propagates through every sector projection containing the subblock. Changing a regulator, contour, tail certificate, finite part, projector, or normalization creates a distinct determinant-sector ledger rather than a retuning of the same simultaneous prediction.

*Proof.* The sector values are restrictions of one resolvent trace functional of $\mathfrak L_{\mathrm{PU}}$ with one regulator, one contour or heat/zeta prescription, and one tail certificate. On an overlap subblock, Corollary X.9.6g.3 identifies the mixed finite differences as restrictions of the same finite function on the shared chamber. Hence the shared finite part is unique on the ledger. Altering one of the listed entries changes the finite record fixed by $\mathfrak h_{\mathrm{det}}$ and therefore changes the branch. ∎

**Definition X.9.6g.7 (Cross-Sector Numerical Closure Record).** A cross-sector numerical closure record is a finite tuple
$$
\mathfrak N_{\mathrm{PU}}
=
\left(
\mathfrak S_*,
\mathfrak Z_{\mathrm{PU}},
\mathfrak M_{\mathrm{det}},
\mathfrak R_\alpha,
\mathfrak F_U^{(4)},
\mathfrak D_Q,
\mathfrak R_{\mathrm{EW}},
\mathfrak C_{\mathrm{fl}}^{\circ},
\mathfrak J_{\mathrm{RHG-fl}},
\mathfrak C_B^{\bullet},
\mathfrak C_{\mathrm{EH}},
\mathfrak X_{\mathrm{DS}},
\mathfrak H_{\mathrm{hor}},
\mathfrak O_{\mathrm{PU}},
\chi_{\mathrm{num}}
\right)
\tag{X.9.6g.7}
$$
where:

1. $\mathfrak S_*$ is the accepted finite spectral calibration datum of Definition V.3.11a.
2. $\mathfrak Z_{\mathrm{PU}}$ is the master zeta-index ledger of Definition X.9.6g.
3. $\mathfrak M_{\mathrm{det}}$ is the strict determinant-sector ledger of Definition X.9.6g.5.
4. $\mathfrak R_\alpha$ is the accepted fine-structure residual gate, with the same Thomson-limit normalization as Appendix Z.
5. $\mathfrak F_U^{(4)}$ is the accepted canonical four-mode Fredholm-prefactor record of Definition U.73e, including $\mathfrak M_4$, $\mathcal G_4$, the single relative determinant $\mathcal D_4$, and $\mathcal R_{\ge2}$ on its declared decay branch. A legacy $\mathfrak F_U+\mathfrak I_U^{(4)}$ pair is admissible in this slot only through an accepted same-branch embedding that supplies every actual field of Definition U.73e. A real cosmological term additionally requires $\mathfrak R_\Lambda^{(4)}$.
6. $\mathfrak D_Q$ is the accepted primordial determinant and branch certificate, or the branch-classification record replacing it.
7. $\mathfrak R_{\mathrm{EW}}$ is an accepted electroweak threshold record: RHG, equivariant analytic-torsion, spectral-action, or equivalent.
8. $\mathfrak C_{\mathrm{fl}}^{\circ}$ is an accepted flavor certificate, accepted joint threshold-flavor projection, or accepted flavor-independent CP substitute when used by baryogenesis.
9. $\mathfrak J_{\mathrm{RHG-fl}}$ is present when the threshold and flavor rows are projected from one master spectral ledger; otherwise it is marked absent and the overlap audit must prove compatibility of the separate records.
10. $\mathfrak C_B^{\bullet}$ is either an accepted $\mathfrak C_B$, accepted $\mathfrak C_B^{\mathrm{tr}}$, or accepted $\mathfrak C_B^{\mathrm{APSK}}$.
11. $\mathfrak C_{\mathrm{EH}}$ is the accepted finite Einstein/AQFT/KMS/metric-response completion record.
12. $\mathfrak X_{\mathrm{DS}}$ is the accepted covariant dark-susceptibility or effective-action certificate of Definition I.13d.
13. $\mathfrak H_{\mathrm{hor}}$ is the horizon recovery and transfer slot. It contains the accepted exterior recovery certificate $\mathfrak S_{\mathrm{hor},n}$ when deterministic exterior recovery is claimed, an accepted moment-design or frame-potential certificate when Page purity is claimed, the accepted trace-coupled continuity certificate $\mathfrak C_{\mathrm{PageTV}}$ when a von Neumann Page curve is claimed, and the accepted horizon transfer record $\mathfrak T_{\mathrm{hor}}$ when Landauer phase-grid spectroscopy is claimed. Each absent subrecord is marked separately.
14. $\mathfrak O_{\mathrm{PU}}$ is the overlap-commutativity audit proving that all shared projectors, finite parts, threshold maps, RG conventions, determinant ratios, unit normalizations, circular-angle conventions, and residual intervals descend from the same parent branch.
15. $\chi_{\mathrm{num}}=1$ records that all entries are fixed before numerical comparison.

The output vector of $\mathfrak N_{\mathrm{PU}}$ is the partial deterministic map
$$
\Pi_{\mathrm{num}}(\mathfrak N_{\mathrm{PU}})
=
\left(
\alpha_{\mathrm{cert}}^{-1},
\Delta_i,
Z_i,
\mu^2,
\lambda,
\Pi_T,
\bar\theta,
\eta_B,
A_{\mathrm{eff}}^{\mathrm{Fred},4},
\Lambda_4L_P^2,
\Theta_{\mathrm{prim}},
\Theta_{\mathrm{dark}},
\Theta_{\mathrm{EH}},
\Theta_{\mathrm{hor}}
\right),
\tag{X.9.6g.8}
$$
with a component marked certificate-pending when its local record is absent or does not certify that the defining map is defined at the retained inputs. In particular, the normalized circular-angle prescription requires a nonzero circular moment unless an independent real-representative convention is supplied. Here $\Theta_{\mathrm{prim}}$ denotes the primordial determinant outputs, $\Theta_{\mathrm{dark}}$ the galaxy/cluster/homogeneous dark-response outputs, $\Theta_{\mathrm{EH}}$ the AQFT/Einstein/metric-response outputs, and $\Theta_{\mathrm{hor}}$ the recovery/Page/transfer outputs.

**Theorem X.9.6g.8 (Simultaneous Numerical Determinacy and No Retuning).** If $\mathfrak N_{\mathrm{PU}}$ is accepted, then every non-pending component of $\Pi_{\mathrm{num}}(\mathfrak N_{\mathrm{PU}})$ is a deterministic finite function of accepted parent records and certified residual intervals. The cross-sector record cannot promote a local sector whose certificate is absent, and accepted shared entries cannot be changed to improve another component without creating a different branch.

*Proof.* On the aggregate projection class, the factorization certificate of Theorem X.9.6g.1 represents each admitted scalar by the stated aggregate functions. Other sector-resolved scalars use their registered compressed operators or explicitly compatible accepted local certificates under Corollary X.9.6e. Definition X.9.6g.5 and Corollary X.9.6g.6 prohibit independent retuning of shared determinant subblocks. Definition V.3.11a fixes the calibration algebra, atom measure, full-support witness, unit bridges, circular-angle convention, RG/threshold route, and local-parent overlap maps. Definitions T.78.10, T.79.8a, U.73e, Y.11.7a, Y.11.7e, Y.6.1c, 12.1f, E.9.5f, Q.0.7u, and I.13d make the threshold, flavor, Fredholm, baryogenesis, Einstein/AQFT, horizon, and dark-response projections finite records. The audit $\mathfrak O_{\mathrm{PU}}$ identifies common normalizations and forbids double counting. Therefore (X.9.6g.8) is a single finite composition on accepted components. If a component record is absent, that component remains certificate-pending. Theorem P.14.1f proves non-identifiability only when two admissible completions satisfying every accepted parent constraint give unequal values of the claimed output. That witness must be supplied separately for each asserted non-identifiability conclusion; accepted components retain the values determined by their own certificates. ∎

**Definition X.9.6h (Canonical Doubled Dirac Factorization of the Master Operator).** Let $\mathfrak D_{\mathrm{PU}}$ be a closed predictive Dirichlet datum and let $\mathfrak L_{\mathrm{PU}}\ge0$ be its master predictive operator. Define
$$
\mathscr H_{\mathrm D}
=
\mathscr H_{\mathrm{PU}}\oplus\mathscr H_{\mathrm{PU}},
\qquad
\Gamma_{\mathrm D}
=
\begin{pmatrix}
I&0\\
0&-I
\end{pmatrix},
\tag{X.9.6.29}
$$
and
$$
S_{\mathrm{PU}}
=
\mathfrak L_{\mathrm{PU}}^{1/2},
\qquad
D_{\mathrm{PU}}^{\mathrm{dbl}}
=
\begin{pmatrix}
0&S_{\mathrm{PU}}\\
S_{\mathrm{PU}}&0
\end{pmatrix}
\quad
\text{on }
\operatorname{Dom}(S_{\mathrm{PU}})\oplus\operatorname{Dom}(S_{\mathrm{PU}}).
\tag{X.9.6.30}
$$
This is the canonical doubled Dirac factorization of the master predictive operator.

**Theorem X.9.6h.1 (Master Operator Dirac Factorization).** For every closed predictive Dirichlet datum, $D_{\mathrm{PU}}^{\mathrm{dbl}}$ is self-adjoint, odd with respect to $\Gamma_{\mathrm D}$, and satisfies
$$
\left(D_{\mathrm{PU}}^{\mathrm{dbl}}\right)^2
=
\mathfrak L_{\mathrm{PU}}\oplus\mathfrak L_{\mathrm{PU}}.
\tag{X.9.6.31}
$$
Moreover it is unique among doubled odd self-adjoint factorizations
$$
D_T=
\begin{pmatrix}
0&T\\
T&0
\end{pmatrix},
\qquad
T=T^*\ge0,
\tag{X.9.6.32}
$$
satisfying $D_T^2=\mathfrak L_{\mathrm{PU}}\oplus\mathfrak L_{\mathrm{PU}}$.

*Proof.* Since $\mathfrak L_{\mathrm{PU}}$ is nonnegative and self-adjoint, the spectral theorem gives a unique nonnegative self-adjoint square root
$$
S_{\mathrm{PU}}=\mathfrak L_{\mathrm{PU}}^{1/2}
$$
with $S_{\mathrm{PU}}^2=\mathfrak L_{\mathrm{PU}}$. The block operator (X.9.6.30) is self-adjoint because both off-diagonal entries are the same self-adjoint operator on the same domain. Its oddness follows from direct multiplication:
$$
\Gamma_{\mathrm D}D_{\mathrm{PU}}^{\mathrm{dbl}}\Gamma_{\mathrm D}
=
-D_{\mathrm{PU}}^{\mathrm{dbl}}.
$$
Squaring the block matrix gives
$$
\left(D_{\mathrm{PU}}^{\mathrm{dbl}}\right)^2
=
\begin{pmatrix}
S_{\mathrm{PU}}^2&0\\
0&S_{\mathrm{PU}}^2
\end{pmatrix}
=
\mathfrak L_{\mathrm{PU}}\oplus\mathfrak L_{\mathrm{PU}},
$$
which proves (X.9.6.31).

For uniqueness, let $D_T$ have the form (X.9.6.32), with $T=T^*\ge0$, and suppose $D_T^2=\mathfrak L_{\mathrm{PU}}\oplus\mathfrak L_{\mathrm{PU}}$. Then
$$
T^2=\mathfrak L_{\mathrm{PU}}.
$$
By uniqueness of the nonnegative square root of a nonnegative self-adjoint operator, $T=\mathfrak L_{\mathrm{PU}}^{1/2}=S_{\mathrm{PU}}$. Hence $D_T=D_{\mathrm{PU}}^{\mathrm{dbl}}$. ∎

**Definition X.9.6h.2 (Local First-Order Dirac Certificate).** A local first-order Dirac certificate for a sector projection $P$ is a finite record
$$
\mathfrak C_{\mathrm D}(P)
=
(P,\mathfrak A_P,\mathscr H_P,D_P,\Gamma_P,J_P,V_P,\mathcal E_P)
\tag{X.9.6.33}
$$
where:

1. $P$ is a branch-determined projection or form-compression of $\mathfrak L_{\mathrm{PU}}$.

2. $\mathfrak A_P$ is the retained finite response algebra acting faithfully on $\mathscr H_P$.

3. $D_P=D_P^*$ is an odd first-order response operator on $\mathscr H_P$:
$$
\Gamma_PD_P+D_P\Gamma_P=0.
\tag{X.9.6.34}
$$

4. $J_P$ is the real-structure operator if that sector carries a real branch.

5. $V_P=V_P^*$ is a finite zero-order response potential in the even bimodule commutant: $[V_P,a]=[V_P,J_Pb^*J_P^{-1}]=[V_P,\Gamma_P]=0$ for all $a,b\in\mathfrak A_P$, the $J_P$ terms being present exactly when $J_P$ is defined. The branch fixes $\mathfrak A_P$, $\Gamma_P$ and $J_P$ before $D_P$ and $V_P$ are supplied.

6. The exact factorization identity holds:
$$
D_P^2+V_P
=
P\mathfrak L_{\mathrm{PU}}P^*.
\tag{X.9.6.35}
$$

7. The finite order-zero and order-one response identities hold:
$$
[a,J_Pb^*J_P^{-1}]=0,
\qquad
[[D_P,a],J_Pb^*J_P^{-1}]=0
\tag{X.9.6.36}
$$
for all retained algebra generators $a,b\in\mathfrak A_P$ for which $J_P$ is defined.

8. $\mathcal E_P$ is the finite residual record proving (X.9.6.35) and (X.9.6.36) on the branch generators.

**Theorem X.9.6h.3 (Exactness of Certified Local Dirac Factorization).** If a sector projection $P$ carries an accepted local first-order Dirac certificate $\mathfrak C_{\mathrm D}(P)$, then the sector compression $P\mathfrak L_{\mathrm{PU}}P^*$ has no independent second-order carrier beyond the certified first-order response datum $(\mathfrak A_P,\mathscr H_P,D_P,\Gamma_P,J_P,V_P)$. Any additional operator that gives the same finite protocol responses is response-null surplus; any additional operator that changes a finite response defines a distinct certified branch.

*Proof.* Equation (X.9.6.35) is an equality of finite self-adjoint operators on $\mathscr H_P$. Hence every quadratic response generated by $P\mathfrak L_{\mathrm{PU}}P^*$ is equivalently generated by the certified first-order operator $D_P$ together with the zero-order potential $V_P$. The order-zero and order-one identities (X.9.6.36) show that the represented algebra acts as a finite first-order response geometry on the retained branch. Since $\mathfrak A_P$ acts faithfully, no retained algebra generator is lost in the factorization.

Let $L'_P$ be another proposed carrier for the same sector. If it induces the same protocol-response presheaf as $P\mathfrak L_{\mathrm{PU}}P^*$, then Theorem P.6.1b.3 identifies it in the operational quotient on the theorem's separating, protocol-complete equivalence branch. Corollary P.6.1b.8 excludes an extra label or operator decoration only when its removal is admitted, preserves all other charged data, and strictly lowers complete cost; an equal-cost duplicate is not excluded by that strict comparison. If $L'_P$ changes a finite response, it is not the same sector projection in the PPI quotient and must be entered as a distinct finite branch with its own certificate. These alternatives exhaust the finite response quotient. ∎

**Proposition X.9.6h.3a (Zero-Order Class and First-Order Obstruction for Local Dirac Certificates).**

1. Let $P$ be a branch-determined sector projection, let the retained finite data $(\mathfrak A_P,\mathscr H_P,\Gamma_P,J_P)$, with $\mathscr H_P$ the carrier of $P\mathfrak L_{\mathrm{PU}}P^*$, satisfy items 2 and 4 of Definition X.9.6h.2 and the order-zero condition in (X.9.6.36), and consider the variant of Definition X.9.6h.2 whose item 5 admits every finite self-adjoint operator on $\mathscr H_P$. Then the record with $D_P=0$, $V_P=P\mathfrak L_{\mathrm{PU}}P^*$ and a residual record listing the two exact identities satisfies this variant; the data $\mathfrak A_P=\mathbb C\mathbf1$ and $\Gamma_P=\mathbf1$ without a real branch meet these conditions on every sector. With an unrestricted zero-order potential, acceptance therefore entails no nonzero first-order operator; the first-order content of a local Dirac certificate is fixed by the class admitted for $V_P$, which item 5 of Definition X.9.6h.2 takes to be the even bimodule commutant (X.9.6h.3a.1) of the branch-fixed data. On the data $\mathfrak A_P=\mathbb C\mathbf1$, $\Gamma_P=\mathbf1$ without a real branch that commutant contains every self-adjoint operator on $\mathscr H_P$, so a branch fixing those data also admits the record with $D_P=0$ under Definition X.9.6h.2.

2. Fix finite $(\mathfrak A_P,\mathscr H_P,\Gamma_P,J_P)$ satisfying the order-zero condition in (X.9.6.36), let
$$
\mathcal Z_P
=
\bigl\{V:\ [V,a]=[V,J_Pb^*J_P^{-1}]=[V,\Gamma_P]=0\ \text{for all }a,b\in\mathfrak A_P\bigr\}
\tag{X.9.6h.3a.1}
$$
be the even bimodule commutant, let $\mathbb E_{\mathcal Z}$ be the Hilbert-Schmidt orthogonal projection onto $\mathcal Z_P$, and let $\mathscr D^{(1)}_P$ be the real vector space of odd self-adjoint operators that satisfy the order-one condition in (X.9.6.36) and the $J_P$-sign relation of (X.9.6.14). If $P\mathfrak L_{\mathrm{PU}}P^*=D_P^2+V_P$ with $D_P\in\mathscr D^{(1)}_P$ and $V_P\in\mathcal Z_P$, then
$$
(1-\mathbb E_{\mathcal Z})\bigl(P\mathfrak L_{\mathrm{PU}}P^*\bigr)
\in
(1-\mathbb E_{\mathcal Z})\operatorname{span}_{\mathbb R}\bigl\{D_1D_2+D_2D_1:\ D_1,D_2\in\mathscr D^{(1)}_P\bigr\}.
\tag{X.9.6h.3a.2}
$$
This is a finite linear test. Every certificate of Definition X.9.6h.2 with $V_P\in\mathcal Z_P$ satisfies the inclusion (X.9.6h.3a.2) with $\mathscr D^{(1)}_P$ replaced by the larger real space $\widetilde{\mathscr D}^{(1)}_P$ of odd self-adjoint operators satisfying the order-one condition in (X.9.6.36), which is the class of first-order operators admitted by items 3 and 7 of that definition. The smaller test with $\mathscr D^{(1)}_P$ requires the $J_P$-sign relation as a hypothesis on $D_P$: for $\mathfrak A_P=\mathbb C^2$ acting on $\mathscr H_P=\mathbb C^4$ by $\operatorname{diag}(a_1,a_1,a_2,a_2)$, $\Gamma_P=\operatorname{diag}(1,-1,-1,1)$, $J_P$ the exchange of the second and third coordinates followed by complex conjugation, and $D=E_{12}+E_{21}+iE_{24}-iE_{42}$ in matrix units, the operator $L_4=D^2+\mathbf1$ has the certificate $D_P=D$, $V_P=\mathbf1$ of Definition X.9.6h.2 and violates (X.9.6h.3a.2) for either sign $\epsilon'$.

3. The test (X.9.6h.3a.2) excludes even positive operators on explicit finite real even data. Let $\mathfrak A_P=\mathbb C^2$ act on $\mathscr H_P=\mathscr H_{11}\oplus\mathscr H_{22}$, with $\mathscr H_{11}=\mathscr H_{22}=\mathbb C^2$ graded by $\operatorname{diag}(1,-1)$, $a=(a_1,a_2)$ acting by $a_i$ on $\mathscr H_{ii}$, and $J_P$ componentwise complex conjugation with KO signs $\epsilon=\epsilon'=\epsilon''=1$, so that $J_P^2=1$, $J_P\Gamma_P=\Gamma_PJ_P$, and $J_PD=DJ_P$ is the sign relation. Then $\mathscr D^{(1)}_P$ consists of the block-diagonal operators $d_1\sigma_x\oplus d_2\sigma_x$ with $d_1,d_2\in\mathbb R$, $\mathcal Z_P$ is the diagonal algebra, and the even positive operator
$$
L=
\begin{pmatrix}
2I_2&I_2\\
I_2&2I_2
\end{pmatrix}
\tag{X.9.6h.3a.3}
$$
violates (X.9.6h.3a.2); dropping the $J_P$-sign relation leaves only diagonal anticommutators, so Definition X.9.6h.2 admits no certificate for $L$ with these data, while the unrestricted variant of item 1 certifies it.

*Proof.* Item 1. The zero operator is self-adjoint and odd for every grading, the order-one identity holds for $D_P=0$ because $[D_P,a]=0$, faithfulness, the real-structure entry and the order-zero identity are hypotheses on the retained data, $V_P=P\mathfrak L_{\mathrm{PU}}P^*$ is a finite self-adjoint operator on $\mathscr H_P$, and $D_P^2+V_P=P\mathfrak L_{\mathrm{PU}}P^*$ holds by the choice of $V_P$. Every entry of the unrestricted variant is therefore present. The algebra $\mathbb C\mathbf1$ acts faithfully, without a real branch the order-zero identity is void, and every operator on $\mathscr H_P$ commutes with $\mathbb C\mathbf1$ and with $\Gamma_P=\mathbf1$.

Item 2. The set in (X.9.6h.3a.1) is the commutant of a self-adjoint family, hence a $*$-subalgebra of the finite operator algebra, and $\mathbb E_{\mathcal Z}$ fixes each of its elements. From $P\mathfrak L_{\mathrm{PU}}P^*=D_P^2+V_P$ with $V_P\in\mathcal Z_P$ one obtains $(1-\mathbb E_{\mathcal Z})(P\mathfrak L_{\mathrm{PU}}P^*)=(1-\mathbb E_{\mathcal Z})(D_P^2)$, and $D_P^2=\tfrac12(D_PD_P+D_PD_P)$ lies in the displayed span. The span, the projection and membership are finite linear-algebra computations. Items 3 and 7 of Definition X.9.6h.2 place $D_P$ in $\widetilde{\mathscr D}^{(1)}_P$, and the same computation applies. In the four-dimensional example, $J_P^2=1$, $J_P\Gamma_P=\Gamma_PJ_P$, the algebra acts faithfully, and $J_Pb^*J_P^{-1}=\operatorname{diag}(b_1,b_2,b_1,b_2)$ commutes with it; the two families generate the diagonal algebra, so $\mathcal Z_P$ is the diagonal algebra and contains $\mathbf1$. The operator $D$ is self-adjoint, and its matrix units join coordinates of opposite grading, so $D$ is odd; the nonzero entries of $[D,a]$ join coordinates $2$ and $4$, where $J_Pb^*J_P^{-1}$ takes the common value $b_2$, so the order-one identity holds; and $L_4$ has diagonal $(2,3,1,2)$, $(1,4)$ entry $i$, $(4,1)$ entry $-i$ and no other nonzero entries. For $D'\in\mathscr D^{(1)}_P$ the sign relation reads $(D')_{jk}=\epsilon'\,\overline{(D')_{\pi(j)\pi(k)}}$, with $\pi$ the exchange of $2$ and $3$, and oddness gives $(D')_{jk}=0$ for $j,k\in\{1,4\}$. Hence
$$
(D'D''+D''D')_{14}
=
2\operatorname{Re}\bigl((D')_{13}(D'')_{34}\bigr)+2\operatorname{Re}\bigl((D'')_{13}(D')_{34}\bigr)
\in\mathbb R
$$
for $D',D''\in\mathscr D^{(1)}_P$. Since $1-\mathbb E_{\mathcal Z}$ removes the diagonal and keeps every off-diagonal entry, every element of the right side of (X.9.6h.3a.2) has real $(1,4)$ entry, while $(1-\mathbb E_{\mathcal Z})L_4$ has $(1,4)$ entry $i$.

Item 3. The algebra is commutative, so order zero holds, and $J_Pb^*J_P^{-1}$ acts on $\mathscr H_{ii}$ by $b_i$. For the block $D_{12}:\mathscr H_{22}\to\mathscr H_{11}$ of an operator $D$, the order-one identity reads $(a_2-a_1)(b_2-b_1)D_{12}=0$ for all $a,b$, so $D_{12}=0$, and likewise $D_{21}=0$. An odd real self-adjoint operator on $\mathscr H_{ii}=\mathbb C^+\oplus\mathbb C^-$ is $d_i\sigma_x$ with $d_i$ real, which gives $\mathscr D^{(1)}_P$. An operator commuting with both block projections and with $\Gamma_P$ preserves the four one-dimensional graded summands, so $\mathcal Z_P$ is diagonal, and every $D_1D_2+D_2D_1$ is diagonal. The right-hand side of (X.9.6h.3a.2) is therefore zero, while $(1-\mathbb E_{\mathcal Z})L$ is the nonzero off-diagonal part of (X.9.6h.3a.3). Without the sign relation the odd self-adjoint blocks are $\begin{pmatrix}0&z_i\\\bar z_i&0\end{pmatrix}$ with $z_i\in\mathbb C$, whose anticommutators are again diagonal, so the same conclusion holds for every $D_P$ admitted by items 3 and 7 of Definition X.9.6h.2. The operator $L$ commutes with $\Gamma_P$ and has eigenvalues $1$ and $3$, each of multiplicity two. ∎

**Resolution TV-X-19-R1 (Metadata).** Exact domain: local first-order Dirac certificates of Definition X.9.6h.2 on finite sector data, whose potentials lie in the even bimodule commutant (X.9.6h.3a.1), in items 2 and 3, with the test on $\mathscr D^{(1)}_P$ applied to certificates whose $D_P$ obeys the $J_P$-sign relation of (X.9.6.14), and the unrestricted-potential variant in item 1. Premises: finite dimensionality, the order-zero condition, the grading relation, and, for the test with $\mathscr D^{(1)}_P$, the $J_P$-sign relation of (X.9.6.14) on $D_P$. Equivalence: equality of finite operators. Budget: one linear span of anticommutators, one Hilbert-Schmidt projection and one membership test. Verifier: exact finite linear algebra. Falsifier: a record of item 1 whose entries fail the unrestricted variant, a factorization of (X.9.6h.3a.3) with first-order odd $D_P$ and $V_P\in\mathcal Z_P$, or a certificate of Definition X.9.6h.2 with $V_P\in\mathcal Z_P$ violating the test with $\widetilde{\mathscr D}^{(1)}_P$. Provenance class: source-internal finite mathematics. Downstream consumers: Definitions X.9.6f and X.9.6h.2, Theorems X.9.6f.1 and X.9.6h.3, Definition X.9.6h.4 and `TV-X-19`. Nonvacuity: the record of item 1 exists for every sector projection, the triple of item 3 is a finite real even datum with two-dimensional $\mathscr D^{(1)}_P$, and the four-dimensional example of item 2 is a certificate of Definition X.9.6h.2 violating the test with $\mathscr D^{(1)}_P$. Proposition X.9.6h.3a gives `nonentailment` of a nonzero first-order factor from the unrestricted-potential variant of Definition X.9.6h.2, and item 5 of Definition X.9.6h.2 accordingly admits only commutant potentials; it gives `nonentailment` of a commutant-potential factorization from finite real even structure and positivity, and, by the four-dimensional example of item 2, `nonentailment` of the sign-restricted test (X.9.6h.3a.2) from Definition X.9.6h.2. The classification of the finite real even triples compatible with the retained responses and anomalies, and a proof of the local first-order factorization for the actual PU sector compressions (`M+C`), together with its realization (`R`), remain live under `TV-X-19`.

**Definition X.9.6h.4 (PU Spectral-Action Transfer Ledger).** A PU spectral-action transfer ledger for a sector projection $P$ is a finite record
$$
\mathfrak S_{\mathrm{SA}}(P)
=
\left(
P,
\mathfrak C_{\mathrm D}(P),
D_P,
f,
\{f_k\}_{k\in K_{\mathrm{SA}}},
\Lambda_{\mathrm{SA}},
\mathcal S_{\mathrm{FP}},
\{P_s\}_{s\in\mathcal S_{\mathrm{SA}}},
\{a_{j,s}\}_{0\le j\le J,\ s\in\mathcal S_{\mathrm{SA}}},
\{\zeta_s^{\mathrm{SA}}\}_{s\in\mathcal S_{\mathrm{SA}}},
\mathcal N_{\mathrm{SA}},
\mathcal T_{\mathrm{SA}},
\mathcal I_{\mathrm{SA}},
\mathcal Q_{\mathrm{SA}},
\chi_{\mathrm{SA}}
\right)
\tag{X.9.6h.4.1}
$$
where:

1. $\mathfrak C_{\mathrm D}(P)$ is the accepted local first-order Dirac certificate of Definition X.9.6h.2 for $D_P$. It fixes the algebra representation, principal symbol, domain, grading, real structure if used, zero-order potential, and first-order identities before any finite part is evaluated.

2. $f$ is an even positive cutoff function and $\{f_k\}_{k\in K_{\mathrm{SA}}}$ is the finite list of cutoff moments used by the branch. The moment set $K_{\mathrm{SA}}$ is part of the ledger and is not inferred from a later comparison row.

3. $\Lambda_{\mathrm{SA}}$ is the spectral-action reference scale and
$$
\mathcal S_{\mathrm{FP}}
=
(J,\mu_{\mathrm{FP}},q_{\mathrm{sub}},\operatorname{FP}_{\mu_{\mathrm{FP}}})
\tag{X.9.6h.4.2}
$$
is the finite-part prescription, consisting of the retained heat order, finite-part scale, subtraction order, and finite-part functional used for all heat/zeta terms on the branch.

4. $\{P_s\}_{s\in\mathcal S_{\mathrm{SA}}}$ is the projection list. The projections are mutually compatible orthogonal projections descending from the accepted master zeta-index ledger $\mathfrak Z_{\mathrm{PU}}$. Each $P_s$ reduces $D_P^2$; on a smooth-envelope branch its domain invariance and compatibility with the heat/finite-part prescription are also certified. The sector set contains the entries needed for color, weak, hypercharge, Higgs kinetic, Higgs quadratic, Higgs quartic, matter-response, and any overlap sector claimed by the branch:
$$
\{C,W,Y,H_{\mathrm{kin}},H_2,H_4\}\subseteq \mathcal S_{\mathrm{SA}}.
\tag{X.9.6h.4.3}
$$

5. $a_{j,s}$ are the finite PU heat coefficients, or the accepted smooth-envelope heat coefficients, of $P_sD_P^2P_s$ through the declared order $J$. They are computed from $D_P$, $P_s$, the grading, and the real structure in $\mathfrak C_{\mathrm D}(P)$. No heat coefficient may be imported from a validation tuple.

6. $\zeta_s^{\mathrm{SA}}$ is the sector zeta/heat finite-part entry. In the finite-matrix case it is the finite spectral sum
$$
\zeta_s^{\mathrm{SA}}(q)
=
\sum_{m\in\mathrm{Spec}_{+}(P_sD_P^2P_s)}
\lambda_{s,m}^{-q},
\tag{X.9.6h.4.4}
$$
with multiplicities and the zero-mode rule fixed by $\mathcal S_{\mathrm{FP}}$. On a smooth-envelope branch it is the accepted heat-kernel continuation with the same finite-part prescription.

7. The sector finite part is
$$
F_s^{\mathrm{SA}}
=
-\left(\zeta_s^{\mathrm{SA}}\right)'(0)
-
\zeta_s^{\mathrm{SA}}(0)\log \mu_{\mathrm{FP}}^2,
\tag{X.9.6h.4.5}
$$
with subtraction order $q_{\mathrm{sub}}$. This is the only finite-part convention available on the branch.

8. $\mathcal T_{\mathrm{SA}}$ is the tail certificate. It gives finite constants $\epsilon_{\mathrm{SA}}(s)$ such that the omitted heat/zeta contribution in sector $s$ is bounded by $\epsilon_{\mathrm{SA}}(s)$ in the declared finite-part norm.

9. $\mathcal N_{\mathrm{SA}}$ is the normalization map. It includes the determinant-line convention, the Dynkin-index convention for $Y,W,C$, the gauge kinetic normalization, the Higgs inner-product normalization, the Higgs quadratic and quartic normalization, and the matching map to the Appendix T threshold ledger. Its output is
$$
\mathcal N_{\mathrm{SA}}
\left(
D_P,f_k,a_{j,s},F_s^{\mathrm{SA}},\mathcal S_{\mathrm{FP}},\mathcal T_{\mathrm{SA}}
\right)
=
(c_1,c_2,c_3,Z_H,\mu_H^2,\lambda_H,F_C,F_W,F_Y,\Delta,Z),
\tag{X.9.6h.4.6}
$$
where
$$
Z_i=1+\frac{\Delta_i}{24},
\qquad i=1,2,3.
\tag{X.9.6h.4.7}
$$

10. $\mathcal I_{\mathrm{SA}}$ is the interval ledger for all claimed spectral-action outputs:
$$
\mathcal I_{\mathrm{SA}}
=
\left(
\{I(c_i)\}_{i=1}^3,
I(Z_H),
I(\mu_H^2),
I(\lambda_H),
\{I(F_s^{\mathrm{SA}})\}_{s},
\{I(\Delta_i)\}_{i=1}^3,
\{I(Z_i)\}_{i=1}^3
\right).
\tag{X.9.6h.4.8}
$$

11. $\mathcal Q_{\mathrm{SA}}$ is the scheme and overlap ledger. It records the subtraction against any already counted bulk, interface, electromagnetic projection, curvature, sinc-transport, RHG, torsion, flavor, baryogenesis, primordial determinant, vacuum-prefactor, and future symmetry-residual sources, and the overlap maps proving that the same term is not counted twice.

12. $\chi_{\mathrm{SA}}$ records that $P$, $\mathfrak C_{\mathrm D}(P)$, $D_P$, $f$, $K_{\mathrm{SA}}$, $\Lambda_{\mathrm{SA}}$, $\mathcal S_{\mathrm{FP}}$, the projection list, the heat coefficients, $\mathcal N_{\mathrm{SA}}$, $\mathcal T_{\mathrm{SA}}$, $\mathcal I_{\mathrm{SA}}$, and $\mathcal Q_{\mathrm{SA}}$ were fixed before any comparison with $\alpha(M_Z)$, $v$, $m_H$, $\sin^2\theta_W(M_Z)$, Yukawa data, CKM data, PMNS data, baryogenesis data, the validation tuple $(15.14,20.94,18.41)$, or vacuum-prefactor data.

The finite spectral action in sector $s$ is
$$
S_{f,s}(P,\Lambda_{\mathrm{SA}})
=
\operatorname{FP}_{\mu_{\mathrm{FP}},q_{\mathrm{sub}}}
\operatorname{Tr}\!\bigl(P_s f(D_P^2/\Lambda_{\mathrm{SA}}^2)P_s\bigr).
\tag{X.9.6h.4.9}
$$
On a smooth-envelope heat-kernel branch, the accepted expansion is
$$
S_{f,s}(P,\Lambda_{\mathrm{SA}})
=
\sum_{j=0}^{J}
f_{4-j}\Lambda_{\mathrm{SA}}^{4-j}a_{j,s}
+
F_s^{\mathrm{SA}}
+
R_s^{\mathrm{SA}},
\qquad
|R_s^{\mathrm{SA}}|\le \epsilon_{\mathrm{SA}}(s).
\tag{X.9.6h.4.10}
$$
The ledger is accepted only when all entries above are present as finite PU data or accepted smooth-envelope data with proved tails. If the first-order Dirac certificate, cutoff function, projection list, heat coefficients, subtraction order, finite-part scale, tail bound, normalization map, scheme/overlap ledger, interval ledger, or forward-lock entry is absent, $\mathfrak S_{\mathrm{SA}}(P)$ is not an accepted electroweak threshold or Higgs finite-part source.

**Theorem X.9.6h.5 (Spectral-Action Transfer of Gauge-Higgs Threshold Data).** On a branch carrying an accepted $\mathfrak S_{\mathrm{SA}}(P)$, every gauge kinetic coefficient, Higgs kinetic coefficient, Higgs quadratic coefficient, Higgs quartic coefficient, electroweak threshold finite part, and threshold wavefunction factor claimed from the spectral action is a deterministic interval-valued function of the finite record:
$$
\begin{aligned}
&\left(
c_1^{\mathrm{SA}},c_2^{\mathrm{SA}},c_3^{\mathrm{SA}},
Z_H^{\mathrm{SA}},
\mu_{H,\mathrm{SA}}^2,
\lambda_H^{\mathrm{SA}},
F_C^{\mathrm{SA}},F_W^{\mathrm{SA}},F_Y^{\mathrm{SA}},
\Delta^{\mathrm{SA}},Z^{\mathrm{SA}}
\right) \\
&\qquad =
\mathcal N_{\mathrm{SA}}
\left(
D_P,\{f_k\},\{a_{j,s}\},\{F_s^{\mathrm{SA}}\},\mathcal S_{\mathrm{FP}},\mathcal T_{\mathrm{SA}}
\right).
\end{aligned}
\tag{X.9.6h.5.1}
$$
For each output component $Q$ in (X.9.6h.5.1), the accepted tail certificate gives a certified interval
$$
Q\in[Q^-_{\mathrm{SA}},Q^+_{\mathrm{SA}}]
\tag{X.9.6h.5.2}
$$
recorded in $\mathcal I_{\mathrm{SA}}$. In particular,
$$
\Delta_i^{\mathrm{SA}}
=
\sum_{s\in\{C,W,Y\}}T_{is}F_s^{\mathrm{SA}},
\qquad
Z_i^{\mathrm{SA}}=1+\frac{\Delta_i^{\mathrm{SA}}}{24},
\tag{X.9.6h.5.3}
$$
with the Dynkin-index matrix $T$ computed only after the commuting-sector certificate required by Remark T.17a.3 is accepted. No independent electroweak threshold, gauge finite part, Higgs quadratic coefficient, or Higgs quartic coefficient may be appended on the same closed spectral branch. If a threshold, flavor, baryogenesis, primordial determinant, or vacuum-prefactor row cites the same spectral source, then all finite parts, projectors, gradings, normalizations, and tail constants must be restrictions of the same master zeta-index ledger of Definition X.9.6g. Changing any one of $\mathcal S_{\mathrm{FP}}$, $P_s$, the grading data, $\mathcal T_{\mathrm{SA}}$, $\mathcal Q_{\mathrm{SA}}$, or $\mathcal N_{\mathrm{SA}}$ after a dependent row is fixed is a different branch and cannot update the old row.

*Proof.* Definition X.9.6h.2 supplies self-adjoint $D_P$, and the sector-projection entry of Definition X.9.6h.4 supplies orthogonal $P_s$ reducing $D_P^2$. Hence
$$
A_s:=P_sD_P^2P_s
$$
is self-adjoint and nonnegative on $P_s\mathcal H_P$. On the finite-matrix branch, the finite-dimensional spectral theorem (Reed and Simon, 1980) applies: there is an orthonormal eigenbasis $\{v_{s,m}\}$ with $A_sv_{s,m}=\lambda_{s,m}v_{s,m}$ and $\lambda_{s,m}\ge0$. Functional calculus gives
$$
f(A_s/\Lambda_{\mathrm{SA}}^2)v_{s,m}
=f(\lambda_{s,m}/\Lambda_{\mathrm{SA}}^2)v_{s,m},
$$
so summing the diagonal entries in that basis yields
$$
\operatorname{Tr}f(P_sD_P^2P_s/\Lambda_{\mathrm{SA}}^2)
=\sum_m f(\lambda_{s,m}/\Lambda_{\mathrm{SA}}^2).
$$
Because $P_s$ reduces $D_P^2$, functional calculus gives $P_s f(D_P^2/\Lambda_{\mathrm{SA}}^2)P_s=f(A_s/\Lambda_{\mathrm{SA}}^2)$ on $P_s\mathcal H_P$. Thus the accepted eigenvalue list and test function determine the sector trace in Equation (X.9.6h.4.9).

On the smooth-envelope branch, Equation (X.9.6h.4.10) is an entry of the heat-kernel certificate. Its coefficient list $\{a_{j,s}\}$, subtraction order, finite-part scale, and tail estimate $\mathcal T_{\mathrm{SA}}$ determine the certified interval for the same spectral functional. Therefore both admitted branches determine their heat coefficients and finite zeta values from the registered spectral data.

The gauge, Higgs-kinetic, Higgs-quadratic, Higgs-quartic, threshold, and matching entries in (X.9.6h.5.1)–(X.9.6h.5.3) are specified linear projections followed by the registered normalization map. A specified function of a determined finite spectral record is single-valued. Appending another response-active coefficient while retaining the same operator, test function, projections, grading, heat coefficients, finite-part convention, tail certificate, and normalization map would assign two outputs to that single-valued map, contrary to Corollary X.9.6e and Theorems X.9.6g.1 and X.9.6g.4. Such an appended term must therefore be response-null or belong to a distinct certified branch. ∎

**Proposition X.9.6h.5a (Cutoff and Moment Freedom of the Spectral-Action Transfer).** Fix $D_P$, the projection list $\{P_s\}_{s\in\mathcal S_{\mathrm{SA}}}$ and $\Lambda_{\mathrm{SA}}$ of Definition X.9.6h.4, and let the cutoff profile $f$ range over even smooth positive functions on $\mathbb R$ of rapid decay, entering through their restriction to $[0,\infty)$ as $f(D_P^2/\Lambda_{\mathrm{SA}}^2)$, with moments $f_0=f(0)$ and $f_k=\int_0^\infty f(v)v^{k/2-1}\,dv$ for $k=2,4$.

1. *Finite-matrix branch.* Let $X\subset[0,\infty)$ be the finite union over $s$ of the spectra of $P_sD_P^2P_s/\Lambda_{\mathrm{SA}}^2$ on $P_s\mathscr H_P$, and let $N_{s,x}$ be the multiplicity of $x$ in sector $s$. The vector of sector actions $(\operatorname{Tr}f(P_sD_P^2P_s/\Lambda_{\mathrm{SA}}^2))_s$ depends on $f$ only through $f|_X$, and as $f$ varies it fills exactly the open cone
$$
\Bigl\{\Bigl(\sum_{x\in X}N_{s,x}y_x\Bigr)_s:\ y\in(0,\infty)^X\Bigr\}.
\tag{X.9.6h.5a.1}
$$
If every sector has an eigenvalue occurring in no other sector, the cone (X.9.6h.5a.1) is all of $(0,\infty)^{\mathcal S_{\mathrm{SA}}}$.

2. *Smooth-envelope moments.* The moment triple $(f_0,f_2,f_4)$ ranges over all of $(0,\infty)^3$.

3. *Forward lock.* Every output of $\mathcal N_{\mathrm{SA}}$ that depends on the cutoff through the sector actions of item 1 or the moments of item 2, and is continuous and nonconstant there, takes every value in a nondegenerate interval as the cutoff varies. Its value is therefore fixed only by the cutoff and moment entries registered in $\chi_{\mathrm{SA}}$, and a cutoff or moment chosen after comparison can match any value in that interval.

*Proof.* Item 1. On the finite branch, the proof of Theorem X.9.6h.5 gives $\operatorname{Tr}f(P_sD_P^2P_s/\Lambda_{\mathrm{SA}}^2)=\sum_{x\in X}N_{s,x}f(x)$, so the vector depends on $f|_X$ and lies in (X.9.6h.5a.1). Conversely, let $y\in(0,\infty)^X$ and $\varepsilon=\tfrac12\min_xy_x$. Choose even smooth bumps $\beta_x\ge0$ on $\mathbb R$ with compact support, $\beta_x(x)=1$ and $\beta_x=0$ on $X\setminus\{x\}$; for $x>0$ take the sum of a bump supported in a short interval around $x$ and its mirror image. Put $f(v)=\varepsilon e^{-v^2}+\sum_x\bigl(y_x-\varepsilon e^{-x^2}\bigr)\beta_x(v)$. Each coefficient is positive, so $f$ is even, smooth, positive and of rapid decay, and $f(x)=y_x$ on $X$. If each sector $s$ owns an eigenvalue $x_s$ occurring in no other sector, give every point of $X\setminus\{x_s\}_s$ the weight $\eta>0$ and set $y_{x_s}=\bigl(z_s-\eta\sum_{x\ne x_s}N_{s,x}\bigr)/N_{s,x_s}$, which uses $N_{s,x_{s'}}=0$ for $s'\ne s$; for $\eta$ small enough every $y_{x_s}$ is positive, and $y$ realizes any prescribed $z\in(0,\infty)^{\mathcal S_{\mathrm{SA}}}$.

Item 2. Let $(c_0,c_2,c_4)\in(0,\infty)^3$, let $(m_0,m_2,m_4)=(1,\sqrt\pi/2,1/2)$ be the moments of $e^{-v^2}$, and put $\varepsilon=\tfrac12\min_kc_k/m_k$ and $b_k=c_k-\varepsilon m_k>0$. Let $\chi\ge0$ be smooth and even on $\mathbb R$ with $\chi(0)=1$ and support in $[-1,1]$, write $A=\int_0^\infty\chi$, $B=\int_0^\infty v\chi$, and $\chi_\eta(v)=\chi(v/\eta)$, so that $\int_0^\infty\chi_\eta=\eta A$ and $\int_0^\infty v\chi_\eta=\eta^2B$. Let $\psi\ge0$ be smooth and even with support in $[-1,1]$ and $\int\psi=1$, and put $\psi_{c}(v)=(4/c)\bigl(\psi(4(v-c)/c)+\psi(4(v+c)/c)\bigr)$, an even function whose restriction to $[0,\infty)$ is supported in $[3c/4,5c/4]$, with $\int_0^\infty\psi_c=1$ and $\int_0^\infty v\psi_c=c$. For $\eta>0$ set $a(\eta)=b_2-b_0\eta A$ and $c(\eta)=(b_4-b_0\eta^2B)/a(\eta)$; as $\eta\downarrow0$, $a(\eta)\to b_2>0$ and $c(\eta)\to b_4/b_2>0$, so some $\eta>0$ has $a(\eta)>0$, $c(\eta)>0$ and $\eta<c(\eta)/2$. Then
$$
f=b_0\chi_\eta+a(\eta)\psi_{c(\eta)}+\varepsilon e^{-v^2}
$$
is even, smooth, positive and of rapid decay, the supports of $\chi_\eta$ and $\psi_{c(\eta)}$ meet $[0,\infty)$ in disjoint sets and the second excludes $0$, and $f_0=b_0+\varepsilon m_0=c_0$, $f_2=b_0\eta A+a(\eta)+\varepsilon m_2=c_2$, $f_4=b_0\eta^2B+a(\eta)c(\eta)+\varepsilon m_4=c_4$.

Item 3. The attainable sets in items 1 and 2 are convex, hence connected, and a continuous nonconstant function on a connected set takes every value between two of its values. ∎

**Resolution TV-X-21-R1 (Metadata).** Exact domain: spectral-action transfer ledgers of Definition X.9.6h.4 with fixed $D_P$, projections and $\Lambda_{\mathrm{SA}}$, and even smooth positive rapidly decaying cutoff profiles, on the finite-matrix branch (item 1) and for the moments $f_0,f_2,f_4$ of the smooth-envelope expansion (item 2). Premises: the finite spectral trace formula of Theorem X.9.6h.5 and the displayed moment convention. Equivalence: equality of sector action vectors and of moment triples. Budget: one finite interpolation and one three-moment construction. Verifier: explicit smooth constructions and exact evaluation of their traces and moments. Falsifier: a positive vector in (X.9.6h.5a.1) or in $(0,\infty)^3$ not attained by any admissible profile. Provenance class: source-internal mathematics. Downstream consumers: Definition X.9.6h.4, Theorem X.9.6h.5, Corollary X.9.6i.2 and `TV-X-21`. Nonvacuity: with one eigenvalue $1$ in sector $C$ and one eigenvalue $2$ in sector $W$ at $\Lambda_{\mathrm{SA}}=1$, the pair $(S_{f,C},S_{f,W})=(f(1),f(2))$ attains every point of $(0,\infty)^2$. Proposition X.9.6h.5a gives `nonentailment` of every cutoff-dependent spectral-action coefficient from the spectral data $(D_P,\{P_s\},\Lambda_{\mathrm{SA}})$ alone and proves that the forward lock $\chi_{\mathrm{SA}}$ carries the whole cutoff dependence. Enumeration of the admissible triples and target-independent cutoffs, and forward computation of all coefficients with certified tails (`M+C`), together with the realization of the spectral data (`R`) and the observable map to gauge-Higgs outputs (`O`), remain live under `TV-X-21`.

**Remark X.9.6h.6 (Cross-Ledger Equivalence Gate).** A future cross-ledger equivalence record connecting the anomaly, modular, geometric, spectral, and thermodynamic ledgers must be entered as an explicit finite gate before any global-equivalence conclusion is used. Such a gate must supply:

1. the accepted finite record for each participating ledger;
2. the compression or projection map from the master predictive operator, or from a registered finite functional-calculus image of it, to each ledger;
3. pairwise naturality squares on the retained PPI quotient;
4. triangle-closure checks for all triples of ledgers;
5. a parent obstruction class only if the required equalizer or fiber-product datum exists in the finite obstruction complex;
6. a registry commitment fixing all maps and overlap checks before any cross-ledger numerical or structural consequence is invoked.

Pairwise compatibility with the master operator does not by itself imply that all ledgers are one global object, that any subcollection determines the rest, or that all sector obstruction classes vanish together. Those conclusions require the additional finite gate data listed above.

**Definition X.9.6i (Numerical Projection Ledger).** A numerical projection ledger is a finite status-preserving map
$$
\mathfrak P_{\mathrm{num}}:
\mathfrak D_{\mathrm{PU}}
\longrightarrow
\prod_c
(\mathrm{name}_c,\mathrm{status}_c,\mathrm{formula}_c,\mathrm{value}_c,\mathrm{residual}_c)
\tag{X.9.6.37}
$$
whose entries are fixed before validation comparison. The status tag is part of the datum and may be one of:

1. theorem-level on an accepted certificate branch;

2. canonical branch value with stated residual;

3. reference-convention value;

4. model-layer value;

5. observational inversion, not a prediction.

A numerical entry is PU-internal only when its formula is a fixed algebraic, heat, zeta, eta, determinant, finite-part, or certified response projection of the branch data already admitted by Corollary X.9.6e.

**Theorem X.9.6i.1 (Status-Preserving Numerical Projection Evaluator).** On any branch carrying $\mathfrak P_{\mathrm{num}}$, the following projection entries are locked by their displayed formulas and inherit exactly the displayed status labels:
$$
u^*
=
2^{1/8}-1
=
0.090507732665257659207\ldots,
\tag{X.9.6.38}
$$
$$
\alpha_{\mathrm{Th},0}^{-1}
=
\frac{4\pi}{u^*}
-\frac{\pi}{\sqrt{3}}
+\frac{\pi u^*}{24\sqrt{3}}\frac{\sin u^*}{u^*}
=
137.03609205522863\ldots,
\tag{X.9.6.39}
$$
with status: certificate-core Thomson branch value; theorem-level interval only on an accepted Thomson normalization certificate together with an accepted all-orders residual certificate or residual-operator gate;
$$
\Lambda_{5}L_P^2
=
8\pi(0.923)e^{-283}
=
2.884716788730471\ldots\times10^{-122},
\tag{X.9.6.40}
$$
with status: Appendix U five-mode reference-convention value;
$$
\Lambda_{4,\mathrm{diag}}L_P^2
:=
8\pi(0.923)e^{-284}
=
1.0612280001760434\ldots\times10^{-122},
\tag{X.9.6.41}
$$
with status: reference-convention value used only as a purely algebraic same-prefactor diagnostic obtained by reusing the five-mode working convention $A_{\mathrm{eff}}=0.923$; it is neither a four-mode decay output nor a physical cosmological row. The current values satisfy $w_4^{\mathrm{dec}}=w_4^{\mathrm{real}}=\Lambda_4L_P^2=\varnothing_{\mathrm{cert}}$: $\mathfrak C_{U,\mathrm{mark}}$, exact $\mathfrak C_{U,\mathrm{act}}$, and complete $\mathfrak F_U^{(4)}$ are required for the decay magnitude, while $\mathfrak R_\Lambda^{(4)}$ must independently derive the real coefficient and any claimed decay-to-real equality;
$$
A_{\mathrm{eff}}^{(\mathrm{obs},4)}
=
\frac{\Lambda_{\mathrm{obs}}L_P^2}{8\pi e^{-284}}
=
2.49\pm0.04,
\tag{X.9.6.42}
$$
with status: observational inversion under the independently stipulated action placement $S=284$, not a forward Fredholm evaluation; a separately accepted carrier-marking/action record and canonical $\mathfrak F_U^{(4)}$ may supply an independent interval for comparison, while $\mathfrak R_\Lambda^{(4)}$ is still required for a physical cosmological constant; none converts the inversion itself into a prediction;
$$
Q
=
\sqrt{\frac12}\,e^{-11}
=
1.180988588613142529148\ldots\times10^{-5},
\tag{X.9.6.43}
$$
with status: leading primordial branch value at $A_Q=1$;
$$
A_s r
=
\frac{e^{-22}}{4\pi^2}
=
7.065805222550351\ldots\times10^{-12},
\tag{X.9.6.44}
$$
with status: leading primordial product-lock value at $A_Q=1$;
$$
\eta_B
=
0.282\cdot0.9997\cdot0.63\cdot
\exp\left[-\left(19.25+\frac{\ln2}{3}\right)\right]
=
6.151021447823927981\ldots\times10^{-10},
\tag{X.9.6.45}
$$
with status: Appendix Y illustrative transport-branch factor product. It is theorem-level only when one forward-locked common record proves the Theorem-Y.11.2 additive-action/complement/readout package, the independent $\varepsilon_0=\ln2$ and $N_g=3$ branches, the exact values of all displayed prefactors, and the product's evaluated equality to an accepted finite transport interval under Corollary Y.6.1e or Corollary Y.11.7g; the displayed point equality additionally requires a singleton residual interval.

*Proof.* Each entry is a deterministic image of fixed branch quantities under ordinary arithmetic. Equation (X.9.6.38) follows from the capacity-saturation value $u^*=2^{1/8}-1$. Substituting (X.9.6.38) and $K_0=3$ into the sinc-improved Thomson certificate-core expression of Definition Z.27.11a with $R_\alpha=0$ gives (X.9.6.39). Substituting the Appendix U reference prefactor $A_{\mathrm{eff}}=0.923$ into
$$
\Lambda L_P^2=8\pi A_{\mathrm{eff}}e^{-2\kappa}
$$
with $\kappa=141.5$ gives the reference value (X.9.6.40), while reusing that five-mode prefactor and changing only the exponent to $\kappa=142$ gives the same-prefactor diagnostic (X.9.6.41), not a four-mode Fredholm evaluation. Solving the formula observationally for the prefactor at $\kappa=142$ gives the inversion (X.9.6.42), which is likewise not a forward evaluation. Equations (X.9.6.43) and (X.9.6.44) follow from the leading primordial branch $Q^2=\frac12 e^{-22}$ and the product-lock identity $A_s r=e^{-22}/(4\pi^2)$. Equation (X.9.6.45) is the displayed product of the Appendix Y transport factors.

The status labels are preserved because the arithmetic evaluation does not change the logical source of any input. A reference-convention prefactor remains a reference-convention prefactor after multiplication. An observational inversion remains an inversion after solving for the prefactor. A certificate-core branch value remains interval-incomplete until its residual certificate is accepted, and it remains certificate-dependent if one of its normalization maps is certificate-dependent. Therefore the projection ledger locks the numerical images while preventing promotion of uncertified entries to theorem-level status. ∎

**Corollary X.9.6i.2 (No Numerical Refit After Projection).** Once an entry of $\mathfrak P_{\mathrm{num}}$ is registered, changing any formula coefficient, prefactor, finite-part convention, residual interval, or status label after comparison with data defines a new branch and cannot confirm the original numerical projection.

*Proof.* The numerical value is a deterministic image of the registered finite record by Theorem X.9.6i.1. Altering a coefficient, prefactor, finite-part convention, residual interval, or status label changes the finite record or the projection map. By Corollary X.9.6e it is then a different spectral or branch datum, and by Corollary P.6.1b.8 it cannot be treated as the same physical projection unless the change is response-null. A response-null change cannot alter the numerical value or its validation interval. ∎

**Definition X.9.6i.3 (Finite Calibration Connection Record).** A finite calibration connection record is a tuple
$$
\mathfrak C_{\mathrm{cal}}
=
(\{U_i\},g_{ij},\mathcal A_{\mathrm{cal}},\mathcal F_{\mathrm{cal}},\{\gamma_a\},\{\Sigma_a\},\{\pi_a\},\chi_{\mathrm{cal}})
\tag{X.9.6i.3}
$$
where $\{U_i\}$ is a finite protocol atlas over the retained response quotient, $g_{ij}$ are fixed transition maps on overlaps, $\mathcal A_{\mathrm{cal}}$ is a finite connection one-cochain, $\mathcal F_{\mathrm{cal}}$ is its curvature two-cochain, $\gamma_a$ are registered sector loops, $\Sigma_a$ are registered residual two-cycles, $\pi_a$ are sector projection maps, and $\chi_{\mathrm{cal}}$ records the regulator, finite-part convention, normalization, and tail certificate fixed before validation comparison. A sector constant $c_a$ is calibration-internal only if it is registered as
$$
c_a
=
\pi_a\operatorname{Hol}_{\gamma_a}(\mathcal A_{\mathrm{cal}})
\tag{X.9.6i.4}
$$
or as a curvature residual
$$
R_a
=
\pi_a\langle[\mathcal F_{\mathrm{cal}}],\Sigma_a\rangle.
\tag{X.9.6i.5}
$$

**Theorem X.9.6i.4 (Calibration Holonomy No-Retuning Gate).** Suppose a closed finite numerical branch carries a calibration connection record $\mathfrak C_{\mathrm{cal}}$. If its retained calibration curvature vanishes,
$$
\mathcal F_{\mathrm{cal}}=0,
\tag{X.9.6i.6}
$$
then all calibration-internal sector constants are projections of the same flat finite-response record, including its registered flat-holonomy class, and cannot be renormalized independently sector by sector. If $\mathcal F_{\mathrm{cal}}\ne0$, every admitted mismatch must be one of the explicitly registered curvature or holonomy residuals. Changing a transition map, finite part, normalization, regulator, loop, cycle, projection, holonomy class, or residual after comparison with data defines a different branch.

*Proof.* Vanishing curvature is the flatness condition. A flat connection can retain global holonomy on a nonsimply connected overlap complex, so that holonomy class is part of $\mathfrak C_{\mathrm{cal}}$. Each $c_a$ in (X.9.6i.4) is therefore a projection of the single registered connection record. For nonzero retained curvature, its registered cycle pairings and holonomies are the declared obstruction components; no unregistered residual belongs to the branch. Altering any entry changes either the response record or its projection map, and Corollary X.9.6i.2 classifies the result as a different branch. ∎

**Corollary X.9.6i.7 (Finite Fundamental-Cycle Calibration Audit).** Suppose the one-skeleton of a populated finite calibration atlas has selected overlap transitions in a finite group with exact multiplication and equality. Choose a spanning tree. The ordered holonomies of the fundamental cycles associated with the non-tree edges form a complete finite audit inventory for a global vertex gauge on that selected one-skeleton transition record: such a vertex gauge exists exactly when every fundamental-cycle holonomy is the identity. When the calibration record permits nontrivial flat holonomy, the same computation returns its exact generators; each nonidentity result must occur on a registered loop and in the registered holonomy class. An unregistered residual rejects the asserted one-skeleton cross-ledger equivalence on that record. Naturality squares, naturality triangles, and curvature two-cells of the full atlas remain separate typed and populated gates.

*Proof.* Apply Theorem D.8.9c.3 to the selected transition labels. Its tree propagation proves the identity criterion and returns each failed chord with its ordered fundamental-cycle holonomy. Retaining rather than trivializing a flat connection changes the acceptance predicate from identity to membership in the holonomy class fixed by Definition X.9.6i.3; exact computation of the same cycle products decides that predicate. Proposition F.10.12h executes one flat and one obstructed $S_3$ triangle. Theorem D.8.9c.1 supplies the parallel additive Hilbert-valued audit. Naturality squares and triangles of an unpopulated atlas, continuous transition groups, curvature two-cells, and the physical calibration record remain the mathematical and populated inputs required by Definition X.9.6i.3. ∎

**Theorem X.9.6i.8 (Complete Cell Audit of a Typed Calibration Atlas).** Type a populated calibration atlas as a record
$$
\mathfrak X_{\mathrm{cal}}
=
(X,G,R,\{r_v\}_{v\in V},\{g_{vu}\},\rho)
\tag{X.9.6i.8.1}
$$
where $X$ is a finite connected two-dimensional cell complex whose vertex set $V$ lists the participating charts or ledgers, whose oriented edges, forming the set $E$, are the selected overlaps, and whose two-cells $\sigma\in X_2$ are the registered curvature cells, each attached along a closed edge walk $\partial\sigma$ with base vertex $a(\sigma)$; $G$ is a group whose elements are given with exact multiplication, inversion and equality; $R$ is a $G$-set carrying the retained ledger records in the chart frames fixed by the atlas; $r_v\in R$ is the record projected to the vertex $v$; each edge $u\to v$ carries $g_{vu}\in G$ with reverse label $g_{uv}=g_{vu}^{-1}$, as in Theorem D.8.9c.3; and $\rho$ is the registered flat-holonomy class, equal to the trivial class when no flat holonomy is retained. The naturality square of the edge $u\to v$ is
$$
r_v=g_{vu}\cdot r_u,
\tag{X.9.6i.8.2}
$$
which is the overlap equation (X.9.5.6); the curvature of the cell $\sigma$ is $F_\sigma=\operatorname{Hol}(\partial\sigma)$ in the ordered convention (D.8.9c.3.2); and a naturality triangle is the flatness condition $F_\sigma=1$ of a triangular cell. Vertex gauges $k\in G^V$ act by $g_{vu}\mapsto k_v^{-1}g_{vu}k_u$ and $r_v\mapsto k_v^{-1}\cdot r_v$. Fix a spanning tree $T$ with root $v_0$, let $k^T$ be the tree transport with $k^T_{v_0}=1$ and $k^T_v=g_{vu}k^T_u$ along tree edges, and let
$$
c_e=(k^T_v)^{-1}g_{vu}k^T_u,
\qquad
e=(u\to v)\in E\setminus T,
$$
be the fundamental-cycle holonomy of the chord $e$. Let $w_\sigma$ be the word obtained by reading $\partial\sigma$ in the order (D.8.9c.3.2), deleting tree edges, and writing $x_e$ or $x_e^{-1}$ for each chord traversed along or against its orientation, and let
$$
\Pi_T
=
\langle x_e,\ e\in E\setminus T\ \mid\ w_\sigma,\ \sigma\in X_2\rangle
\tag{X.9.6i.8.3}
$$
be the resulting edge-path presentation of $\pi_1(X,v_0)$. Then:

1. *Curvature cells.* For every cell $\sigma$,
$$
F_\sigma
=
k^T_{a(\sigma)}\,w_\sigma(c)\,\bigl(k^T_{a(\sigma)}\bigr)^{-1}.
$$
Every curvature two-cell, and in particular every naturality triangle, is therefore flat exactly when $w_\sigma(c)=1$, and each nonflat cell returns its exact curvature conjugacy class.

2. *Classification.* The chord map $\{g_{vu}\}\mapsto(c_e)_{e\in E\setminus T}$ induces a bijection from transition records modulo vertex gauge onto $G^{E\setminus T}$ modulo simultaneous conjugation, and it restricts to a bijection from flat transition records modulo vertex gauge onto $\operatorname{Hom}(\Pi_T,G)/G$. A flat record admits a global vertex gauge with identity transitions exactly when its class is the trivial homomorphism, and it carries the registered flat holonomy exactly when its class is $\rho$. For finite $G$ there are exactly $|G|^{|V|-1}\,|\operatorname{Hom}(\Pi_T,G)|$ flat transition records. For a complex without two-cells, $\Pi_T$ is free on the chords and this item reduces to Corollary X.9.6i.7.

3. *Squares and cells.* If every naturality square (X.9.6i.8.2) commutes, then $\operatorname{Hol}(\gamma)\in\operatorname{Stab}_G(r_v)$ for every closed edge walk $\gamma$ based at $v$, and in particular $F_\sigma\in\operatorname{Stab}_G(r_{a(\sigma)})$ for every cell. When $G$ acts freely on the orbits containing the records, commuting squares force every closed-walk holonomy to equal $1$, so the record admits a global vertex gauge with identity transitions. When stabilizers are nontrivial, the square audit fixes cell curvature only modulo the stabilizer and the two gates are logically independent: for $S_3$ acting on $\{1,2,3\}$, the triangle $(a,b,c)$ with every record equal to $3$, $g_{ba}=(1\,2)$ and $g_{cb}=g_{ac}=1$ has commuting squares and curvature $(1\,2)$, while the triangle with identity transitions and records $(r_a,r_b,r_c)=(1,2,1)$ is flat and has a failing square.

4. *Termination.* After one tree construction, the triangle and curvature-cell gates use $\sum_\sigma|\partial\sigma|$ group multiplications and equality tests in $G$. The square gates use $|E|$ action evaluations and equality tests in $R$, and they are decided when the action map $G\times R\to R$ is computable and equality in $R$ is decidable, in particular when $R$ is finite and given by an action table. The comparison of $(c_e)$ with a representative of $\rho$ is one simultaneous-conjugacy test, which takes at most $|G|$ conjugations for finite $G$ and, for infinite $G$, is decided by a simultaneous-conjugacy decision procedure for $G$ registered with the atlas; enumerating $\operatorname{Hom}(\Pi_T,G)$ for finite $G$ inspects at most $|G|^{|E\setminus T|}$ chord tuples.

Consequently the naturality-square, naturality-triangle and curvature-cell gates left open in Corollary X.9.6i.7 and listed in Remark X.9.6h.6 are characterized by items 1–3 on every populated atlas of type (X.9.6i.8.1) and decided exactly on every effective atlas, meaning one with computable action on $R$, decidable equality in $R$ and, when $G$ is infinite, a registered simultaneous-conjugacy procedure for the comparison with $\rho$; the returned chord classes and cell curvatures are the complete list of loop residuals that the calibration record must register under Definition X.9.6i.3.

*Proof.* Item 1. Under a vertex gauge $k$, each factor $g_{v_{i+1}v_i}$ of a closed walk $(v_0,\ldots,v_m=v_0)$ becomes $k_{v_{i+1}}^{-1}g_{v_{i+1}v_i}k_{v_i}$, so the ordered product telescopes to $k_{v_0}^{-1}\operatorname{Hol}(\gamma)k_{v_0}$. The gauge $k^T$ carries every tree label to $1$ and every chord label to $c_e$, so in the gauged record the product along $\partial\sigma$ keeps only the chord factors, in the order and with the exponents defining $w_\sigma$. Hence $(k^T_{a(\sigma)})^{-1}F_\sigma k^T_{a(\sigma)}=w_\sigma(c)$, and conjugation preserves the identity.

Item 2. Every record is gauge equivalent, through $k^T$, to its tree-normal form, which has identity tree labels and chord labels $c_e$, and every chord tuple occurs as a tree-normal form. A gauge preserves identity tree labels exactly when $k_v=k_u$ along every tree edge, that is, when $k$ is constant on the connected tree; a constant gauge $k$ acts by $c_e\mapsto k^{-1}c_ek$. This proves the first bijection. Flatness is gauge invariant because gauges conjugate holonomies, and by item 1 a tree-normal record is flat exactly when its chord tuple satisfies every relator $w_\sigma$, that is, defines a homomorphism $\Pi_T\to G$; this proves the second bijection. The trivial homomorphism is fixed by conjugation, and its class consists of the records whose fundamental-cycle holonomies are all $1$; the gauge $k^T$ carries each such record to identity transitions, and a record gauge equivalent to identity transitions has every closed-walk holonomy conjugate to $1$, hence equal to $1$. Membership in $\rho$ is equality of gauge classes by the definition of $\rho$. For finite $G$, a record is fixed by its $|V|-1$ tree labels, which are arbitrary, and its chord labels, which correspond bijectively to chord holonomies through $g_{vu}=k^T_vc_e(k^T_u)^{-1}$; flatness depends on the chord holonomies alone, which gives the count. Without two-cells there are no relators and the flat records are all records, as in Corollary X.9.6i.7. The group $\Pi_T$ is the standard edge-path presentation of the fundamental group of a connected two-dimensional cell complex; the classification uses only the displayed presentation.

Item 3. Along a closed walk $(v_0,\ldots,v_m=v_0)$, commuting squares give $r_{v_{i+1}}=g_{v_{i+1}v_i}\cdot r_{v_i}$ for each step, including reversed traversals because $g_{uv}=g_{vu}^{-1}$. Composing the steps gives $r_{v_0}=\operatorname{Hol}(\gamma)\cdot r_{v_0}$. A free action forces $\operatorname{Hol}(\gamma)=1$, in particular $c_e=1$ for every chord, and the gauge $k^T$ then carries the record to identity transitions. In the first $S_3$ triangle, $(1\,2)$ fixes $3$, so all three squares commute, while $F=g_{ac}g_{cb}g_{ba}=(1\,2)\ne1$. In the second, $F=1$ and $r_b=2\ne1=g_{ba}\cdot r_a$.

Item 4 counts the operations in items 1–3 and the chord tuples of $G^{E\setminus T}$; each operation is an exact group operation, an evaluation of the action, an equality test in $G$ or $R$, or the registered conjugacy test. ∎

**Resolution TV-X-22-R1 (Metadata).** Exact domain: populated calibration atlases typed as (X.9.6i.8.1), with exact group labels, a finite connected two-dimensional cell complex of overlaps and registered curvature cells, and records in one $G$-set. Premises: connectedness of $X$, exact multiplication, inversion and equality in $G$, records expressed in the chart frames fixed by the atlas, and, for the decision statements, a computable action with decidable equality in $R$ and, for infinite $G$, a registered simultaneous-conjugacy procedure. Equivalence: vertex gauge on transition records; simultaneous conjugation on chord tuples. Budget: the operation count of item 4. Verifier: exact group and $G$-set arithmetic along the spanning tree, the edges and the cell boundaries. Falsifier: a flat cell with nonidentity relator value, an accepted nonflat cell, two gauge-inequivalent records with conjugate chord tuples, or commuting squares together with a closed-walk holonomy outside the record stabilizer. Provenance class: source-internal finite mathematics. Downstream consumers: Definition X.9.6i.3, Theorem X.9.6i.4, Corollary X.9.6i.7, Remark X.9.6h.6, Theorem D.8.9c.3 and `TV-X-22`. Nonvacuity: the two $S_3$ triangles of item 3; for $G=S_3$ on the boundary of a tetrahedron, exhaustive enumeration returns $216=6^3\cdot1$ flat records forming one gauge class, and on a triangle without two-cells it returns $216$ records forming three classes, one for each conjugacy class of $S_3$. Theorem X.9.6i.8 gives `positive-discharge` of the mathematical audit component of `TV-X-22`, namely the characterization of the square, triangle and curvature-cell gates and the classification of retained loop residuals for every atlas of type (X.9.6i.8.1), with exact decision on every effective atlas, in particular on every atlas with finite $G$ and finite $R$. Typing and populating the actual PU calibration atlas as an effective atlas, with its record $G$-set, its registered holonomy class and, for an infinite transition group, a simultaneous-conjugacy procedure (`C`), remain live under `TV-X-22`.
