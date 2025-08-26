# Appendix U: First-Principles Derivation of the Cosmological Constant

The cosmological constant $\Lambda$ is derived from non-perturbative fluctuations of the Predictive Universe (PU) vacuum modeled as the late-time equilibrium of a network of Minimal Predictive Units (MPUs). The vacuum is governed by the Principle of Compression Efficiency (PCE) and exhibits rare Euclidean “bounce” (instanton) trajectories in an information-theoretic action. PCE fixes the ratio of channel capacity to irreducible step cost to a PU-internal value $C_{\max}/\varepsilon=2$ (rigorously derived in Appendix Q, with $d_0=8$ and $\varepsilon=\ln 2$), and the instanton action scales with a geometric-information **complexity** $\kappa$ that counts correlated MPU involvement along the bounce. In Planck units built from the late-time coupling $G_\infty$, the vacuum energy takes the dilute-gas form

$$
\Lambda L_P^2 \simeq 8\pi\,A_{\rm eff}\,e^{-2\kappa},
$$

where $A_{\rm eff}$ (defined in U.12) is an order-unity prefactor that includes one-loop determinants and the polynomial extensivity factor of Appendix E. Using $\Lambda L_P^2 \approx 1.1\times10^{-122}$ yields a natural $\kappa\approx 142$ for $A_{\rm eff}\sim 1$. The late-time equation of state approaches $w=-1$ up to $O(N_{\rm eff}^{-1})$ corrections.


## U.1 Introduction

**Theorem U.Λ.1 (Holographic/black‑hole energy bound).** Requiring that a region of size $L$ not collapse into a black hole imposes $E\le \tfrac{c^4}{2G}L$. Hence the mean energy density obeys
$$
\rho(L)\ \le\ \frac{3c^4}{8\pi G}\,\frac{1}{L^2},\qquad
|\Lambda(L)|\ \le\ \frac{3c^2}{L^2}.
$$
In de Sitter equilibrium, this saturates with $L\sim H^{-1}$, giving $|\Lambda|\sim 3H^2$ [Cohen–Kaplan–Nelson 1999; Li 2004; Bekenstein 1981]. The observed $\Lambda L_P^2\sim10^{-122}$ thus challenges naïve quantum‑field estimates of vacuum energy. Within PU, $\Lambda$ is emergent: it arises from information-theoretic constraints on an MPU network tuned by PCE and driven by non-deterministic, resource-bounded dynamics (ND-RID). This appendix develops a non-perturbative mechanism for $\Lambda$ based on instanton suppression in a Euclidean **information action**, with scales anchored by the MPU budget $\ln(d_0)$, the irreducible step cost $\varepsilon=\ln 2$, and the PCE-optimal capacity $C_{\max}$ (Appendix Q).

Natural units $(\hbar=c=k_B=1)$ are used. $G$ denotes the **late-time** gravitational coupling $G_\infty$ relevant to the vacuum sector (Appendix K.9). Accordingly, $L_P^2=G_\infty$.


## U.2 PU Vacuum as a Statistical Ensemble

PCE provides a coarse-grained potential $\mathcal{V}[x]$ (a **rate**, Appendix Q/N) minimized at a vacuum configuration $x_{\rm vac}$. ND-RID introduces intrinsic stochasticity with per-step cost $\varepsilon=\ln 2$ (Appendix Q, Theorem 31), leading to fluctuations about $x_{\rm vac}$.

### U.2.1 Euclidean Information Action and Partition Function

We introduce **dimensionless** Euclidean information coordinates $y$ that count MPU ticks and coarse spatial cells. The statistical mechanics of the PU vacuum are governed by a core physical hypothesis: the probability weight for a configuration is determined by an effective Euclidean Information Action where the irreducible cost $\varepsilon$ sets the fundamental scale of statistical fluctuation. This is formalized by the following large-deviation principle.

**Theorem U.V1 (Exponential suppression of $\Lambda$ from redundancy rate).**
Let $Z_N(\kappa)$ be the PCE‑optimal vacuum partition function for $N$ weakly dependent, exponentially mixing MPU “cells” with redundancy‑penalized code‑length $L(\text{micro})=L_0+2\kappa$. Suppose the per‑cell log‑moment generating function exists and is steep (a Gärtner-Ellis condition). Then, as $N\to\infty$,

$$
\frac{1}{N}\log Z_N(\kappa)\ \to\ \sup_{m}\{\Psi(m)-2\kappa\}\,,
$$

with rate function $\Psi$. If the supremum occurs at $m^\star$ with $\Psi(m^\star)=A_{\rm eff}$ (PU’s area‑law effective coefficient, see Appendix E), the induced vacuum energy density satisfies

$$
\Lambda L_P^2 \;=\; 8\pi\,A_{\rm eff}\,e^{-2\kappa}\ \big(1+o(1)\big).
$$

*Proof.* Apply the Gärtner–Ellis theorem [Dembo & Zeitouni 1998] to the redundancy‑shifted mgf; Laplace’s method gives the exponential factor $e^{-2\kappa N}$ times a prefactor $e^{N A_{\rm eff}}$. Identifying $N\sim A/L_P^2$ via horizon‑area counting yields the stated scaling. ∎

We define a **dimensionless** potential $V[x]:=\tau_{\rm MPU}\,\mathcal{V}[x]/\varepsilon$ using the MPU tick $\tau_{\rm MPU}$. With a positive semi-definite metric $\mathcal{G}_{ij}$ on configuration space, the action is

$$
\boxed{
S_E[x]\;=\;\frac{1}{\varepsilon}\int d^4 y\;\bigg[\;\tfrac12\,\mathcal{G}_{ij}(x)\,\partial_\mu x^i\,\partial_\mu x^j\;+\;V[x]-V[x_{\mathrm{vac}}]\;\bigg],
}
\tag{U.1}
$$

which is dimensionless by construction. The vacuum partition function and Gibbs weight are

$$
\boxed{
Z\;=\;\int \mathcal{D}x\;\exp\!\big(-S_E[x]\big),\qquad
\langle \mathcal{O}\rangle\;=\;\frac{1}{Z}\int \mathcal{D}x\;\mathcal{O}[x]\,e^{-S_E[x]}.
}
\tag{U.2}
$$

Subtracting $V[x_{\rm vac}]$ ensures finite action for vacuum-to-vacuum trajectories.


## U.3 Minimal Effective Instanton Model

Consider a coarse reaction coordinate $q(\tau)$ along Euclidean time $\tau$, embedded in $x(\tau,\mathbf{y})$. A one-dimensional reduction yields

$$
\boxed{
S_E[q]\;=\;\frac{1}{\varepsilon}\int_{-\infty}^{+\infty} d\tau\;\Big[\tfrac12\,M(q)\,\dot q^{\,2}\;+\;V_{\mathrm{eff}}(q)-V_{\mathrm{eff}}(q_{\mathrm{vac}})\Big],
}
\tag{U.3}
$$

with equation of motion

$$
\boxed{
M(q)\,\ddot q\;+\;\tfrac12\,M'(q)\,\dot q^{\,2}\;=\; \frac{d V_{\mathrm{eff}}}{dq}.
}
\tag{U.4}
$$

In the **minimal** model we take $M(q)\equiv M$ constant, in which case $ \frac{d}{d\tau}(M\dot q)=V'_{\rm eff}(q)$. Bounce solutions satisfy $q(\pm\infty)=q_{\rm vac}$, $\dot q(\pm\infty)=0$ and have finite action; a **dilute instanton gas** applies when $e^{-S_{\rm inst}}\ll 1$ so events are well-separated (Coleman, 1977; Callan & Coleman, 1977; Coleman, 1985).


## U.4 Instanton Action and Complexity

MPU dynamics allow a micro-counting of bounce cost. Let $N_{\mathrm{corr}}(\tau)$ be the instantaneous number of **correlated MPUs** along the reaction path. We adopt the following **operational definition**: for a fixed mutual-information threshold $\theta\in(0,\ln d_0)$,

$$
N_{\mathrm{corr}}(\tau)\;:=\;\#\Big\{i\in \text{MPUs}\ \big|\ I\big(M_i;q(\tau)\,\big|\,\text{local\,context}\big)\ge \theta\Big\},
$$

and define the **complexity**

$$
\boxed{
\kappa\;:=\;\int d\tau\,\overline{N}_{\mathrm{corr}}(\tau),
}
\tag{U.5}
$$

where the bar denotes coarse-graining over sub-tick fluctuations; $\tau$ is measured in **MPU ticks** and is therefore dimensionless. We now introduce a second core hypothesis for this calculation, a PCE-motivated scaling ansatz for the instanton action. We posit that the total information-theoretic cost of a coherent fluctuation scales linearly with its complexity $\kappa$ and with the information cost per unit, which is naturally identified with the ratio of the channel capacity $C_{max}$ to the irreducible step cost $\varepsilon$. Under **stationary PCE allocation** and **additivity of per-step costs**, the on-shell instanton action is modeled as:

$$
\boxed{
S_{\mathrm{inst}}\;=\;\Big(\frac{C_{\max}}{\varepsilon}\Big)\,\kappa\;+\;O(1),
}
\tag{U.6}
$$

where the $O(1)$ term collects path-independent overheads (its contribution is absorbed into the prefactor below). Here $C_{\max}\equiv C_{\max}^{\ast}$.


## U.5 PCE Fixes the Information Ratio

PCE allocates the MPU budget $\ln(d_0)$ between irreducible self-referential processing and external predictive capacity. With $d_0=8$ (Theorem 23) and $\varepsilon=\ln 2$ (Theorem 31, rigorously derived in Appendix J),

$$
\boxed{
C_{\max}^{\ast} \;=\; \ln(d_0)\;-\;\varepsilon \;=\; 2\ln 2,
}
\tag{U.7}
$$

so that

$$
\boxed{
\frac{C_{\max}^{\ast}}{\varepsilon}\;=\;2.
}
\tag{U.8}
$$

Absorbing the $O(1)$ term in (U.6) into the prefactor (Sec. U.6), we have

$$
\boxed{
S_{\mathrm{inst}}\;=\;2\,\kappa.
}
\tag{U.9}
$$


## U.6 Vacuum Energy and Numerical Consistency

In the dilute-gas approximation the vacuum energy density is

$$
\boxed{
\rho_\Lambda \;\approx\; A\,\rho_{\mathrm{Pl}}\;e^{-S_{\mathrm{inst}}}},
\qquad \rho_{\mathrm{Pl}}:=\frac{1}{L_P^4}=\frac{1}{G_\infty^2},
\tag{U.10}
$$

where $A=O(1)$ encodes one-loop determinant ratios and zero-mode volumes (Callan & Coleman, 1977; Dunne, 2008; Zinn-Justin, 2002). Using $L_P^2=G_\infty$ so that $\Lambda L_P^2=8\pi G_\infty^2 \rho_\Lambda$, and (U.9),

$$
\boxed{
\Lambda L_P^2 \;\simeq\; 8\pi\,A\,e^{-2\kappa}.
}
\tag{U.11}
$$

Appendix E relates vacuum extensivity to an effective four‑volume of **independent cells**. Let $\xi$ denote the correlation length obtained from the RID contraction factor (E.2), $\xi:=c\,\tau_{\rm mix}=c\,\Delta t_{\rm cycle}/|\ln f_{\mathrm{RID}}|$ (Sec. 7). For a spacetime volume $V_4$,
$$
N_{\mathrm{eff}}\ :=\ \frac{V_4}{\gamma_4\,\xi^4}\ \simeq\ \frac{V_4}{\gamma_4\,\delta^4},\qquad \gamma_4=O(1)\ \text{(packing constant)}.
\tag{U.12a}
$$
The one‑loop prefactor is the standard ratio of quadratic fluctuation determinants around the instanton saddle versus the vacuum,
$$
A\ =\ \mathcal{Z}_0\;\Bigg[\frac{\det{}' \mathcal{M}_{\mathrm{inst}}}{\det \mathcal{M}_{\mathrm{vac}}}\Bigg]^{-1/2},
\qquad \mathcal{Z}_0=(2\pi)^{-n_0/2}\,\mathcal{V}_0\,\mathcal{J},
\tag{U.12b}
$$
where $\mathcal{M}$ are second‑variation operators, $n_0$ the number of zero modes with collective‑coordinate volume $\mathcal{V}_0$, and $\mathcal{J}$ the Jacobian from gauge/collective‑coordinate fixing. Finite‑size/extensivity then renormalize the prefactor to
$$
\boxed{
A_{\rm eff}\;:=\;\frac{\text{const}}{N_{\mathrm{eff}}}\,A,
}
\tag{U.12}
$$
and the combined result is

$$
\boxed{
\Lambda L_P^2 \;\simeq\; 8\pi\,A_{\rm eff}\,e^{-2\kappa}.
}
\tag{U.13}
$$

Given $\Lambda L_P^2 \sim 10^{-122}$ (see **Appendix V** for a precise inversion using Planck-2018 central values).

$$
\boxed{
\kappa\;=\;-\tfrac12\,\ln\!\Big(\tfrac{\Lambda L_P^2}{8\pi A_{\rm eff}}\Big).
}
\tag{U.14}
$$

For $A_{\rm eff}=1$ this gives $\kappa\approx 142.0$. Varying $A_{\rm eff}$ by $10^{\pm 3}$ shifts $\kappa$ by only $\pm 3.5$. The success of this model lies not in deriving the specific number `κ ≈ 142`, but in demonstrating that a plausible, `O(100)` complexity can naturally explain the observed `O(10¹²²)` suppression without fine-tuning.


## U.7 Relation to Extensivity and Late-Time Equation of State

Equation (U.13) shows the **multiplicative** combination of the polynomial extensivity factor (derived in Appendix E) with the non-perturbative exponential. For late times the exponential dominates the magnitude, while $A_{\rm eff}$ refines it.

Because the instanton contribution is vacuum-to-vacuum, it behaves as an effective constant in the action. Varying the action with respect to $g_{\mu\nu}$ gives $T_{\mu\nu}=-\rho_\Lambda\,g_{\mu\nu}$, hence

$$
\boxed{
w \;=\; \frac{\langle P\rangle}{\langle \rho\rangle} \;=\; -1\;+\;O\!\big(N_{\mathrm{eff}}^{-1}\big).
}
\tag{U.15}
$$

[Weinberg, 1989; Carroll, 2001].


## U.8 Prefactor, Diluteness, and Scope

The prefactor $A$ arises from Gaussian fluctuations around the bounce and zero-mode volumes (Callan & Coleman, 1977; Dunne, 2008). For a minimal bounce in MPU units, $A=O(1)$. The dilute-gas regime is exceptionally accurate because $e^{-S_{\rm inst}}=e^{-2\kappa}$ is astronomically small for $\kappa\sim 10^2$ (Coleman, 1977; Coleman, 1985). The analysis concerns the **late-time vacuum** defined by $G_\infty$; epochal dynamics with $G_{\mathrm{eff}}(t)$ are treated in Appendix K.9.


## U.9 Conclusion

A Euclidean information-action framework for the PU vacuum yields an exponentially suppressed, non-perturbative contribution to $\Lambda$ from instantons. PCE fixes $C_{\max}/\varepsilon=2$ (Appendix Q), giving $S_{\rm inst}=2\kappa$ with $\kappa$ the correlated-MPU complexity of a minimal coherent fluctuation. Combining the instanton factor with the extensivity prefactor (Appendix E) produces

$$
\Lambda L_P^2 \simeq 8\pi\,A_{\rm eff}\,e^{-2\kappa},
$$

and the observed value corresponds to a natural $\kappa\approx 142$ for $A_{\rm eff}\sim 1$. The mechanism ties $\Lambda$ to the discrete information structure of the MPU network without fine-tuned continuous parameters and preserves $w\to -1$ in the late-time vacuum.


