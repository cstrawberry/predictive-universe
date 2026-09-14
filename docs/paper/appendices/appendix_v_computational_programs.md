# Appendix V: Computational Programs and Numerical Consistency Checks

This appendix provides arithmetic programs and observational inversions for the cosmological constant $\Lambda$, together with the parametric fine-structure program. The Appendix-U five-mode calculation is a declared reference conversion using $\kappa_{\mathrm{ref}}=141.5$ and the working convention $A_{\mathrm{eff}}=0.923\pm0.011$; it is not a realized false-vacuum theorem. On the four-mode route, Theorem U.13b supplies only sampled-angular Hessian nullity. The successive gates are $\mathfrak C_{U,\mathrm{mark}}$ for the independent $288$-direction carrier index, the exact exponent-calibration certificate $\mathfrak C_{U,\mathrm{act}}$ of Proposition U.14 for action $284$, $\mathfrak F_U^{(4)}$ for the Euclidean weight, and $\mathfrak R_\Lambda^{(4)}$ for the physical quantity $\Lambda_4L_P^2$. No accepted complete instance is present. The inversion formulas remain numerical diagnostics under stipulated action placements. The $\alpha_{\mathrm{em}}$ program gives a parametric, falsifiable roadmap with no continuous fitting after its baseline invariants and projection/matching conventions are fixed. Passing the finite audits strengthens reproducibility but does not promote missing physical certificates.

**Conventions.** Section V.1 uses SI units (with $c$ explicit). Sections V.2–V.2.5 use Heaviside–Lorentz units with $\hbar=c=1$; $\alpha_{\mathrm{em}}=e^2/(4\pi)$.

## V.0 Reproducibility Contract and Uncertainty Budgets

### V.0.0 PU Method Machine-Auditable Campaign Transport

The machine-readable campaign format in `pu_method/METHOD.md` is the normative transport for new computational closure packets. A terminal packet binds its claim and exact domain to an externally receipted pre-run attempt contract, pinned verifier and artifacts, typed provenance, canonical verifier output, and a fresh gate replay. Its optional strict-certificate registry profile retains the complete tuple $(\mathcal V,\mathcal E,\kappa_{\mathcal V},\sigma,\rho,\beta,\theta,\gamma,\delta,\zeta)$ and evaluates the named checks (C1)--(C18), while every accepted registry evidence binding resolves to a terminal campaign resolution that passes the ordinary replay gate. The companion source-envelope index reads exactly the forty-eight files authorized by `style.md`, preserves prime-significant identifiers and section-heading axioms, and rejects byte or extraction drift. The separately numbered method safeguards disclose vacuity, numerical-match false-positive rates, unresolved supersession, and post-comparison successor ceilings; they are not manuscript theorems. A successful infrastructure audit records only that the declared computation, registry, and evidence contracts passed; it cannot supply a missing physical bridge, source-exhaustion theorem, or empirical identification.

### V.0.1 Independent Arithmetic Audit

This appendix is intended to be mechanically reproducible from the displayed equations. An independent check should verify the following items without access to any unpublished derivations:

1. **Input ledger.** Fixed finite inputs for the displayed arithmetic are $K_0=3$, $N_{\mathrm{vis}}^{\min}=8$, $d_0=8$, $\varepsilon_0=\ln2$, $a=2$, $b=6$, and $M=24$ on their declared branches. Appendix U independently registers $(N_U,r_U)=(24,12)$ and hence the real tangent count $288$. The equality $S_{\mathrm{inst}}=2\kappa_{\mathrm{idx}}$ is not a fixed backbone input: it additionally requires the carrier/Hessian marking and Proposition U.14's exact exponent-calibration certificate $\mathfrak C_{U,\mathrm{act}}$.
2. **$\Lambda$ forward evaluation + inversion check.** Using Equation (V.2) with the registered reference-branch inputs $(\kappa,A_{\text{eff}})$ to compute the corresponding $\Lambda L_P^2$ value, and using Equations (V.4)–(V.5) together with Equation (V.3) to infer either $A_{\text{eff}}^{(\text{obs})}$ (holding $\kappa$ fixed) or an effective $\kappa$ (holding $A_{\text{eff}}$ fixed) from observational inputs $(H_0,\Omega_\Lambda,c,L_P)$.
3. **$\alpha_{\mathrm{em}}$ forward program.** Using Equation (V.8) to compute $u^*$ from $(M,\lambda,d_0)$ and Equation (V.10) to compute $\alpha^{-1}$ from $(u^*,K_0)$ including the explicit interface corrections.
4. **Uncertainty accounting.** Reported $1\sigma$ uncertainties separate (i) observational inputs, (ii) controlled truncation terms, and (iii) PU-to-physics mapping/systematic terms; when combined, they are combined in quadrature unless otherwise stated.

Numerical conventions: $\ln$ and $\exp$ denote the natural logarithm and exponential. Intermediate computations should retain at least 20 significant digits before final rounding; dimensionless combinations such as $\Lambda L_P^2$ should be formed exactly as written to avoid unit-conversion errors.

**Table V.0 — Consolidated numerical outputs and uncertainty budgets**

| Quantity | PU program | Central value | $1\sigma$ budget | Dominant contributions |
|:--|:--|:--|:--|:--|
| $\alpha^{-1}$ (Thomson limit) | Eqs. (V.8)–(V.10) with $K_0=3$, $d_0=8$, $M=24$, $u^*=8^{1/24}-1$; certificate row $\alpha^{-1}_{\mathrm{cert}}=\alpha^{-1}_{0}+R_\alpha$ | $\alpha^{-1}_{0}=137.03609205522863\ldots$ | branch comparison budget $\pm0.000060$ before residual closure | exact sinc-core arithmetic plus Section Z.27.9 comparison budget; theorem-level interval requires the residual gate of Definition Z.27.11a and Theorem Z.27.11j.1 |
| $\Lambda L_P^2$ (vacuum sector) | five-mode reference conversion and observational inversions; four-mode route $m_4\to\kappa_{\mathrm{idx}}\to S_{\mathrm{inst}}\to w_4\to\Lambda_4L_P^2$ | five-mode reference $(2.88\times10^{-122})$ | $\pm0.03\times10^{-122}$ reference budget | U.13b proves only sampled-Hessian nullity; $\mathfrak C_{U,\mathrm{mark}}$, Proposition U.14, $\mathfrak F_U^{(4)}$, and $\mathfrak R_\Lambda^{(4)}$ remain successive gates. Equation (V.5) gives the observational input and the displayed prefactor values are inversions, not forward evaluations |

### V.0.2 Convention Freeze Register

Each numerical model and prospective test carries one versioned record with the following fields:

| Field | Content |
|---|---|
| Identity | Row ID, source version, exact source-text or manifest hash |
| Expression | Formula, algorithm, units, Planck convention and all normalizations |
| Premises | Mathematical declarations, physical maps, accepted certificates and residual class |
| Inputs | Fixed values, candidate menu, calibrated quantities and permitted parameter ranges |
| History | Calibration data and dates, previous comparisons and selection history |
| Test | Held-out data identity, registration time, likelihood, covariance and decision rule |
| Outcome | Comparison status, failed conditions and the prospective test assigned to each model version |

The convention inventory includes vacuum nullity and bare $A_{\mathrm{eff}}$, the distinct five-mode reference, primordial $A_Q$ and reheating prescription, electroweak $A_{EW}$ and determinant prefactor, reduced and unreduced Planck masses, and the complete alpha interface/curvature/transport/residual package. Flavor records additionally fix triads, stiffness ratios, effective dimensions, response factors, ordering, phases and the complete selection procedure.

A registration binds a previously fixed source or manifest and records its own identity separately. A date entered after inspecting a comparison leaves that comparison retrospective. New versions retain earlier predictions, calibration choices and failed comparisons.

**PMNS phase row.** The convention-level candidate $\delta_{CP}=232.5^\circ$ can be fixed for a future comparison with proposed circular tolerance $20^\circ$. Its record includes the already quoted phase data, every input used to select the candidate, mass ordering, phase convention, joint covariance, and the geometric and physical certificates of Theorem T.24.22. The circular discrepancy is
$$
d_{S^1}(\delta,\delta_0)=\min_{m\in\mathbb Z}|\delta-\delta_0+360^\circ m|.
$$
A future likelihood tests the frozen numerical model with that selection history preserved. The registration field is completed by the actual pre-comparison record.

## V.1 The Cosmological Constant: Inversion for the Instanton Complexity $\kappa$

### V.1.1 Registered Vacuum-Model Equations and Gates for $\Lambda$

1. **Instanton action on the equal-contribution branch.** Assume the Appendix U action-complexity map that assigns the same dimensionless action contribution $C_{\max}/\varepsilon_0$ to every unit of $\kappa$. Then

   $$
   \boxed{S_{\mathrm{inst}}=\left(\frac{C_{\max}}{\varepsilon_0}\right)\kappa = 2\,\kappa} \tag{V.1}
   $$

   on the residual-budget branch, where Appendix E, Equation E.14 and Appendix Q, Equation Q.10 give $C_{\max}/\varepsilon_0=2$. The cited equations determine the ratio; the equal-contribution action map is a separate branch hypothesis. Here $\varepsilon_0=\ln2$ is the structural binary reference and is not a claim that every physical reset has cost $\ln2$. Every value proportional to $e^{-2\kappa}$ in this section is conditional on both the residual-budget ratio and the action-complexity map.

2. **Euclidean vacuum weight and conditional Einstein realization.** On an accepted action and Fredholm branch, define
   $$
   w:=A_{\mathrm{eff}}e^{-S_{\mathrm{inst}}}.
   $$
   This is a dimensionless Euclidean weight. Only an accepted vacuum-weight-to-Einstein record $\mathfrak R_\Lambda$ permits
   $$
   \boxed{\Lambda L_P^2=8\pi w=8\pi A_{\mathrm{eff}}e^{-S_{\mathrm{inst}}}}.
   \tag{V.2}
   $$
   The record fixes analytic continuation, finite-volume/extensivity normalization, the convention $L_P^2=\hbar G/c^3$, metric variation of the cosmological term, and source exhaustion. A determinant prefactor without that record does not define a physical $\Lambda$.

3. **Inversion for $\kappa$.** Solving Equation (V.2) using Equation (V.1),

   $$
   \boxed{\kappa \;=\; -\tfrac12\,\ln\!\left(\frac{\Lambda L_P^2}{8\pi A_{\text{eff}}}\right)} \tag{V.3}
   $$

### V.1.2 Observational Inputs

- **Cosmological hybrid diagonal-input convention for the 2018 Planck base-$\Lambda$CDM results [Planck Collaboration 2020a]:**
  $H_0=67.4\pm0.5~\mathrm{km\,s^{-1}\,Mpc^{-1}}$, $\Omega_{\Lambda}=0.6889\pm0.0056$.
  The $H_0$ pair is the rounded Planck TT,TE,EE+lowE+lensing marginal, while the $\Omega_\Lambda$ pair is from the corresponding Planck+BAO column. They are deliberately combined only as a declared diagonal sensitivity convention and are not presented as a draw from one joint Planck posterior.
- **Planck length from the 2022 CODATA adjustment [Mohr et al. 2025; NIST 2024]:**
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

The quoted uncertainty uses diagonal propagation of the declared hybrid $H_0$ and $\Omega_{\Lambda}$ marginal inputs; it is not a covariance-aware joint-posterior credible interval. The relative uncertainty in $L_P$ is negligible at this precision.

### V.1.4 Consistency Check via Inversion

Using the Appendix U five-mode comparison input $\kappa_{\mathrm{ref}}=141.5$ and the working convention $A_{\mathrm{eff}}=0.923\pm0.011$, Equation (V.2) gives the reference value $\Lambda L_P^2=(2.88\pm0.03)\times10^{-122}$. Theorem U.8c excludes the current pure-coordinate dilatation tangent as the required fifth zero mode, so this agreement with (V.5) is not a false-vacuum closure.

On the four-mode route, Theorem U.13b gives only $m_4=4$ under its sampled-angular spectral hypothesis. An accepted $\mathfrak C_{U,\mathrm{mark}}$ gives $\kappa_{\mathrm{idx}}=142$, and exact $\mathfrak C_{U,\mathrm{act}}$ then gives $B_U=284$. A complete canonical $\mathfrak F_U^{(4)}$ supplies a regulated false-vacuum decay magnitude; a legacy Definition-U.15d Fredholm record and U.15f.1 interval audit are admissible only through an accepted same-branch embedding supplying every actual U.73e field. The same working-prefactor substitution gives $(1.06\pm0.01)\times10^{-122}$ only as an arithmetic diagnostic. A physical forward interval requires $\mathfrak R_\Lambda^{(4)}$ to derive $w_4^{\mathrm{real}}$ and
$$
\Lambda_4L_P^2=8\pi w_4^{\mathrm{real}}.
$$
No accepted complete instance of the marking, exponent, decay, or real-stress record is present.

Setting $A_{\text{eff}}=1$ in Equation (V.3):

$$
\boxed{\kappa \;=\; -\tfrac12 \ln\!\left(\frac{2.86599\times10^{-122}}{8\pi}\right) \;=\; 141.543\ \pm\ 0.009} \tag{V.6}
$$

Holding $\kappa_{\mathrm{ref}}$ fixed within that Appendix U reference convention, the observed value (V.5) implies the effective prefactor

$$
A_{\text{eff}}^{(\text{obs})} := \frac{\Lambda L_P^2}{8\pi e^{-2\kappa_{\mathrm{ref}}}} = \frac{\Lambda L_P^2}{8\pi e^{-283}} = 0.917 \pm 0.016,
$$

numerically close to the Appendix U working convention $A_{\text{eff}}=0.923\pm0.011$ on the five-mode reference row. This is an observational-inversion diagnostic. Under the separately stipulated four-mode action placement $S=284$, the same observation would require

$$
A_{\text{eff}}^{(\text{obs},4)} := \frac{\Lambda L_P^2}{8\pi e^{-284}} = 2.49 \pm 0.04.
$$

On the separately declared five-mode equal-contribution action convention, the reference action value is

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

## V.2 Certificate-Conditional Derivation of $\alpha_{\mathrm{em}}$ on the Appendix Z Branch

This section evaluates the Appendix Z fine-structure value conditionally on its registered branch and matching data. The inherited package includes the PCE-attractor conditions of Definition 15a, the minimal Hilbert-carrier and rank-two active-projector branches, the unit Predictive-Ward normalization of Theorem Z.14, the independent unit-interface-response specialization $c_{\mathrm{int}}=1$ of Theorem Z.17, the independent democratic visible-response input $L_{\mathrm{vis}}=1/(ad_0)$ of Theorem Z.24, which Lemma Z.24a does not derive, the normalized Chern-flux branch of Lemma Z.14, the separable curvature-response branch of Theorem Z.25, the electromagnetic-projection branch, the $SU(2)$ transport ansatz of Lemma Z.13, and the residual gate. Once those antecedents are supplied, the remaining evaluation is arithmetic.

### V.2.1 Structural and Branch Inputs

- **MPU Hilbert Space Dimension:** Theorem 23 gives $d_0\ge8$ from Hilbert distinguishability; Theorem Z.2 gives $d_0=8$ only on the active-dimension-saturation branch.
- **Structural Binary Reference:** $\varepsilon_0=\ln2$ nats is the log-cardinality of the registered binary verification quotient (Definition 28; Theorem J.1).
- **Attractor Conditions:** Definition 15a requires attainment, a singleton quotient minimizer, flat U(1) SLD-QFI, and the declared capacity-boundary condition.

### V.2.2 Derived Interface Spectrum on the Registered Branch

For the selected state $\rho_0=I_a/a\oplus0_b$ with $(d_0,a,b)=(8,2,6)$ and the Hilbert--Schmidt-normalized interface generators of Theorem Z.5, the SLD-QFI calculation gives:

- **Number of Information Modes:** $M=2ab=2\cdot2\cdot6=24$.
- **Per-Mode Sensitivity:** $\lambda=2/a=1$ (here $\lambda$ denotes the QFI eigenvalue of the interface modes; it is unrelated to the resource-scarcity parameter of Definition 20).

### V.2.3 Capacity Saturation Condition

On the cap-active PCE-Attractor branch, the operational alphabet capacity saturates at $\ln d_0$ (Theorem Z.7). The predictive information gain equals the operational alphabet capacity:

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

**Executed source-only audit record.** Freeze the scalar model branch before loading any charged-lepton mass, mass ratio, or mass-derived proxy. Let
$$
s:=\operatorname{sinc}(1/\sqrt3),
\qquad
\alpha_{\mathrm{IR}}=\frac32s,
$$
and use the registered pair data
$$
(d_{\tau\mu}^2,D_{\mathrm{eff}}(2))=(2,3/8),
\qquad
(d_{\mu e}^2,D_{\mathrm{eff}}(4))=(4,13/6).
$$
On Theorem T.42.2's conditional exact-fourth-derivative subbranch $\beta_{\mathrm{pkt}}=1/144$, the diagnostic zero-remainder specialization gives
$$
\begin{aligned}
L_{\tau\mu}^{(0)}
&=3s-\frac1{96}
=2.8256725003445850593\ldots,\\
L_{\mu e}^{(0)}
&=6s-\frac{13}{54}
=5.4314375932817627113\ldots,\\
L_{\tau e}^{(0)}
&=L_{\tau\mu}^{(0)}+L_{\mu e}^{(0)}
=9s-\frac{217}{864}
=8.2571100936263477706\ldots,
\end{aligned}
$$
with the algebraically dependent model ratio
$$
\frac{L_{\tau e}^{(0)}}{L_{\tau\mu}^{(0)}}
=2.9221751963893231990\ldots .
$$
This exact scalar evaluation reproduces the conditional model exponents in Theorem T.42.6 and Tables T.21.2 and T.25.4.2 without a charged-lepton target input.

The uncertainty and provenance entries remain separated. Theorem T.42.2 assigns the truncation intervals
$$
|\mathcal R_{6,\tau\mu}(\sqrt2)|\le8B_{\tau\mu},
\qquad
|\mathcal R_{6,\mu e}(2)|\le64B_{\mu e};
$$
the current record supplies neither numerical $B_{\tau\mu}$ nor numerical $B_{\mu e}$, so the zero-remainder specialization is not a controlled interval. The unit-radius convention, Theorem T.24.2.1 sinc prescription, Theorem T.42.5 effective-dimension assignments, and the conditional $\beta_{\mathrm{pkt}}=1/144$ output are branch-normalization entries without a joint numerical uncertainty envelope. After the model-output hash was sealed, comparison with Appendix T's rounded logarithms $(2.8224,5.3316,8.1540)$ gave residuals
$$
+0.003272500344585\ldots,
\qquad
+0.099837593281763\ldots,
\qquad
+0.103110093626348\ldots .
$$
Those rounded comparison values carry no covariance record in this audit and are not inputs to the displayed model evaluation.

Theorem T.39 assigns physical mass-log identification to an accepted $\mathfrak C_{Y\to m}$ containing the complete magnitude and phase matrices, matching map, diagonalizers, ordered singular values, labels, and residual intervals. The current source supplies no accepted $\mathfrak C_{Y\to m}$ and no accepted common packet/VVM certificate with numerical endpoint bounds. Consequently the frozen scalar record determines the displayed conditional model exponents but does not entail $\log(m_\tau/m_\mu)$ or $\log(m_\mu/m_e)$ as physical quantities.

| Resolution-artifact field | `V.3.1-R1` record |
|---|---|
| Catalog binding and polarity | `TV-V-03`; `positive-discharge` for the exact conditional arithmetic subproposition and `nonentailment` for physical mass-log identification from the frozen scalar record |
| Exact domain and equivalence | The two registered adjacent-edge scalar expressions and their algebraic path sum; equality is exact real-number equality under the displayed branch substitutions |
| Premises | Theorem T.39's scalar-kernel type boundary; Theorem T.24.2.1's registered sinc prescription; Theorem T.42.2's conditional exact coefficient; Theorem T.42.5's registered effective dimensions; Theorem T.42.6's zero-remainder diagnostic specialization |
| Exhaustive budget and coverage | Both adjacent charged-lepton paths, the dependent path sum, every displayed scalar correction, and the symbolic endpoint remainder bounds |
| Source snapshot | `appendix_t_electroweak_hierarchy.md` SHA-256 `fdc58676499d7cf1aa327beac089e88db611ff548bb25179649a0fd3da36f73c`; pre-insertion `appendix_v_computational_programs.md` SHA-256 `8c4391b15d3b72183871639fdb8fb1b5322f1178ed025e375825965dbb52d04c` |
| Verifier, executable and runtime | Exact symbolic substitution in both scalar expressions, 100-decimal evaluation, algebraic path-sum verification, and the displayed Theorem-T.39 realization-type audit; audit source SHA-256 `10c71ff430f94d2a8b155363eb676ea8aa571f23a47150a7880a1c711545dfc5`; Python 3.13.12 executable SHA-256 `a38f63d2b8843820b59746250911cd203dbd76c8dc53693007aaa3bda2007232`; an independent Node.js 22.22.0 binary64 evaluation agreed at displayed binary64 precision |
| Canonical input and output | Compact sorted ASCII JSON with no terminal LF; input SHA-256 `5048bd397f4e381ff2e691cc3a039683753df742312c84083cc55ab0a6112bfd`; eight-field 80-decimal output SHA-256 `e633f663b418d6e474da34ac6d7f2391e7b1a83852a140e00aedd8b552cb4216` |
| Integrity invalidator | A source, executable, runtime, input or output hash mismatch; loading a charged-lepton target or proxy before sealing the model output; or changing a registered branch entry after comparison |
| Falsifier | An exact arithmetic mismatch on the hashed branch, or a derivation of the physical mass logs from the same scalar record without adding any Theorem-T.39 realization field |
| Provenance class | Source-derived conditional model arithmetic with a target-firewalled execution and a theorem-level mass-realization type audit |
| Nonvacuity disposition | The displayed branch has explicit positive scalar inputs and finite outputs; the nonentailment concerns the missing map from those scalar outputs to ordered physical singular values, not an empty arithmetic domain |
| Downstream consumers | The arithmetic remains a regression input; $\mathfrak C_{\mathrm{pkt/VVM}}^\ell$, $\mathfrak C_{Y\to m}$, the flavor selector, matching/RG, residual and prospective comparison obligations remain with `RT-T3` and their Appendix-T atomic targets |
| Audit result | Pass for reproducibility of the conditional scalar arithmetic; fail under V.3.1's forward physical-log-ratio pass condition, with `nonentailment` at that exact scope |

This closes the finite source-only audit at its arithmetic/nonentailment scope. The flavor, packet/VVM, full-matrix realization, matching, remainder and prospective empirical components remain assigned to the named `RT-T3` records.

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

**Executed regression record (canonical source snapshot).** The input is Theorem Z.13c's displayed $G=[I_{12}\mid P]$. Canonically serialize $G$ as twelve rows of twenty-four ASCII `0`/`1` digits, each terminated by LF, including the final row. This serialization is the complete frozen enumerator input; its SHA-256 is `66456146028f1a1af61fbad30a802ec5dbd647d3dec697c78593a6b4c611eb81`.

Exhausting all $u\in\mathbb F_2^{12}$ and evaluating $c=(u,uP)$ gives

$$
\{A_0,A_8,A_{12},A_{16},A_{24}\}
=
\{1,759,2576,759,1\}.
$$

Direct multiplication over $\mathbb F_2$ gives $PP^T=I_{12}$ and $GG^T=0$; the identity block gives rank $12$. The enumeration gives minimum nonzero weight $8$ and weights divisible by four. Hence the span is a binary linear $[24,12,8]$ code, and the classification cited in Theorem Z.13c makes it coordinate-permutation equivalent to $\mathcal G_{24}$. The $759$ weight-eight supports are distinct. Exhaustive containment counts over every $t$-subset give:

| $t$ | Octads containing each $t$-subset | Number of $t$-subsets checked |
|:--:|--:|--:|
| $0$ | $759$ | $1$ |
| $1$ | $253$ | $24$ |
| $2$ | $77$ | $276$ |
| $3$ | $21$ | $2024$ |
| $4$ | $5$ | $10626$ |
| $5$ | $1$ | $42504$ |

Thus the residual-shell ratios extracted from the enumeration are

$$
\lambda_1:\lambda_2:\lambda_3:\lambda_4:\lambda_5
=253:77:21:5:1.
$$

| Regression artifact field | `V.3.2-R1` record |
|---|---|
| Catalog binding and polarity | `TV-V-04`; `positive-discharge` of the exact finite regression proposition |
| Exact domain and equivalence | The complete row span of the hashed displayed $G$ over $\mathbb F_2$; code equivalence is coordinate permutation, while incidence uses the displayed coordinate labels |
| Premises | The exact hashed generator serialization, arithmetic over $\mathbb F_2$, and the binary $[24,12,8]$ classification cited in Theorem Z.13c |
| Exhaustive budget and coverage | All $2^{12}=4096$ input words and every labeled $t$-subset for $0\le t\le5$ |
| Verifier | Exact $\mathbb F_2$ matrix multiplication, row-span enumeration, integer popcount and subset-incidence histograms under Node.js 22.22.0, followed by an independent exact reimplementation; both executions returned the displayed record |
| Integrity invalidator | A generator-hash mismatch, incomplete $4096$-word or subset coverage, or verifier disagreement |
| Falsifier | On the exact hashed input with exhaustive valid coverage, a rank, self-orthogonality, weight, code-equivalence, incidence or extracted-ratio mismatch |
| Provenance class | Source-derived finite computation whose checker inputs are exhausted by the displayed generator and exact source mathematics |
| Nonvacuity disposition | Positive finite-audit disposition: the hashed input decodes to the displayed $12\times24$ matrix, whose enumerated span contains $4096$ words and $759$ distinct weight-eight supports |
| Consumers | This finite incidence audit and the combinatorial input to the residual-shell ratios; physical-code status remains owned by the Appendix-Z physical-code branch |
| Regression result | Pass for the exact finite regression proposition |

This closes the finite code-combinatorics audit at its regression scope. The physical encoder, noise law, syndrome/recovery map, resource ledger and substrate realization remain separate records governed by the Appendix-Z physical-code branch.

### V.3.3 Backbone Integer-Ledger Audit

**Target.** Verify the finite symbolic chain

$$
\begin{aligned}
&\{K_0=3;\ \text{Theorems 15 and 23 plus the Z.2 same-class comparator}\}
   &&\Longrightarrow d_0=8,\\
&\{d_0=8;\ \text{Z.1 active-record, capacity, quotient, and no-surplus gates}\}
   &&\Longrightarrow (a,b,k_{\mathrm{tan}},M)=(2,6,12,24),\\
&\{M=24;\ \text{predictive-recovery MacWilliams gate}\}
   &&\Longrightarrow k=12,\\
&\{M=24;\ \text{mode-to-cell injection, feasibility, and least-support gate}\}
   &&\Longrightarrow D=4.
\end{aligned}
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

**Executed implication/type audit.** The source audit gives the following antecedent ledger for the four arrows.

1. Theorem 15 derives $K_0=3$ and the attained eight-context floor under (O1)–(O3), (FC). The implication from this branch result to $d_0=8$ additionally uses Theorem 23's conditional Hilbert-dimension bound under mutually perfectly distinguishable representatives and Theorem Z.2's admissible same-response $\mathbb C^8$ comparator, identical non-support ledger and strict support-cost comparison.
2. The implication to $(a,b,k_{\mathrm{tan}},M)=(2,6,12,24)$ additionally uses all hypotheses of Theorem Z.1: the sharp match/mismatch quotient and entropy-capacity gate; a nonempty comparison class with response and predictive performance fixed; an admissible $a=2$ witness; and strictly increasing maintained-support cost with no compensating improvement in another ledger term. The retained PCE-attractor/QFI tangent interpretation supplies the tangent reading, and Theorem Z.5 fixes the QFI-active mode count $M=24$. For $E=\mathbb C^8$ and a rank-two projector $p$, the audit computes
   $$
   \dim_{\mathbb C}pE=2,
   \qquad
   \dim_{\mathbb C}(1-p)E=6,
   \qquad
   k_{\mathrm{tan}}:=\dim_{\mathbb C}\operatorname{Hom}(pE,(1-p)E)=2\cdot6=12,
   $$
   $$
   \dim_{\mathbb R}T_p\operatorname{Gr}(2,8)=2\cdot2\cdot6=24=M.
   $$
3. The implication from $M=24$ to binary code dimension $k=12$ additionally uses all four clauses of Definition Z.13b.0 and the conditional rate conclusion of Theorem Z.13b.0a. The typed interface-code admission maps $M$ to code length $n$; $k_{\mathrm{tan}}$ and the binary code dimension $k$ remain distinct typed objects even when both equal $12$. The conditional conclusion is the rate statement $k=n/2$. Distance-eight attainment and coordinate equivalence are witnessed by Theorem Z.13c; retained Golay-code selection requires Theorem Z.13b's separate fixed-rate distance-selection certificate.
4. The implication to $D=4$ uses Definition Z.9a's normalized Bures/SLD metric, injective response-preserving labeling of distinct equal-radius, nonoverlapping cells by all $24$ modes, response-null-anisotropy quotient and least-feasible positive-support comparison, together with Theorem Z.10's mode-cell bound and Theorem Z.11's exact lower-dimensional exclusion, explicit regular-$24$-cell witness and least-feasible conclusion. This $D$ is the Euclidean tangent-shell dimension; identifying it with physical $3+1$ spacetime requires the separate continuum, time-orientation and metric-reconstruction branch.

| Regression artifact field | `V.3.3-R1` record |
|---|---|
| Catalog binding and polarity | `TV-V-05`; `positive-discharge` of the exact branch-qualified implication-audit proposition |
| Exact domain and equivalence | The four displayed implications, with equality restricted to objects of the same declared type |
| Premises | Exactly the branch packages and typed source declarations enumerated in items 1–4 |
| Exhaustive budget and coverage | All four arrows, every named antecedent above and all four required Peirce dimensions |
| Verifier | Exact integer arithmetic plus a source-and-type check against Theorems 15, 23, Z.1, Z.2, Z.5, Z.10, Z.11 and Z.13b.0a and Definitions Z.9a and Z.13b.0 |
| Integrity or applicability failure | An omitted antecedent, type merge, unsupported citation, or unpopulated or failed branch premise |
| Falsifier | An exact arithmetic or type mismatch, or a counterexample satisfying every displayed antecedent while violating the stated conclusion |
| Provenance class | Source-derived branch audit whose inputs are exhausted by the named declarations and exact arithmetic |
| Nonvacuity disposition | Positive implication-audit disposition: the nonempty comparison class and admissible witness remain explicit antecedents in item 2 |
| Consumers | The branch-qualified integer ledger; code realization, spacetime identification and common-carrier coexistence retain their separate gates |
| Regression result | Pass for the exact branch-qualified regression proposition |

The arithmetic and type checks accept each implication under its displayed branch package. Omitting a listed package invalidates the cited implication. The accepted scope is the displayed antecedent ledger; premise minimality and exclusion of alternative derivations require separate theorems. The accepted result is the vector of four branch-qualified implications. Promoting this displayed conditional chain to an unconditional chain requires positive discharge of every displayed branch package or a separate unconditional derivation. This closes the implication-ledger regression at its branch-qualified scope; common-carrier coexistence remains a separate certificate.

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

**Resolution record V.3.5-R1 (`TV-V-07`, McKay-only normalization no-go).** Let a finite McKay diagram, its marks, and its representation assignment supply any positive discrete triple
$$
(C_1,C_2,C_3)\in\mathbb R_{>0}^3,
\qquad
\kappa_i=C_i\chi_i,
\qquad
\chi_i>0,
$$
while leaving the three sector normalizations $\chi_i$ unconstrained, as required by the McKay-only comparison class. The two positive scale vectors
$$
\chi^{(0)}
=
\left(\frac1{C_1},\frac1{C_2},\frac{19}{12C_3}\right),
\qquad
\chi^{(28)}
=
\left(\frac1{C_1},\frac1{C_2},\frac1{C_3}\right)
\tag{V.3.5-R1.1}
$$
give, for the same discrete diagram data,
$$
\kappa^{(0)}=\left(1,1,\frac{19}{12}\right),
\qquad
21\kappa_1^{(0)}+55\kappa_2^{(0)}-48\kappa_3^{(0)}=0,
$$
and
$$
\kappa^{(28)}=(1,1,1),
\qquad
21\kappa_1^{(28)}+55\kappa_2^{(28)}-48\kappa_3^{(28)}=28.
\tag{V.3.5-R1.2}
$$
Equivalence in the frozen McKay-only class is marked-diagram isomorphism preserving the marks, representation assignment, and discrete triple $(C_1,C_2,C_3)$; it does not identify distinct relative scale vectors $(\chi_1,\chi_2,\chi_3)$. The background positive-triple class is nonempty: at $(C_1,C_2,C_3)=(1,1,1)$, the two displayed scale vectors are $(1,1,19/12)$ and $(1,1,1)$ and give the two displayed residuals.

Thus no positive discrete triple, and hence no finite diagram that supplies only such a triple, forces the Bures-weight equation. The proof is uniform in $(C_1,C_2,C_3)$, so diagram enumeration is unnecessary. Definition V.3.12a and Proposition V.3.12b give the executed exact-arithmetic verifier, integrity record, falsifier, and nonvacuity witnesses.

This is a `negative-refutation` of the complete McKay-only proposition. A theorem that fixes the relative $\chi_i$ would add normalization data and therefore leave this comparison class; it is the separately allowed positive Bures-weight-certificate route of Theorem T.34.1b, not an exception to the no-go. The catalog row is consequently a closed guardrail rather than a live McKay computation.

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

The finite checks confirm the arithmetic that can be evaluated from the present data. The spectral audit remains open because its block, minimization, finite-part, and tail records are absent. Separate finite cardinality and arithmetic checks remain closed at their own audit level.

#### Technical audit ledger

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

**Definition V.3.11a (Finite Spectral Calibration Datum).** A final spectral calibration datum for a sealed PU branch is a finite tuple
$$
\mathfrak S_*
=
\left(
\mathcal A_*,
\Omega_*,
\mathcal Q_{\mathrm{null}},
\nu_*,
\nu_*^{\mathrm{fs}},
\{m_a,c_a^*\}_{a\in A},
\mathcal Q_{\mathrm{ind}},
\mathcal I_*,
\{\widehat O_B,\sigma_B,s_B\}_{B\in\mathcal I_*},
\mathcal R^*_{\mu\leftarrow\mu_*},
\mathcal C_{\circlearrowleft},
\mathcal O_*,
\chi_*
\right).
\tag{V.3.11a.1}
$$
The entries are as follows.

1. $\mathcal A_*$ is the finite-dimensional commutative self-adjoint calibration algebra generated by all response-active calibration observables retained by the sealed branch. It is represented on a finite calibration carrier $\mathcal H_{\mathrm{cal}}$ and decomposes as
$$
\mathcal A_*=
\bigoplus_{\alpha\in\Omega_*}\mathbb R P_\alpha,
\qquad
P_\alpha P_\beta=\delta_{\alpha\beta}P_\alpha,
\qquad
\sum_{\alpha\in\Omega_*}P_\alpha=I_{\mathrm{cal}}.
\tag{V.3.11a.2}
$$

2. $\Omega_*=\operatorname{Atom}(\mathcal A_*)$ is the finite atom set after applying the response-null quotient $\mathcal Q_{\mathrm{null}}$. Two primitive labels that induce the same finite protocol-response functional are identified before $\Omega_*$ is accepted.

3. $\nu_*=(\nu_{*,\alpha})_{\alpha\in\Omega_*}$ is the invariant reference measure on the atom set. It is induced by the normalized trace state or by an accepted symmetry-invariant finite measure record:
$$
\nu_{*,\alpha}>0,
\qquad
\sum_{\alpha\in\Omega_*}\nu_{*,\alpha}=1.
\tag{V.3.11a.3}
$$
If the branch uses only primitive atom multiplicities, then $\nu_{*,\alpha}=\operatorname{Tr}P_\alpha/\operatorname{Tr}I_{\mathrm{cal}}$. Equal weights require an accepted equal-rank or transitive-symmetry record.

4. $\nu_*^{\mathrm{fs}}\in\Delta(\Omega_*)$ is a full-support feasibility witness satisfying all accepted constraint moments. It is an entry of the datum, not a conclusion inferred from successful numerical comparison.

5. Each $m_a:\Omega_*\to\mathbb R$ is a fixed spectral moment function encoding an already accepted structural constraint, Ward identity, anomaly constraint, index constraint, determinant orientation, threshold condition, flavor condition, horizon condition, vacuum-response condition, or residual-source condition. The required value $c_a^*$ is fixed by that parent certificate before comparison.

6. $\mathcal Q_{\mathrm{ind}}$ is the independent-constraint quotient. It removes affine combinations of the moment equations that are constant on all atoms or implied by other accepted moment equations. The retained index set is $A_{\mathrm{ind}}$.

7. $\mathcal I_*$ is the accepted response-active invariant operator basis of the effective action at the calibration scale. It includes only operators whose local certificates have already been accepted. A final calibration datum may project such certificates to common spectral symbols; it may not replace them.

8. For every $B\in\mathcal I_*$, $\widehat O_B$ is the finite response operator, $\sigma_B:\Omega_*\to\mathbb R$ is its spectral symbol, and $s_B$ is the branch-fixed unit or normalization bridge. If $\widehat O_B\in\mathcal A_*$, then
$$
\sigma_B(\alpha)
=
\frac{\operatorname{Tr}(P_\alpha\widehat O_B)}{\operatorname{Tr}P_\alpha}.
\tag{V.3.11a.4}
$$
If $\widehat O_B$ lies in a larger finite response algebra, the datum must include a trace-preserving response-preserving conditional expectation $E_*:\widehat{\mathcal A}_{\mathrm{resp}}\to\mathcal A_*$ and use
$$
\sigma_B(\alpha)
=
\frac{\operatorname{Tr}(P_\alpha E_*(\widehat O_B))}{\operatorname{Tr}P_\alpha}.
\tag{V.3.11a.5}
$$

9. $\mathcal R^*_{\mu\leftarrow\mu_*}$ is the branch-accepted unit, RG, threshold, and matching route from the calibration scale to every comparison scale claimed by the branch.

10. $\mathcal C_{\circlearrowleft}$ is the circular-angle convention. It records whether a periodic coefficient is represented by a real lift, a unit complex moment, or a finite cyclic label, and fixes the angle unit before comparison. Strong-CP, Berry, and theta-like symbols must use this entry.

11. $\mathcal O_*$ is the overlap map to parent sectors. It lists the accepted local records from which the calibration symbols descend, including where claimed the electroweak threshold record, flavor record, four-mode Hessian/carrier marking, Proposition-U.14 action premise, Fredholm weight, vacuum-to-Einstein realization, primordial determinant, vacuum determinant, gravitational coupling symbol, Higgs symbols, Yukawa symbols, neutrino operator symbol, baryogenesis source, dark-susceptibility kernel, horizon recovery/design record, and strong-CP determinant orientation.

12. $\chi_*$ is the forward-lock record. It asserts that no empirical comparison value, validation target, post-comparison residual, fitted phenomenological kernel, or dependent-row output enters $\mathcal A_*$, $\Omega_*$, $\mathcal Q_{\mathrm{null}}$, $\nu_*$, $\nu_*^{\mathrm{fs}}$, $m_a$, $c_a^*$, $\mathcal Q_{\mathrm{ind}}$, $\widehat O_B$, $\sigma_B$, $s_B$, $\mathcal R^*_{\mu\leftarrow\mu_*}$, $\mathcal C_{\circlearrowleft}$, or $\mathcal O_*$ unless it is explicitly registered as an EmpiricalInput. Such an entry blocks theorem-level final calibration for every sector depending on it.

The admissible spectral calibration polytope is
$$
\mathcal C_*
=
\left\{
\omega\in\Delta(\Omega_*):
\sum_{\alpha\in\Omega_*}\omega_\alpha m_a(\alpha)=c_a^*
\text{ for every }a\in A_{\mathrm{ind}}
\right\},
\tag{V.3.11a.6}
$$
where
$$
\Delta(\Omega_*)=
\left\{
\omega_\alpha\ge0,
\sum_{\alpha\in\Omega_*}\omega_\alpha=1
\right\}.
\tag{V.3.11a.7}
$$
A branch is final-calibration admissible exactly when $\mathcal C_*$ is nonempty and the witness $\nu_*^{\mathrm{fs}}$ satisfies
$$
\nu_*^{\mathrm{fs}}\in\mathcal C_*,
\qquad
\nu_{*,\alpha}^{\mathrm{fs}}>0
\quad
\text{for every }\alpha\in\Omega_*.
\tag{V.3.11a.8}
$$
**Principle V.3.11b (Unique Spectral Calibration Principle).** On a final-calibration admissible branch, the calibrated spectral state is
$$
\omega_*
=
\operatorname*{argmin}_{\omega\in\mathcal C_*}
D_{\mathrm{KL}}(\omega\Vert\nu_*),
\tag{V.3.11b.1}
$$
where
$$
D_{\mathrm{KL}}(\omega\Vert\nu_*)
=
\sum_{\alpha\in\Omega_*}
\omega_\alpha
\log\frac{\omega_\alpha}{\nu_{*,\alpha}},
\qquad
0\log0:=0.
\tag{V.3.11b.2}
$$
Equivalently, $\omega_*$ is the maximum relative spectral-entropy state compatible with all accepted finite-response constraints:
$$
\omega_*
=
\operatorname*{argmax}_{\omega\in\mathcal C_*}
\left[
-\sum_{\alpha\in\Omega_*}
\omega_\alpha
\log\frac{\omega_\alpha}{\nu_{*,\alpha}}
\right].
\tag{V.3.11b.3}
$$

**Theorem V.3.11c (Existence and Uniqueness of the Calibrated Spectral State).** If $\mathfrak S_*$ is final-calibration admissible, then $\omega_*$ exists, is unique, and has full support on $\Omega_*$.

*Proof.* The simplex $\Delta(\Omega_*)$ is compact and convex because $\Omega_*$ is finite. The independent moment equations defining $\mathcal C_*$ are affine, so $\mathcal C_*$ is a closed convex subset of $\Delta(\Omega_*)$. By Definition V.3.11a, $\mathcal C_*$ is nonempty and contains the full-support witness $\nu_*^{\mathrm{fs}}$. Since every $\nu_{*,\alpha}$ is positive, $D_{\mathrm{KL}}(\omega\Vert\nu_*)$ is continuous on $\Delta(\Omega_*)$ and attains a minimum on $\mathcal C_*$.

For $\nu_{*,\alpha}>0$, the scalar function $x\mapsto x\log(x/\nu_{*,\alpha})$ is strictly convex on $[0,\infty)$. Hence $D_{\mathrm{KL}}(\cdot\Vert\nu_*)$ is strictly convex on $\Delta(\Omega_*)$ and has at most one minimizer on the convex set $\mathcal C_*$. Thus the minimizer exists and is unique.

It remains to show full support. Suppose the unique minimizer has a nonempty zero set $Z=\{\alpha:\omega_{*,\alpha}=0\}$. For $0<t<1$ set
$$
\omega(t)=(1-t)\omega_*+t\nu_*^{\mathrm{fs}}.
$$
Then $\omega(t)\in\mathcal C_*$. The contribution to $D_{\mathrm{KL}}(\omega(t)\Vert\nu_*)-D_{\mathrm{KL}}(\omega_*\Vert\nu_*)$ from coordinates in $Z$ is
$$
\sum_{\alpha\in Z}t\nu_{*,\alpha}^{\mathrm{fs}}
\log\frac{t\nu_{*,\alpha}^{\mathrm{fs}}}{\nu_{*,\alpha}}
=
t\log t\sum_{\alpha\in Z}\nu_{*,\alpha}^{\mathrm{fs}}+O(t),
$$
which is negative for all sufficiently small $t>0$. This contradicts minimality. Hence $\omega_{*,\alpha}>0$ for every $\alpha\in\Omega_*$. ∎

**Theorem V.3.11c.1 (Pythagorean and Nested Spectral Calibration).** Let $\mathcal C$ be an affine moment family satisfying Definition V.3.11a, let $\nu$ have full support, and let
$$
\omega_{\mathcal C}
=\operatorname*{argmin}_{\omega\in\mathcal C}
D_{KL}(\omega\Vert\nu)
\tag{V.3.11c.1.1}
$$
have full support. Then every $\omega\in\mathcal C$ obeys the exact Pythagorean identity
$$
D_{KL}(\omega\Vert\nu)
=
D_{KL}(\omega\Vert\omega_{\mathcal C})
+D_{KL}(\omega_{\mathcal C}\Vert\nu).
\tag{V.3.11c.1.2}
$$
If $\mathcal C_2\subseteq\mathcal C_1$ are nested admissible affine families and the projections onto both families exist with full support, direct calibration of $\nu$ onto $\mathcal C_2$ equals sequential calibration through $\mathcal C_1$:
$$
\Pi_{\mathcal C_2}^{KL}(\nu)
=
\Pi_{\mathcal C_2}^{KL}
\bigl(\Pi_{\mathcal C_1}^{KL}(\nu)\bigr).
\tag{V.3.11c.1.3}
$$
The KL increments telescope, so a constraint inherited through a nested calibration is not counted again as an independent fit contribution.

*Proof.* The KKT equation for the affine family makes
$$
\log\frac{\omega_{\mathcal C,\alpha}}{\nu_\alpha}
$$
an affine combination of the normalized moment constraints. Expanding the difference between the two sides of (V.3.11c.1.2), the remaining term is its expectation under $\omega-\omega_{\mathcal C}$ and vanishes because both states have the same constrained moments and normalization. For $\omega\in\mathcal C_2\subseteq\mathcal C_1$, the first projection contributes the constant $D_{KL}(\omega_{\mathcal C_1}\Vert\nu)$; minimizing the remaining term over $\mathcal C_2$ proves (V.3.11c.1.3). ∎

**Theorem V.3.11c.2 (Perturbation Rigidity of Spectral Moments).** On an independent exponential-family chart, let $\theta$ be the multiplier vector and $c(\theta)$ the retained moment vector. Suppose every state on the line segment between two accepted calibrations has covariance Hessian
$$
\operatorname{Cov}_{\omega_\theta}(m)
\succeq\gamma I,
\qquad
\gamma>0.
\tag{V.3.11c.2.1}
$$
Then
$$
\|\theta'-\theta\|
\le
\frac{\|c'-c\|}{\gamma}.
\tag{V.3.11c.2.2}
$$
For every calibrated coefficient symbol $\sigma_B$, if
$$
K_B
:=
\sup_{\vartheta\in[\theta,\theta']}
\left\|
\operatorname{Cov}_{\omega_\vartheta}(\sigma_B,m)
\right\|<\infty,
\tag{V.3.11c.2.3}
$$
then
$$
\left|
s_B\langle\sigma_B\rangle_{\omega_{\theta'}}
-s_B\langle\sigma_B\rangle_{\omega_\theta}
\right|
\le
\frac{|s_B|K_B}{\gamma}\|c'-c\|.
\tag{V.3.11c.2.4}
$$

*Proof.* Put $d=\theta'-\theta$ and $\theta_t=\theta+td$. Since the exponential-family convention gives $Dc(\theta)=-\operatorname{Cov}_{\omega_\theta}(m)$,
$$
c'-c=-\int_0^1\operatorname{Cov}_{\omega_{\theta_t}}(m)d\,dt.
$$
Taking the inner product with $-d$ and using (V.3.11c.2.1) yields
$$
-\langle d,c'-c\rangle
=\int_0^1\langle d,\operatorname{Cov}_{\omega_{\theta_t}}(m)d\rangle dt
\ge\gamma\|d\|^2.
$$
Cauchy-Schwarz gives $\|d\|\,\|c'-c\|\ge\gamma\|d\|^2$; if $d\ne0$, division proves (V.3.11c.2.2), and the case $d=0$ is immediate. Moreover,
$$
\frac d{dt}\langle\sigma_B\rangle_{\omega_{\theta_t}}
=-\operatorname{Cov}_{\omega_{\theta_t}}(\sigma_B,m)\cdot d.
$$
Integrating, applying (V.3.11c.2.3), multiplying by $|s_B|$, and then using $\|d\|\le\|c'-c\|/\gamma$ gives (V.3.11c.2.4). ∎

**Corollary V.3.11c.3 (Calibration Condition-Number Gate).** A final-calibrated numerical interval must propagate the registered moment uncertainty through (V.3.11c.2.4). If the covariance floor $\gamma$ approaches zero, the inverse moment problem is ill-conditioned and the coefficient remains certificate-pending unless a different identifiable chart supplies a positive floor. The no-double-counting conclusion concerns KL increments under exact nesting on one fixed atom set and reference measure; it does not assert statistical independence or erase correlated physical or certificate uncertainties.

**Corollary V.3.11d (Exponential Form on Independent Moment Branches).** If the active moment functions are independent after applying $\mathcal Q_{\mathrm{ind}}$, then the calibrated state has the form
$$
\omega_\alpha^*
=
\frac{
\nu_{*,\alpha}
\exp\left(
-\sum_{a\in A_{\mathrm{ind}}}\theta_a m_a(\alpha)
\right)
}{
Z(\theta)
},
\tag{V.3.11d.1}
$$
where
$$
Z(\theta)
=
\sum_{\alpha\in\Omega_*}
\nu_{*,\alpha}
\exp\left(
-\sum_{a\in A_{\mathrm{ind}}}\theta_a m_a(\alpha)
\right),
\tag{V.3.11d.2}
$$
and the multipliers are fixed by
$$
-\frac{\partial\log Z}{\partial\theta_a}=c_a^*,
\qquad a\in A_{\mathrm{ind}}.
\tag{V.3.11d.3}
$$
After redundant constraints are removed, the multiplier vector $\theta$ is unique.

*Proof.* By Theorem V.3.11c, the minimizer is in the relative interior of the probability simplex. The equality-constrained Lagrangian is
$$
\mathcal L(\omega,\lambda,\theta)
=
\sum_\alpha\omega_\alpha\log\frac{\omega_\alpha}{\nu_{*,\alpha}}
+
\lambda\left(\sum_\alpha\omega_\alpha-1\right)
+
\sum_{a\in A_{\mathrm{ind}}}\theta_a
\left(
\sum_\alpha\omega_\alpha m_a(\alpha)-c_a^*
\right).
\tag{V.3.11d.4}
$$
Stationarity in every coordinate gives
$$
\log\frac{\omega_\alpha}{\nu_{*,\alpha}}+1+\lambda+
\sum_{a\in A_{\mathrm{ind}}}\theta_a m_a(\alpha)=0.
\tag{V.3.11d.5}
$$
Solving and absorbing $e^{-1-\lambda}$ into the normalizing factor gives (V.3.11d.1). Differentiating $Z$ gives the moment equations (V.3.11d.3). The Hessian on the retained multiplier space is
$$
\frac{\partial^2\log Z}{\partial\theta_a\partial\theta_b}
=
\operatorname{Cov}_{\omega_*}(m_a,m_b).
\tag{V.3.11d.6}
$$
For any nonzero retained multiplier vector $z$,
$$
\sum_{a,b}z_a\operatorname{Cov}_{\omega_*}(m_a,m_b)z_b
=
\operatorname{Var}_{\omega_*}\left(\sum_a z_a m_a\right).
$$
Because $\omega_*$ has full support and $\mathcal Q_{\mathrm{ind}}$ has removed affine redundancies, this variance vanishes only for $z=0$. Hence the Hessian is positive definite on the retained multiplier space and $\theta$ is unique. ∎

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

**Theorem V.3.11f (No Free Continuous Moduli after Final Spectral Calibration).** On a final-calibrated branch carrying an accepted $\mathfrak S_*$, every response-active coefficient multiplying an invariant operator in the accepted effective action is unique at the calibration scale and along the accepted comparison route. A coefficient whose local parent certificate is absent is not calibrated by $\mathfrak S_*$.

*Proof.* Let $I_B\in\mathcal I_*$ be response-active. By Definition V.3.11a, the parent local certificate for $I_B$ is listed in $\mathcal O_*$, the finite operator $\widehat O_B$, symbol $\sigma_B$, unit bridge $s_B$, and comparison route $\mathcal R^*_{\mu\leftarrow\mu_*}$ are fixed before comparison, and the response-null and independent-constraint quotients have already been applied. By Theorem V.3.11c, the KL projection $\omega_*$ on $\mathcal C_*$ is unique. Hence
$$
c_B(\mu_*)
=
s_B\sum_{\alpha\in\Omega_*}\omega_\alpha^*\sigma_B(\alpha)
\tag{V.3.11f.1}
$$
is unique. If the accepted comparison route is used, $c_B(\mu)=\mathcal R^*_{\mu\leftarrow\mu_*}(c_B(\mu_*))$ is unique as well.

If $c_B$ could be changed while preserving the same final-calibrated branch, then at least one of $\omega_*$, $\sigma_B$, $s_B$, $I_B$, $\mathcal R^*_{\mu\leftarrow\mu_*}$, $\mathcal C_{\circlearrowleft}$, or the parent-certificate overlap map $\mathcal O_*$ would have changed, or else $I_B$ would be response-null. The first alternatives change $\mathfrak S_*$ or the accepted parent record; the last alternative is removed by PPI. Therefore no continuous coefficient remains free on the same branch. Conversely, if the local parent certificate for $I_B$ is absent, Definition V.3.11a forbids adding a standalone spectral symbol to replace it, so the coefficient remains branch data rather than a final-calibrated theorem. ∎
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
\nu_{*,\alpha}=\frac1{4096}
\qquad
(\alpha\in\mathcal G_{24}).
$$
The weight pushforward and the first eight central moment entries of this reference state are exactly the record of Theorem Z.13c.1:
$$
\mathbb P_{\nu_*}(W=0,8,12,16,24)
=
\frac{1}{4096}(1,759,2576,759,1),
$$
and
$$
\mathbb E_{\nu_*}[(W-12)^j]
=
\mathbb E_{\operatorname{Bin}(24,1/2)}[(B-12)^j]
\quad(0\le j\le7),
$$
with first deviation
$$
\mathbb E_{\nu_*}[(W-12)^8]
-
\mathbb E_{\operatorname{Bin}(24,1/2)}[(B-12)^8]
=
\frac{239085}{2}.
$$

This gate fixes the automorphism-invariant reference measure and its codeweight moment record on the stated carrier. It does not by itself supply the remaining entries required for final calibration: the response-active operator symbols $\sigma_B$, unit bridges $s_B$, RG/threshold route $\mathcal R^*_{\mu\leftarrow\mu_*}$, and any sector-specific residual symbols still have to be accepted before comparison. A heat-kernel, zeta-determinant, or symmetric-space harmonic computation may supply entries of $\mathfrak S_*$ only after it fixes the finite atom algebra, spectral time/scale or regularization, operator symbols, unit bridges, tail bounds, and route data before comparison. Invariance of an arena alone fixes at most the admissible reference measure on a transitive carrier; it does not derive the calibration polytope or close $R_\alpha$, $A_{\mathrm{eff}}$, or threshold data without those entries.

*Proof.* If the additive code acts by regular translations on the atom set, any invariant probability measure is constant on a single transitive orbit. If equal trace ranks are supplied instead, Definition V.3.11a gives $\nu_{*,\alpha}=\operatorname{Tr}P_\alpha/\operatorname{Tr}I_{\mathrm{cal}}=1/4096$. The weight pushforward and moment identities are then precisely Theorem Z.13c.1. The final sentence follows from the list of required entries in Definition V.3.11a and the coefficient map of Definition V.3.11e. ∎

**Theorem V.3.11i (Golay association-scheme calibration carrier under the multiplicity-basis quotient).** On a final-calibration branch whose finite response carrier is the marked predictive-recovery Golay carrier, let
$$
\mathcal H_{\mathrm{cal}}
=
\mathbb C[\mathcal G_{24}\times F]
\tag{V.3.11i.1}
$$
where $F$ is the finite flag set selected by the accepted branch markings, including the active/passive split, the $3+2+1$ block frame, and any accepted orientation or hypercharge sign convention. Let $\Gamma_{\mathrm{PU}}$ be the finite group of response-preserving automorphisms of this marked carrier. Assume additionally that the response-null quotient identifies operators related by inner conjugation with every unitary of the commutant $\mathcal E_{\mathrm{PU}}$; equivalently, scalar calibration observables must be invariant under all multiplicity-basis changes inside the Wedderburn blocks of $\mathcal E_{\mathrm{PU}}$. Define
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
\nu_{*,\alpha}=\frac{\operatorname{Tr}P_\alpha}{\operatorname{Tr}I_{\mathrm{cal}}}.
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

**Definition V.3.11j (Global Final-Calibration Source).** A global final-calibration source is a finite record
$$
\mathfrak S_*^{\mathrm{glob}}
=
(\mathcal A_*,\Omega_*,\nu_*,\nu_*^{\mathrm{fs}},\mathcal M_*,\mathcal Q_{\mathrm{null}},\mathcal Q_{\mathrm{ind}},\mathcal U_*,\mathcal R^*,\Sigma_*,\Theta_*,\Pi_*,\mathcal I_*,\chi_*^{\mathrm{glob}})
\tag{V.3.11j.1}
$$
where $\mathcal A_*$ is the finite calibration algebra, $\Omega_*$ its finite atom set, $\nu_*$ the invariant reference measure, $\nu_*^{\mathrm{fs}}$ the full-support feasibility witness, $\mathcal M_*$ the accepted constraint moments, $\mathcal Q_{\mathrm{null}}$ the response-null quotient, $\mathcal Q_{\mathrm{ind}}$ the independent-constraint quotient, $\mathcal U_*$ the unit bridges and RG/threshold routes, $\mathcal R^*$ the residual and tail ledger, $\Sigma_*$ the operator-symbol ledger, $\Theta_*$ the circular-angle, determinant-orientation, finite-part, zero-mode, grading, and normalization conventions, $\Pi_*$ the overlap maps to parent sector certificates, $\mathcal I_*$ the list of covered outputs, and $\chi_*^{\mathrm{glob}}=1$ the forward-lock entry.

The record may project accepted local certificates from a common spectral source. It cannot replace a missing local certificate, supply an unrecorded finite part, alter a projector, change a tail bound, change a grading, change a normalization, import a comparison value as a moment, or infer a sector symbol from validation data.

**Theorem V.3.11k (Global Calibration Non-Replacement and Full-Vector Classification).** A numerical row is final-calibrated by $\mathfrak S_*^{\mathrm{glob}}$ only if its local parent certificate is accepted or explicitly registered as branch input, and its symbol, unit bridge, finite-part convention, tail bound, circular-angle convention when relevant, determinant orientation, normalization, and overlap map are entries of (V.3.11j.1). The current PU ledger contains no single accepted $\mathfrak S_*^{\mathrm{glob}}$ covering simultaneously the Thomson residual, electroweak threshold, flavor, the four-mode Hessian/carrier, action, Fredholm-weight, and vacuum-to-Einstein realization records, the primordial determinant, baryogenesis, horizon transfer, AQFT/Einstein, and dark-response sectors. Therefore a claim that all such rows are final calibrated is certificate-pending unless it supplies $\mathfrak S_*^{\mathrm{glob}}$ and the cross-sector record $\mathfrak N_{\mathrm{PU}}$ of Definition X.9.6g.7.

*Proof.* Definition V.3.11a fixes one calibrated expectation only after the algebra, atom set, reference measure, constraints, symbols, units, routes, circular conventions, overlap maps, and residuals are fixed. The sectors named here also have determinant, zero-mode, boundary, transport, covariance, or tail entries in their local certificates. Changing any such entry after another dependent row is fixed changes the finite branch by Definition P.14.1m and Theorem P.14.1f. Thus the global record compresses accepted local certificates only by projection; it does not promote absent certificates. ∎

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
D_{\mathrm{KL}}(\omega\Vert\nu_*).
}
$$

### V.3.12 Unified Exact Finite-Obstruction and Null-Extension Audit

**Definition V.3.12a (Frozen Seven-Target Exact Audit Contract).** The audit binds exactly
$$
\{\texttt{TV-R-03},\texttt{TV-U-01},\texttt{TV-V-07},
\texttt{TV-Z-01},\texttt{TV-Z-02},\texttt{TV-Z-10},\texttt{TV-Z-11}\}.
\tag{V.3.12a.1}
$$
Its input is the source-derived finite manifest in the program below: four current-graph roles and three typed value edges; one representative positive rational check of the quadratic-versus-quartic coefficient mismatch; the three symbolic positive McKay coefficients; the fixed eight-dimensional binary null-extension class; the eight full-context labels; and the two positive response-normalization families. Corollary U.73b and Theorems U.73a and R.3.5e.3 remain the analytic owners of the universal false-vacuum and current-graph conclusions. No comparison value, target parameter, fitted coefficient, network input, random seed, or external package is admitted.

The source snapshot is the UTF-8 text strictly between the `~~~python` and `~~~` lines below, with LF line endings and one final LF. Save it as `finite_obstruction_audit.py` and execute `python3 finite_obstruction_audit.py`. It uses only exact integers and `fractions.Fraction`; the JSON serializer is canonicalized by sorted keys and compact separators.

~~~python
from fractions import Fraction
import hashlib
import json


def fstr(value):
    value = Fraction(value)
    return str(value.numerator) if value.denominator == 1 else f"{value.numerator}/{value.denominator}"


def canonical_sha(value):
    payload = json.dumps(value, sort_keys=True, separators=(",", ":")).encode("utf-8")
    return hashlib.sha256(payload).hexdigest()


def audit_u01():
    # Representative exact-arithmetic regression for the coefficient mismatch.
    # Corollary U.73b and Theorem U.73a, not this finite fixture, own the
    # universal nullity and homogeneity conclusions.
    m2 = Fraction(2)
    A = Fraction(3)
    lhs_t2 = m2 * A * A / 2
    rhs_t2 = Fraction(0)
    assert lhs_t2 > 0 and rhs_t2 == 0 and lhs_t2 != rhs_t2
    return {
        "branch": "Theorem-U.13b false-vacuum branch",
        "lhs_t2": fstr(lhs_t2),
        "rhs_t2": fstr(rhs_t2),
        "representative_quadratic_vs_quartic_check": True,
        "proof_owner": "Corollary U.73b and Theorem U.73a",
    }


def audit_r03():
    # Exact finite-manifest regression only. Theorem R.3.5e.3 owns the
    # source-clause case split and the no-current-source conclusion.
    roles = ("C3", "Ccap", "Ctan", "Ckis")
    value_edges = [("C3", "Ccap", "K0"), ("Ccap", "Ctan", "a,d0"), ("Ctan", "Ckis", "M")]
    assert len(set(roles)) == 4
    assert len(value_edges) == 3
    assert all(label in {"K0", "a,d0", "M"} for _, _, label in value_edges)
    return {
        "roles": list(roles),
        "value_edges": value_edges,
        "executed_scope": "four-role/three-value-edge manifest regression",
        "proof_owner": "Theorem R.3.5e.3",
    }


def audit_v07():
    # For every positive discrete triple C, the displayed chi formulas give
    # kappa directly. Thus the calculation is independent of which finite
    # diagram supplied C.
    kappa_pass = (Fraction(1), Fraction(1), Fraction(19, 12))
    kappa_fail = (Fraction(1), Fraction(1), Fraction(1))

    def residual(kappa):
        return 21 * kappa[0] + 55 * kappa[1] - 48 * kappa[2]

    assert all(value > 0 for value in kappa_pass + kappa_fail)
    assert residual(kappa_pass) == 0
    assert residual(kappa_fail) == 28
    return {
        "universal_scale_rule": {
            "pass_chi": "(1/C1,1/C2,19/(12*C3))",
            "fail_chi": "(1/C1,1/C2,1/C3)",
            "domain": "C1,C2,C3>0",
        },
        "pass_kappa": [fstr(value) for value in kappa_pass],
        "pass_residual": fstr(residual(kappa_pass)),
        "fail_kappa": [fstr(value) for value in kappa_fail],
        "fail_residual": fstr(residual(kappa_fail)),
        "mckay_only_forces_constraint": False,
    }


def audit_z01():
    d0 = 8
    ranks = list(range(1, d0))
    # Two sharp retained values need two orthogonal nonzero representatives.
    feasible = [rank for rank in ranks if rank >= 2]
    # In the null-extension comparison class, support cost is any strictly
    # increasing function. The integer rank itself is a canonical witness.
    costs = {rank: rank for rank in feasible}
    minimizers = [rank for rank in feasible if costs[rank] == min(costs.values())]
    assert feasible == [2, 3, 4, 5, 6, 7]
    assert minimizers == [2]
    return {
        "ambient_d0": d0,
        "candidate_ranks": ranks,
        "feasible_ranks": feasible,
        "canonical_response_quotient_rank": 2,
        "strict_cost_witness": costs,
        "unique_minimizer": 2,
    }


def audit_z02():
    contexts = 8
    # Boundary matrices: eight mutually orthogonal columns have Gram I_8 in
    # dimension 8; dimension 7 has rank at most 7. For every d>=8, the
    # canonical inclusion i_d and projection p_d satisfy p_d i_d=I_8.
    gram8 = [[int(i == j) for j in range(contexts)] for i in range(contexts)]
    assert all(sum(row) == 1 for row in gram8)
    for d in range(8, 33):
        inclusion = [[int(row == col) for col in range(contexts)] for row in range(d)]
        projection = [[int(row == col) for col in range(d)] for row in range(contexts)]
        composite = [
            [sum(projection[i][k] * inclusion[k][j] for k in range(d)) for j in range(contexts)]
            for i in range(contexts)
        ]
        assert composite == gram8
    return {
        "context_count": contexts,
        "rank7_can_host_8_orthogonal_contexts": False,
        "rank8_gram": gram8,
        "parametric_comparator": "C^8 --i_d--> C^d --p_d--> C^8, p_d*i_d=I_8 for every d>=8",
        "instantiated_dimensions": [8, 32],
        "unique_strict_support_minimizer": 8,
    }


def audit_z10():
    # K and u are held fixed. The positive Ward scalar c survives unless the
    # independent equal-sum certificate is supplied.
    c_values = [Fraction(1), Fraction(2), Fraction(3, 2)]
    family = [
        {"cW": fstr(c), "G_over_K_inverse": fstr(1 / c), "Gamma2_over_K": fstr(c), "kappa_bulk": fstr(c)}
        for c in c_values
    ]
    assert len({row["kappa_bulk"] for row in family}) == len(c_values)
    Q = Fraction(2)
    certificate_solutions = [c for c in c_values if Q == Q / c]
    assert certificate_solutions == [Fraction(1)]
    return {
        "same_upstream_K_and_u_family": family,
        "upstream_forces_unit_Ward_scalar": False,
        "positive_Q_equal_sum_certificate_solution": [fstr(value) for value in certificate_solutions],
    }


def audit_z11():
    # Schur isotropy fixes an invariant form only up to a positive scalar L.
    M = Fraction(24)
    Kavg = Fraction(32, 23)
    L_values = [Fraction(1), Fraction(1, 16)]
    outputs = []
    for L in L_values:
        Keff = (M - 1) * Kavg * L
        outputs.append({"Lvis": fstr(L), "Keff": fstr(Keff)})
    assert outputs == [{"Lvis": "1", "Keff": "32"}, {"Lvis": "1/16", "Keff": "2"}]
    return {
        "irreducible_tangent_module": "Hom(C^2,C^6)",
        "positive_invariant_form_family": "L*g_B, L>0",
        "same_isotropy_outputs": outputs,
        "isotropy_forces_Lvis_1_over_16": False,
    }


def main():
    checks = {
        "TV-R-03": audit_r03(),
        "TV-U-01": audit_u01(),
        "TV-V-07": audit_v07(),
        "TV-Z-01": audit_z01(),
        "TV-Z-02": audit_z02(),
        "TV-Z-10": audit_z10(),
        "TV-Z-11": audit_z11(),
    }
    transcript = {
        "schema": "PU-FINITE-OBSTRUCTION-AUDIT-v1",
        "arithmetic": "exact integers and fractions",
        "target_queries": 0,
        "checks": checks,
        "check_sha256": canonical_sha(checks),
        "status": "PASS",
    }
    print(json.dumps(transcript, sort_keys=True, separators=(",", ":")))


if __name__ == "__main__":
    main()
~~~

**Proposition V.3.12b (Executed Seven-Target Exact Audit).** The frozen source has `182` lines and `6573` bytes. Its SHA-256 is `6c62145a5a7dbbe0c75971efe80caddbfadfd1871bffe8879421ff555ec98068`. CPython `3.13.12` (`cpython-313`) on `Linux-6.6.87.2-microsoft-standard-WSL2-x86_64-with-glibc2.39`, executable SHA-256 `a38f63d2b8843820b59746250911cd203dbd76c8dc53693007aaa3bda2007232`, executed it to completion and returned `status=PASS`, internal canonical check SHA-256 `bba7093f554adb74285bace851c3df08e814fbbf0ce1ab503f67589499bd445b`, and one `2059`-byte LF-terminated canonical JSON transcript whose SHA-256 is `3267b7d14389bb53a81155aed565346b992666902ce7d374e3c9877c81f4c9ac`.

| Target | Exhausted proposition and result | Exact coverage | Remaining outside the result |
|---|---|---|---|
| `TV-U-01` | A fifth Hessian zero mode on the Theorem-U.13b false-vacuum branch: `negative-refutation` | Universal analytic owners Corollary U.73b and Theorem U.73a; one representative exact rational coefficient regression | Other action and exact-scale-family classes |
| `TV-R-03` | One already supplied current source role compresses all four roles: `negative-refutation` | Theorem R.3.5e.3's complete four-case analytic proof; exact $4$-role/$3$-edge manifest regression | A genuinely new parent invariant |
| `TV-V-07` | Positive McKay discrete data alone force the Bures equation: `negative-refutation` | Symbolic witnesses valid for every $(C_1,C_2,C_3)>0$; residuals $0$ and $28$ | Only a premise-enlarging normalization theorem; the McKay-only target is closed |
| `TV-Z-01` | Fixed-$d_0=8$ sharp-binary response-null active-rank classification: `positive-discharge` | Every $1\le a<8$; feasible list $2,\ldots,7$; quotient rank $2$ | Response-active or performance-changing comparators |
| `TV-Z-02` | Eight-context response-null carrier classification: `positive-discharge` | Dimension lower bound plus parametric $p_di_d=I_8$ for every $d\ge8$; executable instances $8\le d\le32$ | Non-null larger carriers and physical realization |
| `TV-Z-10` | QFI/capacity alone force $c_{\mathrm W}=1$: `negative-refutation` | Exact positive witnesses $c=1,3/2,2$ and positive-$Q$ equal-sum closure check | Operational current, normalization, bandwidth and spectral certificate |
| `TV-Z-11` | Isotropy alone forces $L_{\mathrm{vis}}=1/16$: `negative-refutation` | Complete scalar family $Lg_B$, with exact witnesses $L=1,1/16$ | Operator-realized electromagnetic projection and unit bridge |

The equivalence relation for each check is its owner record's typed basis-change or graph-relabeling relation; none identifies response-distinct scalar values or changes the candidate class. The verifier is the hashed exact program together with the named analytic owner theorem for every universal or infinite statement. Integrity fails on a source hash, runtime, assertion, canonical-check hash, transcript-length, or transcript-hash mismatch, or when an owner premise is absent. The target-specific falsifiers are stated in the owner resolution records; the transcript supplies only the declared finite fixtures, boundary witnesses, and alternate-scale witnesses. Provenance is source-derived exact mathematics with zero target queries. Nonvacuity is supplied by the displayed standard-basis carriers, all four populated graph roles, both positive scale choices, and the nontrivial Theorem-U.13b branch. Consumers may import only the result column above; no physical carrier, current, action, determinant, observable, or empirical comparison is promoted by this audit. ∎

### V.3.13 Pure-$\mathbf S$ Computation, Observation and Topological Realization Audit

The Pure-S companion supplies two formally proved constructions: the root-restarted computation theorem and persistent observer-verified history enumeration. The stochastic observation model of Section 7.4.4a has finite compression and prediction results. The branch--braid--apply construction of Section 14.5.6 has a nonempty algebraic model and a transition-level history observer. Their realization records have the following distinct responsibilities.

| Package | Constructed or proved object | Completion evidence |
|---|---|---|
| Selected computation | Theorem 1R's fixed controller, primitive-recursive encoder, literal readers and regular halting language on one source trajectory | `PureSFormal.RootResetHeadline.sCombinatorIsRootResetUniversal`, its `HeadlineUniversality` contract, and the source-bound complete verification record |
| Reduction-strategy limits | Cinematic Strawberry (2026), Appendix F.1: autonomous-component and outer-clock obstructions to exact every-maximal-path halting observation | `PureSFormal.AppendixF.AutonomousObstruction.clock_encoder_obstruction`, the computable payload, fixed regular detector and undecidable source set; the obstructing path may be unfair |
| Persistent histories | Theorem 5's eight clauses, structural-fairness results and observer-access boundary | The frozen source/observer pair, occurrence-history types, fairness record and structural meter |
| Bounded computation and future prediction | Corollary 2b's terminating trace-query construction and Corollary 2c's undecidable eventual regular observation | The bounded source wrapper, selected-path interfaces and finite observation horizon; the displayed reduction proofs own the unbounded conclusions |
| History memory and stochastic closure | Reachable finite history families, observation-capacity bounds, exact lumpability and probabilistic structural fairness | The prepared ideals, complete projected transition rows, conditional block hazards, coverage outcomes and full preparation/observer budget |
| Shared execution | Readback-preserving copying, exact privatization, complete development, supplied-path lifting and the finite-store representation | A concrete navigator and allocator with charged indexed access, pointer-width policy, actual output representation and readback agreement |
| Stochastic observation | Normalized finite-time laws, history-compression factorization, finite-library attainment and the prediction-loss decomposition | A finite counted policy/channel/predictor, resource cap, clock, distortion task and nondegenerate experiment |
| Physical reset | Definition 28's register and cyclic operation, with Theorem 31's conditional entropy | The actual complete retained record, calibrated units, source law, dissipation and calorimetric return |
| Braided rewriting | Typed coupons, the $\mathbf S$ equation, the block braid and its minimal permutation length | A coherence-preserving process interpretation and a compatible transition-level observation map |
| Ribbon or field-theoretic realization | Framing, closure, represented responses and the selected Chern--Simons/TQFT package | A nontrivial response witness, physical preparation and readout, and the typed maps to any Appendix I or Y consumer |

These are construction packages. A registry separates their independently accepted claims and records the dependency edges between them. A proved local equation, a finite matrix check, a universal coherence theorem and a physical comparison receive their own evidence types.

**Imported Proof and Execution Evidence.** Cinematic Strawberry (2026), Appendix B, identifies the formal correspondences of Theorems 1R and 1--5. The 14 September 2026 release records Lean 4.33.1, 1,239 formal modules and 319 public exports, including 22 for Appendix F. The declaration `PureSFormal.RootResetHeadline.sCombinatorIsRootResetUniversal`, exposed as `PureSFormal.Public.rootResetHeadlineUniversality`, proves `HeadlineUniversality`. This aggregate includes all-program cyclic-tag realization and binds the fixed endpoint computation contract, regular halting language, observer agreement and ordered finite source sampling to the specified source encoding and trajectory. The generated public API records the exact types and axiom sets. The central theorem depends on `propext` and `Quot.sound`; 228 public exports use `Quot.sound`, and seven Appendix F exports additionally use the standard `Classical.choice` axiom. The trusted-definition ledger identifies the rule, source, controller, encoder and observers certified by those declarations. The companion verification guide separates these proof dependencies from command-line and partial runtime declarations. A reproducible import binds the definitions and public signatures to `headline-complete/COMPLETE-VERIFICATION.json`, its verified source manifest and dependency audits. That record covers the complete module inventory and the recorded `leanchecker` and scoped `lean4lean` replays.

Corollaries 2b--2c derive bounded trace computation and the future-event prediction limit from the companion's encoder and output theorems. Appendix A.0.2 derives the history domain from confluence, exact finite range and structural fairness. Section 7.4.4a derives history-capacity, lumpability and probabilistic-fairness results from those constructions and its stated probability laws. These consequences have the mathematical proofs given in their owning sections; the imported Lean results have the declaration bindings specified above.

The companion's actual root-restarted worked trace supplies an execution calibration:

| Two-phase input $101$ | Contraction index | Decoded phase and queue | Unfolded term nodes |
|---|---:|---|---:|
| Initial checkpoint | 0 | phase 0, queue $101$ | 171 |
| First source checkpoint | 22 | phase 1, queue $011$ | 17,057 |
| Second source checkpoint | 85 | phase 0, queue $11$ | 339,285 |

The 85 root-restarted invocations use 1,324,894 measured microticks; the same contractions use 6,935 microticks in the persistent baseline. The companion records independent occurrence-tree replay of every returned address and contractum, all 86 checkpoint decisions, and the first invocation's local command sequence. Its runtime evidence also covers 720 differential contractions, 394 small-term executions, nine source-machine cases with 37 exact rows, and 880 selector comparisons. These measurements calibrate the declared finite fixtures. The complete padded tape-machine encoder has an all-input proof and construction bound; even its code-zero seed has at least $2^{57207}$ literal bits under the retained compiler, and the full seed was not materialized. Native output and encoder-preflight attempts encountered stack limits; the recorded interpreted checks passed. A finite physical proposal therefore specifies the actual encoder representation and resource envelope used by its experiment.

**Source and Theorem Binding.** A verification record fixes the exact source paths and versions, imported declarations, candidate class, units, meter definitions, input domains and output formats. Raw source hashes identify bytes. A normalized corpus seal uses the owning normalization algorithm and its explicitly enumerated self-reference fields. Each binding identifies its source configuration and distinguishes raw-byte identity from normalized identity.

The source-envelope audit of Proposition P.14.1m.4a and the semantic pilot of Proposition P.14.1m.4b keep their frozen domains. A current global certificate instantiates Definition P.14.1m with the current source-to-vertex map, dependency and overlap manifest, status rows, and the actual semantic evidence required by (C1)--(C18). Successful byte matching establishes source identity; each semantic predicate is discharged by its proof or sound terminating checker.

**Completion Accounting.** Let $\mathcal V$ be the registered claim set, let $\sim$ identify declared aliases, and let $\mathcal A\subseteq\mathcal V/{\sim}$ contain exactly the substantive atomic theory claims. The unresolved count is
$$
N_{\mathrm{open}}
=
\#\{[v]\in\mathcal A:\operatorname{status}([v])=\textsf{unresolved}\}.
$$
Umbrella packages, resolved claims, experimental endpoints and registry-only entries have their own disjoint counts. Each unresolved atomic alias class contributes exactly one to $N_{\mathrm{open}}$. The observation and topology packages contribute through their registered atomic claims and dependency relations. The source-to-vertex and status-row coverage checks compute every summary from the same frozen registry.

**Finite Verification Cases.** The bounded-interpreter audit checks zero-step jobs, early source halting, a looping source at finite bound, empty and nonempty trace serializations, both query modes, out-of-range queries and both terminal bits. It compares the reconstructed trace with the finite source run. The selected-event audit records all samples through its nominated $J$, including the initial sample, and verifies every finite-automaton decision.

The history-memory audit prepares the four $m=2$ ideals displayed in Section 7.4.4a, verifies their exact projections and common final source state, and checks the one-bit and two-bit reconstruction laws. The transition audit tests both equal and unequal projected rows within an ideal fiber. The coverage audit verifies its conditional hazard bounds over every admitted starting state and records the nominated addresses opened by each block, including any budget-stop outcome. A finite collection of observed successes is evaluated under the registered probability law; the infinite liveness conclusion uses the product-bound proof and its nonsummable hazard premise.

The observation audit checks normalization and exact support propagation; normal-form idling and budget stopping; feasible and infeasible one-register compression; the history-statistic factorization; and the KL decomposition including a predictor support failure. The binary examples in Section 7.4.4a provide exact expected values. The store audit checks a root contraction, a nonroot privatized contraction, two unfolded occurrences sharing one node, zero-copy root privatization, pointer-capacity boundaries and exact final readback for a supplied address sequence. A whole-output claim additionally records output cardinality and representation.

The topology audit expands the displayed braid word, verifies its block permutation and $n_yn_z$ inversion count, checks the typed $\mathbf S$ equation in the cartesian term model, and tests the registered copier on its admitted family. The changing-history witness checks that the physical observation is carried by transitions when the algebraic interpretation identifies redex and contractum. A braided or ribbon matrix realization then checks the named coherence identities and response comparisons on its declared domain.

Each finite run records its exact inputs, arithmetic model, observed outputs and acceptance rule. General source, stochastic and categorical conclusions use their owning proofs; the finite cases establish the stated executable instances.

## V.4 Systematic Formalization Program

### V.4.1 Project objective

The formal verification program pairs canonical PU propositions with Lean declarations under a fixed semantic correspondence. Each claim carries independent fields for mathematical kind, formal state, premises, source identity, semantic equivalence and trust evidence. A certified computation may support a theorem; a conditional theorem can carry both mathematical and physical premises.

The report distinguishes specification coverage, kernel-checked proofs, explicit assumptions, model witnesses, counterexamples and empirical comparisons. Complete classification and complete proof coverage are separately measurable outcomes. The inventory begins with the canonical 48-source manifest and records the current source version. Section V.3.13 binds the Pure-S component's checked declarations and resource interfaces. Coverage of the remaining PU propositions is measured claim by claim.

### V.4.2 Success ladder

Seven assurance levels have independent acceptance conditions:

| Level | Meaning | Required evidence |
|---|---|---|
| L1 — Specification | PU concepts and statements have precise types and quantifiers | Approved claim cards and Lean declarations |
| L2 — Derivability | Every claimed mathematical consequence follows from its declared premises | Kernel-checked proofs with zero placeholders |
| L3 — Nonvacuity | The core and each retained branch have at least one explicit nondegenerate model | `Nonempty` model-construction theorems |
| L4 — Independence | Important premises are not merely hidden restatements of conclusions | Ablations, countermodels, and two-model nonentailment results |
| L5 — Compatibility | Branches claimed to coexist have a common model and commuting interfaces | Explicit intersection models and overlap theorems |
| L6 — Determinacy | The declared axioms select a unique response class where uniqueness is claimed | Categoricity or strict-selection theorems, or formal noncategoricity |
| L7 — Empirical interface | Derived predictions are separated from calibration and compared prospectively | Certified numerics, provenance, uncertainty, and held-out tests |

L2 alone verifies logical derivations. L3 prevents vacuous universal theorems.
L5 and L6 are required before claiming that a collection of separately valid
branches forms one determined PU universe.

### V.4.3 Non-negotiable formalization principles

#### 3.1 Explicit Models and Branch Predicates

Encode PU assumptions as fields or predicates over model data:

A model record supplies state, protocol and outcome types, response and update maps, and separately named predicates for the adopted core assumptions. Each theorem takes the model and its required branch predicates explicitly. Primitive data, axioms and proved consequences occupy distinct fields of the claim record.

Branch assumptions should be separate predicates or structures such as
`FullContext M`, `HilbertCarrier M`, `BinaryQuotient M`, and
`OperationalContinuum M`. This prevents an assumption from silently entering
all theorems and makes branch intersections explicit.

The operational model has a small common core and named branch extensions.
A coexistence claim requires a joint model satisfying the relevant extensions.
Canonical mathematical structures may use typeclasses; each PU law appears as
an explicit model field or theorem hypothesis.

#### 3.2 Semantic Correspondence

Each correspondence record classifies the formal statement as:

- equivalent to the source;
- stronger;
- weaker;
- conditional on a further explicit premise; or
- refuted by a counterexample.

A conditional result includes every premise required by its proof in the
branch specification and formal signature. Source and formal definitions must
have the recorded semantic relationship throughout the dependency graph.

#### 3.3 Explicit Realization Maps

Primitive definitions specify the admitted objects. A dimensional or gauge
selection result identifies its selection premises and proves the conclusion
from them. If a carrier's dimension is prescribed as an input, its corresponding
dimension statement is recorded as a hypothesis-dependent consequence.

#### 3.4 Typed separation of coincident numbers

Use distinct types or named structures for semantically different quantities:

- tangent complex dimension `12`;
- binary-code dimension `12`;
- interface-mode count `24`;
- Euclidean response-carrier dimension `4`;
- spacetime dimension `3+1`.

Numerical equality is not a carrier map or physical identification. Every
cross-type identification needs its own theorem or assumption.

#### 3.5 Model existence before scale-up

Construct at least one explicit nondegenerate finite `PUCoreModel` before
formalizing hundreds of downstream statements. An explicit inhabitant ensures that universal model theorems have a populated
domain.

### V.4.4 Dependency architecture

~~~mermaid
flowchart TD
    A["Charter and claim registry"] --> B["Lean foundation and PU primitives"]
    B --> C["Explicit finite core model"]
    C --> D["SPAP and Horizon vertical slice"]
    D --> E["PCE, RID, complexity and dynamics"]
    E --> F["Quantum and discrete backbone"]
    F --> G["Continuum, AQFT and gravity"]
    F --> H["Certified numerical branches"]
    G --> I["Global branch compatibility"]
    H --> I
    I --> J["Prospective empirical tests"]
~~~

### Assumption tiers

| Tier | Contents | Permitted downstream label |
|---:|---|---|
| 0 | Lean kernel, pinned math library, declared foundational logic | Mathematical theorem |
| 1 | PU primitive data and definitions | Definition-level result |
| 2 | PU core axioms | PU-core theorem |
| 3 | Finite mathematical branch premises | Conditional finite theorem |
| 4 | Continuum/reconstruction hypotheses | Conditional reconstruction theorem |
| 5 | Physical realization, units and calibration | Conditional physical theorem |
| 6 | External measurements and empirical models | Empirical comparison only |

A result inherits the highest tier it uses. A Tier-5 result may not be
presented as a Tier-2 derivation.

POP (Axiom 1), Predictive Capacity (Axiom 2), Operational Viability (Axiom 3),
the PPI physicalization condition, and PCE as a law of actual adaptation occupy
explicit model or branch fields. Their finite mathematical consequences are
proof targets; physical applicability is assessed through the registered
realizations and experiments.

### V.4.5 Formalization Architecture

The theorem program is organized by logical responsibility:

| Layer | Mathematical responsibilities |
|---|---|
| Mathematical utilities | Finite combinatorics, entropy, probability, linear algebra, information geometry and certified intervals |
| Operational core | States, protocols, responses, prediction, update, equivalence and admissible resources |
| PCE and SPAP | Complete comparison costs, finite selection, diagonal models, closure and ablations |
| Horizon and backbone | Role independence, full context, cardinality, carrier bounds, active rank and typed numerical ledgers |
| Codes and shells | Golay, Steiner, lattice, moment and response-injection certificates |
| Quantum | States, channels, Born representation, perspectival imports and no-signaling |
| Dynamics | Variational convergence, stability, information, reset ledgers and networks |
| Continuum and AQFT | Graph limits, causal order, Lorentzian structure, nets, KMS and modular data |
| Gravity | Conserved stress, horizon entropy and the Einstein bridge |
| Phenomenology | Gauge, flavor, cosmology and consciousness-response packages |
| Physical realization | Dressing, Hilbert and continuum bridges, calibration and observable maps |
| Claims and audit | Exact source-to-formal correspondences, premise reports, nonvacuity, coverage and release exports |

Dependencies run from utilities and the operational core toward the physical and empirical layers. Generic mathematics is independent of PU assumptions. A reviewed export contains the dependency closure of its accepted claims; an exploratory declaration remains outside that export until its semantic and proof reviews pass.

### V.4.6 Claim registry and semantic freeze

Before proof work, give every canonical declaration an immutable claim ID. A
claim card should contain:

- source version and file;
- exact source span and text hash;
- proposition label and title;
- controlled-English statement;
- domains, quantifiers, units and boundary cases;
- examples and nonexamples;
- Lean declaration name and exact proposition;
- assumption tier and dependency IDs;
- equivalence/strength relationship to the prose;
- status: `untriaged`, `specified`, `assumed`, `proved`, `refuted`, `blocked`,
  `conjecture`, `empirical`, or `interpretive`;
- proof axiom report and model-field dependency report;
- semantic reviewer and Lean reviewer; and
- release in which the claim became stable.

Definitions and axioms have versioned namespaces such as `PU.Core.V1`.
Each semantic version has its own dependency closure, correspondence proofs and
acceptance record. A coverage view is a projection of the canonical registry;
its summaries inherit the definitions and hypotheses of the owning propositions.

### V.4.7 Dependency-ordered theorem program

### Package P0 — Foundation and finite utilities

**Build:** finite types, finite functions, cardinality, finite distributions,
scores, exact costs, equivalence relations, quotients, typed quantities, and
basic graph structures.

**Exit gate:** all definitions compile; foundational axiom allowlist is fixed;
no PU assumption has entered yet.

### Package P1 — Operational response core

**Build:** protocols, histories, outcomes, predictors, verification records,
updates, response tables, protocol-relative equivalence, response-null
quotients, and the finite predictive loop.

**Prove:** equivalence laws; quotient well-definedness; retained-response
invariance; finite compatible-lift classifiers; and exact response transport.
The operational response package includes Definition 5a,
Proposition 5a, Corollary 5a.1, and the finite response-table results 5a.2–5a.3
under their exact registered statements.

**Exit gate:** at least two nonisomorphic finite examples and one
response-equivalent pair are constructed.

### Package P2 — Finite PCE and selection

**Build:** explicit admissible comparison classes, benefit/cost ledgers, PCE
objectives, minimizers, strict gaps, and resource budgets.

**Prove:** finite minimizer existence; quotient descent; strict-gap uniqueness;
bounded integer stabilization; finite hierarchy/common-realizer results; and
the two-model nonentailment schema.

**Boundary:** PCE as a law of physical adaptation remains a model assumption.

### Package P3 — SPAP

**Build:** same-cycle prediction, live target, verifier, Boolean complement,
trace-indexed challenge, and scope restrictions.

**Prove:** deterministic diagonal obstruction; explicitly scoped probabilistic
or score bounds where formal premises suffice; unfolded finite self-containment
obstruction; and countermodels outside the live-diagonal scope.

**Exit gate:** every use of self-reference has a precise level/encoding and no
object-language/meta-language collapse.

Start with the finite Boolean diagonal result corresponding most closely to
Theorem 10a and Corollary 10a.1, then add Theorems 10–11 as scoped operational
wrappers. Keep any convex invariant-completion or physical realization premise
as a separate branch hypothesis.

### Package P4 — Horizon Constant vertical slice

**Build:** prediction, verification and update role registers; full-context
readout; visited-state carrier; and log-cardinality complexity.

**Prove:** a surjection to `Bool × Bool × Bool` requires at least eight visited
states; construct an explicit eight-state realization; derive the registered
`K0 = 3` result; formalize assumption-ablation/countermodel cases.

The minimal lemma should expose that full-context surjectivity supplies the
eight-state cardinality lower bound. Theorem 15's `(O1)`–`(O3)` assumptions
belong in the broader architecture/interpretation wrapper, not in the minimal
cardinality lemma. Formalize the stated finite census—16 injective and 4
full-cycle architectures where the frozen definitions support those counts—and
the six-state failure-of-full-context counterexample. Keep Theorem 15(3)'s
stationary-ergodic/Birkhoff branch separate; begin that later with a finite
irreducible Markov specialization.

**Exit gate:** `Nonempty PUCoreModel`, a nondegenerate eight-state model, and
zero-placeholder proofs of the SPAP/Horizon slice.

An initial aggregate theorem may have the following shape, with each branch
record narrow and explicit:

The vertical slice joins three separately proved conclusions: a diagonal-closure model has no universally perfect predictor on its admitted class; a full-context three-role branch visits at least eight states and therefore requires at least three bits of binary encoding capacity; and an exact finite PCE selection branch selects its stated eight-state representative. The conjunction retains the three premise packages explicitly.

### Package P5 — Typed discrete backbone

**Prove conditionally and separately:**

- perfect distinguishability gives `d0 ≥ 8`;
- the declared minimality/comparator branch gives `d0 = 8`;
- the active binary/no-surplus branch gives `a = 2` and `b = 6`;
- Peirce/Grassmannian dimensions give tangent dimension `12` and real mode
  count `M = 24`;
- the self-dual code-rate branch gives code dimension `k = 12`; and
- the mode-cell/least-feasible branch gives Euclidean carrier `D = 4`.

**Exit gate:** no type conflation and no presentation of the conjunction as one
unconditional implication chain.

### Package P6 — Golay, Steiner and finite audits

**Prove:** the displayed binary generator has rank 12, self-orthogonality,
minimum distance 8 and weight enumerator `(1,759,2576,759,1)`; radius-3
recovery; 759 octads; incidence values `(759,253,77,21,5,1)`; relevant matroid
and syndrome facts; the Appendix-V SPAP readout, Page-purity, McKay/Bures,
zero-residual and seven-target exact audits.

**Method:** large computations should emit compact proof certificates checked
by a small Lean verifier. Any non-kernel evaluator must appear in the axiom and
trust report.

Maintain two trust profiles: a strict kernel profile for public core theorems,
and a separately labeled computational profile if a large census requires a
native evaluator. Prefer kernel-reduced decisions, exact tactics, or compact
certificates. Do not allow a fast evaluator to enter the strict profile merely
because its result is convenient.

### Package P7 — Finite quantum and information theory

**Build:** finite-dimensional complex spaces, density matrices, effects,
instruments, channels, Choi matrices, retained perspectives and process
tensors.

**Prove:** CPTP closure under the declared preparation/spectator assumptions;
finite informationally complete reconstruction; the conditional Born trace
representation on its exact domain; no-signaling of local CPTP maps; finite
capacity distinctions; memory/process-tensor facts; and perspective-import
typing results.

**Exit gate:** SPAP is not used as a hidden stochasticity axiom, and the full
Born theorem is separated from the finite informationally complete route.

### Package P8 — Dynamics, thermodynamics and networks

**Build/prove:** RID transition systems, finite Markov chains, Lyapunov and
stability results, data processing, structural versus reset entropy,
conditional Landauer inequalities, finite QEC, max-flow/min-cut, entropy cones,
Hodge decomposition, and finite recovery/locality theorems.

**Boundary:** physical heat, bath temperature and stress-energy identification
remain explicit realization assumptions.

### Package P9 — Geometry and continuum bridge

Proceed in subpackages: discrete graph regularity; finite causal order;
metric reconstruction; variational convergence; RCD/noncollapse; Lorentzian
promotion. Each analytic bridge must have an explicit theorem statement and,
where claimed, a model witnessing that its premises can coexist.

**Go/no-go review:** perform a library-gap and staffing review before starting
Gamma/Mosco, Gromov--Hausdorff, RCD or Lorentzian reconstruction work.

### Package P10 — AQFT and gravity

Formalize local nets, controlled generator convergence, KMS/Clausius branches,
modular theory, stress-energy construction, area-law inputs and the conditional
Einstein-equation implication.

**Exit gate:** no theorem may call the result “emergent gravity” unless the
finite-to-continuum, state, horizon, entropy-normalization and source branches
are all visible in its signature.

### Package P11 — Gauge, matter and phenomenology

Formalize finite gauge-block and anomaly arithmetic first. Treat Lie/tensor
reconstruction, chiral/index results, electroweak thresholds, flavor,
baryogenesis, strong CP, cosmology, dark response and consciousness-related
models as independent branch packages.

**Exit gate:** a numerical coincidence or shared integer never substitutes for
a map, realization theorem, normalization, RG route, or empirical certificate.

### Package P12 — Certified numerics and empirical interface

Use exact arithmetic or proved directed-rounding intervals for alpha,
electroweak, cosmological and other numerical rows. Separate derived inputs,
calibrations, fitted values, held-out validation values and measurements.

**Exit gate:** no measured value is used upstream and later advertised as a
prediction; every comparison has units, provenance, covariance and a frozen
decision rule.

### Package P13 — Global integration

Construct the strongest available intersection model of retained branches,
prove overlap compatibility, and test categoricity. If two models satisfy the
same core while selecting different response classes, report formal
noncategoricity rather than hiding it.

### V.4.8 Twelve-week pilot

This pilot measures real proof velocity before committing to a multi-year
estimate.

| Weeks | Work | Deliverable |
|---:|---|---|
| 1–2 | Charter, source freeze, status taxonomy, first 20–30 claim cards | Versioned scope and registry pilot |
| 3 | Pin the toolchain and verify build and logical dependency layers | Reproducible baseline and initial finite model |
| 4 | Define finite protocol, response, predictor and update primitives | P0/P1 formal specifications |
| 5–6 | Response equivalence, quotient and finite PCE lemmas | First reusable theorem library |
| 7–8 | Deterministic SPAP statement engineering and proof | Reviewed SPAP theorem plus scope counterexamples |
| 9–10 | Three-role cardinality and explicit eight-state construction | `K0 = 3`, `Nvis = 8` vertical slice |
| 11 | Extend the early model witness to the pilot branch intersection; run ablations | Relative-consistency/nonvacuity milestone |
| 12 | Independent proof/semantic audit and backlog re-estimation | Pilot release and scale/no-scale decision |

### Pilot success criteria

- 20–30 representative source claims classified and semantically approved;
- one explicit nondegenerate finite core model;
- deterministic SPAP and Horizon results proved without placeholders;
- every exported theorem has an expected axiom/model-field report;
- no hidden conclusion-equivalent assumption;
- at least one useful countermodel or assumption-ablation result;
- a measured estimate of small/medium/large theorem throughput; and
- a protocol for tracking source-to-formal discrepancies and their affected dependencies.

### Weekly review agenda

A weekly pilot checkpoint uses the following review agenda:

- summarize progress against the pilot and release milestones;
- record completed theorem packages and claim-status changes;
- identify current proof, specification, tooling and staffing blockers;
- list every newly introduced, removed or modified assumption;
- flag circularity, vacuity, model-existence and semantic-drift risks;
- verify that empirical inputs have not entered the deductive core;
- identify the highest-priority dependency-closed theorem batch; and
- assign concrete next actions for the following week.

The weekly checkpoint should report counts for claims specified, proved,
conditionally proved, refuted, blocked and awaiting semantic review. It should
also record whether the latest verified build, axiom report, model-field
dependency report and nonvacuity checks pass. Any failed mandatory gate becomes
a blocker rather than being carried forward silently.

### V.4.9 Continuous workflow for each theorem batch

1. **Select:** choose a dependency-closed batch of 5–10 claims.
2. **Specify:** create claim cards, examples, nonexamples and boundary cases.
3. **Check semantics:** the PU semantic reviewer checks the controlled-English
   and Lean propositions before proof work.
4. **Model:** construct an instance or countermodel for nonvacuity and premise
   testing where practical.
5. **Prove or refute:** formalize the theorem, identify a missing assumption, or
   produce a counterexample.
6. **Audit:** run build, placeholder, axiom, dependency, import-layer and
   numeric-certificate checks.
7. **Review:** obtain both Lean-proof review and independent semantic/domain
   review.
8. **Integrate:** bind the accepted proposition, its evidence class and dependencies in one registry record.
9. **Release:** publish only dependency-closed, reviewed theorem packages.

### V.4.10 Quality gates

Every release must enforce:

- pinned Lean and mathematical-library revisions;
- clean reproducible builds;
- zero `sorry`, `admit`, `sorryAx`, or equivalent proof placeholders;
- no undeclared global axioms or unsafe proof escapes;
- an axiom report for every exported theorem;
- a separate report of the `PUModel` and branch fields used by every theorem;
- a checked, acyclic claim dependency graph;
- forbidden upward imports between assumption tiers;
- exact arithmetic or proved interval bounds for numerical conclusions;
- kernel-checked certificates for external search/SAT computations;
- complete traceability from canonical source claim to Lean declaration;
- explicit nonvacuity for major branch packages; and
- no orphaned declarations or undocumented semantic changes.

The strict public profile should reject undeclared evaluator axioms and unsafe
escapes. If a mechanism such as native evaluation expands the trusted base, its
use must be isolated, declared, and absent from strict-profile exports unless
the project explicitly approves that trust tradeoff.

Because structure fields appear as hypotheses rather than Lean global axioms,
an ordinary axiom report is not enough. The project must generate both the Lean
axiom report and the PU model-field dependency report.

### V.4.11 Review and governance

### Roles

| Role | Responsibility |
|---|---|
| PU semantic reviewer | Checks intended semantics, branch boundaries and source-to-formal correspondence |
| Formalization lead | Owns architecture, coding standards, dependency discipline and releases |
| Lean formalizers | Specify and prove assigned packages; construct countermodels |
| Mathematical physicist/domain reviewer | Checks fidelity and physical/mathematical assumptions |
| Independent Lean reviewer | Reviews proof robustness and trust boundary |
| Reproducibility reviewer | Audits numerics, certificates, CI and release artifacts |

Each definition or axiom version carries an independent semantic review and a
dependency-impact record. Theorem acceptance requires both proof review and
semantic review. Reserve approximately 15–20% of total effort for
independent review and adversarial searches for vacuity, hidden assumptions,
unit errors and counterexamples.

### V.4.12 Risks and mandatory responses

| Risk | Detection | Required response |
|---|---|---|
| Proving the wrong formal statement | Source/Lean mismatch in semantic review | Correct the statement and invalidate downstream status |
| Model-existence obligation | A model is not yet constructed, or a contradiction is proved | Record an open existence obligation separately from a proof of emptiness; develop a witness, countermodel or repaired branch |
| Conceptual circularity | Assumption restates conclusion under new terminology | Downgrade conclusion to assumption or redesign branch |
| Semantic drift | Definition changed to rescue a proof | RFC, major namespace/version change and full impact review |
| Type conflation | Equal integers imported as physical identifications | Introduce distinct types and demand an explicit bridge |
| Finite/continuum conflation | Finite approximation presented as continuum ontology | Separate approximation and reconstruction theorems |
| Untrusted computation | Floating-point/log-only or opaque search result | Replace with exact proof or checked certificate/interval |
| Empirical circularity | Validation target used to choose model inputs | Reclassify as fit; design a prospective held-out test |
| Library gap | Required theory absent or immature | Build a reusable prerequisite library or defer the branch |
| Scope explosion | Theorem count grows faster than proof throughput | Prioritize dependency-central claims and merge duplicate consequences |

### Branch Acceptance Conditions

A branch remains outside the accepted export while any of the following holds:

- its nondegenerate model witness is absent, with an open existence problem and a proved empty model class recorded separately;
- a headline theorem requires an assumption equivalent to its conclusion;
- unresolved dependency cycles remain;
- axioms proliferate faster than derived consequences;
- the formal and source statements have an unrecorded difference in logical strength;
- numerical results depend on uncertified floating-point computation;
- a physical claim has no distinct falsifiable observable; or
- projected work exceeds the scientific value of the branch.

A counterexample or failed derivation is a successful formalization result. It
improves the theory by locating its exact boundary.

### V.4.13 Staffing and realistic scale

The twelve-week pilot measures proof and review throughput. The following
allocation ranges are prospective planning parameters, recalibrated from those
measurements:

| Stage | Indicative effort | Scale decision |
|---|---:|---|
| Charter and registry pilot | 4–6 weeks | Continue if semantic review converges |
| Core semantics and explicit model | 2–3 months | Continue if a nondegenerate model exists |
| SPAP/Horizon finite vertical slice | 3–6 months | Continue if central results survive formalization |
| Finite core, combinatorics, channels and audits | 9–18 additional months | Scale based on pilot theorem velocity |
| Continuum, AQFT, gravity and full phenomenology | 2–5+ years | Start sector-by-sector after library/staffing reviews |

One allocation scenario uses 2–4 Lean formalizers, one mathematical physicist,
a PU semantic reviewer and part-time independent and reproducibility reviewers.
A single-researcher scenario prioritizes the finite core; the continuum and
phenomenology packages use the separate resource estimates in the table.

### V.4.14 Release milestones

### `PU-Lean 0.1` — Finite core

- formalization charter and first claim registry;
- operational response model and finite PCE library;
- explicit `Nonempty PUCoreModel` witness;
- deterministic SPAP;
- three-role/eight-state Horizon result;
- clean axiom and model-field reports.

### `PU-Lean 0.2` — Discrete backbone

- typed `d0/a/b/M/k/D` branch ledger;
- Golay/Steiner certificate suite;
- 24-cell and finite geometry results;
- Appendix-V exact audits.

### `PU-Lean 0.3` — Quantum operational core

- finite states/effects/channels;
- CPTP and no-signaling results;
- informationally complete and conditional Born representation routes;
- perspectival record calculus and process tensors.

### `PU-Lean 0.4` — Dynamics and thermodynamics

- RID, finite stability and information theory;
- structural/reset entropy separation;
- finite QEC, network flow and recovery results.

### `PU-Lean 1.0` — Core formal theory

- 100% classification of canonical core claims;
- all retained core theorems checked;
- branch nonvacuity and compatibility report;
- explicit list of conjectures, counterexamples and physical assumptions;
- machine-generated formal dependency graph.

Later sector releases should cover continuum/AQFT/gravity, gauge/matter,
phenomenology and certified empirical interfaces independently rather than
holding the core release hostage to every research-scale branch.

### V.4.15 Immediate next actions

1. Register the claim set and separate coverage and proof criteria for “verified.”
2. Fix the source definitions, proposition inventory and hashes for `PU.Core.V1`.
3. Select the initial 20–30 claims from Chapters 2–5 and Appendix A.
4. Write controlled-English claim cards for Axioms 1–3, Definitions 4–8,
   SPAP Theorems 10–11, and the Horizon results.
5. Decide the approved foundational axiom policy and mathematical-library pin.
6. Validate the pinned build, premise reports and dependency checks against the existing formalized component.
7. In the first sprint, define `ResponseSystem`, response equivalence,
   `FullContext`, and an explicit cube/eight-state architecture.
8. Prove response equivalence, `FullContext.card_ge_eight`, the
   Theorem-15 operational statement, and one failed-full-context countermodel.
9. Formalize P0/P1 and construct the first finite model.
10. Complete the twelve-week pilot before committing to the full scale.

The first deliverable is a finite nondegenerate model with explicit assumptions and exact SPAP and Horizon statements. The pilot measures proof and review throughput before scaling.
