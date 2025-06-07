# Appendix H: Dimensional Analysis and Emergent Scales

## H.1 Introduction

This appendix records the physical dimensions assigned to key symbols in the Predictive-Universe (PU) framework and verifies the dimensional homogeneity of its core equations. It then sketches how the empirical Milgrom acceleration scale $g_{0}$—used in Appendix I—might arise from the PU vacuum structure, relating $g_{0}$ to the cosmological constant $\Lambda$.

Standard SI base dimensions are used: Mass $[M]$, Length $[L]$, Time $[T]$, Energy $[E]=[M][L]^{2}[T]^{-2}$ and Temperature $[\Theta]$. Boltzmann’s constant $k_{B}$ carries $[E][\Theta]^{-1}$. Predictive Physical Complexity $[Complexity]$ is treated as a fundamental dimension unique to the PU framework, representing the non-algorithmic structural resources for prediction. Dimensionless information measures (nats) are noted where relevant. Factors of $c$ and $\hbar$ are kept explicit where needed for standard physics relations, but often $c=1, \hbar=1, k_B=1$ are used in derivations for simplicity.

## H.2 Dimensional Assignments

**Table H.1: Dimensions of Recurrent Symbols**

| Quantity                      | Symbol(s)                                                                        | Dimension                                            | Comment                                              |
| :---------------------------- | :------------------------------------------------------------------------------- | :--------------------------------------------------- | :--------------------------------------------------- |
| Predictive Physical Complexity | $C_{P}, K_{0}, C_{\text{agg}}, \hat{C}_{\text{target}}, \hat{C}_{v}$             | $[\text{Complexity}]$                                | structural / resource capacity                       |
| Probability / Performance     | $PP, Q, \alpha, \beta, \alpha_{\text{SPAP}}, \alpha_{\text{CC,max}}, \mathrm{CC}$ | $1$                                                  | dimensionless                                        |
| Information / Capacity        | $\Delta I, C_{\max}(f_{\text{RID}})$                                             | $1$                                                  | dimensionless (nats)                                 |
| Irreducible entropy (dimless) | $\varepsilon=\Delta S_{\min}/k_{B}\ge\ln2$                                       | $1$                                                  | dimensionless (nats per cycle)                       |
| Reflexivity constant          | $\kappa_{r}$                                                                     | $1$                                                  | dimensionless                                        |
| Physical cost rate            | $R(C), P_{\min}$                                                                 | $[E][T]^{-1}$                                        | power                                                |
| Info-cost rate                | $R_{I}(C), r_{I}$                                                                | $[E][T]^{-1}$                                        | power                                                |
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
| Empirical acceleration scale  | $g_{0}$                                                                          | $[L][T]^{-2}$                                        | Appendix I                                           |
| Transition-length scale       | $L_{0}$                                                                          | $[L]$                                                | scale at which $G(R)$ changes                        |
| Simulation steps / Horizon    | $\mathcal{T} \text{ (in Eq B.4)}$                                                 | $1$                                                  | Dimensionless count      
                                |

## H.3 Dimensional Consistency Checks

Using the dimensional assignments in Table H.1, we verify the dimensional homogeneity of the principal PU equations.

*   **Adaptation Dynamics (Equations (24), (30), (38))**
    *   Equation (24) defining $\Psi$: $\Psi$ has dimensions $[E][T]^{-1}[\text{Complexity}]^{-1}$. $\Gamma_{0}$ has $[E][T]^{-1}]$, $\partial PP/\partial C$ has $[\text{Complexity}]^{-1}]$ (PP dimensionless, $C$ has $[\text{Complexity}]$). $\lambda$ is dimensionless, $R'$ and $R_I'$ have dimensions $[E][T]^{-1}[\text{Complexity}]^{-1}]$. The equation $\Psi = \Gamma_0 (\partial PP/\partial C) - (\lambda R' + R_I')$ is dimensionally consistent.
    *   Equation (30) for $\dot C$: $dC/dt$ has dimensions $[\text{Complexity}][T]^{-1}$. $\eta_{\text{adapt}}$ has $[\text{Complexity}]^2 [E]^{-1}$, $\Psi$ has $[E][T]^{-1}[\text{Complexity}]^{-1}]$. The product $\eta_{\text{adapt}}\Psi$ has dimensions $[\text{Complexity}]^2 [E]^{-1} \times [E][T]^{-1}[\text{Complexity}]^{-1}] = [\text{Complexity}][T]^{-1}$. Equation (30) is dimensionally consistent.
    *   Equation (38) for $\dot{\hat C}_{\text{target}}$: $d\hat C_{\text{target}}/dt$ has dimensions $[\text{Complexity}][T]^{-1}]$. $\mu_{\text{target}}$ has $[T]^{-1}]$. $\hat C_{\text{target}}$ has $[\text{Complexity}]$. $(PP_{op}-PP)$ is dimensionless. The equation $\dot{\hat C}_{\text{target}} = \mu_{\text{target}} \hat C_{\text{target}} (PP_{op} - PP)$ is dimensionally consistent: $[\text{Complexity}][T]^{-1}] = [T]^{-1} \times [\text{Complexity}] \times 1$.

*   **Law of Prediction (Equations (22)–(23))**
    *   Equation (22): $PP$ dimensionless. $\beta, \alpha$ dimensionless. $\kappa_{\text{eff}}$ dimensionless. $C, C_{op}, \hat C_{\text{target}}$ have $[\text{Complexity}]$. $(C-C_{op})/\hat C_{\text{target}}$ is dimensionless. Exponent argument is dimensionless. Equation is dimensionally consistent.
    *   Equation (23): $C, C_{op}, \hat C_{\text{target}}$ have $[\text{Complexity}]$. $\kappa_{\text{eff}}$ dimensionless. $\ln(\dots)$ dimensionless. The equation is dimensionally consistent.

*   **Reflexivity Constraint (Equation (48))**
    *   Equation (48): $\Delta I \cdot (\Delta S_{min}/k_B) \ge \kappa_r$. $\Delta I$ is dimensionless (nats). $\Delta S_{min}/k_B$ is dimensionless (nats). $\kappa_r$ must be dimensionless. Table H.1 states $\kappa_r$ is dimensionless. Consistent.

*   **Area Law (Equation (71))**
    *   Equation (71): $S_{max}$ has dimensions $[E][\Theta]^{-1}]$. $k_B$ has $[E][\Theta]^{-1}]$. $\mathcal A$ has $[L]^{2}$. $L_P$ has $[L]$. $S_{max} = \frac{[E][\Theta]^{-1}] [L]^2}{[L]^2} = [E][\Theta]^{-1}$. Equation is dimensionally consistent.

*   Emergent $G$ (Equation (E.9))
    *   Equation (E.9) from Appendix E is $G = \frac{\eta \delta^2 c^3}{4 \hbar \chi C_{max}(f_{RID})}$. $G$ has dimensions $[M]^{-1}[L]^3[T]^{-2}]$. For the RHS: $\eta$ is dimensionless (1), $\delta$ has dimensions $[L]$, $c$ has $[L][T]^{-1}]$, $\hbar$ has $[E][T]$, $\chi$ is dimensionless (1), and $C_{\max}$ is dimensionless (1).
    RHS dimensions: $\frac{1 \cdot [L]^2 \cdot ([L][T]^{-1})^3}{[E][T] \cdot 1 \cdot 1} = \frac{[L]^2 [L]^3 [T]^{-3}}{[E][T]} = \frac{[L]^5 [T]^{-3}}{[M][L]^2[T]^{-2} [T]} = \frac{[L]^5 [T]^{-3}}{[M][L]^2[T]^{-1}} = [M]^{-1}[L]^3[T]^{-2}$.
    Equation is dimensionally consistent.

*   **Einstein Field Equations (Equation (76))**
    *   Equation (76): $R_{\mu\nu}$ has dimensions $[L]^{-2}]$. Ricci scalar $R$ has $[L]^{-2}]$. $\Lambda$ has $[L]^{-2}]$. $g_{\mu\nu}$ is dimensionless metric component. $T_{\mu\nu}$ has $[E][L]^{-3}]$. $G$ has $[M]^{-1}[L]^3[T]^{-2}]$, $c$ has $[L][T]^{-1}]$. $\frac{G}{c^4} T_{\mu\nu}$ has $\frac{[M]^{-1}[L]^3[T]^{-2}}{([L][T]^{-1})^4} [E][L]^{-3}] = \frac{[M]^{-1}[L]^3[T]^{-2}}{[L]^4[T]^{-4}} [E][L]^{-3}] = [M]^{-1}[L]^{-1}[T]^{2} [E][L]^{-3}]$. Using $[E]=[M][L]^2[T]^{-2}]$, this is $[M]^{-1}[L]^{-1}[T]^{2} [M][L]^2[T]^{-2} [L]^{-3}] = [L]^{-2}]$. Each term in the EFE carries dimensions of $[L]^{-2}$. Equation is dimensionally consistent.

*   **SPAP Complexity Bound (Equation (B.5))**
    *   Equation **(B.5)**: $C_{\text{uni}}$ dimensionless (dimensionless count of resources/operations). $T$ dimensionless (number of steps). **$\delta_{\rm SPAP}$** dimensionless (error margin). $1/(2\ln2)$ is dimensionless. $\log T$ is dimensionless. Equation $C_{\text{uni}}(\delta_{\rm SPAP},T)\;\ge\; \frac{T}{2\ln2}\,\frac{1}{(\delta_{\rm SPAP})^{2}} + \Omega(\log T)$ is dimensionally consistent if $C_{uni}$ and $T$ are both dimensionless counts. This aligns with the interpretation in **Theorem B.2**'s proof sketch that $C_{uni}$ is effective computational resources (count) and $T$ is steps (count).

## H.4 Vacuum-Based Estimate of the Acceleration Scale $g_{0}$

The empirical acceleration scale $g_0 \sim 1.2 \times 10^{-10} \text{ m s}^{-2}$ that appears in galaxy scaling relations (Appendix I) is comparable to $cH_0$ where $H_0$ is the Hubble constant, suggesting a link to cosmology. Within the PU framework, $\Lambda$ represents the energy density of the predictive vacuum state.

#### H.4.1 de Sitter temperature

The vacuum energy density associated with the cosmological constant $\Lambda$ is given by the relation in Einstein's Field Equations (Theorem 50):
$$
\rho_{\text{vac}}=\frac{c^{4}\Lambda}{8\pi G}.
\tag{H.1}
$$
An inertial observer in de Sitter space (a vacuum solution with $\Lambda > 0$) perceives a thermal bath with the Gibbons–Hawking temperature [Gibbons & Hawking 1977]:
$$
T_{dS}=\frac{\hbar \mathbf{c} \sqrt{\Lambda/3}}{2\pi k_{B}}.
\tag{H.2}
$$

#### H.4.2 Energy-matching hypothesis

 **Hypothesis H.1** The empirical acceleration scale $g_{0}$ represents a transition point where baryonic energy scales become comparable to the de Sitter vacuum thermal energy scale associated with the cosmological constant $\Lambda$. Specifically, the characteristic energy scale of baryonic matter (represented by proton mass $m_p$ and its Compton wavelength $\lambda_p$) in the transition regime is proportional to the de Sitter vacuum thermal energy:
 $$
 m_{p}g_{0}\,\lambda_{p}\;\simeq\;\eta'\,k_{B}T_{dS},
 \tag{H.3}
 $$
 where $m_{p}$ is the proton mass, $\lambda_{p}=\hbar/(m_{p}c)$ its Compton wavelength, and $\eta'$ is a dimensionless $\mathcal O(1)$ efficiency factor capturing details of the interaction between baryonic structure and the vacuum effects at this scale.

#### H.4.3 Closed-form expression

Combining Equation (H.2) for $T_{dS}$ and Equation (H.3) from Hypothesis H.1 allows us to express $g_0$ in terms of fundamental constants and $\Lambda$.
The standard relationship $T_{dS} = \frac{\hbar a}{2\pi c k_B}$ relates temperature to acceleration. For de Sitter space, the relevant acceleration is related to $c^2 \sqrt{\Lambda/3}$. So $T_{dS} = \frac{\hbar c^2 \sqrt{\Lambda/3}}{2\pi c k_B} = \frac{\hbar c \sqrt{\Lambda/3}}{2\pi k_B}$, which matches Equation (H.2).
The energy matching hypothesis $m_p g_0 \lambda_p \simeq \eta' k_B T_{dS}$ is dimensionally consistent, as both sides have units of Energy $[E]$.
Substituting $T_{dS} = \frac{\hbar c \sqrt{\Lambda/3}}{2\pi k_B}$ into the hypothesis:
$m_p g_0 (\hbar/(m_p c)) \simeq \eta' k_B (\frac{\hbar c \sqrt{\Lambda/3}}{2\pi k_B})$.
$g_0 \frac{\hbar}{c} \simeq \eta' \frac{\hbar c \sqrt{\Lambda/3}}{2\pi}$.
$g_0 \simeq \eta' \frac{c^2 \sqrt{\Lambda/3}}{2\pi}$.
$$
g_{0}\simeq\eta'\,\frac{c^{2}}{2\pi}\sqrt{\frac{\Lambda}{3}}.
\tag{H.4}
$$

**Theorem H.1 (Acceleration Scale from $\Lambda$).**
If Hypothesis H.1 holds, the empirical acceleration scale is given by:
$$
g_{0}=\eta'\,\frac{c^{2}}{2\pi}\sqrt{\frac{\Lambda}{3}}.
$$

**Remark H.1** Writing $H_{\Lambda}=c\sqrt{\Lambda/3}$ (the de Sitter Hubble parameter) yields $g_{0}=\eta' cH_{\Lambda}/(2\pi)$. Since current cosmological measurements suggest $H_{\Lambda}\approx H_{0}$ (the present-day Hubble constant), this relation implies $g_{0}\sim cH_{0}$.

#### H.4.4 Numerical estimate

Using the observed value of the cosmological constant $\Lambda \approx 1.10 \times 10^{-52}\,\mathrm{m}^{-2}$ (**from Planck 2018 results, for example**), $c \approx 3.00 \times 10^8 \text{ m/s}$, and $\sqrt{1/3} \approx 0.577$:
$$
\sqrt{\frac{\Lambda}{3}} \approx \sqrt{\frac{1.10 \times 10^{-52}\,\mathrm{m}^{-2}}{3}} \approx \sqrt{0.367 \times 10^{-52}\,\mathrm{m}^{-2}} \approx 0.606 \times 10^{-26}\,\mathrm{m}^{-1}
$$
$$
g_{0}\simeq\eta'\,\frac{(3.00\times10^8\,\mathrm{m/s})^{2}}{2\pi}\,(0.606\times10^{-26}\,\mathrm{m^{-1}})
$$
$$
g_{0}\simeq\eta'\,\frac{9.00\times10^{16}\,\mathrm{m^2/s^2}}{6.28}\,(0.606\times10^{-26}\,\mathrm{m^{-1}})
$$
$$
g_{0}\simeq\eta'\,(1.43\times10^{16}\,\mathrm{m^2/s^2})\,(0.606\times10^{-26}\,\mathrm{m^{-1}})
$$
$$
g_{0}\simeq\eta'\,(8.68\times10^{-11})\;\mathrm{m\,s^{-2}}.
\tag{H.5}
$$

Taking $\eta'=1.38$ reproduces the empirically observed value $g_{0}\simeq1.20\times10^{-10}\,\mathrm{m\,s^{-2}}$ used in phenomenological models (e.g., MOND [Milgrom 1983], or the Radial Acceleration Relation [McGaugh et al. 2016]).

 **Corollary H.1 (Parameter-Locked Gravity).**
 If Theorem H.1 holds, the scale-dependent gravity model of Appendix I has no free acceleration parameter: $g_{0}$ is fixed by the cosmological constant $\Lambda$ via Equation (H.4) and the efficiency factor $\eta'$.

## H.5 Conclusion

Through careful dimensional analysis, all core PU equations are shown to be homogeneous according to the defined units. A vacuum-energy matching hypothesis (Hypothesis H.1) leads to a derived relationship $g_{0}\propto c^{2}\sqrt{\Lambda}$ (Theorem H.1), providing a potential natural origin for the empirical Milgrom scale from the cosmological constant $\Lambda$. A numerical estimate shows consistency with observed values for a plausible $\mathcal{O}(1)$ efficiency factor $\eta'. If validated, this relation removes one phenomenological parameter from the scale-dependent gravity model of Appendix I and ties galaxy dynamics directly to fundamental constants and the properties of the cosmological vacuum.

