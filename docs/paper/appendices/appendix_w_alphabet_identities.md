# Appendix W — PU’s Alphabet‑Constant Identities, Robustness, and SM Structure

## W.0 Notation and setup

This appendix derives general, robust identities and bounds relating emergent gauge couplings to the information-theoretic invariants of the MPU's predictive cycle. This formalism provides stringent internal consistency checks for the PU framework. In **Appendix Z**, these principles are applied to a first-principles derivation of the MPU's QFI spectrum, culminating in a parameter-free calculation of the Thomson-limit fine-structure constant $\alpha^{-1} ≈ 137.036$ at the PCE-Attractor.

* **Alphabet size:** $d_0\in{2,3,\dots}$. PU uses $d_0=8$.
* **One‑cycle deformation variable:** $u=g^2\ge 0$ (Heaviside–Lorentz units).
* **Rate‑level PCE potential (quadratic curvature near $u=0$):** take $\gamma_{\rm eff}=2$,

  $$
  \phi(u)=A_{\rm PCE}\,u^{2}\;-\;\Gamma_0\sum_{i=1}^{M}\ln(1+\lambda_i u),\qquad u\ge0,
  \tag{W.0.1}
  $$

  with $A_{\rm PCE}, \Gamma_0$ having units of **power** $[E][T]^{-1}$ (assuming $u$ and $\lambda_i$ are dimensionless).
* **Spectral statistics (LAN/SLD‑QFI spectrum at $g=0$):** the $\{\lambda_i\}$ are the SLD‑QFI eigenvalues of the probe channel linearized at $g=0$. Let

  $$
  S_1=\sum_i\lambda_i,\quad S_2=\sum_i\lambda_i^2,\quad x=\frac{S_1}{M},\quad \sigma^2=\frac{1}{M}\sum_i(\lambda_i-x)^2=\frac{S_2}{M}-x^2\ge0.
  $$
* **Invariants at $u=0$:**

  $$
  C_{\rm cap}=\Gamma_0\,S_1,\qquad 
   C_{\rm cyc}=\phi''(0)=\Gamma_0\,[\,2\tilde A_{\rm PCE}+S_2\,],\qquad
   \tilde A_{\rm PCE}:=\frac{A_{\rm PCE}}{\Gamma_0}.
   \tag{W.0.2}
  $$
* **Capacity inequality (Jensen):**

  $$
  \sum_{i=1}^{M}\ln(1+\lambda_i u)\ \le\ M\ln(1+xu),\quad\text{equality iff }\lambda_i=x\ \forall i.
  \tag{W.0.3}
  $$
* **Cap constant:**

  $$
  a_{\rm cap}:=d_0^{1/M},\quad D:=a_{\rm cap}(a_{\rm cap}-1),\quad 
  K(d_0,M)=\frac{a_{\rm cap}-1}{4\pi}\Bigl(1+\frac{1}{D}\Bigr).
  \tag{W.0.4}
  $$

**Units & normalization.** Heaviside–Lorentz (HL) units are used with $u=g^2$ and $\alpha=g^2/(4\pi)$. **Below electroweak symmetry breaking (EWSB)**, the **canonical** SM convention is adopted:

$$
Q\,=\,T_3+\frac{Y}{2},\qquad e=g_2\sin\theta_W=g_Y\cos\theta_W,\qquad \alpha_{\mathrm{em}}=\frac{e^2}{4\pi}.
$$

For grand‑unified (GUT) normalization of hypercharge,

$$
g_1=\sqrt{\tfrac{5}{3}}\,g_Y\quad\text{(equivalently }g_Y=\sqrt{\tfrac{3}{5}}\,g_1\text{)}.
$$

**LAN/QFI–capacity rationale.** For a $C^1$ family of CPTP maps near $g=0$ with a full‑rank stationary state, local asymptotic normality (LAN) reduces estimation to a Gaussian shift model; the SLD–QFI eigenvalues $\{\lambda_i\}$ parameterize orthogonal local signal‑to‑noise directions. The surrogate objective

$$
g_{\rm true}(u)=\sum_i\ln(1+\lambda_i u)
$$

is used as a capacity-like measure consistent with the LAN decomposition. It is **concave** and monotone in $u$. The function $\ln(1+\lambda u)$ is also **concave in $\lambda$** for fixed $u>0$ (Helstrom; Holevo; Petz; Paris–Řeháček). This appendix does not derive the existence of the Standard Model group, a task addressed in Appendix G.8. Instead, it assumes the SM group structure has emerged and proceeds to derive quantitative constraints on its coupling constants from the underlying MPU substrate’s information‑theoretic properties.

**Standing assumptions.** Throughout this appendix:

$$
\lambda_i\ge 0,\quad A_{\rm PCE}>0,\quad M\ge 1,\quad d_0\ge 2,\quad x=\tfrac{S_1}{M}>0.
$$

Unless stated otherwise, the **cap‑active branch** at $\mu^\*$ is considered: the unconstrained minimizer $u_0\ge 0$ of $\phi$ (solving $\phi'(u_0)=0$) satisfies $g_J(u_0)>\ln d_0$. If instead $g_J(u_0)\le \ln d_0$, the optimum is **interior** $(u^\*=u_0)$; the equality case $g_J(u_0)=\ln d_0$ lies on the **branch boundary**.

> **Notation box.** $u=g^2$; $\alpha=g^2/(4\pi)$; $S_1=\sum\lambda_i$; $S_2=\sum\lambda_i^2$; $x=S_1/M$; $\sigma^2=\frac{S_2}{M}-x^2$; $a_{\rm cap}=d_0^{1/M}$; $D=a_{\rm cap}(a_{\rm cap}-1)$; $K(d_0,M)=\frac{a_{\rm cap}-1}{4\pi}\bigl(1+\frac{1}{D}\bigr)$; $F_\lambda=\frac{M x^2}{S_2}=\frac{1}{1+\sigma^2/x^2}\in(0,1]$.

---

## W.1 Capacity ordering and gap control

**Lemma W.1 (Strict convexity; unique constrained minimizer).**
With $\gamma_{\rm eff}=2$, the second derivative of the potential (W.0.1) is:

$$
\phi''(u)=2A_{\rm PCE}+ \Gamma_0\sum_i\frac{\lambda_i^2}{(1+\lambda_i u)^2}.
$$
Since $A_{\rm PCE}>0$ and the sum is non-negative, $\phi''(u) > 0$ for all $u\ge 0$. Hence $\phi$ is strictly convex on $[0,\infty)$ and has a unique constrained minimizer under either capacity constraint.

**Lemma W.2 (Jensen‑cap boundary).**
When the Jensen‑cap is active,

$$
u^\*_{\rm J}\;=\;\frac{M}{S_1}\bigl(a_{\rm cap}-1\bigr)\;=\;\frac{a_{\rm cap}-1}{x}.
\tag{W.1.1}
$$

**Lemma W.3 (Gap monotonicity).**
$\Delta_{\rm cap}(u):=g_J(u)-g_{\rm true}(u)$ satisfies $\Delta_{\rm cap}(u)\ge0$ and $\Delta'_{\rm cap}(u)\ge0$ for all $u\ge0$.

*Proof.* Nonnegativity is Jensen's inequality applied to the concave function $\ln(1+\lambda u)$. Derivative:

$$
\Delta'_{\rm cap}(u)=\frac{Mx}{1+xu}-\sum_i\frac{\lambda_i}{1+\lambda_i u}.
$$

Let $h(\lambda):=\lambda/(1+\lambda u)$. This function is concave in $\lambda$ (for $u>0$). By Jensen's inequality, the average value is less than or equal to the value at the average: $\frac{1}{M}\sum_i h(\lambda_i) \le h(\frac{1}{M}\sum_i \lambda_i) = h(x)$. Thus, $\sum_i h(\lambda_i) \le M h(x) = \frac{Mx}{1+xu}$. Therefore, $\Delta'_{\rm cap}(u) \ge 0$. $\square$

**Lemma W.4 (Quadratic gap bound).**
Assume $\lambda_i\ge0$ and let $\lambda_{\min}=\min_i\lambda_i$. Then for all $u\ge0$,

$$
0\le \Delta_{\rm cap}(u)\ \le\ \frac{M\sigma^2\,u^2}{2(1+\lambda_{\min}u)^2}.
\tag{W.1.2}
$$

*Proof.* Let $f(\lambda)=\ln(1+\lambda u)$. We use the Taylor expansion with the Lagrange form of the remainder: $f(\lambda_i) = f(x) + f'(x)(\lambda_i-x) + \frac{1}{2}f''(\xi_i)(\lambda_i-x)^2$ for some $\xi_i$ between $\lambda_i$ and $x$.
The gap is $\Delta_{\rm cap}(u) = M f(x) - \sum_i f(\lambda_i)$. Summing the expansion over $i$ (the linear term cancels) gives:
$\Delta_{\rm cap}(u) = -\frac{1}{2}\sum_i f''(\xi_i)(\lambda_i-x)^2$.
Since $f''(\xi) = -\frac{u^2}{(1+\xi u)^2}$, we have:
$\Delta_{\rm cap}(u) = \frac{u^2}{2}\sum_i \frac{(\lambda_i-x)^2}{(1+\xi_i u)^2}$.
Since $\xi_i \ge \lambda_{\min}$, we have $(1+\xi_i u)^2 \ge (1+\lambda_{\min}u)^2$.
$\Delta_{\rm cap}(u) \le \frac{u^2}{2(1+\lambda_{\min}u)^2} \sum_i (\lambda_i-x)^2 = \frac{M\sigma^2 u^2}{2(1+\lambda_{\min}u)^2}$.
Nonnegativity follows from Jensen's inequality (Lemma W.3). $\square$

**Remark (sharper bound).** A per‑eigenvalue refinement is

$$
\Delta_{\rm cap}(u)\ \le\ \frac{u^2}{2}\sum_{i=1}^M\frac{(\lambda_i-x)^2}{\bigl(1+\min\{\lambda_i,x\}\,u\bigr)^2}.
$$

**Remark (large‑$u$ behavior).** As $u\to\infty$, **assuming $\min_i\lambda_i>0$**,

$$
\Delta_{\rm cap}(u)\ \longrightarrow\ M\ln x\ -\ \sum_{i=1}^M\ln\lambda_i.
$$

If some $\lambda_i=0$, the limit diverges accordingly, as expected from the asymptotics.

**Theorem W.5 (Ordering of optima; active‑cap case).**
Assume the upper capacity constraint is active for both problems. Then

$$
u^\*_{\rm T}\ \ge\ u^\*_{\rm J}.
\tag{W.1.3}
$$

*Proof.* Since $g_{\rm true}(u)\le g_J(u)$, the feasible set $\{u:\ g_J(u)\le\ln d_0\}$ is contained in $\{u:\ g_{\rm true}(u)\le\ln d_0\}$. The maximum admissible $u$ under the true capacity is therefore $\ge$ the Jensen cap; the constrained convex minimum at the active upper boundary is attained at $u^\*_{\rm J}$ for the Jensen set and at some $u^\*_{\rm T}\ge u^\*_{\rm J}$ for the true set. $\square$

---

## W.2 Alphabet constant and product relation

**Definition W.6 (Sector ratio).** For any sector $s$,

$$
r_s:=\Bigl(\frac{C_{\rm cap}}{C_{\rm cyc}}\Bigr)_s
=\frac{S_1^{(s)}}{2\tilde A_{\rm PCE}^{(s)}+S_2^{(s)}}.
\tag{W.2.1}
$$

**Definition W.7 (Alphabet constant).** For fixed $d_0$ and $M$,

$$
a_{\rm cap}=d_0^{1/M},\quad D=a_{\rm cap}(a_{\rm cap}-1),\quad 
K(d_0,M)=\frac{a_{\rm cap}-1}{4\pi}\Bigl(1+\frac{1}{D}\Bigr).
\tag{W.2.2}
$$

For $(d_0,M)=(8,7)$, where $d_0=8$ is the MPU alphabet size (Theorem 23) and $M_e=7$ is the number of effective independent information modes linked to the seven generators of $\pi_2(\Sigma_8) \cong \mathbb{Z}^7$ (Appendix R, Section R.3): $a_{\rm cap}=8^{1/7}=1.34590019\dots$, $D=0.46554714\dots$,

$$
\boxed{K(8,7)=0.0866517}.
$$

**Proposition W.8 (Cap–coherence curvature bound).**
At the Jensen‑cap boundary $u=u^\*_{\rm J}$,

$$
2\tilde A_{\rm PCE}\ \le\ \frac{S_2}{D},
\tag{W.2.3}
$$

with **strict inequality on the cap‑active branch**; equality requires simultaneously a **flat spectrum** $(\sigma^2=0)$ and $u_0=u^\*_{\rm J}$ (branch boundary).

*Proof.* At $u^\*_{\rm J}$, the KKT conditions for minimizing $\phi(u)$ subject to $g_J(u)\le\ln d_0$ yield $\exists\,\eta\ge 0$ such that

$$
\phi'(u^\*_{\rm J})+\eta\,g_J'(u^\*_{\rm J})=0,\qquad g_J'(u)=\frac{Mx}{1+xu}>0.
$$

Hence $\phi'(u^\*_{\rm J})=-\eta\,g_J'(u^\*_{\rm J})\le 0$, with strict “$<0$” on the cap‑active branch ($\eta>0$). Using concavity of $h(\lambda)=\lambda/(1+\lambda u)$,

$$
\sum_i\frac{\lambda_i}{1+\lambda_i u^\*_{\rm J}}\ \le\ M\,\frac{x}{1+xu^\*_{\rm J}} \;=\; M\,\frac{x}{a_{\rm cap}}.
$$

Thus

$$
0\ \ge\ \phi'(u^\*_{\rm J})
=2A_{\rm PCE}\,u^\*_{\rm J}-\Gamma_0\sum_i\frac{\lambda_i}{1+\lambda_i u^\*_{\rm J}}
\ \ge\ 2A_{\rm PCE}\frac{a_{\rm cap}-1}{x}-\Gamma_0\,M\frac{x}{a_{\rm cap}}.
$$

Rearranging gives $2\tilde A_{\rm PCE}\le (Mx^2)/D$. Since $S_2\ge Mx^2$ (Cauchy–Schwarz / RMS–AM), we obtain $2\tilde A_{\rm PCE}\le S_2/D$. Equality requires both Jensen tightness ($\lambda_i=x$) and $\eta=0$, i.e., $u_0=u^\*_{\rm J}$. $\square$

**Definition W.9 (Spectral form factor).**

$$
F_{\lambda}\ :=\ \frac{M\,x^2}{S_2}\ =\ \frac{1}{1+\sigma^2/x^2}\ \in (0,1].
\tag{W.2.4}
$$

For a given sector $s$, write $F_{\lambda,s}:=\dfrac{M_s x_s^2}{S_2^{(s)}}$.

**Theorem W.10 (Alphabet constant: upper bound and identity conditions at the Jensen‑cap–saturated optimum).**
At the **Jensen‑cap–saturated** optimum,

$$ \boxed{\ \alpha_{\mathrm{em}}(\mathrm{MPU})\Bigl(\frac{C_{\rm cyc}}{C_{\rm cap}}\Bigr)_{e}\ \le\ K(d_0,M_e)\,\frac{1}{F_{\lambda,e}}\ }, \tag{W.2.5} $$

with **strict inequality on the cap‑active branch**. **Equality** holds **iff** the spectrum is flat $(F_{\lambda,e}=1)$ **and** the unconstrained minimizer lies on the boundary $(u_0=u^\*_{\rm J})$, in which case


$$ \boxed{\ \alpha_{\mathrm{em}}(\mathrm{MPU})\Bigl(\frac{C_{\rm cyc}}{C_{\rm cap}}\Bigr)_{e}\ =\ K(d_0,M_e)\ }. \tag{W.2.6} $$


*Proof.* From $u^\*_{\rm J}=(a_{\rm cap}-1)/x$,

$$ \alpha_{\mathrm{em}}(\mathrm{MPU})\,\frac{C_{\rm cyc}}{C_{\rm cap}} =\frac{u^\*_{\rm J}}{4\pi}\cdot\frac{2\tilde A_{\rm PCE}+S_2}{S_1} =\frac{a_{\rm cap}-1}{4\pi}\cdot\frac{2\tilde A_{\rm PCE}+S_2}{M x^2}. $$

Apply (W.2.3) to obtain the bound with factor $1/F_{\lambda,e}=S_2/(M x^2)$ (for the EM sector). Strictness and equality conditions follow from Proposition W.8 and $F_{\lambda,e}=1\iff \sigma^2=0$. $\square$

**PCE motivation for the identity point.**
 *Relation to the PCE-Attractor.*
 This specific point, where the spectrum is flat ($\sigma^2=0$) and the system operates at the capacity boundary ($u_0=u^\*_{\rm J}$), corresponds precisely to the **PCE-Attractor** (Definition 15a). The identity (W.2.6) is therefore not merely an idealized case but a sharp prediction for a system that has converged to this unique, PCE-favored state of maximal efficiency and symmetry.

**Sensitivity note (alphabet constant and variance).**
For $d_0=8$, $K(8,M)$ decreases slowly with $M$:
$K(8,5)=0.0935410,\ K(8,6)=0.0892318,\ K(8,7)=0.0866517,\ K(8,8)=0.0849844,\ K(8,9)=0.0838445,\ K(8,10)=0.0830309$.
Variance enters only through $F_\lambda$: the multiplicative penalty is $1/F_\lambda=1+\sigma^2/x^2$.

**Remark.** By Theorem W.5 (active‑cap case), the true‑capacity optimum satisfies $u^\*_{\rm T}\ge u^\*_{\rm J}$; the product at the true optimum is therefore $\ge$ its Jensen‑cap value. The bound (W.2.5) is asserted at the Jensen‑cap–saturated optimum.

---

## W.3 Weak sector relation (Weinberg angle)

**Assumption W.3.A (Alignment hypothesis).**
At the $\mathrm{MPU}$ operational point, PCE sets both $U(1)_Y$ and $SU(2)$ sectors to be **simultaneously cap‑active and Jensen‑cap–saturated**. A sufficient rationale is **spectral similarity** (comparable $M_s$ and $x_s$ across sectors) so that both unconstrained optima exceed the common alphabet cap at $\mu^\*$. The assumption can fail if sector spectra differ markedly (e.g., large variance or $M_s$ mismatch) causing one sector to be interior while the other is cap‑active.

**Theorem W.11 (Weinberg angle from sector invariants; cap‑active branch).**
Under Assumption W.3.A, let $u_s^\*$ denote the Jensen‑cap–saturated optimum for sector $s\in\{Y,2\}$. Then

$$ \sin^2\theta_W(\mathrm{MPU})=\frac{u_Y^\*}{u_Y^\*+u_2^\*},\qquad \frac{u_2^\*}{u_Y^\*}= \frac{(d_0^{1/M_2}-1) / (S_1^{(2)}/M_2)}{(d_0^{1/M_Y}-1) / (S_1^{(Y)}/M_Y)}. \tag{W.3.1} $$

*Proof.* $\sin^2\theta_W=g_Y^2/(g_Y^2+g_2^2)$ and $u=g^2$. Apply Lemma W.2 in each sector. $\square$

**Normalization.** Equation (W.3.1) uses **SM (canonical) normalization** $g_Y$. For **GUT normalization**, $g_1=\sqrt{\tfrac{5}{3}}\,g_Y$ (equivalently $g_Y=\sqrt{\tfrac{3}{5}}\,g_1$).

**Corollary W.12 (Symmetric sector reference).**
If $M_Y=M_2=M$ and $x_Y=x_2=x_0$, then $u_2^\*/u_Y^\*=1$ and

$$ \sin^2\theta_W(\mathrm{MPU})=\tfrac12. \tag{W.3.2} $$

**Proposition W.13 (GUT‑normalized template).**
If one further assumes an $SU(5)$‑style generator normalization at $\mu^\*$ with $g_1=g_2$ and $g_Y=\sqrt{\tfrac{3}{5}}\,g_1$ (here $g_1$ is the **GUT‑normalized** $U(1)$ coupling), then

$$ \sin^2\theta_W(\mathrm{MPU})=\frac{3}{8}. \tag{W.3.3} $$

## W.3a Gauge Mode Counting at the PCE-Attractor

This section examines the electroweak mode embedding at the PCE-Attractor from the QFI spectral structure. 

### W.3a.1 Gauge Mode Embedding

The Standard Model gauge group $G_{\mathrm{SM}} = SU(3)_C \times SU(2)_L \times U(1)_Y$ has total dimension:
$$\dim[\mathfrak{g}_{\mathrm{SM}}] = 8 + 3 + 1 = 12$$

This equals the Golay code dimension $k = 12$ (Theorem Z.13).

**Definition W.3a.1 (Electroweak Mode Sector).** The electroweak sector has:
- $M_2 = \dim[\mathfrak{su}(2)] = 3$ (weak isospin generators)
- $M_Y = \dim[\mathfrak{u}(1)] = 1$ (hypercharge generator)
- $M_{\mathrm{EW}} = M_2 + M_Y = 4$ (total electroweak modes)

### W.3a.2 QFI Spectrum at the PCE-Attractor

**Proposition W.3a.1 (Flat Spectrum).** At the PCE-Attractor (Definition 15a), the QFI spectrum is flat:
$$\lambda_i = \lambda_0 = 1 \quad \forall i \in \{1, \ldots, M\}$$

*Proof.* This is Theorem Z.5 (Steps 5–6). The isotropy group $H = S(U(a) \times U(b))$ acts transitively on the 24-dimensional interface. By Schur's lemma, the $H$-invariant QFI metric is proportional to the identity. ∎

### W.3a.3 Uniform Per-Generator Capacity

**Theorem W.3a.2 (Uniform Capacity from PCE Isotropy).** At the PCE-Attractor, each gauge generator carries equal information capacity:
$$\lambda_i^{(s)} = \lambda_0 = 1 \quad \text{for all generators in all sectors}$$

*Proof.*

**Step 1.** The full 24-dimensional interface has flat QFI spectrum $g_{\mathrm{QFI}} = \lambda_0 \cdot I_{24}$ (Proposition W.3a.1).

**Step 2.** The SM gauge algebra embeds into a 12-dimensional subspace $\mathcal{I}_{\mathrm{SM}} \subset \mathbb{R}^{24}$.

**Step 3.** Restriction of the flat metric to any subspace remains flat: $g_{\mathrm{QFI}}|_{\mathcal{I}_s} = \lambda_0 \cdot I_{M_s}$.

**Step 4.** PCE non-discrimination: Non-uniform allocation would violate inherited flatness and increase $V_{\mathrm{op}}$ without benefit. ∎

### W.3a.4 Mode Ratio and Electroweak Structure

**Remark W.3a.3 (Mode Ratio).** At the PCE-Attractor with uniform per-generator capacity, the mode ratio is:

$$\frac{M_2}{M_Y} = \frac{3}{1} = 3$$

The relationship between this mode ratio and the physical electroweak couplings $g_2$ and $g_Y$ requires renormalization group running from the PCE-Attractor scale to observable energies. The observed weak mixing angle $\sin^2\theta_W \approx 0.231$ at $M_Z$ reflects this running, and a complete derivation would require specifying the intermediate scales and particle content. This remains an open question for future development.

## W.4 Hypercharge from anomalies and Yukawa invariance

Consider $SU(N_c)\times SU(2)\times U(1)_Y$ with one Higgs doublet $H:(\mathbf{1},\mathbf{2})_{Y_H}$ and one family

$$
Q_L:(\mathbf{N_c},\mathbf{2})_{Y_Q},\quad
u_R:(\mathbf{N_c},\mathbf{1})_{Y_u},\quad
d_R:(\mathbf{N_c},\mathbf{1})_{Y_d},\quad
L_L:(\mathbf{1},\mathbf{2})_{Y_L},\quad
e_R:(\mathbf{1},\mathbf{1})_{Y_e}.
$$

**Theorem W.14 (Master anomaly–Yukawa relation).**
Yukawa gauge‑invariance gives $Y_u=Y_Q+Y_H$, $Y_d=Y_Q-Y_H$, $Y_e=Y_L-Y_H$. The mixed anomalies enforce $N_cY_Q+Y_L=0$. The cubic hypercharge anomaly for left‑chiral fields reduces to

$$
\mathcal A_{Y^3}
= N_c\bigl(2Y_Q^3-Y_u^3-Y_d^3\bigr)+\bigl(2Y_L^3-Y_e^3\bigr)
= -\,(N_cY_Q-Y_H)^3.
\tag{W.4.1}
$$

Hence for $Y_Q\neq0$,

$$
Y_H\;=\;N_cY_Q.
\tag{W.4.2}
$$

The resulting charges are

$$
Y_L=-N_cY_Q,\quad Y_e=-2N_cY_Q,\quad Y_u=(N_c+1)Y_Q,\quad Y_d=-(N_c-1)Y_Q.
\tag{W.4.3}
$$

This simultaneously cancels the mixed gravitational–$U(1)_Y$ anomaly $\sum Y= -N_cY_Q+Y_H=0$. (This sum is over the left‑chiral fermion content; the Higgs doublet, being a scalar, does not contribute to this chiral gravitational anomaly.)

**Corollary W.15 (SM normalization and $N_c$).**
Using the **canonical** SM relation $Q=T_3+\tfrac{Y}{2}$ and $Q(\nu_L)=+\tfrac12+\tfrac{Y_L}{2}=0\Rightarrow Y_L=-1$, we obtain $Y_Q=\tfrac{1}{N_c}$ and $Y_H=1$. Matching $Q(u_L)=+\tfrac23$, $Q(d_L)=-\tfrac13$ fixes $N_c=3$ and

$$
Y_Q=\tfrac13,\quad Y_L=-1,\quad Y_u=\tfrac{4}{3},\quad Y_d=-\tfrac{2}{3},\quad Y_e=-2,\quad Y_H=1.
\tag{W.4.4}
$$

---

## W.5 Robustness bounds

**Corollary W.16 (Product bound at Jensen‑cap; EM restatement of (W.2.5) at the Jensen‑cap–saturated optimum).**
At the Jensen‑cap–saturated optimum,

$$ \boxed{\ \alpha_{\mathrm{em}}(\mathrm{MPU})\Bigl(\frac{C_{\rm cyc}}{C_{\rm cap}}\Bigr)_{e}\ \le\ K(d_0, M_e)\,\frac{1}{F_{\lambda,e}}\ }, \tag{W.5.1} $$

with **strict inequality on the cap‑active branch**. **Equality** holds **iff** $u_0=u^\*_{\rm J}$ and $\sigma^2=0$. The identity (W.2.6) holds only under the specific conditions of a flat LAN spectrum and operation precisely at the branch boundary. The more general, robust prediction of this framework is the inequality (W.5.1). The identity represents an idealized, high‑symmetry point in the space of possible solutions.

**Corollary W.17 (Lower bound on $r_e$ and variance effect).**
With $r_e=\tfrac{S_1}{2\tilde A_{\rm PCE}+S_2}$ and (W.2.3),

$$
r_e\ \ge\ \frac{S_1}{S_2(1+1/D)}\ =\ \frac{1}{x}\cdot \frac{1}{(1+\sigma^2/x^2)(1+1/D)}.
\tag{W.5.2}
$$

Increasing spectral variance decreases $r_e$ and enlarges the upper bound (W.5.1) via $1/F_\lambda=1+\sigma^2/x^2$.

---

## W.6 Preregisterable computation (deterministic; no data)

**Inputs at $g=0$** for each sector $s\in\{e,Y,2\}$:

0. **Probe specification:** a $C^1$ family of CPTP maps $E_g^{(s)}$ and a full‑rank stationary state $\rho_0^{(s)}$ with $E^{(s)}_0(\rho_0^{(s)})=\rho_0^{(s)}$. The SLD‑QFI is computed for the state family $\rho_g^{(s)}:=E_g^{(s)}(\rho_0^{(s)})$ at $g=0$.
   *Alternative:* if a channel‑QFI convention is adopted, specify the input/state optimization rule and ancilla dimension; note that multi‑parameter QCRB attainability may require **SLD‑compatibility** (commutativity) for joint POVMs.
1. **Spectral data:** $\{\lambda_i^{(s)}\}_{i=1}^{M_s}$ (SLD‑QFI eigenvalues at $g=0$); compute $M_s$, $S_1^{(s)}$, $S_2^{(s)}$, $x_s=S_1^{(s)}/M_s$, $\sigma_s^2$, $F_{\lambda,s}$.
2. **Global constants:** $\Gamma_0,\nu$; alphabet size $d_0$.
3. **Branch classification:** Solve the unconstrained stationarity

   $$
   \phi'(u)=2A_{\rm PCE}\,u-\Gamma_0\nu\sum_i \frac{\lambda_i^{(s)}}{1+\lambda_i^{(s)} u}=0.
   $$

   Let $u_0\ge 0$ denote the solution.
   – If $g_J(u_0)=M_s\ln(1+x_s u_0)< \ln d_0$: **interior** $(u_s^\*=u_0)$.
   – If $g_J(u_0)= \ln d_0$: **branch boundary** $(u_s^\*=u_0=u^\*_{\rm J})$.
   – If $g_J(u_0)> \ln d_0$: **cap‑active** $\bigl(u_s^\*=u^\*_{\rm J}=(a_{\rm cap}-1)\,M_s/S_1^{(s)}\bigr)$, with $a_{\rm cap}=d_0^{1/M_s}$.
4. **Invariants:** $C_{\rm cap}^{(s)}=\Gamma_0\nu\,S_1^{(s)}$,\quad $C_{\rm cyc}^{(s)}=\Gamma_0\nu\,[\,2\tilde A_{\rm PCE}^{(s)}+S_2^{(s)}\,]$.
5. **U(1)/EM product:** for scales **below** EWSB, $\alpha_{\mathrm{em}}(\mu^\*)=u_e^\*/(4\pi)$. Compute $\alpha_{\mathrm{em}}(\mu^\*)\,(C_{\rm cyc}/C_{\rm cap})_{e}$ and compare to $K(d_0,M_e)/F_{\lambda,e}$; the identity (W.2.6) applies only at the branch boundary with $\sigma_e^2=0$. For scales **above** EWSB, replace with hypercharge/weak couplings as in (W.3.1).
6. **Weinberg angle:** evaluate (W.3.1); if using GUT normalization, use (W.3.3) with $g_1=\sqrt{\tfrac{5}{3}}\,g_Y$.
7. **Reporting:** publish $\{M_s,S_1^{(s)},S_2^{(s)}\}$, $\Gamma_0,\nu$, $d_0$, probe specification, and code.

---

## W.7 Fisher‑operator (SLD) existence: finite‑dimensional setting

**Theorem W.18 (SLD existence and QFI quadratic form).**
Let $\{E_g\}_{g\in\mathbb{R}}$ be a $C^1$ family of CPTP maps on a finite‑dimensional Hilbert space, and let $\rho_0$ be full‑rank and stationary at $g=0$ $(E_0(\rho_0)=\rho_0)$. Then the Symmetric Logarithmic Derivative (SLD) exists at $g=0$, the quantum Fisher information (QFI) is finite, and the SLD‑based QFI defines a positive semidefinite quadratic form on the tangent space at $\rho_0$. In finite dimension, this quadratic form admits a Riesz representation (equivalently, an operator/superoperator representation) with respect to $\rho_0$.

*Sketch.* Standard quantum estimation theory (Helstrom–Holevo–Petz) ensures SLD existence for $C^1$ differentiable state families with full‑rank base state, implying a well‑defined QFI quadratic form representable via SLD at $\rho_0$. $\square$

---

## W.8 Emergent GR: assumptions and controlled deviations

**Theorem W.19 (Einstein dynamics under thermodynamic assumptions).**
Assume: (i) a stable AQFT limit on a Lorentzian manifold; (ii) local thermodynamic equilibrium near local causal horizons (with approximate boost Killing flow); (iii) saturation of the horizon information bound inducing an area law; (iv) the Clausius relation $\delta Q=T\,{\rm d}S$ for local Rindler wedges. Then the macroscopic dynamics obey the Einstein field equations with constant $G$ set by the area–entropy proportionality.

**Proposition W.20 (Leading corrections).**
Deviations from (ii)–(iii) induce effective‑action corrections of the form

$$
S_{\rm grav,eff}=\int d^4x \sqrt{-g}\,\Big[\tfrac{1}{16\pi G}(R-2\Lambda)+c_1 R^2+c_2 R_{\mu\nu}R^{\mu\nu}+\dots\Big],
\tag{W.8.1}
$$

with $c_{1,2}$ controlled by the degree of non‑saturation (entropy deficit) and non‑equilibrium (viscous terms) in the horizon thermodynamics.

---

## W.9 Distinctive mathematical features

**Features.**
* (A) **Alphabet‑constant family** $K(d_0,M)$ with exact identity (W.2.6) in the flat‑spectrum branch‑boundary reference.
* (B) **Convexity and uniqueness** of the coupling‑setting principle (Lemma W.1).
* (C) **Capacity‑aware bounds** that are explicit and saturable under stated conditions (Proposition W.8; Theorem W.10; Corollary W.16).
* (D) **Hypercharge structure** compactly fixed by anomaly + Yukawa relations (Theorem W.14; Corollary W.15).
* (E) **Deterministic pipeline** from axioms/invariants to numbers (W.6).
* (F) **Transparent variance dependence** via $F_\lambda$ (W.2.4), quantifying robustness.
* (G) **Predictive Power:** As shown in **Appendix Z**, this formalism, when combined with the framework's fundamental constants, enables a complete, parameter-free calculation of the fine-structure constant.


