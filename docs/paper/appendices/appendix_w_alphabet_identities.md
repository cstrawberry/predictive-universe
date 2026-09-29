# Appendix W — PU’s Alphabet‑Constant Identities, Robustness, and SM Structure

## W.0 Notation and setup

This appendix derives general, robust identities and bounds relating emergent gauge couplings to the information-theoretic invariants of the MPU's predictive cycle. This formalism provides stringent internal consistency checks for the PU framework. In **Appendix Z**, these principles are applied to a derivation of the MPU's QFI spectrum, culminating in the Thomson-limit sinc-core value $\alpha^{-1}_{0}=137.03609205522863\ldots$ and the certificate row $\alpha^{-1}_{\mathrm{cert}}=\alpha^{-1}_{0}+R_\alpha$ (Theorems Z.24-Z.26; Definition Z.27.11a; Theorem Z.27.11j.1). No continuous fit parameter enters the core formula.

* **Alphabet size:** $d_0\in\{2,3,\dots\}$. PU uses $d_0=8$.
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
  \sum_{i=1}^{M}\ln(1+\lambda_i u)\ \le\ M\ln(1+xu),\quad\text{equality iff }u=0\ \text{or }\lambda_i=x\ \forall i.
  \tag{W.0.3}
  $$
* **Cap constant:**

  $$
  a_{\mathrm{cap}}:=d_0^{1/M},\quad D_{\mathrm{cap}}:=a_{\mathrm{cap}}(a_{\mathrm{cap}}-1),\quad
  K_{\mathrm{alph}}(d_0,M)=\frac{a_{\mathrm{cap}}-1}{4\pi}\Bigl(1+\frac{1}{D_{\mathrm{cap}}}\Bigr).
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

**QFI–capacity surrogate.** Let the finite-dimensional tangent model satisfy the SLD-existence hypotheses of Theorem W.18, and let $\{\lambda_i\}_{i=1}^{M}$ be the nonnegative eigenvalues of its chosen finite-dimensional SLD-QFI quadratic form. As an additional modeling assumption, define the rate term used in (W.0.1) by

$$
g_{\rm true}(u):=\sum_{i=1}^{M}\ln(1+\lambda_i u),\qquad
g_J(u):=M\ln(1+xu),
$$

where $x=S_1/M$. A LAN interpretation of this logarithmic rate formula additionally requires a specified asymptotic statistical experiment and verification of its regularity and convergence hypotheses. The arguments below use the displayed rate formula as a stated surrogate. For that surrogate, $u\mapsto g_{\rm true}(u)$ is concave and nondecreasing, and Jensen's inequality gives $g_{\rm true}(u)\le g_J(u)$ for all $u\ge0$, with equality for $u>0$ iff $\lambda_i=x$ for every $i$. The function $\lambda\mapsto\ln(1+\lambda u)$ is concave for each prescribed $u\ge0$. This appendix assumes that the Standard Model group structure has emerged as described in Appendix G.8 and derives conditional constraints on its couplings from the surrogate and the standing assumptions.

**Standing assumptions.** Throughout this appendix:

$$
\lambda_i\ge 0,\quad A_{\rm PCE}>0,\quad \Gamma_0>0,\quad M\ge 1,\quad d_0\ge 2,\quad x=\tfrac{S_1}{M}>0.
$$

Unless stated otherwise, the **cap-active branch** at $\mu^*$ is considered: the unconstrained minimizer $u_0\ge 0$ of $\phi$ solving $\phi'(u_0)=0$ satisfies
$$
g_J(u_0)>\ln d_0.
\tag{W.0.5}
$$
If instead $g_J(u_0)\le \ln d_0$, the optimum is **interior** $(u^*=u_0)$; the equality case $g_J(u_0)=\ln d_0$ lies on the **branch boundary**.

Condition (W.0.5) is a branch inequality. A Cramér-Rao-Holevo derivation of (W.0.1) is accepted in this appendix only when it supplies, before comparison, the finite LAN/QFI eigenvalue list $\{\lambda_i\}$, the exact local Fisher quadratic cost $A_{\rm PCE}u^2$, the channel-capacity term $\Gamma_0\sum_i\ln(1+\lambda_i u)$, the convex domain $u\ge0$, and the active-cap inequality (W.0.5). Under those entries, Lemma W.1 gives strict convexity, Lemma W.2 gives the Jensen-cap boundary, and the constrained minimizer is theorem-level inside the stated branch. Without (W.0.5), the same potential has an interior branch and the cap-active downstream formulae do not apply.

> **Notation box.** $u=g^2$; $\alpha=g^2/(4\pi)$; $S_1=\sum\lambda_i$; $S_2=\sum\lambda_i^2$; $x=S_1/M$; $\sigma^2=\frac{S_2}{M}-x^2$; $a_{\mathrm{cap}}=d_0^{1/M}$; $D_{\mathrm{cap}}=a_{\mathrm{cap}}(a_{\mathrm{cap}}-1)$; $K_{\mathrm{alph}}(d_0,M)=\frac{a_{\mathrm{cap}}-1}{4\pi}\bigl(1+\frac{1}{D_{\mathrm{cap}}}\bigr)$; $F_\lambda=\frac{M x^2}{S_2}=\frac{1}{1+\sigma^2/x^2}\in(0,1]$.

---

## W.1 Capacity ordering and gap control

**Lemma W.1 (Strict convexity; unique constrained minimizer).**
Under the standing assumptions, $\phi$ is coercive and strictly convex on $[0,\infty)$. It therefore has a unique minimizer on $[0,\infty)$ and a unique minimizer under either the true-capacity or Jensen-capacity constraint.

*Proof.* Twice differentiating (W.0.1) gives
$$
\phi''(u)=2A_{\rm PCE}+\Gamma_0\sum_i\frac{\lambda_i^2}{(1+\lambda_i u)^2}>0,
$$
because $A_{\rm PCE}>0$. Thus $\phi$ is strictly convex. If $\lambda_{\max}=\max_i\lambda_i$, then
$$
\phi(u)\ge A_{\rm PCE}u^2-\Gamma_0M\ln(1+\lambda_{\max}u)\longrightarrow+\infty
$$
as $u\to\infty$, so $\phi$ is coercive. Continuity and coercivity give existence of an unconstrained minimizer, and strict convexity gives uniqueness. Since $x>0$, both $g_{\rm true}$ and $g_J$ are continuous and strictly increasing on $[0,\infty)$: indeed, $g'_{\rm true}(u)=\sum_i\lambda_i/(1+\lambda_i u)>0$ and $g'_J(u)=Mx/(1+xu)>0$. Each feasible set $\{u\ge0:g(u)\le\ln d_0\}$ is therefore a nonempty closed interval containing $0$. The restriction of a strictly convex function to an interval has at most one minimizer, while continuity and compactness give existence. ∎

**Lemma W.2 (Jensen‑cap boundary).**
When the Jensen‑cap is active,

$$
u_{\mathrm J}^*\;=\;\frac{M}{S_1}\bigl(a_{\mathrm{cap}}-1\bigr)\;=\;\frac{a_{\mathrm{cap}}-1}{x}.
\tag{W.1.1}
$$

**Lemma W.3 (Gap monotonicity).**
$\Delta_{\rm cap}(u):=g_J(u)-g_{\rm true}(u)$ satisfies $\Delta_{\rm cap}(u)\ge0$ and $\Delta'_{\rm cap}(u)\ge0$ for all $u\ge0$.

*Proof.* For prescribed $u\ge0$, $f_u(\lambda)=\ln(1+\lambda u)$ is concave because $f_u''(\lambda)=-u^2/(1+\lambda u)^2\le0$. Jensen's inequality therefore gives $\Delta_{\rm cap}(u)\ge0$. Differentiation gives
$$
\Delta'_{\rm cap}(u)=\frac{Mx}{1+xu}-\sum_i\frac{\lambda_i}{1+\lambda_i u}.
$$
At $u=0$, this derivative is $Mx-\sum_i\lambda_i=0$. For $u>0$, let $h_u(\lambda)=\lambda/(1+\lambda u)$. Since $h_u''(\lambda)=-2u/(1+\lambda u)^3<0$, Jensen's inequality gives
$$
\frac1M\sum_i h_u(\lambda_i)\le h_u(x)=\frac{x}{1+xu}.
$$
Substitution into the derivative proves $\Delta'_{\rm cap}(u)\ge0$ for $u>0$ and hence for all $u\ge0$. ∎

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

**Remark: sharper bound.** A per‑eigenvalue refinement is

$$
\Delta_{\rm cap}(u)\ \le\ \frac{u^2}{2}\sum_{i=1}^M\frac{(\lambda_i-x)^2}{\bigl(1+\min\{\lambda_i,x\}\,u\bigr)^2}.
$$

**Remark: large‑$u$ behavior.** As $u\to\infty$, **assuming $\min_i\lambda_i>0$**,

$$
\Delta_{\rm cap}(u)\ \longrightarrow\ M\ln x\ -\ \sum_{i=1}^M\ln\lambda_i.
$$

If some $\lambda_i=0$, the limit diverges accordingly, as expected from the asymptotics.

**Theorem W.5 (Ordering of optima; active‑cap case).**
Assume the upper capacity constraint is active for both problems. Then

$$
u_{\mathrm T}^*\ \ge\ u_{\mathrm J}^*.
\tag{W.1.3}
$$

*Proof.* Since $g_{\mathrm{true}}(u)\le g_J(u)$, the feasible set $\{u:\ g_J(u)\le\ln d_0\}$ is contained in $\{u:\ g_{\mathrm{true}}(u)\le\ln d_0\}$. The maximum admissible $u$ under the true capacity is therefore $\ge$ the Jensen cap; the constrained convex minimum at the active upper boundary is attained at $u_{\mathrm J}^*$ for the Jensen set and at some $u_{\mathrm T}^*\ge u_{\mathrm J}^*$ for the true set. $\square$

---

## W.2 Alphabet constant and product relation

**Definition W.6 (Sector ratio).** For any sector $s$,

$$
r_s:=\Bigl(\frac{C_{\mathrm{cap}}}{C_{\mathrm{cyc}}}\Bigr)_s
=\frac{S_1^{(s)}}{2\tilde A_{\mathrm{PCE}}^{(s)}+S_2^{(s)}}.
\tag{W.2.1}
$$

**Definition W.7 (Alphabet constant).** Given $d_0$ and $M$,

$$
a_{\mathrm{cap}}=d_0^{1/M},\quad D_{\mathrm{cap}}=a_{\mathrm{cap}}(a_{\mathrm{cap}}-1),\quad
K_{\mathrm{alph}}(d_0,M)=\frac{a_{\mathrm{cap}}-1}{4\pi}\Bigl(1+\frac{1}{D_{\mathrm{cap}}}\Bigr).
\tag{W.2.2}
$$

For $(d_0,M_e)=(8,7)$, where $d_0=8$ is the minimal-branch MPU alphabet size (Theorem Z.2; Theorem 23 gives $d_0\ge 8$) and $M_e=7$ on the electromagnetic topological-mode branch — under which the electromagnetic alphabet sector's effective independent information mode count is identified with the seven independent generators of $\pi_2(\Sigma_8) \cong \mathbb{Z}^7$ (Appendix R, Section R.3): $a_{\mathrm{cap}}=8^{1/7}=1.34590019\dots$, $D_{\mathrm{cap}}=0.46554714\dots$,

$$
\boxed{K_{\mathrm{alph}}(8,7)=0.0866517 \quad \text{(on the electromagnetic topological-mode branch)}}.
$$

The Theorem W.10 product inequality holds for any specified $M_e$; the assignment $M_e = 7$ to the electromagnetic alphabet sector requires the topological-mode branch identification. The sensitivity table in §W.2 shows that adjacent values $K_{\mathrm{alph}}(8,6) = 0.0892$, $K_{\mathrm{alph}}(8,7) = 0.0867$, $K_{\mathrm{alph}}(8,8) = 0.0850$ differ by $\sim 2$–$3\%$, so the assignment of $M_e$ is load-bearing for this standalone alphabet identity. (W's identity is not the direct source of the framework's $\alpha^{-1}$ prediction; that derivation in Appendix Z uses $M = 24$ and a different alphabet structure.)

**Proposition W.8 (Cap–coherence curvature bound).**
At the Jensen‑cap boundary $u=u_{\mathrm J}^*$,

$$
2\tilde A_{\mathrm{PCE}}\ \le\ \frac{S_2}{D_{\mathrm{cap}}},
\tag{W.2.3}
$$

with **strict inequality on the cap‑active branch**; equality requires simultaneously a **flat spectrum** $(\sigma^2=0)$ and $u_0=u_{\mathrm J}^*$ (branch boundary).

*Proof.* At $u_{\mathrm J}^*$, the KKT conditions for minimizing $\phi(u)$ subject to $g_J(u)\le\ln d_0$ yield $\exists\,\eta\ge 0$ such that

$$
\phi'(u_{\mathrm J}^*)+\eta\,g_J'(u_{\mathrm J}^*)=0,\qquad g_J'(u)=\frac{Mx}{1+xu}>0.
$$

Hence $\phi'(u_{\mathrm J}^*)=-\eta\,g_J'(u_{\mathrm J}^*)\le 0$, with strict “$<0$” on the cap‑active branch ($\eta>0$). Using concavity of $h(\lambda)=\lambda/(1+\lambda u)$,

$$
\sum_i\frac{\lambda_i}{1+\lambda_i u_{\mathrm J}^*}\ \le\ M\,\frac{x}{1+xu_{\mathrm J}^*} \;=\; M\,\frac{x}{a_{\mathrm{cap}}}.
$$

Thus

$$
0\ \ge\ \phi'(u_{\mathrm J}^*)
=2A_{\mathrm{PCE}}\,u_{\mathrm J}^*-\Gamma_0\sum_i\frac{\lambda_i}{1+\lambda_i u_{\mathrm J}^*}
\ \ge\ 2A_{\mathrm{PCE}}\frac{a_{\mathrm{cap}}-1}{x}-\Gamma_0\,M\frac{x}{a_{\mathrm{cap}}}.
$$

Rearranging gives $2\tilde A_{\mathrm{PCE}}\le (Mx^2)/D_{\mathrm{cap}}$. Since $S_2\ge Mx^2$ (Cauchy–Schwarz / RMS–AM), we obtain $2\tilde A_{\mathrm{PCE}}\le S_2/D_{\mathrm{cap}}$. Equality requires both Jensen tightness ($\lambda_i=x$) and $\eta=0$, i.e., $u_0=u_{\mathrm J}^*$. $\square$

**Definition W.9 (Spectral form factor).**

$$
F_{\lambda}\ :=\ \frac{M\,x^2}{S_2}\ =\ \frac{1}{1+\sigma^2/x^2}\ \in (0,1].
\tag{W.2.4}
$$

For a given sector $s$, write $F_{\lambda,s}:=\dfrac{M_s x_s^2}{S_2^{(s)}}$.

**Theorem W.10 (Alphabet constant: upper bound and identity conditions at the Jensen‑cap–saturated optimum).**
At the **Jensen‑cap–saturated** optimum,

$$ \boxed{\ \alpha_{\mathrm{em}}(\mathrm{MPU})\Bigl(\frac{C_{\mathrm{cyc}}}{C_{\mathrm{cap}}}\Bigr)_{e}\ \le\ K_{\mathrm{alph}}(d_0,M_e)\,\frac{1}{F_{\lambda,e}}\ }, \tag{W.2.5} $$

with **strict inequality on the cap‑active branch**. **Equality** holds **iff** the spectrum is flat $(F_{\lambda,e}=1)$ **and** the unconstrained minimizer lies on the boundary $(u_0=u_{\mathrm J}^*)$, in which case


$$ \boxed{\ \alpha_{\mathrm{em}}(\mathrm{MPU})\Bigl(\frac{C_{\mathrm{cyc}}}{C_{\mathrm{cap}}}\Bigr)_{e}\ =\ K_{\mathrm{alph}}(d_0,M_e)\ }. \tag{W.2.6} $$


*Proof.* From $u_{\mathrm J}^*=(a_{\mathrm{cap}}-1)/x$,

$$ \alpha_{\mathrm{em}}(\mathrm{MPU})\,\frac{C_{\mathrm{cyc}}}{C_{\mathrm{cap}}} =\frac{u_{\mathrm J}^*}{4\pi}\cdot\frac{2\tilde A_{\mathrm{PCE}}+S_2}{S_1} =\frac{a_{\mathrm{cap}}-1}{4\pi}\cdot\frac{2\tilde A_{\mathrm{PCE}}+S_2}{M x^2}. $$

Apply (W.2.3) to obtain the bound with factor $1/F_{\lambda,e}=S_2/(M x^2)$ (for the EM sector). Strictness and equality conditions follow from Proposition W.8 and $F_{\lambda,e}=1\iff \sigma^2=0$. $\square$

**PCE motivation for the identity point.**
 *Relation to the PCE-Attractor.*
 Clause 3 of Definition 15a supplies the flat-spectrum attractor condition, and Proposition W.3a.2 evaluates it on the interface state. Theorem W.3a.3 transfers the flat metric to a generator basis only when that basis is orthonormal with respect to the inherited QFI metric. Clause 4 of Definition 15a places the constrained rate minimum on the declared upper capacity boundary; on the one-dimensional cap-active branch, the unconstrained minimizer lies above that boundary. Equality in (W.2.6) requires a flat spectrum and the branch-boundary condition $u_0=u_{\mathrm J}^*$ of Theorem W.10. Coincidence of the declared and Jensen capacity boundaries alone does not impose this stationarity condition, and the inequality is strict on the cap-active branch. When both caps are active, Theorem W.5 gives $u_{\mathrm T}^*\ge u_{\mathrm J}^*$; Equation (W.2.5) bounds the product evaluated at the Jensen-cap–saturated optimum and supplies no upper bound on its true-capacity value from this ordering alone.

**Sensitivity note (alphabet constant and variance).**
For $d_0=8$, $K_{\mathrm{alph}}(8,M)$ decreases slowly with $M$:
$K_{\mathrm{alph}}(8,5)=0.0935410,\ K_{\mathrm{alph}}(8,6)=0.0892318,\ K_{\mathrm{alph}}(8,7)=0.0866517,\ K_{\mathrm{alph}}(8,8)=0.0849844,\ K_{\mathrm{alph}}(8,9)=0.0838445,\ K_{\mathrm{alph}}(8,10)=0.0830309$.
Variance enters only through $F_\lambda$: the multiplicative penalty is $1/F_\lambda=1+\sigma^2/x^2$.

**Remark.** By Theorem W.5 (active‑cap case), the true‑capacity optimum satisfies $u_{\mathrm T}^*\ge u_{\mathrm J}^*$; the product at the true optimum is therefore $\ge$ its Jensen‑cap value. The bound (W.2.5) is asserted at the Jensen‑cap–saturated optimum.

**Proposition W.10a (Closed-Form Branch Classifier).** Under the standing assumptions, let $u_{\mathrm J}^*=(a_{\mathrm{cap}}-1)/x$ be the Jensen-cap boundary of (W.1.1) and put
$$
\Theta(\lambda;d_0):=\frac{1}{u_{\mathrm J}^*}\sum_{i=1}^M\frac{\lambda_i}{1+\lambda_iu_{\mathrm J}^*}.
\tag{W.2.7}
$$
The unconstrained minimizer $u_0$ of (W.0.1) lies on the cap-active branch, on the branch boundary, or on the interior branch of Section W.0 exactly when
$$
2\tilde A_{\mathrm{PCE}}<\Theta,\qquad 2\tilde A_{\mathrm{PCE}}=\Theta,\qquad 2\tilde A_{\mathrm{PCE}}>\Theta,
$$
respectively. Moreover
$$
\Theta\le\frac{Mx^2}{D_{\mathrm{cap}}}\le\frac{S_2}{D_{\mathrm{cap}}},
\tag{W.2.8}
$$
with equality in the first inequality exactly for a flat spectrum. For a flat spectrum $\lambda_i=\lambda$,
$$
u_0=\frac{\sqrt{1+2M\lambda^2/\tilde A_{\mathrm{PCE}}}-1}{2\lambda},
$$
and the cap-active branch is exactly $2\tilde A_{\mathrm{PCE}}<S_2/D_{\mathrm{cap}}$. For a nonflat spectrum the interval $\Theta\le2\tilde A_{\mathrm{PCE}}<S_2/D_{\mathrm{cap}}$ is nonempty and lies on the branch boundary or the interior branch, so the bound (W.2.3) of Proposition W.8 is necessary but not sufficient for the cap-active branch.

*Proof.* Since $d_0\ge2$ and $M\ge1$, $a_{\mathrm{cap}}>1$, so $u_{\mathrm J}^*>0$ and $g_J(u_{\mathrm J}^*)=M\ln a_{\mathrm{cap}}=\ln d_0$. Lemma W.1 makes $g_J$ strictly increasing, so $g_J(u_0)>\ln d_0$, $g_J(u_0)=\ln d_0$ or $g_J(u_0)<\ln d_0$ exactly when $u_0>u_{\mathrm J}^*$, $u_0=u_{\mathrm J}^*$ or $u_0<u_{\mathrm J}^*$. Because $\phi'(0)=-\Gamma_0S_1<0$, the minimizer satisfies $u_0>0$ and $\phi'(u_0)=0$, and $\phi'$ is strictly increasing because $\phi''>0$ (Lemma W.1). Hence $u_0>u_{\mathrm J}^*$ exactly when $\phi'(u_{\mathrm J}^*)<0$, that is,
$$
2A_{\mathrm{PCE}}u_{\mathrm J}^*<\Gamma_0\sum_{i=1}^M\frac{\lambda_i}{1+\lambda_iu_{\mathrm J}^*},
$$
which is $2\tilde A_{\mathrm{PCE}}<\Theta$; the other two cases follow in the same way with equality and with the reversed inequality. The function $\lambda\mapsto\lambda/(1+\lambda u_{\mathrm J}^*)$ is strictly concave on $[0,\infty)$, so Jensen's inequality gives
$$
\Theta\le\frac{M}{u_{\mathrm J}^*}\,\frac{x}{1+xu_{\mathrm J}^*}=\frac{Mx^2}{(a_{\mathrm{cap}}-1)a_{\mathrm{cap}}}=\frac{Mx^2}{D_{\mathrm{cap}}},
$$
with equality exactly when all $\lambda_i$ are equal, while $Mx^2\le S_2$. For $\lambda_i=\lambda$, which is positive because $x>0$, the equation $\phi'(u)=0$ is $2\tilde A_{\mathrm{PCE}}\lambda u^2+2\tilde A_{\mathrm{PCE}}u-M\lambda=0$, whose positive root is displayed, and $\Theta=M\lambda^2/D_{\mathrm{cap}}=S_2/D_{\mathrm{cap}}$. For a nonflat spectrum $\Theta<Mx^2/D_{\mathrm{cap}}\le S_2/D_{\mathrm{cap}}$, and the classifier places the displayed interval outside the cap-active branch. ∎

**Resolution TV-W-01-R1 (Metadata).** Exact domain: the surrogate potential (W.0.1) under the standing assumptions, for every finite nonnegative spectrum with $x>0$, every $\tilde A_{\mathrm{PCE}}>0$, $M\ge1$ and $d_0\ge2$. Premises: Lemma W.1, (W.0.5) and (W.1.1). Equivalence: the branch label as a function of $(\lambda,\tilde A_{\mathrm{PCE}},d_0)$. Budget: every such datum. Verifier: evaluate $\Theta$ from (W.2.7) and compare it with $2\tilde A_{\mathrm{PCE}}$; independently solve $\phi'(u_0)=0$ and evaluate $g_J(u_0)$. Falsifier: a datum whose branch under (W.0.5) differs from the $\Theta$ comparison, or a nonflat spectrum with $\Theta=Mx^2/D_{\mathrm{cap}}$. Provenance class: target-independent one-dimensional convex analysis. Downstream consumers: Proposition W.8, Theorem W.10, Assumption W.3.A, Section W.6 and `TV-W-01`. Nonvacuity: for the flat spectrum $\lambda_i=1$ at $(d_0,M)=(8,7)$, $\Theta=7/D_{\mathrm{cap}}=15.036071\ldots$, so $\tilde A_{\mathrm{PCE}}<7.518035\ldots$ is cap-active and larger values are interior. Proposition W.10a gives `positive-discharge` of the interior, boundary and cap-active classification component of `TV-W-01` on the surrogate class. Derivation of the finite LAN channel capacity and the PCE quadratic cost from a declared probe, and the convergence certificate, remain open under `TV-W-01`.

---

## W.3 Weak sector relation (Weinberg angle)

**Assumption W.3.A (Alignment hypothesis).**
At the $\mathrm{MPU}$ operational point, assume that PCE places both $U(1)_Y$ and $SU(2)$ sectors on the **cap-active, Jensen-cap-saturated branch**. For each sector $s\in\{Y,2\}$, this requires $g_{J,s}(u_{0,s})>\ln d_0$, where $u_{0,s}$ is its unconstrained minimizer. Comparable $M_s$ and $x_s$ alone do not imply these inequalities: the cost-to-rate ratio and the full spectrum also enter the stationarity equation. The assumption can fail with either both sectors interior or one interior and the other cap-active.

**Theorem W.11 (Weinberg angle from sector invariants; cap‑active branch).**
Under Assumption W.3.A, let $u_s^*$ denote the Jensen‑cap–saturated optimum for sector $s\in\{Y,2\}$. Then

$$ \sin^2\theta_W(\mathrm{MPU})=\frac{u_Y^*}{u_Y^*+u_2^*},\qquad \frac{u_2^*}{u_Y^*}= \frac{(d_0^{1/M_2}-1) / (S_1^{(2)}/M_2)}{(d_0^{1/M_Y}-1) / (S_1^{(Y)}/M_Y)}. \tag{W.3.1} $$

*Proof.* $\sin^2\theta_W=g_Y^2/(g_Y^2+g_2^2)$ and $u=g^2$. Apply Lemma W.2 in each sector. $\square$

**Normalization.** Equation (W.3.1) uses **SM (canonical) normalization** $g_Y$. For **GUT normalization**, $g_1=\sqrt{\tfrac{5}{3}}\,g_Y$ (equivalently $g_Y=\sqrt{\tfrac{3}{5}}\,g_1$).

**Corollary W.12 (Symmetric sector reference).**
Under Assumption W.3.A, if $M_Y=M_2=M$ and $x_Y=x_2=x_0$, then the two Jensen-cap-saturated optima satisfy $u_2^*/u_Y^*=1$ and

$$ \sin^2\theta_W(\mathrm{MPU})=\tfrac12. \tag{W.3.2} $$

**Proposition W.13 (Full-Block Common-Stiffness Normalization).** On the complex electroweak carrier
$$
W_5\cong\mathbb C^3\oplus\mathbb C^2
$$
of Definition T.14a, take
$$
T_3=\operatorname{diag}(0,0,0,\tfrac12,-\tfrac12),
\qquad
\frac Y2
=\operatorname{diag}(-\tfrac13,-\tfrac13,-\tfrac13,\tfrac12,\tfrac12).
$$
Then
$$
\operatorname{Tr}(T_3^2)=\frac12,
\qquad
\operatorname{Tr}\!\left((Y/2)^2\right)=\frac56.
$$
The unit-normalized hypercharge direction is
$$
T_Y=\sqrt{\frac35}\,\frac Y2.
$$
Assume that at the matching scale the gauge-kinetic quadratic form on the registered electroweak generator image is exactly
$$
B(X,Y)=c\,\operatorname{Tr}_{W_5}(XY),
\qquad c>0,
$$
with no independent $U(1)$ coefficient. A QFI realization establishes this premise only when it supplies an injective response map $R$ from gauge-generator space and proves $R^*g_{\mathrm{QFI}}=B$ with the same $c$ on both sectors. Then $g_1=g_2$ in the resulting unit normalization and
$$
g_Y=\sqrt{\frac35}\,g_2,
\qquad
\boxed{
\sin^2\theta_W
=\frac{g_Y^2}{g_Y^2+g_2^2}
=\frac38.
}
\tag{W.3.3}
$$

*Proof.* The two traces are direct diagonal sums. Multiplication by $\sqrt{3/5}$ makes $\operatorname{Tr}(T_Y^2)=1/2=\operatorname{Tr}(T_3^2)$. The explicit form $B=c\operatorname{Tr}_{W_5}$ supplies the same quadratic coefficient for these unit-normalized directions. Undoing the hypercharge normalization gives $g_Y=\sqrt{3/5}\,g_2$, and substitution gives $3/(3+5)=3/8$. The flat active-interface QFI by itself does not identify gauge-vertical directions and is not used as a coupling-ratio proof. ∎

The result is exact on the full-block common-stiffness branch. A $3{:}1$ count of generators is not its proof and, inserted into the separate Jensen-cap formula (W.3.1) with flat sector weights, would not give $3/8$.

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

**Proposition W.3a.2 (Flat Spectrum).** At the PCE-Attractor (Definition 15a), the QFI spectrum is flat:
$$\lambda_i = \lambda_0 = 1 \quad \forall i \in \{1, \ldots, M\}$$

*Proof.* This is Theorem Z.5 (Steps 5–6) after the direct SLD-QFI calculation. For $\rho_0=I_a/a\oplus0_b$, every Hilbert-Schmidt normalized active-inactive Hermitian interface generator has
$$
F_Q[\rho_0,G]=\frac{2}{a}.
$$
At the PCE-Attractor $a=2$, so each real interface basis direction has QFI eigenvalue $1$. This establishes flatness without requiring transitivity of $S(U(a)\times U(b))$ on the full interface unit sphere. ∎

### W.3a.3 Uniform Per-Generator Capacity

**Theorem W.3a.3 (Uniform Capacity on a Registered Gauge-Response Image).** Assume a registered injective linear response map $R:\mathfrak g_{\mathrm{SM}}\to T_{\rho_0}\mathrm{Gr}(2,8)$ and describe each sector in a basis orthonormal for the pullback $R^*g_{\mathrm{QFI}}$. At the PCE attractor, every such basis generator carries equal QFI capacity:
$$\lambda_i^{(s)} = \lambda_0 = 1 \quad \text{for all generators in that orthonormal basis.}$$

*Proof.*

**Step 1.** The full 24-dimensional interface has flat QFI spectrum $g_{\mathrm{QFI}} = \lambda_0 \cdot I_{24}$ (Proposition W.3a.2).

**Step 2.** By hypothesis, the registered injection $R$ supplies $\mathcal I_{\mathrm{SM}}:=R(\mathfrak g_{\mathrm{SM}})\subset T_{\rho_0}\mathrm{Gr}(2,8)$ and $\mathcal I_s:=R(\mathfrak g_s)$. The dimension inequality $12\le24$ alone neither constructs $R$ nor identifies gauge-vertical directions.

**Step 3.** Restriction of the flat metric to any subspace remains flat: $g_{\mathrm{QFI}}|_{\mathcal{I}_s} = \lambda_0 \cdot I_{M_s}$.

**Step 4.** In a basis orthonormal with respect to this inherited metric, every basis vector has the same norm and therefore the same single-generator QFI weight $\lambda_0$. This is the sense in which PCE isotropy enforces equal per-generator capacity. The theorem does not equate gauge couplings or gauge-kinetic coefficients; that conclusion requires Proposition W.13's common-stiffness pullback premise. $\square$

**Theorem W.3a.3a (Invariant Gauge-Kinetic Forms and Flat-QFI Embedding Moduli).** Write
$$
\mathfrak g_{\mathrm{SM}}
=\mathfrak{su}(3)\oplus\mathfrak{su}(2)\oplus\mathfrak u(1)
$$
and fix on its three labeled ideals the positive trace forms $b_3,b_2,b_1$ in the generator normalization of Proposition W.13. Every positive-definite symmetric $\operatorname{Ad}$-invariant bilinear form on $\mathfrak g_{\mathrm{SM}}$ is uniquely
$$
B_{\mathbf c}
=c_3b_3\oplus c_2b_2\oplus c_1b_1,
\qquad
(c_3,c_2,c_1)\in\mathbb R_{>0}^3.
\tag{W.3a.3a.1}
$$
Let $(E,g_0,\omega_0)$ be the flat $24$-dimensional QFI interface of Proposition W.3a.2 with its compatible symplectic form. For every $B_{\mathbf c}$ there exists an injective linear map
$$
R_{\mathbf c}:\mathfrak g_{\mathrm{SM}}\longrightarrow E,
\qquad
R_{\mathbf c}^*g_0=B_{\mathbf c},
\qquad
\omega_0|_{R_{\mathbf c}(\mathfrak g_{\mathrm{SM}})}=0.
\tag{W.3a.3a.2}
$$
After fixing one $B_{\mathbf c}$-orthonormal ordered domain frame, all maps satisfying (W.3a.3a.2) form a $U(12)$ torsor; if the isotropy condition is dropped, all metric injections form the Stiefel manifold
$$
V_{12}(\mathbb R^{24})\cong O(24)/O(12).
\tag{W.3a.3a.3}
$$
In particular, flat ambient QFI permits every coefficient triple in (W.3a.3a.1). The electroweak common-stiffness premise of Proposition W.13 is the proper sublocus $c_1=c_2$ in these fixed trace normalizations, so it is not forced by flatness. Nor does the unmarked metric/symplectic data select a canonical injection: the full target-frame group acts nontrivially and transitively on the corresponding frame family.

*Proof.* If $i\ne j$, invariance and $[\mathfrak g_i,\mathfrak g_j]=0$ give
$$
B([x,y],z)=B(x,[y,z])=0
\qquad
(x,y\in\mathfrak g_i,\ z\in\mathfrak g_j).
$$
Each simple ideal is perfect, so all cross terms with another ideal, including the central $\mathfrak u(1)$ ideal, vanish. On each compact simple ideal an invariant symmetric form is a scalar multiple of its fixed trace form; the one-dimensional central restriction is also a scalar. Positive definiteness is exactly $c_i>0$, proving (W.3a.3a.1).

Choose a $B_{\mathbf c}$-orthonormal ordered basis $(e_1,\ldots,e_{12})$ and a $g_0$-orthonormal Lagrangian frame $(v_1,\ldots,v_{12})$ in $E$. The rule $R_{\mathbf c}e_i=v_i$ proves (W.3a.3a.2). The compatible unitary group acts simply transitively on ordered orthonormal Lagrangian frames, giving the $U(12)$ torsor. Without the Lagrangian condition, ordered orthonormal $12$-frames are exactly $O(24)/O(12)$. Taking, for example, $c_1\ne c_2$ supplies a retained positive invariant form and an exact flat-QFI embedding outside the common-stiffness locus. ∎

| Resolution-artifact field | `W.3a.3a-R1` record |
|---|---|
| Catalog binding and outcome | `TV-W-03`: `negative-refutation` of flat-QFI forcing of common stiffness and complete classification of the invariant-form/bare-linear-isotropic-embedding component; typed response, update, and observable intertwiner classification remains `M`-open, followed by its `C+R` population and realization gates. `TV-G-11`: `nonentailment` of a canonical unmarked metric-linear injection; its marked code, Lie-bracket, update, polarization, and response equivariance gates remain open |
| Exact domain | Positive invariant forms on the labeled compact reductive algebra $\mathfrak g_{\mathrm{SM}}$ and injective linear metric maps into the exact flat $24$-dimensional interface, with the optional stated Lagrangian condition |
| Premises | Fixed trace normalization $b_i$, Proposition W.3a.2's flat metric, and the canonical interface symplectic form; no physical gauge-response map is presumed |
| Equivalence relation | Factor-preserving gauge-algebra automorphisms that preserve the specified trace forms $b_3,b_2,b_1$, and target $U(12)$ transformations for Lagrangian frames, or $O(24)$ for metric-only frames; the three stiffness coefficients remain labeled invariants |
| Budget and verifier | Closed-form all-coefficient and all-frame classification; verify invariance identities, positivity, pullback Gram matrices, isotropy, and the two homogeneous-space stabilizers exactly |
| Falsifier | A positive invariant form with a cross term or non-scalar simple-ideal restriction, a coefficient triple with no displayed injection, or a canonical injection fixed by the full unmarked target-frame action |
| Provenance class | Target-independent compact-Lie-algebra and finite-dimensional metric/symplectic linear algebra |
| Nonvacuity | $\mathbf c=(1,1,1)$ gives the common form, while $\mathbf c=(1,2,1)$ gives an anisotropic positive form; both embed into any fixed standard Lagrangian $12$-plane |
| Downstream consumers | Proposition W.13, Corollary G.8.2f, Theorems G.8.7b/G.8.7f, `TV-W-03`, `TV-G-11`, `RT-T1`, and `RT-T7`; a positive coupling claim still needs a populated physical response map selecting $c_1=c_2$ and preserving the registered dynamics and observables |

### W.3a.4 Mode Ratio and Electroweak Structure

**Remark W.3a.4: Mode Ratio.** At the PCE-Attractor with uniform per-generator capacity, the mode ratio is:

$$\frac{M_2}{M_Y} = \frac{3}{1} = 3$$

At the PU specified point $\mathfrak{A}_{PU}$ and its matching to the SM at scale $\mu_G$ (Appendix T, Section T.13), the gauge-kinetic normalization fixes the PU-normalized tree-level value $\sin^2\theta_W^{(0)}=3/8$ (Appendix T, Theorem T.14). Standard-model renormalization group evolution to $M_Z$ gives the displayed one-loop diagnostic of Theorems T.16 and T.18 on the comparison run with external threshold input $(\Delta_1,\Delta_2,\Delta_3)=(15.14,20.94,18.41)$, equivalently $Z_i=1+\Delta_i/24$. On the literal-spectrum, active-gauge-trivial branch of Remark T.17a.3, the candidate map $\Delta=T_0F$ requires $5\Delta_1-3\Delta_2-2\Delta_3=0$; the displayed tuple violates this relation and is excluded for every sector vector $F$ (Proposition T.17a.5). Theorem T.78.5 separately records the absence of an accepted PU-internal spectral branch package. A physical Z-pole prediction requires both a represented spectrum and its normalized physical matching map.

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

This simultaneously cancels the mixed gravitational–$U(1)_Y$ anomaly $\sum Y=-N_cY_Q+Y_H=0$. This sum is over the left-chiral fermion content; the Higgs doublet, being a scalar, does not contribute.

*Proof.* Write $q=Y_Q$, $\ell=Y_L$, and $h=Y_H$. The $SU(2)^2U(1)_Y$ anomaly condition gives $N_cq+\ell=0$, hence $\ell=-N_cq$. The Yukawa relations give
$$
Y_u=q+h,\qquad Y_d=q-h,\qquad Y_e=\ell-h.
$$
Therefore
$$
\begin{aligned}
\mathcal A_{Y^3}
&=N_c\left(2q^3-(q+h)^3-(q-h)^3\right)
 +2\ell^3-(\ell-h)^3\\
&=-6N_cqh^2+\ell^3+3\ell^2h-3\ell h^2+h^3\\
&=-N_c^3q^3+3N_c^2q^2h-3N_cqh^2+h^3\\
&=-(N_cq-h)^3.
\end{aligned}
$$
Thus $\mathcal A_{Y^3}=0$ implies $h=N_cq$. The mixed gravitational anomaly is
$$
N_c(2q-Y_u-Y_d)+(2\ell-Y_e)
=0+(\ell+h)
=-N_cq+h
=0.
$$
Substitution of $h=N_cq$ and $\ell=-N_cq$ into the Yukawa relations yields Equation (W.4.3). ∎

**Theorem W.14a (Complete One-Sterile Local Anomaly--Yukawa Moduli).** Enlarge Theorem W.14's one-family matter content by one right-handed neutrino
$$
\nu_R:(\mathbf1,\mathbf1)_{Y_\nu}
$$
and require its Dirac Yukawa coupling to the same Higgs doublet. For fixed $N_c$, every real hypercharge assignment satisfying all Yukawa relations and all perturbative local gauge and mixed-gravitational anomaly equations is, and only is,
$$
\begin{aligned}
Y_Q&=q,&Y_L&=-N_cq,&Y_H&=h,\\
Y_u&=q+h,&Y_d&=q-h,&Y_e&=-N_cq-h,&Y_\nu&=-N_cq+h,
\end{aligned}
\qquad(q,h)\in\mathbb R^2.
\tag{W.14a.1}
$$
The $SU(2)$ global anomaly additionally requires $N_c+1$ even. Modulo a nonzero common real rescaling, the nonzero local-charge solutions form $\mathbb{RP}^1$. For $N_c=3$ the two parameters are equivalently the coefficients of Standard Model hypercharge and $B-L$:
$$
Y(q,h)=hY_{\mathrm{SM}}+(3q-h)(B-L).
\tag{W.14a.2}
$$
Thus adding one Dirac-coupled sterile neutrino removes the local-anomaly uniqueness of Theorem W.14. A compact global $U(1)$ form and primitive character lattice restrict (W.14a.1) to their allowed lattice directions but are additional data and are not classified by this local theorem.

*Proof.* Yukawa invariance gives
$$
Y_u=q+h,
\quad Y_d=q-h,
\quad Y_e=\ell-h,
\quad Y_\nu=\ell+h.
$$
The pure $SU(N_c)^3$ coefficient is $2-1-1=0$, and the perturbative $SU(2)^3$ anomaly vanishes by pseudoreality.
The $SU(N_c)^2U(1)$ equation is then $2q-Y_u-Y_d=0$, and the $SU(2)^2U(1)$ equation is $N_cq+\ell=0$, hence $\ell=-N_cq$. The cubic anomaly becomes
$$
\begin{aligned}
\mathcal A_{Y^3}
&=N_c\bigl(2q^3-(q+h)^3-(q-h)^3\bigr)\\
&\quad+2\ell^3-(\ell-h)^3-(\ell+h)^3\\
&=-6h^2(N_cq+\ell)=0.
\end{aligned}
$$
The mixed gravitational anomaly vanishes identically:
$$
N_c(2q-Y_u-Y_d)+(2\ell-Y_e-Y_\nu)=0.
$$
Thus $q$ and $h$ are free and (W.14a.1) is both necessary and sufficient for the perturbative local equations. The number of left-handed $SU(2)$ doublets is $N_c+1$, giving the stated Witten parity condition. Equation (W.14a.2) follows by comparing the $(Y_Q,Y_H)$ pairs $(1/3,1)$ and $(1/3,0)$ of $Y_{\mathrm{SM}}$ and $B-L$. ∎

| Resolution-artifact field | `W.14a-R1` record |
|---|---|
| Catalog binding and outcome | `TV-W-05`; `negative-refutation` of unique hypercharge on the exact one-Higgs, one-Dirac-sterile local-anomaly branch and `positive-discharge` of that branch's complete real solution moduli; broader sterile, family, Higgs, defect, and global-form classification remains `M`-open |
| Exact domain | One $Q_L,u_R,d_R,L_L,e_R,\nu_R$ family, one Higgs doublet, all four displayed Yukawa couplings, fixed $N_c$, and perturbative local plus mixed-gravitational anomalies; Witten parity is recorded separately |
| Premises | Standard left-chiral anomaly signs and Theorem W.14's doubled-hypercharge convention $Q=T_3+Y/2$ |
| Equivalence relation | Nonzero common real charge rescaling on the local Lie-algebra branch; compact character-lattice and center-quotient equivalence is excluded from this scope |
| Budget and verifier | Symbolic exhaustion of every $(q,\ell,h,Y_u,Y_d,Y_e,Y_\nu)\in\mathbb R^7$ satisfying the displayed linear relations and anomaly polynomials; substitute (W.14a.1) and reverse-eliminate the equations |
| Falsifier | A real solution of the frozen equations outside (W.14a.1), or a member of (W.14a.1) with a nonzero perturbative local or mixed-gravitational anomaly |
| Provenance class | Target-independent exact anomaly algebra with no measured charge value used as an input |
| Nonvacuity | At $N_c=3$, $(q,h)=(1/3,1)$ is the Standard Model-hypercharge point and $(q,h)=(1/3,0)$ is the distinct $B-L$ point |
| Downstream consumers | Theorem W.14, `TV-W-05`, the hypercharge-lattice component of `TV-G-07/08`, and `RT-T1`; physical charge quantization and a unique matter/EWSB branch still require the global-form, primitive-lattice, anomaly-bordism, response, and PCE-gap records |

**Theorem W.14b (Complete Common-Higgs Multiple-Family Local Moduli).** Fix $N_c$ and $F\ge1$ fermion families, each containing $Q_{L,f},u_{R,f},d_{R,f},L_{L,f},e_{R,f},\nu_{R,f}$. Let one Higgs doublet of hypercharge $h$ supply the four family-diagonal Dirac Yukawa couplings in every family. Then every real assignment satisfying all Yukawa relations and perturbative local gauge and mixed-gravitational anomaly equations is, and only is,
$$
\begin{aligned}
Y_{Q_f}&=q_f,&Y_{L_f}&=\ell_f,
&Y_{u_f}&=q_f+h,&Y_{d_f}&=q_f-h,\\
Y_{e_f}&=\ell_f-h,&Y_{\nu_f}&=\ell_f+h,
&&\sum_{f=1}^F(N_cq_f+\ell_f)=0.
\end{aligned}
\tag{W.14b.1}
$$
The real solution space has dimension $2F$. The $SU(2)$ global anomaly additionally requires $F(N_c+1)$ even. If several Higgs doublets are all required to couple to the same fixed up- or down-type fermion fields, their hypercharges are equal. Higgs doublets absent from the retained Yukawa graph are scalars and add unconstrained local-Lie-algebra hypercharge moduli; compact character lattices and global form remain separate.

*Proof.* Family-diagonal Yukawa invariance gives the four displayed charge relations. The $SU(N_c)^2U(1)$ anomaly cancels in each family. The only remaining linear nonabelian condition is
$$
\sum_f(N_cq_f+\ell_f)=0.
$$
For family $f$, direct substitution gives cubic contribution
$$
-6h^2(N_cq_f+\ell_f),
$$
so the same linear equation makes the total cubic anomaly vanish. When $h=0$, the cubic anomaly vanishes for every $(q_f,\ell_f)$; the independent $SU(2)^2U(1)$ condition still imposes the displayed linear equation. The mixed gravitational contribution is
$$
N_c(2q_f-Y_{u_f}-Y_{d_f})
+2\ell_f-Y_{e_f}-Y_{\nu_f}=0
$$
in every family. Thus (W.14b.1) is necessary and sufficient. It has $2F+1$ variables $(q_f,\ell_f,h)$ and one independent linear equation, giving dimension $2F$. There are $F(N_c+1)$ left-handed doublets, proving the parity condition. Finally, two Yukawa equations $Y_{u_f}=q_f+h_j=q_f+h_{j'}$, or their down-type analogues, force $h_j=h_{j'}$. A scalar absent from all such equations contributes to no fermion anomaly polynomial, proving the inert-Higgs statement. ∎

This theorem discharges the arbitrary-family common-Higgs branch and the all-active-multiple-Higgs reduction. General Yukawa graphs with different Higgs assignments, additional sterile or defect representations, and compact primitive-lattice/global-form classification remain separate branches. Theorem W.14c classifies every one-family doublet-Yukawa graph, Theorem W.14e the Yukawa-uncoupled singlet extensions of Theorems W.14 and W.14b, and Theorem W.14f the compact primitive lattices and central global forms of the common-Higgs branch.

**Resolution record W.14b-R1 (`TV-W-05`, common-Higgs family component).** Theorem W.14b gives `positive-discharge` of every finite family count $F\ge1$ with family-diagonal Dirac Yukawa couplings to one common Higgs, including family-nonuniversal charges, and proves that any additional Higgs coupled to the same fixed fermion fields has the same hypercharge. Equivalence is nonzero common real rescaling on the local Lie-algebra branch. The verifier substitutes (W.14b.1) into every perturbative anomaly polynomial and checks the one remaining linear equation; any solution outside (W.14b.1), or any member with a nonzero listed anomaly, falsifies the record. General Yukawa assignment graphs, extra representations, compact primitive lattices, and global form remain outside this component.

**Theorem W.14c (Complete One-Family Local Moduli for Arbitrary Doublet-Yukawa Graphs).** Fix $N_c\ge2$ and one family with the fields and doubled-hypercharge convention of Theorem W.14, optionally enlarged by $\nu_R:(\mathbf1,\mathbf1)_{Y_\nu}$. Let $\mathcal C=\{u,d,e\}$, or $\mathcal C=\{u,d,e,\nu\}$ when $\nu_R$ is present. For $c\in\mathcal C$ let $D(c)=Q_L$ if $c\in\{u,d\}$, $D(c)=L_L$ if $c\in\{e,\nu\}$, and $S(c)=c_R$, and put
$$
\delta_c:=Y_{S(c)}-Y_{D(c)}.
$$
A doublet-Yukawa graph $\Gamma=(\mathcal H,I)$ consists of a finite set $\mathcal H$ of Higgs doublets $H_a:(\mathbf1,\mathbf2)_{h_a}$ and a set $I\subset\mathcal C\times\mathcal H\times\{\pm1\}$ of incidences. The incidence $(c,a,+1)$ retains the operator $\overline{D(c)}\,\widetilde H_a\,S(c)$ with $\widetilde H_a=i\sigma_2H_a^*$, and $(c,a,-1)$ retains $\overline{D(c)}\,H_a\,S(c)$. Gauge invariance of the retained operators is
$$
\delta_c=\varepsilon h_a\qquad\bigl((c,a,\varepsilon)\in I\bigr).
\tag{W.14c.1}
$$
The graph of Theorem W.14 is $\{(u,H,+1),(d,H,-1),(e,H,-1)\}$, and Theorem W.14a adds $(\nu,H,+1)$.

1. The perturbative local gauge and mixed-gravitational anomaly equations alone have the real solution set $V$ equal, without $\nu_R$, to the union of the three lines
$$
\begin{aligned}
\ell_\pm&:\ (Y_Q,Y_u,Y_d,Y_L,Y_e)=q\,(1,\,1\pm N_c,\,1\mp N_c,\,-N_c,\,-2N_c),\\
\ell_0&:\ (Y_Q,Y_u,Y_d,Y_L,Y_e)=t\,(0,1,-1,0,0),
\end{aligned}
\tag{W.14c.2}
$$
and, with $\nu_R$, to the union of the three planes
$$
\begin{aligned}
\Pi_\pm&:\ (Y_Q,Y_u,Y_d,Y_L,Y_e,Y_\nu)=(q,\,q+t,\,q-t,\,-N_cq,\,-N_cq\mp t,\,-N_cq\pm t),\\
\Pi_0&:\ (Y_Q,Y_u,Y_d,Y_L,Y_e,Y_\nu)=(0,\,t,\,-t,\,0,\,-s,\,s),
\end{aligned}
\tag{W.14c.3}
$$
with $q,t,s\in\mathbb R$. The line $\ell_+$ is (W.4.3), the plane $\Pi_+$ is (W.14a.1) with $h=t$, and the line $\ell_{B-L}:=\Pi_+\cap\Pi_-=\{t=0\}$ carries quark hypercharge $q$ and lepton hypercharge $-N_cq$. The relabeling $u_R\leftrightarrow d_R$ exchanges $\ell_+$ with $\ell_-$; each of the relabelings $u_R\leftrightarrow d_R$ and $e_R\leftrightarrow\nu_R$ exchanges $\Pi_+$ with $\Pi_-$; both preserve $\ell_0$ and $\Pi_0$.
2. For every graph $\Gamma$, the real solutions of (W.14c.1) together with all perturbative local gauge and mixed-gravitational anomaly equations are exactly the pairs $(Y,h)$ with
$$
Y\in V\cap L_\Gamma,
\qquad
h_a=\varepsilon\,\delta_c(Y)\ \ \bigl((c,a,\varepsilon)\in I\bigr),
$$
and $h_a\in\mathbb R$ free for every doublet without incidence, where
$$
L_\Gamma:=\bigl\{Y:\ \varepsilon\,\delta_c(Y)=\varepsilon'\,\delta_{c'}(Y)\ \text{whenever }(c,a,\varepsilon),(c',a,\varepsilon')\in I\bigr\}.
$$
3. On the components of $V$,
$$
\begin{array}{c|c|c}
\text{component}&\text{parameters}&(\delta_u,\delta_d,\delta_e\,[,\delta_\nu])\\\hline
\ell_+&q&N_cq\,(1,-1,-1)\\
\ell_-&q&N_cq\,(-1,1,-1)\\
\ell_0&t&(t,-t,0)\\
\Pi_+&(q,t)&t\,(1,-1,-1,1)\\
\Pi_-&(q,t)&t\,(1,-1,1,-1)\\
\Pi_0&(t,s)&(t,-t,-s,s)
\end{array}
\tag{W.14c.4}
$$
Call $\Gamma$ balanced for a sign vector $\sigma$ on a channel subset $\mathcal C'\subset\mathcal C$ when $\varepsilon\sigma_c=\varepsilon'\sigma_{c'}$ for every two incidences $(c,a,\varepsilon),(c',a,\varepsilon')$ with a common doublet and $c,c'\in\mathcal C'$, including $c=c'$. Put $\sigma_+=(1,-1,-1)$ and $\sigma_-=(-1,1,-1)$ on $(u,d,e)$, $\tau=(1,-1)$ on $(u,d)$, $\kappa=(-1,1)$ on $(e,\nu)$, and $\rho_\pm=(1,-1,\mp1,\pm1)$ on $(u,d,e,\nu)$. Then:
   - (a) $\ell_\pm\subset L_\Gamma$ if $\Gamma$ is balanced for $\sigma_\pm$ on $\mathcal C$; otherwise $\ell_\pm\cap L_\Gamma=\{0\}$.
   - (b) $\ell_0\subset L_\Gamma$ if no doublet carries incidences with both $e$ and a quark channel and $\Gamma$ is balanced for $\tau$ on $\{u,d\}$; otherwise $\ell_0\cap L_\Gamma=\{0\}$.
   - (c) $\Pi_\pm\subset L_\Gamma$ if $\Gamma$ is balanced for $\rho_\pm$ on $\mathcal C$; otherwise $\Pi_\pm\cap L_\Gamma=\ell_{B-L}$.
   - (d) $\Pi_0\cap L_\Gamma$ is the subspace of $(t,s)$ cut out by $t=0$ if $\Gamma$ is not balanced for $\tau$ on $\{u,d\}$, by $s=0$ if it is not balanced for $\kappa$ on $\{e,\nu\}$, and by $\varepsilon\tau_c\,t=\varepsilon'\kappa_{c'}\,s$ for every doublet carrying incidences $(c,a,\varepsilon)$ with $c\in\{u,d\}$ and $(c',a,\varepsilon')$ with $c'\in\{e,\nu\}$.
4. Every graph has $N_c+1$ left-handed $SU(2)$ doublets, so the $SU(2)$ global anomaly requires $N_c+1$ even for every $\Gamma$.

*Proof.* The $SU(N_c)^2U(1)$, $SU(2)^2U(1)$ and mixed-gravitational equations are
$$
2Y_Q-Y_u-Y_d=0,\qquad N_cY_Q+Y_L=0,\qquad N_c(2Y_Q-Y_u-Y_d)+2Y_L-Y_e-Y_\nu=0,
$$
with the $Y_\nu$ term absent without $\nu_R$. Writing $Y_Q=q$, $Y_u=q+t$ and $Y_d=q-t$, they give $Y_L=-N_cq$ and either $Y_e=-2N_cq$ or $Y_e=-N_cq-s$, $Y_\nu=-N_cq+s$. The pure $SU(N_c)^3$ coefficient is $2-1-1=0$, and the perturbative $SU(2)^3$ anomaly vanishes. The cubic hypercharge anomaly becomes
$$
\mathcal A_{Y^3}=-6N_cqt^2+2(-N_cq)^3-(-2N_cq)^3=6N_cq\,(N_cq-t)(N_cq+t)
$$
without $\nu_R$ and
$$
\mathcal A_{Y^3}=-6N_cqt^2-6(-N_cq)s^2=6N_cq\,(s-t)(s+t)
$$
with $\nu_R$. Since $N_c\ne0$, the zero set is $q=0$ or $t=\pm N_cq$, respectively $q=0$ or $s=\pm t$; these are (W.14c.2) and (W.14c.3). The relabelings act by $t\mapsto-t$ and $s\mapsto-s$.

The Yukawa equations (W.14c.1) do not enter the anomaly polynomials. A doublet with incidences has $h_a=\varepsilon\delta_c$ for each of them, and these values agree exactly on $L_\Gamma$; a doublet without incidence enters no equation, because scalars contribute to no fermion anomaly polynomial. This proves item 2. Substituting the parametrizations into $\delta_c$ gives (W.14c.4). On $\ell_\pm$ a relation $\varepsilon\delta_c=\varepsilon'\delta_{c'}$ reads $(\varepsilon\sigma_{\pm,c}-\varepsilon'\sigma_{\pm,c'})N_cq=0$, which holds identically or forces $q=0$. On $\ell_0$ a relation between quark channels reads $(\varepsilon\tau_c-\varepsilon'\tau_{c'})t=0$, a relation between $e$ and $e$ reads $0=0$, and a relation between $e$ and a quark channel $c'$ reads $\varepsilon'\tau_{c'}t=0$. On $\Pi_\pm$ a relation reads $(\varepsilon\rho_{\pm,c}-\varepsilon'\rho_{\pm,c'})t=0$ and leaves $q$ free. On $\Pi_0$, $\delta_c=\tau_ct$ for quark channels and $\delta_c=\kappa_cs$ for lepton channels, so the relations are the displayed linear equations. This proves item 3. Finally $Q_L$ supplies $N_c$ doublets and $L_L$ supplies one. ∎

**Corollary W.14d (Yukawa-Graph Criterion for Standard Model Hypercharge).** Let $\Gamma$ be a one-family doublet-Yukawa graph as in Theorem W.14c.

1. Without $\nu_R$, the fermion charge vectors of the solutions of $\Gamma$ form exactly one of the lines $\ell_+$ and $\ell_-$, namely the Standard Model line (W.4.3) or its image under $u_R\leftrightarrow d_R$, if and only if $\Gamma$ is balanced for $\sigma_+$ or for $\sigma_-$ and some doublet carries incidences with $e$ and with a quark channel. On that branch every doublet with an incidence has hypercharge $\pm N_cY_Q$. If no doublet links $e$ with a quark channel and $\Gamma$ is balanced for $\tau$ on $\{u,d\}$, the line $\ell_0$, on which hypercharge acts only on $u_R$ and $d_R$, consists of fermion charge vectors of solutions.
2. With $\nu_R$, the fermion charge vectors of the solutions of every $\Gamma$ contain $\ell_{B-L}$, with every doublet that carries an incidence neutral there. No one-family doublet-Yukawa graph with a right-handed neutrino has the Standard Model ray as its unique fermion charge ray.

*Proof.* By Theorem W.14c, without $\nu_R$ the fermion charge vectors of the solutions form the union of those lines among $\ell_+,\ell_-,\ell_0$ that lie in $L_\Gamma$. Suppose $\Gamma$ is balanced for $\sigma_+$ and a doublet $a$ carries $(e,a,\varepsilon)$ and $(c,a,\varepsilon')$ with $c\in\{u,d\}$. Then $\ell_+\subset L_\Gamma$, item 3(b) excludes $\ell_0$, and balance for $\sigma_-$ would require $-\varepsilon=\varepsilon'\sigma_{-,c}=-\varepsilon'\sigma_{+,c}$ together with $-\varepsilon=\varepsilon'\sigma_{+,c}$, which is impossible. Hence the union is $\ell_+$; the case $\sigma_-$ is its image under $u_R\leftrightarrow d_R$. Conversely, if the union is $\ell_+$ or $\ell_-$, then $\ell_0\cap L_\Gamma=\{0\}$ and $\Gamma$ is balanced for $\sigma_+$ or $\sigma_-$. Both restrict to $\pm\tau$ on $\{u,d\}$, so $\Gamma$ is balanced for $\tau$ there, and item 3(b) then requires a doublet linking $e$ with a quark channel. On $\ell_\pm$, $h_a=\varepsilon\delta_c=\varepsilon\sigma_{\pm,c}N_cq$ with $Y_Q=q$. The statement on $\ell_0$ is item 3(b). With $\nu_R$, every $\delta_c$ vanishes on $\ell_{B-L}$, so every relation holds and every doublet with an incidence has $h_a=0$ there; $\ell_{B-L}$ is distinct from the Standard Model ray. ∎

**Resolution TV-W-05-R1 (Metadata).** Exact domain: one family of Theorem W.14 at fixed $N_c\ge2$, with or without $\nu_R$, and every finite doublet-Yukawa graph with signed $H_a$ or $\widetilde H_a$ incidences; perturbative local gauge and mixed-gravitational anomalies, with the $SU(2)$ parity recorded separately. Premises: the left-chiral anomaly signs and the doubled-hypercharge convention of Theorem W.14. Equivalence: nonzero common real rescaling; the relabelings $u_R\leftrightarrow d_R$ and $e_R\leftrightarrow\nu_R$ are recorded as explicit component exchanges. Budget: every finite doublet set and every incidence set. Verifier: substitute (W.14c.2)–(W.14c.4) into the anomaly and Yukawa equations, reverse-eliminate, and evaluate the balance conditions. Falsifier: a real solution outside $V\cap L_\Gamma$, a graph whose solution set differs from items 3(a)–(d), or a listed solution with a nonzero perturbative local or mixed-gravitational anomaly. Provenance class: target-independent exact anomaly algebra with no measured charge input. Downstream consumers: Theorems W.14, W.14a and G.8.5a, `TV-W-05`, and `RT-T1`. Nonvacuity: the graph of Theorem W.14 returns $\ell_+$ alone, while the two-doublet graph $\{(u,H_1,+1),(d,H_1,-1),(e,H_2,-1)\}$ returns $\ell_+\cup\ell_-\cup\ell_0$, with $h_2=0$ on $\ell_0$. Theorem W.14c gives `positive-discharge` of the complete one-family arbitrary-graph classification. Corollary W.14d gives `negative-refutation` of hypercharge uniqueness for every one-family graph with $\nu_R$ and for every $\tau$-balanced graph without a doublet linking $e$ with a quark channel. Multi-family graphs outside the family-diagonal common-Higgs branch of Theorem W.14b remain `M`-open under `TV-W-05`.

**Theorem W.14e (Singlet Extensions and the Diagonal Cubic).** For $m\ge1$ put
$$
Z_m:=\Bigl\{x\in\mathbb R^m:\ \sum_{i=1}^mx_i=0,\ \ \sum_{i=1}^mx_i^3=0\Bigr\}.
$$
Adjoin $n\ge0$ left-handed gauge-singlet Weyl fermions $\chi_j:(\mathbf1,\mathbf1)$ of hypercharges $\sigma_1,\ldots,\sigma_n$, with no Yukawa coupling imposed on them; a right-handed singlet of hypercharge $y$ enters with $\sigma=-y$. For $a>0$ let $n_{\pm a}$ count the singlets of hypercharge $\pm a$. The reduced singlet content of a solution is the multiset obtained by deleting every singlet with $\sigma_j=0$ and, for each $a>0$, $\min(n_a,n_{-a})$ vectorlike pairs of singlets with hypercharges $a$ and $-a$.

1. $Z_1=\{0\}$ and $Z_2=\{(x,-x)\}$; $Z_3$ is the union of the three lines on which one coordinate vanishes and the other two are opposite; $Z_4$ is the union of the three planes $\{x_i+x_j=0,\ x_k+x_l=0\}$ with $\{i,j,k,l\}=\{1,2,3,4\}$.
2. For $(u,v)\in\mathbb Z^2\setminus\{0\}$ put
$$
x(u,v)=\bigl(-(5u-3v)(7u+9v),\ -3(3u+v)(7u-5v),\ -7(u-3v)(u-v),\ (7u-3v)(7u-v),\ 8(7u^2-3v^2)\bigr).
\tag{W.14e.1}
$$
Then $0\ne x(u,v)\in Z_5$. If $(u:v)\in\mathbb P^1(\mathbb Q)$ avoids the eight points $(3:5)$, $(-9:7)$, $(-1:3)$, $(5:7)$, $(3:1)$, $(1:1)$, $(3:7)$ and $(1:7)$, then no coordinate of $x(u,v)$ vanishes and no two coordinates have zero sum. Each proportionality class of the vectors $x(u,v)$ arises from at most two points of $\mathbb P^1(\mathbb Q)$. For example, $x(1,0)=7(-5,-9,-1,7,8)$ and $x(1,-1)=8(2,-9,-7,10,4)$.
3. Adjoin the singlets to the one-family, one-doublet graph of Theorem W.14 without $\nu_R$. The real solutions are exactly $Y_Q=q\in\mathbb R$, $Y_L=-N_cq$, the Yukawa relations of Theorem W.14 with $Y_H=h$, and
$$
(h-N_cq,\ \sigma_1,\ldots,\sigma_n)\in Z_{n+1}.
\tag{W.14e.2}
$$
For $n\le3$, every solution has either empty reduced singlet content and $h=N_cq$, which is the Standard Model line (W.4.3), or $h\ne N_cq$ and reduced content one singlet with $\sigma=N_cq-h$, whose right-handed conjugate carries the Dirac-neutrino hypercharge $-N_cq+h$ of (W.14a.1); the latter reproduces the branch of Theorem W.14a. In particular, for $n=1$ the singlet carries the hypercharge of Theorem W.14a with no Yukawa coupling imposed. For every $n\ge4$ there are infinitely many pairwise nonproportional primitive integral solutions with $h\ne N_cq$ whose reduced singlet content consists of four charged singlets; for $N_c=3$ one of them is
$$
Y_Q=1,\ Y_u=3,\ Y_d=-1,\ Y_L=-3,\ Y_e=-5,\ Y_H=2,\qquad(\sigma_1,\sigma_2,\sigma_3,\sigma_4)=(-5,-9,7,8).
\tag{W.14e.3}
$$
4. Adjoin the singlets to the common-Higgs branch of Theorem W.14b, which contains Theorem W.14a at $F=1$. The real solutions are exactly (W.14b.1) together with $(\sigma_1,\ldots,\sigma_n)\in Z_n$. For $n\le4$ the reduced singlet content is empty; for every $n\ge5$ there are infinitely many pairwise nonproportional primitive integral solutions whose reduced singlet content consists of five charged singlets.
5. The singlets change no nonabelian anomaly coefficient and no $SU(2)$ doublet count.

*Proof.* For $m=3$, substituting $x_3=-x_1-x_2$ gives $\sum_ix_i^3=3x_1x_2x_3$. For $m=4$, substituting $x_4=-x_1-x_2-x_3$ gives
$$
\sum_{i=1}^4x_i^3=-3(x_1+x_2)(x_1+x_3)(x_2+x_3),
$$
and on the hyperplane $\sum_ix_i=0$ the equation $x_1+x_2=0$ is equivalent to $x_3+x_4=0$. The cases $m=1,2$ are immediate. This proves item 1.

For item 2 put $w=(-9,-5,-1,7,8)$, $e_{12}=(1,-1,0,0,0)$ and $e_{34}=(0,0,1,-1,0)$. Direct expansion gives, for all real $a,b,c$,
$$
\sum_i\bigl(ae_{12}+be_{34}+cw\bigr)_i^3=-6c\,(7a^2-28ac-3b^2+24bc).
$$
With $a=(28u-24v)u$, $b=(28u-24v)v$ and $c=7u^2-3v^2$, the bracket equals $(28u-24v)^2(7u^2-3v^2)-(28u-24v)^2c=0$, and $ae_{12}+be_{34}+cw=x(u,v)$. All three vectors have coordinate sum zero, so $x(u,v)\in Z_5$. The last coordinate $8(7u^2-3v^2)$ has no rational zero because $3/7$ is not the square of a rational number, so $x(u,v)\ne0$. The coordinates are displayed in (W.14e.1), and the ten pairwise sums are
$$
\begin{aligned}
x_1+x_2&=-14(7u^2-3v^2), & x_1+x_3&=-2(3u+v)(7u-3v), & x_1+x_4&=2(u-3v)(7u-5v),\\
x_1+x_5&=3(u-v)(7u-v), & x_2+x_3&=-2(5u-3v)(7u-v), & x_2+x_4&=-2(u-v)(7u+9v),\\
x_2+x_5&=-(u-3v)(7u-3v), & x_3+x_4&=6(7u^2-3v^2), & x_3+x_5&=(7u-5v)(7u+9v),\\
x_4+x_5&=7(3u+v)(5u-3v). &&&&
\end{aligned}
$$
Every linear factor vanishes exactly at one of the eight listed points. For a fixed nonzero vector $y$, the parameters with $x(u,v)$ proportional to $y$ are common zeros of the binary quadratic forms $y_jx_i(u,v)-y_ix_j(u,v)$. These forms do not all vanish identically: if $y_5\ne0$, the form $y_5x_3-y_3x_5$ is nonzero because $x_3$ and $x_5$ are not proportional, and if $y_5=0$ and $y_i\ne0$, the form $y_ix_5$ is nonzero. A nonzero binary quadratic form has at most two zeros in $\mathbb P^1$.

For item 3, the singlets carry no $SU(N_c)$ or $SU(2)$ charge, so the Yukawa relations and the two nonabelian mixed equations are those of Theorem W.14: $Y_L=-N_cq$, $Y_u=q+h$, $Y_d=q-h$ and $Y_e=-N_cq-h$. The proof of Theorem W.14 evaluates the family's mixed-gravitational and cubic contributions as $-N_cq+h$ and $-(N_cq-h)^3=(h-N_cq)^3$. Adding $\sum_j\sigma_j$ and $\sum_j\sigma_j^3$ gives (W.14e.2). For $n\le3$, item 1 splits the coordinates of $(h-N_cq,\sigma_1,\ldots,\sigma_n)$ into zeros and opposite pairs. The singlet zeros and the pairs of singlets cancel in the reduced content, which is therefore empty when $h=N_cq$ and consists of one singlet of hypercharge $-(h-N_cq)$ otherwise. For $n\ge4$ take $(u:v)$ outside the eight exceptional points, let $y$ be $x(u,v)$ divided by the greatest common divisor of its coordinates, and set $q=1$, $h=N_c+y_1$, $(\sigma_1,\ldots,\sigma_4)=(y_2,\ldots,y_5)$ and $\sigma_j=0$ for $j>4$. Item 2 makes $h\ne N_cq$ and the four singlet hypercharges nonzero with no opposite pair, and $Y_Q=1$ makes the solution primitive. Two such solutions are proportional only when they are equal, which happens for at most two parameter points, so there are infinitely many. The permutation $(-1,-5,-9,7,8)$ of $x(1,0)/7$ with $N_c=3$ gives (W.14e.3).

For item 4, the proof of Theorem W.14b shows that each family contributes zero to the mixed-gravitational anomaly and $-6h^2(N_cq_f+\ell_f)$ to the cubic one, and these contributions sum to zero under (W.14b.1). The singlets therefore satisfy $\sum_j\sigma_j=\sum_j\sigma_j^3=0$ separately. Item 1 splits every point of $Z_n$ with $n\le4$ into zeros and opposite pairs. For $n\ge5$, fix the integral point $q_f=1$, $\ell_f=-N_c$, $h=N_c$ of (W.14b.1), take the five coordinates of each primitive $y$ of item 3 as $\sigma_1,\ldots,\sigma_5$, and set the remaining $\sigma_j=0$; as in item 3, these solutions are primitive and pairwise nonproportional up to the two-point fibers. Item 5 holds because the singlet representation matrices of $SU(N_c)$ and $SU(2)$ vanish. ∎

**Resolution TV-W-05-R2 (Metadata).** Exact domain: $n\ge0$ hypercharged gauge-singlet Weyl fermions without imposed Yukawa couplings, adjoined either to the one-family one-doublet graph of Theorem W.14 or to the common-Higgs branch of Theorem W.14b, with perturbative local gauge and mixed-gravitational anomalies. Premises: Theorems W.14 and W.14b and their sign conventions. Equivalence: nonzero common real rescaling, with neutral singlets and vectorlike singlet pairs removed by the reduced-content rule. Budget: every $n$. Verifier: (W.14e.2) and its W.14b analogue, the factorizations of item 1, the cubic identity and factor list for (W.14e.1), and substitution of (W.14e.3). Falsifier: a solution outside (W.14e.2) or its W.14b analogue, a point of $Z_m$ with $m\le4$ off the listed lines and planes, a nonexceptional parameter giving a zero coordinate or an opposite pair, or a listed solution with a nonzero anomaly. Provenance class: target-independent exact anomaly algebra and diagonal-cubic geometry. Downstream consumers: Theorems W.14, W.14a and W.14b, `TV-W-05`, and `RT-T1`. Nonvacuity: (W.14e.3). Theorem W.14e gives `positive-discharge` of the complete singlet-extension classification on both branches: after reduction the solutions are the Standard Model line and the Theorem W.14a branch for $n\le3$ on the first branch, and the singlet-free branch (W.14b.1) for $n\le4$ on the second. It gives `negative-refutation` of reduced-catalog finiteness for $n\ge4$ on the first branch and $n\ge5$ on the second. Yukawa-coupled singlets on general graphs, non-singlet exotic representations and defect sectors remain `M`-open under `TV-W-05`.

**Theorem W.14f (Compact Primitive Lattices and Center Kernels on the Common-Higgs Branch).** Let $\widetilde G=SU(N_c)\times SU(2)\times U(1)$ with $N_c\ge2$, write elements of the $U(1)$ factor as phases $z$, and let $z$ act on a field of integral hypercharge $y$ by $z^y$. A compact form of a real solution ray is an integral charge vector on that ray; it is primitive when the greatest common divisor of all its fermion and Higgs charges is one.

1. A nonzero real solution vector has a compact form exactly when the ratios of its nonzero charges are rational, and the primitive compact form of such a ray is unique up to sign. On the branch (W.14b.1), the primitive compact forms are, up to sign, the integral points $(q_f,\ell_f,h)\in\mathbb Z^{2F+1}$ with $\sum_f(N_cq_f+\ell_f)=0$ and $\gcd(q_1,\ldots,q_F,\ell_1,\ldots,\ell_F,h)=1$; for $F=1$ they are the coprime pairs $(q,h)$ of (W.14a.1).
2. For such a primitive point, the subgroup $K\subset\widetilde G$ acting trivially on every fermion and on $H$ is central and cyclic:
$$
K=\bigl\langle\bigl(z_g^{-(q_1+h)}I_{N_c},\ z_g^{-h}I_2,\ z_g\bigr)\bigr\rangle\cong\mathbb Z_g,
\qquad z_g=e^{2\pi i/g},
\qquad
g=\gcd\bigl(\{\ell_f+h,\ \ell_f-h,\ q_f-q_1\}_{f=1}^F,\ N_c(q_1+h)\bigr),
\tag{W.14f.1}
$$
and $g\mid2N_c$. The connected global forms through which this representation descends are exactly $\widetilde G/\Xi$ with $\Xi\subset K$, one for each divisor of $g$; the induced representation is faithful exactly for $\Xi=K$. Adjoining singlets of integral hypercharges $\sigma_j$ and further doublets $(\mathbf1,\mathbf2)_{h_b}$ replaces $g$ by $\gcd(g,\sigma_j,h_b-h)$; doublets with $h_b=\pm h$ leave $g$ unchanged.
3. For $F=1$,
$$
g=\gcd\bigl(N_cq-h,\ N_cq+h,\ N_c(q+h)\bigr).
\tag{W.14f.2}
$$
The Standard Model point $(q,h)=(1,N_c)$ has $g=N_c\gcd(2,N_c+1)$, which equals $6$ for $N_c=3$ and reproduces the kernel of Theorem G.8.5b; the point $(q,h)=(1,0)$ on $\ell_{B-L}$ has $g=N_c$. For $N_c=3$, $g=6$ exactly when $q$ and $h$ are odd and $3\mid h$. Hence the $\mathbb Z_6$ quotient is admitted on infinitely many primitive rays of (W.14a.1), for example $(q,h)=(1,3(2k+1))$ for every $k\in\mathbb Z$ and $(q,h)=(5,3)$.
4. On the components $\ell_0$ and $\Pi_0$ of Theorem W.14c, $K$ is trivial for every primitive form and every set of doublets. On $\ell_\pm$ with doublets of hypercharge $\pm N_cY_Q$ only, $K\cong\mathbb Z_{N_c\gcd(2,N_c+1)}$.

Perturbative anomaly coefficients and the $SU(2)$ doublet count do not depend on $\Xi$.

*Proof.* A real vector is a real multiple of an integral vector exactly when the ratios of its nonzero coordinates are rational, and the integral points of a rational ray are the integral multiples of a primitive vector, unique up to sign. On (W.14b.1) the charges of $Q_{L,f}$, $L_{L,f}$ and $H$ are $q_f$, $\ell_f$ and $h$, and every other charge is an integral combination of them; hence the charge vector is integral exactly when $(q_f,\ell_f,h)$ is, with the same greatest common divisor.

If $(A,B,z)\in\widetilde G$ acts trivially on $u_{R,1}$ and on $L_{L,1}$, then $z^{q_1+h}A=I_{N_c}$ and $z^{\ell_1}B=I_2$, so $A=\zeta I_{N_c}$ and $B=\beta I_2$ are central, with $\zeta^{N_c}=1$ and $\beta=\pm1$. Triviality on $e_{R,f}$, $\nu_{R,f}$, $H$ and $u_{R,f}$ gives
$$
z^{\ell_f-h}=z^{\ell_f+h}=1,\qquad \beta=z^{-h},\qquad \zeta=z^{-(q_f+h)}.
$$
The last equation for every $f$ requires $z^{q_f-q_1}=1$, and $\zeta^{N_c}=1$ requires $z^{N_c(q_1+h)}=1$. Conversely, these conditions give $z^{2h}=z^{\ell_f+h}z^{-(\ell_f-h)}=1$, hence $\beta=\pm1$, and they make the action trivial on $L_{L,f}$, $d_{R,f}$ and $Q_{L,f}$, where it is $\beta z^{\ell_f}=z^{\ell_f-h}$, $\zeta z^{q_f-h}=z^{-2h}$ and $\zeta\beta z^{q_f}=z^{-2h}$. Thus $z$ ranges over the $g$-th roots of unity and determines $\zeta$ and $\beta$, which proves (W.14f.1). Every field satisfies $\zeta^n\beta^mz^y=1$ for some $n,m\in\{0,1\}$, with $\zeta^{N_c}=\beta^2=1$, so $z^{2N_cy}=1$ for every charge $y$; primitivity and Bezout's identity give $z^{2N_c}=1$, hence $g\mid2N_c$. A central subgroup acts trivially exactly when it lies in $K$, and a cyclic group of order $g$ has exactly one subgroup of each order dividing $g$. An adjoined singlet adds $z^{\sigma_j}=1$, and an adjoined doublet adds $\beta z^{h_b}=z^{h_b-h}=1$, which for $h_b=\pm h$ follows from $z^{2h}=1$.

For $F=1$, $\ell_1=-N_cq$ gives (W.14f.2). At $(1,N_c)$, $g=\gcd(0,2N_c,N_c(N_c+1))=N_c\gcd(2,N_c+1)$, and at $(1,0)$, $g=N_c$. For $N_c=3$, item 2 gives $g\mid6$. Next, $2\mid g$ exactly when $3q-h$ is even, since then $3q+h$ and $3(q+h)$ are even as well; for coprime $q,h$ this means that both are odd. Also $3\mid g$ exactly when $3\mid h$, since then $3$ divides all three entries. The pairs $(1,3(2k+1))$ and $(5,3)$ are coprime and satisfy both conditions.

On $\ell_0$ and $\Pi_0$, $Y_Q=Y_L=0$, so triviality on $L_L$ and $Q_L$ gives $\beta=1$ and $\zeta=1$. Every field then transforms by $z^y$, so $K$ consists of the phases $z$ with $z^y=1$ for every fermion and doublet charge $y$; primitivity and Bezout's identity give $z=1$. On $\ell_+$ with $q=1$, triviality on $e_R$, $L_L$ and $u_R$ gives $z^{2N_c}=1$, $\beta=z^{N_c}$ and $\zeta=z^{-(N_c+1)}$ with $z^{N_c(N_c+1)}=1$, and these conditions make the action trivial on $Q_L$, $d_R$ and on doublets of hypercharge $\pm N_c$. Hence $g=\gcd(2N_c,N_c(N_c+1))$; the relabeling $u_R\leftrightarrow d_R$ gives $\ell_-$. The last sentence holds because the central quotient changes neither the Lie-algebra representation nor the fermion content. ∎

**Resolution TV-W-05-R3 (Metadata).** Exact domain: primitive integral compact forms and central global forms of $\widetilde G$ on the common-Higgs branch (W.14b.1) for every $F\ge1$, with optional hypercharged singlets and further doublets, and on the one-family components of Theorem W.14c. Premises: Theorems W.14a, W.14b and W.14c and the center $\mathbb Z_{N_c}\times\mathbb Z_2\times U(1)$ of $\widetilde G$. Equivalence: sign of the primitive vector; global forms are labeled by the central subgroup $\Xi\subset K$. Budget: every primitive integral point and every central subgroup. Verifier: the congruences of the proof, the explicit generator in (W.14f.1), the divisibility $g\mid2N_c$, and the $N_c=3$ parity and divisibility test. Falsifier: a central element acting trivially outside the cyclic group (W.14f.1), a listed generator acting nontrivially, or a primitive $N_c=3$ point with $g=6$ violating the stated congruences. Provenance class: target-independent finite abelian-group computation. Downstream consumers: Theorems W.14a, W.14b and G.8.5b, `TV-W-05`, the hypercharge-lattice component of `TV-G-07/08`, and `RT-T1`. Nonvacuity: $(q,h)=(1,3)$ reproduces the $\mathbb Z_6$ kernel of Theorem G.8.5b at $N_c=3$, and $(q,h)=(5,3)$ is a distinct primitive ray with the same kernel. Theorem W.14f gives `positive-discharge` of the compact primitive-lattice and central global-form classification on these branches and `negative-refutation` of Standard Model ray selection by $\mathbb Z_6$ global-form compatibility on the plane (W.14a.1). Quotient-specific spin and $\mathrm{Spin}^c$ bordism anomalies and boundary, interface and defect inflow for these global forms remain `M`-open under `TV-W-05`.

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

$$ \boxed{\ \alpha_{\mathrm{em}}(\mathrm{MPU})\Bigl(\frac{C_{\mathrm{cyc}}}{C_{\mathrm{cap}}}\Bigr)_{e}\ \le\ K_{\mathrm{alph}}(d_0, M_e)\,\frac{1}{F_{\lambda,e}}\ }, \tag{W.5.1} $$

with **strict inequality on the cap‑active branch**. **Equality** holds **iff** $u_0=u_{\mathrm J}^*$ and $\sigma^2=0$. The identity (W.2.6) holds only under the specific conditions of a flat LAN spectrum and operation precisely at the branch boundary. The more general, robust prediction of this framework is the inequality (W.5.1). The identity represents an idealized, high‑symmetry point in the space of possible solutions.

**Corollary W.17 (Lower bound on $r_e$ and variance effect).**
With $r_e=\tfrac{S_1}{2\tilde A_{\mathrm{PCE}}+S_2}$ and (W.2.3),

$$
r_e\ \ge\ \frac{S_1}{S_2(1+1/D_{\mathrm{cap}})}\ =\ \frac{1}{x}\cdot \frac{1}{(1+\sigma^2/x^2)(1+1/D_{\mathrm{cap}})}.
\tag{W.5.2}
$$

Holding $M$, $x$, $\tilde A_{\rm PCE}$, and $D$ constant, increasing spectral variance decreases $r_e$ and enlarges the upper bound (W.5.1) via $1/F_\lambda=1+\sigma^2/x^2$. No monotonicity claim is made when these quantities co-vary with the spectrum.

---

## W.6 Preregisterable computation (deterministic; no data)

**Inputs at $g=0$** for each sector $s\in\{e,Y,2\}$:

0. **Probe specification:** a $C^1$ family of CPTP maps $E_g^{(s)}$ and a stationary state $\rho_0^{(s)}$ with $E^{(s)}_0(\rho_0^{(s)})=\rho_0^{(s)}$. Let $P_0^{(s)}$ be the support projector of $\rho_0^{(s)}$ and assume $\rho_0^{(s)}$ is full rank on $\operatorname{Ran}(P_0^{(s)})$. The SLD‑QFI is computed for the state family $\rho_g^{(s)}:=E_g^{(s)}(\rho_0^{(s)})$ at $g=0$, with the kernel-block condition $Q_0^{(s)}\,\dot\rho^{(s)}\,Q_0^{(s)}=0$, where $Q_0^{(s)}=I-P_0^{(s)}$ and $\dot\rho^{(s)}:=\left.\partial_g\rho_g^{(s)}\right|_{g=0}$.
   *Alternative:* if a channel‑QFI convention is adopted, specify the input/state optimization rule and ancilla dimension; note that multi‑parameter QCRB attainability may require **SLD‑compatibility** (commutativity) for joint POVMs.
1. **Spectral data:** $\{\lambda_i^{(s)}\}_{i=1}^{M_s}$ (SLD‑QFI eigenvalues at $g=0$); compute $M_s$, $S_1^{(s)}$, $S_2^{(s)}$, $x_s=S_1^{(s)}/M_s$, $\sigma_s^2$, $F_{\lambda,s}$.
2. **Cost coefficients and global constants:** $A_{\rm PCE}^{(s)}>0$ for each sector $s$; $\Gamma_0>0$; alphabet size $d_0$.
3. **Branch classification:** Solve the unconstrained stationarity

   $$
   \phi'(u)=2A_{\mathrm{PCE}}\,u-\Gamma_0\sum_i \frac{\lambda_i^{(s)}}{1+\lambda_i^{(s)} u}=0.
   $$

   Let $u_0\ge 0$ denote the solution.
   – If $g_J(u_0)=M_s\ln(1+x_s u_0)< \ln d_0$: **interior** $(u_s^*=u_0)$.
   – If $g_J(u_0)= \ln d_0$: **branch boundary** $(u_s^*=u_0=u_{\mathrm J}^*)$.
   – If $g_J(u_0)> \ln d_0$: **cap‑active** $\bigl(u_s^*=u_{\mathrm J}^*=(a_{\mathrm{cap}}-1)\,M_s/S_1^{(s)}\bigr)$, with $a_{\mathrm{cap}}=d_0^{1/M_s}$.
4. **Invariants:** $C_{\mathrm{cap}}^{(s)}=\Gamma_0\,S_1^{(s)}$,\quad $C_{\mathrm{cyc}}^{(s)}=\Gamma_0\,[\,2\tilde A_{\mathrm{PCE}}^{(s)}+S_2^{(s)}\,]$.
5. **U(1)/EM product:** for scales **below** EWSB, $\alpha_{\mathrm{em}}(\mu^*)=u_e^*/(4\pi)$. Compute $\alpha_{\mathrm{em}}(\mu^*)\,(C_{\mathrm{cyc}}/C_{\mathrm{cap}})_{e}$ and compare to $K_{\mathrm{alph}}(d_0,M_e)/F_{\lambda,e}$; the identity (W.2.6) applies only at the branch boundary with $\sigma_e^2=0$. For scales **above** EWSB, replace with hypercharge/weak couplings as in (W.3.1).
6. **Weinberg angle:** compute $\sin^2\theta_W=u_Y^*/(u_Y^*+u_2^*)$ from the classified optima in canonical hypercharge normalization. The spectral-ratio expression in (W.3.1) applies under Assumption W.3.A. If using GUT-normalized inputs, convert with $g_Y=\sqrt{\tfrac{3}{5}}\,g_1$. Equation (W.3.3) applies when the full-block common-stiffness hypotheses of Proposition W.13 hold.
7. **Reporting:** publish $\{M_s,S_1^{(s)},S_2^{(s)},A_{\rm PCE}^{(s)}\}$, $\Gamma_0$, $d_0$, probe specification, and code.

---

## W.7 Fisher‑operator (SLD) existence: finite‑dimensional setting

**Theorem W.18 (SLD existence and QFI quadratic form).**
Let $\{E_g\}_{g\in\mathbb{R}}$ be a $C^1$ family of CPTP maps on a finite-dimensional Hilbert space, let $\rho_0$ be a state with $E_0(\rho_0)=\rho_0$, and set $\rho_g=E_g(\rho_0)$. Let $P$ be the support projector of $\rho_0$, $Q=I-P$, and $\dot\rho=\left.\partial_g\rho_g\right|_{g=0}$. Suppose $Q\dot\rho Q=0$. Then the Symmetric Logarithmic Derivative (SLD) exists at $g=0$ and has a unique Hermitian representative satisfying $QLQ=0$. The SLD-based QFI is finite and defines a positive semidefinite quadratic form on any chosen finite-dimensional parameter tangent model. It admits a finite-dimensional Riesz representation on the admitted Hermitian state-tangent space, equipped with the positive inner product $\langle X,Y\rangle_{\rho_0}=\tfrac12\mathrm{Tr}(\rho_0(XY+YX))$.

*Proof.* Choose an eigenbasis $\rho_0=\sum_{i=1}^{n}p_i|i\rangle\langle i|$, with $p_i>0$ for $1\le i\le r$ and $p_i=0$ for $i>r$. On the real space $\mathcal D=\{X=X^\dagger:QXQ=0\}$, the Jordan map
$$
\mathcal J_{\rho_0}(X)=\tfrac12(\rho_0X+X\rho_0)
$$
acts on each allowed matrix entry by the strictly positive factor $(p_i+p_j)/2$. It preserves $\mathcal D$ and is invertible there. The hypothesis places $\dot\rho$ in $\mathcal D$, so
$$
L_{ij}=
\begin{cases}
\dfrac{2\dot\rho_{ij}}{p_i+p_j},&p_i+p_j>0,\\
0,&p_i=p_j=0
\end{cases}
$$
defines a Hermitian solution of $\dot\rho=(L\rho_0+\rho_0L)/2$ with $QLQ=0$. All entries outside the kernel block are determined by that equation, while its kernel block is zero on both sides. Thus every other Hermitian solution differs only by an arbitrary Hermitian kernel block, which contributes nothing to $\mathrm{Tr}(\rho_0L^2)$.

Since $\dot\rho$ is Hermitian, exchanging $i$ and $j$ in the finite sum gives
$$
\begin{aligned}
F_Q\big|_{g=0}
&=\mathrm{Tr}(\rho_0L^2)
=\sum_{p_i+p_j>0}\frac{4p_i|\dot\rho_{ij}|^2}{(p_i+p_j)^2}\\
&=\sum_{p_i+p_j>0}\frac{2|\dot\rho_{ij}|^2}{p_i+p_j}\ge0.
\end{aligned}
$$
Every denominator in this finite sum is at least $\min_{1\le i\le r}p_i>0$, proving finiteness. Polarizing the sum gives a symmetric positive quadratic form on admitted Hermitian tangents. Its pullback along a linear parameter-to-state derivative is positive semidefinite. Moreover, $\langle X,X\rangle_{\rho_0}=\mathrm{Tr}(\rho_0X^2)>0$ for every nonzero $X\in\mathcal D$: any nonzero allowed entry has at least one positive-eigenvalue index. Restrict this inner product to the state-tangent space, choose an orthonormal basis, and represent the polarized QFI form by its symmetric matrix in that basis. This supplies the claimed Riesz representation. The construction is pointwise and makes no continuity assertion across rank changes. $\square$

---

## W.8 Emergent GR: assumptions and controlled deviations

**Theorem W.19 (Einstein dynamics under the local-horizon hypotheses of Theorem 12.1).**
Let $(M,g)$ be the Lorentzian branch of Section 11 and assume all hypotheses (a)–(e) of Theorem 12.1, including its accepted symmetric, covariantly conserved source $T_{\mu\nu}^{(MPU)}$ and its local Rindler construction at every point for every null vector. Write $G:=G_{\mathrm{op}}$ for the operational coefficient and take the constant horizon-entropy density $\eta=1/(4G)$, the heat flux $\delta Q=\int T_{\mu\nu}^{(MPU)}\xi^\mu d\Sigma^\nu$, and the linearized Raychaudhuri equation with $\theta(0)=\sigma_{\mu\nu}(0)=0$. The local KMS/Clausius bridge has $T=\kappa/(2\pi)$. For the transverse patches $P_\varepsilon$ of Theorem 12.1(d), with area $A_\varepsilon>0$, affine length $h_\varepsilon\to0$, and $\operatorname{diam}(P_\varepsilon)=o(h_\varepsilon)$, require $\delta S=\eta\,\delta\mathcal A+o(A_\varepsilon h_\varepsilon^2)$ and $\delta Q=T\delta S+o(A_\varepsilon h_\varepsilon^2)$ uniformly over the retained null directions. Identification of this operational $G$ with the measured Newton constant requires a separate calibration. Then
$$
R_{\mu\nu}-\tfrac12Rg_{\mu\nu}+\Lambda g_{\mu\nu}
=8\pi G\,T_{\mu\nu}^{(MPU)}
$$
in natural units, where $\Lambda$ is constant on each connected component.

*Proof.* The stated hypotheses are hypotheses (a)–(d) of Theorem 12.1 together with its conserved-stress hypothesis and its universal quantifier over null generators. Theorem 12.1 therefore gives the displayed equation. Its divergence, the contracted Bianchi identity, and $\nabla^\mu T_{\mu\nu}^{(MPU)}=0$ imply $\nabla_\nu\Lambda=0$, so $\Lambda$ is constant on each connected component. ∎

**Proposition W.20 (Conditional local four-derivative action basis).**
Assume that the gravitational response is described by a local, parity-even, diffeomorphism-invariant, metric-only effective action in four spacetime dimensions. Here the derivative expansion through four derivatives means that the scalar Lagrangian through that order is a finite real linear combination, with spacetime-constant coefficients, of complete contractions of products of the Riemann tensor and its covariant derivatives using the metric and its inverse. Assign weight $k+2$ to $\nabla^k{\rm Riem}$ and weight zero to the metric; retain weights zero, two and four, with the remainder of weight at least six. Assume also that the two-derivative term has coefficient $1/(16\pi G)$ for a specified $G>0$, and write the zero-derivative coefficient as $-\Lambda/(8\pi G)$. Modulo boundary terms and a constant multiple of the four-dimensional Euler density, its gravitational part can be written

$$
S_{\rm grav,eff}=\int d^4x \sqrt{-g}\,\Big[\tfrac{1}{16\pi G}(R-2\Lambda)+c_1 R^2+c_2 R_{\mu\nu}R^{\mu\nu}+O(\partial^6)\Big].
\tag{W.8.1}
$$

In natural units, $c_1$ and $c_2$ are dimensionless matching coefficients. Their dependence on entropy non-saturation or non-equilibrium data requires a separately specified microscopic matching map.

*Proof.* Work with the specified contraction class. A weight-zero scalar is constant, and a weight-two scalar is a multiple of the double trace $R$ of one Riemann tensor. At weight four, each monomial contains either two Riemann tensors or one factor $\nabla_a\nabla_b{\rm Riem}$. In a contraction of two Riemann tensors, the number of internal index pairs is the same in each factor. Two pairs in each factor yield $R^2$, one pair in each yields $R_{\mu\nu}R^{\mu\nu}$, and traces of antisymmetric pairs vanish. With no internal traces, all indices are paired between the factors. Antisymmetry within each curvature pair and symmetry under exchange of the pairs reduce the permutations, up to sign, to $I=R_{abcd}R^{abcd}$, $J=R_{abcd}R^{acbd}$ and $K=R_{abcd}R^{adbc}$. The algebraic Bianchi identity gives $I-J+K=0$, while relabeling $c,d$ gives $K=-J$. Hence $J=I/2$ and $K=-I/2$. Every complete contraction of $\nabla_a\nabla_b{\rm Riem}$ is a covariant divergence: remove the outer derivative to obtain a vector $V^a$ linear in $\nabla{\rm Riem}$, and use $\nabla g=0$ to recover $\nabla_aV^a$. Thus its density is $\sqrt{-g}\nabla_aV^a=\partial_a(\sqrt{-g}V^a)$ and vanishes in the declared quotient by boundary terms. No interchange of covariant derivatives is needed.

Consequently the bulk scalar through weight four is represented by
$$
a_0+a_1R+b_1R^2+b_2R_{\mu\nu}R^{\mu\nu}
+b_3R_{\mu\nu\rho\sigma}R^{\mu\nu\rho\sigma}.
$$
The four-dimensional algebraic identity
$$
E_4=R_{\mu\nu\rho\sigma}R^{\mu\nu\rho\sigma}
-4R_{\mu\nu}R^{\mu\nu}+R^2
$$
gives $c_1=b_1-b_3$ and $c_2=b_2+4b_3$ in the explicitly declared quotient by a constant multiple of $E_4$. With the assumed $a_1=1/(16\pi G)>0$ and $a_0=-\Lambda/(8\pi G)$, this is (W.8.1). The argument classifies bulk representatives; it does not identify actions including boundary contributions or compare distinct topological sectors. It supplies no values for $c_1$ and $c_2$. ∎

---

## W.9 Distinctive mathematical features

**Features.**
* (A) **Alphabet‑constant family** $K_{\mathrm{alph}}(d_0,M)$ with exact identity (W.2.6) in the flat‑spectrum branch‑boundary reference.
* (B) **Convexity and uniqueness** of the coupling‑setting principle (Lemma W.1).
* (C) **Capacity‑aware bounds** that are explicit and saturable under stated conditions (Proposition W.8; Theorem W.10; Corollary W.16).
* (D) **Hypercharge structure** compactly fixed by anomaly + Yukawa relations (Theorem W.14; Corollary W.15).
* (E) **Deterministic pipeline** from the preregistered probe, QFI spectrum, global constants, and branch classification of W.6 to numerical outputs.
* (F) **Transparent variance dependence** via $F_\lambda$ (W.2.4), quantifying robustness.
* (G) **Predictive Power:** As shown in **Appendix Z**, this formalism, when combined with the framework's fundamental constants, yields the Thomson-limit fine-structure calculation through the displayed third-order formula of Theorems Z.24–Z.26. This fixes the low-energy boundary condition in the sense used there. The lifted threshold tuple of Appendix T belongs to the separate PU-to-SM matching problem at $\mu_G$ and later RG flow to $M_Z$, not the Thomson-limit formula itself. No continuously adjustable fit parameter enters the displayed Appendix Z Thomson-limit expression once its stated inputs are fixed.

