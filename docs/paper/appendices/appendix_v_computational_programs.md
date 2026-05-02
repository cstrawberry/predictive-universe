# Appendix V: Computational Programs and Numerical Consistency Checks

This appendix provides computational programs for two constants within the Predictive Universe (PU) framework: the cosmological constant $\Lambda$ and the fine-structure constant $\alpha_{\mathrm{em}}$. The $\Lambda$ program evaluates the Appendix U five-mode reference branch $\Lambda L_P^2 = 8\pi A_{\text{eff}} e^{-2\kappa}$ using the reference exponent $\kappa=141.5$ (Appendix U, Theorem U.16) and the Appendix U working prefactor $A_{\text{eff}}=0.923\pm0.011$ (Corollary U.15b); the inversion form is included as a numerical consistency check that converts the observed $\Lambda L_P^2$ into $A_{\text{eff}}^{(\text{obs})}$ or an effective $\kappa$ under a chosen prefactor. Theorem U.8c shows that the pure-coordinate dilatation tangent needed for that five-mode branch is obstructed in the current Definition U.4 continuum action, so the forward value is branch-dependent rather than theorem-level vacuum closure. By contrast, after the corrected Definition U.6 normalization, Theorem U.13b establishes the corrected four-mode exponent branch $\kappa=142$ under the explicit false-vacuum spectral hypotheses stated there. The $\alpha_{\mathrm{em}}$ program gives a parametric, falsifiable roadmap with no continuous fitting after the baseline MPU invariants and stated projection/matching conventions are fixed. Section V.3 records a finite audit ladder: reproducibility checks that can be performed independently from the displayed PU formulas and finite combinatorial data. Passing those audits strengthens the manuscript's internal numerical discipline, but it does not by itself promote the RHG flag-lift, Bismut-Lebeau determinant transfer, or other certificate-level branches to theorem-level closure.

**Conventions.** Section V.1 uses SI units (with $c$ explicit). Sections V.2–V.2.5 use Heaviside–Lorentz units with $\hbar=c=1$; $\alpha_{\mathrm{em}}=e^2/(4\pi)$.

## V.0 Reproducibility Contract and Uncertainty Budgets

This appendix is intended to be mechanically reproducible from the displayed equations. An independent check should verify the following items without access to any unpublished derivations:

1. **Input ledger.** Fixed PU inputs: $K_0=3$, $d_0=2^{K_0}=8$, $\varepsilon_0=\ln2$, $a=2$, $b=d_0-a=6$, $M=2a(d_0-a)=24$, and (for the semiclassical vacuum sector) $S_{\mathrm{inst}}=(C_{\max}/\varepsilon_0)\kappa=2\kappa$.
2. **$\Lambda$ forward evaluation + inversion check.** Using Equation (V.2) with the derived inputs $(\kappa,A_{\text{eff}})$ to compute the PU prediction for $\Lambda L_P^2$, and using Equations (V.4)–(V.5) together with Equation (V.3) to infer either $A_{\text{eff}}^{(\text{obs})}$ (holding $\kappa$ fixed) or an effective $\kappa$ (holding $A_{\text{eff}}$ fixed) from observational inputs $(H_0,\Omega_\Lambda,c,L_P)$.
3. **$\alpha_{\mathrm{em}}$ forward program.** Using Equation (V.8) to compute $u^*$ from $(M,\lambda,d_0)$ and Equation (V.10) to compute $\alpha^{-1}$ from $(u^*,K_0)$ including the explicit interface corrections.
4. **Uncertainty accounting.** Reported $1\sigma$ uncertainties separate (i) observational inputs, (ii) controlled truncation terms, and (iii) PU-to-physics mapping/systematic terms; when combined, they are combined in quadrature unless otherwise stated.

Numerical conventions: $\ln$ and $\exp$ denote the natural logarithm and exponential. Intermediate computations should retain at least 20 significant digits before final rounding; dimensionless combinations such as $\Lambda L_P^2$ should be formed exactly as written to avoid unit-conversion errors.

**Table V.0 — Consolidated numerical outputs and uncertainty budgets**

| Quantity | PU program | Central value | $1\sigma$ budget | Dominant contributions |
|:--|:--|:--|:--|:--|
| $\alpha^{-1}$ (Thomson limit) | Eqs. (V.8)–(V.10) with $K_0=3$, $d_0=8$, $M=24$, $u^*=8^{1/24}-1$ | $137.036092$ | $\pm 0.000060$ | combined Section Z.27.9 budget, dominated by subgroup-projection/matching systematics; compare $\alpha_{\mathrm{em}}^{-1} = 137.035999177(21)$ [NIST 2024] |
| $\Lambda L_P^2$ (vacuum sector) | Eq. (V.2) with $\kappa_{\mathrm{ref}}=141.5$ and $A_{\text{eff}}=0.923\pm0.011$ on the Appendix U five-mode reference branch | $(2.88\times10^{-122})$ | $\pm 0.03\times10^{-122}$ | branch-dependent reference evaluation on the five-mode branch; Theorem U.8c blocks the pure-coordinate dilatation realization in the current continuum action, while Theorem U.13b establishes the corrected four-mode exponent branch $\kappa=142$ under the explicit false-vacuum spectral hypotheses stated there. Eq. (V.5) gives $(\Lambda L_P^2)_{\text{obs}}=(2.86599\pm0.04849)\times10^{-122}$, implying $A_{\text{eff}}^{(\text{obs})}=0.917\pm0.016$ on the five-mode branch and $A_{\text{eff}}^{(\text{obs},4)}=2.49\pm0.04$ on the four-mode branch |

## V.1 The Cosmological Constant: Inversion for the Instanton Complexity $\kappa$

### V.1.1 Foundational PU Equations for $\Lambda$

1. **Instanton action.** For the minimal vacuum fluctuation,

   $$
   \boxed{S_{\mathrm{inst}}=\left(\frac{C_{\max}}{\varepsilon}\right)\kappa = 2\,\kappa} \tag{V.1}
   $$

   where $C_{\max}/\varepsilon_0=2$ on the residual-budget branch of Appendix E (Equation E.14) and Appendix Q (§Q.2.1, Equation Q.10). The residual-budget branch is the load-bearing assumption inherited by every $\Lambda L_P^2 \sim e^{-2\kappa}$ value computed in this section.

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

Using the Appendix U reference input $\kappa_{\mathrm{ref}}=141.5$ (Theorem U.16, five-mode reference-counting convention) and the Appendix U working value $A_{\text{eff}}=0.923\pm0.011$ (Corollary U.15b, prefactor convention), Equation (V.2) gives the corresponding five-mode reference value $\Lambda L_P^2 = (2.88 \pm 0.03)\times10^{-122}$. Theorem U.8c shows that the pure-coordinate dilatation tangent needed for that five-mode branch is obstructed in the current Definition U.4 continuum action, so this agreement with the observed value (V.5) is branch-dependent rather than theorem-level vacuum closure. Holding the same prefactor fixed on the translational branch instead gives

$$
\Lambda L_P^2 = 8\pi A_{\text{eff}} e^{-284} = (1.06 \pm 0.01)\times10^{-122}.
$$

Setting $A_{\text{eff}}=1$ in Equation (V.3):

$$
\boxed{\kappa \;=\; -\tfrac12 \ln\!\left(\frac{2.86599\times10^{-122}}{8\pi}\right) \;=\; 141.543\ \pm\ 0.009} \tag{V.6}
$$

Holding $\kappa_{\mathrm{ref}}$ fixed within that Appendix U reference convention, the observed value (V.5) implies the effective prefactor

$$
A_{\text{eff}}^{(\text{obs})} := \frac{\Lambda L_P^2}{8\pi e^{-2\kappa_{\mathrm{ref}}}} = \frac{\Lambda L_P^2}{8\pi e^{-283}} = 0.917 \pm 0.016,
$$

consistent with the Appendix U working value $A_{\text{eff}}=0.923\pm0.011$ (Corollary U.15b) on that five-mode reference branch. On the translational branch $m=4$, the same observation would require

$$
A_{\text{eff}}^{(\text{obs},4)} := \frac{\Lambda L_P^2}{8\pi e^{-284}} = 2.49 \pm 0.04.
$$

For the Appendix U reference value $\kappa_{\mathrm{ref}}=141.5$ (Theorem U.16), the corresponding reference instanton action from Equation (V.1) is

$$
S_{\mathrm{inst}} = 2\kappa_{\mathrm{ref}} = 283~\text{nats} = 408.3~\text{bits}. \tag{V.7}
$$

**Sensitivity to $H_0$.** Since $\Lambda L_P^2 \propto H_0^2$, a shift $H_0\to H_0(1+\epsilon)$ changes the inferred $\kappa$ by $\Delta \kappa \simeq -\epsilon$; hence a 1% change in $H_0$ shifts $\kappa$ by $\sim 0.01$.

**Dependence on the $O(1)$ prefactor.** The dependence of the inferred $\kappa$ on the prefactor is modest ($\partial \kappa/\partial \ln A_{\text{eff}} = +\tfrac12$), as shown for representative $A_{\text{eff}}$ values in Table V.1. An error budget that separates observational and prefactor contributions is

$$
\sigma_\kappa^{2}\ \simeq\ \tfrac14\!\left[\ \sigma_{\ln(\Lambda L_P^{2})}^{\,2}\ +\ \sigma_{\ln A_{\text{eff}}}^{\,2}\ \right].
$$

**Table V.1 — Sensitivity of $\kappa$ to $A_{\text{eff}}$**

| $A_{\text{eff}}$ | 0.5     | **1.0**     | 2.0     | $\exp(1)\approx 2.718$ | 3.0     |
|:------:|:-------:|:----------:|:-------:|:---------------------:|:-------:|
| $\kappa$ | 141.20 | **141.54** | 141.89 | 142.04 | 142.09 |

Hence even an order-unity uncertainty in $A_{\text{eff}}$ shifts the inferred $\kappa$ by less than 1, whereas the reference value $\kappa_{\mathrm{ref}}=141.5$ comes from the Appendix U leading-order reference-counting convention.

---

## V.2 Calculation of $\alpha_{\mathrm{em}}$ at the PCE-Attractor on the Canonical Appendix Z Branch

This section provides the direct computational program for the fine-structure constant as recorded in **Appendix Z**. The calculation introduces no continuous fit parameters once the discrete Appendix Z assumptions, branch normalizations, and matching conventions are fixed; it is not an unconditional derivation of those branch normalizations themselves. The relevant Appendix Z branches inherited here include the bulk Predictive-Ward unit-normalization branch (Theorem Z.14, $\kappa^*_{\mathrm{bulk}} = 1$, with Thomson-Ward spectral-weight closure when Definition Z.14d is supplied via Theorem Z.14e), the canonical first-order interface-derivative normalization branch (Theorem Z.17), the canonical separable second-order curvature-response branch (Theorem Z.25), and the column-covariance branch (Theorem Z.24a) for the Bures-to-gauge identification.

### V.2.1 Foundational Inputs (Derived from PU First Principles)

*   **MPU Hilbert Space Dimension:** $d_0 \ge 8$ (from $K_0=3$ bits, Theorem 23); the PCE-minimal active-operational branch used in Appendix Z selects the saturating case $d_0 = 8$ (Chapter 7; Theorem Z.2).
*   **Irreducible Cost:** $\varepsilon_0=\ln2$ nats (from SPAP cycle, Theorem 31).

### V.2.2 Derived Spectral Parameters for the PCE-Attractor

As derived in Appendix Z (Theorem Z.5) from the subspace structure induced by the Landauer Pointer mechanism, the QFI spectrum at the PCE-Attractor is flat and uniquely determined:
*   **Number of Information Modes:** $M = 2ab = 2 \cdot 2 \cdot (8-2) = 24$.
*   **Per-Mode Sensitivity:** $\lambda = 2/a = 2/2 = 1$ (here $\lambda$ denotes the QFI eigenvalue of the interface modes; it is unrelated to the resource-scarcity parameter of Definition 20).

### V.2.3 Capacity Saturation Condition

At the PCE-Attractor, the system operates at its maximum information capacity (Theorem Z.6). The predictive information gain equals the operational alphabet capacity:
$$
\mathcal{I}(u^*) = M \ln(1 + \lambda u^*) = \ln d_0
\tag{V.8}
$$

### V.2.4 Calculation of the Bare Coupling $u^*$

Substitute the derived spectral parameters ($M=24, \lambda=1$) and the foundational alphabet size ($d_0=8$ on the Appendix Z branch) into the capacity saturation condition (V.8):
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

The Predictive Ward Identity (Theorem Z.14), together with QFI geometric rigidity ($\lambda_i=1$, Theorem Z.5) and capacity saturation (Theorem Z.7), fixes the bulk normalization constant $\kappa^*_{\mathrm{bulk}}=1$ by obstructing the field-rescaling freedom present in standard $U(1)$ gauge theory. The physical Thomson-limit coupling includes the discrete-to-continuous interface dressing (Section Z.17) and the curvature-controlled correction of Theorems Z.24–Z.26. Define
$$
\Delta^{(2)} := \frac{\pi u^*}{24\sqrt{K_0}}\left(1-\frac{u^{*2}}{6}\right).
$$
With $u^* = 8^{1/24}-1 = 2^{1/8}-1$ and $K_0 = 3$:

$$
\boxed{\alpha^{-1} = \frac{4\pi}{u^*} - \frac{\pi}{\sqrt{K_0}} + \Delta^{(2)} + O(u^{*5}) \approx 137.036092 \pm 0.000060}
\tag{V.10}
$$
This is a Thomson-limit prediction within the Appendix Z derivation. Relative to the CODATA 2022 value $\alpha^{-1}_{\mathrm{exp}} = 137.035999177$ [NIST 2024], the central value differs by $0.68$ ppm; the quoted $1\sigma$ budget is the conservative PU-to-physics uncertainty constructed in Appendix Z (Section Z.27.9) from controlled truncation terms and subgroup-projection/matching systematics, with the latter dominant.

## V.3 Finite Independent Audit Ladder

This section separates short-run reproducibility audits from certificate-level branch closures. An audit in this section is valid only if all inputs are fixed from the cited PU formulas before comparison with observational or validation data. A passed audit confirms that the displayed PU calculation is mechanically reproducible; it does not supply missing RHG, Bismut-Lebeau, RCD, or determinant certificates unless the relevant certificate object is explicitly constructed in the cited appendix.

### V.3.1 Charged-Lepton Log-Ratio Audit

**Target.** Recompute the charged-lepton hierarchy log-ratios from the Appendix T Bures/Van Vleck formulae without using charged-lepton masses as fitting inputs. The audit checks whether the stated branch formulae reproduce
$$
\ln(m_\tau/m_\mu),
\qquad
\ln(m_\mu/m_e)
$$
from the effective dimensions, Bures curvature data, and packet-normalization conventions already fixed in Appendix T.

**Pass condition.** The computation must reproduce the Appendix T log-ratio values from the stated branch data alone, with an error budget separated into truncation, branch-normalization, and external mass-comparison uncertainty.

**Fail condition.** If the displayed log-ratio values require inserting charged-lepton masses, changing the effective dimensions after comparison, or choosing a packet normalization from the validation result, the audit fails and the affected Appendix T row remains a validation-level or branch-normalized claim rather than a forward calculation.

### V.3.2 Golay Residual-Shell Incidence Audit

**Target.** Enumerate the octads of the extended binary Golay code $\mathcal G_{24}$ and verify the residual-shell incidence statistics used by the Appendix Z/R experimental ledger. The calculation is finite: generate the $759$ octads of the Steiner system $S(5,8,24)$ and count the number of octads containing a fixed subset of size $r$ for $r=0,1,2,3,4,5$.

**Pass condition.** The incidence counts must equal the Steiner-system values
$$
759,
\quad
253,
\quad
77,
\quad
21,
\quad
5,
\quad
1,
$$
with the ratios used in the residual-shell prediction extracted from these counts rather than assumed.

**Fail condition.** If the enumerated code is not equivalent to $\mathcal G_{24}$, if the octad count is not $759$, or if the incidence counts differ from the displayed Steiner values, the corresponding residual-shell prediction is rejected on that branch.

### V.3.3 Backbone Integer-Ledger Audit

**Target.** Verify the finite symbolic chain
$$
K_0=3\to d_0=8\to (a,b)=(2,6)\to k=12\to M=24\to D=4
$$
using only the cited PU branch gates: the horizon-error selection of $K_0$, the minimal carrier $d_0=2^{K_0}$, the active rank $a=2$, the Peirce decomposition of the rank-$2$ projector in $\mathbb C^8$, the predictive-recovery MacWilliams gate for $k=12$, and the kissing/mode-channel condition for $D=4$.

**Pass condition.** Each arrow must be checked as a separate implication with its branch hypothesis stated. In particular, the Peirce step must verify
$$
\dim_\mathbb C pE=2,
\qquad
\dim_\mathbb C(1-p)E=6,
\qquad
\dim_\mathbb C\operatorname{Hom}(pE,(1-p)E)=12,
\qquad
\dim_\mathbb R T_p\mathrm{Gr}(2,8)=24.
$$

**Fail condition.** If any arrow requires an unstated branch input, the audit must report the exact missing hypothesis rather than treating the whole integer chain as unconditional.

### V.3.4 Primordial $\mathbb{CP}^{11}$ Determinant Audit

**Target.** Evaluate the determinant prefactor defined by the primordial determinant certificate of Appendix U, using the fixed spectrum
$$
\lambda_\ell=4\ell(\ell+11)+m_Q^2
$$
and the stated multiplicities for nonconstant modes on $\mathbb{CP}^{11}$.

**Pass condition.** The audit must output a definite value of
$$
A_Q^{\mathrm{det}}
=\mathcal J_Q\exp[\tfrac12\zeta_Q'(0)]
$$
with the finite-part convention, zero-mode quotient, and measure factor fixed before comparison with $A_s$, $r$, or $A_s r$.

**Fail condition.** If $m_Q^2$, $\mathcal J_Q$, or the finite-part convention is not fixed, the audit may verify the formal zeta expression but cannot promote the leading branch $A_Q=1$ to theorem-level determinant closure.

### V.3.5 McKay/Bures-Weight No-Go Audit

**Target.** Test whether a McKay quiver or Dynkin-mark computation alone can force the Bures-weight constraint
$$
21\kappa_1+55\kappa_2-48\kappa_3=0
$$
that is equivalent to the lepton-to-quark tilt normalization $c_\ell/c_d=8/3$ in Appendix T.

**Pass condition for the no-go.** For every candidate finite McKay diagram compatible with the lifted Golay/parity action, the discrete McKay data must leave at least one continuous positive normalization degree of freedom in the weights $\chi_i$, so that the displayed linear relation is not forced by McKay data alone.

**Pass condition for closure.** If a candidate McKay branch does force the displayed relation, the audit must identify the exact diagram, marks, representation assignment, and normalization theorem that remove the continuous freedom. In that case the Appendix T Bures-weight certificate should be updated to cite the derived McKay closure.

**Fail condition.** A raw match of small integers or Dynkin marks is insufficient. The audit fails if it does not prove uniqueness of the normalization or does not separate discrete McKay data from continuous Bures-weight scale choices.

### V.3.6 RHG Flag-Lift Spectral Certificate Audit

This audit records the finite status of the RHG flag-lift spectral gate of Definition T.78.6 and Algorithm T.78.6a. It is forward-only: the validation tuple $(15.14,20.94,18.41)$ is not used to choose a block ledger, finite part, metric normalization, structural triple, or tail constant.

For
$$
\widetilde X=SU(8)/S(U(2)\times U(1)\times U(2)\times U(3)),
$$
one has
$$
\dim_{\mathbb R}\widetilde X
=
(8^2-1)-(4+1+4+9-1)
=46,
\qquad
\dim_{\mathbb C}\widetilde X=23.
$$
The Clifford generator count used by the RHG construction is
$$
\rho(24)=8,
$$
so the real Clifford block has eight anticommuting generators. The finite Peter-Weyl audit may verify the generator algebra, the flag-manifold dimension, the $C_2\le100$ dominant-weight enumeration, and the analytic $P=24$ tail integral.

These checks do not by themselves verify Algorithm T.78.6a. The present text still lacks the explicit RHG block matrices
$$
\mathcal K_b,
\qquad
\Pi_b^{\mathrm{RHG}},
\qquad
J_b^{\mathrm{RHG}},
$$
the numerical metric normalization $\beta_{\mathrm{RHG}}$, the exact homogeneous connection certificate, the spectrahedral minimizer
$$
x_{\mathrm{RHG}}=(\mu_0,m_{\mathcal J},\eta),
$$
and the heat-kernel/zeta finite parts and tail constants required to certify intervals for $F_s^{\mathrm{RHG}}$.

Consequently no certified interval triplet
$$
(\Delta_1,\Delta_2,\Delta_3)^{\mathrm{RHG}}
$$
is obtained. The validation tuple remains a comparison target only.

If the validation tuple is inverted only for diagnostic comparison,
$$
\Delta^{\mathrm{val}}=(15.14,20.94,18.41)
$$
under the fixed threshold map
$$
\Delta=TF,
\qquad
T=
\begin{pmatrix}
2/5&3/5&8/15\\
0&1&0\\
1&0&0
\end{pmatrix}
$$
gives
$$
F_C=18.41,
\qquad
F_W=20.94,
\qquad
F_Y=-8.9775.
$$
This diagnostic inversion is not a derivation and may not be used to select any entry of $\mathfrak C_{\mathrm{RHG}}$.

### V.3.7 Audit Conclusion

The finite audit ladder verifies only the displayed mechanical calculations. It does not verify Algorithm T.78.6a because the required RHG block data, spectrahedral minimizer, finite-part computation, and tail constants are absent. Therefore the RHG gate remains in the pre-certificate negative-closure status of Theorem T.78.2 and Corollary T.78.5.1.