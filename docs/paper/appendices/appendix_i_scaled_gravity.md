# Appendix I: A PCE-Driven, Environment-Dependent Model for Emergent Gravity

**I.1 Aim and Scope**

Within the Predictive-Universe (PU) framework, this appendix develops the model for emergent gravity as a multi-scale, environment-dependent phenomenon. The Principle of Physical Instantiation (PPI), guided by the Principle of Compression Efficiency (PCE), must provide the most resource-efficient and globally self-consistent mechanism for the gravitational binding of structures across all scales. We demonstrate that this leads to a two-tiered solution: a local "Law Modification" (`G(R)`) for galaxies and a non-local "Source Modification" ("predictive matter") for clusters. This composite model is a PCE‑preferred solution that satisfies both local binding requirements and global cosmological constraints. The galaxy‑scale law‑modification is **environment‑dependent** and does not imply a universal large‑scale shift of $G$ relevant for the CMB.

**I.2 Foundations of Emergent Gravity in PU**

The emergence of gravity in the PU framework is a multi-step process (Sections 11, 12):

*   **MPU network and ND-RID:** The fundamental substrate is an adaptive network of Minimal Predictive Units (MPUs) coupled by Non-Deterministic Reflexive Interaction Dynamics (ND-RID, Definition A.2).
*   **Information limits:** ND-RID is inherently irreversible ($\varepsilon\!\ge\!\ln2$, Theorem 31) and strictly contractive ($f_{\mathrm{RID}}\!<\!1$, Lemma E.1), capping the channel capacity at $C_{\max}(f_{\mathrm{RID}})\!<\!\ln d_{0}$ (Theorem E.2 in Appendix E).
*   **Emergent geometry:** Prediction-Optimization (POP) and PCE drive the network towards geometrically regular configurations (Theorem 43), giving rise to a Lorentzian manifold $(M,g_{\mu\nu})$ (Theorem 46).
*   **Area law:** The channel capacity bound plus emergent geometric regularity give rise to the Horizon Entropy Area Law $S=k_B\mathcal A/(4L_P^2)$ (Theorem 49).
*   **Newton constant:** Identifying the coefficient in the Area Law links the emergent gravitational scale $L_P^2=G\hbar/c^3$ to microscopic MPU parameters (derived in Appendix E, Equation E.9):
    $$
    G(\delta, C_{\max}, \chi) \simeq \frac{\eta \delta^2 c^3}{4 \hbar \chi C_{\max}(f_{RID})}.
    \tag{I.1}
    $$
(where $\delta$ is the effective microscopic MPU spacing, $\eta$ is a geometric packing factor, $\chi$ is the correlation factor reducing effective channel density, $\sigma_{eff_link} = \chi / (\eta \delta^2)$ is the effective boundary channel density as per Theorem E.3, and $C_{max}$ is the channel capacity). This appendix implicitly assumes $\chi \approx 1$ for its subsequent scale-dependent arguments, effectively using $G \propto \delta^2/C_{max}$. Equation (I.1) is dimensionally consistent as shown in Appendix H.
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

### **I.5.1 Derivation of Crossover Behavior from PCE Optimization**

The parameter relaxation described in Section I.5 implies that the MPU network's equilibrium structure, and thus the value of the emergent gravitational constant $G$, depends on the local information environment, which we proxy by the baryonic matter density $\rho_b$. We can formalize this by modeling the local contribution to the global PCE Potential from the network's structural parameters, $V_{struct}(\delta, C_{max}; \rho_b)$. This potential balances the cost of maintaining the network's infrastructure against the predictive benefit it provides.
$$
V_{struct}(\delta, C_{max}; \rho_b) = V_{cost}(\delta, C_{max}) - V_{benefit}(\delta, C_{max}; \rho_b)
\tag{I.3.1}
$$
The system dynamically adjusts its effective local parameters $\delta$ and $C_{max}$ to minimize this potential.

*   **Analysis of Cost and Benefit:**
    *   **Structural Cost $V_{cost}$:** This term represents the physical resources needed to maintain the network. A denser network (smaller $\delta$) and higher-fidelity channels (larger $C_{max}$, which requires minimizing $\varepsilon$) are physically more costly. Thus, $V_{cost}$ is a decreasing function of $\delta$ and an increasing function of $C_{max}$.
    *   **Predictive Benefit $V_{benefit}$:** The benefit arises from the network's ability to form complex predictive models of the local environment. This ability, $PP_{agg}$, depends on having a dense (small $\delta$) and high-fidelity (large $C_{max}$) network. The total benefit is proportional to the amount of "stuff to predict," which is directly related to $\rho_b$. Thus, $V_{benefit}$ is a decreasing function of $\delta$, an increasing function of $C_{max}$, and an increasing function of $\rho_b$.

*   **Derivation of Crossover Behavior:** The system's minimization of $V_{struct}$ leads to two distinct equilibrium regimes:
    *   **High $\rho_b$ (e.g., galactic cores):** The benefit term $V_{benefit}$ is large and dominates the optimization. PCE drives the network to a high-cost, high-performance state to maximize predictive gain. This corresponds to an equilibrium with a small spacing $\delta_0$ and a large channel capacity $C_{max,0}$.
    *   **Low $\rho_b$ (e.g., galactic outskirts):** The benefit term is weak. PCE drives the network to a low-cost, low-performance state to conserve resources. This corresponds to an equilibrium with a large spacing $\delta_{large}$ and a small channel capacity $C_{max,low}$.
    
This analysis proves that the equilibrium values $(\delta*, C_{max}*)$ must be functions of $\rho_b$, and that the system must transition between these two distinct regimes as $\rho_b$ changes. The functional form of the scale-dependent $G(R)$ introduced in the next section is a physically-motivated phenomenological model of this derived crossover behavior.


**I.6 Scale-Dependent Newton Constant**

The variation of the microscopic parameters $\delta$ and $C_{\max}$ with the scale $R$ (associated with the density of predictive information and effective $\hat C_{\mathrm{target}}(R)$) due to the PCE-driven parameter relaxation mechanism (Section I.5) leads to a scale-dependent emergent Newton constant $G(R)$, as given by Equation (I.1). We model this scale dependence using a minimal phenomenological interpolation function (consistent with the robustness discussion in Section 6.7):

$$
G(R)=G_0\!\left[1+A_G
        \bigl(1-e^{-(R/L_0)^m}\bigr)\right]
\tag{I.3}
$$

where $G_0$ is the value approached at small scales $R \ll L_0$, $A_G$ is the total fractional enhancement ($A_G = G_{\mathrm{large}}/G_0 - 1$), $L_0$ is a characteristic transition scale at which $G$ begins to increase, and $m \ge 1$ (typically $m \gtrsim 2$) is a parameter determining the steepness of the transition.

This yields the explicit running of the Newton constant with scale $R$; as a robustness check, replacing the exponential by a logistic or Hill-type transition function preserves the qualitative baryon-tracking behavior for the same $(L_0,A_G,m)$ scale hierarchy:

$$
\boxed{\,G(R)=G_0
          \Bigl[1+A_G\bigl(1-e^{-(R/L_0)^m}\bigr)\Bigr]\,}.
\tag{I.4}
$$

The parameter set $(G_0,L_0,A_G,m)$ is expected to be universal, determined by the fundamental properties of the MPU network and the PCE optimization landscape. $L_0$ is the scale at which $\hat C_{\mathrm{target}}(R)$ becomes sufficiently low in sparse regions to trigger significant parameter relaxation.

**I.7 A Multi-Scale Solution from Global PCE Optimization**

The PU framework provides two distinct mechanisms to augment gravity: adapting local network parameters to modify the emergent law (`G`), or collectively reconfiguring the substrate to modify the emergent source (`T_μν`). The choice of mechanism is not arbitrary but is determined by a global PCE optimization that balances local resource costs against global consistency costs.

**I.7.1 Galactic Scales: Law Modification as the Low-Cost Solution**

In the moderate potential wells of galaxies, the required gravitational enhancement is small. Here, PCE selects the most efficient mechanism: a local adaptation of MPU network parameters. This "parameter relaxation" (Section I.5) manifests as a scale-dependent Newton constant, `G(R)` (Eq. I.4). This is the low-cost solution, as it represents a passive relaxation of the substrate and the required asymptotic enhancement `A_G` is small enough to remain consistent with global cosmological constraints. In the weak-field limit, this is formally equivalent to an effective dark matter density that tracks the baryonic distribution:

$$
\nabla^2\Phi \simeq 4\pi G_0 \left[ \rho_b(R) + \rho_{\mathrm{DM,eff}}(R) \right], \quad \text{where} \quad \rho_{\mathrm{DM,eff}}(R) = \left[ \frac{G(R)}{G_0} - 1 \right] \rho_b(R).
\tag{I.6}
$$

This adaptation is **environment‑dependent** and does not alter the homogeneous early‑Universe limit relevant for the CMB.

**I.7.2 Cluster Scales: Non-Local Source Modification as the Necessary Solution**

In the deep potential wells of galaxy clusters, the required gravitational enhancement is large. A "Law Modification" (`G(R)`) that could produce this effect is ruled out *a priori* by the global consistency requirement, as it would violate precise CMB constraints on the value of `G` in the early universe.

PCE must therefore select the remaining globally consistent mechanism: "Source Modification." Furthermore, the nature of this response is also dictated by PCE. A purely local response ($\rho_{\rm PM}(r)\propto\rho_b(r)$) is informationally sub‑optimal and dynamically inefficient. The MPU network, as an integrated predictive system, naturally adapts to the most salient non‑local feature of the gravitational environment: the baryonic potential $\Phi_b$. A local response would be predictively myopic and prone to instabilities, incurring high coherence costs disfavored by PCE.

Therefore, PCE **preferentially selects** a **non‑local "predictive matter" (PM) response**, a collective reconfiguration of the MPU substrate that is a functional of the baryonic potential. The minimal mathematical implementation of this required non‑local principle is an integral model:

$$
\rho_{\rm PM}(r)=A_{\rm PM}\!\int K\!\big(|\mathbf r-\mathbf r'|;L_0\big)\,\rho_b(r')\!\left(\frac{|\nabla\Phi_b(r')|}{g_\ast}\right)^{q}\! d^3r',
\tag{I.7}
$$

where $K$ is a kernel representing the network's correlation length, $\Phi_b$ is the baryonic potential, $g_\ast$ is a characteristic acceleration, and $q$ is a universal nonlinearity exponent. With $\int K d^3x=1$, the total PM mass is $M_{\rm PM} = A_{\rm PM} \int \rho_b(r') \left(\frac{|\nabla\Phi_b(r')|}{g_\ast}\right)^{q} d^3r' = A_{\rm PM} \left\langle\left(\frac{|\nabla\Phi_b|}{g_\ast}\right)^{q}\right\rangle_{\rho_b} M_b$; thus, once $q$ and $g_\ast$ are fixed, cluster baryon budgets constrain the combination $A_{\rm PM} \left\langle\left(\frac{|\nabla\Phi_b|}{g_\ast}\right)^{q}\right\rangle_{\rho_b}$ (not $A_{\rm PM}$ alone). For $q>0$, $\rho_{\rm PM}$ vanishes in homogeneous backgrounds, keeping the recombination-era coupling unchanged and satisfying CMB bounds. We take $\rho_{\rm PM}$ to arise from an effective nonlocal susceptibility (or action) so that the associated $T^{\mu\nu}*{\rm PM}$ obeys $\nabla*\mu (T^{\mu\nu}*{\rm b}+T^{\mu\nu}*{\rm PM})=0$.

**I.8 Consistency with Local Tests of GR**

The scale-dependent gravity model (Equation I.4) must be consistent with the classic precision tests of General Relativity in the solar system and binary pulsars. Define the fractional enhancement
$$
\varepsilon_G(R)\ \coloneqq\ \frac{G(R)}{G_0}-1\ =\ A_G\!\left(1-e^{-(R/L_0)^m}\right),
$$
so for $R\ll L_0$ we have the small‑argument approximation $\varepsilon_G(R)\simeq A_G\,(R/L_0)^m$ (from (I.4)).

*   **Scale separation:** Local tests operate on scales $R_\odot\sim 10^{-6}\,\mathrm{kpc}$, vastly smaller than the transition scale $L_0 \sim \mathrm{kpc}$. For $R \ll L_0$, Equation (I.4) gives $\varepsilon_G(R) \approx A_G (R/L_0)^m$. With $m \ge 1$ and $A_G = \mathcal O(1)$, $\varepsilon_G(R_\odot)$ is extremely small (e.g., for $A_G=1, L_0=1$ kpc, $m=2$, $\varepsilon_G(10^{-6} \text{ kpc}) \approx (10^{-6})^2 = 10^{-12}$).
*   **Recovery of $G_0$:** For $R \ll L_0$, $G(R) \approx G_0$, effectively recovering constant Newton gravity.
*   **PPN parameters:** The smallness of $\varepsilon_G(R)$ on solar system scales implies that the parameterized post-Newtonian (PPN) parameters, which quantify deviations from Newtonian gravity and flat spacetime, remain consistent with observations ($\gamma_{\mathrm{PPN}}\simeq\beta_{\mathrm{PPN}}\simeq1$). Deviations would only appear at scales comparable to or larger than $L_0$.

**I.9 Numerical Plausibility and Cosmological Bounds**

The parameters $(G_0, L_0, A_G, m)$ in Equation (I.4) must align with astronomical observations.

*   **Galaxy dynamics:** Observed rotation curves and galaxy scaling relations (e.g., baryonic Tully-Fisher Relation [McGaugh 2012], Radial Acceleration Relation [McGaugh et al. 2016]) indicate that the effective gravitational field requires an enhancement over Newtonian gravity by factors of $2$ to $10$ on scales $R \sim 1$–$100\,\mathrm{kpc}$. For $R\gg L_0$, the local coupling satisfies $G(R)\to G_0(1+A_G)$, while for a bounded baryonic system the asymptotic field enhancement is $1+\langle\varepsilon_G\rangle_b \le 1 + A_G$, where $\langle\varepsilon_G\rangle_b$ is the baryon‑mass‑weighted average of $\varepsilon_G(R)$. This requires $A_G = 1$ to $9$, consistent with $A_G = \mathcal O(1)$.
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
*   A joint Bayesian inference analysis (e.g., using nested sampling \[Feroz & Hobson 2008; Feroz et al. 2009, 2019]) to determine the universal parameter set $(L_0,A_G,m)$ and the per-galaxy $\Upsilon_\ast$ values by comparing predicted and observed rotation curves. When inferring $A_G$ from rotation curves, the effective far‑field enhancement reflects the baryon‑mass‑weighted $\langle\varepsilon_G\rangle_b$ rather than $A_G$ itself; the numerical fits naturally absorb this via the $\rho_{\mathrm{DM,eff}}(R)=\varepsilon_G(R),\rho_b(R)$ source.

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

The PU framework proposes a multi-scale solution to the phenomena attributed to dark matter, driven by the Principle of Compression Efficiency.
1.  **At galaxy scales,** a PCE-driven parameter relaxation mechanism causes the emergent Newton constant to increase with scale ($G(R)$, Eq. I.4), providing a physically motivated framework that naturally explains galaxy rotation curves and baryonic scaling relations while respecting local tests of GR, **as an environment‑dependent relaxation** that leaves the CMB‑era effective $G$ unchanged.
2.  **At cluster scales**, where a running $G(R)$ is cosmologically constrained, the mass discrepancy is modeled by a **non‑local predictive‑matter response**. A linear, single‑scale kernel is sufficient for **stacked profiles**, while **high‑concentration outliers** (e.g., A1689) demand either a **mild nonlinearity $q>0$** or a **multi‑scale kernel**. All options remain **CMB‑safe** with $A_G\simeq 0$ and are quantitatively testable against lensing data.

This composite model provides a coherent, physically-grounded explanation for dark matter phenomenology across different astrophysical scales and yields a rich set of falsifiable predictions.