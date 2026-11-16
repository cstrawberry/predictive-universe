# 6. Complexity, Performance, and Adaptation Dynamics

This section studies the interplay between complexity, predictive performance, and adaptation dynamics within the Predictive Universe framework. It defines the PCE optimization model, states complexity-performance scaling hypotheses, derives an exponential performance law under an explicit multiplicative-composition condition, and analyzes the resulting dynamics. For states belonging to the qualifying set of Definition 13, $C\ge C_{op}$; the further inequality $C_{op}\ge K_0$ holds only under the realization and complexity-capacity bridge hypotheses of Corollary 3.

## 6.0 The Capacity Bound as Structural Constraint

**Capacity branch note.** The refresh/minorization branch gives the theorem-level strict ND-RID bound $C_{\max}<\ln d_0$ under Lemma E.1 and Theorem E.2. Independently, a registered completed reset of an $r$-dimensional factor inside the $d_0$-dimensional MPU Hilbert space gives $C(\mathcal E_N)\le\ln d_0-\ln r$ by Proposition E.2a. For a binary registered reset, $r=2$. Exact equalities such as $C_{\max}^*=\ln d_0-\varepsilon_0=2\ln2$ require the separate residual-budget same-family saturation branch.

*Throughout this section, natural units $\hbar = c = k_B = 1$ are used unless otherwise noted.*

Finite predictive transfer is bounded on two independent channel branches. A registered completed reset of an $r$-dimensional factor gives $C(\mathcal E_N)\le\ln d_0-\ln r$ by Proposition E.2a, specializing to $\ln d_0-\ln2$ for $r=2$. A refresh/minorization channel independently gives $C_{\max}<\ln d_0$ by Theorem E.2. The first conclusion uses fixed-ready-state support loss; the second uses the full-state refresh component of Lemma E.1.

### 6.0.1 Capacity Manifestations Across Domains

<a id="theorem-601-conditional-capacity-bound-propagation"></a>**Theorem 6.0.1 (Conditional Capacity-Bound Propagation).** *Assume the stated completed-reset or refresh channel branch. For the boundary-entropy conclusions, assume that the ledger counts only reliably distinguishable transmitted classical response labels as in Corollary E.2, and impose the geometric density certificate of Theorem E.3. For the operational coupling, additionally impose the capacity-achieving, entropy-saturating, additive-ledger hypotheses and positive saturated coefficient of Theorem E.6. Then:*

| Domain | Capacity Role | Derived Relation | Reference |
|:-------|:--------------|:-----------------|:----------|
| Information channels | Upper bound on reliable transmission | $C_{\max}\le\ln d_0-\ln r$ on the completed reset-support branch (specializing to $\ln d_0-\ln2$ for $r=2$); $C_{\max}(f_{RID})<\ln d_0$ on the refresh/minorization branch | Proposition E.2a; Theorem E.2 |
| Reliable boundary response entropy | Asymptotic response-entropy bound per channel use | $S_{\mathrm{channel}}^{\mathrm{rel}}\le k_BC_{\max}$ | Corollary E.2 |
| Operational gravitational calibration | Inverse proportionality on the saturated area-law branch | $G_{\mathrm{op}}=\frac{\eta\delta^2c^3}{4\hbar\chi C_{\max}}$ | Equation E.9 |

*Here $\delta$ is the effective MPU spacing, $\eta$ and $\chi$ are the geometric inefficiency and independence factors of Theorem E.3, and $C_{\max}=C(\mathcal E_N)$. Equation E.9 defines $G_{\mathrm{op}}$ using the Bekenstein--Hawking normalization. Identifying the response entropy with physical horizon entropy and setting $G_{\mathrm{op}}=G$ require the separate bridges of Remark E.6.3.1.*

*Proof.*

**Part A (Information Channels).** On the tensor-factor reset branch of Proposition E.2a, every one-use output is supported on a subspace of dimension $m=d_0/r$, and the memoryless $n$-use channel has output support dimension at most $m^n$, even for entangled inputs. For any $n$-use input ensemble $\{q_i,\rho_i\}$ with outputs $\sigma_i$ and average $\bar\sigma=\sum_iq_i\sigma_i$, its Holevo information satisfies
$$
\chi
=S(\bar\sigma)-\sum_iq_iS(\sigma_i)
\le S(\bar\sigma)
\le\ln\operatorname{rank}(\bar\sigma)
\le n\ln(d_0/r).
$$
Dividing by $n$ and taking the supremum over blocklengths and ensembles gives
$$
C(\mathcal E_N)\le\ln d_0-\ln r,
$$
and $r=2$ gives $C(\mathcal E_N)\le\ln d_0-\ln2$.

On the independent refresh/minorization branch, append a receiver-visible flag to
$$
\mathcal E_N=(1-p)\Psi+pT_\sigma,
\qquad p>0.
$$
For $n$ uses, the flag pattern is independent of the encoded message. Conditional on a pattern with $k$ nonrefresh positions, all message dependence lies in a space of dimension at most $d_0^k$, so the conditional Holevo information is at most $k\ln d_0$. Averaging over the binomial flag pattern gives
$$
\chi_n\le\mathbb E[k]\ln d_0
=n(1-p)\ln d_0.
$$
By data processing, discarding the flag cannot increase the Holevo information of any encoded ensemble. Dividing by $n$ and taking the regularized supremum therefore yields
$$
C(\mathcal E_N)\le(1-p)\ln d_0<\ln d_0.
$$

**Part B (Reliable Boundary Response Entropy).** On the declared response-label ledger, Corollary E.2 gives the asymptotic bound per channel use
$$
S_{\mathrm{channel}}^{\mathrm{rel}}\le k_BC_{\max}.
$$
With $N_{\mathrm{eff}}=\sigma_{link}\mathcal A+o(\mathcal A)$ and $\sigma_{link}=\chi/(\eta\delta^2)$ from Theorem E.3, the boundary sum gives
$$
S_{\mathrm{rel}}(\mathcal A)
\le\sigma_{link}\mathcal A\,k_BC_{\max}+o(\mathcal A).
$$
Theorem E.6 gives equality to leading order on its capacity-achieving, entropy-saturating, additive-ledger branch.

**Part C (Operational Gravitational Coupling).** On that saturation branch with positive coefficient, Equation E.9 defines
$$
G_{\mathrm{op}}=\frac{\eta\delta^2c^3}
{4\hbar\chi C_{\max}(f_{RID})}.
$$
This expression is dimensionally consistent because $[\delta^2c^3/\hbar]=L^3M^{-1}T^{-2}=[G_{\mathrm{op}}]$. On the additional residual-budget branch with $d_0=8$ and $\varepsilon_0=\ln2$,
$$
C_{\max}^*=\ln d_0-\varepsilon_0
=\ln8-\ln2=2\ln2.
$$
Substitution gives the corresponding conditional calibration of $G_{\mathrm{op}}$ in terms of the microscopic parameters. The measured coupling equals this coefficient only when the separate calibration $G_{\mathrm{op}}=G$ is supplied. ∎

<a id="principle-60-capacity-constraint-propagation"></a>**Principle 6.0 (Capacity Constraint Propagation).** *Finite predictive-transfer capacity is branch-constrained by the reset-support deficit $C(\mathcal E_N)\le\ln d_0-\ln r$ on a registered completed reset and, independently, by $C_{\max}<\ln d_0$ on a refresh/minorization branch. Gravitational or thermodynamic conclusions require their additional density, saturation, calibration, and implementation hypotheses.*

<a id="remark-601-conditional-origins-of-the-capacity-bounds"></a>**Remark 6.0.1: Conditional Origins of the Capacity Bounds.** The support-deficit route begins with a separately registered physical implementation:
$$
\text{reachable binary record}
+
\text{completed tensor-factor reset-support certificate}
\xrightarrow{\text{Prop E.2a}}
C_{\max}\le\ln d_0-\ln2.
$$
For the same registered reset ensemble, Theorem 31 supplies the independent heat ledger
$$
\frac{\langle Q_{\mathrm{bath}}\rangle}{k_BT}
\ge H_q(P\mid R).
$$
On a refresh/minorization branch, the channel-dynamical route is
$$
\mathcal{E}_N=(1-p)\Psi+pT_\sigma,\ p>0
\xrightarrow{\text{Lem E.1}} f_{RID}<1
\xrightarrow{\text{Thm E.2}} C_{\max}<\ln d_0.
$$
SPAP supplies the diagonal prediction obstruction but does not imply either physical channel branch. An operational boundary-area conclusion additionally requires the density certificate of Theorem E.3 and the saturation hypotheses of Theorem E.6; a gravitational equation-of-state conclusion separately requires the local Rindler/KMS, Clausius, source-conservation, Raychaudhuri, and remainder hypotheses of Theorem 50.

<a id="remark-602-residual-budget-saturation-branch"></a>**Remark 6.0.2: Residual-Budget Saturation Branch.** The declared reusable binary SPAP register has structural log-cardinality $\varepsilon_0=\ln2$ (Proposition 5; Theorem J.1), while Definition 28 and Theorem 31 govern only a registered physical reset ledger. The completed binary reset gives
$$
C_{\max}\le\ln d_0-\varepsilon_0.
$$
Assume the residual-budget branch on which no additional response-relevant or implementation deficit remains and an admissible channel attains this upper bound. For the Theorem-Z.2 comparator value $d_0=8$, Equations (E.14)--(E.15) give
$$
C_{\max}^*=\ln d_0-\varepsilon_0=\ln 8-\ln 2=2\ln 2.
$$
This equality is the branch-specific partition of the MPU information budget between the structural binary register cost and the residual external communication capacity; the reset-support theorem alone supplies only the preceding inequality.

<a id="theorem-602-exact-capacity-and-saturating-ensembles-for-the-completed-reset-normal-form"></a>**Theorem 6.0.2 (Exact Capacity and Saturating Ensembles for the Completed-Reset Normal Form).** Let $\Phi$ be exactly the channel of Proposition E.2a on
$$
\mathcal H_{d_0}=\mathcal H_K\otimes\mathcal H_R,
\qquad
D:=\dim\mathcal H_K=d_0/r,
$$
with the entire retained output equal to
$$
\Phi(\rho)=\operatorname{Tr}_R(U\rho U^\dagger)\otimes|0\rangle\langle0|_R.
$$
Then
$$
C(\Phi)=\ln D=\ln d_0-\ln r.
\tag{6.0.2.1}
$$
Moreover, a one-shot ensemble $\{p_m,\rho_m\}$ attains $\ln D$ exactly when, after discarding the fixed ready factor, every positive-weight output is pure and their average is $I_K/D$.

*Proof.* Proposition E.2a gives the upper bound $C(\Phi)\le\ln D$. For an orthonormal basis $\{|k\rangle\}_{k=1}^D$ of $\mathcal H_K$, use the uniform input ensemble
$$
\rho_k
=
U^\dagger
\bigl(|k\rangle\langle k|_K\otimes|0\rangle\langle0|_R\bigr)
U.
$$
Its outputs are $D$ orthogonal pure states, so its Holevo information is $\ln D$. This gives the matching lower bound and (6.0.2.1). For any output ensemble,
$$
\chi
=S(\bar\sigma)-\sum_m p_mS(\sigma_m)
\le\ln D.
$$
Equality holds exactly when $S(\bar\sigma)=\ln D$, equivalently $\bar\sigma=I_K/D$, and every positive-weight $\sigma_m$ has zero entropy, equivalently is pure. ∎

<a id="theorem-603-algebraic-horizon-witness-and-capacity-projection-nonentailment"></a>**Theorem 6.0.3 (Algebraic Horizon Witness and Capacity-Projection Nonentailment).** Assume the completed-reset normal form of Theorem 6.0.2 with $D\ge2$. For every integer $N\ge1$ and every formal area $\mathcal A>0$, the $N$-fold product channel has an explicit product ensemble of $D^N$ equiprobable orthogonal pure outputs with
$$
\chi_{\mathrm{Hol},N}=N\ln D,
\qquad
\sigma_{link}:=\frac{N}{\mathcal A},
\qquad
S_{\mathrm{boundary}}^{\mathrm{alg}}=k_B\sigma_{link}\mathcal A\ln D.
\tag{6.0.3.1}
$$
Thus the capacity, per-channel entropy-saturation and additive-product entries have a nonempty simultaneous algebraic witness.

The projection to the channel $\Phi$ does not determine the remaining horizon entries. At fixed $\Phi$, changing $N/\mathcal A$ changes $\sigma_{link}$; choosing a one-state ensemble instead of the orthogonal ensemble changes the utilized Holevo information from $\ln D$ to $0$; and the positive geometric data satisfying
$$
\sigma_{link}=\frac{\chi}{\eta\delta^2}
\tag{6.0.3.2}
$$
retain a continuous scale fiber. On the formal saturated branch, Equation E.9 consequently gives
$$
G_{op}
=\frac{\eta\delta^2c^3}{4\hbar\chi\ln D}
=\frac{c^3}{4\hbar\sigma_{link}\ln D},
\tag{6.0.3.3}
$$
so the same normal-form channel admits distinct density and operational-coupling completions. Identifying the product ensemble in (6.0.3.1) with the channels counted by a realized horizon remains the common-family realization entry.

Here $\chi_{\mathrm{Hol},N}$ is the product ensemble's Holevo information. The symbol $\chi$ in (6.0.3.2)--(6.0.3.3) is Appendix E's independently registered geometric coefficient and is not identified with $\chi_{\mathrm{Hol},N}$.

*Proof.* Tensoring the $D$ orthogonal outputs of Theorem 6.0.2 gives $D^N$ orthogonal pure outputs with maximally mixed average on $\mathcal H_K^{\otimes N}$, so their Holevo information is $\ln D^N=N\ln D$. The definitions of $\sigma_{link}$ and $S_{\mathrm{boundary}}^{\mathrm{alg}}$ give (6.0.3.1). A one-state ensemble has zero Holevo information on the same channel. For any prescribed $\sigma_{link}>0$, Equation (6.0.3.2) has positive solutions, for example $\eta=\chi=1$ and $\delta=\sigma_{link}^{-1/2}$. Substitution into Equation E.9 gives (6.0.3.3). Hence neither the selected ensemble, density, geometric scale nor operational coupling is a function of $\Phi$ alone. ∎

---

<a id="lemma-604a-finite-positive-massive-completed-reset-carrier-source"></a>**Lemma 6.0.4a (Finite Positive Massive Completed-Reset Carrier Source).**

#### 6.0.4a — 1. Finite Hilbert space, input, and actual local interactions

Fix one port $(i,j)$, a finite itinerary $x_0,\dots,x_J$ on its $x$-directed rail, and its actual completed swap times $t_0<\dots<t_J$. Each local host carries

$$
H_{\mathrm{site}} = \operatorname{span}\{|\mathrm{vac}\rangle\}\oplus H_{KR},\qquad \dim H_{KR} = Dr.
$$

The registered input occupies site 0 in an **arbitrary** state on KR, possibly entangled with external references. Every other site is initially vacant. All local sites and later vacancies remain in the complete source inventory. The fixed one-occupancy sector is spanned by $|l,a\rangle$, $l=0,\dots,J$ and $a=1,\dots,Dr$. It is an invariant subspace of the explicit number-preserving local gates below. It is not an alphabet restriction inside KR.

For positive mass $\mu$ and an independently chosen real momentum $p_{l}$ along the rail, let

$$
\begin{aligned}
h_l(g) &= N_l\sqrt{\mu^{2}+\gamma_l^{ab}p_ap_b}-\beta_l^{a}p_a,\\
H_e(g) &= \sum_l h_l(g)\,|l\rangle\langle l|\otimes I_{KR}.
\end{aligned}
\tag{6.0.4a.F1}
$$

This is an actual finite diagonal source Hamiltonian with the independently calibrated ADM arguments. It is not an assigned tensor or a rest-energy subtraction. On the flat base with constant p,

$$
E = \sqrt{\mu^{2}+p^{2}},\qquad h_l = E\text{ for every } l.
$$

All internal code and reset states have exactly the same mass and momentum. Thus mechanics cannot supply a second message coordinate.

During the j-th nearest-neighbor transfer use the actual enlarged B.4 interaction

$$
\begin{aligned}
H_{\mathrm{route},j}(t) &= i\hbar\theta'_j(t)\\
&\qquad \sum_a(|j+1,a\rangle\langle j,a|-|j,a\rangle\langle j+1,a|),
\end{aligned}
\tag{6.0.4a.F2}
$$

$$
\theta_j(t_j) = 0,\quad \theta_j(t_{j+1}) = \pi/2.
$$

It acts in the local site pair by rotating occupied/vacant states and vanishes on the unused complement. Each gate is a finite Hermitian matrix, supported on the real neighboring site addresses. The pulse has actual finite duration and norm; successive hops are executed, not declared as a single spatial identification. The source projectors onto loaded and charged-ready hosts are included and equal one on this admitted armed branch. Unarmed branches do not claim a completed transfer.

At the base 6.0.4a.F1 is E times the identity on the one-occupancy sector. Hence the complete propagator is a scalar phase times the real occupied-site rotation, tensored with $I_{\mathrm{KR}}$. Every arbitrary internal input and every reference are transferred **exactly** to the final site at every finite J. The final state of all other site registers is the fixed all-vacant state. The known scalar phase disappears on density operators.

The reset itself precedes the itinerary, at the sender. It is the actual full SWAP with fresh $A$ generated by $\hbar\Omega(I-S_{\mathrm{RA}})$, as in Theorem 6.0.4. No partial-isometry pulse is used for approximate $A$. After reset the transported $R$ is ready, and the spent $A$ never enters any rail coupling.

#### 6.0.4a — 2. Physical coframe response and action

The source uses the same canonical finite half-density action as the accepted rail construction,

$$
\begin{aligned}
S_{\mathrm{fin}} = \int dt\,\Bigl[&(i\hbar/2)\,\Psi^{*}\overset{\leftrightarrow}{d_t}\Psi\\
&- \Psi^{*}(H_e(g)+H_{\mathrm{route}}(g,t))\Psi\Bigr].
\end{aligned}
\tag{6.0.4a.F3}
$$

The lapse, shift, and strain derivatives of the actual 6.0.4a.F1 at the flat base are

$$
\begin{aligned}
\partial_Nh &= E,\\
\partial_{\beta^{a}}h &= -p_a,\\
\delta_\gamma h &= -(p_ap_b/(2E))\,\delta\gamma_{ab}.
\end{aligned}
\tag{6.0.4a.F4}
$$

Consequently the energy, momentum, and stress insertions have weights $E,p_a,p_a p_b/E$ at an occupied site. They are independent of the internal input and are the positive massive specialization of the canonical source variation. Choosing

$$
p = \mu/\sqrt{3},\qquad E = 2\mu/\sqrt{3}
$$

gives the actual dispersion velocity $\partial_p E=p/E=1/2$ used in the main theorem.

A concrete physical extension of 6.0.4a.F2 is multiplication by the measured proper-clock factor at its supported edge midpoint, with the base pulse calibrated to angle pi/2. The external waveform is held fixed in metric differentiation. More general actual real supported coefficient kernels are permitted but must be differentiated in full. Every such routing insertion remains imaginary antisymmetric on the position factor, tensored with $I_{\mathrm{KR}}$.

At every time the position density is real symmetric, because its evolution is real orthogonal up to a scalar phase. This remains true for an arbitrary complex internal $\rho_{\mathrm{KR}}$ and any reference: the position factor is independent. Thus the actual routing energy, metric-insertion, and switched-power means vanish exactly for **every admitted internal input**, not just for the orthogonal attaining ensemble. Their operators, norms, fluctuations, and force insertions have not been removed. The nonzero diagonal massive contribution 6.0.4a.F4 remains.

#### 6.0.4a — 3. Exact current and a common timelike mean-source limit

During one pulse the two occupation probabilities are $\cos^2\theta$ and $\sin^2\theta$. The exact mean energy current from $j$ to $j+1$ is

$$
\begin{aligned}
J_E(t) &= E\,\theta'_j(t)\sin(2\theta_j(t)),\\
\int_{t_j}^{t_{j+1}}J_E(t)\,dt &= E.
\end{aligned}
\tag{6.0.4a.F5}
$$

6.0.4a.F5 is an edge transfer rate (energy/time), not yet a spatial current density. Its actual continuum comparison representative on the real edge is

$$
\begin{aligned}
j_{E,j}(t,x) &= J_{E,j}(t)\int_0^1(x_{j+1}-x_j)\\
&\qquad \delta^{3}(x-[x_j+s(x_{j+1}-x_j)])\,ds.
\end{aligned}
\tag{F5a}
$$

The displacement factor has length $b$ on an inertial hop. Distributionally its divergence is $J_{E,j}(t)[\delta_{x_j}-\delta_{x_{j+1}}]$, which cancels the exact time derivative of the endpoint energy density. Thus this representative satisfies the exact weak continuity equation. Its integrated spatial flux over a completed hop is $b E$, not $E$. Omitting this factor would give an erroneous divergent $1/b$ current sum.

The same calculation gives transfer of momentum p and every internal label by the same occupied/vacant gate. These are actual commutator currents. The interaction contribution is allocated symmetrically to its two endpoints; its selected energy and endpoint-force means are zero, while the diagonal current (6.0.4a.F5) is retained. The finite instantaneous current is not asserted to equal v times site density during each pulse.

For the inertial part choose $x_{j+1}-x_j=b$ and $t_{j+1}-t_j=b/v$ with $v=p/E=1/2$. Choose a fixed smooth nondecreasing pulse shape rescaled to this interval. At every time its occupied-site support lies within $b$ of the reference worldline $X(t)=X(t_0)+v(t-t_0)$. Therefore for a compact $C^1$ test $f$,

$$
\begin{aligned}
&\bigl|\text{mean diagonal }\mathrm{source}_n(f)-T_{\mathrm{particle}}(f)\bigr|\\
&\quad \le C_fb(E+|p|+p^{2}/E)
\end{aligned}
\tag{6.0.4a.F6}
$$

per carrier over a fixed time interval. The constant includes that interval and the test derivative bounds. For the energy-current comparison use the vector distribution F5a, including its edge displacement $b$. Integrate each pulse using 6.0.4a.F5, compare the test across its space-time cell of diameter $O(b+b/v)$, and use the mean value theorem. Each pulse has integrated scalar rate $E$ and integrated vector current $b E$. Its per-hop test error is $O(b^{2} E)$, so summing $O(1/b)$ hops gives $O(b)$ with fixed $v>0$. The resulting continuum energy flux is $Ev=p$, precisely the momentum insertion in 6.0.4a.F4.

Thus energy density, current, and metric stress converge on the **same** source to

$$
T^{ab} = E\,w^{a}w^{b}\delta^{3}(x-X(t)),\qquad w = (1,v,0,0).
\tag{6.0.4a.F7}
$$

This is equivalently the massive proper-worldline tensor $\mu\int u^a u^b\,\delta_g(X-X(\tau))\,d\tau$. Equality follows from $E=\mu\gamma_v$, $u=\gamma_v w$, and $d\tau=dt/\gamma_v$. On the inertial route 6.0.4a.F7 is symmetric and conserved distributionally. This proves the proper-worldline source description used in the main theorem from actual finite site matrices and current, instead of assuming a movable quantum host.

For $N$ finite carriers the bound is at most $N$ times 6.0.4a.F6. One may first take $b\to0$ for each fixed $m$ and fixed compact/source test budget, or choose $b$ after the actual finite inventory. No uniform bound over all unscaled tests or a full stress-OVD theorem is asserted.

#### 6.0.4a — 4. Prehistory acceleration and source power

The prescribed acceleration occurs entirely at $x<0$, outside the receiver wedge. Approximate its smooth timelike curve by variable local edges and completed pulse intervals. At each finite stage choose the same scalar $p_n(t)$ at every currently active position site, and use $E_n(t)=\sqrt{\mu^{2}+p_n(t)^{2}}$ in 6.0.4a.F1. The internal input remains spectator and $E_n(t)$ commutes with every route gate. Thus endpoint state transfer is still exact, while the route/trajectory approximation is controlled separately.

The **explicit diagonal drive power** is $E'_n(t)$, and its integral is the kinetic-energy increase $E_{\mathrm{final}}-\mu$. The source's actual momentum change is $p'_n(t)$. The external controller and work reservoir carry the opposite work/impulse at the actual sender-side support. This is not a claim that an explicitly time-dependent Hamiltonian is closed and autonomous. Its full finite action, real coefficient programs, and ready flags remain in the ledger.

A fixed smooth trajectory can be approximated with errors O(b+Delta t) on compact tests; momenta and diagonal energies are bounded on this $v\le 1/2$ schedule, so Riemann convergence of the actual power/current insertions follows. There is no horizon-source singularity from acceleration because its support is a positive spatial distance to the left of W. The later inertial source is exactly the branch in §3.

#### 6.0.4a — 5. Causality, finite precursors, and the endpoint task

At a finite rail mesh, a local Hamiltonian pulse couples two sites separated by $b$. We do **not** claim exact continuum microcausality at sub-mesh distances or interpret its partial rotation as a point particle at every intermediate time. This is the same finite-precursor convention as the accepted rail source. The complete set of occupied supports remains within $O(b)$ of the prescribed subluminal curve, and all message dependence is confined to those supports. For any fixed spacelike-separated receiver test away from that curve and its $O(b)$ tube, the response is exactly input-independent once $b$ is small enough. The limiting transmitted process therefore has the stated timelike support.

The raw channel endpoint is after the completed final transfer. Its normal form is exact at every finite stage, not merely inferred from a mean-current limit. The geometric horizon is the independently realized continuum metric's null surface. Its crossing ports are identified by the limiting carrier worldlines, with a controlled $O(b)$ localization error and no ambiguity in the transverse owners. The main theorem makes no claim about differentiated entropy of arbitrarily small cuts through an unfinished pulse.

This is sufficient for the declared finite-source/continuum-geometry completed-cycle experiment. If a different task requires a strictly microcausal finite lattice theory at every sub-mesh separation, this construction does not assert it; that is not imported from the normal-form capacity theorem.

#### 6.0.4a — 6. All costs and density under longitudinal refinement

For one smooth monotone hop of duration $\tau=b/v$, define $\Gamma(t)=\hbar\,|\theta'(t)|$. Then

$$
\begin{aligned}
\lVert H_{\mathrm{route}}(t)\rVert &= \Gamma(t),\\
\langle H_{\mathrm{route}}(t)\rangle &= 0,\\
\langle H_{\mathrm{route}}(t)^{2}\rangle &= \Gamma(t)^{2},\\
\text{ground-relative excitation} &= \Gamma(t),\\
\int\Gamma(t)\,dt &= \pi\hbar/2,\\
\max\Gamma(t) &\le C_{\mathrm{shape}}\hbar/\tau.
\end{aligned}
$$

For the separate rectangular-pulse implementation $\theta'=\pi/(2\tau)$, $\Gamma$ is the constant $\pi\hbar/(2\tau)$; its endpoint switching is explicitly part of the controlled source. The smooth realization used in the convergence proof uses the preceding time-dependent formulas instead. There are $J$ actual hops. Their total integrated norm-action is $J\pi\hbar/2$, and their strengths/excitation grow as $b\to0$. No inference of free transport or bounded fluctuations is made. 6.0.4a.F1 additionally retains the full positive $E=\mu c^{2}\gamma_v$ after restoring $c$, and the launch work is $(\gamma_v-1)\mu c^{2}$. Time spacing is $b/v_{\mathrm{phys}}$ with $v_{\mathrm{phys}}=c/2$. Exact source-free internal energy degeneracy does not remove this scalar carrier energy.

Every vacant/occupied host, program word, reset/ready flag, pulse and fresh source stock is included before choosing the accepted positive-ready-gap diagonal. The actual degenerate-core source and its separate ready-energy inventory are reused at their stated controlled-host scope. The number of physical hosts and their total preparation, register, and pulse resources can diverge. Their existence at each finite stage is finite and explicit. The finite source does not invoke a literal complexity $C_{P}$ identification or a universal power price.

Longitudinal refinement **does not create additional parallel horizon channels**. There is exactly one occupied carrier and one full input KR factor on each transverse rail. Subdividing that rail adds compulsory sequential gates and fixed-vacant auxiliaries. Every smooth transverse cross-section still meets that rail once, and its final response-active output is the same KR factor. The physical transverse footprint $\delta^{2}$ is fixed independently.

If one insists on expressing E.3 with the auxiliary site spacing b rather than the transverse channel resolution $\delta$, the actual geometric census supplies

$$
\begin{aligned}
\sigma_{\mathrm{geom}} &= 1/\delta^{2},\\
\eta_b &= \delta^{2}/b^{2},\quad \chi = 1,\\
\chi/(\eta_bb^{2}) &= 1/\delta^{2}.
\end{aligned}
$$

This $\eta_{b}$ is **calculated from the sparse physical port graph**, not a weak-use probability or an entropy adjustment. It grows when longitudinal auxiliary sites are refined; no bounded-eta microscopic continuum limit is claimed. The direct census and main macroscopic theorem use $\delta$, not a fictitious fully populated b-spaced transverse port grid. Exposing new independent encodable rails would genuinely change this source and its capacity.

#### 6.0.4a — 7. Interface conclusion

6.0.4a.F1–6.0.4a.F7 populate the finite MPU realization that the provisional moving-worldline description lacked. Source admission now rests on the same finite local occupied/vacant Hilbert spaces, local Hermitian B.4 couplings, controlled source convention, calibrated coframe, actual current, and separately owned positive-ready hosts already exhibited in accepted evidence. The positive massive dispersion and internal-state-independent full reset are new explicit matrices.

The result is a selected **mean** source/geometry convergence and an **exact entire endpoint channel**. It supplies no full operator stress limit, scalar-field identification, universal clock, local differentiable entropy deformation, or Einstein branch. Those scope limits remain unchanged.

<a id="theorem-604-controlled-completed-reset-geometric-capacity-and-entropy-density"></a>**Theorem 6.0.4 (Controlled Completed-Reset Geometric Capacity and Entropy Density).**

Fix $D,r\ge2$ and an independently calibrated physical transverse footprint $\delta>0$. There is a controlled finite MPU source family with arbitrary input on $K\otimes R$, $\dim K=D$, $\dim R=r$, whose entire response-active completed output is

$$
\Phi(\rho) = \operatorname{Tr}_R(\rho)\otimes|0\rangle\langle 0|_R.
$$

Its supplied pure reset stock is consumed by an actual full SWAP; its spent output remains sender-owned and unavailable to the receiver. The uniform source ensemble $|k\rangle\langle k|\otimes I_R/r$ gives pure positive-weight outputs with average $I_K/D$ after discarding the ready factor, and $C(\Phi)=\ln D$.

On the same independently realized flat-cylinder causal horizon, one fixed physical transverse rail per $\delta^{2}$ cell gives $N=m^{2}$ actual crossings of a section with area $A=(m\delta)^{2}$. The source carries the same internal registers on explicit finite occupied/vacant rails with positive massive ADM dispersion. Its actual endpoint channel is exact at every stage; its current and metric source have a controlled common timelike mean limit. The physical carrier mass, pulse strength/source, blank stocks, positive-ready inventory, launch work, event records and future metric/thermal services are all retained in their actual source ledgers.

The received uniform state is the Gibbs state of the degenerate K factor, and a finite bath-ancilla reset protocol independently calibrates its thermodynamic entropy to kB ln D with explicit mesh and cutoff errors. The same N owners therefore satisfy

$$
S_{\mathrm{rel}}(A) = Nk_B\ln D = (k_B\ln D/\delta^{2})A.
$$

Keeping $\delta$ fixed and taking m to infinity gives a macroscopic exact density with zero remainder on the transverse torus. Applying the existing operational convention E.9 after the independent physical length/clock identification gives

$$
G_{\mathrm{op}} = c^{3}\delta^{2}/(4\hbar\ln D).
$$

This is an existential operational same-family realization, not a universal horizon law, deterministic infinitesimal entropy density, full stress-OVD limit, ambient AQFT/modular statement, local null-recovery theorem, or empirical identification with Newton G.

*Proof and full source construction.* The owned geometry/marker module is Lemmas 44b.1–44b.6 and Theorems 44b.7–44b.8. The actual finite massive source is Lemma 6.0.4a.

#### 6.0.4 — 1. Independently fixed geometry and units

Fix physical constants $c>0$, $\hbar>0$, $k_B>0$, a physical rod standard $\ell^*>0$, and an integer $q\ge 1$. The communication footprint is

$$
\delta = q\,\ell^{*} > 0.
$$

The rod and clock are specified before the Hilbert dimensions, message law, or entropy experiment. There is no equation setting $\delta$ from a desired entropy or gravitational coefficient. One may take ell* to be the SI metre standard and use the externally anchored c and $\hbar$; this is a formal unit convention, not an assertion that an experiment was performed.

For each integer $m\ge 8$, put $L=m\delta$ and use

$$
\begin{aligned}
M_L &= \mathbb{R}_t\times\mathbb{R}_x\times T_L^{2},\\
g &= -c^{2}dt^{2} + dx^{2} + dy^{2} + dz^{2}.
\end{aligned}
$$

The transverse torus is physical: y,z have periods L. It removes a peripheral edge correction, not a source contribution. The horizon is the past boundary of the right Rindler wedge

$$
\begin{aligned}
W &= \{x > |ct|\},\\
H^{-} &= \{ct+x = 0,\ x > 0\}.
\end{aligned}
$$

These are genuine causal sets of the independently calibrated Lorentz metric. For example the uniformly accelerated curve $(ct,x)=(\ell\sinh s,\ell\cosh s)$, with fixed transverse position, has the two null asymptotes. The bounded transverse torus distance does not change their causal boundaries: in the causal interval inequality its bounded squared contribution is dominated by the asymptotic longitudinal exponential term. Thus the intersection of the chronological future and past of the complete curve is $W$. No entropy value defines $H^-$.

Choose the cross-section

$$
\begin{aligned}
t_h &= -2\delta/(3c),\quad x_h = 2\delta/3,\\
H_m &= \{t = t_h,\ x = x_h\}\times T_L^{2}.
\end{aligned}
$$

Its independently calculated area is $A_m=L^{2}$.

#### 6.0.4 — 1.1 Actual metric realization, rather than a printed coordinate assignment

Specialize the accepted paid-history/ADM service to its allowed constant setting $a=1$, $N=1$, $\beta=0$, $\gamma=I$ in $c=1$ coordinates. At every finite service stage retain a four-dimensional event grid in a buffered compact history region of $M_{L}$. Execute a fresh stationary marker at each event, using the proper-time coupling and supplied blank of the accepted marker repair. Immutable addresses/timestamps and completed markers remain at their actual worldlines. All grid histories, including those with no communication carrier, are real executed marker histories.

For every shell edge $X,Y$, $\epsilon/2\le|X-Y|\le\epsilon$, the *actual compulsory completed gap* is

$$
E_{XY} = (E_{\mathrm{ref}}/\epsilon)\,|X-Y|.
$$

After both records exist, the independent geometry payload executes paid services with these gaps. It is never coupled to K, R, A, or the message input. Positive completed gaps are retained, and repeated queries use fresh flags or a paid reset. Actual source and query clocks remain distinct from a mathematical heat-semigroup parameter.

The inherited proof now specializes without any donor hypothesis: every graph path has its Euclidean length as its completed-work length, so it is no shorter than the Euclidean distance; rounded straight lines and the two-shell-edge endpoint repair give

$$
\begin{aligned}
0 &\le d_{\mathrm{service}}(X,Y)-|X-Y|\\
&\le C[(1+D_0)\epsilon + D_0b/\epsilon + e_{\mathrm{gap}}(1+D_0)].
\end{aligned}
$$

Here $b/\epsilon\to0$, $\epsilon\to0$ and $e_{\mathrm{gap}}\to0$ on buffered compact endpoint budgets. The same four-dimensional shell second moment, positive weights $b^{4}$, weak-liminf argument, and strong recovery give the flat four-dimensional metric/form limit. This is the constant-$a$ restriction of the proved formulas, not a claim of global PCE selection. Local charts on the transverse torus are used and then glued by its independently fixed periodic translations.

The independent six charged rods, normal-clock phase, and opposite transit services give $\gamma=I$, lapse 1, and zero shift by the explicit inverse in Lemma 44b.5. With physical units restored the null speed is $c$. Transit queries and rods occur in their actual paid calibration regions; replay of an earlier parameter is not called an earlier physical measurement.

The communication worldlines in §3 use these very same coordinates and seconds. Their frozen event associations enter the same marker grid and interpolation. This gives the commuting source-event $\to$ recorded-address $\to$ paid-metric square. Crucially $b$ is the **geometry-service resolution**, not the communication footprint $\delta$. Refining the former adds no message coupling or message port.

#### 6.0.4 — 2. Exact completed-reset channel on the full original input domain

Fix arbitrary integers $D\ge 2$ and $r\ge 2$. At each communication port the full admitted input is **every density operator on K tensor R**, $\dim K=D$, $\dim R=r$, including correlations with any external reference. No classical alphabet restriction is used to prove the channel bound. Take $U=I$, an allowed exact instance of the original normal form. The source provides one fresh $A$, $\dim A=r$, in the pure ready state $|0\rangle_A$.

Let $S_{\mathrm{RA}}$ be the full SWAP unitary and $Q_{\mathrm{RA}}=I-S_{\mathrm{RA}}$. $Q$ is Hermitian and positive semidefinite, with spectrum contained in $\{0,2\}$. A local proper-time pulse $H_{\mathrm{reset}}=\hbar\Omega Q$ with $\int\Omega\,d\tau=\pi/2$ implements

$$
V = \exp[-i\pi(I-S_{RA})/2] = S_{RA}.
$$

The equality follows separately on the symmetric and antisymmetric eigenspaces. In particular,

$$
V|j\rangle_R|a\rangle_A = |a\rangle_R|j\rangle_A,\qquad j,a = 0,\ldots,r-1.
$$

Thus $V$ is the exact full SWAP dilation, including on non-ready auxiliary inputs. Its positive scalar contribution is physically present in the source; it is not removed by a phase convention. This matters for the finite thermal approximants in §5.2. After the pulse, $K\otimes R$ is carried into $W$ while $A$ stays in the sender apparatus at $x=-2\delta$. Tracing $A$ gives, for every reference $E$,

$$
\begin{aligned}
\operatorname{Tr}_A\bigl[&(I_{KE}\otimes V)(\omega_{KRE}\otimes|0\rangle\langle 0|_A)\\
&(I_{KE}\otimes V^{*})\bigr]\\
&= (\operatorname{Tr}_R\omega_{KRE})\otimes|0\rangle\langle 0|_R.
\end{aligned}
$$

The final retained channel is therefore exactly

$$
\Phi(\rho) = \operatorname{Tr}_R(\rho)\otimes|0\rangle\langle 0|_R.
\tag{6.0.4.1}
$$

This is the **entire response-active output**, not a weak-cq degradation. Fixed source/clock/position records are input-independent spectators. If they are physically exposed, their full state is $\Phi(\rho)\otimes\tau_{\mathrm{fixed}}$; discard and append of $\tau_{\mathrm{fixed}}$ are inverse on this output family. They do not carry a second message-bearing channel. The raw port interface is $K\otimes R$ before receiver decoding.

#### 6.0.4 — 2.1 Saturation and unrestricted converse

For the actual source ensemble choose $p_k=1/D$ and

$$
\rho_k = |k\rangle\langle k|_K\otimes I_R/r.
$$

The reset is genuine: $R$ has entropy $\ln r$ before it is reset, and that entropy passes to the actual spent $A$. Nevertheless every positive-weight channel output is the pure state $|k,0\rangle\langle k,0|$, with average $I_K/D\otimes|0\rangle\langle 0|_R$. An orthogonal measurement reads $k$ without error.

For $n$ uses, even a reference-entangled input gives retained support contained in $K^{\otimes n}\otimes|0,\dots,0\rangle_R$. Its Holevo information is at most $n\ln D$. The uniform product basis realizes equality at every $n$. Hence

$$
C(\Phi) = \ln D,\qquad C(\Phi^{\otimes N}) = N\ln D.
\tag{6.0.4.2}
$$

The equality criterion is also exact: nonnegative individual output entropies and the bound $S(\text{average})\le\ln D$ leave equality only when every positive-weight reduced $K$ output is pure and its average is $I_K/D$. This is the criterion of Theorem 6.0.2 on the actual implemented channel.

A reference carrying the message is not given free to the receiver. Entanglement-assisted classical capacity is a different task. The proof covers entangled encoding across uses for the ordinary unassisted classical capacity, as the original theorem does.

#### 6.0.4 — 2.2 Side-output falsifier

If $A$ becomes an available output, the map on KRA is isometric and the orthogonal input alphabet $|k,j\rangle$ has $Dr$ perfectly distinguishable outputs. Its capacity is $\ln(Dr)$, not $\ln D$. Therefore $A$ is not called erased from the universe. It is a physically owned sender-side output excluded from this receiver cut. This exclusion is implemented by location and absent couplings, not by omitting an available archive from an entropy calculation.

#### 6.0.4 — 3. Actual source, routing, output timing, and all supports

#### 6.0.4 — 3.1 Controlled moving-register realization

Use the explicit finite occupied/vacant rail source of Lemma 6.0.4a. At each stage the carrier is a finite one-occupancy sector of local site registers, transported by actual nearest-neighbor Hermitian pulses acting identically on every KR state. Its positive massive ADM Hamiltonian has weights E,p,pp/E, and its real routing current converges to the same timelike source. Its full endpoint quantum channel is exact at each stage. The following worldline notation denotes that controlled continuum mean interpretation; it does not claim exact sub-mesh microcausality. A carrier has fixed positive rest mass $\mu$, independently of its internal K,R state. Its internal Hamiltonian is degenerate outside local pulses. The carrier's actual action, in physical units, is

$$
\begin{aligned}
S_{\mathrm{car}} &= -\mu c^{2}\int d\tau\\
&\quad + \int(i\hbar/2)\,z^{*}\overset{\leftrightarrow}{d_\tau}z\,d\tau\\
&\quad - \int z^{*}H_{\mathrm{int}}z\,d\tau.
\end{aligned}
\tag{6.0.4.3}
$$

The internal Hilbert dimension is finite. At each finite stage, the classical addresses, clock schedules, fixed-vacant auxiliary inputs and actual one-occupancy site matrices are precisely those in 6.0.4a.F1–6.0.4a.F3 of the rail supplement. The worldline is their controlled common mean limit, not an extra unimplemented moving host or hidden input coordinate. The scalar rest-energy term is physical and is never subtracted from the source. Its internal independence ensures that motion gives no additional message-dependent output.

During reset, add the actual local interaction $H_{\mathrm{int}}=\hbar\Omega Q_{\mathrm{RA}}$ at $x=-2\delta$. Both $R$ and its supplied $A$ are present there. The state source supplies $A$ pure and $R$ maximally mixed independently of $k$. All supplied states, rather than an imaginary finite-temperature perfect eraser, are part of the finite initial datum.

After reset, separate $A$ from the transported KR register. $A$ remains stored at $x=-2\delta$ for the complete receiver task and is never coupled to a register entering $W$. The sender worldline $x=-2\delta$ lies outside $W$ at every time. Source records of reset, blank stock, work, and any purification of the independent $R$ law remain there or in other explicitly sender-owned registers. No $K$-dependent archive is created by reset, which acts as $I_{K}\otimes V_{\mathrm{RA}}$.

#### 6.0.4 — 3.2 Timelike route and actual horizon crossing

Perform reset before $t=-10\,\delta/c$. The carrier is initially stationary at $x=-2\delta$. A smooth controlled acceleration outside $W$ brings it to $x=-\delta$ at $t=-4\,\delta/c$ with velocity $c/2$. One explicit bounded-acceleration schedule, allowing endpoint smoothing if desired, has duration $T=6\,\delta/c$ and

$$
\begin{aligned}
v(s) &= (c/2)(s/T)^{2},\\
x(s) &= -2\delta+\delta(s/T)^{3},\qquad 0\le s\le T.
\end{aligned}
$$

It has the required displacement $\delta$. Its entire support has $x<0$ and lies outside $W$. External acceleration work and impulse belong to the sender drive. They are not zero: the final kinetic energy is $(\gamma_v-1)\mu c^{2}$, $\gamma_v=2/\sqrt{3}$. Any smooth endpoint correction is fixed before the run and can be chosen to preserve these endpoint data.

For $-4\delta/c\le t\le0$ and through a small final observation window, the carrier is inertial:

$$
x(t) = \delta+(c/2)t,\quad y = i\delta,\quad z = j\delta.
$$

It intersects $H^-$ exactly once, at $(t_h,x_h)$ specified in §1. Its velocity is $c/2<c$, so this is actual causal transport of the same register. At $t=0$ it is at $x=\delta$ inside $W$. Let the quantum output be the internal KR algebra at that event; receiver decoding acts locally afterward. For $0<t<t_*<2\delta/c$ the limiting moving carrier remains in $W$ and its **KR internal Hamiltonian** is zero. If the finite rail realization is continued into this window, its position-routing pulses remain actual nonzero source operators with their owned norm, excitation, metric response and fluctuation records. They act as the identity on KR but are not absent from the full physical source. The reset pulse is entirely in the earlier sender region. No conclusion about a full cut modular generator follows merely from the zero internal storage Hamiltonian.

At each finite stage there are only actual local rail gates at mesh $b$, whose occupied supports remain within $O(b)$ of the timelike curve; the finite-precursor/limiting causal distinction is proved in part 5 of Lemma 6.0.4a. No long edge is declared an instantaneous exact causal transport. Acceleration is entirely outside $W$; the limiting inertial route transports the physical register. A later capture, readout, or reset is an actual additional operation after the channel endpoint, with its own local work and entropy record. It is not included in $\Phi$ unless explicitly composed with $\Phi$.

#### 6.0.4 — 3.3 Metric/current/power source and finite costs

The rest-mass term of (6.0.4.3) has the ordinary positive worldline stress. In $c=1$ notation,

$$
T_{\mathrm{car}}^{ab}(X) = \mu\int u^{a}u^{b}\,\delta_g(X-X(\tau))\,d\tau.
$$

It is nonzero and is conserved on the inertial route. At acceleration/capture supports, its divergence is the actual external force density. The drive apparatus owns the opposite force, energy, and impulse. This is the driven balance law; the autonomous B.3 current identity is not invoked while deleting power terms.

The reset pulse has proper action $-\int\hbar\Omega Q\,d\tau$. Its drive is frozen under metric variation, so every physical insertion includes the actual proper-time coefficient derivative multiplying $Q$. For the chosen source $R=I/r$, $A=|0\rangle$, $\operatorname{Tr}(\rho S)=1/r$, and $Q$ commutes with its own evolution. Consequently throughout the pulse

$$
\begin{aligned}
&\langle Q\rangle = 1-1/r,\quad \langle Q^{2}\rangle = 2(1-1/r),\quad \operatorname{Var}(Q) = 1-1/r^{2},\\
&\langle H_{\mathrm{reset}}\rangle = \hbar\Omega(1-1/r) > 0\text{ when }\Omega > 0,\\
&\int\lVert H_{\mathrm{reset}}\rVert\,d\tau = \pi\hbar.
\end{aligned}
$$

The metric insertion and switched-power means are correspondingly **nonzero** and belong to the sender-side source. The selected integrated positive interaction energy is $(\pi\hbar/2)(1-1/r)$. For a pulse which starts and ends at zero coefficient, the net switched work is zero because $\langle Q\rangle$ is constant; this does not make its instantaneous energy, stress, source contacts, or strength zero. Its full support is outside $W$. The rest-mass term is retained separately. The reset uses this positive-generator realization of the full SWAP; a partial-isometry pulse would have a thermal extension other than SWAP for $r\ge 3$.

Every finite m and geometry stage has a finite explicit inventory:

- $N=m^{2}$ carriers of mass $\mu$ with KR internal factors;
- $N$ fresh pure $r$-level $A$ stocks, $N$ spent $A$ records, and the independently prepared $R$ law;
- the sender's finite launch/control/reset words, work reservoir, actual preparation/readout records, and drive profiles;
- actual positive ready flags for each host and service, with their real proper gaps and lifetimes;
- the accepted event markers and their immutable words;
- the finite dense-shell geometry-query graph, fresh charged query flags, independent payloads, clock probes and all later reset reservoirs;
- receiver instruments only when they are actually used after the raw endpoint.

The source is the sum of these actual terms. It does not identify operational cost, stress expectation, and carrier entropy. Pulse norm-action, finite ready charging work, launch kinetic work, preparation free-energy stock, and every future query charge are separate quantities. The claim is finite specified resources at each stage, not free operations or a uniform resource bound under geometric refinement.

For the geometry stage, choose positive ready gaps using a bound on the finite inventory listed above, after enumerating all flags. Their total tested insertion can be made $\le e_n$ with $e_n\to 0$ while every finite gap remains positive. Their pulses do not acquire small strength by this choice. Nonzero message-carrier mass density is **not** sent to zero or concealed in this diagonal. No full stress-OVD or fluctuation limit is claimed.

#### 6.0.4 — 3.4 Exact output audit

At the channel endpoint:

1. KR on the N received carriers is the only message-dependent receiver input/output system.
2. A and its source purifications remain outside W and have no later interaction with W during the task.
3. The carrier mass, trajectory, arrival times, and internal-independent ready flags are fixed independently of every $\rho_{\mathrm{KR}}$.
4. Geometry programs, marker outcomes, and future calibration services depend on the frozen metric and schedule only. Their actual couplings are disjoint from KRA.
5. No public mask, conditional archive, code-selection flag, or message-bearing history output is supplied.
6. A receiver measurement record is a postprocessing of KR; it is not a new independent route through the cut.
7. Sender message/purification references are not initially receiver side information.

Hence the full response-active endpoint channel is (6.0.4.1), with no restricted-alphabet reinterpretation. Any enlargement granting A, sender references, an input-dependent feedback archive, or extra couplings requires a fresh channel/capacity calculation.

#### 6.0.4 — 4. Geometric density is a census of these very ports

The actual source has one carrier rail for each $(i,j)\in(\mathbb{Z}/m\mathbb{Z})^{2}$, at transverse address $(i\delta,j\delta)$. All rails share the same independently fixed subluminal trajectory. At $H_{m}$ there is therefore exactly one actual crossing per transverse square of area $\delta^{2}$:

$$
N_{\mathrm{geom}} = N = m^{2} = A_m/\delta^{2}.
\tag{6.0.4.4}
$$

The intersection map is

$$
\begin{aligned}
\text{carrier owner }(i,j) &\to \text{its unique }H^{-}\text{ intersection}\\
&\to \text{its geometric surface square}\\
&\to \text{its received }KR\text{ port}.
\end{aligned}
$$

It is a bijection. Its Jacobian in the transverse directions is the identity, so its area is not fitted from the entropy. There is no activation probability or reduced alphabet multiplying the physical port count.

The source channel is a tensor product over these owners, and each independent input coordinate has the faithful response map $\rho_K\to\rho_K$. Thus no two port response coordinates are quotiented together; the effective independent count is $N_{\mathrm{eff}}=N_{\mathrm{geom}}$. The original density convention can consequently be registered at resolution $\delta$ with $\eta=1$ and $\chi=1$. This is a direct density certificate; no inference from a global PCE-minimum theorem is needed.

The controlled geometry apparatus is not an additional communication port. Its inputs are fixed independently of $\rho_{\mathrm{KR}}$, and its Hamiltonian contains no coupling that could transfer K or A into its payload. The assertion remains true after every service refinement. Turning it into another message service would change the admitted channel, and the count would have to change.

#### 6.0.4 — 4.1 Correct limit and the forbidden dilution

Keep $\delta$, $\mu$, $D$, $r$, and the external units fixed. Let $m\to\infty$. Then (6.0.4.4) is exact at every finite $m$, with zero boundary remainder, and $A_m/\delta^{2}\to\infty$. The independent geometry-service convergence $b\to0$ is taken on fixed compact tests, or on a diagonal meeting the requested metric accuracy. It never changes $\delta$.

For any fixed finite union of transverse communication cells, the same additivity and census hold exactly. For regular non-cell-aligned windows the elementary boundary-cell estimate is $O(\text{perimeter}/\delta+1)$; dividing by area in the macroscopic shape-controlled limit gives zero. We do not claim a finite density uniformly for arbitrarily tiny windows below the physical footprint.

If instead $\delta_n\to0$ while $D\ge 2$ remains nontrivial and the full independent count is $A/\delta_n^{2}$, then

$$
\begin{aligned}
S_{\mathrm{rel}}/A &= k_B\ln D/\delta_n^{2} \to \infty,\\
G_{\mathrm{op}} &= c^{3}\delta_n^{2}/(4\hbar\ln D) \to 0.
\end{aligned}
$$

No weak activation or $h(p)$ factor can cure this divergence while retaining the same full channel and port count. This proof does not take that limit.

#### 6.0.4 — 5. Same-source thermodynamic identification and additivity

The source distribution on the **actual received internal K register** is $I_K/D$. Its physical internal Hamiltonian is zero (or a scalar rest-energy multiple, which cancels from Gibbs normalization), so this is exactly its Gibbs state at any fixed positive externally calibrated temperature $T$. Its finite statistical thermodynamic entropy is

$$
S_K = -k_B\operatorname{Tr}[(I/D)\ln(I/D)] = k_B\ln D.
$$

This is also the entropy of its reliably decoded uniform label and the Holevo information of the pure-output ensemble. The three quantities agree on the same states and same physical registers; they have not been equated for arbitrary nonorthogonal ensembles. The ready R factor has entropy zero. Independent carrier/source inputs give exactly additive output states and entropy:

$$
\begin{aligned}
S_{\mathrm{boundary},\mathrm{rel}}(A_m) &= Nk_B\ln D\\
&= (k_B\ln D/\delta^{2})\,A_m.
\end{aligned}
\tag{6.0.4.5}
$$

Here “boundary thermodynamic response entropy” means the actual Gibbs/response entropy carried by these registered horizon-crossing ports, the operational ledger of E.6. It is not the entropy of the entire universe, all source purifications, or all apparatus. In particular the spent $A$ stocks retain $N\ln r$ of entropy for the chosen source, and are not discarded from the global ledger. No theorem identifies an unrelated vacuum entanglement entropy with (6.0.4.5). If a later KMS/recovery task retains the full $R$ matrix algebra, the actual pure-ready $R$ state is not a faithful KMS state for its zero Hamiltonian. A faithful reference $I_R/r$ adds the explicit relative-entropy constant $\ln r$; that constant cannot be silently dropped when a moving cut changes ownership of $R$. This proof does not compress the physical cut algebra to bypass that issue.

#### 6.0.4 — 5.1 Direct finite thermal calibration, with errors

To independently verify the thermodynamic value, subject a received K in I/D, after the raw channel endpoint, to an ordinary local reset apparatus at bath temperature T with **no access to the remote message label**. Let ground level 0 remain at energy zero and raise the D-1 other levels to energy E. Their Gibbs probability is

$$
\begin{aligned}
q(E) &= (D-1)\exp(-\beta E)/(1+(D-1)\exp(-\beta E)),\\
\beta &= 1/(k_BT).
\end{aligned}
$$

A finite implementation uses a mesh $0=E_0<\dots<E_s=\Lambda$. At step $j$ raise the level energy while isolated, then exchange heat by a SWAP with a fresh bath ancilla in the Gibbs state for that same Hamiltonian. These thermalizations are actual finite auxiliary operations; all fresh bath states and spent ancillas are owned. The quasistatic work limit is the directly integrated quantity

$$
\begin{aligned}
W_\Lambda &= \int_0^\Lambda q(E)\,dE\\
&= k_BT\,[\ln D-\ln(1+(D-1)e^{-\beta\Lambda})].
\end{aligned}
$$

A monotone left/right Riemann estimate bounds the finite-mesh work error by $\max_j(E_j-E_{j-1})$, since $q$ decreases by at most one. After the last thermalization the energy is $\Lambda q(\Lambda)$. Lowering those levels while isolated recovers that energy. Thus the heat exported in the completed cycle tends to

$$
\begin{aligned}
Q_\Lambda &= W_\Lambda-\Lambda q(\Lambda),\\
Q_\Lambda/(k_BT) &\to \ln D.
\end{aligned}
$$

The finite tail obeys

$$
\begin{aligned}
0 &\le \ln D-Q_\Lambda/(k_BT)\\
&\le (D-1)e^{-\beta\Lambda}(1+\beta\Lambda).
\end{aligned}
$$

The final internal state is within trace norm $2q(\Lambda)$ of a pure ready state. Its exact finite entropy is $h(q)+q\ln(D-1)$, tending to zero. These equations prove the thermal normalization by a physical post-endpoint operation with a controlled error, not by defining its heat to equal the channel capacity. Independent reset apparatuses compose additively over the same $N$ owners. At finite $N$ a common mesh/tail budget controls the total error, and the per-area error is the per-port error divided by $\delta^{2}$.

If the receiver is instead granted the remote label or a perfectly correlated archive, its conditional reset debit may decrease, even to zero. That is a different thermodynamic task. It does not change (6.0.4.1), (6.0.4.2), or the unconditioned Gibbs entropy; this proof never replaces conditional entropy by unconditional entropy without specifying access.

#### 6.0.4 — 5.2 Pure-stock ownership and the exact/limiting distinction

The exact qualifying channel uses N **supplied nonfaithful pure A stocks**. This is explicitly allowed by the canonical exact reset dilation and is an initial physical resource, not a claimed finite-temperature free reset. Relative to a degenerate r-level Gibbs stock at T it has nonequilibrium free-energy resource kB T ln r per port. The exact finite source owns that stock and its actual spent output. Repeated uses consume fresh stocks; no cyclic reuse is asserted.

The finite thermal protocol above with D replaced by r provides independently controlled approximate stocks, not exact pure states. If its residual weight is $\epsilon$, the channel is

$$
\begin{aligned}
\Phi_\epsilon(\rho) &= \operatorname{Tr}_R(\rho)\otimes\tau_\epsilon,\\
\lVert\Phi_\epsilon-\Phi\rVert_\diamond &= \lVert\tau_\epsilon-|0\rangle\langle 0|\rVert_1 = 2\epsilon.
\end{aligned}
$$

Its K communication capacity is still ln D, but it is not called the literal pure-ready normal form at finite $\epsilon$. The exact theorem is the supplied-resource branch; the physically thermal approximants converge to it with the stated error and unbounded limiting level cutoff. This respects the faithful-environment obstruction rather than hiding it.

#### 6.0.4 — 6. Independent unit map and operational coupling

The actual rod/clock/transit responses establish $\delta$ in physical length units and c in the same physical seconds; the source and thermal ledger use the externally calibrated $\hbar$ and kB. None is obtained by solving for a desired entropy density. Equation (6.0.4.5) then gives the positive physical coefficient

$$
\rho_S = \ln D/\delta^{2}\quad [\text{inverse physical area}].
$$

Only now apply the original operational convention E.9:

$$
\begin{aligned}
G_{\mathrm{op}} &= c^{3}/(4\hbar\rho_S)\\
&= c^{3}\delta^{2}/(4\hbar\ln D).
\end{aligned}
\tag{6.0.4.6}
$$

This is dimensionally $L^{3}M^{-1}T^{-2}$. It is a derived coefficient of the independently specified formal source plus the stated 1/4 normalization convention. It is not an empirically predicted or measured Newton constant. No matching to the signed-ray $B$ coefficient of Lemmas 12.1h.1–12.1h.5 and Theorem 12.1h.6 or to the scalar source is claimed. Setting $G_{\mathrm{op}}$ equal to measured $G$ would be another empirical calibration and is outside this existential result.

Changing D at fixed physical geometry changes (6.0.4.6) without changing the rod/transit readings; changing the rod spacing at fixed D changes the density with the known square law. These are falsifiable separate controls. They demonstrate rather than conceal the nonentailment in Theorem 6.0.3: the channel alone does not fix $\delta$, but this same-source experiment supplies it independently.

#### 6.0.4 — 7. Commuting-map audit

All maps are on this one source family.

- Full input $\to$ reset dilation $\to$ received port: tracing sender $A$ gives (6.0.4.1), including references. Transport acts identically on every internal component.
- Uniform source ensemble $\to$ received density $\to$ decoder: gives pure positive outputs, average $I/D$, and exact zero-error labels on the same $K$ factors.
- Worldline owner $\to$ horizon intersection $\to$ cell $\to$ output factor: is the bijection of §4. The same $N$ appears in the physical census, product channel, and thermal reset sum.
- Physical event $\to$ completed timestamp/address marker $\to$ history service $\to$ continuum chart: uses the accepted marker and paid-service construction with constant coframe. It does not use entropy or capacity in any edge gap.
- Rod/clock/transit $\to$ physical metric $\to$ carrier proper action: uses the same $c$, $\delta$ and proper-time factor, including their first metric responses. Nonzero rest-mass stress remains in the source.
- Actual $K$ Gibbs state $\to$ thermal reset heat: uses §5.1, with finite mesh and tail error; no post hoc rescaling of a packet or conditioning on a rare event.
- Disjoint cells $\to$ tensor source $\to$ product channel $\to$ additive entropy/heat: each step is an actual tensor factor or disjoint independently supplied apparatus. No common mask or reset reservoir correlates otherwise independent message ports.
- Physical unit anchor $\to$ measured cell area $\to\rho_S\to$ E.9: uses a fixed independent length standard, not a fitted coefficient.

## 6.1 Principle of Compression Efficiency (PCE)

The adaptation of predictive systems is governed by an optimization principle that balances predictive utility against resource costs.

<a id="611-definition-14-def-14-optimal-complexity-allocation-criteria"></a>**6.1.1 Definition 14 (Def 14): Optimal Complexity Allocation Criteria**

Throughout the differential model in Sections 6.1–6.8, let
$$
C(t):=\langle\hat C_v\rangle(t)
$$
be the continuous operational complexity coordinate, measured in the same calibrated bit units as the proxy baseline corresponding to $C_{op}$. Assume that $PP(C,\hat C_{\mathrm{target}})$, $R(C)$, and $R_I(C)$ admit the differentiable interpolations stated below on this operational domain. The integer-valued theoretical quantity $C_P$ remains distinct; equality $C_P=\langle\hat C_v\rangle$ is used only on branches satisfying the hypotheses of Theorem 2.

The Optimal Complexity Allocation $C^*$ is a maximizer of the declared net-benefit function on this operational domain for a registered task-scale coordinate $\hat C_{\mathrm{target}}$ and resource-scarcity weight $\lambda$.

Let
$$
J(C):=\Gamma_0PP(C,\hat C_{\mathrm{target}})-\lambda R(C)-R_I(C)
$$
on the feasible domain $C\ge C_{op}$. Assume these functions are twice differentiable near a candidate allocation $C^*$.

1. **Interior stationarity.** If $C^*>C_{op}$ is an interior local maximizer, then
   $$
   J'(C^*)
   =\Gamma_0\frac{\partial PP}{\partial C}\bigg|_{C^*}
   -\lambda R'(C^*)-R_I'(C^*)=0,
   \quad \text{(18)}
   $$
   so marginal benefit equals marginal cost.

2. **Strict local maximality.** If Equation (18) holds and
   $$
   J''(C^*)
   =\Gamma_0\frac{\partial^2PP}{\partial C^2}\bigg|_{C^*}
   -\lambda R''(C^*)-R_I''(C^*)<0,
   \quad \text{(19)}
   $$
   then $C^*$ is a strict local maximizer. At the boundary $C^*=C_{op}$, the corresponding one-sided necessary condition is $J'(C_{op})\le0$; Equation (18) is not required.

3. **Viability constraint.** An operationally viable allocation must also satisfy $\alpha<PP(C^*,\hat C_{\mathrm{target}})<\beta$.

<a id="612-definition-15-def-15-principle-of-compression-efficiency-pce"></a>**6.1.2 Definition 15 (Def 15): Principle of Compression Efficiency (PCE)**

The Principle of Compression Efficiency declares an objective on a specified admissible comparison class: maximize registered predictive benefit while charging every registered acquisition, representation, processing, update, maintenance, and adaptation cost. It does not by itself prove that a minimizer exists or that physical dynamics reaches one. A PCE-attractor conclusion requires an explicit adaptation law together with attainment, invariance, stability, recurrence or convergence, and strictness hypotheses appropriate to that law. When those records are supplied, the objective balances Meaning Potential, quantified through registered improvements such as $\Delta Q$, against the Signal Cost entries $R(C)$ and $R_I(C)$ and their operational representatives.

<a id="remark-relation-to-ppi"></a>**Remark (Relation to PPI).** PCE supplies an explicit potential $V$ and adaptation dynamics on a declared admissible class. Existence of a global minimizer requires attainment hypotheses; uniqueness modulo symmetry, flat QFI, and capacity saturation require additional branch conditions. The phrase "PCE selects" refers to minimization subject to those stated conditions.

<a id="definition-15a-def-15a-pce-attractor-branch"></a>**Definition 15a (Def 15a): PCE-Attractor Branch**

Let $\mathcal G_V$ be the declared group of gauge, relabeling, and other symmetries preserving $V$. A **PCE-Attractor branch** is a branch on which:

1. $V$ attains its infimum and $\mathcal E_*^{\mathrm{global}}\ne\varnothing$;
2. the quotient minimizer set is a singleton,
$$
\mathcal E_*^{\mathrm{global}}/\mathcal G_V=\{[x_{\mathrm{attr}}]\};
$$
3. the selected orbit has the U(1)-sector flat SLD-QFI spectrum $\sigma^2=0$ required by the cited Appendix W and Z branch;
4. the constrained minimum of the rate-level potential lies on the declared upper capacity boundary; on the one-dimensional cap-active branch, the unconstrained minimizer lies strictly above that boundary.

The symbol $x_{\mathrm{attr}}$ denotes a chosen representative of this orbit. Theorem D.3 may be used to infer geometric regularity only when its strict-comparison hypothesis holds; it does not establish clauses 1–4. The equality $\kappa^*_{\mathrm{bulk}}=1$ requires the separate unit Predictive-Ward branch of Theorem Z.14 and Theorem X.3.

<a id="613-definition-16-def-16-prediction-optimization-problem-operational-goal"></a>**6.1.3 Definition 16 (Def 16): Prediction Optimization Problem - Operational Goal**

The Prediction Optimization Problem (POP, Axiom 1), when viewed operationally within the adaptation dynamics driven by PCE (Definition 15), is the ongoing challenge for the adaptive system to dynamically allocate its limited resources (manifesting as operational costs $\langle \hat{R} \rangle, \langle \hat{R}_I \rangle$, Theorem 3, weighted by scarcity $\lambda$) by adapting its internal model complexity (represented by $\langle \hat{C}_v \rangle$, Theorem 1) to achieve the highest possible predictive performance $PP(C, \hat{C}_{\mathrm{target}})$ (consistent with Theorem 19), while strictly adhering to the viability constraint $PP(t) \in (\alpha, \beta)$ (Axiom 3). The system adaptively seeks the complexity level $C^*(t)$ that satisfies the optimal allocation criteria (Definition 14) consistent with PCE.

**6.2 Complexity-Performance Scaling Principles**

We now establish the general principles governing the relationship between invested complexity and achievable performance, and derive the expected functional form.

<a id="621-definition-17-def-17-physical-realizability"></a>**6.2.1 Definition 17 (Def 17): Physical Realizability**

A predictive model $M$ or system state $\mu$ is physically realizable when there is a single finite program satisfying every constraint in the declared hierarchy:
$$
\bigcap_{n\ge0}\mathcal M_n(\mu)\ne\varnothing.
$$
Any $P_{\mathrm{phys}}$ in this intersection gives
$$
C_{P,n}(\mu)\le K(P_{\mathrm{phys}})
$$
for every $n$, so the monotone limit $C_P(\mu)$ is finite. Theorem 2.4.1b gives the converse under the declared finite program alphabet, integer-valued program length, nested-admissible-set, and attained-minimum convention: a uniform finite bound on the stagewise minima makes the descending bounded candidate sets nonempty, and their full intersection contains a common realizer. Relative to an accepted structurally independent hierarchy registration and its declared sound trust base, Definition 2.4.1d and Theorem 2.4.1e verify a supplied minimum realizer, compute its exact value and a valid instance cutoff, and certify the complete supplied minimizer family when the exact-minimizer certificate passes. Acceptance of the baseline-identity extension with physical-constraint inventory coverage identifies the stagewise and extended hierarchy values for every submitted target and identifies $C_P^{(h_H)}$ with the baseline $C_P$ on the full-constraint-realizable domain.

<a id="622-definition-18-def-18-ppc-requirement-c_ppcpp_target"></a>**6.2.2 Definition 18 (Def 18): PPC Requirement $C_{PPC}(PP_{\mathrm{target}})$**

For a target average predictive performance $PP_{\mathrm{target}}$ within the viable range $(\alpha, \beta)$, the Predictive Physical Complexity Requirement $C_{PPC}(PP_{\mathrm{target}})$ is the minimum theoretical complexity $C_P$ (Equation 1) required by any physically realizable (Definition 17) model $M$ or system state to achieve that performance level on average against a given predictive challenge:
$$
C_{PPC}(PP_{\mathrm{target}}) = \inf \{ C_P(\mu) \mid \mu \in \mathcal{S}_{\mathrm{phys}}, \mathbb{E}[PP(f_{\mu})] \geq PP_{\mathrm{target}} \} \quad \text{(20)}
$$
where the expectation $\mathbb{E}[\cdot]$ averages over relevant environmental conditions or task distributions.

<a id="623-theorem-17-complexity-lower-bound-above-a-nonviable-budget"></a>**6.2.3 Theorem 17 (Complexity Lower Bound above a Nonviable Budget)**

Choose an environment and task distribution, and define
$$
PP_{\max}(C)
:=\sup\{\mathbb E[PP(f_\mu)]\mid
\mu\in\mathcal S_{\mathrm{phys}},\ C_P(\mu)\le C\}.
$$
Assume $PP_{\max}(C_{op})\le\alpha$. Then every physically realizable state $\mu$ with $\mathbb E[PP(f_\mu)]>\alpha$ satisfies $C_P(\mu)>C_{op}$.

*Proof.* If $C_1\le C_2$, then
$$
\{\mu:C_P(\mu)\le C_1\}
\subseteq
\{\mu:C_P(\mu)\le C_2\},
$$
so $PP_{\max}$ is non-decreasing. Suppose $C_P(\mu)\le C_{op}$. By the definition of the supremum and the hypothesis,
$$
\mathbb E[PP(f_\mu)]
\le PP_{\max}(C_P(\mu))
\le PP_{\max}(C_{op})
\le\alpha.
$$
The contrapositive gives $\mathbb E[PP(f_\mu)]>\alpha\Rightarrow C_P(\mu)>C_{op}$. ∎

**6.2.4 Physical Nature of Complexity Transformations (Conditional Thermodynamic Ledger)**

The adaptation process involves changing the system's complexity $C(t)\to C(t+1)$ (Section 6.4), corresponding to a physical transformation within the system's representational medium (Theorem 7) and potentially contributing transient Adaptation Costs to the SC ledger of Definition 15. If a registered implementation merges or overwrites retained logical distinctions and then performs a cyclic isothermal reset satisfying Definition 28, Theorem 31 gives
$$
\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R).
$$
A positive implementation-independent floor inferred from this entropy bound additionally requires a registered bound $H_q(P\mid R)\ge h_{\min}>0$. Reversible and reset-free complexity transformations lie outside this registered reset branch.

<a id="625-definition-19-def-19-complexity-performance-scaling-principles"></a>**6.2.5 Definition 19 (Def 19): Complexity-Performance Scaling Principles**

Definition 19 specifies a branch-level analytic interpolation for a declared task, score, evaluation window, boundary coordinate $C_{op}$, and estimated target scale $\hat C_{\mathrm{target}}$. Let $\overline{PP}$ denote its continuous analytic extension to $C=C_{op}$; the corresponding viable physical performance curve is its restriction $PP=\overline{PP}|_{C>C_{op}}$. This definition is not a model-existence or infimum-attainment theorem.

1.  **Bounds and boundary value:** The image of $\overline{PP}$ for $C\ge C_{op}$ lies in $[\alpha,\beta)$, while the viable realized image of $PP$ lies in $(\alpha,\beta)$:
$$
\overline{PP}(C_{op},\hat{C}_{\mathrm{target}})=\alpha,\qquad \lim_{C\to\infty} PP(C,\hat{C}_{\mathrm{target}})=\beta.
$$
The response-law parameter $\beta$ is approached asymptotically but not reached for finite $C$ on this branch. It is distinct from Theorem 9's certified pathwise ceiling $\beta_0$ and from any task-relative SPAP boundary; neither Theorem 9 nor PCE alone derives this response law.

**Same-task attainment guard.** Suppose this $PP$ is the score used in Definition 13, $\alpha$ is that task's random-baseline value, the qualifying margin is strictly positive, and a registered same-state complexity bridge sends an attained $\mu_*$ with $C_P(\mu_*)=C_{op}$ to the response-law coordinate $C=C_{op}$. Then every $\mu\in\mathcal Q$ has $PP(\mu)>\alpha$, so the displayed extension value cannot be assigned to that same-task MPU. The $\alpha$-anchored law is admissible only as a nonattained analytic-boundary interpolation or on a separately indexed task, score, evaluation-window, or complexity-coordinate branch. An attained branch requires the missing same-state bridge together with a separately specified boundary anchor greater than $\alpha$ and propagation of that anchor through its response law; no such joint package is derived here.

2.  **Monotonicity with Complexity:** Performance increases with complexity investment above the baseline: $\partial PP / \partial C > 0$ for $C > C_{op}$.
3.  **Diminishing Returns:** The marginal gain in performance decreases as complexity increases: $\partial^2 PP / \partial C^2 < 0$ for $C > C_{op}$. Achieving further improvements becomes progressively harder.
4.  **Dependence on Relative Complexity:** Performance depends primarily on the ratio of invested complexity above baseline relative to the task difficulty, i.e., on a function of $x = (C-C_{op})/\hat{C}_{\mathrm{target}}$. Increasing the target difficulty $\hat{C}_{\mathrm{target}}$ for a fixed complexity $C$ decreases performance $PP$.

<a id="626-theorem-18-functional-form-under-exact-relative-complexity-scaling"></a>**6.2.6 Theorem 18 (Functional Form under Exact Relative-Complexity Scaling)**

Assume $\beta>\alpha$, $\hat C_{\mathrm{target}}>0$, and exact relative-complexity scaling: there is a continuous function $G:[0,\infty)\to[\alpha,\beta)$, twice differentiable on $(0,\infty)$, such that on the analytic extension
$$
\overline{PP}(C,\hat C_{\mathrm{target}})=G(x),
\qquad
x=\frac{C-C_{op}}{\hat C_{\mathrm{target}}},
$$
with $G(0)=\alpha$, $\lim_{x\to\infty}G(x)=\beta$, $G'(x)>0$, and $G''(x)<0$ for $x>0$. Then, for $C>C_{op}$,
$$
PP(C,\hat C_{\mathrm{target}})
=\alpha+(\beta-\alpha)F\left(\frac{C-C_{op}}{\hat C_{\mathrm{target}}}\right),
\quad \text{(21)}
$$
where $F:[0,\infty)\to[0,1)$ satisfies $F(0)=0$, $\lim_{x\to\infty}F(x)=1$, $F'(x)>0$, and $F''(x)<0$ for $x>0$.

*Proof.* Define
$$
F(x):=\frac{G(x)-\alpha}{\beta-\alpha}.
$$
Because $\beta-\alpha>0$ and $G(x)\in[\alpha,\beta)$, $F(x)\in[0,1)$. The boundary values give
$$
F(0)=0,
\qquad
\lim_{x\to\infty}F(x)=1.
$$
Differentiation yields
$$
F'(x)=\frac{G'(x)}{\beta-\alpha}>0,
\qquad
F''(x)=\frac{G''(x)}{\beta-\alpha}<0.
$$
Substitution of the definition of $F$ and restriction to $C>C_{op}$ give Equation (21). ∎

**6.3 Derivation of the Law of Prediction from POP / PCE**

The scaling principles of Definition 19 determine a class of saturation curves. The exponential member is selected by the following additional composition hypothesis: independent refinement stages act linearly on the unresolved performance fraction, and sequential stages with relative budgets $x_1,x_2$ have the same response as one stage with budget $x_1+x_2$.

<a id="631-theorem-19-law-of-prediction-exponential-saturation-under-multiplicative-composition"></a>**6.3.1 Theorem 19 (Law of Prediction — Exponential Saturation under Multiplicative Composition)**

Assume Theorem 18 and define, on its analytic extension,
$$
x:=\frac{C-C_{op}}{\hat C_{\mathrm{target}}}\ge0,
\qquad
g(x):=\frac{\beta-G(x)}{\beta-\alpha}.
$$
Assume additionally that
$$
g(x_1+x_2)=g(x_1)g(x_2)
\qquad\text{for all }x_1,x_2\ge0.
\tag{*}
$$
Then there is a dimensionless constant $\kappa_{\mathrm{eff}}>0$ such that, for every $C>C_{op}$,
$$
PP(C,\hat C_{\mathrm{target}})
=\beta-(\beta-\alpha)
\exp\!\Bigl[-\kappa_{\mathrm{eff}}\,
\tfrac{C-C_{op}}{\hat C_{\mathrm{target}}}\Bigr].
\quad \text{(22)}
$$
The continuous extension of (22), not a physical state on this branch, has value $\alpha$ at $C=C_{op}$. For $PP\in(\alpha,\beta)$, the inverse is
$$
C(PP,\hat C_{\mathrm{target}})
=C_{op}+\frac{\hat C_{\mathrm{target}}}{\kappa_{\mathrm{eff}}}
\ln\!\Bigl(\tfrac{\beta-\alpha}{\beta-PP}\Bigr).
\quad \text{(23)}
$$

*Proof.* Theorem 18 gives $g(0)=1$, $0<g(x)\le1$, strict decrease on $(0,\infty)$, and continuity. Positivity permits
$$
h(x):=\ln g(x).
$$
Taking logarithms in (*) gives
$$
h(x_1+x_2)=h(x_1)+h(x_2)
\qquad(x_1,x_2\ge0).
$$
For every nonnegative integer $n$, additivity gives $h(n)=nh(1)$. For positive integers $m,n$,
$$
nh(m/n)=h(m)=mh(1),
$$
so $h(q)=qh(1)$ for every nonnegative rational $q$. For any $x\ge0$, choose nonnegative rationals $q_n\to x$. Continuity yields
$$
h(x)=\lim_{n\to\infty}h(q_n)=xh(1).
$$
Because $g$ is strictly decreasing and $g(0)=1$, $g(1)<1$, hence $h(1)<0$. Set $\kappa_{\mathrm{eff}}:=-h(1)>0$. Then
$$
g(x)=e^{h(x)}=e^{-\kappa_{\mathrm{eff}}x}.
$$
Substitution of $G(x)=\overline{PP}(C,\hat C_{\mathrm{target}})$ and the definition of $x$, followed by restriction to $C>C_{op}$, gives Equation (22). Rearranging it on that domain gives
$$
e^{-\kappa_{\mathrm{eff}}(C-C_{op})/\hat C_{\mathrm{target}}}
=\frac{\beta-PP}{\beta-\alpha},
$$
and taking logarithms yields Equation (23). ∎

<a id="theorem-19b-continuity-redundancy-and-composition-ablation-counterfamily"></a>**Theorem 19b (Continuity Redundancy and Composition-Ablation Counterfamily).** In Theorem 19, continuity is redundant once $g:[0,\infty)\to(0,1]$ is strictly decreasing and satisfies
$$
g(x+y)=g(x)g(y),
\qquad
g(0)=1.
\tag{19b.1}
$$
Those hypotheses alone force $g(x)=e^{-\kappa x}$ for a unique $\kappa>0$. If multiplicative composition is removed while the boundary, monotonicity and concavity conditions of Definition 19 are retained, the response law is not unique: for every $q>0$,
$$
g_q(x)=(1+x)^{-q},
\qquad
G_q(x)=\beta-(\beta-\alpha)g_q(x)
\tag{19b.2}
$$
is a distinct admissible saturation curve.

*Proof.* Put $h=\ln g$. Equation (19b.1) makes $h$ additive. Strict decrease of $g$ makes $h$ monotone, and every monotone additive function on $\mathbb R_{\ge0}$ is linear: rational homogeneity follows from additivity, and rational sequences bounding $x$ squeeze $h(x)$ to $xh(1)$. Since $h(1)<0$, $h(x)=-\kappa x$ with $\kappa=-h(1)>0$. Conversely, (19b.2) has $g_q(0)=1$, tends to zero, and gives
$$
G_q'(x)=(\beta-\alpha)q(1+x)^{-q-1}>0,
$$
$$
G_q''(x)=-(\beta-\alpha)q(q+1)(1+x)^{-q-2}<0.
$$
For $x,y>0$, $(1+x+y)^{-q}\ne[(1+x)(1+y)]^{-q}$, so these curves do not satisfy multiplicative composition. ∎

This establishes multiplicative exponential rigidity together with a checked nonmultiplicative counterfamily. Theorem 19c gives the complete axiom-ablation catalogue; Theorem 19d realizes the response-faithful complexity-resource coordinate and semigroup.

<a id="theorem-19c-complete-normalized-residual-law-axiom-ablation-classification"></a>**Theorem 19c (Complete Normalized Residual-Law Axiom-Ablation Classification).** Let the base class consist of functions
$$
g:[0,\infty)\longrightarrow(0,1],
\qquad
g(0)=1.
$$
Consider the four additional properties
$$
\begin{array}{ll}
(\mathrm C)&g(x+y)=g(x)g(y),\\
(\mathrm D)&g\text{ is strictly decreasing},\\
(\mathrm A)&\displaystyle\lim_{x\to\infty}g(x)=0,\\
(\mathrm K)&g\text{ is twice differentiable and }g''(x)>0\text{ for }x>0.
\end{array}
\tag{19c.1}
$$
For every one of the sixteen subsets of $(\mathrm C)$--$(\mathrm K)$:

1. a subset containing $(\mathrm C)$ forces
   $$
   g(x)=e^{-\kappa x}
   \tag{19c.2}
   $$
   for a unique $\kappa\ge0$;
2. within that composition class, any one of $(\mathrm D)$, $(\mathrm A)$ or $(\mathrm K)$ is equivalent to $\kappa>0$, while omitting all three admits exactly the additional constant member $\kappa=0$;
3. a subset omitting $(\mathrm C)$ does not force an exponential law, because every $q>0$ gives the nonexponential witness
   $$
   g_q(x)=(1+x)^{-q},
   \tag{19c.3}
   $$
   which satisfies $(\mathrm D)$, $(\mathrm A)$ and $(\mathrm K)$ simultaneously.

Hence multiplicative composition is necessary and sufficient, within this normalized positive base class, for exponential functional-form rigidity; strict decrease, vanishing asymptote and strict residual convexity independently remove the constant endpoint but add no further exponential modulus.

*Proof.* Under $(\mathrm C)$ define $h=-\log g\ge0$. Then $h(x+y)=h(x)+h(y)$. If $0\le x\le y$, additivity and nonnegativity give $h(y)=h(x)+h(y-x)\ge h(x)$, so $h$ is monotone. The standard rational squeeze for a monotone additive function on $\mathbb R_{\ge0}$ gives $h(x)=\kappa x$ with the unique $\kappa=h(1)\ge0$, proving (19c.2). For this family, strict decrease, limit zero and $g''(x)=\kappa^2e^{-\kappa x}>0$ are each equivalent to $\kappa>0$. If none is imposed, $\kappa=0$ gives $g\equiv1$. When $(\mathrm C)$ is absent, direct differentiation gives
$$
g_q'(x)=-q(1+x)^{-q-1}<0,
\qquad
g_q''(x)=q(q+1)(1+x)^{-q-2}>0,
$$
and $g_q(x)\to0$, while $g_q(x+y)\ne g_q(x)g_q(y)$ for $x,y>0$. The same witness satisfies every weaker subset omitting $(\mathrm C)$, exhausting all sixteen cases. ∎

<a id="theorem-19d-two-state-semigroup-realization-of-the-exponential-response-law"></a>**Theorem 19d (Two-State Semigroup Realization of the Exponential Response Law).** Fix $C_{op}$, a complexity scale $T>0$, $\kappa>0$ and $0<\alpha<\beta<1$. Calibrate the dimensionless carrier parameter by
$$
x=\frac{C-C_{op}}{T}\ge0.
\tag{19d.1}
$$
On the two-state carrier $\{s,d\}$, let $s$ decay to the absorbing state $d$ at rate $\kappa$ per unit $x$. Its transition semigroup satisfies
$$
K_x(s,s)=e^{-\kappa x},
\qquad
K_x(s,d)=1-e^{-\kappa x},
\qquad
K_{x+y}=K_xK_y.
\tag{19d.2}
$$
Pair this carrier with the formal resource counter $B=[0,\infty)$ and translation
$$
Z_x(b)=b+Tx.
\tag{19d.3}
$$
The registered incremental complexity is $\Delta C:=Z_x(b)-b=Tx$, so sequential increments satisfy $\Delta C(x+y)=\Delta C(x)+\Delta C(y)$ and the calibration inverse is $x=\Delta C/T$. Prepare $s$ and assign the retained score $\alpha$ to readout $s$ and $\beta$ to readout $d$. For every realized increment $x>0$, the expected response is exactly
$$
\mathbb E_x[PP]
=
\alpha e^{-\kappa x}+\beta(1-e^{-\kappa x})
=
\beta-(\beta-\alpha)e^{-\kappa(C-C_{op})/T}.
\tag{19d.4}
$$
The identity value $x=0$ is the analytic calibration boundary of Theorem 19 and is not included among the realized $C>C_{op}$ responses. Thus addition of calibrated complexity increments intertwines simultaneously with the counter translations and carrier evolution and realizes Equation (22) response-faithfully on its stated domain.

*Proof.* The waiting time in $s$ is exponential with rate $\kappa$, which gives (19d.2); the memoryless property gives the semigroup identity. Equation (19d.3) is an additive faithful translation action and gives the displayed complexity calibration. Taking the expectation of the two registered scores gives (19d.4). Restricting to $x>0$ is exactly $C>C_{op}$, the domain of Equation (22). ∎

<a id="corollary-19b1-endpoint-moduli-under-an-uncalibrated-pce-objective"></a>**Corollary 19b.1 (Endpoint Moduli under an Uncalibrated PCE Objective).** Fix $\alpha\in(0,1)$, $C_{op}$, a target scale $T>0$, $\kappa>0$, $\Gamma_0>0$, and an interior point $C_*>C_{op}$. For every $\beta\in(\alpha,1)$ define
$$
P_\beta(C)
=
\beta-(\beta-\alpha)e^{-\kappa(C-C_{op})/T}
\tag{19b.3}
$$
and the commensurate cost
$$
K_\beta(C)
=
\Gamma_0P_\beta(C)+(C-C_*)^2+K_*,
\tag{19b.4}
$$
where $K_*$ is any constant making the cost nonnegative on the registered domain. Then
$$
J_\beta(C):=\Gamma_0P_\beta(C)-K_\beta(C)
=-(C-C_*)^2-K_*
$$
has the same unique attained maximizer $C_*$ for every $\beta\in(\alpha,1)$. Thus, when the commensurate cost is not independently frozen across response branches, PCE attainment and strictness alone leave the full open endpoint interval as a modulus.

*Proof.* Direct cancellation gives the displayed quadratic objective, whose unique maximizer is $C_*$. Every $P_\beta$ satisfies Theorem 19's analytic form and has asymptote $\beta$. Distinct endpoint values are not identified by the fixed complexity coordinate or objective maximizer. ∎

<a id="corollary-19b2-one-point-same-task-endpoint-identification-and-excitation-floor"></a>**Corollary 19b.2 (One-Point Same-Task Endpoint Identification and Excitation Floor).** Fix the exponential branch parameters $\alpha$, $C_{op}$, $T>0$ and $\kappa>0$. Let a response-faithful same-task bridge supply one independently calibrated point $(C_1,p_1)$ with $C_1>C_{op}$, and set
$$
q_1:=e^{-\kappa(C_1-C_{op})/T}\in(0,1).
$$
There is a unique endpoint $\beta\in(\alpha,1)$ whose response curve passes through that point exactly when
$$
\alpha<p_1<1-(1-\alpha)q_1.
\tag{19b.5}
$$
It is
$$
\boxed{
\beta=\frac{p_1-\alpha q_1}{1-q_1}
},
\qquad
\beta-\alpha=\frac{p_1-\alpha}{1-q_1}.
\tag{19b.6}
$$
In particular, a registered same-task margin $p_1-\alpha\ge\delta>0$ supplies the exact excitation floor
$$
\beta-\alpha\ge\frac{\delta}{1-q_1}>0.
\tag{19b.7}
$$

*Proof.* Substituting $(C_1,p_1)$ into (19b.3) gives $p_1=\beta-(\beta-\alpha)q_1$. Since $1-q_1>0$, solving yields the unique value (19b.6). The lower inequality in (19b.5) is equivalent to $\beta>\alpha$ and also gives $\beta>p_1$. The upper inequality is equivalent to $\beta<1$. Equation (19b.7) follows from the second identity in (19b.6). ∎

<a id="theorem-19e-bayes-endpoint-task-realization-and-frozen-cost-optimizer-to-score-bridge"></a>**Theorem 19e (Bayes-Endpoint Task Realization and Frozen-Cost Optimizer-to-Score Bridge).** Fix $\eta\in(0,\frac12)$ and register the binary prediction task in which the target $Y$ is uniform on $\{0,1\}$, the retained context is $X=Y\oplus\xi$ with $\xi$ a Bernoulli($\eta$) bit independent of $Y$, a predictor is a Markov kernel from $X$ to a guess $\hat Y\in\{0,1\}$, and its score is $PP=\Pr(\hat Y=Y)$.

1. Every predictor whose kernel does not depend on $X$ has $PP=\frac12$.
2. Every predictor has $PP\le1-\eta$, with equality exactly for the copy predictor $\hat Y=X$.
3. On the two-state carrier of Theorem 19d, evolving independently of the task draw, let state $s$ use the constant predictor $\hat Y=0$ and state $d$ the copy predictor. For every realized increment $x>0$ the expected score is exactly (19d.4) with
   $$
   \alpha=\tfrac12,
   \qquad
   \beta=1-\eta=\max_{\text{predictors}}PP.
   \tag{19e.1}
   $$
   The response-law endpoint of this realization is therefore the task's Bayes accuracy. It is fixed by the task law alone, lies in $(\alpha,1)$, and exceeds every realized score at finite $x$. Every realization of Definition 19 on this task whose realized scores are accuracies of predictors has $\beta\le1-\eta$, with equality exactly when those accuracies converge to $1-\eta$.

Now fix the exponential branch (19b.3) with $\alpha$, $C_{op}$, $T>0$, $\kappa>0$ and $\Gamma_0>0$. Let $K$ be a commensurate cost that is twice differentiable on $(C_{op},\infty)$, convex, nondecreasing and the same function for every $\beta\in(\alpha,1)$, and put $J_\beta=\Gamma_0P_\beta-K$.

4. $J_\beta$ has at most one interior maximizer. On the interior branch, where a maximizer $C^*_\beta>C_{op}$ exists, $\beta\mapsto C^*_\beta$ is strictly increasing, and
   $$
   \beta=\alpha+\frac{T\,K'(C^*_\beta)}{\kappa\Gamma_0}\,e^{\kappa(C^*_\beta-C_{op})/T},
   \qquad
   P_\beta(C^*_\beta)=\beta-\frac{T\,K'(C^*_\beta)}{\kappa\Gamma_0}.
   \tag{19e.2}
   $$
5. For the linear cost $K(C)=K_0+m(C-C_{op})$ with $m>0$, the interior branch is $\beta>\alpha+mT/(\kappa\Gamma_0)$, on which
   $$
   C^*_\beta=C_{op}+\frac T\kappa\ln\frac{\kappa\Gamma_0(\beta-\alpha)}{mT},
   \qquad
   P_\beta(C^*_\beta)=\beta-\frac{mT}{\kappa\Gamma_0}.
   \tag{19e.3}
   $$
6. On the realization of items 1--3, the task-noise record $\eta$, specified independently of the optimizer and the cost, fixes $\beta=1-\eta$. Equations (19e.2)--(19e.3) then give the optimizer and its score from $\eta$, and conversely the optimizer location and the frozen marginal cost return $\eta=1-\beta$.

Thus a $\beta$-independent commensurate cost makes the PCE optimizer an injective optimizer-to-score bridge for the endpoint, in contrast with the branch-dependent costs of Corollary 19b.1, and the task law supplies an endpoint calibration record independent of that optimizer.

*Proof.* If the kernel ignores $X$, then $\hat Y$ is independent of $Y$ and $\Pr(\hat Y=Y)=\sum_y\Pr(\hat Y=y)\cdot\frac12=\frac12$. For item 2, $\Pr(Y=x\mid X=x)=1-\eta>\eta=\Pr(Y\ne x\mid X=x)$, so for a kernel $k$,
$$
PP=\sum_x\Pr(X=x)\sum_{\hat y}k(\hat y\mid x)\Pr(Y=\hat y\mid X=x)\le\sum_x\Pr(X=x)(1-\eta)=1-\eta,
$$
with equality exactly when $k(\cdot\mid x)$ is concentrated on $\hat y=x$ for both values of $x$; the copy predictor attains $\Pr(\xi=0)=1-\eta$. For item 3, conditioning on the carrier state gives the score $\frac12e^{-\kappa x}+(1-\eta)(1-e^{-\kappa x})$, which is (19d.4) with (19e.1), and $e^{-\kappa x}>0$ gives $PP<\beta$. A limit of accuracies bounded by $1-\eta$ is at most $1-\eta$, with equality exactly under the stated convergence. For item 4, $P_\beta'(C)=\frac\kappa T(\beta-\alpha)e^{-\kappa(C-C_{op})/T}$ is positive and strictly decreasing, while $K'$ is nondecreasing, so $J_\beta'$ is strictly decreasing. An interior maximizer is a zero of $J_\beta'$ and is therefore unique. If $\beta_1<\beta_2$ both lie on the interior branch, the frozen cost cancels in
$$
J_{\beta_2}'(C^*_{\beta_1})=J_{\beta_2}'(C^*_{\beta_1})-J_{\beta_1}'(C^*_{\beta_1})=\frac{\kappa\Gamma_0}T(\beta_2-\beta_1)e^{-\kappa(C^*_{\beta_1}-C_{op})/T}>0,
$$
so $C^*_{\beta_2}>C^*_{\beta_1}$. Solving $J_\beta'(C^*_\beta)=0$ for $\beta$ gives the first identity in (19e.2), and substitution into (19b.3) gives the second, which is Equation (22d) with $C_s=T/\kappa$. For item 5, $K'=m$, and $J_\beta'(C)=0$ has a solution $C>C_{op}$ exactly when $mT<\kappa\Gamma_0(\beta-\alpha)$; otherwise $J_\beta'<0$ on $(C_{op},\infty)$. Solving gives (19e.3). Item 6 is substitution of $\beta=1-\eta$. ∎

*Remark:* Equation (23) implies $(C-C_{op})\propto -\ln(\beta-PP)$ as $PP\to\beta$, consistent with logarithmic rate–distortion scaling when the operational prediction error is proportional to the performance gap.

<a id="definition-19a-effective-complexity-scale-c_s"></a>**Definition 19a (Effective Complexity Scale $C_s$).** For a given target complexity $\hat{C}_{\mathrm{target}}$, define the e-fold complexity scale of the Law of Prediction by
$$
C_s := \frac{\hat{C}_{\mathrm{target}}}{\kappa_{\mathrm{eff}}}.
\tag{22a}
$$
Then, on the physical domain $C>C_{op}$, Equation (22) becomes
$$
PP(C)=\beta-(\beta-\alpha)e^{-(C-C_{op})/C_s},
\tag{22b}
$$
and for $PP\in(\alpha,\beta)$ the inverse relation is
$$
C(PP)=C_{op}+C_s\ln\!\frac{\beta-\alpha}{\beta-PP}.
\tag{22c}
$$

<a id="proposition-19a-interior-equilibrium-form-of-c_s"></a>**Proposition 19a (Interior Equilibrium Form of $C_s$).** Assume the exponential branch of Theorem 19, assume $\Gamma_0>0$, and let $C^*>C_{op}$ be an interior stationary PCE point with $PP^*\in(\alpha,\beta)$. Then
$$
C_s=\frac{\Gamma_0(\beta-PP^*)}{\lambda R'(C^*)+R_I'(C^*)}.
\tag{22d}
$$

*Proof.* Interior stationarity gives
$$
\Gamma_0\left.\frac{\partial PP}{\partial C}\right|_{C^*}
=\lambda R'(C^*)+R_I'(C^*).
$$
Equation (22b) gives
$$
\left.\frac{\partial PP}{\partial C}\right|_{C^*}
=\frac{\beta-PP^*}{C_s}>0.
$$
Since $\Gamma_0>0$, the equilibrium equation makes the marginal-cost sum positive. Substitution followed by division by that positive sum gives Equation (22d). ∎

<a id="corollary-191-conditional-power-law-learning-curves-on-logarithmic-complexity-budgets"></a>**Corollary 19.1 (Conditional Power-Law Learning Curves on Logarithmic Complexity Budgets).** Fix a registered predictive-system branch satisfying every hypothesis of Theorem 19, with branch-fixed parameters $\alpha,\beta,C_{op},\hat C_{\mathrm{target}}$, and $\kappa_{\mathrm{eff}}$. Define the analytic composite $\overline{PP}(N):=\overline{PP}(C(N),\hat C_{\mathrm{target}})$ for $N\ge N_0$ and its physical restriction $PP(N):=\overline{PP}(N)$ for $N>N_0$. Assume independently that the registered positive experience coordinate $N$ and effective predictive complexity obey the exact logarithmic budget
$$
C(N)-C_{op}=\eta_{\ell}\ln\!\bigl(N/N_0\bigr),
\qquad N\ge N_0>0,
\qquad \eta_{\ell}>0.
\tag{22e}
$$
Under these joint branch hypotheses, the analytic performance gap obeys the exact power law
$$
\beta-\overline{PP}(N)=(\beta-\alpha)\bigl(N/N_0\bigr)^{-s},
\qquad
s=\frac{\kappa_{\mathrm{eff}}\eta_{\ell}}{\hat C_{\mathrm{target}}}>0.
\tag{22f}
$$
At $N=N_0$ this is the formal boundary normalization $\overline{PP}(N_0)=\alpha$; for $N>N_0$ it is the physical $PP$ law.

*Proof.* Substitute (22e) into the analytic extension of Equation (22b), using $C_s=\hat C_{\mathrm{target}}/\kappa_{\mathrm{eff}}$ from Definition 19a:
$$
\beta-\overline{PP}(N)
=(\beta-\alpha)\exp\!\left[-\frac{C(N)-C_{op}}{C_s}\right]
=(\beta-\alpha)\exp\!\left[-\frac{\kappa_{\mathrm{eff}}\eta_{\ell}}{\hat C_{\mathrm{target}}}\ln(N/N_0)\right].
$$
Using $\exp[-s\ln(N/N_0)]=(N/N_0)^{-s}$ gives (22f). Positivity of $s$ follows from $\kappa_{\mathrm{eff}},\eta_{\ell},\hat C_{\mathrm{target}}>0$. Restriction to $N>N_0$ gives the physical statement. ∎

<a id="remark-191a-interpretation-of-22e"></a>**Remark 19.1a (Interpretation of (22e)).** Equation (22e) is branch data additional to POP, PCE, Definition 19, and Theorem 19. On a connected differentiable range $N\ge N_0$, Equation (22e) is equivalent to the boundary condition $C(N_0)=C_{op}$ together with
$$
N\frac{dC}{dN}=\eta_{\ell}
$$
throughout that range. Differentiating (22e) proves necessity, while integrating $dC/dN=\eta_{\ell}/N$ from $N_0$ to $N$ proves sufficiency. Consequently, a qualitative observation of diminishing returns does not establish the exact logarithmic budget. The constant $\eta_{\ell}$ has dimensions of complexity and must be fixed by the registered complexity-accumulation map; $\hat C_{\mathrm{target}}$ enters the resulting exponent only through $C_s=\hat C_{\mathrm{target}}/\kappa_{\mathrm{eff}}$.

<a id="corollary-192-conditional-size-and-data-coordinate-power-laws"></a>**Corollary 19.2 (Conditional Size- and Data-Coordinate Power Laws).** Fix a registered aggregate predictive-system branch (Definition 29) satisfying every hypothesis of Theorem 19, with branch-fixed parameters $\alpha,\beta,C_{op},\hat C_{\mathrm{target}}$, and $\kappa_{\mathrm{eff}}$. Suppose its registered size coordinate $N_p$ and effective predictive complexity obey the exact relation
$$
C(N_p)-C_{op}=\eta_p\ln\!\bigl(N_p/N_{p,0}\bigr),
\qquad N_p\ge N_{p,0}>0,
\qquad \eta_p>0.
\tag{22g}
$$
Define $\overline{PP}(N_p):=\overline{PP}(C(N_p),\hat C_{\mathrm{target}})$ for $N_p\ge N_{p,0}$ and physical $PP(N_p):=\overline{PP}(N_p)$ for $N_p>N_{p,0}$. Then
$$
\beta-\overline{PP}(N_p)=(\beta-\alpha)\bigl(N_p/N_{p,0}\bigr)^{-s_p},
\qquad
s_p=\frac{\kappa_{\mathrm{eff}}\eta_p}{\hat C_{\mathrm{target}}}.
\tag{22h}
$$
On a separately registered data-size branch satisfying
$$
C(N_d)-C_{op}=\eta_d\ln(N_d/N_{d,0}),
\qquad N_d\ge N_{d,0}>0,
\qquad \eta_d>0,
$$
define the analogous analytic composite for $N_d\ge N_{d,0}$ and its physical restriction for $N_d>N_{d,0}$; the identity then holds with exponent $s_d=\kappa_{\mathrm{eff}}\eta_d/\hat C_{\mathrm{target}}$. If a registered branch instead has a nonempty finite coordinate set $\mathcal I$ whose positive-coordinate complexity contributions add exactly,
$$
C-C_{op}=\sum_{i\in\mathcal I}\eta_i\ln(N_i/N_{i,0}),
\qquad
N_i\ge N_{i,0}>0,
\qquad
\eta_i>0,
$$
then the analytic performance gap factorizes into
$$
\beta-\overline{PP}
=
(\beta-\alpha)
\prod_{i\in\mathcal I}
(N_i/N_{i,0})^{-\kappa_{\mathrm{eff}}\eta_i/\hat C_{\mathrm{target}}}.
$$
It is a physical $PP$ statement only where $C>C_{op}$, equivalently where at least one coordinate is strictly above its anchor.

*Proof.* Direct substitution of (22g) into the analytic extension of (22b) via Definition 19a gives (22h). The data-size and compositional statements follow from the same substitution in the additive logarithmic regime; restricting away from the joint anchor gives the physical statements. ∎

<a id="proposition-192a-exact-finite-record-compatibility-criterion-for-the-registered-power-law-formula"></a>**Proposition 19.2a (Exact Finite-Record Compatibility Criterion for the Registered Power-Law Formula).** Fix $\alpha<\beta$ and $N_0>0$. Take the formal analytic-boundary datum
$$
(N_0,P_0):=(N_0,\alpha)
$$
together with exact registered off-boundary observations
$$
(N_k,P_k),
\qquad
k=1,\ldots,m,
\qquad
m\ge2,
$$
where
$$
N_0<N_1<\cdots<N_m,
\qquad
P_k<\beta.
$$
Index the combined formal-and-observational record by $k=0,1,\ldots,m$ and define
$$
G_k:=\frac{\beta-P_k}{\beta-\alpha}>0.
$$
There exists $s>0$ such that
$$
G_k=\left(\frac{N_k}{N_0}\right)^{-s}
\quad
\text{for every }k=0,1,\ldots,m
\tag{22i}
$$
if and only if
$$
G_0=1
$$
and the numbers
$$
s_k:=-\frac{\ln G_k}{\ln(N_k/N_0)},
\qquad
k=1,\ldots,m,
\tag{22j}
$$
are all defined, positive, and equal. Here $G_0=1$, equivalently $P_0=\alpha$, checks the formal boundary normalization rather than validation data. When these conditions hold, the common value is the unique exponent $s$.

*Proof.* If (22i) holds, then $G_0=1^{-s}=1$. For $k\ge1$, $N_k/N_0>1$, so taking logarithms in (22i) gives
$$
\ln G_k=-s\ln(N_k/N_0),
$$
and hence $s_k=s>0$. Conversely, suppose $G_0=1$ and every $s_k$ equals one common $s>0$. Rearranging (22j) gives
$$
\ln G_k=-s\ln(N_k/N_0)
$$
for each $k\ge1$. Exponentiation yields (22i) for $k\ge1$, while the $k=0$ case follows from $G_0=1$. If both $s$ and $s'$ satisfy (22i), then for $k=1$,
$$
(N_1/N_0)^{-s}=(N_1/N_0)^{-s'}.
$$
Taking logarithms and using $\ln(N_1/N_0)>0$ gives $s=s'$. ∎

Compatibility on finitely many off-boundary observations neither proves the formula between them nor verifies either antecedent from which Corollary 19.1 derives it.

<a id="remark-192-scope-and-registered-falsifier"></a>**Remark 19.2 (Scope and Registered Falsifier).** Corollaries 19.1-19.2 are conditional images of two independent antecedents: Theorem 19's exact multiplicative residual-composition hypothesis and an exact logarithmic map from the registered resource coordinate to effective predictive complexity. Proposition 19.2a gives the exact-record compatibility test after $\alpha$, $\beta$, $N_0$, the score, task, system or population, measurement protocol, and coordinate range have been fixed. Failure of $G_0=1$ is a formal boundary-normalization failure, not empirical evidence. Failure of the off-boundary $s_k$ to be defined, positive, and equal rejects the formula on that exact observational record; it does not identify which antecedent failed and does not refute a whole empirical domain. For a noisy comparison, specify a joint uncertainty construction and an acceptance rule that account for calibration, selection, and covariance as applicable. The branch is rejected under that rule when no common $s>0$ is compatible with the resulting joint region. A prospective protocol applies its preregistered rule. Agreement with one power-law form does not establish equality of mechanism across carriers. Once $\alpha$, $\beta$, and $N_0$ are fixed, the curve identifies only the combination $\kappa_{\mathrm{eff}}\eta_\bullet/\hat C_{\mathrm{target}}$, not its three factors separately; all remain branch-specific unless a separate transport theorem identifies them.

On an explicitly registered mixture evaluation, let a resource-independent fraction $f\in[0,1]$ of scored examples be diagonal cycles satisfying Theorem 11a, let $L_{\mathrm{data}}(N)$ be the conditional mean logarithmic loss on the remaining examples, and measure logarithmic score in nats. Then
$$
L(N)\ge f\ln2+(1-f)L_{\mathrm{data}}(N).
$$
Equality in the diagonal contribution holds exactly when the predictor reports $p=1/2$ on every diagonal cycle. Under the lower bound alone, no mixture exponent follows. If instead $0\le f<1$ is fixed, $c\ne0$, every diagonal cycle reports $p=1/2$, and the complete registered loss contains no additional $N$-dependent mixture term, so that
$$
L(N)=f\ln2+(1-f)L_{\mathrm{data}}(N),
$$
then
$$
L_{\mathrm{data}}(N)
=L_{\mathrm{data},\infty}+cN^{-s_p}+o(N^{-s_p}),
\qquad s_p>0,
$$
implies
$$
L(N)
=f\ln2+(1-f)L_{\mathrm{data},\infty}
+(1-f)cN^{-s_p}+o(N^{-s_p}).
$$
Only under these equality and nondegeneracy hypotheses does the mixture inherit the exponent $s_p$. No architecture-, scale-, or tokenizer-independent transport conclusion follows without a separate theorem identifying the score and registered mixture across those representations.

<a id="proposition-192b-tagged-predictive-tasks-additive-loss-and-exact-allocation"></a>**Proposition 19.2b (Tagged Predictive Tasks, Additive Loss, and Exact Allocation).** Fix a retained task tag $T\in\{0,N,D\}$ with resource-independent probabilities $f,w_N,w_D\ge0$, summing to one, and $w_N,w_D>0$. Let the conditional mean logarithmic losses in nats be $\ell_0$, $\ell_{N,\infty}+a_NN^{-u}$ and $\ell_{D,\infty}+a_DD^{-v}$, with $a_N,a_D,u,v>0$. The complete tagged task has the exact loss
$$
L(N,D)=L_\infty+AN^{-u}+BD^{-v},
\quad
L_\infty=f\ell_0+w_N\ell_{N,\infty}+w_D\ell_{D,\infty},
\quad A=w_Na_N,\quad B=w_Da_D.
\tag{19.2b.1}
$$
Thus separate task branches with the power-law gaps of Corollary 19.2 produce an additive law under a fixed retained task mixture. Independent stages reducing one and the same unresolved fraction still obey that corollary's multiplicative law.

There is an exact finite predictive realization of (19.2b.1) with $u=v=1$, $L_\infty=f\ln2$, $A=w_N\ln2$ and $B=w_D\ln2$ for every pair of positive integers $N,D$. On tag $N$, draw an owned uniform register $U\in\{1,\ldots,N\}$ and a fair target bit $Y$. Before the prediction deadline provide cue $X=Y$ when $U\ne1$, and $X=\bot$ when $U=1$; present the target bit only after the prediction. Report probability one at the revealed bit and probability $1/2$ when $X=\bot$. Use the analogous $D$-valued register on tag $D$. On tag zero supply an independent fair target without a cue and report $1/2$. Retain the tag, sampler, cue, reported distribution and later verification record. For dyadic tag weights and $N,D$ powers of two, all random inputs are a finite fair-bit stock and all cue/verification computations are finite reversible gates with their outputs retained. For arbitrary finite $N,D$, replace the corresponding fair-bit stock by an explicitly owned uniform $N$- or $D$-symbol source. No sampling-time or memory cost is identified with $ND$ by this response calculation.

On a separately calibrated work ledger $K_{\mathrm{used}}=\kappa ND$, with $\kappa>0$ and available budget $K>0$, write $Q=K/\kappa$. For positive real coordinates, the unique optimum of (19.2b.1) on $ND\le Q$ is
$$
N_* = \left(\frac{uA}{vB}\right)^{1/(u+v)}Q^{v/(u+v)},
\qquad
D_* = \left(\frac{vB}{uA}\right)^{1/(u+v)}Q^{u/(u+v)},
\tag{19.2b.2}
$$
and
$$
L_*(K)-L_\infty
=\left[A\left(\frac{uA}{vB}\right)^{-u/(u+v)}
 +B\left(\frac{uA}{vB}\right)^{v/(u+v)}\right]
(K/\kappa)^{-uv/(u+v)}.
\tag{19.2b.3}
$$
If the coordinates must satisfy $N,D\ge1$, the feasible set is empty for $Q<1$. For $Q\ge1$ these formulas hold exactly when both displayed optima satisfy those bounds; otherwise the unique constrained minimum is the applicable boundary point. For integer coordinates and $Q\ge1$, the exact finite optimum is obtained by evaluating
$$
AN^{-u}+B\lfloor Q/N\rfloor^{-v},
\qquad N=1,\ldots,\lfloor Q\rfloor,
\tag{19.2b.4}
$$
and retaining every minimizing pair $(N,\lfloor Q/N\rfloor)$. This is an exhaustive allocation certificate and admits ties.

*Proof.* Conditional expectation of the logarithmic score gives (19.2b.1). In the finite source, a revealed target has loss zero and an erased target has loss $\ln2$. The erasure probabilities are exactly $1/N$ and $1/D$, while tag zero contributes $\ln2$ on every trial. The full tag average is therefore exactly the asserted law. These reports minimize expected logarithmic loss separately on every available cue: the revealed conditional law is a point mass and the erased conditional law is fair. For a conditional Bernoulli parameter $p$, minimizing $-p\ln q-(1-p)\ln(1-q)$ gives $q=p$ by differentiation for $0<p<1$, and the endpoint cases give the same assertion directly. Thus the loss is the source's optimal predictive score, not an assigned penalty. Initially owned source registers may contain the later target label; the predictor receives only the specified cue before commitment. Reversible copying and verification preserve all underlying labels and give the stated finite realization.

For positive real $N,D$, the loss decreases strictly in each coordinate, so an optimum exhausts $ND=Q$. Set $x=\ln N$, giving the excess loss
$$
F_Q(x)=Ae^{-ux}+BQ^{-v}e^{vx}.
$$
Its second derivative is strictly positive, and it diverges at both ends of the real line. Its unique stationary point is characterized by $uAe^{-ux}=vBQ^{-v}e^{vx}$. Solving yields (19.2b.2), and substitution yields (19.2b.3). The restrictions $N,D\ge1$ give the interval $0\le x\le\ln Q$ when $Q\ge1$; strict convexity selects the interior stationary point if feasible and otherwise the nearer endpoint in the order of $x$. For integer $N$, strict decrease in $D$ selects the largest allowed integer, $D=\lfloor Q/N\rfloor$. The remaining finite list is exhaustive and proves (19.2b.4). ∎

<a id="corollary-192b1-one-source-predictive-viability-and-finite-update"></a>**Corollary 19.2b.1 (One-Source Predictive Viability and Finite Update).** Use the finite erasure source in Proposition 19.2b with fresh independent tags, samplers and fair target bits on every cycle. Add a state $v$ inside the viable band and an absorbing state $o$ outside it. At $v$, the controller reports a predictive distribution and commits to a binary route before the later target arrives. A correct route returns $v$ and an incorrect route enters $o$; retain the route, target, verification and state transition. With the Bayes-optimal report and route, the exact maximal survival probability through $n$ cycles is
$$
v_n(v)=\left[1-\frac{L(N,D)}{2\ln2}\right]^n.
\tag{19.2b.5}
$$
Every finite $N,D$ has an empty infinite-horizon safety kernel. Nevertheless, for every $n\ge1$, minimizing the exact additive loss over any common resource-admissible set maximizes finite-horizon viability on this same source. On the dyadic branch $N=2^m$, a nested cue construction and one additional fair revelation bit implement an update whose tag-$N$ mean logarithmic loss decreases by exactly $(\ln2)/(2N)$.

*Proof.* At a revealed cue the route can be correct with probability one; at an erased cue or on tag zero, the target remains fair independently of every available history, so no route has success probability above $1/2$. A fixed route, or a fresh fair route, attains $1/2$. The total erasure/no-cue probability is
$$
e=f+w_N/N+w_D/D=L(N,D)/\ln2.
$$
The optimal one-cycle survival probability is therefore $1-e/2$. Fresh independent inputs give the same upper bound conditional on every surviving history, and the stated policy attains it at every step. Multiplication proves (19.2b.5), including optimality among history-dependent randomized policies. Since $w_N,w_D>0$ and $N,D$ are finite, $e>0$; every action has positive probability of reaching $o$, so Theorem 1a gives an empty safety kernel. The function $(1-L/(2\ln2))^n$ is strictly decreasing for the realized losses and every $n\ge1$, proving the resource-ordering identity.

For the update, provide independent fair bits $U_1,\ldots,U_m$ and reveal $Y$ when at least one is one. The all-zero event has probability $2^{-m}=1/N$. Adding the fresh bit $U_{m+1}$ refines the same cue experiment and halves its erasure probability. The updated predictor retains its old report when still erased and changes to the revealed point mass otherwise. Its mean logarithmic loss changes from $(\ln2)/N$ to $(\ln2)/(2N)$ on tag $N$. The old bits, new bit, cue and report history are retained; the finite resource increment is one fair revelation bit and its controlled-copy/verification circuitry. ∎

The tags, target law, erasure resources, score and compute calibration are separately retained data. The finite erasure source closes the existence and optimal-score calculation of an additive predictive scaling law. Corollary 19.2b.1 identifies that loss with finite viability on the same controlled source and supplies a scored adaptive update. Equation (19.2b.2) closes its allocation problem under the stated compute ledger. To apply the formula to a neural architecture, the same task mixture and resource-to-instrument and resource-to-work maps identify $N,D,K$ with that architecture's measured quantities. The biological allometry in Theorem P.8.9a.12.7b instead uses its transport and component-mass extractors; equal variational form does not replace either extractor.

<a id="remark-193-weber-fechner-relation-from-equation-5"></a>**Remark 19.3 (Weber-Fechner Relation from Equation (5)).** Let a predictive system represent an external stimulus by allocating reflexive-information complexity $C$ above the Horizon Constant $K_0$ (Theorem 15). By Definition 3b and Equation (5), the representative reflexive-information cost rate is
$$
R_I(C;T_{\mathrm{eff}})=\frac{r_I(T_{\mathrm{eff}})}{\ln 2}\ln\!\bigl(C/K_0\bigr),
\qquad C\ge K_0.
$$
If the operational internal signal representing the stimulus is identified with the expended reflexive-information rate $R_I$, then for any two stimulus levels $C_1,C_2>K_0$ the internal difference is
$$
\Delta R_I=\frac{r_I}{\ln 2}\ln\!\bigl(C_2/C_1\bigr).
\tag{5a}
$$
Assume $r_I(T_{\mathrm{eff}})>0$ and compare both stimulus levels at this same effective temperature. A prescribed just-noticeable internal increment $\Delta R_I=\delta_R$ is then equivalent to
$$
\frac{C_2}{C_1}=e^a,
\qquad
a:=\frac{\delta_R\ln2}{r_I}.
$$
Hence the exact fractional increment is
$$
\frac{C_2-C_1}{C_1}=e^a-1.
$$
Taylor's theorem gives
$$
e^a-1=a+\mathcal R_2(a),
\qquad
|\mathcal R_2(a)|\le\frac12e^{|a|}a^2.
$$
Thus $\Delta C/C=a+O(a^2)$ in the regime $|a|\ll1$.

*Proof.* Subtract Equation (5) at $C_1$ and $C_2$:
$$
R_I(C_2)-R_I(C_1)=\frac{r_I}{\ln 2}\left[\ln(C_2/K_0)-\ln(C_1/K_0)\right]
=\frac{r_I}{\ln 2}\ln(C_2/C_1).
$$
Solving $\Delta R_I=\delta_R$ gives the displayed ratio. For infinitesimal increments, differentiating (5) gives
$$
\frac{\partial R_I}{\partial C}=\frac{r_I}{C\ln 2},
$$
so $dR_I=(r_I/\ln 2)(dC/C)$ and fixed $dR_I$ is equivalent to fixed $dC/C$. ∎

This is a conditional Weber–Fechner-form model relation: if $C$ is calibrated to external stimulus magnitude, the operational internal signal is identified with expended $R_I$, and $\delta_R$ is an empirically fixed just-noticeable internal threshold, then perceived intensity is logarithmic in $C$ and the model's exact just-noticeable fractional increment is $e^a-1$. Within PU, the logarithmic form is the representative reflexive-information cost (5). The signal identification remains an explicit psychophysical bridge assumption. For self-model-engaging perception, the relevant internal-cost interpretation is the perspectival profile and self-model cost functional of Appendix M §M.6.10, especially Definition M.10.1 and Proposition M.10.9. The logarithmic gain is $r_I/\ln 2$, while the model's fractional threshold is fixed by $\delta_R$ through $\Delta C/C=e^{\delta_R\ln 2/r_I}-1\approx\delta_R\ln 2/r_I$ for small increments.

**6.4 Adaptation Dynamics Driven by PCE**

The Principle of Compression Efficiency (PCE, Definition 15) specifies the net-benefit objective on a declared admissible class. On the stochastic gradient-flow branch of Appendix D, Equation D.8 specifies the adaptation dynamics, and the complexity component below is driven by the registered local gradient. Attainment of a global minimum and convergence to it require the separate hypotheses of the applicable optimization and dynamical theorems.

<a id="641-definition-20-def-20-pce-potential-and-adaptation-driving-force-psit"></a>**6.4.1 Definition 20 (Def 20): PCE Potential and Adaptation Driving Force $\Psi(t)$**
The adaptation dynamics are governed by the **Principle of Compression Efficiency (PCE) Potential $V(x)$**, which quantifies the net cost rate for a given MPU network configuration $x$. As detailed in Appendix D (Definition D.1), its core components are:
*   **Costs ($V_{op} + V_{\mathrm{prop}}$):** The total resource cost rate, including operational costs for maintaining complexity ($R, R_I$) and propagation costs for maintaining network coherence.
*   **Benefit ($V_{\mathrm{benefit}}$):** The power-equivalent predictive benefit derived from the system's performance $PP$.
The system's slow adaptation dynamics are modeled as a stochastic gradient flow seeking to minimize this potential: $dx(t) = -\eta(x) \nabla_x V(x) dt + \dots$ (Equation D.8).

The **Adaptation Driving Force $\Psi(t)$** for the complexity component $C(t)$ is defined as the negative of the local gradient of this potential with respect to $C(t)$, representing the net incentive for complexity adaptation. It arises from the local imbalance between the marginal benefit of increased complexity and its marginal cost.

The Adaptation Driving Force is:
$$
\Psi(t) = \Gamma_0 \frac{\partial PP}{\partial C}\bigg|_{C(t)} - \left( \lambda R'(C(t)) + R_I'(C(t)) \right) \quad \text{(24)}
$$
where:
1.  The **Power Conversion Factor ($\Gamma_0$)**: A positive **system-level constant** with dimensions of Power ($[E][T]^{-1}$), representing the conversion rate from dimensionless predictive performance gradients to an equivalent power. Its magnitude is set by the characteristic energy of the operational environment and the MPU cycle rate, e.g., $\Gamma_0 \propto k_B T_{\mathrm{eff}} \cdot \nu$. At an equilibrium complexity $C^*$, the condition $\Psi(C^*)=0$ yields the relation in Equation (29), linking $\Gamma_0$ to the marginal benefit and marginal costs at $C^*$.
2.  The **Resource Scarcity Factor $\lambda$**: A dimensionless weight ($\lambda \ge 0$), arising from the operational cost term $V_{op}$, representing the relative importance of physical versus informational costs.

The specific components of the driving force are:
*   **Marginal Benefit:** On the physical Law-of-Prediction branch and at times for which $C(t)>C_{op}$, the term $\Gamma_0 \frac{\partial PP}{\partial C}$ represents the marginal power-equivalent benefit rate per unit complexity increase, with units $[E][T]^{-1}[\text{Complexity}]^{-1}$. The performance gradient is
$$
\frac{\partial PP}{\partial C}\bigg|_{C(t), \hat{C}_{\mathrm{target}}(t)}
= (\beta - \alpha)\left(\frac{\kappa_{\mathrm{eff}}}{\hat{C}_{\mathrm{target}}(t)}\right)
e^{-\kappa_{\mathrm{eff}}\cdot \frac{C(t)-C_{op}}{\hat{C}_{\mathrm{target}}(t)}}
= \frac{\kappa_{\mathrm{eff}}}{\hat{C}_{\mathrm{target}}(t)}\big(\beta - PP(t)\big),
\quad \text{with } PP(t)=\beta-(\beta-\alpha)\,e^{-\kappa_{\mathrm{eff}}\cdot \frac{C(t)-C_{op}}{\hat{C}_{\mathrm{target}}(t)}} \quad \text{(25)}
$$
*   **Marginal Cost:** The term $\lambda R'(C(t)) + R_I'(C(t))$ is the weighted marginal resource cost rate, with units $[E][T]^{-1}[\text{Complexity}]^{-1}$. From Definition 3:
$$
    R_I'(C(t)) = \frac{r_I}{C(t) \ln 2} \quad (\text{for } C(t) > K_0) \quad \text{(26)}
    $$

*Interpretation:* The driving force $\Psi(t)$ quantifies the local marginal incentive for complexity changes: $\Psi>0$ favors increasing $C$, and $\Psi<0$ favors decreasing $C$. For the unconstrained scalar adaptation law with task scale held constant, an interior equilibrium satisfies $\Psi=0$. This is the stationarity condition of Definition 14; local maximality, attraction and uniqueness require the additional curvature and dynamical hypotheses of the applicable stability theorem. Boundary optima obey the corresponding one-sided condition.

<a id="proposition-19f-four-point-exponential-saturation-certificate"></a>**Proposition 19f (Four-Point Exponential-Saturation Certificate).** Let $c_j=c_0+j\delta$, $j=0,1,2,3$, be four independently calibrated resource values with $\delta>0$. An increasing exponential-saturation score $p(c)=B-Ae^{-\kappa c}$, $A,\kappa>0$, has increments $d_j=p(c_{j+1})-p(c_j)$ satisfying
$$
d_1^2=d_0d_2,\qquad d_0>d_1>d_2>0.
$$
Conversely these finite conditions determine an exponential-saturation curve through the four points.

*Proof.* Write $p(c_j)=B-A_0q^j$, with $A_0=Ae^{-\kappa c_0}>0$ and $q=e^{-\kappa\delta}\in(0,1)$. Then $d_j=A_0(1-q)q^j$. Conversely $q=d_1/d_0=d_2/d_1\in(0,1)$, $A_0=d_0/(1-q)$ and $B=p(c_0)+A_0$ give the desired values, with $\kappa=-\log q/\delta$. This certifies the four-point restriction; values between or beyond those resource points are a separate comparison. $\square$

For independent Bernoulli cohorts of sizes $n_j>1$, let $\widehat p_j$ be the sample proportions, $\widehat d_j=\widehat p_{j+1}-\widehat p_j$ and $F=d_1^2-d_0d_2$. An unbiased estimator of $F$ is
$$
\widehat d_1^2-\widehat d_0\widehat d_2
-\frac{\widehat p_1(1-\widehat p_1)}{n_1-1}
-\frac{\widehat p_2(1-\widehat p_2)}{n_2-1}.
$$
Indeed $\widehat d_0$ and $\widehat d_2$ use disjoint cohorts, so their product has mean $d_0d_2$, while $\mathbb E\widehat d_1^2=d_1^2+\operatorname{Var}\widehat p_1+\operatorname{Var}\widehat p_2$. Also $\mathbb E[\widehat p_j(1-\widehat p_j)/(n_j-1)]=p_j(1-p_j)/n_j$. Paired trials retain their covariance terms instead. Physical use registers the resource calibration independently of the score, a joint uncertainty procedure and the tested task family; a four-point fit is not a proof of continuum or architecture universality.

<a id="theorem-20-conditional-calibration-relations-for-gamma_0"></a>**Theorem 20 (Conditional Calibration Relations for $\Gamma_0$)**

Let $\Gamma_0>0$ be the system-level conversion factor appearing in the PCE potential.

1. On a branch with completed-cycle rate $\nu$, one execution of each listed registered reset per cycle, a common bath temperature $T>0$, and the Landauer hypotheses of Theorem 31, define the reset bath-heat power by $P_{\mathrm{reset}}:=\nu\sum_{j=1}^{n_{\mathrm{reset}}}\langle Q_{\mathrm{bath},j}\rangle$. It satisfies
   $$
   P_{\mathrm{reset}}\ge k_BT\nu
   \sum_{j=1}^{n_{\mathrm{reset}}}H_{q_j}(P_j\mid R_j).
   \quad\text{(27)}
   $$
   This inequality does not bound $\Gamma_0$ unless a separate calibration relation between reset power and the performance benefit scale is imposed.

2. If an independently registered available-power budget satisfies
   $$
   \Gamma_0\Delta PP_{\max}\le P_{\mathrm{avail}}
   $$
   for a declared $\Delta PP_{\max}>0$, then
   $$
   \Gamma_0\le\frac{P_{\mathrm{avail}}}{\Delta PP_{\max}}
   =:\Gamma_{0,\mathrm{crit}}.
   \quad \text{(28)}
   $$

3. At an interior equilibrium $C^*$ with $\partial PP/\partial C|_{C^*}>0$, Equation (24) gives the calibration identity
   $$
   \Gamma_0
   =\frac{\lambda R'(C^*)+R_I'(C^*)}
   {\frac{\partial PP}{\partial C}|_{C^*}}.
   \quad \text{(29)}
   $$
   Determination and uniqueness of $C^*$ require the existence and strict-concavity hypotheses of Theorem 22.

*Proof.* The first relation is the sum of the registered per-cycle bath-heat bounds multiplied by the cycle rate. Identifying this bath-heat power with supplied work power requires a separate energy-balance condition accounting for all non-bath and interaction-energy changes. The second relation follows by dividing the declared budget inequality by $\Delta PP_{\max}>0$. At an interior equilibrium, $\Psi(C^*)=0$; substituting Equation (24) and dividing by the positive performance derivative yields Equation (29). ∎

<a id="proposition-20a-complete-dimensional-modulus-for-gamma_0"></a>**Proposition 20a (Complete Dimensional Modulus for $\Gamma_0$).** Let $P_{\mathrm{ref}}>0$ be any independently registered power scale and let $z$ be the complete vector of dimensionless branch data. Every positive dimensionally admissible benefit--power conversion has the form
$$
\Gamma_0=P_{\mathrm{ref}}f(z)
\tag{29a}
$$
for a positive dimensionless function $f$ on the registered domain, and dimensional consistency imposes no further restriction on $f$. Equations (28) and (29) select a value only after their available-power or equilibrium quantities are independently measured on the same branch.

*Proof.* The ratio $\Gamma_0/P_{\mathrm{ref}}$ is dimensionless, so every admissible conversion defines $f(z):=\Gamma_0/P_{\mathrm{ref}}$. Conversely, multiplying $P_{\mathrm{ref}}$ by any positive dimensionless $f$ has power units and is admissible dimensionally. Equation (28) is an upper bound after $P_{\mathrm{avail}}$ and $\Delta PP_{\max}$ are supplied; Equation (29) is an identity after $C^*$, both marginal costs and the performance derivative are supplied. Neither equation follows from units alone. ∎

<a id="proposition-20b-exact-finite-benefit-power-calibration-classifier"></a>**Proposition 20b (Exact Finite Benefit--Power Calibration Classifier).** Let a finite calibration record contain positive performance increments $\Delta p_j$ and attributed benefit powers $P_j$ for $1\le j\le m$, with the branch law
$$
P_j=\Gamma_0\Delta p_j.
\tag{29b}
$$
An exact common calibration exists if and only if
$$
\frac{P_1}{\Delta p_1}
=\cdots=
\frac{P_m}{\Delta p_m},
\tag{29c}
$$
and then it is unique and equals that common ratio.

More generally, suppose the declared record supplies positive intervals
$$
P_j\in[P_j^-,P_j^+],
\qquad
\Delta p_j\in[d_j^-,d_j^+],
\qquad
0<d_j^-\le d_j^+.
$$
The complete compatible calibration interval is
$$
I_{\Gamma}
=
\bigcap_{j=1}^m
\left[
\frac{P_j^-}{d_j^+},
\frac{P_j^+}{d_j^-}
\right].
\tag{29d}
$$
The interval record is consistent exactly when $I_{\Gamma}\ne\varnothing$, and it identifies one value exactly when this intersection is a singleton.

*Proof.* In the exact case, division by each positive $\Delta p_j$ makes (29b) equivalent to $\Gamma_0=P_j/\Delta p_j$, proving (29c) and uniqueness. For fixed $j$, some values in the two supplied intervals satisfy (29b) exactly when the scaled interval $\Gamma_0[d_j^-,d_j^+]$ intersects $[P_j^-,P_j^+]$. Positivity makes this equivalent to
$$
\frac{P_j^-}{d_j^+}\le\Gamma_0\le\frac{P_j^+}{d_j^-}.
$$
Intersecting these necessary and sufficient conditions over all $j$ gives (29d). ∎

<a id="proposition-20c-two-level-szilard-benefit-power-meter"></a>**Proposition 20c (Two-Level Szilard Benefit--Power Meter).** Fix a bath temperature $T>0$, a cycle rate $\nu>0$, a quench energy $E_q>0$ and an integer $N\ge1$, and put $g(E)=(1+e^{E/k_BT})^{-1}$. The meter carrier is a two-level system whose Hamiltonian is degenerate at the start of each cycle; its occupied level $Y\in\{0,1\}$ is the task bit, and a predictor supplies a classical guess $\hat Y$. One cycle consists of four strokes:

(i) raise the energy of level $1-\hat Y$ from $0$ to $E_q$ instantaneously;
(ii) thermalize at fixed Hamiltonian;
(iii) for $k=0,\ldots,N-1$, lower that level from $E_k=E_q(1-k/N)$ to $E_{k+1}$ instantaneously and thermalize;
(iv) end with the degenerate Hamiltonian and the uniform Gibbs state, which is the source state of the next cycle.

Each thermalization exchanges heat only, for example by exchanging the carrier with a fresh bath two-level system of the same gap in its Gibbs state. The work delivered in one cycle is
$$
W=W^{(\mathrm{iii})}-E_q\,\mathbf 1\{\hat Y\ne Y\},
\qquad
\mathbb E\,W^{(\mathrm{iii})}=W_N=\frac{E_q}N\sum_{k=0}^{N-1}g(E_k),
\qquad
\operatorname{Var}W^{(\mathrm{iii})}=\sigma_N^2=\frac{E_q^2}{N^2}\sum_{k=0}^{N-1}g(E_k)\bigl(1-g(E_k)\bigr),
\tag{29e}
$$
where $-E_q\mathbf 1\{\hat Y\ne Y\}$ is the stroke-(i) work. The stroke-(iii) work $W^{(\mathrm{iii})}$ of a cycle is independent of that cycle's pair $(Y,\hat Y)$ and of all earlier cycles, so the stroke-(iii) works of successive cycles are independent and identically distributed. Call a run *nonadaptive* when every guess is formed without reading any stroke-(iii) outcome; in a nonadaptive run the whole sequence of stroke-(iii) works is independent of the whole sequence of pairs $(Y,\hat Y)$. A predictor with accuracy $PP=\Pr(\hat Y=Y)$ yields the metered benefit power
$$
P_{\mathrm{ben}}=\nu\langle W\rangle=\nu(W_N-E_q)+\nu E_q\,PP .
\tag{29f}
$$

1. Every pair of predictors obeys (29b) with $\Gamma_0=\nu E_q$ for the increment $\Delta p$ of their accuracies, the attributed benefit power being the difference of their mean benefit powers. Every finite record of $m\ge1$ predictor pairs with positive accuracy increments $\Delta p_j>0$ and their exact mean benefit-power differences therefore satisfies (29c) with common ratio $\nu E_q$, and Proposition 20b returns $\Gamma_0=\nu E_q$ uniquely. A pair with equal accuracies gives $0=\Gamma_0\cdot0$ and leaves $\Gamma_0$ unconstrained.
2. Over $n$ cycles with empirical accuracy $\hat p$, the stroke-(i) work power is exactly $\nu E_q(\hat p-1)$, so any two stroke-(i) records with distinct empirical accuracies return $\Gamma_0=\nu E_q$ exactly. The empirical power is $\hat P=\nu(\overline W^{(\mathrm{iii})}-E_q)+\nu E_q\,\hat p$, with $\overline W^{(\mathrm{iii})}$ the stroke-(iii) average. In a nonadaptive run $\overline W^{(\mathrm{iii})}$ is independent of $\hat p$. If in addition the $n$ correctness indicators are independent with common mean $PP$, the covariance of $(\hat p,\hat P)$ is
   $$
   \frac1n\begin{pmatrix}PP(1-PP)&\nu E_q\,PP(1-PP)\\ \nu E_q\,PP(1-PP)&\nu^2E_q^2\,PP(1-PP)+\nu^2\sigma_N^2\end{pmatrix},
   \qquad
   \sigma_N^2\le\frac{E_q^2}{4N}.
   \tag{29g}
   $$
3. $E_q$ is in joules, $\nu$ in $\mathrm s^{-1}$ and $\Gamma_0$ in watts. Writing $E_q=k_BT\ln\frac v{1-v}$ with $\frac12<v<1$ gives $\Gamma_0=\nu k_BT\ln\frac v{1-v}$, which is (29a) with $P_{\mathrm{ref}}=\nu k_BT$ and $f=\ln\frac v{1-v}$.
4. $0\le W_\infty-W_N\le\frac{E_q}N\bigl(\frac12-g(E_q)\bigr)$ with $W_\infty=k_BT\ln\frac2{1+e^{-E_q/k_BT}}=k_BT\ln(2v)$. In the quasistatic limit
   $$
   \langle W\rangle=k_BT\bigl[\ln2+PP\ln v+(1-PP)\ln(1-v)\bigr]\le k_BT\bigl[\ln2-h(PP)\bigr]\le k_BT\,I(Y;\hat Y),
   $$
   where $h(p)=-p\ln p-(1-p)\ln(1-p)$, and the first bound is an equality exactly when $v=PP$. For uniform $Y$, the second bound follows from $H(Y\mid\hat Y)\le h(PP)$. The meter never delivers more than the information-work bound of the prediction.
5. The meter work consists of strokes (i)--(iii). Acquiring, retaining and resetting $\hat Y$ and any sensor record are separate Definition-28 operations charged to $R$ and $R_I$, so $P_{\mathrm{ben}}$ contains no reset heat.

Hence (29e)--(29g) form a formal common-source power meter and response-faithful performance-increment package: the stroke-(i) work and the accuracy are read from the same correctness event, $PP\mapsto P_{\mathrm{ben}}$ is affine and injective, and its calibration map is $\Gamma_0=\nu E_q$.

*Proof.* If $\hat Y=Y$, stroke (i) raises an empty level and costs no work; otherwise it raises the occupied level and costs $E_q$. After stroke (ii) the carrier is in the Gibbs state with population $g(E_q)$ on the raised level, whatever $Y$ was, because the exchange installs a fresh bath state. In step $k$ of stroke (iii), lowering the raised level by $E_k-E_{k+1}=E_q/N$ delivers $E_q/N$ exactly when that level is occupied, which happens with probability $g(E_k)$ independently of $(Y,\hat Y)$, of the earlier steps and of all earlier cycles, because every thermalization installs a fresh Gibbs state; the following thermalization exchanges heat only: exchange with a bath element of the same gap commutes with the total Hamiltonian and transfers no work. Summing these independent Bernoulli contributions gives the mean and variance in (29e). After the last step the Hamiltonian is degenerate and the thermalized populations are $\frac12$, which proves (iv). The stroke-(iii) work of a cycle is a function of the fresh bath draws of that cycle's strokes (ii)--(iii), which are independent of the earlier history and of the current pair $(Y,\hat Y)$; this gives the stated independence and identical distribution. The occupied level at the start of the next cycle is set by the final thermalization, whose bath draw does not enter $W^{(\mathrm{iii})}$. In a nonadaptive run the guesses, and hence the pairs $(Y,\hat Y)$, are functions of the task data and of randomness independent of these bath draws, which gives the joint independence. Averaging (29e) over the correctness event gives (29f). With correctness indicators $c_i$, the stroke-(i) work of cycle $i$ is $-E_q(1-c_i)$; averaging over the $n$ cycles gives the affine identities of item 2. Under the independence premises of item 2, $\operatorname{Var}\hat p=PP(1-PP)/n$, $\operatorname{Cov}(\hat p,\hat P)=\nu E_q\operatorname{Var}\hat p$ and $\operatorname{Var}\hat P=\nu^2E_q^2\operatorname{Var}\hat p+\nu^2\sigma_N^2/n$, which is (29g), and $g(1-g)\le\frac14$ gives $\sigma_N^2\le E_q^2/(4N)$. Item 1 follows from (29f), which gives the power difference $\nu E_q\Delta p$ for each pair, and from Proposition 20b, which requires the positive increments $\Delta p_j$; and item 3 from $[E_q]=\mathrm J$ and $[\nu]=\mathrm s^{-1}$. For item 4, $g$ increases as $E$ decreases, so $(E_q/N)g(E_k)$ is the step length times the minimum of $g$ on $[E_{k+1},E_k]$. Hence $W_N$ is a lower Riemann sum of
$$
\int_0^{E_q}g(E)\,dE=k_BT\ln\frac2{1+e^{-E_q/k_BT}},
$$
with error at most $\frac{E_q}N(g(0)-g(E_q))$. For $E_q=k_BT\ln\frac v{1-v}$ one has $1+e^{-E_q/k_BT}=1/v$, so $W_\infty=k_BT\ln(2v)$, and $\langle W\rangle=W_\infty-E_q(1-PP)$ is the displayed expression. Gibbs' inequality $PP\ln v+(1-PP)\ln(1-v)\le-h(PP)$, with equality exactly at $v=PP$, gives the first bound. For uniform $Y$, Fano's inequality for a binary variable gives $H(Y\mid\hat Y)\le h(1-PP)=h(PP)$, so $I(Y;\hat Y)=\ln2-H(Y\mid\hat Y)\ge\ln2-h(PP)$. Item 5 is the ledger assignment of Definition 20: stroke work is benefit, and every record reset is a Definition-28 cost. ∎

**6.4.1a Finite-rate prediction and complete work accounting**

<a id="definition-20d-finite-stationary-predictor-and-kinetic-budget"></a>**Definition 20d (Finite Stationary Predictor and Kinetic Budget).**

Fix the following finite stationary branch.

1. $X$ is a finite source with at least two states, row generator $L$, and strictly positive stationary law $\pi$. It is irreducible and reversible: $\pi_xL_{xy}=\pi_yL_{yx}$. Its spectral gap is $a>0$, and $P_t=e^{tL}$.
2. $(X,M)$ is a stationary finite-state continuous-time Markov chain. A jump changes either source or memory, never both. Source jumps use $L$ independently of $M$: there is no feedback to the source. At fixed source state $x$, memory rates are $k^x_{mn}$.
3. Each occupied joint state satisfies the **total**, rather than per-edge, exit-rate cap
   $$\sum_{n\ne m}k^x_{mn}\le K,\qquad 0<K<\infty.$$
   Source jumps are not included in this cap. Memory cardinality, weights, topology, and affinities are otherwise unrestricted.
4. The full stationary entropy-production rate is finite. With $F_{ij}=p_iq_{ij}$ denoting a stationary directed joint flux,
   $$\Sigma=\sum_{\{i,j\}}(F_{ij}-F_{ji})\log\frac{F_{ij}}{F_{ji}}
      =\Sigma_X+\Sigma_M.$$
   Each unordered edge is counted once. A zero-flux pair contributes zero; a positive flux without a reverse flux gives infinite cost and is excluded.
5. The prediction horizon is a fixed finite $\tau\ge0$. All logarithms are natural. Information is measured in nats and $a,K,\Sigma$ have inverse-time units.

Write the stationary joint distribution as

$$
p_{xm}=w_m\rho_m(x),\qquad
\sum_mw_m\rho_m=\pi.
\tag{6K.2}
$$

Occupied memory labels have $w_m>0$. Their source posteriors are strictly positive: if an occupied label had a zero at one source state, connected source edges between positive and zero probabilities would violate finite entropy production. Define, using row-vector notation for $\rho$,

$$
b(\rho)=\rho L,\qquad D_\tau(\rho)=D(\rho P_\tau\Vert\pi),
$$

$$
S(\rho)=\sum_{x<y}
(\rho_xL_{xy}-\rho_yL_{yx})
\log\frac{\rho_xL_{xy}}{\rho_yL_{yx}}.
\tag{6K.3}
$$

Absent source edges are omitted. Reversibility gives the useful identity

$$
S(\rho)=-\sum_xb_x(\rho)\log\frac{\rho_x}{\pi_x}.
\tag{6K.4}
$$

To see it, write $\rho_x=\pi_x f_x$ and $c_{xy}=\pi_xL_{xy}=c_{yx}$. Then each source-edge contribution is $c_{xy}(f_x-f_y)(\log f_x-\log f_y)$; collecting coefficients of $\log f_x$ gives (6K.4).

The exact stationary identities are

$$
J=I(M_t;X_{t+\tau})=\sum_mw_mD_\tau(\rho_m),
\qquad R=I(M_t;X_t)=\sum_mw_mD(\rho_m\Vert\pi),
\tag{6K.5}
$$

$$
\Sigma_X=\sum_mw_mS(\rho_m).
\tag{6K.6}
$$

Equation (6K.5) follows from autonomy: conditional on $M_t=m$, the future source law is $\rho_mP_\tau$; its unconditional law remains $\pi$. Equation (6K.6) follows by substituting $p_{xm}=w_m\rho_m(x)$ into the source-edge flux formula.

**Compression means a bound on $R$ here.** It is retained current-source mutual information, not program length, physical rank, number of memory states, or memory entropy $H(M)$. The data-processing relation $J\le R$ follows from the Markov chain $M_t\to X_t\to X_{t+\tau}$. Identifying any of these quantities with a PU physical complexity requires a separate operational argument.

<a id="theorem-20e-posterior-dependent-finite-rate-dissipation-bound"></a>**Theorem 20e (Posterior-Dependent Finite-Rate Dissipation Bound).**

Every memory in the stated class satisfies

$$
b_x(\rho_m)<K\rho_m(x)\quad\text{for every }x,m,
\tag{6K.7}
$$

and

$$
\Sigma\ge\sum_mw_m\big[S(\rho_m)+B_K(\rho_m)\big],
\qquad
B_K(\rho)=\frac12\sum_x b_x(\rho)
\log\frac{K\rho_x}{K\rho_x-b_x(\rho)}.
\tag{6K.8}
$$

Each summand in $B_K$ is nonnegative. In particular, with

$$
\Gamma_{\mathrm{node}}(L,K,\tau)=
\inf_{\substack{\rho\ne\pi,\ \rho_x>0\\ b_x(\rho)<K\rho_x\ \forall x}}
\frac{S(\rho)+B_K(\rho)}{D_\tau(\rho)},
\tag{6K.9}
$$

one has $\Sigma\ge\Gamma_{\mathrm{node}}J$. This is a rigorous lower bound, not a claim that the constant is always sharp.

*Proof.*

At a joint node $i=(x,m)$ let $O_i$ and $I_i$ be its total outgoing and incoming memory flux. Stationarity gives

$$
d_i=O_i-I_i=w_mb_x(\rho_m).
$$

Apply log-sum first to all outgoing fluxes at each node, then to all incoming fluxes. Since the directed sum $\sum_{ij}F_{ij}\log(F_{ij}/F_{ji})$ equals $\Sigma_M$, the two bounds are

$$
\Sigma_M\ge\sum_iO_i\log(O_i/I_i),\qquad
\Sigma_M\ge\sum_iI_i\log(I_i/O_i).
$$

Averaging yields

$$
\Sigma_M\ge\frac12\sum_id_i\log\frac{O_i}{O_i-d_i}.
\tag{6K.10}
$$

Nodes with no memory flux have $d_i=0$ and contribute zero. Otherwise finite cost gives $O_i,I_i>0$. For fixed $d$,

$$
\frac{d}{dO}\left[d\log\frac{O}{O-d}\right]
=-\frac{d^2}{O(O-d)}\le0.
$$

The cap $O_i\le Kp_i$ therefore gives (6K.8), using (6K.6). If $d_i>0$, finite cost requires $d_i<O_i\le Kp_i$; if $d_i\le0$, (6K.7) is automatic. The sign of the logarithm in $B_K$ matches that of $b_x$, proving nonnegativity. Finally, for finite $\tau$, $P_\tau$ is invertible, so $D_\tau(\rho)>0$ whenever $\rho\ne\pi$. Averaging (6K.9) proves the information-only bound. $\square$

The full posterior bound can retain compression. For a prescribed $J_0$ and cap $R\le C$, minimize the right side of (6K.8) over finite posterior mixtures satisfying (6K.2), (6K.7),

$$
\sum_mw_mD_\tau(\rho_m)=J_0,
\qquad \sum_mw_mD(\rho_m\Vert\pi)\le C.
\tag{6K.11}
$$

This is a valid relaxation of the physical optimization. It is not an exact general compression–prediction frontier: nodewise log-sum equalities may be incompatible across edge endpoints, and feasible posterior mixtures need not attain their nodewise lower costs.

For comparison, define the source entropy-decay constant with its convention explicit,

$$
\alpha=\inf_{\rho\ne\pi}\frac{S(\rho)}{D(\rho\Vert\pi)}.
$$

It is positive for a fixed finite irreducible source. This follows from the positive quadratic limit near $\pi$, continuity away from $\pi$, and divergence of $S$ on a proper-support boundary of a connected source. Since $dD(\rho P_t\Vert\pi)/dt=-S(\rho P_t)$, integration gives $D_\tau\le e^{-\alpha\tau}D$. Hence

$$
\Sigma\ge\alpha e^{\alpha\tau}J.
\tag{6K.12}
$$

This source-only consequence is an application of established entropy contraction; substituting $2a$ for $\alpha$ is generally invalid. Equation (6K.8) retains an explicit finite-$K$ cost absent from (6K.12).

<a id="theorem-20f-sharp-uniformly-weak-posterior-prediction-cost"></a>**Theorem 20f (Sharp Uniformly Weak-Posterior Prediction Cost).**

Keep $L,K,\tau$ fixed. Consider any sequence of finite memories with $J>0$ and

$$
\delta=\max_{m,x}\left|\frac{\rho_m(x)}{\pi_x}-1\right|\longrightarrow0.
\tag{6K.13}
$$

The maximum ranges over occupied labels, whose number and weights may vary. Then
$$
\liminf\frac{\Sigma}{I(M_t;X_{t+\tau})}
\ge 2a\left(1+\frac{a}{2K}\right)e^{2a\tau}.
\tag{6K.1}
$$ Its coefficient is attainable as a limit by irreducible two-label memories satisfying the same total exit cap.

*Proof of the lower bound.*

Write $\rho_m=\pi(1+h_m)$, with $\langle h_m,1\rangle_\pi=0$, where $\langle f,g\rangle_\pi=\sum_x\pi_xf_xg_x$. Reversibility gives $b_x(\rho_m)=\pi_x(Lh_m)_x$ and $\rho_mP_\tau=\pi(1+P_\tau h_m)$.

The following estimates have constants depending only on fixed $L,K,\pi,\tau$, and therefore remain uniform over all memory labels and cardinalities:

$$
\begin{aligned}
\Sigma_X&=(1+O(\delta))\sum_mw_m\langle h_m,-Lh_m\rangle_\pi,\\
\Sigma_M&\ge\frac{1-O(\delta)}{2K}\sum_mw_m\|Lh_m\|_\pi^2,\\
J&=\frac{1+O(\delta)}2\sum_mw_m\|P_\tau h_m\|_\pi^2.
\end{aligned}
\tag{6K.14}
$$

Here a multiplicative $1+O(\delta)$ denotes upper and lower relative bounds, including the zero case. For the first estimate, the divided difference of $\log(1+h)$ on every source edge lies between $(1+\delta)^{-1}$ and $(1-\delta)^{-1}$. For the second, insert $b=\pi Lh$ into (6K.8) and use

$$
-\log(1-z)=z[1+O(\delta)],\qquad
z=\frac{Lh}{K(1+h)}=O(\delta).
$$

For the last, use $\|P_\tau h\|_\infty\le\delta$ and the Taylor expansion of $(1+u)\log(1+u)$; its linear term sums to zero.

Expand each mean-zero $h_m$ in an orthonormal eigenbasis of $-L$, with eigenvalues $\lambda_j\ge a$. For every mode,

$$
2\left(\lambda_j+\frac{\lambda_j^2}{2K}\right)e^{2\lambda_j\tau}
\ge 2\left(a+\frac{a^2}{2K}\right)e^{2a\tau},
$$

because this expression is increasing for positive $\lambda_j$ and $\tau\ge0$. Apply this inequality to the weighted sums in (6K.14) and let $\delta\to0$. This proves (6K.1).

*Attaining construction.*

Choose a gap eigenfunction $v$ with $Lv=-av$, $\langle v,1\rangle_\pi=0$, and $\|v\|_\pi=1$. Take labels $+$ and $-$, each of weight $1/2$, and posteriors

$$
\rho_\pm(x)=\pi_x(1\pm\varepsilon v_x).
\tag{6K.15}
$$

For $\varepsilon>0$ small enough that $\varepsilon(K+a)\max_x|v_x|<K$, define at each source state

$$
\begin{aligned}
d_x&=-a\varepsilon\pi_xv_x/2,\\
t_x&=\pi_x\left[K-\varepsilon(K+a/2)|v_x|\right],\\
F^x_{+-}&=(t_x+d_x)/2,\qquad F^x_{-+}=(t_x-d_x)/2.
\end{aligned}
\tag{6K.16}
$$

Use rates $k^x_{+-}=F^x_{+-}/p_{x+}$ and $k^x_{-+}=F^x_{-+}/p_{x-}$. Both fluxes are positive. Their difference is precisely the outgoing memory current needed to balance source injection at $+$. Thus the prescribed law is stationary and the full process is irreducible.

For $v_x\ge0$, $F^x_{-+}=K\pi_x(1-\varepsilon v_x)/2=Kp_{x-}$, while $F^x_{+-}\le Kp_{x+}$. For $v_x\le0$, exchange the labels. Hence both conditional rates are at most $K$.

The symmetric posterior pair cancels odd powers in the source and information expansions. Directly expanding the edge formula gives

$$
\Sigma_X=a\varepsilon^2+O(\varepsilon^4),\qquad
\Sigma_M=\frac{a^2\varepsilon^2}{2K}+O(\varepsilon^3),\qquad
J=\frac{\varepsilon^2e^{-2a\tau}}2+O(\varepsilon^4).
\tag{6K.17}
$$

For the memory term specifically, $d_x\log[(t_x+d_x)/(t_x-d_x)]=2d_x^2/t_x+O(\varepsilon^4)$, and summing its leading term yields $a^2\varepsilon^2/(2K)$. Dividing (6K.17) proves sharpness. $\square$

The condition (6K.13) is experimentally stronger than $J\to0$. One sufficient alternative is a fixed positive lower bound on every occupied label weight: (6K.5) then forces each $D_\tau(\rho_m)\to0$ uniformly; finite-dimensional invertibility of $P_\tau$ forces every $\rho_m\to\pi$. Without such a restriction, rare labels can retain a large posterior contrast.

<a id="proposition-20g-rare-label-construction-and-global-slope-enclosure"></a>**Proposition 20g (Rare-Label Construction and Global Slope Enclosure).**

The following construction explains the obstruction and supplies a numerical witness.

For any positive posterior $\rho\ne\pi$ satisfying (6K.7), introduce rare and bulk labels with

$$
p_{xr}=w\rho_x,\qquad p_{xb}=\pi_x-w\rho_x,
$$

$$
k^x_{rb}=K,\qquad
k^x_{br}=\frac{w[K\rho_x-b_x(\rho)]}{\pi_x-w\rho_x}.
\tag{6K.18}
$$

For sufficiently small $w>0$, both probabilities and rates are positive and $k^x_{br}\le K$. The outgoing-minus-incoming memory current at the rare label is $wb_x(\rho)$, giving stationarity. The process is irreducible. The bulk posterior is $\pi+O(w)$, so

$$
J=wD_\tau(\rho)+O(w^2),\quad
\Sigma_X=wS(\rho)+O(w^2),\quad
\Sigma_M=2wB_K(\rho).
$$

The last equality is exact because the rare/bulk flux ratio is $K\rho_x/[K\rho_x-b_x(\rho)]$. Therefore

$$
\lim_{w\to0}\frac{\Sigma}{J}
=\frac{S(\rho)+2B_K(\rho)}{D_\tau(\rho)}.
\tag{6K.19}
$$

#### Fixed finite source and four joint states

Take

$$
a=1,\quad K=10,\quad\tau=0.1,\quad
\pi=(0.01,0.99),\quad\rho=(0.1,0.9),
$$

$$
L=\begin{pmatrix}-0.99&0.99\\0.01&-0.01\end{pmatrix}.
$$

This reversible source has gap $1$. Here $b=(-0.09,0.09)$,

$$
S=0.09\log11,\qquad 2B_K=0.09\log(109/99),
\qquad \rho P_\tau=\pi+e^{-0.1}(\rho-\pi).
$$

Consequently the achieved limiting ratio is

$$
\frac{0.09\log(109/9)}
{D((0.01+0.09e^{-0.1},\ 0.99-0.09e^{-0.1})\Vert\pi)}
=1.80500191147\ldots,
$$

whereas the proposed unrestricted gap coefficient would be

$$
2(1+1/20)e^{0.2}=2.56494579214\ldots.
$$

Already at $w=0.01$, the stationary law in order $(0,r),(0,b),(1,r),(1,b)$ is $(0.001,0.009,0.009,0.981)$ and the generator is

$$
Q=\begin{pmatrix}
-10.99&10&0.99&0\\
109/90&-(109/90+0.99)&0&0.99\\
0.01&0&-10.01&10\\
0&0.01&99/1090&-(99/1090+0.01)
\end{pmatrix}.
\tag{6K.20}
$$

It has $J=0.00127839574085$ and $\Sigma/J=1.82362638485$. Every conditional total memory exit rate is at most $10$. This is an explicit finite irreducible counterexample, rather than a formal disconnected mixture.

#### The obstruction occurs for every finite rate cap and horizon

Fix any $a,K>0$ and finite $\tau\ge0$. Choose $0<s<K/(K+a)$, then set

$$
\pi=(p,1-p),\qquad \rho=(s,1-s),\qquad
L=a(\mathbf{1}\pi-I).
$$

For sufficiently small positive $p$, (6K.7) holds. As $p\to0$,

$$
S(\rho)=as\log(1/p)+O(1),\quad
2B_K(\rho)=O(1),\quad
D_\tau(\rho)=se^{-a\tau}\log(1/p)+O(1).
$$

The first follows from $S=a(s-p)\log[s(1-p)/(p(1-s))]$. The second follows because the two positive denominators in $B_K$ have positive limits by the restriction on $s$. The third follows from $\rho P_\tau=\pi+e^{-a\tau}(\rho-\pi)$. Thus (6K.19) tends to $ae^{a\tau}$, strictly below the coefficient in (6K.1). First choose a sufficiently biased **fixed** source; then let $w\to0$. The source distribution does not change within the low-information limit.

Nor is arbitrarily slow total-variation mixing essential. In rare-then-bulk order the generators (6K.18) converge to

$$
Q_0=\begin{pmatrix}L-KI&KI\\0&L\end{pmatrix}.
$$

The limiting chain exits the rare sector at rate $K$ and has unique stationary law $(0,\pi)$. Its worst-start total-variation distance is at most $e^{-Kt}+\max_x\|P_t(x,\cdot)-\pi\|_{\mathrm{TV}}$. At any fixed accuracy, choose a finite time where this bound is strictly below that accuracy. Continuity of the matrix exponential and of the prescribed stationary laws gives the same finite bound for all sufficiently small positive $w$. A generic requirement of bounded mixing time therefore does not exclude this family. The time needed to collect many rare informative events can still grow like $1/w$.

#### Dilution and the unrestricted low-information slope

Let

$$
\Gamma_{\star}=\inf\{\Sigma/J:\text{finite cap-feasible stationary memory},\ J>0\}.
$$

With no additional uniform mixing or minimum-occupation restriction, define $\Sigma_{\inf}(J)$ as the infimum at exactly $J$. Then

$$
\lim_{J\downarrow0}\frac{\Sigma_{\inf}(J)}J=\Gamma_{\star}.
\tag{6K.21}
$$

**Proof.** The definition gives the lower bound. For any positive-information design with values $(J_0,\Sigma_0)$, add an independent idle memory label and place fraction $q=J/J_0$ in the active block. Both blocks have source marginal $\pi$. Their mixture has information $qJ_0$, entropy production $q\Sigma_0$, and the same conditional exit rates within the active block. The ratio is unchanged.

If irreducibility is required, preserve the stationary law while removing arbitrarily small equal amounts from the two directed fluxes of each used memory edge. This creates cap slack without changing any current. Finite entropy production ensures both directions on used edges are positive, so sufficiently small removals are possible. Nodes without memory edges already have slack. Add still smaller balanced flux pairs from each active label to the idle label in each source layer. These bridges have zero entropy production and preserve all currents; cap slack makes them admissible. The connected source and bridges make the joint chain irreducible. Existing edge costs vary continuously and approach their original values. Hence the same infimum is obtained. Let the original ratio approach $\Gamma_{\star}$ to prove (6K.21). $\square$

A fixed positive cap on mean memory activity or on $R$ does not prevent dilution: both totals tend to zero with $q$, and bridge activity can be made arbitrarily small. The weak-posterior theorem can also satisfy any such positive budgets: choose a fixed active fraction small enough that its activity is strictly below the activity cap, then create slack and add balanced bridges. For each amplitude, choose the traffic perturbation so its entropy-production change is $o(\varepsilon^2)$; continuity permits this, and the information is unchanged. All conditional posteriors remain weak, so the limiting coefficient is preserved.

The proved bounds are therefore

$$
\Gamma_{\mathrm{node}}\le\Gamma_{\star}\le
\min\left\{
2a\left(1+\frac{a}{2K}\right)e^{2a\tau},
\inf_{\substack{\rho\ne\pi,\ \rho_x>0\\ b_x(\rho)<K\rho_x\ \forall x}}
\frac{S(\rho)+2B_K(\rho)}{D_\tau(\rho)}
\right\}.
\tag{6K.22}
$$

There is a useful quantified enclosure even without knowing the exact optimum. Define $\Gamma_{\mathrm{rare}}$ as the second entry of the minimum in (6K.22), on exactly the posterior domain used for $\Gamma_{\mathrm{node}}$. Since $S,B_K\ge0$, pointwise

$$
S+B_K\le S+2B_K\le2(S+B_K).
$$

Taking infima, and applying the lower bound and rare-label construction, proves

$$
\boxed{
0<\alpha e^{\alpha\tau}
\le\Gamma_{\mathrm{node}}
\le\Gamma_{\star}
\le\Gamma_{\mathrm{rare}}
\le2\Gamma_{\mathrm{node}}<\infty.
}
\tag{6K.22a}
$$

Finiteness follows by using any sufficiently small nonzero mean-zero perturbation of $\pi$: it lies in the strict posterior domain, and its numerator and denominator have positive finite quadratic limits. Thus a source-dimensional posterior optimization bounds the global low-information slope to within a factor of two, independently of memory size or topology. Certifying the numerical value for a particular source still requires a global optimization certificate; finding one local minimum does not suffice. The spectral construction can further improve the upper endpoint through (6K.22).

No equality in (6K.22) or (6K.22a) is asserted for an arbitrary source. The exact unrestricted general-source constant remains undetermined here. A local quadratic calculation cannot settle it because dilution makes every finite-amplitude design relevant arbitrarily close to $J=0$.

<a id="proposition-20h-complete-isothermal-work-interpretation"></a>**Proposition 20h (Complete Isothermal Work Interpretation).**

The mathematical theorems concern full joint CTMC entropy production. To write a power bound, the physical implementation must independently justify a complete stationary isothermal ledger. In particular, assume one bath at temperature $T$, time-independent state energies $E_i$, all modeled work increments $w_{ij}=-w_{ji}$, and local detailed balance

$$
\log(q_{ij}/q_{ji})
=\frac{w_{ij}-(E_j-E_i)}{k_BT}.
\tag{6K.23}
$$

For the present reversible source, one **formal edgewise local-detailed-balance assignment** is $E(x,m)=-k_BT\log\pi_x$, zero work on source edges, and $w_{(x,m),(x,n)}=k_BT\log(k^x_{mn}/k^x_{nm})$ on each used memory edge. Source detailed balance and equal energies within each source layer verify (6K.23) directly. This supplies a consistent ideal network ledger; it is not a proof that engineered hardware implements all prescribed rates without additional costs. It also shows why a special binary device's source-driving-work interpretation does not automatically transfer to general memory networks.

At stationarity, summing over edges cancels both the probability-entropy term and mean internal-energy change. Explicitly,

$$
\sum_{\{i,j\}}(F_{ij}-F_{ji})\log(p_i/p_j)=0,
\qquad
\sum_{\{i,j\}}(F_{ij}-F_{ji})(E_j-E_i)=0.
$$

These identities follow by grouping terms at each node and using zero net stationary divergence. Thus the **net work supplied on all modeled edges** satisfies

$$
P_{\mathrm{modeled}}=k_BT\Sigma.
\tag{6K.24}
$$

Equations (6K.8) and (6K.1) may be multiplied by $k_BT$ only under this registered physical interpretation. Source work must be included; $\Sigma_X$ alone is not generally source heat, and $\Sigma_M$ alone is not generally the device's heat. Hidden clocks, source generation, maintenance, readout, preparation, reset, and exported records require their own ledger. The stochastic sharpness construction establishes achievable rates and fluxes within the model, not cost-free experimental control or a universally attainable wall-plug efficiency. Net work also differs from gross supplied work if returned work cannot be recovered.

Rate rescaling also rules out an information-only absolute power constant: replacing $(L,K,\tau)$ by $(sL,sK,\tau/s)$ leaves the corresponding stationary posteriors and predictive information unchanged while multiplying $\Sigma$ by $s$. A physical time scale, temperature, and kinetic restriction are essential inputs.

<a id="corollary-20i-bounded-affinity-label-floor-and-uniform-weakness"></a>**Corollary 20i (Bounded-Affinity Label Floor and Uniform Weakness).** Fix a source with $n$ states and strictly positive invariant law $\pi$, a memory with at most $D$ labels, and an irreducible joint chain on the full source-memory product. Suppose every allowed edge has its reverse and every bidirectional joint rate ratio lies in $[e^{-B},e^B]$, for one fixed finite $B$. Then each occupied memory label has probability at least

$$
w_{\min}=\frac{e^{-B(nD-1)}}D.
$$

*Proof.* The stationary Markov-tree formula pairs a tree rooted at one joint state with a tree rooted at another by reversing the unique path between their roots. At most $nD-1$ edges are reversed, so the ratio of corresponding tree weights is bounded by $e^{B(nD-1)}$. Summing establishes the same bound on stationary state-probability ratios. Every joint state consequently has probability at least $e^{-B(nD-1)}/(nD)$; summing over its $n$ source states proves the label bound. Using fewer than $D$ labels only strengthens the conservative bound. ∎

Let $K_\tau=e^{\tau L}$ describe an autonomous source at a fixed finite lag, and write $q_m$ for its current posterior given the memory. The full-future predictive information is

$$
J=\sum_m w_m D_{\mathrm{KL}}(q_mK_\tau\Vert\pi).
$$

Pinsker's inequality and the inverse channel give

$$
\max_m\|q_m-\pi\|_1
\le \|K_\tau^{-1}\|_{1\to1}\sqrt{\frac{2J}{w_{\min}}}.
$$

Here the matrix norm is induced on signed row vectors. Since $\pi_{\min}>0$, this also bounds the maximum posterior-density deviation by division by $\pi_{\min}$. Thus, at fixed $n,D,B,\tau$, the limit $J\to0$ really does imply uniformly weak posteriors. This supplies a sufficient condition for applying the spectral lower bound of Theorem 20f. It does not establish attainability of that bound by a physically local sensor.

The bound is for fixed $n,D,B,\tau$ and the full future-state task. Its dependence on $nD$ and the inverse semigroup is explicit.

<a id="theorem-20j-exact-binary-hard-cap-prediction-frontier"></a>**Theorem 20j (Exact Binary Hard-Cap Prediction Frontier).** Specialize Definition 20d to an autonomous symmetric binary source flipping at rate $\lambda>0$, with total conditional memory exit cap $K>0$, unrestricted finite memory topology, and no additional mean-activity restriction. Let $\tau\ge0$ be the fixed forecast horizon, $r=e^{-2\lambda\tau}$, and define
$$
f(c)=\frac{(1+c)\log(1+c)+(1-c)\log(1-c)}2,\quad
u(c)=f(rc),\quad h=\frac K{K+2\lambda},
$$
$$
L(c)=K-(K+\lambda)c,\qquad
\psi_K(c)=\lambda c\log\frac{1+c}{1-c/h},\quad 0\le c<h.
$$
For every $0<J<u(h)$ put $c_J=u^{-1}(J)$. A stationary finite memory with predictive information $J$ and current-information bound $R\le C_X$ exists at finite cost exactly when
$$
C_X\ge f(c_J).
$$
Its exact least full joint entropy-production rate is
$$
\Sigma_{*,K}(J,C_X)=\psi_K(c_J).
$$
An irreducible two-state memory attains this minimum and simultaneously attains the least current information $R=f(c_J)$. Every optimum has constant absolute posterior bias $c_J$ on its occupied labels. Redundant physical labels are permitted. At $J=0$ a one-label memory has zero cost.

*Proof.* Write
$$
p(x,m)=\frac{w_m}2[1+(-1)^xc_m],\qquad c=|c_m|.
$$
Autonomy gives $J=\sum_mw_mf(rc_m)$ and $R=\sum_mw_mf(c_m)$, while the source edges contribute $2\lambda\sum_mw_mc\operatorname{atanh}c$ to the joint entropy production.

First shorten the memory-current network in each fixed-source layer without changing its stationary node masses or divergences. Orient each nonzero current edge so its forward/reverse fluxes are $a_e>b_e>0$, with $j_e=a_e-b_e$. A finite nonnegative current flow decomposes into paths from positive to negative divergence and directed cycles. On a path component carrying $j$, allocate the same fraction $j/j_e$ of both original fluxes on each edge; its allocated pair is $(j+b'_e,b'_e)$. Replace that path by its endpoint edge with backward flux $b_* =\min_e b'_e$ and forward flux $j+b_*$. Every endpoint's outgoing flux is no larger than before, intermediate nodes lose their allocated outgoing fluxes, and
$$
j\log(1+j/b_*)=\max_e j\log(1+j/b'_e)
\le\sum_ej\log(1+j/b'_e).
$$
Drop cycle components and merge parallel edges. Log-sum, or joint convexity and homogeneity of $(a-b)\log(a/b)$, shows that merging cannot increase entropy production. Outgoing flux at each node never increases, so every original total exit cap is respected after division by its unchanged mass. The full joint stationary law and both information quantities are unchanged. This comparison is available because the finite memory topology is unrestricted.

After shortening, each surviving edge has exactly one positive-divergence minority endpoint. At label $m$ that endpoint has mass $w_m(1-c)/2$ and net outgoing memory current $d_m=\lambda w_mc$. If its outgoing plus incoming flux is $w_ma_m$, finite entropy production and the exit cap imply
$$
\lambda c<a_m\le K(1-c)-\lambda c=L(c),\qquad c<h.
$$
Log-sum at that endpoint gives its memory contribution at least
$2\lambda w_mc\operatorname{atanh}(\lambda c/a_m)$. Each edge is counted once. Therefore, with the source contribution included,
$$
\Sigma\ge\sum_mw_mF(c,a_m),\qquad
F(c,a)=2\lambda c[\operatorname{atanh}c+
\operatorname{atanh}(\lambda c/a)].
$$
At zero bias its lower contribution is zero. For positive $c$, $F$ strictly decreases in $a$, so
$$
F(c,a)\ge F(c,L(c))=\psi_K(c).
$$

The function $\psi_K\circ u^{-1}$ is strictly convex. To see the needed strictness explicitly, its absolutely convergent source series is
$$
\frac{\psi_K(c)}\lambda=
\sum_{m=2}^\infty\frac{h^{-(m-1)}+(-1)^m}{m-1}c^m.
$$
Since $u''(c)=r^2/(1-r^2c^2)$, it suffices to check that $(1-r^2c^2)\psi_K''(c)$ strictly increases. Its coefficient of $c$ is $3\lambda(h^{-2}-1)>0$; for $n\ge2$ its coefficient divided by $\lambda$ is
$$
h^{-(n+1)}[(n+2)-r^2nh^2]+(-1)^n[(n+2)-r^2n]>0.
$$
Even $n$ is immediate. For odd $n$, the first term strictly exceeds the second term's magnitude because $0<h<1$. Thus $\psi_K''/u''$ strictly increases. With $\psi_K'(0)=u'(0)=0$, the ratio $\psi_K'/u'$ is its strictly increasing weighted average with positive weight $u''$. Jensen now gives
$$
\Sigma\ge\sum_mw_m\psi_K(c)
\ge\psi_K\!\left(u^{-1}\!\left(\sum_mw_mu(c)\right)\right)
=\psi_K(c_J),
$$
with equality in the second step precisely for constant $c=c_J$.

The analogous static convexity follows from
$$
\frac{f''(c)}{u''(c)}=\frac{1-r^2c^2}{r^2(1-c^2)},
$$
which is nondecreasing for $r\le1$; the same weighted-average argument makes $f\circ u^{-1}$ convex. Hence $R\ge f(c_J)$. Also every occupied positive-bias label has $c<h$, so $J<u(h)$.

Conversely, use two equiprobable labels with posterior biases $\pm c_J$. Put $a=L(c_J)$ and, in each source layer, let the minority-to-majority and reverse memory rates be
$$
k_{\rm fast}=\frac{a+\lambda c_J}{1-c_J},\qquad
k_{\rm slow}=\frac{a-\lambda c_J}{1+c_J}.
$$
They are positive, $k_{\rm fast}=K$, and $k_{\rm slow}<K$. Their stationary divergence cancels the autonomous source divergence. Direct edge-flux substitution gives activity $a$, retained information $f(c_J)$ and full entropy production $F(c_J,a)=\psi_K(c_J)$. Source and memory jumps connect the entire four-state joint carrier, giving irreducibility and the claimed attainment. $\square$

This exact frontier refines Theorem 20e's general-source relaxation on a specified binary branch. Its small-information tangent is
$$
\Sigma_{*,K}(J)=\frac{4\lambda}{r^2}\left(1+\frac\lambda K\right)J+O(J^{3/2}).
$$
A further mean-activity cap or fixed physical topology defines a different comparison class.

<a id="theorem-20k-binary-prediction-score-power-and-finite-rate-onset"></a>**Theorem 20k (Binary Prediction Score, Power and Finite-Rate Onset).** Retain Theorem 20j's source and kinetic class and the complete isothermal modeled-work interpretation of Proposition 20h. Put
$$
\Phi(J)=\psi_K\!\left(\frac{f^{-1}(J)}r\right),\qquad
J_h=f(rh),\quad
\mathcal J_C=\{0\le J<J_h:f(f^{-1}(J)/r)\le C_X\}.
$$
Optimal logarithmic prediction has loss $\log2-J$. Let $w\ge0$ be a registered power-equivalent reward per nat of improvement, and take the complete candidate-dependent scalar objective to be
$$
V_w(J)=k_BT\Phi(J)-wJ.
$$
Other costs must be constant across this comparison or included in its specified objective. This is a variational selection problem on the stated source class.

(a) **Exact score selection.** For $C_X>0$, define
$$
\alpha=\frac{4\lambda}{r^2}\left(1+\frac\lambda K\right),\qquad
w_c=k_BT\alpha,\qquad b_C=f^{-1}(\min\{C_X,\log2\}).
$$
There is one minimizing score. It is zero exactly when $w\le w_c$. For $w>w_c$, let $J_0$ be the unique root $k_BT\Phi'(J_0)=w$. If $b_C<h$, the minimizer is $J_*=\min\{J_0,f(rb_C)\}$; otherwise it is $J_0$. The binary memory of Theorem 20j attains the score. At $C_X=0$ every feasible score is zero.

*Proof.* Theorem 20j proves strict convexity, continuity at zero and exact attainability of $\Phi$. Its right derivative at zero is $\alpha$. At the open endpoint $J_h$, $\psi_K'$ diverges while $r\operatorname{atanh}(rh)$ stays finite and positive, so $\Phi'\to\infty$. Thus $V_w'$ is strictly increasing from $w_c-w$ to infinity. At or below threshold it is positive at every positive score. Above threshold its sole root minimizes the objective, clipped only by an attained retention endpoint. $\square$

The interior marginal equation has the explicit form
$$
\frac{w}{k_BT}=
\frac{\lambda[\log((1+b)/(1-b/h))+
 b((1+b)^{-1}+(h-b)^{-1})]}{r\operatorname{atanh}(rb)},\qquad J=f(rb).
$$
This identifies a unique score, rather than a unique full physical implementation. For $C_X>0$, continuity allows distinct feasible scores approaching $J_*$, so the infimum of their positive objective differences is zero. A positive gap between operational classes therefore uses its own actual resolution separation or finite-census condition.

(b) **A separately priced retention resource.** If $\zeta\ge0$ is a registered power-equivalent price per nat of current information, replace the objective by
$$
V_{w,\zeta}(J)=k_BT\Phi(J)+\zeta R_{\min}(J)-wJ,\qquad
R_{\min}(J)=f(f^{-1}(J)/r).
$$
The same binary construction simultaneously minimizes both charged resources. Its strictly convex total cost has threshold $w_c(\zeta)=k_BT\alpha+\zeta/r^2$ and marginal equation $k_BT\Phi'(J)+\zeta R_{\min}'(J)=w$, with the same clipping rule. Convexity of $R_{\min}$ follows from the derivative ratio used in Theorem 20j; $R_{\min}'(0+)=1/r^2$. The price is an independently registered valuation, or a separately verified disjoint physical cost, so it does not double-charge the modeled entropy production.

(c) **Finite-rate onset.** For every fixed finite $K>0$,
$$
\Phi(J)=\alpha J+\beta J^{3/2}+\gamma J^2+O(J^{5/2}),
$$
$$
\beta=\frac{\sqrt2\lambda(h^{-2}-1)}{r^3}>0,\qquad
\gamma=\frac{4\lambda(1+h^{-3})}{3r^4}
-\frac{2\lambda(1+h^{-1})}{3r^2}>0.
$$
With $\varepsilon=w/(k_BT)-\alpha\downarrow0$ and fixed $C_X>0$,
$$
J_*=\frac4{9\beta^2}\varepsilon^2+O(\varepsilon^3),\qquad
b_* =\frac{2\sqrt2}{3r\beta}\varepsilon+O(\varepsilon^2),
$$
$$
\min V_w=-k_BT\frac4{27\beta^2}\varepsilon^3
+O(k_BT\varepsilon^4).
$$
*Proof.* The source expansions are
$$
\psi_K(b)=\lambda(1+h^{-1})b^2+
\frac\lambda2(h^{-2}-1)b^3+\frac\lambda3(1+h^{-3})b^4+O(b^5),
$$
$$
J=f(rb)=r^2b^2/2+r^4b^4/12+O(b^6),\quad
b^2=2J/r^2-2J^2/(3r^2)+O(J^3),\quad
b^3=2\sqrt2J^{3/2}/r^3+O(J^{5/2}).
$$
Substitution proves the coefficients. Positivity of $\gamma$ follows from $r\le1$, $h<1$ and $2(1+h^{-3})>1+h^{-1}$. With $y=\sqrt J$, the marginal equation is $\varepsilon=(3/2)\beta y+2\gamma y^2+O(y^3)$; invert its positive linear coefficient and substitute into the objective. Every fixed positive retention cap is inactive sufficiently near onset. $\square$

For part(b), use $\varepsilon=(w-w_c(\zeta))/(k_BT)$; its extra retention term changes only the $J^2$ coefficient, since
$$
R_{\min}(J)=J/r^2+(1-r^2)J^2/(3r^4)+O(J^3).
$$
The finite-$K$ onset is nonuniform in the infinite-rate limit: as $K\to\infty$, $h\to1$, $\beta\to0$, and the limiting infimum curve is $2\lambda b\operatorname{atanh}b$, not an attained finite-rate optimum. Its expansion has quadratic coefficient $4\lambda(2-r^2)/(3r^4)$ and its variational onset is linear,
$$
J_{*,\infty}\sim\frac{3r^4}{8\lambda(2-r^2)}
\left(\frac w{k_BT}-\frac{4\lambda}{r^2}\right).
$$

(d) **An exact hard-cap Bayes horizon.** On the same modeled-power branch let $P\ge0$ and define
$$
b_P=\psi_K^{-1}(P/(k_BT)),\qquad b_{\rm eff}=\min\{b_P,b_C\}.
$$
Then the largest stationary Bayes accuracy at proper horizon $\theta$ is
$$
p_{\max}(\theta)=\frac{1+e^{-2\lambda\theta}b_{\rm eff}}2.
$$
For a required $p_*\in(1/2,1)$ put $s=2p_*-1$. A nonnegative horizon is feasible exactly when $b_{\rm eff}\ge s$, and its attained maximum is
$$
\theta_{\max}=\frac1{2\lambda}\log(b_{\rm eff}/s).
$$
*Proof.* For any finite memory put $b=\mathbb E|\mathbb E[(-1)^X\mid M]|$. The source semigroup gives accuracy $(1+e^{-2\lambda\theta}b)/2$. The shortening proof above gives $\Sigma\ge\mathbb E\psi_K(|c_M|)\ge\psi_K(b)$, because its series is strictly convex in $b$. Jensen also gives $R\ge f(b)$. Hence $b\le b_P,b_C$. The two-label construction with constant absolute bias $b_{\rm eff}$ attains both bounds; at zero bias use one label. Solving the target-accuracy inequality proves the horizon formula. $\square$

At fixed $P,\lambda,K,C_X$, increasing $T$ makes $b_P$ decrease for $P>0$, so accuracy and the feasible horizon are nonincreasing, with a possible retention-limited plateau. This comparison holds the proper-time rates fixed; a fixed-hardware temperature sweep must use its actual rate dependence. The source's modeled net power is the complete work in Proposition 20h, and its joint entropy production includes source driving. Costs of further source preparation, clocks, maintenance, readout and any additional reservoirs retain their declared owners.

<a id="corollary-20l-sign-separated-posterior-dissipation-bound"></a>**Corollary 20l (Sign-Separated Posterior Dissipation Bound).** Retain the arbitrary finite reversible source and full memory class of Definition 20d. On the strict posterior domain $b_x(\rho)<K\rho_x$, define
$$
\chi_x(\rho)=b_x(\rho)\log\frac{K\rho_x}{K\rho_x-b_x(\rho)},\qquad
\chi_x^+(\rho)=\mathbf1_{\{b_x>0\}}\chi_x(\rho),\quad
\chi_x^-(\rho)=\mathbf1_{\{b_x<0\}}\chi_x(\rho).
$$
Every admitted finite memory obeys
$$
\Sigma_M\ge\sum_x\max\left\{
\sum_mw_m\chi_x^+(\rho_m),\quad
\sum_mw_m\chi_x^-(\rho_m)\right\}.
$$
The maximum is taken after averaging over memory labels within each fixed-source layer. In particular it implies Theorem 20e's averaged-node bound.

*Proof.* The path/cycle shortening argument in Theorem 20j uses only a finite layer's masses, divergences and fluxes, so it applies independently in every fixed-source layer of an arbitrary finite source. It preserves the entire joint law and each divergence, and does not increase any node's outgoing flux, total activity or entropy production. Its remaining edges join positive-divergence nodes directly to negative-divergence nodes.

Group those edges first by their positive-divergence endpoint. Each edge is counted once. With total outgoing flux $O$, incoming flux $I=O-d$ and $d=w_mb_x(\rho_m)>0$, the two log-sum inequalities give a node contribution at least $d\log[O/(O-d)]$. The derivative with respect to $O$ is $-d^2/[O(O-d)]\le0$. Since $O\le Kp_{xm}=Kw_m\rho_m(x)$, substitution gives $w_m\chi_x^+(\rho_m)$. Grouping instead by negative-divergence endpoints again counts every edge once and gives the same expression with $d<0$, hence the sum of $w_m\chi_x^-(\rho_m)$. Both lower bounds hold in that layer, so their maximum holds. Sum over source states and compare to the original, no smaller, cost. Since
$$
B_K(\rho)=\tfrac12\sum_x[\chi_x^+(\rho)+\chi_x^-(\rho)],
$$
the displayed inequality implies Theorem 20e. $\square$

For an information-only bound, let $\mathcal A_K$ be the strictly positive posterior probabilities other than $\pi$ satisfying every strict cap inequality, and put
$$
B_{K,\theta}(\rho)=\sum_x[\theta_x\chi_x^+(\rho)+(1-\theta_x)\chi_x^-(\rho)],
\qquad \theta\in[0,1]^{|X|},
$$
$$
\Gamma_{\rm sep}=\sup_{\theta\in[0,1]^{|X|}}
\inf_{\rho\in\mathcal A_K}
\frac{S(\rho)+B_{K,\theta}(\rho)}{D_\tau(\rho)}.
$$
Using the global all-finite-memory coefficient $\Gamma_\star$ and rare-label upper bound of Proposition 20g,
$$
\Gamma_{\rm node}\le\Gamma_{\rm sep}\le\Gamma_\star
\le\Gamma_{\rm rare}\le2\Gamma_{\rm node}\le2\Gamma_{\rm sep}.
$$
Indeed, each layer's maximum bounds every fixed convex combination selected by $\theta_x$. Add its source cost, bound each posterior ratio below by its infimum and average to obtain $\Sigma\ge\Gamma_{\rm sep}J$. The choice $\theta_x=1/2$ gives $\Gamma_{\rm node}$; Proposition 20g gives the remaining upper bounds. This sharpening keeps the arbitrary-source optimum as an infimum over its actual realizable memories; it does not assert equality of the posterior relaxation with that optimum.

<a id="theorem-20m-exact-simultaneous-activity-exit-and-information-frontier"></a>**Theorem 20m (Exact Simultaneous Activity, Exit and Information Frontier).**

Retain Theorem 20j's binary source, functions $f(c),u(c)=f(rc),h,L(c)$ and posterior notation. Impose in addition the mean memory activity $A_{\rm act}=\sum_x\sum_{m<n}(p_{xm}k^x_{mn}+p_{xn}k^x_{nm})\le A$, with $A>0$. All costs remain full joint stationary entropy-production rates. For the nontrivial range take $0<J<u(h)$ and $C_X\ge0$, and put $c_J=u^{-1}(J)$; values $J\ge u(h)$ are infeasible at finite cost by Theorem 20j.

For $0<r<1$, define

$$
C_{\min}=f(c_J),\qquad C_{\rm end}=J\log2/u(1),
$$

and, when $C_X\ge C_{\min}$,

$$
\bar c=\begin{cases}
1,&C_X\ge C_{\rm end},\\
\text{the unique }c\in[c_J,1)\text{ with }Jf(c)/u(c)=C_X,&C_X<C_{\rm end}.
\end{cases}
$$

For $r=1$, set $C_{\min}=J$ and $\bar c=1$; compression is the condition $C_X\ge J$. Put $d=\min(h,\bar c)$. Finite-cost feasibility at positive $J$ is equivalent to

$$
J<u(h),\qquad C_X\ge C_{\min},\qquad
\lambda Jd/u(d)<A,
\tag{20m.2}
$$

At feasible parameters, define

$$
\begin{aligned}
\mathcal D_K&=\{c:c_J\le c\le\bar c,\quad c<h,\quad
\lambda Jc/u(c)<A\},\\
q(c)&=J/u(c),\\
\alpha_*(c)&=\min\{A,q(c)L(c)\}.
\end{aligned}
$$

Then the exact all-finite-memory minimum in the class allowing reducible stationary laws is

$$
\boxed{\Sigma_{*,A,K}(J,C_X)=
\min_{c\in\mathcal D_K}
2\lambda q(c)c\left[
\operatorname{atanh}c+
\operatorname{atanh}\frac{\lambda q(c)c}{\alpha_*(c)}
\right].}
\tag{20m.1}
$$

A mixture of an idle label and a single binary active mode suffices. When $q=1$ the minimum is attained by an irreducible two-state memory. When $q<1$, a reducible three-state law attains it; the irreducible optimum is an unattained infimum, approached by irreducible three-state memories with unchanged information moments and both kinetic caps respected.

The cap-only explicit formula of Theorem 20j is also the simultaneous-cap optimum whenever

$$
A\ge L(c_J).
\tag{20m.3}
$$

For $0<r<1$, at the maximally compressed boundary $C_X=f(c_J)$, the exact answer is the binary value

$$
2\lambda c_J\left[\operatorname{atanh}c_J+
\operatorname{atanh}\frac{\lambda c_J}{\min\{A,L(c_J)\}}\right],
\tag{20m.4}
$$

provided $\lambda c_J<\min\{A,L(c_J)\}$.

At $r=1$, $u=f$ and compression is only the feasibility condition $C_X\ge J$; use the general scalar minimization above without forcing a binary law. The following finite-dimensional support argument proves the all-memory lower bound.

Put $F(c,a)=2\lambda c[\operatorname{atanh}c+\operatorname{atanh}(\lambda c/a)]$ for $0<c<h$ and $\lambda c<a\le L(c)$, and use the idle point $F(0,0)=0$.

#### Posterior reduction and finite-cost feasibility

For a memory label, write

$$
p(x,m)=\frac{w_m}{2}[1+(-1)^x c_m],\qquad c=|c_m|.
$$

The joint state with the minority source value has outgoing memory divergence

$$
d_m=\lambda w_m c,
$$

and mass $p_{\rm min}=w_m(1-c)/2$. The majority state has the opposite divergence. After the cap-preserving shortcut proved in Theorem 20j, every surviving memory edge is counted exactly once by its positive-divergence/minority endpoint. At that endpoint let outgoing and incoming fluxes be $O_m,I_m$, and write its incident edge traffic as

$$
t_m=O_m+I_m=w_m a_m.
$$

Stationarity and finite cost give

$$
\lambda c<a_m\le K(1-c)-\lambda c=L(c).
\tag{20m.5}
$$

This already entails $c<h$. Log-sum over the incident edges gives the memory entropy-production bound

$$
\Sigma_M\ge\sum_m d_m\log\frac{O_m}{I_m}
=\sum_m2\lambda w_m c\operatorname{atanh}\frac{\lambda c}{a_m}.
\tag{20m.6}
$$

There is no factor $1/2$: after the shortcut, each edge belongs to exactly one positive-divergence node. The sum of the $t_m$ is precisely the total memory activity, since each edge is counted once. The compulsory source contribution is $2\lambda\mathbb E[c\operatorname{atanh}c]$.

Define

$$
F(c,a)=2\lambda c\left[\operatorname{atanh}c+
\operatorname{atanh}(\lambda c/a)\right],
\quad \lambda c<a\le L(c),\quad0<c<h,
$$

with the idle point $F(0,0)=0$. Every finite memory therefore has a comparison law $\mu$ of $(c,a)$ for which

$$
\Sigma\ge\int F\,d\mu,\qquad
\int u(c)d\mu=J,\quad
\int f(c)d\mu\le C_X,\quad
\int a\,d\mu\le A.
\tag{20m.7}
$$

Conversely, any finitely supported such law is realized by disconnected binary memory modes: an atom of weight $q$ and positive magnitude $c$ has two labels of weights $q/2$, posterior biases $\pm c$, and rates

$$
k_{\rm fast}=\frac{a+\lambda c}{1-c},\qquad
k_{\rm slow}=\frac{a-\lambda c}{1+c}.
\tag{20m.8}
$$

Both are positive; the first is at most $K$ by (20m.5), and the second is smaller. This mode has activity $qa$ and total entropy production $qF(c,a)$. An atom at zero is an idle label. Hence (20m.7) is an exact variational reduction, not merely a lower bound.

A general, useful existence argument is to compactify the domain to

$$
0\le c\le h,\qquad \lambda c\le a\le L(c),
$$

put $F=+\infty$ at the positive-bias singular boundaries, and put $F(0,a)=0$. The extended cost is nonnegative and lower semicontinuous. Probability measures on this compact domain are weakly compact, and the moment constraints are closed. A feasible finite-cost minimum therefore exists. A zero-bias atom's unnecessary activity can be replaced by $a=0$. An extreme optimal measure has at most four atoms: normalization plus the three constrained continuous moments $(u,f,a)$ give at most four independent equalities. More explicitly, five disjoint positive-mass support pieces permit a nonzero signed perturbation preserving all four moments, contradicting extremality. The sharper result in the optimal-support proof below reduces this to two atoms, one of which may be idle.

##### Feasibility

The strict posterior bound $c<h$ follows directly from (20m.5). Static information-coordinate convexity gives $C_X\ge f(c_J)$, and $J<u(h)$ follows by averaging $u(c)$.

For completeness, every feasible posterior law satisfies

$$
\mathbb E c\ge Jd/u(d),\qquad d=\min(h,\bar c).
$$

If $d=h$, this follows because $u(c)/c$ increases. If $d=\bar c<h$, define

$$
\zeta_0=\frac{d u'(d)-u(d)}{u(d)f'(d)-f(d)u'(d)}>0,
\qquad \alpha_0=\frac{d+\zeta_0 f(d)}{u(d)}.
$$

Then $H(c)=c+\zeta_0 f(c)-\alpha_0u(c)$ has $H(0)=H(d)=H'(d)=0$, $H'(0)=1$, and $H''/u''=\zeta_0 f''/u''-\alpha_0$ strictly increasing. Therefore $d$ is its unique positive local minimum and $H(c)\ge0$. Averaging gives $\mathbb E c\ge\alpha_0J-\zeta_0 C_X=Jd/u(d)$. Positivity of the denominator follows from strict increase of $f/u$ for $r<1$. At $r=1$ compression is redundant and only the first case is needed.

Finite entropy production makes total activity strictly larger than the necessary transported current $\lambda\mathbb E c$ whenever $J>0$. This proves the last strict condition in (20m.2).

Conversely, choose $c\le\bar c$, $c<h$, $c\ge c_J$ with $\lambda Jc/u(c)<A$: take $c=d$ if $d<h$, or take $c<h$ sufficiently close to $h$ if $d=h$. Set $q=J/u(c)$. Because $c<h$, there exists per-mode activity

$$
\lambda c<a\le L(c),\qquad qa<A.
$$

The binary-mode-plus-idle construction (20m.8) then satisfies every constraint at finite cost. This proves (20m.2), without assuming the later entropy-production support theorem.

#### Exact optimal posterior support

We now prove the exact support statement in the displayed scalar frontier.

##### Moment multipliers and boundary cases

First suppose $0<r<1$, $C_X>C_{\min}$, and the strict finite-cost feasibility conditions (20m.2) hold. There exists a feasible law with both $\int f<C_X$ and $\int a<A$: in the ternary feasibility construction below, choose its positive magnitude strictly below both $h$ and $\bar c$, sufficiently close to the feasible endpoint that $\lambda Jc/u(c)<A$, then choose positive traffic strictly between the required current and both caps. Here $c$ can be chosen strictly above $c_J$ because $C_X>C_{\min}$ and $J<u(h)$ imply $\min(h,\bar c)>c_J$.

Fix such an interior magnitude and activity with $q<1$, $qf(c)<C_X$, and $qa<A$. For nearby prediction values $j$, take $q(j)=j/u(c)$; these strict inequalities persist for nearby $(j,C_X,A)$. Thus the optimal value is finite on an open neighborhood, as required below.

The exact convex measure problem (20m.7) therefore has finite nonnegative multipliers $\eta,\nu$ for compression and activity, and a real multiplier $\zeta$ for fixed prediction. This follows from finite-dimensional separation of the convex achievable moment/cost epigraph; the stated strict feasibility excludes abnormal separators. More explicitly, the optimal value $V(j,C_X,A)$ is a finite convex function on an open neighborhood of $(J,C_X,A)$ within the nontrivial feasible region and has a supporting subgradient $(\zeta,-\eta,-\nu)$, with $\eta,\nu\ge0$ by budget monotonicity. Applying its global supporting inequality to each deterministic atom gives $F(c,a)+\eta f(c)+\nu a-\zeta u(c)\ge V(J,C_X,A)-\zeta J+\eta C_X+\nu A$. Integrating against an optimal measure forces equality and the usual complementary slackness. Thus every optimal measure is supported on the global minima of

$$
F(c,a)+\eta f(c)+\nu a-\zeta u(c).
\tag{20m.9}
$$

When $0<r<1$ and $C_X=C_{\min}$, strict information-coordinate convexity of $f\circ u^{-1}$ forces $c=c_J$ directly, and Jensen in the convex activity dependence of $F(c_J,a)$ gives (20m.4). At $r=1$, discard the redundant compression constraint and use the same separation for the activity constraint. These cases do not require a compression multiplier.

##### Elimination of the activity coordinate

For $\nu>0$, minimization over $a$ gives

$$
a_\nu(c)=\min\left\{L(c),\lambda c\sqrt{1+2/\nu}\right\}.
\tag{20m.10}
$$

Write $s_\nu=\sqrt{\nu/(\nu+2)}\in(0,1)$ and

$$
b_\nu=\frac{K}{K+\lambda+\lambda/s_\nu}<h.
$$

The minimized function

$$
\phi_\nu(c)=\min_a[F(c,a)+\nu a]
$$

is continuously differentiable and has two pieces:

$$
\phi_\nu(c)=
\begin{cases}
2\lambda c\operatorname{atanh}c+
\left[2\lambda\operatorname{atanh}s_\nu+\nu\lambda/s_\nu\right]c,
&0\le c\le b_\nu,\\
\psi_K(c)+\nu L(c),&b_\nu\le c<h.
\end{cases}
\tag{20m.11}
$$

At $c=0$, define $\phi_\nu(0)=0$ by the idle choice. For $\nu=0$, $\phi_0=\psi_K$.

The ratio $\phi_\nu''/u''$ is strictly increasing on each smooth piece. On the first piece this follows from

$$
\frac{(2\lambda c\operatorname{atanh}c)''}{u''(c)}
=\frac{4\lambda(1-r^2c^2)}{r^2(1-c^2)^2},
$$

whose derivative is positive for $c>0$. On the second it follows from the strict-convexity coefficient test in Theorem 20j, since $L$ is affine. At the join the second derivative jumps **upward**: the additional hard-cap memory part

$$
m(c)=\lambda c\log\frac{1-c}{1-c/h}
$$

has

$$
m''(c)=\lambda\left[
\frac{b(2-bc)}{(1-bc)^2}-\frac{2-c}{(1-c)^2}
\right]>0,\qquad b=1/h>1.
\tag{20m.12}
$$

Positivity follows because $\partial_b[b(2-bc)/(1-bc)^2]=2/(1-bc)^3>0$ for $bc<1$. Thus the ratio is strictly increasing across the join as well.

Adding $\eta f$ preserves this property, because

$$
\frac{f''(c)}{u''(c)}
=\frac{1-r^2c^2}{r^2(1-c^2)}
$$

is nondecreasing for $r\le1$ and strictly increasing when $r<1$.

##### One positive contact

Put $G(c)=\phi_\nu(c)+\eta f(c)-\zeta u(c)$. The sign of $G''$ changes at most once, from negative to positive, because

$$
\frac{G''}{u''}
=\frac{\phi_\nu''+\eta f''}{u''}-\zeta
$$

is strictly increasing (allowing its single upward jump). Hence $G'$ first decreases and then increases, with either phase possibly absent. Such a function $G$ has at most one positive interior local minimum. As $c\uparrow h$, its value diverges, so there is no competing right-endpoint minimum.

For $\nu>0$, $G'(0+)=2\lambda\operatorname{atanh}s_\nu+\nu\lambda/s_\nu>0$, so zero can also be a minimum. For $\nu=0$, $G'(0)=0$, and the same one-positive-minimum statement holds. Therefore the contact set supporting an optimal measure consists of at most the idle point $c=0$ and one positive magnitude $c$.

At a positive magnitude the activity minimizer is unique. The optimal law is consequently

$$
\mu=(1-q)\delta_{(0,0)}+q\delta_{(c,a)},\qquad
q=J/u(c).
$$

The information cap gives $c\le\bar c$, normalization gives $c\ge c_J$, and the hard cap gives $a\le L(c)$. At fixed $c$ its cost decreases strictly with activity, so

$$
a=\min\{A/q,L(c)\},\qquad qa=\alpha_*(c).
$$

This proves (20m.1). The scalar minimum exists: costs diverge at $c\uparrow h$ and at an activity-current boundary, while all other endpoints are closed. The support argument also implies uniqueness of the positive optimal magnitude: if two different magnitudes were optimal, mixing their optimal laws would be optimal yet would have two positive support points, contradicting the common optimal-dual contact property.

#### Attainment and irreducible approximation

Use the ternary stationary law

$$
\Pr(c_M=0)=1-q,\qquad
\Pr(c_M=+c)=\Pr(c_M=-c)=q/2.
$$

The active rates are (20m.8) with $a=\alpha_*/q$. An isolated idle memory label has its source flipping at $\lambda$ and no memory jumps. This realizes the exact law and optimum. If $q=1$, the active two-state joint process is irreducible.

When $q<1$, reduce the active traffic by an arbitrarily small positive amount. This preserves the posterior law and creates slack in the mean-activity and every active exit bound. Add still smaller balanced-flux bridges from idle to one active label in each source layer. Each bridge has zero stationary net current and zero entropy production; its outgoing rates can be made smaller than the created slack (and the positive idle cap slack). The joint law and both information moments remain exactly fixed. The full joint process is irreducible and its cost converges to (20m.1). No uniform mixing-time claim follows.

Nonattainment when $q<1$ follows from complementary slackness. Such an optimal law requires $\nu>0$: if $\nu=0$, the strictly convex information-coordinate function $(\psi_K+\eta f)\circ u^{-1}$ excludes an optimal mixture of zero and a positive magnitude. Consequently an optimal reduced law must use the full activity $A$. An occupied zero-bias memory label has zero memory divergence in both source layers. In an irreducible realization it must have some incident memory traffic; that traffic is either balanced and deleted by the shortcut procedure, or belongs to a removable cycle or a path of length at least two. The shortcut procedure therefore strictly decreases total activity. If the original irreducible chain attained the global optimum, its reduced law would also be optimal but have activity strictly below $A$, contradicting $\nu>0$ complementary slackness. Thus no irreducible finite memory attains the optimum with $q<1$.

#### Global low-information slope with both budgets

The strict simultaneous-cap feasibility conditions are those proved in Theorem 20m. Retain $h_K=K/(K+2\lambda)$.

<a id="lemma-20m1-global-binary-low-information-slope"></a>**Lemma 20m.1 (Global Binary Low-Information Slope).**

For fixed $\lambda,K,A,C_X>0$ and $0<r\le1$, let $\Sigma_{*,K}(J)$ denote the all-finite-memory infimum under these four constraints. Then, with or without an irreducibility requirement,

$$\boxed{\lim_{J\downarrow0}\frac{\Sigma_{*,K}(J)}J=\frac{4\lambda}{r^2}\left(1+\frac\lambda K\right).}\tag{20m.13}$$

**Proof of the global lower bound.** The general node bound simplifies in this binary source to

$$\Sigma\ge\lambda\mathbb E v(c),\qquad v(c)=c[\operatorname{atanh}(c/h_K)+\operatorname{atanh}c],\quad c<h_K.$$

The positive even-power coefficients satisfy

$$\frac{[c^{2n}]v(c)}{[c^{2n}]u(c)}=\frac{2n[1+h_K^{-(2n-1)}]}{r^{2n}}.$$

They strictly increase with $n\ge1$, and their first value is $4(1+\lambda/K)/r^2$. Thus every finite-cost positive-information design has $\Sigma/J>4\lambda(1+\lambda/K)/r^2$, giving the corresponding non-strict bound on its infimum.

**Sharpness.** Choose fixed $0<q<\min(1,A/K)$ and solve $J=qu(c)$ for small $J$. Give the active block traffic

$$a_0=q[K(1-c)-\lambda c].$$

Its fast rate equals $K$, and its slow rate is positive and below $K$ for small $c$. It obeys $a_0<A$, and $qf(c)\to0$ meets the fixed retention cap. Direct expansion of Theorem 20m's binary active-mode cost, using $a_0$ instead of $A$, gives

$$\Sigma=2\lambda q(1+\lambda/K)c^2+O(qc^3),\qquad J=qr^2c^2/2+O(qc^4).$$

Their ratio gives (20m.13). If irreducibility is required, make arbitrarily small rate slack and add balanced idle bridges; for each fixed $J$, their excess cost may be made arbitrarily small. $\square$

Here $a=2\lambda$ and $r=e^{-a\tau}$, so the coefficient equals that of Theorem 20f. Its global validity for the symmetric binary source requires the displayed all-amplitude posterior inequality; the general-source eigenmode argument alone cannot supply it. Fixed positive $A,C_X$ are essential to the statement: a budget shrinking with $J$, particularly the exact minimum-retention boundary, requires a separate analysis.

<a id="corollary-20m2-activation-with-simultaneous-kinetic-caps"></a>**Corollary 20m.2 (Activation with Simultaneous Kinetic Caps).** Restore arbitrary fixed $A>0,C_X>0$, and optimize $k_BT\Sigma-wJ$ over the complete Theorem 20m class. The activation threshold remains exactly $w_c=k_BT\alpha,\quad\alpha=4\lambda(1+\lambda/K)/r^2$: at $w\le w_c$, every positive-information device has strictly larger objective than the zero-information value; at $w>w_c$, some admissible positive-information device has strictly negative objective. In the class permitting reducible stationary memories a global optimum exists and is active above threshold. In the irreducible class the corresponding infimum may be unattained. The unique-score and coefficient claims of Theorem 20k(c) are not asserted for an activity-limited optimizer.

**Proof.** Theorem 20j gives $\Sigma\ge\Phi(J)>\alpha J$ for every $J>0$, since a strictly convex function lies strictly above its tangent at zero. This proves the subthreshold statement. Lemma 20m.1 gives, for fixed positive $A,C_X$, admissible designs with $\Sigma/J\to\alpha$ as $J\downarrow0$, including irreducible approximants. For any $w/(k_BT)>\alpha$, a sufficiently small such design has negative objective.

For existence in the reducible class, use Theorem 20m's compactified mode domain $0\le b\le h$, $\lambda b\le\alpha_m\le L(b)$, with its lower-semicontinuous extended cost, infinite at positive-bias singular boundaries and zero at $b=0$. The probability-measure feasible set with the closed retained-information and activity inequalities is compact. The objective is a lower-semicontinuous cost integral minus the integral of bounded continuous $wu(b)$; it attains its infimum, which is finite because the idle mode is feasible. Its attained moments $J,R_X,A_m$ admit a finite-atom optimum by the moment reduction in Theorem 20m, hence a finite-memory realization. Above threshold the value is negative, forcing $J>0$. If irreducibility excludes an optimal idle/active decomposition, Theorem 20m's irreducibility proof gives the matching infimum and explains its nonattainment. ∎

<a id="theorem-20n-exact-mean-activity-compression-frontier"></a>**Theorem 20n (Exact Mean-Activity Compression Frontier).**

This section specializes the source to $X\in\{0,1\}$ with flips at rate $\lambda>0$, so $\pi=(1/2,1/2)$, $a=2\lambda$, and $r=e^{-2\lambda\tau}$. It imposes finite average memory activity $A>0$ but no hard rate cap unless stated. In the theorem assume $0<r<1$ and $0<J<f(r)$, where

$$f(c)=\frac{(1+c)\log(1+c)+(1-c)\log(1-c)}2,\quad u(c)=f(rc),\quad g(c)=c\operatorname{atanh}c.$$

Use $f(1)=\log2$, $u(1)=f(r)$, and $g(1)=+\infty$. Let $k=\lambda/A$, and define

$$B(s)=s\operatorname{atanh}(ks)\quad(ks<1),\qquad B(s)=+\infty\quad(ks\ge1).$$

A signed posterior bias $c_m=\rho_m(0)-\rho_m(1)$ satisfies $|c_m|<1$ and $\sum_mw_mc_m=0$. In what follows $c=|c_M|$ denotes its absolute magnitude, and expectations are with respect to its probability law. Definition 20d's posterior identities becomes

$$R_X=\mathbb E f(c),\qquad J=\mathbb E u(c),\qquad \Sigma_X=2\lambda\mathbb E g(c).\tag{20n.1}$$

#### Sharp current/activity lower bound

Every allowed binary-source memory obeys

$$\boxed{\Sigma\ge2\lambda\{\mathbb E g(c)+B(\mathbb E c)\}.}\tag{20n.2}$$

For $J>0$, finite cost requires $\lambda\mathbb E c<A$.

**Proof.** At memory label $m$ the source-current divergence in each source layer has magnitude $\lambda w_m|c_m|$. For a graph flow, the sum of absolute edge currents is at least half the $\ell^1$ norm of its node divergences: each edge contributes its magnitude at both endpoints, and the triangle inequality proves the claim. Summing both source layers therefore gives

$$L_M:=\sum_{e\in\mathrm{memory}}|j_e|\ge\lambda\mathbb E c.$$

If $a_e$ is the sum of the forward and reverse stationary fluxes on an edge, its cost is $2|j_e|\operatorname{atanh}(|j_e|/a_e)$. Convexity of $z\operatorname{atanh}z$ and weights $a_e/A_{\rm act}$ give

$$\Sigma_M\ge2L_M\operatorname{atanh}(L_M/A_{\rm act})\ge2\lambda\mathbb E c\operatorname{atanh}(\lambda\mathbb E c/A).$$

The last step uses monotonic increase in current and decrease in traffic. A finite nonzero current requires positive reverse flux, hence $L_M<A_{\rm act}\le A$. Combine with (20n.1). $\square$

This current/activity artanh inequality is an established kinetic ingredient; compare Dechant (2021, Eq. (38)). The source-induced conditional-layer divergence and its subsequent posterior optimization are the specific uses here.

#### Exact scalar frontier

Set

$$c_J=u^{-1}(J),\qquad C_{\min}=f(c_J),\qquad C_{\rm end}=\frac{J\log2}{f(r)}.$$

If $C_X<C_{\min}$, no information-feasible memory exists. If $C_X\ge C_{\min}$, define

$$\bar c=\begin{cases}
1,&C_X\ge C_{\rm end},\\
\text{the unique }c\in[c_J,1)\text{ with }Jf(c)/u(c)=C_X,&C_{\min}\le C_X<C_{\rm end}.
\end{cases}$$

Finite-cost feasibility is equivalent to

$$\boxed{\lambda\frac{J\bar c}{u(\bar c)}<A.}\tag{20n.3}$$

The endpoint expression at $\bar c=1$ means $\lambda J/f(r)$, and the inequality is strict. When feasible, the exact entropy-production infimum is

$$\boxed{\Sigma_*(J,C_X)=2\lambda\min_{c\in\mathcal D}\left[\frac{Jg(c)}{u(c)}+B\!\left(\frac{Jc}{u(c)}\right)\right],}\tag{20n.4}$$

$$\mathcal D=\{c:c_J\le c\le\bar c,\ c<1,\ \lambda Jc/u(c)<A\}.$$

The scalar minimizer $c_*$ exists and is unique. If $c_{\rm free}$ denotes the unique minimizer without the retention cap, then

$$c_* =\min(c_{\rm free},\bar c),\qquad q_* = J/u(c_*).\tag{20n.5}$$

The optimal signed posterior law has probabilities $1-q_*,q_*/2,q_*/2$ at $0,+c_*,-c_*$, respectively. If $q_*=1$, a two-state irreducible memory attains the minimum. If $q_*<1$, a three-state reducible stationary mixture attains it; the same value is an unattained infimum among irreducible finite memories and is approached by irreducible three-state memories at exactly the same $J,R_X,A$.

**Proof, part 1: information geometry.** The derivatives satisfy

$$f''(c)=\frac1{1-c^2},\quad u''(c)=\frac{r^2}{1-r^2c^2},\quad \frac{f''(c)}{u''(c)}=\frac{1-r^2c^2}{r^2(1-c^2)}.$$

The last ratio is strictly increasing. Since $f'(0)=u'(0)=0$, $f'/u'$ is its weighted average with weight $u''$ and is strictly increasing. Therefore $F(y)=f(u^{-1}(y))$ is strictly convex. Jensen gives

$$R_X\ge F(J)=C_{\min},\tag{20n.6}$$

with equality only if $c=c_J$ almost surely. Applying the same averaging argument once more, using $f(0)=u(0)=0$, shows that $\rho(c)=f(c)/u(c)$ is strictly increasing, from $r^{-2}$ at zero to $\log2/f(r)$ at one. This proves the definition of $\bar c$. It also proves $R_X<C_{\rm end}$ for every finite-cost positive-information memory, since $c<1$. Thus $C_{\rm end}$ is the supremal static current-information value at fixed $J$, not another lower feasibility requirement.

**Proof of the frontier and feasibility from the finite-cap theorem.** Every finite-state finite-rate memory has some finite maximum memory exit rate. Thus the class without a specified hard cap is the union of the classes with cap $K$, and its infimum is the decreasing limit of their infima as $K\to\infty$. For each fixed $c<1$, $h_K\to1$ and $L(c)=K-(K+\lambda)c\to\infty$. The optimal active traffic in Theorem 20m therefore becomes $A$, and its exact scalar objective becomes (20n.4).

More directly, Theorem 20m bounds every finite-rate design below by (20n.4), because its cap-restricted scalar domain is smaller and its allowed active traffic never exceeds $A$. Conversely, every $c$ in $\mathcal D$ has the explicit finite-rate realization (20n.10), which satisfies some finite $K$, so the lower bound is sharp. The tangent-certificate mean-magnitude inequality proved in Theorem 20m's feasibility proof, or its endpoint limit as $h_K\uparrow1$, gives
$$\mathbb E c\ge J\bar c/u(\bar c).\tag{20n.8}$$
Together with the strict transport requirement in the current/activity bound above, this proves necessity of (20n.3). For sufficiency use $c=\bar c$ if $\bar c<1$, or choose $c<1$ close enough to one if $\bar c=1$; strict feasibility gives finite positive rates. The globally optimal support follows from Theorem 20m and these realizing modes.

**Scalar uniqueness and exact clipping.** Set

$$s(c)=\frac{Jc}{u(c)},\quad V(c)=cu'(c)-u(c)>0,\quad T(c)=\frac{Jg(c)}{u(c)}+B(s(c)),$$

$$D(c)=\frac{g'(c)u(c)-g(c)u'(c)}{V(c)},\qquad\phi(z)=\operatorname{atanh}z+\frac{z}{1-z^2}.$$

Direct differentiation gives

$$T'(c)=\frac{JV(c)}{u(c)^2}\,[D(c)-\phi(ks(c))].\tag{20n.9}$$

The bracket is strictly increasing. Indeed $s'(c)=-JV(c)/u(c)^2<0$, and $\phi$ is strictly increasing. Also

$$D'(c)=\frac{u(c)}{V(c)^2}\left[g''(c)V(c)-u''(c)(cg'(c)-g(c))\right]>0,$$

because $V(c)=\int_0^c t u''(t)dt$, $cg'(c)-g(c)=\int_0^c t g''(t)dt$, and $g''/u''=2(1-r^2c^2)/[r^2(1-c^2)^2]$ is strictly increasing. Their weighted-average ratio is strictly below its endpoint value. As $c\uparrow1$, $D(c)\to\infty$ and $T(c)\to\infty$. At an activity boundary $ks(c)\uparrow1$, $\phi$ and $T$ diverge. Therefore the unconstrained feasible scalar problem has a unique minimum. It is at $c_J$ precisely if $\lambda c_J<A$ and $D(c_J)\ge\phi(\lambda c_J/A)$; otherwise it is the unique root of the bracket in (20n.9). The objective strictly decreases before that point and strictly increases after it. Restricting it by $c\le\bar c$ gives exactly (20n.5). This also proves existence in every strictly feasible case.

**Explicit realization and attainment.** For any $c\in\mathcal D$, put $q=J/u(c)$ and take labels $0,+,-$ with stationary probabilities

$$p_{0,0}=p_{1,0}=\frac{1-q}{2},\quad p_{0,+}=p_{1,-}=\frac{q(1+c)}4,\quad p_{0,-}=p_{1,+}=\frac{q(1-c)}4.$$

Omit label zero when $q=1$. In source layer zero send net current from $-$ to $+$, and reverse it in source layer one. In each layer give the active edge forward and reverse stationary fluxes

$$\frac{A+\lambda qc}{4},\qquad\frac{A-\lambda qc}{4}.$$

In layer zero the corresponding rates are

$$k^0_{-,+}=\frac{A+\lambda qc}{q(1-c)},\qquad k^0_{+,-}=\frac{A-\lambda qc}{q(1+c)},\tag{20n.10}$$

and the layer-one rates are reflected. These positive finite currents cancel the source divergence; total memory activity is exactly $A$. Both the transport and current/activity inequalities are equalities, and

$$\Sigma=2\lambda qc\left[\operatorname{atanh}c+\operatorname{atanh}(\lambda qc/A)\right],\tag{20n.11}$$

which is (20n.4).

If $q<1$, choose $0<\varepsilon<A-\lambda qc$, replace $A$ by $A-\varepsilon$ in active-edge traffic, and add one idle-to-active bridge in each source layer with equal flux $\varepsilon/4$ in each direction. The bridges contribute total activity $\varepsilon$, zero current, and zero edge cost. They preserve the exact stationary law and both information moments and make the joint chain irreducible. The resulting cost is

$$\Sigma_\varepsilon=2\lambda qc\left[\operatorname{atanh}c+\operatorname{atanh}\!\left(\frac{\lambda qc}{A-\varepsilon}\right)\right]\downarrow\Sigma.\tag{20n.12}$$

When $q=1$, the binary construction is irreducible. For $q<1$, irreducible nonattainment also follows from Theorem 20m's irreducible-attainment proof: any alleged attaining finite design has a finite exit cap, while the attaining ternary scalar design also has a finite cap. At a cap larger than both, the capped and uncapped minima coincide, and Theorem 20m's nonattainment argument applies. The weak-bridge family above approaches the value. $\square$

#### Boundary and resource cases

1. At the minimum information budget, the exact attained value is
   $$\Sigma_*(J,C_{\min})=2\lambda c_J[\operatorname{atanh}c_J+\operatorname{atanh}(\lambda c_J/A)]$$
   when $\lambda c_J<A$, and is infeasible otherwise. Every possible memory alphabet obeys this conclusion.
2. Let $C_{\rm free}=Jf(c_{\rm free})/u(c_{\rm free})$. If $c_{\rm free}>c_J$, the finite-cost frontier strictly decreases with $C_X$ until $C_{\rm free}$ and is constant thereafter. Relaxing source-information compression can therefore lower optimal cost.
3. Without compression the exact finite-cost positive-information range is
   $$0<J<f(r)\min(1,A/\lambda).$$
   The upper endpoint is a supremum and is not attained at finite cost.
4. If $J=0$, an independent one-label memory realizes zero cost. At $r=1$ one has $R_X=J$ identically: $C_X<J$ is infeasible, while $C_X\ge J$ leaves the uncapped scalar problem, with $u=f$ and no compression clipping. Equality $C_X=J$ does not force a binary law. At $r=0$ positive predictive information is impossible. If $A=0$, stationarity and the irreducible source force every occupied posterior to equal $\pi$, so only $J=0$ is possible.
5. A mean-activity cap does not cap peak rates; (20n.10) can scale as $A/q$. The irreducible limit in (20n.12) at fixed $0<q<1$ has vanishing intercomponent bridges and does not provide a uniform mixing-time theorem.
6. For the three-label realization $H(M)=h(q)+q\log2$, which need not decrease with source-information compression. No minimization of memory entropy, code length, or physical complexity follows.

<a id="theorem-20o-four-resource-bayes-prediction-and-physical-work-frontiers"></a>**Theorem 20o (Four-Resource Bayes Prediction and Physical Work Frontiers).**

All rates below are measured per unit **local proper time**. Let the autonomous symmetric binary source flip at rate $\lambda>0$; let $K>0$ bound every total conditional memory exit rate; let $A>0$ bound mean memory activity; and let $C_X\ge0$ bound $I(M;X)$, measured in nats. Taking $A\ge K$ makes the mean-activity bound redundant. A forecast duration $\theta\ge0$ is a proper-time interval. The admissible devices are stationary finite bipartite Markov memories with unrestricted memory topology, as in Theorem 20m. A fixed physical topology, a nonstationary initial preparation, or a transient-response requirement is an additional restriction.

Write
$$
f(b)=\tfrac12[(1+b)\log(1+b)+(1-b)\log(1-b)],\quad
h=\frac K{K+2\lambda},\quad L(b)=K-(K+\lambda)b,
$$
$$
F(b,\alpha)=2\lambda b\left[\operatorname{atanh}b+
\operatorname{atanh}\frac{\lambda b}{\alpha}\right],\qquad
\Psi_{A,K}(b)=F\bigl(b,\min\{A,L(b)\}\bigr),
\tag{20o.1}
$$
on $0<b<d:=\min\{h,A/\lambda\}$, with $\Psi_{A,K}(0)=0$. For a memory let $b=\mathbb E|\mathbb E[(-1)^X\mid M]|$. The traffic-dependent cost $F(c,a)$ from Theorem 20m gives the exact Bayes-output bound proved below; its least retained information is $f(b)$. In the hard-exit-only class,
$$
\psi_K(b)=F(b,L(b))=\lambda b\log\frac{1+b}{1-b/h}.
\tag{20o.2}
$$
No information quantity is silently converted into a power: the physical statements use the single-bath, local-detailed-balance, complete modeled-work accounting of Proposition 20h, namely $P_{\rm modeled}=k_BT\Sigma$, at $T>0$. This is a **net modeled supplied-power** identity. Hardware overhead, initialization, source generation beyond the modeled driving, clocks, readout and additional reservoirs must be entered separately if included in the experimental boundary.

For completeness, the exact posterior-mean lower bound is
$$
\Sigma\ge F(b,\min\{A,L(b)\})=\Psi_{A,K}(b),\qquad R_X\ge f(b).
\tag{20o.B}
$$
Indeed the source term $2\lambda c\operatorname{atanh}c$ is strictly convex in $c$. The memory term is the convex perspective $a\vartheta(c/a)$, where $\vartheta(z)=2\lambda z\operatorname{atanh}(\lambda z)$ is strictly convex. Thus $F$ is jointly convex. Theorem 20m's posterior reduction gives $\Sigma\ge\mathbb EF(c,a)\ge F(b,\mathbb Ea)$; its traffic mean is at most both $A$ and $L(b)$ because $L$ is affine, and $F$ decreases in its traffic argument. Jensen gives $R_X\ge f(b)$. The constant-magnitude binary construction attains both bounds, with traffic $\min\{A,L(b)\}$ whenever $b<h$ and $A>\lambda b$. This proves the Bayes statement independently of the distinct fixed-mutual-information scalar optimizer.

#### The exact resource curve

**Resource-curve and switch statement.** The function $\Psi_{A,K}$ is continuous, strictly increasing and strictly convex on $[0,d)$, and tends to $+\infty$ as $b\uparrow d$. Consequently it has a unique continuous increasing inverse $[0,\infty)\to[0,d)$. Its branches are:

1. If $A\ge K$, then $\Psi_{A,K}=\psi_K$ everywhere.
2. If $A\le\lambda h$, then $\Psi_{A,K}=F(\cdot,A)$ everywhere in its open domain.
3. If $\lambda h<A<K$, it is activity-controlled for $b<b_t$, exit-controlled for $b>b_t$, and continuous at
$$
b_t=\frac{K-A}{K+\lambda}\in(0,h).
\tag{20o.3}
$$
At this switch the first derivative jumps upward.

**Proof.** For fixed $\alpha>\lambda b$, $F$ strictly increases in $b>0$ and
$$
F_\alpha=-\frac{2\lambda^2b^2}{\alpha^2-\lambda^2b^2}<0.
$$
The fixed-activity function is strictly convex: its source term is strictly convex, while its memory term is the convex perspective used in (20o.B). The exit-controlled function $\psi_K$ is strictly convex directly in $b$, for example by its positive power-series coefficients of degree at least two. On the common domain,
$$
\Psi_{A,K}(b)=\max\{F(b,A),\psi_K(b)\}.
$$
The maximum of two strictly convex functions on an interval is strictly convex: apply strict convexity to whichever function attains the maximum at an interior convex combination, then bound its two endpoint values by the corresponding maxima. Both functions increase strictly and are continuous, proving the same properties for their maximum. The branch classification follows by comparing $A$ with the decreasing affine function $L$. At an interior switch the right derivative is $F_b-(K+\lambda)F_\alpha$, strictly greater than the left derivative $F_b$.

If $d=A/\lambda<h$, then $\lambda b/A\uparrow1$, forcing divergence. If $d=h$ and $A>\lambda h$, the exit branch is active near $h$, and $1-b/h\downarrow0$. At the tie $A=\lambda h$, the activity branch is active for every $b<h$ and again diverges. Continuity at zero follows from the elementary expansions. These facts prove the inverse statement. ∎

#### Accuracy and forecast horizon

**Bayes frontier.** Fix finite $P\ge0$, $T>0$, and the registered parameters above. Put
$$
b_P=\Psi_{A,K}^{-1}\!\left(\frac P{k_BT}\right),\quad
b_C=f^{-1}(\min\{C_X,\log2\}),\quad b_{\rm eff}=\min\{b_P,b_C\}.
\tag{20o.4}
$$
The exact largest stationary Bayes accuracy for predicting the source at horizon $\theta$, under all four constraints, is
$$
\boxed{p_{\max}(\theta;P,T,A,K,C_X)
=\frac{1+e^{-2\lambda\theta}b_{\rm eff}}2.}
\tag{20o.5}
$$
It is attained by a binary irreducible memory whenever $b_{\rm eff}>0$. At $b_{\rm eff}=0$, a one-label memory attains chance accuracy.

For a required $p_*\in(1/2,1)$, write $s=2p_*-1$. A nonnegative forecast duration is feasible if and only if $b_{\rm eff}\ge s$. In that case the exact attained maximum duration is
$$
\boxed{\theta_{\max}=\frac1{2\lambda}\log\frac{b_{\rm eff}}s.}
\tag{20o.6}
$$
If $b_{\rm eff}<s$, even a zero-horizon prediction fails the specified accuracy. A chance-level target has no finite horizon restriction and is not covered by the logarithm in (20o.6).

**Proof.** The binary-source semigroup gives future posterior bias $e^{-2\lambda\theta}\mathbb E[(-1)^X\mid M]$; hence accuracy is $(1+e^{-2\lambda\theta}b)/2$. Equation (20o.B) gives $\Sigma\ge\Psi_{A,K}(b)$, and Jensen gives $I(M;X)\ge f(b)$. The two budgets force $b\le b_P$ and $b\le b_C$.

For any $0<b<d$, set $\alpha=\min\{A,L(b)\}$, choose two equiprobable memory labels with posterior biases $\pm b$, and use
$$
k_{\rm correct}=\frac{\alpha+\lambda b}{1-b},\qquad
k_{\rm error}=\frac{\alpha-\lambda b}{1+b}.
\tag{20o.7}
$$
Both rates are positive, the first is at most $K$, the second is smaller, and the binary construction has mean activity $\alpha$, retained information $f(b)$, and total entropy production $F(b,\alpha)$. A source-driving-only thermal realization assigns mismatched energy
$$
\Delta E=k_BT\log(k_{\rm correct}/k_{\rm error})
=2k_BT\left[\operatorname{atanh}b+
\operatorname{atanh}(\lambda b/\alpha)\right]
\tag{20o.8}
$$
and zero matched energy; memory edges require zero modeled work and each source flip receives its conditional energy change as work. Its mean supplied power is $\lambda b\Delta E=k_BT\Psi_{A,K}(b)$. Thus $b=b_{\rm eff}$ attains all the bounds simultaneously within the declared modeled class. Solving $e^{-2\lambda\theta}b_{\rm eff}\ge s$ proves the horizon statement. ∎

This is an all-finite-memory result for Bayes classification. It is not obtained by reinterpreting the different fixed-mutual-information optimization of Theorem 20m: idle/active mixtures may improve logarithmic-score cost under both kinetic caps, while constant posterior magnitude is exactly optimal for the Bayes objective.

**Target cost and endpoint asymptotics.** For a fixed target $(p_*,\theta)$, set $b=s e^{2\lambda\theta}$. Its exact modeled minimum power is
$$
P_{\min}(p_*,\theta)=k_BT\Psi_{A,K}(b)
\tag{20o.9}
$$
if $b<d$ and $f(b)\le C_X$; otherwise it is infeasible at finite power. If $s<d$, the kinetic horizon supremum is $\theta_d=(2\lambda)^{-1}\log(d/s)$. Provided the retention cap permits approaching this endpoint, as $\Delta\theta=\theta_d-\theta\downarrow0$,
$$
\Psi_{A,K}(s e^{2\lambda\theta})=
\begin{cases}
\lambda h\log\dfrac{1+h}{2\lambda\Delta\theta}+o(1),
& A>\lambda h,\\[6pt]
\lambda d\log\dfrac{1+d}{(1-d)\lambda\Delta\theta}+o(1),
& A\le\lambda h.
\end{cases}
\tag{20o.10}
$$
At $A=\lambda h$, the second line applies. If $b_C<d$, compression instead supplies the attained finite-power endpoint $(2\lambda)^{-1}\log(b_C/s)$, when $b_C\ge s$, reached once $P\ge k_BT\Psi_{A,K}(b_C)$.

**Proof.** Equation (20o.9) is the Bayes frontier above at equality. In the exit branch, $b=h e^{-2\lambda\Delta\theta}$, so $1-b/h=2\lambda\Delta\theta+O(\Delta\theta^2)$ and $1+b\to1+h$. In the activity branch, $A=\lambda d$ at the endpoint, and
$$
F(b,A)=2\lambda b\operatorname{atanh}b+
\lambda b\log\frac{d+b}{d-b}.
$$
Using $d-b=2\lambda d\Delta\theta+O(\Delta\theta^2)$ gives the second line. The factors $(b-d)\log\Delta\theta$ tend to zero. The branch classification is the resource-curve statement above. The compression endpoint is a regular interior point of the kinetic domain and is therefore attained at finite cost. ∎

For fixed $C_X>0$, the small-power limit is additionally
$$
b_{\rm eff}\sim
\sqrt{\frac{P}{2k_BT\lambda(1+\lambda/\min\{A,K\})}},
\qquad P\downarrow0.
\tag{20o.11}
$$
This follows by expanding (20o.1) at zero; the fixed positive information cap is eventually inactive. Its dependence on $\min\{A,K\}$ differs from the log-score activation slope in Theorem 20k.

#### Temperature and proper acceleration

**Registered temperature contraction.** Hold $\lambda,K,A,P,C_X$ fixed across a family of thermal implementations, with all rates measured in the same proper-time unit. As $T$ increases, $b_P$ strictly decreases for $P>0$, while $b_{\rm eff}$, optimal Bayes accuracy and the feasible maximum horizon are nonincreasing. A retention-limited plateau is possible. At a smooth power-limited point with a feasible target,
$$
\frac{db_P}{dT}=-\frac{\Psi(b_P)}{T\Psi'(b_P)},\qquad
\frac{d\theta_{\max}}{dT}
=-\frac{\Psi(b_P)}{2\lambda T b_P\Psi'(b_P)}<0.
\tag{20o.12}
$$
Monotonicity holds through bottleneck switches without requiring differentiability.

**Proof.** The quantity $P/(k_BT)$ strictly decreases and $\Psi^{-1}$ strictly increases. Taking its minimum with the constant $b_C$ preserves monotonicity. The accuracy and horizon expressions are increasing functions of $b_{\rm eff}$. Implicit differentiation proves (20o.12). ∎

The fixed-rate premise is substantive. Equation (20o.8) generally changes the energy gap with $T$; rates or controls must be retuned to retain the same binary optimizer. This theorem compares the attainable frontiers of registered implementation families. It is not automatically the measured response of unchanged hardware at fixed energy gaps. A temperature sweep of fixed hardware must supply its actual $\lambda(T),K(T),A(T)$, control work and achievable rate laws.

More generally, on a smooth branch with fixed power and differentiable rates,
$$
\frac{db_P}{dT}
=-\frac{\Psi/T+\Psi_\lambda\lambda'
+\Psi_K K'+\Psi_A A'}{\Psi_b},
\tag{20o.13}
$$
where all functions are evaluated at the current $(b_P,\lambda,K,A)$. For a power-limited target,
$$
\frac{d\theta_{\max}}{dT}
=\frac{b_P'}{2\lambda b_P}-\frac{\lambda'}\lambda\theta_{\max},
\qquad
\frac{dp_{\max}(\theta)}{dT}
=\frac{e^{-2\lambda\theta}}2(b_P'-2\theta\lambda'b_P).
\tag{20o.14}
$$
On a retention-limited branch with fixed $C_X$, replace $b_P'$ by zero. Here $\Psi_\lambda>0$, $\Psi_K\le0$, and $\Psi_A\le0$ where the derivatives exist. These signs follow from $F_\lambda>0$, $F_\alpha<0$, $L_\lambda=-b$, and $L_K=1-b>0$. They do not fix the signs in (20o.13)–(20o.14) without the temperature dependence of the physical rates.

For an exact counterexample to an unconditional thermal contraction, put $t=T/T_0$ and choose $\lambda=\lambda_0t^{-2}$, $K=K_0t^{-2}$, $A=A_0t^{-2}$. The ratios defining $h$ and $d$ stay fixed, but $\Psi_T(b)=t^{-2}\Psi_0(b)$. Thus $P/(k_BT) = \Psi_T(b_P)$ is equivalent to $\Psi_0(b_P)=Pt/(k_BT_0)$: $b_P$ increases with temperature. The source also decorrelates more slowly, so on the feasible positive-horizon branch both maximal accuracy at fixed horizon and maximal horizon increase until any retention plateau. This is a formal registered-rate countermodel, not a claim that generic hardware has these rates.

**Conditional proper-acceleration response.** Additionally accept the detector-response, effective-noise and additive-temperature branch of N.3.2 for the same apparatus, and set
$$
T_{\rm eff}(a)=T_{\rm bath}+\chi a,
\qquad \chi=\frac{\hbar}{2\pi c_{\rm light}k_B},\quad T_{\rm bath}>0.
\tag{20o.15}
$$
The same effective temperature must also be certified as the temperature entering the complete single-bath local-detailed-balance ledger. Detector response or an effective noise temperature alone does not supply that thermodynamic identification. With this identification and the fixed-rate and fixed-local-power registration of the registered-temperature statement above, the exact Bayes and horizon frontiers contract nonincreasingly with the magnitude of proper acceleration $a\ge0$. At smooth power-limited points, multiply (20o.12) by $\chi$. For a fixed feasible kinetic/retention target $b=s e^{2\lambda\theta}$, the permitted accelerations are exactly
$$
0\le a\le
\frac{P/[k_B\Psi_{A,K}(b)]-T_{\rm bath}}\chi
\tag{20o.16}
$$
when the right side is nonnegative; otherwise even $a=0$ fails the power budget.

**Proof.** Substitute (20o.15) into the Bayes frontier above and solve $k_B(T_{\rm bath}+\chi a)\Psi(b)\le P$. ∎

The corollary uses the Unruh response as an imported conditional input. Proper acceleration is distinct from speed and from coordinate orbital acceleration. Inertial coasting has $a=0$. No nonstationary or arbitrary-trajectory thermalization claim is made.

#### The physical work ledger

**Task-resolved physical work bound.** Consider a predictor prepared in its stationary law, carried along a prescribed trajectory from laboratory rest for proper duration $\tau_f$. To use its cost in N's work ledger, register the following additional identification: the single-bath stationary cost of the same modeled source-memory operations is exported from the payload boundary as energy, with no uncharged retained-energy or other-supply term. Thus its actual comoving export rate $R_{\rm exp}$ obeys
$$
R_{\rm exp}\ge P_{\rm modeled}=k_BT\Sigma\ge P_0:=k_BT\Psi_{A,K}(b),
\qquad b=s e^{2\lambda\theta}<d,\quad f(b)\le C_X.
\tag{20o.17}
$$
Assume the target and all local parameters remain constant throughout the segment. Under the zero-mean-comoving-momentum, equal-rest-energy endpoints, source-exhaustion and disjoint-owner assumptions of N.UCT,
$$
W_{\rm lab}\ge m_0c_{\rm light}^2(\gamma_f-1)
+P_0\int_0^{\tau_f}\gamma(\tau)\,d\tau.
\tag{20o.18}
$$
For rectilinear constant proper acceleration $a>0$, let $\eta=a\tau_f/c_{\rm light}$. Then
$$
\boxed{W_{\rm lab}\ge
m_0c_{\rm light}^2(\cosh\eta-1)
+P_0\frac{c_{\rm light}}a\sinh\eta.}
\tag{20o.19}
$$
Under N.UCTa instead, retain explicitly any payload rest-energy change $\Delta U$, field-energy change $\Delta E_F$, and comoving export momentum $\boldsymbol\Pi$. Its exact ledger is
$$
W_{\rm lab}=m_0c_{\rm light}^2(\gamma_f-1)
+\gamma_f\Delta U+\Delta E_F
+\int_0^{\tau_f}\gamma(R_{\rm exp}+\mathbf v\cdot\boldsymbol\Pi)\,d\tau.
\tag{20o.20}
$$
If the total export is future-directed causal, $R_{\rm exp}\ge c_{\rm light}|\boldsymbol\Pi|$, the universally valid substitution is
$$
W_{\rm lab}\ge m_0c_{\rm light}^2(\gamma_f-1)
+\gamma_f\Delta U+\Delta E_F
+P_0\int_0^{\tau_f}\gamma(1-|\mathbf v|/c_{\rm light})\,d\tau.
\tag{20o.21}
$$
For constant proper acceleration from rest, the final integral is
$$
\frac{c_{\rm light}}a(1-e^{-\eta}).
\tag{20o.22}
$$

**Proof.** The first-law/export identification is an explicit premise, not a consequence of a change of frame. Theorem 20m and the Bayes bound above give its comoving floor. Applying N.UCT and $R_{\rm exp}\ge P_0$ proves (20o.18). Constant proper acceleration from rest has $\gamma=\cosh(a\tau/c_{\rm light})$, whose integral is the stated hyperbolic sine. Equation (20o.20) is N.UCTa with the same physical energy owners. Causality gives

$$
\mathbf v\cdot\boldsymbol\Pi\ge-|\mathbf v|R_{\rm exp}/c_{\rm light},
$$

so the export integrand is at least the nonnegative Doppler factor times $R_{\rm exp}$, and hence times $P_0$. Along the constant-acceleration segment this factor is $e^{-a\tau/c_{\rm light}}$, giving (20o.22). ∎

The isotropic and causal factors both tend to $\tau_f$ as $a\to0$. The causal factor is sharp in the abstract export class of N.UCTa: backward null export realizes it. Theorem 20m's binary construction proves attainability of the **local predictor cost**; joint attainability with a specified momentum-export engineering, acceleration supply and all ancillary hardware requires the corresponding realization. In particular, (20o.19) cannot be claimed for unrestricted anisotropic export, and it does not follow by substituting a power floor directly into $R+\mathbf v\cdot\boldsymbol\Pi$ while ignoring momentum.

For a fixed laboratory work budget $B_{\rm lab}$, the isotropic stationary class therefore has the necessary local budget
$$
P_{\rm modeled}\le P_B:=
\frac{B_{\rm lab}-m_0c_{\rm light}^2(\cosh\eta-1)}
{(c_{\rm light}/a)\sinh\eta}.
\tag{20o.23}
$$
If the numerator is negative, the ledger cannot be met. Otherwise the Bayes frontier above with $P=P_B$ yields the corresponding necessary Bayes/horizon bound. It is an attained joint optimum only if the ideal equality work supply and export realization, with no further charged costs, are also admitted. This distinction prevents a fixed-local-power result from being misreported as an unqualified fixed-laboratory-energy result.

Every modeled predictor cost here **resolves the same predictive operations already entered in N's ledger**. A Landauer refresh, source drive or Unruh-associated reset cost for those same operations is not added a second time. A changing temperature or task along the trajectory cannot be treated as pointwise stationary without a separate nonstationary or controlled quasistationary theorem and transient accounting. The logarithmic horizon-gap singularity (20o.10) is also distinct from the same-task SPAP complexity divergence in N.2; equating their parameters or resources requires a further identification theorem.

**Delayed prediction and disjoint physical budgets.**

This section uses the hard-exit-only frontier of Theorems 20j–20k. Write $\vartheta_i=k_BT_i$, $h_i=K_i/(K_i+2\lambda_i)$, and $\psi_i(b)=\lambda_i b\ln[(1+b)/(1-b/h_i)]$. The exact module powers below use the complete stationary work account already specified in Proposition 20h. Their addition is exact for independent product modules with disjoint accounts; an arbitrary network with shared physical memory is a different optimization class.

#### Delayed snapshot and prediction radius

<a id="theorem-20p-exact-delayed-snapshot-horizon"></a>**Theorem 20p (Exact delayed-snapshot horizon).** At observer time $t$, its complete predictive input is a snapshot $M_{t-\delta}$ of the stationary source-local memory, with deterministic delay $\delta\ge0$. Any subsequent processing is independent of the source conditional on this snapshot. The target is $X_{t+\tau}$, $\tau\ge0$. There is no additional stream history or source-correlated side record. For predictor power $P>0$, let $b_P$ be the unique solution of $k_BT\psi_K(b_P)=P$. For a required target information $J_*\in(0,\ln2]$ put $s=f^{-1}(J_*)$; for required Bayes accuracy $p_*>1/2$ put $s=2p_*-1$. Then exact feasibility in the ideal snapshot class is

$$
\boxed{\tau+\delta\le H_P(s):=\frac1{2\lambda}\ln\frac{b_P}{s}.}
\tag{20p.81}
$$

The boundary is attained by the binary equality memory and identity transmission. If an independently calibrated distance and latency satisfy $\delta\ge\delta_{\rm proc}+d/v_*$, with $v_*>0$, then every feasible observer satisfies

$$
d\le v_*[H_P(s)-\tau-\delta_{\rm proc}].
\tag{20p.82}
$$

A negative right side means infeasibility, including at $d=0$. The distance bound is jointly attainable only if the minimum delay, fidelity and predictor construction are jointly realized.

*Proof.* Source autonomy gives $M_{t-\delta}\to X_{t-\delta}\to X_{t+\tau}$, with bias multiplier $e^{-2\lambda(\tau+\delta)}$. The exact Theorem 20j and the hard-cap Bayes bound in Theorem 20k(d) costs are therefore $k_BT\psi_K(se^{2\lambda(\tau+\delta)})$. Monotonicity makes this at most $P$ exactly under (20p.81); the binary construction attains it. Postprocessing cannot improve optimal Bayes accuracy or mutual information. Substitution of the independent latency inequality proves (20p.82). ∎

For an observer allowed an arbitrary history up to $t-\delta$, but no auxiliary record correlated with later source innovations conditional on $X_{t-\delta}$, the weaker universal Markov bound is

$$
I(R_t;X_{t+\tau})\le f(e^{-2\lambda(\tau+\delta)}),\qquad
p_{\rm correct}\le\frac{1+e^{-2\lambda(\tau+\delta)}}2.
\tag{20p.83}
$$

Data processing proves the first inequality; the future posterior bias is the displayed exponential times a conditional bias of magnitude at most one, proving the second. Exact delayed access to the raw source bit attains both and can exceed the snapshot-memory ceiling. Thus a history or side channel cannot be silently added to the snapshot theorem. PU Definition 35a supplies the separate latency/capacity ledger; PU Theorem 46 can supply $v_*$ only on its independently certified operational-speed branch.

#### Exact allocation of a common power supply

Consider $n\ge1$ independent sources with separate stationary memory modules and reservoirs, a product full model, and no uncharged or shared work owner. Each module has positive $\lambda_i,K_i,T_i$, delay $\delta_i\ge0$ and utility weight $w_i>0$. Each $K_i$ bounds the total memory exit rate of module $i$; the product exit rate sums these rates. A single aggregate exit cap is a different constraint. The allocation problem below imposes no further per-module retention cap; its feasible information intervals are the ones explicitly displayed. All rates, delays and powers use a common metered time coordinate. At common forecast horizon $\tau\ge0$, set

$$
r_i=e^{-2\lambda_i(\tau+\delta_i)},\qquad
 g_i(J)=\vartheta_i\psi_i\!\left(\frac{f^{-1}(J)}{r_i}\right),
\quad 0\le J<f(r_ih_i).
\tag{20p.84}
$$

By Theorems 20j–20k, $g_i$ is strictly convex and increasing, diverges at its upper endpoint, and

$$
a_i:=g_i'(0+)=4\vartheta_i\lambda_i
\left(1+\frac{\lambda_i}{K_i}\right)e^{4\lambda_i(\tau+\delta_i)}.
\tag{20p.85}
$$

<a id="theorem-20p1-unique-resource-allocation-and-channel-activation"></a>**Theorem 20p.1 (Unique resource allocation and channel activation).** For finite $P>0$, maximizing $\sum_iw_iJ_i$ subject to $\sum_i g_i(J_i)\le P$ has a unique information vector, uses the entire budget, and is given by

$$
\boxed{J_i(\mu)=
\begin{cases}
0,&w_i\le\mu a_i,\\
(g_i')^{-1}(w_i/\mu),&w_i>\mu a_i,
\end{cases}
\qquad\sum_i g_i(J_i(\mu))=P.}
\tag{20p.86}
$$

The last equation has one solution $\mu>0$. Product binary constructions attain the optimum. For $P=0$ the unique information vector is zero, while the multiplier need not be unique.

*Proof.* A finite budget bounds each coordinate away from its divergent endpoint, making the feasible set compact. A maximizer exists and uses the full budget because every positive-weight coordinate can still increase. If two distinct vectors maximized the objective, strict convexity would give their midpoint the same benefit at strictly smaller cost. The remaining budget would improve it, a contradiction. For fixed $\mu>0$, strict concavity of $w_iJ-\mu g_i(J)$ gives the coordinate formula from its right derivative at zero or its unique interior derivative root. The total assigned cost is continuous and strictly decreasing wherever positive, tends to infinity as $\mu\downarrow0$, and becomes zero at $\max_iw_i/a_i$. Hence its positive-budget root is unique. Summing the scalar maximizing inequalities proves constrained optimality; disjoint product realization proves attainment. ∎

The threshold ratio $w_i/a_i$ explicitly prices source persistence, delay, temperature and exit rate. It is a marginal resource-allocation consequence, not a dynamical selection law. Independence of source labels alone is insufficient for additive physical costs: a shared memory or common thermal resource must be included in the admissible class and priced once.

#### Common horizon and bottleneck saturation

<a id="theorem-20q-common-horizon-frontier"></a>**Theorem 20q (Common-horizon frontier).** Prescribe positive target biases $s_i$, obtained from either target information or Bayes accuracy as in Theorem 20p. Put

$$
t_i=\frac1{2\lambda_i}\ln\frac{h_i}{s_i}-\delta_i,
\quad t_c=\min_i t_i,
\quad b_i(\tau)=s_i e^{2\lambda_i(\tau+\delta_i)}.
\tag{20p.87}
$$

If $t_c\le0$, no nonnegative common horizon is feasible at finite power. Otherwise

$$
G(\tau)=\sum_i\vartheta_i\psi_i(b_i(\tau)),\qquad0\le\tau<t_c,
\tag{20p.88}
$$

is the exact minimum product-class power. It is continuous, strictly increasing and strictly convex and diverges at $t_c$. A nonnegative horizon is feasible exactly when $P\ge G(0)$; its attained maximum is the unique root $G(\tau_P)=P$. For $P>G(0)$, $\tau_P$ is increasing and strictly concave in $P$.

*Proof.* Exact module costs add and are jointly attained. Differentiation gives

$$
G'=\sum_i2\lambda_i\vartheta_i b_i\psi_i'(b_i)>0,
\quad G''=\sum_i4\lambda_i^2\vartheta_i
[b_i\psi_i'(b_i)+b_i^2\psi_i''(b_i)]>0.
\tag{20p.89}
$$

At least one module reaches its singular bias ceiling at $t_c$. Existence and uniqueness follow from the intermediate-value theorem; inverse differentiation gives $\tau_P'=1/G'$ and $\tau_P''=-G''/(G')^3<0$. ∎

For the tied-bottleneck set $B=\{i:t_i=t_c\}$ and any reference time $t_0>0$, define

$$
A_B=\sum_{i\in B}\vartheta_i\lambda_i h_i,\qquad
B_0=\sum_{i\in B}\vartheta_i\lambda_i h_i
\ln\frac{1+h_i}{2\lambda_i t_0}
+\sum_{i\notin B}\vartheta_i\psi_i(b_i(t_c)).
\tag{20p.90}
$$

Then

$$
\boxed{t_c-\tau_P\sim t_0\exp[(B_0-P)/A_B]\quad(P\to\infty).}
\tag{20p.91}
$$

Indeed $b_i(t_c-\epsilon)=h_i e^{-2\lambda_i\epsilon}$ on a bottleneck, so its cost is $\vartheta_i\lambda_i h_i\ln[(1+h_i)/(2\lambda_i\epsilon)]+o(1)$; the other terms converge. Summation and inversion prove the claim. The reference time keeps logarithms dimensionless and cancels from the result. Increasing power approaches the kinetic horizon exponentially without crossing it.

#### Cooling-limited viability

<a id="theorem-20r-thermal-prediction-ceiling"></a>**Theorem 20r (Thermal prediction ceiling).** Fix $\lambda,K,b$ and a verified operating interval $0<T_0\le T\le T_{\max}<\infty$, with $T_0<T_{\max}$. Suppose actual predictor power is deposited as local heat with $P_{\rm heat}(T)\ge k_BT\psi_K(b)$, all other heating is nonnegative and charged, and the only steady removal is $\mathcal G(T-T_0)$, where $\mathcal G>0$ is thermal conductance. Every stationary equilibrium in the interval satisfies

$$
k_B\psi_K(b)\le\mathcal G(1-T_0/T_{\max}),\qquad
b\le b_{\rm th}:=\psi_K^{-1}\!\left[\frac{\mathcal G}{k_B}(1-T_0/T_{\max})\right]<h.
\tag{20p.92}
$$

A target bias $s>0$ consequently requires $\tau+\delta\le(2\lambda)^{-1}\ln(b_{\rm th}/s)$.

If an independently validated transient implementation additionally obeys

$$
C_{\rm th}\dot T=qT-\mathcal G(T-T_0),\qquad
q=k_B\psi_K(b),\quad C_{\rm th}>0,
\tag{20p.93}
$$

then for $q<\mathcal G$ it has the unique stable equilibrium and exact solution

$$
T_* =\frac{\mathcal G T_0}{\mathcal G-q},\qquad
T(t)=T_*+[T(0)-T_*]e^{-(\mathcal G-q)t/C_{\rm th}}.
\tag{20p.94}
$$

The operating interval is forward invariant for every initial temperature in it exactly under (20p.92). Equality puts the equilibrium at $T_{\max}$. At $q=\mathcal G$ the solution grows linearly; at $q>\mathcal G$ it grows exponentially and leaves every finite operating interval.

*Proof.* At equilibrium, $qT\le\mathcal G(T-T_0)$. Dividing by $T$ and maximizing $\mathcal G(1-T_0/T)$ over the interval proves (20p.92). Monotonicity of $\psi_K$ gives its inverse and horizon implications. Solving the separately assumed affine differential equation gives (20p.94). Its vector field is inward at $T_0$ and inward at $T_{\max}$ exactly under (20p.92), proving the invariance criterion and the remaining growth cases. ∎

The lower-bound theorem needs an actual modeled-power-to-local-heat bridge; the transient equality is an additional constitutive model. At equilibrium $P_*=qT_*$, the cooling link produces entropy $P_*(1/T_0-1/T_*)$, while the predictor contributes $P_*/T_*$. Their sum is $P_*/T_0$. Charging this total and its two pieces separately would double count. For a general removal law $D(T)$, the necessary interval condition is $q\le\max D(T)/T$; an equilibrium of the ideal equality model is linearly stable if $D'(T)>q$ and unstable if $D'(T)<q$.

#### Entropy export and entropy production

PU Definition 35a meters entropy exported per completed use. For one Theorem P.15.2a protocol its sharp ideal entry is

$$
\inf Q/(k_BT)=H(X\mid Y,R)+\Delta,
\qquad\inf\Sigma_{\rm total}=\Delta.
\tag{20p.95}
$$

Thus the export entry is the whole first quantity. Using $\Delta$ alone gives at most a weaker lower bound unless the baseline conditional entropy is zero. Converting to a rate additionally needs an independently measured completed-use rate and actual reinjection, with each physical reset charged once. The local-network identities of Theorem P.15.2c determine which conditionals belong to each use when different nodes share correlations.

<a id="corollary-20s-resolution-separated-operational-class-gap"></a>**Corollary 20s (Resolution-Separated Operational Class Gap).** Retain Theorem 20k(a)'s source, complete commensurate objective $V_w$, positive retained-information budget and feasible score interval $\mathcal J_C$. Suppose every candidate $a$ has complete objective $C(a)\ge V_w(J(a))$. One candidate in a winning operational equivalence class attains $C=V_w(J_*)$. Suppose every candidate in every other operational class satisfies $|J(a)-J_*|\ge\delta>0$, and this separated comparison set is nonempty. Define each class cost as the infimum of its complete implementation costs. Then every competing class has cost at least
$$
V_w(J_*)+g_\delta,\qquad
g_\delta:=\inf_{J\in\mathcal J_C,\ |J-J_*|\ge\delta}
 [V_w(J)-V_w(J_*)]>0.
\tag{20s.1}
$$
If both $J_*\pm\delta$ are feasible, convexity gives
$$
g_\delta=\min\{V_w(J_*-\delta),V_w(J_*+\delta)\}-V_w(J_*).
\tag{20s.2}
$$
Minimize over whichever of these boundary scores are feasible, omitting an infeasible side.

*Proof.* The complete candidate-cost lower bound and the stipulated score separation imply $C(a)\ge V_w(J_*)+g_\delta$ for every competing candidate; taking its class infimum preserves the inequality. Theorem 20k gives a unique minimizing score and continuous strictly convex objective. An attained retention endpoint is closed. At an open kinetic endpoint the objective diverges, so every bounded sublevel set is compact away from that endpoint. The closed separated set therefore has a minimizing score with strictly positive objective difference from the unique $J_*$. On each feasible side of $J_*$, convexity makes the smallest difference occur at its nearest endpoint, proving (20s.2) and its one-sided version. ∎

The operational equivalence relation and positive separation are hypotheses about the actual comparison class. Pairwise score closeness does not itself define an equivalence relation. Distinct implementations with the same score can belong to different classes and violate separation. Theorem 20k's unique score alone still has zero infimum difference over distinct scores approaching it; this corollary supplies a strict class gap only under the stated additional certificate.

<a id="theorem-20t-finite-time-full-future-sufficiency-and-exact-coordinate-cardinality"></a>**Theorem 20t (Finite-Time Full-Future Sufficiency and Exact Coordinate Cardinality).** Let $L$ be a finite continuous-time Markov generator and $P_\tau=e^{\tau L}$ for finite $\tau\ge0$. Distinct initial states have distinct transition rows. If $M-X_0-X_\tau$ and $M$ preserves all predictive information about the entire $X_\tau$, then $M$ determines $X_0$ on its supported alphabet. At a full-support stationary law,
$$
I(M;X_0)=H(X_0),\qquad H(M)\ge H(X_0).
\tag{20t.1}
$$
This permits a stochastic encoder. Further, on a ring of prime size $p$, the exact complex coefficient
$$
Z(\eta)=\sum_{j=0}^{p-1}\eta_j\zeta^j,\qquad \zeta=e^{2\pi i/p},
\qquad \eta_j\in\{0,1\},\quad\sum_j\eta_j=k
\tag{20t.2}
$$
is injective on the fixed-particle sector. Its two real coordinates therefore have $\binom pk$ distinct joint values and the same entropy as the microstate under every input law.

*Proof.* A matrix exponential is invertible, with inverse $e^{-\tau L}$. Equal rows would make $P_\tau$ singular. Predictive sufficiency is $I(X_0;X_\tau\mid M)=0$; together with the encoder Markov condition it requires every initial state compatible with a register value to have the same transition row. Thus each supported value identifies at most one initial state. This proves (20t.1).

If two configurations have equal (20t.2), the rational polynomial
$D(z)=\sum_{j=0}^{p-1}(\eta_j-\xi_j)z^j$
vanishes at $\zeta$. Since its degree is at most $p-1$, irreducibility of the prime cyclotomic polynomial makes it zero or a scalar multiple of $1+z+\cdots+z^{p-1}$. Fixed particle count gives $D(1)=0$, forcing the scalar to be zero. Therefore the configurations coincide. $\square$

These exact statements count distinguishable values, not the number of real coordinates. A compression claim uses a declared tolerance, restricted future task or limiting regime, together with the finite precision and physical access account.

<a id="theorem-20u-coarsest-autonomous-refinement-of-a-finite-statistic"></a>**Theorem 20u (Coarsest Autonomous Refinement of a Finite Statistic).** On a finite state set $\Omega$, let $Z$ define a partition $\mathcal P_0$. For each cell $C$ of a current partition $\mathcal P_n$, split its states by the vectors
$$
\left(\sum_{y\in D}L(x,y)\right)_{D\in\mathcal P_n}.
\tag{20u.A1}
$$
Stop when no split occurs. The terminal partition is the unique coarsest strongly lumpable refinement preserving $Z$. Its generator on cells is the common rate sum (20u.A1), so its process is autonomous for every initial microstate and every initial law.

For a finite menu of retained generators $\{L^{(a)}\}$, use the concatenated rate-sum vectors for every $a$ at every step. The result is the unique coarsest common strongly lumpable refinement. It supplies an exact state description for prescribed piecewise-constant switching among those generators.

*Proof.* The partition only refines and has at most $|\Omega|$ cells, so the procedure terminates. At termination the rate sums to each cell agree within every cell, which is precisely strong lumpability. If another strongly lumpable refinement respects $\mathcal P_n$, equality of rates into each of its finer cells implies equality into their unions forming the cells of $\mathcal P_n$. It therefore respects the next split. Starting with $\mathcal P_0$, induction shows it refines the terminal partition. This proves uniqueness and minimality. The identical induction with every retained generator proves the common version; composition of the corresponding cell semigroups proves the switching claim. $\square$

**Finite exclusion sources and complete refinement data.** On
$$
\Omega_{N,k}=\{\eta\in\{0,1\}^N:\sum_j\eta_j=k\},
\qquad (Lf)(\eta)=\sum_{j=0}^{N-1}[f(\eta^{j,j+1})-f(\eta)],
\tag{20u.A2}
$$
indices are cyclic and every unordered neighboring bond has its own unit-rate clock. Equal occupancies produce no state change. The invariant law is uniform. All times below use this clock convention. For $N=4$ retain coefficient vectors $(1,0,-1,0)$ and $(0,1,0,-1)$; for $N=6$ retain
$$
c=(2,1,-1,-2,-1,1),\quad s=(0,1,1,0,-1,-1),
\qquad Z(\eta)=\left(\sum_jc_j\eta_j,\sum_js_j\eta_j\right).
\tag{20u.A3}
$$
Each component in the six-site source obeys $LZ=-Z$, hence has conditional mean $e^{-t}Z(\eta)$. Nevertheless, for three particles the alternating configurations $A=\{0,2,4\}$ and $B=\{1,3,5\}$ both have $Z=0$, while their outgoing mode laws have disjoint supports:

| Initial state | Next modes, each at rate two |
|---|---|
| $A$ | $(-1,-1),(-1,1),(2,0)$ |
| $B$ | $(-2,0),(1,-1),(1,1)$ |

Thus exact mean closure is not stochastic autonomy.

The [complete finite state and generator tables](related/calculation_companions/section_06/c6-exclusion-state-and-bond-tables.md#state-tables) give the evaluations for $(N,k)=(4,2),(6,2),(6,3)$. States are occupied-site sets in lexicographic order. In those tables $\mathcal J_i$ lists every distinct state reached at rate one from state $i$; unlisted off-diagonal entries are zero and $L_{ii}=-|\mathcal J_i|$. The terminal-cell labels $R_i$ are local to each table and are computed by Theorem 20u. The generator, mode coordinates and complete refinement proof are those above.

Direct rate-sum substitution in these tables gives

| $(N,k)$ | Microstates | Mode cells | Coarsest autonomous cells | Added stationary entropy |
|---|---:|---:|---:|---|
| $(4,2)$ | $6$ | $5$ | $5$ | $0$ |
| $(6,2)$ | $15$ | $13$ | $15$ | $(\ln3)/5$ |
| $(6,3)$ | $20$ | $13$ | $14$ | $(\ln2)/10$ |

For $(6,2)$, the only nonsingleton mode cell is the three-state zero-mode cell, and its rate sums split all three states. For $(6,3)$, only the two alternating zero-mode states split; the other six doublets remain cells. The displayed $R$ rates are constant on each $R$ cell, while the displayed failed mode rate sums force the splits. The minimality proof of Theorem 20u therefore certifies these counts. On the twenty-state source,
$$
H(Z)=\ln20-\frac7{10}\ln2,\qquad
H(R)=\ln20-\frac6{10}\ln2.
\tag{20u.A4}
$$
These follow by subtracting $|C|\ln|C|/20$ for each partition cell. The minima concern deterministic state refinements with exact all-preparation Markov autonomy; they do not bound arbitrary hidden-state simulators, quantum memory or history-dependent encoders. Entropy of a retained distinction is a separate quantity from physical reset heat.

**One-bond intervention and its full finite certificate.** Put
$$
(B_jf)(\eta)=f(\eta^{j,j+1})-f(\eta),\qquad L_a=L+aB_j,\qquad a>0.
\tag{20u.A5}
$$
For every bond $j\in\{0,\ldots,5\}$, the coarsest strongly lumpable refinement of $Z$ for this single $L_a$ has twenty cells. A common description for $L$ and $L_a$ consequently does too. Here is a rate-sum certificate for all six nonzero-mode doublets. Each entry $(z,d)$ gives a target mode $z$ and the nonzero difference $d$ between the two displayed states' $B_j$ rate sums into that mode. Their baseline $L$ rate-sum differences are zero into every mode cell.

The [six-doublet, six-bond witness table](related/calculation_companions/section_06/c6-exclusion-state-and-bond-tables.md#bond-witnesses) gives all $36$ exact $(z,d)$ entries in that same lexicographic twenty-state indexing.

For $L_a$ each displayed difference is $ad\ne0$, so all six nonzero doublets split at the first step. The alternating pair retains its disjoint outgoing mode supports with all original rates positive, and splits as well. No initial mode cell has more than two states, hence this first step is already the full configuration partition. Relative to $R$, the added uniform entropy is $(6/10)\ln2$, or $0.6$ bits; the least fixed-length label capacity rises from four bits for fourteen labels to five bits for twenty labels. This exact distinction requirement does not describe a thermodynamic phase transition.

**Finite-horizon tolerance.** Couple $L$ and $L_a$ with the same original bond clocks and one additional rate-$a$ clock at the controlled bond. Until its first ring, their configurations agree. Thus, uniformly over initial configurations, both their mode and $R$ marginals and their path laws through time $t$ satisfy
$$
\operatorname{TV}(\mathcal L_{L_a},\mathcal L_L)\le1-e^{-at}.
\tag{20u.A6}
$$
The autonomous fourteen-state baseline $R$ chain, initialized at the correct $R$ state or law, therefore predicts the perturbed source within $\epsilon$ whenever
$$
t\le-\frac{\ln(1-\epsilon)}a,\qquad0<\epsilon<1.
$$
This is a sufficient bound; arbitrary rare-history conditioning need not preserve it, and $Z_0$ alone need not determine $R_0$. A prescribed nonnegative time-dependent increase replaces $at$ by $\int_0^ta(s)\,ds$. The coupling proves continuity of finite-resolution prediction despite the jump in exact autonomous label count.

<a id="proposition-20u1-certified-binary-predictive-gap-beyond-the-complete-first-mode"></a>**Proposition 20u.1 (Certified Binary Predictive Gap Beyond the Complete First Mode).** On the stationary $(N,k)=(6,3)$ source at lag $\tau=1/10$, let $I_{\mathrm{full}}^*$ maximize $I(M;X_\tau)$ over all nonconstant deterministic binary encoders of the microstate, and let $I_Z^*$ maximize it over all nonconstant deterministic binary functions of the entire two-component $Z$. In bits,
$$
\frac{657}{1000}<I_{\mathrm{full}}^*<\frac{660}{1000},\qquad
\frac{630}{1000}<I_Z^*<\frac{633}{1000},\qquad
I_{\mathrm{full}}^*-I_Z^*>\frac{24}{1000}.
\tag{20u.A7}
$$
The following complete finite evaluation and error certificate establish the bounds; the displayed long decimal witnesses are not asserted to be exact global maxima.

*Finite algorithm and certificate.* Use the twenty-state integer generator specified above. For a subset $A$, set $M=\mathbf1_A(X_0)$. Uniform stationarity and symmetry give
$$
w=\frac{|A|}{20},\qquad q_y=\sum_{x\in A}P_{xy},\qquad
I_A=h_2(w)-\frac1{20}\sum_{y=0}^{19}h_2(q_y)
\quad\text{in nats},\qquad P=e^{L/10}.
\tag{20u.A8}
$$
Here $h_2(v)=-v\ln v-(1-v)\ln(1-v)$, with endpoint values zero. Divide by $\ln2$ for bits. To evaluate $P$, put $B=6I+L$, which is nonnegative with every row sum six. Then
$$
P=e^{-3/5}\sum_{r=0}^{\infty}\frac{B^r}{10^r r!}.
\tag{20u.A9}
$$
All entries of the partial sum through $r=24$ are exact rationals. In particular, with
$$
D=10^{24}24!=620448401733239439360000000000000000000000000000,
\qquad
N=\sum_{r=0}^{24}\frac{D}{10^rr!}B^r,
$$
the partial sum is $N/D$, using integer matrix multiplication. The entrywise omitted tail is bounded by
$$
T=\frac{(3/5)^{25}}{25!}\frac1{1-(3/5)/26}.
\tag{20u.A10}
$$
For $e^{-3/5}$ use the degree-41 and degree-40 alternating sums as rational lower and upper bounds $e_-,e_+$. Hence the exact entry enclosure is
$$
e_-\frac{N_{xy}}D\le P_{xy}\le e_+\left(\frac{N_{xy}}D+T\right).
\tag{20u.A11}
$$
Its maximum width is less than $1.03\times10^{-31}$. Convert each midpoint to binary64 by round-to-nearest, ties-to-even; the exact rational comparison gives entrywise absolute error less than $2^{-52}$.

Make a table of $h_2(k/2^{16})$, $0\le k\le2^{16}$, and the twenty-one prior values $h_2(k/20)$, $0\le k\le20$, setting endpoints to zero. Evaluate logarithms at 45 decimal digits and convert to binary64 by round-to-nearest, ties-to-even. The same convention supplies $\ln2$. A reproducible rational logarithm enclosure is as follows: write a positive rational $q=2^my$ with $1\le y<2$, put $z=(y-1)/(y+1)$ and use
$$
\ln y=2\sum_{r=0}^{80}\frac{z^{2r+1}}{2r+1}+R,
\qquad 0\le R\le\frac{2z^{163}}{163(1-z^2)}.
\tag{20u.A12}
$$
Use the same formula for $\ln2$ at $y=2$, $z=1/3$, and $\ln q=m\ln2+\ln y$. These finite rational intervals certify absolute error at most $2^{-50}$ for each stored entropy value and for $\ln2$.

Enumerate complements only once by fixing group zero inside $A$. For unrestricted encoders take the singleton groups $\{0\},\ldots,\{19\}$. For mode encoders order groups by first appearance in the state table, and group all states with equal $Z$. Thus the ordered mode groups are
$$
(\{0\},\{1,12\},\{2,6\},\{3\},\{4,11\},\{5,14\},
\{7,18\},\{8,15\},\{9\},\{10\},\{13,17\},\{16\},\{19\}).
\tag{20u.A13}
$$
For $g$ groups enumerate $n=0,\ldots,2^{g-1}-1$ with Gray word $\gamma_n=n\mathbin{\mathrm{xor}}\lfloor n/2\rfloor$. Its bit $i-1$ includes group $i$. Omit the full set. Initialize $q_y$ with group zero's row sum; at every Gray step add or subtract just the changed group's row sum and update its integer size. For each $q_y$, round $2^{16}q_y$ to the nearest integer, clamp to $[0,2^{16}]$, and use that entropy-grid entry in (20u.A8). There are exactly $2^{19}-1=524287$ unrestricted comparisons and $2^{12}-1=4095$ mode comparisons.

A group has at most two states. Its row-sum error is less than $2^{-50}$. On binary64 round-to-nearest arithmetic the error per Gray update is conservatively less than $2^{-48}$; at most $2^{19}$ such updates keep accumulated $q$ error below $2^{-28}$. This also keeps intermediates within the bounded interval used for that rounding estimate. Nearest-grid selection, including endpoint clamping, therefore places the chosen grid point within $2^{-15}$ of the true $q_y$. Binary entropy continuity bounds the resulting information error by
$$
\frac{h_2(2^{-15})}{\ln2}+10^{-10}
<\frac{17}{32768}+10^{-10}<\frac1{1000}\quad\text{bits}.
\tag{20u.A14}
$$
The $10^{-10}$ term includes the twenty stored entropy values, prior-table and $\ln2$ errors and the final bounded sums/divisions. To check the displayed entropy estimate, use
$-(1-\delta)\ln(1-\delta)\le\delta$ and
$1/\ln2<3/2$ at $\delta=2^{-15}$.

The exhaustive grid maxima are $0.6582498292002638$ and $0.6317552017203579$ bits. The associated Gray masks are $3647$ and $199$, with feasible subsets
$$
A_{\mathrm{full}}=\{0,1,2,3,4,5,6,10,11,12\},\qquad
A_Z=\{0,1,2,3,6,8,9,12,15\}.
\tag{20u.A15}
$$
Independent rational interval evaluation of these particular subsets gives
$0.658256709753<I_{A_{\mathrm{full}}}<0.658256709754$ and
$0.631753395414<I_{A_Z}<0.631753395415$ bits. These are feasible-value witnesses. Applying the uniform error bound (20u.A14) to the grid maxima proves the coarse global intervals (20u.A7), hence their strict gap. Every input, grouping, finite loop, matrix truncation and logarithm/error bound required by the certificate has been specified above. $\square$

This compares label capacity at one fixed lag. It neither prices local sensing, stored precision or control power nor establishes performance under every intervention or in a hydrodynamic limit.

<a id="proposition-20v-local-rare-labels-with-strong-posterior-and-vanishing-markov-sensor-rates"></a>**Proposition 20v (Local Rare Labels with Strong Posterior and Vanishing Markov-Sensor Rates).** Let a finite irreducible autonomous source be reversible with invariant law $\pi$ and generator $L$. For a binary memory use
$$
w(1\mid0,x)=\epsilon g(x_A),\qquad w(0\mid1,x)=\kappa,
\qquad\kappa>0,
\tag{20v.1}
$$
where $g$ is fixed, strictly positive, bounded, nonconstant and depends only on a declared local source region $A$. As $\epsilon\downarrow0$, these memory exit rates obey a fixed finite cap. If $p(x,1)=\pi(x)r_\epsilon(x)$ in the stationary joint process, then
$$
(\kappa-L+\epsilon\operatorname{diag}g)r_\epsilon=\epsilon g,
\qquad
r_\epsilon=\epsilon(\kappa-L)^{-1}g+O(\epsilon^2),
\tag{20v.2}
$$
$$
p_1:=\Pr(M=1)=\frac{\epsilon\langle g\rangle_\pi}{\kappa}
+O(\epsilon^2),\qquad
\frac{\Pr(X=x\mid M=1)}{\pi(x)}
\longrightarrow
f_1^*(x)=\frac{\kappa(\kappa-L)^{-1}g(x)}{\langle g\rangle_\pi}.
\tag{20v.3}
$$
The limiting posterior is positive and nonconstant. Memory-transition activity, predictive information at each fixed finite lag and the joint stationary Markov entropy-production rate are all $O(\epsilon)$, whereas this rare posterior contrast remains nonzero.

*Proof.* Reversibility converts the stationary forward equation for $\pi r_\epsilon$ into (20v.2). Let $A_\kappa=\kappa-L$. Its positive resolvent is
$$
A_\kappa^{-1}=\int_0^\infty e^{-\kappa t}e^{tL}\,dt,
\qquad \|A_\kappa^{-1}\|_{\infty\to\infty}\le1/\kappa.
$$
For $\epsilon\|g\|_\infty/\kappa<1$, the Neumann expansion of
$(A_\kappa+\epsilon\operatorname{diag}g)^{-1}$ gives the uniform $O(\epsilon^2)$ remainder in (20v.2). Averaging against $\pi$ gives

$$
\kappa\langle r_\epsilon\rangle=\epsilon\langle g\rangle-\epsilon\langle gr_\epsilon\rangle,
$$

which proves (20v.3). With $h=A_\kappa^{-1}g$, positivity gives

$$
g_{\min}/\kappa\le h\le g_{\max}/\kappa.
$$

A constant $h$ would make $g=A_\kappa h=\kappa h$ constant, so $f_1^*$ is nonconstant.

Stationary memory flux balance gives activity $2\kappa p_1=O(\epsilon)$. At fixed lag, reversibility gives rare posterior density $e^{\tau L}f_1^*+O(\epsilon)$. It remains nonconstant for finite $\tau$ by invertibility, while the common-label posterior is $1+O(\epsilon)$. The rare-label contribution to mutual information is $p_1$ times a bounded relative entropy, and the common-label relative entropy is $O(\epsilon^2)$ by finite-alphabet Taylor expansion about the positive law $\pi$. Thus total predictive information is $O(\epsilon)$.

For entropy production, use the sum over undirected transitions of $(F-B)\ln(F/B)$ for stationary forward and reverse probability flows. On a reversible source edge at memory zero, the flow difference is $O(\epsilon)$ and its log ratio is $O(\epsilon)$, giving $O(\epsilon^2)$. At memory one both flows are $O(\epsilon)$ and their positive leading ratios are bounded, giving $O(\epsilon)$. On each memory edge both flows are $O(\epsilon)$, with leading ratio $g(x)/(\kappa h(x))$ bounded above and below, also giving $O(\epsilon)$. Summing finitely many edges proves the claim. $\square$

The transition-rate affinity
$$
\ln\frac{w(0\mid1,x)}{w(1\mid0,x)}
=\ln\frac{\kappa}{\epsilon g(x_A)}
\tag{20v.4}
$$
diverges. Thus locality and finite rate caps do not impose a bounded affinity or energy range. A thermal realization must supply that growing offset or work affinity, and an external controller's independent costs remain in its full ledger. The bounded-affinity assumption of Corollary 20i is substantive; low average information or low Markov-sensor entropy production alone does not imply weak posterior information in every label.

<a id="corollary-20w-a-finite-precision-full-law-record-for-half-filled-exclusion"></a>**Corollary 20w (A Finite-Precision Full-Law Record for Half-Filled Exclusion).** Let $L$ be the unit-bond-clock exclusion generator of (20u.A2), now on $2N$ sites with exactly $N$ particles. Write $\sigma_j=2\eta_j-1$, let $\mu_N$ be the uniform law on this sector, and define the two real components

$$
 F(\sigma)=\sum_{j=0}^{2N-1}\sigma_j
 \left(\cos\frac{\pi j}{N},\sin\frac{\pi j}{N}\right),\qquad
 \lambda_N=2\left(1-\cos\frac\pi N\right). \tag{20w.1}
$$

For $h\in\mathbb R^2$ the decoder law is the explicitly normalized finite distribution

$$
 \nu_{N,h}(\eta)=
 \frac{\exp(h\cdot F(2\eta-1))}
 {\displaystyle\sum_{\xi\in\Omega_{2N,N}}\exp(h\cdot F(2\xi-1))}.
 \tag{20w.2}
$$

For all sufficiently large $N$, every initial configuration $\chi$ and every

$$
 t\ge\frac{4N^2}{9\pi^2}\ln N, \tag{20w.3}
$$

there is a deterministic finite record with at most

$$
 \left(2+\frac{4Ne^{-\lambda_Nt}}{\epsilon}\right)^2 \tag{20w.4}
$$

labels, $0<\epsilon<1$, whose decoder approximates the complete conditional configuration law $P_t(\chi,\cdot)$ within $(\ln\ln N)^{-1}+\epsilon$ in total variation, uniformly in $\chi$. The record is obtained by rounding each coordinate of

$$
 h_t(\chi)=e^{-\lambda_Nt}F(2\chi-1)/N \tag{20w.5}
$$

to its nearest integer multiple of $\epsilon/N$, with a fixed tie convention. At time (20w.3) and $\epsilon=(\ln\ln N)^{-1}$, its fixed-length storage is $O(\log N)$ bits, whereas an exact full-configuration label has $\log_2\binom{2N}N=\Theta(N)$ bits.

*Proof.* The source-level approximation is Lacoin's tilted-equilibrium law (Lacoin 2016, Proposition 2.3 and its proof in Section 4): for the normalized generator here and all the times in (20w.3),

$$
 \sup_{\chi\in\Omega_{2N,N}}
 \operatorname{TV}\bigl(P_t(\chi,\cdot),\nu_{N,h_t(\chi)}\bigr)
 \le(\ln\ln N)^{-1}. \tag{20w.6}
$$

To match its polar notation, put $F=F(2\chi-1)$; if $F=(F_c,F_s)\ne0$, choose $\theta$ with $\sin\theta=F_c/|F|$ and $\cos\theta=F_s/|F|$. Then its $b(\chi)=|F|/N$ and $b(\chi)\sin(\pi j/N+\theta)$ equals $F\cdot(\cos(\pi j/N),\sin(\pi j/N))/N$. At $F=0$ both forms give the uniform decoder. Its bond rates are exactly those of (20u.A2).

Here is the complete quantization bound. Put

$$
 \psi_N(h)=\ln\sum_{\eta\in\Omega_{2N,N}}e^{h\cdot F(2\eta-1)}.
$$

Every summand of $F$ has Euclidean norm one, so $|F|\le2N$. Differentiation of the finite sum gives $\nabla^2\psi_N=\operatorname{Cov}_{\nu_{N,h}}(F)\preceq4N^2I$. If $\widehat h$ is the rounded vector, $|h-\widehat h|^2\le\epsilon^2/(2N^2)$. The exact exponential-family identity and the integral Taylor remainder yield

$$
 \begin{aligned}
 D_{\mathrm{KL}}(\nu_{N,h}\Vert\nu_{N,\widehat h})
 &=\psi_N(\widehat h)-\psi_N(h)-\nabla\psi_N(h)\cdot(\widehat h-h)\\
 &\le2N^2|\widehat h-h|^2\le\epsilon^2.
 \end{aligned} \tag{20w.7}
$$

Pinsker's inequality therefore bounds the decoder's rounding error by $\epsilon/\sqrt2\le\epsilon$ in total variation. Add (20w.6) by the triangle inequality. Each component of (20w.5) lies in $[-2e^{-\lambda_Nt},2e^{-\lambda_Nt}]$. Rounding this interval to mesh $\epsilon/N$ uses at most $2+4Ne^{-\lambda_Nt}/\epsilon$ coordinate values; multiplying the two bounds proves (20w.4). This also specifies a finite decoder by evaluating (20w.2) at the retained grid point. At (20w.3), $\lambda_N\sim\pi^2/N^2$, so $Ne^{-\lambda_Nt}=N^{5/9+o(1)}$. The logarithm of (20w.4) is $O(\log N)$ for the stated $\epsilon$. Finally $4^N/(2N+1)\le\binom{2N}N\le4^N$ gives the exact-state storage order. $\square$

The task here is the one-time full future configuration law at a declared lag and tolerance. The record requires access to the initial global Fourier coefficient, and the decoder is the finite distribution (20w.2). An autonomous recursively updated record, a sampler and their sensing, work and cyclic disposal costs are additional physical constructions. Total-variation accuracy on this growing alphabet supplies the metric in (20w.6); it is not an unnormalized logarithmic-loss bound. The exact-autonomy and intervention-sensitive records of Theorem 20u retain their distinct tasks.

<a id="642-proposition-3-complexity-adaptation-dynamics-model"></a>**6.4.2 Proposition 3 (Complexity Adaptation Dynamics Model)**

Assume $C(t)>\max\{C_{op},K_0\}$, $\hat C_{\mathrm{target}}(t)>0$, and that the trajectory remains in this physical response-law domain while the rate of change of complexity $C(t)=\langle\hat C_v\rangle(t)$ is proportional to the net driving force $\Psi(t)$:
$$
\frac{dC}{dt}=\eta_{adapt}\Psi(C(t),\hat C_{\mathrm{target}}(t),\lambda,\Gamma_0),
\qquad \eta_{adapt}>0.
\tag{30}
$$
Then Equations (24)–(26) imply
$$
\frac{dC}{dt}=\eta_{adapt}\left[
\Gamma_0\frac{\kappa_{\mathrm{eff}}}{\hat C_{\mathrm{target}}(t)}(\beta-PP(t))
-\lambda R'(C(t))
-\frac{r_I}{C(t)\ln2}
\right].
\tag{31}
$$
If $[\Psi]=[E][T]^{-1}[\mathrm{Complexity}]^{-1}$, then
$$
[\eta_{adapt}]=[E]^{-1}[\mathrm{Complexity}]^2.
$$
The model is restricted to the viable interval $(\alpha,\beta)$ before activation of Definition 22.

*Proof.* Equation (24) is
$$
\Psi=\Gamma_0\frac{\partial PP}{\partial C}-\lambda R'(C)-R_I'(C).
$$
Equations (25) and (26) give, respectively,
$$
\frac{\partial PP}{\partial C}
=\frac{\kappa_{\mathrm{eff}}}{\hat C_{\mathrm{target}}}(\beta-PP),
\qquad
R_I'(C)=\frac{r_I}{C\ln2}.
$$
Substitution of these two identities into (24), followed by multiplication by $\eta_{adapt}$ in (30), gives (31) term by term. Finally,
$$
[\eta_{adapt}]
=\frac{[dC/dt]}{[\Psi]}
=\frac{[\mathrm{Complexity}][T]^{-1}}
{[E][T]^{-1}[\mathrm{Complexity}]^{-1}}
=[E]^{-1}[\mathrm{Complexity}]^2.
$$
The positivity assumptions make both displayed reciprocal complexity factors well defined. ∎

*Interpretation:* Equation (30) specifies the local response of complexity $C(t)$ to the marginal imbalance $\Psi(t)$. Convergence to a unique interior optimum follows on the autonomous scalar branch satisfying Theorem 22; a changing task scale requires the separate joint-stability or tracking hypotheses appropriate to the coupled dynamics. The condition $\Psi=0$ alone asserts stationarity, not attraction or maximality. The dynamics depend explicitly on the current state $(C,\hat C_{\mathrm{target}})$, the benefit scale $\Gamma_0$, resource scarcity $\lambda$, performance parameter $\kappa_{\mathrm{eff}}$, informational overhead $r_I$, and marginal physical cost $R'$.

<a id="remark-4-interpretation-of-kappa_mathrmeff"></a>**Remark 4 (Interpretation of $\kappa_{\mathrm{eff}}$).**
The dimensionless performance-efficiency parameter $\kappa_{\mathrm{eff}}$, introduced in the Law of Prediction (Equation 22), can be expressed in terms of equilibrium quantities. At equilibrium the Adaptation Driving Force vanishes, $\Psi=0$ (Equation 18), and by definition (Equation 24):
$$
\Gamma_0 \,\frac{\partial PP}{\partial C} = \lambda R' + R_I'.
$$
Substituting Equation (25) for the derivative gives:
$$
\Gamma_0\,(\beta-\alpha)\, \frac{\kappa_{\mathrm{eff}}}{\hat{C}_{\text{target}}} \,e^{-\kappa_{\mathrm{eff}}(C^{*}-C_{op})/\hat{C}_{\text{target}}} = \lambda R'(C^{*}) + R_I'(C^{*}).
$$
Using Equation (22), we recognize $e^{-\kappa_{\mathrm{eff}}(C^{*}-C_{op})/\hat{C}_{\text{target}}} = (\beta-PP^{*})/(\beta-\alpha)$. Substituting this yields:
$$
\Gamma_0\,(\beta-PP^{*}) \frac{\kappa_{\mathrm{eff}}}{\hat{C}_{\text{target}}} = \lambda R'(C^{*}) + R_I'(C^{*}).
$$
Rearranging yields the equilibrium expression:
$$
\kappa_{\mathrm{eff}} = \frac{\hat{C}_{\text{target}}}{\Gamma_0\,(\beta-PP^{*})} \bigl[\lambda R'(C^{*}) + R_I'(C^{*})\bigr] \quad \text{(32)}
$$
Thus $\kappa_{\mathrm{eff}}$ is the target-complexity-weighted ratio of the marginal-cost sum $\lambda R'(C^*)+R_I'(C^*)$ to the power-equivalent remaining gap $\Gamma_0(\beta-PP^*)$. Holding the other displayed equilibrium quantities constant, a larger marginal-cost sum increases the inferred $\kappa_{\mathrm{eff}}$, while a larger $\Gamma_0$ decreases it. Because $C^*$ and $PP^*$ can co-vary with these parameters, Equation (32) alone supplies no total comparative-static conclusion along re-optimized equilibria.

**6.5 Stability, Response, and Target-Scale Control**

We analyze stability and sensitivity with respect to the registered task-scale coordinate. Estimation of external environmental difficulty is a separate identification problem.

<a id="651-theorem-21-adaptation-response-along-a-differentiable-equilibrium-branch"></a>**6.5.1 Theorem 21 (Adaptation Response along a Differentiable Equilibrium Branch)**

Write $T=\hat C_{\mathrm{target}}$. Assume $\Psi$ is continuously differentiable near $(C_*,T_*)$, and let $C^*(T)$ be a differentiable local equilibrium branch satisfying
$$
\Psi(C^*(T),T)=0,
\qquad
\Psi_C(C^*(T),T)\ne0.
$$
Then
$$
\frac{dC^*}{dT}
=-\frac{\Psi_T}{\Psi_C}\bigg|_{C=C^*(T)}.
\quad \text{(33)}
$$

*Proof.* Differentiate the identity $\Psi(C^*(T),T)=0$. The chain rule gives
$$
0=\Psi_C(C^*(T),T)\frac{dC^*}{dT}+\Psi_T(C^*(T),T).
$$
Division by the declared nonzero $\Psi_C$ gives Equation (33). The required partial derivatives follow from Equations (24)–(26).

*   **Derivative w.r.t. C:**

$$\frac{\partial \Psi}{\partial C} = \Gamma_0 \frac{\partial^2 PP}{\partial C^2} - \lambda R''(C) - R_I''(C) \quad \text{(34)}$$

Using Equation (25): $\frac{\partial^2 PP}{\partial C^2} = \frac{\partial}{\partial C} \left( \frac{\kappa_{\mathrm{eff}}}{\hat{C}_{\mathrm{target}}} (\beta - PP) \right) = - \frac{\kappa_{\mathrm{eff}}}{\hat{C}_{\mathrm{target}}} \frac{\partial PP}{\partial C} < 0$.

Using Equation (26), for the nonnegative overhead coefficient $r_I$ one has $R_I''(C)=-r_I/(C^2\ln2)\le0$, with strict inequality when $r_I>0$.

Substituting into Equation (34):

$$\frac{\partial \Psi}{\partial C} = - \Gamma_0 \frac{\kappa_{\mathrm{eff}}}{\hat{C}_{\mathrm{target}}} \left( \frac{\partial PP}{\partial C} \right) - \lambda R''(C) + \frac{r_I}{C^2 \ln 2} \quad \text{(35)}$$

For stability, we typically expect $\partial \Psi / \partial C < 0$ (Theorem 22).

*   **Derivative w.r.t. $\hat{C}_{\mathrm{target}}$:** Assuming $R'$ and $R_I'$ do not explicitly depend on $\hat{C}_{\mathrm{target}}$:

$$\frac{\partial \Psi}{\partial \hat{C}_{\mathrm{target}}} = \Gamma_0 \frac{\partial^2 PP}{\partial \hat{C}_{\mathrm{target}} \partial C} \quad \text{(36)}$$

Calculating the mixed partial derivative from Equation (25):

$$\frac{\partial^2 PP}{\partial \hat{C}_{\mathrm{target}} \partial C} = \frac{\partial}{\partial \hat{C}_{\mathrm{target}}} \left( \frac{\kappa_{\mathrm{eff}}}{\hat{C}_{\mathrm{target}}} (\beta - PP) \right) = \left( \frac{\partial PP}{\partial C} \right) \left[ -\frac{1}{\hat{C}_{\mathrm{target}}} + \frac{\kappa_{\mathrm{eff}} (C-C_{op})}{(\hat{C}_{\mathrm{target}})^2} \right]$$

Thus:

$$\frac{\partial \Psi}{\partial \hat{C}_{\mathrm{target}}} = \Gamma_0 \left( \frac{\partial PP}{\partial C} \right) \frac{1}{\hat{C}_{\mathrm{target}}} \left( \frac{\kappa_{\mathrm{eff}} (C-C_{op})}{\hat{C}_{\mathrm{target}}} - 1 \right) \quad \text{(37)}$$

*   **Result:** The sensitivity $dC^*/d\hat{C}_{\mathrm{target}}$ is given by $-(\partial \Psi / \partial \hat{C}_{\mathrm{target}}) / (\partial \Psi / \partial C)$. If $\partial \Psi / \partial C < 0$ (stability) and the relative complexity $(C-C_{op})/\hat{C}_{\mathrm{target}}$ is sufficiently large ($> 1/\kappa_{\mathrm{eff}}$), then $\partial \Psi / \partial \hat{C}_{\mathrm{target}} > 0$. In this regime where the relative complexity is sufficiently high, $dC^*/d\hat{C}_{\mathrm{target}} > 0$, indicating that an increase in the registered task scale $\hat{C}_{\mathrm{target}}$ leads to a corresponding increase in the optimal allocated complexity $C^*$. Identifying that change with external difficulty requires the innovation record specified in Definition 21.

 QED

<a id="652-theorem-22-existence-uniqueness-and-local-exponential-stability-of-the-pce-optimum"></a>**6.5.2 Theorem 22 (Existence, Uniqueness, and Local Exponential Stability of the PCE Optimum)**

Let $J\in C^2([C_{op},\infty))$ be strictly concave and satisfy
$$
\lim_{C\to\infty}J(C)=-\infty,
\qquad
J'(C_{op})>0.
$$
These hypotheses give a unique maximizer $C^*\in(C_{op},\infty)$. For the stability conclusion, assume additionally that $I=[a,b]$ is closed,
$$
C_{op}\le a<C^*<b,
$$
and that $J$ is $\mu$-strongly concave on $I$ for some $\mu>0$. Then:

1. $J$ has a unique maximizer $C^*\in(C_{op},\infty)$, and $J'(C^*)=\Psi(C^*)=0$.

2. For $\eta_{adapt}>0$, every solution of
$$
\dot C=\eta_{adapt}J'(C)
$$
with $C(0)\in I$ remains in $I$ and satisfies
$$
|C(t)-C^*|\le e^{-\eta_{adapt}\mu t}|C(0)-C^*|.
$$

*Proof.* The limit condition supplies $M>C_{op}$ such that $J(C)<J(C_{op})$ for $C\ge M$. Continuity gives a maximizer on the compact interval $[C_{op},M]$, hence on the full domain. Because $J'(C_{op})>0$, this maximizer is not the left endpoint and is therefore interior. Strict concavity gives uniqueness, and differentiability at the interior maximizer gives $J'(C^*)=0$.

For a differentiable strictly concave function, $J'(C)>0$ when $C<C^*$ and $J'(C)<0$ when $C>C^*$. Thus the vector field points toward $C^*$ at both endpoints of $I$, and solutions beginning in $I$ remain there. Strong concavity gives
$$
(C-C^*)\bigl(J'(C)-J'(C^*)\bigr)
\le-\mu(C-C^*)^2.
$$
Since $J'(C^*)=0$, for $W(t)=\frac12(C(t)-C^*)^2$,
$$
\dot W
=\eta_{adapt}(C-C^*)J'(C)
\le-2\eta_{adapt}\mu W.
$$
Multiplying by $e^{2\eta_{adapt}\mu t}$ and differentiating shows
$$
\frac{d}{dt}\left(e^{2\eta_{adapt}\mu t}W(t)\right)\le0.
$$
Hence $W(t)\le e^{-2\eta_{adapt}\mu t}W(0)$, and taking square roots proves the asserted bound. ∎

<a id="theorem-22b-exact-finite-pce-quotient-gap-and-descent-test"></a>**Theorem 22b (Exact Finite PCE Quotient, Gap and Descent Test).** Let $\mathcal X$ be a nonempty finite registered implementation census. Let $\sim$ identify exactly the implementations with the same retained response table and the same source-exhausted cost ledger. Assume that the submitted response and cost records admit terminating exact equality tests, so that $\sim$ and its finite quotient can be computed, and that the commensurate PCE potential $V:\mathcal X/\!\sim\ \to\mathbb R$ takes exact values with decidable comparison. Then exhaustive enumeration returns
$$
\mathcal E_*
=
\operatorname*{argmin}_{[x]\in\mathcal X/\sim}V([x])
\ne\varnothing.
\tag{22b.1}
$$
The selected class is unique exactly when $|\mathcal E_*|=1$, and in that case the strict finite gap
$$
\Delta_V
=
\min_{[y]\notin\mathcal E_*}
\bigl(V([y])-V([x_*])\bigr)>0
\tag{22b.2}
$$
exists, with $\Delta_V=+\infty$ when the quotient has one class. A deterministic update $T$ reaches $\mathcal E_*$ from every class in finitely many steps whenever it fixes $\mathcal E_*$ and satisfies $V(T[x])<V([x])$ outside $\mathcal E_*$. Every orbit then enters $\mathcal E_*$ in at most $|\mathcal X/\!\sim|-1$ steps.

*Proof.* A function on a nonempty finite set attains its minimum, and exact comparison returns all minimizers. If exactly one class minimizes, every finite positive difference to a competitor has a positive minimum, proving (22b.2). Along a nonterminal update orbit, $V$ strictly decreases, so no class repeats. There are at most $|\mathcal X/\!\sim|-1$ nonminimizing classes before entry. ∎

<a id="theorem-22c-coverage-dominance-promotion-and-hidden-competitor-obstruction"></a>**Theorem 22c (Coverage-Dominance Promotion and Hidden-Competitor Obstruction).** Let $\mathcal Y$ be the complete admissible retained-response/source-cost quotient, let $\mathcal X\subseteq\mathcal Y$ be a nonempty finite audited census, and let $V:\mathcal Y\to\mathbb R$. Suppose Theorem 22b returns $x_*\in\mathcal X$ as a minimizer. A coverage-dominance certificate is a verified map
$$
q:\mathcal Y\longrightarrow\mathcal X
\tag{22c.1}
$$
whose record gives, for every $y\in\mathcal Y$,
$$
V(q(y))\le V(y).
\tag{22c.2}
$$
Then $x_*$ is a global minimizer on $\mathcal Y$. It is the unique global quotient class when it is unique on $\mathcal X$ and the certificate additionally verifies
$$
V(q(y))=V(y)\Longrightarrow y=q(y)
\qquad(y\in\mathcal Y).
\tag{22c.3}
$$
If no condition constrains implementations outside $\mathcal X$, the audited finite data alone do not imply global minimality: adjoining one new quotient class $z$ with
$$
V(z)=V(x_*)-1
\tag{22c.4}
$$
preserves every response, cost, comparison and update entry on $\mathcal X$ while making $x_*$ nonglobal; defining the extended update by $T(z)=z$ completes the new terminal class without altering an old transition.

*Proof.* For any $y\in\mathcal Y$, finite minimality on $\mathcal X$ and (22c.2) give
$$
V(x_*)\le V(q(y))\le V(y),
$$
so $x_*$ is global. If $V(y)=V(x_*)$, both inequalities are equalities. Condition (22c.3) then gives $y=q(y)\in\mathcal X$, and uniqueness on $\mathcal X$ gives $y=x_*$. For the obstruction, extend the quotient and $V$ by (22c.4), retain every old entry, and set $T(z)=z$. The new class has lower potential, so the old census transcript is compatible with a completion in which its reported minimizer is nonglobal. The identity map on a complete finite census supplies a nonempty positive example of (22c.1)--(22c.3). ∎

<a id="theorem-22d-fixed-architecture-one-task-pce-realization-with-vertex-coverage-and-realized-descent"></a>**Theorem 22d (Fixed-Architecture One-Task PCE Realization with Vertex Coverage and Realized Descent).** Take the task of Theorem 19e with $\eta\in(0,\frac12)$ and the meter of Proposition 20c with parameters $T,\nu,E_q,N$. Register the implementation class in which every cycle runs as follows: the meter carrier holds the task bit $Y$; a sensor register receives $X=Y\oplus\xi$ by a CNOT from the carrier followed by a CNOT from a reservoir two-level element in its Gibbs state with excited population $\eta$; a guess register receives $\hat Y$ from a Markov kernel $\pi=(\pi_0,\pi_1)$, $\pi_x=\Pr(\hat Y=1\mid X=x)$, by an $X$-controlled copy from a reservoir element with excited population $\pi_x$; the strokes of Proposition 20c deliver the work (29e); the guess record is reset with $X$ retained, and then the sensor record is reset, both by Corollary 7.6r.1 in its zero-excess limit. Every register other than the meter carrier has degenerate Hamiltonian, and control is cyclic. Let $h$ be as in Proposition 20c.

1. **Registered quotient.** The retained response of an implementation in this class is its kernel $\pi$, and its source-cost ledger is a function of $\pi$. The retained-response/source-cost quotient of the class is the full square $\mathcal Y=[0,1]^2$, every point of which is realized, and
   $$
   PP(\pi)=\tfrac12+\bigl(\tfrac12-\eta\bigr)(\pi_1-\pi_0).
   \tag{22d.1}
   $$
2. **Source-complete potential.** The per-cycle energy ledger of the class has exactly three owners: the meter strokes, with net work (29e) balanced by their bath heat over the cycle; the guess reset, with heat $k_BT\,H(\hat Y\mid X)=\frac{k_BT}2\bigl(h(\pi_0)+h(\pi_1)\bigr)$; and the sensor reset, with heat $k_BT\ln2$. The copies, reservoir draws and controlled writes act on degenerate registers and exchange no energy. The commensurate PCE potential in watts is
   $$
   V(\pi)=\nu k_BT\Bigl[\ln2+\tfrac12\bigl(h(\pi_0)+h(\pi_1)\bigr)\Bigr]-\nu\bigl[W_N-E_q+E_q\,PP(\pi)\bigr].
   \tag{22d.2}
   $$
3. **Coverage and equality recovery.** $V$ is strictly concave on $\mathcal Y$, and its unique minimizer is the copy predictor $x_*=(0,1)$. On the audited census $\mathcal X=\{0,1\}^2$ of deterministic tables, Theorem 22b returns $x_*$ with gap $\Delta_V=V(0,0)-V(0,1)=\nu E_q(\frac12-\eta)$. The constant map $q\equiv x_*$ is a coverage-dominance certificate satisfying (22c.2)--(22c.3), so Theorem 22c makes $x_*$ the unique global quotient class of the registered class.
4. **Realized descent.** The update $T_{\mathrm{upd}}(x)=x_*$ on $\mathcal X$ fixes $x_*$, strictly lowers $V$ at every other class and enters $x_*$ in one step. For a registered law $\mu$ of the current table on $\mathcal X$, it is realized on the two-bit lookup register $(\pi_0,\pi_1)$ by the sequential reset of Corollary 7.6r.1 for $\mu$, first $\pi_0$ with side information $\pi_1$ and then $\pi_1$, followed by one Pauli $X$ on the second bit; its mean bath heat tends to $k_BT\,H(\mu)$ in the zero-excess limit. When the current table itself is registered, $\mu$ is a point mass, the protocol consists of the flips selected by that table, and it exchanges no heat. A common cyclic implementation that sends every table of $\mathcal X$ to $x_*$ without retaining a record of the input table has mean bath heat at least $k_BT\,H(\mu)$ on every input law $\mu$; for the uniform law this is $2k_BT\ln2$, so its heat on some table is at least $2k_BT\ln2$. An implementation that retains a controller record of the input table carries that record as a further retained register, whose Definition-28 reset belongs to the ledger.
5. **Second-law consistency.** In the quasistatic limit with $E_q=k_BT\ln\frac v{1-v}$,
   $$
   V(x_*)=\nu k_BT\bigl[h(\eta)+(1-\eta)\ln\tfrac{1-\eta}v+\eta\ln\tfrac\eta{1-v}\bigr]>0,
   $$
   so the attained optimum consumes net power.
6. **Architecture boundary.** The sensorless constant predictor, which runs the same meter with a constant guess and no sensor register, lies outside the registered class and has potential
   $$
   V_0=-\nu\bigl(W_N-\tfrac{E_q}2\bigr),
   \qquad
   V(x_*)-V_0=\nu\bigl[k_BT\ln2-E_q\bigl(\tfrac12-\eta\bigr)\bigr],
   \tag{22d.3}
   $$
   so $V_0<V(x_*)$ exactly when $E_q(\frac12-\eta)<k_BT\ln2$.

Thus the quotient, source-complete commensurate potential, coverage and equality-recovery records, and realized strict-descent update of Theorems 22b--22c are populated on one registered formal thermodynamic class, with the update exchanging no heat when selected from a registered table and charging the reset heat $k_BT\,H(\mu)$ of a registered table law $\mu$ otherwise. By item 6 and Theorem 22c, global minimality over a larger admissible class requires a coverage certificate for that class.

*Proof.* A reservoir element with gap $k_BT\ln\frac{1-\pi_x}{\pi_x}$ has excited population $\pi_x\in(0,1)$, and $\pi_x\in\{0,1\}$ is written deterministically, so every $\pi$ is realized; the implementations with one kernel share their retained response and every ledger entry below, which gives the quotient. Enumerating $(Y,\xi)$ gives $PP=\frac12[(1-\eta)(1-\pi_0)+\eta\pi_0+\eta(1-\pi_1)+(1-\eta)\pi_1]$, which is (22d.1). The CNOT gates and controlled copies change only degenerate registers and leave their controls unchanged, so they exchange no work; the meter strokes deliver (29e) by Proposition 20c. Since $X$ is uniform, $H(\hat Y\mid X)=\frac12(h(\pi_0)+h(\pi_1))$, and Corollary 7.6r.1 gives this reset heat in the limit. After the meter return and the guess reset, no retained record depends on $X$, because the carrier has been rethermalized and the noise element is a reservoir element; hence the sensor reset heat tends to $k_BT\,H(X)=k_BT\ln2$. Multiplying the per-cycle ledger by $\nu$ gives (22d.2). The function $h$ is strictly concave on $[0,1]$, so $V$ is the sum of an affine function and a strictly concave function of $\pi$. If $y\in\mathcal Y$ is not a vertex, it is an interior point of a segment $[a,b]\subset\mathcal Y$, and strict concavity gives $V(y)>\min\{V(a),V(b)\}$; the minimum over $\mathcal Y$ is therefore attained only at vertices. At the vertices $h$ vanishes, and $PP$ equals $1-\eta$ at $(0,1)$, $\frac12$ at $(0,0)$ and $(1,1)$, and $\eta$ at $(1,0)$, so $V(0,1)<V(0,0)=V(1,1)<V(1,0)$ because $E_q>0$ and $\eta<\frac12$. This gives the unique minimizer, the gap and $V(y)>V(x_*)$ for every $y\ne x_*$, which is (22c.2)--(22c.3) for $q\equiv x_*$. For item 4, $V(x_*)<V(x)$ for $x\ne x_*$, so $T_{\mathrm{upd}}$ is a strict-descent update that enters $x_*$ in one step. The sequential reset returns both bits to $0$ with heat tending to $k_BT[H_\mu(\pi_0\mid\pi_1)+H_\mu(\pi_1)]=k_BT\,H(\mu)$ by Corollary 7.6r.1 and the chain rule, and the Pauli $X$ acts on a degenerate register without energy exchange. For a point mass $\mu$ every conditional law is deterministic, so Corollary 7.6r.1 applies controlled flips or the identity on degenerate registers and exchanges no heat. For the lower bound, let a common cyclic implementation act unitarily on the register, its auxiliary resources and a Gibbs bath at temperature $T$. The register starts with entropy $H(\mu)$, independent of the auxiliary resources, and ends in the pure table $x_*$, while cyclic control returns the auxiliary marginal to its initial state; subadditivity then shows that the entropy of the register and auxiliary resources falls by at least $H(\mu)$, and the Landauer bound of Reeb and Wolf cited in Definition 28 gives mean bath heat at least $k_BT\,H(\mu)$. The mean heat of a fixed implementation is linear in the input law, so its average over the four tables equals its value on the uniform law, which is at least $2k_BT\ln2$. For item 5, $W_\infty=k_BT\ln(2v)$ by Proposition 20c, and substitution into (22d.2) at $x_*$ gives the displayed value, which is positive because $h(\eta)>0$ and the relative-entropy term is nonnegative by Gibbs' inequality. For item 6, the constant guess is written deterministically on a degenerate register and needs no reset heat, and $PP=\frac12$, so (29f) gives $V_0$; at the vertex $x_*$, (22d.2) gives $V(x_*)=\nu k_BT\ln2-\nu(W_N-\eta E_q)$, and subtraction gives (22d.3). ∎

<a id="theorem-22e-complete-native-source-pce-quotient-with-paid-descent"></a>**Theorem 22e (Complete Native-Source PCE Quotient with Paid Descent).** The following task-independent native collision source admits every finite well-typed program, inventory, decision tree and supported schedule. Its faithful response/source-cost decoder, complete potential, equality recovery and attained optimum satisfy Theorem 22c. For each registered ready implementation, the realized protocol family fixes the canonical optimum by identity and otherwise performs the fully paid archival rewrite. One common forty-three-trial continuation comparison proves strict descent including the entire transition debit.

#### 22e.2. Source platform fixed before the prediction task

##### 22e.2.1 Accessible physical resources

Fix a controlled isolated digital collision service with a finite native alphabet

$$
X,\ H,\ T,\ \mathrm{CNOT},\ \mathrm{SWAP},
$$

acting on one or two qubits, and their standard fixed algebraic matrices. X, H, and T may act on any admitted address; CNOT has ordered addresses. Arbitrary finite inventories, finite interconnects, finite native instruction words, finite classical decision trees, coherent controls compiled into these words, and any finite number of supplier-supported blank-swap resets are admitted. No upper bound on program length or ancillary dimension is imposed across implementations.

All computational/storage registers have zero Hamiltonian at the beginning and end of each native pulse. For each native matrix $U$ fix once a bounded Hermitian logarithm $G_{U}$ with $\exp(-iG_U\tau/\hbar)=U$. A smooth scalar pulse $a(t)G_U$, supported in one native clock slot and with the registered integral, realizes $U$ exactly. The actual controller supplies this calibrated alphabet; arbitrary analogue pulse truncations are not exposed at the user interface. Native calls are autonomous once accepted. An abort request cannot open or shorten an accepted pulse; it is serviced after completion. The base clock slot $\tau$, relative launch/answer timing, and each native pulse waveform are fixed calibrated source data. The zero-idle one-call trial launches at its cue-arrival boundary and answers at the fixed end of that slot. Every other supported timing choice consists of extra discrete paid idle/service slots or an additional separately priced reservation and therefore contributes to $R>0$. No second zero-extra CNOT clock or waveform is exposed. Scheduling, idling, address selection, and every *supported* clock choice remain freely variable within these independently stated source rules.

This is an ideal controlled source, not an autonomous-clock theorem. Its restriction is a supplied actuator's access interface, not a condition on which circuits achieve good prediction. The same source runs arbitrary computations and identity operations at the same prices.

##### 22e.2.2 Every call has an actual paid completion boundary

A call includes its computational pulse and a supplier-controlled completion source. A fresh supplier register begins in $|0\rangle$ with zero stored energy and ends in $|1\rangle$ with a calibrated positive energy gap. The register is transferred through a one-way delivery port to the supplier's charged-receipt bank. It is outside the client's subsequent interaction algebra. This is a real retained output, not a fictitious dissipative heat assignment. The receipt charge, clock service, and native peak/control reservation are separately metered positive endpoint loads. Their sum is one energy unit $E>0$ per accepted invocation. The work reservoir loses exactly this delivered energy; its initially available energy is not charged again as consumed work. A separate peak-capacity reservation may be priced, but never by silently adding the battery's whole initial energy to $E N$. Their fractions may be fixed, for example $E/2$, $E/4$, $E/4$.

The computation pulse itself exchanges zero signed net work: its Hamiltonian vanishes at both ends and the joint data evolution is unitary, so the integrated work equals the endpoint energy change, namely zero. Its finite transient energy and power are provided by the paid native reservation. Exactly E is therefore consumed and retained in the completion records per call. Do not add E a second time as a guessed heat or dimension cost. The source/receiver state, work source, and all endpoint records have named owners.

A controlled identity, an unsuccessful measurement, a no-click interrogation, and a branch whose logical control is false still consume a complete invocation and E. Counting only logical state changes would invalidate the theorem. The client cannot retrieve or discharge the delivered receipt. Such access would be a different source interface and is explicitly tested below.

##### 22e.2.3 Stocks, programs, clocks, and records

Within each trial the paid stock/reservation and controller entries are billed once; a reused register's next-trial reservation is a new actually delivered service charge, while previously delivered task outputs remain consumed outputs. Initial available work-battery energy is never mistaken for a consumed stock fee. The ordinary service fee B0 includes the task's two physical ports, a standard eight-bit command bank (one native operation or STOP on the mandatory ports), the fixed source and fixed final readout, and their actual stock/clock/source charges. The command slot accommodates one native operation or STOP. Before the cue arrives it is in a registered deterministic ready configuration. Distinct native command labels remain part of the exact source record; they are not discarded merely because they produce the same score.

Every optional supplied storage/control/program bit, optional branch/measurement record, additional reserved address/link, and each additional native idle slot has a separately delivered positive fee record of at least E. A command word longer than the base slot uses additional charged physical program cells. Every finite decision tree reserves its complete possible working inventory at preflight; these are actual delivered reservation charges, paid even when a particular branch does not use a reserved cell. There is no unreserved mid-run stock source. In particular an arbitrarily rare randomized branch still needs a paid physical seed/record and program description. This fixed reservation contract applies to every native computation, not only prediction. Initial optional stocks may have arbitrary internally correlated states preparable by the native source, but must be independent of the future task sample. Their preparation pulses and source stocks are included. A nontrivial randomized STOP/use decision requires an optional seed or branch record. A decision depending on a target register requires an already paid physical interrogation; no free external observer, data-dependent clock, or null-result side channel is present.

The only supported optional readout is a computational-$Z$ instrument. It is implemented by a native CNOT into a supplied blank pointer and the supplier's fixed $Z$ readout of that pointer; its exact instrument has Kraus operators $|z\rangle\langle z|$ on the measured data with the retained pointer label $z\in\{0,1\}$. The physical pointer, readout-receiver record, clock, and control are explicitly supplied and charged: at least one $E$-priced native invocation and one optional $E$-priced record reservation. All receiver records remain source-owned in the decoder. Equivalently the CNOT and subsequent controlled operations can be deferred coherently until the final registered pointer readouts. An arbitrary-basis instrument is supported only if compiled using the native gates and this fixed readout. There is no free/no-record measurement primitive. Thus an optional readout cannot enter the $R=0$ one-call census. Adaptive readout is implemented by this actual instrument with a retained record; all nontrivial branch records use a charged optional register. A coherent controlled operation costs a full native call regardless of its logical control. Thus, with no optional resource and no idle time, a zero- or one-call service has a deterministic fixed schedule. This fact is a direct interface property, not a probabilistic assumption applied after optimization.

Let $R(y)\ge0$ be the sum of every optional stock, program, routing, idle-clock, controller, return/reset, and archive charge not already in $E N$. Every physical fee component is positive and source-owned. If any optional preflight cell is supplied, its charge is at least $E$. If no such cell is supplied, the remaining supported housekeeping and idle operations have a deterministic integer count and unit price at least $E$. Therefore either $R=0$, or $R\ge E$; this is not an invalid inference from a possibly fractional expected count. The number $m$ of optional ready program/control/storage cells obeys $m E\le R$. No logical erasure is free: a reset may swap into a supplied pure blank and retain the displaced state as an owned archive. Both the blank and the call are charged. Full-rank finite thermal baths are not a native input of this isolated platform. This is a physically stated source restriction; the result is not asserted for an enlarged thermal platform.

An active native interaction is accessible only through the source's paid call boundary. All direct reads/writes of cue or answer ports, partial pulses, free rewiring of the port identities, and unregistered input-dependent timing are excluded by that interface. Alternative physical hardware with another actuator is outside this *declared source*, not proved impossible in nature.

##### 22e.2.4 Management sources and explicit physical dilation

The task-independent management catalogue additionally supplies stock, idle-clock, reservation, and archival-custody operations. Custody acts as identity on a named data cell and flips its supplier-owned access tag from client to archive. The source dispatcher thereafter excludes that tagged address from client operations. The actual state remains at its original address, now owned and retained by the supplier. This does not move, copy, erase, or reset data. One custody invocation costs E including its clock, tag, and completion-record resource. Each preflight cell has its own supplier management port; thus custody does not require data routing along the client computational interconnect. A finite inventory is a finite assembly of these independent local ports.

For clarity, a computational-call dilation on data $D$ and three supplier fee qubits is $U_{D}$ tensor $X_{1}$ tensor $X_{2}$ tensor $X_{3}$, with the supplier command/reference unchanged. Each $X_{j}$ is executed while its storage Hamiltonian is zero; then its gap is smoothly raised to $e_{j}$, with $e_1+e_2+e_3=E$, while it remains in $|1\rangle$. The exact output is $U\rho_{D}U^*\otimes|111\rangle\langle111|$ and the actual work is $\sum e_j=E$. The finite pulse controller returns to its registered state; its common native reservation and clock are precisely $e_{2}$ and $e_{3}$, not new unpriced debits. The delivered qubits are retained in the supplier bank and are outside all future client gates. Stock and reservation charges have the same final-load construction, with their actual supplied states/capacity entered separately. Custody adds the supplier tag flip and the same $E$-valued receipt load while acting identically on the data. This is an explicit finite ideal controlled source with a one-way accessible-algebra boundary. Supplied pure stocks are incoming resources with a paid boundary, never asserted to arise from free finite-temperature reset.

##### 22e.2.5 Complete admissible class and exact decoder

An implementation is any finite well-typed source program together with its actual finite resource inventory, source-state preparation, clock schedule, branch records, native interactions, delivered receipts, and declared return/archive boundaries. It must satisfy the task interface below. All finite words and all finite decision trees generated by these native operations are admitted, including wasteful and failing predictors. There is no restriction to a desired optimizer's architecture, no bound chosen from its score, and no restriction to Gaussian or deterministic predictors.

The decoder D is physical execution semantics: expand the finite instruments into Kraus branches, multiply their exact algebraic matrices, include every supplied mixed-state component and retained outcome, and list every endpoint fee record and work/clock owner. It returns the complete retained response table and the complete vector-valued source-cost ledger. A finite decision tree is decoded by induction on its nodes. Each native source operation has exactly the described semantic and cost entry; concatenation composes channels and adds the actual debits. Every supported source history has one such finite description by the interface grammar. Conversely each well-typed description has its native physical realization. This proves surjective source coverage, not merely enumeration of a favorable subcensus.

Define y~z precisely when these retained response tables and complete cost-ledger records agree (with only the registered physical address relabelings allowed). D is faithful to this quotient by definition, but its coverage and cost equations follow from the independent source grammar and first-law calculation. Optional records are never traced out of D if the source retains them. Exact algebraic arithmetic makes finite equality decidable. This statement is model-relative; an arbitrary unprovided analogue source is not a string in this platform.

#### 22e.3. Actual prediction task and its complete fixed source

Let $Y$ be uniform on $\{0,1\}$. Let $\xi$ have probability 1/4 of value 1, independent of $Y$, and set $X=Y\oplus\xi$. The supplier delivers only $X$ to a fixed cue port $I$. $Y$ and all noise-generation records remain inaccessible until the answer has been delivered. The answer port $O$ is a distinct physical port initially in $|0\rangle$. The task requires returning $I$ unchanged on each classical input, delivering the answer bit $G$ from $O$, and retaining every optional controller/output record. Merely renaming $I$ as $O$ is not an implementation.

This source is finite and explicit: draw three independent fair degenerate mixed bits $Y,A,B$, use a Toffoli into a blank to form $\xi=A B$, and copy $Y\oplus\xi$ into $X$. The supplier-only Toffoli permutation $F$ is implemented directly by the fixed bounded generator $G_F=\pi\hbar(I-F)/(2\tau)$, since $F=F^*=F^{-1}$ and $\exp(-iG_F\tau/\hbar)=F$. Its separate fixed completion charge is included in $B_0$. This fixed inaccessible source-preparation operation is not a newly exposed predictor gate. Its entire preparation, the supplied mixed and pure stocks, the noise records, and the final target reveal/readout are in $B_0$. None are supplied to the predictor before its answer. The exact density of $(Y,X)$ is $(3,1,1,3)/8$. Source preparation is fixed for every competitor and no supplier source is omitted from the ledger.

The predictor is not obliged to acquire or use the cue. STOP and constant predictions are admitted. The cue interface's return condition is a service condition, not a demand that the algorithm be CNOT. Arbitrary supported quantum/classical implementations may satisfy it.

Let

$$
\pi_x = \Pr(G = 1\mid X = x),\quad d = \pi_1-\pi_0,\quad \delta = 1/4.
$$

Then, for every implementation,

$$
\mathrm{PP} = \Pr(G = Y) = 1/2+\delta d.
\tag{22e.3.1}
$$

Use a task-independent energy-valued benefit award $\Gamma=8E$ per successful trial. This is a utility scalarization, not energy extracted from the source. The particular task may be chosen with knowledge of the source; no historical ignorance condition is imposed. The source operation prices themselves do not refer to PP, $d$, or an optimizer.

#### 22e.4. All-source lower bound, including randomized access

Let $N$ be the number of accepted predictor native calls, and let $a=\Pr(N\ge1)$. The event $N=0$ is independent of $X$: before any call the controller, its seeds, clocks, and the answer port are independent of the inaccessible task bit; dependence of an invocation/abort time on $X$ would itself require an already counted interaction. No-collision evolution is identity on the isolated ports. Thus the $N=0$ answer law is independent of $X$. Conditioning on the complementary event gives

$$
d = a\,d_1,\quad -1\le d_1\le 1,\quad \text{hence } d\le a\le \mathbb{E}[N].
\tag{22e.4.1}
$$

This proof also covers seeds with arbitrary initial correlations among themselves, since they are independent of the task. It does not count only active logical branches. If $N=0$ is impossible, the assertion reduces to the ordinary data-processing bound $d\le 1$.

The complete one-trial potential in energy units is

$$
V(y) = B_0+E\,\mathbb{E}[N]+R(y)-8E(1/2+\delta d).
\tag{22e.4.2}
$$

All acquisition, representation, processing, updates executed during the trial, maintenance, clock, ancillary, reset, source, and output costs have an entry in B0, E N, or R. V is the declared energy-valued service objective, not actual watts divided by each implementation's differing elapsed duration. Variable duration is positively priced by the fixed clock/idle service; no rate-dynamics or implementation-dependent rescaling is inferred. The zero endpoint work of a computational pulse is not a claim of free stocks or free clocks. No actual debit is replaced by a circuit dimension.

The one-call native CNOT $I\to O$, with no optional stock or delay, returns $X$ unchanged and delivers $G=X$. Denote its full decoded quotient class by $x^*$. It has $a=N=d=1$, $R=0$ and

$$
V^{*} = B_0+E-8E(3/4) = B_0-5E.
\tag{22e.4.3}
$$

For every admitted implementation, exactly

$$
\begin{aligned}
&V(y)-V^{*}\\
&\quad = E(\mathbb{E}[N]-a) + E(1-a) + 2E(a-d) + R(y) \ge 0.
\end{aligned}
\tag{22e.4.4}
$$

The coefficients use $\Gamma\delta=2E$. More generally they are $E$, $\Gamma\delta-E$, $\Gamma\delta$ when $\Gamma\delta>E$. This is a complete source inequality, not an assumption on unknown tariffs. The random mixture “CNOT with probability $\epsilon$, STOP otherwise” has $a=d=\mathbb{E}[N]=\epsilon$, giving gap $E(1-\epsilon)+R$; it is correctly included.

#### 22e.5. Full equality recovery and a finite audited census

Equality in (22e.4.4) forces

$$
a = 1,\quad N = 1\text{ almost surely},\quad d = 1,\quad R = 0.
\tag{22e.5.1}
$$

Since $0\le\pi_x\le1$, $d=1$ forces $\pi_{0}=0$ and $\pi_{1}=1$. More is needed than that score identity. $R=0$ forbids every optional stock, branch record, extra program cell, route, idle slot, and reset/archive. A one-call no-extra implementation is therefore one of the finite native operations on the two mandatory ports with the base command slot and no alternative hardware. Enumerating that exact census gives:

- CNOT $I\to O$: cue returned, $G=X$, $d=1$;
- CNOT $O\to I$: identity on the ready support, $G=0$, $d=0$;
- $X$/$H$/$T$ on $O$: a constant or cue-independent answer, $d=0$;
- $T$ on $I$: same classical cue, constant answer, $d=0$;
- $X$/$H$ on $I$ or $\mathrm{SWAP}(I,O)$: fail the explicit unchanged-cue task condition and are not qualifying task implementations.

Any source-supported identity call is additionally $d=0$. The program and completion records are retained in this enumeration. Only the specific native CNOT entry attains (22e.5.1). Its joint state on $(Y,X,G)$ is the fixed source law tensored with the deterministic record $G=X$; its source command, completion loads, clock, and stock/return owners are exactly the canonical ones. There is no hidden one-call SWAP minimizer with a different cue aftermath. Thus equality recovers the full response AND full cost ledger, not merely PP or their scalar sum.

Let $X_{\mathrm{census}}$ contain STOP and every admitted zero-extra one-call native entry. It is finite and is independently exactly decoded. The coverage map $q$ sends every nonminimal class to $x^*$ and fixes $x^*$. Equation (22e.4.4) proves $V(q(y))\le V(y)$ for every member of the complete platform quotient, and equality implies $y=q(y)$. This is precisely (22c.1)–(22c.3). The map $q$ is not claimed to preserve a nonoptimal predictor's response; $D$ preserves it, and $q$ deliberately changes it as in Theorem 22d.

#### 22e.6. Uniform operating gap

There is a positive gap on the full platform, despite the admission of arbitrary randomization and arbitrary finite sizes.

- $R>0$ implies $R\ge E$ and hence $V-V^*\ge E$ by (22e.4.4).
- If $R=0$ there is no optional seed or branch record and no delay. The source program has a deterministic finite call count. $N=0$ gives gap $E$. $N\ge 2$ gives $V-V^*\ge E(N-1)\ge E$ using $\mathrm{PP}\le3/4$. $N=1$ is the finite census in section 5; every admitted nonoptimal entry has $d=0$ and gap $2E$.

Consequently

$$
y \ne x_*\text{ implies } V(y)-V^{*} \ge E.
\tag{22e.6.1}
$$

Allowing arbitrary continuous free controller amplitudes or free randomized scheduling would destroy this particular proof. They are not supported operations of the declared native interface; the falsifier tests record the distinction.

#### 22e.7. Actual update with its entire transition debit

For each registered noncanonical implementation invoke the following paid archival rewrite. For the already registered canonical implementation select identity and order no management service. This is the registered-description protocol mode of Theorem 22d, with no free autonomous recognizer. The complete selection and its correction are proved below. The rewrite acts at the ready boundary, retains the old state and pays every transition output.

The management catalogue in section 2.4 provides its generic “retire register” custody operation, independent of the prediction task: disable future client interactions with a named register while leaving its state unchanged in place, mark its ownership as retained archive, and deliver an E-valued archival service receipt. Its physical action is a unitary permutation of a supplier ownership tag, with the data register untouched. The client has no later access to archived addresses; the supplier keeps the actual state and physical address. No data transport, cloning, entropy erasure, or thermalization occurs. A tag and a fee are supplied for each retired cell. Ideal zero-Hamiltonian isolated storage has no additional energy drift; its capacity/reservation is paid once at custody transfer. This is a finite source operation, not a deletion convention.

For an arbitrary finite ready implementation $y$, use the following explicit update. Let $m$ be its optional ready program/controller/storage cell count; $m E\le R$. Keep all old states intact.

1. Supply eight fresh blank qubits: 8E.
2. Write the canonical eight-bit native CNOT command into them using at most eight X calls: at most 8E.
3. SWAP the eight installed base-command cells with those eight fresh cells: 8E. The installed bank is now canonical; the complete old bank, even if unknown, has been moved unitarily into the new physical cells.
4. Invoke custody on each of those eight old-bank cells: 8E. They retain the old command state, without erasure.
5. Reserve eight fixed management-command/verification tags, including the source controller's routing/activation record: 8E. The source command-slot clock and native-call control costs themselves were already included in each E-priced call. These extra fixed tags are explicitly paid, not assumed free.
6. For each of the m optional cells, invoke custody once and reserve one management-address/ownership record: 2m E. The supplier management port is local to that cell, so neither its unknown data nor a quantum state is routed through the client graph. The old physical inventory remains in place with its exact state.

For every joint state $\rho_{BA}$ of the old eight-bit bank $B$ and all other old registers $A$, including correlations with an outside retained reference, the eight SWAPs implement exactly $\rho_{BA}\otimes|p^*\rangle\langle p^*|_C\to|p^*\rangle\langle p^*|_B\otimes\rho_{CA}$. Custody changes only known supplier access tags and leaves $\rho_{CA}$ intact. This proves the update for a common unknown program law as well as for a registered point-mass program; it never invokes an uncharged many-to-one reset.

The instruction list is finite. Its addressing is the supplier's already registered preflight directory; its additionally retained per-cell management record is explicitly charged in step 6. No hidden variable-length program is erased. Native setting/control pulses and clock slots are paid in the stated per-call source package. Fixed verification tags are classical management records independent of the future task sample. Any unused part of the conservative eight-tag reserve remains a genuinely paid reserve.

Thus the selected registered-description family has an actual source-supported realization satisfying

$$
0 \le D_y \le 40E+2mE \le 40E+2R(y),\quad D_{x_*} = 0\text{ for the selected identity member}.
\tag{22e.7.1}
$$

The upper bound is an inventory count, not a conjectural cost of a generic program rewrite. It relies on retaining the old bank and on local archival custody; it would not apply to an added requirement to thermally erase every archive.

The repeated service starts a new independent supplied sample at each ready boundary; it does not impose an unmentioned externally fixed wall-clock deadline during management. Management clock slots are paid in $D$. Choose one common service horizon $H=43$ trials, independent of $y$. With $\Delta(y)=V(y)-V^*$, equations (22e.4.4) and (22e.6.1) give $R\le\Delta$ and $E\le\Delta$ for $y\ne x^*$. Hence

$$
D(y) \le 40E+2R \le 42\Delta < 43\Delta.
$$

Therefore the ACTUAL paid update satisfies

$$
D(y)+H\,V(x_*) < H\,V(y)\qquad \text{for every } y\ne x_*,
\tag{22e.7.2}
$$

while it fixes x* at zero cost. Every output, old control record, and consumed archival stock is still in the transition ledger. The updated operating apparatus is canonical; the archive is a paid transition output, not a free reusable blank or an omitted subsystem.

This is a one-step cost-inclusive strict-descent theorem for a declared 43-trial continuation service. The horizon, native fees, and archive service are fixed for the entire complete class. It does not select a different amortization period for each competitor. Nor does it claim that a single trial repays every nonzero adaptation transaction. The operating potential is V; the action-value inequality (22e.7.2) includes the entire realized transition cost. There is no nonattainment argument here: the minimum is attained by an actual finite source and the descent is actually realized.

#### 22e.7A. Registered-description selection and unknown-law boundary

#### 22e.Proposition: selected protocol family

Fix the full native source and task of sections 22e.2–22e.3. Let Y be its complete quotient of ready operating implementations. Let `x*` be the unique zero-extra one-CNOT class and write

$$
\Delta(y) = V(y) - V(x_*).
$$

Each implementation is accompanied by its registered finite description `r_y`, containing its actual source program, inventory, preflight directory, and clock data. A family of protocols is selected from that already registered implementation description as follows:

- If $y=x_*$, select the identity protocol: do not order a management operation, reserve a new management stock, or execute an idle slot.
- Otherwise select exactly the six-step archival protocol of section 22e.7, applied to the registered optional-cell directory.

This is a selection **between physical protocols**, of the kind expressly allowed by original Theorem 22d. It is not an additional native controlled gate testing the quantum bank at run time. There is no claim that executing a general physical classifier has zero cost. If an autonomous device is required to read an unknown bank and choose a branch, that is a different protocol with its own source and cost obligation.

For the canonical case, recognition from a registered description is elementary: the equality theorem identifies precisely the no-extra-inventory/no-extra-clock native CNOT from I to O, with the prescribed command and waveform, up to the already permitted physical address relabelings. One need not decide arbitrary program equivalence, execute the predictor, or measure its bank. Equivalently, define the family mathematically on registered quotient classes and choose its identity member when the registered class is `x*`, exactly as in the original known-table branch. This is not a claim of an unpriced physical selection mechanism.

For a fixed registered noncanonical description, the rewrite does not need knowledge of the actual optional data or of correlations with an outside reference. The identity

$$
\begin{aligned}
&\rho_{BA}\otimes|p^{*}\rangle\langle p^{*}|_C\\
&\quad \to |p^{*}\rangle\langle p^{*}|_B\otimes\rho_{CA}
\end{aligned}
$$

holds under the eight disjoint SWAPs, by linear extension from the complete basis permutation and identity action on A. Custody acts on ownership tags and leaves the archived state intact. Selection must not be performed separately on unobserved components of an unknown law. A registered implementation with optional random control is one admitted implementation, carrying its entire paid reservation and with the protocol chosen for that implementation.

#### 22e.Registration, selection, and the comparison boundary

This is an **externally controlled registered protocol family**, exactly the known-table mode of original Theorem 22d. The theorem quantifies over its individually specified members; it does not supply a single physical device that computes which member to run. In particular, a mathematical case distinction is not being billed as a free physical computation.

The comparison begins at the already registered ready boundary of the native source. The eight-bit base command and its source record are part of the fixed B0 service. Every optional program/controller/storage cell and its preflight directory is already supplied and charged in R; the update uses the existing registered directory and explicitly pays its additional per-cell management records. No new unbounded description is copied into an uncharged register. Those prior source charges remain in the complete ledger and are not refunded when an implementation is retired.

The family index is fixed as part of the externally specified experiment/protocol, rather than obtained by a run-time inspection of an unknown bank. Thus this construction has no new common physical recognizer or unbounded classification computation whose debit could be omitted. For each selected nonidentity member, the actual native execution, command setting, routing, clocks and fixed verification/activation tags are all charged by the itemized $D_{y}$. The identity member orders no such service.

If an implementation also supplies a fixed external protocol-label/registration reservation $C_{\mathrm{reg}}$ at that same ready boundary, retain it as an actual common setup entry on **both** candidate continuation services, including the service that leaves y in place. Then the explicit comparison is

$$
C_{\mathrm{reg}} + D_y + 43V(x_*) < C_{\mathrm{reg}} + 43V(y).
$$

The cancellation does not make $C_{\mathrm{reg}}$ free or erase its owner. It only records a common already supplied resource. This observation is not a license to replace an unknown y-dependent selection cost with a constant: any new physical classifier, reading operation, or controller with variable run time would require its own proof and debit. Such a combined autonomous system is not the registered-family result and is not asserted here.

#### 22e.Source and cost proof

For $y=x_*$, the selected identity leaves the operating source unchanged and consumes no transition service. Hence $D_y=0$ exactly.

For $y\ne x_*$, let $m$ be the number of optional ready program/controller/storage cells in the registered preflight directory. The source contract proves $mE\le R(y)$. The update consumes:

- $8E$ in fresh command blanks;
- $wE$ in X calls, where the fixed canonical command has $w\le 8$;
- $8E$ in command-bank SWAPs;
- $8E$ in custody of the old bank;
- $8E$ in the explicitly paid fixed management/verification reserve;
- $2mE$ in optional-cell custody and management records.

Therefore

$$
D_y = (32+w+2m)E \le 40E + 2R(y).
$$

The actual source supports every operation on this list, including local per-cell management access. Old command/optional states are retained, never erased. Already supplied data and outside references remain intact. Management time has no unregistered external deadline and is paid by the call and reservation charges. Permanent archived outputs remain in the transition ledger; they are not reusable ready blanks or disappeared subsystems.

The theorem is about the **operating configuration** plus an explicit transition-output ledger. It does not assert that the complete closed universe, including the changed work storage and newly delivered fee/archive records, has returned to its old state. The original update-with-retained-record option likewise allows an operating update with owned transition outputs.

The complete all-source inequality gives

$$
\Delta(y) = E(\mathbb{E}[N]-a) + E(1-a) + 2E(a-d) + R(y),
$$

so $R(y)\le\Delta(y)$. For every noncanonical class, the full source's reservation and equality census also give $E\le\Delta(y)$. Consequently

$$
D_y \le 40E + 2R(y) \le 42\Delta(y) < 43\Delta(y),
$$

and thus

$$
D_y + 43V(x_*) < 43V(y)\qquad \text{whenever } y\ne x_*.
$$

The family fixes `x*`, reaches the canonical operating configuration in one step from every other registered implementation, and includes its entire transition debit in one common 43-trial continuation comparison. Neither the horizon nor the protocol's fixed bank size is chosen separately to fit a particular gap.

#### 22e.What the common unknown-law channel does and does not establish

The unconditional archival channel is a reference-preserving physical replacement of an unknown finite bank. Its output command is canonical for every bank input, and its old input is retained.

It does not establish $D(x_*)=0$, a zero-cost canonical-recognition branch, or the same pointwise finite-horizon theorem for an arbitrary externally mixed law with no registered implementation/reservation record. For example, extending the domain to a bare external mixture $(1-\varepsilon)x_*+\varepsilon\,\mathrm{STOP}$, with no paid selector stock, gives expected operating gap $\varepsilon E$, while unconditional rewriting still costs at least $32E$. At $\varepsilon=1/100$, $43\varepsilon E=0.43E<32E$. This is a falsifier of that **extra extension**, not of the declared source theorem: an internally implemented randomized selector has its own paid optional reserve, while a family selected from registered descriptions uses identity on the registered canonical member.

#### 22e.8. What fails when source admission changes

1. **Unmetered partial pulses.** A small early cue-dependent interaction before the completion receipt can yield $d>0$ at zero counted calls. Then (22e.4.1) fails. Autonomous completed calls are a real required interface property.
2. **Charging only true logical branches.** A cue-controlled copy that charges only when $X=1$ has $\mathbb{E}[N]=1/2$ and $d=1$. The stronger $d\le\mathbb{E}[N]$ is false. The physical collision is counted on both input branches here.
3. **Retrievable receipts.** If the client may reverse the fee-token charge, $E N$ is no longer consumed work. The source-bound cost inequality must be redone.
4. **Free controller stock or analog randomization.** Arbitrarily small mixtures near $x^*$ may have no fixed optional debit, removing the uniform gap and common-$H$ proof. The nonnegative global inequality can survive, but the paid-descent proof does not automatically survive.
5. **Dropping cue return.** A SWAP may have the same prediction score and a different input aftermath. The full response census then has another minimizer; it must be retained rather than falsely identified by score.
6. **Thermal enlargement.** A finite bath and consumed pure blanks can change available work and entropy. The closed zero-$H$ endpoint argument does not price them. No universal no-go or complete thermal frontier is claimed.
7. **Deleting archives.** The update acts by custody and retention, not by declaring old controller data absent. If the task requires every archive to be reset at the end, its entropy/cost must be added and (22e.7.1) must be proved again.

#### 22e.9. Comparison with the scalar source of Lemma F.1c.5 and the shared-class boundary

The scalar source of Lemma F.1c.5 obeys

$$
\begin{aligned}
T_hV_h &= C_h+(1+b)E_m\Gamma_h,\\
\Gamma_h &= (\phi-m)^{\mathsf T}K_h(g)(\phi-m)/2.
\end{aligned}
$$

Its positive inventory reservation $C_{h}$ is common across a fixed compact routed configuration domain. The native catalogue of Theorem 22e does not imply that its native-call, controller, source, and archive tariffs equal $C_{h}$ for every alternative implementation. Even where a finite scalar precursor can be approximated by digital circuits, one must count the actual synthesis length, precision, clocks, and retained physical response. Exact generic Gaussian rotations are not automatically finite words in the fixed algebraic native alphabet. The normal source additionally has unbounded support.

Accordingly a cost-preserving embedding of the full scalar source of Lemma F.1c.5 into this catalogue remains open. Theorem 22e is not a witness for the joint finite Einstein branch of Proposition 12.1f.3 and Corollaries 12.1f.8–12.1f.9, and it is not used there as an extra axiom. This catalogue's cost gap cannot be imported as the graph-regularity gap of Definition 43c: it is a different response task and a different source tariff. This embedding comparison therefore has a negative outcome and is consistent with Lemma F.1c.5.

<a id="corollary-221-gaussian-attractor-under-quadratic-cost-pce"></a>**Corollary 22.1 (Gaussian Attractor under Quadratic-Cost PCE).** Let $\mathcal K\subset\mathbb R^d$ be compact with $x^*\in\operatorname{int}(\mathcal K)$. Assume $V$ is continuous on $\mathcal K$, twice continuously differentiable near $x^*$, and has $x^*$ as its unique global minimum, with
$$
H:=\nabla^2V(x^*)\succ0.
$$
For $\theta>0$, let
$$
\pi_\theta(dx)=Z_\theta^{-1}e^{-V(x)/\theta}\mathbf1_{\mathcal K}(x)\,dx,
$$
as given by Equation (D.12a) of Appendix D,
and define $\xi_\theta=(x-x^*)/\sqrt\theta$. Then
$$
\xi_\theta\xrightarrow{d}\mathcal N(0,H^{-1})
\qquad(\theta\downarrow0).
\tag{37a}
$$
Each coordinate projection therefore converges to a centered one-dimensional Gaussian whose variance is the corresponding diagonal entry of $H^{-1}$.

*Proof.* Let $\lambda_{\min}>0$ be the smallest eigenvalue of $H$. Taylor expansion at the critical point $x^*$ gives
$$
V(x^*+h)-V(x^*)
=\frac12h^THh+r(h),
\qquad
\frac{r(h)}{\|h\|^2}\longrightarrow0.
$$
Choose $\rho>0$ such that $B_\rho(x^*)\subset\mathcal K$ and
$$
V(x^*+h)-V(x^*)\ge\frac{\lambda_{\min}}4\|h\|^2
\qquad(\|h\|\le\rho).
$$
Continuity, compactness, and uniqueness of the minimum give
$$
\Delta_\rho
:=\min_{x\in\mathcal K\setminus B_\rho(x^*)}
\bigl(V(x)-V(x^*)\bigr)>0.
$$

Let $\varphi$ be bounded and continuous and put
$$
\mathcal K_\theta:=\frac{\mathcal K-x^*}{\sqrt\theta}.
$$
After the change of variables $x=x^*+\sqrt\theta\,\xi$, the common Jacobian cancels and
$$
\mathbb E_{\pi_\theta}[\varphi(\xi_\theta)]
=\frac{
\int_{\mathcal K_\theta}\varphi(\xi)
e^{-[V(x^*+\sqrt\theta\xi)-V(x^*)]/\theta}\,d\xi}
{
\int_{\mathcal K_\theta}
e^{-[V(x^*+\sqrt\theta\xi)-V(x^*)]/\theta}\,d\xi}.
$$
On $\|\xi\|\le\rho/\sqrt\theta$, the integrands are dominated by
$$
\|\varphi\|_\infty e^{-\lambda_{\min}\|\xi\|^2/4},
$$
which is integrable on $\mathbb R^d$, and they converge pointwise to
$$
\varphi(\xi)e^{-\xi^TH\xi/2}.
$$
The contribution from $\mathcal K\setminus B_\rho(x^*)$ to either rescaled integral is bounded by a constant times
$$
\theta^{-d/2}e^{-\Delta_\rho/\theta},
$$
which tends to zero. Dominated convergence therefore gives
$$
\lim_{\theta\downarrow0}
\mathbb E_{\pi_\theta}[\varphi(\xi_\theta)]
=\frac{
\int_{\mathbb R^d}\varphi(\xi)e^{-\xi^TH\xi/2}\,d\xi}
{
\int_{\mathbb R^d}e^{-\xi^TH\xi/2}\,d\xi}.
$$
Orthogonal diagonalization of $H$ and the one-dimensional Gaussian integral give
$$
\int_{\mathbb R^d}e^{-\xi^TH\xi/2}\,d\xi
=\frac{(2\pi)^{d/2}}{\sqrt{\det H}}.
$$
Thus the limiting density is
$$
\frac{\sqrt{\det H}}{(2\pi)^{d/2}}e^{-\xi^TH\xi/2},
$$
the density of $\mathcal N(0,H^{-1})$. Taking $\varphi(\xi)$ to depend on one coordinate proves the projection statement. ∎

<a id="remark-221-explanatory-scope"></a>**Remark 22.1 (Explanatory Scope).** On the Gibbs-family and compact-domain hypotheses of Corollary 22.1, rescaled low-temperature fluctuations about the unique nondegenerate minimum have the stated Gaussian leading law. Applying this conclusion to measured fluctuations requires a separate identification of their stationary law with that Gibbs family.

<a id="remark-222-non-gaussian-regimes"></a>**Remark 22.2 (Non-Gaussian Regimes).** Corollary 22.1 concerns the strictly local fluctuation regime near a non-degenerate PCE minimum. At degenerate or marginal minima, zero Hessian eigenvalues remove the positive-definite quadratic bound used by Corollary 22.1. The appropriate rescaling and limiting law require additional control of the potential in those directions; the stated $C^2$ regularity alone does not determine them. Far from a minimum, or in the presence of multiplicative rather than additive fluctuations, heavier-tailed distributions can arise, including the conditional Pareto regime analyzed in Appendix P.8.9a.11 under multiplicative PCE adaptation.

<a id="653-definition-21-def-21-dynamics-of-hatc_targett"></a>**6.5.3 Definition 21 (Def 21): Dynamics of $\hat{C}_{\mathrm{target}}(t)$**

The variable $\hat C_{\mathrm{target}}(t)>0$ is the internal task-scale coordinate entering the Law of Prediction. On the homeostatic branch it is a response-active task-selection/control coordinate, and the certificate must include an intervention map showing that changing it changes retained measured performance according to $p(C,T)$. If it is only an estimator or label, Equation (38) regulates an internal score and is not a physical homeostasis law. When the response-active record exists for a registered target performance $PP_{op}\in(\alpha,\beta)$, its feedback law is
$$
\frac{d\hat C_{\mathrm{target}}}{dt}
=\mu_{\mathrm{target}}\hat C_{\mathrm{target}}(t)
\left(PP(C(t),\hat C_{\mathrm{target}}(t))-PP_{op}\right),
\qquad
\mu_{\mathrm{target}}>0,
\qquad
[\mu_{\mathrm{target}}]=[T]^{-1}.
\tag{38}
$$
This sign is fixed by Equation (22). For $C>C_{op}$,
$$
\frac{\partial PP}{\partial C}>0,
\qquad
\frac{\partial PP}{\partial\hat C_{\mathrm{target}}}<0.
\tag{38a}
$$
Thus performance below target makes $\hat C_{\mathrm{target}}$ decrease and raises the modeled performance, while performance above target makes it increase and lowers the modeled performance. If $\hat C_{\mathrm{target}}$ is instead claimed to estimate an external environmental complexity, Equation (38) is not an unbiased estimator by itself; that stronger reading requires a separate innovation or observation model comparing predictions with external records.

<a id="theorem-21a-feedback-sign-and-joint-fixed-point-stability"></a>**Theorem 21a (Feedback Sign and Joint Fixed-Point Stability).** Write $T=\hat C_{\mathrm{target}}$ and $p(C,T)=PP(C,T)$, and assume the response-active branch of Definition 21. For Equation (22),
$$
p_C
=\frac{\kappa_{\mathrm{eff}}}{T}(\beta-p)>0,
\qquad
p_T
=-\frac{\kappa_{\mathrm{eff}}(C-C_{op})}{T^2}(\beta-p)<0
\tag{38b}
$$
whenever $C>C_{op}$. For each fixed $C>C_{op}$, the unique positive target-scale equilibrium satisfying $p(C,T_*)=PP_{op}$ is
$$
T_*
=
\frac{\kappa_{\mathrm{eff}}(C-C_{op})}
{\log\!\left((\beta-\alpha)/(\beta-PP_{op})\right)},
\tag{38c}
$$
and Equation (38) is locally exponentially stable there. The opposite sign $\dot T=\mu T(PP_{op}-p)$ is locally unstable whenever $p_T<0$.

For the coupled system
$$
\dot C=\eta_{adapt}\Psi(C,T),
\qquad
\dot T=\mu_{\mathrm{target}}T(p(C,T)-PP_{op}),
\tag{38d}
$$
assume $p$ and $\Psi$ are $C^1$ near an interior equilibrium $(C_*,T_*)$ with $\Psi(C_*,T_*)=0$ and $p(C_*,T_*)=PP_{op}$. Its Jacobian is
$$
J_*
=
\begin{pmatrix}
\eta_{adapt}\Psi_C & \eta_{adapt}\Psi_T\\
\mu_{\mathrm{target}}T_*p_C & \mu_{\mathrm{target}}T_*p_T
\end{pmatrix}_{(C_*,T_*)}.
\tag{38e}
$$
The equilibrium is locally exponentially stable if and only if
$$
\operatorname{tr}J_*
=\eta_{adapt}\Psi_C+\mu_{\mathrm{target}}T_*p_T<0,
\tag{38f}
$$
and
$$
\det J_*
=\eta_{adapt}\mu_{\mathrm{target}}T_*
(\Psi_Cp_T-\Psi_Tp_C)>0.
\tag{38g}
$$
On the DSC branch $\Psi_C<0$, so (38b) makes (38f) automatic; Equation (38g) is the additional joint-stability gate that scalar Theorem 22 does not supply.

*Proof.* Differentiating Equation (22) gives
$$
p_C=\frac{\kappa_{\mathrm{eff}}}T(\beta-p),
\qquad
p_T=-\frac{\kappa_{\mathrm{eff}}(C-C_{op})}{T^2}(\beta-p),
$$
which proves (38b). Solving $p(C,T_*)=PP_{op}$ gives
$$
e^{-\kappa_{\mathrm{eff}}(C-C_{op})/T_*}
=\frac{\beta-PP_{op}}{\beta-\alpha},
$$
and taking logarithms gives (38c). The derivative of $\mu_{\mathrm{target}}T(p-PP_{op})$ at $T_*$ is $\mu_{\mathrm{target}}T_*p_T<0$; reversing the controller sign changes this coefficient to a positive number.

Differentiating the two components of (38d) gives (38e). If $\lambda_1,\lambda_2$ are the eigenvalues of the real $2\times2$ matrix $J_*$, then
$$
\lambda_1+\lambda_2=\operatorname{tr}J_*,
\qquad
\lambda_1\lambda_2=\det J_*.
$$
If the eigenvalues are real, negative trace and positive determinant are equivalent to both being negative. If they are nonreal, they are conjugates, their common real part is $\operatorname{tr}J_*/2$, and their product is positive. Thus both eigenvalues have negative real part exactly when the trace is negative and determinant positive.

It remains to connect this spectral condition to the nonlinear system. Translate the equilibrium to the origin and write the vector field as
$$
\dot z=J_*z+r(z),
\qquad
\frac{\|r(z)\|}{\|z\|}\longrightarrow0
\quad(z\to0),
$$
which follows from the stated $C^1$ hypothesis. If $J_*$ is Hurwitz, there are $M,\omega>0$ such that $\|e^{tJ_*}\|\le Me^{-\omega t}$ for $t\ge0$. For any $\epsilon\in(0,\omega/M)$, choose a neighborhood on which $\|r(z)\|\le\epsilon\|z\|$. While the solution remains in that neighborhood, variation of constants gives
$$
\|z(t)\|
\le
Me^{-\omega t}\|z(0)\|
+M\epsilon\int_0^t e^{-\omega(t-s)}\|z(s)\|\,ds.
$$
Put $y(t):=e^{\omega t}\|z(t)\|$ and
$$
F(t):=M\|z(0)\|+M\epsilon\int_0^t y(s)\,ds.
$$
Then $y(t)\le F(t)$ and $F'(t)=M\epsilon y(t)\le M\epsilon F(t)$. Hence
$$
\frac{d}{dt}\left(e^{-M\epsilon t}F(t)\right)\le0,
$$
so $F(t)\le M\|z(0)\|e^{M\epsilon t}$ and therefore
$$
\|z(t)\|
\le
M e^{-(\omega-M\epsilon)t}\|z(0)\|.
$$
Choosing the initial ball small enough makes this estimate invariant under the flow, so the equilibrium is locally exponentially stable.

Conversely, if the equilibrium is locally exponentially stable, differentiability of the flow with respect to initial data gives $D\varphi_t(0)=e^{tJ_*}$. Differentiating the local exponential estimate at the origin yields $\|e^{tJ_*}\|\le Ke^{-ct}$ for some $K,c>0$, so every eigenvalue of $J_*$ has negative real part. Therefore local exponential stability is equivalent to (38f)–(38g). ∎

<a id="proposition-21a1-joint-equilibria-of-the-registered-capability-and-task-scale-loop"></a>**Proposition 21a.1 (Joint Equilibria of the Registered Capability and Task-Scale Loop).** Assume the response-active branch of Definition 21 with the registered laws (22) and (31): $\Gamma_0,\kappa_{\mathrm{eff}},r_I,C_{op}>0$, $\lambda\ge0$, $PP_{op}\in(\alpha,\beta)$, and $R$ as in Definition 3a, so that $R'\ge0$ and $R''>0$ on $C>C_{op}$. Work on the domain $C>C_0:=\max\{C_{op},K_0\}$, $T>0$, of Proposition 3, and put
$$
\Lambda:=\log\frac{\beta-\alpha}{\beta-PP_{op}},\qquad
\mathsf A:=\Gamma_0\Lambda(\beta-PP_{op}),\qquad
\varrho_I:=\frac{r_I}{\ln2},\qquad
g(C):=\frac{\mathsf A}{C-C_{op}}-\lambda R'(C)-\frac{\varrho_I}{C}.
\tag{21a.1.1}
$$

1. The joint equilibria of (38d) are exactly the points $(C_*,T_*(C_*))$ with $C_*>C_0$ and $g(C_*)=0$, where $T_*(C)=\kappa_{\mathrm{eff}}(C-C_{op})/\Lambda$ is the target-scale equilibrium (38c).
2. The function $g$ has at most one zero on $(C_{op},\infty)$, and $g'<0$ at that zero. A zero exists exactly when $\lambda>0$ or $\varrho_I>\mathsf A$; for $\lambda=0$ and $\varrho_I>\mathsf A$ it is $C_*=\varrho_IC_{op}/(\varrho_I-\mathsf A)$. On the branch $C_{op}\ge K_0$ of Corollary 3 the coupled system (38d) therefore has exactly one joint equilibrium when $\lambda>0$ or $r_I/\ln2>\Gamma_0\Lambda(\beta-PP_{op})$, and none otherwise. If $K_0>C_{op}$, it has exactly one when, in addition, $g(K_0)>0$, and none otherwise.
3. At a joint equilibrium $\Psi_Cp_T-\Psi_Tp_C=p_T\,g'(C_*)>0$, so the determinant condition (38g) holds. The trace condition (38f) reads $\eta_{adapt}\Psi_C<\mu_{\mathrm{target}}\Lambda(\beta-PP_{op})$, where
$$
\Psi_C(C_*,T_*)=-\frac{\mathsf A\Lambda}{(C_*-C_{op})^2}-\lambda R''(C_*)+\frac{\varrho_I}{C_*^2}
<-\frac{\mathsf A(\Lambda-1)}{(C_*-C_{op})^2}.
\tag{21a.1.2}
$$
Hence the joint equilibrium is locally exponentially stable for all positive rates when $\Lambda\ge1$, that is, when $(\beta-\alpha)/(\beta-PP_{op})\ge e$. For $\Lambda<1$ the sign of $\Psi_C$ is not fixed: at $\lambda=0$,
$$
\Psi_C=\frac{(\varrho_I-\mathsf A)^2}{C_{op}^2}\left(\frac1{\varrho_I}-\frac\Lambda{\mathsf A}\right),
$$
which is positive exactly when $\Lambda\varrho_I<\mathsf A<\varrho_I$; there (38f) is the rate condition $\eta_{adapt}/\mu_{\mathrm{target}}<\Lambda(\beta-PP_{op})/\Psi_C$.
4. Strict convexity of $R$ is used in item 2. Take the increasing nonconvex cost with marginal $R'(C)=0.03+0.028\sin(1.3(C-C_{op}))$ and $\alpha=0.2$, $\beta=0.9$, $PP_{op}=0.6$, $C_{op}=4$, $K_0=3$, $\Gamma_0=\lambda=1$, $r_I=0.2$. Then $g$ changes sign on each of the intervals $(8.5,8.7)$, $(11.9,12.0)$, $(12.8,13.0)$, $(17.0,17.3)$ and $(17.3,17.5)$, so (38d) has at least five joint equilibria.

*Proof.* Item 1. For $T>0$ the second equation of (38d) vanishes exactly when $p(C,T)=PP_{op}$, that is, when $T=T_*(C)$ by (38c). Then $\kappa_{\mathrm{eff}}/T_*=\Lambda/(C-C_{op})$ and $\beta-p=\beta-PP_{op}$, so (31) gives $\Psi(C,T_*(C))=g(C)$.

Item 2. At a zero of $g$, $\mathsf A/(C-C_{op})=\lambda R'(C)+\varrho_I/C\ge\varrho_I/C$, hence
$$
\frac{\mathsf A}{(C-C_{op})^2}\ge\frac{\varrho_I}{C(C-C_{op})}>\frac{\varrho_I}{C^2}
$$
and $g'(C)=-\mathsf A/(C-C_{op})^2-\lambda R''(C)+\varrho_I/C^2<0$. The zeros are therefore isolated. Between two consecutive zeros $g$ would be negative just after the first and positive just before the second, contrary to the intermediate value theorem; so $g$ has at most one zero, with $g>0$ before it and $g<0$ after it. Since $R'$ is nonnegative and nondecreasing, it is bounded near $C_{op}$, and $g\to+\infty$ as $C\downarrow C_{op}$. If $\lambda>0$, $R'$ is strictly increasing, so $R'(C)\ge R'(C_{op}+2)>R'(C_{op}+1)\ge0$ for $C\ge C_{op}+2$, and $g$ is eventually negative. If $\lambda=0$, $C(C-C_{op})g(C)=(\mathsf A-\varrho_I)C+\varrho_IC_{op}$, which is positive on $(C_{op},\infty)$ when $\varrho_I\le\mathsf A$ and vanishes only at $\varrho_IC_{op}/(\varrho_I-\mathsf A)>C_{op}$ otherwise. When $C_{op}\ge K_0$ the domain is $C>C_{op}$; when $K_0>C_{op}$, the zero lies in $C>K_0$ exactly when $g(K_0)>0$, by the sign pattern just proved.

Item 3. Differentiating $g(C)=\Psi(C,T_*(C))$ and $p(C,T_*(C))=PP_{op}$ gives $g'=\Psi_C+\Psi_TT_*'$ and $T_*'=-p_C/p_T$, so $p_Tg'=\Psi_Cp_T-\Psi_Tp_C$. This is positive because $p_T<0$ by (38b) and $g'(C_*)<0$ by item 2, and (38g) follows from $\eta_{adapt},\mu_{\mathrm{target}},T_*>0$. From (31) and $p_C=\kappa_{\mathrm{eff}}(\beta-p)/T$,
$$
\Psi_C=-\Gamma_0\frac{\kappa_{\mathrm{eff}}^2}{T^2}(\beta-p)-\lambda R''(C)+\frac{\varrho_I}{C^2},
$$
and at the equilibrium $\kappa_{\mathrm{eff}}/T_*=\Lambda/(C_*-C_{op})$ and $T_*p_T=-\Lambda(\beta-PP_{op})$. This gives the equality in (21a.1.2) and the stated form of (38f); the strict bound uses $\varrho_I/C_*^2<\mathsf A/(C_*-C_{op})^2$ from item 2. For $\lambda=0$ insert $C_*=\varrho_IC_{op}/(\varrho_I-\mathsf A)$ and $C_*-C_{op}=\mathsf AC_{op}/(\varrho_I-\mathsf A)$.

Item 4. Here $0.002\le R'\le0.058$, so $R$ is increasing, while $R''=0.0364\cos(1.3(C-C_{op}))$ changes sign. With $\Lambda=\log(7/3)$, $\mathsf A=0.3\Lambda$ and $\varrho_I=0.2/\ln2$, the values of $g$ at $8.5,8.7,11.9,12.0,12.8,13.0,17.0,17.3,17.5$ have the signs $+,-,-,+,+,-,-,+,-$. ∎

<a id="proposition-21b-external-difficulty-nonidentifiability-from-the-internal-controller-history"></a>**Proposition 21b (External-Difficulty Nonidentifiability from the Internal Controller History).** Let $D(t)$ denote an external-difficulty process. Assume the registered initial-value problem has a unique trajectory. If the observed dynamics consist only of Equations (38) and (38d), with $p(C,T)$ and $\Psi(C,T)$ containing no observation or innovation term depending on $D$, then the map
$$
D(\cdot)
\longmapsto
(C(\cdot),T(\cdot),p(C(\cdot),T(\cdot)))
\tag{38h}
$$
is constant for fixed initial data. It is therefore noninjective whenever the admitted external class contains two distinct paths, and no estimator measurable only with respect to the controller history can consistently distinguish all admitted external-difficulty paths.

*Proof.* With fixed initial data, the right-hand side of the controller equations depends on $C$ and $T$ but contains no $D$. Uniqueness of the registered solution therefore gives the same controller history for every admitted $D$. Two distinct paths have identical observations, so any history-measurable estimator returns the same estimate for both and cannot be correct for both. ∎

<a id="proposition-21c-finite-observation-separation-and-stable-scalar-innovation"></a>**Proposition 21c (Finite Observation Separation and Stable Scalar Innovation).** Let $\mathcal D=\{D_1,\ldots,D_m\}$, with $m\ge2$, be a frozen finite external-difficulty class and let
$$
O:\mathcal D\longrightarrow(\mathcal Y,\|\cdot\|)
$$
be its registered observation map.

1. An exact decoder $\widehat D$ satisfying $\widehat D(O(D_i))=D_i$ for every $i$ exists if and only if $O$ is injective.
2. Put
   $$
   d_{\min}:=\min_{i\ne j}\|O(D_i)-O(D_j)\|.
   $$
   A decoder correct for every perturbation $\|e\|\le\epsilon$ exists if $d_{\min}>2\epsilon$, with nearest-template decoding as a witness. If $d_{\min}\le2\epsilon$, no decoder can guarantee correctness for every such perturbation.
3. On the nonempty scalar constant-difficulty branch
   $$
   \dot D=0,
   \qquad
   y(t)=D+e(t),
   \qquad
   \dot{\widehat D}=L\bigl(y-\widehat D\bigr),
   \qquad L>0,
   \tag{38i}
   $$
   the estimation error obeys
   $$
   |\widehat D(t)-D|
   \le
   e^{-Lt}|\widehat D(0)-D|
   +\epsilon(1-e^{-Lt})
   \tag{38j}
   $$
   whenever $|e(t)|\le\epsilon$. The noiseless estimator is globally exponentially convergent.

*Proof.* An exact decoder is a left inverse of $O$, so it exists exactly when $O$ is injective. If $d_{\min}>2\epsilon$, the closed radius-$\epsilon$ balls around distinct templates are disjoint and nearest-template decoding is unique. If $d_{\min}\le2\epsilon$, the midpoint of a closest pair lies in both closed balls, so one received record is compatible with two external classes and no decoder can be correct for both. For (38i), $z=\widehat D-D$ satisfies $\dot z=-Lz+Le$. Variation of constants and $|e|\le\epsilon$ give (38j). ∎

<a id="proposition-21d-response-active-sensor-and-lipschitz-path-tracking"></a>**Proposition 21d (Response-Active Sensor and Lipschitz-Path Tracking).** Register the external path class
$$
\mathcal D_{v}
=
\{D:[0,\infty)\to[D_-,D_+]:D\text{ is absolutely continuous and }|\dot D|\le v\text{ a.e.}\},
\tag{38k}
$$
where $0<D_-<D_+$ and $v\ge0$. Let the formal sensor carrier output
$$
y(t)=D(t)
\tag{38l}
$$
in the same registered units, and use $\dot{\widehat D}=L(y-\widehat D)$ with $L>0$. The sensor is response-faithful because $D\mapsto y=D$ is total and injective on $\mathcal D_v$. It is response-active: every admissible perturbation with $D+h\in\mathcal D_v$ changes $y$ by $h$. For every path in $\mathcal D_v$,
$$
|\widehat D(t)-D(t)|
\le
e^{-Lt}|\widehat D(0)-D(0)|
+
\frac vL(1-e^{-Lt}).
\tag{38m}
$$
If a separately calibrated measurable perturbation $e$ with $|e|\le\epsilon$ almost everywhere is added to the readout, the same estimate gains the term $\epsilon(1-e^{-Lt})$; this is a robustness envelope around the exact realized branch.

*Proof.* With $z=\widehat D-D$, Equations (38k)--(38l) give $\dot z=-Lz-\dot D$ almost everywhere. Variation of constants and $|\dot D|\le v$ yield (38m). Replacing $y$ by $D+e$ adds the forcing $Le$ and gives the stated robustness term. The identity (38l) proves response activity, totality and injectivity on the registered exact branch. ∎

**6.6 Viability Enforcement**

The adaptation dynamics modeled so far (Equation 30, Equation 38) optimize performance but do not explicitly guarantee that $PP(t)$ remains strictly within the viable Space of Becoming $(\alpha, \beta)$ (Axiom 3). A mechanism is needed to enforce these hard boundaries.

<a id="661-definition-22-def-22-viability-enforcement-mechanism"></a>**6.6.1 Definition 22 (Def 22): Viability Enforcement Mechanism**

Let $z=(C,T)$, $p(z)=PP(C,T)$, and $[x]_+=\max\{x,0\}$. The controlled complexity dynamics are
$$
\dot C
=
\eta_{adapt}\Psi(C,T)V_{\mathrm{mod}}(p)+F_{\mathrm{corr}}(p),
\tag{39}
$$
where
$$
V_{\mathrm{mod}}(p)
=
\begin{cases}
\sin^2\!\left(\pi\dfrac{p-\alpha}{\beta-\alpha}\right),&\alpha\le p\le\beta,\\
0,&\text{otherwise},
\end{cases}
\tag{39a}
$$
and a continuous buffer controller is
$$
F_{\mathrm{corr}}(p)
=k_\alpha[\alpha+\delta-p]_+
-k_\beta[p-(\beta-\delta)]_+,
\qquad
k_\alpha,k_\beta,\delta>0,
\tag{40}
$$
with
$$
[k_\alpha]=[k_\beta]=[\text{complexity}][T]^{-1},
\qquad
[\delta]=1.
$$
The gains are accepted only when the full coupled vector field, including Equation (38) and the registered disturbance set, satisfies Theorem 22a.

<a id="theorem-22a-robust-predictive-viability-kernel"></a>**Theorem 22a (Robust Predictive-Viability Kernel).** Let
$$
K_{viab}
=
\{z:\alpha\le p(z)\le\beta\}
\tag{40a}
$$
intersected with any registered compact bounds on $C$ and $T$. Assume this intersection is closed and uniformly prox-regular, and that at every boundary point its Clarke tangent cone is exactly the intersection of the active face half-spaces, including at corners; this cone identity is a required certificate for the registered constraint qualification. For a global-in-time conclusion, assume every solution starting in $K_{viab}$ is forward complete; without forward completeness, the invariance conclusion applies only on each solution's maximal existence interval. Let $F(z)$ be the locally Lipschitz controlled drift and let the disturbance multifunction $\mathcal D(z)$ have nonempty compact convex values and be locally Lipschitz in Hausdorff distance, so $\dot z\in F(z)+\mathcal D(z)$ has the standard strong-solution property. Assume $\nabla p\ne0$ on the two performance faces. Then $K_{viab}$ is robustly forward invariant for every inclusion trajectory if and only if
$$
\inf_{d\in\mathcal D(z)}\nabla p(z)\cdot(F(z)+d)\ge0
\quad\text{when }p(z)=\alpha,
\tag{40b}
$$
and
$$
\sup_{d\in\mathcal D(z)}\nabla p(z)\cdot(F(z)+d)\le0
\quad\text{when }p(z)=\beta,
\tag{40c}
$$
together with the analogous all-velocity inward conditions on every active $C$ or $T$ bound.

If the two performance faces and every active $C,T$ face have registered strict inward margins, the conclusion survives every additional perturbation $e$ whose outward normal component on each face is smaller than that face's margin. In particular, if the performance-face margin is $m_p>0$, it is enough there that
$$
|\nabla p\cdot e|<m_p.
\tag{40d}
$$
For some $\delta_{\mathrm{out}}>0$, suppose that inside a forward-complete, forward-invariant $C,T$ domain the uniform inequalities $\dot p\ge m_p>0$ on $\alpha-\delta_{\mathrm{out}}\le p<\alpha$ and $\dot p\le-m_p$ on $\beta<p\le\beta+\delta_{\mathrm{out}}$ hold for every admitted velocity. Then every trajectory beginning in either of these exterior buffers enters $K_{viab}$: monotonicity keeps its performance in the same buffer until entry. From $\alpha-\delta_{\mathrm{out}}\le p_0<\alpha$ the entry time is at most $(\alpha-p_0)/m_p$, and from $\beta<p_0\le\beta+\delta_{\mathrm{out}}$ it is at most $(p_0-\beta)/m_p$. Capture from other initial states requires a corresponding drift or entry certificate there. Boundary inequalities alone prove invariance, not finite-time capture.

*Proof.* Put $G(z):=F(z)+\mathcal D(z)$. The locally Lipschitz drift and Hausdorff-Lipschitz compact-convex disturbance map give a locally Lipschitz, nonempty compact-convex velocity multifunction; local boundedness and upper semicontinuity follow. The strong-invariance equivalence for such differential inclusions (Usevitch, Garg and Panagou 2020, Theorem 1) states that $K_{viab}$ is strongly invariant exactly when $G(z)$ is contained in its Clarke tangent cone for every $z\in K_{viab}$. The condition is automatic at interior points. At boundary points the cone identity assumed above makes it
$$
G(z)\subseteq T^{\mathrm C}_{K_{viab}}(z)
\qquad(z\in\partial K_{viab}),
$$
equivalently the intersection of the active face half-spaces. The conclusion holds over each maximal solution interval and for all future time when the stated forward-completeness condition is met. On $p=\alpha$, membership of every $F(z)+d$ in the tangent cone is equivalent to
$$
\nabla p(z)\cdot(F(z)+d)\ge0
\qquad\text{for every }d\in\mathcal D(z),
$$
which is Equation (40b). On $p=\beta$, the analogous all-velocity condition is $\nabla p\cdot(F+d)\le0$, which is Equation (40c). The registered $C,T$ faces give the stated analogous inequalities.

If an additional perturbation $e$ has outward normal component smaller than a strict face margin, adding $e$ preserves the corresponding tangent inequality. In the lower exterior buffer, $\dot p\ge m_p$ implies
$$
p(t)-p_0\ge m_pt
$$
until entry, so entry occurs by $(\alpha-p_0)/m_p$. The upper-buffer calculation with $\dot p\le-m_p$ gives $(p_0-\beta)/m_p$. Conditions only on the boundary contain no estimate before a trajectory reaches the boundary and therefore prove invariance but not capture. ∎

**6.7 Model-Form Robustness**

The optimization and stability results in this section depend only on the stated boundary conditions and regularity/convexity hypotheses (Definitions 19–22). When an explicit closed form is required, it is fixed either by the composition constraint underlying Theorem 19 or by the admissibility requirements built into the dynamical definition (Definition 22). Any substitution must preserve the stated monotonicity/convexity and boundary conditions; under those conditions, scalar fixed-target convergence remains governed by Theorem 22; joint target-scale stability additionally requires Theorem 21a, and robust viability additionally requires Theorem 22a.

**6.8 Functional Interpretation: Adaptation as Implicit Error Management**

The complex adaptation dynamics governing $C(t)$ and $\hat{C}_{\mathrm{target}}(t)$ (Equation 39, Equation 38) can be understood functionally as a control system aiming to keep the "error" (deviation from optimal/viable performance) low.

*   **Desired State:** Operation near the target performance $PP_{op}$ within the viable range $(\alpha, \beta)$.
*   **Disturbances:** Changes in the environment (actual predictive difficulty), internal noise, resource fluctuations.
*   **Performance Measurement:** $PP(t)$ acts as the system's measurement of its current operational state relative to the desired state $PP_{op}$.
*   **Feedback Signal:** The signed deviation $(PP-PP_{op})$ is the signal used by Equation (38); reversing its sign requires reversing the controller convention as well.

*   **Control Actions:** Adjusting $\hat{C}_{\mathrm{target}}$ by Equation (38) supplies homeostatic task-scale control; interpreting it as an estimator of external difficulty requires a separate innovation record. Adjusting $C$ via $\Psi$ (Equation 30) modifies capability based on perceived difficulty and costs. Viability enforcement (Equation 39) acts as boundary control.
*   **Goal:** The coupled dynamics function as a feedback control loop, continuously adjusting internal complexity $C$ and the registered task-scale coordinate $\hat{C}_{\mathrm{target}}$ to minimize prediction error (maximize $PP$) efficiently (PCE) while staying within the operational boundaries $(\alpha, \beta)$. It implicitly manages uncertainty and the irreducible stochasticity of ND-RID interactions ($\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)\quad(\text{registered reset branch; a positive entropy-derived floor requires }H_q(P\mid R)\ge h_{\min}>0)$), enabling sustained viable prediction.

**6.9 Task- and Branch-Dependent Viability Bounds $\alpha$ and $\beta$**

The viability bounds are registered relative to a task, score calibration, and physical branch.

* **Lower bound $\alpha$.** Let $R_{\mathrm{base}}$ be the registered chance or reference risk and let $\phi$ be the strictly decreasing calibration from risk to performance. Then $\alpha_{task}=\phi(R_{\mathrm{base}})$.

<a id="theorem-69a-scoring-rule-invariant-viability-band"></a>**Theorem 6.9a (Scoring-Rule-Invariant Viability Band).** Let $R$ be task risk, $R_{\mathrm{base}}$ the fixed reference risk, and $R_B<R_{\mathrm{base}}$ the best risk attainable under the registered physical budget. For every strictly decreasing calibration $\phi$ define
$$
PP=\phi(R),
\qquad
\alpha_{task}=\phi(R_{\mathrm{base}}),
\qquad
\beta_B=\phi(R_B).
\tag{40e}
$$
Then
$$
\alpha_{task}<PP<\beta_B
\quad\Longleftrightarrow\quad
R_B<R<R_{\mathrm{base}}.
\tag{40f}
$$
Hence viability membership is invariant under every order-preserving change of score coordinate, including positive affine rescalings of a proper score followed by a decreasing performance calibration. For the paper's representative $PP=1/(1+k_{PP}R)$,
$$
\alpha_{task}=\frac{1}{1+k_{PP}R_{\mathrm{base}}},
\qquad
\beta_B=\frac{1}{1+k_{PP}R_B}.
\tag{40g}
$$

*Proof.* Strict monotonicity of $\phi$ reverses the two risk inequalities and is injective, proving (40f). Equation (40g) is direct substitution. The physical budget may constrain $R_B$, but no dimensionless chance score follows from the entropy cost $\varepsilon_0$ without a task and calibration map. ∎

**Resource-budget infima.** More generally, let $\mathcal A_B$ be a nonempty admitted implementation class, $R_B=\inf_{a\in\mathcal A_B}R(a)$ finite, and $\phi$ strictly decreasing on a risk interval containing $R_B$ and $R_{\mathrm{base}}$. If the infimum is attained, the maximum calibrated performance is $\beta_B=\phi(R_B)$. If it is unattained and $\phi$ is continuous at $R_B$, the performance supremum is still $\phi(R_B)$. With $\alpha=\phi(R_{\mathrm{base}})$, the open improvement interval is nonempty exactly when $R_B<R_{\mathrm{base}}$, and
$$
\alpha<\phi(R)<\beta_B\quad\Longleftrightarrow\quad R_B<R<R_{\mathrm{base}}.
\tag{40g.1}
$$
For the finite logarithmic task of Theorem P.15.2e and an admitted encoder class $\mathcal A_B$, with the posterior predictor available at every encoder,
$$
R_B=H(Y\mid X,R)+\inf_{K\in\mathcal A_B}I(X;Y\mid M,R).
\tag{40g.2}
$$
*Proof.* Every candidate has $R(a)\ge R_B$, hence $\phi(R(a))\le\phi(R_B)$. Attainment gives equality. Otherwise choose a minimizing sequence $R(a_n)\to R_B$; continuity gives $\phi(R(a_n))\to\phi(R_B)$, proving the supremum. Strict monotonicity proves (40g.1). At each encoder, the posterior minimizes logarithmic loss at $H(Y\mid M,R)=H(Y\mid X,R)+I(X;Y\mid M,R)$; taking the encoder infimum proves (40g.2). ∎

This is a resource-indexed performance endpoint. A forward-invariant or attracting performance band additionally uses the actual dynamics and the drift, disturbance, tangent-cone and completeness conditions of Theorem 22a, or the corresponding stochastic convergence hypotheses. The variational endpoint alone supplies no convergence claim.

*   **Upper endpoint $\beta$.** A Space-of-Becoming branch registers $\beta$ taskwise with $\alpha<\beta<1$ and proves attainable performance below it. On the joint Theorem-9/Theorem-19 branch it must also satisfy $\beta\le\beta_0$ and is the response-law asymptote. PCE marginal-cost stability may supply one independently proved realization, but it does not determine $\beta$ from the listed cost parameters without an explicit optimizer-to-score bridge.

<a id="theorem-69b-exact-minimax-code-for-a-frozen-logarithmic-jnd-metric"></a>**Theorem 6.9b (Exact Minimax Code for a Frozen Logarithmic JND Metric).** Fix $0<x_{\min}<x_{\max}$, a positive integer $m$, and the just-noticeable-difference metric
$$
d_{\mathrm{JND}}(x,y)=|\ln x-\ln y|.
\tag{40h}
$$
Among all ordered $m$-level encoders with reconstruction values $q_1,\ldots,q_m>0$, the least possible worst-case distortion on $[x_{\min},x_{\max}]$ is
$$
r_m^*
=
\frac{\ln(x_{\max}/x_{\min})}{2m}.
\tag{40i}
$$
It is attained by equal cells in $u=\ln x$ with reconstruction points
$$
q_j
=
x_{\min}\exp\!\left(
\frac{2j-1}{2m}\ln\frac{x_{\max}}{x_{\min}}
\right),
\qquad 1\le j\le m.
\tag{40j}
$$
At equality, the ordered cell boundaries and reconstruction points are fixed up to assignments on shared boundaries. Thus the optimal response index is uniformly spaced in $\ln x$, the finite Weber--Fechner form for this frozen metric and minimax objective.

*Proof.* In the coordinate $u=\ln x$, the domain is an interval of length $L=\ln(x_{\max}/x_{\min})$. If $m$ reconstruction points have covering radius $r$, their $m$ radius-$r$ intervals have total length at most $2mr$, so covering requires $r\ge L/(2m)$. Equal adjacent cells of length $L/m$ with midpoint reconstructions attain this bound. Equality in the length bound leaves no overlap or uncovered positive-length interval, forcing the ordered equal-cell construction up to shared endpoints. Exponentiating the midpoints gives (40j). ∎

<a id="proposition-69c-robust-log-code-implementation-bound-and-locked-mean-distortion-rule"></a>**Proposition 6.9c (Robust Log-Code Implementation Bound and Locked Mean-Distortion Rule).** Write
$$
u=\ln x,
\qquad
a=\ln x_{\min},
\qquad
b=\ln x_{\max},
$$
and let $c_j=\ln q_j$ be the ideal midpoint code of Theorem 6.9b. Suppose a realized transducer produces $\widetilde u$ with
$$
|\widetilde u-u|\le\epsilon_s,
$$
clips it to $[a,b]$, assigns the clipped value to the ideal equal cell, and returns an implemented log reconstruction $\widetilde c_j$ satisfying
$$
|\widetilde c_j-c_j|\le\epsilon_r.
$$
Then every realized trial obeys
$$
d_{\mathrm{JND}}(x,e^{\widetilde c_j})
=|u-\widetilde c_j|
\le r_m^*+\epsilon_s+\epsilon_r.
\tag{40k}
$$

For a prospective comparison, let independent identically distributed preregistered trial losses $L_1,\ldots,L_N$ lie in $[0,L_{\max}]$, with common mean $\mu_L$. At one-sided error probability $\delta\in(0,1)$, the locked rule
$$
\overline L
+L_{\max}\sqrt{\frac{\log(1/\delta)}{2N}}
\le\tau
\tag{40l}
$$
accepts the endpoint "mean log-distortion at most $\tau$" with coverage at least $1-\delta$. Taking $\tau=r_m^*+\epsilon_s+\epsilon_r$ tests the realized implementation allowance in (40k) after the transducer and reconstruction budgets have been fixed before data.

*Proof.* Metric projection onto the interval $[a,b]$ cannot increase the distance to $u\in[a,b]$. The assigned ideal midpoint lies within $r_m^*$ of the clipped value. The triangle inequality with the sensing and reconstruction bounds proves (40k). Hoeffding's inequality for independent variables in $[0,L_{\max}]$ gives
$$
\Pr\!\left[
\mu_L-\overline L
>
L_{\max}\sqrt{\frac{\log(1/\delta)}{2N}}
\right]\le\delta,
$$
which proves the coverage statement for (40l). ∎

<a id="proposition-69d-exact-finite-state-logarithmic-transducer"></a>**Proposition 6.9d (Exact Finite-State Logarithmic Transducer).** Let $a=\ln x_{\min}$, $b=\ln x_{\max}$ and partition $[a,b]$ into the $m$ equal closed-open cells
$$
I_j=
\left[a+\frac{(j-1)(b-a)}m,
a+\frac{j(b-a)}m\right)
\quad(1\le j<m),
\tag{40m}
$$
with the last cell closed at $b$. A deterministic sensory transducer computes $u=\ln x$, stores the unique cell label $j$ in an $m$-state classical register and returns the reconstruction $q_j$ of Equation (40j). Its response channel is total on $[x_{\min},x_{\max}]$, and every input satisfies
$$
d_{\mathrm{JND}}(x,q_j)
=|\ln x-\ln q_j|
\le r_m^*.
\tag{40n}
$$
The encoder, finite register and decoder therefore realize the exact minimax code with certified budgets $\epsilon_s=\epsilon_r=0$.

*Proof.* The cells form a disjoint cover after the declared shared-boundary convention. Their log-midpoints are $\ln q_j$, so every point of a cell is at distance at most $(b-a)/(2m)=r_m^*$ from its reconstruction. The finite label register makes the encoder and decoder total deterministic maps. ∎
