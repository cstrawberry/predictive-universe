# Appendix V: Computational Programs and Numerical Consistency Checks

This appendix provides computational programs for two constants within the Predictive Universe (PU) framework: the cosmological constant $\Lambda$ and the fine-structure constant $\alpha_{\mathrm{em}}$. The $\Lambda$ program is an inversion that uses observational inputs to determine the instanton complexity $\kappa$. The $\alpha_{\mathrm{em}}$ program gives a parametric, falsifiable roadmap that becomes parameter-free once the baseline MPU invariants are computed from a specified model.

**Conventions.** Section V.1 uses SI units (with $c$ explicit). Sections V.2–V.2.5 use Heaviside–Lorentz units with $\hbar=c=1$; $\alpha_{\mathrm{em}}=g_e^2/(4\pi)$.


## V.1 The Cosmological Constant: Inversion for the Instanton Complexity $\kappa$

### V.1.1 Foundational PU Equations for $\Lambda$

1. **Instanton action.** For the minimal vacuum fluctuation,

   $$
   \boxed{S_{\mathrm{inst}}=\left(\frac{C_{\max}}{\varepsilon}\right)\kappa = 2\,\kappa} \tag{V.1}
   $$

   where $C_{\max}/\varepsilon=2$ (rigorously derived in Appendix Q).

2. **Vacuum energy density.** The dimensionless combination $\Lambda L_P^2$ is

   $$
   \boxed{\Lambda L_P^2 \;\simeq\; 8\pi\,A_{\Lambda}\,e^{-S_{\mathrm{inst}}}} \tag{V.2}
   $$

   with $A_{\Lambda}$ an $O(1)$, **dimensionless** prefactor aggregating one‑loop determinants and extensivity (defined in Section U.1).

   **Normalization note.** Using the Einstein equation convention $G_{\mu\nu}+\Lambda g_{\mu\nu}=8\pi G T_{\mu\nu}$ and $L_P^2=\hbar G/c^3$, the ratio $\Lambda L_P^2$ is dimensionless while the conventional $8\pi$ remains as a pure numerical factor multiplying the semiclassical instanton amplitude. All dimensionful contributions in the one-loop determinant and finite-volume counting are normalized by $L_P$, so the aggregated prefactor $A_\Lambda$ is a **dimensionless** $O(1)$ constant. Equivalently, $A_\Lambda \equiv A_{\rm eff} := K \cdot N_{\rm eff}$ as defined in Appendix U (Section U.1), where $K$ is the one-loop determinant ratio and $N_{\rm eff}$ is the extensivity factor from Appendix E.

3. **Inversion for $\kappa$.** Solving Equation (V.2) using Equation (V.1),

   $$
   \boxed{\kappa \;=\; -\tfrac12\,\ln\!\left(\frac{\Lambda L_P^2}{8\pi A_{\Lambda}}\right)} \tag{V.3}
   $$

### V.1.2 Observational Inputs

* **Cosmological parameters (Planck 2018, base‑$\Lambda$CDM) \[Planck Collaboration 2020a]:**
  $H_0=67.4\pm0.5~\mathrm{km\,s^{-1}\,Mpc^{-1}}$, $\Omega_{\Lambda}=0.6889\pm0.0056$.
* **Planck length (CODATA 2022) \[NIST 2024]:**
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

Setting $A_{\Lambda}=1$ in Equation (V.3):

$$
\boxed{\kappa \;=\; -\tfrac12 \ln\!\left(\frac{2.86599\times10^{-122}}{8\pi}\right) \;=\; 141.543\ \pm\ 0.009} \tag{V.6}
$$

The PU framework independently derives $\kappa = 141.5$ from Grassmannian geometry (Theorem U.16). Holding $\kappa$ fixed, the observed value (V.5) implies the effective prefactor

$$
A_{\Lambda}^{(\text{obs})} := \frac{\Lambda L_P^2}{8\pi e^{-2\kappa}} = \frac{\Lambda L_P^2}{8\pi e^{-283}} = 0.917 \pm 0.016,
$$

equivalently $A_{\text{eff}}^{(\text{obs})} = 0.917 \pm 0.016$ in the notation of Appendix U (Corollary U.15b).

The corresponding action (Equation (V.1)) is

$$
\boxed{S_{\mathrm{inst}}=2\kappa=283.087\ \pm\ 0.017\ \text{nats} \;=\; 408.408\ \pm\ 0.025\ \text{bits}} \tag{V.7}
$$

since $1~\text{nat}=1/\ln 2~\text{bits}$.

For the derived value $\kappa=141.5$ (Theorem U.16), one has $S_{\mathrm{inst}}=283.000\ \text{nats}=408.283\ \text{bits}$.

**Sensitivity to $H_0$.** Holding $\Omega_\Lambda$ fixed at its Planck value, using $H_0=73~\mathrm{km\,s^{-1}\,Mpc^{-1}}$ shifts $\kappa$ by $\Delta\kappa\approx -0.0798$.

**Dependence on the $O(1)$ prefactor.** The dependence of $\kappa$ on the prefactor is modest ($\partial \kappa/\partial \ln A_\Lambda = +\tfrac12$), as shown for representative $A_{\Lambda}$ values in Table V.1. An error budget that separates observational and prefactor contributions is

$$
\sigma_\kappa^{2}\ \simeq\ \tfrac14\!\left[\ \sigma_{\ln(\Lambda L_P^{2})}^{\,2}\ +\ \sigma_{\ln A_{\Lambda}}^{\,2}\ \right].
$$

**Table V.1 — Sensitivity of $\kappa$ to $A_{\Lambda}$**

| $A_{\Lambda}$ | 0.5     | **1.0**     | 2.0     | $\exp(1)\approx 2.718$ | 3.0     |
| :--------------- | :------ | :---------- | :------ | :----------------------- | :------ |
| $\kappa$       | 141.197 | **141.543** | 141.890 | 142.043                  | 142.093 |

---

## V.2 Parameter-Free Calculation of $\alpha_{\mathrm{em}}$ at the PCE-Attractor

This section provides the direct computational program for the fine-structure constant, as rigorously derived in **Appendix Z**. The calculation is parameter-free, relying only on the framework's foundational constants.

### V.2.1 Foundational Inputs (Derived from PU First Principles)

*   **MPU Hilbert Space Dimension:** $d_0 = 8$ (from $K_0=3$ bits, Theorem 23).
*   **Irreducible Cost:** $\varepsilon = \ln 2$ nats (from SPAP cycle, Theorem 31).

### V.2.2 Derived Spectral Parameters for the PCE-Attractor

As derived in Appendix Z (Theorem Z.5) from the subspace structure induced by the Landauer Pointer mechanism, the QFI spectrum at the PCE-Attractor is flat and uniquely determined:
*   **Number of Information Modes:** $M = 2ab = 2 \cdot (e^\varepsilon) \cdot (d_0 - e^\varepsilon) = 2 \cdot 2 \cdot (8-2) = 24$.
*   **Per-Mode Sensitivity:** $\lambda = 2/a = 2/e^\varepsilon = 2/2 = 1$.

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

The Predictive Ward Identity (Theorem Z.14), combined with the Principle of Physical Instantiation at the PCE-Attractor, fixes the bulk normalization constant to unity ($\kappa^*_{\mathrm{bulk}}=1$). The physical Thomson-limit coupling includes a discrete-to-continuous interface correction derived in Appendix Z (Section Z.17):
$$
\alpha^{-1} = \frac{4\pi}{u^*} - \frac{\pi}{\sqrt{K_0}} + \Delta^{(2)}
$$
where $\Delta^{(2)} = \pi u^*/(24\sqrt{K_0})$ is the second-order curvature correction from Bures metric geometry (Theorem Z.26). For sub-ppm precision, Appendix Z includes the third-order geodesic correction factor $(1 - u^{*2}/6) \approx 0.9986$ from SU(2) geometry, yielding $\alpha^{-1} \approx 137.036092$ (Section Z.27.8, Theorem Z.26). With $u^* = 2^{1/8}-1$ and $K_0 = 3$:

$$
\boxed{\alpha^{-1} ≈ 137.036 \pm 0.0001}
\tag{V.10}
$$
This is a parameter-free prediction at the Thomson limit, in agreement with the experimental value $\alpha^{-1}_{\mathrm{exp}} = 137.035999084$ to within 0.7 ppm.