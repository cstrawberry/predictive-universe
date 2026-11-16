# Appendix H: Dimensional Analysis and Emergent Scales

## H.1 Introduction

This appendix checks that the framework's formulas use compatible physical units and explains how one conditional acceleration scale is assembled.

**Technical ledger.**

This appendix records the physical dimensions assigned to key PU symbols and verifies dimensional homogeneity. On the separately adopted QFI linear-response bridge of Definition H.0, it evaluates the conditional acceleration-scale relation between $g_0$ and $\Lambda$; identification of its output with the realized Milgrom scale requires an independent physical-realization certificate.

Standard SI base dimensions are used: Mass $[M]$, Length $[L]$, Time $[T]$, Energy $[E]=[M][L]^{2}[T]^{-2}$ and Temperature $[\Theta]$. Boltzmann's constant $k_{B}$ carries $[E][\Theta]^{-1}$. Predictive Physical Complexity $[Complexity]$ is treated as a fundamental dimension within the PU framework, representing the quantifiable structural resources required for prediction. Dimensionless information measures (nats) are noted where relevant. Factors of $c$ and $\hbar$ are kept explicit where needed for standard physics relations, but often $c=1, \hbar=1, k_B=1$ are used in derivations for simplicity.

*Numbering note:* Section and equation labels in this appendix are stable identifiers used for cross-references throughout the PU project.

## H.2 Dimensional Assignments

**Table H.1: Dimensions of Recurrent Symbols**

| Quantity                      | Symbol(s)                                                                        | Dimension                                            | Comment                                              |
| :---------------------------- | :------------------------------------------------------------------------------- | :--------------------------------------------------- | :--------------------------------------------------- |
| Predictive Physical Complexity | $C_{P}, C_{\text{agg}}, \hat{C}_{\text{target}}, \hat{C}_{v}$                    | $[\text{Complexity}]$                                | structural / resource capacity                       |
| Discrete register count        | $K_0$                                                                            | $1$                                                   | dimensionless count; $K_0=3$ on the minimal branch   |
| Probability / Performance     | $PP, Q, \alpha, \beta, \alpha_{\text{SPAP}}, \alpha_{CC,max}, \mathrm{CC}$ | $1$                                                  | dimensionless                                        |
| Information / Capacity        | $\Delta I, C_{\max}(f_{\text{RID}}), C_{\mathrm{ch}}$                            | $1$                                                  | dimensionless (nats)                                 |
| Structural/reset entropy | $\varepsilon_0=\ln2$; $\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)$ on a registered reset branch | $1$ | structural log-cardinality versus ensemble-dependent physical nats |
| Reflexivity constant          | $\kappa_{r}$                                                                     | $1$                                                  | dimensionless                                        |
| Physical cost rate            | $R(C), P_{\min}$                                                                 | $[E][T]^{-1}$                                        | power                                                |
| Info-cost rate                | $R_I(C), r_{I}$                                                                | $[E][T]^{-1}$                                        | power                                                |
| Cost-rate slope               | $R', R'_{I}$                                                                     | $[E][T]^{-1}[\text{Complexity}]^{-1}$                |                                                      |
| Scarcity factor               | $\lambda$                                                                        | $1$                                                  | dimensionless                                        |
| Power-conversion factor       | $\Gamma_{0}$                                                                     | $[E][T]^{-1}$                                        | performance gradient $\to$ power                       |
| Adaptation drive              | $\Psi$                                                                           | $[E][T]^{-1}[\text{Complexity}]^{-1}$                | net marginal power gradient                          |
| Adaptation-rate parameter     | $\eta_{\text{adapt}}$                                                            | $[\text{Complexity}]^2 [E]^{-1}$                      | Eq (30) coefficient                                  |
| Target learning rate          | $\mu_{\text{target}}$                                                            | $[T]^{-1}$                                           | Eq (38) coefficient                                  |
| Performance-efficiency const  | $\kappa_{\text{eff}}$                                                            | $1$                                                  | dimensionless, Law of Prediction                     |
| Network path length           | $d_{\mathcal{N}}$                                                                | $[L]$                                                | Eq (64)                                              |
| Micro-length scale            | $\ell_{0}, \delta$                                                               | $[L]$                                                | MPU scale                                            |
| Planck length                 | $L_{P}$                                                                          | $[L]$                                                | $\sqrt{G\hbar/c^{3}}$                                |
| Area                          | $\mathcal{A}$                                                                    | $[L]^{2}$                                            |                                                      |
| Boundary-channel density      | $\sigma_{\text{link}}$                                                           | $[L]^{-2}$                                           | Eq (E.5)                                             |
| Geometric packing factor      | $\eta$                                                                           | $1$                                                  | $\sigma_{\text{link}}\simeq1/(\eta\delta^{2})$        |
| Energy Density Operator       | $\hat{\rho}_v(x)$                                                                | $[E][L]^{-3}$                                        | Definition B.3                                       |
| Stress–energy tensor          | $T_{\mu\nu}^{(\mathrm{MPU})}$                                                      | $[E][L]^{-3}$                                        | energy density                                       |
| Gravitational constant        | $G$                                                                              | $[M]^{-1}[L]^{3}[T]^{-2}$                            | $G=G_{\mathrm{op}}$ requires the calibration stated after Equation (E.9) |
| Reduced Planck const.         | $\hbar$                                                                          | $[E][T]$                                             | action                                               |
| Invariant speed               | $c$                                                                              | $[L][T]^{-1}$                                        | speed of light                                       |
| Temperature                   | $T, T_{dS}$                                                                      | $[\Theta]$                                           |                                                      |
| Boltzmann constant            | $k_{B}$                                                                          | $[E][\Theta]^{-1}$                                   | energy–temperature conversion                        |
| Cosmological constant         | $\Lambda$                                                                        | $[L]^{-2}$                                           | vacuum curvature                                     |
| Bridge-law acceleration candidate | $g_0$                                                                       | $[L][T]^{-2}$                                        | Conditional under Definition H.0 and Equation H.4b   |
| Efficiency factor             | $\eta'$                                                                          | $1$                                                  | $3/(8\sqrt{3})\approx0.2165$ on the bridge branch   |
| Detector-calibrated crossover | $a_0$                                                                            | $[L][T]^{-2}$                                        | Conditional under Proposition I.3's detector certificate |
| Per-channel modes             | $M_{\mathrm{sp}}$                                                                | $1$                                                  | $M/(D-1)=8$ on its registered mode branch            |
| Phenomenological spatial transition scale | $L_0$                                                               | $[L]$                                                | Independent Equation-I.4 kernel parameter pending a dimensionally valid bridge |
| Simulation steps / Horizon    | $\mathcal{T}$                                                                | $1$                                                  | Dimensionless count                                  |

**Entropy-role convention for Sections H.4.2–H.4.7.** The structural reference $\varepsilon_0=\ln2$ and the physical reset entropy $\varepsilon_{\mathrm{phys}}$ have distinct roles. The bridge coordinate $C_{\mathrm{ch}}$ is a dimensionless structural channel-capacity coordinate measured in nats, distinct from the $[\text{Complexity}]$-valued operational variable $C(t)$ used in the adaptation dynamics. Define
$$
w_{\mathrm{cmp}}(C_{\mathrm{ch}}):=\frac{C_{\mathrm{ch}}}{\varepsilon_0}
$$
as the dimensionless comparison-slot weight of the adopted bridge law. It is not, in general, an integer count of physical resets. At the operating point $C_{\mathrm{ch}}=C_{\max}^*=2\varepsilon_0$, the acceleration-lock branch additionally registers an actual two-copy i.i.d. realization, so $w_{\mathrm{cmp}}=N_{\mathrm{cmp}}=2$ and QFI additivity applies. Any irreversible physical reset separately obeys $\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)$ on its registered reset branch; Landauer accounting alone neither fixes $\varepsilon_{\mathrm{phys}}=\varepsilon_0$ nor supplies the two-copy realization.

## H.3 Dimensional Consistency Checks

Using the dimensional assignments in Table H.1, we verify the dimensional homogeneity of the principal PU equations.

*   **Adaptation Dynamics (Equations (24), (30), (38))**
    *   Equation (24) defining $\Psi$: $\Psi$ has dimensions $[E][T]^{-1}[\text{Complexity}]^{-1}$. $\Gamma_{0}$ has $[E][T]^{-1}$, $\partial PP/\partial C$ has $[\text{Complexity}]^{-1}$ (PP dimensionless, $C$ has $[\text{Complexity}]$). $\lambda$ is dimensionless, $R'$ and $R_I'$ have dimensions $[E][T]^{-1}[\text{Complexity}]^{-1}$. The equation $\Psi = \Gamma_0 (\partial PP/\partial C) - (\lambda R' + R_I')$ is dimensionally consistent.
    *   Equation (30) for $\dot C$: $dC/dt$ has dimensions $[\text{Complexity}][T]^{-1}$. $\eta_{\text{adapt}}$ has $[\text{Complexity}]^2 [E]^{-1}$, $\Psi$ has $[E][T]^{-1}[\text{Complexity}]^{-1}$. The product $\eta_{\text{adapt}}\Psi$ has dimensions $[\text{Complexity}]^2 [E]^{-1} \times [E][T]^{-1}[\text{Complexity}]^{-1} = [\text{Complexity}][T]^{-1}$. Equation (30) is dimensionally consistent.
    *   Equation (38) for $\dot{\hat C}_{\text{target}}$: $d\hat C_{\text{target}}/dt$ has dimensions $[\text{Complexity}][T]^{-1}$. $\mu_{\text{target}}$ has $[T]^{-1}$. $\hat C_{\text{target}}$ has $[\text{Complexity}]$. $(PP-PP_{op})$ is dimensionless. The equation $\dot{\hat C}_{\text{target}} = \mu_{\text{target}} \hat C_{\text{target}} (PP - PP_{op})$ is dimensionally consistent

 

*   <a id="law-of-prediction-equations-22-23"></a>**Law of Prediction (Equations (22)–(23))**
    *   Equation (22): $PP$ dimensionless. $\beta, \alpha$ dimensionless. $\kappa_{\text{eff}}$ dimensionless. $C, C_{op}, \hat C_{\text{target}}$ have $[\text{Complexity}]$. $(C-C_{op})/\hat C_{\text{target}}$ is dimensionless. Exponent argument is dimensionless. Equation is dimensionally consistent.
    *   Equation (23): $C, C_{op}, \hat C_{\text{target}}$ have $[\text{Complexity}]$. $\kappa_{\text{eff}}$ dimensionless. $\ln(\dots)$ dimensionless. The equation is dimensionally consistent.

*   **Reflexivity Constraint (Equation (48))**
     *   Equation (48): on a registered reset branch with $\Delta I\ge\Delta I_{\min}>0$ and $H_q(P\mid R)\ge h_{\min}>0$, $\Delta I\,\varepsilon_{\mathrm{reset}}\ge\Delta I_{\min}h_{\min}=:\kappa_r>0$. Here $\varepsilon_{\mathrm{reset}}=\langle Q_{\mathrm{bath}}\rangle/(k_BT)$ is dimensionless, as are $\Delta I$, $\Delta I_{\min}$, and $h_{\min}$ in the stated information convention. Thus $\kappa_r$ is dimensionless, consistently with Table H.1.

*   **Area-Law First Variation (Equation (71))**
     *   Equation (71): $\delta S_h=[1/(4G)+r_h'(\mathcal A)]\delta\mathcal A\longrightarrow\delta\mathcal A/(4G)$ in natural units, uniformly on each compact refinement interval $K$ under $\sup_{\mathcal A\in K}|r_h'(\mathcal A)|\to0$. On the calibrated SI branch, the limiting entropy variation is $\delta S=k_B\delta\mathcal A/(4L_P^2)$. Its dimensions are $[E][\Theta]^{-1}[L]^2/[L]^2=[E][\Theta]^{-1}$, as required for entropy.

*   **Operational Gravitational Coefficient (Equation (E.9))**
    *   Equation (E.9) from Appendix E is $G_{\mathrm{op}} = \frac{\eta \delta^2 c^3}{4 \hbar \chi C(\mathcal E_N)}$ on its saturated operational branch. $G_{\mathrm{op}}$ has dimensions $[M]^{-1}[L]^3[T]^{-2}$. For the RHS: $\eta$ is dimensionless (1), $\delta$ has dimensions $[L]$, $c$ has $[L][T]^{-1}$, $\hbar$ has $[E][T]$, $\chi$ is dimensionless (1), and the positive registered channel capacity $C(\mathcal E_N)$ is dimensionless (1).
    RHS dimensions: $\frac{1 \cdot [L]^2 \cdot ([L][T]^{-1})^3}{[E][T] \cdot 1 \cdot 1} = \frac{[L]^2 [L]^3 [T]^{-3}}{[E][T]} = \frac{[L]^5 [T]^{-3}}{[M][L]^2[T]^{-2} [T]} = \frac{[L]^5 [T]^{-3}}{[M][L]^2[T]^{-1}} = [M]^{-1}[L]^3[T]^{-2}$.
    Equation is dimensionally consistent. Identifying $G_{\mathrm{op}}$ with the measured Newton constant $G$ requires the separate calibration stated in Appendix E.

*   **Einstein Field Equations (Equation (76))**
    *   Equation (76): $R_{\mu\nu}$ has dimensions $[L]^{-2}$. Ricci scalar $R$ has $[L]^{-2}$. $\Lambda$ has $[L]^{-2}$. $g_{\mu\nu}$ is dimensionless metric component. $T_{\mu\nu}$ has $[E][L]^{-3}$. $G$ has $[M]^{-1}[L]^3[T]^{-2}$, $c$ has $[L][T]^{-1}$. The term $\frac{8\pi G}{c^4} T_{\mu\nu}$ must also have dimensions $[L]^{-2}$. Checking the dimensions: $\frac{[G]}{[c^4]} [T_{\mu\nu}] = \frac{[M]^{-1}[L]^3[T]^{-2}}{[L]^4[T]^{-4}} [E][L]^{-3} = [M]^{-1}[L]^{-1}[T]^{2} [E][L]^{-3}$. Using $[E]=[M][L]^2[T]^{-2}$, this becomes $[M]^{-1}[L]^{-1}[T]^{2} ([M][L]^2[T]^{-2}) [L]^{-3} = [L]^{-2}$. Each term in the EFE carries dimensions of $[L]^{-2}$. Equation is dimensionally consistent.

*   **Certificate-Relative SPAP Complexity Bound (Equation (B.5))**
    *   On a registered quantitative task carrying the Bernoulli reduction, independence, confidence, and operation-count certificate of Appendix B.3,
 $$
        C_{\text{uni}}(\delta_{\rm SPAP}) = \Omega\left(\frac{\log(1/\delta_{\rm SPAP})}{(\delta_{\rm SPAP})^2}\right).
        $$
$C_{\text{uni}}$ is the dimensionless count of the registered verification/update operations, and $\delta_{\rm SPAP}$ is the dimensionless preregistered target margin relative to the certified class-specific boundary. The logarithm therefore has a dimensionless argument.

## H.4 Vacuum-Based Estimate of the Acceleration Scale $g_{0}$

The empirical acceleration scale is compared with the cosmological sector only through a staged bridge. The five-mode Appendix-U working-prefactor value $\Lambda L_P^2=(2.88\pm0.03)\times10^{-122}$ is a reference conversion. On the four-mode route, Theorem U.13b proves only sampled-angular Hessian nullity $m_4=4$; $\mathfrak C_{U,\mathrm{mark}}$ gives the independent carrier index $142$, Proposition U.14's premise gives action $284$, $\mathfrak F_U^{(4)}$ gives a Euclidean weight, and $\mathfrak R_\Lambda^{(4)}$ alone gives a physical $\Lambda_4L_P^2$. No complete instance is accepted. Any claim for $g_0$ additionally requires its own acceleration/dark-response realization, unit, and covariance certificate.

### H.4.1 de Sitter temperature

The vacuum energy density associated with the cosmological constant $\Lambda$ is given by the relation in Einstein's Field Equations (Theorem 50):
$$
\rho_{\text{vac}}=\frac{c^{4}\Lambda}{8\pi G}.
\tag{H.1}
$$
On the accepted regular Euclidean/KMS static-patch state branch of Theorem E.9.3, a central geodesic observer with the registered thermal-response certificate and proper-time normalization has the Gibbons–Hawking temperature [Gibbons & Hawking 1977]:
$$
T_{dS}=\frac{\hbar c \sqrt{\Lambda/3}}{2\pi k_{B}}.
\tag{H.2}
$$

### H.4.2 Crossover Scale from Information Resolution

<a id="proposition-h1-acceleration-scale-from-information-resolution"></a>**Proposition H.1 (Acceleration Scale from Information Resolution).**

Assume $\Lambda>0$ and an independently registered detector-and-relaxation certificate, as in Proposition I.3, that validates the Unruh and de Sitter temperature laws for the selected operational probes and defines the relaxation crossover by their equality. The certificate includes the applicability of the response of a probe with constant proper acceleration in the Minkowski vacuum to the selected Unruh comparison. Then the crossover acceleration scale is:
$$
a_0 = c^2\sqrt{\frac{\Lambda}{3}}
\tag{H.3}
$$

*Proof.* On the certificate's de Sitter branch, the selected detector has the Gibbons--Hawking temperature [Gibbons & Hawking 1977]:
$$
T_{dS} = \frac{\hbar c}{2\pi k_B}\sqrt{\frac{\Lambda}{3}}
$$

For the selected Unruh probe on its stationary uniformly accelerated Minkowski-vacuum branch, the detector temperature is [Unruh 1976, Sections II–III]:
$$
T_U(a) = \frac{\hbar a}{2\pi c k_B}
$$

Substituting these laws into the registered equality $T_U(a_0)=T_{dS}$ gives $a_0=c^2\sqrt{\Lambda/3}$. The temperature equality defines the stipulated crossover; identification with information-gradient indistinguishability or actual MPU relaxation requires the certificate's additional operational premises. ∎

The empirical MOND/RAR scale $g_0 \approx 1.2 \times 10^{-10}$ m/s$^2$ is related by an efficiency factor:
$$
g_0 = \eta' \cdot a_0 = \eta' \cdot c^2\sqrt{\frac{\Lambda}{3}}.
\tag{H.4}
$$
On the adopted operating-point bridge representative of Equation H.4b, this becomes the exact locked form
$$
g_0
=
\frac{3}{8\sqrt3}c^2\sqrt{\frac{\Lambda}{3}}
=
\frac{c^2\sqrt{\Lambda}}{8}.
\tag{H.4c}
$$

#### H.4.2.1 The Bridge Law: Dimensionless QFI Ratios and Generator-Amplitude Normalization

Let $\vartheta$ be a registered dimensionless acceleration-deformation coordinate. The efficiency factor $\eta'$ is a dimensionless bridge response constructed from QFI norm ratios with respect to $\vartheta$ and a separately declared generator-amplitude normalization. The factor $1/\sqrt{K_0}$ is an amplitude convention.

<a id="definition-h0-gravitational-efficiency-hybrid-bridge-law"></a>**Definition H.0 (Gravitational Efficiency - Hybrid Bridge Law).**
Define
$$
\eta' := \frac{F_{\mathrm{grav}}}{M_{\mathrm{sp}}},
\tag{H.4.BL}
$$
where $F_{\mathrm{grav}}$ is the dimensionless bridge-response ledger of Definition H.0a and $M_{\mathrm{sp}}=M/(D-1)=24/3=8$ on the equal-channel decomposition branch.

<a id="definition-h0a-dimensionless-gravitational-bridge-response"></a>**Definition H.0a (Dimensionless Gravitational Bridge Response).**
Let $\hat X$ be a unit QFI tangent direction for the dimensionless coordinate $\vartheta$. Assume the branch supplies linear maps $\Pi_{\mathrm{act}}$ and $\Pi_{\mathrm{sp}}$ satisfying
$$
\mathbb E\|\Pi_{\mathrm{act}}\hat X\|^2
=\frac{a}{d_0}\mathbb E\|\hat X\|^2,
\qquad
\mathbb E\|\Pi_{\mathrm{sp}}\Pi_{\mathrm{act}}\hat X\|^2
=\frac{D-1}{D}\mathbb E\|\Pi_{\mathrm{act}}\hat X\|^2.
$$
Define the hybrid bridge response by
$$
F_{\mathrm{grav}}
:=
w_{\mathrm{cmp}}(C_{\mathrm{ch}})
\mathbb E\!\left[\|\Pi_{\mathrm{sp}}\Pi_{\mathrm{act}}\hat X\|^2\right]
\frac{1}{\sqrt{K_0}}M_{\mathrm{sp}},
\tag{H.4.F}
$$
where $w_{\mathrm{cmp}}(C_{\mathrm{ch}}):=C_{\mathrm{ch}}/\varepsilon_0$, and where $1/\sqrt{K_0}$ is the declared amplitude normalization of the discrete generator. If the generator itself parameterizes a unitary statistical family, its SLD QFI scales by $1/K_0$ under $G\mapsto G/\sqrt{K_0}$; the hybrid ledger above does not identify its amplitude factor with that QFI scaling.

Substitution gives
$$
\eta'(C_{\mathrm{ch}})
=
w_{\mathrm{cmp}}(C_{\mathrm{ch}})
\left(\frac{a}{d_0}\right)
\left(\frac{D-1}{D}\right)
\left(\frac{1}{\sqrt{K_0}}\right),
\qquad
w_{\mathrm{cmp}}(C_{\mathrm{ch}})=\frac{C_{\mathrm{ch}}}{\varepsilon_0}.
\tag{H.4a}
$$
The numerical value in this bridge law is therefore conditional on the two displayed projection identities, the equal-channel decomposition, and the independent generator-amplitude convention.

#### <a id="h422-factor-1-active-participation-fraction-ad_0-14"></a>H.4.2.2 Factor 1: Active Participation Fraction ($a/d_0 = 1/4$)

<a id="theorem-h1a-isotropy-average-for-active-subspace"></a>**Theorem H.1a (Isotropy Average for Active Subspace).**
*At the PCE-Attractor $\rho_0 = \frac{I_a}{a} \oplus 0_b$, let $P_a$ be the rank-$a$ projector onto the active subspace. For a Haar-random unit vector $|\psi\rangle \in \mathbb{C}^{d_0}$:*
$$
\mathbb{E}_{\mathrm{Haar}}[\langle\psi|P_a|\psi\rangle] = \frac{\mathrm{Tr}(P_a)}{d_0} = \frac{a}{d_0}
$$

*Proof.* Let $\mu$ be normalized Haar measure on the unit sphere and define
$$
X:=\int|\psi\rangle\langle\psi|\,d\mu(\psi).
$$
Haar invariance (Haar 1933) gives, for every $U\in U(d_0)$,
$$
UXU^\dagger
=\int|U\psi\rangle\langle U\psi|\,d\mu(\psi)
=X.
$$
In an orthonormal basis, invariance under all diagonal phase unitaries forces every off-diagonal matrix element of $X$ to vanish. Invariance under permutation unitaries forces all diagonal elements to be equal. Hence $X=cI_{d_0}$. Since
$$
1=\operatorname{Tr}X=c\,d_0,
$$
we have $X=I_{d_0}/d_0$. Therefore, for every rank-$r$ projector $P$,
$$
\begin{aligned}
\mathbb E_{\mathrm{Haar}}[\langle\psi|P|\psi\rangle]
&=\int\operatorname{Tr}(P|\psi\rangle\langle\psi|)\,d\mu(\psi)\\
&=\operatorname{Tr}(PX)
=\frac{\operatorname{Tr}P}{d_0}
=\frac r{d_0}.
\end{aligned}
$$
Taking $P=P_a$ and $r=a$ proves the theorem. ∎

**Application to carrier vectors:** For a Haar-random unit carrier vector, projection to the active subspace gives
$$
\frac{a}{d_0} = \frac{2}{8} = \frac{1}{4}.
$$
Applying the same coefficient to the QFI tangent map $\Pi_{\mathrm{act}}$ requires the contraction certificate stated in Definition H.0a; it does not follow from the carrier-vector Haar average alone.

#### <a id="h423-factor-2-structural-comparison-weight-and-registered-repetition-w_mathrmcmp-2"></a>H.4.2.3 Factor 2: Structural Comparison Weight and Registered Repetition ($w_{\mathrm{cmp}}=2$)

<a id="theorem-h1b-qfi-additivity-for-independent-repetitions"></a>**Theorem H.1b (QFI Additivity for Independent Repetitions).**
*Let $\theta\mapsto\rho_\theta$ be a $C^1$ finite-dimensional density-operator family whose support is independent of $\theta$. For $N\in\mathbb N$ independent identical copies,*
$$
F_Q[\rho_\theta^{\otimes N}]
=N F_Q[\rho_\theta].
$$

*Proof.* On the common support, let $L_\theta$ be the symmetric logarithmic derivative defined by
$$
\partial_\theta\rho_\theta
=\frac12(L_\theta\rho_\theta+\rho_\theta L_\theta),
\qquad
F_Q[\rho_\theta]=\operatorname{Tr}(\rho_\theta L_\theta^2)
$$
(Helstrom 1976; Braunstein and Caves 1994). Differentiating the tensor power gives
$$
\partial_\theta\rho_\theta^{\otimes N}
=\sum_{j=1}^N
\rho_\theta^{\otimes(j-1)}\otimes
\partial_\theta\rho_\theta\otimes
\rho_\theta^{\otimes(N-j)}.
$$
Therefore its symmetric logarithmic derivative is
$$
L_\theta^{(N)}
=\sum_{j=1}^N
I^{\otimes(j-1)}\otimes L_\theta\otimes I^{\otimes(N-j)}.
$$
Taking the trace of the defining SLD equation gives
$$
\operatorname{Tr}(\rho_\theta L_\theta)
=\operatorname{Tr}(\partial_\theta\rho_\theta)
=\partial_\theta\operatorname{Tr}\rho_\theta=0.
$$
Consequently every cross term with $i\ne j$ in $(L_\theta^{(N)})^2$ has expectation
$$
\operatorname{Tr}(\rho_\theta L_\theta)^2=0,
$$
whereas each of the $N$ diagonal terms has expectation $\operatorname{Tr}(\rho_\theta L_\theta^2)$. Thus
$$
F_Q[\rho_\theta^{\otimes N}]
=\operatorname{Tr}\!\left(\rho_\theta^{\otimes N}(L_\theta^{(N)})^2\right)
=N\operatorname{Tr}(\rho_\theta L_\theta^2)
=NF_Q[\rho_\theta].
$$
∎

**Application (conditional i.i.d. repetition model):**
- The structural binary reference is $\varepsilon_0=\ln2$.
- At the PCE-optimal operating point, the adopted bridge convention has $C_{\mathrm{max}}^*=2\varepsilon_0$ (Appendix Q, Equation Q.10), hence $w_{\mathrm{cmp}}(C_{\mathrm{max}}^*)=2$.
- The acceleration-lock branch additionally registers two independent identically prepared comparison copies at that operating point. For this integer realization, Theorem H.1b gives the QFI multiplier $N_{\mathrm{cmp}}=2$.
- If either copy requires an irreversible physical reset, its implementation must separately satisfy $\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)$; a positive uniform floor inferred from this entropy bound requires a registered $H_q(P\mid R)\ge h_{\min}>0$.

Thus the factor $2$ is exact inside the adopted structural-slot plus two-copy bridge branch.

#### <a id="h424-factor-3-spatial-projection-d-1d-34"></a>H.4.2.4 Factor 3: Spatial Projection ($(D-1)/D = 3/4$)

<a id="theorem-h2-isotropic-projection-efficiency"></a>**Theorem H.2 (Isotropic Projection Efficiency).**
*Let $v$ be isotropically distributed in $\mathbb{R}^D$ with $0<\mathbb{E}[|v|^2]<\infty$. Let $P$ be the orthogonal projector onto a $(D-1)$-dimensional hyperplane. Then:*
$$
\frac{\mathbb{E}[|Pv|^2]}{\mathbb{E}[|v|^2]} = \frac{D-1}{D}
$$

*Proof.* By rotational invariance, each component of $v$ has the same expected squared magnitude:
$$
\mathbb{E}[v_i^2] = \frac{1}{D}\mathbb{E}[|v|^2] \quad \text{for each } i = 1, \ldots, D
$$

The projection $P$ onto a $(D-1)$-dimensional subspace removes one component:
$$
\mathbb{E}[|Pv|^2] = \sum_{i=1}^{D-1} \mathbb{E}[v_i^2] = \frac{D-1}{D}\mathbb{E}[|v|^2]
$$
∎

**Application:** Theorem H.2 gives the factor
$$
\frac{D-1}{D} = \frac{3}{4}
$$

**Physical Interpretation:** The factor applies to a positive-definite four-dimensional QFI tangent variable with a Euclidean-rotationally isotropic registered ensemble and a rank-three projector orthogonal in that QFI metric. In Lorentzian spacetime, $a^\mu u_\mu=0$ places the four-acceleration in the three-dimensional rest space orthogonal to $u^\mu$; it does not remove one statistically isotropic Euclidean component from a four-dimensional acceleration ensemble. Therefore Theorem H.2 establishes only the Euclidean codimension-one identity unless a separate certificate supplies a positive-definite QFI/rest-space isometry, the required isotropic ensemble, and the rank-three orthogonal projection.

#### <a id="h425-factor-4-democratic-generator-normalization-1sqrtk_0-1sqrt3"></a>H.4.2.5 Factor 4: Democratic Generator Normalization ($1/\sqrt{K_0} = 1/\sqrt{3}$)

<a id="theorem-h1c-democratic-generator-normalization-on-the-product-mixed-register"></a>**Theorem H.1c (Democratic Generator Normalization on the Product-Mixed Register).**
Let $Z_1,\ldots,Z_{K_0}$ be Pauli-$Z$ observables on $K_0$ qubits in the product maximally mixed state
$$
\rho_{\mathrm{mix}}:=\left(\frac{I_2}{2}\right)^{\otimes K_0}.
$$
Define
$$
G_{\mathrm{disc}}:=\sum_{i=1}^{K_0}Z_i.
$$
Then
$$
\mathrm{Var}_{\rho_{\mathrm{mix}}}(G_{\mathrm{disc}})=K_0,
\qquad
G_{\mathrm{can}}:=\frac{G_{\mathrm{disc}}}{\sqrt{K_0}}
\ \Rightarrow\
\mathrm{Var}_{\rho_{\mathrm{mix}}}(G_{\mathrm{can}})=1.
$$

*Proof.* For every $i$, $\operatorname{Tr}(\rho_{\mathrm{mix}}Z_i)=0$ and $\operatorname{Tr}(\rho_{\mathrm{mix}}Z_i^2)=1$. For $i\ne j$, product structure gives $\operatorname{Tr}(\rho_{\mathrm{mix}}Z_iZ_j)=0$. Hence
$$
\mathrm{Var}_{\rho_{\mathrm{mix}}}\!\left(\sum_{i=1}^{K_0}Z_i\right)
=
\sum_i\mathrm{Var}_{\rho_{\mathrm{mix}}}(Z_i)
+2\sum_{i<j}\operatorname{Cov}_{\rho_{\mathrm{mix}}}(Z_i,Z_j)
=K_0.
$$
Dividing the generator by $\sqrt{K_0}$ divides its variance by $K_0$. $\square$

**Application.** A coupling linear in $G_{\mathrm{can}}$ carries the amplitude coefficient $1/\sqrt{K_0}$. A QFI generated by $G_{\mathrm{can}}$ carries the squared coefficient $1/K_0$. Applying either statement to the rank-$a$ attractor state requires an independent register embedding and covariance certificate; it does not follow from this product-state calculation.

#### H.4.2.6 Why the Four Factors Multiply (Product Structure)

<a id="theorem-h3-multiplicative-structure-under-factorized-scalar-coarse-graining"></a>**Theorem H.3 (Multiplicative Structure under Factorized Scalar Coarse-Graining).**
*Assume the bridge-law maps are applied sequentially so that each stage rescales the already coarse-grained QFI quadratic form by a scalar on the image of the previous stage, and assume the repetition factor is implemented by i.i.d. copies as in Theorem H.1b. Then the total response factor is the product of the individual scalar factors.*

*Proof.* Let
$$
Q(\hat X):=\mathbb{E}[|\hat X|^2].
$$
Suppose $B$ satisfies
$$
Q(B\hat X)=\beta\,Q(\hat X),
$$
and suppose $A$ acts by a scalar on the image of $B$ in the sense that
$$
Q(AB\hat X)=\alpha\,Q(B\hat X).
$$
Then
$$
Q(AB\hat X)=\alpha\beta\,Q(\hat X).
$$
Iterating this identity across stages that act by scalars on the QFI quadratic form gives the product of those scalar factors. The repetition factor multiplies independently by QFI additivity when the repetitions are i.i.d. This proves the multiplicative statement for the stipulated quadratic-form stages. ∎

**Application to the Four Factors:**

The hybrid response of Definition H.0a additionally includes a separately declared generator-amplitude coefficient.

1. **$\Pi_{\mathrm{act}}$ (active participation):** Scalar factor $a/d_0$ from Definition H.0a's active-tangent contraction certificate; Theorem H.1a gives only the corresponding Haar carrier-vector average
2. **$\Pi_{\mathrm{sp}}$ (spatial projection):** Scalar factor $(D-1)/D$ from Definition H.0a's spatial-tangent contraction certificate; Theorem H.2 gives the Euclidean isotropic projection identity used by that certificate
3. **Normalization:** The declared hybrid amplitude factor is $1/\sqrt{K_0}$, with the product-mixed-register variance calculation supplied by Theorem H.1c; the SLD-QFI scaling under the generator rescaling is $1/K_0$
4. **Comparison-slot/repetition factor:** Structural weight $w_{\mathrm{cmp}}(C_{\mathrm{ch}})=C_{\mathrm{ch}}/\varepsilon_0$ by the bridge convention; at the operating point $w_{\mathrm{cmp}}=N_{\mathrm{cmp}}=2$, and Theorem H.1b applies to the registered i.i.d. realization

The chain $\Pi_{\mathrm{sp}} \circ \Pi_{\mathrm{act}}$ is multiplicative once the scalar-action hypothesis is imposed:
$$
\mathbb{E}[|\Pi_{\mathrm{sp}} \Pi_{\mathrm{act}} \hat{X}|^2] = \frac{a}{d_0} \cdot \frac{D-1}{D}\,\mathbb{E}[|\hat X|^2].
$$

At the operating point, the registered integer repetition count multiplies by QFI additivity in the i.i.d. setting. The structural weight $w_{\mathrm{cmp}}(C_{\mathrm{ch}})$ is a bridge coordinate; away from the integer operating point its continuous use is a T2 interpolation rather than a consequence of the tensor-product QFI theorem. The normalization factor is multiplicative by construction.

**Therefore:** the product structure holds under:
1. scalar action on the already coarse-grained quadratic form at each stage,
2. the registered two-copy i.i.d. realization at the operating point,
3. the structural interpolation convention for $w_{\mathrm{cmp}}(C_{\mathrm{ch}})$ away from that point, and
4. multiplicative generator normalization.

#### H.4.2.7 Why Only These Four Factors (Completeness)

<a id="theorem-h4-pointwise-qfi-does-not-determine-curvature-corrections"></a>**Theorem H.4 (Pointwise QFI Does Not Determine Curvature Corrections).**
Let $\rho(\theta)$ be a smooth finite-dimensional state family of constant rank on a parameter neighborhood. Assume its Bures pullback is a positive-definite $C^2$ metric there. The SLD quantum Fisher tensor gives its line element,
$$
ds_{\rm Bures}^2=\frac14F_{ij}(\theta)\,d\theta^i d\theta^j.
$$
The value of $F_{ij}$ at one parameter point does not determine metric derivatives or intrinsic curvature, and therefore does not determine curvature-dependent Van Vleck--Morette or heat-kernel coefficients.

*Proof.* In an eigenbasis of $\rho$ with eigenvalues $\lambda_\alpha$, the SLD equation gives $L_{\alpha\beta}=2(d\rho)_{\alpha\beta}/(\lambda_\alpha+\lambda_\beta)$ whenever the denominator is positive. Constant rank gives zero null-null tangent block. Symmetrizing the trace yields
$$
F(d\theta,d\theta)
=2\sum_{\lambda_\alpha+\lambda_\beta>0}
\frac{|(d\rho)_{\alpha\beta}|^2}{\lambda_\alpha+\lambda_\beta}
=4\,ds_{\rm Bures}^2.
$$
Curvature depends on derivatives of this metric, which its pointwise value does not supply. This distinction occurs among state families: the commuting family $\rho=\operatorname{diag}(x_1^2,x_2^2,x_3^2)$ on the positive octant of $\sum_i x_i^2=1$ has $F=\sum_i(dp_i)^2/p_i=4\sum_i dx_i^2$ and Bures Gaussian curvature $1$. The pure-qubit family $\cos(\theta/2)|0\rangle+e^{i\phi}\sin(\theta/2)|1\rangle$ has $ds_{\rm Bures}^2=(d\theta^2+\sin^2\theta\,d\phi^2)/4$ and Gaussian curvature $4$. Away from coordinate poles, normal coordinates make both pointwise tensors $F=4I$, while the curvatures differ. Curvature-dependent focusing coefficients consequently require more than this tensor value; heat-kernel coefficients additionally require the specified differential operator and boundary conditions. An independently supplied spacetime-curvature parameter may still enter $F$ through the state family. $\square$

**Consequence:** A bridge class may exclude curvature-dependent coefficients by an explicit locality convention. Such exclusion is a defining hypothesis of that bridge class, not a consequence of QFI being quadratic.

#### H.4.2.8 Combined Result

Combining the four factors within the bridge-law normalization and the factorized scalar coarse-graining ansatz of Theorem H.3 at the operating point $C_{\mathrm{ch}}=C_{\mathrm{max}}^*=2\varepsilon_0$, with the registered two-copy realization $w_{\mathrm{cmp}}=N_{\mathrm{cmp}}=2$:
$$
\eta'(2\varepsilon_0)
=
w_{\mathrm{cmp}}(2\varepsilon_0)
\cdot \frac{a}{d_0}
\cdot \frac{D-1}{D}
\cdot \frac{1}{\sqrt{K_0}}
=
2 \times \frac{1}{4} \times \frac{3}{4} \times \frac{1}{\sqrt{3}}
=
\frac{3}{8\sqrt{3}}
\approx 0.2165.
\tag{H.4b}
$$

<a id="definition-h428a-factor-certified-gravity-bridge-law-class"></a>**Definition H.4.2.8a (Factor-Certified Gravity Bridge-Law Class).** Let $\mathcal B_H$ be the class of bridge laws assigning a positive dimensionless coefficient $\eta$ to
$$
g_0(\eta)=\eta c^2\sqrt{\frac{\Lambda}{3}}.
$$
A member of $\mathcal B_H$ carries all of the following records:

1. a dimensionless deformation coordinate and the hybrid response ledger of Definitions H.0–H.0a;
2. two i.i.d. comparison copies at $C_{\mathrm{ch}}=C_{\max}^*=2\varepsilon_0$;
3. an active-tangent contraction certificate
   $$
   \mathbb E\|\Pi_{\rm act}\hat X\|^2
   =\frac{a}{d_0}\mathbb E\|\hat X\|^2;
   $$
4. a spatial contraction certificate
   $$
   \mathbb E\|\Pi_{\rm sp}\Pi_{\rm act}\hat X\|^2
   =\frac{D-1}{D}\mathbb E\|\Pi_{\rm act}\hat X\|^2;
   $$
5. an orthogonal equal-channel decomposition with $M_{\rm sp}=M/(D-1)$;
6. factorized scalar action of the repetition, active, spatial, and generator-amplitude stages on successive images;
7. the declared amplitude normalization $G_{\rm can}=G_{\rm disc}/\sqrt{K_0}$, recorded separately from SLD-QFI scaling; and
8. no coefficient chosen from galaxy rotation, lensing, or cosmological acceleration data.

<a id="theorem-h428b-normalization-on-the-factor-certified-bridge-class"></a>**Theorem H.4.2.8b (Normalization on the Factor-Certified Bridge Class).** Every bridge law in $\mathcal B_H$ has
$$
\eta(C_{\mathrm{ch}})=
w_{\mathrm{cmp}}(C_{\mathrm{ch}})
\left(\frac{a}{d_0}\right)
\left(\frac{D-1}{D}\right)
\left(\frac1{\sqrt{K_0}}\right),
\qquad
w_{\mathrm{cmp}}(C_{\mathrm{ch}})=\frac{C_{\mathrm{ch}}}{\varepsilon_0}.
$$
At $C_{\mathrm{ch}}=C_{\max}^*=2\varepsilon_0$, $a=2$, $d_0=8$, $D=4$, and $K_0=3$,
$$
\eta'=
2\cdot\frac14\cdot\frac34\cdot\frac1{\sqrt3}
=\frac{3}{8\sqrt3}.
$$
Condition 8 makes this value a pre-validation output of the bridge class: it is not chosen from galaxy rotation, lensing, or cosmological acceleration data.

*Proof.* The two-copy record gives the factor $2$ by QFI additivity. Conditions 3 and 4 give the two displayed contraction ratios. Condition 5 cancels the equal per-channel mode count in Definition H.0. Condition 7 supplies the generator-amplitude coefficient, and condition 6 permits multiplication of the four scalar stages. Their product is the displayed formula. Substitution gives
$$
2\cdot\frac14\cdot\frac34\cdot\frac1{\sqrt3}
=\frac{3}{8\sqrt3}.
$$
Condition 8 records that none of these coefficients was selected from galaxy rotation, lensing, or cosmological acceleration data, so the resulting value is a pre-validation output within this class. The theorem is a uniqueness statement only within the factor-certified class just defined; it does not derive conditions 3–7 from unitary or rotational invariance alone. ∎

<a id="corollary-h428c-acceleration-lock"></a>**Corollary H.4.2.8c (Acceleration Lock).** In the admissible QFI-gravity bridge-law class,
$$
g_0
=
\frac{3}{8\sqrt3}c^2\sqrt{\frac{\Lambda}{3}}
=
\frac{c^2\sqrt{\Lambda}}8.
$$
The coefficient has no free fit parameter once the upstream PU structural data and the QFI bridge-law class are fixed. This corollary fixes only the acceleration scale. It does not determine a galaxy response kernel, a cluster/lensing kernel, anisotropic stress, homogeneous late-time law, or backreaction constants; those require the separate covariant dark-susceptibility/effective-action certificate of Definition I.13d.

*Proof.* Substitute the unique value of $\eta'$ from Theorem H.4.2.8b into $g_0=\eta'c^2\sqrt{\Lambda/3}$. Since $\sqrt{\Lambda/3}/\sqrt3=\sqrt\Lambda/3$, the coefficient is $(3/8)(1/3)=1/8$. The remaining response kernels require a conserved stress tensor or susceptibility map and are not arguments of the scalar bridge-law normalization. ∎

<a id="theorem-h428d-invariant-quadratic-bridge-moduli-and-minimal-calibration"></a>**Theorem H.4.2.8d (Invariant Quadratic Bridge Moduli and Minimal Calibration).** Let a compact group $G$ act orthogonally on a finite-dimensional real response space $V$, and fix a $G$-invariant inner product. Every $G$-invariant quadratic bridge law has the form
$$
q_A(v)=\langle v,Av\rangle,
\qquad
A=A^*\in\operatorname{End}_G(V),
\tag{H.4.2.8d.1}
$$
and it is nonnegative exactly when $A\succeq0$. Hence invariance alone leaves the positive cone in the self-adjoint commutant as the complete finite quadratic modulus. On a multiplicity-free real-type decomposition $V=\bigoplus_{\lambda=1}^rV_\lambda$, this reduces to
$$
q_A(v)=\sum_{\lambda=1}^r a_\lambda\|v_\lambda\|^2,
\qquad a_\lambda\ge0.
\tag{H.4.2.8d.2}
$$

Let $L_1,\ldots,L_m$ and $L_\star$ be real linear functionals on the finite-dimensional real space $\operatorname{End}_G(V)_{\mathrm{sa}}$, where $L_\star(A)$ is the scalar response to be predicted. The value $L_\star(A)$ is unique on every nonempty feasible calibration fiber exactly when
$$
L_\star\in\operatorname{span}\{L_1,\ldots,L_m\}.
\tag{H.4.2.8d.3}
$$
For a fixed calibration vector $b$, put
$$
\mathcal F_b:=\{A\succeq0:\mathcal L(A)=b\},
\qquad
\mathcal D_b:=\operatorname{span}\{A-A':A,A'\in\mathcal F_b\}.
$$
On this particular nonempty fiber, the response is unique exactly when
$$
L_\star|_{\mathcal D_b}=0.
\tag{H.4.2.8d.4}
$$
If (H.4.2.8d.3) fails, a fiber through an interior positive point contains two positive invariant laws obeying every retained calibration and giving different scalar responses.

For the factor-certified subclass of Definition H.4.2.8a, Theorem H.4.2.8b determines the coefficient once its complete certificates are retained. If a positive factor that survives in Equation H.4a varies over a nontrivial interval independently of the other retained factors, then $\eta'$ varies over a nontrivial interval. The common mode count in Definitions H.0–H.0a is different: writing
$$
F_{\mathrm{grav}}=M_{\mathrm{sp}}K,
\qquad
K=w_{\mathrm{cmp}}\frac{a}{d_0}\frac{D-1}{D}\frac1{\sqrt{K_0}},
$$
gives $\eta'=K$ for every $M_{\mathrm{sp}}>0$. Varying this common count alone leaves $\eta'$ unchanged; varying only its denominator would change the response ledger. Without scalar factorization, uniqueness on an actual nonempty calibration fiber is decided by (H.4.2.8d.4). Criterion (H.4.2.8d.3) characterizes uniqueness on every nonempty fiber and is also necessary on a fiber containing a positive-definite point.

*Proof.* Averaging an arbitrary inner product over $G$ gives an invariant inner product. A quadratic form is represented by a unique self-adjoint $A$, and $G$-invariance is equivalent to $Ag=gA$ for every $g\in G$; nonnegativity is equivalent to $A\succeq0$. Schur's lemma gives (H.4.2.8d.2) on the stated special decomposition.

Let $\mathcal L(A)=(L_1(A),\ldots,L_m(A))$. Two points of $\mathcal F_b$ have the same response exactly when $L_\star$ annihilates their difference, so taking the span of all feasible differences proves (H.4.2.8d.4). If $L_\star$ lies in the span in (H.4.2.8d.3), it is constant on every calibration fiber. Conversely, finite-dimensional duality gives $D\in\ker\mathcal L$ with $L_\star(D)\ne0$ whenever that span condition fails. At a positive-definite $A_0$, both $A_0\pm\epsilon D$ are positive definite for sufficiently small $\epsilon>0$, have calibration $\mathcal L(A_0)$, and have different responses. This proves the universal equivalence and necessity for any fiber containing such a point. On a boundary fiber, only feasible differences enter (H.4.2.8d.4). Finally, varying an independent surviving positive factor multiplies a positive constant, whereas the common $M_{\mathrm{sp}}$ cancels identically. ∎

<a id="theorem-h428e-higher-order-invariant-bridge-census-and-linear-response-identifiability"></a>**Theorem H.4.2.8e (Higher-Order Invariant Bridge Census and Linear-Response Identifiability).** In the setting of Theorem H.4.2.8d, fix $k\ge1$ and let $\mathcal B^G_{2k}$ be the finite-dimensional real vector space of $G$-invariant polynomial bridge laws $F$ on $V$ of degree at most $2k$ with $F(0)=0$ and $dF(0)=0$. The quadratic part $q_F(v)=\tfrac12d^2F(0)[v,v]$ is a $G$-invariant quadratic law of the form (H.4.2.8d.1); it is the linear-response modulus of $F$.

1. For real linear functionals $L_1,\ldots,L_m$ and $L_\star$ on $\mathcal B^G_{2k}$, the value $L_\star(F)$ is unique on every nonempty calibration fiber exactly when $L_\star\in\operatorname{span}\{L_1,\ldots,L_m\}$, and on a particular nonempty fiber of nonnegative laws exactly when $L_\star$ annihilates the span of that fiber's feasible differences. If the span condition fails, every fiber through a law with $F(v)\ge c(|v|^2+|v|^{2k})$ for some $c>0$ contains two nonnegative laws with different values of $L_\star$.

2. If $G$ acts transitively on the unit sphere of $V$, then $\mathcal B^G_{2k}$ consists of the laws $F(v)=\sum_{j=1}^kc_j|v|^{2j}$, and $q_F(v)=c_1|v|^2$. Exact values of $F$ at points with $p$ distinct nonzero norms determine $c_1$ exactly when $p\ge k$; for $p\le k-1$ there are two nonnegative laws with equal values at those points and different $c_1$.

3. For every $G$ and every finite set of nonzero calibration points, $\mathcal B^G_{2k}$ with $k$ larger than the number of distinct calibration norms contains two nonnegative laws with equal calibration values and different quadratic parts. Hence no finite set of finite-amplitude values determines the linear-response modulus on the class of all $G$-invariant polynomial or smooth bridge laws, whereas the second-order jet of $F$ at the operating point determines it on every class. This is the finite-amplitude counterpart of Theorem H.4.

*Proof.* Item 1 repeats the proof of Theorem H.4.2.8d on the finite-dimensional space $\mathcal B^G_{2k}$: two laws of a fiber have the same response exactly when $L_\star$ annihilates their difference, and if the span condition fails, duality gives $D\in\ker\mathcal L$ with $L_\star(D)\ne0$. Every $D\in\mathcal B^G_{2k}$ has no constant or linear term, so each of its monomials has degree between $2$ and $2k$ and $|D(v)|\le C_D(|v|^2+|v|^{2k})$. Hence $F\pm\epsilon D\ge(c-\epsilon C_D)(|v|^2+|v|^{2k})\ge0$ for $0<\epsilon\le c/C_D$, and the two laws lie in the fiber of $F$ with different values of $L_\star$.

For item 2, an invariant $F$ is constant on spheres. On a line $te$ through a unit vector $e$, $t\mapsto F(te)$ is a polynomial, and it is even because $-e$ lies in the orbit of $e$; with $F(0)=0$ and degree at most $2k$, this gives $F(v)=\sum_{j=1}^kc_j|v|^{2j}$. At points with distinct nonzero norms $r_1,\ldots,r_p$, put $x_i=r_i^2$; the calibration values are $\sum_jc_jx_i^j$. If $p\ge k$, the $k\times k$ matrix $[x_i^j]$ for $k$ of these points is a Vandermonde matrix times $\operatorname{diag}(x_i)$ and is invertible, so every $c_j$ is determined. If $p\le k-1$ and the functional $c_1$ lay in the span of the calibration functionals, there would be $u$ with $\sum_iu_ix_i^j=\delta_{j1}$ for $j=1,\ldots,k$; with $w_i=u_ix_i$ this reads $\sum_iw_i=1$ and $\sum_iw_ix_i^t=0$ for $t=1,\ldots,k-1$, and the equations with $t=1,\ldots,p$ have an invertible matrix, forcing $w=0$, a contradiction. Duality then gives $d\in\mathbb R^k$ with $\sum_jd_jx_i^j=0$ for every $i$ and $d_1\ne0$, and the argument of item 1 applied to $F_0=|v|^2+|v|^{2k}$ and $D=\sum_jd_j|v|^{2j}$ gives the two nonnegative laws.

For item 3, the laws $\sum_jc_j|v|^{2j}$ are $G$-invariant for every orthogonal action, and their calibration values depend only on the calibration norms. The construction of item 2 with $k$ exceeding the number of distinct norms gives two nonnegative laws with equal calibration values and different $c_1$, hence different quadratic parts; polynomial laws are smooth. The quadratic part is $\tfrac12d^2F(0)$, which the second-order jet supplies. ∎

<a id="construction-h428f-common-ramsey-signed-score-and-mode-response-source"></a>**Construction H.4.2.8f (Common Ramsey, Signed-Score and Mode-Response Source).**

One ideal physical instrument in the factor-certified class of Definition H.4.2.8a uses the following common preparation, acceleration/clock transduction, complete retained routing flags, scalar measurements, mode-control response and independent generator-amplitude calibration.

##### 1. Structural inputs and independent dimensional inputs

Use only the registered branch data
\[
d_0=8,\quad a=2,\quad D=4,\quad K_0=3,\quad
\varepsilon_0=\ln2,\quad C_{\mathrm{ch}}=2\ln2,
\quad N_{\mathrm{cmp}}=2.
\]
The elementary carrier has three qubits. Choose any fixed positive inertial mass \(m\), arm-length unit \(\ell\), and interrogation time \(\tau\), measured in kg, m, and s. Define
\[
a_*:=\frac{\hbar}{m\ell\tau}\quad[\mathrm{m\,s^{-2}}].
\]
Changing these dimensional calibration units changes the acceleration-coordinate conversion, not any dimensionless factor proved below. No value of \(\Lambda\), no measured gravitational acceleration, and no numerical target for \(\eta\) is used to select \(m,\ell,\tau\).

##### 2. Complete source and retained-algebra record

The source is a one-shot finite bank of prepared quantum systems and classical controls. The elementary quantum instruments are finite dimensional; the classical isotropic setting is continuously registered.

###### 2.1 Subsystems and preparations

For each of two comparison modules \(c=1,2\), prepare independently:

1. An elementary sensing carrier \(Q_c=q_c\otimes s_c\otimes v_c\), each factor a qubit. The q preparation is produced by the actual inertial Ramsey transducer in §3; s is the physical clock-phase qubit; v is a fixed spectator in \(|0\rangle\).
2. A classical uniformly sampled preparation-axis register \(J_c\in\{1,2,3\}\), a Ramsey path qubit, blank outcome memory, and the source preparation environment. These are internal preparation systems, explicitly excluded from the retained sensing algebra after preparing q.
3. An independent eight-label selector \(R_c\) in \(I_8/8\), a fresh rank-two reference carrier \(Q_{\mathrm{ref},c}\) in \(\rho_0\), and a blank permanent archive for the swapped-out carrier. Every selector label and its active/inactive status is retained.
4. Four independent centered equal-variance Gaussian setting samples. For example, independent vacuum quadrature measurements, with a calibrated rescaling, produce standard Gaussian variables. Put \(\xi_c=g_c/\|g_c\|\); the zero vector is a probability-zero event. Retain \(\xi_c\) exactly as a classical setting record. The two modules use independent draws.
5. The physical platform/trap/clock controls and the setting-conditioned measurement controller described below. They are prescribed classical controls in the ideal source model, not extra observed copies of the unknown parameter.

For each of the 24 labeled mode-response slots \(\mu\), prepare:

6. A fresh carrier of the identical elementary C8 design in \(\rho_0\), using the same master preparation/control family as the sensing carrier (§7). These are response meters, not extra sensing repetitions.
7. A fresh independent three-qubit amplitude-calibration register \(C_\mu\) in \((I_2/2)^{\otimes3}\), independent of both sensing modules and every other C register. The same physical register type is used in baseline calibration and sensing-driven operation.
8. Pulse control, a dimensionless pulse-area record \(\epsilon\), and readout devices for the commuting C observable \(Z_j\) and meter observable \(L_\mu\). Their outcomes, mode labels, and timing records are retained.

Distinct mode readouts use fresh carriers. The generally noncommuting 24 observables are not asserted to be simultaneously measurable on one preparation. They may be executed serially on the same hardware with fresh-state SWAP supplies, or in parallel on separate carriers of the identical design. The tensor-factor and control definitions do not depend on that scheduling choice.

###### 2.2 Retained output and archives

The retained classical sensing record is
\[
\mathcal R=(\xi_1,k_1,y_1,\xi_2,k_2,y_2,\text{pair identity}),
\]
where k is the complete eight-valued selector flag and y is the signed scalar SLD measurement outcome. Also retain the computed signed score \(S\), score power \(W=S^2\), every response mode label, pulse area, and response/calibration readout.

The inaccessible preparation/archive algebra includes J, the preparation Ramsey detector result, its microscopic detector environment, the rejected probe, the s and v systems discarded by the spatial readout, fresh-state preparation coins, and the microscopic platform/trap/clock reservoirs. Nothing in the claimed instrument subsequently accesses these systems. They are not assumed magically destroyed; the experimental channel is the restriction to the declared retained algebra.

This distinction is falsifiable. Retaining the preparation axis would give a different source experiment with spatial QFI \(3I_3\) at the origin. Recovering the rejected probe restores the information deliberately removed by routing. Neither is part of the present retained source. “Complete flags” here means that every actual routing trial, all eight selector labels, both signs of every retained measurement, and all setting/response labels remain accounted for. It does not mean that the accessible sensing experiment includes every source preparation environment.

###### 2.3 Resources and reset

The platform actuator supplies the force needed for the prescribed acceleration; traps supply the holding forces; Ramsey pulses, clock references, blank records, and fresh rank-two/mixed states are supplied resources. No zero-cost preparation or closed autonomous dynamics is asserted. One-shot use stores all excluded systems and records without erasing them. Therefore no irreversible reset is invoked and no physical heat floor is inferred from \(\ln2\).

If this source is turned into a reusable cyclic machine, the actual memory/reset and work budget must be supplied separately. In particular the structural quantity \(\varepsilon_0=\ln2\) is not the physical conditional entropy of this source's memories.

##### 3. Physical acceleration-deformation coordinate and forward transduction

Fix an observer's orthonormal spatial triad \(e_1,e_2,e_3\) and calibrated clock. On each comparison module, let \(a_j\) be its controlled proper-acceleration components relative to the local inertial reference in the nonrelativistic source model. Let \(\delta\omega\) be the calibrated reference-clock detuning, in radians per second. Define
\[
x_j=\frac{a_j}{a_*}=\frac{m\ell\tau}{\hbar}a_j\quad(j=1,2,3),
\qquad x_4=\tau\delta\omega.
\]
The dimensionless deformation experiment is the one-parameter family
\[
x_c(\vartheta)=\vartheta\xi_c,\qquad \xi_c\in S^3.
\]
The physical source input is a common deformation amplitude with the registered four control gains \(\xi_c\). Its first three output controls drive actual platform acceleration and its fourth drives actual clock detuning. Different settings define different known control directions of the same source family. The readout controller does not know or use \(\vartheta\); it uses only the setting and measured outcomes.

The four coordinates are heterogeneous physical controls made dimensionless by independent calibration. The fourth is a clock/reference deformation. It is not a fourth spatial component of acceleration. We do not equate \(x\) with a Lorentzian four-acceleration, nor use \(a^\mu u_\mu=0\) as a statistical-isotropy argument.

###### 3.1 Direct inertial encoding of q

Conditional on the uniformly selected axis J, use two held massive Ramsey arms separated by \(3\ell e_J\). In the accelerating frame the ideal nonrelativistic source action has
\[
L=\tfrac12m|\dot z|^2-m a\cdot z-V_{\mathrm{trap}}(z,t).
\]
The two arms have fixed relative position during \(\tau\); common trap phases are canceled by a registered reference sequence. Consequently the acceleration-dependent Hamiltonian difference is \(3m\ell a_J\), and the relative phase is
\[
\phi_J=\frac{3m\ell\tau a_J}{\hbar}=3x_J.
\]
Equivalently, in the two-path subspace the nontrivial Hamiltonian is \((3m\ell a_J/2)Z\). Preparing \(|+\rangle\), evolving for \(\tau\), and measuring the quadrature with the appropriate fixed sign convention gives
\[
\Pr(b\mid J,x)=\frac{1+b\sin(3x_J)}2,\qquad b=\pm1.
\]
A fixed controlled preparation map sends this outcome to the \(\sigma_J\) eigenstate with eigenvalue b. Average over J and exclude the source preparation register from the retained algebra. Then, exactly,
\[
\rho_q(x)=\frac13\sum_{J=1}^3\sum_{b=\pm1}
\frac{1+b\sin(3x_J)}2\frac{I+b\sigma_J}{2}
=\frac{I+r(x)\cdot\sigma}{2},
\qquad r_j(x)=\frac{\sin(3x_j)}3.
\]
This is a forward acceleration-to-density-operator derivation, not an independent instruction to prepare a state containing a known \(\vartheta\). The factor 3 in the arm separation compensates the fixed three-axis preparation duty fraction; it is set by the structural axis count and verified in the coordinate Jacobian. It is not obtained from the desired bridge coefficient.

The preparation is a valid measure-and-prepare channel with a standard unitary dilation using blank memory and controlled rotations. All outcomes are used. There is no successful-outcome conditioning. Its coarse-graining is the explicitly declared preparation channel.

###### 3.2 Direct clock encoding and constant rank

A Ramsey clock-phase qubit with detuning \(\delta\omega\), conjugated by fixed basis rotations, supplies
\[
|\psi(x_4)\rangle=e^{-ix_4Y/2}|0\rangle
=\cos(x_4/2)|0\rangle+\sin(x_4/2)|1\rangle.
\]
The sensing source is
\[
\rho(x)=\frac{I+r(x)\cdot\sigma}{2}\otimes
|\psi(x_4)\rangle\langle\psi(x_4)|\otimes|0\rangle\langle0|.
\]
Since \(|r(x)|^2\le3/9=1/3<1\), q remains strictly mixed and \(\rho\) has rank exactly two for all x. Its support moves with the clock coordinate. Near zero, \(\partial r_j/\partial x_k=\delta_{jk}\), so the source has exactly the seed's four-dimensional first-order tangent, with a physical coordinate map.

The source model treats controlled paths, Ramsey pulses, force inputs, and clock detuning ideally. Finite trap width, relativistic corrections, pulse errors, phase noise, and calibration uncertainty are not measured or bounded here. They are implementation deviations from the specified ideal source, not an undisclosed claim of hardware exactness. The original R predicate asks for the formal physical construction.

##### 4. Local QFI, the rest-space map, and both physical channels

Let \(P=|0\rangle\langle0|\). At $x=0$,
\[
\rho_0=\frac I2\otimes P\otimes P.
\]
The four derivatives and one valid finite SLD choice are
\[
D_j=\frac{\sigma_j}2\otimes P\otimes P,
\quad L_j=\sigma_j\otimes P\otimes P\quad(j=1,2,3),
\]
\[
D_4=\frac I2\otimes\frac X2\otimes P,
\quad L_4=I\otimes X\otimes P.
\]
Direct multiplication gives \(D_i=(L_i\rho_0+\rho_0L_i)/2\) and
\[
J_{ij}=\tfrac12\operatorname{Tr}\rho_0(L_iL_j+L_jL_i)=\delta_{ij}.
\]
The local tangent \(V\cong\mathbb R^4\) has a positive QFI norm. The scalar path \(x=\vartheta\xi\) has local QFI one for every unit \(\xi\).

The physical spatial channel is exactly
\[
\mathcal T(\rho)=\operatorname{Tr}_{s,v}\rho=\rho_q(r).
\]
Its local QFI is \(J_{\mathrm{sp}}=\operatorname{diag}(1,1,1,0)\). The rest-space isometry is the explicit calibrated map
\[
(v_1,v_2,v_3,0)\longmapsto\sum_{j=1}^3v_j e_j
=\frac{\delta a}{a_*}.
\]
Both spaces have the ordinary positive Euclidean norm at the origin. The clock coordinate has been removed by the actual partial trace. This supplies the required physical QFI/rest-space dictionary.

###### 4.1 Complete eight-label router

Choose two registered active labels, $k=0,1$, of the independent selector \(I_8/8\). On these labels route the sensing $Q$. On the other six labels route the fixed reference \(\rho_0\), using a controlled SWAP, and archive the incoming $Q$. Keep every $k$. The retained state is
\[
\Omega(\rho)=\frac18\sum_{k=0}^{1}|k\rangle\langle k|\otimes\rho
+\frac18\sum_{k=2}^{7}|k\rangle\langle k|\otimes\rho_0.
\]
It is CPTP. Explicit Kraus operators into $\text{flag}\otimes Q$ are \(|k\rangle\otimes I/\sqrt8\) for active $k$ and \(|k\rangle\otimes|a\rangle\langle b|/4\) for inactive $k$, $a$ in the two-dimensional support, $b$ in all eight input states. The sum of all \(K^\dagger K\) is $I$. The controlled-SWAP dilation names where rejected information goes.

Because the flag law is constant, its classical Fisher term is zero. A block SLD is L on each active block and zero on each inactive block. Thus, on all trials,
\[
J_{\mathrm{act}}=\frac14I_4,
\qquad J_{\mathrm{sp,act}}=\frac14\operatorname{diag}(1,1,1,0).
\]
These are actual differential maps of the declared physical channels. In orthonormal metric coordinates \(\Pi_{\mathrm{act}}\) is an isometric embedding scaled by 1/2, and \(\Pi_{\mathrm{sp}}\) is its physical rank-three projection. That representation follows from the density-operator calculation; it is not how the contraction was postulated.

The coefficient 1/4 comes from the eight equally populated router states and its two active ports. It is not the success-normalized QFI. Unequal selector populations would generally change it. The Haar carrier-vector identity is not used as a QFI proof.

###### 4.2 Exact ensemble meaning of the spatial factor

Normalized equal-variance four-dimensional Gaussian samples give the SO(4)-invariant law on \(S^3\), so
\[
\mathbb E\xi_i\xi_j=\delta_{ij}/4.
\]
Consequently, for the same retained-setting ensemble at every stage,
\[
\mathbb E\|\Pi_{\mathrm{act}}\hat X\|^2=\frac14,
\qquad
\mathbb E\|\Pi_{\mathrm{sp}}\Pi_{\mathrm{act}}\hat X\|^2
=\frac14\mathbb E\sum_{j=1}^3\xi_j^2=\frac3{16}.
\]
Their ratio is 3/4. The fourth-coordinate direction is erased and a pure spatial direction is retained by the spatial stage. Therefore there is **no** pointwise scalar 3/4 contraction. The scalar is the stipulated common-ensemble quadratic-form ratio in H.0a/H.3.

For a non-isotropic setting law the value is \(\operatorname{Tr}(P_{\mathrm{sp}}\Sigma)\), not automatically 3/4. A finite spherical second-moment design could reproduce this quadratic average but would not have the full rotational invariance of the source selected here.

##### 5. Two genuinely independent comparison copies, including moving support

The constant-rank source has moving support, so the fixed-support hypothesis stated in H.1b cannot simply be cited. For any finite SLD L satisfying the source equation, direct differentiation gives
\[
\partial_\vartheta(\rho\otimes\rho)=
(\partial_\vartheta\rho)\otimes\rho+\rho\otimes(\partial_\vartheta\rho),
\]
while \(L^{(H.4.2.8f.2)}=L\otimes I+I\otimes L\) satisfies its SLD equation. Taking the trace of the original equation gives \(\operatorname{Tr}\rho L=0\). The cross term in \(\operatorname{Tr}(\rho\otimes\rho)(L^{(H.4.2.8f.2)})^2\) therefore vanishes, and the two diagonal terms add. Thus \(F_Q(\rho^{\otimes2})=2F_Q(\rho)\) for this explicitly finite-SLD moving-support family. The verifier checks the matrix SLD equation and the full \(2I_4\) product Gram at the origin.

For the actual randomized source, define the complete one-module cq experiment
\[
\sigma_\vartheta=\int_{S^3}d\mu(\xi)\,
|\xi\rangle\langle\xi|\otimes
(\operatorname{id}_{k}\otimes\mathcal T)\Omega(\rho(\vartheta\xi)).
\]
The independently drawn setting is retained, so its probability law contributes no score and the conditional QFIs average. Each module has \(F_Q(\sigma_0)=3/16\). The two-module source is the **unconditional product** \(\sigma_\vartheta\otimes\sigma_\vartheta\), including independent settings, selectors, references, and preparation environments. Hence its QFI is 3/8.

This is stronger than merely saying that two outputs are conditionally iid given one shared random setting. Forgetting settings, or using a shared unretained setting, changes the experiment. The complete independent labels remove that ambiguity.

The structural bridge coordinate is registered at \(C_{\mathrm{ch}}=2\varepsilon_0\), so \(w_{\mathrm{cmp}}=2=N_{\mathrm{cmp}}\). We do not infer an actual source capacity, a reset entropy, or a continuous noninteger-repetition theorem from that structural equality.

##### 6. An attained scalar score and the actual acceleration-response signal

For each retained setting let \(v=\xi_{1:3}\), \(r_\xi=\|v\|\). For \(r_\xi>0\), measure $q$ along \(n=v/r_\xi\), retaining \(y=\pm1\); at the measure-zero set \(r_\xi=0\), choose any Pauli measurement and set its score to zero. Let \(A(k)=1\) on $k=0,1$ and zero otherwise.

Conditional on \(\xi\), the complete output law is
\[
p_\vartheta(k,y\mid\xi)=
\begin{cases}
\frac1{16}\left[1+y\,n\cdot r(\vartheta\xi)\right],& A(k)=1,\\
\frac1{16},& A(k)=0.
\end{cases}
\]
Its derivative at zero is \(p'_0=A(k)y r_\xi/16\), and its local score is
\[
Z=\left.\partial_\vartheta\log p_\vartheta\right|_0
=A(k)y r_\xi.
\]
This is the scalar SLD spectral measurement for the retained source at zero. It attains the local scalar QFI for every setting, without any assertion of simultaneous multiparameter attainability.

For the two modules retain the complete record \(\mathcal R\) and compute
\[
S(\mathcal R)=Z_1+Z_2,\qquad W=S^2.
\]
At zero, each y is balanced; flags and copies are independent. Hence
\[
\mathbb E_0[S\mid\xi_1,\xi_2]=0,\qquad
\mathbb E_0[S^2\mid\xi_1,\xi_2]=\frac{r_{\xi_1}^2+r_{\xi_2}^2}{4}.
\]
Averaging the two independent settings gives
\[
\mathbb E_0S^2=\frac38.
\]
More importantly, because \(p'_0(\mathcal R)=p_0(\mathcal R)S(\mathcal R)\),
\[
\left.\frac{d}{d\vartheta}\mathbb E_\vartheta S\right|_0
=\mathbb E_0S^2=\frac38.
\tag{H.4.2.8f.1}
\]
The score function used by the controller is fixed at the operating point, and uses no unknown \(\vartheta\). For the nonlinear sine source, \(\mathbb E_\vartheta S=3\vartheta/8+O(\vartheta^3)\); a globally linear equality is not claimed. Explicitly it is
\[
\mathbb E_\vartheta S
=\frac16\sum_{j=1}^3\mathbb E_\xi[\xi_j\sin(3\vartheta\xi_j)].
\]

The signed record is essential. W alone has zero first-order response at the origin and is not a QFI-preserving replacement for the signed outcomes. W is retained as the independent score-second-moment certificate; **S**, not W, drives the physical response below.

##### 7. One master carrier, its actual 24 modes, and three output channels

Relabel the same elementary basis by the spectator pair \(b=(s,v)\), with q within each block:
\[
|q,00\rangle;\quad|q,01\rangle;\quad|q,10\rangle;\quad|q,11\rangle.
\]
Then \(\rho_0=\operatorname{diag}(I_2/2,0_6)\). For any complex \(6\times2\) matrix B define
\[
K_B=\begin{pmatrix}0&-B^\dagger\\B&0\end{pmatrix},\qquad
\rho(r,B)=e^{K_B}\left(\frac{I+r\cdot\sigma}{2}\oplus0_6\right)e^{-K_B}.
\tag{H.4.2.8f.2}
\]
This is one actual constant-rank preparation/control family. The active-block mixed-state preparation is the same q hardware as in §3; calibrated Hamiltonian pulses \(i\hbar K_B/t_p\) produce the support rotations. The source supplies those pulse generators as controls, rather than inferring their realizability from a metric match.

At the origin, the Bloch directions and support-rotation directions are QFI orthogonal, and
\[
\|d\rho\|_Q^2=|dr|^2+2\operatorname{Tr}(dB^\dagger dB).
\tag{H.4.2.8f.3}
\]
The sensing subfamily lies inside (H.4.2.8f.2): take $r=r(x)$, and $B=x4\,B_0$, where $B_0$ has entries $1/2$ on the two $q$-preserving transitions from $b=00$ to $b=10$ and zero elsewhere. Then its unitary sends \(|q,00\rangle\) to \(\cos(x4/2)|q,00\rangle+\sin(x4/2)|q,10\rangle\), exactly the sensing clock state. Also \(2\operatorname{Tr}B_0^\dagger B_0=1\).

Thus the four-dimensional source and the 24-dimensional orbit chart are subfamilies of one specified 27-dimensional master preparation. They are not identified with each other. In particular the three Bloch directions change eigenvalues, whereas the orbit modes do not.

###### 7.1 Orthogonal mode frame and actual response matrix

Register the three inactive two-dimensional blocks $b=01,10,11$ as groups $j=1,2,3$. For \(u,v\in\{0,1\}\), \(h\in\{0,1\}\), define
\[
B_{\mathrm{jvuh}}=\frac{i^h}{\sqrt2}E_{2(j-1)+v,u},\quad
K_\mu=K_{B_\mu},\quad
D_\mu=[K_\mu,\rho_0],\quad L_\mu=4D_\mu.
\]
There are eight modes in each group and 24 in total. They have
\[
\frac12(L_\mu\rho_0+\rho_0L_\mu)=D_\mu,
\quad
\operatorname{Tr}(D_\mu L_\nu)
=2\operatorname{Re}\operatorname{Tr}(B_\mu^\dagger B_\nu)=\delta_{\mu\nu}.
\tag{H.4.2.8f.4}
\]
Equation (H.4.2.8f.4) proves both the QFI orthogonality and the **measured pulse-to-observable cross-response**:
\[
\left.\partial_\epsilon\operatorname{Tr}\left[
L_\nu e^{\epsilon K_\mu}\rho_0e^{-\epsilon K_\mu}\right]\right|_0
=\delta_{\mu\nu}.
\]
The grouping is physically registered by wiring group $j$ to the observer's $e_{j}$ output port and by using \(Z_j\) in its calibration/readout below. No claim that the inactive label by itself is a spacetime axis is made. The wiring, independently unit-gain calibration, and rest-space triad supply that interpretation.

The group used by the sensing clock subchart can also contain response modes assigned to one spatial output port. This is not contradictory: different controls on the master source have different registered experimental roles, and no coordinate identification between the two tangent charts is assumed. Their causal link is the actual measurement/score/control path in §§6 and 8.

##### 8. Independent generator calibration and an actual linear coupling

For each response slot \(\mu\), independently prepare
\[
C_\mu=\rho_{\mathrm{mix}}=I_8/8,
\qquad G_{\mathrm{disc}}=Z_1+Z_2+Z_3.
\]
The product covariance calculation gives
\[
\operatorname{Tr}(C Z_i)=0,\quad
\operatorname{Tr}(C Z_iZ_j)=\delta_{ij},\quad
\operatorname{Var}_C G_{\mathrm{disc}}=3.
\]
The registered unit-variance amplitude convention is therefore
\[
G_{\mathrm{can}}=G_{\mathrm{disc}}/\sqrt3.
\]
It is independent of the router and of any selected sensing subensemble. The standalone mixed register commutes with G and has zero unitary encoding QFI under G; its variance is not being mislabeled as such QFI. Its observable role is the following actual coupling.

###### 8.1 Signed-score-controlled physical pulse

For mode \(\mu\) in group j, apply
\[
U_\mu(\epsilon,S)=\exp\left(\epsilon S G_{\mathrm{can}}\otimes K_\mu\right)
\]
to \(C_\mu\otimes\rho_0\), then measure
\[
O_\mu=Z_j\otimes L_\mu.
\]
This is a unitary because K is anti-Hermitian. A pulse of duration \(\tau_p\) realizes it with the Hermitian Hamiltonian
\[
H_\mu=\frac{i\hbar\epsilon S}{\tau_p}G_{\mathrm{can}}\otimes K_\mu.
\]
Here \(\epsilon\) is a separate dimensionless pulse-area coordinate and S is a bounded signed measured number, \(|S|\le2\). \(\tau_p\) is measured by the same calibrated clock; H has joules. Coupling to the three C qubits is linear and democratic. Since all C observables commute, this can equivalently be implemented by reading the three independent Z signs and applying their signed sum to the calibrated K pulse, while retaining all signs. No C outcome is postselected.

Taking the derivative of the full density operator gives
\[
\left.\partial_\epsilon\mathbb E[O_\mu\mid S]\right|_0
=S\operatorname{Tr}(C Z_jG_{\mathrm{can}})
  \operatorname{Tr}([K_\mu,\rho_0]L_\mu)
=\frac S{\sqrt3}.
\tag{H.4.2.8f.5}
\]
The factor \(1/\sqrt3\) is a directly measured amplitude gain in this equation. For the same unitary family, its QFI rescales by 1/3 under \(G_{\mathrm{disc}}\mapsto G_{\mathrm{can}}\). The verifier explicitly obtains response-unitary QFIs 3 and 1 for $S=1$; neither is the hybrid amplitude slope.

Combining (H.4.2.8f.1) and (H.4.2.8f.5), the actual acceleration-deformation-to-response susceptibility is
\[
\mathcal R_\mu:=
\left.\partial_\vartheta\partial_\epsilon
\mathbb E_\vartheta[O_\mu]\right|_{\vartheta=\epsilon=0}
=\frac1{\sqrt3}\mathbb E_0S^2
=\frac3{8\sqrt3}.
\tag{H.4.2.8f.6}
\]
This is a mixed linear-response calibration: derivative in the physical acceleration/clock deformation and derivative per unit detector pulse area. It is not the QFI of the calibration register, not an assumed multiplication of two unrelated matrices, and not a new direct gravitational force law.

###### 8.2 Exact finite pulse law and local domain

For a normalized elementary mode,
\[
\operatorname{Tr}\big[L_\mu e^{zK_\mu}\rho_0e^{-zK_\mu}\big]
=\frac{\sin(\sqrt2 z)}{\sqrt2}.
\]
Average over the three independent C signs, retaining all of them in the actual run. With \(a=\sqrt{2/3}\,\epsilon S\),
\[
\mathbb E[O_\mu\mid S]=\frac1{\sqrt2}\sin(a)\cos^2(a).
\tag{H.4.2.8f.7}
\]
This is the same for every \(\mu\). It is odd in S; the symmetric source at \(\vartheta=0\) consequently has zero mean response for every \(\epsilon\). Its first pulse-area derivative is exactly S/\(\sqrt3\).

There is no claim of globally linear finite-pulse behavior. The compact setting sphere, finite outcome alphabets, bound \(|S|\le2\), analytic source probabilities, and finite matrix exponentials give uniform local derivative bounds. Thus the setting/outcome integrals and the two derivatives in (H.4.2.8f.6) may be interchanged. Equation (H.4.2.8f.7) also supplies a falsifiable nonlinear check of the prescribed hardware path.

##### 9. The same 24-to-three response ledger in numerator and denominator

###### 9.1 Same-port baseline

Calibrate every port \(\mu\) with the **same meter state, K pulse, and O readout**, but independently put the controller input to $S=1$ and use the unnormalized \(G_{\mathrm{disc}}\). Its derivative is
\[
b_\mu:=\left.\partial_\epsilon\mathbb E[O_\mu]\right|_0
=\operatorname{Tr}(C Z_jG_{\mathrm{disc}})
 \operatorname{Tr}([K_\mu,\rho_0]L_\mu)=1.
\tag{H.4.2.8f.8}
\]
Equation (H.4.2.8f.4) additionally shows that the response matrix against the other mode observables is diagonal. Unit gain is obtained from the independently specified unit-QFI pulse normalization and the product covariance, not a fit to \(\eta\).

Define the baseline mode capacity of the actual group j by
\[
M_{\mathrm{sp},j}:=\sum_{\mu\in\mathcal G_j}b_\mu=8.
\]
The three groups are mutually QFI orthogonal, have the same eight gains, and exhaust all 24 real orbit controls. Hence
\[
M=24,\qquad M_{\mathrm{sp},j}=M/(D-1)=8.
\]
These are actual measured reference susceptibilities of the modes, as well as their equal orthogonal counts.

###### 9.2 Sensing-driven numerator, with no duplicated information

For the same group define its hybrid bridge response by its actual source-driven susceptibility sum,
\[
F_{\mathrm{grav},j}:=\sum_{\mu\in\mathcal G_j}\mathcal R_\mu.
\]
Using (H.4.2.8f.6) and (H.4.2.8f.8),
\[
F_{\mathrm{grav},j}
=\left[2\cdot\frac14\cdot\frac34\cdot\frac1{\sqrt3}\right]
\underbrace{\sum_{\mu\in\mathcal G_j}b_\mu}_{M_{\mathrm{sp},j}}
=\sqrt3.
\tag{H.4.2.8f.9}
\]
All three channels have identical calibration and ensemble response. The common mode count is not inferred from matching dimensions: the numerator and denominator are indexed by the exact same labeled pulse/readout paths, and equations (H.4.2.8f.5)–(H.4.2.8f.8) prove their same-port gain relation.

The denominator is the mode capacity per comparison slot. Repeating the experiment twice changes the source-score susceptibility, not the set of orthogonal control modes. Dividing by twice the mode capacity would be a different convention from H.0; no hidden second denominator is inserted here.

The same recorded S is permitted to drive the 24 response paths, because they form a classical controlled readout of the one retained source record. This does **not** add their sensing QFIs. Indeed the full retained response state has the cq form
\[
\omega_\vartheta=
\int d\mathcal R\,p_\vartheta(\mathcal R)
|\mathcal R\rangle\langle\mathcal R|\otimes\tau_{\mathcal R},
\]
where \(\tau_{\mathcal R}\) depends only on the record and fixed controls, not directly on \(\vartheta\). Its SLD is \(\partial_\vartheta\log p_\vartheta(\mathcal R)\) times the identity on each response block. Therefore its total \(\vartheta\)-QFI equals the classical FI of the source record, exactly 3/8 at zero. The response bank adds zero conditional \(\vartheta\)-QFI. A response sum and a metrological information sum are distinct ledgers, and H.0 defines the former hybrid construction explicitly.

###### 9.3 Final coefficient

For each physical spatial output channel,
\[
\eta=\frac{F_{\mathrm{grav},j}}{M_{\mathrm{sp},j}}
=2\cdot\frac14\cdot\frac34\cdot\frac1{\sqrt3}
=\frac{\sqrt3}{8}.
\]
Every multiplier now has a source operation and its own independent certificate. The factorization occurs on the registered local, setting-averaged quadratic form, followed by the separately measured amplitude gain. The spatial stage is not promoted to a pointwise scalar map.

<a id="theorem-h428g-physical-population-of-the-eight-factor-records"></a>**Theorem H.4.2.8g (Physical Population of the Eight Factor Records).** The source of Construction H.4.2.8f populates all eight records of Definition H.4.2.8a at its specified local operating point. Its common measured response is $F_{\mathrm{grav},j}=\sqrt3$, its same-port mode denominator is $M_{\mathrm{sp},j}=8$, and $\eta=\sqrt3/8$.

*Proof.*

1. **Dimensionless deformation and H.0–H.0a ledger.** Sections 3–4 give \(x_j=a_j/a_*\), \(x_4=\tau\delta\omega\), \(x=\vartheta\xi\), actual inertial/clock source couplings, positive QFI, and the rest-space isometry. Sections 8–9 identify the H.0 response with measured mixed susceptibilities and a common measured denominator.
2. **Two iid comparison copies at the structural operating point.** Section 5 gives independent full cq copies, including independent retained \(\xi\), selector and preparation systems, with direct finite-SLD moving-support additivity. \(C_{\mathrm{ch}}=2\ln2\) is the registered structural coordinate. No physical reset entropy is inferred from it.
3. **Active-tangent contraction.** Section 4.1 gives the actual CPTP full-flag router, its dilation/archive, Kraus completeness, and QFI \(I_4/4\). All failed routing trials remain in the output law.
4. **Spatial contraction.** Section 4.2 gives the actual partial trace, retained three-axis rest-space map, the same SO(4)-invariant setting ensemble, and the ratio \((3/16)/(1/4)=3/4\). This is explicitly ensemble-level.
5. **Orthogonal equal-channel decomposition.** Sections 7 and 9 prove the 24 real master-carrier modes, I24 QFI/cross-response matrices, three groups of eight, physical channel wiring, and identical baseline calibration. Numerator and denominator use the exact same paths.
6. **Factorized scalar action on successive images.** The local common ensemble passes from norm1 to 1/4 to 3/16; two independent full copies give 3/8; the measured generator gain supplies \(1/\sqrt3\); the eight same-port response gains sum. Equations (H.4.2.8f.1), (H.4.2.8f.5), and (H.4.2.8f.9) identify the result with an actual sequential source/measurement/control experiment.
7. **Independent amplitude convention.** Section 8 uses independent product-mixed registers, covariance I3, variance3, the specified linear Hamiltonian, and the observed Zj–L mode response. The amplitude gain \(1/\sqrt3\) is kept distinct from squared QFI gain1/3; the mixed register's own generator-unitary QFI is zero.
8. **No empirical selection of the coefficient.** The recipe contains no rotation, lensing, or cosmological-acceleration data. All primitive choices are structural counts, independently calibrated units, source preparations, source-induced state probabilities, unit-QFI mode controls, and unit-variance generator convention. The source was knowingly designed within the existing class, not claimed to be universally selected or historically blinded.

The original records are thus supplied for this construction. No genuine original-record gap is being left hidden behind the numerical product. The limitations in §12 are scope limits of the construction, not unpopulated copies of one of these eight records.

$\square$

##### Scope of the physical realization

- **Constructed class, not unique physics.** Other routers, setting ensembles, unit-gain conventions, and source architectures exist. The inherited invariant-law classification already explains why omitted calibrations leave moduli. This construction supplies one member of the specified factor class, not a derivation of that class from symmetry alone.
- **Ideal physical source.** The specified Hamiltonians, pulse controls, source references, archives, and source-state channels define the formal realization. No noise/error budget for a fabricated system has been demonstrated.
- **Local linear response.** QFI $I_4$, the fixed nominal score, and the coefficient are evaluated at zero deformation; the mode response uses the derivative at zero pulse area. The exact sine response displays the finite-amplitude departures.
- **Retained-algebra dependence.** The preparation flags and discarded probes are real named subsystems. Admitting their later recovery changes the experiment and invalidates use of the stated reduced QFIs. Forgetting retained router flags also changes the QFI, to $I_4/16$ in the seed chart, rather than leaving 1/4 intact.
- **No hidden postselection.** Restricting analysis to active labels would give QFI $I_4$, not $I_4/4$. Every routing label and trial is present in the claimed law.
- **No pointwise spatial scalar.** The fourth direction is erased; the three spatial directions are retained. A 3/4 scalar applies only to the same isotropic ensemble.
- **No multiparameter attainability claim.** A registered scalar SLD measurement is explicitly supplied. The four SLDs and the 24 mode observables are not claimed jointly attaining in one simultaneous measurement.
- **No invented metrology copies.** Response meters are parameter-independent conditional on the retained record. Their physical response sum is not added sensing QFI.
- **Independent amplitude versus QFI.** Replacing $G$ by $G/\sqrt3$ changes the measured linear slope by $1/\sqrt3$ and an actual generator-unitary QFI by $1/3$. The separate mixed $C$ register alone has zero encoding QFI.
- **No reusable-cycle thermodynamic theorem.** One-shot state supplies and archives are named. A cyclic reset/work ledger would be additional implementation work; no universal positive heat floor is asserted.
- **No downstream gravity completion.** The adopted scalar acceleration export does not determine a common action, dark susceptibility, galaxy/lensing/cluster kernels, anisotropic stress, cosmological history, or observed gravity. Those are separate questions.
- **Source modifications are testable.** Nonuniform router probabilities replace $1/4$ by their actual active sum; a covariance-anisotropic setting changes the spatial mean; unequal mode gains prevent replacing both response ledgers by a shared eight unless their same-port relation is re-established; correlated comparison sources need a new joint score calculation.

### H.4.3 Bridge-Conditional Numerical Evaluation

Adopt Definition H.0 and use $\Lambda\approx1.1\times10^{-52}\,\mathrm m^{-2}$ and $c=2.998\times10^8\,\mathrm{m\,s^{-1}}$. Then
$$
a_0=c^2\sqrt{\frac{\Lambda}{3}}\approx5.44\times10^{-10}\,\mathrm{m\,s^{-2}},
\tag{H.5}
$$
and, with $\eta'=3/(8\sqrt3)$,
$$
g_0^{\mathrm{branch}}
=
\eta'a_0
=
\frac{c^2\sqrt\Lambda}{8}
\approx1.18\times10^{-10}\,\mathrm{m\,s^{-2}}.
\tag{H.6}
$$
For the empirical central value $g_0^{\mathrm{obs}}\approx1.2\times10^{-10}\,\mathrm{m\,s^{-2}}$,
$$
\frac{g_0^{\mathrm{branch}}}{g_0^{\mathrm{obs}}}\approx0.98.
$$
This is an arithmetic central-value comparison on the adopted bridge-law branch. Identification of $g_0^{\mathrm{branch}}$ with the realized Milgrom scale requires an independent physical-realization certificate.

#### H.4.3.1 Uncertainty Budget

This budget uses the paper-wide Convention P.14.1c. The value of $\eta'$ has no fitted numerical degree of freedom after Definition H.0 and Equation H.4b are adopted, but that adoption is a T2 bridge-law dependency.

**T1 (internal truncation/control):**
The algebraic factors in Equation H.4b are exact inside the adopted bridge law:
- **QFI isotropy average:** exact under Theorem H.1a;
- **structural-ratio arithmetic:** $C_{\mathrm{max}}^*=2\varepsilon_0$ and hence $w_{\mathrm{cmp}}=2$ on the named operating-point branch; the existence of two physical i.i.d. copies is the T2 bridge condition recorded below;
- **dimensional projection:** $(D-1)/D=3/4$ for $D=4$;
- **democratic generator normalization:** $1/\sqrt{K_0}=1/\sqrt{3}$.

The exact algebraic value is $\eta'=\sqrt3/8=0.2165063509\ldots$. Displaying it as $0.2165$ gives relative rounding error $2.9334\times10^{-5}<3\times10^{-5}$; retaining the algebraic value in subsequent calculations avoids that display error. This T1 contribution is negligible at the quoted observational precision.

**T2 (bridge/branch/convention):**
Definition H.0 is the active bridge-law normalization connecting the QFI linear-response coefficient to the galactic acceleration channel. Its T2 data include the structural interpolation $w_{\mathrm{cmp}}(C_{\mathrm{ch}})=C_{\mathrm{ch}}/\varepsilon_0$ and the registered two-copy i.i.d. realization at $C_{\mathrm{ch}}=C_{\mathrm{max}}^*=2\varepsilon_0$. Conditional on those entries,
$$
\eta'=\frac{3}{8\sqrt3}.
$$
Thus the T2 status dependency is present, but its numerical uncertainty is zero inside the adopted bridge law. Alternative slot interpolations or implementations without the registered two-copy realization are different T2 branches, not variations of a fitted parameter.

**T3 (empirical/model mapping):**
The comparison uses either the observational hybrid cosmological-input convention or the Appendix U branch value selected for forward evaluation. For the declared diagonal propagation,
$$
\Lambda = \frac{3\Omega_\Lambda H_0^2}{c^2},
$$
and Appendix V reports
$$
(\Lambda L_P^2)_{\mathrm{obs}}=(2.86599\pm0.04849)\times10^{-122}.
$$
The fractional value $0.0169$ is the diagonal marginal-input propagation for $\Lambda$, not a covariance-aware joint Planck credible interval.

Since $g_0\propto\sqrt{\Lambda}$,
$$
\frac{\delta g_0}{g_0}=\frac12\frac{\delta\Lambda}{\Lambda}.
$$
The corresponding diagonal $1\sigma$ propagation is $\delta g_0/g_0=0.0085$; twice that value is $0.0169$, giving $\delta g_0\approx0.02\times10^{-10}\,\mathrm{m/s^2}$ for $g_0\approx1.18\times10^{-10}\,\mathrm{m/s^2}$. These are sensitivity bands under the declared input convention.

The empirical $g_0$ inferred from galaxy data has systematic uncertainties at the tens-of-percent level, dominated by astrophysical systematics and calibration choices (McGaugh et al. 2016; Lelli et al. 2017).

**Technical factor table:**

| Source | Category | Magnitude | Type |
|--------|----------|-----------|------|
| $\eta'$ algebra after Definition H.0 / Equation H.4b | T1 | $<0.01\%$ | internal rounding / truncation negligible |
| Definition H.0 + operating-point normalization | T2 | $0$ inside the adopted branch | bridge-normalization status dependency |
| $\Lambda$ input (Eq. V.5) | T3 | $1.7\%$ in $g_0$ at $2\sigma$ | observational propagation |
| Empirical $g_0$ extraction | T3 | order $20\%$ | astrophysical systematic |

The approximately $2\%$ central-value difference is within the quoted empirical systematic uncertainty.

<a id="remark-h1"></a>**Remark H.1.** Writing $H_\Lambda=c\sqrt{\Lambda/3}$ gives $a_0=cH_\Lambda$. On the adopted Definition H.0 branch, $g_0^{\mathrm{branch}}=\eta'cH_\Lambda$ with $\eta'=3/(8\sqrt3)$. This supplies a candidate acceleration--vacuum relation; no realized galactic connection follows without an independently accepted observable and response certificate.

<a id="remark-h2-factor-ledger"></a>**Remark H.2 (Factor ledger).** Equation (H.4b) follows on the factor-certified bridge-law class of Definition H.4.2.8a by multiplying $a/d_0$, $w_{\mathrm{cmp}}(C_{\mathrm{ch}})$, $(D-1)/D$, and $1/\sqrt{K_0}$, with $w_{\mathrm{cmp}}=N_{\mathrm{cmp}}=2$ on the registered operating-point branch. Theorem H.1b supplies QFI additivity for the two-copy realization, Theorem H.1c supplies the product-mixed-register amplitude normalization, and Theorem H.3 supplies multiplication under factorized scalar action. Theorems H.1a and H.2 establish the corresponding Haar-vector and Euclidean-projection identities but do not replace the active- and spatial-tangent contraction certificates. Together with Proposition H.1, the complete factor-certified record yields $g_0$ via Equations (H.4)–(H.6) with no additional fitted numerical parameter inside that branch.

<a id="remark-h3-shared-geometric-input"></a>**Remark H.3 (Shared geometric input).** The attractor geometry $\mathrm{Gr}(2,8)$ supplies the rank data $a=2$ and $d_0=8$ and determines the QFI spectrum used in Appendix Z; it also enters the electroweak matching analysis in Appendix T. The structural comparison weight, the value $D=4$, the register count $K_0=3$, the two tangent-contraction certificates, the equal-channel decomposition, and the generator-amplitude convention are separate inputs to Equation (H.4b).

<a id="remark-h4-operating-point-universality"></a>**Remark H.4 (Operating Point Universality).** If a system operates near the PCE-optimal structural capacity $C_{\mathrm{ch}}=C_{\mathrm{max}}^*=2\varepsilon_0$ (Appendix Q, Equation Q.10), remains in the factor-certified class $\mathcal B_H$ of Definition H.4.2.8a, and retains the same non-$C_{\mathrm{ch}}$ contraction, equal-channel, factorization, and amplitude records, then Equation (H.4a) fixes $\eta'$ near its attractor value. On that common branch, $g_0$ is approximately universal across such systems.

<a id="corollary-h1-bridge-conditional-galactic-scale-and-cosmological-acceleration-lock"></a>**Corollary H.1 (Bridge-Conditional Galactic Scale and Cosmological Acceleration Lock).**
Under Proposition H.1, Definition H.0, and Equation H.4b, the acceleration scale entering the Appendix I galaxy-sector model is fixed by
$$
g_0=\eta'c^2\sqrt{\frac{\Lambda}{3}},
\qquad
\eta'=\frac{3}{8\sqrt3}.
$$
Equivalently,
$$
\boxed{
g_0=\frac{c^2\sqrt{\Lambda}}{8}
}
\tag{H.6c}
$$
or
$$
8g_0=c^2\sqrt{\Lambda}.
$$
Thus $g_0=(1.18\pm0.02)\times10^{-10}$ m/s$^2$ when the $2\sigma$ observational uncertainty in $(\Lambda L_P^2)_{\mathrm{obs}}$ from Appendix V is propagated through $g_0\propto\sqrt{\Lambda}$. There is no fitted numerical parameter in this calculation once the bridge law and the Equation H.4b operating-point normalization are adopted. The status label is conditional theorem / bridge normalization because Definition H.0 is the active bridge assumption. Observational systematics in $g_0^{\text{obs}}$ dominate at order $20\%$.

*Proof.* Proposition H.1 gives
$$
a_0=c^2\sqrt{\frac{\Lambda}{3}}.
$$
Equation H.4b gives
$$
\eta'=\frac{3}{8\sqrt3}.
$$
Therefore
$$
g_0
=
\eta'a_0
=
\frac{3}{8\sqrt3}c^2\frac{\sqrt{\Lambda}}{\sqrt3}
=
\frac{c^2\sqrt{\Lambda}}{8}.
$$
The uncertainty propagation follows from
$$
\frac{\delta g_0}{g_0}
=
\frac12\frac{\delta\Lambda}{\Lambda},
$$
already established in Section H.4.3.1. Since neither $\eta'$ nor the factor $1/8$ is chosen from galaxy data on this branch, the acceleration scale is locked to $\Lambda$ once the bridge normalization is fixed. ∎

<a id="corollary-h1a-critical-baryonic-surface-density-scale"></a>**Corollary H.1a (Critical Baryonic Surface-Density Scale).**
For an infinite thin baryonic sheet with surface density $\Sigma_b$, the magnitude of the one-sided Newtonian field normal to the sheet is $g_N = 2\pi G\Sigma_b$. The crossover to the low-acceleration galactic regime occurs when $g_N = g_0$. Hence the characteristic baryonic surface-density scale is
$$
\Sigma_\dagger := \frac{g_0}{2\pi G}.
\tag{H.6a}
$$
On the acceleration-lock representative this is equivalently
$$
\boxed{
\Sigma_\dagger
=
\frac{c^2\sqrt{\Lambda}}{16\pi G}
}
\tag{H.6b}
$$
or
$$
16\pi G\Sigma_\dagger=c^2\sqrt{\Lambda}.
$$
Using the higher-precision central value $g_0=1.17674\times10^{-10}\,\mathrm{m\,s^{-2}}$ implied by Equations (V.4)–(V.5) under the Appendix V hybrid diagonal-input convention,
$$
\Sigma_\dagger
= \frac{1.17674\times 10^{-10}\,\mathrm{m\,s^{-2}}}{2\pi\cdot 6.67430\times 10^{-11}\,\mathrm{m^3\,kg^{-1}\,s^{-2}}}
= (0.2806 \pm 0.0047)\,\mathrm{kg\,m^{-2}}
= (134.4 \pm 2.3)\,M_\odot\,\mathrm{pc^{-2}}.
\tag{H.6d}
$$
Here $M_\odot=1.98841\times10^{30}\,\mathrm{kg}$ and $1\,\mathrm{pc}=3.0857\times10^{16}\,\mathrm{m}$. The displayed uncertainties are twice the diagonal marginal-input propagation used in Section H.4.3.1; they are not a covariance-aware joint Planck credible interval:
$$
\frac{\delta\Sigma_\dagger}{\Sigma_\dagger}
=\frac{\delta g_0}{g_0}=0.0169.
$$
The three-significant-figure value $g_0\approx1.18\times10^{-10}\,\mathrm{m\,s^{-2}}$ elsewhere is the rounded display of the same central value. Uncertainties in $G$ and the unit-conversion constants are negligible at the displayed precision.

*Proof.* For an infinite thin sheet, Gauss's law gives $g_N = 2\pi G\Sigma_b$. Setting $g_N=g_0$ defines the transition scale, so $\Sigma_\dagger=g_0/(2\pi G)$. Substituting Corollary H.1 gives
$$
\Sigma_\dagger
=
\frac{1}{2\pi G}\frac{c^2\sqrt{\Lambda}}{8}
=
\frac{c^2\sqrt{\Lambda}}{16\pi G}.
$$
The numerical value follows by inserting Equation H.6. ∎

<a id="remark-h1a1"></a>**Remark H.1a.1.** The quantity $\Sigma_\dagger$ is a conditional PU output fixed by the acceleration-lock bridge once $\Lambda$ and the thin-sheet crossover mapping are specified.

<a id="remark-h1a2-cosmological-input-dependence-of-the-acceleration-lock"></a>**Remark H.1a.2 (Cosmological-Input Dependence of the Acceleration Lock).** The observational-input evaluations of $g_0$, $\Sigma_\dagger$, $A_{\mathrm{eff}}^{(\mathrm{obs})}$, and $A_{\mathrm{eff}}^{(\mathrm{obs},4)}$ use the Appendix V hybrid diagonal-input convention formed from the rounded Planck 2018 base-$\Lambda$CDM marginals in Equations (V.4)–(V.5),
$$
H_0=67.4\pm0.5\,\mathrm{km\,s^{-1}\,Mpc^{-1}},
\qquad
\Omega_\Lambda=0.6889\pm0.0056
$$
(Planck Collaboration 2020a). These inputs are not treated as a covariance-aware joint Planck posterior. Their numerical values inherit the declared diagonal convention; the exact bridge relation remains
$$
16\pi G\Sigma_\dagger=c^2\sqrt{\Lambda}.
$$
As a sensitivity calculation, replace the Planck value of $H_0$ by
$$
H_0=73.04\pm1.04\,\mathrm{km\,s^{-1}\,Mpc^{-1}}
$$
(Riess et al. 2022), retain the Planck value and uncertainty for $\Omega_\Lambda$, and treat the quoted uncertainties as independent. Then
$$
\frac{\Lambda(H_0=73.04,\Omega_\Lambda=0.6889)}{\Lambda(H_0=67.4,\Omega_\Lambda=0.6889)}
=\left(\frac{73.04}{67.4}\right)^2
=1.17436,
$$
$$
g_0=(1.2752\pm0.0378)\times10^{-10}\,\mathrm{m\,s^{-2}},
\qquad
\Sigma_\dagger=(145.6\pm4.3)\,M_\odot\,\mathrm{pc^{-2}},
$$
where both displayed bands are twice the declared diagonal marginal-input propagation. This substitution is a one-parameter sensitivity calculation, not an independent joint cosmological fit, and the two displayed input choices are not exhaustive. A direct cosmological test of the acceleration-lock relation must combine an external cosmological posterior for $\Lambda$ with an independent galactic likelihood and reject $16\pi G\Sigma_\dagger=c^2\sqrt{\Lambda}$ after the cosmological, astrophysical, geometry, and bridge-law uncertainties are jointly propagated. Excluding only the two illustrative windows does not by itself falsify that relation. Independent inconsistency between $g_0$ and $\Sigma_\dagger$ through $\Sigma_\dagger=g_0/(2\pi G)$ remains a separate falsifier of the thin-sheet crossover mapping in Corollary H.1a.

<a id="corollary-h1a3-common-static-action-cross-lock"></a>**Corollary H.1a.3 (Common Static Action Cross-Lock).** Consider a Definition I.13c.1 branch with the registered clock exponent $3/2$, rate modulus $\beta_\chi=1$, amplitude $A_G\le A_{\mathrm{crit}}(3/2)$ of (I.13c.5.2), and the acceleration value $g_\Lambda=g_0=c^2\sqrt\Lambda/8$ of Corollary H.4.2.8c. The static action (I.13c.5.4) of Theorem I.13c.5 then gives, with one parameter set for every source, the point-mass transition radius $L_0(M_b)=\sqrt{GM_b/g_0}$ and a thin-sheet transition at the surface density $\Sigma_\dagger$ of (H.6a), and
$$
16\pi G\Sigma_\dagger=c^2\sqrt\Lambda,
\qquad
M_b=2\pi\Sigma_\dagger L_0(M_b)^2\quad(M_b>0).
\tag{H.6f}
$$
For a general rate modulus the same action gives the sheet transition $\Sigma_\times=\beta_\chi g_0/(2\pi G)$ and $M_b=2\pi\Sigma_\times L_0(M_b)^2$; the second relation therefore holds for every $\beta_\chi$, while identification of $\Sigma_\times$ with $\Sigma_\dagger$ uses $\beta_\chi=1$.

*Proof.* Theorem I.13c.5, item 3, applies because $A_G\le A_{\mathrm{crit}}(3/2)$. It gives, on one action, the sheet transition $\Sigma_\times=a_\chi/(2\pi G)$ and $L_0(M_b)^2=GM_b/a_\chi$ for every $M_b$, with $a_\chi=\beta_\chi g_\Lambda$. With $\beta_\chi=1$ and $g_\Lambda=g_0$, $\Sigma_\times=g_0/(2\pi G)=\Sigma_\dagger$ by (H.6a), and (H.6b) gives the first relation in (H.6f). Eliminating $a_\chi$ between the two transition formulas gives the second relation for every $\beta_\chi$. ∎

<a id="corollary-h1b-redshift-lock-on-the-constant-lambda-branch"></a>**Corollary H.1b (Redshift Lock on the Constant-$\Lambda$ Branch).**
Let $Z$ be a redshift domain containing $0$, with $\Lambda_{\mathrm{eff}}(z)>0$ for every $z\in Z$. At each $z$, assume the complete detector, relaxation and bridge certificates of Proposition H.1 and Corollary H.1, with the same factor normalization and with vacuum-curvature value $\Lambda_{\mathrm{eff}}(z)$. Then the certified bridge acceleration scale is
$$
g_0(z)
=
\frac{c^2}{8}\sqrt{\Lambda_{\mathrm{eff}}(z)},
$$
and hence
$$
\frac{g_0(z)}{g_0(0)}
=
\sqrt{
\frac{\Lambda_{\mathrm{eff}}(z)}
{\Lambda_{\mathrm{eff}}(0)}
}.
\tag{H.6e}
$$
On the strict constant-$\Lambda$ branch,
$$
g_0(z)=g_0(0).
$$
Therefore the Appendix H bridge representative is a $\sqrt{\Lambda}$-locked acceleration scale, not an $H(z)$-locked acceleration scale.

*Proof.* Apply Corollary H.1 at redshift $z$ with $\Lambda$ replaced by the branch value $\Lambda_{\mathrm{eff}}(z)$:
$$
g_0(z)=c^2\sqrt{\Lambda_{\mathrm{eff}}(z)}/8.
$$
Taking the ratio with the $z=0$ value cancels $c^2/8$ and gives Equation H.6e. If $\Lambda_{\mathrm{eff}}(z)$ is constant, the ratio is $1$. Since $H(z)^2$ includes matter, radiation, curvature, and vacuum contributions on a general FLRW branch, while Equation H.6e uses only the vacuum-curvature term, the lock is to $\Lambda_{\mathrm{eff}}(z)$ rather than to the full Hubble rate. ∎

### H.4.4 Per-Channel Normalization: The Factor of 3

A common normalization error is to divide by the total interface modes $M = 24$ rather than the per-spatial-channel modes $M_{\mathrm{sp}} = 8$.

<a id="theorem-h5-per-channel-normalization-on-an-equal-channel-decomposition"></a>**Theorem H.5 (Per-Channel Normalization on an Equal-Channel Decomposition).**
Assume the $M$-dimensional interface-mode space decomposes as an orthogonal direct sum of $D-1$ spatial-channel subspaces of equal dimension. Then
$$
M_{\mathrm{sp}}=\frac{M}{D-1}.
$$
For $M=24$ and $D=4$, $M_{\mathrm{sp}}=8$.

<a id="remark-h51-sector-dependent-mode-count-selection"></a>**Remark H.5.1 (Sector-Dependent Mode-Count Selection).** On this equal-channel branch, the gravitational denominator is $M_{\mathrm{sp}}=8$. The counts $M=24$ and $k=12$ belong to the spacetime/channel-matching and gauge/code ledgers, respectively, and are not substituted for $M_{\mathrm{sp}}$ in Definition H.0.

*Proof.* If
$$
\mathcal H_{\mathrm{mode}}
=\bigoplus_{j=1}^{D-1}\mathcal H_j,
\qquad
\dim\mathcal H_j=M_{\mathrm{sp}}
$$
with equal dimensions, then
$$
M=\dim\mathcal H_{\mathrm{mode}}
=\sum_{j=1}^{D-1}\dim\mathcal H_j
=(D-1)M_{\mathrm{sp}}.
$$
Thus $M_{\mathrm{sp}}=M/(D-1)=8$. Cancellation of this count in the bridge response is then the explicit per-channel normalization of Definition H.0. ∎

**Why This Matters:** Normalizing by $M = 24$ instead of $M_{\mathrm{sp}} = 8$ gives $\eta' = \sqrt{3}/24 \approx 0.072$ instead of the correct $\eta' = \sqrt{3}/8 \approx 0.217$—off by exactly a factor of 3.

The physical interpretation: $\eta'$ is not "fraction of the total QFI resource of the universe" but rather a **dimensionless susceptibility per spatial acceleration channel**.

### H.4.6 Higher-Order Corrections: Curvature and the Van Vleck-Morette Expansion

The bridge class of Section H.4.2 gives $\eta'=3/(8\sqrt3)$ at its registered operating point. Theorem H.4 does not exclude curvature dependence from a quadratic response: that exclusion requires an additional locality convention for the chosen bridge. Environmental changes, finite parameter shifts and geodesic focusing may require further response data.

**Effective Curvature on the Democratic Visible-Response Branch.** The symmetric-space geometry of $\mathrm{Gr}(2,8)$ gives $K_{\mathrm{avg}}^{\mathrm{Bures}}=32/23$. On the additional democratic visible-response branch $L_{\mathrm{vis}}=1/(ad_0)$ of Theorem Z.24 and Corollary Z.11,
$$
K_{\mathrm{eff}} = K_{\mathrm{avg}}^{\mathrm{Bures}} \cdot \frac{M-1}{ad_0} = \frac{32}{23} \cdot \frac{23}{16} = 2.
\tag{H.11}
$$

The factor $L_{\mathrm{vis}}=1/(ad_0)$ is a response-model input. Lemma Z.24a establishes that it does not follow from symmetric-space isotropy.

**Van Vleck-Morette Expansion.** For the transverse Jacobi-mode focusing used in the Van Vleck-Morette construction (DeWitt and Brehme 1960), assume that the registered mode obeys $j''(t)+Kj(t)=0$ with constant $K>0$, $j(0)=0$ and $j'(0)=1$. Then $j(t)=\sin(\sqrt Kt)/\sqrt K$. Set $x=\sqrt Kt$, and extend $t/j(t)$ continuously to $1$ at $t=0$. For $|x|<\pi$,
$$
\ln\left(\frac{\sqrt{K}t}{\sin(\sqrt{K}t)}\right)
= \frac{Kt^2}{6}+\frac{K^2t^4}{180}+R_6(K,t),
\qquad |R_6(K,t)|\le C_r K^3|t|^6
\tag{H.18}
$$
for every $0<r<\pi$ and all $|\sqrt Kt|\le r$. Indeed, $f(x)=\ln(x/\sin x)$ extends to an even analytic function on $(-\pi,\pi)$, and $\sin x/x=1-x^2/6+x^4/120+O(x^6)$ gives $f(x)=x^2/6+x^4/180+O(x^6)$. Taylor's theorem gives the displayed bound with $C_r=\max_{|x|\le r}|f^{(6)}(x)|/6!<\infty$. This is a single-mode statement. Its use in a full determinant requires the mode spectrum and multiplicities; identifying its constant $K$ with $K_{\mathrm{eff}}$ requires a separate mode certificate.

The quartic term and $R_6$ have zero quadratic coefficient at $t=0$, but the leading focusing coefficient is $K/6$ and already depends on curvature. Equation H.18 therefore does not exclude an additional curvature-dependent quadratic response. The value of $\eta'$ follows from the declared bridge law and any adopted locality convention.

**Conditional environmental interpolation.** Off-operating-point behavior may be modeled at leading order by evaluating the T2 bridge interpolation $w_{\mathrm{cmp}}(C_{\mathrm{ch}})=C_{\mathrm{ch}}/\varepsilon_0$ at $C_{\mathrm{ch}}\neq C_{\mathrm{max}}^*$. Equation H.18 supplies finite-deviation terms only on its certified constant-curvature mode branch. Fractional values of $w_{\mathrm{cmp}}$ are susceptibility weights, not fractional physical reset or sample counts.

### H.4.7 Conditional Environmental Bridge Benchmarks

For systems assigned an off-operating structural weight, the following values are conditional interpolation benchmarks rather than consequences of the integer-copy QFI theorem.

**Void-galaxy benchmark.** If a branch assigns $C_{\mathrm{ch},\mathrm{void}}=\varepsilon_0$, so $w_{\mathrm{cmp}}=1$:
$$
\eta'_{\mathrm{void}} = 1 \times \frac{1}{4} \times \frac{3}{4} \times \frac{1}{\sqrt{3}} \approx 0.108, \quad g_{0,\mathrm{void}} \approx 5.9 \times 10^{-11}\,\mathrm{m/s^2}
\tag{H.27}
$$

The ratio to the registered operating-point branch is $g_{0,\mathrm{void}}/g_0 \approx 0.50$.

*Conditional observable:* A smaller $g_0$ gives no greater gravitational enhancement at the same baryonic field only on an independently registered response branch whose enhancement is nondecreasing in $g_0$. The interpolation benchmark alone does not determine a void galaxy's dynamics.

**Ultra-diffuse-galaxy benchmark.** If a branch assigns $C_{\mathrm{ch},\mathrm{UDG}}=\varepsilon_0/2$, so $w_{\mathrm{cmp}}=0.5$:
$$
\eta'_{\mathrm{UDG}} = 0.5 \times \frac{1}{4} \times \frac{3}{4} \times \frac{1}{\sqrt{3}} \approx 0.054, \quad g_{0,\mathrm{UDG}} \approx 2.9 \times 10^{-11}\,\mathrm{m/s^2}
\tag{H.28}
$$

*Conditional observable:* Whether this interpolation produces nearly Newtonian dynamics to larger radii depends on an independently registered gravitational response kernel and baryonic profile. Some ultra-diffuse galaxies have been reported to be "dark matter deficient" (e.g., DF2) (van Dokkum et al. 2018); such observations test a weight selected independently before comparison.

Determining $C_{\mathrm{ch}}$ for a specific system requires an independently specified operational bridge from the system to its structural per-cycle information budget in the sense of Appendix Q. Once that T2 bridge is fixed, Equations (H.4a) and (H.27)–(H.28) give the corresponding conditional $g_0(C_{\mathrm{ch}})$.

<a id="theorem-h47a-finite-environmental-interpolation-identifiability"></a>**Theorem H.4.7a (Finite Environmental-Interpolation Identifiability).** Let $E$ be a finite environment set and let $z:E\to\mathbb R^p$ be a target-clean structural feature selected independently of gravitational response data. Consider real affine candidates
$$
C_{\mathrm{ch},\theta}(e)=\theta_0+\sum_{j=1}^p\theta_jz_j(e),
\qquad
r(e):=(1,z(e))\in\mathbb R^{p+1}.
\tag{H.4.7a.1}
$$
If training environments $e_1,\ldots,e_m$ supply exact values $y_k$, write $A_{k\bullet}=r(e_k)$ and $y=(y_k)$. Provided $A\theta=y$ is consistent, all solutions in the unrestricted coefficient space $\mathbb R^{p+1}$ form
$$
\theta_*+\ker A.
\tag{H.4.7a.2}
$$
On this unrestricted affine set, the untouched prediction at $e\in E$ is unique exactly when
$$
r(e)\in\operatorname{row}(A).
\tag{H.4.7a.3}
$$
When this holds, any $u$ satisfying $A^{\mathsf T}u=r(e)$ gives $C_{\mathrm{ch},\theta}(e)=u^{\mathsf T}y$. To interpret the candidates as nonnegative capacities, restrict to the nonempty set
$$
\Theta_y=\{\theta:A\theta=y,\ r(f)\theta\ge0\text{ for every }f\in E\}.
$$
On this set the exact uniqueness condition is
$$
r(e)v=0
\quad\text{for every }v\in
\operatorname{span}\{\theta-\theta':\theta,\theta'\in\Theta_y\}.
$$
Condition (H.4.7a.3) remains sufficient. It is also necessary if $\Theta_y$ contains a coefficient vector with strictly positive capacities at every $f\in E$; boundary fibers can have additional unique predictions. Further registered capacity constraints require the same feasible-difference test on their actual nonempty feasible set.

For the positive bridge constants of Definition H.0 and $\Lambda>0$, the algebraic predictions
$$
\eta_\theta(e)=
\frac{C_{\mathrm{ch},\theta}(e)}{\varepsilon_0}
\left(\frac{a}{d_0}\right)
\left(\frac{D-1}{D}\right)
\frac1{\sqrt{K_0}},
\qquad
g_\theta(e)=\eta_\theta(e)c^2\sqrt{\frac\Lambda3}
\tag{H.4.7a.4}
$$
inherit the uniqueness classification of the same candidate set. Realizing a capacity and a gravitational response requires their independent operational certificates. No response datum may be inserted into $z$ without changing the target-clean premise.

*Proof.* Equation (H.4.7a.2) is the general solution of a consistent finite linear system. The functional $r(e)\theta$ is constant on that set exactly when $r(e)$ annihilates $\ker A$, equivalently when $r(e)\in\operatorname{row}(A)$. If $r(e)=A^{\mathsf T}u$, then $r(e)\theta=u^{\mathsf T}A\theta=u^{\mathsf T}y$. If the row-span condition fails, there is $v\in\ker A$ with $r(e)v\ne0$, so $\theta_*$ and $\theta_*+v$ have different predictions. On any nonempty restricted set, equality of all predictions is exactly annihilation of every feasible difference and hence of their span. If $\theta^\circ\in\Theta_y$ has strictly positive capacities, finiteness of $E$ permits $\epsilon>0$ small enough that both $\theta^\circ\pm\epsilon v$ remain nonnegative at every environment. They have the same training values and different predictions, proving necessity on that interior branch. Finally, the multipliers in (H.4.7a.4) are positive and independent of $\theta$, so they preserve equality and inequality of predictions. ∎

<a id="theorem-h47b-nonlinear-environmental-bridge-identifiability"></a>**Theorem H.4.7b (Nonlinear Environmental-Bridge Identifiability).** Keep the finite environment set $E$ and the target-clean premise of Theorem H.4.7a.

1. For target-clean feature maps $\psi_1,\ldots,\psi_q:E\to\mathbb R$ and candidates $C_{\mathrm{ch},\theta}(e)=\sum_j\theta_j\psi_j(e)$, every statement of Theorem H.4.7a holds with $r(e)=(\psi_1(e),\ldots,\psi_q(e))$. This covers polynomial, spline and every other environmental bridge that is linear in its coefficients.

2. Let $s:E\to\mathbb R$ be a target-clean structural index and let the candidates be $C_{\mathrm{ch}}(e)=\varphi(s(e))$ with $\varphi:s(E)\to[0,\infty)$ nondecreasing and otherwise arbitrary. Training environments $e_1,\ldots,e_m$ with $s_k=s(e_k)$ supply exact values $y_k\ge0$. The data are consistent exactly when $s_k<s_l$ implies $y_k\le y_l$ and $s_k=s_l$ implies $y_k=y_l$. For consistent data, the set of predictions at $e\in E$ is exactly
$$
[\ell(e),u(e)]\cap\mathbb R,
\qquad
\ell(e)=\max\bigl(\{0\}\cup\{y_k:s_k\le s(e)\}\bigr),
\qquad
u(e)=\min\{y_k:s_k\ge s(e)\},
\tag{H.4.7b.1}
$$
with $\min\varnothing=+\infty$. The prediction is unique exactly when $\ell(e)=u(e)$: always at a training index value; never above the largest training index value; below the smallest training index value exactly when the value there is $0$; and between consecutive training index values $s_-<s(e)<s_+$ exactly when the two bracketing values coincide.

3. If $\varphi$ is required to be strictly increasing on $s(E)$, no environment whose index is not a training index value has a unique prediction.

4. Through the positive $\theta$-independent multipliers of (H.4.7a.4), the predictions of $\eta_\theta$ and $g_\theta$ inherit the classifications of items 1--3.

*Proof.* Item 1 holds because the proof of Theorem H.4.7a uses only linearity of the candidate in its coefficient vector. For item 2, a nondecreasing $\varphi$ forces the stated order conditions. Conversely, $\varphi_-(\sigma):=\max(\{0\}\cup\{y_k:s_k\le\sigma\})$ is nondecreasing and nonnegative, and consistency gives $\varphi_-(s_k)=y_k$. Monotonicity and nonnegativity give $\ell(e)\le\varphi(s(e))\le u(e)$ for every consistent $\varphi$. For real $v\in[\ell(e),u(e)]$, set $\varphi_v(\sigma)=\varphi_-(\sigma)$ for $\sigma<s(e)$ and $\varphi_v(\sigma)=\max\{\varphi_-(\sigma),v\}$ for $\sigma\ge s(e)$. This function is nondecreasing and nonnegative, equals $v$ at $s(e)$ because $\varphi_-(s(e))=\ell(e)\le v$, and equals $y_k$ at every training index: directly when $s_k<s(e)$, and because $v\le u(e)\le y_k$ when $s_k\ge s(e)$. This proves (H.4.7b.1), and the uniqueness cases read off $\ell(e)=u(e)$. For item 3, given a consistent strictly increasing $\varphi$ and an untouched index value $s(e)$, the value $\varphi(s(e))$ lies in the nondegenerate interval bounded by the neighboring values of $\varphi$ on $s(E)$, with lower bound $0$ attainable when $s(e)$ is the smallest index value and no upper bound when it is the largest; replacing $\varphi(s(e))$ by another value of that interval keeps strict monotonicity, nonnegativity and every training value. Item 4 follows as in Theorem H.4.7a. ∎

### H.4.7c Exact nonlinear exposure families and their structural source map

The positive latent-exposure family of Theorem I.13s has an exact inverse classification at every finite collection of environments, with no bound on the latent rank. The classification retains the open support domain, every equality case and all joint untouched predictions. Its structural coordinate is the actual capacity of the independently prepared erasure channel.

<a id="theorem-h47c"></a>

<a id="theorem-h47c-all-rank-finite-exposure-prediction-classification"></a>**Theorem H.4.7c (All-rank finite-exposure prediction classification).** Fix an integer $d\ge1$ and a finite set $Q\subset\mathbb N_0^d$ of distinct exposure vectors containing $0$. Write $s=|Q|$. A candidate is any finite positive probability law

$$
 \mu=\sum_{j=1}^{r}\pi_j\delta_{t_j},\qquad
 r\ge1,\quad \pi_j>0,\quad \sum_j\pi_j=1,\quad
 t_j\in(0,1)^d,
$$

with exposure response

$$
 m_\mu(q)=\sum_{j=1}^{r}\pi_jt_j^q,
 \qquad t_j^q=\prod_{l=1}^dt_{jl}^{q_l}.
 \tag{H.4.7c.1}
$$

Partition $Q\setminus\{0\}$ into a training set $T$ and a set $U$ of untouched exposures. Training values $y_q$ are obtained from the structural survival channel, independently of the gravitational response. The following conclusions hold.

1. **Finite exact description for all ranks.** The full moment set on $Q$ consists exactly of the vectors $z$ satisfying

$$
 \begin{split}
 &\exists(\lambda_j)_{j=1}^s,\ (\tau_{jl})_{1\le j\le s,1\le l\le d}:\\
 &\lambda_j\ge0,\qquad \sum_{j=1}^{s}\lambda_j=1,
       \qquad 0<\tau_{jl}<1,\\
 &z_0=1,\qquad
 z_q=\sum_{j=1}^{s}\lambda_j\prod_{l=1}^{d}\tau_{jl}^{q_l}
       \quad(q\in Q\setminus\{0\}).
 \end{split}
 \tag{H.4.7c.2}
$$

Zero weights are deleted and equal atoms are merged when reading a positive law from this formula. Thus every feasible vector has a witness with at most $s$ distinct positive atoms. This bound is independent of the rank of any other source producing that vector.

2. **Joint predictions and complete decisions.** Substitute $z_q=y_q$ for $q\in T$ in (H.4.7c.2). The remaining $z_U$ form exactly the joint prediction set $P_Q(y)$. It is a bounded convex semialgebraic set and may have open boundary faces. For algebraic training values, real quantifier elimination and real algebraic cell decomposition terminate and return its exact description, its emptiness decision, its dimension and every individual prediction interval with its endpoint-attainment flags. They decide whether the complete untouched vector is unique and whether any specified individual prediction is unique. Algebraic feasible prediction vectors have algebraic positive-law witnesses, obtainable by algebraic sample-point extraction. Replacing the training equalities by finitely many polynomial equalities or inequalities with algebraic coefficients gives the same exact semialgebraic classification and decisions. For that extension each individual projection is a finite union of points and intervals; it is a single interval when the retained training constraints are convex.

3. **All-rank sharp one-dimensional case.** For $d=1$ and $Q=\{0,1,2\}$, a training value $m(1)=a$ is feasible exactly when $0<a<1$. Its untouched prediction set is

$$
              P_Q(a)=[a^2,a).
              \tag{H.4.7c.3}
$$

Every value in this half-open interval has an explicit source with at most two atoms strictly inside $(0,1)$. The lower endpoint has exactly the one-atom law $\delta_a$, after merging repeated atoms. The upper endpoint is not attained by any finite positive law in the declared domain.

4. **Full-source distinction.** The compression in item 1 is an existence theorem for the retained prediction vector. Distinct latent laws, source labels, preparation records and resource inventories can share one moment vector on $Q$. Every actual source keeps its own complete I.13s records, and full latent/source equality is a stronger relation than equality on $Q$.

*Proof.* Define

$$
 v_Q(t)=(t^q)_{q\in Q}\in\mathbb R^s.
$$

Every candidate vector is a finite convex combination of these vectors, all of which lie in the affine hyperplane $z_0=1$. Suppose a representation has $r>s$ positive weights. The $r$ vectors are linearly dependent, so there are real numbers $c_j$, not all zero, with

$$
 \sum_jc_jv_Q(t_j)=0.
$$

The zero-exposure coordinate gives $\sum_jc_j=0$. Consequently some $c_j$ are positive and some are negative. Put

$$
 \alpha=\min_{c_j>0}\frac{\pi_j}{c_j}>0,
 \qquad \pi'_j=\pi_j-\alpha c_j.
$$

All new weights are nonnegative, at least one is zero, their sum is one and their moment vector is unchanged. Deleting zero weights and repeating proves the bound $r\le s$ after finitely many steps. All surviving support points remain strictly inside the original cube. Padding the result with zero weights at the point $(1/2,\ldots,1/2)$ yields (H.4.7c.2). Conversely, deleting zero weights from a solution of that formula and merging duplicate atoms gives a candidate with precisely its displayed moments. This proves item 1 without taking the closure of the moment set.

Every exponent in (H.4.7c.2) is a nonnegative integer, so the formula is a finite real polynomial formula with strict support inequalities. The real algebraic elimination and cell-decomposition primitive used in Theorem O.2f therefore applies directly for algebraic input. Keeping the strict inequalities is essential. Existential elimination gives exactly $P_Q(y)$, with the original boundary exclusions. Projection onto an individual coordinate and one-dimensional decomposition gives its interval and inclusion or exclusion of each finite endpoint. Its boundedness follows from $0<t^q<1$ for $q\ne0$. Convexity follows by mixing two finite candidate laws: the mixture is still finite, positive after deleting zero weights, and remains supported in $(0,1)^d$. Fixing the training coordinates preserves convexity. A nonempty convex set has dimension zero exactly when it is a singleton; alternatively uniqueness is decided by excluding two distinct solutions of the same eliminated formula. The latter test also covers nonconvex retained training constraints. A nonempty semialgebraic fiber with algebraic coefficients has an algebraic sample point under the same decomposition primitive; deleting its zero weights gives the promised algebraic source. These observations prove item 2, including the stated extension to polynomial training constraints.

For item 3, a mean of points strictly inside $(0,1)$ lies strictly inside $(0,1)$, and $\delta_a$ realizes every such $a$. Jensen's identity and the strict pointwise bound $t^2<t$ give

$$
 m(2)-a^2=\sum_j\pi_j(t_j-a)^2\ge0,
 \qquad m(2)<a.
$$

Equality in the first inequality requires every positive-weight atom to equal $a$. To attain any $b$ with $a^2<b<a$, put

$$
 v=b-a^2,
 \qquad x=\frac12\left(a-\frac{v}{1-a}\right),
 \qquad y=a+\frac{v}{a-x}.
 \tag{H.4.7c.4}
$$

Since $0<v<a(1-a)$, these numbers obey $0<x<a<y<1$: the last inequality follows from $x<a-v/(1-a)$. Define

$$
 \pi_x=\frac{y-a}{y-x},\qquad
 \pi_y=\frac{a-x}{y-x}.
 \tag{H.4.7c.5}
$$

Both weights are positive and sum to one. The mean is $a$ and the variance is

$$
 \pi_x(x-a)^2+\pi_y(y-a)^2
       =(a-x)(y-a)=v.
$$

The second moment is therefore $b$. The case $b=a^2$ uses $\delta_a$. This proves the entire half-open interval and both endpoint statements. Finally, the deletion argument changes a latent law only to produce an alternative moment witness. It supplies no equality of complete source records, establishing the distinction in item 4. ∎

<a id="construction-h47d"></a>

<a id="construction-h47d-target-clean-structural-capacity-and-its-realized-initial-response"></a>**Construction H.4.7d (Target-clean structural capacity and its realized initial response).** For each candidate law in Theorem H.4.7c, use its actual preparation labels and conditional survival modules as in Theorem I.13s. An environment is specified by the finite exposure word $q$: module $l$ is tested $q_l$ times. Draw $J$ with law $\pi$ independently of the message bit $M$; conditional on $J=j$, the tests are independent with success probabilities $t_{jl}$. Set $L=1$ exactly when all tests survive. The output delivers $M$ on $L=1$ and a fixed message-independent erasure symbol on $L=0$. Retain $J$, every test outcome and $L$.

The channel-preparation recipe and the counted exposure word are registered before any gravitational response is measured. The structural map is

$$
 q\longmapsto C_{\mathrm{ch},\mu}(q)
          =2\ln2\,m_\mu(q).
 \tag{H.4.7d.1}
$$

It is obtained from the channel itself: conditioned on the retained source record $R=(J,\mathrm{tests},L)$, the message is transmitted perfectly when $L=1$ and erased when $L=0$. The record $R$ is independent of $M$. For any input distribution,

$$
 I(M;R,Y)=I(M;Y\mid R)=m_\mu(q)H(M)\le m_\mu(q)\ln2.
 \tag{H.4.7d.2}
$$

A uniform bit attains equality. Two independently prepared copies give (H.4.7d.1). A possibly correlated two-bit input cannot exceed that sum: each retained live subset reveals at most its number of binary coordinates times $\ln2$, and averaging gives $2m_\mu(q)\ln2$. Independent uniform inputs attain it. The structural coordinate is thus the declared per-cycle binary-channel capacity in nats, with the alphabet, waveform and clock retained. It is distinct from the program-complexity variable $C_P$.

The same source has the I.13s initial proper-separation response

$$
 g_\mu(q)=g_0m_\mu(q),\qquad
 g_0=\frac{3}{8\sqrt3}c^2\sqrt{\Lambda/3}
     =\frac{c^2\sqrt\Lambda}{8}.
 \tag{H.4.7d.3}
$$

Here all I.13s source premises are retained: fixed positive $G$ and $\Lambda$; the same varied-clock action; two comparison copies and eight spatial channels; the equality-density release slice; the homogeneous ruler and constrained initial metric; the active/frame instrument and independently normalized angle; the ideal classical clock and finite-label resource contract; and the complete outcome, source, pulse and causal readout records. No measurement of $g$ is used to choose $q$, a training survival value, a latent atom or its weight.

The source-to-response composition uses the following identities of Theorem I.13s. Each outcome has positive null-stream energy and its own Einstein solution, with pressures satisfying

$$
 \mathcal A_{xy}
   =\frac{4\pi G R_\Lambda}{c^2}(p_x-p_y),
 \qquad R_\Lambda=\sqrt{3/\Lambda}.
$$

The retained active/frame instrument and packet preparation give

$$
 \mathbb E\mathcal A_{xy}(q,\theta)
  =2m_\mu(q)\frac14\frac34
     \frac{c^2}{R_\Lambda}\sin(\theta/\sqrt3).
 \tag{H.4.7d.4}
$$

Differentiating at the independently normalized source setting $\theta=0$ yields (H.4.7d.3). The outcome-to-initial-acceleration identity is affine before expectation, so this step evolves each actual positive source rather than evolving a mean stress. The complete instrument, source conservation, finite future evolution, causal ruler, clock errors and stock ownership are exactly those proved in I.13s; Theorem H.4.7c changes none of these maps or inputs. In particular, an algebraic sample-point source from H.4.7c satisfies every finite-positive-law hypothesis of I.13s, while an already specified source keeps its original labels even when a smaller moment witness exists.

Consequently the exact joint capacity predictions are $2\ln2\,P_Q(y)$, and the exact joint initial metric-response predictions are $g_0P_Q(y)$. Every point in these sets has an actual source in the declared I.13s family; every source in that family satisfying the structural training data lies in these sets. The same positive factors preserve uniqueness and endpoint attainment. For the one-dimensional case,

$$
 C_{\mathrm{ch},\mu}(2)\in2\ln2\,[a^2,a),
 \qquad g_\mu(2)\in g_0[a^2,a).
 \tag{H.4.7d.5}
$$

**Independent finite calibration.** At finitely many registered training exposures, one can retain fresh structural survival records without running the gravitational instrument. For $n_q$ independent Bernoulli live flags at exposure $q$, Hoeffding's bound gives

$$
 \Pr\{|\widehat m(q)-m(q)|>\epsilon_q\}
     \le2e^{-2n_q\epsilon_q^2}.
$$

Choosing positive rational $\epsilon_q$ with $\sum_{q\in T}2e^{-2n_q\epsilon_q^2}\le\delta$ produces simultaneous rational training intervals with coverage at least $1-\delta$. Intersecting those intervals with (H.4.7c.2) gives an exact semialgebraic joint prediction set conditional on the observed finite records; on the stated coverage event it contains the actual source's complete exposure predictions. The probability statement belongs to these structural records, while the interval computation retains all their finite-data ambiguity.

**Nonlinear scope and a two-source witness.** The unknown atom coordinates enter (H.4.7c.1) as unknown bases raised to the exposure powers, and the latent rank is unrestricted. For $d\ge2$ this family has no common target-clean scalar order making every candidate nondecreasing. At exposures $(1,0)$ and $(0,1)$, the single-atom laws at $(1/4,3/4)$ and $(3/4,1/4)$ reverse their values. Either strict ordering of the two exposures fails for one candidate, and equal index values fail for both. Theorem H.4.7c computes the actual nonlinear feasible-value set; assigning one unconstrained coefficient to each environment would lose its cross-exposure constraints. At $d=1$, $a=1/2$, the laws $\delta_{1/2}$ and $(\delta_{1/4}+\delta_{3/4})/2$ have the same first-exposure capacity but second moments $1/4$ and $5/16$. Their untouched source-realized accelerations are correspondingly $g_0/4$ and $5g_0/16$.

### H.4.7e Shared nonlinear circuit sources

<a id="theorem-h47e-finite-shared-stochastic-programs-and-their-structural-response"></a>**Theorem H.4.7e (Finite shared stochastic programs and their structural response).** Let $E$ be a finite registered environment set and $X\subset\mathbb R^p$ a semialgebraic parameter domain over the real algebraic numbers. For each $e\in E$, fix a finite binary decision tree $\mathcal T_e$ of depth at most $D_e$. At its internal node $v$, a fresh conditional Bernoulli trial has probability $p_{ev}(x)\in[0,1]$, whose single-valued graph is supplied by a finite semialgebraic formula over the real algebraic numbers. Each terminal leaf $l$ has a fixed live label $b_{el}\in\{0,1\}$. The same $x\in X$ is used at every environment. The domain, programs, probability graphs, environmental input interpretation, source clock and leaf labels are registered independently of gravitational response data.

Keep the finite ideal preparation and control contract of Theorem I.13s: actual classical gate settings, normalized finite instruments, retained branch records and source controls with counted positive carrier energy, an independently supplied classical clock, and the registered constrained release-slice preparation. Put
$$
w_{el}(x)=\prod_{v\in\operatorname{path}(e,l)}
 p_{ev}(x)^{a_{\mathrm{elv}}}[1-p_{ev}(x)]^{1-a_{\mathrm{elv}}},\qquad
m_e(x)=\sum_l b_{el}w_{el}(x),
\tag{H.4.7e.1}
$$
where $a_{\mathrm{elv}}\in\{0,1\}$ is the branch selected on that path. The depth-zero live leaf has weight one. Factors with exponent zero are omitted, including at probability endpoints.

1. For $T\subset E$, $U=E\setminus T$, and any retained semialgebraic structural-training condition $F$ over algebraic data, the exact joint prediction set
$$
P_U=\{(m_e(x))_{e\in U}:x\in X,\ F((m_e(x))_{e\in T})\}
\tag{H.4.7e.2}
$$
is bounded and semialgebraic. The real-algebraic elimination primitive of Theorem H.4.7c decides emptiness, dimension, joint or individual uniqueness, and every individual prediction's finite union of intervals and points with its endpoint-attainment flags. The set need not be convex. Every algebraic feasible untouched vector has an algebraic parameter and gate-probability witness.

2. Run the registered source program independently of a message bit and retain every branch outcome. Deliver the bit exactly on live leaves and a fixed message-independent erasure symbol otherwise. On the original two independent comparison copies, the actual structural capacity per common source cycle is
$$
C_{\mathrm{ch},x}(e)=2\ln2\,m_e(x).
\tag{H.4.7e.3}
$$
The parameter constraints and common program remain in this map.

3. With the unchanged downstream positive-source preparation, frame, clock, angle normalization, constrained metric and causal ruler of Theorem I.13s, the same source has initial proper-separation operating response
$$
g_x(e)=g_0m_e(x),\qquad
g_0=\frac{c^2\sqrt\Lambda}{8}.
\tag{H.4.7e.4}
$$
Every member of (H.4.7e.2) has its specified source on this declared program branch. The joint capacity and response prediction sets are $2\ln2\,P_U$ and $g_0P_U$, with the same uniqueness and endpoint attainment. Complete source records retain their stronger equality relation: distinct programs, controls or costs can share one $m$-vector.

*Proof.* Introduce a variable $u_{ev}$ for each internal probability and impose its supplied graph formula. The graph is single-valued, so these variables introduce no independent probability choices. In the variables $u$, every path weight in (H.4.7e.1) is a polynomial. Introduce $z_e=\sum_l b_{el}w_{el}$ and impose $F(z_T)$. Existential elimination of $x$ and $u$ is a finite real-polynomial formula for (H.4.7e.2). A leaf of weight $w$ splits into $w(1-u)$ and $wu$, preserving total weight. Induction on each finite tree proves nonnegative path weights summing to one, hence $0\le z_e\le1$ and boundedness. Strict parameter inequalities are retained, without replacing the feasible image by its closure.

Emptiness is the truth of the existential formula. Nonuniqueness of the untouched vector is the existence of two feasible copies satisfying $\sum_{e\in U}(z_e-z'_e)^2>0$; using one coordinate gives the corresponding individual test. The same real cell-decomposition primitive gives dimension and the individual projections with endpoint inclusion. Substitution of an algebraic feasible vector leaves a nonempty semialgebraic fiber over algebraic coefficients; algebraic sample-point extraction supplies its parameter and gate probabilities. This proves item 1 for arbitrary adaptive trees and their actual shared parameter constraints, including noncompact $X$, nonconvex fibers and deterministic gates.

Let $R$ retain the complete visited branch history, the leaf flag $L$, environmental input, actual setting and program. At a fixed source setting, $R$ is independent of the message $M$. The output $Y$ is either $M$ or the erasure symbol according to the retained $L$. Therefore
$$
I(M;R,Y)=I(M;Y\mid R)=m_e(x)H(M)\le m_e(x)\ln2.
\tag{H.4.7e.5}
$$
A uniform bit attains equality. Two independent uniform message bits attain (H.4.7e.3). For any correlated two-bit input, conditioning on the two source histories leaves a delivered subset of the binary coordinates; its entropy is at most the number of those coordinates times $\ln2$. Averaging proves the matching upper bound. This is channel capacity for the registered binary alphabet, waveform and cycle.

The finite instrument is explicit. A fresh qubit in $|0\rangle$ undergoes
$$
U_{ev}(x)=e^{-i\alpha_{ev}(x)Y},\qquad
\alpha_{ev}(x)=\arcsin\sqrt{p_{ev}(x)}\in[0,\pi/2],
\tag{H.4.7e.6}
$$
followed by a retained $Z$-basis readout. The outcome-one probability is exactly $p_{ev}(x)$. Earlier retained outcomes choose the subsequent registered gate. For a monotone finite pulse, $H(t)=\hbar\dot\alpha(t)Y$ has integrated operator norm $\hbar\alpha\le\pi\hbar/2$. If positive instantaneous Hamiltonians are required, the scalar-shifted generator
$$
H_+(t)=\hbar|\dot\alpha(t)|I+\hbar\dot\alpha(t)Y\ge0
\tag{H.4.7e.7}
$$
has the same state evolution up to scalar phase and integrated norm at most $\pi\hbar$. Each visited gate and its actual pulse/controller record is charged. A depth-$D_e$ history uses at most $D_e$ gates and retains at most $D_e$ outcome bits per copy, in addition to its actual program and setting resources.

Set $D=\max_eD_e$ and use one common source cycle with $2D$ preparation slots, one for each copy at each tree depth, followed by the original downstream slots. Pad early leaves and shorter programs with retained idle operations. There are exactly two source circuits, not one per spatial channel: each copy's live flag controls its eight downstream three-qubit channel registers. Hence at most $2D_e$ Bernoulli gates and $2D$ reserved preparation slots feed the original sixteen three-qubit registers and forty-eight sign outcomes. Reserved slots and idle holding remain in the source ledger; there is no environment-dependent clock rescaling. The exact settings are supplied classical controls of the same type as the probabilities and angle in I.13s. Algebraic witnesses have finite defining data; their ideal exact controls remain explicit source inputs.

Retain the fixed control-particle mass $m_0$ in the common action of I.13w. The carrier number and the particle masses are the same for every record size. Let $\nu_d$ be the original positive homogeneous comoving control number measure, so its rest energy density at release is $m_0c^2\nu_d/V=\rho_d$. Supply the finite internal record alphabet on these same carriers. For each actual history $\omega$, take the marked initial measure $\nu_d\otimes\delta_\omega$. Summing its labels gives exactly $\nu_d$: particle number, rest energy, dust stress and the metric constraint are unchanged. The scalar free internal Hamiltonian is $m_0c^2I$; the preparatory pulse controls are separately counted. Hold the complete marked measure fixed in variation and transport its labels on the same geodesic worldlines. This is an internal label refinement on carriers of fixed mass.

The two padded histories have at most $3^{2D}$ finite records, since each slot holds $0$, $1$ or idle. Including the environmental and two live labels gives an added internal alphabet of dimension at most $4|E|3^{2D}$; the old active/frame/sign spaces and actual control setting remain separately owned. This explicitly supplied finite internal label capacity is part of the same ideal source/instrument contract, which already permits arbitrary finite latent labels and exposure records in I.13s. The source setting, finite internal capacity, program, preparation work and branch entropy remain charged records. Retain the original $\rho_d$, positive tag density and $\rho_{\rm aux}\le\rho_v/2$; label refinement changes no source stock.

The replacement live flag remains independent of the source angle $\theta$, message, eight-valued active label and common four-valued frame. Conditional on each retained history, a live admitted spatial block therefore has exactly the I.13s three-qubit unit-QFI source rotation and sign readouts; a dead block has its original unbiased signs. The complete source outcome now includes both circuit histories together with all original active, frame, sign, controller, source and ruler records. Its normalized positive release-slice assignment is unchanged. Each outcome has the same packet energies, retained label carriers, actual constrained metric, conserved positive null-stream action and its own regular Einstein future evolution. The common frame rotates all packets and ruler axes together. In particular the actual outcome identity remains
$$
\mathcal A_{xy}(\omega)=\frac{4\pi GR_\Lambda}{c^2}
 (p_x-p_y)(\omega),\qquad R_\Lambda=\sqrt{3/\Lambda}.
\tag{H.4.7e.8}
$$
The finite retained diagonal sign operator of (I.13s.14) still equals this actual initial metric acceleration. The refined labels remain on the same counted isotropic dust source, whose stress and metric contribution are unchanged; its directional pressure difference is zero. Conditional sign independence and zero mean scores are unchanged; the shared-frame direct sum still contributes $3/4$, and the independent active fraction is $1/4$. Since the circuit gives live probability $m_e(x)$ before these projections,
$$
\mathbb E\mathcal A_{xy}(e,x,\theta)
=2m_e(x)\frac14\frac34\frac{c^2}{R_\Lambda}
 \sin(\theta/\sqrt3).
\tag{H.4.7e.9}
$$
Differentiating at the independently normalized $\theta=0$ gives (H.4.7e.4). Every source outcome, rather than a mean stress, obeys (H.4.7e.8). All raw histories, programs, settings, source stress, clock and frame records remain part of the source. The complete conserved-source, finite-future, causal-ruler and finite-precision arguments of I.13s, Parts I–V, apply without changing their auxiliary-energy or clock-accuracy premises. They are unaffected by the representation used to prepare a $\theta$-independent live flag. Together with item 1 this proves all source and prediction assertions. $\square$

**Finite structural calibration and gate errors.** At fixed $(e,x)$, independent circuit runs give Bernoulli live flags even when their internal programs are adaptive. Thus
$$
\Pr\{|\widehat m_e-m_e(x)|>\epsilon_e\}
\le2e^{-2n_e\epsilon_e^2}.
\tag{H.4.7e.10}
$$
Finite simultaneous rational confidence intervals can be inserted into the training formula of the theorem. Their coverage is a property of the independent structural records, and their full ambiguity is retained.

In the following bound $R$ is the history of one comparison copy. For aligned source implementations whose conditional gate probabilities differ by at most $\delta$ at every history, couple both runs using the same uniform random number at each shared visited history. Before the first disagreement their paths coincide; at any such step disagreement has conditional probability at most $\delta$. Pad terminated paths with deterministic idle steps. Summing the first-disagreement events over at most $D_e$ steps proves
$$
\begin{split}
\operatorname{TV}(\mathcal L(R),\mathcal L(\widetilde R))
 &\le\min\{1,D_e\delta\},\\
|m_e-\widetilde m_e|&\le\min\{1,D_e\delta\},\\
|C_{\rm ch}-\widetilde C_{\rm ch}|&\le2\ln2\min\{1,D_e\delta\},\\
|g-\widetilde g|&\le g_0\min\{1,D_e\delta\}.
\end{split}
\tag{H.4.7e.11}
$$
The complete two-copy record has total variation at most $\min\{1,2D_e\delta\}$ by product coupling; its unchanged downstream source kernel cannot increase this distance. The scalar capacity and response bounds in (H.4.7e.11) already include both copies. With nodewise bounds $\delta_{ev}$, the sum over all internal nodes of one tree is another valid per-copy bound. These are output-law comparisons at a registered source alignment; differently encoded controller descriptions need not be close. The original source-angle finite difference, source-state sample count, causal ruler, timestamp and pulse-quantization terms remain those of (I.13s.15)–(I.13s.17), with the exposure probability perturbation replaced by (H.4.7e.11). Every fixed positive formal tolerance uses finite source records under the same explicit clock-precision contract.

**A populated non-exposure circuit.** Use $x\in[1/4,3/4]$ and environments $e=0,1,2$. At $e=0$ emit live deterministically; at $e=1$ use one Bernoulli$(x)$ bit; at $e=2$ use the XOR of two independent Bernoulli$(x)$ bits, retaining both. Then
$$
m_0=1,\qquad m_1=x,\qquad m_2=2x(1-x).
\tag{H.4.7e.12}
$$
The parameter constraint is essential: the exact feasible curve is $z_2=2z_1(1-z_1)$, $1/4\le z_1\le3/4$. Training $m_1=a$ fixes $m_2=2a(1-a)$. Training only $m_2=b$ is consistent exactly for $3/8\le b\le1/2$ and gives
$$
m_1\in\left\{\frac{1-\sqrt{1-2b}}2,
                  \frac{1+\sqrt{1-2b}}2\right\}.
\tag{H.4.7e.13}
$$
Both values occur when $b<1/2$; they coincide at $b=1/2$. In particular $b=3/8$ gives exactly the disconnected pair $\{1/4,3/4\}$, not its interval hull.

At $x=1/4$, $m_2=3/8>m_1=1/4$. Every positive law on the original one-dimensional exposure support $(0,1)$ instead has $\int t^2d\mu<\int td\mu$. Thus no such law reproduces these fixed first and second environment words. Relabeling them as unrelated exposure coordinates changes the registered model rather than proving equivalence of the source mechanisms. There is also no fixed scalar environmental index making every candidate nondecreasing: $m_2>m_1$ at $x=1/4$, while $m_2<m_1$ at $x=3/4$; either strict ordering of environments 1 and 2 fails for one candidate, and equal indices fail for both. The finite parameter curve must not be replaced by unconstrained per-environment coefficients.

In the populated units of I.13s, take $c=R_\Lambda=1$, $\Lambda=3$, $8\pi G=3$, $L=4$, $\rho_d=\rho_{\rm tag}=1/8$. Use the unchanged fixed-mass dust number measure with the supplied finite internal record alphabet, and retain the positive tag budget. Every outcome still has $\rho_v=1$, total energy $144$ and $H_*^2=13/4$. At $x=1/4$, the actual capacities are $2\ln2$, $(\ln2)/2$, $(3\ln2)/4$, and the metric derivatives are $g_0$, $g_0/4$, $3g_0/8$, where $g_0=3/(8\sqrt3)$. Every nontrivial Bernoulli pulse has $\alpha=\pi/6$, integrated generator norm $\pi\hbar/6$, or $\pi\hbar/3$ with the positive shifted Hamiltonian. The two-gate branch retains two outcomes per copy. Pad all environments to four preparation slots for the two copies on the same cycle; all original downstream source pulses, frame, signs and ruler resources remain separately charged.

The theorem classifies the entire stated finite semialgebraic stochastic-program class, with its actual structural capacity and initial-response source. A parametric environmental link enters this class through a semialgebraic graph and a finite source program. Together with H.4.7c–d and I.13s/w, the theorem settles the environment-complexity interpolation on this declared source class. Results for presentations outside the class are in H.4.7f.

### H.4.7f Effective presentations and nontermination boundaries

**Presentation contract (environmental programs).** Keep the finite environment set $E$, trained subset $T$, untouched subset $U=E\setminus T$, common parameter and target-independent registration of H.4.7e. For each environment a presented stochastic controller has designated LIVE and DEAD terminal outcomes. At a fixed parameter $x$, let
$$
m_e(x)=\Pr_x\{\text{eventually terminate LIVE at environment }e\},\qquad
P_U=\{(m_e(x))_{e\in U}:x\in X,\ F((m_e(x))_{e\in T})\}.
\tag{H.4.7f.1}
$$
Here $F$ is a supplied finite formula. Unless an almost-sure termination promise is expressly imposed, positive probability of running forever is allowed in this mathematical definition. Running forever is not a detected DEAD outcome. Write $\mathsf{NONEMPTY}$ for the decision problem $P_U\ne\varnothing$, and $\mathsf{EMPTY}$ for its complement.

An effective semialgebraic presentation supplies finite formulas over the real algebraic numbers for $X$, the training condition $F$, and every single-valued transition-probability graph, with nonnegative probabilities and row sums one on $X$. Initial configurations and designated terminal labels are supplied finitely. Algebraic constants have effective algebraic descriptions. All environments use the same $x$; separate probability-graph variables are constrained by their supplied graphs, not fitted independently. Term-defined transcendental presentations instead specify the fixed signature, finite terms, their valid domains and the formula $F$. Statements about decidability concern these descriptions and their stated promises.

<a id="theorem-h47f-scoped-compilers-tame-images-and-obstructions"></a>**Theorem H.4.7f (Scoped compilers, tame images and obstructions).**

1. For finite-state Markov controllers with the effective semialgebraic presentation above, each eventual LIVE-probability graph and the exact joint set (H.4.7f.1) are effectively semialgebraic. The same holds for finitely presented probabilistic pushdown controllers, equivalently recursive Markov chains with finitely many component exits and the usual probabilistic call/return semantics. No nondeterministic scheduler is added. Thus emptiness, dimension, uniqueness, coordinate endpoint attainment and algebraic witness extraction have the precise meaning and effective decisions of H.4.7e. The conclusion holds for arbitrarily long runs and infinitely many stack configurations.
2. These compilers enlarge the admitted *controller descriptions*; the extensional semialgebraic LIVE-vector family is that of H.4.7e. Their compiled probability graphs admit finite depth-one H.4.7e replacement programs. Under that theorem's explicit ideal prepared-source contract the replacements have structural capacity $2\ln2\,m_e(x)$ and initial response $g_0m_e(x)$. This is prediction equivalence with a source on the replacement branch; the histories, internal state, costs, clock and cycle of the original controller are separate records.
3. If all domain, transition graphs and training data are definable in one fixed o-minimal expansion of the real field, the finite-state and recursive constructions give a definable $P_U$, with finitely many connected components and a well-defined dimension. The statement is structural: an effective decision requires a decision procedure for the expansion. In the ordered real field with $\exp$, using finite formulas over rational or algebraic data, $\mathsf{NONEMPTY}$ is decidable conditional on the real Schanuel conjecture. Unconditional decidability of the real exponential field is open, and restricted analytic signatures require their own decision procedures.
4. For finite depth-one programs with terms built from rational constants, arithmetic, division by positive denominators and $u\mapsto\sin(\pi u)$, $\mathsf{NONEMPTY}$ is undecidable. This already holds with one trained and one untouched environment, equality training, and a fixed finite bound on the parameter dimension. Singleton testing is undecidable even when $P_U$ is guaranteed nonempty. The reduction can use the bounded noncompact domain $(0,1]^k$. On the unbounded orthant it can instead use strict training; the resulting strict-feasibility class is $\Sigma^0_1$-complete.
5. For parameter-free finitely branching trees given by a promised-total Turing generator with rational branch probabilities and decidable terminal labels, and with divergence allowed, the possible LIVE probabilities are exactly the left-computably-enumerable reals in $[0,1]$. Positivity is $\Sigma^0_1$-complete, zero is $\Pi^0_1$-complete, and equality to one is $\Pi^0_2$-complete on this valid-input class. Equality-one training therefore makes $\mathsf{NONEMPTY}$ $\Pi^0_2$-complete. For a finite quantifier-free polynomial training formula on finitely many such parameter-free probabilities, $\mathsf{NONEMPTY}$ is in $\Delta^0_3$.
6. Under the stronger promise of almost-sure termination in LIVE or DEAD, the probabilities in item 5 are computable reals; conversely every computable probability has such a realization. Under this promise equality to one is $\Pi^0_1$-complete, not the divergent construction's $\Pi^0_2$ case. This is a promise-class distinction; deciding the promise is a separate problem. Almost-sure termination alone supplies neither a finite expected resource bill nor a fixed common cycle.

Items 3–6 fix the boundary of the effective classification. These presentation and termination results supplement the prepared-source result without enlarging it.

*Proof of item 1: finite-state compiler.* Partition $X$ by the finitely many transition support patterns. Fix one pattern and one $x$. Let $R$ be the nonabsorbing states from which LIVE can be reached with positive probability. A state outside $R$ has LIVE probability zero. Each state of $R$ has a positive path to LIVE of length at most the finite state count. At this fixed $x$, the minimum probability of these finitely many chosen paths is positive. Consequently the substochastic transition matrix $Q_R$ on $R$ has a finite power with row sums strictly below one, so $Q_R^n\to0$. If $r_R$ is the vector of direct one-step LIVE probabilities, then
$$
m_R=(I-Q_R)^{-1}r_R.
\tag{H.4.7f.2}
$$
The determinant is nonzero on this support stratum. Cramer's rule, the supplied transition graphs and finite existential projection define the exact semialgebraic graph of (H.4.7f.2). Include the prescribed values at the absorbing states and take the finite union over support patterns. No uniform positive path bound over the whole stratum is needed. Zero-probability boundary transitions are retained as their own patterns. A closed class disjoint from LIVE and DEAD can still carry divergence mass; (H.4.7f.2) computes LIVE reachability rather than falsely declaring absorption certain.

For a recursive Markov chain, introduce the finite summary variables $y_{u,a}$ for eventual termination at exit $a$ from a component state or port $u$. An exit has its designated zero/one values; an ordinary probabilistic transition gives a nonnegative linear sum of successor summaries; a call gives a sum, over callee exits $b$, of the product of the callee's entry-to-$b$ summary and the continuation's return-port-to-$a$ summary. Thus a finite polynomial system $y=P_x(y)$ is effectively constructed, with nonnegative coefficients. The exit-probability vector is its least nonnegative fixed point. This is the standard recursive-chain fixed-point theorem, with the finite summary construction and least-fixed-point characterization given in Etessami and Yannakakis (2009, Theorem 3.1).

In particular that vector is uniquely characterized by
$$
y\ge0,\qquad y=P_x(y),\qquad
\forall z\bigl[(z\ge0\ \wedge\ z=P_x(z))\Longrightarrow y\le z\bigr],
\tag{H.4.7f.3}
$$
where inequalities are coordinatewise. The fixed-point existence premise here follows from the valid probabilistic controller; it is not claimed for every arbitrary monotone polynomial system. Introduce the uniquely constrained transition-coefficient graph variables in (H.4.7f.3). Real-algebraic quantifier elimination gives the graph jointly in $(x,y)$. Summing its designated LIVE exits, adding $F$ and projecting yields exactly (H.4.7f.1), not its closure or interval hull. Algebraic feasible output fibers over algebraic data have algebraic sample-point witnesses. The same descriptions decide whether the sum of all terminal exit probabilities is one. This proves item 1, including the stated decidable almost-sure-termination subcondition for these finite presentations.

*Replacement source, item 2.* For each environment take the compiled single-valued semialgebraic graph of $m_e(x)\in[0,1]$ as the supplied probability graph of a one-node Bernoulli circuit. These graphs preserve the common parameter and trained constraints, so the circuits reproduce the entire vector in (H.4.7f.1). H.4.7e applies directly to these finite circuits, with its retained two-copy source, positive controls and independently registered setting/clock/cost contract. No recursion needs to be physically executed by that replacement. Conversely the original recursive controller may require unbounded history memory, have infinite expected duration, or fail to terminate with positive probability. Matching the single LIVE probability does not match any of those properties. In particular the replacement's finite resource ledger is not a bound on the original program's ledger. This proves the replacement claim of item 2.

*Definability and its effective boundary, item 3.* Equations (H.4.7f.2)–(H.4.7f.3), support tests, trained constraints and projection use only finitely many first-order operations. Definability in a fixed expansion is preserved under those operations. O-minimal cell decomposition gives finite component structure and dimension, without convexifying a disconnected feasible fiber. Effective decision does not follow from this extensional argument. For the specific finite language of the ordered real exponential field, the Macintyre–Wilkie conditional decision theorem applies under real Schanuel; see Wilkie's primary account (Wilkie 1997). Full complex Schanuel is sufficient but stronger than the version needed here.

Restricted analytic sine with an argument bounded on the stated domain is a tame definability example. In contrast, $\sin(\pi/x)$ on $(0,1]$ has an unbounded argument and infinitely many oscillations at the missing endpoint. Compactness slogans or an informal syntactic rule cannot replace the actual domain and boundedness assumptions. O-minimality is a sufficient tameness condition in this theorem.

There is no single effective input language for “all restricted analytic functions” implicit here. A simple obstruction shows why its representation matters. For a machine index $e$, define $a_e=2^{-t}$ if the machine first halts at step $t\ge1$, and $a_e=0$ if it never halts. Simulating for $N$ steps gives a uniform rational approximation with error at most $2^{-N}$. The constant function $a_e$ is entire and has trivial analytic bounds, but deciding its exact equality to zero decides nonhalting. Thus even uniformly computable analytic-function names with analytic bounds do not support general exact zero testing. This example does not settle a separately specified finite analytic signature; it prevents attributing one undifferentiated open decidability status to every analytic presentation.

*Periodic obstruction, item 4.* The effective Diophantine representation theorem gives, from a c.e. predicate, an integer polynomial whose nonnegative-integer solutions encode membership; see Matiyasevich (1971). Use the representation of one fixed c.e.-complete set and substitute the instance parameter into its polynomial. The number $k$ of remaining existential variables is then fixed. No numerical optimal variable bound is needed.

Given the resulting polynomial $P$ on $X=[0,\infty)^k$, define the trained depth-one LIVE probability and untouched probability by
$$
p(x)=\frac{1}{1+P(x)^2+\sum_{i=1}^k\sin^2(\pi x_i)},\qquad
m_1(x)=p(x),\qquad m_2(x)=\frac12.
\tag{H.4.7f.4}
$$
The denominator is positive and $0<p\le1$. Equality training $m_1=1$ holds exactly at integer roots of $P$. Hence $P_U$ is $\{1/2\}$ or empty according to the encoded c.e.-complete membership instance. This proves undecidability. For guaranteed-nonempty singleton testing, adjoin $s\in\{0,1\}$ and use
$$
m_1(x,s)=1-s+s\,p(x),\qquad
m_2(x,s)=\frac{1-s}{4}+\frac{s}{2},\qquad F:\ m_1=1.
\tag{H.4.7f.5}
$$
The untouched set is always $\{1/4\}$ and additionally contains $1/2$ exactly when $P$ has an integer root. Thus singleton testing decides the complement problem.

For a bounded-domain version, replace $x_i$ by $1/u_i-1$ in (H.4.7f.4), with $u_i\in(0,1]$. A nonnegative integer $n_i$ corresponds exactly to $u_i=1/(n_i+1)$. All introduced denominators are positive on this domain. The parameter domain is bounded but not compact, and the sine arguments are unbounded at its excluded boundary, so no tame compact-extension claim is contradicted.

For strict training, write $P(x)=\sum_a c_a x^a$ and, on the nonnegative orthant, set
$$
\begin{split}
 B_j(x)&=\sum_{a:a_j>0}|c_a|a_j
          \prod_i(x_i+1)^{a_i-\mathbf1_{i=j}},\\
 L(x)&=1+\sum_j B_j(x),\qquad h(x)=L(x)^2,\\
 v(x)&=P(x)^2+h(x)\sum_i\sin^2(\pi x_i),\qquad
 p_*(x)=\frac{1}{1+v(x)}.
\end{split}
\tag{H.4.7f.6}
$$
These polynomials and terms are effectively obtained from $P$. Let $n$ be a nearest nonnegative integer vector and $\delta=\|x-n\|_2$. Along the segment from $x$ to $n$, each coordinate is nonnegative and at most $x_i+1$, so $L(x)$ bounds $\|\nabla P\|_2$. Also $|x_i-n_i|\le1/2$, and on this residual interval
$$
|\sin(\pi(x_i-n_i))|\ge2|x_i-n_i|,
\qquad \sum_i\sin^2(\pi x_i)\ge4\delta^2.
\tag{H.4.7f.7}
$$
If $P$ has no integer root, $|P(n)|\ge1$. When $L(x)\delta\le1/2$, the mean-value bound gives $|P(x)|\ge1/2$. Otherwise the second term of $v$ exceeds $1$. In both cases $v\ge1/4$, whence $p_*\le4/5$. At an integer root, $v=0$ and $p_*=1$. Therefore strict training $m_1=p_*>4/5$ is feasible exactly in the root cases. Strict feasibility in this continuous rational/sine term class on the full orthant is c.e.: enumerate nonnegative rational parameter vectors and certified evaluations until a strict margin is witnessed. A nonempty relatively open feasible set contains such a rational vector. Combined with the fixed c.e.-complete reduction, this proves $\Sigma^0_1$-completeness for this strict-feasibility class.

*Computable trees, item 5.* A total generator returns in finite time the terminal flag or the finitely many rational successor probabilities for any finite node address. Invalid descriptions are outside the stated promise. Finite-depth exploration computes the rational LIVE mass $q_n$ of terminal paths found by depth $n$, and
$$
0\le q_n\le q_{n+1}\le1,\qquad
m=\lim_n q_n.
\tag{H.4.7f.8}
$$
Thus $m$ is left-c.e. and positivity has a finite positive-weight LIVE-path witness. For hardness, at every depth $n$ split probability $1/2$ to a terminal leaf, labeled LIVE if a given machine has halted within $n$ steps and DEAD otherwise, and probability $1/2$ to continuation at depth $n+1$. Each local test is bounded, the generator is total, and stopping occurs almost surely. Its LIVE probability is positive exactly when the encoded machine halts. Positivity is consequently $\Sigma^0_1$-complete and zero is $\Pi^0_1$-complete.

Conversely let $q_n$ be any computable increasing rational sequence in $[0,1]$, with $q_{-1}=0$ and limit $\alpha$. At stage $n$ terminate LIVE with conditional probability
$$
a_n=\begin{cases}
\displaystyle\frac{q_n-q_{n-1}}{1-q_{n-1}},&q_{n-1}<1,\\[4pt]
0,&q_{n-1}=1,
\end{cases}
\tag{H.4.7f.9}
$$
and otherwise continue. Each rational $a_n\in[0,1]$ is computable. The mass arriving at stage $n$ is $1-q_{n-1}$, so LIVE mass accumulated through stage $n$ is $q_n$. When $q_{n-1}=1$ the stage is unreachable. Total LIVE mass is $\alpha$ and divergence mass is $1-\alpha$, proving the exact left-c.e. range with its normalization limitation.

Equality to one has the form
$$
m=1\quad\Longleftrightarrow\quad
\forall k\ge1\ \exists n\quad q_n>1-2^{-k}.
\tag{H.4.7f.10}
$$
It is therefore $\Pi^0_2$ on the promised generator class. For hardness, for a machine $M$ let $h(n)$ be the number of inputs $i\le n$ on which $M$ halts within $n$ steps. Use (H.4.7f.9) with $q_n=1-2^{-h(n)}$. Then $m=1$ exactly when the halting domain of $M$ is infinite. This infinitude problem is $\Pi^0_2$-complete: membership has the form “for each finite bound there are more enumerated elements,” and totality reduces to it by enumerating $k$ only after all computations on inputs up to $k$ have halted. The generated tree remains total in both cases because each stage uses only bounded simulation. In the noninfinitude cases its positive divergence mass is essential to this construction. Adjoining a constant untouched coordinate makes equality-one training exactly the stated $\mathsf{NONEMPTY}$ problem.

For completeness of the upper bound on general finite polynomial training, a left-c.e. real has a Cauchy name computable with the halting oracle $0'$. One can decide with that oracle rational lower-cut membership and refine rational brackets. Hence a rational polynomial in finitely many such reals has a $0'$-computable Cauchy name. Strict positivity is semidecidable relative to $0'$, thus $\Sigma^0_2$; equality to zero is $\Pi^0_2$. A finite Boolean combination of these predicates is in $\Delta^0_3$. The assertion is an upper bound. Totality/validity of unrestricted generator code is not supplied by these probability tests; it remains an explicit promise.

*Completed-output distinction, item 6.* Under almost-sure LIVE-or-DEAD termination, let $q_n$ and $d_n$ be the increasing rational masses of those two terminal types through depth $n$. They converge to $m$ and $1-m$. Search until $q_n+d_n>1-\epsilon$; the search terminates under the promise and produces the bracket
$$
q_n\le m\le1-d_n,\qquad (1-d_n)-q_n<\epsilon.
\tag{H.4.7f.11}
$$
Thus $m$ is computable uniformly on the promised descriptions. Conversely, for a computable $\alpha\in[0,1]$, generate a uniform real in $[0,1]$ by successive fair bits and refine certified rational brackets for $\alpha$. Stop LIVE when the uniform real's current binary interval is certified below $\alpha$, and DEAD when it is certified above. Except on equality and irrelevant endpoint ambiguities, a probability-zero event, the two real numbers are separated after finitely many refinements. Every stage requires finite computable work and rational coin probabilities, so this is an a.s.-terminating realization with LIVE probability $\alpha$.

Under this promise, $m=1$ exactly when no finite positive-weight DEAD path exists. It is $\Pi^0_1$. For hardness swap LIVE and DEAD in the geometric bounded-simulation construction above: a DEAD leaf has positive probability exactly if the encoded machine halts. Hence equality to one is $\Pi^0_1$-complete on this promised class. This does not decide whether an arbitrary input is a.s.-terminating. In particular the divergence-based equality-one reduction in (H.4.7f.10) does not belong to this promise class on every input. $\square$

**Independent environmental parameters.** A product rule requires actual factorization of the parameter domain and admissibility. Suppose $X=\prod_{e\in E}X_e$, $m_e$ depends only on $x_e$, and there are no cross-environment admissibility constraints. Put
$$
A_T=\{(x_e)_{e\in T}\in\textstyle\prod_{e\in T}X_e:
                  F((m_e(x_e))_{e\in T})\}.
\tag{H.4.7f.12}
$$
If $A_T=\varnothing$ then $P_U=\varnothing$; otherwise $P_U=\prod_{e\in U}m_e(X_e)$. This follows by choosing trained and untouched coordinates independently. Satisfiability means feasibility on the reachable trained images, not satisfiability of $F$ on arbitrary numerical values. With a genuinely common parameter or a cross-environment restriction this product conclusion need not hold, and replacing the common mechanism by this product changes the model.

**Actual-source and resource boundary.** A deadline for an original unbounded controller produces LIVE, DEAD or TIMEOUT. Finite-depth LIVE mass tends monotonically to $m$, but discarded TIMEOUT mass cannot be conditionally renormalized into a completed source. A mathematical path-space measure may attach a label to infinite survival; that label is not generally available to any finite observer. Even when stopping is a.s. finite, its expectation may diverge, its retained history can be unbounded, and no fixed common preparation schedule or uniform finite energy/memory bill follows. The two-copy capacity and I.13s response of item 2 belong to the explicitly substituted finite program. For an infinite controller with the same eventual LIVE mass they require that controller's complete task/alphabet/cycle, normalized readout, causal errors, positive conserved source, metric variation, clock and record ledger.

The decision and impossibility results are statements about the stated presentation classes. Equality of $P_U$ is prediction-set equivalence; full retained-source equivalence distinguishes programs, histories, controls and costs.

The structural map is the actual registered two-copy binary erasure capacity, $C_{\mathrm{ch}}=2\ln2\,m$, derived independently of gravitational data. The corresponding outcome-wise conserved source, common constrained release metric, retained instrument/frame, proper clock and causal ruler give the initial signed proper-separation response $g=g_0m$, with $g_0=c^2\sqrt\Lambda/8$. Source histories, positive fixed-mass controls, finite label stocks, two circuits, downstream registers, preparation slots, actual pulses and complete finite error/resource records remain those of H.4.7e and I.13s/w. Equivalence is equality of prediction vectors; full retained sources keep their stronger equality relation. Verifiers are the exact image/witness constructions, capacity calculation and same-source metric/readout identities; an unattainable included prediction, gravitational datum used in the structural map, omitted source resource, or failure of that response identity falsifies the corresponding claim.

Scope: the phrase “outside these classes” of the registered proposition refers to the classes of Theorems H.4.7a–b, and the discharge is on the declared families: the exposure and semialgebraic program families above, with the finite-state and recursive Markov controller presentations that Theorem H.4.7f, items 1–2, compiles into them. Link families without a semialgebraic presentation are outside this class. Theorem H.4.7f, items 3–6, gives the results proved outside it: families definable in a fixed o-minimal expansion of the real field have definable prediction sets with finitely many connected components and a dimension; over the ordered real field with $\exp$, $\mathsf{NONEMPTY}$ is decidable conditional on the real Schanuel conjecture; for the $\sin(\pi u)$ term class it is undecidable; and effectively generated infinite trees have the stated arithmetical complexity. The power-law link $C_{\mathrm{ch},\theta}(e)=\theta_1s(e)^{\theta_2}$, $\theta_1>0$, $\theta_2\in\mathbb R$, on three environments with index values $s=1,2,3$ has no semialgebraic presentation: its image $\{(\theta_1,\theta_12^{\theta_2},\theta_13^{\theta_2})\}$ is not semialgebraic, because $u\mapsto u^{\log_23}$ is not an algebraic function. It is definable over the real field with $\exp$, so the conditional decision statement applies to it; for training on exact values, $\ln C_{\mathrm{ch},\theta}(e)=\ln\theta_1+\theta_2\ln s(e)$ is affine in $(\ln\theta_1,\theta_2)$, and two trained environments fix the third value. Ideal exact settings, finite internal-label preparation and clock accuracy are premises of the prepared-source contract of Theorems H.4.7e and I.13s. The response is the initial proper-separation response of Theorem I.13s; galaxy-force and late-time dark-response identifications have their own owning projections, such as Theorems I.13t–I.13v.

## H.8 Derivation Summary: The Bridge Law

The bridge law combines four independent factors into one conditional acceleration scale.

**Technical ledger.**

**Table H.2: Complete Derivation Chain for $\eta'$**

| Step | Factor | Value | Theorem | Source |
|:-----|:-------|:------|:--------|:-------|
| 1 | Structural comparison weight / registered repetition | $w_{\mathrm{cmp}}=N_{\mathrm{cmp}}=2$ at $C_{\mathrm{ch}}=2\varepsilon_0$ | bridge registration plus QFI additivity for two i.i.d. copies | Definition H.0a; Theorem H.1b |
| 2 | Active participation | $a/d_0 = 1/4$ | Active-tangent contraction certificate | Definition H.0a; Theorem H.1a supplies the carrier-average comparison |
| 3 | Spatial projection | $(D-1)/D = 3/4$ | Spatial-tangent contraction certificate | Definition H.0a; Theorem H.2 supplies the isotropic Euclidean comparison |
| 4 | Generator-amplitude normalization | $1/\sqrt{K_0} = 1/\sqrt{3}$ | Separate amplitude convention | Definition H.0a; Theorem H.1c |
| 5 | Product structure | Multiply | Scalar action on successive images | Theorem H.3; Definition H.4.2.8a |
| 6 | Curvature exclusion | Additional branch premise | Explicit locality convention | Theorem H.4 and its consequence |

**Result:**
$$
\eta' = 2 \times \frac{1}{4} \times \frac{3}{4} \times \frac{1}{\sqrt{3}} = \frac{3}{8\sqrt{3}} \approx 0.2165
$$

**Bridge-conditional evaluation:**
$$
g_0=\eta'c^2\sqrt{\frac{\Lambda}{3}}
=\frac{c^2\sqrt{\Lambda}}8
\approx1.18\times10^{-10}\,\mathrm{m/s^2}.
$$

The quoted value is an arithmetic evaluation after Definition H.0 and an external $\Lambda$ are supplied. Its ratio to a representative empirical central value near $1.2\times10^{-10}\,\mathrm{m/s^2}$ is approximately $0.98$.

**Dependency Ledger:**
$$
\boxed{
\begin{aligned}
(\mathrm{O1})\text{--}(\mathrm{O3})+(\mathrm{FC})
&\xrightarrow{\text{Thm 15}}K_0=3,\ N_{\mathrm{vis}}^{\min}=8
\xrightarrow{\text{Hilbert distinguishability; Thm 23}}d_0\ge8
\xrightarrow{\text{same-class comparator; Thm Z.2}}d_0=8,\\
\varepsilon_0=\ln2+\text{Theorem-Z.1 gates}
&\longrightarrow a=2
\xrightarrow{M=2a(d_0-a)}24
\xrightarrow{\text{faithful shell}+K(3)=12+\text{regular }24\text{-cell}+\text{least-feasible cost}}D=4
\xrightarrow{\text{Bridge Law}}\eta'=\frac{3}{8\sqrt3}.
\end{aligned}
}
$$

## H.9 Conclusion

The formulas are dimensionally consistent. The acceleration value follows only after the bridge inputs are fixed.

**Technical ledger.**

Through careful dimensional analysis, all core PU equations are shown to be homogeneous according to the defined units. On Proposition H.1's detector-and-relaxation branch, matching the selected Unruh and de Sitter temperatures defines the conditional crossover acceleration $a_0=c^2\sqrt{\Lambda/3}$.

The efficiency factor $\eta' = 3/(8\sqrt{3}) \approx 0.2165$ takes this value within the hybrid, factor-certified bridge-law class of Definition H.4.2.8a after its four registered coefficients are inserted:

| Factor | Value | Source |
|--------|-------|--------|
| Active-tangent contraction | $a/d_0 = 1/4$ | active contraction certificate; Theorem H.1a supplies the analogous Haar-vector identity |
| Structural comparison weight / registered repetition | $w_{\mathrm{cmp}}=N_{\mathrm{cmp}}=2$ at $C_{\mathrm{ch}}=2\varepsilon_0$ | bridge registration plus QFI additivity for two i.i.d. copies |
| Spatial-tangent contraction | $(D-1)/D = 3/4$ | spatial contraction certificate; Theorem H.2 supplies the Euclidean isotropic identity |
| Generator-amplitude normalization | $1/\sqrt{K_0} = 1/\sqrt{3}$ | product-mixed-register calculation and independent amplitude convention of Theorem H.1c |

The resulting branch value $g_0\approx1.18\times10^{-10}\,\mathrm{m/s^2}$ is about $2\%$ below the representative empirical central value $1.2\times10^{-10}\,\mathrm{m/s^2}$. This is central-value proximity only. Coverage requires a named galactic extraction likelihood, its calibration and astrophysical nuisance covariance, the cosmological-input covariance, and the bridge-law uncertainty in one preregistered comparison record. The same Grassmannian geometry enters the Appendix Z Thomson-limit sinc-core value $\alpha^{-1}_{0}=137.03609205522863\ldots$, whose arithmetic offset from the NIST/CODATA comparison central value is about $0.678$ ppm before residual closure.

The derivation is conditional on every record in Definition H.4.2.8a, including the structural interpolation, registered two-copy realization, two tangent contractions, equal-channel decomposition, factorized scalar action, and generator-amplitude convention. Physical reset entropy remains a separate implementation ledger.

Under that bridge-law normalization, the Appendix H acceleration scale $g_0=c^2\sqrt{\Lambda}/8$ is determined on the stated branch. The Appendix I length $L_0$ requires an independently registered baryonic profile or mass scale before it can be related to this acceleration. The parameters $L_0$, $A_G$, and $m$ of the Equation (I.4) interpolation remain phenomenological, and the response kernel, background-subtraction prescription, covariant completion, and matching data of Appendix I remain independent model inputs or certificate entries.
