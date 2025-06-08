# Appendix I: Scale-Dependent Emergent Gravity and Effective-Dark-Matter Phenomenology

**I.1 Aim and Scope**

Within the Predictive-Universe (PU) framework, this appendix sketches a mechanism by which the emergent Newton constant becomes scale-dependent. This scale dependence arises naturally from the Principle of Compression Efficiency (PCE) governing the adaptation of MPU networks in varying environments. The resulting modification to gravity on kiloparsec and larger scales reproduces the principal dynamical phenomena usually attributed to cold dark matter. Natural units $\hbar=c=1$ are used except where they clarify dimensions of $G$.

**I.2 Foundations of Emergent Gravity in PU**

The emergence of gravity in the PU framework is a multi-step process (Sections 11, 12):

*   **MPU network and ND-RID:** The fundamental substrate is an adaptive network of Minimal Predictive Units (MPUs) coupled by Non-Deterministic Reflexive Interaction Dynamics (ND-RID, Definition A.2).
*   **Information limits:** ND-RID is inherently irreversible ($\varepsilon\!\ge\!\ln2$, Theorem 31) and strictly contractive ($f_{\mathrm{RID}}\!<\!1$, Lemma E.1), capping the channel capacity at $C_{\max}(f_{\mathrm{RID}})\!<\!\ln d_{0}$ (Theorem E.2 in Appendix E).
*   **Emergent geometry:** Prediction-Optimization (POP) and PCE drive the network towards geometrically regular configurations (Theorem 43), giving rise to a Lorentzian manifold $(M,g_{\mu\nu})$ (Theorem 46).
*   **Area law:** The channel capacity bound plus emergent geometric regularity give rise to the Horizon Entropy Area Law $S=k_B\mathcal A/(4L_P^2)$ (Theorem 49).
*   **Newton constant:** Identifying the coefficient in the Area Law links the emergent gravitational scale $L_P^2=G\hbar/c^3$ to microscopic MPU parameters (derived in Appendix E, Equation E.9):
    $$
    G(\delta, C_{\max}, \chi) \simeq \frac{\eta \delta^2 c^3}{4 \hbar \chi C_{\max}(f_{RID})}.
    \tag{I.1}
$$
(where $\delta$ is the effective microscopic MPU spacing, $\eta$ is a geometric packing factor, $\chi$ is the correlation factor reducing effective channel density, $\sigma_{eff\_link} = \chi / (\eta \delta^2)$ is the effective boundary channel density as per Theorem E.3, and $C_{max}$ is the channel capacity). This appendix implicitly assumes $\chi \approx 1$ for its subsequent scale-dependent arguments, effectively using $G \propto \delta^2/C_{max}$. Equation (I.1) is dimensionally consistent as shown in Appendix H.
*   **Einstein field equations:** Applying thermodynamic principles (Clausius relation) to causal horizons in the emergent geometry, using the Area Law and the MPU stress-energy tensor $T_{\mu\nu}^{(\mathrm{MPU})}$ (Definition B.8, Appendix B) as the source, yields the Einstein field equations (Theorem 50).

**I.3 Complexity Saturation in Prediction**

The MPU network's adaptation is driven by balancing predictive gain against resource cost according to the Principle of Compression Efficiency (PCE, Definition 15). The effective aggregate complexity $\bar C_{\mathrm{agg}}(R)$ in a region of scale $R$ adapts to match the perceived predictive difficulty $\hat C_{\mathrm{target}}(R)$ for that region (Equation 38), achieving a Predictive Performance $PP(C,\hat C_{target})$ determined by the Law of Prediction (Equation 22). The optimal complexity $C^*$ for a given $\hat C_{\mathrm{target}}$ is determined by the condition where the marginal predictive benefit equals the marginal resource cost (Definition 14, Equation 18):
$$
\Gamma_0\,\frac{\partial PP}{\partial C}\bigg|_{C^*} = \lambda\,R'(\bar C_{\mathrm{agg}}^*)
     + R'_I(\bar C_{\mathrm{agg}}^*).
\tag{I.2}
$$
As complexity $\bar C_{\mathrm{agg}}$ increases, the marginal predictive gain $\partial PP/\partial C$ decreases (diminishing returns, $\partial^2 PP/\partial C^2 < 0$), while the marginal resource costs ($R', R_I'$) generally increase or remain non-negative ($R'' \ge 0$, $R_I'' \propto -1/C^2 < 0$ for $C>K_0$, but total marginal cost typically non-decreasing). This creates a balance point.

**Proposition I.1 (Saturation of Aggregate Complexity).**
Given the diminishing returns in predictive performance from increasing complexity ($\partial^2 PP/\partial C^2 < 0$) and the increasing or non-decreasing marginal costs ($R' \ge 0, R_I' > 0$ for $C>K_0$), Equation (I.2) necessarily admits a finite optimal complexity value $\bar C_{\mathrm{agg,sat}}$ beyond which additional complexity investment is disfavoured by PCE. This saturation level depends on the environment and the perceived predictive difficulty $\hat C_{\mathrm{target}}$.

*Proof:* The marginal benefit term $\Gamma_0 (\partial PP/\partial C)$ decreases from a finite value towards zero as $C \to \infty$ (Equation 25). The marginal cost term $\lambda R' + R_I'$ is positive for $C>K_0$ and generally non-decreasing with $C$ (Definition 3). Thus, there must exist a finite complexity $C^*$ where the decreasing benefit curve intersects the increasing or non-decreasing cost curve. This intersection point represents the optimal complexity allocation $\bar C_{\mathrm{agg,sat}}$.

**I.4 Predictive-Information Saturation in Sparse Regimes**

The perceived predictive difficulty $\hat C_{\mathrm{target}}$ (Definition 21) for an MPU aggregate in a given environment reflects the complexity of patterns that can be exploited for prediction.

*   **Hypothesis I.1:** In low-density, sparse regions of the MPU network (e.g., the voids of large-scale structure, galactic outskirts), the available density of predictive information is lower and less complex than in high-density regions (e.g., galactic cores). This results in a lower effective target complexity $\hat C_{\mathrm{target}}(R)$ for a predictive system operating at scale $R$.
*   **Corollary I.2:** Under Hypothesis I.1 and the Law of Prediction (Equation 22), achieving high predictive performance $PP$ requires allocating complexity $C(PP, \hat C_{\mathrm{target}})$ proportional to $\hat C_{\mathrm{target}}$ (Equation 23). Equation (I.2) determines the optimal saturation complexity $\bar C_{\mathrm{agg,sat}}(\hat C_{\mathrm{target}})$. A lower $\hat C_{\mathrm{target}}$ in sparse environments implies that the PCE optimization balancing benefit and cost will lead to a lower saturation threshold $\bar C_{\mathrm{agg,sat}}$ compared to dense regions. The system saturates its complexity investment sooner because there are fewer exploitable predictive patterns to justify higher costs.

**I.5 Parameter-Relaxation Mechanism due to Early Saturation**

When the MPU network in sparse regions saturates at a lower complexity level $\bar C_{\mathrm{agg,sat}}$ (Corollary I.2), the selection pressure on the microscopic MPU parameters governing network structure and interaction efficiency is altered. Specifically, PCE (Definition 15) drives configurations that minimize costs. If the density of predictive information does not warrant maintaining high complexity, the pressure to maintain the high-fidelity, densely packed configurations optimal for high complexity is reduced. This drives a "relaxation" of the effective microscopic MPU parameters:

*   **Effective Microscopic Spacing $\delta(R)$ increases:** Maintaining a tight packing (small $\delta$) is costly (e.g., propagation costs $\propto 1/\delta^2$ or $\ln \delta$ type terms). If the predictive benefit from close spacing is low, PCE favors larger effective spacing, reducing propagation cost.
*   **Effective Channel Capacity $C_{\max}(R)$ decreases:** High channel capacity requires maintaining low information loss (high $f_{RID} \approx e^{-\varepsilon}$), meaning low irreducible cost $\varepsilon$. Minimizing $\varepsilon$ requires investing resources (Theorem 31 links $\varepsilon$ to physical process). If the benefit from high fidelity is low (due to low $\hat C_{target}$), PCE favors accepting higher $\varepsilon$, allowing $C_{max}$ to decrease.

These parameter variations, $\delta(R)$ increasing and $C_{\max}(R)$ decreasing in sparse, large-scale regions ($R \gg L_0$), combine to raise the factor $\eta\delta^2/C_{\max}$ in Equation (I.1).

**I.6 Scale-Dependent Newton Constant**

The variation of the microscopic parameters $\delta$ and $C_{\max}$ with the scale $R$ (associated with the density of predictive information and effective $\hat C_{\mathrm{target}}(R)$) due to the PCE-driven parameter relaxation mechanism (Section I.5) leads to a scale-dependent emergent Newton constant $G(R)$, as given by Equation (I.1). We model this scale dependence phenomenologically using an interpolation function:

$$
G(R)=G_0\!\left[1+A_G
        \bigl(1-e^{-(R/L_0)^m}\bigr)\right]
\tag{I.3}
$$

where $G_0$ is the value approached at small scales $R \ll L_0$, $A_G$ is the total fractional enhancement ($A_G = G_{\mathrm{large}}/G_0 - 1$), $L_0$ is a characteristic transition scale at which $G$ begins to increase, and $m \ge 1$ (typically $m \gtrsim 2$) is a parameter determining the steepness of the transition.

This yields the explicit running of the Newton constant with scale $R$:

$$
\boxed{\,G(R)=G_0
          \Bigl[1+A_G\bigl(1-e^{-(R/L_0)^m}\bigr)\Bigr]\,}.
\tag{I.4}
$$

The parameter set $(G_0,L_0,A_G,m)$ is expected to be universal, determined by the fundamental properties of the MPU network and the PCE optimization landscape. $L_0$ is the scale at which $\hat C_{\mathrm{target}}(R)$ becomes sufficiently low in sparse regions to trigger significant parameter relaxation.

**I.7 Weak-Field Limit and Effective Dark Matter**

In the weak-field limit, gravity is described by the Poisson equation $\nabla^2\Phi=4\pi G \rho$. Replacing the standard constant $G_0$ with the scale-dependent $G(R)$ from Equation (I.4), and considering a baryonic mass distribution $\rho_b(R)$, we get:
$$
\nabla^2\Phi\simeq4\pi G(R)\rho_b(R) = 4\pi G_0\bigl[1+A_G(1-e^{-(R/L_0)^m})\bigr]\rho_b(R)
$$
$$
\nabla^2\Phi\simeq4\pi G_0\bigl[1+\varepsilon_G(R)\bigr]\rho_b(R),
\qquad
\varepsilon_G(R)=A_G\bigl(1-e^{-(R/L_0)^m}\bigr),
\tag{I.5}
$$
where $\varepsilon_G(R)$ is the scale-dependent fractional enhancement factor. This equation can be formally recast in the form of the standard Poisson equation sourced by a total density $\rho_{total} = \rho_b + \rho_{\mathrm{DM,eff}}$:
$$
\nabla^2\Phi=4\pi G_0\!\left[\rho_b(R)+\rho_{\mathrm{DM,eff}}(R)\right],
\quad
\rho_{\mathrm{DM,eff}}(R)=\varepsilon_G(R)\,\rho_b(R).
\tag{I.6}
$$
Equation (I.6) shows that the scale-dependent Newton constant $G(R)$ is formally equivalent to the presence of an effective dark-matter density $\rho_{\mathrm{DM,eff}}(R)$ that is directly proportional to the baryonic density $\rho_b(R)$ and whose proportionality factor $\varepsilon_G(R)$ increases with scale according to Equation (I.5). This mechanism naturally produces a dark-matter phenomenology that tracks baryons, a key empirical observation in galaxy dynamics (e.g., the Radial Acceleration Relation). While the existence of such a scale dependence is motivated by the framework's principles, the specific transition scale $L_0$ in Equation (I.4) is currently treated as a phenomenological parameter constrained by observation; its derivation from underlying MPU network properties remains a subject for future work.

In far-from-equilibrium situations (like galaxy cluster mergers), the scale dependence might not be instantaneous or might involve transient effects related to the dynamics of complexity adaptation, potentially introducing a transient stress component $\rho_\Pi(R,t)$:
$$
\nabla^2\Phi=4\pi G_0
  \bigl[\rho_b+\rho_{\mathrm{DM,eff}}+\rho_\Pi(R,t)\bigr].
\tag{I.7}
$$
The specific form and significance of $\rho_\Pi$ require further investigation.

**I.8 Consistency with Local Tests of GR**

The scale-dependent gravity model (Equation I.4) must be consistent with high-precision tests of General Relativity in the solar system and binary pulsars.

*   **Scale separation:** Local tests operate on scales $R_\odot \sim 10^{-6}\,\mathrm{kpc}$, vastly smaller than the transition scale $L_0 \sim \mathrm{kpc}$. For $R \ll L_0$, Equation (I.5) gives $\varepsilon_G(R) \approx A_G (R/L_0)^m$. With $m \ge 1$ and $A_G = \mathcal O(1)$, $\varepsilon_G(R_\odot)$ is extremely small (e.g., for $A_G=1, L_0=1$ kpc, $m=2$, $\varepsilon_G(10^{-6} \text{ kpc}) \approx (10^{-6})^2 = 10^{-12}$).
*   **Recovery of $G_0$:** For $R \ll L_0$, $G(R) \approx G_0$, effectively recovering constant Newton gravity.
*   **PPN parameters:** The smallness of $\varepsilon_G(R)$ on solar system scales implies that the parameterized post-Newtonian (PPN) parameters, which quantify deviations from Newtonian gravity and flat spacetime, remain consistent with observations ($\gamma_{\mathrm{PPN}}\!\simeq\!\beta_{\mathrm{PPN}}\!\simeq\!1$). Deviations would only appear at scales comparable to or larger than $L_0$.

**I.9 Numerical Plausibility and Cosmological Bounds**

The parameters $(G_0, L_0, A_G, m)$ in Equation (I.4) must align with astronomical observations.

*   **Galaxy dynamics:** Observed rotation curves and galaxy scaling relations (e.g., baryonic Tully-Fisher Relation [McGaugh 2012], Radial Acceleration Relation [McGaugh et al. 2016]) indicate that the effective gravitational field requires an enhancement over Newtonian gravity by factors of $2$ to $10$ on scales $R \sim 1$–$100\,\mathrm{kpc}$. For large $R$, $G(R)/G_0 \approx 1+A_G$. This requires $A_G = 1$ to $9$, consistent with $A_G = \mathcal O(1)$.
*   **Transition scale:** The transition scale $L_0$ corresponds to the acceleration scale $g_0$ (Theorem H.1, Appendix H). The empirical $g_0 \sim 1.2 \times 10^{-10}\,\mathrm{m\,s}^{-2}$ aligns with scales of galactic discs (few kpc). Thus, $L_0$ is expected to be of order a few kiloparsecs, consistent with Equation (H.4) if $\Lambda$ and $\eta'$ are of the expected magnitude.
*   **Steepness:** The sharpness of the transition in the Radial Acceleration Relation suggests $m \gtrsim 2$.
*   **Cosmological variation:** If the fundamental parameters $(\delta, C_{\max})$ that determine $(L_0, A_G, m)$ evolve on cosmological timescales (e.g., Hubble time), current bounds on temporal variation of $G$ (e.g., $|\dot G/G|\!\lesssim\!10^{-12}\,\mathrm{yr}^{-1}$ from cosmology and solar system) can still be met, provided the cosmological evolution is slow (Section I.14, [Uzan 2011]).

**I.10 Phenomenological Predictions**

The scale-dependent gravity framework derived from PU principles leads to several testable predictions:

1.  **Universal force law:** The mechanism predicts that the enhancement factor $\varepsilon_G(R)$ depends only on scale $R$ and baryonic density (through $\hat C_{target}(R)$ in Hypothesis I.1 which is related to density), leading to tight, universal relations between the baryonic mass distribution and observed kinematics (e.g., baryonic Tully-Fisher Relation, Radial Acceleration Relation), fixed by the universal parameter triple $(L_0,A_G,m)$.
2.  **Parameter universality:** The parameter set $(L_0,A_G,m)$ should be approximately universal across all galaxies, irrespective of formation history.
3.  **Absence of particle DM:** The observed phenomena are explained by modified gravity, predicting null results for direct detection experiments searching for conventional dark matter particles (WIMPs, axions, etc.).
4.  **Cosmological signatures:** The scale dependence of gravity could influence structure growth and cosmological observables. Deviations from $\Lambda$CDM predictions might be observable in cosmic microwave background (CMB) or large-scale structure surveys if $G$ varies with local density or cosmic time.
5.  **Transient stresses:** The dynamics of complexity adaptation and parameter relaxation might lead to transient effects (e.g., $\rho_\Pi$ in Equation I.7) in highly dynamic events like galaxy cluster mergers, potentially causing observable discrepancies between baryonic matter distribution and gravitational lensing maps (like the apparent offset observed in the Bullet Cluster [Clowe et al. 2006]).

**I.11 Prospective Rotation-Curve Analysis**

A direct test of the scale-dependent $G(R)$ model is to fit it to observed galaxy rotation curves. The SPARC database [Lelli et al. 2016], providing high-quality rotation curves and detailed baryonic mass models for 152 disk galaxies, offers an ideal dataset. A full comparison requires:

*   Accurate baryonic mass models for each galaxy, requiring estimates of stellar mass-to-light ratios $\Upsilon_\ast$.
*   Numerical solutions of the modified Poisson equations (Equation I.5 or I.6) for each galaxy's baryonic distribution, incorporating the scale-dependent $G(R)$.
*   A joint Bayesian inference analysis (e.g., using nested sampling [Feroz & Hobson 2008; Feroz et al. 2009, 2019]) to determine the universal parameter set $(L_0,A_G,m)$ and the per-galaxy $\Upsilon_\ast$ values by comparing predicted and observed rotation curves.

**I.12 Robustness and Systematics**

The analysis must account for potential systematic errors. Robustness can be gauged by:

*   **Bootstrap resampling:** Assessing sensitivity to uncertainties in distances, inclinations, and photometric measurements.
*   **Comparison to NFW fits:** Comparing the quality of fit and consistency of parameters to standard $\Lambda$CDM models fitting NFW dark matter halos plus baryonic components.
*   **$\Upsilon_\ast$ consistency:** Checking if fitted stellar $\Upsilon_\ast$ values are consistent with stellar population synthesis models.

**I.13 Expected Parameter Ranges**

Order-of-magnitude reasoning based on galaxy scaling laws and the empirical $g_0$ scale suggests the following ranges for the universal parameters:
$$
L_0\sim1\!-\!10\,\mathrm{kpc},\qquad
A_G\sim1\!-\!9,\qquad
m\simeq2\!-\!4.
$$
These ranges will be constrained by the forthcoming rotation-curve fits. Note that the range for $A_G$ is widened here compared to Section I.9 to accommodate the full range of needed enhancements (2-10 times).

**I.14 Timescale Separation**

The adaptation dynamics of local MPU parameters ($\delta, C_{\max}$) governing $G(R)$ are much faster (Myr–Gyr for reaching local PCE equilibrium) than potential cosmological drift of the environment or fundamental parameters that might cause $(L_0, A_G, m)$ to evolve (Gyr–Hubble time). This hierarchy justifies treating $G(R)$ as quasi-static when analyzing galaxy dynamics, while allowing for a slow cosmic evolution of the universal parameters themselves.

**I.15 Conclusion**

The Principle of Compression Efficiency and complexity saturation in sparse predictive environments lead to a PCE-driven parameter relaxation mechanism that causes the emergent Newton constant to increase with scale in low-density regions. The resulting function $G(R)$, Equation (I.4), provides a physically motivated framework that naturally explains galaxy-scale mass discrepancies (e.g., rotation curves, scaling relations). This emergent gravity scenario respects local tests of GR and yields falsifiable predictions for baryon–kinematic relations and potentially cluster dynamics. Detailed rotation-curve fits and cosmological simulations testing the evolution of $G(R)$ are necessary next steps to validate this aspect of the Predictive Universe framework.

