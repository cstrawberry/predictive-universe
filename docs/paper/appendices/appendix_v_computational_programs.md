# Appendix V: Computational Programs and Numerical Consistency Checks

This appendix provides computational programs for two constants within the Predictive Universe (PU) framework: the cosmological constant $\Lambda$ and the fine-structure constant $\alpha_{\mathrm{em}}$. The $\Lambda$ program evaluates the Appendix U five-mode reference branch $\Lambda L_P^2 = 8\pi A_{\text{eff}} e^{-2\kappa}$ using the reference exponent $\kappa=141.5$ (Appendix U, Theorem U.16) and the Appendix U working prefactor $A_{\text{eff}}=0.923\pm0.011$ (Corollary U.15b); the inversion form is included as a numerical consistency check that converts the observed $\Lambda L_P^2$ into $A_{\text{eff}}^{(\text{obs})}$ or an effective $\kappa$ under a chosen prefactor. Theorem U.8c shows that the pure-coordinate dilatation tangent needed for that five-mode branch is obstructed in the current Definition U.4 continuum action, so the forward value is branch-dependent rather than theorem-level vacuum closure. By contrast, after the corrected Definition U.6 normalization, Theorem U.13b establishes the corrected four-mode exponent branch $\kappa=142$ under the explicit false-vacuum spectral hypotheses stated there. The $\alpha_{\mathrm{em}}$ program gives a parametric, falsifiable roadmap with no continuous fitting after the baseline MPU invariants and stated projection/matching conventions are fixed. Section V.3 records a finite audit ladder: reproducibility checks that can be performed independently from the displayed PU formulas and finite combinatorial data. Passing those audits strengthens the manuscript's internal numerical discipline, but it does not by itself promote the RHG flag-lift, Bismut-Lebeau determinant transfer, or other certificate-level branches to theorem-level closure.

**Conventions.** Section V.1 uses SI units (with $c$ explicit). Sections V.2–V.2.5 use Heaviside–Lorentz units with $\hbar=c=1$; $\alpha_{\mathrm{em}}=e^2/(4\pi)$.

## V.0 Reproducibility Contract and Uncertainty Budgets

This appendix is intended to be mechanically reproducible from the displayed equations. An independent check should verify the following items without access to any unpublished derivations:

1. **Input ledger.** Fixed PU inputs: $K_0=3$, $N_{\mathrm{vis}}^{\min}=2^{K_0}=8$, $d_0=8$ on the minimal complex Hilbert carrier, $\varepsilon_0=\ln2$, $a=2$, $b=d_0-a=6$, $M=2a(d_0-a)=24$, and (for the semiclassical vacuum sector) $S_{\mathrm{inst}}=(C_{\max}/\varepsilon_0)\kappa=2\kappa$.
2. **$\Lambda$ forward evaluation + inversion check.** Using Equation (V.2) with the derived inputs $(\kappa,A_{\text{eff}})$ to compute the PU prediction for $\Lambda L_P^2$, and using Equations (V.4)–(V.5) together with Equation (V.3) to infer either $A_{\text{eff}}^{(\text{obs})}$ (holding $\kappa$ fixed) or an effective $\kappa$ (holding $A_{\text{eff}}$ fixed) from observational inputs $(H_0,\Omega_\Lambda,c,L_P)$.
3. **$\alpha_{\mathrm{em}}$ forward program.** Using Equation (V.8) to compute $u^*$ from $(M,\lambda,d_0)$ and Equation (V.10) to compute $\alpha^{-1}$ from $(u^*,K_0)$ including the explicit interface corrections.
4. **Uncertainty accounting.** Reported $1\sigma$ uncertainties separate (i) observational inputs, (ii) controlled truncation terms, and (iii) PU-to-physics mapping/systematic terms; when combined, they are combined in quadrature unless otherwise stated.

Numerical conventions: $\ln$ and $\exp$ denote the natural logarithm and exponential. Intermediate computations should retain at least 20 significant digits before final rounding; dimensionless combinations such as $\Lambda L_P^2$ should be formed exactly as written to avoid unit-conversion errors.

**Table V.0 — Consolidated numerical outputs and uncertainty budgets**

| Quantity | PU program | Central value | $1\sigma$ budget | Dominant contributions |
|:--|:--|:--|:--|:--|
| $\alpha^{-1}$ (Thomson limit) | Eqs. (V.8)–(V.10) with $K_0=3$, $d_0=8$, $M=24$, $u^*=8^{1/24}-1$; certificate row $\alpha^{-1}_{\mathrm{cert}}=\alpha^{-1}_{0}+R_\alpha$ | $\alpha^{-1}_{0}=137.03609205522863\ldots$ | branch comparison budget $\pm0.000060$ before residual closure | exact sinc-core arithmetic plus Section Z.27.9 comparison budget; theorem-level interval requires the residual gate of Definition Z.27.11a and Theorem Z.27.11j.1 |
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

- **Cosmological parameters (Planck 2018, base‑$\Lambda$CDM) [Planck Collaboration 2020a]:**
  $H_0=67.4\pm0.5~\mathrm{km\,s^{-1}\,Mpc^{-1}}$, $\Omega_{\Lambda}=0.6889\pm0.0056$.
- **Planck length (CODATA 2022) [Mohr et al. 2025; NIST 2024]:**
  $L_P=1.616255(18)\times 10^{-35}~\mathrm{m}$.
- **Speed of light:** $c=299{,}792{,}458~\mathrm{m\,s^{-1}}$ (exact).

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

Using the Appendix U reference input $\kappa_{\mathrm{ref}}=141.5$ (Theorem U.16, five-mode reference-counting convention) and the Appendix U working value $A_{\text{eff}}=0.923\pm0.011$ (Corollary U.15b, prefactor convention), Equation (V.2) gives the corresponding five-mode reference value $\Lambda L_P^2 = (2.88 \pm 0.03)\times10^{-122}$. Theorem U.8c shows that the pure-coordinate dilatation tangent needed for that five-mode branch is obstructed in the current Definition U.4 continuum action, so this agreement with the observed value (V.5) is branch-dependent rather than theorem-level vacuum closure. On the Definition U.6 four-mode branch, Theorem U.13b fixes the exponent $\kappa=142$ under the stated spectral hypotheses, so the forward expression is

$$
\Lambda_4 L_P^2=8\pi A_{\mathrm{eff}}^{\mathrm{Fred},4}e^{-284}.
$$

Substituting the same working prefactor gives $(1.06\pm0.01)\times10^{-122}$ only as a same-prefactor reference evaluation; a theorem-level four-mode forward interval requires the Fredholm prefactor certificate, with the relative Quillen-Fredholm reformulation of Theorem U.15i.2, and an interval audit.

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

This section provides the direct computational program for the fine-structure constant as recorded in **Appendix Z**. The calculation introduces no continuous fit parameters once the discrete Appendix Z assumptions, branch normalizations, and matching conventions are fixed; it is not an unconditional derivation of those branch normalizations themselves. The relevant Appendix Z branches inherited here include the bulk Predictive-Ward unit-normalization branch (Theorem Z.14, $\kappa^*_{\mathrm{bulk}} = 1$, with Thomson-Ward spectral-weight closure when Definition Z.14d is supplied via Theorem Z.14e), the canonical first-order interface-derivative normalization branch (Theorem Z.17), the canonical separable second-order curvature-response branch (Theorem Z.25), and the column-covariance branch (Lemma Z.24a) for the Bures-to-gauge identification.

### V.2.1 Foundational Inputs (Derived from PU First Principles)

- **MPU Hilbert Space Dimension:** $d_0 \ge 8$ (from $K_0=3$ bits, Theorem 23); the PCE-minimal active-operational branch used in Appendix Z selects the saturating case $d_0 = 8$ (Chapter 7; Theorem Z.2).
- **Irreducible Cost:** $\varepsilon_0=\ln2$ nats (from SPAP cycle, Theorem 31).

### V.2.2 Derived Spectral Parameters for the PCE-Attractor

As derived in Appendix Z (Theorem Z.5) from the subspace structure induced by the Landauer Pointer mechanism, the QFI spectrum at the PCE-Attractor is flat and uniquely determined:

- **Number of Information Modes:** $M = 2ab = 2 \cdot 2 \cdot (8-2) = 24$.
- **Per-Mode Sensitivity:** $\lambda = 2/a = 2/2 = 1$ (here $\lambda$ denotes the QFI eigenvalue of the interface modes; it is unrelated to the resource-scarcity parameter of Definition 20).

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
\boxed{
\alpha^{-1}_{0}
=
\frac{4\pi}{u^*}
-
\frac{\pi}{\sqrt{K_0}}
+
\frac{\pi u^*}{24\sqrt{K_0}}\operatorname{sinc}(u^*)
=
137.03609205522863\ldots
}
\tag{V.10}
$$

The certificate-complete Thomson row is

$$
\alpha^{-1}_{\mathrm{cert}}=\alpha^{-1}_{0}+R_\alpha.
$$

Equation (V.10) is the exact sinc-core arithmetic of the Appendix Z derivation. Relative to $\alpha^{-1}_{\mathrm{exp}}=137.035999177$, the core value differs by $0.00009287822863\ldots$, about $0.678$ ppm. The displayed Section Z.27.9 budget is a branch comparison budget; theorem-level interval status requires $R_\alpha$ to be fixed before comparison by the residual gate of Definition Z.27.11a and Theorem Z.27.11j.1.

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

using only the cited PU branch gates: the horizon-error selection of $K_0$, the operational-context floor $N_{\mathrm{vis}}^{\min}=2^{K_0}=8$, the minimal Hilbert carrier $d_0=8$, the active rank $a=2$ from the match/mismatch plus entropy-capacity gates, the Peirce decomposition of the rank-$2$ projector in $\mathbb C^8$, the predictive-recovery MacWilliams gate for $k=12$, and the channel-complete kissing/mode-channel condition for $D=4$.

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

Three additional closed auxiliary audits are recorded as Sections V.3.8–V.3.10 below. They reduce to finite cardinality or exact arithmetic rather than to missing spectral certificates, and are therefore closed at the audit level even though the spectral-certificate ladder of V.3.1–V.3.6 remains as stated.

### V.3.8 SPAP Role-Readout Audit

For any candidate SPAP realization with $N<8$ visited states, every joint role-readout map

$$
r:\mathcal S_{\mathrm{vis}}\to\{0,1\}^3
$$

has $|r(\mathcal S_{\mathrm{vis}})|\le N<8$, hence cannot be surjective. Therefore a claimed $N<8$ SPAP realization can be rejected before transition-table details are considered, by Corollary 5.2.2b. This audit is closed by exact finite cardinality.

### V.3.9 Page-Purity-Before-Entropy Audit

The $2\times2$ stabilizer witness of Corollary K.3.1a has

$$
\mathbb E\operatorname{tr}(\rho_E^2)=\frac45
$$

matching the Haar Page-purity value, but

$$
\mathbb E S(\rho_E)=\frac25\ln2\ne\frac13=S_{\mathrm{Page}}(2,2).
$$

Thus any audit promoting a second-moment or purity certificate to a von Neumann Page-entropy certificate without Definition K.3d.4c fails the branch discipline. This audit is closed by exact arithmetic on a finite ensemble.

### V.3.10 Same-Branch Zero-Residual Obstruction Audit

The exact sinc-core value differs from the CODATA-2022 Thomson comparison value [Mohr et al. 2025; NIST 2024] by

$$
0.00009287822863,
$$

about $0.678$ ppm. By Corollary Z.27.11e.1, this offset is about $4422.8$ recorded measurement standard uncertainties and about $1.644$ times the canonical comparison-budget diagnostic of Remark Z.26d, so no same-branch theorem fixing $R_\alpha=0$ can land at the recorded comparison value. The residual-gated row remains certificate-pending until $R_\alpha$ is fixed by the forward-locked gate of Definition Z.27.11a, Definition Z.27.11g, or Definition Z.27.11j. This audit is closed by exact arithmetic against the recorded ledger value.

### V.3.11 Unique Spectral Calibration Principle

This subsection records the final calibration rule for continuous coefficients. It does not alter the discrete backbone:

$$
K_0=3,
\qquad
N_{\mathrm{vis}}^{\min}=8,
\qquad
\varepsilon_0=\ln2,
\qquad
d_0=8,
\qquad
a=2,
\qquad
b=6,
\qquad
M=24,
\qquad
k=12,
\qquad
D=4.
$$

It applies only after the structural branch, response quotient, invariant operator basis, unit conventions, RG or threshold route, and finite spectral symbols have been fixed before comparison.

**Definition V.3.11a (Finite Spectral Calibration Datum).** A final spectral calibration datum for a sealed PU branch is a tuple

$$
\mathfrak S_*
=
(\mathcal A_*,\Omega_*,u_*,\{m_a,c_a^*\}_{a\in A},\{\sigma_B\}_{B\in\mathcal I_*})
$$

with the following entries.

1. $\mathcal A_*$ is the finite-dimensional commutative self-adjoint calibration algebra generated by all response-active calibration observables retained by the sealed branch after response-null distinctions have been quotiented. It is represented on a finite calibration carrier $\mathcal H_{\mathrm{cal}}$ and decomposes as

   $$
   \mathcal A_*
   =
   \bigoplus_{\alpha\in\Omega_*}\mathbb R P_\alpha,
   $$

   where the $P_\alpha$ are pairwise orthogonal primitive central projections with

   $$
   P_\alpha P_\beta=\delta_{\alpha\beta}P_\alpha,
   \qquad
   \sum_{\alpha\in\Omega_*}P_\alpha=I_{\mathrm{cal}}.
   $$

   The finite set

   $$
   \Omega_*=
   \operatorname{Atom}(\mathcal A_*)
   $$

   is the set of primitive response-active spectral atoms. If two primitive labels induce the same finite protocol-response functional, they are response-null relative to each other and must be identified before $\Omega_*$ is accepted.

2. $u_*=(u_\alpha)_{\alpha\in\Omega_*}$ is the normalized trace state of the calibration carrier restricted to the atom algebra:

   $$
   u_\alpha
   =
   \frac{\operatorname{Tr}P_\alpha}{\operatorname{Tr}I_{\mathrm{cal}}}.
   $$

   Thus

   $$
   u_\alpha>0,
   \qquad
   \sum_{\alpha\in\Omega_*}u_\alpha=1.
   $$

   Equivalently, if $r_\alpha=\operatorname{Tr}P_\alpha$, then

   $$
   u_\alpha
   =
   \frac{r_\alpha}{\sum_{\beta\in\Omega_*}r_\beta}.
   $$

   Because accepted response-preserving automorphisms of the sealed branch are represented trace-preservingly and carry primitive projections to primitive projections of the same rank, $u_\alpha=u_\beta$ whenever $\alpha$ and $\beta$ lie in the same response-preserving automorphism orbit. If the branch has no accepted multiplicity data beyond primitive atoms, this reduces to $u_\alpha=1/|\Omega_*|$.

3. Each $m_a:\Omega_*\to\mathbb R$ is a fixed spectral moment function encoding an already accepted structural constraint, Ward identity, anomaly constraint, index constraint, orientation constraint, finite threshold condition, or vacuum-response condition. Its required value $c_a^*$ is fixed by that accepted branch datum before comparison.

4. $\mathcal I_*$ is the accepted response-active invariant operator basis of the effective action at the calibration scale. Each $\sigma_B:\Omega_*\to\mathbb R$ is the finite spectral symbol of the coefficient of $I_B\in\mathcal I_*$. Matrix-valued coefficients are represented entrywise by symbols $\sigma_{B,ij}$.

5. A symbol $\sigma_B$ is admissible only if it is obtained from the finite response carrier before comparison. Concretely, if $\widehat O_B$ is the finite response operator representing the coefficient of $I_B$ and $\widehat O_B\in\mathcal A_*$, then

   $$
   \sigma_B(\alpha)
   =
   \frac{\operatorname{Tr}(P_\alpha\widehat O_B)}{\operatorname{Tr}P_\alpha}.
   $$

   If $\widehat O_B$ lies in a larger finite response algebra, the branch must supply a trace-preserving response-preserving conditional expectation

   $$
   E_*:\widehat{\mathcal A}_{\mathrm{resp}}\to\mathcal A_*
   $$

   and then

   $$
   \sigma_B(\alpha)
   =
   \frac{\operatorname{Tr}(P_\alpha E_*(\widehat O_B))}{\operatorname{Tr}P_\alpha}.
   $$

   If neither construction is certified, the coefficient of $I_B$ is not final-calibrated.

6. No empirical comparison value, validation target, post-comparison residual, or fitted phenomenological kernel may enter $\mathcal A_*$, $\Omega_*$, $u_*$, $m_a$, $c_a^*$, $\sigma_B$, $s_B$, or $\mathcal R^*_{\mu\leftarrow\mu_*}$ unless it is explicitly registered as an EmpiricalInput. Such an entry prevents theorem-level final calibration for every sector depending on it.

The admissible spectral calibration polytope is

$$
\mathcal C_*
=
\left\{
\omega\in\Delta(\Omega_*):
\sum_{\alpha\in\Omega_*}\omega_\alpha m_a(\alpha)=c_a^*
\text{ for every }a\in A
\right\},
$$

where

$$
\Delta(\Omega_*)
=
\left\{
\omega_\alpha\ge0,
\qquad
\sum_{\alpha\in\Omega_*}\omega_\alpha=1
\right\}.
$$

A branch is final-calibration admissible exactly when $\mathcal C_*$ is nonempty and contains at least one full-support point on the response-active atoms:

$$
\exists\omega\in\mathcal C_*
\quad\text{such that}\quad
\omega_\alpha>0
\quad\text{for every }\alpha\in\Omega_*.
$$

**Principle V.3.11b (Unique Spectral Calibration Principle).** On a final-calibration admissible branch, the calibrated spectral state is

$$
\omega_*
=
\operatorname*{argmin}_{\omega\in\mathcal C_*}
D_{\mathrm{KL}}(\omega\Vert u_*),
$$

where

$$
D_{\mathrm{KL}}(\omega\Vert u_*)
=
\sum_{\alpha\in\Omega_*}
\omega_\alpha
\log\frac{\omega_\alpha}{u_\alpha},
\qquad
0\log0:=0.
$$

Equivalently, $\omega_*$ is the maximum relative spectral-entropy state compatible with all accepted finite-response constraints:

$$
\omega_*
=
\operatorname*{argmax}_{\omega\in\mathcal C_*}
\left[
-\sum_{\alpha\in\Omega_*}
\omega_\alpha
\log\frac{\omega_\alpha}{u_\alpha}
\right].
$$

**Theorem V.3.11c (Existence and Uniqueness of the Calibrated Spectral State).** If $\mathfrak S_*$ is final-calibration admissible, then $\omega_*$ exists, is unique, and has full support on $\Omega_*$.

*Proof.* The simplex $\Delta(\Omega_*)$ is compact and convex because $\Omega_*$ is finite. The equations

$$
\sum_{\alpha\in\Omega_*}\omega_\alpha m_a(\alpha)=c_a^*
$$

are affine, so $\mathcal C_*$ is a closed convex subset of $\Delta(\Omega_*)$. By admissibility, $\mathcal C_*$ is nonempty. Since every $u_\alpha$ is positive and $0\log0:=0$, $D_{\mathrm{KL}}(\omega\Vert u_*)$ is continuous on $\Delta(\Omega_*)$. Hence it attains a minimum on $\mathcal C_*$.

For $u_\alpha>0$, the scalar function $x\mapsto x\log(x/u_\alpha)$ is strictly convex on $[0,\infty)$. Therefore the sum

$$
\omega\mapsto
D_{\mathrm{KL}}(\omega\Vert u_*)
$$

is strictly convex on $\Delta(\Omega_*)$: if $\omega\ne\omega'$ and $0<t<1$, at least one coordinate differs and strict convexity in that coordinate gives

$$
D_{\mathrm{KL}}(t\omega+(1-t)\omega'\Vert u_*)
<
tD_{\mathrm{KL}}(\omega\Vert u_*)
+
(1-t)D_{\mathrm{KL}}(\omega'\Vert u_*).
$$

A strictly convex function has at most one minimizer on a convex set. Thus the minimizer exists and is unique.

It remains to show full support. Let $\eta\in\mathcal C_*$ have $\eta_\alpha>0$ for all $\alpha$, which exists by final-calibration admissibility. Suppose the unique minimizer $\omega_*$ has a nonempty zero set $Z=\{\alpha:\omega_{*,\alpha}=0\}$. For $0<t<1$, define

$$
\omega(t)=(1-t)\omega_*+t\eta.
$$

By convexity of $\mathcal C_*$, $\omega(t)\in\mathcal C_*$. The contribution to

$$
D_{\mathrm{KL}}(\omega(t)\Vert u_*)-D_{\mathrm{KL}}(\omega_*\Vert u_*)
$$

from coordinates outside $Z$ is $O(t)$, while the coordinates in $Z$ contribute

$$
\sum_{\alpha\in Z}t\eta_\alpha
\log\frac{t\eta_\alpha}{u_\alpha}
=
t\log t\sum_{\alpha\in Z}\eta_\alpha+O(t).
$$

Since $\sum_{\alpha\in Z}\eta_\alpha>0$ and $t\log t/t\to-\infty$, this difference is negative for all sufficiently small $t>0$. That contradicts minimality of $\omega_*$. Hence $\omega_{*,\alpha}>0$ for every $\alpha\in\Omega_*$. ∎

**Corollary V.3.11d (Exponential Form on Independent Moment Branches).** If the active moment functions are independent after quotienting redundant affine constraints, then the calibrated state has the form

$$
\omega_\alpha^*
=
\frac{
u_\alpha
\exp\left(
-\sum_{a\in A}\theta_a m_a(\alpha)
\right)
}{
Z(\theta)
},
$$

where

$$
Z(\theta)
=
\sum_{\alpha\in\Omega_*}
u_\alpha
\exp\left(
-\sum_{a\in A}\theta_a m_a(\alpha)
\right),
$$

and the multipliers are fixed by

$$
-\frac{\partial\log Z}{\partial\theta_a}
=
c_a^*.
$$

After redundant constraints are removed, the multiplier vector $\theta$ is unique.

*Proof.* By Theorem V.3.11c, the minimizer is in the relative interior of the probability simplex. The equality-constrained Lagrangian is

$$
\mathcal L(\omega,\lambda,\theta)
=
\sum_\alpha\omega_\alpha\log\frac{\omega_\alpha}{u_\alpha}
+
\lambda\left(\sum_\alpha\omega_\alpha-1\right)
+
\sum_a\theta_a
\left(
\sum_\alpha\omega_\alpha m_a(\alpha)-c_a^*
\right).
$$

Stationarity in every coordinate gives

$$
\log\frac{\omega_\alpha}{u_\alpha}+1+\lambda+
\sum_a\theta_a m_a(\alpha)=0.
$$

Solving and absorbing $e^{-1-\lambda}$ into the normalizing factor gives the displayed exponential form. Differentiating $Z$ gives

$$
-\frac{\partial\log Z}{\partial\theta_a}
=
\sum_{\alpha\in\Omega_*}\omega_\alpha^*m_a(\alpha),
$$

so the moment equations are exactly the accepted constraints.

For uniqueness of the independent multipliers, the Hessian is

$$
\frac{\partial^2\log Z}{\partial\theta_a\partial\theta_b}
=
\operatorname{Cov}_{\omega_*}(m_a,m_b).
$$

For any vector $z=(z_a)$,

$$
\sum_{a,b}z_a
\operatorname{Cov}_{\omega_*}(m_a,m_b)
z_b
=
\operatorname{Var}_{\omega_*}\left(\sum_a z_a m_a\right).
$$

Because $\omega_*$ has full support, this variance vanishes only when $\sum_a z_a m_a$ is constant on all atoms. After quotienting redundant affine constraints, that implies $z=0$. Hence the Hessian is positive definite on the retained multiplier space, and $\theta$ is unique there. ∎

**Definition V.3.11e (Spectral Coefficient Map).** For every response-active invariant operator $I_B$ in the accepted leading or higher-order effective action, its calibrated coefficient at the calibration scale is

$$
c_B(\mu_*)
=
s_B\langle\sigma_B\rangle_{\omega_*}
=
s_B\sum_{\alpha\in\Omega_*}
\omega_\alpha^*\sigma_B(\alpha),
$$

where $s_B$ is the branch-fixed unit or normalization bridge for the coefficient of $I_B$. In dimensionless normalization conventions, $s_B=1$. If $s_B$ is not accepted before comparison, the dimensionless moment may be fixed but the physical coefficient is not final-calibrated.

For matrix-valued coefficients,

$$
(C_B)_{ij}(\mu_*)
=
s_B
\sum_{\alpha\in\Omega_*}
\omega_\alpha^*\sigma_{B,ij}(\alpha).
$$

The calibrated action at $\mu_*$ is

$$
S_{\mathrm{PU}}^{\mathrm{cal}}(\mu_*)
=
\sum_{B\in\mathcal I_*}
c_B(\mu_*)I_B.
$$

Running to a comparison scale is determined by the branch-accepted map

$$
\mathcal R^*_{\mu\leftarrow\mu_*}:
\{c_B(\mu_*)\}_{B\in\mathcal I_*}
\longmapsto
\{c_B(\mu)\}_{B\in\mathcal I_*},
$$

which must also be fixed before comparison.

In the normalized gauge-kinetic convention $s_3=s_2=s_Y=1$,

$$
\frac1{g_{3,*}^2}
=
\langle\sigma_3\rangle_{\omega_*},
\qquad
\frac1{g_{2,*}^2}
=
\langle\sigma_2\rangle_{\omega_*},
\qquad
\frac1{g_{Y,*}^2}
=
\langle\sigma_Y\rangle_{\omega_*}.
$$

With the Standard Model hypercharge normalization used by the accepted effective-action branch,

$$
\frac1{e_*^2}
=
\frac1{g_{2,*}^2}
+
\frac1{g_{Y,*}^2},
$$

and therefore

$$
\alpha_*^{-1}
=
4\pi
\left(
\langle\sigma_2\rangle_{\omega_*}
+
\langle\sigma_Y\rangle_{\omega_*}
\right).
$$

The Appendix Z residual gate can be promoted by USCP only if a symbol $\sigma_{R_\alpha}$ is included in $\mathfrak S_*$ before comparison, in which case

$$
R_\alpha
=
\langle\sigma_{R_\alpha}\rangle_{\omega_*}.
$$

Without such a symbol, the residual keeps its certificate-pending status.

For the Higgs convention $V(H)=-\mu^2H^\dagger H+\lambda(H^\dagger H)^2$,

$$
\mu_*^2=s_{\mu^2}\langle\sigma_{\mu^2}\rangle_{\omega_*},
\qquad
\lambda_*=s_\lambda\langle\sigma_\lambda\rangle_{\omega_*},
\qquad
v_*^2=\frac{\mu_*^2}{\lambda_*},
$$

when the accepted branch has $\mu_*^2>0$ and $\lambda_*>0$.

The charged Yukawa matrices are

$$
(Y_{u,*})_{ij}
=
s_Y^{(u)}\langle\sigma_{Y_u,ij}\rangle_{\omega_*},
\qquad
(Y_{d,*})_{ij}
=
s_Y^{(d)}\langle\sigma_{Y_d,ij}\rangle_{\omega_*},
\qquad
(Y_{e,*})_{ij}
=
s_Y^{(e)}\langle\sigma_{Y_e,ij}\rangle_{\omega_*}.
$$

Then

$$
M_u=\frac{v_*}{\sqrt2}Y_{u,*},
\qquad
M_d=\frac{v_*}{\sqrt2}Y_{d,*},
\qquad
M_e=\frac{v_*}{\sqrt2}Y_{e,*}.
$$

If the neutrino operator is retained,

$$
(\kappa_{\nu,*})_{ij}
=
s_\nu\langle\sigma_{\kappa_\nu,ij}\rangle_{\omega_*}.
$$

CKM and PMNS data are not independent coefficients in this ledger. They are algebraic invariants obtained by diagonalizing the calibrated charged and neutral flavor matrices. If an exact degeneracy occurs, basis rotations inside the degenerate subspace are response-null; only quotient-invariant mixing data are response-active.

For the gravitational convention

$$
S_{\mathrm{grav}}
=
\frac{c^3}{16\pi G_*}\int R\sqrt{-g}\,d^4x
-
\frac{c^3\Lambda_*}{8\pi G_*}\int\sqrt{-g}\,d^4x,
$$

write

$$
c_R
=
\frac{c^3}{16\pi G_*},
\qquad
c_0
=
-\frac{c^3\Lambda_*}{8\pi G_*}.
$$

USCP fixes

$$
c_R=s_R\langle\sigma_R\rangle_{\omega_*},
\qquad
c_0=s_0\langle\sigma_0\rangle_{\omega_*},
$$

so, whenever $c_R\ne0$,

$$
G_*
=
\frac{c^3}{16\pi s_R\langle\sigma_R\rangle_{\omega_*}},
\qquad
\Lambda_*
=
-\frac{s_0\langle\sigma_0\rangle_{\omega_*}}{2s_R\langle\sigma_R\rangle_{\omega_*}}.
$$

For a periodic topological angle, the response-active datum is circular. If the branch supplies a real representative $\theta\in(-\pi,\pi]$, then

$$
\theta_*=s_\theta\langle\sigma_\theta\rangle_{\omega_*}
\quad\text{mod }2\pi.
$$

Without such a representative, the circular symbol must include the accepted angle-unit convention before comparison. Define

$$
z_\theta
=
\sum_{\alpha\in\Omega_*}\omega_\alpha^*e^{i s_\theta\sigma_\theta(\alpha)}.
$$

If $z_\theta\ne0$, then $e^{i\theta_*}=z_\theta/|z_\theta|$ and $\theta_*=\arg z_\theta$. If $z_\theta=0$, no unique response-active angle is final-calibrated.

**Theorem V.3.11f (No Free Continuous Moduli after Final Spectral Calibration).** On a final-calibrated branch carrying $\mathfrak S_*$, every response-active coefficient multiplying an invariant operator in the accepted effective action is unique.

*Proof.* Let $I_B\in\mathcal I_*$ be response-active. By Definition V.3.11a, its finite spectral symbol $\sigma_B$ is fixed before comparison. By Theorem V.3.11c, $\omega_*$ is unique. By Definition V.3.11e, the branch-fixed unit bridge $s_B$, if required, is fixed before comparison. Hence

$$
c_B(\mu_*)
=
s_B\sum_{\alpha\in\Omega_*}\omega_\alpha^*\sigma_B(\alpha)
$$

is unique. If the accepted map $\mathcal R^*_{\mu\leftarrow\mu_*}$ is part of the comparison route, then $c_B(\mu)$ is also unique.

If $c_B$ could be changed while preserving the same final-calibrated branch, then at least one of the following must occur:

1. $\omega_*$ changes, contradicting Theorem V.3.11c;
2. $\sigma_B$ changes, so the finite spectral symbol and hence $\mathfrak S_*$ have changed;
3. $s_B$ or $\mathcal R^*_{\mu\leftarrow\mu_*}$ changes, so the unit bridge or comparison route is not the same sealed branch;
4. $I_B$ changes, so the accepted invariant operator basis $\mathcal I_*$ is not the same;
5. $I_B$ is response-null, in which case PPI removes it and it is not a physical coefficient.

All alternatives contradict the hypothesis that $I_B$ is a response-active invariant operator on the same final-calibrated branch. Hence no continuous coefficient remains free on that branch. ∎

**Corollary V.3.11g (Status Boundary for Numerical Constants).** Before $\mathfrak S_*$ is supplied and accepted, quantities such as

$$
g_3,
\quad
g_2,
\quad
g_Y,
\quad
\alpha,
\quad
G,
\quad
\Lambda,
\quad
\mu^2,
\quad
\lambda,
\quad
Y_u,
\quad
Y_d,
\quad
Y_e,
\quad
\kappa_\nu,
\quad
V_{\mathrm{CKM}},
\quad
U_{\mathrm{PMNS}},
\quad
\bar\theta
$$

retain the local status of their sector certificates, branches, thresholds, validation ledgers, reference conventions, or model layers. After $\mathfrak S_*$ is supplied and accepted, the response-active coefficients among them are branch-scaled finite spectral moments of $\omega_*$, and algebraic observables built from those coefficients are fixed by the same datum. No sector-by-sector fit remains.

*Proof.* Each listed basic coefficient is either the coefficient of an invariant operator or an entry of a coefficient matrix in the accepted effective action. Definition V.3.11e fixes every such response-active coefficient as a branch-scaled spectral moment of $\omega_*$. Quantities such as $\alpha$, $G$, $\Lambda$, masses, CKM data, PMNS data, and topological phases are algebraic or circular functions of those coefficients together with accepted branch conventions and RG maps. Algebraic and circular functions of fixed inputs are fixed, except for basis rotations inside exact degeneracies; those rotations are response-null by Definition V.3.11e and do not define additional physical moduli. Before $\mathfrak S_*$ is accepted, at least one required input in Definition V.3.11a or Definition V.3.11e is absent, so the previous local status labels remain in force. ∎

**Corollary V.3.11h (Golay-Uniform Reference State Gate).** Suppose a final spectral calibration datum $\mathfrak S_*$ is on the predictive-recovery MacWilliams Golay branch and its atom algebra is the codeword carrier
$$
\Omega_*=\mathcal G_{24}.
$$
If the accepted response-preserving automorphism group of the carrier contains the regular translation action of the additive code $\mathcal G_{24}$, or equivalently if the primitive codeword atoms have equal trace rank in Definition V.3.11a, then
$$
u_\alpha=\frac1{4096}
\qquad
(\alpha\in\mathcal G_{24}).
$$
The weight pushforward and the first eight central moment entries of this reference state are exactly the record of Theorem Z.13c.1:
$$
\mathbb P_{u_*}(W=0,8,12,16,24)
=
\frac{1}{4096}(1,759,2576,759,1),
$$
and
$$
\mathbb E_{u_*}[(W-12)^j]
=
\mathbb E_{\operatorname{Bin}(24,1/2)}[(B-12)^j]
\quad(0\le j\le7),
$$
with first deviation
$$
\mathbb E_{u_*}[(W-12)^8]
-
\mathbb E_{\operatorname{Bin}(24,1/2)}[(B-12)^8]
=
\frac{239085}{2}.
$$

This gate fixes the automorphism-invariant reference measure and its codeweight moment record on the stated carrier. It does not by itself supply the remaining entries required for final calibration: the response-active operator symbols $\sigma_B$, unit bridges $s_B$, RG/threshold route $\mathcal R^*_{\mu\leftarrow\mu_*}$, and any sector-specific residual symbols still have to be accepted before comparison. A heat-kernel, zeta-determinant, or symmetric-space harmonic computation may supply entries of $\mathfrak S_*$ only after it fixes the finite atom algebra, spectral time/scale or regularization, operator symbols, unit bridges, tail bounds, and route data before comparison. Invariance of an arena alone fixes at most the admissible reference measure on a transitive carrier; it does not derive the calibration polytope or close $R_\alpha$, $A_{\mathrm{eff}}$, or threshold data without those entries.

*Proof.* If the additive code acts by regular translations on the atom set, any invariant probability measure is constant on a single transitive orbit. If equal trace ranks are supplied instead, Definition V.3.11a gives $u_\alpha=\operatorname{Tr}P_\alpha/\operatorname{Tr}I_{\mathrm{cal}}=1/4096$. The weight pushforward and moment identities are then precisely Theorem Z.13c.1. The final sentence follows from the list of required entries in Definition V.3.11a and the coefficient map of Definition V.3.11e. ∎

**Theorem V.3.11i (Golay Association-Scheme Calibration Carrier).** On a final-calibration branch whose finite response carrier is the marked predictive-recovery Golay carrier, let
$$
\mathcal H_{\mathrm{cal}}
=
\mathbb C[\mathcal G_{24}\times F]
\tag{V.3.11i.1}
$$
where $F$ is the finite flag set fixed by the accepted branch markings, including the active/passive split, the $3+2+1$ block frame, and any accepted orientation or hypercharge sign convention. Let $\Gamma_{\mathrm{PU}}$ be the finite group of response-preserving automorphisms of this marked carrier. Define
$$
\mathcal E_{\mathrm{PU}}
=
\operatorname{End}_{\Gamma_{\mathrm{PU}}}(\mathcal H_{\mathrm{cal}})
=
\{A\in\operatorname{End}(\mathcal H_{\mathrm{cal}}):AU_\gamma=U_\gamma A\ \text{for all }\gamma\in\Gamma_{\mathrm{PU}}\}
\tag{V.3.11i.2}
$$
and
$$
\mathcal A_{\mathrm{Gol}}
=Z(\mathcal E_{\mathrm{PU}})_{\mathrm{sa}}.
\tag{V.3.11i.3}
$$
Then $\mathcal A_{\mathrm{Gol}}$ is a finite-dimensional commutative self-adjoint algebra with primitive central projections $\{P_\alpha\}_{\alpha\in\Omega_{\mathrm{Gol}}}$. On this branch the algebraic carrier of the final spectral calibration datum is forced to be
$$
\mathcal A_* = \mathcal A_{\mathrm{Gol}},
\qquad
\Omega_* = \Omega_{\mathrm{Gol}},
\qquad
u_\alpha=\frac{\operatorname{Tr}P_\alpha}{\operatorname{Tr}I_{\mathrm{cal}}}.
\tag{V.3.11i.4}
$$
For every response-active coefficient operator $\widehat O_B$ on the same finite carrier, the admissible symbol is the central conditional expectation symbol
$$
\sigma_B(\alpha)
=
\frac{\operatorname{Tr}\bigl(P_\alpha E_ZE_\Gamma(\widehat O_B)\bigr)}{\operatorname{Tr}P_\alpha},
\tag{V.3.11i.5}
$$
where
$$
E_\Gamma(\widehat O)
=
\frac1{|\Gamma_{\mathrm{PU}}|}\sum_{\gamma\in\Gamma_{\mathrm{PU}}}U_\gamma\widehat O U_\gamma^{-1}
\tag{V.3.11i.6}
$$
is the trace-preserving group-twirl projection onto $\mathcal E_{\mathrm{PU}}$, and $E_Z:\mathcal E_{\mathrm{PU}}\to Z(\mathcal E_{\mathrm{PU}})$ is the trace-preserving central conditional expectation. Thus the Golay branch does not allow a freely chosen calibration atom algebra: only the response-natural central algebra of the marked Golay commutant may serve as $\mathcal A_*$. The moment constraints, coefficient symbols, unit bridges, RG/threshold route, and residual symbols still have to satisfy Definition V.3.11a before final calibration.

*Proof.* The marked carrier is finite, so $\mathcal H_{\mathrm{cal}}$ is finite-dimensional and $\Gamma_{\mathrm{PU}}$ acts by a finite unitary representation. The commutant $\mathcal E_{\mathrm{PU}}$ in (V.3.11i.2) is therefore a finite-dimensional $*$-algebra. Its center is a finite-dimensional commutative $*$-algebra, and the self-adjoint part decomposes uniquely as
$$
Z(\mathcal E_{\mathrm{PU}})_{\mathrm{sa}}
=
\bigoplus_{\alpha\in\Omega_{\mathrm{Gol}}}\mathbb R P_\alpha
$$
for pairwise orthogonal primitive central projections $P_\alpha$ summing to $I_{\mathrm{cal}}$.

A response-natural calibration observable must be invariant under every response-preserving automorphism of the marked carrier; otherwise two automorphism-equivalent finite protocols would assign different calibration values. Hence it must lie in $\mathcal E_{\mathrm{PU}}$ after averaging by the unique trace-preserving group twirl (V.3.11i.6). Scalar coefficient data cannot depend on noncentral matrix coordinates inside an irreducible multiplicity block, because those coordinates are changed by basis choices that leave every central protocol-response stratum fixed. Therefore the scalar calibration algebra is the center of the commutant, namely (V.3.11i.3).

The finite-dimensional Wedderburn decomposition gives
$$
\mathcal E_{\mathrm{PU}}
\cong
\bigoplus_\alpha M_{m_\alpha}(\mathbb C)\otimes I_{r_\alpha}
$$
inside each central block. The map
$$
E_Z\left(\bigoplus_\alpha A_\alpha\otimes I_{r_\alpha}\right)
=
\bigoplus_\alpha \frac{\operatorname{tr}(A_\alpha)}{m_\alpha}I_{m_\alpha}\otimes I_{r_\alpha}
$$
is the unique trace-preserving conditional expectation from $\mathcal E_{\mathrm{PU}}$ to its center. Composing it with $E_\Gamma$ gives a trace-preserving response-preserving conditional expectation from all finite response operators to $\mathcal A_{\mathrm{Gol}}$. Formula (V.3.11i.5) is then exactly the symbol rule of Definition V.3.11a. The normalized trace state in (V.3.11i.4) is Definition V.3.11a applied to these primitive central projections. The final sentence follows because Definition V.3.11a requires moment values, symbols, units, routes, and residual entries in addition to the atom algebra. ∎

**Final calibrated-branch formula.** On a final-calibrated branch,

$$
\boxed{
\text{Physics}
=
\operatorname{Inv}(X_*)
+
\operatorname{Moments}_{\omega_*}(\operatorname{Spec}X_*),
}
$$

where $X_*$ denotes the accepted finite response datum whose atom algebra is $\mathcal A_*$, so $\operatorname{Spec}X_*$ means $\operatorname{Atom}(\mathcal A_*)=\Omega_*$ together with the accepted symbols $\{\sigma_B\}_{B\in\mathcal I_*}$. Also,

$$
\boxed{
\omega_*
=
\operatorname*{argmin}_{\omega\in\mathcal C_*}
D_{\mathrm{KL}}(\omega\Vert u_*).
}
$$
