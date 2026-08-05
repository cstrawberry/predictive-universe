# Appendix H: Dimensional Analysis and Emergent Scales

## H.1 Introduction

This appendix checks that the framework's formulas use compatible physical units and explains how one conditional acceleration scale is assembled.

**Technical ledger.**

This appendix records the physical dimensions assigned to key PU symbols and verifies dimensional homogeneity. On the separately adopted QFI linear-response bridge of Definition H.0, it evaluates the conditional acceleration-scale relation between $g_0$ and $\Lambda$. Dimensional consistency and the exact algebraic reduction do not derive the bridge or identify its output with the realized Milgrom scale.

Standard SI base dimensions are used: Mass $[M]$, Length $[L]$, Time $[T]$, Energy $[E]=[M][L]^{2}[T]^{-2}$ and Temperature $[\Theta]$. Boltzmann's constant $k_{B}$ carries $[E][\Theta]^{-1}$. Predictive Physical Complexity $[Complexity]$ is treated as a fundamental dimension within the PU framework, representing the quantifiable structural resources required for prediction. Dimensionless information measures (nats) are noted where relevant. Factors of $c$ and $\hbar$ are kept explicit where needed for standard physics relations, but often $c=1, \hbar=1, k_B=1$ are used in derivations for simplicity.

*Numbering note:* Section and equation labels in this appendix are stable identifiers used for cross-references throughout the PU project.

## H.2 Dimensional Assignments

**Table H.1: Dimensions of Recurrent Symbols**

| Quantity                      | Symbol(s)                                                                        | Dimension                                            | Comment                                              |
| :---------------------------- | :------------------------------------------------------------------------------- | :--------------------------------------------------- | :--------------------------------------------------- |
| Predictive Physical Complexity | $C_{P}, C_{\text{agg}}, \hat{C}_{\text{target}}, \hat{C}_{v}$                    | $[\text{Complexity}]$                                | structural / resource capacity                       |
| Discrete register count        | $K_0$                                                                            | $1$                                                   | dimensionless count; $K_0=3$ on the minimal branch   |
| Probability / Performance     | $PP, Q, \alpha, \beta, \alpha_{\text{SPAP}}, \alpha_{CC,max}, \mathrm{CC}$ | $1$                                                  | dimensionless                                        |
| Information / Capacity        | $\Delta I, C_{\max}(f_{\text{RID}})$                                             | $1$                                                  | dimensionless (nats)                                 |
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
| Gravitational constant        | $G$                                                                              | $[M]^{-1}[L]^{3}[T]^{-2}$                            | emergent (Equation (E.9))                            |
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

**Entropy-role convention for Sections H.4.2–H.4.7.** The structural reference $\varepsilon_0=\ln2$ and the physical reset entropy $\varepsilon_{\mathrm{phys}}$ have distinct roles. Define
$$
w_{\mathrm{cmp}}(C):=\frac{C}{\varepsilon_0}
$$
as the dimensionless comparison-slot weight of the adopted bridge law. It is not, in general, an integer count of physical resets. At the operating point $C=C_{\max}^*=2\varepsilon_0$, the acceleration-lock branch additionally registers an actual two-copy i.i.d. realization, so $w_{\mathrm{cmp}}=N_{\mathrm{cmp}}=2$ and QFI additivity applies. Any irreversible physical reset separately obeys $\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)$ on its registered reset branch; Landauer accounting alone neither fixes $\varepsilon_{\mathrm{phys}}=\varepsilon_0$ nor supplies the two-copy realization.


## H.3 Dimensional Consistency Checks

Using the dimensional assignments in Table H.1, we verify the dimensional homogeneity of the principal PU equations.

*   **Adaptation Dynamics (Equations (24), (30), (38))**
    *   Equation (24) defining $\Psi$: $\Psi$ has dimensions $[E][T]^{-1}[\text{Complexity}]^{-1}$. $\Gamma_{0}$ has $[E][T]^{-1}$, $\partial PP/\partial C$ has $[\text{Complexity}]^{-1}$ (PP dimensionless, $C$ has $[\text{Complexity}]$). $\lambda$ is dimensionless, $R'$ and $R_I'$ have dimensions $[E][T]^{-1}[\text{Complexity}]^{-1}$. The equation $\Psi = \Gamma_0 (\partial PP/\partial C) - (\lambda R' + R_I')$ is dimensionally consistent.
    *   Equation (30) for $\dot C$: $dC/dt$ has dimensions $[\text{Complexity}][T]^{-1}$. $\eta_{\text{adapt}}$ has $[\text{Complexity}]^2 [E]^{-1}$, $\Psi$ has $[E][T]^{-1}[\text{Complexity}]^{-1}$. The product $\eta_{\text{adapt}}\Psi$ has dimensions $[\text{Complexity}]^2 [E]^{-1} \times [E][T]^{-1}[\text{Complexity}]^{-1} = [\text{Complexity}][T]^{-1}$. Equation (30) is dimensionally consistent.
    *   Equation (38) for $\dot{\hat C}_{\text{target}}$: $d\hat C_{\text{target}}/dt$ has dimensions $[\text{Complexity}][T]^{-1}$. $\mu_{\text{target}}$ has $[T]^{-1}$. $\hat C_{\text{target}}$ has $[\text{Complexity}]$. $(PP-PP_{op})$ is dimensionless. The equation $\dot{\hat C}_{\text{target}} = \mu_{\text{target}} \hat C_{\text{target}} (PP - PP_{op})$ is dimensionally consistent

 

*   **Law of Prediction (Equations (22)–(23))**
    *   Equation (22): $PP$ dimensionless. $\beta, \alpha$ dimensionless. $\kappa_{\text{eff}}$ dimensionless. $C, C_{op}, \hat C_{\text{target}}$ have $[\text{Complexity}]$. $(C-C_{op})/\hat C_{\text{target}}$ is dimensionless. Exponent argument is dimensionless. Equation is dimensionally consistent.
    *   Equation (23): $C, C_{op}, \hat C_{\text{target}}$ have $[\text{Complexity}]$. $\kappa_{\text{eff}}$ dimensionless. $\ln(\dots)$ dimensionless. The equation is dimensionally consistent.

*   **Reflexivity Constraint (Equation (48))**
     *   Equation (48): $\Delta I \cdot (\Delta S_{min}/k_B) \ge \kappa_r > 0$. $\Delta I$ is dimensionless (nats). $\Delta S_{min}/k_B$ is dimensionless (nats). $\kappa_r$ must be dimensionless. Table H.1 states $\kappa_r$ is dimensionless. Consistent.

*   **Area Law (Equation (71))**
     *   Equation (71): $S_{max}$ has dimensions $[E][\Theta]^{-1}$. $k_B$ has $[E][\Theta]^{-1}$. $\mathcal A$ has $[L]^{2}$. $L_P$ has $[L]$. $S_{max} = \frac{[E][\Theta]^{-1} [L]^2}{[L]^2} = [E][\Theta]^{-1}$. Equation is dimensionally consistent.

*   **Emergent $G$ (Equation (E.9))**
    *   Equation (E.9) from Appendix E is $G = \frac{\eta \delta^2 c^3}{4 \hbar \chi C_{\max}(f_{\mathrm{RID}})}$. $G$ has dimensions $[M]^{-1}[L]^3[T]^{-2}$. For the RHS: $\eta$ is dimensionless (1), $\delta$ has dimensions $[L]$, $c$ has $[L][T]^{-1}$, $\hbar$ has $[E][T]$, $\chi$ is dimensionless (1), and $C_{\max}$ is dimensionless (1).
    RHS dimensions: $\frac{1 \cdot [L]^2 \cdot ([L][T]^{-1})^3}{[E][T] \cdot 1 \cdot 1} = \frac{[L]^2 [L]^3 [T]^{-3}}{[E][T]} = \frac{[L]^5 [T]^{-3}}{[M][L]^2[T]^{-2} [T]} = \frac{[L]^5 [T]^{-3}}{[M][L]^2[T]^{-1}} = [M]^{-1}[L]^3[T]^{-2}$.
    Equation is dimensionally consistent.

*   **Einstein Field Equations (Equation (76))**
    *   Equation (76): $R_{\mu\nu}$ has dimensions $[L]^{-2}$. Ricci scalar $R$ has $[L]^{-2}$. $\Lambda$ has $[L]^{-2}$. $g_{\mu\nu}$ is dimensionless metric component. $T_{\mu\nu}$ has $[E][L]^{-3}$. $G$ has $[M]^{-1}[L]^3[T]^{-2}$, $c$ has $[L][T]^{-1}$. The term $\frac{8\pi G}{c^4} T_{\mu\nu}$ must also have dimensions $[L]^{-2}$. Checking the dimensions: $\frac{[G]}{[c^4]} [T_{\mu\nu}] = \frac{[M]^{-1}[L]^3[T]^{-2}}{[L]^4[T]^{-4}} [E][L]^{-3} = [M]^{-1}[L]^{-1}[T]^{2} [E][L]^{-3}$. Using $[E]=[M][L]^2[T]^{-2}$, this becomes $[M]^{-1}[L]^{-1}[T]^{2} ([M][L]^2[T]^{-2}) [L]^{-3} = [L]^{-2}$. Each term in the EFE carries dimensions of $[L]^{-2}$. Equation is dimensionally consistent.

*   **Certificate-Relative SPAP Complexity Bound (Equation (B.5))**
    *   On a registered quantitative task carrying the Bernoulli reduction, independence, confidence, and operation-count certificate of Appendix B.3,
 $$
        C_{\text{uni}}(\delta_{\rm SPAP}) = \Omega\left(\frac{\log(1/\delta_{\rm SPAP})}{(\delta_{\rm SPAP})^2}\right).
        $$
$C_{\text{uni}}$ is the dimensionless count of the registered verification/update operations, and $\delta_{\rm SPAP}$ is the dimensionless preregistered target margin relative to the certified class-specific boundary. The logarithm therefore has a dimensionless argument. This dimensional check does not construct the boundary, identify the target with an observed score, or discharge the certificate.

## H.4 Vacuum-Based Estimate of the Acceleration Scale $g_{0}$

The empirical acceleration scale is compared with the cosmological sector only through a staged bridge. The five-mode Appendix-U working-prefactor value $\Lambda L_P^2=(2.88\pm0.03)\times10^{-122}$ is a reference conversion. On the four-mode route, Theorem U.13b proves only sampled-angular Hessian nullity $m_4=4$; $\mathfrak C_{U,\mathrm{mark}}$ gives the independent carrier index $142$, Proposition U.14's premise gives action $284$, $\mathfrak F_U^{(4)}$ gives a Euclidean weight, and $\mathfrak R_\Lambda^{(4)}$ alone gives a physical $\Lambda_4L_P^2$. No complete instance is accepted. Any claim for $g_0$ additionally requires its own acceleration/dark-response realization, unit, and covariance certificate.

### H.4.1 de Sitter temperature

The vacuum energy density associated with the cosmological constant $\Lambda$ is given by the relation in Einstein's Field Equations (Theorem 50):
$$
\rho_{\text{vac}}=\frac{c^{4}\Lambda}{8\pi G}.
\tag{H.1}
$$
An inertial observer in de Sitter space (a vacuum solution with $\Lambda > 0$) perceives a thermal bath with the Gibbons–Hawking temperature [Gibbons & Hawking 1977]:
$$
T_{dS}=\frac{\hbar c \sqrt{\Lambda/3}}{2\pi k_{B}}.
\tag{H.2}
$$

### H.4.2 Crossover Scale from Information Resolution

**Proposition H.1 (Acceleration Scale from Information Resolution).**

If the MPU network's parameter relaxation is triggered when local information gradients become indistinguishable from cosmic vacuum fluctuations—operationally, when the local Unruh temperature drops to the de Sitter temperature (as motivated in Appendix I, Section I.5.1)—then the crossover acceleration scale is:
$$
a_0 = c^2\sqrt{\frac{\Lambda}{3}}
\tag{H.3}
$$

*Proof.* On the de Sitter branch, the selected detector has the Gibbons--Hawking temperature [Gibbons & Hawking 1977]:
$$
T_{dS} = \frac{\hbar c}{2\pi k_B}\sqrt{\frac{\Lambda}{3}}
$$

An MPU experiencing proper acceleration $a$ behaves as a thermal detector at Unruh temperature [Unruh 1976]:
$$
T_U(a) = \frac{\hbar a}{2\pi c k_B}
$$

Parameter relaxation is triggered when $T_U(a_0) = T_{dS}$, yielding $a_0 = c^2\sqrt{\Lambda/3}$. ∎

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

Let $\vartheta$ be a registered dimensionless acceleration-deformation coordinate. The efficiency factor $\eta'$ is a dimensionless bridge response constructed from QFI norm ratios with respect to $\vartheta$ and a separately declared generator-amplitude normalization. The factor $1/\sqrt{K_0}$ is an amplitude convention; it is not the scaling law of SLD QFI under generator rescaling.

**Definition H.0 (Gravitational Efficiency - Hybrid Bridge Law).**
Define
$$
\eta' := \frac{F_{\mathrm{grav}}}{M_{\mathrm{sp}}},
\tag{H.4.BL}
$$
where $F_{\mathrm{grav}}$ is the dimensionless bridge-response ledger of Definition H.0a and $M_{\mathrm{sp}}=M/(D-1)=24/3=8$ on the equal-channel decomposition branch.

**Definition H.0a (Dimensionless Gravitational Bridge Response).**
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
w_{\mathrm{cmp}}(C)
\mathbb E\!\left[\|\Pi_{\mathrm{sp}}\Pi_{\mathrm{act}}\hat X\|^2\right]
\frac{1}{\sqrt{K_0}}M_{\mathrm{sp}},
\tag{H.4.F}
$$
where $w_{\mathrm{cmp}}(C):=C/\varepsilon_0$, and where $1/\sqrt{K_0}$ is the declared amplitude normalization of the discrete generator. If the generator itself parameterizes a unitary statistical family, its SLD QFI scales by $1/K_0$ under $G\mapsto G/\sqrt{K_0}$; the hybrid ledger above does not identify its amplitude factor with that QFI scaling.

Substitution gives
$$
\eta'(C)
=
w_{\mathrm{cmp}}(C)
\left(\frac{a}{d_0}\right)
\left(\frac{D-1}{D}\right)
\left(\frac{1}{\sqrt{K_0}}\right),
\qquad
w_{\mathrm{cmp}}(C)=\frac{C}{\varepsilon_0}.
\tag{H.4a}
$$
The numerical value in this bridge law is therefore conditional on the two displayed projection identities, the equal-channel decomposition, and the independent generator-amplitude convention.

#### H.4.2.2 Factor 1: Active Participation Fraction ($a/d_0 = 1/4$)

**Theorem H.1a (Isotropy Average for Active Subspace).**
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

#### H.4.2.3 Factor 2: Structural Comparison Weight and Registered Repetition ($w_{\mathrm{cmp}}=2$)

**Theorem H.1b (QFI Additivity for Independent Repetitions).**
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
- The structural binary reference is $\varepsilon_0=\ln2$; it is not asserted to be a universal physical reset-entropy floor.
- At the PCE-optimal operating point, the adopted bridge convention has $C_{\mathrm{max}}^*=2\varepsilon_0$ (Appendix Q, Equation Q.10), hence $w_{\mathrm{cmp}}(C_{\mathrm{max}}^*)=2$.
- The acceleration-lock branch additionally registers two independent identically prepared comparison copies at that operating point. For this integer realization, Theorem H.1b gives the QFI multiplier $N_{\mathrm{cmp}}=2$.
- If either copy requires an irreversible physical reset, its implementation must separately satisfy $\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)$; a positive physical floor requires a registered $H_q(P\mid R)\ge h_{\min}>0$.

Thus the factor $2$ is exact inside the adopted structural-slot plus two-copy bridge branch. It is not derived from Landauer accounting alone.

#### H.4.2.4 Factor 3: Spatial Projection ($(D-1)/D = 3/4$)

**Theorem H.2 (Isotropic Projection Efficiency).**
*Let $v$ be isotropically distributed in $\mathbb{R}^D$ with $0<\mathbb{E}[|v|^2]<\infty$. Let $P$ project onto a $(D-1)$-dimensional hyperplane. Then:*
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

**Physical Interpretation:** The factor applies to a positive-definite four-dimensional QFI tangent variable with a Euclidean-rotationally isotropic registered ensemble and a rank-three projector orthogonal in that QFI metric. In Lorentzian spacetime, $a^\mu u_\mu=0$ places the four-acceleration in the three-dimensional rest space orthogonal to $u^\mu$; it does not remove one statistically isotropic Euclidean component from a four-dimensional acceleration ensemble. Therefore Theorem H.2 establishes only the Euclidean codimension-one identity unless a separate certificate supplies a positive-definite QFI/rest-space isometry, the required isotropic ensemble, and the rank-three orthogonal projection. No physical observable fraction $3/4$ follows without that certificate.

#### H.4.2.5 Factor 4: Democratic Generator Normalization ($1/\sqrt{K_0} = 1/\sqrt{3}$)


**Theorem H.1c (Democratic Generator Normalization on the Product-Mixed Register).**
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

**Theorem H.3 (Multiplicative Structure under Factorized Scalar Coarse-Graining).**
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
Iterating this identity across the active-subspace projection, spatial projection, and generator normalization yields the product of their scalar factors. The repetition factor multiplies independently by QFI additivity when the repetitions are i.i.d. Hence, under these factorization hypotheses, the total bridge-law coefficient is the product of the displayed factors. ∎

**Application to the Four Factors:**

1. **$\Pi_{\mathrm{act}}$ (active participation):** Scalar factor $a/d_0$ by Theorem H.1a
2. **$\Pi_{\mathrm{sp}}$ (spatial projection):** Scalar factor $(D-1)/D$ by Theorem H.2
3. **Normalization:** Factor $1/\sqrt{K_0}$ by Theorem H.1c
4. **Comparison-slot/repetition factor:** Structural weight $w_{\mathrm{cmp}}(C)=C/\varepsilon_0$ by the bridge convention; at the operating point $w_{\mathrm{cmp}}=N_{\mathrm{cmp}}=2$, and Theorem H.1b applies to the registered i.i.d. realization

The chain $\Pi_{\mathrm{sp}} \circ \Pi_{\mathrm{act}}$ is multiplicative once the scalar-action hypothesis is imposed:
$$
\mathbb{E}[|\Pi_{\mathrm{sp}} \Pi_{\mathrm{act}} \hat{X}|^2] = \frac{a}{d_0} \cdot \frac{D-1}{D}\,\mathbb{E}[|\hat X|^2].
$$

At the operating point, the registered integer repetition count multiplies by QFI additivity in the i.i.d. setting. The structural weight $w_{\mathrm{cmp}}(C)$ is a bridge coordinate; away from the integer operating point its continuous use is a T2 interpolation rather than a consequence of the tensor-product QFI theorem. The normalization factor is multiplicative by construction.

**Therefore:** the product structure holds under:
1. scalar action on the already coarse-grained quadratic form at each stage,
2. the registered two-copy i.i.d. realization at the operating point,
3. the structural interpolation convention for $w_{\mathrm{cmp}}(C)$ away from that point, and
4. multiplicative generator normalization.

#### H.4.2.7 Why Only These Four Factors (Completeness)

**Theorem H.4 (Pointwise QFI Does Not Determine Curvature Corrections).**
For a smooth state family $\rho(\theta)$, the SLD quantum Fisher tensor is the quadratic coefficient in the Bures line element,
$$
ds_{\rm Bures}^2=\frac14F_{ij}(\theta)\,d\theta^i d\theta^j.
$$
The value of $F_{ij}$ at one parameter point does not determine derivatives of that metric and therefore does not determine its intrinsic curvature, Van Vleck--Morette coefficients, or heat-kernel coefficients.

*Proof.* Intrinsic curvature depends on first and second derivatives of the metric in a coordinate chart, whereas the pointwise bilinear form supplies only the value of the metric. Two smooth metrics can agree at one point and have different derivatives and curvature there. Consequently no curvature correction is derivable from pointwise QFI data alone. This statement does not prohibit $F_{ij}(\theta)$ from depending on an independently supplied spacetime-curvature parameter through the state family. $\square$

**Consequence:** A bridge class may exclude curvature-dependent coefficients by an explicit locality convention. Such exclusion is a defining hypothesis of that bridge class, not a consequence of QFI being quadratic.

#### H.4.2.8 Combined Result

Combining the four factors within the bridge-law normalization and the factorized scalar coarse-graining ansatz of Theorem H.3 at the operating point $C=C_{\mathrm{max}}^*=2\varepsilon_0$, with the registered two-copy realization $w_{\mathrm{cmp}}=N_{\mathrm{cmp}}=2$:
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

**Definition H.4.2.8a (Factor-Certified Gravity Bridge-Law Class).** Let $\mathcal B_H$ be the class of bridge laws assigning a positive dimensionless coefficient $\eta$ to
$$
g_0(\eta)=\eta c^2\sqrt{\frac{\Lambda}{3}}.
$$
A member of $\mathcal B_H$ carries all of the following records:

1. a dimensionless deformation coordinate and the hybrid response ledger of Definitions H.0–H.0a;
2. two i.i.d. comparison copies at $C=C_{\max}^*=2\varepsilon_0$;
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

**Theorem H.4.2.8b (Normalization on the Factor-Certified Bridge Class).** Every bridge law in $\mathcal B_H$ has
$$
\eta(C)=
w_{\mathrm{cmp}}(C)
\left(\frac{a}{d_0}\right)
\left(\frac{D-1}{D}\right)
\left(\frac1{\sqrt{K_0}}\right),
\qquad
w_{\mathrm{cmp}}(C)=\frac{C}{\varepsilon_0}.
$$
At $C=C_{\max}^*=2\varepsilon_0$, $a=2$, $d_0=8$, $D=4$, and $K_0=3$,
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

**Corollary H.4.2.8c (Acceleration Lock).** In the admissible QFI-gravity bridge-law class,
$$
g_0
=
\frac{3}{8\sqrt3}c^2\sqrt{\frac{\Lambda}{3}}
=
\frac{c^2\sqrt{\Lambda}}8.
$$
The coefficient has no free fit parameter once the upstream PU structural data and the QFI bridge-law class are fixed. This corollary fixes only the acceleration scale. It does not determine a galaxy response kernel, a cluster/lensing kernel, anisotropic stress, homogeneous late-time law, or backreaction constants; those require the separate covariant dark-susceptibility/effective-action certificate of Definition I.13d.

*Proof.* Substitute the unique value of $\eta'$ from Theorem H.4.2.8b into $g_0=\eta'c^2\sqrt{\Lambda/3}$. Since $\sqrt{\Lambda/3}/\sqrt3=\sqrt\Lambda/3$, the coefficient is $(3/8)(1/3)=1/8$. The remaining response kernels require a conserved stress tensor or susceptibility map and are not arguments of the scalar bridge-law normalization. ∎

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
This is an arithmetic central-value comparison on the adopted bridge-law branch. It neither derives Definition H.0 nor identifies $g_0^{\mathrm{branch}}$ with the realized Milgrom scale; that identification requires an independent physical-realization certificate.


#### H.4.3.1 Uncertainty Budget

This budget uses the paper-wide Convention P.14.1c. The value of $\eta'$ has no fitted numerical degree of freedom after Definition H.0 and Equation H.4b are adopted, but that adoption is a T2 bridge-law dependency.

**T1 (internal truncation/control):**
The algebraic factors in Equation H.4b are exact inside the adopted bridge law:
- **QFI isotropy average:** exact under Theorem H.1a;
- **structural-ratio arithmetic:** $C_{\mathrm{max}}^*=2\varepsilon_0$ and hence $w_{\mathrm{cmp}}=2$ on the named operating-point branch; the existence of two physical i.i.d. copies is the T2 bridge condition recorded below;
- **dimensional projection:** $(D-1)/D=3/4$ for $D=4$;
- **democratic generator normalization:** $1/\sqrt{K_0}=1/\sqrt{3}$.

Numerical rounding gives $\delta\eta'/\eta' \lesssim 10^{-5}$, so the T1 contribution is negligible at the displayed precision.

**T2 (bridge/branch/convention):**
Definition H.0 is the active bridge-law normalization connecting the QFI linear-response coefficient to the galactic acceleration channel. Its T2 data include the structural interpolation $w_{\mathrm{cmp}}(C)=C/\varepsilon_0$ and the registered two-copy i.i.d. realization at $C=C_{\mathrm{max}}^*=2\varepsilon_0$. Conditional on those entries,
$$
\eta'=\frac{3}{8\sqrt3}.
$$
The physical reset ledger remains separate and does not set this factor through Landauer accounting alone. Thus the T2 status dependency is present, but its numerical uncertainty is zero inside the adopted bridge law. Alternative slot interpolations or implementations without the registered two-copy realization are different T2 branches, not variations of a fitted parameter.

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

The empirical $g_0$ inferred from galaxy data has systematic uncertainties at the tens-of-percent level, dominated by astrophysical systematics and calibration choices [McGaugh et al. 2016; Lelli et al. 2017].

**Technical factor table:**

| Source | Category | Magnitude | Type |
|--------|----------|-----------|------|
| $\eta'$ algebra after Definition H.0 / Equation H.4b | T1 | $<0.01\%$ | internal rounding / truncation negligible |
| Definition H.0 + operating-point normalization | T2 | $0$ inside the adopted branch | bridge-normalization status dependency |
| $\Lambda$ input (Eq. V.5) | T3 | $1.7\%$ in $g_0$ at $2\sigma$ | observational propagation |
| Empirical $g_0$ extraction | T3 | order $20\%$ | astrophysical systematic |

The approximately $2\%$ central-value difference is within the quoted empirical systematic uncertainty, but this arithmetic compatibility does not validate the bridge law.

**Remark H.1.** Writing $H_\Lambda=c\sqrt{\Lambda/3}$ gives $a_0=cH_\Lambda$. On the adopted Definition H.0 branch, $g_0^{\mathrm{branch}}=\eta'cH_\Lambda$ with $\eta'=3/(8\sqrt3)$. This supplies a candidate acceleration--vacuum relation; no realized galactic connection follows without an independently accepted observable and response certificate.

**Remark H.2 (Factor ledger).** Equation (H.4b) follows on the factor-certified bridge-law class of Definition H.4.2.8a by multiplying $a/d_0$, $w_{\mathrm{cmp}}(C)$, $(D-1)/D$, and $1/\sqrt{K_0}$, with $w_{\mathrm{cmp}}=N_{\mathrm{cmp}}=2$ on the registered operating-point branch. Theorem H.1b supplies QFI additivity for the two-copy realization, Theorem H.1c supplies the product-mixed-register amplitude normalization, and Theorem H.3 supplies multiplication under factorized scalar action. Theorems H.1a and H.2 establish the corresponding Haar-vector and Euclidean-projection identities but do not replace the active- and spatial-tangent contraction certificates. Together with Proposition H.1, the complete factor-certified record yields $g_0$ via Equations (H.4)–(H.6) with no additional fitted numerical parameter inside that branch.

**Remark H.3 (Shared geometric input).** The attractor geometry $\mathrm{Gr}(2,8)$ supplies the rank data $a=2$ and $d_0=8$ and determines the QFI spectrum used in Appendix Z; it also enters the electroweak matching analysis in Appendix T. The structural comparison weight, the value $D=4$, the register count $K_0=3$, the two tangent-contraction certificates, the equal-channel decomposition, and the generator-amplitude convention are separate inputs to Equation (H.4b).

**Remark H.4 (Operating Point Universality).** If a system operates near the PCE-optimal structural capacity $C=C_{\mathrm{max}}^*=2\varepsilon_0$ (Appendix Q, Equation Q.10), remains in the factor-certified class $\mathcal B_H$ of Definition H.4.2.8a, and retains the same non-$C$ contraction, equal-channel, factorization, and amplitude records, then Equation (H.4a) fixes $\eta'$ near its attractor value. On that common branch, $g_0$ is approximately universal across such systems.

**Corollary H.1 (Bridge-Conditional Galactic Scale and Cosmological Acceleration Lock).**
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

**Corollary H.1a (Critical Baryonic Surface-Density Scale).**
For a thin baryonic sheet with surface density $\Sigma_b$, the Newtonian midplane field is $g_N = 2\pi G\Sigma_b$. The crossover to the low-acceleration galactic regime occurs when $g_N = g_0$. Hence the characteristic baryonic surface-density scale is
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
The two-significant-figure value $g_0\approx1.18\times10^{-10}\,\mathrm{m\,s^{-2}}$ elsewhere is the rounded display of the same central value. Uncertainties in $G$ and the unit-conversion constants are negligible at the displayed precision.

*Proof.* For an infinite thin sheet, Gauss's law gives $g_N = 2\pi G\Sigma_b$. Setting $g_N=g_0$ defines the transition scale, so $\Sigma_\dagger=g_0/(2\pi G)$. Substituting Corollary H.1 gives
$$
\Sigma_\dagger
=
\frac{1}{2\pi G}\frac{c^2\sqrt{\Lambda}}{8}
=
\frac{c^2\sqrt{\Lambda}}{16\pi G}.
$$
The numerical value follows by inserting Equation H.6. ∎

**Remark H.1a.1.** The quantity $\Sigma_\dagger$ is a conditional PU output fixed by the acceleration-lock bridge once $\Lambda$ and the thin-sheet crossover mapping are specified. It is not an input-free prediction.

**Remark H.1a.2 (Cosmological-Input Dependence of the Acceleration Lock).** The observational-input evaluations of $g_0$, $\Sigma_\dagger$, $A_{\mathrm{eff}}^{(\mathrm{obs})}$, and $A_{\mathrm{eff}}^{(\mathrm{obs},4)}$ use the Appendix V hybrid diagonal-input convention formed from the rounded Planck 2018 base-$\Lambda$CDM marginals in Equations (V.4)–(V.5),
$$
H_0=67.4\pm0.5\,\mathrm{km\,s^{-1}\,Mpc^{-1}},
\qquad
\Omega_\Lambda=0.6889\pm0.0056
$$
[Planck Collaboration 2020a]. These inputs are not treated as a covariance-aware joint Planck posterior. Their numerical values inherit the declared diagonal convention; the exact bridge relation remains
$$
16\pi G\Sigma_\dagger=c^2\sqrt{\Lambda}.
$$
As a sensitivity calculation, replace the Planck value of $H_0$ by
$$
H_0=73.04\pm1.04\,\mathrm{km\,s^{-1}\,Mpc^{-1}}
$$
[Riess et al. 2022], retain the Planck value and uncertainty for $\Omega_\Lambda$, and treat the quoted uncertainties as independent. Then
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

**Corollary H.1b (Redshift Lock on the Constant-$\Lambda$ Branch).**
Let the acceleration-lock representative be evaluated on a cosmological branch with effective vacuum curvature $\Lambda_{\mathrm{eff}}(z)$. Then the bridge acceleration scale evolves as
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

**Theorem H.5 (Per-Channel Normalization on an Equal-Channel Decomposition).**
Assume the $M$-dimensional interface-mode space decomposes as an orthogonal direct sum of $D-1$ spatial-channel subspaces of equal dimension. Then
$$
M_{\mathrm{sp}}=\frac{M}{D-1}.
$$
For $M=24$ and $D=4$, $M_{\mathrm{sp}}=8$.

**Remark H.5.1 (Sector-Dependent Mode-Count Selection).** On this equal-channel branch, the gravitational denominator is $M_{\mathrm{sp}}=8$. The counts $M=24$ and $k=12$ belong to the spacetime/channel-matching and gauge/code ledgers, respectively, and are not substituted for $M_{\mathrm{sp}}$ in Definition H.0.

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

The linear-response derivation (Section H.4.2) yields $\eta' = 3/(8\sqrt{3})$ exactly at the attractor. Higher-order corrections involving curvature enter only for:
- Off-attractor states (environmental variations)
- Large parameter shifts (beyond linear response)
- Geodesic focusing effects (finite "diffusion time")

**Effective Curvature on the Democratic Visible-Response Branch.** The symmetric-space geometry of $\mathrm{Gr}(2,8)$ gives $K_{\mathrm{avg}}^{\mathrm{Bures}}=32/23$. On the additional democratic visible-response branch $L_{\mathrm{vis}}=1/(ad_0)$ of Theorem Z.24 and Corollary Z.11,
$$
K_{\mathrm{eff}} = K_{\mathrm{avg}}^{\mathrm{Bures}} \cdot \frac{M-1}{ad_0} = \frac{32}{23} \cdot \frac{23}{16} = 2.
\tag{H.11}
$$

The factor $L_{\mathrm{vis}}=1/(ad_0)$ is a response-model input. Lemma Z.24a establishes that it does not follow from symmetric-space isotropy.

**Van Vleck-Morette Expansion.** Let $K>0$ and set $x=\sqrt{K}t$. For $|x|<\pi$, transverse Jacobi-mode focusing gives [DeWitt & Brehme 1960]
$$
\ln\left(\frac{\sqrt{K}t}{\sin(\sqrt{K}t)}\right)
= \frac{Kt^2}{6}+\frac{K^2t^4}{180}+R_6(K,t),
\qquad |R_6(K,t)|\le C_r K^3|t|^6
\tag{H.18}
$$
for every $r<\pi$ and all $|\sqrt{K}t|\le r$, where $C_r<\infty$ depends only on $r$.

The bridge coefficient $\eta'$ is the quadratic-response coefficient evaluated at $t=0$. Consequently the $K^2t^4/180$ term and $R_6(K,t)$ contribute only to finite-deviation corrections and do not enter $\eta'$ at the attractor.

**Conditional environmental interpolation.** Off-operating-point behavior may be modeled at leading order by evaluating the T2 bridge interpolation $w_{\mathrm{cmp}}(C)=C/\varepsilon_0$ at $C\neq C_{\mathrm{max}}$, with (H.18) governing higher-order finite-deviation effects when needed. Fractional values of $w_{\mathrm{cmp}}$ are susceptibility weights, not fractional physical reset or sample counts.

### H.4.7 Conditional Environmental Bridge Benchmarks

For systems assigned an off-operating structural weight, the following values are conditional interpolation benchmarks rather than consequences of the integer-copy QFI theorem.

**Void-galaxy benchmark.** If a branch assigns $C_{\mathrm{void}}=\varepsilon_0$, so $w_{\mathrm{cmp}}=1$:
$$
\eta'_{\mathrm{void}} = 1 \times \frac{1}{4} \times \frac{3}{4} \times \frac{1}{\sqrt{3}} \approx 0.108, \quad g_{0,\mathrm{void}} \approx 5.9 \times 10^{-11}\,\mathrm{m/s^2}
\tag{H.27}
$$

The ratio to the registered operating-point branch is $g_{0,\mathrm{void}}/g_0 \approx 0.50$.

*Conditional observable:* Such a branch would make void galaxies appear more Newtonian than field galaxies, requiring less "dark matter" enhancement.

**Ultra-diffuse-galaxy benchmark.** If a branch assigns $C_{\mathrm{UDG}}=\varepsilon_0/2$, so $w_{\mathrm{cmp}}=0.5$:
$$
\eta'_{\mathrm{UDG}} = 0.5 \times \frac{1}{4} \times \frac{3}{4} \times \frac{1}{\sqrt{3}} \approx 0.054, \quad g_{0,\mathrm{UDG}} \approx 2.9 \times 10^{-11}\,\mathrm{m/s^2}
\tag{H.28}
$$

*Conditional observable:* This interpolation would make UDGs exhibit nearly Newtonian dynamics to larger radii. Some ultra-diffuse galaxies have been reported to be "dark matter deficient" (e.g., DF2) [van Dokkum et al. 2018], but that observation does not derive the structural weight; it can only test a weight fixed independently before comparison.

Determining $C$ for a specific system requires an independently specified operational bridge from the system to its structural per-cycle information budget in the sense of Appendix Q. Once that T2 bridge is fixed, Equations (H.4a) and (H.27)–(H.28) give the corresponding conditional $g_0(C)$.

## H.8 Derivation Summary: The Bridge Law

The bridge law combines four independent factors into one conditional acceleration scale.

**Technical ledger.**

**Table H.2: Complete Derivation Chain for η'**

| Step | Factor | Value | Theorem | Source |
|:-----|:-------|:------|:--------|:-------|
| 1 | Structural comparison weight / registered repetition | $w_{\mathrm{cmp}}=N_{\mathrm{cmp}}=2$ at $C=2\varepsilon_0$ | bridge registration plus QFI additivity for two i.i.d. copies | Definition H.0a; Theorem H.1b |
| 2 | Active participation | $a/d_0 = 1/4$ | Isotropy (Haar average) | Representation theory |
| 3 | Spatial projection | $(D-1)/D = 3/4$ | Rotational invariance | Linear algebra |
| 4 | Generator normalization | $1/\sqrt{K_0} = 1/\sqrt{3}$ | Variance normalization (H.1c) | Discrete generator normalization |
| 5 | Product structure | Multiply | Sequential coarse-graining | Symmetry argument |
| 6 | Curvature exclusion | N/A | Linear response | Differential geometry |

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

The quoted value is an arithmetic evaluation after Definition H.0 and an external $\Lambda$ are supplied. Its ratio to a representative empirical central value near $1.2\times10^{-10}\,\mathrm{m/s^2}$ is approximately $0.98$; this central-value comparison is not a validation probability, uncertainty coverage statement, or derivation of the bridge.

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

Through careful dimensional analysis, all core PU equations are shown to be homogeneous according to the defined units. The Unruh–de Sitter temperature matching criterion (Proposition H.1) yields the cosmic acceleration floor $a_0 = c^2\sqrt{\Lambda/3}$.

The efficiency factor $\eta' = 3/(8\sqrt{3}) \approx 0.2165$ takes this value within the hybrid, factor-certified bridge-law class of Definition H.4.2.8a after its four registered coefficients are inserted:

| Factor | Value | Source |
|--------|-------|--------|
| Active-tangent contraction | $a/d_0 = 1/4$ | active contraction certificate; Theorem H.1a supplies the analogous Haar-vector identity |
| Structural comparison weight / registered repetition | $w_{\mathrm{cmp}}=N_{\mathrm{cmp}}=2$ at $C=2\varepsilon_0$ | bridge registration plus QFI additivity for two i.i.d. copies |
| Spatial-tangent contraction | $(D-1)/D = 3/4$ | spatial contraction certificate; Theorem H.2 supplies the Euclidean isotropic identity |
| Generator-amplitude normalization | $1/\sqrt{K_0} = 1/\sqrt{3}$ | product-mixed-register calculation and independent amplitude convention of Theorem H.1c |

The resulting branch value $g_0\approx1.18\times10^{-10}\,\mathrm{m/s^2}$ is about $2\%$ below the representative empirical central value $1.2\times10^{-10}\,\mathrm{m/s^2}$. This is central-value proximity only. Coverage requires a named galactic extraction likelihood, its calibration and astrophysical nuisance covariance, the cosmological-input covariance, and the bridge-law uncertainty in one preregistered comparison record. The same Grassmannian geometry enters the Appendix Z Thomson-limit sinc-core value $\alpha^{-1}_{0}=137.03609205522863\ldots$, whose arithmetic offset from the NIST/CODATA comparison central value is about $0.678$ ppm before residual closure.

The derivation is conditional on every record in Definition H.4.2.8a, including the structural interpolation, registered two-copy realization, two tangent contractions, equal-channel decomposition, factorized scalar action, and generator-amplitude convention. Physical reset entropy remains a separate implementation ledger.

Under that bridge-law normalization, the Appendix H acceleration scale $g_0=c^2\sqrt{\Lambda}/8$ is determined on the stated branch. The Appendix I length $L_0$ requires an independently registered baryonic profile or mass scale before it can be related to this acceleration. The parameters $L_0$, $A_G$, and $m$ of the Equation (I.4) interpolation remain phenomenological, and the response kernel, background-subtraction prescription, covariant completion, and matching data of Appendix I remain independent model inputs or certificate entries.





