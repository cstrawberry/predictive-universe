# Appendix X: PU and the Effective Action

## X.0 Overview and Scope

This appendix establishes the precise relationship between the Predictive Universe (PU) framework and the quantum/statistical **effective action** formalism. We connect the **predictive free energy** and its **natural‑gradient RG** flow (Appendix D) to **Wilsonian coarse‑graining**, the **1PI effective action** \$\Gamma\$, and the **functional RG** (FRG), including the **gauge** and **gravitational** sectors and the open‑system (Schwinger–Keldysh) structure required for ND‑RID. Throughout we use natural units \$c=\hbar=k\_B=1\$, spacetime signature \$(-,+,+,+)\$, and Heaviside–Lorentz electromagnetic conventions.



## X.1 From Predictive Statistics to Generating Functionals

Let \$\Theta\ni\theta\mapsto p\_\theta\$ be the coarse‑grained predictive model on field histories \$\varphi\$ (including matter/MPU fields and, when appropriate, background geometry). For a set of sufficient statistics \$\mathcal O\_a\[\varphi]\$ with sources \$J^a(x)\$, define the cumulant generating functional

$$
W[J]\;:=\;\ln\!\int\!\mathcal{D}\varphi\;p_\theta[\varphi]\;
\exp\!\Big(\!\int\! d^dx\, J^a(x)\,\mathcal O_a[\varphi](x)\Big).
\tag{X.1}
$$

The classical fields are \$\Phi\_a(x):=\delta W/\delta J^a(x)=\langle \mathcal O\_a\rangle\_J\$. The **1PI effective action** is the Legendre transform

$$
\Gamma[\Phi]\;:=\;\sup_{J}\Big\{\!\int\! d^dx\,J^a\Phi_a\;-\;W[J]\Big\},
\qquad \frac{\delta \Gamma}{\delta \Phi_a(x)}=J^a(x).
\tag{X.2}
$$

For rigorous convexity and domain control, \$W\$ and \$\Gamma\$ are defined in Euclidean signature; Minkowski‑space results follow by analytic continuation where appropriate. In Euclidean conventions one may write \$p\_\theta\[\varphi]\propto e^{-S\_E\[\varphi]}\$ with **dimensionless**

$$
S_E[\varphi]\;:=\;-\ln p_\theta[\varphi]\;+\;\text{const.}
$$

so that \$W,\Gamma\$ coincide with the usual statistical field‑theory functionals under PU coarse‑graining. At vanishing sources \$J=0\$, stationary configurations \$\delta\Gamma/\delta\Phi=0\$ are the PU macrostates at the chosen resolution.

**Proposition X.1 (Information geometry and curvature).**
Let \$\mathcal G\_{ab}(x,y)=\delta^2 W/\delta J^a(x)\delta J^b(y)\$ be the connected two‑point kernel. Then

$$
\Gamma^{(2)}_{ab}(x,y):=\frac{\delta^2\Gamma}{\delta\Phi_a(x)\delta\Phi_b(y)}
\quad\text{satisfies}\quad
\int\! d^dz\, \mathcal G_{ac}(x,z)\,\Gamma^{(2)}_{cb}(z,y)=\delta_{ab}\delta^{(d)}(x-y).
\tag{X.3}
$$

Under local asymptotic normality for exponential families built from \$\mathcal O\_a\$, the Fisher information coincides with \$\mathcal G\_{ab}\$, and the Hessian of \$\Gamma\$ is its functional inverse.



## X.2 Wilsonian Coarse‑Graining and Functional RG

Introduce a momentum‑scale dependent regulator \$R\_k\$ and define the scale‑dependent effective action \$\Gamma\_k\$ (IR modes \$q\lesssim k\$ suppressed). Its (Wetterich) functional RG flow is

$$
\partial_k \Gamma_k[\Phi]\;=\;\frac{1}{2}\,\mathrm{STr}\!\Big[\big(\Gamma^{(2)}_k[\Phi]+R_k\big)^{-1}\,\partial_k R_k\Big],
\tag{X.4}
$$

with \$\mathrm{STr}\$ the supertrace (minus sign for fermions/ghosts) and implicit traces over internal/spacetime indices. The regulator \$R\_k\$ suppresses modes \$q\lesssim k\$ and satisfies standard positivity/IR‑regularization conditions. Writing \$k=\Lambda/b\$, the predictive \$c\$‑function \$c(b)=\mathcal F(\theta(b))\$ is KL‑monotone, while \$\Gamma\_k\$ encodes the full (regulator‑dependent) dynamics.

**Corollary X.2 (Fixed points and relevant directions).**
At a fixed point, directions with negative eigenvalues of the \$\Gamma\_k\$ stability matrix are RG‑relevant (grow under \$k\downarrow 0\$), while positive‑eigenvalue directions are irrelevant.



## X.3 Gauge Sector: Background‑Field Method and Normalization

Let \$A\_\mu=\bar A\_\mu+a\_\mu\$ with background‑field gauge fixing preserving background invariance. The gauge part of the effective action reads

$$
\Gamma^{\text{gauge}}_k[\bar A]
=\int d^4x\,\Big[-\,\frac{Z_A(k)}{4}\,F_{\mu\nu}(\bar A)F^{\mu\nu}(\bar A)+\cdots\Big],
\tag{X.5}
$$

where dots include gauge‑invariant higher operators and the background‑invariant gauge‑fixing/ghost sector. A Ward identity ensures that the renormalization of the background gauge coupling depends only on the background‑field wavefunction factor \$Z\_A(k)\$. The physical coupling satisfies

$$
e^2(k)=\frac{u(k)}{\kappa(k)},\qquad
\alpha_{\mathrm{em}}(k)=\frac{e^2(k)}{4\pi}=\frac{u(k)}{4\pi\,\kappa(k)},
\tag{X.6}
$$

with \$u=g\_e^2\$ the PU rate‑level deformation and \$\kappa(k)\$ the field‑strength normalization. In background‑field normalization (X.5) one may take \$\kappa(k)=Z\_{\text{map}},Z\_A^{-1}(k)\$, where \$Z\_A(k)\$ is the background‑field wavefunction factor and \$Z\_{\text{map}}\$ accounts for the PU→canonical field mapping. At the PCE‑Attractor (Appendix Z), \$u^\*=8^{1/24}-1\$ and \$\kappa\$ is fixed by emergent electroweak matching.



## X.4 Gravitational Sector: \$\Gamma\[g]\$, Wald Entropy, and Area Law

The geometric sector of the effective action takes the diffeomorphism‑invariant form

$$
\Gamma^{\text{grav}}_k[g]
=\int d^4x\sqrt{-g}\,\Big[\frac{1}{16\pi G(k)}\,\big(R-2\Lambda(k)\big)
+\sum_i c_i(k)\,\mathcal O_i[g]\Big],
\tag{X.7}
$$

with curvature invariants \$\mathcal O\_i\$ (e.g., \$R^2,R\_{\mu\nu}R^{\mu\nu},\dots\$). Appendix E imposes **thermodynamic consistency** via the local Clausius relation and the **Wald entropy density** on local Rindler sections. In \$D=4\$, consistency with the **Bekenstein–Hawking area coefficient** selects the Einstein–Hilbert structure at leading order (Appendix E; Section 12), yielding field equations

$$
\frac{\delta \Gamma^{\text{grav}}}{\delta g_{\mu\nu}}
= \frac{\sqrt{-g}}{16\pi G}\,\Big(R^{\mu\nu}-\tfrac12 R g^{\mu\nu}+\Lambda g^{\mu\nu}\Big)
= -\,\frac12 \sqrt{-g}\,T^{(MPU)\,\mu\nu}.
\tag{X.8}
$$

The area‑law coefficient \$1/(4G)\$ is fixed microscopically by Appendix E, while scale dependence \$G(k)\$ is discussed in Appendix I and Section 12.5; in \$D>4\$ the same Clausius/Wald logic selects the Lovelock class.



## X.5 Open‑System Structure for ND‑RID: Schwinger–Keldysh \$\Gamma\_{\rm CTP}\$

ND‑RID implies intrinsically **open** macroscopic dynamics. Introduce doubled fields \$\Phi\_\pm\$ on the closed‑time path and define

$$
e^{\,i W_{\rm CTP}[J_+,J_-]}
=\!\int\!\mathcal{D}\varphi_+\mathcal{D}\varphi_-\,
p_\theta[\varphi_+,\varphi_-]\,
e^{\,i\big(S[\varphi_+]-S[\varphi_-]+\int J_+\mathcal{O}_+-\int J_-\mathcal{O}_-\big)}.
\tag{X.9}
$$

The **CTP effective action** \$\Gamma\_{\rm CTP}\[\Phi\_+,\Phi\_-]\$ is the Legendre transform of \$W\_{\rm CTP}\$. In the Keldysh \$r/a\$ basis the quadratic kernel has the causal structure

$$
\Gamma^{(2)}(\omega,\mathbf{k}) \equiv
\begin{pmatrix}
0 & \Gamma^{A} \\
\Gamma^{R} & \Gamma^{K}
\end{pmatrix},
$$

with \$\Gamma^{R}\$ retarded, \$\Gamma^{A}=(\Gamma^{R})^\dagger\$, and \$-i,\Gamma^{K}\succeq 0\$ (noise positivity). Near local equilibrium the KMS condition constrains \$\Gamma^{K}\$ consistently with the fluctuation–dissipation relations implied by the local second law (Appendix E). Setting \$\Phi\_+=\Phi\_-=\Phi\$ yields the physical coarse‑grained equations with causal dissipation.



## X.6 Rate‑Level PCE Potential vs. Effective Potential

For homogeneous deformations \$u=g\_e^2\$, define the **effective potential**

$$
V_{\rm eff}(u;k)\ :=\ \frac{1}{\mathcal{V}}\;\Gamma_k[u\ \text{const}],\qquad \mathcal{V}=\int d^4x.
\tag{X.10}
$$

Appendix G.9 defines a **rate‑level PCE potential** \$\phi(u)\$ capturing the power‑benefit trade‑off for maintaining \$U(1)\$ coherence; its LAN expansion near \$u=0\$ has curvature \$\gamma\_{\rm eff}=2\$. The PU **capacity constraint** (Appendix W; flat spectrum at the PCE‑Attractor) reads

$$
M\ln(1+\lambda u)=\ln d_0.
\tag{X.11}
$$

At the attractor, the constrained minimization of \$\phi(u)\$ is equivalent to the stationarity of \$V\_{\rm eff}\$ with Lagrange multiplier \$\zeta\$:

$$
\frac{d}{du}\Big(V_{\rm eff}(u;k)+\zeta\,[M\ln(1+\lambda u)-\ln d_0]\Big)\Big|_{u=u^*}=0.
\tag{X.12}
$$

Using (X.12) with \$\gamma\_{\rm eff}=2\$ reproduces the zero‑slack condition employed in Appendix Z and the identities (Z.7)–(Z.8). At the PCE‑Attractor the constrained minimizer of \$\phi(u)\$ coincides with the stationary point of \$V\_{\rm eff}\$ under (X.11).

**Theorem X.3 (Predictive Ward identity ⇒ \$\kappa\_\*=1\$).**
Let \$u\$ couple the predictive code to a background \$U(1)\$ source through the sufficient statistic associated to the generator \$Q\$. Denote by \$\mathcal K\$ the predictive quadratic kernel fixed by the \$U(1)\$ Ward identity in the predictive frame. At the PCE fixed point with flat mode spectrum \$(M,\lambda)=(24,1)\$ (Appendix Z):

*Assumption (Predictive Ward frame identification).* At the attractor scale \$\mu^\*\$, the predictive frame is fixed by matching the quadratic response to the background‑field two‑point function, i.e., the kernel \$\mathcal K\$ is defined with the background‑field normalization so that comparisons with \$\Gamma^{(2)}\$ are direct.

1. The predictive Ward identity implies

$$
\mathcal{G}\;=\;\left.\frac{\delta^2 W}{\delta J\,\delta J}\right|_{J=0}\;=\;\mathcal{K}^{-1}.
$$

2. By Legendre duality (X.3),

$$
\Gamma^{(2)}\;=\;\mathcal{G}^{-1}\;=\;\mathcal{K}.
$$

3. Writing the renormalized quadratic gauge kernel as \$\Gamma^{(2)}=\kappa\_*\mathcal{K}\$ by definition of the field‑strength normalization at the attractor, comparison with step 2 forces \$\kappa\_*=1\$.

Hence, at \$\mu^\*\$ (the PCE attractor scale) the canonical Maxwell normalization is recovered with

$$
g^2\;=\;u,\qquad \alpha(\mu^\*)=\frac{u^\*}{4\pi}.
$$

With \$u^\*=8^{1/24}-1\approx 0.0905077\$ (Appendix Z),

$$
\alpha(\mu^\*) \approx 0.007202,\qquad \frac{1}{\alpha(\mu^\*)}\approx 138.843.
$$



## X.7 Computational Pipeline and Renormalization Conditions

1. **Microscopic MPU cycle → LAN block:** extract \$(d\_0,\varepsilon)\$, the active kernel size \$a=e^\varepsilon=2\$, and the QFI spectrum \$(M,\lambda)\$ (Appendix Z; Appendix W).
2. **Construct \$W\_k\[J]\$:** choose sufficient statistics consistent with symmetries; include CTP doubling for ND‑RID (X.9).
3. **Legendre transform → \$\Gamma\_k\$:** enforce background invariances; use background‑field method for gauge/gravity; add regulator \$R\_k\$ and integrate (X.4).
4. **Renormalization conditions:** fix \$\kappa(k)\$ and field normalizations by matching to low‑energy observables (e.g., Thomson limit), consistent with (X.6) and Appendix Z; fix \$G(k)\$ via the area‑law coefficient (Appendix E).
5. **Predictions:** evaluate \$V\_{\rm eff}\$ and stationarity (X.10)–(X.12); run \$k\downarrow 0\$ and compare with protocols in Section 13.



## X.8 Summary of Correspondences

* **Predictive geometry ↔ response:** Fisher metric \$\mathcal{G}\$ (Appendix D) ↔ connected kernel \$\mathcal{G}=\delta^2 W\$; \$\Gamma^{(2)}=\mathcal{G}^{-1}\$ (X.3).
* **PU RG ↔ FRG:** KL‑monotone \$c(b)\$ (Appendix D) ↔ \$\Gamma\_k\$ flow (X.4); relevant/irrelevant classification aligned via stability eigenvalues.
* **Gauge normalization:** \$u=g\_e^2\$, \$\alpha\_{\mathrm{em}}=u/(4\pi\kappa)\$ (X.6); \$\kappa\_\*=1\$ at the attractor (Theorem X.3); \$u^\*=8^{1/24}-1\$ (Appendix Z).
* **Gravity:** \$\Gamma^{\text{grav}}\$ (X.7) + Wald entropy (Appendix E) ⇒ EFE (Section 12); \$G\$ from the area‑law coefficient; running \$G(k)\$ (Appendix I).
* **Open dynamics:** CTP \$\Gamma\_{\rm CTP}\$ (X.9) encodes dissipation/noise consistent with the local second law (Appendix E) and algebraic locality (Appendix F).
* **Capacity saturation:** constraint (X.11) links \$\phi(u)\$ and \$V\_{\rm eff}\$ stationarity (X.12), yielding the identities used in Appendix Z.