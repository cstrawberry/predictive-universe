# Appendix V: Computational Programs and Numerical Consistency Checks

This appendix provides computational programs for two constants within the Predictive Universe (PU) framework: the cosmological constant $\Lambda$ and the fine-structure constant $\alpha_{\mathrm{em}}$. The $\Lambda$ program evaluates the PU prediction $\Lambda L_P^2 = 8\pi A_{\text{eff}} e^{-2\kappa}$ using the derived instanton complexity $\kappa=141.5$ (Appendix U) and the PU-theory prefactor $A_{\text{eff}}=0.923\pm0.011$ (Corollary U.15b); the inversion form is included as a numerical consistency check that converts the observed $\Lambda L_P^2$ into $A_{\text{eff}}^{(\text{obs})}$ or an effective $\kappa$ under a chosen prefactor. The $\alpha_{\mathrm{em}}$ program gives a parametric, falsifiable roadmap that has zero continuously adjustable parameters once the baseline MPU invariants are computed from a specified model.

**Conventions.** Section V.1 uses SI units (with $c$ explicit). Sections V.2–V.2.5 use Heaviside–Lorentz units with $\hbar=c=1$; $\alpha_{\mathrm{em}}=e^2/(4\pi)$.

## V.0 Reproducibility Contract and Uncertainty Budgets

This appendix is intended to be mechanically reproducible from the displayed equations. An independent check should verify the following items without access to any unpublished derivations:

1. **Input ledger.** Fixed PU inputs: $K_0=3$, $d_0=2^{K_0}=8$, $\varepsilon=\ln 2$, $a=2$, $b=d_0-a=6$, $M=2a(d_0-a)=24$, and (for the semiclassical vacuum sector) $S_{\mathrm{inst}}=(C_{\max}/\varepsilon)\kappa=2\kappa$.
2. **$\Lambda$ forward evaluation + inversion check.** Using Equation (V.2) with the derived inputs $(\kappa,A_{\text{eff}})$ to compute the PU prediction for $\Lambda L_P^2$, and using Equations (V.4)–(V.5) together with Equation (V.3) to infer either $A_{\text{eff}}^{(\text{obs})}$ (holding $\kappa$ fixed) or an effective $\kappa$ (holding $A_{\text{eff}}$ fixed) from observational inputs $(H_0,\Omega_\Lambda,c,L_P)$.
3. **$\alpha_{\mathrm{em}}$ forward program.** Using Equation (V.8) to compute $u^*$ from $(M,\lambda,d_0)$ and Equation (V.10) to compute $\alpha^{-1}$ from $(u^*,K_0)$ including the explicit interface corrections.
4. **Uncertainty accounting.** Reported $1\sigma$ uncertainties separate (i) observational inputs, (ii) controlled truncation terms, and (iii) PU-to-physics mapping/systematic terms; when combined, they are combined in quadrature unless otherwise stated.

Numerical conventions: $\ln$ and $\exp$ denote the natural logarithm and exponential. Intermediate computations should retain at least 20 significant digits before final rounding; dimensionless combinations such as $\Lambda L_P^2$ should be formed exactly as written to avoid unit-conversion errors.

**Table V.0 — Consolidated numerical outputs and uncertainty budgets**

| Quantity | PU program | Central value | $1\sigma$ budget | Dominant contributions |
|:--|:--|:--|:--|:--|
| $\alpha^{-1}$ (Thomson limit) | Eqs. (V.8)–(V.10) with $K_0=3$, $d_0=8$, $M=24$, $u^*=8^{1/24}-1$ | $137.036092$ | $\pm 0.000050$ | interface-correction truncation and PU-to-QED matching (Appendix Z, Section Z.27.9); compare $\alpha_{\mathrm{em}}^{-1} = 137.035999177(21)$ [NIST 2024] |
| $\Lambda L_P^2$ (vacuum sector) | Eq. (V.2) with $\kappa=141.5$ and $A_{\text{eff}}=0.923\pm0.011$ (Appendix U) | $(2.88\times10^{-122})$ | $\pm 0.03\times10^{-122}$ | $A_{\text{eff}}$ theory/systematic dominates; Eq. (V.5) gives $(\Lambda L_P^2)_{\text{obs}}=(2.86599\pm0.04849)\times10^{-122}$, implying $A_{\text{eff}}^{(\text{obs})}=0.917\pm0.016$ |

## V.1 The Cosmological Constant: Inversion for the Instanton Complexity $\kappa$

### V.1.1 Foundational PU Equations for $\Lambda$

1. **Instanton action.** For the minimal vacuum fluctuation,

   $$
   \boxed{S_{\mathrm{inst}}=\left(\frac{C_{\max}}{\varepsilon}\right)\kappa = 2\,\kappa} \tag{V.1}
   $$

   where $C_{\max}/\varepsilon=2$ (rigorously derived in Appendix Q).

2. **Vacuum energy density.** The dimensionless combination $\Lambda L_P^2$ is

   $$
   \boxed{\Lambda L_P^2 \;\simeq\; 8\pi\,A_{\text{eff}}\,e^{-S_{\mathrm{inst}}}} \tag{V.2}
   $$

   with $A_{\text{eff}} := K\cdot N_{\text{eff}}$ an $O(1)$, **dimensionless** prefactor aggregating one‑loop determinants and extensivity (Appendix U, Section U.1).

   **Normalization note.** Using the Einstein equation convention $G_{\mu\nu}+\Lambda g_{\mu\nu}=8\pi G T_{\mu\nu}$ and $L_P^2=\hbar G/c^3$, the ratio $\Lambda L_P^2$ is dimensionless while the conventional $8\pi$ remains as a pure numerical factor multiplying the semiclassical instanton amplitude. All dimensionful contributions in the one-loop determinant and finite-volume counting are normalized by $L_P$, so the aggregated prefactor $A_{\text{eff}}$ is a **dimensionless** $O(1)$ constant.

3. **Inversion for $\kappa$.** Solving Equation (V.2) using Equation (V.1),

   $$
   \boxed{\kappa \;=\; -\tfrac12\,\ln\!\left(\frac{\Lambda L_P^2}{8\pi A_{\text{eff}}}\right)} \tag{V.3}
   $$

### V.1.2 Observational Inputs

* **Cosmological parameters (Planck 2018, base‑$\Lambda$CDM) [Planck Collaboration 2020a]:**
  $H_0=67.4\pm0.5~\mathrm{km\,s^{-1}\,Mpc^{-1}}$, $\Omega_{\Lambda}=0.6889\pm0.0056$.
* **Planck length (CODATA 2022) [NIST 2024]:**
  $L_P=1.616255(18)\times 10^{-35}~\mathrm{m}$.
* **Speed of light:** $c=299{,}792{,}458~\mathrm{m\,s^{-1}}$ (exact).

### V.1.3 Calculation of $\Lambda L_P^2$

Using

$$
\boxed{\Lambda \;=\; 3\left(\frac{H_0}{c}\right)^2\Omega_{\Lambda}} \tag{V.4}
$$

the central values give

$$
\Lambda \;=\; (1.09712 \pm 0.01856)\times 10^{-52}\ \mathrm{m^{-2}},
$$

and

$$
\boxed{\Lambda L_P^2 \;=\; (2.86599 \pm 0.04849)\times 10^{-122}} \tag{V.5}
$$

The quoted uncertainty is dominated by $H_0$ and $\Omega_{\Lambda}$; the relative uncertainty in $L_P$ is negligible at this precision.

### V.1.4 Consistency Check via Inversion

Using the PU-theory inputs $\kappa=141.5$ (Theorem U.16) and $A_{\text{eff}}=0.923\pm0.011$ (Corollary U.15b), Equation (V.2) gives $\Lambda L_P^2 = (2.88 \pm 0.03)\times10^{-122}$, consistent with the observed value (V.5) within the combined $1\sigma$ budget.

Setting $A_{\text{eff}}=1$ in Equation (V.3):

$$
\boxed{\kappa \;=\; -\tfrac12 \ln\!\left(\frac{2.86599\times10^{-122}}{8\pi}\right) \;=\; 141.543\ \pm\ 0.009} \tag{V.6}
$$

Holding $\kappa$ fixed, the observed value (V.5) implies the effective prefactor

$$
A_{\text{eff}}^{(\text{obs})} := \frac{\Lambda L_P^2}{8\pi e^{-2\kappa}} = \frac{\Lambda L_P^2}{8\pi e^{-283}} = 0.917 \pm 0.016,
$$

consistent with the PU-theory estimate $A_{\text{eff}}=0.923\pm0.011$ (Corollary U.15b).

For the PU-theory value $\kappa=141.5$ (Theorem U.16), the corresponding instanton action from Equation (V.1) is

$$
S_{\mathrm{inst}} = 2\kappa = 283~\text{nats} = 408.3~\text{bits}. \tag{V.7}
$$

**Sensitivity to $H_0$.** Since $\Lambda L_P^2 \propto H_0^2$, a shift $H_0\to H_0(1+\epsilon)$ changes $\kappa$ by $\Delta \kappa \simeq -\epsilon$; hence a 1% change in $H_0$ shifts $\kappa$ by $\sim 0.01$.

**Dependence on the $O(1)$ prefactor.** The dependence of $\kappa$ on the prefactor is modest ($\partial \kappa/\partial \ln A_{\text{eff}} = +\tfrac12$), as shown for representative $A_{\text{eff}}$ values in Table V.1. An error budget that separates observational and prefactor contributions is

$$
\sigma_\kappa^{2}\ \simeq\ \tfrac14\!\left[\ \sigma_{\ln(\Lambda L_P^{2})}^{\,2}\ +\ \sigma_{\ln A_{\text{eff}}}^{\,2}\ \right].
$$

**Table V.1 — Sensitivity of $\kappa$ to $A_{\text{eff}}$**

| $A_{\text{eff}}$ | 0.5     | **1.0**     | 2.0     | $\exp(1)\approx 2.718$ | 3.0     |
|:------:|:-------:|:----------:|:-------:|:---------------------:|:-------:|
| $\kappa$ | 141.20 | **141.54** | 141.89 | 142.04 | 142.09 |

Hence even an order-unity uncertainty in $A_{\text{eff}}$ shifts $\kappa$ by less than 1, whereas the derived $\kappa=141.5$ is fixed by the Golay-Steiner structure (Theorem U.16).

---

## V.2 Calculation of $\alpha_{\mathrm{em}}$ at the PCE-Attractor (Zero Continuously Adjustable Parameters)

This section provides the direct computational program for the fine-structure constant, as rigorously derived in **Appendix Z**. The calculation has zero continuously adjustable parameters, relying only on the framework's foundational constants.

### V.2.1 Foundational Inputs (Derived from PU First Principles)

*   **MPU Hilbert Space Dimension:** $d_0 = 8$ (from $K_0=3$ bits, Theorem 23).
*   **Irreducible Cost:** $\varepsilon = \ln 2$ nats (from SPAP cycle, Theorem 31).

### V.2.2 Derived Spectral Parameters for the PCE-Attractor

As derived in Appendix Z (Theorem Z.5) from the subspace structure induced by the Landauer Pointer mechanism, the QFI spectrum at the PCE-Attractor is flat and uniquely determined:
*   **Number of Information Modes:** $M = 2ab = 2 \cdot (e^\varepsilon) \cdot (d_0 - e^\varepsilon) = 2 \cdot 2 \cdot (8-2) = 24$.
*   **Per-Mode Sensitivity:** $\lambda = 2/a = 2/e^\varepsilon = 1$ (here $\lambda$ denotes the QFI eigenvalue of the interface modes; it is unrelated to the resource-scarcity parameter of Definition 20).

### V.2.3 Capacity Saturation Condition

At the PCE-Attractor, the system operates at its maximum information capacity (Theorem Z.6). The predictive information gain equals the operational alphabet capacity:
$$
\mathcal{I}(u^*) = M \ln(1 + \lambda u^*) = \ln d_0
\tag{V.8}
$$

### V.2.4 Calculation of the Bare Coupling $u^*$

Substitute the derived spectral parameters ($M=24, \lambda=1$) and the fundamental alphabet size ($d_0=8$) into the capacity saturation condition (V.8):
$$
24 \ln(1 + 1 \cdot u^*) = \ln 8
$$
Solving for the bare coupling parameter $u^*$:
$$
1 + u^* = 8^{1/24}
$$
$$
\boxed{u^* = 8^{1/24} - 1 \approx 0.0905077327}
\tag{V.9}
$$

### V.2.5 From $u^*$ to the Thomson-Limit $\alpha$

The Predictive Ward Identity (Theorem Z.14), together with QFI geometric rigidity ($\lambda_i=1$, Theorem Z.5) and capacity saturation (Theorem Z.7), uniquely fixes the bulk normalization constant $\kappa^*_{\mathrm{bulk}}=1$ by obstructing the field-rescaling freedom present in standard $U(1)$ gauge theory. The physical Thomson-limit coupling includes the discrete-to-continuous interface dressing (Section Z.17) and the curvature-controlled correction (Theorems Z.25–Z.26). Define
$$
\Delta^{(2)} := \frac{\pi u^*}{24\sqrt{K_0}}\left(1-\frac{u^{*2}}{6}\right).
$$
With $u^* = 8^{1/24}-1 = 2^{1/8}-1$ and $K_0 = 3$:

$$
\boxed{\alpha^{-1} = \frac{4\pi}{u^*} - \frac{\pi}{\sqrt{K_0}} + \Delta^{(2)} + O(u^{*5}) \approx 137.036092 \pm 0.000050}
\tag{V.10}
$$
This is a Thomson-limit prediction with zero continuously adjustable parameters within the PU mapping contract. Relative to the CODATA 2022 value $\alpha^{-1}_{\mathrm{exp}} = 137.035999177$ [NIST 2024], the central value differs by $0.68$ ppm; the quoted $1\sigma$ budget is the conservative PU-to-physics uncertainty constructed in Appendix Z (Section Z.27.9) from controlled truncation terms and mapping/systematic contributions.