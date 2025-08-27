# Appendix X: PU and the Effective Action

## X.0 Overview and Scope

This appendix establishes the precise relationship between the Predictive Universe (PU) framework and the quantum/statistical **effective action** formalism. We connect the **predictive free energy** and its **natural‑gradient RG** flow (Appendix D) to **Wilsonian coarse‑graining**, the **1PI effective action** $\Gamma$, and the **functional RG** (FRG), including the **gauge** and **gravitational** sectors and the open‑system (Schwinger–Keldysh) structure required for ND‑RID. Throughout we use natural units $c=\hbar=k_B=1$, spacetime signature $(-,+,+,+)$, and Heaviside–Lorentz electromagnetic conventions.



## X.1 From Predictive Statistics to Generating Functionals

Let $\Theta\ni\theta\mapsto p_\theta$ be the coarse‑grained predictive model on field histories $\varphi$ (including matter/MPU fields and, when appropriate, background geometry). For a set of sufficient statistics $\mathcal O_a\[\varphi]$ with sources $J^a(x)$, define the cumulant generating functional

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

For rigorous convexity and domain control, $W$ and $\Gamma$ are defined in Euclidean signature; Minkowski‑space results follow by analytic continuation where appropriate. In Euclidean conventions, assuming the probability distribution can be written in Boltzmann form, $p_\theta\[\varphi] = e^{-S_E[\varphi]} / Z$, where $Z$ is the partition function. The **dimensionless** Euclidean action is

$$
S_E[\varphi]\;:=\;-\ln p_\theta[\varphi]\;+\;\ln Z.
$$

This ensures that $W,\Gamma$ coincide with the standard definitions in statistical field theory, adapted to the PU coarse‑graining context. At vanishing sources $J=0$, stationary configurations $\delta\Gamma/\delta\Phi=0$ are the PU macrostates at the chosen resolution.

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
With the PU normalization $\kappa^{\*}=1$ one has the **boundary condition** $\alpha(\mu^{\*})=u^{\*}/(4\pi)$ from Appendix Z, and the piecewise integral (set by fermion thresholds $m_f$) produces a predictive **band** for $\alpha^{-1}(m_Z)$.

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

with $u=g_e^2$ the PU rate‑level deformation and $\kappa(k)$ the field‑strength normalization. In background‑field normalization (X.5) one may take $\kappa(k)=Z_{\text{map}},Z_A^{-1}(k)$, where $Z_A(k)$ is the background‑field wavefunction factor and $Z_{\text{map}}$ accounts for the PU→canonical field mapping. At the PCE‑Attractor (Appendix Z), $u^\*=8^{1/24}-1$ and $\kappa$ is fixed by emergent electroweak matching.



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

The **CTP effective action** $\Gamma_{\rm CTP}\[\Phi_+,\Phi_-]$ is the Legendre transform of $W_{\rm CTP}$. In the Keldysh $r/a$ basis the quadratic kernel has the causal structure

$$
\Gamma^{(2)}(\omega,\mathbf{k}) \equiv
\begin{pmatrix}
0 & \Gamma^{A} \\
\Gamma^{R} & \Gamma^{K}
\end{pmatrix},
$$

with $\Gamma^{R}$ retarded, $\Gamma^{A}=(\Gamma^{R})^\dagger$, and $-i,\Gamma^{K}\succeq 0$ (noise positivity). Near local equilibrium the KMS condition constrains $\Gamma^{K}$ consistently with the fluctuation–dissipation relations implied by the local second law (Appendix E). Setting $\Phi_+=\Phi_-=\Phi$ yields the physical coarse‑grained equations with causal dissipation.



## X.6 Rate‑Level PCE Potential vs. Effective Potential

For homogeneous deformations $u=g_e^2$, define the **effective potential**

$$
V_{\rm eff}(u;k)\ :=\ \frac{1}{\mathcal{V}}\;\Gamma_k[u\ \text{const}],\qquad \mathcal{V}=\int d^4x.
\tag{X.10}
$$

Appendix G.9 defines a **rate‑level PCE potential** $\phi(u)$ capturing the power‑benefit trade‑off for maintaining $U(1)$ coherence; its LAN expansion near $u=0$ has curvature $\gamma_{\rm eff}=2$. The PU **capacity constraint** (Appendix W; flat spectrum at the PCE‑Attractor) reads

$$
M\ln(1+\lambda u)=\ln d_0.
\tag{X.11}
$$

At the **PCE-Attractor** (Definition 15a), the system by definition operates at the capacity boundary. This means the constrained minimization of the rate-level potential $\phi(u)$ is equivalent to finding the stationary point of the full effective potential $V_{\rm eff}$ under the capacity constraint (X.11), which can be formalized with a Lagrange multiplier $\zeta$:

$$
 \frac{d}{du}\Big(V_{\rm eff}(u;k)+\zeta\,[M\ln(1+\lambda u)-\ln d_0]\Big)\Big|_{u=u^*}=0.
 \tag{X.12}
 $$

Using this equivalence with $\gamma_{\rm eff}=2$ reproduces the zero‑slack condition employed in Appendix Z and the identities (Z.7)–(Z.8).

**Theorem X.3 (Predictive Ward Identity and Unity Normalization at the PCE-Attractor).**

The requirement for consistency between the substrate-level information-theoretic description and the emergent physical effective action, when evaluated at the **PCE-Attractor** (Definition 15a), uniquely fixes the normalization constant $\kappa^*$ to 1.

This result is derived from the Principle of Physical Instantiation (PPI, Appendix P), which mandates that at the Attractor—the state of maximal efficiency and symmetry—the emergent physical action must take its simplest, most direct form. For a $U(1)$ gauge field, this is the canonical Maxwell action, for which $\kappa^* = 1$ by definition. Any other value would represent an inefficiency that is, by definition, eliminated at the Attractor. The Predictive Ward Identity provides the formal mechanism that enforces this consistency:

1.  The predictive Ward identity on the substrate relates the connected two-point kernel $\mathcal{G}$ to the inverse of the information-theoretic quadratic kernel $\mathcal{K}$:
    $$
    \mathcal{G}\;=\;\left.\frac{\delta^2 W}{\delta J\,\delta J}\right|_{J=0}\;=\;\mathcal{K}^{-1}.
    $$

2.  By Legendre duality (X.3), the quadratic term of the 1PI effective action, $\Gamma^{(2)}$, is the functional inverse of $\mathcal{G}$. This links the emergent physics to the substrate statistics:
    $$
    \Gamma^{(2)}\;=\;\mathcal{G}^{-1}\;=\;\mathcal{K}.
    $$

3.  The physical quadratic gauge kernel is, by definition, related to the information-theoretic kernel by the normalization constant $\kappa^*$: $\Gamma^{(2)}=\kappa_*\mathcal{K}$. Comparison with the result from step 2, which is enforced by the Ward identity, forces the normalization constant to be exactly $\kappa^* = 1$.

Hence, at the MPU operational scale $\mu^*$ corresponding to the PCE-Attractor, the canonical Maxwell normalization is recovered as a derived consequence of the framework's principles:
$$
g^2\;=\;u,\qquad \alpha(\mu^*)=\frac{u^*}{4\pi}.
$$

With $u^*=8^{1/24}-1\approx 0.0905077$ (derived in Appendix Z), we have the parameter-free result:
$$ \alpha_{\mathrm{em}}(\mathrm{MPU}) \approx 0.007202,\qquad \frac{1}{\alpha_{\mathrm{em}}(\mathrm{MPU})}\approx 138.843. $$



## X.7 Computational Pipeline and Renormalization Conditions

1. **Microscopic MPU cycle → LAN block:** extract $(d_0,\varepsilon)$, the active kernel size $a=e^\varepsilon=2$, and the QFI spectrum $(M,\lambda)$ (Appendix Z; Appendix W).
2. **Construct $W_k\[J]$:** choose sufficient statistics consistent with symmetries; include CTP doubling for ND‑RID (X.9).
3. **Legendre transform → $\Gamma_k$:** enforce background invariances; use background‑field method for gauge/gravity; add regulator $R_k$ and integrate (X.4).
4. **Renormalization conditions:** fix $\kappa(k)$ and field normalizations by matching to low‑energy observables (e.g., Thomson limit), consistent with (X.6) and Appendix Z; fix $G(k)$ via the area‑law coefficient (Appendix E).
5. **Predictions:** evaluate $V_{\rm eff}$ and stationarity (X.10)–(X.12); run $k\downarrow 0$ and compare with protocols in Section 13.



## X.8 Summary of Correspondences

* **Predictive geometry ↔ response:** Fisher metric $\mathcal{G}$ (Appendix D) ↔ connected kernel $\mathcal{G}=\delta^2 W$; $\Gamma^{(2)}=\mathcal{G}^{-1}$ (X.3).
* **PU RG ↔ FRG:** KL‑monotone $c(b)$ (Appendix D) ↔ $\Gamma_k$ flow (X.4); relevant/irrelevant classification aligned via stability eigenvalues.
* **Gauge normalization:** $u=g_e^2$, $\alpha_{\mathrm{em}}=u/(4\pi\kappa)$ (X.6); $\kappa_\*=1$ at the attractor (Theorem X.3); $u^\*=8^{1/24}-1$ (Appendix Z).
* **Gravity:** $\Gamma^{\text{grav}}$ (X.7) + Wald entropy (Appendix E) ⇒ EFE (Section 12); $G$ from the area‑law coefficient; running $G(k)$ (Appendix I).
* **Open dynamics:** CTP $\Gamma_{\rm CTP}$ (X.9) encodes dissipation/noise consistent with the local second law (Appendix E) and algebraic locality (Appendix F).
* **Capacity saturation:** constraint (X.11) links $\phi(u)$ and $V_{\rm eff}$ stationarity (X.12), yielding the identities used in Appendix Z.