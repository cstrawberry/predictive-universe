# Appendix X: PU and the Effective Action

## X.0 Overview and Scope

This appendix establishes the precise relationship between the Predictive Universe (PU) framework and the quantum/statistical **effective action** formalism. We connect:

* the **predictive free energy** and its **natural‑gradient RG** flow (Appendix D) to
* **Wilsonian coarse‑graining**, the **1PI effective action** $\Gamma$, and the **functional RG** (FRG),
* including the **gauge** and **gravitational** sectors, open‑system (Schwinger–Keldysh) structure for ND‑RID, and the link between the **rate‑level PCE potential** and the **effective potential** used in Appendix G.9 and Appendix Z.

Throughout we use natural units $c=\hbar=k_B=1$ unless explicitly stated, spacetime signature $(-,+,+,+)$, and Heaviside–Lorentz electromagnetic conventions.

---

## X.1 From Predictive Statistics to Generating Functionals

Let $\Theta\ni\theta\mapsto p_\theta$ be the coarse‑grained predictive model on field histories $\varphi$ (including matter/MPU fields and, when appropriate, background geometry). For a set of sufficient statistics $\mathcal{O}_a[\varphi]$ with sources $J^a(x)$, define the cumulant generating functional

$$
W[J]\;:=\;\ln\!\int\!\mathcal{D}\varphi\;p_\theta[\varphi]\;
\exp\!\Big(\!\int\! d^dx\, J^a(x)\,\mathcal{O}_a[\varphi](x)\Big).
\tag{X.1}
$$

The classical fields are $\Phi_a(x):=\delta W/\delta J^a(x)=\langle \mathcal{O}_a\rangle_J$. The **1PI effective action** is the Legendre transform

$$
\Gamma[\Phi]\;:=\;\sup_{J}\Big\{\!\int\! d^dx\,J^a\Phi_a\;-\;W[J]\Big\},
\qquad \frac{\delta \Gamma}{\delta \Phi_a(x)}=J^a(x).
\tag{X.2}
$$

We assume standard regularity/convexity conditions on $W[J]$ ensuring the existence of the Legendre transform and a well-defined Hessian. In quantum settings the weight $p_\theta[\varphi]$ subsumes $e^{iS[\varphi]}$ (Minkowski) or $e^{-S_E[\varphi]}$ (Euclidean) under the PU coarse-graining; open-system structure is treated via the CTP formalism in §X.5.

(For rigorous functional derivatives and convexity, $W$ and $\Gamma_k$ are defined in Euclidean signature; Minkowski-space results are obtained by analytic continuation where appropriate.) At vanishing sources $J=0$, stationary configurations $\delta\Gamma/\delta\Phi=0$ are the PU macrostates consistent with the chosen coarse‑graining.

**Proposition X.1 (Information geometry and curvature).**
Let $\mathcal{G}_{ab}(x,y)=\delta^2 W/\delta J^a(x)\delta J^b(y)$ be the connected two‑point kernel. Then

$$
\Gamma^{(2)}_{ab}(x,y):=\frac{\delta^2\Gamma}{\delta\Phi_a(x)\delta\Phi_b(y)}
\quad\text{satisfies}\quad
\int\! d^dz\, \mathcal{G}_{ac}(x,z)\,\Gamma^{(2)}_{cb}(z,y)=\delta_{ab}\delta(x-y).
\tag{X.3}
$$

Under LAN for exponential families built from the chosen sufficient statistics $\mathcal{O}_a$, the Fisher information coincides with $\mathcal{G}_{ab}$. The **Hessian of $\Gamma$** is its functional inverse. This identifies the curvature used in Appendix D with the inverse response encoded by $\Gamma^{(2)}$.

---

## X.2 Wilsonian Coarse‑Graining and Functional RG

Introduce a momentum‑scale dependent regulator $R_k$ and define the **scale‑dependent effective action** $\Gamma_k$ (IR modes $q\lesssim k$ suppressed). Its (Wetterich) functional RG flow is

$$
\partial_k \Gamma_k[\Phi]\;=\;\frac{1}{2}\,\mathrm{STr}\!\Big[\big(\Gamma^{(2)}_k[\Phi]+R_k\big)^{-1}\,\partial_k R_k\Big],
\tag{X.4}
$$

(Note: The flow is parameterized by the momentum scale $k$ directly, in contrast to some literature that uses $t = \ln(k/\Lambda)$.) Here $\mathrm{STr}$ denotes the supertrace, with a minus sign for Grassmann (fermionic/ghost) fields and implicit sums over internal indices and spacetime. The regulator $R_k$ suppresses modes $q\lesssim k$ and satisfies standard positivity/IR‑regularization conditions. We set $k=\Lambda/b$; the predictive $c$-function $c(b)=\mathcal{F}(\theta(b))$ is KL‑monotone, while $\Gamma_k$ encodes the full (regulator‑dependent) dynamics.

**Corollary X.2 (Fixed points and relevant directions).**
At a fixed point, directions with positive eigenvalues of $-H$ in Appendix D (equivalently, negative eigenvalues of $H$) correspond to RG‑relevant deformations of $\Gamma_k$; irrelevant directions decay under $k\downarrow 0$.

---

## X.3 Gauge Sector: Background‑Field Method and Normalization

Let $A_\mu=\bar A_\mu+a_\mu$ with background‑field gauge fixing preserving background invariance. The gauge part of the effective action reads

$$
\Gamma^{\text{gauge}}_k[\bar A]
=\int d^4x\,\Big[-\,\frac{Z_A(k)}{4}\,F_{\mu\nu}(\bar A)F^{\mu\nu}(\bar A)+\cdots\Big],
\tag{X.5}
$$

where dots include gauge‑invariant operators and (background‑invariant) gauge‑fixing/ghost terms. In this formalism, a Ward identity ensures that the renormalization of the background gauge coupling depends only on the background-field wavefunction renormalization factor $Z_A(k)$. The **physical coupling** satisfies

$$
e^2(k)=\frac{u(k)}{\kappa(k)},\qquad
\alpha_{\mathrm{em}}(k)=\frac{e^2(k)}{4\pi}=\frac{u(k)}{4\pi\,\kappa(k)},
\tag{X.6}
$$

with $u=g_e^2$ the PU rate‑level deformation and $\kappa(k)$ the field‑strength normalization. In background-field normalization (X.5), one may take $\kappa(k)=Z_{\text{map}}\;Z_A^{-1}(k)$, where $Z_A(k)$ is the background-field wavefunction factor and $Z_{\text{map}}$ accounts for the PU$\to$canonical field mapping. At the **PCE‑Attractor**, Appendix Z fixes $u^*=8^{1/24}-1$, and $\kappa$ is fixed by the emergent electroweak normalization/matching. Equation (X.6) is the precise statement underlying Appendix Z (cf. Z.4–Z.6).

---

## X.4 Gravitational Sector: $\Gamma[g]$, Wald Entropy, and Area Law

The geometric sector of the effective action takes the general diffeomorphism‑invariant form

$$
\Gamma^{\text{grav}}_k[g]
=\int d^4x\sqrt{-g}\,\Big[\frac{1}{16\pi G(k)}\,\big(R-2\Lambda(k)\big)
+\sum_i c_i(k)\,\mathcal{O}_i[g]\Big],
\tag{X.7}
$$

with curvature invariants $\mathcal{O}_i$ (e.g., $R^2,R_{\mu\nu}R^{\mu\nu},\dots$). Appendix E imposes **thermodynamic consistency** via the Clausius relation and the **Wald entropy density** on local Rindler sections. In $D=4$, consistency with the **Bekenstein–Hawking area coefficient** selects the Einstein–Hilbert structure at leading order (Appendix E; Section 12), yielding the field equations

$$
\frac{\delta \Gamma^{\text{grav}}}{\delta g_{\mu\nu}}
= \frac{\sqrt{-g}}{16\pi G}\,\Big(R^{\mu\nu}-\tfrac12 R g^{\mu\nu}+\Lambda g^{\mu\nu}\Big)
= -\,\frac12 \sqrt{-g}\,T^{(MPU)\,\mu\nu}.
\tag{X.8}
$$

which reproduce Theorem 12.G2/50 when coupled to $\Gamma^{\text{matter}}$. The **area‑law coefficient** $1/[4G]$ is fixed microscopically by Appendix E (Eq. E.9), while **scale dependence** $G(k)$ is discussed in Appendix I and Section 12.5. In higher dimensions $D>4$, the same Clausius/Wald logic selects the Lovelock class (Appendix E).

---

## X.5 Open‑System Structure for ND‑RID: Schwinger–Keldysh $\Gamma_{\rm CTP}$

ND‑RID implies an intrinsically **open** macroscopic dynamics. Introduce doubled fields $\Phi_\pm$ on the closed‑time path and define

$$
e^{\,i W_{\rm CTP}[J_+,J_-]}
=\!\int\!\mathcal{D}\varphi_+\mathcal{D}\varphi_-\,
p_\theta[\varphi_+,\varphi_-]\,
e^{\,i\big(S[\varphi_+]-S[\varphi_-]+\int J_+\mathcal{O}_+-\int J_-\mathcal{O}_-\big)}.
\tag{X.9}
$$

The **CTP effective action** $\Gamma_{\rm CTP}[\Phi_+,\Phi_-]$ is the Legendre transform of $W_{\rm CTP}$. Its **Keldysh decomposition** encodes a causal dissipative kernel $\eta$ and a noise kernel $N$ obeying fluctuation–dissipation constraints; positivity of $N$ aligns with the **local second law** used in Appendix E and preserves **operator causality** as in Appendix F. Near local equilibrium the KMS condition constrains the dissipative/noise kernels, consistent with the fluctuation–dissipation relations implied by the local second law. Setting $\Phi_+=\Phi_-=\Phi$ yields the physical, coarse‑grained equations with dissipative corrections consistent with PU thermodynamics.

---

## X.6 Rate‑Level PCE Potential vs. Effective Potential

For homogeneous deformations $u=g_e^2$, define the **effective potential**

$$
V_{\rm eff}(u;k)\ :=\ \frac{1}{\mathcal{V}}\;\Gamma_k[u\ \text{const}],
\qquad \mathcal{V}=\int d^4x.
\tag{X.10}
$$

Appendix G.9 defines a **rate‑level PCE potential** $\phi(u)$ capturing the power‑benefit tradeoff for maintaining $U(1)$ coherence; its LAN expansion near $u=0$ has curvature $\gamma_{\rm eff}=2$. The PU **capacity constraint** (Appendix W; flat spectrum at the PCE‑Attractor) reads

$$
M\ln(1+\lambda u)=\ln d_0.
\tag{X.11}
$$

At the attractor, the constrained minimization of $\phi(u)$ is equivalent to the stationarity of $V_{\rm eff}$ with a Lagrange multiplier $\zeta$:

$$
\frac{d}{du}\Big(V_{\rm eff}(u;k)+\zeta\,[M\ln(1+\lambda u)-\ln d_0]\Big)\Big|_{u=u^*}=0.
\tag{X.12}
$$

Using (X.12) with $\gamma_{\rm eff}=2$ reproduces the **zero‑slack condition** employed in Appendix Z, and algebraically yields the **identity** for $(\Gamma_0\nu)/A_{\rm PCE}$ reported in (Z.7)–(Z.8). At the PCE‑Attractor, the zero‑slack condition enforces capacity saturation, making the constrained minimizer of $\phi(u)$ coincide with the stationary point of $V_{\rm eff}$ under (X.11), reproducing the identities used in Appendix Z. 

**Theorem X.3 (Predictive Ward identity ⇒ $\kappa_\*=1$)**

Let $u$ be the PU control parameter that couples the predictive code to a background $U(1)$ connection $A_\mu$ through the predictive‑observable algebra (Sec. 8, App. F). At the PCE optimum with flat mode spectrum $(M,\lambda)=(24,1)$ (App. Z), the **quadratic variation** of the predictive free energy in $A_\mu$ equals the **BKM (Kubo–Mori) metric** of the $U(1)$ generator $Q$ *with canonical normalization*. The PU Ward identity (local $U(1)$ invariance of the cost frame) fixes this normalization, matching the quadratic term to the standard Maxwell action:
$$

\Delta \mathcal F \;=\; \frac{1}{4}\int \frac{1}{g^2}\,F_{\mu\nu}F^{\mu\nu}\, \mathrm d^4x,
\qquad \text{with}\qquad \boxed{\,g^2 = u\,}.
$$
Here $\mu^\*$ denotes the **PCE attractor scale** (flat spectrum; $\lambda=1$); laboratory values follow by **RG running** (Appendix V), with the one‑loop QED relation (Heaviside–Lorentz units)

$$
\frac{1}{\alpha(\mu)}=\frac{1}{\alpha(\mu_0)}-\frac{2}{3\pi}\sum_f N_c^{(f)} Q_f^2 \,\ln\!\frac{\mu}{\mu_0}\,,
$$

applied piecewise across thresholds (standard decoupling).
Hence $\alpha(\mu^\*)=\dfrac{g^2}{4\pi}=\dfrac{u^\*}{4\pi}$ and the normalization constant is exactly $\boxed{\kappa_\*=1}$. Using $u^\* = 8^{1/24}-1\approx 0.0905077$,
$$
\alpha(\mu^\*) \approx 0.007202, \qquad \frac{1}{\alpha(\mu^\*)}\approx 138.843.
$$
*Proof sketch.* The **predictive Ward identity** (cost‑frame invariance under local $U(1)$) fixes the generator normalization to the canonical one. This matches the quadratic piece to the standard Maxwell action, forcing $g^2=u$. No additional renormalization factor survives at $\mu^\*$ because the Ward identity is saturated by the flat spectrum at the PCE attractor. $\square$

Thus the **parameter‑free** value $u^*=8^{1/24}-1$ (Appendix Z) is simultaneously (i) a constrained PCE optimum and (ii) a stationary point of the effective potential under the same capacity saturation.

---

## X.7 Computational Pipeline and Renormalization Conditions

A concrete PU‑to‑$\Gamma$ pipeline (cf. Appendix V):

1. **Microscopic MPU cycle → LAN block:** extract $(d_0,\varepsilon)$, the active kernel size $a=e^\varepsilon=2$, and the QFI spectrum $(M,\lambda)$ (Appendix Z; Appendix W).
2. **Construct $W_k[J]$:** choose sufficient statistics consistent with symmetries; include CTP doubling for ND‑RID (X.9).
3. **Legendre transform → $\Gamma_k$:** enforce background invariances; use background‑field method for gauge/gravity; add regulator $R_k$ and integrate (X.4).
4. **Renormalization conditions:** fix $\kappa(k)$ and field normalizations by matching to low‑energy observables (e.g., Thomson limit), consistent with (X.6) and Appendix Z; fix $G(k)$ via the area‑law coefficient (Appendix E, Eq. E.9).
5. **Predictions:** evaluate $V_{\rm eff}$ and stationary conditions (X.10)–(X.12); propagate scale dependence $k\mapsto 0$ and compare with protocols in Section 13.

---

## X.8 Summary of Correspondences

* **Predictive geometry ↔ Response:** Fisher metric $\mathcal{G}$ (Appendix D) ↔ connected kernel $\mathcal{G}=\delta^2 W$; $\Gamma^{(2)}=\mathcal{G}^{-1}$ (X.3).
* **PU RG ↔ FRG:** KL‑monotone $c(b)$ (Appendix D) ↔ $\Gamma_k$ flow (X.4); relevant/irrelevant classification aligned via Hessians.
* **Gauge normalization:** $u=g_e^2$, $\alpha_{\mathrm{em}}=u/(4\pi\kappa)$ (X.6); $\kappa$ fixed by background‑field normalization; $u^*=8^{1/24}-1$ (Appendix Z).
* **Gravity:** $\Gamma^{\text{grav}}$ (X.7) + Wald entropy (Appendix E) ⇒ EFE (Section 12); $G$ from Eq. E.9; running $G(k)$ (Appendix I).
* **Open dynamics:** CTP $\Gamma_{\rm CTP}$ (X.9) encodes dissipation/noise consistent with the local second law (Appendix E) and algebraic locality (Appendix F).
* **Capacity saturation:** constraint (X.11) links PCE potential and $V_{\rm eff}$ stationarity (X.12), yielding the identities used in Appendix Z.

This appendix completes the identification of PU’s predictive variational structure with the standard effective‑action toolkit used to derive field equations, response, and renormalized parameters in both gauge and gravitational sectors.