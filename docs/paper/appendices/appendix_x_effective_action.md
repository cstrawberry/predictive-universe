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

If, in addition, the family $p_\theta$ is an exponential family parametrised by sources related to $\theta$ and the local asymptotic normality hypotheses hold, then the connected correlator $\mathcal G_{ab}$ agrees with the Fisher information kernel in that asymptotic statistical regime. The Hessian of $\Gamma$ is therefore the inverse response kernel on the same regular sector.

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
which is (X.3). The Fisher-information statement is asymptotic and holds only under the exponential-family and LAN hypotheses stated above. ∎


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

where dots include gauge‑invariant higher operators and the background‑invariant gauge‑fixing/ghost sector. On the Landauer-saturating finite-resolution branch, Theorem Q.0.7d2 supplies the effective continuous $U(1)$ invariance used in this sector as the closure of the dense SPAP/Landauer phase subgroup. After this closure, the standard background-field Ward identity ensures that the renormalization of the background gauge coupling depends only on the background-field wavefunction factor $Z_A(k)$. The physical coupling satisfies

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
= -\,\frac{\sqrt{-g}}{16\pi G}\,\Big(R^{\mu\nu}-\tfrac12 R g^{\mu\nu}+\Lambda g^{\mu\nu}\Big)
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

For sources $J_A$, define the cell-empirical generating functional
$$
W_h[J;g] \;:=\; \log\,\mathbb E_{\mathbb P_h}\exp\!\left(\sum_{C\in\mathcal P_h}|C|\,J_A(x_C)\,\Psi_C^A\right),
$$
and let $\Gamma_h[\Psi;g]$ be its Legendre transform with respect to the coarse fields. Then every compact-set subsequential limit of $\Gamma_h$ along a convergent field sequence has the form
$$
S_{\mathrm{eff}}[\Psi,g] \;=\; \int_{M_{\mathrm{reg}}}\sqrt{|g|}\,\mathcal L\bigl(x,\Psi,\nabla\Psi,\dots,\nabla^{(r)}\Psi;g\bigr)\,d^4x,\tag{X.9a}
$$
where $\mathcal L$ is a scalar local Lagrangian density.

*Proof.* For fixed $h$, finite-range ND-RID and local detailed balance imply that the path weight on a finite time slab is the exponential of a sum of local cell increments $\ell_{C,h}$, plus terms supported only on neighborhood overlaps. The source-coupled logarithmic moment generating functional therefore decomposes as
$$
W_h[J;g] \;=\; \sum_{C\in\mathcal P_h}|C|\,w_{C,h}\bigl(J(x_C),\Psi_C,j_h\Psi_C;g(x_C)\bigr) + R_h[J;g],
$$
where $j_h\Psi_C$ denotes the finite list of discrete jets entering the local closure and the remainder $R_h$ is supported on the boundary layer of the partition. Assumption (6) gives $R_h[J;g]\to 0$ on compact sets as $h\to 0$.

The Legendre transform preserves additivity up to the same vanishing boundary layer, so there exist local cell Lagrangians $L_{C,h}$ with
$$
\Gamma_h[\Psi;g] \;=\; \sum_{C\in\mathcal P_h}|C|\,L_{C,h}\bigl(\Psi_C,j_h\Psi_C;g(x_C)\bigr) + o(1).
$$
By regular-field closure, each $L_{C,h}$ admits a finite-jet Taylor expansion around $x_C$ with coefficients uniformly bounded on compact sets, so $L_{C,h}=\mathcal L\bigl(x_C,\Psi(x_C),\nabla\Psi(x_C),\dots,\nabla^{(r)}\Psi(x_C);g(x_C)\bigr)+O(h)$. Summing over cells produces a Riemann sum and yields subsequential convergence to the displayed integral form.

For covariance, let $x\mapsto x'$ be a smooth coordinate relabeling on a compact patch. By relabeling neutrality, the underlying ND-RID path weights and therefore the finite-scale generating functionals describe the same physical histories, so $\Gamma_h[\Psi;g]=\Gamma_h[\Psi',g']$ for the relabeled fields. Passing to a subsequential limit gives $S_{\mathrm{eff}}[\Psi,g]=S_{\mathrm{eff}}[\Psi',g']$. Since $d^4x$ transforms by the Jacobian and $\sqrt{|g|}$ transforms as a density of weight one, the integrand $\sqrt{|g|}\,\mathcal L$ must be a scalar density. Therefore $\mathcal L$ is a scalar local Lagrangian and the action is generally covariant. ∎

**Corollary X.5a.1 (Matter–Gravity Decomposition of the Derived Action).** On the same branch, every such subsequential effective action splits uniquely as
$$
S_{\mathrm{eff}}[\Psi,g] \;=\; S_{\mathrm{MPU}}[\Psi,g] + S_{\mathrm{grav}}[g],\tag{X.9b}
$$
where $S_{\mathrm{MPU}}$ contains all terms depending on $\Psi$ and $S_{\mathrm{grav}}$ contains the pure-metric local scalar-density terms. In $D=4$, the leading two-derivative geometric term is
$$
S_{\mathrm{grav}}[g] \;=\; \frac{1}{16\pi G}\int_{M_{\mathrm{reg}}}(R-2\Lambda)\sqrt{|g|}\,d^4x + S_{\mathrm{grav}}^{(\ge 4)}[g],\tag{X.9c}
$$
where $S_{\mathrm{grav}}^{(\ge 4)}$ contains curvature invariants with four or more derivatives.

*Proof.* Decomposition (X.9b) is obtained by collecting in $S_{\mathrm{eff}}$ the terms that do and do not depend on the non-geometric fields $\Psi$. The separation is unique because the dependence on $\Psi$ is algebraic in the jet variables. For the pure-metric part, locality and general covariance imply that the leading scalar densities with at most two derivatives are $\sqrt{|g|}$ and $\sqrt{|g|}R$. Therefore the leading two-derivative sector has the form (X.9c), with the remaining higher-curvature terms absorbed into $S_{\mathrm{grav}}^{(\ge 4)}$. ∎



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

At the **PCE-Attractor** (Definition 15a), the system operates at the capacity boundary. In the homogeneous single-coupling truncation used here—where derivative operators, wavefunction renormalization, and all couplings other than $u$ are held fixed—the constrained minimization of the rate-level potential $\phi(u)$ is modeled by the stationary condition of the truncated effective potential $V_{\rm eff}$ under the capacity constraint (X.11). This can be written with a Lagrange multiplier $\zeta$ as:

$$
 \frac{d}{du}\Big(V_{\rm eff}(u;k)+\zeta\,[M\ln(1+\lambda u)-\ln d_0]\Big)\Big|_{u=u^*}=0.
 \tag{X.12}
 $$

Using this truncated equivalence with $\gamma_{\rm eff}=2$ reproduces the zero‑slack condition employed in Appendix Z and the identities **Sections Z.7-Z.8**.

**Theorem X.3 (Predictive Ward Identity and Unity Normalization on the unit Predictive-Ward branch).** At the PCE-Attractor (Definition 15a), on the unit Predictive-Ward branch introduced in Appendix Z, Theorem Z.14 — for which the Ward map identifies $\mathcal{G} = \mathcal{K}^{-1}$ in QFI-natural units with no additional gauge-subspace map factor — the bulk normalization is uniquely fixed:
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

Hence, at the MPU operational scale $\mu^*$ corresponding to the PCE-Attractor, the canonical Maxwell normalization is recovered. This fixes the bulk normalization $\kappa^*_{\mathrm{bulk}}=1$. The leading Thomson-limit coupling includes the first interface correction from discrete-continuous embedding (Section Z.17):
$$
g^2 = u, \qquad \alpha^{-1} = \frac{4\pi\kappa_{\mathrm{eff}}}{u^*} = \frac{4\pi}{u^*} - \frac{\pi}{\sqrt{K_0}} + O((u^*)^2)
$$
where $\kappa_{\mathrm{eff}}=1-(a/d_0) \cdot u^*/\sqrt{K_0}$ and the active fraction is $a/d_0=1/4$. The next curvature-controlled term is written explicitly in Appendix Z, Theorems Z.24–Z.26.

## X.7 Computational Pipeline and Renormalization Conditions

1. **Microscopic MPU cycle → LAN block:** extract $(d_0,\varepsilon)$, the active kernel size $a = 2$ on the attractor-saturating branch, and the QFI spectrum $(M,\lambda)$ (Appendix Z; Appendix W).
2. **Construct $W_k[J]$:** choose sufficient statistics consistent with symmetries; include CTP doubling for ND‑RID (X.9).
3. **Legendre transform → $\Gamma_k$:** enforce background invariances; use background‑field method for gauge/gravity; add regulator $R_k$ and integrate (X.4).
4. **Renormalization conditions:** for $U(1)$, the bulk normalization $\kappa^*_{\mathrm{bulk}}=1$ follows from the Predictive Ward Identity (Theorem Z.14), and the interface correction $\delta\kappa = -(a/d_0) \cdot u^*/\sqrt{K_0}$ is derived from the active fraction and discrete-continuous embedding (Section Z.17); fix $G(k)$ via the area-law coefficient (Appendix E).
5. **Predictions:** evaluate $V_{\rm eff}$ and stationarity (X.10)–(X.12); run $k\downarrow 0$ and compare with protocols in Section 13.



## X.8 Summary of Correspondences

* **Predictive geometry ↔ response:** Fisher metric $\mathcal{G}$ (Appendix D) ↔ connected kernel $\mathcal{G}=\delta^2 W$; $\Gamma^{(2)}=\mathcal{G}^{-1}$ (X.3).
* **PU RG ↔ FRG:** KL‑monotone $c(b)$ (Appendix D) ↔ $\Gamma_k$ flow (X.4); relevant/irrelevant classification aligned via stability eigenvalues.
* **Gauge normalization:** $u=g_e^2$, $\alpha_{\mathrm{em}}=u/(4\pi\kappa)$ (X.6); $\kappa^*_{\mathrm{bulk}}=1$ (Theorem Z.14), $\kappa_{\mathrm{eff}}=1-(a/d_0) \cdot u^*/\sqrt{K_0}$ with $a/d_0=1/4$ (Section Z.17); $u^*=8^{1/24}-1$ (Section Z.8); Thomson limit $\alpha^{-1}=\frac{4\pi}{u^*}-\frac{\pi}{\sqrt{K_0}}+\frac{\pi u^*}{24\sqrt{K_0}}\left(1-\frac{u^{*2}}{6}\right)\approx 137.036092 \pm 0.000060$ from the Appendix Z derivation (Theorems Z.24–Z.26).
* **Constraint-coupling duality:** in regular constrained PCE branches, active admissibility constraints carry KKT shadow prices; canonical couplings are the corresponding normalized stiffness or inverse-stiffness images (Theorem X.8c; Appendix Z, Corollary Z.8.2a).
* **Gravity:** $\Gamma^{\text{grav}}$ (X.7) + Wald entropy (Appendix E) ⇒ EFE (Section 12); $G$ from the area‑law coefficient; running $G(k)$ (Appendix I).
* **Open dynamics:** CTP $\Gamma_{\rm CTP}$ (X.9) encodes dissipation/noise consistent with the local second law (Appendix E) and algebraic locality (Appendix F).
* **Capacity saturation:** constraint (X.11) links $\phi(u)$ and $V_{\rm eff}$ stationarity (X.12), yielding the identities used in Appendix Z.


**Theorem X.8a (Shared Information-Geometric Control of Response, RG, and Perspective Transport).** Under the regularity, exponential-family, and local-asymptotic-normality hypotheses of Proposition X.1, together with the Bakry-Émery lower bound of Equation (M.5c), the following hold simultaneously:

1. the connected response kernel $\mathcal{G}$ equals the Fisher kernel on the regular statistical sector and the 1PI Hessian satisfies
$$
\Gamma^{(2)}=\mathcal{G}^{-1};
$$
2. at the PCE-Attractor, the quadratic gauge kernel is canonically normalized by QFI geometry and the predictive Ward identity;
3. on the renormalization-PCE correspondence branch identified in Appendix K (Theorem K.10.7), the FRG flow is modeled as the continuum effective-action representative of PCE-selected compression. Appendix K's branch ledger (item 4 of §K.11) records that a rigorous derivation of the PCE functional $\mathcal{L}_{\mathrm{PCE}}^{(k)}$ from MPU dynamics lies outside the stated correspondence-branch hypotheses, so this claim is interpreted as a structural correspondence on that branch rather than as a derived identity;
4. perspective dynamics on $\Sigma$ are generated by the Appendix M drift-diffusion operator, whose semigroup is $W_2$-contractive.

Therefore PU response theory, effective-action dynamics, RG flow, and perspectival transport are governed by a single information-geometric class of structures: kernels or metrics on predictive statistical state space, their inverse Hessians, and the induced gradient or contractive flows.

*Proof.* Proposition X.1 gives the Legendre-dual identity $\Gamma^{(2)}\mathcal{G}=I$ and, under the stated exponential-family and LAN hypotheses, identifies $\mathcal{G}$ with the Fisher information kernel. Theorem X.3 fixes the bulk gauge normalization from QFI geometry and the predictive Ward identity. Theorem K.10.7 supplies the conditional renormalization-PCE correspondence used in claim 3, identifying the Wetterich flow as the continuum analogue of PCE-selected compression on that correspondence branch; Appendix K's branch ledger (§K.11, item 4) records that a full first-principles derivation of the PCE functional from MPU dynamics lies outside the stated correspondence-branch hypotheses, so this theorem inherits that branch dependence. Equations (M.5a)-(M.5c) construct the perspectival drift-diffusion generator and give the $W_2$-contractivity estimate under the Bakry-Émery lower bound. These four facts are all instances of the same information-geometric control structure. ∎

**Corollary X.8a.1 (Gradient-Flow Compatibility Across Appendices).** The stochastic PCE adaptation flow of Appendix D, the FRG compression flow of Appendix K/X, and the perspective diffusion of Appendix M are mutually compatible metric-controlled evolutions on PU state space.

*Proof.* Appendix D models slow adaptation as stochastic gradient flow on the PCE potential, Theorem K.10.7 identifies FRG flow with PCE compression, and Equations (M.5a)-(M.5c) supply the metric diffusion on perspective space. Theorem X.8a records that all three are governed by the same information-geometric data. ∎


**Remark X.8a.2 (Status of the Stronger Identity Claim).** Theorem X.8a proves a shared information-geometric control structure at the level of a common structural class. Section X.9.6 gives the finite-branch operator statement: after the regular response, RG, and perspective sectors are represented as closed quadratic forms on one direct-sum predictive Hilbert module, their generators are compressions of a single self-adjoint predictive operator. The statement is exact on that finite closed-form branch and inherits precisely the regularity hypotheses stated there.

**Corollary X.8b (Effective-Action Projection of Predictive Curvature).** On the regular product-bundle branch of Theorem 47 and Theorem G.4b, and under the effective-action hypotheses of Theorem X.5a, the gauge and gravitational curvature terms in the continuum effective action are projections of the predictive curvature
$$
\mathcal F^{\mathrm{pred}}
=
R(\Omega)\otimes 1+1\otimes F(A^{\mathrm{int}}).
$$
The internal projection $F(A^{\mathrm{int}})$ supplies the background-field gauge kernel of Equation (X.5). The spin/metric projection $R(\Omega)$ supplies the curvature invariants of the gravitational action in Equation (X.7), with the leading Einstein-Hilbert coefficient fixed by the Wald/area-law and local Clausius normalization in Appendix E and Section 12. The CTP sector of Section X.5 adds the dissipative/noise completion required by ND-RID but does not alter the closed-system curvature factorization.

*Proof.* Theorem 47 and Corollary G.4b.1 give the exact product-bundle curvature identity. Equation (X.5) is written solely in terms of the internal field strength $F_{\mu\nu}(\bar A)$ and gauge-invariant higher operators, so it is the effective-action representative of the internal projection of $\mathcal F^{\mathrm{pred}}$. Equation (X.7) is written solely in terms of metric curvature invariants, whose spin-bundle representative is $R(\Omega)$ on the Lorentzian branch. The leading coefficient in Equation (X.7) is fixed by the area-law/Wald/Clausius chain stated in Section X.4 and proved in Section 12. Theorem X.5a supplies the generally covariant coarse-grained action under ND-RID/PCE, and Corollary X.5a.1 gives the matter-gravity decomposition; the open-system CTP terms are additional dissipative kernels and therefore do not change the algebraic identity for the closed-system curvature. ∎

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
and therefore the displayed expression for $\lambda_A$. The final relation $\alpha_A=u_A^*/(4\pi\kappa_A)$ is the canonical Heaviside-Lorentz normalization used in Equation (X.6). The continuum effective-action statements use the same identity on the retained regular finite-mode truncations and pass along the convergent subsequence of Theorem X.5a whenever the selected branch has convergent multipliers. ∎

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

**Theorem X.8d (Predictive Anomaly Descent and Inflow Principle).** In the setting of Definition X.8d.0:

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
for every redundancy arrow $\gamma:x\to y$. Expanding the definition of $\widetilde Z$ gives
$$
e^{iB_y[\gamma\cdot J]}e^{i\mathcal A_\gamma[J]}Z_x[J]
=
e^{iB_x[J]}Z_x[J].
$$
On the regular sector $Z_x[J]$ is not identically zero, so the equality of phases implies
$$
\mathcal A_\gamma[J]=B_x[J]-B_y[\gamma\cdot J]\quad \mathrm{mod}\ 2\pi.
$$
Hence $\mathcal A=\delta B$ and $[\mathcal A]=0$. This proves the descent criterion.

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

**Corollary X.8d.1 (Gauge Redundancies, Family Charges, Horizons, and Global-Current Channels).** On PU regular effective-action branches:

1. Gauge transformations, local Lorentz frame rotations, and diffeomorphism/frame changes that are treated as redundancies must have vanishing total anomaly class. Otherwise the predictive functional does not descend to the physical quotient.

2. Family $U(1)_F$ anomaly constraints, when $U(1)_F$ is treated as a predictive-frame redundancy, are descent constraints rather than optional model-building conditions.

3. Boundary, horizon, or interface degrees of freedom may carry anomaly only when their class cancels the bulk class:
$$
[\mathcal A^{\mathrm{bulk}}]+[\mathcal A^{\partial}]+[\mathcal A^{\mathrm{int}}]=0.
$$

4. The electroweak $B+L$ anomaly used in Appendix Y is admissible because $B+L$ is a global current on that branch, not a gauge redundancy. It is therefore a physical update channel, while the Standard Model gauge anomaly classes still vanish.

*Proof.* Items 1 and 2 are direct applications of Theorem X.8d to transformations included in the redundancy groupoid $\mathcal R$. Item 3 is the bulk-boundary-interface part of the theorem. Item 4 follows because $B+L$ is not part of the gauge quotient defining the Standard Model branch; its anomalous Ward identity changes a physical global charge through topological gauge history rather than changing the value of the predictive functional under an identified gauge frame. ∎

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

The free or Chern-Weil shadow of $\alpha_{\mathsf B}$ is the image detected by local anomaly polynomials and the Cech cocycle of Definition X.8d.0. The torsion part is the part detected by finite-order bordism classes and is invisible to ordinary local anomaly polynomials.

**Theorem X.8d.3 (Bordism-PCE Global Anomaly Gate).** On a regular branch admitting the bordism anomaly character of Definition X.8d.2:

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

3. If the local Cech anomaly class of Definition X.8d.0 vanishes and the full bordism character satisfies (X.8d.3), then the branch passes both the perturbative and global anomaly gates. Any remaining variation under a transformation not included in the redundancy groupoid is a physical update channel, as in Corollary X.8d.1.

4. Theorem X.8d is recovered as the local/free shadow of this statement. The torsion component of $\alpha_{\mathsf B}$ supplies the additional global-anomaly audit not seen by $H^1(\mathcal R,\mathscr F/2\pi\mathbb Z)$ alone.

*Proof.* A redundancy is an identification of predictive descriptions. If a closed $G_{\mathrm{PU}}(\mathsf B)$ test history $M^{d+1}$ has nontrivial anomaly phase $\alpha_{\mathsf B}^{\mathrm{tot}}([M])\ne1$, then two histories identified by the declared redundancy assign different phases to the same physical quotient datum. This is exactly the failure mode ruled out by MPU-equivalence and by the descent criterion in Theorem X.8d. Thus descent requires (X.8d.3), proving item 1.

If $\alpha_{\mathsf B}^{\mathrm{tot}}\ne0$ as a homomorphism, then by definition of nonzero character there is an element $[M]\in\Omega_{d+1}^{G_{\mathrm{PU}}(\mathsf B)}$ with nontrivial value. Evaluating the branch on that closed test manifold gives (X.8d.4). Since no local observer-independent quotient can assign both phase values to one identified physical history, the declared redundancy is inadmissible at finite PCE cost. This proves item 2.

For item 3, vanishing of the local Cech anomaly class supplies the counterterm descent of Theorem X.8d on the free/local part. Vanishing of the bordism character removes every remaining closed-manifold global obstruction, including torsion obstructions. Hence the redundancy passes the anomaly audit. If the transformation is not part of the redundancy groupoid, no quotient identification is being imposed, so a nonzero Ward variation is a physical update channel, exactly as in Theorem X.8d and Corollary X.8d.1.

For item 4, the local anomaly polynomial and the Cech cocycle are obtained by restricting the invertible anomaly character to infinitesimal families and to the free/Chern-Weil component of the bordism group. This projection forgets finite torsion classes. Therefore Theorem X.8d is the free/local shadow, while Definition X.8d.2 and this theorem retain the torsion/global part as well. ∎

**Corollary X.8d.4 (Finite-Stabilizer Torsion Audit).** Any finite stabilizer, Golay-Leech, Conway, Monster, flavor, or family label that is promoted from branch-internal data to a declared redundancy must pass the bordism gate
$$
\alpha_{\mathsf B}^{\mathrm{tot}}=0.
$$
If the label has no operational action it is removed by PCE as in Corollary G.8.4h.3. If it has operational action but carries a nontrivial torsion anomaly not canceled by an admissible boundary or interface sector, it cannot be a redundancy of the physical quotient.

*Proof.* Finite groups and finite stabilizer data can carry torsion bordism characters even when the local anomaly polynomial vanishes. If the label is operationally null, Corollary G.8.4h.3 removes it. If it is operationally active and declared to identify descriptions, Theorem X.8d.3 applies. A nonzero torsion character gives a closed test manifold with nontrivial phase and blocks redundancy descent unless the boundary or interface character cancels it. ∎

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

**Theorem X.8d.6 (PCE Anomaly Matching for Retained Global Response Symmetries).** Let $\mathcal C_{\Lambda\to\mu}$ be a regular PCE/RG compression that preserves the predictive generating functional up to local counterterms and PPI-equivalence on all background-field protocols for a retained global response symmetry $\mathcal S$. Then
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

**Corollary X.8d.8 (Global-Current Channels Under Flow).** The electroweak $B+L$ update channel of Appendix Y, any retained family/flavor global response symmetry, and any operationally active finite stabilizer symmetry must obey anomaly matching under PCE/RG compression. If the label is instead response-null at the compressed scale, PCE may remove the label, and the matching question is no longer posed for that IR branch.

*Proof.* Corollary X.8d.1 distinguishes global-current anomalies from redundancy anomalies: a global-current anomaly may be a physical update channel rather than a descent failure. If such a channel remains operationally retained, Theorem X.8d.6 applies. If it becomes response-null, Definition X.8d.5 is not satisfied, and Proposition X.9.3 removes the label as PCE-degenerate. ∎

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

**Theorem X.8f.2 (Noether-KKT Equivalence on a Regular PCE Branch).** Assume the active constraint gradients satisfy the linear-independence constraint qualification at a local optimum $x^*$. Then:

1. there are unique KKT multipliers $(\lambda^*,\mu^*)$ satisfying
$$
d_x\mathscr L_{\mathrm{PCE}}(x^*,\lambda^*,\mu^*)=0;
\tag{X.8f.2}
$$
2. if a Lie group $G$ acts on the branch and preserves $V_{\mathrm{PCE}}$, all active constraints, and the operational measure, then every infinitesimal generator $\xi_X$ satisfies
$$
d_x\mathscr L_{\mathrm{PCE}}(x^*,\lambda^*,\mu^*)[\xi_X(x^*)]=0;
\tag{X.8f.3}
$$
3. on a continuum effective-action branch, (X.8f.3) is the Noether or Ward identity associated with the corresponding global or local symmetry;
4. the active multipliers are predictive shadow prices:
if a constraint is shifted to $g_i(x)=b_i$, then the derivative of the optimum value $V^*(b)$ satisfies
$$
\frac{\partial V^*}{\partial b_i}=-\lambda_i^*,
\tag{X.8f.4}
$$
and analogously for active inequality constraints.

*Proof.* The KKT theorem under the linear-independence constraint qualification gives existence of multipliers satisfying stationarity, primal feasibility, dual feasibility, and complementary slackness. Uniqueness of the multiplier vector follows because the active constraint gradients are linearly independent: if two multiplier vectors satisfied stationarity, their difference would give a vanishing linear combination of independent active gradients.

If $G$ preserves the objective and active constraints, then for the curve $x(t)=\exp(t\xi)\cdot x^*$,
$$
\frac{d}{dt}V_{\mathrm{PCE}}(x(t))\bigg|_{t=0}=0,
\qquad
\frac{d}{dt}g_i(x(t))\bigg|_{t=0}=0,
\qquad
\frac{d}{dt}h_a(x(t))\bigg|_{t=0}=0
$$
for all active $a$. Taking the derivative of $\mathscr L_{\mathrm{PCE}}$ along this curve gives (X.8f.3). This proves (2).

On a continuum branch, the same calculation is performed with compactly supported infinitesimal fields. For a global transformation, stationarity of the action along the symmetry orbit gives the conserved Noether current. For a local gauge transformation with arbitrary parameter $\alpha^A(x)$, the first variation has the form
$$
\delta_\alpha\Gamma
=
\int
\alpha^A(x)\,\mathcal W_A(x)\,d^4x,
$$
after integrating by parts. Since $\alpha^A(x)$ is arbitrary, $\mathcal W_A(x)=0$, which is the Ward identity. This proves (3).

For (4), let
$$
V^*(b)=\min_x V_{\mathrm{PCE}}(x)
\quad
\text{subject to }g_i(x)=b_i
$$
near the regular optimum. The envelope theorem applied to
$$
V_{\mathrm{PCE}}(x)+\sum_i\lambda_i(g_i(x)-b_i)
$$
gives
$$
\frac{\partial V^*}{\partial b_i}
=
-\lambda_i^*.
$$
The same argument applies to active inequalities after restricting to the active face. ∎

**Corollary X.8f.3 (Conservation Laws, Ward Identities, and Couplings as One Stationarity Statement).** On a regular branch, Noether currents, gauge Ward identities, and normalized coupling constants are different readings of the same augmented PCE stationarity condition: symmetries give null directions of $\mathscr L_{\mathrm{PCE}}$, while active constraints give shadow prices.

*Proof.* Noether and Ward identities are item (3) of Theorem X.8f.2. Shadow prices are item (4). The augmented stationarity equation (X.8f.2) is the common source of both. ∎

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

**Open Target X.8h.5 (Predictive Positive Geometry).** On a finite gapped regular branch, define the truncated predictive response region
$$
\mathcal P_{\mathrm{PU}}^{(N)}
$$
as the semialgebraic region cut out by:

1. the Hankel positivity conditions of Theorem X.8h.2 for coefficients through order $N$;

2. the finite PCE min-cut inequalities of Appendix E.8;

3. the finite Golay-matroid circuit and cocircuit constraints of Theorem R.4.2.9b when the marked $M=24$ carrier is active;

4. the protocol-factorization equalities required by the local algebra split on admissible boundary cuts.

A positive-geometry completion of $\mathcal P_{\mathrm{PU}}^{(N)}$ would be a pair
$$
(\mathcal P_{\mathrm{PU}}^{(N)},\Omega_{\mathrm{PU}}^{(N)})
\tag{X.8h.5.1}
$$
such that $\Omega_{\mathrm{PU}}^{(N)}$ is a logarithmic canonical form whose residues on PCE factorization facets satisfy
$$
\operatorname{Res}_{F_C}\Omega_{\mathrm{PU}}^{(N)}
=
\Omega_L^{(N_L)}\wedge\Omega_R^{(N_R)}
\tag{X.8h.5.2}
$$
for every admissible predictive min-cut facet $F_C$.

This is an open target, not a theorem. No scattering amplitude is identified with a canonical form unless existence, uniqueness, logarithmic boundary behavior, and the residue law (X.8h.5.2) are proved for the relevant branch. Until then, $\mathcal P_{\mathrm{PU}}^{(N)}$ is only the finite positive response region already certified by Theorem X.8h.2 and the cited finite cut/matroid constraints.

**Open Target X.8h.6 (Predictive Bootstrap Compression).** On a branch satisfying both the Hadamard-PCE state gate of Theorem K.10.4b and the separate exact-scale conformal hypotheses required for an OPE description, define local operator-product data by the PCE-minimal compression
$$
O_i(x)O_j(0)
\sim
\sum_k C_{ij}^{k}(x)O_k(0)
\tag{X.8h.6.1}
$$
inside admissible local response functions. The target is to prove that, on such a branch, OPE associativity is exactly path-independence of local predictive compression:
$$
(O_iO_j)O_k
=
O_i(O_jO_k)
\quad
\Longleftrightarrow
\quad
\text{crossing equality of compressed protocol responses}.
\tag{X.8h.6.2}
$$
No conformal-bootstrap selection theorem is asserted here. The target is inactive unless the exact-scale conformal branch and the Hadamard-PCE admissibility gate are both satisfied. In particular, this item does not override the PCE-Attractor statements excluding an exact pure-coordinate dilatation tangent on the generic branch.

### X.8i Predictive Cosmic Galois Filtration

### X.8i Predictive Cosmic Galois Filtration

**Definition X.8i.1 (Finite Update-Cost Graph Hopf Algebra).** Let $\mathcal H_{\mathrm{CK}}^{(L)}$ be the finite Connes-Kreimer Hopf algebra spanned by superficially divergent Feynman graphs up to loop order $L$, with coproduct
$$
\Delta\Gamma
=
\sum_{\gamma\subseteq\Gamma}
\gamma\otimes\Gamma/\gamma.
$$
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
for disjoint products. Define the filtration
$$
F^n\mathcal H_{\mathrm{CK}}^{(L)}
=
\operatorname{span}\{\Gamma:\mathfrak c(\Gamma)\le n\}.
\tag{X.8i.2}
$$

**Theorem X.8i.2 (Renormalization Preserves the Predictive Cost Filtration).** Under Definition X.8i.1,
$$
\Delta(F^n\mathcal H_{\mathrm{CK}}^{(L)})
\subseteq
\sum_{r+s\le n}
F^r\mathcal H_{\mathrm{CK}}^{(L)}
\otimes
F^s\mathcal H_{\mathrm{CK}}^{(L)}.
\tag{X.8i.3}
$$
If $\phi$ is a regularized Feynman-rule character and the counterterm recursion is defined by a Rota-Baxter projection that does not increase $\mathfrak c$, then the counterterm character $\phi_-$ and renormalized character $\phi_+$ also preserve the filtration.

*Proof.* Let $\Gamma\in F^n\mathcal H_{\mathrm{CK}}^{(L)}$, so $\mathfrak c(\Gamma)\le n$. Every coproduct term is of the form
$$
\gamma\otimes\Gamma/\gamma.
$$
By (X.8i.1),
$$
\mathfrak c(\gamma)+\mathfrak c(\Gamma/\gamma)\le\mathfrak c(\Gamma)\le n.
$$
Thus if $r=\mathfrak c(\gamma)$ and $s=\mathfrak c(\Gamma/\gamma)$, then the term lies in
$$
F^r\mathcal H_{\mathrm{CK}}^{(L)}\otimes F^s\mathcal H_{\mathrm{CK}}^{(L)}
$$
with $r+s\le n$. Summing over all subgraphs proves (X.8i.3).

For the character statement, the counterterm recursion is
$$
\phi_-(\Gamma)
=
-R\left[
\phi(\Gamma)+
\sum_{\emptyset\ne\gamma\subsetneq\Gamma}
\phi_-(\gamma)\phi(\Gamma/\gamma)
\right],
$$
where $R$ is the Rota-Baxter projection. Proceed by induction on $\mathfrak c(\Gamma)$. The product term
$$
\phi_-(\gamma)\phi(\Gamma/\gamma)
$$
has total cost degree at most $\mathfrak c(\gamma)+\mathfrak c(\Gamma/\gamma)\le\mathfrak c(\Gamma)$ by the first part. Since $R$ does not increase cost degree, $\phi_-(\Gamma)$ has cost degree at most $\mathfrak c(\Gamma)$. The renormalized character
$$
\phi_+=\phi_-*\phi
$$
is a convolution product, and the coproduct estimate already proved shows that convolution does not increase the total filtration degree. Hence $\phi_+$ preserves the filtration. ∎

**Corollary X.8i.3 (Filtered Arithmetic Symmetry).** Any Hopf-algebra automorphism of $\mathcal H_{\mathrm{CK}}^{(L)}$ that preserves $\mathfrak c$ acts by filtered automorphisms on the algebra of PU update-history periods generated by the corresponding amplitudes.

*Proof.* If an automorphism preserves $\mathfrak c$, it maps every basis graph of cost at most $n$ to a linear combination of graphs of cost at most $n$. Hence it preserves $F^n$ for every $n$. Applying the Feynman-rule period map sends this filtered graph action to a filtered action on the generated period algebra. ∎

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

**Corollary X.8j.3 (Gauge-First Soft Theorem Reading).** In gauge sectors, the soft insertion is the flux ledger $F_f$, and the soft Ward identity is the conservation of the boundary predictive ledger. In the emergent metric sector, the same formula describes the asymptotic ledger of the thermodynamic metric branch; it does not introduce a fundamental graviton degree of freedom.

*Proof.* Gauge soft charges are boundary charges generated by long-range gauge transformations, so they are instances of $Q_f$. Their flux insertion is $F_f$, and Theorem X.8j.2 gives the Ward identity. The emergent metric branch has boundary channel and horizon ledger variables rather than fundamental metric quanta; applying the same finite conservation identity to those variables gives the stated asymptotic-memory reading without changing the ontology. ∎

### X.8j.4 Predictive Infrared Admissibility Gate

**Definition X.8j.4a (Unresolved Soft-Ledger Equivalence).** Fix detector resolution $\lambda>0$ in a massless long-range gauge sector or in the emergent thermodynamic metric ledger sector of Corollary X.8j.3. Two finite scattering records $r,r'$ are unresolved-soft equivalent at resolution $\lambda$, written
$$
r\sim_\lambda r',
\tag{X.8j.5}
$$
when they have the same hard record above $\lambda$, the same total conserved boundary ledger charges, and differ only by ledger refinements supported on boundary or flux cells whose individual energies are below $\lambda$. An observable $\mathcal O$ is soft-ledger invariant at resolution $\lambda$ when
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
If a compatible family $\{\mathcal O_\lambda\}_{\lambda>0}$ has finite renormalized infrared PCE cost as $\lambda\to0$, then its quotient representatives must remain compatible under refinement of the unresolved-soft quotient.

*Proof.* PPI-observability at resolution $\lambda$ means that the quantity is a function of operationally distinguished records at that resolution. By Definition X.8j.4a, records in the same $\sim_\lambda$ class differ only by refinements below the detector resolution while preserving hard data and total conserved ledger charges. No admissible protocol at that resolution distinguishes those refinements. If $\mathcal O(r)\ne\mathcal O(r')$ for some $r\sim_\lambda r'$, then $\mathcal O$ assigns two values to one operational record class and is not a well-defined PPI observable. Hence $\mathcal O$ must be constant on every $\sim_\lambda$ class, which is exactly the factorization (X.8j.7). If the family failed compatibility under $\lambda\to0$ refinement, the same operational record would acquire resolution-dependent values, producing nonzero predictive disagreement at arbitrarily fine unresolved-soft refinement and hence no finite renormalized PCE representative. ∎

**Corollary X.8j.4c (Inclusive and Dressed Sufficient Conditions).** On a regular massless-gauge branch where the standard hypotheses of KLN cancellation hold, sufficiently inclusive cross sections that sum over all degenerate unresolved soft real and virtual sectors satisfy the infrared PPI gate. On a branch where Faddeev-Kulish dressed asymptotic charged states exist, matrix elements between those dressed states also satisfy the gate. These are sufficient constructions of soft-ledger-invariant observables; they are not additional gauge postulates.

*Proof.* KLN inclusiveness identifies all records differing only by degenerate unresolved soft refinements and sums over that equivalence class, so the resulting cross section is a function of $[r]_{\sim_\lambda}$. Faddeev-Kulish dressing incorporates the coherent soft cloud fixed by the asymptotic charge and hard momentum data into the definition of the asymptotic state, so changing an unresolved representative inside the same soft-ledger class does not change the dressed matrix element. In both cases the observable factors through $q_\lambda$, and Theorem X.8j.4b applies. ∎

**Open Target X.8j.4d (PU-Internal KLN Derivation).** The PU-internal target is to derive KLN-style cancellation directly from the finite boundary ledger identity (X.8j.2), PCE quotienting by unresolved-soft refinements, and the finite action-entropy ledger, rather than importing cancellation as a massless-gauge branch theorem.

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

**Theorem X.8k.2 (Boundary Protocols Determine the Predictive Schur Operator).** On a finite branch satisfying Definition X.8k.1, the complete set of linear boundary-response protocols determines $\Lambda_{\partial}$ uniquely. Two interior networks are indistinguishable by all such boundary protocols if and only if they have the same $\Lambda_{\partial}$. Under a strict PCE tie-breaker on boundary-indistinguishable representatives, there is a unique minimal representative up to boundary-preserving gauge equivalence.

*Proof.* For each boundary basis vector $e_a$, impose $u_{\partial}=e_a$ and solve (X.8k.1). The measured flux is
$$
j_{\partial}^{(a)}=\Lambda_{\partial}e_a,
$$
which is the $a$-th column of $\Lambda_{\partial}$. Running this finite list of boundary protocols determines every column and hence $\Lambda_{\partial}$ uniquely.

If two networks have the same $\Lambda_{\partial}$, then for every boundary input $u_{\partial}$ they produce the same boundary flux $j_{\partial}$ by (X.8k.2), so no linear boundary protocol distinguishes them. Conversely, if all boundary protocols give the same flux for every $u_{\partial}$, then
$$
\Lambda_{\partial}^{(1)}u_{\partial}
=
\Lambda_{\partial}^{(2)}u_{\partial}
$$
for every boundary vector. Therefore $\Lambda_{\partial}^{(1)}=\Lambda_{\partial}^{(2)}$.

Boundary-indistinguishable networks lie in one PPI response class. A strict PCE tie-breaker assigns larger cost to any surplus internal representation that does not alter $\Lambda_{\partial}$. Since the equivalence class is finite at fixed resolution, the minimum exists; strictness makes it unique modulo boundary-preserving gauge transformations, which do not change any boundary protocol response. ∎

**Corollary X.8k.3 (Interior Effective Structure from Boundary Protocols).** The boundary-observable content of the effective predictive operator is exactly its Schur boundary response class. Interior degrees of freedom not changing $\Lambda_{\partial}$ are PPI-invisible and PCE-degenerate.

*Proof.* Theorem X.8k.2 identifies equality of all boundary protocol responses with equality of $\Lambda_{\partial}$. PPI therefore identifies the physical boundary content with the Schur response class, and PCE removes redundant representatives inside that class. ∎

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

**Corollary X.8l.3 (Dissipation, Circulation, and Ledger Memory).** In (X.8l.1), the exact part $d_0\phi$ is the potential-driven dissipative update, the coexact part $\delta_1\psi$ is the circulating gauge or response component, and the harmonic part $h$ is the persistent topological ledger class. Only the harmonic part survives both quotienting by exact redefinitions and removal of coexact local circulation.

*Proof.* Exact components lie in $\operatorname{im}d_0$ and vanish in cohomology. Coexact components are orthogonal response circulations. Theorem X.8l.2 identifies the quotient-invariant residue with the harmonic representative of $H^1$. ∎

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

For bulk and boundary descriptions to be MPU-equivalent (Definition X.9.1), capacity saturation alone is insufficient; one additionally requires a compatible reconstruction map preserving operational distributions. Theorem E.8.2 (Channel-Capacity Holography) establishes that under the conditions of geometric regularity (Theorem 43), area-law entropy scaling (Theorem 49), ND-RID channel structure (Definition 27), and a compatible nested reconstruction family, such reconstruction exists without assuming AdS geometry or conformal boundary structure. Under these reconstruction conditions, a bulk geometric description and a boundary channel description are MPU-equivalent for exterior observables; this is the PU form of holographic equivalence [Susskind 1995; Bousso 2002]. The duality arises because capacity saturation together with reconstruction implies both descriptions yield identical outcome distributions for all exterior measurements at the coarse-graining scale $\delta$.

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
At the PCE-Attractor the Predictive Ward Identity fixes the bulk normalization $\kappa^*_{\mathrm{bulk}}=1$ (Theorem X.3). Combined with the PCE-duality principle of Section X.9 (dual descriptions are cost-degenerate and cannot be distinguished by non-operational normalization choices), the bulk chart therefore yields the duality-symmetric baseline
$$
\alpha_{em,\mathrm{bulk}}^{-1} = \frac{4\pi\kappa^*_{\mathrm{bulk}}}{u^*} = \frac{4\pi}{u^*}.
$$
Operationally, $\alpha_{em}$ is not read off from a bulk chart but inferred from boundary-accessible channel observables, so one must match the bulk normalization to the discrete MPU interface. The active fraction contributing to gauge readout is fixed by the attractor-saturating Landauer partition $a=2$ inside $d_0=8$ on the minimal PCE branch, i.e. $a/d_0=1/4$ (Theorem Z.1; Theorem Z.2). The SPAP/Bures curvature at the attractor is $K_0=3$ (Theorem 15). On the canonical Appendix Z interface-normalization branch — comprising the bulk Predictive-Ward unit-normalization branch (Theorem Z.14, $\kappa^*_{\mathrm{bulk}} = 1$) used at the bulk baseline above, the canonical first-order interface-derivative normalization branch (Theorem Z.17), and the column-covariance branch (Theorem Z.24a) for the Bures-to-gauge identification — the duality-compatible interface dressing of the gauge normalization is:
$$
\delta\kappa := \kappa_{\mathrm{eff}} - \kappa^*_{\mathrm{bulk}}
= -\frac{a}{d_0}\frac{u^*}{\sqrt{K_0}} + O((u^*)^3)
= -\frac{u^*}{4\sqrt{3}} + O((u^*)^3).
$$
Thus, to first nontrivial order, on the same combined Appendix Z branch package,
$$
\alpha_{em}^{-1} = \frac{4\pi\kappa_{\mathrm{eff}}}{u^*}
= \frac{4\pi}{u^*} - \frac{\pi}{\sqrt{K_0}} + O((u^*)^2).
$$
Carrying the next curvature-controlled term from the same interface functional (Theorems Z.24–Z.26), on the canonical separable second-order curvature-response branch (Theorem Z.25) in addition to the named branches, gives the Thomson-limit prediction
$$
\alpha_{em}^{-1} =
\frac{4\pi}{u^*}
-\frac{\pi}{\sqrt{K_0}}
+\frac{\pi u^*}{24\sqrt{K_0}}\left(1-\frac{(u^*)^2}{6}\right)
+O((u^*)^5).
$$
With $u^*=2^{1/8}-1$ and $K_0=3$,
$$
\alpha_{em}^{-1} \approx 137.036092 \pm 0.000060,
$$
where the uncertainty is the conservative $1\sigma$ truncation bound for the first neglected $O((u^*)^5)$ term together with the matching/systematic contribution summarized in Appendix Z, Section Z.27.9.

Consequently, a literal map $u \mapsto 1/u$ is *not* a symmetry of the saturated constraint surface: the attractor selects a unique operational coupling $u^* = 2^{1/8} - 1$, and transformations that would map to $1/u^* \approx 11.05$ violate the capacity constraint (X.11). What can be dual are *descriptions*: distinct field variables or auxiliary-field representations (Appendix X) that represent the same effective $W_k[J]$ and the same operational correlators at the fixed-point physics. In this sense, "strong vs. weak" can be a coordinate artifact of the chosen effective variables, while the operational predictions remain locked to the same PCE optimum.


### X.9.4 Duality Discovery as a Constrained Equivalence Search

Appendix X (Section X.7) already provides a pipeline for connecting PU quantities to an effective action. Duality discovery is a specialization:

1. **Fix the operational sector.** Specify $\mathcal{O}$ (observables), $\mathcal{C}$ (contexts), and the outcome spaces $\{\Omega_O\}$ at MPU resolution (including any imposed symmetries, boundary conditions, and coarse-graining scale $\delta$).

2. **Construct the proxy.** Build $W_k[J]$ and $\Gamma_k[\Phi]$ consistent with those constraints (Appendix X); include CTP structure for ND-RID when appropriate (Section X.5).

3. **Enumerate candidate transforms.** Consider exact transformations that preserve correlators: field redefinitions, Legendre transforms on auxiliary fields, Hubbard–Stratonovich-type rewrites, or boundary restrictions implied by encoding theorems (Appendix E, Theorem E.8.2).

4. **Check operational invariants.** Verify that $p(E \mid O, c)$ is unchanged for all measurable outcome events $E$, observables $O \in \mathcal{O}$, and contexts $c \in \mathcal{C}$ at MPU resolution. Equivalently, under LAN conditions, check equality of connected correlators and the induced Fisher metric $\mathcal{G}$ (Proposition X.1).

5. **Conclude degeneracy.** Any candidate passing step (4) is PCE-degenerate at the proxy level by Proposition X.9.3.

### X.9.5 Predictive Obstruction Complex

**Definition X.9.5a (Finite PU Obstruction Complex).** Let $\mathcal U=\{U_i\}_{i\in I}$ be a finite operational cover of a regular PU branch, where each $U_i$ denotes a local predictive chart, perspective chart, gauge frame, boundary patch, or effective-action chart. Let $\mathcal F_\varepsilon$ be an abelian sheaf of finite-cost predictive correction functionals: for each $U$, $\mathcal F_\varepsilon(U)$ is the abelian group of signed local correction functionals with finite implementation cost, equipped with the filtration that records irreversible update increments satisfying the Landauer lower bound $\varepsilon\ge\ln 2$ for admissible positive updates. Define
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

**Theorem X.9.5b (Obstruction-Exactness Classification).** For every finite operational cover $\mathcal U$ and finite-cost sheaf $\mathcal F_\varepsilon$ as in Definition X.9.5a:

1. $\delta^2=0$, so $H^n_{\mathrm{PU}}(\mathcal U,\mathcal F_\varepsilon)$ is well-defined.
2. $H^0_{\mathrm{PU}}$ consists exactly of globally glueable finite-cost predictive assignments.
3. A nonzero class in $H^1_{\mathrm{PU}}$ is exactly the obstruction to choosing local predictive representatives whose pairwise transition corrections are all removed by local redefinitions.
4. A nonzero class in $H^2_{\mathrm{PU}}$ is exactly the obstruction to coherent triple-overlap closure; on regular connection branches this is the Cech representative of predictive curvature or anomaly descent.
5. For a pair $(X,\partial X)$ with boundary cover induced from $\mathcal U$, the relative complex
$$
C^n_{\mathrm{PU}}(X,\partial X)
=
\ker\bigl(C^n_{\mathrm{PU}}(X)\to C^n_{\mathrm{PU}}(\partial X)\bigr)
$$
has a long exact sequence
$$
\cdots\to H^n_{\mathrm{PU}}(X,\partial X)\to H^n_{\mathrm{PU}}(X)\to H^n_{\mathrm{PU}}(\partial X)\xrightarrow{\Delta}H^{n+1}_{\mathrm{PU}}(X,\partial X)\to\cdots,
\tag{X.9.5.3}
$$
so anomaly inflow and horizon compensation are the exactness condition that the boundary class maps to the negative of the bulk obstruction under $\Delta$.

*Proof.* For $c\in C^n$, compute
$$
(\delta^2 c)_{i_0\cdots i_{n+2}}
=
\sum_{r<s}(-1)^{r+s}
c_{i_0\cdots\widehat{i_r}\cdots\widehat{i_s}\cdots i_{n+2}}
+
\sum_{s<r}(-1)^{r+s-1}
c_{i_0\cdots\widehat{i_s}\cdots\widehat{i_r}\cdots i_{n+2}}.
$$
Each term appears twice with opposite sign, hence $\delta^2c=0$. This proves (1). A zero-cochain is a family of local assignments $a_i\in\mathcal F_\varepsilon(U_i)$. The condition $\delta a=0$ says $a_i=a_j$ on every overlap, which is precisely the sheaf gluing condition for a global finite-cost assignment; quotienting by $\operatorname{im}\delta:C^{-1}\to C^0=0$ changes nothing, proving (2). A one-cocycle $g_{ij}$ satisfying $\delta g=0$ gives compatible transition corrections on triple overlaps. It is a coboundary exactly when there exist local corrections $a_i$ with $g_{ij}=a_j-a_i$, which is exactly removal by local redefinition; therefore nonzero $H^1$ is precisely the residual pairwise mismatch, proving (3). The same calculation in degree two says that a two-cocycle is the residual triple-overlap failure. In a regular connection description the triple-overlap failure is the Cech representative of curvature, and in a gauge or frame redundancy branch it is the anomaly-descent cocycle; quotienting by coboundaries removes choices of local counterterm, proving (4). For (5), the short exact sequence of cochain complexes
$$
0\to C^\bullet_{\mathrm{PU}}(X,\partial X)\to C^\bullet_{\mathrm{PU}}(X)\to C^\bullet_{\mathrm{PU}}(\partial X)\to0
$$
induces the standard long exact sequence in cohomology by the snake lemma. Exactness at each term says precisely that a boundary obstruction is admissible when it is the image of a bulk-relative compensating class with opposite sign. ∎

**Corollary X.9.5c (One Exactness Principle for Curvature, Gauge Anomaly, and Horizon Inflow).** On regular branches where curvature, gauge anomaly, perspective mismatch, and horizon boundary data are represented by finite-cost transition functionals, their consistency condition is the same mathematical statement:
$$
[\omega_{\mathrm{bulk}}]+[\omega_{\mathrm{boundary}}]=0
\quad
\text{in the relevant }H^\bullet_{\mathrm{PU}}.
\tag{X.9.5.4}
$$

*Proof.* Theorem X.9.5b identifies each listed mismatch as a cohomology class in the same finite-cost Cech complex or its relative version. Total consistency means the combined class is exact, equivalently zero in cohomology. ∎

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

3. A gauged, boundary-active, or interface-active $q$-form ledger class is retained exactly when its obstruction class satisfies the same exactness condition as Theorem X.9.5b on the relevant absolute or relative complex.

4. For $q=0$, this reduces to the ordinary no-exact-operational-global-symmetry rule of Corollary G.8.4h.3 and the obstruction-exactness classification of Theorem X.9.5b.

*Proof.* Item 1 follows because the coboundary $\delta$ is the Cech coboundary of (X.9.5.1) with coefficients in the sheaf $\mathcal F_{\varepsilon}^{(q)}$, so the same cancellation proof gives $\delta^2=0$.

For item 2, if the label acts on no admissible $q$-dimensional protocol operator, then inserting or removing it leaves every protocol-response distribution unchanged. By Definition X.9.1 such descriptions are MPU-equivalent. Since the label has positive description cost and zero predictive benefit, Proposition X.9.3 and Corollary G.8.4h.3 remove it by PCE.

For item 3, a gauged or boundary-active class changes at least one admissible protocol response or supplies required boundary gluing data. It therefore cannot be removed as operationally null. Its consistency is exactly the question whether its local ledger representatives glue across the cover or are compensated by a relative boundary term. Theorem X.9.5b proves that this condition is exactness of the corresponding absolute or relative cohomology class.

For item 4, when $q=0$, the protocol operators are local operators and the ledger class is an ordinary symmetry, anomaly, or boundary-transition class. The statement is then precisely Corollary G.8.4h.3 together with Theorem X.9.5b. ∎

**Open Target X.9.5d.3 (Confinement as a Center One-Form Ledger Phase).** On the rootless flux-tube branch of Proposition Z.8d, the structural target is to prove that the Wilson-loop area law is equivalent to an unbroken electric center one-form predictive ledger acting nontrivially on line protocols, and that screening or deconfinement corresponds to explicitly ending, gauging, or breaking that one-form ledger on dynamical charged matter. Proposition Z.8d remains the branch input for the area law until this equivalence is derived from PU primitives.

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

**Theorem X.9.6b (Projection Theorem for Response, RG, Perspective Transport, and PCE Flow).** Assume the regular finite-mode branch in which the quadratic effective action, Wetterich regulator sector, Appendix M perspective diffusion form, and Appendix D PCE adaptation form are all represented as form-compatible summand restrictions of one closed predictive Dirichlet datum $\mathfrak D_{\mathrm{PU}}$, meaning that each projection $\Pi_\alpha$ leaves the common form domain invariant and each restricted form is closed. Then:

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

**Corollary X.9.6d (Predictive Resonance Spectrum).** Let $\mathcal L_{\mathrm{PCE}}$ be the finite active ND-RID/PCE transfer generator obtained from the appropriate Markov or response compression of $\mathfrak L_{\mathrm{PU}}$ in Theorem X.9.6b, with faithful stationary PCE/KMS state $\rho_*$. Define the predictive resonance set by the poles of the finite resolvent
$$
R_{\mathrm{PCE}}(z)
=
(z-\mathcal L_{\mathrm{PCE}})^{-1}.
\tag{X.9.6.6}
$$
Then:

1. $0\in\operatorname{Res}_{\mathrm{PU}}$ and its eigenspace is the stationary ledger sector. If the active quotient is primitive, this eigenspace is one-dimensional and represented by $\rho_*$.

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
where each $P_{\lambda}^{AB}$ is a polynomial whose degree is one less than the largest Jordan block at $\lambda$. On a detailed-balance normal branch, the polynomials are constants.

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

5. Under the predictive Hodge decomposition of update currents, exact conserved harmonic ledger modes are precisely the protected zero-resonance modes before quotienting. Near-harmonic finite-lifetime modes appear as resonances with small negative real part.

6. Any transport pole, linear-response pole, memory lifetime, or finite OTOC linearization expressible as a Laplace transform of an active MPU correlation has poles contained in $\operatorname{Res}_{\mathrm{PU}}$.

*Proof.* In finite dimension the resolvent $(z-\mathcal L_{\mathrm{PCE}})^{-1}$ is meromorphic, and its poles are exactly the eigenvalues of $\mathcal L_{\mathrm{PCE}}$, with pole order equal to Jordan-block size. Since $\rho_*$ is stationary,
$$
\mathcal L_{\mathrm{PCE}}^*(\rho_*)=0,
$$
so $0$ is a resonance. If the active quotient is primitive, Theorem G.1.9.1 gives uniqueness of the stationary state on that quotient, so the zero eigenspace is one-dimensional.

Contractivity of the ND-RID/PCE semigroup on the primitive quotient implies that no nonzero eigenvalue can have nonnegative real part. Otherwise $e^{t\mathcal L_{\mathrm{PCE}}}$ would contain either a nondecaying oscillatory mode or a growing mode in the quotient, contradicting strict convergence to $\rho_*$. Hence (X.9.6.7) holds.

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

The predictive Hodge theorem identifies harmonic ledger modes with closed and co-closed update currents not removed by exact or coexact compression. Such modes are conserved by the transfer generator, hence lie in $\ker\mathcal L_{\mathrm{PCE}}$. Conversely, a zero mode of the update-current generator that is not exact or coexact is harmonic in the Hodge quotient. Perturbing a protected harmonic mode by a finite dissipative leakage shifts the corresponding eigenvalue into the left half-plane with small negative real part. Finally, Laplace transforms of finite sums of the form (X.9.6.8) have poles only at the same resonances, proving item 6. ∎