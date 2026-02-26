# Appendix X: PU and the Effective Action

## X.0 Overview and Scope

This appendix establishes the precise relationship between the Predictive Universe (PU) framework and the quantum/statistical **effective action** formalism. We connect the **predictive free energy** and its **natural‑gradient RG** flow (Appendix D) to **Wilsonian coarse‑graining**, the **1PI effective action** $\Gamma$, and the **functional RG** (FRG), including the **gauge** and **gravitational** sectors and the open‑system (Schwinger–Keldysh) structure required for ND‑RID. Throughout we use natural units $c=\hbar=k_B=1$, spacetime signature $(-,+,+,+)$, and Heaviside–Lorentz electromagnetic conventions.


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

defined up to an additive constant. This ensures that $W,\Gamma$ agree with the standard definitions in statistical field theory up to $J$‑independent additive constants, adapted to the PU coarse‑graining context. At vanishing sources $J=0$, stationary configurations $\delta\Gamma/\delta\Phi=0$ are the PU macrostates at the chosen resolution.

**Proposition X.1 (Information geometry and curvature).**
Let $\mathcal G_{ab}(x,y)=\delta^2 W/\delta J^a(x)\delta J^b(y)$ be the connected two‑point kernel. Then

$$
\Gamma^{(2)}_{ab}(x,y):=\frac{\delta^2\Gamma}{\delta\Phi_a(x)\delta\Phi_b(y)}
\quad\text{satisfies}\quad
\int\! d^dz\, \mathcal G_{ac}(x,z)\,\Gamma^{(2)}_{cb}(z,y)=\delta_{ab}\delta^{(d)}(x-y).
\tag{X.3}
$$

Under conditions where the distribution $p_\theta$ forms an exponential family parameterized by sources related to $\theta$, and assuming local asymptotic normality (LAN), the Fisher information metric is related to the connected correlator $\mathcal G_{ab}$. The Hessian of $\Gamma$ (the inverse propagator in QFT language) is the functional inverse of $\mathcal G_{ab}$.


## X.2 Wilsonian Coarse‑Graining and Functional RG

Introduce a momentum‑scale dependent infrared (IR) regulator $R_k$ which suppresses modes with momenta $q\lesssim k$. The scale‑dependent effective average action $\Gamma_k$ is defined via a modified Legendre transform incorporating this regulator. Its (Wetterich) functional RG flow equation is [Wetterich 1993]:

$$
\partial_k \Gamma_k[\Phi]\;=\;\frac{1}{2}\,\mathrm{STr}\!\Big[\big(\Gamma^{(2)}_k[\Phi]+R_k\big)^{-1}\,\partial_k R_k\Big],
\tag{X.4}
$$

with $\mathrm{STr}$ the supertrace (minus sign for fermions/ghosts), while $\Gamma_k$ encodes the full (regulator‑dependent) dynamics. In the **Abelian sector (QED)** the flow of the electromagnetic coupling reads, to leading order and with $t:=\ln k$ [Wetterich 1993],
$$
\partial_t\,\alpha^{-1}(k)\;=\;-\,\frac{2}{3\pi}\sum_{f}\,N_c^{(f)} Q_f^{2}\,\ell_1^{\mathrm F}\!\left(\frac{m_f^{2}}{k^{2}}\right)\;+\;O(\alpha),
$$
where $\ell_1^{\mathrm F}(y)$ is the fermionic threshold function (e.g., Litim regulator: $\ell_1^{\mathrm F}(y)=\frac{1}{1+y}\,\Theta(1-y)$ [Litim 2001]), $N_c^{(f)}$ is color multiplicity, and $Q_f$ the electric charge. Integrating,
$$
\alpha^{-1}(k)\;=\;\alpha^{-1}(\mu^{\*})\;-\;\frac{2}{3\pi}\sum_{f} N_c^{(f)} Q_f^{2}\int_{\ln \mu^{\*}}^{\ln k}\!dt\;\ell_1^{\mathrm F}\!\left(\frac{m_f^{2}}{e^{2t}}\right).
$$
With the PU bulk normalization $\kappa^{\*}_{\mathrm{bulk}}=1$ (Appendix Z, Theorem Z.14) one has the **boundary condition** $\alpha_{\mathrm{bulk}}(\mu^{\*})=u^{\*}/(4\pi)$, and the piecewise integral (set by fermion thresholds $m_f$) produces a predictive **band** for $\alpha^{-1}(m_Z)$.

**Corollary X.2 (Fixed points and relevant directions).**
At a fixed point, directions with negative eigenvalues of the $\Gamma_k$ stability matrix are RG‑relevant (grow under $k\downarrow 0$), while positive‑eigenvalue directions are irrelevant.



## X.3 Gauge Sector: Background‑Field Method and Normalization

Let $A_\mu=\bar A_\mu+a_\mu$ with background‑field gauge fixing preserving background invariance. The gauge part of the effective action reads

$$
\Gamma^{\text{gauge}}_k[\bar A]
=\int d^4x\,\Big[-\,\frac{Z_A(k)}{4}\,F_{\mu\nu}(\bar A)F^{\mu\nu}(\bar A)+\cdots\Big],
\tag{X.5}
$$

where dots include gauge‑invariant higher operators and the background‑invariant gauge‑fixing/ghost sector. A Ward identity ensures that the renormalization of the background gauge coupling depends only on the background‑field wavefunction factor $Z_A(k)$. The physical coupling satisfies

$$
e^2(k)=\frac{u(k)}{\kappa(k)},\qquad
\alpha_{\mathrm{em}}(k)=\frac{e^2(k)}{4\pi}=\frac{u(k)}{4\pi\,\kappa(k)},
\tag{X.6}
$$

with $u=g_e^2$ the PU rate-level deformation and $\kappa(k)$ the field-strength normalization. In background-field normalization (X.5) one may take $\kappa(k)=Z_{\text{map}}\,Z_A^{-1}(k)$, where $Z_A(k)$ is the background-field wavefunction factor and $Z_{\text{map}}$ accounts for the PU→canonical field mapping. At the PCE-Attractor (Appendix Z), $u^*=8^{1/24}-1$ and $\kappa^*_{\mathrm{bulk}}=1$ by the Predictive Ward Identity (Theorem Z.14); the physical normalization $\kappa_{\mathrm{eff}}=1+\delta\kappa$ includes the discrete–continuous interface correction $\delta\kappa = -(a/d_0) \cdot u^*/\sqrt{K_0}$ derived in Section Z.17.

## X.4 Gravitational Sector: $\Gamma[g]$, Wald Entropy, and Area Law

The geometric sector of the effective action takes the diffeomorphism‑invariant form

$$
\Gamma^{\text{grav}}_k[g]
=\int d^4x\sqrt{-g}\,\Big[\frac{1}{16\pi G(k)}\,\big(R-2\Lambda(k)\big)
+\sum_i c_i(k)\,\mathcal O_i[g]\Big],
\tag{X.7}
$$

with curvature invariants $\mathcal O_i$ (e.g., $R^2,R_{\mu\nu}R^{\mu\nu},\dots$). Appendix E imposes **thermodynamic consistency** via the local Clausius relation and the **Wald entropy density** on local Rindler sections. In $D=4$, consistency with the **Bekenstein–Hawking area coefficient** selects the Einstein–Hilbert structure at leading order (Appendix E; Section 12), yielding field equations

$$
\frac{\delta \Gamma^{\text{grav}}}{\delta g_{\mu\nu}}
= \frac{\sqrt{-g}}{16\pi G}\,\Big(R^{\mu\nu}-\tfrac12 R g^{\mu\nu}+\Lambda g^{\mu\nu}\Big)
= -\,\frac12 \sqrt{-g}\,T^{(MPU)\,\mu\nu}.
\tag{X.8}
$$

The area‑law coefficient $1/(4G)$ is fixed microscopically by Appendix E, while scale dependence $G(k)$ is discussed in Appendix I and Section 12.5; in $D>4$ the same Clausius/Wald logic selects the Lovelock class.



## X.5 Open‑System Structure for ND‑RID: Schwinger–Keldysh $\Gamma_{\rm CTP}$

ND‑RID implies intrinsically **open** macroscopic dynamics. Introduce doubled fields $\Phi_\pm$ on the closed‑time path and define

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

with $\Gamma^{R}$ retarded, $\Gamma^{A}=(\Gamma^{R})^\dagger$, and $-i\Gamma^{K}\succeq 0$ (noise positivity). Near local equilibrium the KMS condition constrains $\Gamma^{K}$ consistently with the fluctuation–dissipation relations implied by the local second law (Appendix E). Setting $\Phi_+=\Phi_-=\Phi$ yields the physical coarse‑grained equations with causal dissipation.



## X.6 Rate‑Level PCE Potential vs. Effective Potential

For homogeneous deformations $u=g_e^2$, define the **effective potential**

$$
V_{\rm eff}(u;k)\ :=\ \frac{1}{\mathcal{V}}\;\Gamma_k[u\ \text{const}],\qquad \mathcal{V}=\int d^4x.
\tag{X.10}
$$

Appendix G.9 defines a **rate‑level PCE potential** $\phi(u)$ capturing the power‑benefit trade‑off for maintaining $U(1)$ coherence; in the $U(1)$ sector the rate-level cost term is quadratic as in Appendix W (Equation (W.0.1)), hence $\gamma_{\rm eff}=2$. The PU **capacity constraint** (Appendix W; flat spectrum at the PCE‑Attractor) reads

$$
M\ln(1+\lambda u)=\ln d_0.
\tag{X.11}
$$

At the **PCE-Attractor** (Definition 15a), the system by definition operates at the capacity boundary. This means the constrained minimization of the rate-level potential $\phi(u)$ is equivalent to finding the stationary point of the full effective potential $V_{\rm eff}$ under the capacity constraint (X.11), which can be formalized with a Lagrange multiplier $\zeta$:

$$
 \frac{d}{du}\Big(V_{\rm eff}(u;k)+\zeta\,[M\ln(1+\lambda u)-\ln d_0]\Big)\Big|_{u=u^*}=0.
 \tag{X.12}
 $$

Using this equivalence with $\gamma_{\rm eff}=2$ reproduces the zero‑slack condition employed in Appendix Z and the identities **Sections Z.7-Z.8**.

**Theorem X.3 (Predictive Ward Identity and Unity Normalization at the PCE-Attractor).** At the PCE-Attractor (Definition 15a), the bulk normalization is uniquely fixed:
$\kappa^*_{\mathrm{bulk}}=1.$

This is determined by an overconstrained system: (i) Legendre duality for $(W,\Gamma)$, (ii) the predictive Ward identity relating connected response to the QFI kernel, and (iii) capacity/QFI rigidity fixing the coupling in QFI-natural units (Appendix Z, Theorem Z.14).

1.  The predictive Ward identity relates the connected two-point kernel to the inverse information kernel:
    $$
    \mathcal{G}\;=\;\left.\frac{\delta^2 W}{\delta J\,\delta J}\right|_{J=0}\;=\;\mathcal{K}^{-1}.
    $$

2.  By Legendre duality (X.3),
    $$
    \Gamma^{(2)}\;=\;\mathcal{G}^{-1}\;=\;\mathcal{K}.
    $$

3.  In PU, $\mathcal{K}$ is canonically normalized by QFI geometry (Appendix Z, Theorem Z.5) and the attractor coupling $u^*$ is fixed by capacity saturation in those same units (Appendix Z, Theorem Z.7). The usual $U(1)$ field/coupling rescaling that would make $\kappa$ a convention is therefore obstructed, and the proportionality between the physical quadratic gauge kernel and $\mathcal{K}$ is uniquely $\kappa^*_{\mathrm{bulk}}=1$ (Appendix Z, Theorem Z.14).

Hence, at the MPU operational scale $\mu^*$ corresponding to the PCE-Attractor, the canonical Maxwell normalization is recovered. This fixes the bulk normalization $\kappa^*_{\mathrm{bulk}}=1$. The physical Thomson-limit coupling includes the interface correction from discrete-continuous embedding (Section Z.17):
$$
g^2 = u, \qquad \alpha^{-1} = \frac{4\pi\kappa_{\mathrm{eff}}}{u^*} = \frac{4\pi}{u^*} - \frac{\pi}{\sqrt{K_0}}
$$
where $\kappa_{\mathrm{eff}}=1-(a/d_0) \cdot u^*/\sqrt{K_0}$ and the active fraction is $a/d_0=1/4$.

## X.7 Computational Pipeline and Renormalization Conditions

1. **Microscopic MPU cycle → LAN block:** extract $(d_0,\varepsilon)$, the active kernel size $a=e^\varepsilon=2$, and the QFI spectrum $(M,\lambda)$ (Appendix Z; Appendix W).
2. **Construct $W_k[J]$:** choose sufficient statistics consistent with symmetries; include CTP doubling for ND‑RID (X.9).
3. **Legendre transform → $\Gamma_k$:** enforce background invariances; use background‑field method for gauge/gravity; add regulator $R_k$ and integrate (X.4).
4. **Renormalization conditions:** for $U(1)$, the bulk normalization $\kappa^*_{\mathrm{bulk}}=1$ follows from the Predictive Ward Identity (Theorem Z.14), and the interface correction $\delta\kappa = -(a/d_0) \cdot u^*/\sqrt{K_0}$ is derived from the active fraction and discrete-continuous embedding (Section Z.17); fix $G(k)$ via the area-law coefficient (Appendix E).
5. **Predictions:** evaluate $V_{\rm eff}$ and stationarity (X.10)–(X.12); run $k\downarrow 0$ and compare with protocols in Section 13.



## X.8 Summary of Correspondences

* **Predictive geometry ↔ response:** Fisher metric $\mathcal{G}$ (Appendix D) ↔ connected kernel $\mathcal{G}=\delta^2 W$; $\Gamma^{(2)}=\mathcal{G}^{-1}$ (X.3).
* **PU RG ↔ FRG:** KL‑monotone $c(b)$ (Appendix D) ↔ $\Gamma_k$ flow (X.4); relevant/irrelevant classification aligned via stability eigenvalues.
* **Gauge normalization:** $u=g_e^2$, $\alpha_{\mathrm{em}}=u/(4\pi\kappa)$ (X.6); $\kappa^*_{\mathrm{bulk}}=1$ (Theorem Z.14), $\kappa_{\mathrm{eff}}=1-(a/d_0) \cdot u^*/\sqrt{K_0}$ with $a/d_0=1/4$ (Section Z.17); $u^*=8^{1/24}-1$ (Section Z.8); Thomson limit $\alpha^{-1}=\frac{4\pi}{u^*}-\frac{\pi}{\sqrt{K_0}}+\frac{\pi u^*}{24\sqrt{K_0}}\left(1-\frac{u^{*2}}{6}\right)\approx 137.036092 \pm 0.000050$ (Appendix Z, Theorem Z.26).
* **Gravity:** $\Gamma^{\text{grav}}$ (X.7) + Wald entropy (Appendix E) ⇒ EFE (Section 12); $G$ from the area‑law coefficient; running $G(k)$ (Appendix I).
* **Open dynamics:** CTP $\Gamma_{\rm CTP}$ (X.9) encodes dissipation/noise consistent with the local second law (Appendix E) and algebraic locality (Appendix F).
* **Capacity saturation:** constraint (X.11) links $\phi(u)$ and $V_{\rm eff}$ stationarity (X.12), yielding the identities used in Appendix Z.


## X.9 Dualities as PCE-Cost Degeneracies

Dualities enter PU as *operational redundancies*: distinct descriptive formalisms that yield the same predictive content for the same Minimal Predictive Unit (MPU). In this framework, the central criterion is not microscopic ontological distinctness, but equality (up to coarse-grained readout relabeling) of the induced predictive distributions at fixed MPU constraints (finite local dimension $d_0$, irreversibility $\varepsilon$, and the minimum processing timescale $\tau_{min}$). When two descriptions are operationally indistinguishable at that resolution, PCE cannot prefer one without introducing non-operational structure; consequently, such descriptions form degenerate minima of the PCE objective (Definition D.1) when expressed through the effective-action proxy (Appendix X).

### X.9.1 Operational Description Classes

To formalize duality, we first specify the mathematical structure of a "description" at MPU resolution.

**Definition X.9.0 (Predictive Description Tuple).**
A **predictive description** $\mathcal{D}$ at MPU resolution $(d_0, \varepsilon, \tau_{min})$ consists of a quadruple $\mathcal{D} = (\mathcal{M}, \mathcal{S}_E, \delta, \mathcal{P})$ where:
1. $\mathcal{M}$ is a coarse-grained model class (field content, degrees of freedom),
2. $\mathcal{S}_E$ is an effective action/likelihood family on $\mathcal{M}$,
3. $\delta > 0$ is the MPU coarse-graining scale (mean microscopic MPU spacing) held fixed when comparing descriptions at a given MPU resolution (Definition 35; Appendix E),
4. $\mathcal{P}$ is a measurement/inference protocol specifying how observables $O \in \mathcal{O}$ yield outcome distributions over a measurable outcome space $\Omega_O$.

*Remark: Resolution Identification.* The coarse-graining scale $\delta$ serves dual roles: (i) the mean microscopic MPU spacing defining the physical resolution of the description (Definition 35), and (ii) the outcome binning resolution for operational measurements via $G_\delta$. We adopt the operational identification that the finest admissible readout binning is set by the MPU spacing, consistent with the minimum cycle time $\tau_{min}$ (Theorem 29).


**Definition X.9.1 (MPU-Equivalent Descriptions).**
Let $\mathcal{O}$ denote the set of operational observables admissible at MPU resolution, let $\mathcal{C}$ denote the admissible contexts (constraints, preparations, boundary data), and for each $O \in \mathcal{O}$ let $\Omega_O$ denote the outcome space of $O$ equipped with a $\sigma$-algebra. Let $G_\delta: \Omega_O \to \Omega_O^{(\delta)}$ denote the coarse-graining map that bins outcomes at resolution $\delta$.

Two descriptions $\mathcal{D}_1, \mathcal{D}_2$ are **MPU-equivalent** if and only if there exists a family of measurable bijections $\{\sigma_O\}_{O \in \mathcal{O}}$ with $\sigma_O:\Omega_O^{(\delta)} \to \Omega_O^{(\delta)}$ such that, for all observables $O \in \mathcal{O}$, all contexts $c \in \mathcal{C}$, and all measurable outcome events $E \subseteq \Omega_O^{(\delta)}$:
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
- for each observable $O \in \mathcal{O}$, $\sigma_O: \Omega_O^{(\delta)} \to \Omega_O^{(\delta)}$ is a measurable bijection acting only on coarse-grained readout labels,

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

A central technical point is that PCE optimization is performed on predictive content (Definition D.1 and Equation D.0), and Appendix X constructs an effective-action proxy for that content via $W_k[J]$ and $\Gamma_k[\Phi]$.

**Proposition X.9.3 (Reparameterization Invariance of the Natural-Gradient Proxy).**
Work at fixed RG scale $k$ with the regulated generating functional $W_k[J]$ and effective average action $\Gamma_k$ of Appendix X, so that the Legendre duality (Appendix X, Equation X.2) is well-defined on the operational source domain.

Suppose two descriptions $\mathcal{D}_1, \mathcal{D}_2$ are related by an invertible change of variables in the regulated functional integral (field redefinition and/or auxiliary-field introduction/elimination) that:
1. preserves the operational operator insertions $\{\mathcal{O}_a\}$ up to MPU-trivial relabeling (Definition X.9.2), and
2. has a functional Jacobian whose contribution is independent of the sources $J$ and either (i) is field-independent (so it factors as an overall constant), or (ii) can be absorbed into $\mathcal{S}_E$ as a $J$-independent counterterm already permitted by the symmetry/renormalization conditions defining the description class.


Then $W_k[J]$ and all connected correlators of operational observables coincide between $\mathcal{D}_1$ and $\mathcal{D}_2$. Consequently:
1. $\mathcal{D}_1$ and $\mathcal{D}_2$ are MPU-equivalent (Definition X.9.1), and
2. under the conditions of Proposition X.1—specifically, when the coarse-grained distribution $p_\theta$ forms an exponential family and satisfies local asymptotic normality (LAN)—the connected two-point kernel $\mathcal{G}_{ab}(x,y) = \delta^2 W_k / \delta J^a(x) \delta J^b(y)$ serves as the Fisher information metric, and any natural-gradient flow built from $\mathcal{G}$ [Amari 1998] is invariant under the reparameterization. In PU, the LAN hypothesis is satisfied on any fixed operational sector for sufficiently long MPU records (large-$n$ limit in Definition 14.2.4.1) whenever the induced coarse-grained record process is mixing/ergodic under ND-RID and the parameterization is regular, so that log-likelihood ratios admit a quadratic expansion with covariance given by $\mathcal{G}$ (Proposition X.1). Thus a PCE-effective proxy constructed from $(W_k, \mathcal{G}, \Gamma_k)$ cannot distinguish $\mathcal{D}_1$ and $\mathcal{D}_2$ within an MPU-equivalence class.

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

At the PCE-Attractor (Definition 15a), the theory selects highly symmetric, self-dual structures (e.g., the $U(8)/(U(2) \times U(6))$ orbit realization of $\mathrm{Gr}(2,8)$ in Theorem Z.6.3a, and the Golay/Leech structures in Theorem Z.13), which enlarge the stabilizer group of the predictive data. This naturally increases the size of duality orbits (many descriptive charts realizing the same operational predictions).

### X.9.3 Canonical Examples in PU Terms

**(i) Electric–Magnetic Duality as an Operational Symmetry.**
In vacuum Maxwell theory, $dF = 0$ and $d{}^\star F = 0$ are invariant under the $SO(2)$ duality rotations [Deser & Teitelboim 1976; Gaillard & Zumino 1981]:
$$
F \mapsto F\cos\theta + {}^\star F\sin\theta,
\qquad
{}^\star F \mapsto {}^\star F\cos\theta - F\sin\theta.
$$
With sources, $d{}^\star F = J_e$ and $dF = J_m$, so duality mixes the source doublet $(J_e, J_m)$; therefore duality is an operational symmetry only in (i) source-free sectors, or (ii) sectors with both electric and magnetic sources included and transformed covariantly, together with duality-compatible boundary conditions.

Operationally, "duality-symmetric sector" means the MPU-accessible observable set $\mathcal{O}$ is closed under the duality action (e.g., built from duality-invariant combinations such as the stress-energy tensor and correlators of $F_{\mu\nu}$ packaged in $SO(2)$-covariant form), and the imposed sources/boundary data do not select an electric or magnetic chart.

In PU, the bulk gauge normalization $\kappa^*_{\mathrm{bulk}}=1$ at the PCE-Attractor is fixed by the Predictive Ward Identity together with capacity/QFI rigidity (Theorem X.3; Appendix Z, Theorem Z.14), so the quadratic gauge-sector kernel carries no PCE bias between duality-related normalizations at the operational scale. Under the conditions above, exchanging electric/magnetic descriptive variables is an MPU-equivalence (Definition X.9.1) and therefore PCE-degenerate (Definition X.9.2).

**(ii) Bulk–Boundary Equivalence from Capacity Saturation (Operational Holography).**
Conditional on the Necessary Emergence of Geometric Regularity (Theorem 43), Appendix E derives an area-law capacity bound from ND-RID contractivity (Lemma E.1 and Theorem E.2), with effective channel count scaling as area (Theorem E.3). At saturation, boundary encoding becomes a PCE minimum (Theorem E.8.3.2).

For bulk and boundary descriptions to be MPU-equivalent (Definition X.9.1), capacity saturation alone is insufficient; one additionally requires a reconstruction map preserving operational distributions. Theorem E.8.2 (Channel-Capacity Holography) establishes that under the conditions of geometric regularity (Theorem 43), area-law entropy scaling (Theorem 49), and ND-RID channel structure (Definition 27), such reconstruction exists without assuming AdS geometry or conformal boundary structure. Under these reconstruction conditions, a bulk geometric description and a boundary channel description are MPU-equivalent for exterior observables; this is the PU form of holographic equivalence [Susskind 1995; Bousso 2002]. The duality arises because capacity saturation together with reconstruction implies both descriptions yield identical outcome distributions for all exterior measurements at the coarse-graining scale $\delta$.

**(iii) Strong/Weak "Duality" as Scheme/Variable Degeneracy at a Fixed Attractor.**
PU does not treat the bare coupling as a freely tunable parameter at the attractor: capacity saturation fixes $u$ through (X.11). Explicitly,
$$
M\ln(1 + \lambda u^*) = \ln d_0 \quad\text{(Equation X.11)}.
$$
At the PCE-Attractor one has $M = 24$ (Theorem Z.5), $d_0 = 8$ (Theorem 23), and the flat QFI spectrum gives $\lambda = 1$ (Theorem Z.5, Step 5). Therefore:
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
At the PCE-Attractor the Predictive Ward Identity fixes the bulk normalization $\kappa^*_{\mathrm{bulk}}=1$ (Theorem X.3). Combined with the PCE-duality principle of Section X.9 (dual descriptions are cost-degenerate and cannot be distinguished by non-operational normalization choices), the bulk chart therefore yields the duality-symmetric baseline
$$
\alpha_{em,\mathrm{bulk}}^{-1} = \frac{4\pi\kappa^*_{\mathrm{bulk}}}{u^*} = \frac{4\pi}{u^*}.
$$
Operationally, $\alpha_{em}$ is not read off from a bulk chart but inferred from boundary-accessible channel observables, so one must match the bulk normalization to the discrete MPU interface. The active fraction contributing to gauge readout is fixed by the Landauer partition $a=e^\varepsilon=2$ inside $d_0=8$, i.e. $a/d_0=1/4$ (Theorem Z.1; Theorem 23). The SPAP/Bures curvature at the attractor is $K_0=3$ (Theorem 15). The unique duality-compatible interface dressing of the gauge normalization is then (Appendix Z, Theorem Z.17):
$$
\delta\kappa := \kappa_{\mathrm{eff}} - \kappa^*_{\mathrm{bulk}}
= -\frac{a}{d_0}\frac{u^*}{\sqrt{K_0}} + O((u^*)^3)
= -\frac{u^*}{4\sqrt{3}} + O((u^*)^3).
$$
Thus, to first nontrivial order,
$$
\alpha_{em}^{-1} = \frac{4\pi\kappa_{\mathrm{eff}}}{u^*}
= \frac{4\pi}{u^*} - \frac{\pi}{\sqrt{K_0}} + O((u^*)^2).
$$
Carrying the next curvature-controlled term from the same interface functional (Appendix Z, Theorem Z.26) gives the closed Thomson-limit prediction
$$
\alpha_{em}^{-1} =
\frac{4\pi}{u^*}
-\frac{\pi}{\sqrt{K_0}}
+\frac{\pi u^*}{24\sqrt{K_0}}\left(1-\frac{(u^*)^2}{6}\right)
+O((u^*)^5).
$$
With $u^*=2^{1/8}-1$ and $K_0=3$,
$$
\alpha_{em}^{-1} \approx 137.036092 \pm 0.000050,
$$
where the uncertainty is the conservative $1\sigma$ truncation bound for the first neglected $O((u^*)^5)$ term (Appendix Z, Section Z.27.9).

Consequently, a literal map $u \mapsto 1/u$ is *not* a symmetry of the saturated constraint surface: the attractor selects a unique operational coupling $u^* = 2^{1/8} - 1$, and transformations that would map to $1/u^* \approx 11.05$ violate the capacity constraint (X.11). What can be dual are *descriptions*: distinct field variables or auxiliary-field representations (Appendix X) that represent the same effective $W_k[J]$ and the same operational correlators at the fixed-point physics. In this sense, "strong vs. weak" can be a coordinate artifact of the chosen effective variables, while the operational predictions remain locked to the same PCE optimum.


### X.9.4 Duality Discovery as a Constrained Equivalence Search

Appendix X (Section X.7) already provides a pipeline for connecting PU quantities to an effective action. Duality discovery is a specialization:

1. **Fix the operational sector.** Specify $\mathcal{O}$ (observables), $\mathcal{C}$ (contexts), and the outcome spaces $\{\Omega_O\}$ at MPU resolution (including any imposed symmetries, boundary conditions, and coarse-graining scale $\delta$).

2. **Construct the proxy.** Build $W_k[J]$ and $\Gamma_k[\Phi]$ consistent with those constraints (Appendix X); include CTP structure for ND-RID when appropriate (Section X.5).

3. **Enumerate candidate transforms.** Consider exact transformations that preserve correlators: field redefinitions, Legendre transforms on auxiliary fields, Hubbard–Stratonovich-type rewrites, or boundary restrictions implied by encoding theorems (Appendix E, Theorem E.8.2).

4. **Check operational invariants.** Verify that $p(E \mid O, c)$ is unchanged for all measurable outcome events $E$, observables $O \in \mathcal{O}$, and contexts $c \in \mathcal{C}$ at MPU resolution. Equivalently, under LAN conditions, check equality of connected correlators and the induced Fisher metric $\mathcal{G}$ (Proposition X.1).

5. **Conclude degeneracy.** Any candidate passing step (4) is PCE-degenerate at the proxy level by Proposition X.9.3.