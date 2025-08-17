# Appendix V: Computational Programs and Numerical Consistency Checks

This appendix provides computational programs for two constants within the Predictive Universe (PU) framework: the cosmological constant $\Lambda$ and the fine-structure constant $\alpha_{em}$. The $\Lambda$ program is an inversion that uses observational inputs to determine the instanton complexity $\kappa$. The $\alpha_{em}$ program gives a parametric, falsifiable roadmap that becomes parameter-free once the baseline MPU invariants are computed from a specified model.

**Conventions.** Section V.1 uses SI units (with $c$ explicit). Sections V.2–V.2.5 use Heaviside–Lorentz units with $\hbar=c=1$; $\alpha_{em}=g_e^2/(4\pi)$.



## V.1 The Cosmological Constant: Inversion for the Instanton Complexity $\kappa$

### V.1.1 Foundational PU Equations for $\Lambda$

1. **Instanton action.** For the minimal vacuum fluctuation,

   $$
   \boxed{S_{\mathrm{inst}}=\left(\frac{C_{\max}}{\varepsilon}\right)\kappa = 2\,\kappa} \tag{V.1}
   $$

   where $C_{\max}/\varepsilon=2$ (Appendix Q).

2. **Vacuum energy density.** The dimensionless combination $\Lambda L_P^2$ is

   $$
   \boxed{\Lambda L_P^2 \;\simeq\; 8\pi\,A_{\Lambda}\,e^{-S_{\mathrm{inst}}}} \tag{V.2}
   $$

   with $A_{\Lambda}$ an $O(1)$, **dimensionless** prefactor aggregating one‑loop determinants and extensivity (defined in Eq. U.12).

   **Normalization note.** Using the Einstein‑equation convention $G_{\mu\nu}+\Lambda g_{\mu\nu}=8\pi G T_{\mu\nu}$ and $L_P^2=\hbar G/c^3$, the ratio $\Lambda L_P^2$ is dimensionless while the conventional $8\pi$ remains as a pure numerical factor multiplying the semiclassical instanton amplitude. All dimensionful contributions in the one‑loop determinant and finite‑volume counting are normalized by $L_P$, so the aggregated prefactor $A_\Lambda$ is a **dimensionless** $O(1)$ constant (see Eq. U.12). Equivalently, $A_\Lambda \equiv A_{\rm eff}$ as defined in Appendix U (Eq. U.12).

3. **Inversion for $\kappa$.** Solving Eq. (V.2) using Eq. (V.1),

   $$
   \boxed{\kappa \;=\; -\tfrac12\,\ln\!\left(\frac{\Lambda L_P^2}{8\pi A_{\Lambda}}\right)} \tag{V.3}
   $$

### V.1.2 Observational Inputs

* **Cosmological parameters (Planck 2018, base‑$\Lambda$CDM) \[Planck Collaboration et al. 2020]:**
  $H_0=67.4\pm0.5~\mathrm{km\,s^{-1}\,Mpc^{-1}}$, $\Omega_{\Lambda}=0.6889\pm0.0056$.
* **Planck length (CODATA 2018) \[CODATA Committee on Data for Science and Technology 2018]:**
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

### V.1.4 Inversion for $\kappa$ and the Instanton Action

Setting $A_{\Lambda}=1$ in Eq. (V.3),

$$
\boxed{\kappa \;=\; -\tfrac12 \ln\!\left(\frac{2.86599\times10^{-122}}{8\pi}\right) \;=\; 141.543\ \pm\ 0.009} \tag{V.6}
$$

The corresponding action (Eq. (V.1)) is

$$
\boxed{S_{\mathrm{inst}}=2\kappa=283.087\ \pm\ 0.017\ \text{nats} \;=\; 408.408\ \pm\ 0.025\ \text{bits}} \tag{V.7}
$$

since $1~\text{nat}=1/\ln 2~\text{bits}$.

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

## V.2 Calculation of $\alpha_{em}$ from Baseline MPU Invariants

### V.2.1 Inputs

Given a specified MPU model, determine the baseline invariants (Appendix G.9):

$$
\{\lambda_i\}_{i=1}^{M},\quad \Gamma_0,\ \nu,\quad (r_p,\gamma_p),\quad (K,\gamma,\kappa_F,\beta_{\mathrm{eff}}),\quad \kappa_\mu .
$$

From these, form the derived cost parameters (Eq. (G.9.7)):

$$
c_\gamma \coloneqq K(\beta_{\mathrm{eff}}\kappa_F)^\gamma,\qquad
A_{\mathrm{PCE}}\coloneqq r_p\,c_\gamma^{\gamma_p},\qquad
\gamma_{\mathrm{eff}}\coloneqq \gamma\,\gamma_p>1,
$$

and the **dimensionless** coefficient

$$
\tilde A_{\mathrm{PCE}}\ \coloneqq\ \frac{A_{\mathrm{PCE}}}{\Gamma_0\,\nu}.
$$

Define the spectral power sums and capacity:

$$
S_m\coloneqq\sum_{i=1}^M \lambda_i^{\,m},\qquad S_1 \equiv \sum_i \lambda_i, \qquad
d_0=8\quad(\text{MPU alphabet size, } 2^{K_0}).
$$

Throughout, **nats are treated as dimensionless**.

### V.2.2 Interior Equilibrium

Let $u=g_e^2$. The unique interior optimum $u^*>0$ solves (cf. Eq. (G.9.10))

$$
\boxed{\ \tilde A_{\mathrm{PCE}}\,\gamma_{\mathrm{eff}}\,(u^*)^{\gamma_{\mathrm{eff}}-1}
\;=\; \sum_{i=1}^{M}\frac{\lambda_i}{1+\lambda_i u^*}\ }\tag{V.8}
$$

* **Existence/uniqueness.** For $\gamma_{\mathrm{eff}}>1$ and $\lambda_i\ge0$, the left side is strictly increasing in $u$, the right side strictly decreasing; a unique $u^*>0$ exists.

* **Perturbative seed (small $u$).**

  $$
  \boxed{\,u_0=\left(\frac{S_1}{\tilde A_{\mathrm{PCE}}\,\gamma_{\mathrm{eff}}}\right)^{\!\!\frac{1}{\gamma_{\mathrm{eff}}-1}},\qquad
  u^* \approx u_0\left(1 - \frac{S_2}{(\gamma_{\mathrm{eff}}-1)S_1}\,u_0\right)\,}\tag{V.9}
  $$

* **Closed form (flat spectrum, $\gamma_{\mathrm{eff}}=2$).** If $\lambda_i=S_1/M$ for all $i$,

  $$
  \boxed{\,u^*=\frac{M}{2S_1}\!\left(\sqrt{\,1+\frac{2\,S_1^2}{\tilde A_{\mathrm{PCE}}\,M}}\ -\ 1\right)\,}\tag{V.10}
  $$

### V.2.3 Capacity Constraint

The interior solution must satisfy the alphabet cap (Eq. (G.9.3)):

$$
\boxed{\ \sum_{i=1}^{M}\ln\!\bigl(1+\lambda_i u^*\bigr)\ \le\ \ln d_0\ =\ \ln 8\ }\tag{V.11}
$$

Because each cycle outputs at most $d_0$ outcomes and the observation channel factors per cycle, any block processing that does **not** enlarge the per‑cycle outcome alphabet cannot increase the **per‑cycle** mutual information (data‑processing inequality); the cap $\ln d_0$ therefore applies to any joint decoder over blocks under the FPL definition.

* **Flat-spectrum boundary (if the cap binds).**

  $$
  \boxed{\,u^*_{\mathrm{cap}}=\frac{M}{S_1}\Big(8^{1/M}-1\Big)\,}\tag{V.12}
  $$

  For large $M$, using $8^{1/M}\simeq 1+\frac{\ln 8}{M}$, this reduces to $u^*_{\mathrm{cap}}\approx \frac{\ln 8}{S_1}$.

* **General‑spectrum boundary.** If the interior $u^*$ violates (V.11), solve

  $$
  \sum_{i=1}^{M}\ln\!\bigl(1+\lambda_i u\bigr)=\ln 8
  $$

  for $u$ (monotone increasing in $u$); the solution is the maximizer.

### V.2.4 Coupling at the MPU Scale and Scale Map

With $\mu^*=\kappa_\mu\nu$,

$$
\boxed{\ \alpha_{em}(\mu^*)=\frac{u^*}{4\pi}\ }\tag{V.13}
$$

### V.2.5 Running to Laboratory Scales

Evolve $\alpha_{em}$ from $\mu^*$ to a reference scale (e.g., $m_Z$) by one‑loop QED with threshold matching (Heaviside–Lorentz units) in the $\overline{\mathrm{MS}}$ scheme \[Peskin & Schroeder, 1995]:

$$
\boxed{\ \frac{d\alpha}{d\ln\mu}=\frac{2}{3\pi}\!\left(\sum_{f}N_c^{f}Q_f^{2}\right)\alpha^2\ }\tag{V.14}
$$

$$
\boxed{\ \alpha^{-1}(\mu_2)=\alpha^{-1}(\mu_1)-\frac{2}{3\pi}\!\left(\sum_{f}N_c^{f}Q_f^{2}\right)\ln\!\frac{\mu_2}{\mu_1}\ }\tag{V.15}
$$

with active charged fermions $f$ in each interval and color factors $N_c^{f}$. A high-precision comparison to experimental data would require including two-loop corrections and a model for the hadronic vacuum polarization contribution.

### V.2.6 Algorithm (deterministic, capacity‑aware)

**Input:** ${\lambda_i},\ \Gamma_0,\ \nu,\ (r_p,\gamma_p),\ (K,\gamma,\kappa_F,\beta_{\mathrm{eff}}),\ \kappa_\mu$.

**Derived:**

$$
c_\gamma=K(\beta_{\mathrm{eff}}\kappa_F)^\gamma,\quad
A_{\mathrm{PCE}}=r_p\,c_\gamma^{\gamma_p},\quad
\gamma_{\mathrm{eff}}=\gamma\gamma_p,\quad
\tilde A_{\mathrm{PCE}}=\frac{A_{\mathrm{PCE}}}{\Gamma_0\nu},\quad
S_m=\sum_i\lambda_i^{\,m}.
$$

1. **Seed.** Calculate the zeroth-order seed $u_0$ from (V.9) and use it as the initial guess for the solver: $u \leftarrow u_0$.

2. **Solve equilibrium.** Iterate on

   $$
   F(u)=\tilde A_{\mathrm{PCE}}\gamma_{\mathrm{eff}}u^{\gamma_{\mathrm{eff}}-1}-\sum_{i=1}^M\frac{\lambda_i}{1+\lambda_i u}=0
   $$

   with a damped Newton–Raphson solver using

   $$
   F'(u)=\tilde A_{\mathrm{PCE}}\gamma_{\mathrm{eff}}(\gamma_{\mathrm{eff}}-1)u^{\gamma_{\mathrm{eff}}-2}+\sum_{i=1}^M\frac{\lambda_i^2}{(1+\lambda_i u)^2},
   $$

   ensuring $u>0$, until a combined tolerance (e.g., $|F(u)| < 10^{-12}$ or relative step size $< 10^{-12}$) is met or max iterations (e.g., 100) is reached.

3. **Capacity check.** If $\sum_i\ln(1+\lambda_i u)\le\ln 8$, accept $u^*=u$. Otherwise, solve $\sum_i\ln(1+\lambda_i u)=\ln 8$ for $u^*_{\mathrm{cap}}$ using a bracketing root-finder (e.g., Brent's method) on a bracketing interval that guarantees crossing, e.g., $[0, (8^{1/M}-1)/\lambda_{\min}]$; alternatively expand the upper bound geometrically from the interior solution until $\sum_i\ln(1+\lambda_i u)\ge\ln 8$, then bracket.

4. **Report $\alpha$ at $\mu^*$.** $\alpha_{em}(\mu^*)=u^*/(4\pi)$, $\mu^*=\kappa_\mu\nu$.

5. **Run to target scale.** Apply (V.15) piecewise between thresholds to obtain $\alpha_{em}(\mu_{\mathrm{target}})$.

### V.2.7 Sensitivity (local)

For $\gamma_{\mathrm{eff}}=2$ and small $u$, $u^*\approx S_1/(2\tilde A_{\mathrm{PCE}})$. Hence

$$
\frac{\partial u^*}{\partial \lambda_i}\ \approx\ \frac{1}{2\tilde A_{\mathrm{PCE}}},\qquad
\frac{\partial u^*}{\partial \tilde A_{\mathrm{PCE}}}\ \approx\ -\,\frac{S_1}{2\tilde A_{\mathrm{PCE}}^{\,2}},
$$

so increasing spectral weight $\lambda_i$ increases $u^*$ linearly, while increasing the relative cost $\tilde A_{\mathrm{PCE}}$ decreases $u^*$ inversely. *(For general $\gamma_{\mathrm{eff}}>1$, differentiate Eq. (V.8) implicitly to obtain sensitivities; the Jacobian is strictly positive/finite.)*

### V.2.8 Output

With the accepted $u^*$ (interior or boundary), the prediction is

$$
\boxed{\ \alpha_{em}(\mu^*)=\frac{u^*}{4\pi},\qquad
\alpha_{em}(\mu_{\mathrm{target}})\ \text{from (V.15).}\ }\tag{V.16}
$$