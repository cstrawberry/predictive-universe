# Appendix T: A Substrate-First Derivation of the Electroweak Scale

**Abstract**
We derive the electroweak/Planck hierarchy from first principles within the Predictive Universe (PU) framework by constructing a macroscopic effective potential directly from microscopic Minimal Predictive Unit (MPU) dynamics. The emergent scalar order parameter is a block average of a bounded, $\mathbb{Z}_2$-symmetric local observable defined from MPU primitives. We construct a concrete instance of this observable via a physically-motivated ansatz, demonstrating it can possess the necessary quantum numbers (e.g., $SU(2)_L$ triplet proxy) to track the Higgs vacuum expectation value. Using large-deviation theory, the effective potential is obtained as the difference of (i) a constrained operational/communication cost and (ii) a predictive-information benefit. A key geometric feature—an area law for inter-block penalties—introduces a boundary mass term that competes with a logarithmically destabilizing bulk drift. Wilsonian block recursion yields an emergent critical scale $\ell^*$ at which the quadratic curvature (mass) changes sign, triggering spontaneous symmetry breaking. We derive the Renormalization Group (RG) flow, correctly separating the logarithmic running of the bulk mass from the geometric dilution ($1/\ell$) of the boundary term. The resulting vacuum expectation value satisfies $v \simeq \zeta/(\ell^*\delta)$, yielding an exponential hierarchy $v/M_{Pl}$ from logarithmic renormalization. All coefficients are expressed in terms of MPU cumulants, mixed cumulants with the bulk cost density, and boundary cumulants arising from the ND–RID link geometry. We provide explicit MPU-native constructions and formulas for these coefficients, along with a closed-form solution for $\ell^*$ using the Lambert–$W$ function. A monotonicity argument based on emergent ferromagnetic correlations justifies the sign flip of the bulk mass. We compare this mechanism to Coleman–Weinberg, technicolor, and supersymmetry, highlighting the distinctive prediction $\partial \ln v/\partial \ln C_{\max} > 0$. This derivation is a key component of the framework's ability to explain the Standard Model's structure from first principles.

---

## T.1 Introduction and Overview

A longstanding open problem in fundamental physics is to explain the vast hierarchy between the electroweak scale and the Planck scale, $v/M_{Pl} \approx 10^{-17}$, without resorting to fine-tuning of parameters. This appendix develops a substrate-first solution within the PU framework, where physical reality emerges from the operational dynamics of a network of interacting, information-processing agents—Minimal Predictive Units (MPUs)—governed by the Principle of Compression Efficiency (PCE).

The core mechanism is a competition between predictive benefits and resource costs that manifests geometrically. Under coarse-graining, this competition produces a macroscopic order parameter with an effective potential whose quadratic curvature (effective mass) runs from positive to negative at a critical block size $\ell^*$. This sign flip induces spontaneous symmetry breaking, and the resulting vacuum expectation value (VEV) is set by the inverse of this emergent length scale, $v \simeq \zeta/(\ell^*\delta)$. An exponential hierarchy, $v/M_{Pl} \ll 1$, arises because the bulk mass term runs logarithmically with scale, while the stabilizing boundary term dilutes geometrically as $1/\ell$. The mechanism is contingent on the PCE-driven emergence of ferromagnetic correlations, a foundational property derived in Section T.2.4.

**Key elements.**

1. **Substrate-first construction.** The emergent order parameter is a coarse-grained average of a bounded, $\mathbb{Z}_2$-symmetric local observable derived explicitly from MPU state space. Contingent on the emergence of the Standard Model gauge group (Appendix G.8), we construct a concrete instance of this observable with the correct quantum numbers to serve as a proxy for the Higgs VEV.
2. **PCE-driven potential.** The effective potential $V_{\rm eff}(\phi)=\mathcal{C}(\phi)-\mathcal{I}(\phi)$ is built from a constrained resource cost $\mathcal{C}$ and a predictive-information benefit $\mathcal{I}$ (a large-deviation rate function).
3. **Geometric competition.** Area-law scaling of communication penalties across block boundaries generates a positive boundary mass term $2B/\ell$ that stabilizes $\phi=0$ at small scales, competing against a logarithmically destabilizing bulk drift.
4. **Wilsonian recursion.** Coarse-graining dilutes the boundary term while driving the bulk mass negative via logarithmic running, producing a critical block scale $\ell^*$.

**Distinctive features.**

* No field-theory templates are assumed (contrast Coleman–Weinberg); the potential is derived from the statistics of the underlying MPU network.
* No new confining dynamics or superpartners are introduced (contrast technicolor and SUSY).
* Testable prediction: $\partial \ln v/\partial \ln C_{\max} > 0$. This implies that increasing the fundamental ND–RID channel capacity $C_{\max}$ would raise the electroweak scale $v$.

---

## T.2 Microscopic PU Model and MPU-Native Definitions

### T.2.1 PU primitives and notation

* **MPUs.** The world is modeled as a network of MPUs; each MPU has an internal Hilbert space $H_0$ of dimension $d_0=8$ (Theorem 23).
* **ND–RID links.** Interactions between neighboring MPUs are governed by Non-Deterministic Reflexive Interaction Dynamics (ND–RID), information-limited channels with classical capacity $C_{\max} < \ln d_0$ (Theorem E.2).
* **PCE potential.** The global potential $V(x)$ balances operational/communication costs with predictive benefits (Definition D.1).
* **Parameters.** Fundamental inputs are \$(d\_0,\varepsilon,C\_{\max},K\_0,\chi,\eta)\$ and the lattice spacing \$\delta\$. The lattice spacing is related to the Planck length \$L\_P\$ by the fixed PU ratio \$\delta/L\_P=\sqrt{8\ln 2}\$ (as derived in Appendix Q).
* **Geometry.** We assume a $D=4$ hypercubic lattice with spacing $\delta$ and exponential clustering in the symmetric phase, consistent with the emergence of geometric regularity (Theorem 43).

### T.2.2 Modeling Ansatz for the Local Observable `mᵢ`

To construct a concrete and viable instance of the mechanism, we adopt a physically-motivated *ansatz* for the local observable that acquires a vacuum expectation value. This ansatz serves as a concrete existence proof that a viable order parameter with the correct quantum numbers can be constructed from MPU primitives, allowing us to derive its VEV. The general mechanism is expected to be robust for any such emergent scalar.

We choose an observable constructed from an $SU(2)_L$-triplet proxy with the quantum numbers needed to track electroweak breaking. For each MPU $i$, let $\rho_i$ be its stationary single-cycle output state. We define a set of Hermitian observables $\vec{M}_i=(M_x, M_y, M_z)$ on the MPU Hilbert space $H_0$ that transform as a triplet under the emergent $SU(2)_L$ gauge symmetry. A minimal construction, assuming the relevant subspace of $H_0 \cong \mathbb{C}^8$ carries appropriate representations of the emergent SM gauge group (Appendix G.8), involves defining $M_a$ using the generators of $SU(2)_L$ (e.g., Pauli matrices $\sigma_a$) replicated across the necessary components of $H_0$. Let $n_i$ be a unit vector in the internal $SU(2)$ space. We define the normalized score:
$$
s_i := {\rm Tr}\!\left[\rho_i \,(n_i\!\cdot\!\vec M_i)\right]/\mu_0,\qquad |s_i|\le 1,
$$
with normalization constant $\mu_0 := \max_{\rho, |n|=1} |\mathrm{Tr}[\rho (n\cdot \vec M)]|$. The final bounded, $\mathbb{Z}_2$-symmetric observable is:
$$
m_i := \tanh(\beta_0 s_i)\in[-1,1],\qquad n_i\to -n_i \Rightarrow m_i\to -m_i.
$$

### T.2.3 Identification with the Higgs Sector

This appendix must be understood in the context of the broader PU framework, specifically the emergence of the Standard Model gauge group (Appendix G.8). That derivation implies the existence of an electroweak symmetry-breaking mechanism, consistent with the SM Higgs mechanism. The mechanism detailed in this appendix provides the physical origin for that symmetry breaking and determines its scale. The full set of SM Yukawa couplings and the Higgs self-coupling are posited to emerge from the same substrate dynamics, representing a key program for future work.

The emergent scalar order parameter `φ` is therefore identified as a composite field that transforms as the neutral component of the SM Higgs doublet. The local observable components $m_{i,a}$, constructed from the $SU(2)_L$-triplet $\vec{M}_i$, serve as proxies for the components of the composite operator $H^\dagger\sigma_a H$, where $H$ is the Higgs doublet. A non-zero expectation value `⟨φ⟩` thus directly corresponds to the electroweak VEV, `v`.

In this substrate-first picture, the Higgs field is not a fundamental particle but an emergent, collective mode of the MPU network itself. The derivation in this appendix explains the origin and scale of its VEV—the core of the hierarchy problem. Operationally, we monitor the gauge-invariant scalar $\phi$ related to the coarse-grained average of $\vec{M}_i$, which corresponds to $H^\dagger H$ at leading order; in unitary gauge, this aligns with the neutral component of the Higgs doublet. The derivation of the full set of SM Yukawa couplings (which give rise to fermion masses, potentially via the mechanism in Appendix R) and the quartic Higgs self-coupling from this MPU substrate represents a major program for future theoretical work.

### T.2.4 Derivation of Emergent Ferromagnetic Correlations from PCE

The emergence of ferromagnetic correlations—the tendency for neighboring `m_i` observables to align—is not an ad-hoc assumption but a necessary consequence of the Principle of Compression Efficiency (PCE) under conditions where predictive specialization is advantageous. We demonstrate this by constructing a Landau-Ginzburg-style effective potential for the coarse-grained order parameter `φ = ⟨m_i⟩`, deriving its coefficients from the cost-benefit trade-offs inherent in the PU framework. We show that for a sufficiently large predictive utility of order, the symmetric state (`φ=0`) becomes unstable, leading to spontaneous symmetry breaking and, consequently, ferromagnetic correlations.

#### T.2.4.1 The PCE Potential as a Function of Macroscopic Order

Consider the MPU network in a stationary state. We define the macroscopic order parameter using the coarse-grained field $\vec{\phi}$ derived from the local observables $\vec{M}_i$. We take the macroscopic order parameter to be the **gauge-invariant scalar** $\phi$ defined by $\phi^2 := \langle \vec{\phi} \cdot \vec{\phi} \rangle$, where the average is over the MPU ensemble. At leading order, this corresponds to the SM operator $H^\dagger H$. All expansions below are in this gauge-invariant order parameter $\phi$. The total PCE Potential per unit volume, `V(φ)`, can be expressed as the difference between the resource cost of maintaining a state with order `φ` and the predictive benefit gained from that state:
$$
V(\phi) = V_{cost}(\phi) - V_{benefit}(\phi)
$$
We analyze the behavior of $V(\phi)$ for small $\phi$ by expanding the cost and benefit terms around the symmetric state $\phi=0$.

#### T.2.4.2 The Predictive Benefit of Specialization

The core of the argument lies in quantifying the predictive advantage of a symmetry-broken state. A network in the symmetric state ($\phi=0$) is a general-purpose predictor. A network in a broken-symmetry state ($\phi\ne 0$) has become *specialized*. If the environment being predicted has a corresponding regularity, the specialized network is a more efficient predictor.

This increased efficiency is modeled as an enhancement of the performance-efficiency parameter `κ_eff` from the Law of Prediction (Theorem 19). An ordered state is "pre-adapted" and can achieve higher predictive performance for the same computational effort. We model this dependence for small $\phi$ as:
$$
\kappa_{eff}(\phi) = \kappa_0 + \kappa_1 \phi^2 + O(\phi^4), \quad \text{with } \kappa_1 > 0
$$
where $\kappa_0$ is the efficiency in the symmetric state. The benefit term in the PCE potential is $V_{benefit} = \Gamma_0 \cdot PP$. The change in benefit due to order is $\Delta V_{benefit}(\phi) = V_{benefit}(\phi) - V_{benefit}(0)$. Using the Law of Prediction (Equation 22), and assuming the system operates at a fixed complexity $C$ to predict a target $C_{target}$:
$$
\Delta V_{benefit}(\phi) = \Gamma_0 \left[ \left(\beta - (\beta-\alpha)e^{-\kappa_{eff}(\phi) \frac{C-C_{op}}{C_{target}}}\right) - \left(\beta - (\beta-\alpha)e^{-\kappa_0 \frac{C-C_{op}}{C_{target}}}\right) \right]
$$
$$
\Delta V_{benefit}(\phi) = \Gamma_0 (\beta-\alpha) e^{-\kappa_0 \frac{C-C_{op}}{C_{target}}} \left[ 1 - e^{-\kappa_1 \phi^2 \frac{C-C_{op}}{C_{target}}} \right]
$$
For small $\phi$ (and thus small $x = \kappa_1 \phi^2 \frac{C-C_{op}}{C_{target}}$), we expand the second exponential: $1-e^{-x} \approx x$.
$$
\Delta V_{benefit}(\phi) \approx \Gamma_0 (\beta-\alpha) e^{-\kappa_0 \frac{C-C_{op}}{C_{target}}} \left[ \kappa_1 \frac{C-C_{op}}{C_{target}} \right] \phi^2
$$
 This is of the form $\Delta V_{benefit}(\phi) = k_b \phi^2$. To express the positive benefit coefficient $k_b$ in terms of the symmetric-state performance $PP_0$, we use the relations derived from the Law of Prediction (Equation 22): the performance gap is $(\beta-PP_0) = (\beta-\alpha)e^{-\kappa_0(C-C_{op})/C_{target}}$, and the normalized complexity is $(C-C_{op})/C_{target} = (1/\kappa_0) \ln((\beta-\alpha)/(\beta-PP_0))$. Substituting these into the expression above yields:
 $$
 k_b = \Gamma_0 (\beta - PP_0) \frac{\kappa_1}{\kappa_0} \ln\left(\frac{\beta-\alpha}{\beta-PP_0}\right).
 \tag{T.1}
 $$
The coefficient $k_b$ represents the marginal predictive utility of macroscopic order, depending on the fundamental bounds $\alpha, \beta$ and the efficiency gain $\kappa_1/\kappa_0$.

#### T.2.4.3 The Resource Cost of Order

Maintaining a coherent, macroscopically ordered state ($\phi\ne 0$) incurs resource costs beyond the symmetric state. This includes the complexity cost of specifying the order and the communication/propagation cost of enforcing coherence across the network against the decorrelating effects of ND-RID noise. This cost must be a positive, even function of $\phi$. For small $\phi$, the leading term is quadratic:
$$
\Delta V_{cost}(\phi) = V_{cost}(\phi) - V_{cost}(0) = k_c \phi^2 + O(\phi^4)
\tag{T.2}
$$
The cost coefficient $k_c > 0$ is a functional of the underlying MPU network parameters. It reflects the stiffness of the system against ordering and is related to the cost of maintaining phase coherence across ND-RID links, which scales with the irreducible cost $\varepsilon$.

#### T.2.4.4 The Condition for Spontaneous Symmetry Breaking

Combining the cost and benefit terms, the effective PCE potential near the symmetric state is:
$$
V(\phi) \approx V(0) + \Delta V_{cost}(\phi) - \Delta V_{benefit}(\phi) = V(0) + (k_c - k_b) \phi^2 + O(\phi^4)
$$
The symmetric state $\phi=0$ is a stable minimum of the potential if the quadratic term is positive, i.e., if $k_c > k_b$. However, if the predictive benefit of specialization is sufficiently large, the potential landscape changes.

**Theorem T.1 (Condition for Emergent Order).**
The symmetric state `φ=0` becomes unstable, leading to spontaneous symmetry breaking, if and only if the marginal predictive benefit of order exceeds the marginal resource cost of order:
$$
k_b > k_c
\tag{T.3}
$$
*Proof.* When `k_b > k_c`, the coefficient of the `φ²` term in the potential, `(k_c - k_b)`, becomes negative. The symmetric state `φ=0` is now a local maximum, and the potential is minimized at a non-zero value `φ = ±\sqrt{(k_b - k_c)/(2λ_{eff})}`, where `λ_{eff}` is the coefficient of the stabilizing `φ⁴` term. The system will dynamically evolve to one of these broken-symmetry ground states.

#### T.2.4.5 Conclusion: Emergence of Ferromagnetic Correlations

When the condition in Theorem T.1 is met, the system's ground state is one where the macroscopic average `⟨m_i⟩ = φ ≠ 0`. In such a state, the local expectation values are aligned with the global mean. For any two neighboring MPUs `i` and `j`, their correlation is given by:
$$
\text{Corr}(m_i, m_j) = \langle m_i m_j \rangle - \langle m_i \rangle \langle m_j \rangle
$$
In the broken-symmetry phase, `⟨m_i⟩ = ⟨m_j⟩ = φ`. The full expectation is `⟨m_i m_j⟩ = \text{Corr}(m_i, m_j) + φ²`. Because local interactions favor alignment to minimize local potential gradients (the microscopic origin of the cost `k_c`), the correlation term itself will be positive. Therefore, in the broken-symmetry phase:
$$
\langle m_i m_j \rangle > \phi^2 > 0
$$
This positive correlation between neighboring observables is the definition of an emergent ferromagnetic correlation. Thus, we have derived the necessary foundation for the subsequent RG analysis as a direct consequence of PCE-driven spontaneous symmetry breaking, contingent on the predictive benefit of specialization (`k_b`) exceeding the resource cost of maintaining order (`k_c`).

### T.2.5 Foundational Assumptions of the Model

This derivation rests on several foundational assumptions that are either derived from the broader PU framework or are specific, physically motivated modeling choices for this particular problem.

1. **Lattice structure.** The PCE-optimal equilibrium is modeled as a regular $D=4$ hypercubic lattice with spacing $\delta$, consistent with the framework's derivation of **Geometric Regularity (Theorem 43)**.
2. **Finite interaction range.** Microscopic interactions have a finite range, consistent with the **Lieb-Robinson bounds derived from ND-RID in Appendix F**, yielding exponential clustering in the symmetric phase.
3. **Stationary Gibbs ensemble.** The global PCE potential $V(x)$ is coercive, ensuring a stationary, translation-invariant Gibbs ensemble $d\mu(x) \propto e^{-\beta_G V(x)} dx$. This is consistent with the **stochastic dynamics on the PCE potential described in Appendix D**, which lead to a stationary distribution.
4. **Area-law dominance.** The inter-block propagation cost is dominated by boundary edges due to the locality of interactions on the emergent lattice. For any local interaction Hamiltonian on a lattice, the energy cost of enforcing a boundary condition between two blocks will scale with the area of that boundary, making the surface-to-volume term $|\partial B_\ell|/|B_\ell|\sim c_D/\ell$ a generic feature.
5. **PCE Benefit of Order.** The core physical hypothesis for this mechanism is that a specialized (ordered) MPU network has a higher predictive efficiency, leading to a net PCE benefit that can overcome the cost of ordering (`k_b > k_c`).
6. **Observable Ansatz.** The choice of the local observable `m_i` (Section T.2.2) is a specific, physically motivated *ansatz* designed to have the correct SM quantum numbers to serve as a proxy for the Higgs VEV. This is a modeling choice to demonstrate a concrete, viable instance of the mechanism.
7. **PCE-Driven Near-Criticality.** The numerical viability of the mechanism requires the system to operate in a regime where the bare bulk mass `m_b²` is small, i.e., near the ferromagnetic phase transition (`k_b ≈ k_c`). We posit that this is not a fine-tuning but a dynamically selected state. A system poised at criticality exhibits maximal susceptibility to external perturbations, making it an optimal sensor of its environment. PCE, by driving the system to solve the Prediction Optimization Problem, will favor configurations that maximize this predictive sensitivity, thus dynamically tuning the system to a near-critical state.

---

## T.3 Coarse-Grained Order Parameter and Large-Deviation Effective Potential

Let $B_\ell$ be a $D$-cube of linear size $\ell$, volume $|B_\ell|=\ell^D$, and define the coarse-grained order parameter:
$$
M_\ell := |B_\ell|^{-1}\sum_{i\in B_\ell} m_i.
$$
The effective potential at scale $\ell$ is $V_{\text{eff},\ell}(\phi)=\mathcal{C}_\ell(\phi)-\mathcal{I}_\ell(\phi)$, where $\phi$ is the constrained block average. The effective potential $V_{\text{eff},\ell}(\phi)$ should be understood as a coarse-grained description of the framework's global PCE Potential $V(x)$ (Definition D.1), obtained by integrating out all microscopic degrees of freedom within a block of size $\ell$ while holding the block-average order parameter $M_\ell$ fixed at the value $\phi$. The cost and benefit terms, $\mathcal{C}_\ell$ and $\mathcal{I}_\ell$, are therefore emergent statistical properties of the underlying potential $V(x)$.

### T.3.1 Benefit term (rate function)

The cumulant generating function per unit volume is
$$
\Lambda_\ell(\lambda) := |B_\ell|^{-1}\ln \mathbb{E}\!\left[\exp\!\left(\lambda\sum_{i\in B_\ell} m_i\right)\right]
= \tfrac{1}{2}\kappa_{2,\ell}\lambda^2 + \tfrac{1}{4!}\kappa_{4,\ell}\lambda^4 + O(\lambda^6),
\tag{T.4}
$$
with per-volume connected cumulants $\kappa_{n,\ell}$. The rate function (predictive benefit) is the Legendre transform of $\Lambda_\ell$:
$$
\mathcal{I}_\ell(\phi)=\sup_\lambda\{\lambda\phi-\Lambda_\ell(\lambda)\}
= \tfrac{1}{2}\frac{\phi^2}{\kappa_{2,\ell}} - \tfrac{1}{24}\frac{\kappa_{4,\ell}}{\kappa_{2,\ell}^4}\phi^4 + O(\phi^6).
\tag{T.5}
$$

### T.3.2 Cost term (constrained minimization)

With source $h$ conjugate to $\sum m_i$, the constrained cost splits into bulk and boundary contributions:
$$
\mathcal{C}_\ell(\phi) = A_0 + \Delta C_{\text{bulk}}(\phi) + \Delta C_{\partial}(\phi) + O(\phi^6,\ell^{-2})
= A_0 + A_2\phi^2 + A_4\phi^4 + \frac{B}{\ell}\phi^2 + O(\phi^6,\ell^{-2}).
\tag{T.6}
$$

---

## T.4 Effective Potential and Coefficients from MPU Cumulants

Combining the benefit (T.5) and cost (T.6) terms, the effective potential is:
$$
V_{{\rm eff},\ell}(\phi)
= \Big(A_2-\frac{1}{2\kappa_2}+\frac{B}{\ell}\Big)\phi^2
+ \Big(A_4+\frac{\kappa_4}{24\kappa_2^4}\Big)\phi^4 + O(\phi^6).
\tag{T.7}
$$
The quadratic and quartic coefficients are therefore:
$$
m_\ell^2 = 2\Big(A_2-\tfrac{1}{2\kappa_2}\Big) + \frac{2B}{\ell}
\equiv m_{\rm bulk}^2(\ell)+\frac{2B}{\ell},
\tag{T.8}
$$
$$
\lambda_\ell = 24\Big(A_4+\frac{\kappa_4}{24\kappa_2^4}\Big).
\tag{T.9}
$$
The macroscopic coefficients $A_2, A_4, B$ are formally derived as mixed cumulants of the order parameter and the relevant cost densities (bulk or boundary) via standard statistical response theory, reflecting the system's susceptibility to an external source. The key results are: $A_2=\tfrac12\Sigma_2/\kappa_2^2$, $A_4=\tfrac1{24}\Sigma_4/\kappa_2^4-\tfrac16\Sigma_2\kappa_4/\kappa_2^5$, and the crucial boundary coefficient $B = D\tau_2/\kappa_2^2$, where $\Sigma_n$ are mixed cumulants of $m_i$ and the bulk cost density, and $\tau_2$ is a mixed cumulant involving the boundary cost density.

**Physical Meaning:**
*   $\kappa_2$: Susceptibility of the order parameter `m`.
*   $\kappa_4$: Kurtosis of `m`.
*   $\Sigma_2, \Sigma_4$: Quantify the bulk cost backreaction on order.
*   $\tau_2$: Quantifies the cost of cross-boundary coherence under ND–RID.

---

## T.5 PU-Native RG: Block Recursion and One-Loop Flows

A Wilsonian step $\ell\to b\ell$ ($b>1$) integrates out fast modes [Wilson 1971]. The one-loop RG flow equations for the effective parameters are:
$$
\frac{d m_\ell^2}{d\ln\ell}=-\alpha_\ell\lambda_\ell-\frac{2B}{\ell}+O(\lambda_\ell^2,\ell^{-2}),
\tag{T.10}
$$
$$
\frac{d \lambda_\ell}{d\ln\ell}=-\gamma_\ell\lambda_\ell^2+O(\lambda_\ell^3),
\tag{T.11}
$$
with $\alpha_\ell>0$ and $\gamma_\ell>0$ given explicitly by shell integrals of the block-field propagator. Let $S_m(k)$ be the symmetric-phase spectral density of $m$,
$$
S_m(k)=\sum_r e^{-ik\cdot r} \langle m_0 m_r\rangle_c \simeq \frac{\beta_0^2 \varepsilon}{k_S-2J_{int}\sum_{\mu=1}^4\cos(k_\mu\delta)},
$$
and let $W_\ell(k)$ denote the normalized Fourier-space window of the $\ell$-block average. Then
$$
G_\ell(k):=|W_\ell(k)|^2 S_m(k),\qquad
\alpha_\ell=c_\alpha\int_{\rm shell}\frac{d^4k}{(2\pi)^4} G_\ell(k),\qquad
\gamma_\ell=c_\gamma\int_{\rm shell}\frac{d^4k}{(2\pi)^4} [G_\ell(k)]^2,
$$
which are manifestly positive, with $c_\alpha, c_\gamma$ being $\mathcal{O}(1)$ combinatorial factors from the loop expansion. In $D=4$, $\lambda_\ell$ is marginally irrelevant, so it varies only logarithmically and the bulk mass exhibits an approximately constant negative drift:
$$
\frac{d m_{\rm bulk}^2}{d\ln\ell}\approx -\beta_2,\qquad \beta_2 := \overline{\alpha_\ell\lambda_\ell}>0,
\tag{T.12}
$$
where $\overline{f}:=\Delta^{-1}\int_{\ln\ell_0}^{\ln\ell_0+\Delta} f(\ell) d\ln\ell$. For later estimates it is convenient to write $\alpha_\ell\simeq c_W$ with
$$
c_W:=\frac{3}{16\pi^2}\,\mathcal{Z},\qquad \mathcal{Z}:=\frac{\int_{\rm shell} d^4k\,G_\ell(k)}{\int_{\rm shell} d^4k}\in[0.5,1.5],
$$
so that $\beta_2\simeq c_W \overline{\lambda_\ell}$. **Example (numerical):** taking the Litim regulator gives $\mathcal Z\!\approx\!1\Rightarrow c_W=\tfrac{3}{16\pi^2}\approx 1.90\times 10^{-2}$ [Litim 2001]. For a representative average $\overline{\lambda_\ell}=0.25$ over $\ell\in[1,10^{17}]$,
$$
\beta_2\approx 4.8\times 10^{-3},\qquad \Delta m^2\equiv -\beta_2\ln\ell\big|_{1}^{10^{17}}\approx -\,0.0048\times 39.1\approx -\,0.19.
$$
Integrating from a microscopic reference scale (e.g., $\ell=1$) gives the scale‑dependent effective mass:
$$
m_\ell^2\approx m_{\rm bulk}^2(1)-\beta_2\ln\ell+\frac{2B}{\ell}.
\tag{T.13}
$$
Thus a modest $m_{\rm bulk}^2(1)=O(0.1\text{–}1)$ naturally yields $m_{\rm EW}\ll M_{\rm UV}$ once the negative drift dominates the decaying boundary term.

---

## T.6 Why the Bulk Mass Runs Negative

Two mechanisms ensure $m_{\rm bulk}^2(\ell)$ becomes negative at large $\ell$:

1. **One-loop negativity.** From (T.12), the loop term $-\beta_2$ is strictly negative for a stable quartic coupling ($\lambda_\ell>0$). This is a universal feature of the RG flow for such theories.
2. **Monotone susceptibility.** The bulk mass is $m_{\rm bulk}^2(\ell)=2[A_2(\ell)-1/(2\kappa_2(\ell))]$. The emergent ferromagnetic structure (derived in T.2.4) allows for Griffiths/FKG-type inequalities [Griffiths 1967; Fortuin, Kasteleyn & Ginibre 1971], which provide a strong physical argument that the block susceptibility $\kappa_2(\ell)$ (a measure of correlated fluctuations) is non-decreasing in the block size $\ell$. If the cost coefficient $A_2(\ell)$ decreases with scale due to bulk cost renormalization, then together with the one‑loop negativity (T.12) the combination $m_{\rm bulk}^2(\ell)=2A_2(\ell)-1/\kappa_2(\ell)$ decreases and turns negative at large $\ell$; by contrast, growth of $\kappa_2$ alone would increase $m_{\rm bulk}^2$ for fixed $A_2$. This monotonicity uses positive association (FKG/attractiveness) of the symmetric-phase Gibbs measure induced by the ND–RID penalties with $J_{int}>0$ ferromagnetic couplings.

At small scales, the boundary term $2B/\ell$ is large and positive, keeping $m_\ell^2>0$. As $\ell$ grows, this geometric term dilutes, and the negative bulk drift dominates, guaranteeing a zero-crossing at some finite critical scale $\ell^*$.

---

## T.7 Critical Scale, VEV, and the Hierarchy

The critical scale $\ell^*$ is defined by the condition $m_{\ell^*}^2=0$. Setting the expression in (T.13) to zero with $m_b^2:=m_{\rm bulk}^2(1)$ gives:
$$
0=m_b^2-\beta_2\ln\ell^*+\frac{2B}{\ell^*}.
\tag{T.14}
$$
The exact solution for $\ell^*$ is given in terms of the principal branch of the Lambert–$W$ function [Corless et al. 1996]: $\ell^*=\frac{2B/\beta_2}{W_0((2B/\beta_2)e^{-m_b^2/\beta_2})}$. For a large hierarchy ($\ell^* \gg 1$), the boundary term is sub-dominant at the critical scale, and the leading-log approximation is excellent:
$$
\ell^*\simeq \exp\!\left(\frac{m_b^2}{\beta_2}\right).
\tag{T.15}
$$
The generated electroweak scale is inversely proportional to this emergent physical length scale:
$$
v=\frac{\zeta}{\ell^*\delta},\qquad \zeta=O(1).
\tag{T.16}
$$
Using the PU framework's fixed ratio $\delta/L_P=\sqrt{8\ln 2}$, we can express the hierarchy relative to the Planck scale $M_{Pl} = 1/L_P$:
$$
\frac{v}{M_{Pl}} \simeq \left[\frac{\zeta}{\sqrt{8\ln 2}}\right]\exp\!\left(-\frac{m_b^2}{\beta_2}\right).
\tag{T.17}
$$
A moderate ratio of microscopic parameters, $m_b^2/\beta_2 \approx 38$, naturally generates the observed hierarchy of $\approx 10^{17}$. This mechanism is formalized by the **PCE Suppression Theorem**:

**Theorem T.2 (PCE Suppression of the Electroweak Scale).**
Let the predictive effective functional for the order parameter be $\mathcal J[\phi] = \int (\mathcal P - \lambda \mathcal R) d\ln\mu$, where $\mathcal{P}$ is the predictive benefit and $\mathcal{R}$ is the resource cost. The PCE stationary condition is $\partial_\mu\mathcal P = \lambda\,\partial_\mu\mathcal R$. If non-equilibrium effects or sub-leading terms introduce a small, PU-computable deviation from stationarity, $\delta(\mu) = \partial_\mu\mathcal P - \lambda\,\partial_\mu\mathcal R \neq 0$, then the electroweak scale $v$ is exponentially suppressed relative to the Planck scale $M_{Pl}$:
$$
\boxed{\ \frac{v}{M_{\rm Pl}}\;=\;\exp\!\bigl(-\Xi_\*\bigr)\,,\quad \text{where} \quad \Xi_\*\;\equiv\;\frac{1}{\lambda}\int_{\ln v}^{\ln M_{\rm Pl}}\!\vartheta\bigl(\mu,\phi_\*(\mu)\bigr)\ d\ln\mu\ }
$$
with $\vartheta(\mu,\phi) = (\partial_\mu\mathcal P)/(\partial_\mu\mathcal R)$ the marginal tradeoff density. This theorem provides the formal justification for the exponential hierarchy emerging from the PCE-driven RG flow.

---

## T.8 A Computable Program from PU Primitives

This section provides the explicit, computable formulas linking the macroscopic parameters of the effective potential to the microscopic parameters of the PU substrate. This transforms the conceptual framework into a quantitative, predictive theory.

### T.8.1 Conventions and Microscopic Model

In this section, we work in **lattice units** where the microscopic spacing `δ=1`, so all lengths are dimensionless multiples of `δ`.

*   **Substrate:** $D=4$ hypercubic lattice.
*   **Observable:** $m_i = \tanh(\beta_0 s_i)$ where $s_i = \mathrm{Tr}[\rho_i (n_i \cdot M)]$.
*   **PCE Potential Model:** We use a minimal model for the PCE potential density that captures the essential physics. The bulk cost is modeled by the negentropy of the local state, `c_bulk(ρ) = k_S [S_* - S(ρ)]`, which penalizes ordered (low-entropy) states. The interaction term favors alignment of neighboring observables, `v_int = -J_int ∑_{<ij>} s_i s_j`. The system is analyzed in the symmetric phase (`k_S > 2DJ_int`).

### T.8.2 Part I: Microscopic Cumulants (`ℓ=1`)

1.  **Bare Susceptibility `κ₂`:**
    The quadratic approximation of the PCE potential is `V_quad ≈ ∑_i (k_S/2)s_i² - J_int ∑_{<ij>} s_i s_j`. The corresponding Gaussian covariance in momentum space is `G_s(k) = ε / [k_S - 2J_int ∑_μ cos(k_μ δ)]`. To leading order `m_i ≈ β₀ s_i`, the zero-momentum susceptibility is:
    $$
    \kappa_2 := \sum_j \langle m_0 m_j \rangle_c = \beta_0^2 G_s(k=0) = \frac{\beta_0^2 \varepsilon}{k_S - 2DJ_{int}}
    $$

2.  **Bare Bulk Cost Coefficient `A₂`:**
    By definition, `A₂ = (1/2κ₂²) ∑_{j,k} ⟨c_bulk(0) m_j m_k⟩_c`. Using `c_bulk(0) ≈ (k_S/2)s_0²` and Gaussian Wick calculus (`Cov(s_0², s_j s_k) = 2⟨s_0 s_j⟩⟨s_0 s_k⟩`), we find:
    $$
    A_2 = \frac{k_S}{2\beta_0^2}
    $$

3.  **Bare Bulk Mass `m_b²`:**
    The bare bulk mass (excluding the geometric boundary term) is `m_b² := m_bulk²(1) = 2(A₂ - 1/(2κ₂))`. Substituting the expressions for `A₂` and `κ₂`:
    $$
    m_b^2 = \frac{k_S}{\beta_0^2} - \frac{1}{\kappa_2} = \frac{1}{\beta_0^2} \left[ k_S - \frac{k_S - 2DJ_{int}}{\varepsilon} \right]
    $$

4.  **Bare Boundary Cost Coefficient B:**
    The alignment interaction $v_{\rm int}$ generates a gradient stiffness. Expanding the lattice coupling to quadratic order yields the continuum elastic energy
   $$
   E_{\rm grad}\simeq \frac{J_{int}\,\delta^2}{2\,\varepsilon\,\beta_0^2}\int d^4x\,(\nabla m)^2.
   $$
   Imposing a small mismatch $\Delta\phi$ between adjacent $\ell$-blocks and minimizing in the boundary layer gives an inter-block penalty proportional to area/volume, i.e. $(B/\ell)(\Delta\phi)^2$. In the cumulant language this is $B=\tfrac{D\,\tau_2}{\kappa_2^2}$. For the present elastic approximation one finds
   $$
   B=\frac{c_B\,J_{int}}{\varepsilon\,\beta_0^2},
   $$
 where $c_B=O(1)$ encodes the interface profile and the $2D$ faces of the hypercube.

### T.8.3 Part II: PU-Native RG Flow

The one-loop RG flow for the bulk mass is `d m_bulk²/d(ln ℓ) = -β₂`, where `β₂ = α_ℓ λ_ℓ`.
*   **Quartic Coupling $\bar{\lambda}$:** The quartic that enters the one-loop tadpole is the block-rescaled coefficient
$$
\bar{\lambda}\equiv\widehat{\lambda}_\ell\simeq 24\Big[A_4+\frac{\kappa_4}{24\,\kappa_2^4}\Big]\xi^4,
$$
evaluated at the symmetric point and treated as slowly varying across the flow window. Here $A_4\simeq k_S/(12\beta_0^4)$ comes from the negentropy expansion of the bulk cost, $\kappa_4<0$ is the fourth connected cumulant of $m$ in the symmetric ensemble (for $m=\tanh(\beta_0 s)$ it partially cancels $A_4$), and $\xi^4$ encodes the normalization of the block zero-mode induced by the window $W_\ell(k)$ (for the standard cubic block $\xi=O(1)$). It is convenient to parameterize the net result as
$$
\bar{\lambda}=c_\lambda\,\frac{k_S}{\beta_0^4},\qquad c_\lambda\in[0.03,0.2],
$$
with $c_\lambda$ determined by $(\kappa_2,\kappa_4)$ and the block filter. The numerical example below uses $c_\lambda\simeq 0.10$.

Drift Coefficient $\beta_2$: With
$$
\alpha_\ell=3!\int_{\rm shell}\frac{d^4k}{(2\pi)^4}G_\ell(k)\equiv c_W,
$$
one has
$$
\beta_2=\overline{\alpha_\ell\lambda_\ell}\simeq c_W\,\bar{\lambda},\qquad
c_W=\frac{3}{16\pi^2}\,\mathcal{Z},\quad \mathcal{Z}\in[0.5,1.5],
$$
so a representative value is $c_W\simeq 0.019$ for the standard cubic block. Hence $\beta_2\simeq 0.019\times\bar{\lambda}$.

### T.8.4 Part III: Critical Scale and Hierarchy

1.  **The Hierarchy Exponent:** The exponent in the hierarchy equation `ℓ* ≈ exp(m_b²/β₂)` is now fully expressed in terms of microscopic PU parameters:
    $$
    \frac{m_b^2}{\beta_2} \approx \frac{\frac{1}{\beta_0^2} \left[ k_S(1 - 1/\varepsilon) + \frac{2DJ_{int}}{\varepsilon} \right]}{c_W \bar{\lambda}}
    $$

2.  **Numerical Example:** We choose physically motivated, `O(1)` dimensionless parameters, with `J_int` chosen to satisfy the PCE-derived near-criticality condition (Assumption 7):
    *   `ε = ln(2) ≈ 0.693` (from PU first principles)
    *   `D = 4` (from PU first principles, Appendix G.8)
    *   `β₀ = 1`, `k_S = 1` (sets the local energy/information scale)
    *   `J_int = 0.044` (satisfies the PCE-derived near-criticality condition `m_b² << 1`)
    *   `λ̄ ≈ 0.10` (from negentropy plus small corrections)
    *   `c_W ≈ 0.019` (geometric lattice factor)

    Plugging these values in:
    *   `m_b² ≈ (1/1²) [1(1 - 1/0.693) + (8/0.693)×0.044] ≈ -0.442 + 0.508 = 0.066`
    *   `β₂ ≈ 0.019 × 0.10 = 0.0019`
    *   **Hierarchy Exponent:** `m_b²/β₂ ≈ 0.066 / 0.0019 ≈ 35`

3.  **Final Result:**
    The emergent VEV is `v ≈ ζ / (ℓ* δ)`. The hierarchy is:
    $$
    \frac{v}{M_{Pl}} \approx \frac{\zeta}{\sqrt{8\ln 2}} \frac{1}{\ell^*} \approx \frac{\zeta}{\sqrt{8\ln 2}} \exp\left(-\frac{m_b^2}{\beta_2}\right) \approx (0.4) \times e^{-35} \approx 10^{-16}
    $$
    This result matches the observed hierarchy `v/M_{Pl} ≈ 10^{-17}` with `O(1)` inputs, demonstrating the mechanism's viability without fine-tuning.

---

## T.9 Falsifiable Signature of the Mechanism

The boundary coefficient $B$ is sensitive to the cost of inter-MPU communication, which is inversely related to the ND–RID channel capacity $C_{\max}$. Increasing $C_{\max}$ reduces boundary penalties, lowering $B$. If, in addition, the bulk ordering cost $A_2(C_{\max})$ decreases with $C_{\max}$ (reflecting cheaper coordination), then $m_b^2=2A_2-1/\kappa_2$ decreases despite the typical increase of $\kappa_2$; growth of $\kappa_2$ alone would raise $m_b^2$ at fixed $A_2$. Under these conditions, both effects decrease the critical scale $\ell^\*$ and therefore increase the VEV $v$:

$$
\boxed{\ \frac{\partial \ln v}{\partial \ln C_{\max}}>0\ }.
\tag{T.18}
$$
This provides a unique, directional prediction linking the electroweak scale to the fundamental information-theoretic capacity of the PU substrate.

---

## T.10 Relation to Existing Mechanisms

**Theorem T.CW.1 (Radiative symmetry breaking from a scale-free UV).** Suppose the PU tie-breaker selects a scale-free UV Higgs sector $V_{\rm tree}=\lambda(H^\dagger H)^2$ and the running satisfies $\lambda(\mu_0)>0$ while $\lambda(\mu_1)+\tfrac14\beta_\lambda(\mu_1)<0$ for some $\mu_0<\mu_1$. Then there exists $\mu_\ast\in(\mu_0,\mu_1)$ where the RG‑improved potential develops a nontrivial minimum. With the RG-improved choice of scale $\mu\approx|H|$, the extremum occurs at $|H|\approx\mu_\ast$ where $\lambda(\mu_\ast)+\tfrac14\beta_\lambda(\mu_\ast)=0$ [Coleman & Weinberg 1973; Gildener & Weinberg 1976; Buttazzo et al. 2013]. *Remark:* In the minimal SM, central RG data do not realize the observed scale without additional dynamics; the statement is existence‑level and model‑agnostic.
* **Technicolor/Composite Higgs.** While the Higgs is emergent and composite in this model, no new confining gauge sector is invoked. The scale emerges from PCE tradeoffs within the fundamental MPU substrate itself, not from the dynamics of a new strong force.
* **Supersymmetry.** No superpartners are required. The stability of the hierarchy (protection of the small electroweak scale from large quantum corrections) follows from the robust properties of the RG flow, specifically the monotone growth of susceptibility and the geometric dilution of the area-law term, which naturally produce an exponentially large scale separation.

---

## T.11 Conclusion

The electroweak scale emerges from a geometric competition between an area-law boundary cost that stabilizes the symmetric vacuum and a logarithmically destabilizing bulk drift that favors symmetry breaking. The Renormalization Group flow ensures a zero-crossing of the effective mass at a finite critical scale $\ell^*$, which is exponentially large due to the logarithmic nature of the running. All coefficients in the effective potential are, in principle, computable as functionals of the underlying MPU network's statistical properties, tying the electroweak/Planck hierarchy directly to microscopic information-processing constraints. The specific construction of the local observable `m_i` serves as a successful existence proof for a viable order parameter, and the general mechanism is expected to be robust to other choices of observables with similar symmetry properties. The mechanism yields a unique, falsifiable directional prediction linking the electroweak scale $v$ to the ND–RID channel capacity $C_{\max}$ and is conceptually distinct from existing proposals for solving the hierarchy problem.