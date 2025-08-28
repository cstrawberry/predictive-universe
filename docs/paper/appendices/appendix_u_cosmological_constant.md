# Appendix U: First-Principles Derivation of the Cosmological Constant

The cosmological constant $\Lambda$ is derived from non-perturbative fluctuations of the Predictive Universe (PU) vacuum modeled as the late-time equilibrium of a network of Minimal Predictive Units (MPUs). The vacuum is governed by the Principle of Compression Efficiency (PCE) and exhibits rare Euclidean “bounce” (instanton) trajectories in an information-theoretic action. PCE fixes the ratio of channel capacity to irreducible step cost to a PU-internal value $C_{\max}/\varepsilon=2$ (rigorously derived in Appendix Q, with $d_0=8$ and $\varepsilon=\ln 2$), and the instanton action scales with a geometric-information **complexity** $\kappa$ that counts correlated MPU involvement along the bounce. In Planck units built from the late-time coupling $G_\infty$, the vacuum energy takes the dilute-gas form
$$
\Lambda L_P^2 \simeq 8\pi\,A_{\rm eff}\,e^{-2\kappa},
$$
where $A_{\rm eff}$ (defined in Equation U.12) is an order-unity prefactor that includes one-loop determinants and the polynomial extensivity factor of Appendix E. Using $\Lambda L_P^2 \approx 2.87\times10^{-122}$ yields a natural $\kappa\approx 141.5$ for $A_{\rm eff}\sim 1$. The late-time equation of state approaches $w=-1$ up to $O(N_{\rm eff}^{-1})$ corrections.

## U.1 Introduction

**Theorem U.1 (Holographic/black‑hole energy bound).** Requiring that a region of size $L$ not collapse into a black hole imposes $E\le \tfrac{c^4}{2G}L$. Hence the mean energy density obeys
$$
\rho(L)\ \le\ \frac{3c^4}{8\pi G}\,\frac{1}{L^2},\qquad
|\Lambda(L)|\ \le\ \frac{3c^2}{L^2}.
$$
In de Sitter equilibrium, this saturates with $L\sim H^{-1}$, giving $|\Lambda|\sim 3H^2$ [Cohen–Kaplan–Nelson 1999; Li 2004; Bekenstein 1981]. The observed $\Lambda L_P^2\sim10^{-122}$ thus challenges naïve quantum‑field estimates of vacuum energy. Within PU, $\Lambda$ is emergent: it arises from information-theoretic constraints on an MPU network tuned by PCE and driven by non-deterministic, resource-bounded dynamics (ND-RID). This appendix develops a non-perturbative mechanism for $\Lambda$ based on instanton suppression in a Euclidean **information action**, with scales anchored by the MPU budget $\ln(d_0)$, the irreducible step cost $\varepsilon=\ln 2$, and the PCE-optimal capacity $C_{\max}$ (Appendix Q).

Natural units $(\hbar=c=k_B=1)$ are used. $G$ denotes the **late-time** gravitational coupling $G_\infty$ relevant to the vacuum sector (Appendix K.9). Accordingly, $L_P^2=G_\infty$.

## U.2 PU Vacuum as a Statistical Ensemble

PCE provides a coarse-grained potential $\mathcal{V}[x]$ (a **rate**, Appendix D) minimized at a vacuum configuration $x_{\rm vac}$. ND-RID introduces intrinsic stochasticity with per-step cost $\varepsilon=\ln 2$ (Theorem 31), leading to fluctuations about $x_{\rm vac}$.

### U.2.1 Euclidean Information Action and Partition Function

We introduce **dimensionless** Euclidean information coordinates $y$ that count MPU ticks and coarse spatial cells. The statistical mechanics of the PU vacuum are governed by a core physical hypothesis: the probability weight for a configuration is determined by an effective Euclidean Information Action where the irreducible cost $\varepsilon$ sets the fundamental scale of statistical fluctuation. This is formalized by the following large-deviation principle.

**Proposition U.1 (Exponential Suppression from Large Deviations).**
Let the vacuum partition function be built from a sum over configurations weighted by a cost functional. If this cost functional satisfies the conditions for a Large Deviation Principle (LDP) (e.g., via the Gärtner–Ellis theorem for mixing processes), the probability of rare, coherent fluctuations (instantons) is exponentially suppressed. For a cost functional whose scale is set by an action $S_{\rm inst}$, the probability scales as $P \sim e^{-S_{\rm inst}}$.

*Verification (independent‑block toy model).* Take $m_i\in\{0,1\}$ i.i.d. with $\mathbb P\{m_i=1\}=p(S_{\rm inst}):=\frac{e^{-S_{\rm inst}}}{1+e^{-S_{\rm inst}}}$. The scaled cumulant generating function $\Lambda(t)=\log\big(1-p+pe^{t}\big)$ is smooth, so by Cramér's theorem the LDP holds. The induced vacuum energy density scales as the probability of a single fluctuation, which is proportional to $e^{-S_{\rm inst}}$. This matches the expected instanton scaling.

We define a **dimensionless** potential $V[x]:=\tau_{\rm MPU}\,\mathcal{V}[x]/\varepsilon$ using the MPU tick $\tau_{\rm MPU}$. With a positive semi-definite metric $\mathcal{G}_{ij}$ on configuration space, the action is
$$
S_E[x]\;=\;\frac{1}{\varepsilon}\int d^4 y\;\bigg[\;\tfrac12\,\mathcal{G}_{ij}(x)\,\partial_\mu x^i\,\partial_\mu x^j\;+\;V[x]-V[x_{\mathrm{vac}}]\;\bigg],
\tag{U.1}
$$
which is dimensionless by construction. The vacuum partition function and Gibbs weight are
$$
Z\;=\;\int \mathcal{D}x\;\exp\!\big(-S_E[x]\big),\qquad
\langle \mathcal{O}\rangle\;=\;\frac{1}{Z}\int \mathcal{D}x\;\mathcal{O}[x]\,e^{-S_E[x]}.
\tag{U.2}
$$
Subtracting $V[x_{\rm vac}]$ ensures finite action for vacuum-to-vacuum trajectories.

## U.3 Minimal Effective Instanton Model

Consider a coarse reaction coordinate $q(\tau)$ along Euclidean time $\tau$, embedded in $x(\tau,\mathbf{y})$. A one-dimensional reduction yields
$$
S_E[q]\;=\;\frac{1}{\varepsilon}\int_{-\infty}^{+\infty} d\tau\;\Big[\tfrac12\,M(q)\,\dot q^{\,2}\;+\;V_{\mathrm{eff}}(q)-V_{\mathrm{eff}}(q_{\mathrm{vac}})\Big],
\tag{U.3}
$$
with equation of motion
$$
M(q)\,\ddot q\;+\;\tfrac12\,M'(q)\,\dot q^{\,2}\;=\; \frac{d V_{\mathrm{eff}}}{dq}.
\tag{U.4}
$$
In the **minimal** model we take $M(q)\equiv M$ constant, in which case $ \frac{d}{d\tau}(M\dot q)=V'_{\rm eff}(q)$. Bounce solutions satisfy $q(\pm\infty)=q_{\rm vac}$, $\dot q(\pm\infty)=0$ and have finite action; a **dilute instanton gas** applies when $e^{-S_{\rm inst}}\ll 1$ so events are well-separated [Coleman 1977; Callan & Coleman 1977; Coleman 1985].

## U.4 Instanton Action and Complexity

MPU dynamics allow a micro-counting of bounce cost. Let $N_{\mathrm{corr}}(\tau)$ be the instantaneous number of **correlated MPUs** along the reaction path. We adopt the following **operational definition**: for a fixed mutual-information threshold $\theta\in(0,\ln d_0)$,
$$
N_{\mathrm{corr}}(\tau)\;:=\;\#\Big\{i\in \text{MPUs}\ \big|\ I\big(M_i;q(\tau)\,\big|\,\text{local\,context}\big)\ge \theta\Big\},
$$
and define the **complexity**
$$
\kappa\;:=\;\int d\tau\,\overline{N}_{\mathrm{corr}}(\tau),
\tag{U.5}
$$
where the bar denotes coarse-graining over sub-tick fluctuations; $\tau$ is measured in **MPU ticks** and is therefore dimensionless. We now introduce a second core hypothesis for this calculation, a PCE-motivated scaling ansatz for the instanton action. We posit that the total information-theoretic cost of a coherent fluctuation scales linearly with its complexity $\kappa$ and with the information cost per unit, which is naturally identified with the ratio of the channel capacity $C_{max}$ to the irreducible step cost $\varepsilon$. Under **stationary PCE allocation** and **additivity of per-step costs**, the on-shell instanton action is modeled as:
$$
S_{\mathrm{inst}}\;=\;\Big(\frac{C_{\max}}{\varepsilon}\Big)\,\kappa\;+\;O(1),
\tag{U.6}
$$
where the $O(1)$ term collects path-independent overheads (its contribution is absorbed into the prefactor below). Here $C_{\max}\equiv C_{\max}^{\ast}$.

## U.5 PCE Fixes the Information Ratio

PCE allocates the MPU budget $\ln(d_0)$ between irreducible self-referential processing and external predictive capacity. With $d_0=8$ (Theorem 23) and $\varepsilon=\ln 2$ (Theorem 31, rigorously derived in Appendix J),
$$
C_{\max}^{\ast} \;=\; \ln(d_0)\;-\;\varepsilon \;=\; 3\ln 2 - \ln 2 = 2\ln 2,
\tag{U.7}
$$
as rigorously derived in Appendix Q. This yields the fixed ratio:
$$
\frac{C_{\max}^{\ast}}{\varepsilon}\;=\;\frac{2\ln 2}{\ln 2} = 2.
\tag{U.8}
$$
Absorbing the $O(1)$ term in Equation (U.6) into the prefactor (Section U.6), we have
$$
S_{\mathrm{inst}}\;=\;2\,\kappa.
\tag{U.9}
$$

## U.6 Prefactor, Extensivity, and Vacuum Energy Density

The vacuum energy density $\rho_{\Lambda}$ in the dilute instanton gas approximation is proportional to the density of instanton events. This density is given by the product of the exponential suppression factor $e^{-S_{\rm inst}}$ and a prefactor that accounts for quantum fluctuations around the classical path.
$$
\rho_{\Lambda} = K \cdot e^{-S_{\rm inst}}
\tag{U.10}
$$
The prefactor $K$ is calculated from the path integral as the ratio of determinants of the fluctuation operator around the instanton solution ($\mathcal{O}_{\rm inst}$) and the vacuum solution ($\mathcal{O}_{\rm vac}$), along with zero-mode normalization factors [Coleman 1985]:
$$
K = C_K \left( \frac{\det \mathcal{O}_{\rm vac}}{\det' \mathcal{O}_{\rm inst}} \right)^{1/2}
\tag{U.11}
$$
where $C_K$ includes Jacobian factors and zero-mode integration volumes, and $\det'$ indicates the omission of zero eigenvalues. For a minimal bounce in dimensionless MPU units, this determinant ratio is an $\mathcal{O}(1)$ constant.

The PU framework introduces an additional factor related to the extensivity of the underlying network. As derived in Appendix E, the total number of effective degrees of freedom scales polynomially with the system size. This contributes a polynomial extensivity factor, $N_{\rm eff}$, to the overall amplitude. We combine these factors into a single, dimensionless, $\mathcal{O}(1)$ prefactor $A_{\rm eff}$:
$$
A_{\rm eff} := K \cdot N_{\rm eff}
\tag{U.12}
$$
The final expression for the vacuum energy density, expressed in Planck units, is therefore:
$$
\rho_{\Lambda} = \frac{A_{\rm eff}}{L_P^4} e^{-S_{\rm inst}}
$$
Using the relation $\rho_{\Lambda} = \Lambda/(8\pi G) = \Lambda L_P^2 / (8\pi L_P^4)$, we obtain the dimensionless form:
$$
\Lambda L_P^2 = 8\pi A_{\rm eff} e^{-S_{\rm inst}}
\tag{U.13}
$$

## U.7 Numerical Consistency

**Proposition U.2 (Correlation-controlled suppression of Λ).**
Let $\{X_i\}_{i=1}^N$ be stationary, mean‑zero predictive‑correlation increments on horizon‑scale cells with **exponential α‑mixing** and cumulant generating function $\Lambda_X(t)=\lim_{n\to\infty}\tfrac{1}{n}\ln\mathbb{E}\big[e^{t\sum_{i=1}^n X_i}\big]$ existing in a neighborhood of $t=-2$. If $\Lambda_X(-2)<0$, then
\[
\Lambda_{\rm PU}\,L_P^2=8\pi A_{\rm eff}\,\exp\!\big(N\,\Lambda_X(-2)\big)
=8\pi A_{\rm eff}\,e^{-2\kappa_{\rm eff}},\quad
\kappa_{\rm eff}\equiv-\tfrac{N}{2}\Lambda_X(-2)>0.
\]
*Proof sketch.* Exponential mixing ensures a large‑deviation principle via the Gärtner–Ellis theorem with rate function given by the Legendre–Fenchel transform of $\Lambda_X$. The evaluation at $t=-2$ is fixed by the PCE-optimal information ratio $C_{\max}/\varepsilon=2$ (Equation U.8), which sets the scale of the non-perturbative action. Evaluating the moment generating function at this point yields the stated suppression.

Given $\Lambda L_P^2 \approx 2.87\times10^{-122}$ (see **Appendix V** for a precise inversion using Planck-2018 central values), we can solve for the effective complexity:
$$
\kappa\;=\;-\tfrac12\,\ln\!\left(\frac{\Lambda L_P^2}{8\pi A_{\rm eff}}\right).
\tag{U.14}
$$
For a range of plausible order-unity values for the prefactor $A_{\rm eff}$, this yields:
*   $A_{\rm eff}=0.5 \Rightarrow \kappa\simeq141.2$
*   $A_{\rm eff}=1.0 \Rightarrow \kappa\simeq141.5$
*   $A_{\rm eff}=2.0 \Rightarrow \kappa\simeq141.9$

The success of this model lies not in deriving the specific number $\kappa \approx 142$, but in demonstrating that a plausible, $\mathcal{O}(100)$ complexity can naturally explain the observed $\mathcal{O}(10^{122})$ suppression without fine-tuning. This value for $\kappa$ is expressible in terms of the underlying MPU network's statistical properties via
$$
\kappa \;=\; -\frac{N}{2}\,\Lambda_X(-2)\quad(>0),
$$
where $N$ is the number of effective predictive units and $\Lambda_X(-2)$ is the value of the cumulant generating function. For example, with $N=64$ predictive units one has $\Lambda_X(-2)\simeq-4.42$ at $\kappa\simeq141.5$, while $N=128$ gives $\Lambda_X(-2)\simeq-2.21$. This places the **per-unit action/cost** in the $\mathcal O(1-10)$ range, consistent with the PU framework's ND-RID cost scales.

## U.8 Relation to Late-Time Equation of State

Equation (U.13) shows the **multiplicative** combination of the polynomial extensivity factor (contained in $A_{\rm eff}$) with the non-perturbative exponential. For late times the exponential dominates the magnitude, while $A_{\rm eff}$ refines it.

Because the instanton contribution is vacuum-to-vacuum, it behaves as an effective constant in the action. Varying the action with respect to $g_{\mu\nu}$ gives $T_{\mu\nu}=-\rho_\Lambda\,g_{\mu\nu}$, hence
$$
w \;=\; \frac{\langle P\rangle}{\langle \rho\rangle} \;=\; -1\;+\;O\!\big(N_{\mathrm{eff}}^{-1}\big).
\tag{U.15}
$$
[Weinberg 1989; Carroll 2001].

## U.9 Scope and Validity of the Dilute Gas Approximation

The prefactor $A_{\rm eff}$ arises from Gaussian fluctuations around the bounce and zero-mode volumes [Callan & Coleman 1977; Dunne 2008]. For a minimal bounce in MPU units, $A_{\rm eff}=O(1)$. The dilute-gas regime is exceptionally accurate because $e^{-S_{\rm inst}}=e^{-2\kappa}$ is astronomically small for $\kappa\sim 10^2$ [Coleman 1977; Coleman 1985]. The analysis concerns the **late-time vacuum** defined by $G_\infty$; epochal dynamics with $G_{\mathrm{eff}}(t)$ are treated in Appendix K.9.

## U.10 Conclusion

A Euclidean information-action framework for the PU vacuum yields an exponentially suppressed, non-perturbative contribution to $\Lambda$ from instantons. PCE fixes $C_{\max}/\varepsilon=2$ (Appendix Q), giving $S_{\rm inst}=2\kappa$ with $\kappa$ the correlated-MPU complexity of a minimal coherent fluctuation. Combining the instanton factor with the extensivity prefactor (Appendix E) produces
$$
\Lambda L_P^2 \simeq 8\pi\,A_{\rm eff}\,e^{-2\kappa},
$$
and the observed value corresponds to a natural $\kappa\approx 141.5$ for $A_{\rm eff}\sim 1$. The mechanism ties $\Lambda$ to the discrete information structure of the MPU network without fine-tuned continuous parameters and preserves $w\to -1$ in the late-time vacuum.