# Appendix S: Resource Cost, Stress-Energy, and the Gravitational Self-Limitation of CC

On the global quadratic-cost, retained-source, weak-field, dephasing, and coherence-response branches analyzed here, a sustained context capable of biasing quantum outcome statistics carries a registered resource cost whose retained energy contributes to stress-energy and produces gravitational self-dephasing that limits efficacy. This appendix quantifies that conditional feedback mechanism, complementing the electromagnetic and biological models in Appendix L. Proposition L.5 proves that the electromagnetic-to-gravitational response ratio remains undetermined until the carrier, target, geometry, retention, normalization, likelihood, covariance, and uncertainty inputs are registered in common units.

## S.1 Resource Cost of the Context State

Let $\text{CC}(S)$ denote the operational bias capability of system $S$ (Definition 30). On the rational scaling branch of Definition 32 with $0<\alpha_\infty=\alpha_{CC,max}<1/2$, $C_{\mathrm{scale}}>0$, and $C_{\mathrm{agg}}\ge C_{op}$, the model is:
$$
\text{CC}(S) = \alpha_{CC,max} \frac{C_{\mathrm{agg}} - C_{op}}{C_{\mathrm{scale}} + (C_{\mathrm{agg}} - C_{op})}
\tag{S.1}
$$

Define the active context complexity above baseline as $C_{\mathrm{context}} := C_{\mathrm{agg}} - C_{op}$. Solving for $C_{\mathrm{context}}$ in terms of $\text{CC}$ yields:
$$
C_{\mathrm{context}} = C_{\mathrm{scale}} \frac{\text{CC}}{\alpha_{CC,max} - \text{CC}}
\tag{S.2}
$$

On the quadratic operational-cost branch, assume
$$
R(C_{op}+x)-R(C_{op})=r_px^2,
\qquad r_p>0,
\qquad x\ge0.
\tag{S.3}
$$
This is a constitutive branch assumption. Convexity alone would give only a local Taylor formula with a remainder.

<a id="proposition-s1a-nonquadratic-definition-3-cost-counterexample"></a>**Proposition S.1a (Nonquadratic Definition-3 Cost Counterexample).** Fix $T_{\mathrm{eff}}$ and choose $\gamma_p=3$ in the admissible family of Definition 3a. With $x=C-C_{op}\ge0$, its excess cost is
$$
\Delta R_3(x):=R(C_{op}+x)-R(C_{op})=r_p x^3,
\qquad r_p>0.
\tag{S.3a}
$$
This is a nonempty, nonnegative, strictly increasing and strictly convex full-domain cost branch, but it is not globally quadratic. Consequently, Definition 3a's general cost hypotheses do not imply S.3; the global quadratic law is an independent constitutive branch.

*Proof.* On $x\ge0$, $\Delta R_3(0)=0$ and $\Delta R_3(x)>0$ for $x>0$. Moreover,
$$
\Delta R_3'(x)=3r_px^2\ge0,
\qquad
\Delta R_3''(x)=6r_px>0\quad(x>0),
$$
so Definition 3a's monotonicity and strict-convexity requirements hold. If $\Delta R_3(x)=r x^2$ for one constant $r$ and every $x>0$, division by $x^2$ would give $r=r_px$ for every $x>0$, a contradiction. Within Definition 3a's power family, the excess law is globally quadratic exactly when $\gamma_p=2$. Thus $\gamma_p=3$ is an admissible counterexample to quadratic forcing. ∎

Using $x=C_{\mathrm{context}}=C_{\mathrm{scale}}\mathrm{CC}/(\alpha_{CC,max}-\mathrm{CC})$, the additional maintenance power is
$$
P_{\mathrm{context}}
=r_pC_{\mathrm{context}}^2
=r_pC_{\mathrm{scale}}^2\left[\frac{\mathrm{CC}}{\alpha_{CC,max}-\mathrm{CC}}\right]^2.
\tag{S.4}
$$
With $A:=r_pC_{\mathrm{scale}}^2$,
$$
\boxed{P_{\mathrm{context}}(\mathrm{CC})
=A\left[\frac{\mathrm{CC}}{\alpha_{CC,max}-\mathrm{CC}}\right]^2.}
\tag{S.5}
$$
On this global quadratic branch, $P_{\mathrm{context}}$ diverges as $\mathrm{CC}\uparrow\alpha_{CC,max}$. If S.3 is retained only as a local Taylor expansion, S.4–S.5 are valid only for $C_{\mathrm{context}}$ inside the certified Taylor neighborhood and no endpoint divergence follows from that expansion.

**Connection to Appendix L:** This power $P_{\mathrm{context}}$ is a component of the total aggregate power $P_{\mathrm{agg}}$ analyzed in Appendix L (Theorem L.6). Equation L.36 gives $P_{\mathrm{agg}}=\frac{d}{dt}(E_{\mathrm{matter}}^{\mathcal V}+E_{\mathrm{EM}}^{\mathcal V})+P_{\mathrm{EM}}^{\mathrm{out}}+P_{\mathrm{heat}}^{\mathrm{out}}+P_{\mathrm{mech}}^{\mathrm{out}}$ on the complete control-volume ledger. The shorthand $P_{\mathrm{agg}}=P_{EM}+P_{\mathrm{other}}$ uses $P_{EM}:=P_{\mathrm{EM}}^{\mathrm{out}}$ and $P_{\mathrm{other}}:=\frac{d}{dt}(E_{\mathrm{matter}}^{\mathcal V}+E_{\mathrm{EM}}^{\mathcal V})+P_{\mathrm{heat}}^{\mathrm{out}}+P_{\mathrm{mech}}^{\mathrm{out}}$, with mutually exclusive channel ownership.

## S.2 The CC-Context Stress-Energy Tensor $\Delta T_{\mu\nu}^{(CC)}$

Assume the context state occupies volume $V_S$. Model its effective stress-energy contribution as a perfect fluid with equation-of-state parameter $w_c:=p_{\mathrm{context}}/u_{\mathrm{context}}\in[0,1]$. On the retained-energy branch,
$$
E_{\mathrm{grav}}^{\mathrm{inst}}
=
\eta_{\mathrm{ret}}P_{\mathrm{context}}\tau_c,
\qquad
0<\eta_{\mathrm{ret}}\le1,
$$
and therefore
$$
u_{\mathrm{context}}
=
\frac{\eta_{\mathrm{ret}}P_{\mathrm{context}}\tau_c}{V_S},
\qquad
p_{\mathrm{context}}=w_cu_{\mathrm{context}}.
\tag{S.6}
$$
The ideal fully retained branch sets $\eta_{\mathrm{ret}}=1$. Cumulative work is not a local gravitational source unless the corresponding energy remains localized in the source region.

In a local orthonormal rest frame of $S$, the assumed isotropic perfect-fluid contribution has energy density $u_{\mathrm{context}}$, equal spatial normal stresses $p_{\mathrm{context}}$, and zero momentum flux. Hence its covariant stress-energy tensor is:
$$
\Delta T_{\mu\nu}^{(CC)} = \operatorname{diag}(u_{\mathrm{context}}, p_{\mathrm{context}}, p_{\mathrm{context}}, p_{\mathrm{context}})
\tag{S.7}
$$

For the relativistic fluid case $w_c = 1/3$:
$$
\Delta T_{\mu\nu}^{(CC)} = u_{\mathrm{context}} \cdot \operatorname{diag}(1, 1/3, 1/3, 1/3)
\tag{S.8}
$$

This stress-energy contribution is properly incorporated into the total MPU stress-energy tensor $T_{\mu\nu}^{(MPU)}$ as detailed in Appendix B (Definition B.8) and Appendix L (Theorem L.6). The decomposition is:
$$
T_{\mu\nu}^{(MPU)} = T_{\mu\nu}^{(baseline)} + \Delta T_{\mu\nu}^{(CC)} + T_{\mu\nu}^{(EM)}
\tag{S.9}
$$

where $T_{\mu\nu}^{(baseline)}$ represents the minimal operational state stress-energy ($C_{\mathrm{agg}} = C_{op}$), $\Delta T_{\mu\nu}^{(CC)}$ is the additional matter contribution from maintaining high-complexity context, and $T_{\mu\nu}^{(EM)}$ accounts for any electromagnetic field generation (Theorem L.2).

**Result (Self-limiting CC bound under resource ceiling).** Let $V_S,\tau_c,C_{\mathrm{scale}}>0$, $0<\eta_{\mathrm{ret}}\le1$, and $0\le u_{\max}<\infty$. Register an independent coefficient $\varepsilon_{\mathrm{context}}>0$ with units of energy per unit context complexity. On the certified operating domain, assume
$$
P_{\mathrm{context}}
\ge\frac{\varepsilon_{\mathrm{context}}C_{\mathrm{context}}}{\tau_c},
\qquad
u_{\mathrm{context}}\le u_{\max}.
$$
This energy-cost floor is an additional hypothesis; the power-conversion factor $\Gamma_0$ of Definition 20 does not supply it.

The retained-energy law gives
$$
u_{\mathrm{context}}
=\frac{\eta_{\mathrm{ret}}P_{\mathrm{context}}\tau_c}{V_S}
\ge\eta_{\mathrm{ret}}\frac{\varepsilon_{\mathrm{context}}}{V_S}
C_{\mathrm{context}}
=\eta_{\mathrm{ret}}\kappa_*C_{\mathrm{context}},
\qquad
\kappa_*:=\frac{\varepsilon_{\mathrm{context}}}{V_S}>0.
$$
Thus $C_{\mathrm{context}}\le u_{\max}/(\eta_{\mathrm{ret}}\kappa_*)$. Substituting this bound into the increasing rational scaling law gives
$$
\boxed{
\mathrm{CC}
\le\alpha_{CC,\max}
\frac{u_{\max}}
{u_{\max}+\eta_{\mathrm{ret}}\kappa_*C_{\mathrm{scale}}}
}.
\tag{S.10}
$$
Both terms in the denominator have units of energy density. The floor must be certified on the operating domain in addition to any adopted quadratic cost law.

Higher available energy density raises the operational cap. Independently, the bounded-bias branch declares $\text{CC}<\alpha_{CC,max}<0.5$; Theorem 39 supplies its endpoint-complete consequence, while exact causal compliance requires Theorem 39c.

<a id="theorem-s1-local-cptp-cc-branch-no-signaling-and-gravitational-bound"></a>**Theorem S.1 (Local CPTP CC Branch: No-Signaling and Gravitational Bound).**

Let $\rho_{AB}$ be a bipartite state, let $\mathcal E_A$ be a baseline CPTP channel, and let $\{\Phi_A^{(\epsilon)}\}_\epsilon$ be local CPTP channels satisfying
$$
\|\Phi_A^{(\epsilon)}-\mathcal E_A\|_\diamond\le\alpha<1/2.
$$
For every product POVM $\{E_i\otimes F_j\}$, Bob's marginal is unchanged:
$$
\sum_i\operatorname{tr}\!\left[
(\Phi_A^{(\epsilon)}\otimes\mathrm{id}_B)(\rho_{AB})(E_i\otimes F_j)
\right]
=\operatorname{tr}(\rho_BF_j).
\tag{S.11}
$$
Alice's marginal and the joint probabilities may change; the remote marginal cannot. A claimed Bob-marginal influence therefore requires a mechanism outside this local CPTP branch.

For the additional gravitational bound, assume that the same channel has the calibrated composition
$$
\Phi_A^{(\epsilon)}=\mathcal D_{\Delta\Phi}\circ\mathcal E_A,
$$
where $\mathcal D_{\Delta\Phi}$ is CPTP, and that, throughout the registered regime,
$$
\frac{|\Delta\Phi|}{c^2}
\le C_{\mathrm{geom}}\frac{Gu_{\mathrm{context}}L^2}{c^4},
\qquad
\|\mathcal D_{\Delta\Phi}-\mathrm{id}\|_\diamond
\le s_D\frac{|\Delta\Phi|}{c^2},
\qquad C_{\mathrm{geom}},s_D\ge0.
$$
For one POVM event $0\le M\le I$, let $\Delta P$ compare the outputs of $\Phi_A^{(\epsilon)}$ and $\mathcal E_A$ on the same input and measurement. Then
$$
|\Delta P|
\le\min\left\{\alpha,\,
C_{\mathrm{geom}}s_D\frac{Gu_{\mathrm{context}}L^2}{c^4}
\right\}.
\tag{S.12}
$$

*Proof.* Trace preservation gives
$$
\operatorname{tr}_A[(\Phi_A^{(\epsilon)}\otimes\mathrm{id}_B)(\rho_{AB})]
=\rho_B,
$$
which proves (S.11). The event bound and the definition of diamond norm give
$$
|\Delta P|
\le\|((\Phi_A^{(\epsilon)}-\mathcal E_A)\otimes\mathrm{id}_B)(\rho_{AB})\|_1
\le\|\Phi_A^{(\epsilon)}-\mathcal E_A\|_\diamond\le\alpha.
$$
On the composition branch, submultiplicativity and $\|\mathcal E_A\|_\diamond=1$ give
$$
\|\Phi_A^{(\epsilon)}-\mathcal E_A\|_\diamond
=\|(\mathcal D_{\Delta\Phi}-\mathrm{id})\circ\mathcal E_A\|_\diamond
\le\|\mathcal D_{\Delta\Phi}-\mathrm{id}\|_\diamond
\le C_{\mathrm{geom}}s_D\frac{Gu_{\mathrm{context}}L^2}{c^4}.
$$
Both bounds therefore apply to the same event difference. Their minimum proves (S.12). The composition and response calibration are additional physical hypotheses; bounds for an unrelated channel do not constrain $\Delta P$. ∎

## S.3 Gravitational Self-Disruption

On the uniform spherical perfect-fluid source model assumed in Theorem S.3, and only after the complete conserved stress tensor—including any confinement or boundary stresses—is fixed, the weak-field active-density term is modeled as
$$
\rho_{\mathrm{source}}
=\frac{u_{\mathrm{context}}+3p_{\mathrm{context}}}{c^2}
=(1+3w_c)\frac{u_{\mathrm{context}}}{c^2}.
\tag{S.13}
$$
Equation (S.13) is a constitutive branch input for the calculation below, not a consequence of Theorem 50 for an arbitrary localized context-energy distribution. For $w_c = 1/3$:
$$
\rho_{\mathrm{source}} = \frac{2u_{\mathrm{context}}}{c^2}
\tag{S.14}
$$

For the uniform spherical source of radius $R_S$, the interior radial field strength is
$$
g_{CC}(r)=\frac{4\pi G}{3}\rho_{\mathrm{source}}r
=\frac{4\pi G}{3}(1+3w_c)\frac{u_{\mathrm{context}}}{c^2}r.
\tag{S.15}
$$
Choose two stationary sampling locations on one radius, at $r$ and $r+L_q$, with $0<r<r+L_q<R_S$. Integrating the interior field gives, in the Newtonian potential model,
$$
\Delta\Phi_{\mathrm{diff}}
=\frac{4\pi G}{3}(1+3w_c)\frac{u_{\mathrm{context}}}{c^2}
\left(rL_q+\frac{L_q^2}{2}\right)
=g_{CC}(r)L_q\left(1+\frac{L_q}{2r}\right).
\tag{S.16}
$$
The linear-gradient branch retains $g_{CC}(r)L_q$ under $L_q/r\ll1$; the omitted term divided by the retained linear term is $L_q/(2r)$. Other orientations require the corresponding directional potential difference. In particular, a radial interval starting at the centre has a nonzero quadratic contribution and is outside this linear-gradient branch.

For a quasi-static source over $\tau_c>0$, the leading weak-field proper-time difference is $\Delta\tau_{\mathrm{diff}}=\tau_c\Delta\Phi_{\mathrm{diff}}/c^2$, with separate higher-order metric corrections. Denote its retained linear-gradient value by $\Delta\tau_d$. The retained-energy law gives
$$
\Delta\tau_d
=\frac{4\pi G}{3c^4}(1+3w_c)
\frac{\eta_{\mathrm{ret}}P_{\mathrm{context}}\tau_c}{V_S}
rL_q\tau_c.
\tag{S.17}
$$
Thus, on this declared approximation branch,
$$
\boxed{\Delta\tau_d=KP_{\mathrm{context}}(\mathrm{CC})},
\tag{S.18}
$$
where
$$
K:=\frac{4\pi G}{3c^4}(1+3w_c)
\frac{\eta_{\mathrm{ret}}rL_q\tau_c^2}{V_S},
\tag{S.19}
$$
and
$$
K_{\mathrm{eff}}:=\frac K{\tau_c}
=\frac{4\pi G}{3c^4}(1+3w_c)
\frac{\eta_{\mathrm{ret}}rL_q\tau_c}{V_S}.
\tag{S.20}
$$
The fully retained specialization has $\eta_{\mathrm{ret}}=1$. For $w_c=1/3$, the prefactor is $8\pi G/(3c^4)$. A finite-separation or physical timing certificate must also carry the spatial truncation and metric errors.

<a id="theorem-s1b-complete-static-source-laue-identity-confinement-stress-and-exterior-active-mass"></a>**Theorem S.1b (Complete Static Source: Laue Identity, Confinement Stress and Exterior Active Mass).** Use inertial coordinates with $x^0=ct$. Let $T^{\mu\nu}$ be the complete symmetric stress-energy of a retained context source, including every confinement and boundary stress, given as a static ($\partial_0T^{\mu\nu}=0$) tensor-valued distribution on $\mathbb R^3$ with compact support $\mathcal K$, and conserved, $\partial_\mu T^{\mu\nu}=0$. For $\chi\in C_c^\infty(\mathbb R^3)$ equal to $1$ on a neighbourhood of $\mathcal K$, write $\int T^{\mu\nu}:=\langle T^{\mu\nu},\chi\rangle$ and $E:=\int T^{00}$.

(a) *(Laue identity.)* $\int T^{ij}=0$ for all $i,j$.

(b) *(Exterior active mass.)* The active density of (S.13) applied to the complete tensor, $\rho_{\mathrm{act}}:=(T^{00}+\sum_iT^{ii})/c^2$, has total mass $E/c^2$. If $T^{ij}=wT^{00}\delta^{ij}$ on $\mathcal K$ with constant $w$ and $E\ne0$, then $w=0$. If $\rho_{\mathrm{act}}$ is a spherically symmetric finite signed measure, the weak-field potential solving $\nabla^2\Phi=4\pi G\rho_{\mathrm{act}}$ with $\Phi\to0$ at infinity equals $-GE/(c^2r)$ outside the support.

(c) *(Unique spherical confinement stress.)* Write a spherically symmetric static stress as $T^{ij}=\sigma_rn^in^j+\sigma_t(\delta^{ij}-n^in^j)$ with $n=x/r$. On $r>0$, conservation holds exactly when
$$
\sigma_t=\frac1{2r}\frac{d}{dr}\bigl(r^2\sigma_r\bigr).
\tag{S.1b.1}
$$
For the uniform radial stress $\sigma_r=p\,\mathbf 1_{r<R_S}$ with $p\ge0$, the unique conserved completion is
$$
\sigma_t=p\,\mathbf 1_{r<R_S}-\frac{pR_S}{2}\,\delta(r-R_S),
\tag{S.1b.2}
$$
a thin confining shell with surface tension $pR_S/2$, whose integrated stress trace $-3pV_S$ cancels the fluid value $3pV_S$.

(d) *(Nominated geometry.)* Let the source be the uniform ball of (S.6)--(S.7), with $T^{00}=u_{\mathrm{context}}$ and isotropic pressure $p_{\mathrm{context}}=w_cu_{\mathrm{context}}$ on $r<R_S$, completed by the shell of (c) carrying surface energy density $\sigma_E\ge0$. Then $E=u_{\mathrm{context}}V_S+4\pi R_S^2\sigma_E$, and the unique weak-field potential is
$$
\Phi(r)=
\begin{cases}
-\dfrac{GE}{c^2R_S}-\dfrac{2\pi G}{3c^2}(1+3w_c)u_{\mathrm{context}}\bigl(R_S^2-r^2\bigr),&0\le r\le R_S,\\[2ex]
-\dfrac{GE}{c^2r},&r\ge R_S.
\end{cases}
\tag{S.1b.3}
$$
Hence the interior field (S.15) and the clock comparisons (S.16)--(S.20) hold unchanged on the complete confined source, while its exterior active mass is $E/c^2$, independent of $w_c$.

*Proof.* (a) Staticity reduces conservation to $\partial_kT^{kj}=0$. For each $i$, $x^i\chi$ is a test function, so
$$
0=\langle\partial_kT^{kj},x^i\chi\rangle
=-\langle T^{ij},\chi\rangle-\langle T^{kj},x^i\partial_k\chi\rangle,
$$
and the last term vanishes because $\partial_k\chi=0$ on a neighbourhood of $\mathcal K$.

(b) The trace of (a) gives $\int\sum_iT^{ii}=0$, so the active mass is $E/c^2$. The isotropic form gives $\int\sum_iT^{ii}=3wE$, which forces $w=0$ when $E\ne0$. For a spherically symmetric measure, Gauss's law gives the exterior potential $-GM_{\mathrm{act}}/r$ with $M_{\mathrm{act}}=E/c^2$.

(c) With $\partial_jn^i=(\delta^{ij}-n^in^j)/r$, one has $\partial_j(n^in^j)=2n^i/r$ and $\partial_j(\delta^{ij}-n^in^j)=-2n^i/r$, while $\partial_j\sigma=\sigma'n^j$. Hence
$$
\partial_jT^{ij}=n^i\left[\sigma_r'+\frac{2}{r}(\sigma_r-\sigma_t)\right],
$$
which vanishes exactly under (S.1b.1). For $\sigma_r=p\,\mathbf 1_{r<R_S}$, $(r^2\sigma_r)'=2rp\,\mathbf 1_{r<R_S}-pR_S^2\delta(r-R_S)$, which gives (S.1b.2), and $\sigma_t$ is determined by $\sigma_r$. The integrated trace is $3p\cdot\tfrac43\pi R_S^3+2(-pR_S/2)4\pi R_S^2=0$, as (a) requires.

(d) By (c), $T^{00}=u_{\mathrm{context}}\mathbf 1_{r<R_S}+\sigma_E\delta(r-R_S)$ and $\sum_iT^{ii}=3p_{\mathrm{context}}\mathbf 1_{r<R_S}-p_{\mathrm{context}}R_S\delta(r-R_S)$, so
$$
\rho_{\mathrm{act}}=\frac{(1+3w_c)u_{\mathrm{context}}}{c^2}\mathbf 1_{r<R_S}
+\frac{\sigma_E-p_{\mathrm{context}}R_S}{c^2}\delta(r-R_S).
$$
Gauss's law inside the ball encloses only the uniform term, which gives (S.15); the shell lies outside every interior sphere. Outside, (b) gives $-GE/(c^2r)$. Continuity at $R_S$ and radial integration of (S.15) give the interior branch of (S.1b.3), which satisfies the Poisson equation on each region, and the flux jump at $R_S$ equals the shell's active surface density. The decaying solution of the Poisson equation is unique, and differences of the interior branch reproduce (S.16). ∎

<a id="theorem-s1b1-actual-context-carrier-stress-and-once-only-time-dependent-partition"></a>**Theorem S.1b.1 (Actual Context-Carrier Stress and Once-Only Time-Dependent Partition).** The finite retained two-context prefix of Theorem L.12.8b, completed by the specified finite reset of that same control and compiled as one constant Hamiltonian below, has one covariant neutral material/ensemble action whose metric variation is its complete positive source. Its actual sector stresses and exchange currents vary during operation. The radiated/reset/thermal/stored records form an exact once-only signed tensor-and-boundary partition, and the complete source has the normalized actual context/readout and observer maps stated below. Every rest, program/interaction, actuation, reset/receiving bank, battery and retained-information factor is owned. The construction retains the admitted two-cell context statistic and uses a finite horizon, imperfect reset and classical smooth material/mean-source convention; it does not derive biological context, the old exact-pure serial resets, a microscopic local-QFT apparatus, nonlinear self-gravity or the separate complexity/maintenance calibration.

*Proof.*

**2. Fully specified finite context source and gate word**

Use independently supplied units with $c=\hbar=E_0=\Delta=1$, where $\Delta$ is a proper-time unit; signature is $(-,+,+,+)$. This is a unit convention, not a reset-based calibration of constants.

**2.1 Original typed context prefix**

Retain the source of L.12.8b:

\[
\mathcal H_S=\operatorname{span}\{|s_0\rangle,|s_1\rangle\},\quad
\langle s_0|s_1\rangle=0,\quad H_S=0,
\quad c_*(s_c)=c.
\]

The source input is classical in this basis, with any declared distribution $q_0,q_1$. The source itself is retained. The initial control $C$, pointer $M$ and logs $R_C,R_M$ are degenerate zero bits. The carrier $a$ and target $T$ have unit excitation gaps; their initial state is $|0,g\rangle$. The **actuation** battery $B_{A}$ has levels 0,1 and initially has energy 1. It is distinct from the reset work ladder $W$.

The first six full unitaries are exactly the corresponding L.12.8b matrices at these parameters:

1. $G_{0}$: controlled $X$ from $S$ to $C$, so $|s_c,0\rangle\mapsto|s_c,c\rangle$.
2. $G_{1}$: for $C=1$, swap $|0\rangle_a|1\rangle_{B_A}$ and $|1\rangle_a|0\rangle_{B_A}$; for $C=0$ and on the remaining basis states, act identically.
3. $G_2$: $\exp[-i(\pi/6)(a\sigma_++a^\dagger\sigma_-)]$ on $a,T$.
4. $G_{3}$: copy the target energy bit into $M$ by $\mathrm{CNOT}(T,M)$.
5. $G_4$: copy $C$ to $R_{C}$ and $M$ to $R_{M}$ by their two CNOTs.
6. $G_5$: the two full return swaps of L.12.8b. For $C=1,M=0$, swap $(a,T,B_A)=(1,g,0)$ and $(0,g,1)$; for $C=1,M=1$, swap $(0,e,0)$ and $(0,g,1)$. Act as identity on every other basis state.

Every swapped pair has equal bare energy. $G_{2}$ preserves $a+T$ excitation. All copy targets and controls except the target energy label are degenerate. Thus every $G_0,\dots,G_5$ commutes with

\[
H_{\rm ctx}=H_a+H_T+H_{B_A}.
\]

All six commute with each source-label projector $|s_c\rangle\langle s_c|$. They define full unitaries on all 256 basis states of $S,C,a,T,B_A,M,R_C,R_M$, not merely on prepared inputs.

At the sixth checkpoint, $a,T,B_A$ have returned exactly to $|0,g,1\rangle$. The retained pointer law is

\[
\Pr(M=1\mid S=s_c)=c/4,\quad R_C=c,\quad R_M=M.
\tag{S.1b.1.1}
\]

For $c=1$ the two amplitudes before tracing records are $\sqrt{3}/2$ and $-i/2$. Consequently (S.1b.1.1) is a classical **pointer law**; no assertion that the entire global state has been dephased is required. Arbitrary retained correlations are kept in the actual density matrix.

The target channels before readout are the original $\Phi_{c}$. At $\theta=\pi/6$ their Kraus operators are

\[
\begin{aligned}
\Phi_0:&\quad \operatorname{diag}(1,\sqrt3/2),\quad -\tfrac i2|g\rangle\langle e|,\\
\Phi_1:&\quad -\tfrac i2|e\rangle\langle g|,\quad \operatorname{diag}(\sqrt3/2,1).
\end{aligned}
\]

Their adjoint products sum to $I$. Thus $L=\Phi_1-\Phi_0$ is trace-annihilating and Hermiticity preserving, and the ground-state/excitation-effect response is exactly 1/4. This supplies an actual nonzero source-to-target response, rather than attaching a context label to an unrelated reset engine. It is not a claimed universal value of CC.

**2.2 Actual finite reset of that same control C**

Use the accepted $n=2$ hot kernel, with C itself as its reset memory. All following stocks are present at time zero:

- An independent fresh degenerate bit $Y$ in $I/2$, with no retained purifying preparation label.
- Eight hot cells $h_{j}$, gaps $j/4$, Gibbs populations $h_j=1/(1+2^j)$ at $\Theta=1/(4\ln 2)$.
- Eight unused cold ground cells with the same gaps, explicitly retained and owned.
- An independent matching eight-cell receiving bank $R$, initially in the same Gibbs state.
- Reset battery $W$ with 288 levels $k/4$, $k=0,\dots,287$, initially $|\eta\rangle=(1/16)\sum_{k=16}^{271}|k\rangle$.
- A 37-state degenerate hot pointer $T_{h}$ and a 10,656-state degenerate final pointer $T_{f}$, both blank.

The next five gates are:

7. $G_6$: $\mathrm{SWAP}(C,Y)$. This transfers the actual old context control and all its correlations into retained $Y$. The new $C$ is independent $I/2$, including relative to the entire old $S,M,R_C,R_M$ block and the fresh reset banks and $W$.
8. $G_7$: the full hot energy-shell unitary $U_{h}$ on $C,h,W$.
9. $G_8$: copy hot-bank energy integer $b=\sum_{j=1}^8 jb_j$ into $T_{h}$ modulo 37.
10. $G_9$: $\mathrm{SWAP}(h,R)$.
11. $G_{10}$: copy $288r+k$ into $T_{f}$ modulo 10,656, where $r$ is the receiver's energy integer and $k$ the $W$ level.

For completeness, $U_{h}$ acts on the central ladder band $8\le k\le 279$ as

\[
(p,b_1,\ldots,b_8;k)\mapsto
(b_8,p,b_1,\ldots,b_7;k-s),\quad
s=p+\sum_{j=1}^7b_j-8b_8.
\tag{S.1b.1.2}
\]

Within each finite energy shell, extend the prescribed injective map by the fixed lexicographic bijection between its unused domain and unused range; the zero-energy shell is identity. This is the accepted kernel's full completion rule. The actual initial ladder support $[16,271]$ and $|s|\le 8$ ensure that every populated input uses (S.1b.1.2). Equal shell cardinalities guarantee that the completion exists. It fixes the full matrix, including unused states that matter to the compiler spectrum.

The capture gate acts on degenerate factors. $U_{h}$ conserves hot+W bare energy. Receiver swap and both pointer copies commute with their measured bare energies. Hence all eleven gates commute with the **complete** bare Hamiltonian

\[
H_0=H_{\rm ctx}+H_h+H_{\rm cold}+H_R+H_W.
\tag{S.1b.1.3}
\]

The source S, original readout M and the logs are unchanged by the last five completed gates. No exact-pure reset is claimed: the final control excitation probability is 1/257. No other record is erased or replaced. In particular, this is a new finite physical completion of the original six-unitary prefix, not a claim that its earlier conditional four-reset service has been implemented unchanged.

**3. One constant Hamiltonian and its complete resource source**

Include a 12-state program rail $Z$, initially 0, of zero bare energy. Set $G_{11}=I$ and define

\[
J=\sum_{j=0}^{11}|j+1\pmod {12}\rangle\langle j|\otimes G_j.
\]

It is unitary and commutes with $H_{0}$. On each joint spectral subspace $H_0=e$ and $J=e^{-i\phi}$, choose the fixed $[0,2\pi)$ residue and set

\[
K=[\phi-e]_{2\pi},\qquad H=H_0+K.
\tag{S.1b.1.4}
\]

Thus $0\le K<2\pi$, $[K,H_0]=0$, and $\exp(-iH)=J$ exactly. For every state $\psi$ and $0\le j\le 11$,

\[
e^{-ijH}(|0\rangle_Z\otimes\psi)
=|j\rangle_Z\otimes G_{j-1}\cdots G_0\psi.
\tag{S.1b.1.5}
\]

Equation (S.1b.1.5) is the response-faithful checkpoint intertwiner. It is proved by spectral calculus and induction, not by treating this source as an uncompiled gate sequence. The compiler is applied **once to all eleven gates**, including both meters and the original context registers.

All eleven physical operations have the positive supplied checkpoint duration $\Delta$. The constant H can create transient correlations and energy excursions on any included factor between checkpoints. Its support is the whole local material module over the finite observation slab. No identity extension to an earlier, strictly separated stage-tube implementation is claimed; no port is exposed at those fractional times. This does not introduce a spacelike signal between separate modules, whose evolution is the direct material-local evolution below.

The full source-label projectors commute with $J,H_0,K,H$, because every gate preserves $S$. They therefore remain retained even between checkpoints. The control $C$ need not remain fixed during encoding or reset.

Choose rest coefficient $M_{0}=1$. For context $c$ let $\rho_{\mathrm{in},c}$ be the explicitly listed product input with $S=s_c$ and let $\kappa_c=\operatorname{Tr}(\rho_{\mathrm{in},c}K)$. This is an exact finite trace of the fully specified matrix (S.1b.1.4), not a fitted coefficient or an omitted owner. It obeys $0\le\kappa_c<2\pi$. With

\[
E_{h,\rm in}=\frac{328661261}{805949430},
\]

the exact total source energy per material weight is

\[
E_c=2+\frac{287}{8}+2E_{h,\rm in}+\kappa_c.
\tag{S.1b.1.6}
\]

The first 2 counts $M_{0}$ and the actual unit-energy actuation battery once. The reset ladder contributes $287/8=35.875$; hot and receiver Gibbs banks each contribute $E_{h,\mathrm{in}}$; cold is ground. All zero-energy source/control/archive/pointer factors are nevertheless present in the state and $K$. Their preparation, entropy and correlations are owned, not assumed free.

The bare spectral maximum is $3+3\cdot 9+287/4=407/4$. Therefore

\[
E_c<E_{\max}:=1+407/4+2\pi.
\tag{S.1b.1.7}
\]

For an input mixture $q$, $E_q=\sum_cq_cE_c$. No uncomputed old $\kappa$, source-energy number or old radius is reused. There is no assumption that $E_{0}$ and $E_{1}$ agree or differ. In either case the full state-to-source map is specified exactly by the action; the observable context contrast (S.1b.1.1) is nonzero.

**4. Metric variation of that very carrier**

Let $A$ be a bounded material label region and $\nu\in C_c^\infty(A)$, $\nu\ge 0$. On a smooth timelike noncrossing material map $x(a,s)$, define $N=\sqrt{-g(x',x')}$, $u=dx/d\tau$ and $d\tau=N\,ds$. The internal density is $\rho=U\rho_0U^\dagger$ on the **complete** finite Hilbert space above. Define

\[
S_{\rm mat}=\int_A\nu(a)d^3a\int ds\,
\{i\operatorname{Tr}(\rho_0U^\dagger\partial_sU)
-N[1+\operatorname{Tr}(\rho H)]\}.
\tag{S.1b.1.8}
\]

This is the accepted covariant spinless internal-state material action, now with the actual eleven-gate context Hamiltonian. H has no extra x, metric, velocity or spin dependence. This is an explicit constitutive semiclassical/mean-source branch. It is neither a finite microscopic local-QFT construction nor an uncountable tensor product of separately prepared quantum devices.

For a Hermitian endpoint-fixed internal variation $\delta U=iAU$, integration by parts gives

\[
\delta_U S=\int\nu\,ds\,\operatorname{Tr}A(\rho'+iN[H,\rho]),
\quad i\,d\rho/d\tau=[H,\rho].
\tag{S.1b.1.9}
\]

Thus (S.1b.1.5), the response law (S.1b.1.1), the actual reset and all its currents arise from the same variational dynamics. $E=1+\operatorname{Tr}\rho H$ is constant along each line.

Hold $x$ and $U$ fixed during metric variation. Since $\delta N=-Nu^\mu u^\nu\delta g_{\mu\nu}/2$ and the Berry term is metric independent,

\[
\delta_g S=\tfrac12\int\nu\,d^3a\,d\tau\,
E(a)u^\mu u^\nu\delta g_{\mu\nu}(x),
\quad
T^{\mu\nu}(y)=\int\nu\,d^3a\,d\tau\,
E(a)u^\mu u^\nu\delta_g(y,x(a,\tau)).
\tag{S.1b.1.10}
\]

The metric derivative is taken before substituting the internal on-shell solution; it cannot be erased by an on-shell cancellation in the action. Trajectory variation gives $\nabla_\tau(Eu)=0$. Since $E>0$ and $E'=0$, the material lines are geodesics. No unowned clamp or external force is inserted.

Before caustics, the transported material current satisfies $\nabla_\mu(nu^\mu)=0$ and

\[
T^{\mu\nu}=nE u^\mu u^\nu,\qquad\nabla_\mu T^{\mu\nu}=0.
\tag{S.1b.1.11}
\]

A complete nonempty witness is Minkowski $x(a,t)=(t,a)$, $U=e^{-itH}$, a uniform internal input, and the normalized bump

\[
\nu_R(x)=C_R e^{-1/(1-|x|^2/R^2)}\mathbf1_{|x|<R},
\quad\int\nu_Rd^3x=1,
\quad R=10^6GE_{\max},\quad G>0.
\tag{S.1b.1.12}
\]

The normalizer $C_{R}$ is the reciprocal of its positive finite radial integral. Then $T^{00}=\nu_RE$, $T^{0i}=T^{ij}=0$, a smooth spatially compact positive conserved source with no boundary-force term. The time window $[0,11]$ restricts a continuing solution; extending the source by zero outside that window is not allowed.

For each fixed finite model, weighted material-cell Riemann sums of (S.1b.1.8) converge, together with their metric variations against every smooth compact test, by the uniform modulus-of-continuity bound

\[
|\sum_iw_iF(a_i)-\int\nu F|\le(\int\nu)\omega_F(h)\longrightarrow0.
\]

This establishes the same-action material source, rather than smoothing an unrelated point tensor. The weights are material/ensemble weights, not integer device counts. No equality with the MPU retained-cost action is needed or claimed.

**5. Source-exhaustive sector currents and one-time partition**

Split the complete energy operator into rest $I$, $H_a,H_T,H_{B_A},H_h,H_{\mathrm{cold}},H_R,H_W$ and $K$, retaining all degenerate-information factors as inventoried zero-bare-energy sectors. $K$ owns the entire interaction/program contribution once. No interaction term is duplicated among banks.

For every sector $\alpha$ put $e_\alpha=\operatorname{Tr}\rho H_\alpha$, including $e_{\mathrm{rest}}=1$. Its actual partial potential action is $-\int\nu Ne_\alpha$. Metric variation and (S.1b.1.9) give, on the rest witness,

\[
T_\alpha^{\mu\nu}=\nu_R e_\alpha(t)u^\mu u^\nu,
\quad f_\alpha^\nu:=\partial_\mu T_\alpha^{\mu\nu}
=\nu_R q_\alpha(t)u^\nu,
\quad q_\alpha=i\operatorname{Tr}\rho[H,H_\alpha].
\tag{S.1b.1.13}
\]

The finer exchange matrix $q_{\alpha\beta}=i\operatorname{Tr}\rho[H_\beta,H_\alpha]$ is antisymmetric, $q_\alpha=\sum_\beta q_{\alpha\beta}$, and $\sum_\alpha q_\alpha=0$. In particular, $q_K=q_{\mathrm{rest}}=0$. All bare-sector excursions mediated by $K$ remain in (S.1b.1.13), including old records or banks whose checkpoint energy change is zero. There is no unsupported pointwise assertion $q_h=-q_W$.

**5.1 Explicit nonzero reset and thermal transfers**

After capture, the fresh C is independent uniform even when the original context prefix left coherent correlations in the old block. This follows from the full operator identity

\[
\operatorname{SWAP}_{C,Y}(\rho_{C\mathcal R}\otimes I_Y/2)
\operatorname{SWAP}_{C,Y}^\dagger
=I_C/2\otimes\rho_{Y\mathcal R}.
\tag{S.1b.1.14}
\]

At completed hot and relay stages, (S.1b.1.2) and the receiver swap therefore give

\[
\begin{array}{c|ccc}
&\Delta E_W&\Delta E_h&\Delta E_R\\
\text{hot reset }[7,8]&-H_2&H_2&0\\
\text{relay }[9,10]&0&-H_2&H_2\\
\text{combined}&-H_2&0&H_2 .
\end{array}
\tag{S.1b.1.15}
\]

All other energetic sectors have zero change across these stages. The original actuation energy is returned already at checkpoint 6. The two receipts are physically distinct, but the reset battery pays $H_{2}$ only once. Equation (S.1b.1.13) integrates to (S.1b.1.15); these are action-derived energy currents, not hand-assigned stress coefficients. Since $H_{2}>0$, at least the hot, receiver and W sector energies genuinely vary during operation.

**Exact hot-source endpoint proof.** For this source, $N=8$, $\delta=1/4$ and $\Theta=1/(4\ln 2)$; the generic $H_{n}$ below is $H_{2}=2963264459/9671393160$ on the fixed $n=2$ member.

Set $h_j=(1+\exp(j\delta/\Theta))^{-1}$, $h_0=1/2$. From the displayed permutation the bank output populations are $h_0,h_1,\dots,h_{N-1}$, $P_{\mathrm{out}}$ has population $h_N$, and its battery change is $-\delta s$ in every populated classical input component. Hence

$$
\begin{aligned}
H_n &= \sum_{j=1}^{N} j\delta(h_{j-1} - h_j) > 0, \\
\Delta\langle H_h\rangle &= H_n, \qquad \Delta\langle H_W\rangle = -H_n, \\
\Delta\langle H_c\rangle &= \Delta\langle K\rangle = \Delta M_0 = 0.
\end{aligned}
$$

Every other energetic factor has zero checkpoint change. Integrating (S.1b.1.13) over the actual reset interval reproduces exactly these values. In particular, the action-derived hot current, not a hand-assigned tensor, integrates to Hn.

**5.2 Exact tensor-and-boundary partition**

Fix a spatial volume V containing the bump with a zero-density neighborhood of its side boundary. For stage j, let $X_{j}$ be the original L.6a space of signed symmetric tensor records together with their actual oriented boundary four-flux. Define

\[
R_{j,\alpha}=(T_\alpha|_{I_j\times V},\operatorname{tr}_{\partial(I_j\times V)}T_\alpha),
\quad B_{j,\alpha}^{\mu\nu}=\nu_R e_\alpha(j)u^\mu u^\nu,
\quad Q_{j,\alpha}=R_{j,\alpha}-B_{j,\alpha}.
\tag{S.1b.1.16}
\]

B denotes both the displayed tensor and its corresponding boundary record. It is the stage-initial physical sector coefficient transported with the actual material flow. It is not refrozen in each observer's coordinates.

Because $\sum_\alpha e_\alpha(t)=E=\sum_\alpha e_\alpha(j)$ at every time,

\[
\sum_\alpha Q_{j,\alpha}=0\quad\text{in }X_j,
\qquad R_{j,\alpha}=B_{j,\alpha}+Q_{j,\alpha}.
\tag{S.1b.1.17}
\]

This equality holds pointwise for bulk tensors and hence for every oriented boundary component. It is stronger than endpoint scalar conservation or cancellation of sector divergences.

Populate the exact owner map as follows:

- External source coordinate: zero, because the body is closed.
- Radiated coordinate: zero, derived below.
- Reset coordinate: $Q_{7,h}$, the receiving hot-bank change on stage [7,8].
- Thermal coordinate: $Q_{9,R}$, the receiving-bank change on [9,10].
- Stored coordinates: every other $Q_{j,\alpha}$, including negative donor changes, context/actuation transfers, meter stages and all zero-integral fractional-time excursions.

Each elementary pair $(j,\alpha)$ appears once, without changing its sign. Thus both original L.6a maps are literally

\[
\mathfrak D=0-\sum_\alpha Q_{j,\alpha}=0,
\quad\mathscr R_{\rm tot}=0+\sum_\alpha Q_{j,\alpha}=0.
\tag{S.1b.1.18}
\]

Here the latter is the **net source-change record**, not the positive absolute metric source. The full source is reconstructed as

\[
R_{\rm physical}=\operatorname{Glue}_j\sum_\alpha
(B_{j,\alpha}+Q_{j,\alpha}).
\tag{S.1b.1.19}
\]

Adjacent top/bottom records cancel under gluing. Baseline stocks, rest, K and all correlations remain in the physical history. Adding $H_{2}$ again as mass, summing unsigned payer/receiver histories, using \(\mathscr R_{\rm tot}=0\) to erase the whole source, or counting a receiving heat term both as reset and thermal in the same occurrence would contradict (S.1b.1.16)–(S.1b.1.19).

**5.3 Zero radiation is derived, not omitted**

The specified action is neutral and contains no Maxwell charge or coupling. Include a Maxwell sector with $J_{\mathrm{EM}}=0$ and zero free initial data; its unique selected solution is $F=0$, so its stress, source and outgoing radiation records vanish. The material stays at rest, all banks are internal, and $\nu_{R}$ vanishes near the body's side boundary; therefore physical thermal and mechanical side export are zero. The thermal **internal relay** in (S.1b.1.15) is nonzero and is not relabeled as exterior heat flow.

For the declared linearized gravitational response with no free radiation, the full conserved source gives

\[
\bar h^{00}(x)=4G\int\frac{\nu_R(y)E}{|x-y|}d^3y,
\quad\bar h^{0i}=\bar h^{ij}=0.
\tag{S.1b.1.20}
\]

It is constant throughout the finite operation. The same linear solution map, including the initial constraint-field data, sums all sectors; exchanging individual sectors are not independent harmonic-gauge Einstein sources. The accepted bump estimate gives \(\|\bar h^{00}\|_\infty<6.7\cdot10^{-5}\) using the new $E_{\max}$ and R in (S.1b.1.12). No nonlinear self-gravitating apparatus is asserted.

**Finite weak-field source bound.**

A concrete weak-field bound is also available at this fixed $n$. Since $\nu_R\le 6e^{1/3}/(\pi R^3)$ and the maximum Newton-kernel integral over its support is at most $2\pi R^2$, (S.1b.1.20) gives

$$
\begin{aligned}
\lVert \bar{h}^{00}\rVert_\infty &\le 48e^{1/3}\, GE/R \\
&\le 48e^{1/3} \cdot 10^{-6} < 6.7 \cdot 10^{-5}.
\end{aligned}
$$

For the density bound, lower-bound the normalization integral using $r\le R/2$, where the unnormalized bump is at least $e^{-4/3}$, and upper-bound its maximum by $e^{-1}$. The Newton bound follows from radial integration/rearrangement for a ball. This controls the selected linear perturbation at the stated finite $n$; it does not solve nonlinear self-gravity or permit a bounded-source $n\to\infty$ limit.

**6. Observable and observer maps on the same physical history**

The actual unitary copies implement the final retained pointer algebra. Their joint outcome $o=(m,b,r,k)$ is read at checkpoint 11, without deleting source, pointer or old-bank factors. For each $c$, the effects are the terminal commuting pointer projectors pulled back through the eleven-gate word. The outcome maps are CP because they are a unitary dilation followed by those projectors, and their sum is trace preserving because all pointer labels are included. No intermediate full-state collapse is assumed.

The joint law has an explicit finite expression. Write $\gamma(\vec{b})=\prod_{j=1}^8h_j^{b_j}(1-h_j)^{1-b_j}$, define $\vec{b}'=(p,b_1,\dots,b_7)$, $b'=\sum_jj\vec{b}'_j$, and $s$ as in (S.1b.1.2). Then

\[
\Pr(m,b,r,k'\mid c)=p_{m|c}
\sum_{p=0}^1\sum_{\boldsymbol b\in\{0,1\}^8}
\sum_{k=16}^{271}\frac{\gamma(\boldsymbol b)}{512}
\mathbf1_{b=b'}\mathbf1_{r=b'}\mathbf1_{k'=k-s},
\tag{S.1b.1.21}
\]

where $p_{1|c}=c/4$ and $p_{0|c}=1-c/4$. The initial receiver's independent Gibbs law sums to one after the swap. Formula (S.1b.1.21) is a terminal measurement law, not a two-projective-measurement trajectory definition of heat. It is normalized, retains every possible outcome, preserves (S.1b.1.1), and yields

\[
\mathbb E[b/4]=\mathbb E[r/4]=E_{h,\rm in}+H_2,
\quad\mathbb E[k'/4]=287/8-H_2.
\tag{S.1b.1.22}
\]

The intermediate hot copy is legitimate on this source: after hot reset the state is block diagonal in its hot energy, even with its conditioned coherent battery packets. Copying it leaves the preexisting marginal unchanged while retaining new pointer correlations. Its subsequent complete swap moves that block and those correlations to R. The prefix's possible M coherence does not change this fact, because (S.1b.1.14) makes the current hot-reset input independent of the old block.

Supplied units, state, gates and standards determine these means and the complete stress without fitting. If $\varepsilon_{\mathrm{prep}}$ bounds initial trace error, $\varepsilon_{H}$ bounds Hamiltonian error and $\delta T$ is the time error, Duhamel gives the conservative endpoint trace-error bound

\[
\epsilon_{\rm out}\le\epsilon_{\rm prep}+2T\epsilon_H
+2\|H\||\delta T|,
\quad T\le\max(11,11+\delta T),
\]

capped at 2, with actual nonnegative elapsed time used. Observable errors add their operator calibration and input-mean errors. Bounded-outcome independent diagnostic runs then admit the usual finite Hoeffding bounds. These are formal source/observable maps and stated calibration premises, not fabricated measurements.

For every smooth observer X,

\[
J_{\alpha,X}^\mu=-T_\alpha^{\mu\nu}X_\nu,
\quad\nabla_\mu J_{\alpha,X}^\mu
=-f_\alpha^\nu X_\nu
-\tfrac12T_\alpha^{\mu\nu}(\mathcal L_Xg)_{\mu\nu}.
\tag{S.1b.1.23}
\]

This applies separately to actual histories, transported baselines and signed changes. For $X=\cosh(\beta t)\partial_t+\sinh(\beta t)\partial_1$ with $\beta=1/10$, the complete observed energy is $E\cosh(\beta t)$, with derivative $\beta E\sinh(\beta t)$. Thus source conservation does not erase non-Killing observer work. The full positive baseline carries that work even though the net signed change map (S.1b.1.18) is zero.

**7. Original-owner scope, baseline distinction and conclusion**

The same-carrier diagram is explicit:

\[
\text{retained typed context }s_c\longmapsto\rho_{\rm in,c}
\xrightarrow{\text{one }H}\rho_c(t)
\longmapsto\begin{cases}
\text{normalized pointer law (S.1b.1.21)},\\
e_\alpha(t)\longmapsto T_\alpha,f_\alpha\longmapsto(B,Q),\\
T_{\rm total}=\delta_gS_{\rm mat}\longmapsto\text{observer/gravity records}.
\end{cases}
\]

No phenomenological stress, reset rate or heat coefficient is substituted on a separate apparatus. The internal context prefix has an actual nonzero response; the control it used is the actual control captured and imperfectly reset; all old correlations remain owned. Metric variation and the all-time transaction partition follow from precisely the same H and material action.

**Three distinct baselines must remain distinct.**

1. $B_{j,\alpha}$ is a transported **stage-initial energy history**, used only for literal signed transaction balance.
2. The context intervention contrast $T_1-T_0$, if considered, compares the same full action with two retained source preparations. It is not automatically positive or equal to cumulative reset heat.
3. S.9's minimal-operational tensor at $C_{\mathrm{agg}}=C_{\mathrm{op}}$ and its high-complexity excess are **complexity-qualified constitutive data**. Neither $B$ nor $Q$ is identified with them here. No $C_{P}$ minimum, S.3/S.5 maintenance law or S.6 retained-energy calibration follows from this corollary.

That separation does not omit an original S02 source clause. Its exact surviving row and R1 residual ask for actual-carrier metric variation and the time-dependent once-only partition/observable realization. They do not require the distinct S05 coefficient/calibration program or BSR05 MPU-cost/action identity. The context identity here is inherited from the same admitted L.12.8b source premise and realized by its actual prefix, rather than supplied by relabeling the stage baseline as high-complexity energy.

∎

<a id="theorem-s1c-exact-confined-fluid-geometry-and-weak-field-clock-error"></a>**Theorem S.1c (Exact Confined-Fluid Geometry and Weak-Field Clock Error).** Register the following nonlinear continuation of the nominated source in Theorem S.1b(d). Its bulk has constant local rest-frame energy density $u>0$, areal radius $R>0$ and boundary pressure $p(R)=wu$, with $0\le w\le1$; its infinitesimal shell has proper surface energy density $\sigma_E\ge0$. The background obeys the Einstein equation, with this isotropic bulk fluid, the complete Israel shell stress and vacuum outside. Fix $G,c>0$ and write
$$
x=\frac{8\pi GuR^2}{3c^4},\quad
s=\frac{4\pi GR\sigma_E}{c^4},\quad
a=\sqrt{1-x},\quad b=a-s,\quad \eta=1-b^2.
\tag{S.1c.1}
$$
The exact static family has $0<x<1$, $b>0$ and $3(1+w)a>1+3w$. Its uniform weak-field box is
$$
0<x\le\frac1{16},\qquad 0\le s\le\frac1{16},\qquad
0\le w\le1,\qquad \varepsilon=x+s.
\tag{S.1c.2}
$$
The error bounds below compare this specified Einstein continuation with S.1b(d); they do not identify all nonlinear materials sharing its leading tensor. A positive causal material realization of a stated subfamily is supplied in item 4. Clock, spin, support, null-signal, control and record services use the explicit background/test convention of Theorem S.7.3c: their finite resources are retained as test-sector owners, and their stress has zero backreaction coupling in the background equation. The full nominal family and this material subfamily remain distinct source domains.

1. **Exact filled source and its shell.** Put $z=r/R$, $y(r)=\sqrt{1-xz^2}$ inside the source, and
$$
\begin{aligned}
D(r)&=3(1+w)a-(1+3w)y(r),\\
N_-(r)&=\frac{bD(r)}{2a},&
p(r)&=u\frac{(1+3w)y(r)-(1+w)a}{D(r)},\\
N_+(r)&=\sqrt{1-\eta R/r},&
M&=\frac{c^2R}{2G}\eta.
\end{aligned}
\tag{S.1c.3}
$$
The line elements are
$$
ds^2=\begin{cases}
-N_-^2c^2dt^2+y^{-2}dr^2+r^2d\Omega^2,&0\le r<R,\\
-N_+^2c^2dt^2+N_+^{-2}dr^2+r^2d\Omega^2,&r>R.
\end{cases}
\tag{S.1c.4}
$$
Both induced lapses at $R$ equal $b$. The center has its regular Cartesian interpretation. The mixed shell stress in its rest frame is $S^a{}_b=\operatorname{diag}(-\sigma_E,p_s,p_s)$, with
$$
p_s=\frac{c^4}{8\pi GR}
\left[\frac{1+b^2}{2b}-a-\frac{(1+3w)x}{2a}\right].
\tag{S.1c.5}
$$
There is no extra clamp or omitted confinement sector. The interior pressure solves the TOV equation, has $p(R)=wu$, and differs from the nominal uniform pressure by
$$
\frac{p(r)}u-w
=\frac{(1+w)(1+3w)x(1-z^2)}{[y(r)+a]D(r)}\ge0.
\tag{S.1c.6}
$$
On (S.1c.2) this difference is at most $3x$. The shell tension tends to the original value $-wuR/2$ at leading weak-field order; quantitatively,
$$
\left|p_s+\frac{wuR}{2}\right|
\le\frac{3c^4}{8\pi GR}\varepsilon^2
\quad\text{on (S.1c.2)}.
\tag{S.1c.7}
$$

2. **Energy and volume ownership.** Define the bulk coordinate mass and proper shell mass by
$$
m_0=\frac{4\pi uR^3}{3c^2},\qquad
m_s=\frac{4\pi R^2\sigma_E}{c^2}.
$$
The exact proper bulk volume, proper material energy and ADM mass satisfy
$$
\begin{aligned}
V_{\mathrm{prop}}&=4\pi R^3
\frac{\arcsin\sqrt x-\sqrt x\sqrt{1-x}}{2x^{3/2}},\\
E_{\mathrm{mat}}&=uV_{\mathrm{prop}}+m_sc^2,\\
M&=m_0+a m_s-\frac{Gm_s^2}{2Rc^2}.
\end{aligned}
\tag{S.1c.8}
$$
The binding contribution is $Mc^2-E_{\mathrm{mat}}$, counted once. The alternative active-stress balance is
$$
Mc^2
=\frac ba(1+3w)m_0c^2
+b\,4\pi R^2(\sigma_E+2p_s).
\tag{S.1c.9}
$$
The first term is the complete redshifted bulk Komar integral and the second its shell contribution. These are alternative decompositions of the same total.

The Euclidean nominal volume is $V_0=4\pi R^3/3$, and
$$
1\le\frac{V_{\mathrm{prop}}}{V_0}\le\frac1a,
\qquad
0\le u(V_{\mathrm{prop}}-V_0)\le uV_0\left(\frac1a-1\right).
\tag{S.1c.10}
$$
Thus $uV_0$ is the leading volume entry in S.1b(d), while $uV_{\mathrm{prop}}$ is the actual bulk material holding. An exact use of the retained-energy calibration (S.6) sets $V_S=V_{\mathrm{prop}}$; retaining $V_0$ instead carries (S.1c.10)'s volume correction. The source is static during a run, with no operating bulk or shell heat flow, radiation or external work. Preparation supplies the complete ready material/geometry sector before the run.

3. **Uniform nonlinear metric and clock remainders.** The original dimensionless potential $\phi=\Phi/c^2$ is
$$
\phi(r)=\begin{cases}
-x/2-s-(1+3w)x(1-z^2)/4,&0\le r\le R,\\
-(x/2+s)R/r,&r\ge R.
\end{cases}
\tag{S.1c.11}
$$
For the full exact family in item 1 put
$$
\begin{aligned}
B_-&=\frac{x^2}{2(1+a)^2}
+\frac{(1+3w)x}{4}\left[\frac{x}{a(1+a)}+\frac{s}{a^2}\right],\\
B_+&=\frac{\eta^2}{2(1+b)^2}+\frac{sx}{1+a}+\frac{s^2}{2}.
\end{aligned}
\tag{S.1c.12}
$$
Then $|N_--(1+\phi)|\le B_-$ and $|N_+-(1+\phi)|\le B_+$ throughout their respective regions. On (S.1c.2), both are at most $\varepsilon^2$, and the remaining metric-component bounds in these fixed areal coordinates are
$$
\begin{aligned}
|N^2-(1+2\phi)|&\le5\varepsilon^2,\\
\left|y^{-2}-(1+xz^2)\right|&\le\frac{16}{15}x^2\quad(r\le R),\\
\left|N_+^{-2}-[1+(x+2s)R/r]\right|&\le7\varepsilon^2\quad(r\ge R).
\end{aligned}
\tag{S.1c.13}
$$
The angular metric is exactly $r^2d\Omega^2$.

Use a finite exterior reference clock at $r_f>R$, with lapse $N_f=\sqrt{1-\eta R/r_f}$. A static test clock at any registered radius has proper-time ratio $\gamma(r)=N(r)/N_f$ to that reference; a clock attached to the shell uses its induced lapse $b$. For any two radii $r_1,r_2\ge0$, let $B(r)=B_-$ inside and $B_+$ outside, using either bound at the common interface. Then
$$
\left|\gamma(r_2)-\gamma(r_1)-[\phi(r_2)-\phi(r_1)]\right|
\le\frac{B(r_1)+B(r_2)+|\phi(r_2)-\phi(r_1)|[|\phi(r_f)|+B_+]}{N_f}
\le5\varepsilon^2
\tag{S.1c.14}
$$
on (S.1c.2). This includes interior, exterior, mixed and coincident clock pairs.

For $0\le z_1<z_2\le1$, the sharper exact transfer is
$$
\begin{aligned}
\gamma(r_2)-\gamma(r_1)
&=\frac{(1+3w)x(z_2^2-z_1^2)}4\,F_{12},\\
F_{12}&=\frac{b}{aN_f}\frac2{y(r_1)+y(r_2)},\\
|F_{12}-1|&\le
\frac{x/[a(1+a)]+s/a^2+1-N_f}{N_f}
\le3\varepsilon.
\end{aligned}
\tag{S.1c.15}
$$
The leading factor is precisely (S.16) divided by $c^2$. Its separate radial-gradient truncation $L_q/(2r)$ is retained when that approximation is used. Multiplying (S.1c.14) or (S.1c.15) by a specified reference proper interval and a physical spin frequency gives the corresponding phase error, with no unidentified proportionality constant.

4. **A causal material realization on an explicit subfamily.** Choose
$$
0<x\le\frac1{16},\qquad w=\frac16,\qquad s=\frac x2.
\tag{S.1c.16}
$$
Here $1/6\le p(r)/u\le13/57<1/4$ and $-1/3<p_s/\sigma_E<0$. Fix a proper particle density $n_0>0$. Let $\chi$ be a varied advected composition field, with ready value $r^2/R^2$, and set $p_\chi$ to the source function $p(R\sqrt\chi)$ from (S.1c.3). Register the material energy function
$$
\epsilon(n,\chi)=(u-p_\chi)\frac n{n_0}
+p_\chi\left(\frac n{n_0}\right)^2.
\tag{S.1c.17}
$$
The ready state $n=n_0$ has uniform energy density $u$ and the exact pressure $p_\chi$. It is a composition-stratified compressible fluid. Its density derivative is taken at fixed advected composition, giving
$$
p=n\epsilon_n-\epsilon,
\qquad
\left.\frac{\partial p}{\partial\epsilon}\right|_\chi
=\frac{2p_\chi n/n_0}{u-p_\chi+2p_\chi n/n_0},
\quad
\left.\frac{c_{s,\mathrm{bulk}}^2}{c^2}\right|_{n_0}
=\frac{2p_\chi}{u+p_\chi}<\frac25.
\tag{S.1c.18}
$$
Both coefficients in (S.1c.17) are positive, and the fixed-composition sound ratio lies in $(0,1)$ for every $n>0$.

For clarity, in units $c=1$ a full conserved-current action is
$$
I_{\mathrm{bulk}}=
\int d^4x\left[-\sqrt{-g}\,\epsilon(n,\chi)
+J^\mu(\partial_\mu\varphi+\alpha_A\partial_\mu\beta^A
+\lambda\partial_\mu\chi)\right],
\quad
n=\frac{\sqrt{-g_{\mu\nu}J^\mu J^\nu}}{\sqrt{-g}},
\quad A=1,2,3.
\tag{S.1c.19}
$$
It is the conserved-current/Lagrangian-coordinate fluid construction (Brown 1993), with a separately varied advected composition label. The three genuine comoving labels $\beta^A$ distinguish fluid worldlines; $\chi$ is not a fixed Eulerian radial coefficient or a replacement for those labels. Variation gives particle conservation, composition advection and the perfect-fluid stress. At readiness $\epsilon_\chi=0$ and $N\epsilon_n=b(1+w)u/n_0$ is constant. The static current, comoving labels, $\lambda=\alpha_A=0$ and $\varphi=b(1+w)u\,t/n_0$ therefore satisfy the material field equations, as well as TOV. The fluid current has no normal component through its material boundary.

For the shell fix $n_{s0}>0$ and the conserved surface-current version of that action, with energy per area
$$
\begin{aligned}
\sigma(n_s)&=B_s+\mu_s n_s+\kappa_s n_s^2,\\
\kappa_s n_{s0}^2&=\sigma_E/8,&
B_s&=\sigma_E/8-p_s,&
\mu_s n_{s0}&=3\sigma_E/4+p_s.
\end{aligned}
\tag{S.1c.20}
$$
All coefficients are positive. At readiness this gives $(\sigma_E,p_s)$, since the surface pressure is $n_s\sigma'(n_s)-\sigma(n_s)=\kappa_s n_s^2-B_s$. Its longitudinal characteristic ratio is $\sigma_E/[4(\sigma_E+p_s)]<3/8$; its transverse membrane principal ratio is $-p_s/\sigma_E<1/3$. The shell's normal-force equation is the pressure balance implied by the junction conditions, including the interior $p(R)$; it introduces no external supporting stress. These are local positive/causal material properties and an exact static solution. They do not assert stability against arbitrary radial, convective or nonspherical perturbations. The calibration bounds below compare registered static sectors, not uncontrolled dynamical disturbances.

5. **Finite causal clock-to-phase and complete response.** Take a finite set of these static source sectors $J$, prepared before the run with specified probabilities $p_J$, independently of spin inputs and subsequent receiver settings. The source label and each sector's actual material parameters remain privately retained, and no mass is changed during interrogation. For a physical material witness use (S.1c.16); the formal clock map applies to every geometry in (S.1c.2). Place the reference clock and the two test spins on one common radial ray, at any fixed finite radii $r_1,r_2\ge0$ for the spins and $r_f>R$ for the reference. A site at $R$ is an induced-worldvolume clock with its declared surface-support service; its proper lapse is $b$. Their lapse ratios are $\gamma_{iJ}=N_J(r_i)/N_{fJ}$. The same local calibrated magnetic gaps $H_i=\hbar\omega_i Z_i/2$ and fixed transverse axes are used in every sector.

Define the signed optical length from the shell by
$$
\begin{aligned}
\Lambda_J(r)&=\begin{cases}
-\displaystyle\int_r^R\frac{d\rho}{y_J(\rho)N_J(\rho)},&0\le r\le R,\\
(r-R)+\eta_JR\log\dfrac{r-\eta_JR}{R-\eta_JR},&r\ge R,
\end{cases}\\
D_{iJ}&=\frac1c\left|\Lambda_J(r_f)-\Lambda_J(r_i)\right|.
\end{aligned}
\tag{S.1c.21}
$$
This is the radial null coordinate delay between the finite reference and site $i$, including interior, exterior, mixed and shell endpoints.
It is finite: $y\ge a>0$, $N\ge N(0)>0$ inside and $N_+^2\ge b^2>0$ outside. The source is transparent to these registered test signals. Triggers separated by reference proper time $T$ therefore arrive separated by local proper time $\gamma_{iJ}T$. Apply the common cubic upward/downward magnetic ramps of Theorem S.7.3c, each of local proper duration $d_i>0$, and require $T\ge\max_{i,J}d_i/\gamma_{iJ}$. Their two half-area ramps and intervening plateau give the exact physical exposure
$$
U_J(T)=\bigotimes_{i=1}^2e^{-iH_i\gamma_{iJ}T/\hbar}.
\tag{S.1c.22}
$$
The field is off before and after exposure. There is no sector-dependent compensating phase.

Use the common output frame $W_T=\bigotimes_i e^{+iH_iT/\hbar}$ and define
$$
V_J(T)=W_TU_J(T),\qquad
\theta_{iJ}=\omega_iT(\gamma_{iJ}-1).
\tag{S.1c.23}
$$
This is an output-frame identification, not an unrecorded physical gate. For local effects $0\le F_i\le I$ set $F_{i,T}=e^{-iH_iT/\hbar}F_i e^{+iH_iT/\hbar}$ and use the explicit positive-duration pointer instrument of Theorem S.7.3c at each site, with both outcomes retained. Write $F_{i,1}=F_i$ and $F_{i,0}=I-F_i$. In the common output frame the complete leaf for $a=(a_1,a_2)$ is
$$
\mathcal I_{a,J}(X)=
\left(\bigotimes_i\sqrt{F_{i,a_i}}\right)
V_J(T)X V_J(T)^*
\left(\bigotimes_i\sqrt{F_{i,a_i}}\right)
\otimes|a\rangle\langle a|_{\mathrm{record}}.
\tag{S.1c.24}
$$
The physical leaf is conjugated as a whole by $W_T$ to give (S.1c.24), including its conditional output state. The private source block remains $J$; summing all four leaves is trace preserving for every two-spin input and spectator. Arbitrary admitted finite later interventions use the cumulative frame $W_{T_1+\cdots+T_n}$ and its conjugated physical settings, exactly as in S.7.3c. This gives all held-source histories and their outcome marginalizations, with the same retained source label throughout.

The populated product-input trial uses at each site the three explicit finite preparation gates, pointer measurement/copy gates and detector service of Theorem S.7.3c, with their local durations and complete private records. The general two-spin formulas admit supplied joint input states with their separate finite joint-preparation/deployment record; the local preparation gates are not asserted to prepare an entangled input. All preparation and deployment intervals precede the declared interrogation boundary and remain in its source ledger. Let $\delta_i$ include the downward ramp and all posttrigger local readout services. A common reference release after
$$
T+2\max_{i,J}(N_{fJ}D_{iJ})
+\max_{i,J}\frac{\delta_i}{\gamma_{iJ}}
+T_{\mathrm{guard}},\qquad T_{\mathrm{guard}}>0,
\tag{S.1c.25}
$$
is causally available for every outcome and source sector. Actual local arrivals, support and service costs remain in the private source record; all compared receiver outputs have this same registered release label. Further exposures use fresh pointers. Finite test supports have zero translational work at their static locations and their actual bulk acceleration is $c^2\sqrt{g^{rr}}\,\partial_r\log N$ on each open region; its center limit is zero. The shell site uses its induced surface-support contract, without evaluating a bulk connection on the distributional jump. The magnetic field, passive coil, interaction-work and detector/clock/signal ledgers are precisely the separate finite test services in Theorem S.7.3c, applied once at each site. Their local stored energies and heat flows have their own lapse conversion to Killing energy. They are not added to the background ADM mass in this declared zero-backreaction model.

6. **Derived covariance and calibrated finite records.** In the binary source case $J\in\{0,1\}$ with $p_0=p$, the phase vector has the exact mean and covariance
$$
\overline\theta=p\theta_0+(1-p)\theta_1,\qquad
\operatorname{Cov}(\theta)=p(1-p)(\theta_0-\theta_1)(\theta_0-\theta_1)^T.
\tag{S.1c.26}
$$
For independent local $|+\rangle$ preparations and local equatorial measurements at angles $\beta_i$, let $A_i\in\{-1,1\}$ be the complete recorded outcomes. Conditional on $J$ they are independent with
$$
\Pr(A_i=a_i\mid J)=\frac{1+a_i m_{iJ}}2,
\qquad m_{iJ}=\cos(\theta_{iJ}-\beta_i).
\tag{S.1c.27}
$$
Writing $m_J=(m_{1J},m_{2J})^T$ gives the actual output mean and covariance
$$
\begin{aligned}
\mu&=pm_0+(1-p)m_1,\\
\Sigma&=\operatorname{diag}\!\left(\sum_Jp_J(1-m_{1J}^2),
\sum_Jp_J(1-m_{2J}^2)\right)
+p(1-p)(m_0-m_1)(m_0-m_1)^T.
\end{aligned}
\tag{S.1c.28}
$$
Thus the source-induced covariance and quantum outcome variance are identified separately. The covariance of the mean of $n$ independent ready-source replicas is $\Sigma/n$. If the same privately held $J$ is used for $n$ conditionally independent repetitions, only the diagonal conditional-noise term is divided by $n$; the last term of (S.1c.28) remains. No observed Gaussian noise model is substituted for either exact law.

For static parameter comparisons within (S.1c.2), put $z_i=r_i/R\in[0,\infty)$ and $\lambda=R/r_f\in[0,1)$. If primes denote a second registered static geometry in the same box, then
$$
|\gamma_i'-\gamma_i|
\le5|x'-x|+4|s'-s|+2|w'-w|
+2|z_i'-z_i|+|\lambda'-\lambda|.
\tag{S.1c.29}
$$
For $|\omega_i|,|\omega_i'|\le\Omega_*$ and a common positive exposure range, the component phase discrepancy obeys
$$
|\theta_i'-\theta_i|
\le T|\omega_i'-\omega_i|
+\Omega_*T|\gamma_i'-\gamma_i|
+\Omega_*|T'-T|.
\tag{S.1c.30}
$$
The half-diamond distance of the two-spin phase channels is at most half the sum of these two discrepancies. A change of the binary source weight adds $|p'-p|$ once at the start of a held-source history. Complete preparation, pointer, control and detector errors add under finite normalized composition, uniformly on the full record-and-target carrier. The bound preserves common public clock labels; a changed timestamp is an additional marked-response error. These bounds compare the declared receiver algebra after the same private source/service cut. Exposing exact material-parameter, private arrival or service-resource labels changes that interface and has its own response metric. This is a source/setting calibration envelope within the static background/test class.

7. **Populated covariance member and coverage.** Choose a common $R$, $r_f=2R$, $r_1=R/3$, $r_2=2R/3$, $p=1/2$ and two sectors
$$
x_0=\frac1{100},\qquad x_1=\frac1{50},\qquad
w=\frac16,\qquad s_J=x_J/2.
\tag{S.1c.31}
$$
Equation (S.1c.1) fixes their positive bulk and shell source energies. Equations (S.1c.17)--(S.1c.20) supply their actual material actions. Use $\omega_1=\omega_2=\omega>0$, $T=1/\omega$, $\beta_1=\beta_2=\pi/2$ and any common positive ramp duration below $\min_{i,J}\gamma_{iJ}/\omega$. Along this subfamily each $\gamma_i$ decreases strictly with $x$, so the phase covariance is nonzero. Since $-1<\theta_{iJ}<0$, each conditional variance is at least $\cos^2(1)>0$. Consequently the record covariance $\Sigma$ is positive definite, and its off-diagonal source covariance is strictly positive. The full source, phase, clock and noise record is populated without measured input.

This member proves realization on (S.1c.16). The all-$w$, all-shell-energy geometry/error theorem in items 1--3 has the larger nominal domain (S.1c.2). In particular, at $w=1$ its interior pressure exceeds $u$, and at $\sigma_E=0$ equation (S.1c.5) gives exactly $p_s=-wuR/(2a)$, so every $w>0$ requires a tension-only shell; those tuples are not covered by the positive causal material route (S.1c.17)--(S.1c.20). Their full nominal-family material applicability or realization is a separate, stronger open question. No background/test result here supplies a finite apparatus-backreaction theorem or a separate time-dependent source partition.

*Proof.* Let $f=y^2=1-xr^2/R^2$ inside. The static spherical Einstein equations in the areal coordinate reduce to
$$
\frac{1-f-rf'}{r^2}=\frac{8\pi G}{c^4}u,
\qquad
\frac{f-1}{r^2}+\frac{2fN'}{rN}=\frac{8\pi G}{c^4}p.
$$
Substitution of (S.1c.3) proves both identities. The angular equation is
$$
f\frac{N''}{N}+\frac{f'}2\frac{N'}N
+f\frac{N'}{rN}+\frac{f'}{2r}=\frac{8\pi G}{c^4}p,
$$
and direct differentiation gives the same pressure. Equivalently, differentiating (S.1c.3) gives $p'=-(u+p)N'/N$, so the angular equation follows from the other two and conservation. Since $y$ decreases from one to $a$, the condition on $D(0)$ makes every lapse and pressure denominator positive. The exterior solution is Schwarzschild with the mass in (S.1c.3), and both induced lapse and areal radius match at the shell.

In the shell's proper orthonormal time, the nonzero principal extrinsic curvatures on its two sides are
$$
K^\theta{}_{\theta,+}=b/R,\qquad
K^\theta{}_{\theta,-}=a/R,\qquad
K^\tau{}_{\tau,+}=\eta/(2Rb),\qquad
K^\tau{}_{\tau,-}=(1+3w)x/(2Ra).
$$
The jump convention $[K]=K_+-K_-$ gives $\sigma_E=-c^4[K^\theta{}_{\theta}]/(4\pi G)$ and $p_s=c^4([K^\tau{}_{\tau}]+[K^\theta{}_{\theta}])/(8\pi G)$, proving (S.1c.1) and (S.1c.5) from the Israel junction equation. It also gives the normal material balance
$$
-\sigma_E\overline K^\tau{}_{\tau}
+2p_s\overline K^\theta{}_{\theta}=-p(R),
\qquad \overline K=(K_++K_-)/2.
$$
This equality follows by substituting the same four curvatures; it is the boundary pressure force already owned by the bulk and shell actions. Subtracting $w$ from $p/u$ gives (S.1c.6). On (S.1c.2), $a\ge15/16$, $b\ge7/8$ and
$D(r)\ge D(0)\ge13/8$. The numerator coefficient in (S.1c.6) is at most eight, while $(y+a)D\ge(15/8)(13/8)$, so the difference is at most $(512/195)x<3x$.

For the confinement remainder put $d=1-a=x/(1+a)$. Rearranging the dimensionless bracket in (S.1c.5) gives
$$
\frac{8\pi GR}{c^4}\left(p_s+\frac{wuR}{2}\right)
=\frac{(d+s)^2}{2b}-\frac{d^2}{2a}
-\frac{3wx d}{2a}.
$$
Since $d\le x$, its absolute value on (S.1c.2) is at most
$[1/(2b)+1/(2a)+3/(2a)]\varepsilon^2<3\varepsilon^2$, proving (S.1c.7). Thus both the bulk pressure correction and the shell's correction have explicit orders relative to the original flat conserved tensor.

The proper spatial volume is $4\pi\int_0^Rr^2/y(r)\,dr$. The substitution $r/R=\sin v/\sqrt x$ yields (S.1c.8)'s elementary expression. The integrand lies between $r^2$ and $r^2/a$, proving (S.1c.10). Also $m_s=c^2Rs/G$ and $m_0=c^2Rx/(2G)$. Expanding $1-(a-s)^2=x+2as-s^2$ proves the ADM identity in (S.1c.8). Direct algebra gives
$$
\frac{N_-(u+3p)}{y}=\frac ba(1+3w)u.
$$
Multiplying by $4\pi r^2$ and integrating yields the first term in (S.1c.9); (S.1c.5) gives the remaining term. This proves the active-stress balance with the exact proper and ADM holdings kept distinct.

For the weak-field comparison, use the identities
$$
1-q/2-\sqrt{1-q}=\frac{q^2}{2(1+\sqrt{1-q})^2},
\qquad y-a=\frac{x(1-z^2)}{y+a}.
$$
Inside, (S.1c.3) becomes
$$
N_-=a-s-\frac{(1+3w)x(1-z^2)}4
\frac{2(1-s/a)}{y+a}.
$$
The first identity controls $a-(1-x/2)$, and
$$
\left|\frac{2(1-s/a)}{y+a}-1\right|
\le\frac{x}{a(1+a)}+\frac{s}{a^2}
$$
controls the other factor. This proves $B_-$. Outside, apply the square-root identity to $q=\eta R/r$ and use
$(x+2s)-\eta=2s(1-a)+s^2$ to obtain $B_+$. These bounds apply on the full positive exact family, without a Taylor-series remainder left implicit.

On (S.1c.2), the coefficients of $x^2$ and $xs$ in $B_-$ are at most
$128/961+256/465<1$ and $256/225<2$, respectively. Hence $B_-\le(x+s)^2$. The exterior bound simplifies exactly to
$$
B_+=\frac{(1-a)^2}{2}+2s(1-a)+s^2\le(x+s)^2.
$$
Thus the first-order lapse is precisely (S.1c.11), and the uniform error is $\varepsilon^2$. Since $|\phi|\le3\varepsilon/2$ and $\varepsilon\le1/8$, writing $N=1+\phi+e$ gives

$$
|N^2-(1+2\phi)|\le2\varepsilon^2+(3\varepsilon/2)^2+3\varepsilon^3+\varepsilon^4<5\varepsilon^2.
$$

The interior radial remainder is $(xz^2)^2/(1-xz^2)\le(16/15)x^2$. For the exterior one, expand the reciprocal once: its absolute remainder is at most
$\eta^2/b^2+2s(1-a)+s^2\le(256/49+1)\varepsilon^2<7\varepsilon^2$.
This proves (S.1c.12)--(S.1c.13) for every radius.

Let $e_i=N(r_i)-1-\phi(r_i)$ and $e_f=N_f-1-\phi(r_f)$. Then the exact clock-difference error is
$$
\frac{e_2-e_1-[\phi(r_2)-\phi(r_1)]\,[\phi(r_f)+e_f]}{N_f}.
$$
This gives the first bound in (S.1c.14). On the weak box, $N_f\ge b\ge7/8$, $|\phi(r_f)|\le\varepsilon$ and $|\phi(r_2)-\phi(r_1)|\le3\varepsilon/2$, so it is at most
$[2+3/2+(3/2)\varepsilon]\varepsilon^2/(7/8)<5\varepsilon^2$.
For two interior points, cancellation of the constant term in $N_-$ and rationalization of $y(r_1)-y(r_2)$ give the exact expression (S.1c.15). Its factor differs from one by at most the displayed expression, because $y(r_1)+y(r_2)\ge2a$. On the weak box the two coefficient bounds $1/[a(1+a)]<3/5$, $1/a^2<6/5$, and $1-N_f\le1-b\le\varepsilon$ give a relative error at most $(11/5)(8/7)\varepsilon<3\varepsilon$. This proves the uniform finite-reference clock result, including its identification with S.16.

We now verify the populated material source. On (S.1c.16), $p/u$ decreases radially from $(9-7a)/(21a-9)$ to $1/6$. Its center value is at most $13/57$ when $a\ge15/16$, proving the bulk bound. For the shell,
$$
\frac{p_s}{\sigma_E}
=\frac{(1-b)^2}{2bx}-\frac{3-a}{4a(1+a)}.
$$
The second term lies between $1/4$ and a number below $1/3$. The first term is positive and, using $1-b\le17x/16$, $b\ge7/8$ and $x\le1/16$, is below $1/4$. This proves $-1/3<p_s/\sigma_E<0$. Differentiating (S.1c.17) at fixed $\chi$ gives (S.1c.18). Since $0<p_\chi<u$, both energy coefficients and the chemical potential are positive, and the sound speed is subluminal.

For (S.1c.19), variation of $\varphi$ gives $\partial_\mu J^\mu=0$; variation of $\lambda$ gives $J^\mu\partial_\mu\chi=0$; and variation of $\alpha_A$ gives comoving transport of the three labels. The other label equations transport their multipliers. Variation of $\chi$ gives

$$
\partial_\mu(\lambda J^\mu)=-\sqrt{-g}\,\epsilon_\chi.
$$

Variation of the current gives

$$
\partial_\mu\varphi+\alpha_A\partial_\mu\beta^A+\lambda\partial_\mu\chi=-\epsilon_n u_\mu.
$$

Finally, metric variation at fixed current density gives

$$
T_{\mu\nu}=(\epsilon+p)u_\mu u_\nu+p g_{\mu\nu},
$$

with $p=n\epsilon_n-\epsilon$; the current/multiplier terms have no metric dependence. At $n=n_0$, $\epsilon_\chi=0$ and $N\epsilon_n$ has the constant value stated below (S.1c.19). Thus the displayed static fields solve every material equation. Genuine comoving labels can be chosen as Cartesian labels of the ready fluid worldlines; the conserved current density carries the proper-volume Jacobian. The radial composition profile is initial material data transported by these worldlines. It supplies no externally fixed radial force.

The corresponding surface action uses its induced metric, conserved particle current and two comoving labels. Its metric variation gives the surface perfect-fluid tensor with $p_s=n_s\sigma'-\sigma$. Substitution in (S.1c.20) proves the value and pressure, positive coefficients and positive chemical potential. Since $\sigma_E+p_s>2\sigma_E/3$, its longitudinal ratio is below $3/8$. In a local flat shell patch, a transverse displacement has principal kinetic coefficient $\sigma_E/c^2$ and tension coefficient $-p_s$, giving the displayed positive subluminal transverse ratio. The boundary variation of the combined bulk and surface actions is their normal force balance already checked from the exact junction. This supplies a free material interface rather than an external support. Neither local characteristic positivity nor this static solution is used as a theorem about global equilibrium stability.

For the test apparatus, setting $ds^2=d\Omega^2=0$ in (S.1c.4) gives $c\,dt=dr/(yN_-)$ inside and $c\,dt=dr/N_+^2$ outside. Integration on each region gives $\Lambda_J$ in (S.1c.21); their continuous matching and the absolute optical-length difference give every finite radial pair, with the exact Schwarzschild logarithm. Staticity gives the same delay for both trigger pulses and the return path. The common finite reference therefore produces the local intervals $\gamma_{iJ}T$. The two cubic ramps have area $d_i/2$ each, and the plateau has duration $\gamma_{iJ}T-d_i\ge0$. All longitudinal generators commute, so their integrated value is exactly $H_i\gamma_{iJ}T$. This proves (S.1c.22) and identifies its physical units.

Functional calculus commutes with common unitary conjugation. Hence conjugating the entire physical leaf
$\bigotimes_i\sqrt{F_{i,a_i,T}}\,U_JXU_J^*\bigotimes_i\sqrt{F_{i,a_i,T}}$
by $W_T$ gives (S.1c.24), including its output state. The squares of the two local roots sum to the identity. Their tensor products therefore give a trace-preserving four-outcome instrument on all input operators and spectator extensions. Keeping $J$ as a block label and using the cumulative frame gives the same induction over finite histories as Theorem S.7.3c. The source label is sampled once per held-source history, so it is not replaced by independent dephasing at each time. Outcome sums, common coarse grainings and adaptive settings from already released records respect this induction.

The last trigger reaches site $i$ at reference time $T+N_{fJ}D_{iJ}$. Its remaining local services add $\delta_i/\gamma_{iJ}$, and the return signal adds $N_{fJ}D_{iJ}$. Equation (S.1c.25) is later than every such event. Keeping already written classical records while the longitudinal field is off changes no outcome probability. A finite set of source sectors, sites, control settings and positive local gate/detector durations therefore has a finite common service deadline and the inherited finite field/coil/pointer ledgers. Static support contributes its stated finite proper force and no translational work. The finite joint-input service, when requested, has its own preparation and deployment record; the explicit product preparation suffices for the populated covariance example. This establishes the claimed test-sector realization and its precise receiver cut.

Equation (S.1c.26) is the covariance of a two-point vector law. For the stated product preparation, $Z$ rotation by $\theta_{iJ}$ sends the local Bloch vector to $(\cos\theta_{iJ},\sin\theta_{iJ},0)$, yielding (S.1c.27). Conditional product preparation and local product measurement give conditional independence. The law of total covariance then gives (S.1c.28). Independent ready-source replicas add independent centered vectors, dividing the whole covariance by $n$ for their sample mean. With a shared $J$, the conditional variance divides by $n$, while the covariance of the conditional means persists. This proves the distinct sampling contracts and identifies the actual observable covariance.

For calibration, compare two parameter points along the straight segment in the weak box. In the interior, write
$N=b-BL(y-a)$, where $B=(1+3w)/2\le2$ and $L=1-s/a\in(0,1]$. Uniformly,
$$
|\delta a|\le\frac8{15}|\delta x|,\qquad
|\delta y|\le\frac8{15}|\delta x|+\frac1{15}|\delta z|,\qquad
|y-a|\le\frac1{16}.
$$
Differentiating this expression for $N$ bounds its change by
$3|\delta x|+2|\delta s|+|\delta w|+|\delta z|$.
For $N_f=\sqrt{1-\lambda(1-b^2)}$, the bounds $b,N_f\ge7/8$ give
$$
|\delta N_f|\le\frac{64}{105}|\delta x|
+\frac87|\delta s|+\frac{15}{112}|\delta\lambda|.
$$
Since $N\le1$, division by $N_f$ bounds the coefficients of $(|\delta x|,|\delta s|,|\delta w|,|\delta z|,|\delta\lambda|)$ in $\delta\gamma$ by numbers strictly below $(5,4,2,2,1)$. For an exterior site $z\ge1$, $N=\sqrt{1-\eta/z}$. Since $\partial_x\eta=b/a\le1$, $\partial_s\eta=2b\le2$ and $N\ge b$, its derivative bounds satisfy the same displayed bound for $\delta N$, with zero $w$ derivative and $|\partial_zN|\le15/112$. The interior and exterior values agree at $z=1$. Integrating these piecewise bounds along the straight parameter segment therefore proves (S.1c.29), also when the site crosses the shell. The intervals of $z$ and $\lambda$ are convex, and both endpoints have a finite exterior reference.

For every finite target radius, $0<\gamma_i\le8/7$, hence $|\gamma_i-1|\le1$. Splitting
$\omega_i'(\gamma_i'-1)T'-\omega_i(\gamma_i-1)T$
into gap, lapse-ratio and time changes gives (S.1c.30). For two local $Z$ phases, the operator-norm difference is at most $\tfrac12\sum_i|\delta\theta_i|$, which also bounds half diamond distance of the induced channels. Separating mixture-weight error from component-channel error adds the binary total variation $|p'-p|$. Complete instrument errors telescope by trace-norm contraction on the normalized retained receiver process; using a uniform norm on its full record-and-target carrier covers adaptive choices. This comparison does not expose the exact private material parameters or private service times.

Finally, along (S.1c.16) the function $b=a-x/2$ decreases strictly with $x$. At fixed $\lambda<1$, $b/\sqrt{1-\lambda+\lambda b^2}$ increases strictly with $b$. Also $y/a=\sqrt{(1-xz^2)/(1-x)}$ increases with $x$ for $z<1$, and
$$
\gamma(z)=\frac b{N_f}
\left[1-\frac{1+3w}{2}\left(\frac ya-1\right)\right]
$$
is a product of positive strictly decreasing factors along this subfamily. Thus its two values in (S.1c.31) differ at both sites with the same sign. With $\omega T=1$, every $\theta_i=\gamma_i-1$ lies in $(-1,0)$; $\sin\theta_i$ is strictly increasing there. The two components of $m_0-m_1$ are consequently nonzero with the same sign, so the source off-diagonal covariance is positive. Each conditional variance is $1-\sin^2\theta_i\ge\cos^2(1)>0$, making $\Sigma$ positive definite. The material, causal timing and complete record construction therefore has an explicit nonempty member. The distinction between this source subfamily and the larger nominal geometry is retained. ∎

<a id="theorem-s1d-exact-polynomial-material-admission-for-the-confined-geometry"></a>**Theorem S.1d (Exact Polynomial-Material Admission for the Confined Geometry).** Retain Theorem S.1c's exact geometry and weak box
$$
0<x\le\frac1{16},\qquad 0\le s\le\frac1{16},\qquad 0\le w\le1,
\qquad a=\sqrt{1-x},\quad b=a-s.
\tag{S.1d.1}
$$
For $z=r/R$, write
$$
y=\sqrt{1-xz^2},\qquad D=3(1+w)a-(1+3w)y,
\qquad N_-=\frac{bD}{2a},\qquad
p(r)=u\frac{(1+3w)y-(1+w)a}{D}.
\tag{S.1d.2}
$$
The exterior has $N_+^2=1-(1-b^2)R/r$. All denominators in (S.1d.1)–(S.1d.2) are positive. The required surface energy and pressure are
$$
\sigma_E=\frac{c^4s}{4\pi GR},\qquad p_s=\frac{c^4j}{8\pi GR},\qquad
j=\frac{1+b^2}{2b}-a-\frac{(1+3w)x}{2a}.
\tag{S.1d.3}
$$
Use S.1c's varied conserved-current bulk action with advected composition $\chi=r^2/R^2$ at readiness, and energy density
$$
\epsilon(n,\chi)=(u-p_\chi)\frac n{n_0}
+p_\chi\left(\frac n{n_0}\right)^2,
\qquad p_\chi=p(R\sqrt\chi),\qquad n_0>0.
\tag{S.1d.4}
$$
Allow surface-current actions with
$$
\sigma(n_s)=B+\mu n_s+\kappa n_s^2,
\qquad B,\mu,\kappa\ge0,\qquad n_{s0}>0,
\tag{S.1d.5}
$$
and include the direct constant-area action, with its redundant current variables omitted, at the pure-tension endpoint. Require nonnegative acoustic, surface-longitudinal and transverse-membrane squared speeds at most $c^2$ at readiness. Advected composition, tangential relabeling and vorticity modes may have zero speed. Each source tuple may choose its own constitutive coefficients; this is a parameter-indexed family of materials.

For $s>0$, define
$$
L(x,s)=\frac{s(1-ab)}{3xb},\qquad
H(x,s)=\frac{s(1+3ab)}{3xb}=L+\frac{4as}{3x},\qquad
U(x)=\frac{2a-1}{3-2a}.
\tag{S.1d.6}
$$
The geometry has a ready-state realization in this material class exactly on
$$
\mathcal A=\{(x,0,0):0<x\le1/16\}
\cup\{(x,s,w)\text{ satisfying (S.1d.1)}:
 s>0,\ L\le w\le\min(H,U)\}.
\tag{S.1d.7}
$$
A fiber with $L>U$ is empty. Every admitted tuple retains S.1c's exact metric, proper/ADM/Komar holdings, nonlinear metric and clock bounds, finite-reference phase instrument and held-source covariance construction, with S.7.3c's finite-resource zero-backreaction test-apparatus convention.

*Proof.* **Bulk necessity and sufficiency.** The TOV identity is
$$
p'=-(u+p)N_-'/N_-.
$$
The lapse is nondecreasing and strictly increasing away from the center, so pressure decreases from its center to $p(R)=wu\ge0$. At the center,
$$
\frac{p(0)}u=\frac{(1+3w)-(1+w)a}{3(1+w)a-(1+3w)},
\qquad
p(0)\le u\ \Longleftrightarrow\ 1+3w\le2(1+w)a
\ \Longleftrightarrow\ w\le U.
\tag{S.1d.8}
$$
Thus (S.1d.4) has nonnegative coefficients at every composition exactly when $w\le U$. In that case its energy and chemical potential are positive for all $n>0$, and
$$
p_{\mathrm{mat}}=n\epsilon_n-\epsilon=p_\chi(n/n_0)^2,
\qquad
\frac{c_{s,\mathrm{bulk}}^2}{c^2}
=\frac{n\epsilon_{nn}}{\epsilon_n}
=\frac{2p_\chi n/n_0}{u-p_\chi+2p_\chi n/n_0}\in[0,1].
\tag{S.1d.9}
$$
At readiness this is $2p_\chi/(u+p_\chi)$. The endpoints $p_\chi=0$ and $p_\chi=u$ are dust-like and luminal; no $0/0$ occurs for $u,n>0$. If $w>U$, the first coefficient is negative at the center and its ready acoustic ratio exceeds one.

**Surface necessity, construction and endpoints.** With $x=1-a^2$ and $s=a-b$, (S.1d.3) becomes
$$
j=\frac{s(1-ab)}{2ab}-\frac{3wx}{2a},\qquad
\frac{p_s}{\sigma_E}=\frac{1-ab}{4ab}-\frac{3wx}{4as}\qquad(s>0).
\tag{S.1d.10}
$$
For (S.1d.5),
$$
p_{\mathrm{mat},s}=n_s\sigma'-\sigma=\kappa n_s^2-B,
\qquad \sigma+p_{\mathrm{mat},s}=\mu n_s+2\kappa n_s^2\ge0.
$$
A locally flat ready shell patch has transverse principal equation
$$
\frac{\sigma_E}{c^2}\partial_t^2\zeta+p_s\Delta\zeta
=\text{lower-order terms},\qquad
\frac{c_T^2}{c^2}=-\frac{p_s}{\sigma_E}.
\tag{S.1d.11}
$$
For $\sigma_E>0$, the transverse requirement is exactly $-\sigma_E\le p_s\le0$, equivalent by (S.1d.10) to $L\le w\le H$. This is a material principal-symbol statement.

For $-\sigma_E<p_s<0$, choose
$$
B=\frac{\sigma_E-3p_s}{4},\qquad
\mu n_{s0}=\frac{\sigma_E+p_s}{2},\qquad
\kappa n_{s0}^2=\frac{\sigma_E+p_s}{4}.
\tag{S.1d.12}
$$
All coefficients are positive and give the required ready energy and pressure. At readiness,
$$
\frac{c_L^2}{c^2}
=\left.\frac{n_s\sigma''}{\sigma'}\right|_{n_{s0}}
=\frac{2\kappa n_{s0}^2}{\sigma_E+p_s}=\frac12.
$$
The longitudinal ratio lies in $(0,1)$ at every positive density. Writing $t=n_s/n_{s0}$, the complete tensile causal density interval for this polynomial is
$$
0<t\le\sqrt{\frac{\sigma_E-3p_s}{\sigma_E+p_s}}.
\tag{S.1d.13}
$$
It contains the strict ready state in its interior. On this interval pressure is nonpositive and $\sigma+p=t\sigma_t>0$, so the transverse ratio is below one; its upper endpoint has zero transverse speed. At larger compression the pressure becomes positive, so this polynomial does not provide all-density transverse stability.

At $p_s=0$, equivalently $w=L$, use dust,
$$
\sigma(n_s)=\sigma_E n_s/n_{s0}.
$$
It has positive energy and chemical potential and identically zero pressure and material wave speeds. At $p_s=-\sigma_E$, equivalently $w=H$, use directly, in units $c=1$,
$$
I_{\mathrm{surf}}=-\sigma_E\int_{\mathcal W}\sqrt{-h}\,d^3\xi.
\tag{S.1d.14}
$$
It gives $S^{ab}=-\sigma_Eh^{ab}$ and a luminal transverse mode. There is no independent longitudinal current mode; tangential reparameterizations are gauge. The degenerate fluid ratio is not evaluated.

**Material field equations and confinement.** In units $c=1$, the bulk action is
$$
I_{\mathrm{bulk}}=\int d^4x\left[-\sqrt{-g}\epsilon(n,\chi)
+J^\mu(\partial_\mu\varphi+\alpha_A\partial_\mu\beta^A
+\lambda\partial_\mu\chi)\right],\qquad
n=\frac{\sqrt{-g_{\mu\nu}J^\mu J^\nu}}{\sqrt{-g}}.
\tag{S.1d.15}
$$
Variation gives current conservation, advection of $\chi$ and the comoving labels, the composition-multiplier equation and
$$
\partial_\mu\varphi+\alpha_A\partial_\mu\beta^A
+\lambda\partial_\mu\chi=-\epsilon_nu_\mu,
\qquad T_{\mu\nu}=(\epsilon+p)u_\mu u_\nu+pg_{\mu\nu}.
$$
At readiness $\epsilon=u$, $\epsilon_\chi=0$ and
$$
N_-\epsilon_n=N_-\frac{u+p}{n_0}
=\frac{b(1+w)u}{n_0}.
\tag{S.1d.16}
$$
Use the static conserved current with its proper-volume Jacobian, genuine comoving labels, advected $\chi=r^2/R^2$, $\alpha_A=\lambda=0$ and $\varphi=b(1+w)ut/n_0$. These solve all material variations, including the nonnegative-coefficient endpoints, without normal particle flow. The composition profile is advected initial data. Substitution in
$$
\frac{1-f-rf'}{r^2}=\frac{8\pi Gu}{c^4},\qquad
\frac{f-1}{r^2}+\frac{2fN_-'}{rN_-}=\frac{8\pi Gp}{c^4},\qquad
f=1-xr^2/R^2
$$
verifies the Einstein equations; the angular equation follows by differentiation and the TOV identity. The exterior remains vacuum Schwarzschild.

For a surface fluid or dust, its static current has constant proper density and potential $\varphi_s=b\sigma'(n_{s0})t$. Its induced lapse is $b$. Spherical charts supply the comoving labels without requiring one global chart. For pure tension intrinsic conservation follows from constant $\sigma_E$. The principal extrinsic curvatures are
$$
K^\theta{}_{\theta,+}=\frac bR,\quad
K^\theta{}_{\theta,-}=\frac aR,\quad
K^\tau{}_{\tau,+}=\frac{1-b^2}{2Rb},\quad
K^\tau{}_{\tau,-}=\frac{(1+3w)x}{2Ra}.
\tag{S.1d.17}
$$
Their Israel jumps give (S.1d.3). The exact normal balance is
$$
-\sigma_E\overline K^\tau{}_{\tau}
+2p_s\overline K^\theta{}_{\theta}=-p(R),
\qquad \overline K=(K_++K_-)/2,
$$
or equivalently
$$
-\frac s2\left[\frac{1-b^2}{b}+\frac{(1+3w)x}{a}\right]
+j(a+b)=-3wx.
\tag{S.1d.18}
$$
Insert (S.1d.3), $s=a-b$ and $x=1-a^2$ to verify the identity. At pure tension $j=-2s$, it is exactly the constant-area normal equation under bulk pressure; at dust $j=0$, the inertial normal term balances that pressure jump. No extra support force is required. The holdings remain
$$
m_0=\frac{4\pi uR^3}{3c^2},\qquad m_s=\frac{4\pi R^2\sigma_E}{c^2},\qquad
M=m_0+am_s-\frac{Gm_s^2}{2Rc^2},
$$
with proper material holding $uV_{\mathrm{prop}}+m_sc^2$ and binding difference $Mc^2-E_{\mathrm{mat}}$; the alternate Komar decomposition is unchanged. These are alternative once-only accounts of the same holdings.

For $s=0$, (S.1d.3) gives $p_s=-wuR/(2a)$. A nonnegative polynomial with zero ready energy at positive density has $B=\mu=\kappa=0$, hence zero pressure. Therefore only $w=0$ is admitted. In that case both temporal and angular curvatures match, the surface action is absent and $p(R)=0$ is a free bulk boundary. The bulk quadratic coefficient vanishes at that boundary and its acoustic speed there is zero. This proves (S.1d.7). $\square$

<a id="corollary-s1d1-unchanged-coefficient-region-and-preserved-response"></a>**Corollary S.1d.1 (Unchanged-Coefficient Region and Preserved Response).** If S.1c's original energy coefficients are kept literally and required to be strictly positive, with strictly positive subluminal bulk acoustic and surface longitudinal/transverse speeds at readiness, the exact region is
$$
s>0,\qquad L<w<\frac{s(1+2ab)}{3xb}=L+\frac{as}{x},\qquad w<U.
\tag{S.1d.19}
$$
Its original numerical speed margins are retained only on S.1c's stated subfamily. The reselected-coefficient class in Theorem S.1d is strictly larger. An exact witness is
$$
x=\frac{63}{1024},\quad s=\frac1{128},\quad w=\frac{27257}{185976},\quad
a=\frac{31}{32},\quad b=\frac{123}{128},\quad
\frac{p_s}{\sigma_E}=-\frac78,\quad
\frac{p(0)}u=\frac{63151}{363315}<1,\quad U=\frac{15}{17}.
\tag{S.1d.20}
$$
The original surface coefficients would give $\mu n_{s0}=-\sigma_E/8$. Instead (S.1d.12) gives
$$
B=\frac{29\sigma_E}{32},\qquad \mu n_{s0}=\frac{\sigma_E}{16},\qquad
\kappa n_{s0}^2=\frac{\sigma_E}{32},\qquad
c_L^2/c^2=\frac12,\quad c_T^2/c^2=\frac78.
$$

*Proof.* The original shell coefficients are $\kappa n_{s0}^2=\sigma_E/8$, $B=\sigma_E/8-p_s$ and $\mu n_{s0}=3\sigma_E/4+p_s$. Their positivity, tensile transverse condition and longitudinal ratio $\sigma_E/[4(\sigma_E+p_s)]<1$ give exactly $-3\sigma_E/4<p_s<0$, equivalent to (S.1d.19). Bulk strictness gives $w<U$; the lower shell bound already implies $w>0$. Substitution verifies (S.1d.20).

All admitted ready sources have the same metric and lapse formulas. For a finite retained set of source sectors, retain their actual material coefficients and held source labels. The finite radial null delays, finite exterior reference clock and causal trigger/readout service are unchanged. In particular
$$
U_J(T)=\bigotimes_i e^{-iH_i\gamma_{iJ}T/\hbar},\qquad
\gamma_{iJ}=N_J(r_i)/N_J(r_f),\qquad
\theta_{iJ}=\omega_iT(\gamma_{iJ}-1).
\tag{S.1d.21}
$$
Use S.1c's complete normalized instrument and test-sector ledger, including spectator extensions and held-source histories. In a binary mixture,
$$
\operatorname{Cov}(\theta)=p(1-p)(\theta_0-\theta_1)(\theta_0-\theta_1)^T.
$$
Its outcome covariance follows by the same total-covariance calculation. The original weak-box metric/clock bounds remain valid. A finite set of positive-lapse sectors has a finite common deadline, including these admitted endpoints. The populated member $w=1/6$, $s=x/2$, $x\in\{1/100,1/50\}$ remains admitted. $\square$

Theorem S.1d concerns the stated material class and static readiness. It supplies neither a coupled free-boundary well-posedness theorem nor nonlinear gravitational stability, and it does not impose a uniform apparatus cost over unbounded radii or source scales.

<a id="lemma-s1e-global-constitutive-energy-bound"></a>**Lemma S.1e (Global Constitutive Energy Bound).** Let $\epsilon\in C^2((0,\infty))$ satisfy, at every positive density,
$$
\epsilon\ge0,\qquad f=\epsilon'>0,\qquad
0\le\frac{nf'}f\le q<\infty,\qquad q\ge0,
\qquad p=nf-\epsilon.
\tag{S.1e.1}
$$
Then the finite limit $\epsilon_0=\lim_{n\downarrow0}\epsilon(n)\ge0$ exists, and
$$
\epsilon(n)\ge\epsilon_0+\frac{nf(n)}{1+q},\qquad
-\epsilon_0\le p(n)\le q\epsilon(n)-(1+q)\epsilon_0.
\tag{S.1e.2}
$$
For $q=1$ this implies $-\epsilon(n)<p(n)\le\epsilon(n)-2\epsilon_0\le\epsilon(n)$.

*Proof.* The increasing function $\epsilon$ is bounded below by zero, so its zero-density limit is its finite infimum. Moreover
$$
\frac d{dt}\frac{f(t)}{t^q}=\frac{tf'(t)-qf(t)}{t^{q+1}}\le0.
$$
For $0<t\le n$, this gives $f(t)\ge f(n)(t/n)^q$. Integrating on $[\delta,n]$ gives
$$
\epsilon(n)-\epsilon(\delta)\ge\frac{nf(n)}{1+q}
\left[1-(\delta/n)^{1+q}\right].
$$
Let $\delta\downarrow0$ and rearrange to obtain the energy and pressure upper bounds. Since $f'\ge0$, $f(t)\le f(n)$ for $0<t\le n$, hence $tf(t)\to0$. Thus $p(t)\to-\epsilon_0$, and $p'=tf'\ge0$ gives the lower bound. The strict inequality $p> -\epsilon$ uses $nf>0$.

Equality in the energy bound at $n=N>0$ holds exactly when its nonnegative continuous integrand vanishes on $(0,N]$, namely
$$
f(t)=Ct^q,\qquad \epsilon(t)=\epsilon_0+\frac{C}{1+q}t^{1+q}
\quad(0<t\le N),\qquad C>0.
\tag{S.1e.3}
$$
It imposes no such equality above $N$. Equality $p(N)=q\epsilon(N)$ additionally requires $\epsilon_0=0$. At $q=0$, $f$ is constant throughout its domain. Since $dp/d\epsilon=nf'/f$, the equivalent energy-variable identity is
$$
p(\epsilon)+\epsilon_0=\int_{\epsilon_0}^{\epsilon}\frac{dp}{de}\,de,
$$
with an improper lower endpoint if necessary. No smooth extension through density zero has been assumed. $\square$

<a id="theorem-s1e1-global-fluid-admission-and-the-attained-bulk-acoustic-ceiling"></a>**Theorem S.1e.1 (Global-Fluid Admission and the Attained Bulk Acoustic Ceiling).** Keep S.1c's geometry and weak box. At each advected bulk composition admit any globally nonnegative $C^2$ energy density on $n>0$, with positive chemical potential and $0\le n\epsilon_{nn}/\epsilon_n\le1$ at every positive density, realizing the specified ready pair $(u,p_\chi)$. Composition dependence is differentiable as required by the varied-current equations. For a nondegenerate surface current impose the analogous global conditions on $\sigma$, and require the ready transverse ratio $-p_s/\sigma_E\in[0,1]$. Include the absent surface and direct constant-area pure-tension surface as separate branches.

1. The exact admitted set is (S.1d.7). Necessity already holds with the transverse bound imposed only at readiness; sufficiency holds with that bound imposed at every positive surface density.
2. On a fixed admitted source, among all globally nonnegative $C^2$ varied-current bulk constitutive laws with positive chemical potential and nonnegative acoustic ratio at every positive density, the least all-density squared-speed ceiling is attained and equals
   $$
   \min_\epsilon\sup_{\chi\in[0,1],\,n>0}
   \frac{n\epsilon_{nn}(n,\chi)}{\epsilon_n(n,\chi)}
   =\frac{p(0)}u.
   \tag{S.1e.4}
   $$
3. For a prescribed bulk squared-speed ceiling $q\in[0,1]$, replace $U$ in the positive-shell part of (S.1d.7) by
   $$
   U_q(x)=\frac{a(1+3q)-(1+q)}{3(1+q)-a(1+3q)}.
   \tag{S.1e.5}
   $$
   On the no-shell branch additionally test $w=0\le U_q(x)$. The bound is on the bulk acoustic branch, independently of the surface transverse and longitudinal speeds.

*Proof.* **Necessity.** Lemma S.1e at each ready composition gives $p_\chi\le u$, hence $w\le U$ by (S.1d.8). For a positive-energy surface, readiness requires $-\sigma_E\le p_s\le0$, giving $L\le w\le H$. The equality $p_s=-\sigma_E$ is the separately admitted pure-tension action. A nondegenerate globally nonnegative increasing energy density cannot vanish at an interior positive density, since it would be negative below that density. A zero-energy constant-area action has zero tension. Thus $s=0$ permits only $w=0$, as in Theorem S.1d.

**Attained bulk construction and minimax.** Set $k_\chi=p_\chi/u\in[0,1]$ and choose
$$
\epsilon(n,\chi)=u(n/n_0)^{1+k_\chi},\qquad n_0>0.
\tag{S.1e.6}
$$
It is smooth for every $n>0$ with smooth composition dependence, and
$$
\epsilon(n_0,\chi)=u,\qquad p_{\mathrm{mat}}=k_\chi\epsilon,\qquad
\frac{n\epsilon_{nn}}{\epsilon_n}=k_\chi,\qquad
\epsilon_\chi(n_0,\chi)=0,\quad
\epsilon_n(n_0,\chi)=\frac{u+p_\chi}{n_0}.
\tag{S.1e.7}
$$
Thus it gives the same ready stress and chemical-potential equation, including dust-like and stiff/luminal endpoints. For any competing law with finite global ceiling $Q=q$, Lemma S.1e gives $p_\chi\le qu-(1+q)\epsilon_{0\chi}\le qu$. Therefore $q\ge\max_\chi p_\chi/u=p(0)/u$. Infinite ceilings cannot improve this bound. Construction (S.1e.6) attains it, proving (S.1e.4).

The old quadratic law has maximum ready acoustic ratio $2k_{\max}/(1+k_{\max})$, where $k_{\max}=p(0)/u$. Its all-density supremum is one whenever a composition has positive pressure. The new law has global ceiling $k_{\max}$ and improves the ready maximum by $k_{\max}(1-k_{\max})/(1+k_{\max})$ when $0<k_{\max}<1$. At $k_{\max}=1$ the global class necessarily has a luminal ceiling. Rearranging $p(0)/u\le q$ gives (S.1e.5); its denominator is $(3-a)+3q(1-a)>0$. At $q=1$ this is $U$. At $q=0$ its numerator is negative for $x>0$, excluding a completely pressure-free positive-compactness source. Even the $w=0$ source has least ceiling $(1-a)/(3a-1)>0$.

**All-density surface constructions.** Write $E=\sigma_E>0$, $P=p_s\in[-E,0]$ and $t=n_s/n_{s0}$. The affine choice
$$
\sigma(t)=-P+(E+P)t
\tag{S.1e.8}
$$
has the exact ready pair $(E,P)$, constant pressure $P$, zero longitudinal ratio and positive chemical potential if $P>-E$. It obeys $\sigma+P=(E+P)t>0$ and $0\le-P/\sigma<1$ for every $t>0$. At $P=0$ it is dust. At $P=-E$ use the direct constant-area action and omit the redundant current sector.

For $-E<P<0$, positive longitudinal speed at every finite positive density is also attained. Choose
$$
0<K<\frac43\min(-P,E+P),\qquad
B=-P-\frac{3K}{4},\quad M=E+P+\frac K4,\quad
\sigma(t)=B+Mt+\frac K{1+t}.
\tag{S.1e.9}
$$
Then $B>0$, $M>K>0$, $\sigma(1)=E$, and
$$
p(t)=-B-K\frac{1+2t}{(1+t)^2}<0,\qquad p(1)=P,
\quad \sigma_t=M-\frac K{(1+t)^2}>0,
$$
$$
0<\frac{t\sigma_{tt}}{\sigma_t}
=\frac{2Kt}{(1+t)[M(1+t)^2-K]}
<\frac2{(1+t)(t+2)}<1,
\qquad \sigma+p=t\sigma_t>0.
\tag{S.1e.10}
$$
Consequently $0<-p(t)/\sigma(t)<1$ at every $t>0$. Unlike the quadratic choice, it never acquires positive pressure under compression. The transverse ratio tends to one as $t\downarrow0$; this is pointwise causality, without a uniform strict margin on the half-line.

**Full ready-state field equations.** Use (S.1d.15) with genuine comoving labels and advected $\chi=r^2/R^2$. Equations (S.1e.7) and (S.1d.16) give $N_-\epsilon_n=b(1+w)u/n_0$ and $\epsilon_\chi=0$, so the original static current, zero multipliers and $\varphi=b(1+w)ut/n_0$ solve all bulk variations. Each nondegenerate surface has the static current and potential $b\sigma'(n_{s0})t$. Pure tension has direct intrinsic conservation. Every ready stress equals (S.1d.2)–(S.1d.3), so the Einstein equations, Israel jumps and normal balance (S.1d.18) are unchanged. At $s=w=0$ both curvatures match and $p(R)=0$. The same proper/ADM/Komar holdings, lapse, finite-reference clocks, causal triggers, test-spin instrument and held-source histories therefore apply, under the same background/test convention. This proves sufficiency and all claims. $\square$

<a id="proposition-s1e2-local-causality-and-global-positivity-are-distinct-hypotheses"></a>**Proposition S.1e.2 (Local Causality and Global Positivity Are Distinct Hypotheses).** The smooth positive law
$$
\epsilon(n)=\frac{n^3}{1+n^2},\qquad
\epsilon'(n)=\frac{n^2(n^2+3)}{(1+n^2)^2}>0
$$
has
$$
\frac p\epsilon=\frac2{1+n^2},\qquad
\frac{n\epsilon''}{\epsilon'}=\frac{2(3-n^2)}{(1+n^2)(3+n^2)}.
\tag{S.1e.11}
$$
At $n=3/4$, $\epsilon=27/100$, $p/\epsilon=32/25>1$ and $c_s^2/c^2=416/475\in(0,1)$. These strict conditions persist on $7/10<n<4/5$: the acoustic upper bound reduces to $n^4+6n^2-3>0$, whose value at $n=7/10$ is $1801/10000$. Globally the acoustic ratio tends to two at zero and becomes negative beyond $\sqrt3$, so this law does not meet Lemma S.1e's all-density hypothesis. Also, $\epsilon=n^2-1$ has positive chemical potential and acoustic ratio one but violates global nonnegativity; where its energy is positive, $p=n^2+1>\epsilon$. These exact substitutions show why a ready-local acoustic test or a density-restricted positive energy cannot replace the stated global assumptions.

Theorems S.1d and S.1e.1 admit additional source materials on an explicit class. Their all-density constitutive extension does not assert that every density is dynamically reached in the fixed static solution. Strong hyperbolicity, coupled interface evolution, nonlinear stability and finite-apparatus gravitational backreaction require their own results. The existing static geometry and response theorem retain their specified domain.

## S.4 PCE Optimization and Self-Limiting $\text{CC}^*$

Assume a calibrated unresolved-phase or noise ensemble converts the gravitational proper-time spread into an effective attenuation and that its small-response law is linear:
$$
\text{CC}_{\mathrm{eff}}
=
\text{CC}
\left(
1-\frac{\Delta\tau_d}{\tau_c}
\right)
+O\!\left(
\left(\frac{\Delta\tau_d}{\tau_c}\right)^2
\right).
$$
Using $\Delta\tau_d/\tau_c=K_{\mathrm{eff}}P_{\mathrm{context}}$ gives
$$
\text{CC}_{\mathrm{eff}}
=
\text{CC}(1-K_{\mathrm{eff}}P_{\mathrm{context}})
+O((K_{\mathrm{eff}}P_{\mathrm{context}})^2).
\tag{S.21}
$$
This formula is a phenomenological response branch; a deterministic tracked phase alone is not a dephasing channel.

On a phenomenological utility branch, let $k_b,k_c,A,K_{\mathrm{eff}}>0$, write $\alpha:=\alpha_{CC,max}$, and define
$$
B_{\mathrm{net}}(\mathrm{CC})
:=k_b\mathrm{CC}_{\mathrm{eff}}-k_cP_{\mathrm{context}}.
\tag{S.22}
$$
Define a polynomial utility surrogate using the quadratic power model
$$
P_{\mathrm{quad}}(\mathrm{CC}):=\frac A{\alpha^2}\mathrm{CC}^2
$$
and the linear attenuation model $\mathrm{CC}_{\mathrm{eff}}=\mathrm{CC}(1-K_{\mathrm{eff}}P_{\mathrm{quad}})$. Their utility is
$$
B_{\mathrm{net}}(\mathrm{CC})
=k_b\mathrm{CC}
-\frac A{\alpha^2}\left(k_bK_{\mathrm{eff}}\mathrm{CC}^3+k_c\mathrm{CC}^2\right).
\tag{S.23}
$$
This is a declared surrogate, not the complete cubic Taylor expansion of the S.5 cost law. In fact,
$$
P_{\mathrm{context}}
=\frac A{\alpha^2}\mathrm{CC}^2+\frac{2A}{\alpha^3}\mathrm{CC}^3
+O(\mathrm{CC}^4),
$$
so the cubic Taylor utility also contains $-2Ak_c\mathrm{CC}^3/\alpha^3$. Applying the surrogate to a physical response requires separate approximation control for both cost and attenuation.

The surrogate stationarity equation is
$$
k_b-\frac A{\alpha^2}
\left(3k_bK_{\mathrm{eff}}\mathrm{CC}^2+2k_c\mathrm{CC}\right)=0,
\tag{S.24}
$$
or
$$
\frac{3Ak_bK_{\mathrm{eff}}}{\alpha^2}(\mathrm{CC}^*)^2
+\frac{2Ak_c}{\alpha^2}\mathrm{CC}^*-k_b=0.
\tag{S.26}
$$
Its positive root is
$$
\boxed{
\mathrm{CC}^*
=\frac{-k_c+\sqrt{k_c^2+3K_{\mathrm{eff}}\alpha^2k_b^2/A}}
{3k_bK_{\mathrm{eff}}}.
}
\tag{S.27}
$$
For $\mathrm{CC}\ge0$,
$$
B_{\mathrm{net}}''(\mathrm{CC})
=-\frac A{\alpha^2}(6k_bK_{\mathrm{eff}}\mathrm{CC}+2k_c)<0.
$$
The root is therefore the unique maximizer of this polynomial on $[0,\infty)$. Its use on the CC branch requires $\mathrm{CC}^*<\alpha$, an interior operating point, and accepted approximation errors; the small-response reading additionally requires $\mathrm{CC}^*/\alpha\ll1$ and $K_{\mathrm{eff}}P_{\mathrm{quad}}(\mathrm{CC}^*)\ll1$. Stochastic concentration further requires identifying $-B_{\mathrm{net}}$ with a declared Appendix-D potential and satisfying the low-noise detailed-balance hypotheses of Theorem D.5.

**Formal limiting behavior.** Put $k_*:=k_b\alpha\sqrt{3K_{\mathrm{eff}}/A}$.

- If $k_c/k_*\to0$, then $\mathrm{CC}^*\sim\alpha/\sqrt{3AK_{\mathrm{eff}}}$. Consequently $K_{\mathrm{eff}}P_{\mathrm{quad}}(\mathrm{CC}^*)\to1/3$, so this limit does not give a parametrically weak-response optimum.
- If $k_c/k_*\to\infty$, then $\mathrm{CC}^*\sim k_b\alpha^2/(2Ak_c)$.
- When $k_c/k_*$ is of order one, the displayed root retains both terms. Each application must check its operating domain and approximation certificate.

## S.5 Schwarzschild Interpretation of the CC Endpoint-Bias Bound

The independently declared bounded-bias constraint $\alpha_{CC,\max}<0.5$ is weaker than exact causality and admits a separate gravitational interpretation. From Equation S.5, as $\text{CC} \to \alpha_{CC,\max}$, the required context power diverges: $P_{\mathrm{context}} \to \infty$. The supplied work over the coherence interval is
$$
E_{\mathrm{context}}
=P_{\mathrm{context}}\tau_c.
\tag{S.28}
$$
Only the retained, localized part is assigned to the instantaneous gravitational source:
$$
E_{\mathrm{grav}}^{\mathrm{inst}}
=\eta_{\mathrm{ret}}E_{\mathrm{context}}
=\eta_{\mathrm{ret}}P_{\mathrm{context}}\tau_c,
\qquad
0<\eta_{\mathrm{ret}}\le1.
$$
Accordingly, the Schwarzschild radius associated with the retained source energy is
$$
r_s
=\frac{2GE_{\mathrm{grav}}^{\mathrm{inst}}}{c^4}
=\frac{2G\eta_{\mathrm{ret}}P_{\mathrm{context}}\tau_c}{c^4}.
\tag{S.29}
$$
The use of $c^4$ follows from $r_s=2GM/c^2$ and $M=E_{\mathrm{grav}}^{\mathrm{inst}}/c^2$.

Substituting Equation S.5:
$$
r_s = \frac{2G \eta_{\mathrm{ret}} \tau_c}{c^4} A \left[\frac{\text{CC}}{\alpha - \text{CC}}\right]^2
\tag{S.30}
$$

**Conditional spherical compactness cutoff:** On the spherical branch of Theorem S.2, impose the following cutoff for the retained context-energy contribution. Its use below as “collapse avoidance” or a “collapse ceiling” refers to this imposed proxy unless an independent source-and-geometry certificate identifies $R_S$ with the areal radius and $E_{\mathrm{grav}}^{\mathrm{inst}}/c^2$ with the complete mass of the matched Schwarzschild exterior. That certificate must account for the baseline, electromagnetic, confinement, and gravitational contributions; S.9 does not identify its context term alone with the total mass. The volume expression after (S.31) supplies the Euclidean spherical radius in the weak-field model. The cutoff by itself proves neither dynamical stability nor future avoidance of a black hole:
$$
r_s < R_S
\tag{S.31}
$$

where $R_S=(3V_S/4\pi)^{1/3}$ is the characteristic radius of the aggregate. On the global quadratic-cost branch, $r_s\to\infty$ as $\mathrm{CC}\uparrow\alpha$. Two distinct restrictions apply:

1. The bounded-bias branch independently declares $\alpha_{CC,max}<1/2$. Theorem 39 proves that this gate excludes endpoint-complete binary forcing and that endpoint completion requires $\alpha_{CC,max}\ge1/2$; exact pre-lightcone causality separately requires Theorem 39c.
2. The inequality $r_s<R_S$ supplies a system-dependent collapse ceiling determined by $A$, $V_S$, $\tau_c$, and $\eta_{\mathrm{ret}}$.

Thus $\mathrm{CC}<\alpha$ does not by itself prevent collapse. The gravitational ceiling is the solution of S.31 for the declared source parameters and lies below $\alpha$ whenever those parameters are finite and positive. The weak-field calculation imposes the stronger perturbative requirement:
$$
\frac{\Phi_{\mathrm{context}}}{c^2} = \frac{G M_{\mathrm{context}}}{c^2 R_S} \ll 1
\tag{S.32}
$$

For the gravitational time dilation mechanism (Section S.3) to remain in the perturbative regime where Equations S.15-S.18 hold, we require:
$$
\frac{\Delta\tau_d}{\tau_c} = K_{\mathrm{eff}} P_{\mathrm{context}} \ll 1
\tag{S.33}
$$

Together with collapse avoidance $r_s<R_S$ (Equation S.31), these conditions enforce an effective operational ceiling $\text{CC}<\text{CC}_{\mathrm{grav}}<\alpha$ for any finite system. Theorem S.2 makes this explicit.

<a id="theorem-s2-unified-bounded-bias-and-gravity-ceiling"></a>**Theorem S.2 (Unified Bounded-Bias and Gravity Ceiling).**

On the bounded-bias CC branch, independently impose
$$
\alpha_{CC,\max}<0.5.
$$
Theorem 39 then excludes endpoint-complete forcing of both outcomes of any binary coarse-graining.
Independently, for any finite aggregate with the context-power law of Equation S.5 and finite positive $A,\tau_c,R_S,\eta_{\mathrm{ret}}$, assume a nondegenerate weak-field geometry with $K_{\mathrm{eff}}>0$, a declared tolerance $0<\delta_{\mathrm{WF}}\ll1$, and the strict perturbative requirement $K_{\mathrm{eff}}P_{\mathrm{context}}<\delta_{\mathrm{WF}}$. Together with collapse avoidance, these hypotheses impose
$$
\mathrm{CC}<\mathrm{CC}_{BH}<\alpha,
\qquad
\mathrm{CC}<\mathrm{CC}_{WF}<\alpha.
$$
Thus the admissible operating ceiling is
$$
\mathrm{CC}
<
\min\{\alpha_{CC,\max},\mathrm{CC}_{BH},\mathrm{CC}_{WF}\}.
\tag{S.34a}
$$
with $\alpha_{CC,\max}<0.5$ on the bounded-bias branch.

*Proof.* The strict ceiling is independent branch data. Theorem 39 proves that it is sufficient to exclude endpoint-complete forcing of both outcomes of any binary coarse-graining; it does not derive the ceiling or exclude every one-endpoint protocol.

For the gravitational-collapse ceiling, assume a spherically symmetric aggregate of areal radius $R_S$ and use Equations S.30–S.31:
$$
r_s
=
\frac{2G\eta_{\mathrm{ret}}\tau_c}{c^4}P_{\mathrm{context}}(\mathrm{CC})
<R_S
\quad\Longleftrightarrow\quad
P_{\mathrm{context}}(\mathrm{CC})
<
\frac{c^4R_S}{2G\eta_{\mathrm{ret}}\tau_c}.
$$
Substituting Equation S.5 gives
$$
A\left[\frac{\mathrm{CC}}{\alpha-\mathrm{CC}}\right]^2
<
\frac{c^4R_S}{2G\eta_{\mathrm{ret}}\tau_c}.
$$
Let
$$
B
:=
\frac{c^4R_S}{2G\eta_{\mathrm{ret}}\tau_cA}>0.
$$
Since all quantities are nonnegative and $\mathrm{CC}<\alpha$ on the branch domain, the inequality is equivalent to
$$
\frac{\mathrm{CC}}{\alpha-\mathrm{CC}}<\sqrt B.
$$
Solving gives
$$
\mathrm{CC}<\frac{\alpha\sqrt B}{1+\sqrt B}=:\mathrm{CC}_{BH}.
$$
For finite positive $A,\tau_c,R_S,\eta_{\mathrm{ret}}$,
$$
\mathrm{CC}_{BH}<\alpha.
$$

For the perturbative weak-field ceiling, impose the theorem's nondegenerate-geometry and strict-tolerance hypotheses
$$
K_{\mathrm{eff}}>0,
\qquad
K_{\mathrm{eff}}P_{\mathrm{context}}<\delta_{\mathrm{WF}}.
$$
Using Equation S.5,
$$
A\left[\frac{\mathrm{CC}}{\alpha-\mathrm{CC}}\right]^2
<
\frac{\delta_{\mathrm{WF}}}{K_{\mathrm{eff}}}.
$$
Let
$$
W
:=
\frac{\delta_{\mathrm{WF}}}{AK_{\mathrm{eff}}}>0.
$$
Then
$$
\frac{\mathrm{CC}}{\alpha-\mathrm{CC}}<\sqrt W,
$$
and hence
$$
\mathrm{CC}
<
\frac{\alpha\sqrt W}{1+\sqrt W}
=:\mathrm{CC}_{\mathrm{WF}}<\alpha.
$$

Combining the independent endpoint, collapse, and weak-field requirements gives (S.34a). ∎

<a id="corollary-s21-no-arbitrary-cc-enhancement-on-the-bounded-bias-branch"></a>**Corollary S.2.1 (No arbitrary CC enhancement on the bounded-bias branch).**

On the bounded-bias CC branch, no finite system can increase operational CC without encountering at least one of the following gates:
- the independently declared bounded-bias gate $\alpha_{CC,\max}<0.5$, whose endpoint-complete consequence is Theorem 39;
- the collapse-avoidance ceiling $\mathrm{CC}<\mathrm{CC}_{BH}$;
- the nondegenerate weak-field perturbative ceiling $\mathrm{CC}<\mathrm{CC}_{WF}$.

Thus arbitrary CC enhancement is excluded on the intersection of the independently bounded-bias branch and the two finite-system branches. The endpoint gate excludes endpoint-complete binary forcing, while the gravitational ceilings control physical viability and perturbative validity.

<a id="theorem-s2a-causal-finite-energy-binary-bias-channels-and-sharp-ceilings"></a>**Theorem S.2a (Causal Finite-Energy Binary-Bias Channels and Sharp Ceilings).** Let a target qubit have Hamiltonian $H_T=\hbar\omega|e\rangle\langle e|$ with $\omega>0$, and let a battery have Hamiltonian $H_B$ with orthonormal eigenvectors $|E-\hbar\omega\rangle,|E\rangle,|E+\hbar\omega\rangle$ at the displayed energies, $E\ge\hbar\omega$, initially in $|E\rangle_B$. For $\theta\in[0,\pi/2]$ let $U_\theta^+$ act on the equal-energy pair $|g,E\rangle,|e,E-\hbar\omega\rangle$ by
$$
|g,E\rangle\mapsto\cos\theta\,|g,E\rangle-i\sin\theta\,|e,E-\hbar\omega\rangle,
\qquad
|e,E-\hbar\omega\rangle\mapsto\cos\theta\,|e,E-\hbar\omega\rangle-i\sin\theta\,|g,E\rangle,
\tag{S.2a.1}
$$
and as the identity on the orthogonal complement; let $U_\theta^-$ act in the same way on the equal-energy pair $|e,E\rangle,|g,E+\hbar\omega\rangle$. Put $\Phi_\theta^\pm(\rho):=\operatorname{tr}_B[U_\theta^\pm(\rho\otimes|E\rangle\langle E|)U_\theta^{\pm\dagger}]$, let the context $c\in\{0,1\}$ select the identity channel for $c=0$ and $\Phi_\theta^\pm$ for $c=1$, and support both in one bounded world tube containing the target and battery. Then:

(a) $[U_\theta^\pm,H_T+H_B]=0$; each $\Phi_\theta^\pm$ is CPTP, and for every spacelike factor $R$ the nonselective marginal of $R$ is unchanged, as in (L.12.8b.13). With $p:=\langle e|\rho|e\rangle$, the pumping channel gives $p\mapsto p+(1-p)\sin^2\theta$ and lowers the mean battery energy by $\hbar\omega(1-p)\sin^2\theta\le\hbar\omega$; the damping channel gives $p\mapsto p\cos^2\theta$ and raises it by $\hbar\omega p\sin^2\theta\le\hbar\omega$.

(b) $L_\theta^\pm:=\Phi_\theta^\pm-\mathrm{id}$ is a Definition-30 map with
$$
\mathrm{CC}(L_\theta^\pm)=\sin^2\theta.
\tag{S.2a.2}
$$
Hence every value in $[0,1]$ is the CC of a causal, energy-conserving, finite-energy binary-bias channel, and the value $1$ is attained at $\theta=\pi/2$.

(c) For a binary endpoint with Born probability $p$, the endpoint probabilities realized by these channels form the whole interval $[0,1]$, so the realized bias set is exactly $[-p,1-p]$. Every Definition-30 map formed as a difference of two CPTP maps has CC at most $1$. Thus $1$ is the sharp ceiling for causal finite-energy binary-bias channels.

(d) Consequently Definition 30, local CPTP implementation, nonselective remote-marginal invariance and a conserved finite energy ledger do not entail $\mathrm{CC}\le\alpha$ for any $\alpha<1$, and in particular do not entail $\alpha_{CC,\max}<1/2$. The bounded-bias premise of Definition 31, item 2 is logically independent of these premises.

(e) On the branch of Theorem S.2, the set of $\mathrm{CC}\in[0,\alpha)$ satisfying (S.31) is exactly $[0,\mathrm{CC}_{BH})$, and the set satisfying $K_{\mathrm{eff}}P_{\mathrm{context}}<\delta_{\mathrm{WF}}$ is exactly $[0,\mathrm{CC}_{\mathrm{WF}})$. Both gravitational ceilings are sharp and are not attained.

*Proof.* (a) The two vectors in (S.2a.1) are orthonormal eigenvectors of $H_T+H_B$ with the common eigenvalue $E$, so $U_\theta^+$ is a rotation inside one eigenspace, extended by the identity on the invariant orthogonal complement; it is unitary and commutes with $H_T+H_B$. The same argument applies to $U_\theta^-$ with common eigenvalue $E+\hbar\omega$. The Kraus operators of $\Phi_\theta^+$ are $\langle E|U_\theta^+|E\rangle=\cos\theta|g\rangle\langle g|+|e\rangle\langle e|$ and $\langle E-\hbar\omega|U_\theta^+|E\rangle=-i\sin\theta|e\rangle\langle g|$, whose squared moduli sum to $I$. They give the stated population map and coherence map $\rho_{eg}\mapsto\cos\theta\,\rho_{eg}$, and the second Kraus branch leaves the battery at $E-\hbar\omega$ with probability $(1-p)\sin^2\theta$. The damping channel is identical with $g$ and $e$ exchanged and the battery raised by $\hbar\omega$. Trace preservation gives unital Heisenberg adjoints, which proves remote-marginal invariance exactly as in (L.12.8b.13).

(b) Differences of trace-preserving Hermiticity-preserving maps are trace-annihilating and Hermiticity-preserving. For the pumping channel,
$$
L_\theta^+(\rho)=(1-p)\sin^2\theta\,\bigl(|e\rangle\langle e|-|g\rangle\langle g|\bigr)+(\cos\theta-1)\bigl(\rho_{eg}|e\rangle\langle g|+\rho_{ge}|g\rangle\langle e|\bigr),
$$
a traceless Hermitian qubit operator with $\tfrac14\|L_\theta^+(\rho)\|_1^2=(1-p)^2\sin^4\theta+(1-\cos\theta)^2|\rho_{eg}|^2$. Since $|\rho_{eg}|^2\le p(1-p)$ and $0\le1-\cos\theta\le(1-\cos\theta)(1+\cos\theta)=\sin^2\theta$, this is at most $(1-p)\sin^4\theta\le\sin^4\theta$, with equality at $\rho=|g\rangle\langle g|$. Corollary 9.1 gives (S.2a.2); the damping channel is the same computation with $g$ and $e$ exchanged.

(c) For a target value $p'\ge p$ with $p<1$, choose $\sin^2\theta=(p'-p)/(1-p)$ in the pumping channel; for $p'\le p$ with $p>0$, choose $\cos^2\theta=p'/p$ in the damping channel. No channel produces a probability outside $[0,1]$. For CPTP maps $\Phi_1,\Phi_0$, $\tfrac12\|\Phi_1(\rho)-\Phi_0(\rho)\|_1\le1$, so Corollary 9.1 bounds CC by $1$.

(d) At $\theta=\pi/2$, the pair $(\mathrm{id},\Phi_{\pi/2}^+)$ satisfies every listed premise and has $\mathrm{CC}=1$ by (b). No derivation from those premises can therefore conclude $\mathrm{CC}\le\alpha<1$.

(e) On $[0,\alpha)$ the map $x\mapsto x/(\alpha-x)$ is a strictly increasing bijection onto $[0,\infty)$, and all quantities in the proof of Theorem S.2 are positive. Each displayed inequality there is therefore equivalent to the next, so $r_s<R_S$ holds exactly when $\mathrm{CC}<\mathrm{CC}_{BH}$ and the weak-field inequality holds exactly when $\mathrm{CC}<\mathrm{CC}_{\mathrm{WF}}$. At either ceiling the corresponding strict inequality fails. ∎

<a id="theorem-s2b-sharp-sub-half-ceiling-of-a-protected-finite-carrier"></a>**Theorem S.2b (Sharp Sub-Half Ceiling of a Protected Finite Carrier).** Use the admitted two-value aggregate-context source of Theorem L.12.8b: the orthogonal degenerate source states $|s_j\rangle_S$, $j\in\{0,1\}$, represent its selected Definition-L.1 statistic, and its conserving encoder writes $j$ into a degenerate control $C$ while retaining $S$. The source admission is the one stated in that theorem. Fix a target qubit $T$ with energy $H_T=\Delta|e\rangle\langle e|$, $\Delta>0$, and the following physical interface.

Before a fixed closing time, the source controls a registered finite local program on $T$ and its private, initialized ancillas, batteries and records. Its gates, finite internal instruments and adaptive controls have a normalized, finite unitary dilation; every displayed interaction commutes with the registered bare Hamiltonian, and every internal outcome, including failure, is retained without selection. The source register controls the program and remains retained. The initialized source and entire private program apparatus are jointly independent of the tested joint input $\omega_{TR}$, where $R$ is an arbitrary finite spectator. A comparison changes the context program while keeping that same input and spectator marginal. For each registered finite program pair, both programs fit its finite common clock schedule, padded by identity slots; a larger program may require a larger registered duration and resource record. The interface releases no earlier target, record, timing signal or control response to the receiver.

At closure, a protected device acts once on $T$, a fresh same-gap qubit $E$ in $|g\rangle_E$, and $q\ge2$ fresh degenerate flag qubits $F$, independently prepared in $|+\rangle^{\otimes q}$. The context program has no port to $E,F$ or the closing operation. After it, the receiver receives exactly $T$ and its preexisting $R$ at the common registered emission deadline. A subsequent receiver measurement is a separately registered endpoint protocol on that output. Source, program, battery, flags and displaced-state records remain in a separate retained algebra. These are the physical port and resource premises of the carrier class; the receiver's event algebra is $\mathcal B(T\otimes R)$ and common classical clock labels. The finite program class is specified by its actual circuits and conserving dilations, supported together with the router in one registered bounded world tube and extended by the identity on remote factors. The all-CPTP bound below supplies coverage of that class without assuming a conserving implementation of every abstract CPTP map.

Put $P=|0^q\rangle\langle0^q|_F$, let $W_{TE}$ exchange $T$ and $E$, and define
$$
V=P\otimes I_{TE}+(I_F-P)\otimes W_{TE},\qquad
\eta_q=2^{-q}.
\tag{S.2b.1}
$$
Then the following statements hold.

1. **Physical router and complete response.** The operator $V$ is a self-adjoint unitary and commutes with $H_T+H_E$, where $H_E=\Delta|e\rangle\langle e|$. A positive-duration interaction-picture pulse
$$
H_{\mathrm{route}}=\frac{\pi\hbar}{2\tau_{\mathrm{route}}}(I-V)
=\frac{\pi\hbar}{2\tau_{\mathrm{route}}}(I_F-P)\otimes(I_{TE}-W_{TE})
\tag{S.2b.2}
$$
implements $V$ and conserves the bare energy. Its reduced channel is
$$
\mathcal D_q(X)=\eta_qX+(1-\eta_q)|g\rangle\langle g|\operatorname{tr}X.
\tag{S.2b.3}
$$
For every joint operator $X_{TA}$, with $A$ any finite collection of private records and spectators, the complete identity is
$$
\operatorname{tr}_{FE}\!\left[V\bigl(|+\rangle\langle+|_F^{\otimes q}\otimes X_{TA}\otimes|g\rangle\langle g|_E\bigr)V^\dagger\right]
=\eta_qX_{TA}+(1-\eta_q)|g\rangle\langle g|_T\otimes\operatorname{tr}_TX_{TA}.
\tag{S.2b.4}
$$
The discarded factors in this response formula remain in the physical retained dilation. In particular the replacement branch moves the incoming target state to $E$; it does not erase that state globally.

2. **Sharp ceiling and its baseline.** Let $\Phi_0,\Phi_1$ be the CPTP target channels induced by any two admitted pre-router programs, and define the two actual receiver channels and their Definition-30 comparison map by
$$
\Psi_j=\mathcal D_q\Phi_j,\qquad
L=\Psi_1-\Psi_0=\eta_q(\Phi_1-\Phi_0).
\tag{S.2b.5}
$$
The baseline and intervention probabilities are respectively $p_j(B|\rho)=\operatorname{tr}[B\Psi_j(\rho)]$. Thus $\operatorname{tr}[B L(\rho)]$ compares the two implemented source settings on the same input; the baseline includes its router. Against the different raw-input baseline $\operatorname{tr}(B\rho)$, the routing device has its own response; for example it lowers an initially excited population by $1-\eta_q$. A common free target evolution conjugates both output maps and effects and leaves the following norms unchanged. The operational and spectator-stable bounds are
$$
\mathrm{CC}(L)=\eta_q\,\mathrm{CC}(\Phi_1-\Phi_0)\le\eta_q\le\frac14<\frac12,
\qquad
\frac12\left\|[(\Psi_1-\Psi_0)\otimes\mathrm{id}_R](\omega_{TR})\right\|_1\le\eta_q.
\tag{S.2b.6}
$$
They hold for every input, every finite spectator, every final POVM and every common finite receiver postprocessing. A receiver memory already changed by an earlier context-dependent output does not satisfy the common-input premise of this single-output comparison.

The energy-conserving pumping family $\Phi_\theta^+$ of Theorem S.2a, compared with the identity program, attains
$$
\mathrm{CC}(\mathcal D_q\Phi_\theta^+-\mathcal D_q)
=\eta_q\sin^2\theta,\qquad 0\le\theta\le\frac\pi2.
\tag{S.2b.7}
$$
Every value in $[0,\eta_q]$ occurs. At $\theta=\pi/2$, the input $|g\rangle_T$ and effect $|e\rangle\langle e|_T$ attain $\eta_q$. The sharp ceiling for fixed $q$ is therefore $\eta_q$; over the full hardware class $q\ge2$ it is $\alpha_{CC,\max}=1/4$, also attained. The strict inequality is relative to $1/2$, while the sharp class ceiling itself is attained. It follows from the protected routing law and its independently specified uniform flags, rather than an assumed upper bound on $L$ or on the source's available context-control strength.

3. **Populated source, instrument and units.** One attaining member has the source $S$, control $C$, target $T$, replacement $E$, $q$ flags and a degenerate record qubit $M$, together with the three-level battery $B$ of Theorem S.2a at energies $0,\Delta,2\Delta$, initially at $\Delta$. All initially fresh qubits except the tested $T$ and source $S$ start at $|0\rangle$, with $|0\rangle=|g\rangle$ on $E$. The source law is any classical $\sum_j a_j|s_j\rangle\langle s_j|$, $a_j\ge0$, $\sum_ja_j=1$, independent of $\omega_{TR}$. Its conserving encoder is (L.12.8b.1). Apply one Hadamard to each flag, and let the source-controlled pump be generated by
$$
K=|g,\Delta\rangle\langle e,0|_{TB}+|e,0\rangle\langle g,\Delta|_{TB},\qquad
H_{\mathrm{pump}}=\frac{\hbar\theta}{\tau_{\mathrm{pump}}}|1\rangle\langle1|_C\otimes K.
\tag{S.2b.8}
$$
The two vectors in $K$ have equal bare energy $\Delta$. The $j=0$ program is the identity and $j=1$ produces exactly $\Phi_\theta^+$. Route by (S.2b.2) and expose the raw target at the registered emission endpoint. The separately chosen terminal energy-measurement protocol, performed by the receiver with its fresh $M$, uses
$$
U_{\mathrm{read}}=|g\rangle\langle g|_T\otimes I_M+|e\rangle\langle e|_T\otimes X_M,
\qquad
H_{\mathrm{read}}=\frac{\pi\hbar}{2\tau_{\mathrm{read}}}(I-U_{\mathrm{read}}).
\tag{S.2b.9}
$$
This pulse commutes with the bare energy. If $U_{j,\theta}$ is the complete unitary sequence including the encoder and readout, its full-carrier outcome maps are
$$
\mathcal I_m(X)=\Pi_m U_{\theta}XU_{\theta}^\dagger\Pi_m,\qquad
\Pi_m=I_{\mathrm{all\ except}\ M}\otimes|m\rangle\langle m|_M,\quad m=0,1.
\tag{S.2b.10}
$$
Here $U_\theta$ includes the coherent control by $C$; fixing the classical source input gives $U_{j,\theta}$. Each leaf is CP and their sum is trace preserving on the entire carrier, including unused battery levels and every off-ready input. Before this readout, the ready-source target channel is (S.2b.5). The readout has the corresponding outcome-labeled postmeasurement response; tracing its outcome additionally dephases the target in its energy basis. Complete-carrier instrument normalization does not assert (S.2b.3) for uninitialized or source-correlated router resources. For $r=\langle e|\rho|e\rangle$, write $s=\sin^2\theta$ and $r_j=r+j(1-r)s$. The complete source/outcome law is
$$
\Pr(j,m)=a_j\,[\eta_q r_j]^m[1-\eta_qr_j]^{1-m},\qquad
\Pr(F=f)=2^{-q}.
\tag{S.2b.11}
$$
For a later joint computational flag read, its finer law is $\Pr(j,f,m)=a_j2^{-q}\{r_j^m(1-r_j)^{1-m}\}$ when $f=0^q$, and $a_j2^{-q}\mathbf1_{m=0}$ otherwise. The flag formula refers to this later computational-basis read of the private flag record. It is not an extra public output. The normalized source/outcome leaves and the full retained quantum state are both fixed by (S.2b.10). For each registered source and program, the map from its ready input to its physical state at elapsed time $t$ is $\mathcal J_t(X)=U(t)\mathcal J_0(X)U(t)^\dagger$, followed by the displayed instrument at the terminal stage. This time-indexed source realization intertwines completed program composition, prefixes, final effects, outcome marginalization, common postprocessing and identity spectator extension. It does not require the ready-state code to be invariant during a pulse.

4. **Complete energy and finite resources.** On the populated member, the bare Hamiltonian is $H_0=H_T+H_E+H_B$; source, control, flags and record are explicitly degenerate. Initially
$$
E_0=\Delta(1+r).
$$
After routing and the nonselective readout, the three energy owners have means
$$
E_{T,j}=\Delta\eta_qr_j,\qquad
E_{E,j}=\Delta(1-\eta_q)r_j,\qquad
E_{B,j}=\Delta[1-j(1-r)s],\qquad
E_{T,j}+E_{E,j}+E_{B,j}=E_0.
\tag{S.2b.12}
$$
Through the unitary stages, all coherences and correlations remain in the named finite dilation. The terminal projective service produces the complete outcome-conditional instrument states of (S.2b.10); its service record owns that additional operation. The context-induced target and replacement energy changes are respectively $\Delta\eta_q(1-r)s$ and $\Delta(1-\eta_q)(1-r)s$, funded once by the battery decrease $\Delta(1-r)s$. There is no bath or reset stroke in this one-use source. Preparation of the initial source, ground replacements, ready flags, battery and records precedes the ledger interval; their supplied states and initial energy are input resources. Later reuse requires its own preparation or reset ledger.

There are $q+5$ qubits and one three-level battery, hence carrier dimension $3\,2^{q+5}$ before an optional spectator. The sequence contains $q+4$ finite pulses: one encoder, $q$ flag preparations, one pump, one router and one readout. Any involution $A=A^\dagger=A^{-1}$ used here is generated by $\pi\hbar(I-A)/(2\tau_A)$ in a positive slot. Its integrated control norm is $\pi\hbar$ when its negative eigenspace is nonempty. The pump contributes $\hbar\theta$. Consequently
$$
\mathcal A_{\mathrm{ctrl}}=(q+3)\pi\hbar+\hbar\theta,\qquad
T_* =\tau_{\mathrm{ctx}}+\sum_{i=1}^q\tau_{F_i}+\tau_{\mathrm{pump}}+\tau_{\mathrm{route}}+\tau_{\mathrm{read}}+\tau_{\mathrm{rec}}.
\tag{S.2b.13}
$$
The emission deadline is $T_{\mathrm{out}}=T_*-\tau_{\mathrm{read}}-\tau_{\mathrm{rec}}$; the selected measured record is available at $T_*$. The final $\tau_{\mathrm{rec}}>0$ is the registered terminal projective-record service of the admitted finite instrument branch. Both contexts execute the same controlled gates and use the same deadline. A supplied source nuisance register or private program memory adds its actual dimension and preparation/service record; it is not included in the displayed minimal member. The fixed instance $q=2$, $\theta=\pi/2$ has seven qubits, one three-level battery, six pulses, $\mathcal A_{\mathrm{ctrl}}=11\pi\hbar/2$ and sharp ceiling $1/4$.

For a rectangular common pulse duration $\tau_g$, choosing $\tau_g\ge\pi\hbar/(2\Delta)$ keeps the pump's complete Hamiltonian nonnegative; the other interaction Hamiltonians are positive. The bare spectrum has maximum $4\Delta$, so its integrated norm over the full trial is at most $4\Delta T_*$. Clock and interaction controllers are declared external timed services as in the source construction: they supply the listed couplings, supports and durations. During each pulse $[H_0,H_{\mathrm{int}}]=0$. Turning that coupling on and off has equal and opposite interaction-energy work, because its generator expectation is constant during the pulse. Thus its net work on the closed retained carrier is zero; its finite transient interaction-energy exchange remains owned by that controller. For a shaped coupling $H_{\mathrm{int}}(t)=a(t)G$ with $a$ vanishing at the slot endpoints, the same statement is $\int \dot a(t)\langle G\rangle\,dt=0$. Control action, preparation inventory and net work are separate records. Any implementation service overhead or maintenance supply is an additional declared controller/record port, charged by its own nonnegative ledger throughout $T_*$; no efficiency or autonomous-clock claim removes it.

5. **Implementation envelope and enlarged access.** Suppose an implemented router, with the same public deadline and receiver cut, differs from $\mathcal D_q$ by at most $\varepsilon$ in half diamond norm. Every actual pre-router program remains CPTP, so its induced comparison obeys
$$
\mathrm{CC}_{\mathrm{actual}}\le\eta_q+2\varepsilon.
\tag{S.2b.14}
$$
For the ideal attaining pair implemented with these same router errors, its observed event contrast is at least $\eta_q-2\varepsilon$. For $q=2$, $\varepsilon<1/8$ certifies a strict sub-half upper bound. One sufficient router certificate is a fresh-resource trace-distance error at most $\varepsilon_{\mathrm{prep}}$ and a full joint unitary operator-norm error at most $\varepsilon_U$, giving $\varepsilon\le\varepsilon_{\mathrm{prep}}+\varepsilon_U$. An area error $\delta a$ in the pulse $\exp[-ia(I-V)/2]$ gives $\varepsilon_U\le|\delta a|$ at the ideal area $a=\pi$. The error refers to the complete unconditional retained output on the stated cut. A public context-dependent clock label or an earlier context-dependent message is another output and needs its own comparison.

The access boundary has explicit witnesses. For the attaining input $|g\rangle_T$ and $\theta=\pi/2$, the private battery ends at $\Delta$ in context $0$ and at $0$ in context $1$, distinguishing them exactly; access to that battery destroys the quarter ceiling. Coherent access to $T,F$ also exceeds the quarter ceiling. At $q=2$, put $|u\rangle=(|01\rangle+|10\rangle+|11\rangle)/\sqrt3$ and $|v\rangle=(|00\rangle+\sqrt3|u\rangle)/2$. The two reduced $TF$ states are $|g,v\rangle\langle g,v|$ and $\tfrac14|e,00\rangle\langle e,00|+\tfrac34|g,u\rangle\langle g,u|$, with trace distance $(1+\sqrt{13})/8>1/2$. Computational flag marginals alone therefore do not certify the larger coherent access algebra. Conditioning the target record on the successful route $F=0^q$ gives conditional contrast $1$ with success probability $\eta_q$. This changes the unconditional comparison. If the interface is instead opened for $n$ fresh emissions, with fixed common per-use resources and arbitrary common adaptive receiver operations, the complete transcript comparison satisfies the sharp bound
$$
\frac12\|\rho^{(n)}_1-\rho^{(n)}_0\|_1\le1-(1-\eta_q)^n.
\tag{S.2b.15}
$$
Independent ground inputs and the pump/identity pair attain it by the event that at least one target is excited. At $q=2,n=3$ the value is $37/64>1/2$. Thus the single-final-output port is an operative physical source constraint, and the record explicitly identifies the larger experiment to which its ceiling does not apply.

*Proof.* Since $P$ is an orthogonal projection and $W_{TE}^2=I$, the two terms of $V$ act on orthogonal flag sectors, and $V^\dagger=V$, $V^2=I$. Exchange preserves the sum of the equal-gap target and replacement Hamiltonians. The projector $(I-V)/2$ has eigenvalues $0$ and $1$, so its exponential at angle $\pi$ is $V$. Write $W_f=I$ at $f=0^q$ and $W_f=W_{TE}$ otherwise. The complete state after the routing pulse, including every coherence in $F$, is
$$
2^{-q}\sum_{f,f'}|f\rangle\langle f'|_F\otimes
W_f\bigl(X_{TA}\otimes|g\rangle\langle g|_E\bigr)W_{f'}^\dagger.
$$
Tracing $F$ keeps exactly the terms $f=f'$. The single identity term contributes $X_{TA}$; every exchange term contributes $|g\rangle\langle g|_T\otimes\operatorname{tr}_TX_{TA}$ after tracing $E$. This proves (S.2b.3)--(S.2b.4) for all matrix units and hence all operators, including spectator-entangled states. It also shows precisely where the original target state is retained.

For $Y=[(\Phi_1-\Phi_0)\otimes\mathrm{id}_R](\omega_{TR})$, trace preservation gives $\operatorname{tr}_TY=0$. Equation (S.2b.4) therefore sends $Y$ to $\eta_qY$. The two channel outputs before this multiplication are normalized positive states, whose trace distance is at most $1$. This proves the second inequality of (S.2b.6). Without a spectator, Corollary 9.1 identifies the same trace-distance supremum with Definition 30 and proves the equality and bound in its first formula. CPTP receiver processing contracts trace distance, and any final effect is bounded by it. The same calculation applies after a common free target rotation. Theorem S.2a proves $\mathrm{CC}(\Phi_\theta^+-\mathrm{id})=\sin^2\theta$ and supplies its input/effect attainer. Scalar multiplication proves (S.2b.7), including every intermediate value and the sharp ceiling. All resources specifying $q$ and the flags were fixed before these response comparisons.

The source encoder copies its retained orthogonal label into $C$. The pulse (S.2b.8) acts within a bare-energy eigenspace and becomes the original pumping rotation on $C=1$; on $C=0$ it is the identity. Each flag Hadamard prepares an amplitude $2^{-q/2}$ for every flag word. The readout pulse writes the target energy label into $M$ and commutes with $H_T$, since the two control projectors are its spectral projections. The product $U_\theta$ is unitary on the full carrier. The projectors $\Pi_0,\Pi_1$ are orthogonal and sum to $I$, so (S.2b.10) is a normalized instrument for every full-carrier input. The original pumping law gives $r_j$, and the router multiplies its excited population by $\eta_q$, proving the joint law (S.2b.11). The flag weights stay uniform under the controlled routing operation. Summing all source/outcome probabilities gives $1$; retaining the original pure flag superposition gives the coherent dilation rather than an uncharged classical randomness source.

Every physical stage is the explicitly registered unitary or terminal instrument. Substitution in $\mathcal J_t$ gives $\mathcal U_{t,s}\mathcal J_s=\mathcal J_t$ at unitary stages and the displayed CP leaf square at readout. Partial trace, outcome summation, tensoring an identity and common classical postprocessing commute with that substitution. This proves the response realization on every admitted finite program, including internal adaptive programs represented by their normalized finite dilation. Access to its private memory is absent by the registered port condition, rather than by deleting the memory from the physical model. In particular the input of the protected router stays fresh even if the pre-router program creates target-private-memory entanglement; (S.2b.4) already covers that case.

The initial battery has energy $\Delta$. Pumping raises the target population by $j(1-r)s$ and lowers the battery by exactly the same energy $\Delta j(1-r)s$. Exchange then transfers a fraction $1-\eta_q$ of the pumped target energy to the initially ground replacement, leaving the remaining fraction in the emitted target. The degenerate flags, source, control and record add zero bare energy. The readout copies a commuting label and changes none of the three mean energies. This proves (S.2b.12), with no omitted replacement or battery term. All initial-state correlations subsequently created are already inside this finite account.

Counting the named registers gives $q+5$ qubits and one three-level battery. The encoder, flag Hadamards, router and readout are nontrivial involutions, giving $q+3$ pulses of norm action $\pi\hbar$. The exchange operator $K$ has norm $1$, so the pump's norm action is $\hbar\theta$. This proves (S.2b.13). Its actual runtime counts the terminal record service as well as every pulse; the identity context occupies the same controlled-pump slot. On the pump's only active eigenspace the bare energy is $\Delta$, and its complete eigenvalues are $\Delta\pm\hbar\theta/\tau_g$. The stated duration bound makes both nonnegative for all $\theta\le\pi/2$. The other pulse Hamiltonians are nonnegative and commute with $H_0$. The bare maximum $\Delta+\Delta+2\Delta=4\Delta$ proves its norm bound. During a fixed commuting pulse, $\langle H_{\mathrm{int}}\rangle$ is constant, so turning it on and off returns the same interaction-energy amount. The shaped-pulse integral proves the identical closed work balance with continuous endpoints. This is the declared timed-controller model, with its separate positive-duration and service records.

For the error bound, compose each router discrepancy with its CPTP context program and identity spectators. Half diamond norm at most $\varepsilon$ bounds each resulting output trace-distance error by $\varepsilon$. The triangle inequality then gives (S.2b.14) and the attaining-event lower bound. A common initialized-state discrepancy contracts through any joint unitary, while two joint unitary channels obey half diamond distance at most their operator-norm difference. Adding them gives the sufficient certificate. On the $-1$ eigenspace of $V$, the perturbed pulse differs from the ideal by $e^{-i(\pi+\delta a)}+1$, whose magnitude is at most $|\delta a|$; on the $+1$ eigenspace it is unchanged. Public deterministic metadata have their own output law, explaining the stated timing premise.

Finally, let $d_{k-1}$ be the trace distance between the receiver's full retained states before the $k$th fresh output, including its adaptive input and memory. All source operations before that output are local and trace preserving, so tracing the next target from the two pre-router states $\sigma_1,\sigma_0$ gives the corresponding receiver-memory marginals, whose distance is at most $d_{k-1}$. Equation (S.2b.4) and the triangle inequality therefore give
$$
\frac12\|\eta_q(\sigma_1-\sigma_0)+(1-\eta_q)|g\rangle\langle g|\otimes\operatorname{tr}_T(\sigma_1-\sigma_0)\|_1
\le\eta_q+(1-\eta_q)d_{k-1}.
$$
Common receiver processing contracts this distance. Starting with $d_0=0$ and iterating yields $d_n\le1-(1-\eta_q)^n$, proving (S.2b.15). This argument permits coherent reuse of old private source records; it requires the current router resources to be fresh and inaccessible to the current pre-router program. For independent ground inputs with the fully pumping comparison, the identity context always emits ground, whereas the pumping context emits an excited target at each successful route. The probability of at least one such outcome is $1-(1-\eta_q)^n$, proving sharpness. The coherent $TF$ difference has the positive isolated eigenvalue $1/4$ and, on the $|g,00\rangle,|g,u\rangle$ block, eigenvalues $(-1\pm\sqrt{13})/8$; half the sum of their absolute values is the stated trace distance. The battery and postselection witnesses follow directly from (S.2b.8) and the successful-route identity. These facts preserve the unrestricted ceiling $1$ of Theorem S.2a and locate the strict quarter ceiling on the populated single-output carrier class. ∎

## S.6 Non-Local Gravitational Influence via Entanglement

While the gravitational effects analyzed in Sections S.3-S.4 operate locally on the context-generating aggregate, for entangled systems the local gravitational field can modulate joint $A$-$B$ correlation statistics through standard local-unitary phase control: Alice's action changes joint correlations detectable only after classical comparison of measurement records, while Bob's marginal statistics remain unchanged, preserving no-signaling. Postulate 3's branch (iii) posits Bob-marginal statistical shifts through a separate non-CPTP or non-local mechanism beyond the local gravitational dephasing analyzed here; a late-randomized shift of that kind lies outside the exact pre-lightcone context-independence branch classified by Corollary 39c.1 and its preregistered test decides between the two branches: a certified shift would select branch (iii), while a null result keeps that branch.

**Setup:** Consider Alice and Bob sharing a maximally entangled two-qubit state:
$$
|\psi\rangle_{AB} = \frac{1}{\sqrt{2}}(|0\rangle_A|0\rangle_B + |1\rangle_A|1\rangle_B)
\tag{S.34}
$$

**Alice's action and phase reference:** Alice creates a retained, quasi-static context source on the uniform spherical branch. Register a phase-reference clock at the sphere centre and an Alice subsystem at radius $r_A<R_S$, together with the signal-transfer and baseline-phase calibrations needed to compare their clocks. Let $\Phi_A:=\Phi(r_A)-\Phi(0)$ denote the context-induced potential difference in this comparison. A potential value without a clock-reference protocol does not define an observable phase.

For a two-level subsystem with $\Delta E_A=E_1-E_0$, the additional phase of $|1\rangle_A$ relative to $|0\rangle_A$, using evolution $e^{-iE\tau/\hbar}$, is at retained weak-field order
$$
\delta\phi_A=-\frac{\Delta E_A\Phi_A t}{\hbar c^2}.
\tag{S.35}
$$
After removal of the registered baseline phases, the ideal local phase channel gives
$$
|\psi(t)\rangle_{AB}
=\frac1{\sqrt2}\left(|0\rangle_A|0\rangle_B
+e^{i\delta\phi_A}|1\rangle_A|1\rangle_B\right).
\tag{S.36}
$$
Bob's reduced state remains
$$
\rho_B=\operatorname{tr}_A|\psi(t)\rangle\langle\psi(t)|
=\frac12(|0\rangle\langle0|+|1\rangle\langle1|).
\tag{S.37}
$$
Thus Bob cannot detect the phase through local measurements alone. For transverse-basis joint measurements, with $|\pm\rangle=(|0\rangle\pm|1\rangle)/\sqrt2$,
$$
P(++|t)=\left|\frac{1+e^{i\delta\phi_A}}{2\sqrt2}\right|^2
=\frac14[1+\cos(\delta\phi_A)].
\tag{S.38}
$$
Since $P(++|0)=1/2$,
$$
\Delta P(++)=\frac14[\cos(\delta\phi_A)-1].
\tag{S.39}
$$
Under the additional small-phase condition $|\delta\phi_A|\ll1$,
$$
\Delta P(++)=-\frac{\delta\phi_A^2}{8}+O(\delta\phi_A^4)
=-\frac18\left(\frac{\Delta E_A\Phi_A t}{\hbar c^2}\right)^2
+O(\delta\phi_A^4).
\tag{S.40}
$$
Weak field alone does not imply small accumulated phase.

Integrating (S.15) from the reference centre to $r_A$ gives the retained potential model
$$
\Phi_A=\int_0^{r_A}g_{CC}(r)\,dr
=\frac{2\pi G}{3}(1+3w_c)
\frac{\eta_{\mathrm{ret}}P_{\mathrm{context}}\tau_c}{V_Sc^2}r_A^2.
\tag{S.41}
$$
The potential offset cancels between the two registered worldlines. The selected probability therefore satisfies, within this leading weak-field phase model,
$$
|\Delta P(++)|
=\frac18\left(\frac{\Delta E_At}{\hbar c^2}\right)^2
\left[\frac{2\pi G}{3}(1+3w_c)
\frac{\eta_{\mathrm{ret}}r_A^2}{V_Sc^2}\right]^2
(P_{\mathrm{context}}\tau_c)^2
+O(\delta\phi_A^4).
\tag{S.42}
$$
The quartic remainder concerns the cosine expansion; higher-order metric, clock-transfer and source-model errors require their own certificate.

**Interpretation:** This is the *joint-correlation modulation* mechanism — local control of entangled joint statistics under no-signaling:

1. Alice's local action (creating high-CC context) generates local gravitational field
2. Local gravitational field affects only Alice's particle (local interaction)
3. Because Alice's particle is entangled with Bob's, the global entanglement correlations are modified
4. Bob's marginal statistics remain unchanged (no-signaling preserved, Equation S.37)
5. The local-unitary phase modifies the joint probabilities $P(ij)$; detecting the modification requires classical comparison of Alice's and Bob's measurement records.
6. The effect changes probabilities without selecting a specific outcome.
7. Detection requires a protocol-specific sample size whose leading small-CC scaling is proportional to $\mathrm{CC}^{-8}$ when the response coefficients are nonzero

**Detection requirements:** If Equation S.5 is written as
$$
P_{\mathrm{context}}=A\left(\frac{\text{CC}}{\alpha_{CC,\max}-\text{CC}}\right)^2,
$$
define its small-CC coefficient $a_P:=A/\alpha_{CC,\max}^2$. Then the two response laws are
$$
P_{\mathrm{context}}=a_P\,\text{CC}^2+o(\text{CC}^2),
\qquad
|\Delta P|=B P_{\mathrm{context}}^2+o(P_{\mathrm{context}}^2)
=C\,\text{CC}^4+o(\text{CC}^4),
\qquad C:=B a_P^2.
\tag{S.43}
$$
Here $a_P$ has units of power and $B$ has units of inverse power squared, so $C$ is dimensionless. Assume $C>0$ and independent Bernoulli trials with a calibrated interior null probability $0<p_0<1$. For two-sided type-I error $\alpha\in(0,1/2)$ and power $1-\beta$ with $\beta\in(0,1/2)$, the large-sample normal-approximation planning formula gives, at leading order as $\mathrm{CC}\downarrow0$,
$$
N_{\mathrm{samples}}
\gtrsim
\frac{(z_{1-\alpha/2}+z_{1-\beta})^2p_0(1-p_0)}{C^2\,\text{CC}^8}.
\tag{S.44}
$$
Correlations, nuisance estimation, and post-selection replace $N_{\mathrm{samples}}$ by the corresponding effective sample size.

For $\text{CC}=0.1$, the power-law factor is $\text{CC}^{-8}=10^8$. The absolute sample requirement also depends on $C$, the significance and power targets, the null variance, trial dependence, and post-selection efficiency. Crucially, these measurements must be:
- Spacelike-separated (ensuring no subluminal communication during measurement)
- Post-selected and compared (requiring classical communication afterward)
- Statistically aggregated (individual outcomes remain random)

**Conditional carrier comparison.** A gravitational carrier couples through a certified stress-energy and metric response, while an electromagnetic carrier couples through a certified current, field, and target susceptibility. Universal stress-energy coupling does not prove that the nominated gravitational phase channel is realizable, dominant, or uniquely attributable. Distinguishing carriers requires preregistered response surfaces, matched geometry and retention data, and nuisance-controlled likelihood comparison.

<a id="theorem-s3-conditional-gravitational-joint-correlation-estimate"></a>**Theorem S.3 (Conditional Gravitational Joint-Correlation Estimate).** Assume the uniform spherical perfect-fluid source model, the retained-energy law with $0<\eta_{\mathrm{ret}}\le1$, and the global quadratic cost branch S.5. Register the centre-clock comparison and baseline/transfer calibration of S.35–S.41, with a two-level subsystem $A$ at $0\le r_A<R_S$, constant energy gap $\Delta E_A$, and interaction time $t$. Within the retained quasi-static weak-field model, assume the ideal local phase channel and selected joint measurement of S.36–S.38. Put
$$
K_A:=\frac{2\pi G}{3}(1+3w_c)
\frac{\eta_{\mathrm{ret}}\tau_cr_A^2}{V_Sc^2},
\qquad \Phi_A:=\Phi(r_A)-\Phi(0)=K_AP_{\mathrm{context}}.
$$
On the additional small-phase branch, Bob's marginal is unchanged and
$$
|\Delta P(++)|
=\frac18\left(\frac{\Delta E_At}{\hbar c^2}\right)^2
K_A^2A^2
\left[\frac{\mathrm{CC}(S_A)}
{\alpha_{CC,\max}-\mathrm{CC}(S_A)}\right]^4
+O(\delta\phi_A^4).
\tag{S.45}
$$
This remainder controls the phase-response expansion within the retained metric model. Physical comparison additionally requires the source, metric and clock-transfer error budget.

*Proof.* The registered clock comparison gives
$$
\delta\phi_A=-\frac{\Delta E_At}{\hbar c^2}K_AP_{\mathrm{context}}.
$$
Equations S.38–S.40 imply
$$
|\Delta P(++)|=\frac18\delta\phi_A^2+O(\delta\phi_A^4).
$$
The cost law gives
$$
P_{\mathrm{context}}^2
=A^2\left[\frac{\mathrm{CC}(S_A)}
{\alpha_{CC,\max}-\mathrm{CC}(S_A)}\right]^4.
$$
Substitution proves S.45. The local unitary is CPTP, so Theorem S.1 gives the unchanged Bob marginal. ∎

**Conditional carrier-discrimination protocol.** Preregister the electromagnetic and gravitational carrier response functions, nuisance controls, uncertainty model, and identifiability criterion. Vary radiated power and total retained power independently over a domain on which the two predicted response surfaces are distinguishable. Attribute support to one carrier branch only if the matched likelihood rejects the competing registered surface at the declared uncertainty level while ordinary electromagnetic, thermal, mechanical, and instrumental channels are controlled. Appendix L/S does not prove that the two carrier families are exhaustive or that correlation with raw power alone identifies either mechanism.

**Definition S.6.1a (Causally Implemented Metric-Phase Entanglement Certificate).** Fix the input $|+\rangle_A|+\rangle_B$, diagonal phase intervals, a causal mediator implementation, an ideal controlled-phase output $\sigma_\Phi$, and an actual output $\rho_{\mathrm{out}}$ satisfying
$$
\|\rho_{\mathrm{out}}-\sigma_\Phi\|_1\le\epsilon_N.
\tag{S.6.1a.1}
$$
For $I_\Phi=I_{00}+I_{11}-I_{01}-I_{10}$ require
$$
\frac12\inf_{\Phi\in I_\Phi}|\sin(\Phi/2)|-\epsilon_N>0.
\tag{S.6.1a.2}
$$

**Proposition S.6.1b (Robust Controlled-Phase Entanglement Witness).** The actual output has positive negativity. On the ideal branch,
$$
\mathcal N(\sigma_\Phi)=\frac12|\sin(\Phi/2)|.
\tag{S.6.1b.1}
$$

*Proof.* Local diagonal phases do not change entanglement, so the ideal output is locally equivalent to
$$
|\psi_\Phi\rangle
=\frac12\bigl(|00\rangle+|01\rangle+|10\rangle+e^{i\Phi}|11\rangle\bigr).
$$
Its coefficient matrix is
$$
C_\Phi=\frac12
\begin{pmatrix}
1&1\\
1&e^{i\Phi}
\end{pmatrix},
$$
and therefore
$$
2|\det C_\Phi|
=\frac12|e^{i\Phi}-1|
=|\sin(\Phi/2)|.
$$
If $s_1,s_2$ are the Schmidt coefficients, the eigenvalues of the partial transpose of $|\psi_\Phi\rangle\langle\psi_\Phi|$ are
$$
s_1^2,\quad s_2^2,\quad s_1s_2,\quad -s_1s_2.
$$
Thus
$$
\mathcal N(\sigma_\Phi)
=\frac{\lVert\sigma_\Phi^{T_B}\rVert_1-1}{2}
=s_1s_2
=|\det C_\Phi|
=\frac12|\sin(\Phi/2)|,
$$
which proves (S.6.1b.1).

For operators on $\mathbb C^2\otimes\mathbb C^2$, the induced trace-norm bound for partial transpose is
$$
\lVert X^{T_B}\rVert_1\le2\lVert X\rVert_1
$$
(Vidal and Werner 2002). Hence
$$
\begin{aligned}
|\mathcal N(\rho_{\mathrm{out}})-\mathcal N(\sigma_\Phi)|
&\le\frac12
\lVert(\rho_{\mathrm{out}}-\sigma_\Phi)^{T_B}\rVert_1\\
&\le\lVert\rho_{\mathrm{out}}-\sigma_\Phi\rVert_1
\le\epsilon_N.
\end{aligned}
$$
Because the certified phase satisfies $\Phi\in I_\Phi$,
$$
\mathcal N(\rho_{\mathrm{out}})
\ge\frac12\inf_{\varphi\in I_\Phi}|\sin(\varphi/2)|-\epsilon_N>0
$$
by (S.6.1a.2). ∎

<a id="definition-s61c-classical-mediator-implementation-class"></a>**Definition S.6.1c (Classical-Mediator Implementation Class).** Fix finite-dimensional matter systems $A$ and $B$, a probe of mass $m>0$ with position operator $\hat{\mathbf r}=(\hat x,\hat y,\hat z)$ and axial momentum operator $\hat p_x$, and a protocol window $[0,t]$ with $t>0$. A mediator implementation belongs to the classical-mediator class $\mathfrak K_{\mathrm{cl}}$ if a finite record supplies entries 1 and 2; its probe sector is admissible if the record also supplies entries 3, 4, and 5.

1. *(Configuration entry.)* A measurable configuration space $(\Lambda,\mu)$ and a probability density $p(\lambda)$ whose elements label definite mediator configurations; $\lambda$ may be correlated with any source-preparation or classical communication record.

2. *(Product-response entry.)* For every $\lambda$, measurable trace-nonincreasing completely positive maps $\mathcal E_A^\lambda$ on $A$ and $\mathcal E_B^\lambda$ on $B$ such that, for every input $\rho_A\otimes\rho_B$ and every acceptance set $\Lambda_{\mathrm{acc}}\subseteq\Lambda$ for which the operator-valued integrand is trace-norm Bochner integrable and its accepted trace is finite and strictly positive, the selective matter output is
$$
\rho_{\mathrm{sel}}
=
\frac{\displaystyle\int_{\Lambda_{\mathrm{acc}}}p(\lambda)\bigl(\mathcal E_A^\lambda\otimes\mathcal E_B^\lambda\bigr)(\rho_A\otimes\rho_B)\,d\mu(\lambda)}
{\displaystyle\operatorname{tr}\int_{\Lambda_{\mathrm{acc}}}p(\lambda)\bigl(\mathcal E_A^\lambda\otimes\mathcal E_B^\lambda\bigr)(\rho_A\otimes\rho_B)\,d\mu(\lambda)}.
\tag{S.6.1c.1}
$$
Postselection on any classical record, including the mediator record itself, acts only through the choice of $\Lambda_{\mathrm{acc}}$ and the induced reweighting of $p$. An acceptance rule is probe-blind if $\Lambda_{\mathrm{acc}}$ is determined by $\lambda$ and by records generated without measuring the probe.

3. *(Source-positivity entry.)* Every $\lambda$ assigns a finite nonnegative source mass measure $\nu_\lambda$ on $\mathbb R^3$, and the probe evolves on $[0,t]$ under the gravitational potential
$$
V_\lambda(\mathbf r)=-Gm\int\frac{d\nu_\lambda(\mathbf r')}{|\mathbf r-\mathbf r'|}.
\tag{S.6.1c.2}
$$

4. *(Axial-separation entry.)* There exist $x_0\in\mathbb R$ and $\Delta>0$ with $\operatorname{supp}\nu_\lambda\subseteq\{\mathbf r':x'\le x_0-\Delta\}$ for every $\lambda\in\Lambda$, and the probe state $\psi_\tau^\lambda$ satisfies $\operatorname{supp}|\psi_\tau^\lambda|^2\subseteq\{\mathbf r:x\ge x_0\}$ for every $\lambda\in\Lambda$ and every $\tau\in[0,t]$.

5. *(Ehrenfest-regularity entry.)* For every $\lambda\in\Lambda$ the pair $(\psi_\tau^\lambda,V_\lambda)$ satisfies
$$
\frac{d}{d\tau}\langle\hat p_x\rangle_{\psi_\tau^\lambda}
=
\bigl\langle-\partial_xV_\lambda\bigr\rangle_{\psi_\tau^\lambda}
\qquad(\tau\in[0,t]).
\tag{S.6.1c.3}
$$

<a id="lemma-s61d-classical-mediator-response-bounds"></a>**Lemma S.6.1d (Classical-Mediator Response Bounds).** Let a mediator implementation lie in $\mathfrak K_{\mathrm{cl}}$.

(i) For every product input $\rho_A\otimes\rho_B$ and every acceptance set satisfying Definition S.6.1c(2), the selective output (S.6.1c.1) is separable and
$$
\mathcal N(\rho_{\mathrm{sel}})=0.
\tag{S.6.1d.1}
$$

(ii) Suppose the probe sector is admissible and the acceptance rule is probe-blind. Let $\tilde p\ge0$ be a measurable accepted density with $\int_{\Lambda_{\mathrm{acc}}}\tilde p\,d\mu=1$. Assume the per-configuration impulse is measurable and integrable with respect to $\tilde p\,d\mu$. Then
$$
\langle\Delta p_x\rangle_{\mathrm{sel}}
:=\int_{\Lambda_{\mathrm{acc}}}\tilde p(\lambda)
\left(\langle\hat p_x\rangle_{\psi_t^\lambda}
-\langle\hat p_x\rangle_{\psi_0^\lambda}\right)d\mu(\lambda)
\le0,
\tag{S.6.1d.2}
$$
with strict inequality when $\nu_\lambda\ne0$ on a set of positive accepted measure. The bound
$$
\left|\langle\hat p_x\rangle_{\psi_t^\lambda}
-\langle\hat p_x\rangle_{\psi_0^\lambda}\right|
\le\frac{Gmt}{\Delta^2}\nu_\lambda(\mathbb R^3)
$$
shows that a finite accepted mean source mass is a sufficient integrability condition.

*Proof.* (i) Complete positivity gives $\mathcal E_A^\lambda(\rho_A)\ge0$ and $\mathcal E_B^\lambda(\rho_B)\ge0$, so each integrand in (S.6.1c.1) is a nonnegative multiple of a product state. The accepted integral is therefore an unnormalized separable operator, and division by its positive trace preserves separability; continuous mixtures are included because the accepted integral is a trace-norm limit of finite separable sums and the separable states form a trace-norm closed convex set in finite dimension. For a separable state $\sigma=\sum_r q_r\,\sigma_A^{(r)}\otimes\sigma_B^{(r)}$ with $q_r\ge0$, the partial transpose $\sigma^{T_B}=\sum_r q_r\,\sigma_A^{(r)}\otimes(\sigma_B^{(r)})^{T}$ is a sum of positive operators, hence positive with unit trace, so $\lVert\sigma^{T_B}\rVert_1=\operatorname{tr}\sigma^{T_B}=1$ and $\mathcal N(\sigma)=(\lVert\sigma^{T_B}\rVert_1-1)/2=0$ in the negativity convention of Proposition S.6.1b. Only the product form of the maps per configuration is used, so classical communication or feedforward folded into $\lambda$ leaves the conclusion unchanged.

(ii) Fix $\lambda\in\Lambda$. For $x\ge x_0$ the axial-separation entry gives $x-x'\ge\Delta>0$ for every $\mathbf r'\in\operatorname{supp}\nu_\lambda$, and $|x-x'|\,|\mathbf r-\mathbf r'|^{-3}\le|\mathbf r-\mathbf r'|^{-2}\le\Delta^{-2}$, so differentiation of (S.6.1c.2) under the integral is justified by dominated convergence and
$$
-\partial_xV_\lambda(\mathbf r)
=
-Gm\int\frac{x-x'}{|\mathbf r-\mathbf r'|^{3}}\,d\nu_\lambda(\mathbf r')
\le0
\qquad(x\ge x_0),
$$
with strict inequality when $\nu_\lambda\neq0$. Since $\operatorname{supp}|\psi_\tau^\lambda|^2\subseteq\{x\ge x_0\}$ for all $\tau\in[0,t]$, (S.6.1c.3) gives $\frac{d}{d\tau}\langle\hat p_x\rangle_{\psi_\tau^\lambda}\le0$ on $[0,t]$, and integration over $[0,t]$ gives $\langle\hat p_x\rangle_{\psi_t^\lambda}-\langle\hat p_x\rangle_{\psi_0^\lambda}\le0$ for every configuration, strictly when $\nu_\lambda\neq0$. A probe-blind acceptance rule replaces $p$ by $\tilde p\ge0$ without altering any per-configuration term, so (S.6.1d.2) is an average of nonpositive numbers, strictly negative under the stated nondegeneracy. ∎

<a id="corollary-s61e-two-discharge-witnesses-for-mediator-nonclassicality"></a>**Corollary S.6.1e (Two Discharge Witnesses for Mediator Nonclassicality).** Consider a gravitational causal mediator implementation on the branch of Definition S.6.1a.

(a) Acceptance of (S.6.1a.1) and (S.6.1a.2) excludes every implementation in $\mathfrak K_{\mathrm{cl}}$: Proposition S.6.1b certifies $\mathcal N(\rho_{\mathrm{out}})>0$ for the product input $|+\rangle_A|+\rangle_B$, while Lemma S.6.1d(i) gives $\mathcal N(\rho_{\mathrm{sel}})=0$ for every selective output of the class from that input.

(b) Let a retained probe record carry the source-positivity and axial-separation geometry of Definition S.6.1c, a probe-blind acceptance rule, a force-provenance entry attributing the retained axial impulse to the gravitational interaction channel, and a certified conditional mean
$$
\langle\Delta p_x\rangle_{\mathrm{sel}}\ge\kappa>0
\tag{S.6.1e.1}
$$
after subtraction of the certified statistical and systematic error budget. Then every implementation in $\mathfrak K_{\mathrm{cl}}$ with admissible probe sector is excluded by Lemma S.6.1d(ii).

Either record excludes $\mathfrak K_{\mathrm{cl}}$ for the registered protocol. This exclusion does not select a nonclassical completion or establish that an arbitrary implementation outside the class produces either witness. A selective-subensemble record alone supplies no unconditional or remote-marginal conclusion.

*Proof.* Each part contradicts the corresponding bound of Lemma S.6.1d for class members carrying the stated entries. In part (b), reproduction of the certified finite conditional mean includes the measurability and integrability conditions of that lemma. The resulting class exclusion is necessary for the witness, not sufficient to realize it. Implementations outside the class require their own response calculation. ∎

**Remark S.6.1 (Selective Records and the Trace-Preserving Branch).** A record conditioned on acceptance with probability strictly between zero and one is a selective-subensemble record. Its normalized selective formula alone supplies no local CPTP certificate for Theorems S.1 and S.3. Within $\mathfrak K_{\mathrm{cl}}$, the full-ensemble mean obeys Lemma S.6.1d(ii) when its measurability and integrability conditions hold. If all outcomes are accepted, the record is a full-ensemble record and must separately satisfy the applicable marginal and no-signaling constraints; normalization alone does not place it outside the trace-preserving branch. A spatially superposed source with probe-blind postselection in a nonorthogonal source basis is a proposed realization of (S.6.1e.1) on a coherent-mediator branch (Saldanha, Marletto and Vedral 2026). Its exclusion from $\mathfrak K_{\mathrm{cl}}$ requires a response that cannot be represented in the configuration-diagonal product form (S.6.1c.1), and its positive impulse requires a separate response certificate.

<a id="proposition-s61f-causal-bosonic-mediator-realization-of-definition-s61a"></a>**Proposition S.6.1f (Causal Bosonic-Mediator Realization of Definition S.6.1a).** Let $A$ and $B$ be qubits with $Z|0\rangle=|0\rangle$, $Z|1\rangle=-|1\rangle$ and spectral projectors $\Pi^{+1}=|0\rangle\langle0|$, $\Pi^{-1}=|1\rangle\langle1|$, and let the mediator $M$ be one bosonic mode with displacements $D(\gamma)=\exp(\gamma a^\dagger-\bar\gamma a)$. For $X\in\{A,B\}$ put $C_X(\gamma):=\sum_{z=\pm1}\Pi^z_X\otimes D(z\gamma)$. Choose bounded world tubes $W_1\prec W_2\prec W_3\prec W_4$ containing the mediator together with $B$, $A$, $B$ and $A$ respectively, apply
$$
U_1=C_B(-\beta),\quad U_2=C_A(-\alpha),\quad U_3=C_B(\beta),\quad U_4=C_A(\alpha)
\tag{S.6.1f.1}
$$
in those tubes with identity extension on every other factor, and let the mediator start in an arbitrary state $\sigma_M$.

(a) With $\theta:=2\operatorname{Im}(\alpha\bar\beta)$,
$$
U_4U_3U_2U_1=e^{i\theta Z_A\otimes Z_B}\otimes I_M,
\tag{S.6.1f.2}
$$
so the joint $AB$ channel is exactly a controlled phase and the mediator returns to $\sigma_M$ uncorrelated with $AB$.

(b) From $|+\rangle_A|+\rangle_B$, the ideal output $\sigma_\Phi$ has the diagonal phase intervals $I_{00}=I_{11}=\{\theta\}$ and $I_{01}=I_{10}=\{-\theta\}$, so
$$
\Phi=8\operatorname{Im}(\alpha\bar\beta),
\qquad
\mathcal N(\sigma_\Phi)=\tfrac12\bigl|\sin\bigl(4\operatorname{Im}(\alpha\bar\beta)\bigr)\bigr|.
\tag{S.6.1f.3}
$$

(c) Let the actual process be any composition $\mathcal V_7\circ\cdots\circ\mathcal V_1$ of CPTP maps on $A\otimes B\otimes M$ whose ideal counterparts $\mathcal W_1,\ldots,\mathcal W_7$ are conjugation by $U_1$, the identity, conjugation by $U_2$, the identity, conjugation by $U_3$, the identity and conjugation by $U_4$, the identities representing the three mediator transits. Then the actual output $\rho_{\mathrm{out}}$ satisfies (S.6.1a.1) with
$$
\epsilon_N:=\sum_{k=1}^7\|\mathcal V_k-\mathcal W_k\|_\diamond,
\tag{S.6.1f.4}
$$
where $\|\cdot\|_\diamond$ is the completely bounded trace norm. Whenever $\tfrac12|\sin(4\operatorname{Im}(\alpha\bar\beta))|-\epsilon_N>0$, the tuple of (S.6.1f.1)--(S.6.1f.4) populates Definition S.6.1a with a strictly positive margin, Proposition S.6.1b gives $\mathcal N(\rho_{\mathrm{out}})>0$, and Corollary S.6.1e(a) excludes every representation in $\mathfrak K_{\mathrm{cl}}$.

*Proof.* (a) Since $[a,a^\dagger]=1$, the commutator $[\gamma a^\dagger-\bar\gamma a,\delta a^\dagger-\bar\delta a]=\gamma\bar\delta-\bar\gamma\delta$ is a scalar, and $D(\gamma)D(\delta)=e^{(\gamma\bar\delta-\bar\gamma\delta)/2}D(\gamma+\delta)$. On the sector $\Pi^{z_A}_A\otimes\Pi^{z_B}_B$ the product (S.6.1f.1) acts on $M$ by $D(z_A\alpha)D(z_B\beta)D(-z_A\alpha)D(-z_B\beta)$. Two applications of the composition law give $e^{(\gamma\bar\delta-\bar\gamma\delta)/2}D(\gamma+\delta)$ and $e^{(\gamma\bar\delta-\bar\gamma\delta)/2}D(-\gamma-\delta)$ for $\gamma=z_A\alpha$, $\delta=z_B\beta$, and their product is $e^{\gamma\bar\delta-\bar\gamma\delta}I=e^{2iz_Az_B\operatorname{Im}(\alpha\bar\beta)}I$. Summing over sectors gives (S.6.1f.2).

(b) The output is $\tfrac12\sum_{z_A,z_B}e^{i\theta z_Az_B}|z_Az_B\rangle$, whose phases are the displayed intervals, and $\Phi=I_{00}+I_{11}-I_{01}-I_{10}=4\theta$. Proposition S.6.1b gives the negativity.

(c) For CPTP maps, $\|\mathcal X\circ\mathcal Y\|_\diamond\le\|\mathcal X\|_\diamond\|\mathcal Y\|_\diamond$ and $\|\mathcal V_k\|_\diamond=\|\mathcal W_k\|_\diamond=1$, so the telescoping identity $\mathcal V_7\cdots\mathcal V_1-\mathcal W_7\cdots\mathcal W_1=\sum_k\mathcal V_7\cdots\mathcal V_{k+1}(\mathcal V_k-\mathcal W_k)\mathcal W_{k-1}\cdots\mathcal W_1$ bounds the difference by $\epsilon_N$. Applying both maps to $|{+}{+}\rangle\langle{+}{+}|\otimes\sigma_M$ and tracing out $M$, which contracts the trace norm, gives $\|\rho_{\mathrm{out}}-\sigma_\Phi\|_1\le\epsilon_N$ by (a). The remaining conclusions are Proposition S.6.1b and Corollary S.6.1e(a). ∎

<a id="theorem-s61g-source-mass-realization-on-a-driven-traveling-four-edge-platform"></a>**Theorem S.6.1g (Source-Mass Realization on a Driven Traveling Four-Edge Platform).** In the prescribed-source linearized-gravity model below, finite positive source masses, separated compact profiles and the causal continuum curvature field determine the four actual displacement vectors. Their common-mode comparison has
$$
\alpha=\sqrt{\pi/8},\qquad\beta=-i\sqrt{\pi/8},\qquad
(-\beta,-\alpha,\beta,\alpha)
\tag{S.6.1g.1}
$$
in the chronological $B,A,B,A$ order of Proposition S.6.1f. With the specified initial fluctuation vacuum, the prepared $AB$ channel, uniformly over logical inputs and references, differs from its ideal controlled-phase channel by less than $26\times10^{-6}$ in diamond norm. It therefore populates Definition S.6.1a with $\epsilon_N<0.000026$ and has negativity greater than $0.499974$, excluding the product-response class of Corollary S.6.1e(a).

The platform has preprogrammed local classical controls, conserved source labels and a fixed common static background with the stated local compensation. Preparation, distribution, synchronization, gathering and decoding are finite causal boundary services. Stage order means strictly disjoint chronological pulse intervals in bounded stage regions containing the relevant party's shares, with inactive shares undergoing identity. Local continuum propagation is independently causal. An all-pairs-timelike ordering of these enlarged regions, an autonomous controller, a material realization beyond the nominated linearized model, or an unrestricted approximation over mediator input states is not a premise or conclusion.

1. **Actual conserved source and field.** Retain $c,G,\hbar>0$. Use norm-one transverse-traceless polarization tensors and the continuum normalization
$$
N(k)=\left[\frac{16\pi G\hbar}{(2\pi)^3c^2\omega}\right]^{1/2},
\qquad\omega=c|k|,\qquad e=\operatorname{diag}(0,1,-1)/\sqrt2.
\tag{S.6.1g.2}
$$
Let $f$ be the convolution of the normalized nonnegative radial polynomial $(1-4|x|^2)^6$ on $|x|<1/2$ with a normalized nonnegative radial smooth bump supported in radius $1/2$. Let $\chi(u)=C_0(1-u^2)^4$ on $[-1,1]$, zero outside, normalized to integral one. Thus $f$ is smooth with unit-ball support, while $\chi$ is $C^3$ with integrable fourth weak derivative. Fix $R>0$, $\tau=R/c$, $k_0=n/R$, $\omega_0=cn/R$, $\ell=R$, and
$$
t_j=10j\tau,\quad X_j=10jR e_x,\quad
(\phi_0,\phi_1,\phi_2,\phi_3)=(\pi/2,\pi,-\pi/2,0).
$$
The real superpotential at station $j$ is
$$
q_j(t,x)=Mc^2\ell^2\chi((t-t_j)/\tau)R^{-3}f((x-X_j)/R)
\cos[k_0(x_x-X_{jx})-\omega_0(t-t_j)+\phi_j].
\tag{S.6.1g.3}
$$
Its branch stress difference is
$$
\Delta T^{00}=e_{ab}\partial_a\partial_bq_j,\quad
\Delta T^{0a}=-c^{-1}e_{ab}\partial_t\partial_bq_j,\quad
\Delta T^{ab}=c^{-2}e_{ab}\partial_t^2q_j.
\tag{S.6.1g.4}
$$
The source interaction action is the local gauge-invariant tidal coupling $-(Z_j/2)\int q_j e_{ab}R_{0a0b}\,dt\,d^3x$.

For a normalized smooth radial baseline $b(y)$ supported in $|y|<2$ and positive on $|y|\le1$, put $g_\phi(u,y)=\chi(u)f(y)\cos(ny_x-nu+\phi)$. Let $D_{00}=e_{ab}\partial_a\partial_bg_\phi$, $D_{0a}=-e_{ab}\partial_u\partial_bg_\phi$, $D_{ab}=e_{ab}\partial_u^2g_\phi$, and fix the finite source constant
$$
C_n=1+\sup_{u,y,\phi}\frac{\sum_{\mu,\nu=0}^3|D_{\mu\nu}(u,y)|}{b(y)},\qquad
M_{\mathrm{bg}}=\frac{M\ell^2C_n}{2R^2}.
\tag{S.6.1g.5}
$$
The supremum is over the compact modulation support. The separately conserved baseline has $\overline T^{00}=M_{\mathrm{bg}}c^2R^{-3}b((x-X_j)/R)$ and zero other components. Both $\overline T\pm\Delta T/2$ have nonnegative energy density and the same finite positive total mass $M_{\mathrm{bg}}$. Their modulation has zero integrated mass and dipole. Baseline support radii $2R$ are disjoint at separation $10R$.

2. **Mass-to-mode map and both real sidebands.** With Fourier conventions $\widehat\chi(v)=\int\chi(u)e^{ivu}du$, $\widehat f(u)=\int f(x)e^{-iu\cdot x}d^3x$, the displacement of an origin-centered real pulse is
$$
v_\phi=e^{i\phi}F+e^{-i\phi}B,
\tag{S.6.1g.6}
$$
where
$$
\begin{aligned}
F_\lambda(k)&=-\frac{iM\ell^2\omega^2N(k)\tau}{8\hbar}
(\overline E_\lambda:e)\widehat\chi(\tau(\omega-\omega_0))
\widehat f(R(k-k_0e_x)),\\
B_\lambda(k)&=-\frac{iM\ell^2\omega^2N(k)\tau}{8\hbar}
(\overline E_\lambda:e)\widehat\chi(\tau(\omega+\omega_0))
\widehat f(R(k+k_0e_x)).
\end{aligned}
$$
Translation to station $j$ multiplies both terms by $e^{i\omega t_j-ik\cdot X_j}$. Set $p=ne_x+u$, $C(\widehat p)=\sum_\lambda|E_\lambda:e|^2$ and
$$
I_n=\int |p|^3C(\widehat p)|\widehat\chi(|p|-n)|^2|\widehat f(u)|^2\,d^3u.
$$
Then
$$
a^2:=\|F\|^2=\frac{GM^2\ell^4 I_n}{32\pi^2\hbar cR^4}
=\frac{GM_{\mathrm{bg}}^2I_n}{8\pi^2\hbar cC_n^2}.
\tag{S.6.1g.7}
$$
Choose $a=\sqrt{\pi/8}$ by fixing $M_{\mathrm{bg}}=aC_n\sqrt{8\pi^2\hbar c/(GI_n)}$, hence $M=2M_{\mathrm{bg}}/C_n$, and nominate the actual normalized mode $F/a$. The phases in (S.6.1g.3) give the four forward vectors $(ia,-a,-ia,a)F/a$, precisely (S.6.1g.1). These are actual source vectors, not factors inferred afterward from an entangling phase.

3. **Finite mode-selection and output bounds.** Put $J_r=\int|u|^r|\widehat f(u)|^2d^3u$, $r=0,3,4,7$, and $C_\chi=\|\chi^{(4)}\|_1$. Define
$$
A=2048J_4,\quad D=296960J_7,\quad
C=2048C_\chi^2(J_0+J_3),\qquad
\eta_n=30\sqrt{A/n^2+D/n^5}+\sqrt{C/n^8}.
\tag{S.6.1g.8}
$$
All constants are finite. Fix $\delta_0=10^{-6}$ and an integer
$$
n\ge\max\left\{1,\left\lceil\frac{30(A+D+2)+C+1}{\delta_0}\right\rceil\right\}.
\tag{S.6.1g.9}
$$
Then $I_n\ge n^3/512>0$, $\eta_n\le\delta_0$, and each actual edge differs in norm from its nominated ideal edge by at most $e=a\eta_n$. The four-pulse residual field vector is at most $4e$ in every logical $Z$ sector, and its phase discrepancy is at most $d_\phi=12ae+6e^2$. Consequently
$$
\|\mathcal E_{AB}^{\mathrm{prepared}}-\mathcal U_{\mathrm{ideal}}\|_\diamond
\le2\sqrt{16e^2+(12ae+6e^2)^2}<26\times10^{-6}.
\tag{S.6.1g.10}
$$
The field preparation is fixed in this norm; $AB$ inputs and references are unrestricted. It suffices directly for Definition S.6.1a. The ideal phase intervals are $\{\pi/4\},\{-\pi/4\},\{-\pi/4\},\{\pi/4\}$, so $\Phi=\pi$ and the ideal negativity is $1/2$.

4. **Actual control, causal schedule and finite resources.** The eight real spatial profiles are $g_{j,c}=R^{-3}f((x-X_j)/R)\cos(k_0(x_x-X_{jx}))$ and the corresponding sine profiles. Their canonical coefficients are $F_{j,r}=M\ell^2\omega^2N(k)(\overline E_\lambda:e)\widehat g_{j,r}/4$. The actual Hamiltonian uses these field smearings with the local c-number coefficients
$$
h_{j,c}(t)=\chi((t-t_j)/\tau)\cos(\omega_0(t-t_j)-\phi_j),\quad
h_{j,s}(t)=\chi((t-t_j)/\tau)\sin(\omega_0(t-t_j)-\phi_j).
\tag{S.6.1g.11}
$$
These reconstruct (S.6.1g.3) exactly. With $\Phi(F)=a^\dagger(F)+a(F)$, the actual driven Hamiltonian is $H(t)=H_F+\sum_{j,r}Z_jh_{j,r}(t)\Phi(F_{j,r})$, together with the stated background compensators. The smearings $F_{j,r}$ and $F_{j,r}/\sqrt{\omega}$ are square integrable. The creation/annihilation estimate makes the bounded-coefficient coupling infinitesimally form bounded relative to $H_F$, giving the self-adjoint semibounded source on its common free form domain. The fixed initial common static field is that of the four baseline sources; its fluctuations start in vacuum. Its known local coefficients $b_{j,r}$ are cancelled by the explicitly included local terms $-Z_jh_{j,r}(t)b_{j,r}$. There is no claim that an exact global static field was generated from empty space in finite local time.

Each party encodes its logical qubit as $|z\rangle\mapsto|z,z\rangle$. Party $A$ has shares at stations 1 and 3, and $B$ at 0 and 2. Prepare the encodings locally before $-50\tau$, distribute each distant share over distance $20R$ at speed $c/2$ in $40\tau$, and finish before the first pulse starts at $-\tau$. Synchronization and phase instructions are delivered causally earlier. The four pulse intervals $[10j\tau-\tau,10j\tau+\tau]$ are disjoint. After the final pulse ends at $31\tau$, return the distant shares in $40\tau$ and decode after $71\tau$. No intermediate logical $X$, heralding, adaptive postselection, reset or share redistribution occurs. This preparation is separable across $A:B$; only within-party encoding may be entangled.

For the actual finite list of controls set
$$
K=\sum_{j,r}\|F_{j,r}\|\|h_{j,r}\|_1/\hbar,\qquad
K_E=\sum_{j,r}\|\sqrt{\hbar\omega}F_{j,r}\|\|h_{j,r}\|_1/\hbar.
\tag{S.6.1g.12}
$$
Intermediate free-field energy is at most $K_E^2$. The integrated absolute mean drive power is bounded by $2K\sum_{j,r}\|F_{j,r}\|\|h'_{j,r}\|_1$, with additional background-compensation budget $\sum_{j,r}|b_{j,r}|\|h'_{j,r}\|_1$. Both are finite. The four rest energies $M_{\mathrm{bg}}c^2$, initial preparations, installed profiles, synchronization, finite-duration circuit Hamiltonians, causal carrier transport and retained final field/records are separately owned. These are reachable mean-resource bounds, not operator-norm bounds on the field. The certificate is single use; repetition needs fresh preparations or its own reset service.

One finite regime choice is
$$
R=10^6\max\{1\text{ metre},\ n\sqrt{\hbar G/c^3},\ 4GM_{\mathrm{bg}}/c^2\}.
$$
Increasing $R$ with $\ell/R$ fixed keeps the source masses finite while decreasing compactness and carrier frequency. This registers the weak-field/cutoff regime of the nominated linearized theory; it is not a nonlinear-gravity output-error estimate.

*Proof.* Commutation of the derivatives in (S.6.1g.4), with $\partial_0=c^{-1}\partial_t$, gives conservation. Integration by parts gives zero integrated modulation mass and dipole. The finite supremum in (S.6.1g.5) dominates every branch stress component, while the normalized baseline supplies its stated total mass. Temporal Fourier transformation of the real carrier gives both sidebands in (S.6.1g.6). Substitution of (S.6.1g.2), $\tau=R/c$ and $p=Rk$ into its squared norm gives (S.6.1g.7), including its mass conversion.

The local tidal-field coupling agrees with the conserved metric-source cross phase. Indeed the TT projector gives $C(\widehat k)=1-2\widehat k\cdot e^2\widehat k+(\widehat k\cdot e\widehat k)^2/2$. With $u=\Omega^2/c^2$, the metric and tidal propagator numerators satisfy
$$
\begin{aligned}
N_{\mathrm{metric}}&=\tfrac12(e:kk)^2-2u(k\cdot e^2k)+u^2,\\
N_{\mathrm{tidal}}&=k^4C(\widehat k),\\
N_{\mathrm{tidal}}-N_{\mathrm{metric}}
&=(k^2-u)[k^2+u-2(k\cdot e^2k)].
\end{aligned}
$$
Division by the retarded wave denominator leaves a polynomial contact distribution. Its pairing with the separated compact source supports vanishes, including differentiated phased profiles. Self-contact terms have $Z_j^2=I$ and are sector independent. The common baseline's local terms are cancelled in the actual Hamiltonian as stated. Thus no radiative-only or post hoc mean-phase substitution changes the compared process.

For the chosen transverse $e$, $C(\widehat p)\ge\cos^2\angle(p,e_x)$. On $|u|\le1/4$, both Fourier factors are at least $3/4$, $|p|\ge3n/4$ and $C\ge1/4$; the ball volume is greater than $1/16$, proving $I_n\ge n^3/512$. For $\delta(u)=|ne_x+u|-n-u_x$, rationalization gives $\delta\le|u|^2/n$ on $|u|\le n/2$, and globally $\delta\le2|u|$. Splitting the weighted integral bounds its numerator by $4nJ_4+580J_7/n^2$, hence the relative translation error by $A/n^2+D/n^5$. Four temporal integrations by parts bound the backward sideband by $C/n^8$. The largest translated stage has $10j\le30$, proving (S.6.1g.8). Spatial smoothness gives $|\widehat f(u)|\le\min(1,\|\Delta^3f\|_1/|u|^6)$, so all listed moments are finite. The elementary bound $\sqrt{x}\le x+1$ and (S.6.1g.9) give $\eta_n\le\delta_0$.

The four exact chronological field pulses have a Weyl displacement and a sign-independent self phase. In every logical sector their residual vector is at most $4e$. Each of six pair phases changes by at most $2ae+e^2$, giving $d_\phi$. For the prepared vacuum, write the exact and ideal isometries as $V|z\rangle=e^{i\phi_z}|z\rangle|v_z\rangle$ and $W|z\rangle=e^{i\phi_z^0}|z\rangle|0\rangle$. Sector orthogonality and the coherent-state overlap give
$$
\|V-W\|\le\sqrt{16e^2+d_\phi^2}.
$$
Tensoring a reference preserves this norm; pure-state trace distance and partial-trace contraction give (S.6.1g.10). With $a<1$ and $e\le10^{-6}$, squaring verifies its strict final bound. Proposition S.6.1b and Corollary S.6.1e(a) supply the stated negativity and class exclusion. The unrestricted seven-stage mediator-input bound of Proposition S.6.1f(c) is a separate sufficient theorem and is not asserted by this prepared-channel estimate.

The code identity $Z_{X_j}E_X=E_XZ_X$ intertwines each physical edge with its logical edge and keeps the code invariant. The specified boundary schedule is finite and timelike. During the stages, prescribed scalar controls and conserved commuting $Z_j$ labels make spacelike interaction densities commute by curvature microcausality. The causal continuum field, not an instantaneous common oscillator, is the actual process. Bounded chronological stage regions may contain the party's other share with identity action; the stronger all-pairs-timelike convention is not used.

Smooth spatial profiles make both constants in (S.6.1g.12) finite. Reference field states in each sector are coherent with displacement norm at most $K$ and energy norm at most $K_E$. Their field expectation bounds the integrated mean control power as stated, uniformly over logical inputs. The known background terms, finite circuits and transports add their explicit finite services. No infinite-energy, zero-reset-cost or free static-field preparation assumption is inferred. $\square$

## S.7 Conditional Gravitational Phase and Dephasing Mechanisms

A deterministic time-dilation gradient produces a coherent relative phase. Decay of off-diagonal density-matrix elements requires an additional phase-ensemble average, unresolved source fluctuation, source trace, or saturated chronometric ND-RID response law. These branches are distinguished below.

Section S.3 establishes the conditional proper-time difference $\Delta\tau_d=KP_{\mathrm{context}}$. The following subsections first derive the associated coherent phase and then state the additional hypotheses under which that phase produces dephasing and limits effective CC capability.

### S.7.1 Phase Decoherence from Time Dilation Gradients

Consider a quantum system with energy eigenstates $|i\rangle$ having energies $E_i$, positioned in the gravitational field of a high-CC aggregate. Different spatial locations within the system experience different gravitational potentials due to the gradient:
$$
\nabla\Phi(r) = g_{CC}(r) = \frac{4\pi G}{3} (1 + 3w_c) \frac{u_{\mathrm{context}}}{c^2} r \hat{r}
\tag{S.46}
$$

For a quantum system with spatial extent $L_q$, the potential difference is $\Delta\Phi \approx |\nabla\Phi| L_q$ (Equation S.16). This creates differential proper time rates at different locations within the system:
$$
\frac{d\tau}{dt}\bigg|_{r} = 1 + \frac{\Phi(r)}{c^2}, \qquad \frac{d\tau}{dt}\bigg|_{r+L_q} = 1 + \frac{\Phi(r+L_q)}{c^2}
\tag{S.47}
$$

The difference in proper time rates is:
$$
\Delta\left(\frac{d\tau}{dt}\right) = \frac{\Delta\Phi}{c^2}
\tag{S.48}
$$

Over interaction time $\tau_c$, this produces differential proper time accumulation:
$$
\Delta\tau_{\mathrm{diff}} = \frac{\Delta\Phi}{c^2} \tau_c
\tag{S.49}
$$

### S.7.2 Decoherence of Superposition States

For a quantum superposition state:
$$
|\psi\rangle = \sum_i c_i |i\rangle
\tag{S.50}
$$

the phase evolution in the gravitational field differs for each energy eigenstate. At spatial location $r$, the phase accumulation for state $|i\rangle$ is:
$$
\phi_i(r) = -\frac{E_i}{\hbar} \int_0^{\tau_c} \left[1 + \frac{\Phi(r,t)}{c^2}\right] dt \approx -\frac{E_i \tau_c}{\hbar} - \frac{E_i}{\hbar c^2} \int_0^{\tau_c} \Phi(r,t) dt
\tag{S.51}
$$

For quasi-static gravitational field, $\Phi(r,t) \approx \Phi(r)$:
$$
\phi_i(r) \approx -\frac{E_i \tau_c}{\hbar}\left[1 + \frac{\Phi(r)}{c^2}\right]
\tag{S.52}
$$

The differential phase accumulation between two energy eigenstates $|i\rangle$ and $|j\rangle$ across the spatial extent $L_q$ is:
$$
\Delta\phi_{ij} = \big[\phi_i(r+L_q)-\phi_j(r+L_q)\big]-\big[\phi_i(r)-\phi_j(r)\big]
= -\frac{(E_i - E_j)\Delta\Phi \tau_c}{\hbar c^2}
\tag{S.53}
$$

This isolates the gravitational contribution to the relative phase between $|i\rangle$ and $|j\rangle$ across the system's extent. For energy splitting $\Delta E_{ij} = E_i - E_j$:
$$
\Delta\phi_{ij}^{(grav)} = -\frac{\Delta E_{ij} \Delta\tau_{\mathrm{diff}}}{\hbar} = -\frac{\Delta E_{ij}}{\hbar} \frac{\Delta\Phi \tau_c}{c^2}
\tag{S.54}
$$

Substituting Equation S.18:
$$
\Delta\phi_{ij}^{(grav)} = -\frac{\Delta E_{ij}}{\hbar} K P_{\mathrm{context}}
\tag{S.55}
$$

### <a id="s73-dephasing-rate-on-the-phase-uncertainty-environmental-tracing-branch"></a>S.7.3 Dephasing Rate on the Phase-Uncertainty / Environmental-Tracing Branch

A deterministic, fully known gravitational phase shift $|\Delta\phi_{ij}^{(grav)}| \sim 1$ is a unitary phase rotation of the superposition $|i\rangle + |j\rangle$ and does not by itself suppress coherence: the off-diagonal density matrix elements rotate but do not decay. Genuine dephasing occurs only when the retained finite-resolution state does not resolve the relative chronometric phase. This happens on branches with an additional ingredient — either (a) the gravitational potential $\Phi$ (or equivalently $\Delta\tau_d$) fluctuates with variance $\mathrm{Var}(\Delta\phi)$ across unresolved degrees of freedom, (b) the spatial wavepacket components experience different gravitational potentials and become entangled with position degrees of freedom that are then traced out, (c) the gravitational substrate couples to environmental degrees of freedom whose state is traced out per Zurek-style decoherence (Zurek, 1991, 2003), or (d) the saturated chronometric ND-RID branch identifies unresolved proper-time phase slip with the minimal Markovian dephasing contraction rate.

For a phase-averaging representation of branches (a)–(c), let $X_{ij}(t)$ be the unresolved real relative phase. The coherence multiplier is its characteristic function $\mathbb E[e^{-iX_{ij}(t)}]$. If $X_{ij}(\tau_c)$ is Gaussian with variance $v_{ij}(\tau_c)$ and $\tau_c>0$, its magnitude is $e^{-v_{ij}(\tau_c)/2}$, regardless of its mean. The effective attenuation rate over that interval is
$$
\Gamma_{\mathrm{var}}^{(ij)}(\tau_c)
:=-\frac1{\tau_c}\log\left|\mathbb E[e^{-iX_{ij}(\tau_c)}]\right|
=\frac{v_{ij}(\tau_c)}{2\tau_c}.
\tag{S.56}
$$
This is not automatically a constant dephasing rate. An exponential envelope $e^{-\Gamma t}$ requires the additional law $v_{ij}(t)=2\Gamma t$ on the operating window. For $\Gamma>0$, its coherence time is $\tau_{\mathrm{deph}}=1/\Gamma$; for $\Gamma=0$, this branch has no attenuation. A Markovian channel interpretation also requires its channel-composition certificate. General non-Gaussian phase distributions and general environment traces are not determined by phase variance alone.

On the saturated chronometric ND-RID branch (d), define the chronometric phase-slip rate by
$$
\omega_{\mathrm{ch}}^{(ij)}
:=
\frac{|\Delta\phi_{ij}^{(grav)}|}{\tau_c}.
$$
The branch postulate is the minimal Markovian identification
$$
\Gamma_{\mathrm{ch}}^{(ij)}:=\omega_{\mathrm{ch}}^{(ij)}.
$$
Using Equation S.54 gives
$$
\boxed{
\Gamma_{\mathrm{ch}}^{(ij)}
=
\frac{|\Delta E_{ij}|}{\hbar}\frac{|\Delta\Phi|}{c^2}
=
\frac{|\Delta E_{ij}|}{\hbar}K_{\mathrm{eff}}P_{\mathrm{context}}
}
\tag{S.57}
$$
where the last equality uses $\Delta\tau_d/\tau_c=\Delta\Phi/c^2=K_{\mathrm{eff}}P_{\mathrm{context}}$ from Equations S.18-S.21. The deterministic tracked-phase branch has $\Gamma_{\mathrm{grav}}^{(ij)}=0$; the variance branch has $\Gamma_{\mathrm{grav}}^{(ij)}=\Gamma_{\mathrm{var}}^{(ij)}$; the saturated chronometric ND-RID branch has $\Gamma_{\mathrm{grav}}^{(ij)}=\Gamma_{\mathrm{ch}}^{(ij)}$.

<a id="theorem-s73a-chronometric-dephasing-branch-and-clock-gap-scaling"></a>**Theorem S.7.3a (Chronometric Dephasing Branch and Clock-Gap Scaling).** On the saturated chronometric ND-RID branch, register one stationary proper-time geometry over $\tau_c>0$ and constant transition gaps. Define its dimensionless mismatch
$$
q_\tau:=\frac{|\Delta\tau_{\mathrm{diff}}|}{\tau_c}\ge0.
$$
The chronometric identification gives
$$
\Gamma_{\mathrm{ch}}^{(ij)}
=\frac{|\Delta E_{ij}|}{\hbar}q_\tau.
$$
For $|\Delta E_{ij}|>0$,
$$
\frac{\hbar\Gamma_{\mathrm{ch}}^{(ij)}}{|\Delta E_{ij}|}=q_\tau.
$$
In the static weak-field comparison,
$$
q_\tau=\frac{|\Delta\Phi|}{c^2}
+O\!\left(\frac{\Phi_0^2+\Phi_1^2}{c^4}\right).
$$
The leading potential identity is exact only within the retained weak-field model.

If two transitions share this geometry, both gaps are nonzero, and $q_\tau>0$, then
$$
\frac{\Gamma_{\mathrm{ch}}^{(ij)}}{\Gamma_{\mathrm{ch}}^{(kl)}}
=\frac{|\Delta E_{ij}|}{|\Delta E_{kl}|}.
$$
If $q_\tau=0$, all these rates vanish and the rate ratio is undefined. A zero-gap transition also has zero rate and cannot be used in a normalized denominator.

*Proof.* The coherent phase difference is
$$
\Delta\phi_{ij}=-\frac{\Delta E_{ij}}{\hbar}\Delta\tau_{\mathrm{diff}}.
$$
Dividing its magnitude by $\tau_c$ and imposing the saturated branch law gives $\Gamma_{\mathrm{ch}}^{(ij)}=|\Delta E_{ij}|q_\tau/\hbar$. Dividing by a nonzero gap gives the normalized invariant. The weak-field clock expansion gives the displayed potential comparison. On the positive-mismatch, nonzero-gap branch, the common factor $q_\tau/\hbar$ cancels exactly between two rates. ∎

If a protocol changes the internal gap while retaining the same nonzero proper-time geometry and branch mass-density difference, this conditional linear gap law differs from a model whose rate depends only on that mass-density difference. Those common-geometry and source conditions require independent experimental control.

<a id="theorem-s73b-classification-of-population-preserving-phase-and-dephasing-channels"></a>**Theorem S.7.3b (Classification of Population-Preserving Phase and Dephasing Channels).** Let a system have finite dimension $n\ge2$ and orthonormal energy eigenbasis $\{|i\rangle\}$ with energies $E_i$. Write $\langle a,b\rangle:=a^\dagger b$,
$$
\mathfrak E_n:=\{M\in\mathbb C^{n\times n}:M\succeq0,\ M_{ii}=1\},
\qquad
\Phi_M(\rho):=M\circ\rho,
\tag{S.7.3b.1}
$$
where $\circ$ is the entrywise product in the energy basis.

(a) *(Channel form.)* A linear map $\Phi$ is CPTP and satisfies $\Phi(|i\rangle\langle i|)=|i\rangle\langle i|$ for every $i$ exactly when $\Phi=\Phi_M$ for a unique $M\in\mathfrak E_n$, namely $M_{ij}=\langle i|\Phi(|i\rangle\langle j|)|j\rangle$.

(b) *(Environmental trace.)* For every environment state $\sigma_E$ and unitaries $V_i$ on $E$, the energy-diagonal coupling $U=\sum_i|i\rangle\langle i|\otimes V_i$ gives
$$
\operatorname{tr}_E\!\left[U(\rho\otimes\sigma_E)U^\dagger\right]=\Phi_M(\rho),
\qquad
M_{ij}=\operatorname{tr}(V_i\sigma_EV_j^\dagger).
\tag{S.7.3b.2}
$$
Conversely, every $M\in\mathfrak E_n$ of rank $r$ is realized in this way with $\dim E=r$ and a pure $\sigma_E$.

(c) *(Deterministic phase.)* $\Phi_M$ is a unitary channel exactly when $M=vv^\dagger$ with $|v_i|=1$, equivalently when $|M_{ij}|=1$ for all $i,j$. Every other $\Phi_M$ has a pair $i\ne j$ with $|M_{ij}|<1$ and strictly lowers $|\rho_{ij}|$ for every state with $\rho_{ij}\ne0$. In particular, the deterministic gravitational phase $v_i=e^{-iE_i\Delta\tau_{\mathrm{diff}}/\hbar}$ of Equation (S.53) preserves every coherence modulus.

(d) *(Stochastic phase.)* $\Phi_M=\mathbb E[U_X(\cdot)U_X^\dagger]$ for a random diagonal unitary $U_X=\sum_ie^{-iX_i}|i\rangle\langle i|$ exactly when $M$ lies in the convex hull of $\{vv^\dagger:|v_i|=1\}$; then $M_{ij}=\mathbb E[e^{-i(X_i-X_j)}]$, and finite mixtures suffice. For $n\le3$ every $M\in\mathfrak E_n$ has this form. For $n=4$, the Gram matrix
$$
M_4:=\bigl(\langle w_i,w_j\rangle\bigr)_{i,j=1}^4,
\qquad
w_1=\begin{pmatrix}1\\0\end{pmatrix},\
w_2=\begin{pmatrix}0\\1\end{pmatrix},\
w_3=\frac1{\sqrt2}\begin{pmatrix}1\\1\end{pmatrix},\
w_4=\frac1{\sqrt2}\begin{pmatrix}1\\i\end{pmatrix},
\tag{S.7.3b.3}
$$
lies in $\mathfrak E_4$, has rank two, and is not such a mixture; hence $\Phi_{M_4}$ is not a mixture of unitary channels, and by (b) it is an environmental trace with a qubit environment. For every $n\ge4$, $M_4\oplus I_{n-4}$ lies in $\mathfrak E_n$ outside the stochastic-phase hull.

(e) *(Markov semigroups.)* Let $\omega_i\in\mathbb R$ and let $\Gamma$ be real symmetric with zero diagonal. The family $M(t)_{ij}=e^{-it(\omega_i-\omega_j)-t\Gamma_{ij}}$ lies in $\mathfrak E_n$ for every $t\ge0$ exactly when $\Gamma$ is conditionally negative semidefinite:
$$
\sum_{i,j}\bar x_ix_j\Gamma_{ij}\le0
\qquad\text{whenever}\qquad
\sum_ix_i=0.
\tag{S.7.3b.4}
$$
Then $\Phi_{M(t+s)}=\Phi_{M(t)}\circ\Phi_{M(s)}$, so $t\mapsto\Phi_{M(t)}$ is a CPTP semigroup with pairwise coherence decay rates $\Gamma_{ij}$.

(f) *(Gap laws and the chronometric branch.)* For $\kappa>0$ and $\beta\ge0$, the gap law $\Gamma_{ij}=\kappa|E_i-E_j|^\beta$ for $i\ne j$, with $\Gamma_{ij}=\kappa$ for all $i\ne j$ when $\beta=0$, satisfies (S.7.3b.4) for every finite spectrum exactly when $0\le\beta\le2$; for $\beta>2$ the spectrum $\{0,\epsilon,2\epsilon\}$ with $\epsilon>0$ violates it. The saturated chronometric rates of Theorem S.7.3a, $\Gamma_{ij}=q_\tau|E_i-E_j|/\hbar$, are the case $\beta=1$ with $\kappa=q_\tau/\hbar$. For every $n$ and spectrum they are realized by the stochastic phase $X_i=E_iY_t/\hbar$, where the proper-time slip $Y_t$ has the centered Cauchy law of scale $q_\tau t$ (the point mass at $0$ when $q_\tau t=0$):
$$
\mathbb E\!\left[e^{-i(E_i-E_j)Y_t/\hbar}\right]
=e^{-q_\tau t|E_i-E_j|/\hbar}.
\tag{S.7.3b.5}
$$
A centered Gaussian slip of variance $s_t^2$ gives instead $M_{ij}=e^{-s_t^2(E_i-E_j)^2/(2\hbar^2)}$, the quadratic gap law of the variance branch (S.56).

*Proof.* (a) Let $\{K_k\}$ be Kraus operators of $\Phi$. Each $K_k|i\rangle\langle i|K_k^\dagger$ is positive and bounded above by the rank-one projector $|i\rangle\langle i|$, so its range lies in $\operatorname{span}\{|i\rangle\}$ and $K_k|i\rangle=d_{k,i}|i\rangle$. Every Kraus operator is therefore diagonal, and
$$
\Phi(\rho)_{ij}=\sum_kd_{k,i}\bar d_{k,j}\rho_{ij},
\qquad
M:=\sum_kd_kd_k^\dagger\succeq0,
$$
while trace preservation gives $M_{ii}=\sum_k|d_{k,i}|^2=1$. Conversely, a spectral decomposition $M=\sum_kd_kd_k^\dagger$ supplies diagonal Kraus operators $\operatorname{diag}(d_k)$ with $\sum_k\operatorname{diag}(|d_k|^2)=I$, and $\Phi_M$ fixes each $|i\rangle\langle i|$. Evaluation on $|i\rangle\langle j|$ gives uniqueness.

(b) Expansion gives $U(\rho\otimes\sigma_E)U^\dagger=\sum_{i,j}\rho_{ij}|i\rangle\langle j|\otimes V_i\sigma_EV_j^\dagger$, and the partial trace gives (S.7.3b.2). The matrix $M_{ij}=\operatorname{tr}[(V_j\sigma_E^{1/2})^\dagger(V_i\sigma_E^{1/2})]$ is a Hilbert–Schmidt Gram matrix with $M_{ii}=\operatorname{tr}\sigma_E=1$, so $M\in\mathfrak E_n$. For the converse, factor $M=W^\dagger W$ with $W\in\mathbb C^{r\times n}$ of rank $r$ and unit columns $w_i$, put $u_i:=\bar w_i$, so that $\langle u_j,u_i\rangle=M_{ij}$, fix a unit vector $\psi\in\mathbb C^r$, choose unitaries with $V_i\psi=u_i$, and take $\sigma_E=|\psi\rangle\langle\psi|$.

(c) A unitary channel fixing each $|i\rangle\langle i|$ has $U|i\rangle\propto|i\rangle$, so $U=\operatorname{diag}(v)$ with $|v_i|=1$ and $M=vv^\dagger$; conversely $vv^\dagger$ gives that unitary and $|v_iv_j^*|=1$. If $|M_{ij}|=1$ for all $i,j$, factor $M=W^\dagger W$ with unit columns; equality in the Cauchy–Schwarz inequality makes every column a unimodular multiple of $w_1$, so $M$ has rank one and equals $vv^\dagger$ with $|v_i|=1$. Positivity of each $2\times2$ principal minor gives $|M_{ij}|\le1$, and $|(M\circ\rho)_{ij}|=|M_{ij}||\rho_{ij}|$ gives the strict decrease.

(d) A random diagonal unitary gives $\Phi_M$ with $M=\mathbb E[vv^\dagger]$, $v_i=e^{-iX_i}$; this lies in the convex hull of the compact set $\{vv^\dagger:|v_i|=1\}$, which is compact in finite dimension, and Carathéodory's theorem reduces it to a finite mixture. A finite mixture is a finitely supported random phase vector. Let $M\in\mathfrak E_n$ be an extreme point and factor $M=W^\dagger W$ as in (b). If the projectors $w_iw_i^\dagger$ did not span the real space of $r\times r$ Hermitian matrices, a nonzero Hermitian $K$ would satisfy $w_i^\dagger Kw_i=0$ for all $i$; for small $\epsilon>0$ the matrices $W^\dagger(I\pm\epsilon K)W$ would lie in $\mathfrak E_n$, average to $M$, and differ from $M$ because $W$ has rank $r$. Hence $n\ge r^2$. For $n\le3$ every extreme point has rank one and equals $vv^\dagger$ with $|v_i|=1$, and the compact convex set $\mathfrak E_n$ is the convex hull of its extreme points. For (S.7.3b.3), the projectors $w_iw_i^\dagger$ generate $I$, $\sigma_z$, $\sigma_x$ and $\sigma_y$, so they span the Hermitian $2\times2$ matrices. If $M_4=\lambda A+(1-\lambda)B$ with $A,B\in\mathfrak E_4$ and $0<\lambda<1$, then $0\le\lambda A\le M_4$ puts the range of $A$ inside the range of $W^\dagger$, so $A=W^\dagger HW$ with $H\succeq0$. The unit diagonal gives $\operatorname{tr}[(H-I)w_iw_i^\dagger]=0$ for every $i$, hence $H=I$ and $A=M_4$. Thus $M_4$ is extreme, and a decomposition into rank-one unimodular matrices would consist of $M_4$ itself, contradicting rank two. If $\Phi_{M_4}=\mathbb E[U(\cdot)U^\dagger]$ for a random unitary $U$, then $\mathbb E[|\langle j|U|i\rangle|^2]=0$ for $j\ne i$, so $U$ is almost surely diagonal and $\Phi_{M_4}$ would be a stochastic-phase channel. A decomposition of $M_4\oplus I_{n-4}$ would restrict on the first four indices to one of $M_4$.

(e) Conjugation by $\operatorname{diag}(e^{-it\omega_i})$ preserves $\mathfrak E_n$, so only the entrywise exponential $e^{-t\Gamma}$ matters. If $\Gamma$ satisfies (S.7.3b.4), put $K_{ij}:=\Gamma_{i1}+\Gamma_{1j}-\Gamma_{ij}$. For $y\in\mathbb C^n$ and $s=\sum_jy_j$, the vector $x=y-se_1$ has zero sum and $y^\dagger Ky=-x^\dagger\Gamma x\ge0$, so $K\succeq0$. The Schur product theorem makes $e^{\circ tK}=\sum_{m\ge0}t^mK^{\circ m}/m!$ positive, and
$$
e^{-t\Gamma_{ij}}=e^{-t\Gamma_{i1}}\bigl(e^{\circ tK}\bigr)_{ij}e^{-t\Gamma_{1j}}
$$
exhibits $e^{-t\Gamma}$ as a real diagonal congruence of that positive matrix, with unit diagonal. Conversely, if $e^{-t\Gamma}\succeq0$ for all $t>0$ and $\sum_ix_i=0$, then $x^\dagger(J-e^{-t\Gamma})x\le0$ for the all-ones matrix $J$; dividing by $t$ and letting $t\downarrow0$ gives (S.7.3b.4). The semigroup law is $M(t)\circ M(s)=M(t+s)$.

(f) For $0<\beta<2$, the substitution $u=|x|s$ gives
$$
|x|^\beta=c_\beta^{-1}\int_0^\infty\bigl(1-\cos(xs)\bigr)s^{-1-\beta}\,ds,
\qquad
c_\beta:=\int_0^\infty(1-\cos u)u^{-1-\beta}\,du\in(0,\infty).
$$
For each $s$, the matrix $\cos((E_i-E_j)s)=\operatorname{Re}\bigl(e^{iE_is}e^{-iE_js}\bigr)$ is positive and $J$ vanishes on zero-sum vectors, so $1-\cos((E_i-E_j)s)$ satisfies (S.7.3b.4); integration against the positive weight preserves it. For $\beta=2$, zero-sum vectors give $\sum_{i,j}\bar x_ix_j(E_i-E_j)^2=-2|\sum_ix_iE_i|^2$. For $\beta=0$, they give $\kappa\sum_{i\ne j}\bar x_ix_j=-\kappa\sum_i|x_i|^2$. For $\beta>2$, the spectrum $\{0,\epsilon,2\epsilon\}$ and $x=(1,-2,1)$ give the value $2\kappa\epsilon^\beta(2^\beta-4)>0$. Equation (S.7.3b.5) is the Cauchy characteristic function $\mathbb E[e^{iuY_t}]=e^{-q_\tau t|u|}$ at $u=-(E_i-E_j)/\hbar$, and the Gaussian formula is the Gaussian characteristic function; by (d) both define stochastic-phase channels. ∎

<a id="proposition-s73b1-conditional-oscillator-mediator-exact-coherence-and-static-nonidentification"></a>**Proposition S.7.3b.1 (Conditional Oscillator Mediator, Exact Coherence and Static Nonidentification).** Let a finite-dimensional source have bounded mutually commuting Hermitian operators \(H_a\), all commuting with \(H_{\mathrm m}\). Supply finitely many bosonic modes with \(\omega_k>0\), real dimensionless couplings \(g_{ka}\), and the full untruncated Hamiltonian
$$
J_k=\sum_a g_{ka}H_a,\qquad
H=H_{\mathrm m}+\sum_k\left[
\hbar\omega_k b_k^\dagger b_k+J_k(b_k+b_k^\dagger)\right].
\tag{S.7.3b.1.1}
$$
The conditional displacement defines a self-adjoint, lower-bounded Hamiltonian on its displaced oscillator domain. Completing the square gives the static source operator
$$
H_{\mathrm{eff}}=H_{\mathrm m}-\frac12\sum_{a,b}K_{ab}H_aH_b,
\qquad
K_{ab}=2\sum_k\frac{g_{ka}g_{kb}}{\hbar\omega_k}.
\tag{S.7.3b.1.2}
$$
The matrix \(K\) is positive semidefinite and has units of inverse energy, with
$$
|K_{ab}|^2\le K_{aa}K_{bb}.
\tag{S.7.3b.1.3}
$$
The diagonal source-energy corrections are retained. Removing them requires explicit local counterterms.

In a common eigenbasis write \(H_{\mathrm m}|n\rangle=E_n|n\rangle\) and \(J_k|n\rangle=j_{kn}|n\rangle\). Start the source independently of thermal mode states with inverse temperatures \(\beta_k>0\). Its exact reduced matrix elements are
$$
\begin{aligned}
\rho_{nm}(t)
={}&\rho_{nm}(0)e^{-i(E_n-E_m)t/\hbar}\\
&{}\times\exp\!\left[
i\sum_k\frac{(j_{kn}^2-j_{km}^2)(\omega_kt-\sin\omega_kt)}
{\hbar^2\omega_k^2}\right]\\
&{}\times\exp\!\left[
-\sum_k\frac{(j_{kn}-j_{km})^2(1-\cos\omega_kt)}
{\hbar^2\omega_k^2}
\coth\!\left(\frac{\beta_k\hbar\omega_k}{2}\right)\right].
\end{aligned}
\tag{S.7.3b.1.4}
$$
This is one completely positive multilevel channel obtained by partial trace of the stated joint unitary. At a common full period \(T\), where every coupled \(\omega_kT\) is an integer multiple of \(2\pi\), all conditional displacements vanish, the modes return, and the exact source unitary is \(e^{-iH_{\mathrm{eff}}T/\hbar}\), independently of the initial mode state. Incommensurate frequencies need not admit such a common period.

*Proof.* Since the source operators commute, diagonalize them together and displace each oscillator by \(j_{kn}/(\hbar\omega_k)\) in source block \(n\). Equivalently,
$$
H=H_{\mathrm m}+\sum_k\hbar\omega_k
\left(b_k^\dagger+\frac{J_k}{\hbar\omega_k}\right)
\left(b_k+\frac{J_k}{\hbar\omega_k}\right)
-\sum_k\frac{J_k^2}{\hbar\omega_k}.
$$
The blockwise displacement is unitary; the final bounded source correction gives lower boundedness and the displaced oscillator domain gives self-adjointness. Expanding \(J_k^2\) proves (S.7.3b.1.2). For real \(x_a\),
$$
\sum_{a,b}x_aK_{ab}x_b
=2\sum_k\frac{(\sum_ag_{ka}x_a)^2}{\hbar\omega_k}\ge0.
$$
The two-by-two principal minors give (S.7.3b.1.3).

For one source eigenvalue, forced-oscillator evolution factors into a free rotation, displacement proportional to \(j(e^{-i\omega t}-1)/(\hbar\omega)\), and phase \(j^2(\omega t-\sin\omega t)/(\hbar^2\omega^2)\). The thermal displacement characteristic function is
$$
\operatorname{Tr}(\tau_\beta D(\alpha))
=\exp\!\left[-\frac{|\alpha|^2}{2}
\coth\!\left(\frac{\beta\hbar\omega}{2}\right)\right].
$$
Taking the conditional overlap gives (S.7.3b.1.4); independent modes multiply. At a common full period both the displacement and free oscillator rotation return to identity. The remaining source phase is exactly that of (S.7.3b.1.2). ∎

The static interaction does not determine this transient coherence. For any \(s>0\), replace \(\omega_k\) by \(s\omega_k\) and \(g_{ka}\) by \(\sqrt{s}\,g_{ka}\). Every \(K_{ab}\) is unchanged, but the vacuum attenuation becomes
$$
\sum_k\frac{(j_{kn}-j_{km})^2[1-\cos(s\omega_kt)]}
{s\hbar^2\omega_k^2},
\tag{S.7.3b.1.5}
$$
which generally changes at fixed time. The static linear-in-time phase is unchanged while the oscillatory phase and recurrence times change; finite-temperature factors also change.

This construction supplies an autonomous pure-dephasing mediator with conserved total Hamiltonian and separately conserved source energies. For two sources the cross term is \(-K_{AB}H_AH_B\); matching \(K_{AB}\) to \(G/(c^4r)\) is an independently supplied spatial calibration. The oscillator input and this matching are not a derivation of the gravitational source of Theorem S.7.3c or of a spin-2 continuum. The reduced-coherence loss and its recurrences require no reset or thermodynamic-production event.

<a id="proposition-s73b2-finite-rate-phase-updates-and-a-controlled-linear-gap-band"></a>**Proposition S.7.3b.2 (Finite-Rate Phase Updates and a Controlled Linear-Gap Band).** Let $H_S$ have a finite spectrum and let $\omega=(E_i-E_j)/\hbar$. A real phase-time mark $Y$ defines the population-preserving channel
$$
\Lambda(\rho)=\mathbb E[e^{-iYH_S/\hbar}\rho e^{iYH_S/\hbar}],\qquad
\chi(\omega)=\mathbb E e^{-i\omega Y}.
$$
Every complete energy population is retained. One explicit collision produces this mark law: prepare a fresh independent ancilla in $\rho_C$, apply the registered interaction $H_{\rm int}=-\lambda H_C\otimes H_S$ for duration $s$, and account for its known local phases. The resulting mark is $Y=-\lambda sE_C$, where $E_C$ has the spectral law of $H_C$ in $\rho_C$. Replacement or resetting of the ancilla, its preparation, and any inter-event correlations belong to that physical source's separate work, heat and storage account.

(a) **Fixed and Poisson schedules.** Exactly $n$ independent marks multiply a coherence by $\chi(\omega)^n$. On a fixed schedule with spacing $\Delta_c>0$, at $t=n\Delta_c$ and where $\chi\ne0$, the attenuation rate is
$$
\Gamma_{\rm fixed}(\omega)=-\Delta_c^{-1}\log|\chi(\omega)|.
$$
If $\operatorname{Var}Y<\infty$, its quadratic coefficient is $\operatorname{Var}(Y)/(2\Delta_c)$. In contrast, for an independent Poisson count $N_t$ of rate $\nu>0$,
$$
\mathcal E_t=e^{-\nu t}\sum_{n=0}^\infty\frac{(\nu t)^n}{n!}\Lambda^n
=e^{\nu t(\Lambda-I)},\qquad
W(\omega,t)=e^{\nu t[\chi(\omega)-1]},
$$
$$
\Gamma(\omega)=\nu[1-\operatorname{Re}\chi(\omega)],\qquad
0\le\Gamma(\omega)\le2\nu.
$$
These are exact channel and semigroup identities. If $\mathbb EY^2<\infty$, then
$$
\Gamma(\omega)=K\omega^2+o(\omega^2),\quad
K=\frac\nu2\mathbb EY^2,\quad
q_{\rm mean}=\nu\mathbb EY,\quad
K\ge\frac{q_{\rm mean}^2}{2\nu}.
$$
The raw second moment occurs because event-count fluctuations remain even for identical marks. Removing a deterministic average Hamiltonian changes only the phase, whereas removing the mean mark event by event requires an event-resolved control.

*Proof.* Condition on $N_t$ and sum its generating function to obtain the displayed convex mixture of CPTP channels and its multiplier. The bounds follow from $-1\le\operatorname{Re}\chi\le1$. For the expansion use $(1-\cos\omega Y)/\omega^2\to Y^2/2$, dominated by $Y^2/2$; the mean and variance of a compound Poisson sum give the same coefficient. Jensen's inequality gives $\mathbb EY^2\ge(\mathbb EY)^2$. For fixed $n$, expand $|\chi(\omega)|$ instead, which leaves the centered variance. The instantaneous-event description is a channel model; a finite-duration physical pulse source must supply its nonoverlap or controlled coarse-time realization and its retained event records. $\square$

(b) **The finite-rate boundary of an exact linear law.** A fixed finite-$\nu$ model with $\mathbb EY^2<\infty$ cannot have $\Gamma(\omega)=q|\omega|$, $q>0$, on a neighborhood of zero, because its small-gap rate is quadratic. No fixed finite-$\nu$ model, with or without a finite second moment, has that linear law at all real gaps, because $\Gamma\le2\nu$. The Cauchy realization in Theorem S.7.3b(f) instead has symmetric jump measure
$$
\mu(dy)=\frac{q}{\pi y^2}\,dy,\qquad y\ne0,
$$
and attenuation exponent
$$
\int_{\mathbb R}(1-\cos\omega y)\mu(dy)=q|\omega|.
$$
Indeed substitution gives $2q|\omega|/\pi$ times $\int_0^\infty(1-\cos u)u^{-2}du$; integration by parts reduces the integral to $\int_0^\infty\sin u/u\,du=\pi/2$. Exponential regularization evaluates the latter as $\arctan(1/\eta)$ before $\eta\downarrow0$. This source has infinite small-jump activity and Cauchy tails; its phase-time variable has neither finite variance nor finite absolute first moment. A location drift is not its ordinary expectation, and a signed phase-time slip is not a monotone positive proper-time clock.

(c) **Finite-rate approximation on a specified band.** Choose $0<\ell<R<\infty$ and truncate the jump measure to $\ell\le|y|\le R$. Its rate, normalized mark law and attenuation are
$$
\nu_{\ell,R}=\frac{2q}{\pi}\left(\frac1\ell-\frac1R\right),\qquad
\Pr(dY)=\nu_{\ell,R}^{-1}\frac{q}{\pi y^2}\mathbf1_{\{\ell\le|y|\le R\}}dy,
$$
$$
\Gamma_{\ell,R}(\omega)=\frac{2q}{\pi}\int_\ell^R\frac{1-\cos(\omega y)}{y^2}dy.
$$
The resulting compound-Poisson channel is CPTP and satisfies, for every real gap,
$$
0\le q|\omega|-\Gamma_{\ell,R}(\omega)
\le\frac{q\omega^2\ell}{\pi}+\frac{4q}{\pi R}.
$$
For a prescribed band $0<\omega_{\min}\le|\omega|\le\omega_{\max}$, relative error at most $\eta>0$ follows from
$$
\ell\le\frac{\pi\eta}{2\omega_{\max}},\qquad
R\ge\frac8{\pi\eta\omega_{\min}},\qquad \ell<R.
$$
At genuinely small gaps this same finite model has
$$
\Gamma_{\ell,R}(\omega)=\frac{q(R-\ell)}{\pi}\omega^2+O(\omega^4),
$$
and at arbitrary gaps it remains bounded by $2\nu_{\ell,R}$.

*Proof.* The omitted intervals in the nonnegative full integral are positive. On $0<y<\ell$ use $1-\cos(\omega y)\le\omega^2y^2/2$ and on $y>R$ use $1-\cos(\omega y)\le2$. Their integrals give the two stated errors. Divide by $q|\omega|$ and use the band endpoints for the sufficient choices. Taylor expansion on the bounded mark interval gives the small-gap coefficient. For a finite mark alphabet, partition the two compact mark intervals into finitely many bins, move each bin's positive measure to a representative, and preserve symmetry. Uniform continuity of $1-\cos(\omega y)$ on the compact band and mark intervals proves uniform convergence of these positive finite sums. Thus a finite classical phase channel approximates the band with a separately chosen finite alphabet. $\square$

If each completed event separately has a certified mean total entropy-production floor $k_B\epsilon$, with $\epsilon>0$ and an additive complete ledger, then $\sigma\ge\nu\epsilon$, where $\sigma$ is entropy-production rate in units of $k_B$. Part(a) gives the conditional relations $\Gamma\le2\sigma/\epsilon$ and $\sigma K\ge\epsilon q_{\rm mean}^2/2$. The event floor and the physical mark law are independent premises; a reset-heat inequality is a different ledger. The band construction supplies explicit channels and approximation errors. Its signed marks, pulse realization, source costs and any calibration of $q$ to the geometric mismatch are properties to specify for the chosen physical source before comparing dephasing data.

<a id="theorem-s73c-gravitational-phase-ensemble-from-a-static-surface-fluid-source"></a>**Theorem S.7.3c (Gravitational Phase Ensemble from a Static Surface-Fluid Source).** Work in the following registered background/test theory. The background obeys the classical Einstein equation with an ideal timelike spherical surface fluid and vacuum on both sides. A finite quantum test spin, proper-time clocks, null test signals, supports, magnetic controls and record services obey their stated equations on that geometry. Their finite energy and work records are retained, while their stress has zero backreaction coupling in the background equation. This is the source class of the theorem: its exact identities refer to that background/test theory. A finite-backreaction or finite-thickness source extension requires its own error record.

Fix $G,c,\hbar,R,r_f>0$ with $r_f>R$, two distinct numbers $a_0,a_1\in(1/5,1)$ and $p\in(0,1)$. For $j\in\{0,1\}$ define
$$
r_{g,j}=R(1-a_j^2),\qquad M_j=\frac{c^2r_{g,j}}{2G},\qquad
f_j(r)=1-\frac{r_{g,j}}r,\qquad b_j=\sqrt{f_j(r_f)},\qquad \gamma_j=\frac{a_j}{b_j}.
\tag{S.7.3c.1}
$$
The two source sectors have the metrics
$$
ds_j^2=\begin{cases}
-a_j^2c^2dt^2+dr^2+r^2d\Omega^2,&0\le r<R,\\
-f_j(r)c^2dt^2+f_j(r)^{-1}dr^2+r^2d\Omega^2,&r>R,
\end{cases}
\tag{S.7.3c.2}
$$
matched at $r=R$. The interior is understood in regular Cartesian coordinates at its center. A classical source label $J$ is sampled before the run with probabilities $p_0=p$, $p_1=1-p$, independently of every spin preparation and later setting. The corresponding already stationary complete material/geometry sector is supplied, and $J$ remains fixed and privately retained throughout the run. No mass is changed during interrogation. The two sectors may have different material coefficients; this is their explicitly registered disjoint union, not an assertion that one unproved equation of state has both equilibria. The source parameters precede the channel and attenuation calculation.

1. **Complete background and material action.** The source has surface stress $S^a{}_b=\operatorname{diag}(-\sigma_j,p_{s,j},p_{s,j})$, in energy per area, with
$$
\sigma_j=\frac{c^4(1-a_j)}{4\pi GR},\qquad
p_{s,j}=\frac{c^4(1-a_j)^2}{16\pi GRa_j},\qquad
\frac{p_{s,j}}{\sigma_j}=\frac{1-a_j}{4a_j}.
\tag{S.7.3c.3}
$$
These are the Einstein junction source, including its tangential pressure (Israel 1966; Martinez 1996). It obeys the dominant energy condition. For an explicit matter completion choose $n_{0,j}>0$ and a conserved surface particle current, and set
$$
\sigma_j(n)=\mu_j n+\kappa_j n^2,\qquad
\mu_j=\frac{\sigma_j-p_{s,j}}{n_{0,j}}>0,\qquad
\kappa_j=\frac{p_{s,j}}{n_{0,j}^2}>0.
\tag{S.7.3c.4}
$$
The matter action is $-c^{-1}\int\sigma_j(n)\,d\operatorname{Vol}_{h_j}$ on the shell worldvolume with its induced metric and fixed conserved particle current. Its metric variation has pressure $n\sigma_j'(n)-\sigma_j(n)=\kappa_jn^2$, reproducing (S.7.3c.3) at $n=n_{0,j}$. The sound-speed ratio is $dp_s/d\sigma=2\kappa_jn/(\mu_j+2\kappa_jn)<1$. Thus the supporting pressure belongs to a stated surface material action.

The proper shell mass $m_j=4\pi R^2\sigma_j/c^2$, its ADM mass and its redshifted active-stress expression satisfy
$$
m_j=\frac{Rc^2(1-a_j)}G,\qquad
M_j=m_j-\frac{Gm_j^2}{2Rc^2},\qquad
M_jc^2=a_j4\pi R^2(\sigma_j+2p_{s,j}).
\tag{S.7.3c.5}
$$
The binding term $-Gm_j^2/(2R)$ is the single difference between ADM and proper material energy. The last two equalities are alternative recompositions of that same total; their terms are not added to each other. Both bulk regions have zero background matter stress, and the exterior curvature is retained. There is no additional background charge, cosmological term, incoming radiation or clamp. The operating source is static, with no background work, heat flow or radiation. Preparation supplies the ready material/geometry sector before the operating interval.

A locally radially stable subfamily is explicit. Suppressing $j$, put $w=p_s/\sigma$, $x=r/R$ and
$$
F(x)=1-w+\frac{w}{x^2},\qquad e(x)=F(x)-\frac{1-a}{2x}F(x)^2.
$$
The conserved-particle material has $m(r)=mF(x)$, and its dynamical junction energy is $M=m(r)\sqrt{1+\dot r^2/c^2}-Gm(r)^2/(2rc^2)$. Its rest energy has
$$
e'(1)=0,\qquad e''(1)=\frac{(1-a)(5a^2-2a-1)}{4a^2}>0
\quad\text{when}\quad a>\frac{1+\sqrt6}{5}.
\tag{S.7.3c.6}
$$
The kinetic quadratic coefficient is positive, so this is radial stability of the stated material action. It is separate from an intrinsic thermodynamic entropy test or a nonspherical stability assertion.

2. **Finite clocks and causal control.** Place the test spin at the center and a reference proper-time clock at areal radius $r_f$. The center is a static geodesic of the interior; the reference is supported with proper acceleration $GM_j/(r_f^2b_j)$. The support and clock are test-sector owners. If $u$ is reference proper time and $\tau$ is center proper time, then
$$
du=b_jdt,\qquad d\tau=a_jdt,\qquad \frac{d\tau}{du}=\gamma_j.
\tag{S.7.3c.7}
$$
There is no operating clock at infinity. The asymptotic normalization in (S.7.3c.2) labels ADM energy, while the finite ratio (S.7.3c.7) fixes the physical clock comparison and is invariant under a common Killing-coordinate rescaling.

The shell is transparent to the registered null test signals. A radial signal from the reference to the center has finite coordinate delay
$$
D_j=\frac{R}{a_jc}+\frac{r_f-R}{c}
+\frac{r_{g,j}}c\log\frac{r_f-r_{g,j}}{R-r_{g,j}}.
\tag{S.7.3c.8}
$$
The reverse path has the same delay. Two reference triggers separated by a specified proper interval $T$ therefore arrive separated by center proper interval $\gamma_jT$; the fixed propagation delay cancels from their difference.

Use a test spin with a fixed local inertial spatial tetrad. A calibrated longitudinal magnetic field supplies $H=\hbar\omega Z/2$, $\omega\ne0$, and preparation/readout axes are fixed transverse directions of that apparatus. A freely running local oscillator does not define its final phase axis. The field is off before the first trigger. For a fixed proper ramp duration $d>0$, the first trigger raises its coefficient with $h(s/d)=3(s/d)^2-2(s/d)^3$ for $0\le s\le d$; the second trigger lowers it with the reversed profile. Register
$$
T\ge T_{\min}:=\frac d{\min_j\gamma_j}.
$$
Then the plateau is nonnegative, both ramps have area $d/2$, and the exact integrated generator is
$$
\int H_j(\tau)\,d\tau=H\,[d/2+(\gamma_jT-d)+d/2]=H\gamma_jT,\qquad
U_j(T)=e^{-iH\gamma_jT/\hbar}.
\tag{S.7.3c.9}
$$
Every generator during this exposure commutes with $H$. The profile, proper gap and spatial axes are identical on the two sectors; there is no $j$-dependent phase correction. The field-off identity is a separately supplied null run. The analytic formula extends to smaller $T$, but the fixed-ramp physical protocol is claimed on its registered range and at that null run.

3. **Finite spin instrument and marked response.** All spin input and effect settings are supplied independently of $J$ in the same calibrated local basis. One finite preparation route starts with a ready spin and a ready private ancillary spin, prepares Schmidt coefficients $\sqrt\lambda,\sqrt{1-\lambda}$ by a bounded $Y$ rotation, copies their basis value to the ancilla and applies the unitary eigenbasis rotation of the requested $\rho$. Tracing that retained ancilla gives any qubit density matrix. Its three gate slots have common positive proper durations; their generators and initialized resources are part of the declared finite test-control service.

For a requested effect $0\le F\le I$, define the common interaction-frame readout
$$
F_T=e^{-iHT/\hbar}F e^{iHT/\hbar},\qquad
A(F_T)=\arcsin\sqrt{F_T}.
$$
With a fresh pointer spin $M$ initially in $|0\rangle$, the generator $\hbar A(F_T)\otimes Y_M/d_F$ over a positive proper gate duration $d_F$ supplies $K_1=\sqrt{F_T}$ and $K_0=\sqrt{I-F_T}$. Its norm action is at most $\pi\hbar/2$. Every Hermitian $A(F_T)=\alpha I+\beta\mathbf n\cdot\boldsymbol\sigma$ is a local pointer field plus the displayed two-spin product coupling; their coefficients are fixed by the requested setting. Reading $Z_M$ with both outcomes retained gives the normalized physical instrument. A common smooth envelope of integral $d_F$ may replace its constant coefficient without changing the endpoint; all apparatus couplings are zero during the longitudinal exposure except its named field.

The physical outcome laws and the corresponding interaction-frame channel are
$$
\begin{aligned}
\Pr(a=1|\rho,F,T)&=\sum_jp_j\operatorname{tr}[F_TU_j(T)\rho U_j(T)^\dagger]
=\operatorname{tr}[F\Phi_T(\rho)],\\
V_j(T)&=e^{-iH(\gamma_j-1)T/\hbar},\qquad
\Phi_T(\rho)=\sum_jp_jV_j(T)\rho V_j(T)^\dagger.
\end{aligned}
\tag{S.7.3c.10}
$$
Put $W_T=e^{iHT/\hbar}$. The physical leaf on sector $j$ is $\sqrt{F_{a,T}}U_jX_jU_j^\dagger\sqrt{F_{a,T}}$, with $F_{1,T}=F_T$ and $F_{0,T}=I-F_T$. Conjugating its output by the common coordinate identification $W_T$ gives the following interaction-frame leaf. This identification changes no attenuation and does not assert an additional physical gate. With $F_1=F$, $F_0=I-F$, the retained classical-source instrument has complete leaves
$$
\mathcal I_a\!\left(\bigoplus_jX_j\right)
=\bigoplus_j\sqrt{F_a}\,V_j(T)X_jV_j(T)^\dagger\sqrt{F_a}.
\tag{S.7.3c.11}
$$
Each leaf is CP, and their sum is trace preserving on the full direct-sum spin algebra. The ready source is $\bigoplus_jp_j\rho$. All outcome-conditional spin states and the source label remain retained; the reduced channel comes from forgetting that private source record. Identity spectators are preserved. A finite later intervention in interaction-frame coordinates is implemented in the physical coordinates by conjugating its input and output with the common frame $W_A=e^{iHA/\hbar}$, where $A$ is the cumulative requested exposure. At an exposure of length $T$, the frame advances from $W_A$ to $W_{A+T}$. Every finite sequence retains this same convention; its physical intervention coefficients and service durations are included in the registered program.

Let $d_{\mathrm{read}}>0$ bound the complete local effect/pointer/record service, including its setting construction, and put $\delta=d+d_{\mathrm{read}}$. After the second trigger, the return outcome reaches the reference no later than $T+2b_jD_j+\delta/\gamma_j$. Hold it until the common public release
$$
L(T)=T+\max_{j=0,1}\left(2b_jD_j+\frac{\delta}{\gamma_j}\right)+\varepsilon_L,
\qquad \varepsilon_L>0.
\tag{S.7.3c.12}
$$
The public marked output contains the requested $T$, preparation/effect labels, the outcome and this common release label. The source label, raw arrival timestamps, source gravimetry, support-force records and internal phase/calibration records are privately retained. Their later disclosure defines a larger receiver. The public service record $\mathcal K$ includes the clock and phase conventions, operating domain, resource/calibration labels and release function; it is part of every complete-response comparison. Changing a geometry-dependent release time does not preserve the marked response merely because the spin channel is unchanged.

4. **Derived slip and channel class.** The proper-time slip relative to the finite reference is $Y_T=(\gamma_J-1)T$, with
$$
\begin{aligned}
\operatorname{Law}(Y_T)&=p\delta_{(\gamma_0-1)T}+(1-p)\delta_{(\gamma_1-1)T},\\
\mathbb E Y_T&=[p\gamma_0+(1-p)\gamma_1-1]T,\\
\operatorname{Var}(Y_T)&=p(1-p)q_{\mathrm{pair}}^2T^2,\qquad
q_{\mathrm{pair}}=|\gamma_0-\gamma_1|>0.
\end{aligned}
\tag{S.7.3c.13}
$$
At fixed $R<r_f$, distinct masses give distinct clock ratios because
$$
\frac{d\log\gamma}{dM}=-\frac G{c^2}\left(\frac1{Ra^2}-\frac1{r_fb^2}\right)<0.
$$
For an energy pair $E_i,E_k$ with $\omega_{ik}=(E_i-E_k)/\hbar$, its coherence multiplier is
$$
M_{ik}(T)=p e^{-i\omega_{ik}(\gamma_0-1)T}+(1-p)e^{-i\omega_{ik}(\gamma_1-1)T},\qquad
|M_{ik}(T)|^2=1-4p(1-p)\sin^2\frac{\omega_{ik}q_{\mathrm{pair}}T}{2}.
\tag{S.7.3c.14}
$$
Thus the registered source realizes the stochastic-phase class of Theorem S.7.3b(d), and its classical-environment-trace subcase. Its conditional source-resolved maps realize the deterministic unitary class. Each energy population is fixed. The two Kraus operators are $\sqrt p V_0$ and $\sqrt{1-p}V_1$, so this conclusion covers the full input operator algebra and all spectators.

For the nonzero spin gap, the first half-period has visibility $|2p-1|$ and the full period $T_{\mathrm{rev}}=2\pi/(|\omega|q_{\mathrm{pair}})$ restores visibility one. The revived channel may have a known common phase rather than be the identity in the chosen frame. Whenever $0<|M_{ik}(T)|\le1$, its active-exposure finite-window attenuation rate is
$$
\Gamma_{\mathrm{eff},ik}(T)=-\frac1{2T}\log\left[1-4p(1-p)\sin^2\frac{\omega_{ik}q_{\mathrm{pair}}T}{2}\right].
\tag{S.7.3c.15}
$$
At zero visibility this extended rate is $+\infty$, and at revivals it is zero. The source is a two-point non-Gaussian ensemble, not the Gaussian-variance branch or the saturated chronometric law. Its mathematical small-$T$ expansion is $p(1-p)\omega_{ik}^2q_{\mathrm{pair}}^2T/2+O(T^3)$; the fixed-ramp physical operating domain remains unchanged. Its full time family is not CP divisible, since a pair of equatorial states loses and then recovers trace distance.

The physical source memory is explicit. With $z_j(T)=e^{-i\omega(\gamma_j-1)T}$,
$$
M(T+S)-M(T)M(S)
=p(1-p)[z_0(T)-z_1(T)][z_0(S)-z_1(S)].
\tag{S.7.3c.16}
$$
This is generically nonzero. Within a run, successive conditional gates use the same $J$ and compose before that label is forgotten. Resampling a fresh $J$ between intervals produces a different experiment. Independent repetitions of the whole protocol may prepare a fresh source sector for each run.

5. **Response realization and its precise quotient.** The map from source to retained response consists of the metric/material sector, its actual finite clock ratio and null schedule, the fixed-axis test-spin evolution, the complete readout instrument and the private-source restriction (S.7.3c.7)--(S.7.3c.12). It preserves the state/effect pairing, positivity, trace, energy-population blocks and identity spectators. For a finite adaptive history, use the same classical block throughout and compose its actual spin gates and complete intervention leaves; the resulting outcome probability is the sum of the two normalized conditional histories with weights $p_j$. Subsequent settings are functions of the already released public history. This supplies a causal full instrument process, rather than imposing a semigroup on the reduced one-time channel family.

On a common public service/calibration record $\mathcal K$ and common calibrated nonzero gap, equality of the channel family for $T$ in any common open operating interval identifies the two-point law of $\gamma$, up to exchange of the source labels. The complete marked-response datum is $(\mathcal K,\operatorname{Law}(\gamma))$ on that family. Scaling $R,r_f,M$ together keeps $\gamma$ but changes null delays and generally $L(T)$; such scaling preserves the quantum channel alone unless the public service record is also matched. For one isolated use at a fixed $T$, the complete qubit channel instead depends only on the single complex number $M_{01}(T)$, and different two-point phase laws may have that same barycenter. Claims about repeated held-source histories additionally retain their common classical memory.

6. **Test energy owners and finite-error envelope.** The exact background ledger is (S.7.3c.3)--(S.7.3c.5). The separate test ledger contains the spin and its preparation ancilla, pointer, magnetic-field storage and coil loss, actuator and detector work, reference and local timing services, static support, trigger and return signals, private source/timestamp/calibration records and public-release buffer. All occupy the declared fixed-background test theory. A static local energy $E$ at lapse $N$ has Killing energy $NE$; that conversion brings every local work, storage and heat term into one unit. For a reference-to-center test photon,
$$
E_{\mathrm{center}}=E_{\mathrm{reference}}/\gamma_j,
\qquad b_jE_{\mathrm{reference}}=a_jE_{\mathrm{center}}.
\tag{S.7.3c.17}
$$
Emission, absorption and any buffer/record work remain with their own sources. Static support has zero translational work on its fixed worldline, while its force and service record are retained. No reset or Landauer equality is inferred from the pointer alphabet; a finite run may use fresh ready ancillas and records.

For the commuting longitudinal field, $\operatorname{tr}(\rho H)$ is constant during the ramp/hold/ramp operation. Its upward and downward interaction-work terms cancel; magnetic storage and any coil/actuator dissipation remain separate positive or signed ledger entries. If the coil current is $I_*h_j(\tau)$ with inductance $\mathscr L\ge0$ and resistance $\mathscr R\ge0$, its storage returns to zero and its heat is
$$
Q_{\mathrm{coil},j}=\mathscr R I_*^2\left(\gamma_jT-\frac{9d}{35}\right),
\qquad \max |\dot I|\le\frac{3|I_*|}{2d},
\tag{S.7.3c.18}
$$
using the displayed cubic ramps. The bracket is positive on the operating range. All preparation, effect-gate and terminal-record services have their own finite-duration Hamiltonian, work and storage records. The full trial budget includes preparation before the first trigger, propagation, both ramps, local readout and the final holding interval, rather than identifying the active exposure $T$ with total runtime. Test energy is not silently added to the exact shell ADM mass: its gravitational coupling is zero in this registered test theory. No finite nonzero-backreaction remainder is supplied by this equality.

For a source-parameter error record, write $\lambda=R/r_f$ and
$$
\gamma(a,\lambda)=\frac a{\sqrt{1-\lambda+\lambda a^2}},\quad
\partial_a\gamma=\frac{1-\lambda}{(1-\lambda+\lambda a^2)^{3/2}},\quad
\partial_\lambda\gamma=\frac{a(1-a^2)}{2(1-\lambda+\lambda a^2)^{3/2}}.
\tag{S.7.3c.19}
$$
On a common compact calibration box $a\in[a_-,a_+]\subset(1/5,1)$, $\lambda\in[\lambda_-,\lambda_+]\subset(0,1)$, put $b_*^2=1-\lambda_++\lambda_+a_-^2>0$. Two parameter records in this box obey $|\gamma'-\gamma|\le b_*^{-3}(|a'-a|+|\lambda'-\lambda|/2)$. If their weight discrepancy is at most $\epsilon_p$, each effective phase discrepancy is at most $\epsilon_{\varphi,j}$, and their public service record is unchanged, then
$$
\frac12\|\Phi'_T-\Phi_T\|_\diamond
\le\epsilon_p+\frac12\sum_jp'_j\epsilon_{\varphi,j}.
\tag{S.7.3c.20}
$$
For example, $|\omega'-\omega|\le\epsilon_\omega$, $|\omega'|\le\Omega$, $|T'-T|\le\epsilon_T$ and $|\gamma'_j-\gamma_j|\le\epsilon_\gamma$ give $\epsilon_{\varphi,j}\le T\epsilon_\omega+\Omega(T\epsilon_\gamma+\epsilon_T)$, plus any independently bounded ramp/readout phase error. Geometry, gap, clock and setting errors are thereby propagated from their own records, rather than inferred from an observed fringe. Complete instrument/control errors add their own half-diamond bounds. For a finite held-source history the weight error is charged once, and conditional stage errors telescope through the complete normalized process. Exposed new timing or source records alter $\mathcal K$ and are not included in a quantum-channel error bound.

7. **Finite service record and nonvacuity.** The following explicit service choice populates the test-device branch. Its setting inputs are a finite list of independently supplied exact analog matrix coefficients and proper durations, together with a finite program word; the algebraic laws quantify over each such finite list. A digital approximation supplies its own coefficient and clock errors to (S.7.3c.20). The clock, analog actuator and terminal classical pointer observable are constitutive test-device primitives.

For the three preparation slots, choose Hermitian logarithms $G_1,G_2,G_3$ of the requested Schmidt rotation, basis copy and eigenbasis rotation, with $\|G_k\|\le\pi$. Apply $\hbar G_k\chi_{d_g}(s)/d_g$ for proper duration $d_g>0$, where $\chi_{d_g}(s)=6(s/d_g)(1-s/d_g)$ on $[0,d_g]$. This profile vanishes at both endpoints, integrates to $d_g$, has peak $3/2$, derivative bounded by $6/d_g$, and squared integral $6d_g/5$. The same envelope realizes the effect gate with dimensionless generator $A(F_T)\otimes Y$, whose norm is at most $\pi/2$. Copy its pointer value to a fresh degenerate record bit using $G_{\mathrm{copy}}=\pi(I-\mathrm{CNOT})/2$, of norm $\pi$. The commutative record observable retains both outcomes. Its classical restriction is the declared terminal Born instrument; the coherent pre-restriction carrier retains the copied pointer and record. Each ready run therefore uses four spin factors (target, purification ancilla, effect pointer and record), at most five quantum gate slots, and total gate norm action at most $9\pi\hbar/2$, besides the longitudinal action $\hbar|\omega|\gamma_jT/2$.

Use two independent local readout durations $d_F,d_m>0$, with $d_{\mathrm{read}}\ge d_F+d_m+d_s$, where $d_s>0$ is a registered setting/record latency. The finite setting list is installed before the first trigger for a single trial. In an adaptive program, the new common setting is supplied after the preceding release; its positive communication and installation latency precedes the next trigger and is added to the program's public clock. All five slots have the longitudinal gap off. Finite real coefficients are settings of this analog service, rather than outputs of an uncharged exact finite-bit compiler.

For a concrete actuator ledger, expand each dimensionless gate generator as $G=\sum_{\ell=0}^{15}g_\ell P_\ell$ in the two-spin Pauli basis, padding single-spin gates with an identity. Since $g_\ell=\operatorname{tr}(P_\ell G)/4$, $|g_\ell|\le\pi$. Register a current calibration $\alpha_\ell>0$ by which $\hbar\alpha_\ell I_\ell P_\ell$ is its coupling, and use $I_\ell(s)=g_\ell\chi_{d_k}(s)/(\alpha_\ell d_k)$. For each of these at most $80$ gate-actuator records, fix an inductance $\mathscr L_\ell\ge0$ and resistance $\mathscr R_\ell\ge0$. Its storage returns to zero, its peak storage is at most $9\mathscr L_\ell g_\ell^2/(8\alpha_\ell^2d_k^2)$, its current slope is at most $6|g_\ell|/(\alpha_\ell d_k^2)$, and its heat is $6\mathscr R_\ell g_\ell^2/(5\alpha_\ell^2d_k)$. The passive coil voltage $\mathscr L_\ell\dot I_\ell+\mathscr R_\ell I_\ell$ is finite and belongs to the declared RL overhead model. A separate ideal interaction/control port owns $\int\operatorname{tr}(\rho\dot H_{\mathrm{gate}})\,d\tau$, including its transient work. The registered generator supplies the full spin Hamiltonian during its slot, so its interaction expectation is constant apart from the common envelope and its endpoint interaction work is zero. This integrated cancellation leaves the transient control work, coil heat and storage as separate entries; the passive voltage is not identified with a derived complete reciprocal Maxwell drive.

Two trigger signals and one outcome signal suffice for a trial with a preinstalled setting. Give each a finite positive emission energy and its emitting endpoint as an input record. Equation (S.7.3c.17) owns the received energy. Ready apparatus/clock/record inventories and finite nonnegative service-power bounds at the center and reference are additional declared parameters. Over their explicitly scheduled proper durations their supplied energies are bounded by those powers times duration, with fresh records retained. These are inputs of the stated test apparatus, not inferred gravitational energy or observed consumption. Together with the calculated coil heat, gate-actuator heat, source mass and actual finite schedule, they give a finite budget for each finite program. Supports, clocks and analog services remain in the background/test class declared at the start.

A rational stable witness takes $r_f=2R$, $p=1/2$ and
$$
(a_0,b_0,\gamma_0)=\left(\frac{71}{97},\frac{85}{97},\frac{71}{85}\right),\qquad
(a_1,b_1,\gamma_1)=\left(\frac{97}{127},\frac{113}{127},\frac{97}{113}\right),\qquad
q_{\mathrm{pair}}=\frac{222}{9605}.
\tag{S.7.3c.21}
$$
Choose any independently registered $R>0$, $\omega\ne0$ and $n_{0,j}>0$. Set $d=d_{\mathrm{read}}=1/(10|\omega|)$, $d_F=d_m=d_s=d_{\mathrm{read}}/3$, $d_g=d/3$, and $\varepsilon_L=R/c$. Any finite positive current calibrations, finite inductances/resistances, finite ready inventories, signal energies and service-power bounds complete the listed source inputs. The null delays and deadlines follow from (S.7.3c.8) and (S.7.3c.12). Both materials have positive radial curvature in (S.7.3c.6). The admitted times
$$
T_{\mathrm{zero}}=\frac{9605\pi}{222|\omega|},\qquad
T_{\mathrm{rev}}=2T_{\mathrm{zero}}
\tag{S.7.3c.22}
$$
give zero and unit coherence visibility. These are deductions from the independent source and control inputs. A formal response table can be evaluated exactly from those inputs; empirical probabilities and source calibration measurements belong to the separate empirical record.

*Proof.* The proof constructs the background, physical time map, complete spin instrument and its response restriction in that order.

For a metric $ds^2=-A(r)c^2dt^2+B(r)dr^2+r^2d\Omega^2$, the mixed Einstein components that determine spherical vacuum are
$$
G^t{}_t=\frac{B^{-1}-1}{r^2}+\frac{(B^{-1})'}r,\qquad
G^r{}_r=\frac{B^{-1}-1}{r^2}+\frac{A'}{rAB}.
$$
For the exterior $A=B^{-1}=1-r_g/r$ both vanish; the angular component vanishes by direct substitution (or the contracted Bianchi identity on the regular exterior). The interior is Minkowski space after the constant time rescaling $\tau=at$. Thus the only background distributional source is at $R$. Its induced metric agrees from both sides. With the normal pointing to increasing $r$, $K^\tau{}_{\tau,+}=r_g/(2R^2a)$, $K^\theta{}_{\theta,+}=K^\phi{}_{\phi,+}=a/R$, while the interior entries are $0,1/R,1/R$. Substitution in
$$
S^a{}_b=-\frac{c^4}{8\pi G}\left([K^a{}_b]-\delta^a{}_b[K]\right)
$$
gives (S.7.3c.3). In particular $p_s/\sigma=(1-a)/(4a)\le1$ exactly when $a\ge1/5$. The registered strict interval makes both material coefficients in (S.7.3c.4) positive.

To verify the matter variation, let the comoving particle number on an area element be fixed. Its number density varies by $dn=-n\,dA/A$, hence $d(\sigma A)=(\sigma-n\sigma')dA=-p_s\,dA$. The worldvolume metric variation of the same fixed conserved current gives the perfect surface-fluid tensor with this energy density and tangential pressure. For the displayed quadratic constitutive function this is $p_s=\kappa n^2$, with $dp_s/d\sigma=2\kappa n/(\mu+2\kappa n)$, between zero and one. At the chosen density it is exactly the junction stress. There is consequently no missing background force term at the shell. Multiplying $\sigma$ by $4\pi R^2/c^2$ gives $m=Rc^2(1-a)/G$. Then
$$
m-\frac{Gm^2}{2Rc^2}=\frac{Rc^2}{2G}(1-a^2)=M,
$$
and substituting $p_s/\sigma$ yields $a4\pi R^2(\sigma+2p_s)=Mc^2$. This proves both energy decompositions and fixes their common total.

For radial variations with conserved particle number, $n(r)=n_0/x^2$. Therefore $m(r)/m=(1-w)+w/x^2=F(x)$. The moving-shell junction equation is $\sqrt{1+\dot r^2/c^2}-\sqrt{1-2GM/(rc^2)+\dot r^2/c^2}=Gm(r)/(rc^2)$. Squaring once and solving for $M$ gives the dynamical expression in item 1. At rest its quotient by $m$ is $e(x)$. Differentiating the displayed rational function gives (S.7.3c.6). Expanding the positive first square root gives a kinetic contribution $m\dot r^2/(2c^2)$ to $M$ at the stationary point. Thus positive $e''(1)$ supplies a strict local radial energy minimum for this fixed material, establishing the stated spherical stability branch.

A static worldline has proper time $\sqrt{-g_{tt}}\,dt/c$; this proves (S.7.3c.7). Its proper acceleration in the Schwarzschild region is $c^2 f'/(2\sqrt f)=GM/(r^2\sqrt f)$, giving the listed reference support. At the interior center the metric is flat with constant lapse, so the centered static worldline is geodesic. Setting $ds^2=d\Omega^2=0$ gives $c\,dt=|dr|/a$ inside and $c\,dt=|dr|/f$ outside. Integration uses $\int dr/f=r+r_g\log(r-r_g)$, with positive arguments since $r_g<R$. This proves (S.7.3c.8) in both directions. Two triggers separated by $T/b$ in Killing coordinate time have the same propagation delay and are separated by $aT/b$ in center proper time. The two cubic half-area ramps therefore integrate to exactly $\gamma T$. The commuting-generator exponential is (S.7.3c.9); all finite field propagation and readout latencies are outside that accumulated longitudinal phase once its coefficient has returned to zero.

The preparation described in item 3 yields the pure state $\sqrt\lambda\,U|0\rangle|0\rangle+\sqrt{1-\lambda}\,U|1\rangle|1\rangle$. Its ancillary restriction is $U\operatorname{diag}(\lambda,1-\lambda)U^\dagger=\rho$, including rank-one and repeated-eigenvalue cases. Each logarithm in item 7 exists by the finite-dimensional spectral theorem with eigenphases in $[-\pi,\pi]$. The finite envelope integrates to its intended logarithm, so it gives precisely that preparation unitary with the stated norm bound.

For the effect coupling, spectral functional calculus gives
$$
e^{-iA(F_T)\otimes Y}|\psi\rangle|0\rangle
=\sqrt{I-F_T}|\psi\rangle|0\rangle+\sqrt{F_T}|\psi\rangle|1\rangle.
$$
Both roots exist also when an eigenvalue is zero or one; their squares sum to the identity. Copying the pointer into a fresh record and restricting to its full classical outcome algebra yields the same two complete leaves, so outcome normalization holds on every input. The copied pointer/record dilation also identifies which coherences are removed by that terminal restriction. In the physical basis the leaf is $\sqrt{F_{a,T}}U_jX_jU_j^\dagger\sqrt{F_{a,T}}$. Functional calculus commutes with unitary conjugation, and $W_TU_j=V_j$, whence conjugating this whole output by $W_T$ gives exactly (S.7.3c.11). Cyclicity of the trace gives (S.7.3c.10). This argument holds on every matrix unit, hence on the complete algebra and after tensoring any spectator identity.

The frame convention also respects histories. Suppose the input physical state represents $X$ through $X=W_A X_{\mathrm{phys}}W_A^\dagger$. Since every $W_A$ commutes with $U_j(T)$, its postexposure representative is
$$
W_{A+T}U_j(T)W_A^\dagger XW_AU_j(T)^\dagger W_{A+T}^\dagger
=V_j(T)XV_j(T)^\dagger.
$$
For an intervention leaf $\mathcal L_a$ in this frame, supply the physical leaf $\operatorname{Ad}_{W_{A+T}^\dagger}\circ\mathcal L_a\circ\operatorname{Ad}_{W_{A+T}}$ and keep that output frame until the next exposure. This is a common setting transformation, independent of $j$. Every admitted finite intervention comes with its declared finite dilation and service record; the populated five-slot trial is the explicit one-effect instance above. Induction on the released history gives the same outcome-conditional states and probabilities as (S.7.3c.11) and its compositions. Summing all leaves at each stage preserves trace, and choosing the next setting from earlier released outcomes proves causality. The label $J$ remains in the same classical block during that induction.

The last trigger reaches the center at reference-equivalent time $T+bD$. The downward ramp and complete local readout add $\delta/\gamma$ reference seconds, and the return signal adds $bD$. Thus every branch delivers by $T+2bD+\delta/\gamma$; (S.7.3c.12) is a strictly later common deadline. Holding an already produced classical record while the longitudinal field is off changes no spin measurement probability. Retaining all private arrival and source records makes the receiver cut explicit. The complete output law has its deterministic service and release marks together with the displayed binary probability; those marks are essential parts of response equality.

Equation (S.7.3c.13) is the pushforward of the independently prepared two-point law by the derived proper-time difference. Its first two moments follow by direct evaluation. Since $Ra^2=R-r_g<r_f-r_g=r_fb^2$, the mass derivative in item 4 is strictly negative. In particular the two atoms and the scale $q_{\mathrm{pair}}$ are distinct and positive. Acting with $V_j$ on $|i\rangle\langle k|$ multiplies it by $e^{-i\omega_{ik}(\gamma_j-1)T}$; averaging gives (S.7.3c.14), and its squared modulus follows from the two cross terms. The diagonal multiplier is one. The two finite Kraus operators establish complete positivity and trace preservation without a Gaussian or Markov assumption.

The sine formula proves the stated minimum, revival and logarithmic rate, including its zero-visibility limit. Expanding $\sin^2 z=z^2+O(z^4)$ and $-\log(1-x)=x+O(x^2)$ gives the small-time coefficient. For the equatorial input states $(I\pm X)/2$, the difference after the channel has eigenvalues $\pm|M(T)|$, so their trace distance is $|M(T)|$. It strictly increases from a minimum to a later revival when $p\in(0,1)$ and $q_{\mathrm{pair}}>0$. The periodic family has such a pair of times beyond any finite operating threshold. An intervening CPTP map would contract trace distance, proving failure of CP divisibility even on the admitted late-time range. Finally, expanding $[pz_0(T)+(1-p)z_1(T)][pz_0(S)+(1-p)z_1(S)]$ and using $z_j(T+S)=z_j(T)z_j(S)$ gives (S.7.3c.16). The direct-sum process established above supplies the underlying causal memory.

To establish the claimed quotient, qubit populations and the real and imaginary parts of its off-diagonal multiplier determine its action on all four matrix units. They are separated, for example, by $Z$ preparation/readout and by an $X$ preparation with $X$ and $Y$ effects in the marked basis. Thus equality for all inputs and effects is exactly equality of the complex multiplier at each requested time. Two finite exponential sums agreeing on an open interval have difference zero there. At any interior point, their first $m$ derivatives give a Vandermonde system on their $m$ distinct frequencies; its determinant is the product of nonzero frequency differences. Every coefficient must therefore vanish. With common nonzero $\omega$ this identifies the distinct $\gamma$ atoms and their weights, up to their private labeling. Their common service record supplies the remaining deterministic marks and the same conditional-history rules, proving the full family statement. At a single time the Vandermonde derivative information is absent. Indeed at $\omega T=16\pi$ the equal-weight atom pairs $(31/32,29/32)$ and $(15/16,7/8)$ give phase pairs $(i,-i)$ and $(-1,1)$ and the same zero multiplier. At $r_f=2R$ each such atom is realized by $a=\gamma/\sqrt{2-\gamma^2}$ in the stable interval. These one-time examples confirm the stricter distinction stated in item 5. Holding the source over repeated trials recovers a different, higher-order response, as required by the declared memory rule.

For energy accounting, the static Killing vector has lapse $N$ relative to a static local orthonormal observer, so contracting a local rest energy or photon momentum with that vector gives the conserved Killing energy $NE$. The two endpoints yield (S.7.3c.17). Static support has zero displacement and thus zero translational work, with its nonzero force retained as a test-service datum. During the longitudinal operation, $\langle H\rangle$ is constant since its generator is proportional to $H$; integrating $\langle H\rangle\dot h$ from the zero initial coefficient back to zero gives zero net interaction work. This is compatible with nonzero field storage and heat. The cubic integrals are $\int_0^1h=1/2$, $\int_0^1h^2=13/35$ and $\max h'=3/2$. Hence the two ramps and plateau dissipate $\mathscr R I_*^2[2d(13/35)+\gamma T-d]$, which is (S.7.3c.18). The same calculation with $\chi_d$ gives the five-slot actuator bounds in item 7. Its peak is $3/2$, squared integral is $6d/5$, and slope is at most $6/d$, giving exactly the stated inductive storage, current-slope and resistive-loss expressions. Each active spin generator is proportional to its fixed $G$, so its endpoint interaction work has the same zero-envelope calculation. Source supplied actuator work owns the heat and storage transfers. The listed finite service durations and supplied finite power bounds account separately for all remaining declared test services. This proves finiteness within the registered apparatus model and preserves the distinction from the exact background ADM ledger.

Direct differentiation gives (S.7.3c.19). On the compact box, $b\ge b_*$, $1-\lambda\le1$ and $a(1-a^2)\le1$. Integrating the gradient along the line segment in that box proves the Lipschitz estimate. For two qubit phase unitaries with phase discrepancy $\delta\varphi$, their half-diamond channel distance is at most $\|e^{-i\delta\varphi Z/2}-I\|\le|\delta\varphi|/2$; the first inequality follows by the triangle bound on a pure state with an arbitrary ancilla, followed by convexity. Splitting the difference of the two mixtures first into weight discrepancy and then into component-channel discrepancy gives (S.7.3c.20): the weight contribution is bounded by the binary total variation $|p'-p|$. For the phase, write $\omega'(\gamma'-1)T'-\omega(\gamma-1)T$ as the sum of the gap change at fixed $(\gamma,T)$, ratio change at fixed $T$ and time change at fixed $(\omega',\gamma')$. Since $0<\gamma,\gamma'<1$, their absolute values are bounded by $T\epsilon_\omega$, $\Omega T\epsilon_\gamma$ and $\Omega\epsilon_T$. Complete instrument errors telescope under trace-norm contraction, and the held label requires the mixture-weight comparison once at the beginning. This bound compares common public labels; a changed deterministic public timestamp is a different marked law.

Finally, squaring the rational numbers in (S.7.3c.21) verifies $b_j^2=(1+a_j^2)/2$, and cross multiplication gives $\gamma_1-\gamma_0=222/9605$. Each $5a_j^2-2a_j-1$ is positive, so both radial curvatures are positive. The stated times exceed $d/\min\gamma_j$, and substituting them into (S.7.3c.14) gives zero and unit visibility. The complete supplied material, source, finite control word, energy ledger and response law therefore form a nonempty exact realization. $\square$

The construction's source parameters, sectorwise matter actions, independently supplied mixture, calibrated magnetic gap, finite control settings, service record and receiver cut are the declared inputs. Its equivalence is equality of complete marked responses, represented on a common calibrated open time interval by $(\mathcal K,\operatorname{Law}(\gamma))$ modulo private source-label exchange. Equations (S.7.3c.1)--(S.7.3c.22), the finite gate construction and the complete proof supply its verifier; a violated junction identity, clock law, causal deadline, normalized instrument, energy ownership or retained response is a falsifier. The rational stable source supplies nonvacuity. The source is target-informed and unsealed at $B_0$. Its formal construction is proved; the SC-01--SC-24 certificate must still be populated on a frozen forward record. The background/test approximation is part of this admitted source class, and its calibration envelope concerns that class's own parameters and instruments.

Assume the baseline and gravitational decoherence channels are independent Markovian channels with exponential coherence factors
$$
e^{-t/\tau_{\mathrm{coh}}^0}
\quad\text{and}\quad
e^{-\Gamma_{\mathrm{grav}}^{(ij)}t}.
$$
Their product is exponential with
$$
\frac{1}{\tau_{\mathrm{coh}}^{\mathrm{eff}}}
=
\frac{1}{\tau_{\mathrm{coh}}^0}
+
\Gamma_{\mathrm{grav}}^{(ij)}.
\tag{S.58}
$$

Equation (S.58) gives the exact expression
$$
\tau_{\mathrm{coh}}^{\mathrm{eff}}
=
\frac{\tau_{\mathrm{coh}}^0}
{1+\Gamma_{\mathrm{grav}}^{(ij)}\tau_{\mathrm{coh}}^0}.
$$
For $\Gamma_{\mathrm{grav}}^{(ij)}\tau_{\mathrm{coh}}^0\ll1$,
$$
\tau_{\mathrm{coh}}^{\mathrm{eff}}
=
\tau_{\mathrm{coh}}^0
\left(
1-\Gamma_{\mathrm{grav}}^{(ij)}\tau_{\mathrm{coh}}^0
+O((\Gamma_{\mathrm{grav}}^{(ij)}\tau_{\mathrm{coh}}^0)^2)
\right).
\tag{S.59}
$$

On the saturated chronometric branch this can be written as
$$
\Gamma_{\mathrm{grav}}^{(ij)}\tau_{\mathrm{coh}}^0
=
K_{\Gamma}^{(ij)}P_{\mathrm{context}},
\qquad
K_{\Gamma}^{(ij)}
:=
\frac{|\Delta E_{ij}|}{\hbar}K_{\mathrm{eff}}\tau_{\mathrm{coh}}^0
=
\frac{4\pi G}{3c^4}(1+3w_c)\frac{|\Delta E_{ij}|}{\hbar}\frac{\eta_{\mathrm{ret}}rL_q\tau_c\tau_{\mathrm{coh}}^0}{V_S}.
\tag{S.60}
$$

### S.7.4 Net Effective CC Including Decoherence

Define
$$
\tau_{\mathrm{eff}}
=
\min(\tau_c,\tau_{\mathrm{coh}}^{\mathrm{eff}}).
\tag{S.61}
$$
Assume the linear coherence-time response branch
$$
\mathrm{CC}_{\mathrm{eff}}
=
\mathrm{CC}_{\mathrm{ideal}}
\frac{\tau_{\mathrm{eff}}}{\tau_c}.
\tag{S.62}
$$
When $\tau_{\mathrm{coh}}^0=\tau_c$ and $\tau_{\mathrm{coh}}^{\mathrm{eff}}<\tau_c$, Equations (S.58), (S.60), and (S.62) give
$$
\boxed{
\mathrm{CC}_{\mathrm{eff}}
=
\frac{\mathrm{CC}_{\mathrm{ideal}}}
{1+K_\Gamma P_{\mathrm{context}}}
}.
\tag{S.63}
$$
For small gravitational effect $K_{\Gamma} P_{\mathrm{context}} \ll 1$:
$$
\text{CC}_{\mathrm{eff}} \approx \text{CC}_{\mathrm{ideal}}(1 - K_{\Gamma} P_{\mathrm{context}})
\tag{S.64}
$$

Equation S.64 is the small-$K_\Gamma P_{\mathrm{context}}$ expansion of the independently specified coherence-response law S.63. On the global quadratic-cost branch,
$$
\mathrm{CC}_{\mathrm{eff}}
=\mathrm{CC}_{\mathrm{ideal}}\left[1-K_\Gamma A
\left(\frac{\mathrm{CC}_{\mathrm{ideal}}}
{\alpha-\mathrm{CC}_{\mathrm{ideal}}}\right)^2\right]
+O((K_\Gamma P_{\mathrm{context}})^2).
\tag{S.65}
$$

**Conditional mechanism ledger:**

1. S.5 maps CC to power only on the global quadratic-cost branch.
2. S.6 maps power to local source density through $u_{\mathrm{context}}=\eta_{\mathrm{ret}}P_{\mathrm{context}}\tau_c/V_S$.
3. S.15–S.16 use the uniform perfect-fluid and weak-field branches to obtain a potential gradient.
4. S.54 converts the proper-time difference into a coherent energy-gap-dependent phase.
5. Dephasing follows only on an unresolved phase-noise, source-trace, or saturated chronometric ND-RID branch.
6. S.63 additionally assumes that effective CC scales with the reduced coherence time.
7. Section S.4 additionally assumes the phenomenological utility $B_{\mathrm{net}}$.

Equation S.21 and Equation S.64 have the same linear form only after the additional calibration $\mathrm{CC}_{\mathrm{ideal}}=\mathrm{CC}$ and $K_\Gamma=K_{\mathrm{eff}}$.

<a id="theorem-s74a-microscopic-coherence-response-and-complete-objective-optimum"></a>**Theorem S.7.4a (Microscopic Coherence Response and Complete-Objective Optimum).**

(a) *(Coherence-carried response.)* Let the target be a qubit with energy basis $\{|0\rangle,|1\rangle\}$ and gap $\Delta E\ne0$. Let the ideal context response $L_{\mathrm{ideal}}$ be a Definition-30 map every output of which is off-diagonal in the energy basis; this holds whenever the two contexts act on a common input by context-dependent diagonal unitaries. Let the gravitational noise act after the context response on both branches by a population-preserving CPTP map $\Phi_M$ of Theorem S.7.3b(a). Then $L_{\mathrm{eff}}:=\Phi_M\circ L_{\mathrm{ideal}}$ is a Definition-30 map and
$$
\mathrm{CC}_{\mathrm{eff}}=|M_{01}|\,\mathrm{CC}_{\mathrm{ideal}}.
\tag{S.7.4a.1}
$$
On the saturated chronometric branch (S.57), with the semigroup of Theorem S.7.3b(e)--(f) acting over the window $\tau_c$,
$$
\mathrm{CC}_{\mathrm{eff}}=\mathrm{CC}_{\mathrm{ideal}}\,e^{-K_cP_{\mathrm{context}}},
\qquad
K_c:=\frac{|\Delta E|}{\hbar}K_{\mathrm{eff}}\tau_c,
\tag{S.7.4a.2}
$$
and $K_c$ is the coefficient $K_\Gamma$ of (S.60) at $\tau_{\mathrm{coh}}^0=\tau_c$. With $y:=K_cP_{\mathrm{context}}\ge0$,
$$
0\le e^{-y}-(1-y)\le\frac{y^2}{2},
\qquad
0\le\frac1{1+y}-e^{-y}\le\frac{y^2}{2}.
\tag{S.7.4a.3}
$$
Thus the linear law (S.64) and the rational law (S.63) agree with (S.7.4a.2) through first order in $y$, with these explicit remainders.

(b) *(Complete objective on the full interval.)* Let $A,K,k_b>0$, $k_c\ge0$ and $\alpha=\alpha_{CC,\max}$, and let $R$ be one of $R_{\mathrm{lin}}(y)=1-y$, $R_{\mathrm{rat}}(y)=(1+y)^{-1}$ or $R_{\mathrm{exp}}(y)=e^{-y}$. With the complete cost law (S.5), define on $[0,\alpha)$
$$
B_R(\mathrm{CC}):=k_b\,\mathrm{CC}\,R\bigl(KP_{\mathrm{context}}(\mathrm{CC})\bigr)-k_cP_{\mathrm{context}}(\mathrm{CC}).
\tag{S.7.4a.4}
$$
Then $B_R$ has exactly one maximizer $\mathrm{CC}^*_R\in(0,\alpha)$; it is strictly increasing on $[0,\mathrm{CC}^*_R]$ and strictly decreasing on $[\mathrm{CC}^*_R,\alpha)$. Explicitly, $\mathrm{CC}^*_R=\alpha s_*/(1+s_*)$, where, with $\kappa:=KA$ and $c:=2k_cA/(k_b\alpha)$, $s_*$ is the unique positive root of
$$
\begin{aligned}
R_{\mathrm{lin}}:&\quad 1-3\kappa s^2-2\kappa s^3=c\,s(1+s)^2,\\
R_{\mathrm{rat}}:&\quad 1-\kappa s^2-2\kappa s^3=c\,s(1+s)^2(1+\kappa s^2)^2,\\
R_{\mathrm{exp}}:&\quad (1-2\kappa s^2-2\kappa s^3)e^{-\kappa s^2}=c\,s(1+s)^2.
\end{aligned}
\tag{S.7.4a.5}
$$

*Proof.* (a) Composition of the CPTP map $\Phi_M$ with a Hermitian-preserving, trace-annihilating map preserves both properties, so $L_{\mathrm{eff}}$ satisfies Definition 30, and by linearity it is the difference of the two noisy context branches. A context-dependent diagonal unitary preserves populations, so $L_{\mathrm{ideal}}(\rho)=U_1\rho U_1^\dagger-U_0\rho U_0^\dagger$ is off-diagonal. An off-diagonal Hermitian qubit operator $X$ with entry $X_{01}=\delta$ has eigenvalues $\pm|\delta|$, so $\|X\|_1=2|\delta|$, while $\Phi_M(X)$ has entry $M_{01}\delta$ and trace norm $2|M_{01}||\delta|$. Corollary 9.1 and the supremum over density operators give (S.7.4a.1). On the chronometric branch, Theorem S.7.3b(e)--(f) gives $|M_{01}|=e^{-\Gamma_{\mathrm{ch}}\tau_c}$, and (S.57) gives $\Gamma_{\mathrm{ch}}\tau_c=K_cP_{\mathrm{context}}$, proving (S.7.4a.2); substitution of $\tau_{\mathrm{coh}}^0=\tau_c$ in (S.60) gives $K_\Gamma=K_c$. For (S.7.4a.3), Taylor's theorem gives $e^{-y}-(1-y)=e^{-\xi}y^2/2\in[0,y^2/2]$ for some $\xi\in[0,y]$, and $e^y\ge1+y$ gives $(1+y)^{-1}-e^{-y}\ge0$. The function $h(y):=y^2/2-(1+y)^{-1}+e^{-y}$ has $h(0)=h'(0)=0$ and $h''(y)=1+e^{-y}-2(1+y)^{-3}$. For $y\ge1$, $h''(y)\ge1-2/8>0$. For $0\le y\le1$, $e^{-y}\ge1-y$ gives $h''(y)\ge[(2-y)(1+y)^3-2]/(1+y)^3\ge0$, because $(2-y)(1+y)^3$ equals $2$ at $y=0$ and has derivative $(1+y)^2(5-4y)>0$ on $[0,1]$. Hence $h'\ge0$ and $h\ge0$.

(b) The map $s\mapsto\alpha s/(1+s)$ is a strictly increasing bijection of $[0,\infty)$ onto $[0,\alpha)$, under which (S.5) becomes $P_{\mathrm{context}}=As^2$. In the variable $s$, $B_R=k_b\alpha\varphi_R(s)-k_cAs^2$ with $\varphi_R(s):=sR(\kappa s^2)/(1+s)$, and
$$
\frac{dB_R}{ds}=k_b\alpha s\bigl(h_R(s)-c\bigr),
\qquad
h_R(s):=\frac{\varphi_R'(s)}{s}=N_R(s)w_R(s),
$$
where direct differentiation gives $N_{\mathrm{lin}}=1-3\kappa s^2-2\kappa s^3$, $N_{\mathrm{rat}}=1-\kappa s^2-2\kappa s^3$, $N_{\mathrm{exp}}=1-2\kappa s^2-2\kappa s^3$ and
$$
w_{\mathrm{lin}}=\frac1{s(1+s)^2},
\qquad
w_{\mathrm{rat}}=\frac1{s(1+s)^2(1+\kappa s^2)^2},
\qquad
w_{\mathrm{exp}}=\frac{e^{-\kappa s^2}}{s(1+s)^2}.
$$
Each $N_R$ decreases strictly from $1$ to $-\infty$ on $(0,\infty)$ and has one zero $s_0$; each $w_R$ is positive and strictly decreasing. On $(0,s_0)$, $h_R$ is a product of two positive strictly decreasing functions and decreases strictly from $+\infty$ to $0$; on $(s_0,\infty)$ it is negative. Therefore $h_R(s)=c$ has exactly one root $s_*\in(0,s_0]$, with $s_*=s_0$ exactly when $k_c=0$, and $dB_R/ds$ is positive on $(0,s_*)$ and negative on $(s_*,\infty)$. Transport through the increasing bijection proves the monotonicity statement and (S.7.4a.5). ∎

<a id="theorem-s74b-multilevel-response-and-bounded-same-carrier-calibration"></a>**Theorem S.7.4b (Multilevel Response and Bounded Same-Carrier Calibration).** The finite-tensor certificate and non-Schur star-family formula in part A evaluate the original unassisted coherence response for every finite Hermitian-preserving energy-off-diagonal-output tensor and correlation-Schur noise, with the stated rational, algebraic or certified-computable input promises, feasible attainers, finite stopping and perturbation bounds. Part B realizes the remaining coefficient bundle on one expressly fixed local prefix presentation and ideal maintained-source apparatus class.

For part B write $C_P=C_P^{S05}$ and $C_{op}=C_{op}^{S05}$ for the exact local presentation below. The qualifying cell and aggregate anchors have lengths $2,2,3,4$ and $C_{op}=2$ bits; the additional $0\le y\le1$ controls are the declared real response extension, with $x=2y$ bits equal to original excess complexity at the three anchors only. The same actual carrier has

$$
c(y)=\frac{y}{4(1+y)},\qquad P_{\rm context}=\frac{P_{\rm occ}}6y^2,
\qquad E_{\rm ret}=\eta_{\rm ret}P_{\rm context}\tau_c,
\qquad C_{\rm eff}=c(1-K_RP_{\rm context}),
$$

with $P_{\rm occ}>0$, $0<\eta_{\rm ret}<1$ and

$$
A=\frac{P_{\rm occ}}6=r_p(2\,{\rm bits})^2,\quad
K_R=\frac3{2P_{\rm occ}},\quad k_b=\frac18,\quad
k_c=\frac1{16P_{\rm occ}}.
$$

The complete operating objective has its unique maximum at the actual middle anchor $C_P=3$, $y=1/2$, with $(c_*,C_{{\rm eff},*},B_*)=(1/12,5/64,11/1536)$. The proof includes the source-sector TOV/Israel geometry before mixing, actual fuel/heat and retained transport, a common central decoding/measurement schedule, normalized target instruments and quantitative source/control/optimizer errors. The generic bounded linear-response coefficient $K_R$ is distinct from the chronometric coefficient. The result uses the specified ideal kinetic material, transparent zero-backreaction test service, supplied ready source and fixed operating tariff; it asserts neither universal machine independence nor an unbounded apparatus, acquisition optimum, chronometric-exponential law or empirical manufacture.

*Proof.* In part A, the GR and N equation labels retain the existing proof's namespaced labels; in part B the OC labels do likewise and the displayed ASCII SP formulas retain their local labels. The local section references refer to the corresponding part. The bounded calibration and general tensor results have their separately stated comparison classes.

**A. Complete Finite-Tensor and Non-Schur Response Proof.**

**Operational domain.**

For every finite $n\ge2$, fix $\mathcal H=\mathbb C^n$ with its specified rank-one energy basis, including when energy eigenvalues coincide. Let
\[
L(X)_{ij}=\sum_{kl}\ell_{ij;kl}X_{kl},\qquad
\ell_{ii;kl}=0,\qquad \ell_{ji;lk}=\overline{\ell_{ij;kl}}.
\]
Thus $L$ is complex-linear, Hermitian-preserving, trace-annihilating and $\Delta L=0$. For every $M\succeq0$ with $M_{ii}=1$, put $\Phi_M(X)=M\circ X$ and $T=\Phi_ML$. The exact objective is
\[
\operatorname{CC}(T)=\max_{\rho\succeq0,\,\operatorname{tr}\rho=1,\,0\preceq E\preceq I}
|\operatorname{tr}[ET(\rho)]|=\frac12\max_\rho\|T(\rho)\|_1.
\tag{S.7.4b.D1}
\]
All inputs/effects belong to this retained target. Private source, environment, input-archive, controller and noise records are excluded. The abstract tensor need not itself be an unscaled difference of channels; physical claims below prove that separately. Energy-off-diagonal output does not imply Schur structure, annihilation of diagonal inputs or projector-fixing context channels. Relative input phases are retained unless a theorem proves their irrelevance.

<a id="theorem-gr1-a-constructive-response-law-for-every-finite-tensor"></a>**Theorem GR.1: a constructive response law for every finite tensor.**

Let $n\ge2$ be finite, let
\[
L(X)_{ij}=\sum_{k,l}\ell_{ij;kl}X_{kl},\qquad
\ell_{ii;kl}=0,\qquad
\ell_{ji;lk}=\overline{\ell_{ij;kl}},
\]
and let $M\succeq0$, $M_{ii}=1$. Write
\[
T_{ij;kl}=M_{ij}\ell_{ij;kl},\qquad
F_T=\left(\sum_{i,j,k,l}|T_{ij;kl}|^2\right)^{1/2}.
\tag{S.7.4b.GR.1}
\]
The tensor $T$, not just its largest pair attenuation or its input populations, governs the response. Choose a certified rational $R\ge F_T$. The case $R=0$ has response zero, with every input/effect optimal. Assume $R>0$ below.

For positive integers $N,m$, define a finite set $\mathcal Q_N$: for each anchor $a\in\{1,\ldots,n\}$ take $q_a=N$ real, and take the real and imaginary parts of every other $q_j$ independently from $\{-N,\ldots,N\}$. Repetitions are harmless. Thus
\[
|\mathcal Q_N|=n(2N+1)^{2n-2}
\]
when points are counted with their anchors. Set
\[
\rho_q=\frac{qq^\dagger}{q^\dagger q},\qquad
H_q=T(\rho_q).
\tag{S.7.4b.GR.2}
\]
For $c_k=4^{-k}\binom{2k}{k}$ and $a_k=c_k/(2k-1)=c_{k-1}/(2k)$, put
\[
\begin{aligned}
p_m(t)&=R\left[1-\sum_{k=1}^m a_k(1-t^2/R^2)^k\right],\\
g_m(t)&=\frac tR\sum_{k=0}^{m-1}c_k(1-t^2/R^2)^k,\\
E_{q,m}&=\frac{I+g_m(H_q)}2,\\
v_{q,m}&=\operatorname{tr}(E_{q,m}H_q)
=\frac12\operatorname{tr}[H_qg_m(H_q)],\\
u_{q,m}&=\frac12\operatorname{tr}p_m(H_q).
\end{aligned}
\tag{S.7.4b.GR.3}
\]
Here $p_m(H_q),g_m(H_q)$ mean ordinary matrix polynomials. Define the finite, directly evaluable certificate
\[
\boxed{
\underline C_{N,m}=\max_{q\in\mathcal Q_N}v_{q,m},\qquad
\overline C_{N,m}=\max_{q\in\mathcal Q_N}u_{q,m}+\frac{nR}{N}.
}
\tag{S.7.4b.GR.4}
\]
Then, for the **unassisted** operational norm,
\[
\boxed{
\underline C_{N,m}\le\operatorname{CC}(\Phi_M\circ L)
\le\overline C_{N,m},\qquad
\overline C_{N,m}-\underline C_{N,m}
\le\frac{nRc_m}{2}+\frac{nR}{N}.
}
\tag{S.7.4b.GR.5}
\]
The lower endpoint is attained by an explicitly recorded normalized state $\rho_q$ and a genuine two-outcome effect $E_{q,m}$ satisfying $0\preceq E_{q,m}\preceq I$. For rational real and imaginary tensor entries, all numbers, states, effects and tests in (S.7.4b.GR.2)–(S.7.4b.GR.5) are rational exact-arithmetic objects.

In particular, this is the convergent response law
\[
\operatorname{CC}(\Phi_M\circ L)=\lim_{N,m\to\infty}\underline C_{N,m}
=\lim_{N,m\to\infty}\overline C_{N,m}.
\tag{S.7.4b.GR.6}
\]
These individual sequences need not be monotone; running maxima of lower bounds and running minima of upper bounds give nested intervals if desired. For prescribed rational $\varepsilon>0$, it suffices to take
\[
N\ge\frac{2nR}{\varepsilon},\qquad
m\ge1,\quad m+1\ge\left(\frac{nR}{\varepsilon}\right)^2.
\tag{S.7.4b.GR.7}
\]
Alternatively compute $c_m$ exactly until $nRc_m\le\varepsilon$. The resulting interval has width at most $\varepsilon$ and its recorded state/effect attains a score within $\varepsilon$ of the true optimum. This is a proved finite stopping rule, not a local numerical optimization claim. The count and rational bit complexity can be very large; no efficient SDP for arbitrary tensors is claimed.

**Proof: reduction, covering and global upper bound.**

Hermitian preservation and zero output diagonal imply that $H=T(\rho)$ is Hermitian and traceless. The accepted variational identity therefore gives $\tfrac12\|H\|_1$, with a spectral-projector effect. Convexity of that quantity in $\rho$ permits a pure maximizing input, and compactness gives attainment. These observations only start the evaluation; the finite bounds below supply the additional result.

Regard the four-index tensor as its matrix acting on vectorized operators. Cauchy–Schwarz gives
\[
\|T(X)\|_F\le F_T\|X\|_F,
\qquad
\|T(X)\|_1\le\sqrt n F_T\|X\|_F.
\tag{S.7.4b.GR.8}
\]
In particular $\|H_q\|_{\rm op}\le F_T\le R$. For unit vectors $z,w$,
\[
\|zz^\dagger-ww^\dagger\|_F^2=2(1-|z^\dagger w|^2)
\le2\|z-w\|_2^2.
\tag{S.7.4b.GR.9}
\]
Choose an index $a$ at which $|z_a|$ is maximal and remove only the irrelevant **global** phase so $z_a=b>0$. Every real and imaginary component of $z_j/b$ is in $[-1,1]$. Round each component of $Nz_j/b$ to a nearest integer and set $q_a=N$. With $v=bq/N$,
\[
\|v-z\|_2\le\frac{b\sqrt{2n-2}}{2N},\qquad
\left\|\frac v{\|v\|_2}-z\right\|_2
\le2\|v-z\|_2\le\frac{\sqrt{2n-2}}N.
\tag{S.7.4b.GR.10}
\]
The normalization inequality follows from $|\|v\|_2-1|\le\|v-z\|_2$ and the triangle inequality. The anchor guarantees $v\ne0$. Thus every pure input has a mesh representative $\rho_q$ whose response differs by at most
\[
\frac{\sqrt n}{2}F_T\|zz^\dagger-\rho_q\|_F
\le\frac{\sqrt{n(n-1)}F_T}{N}\le\frac{nR}{N}.
\tag{S.7.4b.GR.11}
\]
All relative phases and zero populations are included. No Schur-specific phase removal was used.

**Proof: rational spectral certificates and physical effects.**

For $|t|\le R$, put $s=1-t^2/R^2\in[0,1]$. The binomial expansion
\[
\sqrt{1-s}=1-\sum_{k\ge1}a_ks^k
\]
has positive $a_k$. Its truncation implies $p_m(t)\ge|t|$. For $t\ne0$, the expansion $(1-s)^{-1/2}=\sum_{k\ge0}c_ks^k$ implies $|g_m(t)|\le1$ and $tg_m(t)\le|t|$. At $t=0$ these inequalities hold directly. The coefficient recurrence
\[
c_{k+1}=c_k\frac{2k+1}{2k+2}
\]
gives the exact polynomial identity
\[
\boxed{p_m(t)-tg_m(t)=Rc_m(1-t^2/R^2)^m.}
\tag{S.7.4b.GR.12}
\]
The spectral theorem now yields $-I\preceq g_m(H_q)\preceq I$ and hence a valid effect $E_{q,m}$. It also gives
\[
0\le v_{q,m}\le\frac12\|H_q\|_1\le u_{q,m},\qquad
u_{q,m}-v_{q,m}\le\frac{nRc_m}2.
\tag{S.7.4b.GR.13}
\]
The normalization/trace assumptions were used in identifying $\operatorname{tr}(E_{q,m}H_q)$ with half the trace of $H_qg_m(H_q)$. The identity (S.7.4b.GR.12) is independently verifiable by rational matrix arithmetic, even when $H_q$ has repeated or zero eigenvalues.

Take finite maxima and combine (S.7.4b.GR.11)–(S.7.4b.GR.13). This proves both bounds and their width in (S.7.4b.GR.5). Finally $c_m\le1/\sqrt{m+1}$ follows inductively from its recurrence: $(2m+1)^2(m+2)\le4(m+1)^3$. Equation (S.7.4b.GR.7) follows. The $R=0$ case is direct. ∎

**Input representations, exact attainers and what is not promised.**

For rational tensors the finite certificate above requires only rational arithmetic and an upper bound on a square root, obtainable with integer square roots. Rational correlation matrices can independently be checked by all principal minors; HP and $\Delta L=0$ are checked on every matrix unit. This does not silently infer physical channels from the norm tensor.

For real algebraic tensors, ordinary exact real-algebraic arithmetic also evaluates the certificate. There is additionally a finite exact description of the optimum and exact attaining state/effect. Write $z=x+iy$ with $\|x\|^2+\|y\|^2=1$, and write a Hermitian effect $E=U+iV$, with $U$ symmetric and $V$ skew-symmetric. Require every principal minor of $E$ and $I-E$ to be nonnegative. The objective
\[
f(x,y,U,V)=\operatorname{tr}[E T(zz^\dagger)]
\tag{S.7.4b.GR.14}
\]
is a real polynomial of total degree three. Absolute values are unnecessary: replacing $E$ with $I-E$ reverses the sign because $T(zz^\dagger)$ is traceless. Its feasible set is compact. The sentence
\[
\exists(x,y,U,V)\,[\text{feasible}\land f=c]\quad\land\quad
\forall(x,y,U,V)\,[\text{feasible}\Rightarrow f\le c]
\tag{S.7.4b.GR.15}
\]
is a finite real-closed-field formula. Quantifier elimination and algebraic sample-point extraction give $c$ and an attaining pair using algebraic numbers. An exact optimal effect may instead be chosen as the positive spectral projector of the optimal output. This paragraph is an additional exact representation, not the sole evaluation method; the executable certificate needs no quantifier-elimination library.

For computable real/complex entries, specify the input by oracles supplying rational enclosures with requested certified accuracy. There is a uniform algorithm for a response interval of any prescribed positive width and for an $\varepsilon$-optimal rational state/effect. Approximate $T$ by a rational HP zero-diagonal tensor $\widetilde T$, with $\|T-\widetilde T\|_F\le\delta$; retain both conjugate coefficients together and set output diagonals to zero. By equation (S.7.4b.GR.16) below the response error is at most $d=\sqrt n\delta/2$. Compute a width-$\varepsilon/2$ certificate for $\widetilde T$ with $d\le\varepsilon/4$, and enlarge both endpoints by $d$. The same rational lower witness, evaluated on the true tensor, lies above the enlarged lower endpoint. No positivity of the approximate noise matrix is needed: the approximation is a computational tensor and the true correlation matrix remains the promised physical object. If checking exact PSD for general computable input is not supplied, it remains an **input promise**, not a decidability claim.

Every true optimum has a mathematical pure-state and spectral-effect attainer, for every finite tensor. The computable-input claim does not promise a uniform stable choice of an exact optimizer through degeneracies or switches. It guarantees the value and arbitrarily accurate feasible witnesses. Arbitrary noncomputable coefficients have mathematical compactness/variational formulas but are not an algorithmically encoded input class.

**The non-Schur orthogonal-measure star-output family.**

Fix any finite $n\ge2$, the specified rank-one energy basis $|0\rangle,\ldots,|n-1\rangle$, any real energy spectrum including degeneracies, and the leaf subspace $\mathcal V=\operatorname{span}\{|1\rangle,\ldots,|n-1\rangle\}$. Choose nonzero mutually orthogonal projectors $P_1,\ldots,P_m$ summing to $I$, unit vectors $v_a\in\mathcal V$, and real $t_a\in[-1,1]$. Define

\[
H(v)=|0\rangle\langle v|+|v\rangle\langle0|,
\qquad L(X)=\sum_{a=1}^m t_a\operatorname{tr}(P_aX)H(v_a).
\tag{S.7.4b.N1}
\]

These membership conditions are fixed before any optimization. They specify a proper subclass of the broad finite off-diagonal-output grammar. For all matrix units,

\[
\ell_{ij;kl}=\sum_a t_a(P_a)_{lk}H(v_a)_{ij}.
\tag{S.7.4b.N2}
\]

Consequently $L$ is complex-linear, Hermitian-preserving, trace-annihilating and $\Delta L=0$. The theorem below also works with arbitrary real $t_a$ at the abstract Definition-30 level; the stated unit bound supplies the explicit physical branches.

**Physical context branches.**

Put $D_a=(|0\rangle\langle0|+|v_a\rangle\langle v_a|)/2$ and

\[
\sigma_{a,\pm}=D_a\pm\frac{t_a}{2}H(v_a),\qquad
\mathcal E_\pm(X)=\sum_a\operatorname{tr}(P_aX)\sigma_{a,\pm}.
\tag{S.7.4b.N3}
\]

In the orthonormal pair $(|0\rangle,|v_a\rangle)$ the two eigenvalues of $\sigma_{a,\pm}$ are $(1\pm t_a)/2$, so these are density matrices. Each channel is a complete measurement followed by normalized preparation, and hence is CPTP on all target inputs and spectator extensions. Explicitly, if $P_a=\sum_r|e_{ar}\rangle\langle e_{ar}|$ and $\sigma_{a,\pm}=\sum_b\lambda_{ab,\pm}|u_{ab,\pm}\rangle\langle u_{ab,\pm}|$, the Kraus operators are

\[
K_{arb,\pm}=\sqrt{\lambda_{ab,\pm}}|u_{ab,\pm}\rangle\langle e_{ar}|,
\qquad \sum_{arb}K_{arb,\pm}^\dagger K_{arb,\pm}=I.
\]

The difference is exactly (S.7.4b.N1), and $\Delta\mathcal E_+=\Delta\mathcal E_-$. Neither channel is asserted to fix energy projectors. Any other positive preparations with the same difference give the same theorem. For comparison only, an optional alternative algebraic realization uses the pure states

\[
|\chi_\pm(s)\rangle=\cos(5\pi s)|0\rangle\pm\sin(5\pi s)|v\rangle,
\quad
|\chi_+\rangle\langle\chi_+|-|\chi_-\rangle\langle\chi_-|
=\sin(10\pi s)H(v).
\tag{S.7.4b.N4}
\]

Their common population block varies with $s$; that does not change the contrast or make it Schur. The selected physical construction instead uses the fixed-population states (S.7.4b.N3), prepared by its explicit private-seed controlled rotation. Equation (S.7.4b.N4) is not substituted into that construction or its energy ledger.

**Theorem N.1: exact unassisted response, certificate and all preparations.**

For every correlation matrix $M\succeq0$, $M_{ii}=1$, define the leaf vectors and radii

\[
z_a=t_a\sum_{j=1}^{n-1}M_{j0}(v_a)_j|j\rangle,
\qquad r_a=\|z_a\|_2,
\qquad r=\max_a r_a.
\]

Then

\[
\boxed{\operatorname{CC}(\Phi_M\circ L)
=\max_a |t_a|\sqrt{\sum_{j=1}^{n-1}|(v_a)_j|^2|M_{0j}|^2}.}
\tag{S.7.4b.N5}
\]

A global upper certificate consists only of the finitely many inequalities $r_a^2\le r^2$. A matching input is any unit vector $\psi\in\operatorname{ran}P_a$ at a maximizing index. If $r>0$, an attaining effect is the rank-one projector onto

\[
|e_a^+\rangle=\frac{|0\rangle+z_a/r}{\sqrt2}.
\tag{S.7.4b.N6}
\]

The negative spectral projector is another absolute-value attainer. These are all retained-target operations; neither an ancilla nor the source label is supplied to the receiver.

**Proof.** For every density matrix, $p_a=\operatorname{tr}(P_a\rho)$ is a probability vector and

\[
(\Phi_ML)(\rho)=H\left(\sum_a p_a z_a\right).
\]

The only nonzero eigenvalues of $H(z)$ are $\pm\|z\|_2$. Therefore its half trace norm is $\|z\|_2$. The triangle inequality gives

\[
\frac12\|(\Phi_ML)(\rho)\|_1
=\left\|\sum_a p_a z_a\right\|_2
\le\sum_a p_a r_a\le r.
\]

The specified input has $p_a=1$, and (S.7.4b.N6) measures its positive eigenvalue $r$. This proves upper and lower bounds without an ancillary optimization. If $r>0$, equality throughout is possible precisely when every used index has $r_a=r$ and all used vectors $z_a$ are identical. Thus the complete optimal-input set consists of density matrices supported on a sum of maximizing measurement subspaces whose noisy output vectors are identical. Different maximizing vectors give distinct optimal preparation classes, not arbitrary optimal mixtures. If $r=0$, every output vanishes and all inputs and effects are optimal. $\square$

The finite maximum displays every preparation switch: between indices $a,b$ its candidate switching equation is

\[
t_a^2\sum_j |(v_a)_j|^2|M_{0j}|^2
=t_b^2\sum_j |(v_b)_j|^2|M_{0j}|^2,
\]

with the common value no smaller than the other radii. No derivative across a switch is required. Zero $t_a$, vanishing leaf amplitudes, zero noise edges and repeated energies are included. Degeneracy means the specified rank-one basis throughout, not unrestricted block noise.

**Every nonzero member is genuinely non-Schur.**

The Hilbert–Schmidt adjoint satisfies

\[
\operatorname{ran}L^\dagger\subseteq\operatorname{span}\{P_a\},
\]

a commuting algebra. A nonzero Hermitian-preserving zero-diagonal Schur map $L_Q$ has some $Q_{ij}\ne0$, hence also $Q_{ji}\ne0$. The range of its adjoint contains both $|i\rangle\langle j|$ and $|j\rangle\langle i|$, which do not commute. It cannot equal (S.7.4b.N1). This obstruction survives arbitrary unitary input and output changes: an invertible output conjugation does not change the adjoint range, and input conjugation preserves its commutativity. Thus no nonzero member is an operationally free unitary rewriting of a solved Schur response. The intersection with the solved Schur family is exactly the zero map. For $n=2$, (S.7.4b.N5) nonetheless gives the inherited qubit law $\operatorname{CC}(\Phi_ML)=|M_{01}|\operatorname{CC}(L)$.

**All-tensor implementation source clock and readout errors.**

For any two finite HP trace-annihilating tensors $T,T'$ in dimension $n$,
\[
\boxed{|\operatorname{CC}(T)-\operatorname{CC}(T')|
\le\frac{\sqrt n}{2}\|T-T'\|_F.}
\tag{S.7.4b.GR.16}
\]
For each input use the reverse triangle inequality, (S.7.4b.GR.8), and $\|\rho\|_F\le1$, then take suprema. This proves the claim without differentiability, optimizer uniqueness or a gap condition.

When $T=M\ell$ and $T'=M'\ell'$, with products in the output pair only and $M,M'$ correlation matrices,
\[
\|T-T'\|_F
\le\|\ell-\ell'\|_F+
\left[\sum_{ij}|M_{ij}-M'_{ij}|^2\sum_{kl}|\ell'_{ij;kl}|^2\right]^{1/2}.
\tag{S.7.4b.GR.17}
\]
Indeed $|M_{ij}|\le1$ and $T-T'=M(\ell-\ell')+(M-M')\ell'$. A simpler bound replaces the square-root term by $\|M-M'\|_{\max}\|\ell'\|_F$. If $\max|T-T'|\le\eta$, the zero output diagonal permits the explicit estimate $\|T-T'\|_F\le n\sqrt{n(n-1)}\eta$; using an actual weighted tensor bound is often much sharper.

If $T=\mathcal E_1-\mathcal E_0$ and $T'=\mathcal E'_1-\mathcal E'_0$, a certified branch implementation bound $\|\mathcal E_b-\mathcal E'_b\|_\diamond\le\delta_b$ yields
\[
|\operatorname{CC}(T)-\operatorname{CC}(T')|\le(\delta_0+\delta_1)/2.
\tag{S.7.4b.GR.18}
\]
Here the diamond norm is only an error bound: applying its definition to an input with a trivial reference gives the needed unassisted trace-norm error. It does not change the response objective.

For a feasible intended state/effect $(\rho,E)$ and actual normalized state/effect $(\rho',E')$, let $\|\rho-\rho'\|_F\le d_\rho$, $\|E-E'\|_{\rm op}\le d_E$, and $\|T-T'\|_F\le d_T$. Then
\[
\left|\operatorname{tr}[E'T'(\rho')]-\operatorname{tr}[ET(\rho)]\right|
\le\frac{\sqrt n}{2}d_T+\frac{\sqrt n}{2}F_Td_\rho+\sqrt n F_Td_E.
\tag{S.7.4b.GR.19}
\]
Split the difference into tensor error on $\rho'$, state error under $T$, and effect error on $T(\rho)$. The first two outputs are traceless Hermitian, so their effect bound is half the trace norm; Hölder's inequality bounds the final term. If leakage or aborts are possible they must already appear in normalized branches or an explicit failure outcome; this formula cannot hide missing probability mass.

For stochastic proper-time phase noise,
\[
M_{ij}=\mathbb E\,e^{-i\omega_{ij}Y},\qquad \omega_{ij}=(E_i-E_j)/\hbar,
\]
any coupling of the true and approximate slip variables gives the moment-free estimate
\[
|M_{ij}-M'_{ij}|
\le\mathbb E\min\{2,|\omega_{ij}Y-\omega'_{ij}Y'|\}.
\tag{S.7.4b.GR.20}
\]
This follows from $|e^{ia}-e^{ib}|\le\min(2,|a-b|)$. It remains valid for Cauchy laws without finite first moment. When the first moments exist, it is bounded by $|\omega_{ij}|\mathbb E|Y-Y'|+|\omega_{ij}-\omega'_{ij}|\mathbb E|Y'|$. A separate distribution mismatch bounded by total variation $d_{\rm TV}$ contributes at most $2d_{\rm TV}$.

For the admitted held two-sector source, keep the actual joint source label throughout the experiment:
\[
M_{ij}=p e^{-i\omega_{ij}y_0}+(1-p)e^{-i\omega_{ij}y_1},\qquad
y_j=(\gamma_j-1)T.
\]
One useful finite bound is
\[
|M_{ij}-M'_{ij}|\le 2|p-p'|+
\sum_{j=0}^1p_j\min\{2,|\omega_{ij}y_j-\omega'_{ij}y'_j|\},
\tag{S.7.4b.GR.21}
\]
where $p_0=p,p_1=1-p$ and the probability-difference term is separated before phase comparison. Independent clock and energy calibration obey
\[
|y_j-y'_j|\le |\gamma_j-1||T-T'|+|T'|\,|\gamma_j-\gamma'_j|,
\quad
|\omega y_j-\omega' y'_j|\le|\omega||y_j-y'_j|+|\omega-\omega'||y'_j|.
\tag{S.7.4b.GR.22}
\]
Feed (S.7.4b.GR.21)–(S.7.4b.GR.22) into (S.7.4b.GR.17) and (S.7.4b.GR.16)/(S.7.4b.GR.19). This transfers source, geometry, gap and timing errors to response errors without assigning a Markov law, using phase variance as a substitute for the law, or confusing the dimensions of $K_{\rm time}$ and an attenuation coefficient.

For jointly constrained source/device uncertainties, maximize the right-hand bounds over the actual **joint** uncertainty set. Correlated parameter errors need not be replaced with fictitious independent errors; using separate worst-case magnitudes is allowed only as a conservative envelope. For $B=k_bC-k_cP$, coefficient and response errors obey, for example,
\[
|B-B'|\le |k_b|\,|C-C'|+|k_b-k'_b|C'
+|k_c|\,|P-P'|+|k_c-k'_c|P'.
\tag{S.7.4b.GR.23}
\]
If a nominal objective has a strict gap greater than $2\eta$ outside a declared optimizer neighborhood and every realized objective differs uniformly by at most $\eta$, every realized maximizer lies in that neighborhood. The proof compares its value with a nominal maximizer. Without such a gap the correct certificate is an optimizer/tie region; differentiability or unique stability is not inferred across a switch.

**B. Original-Prefix Anchors and Complete Maintained-Source Calibration.**

**Registered scope and constitutive inputs.**

The result is a theorem about the following stated ideal branch. These are inputs to the model, not consequences disguised as empirical findings.

1. A fixed original prefix machine, blank reference preparation, constant typed admissibility hierarchy and finite physical decoder. Exact analog parameters and the ODE-defined target gap are computable real constants in this ideal formal registration; finite-precision realizations require the explicit implementation-error bounds given below. The exact complexity claims concern whole owned ready preparations and their declared forward trials. Later random records are not assigned the same program complexity by fiat.
2. A finite live predictor, source-retaining parity encoder, exact finite-dimensional control Hamiltonians, linear conductance divider and bounded arcsine actuator. The latter is a registered analog constitutive law.
3. Classical Einstein gravity with a smooth, compact-energy-support massless kinetic fluid, a complete gravitating thin wall with the specified causal two-sector surface material, and a boundary absorber/emitter with \(\epsilon=1\) and efficiency \(\zeta=1/2\). At the very large source density this is not claimed to be a photon-only Standard Model material or manufactured apparatus.
4. Supplied ready source initial data and a separately owned preparation-energy record. The maintained finite episode is proved; arbitrary source formation, asymptotic convergence and radial dynamical stability are not asserted.
5. The already admitted exactly zero-backreaction test-service convention, separately registered transparency of test matter to the kinetic source particles, and finite service energy and peak-power ratings. Test services have accounted energy. The source wall, fuel, waste and radiation all gravitate.
6. One held source-occupation label, a separate private sign coin, finite fresh records, a fixed target-only receiver and a common public schedule. Cost is expected maintenance across the source mixture; retained-energy and clock laws also hold for each actual occupied/empty sector.
7. A target-informed but fixed payoff tariff. The comparison prices actual operating maintenance, with physical constant-power ballast for auxiliary services. It does not price total source acquisition or claim a universal minimum-work law.

The fixed source record is
\[
R=1\ \mathrm{m},\quad\chi=10^{-4},\quad s=1/25,\quad
\epsilon=1,\quad\zeta=1/2,\quad
\tau_c=100R/c_{\rm light},\quad H=2\tau_c,\quad
r_1=R/2,\quad r_2=51R/100.
\]
The source proof uses \(c_{\rm light}\), written $c$ in its displayed ASCII equations, for the speed of light; \(c(y)\) denotes operational coherence. Its lapse bound is denoted $h_\star$ in this report, reserving \(H\) for the complete priced trial. Unmodified embedded programs retain their own local variable names; their $H=\chi/[2(1-\chi)]$ is this lapse bound, not the trial duration.

**Complete coefficient and unit ledger.**

| Quantity | Exact registration or derived value | Meaning and scope |
|---|---|---|
| \(C_{\rm op}\) | \(2\) bits | Same-task qualifying threshold on the fixed presentation |
| \(C_{\rm scale}\) | \(2\) bits | Registered response scale |
| \(\alpha\) | \(1/4\) | Rational response parameter; actual range is \(0\le c\le1/8\) |
| \(p(y)\) | \(y^2/6\) | Held occupied-source probability, not aggregate parity |
| \(P_{\rm occ}\) | \(N_b^2\epsilon c_{\rm light}(4\pi R^2)u_b/(4\zeta)\) | Actual center-energy fuel depletion per center second |
| \(r_p\) | \(P_{\rm occ}/(24\,{\rm bits}^2)\) | W per bit squared, at original anchors and on the declared extension |
| \(A=r_pC_{\rm scale}^2\) | \(P_{\rm occ}/6\) | Original rational-cost coefficient, W |
| \(E_0\) | \(E_{\rm bulk}=4\pi\int_0^R u r^2/a\,dr\) | Occupied proper material holding, J |
| \(E_K\) | \(4\pi\int_0^R Nu r^2/a\,dr\) | Center Killing photon holding, center J |
| \(\tau_{\rm res,K}\) | \(E_K/(N_b^2P_{\gamma,b})\) | Actual energy-weighted residence interval in center seconds |
| \(\eta_K\) | \(\zeta\tau_{\rm res,K}/\tau_c\) | Retained coefficient in the single conserved-energy convention |
| \(\eta_{\rm ret}\) | \(\zeta(E_{\rm bulk}/E_K)\tau_{\rm res,K}/\tau_c\) | Proper-holding conversion; \(E_{\rm bulk}=\eta_{\rm ret}P_{\rm occ}\tau_c\) |
| \(\delta\tau_{\rm occ}\) | \(\tau_c[N(r_2)-N(r_1)]>0\) | Actual occupied differential clock exposure |
| \(K_{\rm time}\) | \(\delta\tau_{\rm occ}/P_{\rm occ}\) | Source-specific seconds per watt; also mean absolute signed exposure coefficient |
| \(K_{\rm eff}\) | \(K_{\rm time}/\tau_c\) | Exact two-sector clock-ratio coefficient, inverse W |
| \(\omega,\Delta\) | \(2\pi/(3\delta\tau_{\rm occ}),\ \hbar\omega\) | Finite, source-calibrated target gap |
| \(K_R\) | \(3/(2P_{\rm occ})\) | Exact bounded operational attenuation coefficient, inverse W |
| \(\omega K_{\rm time}\) | \(2\pi/(3P_{\rm occ})\ne K_R\) | Spectroscopic clock coefficient; no chronometric-exponential identification |
| \(k_b\) | \(1/8\) payoff unit | Derived future-parity score gain per operational response |
| \(k_c\) | \(1/(16P_{\rm occ})\) payoff units/W | Registered operating resource preference |
| \(H,\lambda\) | \(2\tau_c,\ k_c/H\) | Complete trial duration and payoff units per center J |
| \(P_B\) | \(10^9\) center W | Actual constant test-service bus plus nonnegative ballast |

In particular \(AK_R=1/4\), \(k_cA=1/96\), and \(P_{\rm context}=A[c/(\alpha-c)]^2\) exactly on the bounded class. Uppercase chronometric \(K_c\) is not identified with lowercase utility \(k_c\), nor with \(K_R\). Source-specific exact geometric coefficients are separately compared with the uniform-fluid approximation in SP 5. Certified outward intervals are supplied in Part IV; decimal ODE values in SP 7 are diagnostics only.

**Part I Original program anchors and rational response.**

**OC 1. What must and must not be identified.**

The original quantities are the original program-length invariant `C_P`, its same-task qualifying threshold `C_op`, the response model's expressly admitted real extension, the actual excess maintenance flow `P_context`, the localized retained energy, and the response of the same source and target. The prior density coordinate and drive-only inventory are not identified with these quantities.

The construction below registers three exact original-program anchors and a bounded response extension between them. A continuous setting is not assigned a fractional value of `C_P`. The formal presentation is registered here, following the same presentation-relative original-prefix convention used by the explicit host of §P.16b.12.4h. It makes no identification with another fixed presentation.

The relevant source distinctions are:

- Section 2.4.1 defines `C_P` relative to a fixed prefix machine, reference state and decreasing admissibility hierarchy. Theorem 2.4.1a identifies its value with the shortest common admissible program on the full-realizer branch.
- Chapter 7 Definition 23 defines a minimum qualifying state; it does not require a unique physical minimum, or identify original program length with Hilbert dimension.
- Chapter 9 Definition 29 concerns actual aggregate-state original complexity. Definition 31 explicitly permits a real response extension through assigned attainable values, without differentiating the integer invariant itself.
- Appendix S S.3 is an independent constitutive quadratic-maintenance branch. S.5 follows after elimination of the original complexity coordinate; it is not a universal cost theorem.
- The host of §P.16b.12.4h, “Explicit program presentation and strict capacity inequality,” supplies a formal-host precedent. Its frozen constant hierarchy is defined by typed ideal physical descriptors without using complexity or minimality in its membership condition. The present finite codebook is a separate registration with its own machine.

**OC 2. Three exact original-program anchors.**

**OC 2.1 Qualifying cell and actual aggregate.**

A self-contained minimum-cell module has distinct degenerate data registers $M,I,A,F_0,F_1$, a fixed finite instruction ROM, its cursor, a driven controller, and owned environmental input/output records. The ready controller installs the following fixed schedule; the ROM, cursor, gate drives and all named data belong to the cell descriptor rather than an external learning algorithm.

1. The current environmental bit is basis-copied into $M$. Its initial stationary law is uniform and its source bit is retained.
2. Copy $M$ to fresh $F_0$ and announce the rational forecast $q=(1+2F_0)/4$ for the next environmental bit.
3. Only after that forecast, generate a fresh innovation $N=a\wedge b$ from two independent fair retained basis coins. The environment produces $Y=M\oplus N$ and basis-copies its result to the fresh interface $I$. Each coin and source update has its own finite unitary/diagonal instrument and retained record.
4. Apply the ordered CNOTs $M\to I$, $I\to M$, $M\to I$: the first stores the discrepancy $m\oplus Y$ in $I$, the second uses it to update $M$ to $Y$, and the third archives old $m$ in $I$. Replacing the second gate with identity leaves stale memory. Now $M=Y$ while $I$ archives the old memory. Write the verification bit $A=I\oplus M$ with two CNOTs into fresh $A$.
5. Copy the updated $M$ to fresh $F_1$. The next forecast is $(1+2F_1)/4$ for a subsequent innovation generated after this second forecast.

The prediction, ingress, three-CNOT swap, verification and second forecast use eight CNOT gates, plus the separately counted initial memory ingress and environmental coin/innovation gates. The cursor is advanced by a finite reversible schedule and retained. For any involutory gate $U$, a positive-duration pulse $H_U=\pi\hbar(I-U)/(2d_U)$ gives $\exp(-iH_Ud_U/\hbar)=U$; source controls, switching work and heat are owned by the service ledger. The exact sequence is finite, and no data or cursor is reset during it. The basis readout leaves are normalized projective instruments with their outcomes copied to fresh records. Removing the swap leaves a stale model whenever $N=1$, proving actual update use.

Conditional on either value of `M`, the next bit equals it with probability `3/4`. Thus the Brier risk of either correctly updated forecast is `3/16`, while that of the matched no-input forecast `1/2` is `1/4`. With accuracy `1-mean Brier loss` and positive qualifying margin `1/32`, the gain `1/16` strictly qualifies. The null aggregate uses this same task and still qualifies. This finite full-loop construction is also instantiated in greater register-level detail by the explicit host of §P.16b.12.4h; that source is an antecedent rather than a missing qualification premise here.

The common qualification benchmark is fixed once for the standalone cell and every aggregate anchor: the same binary Markov environment with flip probability 1/4, the named port $Q_{\mathrm{qual}}$ carrying the forecast after one verified memory update, Brier accuracy, matched no-input forecast 1/2, and strict qualifying margin 1/32. Each constituent has an isomorphic port with the same law; the aggregate exports one designated constituent port as $Q_{\mathrm{qual}}$. The cross-cell future-parity forecast is an additional registered utility task supplying $k_{b}=1/8$. It is not substituted for the qualification benchmark when deriving $C_{\mathrm{op}}$.

For the additional qutrit context task, use two independent copies of this environment,

\[
Y^i_{n+1}=Y^i_n\oplus N^i_{n+1},\qquad
\Pr(N^i_{n+1}=1)=1/4.
\]

Into a fresh private parity bit $P=0$, apply $\mathrm{CNOT}(M_1\text{ to }P)$ and then $\mathrm{CNOT}(M_2\text{ to }P)$. These two gates write the parity of both actual updated memories and are both charged to the finite control ledger. Their common parity port is a physical cross-cell interaction, not a preloaded answer. The scoring innovation pair is generated only after the public target-based forecast. Its parity agrees with current parity with probability $(3/4)^2+(1/4)^2=5/8$.

The common aggregate contains at least two copies of the qualifying ready cell. It additionally owns their parity interaction, source encoder, target circuit and the maintenance/source apparatus. For every scalar setting, including the null setting, its live adaptive core still executes the same qualifying task. Null target bias does not mean null predictive performance.

The physical cell, the aggregate at setting $y=0$, the aggregate at $y=1/2$, and the aggregate at $y=1$ are four different canonical finite physical descriptors. Denote their ready preparation microstates by $\mu_{\mathrm{cell}},\mu_0,\mu_1,\mu_2$. The microstate includes the specified initial ports, program/controller registers, actual bounded apparatus, complete source-material constants, prepared source-law controls, battery capacities and resource owners. It is the whole owned ready apparatus, not just its predictive core. Its finite canonical description specifies the ready preparation before future coin outcomes; those outcomes are generated by the ensuing physical protocol. A descriptor is interpreted by the stipulated finite ideal physical decoder, not mistaken for an uninstantiated word. Subsequent records and updates are physically retained; the calibration concerns the declared ready preparation and its complete forward trial.

**OC 2.2 Fixed original presentation.**

Use binary original program length. Define $\mathrm{enc}(w)=1^{|w|}0w$. Fix the following universal prefix interpreter $V$:

- $0\,\mathrm{enc}(w)$ outputs the word $w$.
- $1\,\mathrm{enc}(e)\,\mathrm{enc}(z)$ simulates the transition table $e$ on input $z$, outputting its finite result if it halts.

Its domain is prefix-free and it has no valid word of length zero or one. Invalid tables, incomplete codes and nonhalting computations yield no output.

Before deriving complexities or optimizing utility, register the prefix machine

\[
\begin{array}{ll}
U(00)=\mu_{\rm cell},&U(01)=\mu_0,\\
U(100)=\mu_1,&U(1010)=\mu_2,\\
U(111q)=V(q).&
\end{array}
\tag{S.7.4b.OC.1}
\]

It is undefined elsewhere. Its fixed reference state is the blank finite-source preparation. Let every hierarchy level be the same class `L`, consisting of programs whose output is a well-typed finite descriptor for the registered ideal physical law set. Well-typing specifies resources, ports, complete schedules, owned records and primitive initialization requirements. The decoder includes the admitted Appendix-S ideal background/source actions and finite exact analog parameter lists as explicitly typed physical primitives, in addition to the finite Hilbert/instrument host; it does not infer a material source from an arbitrary circuit word. It contains no condition referencing `C_P`, `C_op`, MPUs, desired complexity values or a desired optimizer. Universality follows from the disjoint `111q` interpreter branch.

Each dedicated code is a common full-hierarchy realizer. There is no program of length zero or one. At length two, only `00,01` produce output. At length three the only new output is `100`. At length four the only new output is `1010`. The universal tail cannot output before length five. Since the four declared output states are distinct, finite syntax exhaustion proves

\[
C_P(\mu_{\rm cell})=C_P(\mu_0)=2,
\qquad C_P(\mu_1)=3,
\qquad C_P(\mu_2)=4.
\tag{S.7.4b.OC.2}
\]

At least the first cell qualifies, while no shorter program outputs any physical state. Therefore the same-task threshold is exactly

\[
C_{op}=2\ \text{bits}.
\tag{S.7.4b.OC.3}
\]

Both the cell and the null aggregate may be qualifying minima. There is no uniqueness premise to violate. Each ready constituent cell is a copy of a genuine Definition-23 minimum; its payloads interact in the aggregate. No gate-count or register-capacity proxy substitutes for this original-program proof.

This is the explicitly fixed local S05 presentation. Its program minimum is directly proved on this presentation; no equality with another fixed baseline or universal physical hierarchy is asserted.

**OC 2.3 Original anchors and admitted extension.**

Set independently

\[
C_{\rm scale}=2\ \text{bits},\qquad \alpha=1/4,
\qquad x=C_{\rm agg}-C_{op},\qquad y=x/C_{\rm scale}.
\tag{S.7.4b.OC.4}
\]

The three original states have $(x,y)=(0,0),(1,1/2),(2,1)$. Define the response extension on $0\le y\le1$ using the actual analog-control family below. It agrees with the assigned responses at all three original states. Thus it is an expressly admitted Definition-31 extension through genuine original-complexity anchors.

For nonanchor analog preparations the variable `2+2y` is the extension coordinate, not a claimed original program length. In particular a rational nonanchor may have a finite universal-tail description with original complexity at least five. That state is outside the original three-state calibration class. Ignoring this distinction would falsely claim a rational `C_P` value. The actual original optimizer will nevertheless be one of the three certified states, not just a fractional proxy optimum.

**OC 3. Physical rational response and its operational norm.**

**OC 3.1 Electrical and quantum transfer.**

Register a linear conductance transducer $G_y=G_0y$ with $G_0>0$, a reference conductance $G_0$, and a fixed voltage $V_0>0$. In the ideal finite-support test-circuit model, the voltage divider's node satisfies Kirchhoff's equation

\[
G_0V=G_y(V_0-V),\qquad
V/V_0=y/(1+y).
\tag{S.7.4b.OC.5}
\]

The setting is a physical preparation/control port of the same registered aggregate. At the three exact preparations its value is respectively `0,1/2,1`. It is not a telemetry substitute for a hidden original-program length; the physical descriptor and short-program proof jointly identify those values.

Register a calibrated bounded nonlinear test transducer with output

\[
\theta(V)=\arcsin(\alpha V/V_0),\qquad 0\le V\le V_0/2.
\tag{S.7.4b.OC.6}
\]

This is an additional ideal constitutive apparatus law, just as the source manuscript registers analog actuator coefficients and proper-time controls. It is specified independently of any norm maximization. It is not claimed to follow from Kirchhoff's law or from the gravitational action. The entire divider, analog processor, driver, pulse and readout service power must be owned by the actual regulated baseline ledger in OC §5; finite actuator norm is not itself a work formula.

For a positive duration $d$, choose the smooth envelope $u(t)=6(t/d)(1-t/d)$ on $[0,d]$ and zero otherwise. Then

\[
\int u\,dt=d,\quad \int u^2\,dt=6d/5,\quad \max u=3/2.
\]

Drive the private seed by the Hamiltonian

\[
H_{\rm var}(t)
=-\frac{\hbar\theta(V)}{2d}u(t)P_{1,D_F}\otimes Y_E.
\tag{S.7.4b.OC.7}
\]

A preceding fixed `+pi/4` seed rotation gives, in filter branch `a`,

\[
\beta_a=\pi/4-a\theta/2,
\qquad \cos(2\beta_1)=\sin\theta
=\alpha\frac y{1+y}.
\tag{S.7.4b.OC.8}
\]

The transfer is therefore derived from a physical voltage equation, an expressly declared finite analog transducer law and exact Hamiltonian evolution. It is not a declaration that a source prepares an output with an assumed CC norm. On the entire bounded interval the generator and current amplitudes are finite; with a fixed positive current gain the coil heat is proportional to $\theta(y)^2$, and is separately included in the baseline regulator rather than mislabeled quadratic context maintenance.

**OC 3.2 Complete retained-target map.**

Use the genuinely non-Schur qutrit with

\[
H_T=\operatorname{diag}(0,\Delta,2\Delta),\quad
F=|f\rangle\langle f|,\quad |f\rangle=(|0\rangle+|1\rangle+|2\rangle)/\sqrt3,
\]
\[
|v\rangle=(|1\rangle+|2\rangle)/\sqrt2,
\quad D=(|0\rangle\langle0|+|v\rangle\langle v|)/2,
\quad H(v)=|0\rangle\langle v|+|v\rangle\langle0|.
\]

The actual sequence is: archive the arbitrary input with a swap; copy its $\{F,I-F\}$ filter into a fresh private bit; prepare $\chi_+=(|0\rangle+|v\rangle)/\sqrt2$; perform (S.7.4b.OC.7) after the fixed seed pulse; flip the target leaf sign conditional on the seed; then flip it conditional on the actual aggregate parity context $j=0$ and active filter. The fixed gates have explicit bounded generators $\pi\hbar(I-U)/(2d_U)$, as in the accepted construction. The aggregate parity bit is copied source-retainingly into the context control. It is not preloaded as the future scored answer.

Tracing only the designated private registers yields, on every input operator,

\[
\mathcal E_{j,y}(X)
=\operatorname{tr}(FX)
\left[D+(2j-1)\frac{c(y)}2H(v)\right]
+\operatorname{tr}[(I-F)X]D,
\]
\[
c(y)=\alpha\frac y{1+y},\qquad
L_y(X)=c(y)\operatorname{tr}(FX)H(v).
\tag{S.7.4b.OC.9}
\]

The prepared states have eigenvalues $(1+c)/2,(1-c)/2,0$, so each branch is CPTP. The output contrast is energy-off-diagonal and has trace zero. Since $H(v)$ has eigenvalues $1,-1,0$, for every density operator

\[
\frac12\|L_y(\rho)\|_1=c(y)\operatorname{tr}(F\rho)\le c(y),
\]

with equality at $\rho=F$ and the positive spectral projector. Thus

\[
\mathrm{CC}_{\rm ideal}=c(y)
=\alpha\frac{x}{C_{\rm scale}+x}.
\tag{S.7.4b.OC.10}
\]

This equality is in the original unassisted retained-target norm. It holds for all analog extension settings and at each exact original anchor. For nonzero `y`, a diagonal input produces nonzero off-diagonal contrast, so the response is not a Schur multiplier. The input archive, filter, seed, predictor, phase sector and all side records remain outside the receiver.

Removing the source encoder or the context leaf-sign interaction eliminates the context contrast. Removing the cross-component predictor interaction eliminates its parity advantage. Removing the update leaves an incorrect subsequent memory after nonzero innovation. These are direct checks of a live source-to-control-to-response path.

**OC 4. Registered parity task fixes the benefit coefficient.**

The actual current parity $j$ is uniform. Future parity agrees with it with probability $5/8$, because the two independent next innovations agree with that probability. The target-only optimal discrimination success is $(1+C_{\mathrm{eff}})/2$. Consequently its optimal future-parity forecast score is

\[
\Pr(\widehat Z=Z)
=\frac58\frac{1+C_{\rm eff}}2+
\frac38\frac{1-C_{\rm eff}}2
=\frac12+\frac18C_{\rm eff}.
\tag{S.7.4b.OC.11}
\]

The source innovations to be scored are generated only after the public forecast commitment, and the source does not send the current parity through another receiver port. With one payoff unit per correct forecast and matched random payoff subtracted,

\[
k_b=1/8\ \text{payoff unit}.
\tag{S.7.4b.OC.12}
\]

This is a task calculation, not a fitted utility coefficient. A fixed padded trial schedule permits the per-trial score convention. A payoff-rate convention multiplies both sides by the fixed trial rate and converts the tariff accordingly.

**Part II Complete maintained source and physical clock channel.**

**Source result and exact scope.**

A bounded original expected-maintenance branch can be populated by a genuinely maintained radiation source, rather than dividing a static inventory by a trial duration. The source consists of a photon-gas ball and its complete gravitating wall, with fuel and waste stores in that wall. In each occupied episode, fuel is actually depleted while photons are continuously replaced and absorbed. The sum of wall fuel, waste and structural energy is constant during the episode. The photon source and full supporting wall therefore have a static conserved stress tensor even though there is a nonzero internal resource throughput.

The conditional source law is pathwise: $E_J=\eta_{\mathrm{ret}}P_J\tau_c$ for $J=0,1$. The deterministic cost registered for a context setting is its expected operating power $P_{\mathrm{context}}=\mathbb{E}[P_J]$, not an assertion that every trial contains the mean source. Einstein's equation is solved separately for the two actual source states. Its solutions are never calculated from the ensemble-mean energy.

On the registered interpolation $y$ in $[0,1]$, choose occupied probability $p(y)=y^2/6$. With an independent fair sign register and a qutrit gap calibrated to an occupied differential phase of $2\pi/3$, all three off-diagonal response components are multiplied by

$$
M_{ij} = 1 - (3/2)p = 1 - y^{2}/4, \qquad i \ne j.
$$

Thus the generic linear-response coefficient in Theorem S.7.4a(b) is $K_R=3/(2P_{\mathrm{occ}})$, with $A=P_{\mathrm{occ}}/6$ in the $y$ variable. If original excess complexity is $x=2y$ bits and $C_{\mathrm{scale}}=2$ bits, $r_p=P_{\mathrm{occ}}/24$ watt per $\text{bit}^2$ and $A=r_pC_{\mathrm{scale}}^2=P_{\mathrm{occ}}/6$. $K_R$ is not the chronometric $K_{c}$. The source also supplies independently calculated $K_{\mathrm{time}}$ and $K_{\mathrm{eff}}$.

The model is classical Einstein gravity with an ideal classical massless radiation kinetic fluid and a causal surface material. At the displayed enormous densities it is not asserted to be a photon-only Standard Model material. No Planck thermal spectrum or quantum-equilibrium assumption is used. The target, clock controls and records retain the already admitted zero-backreaction test-service convention. Separately, the nominated test-clock matter has no direct nongravitational coupling to the source massless kinetic particles; it couples to the metric and its owned control Hamiltonians. This transparent-test-matter action is an explicit constitutive premise. Zero backreaction alone would not imply transparency, and an ordinary unshielded electromagnetic qubit in the displayed radiation would not satisfy this model. Wall, radiation, fuel and stored heat are NOT discarded as test services. No experimental manufacture or stability theorem is claimed. The finite target/source operating episode and exact static source are specified below; formation of an arbitrary stellar source from dispersed matter is not added to the target.

The actual ideal source is extremely energetic. The numerical record demonstrates nonempty mathematical calibration, not laboratory feasibility.

**SP 1. Exact occupied source, rather than an exact-uniform-density fiction.**

Use central proper time $t$, so $N(0)=1$. Let $R>0$ and $u_{0}>0$ be independently fixed. The bulk is an isotropic massless distribution with local pressure $p_{\mathrm{rad}}(r)=u(r)/3$. Its exact static Einstein equations are

$$
\begin{aligned}
m'(r) &= 4\pi r^{2} u(r)/c^{2}, \\
\nu'(r) &= G\,[m(r) + 4\pi r^{3} u(r)/(3c^{2})] \,/ \\
&\qquad [c^{2} r^{2} (1 - 2Gm(r)/(r c^{2}))], \\
u(r) &= u_0 \exp[-4\nu(r)], \qquad N(r) = \exp[\nu(r)], \\
m(0) &= 0, \qquad \nu(0) = 0.
\end{aligned}
$$

For one fixed microscopic kinetic specification, register $E_{\mathrm{kin}}=1$ center joule and $f(E_K)=C_f\,b(E_K/E_{\mathrm{kin}})$, where $b(v)=\exp[-1/((v-1)(2-v))]$ for $1<v<2$ and $b(v)=0$ otherwise. This is a smooth compact-support function, positive in the open interval; $C_{f}$ is the unique positive normalization fixing its local central energy moment to $u_0$. $E_{\mathrm{kin}}$ is a particle-distribution energy scale, not the earlier ready-resource energy scale. Every particle follows the ordinary massless geodesic flow, on which $E_K=N(r)c|p_{\mathrm{local}}|$ is conserved. The finite energy-support interval makes both number and energy densities finite; angular isotropy gives pressure $u/3$, and changing momentum variable to $E_{K}$ gives $uN^4=\text{constant}$. The gray boundary reflects its unabsorbed part and injects its absorbed fraction with exactly this invariant distribution. This is an ideal continuum kinetic realization, not a claim that discrete photon shot noise is absent from a manufactured apparatus.

The last equation follows both from the radiation equation of state in the TOV conservation equation and from the stationary massless distribution $f(E_{\mathrm{Killing}})$: local photon energies scale as $N^{-1}$, their invariant momentum volume as $N^{-3}$. The interior metric is

$$
\begin{aligned}
ds^{2} &= -N(r)^{2} c^{2}\, dt^{2} + a(r)^{-2}\, dr^{2} + r^{2}\, d\Omega^{2}, \\
a(r) &= \sqrt{1 - 2Gm(r)/(r c^{2})}.
\end{aligned}
$$

These are exact ordinary Einstein-matter equations. They are not the constant-density continuation in S.1c, whose fluid would not be an exact photon gas. Their regular solution is unique on the explicit weak-source box below.

Write $z=r/R$ and

$$
\begin{aligned}
\chi &= 8\pi G u_0 R^{2}/(3c^{4}), \\
Q &= 2\chi/(1 - \chi), \qquad h_\star = \chi/[2(1 - \chi)].
\end{aligned}
$$

For $0<\chi\le 1/16$, the solution extends to $R$ and obeys

$$
\begin{aligned}
0 &\le 2Gm(r)/(r c^{2}) \le \chi z^{2}, \\
0 &\le \nu(r) \le h_\star z^{2}, \\
\exp(-Q) &\le u(r)/u_0 \le 1, \\
\chi \exp(-Q)\, r/R^{2} &\le \nu'(r) \le \chi r/[R^{2}(1 - \chi)].
\end{aligned}
\tag{SP.1}
$$

Proof: until any proposed first singularity, $u'=-4u\nu'$ and $m'\ge 0$ imply $u\le u_0$ and hence $\text{compactness}\le\chi z^2<1$. Substituting this into $\nu'$ gives its upper bound and $\nu\le h_\star z^2$. Consequently $u\ge u_0\exp(-Q)$; inserting the latter in both positive numerator terms gives the lower bound. These a priori bounds preclude the singularity. For a fully constructive existence certificate, put $\mu(z)=3\chi\int_0^z\exp[-4\nu(t)]t^2\,dt$ and iterate the Volterra map

$$
\begin{aligned}
(T\nu)(z) = {}&(1/2) \int_0^z \\
&[\mu(t) + \chi t^{3} \exp(-4\nu(t))]/[t^{2}(1 - \mu(t)/t)]\, dt.
\end{aligned}
$$

On the closed box $0\le\nu(z)\le h_\star z^2$, it maps the box into itself. For two inputs at sup-distance $\delta$, $|\Delta\mu(t)|\le 4\chi\delta t^3$; subtraction in the integrand yields a contraction constant at most $q=2\chi/(1-\chi)^2<1$ for $\chi\le 1/16$. Therefore Banach iteration gives the unique fixed point, with uniform a posteriori error at most $q^n\lVert\nu_1-\nu_0\rVert/(1-q)$. The apparent origin quotient has continuous regular limit proportional to $t$. This also provides a certified-computable definition, with interval quadrature, for every source coefficient and the target gap. No numerical ODE output is needed to prove existence. The same bounds give $u_0\exp(-Q)V_0\le E_{\mathrm{bulk}}\le u_0V_0/\sqrt{1-\chi}$, where $V_0=4\pi R^3/3$.

No approximation has been made in the source definition. Inequalities (SP.1) are explicit error controls for its uniform weak-field comparison.

**SP 2. Complete wall, its matter model and conservation.**

At $R$ set $a_b=a(R)$, $N_b=N(R)$. Prescribe a positive proper wall energy density $\sigma$ and $s=4\pi GR\sigma/c^4$, with $b=a_b-s>0$. The exterior is

$$
\begin{aligned}
ds^{2} = {}&-C^{2}(1 - 2GM/(r c^{2}))\, c^{2}\, dt^{2} \\
&+ (1 - 2GM/(r c^{2}))^{-1}\, dr^{2} + r^{2}\, d\Omega^{2}, \\
M = {}&c^{2} R(1 - b^{2})/(2G), \qquad C = N_b/b.
\end{aligned}
$$

The entire wall has Israel surface tensor $S^a_b=\operatorname{diag}(-\sigma,p_s,p_s)$, where

$$
\begin{aligned}
p_s = {}&c^{4}/(8\pi G R) \cdot \Bigl[(1 + b^{2})/(2b) - a_b \\
&- \{Gm(R)/(R c^{2}) + 4\pi G R^{2} p_{\mathrm{rad}}(R)/c^{4}\}/a_b\Bigr].
\end{aligned}
\tag{SP.2}
$$

This includes all confinement and gravity support. There is no uncounted ideal clamp. In the dark sector $u_0=0$, $m=0,N=1,a_b=1,b=1-s$, and the same $\sigma$ has the pressure obtained from (SP.2). Both sectors therefore have identical proper wall energy but different preset elastic stresses. At weak field (SP.2) includes the required radiation tension $-p_{\mathrm{rad}}(R)R/2$; when the wall's self-gravity is larger than this term, its net surface pressure can be positive. Dropping its self-support term would be wrong.

The bulk TOV equation and the Israel junction equations imply distributional covariant conservation of the complete radiation-plus-wall tensor. More explicitly, the bulk has zero net radial energy flux; the isotropic inward and outward photon fluxes at each wall point are equal. The tangential shell conservation equation has zero net energy-flux jump. Its normal force equation is exactly (SP.2). The energy and radial momentum transferred in absorption, reflection and emission are thus present in this tensor; they are not omitted because the net energy flux happens to vanish.

An explicit local causal surface material can realize each required static stress. Let $n$ be the conserved continuum surface constituent number density, fixed at the registered $n_*=1\,\mathrm{m}^{-2}$ on the operating sphere. Let battery and heat energies per constituent be $b_{f}$ and $h_{f}$, with $b_f+h_f=e_{\mathrm{int}}$ constant during operation. Define

$$
\sigma_q(n, b_f, h_f) = A_q n^{1+w_s} + B_q + n(b_f + h_f), \qquad w_s = 1/2.
$$

For $q=\text{dark},\text{occupied}$ choose $\sigma_{\mathrm{el},*}=\sigma-n_*e_{\mathrm{int}}$ and

$$
\begin{aligned}
A_q n_*^{1+w_s} &= (\sigma_{\mathrm{el},*} + p_{s,q})/(1 + w_s), \\
B_q &= (w_s \sigma_{\mathrm{el},*} - p_{s,q})/(1 + w_s).
\end{aligned}
$$

Then $\sigma_q(n_*)=\sigma$ and $p_q=n\,d(\sigma_q)/dn-\sigma_q=p_{s,q}$. If $\sigma_{\mathrm{el},*}>|p_{s,q}|$ and the displayed $B_{q}$ is positive, $A_q,B_q>0$. Along each fixed internal-energy branch its sound speed satisfies

$$
\begin{aligned}
0 < {}&dp_q/d\sigma_q \\
&= w_s (1 + w_s) A_q n^{w_s} / \\
&\qquad [(1 + w_s) A_q n^{w_s} + e_{\mathrm{int}}] < 1/2.
\end{aligned}
$$

For the numerical source below, these constitutive parameters can be certified without a numerical ODE: since $1-\chi\le a_b\le 1$ and $1-s-\chi\le b\le 1-s$, monotonicity of $F(b)=(1+b^2)/(2b)$ gives

$$
\begin{aligned}
&2933/319968 < p_{s,\mathrm{occupied}}/\sigma < 179999/15358400, \\
&p_{s,\mathrm{dark}}/\sigma = 1/96.
\end{aligned}
$$

Both are between 0 and 0.02. The internal-energy allocation is exactly $\sigma/2$, so $\sigma_{\mathrm{el},*}=\sigma/2$, and the strict positivity of $A_q,B_q$ and all causal inequalities follow. These two sectors can equivalently be put in one fixed two-state constitutive action $\sigma(n,q,b_f,h_f)$, with $q$ in $\{0,1\}$; the source selector chooses its registered sector before the run.

The material is locally causal and has positive inertial energy. The internal battery/heat populations do not change its pressure when their total energy is conserved. The selector q specifies two prestress/material sectors, as the static source of Theorem S.1c also supplies sectorwise material data. It is preset before interrogation, recorded and not inferred from a fitted response. This proves existence of the required on-shell material points; it does not prove radial dynamical stability, which is not a new target condition.

**SP 3. Real maintenance flow and its energy units.**

Fix a boundary absorptivity $\epsilon$ in (0,1], and a fixed electro-optical efficiency $\zeta$ in (0,1]. The wall returns the unabsorbed radiation elastically. At each wall point its inward replacement radiance is $\epsilon$ times the invariant occupied radiance. For an isotropic distribution,

$$
\begin{aligned}
\int_{\mathrm{inward}} |\cos(\theta)|\, d\Omega &= \pi, \\
u_b &= (1/c) \int_{4\pi} I_b\, d\Omega = 4\pi I_b/c.
\end{aligned}
$$

Consequently the actual absorbed and replaced radiant powers, measured locally at the wall, are equal to

$$
P_{\gamma,b} = \epsilon c\, (4\pi R^{2})\, u_b/4.
\tag{SP.3}
$$

The local fuel-power debit is $P_{\gamma,b}/\zeta$. Its inefficiency heat is $(1/\zeta-1)P_{\gamma,b}$; absorption adds $P_{\gamma,b}$. Thus total local heat gain is $P_{\gamma,b}/\zeta$, exactly the local fuel loss. The structural wall energy and the sum of fuel plus heat stay fixed at every surface point. Actual fuel is continuously consumed. This is not a tariff for owning a stationary radiation inventory.

One boundary photon of local energy $e_{b}$ has center-normalized conserved energy $N_be_b$; wall proper time obeys $d\tau_b=N_b\,dt$. Accordingly the actual occupied maintenance power in center joules per center second is

$$
P_{\mathrm{occ}} = N_b^{2} P_{\gamma,b}/\zeta.
\tag{SP.4}
$$

Both lapse factors are required. Omitting one is a unit error.

Keep the three energy quantities separate:

$$
\begin{aligned}
E_{\mathrm{bulk}} &= 4\pi \int_0^R u(r)\, r^{2}/a(r)\, dr, \qquad \text{proper material holding;} \\
E_K &= 4\pi \int_0^R N(r) u(r)\, r^{2}/a(r)\, dr, \qquad \text{center Killing photon holding;} \\
E_{\mathrm{wall}} &= 4\pi R^{2} \sigma, \qquad \text{proper wall holding.}
\end{aligned}
$$

In particular $E_{\mathrm{bulk}}\le E_K\le\exp(h_\star)E_{\mathrm{bulk}}$. They are not interchangeable. The exact radiation residence time in center seconds is

$$
\tau_{\mathrm{res},K} = E_K/[N_b^{2} P_{\gamma,b}].
\tag{SP.5}
$$

Equation (SP.5) is also the stationary occupation/throughput identity: integrate the center-conserved energy of each emitted ray over its residence interval, then interchange the time and ray integrals. This establishes the inventory-flow law from actual transport. In flat space it reduces directly to 4R/(3 $\epsilon$ c); it is not chosen as an objective-dependent holding period.

The actual numerical branch uses $\epsilon=1$, so no photons have a reflection-induced unbounded residence tail. To prove a finite exit time, set $w(r)=r/N(r)$ and $d_*=\chi/(1-\chi)$. Equation (SP.1) gives $r\nu'(r)\le d_*<1$, hence $w'(r)=(1-r\nu')/N>0$. A null ray of impact parameter $\ell$ has, between its turning point $w=\ell$ and the wall,

$$
dt/dw = 1/[c\, a(r)(1 - r\nu'(r))\sqrt{1 - \ell^{2}/w^{2}}].
$$

Integrating twice and bounding $a\ge\sqrt{1-\chi}$, $1-r\nu'\ge 1-d_*$ gives

$$
\begin{aligned}
t_{\mathrm{flight}} &\le 2R/[c\sqrt{1 - \chi}\,(1 - d_*)] \\
&= 2R\sqrt{1 - \chi}/[c(1 - 2\chi)] < 2.001\, R/c.
\end{aligned}
\tag{SP.5a}
$$

There are no trapped rays because w is strictly increasing. Perfect boundary absorption ends every ray on its first return. The phase protocol begins at least 25 R/c after maintenance starts, so every retained photon during its phase window was supplied by actual ongoing maintenance, rather than surviving as an uncharged initial inventory. At the phase-window end all retained photons were supplied during that same $\tau_{c}$ window. Equation (SP.5) therefore has a genuine finite-window retained-input interpretation in the conserved-energy convention; it is not merely an infinite-time average that hides a residual preparation tail.

The full gravitational ledger also contains M and C. An independent identity for the total center-normalized Komar energy is

$$
C M c^{2} = 2E_K + N_b (4\pi R^{2})(\sigma + 2p_s).
\tag{SP.6}
$$

It follows from the exact static Einstein equations, including the shell. The ADM mass is M with infinity-normalized time; the central normalization has factor C. These are alternative total-energy descriptions. A binding correction can be defined relative to a specified material-energy inventory, but must not be supplied or charged a second time.

The original S.6 proper bulk holding is used for the retained-source coefficient below. It is not relabeled as Killing or ADM energy. Define $\eta_{\mathrm{ret}}$ from the independently determined proper inventory, actual center power and an independently fixed operating clock duration:

$$
\eta_{\mathrm{ret}} = E_{\mathrm{bulk}}/(P_{\mathrm{occ}} \tau_c).
\tag{SP.7}
$$

In terms of the conserved-energy flow record it is exactly

$$
\begin{aligned}
\eta_{\mathrm{ret}} &= \zeta\, (E_{\mathrm{bulk}}/E_K)(\tau_{\mathrm{res},K}/\tau_c), \\
\eta_K &= \zeta\, \tau_{\mathrm{res},K}/\tau_c, \\
E_K &= \eta_K P_{\mathrm{occ}} \tau_c, \qquad E_{\mathrm{bulk}} = (E_{\mathrm{bulk}}/E_K) E_K.
\end{aligned}
$$

Thus $\eta_{\mathrm{ret}}$ is a proper-holding calibration combining retention time and the explicit redshift conversion. It is not called a literal fraction of center-supplied energy; $\eta_{K}$ is the corresponding coefficient in that single conserved-energy convention. Equation (SP.7) is now an evaluated calibration, since all terms on its right are fixed by equations (SP.1)-(SP.4) and the independently chosen clock duration. We verify $0<\eta_{\mathrm{ret}}\le 1$ below. This is not a proof that every source or arbitrary time window obeys S.6; it populates one registered branch. The proper-energy/Killing-energy conversion is explicit, so neither local deposition energy nor wall debits are confused with $E_{\mathrm{bulk}}$.

The full proper bulk volume $V_{\mathrm{prop}}=4\pi\int r^2/a\,dr$ and its mean energy density $\bar{u}=E_{\mathrm{bulk}}/V_{\mathrm{prop}}$ satisfy the exact averaged S.6 law $\bar{u}=\eta_{\mathrm{ret}}P_{\mathrm{occ}}\tau_c/V_{\mathrm{prop}}$. The actual local profile is not constant: it is supplied by the TOV solution. S.16-S.20 are used only as the controlled uniform-source leading approximation. An exact photon source must not be called exactly uniform merely to copy those equations.

**SP 4. A fixed nonempty record with capacity and timing.**

Register, before choosing any utility optimum,

$$
\begin{aligned}
&R = 1\ \mathrm{m}, \quad \chi = 1/10000, \quad s = 1/25, \\
&\epsilon = 1, \quad \zeta = 1/2, \\
&\tau_c = 100\, R/c, \\
&r_1 = R/2, \quad r_2 = 51R/100.
\end{aligned}
$$

The central density is $u_0=3c^4\chi/(8\pi GR^2)$. The radiation equation of state, material coefficients, boundary loss, conversion efficiency and geometry are independent apparatus inputs. Constant conversion efficiency and ideal isotropic linear boundary emission are constitutive service ratings on this finite episode; they are not deduced from gravity. They can be replaced by bounded calibration intervals using SP §8.

Let $f_E=E_{\mathrm{bulk}}/(u_0V_0)$. Equations (SP.3)-(SP.4) and the selected duration give

$$
\begin{aligned}
\eta_{\mathrm{ret}} &= [4\zeta/(300\epsilon)]\, f_E N_b^{2}, \\
[4\zeta/(300\epsilon)] \exp(-Q) \\
&\le \eta_{\mathrm{ret}} \le [4\zeta/(300\epsilon)] \exp(2h_\star)/\sqrt{1 - \chi}.
\end{aligned}
\tag{SP.8}
$$

Numerically the rigorous elementary interval is

$$
0.00666533333333 < \eta_{\mathrm{ret}} < 0.00666766682503 < 1.
$$

Since $E_{\mathrm{bulk}}\le E_K\le\exp(h_\star)E_{\mathrm{bulk}}$, the conserved-energy coefficient is independently bounded by

$$
\begin{aligned}
&0.00666533333333 < \eta_K < 0.00666800025005 < 1, \\
&\exp(-h_\star) \le E_{\mathrm{bulk}}/E_K \le 1.
\end{aligned}
$$

For the fixed record, $E_{\mathrm{wall}}/(u_0V_0)=2s/\chi=800$ exactly. The local fuel debit for an occupied source-on duration $H_{\mathrm{on}}\le 2\tau_c$ is

$$
\begin{aligned}
E_{\mathrm{fuel,local}} &= P_{\mathrm{occ}} H_{\mathrm{on}}/N_b \\
&\le 2P_{\mathrm{occ}} \tau_c \\
&= (300\epsilon/(2\zeta))\, u_0 V_0/N_b^{2} \\
&\le 300\, u_0 V_0.
\end{aligned}
$$

Allocate $400\,u_0V_0$ of the proper wall energy to the common internal fuel-plus-heat sector and $400\,u_0V_0$ to the elastic/rest structure. Initially the internal sector includes at least $300\,u_0V_0$ of available fuel and a heat store with adequate entropy capacity; it ends with the same total internal energy, redistributed into heat. Thus there is an actual finite gravitating fuel supply and waste capacity for the complete occupied episode. The numerical $p_s/\sigma$ ratios are about 0.009818 occupied and 0.010417 dark; both are far below the half-wall structural energy fraction, so the material inequalities in SP §2 hold.

The source-on episode is short: at most about 6.672e-7 center seconds, of which $\tau_{c}$ is the actual phase interrogation. Live prediction, the occupancy decision, initial preparation and deployment may precede it; target gaps are switched off before and after the registered phase exposure. SP §6 supplies the explicit finite ramp, gate and transport schedule. Signal transit times across this weak-field meter-scale source are finite. There is room for many light-crossing times in the factor-100 duration. If a proposed implementation needs a longer source-on interval, this wall capacity must be increased or that proposal is outside this numerical record.

The source-on episode begins with the prepared static invariant photon distribution and its matched elastic shell. Its preparation record supplies the source initial data and the corresponding complete material/geometry energy, including initial radiation fill and binding; it is not inferred from the utility optimum. Formation of the static source is a ready-source preparation input, as in the ready-source branch of Theorem S.1c. The derivation here concerns its real finite maintenance flow. This distinction matters: no finite-time convergence of an arbitrary unprepared cavity to exact TOV equilibrium is claimed.

Complete ownership list:

1. Gravitating source: radiation, entire elastic wall, on-wall emitter/absorber energy, on-wall battery and stored waste heat. Their total wall energy is included once in $\sigma$; heat is not an additional outside source term.
2. Gravitational binding: included through the exact metric and M, with conversion (SP.6). It is not an independent power input.
3. Source preparation: external initial material/geometry preparation work and initial radiation fill, in its own finite startup record. This is not divided by $\tau_{c}$ to manufacture a maintenance coefficient.
4. Test services: live predictor hardware, archive, source selection/switching controls, target clock/gap/phase gates, retained private random signs and the final readout. Their actual finite supplied energy and heat are retained in a separate baseline service record under the inherited zero-backreaction convention. Padding or ballast makes their baseline power setting-independent if that is required by the selected cost comparison.
5. Post-episode: no cyclic-reset or free erasure claim. Spent battery, heat, source selection and sign records remain. If drained, photons are routed to a retained heat/output record and that energy is recorded. Recharging or rebuilding the source is a separate preparation operation.

The fuel ledger uses initial available fuel minus final available fuel as the work debit. Loading a battery and then consuming the same stored work are not two independent physical-energy charges. Heat gain is the destination of that work, not a second work charge. The closed gravitating energy stays constant while usable fuel/free energy decreases. Initial radiation/material/geometry preparation is a distinct source-startup entry; any unused preparation capacity and ballast must be separately recorded if a comparison supplies equal startup capacity.

A claim about total acquisition cost would have to price item 3 as well. The original objective here prices actual operating maintenance power, as Appendix S does. Equal supplied capacity is not being passed off as consumed maintenance.

**SP 5. Exact clocks and their original weak-field calibration.**

Stationary source sectors admit static clock ratios. Trigger pairs separated by $\tau_{c}$ in center time produce local proper-time separations $\tau_cN(r_i)$. Their occupied differential slip is

$$
\delta\tau_{\mathrm{occ}} = \tau_c [N(r_2) - N(r_1)] > 0.
\tag{SP.9}
$$

The dark source has constant interior lapse $N=1$ and zero differential slip. The static wall contributes a common lapse in infinity-normalized coordinates, and is fully present in the metric; central normalization and an interior differential remove that common factor without deleting wall gravity.

Let $D=(r_2^2-r_1^2)/R^2=101/10000$. The bounds (SP.1) imply

$$
\begin{aligned}
&d_0 \exp(-Q) \le \delta\tau_{\mathrm{occ}} \le d_0 \exp(h_\star)/(1 - \chi), \\
&d_0 = \tau_c \chi D/2.
\end{aligned}
\tag{SP.10}
$$

This gives an explicit positive calibration interval, not only a floating-point root. Define

$$
\begin{aligned}
K_{\mathrm{time}} &= \delta\tau_{\mathrm{occ}}/P_{\mathrm{occ}}, \\
K_{\mathrm{eff}} &= K_{\mathrm{time}}/\tau_c.
\end{aligned}
\tag{SP.11}
$$

For $J=0,1$, both $\delta\tau_J=K_{\mathrm{time}}P_J$ and $E_J=\eta_{\mathrm{ret}}P_J\tau_c$ hold exactly, with $P_J=JP_{\mathrm{occ}}$ and $E_J=JE_{\mathrm{bulk}}$. Their expectations satisfy the same linear equations. On a continuum of varying occupied intensities the exact photon TOV relation is not globally linear; the implemented context continuum is a mixture of these fixed actual sectors.

For comparison with the original nominal uniform-fluid branch, use $V_{0}$ and $\bar{u}_0=E_{\mathrm{bulk}}/V_0$. With $Q_{\mathrm{geo}}=r_1(r_2-r_1)+(r_2-r_1)^2/2$,

$$
K_{\mathrm{time,finite}}^{(S)} = (8\pi G/(3c^{4}))\, \eta_{\mathrm{ret}} \tau_c^{2} Q_{\mathrm{geo}}/V_0.
$$

Equations (SP.1) imply the explicit multiplicative comparison

$$
\begin{aligned}
\sqrt{1 - \chi} \exp(-Q) \\
&\le K_{\mathrm{time}}/K_{\mathrm{time,finite}}^{(S)} \\
&\le \exp(Q + h_\star)/(1 - \chi).
\end{aligned}
\tag{SP.12}
$$

Thus the exact two-sector transfer populates the finite-separation continuation of the original retained-source coefficient with a controlled weak-field relative discrepancy below 0.000351 for this registered source. If $V_{\mathrm{prop}}$ rather than $V_{0}$ is used, the additional volume factor is between 1 and 1/sqrt(1-chi) and is retained explicitly.

For the original S.19 linear-gradient coefficient on this selected record, use

$$
\begin{aligned}
r_1(r_2 - r_1) &= R^{2}/200, \qquad Q_{\mathrm{geo}} = 101R^{2}/20000, \\
K_{\mathrm{time,gradient}}^{(S)} &= (8\pi G/(3c^{4}))\, \eta_{\mathrm{ret}} \tau_c^{2} [R^{2}/200]/V_0.
\end{aligned}
$$

The spatial remainder divided by the retained gradient is exactly $(r_2-r_1)/(2r_1)=1/100$, so $K_{\mathrm{time,finite}}^{(S)}=(101/100)K_{\mathrm{time,gradient}}^{(S)}$. Combining this exact spatial factor with (SP.12) gives

$$
\begin{aligned}
(101/100)\sqrt{1 - \chi} \exp(-Q) \\
&\le K_{\mathrm{time}}/K_{\mathrm{time,gradient}}^{(S)} \\
&\le (101/100) \exp(Q + h_\star)/(1 - \chi).
\end{aligned}
$$

In particular the original positive S.19 gradient coefficient is populated, with a rigorous total relative approximation error bounded by

$$
(101/100) \exp(Q + h_\star)/(1 - \chi) - 1 < 0.010354.
$$

The bound includes the 1% finite-separation error and the exact radiation-source weak-field remainder in the registered Euclidean nominal volume convention. If the proper-volume S.6 density is inserted directly instead, retain the additional explicit factor $V_{\mathrm{prop}}/V_0$ in $[1,1/\sqrt{1-\chi}]$; it must not be silently dropped. The exact clock coefficient (SP.11) and exact noise construction below do not use either approximation.

**SP 6. Same-source qutrit noise, without a Cauchy assumption.**

The actual carrier is a distributed, coherently encoded qutrit. At the center, introduce two local three-level registers $A,B$ with the same switchable gap $\Delta=\hbar\omega$, and encode the receiver qutrit using the fixed isometry

$$
W|k\rangle = |2-k\rangle_A |k\rangle_B, \qquad k = 0,1,2.
$$

Both registers have local Hamiltonian $\operatorname{diag}(0,\Delta,2\Delta)$ when on; all three levels are degenerate when off. One explicit reversible extension uses co-located center registers $T,A,B$, initially $|k\rangle_T|0\rangle_A|0\rangle_B$: set $A:=2-T$, $B:=T$, then $T:=T-B$, all modulo 3, to obtain $|0\rangle_T|2-k\rangle_A|k\rangle_B$. Reversing this three-register word decodes. Each controlled modular addition is a finite local unitary at the center; no instantaneous nonlocal gate is used. This finite-dimensional unitary, its inverse and the finite target preparation/effect gates are supplied by explicit finite-duration test Hamiltonians. For example, any fixed finite unitary $U=e^{-iK}$ can be run in duration $d_{\mathrm{gate}}$ using $H_{\mathrm{gate}}=\hbar K/d_{\mathrm{gate}}$, with the principal-log choice $\lVert K\rVert\le\pi$. This supplies a finite service norm and energy record; it does not give those services zero resource cost.

The registers are deployed with their gaps off to $r_{1}$ and $r_{2}$, held there during interrogation, and returned with their gaps off. Ordinary radial timelike transport with speed $c/4$ relative to static local observers suffices. Its travel time is at most $4R/[c\sqrt{1-\chi}]$ per one-way deployment. All work, rest energies, supports and transport records are test-service owners under the admitted zero-backreaction convention. The stationary support accelerations and transport energies are finite on (SP.1).

For exact finite ramp timing, use $h(v)=3v^2-2v^3$ on $0\le v\le 1$ and $d=R/(10c)$ local seconds. The center sends two trigger signals separated by $\tau_{c}$ center seconds. At site $i$ the first trigger starts the upward gap ramp $\Delta\,h(s/d)$; the second starts its time-reversed downward ramp. Each ramp has area $d/2$, and the plateau between them has length $\tau_cN_i-d$. Thus the total local gap exposure is exactly $\Delta\tau_cN_i$, not an instantaneous-pulse approximation. Radial null propagation satisfies

$$
D_i = \int_0^{r_i} dr/[c\, N(r) a(r)] \le R/[c\sqrt{1 - \chi}].
$$

The same delay for the first and second triggers is automatic in the static source. The two sites therefore acquire the unitary

$$
\begin{aligned}
W^{\dagger} \exp[-i\omega\tau_c(N_1 n_A + N_2 n_B)]\, W \\
&= \exp[-2i\omega\tau_c N_1]\, \operatorname{diag}(1, e^{-i\phi}, e^{-2i\phi}), \\
\phi &= \omega\tau_c(N_2 - N_1).
\end{aligned}
$$

The prefactor is a global phase. No correction knows the source label. In the dark sector $N_1=N_2=1$, so the entire action is a global phase. The output is decoded at the center back into the actual receiver qutrit with fixed output Hamiltonian $H_{\mathrm{out}}=\operatorname{diag}(0,\Delta,2\Delta)$. Its energy labels, and hence the response off-diagonal basis, are fixed even when the propagation subspace happens to be degenerate in the dark sector.

Choose the independent target calibration

$$
\omega = 2\pi/(3\, \delta\tau_{\mathrm{occ}}),
\tag{SP.13}
$$

where $\delta\tau_{\mathrm{occ}}$ is the strictly positive source/geometry functional (SP.9). This is a finite computable calibration, with the interval from (SP.10), chosen before a utility optimizer. A sign register $S=+1,-1$ is sampled fairly and independently of context and source occupancy. For $S=-1$, exchange logical levels 0 and 2 before encoding and after decoding. Conjugating $\operatorname{diag}(0,1,2)$ by that exchange gives $2I-\operatorname{diag}(0,1,2)$, so it reverses $\phi$ up to a global phase. This sign reversal also needs no source-label-dependent compensation.

An explicit center-time aperture is as follows. Keep the occupied radiation maintained for $0\le t\le 2\tau_c$. Finish at most 512 elementary preparation/control gates, each of duration $\tau_c/4096$, and the outward deployment before $t=\tau_c/4$. This fits because the full gate allowance is $\tau_c/8$ and one-way travel is less than $0.04001\tau_c$. Send the first central trigger at $\tau_c/4$ and the second at $5\tau_c/4$. The last downward ramp ends before $1.262\tau_c$. Return the two gap-off registers before $1.301003\tau_c$ and store both gap-off until the common central decoding slot at $1.31\tau_c$. Run decoding, sign correction, identical output-Hamiltonian evolution and the fixed measurement on the same central-time schedule in every sector. A further full $\tau_c/8$ gate allowance ends at $1.435\tau_c$, before $1.5\tau_c$. Pad all sectors and outcomes to the same target-only forecast release $t=3\tau_c/2$ and the same trial-close $t=2\tau_c$; neither timestamp reveals the source sector. The source fuel budget already covers that full aperture. The finite primitive list can be allotted at most 512 total slots across setup and readout/update; even allowing a full 512-slot upper allowance in each timing inequality above gives a conservative schedule. Release the target-only current-parity forecast at $3\tau_c/2$, sample the independently scheduled future innovations at $8\tau_c/5$, and complete update and scoring by $19\tau_c/10$. The final $2\tau_c$ release is the common trial close. Thus the predicted innovations are strictly later than the forecast; nothing imports the earlier 400-second schedule.

The source label, independent sign, deployment records and source states remain outside the receiver. The qutrit state is decoded into the target and only the fixed forecast release label is public to the target receiver (the trial-close bookkeeping also has a fixed, sector-independent time). Later gap-off storage does not add a source-dependent relative phase. For an explicit finite baseline service rating, choose each deployed carrier rest mass $10^{-26}$ kg, local gap and gate norms as specified above, at most 512 gate slots, and no more than $10^{-9}$ J of supplied work per gate or transport-control slot. These finite ratings greatly exceed $\hbar\pi/d_{\mathrm{gate}}$ and the carrier kinetic-energy scale at $c/4$. Also register bounded smooth pulse profiles: every one of at most 512 simultaneously active test services, including the continuously operating divider, analog controls, transport actuators, clocks and detectors, draws between 0 and $10^6$ center W. The per-slot energy bound and the peak-power bound are distinct service inputs; neither is inferred from the other. Then $0\le P_{\mathrm{ctrl}}(t)\le 512\times 10^6\,\mathrm{W}<10^9\,\mathrm{W}$ pointwise. A constant center test-service supply $P_B=10^9$ W over $H_{\mathrm{on}}=2\tau_c$ therefore has the genuinely nonnegative ballast load $P_B-P_{\mathrm{ctrl}}(t)$, with finite heat storage. Its consumed baseline work $P_BH_{\mathrm{on}}$ and all residual stores/records are retained once in the test ledger. It is setting-independent and cancels from the incremental maintenance objective. This is the already admitted test-service constitutive convention, with finite energy and exactly zero background backreaction, not a claim that these services literally have no energy.

The ideal differential channel is therefore a physical retained-target map, not a postselected phase statistic.

Conditional channel:

$$
\begin{aligned}
U_{J,S} &= \operatorname{diag}(1, \exp[-iJS\phi], \exp[-2iJS\phi]), \\
\phi &= 2\pi/3.
\end{aligned}
$$

With $\Pr(J=1)=p$ and $\Pr(S=+1\mid J)=\Pr(S=-1\mid J)=1/2$,

$$
M_{ij} = 1 - p + p\cos[(i - j)\phi].
\tag{SP.14}
$$

The channel is exactly a finite mixture of unitaries, hence CPTP; its correlation matrix is positive semidefinite by construction. Since $\cos(\phi)=\cos(2\phi)=-1/2$, $M_{ii}=1$ and $M_{ij}=1-3p/2$ for every $i\ne j$. On $p=y^2/6\le 1/6$ the factor belongs to $[3/4,1]$. Every energy-off-diagonal response tensor, including the accepted non-Schur star family, is multiplied by this same scalar. Its unassisted operational norm therefore equals

$$
\begin{aligned}
C_{\mathrm{eff}} &= (1 - 3p/2)\, C_{\mathrm{ideal}} \\
&= (1 - K_R P_{\mathrm{context}})\, C_{\mathrm{ideal}}, \\
P_{\mathrm{context}} &= p\, P_{\mathrm{occ}}, \qquad K_R = 3/(2P_{\mathrm{occ}}).
\end{aligned}
\tag{SP.15}
$$

This establishes the selected exact original linear-response branch on the bounded interpolation, rather than forcing an exponential law on bounded source noise.

Important nonidentification:

$$
\begin{aligned}
\omega K_{\mathrm{time}} &= 2\pi/(3P_{\mathrm{occ}}), \\
K_R &= 3/(2P_{\mathrm{occ}}), \\
K_R/(\omega K_{\mathrm{time}}) &= 9/(4\pi) \ne 1.
\end{aligned}
\tag{SP.16}
$$

So $K_{R}$ is the generic K of the linear objective in S.7.4a(b), while $K_{\mathrm{time}}$ and $K_{\mathrm{eff}}$ are its source clock coefficients. Calling $K_{R}$ the saturated chronometric $K_{c}$ would be false. No chronometric saturation, Cauchy distribution, independent-increment semigroup or exponential response is asserted.

**SP 7. Numeric population and reproducibility.**

The numerical solution of the dimensionless exact TOV system is diagnostic; its analytic source and enclosure proof is given in Theorem S.7.4b, parts II and IV. Its numerical decimals are not substituted for the analytic certification intervals (SP.8),(SP.10),(SP.12). The formal SI values used here are
\[
c=299792458,\qquad G=6.67430\times10^{-11},\qquad
\hbar=\frac{6.62607015\times10^{-34}}{2\pi},\qquad
1\,\mathrm{eV}=1.602176634\times10^{-19}\,\mathrm J.
\]
These are fixed nominal inputs to this mathematical preparation. An empirical uncertainty assigned to $G$ propagates through the same displayed formulas. The analytic bounds in parts II and IV supply the certificate; the approximate values below are derived evaluations of that source.

For the registered record, approximate values are:

$$
\begin{aligned}
u_0 &= 1.4446361660 \times 10^{39}\ \mathrm{J/m^{3}}, \\
E_{\mathrm{bulk}} &= 6.0507332423 \times 10^{39}\ \mathrm{J}, \\
E_K &= 6.0509147606 \times 10^{39}\ \text{center J}, \\
E_{\mathrm{wall}} &= 4.8410222574 \times 10^{42}\ \text{local wall J}, \\
P_{\mathrm{occ}} &= 2.7209190810 \times 10^{48}\ \text{center W}, \\
\tau_c &= 3.3356409520 \times 10^{-7}\ \text{center s}, \\
\eta_{\mathrm{ret}} &= 0.00666673332595, \\
\eta_K &= 0.00666693332381, \\
E_{\mathrm{bulk}}/E_K &= 0.99997000152137, \\
\delta\tau_{\mathrm{occ}} &= 1.6844943841 \times 10^{-13}\ \mathrm{s}, \\
\omega &= 1.2433375392 \times 10^{13}\ \mathrm{rad/s}, \\
\Delta &= 8.1837963484 \times 10^{-3}\ \mathrm{eV}, \\
K_{\mathrm{time}} &= 6.1909021695 \times 10^{-62}\ \mathrm{s/W}, \\
K_{\mathrm{time,gradient}}^{(S)} &= 6.1290701133 \times 10^{-62}\ \mathrm{s/W}, \\
K_{\mathrm{eff}} &= 1.8559857786 \times 10^{-55}\ \mathrm{/W}, \\
K_R &= 5.5128431069 \times 10^{-49}\ \mathrm{/W}, \\
A &= P_{\mathrm{occ}}/6 = 4.5348651349 \times 10^{47}\ \mathrm{W}, \\
r_p &= P_{\mathrm{occ}}/24 = 1.1337162837 \times 10^{47}\ \mathrm{W/bit^{2}}.
\end{aligned}
$$

Rigorous positive clock intervals from the elementary inequalities are

$$
\begin{aligned}
1.68416178101 \times 10^{-13} &< \delta\tau_{\mathrm{occ}} < 1.68475139136 \times 10^{-13}\ \mathrm{s}, \\
1.24314786925 \times 10^{13} &< \omega < 1.24358308448 \times 10^{13}\ \mathrm{rad/s}.
\end{aligned}
$$

The maximum local fuel debit for one $\tau_{c}$ is about 9.0755553380e41 J, whereas total proper wall energy is about 4.8410222574e42 J. Two occupied windows fit within the allocated half-wall internal energy sector. This verifies the finite capacity claim; the immense values also make clear why this is a formal source witness.

**SP 8. Perturbation and control errors.**

The exact ideal prediction is equation (SP.15). Registered implementation errors enter quantitatively:

- If $p$ changes to $p'$ and occupied phase $\phi$ changes to $\phi+e_\phi$, then for edge gap $d=1,2$,

  $$
  |M'_d-M_d| \le (3/2)|p'-p| + p' d |e_\phi|.
  $$

  This follows by subtracting $1-p+p\cos(d\phi)$ and using the cosine Lipschitz bound. Unequal sign probabilities add at most $2p'|e_S|$, where $e_{S}$ is their deviation from 1/2. For nonuniform edge errors, use the accepted finite-tensor perturbation certificate rather than pretending there is still one scalar attenuation.

- An independently calibrated gap/exposure/source error gives

  $$
  \begin{aligned}
  |e_\phi| &\le |\delta_\tau| e_\omega + |\omega| e_{\delta_\tau} \\
  &\quad + e_\omega e_{\delta_\tau},
  \end{aligned}
  $$

  with $e_{\delta\tau}$ bounded by the source ODE interval, radius/timing calibration and any numerical enclosure.

- Maintenance errors are not hidden inside an energy tariff. For measured $P'$ and $E'$ at fixed $\tau$, $\eta'=E'/(P'\tau)$. If $|P'-P|\le e_P<P$ and $|E'-E|\le e_E$, then

  $$
  \begin{aligned}
  |\eta'-\eta| &\le e_E/[(P-e_P)\tau] \\
  &\quad + E e_P/[P(P-e_P)\tau].
  \end{aligned}
  $$

- For a specified complete tensor error $\delta$ T in the leading weak-field comparison, the potential-difference error is bounded directly by

  $$
  \begin{aligned}
  |\delta(\Phi(r_2)-\Phi(r_1))| \\
  &\le (G/c^2) \int |\delta T_{00}+\sum_i \delta T_{ii}|(y) \\
  &\quad |1/|r_2-y|-1/|r_1-y||\, d^3y,
  \end{aligned}
  $$

  including distributional wall contributions. Multiplying by $\tau_c/c^2$ gives the leading clock error. This makes an actual finite-emitter/angular-discretization certificate possible; it is not assumed to vanish for an unspecified manufactured cavity.

- Finite control/readout instrument errors are added via trace-norm contractivity and telescoping. Source mixture weights are compared once per held-label history; repeated private controls do not create independently redrawn gravitational sectors unless the protocol explicitly says so.

The rigorous elementary clock interval is already sufficient to select a finite gap and bound any residual attenuation mismatch. Exact ideal calibration (SP.13) is a computable real defined by the unique source ODE. To claim a narrow manufactured calibration interval, provide the corresponding independent calibration records, rather than quoting the ideal decimal as a measurement.

**SP 9. Primary-source cross-checks.**

The derivation above is self-contained. Its radiative transport premise is consistent with the standard isotropic-illumination mean-path invariant and its refractive-index qualifications. Useful primary references are:

- Savo et al. (2017); the experiment and transport derivation concern the mean path under isotropic illumination. The present ball has no refractive-index mismatch and its flux/inventory calculation is displayed directly.
- Tommasi et al. (2020) supports the importance of stating the boundary illumination and index assumptions, rather than universally assigning $4V/S$ to arbitrary optics.
- Tolman and Ehrenfest (1930). The source's $uN^4$ relation is derived above directly from its stationary kinetic distribution and conservation; this reference supplies primary context, not a substitute for that derivation.

Source-internal controlling text: Appendix S, S.6, S.16-S.20, S.1b, the explicit distinctions in S.1c, S.7.3c, and the generic linear law in S.7.4a(b). The review does not require a Cauchy law for this finite mixture. The composition in this report preserves the distinction between original program-complexity anchors, their admitted real interpolation, expected maintenance cost, pathwise source states, and any separate capital-resource preference.

**Part III Original operating objective and rigorous limits.**

**OC 5. Instantiated maintenance and retained-source composition.**

The complete source in Part II instantiates the actual-flow requirement. Set \(E_0=E_{\rm bulk}\), use the center-energy maintenance power of (SP.4), and keep the fixed \(\tau_c=100R/c_{\rm light}\). The literal conserved-energy residence identity and its proper-holding conversion give
\[
E_K=\eta_KP_{\rm occ}\tau_c,\qquad
E_0=\eta_{\rm ret}P_{\rm occ}\tau_c,\qquad
\eta_{\rm ret}=\frac{E_{\rm bulk}}{E_K}\eta_K
=\zeta\frac{E_{\rm bulk}}{E_K}\frac{\tau_{\rm res,K}}{\tau_c}\in(0,1).
\tag{S.7.4b.OC.13}
\]
This is derived from fuel depletion, boundary photon replacement, finite residence and the full gravitational/source record. It is not stationary capital divided by a selected trial horizon. Proper material energy, center Killing energy and ADM/Komar quantities remain distinct.

Draw \(J\in\{0,1\}\) once with \(p(y)=\Pr(J=1)=y^2/6\), and an independent fair \(S\in\{-1,+1\}\). Both labels are held privately during the episode and are independent of the aggregate parity \(j\), source innovations and arbitrary target input. Equivalently the phase-history probabilities are
\[
\Pr(J=0)=1-p,\qquad\Pr(J=1,S=+1)=\Pr(J=1,S=-1)=p/2.
\tag{S.7.4b.OC.14}
\]
A normalized selector applies \(\exp[-i\arcsin(y/\sqrt6)Y]\) to a fresh private \(\lvert0\rangle\) qubit. The resulting amplitudes are \(\sqrt{1-p},\sqrt p\); a basis instrument records its occupation outcome and selects the corresponding ready source/material sector. An independent Hadamard coin supplies the fair sign, with both records retained and all preparation pulses included in the baseline or the separately declared ready-source preparation record. This is a finite bounded test-control law on the closed interval. The source-sector ready preparation and its initial material/geometry energy are accounted separately; the operation is not an instantaneous conversion of a dark source into a fully formed stellar source during interrogation.

Pathwise \(P_J=JP_{\rm occ}\) and \(E_J=JE_0\). After expectation, the registered operating law is
\[
P_{\rm context}=\mathbb E P_J=pP_{\rm occ}=Ay^2,\qquad
A=P_{\rm occ}/6,\qquad r_p=A/C_{\rm scale}^2,
\]
\[
E_{\rm ret}=\mathbb E E_J=pE_0
=\eta_{\rm ret}P_{\rm context}\tau_c.
\tag{S.7.4b.OC.15}
\]
Both actual sector geometries are solved before this average. A mean power describes the registered cost; it is never substituted into Einstein's equation as a fictitious pathwise source. Eliminating \(y=c/(\alpha-c)\) gives the original law
\[
P_{\rm context}(c)=A\left[\frac{c}{\alpha-c}\right]^2,
\qquad 0\le c\le1/8.
\tag{S.7.4b.OC.16}
\]

The common auxiliary apparatus consumes the actually implemented constant center power \(P_B=10^9\) W over the full episode \(H=2\tau_c\). Every listed test service has an independent finite energy and instantaneous-power rating, with at most 512 simultaneous draws of at most \(10^6\) W. Hence \(P_{\rm ctrl}\le512\times10^6<P_B\), and a physical ballast absorbs \(P_B-P_{\rm ctrl}\ge0\). Divider heat, nonlinear actuator heat, clocks, finite pulse/gate and transport work, supports, source-selection controls, records and detector work remain owned. Finite peak and energy bounds are separate inputs; neither follows merely from a bounded Hamiltonian norm.

The whole registered operating-maintenance law is therefore
\[
R(C_{\rm op}+x)=P_B+r_px^2
\]
at the original anchors and on their expressly admitted response extension. This compares the same registered aggregate apparatus; it does not assign a common power to every possible state of a given complexity. The standalone minimum cell proves the threshold and is not an additional implementation competing in this same-apparatus cost envelope.

Initial source acquisition, radiation fill, material/geometry preparation and any later recharge are separate entries. The current objective prices actual operating consumption only. A source-acquisition objective would need its own comparison, and equal reserved capacity alone would not make different preparation work equal. If a different objective includes preparation, only an independently justified constant supplied preparation work, including its dissipative ballast and heat owner, may cancel. Source fuel is debited once as initial-minus-final available energy; battery loading is not charged again as new work when that same energy is consumed. Heat gain is its destination, not a second work charge. Fresh records and all spent stores remain; no cyclic-reset or indefinite reusable-service claim is made.

**OC 6. Exact same-source qutrit phase and operational attenuation.**

SP 6 realizes the clock channel on the actual target through the co-located encoding \(W|k\rangle=|2-k\rangle_A|k\rangle_B\), gap-off causal transport, finite local rise/fall ramps, and co-located decoding. The occupied differential phase is derived from \(N(r_2)-N(r_1)\), not written into a correction conditional on the hidden source label. The empty source produces only a global phase. A private level exchange implements the independent sign by \(SH_TS=2\Delta I-H_T\), so the signed accumulated differential exposure is
\[
Y_0=0,\quad Y_{\pm}=\pm\delta\tau_{\rm occ},\quad
\varphi=\omega\delta\tau_{\rm occ}=2\pi/3.
\tag{S.7.4b.OC.17}
\]
These are toggling-frame signed exposures, not negative proper times. Source ablation removes the occupied differential and hence the attenuation. The common central forecast release and trial close are padded in every sector.

Tracing only the private held source/sign records gives one joint three-level correlation matrix
\[
M_{ik}=1-p+\frac p2e^{-i(i-k)\varphi}+\frac p2e^{+i(i-k)\varphi},
\qquad i,k\in\{0,1,2\}.
\tag{S.7.4b.OC.18}
\]
This is a finite unitary mixture with unit diagonal and positive semidefinite correlation matrix. Since \(\cos\varphi=\cos2\varphi=-1/2\), every nonzero qutrit gap has
\[
M_{ik}=q=1-3p/2=1-y^2/4\in[3/4,1]\quad(i\ne k).
\tag{S.7.4b.OC.19}
\]
The response difference in OC 3 is purely energy-off-diagonal, so its exact original retained-target norm is
\[
C_{\rm eff}=c(y)(1-K_RP_{\rm context}),\qquad
K_R=\frac3{2P_{\rm occ}}
=\frac{3\eta_{\rm ret}\tau_c}{2E_0},\qquad AK_R=1/4.
\tag{S.7.4b.OC.20}
\]
The matching retained-target input is \(F\) and the effect is the positive spectral projector of the surviving star contrast; no private sector/record is supplied to the receiver. The aggregate parity \(j\) is the context being discriminated. Occupation \(J\) and sign \(S\) generate independent noise and resource use. They are not alternative names for that context.

This exact bounded linear law is neither a first-order truncation nor a Cauchy process or independent-increment semigroup. Its coefficient refers to this held-sector spectrum and exposure. Indeed the same noise at the hypothetical gap \(3\Delta\) has \(\cos3\varphi=1\), so its operational attenuation coefficient would be zero; it cannot be a universal scalar chronometric damping law.

The independently derived clock coefficients satisfy
\[
K_{\rm time}=\delta\tau_{\rm occ}/P_{\rm occ},\qquad
K_{\rm eff}=K_{\rm time}/\tau_c,\qquad
\omega K_{\rm time}=2\pi/(3P_{\rm occ})\ne K_R.
\]
The unsigned occupied slip and the mean absolute signed slip are proportional to power; the signed mean is zero. The source-specific coefficients are explicitly compared with the finite-separation uniform-fluid formula in SP 5. For the selected clock radii, the S.19 gradient spatial remainder is exactly 1% of the retained gradient. Combined with the exact radiation profile and weak-field error, the rigorous relative error in the nominal Euclidean-volume convention is below 0.010354; a proper-volume convention retains its explicit additional volume factor. None of these distinctions removes the exact populated generic \(K=K_R\) of S.7.4a(b).

**OC 7. Populated original objective and genuine anchor optimum.**

For the instantiated maintained-source service, register the fixed tariff

\[
\lambda=\frac1{16P_{\rm occ}H}\ \text{payoff units per joule},
\qquad
k_c=\lambda H=\frac1{16P_{\rm occ}}=\frac1{96A}
\ \text{payoff units per watt},
\tag{S.7.4b.OC.21}
\]

where $H=2\tau_c$ is the common public trial duration over which the registered expected maintenance power is debited. The actual operational supply work is $H(P_B+pP_{\mathrm{occ}})$. Its baseline term $\lambda HP_B$ is common and cancels; the residual is exactly $k_cP_{\mathrm{context}}$. A separate setting-independent preparation-work term, when included, likewise cancels only after its actual-work equality is established as in OC §5. Battery loading and later depletion are alternative inventory descriptions of the same energy, not two resource charges.

This is a declared resource preference that is common to all settings in the optimization. Its role is a branch input. The finite example is deliberately engineered. With $\alpha=1/4$, $k_b=1/8$, the actual original objective after the common baseline offset is

\[
B(y)=\frac1{32}\frac y{1+y}\left(1-\frac{y^2}4\right)-\frac{y^2}{96},
\qquad 0\le y\le1.
\tag{S.7.4b.OC.22}
\]

Its derivative has the original S.7.4a form. Direct simplification gives

\[
B'(y)=\frac{(1-2y)(7y^2+16y+12)}{384(1+y)^2}.
\tag{S.7.4b.OC.23}
\]

The second factor is strictly positive. Thus the unique global maximum on the entire bounded extension is $y_*=1/2$; this is also the actual original-program state $\mu_1$, whose original excess complexity is exactly one bit. Its values are

\[
C_{\rm ideal,*}=1/12,\quad
C_{\rm eff,*}=5/64,\quad
P_*=A/4,\quad B_*=11/1536.
\tag{S.7.4b.OC.24}
\]

The other original anchors have $B(0)=0$ and $B(1)=1/768$, so the same original state is strictly optimal in the exact three-anchor class. Since the continuous physical-control envelope is upper-bounded by the value at this actual anchor, allowing its analog extension does not improve this registered objective. This is not a global optimum over every universal-tail aggregate or every implementation architecture.

The rational endpoint $c=\alpha$ is not in this bounded operating family: it has $0\le c\le\alpha/2=1/8$. There is no claimed physical divergence or all-complexity extension.

**OC 8. Completion of the bounded composition.**

The four source requirements that remained open in the isolated response module are now supplied: actual occupied maintenance and retained holding in SP 3–4; complete occupied/empty bulk and supporting-wall geometry in SP 1–2; physical same-clock differential qutrit evolution in SP 5–6; and the full finite fuel, waste, control, baseline and causal record in SP 4 and SP 6. The source enclosure certificate independently evaluates the analytic bounds. No conditional source placeholder is being counted as a physical derivation.

The remaining qualifications are the registered constitutive/model inputs listed at the start, the finite domain, the formal presentation and the distinction between maintenance and acquisition. They are not silently removed by a successful checker. The mathematical norm and source equations are exact in this model. Manufactured calibration, nonzero test backreaction, a different source material, radial stability, arbitrary preparation dynamics, a universal complexity census, an unbounded rational endpoint and chronometric-exponential saturation would be separate claims requiring separate evidence.

**OC 9. Quantitative stability and calibration errors.**

The exact nominal objective has

\[
B''(y)=-\frac{7+9/(1+y)^3}{192}<0,
\]
\[
B(1/2)-B(y)
=\frac{(2y-1)^2(7y+11)}{1536(1+y)}
\ge\frac3{128}(y-1/2)^2.
\tag{S.7.4b.OC.25}
\]

Suppose a physically registered implementation obeys the uniform absolute objective error $|B_{\mathrm{actual}}(y)-B(y)|\le\epsilon_B$ on the same closed interval and common public labels. Every actual maximizing setting then obeys

\[
|y_{\rm actual}-1/2|
\le\min\{1/2,\sqrt{256\epsilon_B/3}\},
\qquad
|\max B_{\rm actual}-11/1536|\le\epsilon_B.
\tag{S.7.4b.OC.26}
\]

Indeed, its nominal shortfall is at most $2\epsilon_B$, and (S.7.4b.OC.25) gives the enclosure. For the three exact original anchors, the smallest nominal winner gap is $3/512$, so the original state $\mu_1$ remains the unique winner whenever

\[
\epsilon_B<3/1024.
\tag{S.7.4b.OC.27}
\]

These statements neither differentiate an optimizer through a degeneracy nor infer a calibration bound from a graph.

For an explicit sufficient error budget, let $\epsilon_c$ bound the rational-control amplitude error, $\epsilon_M$ bound the largest absolute error in the two retained star-spoke noise multipliers, and $\epsilon_0,\epsilon_1$ bound the half-diamond errors of the two fully implemented context channels after the calibrated source/control errors have been removed. Then trace-norm contraction and the Euclidean star-radius formula give

\[
|C_{{\rm eff,actual}}-C_{{\rm eff,nominal}}|
\le\epsilon_c+\frac18\epsilon_M+\epsilon_0+\epsilon_1
=:\epsilon_C.
\tag{S.7.4b.OC.28}
\]

Here `1/8` is the actual maximum ideal response on the bounded family. Source matrices remain genuine correlation matrices, so their star radius is at most one. If the two expected maintenance flows differ by at most `epsilon_P`, with the same exact payoff and tariff, it suffices to take

\[
\epsilon_B=\frac18\epsilon_C+k_c\epsilon_P.
\tag{S.7.4b.OC.29}
\]

An independently bounded payoff-coefficient error $\epsilon_b$ adds at most $\epsilon_b$ under the universal response bound one. A tariff error $\epsilon_k$ adds at most $\epsilon_k(P_{\max}+\epsilon_P)$, where $P_{\max}=A$. If the retained source is only approximately energy-conserving or the common baseline regulator varies, their uncancelled power errors belong to $\epsilon_P$, rather than disappearing into a nominal offset.

For the held symmetric three-sector law, an occupation error $\epsilon_p$ and an occupied elementary-phase error $\epsilon_\phi$, with $p_{\mathrm{actual}}\le1/6+\epsilon_p$, give

\[
\epsilon_M\le\frac32\epsilon_p
+2(1/6+\epsilon_p)\epsilon_\varphi.
\tag{S.7.4b.OC.30}
\]

This follows by splitting weight and phase changes in (S.7.4b.OC.18), using $|\exp(iu)-\exp(iv)|\le|u-v|$ and the largest gap index two. Arbitrary additional source-law error with total variation at most $\epsilon_{\mathrm{law}}$ contributes at most $2\epsilon_{\mathrm{law}}$. For a geometry/time/gap calibration, one valid elementary-phase bound is

\[
\epsilon_\varphi
\le |\Delta|\epsilon_Y/\hbar
+(|Y_{\rm occ}|+\epsilon_Y)\epsilon_\Delta/\hbar,
\tag{S.7.4b.OC.31}
\]

where `epsilon_Y` is a bound on the actual occupied proper-time slip discrepancy including timing and geometric errors. Exact admitted-background formulas can make this zero for the ideal registered model; a manufactured or finite-backreaction extension must supply its own nonzero bound.

A voltage setting error has $|dc/dy|\le1/4$, so an independently certified absolute extension-setting error $\epsilon_y$ contributes at most $\epsilon_y/4$ to $\epsilon_c$. This error control does not turn the extension setting into a measured original-program invariant.

**OC 10. Precise non-extrapolation theorem.**

Suppose a fixed total computable generator $F(n)$ emits one admitted canonical apparatus descriptor $\mu_n$ for every positive integer $n$, on the constant typed hierarchy above. The fixed universal simulation branch can execute $F$ from its transition-table code and the binary representation $b_n$ of $n$. With the specified $\mathrm{enc}$ convention, the complete original program length is at most

\[
2\lfloor\log_2n\rfloor+C_F
\]

for a constant `C_F` independent of `n`. The program is a common admissible realizer at every level. Hence

\[
C_P(\mu_n)\le2\lfloor\log_2n\rfloor+C_F.
\tag{S.7.4b.OC.32}
\]

This uniformly generated admitted family cannot have $C_P(\mu_n)=C_{\mathrm{op}}+n$ for all positive integers. A global linear ladder of original prefix complexities cannot be manufactured simply by giving the analog dial increasingly large integer labels. The theorem does not exclude nonuniform incompressible preparations, another admitted hierarchy, or another genuine physical complexity family. It proves exactly why the present finite original anchors and their response extension do not imply the unbounded original endpoint law.

**Part IV Certified source enclosures and verification scope.**

The analytic outward-rational argument in Theorem S.7.4b, part IV verifies continuum bounds, positive finite coefficients, shell-material inequalities, finite flight time, and capacity for the **final** registered ideal source constants. It does not certify a floating numerical trajectory by sampling, nor assert laboratory feasibility or complete physical closure.

**1. Final constants and exact source definition.**

The registered model constants are

\[
\chi=10^{-4},\quad R=1\,\mathrm{m},\quad c=299792458\,\mathrm{m/s},
\quad G=6.67430\times10^{-11}\ \text{in SI units},
\]

\[
\epsilon=1,\quad\zeta=\frac12,\quad s=\frac1{25},
\quad\tau_c=\frac{100R}{c},\quad
h_\star=\frac\chi{2(1-\chi)},\quad Q=4h_\star.
\]

Here `G` is an exactly registered branch constant. Its empirical measurement uncertainty is not silently certified as zero. All enclosures use the registered perfect absorber and complete wall.

The exact occupied source has

\[
m'=4\pi r^2u/c^2,\quad
\nu'=\frac{G[m+4\pi r^3u/(3c^2)]}{c^2r^2[1-2Gm/(rc^2)]},
\quad u=u_0e^{-4\nu},\quad N=e^\nu,\quad N(0)=1,
\]

\[
u_0=\frac{3c^4\chi}{8\pi GR^2}.
\]

The retained physical source is the ideal radiation fluid plus its full gravitating shell, with the material and flow ledger of Theorem S.7.4b, part II (Complete Maintained Source and Physical Clock Channel). This certificate evaluates the source's analytic bounds rather than replacing those equations by uniform density or mean-sector geometry.

**2. Existence and continuum inequalities, with a contraction certificate.**

Write $z=r/R$ and

\[
\mu(z)=3\chi\int_0^z e^{-4\nu(t)}t^2dt.
\]

On the closed subset $0\le\nu(z)\le h_\star z^{2}$ of $C([0,1])$, define

\[
(T\nu)(z)=\frac12\int_0^z
\frac{\mu(t)+\chi t^3e^{-4\nu(t)}}{t^2[1-\mu(t)/t]}dt.
\]

The apparent center quotient has continuous limit zero. Since $0\le\mu(t)\le\chi t^{3}$, the integrand is nonnegative and at most $\chi t/(1-\chi)$, so $T$ maps the box into itself.

If two inputs have sup-distance $\delta$, the elementary inequality $|e^{-4a}-e^{-4b}|\le4|a-b|$ for $a,b\ge0$ gives

\[
|\Delta\mu(t)|\le4\chi\delta t^3,
\qquad |\Delta[\mu(t)+\chi t^3e^{-4\nu(t)}]|
\le8\chi\delta t^3.
\]

Subtracting the two positive-denominator quotients and integrating yields

\[
\|T\nu-T\widetilde\nu\|_\infty
\le\left[\frac{2\chi}{1-\chi}+\frac{\chi^2}{(1-\chi)^2}\right]\delta
\le q\delta,
\qquad q=\frac{2\chi}{(1-\chi)^2}<1.
\]

The program checks the last inequality exactly. Banach's theorem therefore gives a unique continuous fixed point in the box, regular at the center and satisfying the differential equations away from the center. Iteration also gives the rigorous bound

\[
\|\nu-\nu_n\|_\infty
\le\frac{q^n}{1-q}\|\nu_1-\nu_0\|_\infty.
\]

No iterative numerical value is needed here: the box itself already gives the sufficient enclosures. It implies

\[
0\le\frac{2Gm(r)}{rc^2}\le\chi z^2,\quad
0\le\nu(r)\le h_\star z^2,\quad e^{-Q}\le u/u_0\le1,
\]

\[
\chi e^{-Q}\frac r{R^2}\le\nu'(r)
\le\frac\chi{1-\chi}\frac r{R^2},\qquad
1\le N_b\le e^{h_\star}.
\]

The lower derivative bound follows by putting the lower density into both positive terms of the numerator and bounding the positive inverse denominator below by one. These are interval bounds on the entire continuum solution, not a mesh-only test.

**3. Power, proper energy and both retention coefficients.**

Canceling $\pi$ analytically gives

\[
E_{\rm flat}=u_0V_0=\frac{\chi c^4R}{2G},\qquad
P_{\rm flat}=\frac{3\epsilon c^5\chi}{8\zeta G},
\quad V_0=4\pi R^3/3.
\]

The actual center-normalized fuel power is

\[
P_{\rm occ}=N_b^2\frac{\epsilon c(4\pi R^2)u_b}{4\zeta}
=\frac{P_{\rm flat}}{N_b^2},\qquad u_b=u_0/N_b^4.
\]

Both lapse factors are included before using the exact density law. Hence

\[
P_{\rm flat}e^{-2h_\star}\le P_{\rm occ}\le P_{\rm flat},
\]

\[
E_{\rm flat}e^{-Q}\le E_{\rm bulk}
\le\frac{E_{\rm flat}}{\sqrt{1-\chi}},\qquad
E_{\rm bulk}\le E_K\le e^{h_\star}E_{\rm bulk}.
\]

The proper-energy and conserved-Killing-energy retention coefficients are kept distinct:

\[
\eta_{\rm ret}=\frac{E_{\rm bulk}}{P_{\rm occ}\tau_c},\qquad
\eta_K=\frac{E_K}{P_{\rm occ}\tau_c}.
\]

Since $E_{\mathrm{flat}}/(P_{\mathrm{flat}}\tau_c)=4\zeta/(300\epsilon)$,

\[
\frac{4\zeta}{300\epsilon}e^{-Q}
\le\eta_{\rm ret}\le
\frac{4\zeta}{300\epsilon}\frac{e^{2h_\star}}{\sqrt{1-\chi}},
\]

\[
\frac{4\zeta}{300\epsilon}e^{-Q}
\le\eta_K\le
\frac{4\zeta}{300\epsilon}\frac{e^{3h_\star}}{\sqrt{1-\chi}}<1.
\]

The program rigorously verifies positivity and both upper bounds below one. $\eta_{\mathrm{ret}}$ is not mislabeled as a same-unit energy fraction; its proper/Killing conversion remains explicit. The underlying real fuel-depletion and heat-storage mechanism is a separate physical ledger, not something created by this interval arithmetic.

**4. Complete wall material and exact finite capacity.**

At the boundary define

\[
a=\sqrt{1-2Gm(R)/(Rc^2)},\quad b=a-s,\quad n_R=R\nu'(R).
\]

The independent analytic rectangles are

\[
\sqrt{1-\chi}\le a\le1,\quad
\sqrt{1-\chi}-s\le b\le1-s,
\quad\chi e^{-Q}\le n_R\le\frac\chi{1-\chi}.
\]

The exact Israel surface pressure is

\[
\frac{p_s}{\sigma}
=\frac{F(b)-a-an_R}{2s},\qquad F(b)=\frac{1+b^2}{2b}.
\]

For $0<b<1$, $F'(b)=(1-b^{-2})/2<0$, so the interval argument encloses $F(b)$ using its reversed endpoint values. It then uses ordinary outward interval subtraction and multiplication. This deliberately allows the $a,b,n_R$ correlations to widen the answer; it cannot shrink away an admissible value. Even this conservative calculation proves

\[
0.00916654165416541654\le p_{s,\rm occ}/\sigma
\le0.00981859730997507133.
\]

For the dark shell, direct exact algebra gives

\[
p_{s,0}/\sigma=\frac{s}{4(1-s)}=\frac1{96}.
\]

Both are positive and below $1/4$. For $w_s=1/2$ and half of the wall's energy allocated to the internal fuel-plus-heat sector, let $q_s=p_s/\sigma$. The on-shell constitutive coefficients satisfy

\[
\frac{A_qn_*^{1+w_s}}\sigma=\frac{1/2+q_s}{1+w_s}>0,
\qquad \frac{B_q}\sigma=\frac{w_s/2-q_s}{1+w_s}>0,
\]

\[
0<\frac{dp_s}{d\sigma}
=w_s\frac{1/2+q_s}{1+q_s}<\frac12.
\]

These local material inequalities are interval-verified for both sectors; they do not assert radial stability.

The proper energy of the **whole** gravitating wall is

\[
E_{\rm wall}=4\pi R^2\sigma=\frac{2s}{\chi}E_{\rm flat}
=800E_{\rm flat}.
\]

For a complete occupied source-on aperture $H_{\mathrm{on}}\le2\tau_c$, the actual local fuel debit satisfies

\[
E_{\rm fuel,local}=P_{\rm occ}H_{\rm on}/N_b
\le2P_{\rm flat}\tau_c=300E_{\rm flat}.
\]

The specified internal fuel-plus-heat reserve is $E_{\mathrm{wall}}/2=400E_{\mathrm{flat}}$. Thus it has a strict $100E_{\mathrm{flat}}$ margin over the entire episode's upper fuel debit. The remaining $400E_{\mathrm{flat}}$ is elastic/rest energy. These exact ratios are checked with `Fraction`, independently of the ODE or any rounded SI values.

**5. No trapped radiation and a finite old-inventory exclusion time.**

The continuum bound gives

\[
r\nu'(r)\le d_*:=\frac\chi{1-\chi}<1.
\]

Thus $w(r)=r/N(r)$ is strictly increasing. A null ray with impact parameter $\ell$ obeys

\[
\frac{dt}{dw}
=\frac1{ca(r)[1-r\nu'(r)]\sqrt{1-\ell^2/w^2}}.
\]

Integrating from its turning point to the wall and back, using $w(R)\le R$, gives

\[
t_{\rm flight}\le\frac{2R}{c\sqrt{1-\chi}(1-d_*)}
=\frac{2R\sqrt{1-\chi}}{c(1-2\chi)}
<2.001R/c<\tau_c/4.
\]

The exact-rational/square-root verifier proves both strict inequalities. With $\epsilon=1$, every photon is absorbed on its first wall return. Consequently the source protocol's $\tau_c/4$ pre-phase delay exceeds the lifetime of any initial photon, and the retained photons in the subsequent phase window genuinely belong to ongoing replacement flow. This conclusion depends on the actual perfect-absorption boundary rule, which is why the earlier $\epsilon=1/2$ record was not used here.

The conserved-energy mean residence time obeys

\[
\tau_{{\rm res},K}=E_K/(\zeta P_{\rm occ}).
\]

Its enclosing upper endpoint is also below the conservative maximum-flight bound and below $\tau_c$.

**6. Positive clock, gap and original coefficient intervals.**

For the final clock pair $r_1=R/2,r_2=51R/100$, the finite-separation factor is $D=(r_2^{2}-r_1^{2})/R^{2}=101/10000$. The actual source functional

\[
\delta\tau=\tau_c[N(r_2)-N(r_1)]
\]

has the strictly positive enclosure

\[
d_0e^{-Q}\le\delta\tau\le d_0e^{h_\star}/(1-\chi),
\quad d_0=\tau_c\chi D/2.
\]

Define the actual target frequency from this same unique source solution:

\[
\omega=2\pi/(3\delta\tau),\quad
K_{\rm time}=\delta\tau/P_{\rm occ},\quad
K_{\rm eff}=K_{\rm time}/\tau_c,
\]

\[
K_R=3/(2P_{\rm occ}),\quad A=P_{\rm occ}/6,
\quad r_p=P_{\rm occ}/24,\quad k_c=1/(16P_{\rm occ}).
\]

Every displayed interval in the table below is outward-enclosed and strictly positive. The dependency-preserving identities remain exact:

\[
AK_R=1/4,\quad k_cA=1/96,\quad r_p(2\ {\rm bits})^2=A.
\]

Multiplying separately rounded endpoint intervals would unnecessarily lose those shared-`P_occ` identities, so the argument verifies their rational prefactors directly.

The phase-per-power coefficient is

\[
K_\phi=\omega\delta\tau/P_{\rm occ}=2\pi/(3P_{\rm occ}),\qquad
K_\phi/K_R=4\pi/9>1.
\]

It is explicitly distinct from `K_R`; no mere unit match identifies a generic attenuation constant with a chronometric coefficient. The phase construction and the separate original coefficient definitions determine which clock coefficient, if any, applies.

The controlled finite-separation weak-field comparison is

\[
\sqrt{1-\chi}e^{-Q}
\le K_{\rm time}/K_{{\rm time,finite}}^{(S)}
\le e^{Q+h_\star}/(1-\chi).
\]

Both endpoints lie within `0.000351` of one. For the final short clock separation, the exact finite/linear-gradient geometric ratio is

\[
\frac{(r_2^2-r_1^2)/2}{r_1(r_2-r_1)}
=\frac{101}{100}.
\]

Consequently the comparison to the original S.19 linear-gradient coefficient is

\[
\frac{101}{100}\sqrt{1-\chi}e^{-Q}
\le K_{\rm time}/K_{{\rm time,gradient}}^{(S)}
\le\frac{101}{100}\frac{e^{Q+h_\star}}{1-\chi}.
\]

The combined interval is `[1.00974750883836275,1.01035359218318819]`, so its relative discrepancy is strictly below `0.010355`. This retains both the one-percent finite-separation correction and the controlled nonlinear clock correction; it does not claim exact equality with a truncated gradient law.

**7. Certified numerical enclosures.**

The [certified numerical enclosure table](../related/calculation_companions/appendix_s/s7-4b-finite-clock-enclosures.md#certified-enclosures) gives the outward decimal representations of the exact rational endpoints. Some intervals are intentionally broad, because positivity, capacity and nonempty coefficient population do not require a high-precision ODE enclosure.

For the optional energy-gap conversion, the argument uses the exact SI Planck constant $h=6.62607015\times10^{-34}\ \mathrm{J\,s}$ and elementary charge $e=1.602176634\times10^{-19}\ \mathrm{C}$; $\hbar\omega=h/(3\delta\tau)$, so $\pi$ cancels rather than acquiring two independent rounding errors.

**8. Why the elementary arithmetic is rigorous.**

The outward arithmetic in Theorem S.7.4b, part IV uses exact rational intervals, integer square-root bounds and decimal endpoints as specified below.

- Rational interval addition, subtraction, multiplication and division use exact endpoint arithmetic. Divisors must exclude zero.
- Square roots use integer arithmetic with scale $2^{200}$: if $k=\lfloor\sqrt{x}\,2^{200}\rfloor$, the returned interval is $[k/2^{200},(k+1)/2^{200}]$, collapsing to a point when exact. The squared endpoint inequalities are themselves verified.
- For $0\le x\le1/100$, the exponential lower bound is the positive Taylor sum through degree 32. The upper bound adds
  
  \[
  \frac{x^{33}/33!}{1-x/34},
  \]
  
  because every successive tail-term ratio is at most $x/34$. Negative exponentials are enclosed by the reciprocal positive interval. All used arguments satisfy the small-argument condition.
- $\pi$ is enclosed by Machin's identity $\pi=16\arctan(1/5)-4\arctan(1/239)$. Each arctangent is bracketed by 64 and 65 terms of its alternating series. The interval width is verified below $10^{-80}$. The underlying tangent identities $\tan(4\arctan(1/5))=120/119$ and $\tan(4\arctan(1/5)-\arctan(1/239))=1$ are checked with exact fractions; the positive angle below $\pi/2$ fixes the branch.
- Printed decimals are rounded down for lower endpoints and up for upper endpoints. Every printed decimal is converted back to a fraction and checked to enclose the original rational endpoint.

These operations provide outward mathematical bounds. No floating-point arithmetic, numerical integration, stochastic test or numerical ODE output is used.

∎

## S.8 Integration with Appendix L

This appendix analyzes gravitational feedback effects that limit CC efficacy. For comprehensive treatment of CC implementation mechanisms, energy accounting, and practical experimental protocols, see Appendix L.

### S.8.1 Division of Labor

**Appendix L provides:**

1. **Conditional carrier models**
   - Electromagnetic coupling via AC Stark level shifts only on the conserved-current, Maxwell-transfer, and target-response branches of Theorem L.2 and Corollary L.2.1
   - Coherent charge oscillation as a candidate source model (Section L.11)
   - Biological implementation pathways as certificate-pending hypotheses (Section L.4.1)
   - Conditional temporal-modulation channel decomposition (Theorem L.8)

2. **Carrier-comparison obligation**
   - Proposition L.5 proves that the registered scaling data do not determine a numerical or positive electromagnetic-to-gravitational response ratio
   - Any comparison requires one common carrier, target, geometry, retention, normalization, covariance, and uncertainty ledger fixed before evaluation
   - Worked examples and detection times are protocol diagnostics until those entries and a nonzero response interval are accepted

3. **Conditional energy accounting**
   - Channel decomposition: $P_{\mathrm{agg}}=P_{EM}+P_{\mathrm{other}}$ under the mutually exclusive ledger hypothesis of Equation L.36
   - Stress-energy decomposition: $T_{\mu\nu}^{(MPU)}=T_{\mu\nu}^{(baseline)}+\Delta T_{\mu\nu}^{(CC)}+T_{\mu\nu}^{(EM)}$ on the common L/S source convention of Equation S.9
   - Distributional covariant conservation $\nabla^\mu T_{\mu\nu}^{(MPU)}=0$ on the regular local-equilibrium branch of Theorem B.5; pointwise conservation on its smooth on-shell variational branch
   - Horizon thermodynamics consistency on the hypotheses of Theorem L.7

4. **Implementation and mapping-class requirements**
   - Implementation-independent constraints (Theorem L.9(i)–(iii))
   - Threshold behavior on the threshold-scaling branch: $C_{\mathrm{agg}} \le C_{op} \implies \text{CC} = 0$
   - POP/PCE optimization on the nonempty compact continuous mapping class of Theorem L.1, with the Lipschitz and boundedness hypotheses of Lemma L.1 and contractivity when a feedback loop is included

5. **Experimental protocols**
   - Protocol L.1: registered electromagnetic source/field/target transfer test; its displayed integration time is branch-parameter arithmetic, not a feasibility certificate
   - Protocol L.2: source-exhaustive energy-conservation and calorimetry test
   - Protocol L.3: conditional gravitational-response test; no null or dominance expectation is defined before a common response/covariance certificate

**This appendix (Appendix S) provides:**

1. **Gravitational feedback analysis**
   - Resource cost to gravitational field mapping (Sections S.1-S.3)
   - Self-limiting feedback loop quantification (Section S.4)
   - PCE optimization including feedback (Equation S.27)

2. **Conditional gravitational branches**
   - retained-source metric-phase model (Section S.6)
   - Schwarzschild comparison on its localization and weak-field branch (Section S.5)
   - decoherence model on its declared noise and response branch (Section S.7)

3. **Theoretical bounds and interpretations**
   - Unified causality-gravity constraint (Theorem S.2)
   - Conditional compactness cutoff and weak-field validity limits (Corollary S.2.1)
   - Self-limitation prevents arbitrary CC enhancement

### S.8.2 Conditional Branch Composition

Appendices L and S provide distinct conditional maps. They compose only when one physical implementation satisfies every premise in the chain.

**Source and channel ledger:**
$$
\text{context state}
\xrightarrow{\text{registered cost law}}P_{\mathrm{agg}}
\xrightarrow{\text{energy-partition certificate}}
\begin{cases}
P_{EM}\to\text{EM response},\\
P_{\mathrm{other}}\to\text{retained local source energy}
\end{cases}
$$

**Gravitational-response ledger:**
$$
P_{\mathrm{context}}
\xrightarrow{\eta_{\mathrm{ret}}}u_{\mathrm{context}}
\xrightarrow{\text{perfect-fluid, weak-field model}}\Phi_{\mathrm{grav}}
\to\Delta\tau_d
\to\Theta_{ij}.
$$
A dephasing rate additionally requires an unresolved-noise, source-trace, or chronometric ND-RID branch; a decrease of $\mathrm{CC}_{\mathrm{eff}}$ additionally requires the S.63 response law.

**Utility-selection ledger:**
$$
\mathrm{CC}_{\mathrm{ideal}}
\xrightarrow{\text{S.5, S.63, and S.22 branch data}}
B_{\mathrm{net}}
\xrightarrow{\text{interior validity and strict concavity}}
\mathrm{CC}^*.
$$
The resulting maximizer belongs to this phenomenological composition and is not an unconditional PCE equilibrium.

### S.8.3 Conditional Frequency Decomposition and Carrier Separation

For any registered temporal variable with the required integrability, Fourier decomposition is a mathematical representation. High- and low-frequency components do not identify electromagnetic and gravitational carriers. An electromagnetic reading requires Appendix L's conserved-current, multipole, field, target-susceptibility, geometry, and calibration records. A gravitational reading requires Appendix S's complete retained stress-energy, metric response, target phase map, localization, and calibration records.

If one implementation carries both packages, their source and power ledgers must be non-overlapping and source-exhaustive. Proposition L.5 proves no value or positive lower bound for an electromagnetic-to-gravitational response ratio from the framework constants alone. Consequently, no $10^{33}$--$10^{43}$ dominance range, bandwidth hierarchy, or common microscopic origin follows from frequency labels or coupling constants without a common source, target, geometry, retention, and uncertainty model.

### S.8.4 Experimental Complementarity

The experimental programs in Appendix L and this appendix address different aspects:

**Appendix L protocols test:**
- Whether CC influence exists and operates primarily through EM channel
- Energy conservation in CC processes (calorimetry)
- Whether a registered gravitational response is distinguishable from the competing carrier model under the common source, geometry, retention, and uncertainty certificate
- Detection timescales determined by the registered target-response likelihood, effect interval, trial rate, and statistical power

**This appendix's conditional tests address:**

- Whether the registered cost and coherence-response laws describe CC as retained context power changes.
- Whether the local phase protocol of Section S.6 produces its predicted joint-correlation change with unchanged Bob marginal.
- Whether the source and geometry certificate supports interpreting the imposed compactness cutoff physically.
- Whether the registered unresolved-noise or chronometric branch describes coherence times and clock-gap scaling.

Appendices L and S supply carrier, resource and response models on their stated hypotheses. The tests above, run on their common source, geometry, timing, calibration and uncertainty records, test whether a nominated CC implementation exists and realizes the proposed self-limitation mechanism.

### S.8.4a Experimental Discrimination of Registered Carrier Models

Fix common source, target, geometry, retention, timing, and uncertainty data. Preregister an electromagnetic response surface and a gravitational response surface, including all nuisance channels and the domain on which the two are identifiable. Vary radiated power, retained total power, distance, modulation frequency, and electromagnetic screening independently when feasible. Electromagnetic screening is a differential control for the declared EM path; the equivalence principle does not prove that every gravitational response is unshieldable in every effective or engineered model.

Compare the two models by a declared likelihood or finite-distance statistic with a stopping rule and multiplicity correction. A result supports one registered model only if it rejects the other within the shared uncertainty ledger; nonidentifiability or rejection of both leaves the carrier question open.

<a id="proposition-s84b-identifiable-electromagnetic-and-gravitational-response-surfaces-on-one-ledger"></a>**Proposition S.8.4b (Identifiable Electromagnetic and Gravitational Response Surfaces on One Ledger).** Fix one source at the origin, completed as in Theorem S.1b, and one two-level target clock of frequency $\omega_{\mathrm{TLS}}>0$ and projected dipole $d_{\mathrm{eff}}$ in a far-zone direction $\mathbf n$ at distance $r>R_S$. Its observable is the dimensionless fractional frequency shift $y$ relative to a reference clock at zero potential. A design point is $\xi=(s,\sigma,P,E,r)$, with $s\in\{0,1\}$ the screening state of the declared electromagnetic path, $\sigma=\operatorname{sgn}\Delta\in\{\pm1\}$ the detuning sign, radiated power $P\ge0$ and retained energy $E\ge0$ owned by disjoint sectors of Theorem L.6a, and $r>R_S$. Let $D(\mathbf n)\ge0$ be the registered directivity, so that the far-zone intensity is $D(\mathbf n)P/(4\pi r^2)$. On the far-detuned branch of Corollary L.2.1 and the exterior branch of Theorem S.1b, the leading response surfaces are
$$
y_{\mathrm{EM}}(\xi)=c_E\,s\,\sigma\frac{P}{r^2},
\qquad
c_E:=\frac{d_{\mathrm{eff}}^2D(\mathbf n)}{4\pi\epsilon_{\mathrm{vac}}c\hbar^2\omega_{\mathrm{TLS}}|\Delta|},
\qquad
y_{\mathrm G}(\xi)=-c_G\frac{E}{r},
\qquad
c_G:=\frac{G}{c^4}.
\tag{S.8.4b.1}
$$
For design points $\xi_1,\ldots,\xi_n$ register the model $\mathbf y=a_E\mathbf u+a_G\mathbf v+\mathbf e$ with $u_m:=s_m\sigma_mP_m/r_m^2$, $v_m:=-E_m/r_m$, unknown amplitudes $(a_E,a_G)$ whose nominal values are $(c_E,c_G)$, and $\mathbf e\sim\mathcal N(0,\Sigma)$ with registered $\Sigma\succ0$. Put $\tilde{\mathbf u}:=\Sigma^{-1/2}\mathbf u$ and $\tilde{\mathbf v}:=\Sigma^{-1/2}\mathbf v$.

(a) *(Identifiability.)* The map $(a_E,a_G)\mapsto a_E\mathbf u+a_G\mathbf v$ is injective exactly when $\mathbf u$ and $\mathbf v$ are linearly independent; then the generalized least-squares estimator is unbiased with covariance $(X^\top\Sigma^{-1}X)^{-1}$, $X=[\mathbf u\ \mathbf v]$. Independence holds for each of the following two-point designs with all other entries fixed and $P,E>0$: (i) screening, $s=0$ and $s=1$; (ii) power, two distinct values of $P$ with $s=1$; (iii) distance, two distinct radii with $s=1$; (iv) detuning sign, $\sigma=\pm1$ with $s=1$.

(b) *(Formal distinguishability.)* For thresholds $e_{\min},g_{\min}>0$, every electromagnetic-only mean $a_E\mathbf u$ with $|a_E|\ge e_{\min}$ and every gravitational-only mean $a_G\mathbf v$ with $|a_G|\ge g_{\min}$ are separated in Mahalanobis distance by at least
$$
\Delta_{\min}:=\max\bigl\{e_{\min}\|P^\perp_{\tilde{\mathbf v}}\tilde{\mathbf u}\|,\ g_{\min}\|P^\perp_{\tilde{\mathbf u}}\tilde{\mathbf v}\|\bigr\},
\tag{S.8.4b.2}
$$
where $P^\perp_{\mathbf w}$ projects orthogonally to $\mathbf w$ for $\mathbf w\ne0$ and $P^\perp_0:=I$. Hence their data laws have total-variation distance at least $2\Phi_{\mathcal N}(\Delta_{\min}/2)-1$, with $\Phi_{\mathcal N}$ the standard normal distribution function, and $N$ independent replications of the design multiply $\Delta_{\min}$ by $\sqrt N$. If $\mathbf u\ne0$ and $\mathbf v\ne0$, then $\Delta_{\min}>0$ exactly when $\mathbf u,\mathbf v$ are independent. If exactly one template vanishes, for instance $\mathbf u=0$ when every design point has $s_m=0$ or $P_m=0$, its amplitude is unidentifiable by (a), while $\Delta_{\min}=g_{\min}\|\tilde{\mathbf v}\|$ or $e_{\min}\|\tilde{\mathbf u}\|$ is positive and still separates the two restricted hypotheses; if both vanish, $\Delta_{\min}=0$.

*Proof.* The Stark surface follows from (L.14): $\delta_{\mathrm{Stark}}/\omega_{\mathrm{TLS}}=|\Omega_R|^2/(2\Delta\omega_{\mathrm{TLS}})$ with $|\Omega_R|^2=d_{\mathrm{eff}}^2E_0^2/\hbar^2$ and $E_0^2=2I/(\epsilon_{\mathrm{vac}}c)$ for intensity $I=D(\mathbf n)P/(4\pi r^2)$, and screening sets $I=0$. The gravitational surface is the first-order clock rate $1+\Phi(r)/c^2$ with the exterior potential $-GE/(c^2r)$ of Theorem S.1b. (a) Injectivity of a linear map on $\mathbb R^2$ is linear independence of its columns, and the generalized least-squares formulas are standard for full column rank. In design (i), $\mathbf u=(0,\sigma P/r^2)$ and $\mathbf v=-(E/r)(1,1)$; in (ii), $\mathbf u\propto(P_1,P_2)$ and $\mathbf v\propto(1,1)$; in (iii), $\mathbf u\propto(r_1^{-2},r_2^{-2})$ and $\mathbf v\propto(r_1^{-1},r_2^{-1})$; in (iv), $\mathbf u\propto(1,-1)$ and $\mathbf v\propto(1,1)$. Each pair has nonzero determinant. (b) For fixed $a_E$, $\min_{a_G}\|a_E\tilde{\mathbf u}-a_G\tilde{\mathbf v}\|=|a_E|\|P^\perp_{\tilde{\mathbf v}}\tilde{\mathbf u}\|$, and symmetrically in $a_G$, which gives (S.8.4b.2). For nonzero $\tilde{\mathbf u},\tilde{\mathbf v}$ both projections vanish exactly when $\tilde{\mathbf u},\tilde{\mathbf v}$ are dependent, and $P^\perp_0=I$ gives the zero-template values. Two Gaussian laws with common covariance and Mahalanobis separation $\Delta$ have total-variation distance $2\Phi_{\mathcal N}(\Delta/2)-1$, which increases with $\Delta$. Stacking $N$ independent replications multiplies every squared Mahalanobis norm by $N$. ∎

<a id="theorem-s84c-registered-retarded-maxwell-and-gravitational-discrimination-platform"></a>**Theorem S.8.4c (Registered Retarded-Maxwell and Gravitational Discrimination Platform).** On the explicitly supplied static-material, curved retarded-Maxwell and one-way effective-dipole test platform below, the common two-site design populates the electromagnetic coefficient, distinct retained-energy/radiated-power and complete work/force ledgers, the actual binary law and positive covariance. Every listed source, curvature, finite-reference, detuning, Stark, phase, launch, envelope and finite-service error has a bound below the reserved coordinate budget. The original bounded EM-only versus gravity-only bit-law classes have separation greater than 0.0058, and $2^{24}$ independent parallel records per site give classification error below $10^{-14}$. This is a formal registered-platform result under its stated constitutive services; observed calibration and reciprocal apparatus physics are separate.

*Proof and complete source record.* The following parts retain the existing source, response, error, finite-service and covariance proofs. The prescribed current and effective dipoles share the exact S.1c geometry and independently calibrated units. Part-local equation labels M1–M15 and plain section numbers remain local to the Maxwell record.

#### Static source and disjoint transactions

##### 1. Reuse of the Theorem S.1c material

Consume Theorem S.1c on its causal-material subfamily $x>0$, $x\le 1/16$, $w=1/6$, $s=x/2$. Pick independent $R,c,G>0$ and $x=2^{-20}$. Define
$u=3c^4x/(8\pi GR^2)$, $\sigma_E=c^4s/(4\pi GR)$,
$a=\sqrt{1-x}$, $b=a-s$, $\eta=1-b^2$.

The precise bulk conserved-current/advected-composition action, composition-dependent positive material coefficients, shell conserved-current action, junction stress and readiness conditions are those of S.1c(17)–(20). The background is its exact static ready solution; its exterior lapse is $N(r)=\sqrt{1-\eta R/r}$. No dust mass is attached to an unrelated apparatus. The original nominal energy is

$$
E_0=u(4\pi R^3/3)+4\pi R^2\sigma_E=(c^4R/G)(x/2+s).
$$

Actual proper material energy is $E_{\mathrm{mat}}=uV_{\mathrm{prop}}+4\pi R^2\sigma_E$. ADM energy is $E_{\mathrm{ADM}}=c^4R\eta/(2G)$. These are three distinct entries linked by S.1c(8)–(10). The binding contribution $E_{\mathrm{ADM}}-E_{\mathrm{mat}}$ is counted once; it is not an extra positive reservoir. During the ready interrogation the material has no work/heat/radiation transaction. Its pre-run material/geometry preparation remains an explicitly supplied ready-source premise, exactly as in Theorem S.1c.

##### 2. Reference and geometry

Targets are static at $r_1=4R$ and $r_2=8R$. A physically separate EM-decoupled reference is static at $r_f=32R$, all at registered directions. Its finite local frequency, test supports, causal triggers, null propagation and completed readout/release follow the S.1c test-service convention. No physical clock is placed at infinity. Exact clock ratios are $\gamma_i=N(r_i)/N(r_f)$.

The original leading retained-energy signal is $g_i=-(GE_0/c^4)(1/r_i-1/r_f)$. S.1c(14), applied to $r_i$ and $r_f$, gives $|\gamma_i-1-g_i|\le 5(x+s)^2$. This bound includes the difference between nominal $E_0$ and the nonlinear material/ADM geometry. It must not be applied again as a separate binding error in the same row.

##### 3. Co-registered external-current sector and once-only work

The candidate EM service is a separate test sector centered at the same origin, with a smooth conserved current supported in a fixed finite emitting shell and a causal finite-time waveform. Its source radius must lie below $r_1$. It is not a second unrelated laboratory drive. The Schwarzschild background/test boundary explicitly has zero stress-backreaction coupling for clock, field, support and control services. Their actual finite energies remain retained owners and do not enter the background $E_0$/$E_{\mathrm{mat}}$/$E_{\mathrm{ADM}}$ again. This convention is inherited from Theorem S.1c and is a declared premise of this platform; it is not a full self-gravitating apparatus result.

For the specified Maxwell source, use the timelike Killing-energy balance rather than mixing local powers at different lapses. With zero initial field, the source port's signed debit is
$W_{\mathrm{EM}}(t)=-\int J\cdot E$ with the appropriate invariant measure/Killing conversion,
$E_{\mathrm{field}}(t)+E_{\mathrm{flux,out}}(t)=W_{\mathrm{EM}}(t)$
for the chosen encompassing boundary, including every near-zone stored-field term and any inward/returned work. The fully covariant identity is $\nabla_\mu(T_{\mathrm{EM}}^{\mu\nu}\xi_\nu)=-F^{\nu\lambda}J_\lambda\xi_\nu$ for the static Killing field $\xi$. This defines sign and lapse conversion without a flat-volume shortcut.

The source supply reservation bounds the positive variation of the actual port work over its finite campaign. Negative port work is returned to a separately owned receive capacity. The current actuator and phase/timing service are explicit external ideal services; their finite installation, waveform memory, readiness, control, reservoir/return capacity and retention are additional source inventory, not free consequences of Maxwell's equation. The complete waveform-dependent integral is computed from the Maxwell solution of the bounded curved Maxwell source construction below; this ledger is closed only with that integral.

Radiated instantaneous power $P$ is a flux rate of this test sector, not retained energy. Integrating $P$ over the stated window yields the radiated transaction; adding that integral to $E_{\mathrm{field}}$ after it left the boundary would double count. Neither $P$ nor its integral is identified with the static background $E_0$. Local target intensity is converted from the chosen Killing power by the actual Maxwell solution and $N(r_i)$, not by simply replacing it by $P/(4\pi r_i^2)$.

##### 4. Test sensor and record sectors

For each design row, allocate the explicitly nominated dipole TLS, ready state, exact drive and local controls, finite reference service, Ramsey pointer, retained outcome register and detector. $n_{i}$ repetitions consume $n_{i}$ fresh ready pointers/targets or a separately owned reset service; no reset is declared free. If Gaussian electronics are used, its finite number of continuous-outcome instruments and retained records are additional declared source primitives and are not confused with a finite-dimensional exact digital real-number store. The exact binary-only route avoids needing that primitive.

Each service's local work is converted to Killing work with its own lapse, and placed in a disjoint transaction label: field drive, target/control, preparation, readout/record, or retained ready stock. Their interaction energy cannot simultaneously be attributed to both partners. The finite common campaign includes pre-interrogation preparation and all causal readout latency. Zero backreaction does not mean zero cost. A price/inventory table with actual service instances, durations and holding windows is a required completion of this platform.

##### 5. Domain and stopping rule

The branch is an ideal prescribed-source/causal-material/test-apparatus mathematical platform. It asserts neither empirical implementation, nonlinear self-gravity of apparatus, global material stability, autonomous clocks nor full QED. These stronger questions are not additional requirements. The genuine requirements are the conserved co-registered EM source, actual target response/instrument, finite total source/work inventory and a physical remainder rigorously small enough to preserve a nonzero design margin. Without any of these the design is not realized.

#### Bounded curved Maxwell source and actual electric-dipole transfer

##### 1. The common geometry and source package

Let the accepted static source have exterior

\[
ds^2=-N(r)^2c^2dt^2+N(r)^{-2}dr^2+r^2d\Omega^2,
\quad N(r)^2=1-r_s/r,
\quad r_s=2GM/c^2=\eta R.
\]

Here M is the exact S.1c ADM mass, including its bulk, shell and binding contribution. All EM apparatus, supports, controls, clocks and records are separately owned finite test services with zero coupling to the background Einstein equation. Thus the background does not change during emission. This is the accepted test convention, not an approximation silently promoted to an exact Einstein-Maxwell solution.

For the sealed nomination freeze the S.1c material branch at $x_{\mathrm{bulk}}=2^{-20}$, $s=x_{\mathrm{bulk}}/2$ and $w=1/6$, with arbitrary independent $R>0$. Thus $\eta=1-[\sqrt{1-x_{\mathrm{bulk}}}-x_{\mathrm{bulk}}/2]^2$. The tortoise coordinate $x$ below is distinct from the dimensionless compactness $x_{\mathrm{bulk}}$.

Choose a perfectly conducting test sphere at $a=2R$ and a current shell strictly inside $a<r<b=3R$. Target sites $r=4R$ and $r=8R$ are outside the whole centered source package, whose source radius for the EM experiment is $b$. The reference at $r_f=32R$ has its own electric-decoupling constitutive contract. The construction below uses $s=1$ throughout and therefore needs no unproved passive-screening control at fixed $P$.

Put $q=ct$ and use one common tortoise distance $x$, $dx/dr=N^{-2}$, with $x(b)=0$. Site $i$ starts interrogation at $q=x_i=x(r_i)$, so its outgoing retarded start label is $U=q-x_i=0$. A finite reference schedules these row-specific start offsets using the known finite optical delays. Both rows use the same source, source frequency, source waveform and $P$ normalization. Their common reference proper exposure interval is $T_{\mathrm{ref}}$; their local intervals are $T_i=N_iT_{\mathrm{ref}}/N_f$.

For an axial $l=1$ angular potential, the radial Maxwell equation is

\[
u_{qq}-u_{xx}+V(x)u=S(q,x),\qquad
V(x)=2N(r(x))^2/r(x)^2\ge0.                 \tag{S.8.4c.M1}
\]

The perfect conductor supplies the homogeneous boundary $u(q,x_a)=0$. For this axial sector the electric field is tangential, the normal magnetic field vanishes at that boundary, and its induced surface current is an owned part of the source package. No work flows through the ideal conductor boundary. The standard Maxwell-to-Regge-Wheeler reduction is independently documented by Rezzolla and Ahmedov (2004) and Betschart and Clarkson (2004); all error estimates used here are derived below.

##### 2. A genuine source and a uniform Jost bound

Choose $z=k+i\kappa$ with $k>0$ and $\kappa>0$. The unique outgoing Jost solution obeys

\[
\psi_z''+(z^2-V)\psi_z=0,
\qquad \psi_z(x)=e^{izx}m_z(x),\qquad m_z(\infty)=1.
\]

Its Volterra equation is

\[
m_z(x)=1+\int_x^\infty
 \frac{e^{2iz(y-x)}-1}{2iz}V(y)m_z(y)\,dy.       \tag{S.8.4c.M2}
\]

Since Im $z>0$, the kernel modulus is at most 1/|z|. Also

\[
\int_{x(r)}^\infty V(y)dy
=\int_r^\infty \frac{2}{\rho^2}d\rho=2/r.
\]

Volterra iteration, including its factorial bound, therefore gives

\[
|m_z(r)-1|\le \rho_z(r):=e^{2/(|z|r)}-1,\qquad
\big||m_z(r)|^2-1\big|\le e^{4/(|z|r)}-1.       \tag{S.8.4c.M3}
\]

These estimates use the curved Maxwell equation itself. No flat-space wave is substituted on a curved geometry. They are uniform in $r_{s}$ on the admitted exterior; the local electric lapse factor remains explicit below.

Freeze the standard smoothstep $B(v)=0$ for $v\le0$ and $B(v)=\exp(-1/v)$ for $v>0$, and $S(v)=B(v)/[B(v)+B(1-v)]$. Thus $S=0$ for $v\le0$, $S=1$ for $v\ge1$ and $S$ is smooth and monotone. Set $\chi(r)=S((r-2R)/R)$, understood as a function of $x$. It and every derivative vanish at $x_a$ and it is one for $r\ge b$. Set $\Phi_z=\chi\psi_z$. Let the complex axial angular one-form correspond to the tangent vector

\[
\mathbf S(\mathbf n)=\mathbf n\times(\mathbf e_x+i\mathbf e_y).
\]

It is an $l=1$ divergence-free spherical harmonic. The real potential

\[
A=\operatorname{Re}\{A_*\Phi_z(x)e^{-izq}\,S_A\,d\theta^A\}
\]

has $F=dA$ and current $J^\mu=\mu_0^{-1}\nabla_\nu F^{\nu\mu}$. This current is smooth and supported in $a<r<b$ because

\[
\Phi_z''+(z^2-V)\Phi_z
=\chi''\psi_z+2\chi'\psi_z'.                 \tag{S.8.4c.M4}
\]

It has $J^t=J^r=0$ and divergence-free angular components. Consequently multiplying this current by any smooth function $h(q)$ preserves covariant current conservation. This is an actual sourced Maxwell construction, not an assigned target field. Its radial source in (M1) is minus the right side of (M4), times $e^{-izq}$. The source is determined before choosing the TLS readout or receiving any target observations.

##### 3. Finite causal launch with an explicit residual

The complex-frequency field above is a convenient analytic comparison solution, not the physical initial condition. The physical field starts from zero. Freeze $h_{\mathrm{on}}(q)=S((q+L+R)/R)$, rising over $[-L-R,-L]$, and $h_{\mathrm{off}}(q)=1-S((q-Q_{\mathrm{off}})/R)$. Thus both switching widths are the finite length $R$. Let $Q_{\mathrm{end}}$ be the largest coordinate $q$ of the registered target preparations, exposures and readouts to be protected, and choose $Q_{\mathrm{off}}=\max(0,Q_{\mathrm{end}})+R$. This is later than every protected finite event. Because the impressed source has $x\le 0$, its turn-off can reach outgoing null infinity only at $U\ge Q_{\mathrm{off}}>0$, so the power event $U=0$ is also protected. The impressed drive has compact time and spatial support. The passive conductor's induced current can retain a late tail; it remains spatially confined and supplies no boundary work. No compact-time disappearance of that passive tail is assumed.

Here $L$ and $d$ are lengths in $q=ct$ units. For the unit-amplitude radial comparison field define the finite, explicitly source-determined integrals

\[
\begin{aligned}
C_0&=\tfrac12\int_{x_a}^\infty
 (|z|^2|\Phi_z|^2+|\Phi_z'|^2+V|\Phi_z|^2)dx,\\
C_1&=\tfrac12\int_{x_a}^\infty
 (|\Phi_z''-V\Phi_z|^2+|z|^2|\Phi_z'|^2
       +V|z|^2|\Phi_z|^2)dx,\\
\epsilon_{\rm launch}&=
 \frac{2e^{-\kappa L}(C_0C_1)^{1/4}}{|z|}.       \tag{S.8.4c.M5}
\end{aligned}
\]

They are finite: $\chi$ is smooth and compactly transitioning, the lower endpoint is regular, and the Jost field and all required derivatives decay exponentially at infinity for $\kappa>0$.

For completeness, the proof does not invoke a claimed finite-time disappearance of Schwarzschild tails. For a step launch at $q=v$, the difference $w$ between the actual zero-data solution and the analytic comparison solution is homogeneous after $v$, with data $-e^{-izv}\Phi_z$ and $iz e^{-izv}\Phi_z$. The positive wave energies

\[
\mathcal E[w]=\tfrac12\int(|w_q|^2+|w_x|^2+V|w|^2)dx,
\quad \mathcal E[w_q]
\]

are conserved and initially $e^{2\kappa v}C_0$ and $e^{2\kappa v}C_1$. In the second energy, $w_{qq}=w_{xx}-Vw$; this is why $C_1$ contains $\Phi_z''-V\Phi_z$ rather than an incorrectly substituted $z^2\Phi_z$. A smooth monotone launch is the positive superposition of these step launches with weights $h_{\mathrm{on}}'(v)$. Minkowski's inequality bounds the two energy square roots by $e^{-\kappa L}\sqrt{C_j}$. Finally, half-line Sobolev gives

\[
|w_q(q,x)|^2
\le2\|w_q\|_2\|w_{qx}\|_2
\le4\sqrt{\mathcal E[w]\mathcal E[w_q]},
\]

and therefore

\[
|w_q(q,x)|\le|z|\epsilon_{\rm launch}.          \tag{S.8.4c.M6}
\]

This bound is uniform in x and in all times after the launch and before a later turn-off can affect the event in question. Causality permits using the indefinitely driven comparison when bounding that finite causal region. Choose L also larger than the finite source-to-target optical travel time, ensuring that the interrogation occurs after first arrival.

There is no exact settling claim: (M6) retains the launch field. Freeze $kR=7\cdot 2^{17}$ and $\kappa R=2^{-60}$. After calculating $C_0,C_1$ at that $z$, choose the finite preparation length

\[
L=R+2\max_{r\in\{a,b,r_1,r_2,r_f\}}|x(r)-x_a|+\frac1\kappa
\left[\log\frac{2(C_0C_1)^{1/4}}{|z|\,2^{-40}}\right]_+.
\]

Then $\epsilon_{\mathrm{launch}}\le 2^{-40}$, with positive source/travel safety. This is a nominated analytic quantity, not an empirical tail fit. More generally every fixed positive $\kappa$ and demanded tolerance permit finite $L$. The constants need not remain bounded as $\kappa$ tends to zero; that limit is not used as a physical infinite-duration preparation. The potentially very large finite preparation time and battery capacity are explicitly part of this formal branch, not a claim of practical apparatus feasibility.

##### 4. Exact radiated power normalization, not target fitting

Let $U=q-x$ be retarded length time. For the unit-amplitude, finitely launched radial solution define its outgoing radiation derivative $f'_\infty(U)=\lim_{x\to\infty}u_q(x+U,x)$. Smooth finite-time source data and $V=O(x^{-2})$ give this radiation field by the retarded one-dimensional Volterra construction. Equivalently it is the characteristic limit in the retarded Duhamel formula. Its integrals converge: the positive energy and the boundary give $|u(q,x)|\le\sqrt{2E}\sqrt{x-x_a}$, so $V u=O(x^{-3/2})$ in the limiting source integral. The comparison mode's derivative at $U=0$ is $-iz$. The uniform bound (M6) passes to this limit.

Define

\[
K:=|f'_\infty(0)|^2/|z|^2.
\]

With $\epsilon=\epsilon_{\mathrm{launch}}<1$,

\[
(1-\epsilon)^2\le K\le(1+\epsilon)^2.          \tag{S.8.4c.M7}
\]

The circular $l=1$ mode has instantaneous, angle-integrated Killing luminosity

\[
P_\infty(0)=\frac{8\pi}{3}\epsilon_0 c^3
                 A_*^2|z|^2K.
\]

This follows directly from $\int|\mathbf{n}\times\mathbf{v}|^2d\Omega=8\pi|\mathbf{v}|^2/3$ and the outgoing far-zone Maxwell stress. On the polar axis its instantaneous directivity is exactly $D=3/2$, even for the transient complex radial waveform. Set

\[
A_*^2=\frac{3P}{8\pi\epsilon_0c^3|z|^2K}.      \tag{S.8.4c.M8}
\]

Then P is exactly the actual radiated Killing power at the registered outgoing-power sampling event $U=0$. K is a defined functional of the source equation, geometry and launch waveform, independent of the TLS and its observations. Thus (M8) is a source normalization and not an empirical fit of a target response. It can also be replaced by a finite positive power-averaging window, with its explicitly integrated envelope and launch bound; no Gaussian power-readout assumption is needed.

This is a slowly nonstationary radiated-power protocol. It does not silently identify instantaneous luminosity, mean source work, local received power, and retained energy. The outgoing luminosity is a computed source functional; it does not require an observer or power meter at infinity. Actual local powers, field accumulation, outgoing energy and supplied source work have separate entries in the Maxwell Killing-energy identity. The background retained energy is unchanged under the stated zero-backreaction convention.

Here is an explicit finite source-work/capacity bound. Write $Q=\chi''\psi_z+2\chi'\psi_z'$ and let $h=h_{\mathrm{on}}h_{\mathrm{off}}$ have compact support $[q_0,q_1]$. Define

\[
\mathcal F=\|Q\|_{L^2(dx)}\int_{q_0}^{q_1}|h(q)|e^{\kappa q}dq
\le\|Q\|_2\frac{e^{\kappa q_1}-e^{\kappa q_0}}{\kappa}
\quad(0\le h\le1).
\]

The exact Maxwell Killing energy of this real circular $l=1$ field is

\[
E_{\rm EM}(q)=\frac{8\pi A_*^2}{3\mu_0}\mathcal E[u](q).
\]

The zero-data wave-energy inequality gives $\sqrt{2E_{\mathrm{rad}}(q)}\le\int_{q_0}^q\lVert S(v)\rVert_2\,dv$. Integrating the absolute supplied work therefore yields

\[
W_+\le W_{\rm abs}\le
\frac{4\pi A_*^2}{3\mu_0}\mathcal F^2.       \tag{S.8.4c.M8a}
\]

This is evaluable from the nominated current, cutoff, geometry and pulse, before the TLS data. It bounds positive EM supply, retained/radiating field energy and possible source-return work without counting outgoing radiation again as a second supply cost. Any separately nominated actuator losses, ready hardware and control service energy are additional finite entries. A battery at $a=2R$ needs proper usable energy at least the right side of (M8a)/$N(a)$, plus those separately owned losses.

The final readout nomination uses $n=2^{24}$ parallel, mutually noninteracting effective TLS ports at each target worldline, all exposed to this one deterministic finite field. Each port has its own preparation, work interface and pointer. Conditional on this fixed source, the product initial states, tensor-product Hamiltonian and separate pointers give independent records. This is the declared one-way test-port construction, not an assertion that reciprocal material antennas can be co-located without loading each other. The Maxwell source work (M8a) is counted once; target, support, preparation, interaction and record costs are counted once per port. If instead complete serial source preparations are used, each source pulse and its full resource bound must be counted separately; no free reset of radiation is allowed.

##### 5. Local target field and source-to-target error

At target $i$, measured from its start $q=x_i$, the analytic comparison field is exactly circular with local carrier frequency and growth rate

\[
\omega_d=ck/N(r),\qquad a=\kappa c/N(r).
\]

Its constant Jost/source phase may differ between sites. The final readout keeps fixed reference axes; the arbitrary-phase bound (M12a) does not align to or compensate that phase. Its circular field magnitude at local proper time $\tau=0$ is

\[
\bar E_c^{,2}
=\frac{DP}{4\pi\epsilon_0cr^2}
  \frac{|m_z(r)|^2}{N(r)^2K}.                 \tag{S.8.4c.M9}
\]

At time $\tau$ it has magnitude $\bar E_c e^{a\tau}$. The field phasor convention used in original L.2.1 is $E_0=\sqrt2\bar E_c$ and unit complex polarization $\boldsymbol\epsilon=(\mathbf{e}_x+i\mathbf{e}_y)/\sqrt2$, so $I=\epsilon_0c E_0^2/2=\epsilon_0c\bar E_c^2$. The launch residual vector is bounded in magnitude by $\bar E_c\epsilon/|m_z(r)|$. In particular, when $\rho=\rho_z(r)<1$ it is at most $\bar E_c\epsilon/(1-\rho)$.

For the final distance design choose one common source Killing frequency $ck=\omega_0-\Delta_0$, where $\Delta_0=\omega_0/8>0$. The actual local detunings are

\[
\Delta_i=\omega_0-\frac{ck}{N_i}
=\Delta_0-ck\left(\frac1{N_i}-1\right).       \tag{S.8.4c.M10}
\]

They are positive on the nominated weak-field box, as can be checked directly from (M10). The source's local oscillator at radius $r_{e}$ is $ck/N(r_e)$. This explicitly owns the gravitational frequency conversion. There is no per-row retuning that would silently change the source. In formulas below $\Delta$ means the actual local $\Delta_{i}$ and $\delta=|\Delta_i|$; the nominal $c_{E}$ uses $\Delta_0$. Other registered detuning-sign experiments need their own common-frequency/local-detuning table.

##### 6. Actual effective electric TLS and exact rotating solution

Register a two-dimensional target, with no unowned bath or additional levels on this bounded branch,

\[
H_0=\hbar\omega_0Z/2,\qquad
D_x=d_{\rm eff}X/\sqrt2,\quad
D_y=d_{\rm eff}Y/\sqrt2,\quad D_z=0,
\quad H_{\rm int}=-\mathbf D\cdot\mathbf E.
\]

For the chosen helicity, $|\mathbf{D}_{eg}\cdot\boldsymbol\epsilon|=d_{\mathrm{eff}}$. The constitutive coefficient $d_{\mathrm{eff}}$ is nominated independently of the target results. The constant-amplitude benchmark has

\[
H(\tau)/\hbar=\omega_0Z/2
-\bar\Omega[X\cos(\omega_d\tau)+Y\sin(\omega_d\tau)]/2,
\quad \bar\Omega=\sqrt2d_{\rm eff}\bar E_c/\hbar.
\]

With $R(\tau)=\exp(-i\omega_d\tau Z/2)$, the transformed Hamiltonian is exactly

\[
H_{\rm rot}/\hbar=(\Delta Z-\bar\Omega X)/2.   \tag{S.8.4c.M11}
\]

No counterrotating term was discarded. Let $h=\sqrt{\Delta^2+\bar\Omega^2}$. The eigenbranches continued from zero drive have effective transition frequency $\omega_d+\sigma h$, and therefore shift

\[
\delta_{\rm TLS}=\sigma(h-\delta),\qquad
\left|\delta_{\rm TLS}-\frac{\bar\Omega^2}{2\Delta}\right|
\le\frac{\bar\Omega^4}{8\delta^3}.            \tag{S.8.4c.M12}
\]

The bound follows from the exact square-root Taylor remainder on [0,infinity), not an unspecified big-O constant.

The final nomination uses fixed bare Ramsey preparation $|+\rangle$ and a fixed reference-phase equatorial pointer, without dressed preparation or source-dependent undressing. This has a rigorous bounded deviation from the phase in (M12). To see it, first align transverse coordinates with the drive phase; for an initial transverse Bloch vector, rotation about $n=(-\Omega/h,0,\Delta/h)$ differs in its transverse output from rotation about $\operatorname{sign}(\Delta)Z$ by at most $3(\Omega/\Delta)^2$, uniformly in exposure duration and initial transverse angle. Indeed its transverse projector term has norm at most $2\Omega^2/h^2$ and its sine coefficient differs by $1-|\Delta|/h\le\Omega^2/(2\Delta^2)$. Rotating back to the laboratory axes preserves that bound. Therefore the actual fixed-bare Ramsey bit mean for the constant-amplitude benchmark differs from $\sin(\omega_0T_{\mathrm{ref}}y_b)$ by at most

\[
3(\bar\Omega/\Delta_i)^2.                    \tag{S.8.4c.M12a}
\]

No source-dependent compensating gate is applied. Preparation, finite controls and pointer services are owned as in S.7.3c/S.1c. Any residual-field exposure during those finite controls must be included by extending the (M13) integration interval or by an additional bounded control term. After division by omega0 $T_{\mathrm{ref}}$, (M12a) is the bare-axis contribution to the mean fractional-response error.

The one-way dipole work is also explicitly reserved. For each port on a finite local active interval I, its supplied interaction-work magnitude is bounded by

\[
W_{\rm TLS,abs}\le\frac{d_{\rm eff}}{\sqrt2}
       \int_I|\partial_\tau\mathbf E(\tau)|d\tau.       \tag{S.8.4c.M12b}
\]

This source-derived finite integral, plus its finite local preparation/control/readout costs, is an independent work-port capacity. It is not subtracted from the Maxwell luminosity in the declared nonreciprocal test model and not added to the gravitating background. It is finite and evaluable from the exact retarded field. An explicit upper bound over $[0,T]$ follows by defining $L_0\Phi=\Phi''-V\Phi$ and

\[
C_2=\tfrac12\int\bigl(|z|^2|L_0\Phi_z|^2
 +|(L_0\Phi_z)'|^2+V|L_0\Phi_z|^2\bigr)dx.
\]

The same wave-energy proof bounds $|w_{qq}|$ by $2e^{-\kappa L}(C_1C_2)^{1/4}$, giving

\[
W_{\rm TLS,abs}\le
\frac{d_{\rm eff}c^2 A_*}{\sqrt2 N_i^2 r_i}
\left[|z|^2|m_z(r_i)|\frac{e^{aT}-1}{a}
 +2T e^{-\kappa L}(C_1C_2)^{1/4}\right].
\]

All derivatives are finite for the frozen smooth cutoff. There are 2n such ports in the two-row nomination. Conversion of their proper work to a common Killing-energy ledger uses the relevant $N_{i}$ once.

##### 7. Nonstatic error as a finite-channel bound

For a local interrogation interval [0,T], compare the exact retarded-field TLS unitary U to the constant-amplitude benchmark $U_{b}$. Duhamel's inequality and the operator norm of the registered dipole give

\[
\begin{aligned}
\|U-U_b\|&\le B_{\rm time},\\
B_{\rm time}&=\frac{\bar\Omega}{2}
\left[\frac{e^{aT}-1}{a}-T+
\frac{T\epsilon}{|m_z(r)|}\right]\\
&\le\frac{\bar\Omega T}{2}
\left[e^{aT}-1+\frac{\epsilon}{1-\rho}\right]. \tag{S.8.4c.M13}
\end{aligned}
\]

The $a=0$ expression is interpreted by continuity only as a mathematical bound. The actual preparation uses $a>0$. The bound is uniform over inputs and spectators; the corresponding channel diamond-norm difference is at most $2B_{\mathrm{time}}$, capped by 2. Every event probability changes by at most $\min(1,B_{\mathrm{time}})$, and a $\pm1$ pointer mean changes by at most $2\min(1,B_{\mathrm{time}})$. Therefore a row calibrated as $Y=A/(\omega_0 T_{\mathrm{ref}})$ receives an additional mean-error bound $2B_{\mathrm{time}}/(\omega_0 T_{\mathrm{ref}})$. This is the correct way to pass the nonstatic residual to the finite-readout lemma; it is not silently called a scalar frequency shift.

For n independent copies, a conservative joint-law TV bound is n $B_{\mathrm{time}}$ (capped by 1). If a small joint-law approximation is required, choose the launch and envelope tolerances after choosing finite n. Alternatively use the per-shot mean bound and robust concentration directly. All these choices remain finite.

##### 8. Exact benchmark clock surface and explicit cross term

Let the finite reference lapse be $N_f=N(r_f)$, and $\gamma=N(r)/N_f$. Its proper interval $T_{\mathrm{ref}}$ corresponds to target proper interval $T=\gamma T_{\mathrm{ref}}$. The benchmark fractional response measured against the same bare reference gap is

\[
y_b=(\gamma-1)+\gamma\delta_{\rm TLS}/\omega_0. \tag{S.8.4c.M14}
\]

Define

\[
\Omega_{\rm nom}^2=
\frac{2d_{\rm eff}^2DP}{4\pi\epsilon_0c\hbar^2r^2},
\qquad F=\frac{|m_z|^2}{N^2K},
\quad \bar\Omega^2=\Omega_{\rm nom}^2F.
\]

Then the exact source-to-Stark substitution yields

\[
\left|y_b-(\gamma-1)-c_E P/r^2\right|
\le |c_EP/r^2|\,|\gamma F\Delta_0/\Delta_i-1|
+\frac{\gamma\bar\Omega^4}{8\delta^3\omega_0}. \tag{S.8.4c.M15}
\]

Here $c_{E}$ is the nominal positive coefficient with $|\Delta|=\Delta_0$, and the final design has $\Delta_{i}>0$. The EM/gravity/detuning cross factor is explicit:

\[
\gamma F\frac{\Delta_0}{\Delta_i}
=\frac{|m_z|^2}{N N_f K}\frac{\Delta_0}{\Delta_i}.
\]

For $\rho<1$ and $\epsilon<1$ put

\[
h_-=(1-\rho)^2/(1+\epsilon)^2,
\qquad h_+=(1+\rho)^2/(1-\epsilon)^2.
\]

Thus the full cross factor lies in $[h_-\Delta_0/(NN_f\Delta_i),h_+\Delta_0/(NN_f\Delta_i)]$, giving a directly evaluated rigorous bound on its distance from 1. This includes finite-radius scattering, luminosity normalization, both lapse conversions, local detuning, and their products. It is not an unexplained 'cross correction'.

The gravitational part is the exact $\gamma-1$. Its finite-reference leading term is

\[
-\frac{GM}{c^2}(1/r-1/r_f)
=-\frac{G E_{\rm ADM}}{c^4}(1/r-1/r_f).
\]

If the design instead uses nominal retained material energy E0, the accepted S.1c ADM/binding-energy remainder must also be added. The reference term cannot be dropped. The exact gravity and source-volume errors are supplied by the accepted S.1c bounds, not by this Maxwell lemma.

##### 9. Nonempty finite regime and what this establishes

The candidate design $r_1=4R,r_2=8R$ and $r_f=32R$ admits the whole construction with $a=2R,b=3R$. Freeze $\omega_0=2^{20}c/R$, $\Delta_0=\omega_0/8$, one common $ck=(7/8)\omega_0$, and $T_{\mathrm{ref}}=R/c$. Nominate $d_{\mathrm{eff}}>0$ independently, and choose the source power by the engineering weak-drive scale $\Omega_{\mathrm{nom}}(r_1)=\Delta_0/1024$:

\[
P=\frac{2\pi\epsilon_0c\hbar^2r_1^2
                (\Delta_0/1024)^2}{d_{\rm eff}^2D},
\qquad D=3/2.
\]

This yields nominal electromagnetic responses $x_{\mathrm{bulk}}/16$ and $x_{\mathrm{bulk}}/64$ at the two sites. It is a source/target parameter choice before any observations, not a fitted discrimination result. The actual $\Omega_{i}$ and $\Delta_{i}$ retain the explicitly bounded Maxwell, lapse and detuning factors. The common $k$ gives large $kr$ at both sites. No requirement $\Delta_0/\omega_0\to 0$ is needed for an RWA: there is no RWA here.

For every finite readout duration and finite number of shots, choose $\kappa>0$ small enough to meet the (M13) drift budget. Compute C0,C1 from the source functions and choose finite L large enough to meet the launch budget and travel delay. Pick a finite later turn-off. Every source, field, control and readout resource is finite. Its size may be large and is not claimed experimentally practical. The Maxwell tail remains bounded rather than erased.

This supplies the formal common-geometry source/target transfer and its error ledger. A broader claim additionally requires the parent design's certified positive separation after every listed remainder and its finite-readout/service proof. It does not populate an empirical polarizability, antenna efficiency, material emitter, apparatus noise covariance, or non-test Einstein-Maxwell platform.

#### Fixed bare-axis Ramsey instrument

##### 1. Hamiltonian and fixed physical settings

At a static target, let $\tau$ be target proper time. The local constant-envelope Hamiltonian during interrogation is

$$
H(\tau) = (\hbar/2) \{\omega_0 Z + \Omega [\cos(\omega_d \tau+\phi) X + \sin(\omega_d \tau+\phi) Y]\},
$$

where $\omega_0>0$, $\Omega$ is real, $\Delta=\omega_0-\omega_d$ is nonzero, $\kappa=\sqrt{\Delta^2+\Omega^2}$, and $\sigma=\operatorname{sign}(\Delta)$. The constant drive phase $\phi$ is arbitrary, including an unknown source/Jost phase. The preparation and measurement axes are fixed by the reference and do not depend on $\phi$, $\Omega$, $\Delta$, a source-parameter estimate or the tested hypothesis.

The target is prepared in the bare +X state. The final physical observable is

$$
M_T = \exp(-i \omega_0 T Z/2)\, Y \exp(+i \omega_0 T Z/2),
$$

where $T$ is the common reference-clock proper interrogation interval, and its phase is supplied by the finite reference signal/control service. Both preparation and the rule for $M_{T}$ are the same for all compared source and response hypotheses. They contain no rotation $Q(\Omega,\Delta)$, no phase correction inferred from the target field, no estimated gravitational amplitude, and no desired output phase. The zero of the initial transverse axis is carried by the same ready reference phase record.

In the static geometry let $\gamma=N(r)/N_f$, so the target interval is $\tau=\gamma T$. Reference triggers and their finite null delays establish this interval as in S.1c; the propagation and control services must actually be present in the platform.

##### 2. Exact propagator and exact bit mean

Put $R(\tau)=\exp(-i\omega_d\tau Z/2)$, and $K=(\hbar/2)\{\Delta Z+\Omega[\cos(\phi)X+\sin(\phi)Y]\}$. Direct differentiation gives

$$
U(\tau)=R(\tau) \exp(-i K \tau/\hbar).
$$

Write $n_x=(\Omega/\kappa)\cos(\phi)$, $n_y=(\Omega/\kappa)\sin(\phi)$, $n_z=\Delta/\kappa$ and $p=\Omega^2/\kappa^2$. Rodrigues' rotation formula, or direct Pauli multiplication, gives the rotating-frame Bloch vector of the initially $+X$ target:

$$
\begin{aligned}
x_{\mathrm{rot}} &= \cos(\kappa \tau)+n_x^2[1-\cos(\kappa \tau)], \\
y_{\mathrm{rot}} &= n_z \sin(\kappa \tau)+n_x n_y[1-\cos(\kappa \tau)], \\
z_{\mathrm{rot}} &= -n_y \sin(\kappa \tau)+n_x n_z[1-\cos(\kappa \tau)].
\end{aligned}
$$

Define $C(\tau)=x_{\mathrm{rot}}+iy_{\mathrm{rot}}$. Lab-frame precession multiplies this transverse coherence by $\exp(i\omega_d\tau)$. Therefore the complete retained binary pointer record $A$ in $\{-1,+1\}$ has

$$
\begin{aligned}
m_{\mathrm{exact}} &:= \mathbb{E} A \\
&= \operatorname{Im} \{\exp[i(\omega_d \tau-\omega_0 T)] \\
&\qquad \{\cos(\kappa \tau)+p \cos(\phi) \exp(i \phi)[1-\cos(\kappa \tau)] \\
&\qquad +i n_z \sin(\kappa \tau)\}\},
\end{aligned}
$$

$$
\Pr(A=a)=(1+a\, m_{\mathrm{exact}})/2.
$$

No outcome is discarded and this is a normalized physical qubit measurement. The fixed bare-axis instrument does not have an exactly diagonal phase channel; its actual mean above is retained.

##### 3. Uniform coherent error relative to the dressed clock

Let $p=\Omega^2/(\Delta^2+\Omega^2)$, $b=|n_z|=\sqrt{1-p}$, and $\theta=\kappa\tau$. For every fixed phase $\phi$,

$$
\begin{aligned}
C(\tau)-\exp(i \sigma \theta) \\
&=p \cos(\phi)\exp(i \phi)(1-\cos \theta)+i \sigma(b-1)\sin \theta.
\end{aligned}
$$

Consequently

$$
|C(\tau)-\exp(i\sigma\theta)|\le 2p+(1-b)\le 3p\le 3\Omega^2/\Delta^2.
$$

This is uniform in interrogation duration and in the unknown phase $\phi$. It requires no drive-aligned axes. For the optional aligned special case $\phi=0$ one obtains the sharper expression

$$
\begin{aligned}
C(\tau)-\exp(i \sigma \theta) \\
&=p(1-\cos \theta)+i \sigma(b-1)\sin \theta.
\end{aligned}
$$

Its squared magnitude, as a function of $c=\cos\theta$, is

$$
p^2(1-c)^2+(1-b)^2(1-c^2).
$$

This is a convex quadratic in $c$ on $[-1,1]$, because $p^2-(1-b)^2\ge 0$. Its maximum is attained at $c=-1$ and equals $4p^2$. Consequently

$$
|C(\tau)-\exp(i\sigma\kappa\tau)|\le 2p\le 2\Omega^2/\Delta^2,
$$

uniformly for every interrogation duration. The primary phase-independent design uses the bound $3\Omega^2/\Delta^2$. This quadratic error, rather than an $O(\Omega/\Delta)$ state-distance bound, is what makes a long bare Ramsey exposure useful.

Define

$$
\begin{aligned}
\delta &= \sigma \kappa-\Delta, \\
y_\star &= \gamma(1+\delta/\omega_0)-1, \\
a_0&=\omega_0 T.
\end{aligned}
$$

Since $\omega_d+\Delta=\omega_0$,

$$
(\omega_d+\sigma \kappa)\tau-\omega_0 T = a_0 y_\star.
$$

Hence

$$
\lvert m_{\mathrm{exact}}-\sin(a_0y_*)\rvert\le 3p\le 3\Omega^2/\Delta^2.
$$

This derives the dressed-clock record approximation from a fixed physical dipole Hamiltonian and fixed bare measurement. It does not assume that its quasienergy gap is automatically the measured Ramsey phase. At $\Omega=0$ the bound is zero and the instrument is exactly the bare gravitational-clock comparison, $m_{\mathrm{exact}}=\sin[\omega_0T(\gamma-1)]$.

##### 4. Stark, gravity and cross decomposition

The exact signed dressed shift obeys

$$
\lvert\delta-\Omega^2/(2\Delta)\rvert\le\Omega^4/(8\lvert\Delta\rvert^3).
$$

Indeed $\sqrt{1+t}-1-t/2=-t^2/[2(1+\sqrt{1+t})^2]$ for $t=\Omega^2/\Delta^2$, whose magnitude is at most $t^2/8$. Thus the normalization of Corollary L.2.1 is recovered exactly on its leading branch.

The exact clock rate decomposes as

$$
y_\star=(\gamma-1)+\delta/\omega_0+(\gamma-1)\delta/\omega_0.
$$

The last term is the explicit EM/gravity cross term. The joined proof must also control local drive-frequency detuning, local/Killing flux conversion, finite-radius Maxwell fields, finite-reference/source-binding corrections and their impact on $\Omega$ and $\Delta$. The present target formula accommodates their actual calibrated values.

##### 5. Nonconstant envelope and finite service errors

Let the actual target Hamiltonian during this same local interval be H(tau)+V(tau). If $U_{\mathrm{actual}}$ and $U_{\mathrm{ideal}}$ are its and the displayed ideal unitary, Duhamel's formula gives

$$
\begin{gathered}
\lVert U_{\mathrm{actual}}-U_{\mathrm{ideal}}\rVert\le\epsilon_H, \\
\epsilon_H:=\int_0^\tau\lVert V(s)\rVert/\hbar\,ds.
\end{gathered}
$$

For the same initial state and observable of norm at most one, the mean discrepancy is at most 2 $\epsilon_{H}$. This may be capped at 2. For quadrature/frequency perturbations,

$$
V/\hbar=(\delta_\Delta Z+\delta_{\Omega_x} X+\delta_{\Omega_y} Y)/2,
$$

one may use the exact Euclidean norm of that coefficient vector divided by two, or its componentwise triangle bound, in $\epsilon_{H}$. If the drive phase is time-dependent, work in its actual rotating frame and include the resulting $-(\text{phase derivative})\,Z/2$ contribution once. Do not count the same phase/frequency perturbation twice.

The platform assigns finite preparation, reference-signal, pointer and control errors separately. If their combined half-diamond/half-trace-distance operational error is $\epsilon_{\mathrm{service}}$ for the complete outcome instrument, they change the bit mean by at most 2 $\epsilon_{\mathrm{service}}$. A supplied measurement-observable operator-norm error can instead be added directly. All finite durations, fields, battery transfers, pointer holdings, detector heat and release labels must be recorded; this lemma does not set them to zero merely by writing ideal states and effects.

Consequently a convenient total response certificate is

$$
|m_{\mathrm{actual}}-\sin(a_0y_{\mathrm{leading}})|\le a_0|y_*-y_{\mathrm{leading}}|+3p+2\epsilon_H+2\epsilon_{\mathrm{service}},
$$

using the 1-Lipschitz property of sine. The exact actual m, if explicitly solved, can be used instead of this upper bound.

##### 6. Actual finite records, covariance and fixed design

For n independently prepared replicas conditional on the same deterministic registered source, every outcome is retained and

$$
\begin{gathered}
\mathbb{E}(\bar{A}/a_0)=m_{\mathrm{actual}}/a_0, \\
\operatorname{Var}(\bar{A}/a_0)=(1-m_{\mathrm{actual}}^2)/(na_0^2).
\end{gathered}
$$

Fresh independent target/pointer services at different rows give a diagonal covariance. Common random source/reference/drive variables, if introduced, add their total-covariance terms and are not erased by repeated sampling.

The ideal-sine calibration of the finite observation law below (its item 1) applies with the displayed extra mean discrepancy. In particular, for the raw frequency-scale mean,

$$
|m_{\mathrm{actual}}/a_0-y_*|\le a_0^2|y_*|^3/6+[3p+2\epsilon_H+2\epsilon_{\mathrm{service}}]/a_0.
$$

For hypothesis-class discrimination it is preferable to keep the sine calibration exact on a registered $|a_0y|\le q<\pi/2$ interval. If the ideal sine-mean classes are separated by $d_{m}$, and the actual mean-class corrections have Euclidean bounds $B_E,B_G$, their actual separation is at least $d_m-B_E-B_G$. Only a strictly positive bound supports the discrimination claim.

There is an explicit finite test without Gaussian electronics. For two closed actual bit-mean classes with Euclidean distance $d>0$ in $k$ rows, classify the empirical mean vector by its nearest class (with a fixed tie rule). An error requires $\lVert\bar{A}-m\rVert_2\ge d/2$. Hoeffding's inequality and a union bound give

$$
\Pr(\text{error}) \le 2k \exp[-n_{\min} d^2/(8k)].
$$

Thus the finite choice $n_{\min}\ge(8k/d^2)\log(2k/\alpha)$ gives error at most $\alpha$. This is a uniform class-separation statement, not a pair-dependent instrument. It is independent of whether a Gaussian reduction is used.

##### 7. Nominated long-time member

With the proposed $\omega_0=2^{20}c/R$ and common reference interval $T=R/c$, $a_0=2^{20}$. For nominal $\Omega/|\Delta|=2^{-10}$, the phase-independent uniform bare-axis bit-mean error is at most $3\cdot 2^{-20}$, and its frequency-scale error at most $3\cdot 2^{-40}$. A literal inverse-sine-calibrated frequency error additionally divides this bound by $\cos(q)$; the main statistical test instead retains sine exactly and subtracts the displayed error in mean-bit space.

At the proposed $x=2^{-20}$, $s=x/2$, target radii $4R$ and $8R$, and reference $32R$, the leading gravitational phases are $-7/32$ and $-3/32$. If the specified weak-drive ratio is normalized at $4R$ and $|\Delta|=\omega_0/8$, the nominal electromagnetic phases there and at $8R$ are 1/16 and 1/64. The summed leading phases are $-5/32$ and $-5/64$. These numbers lie well inside, for example, $q=1/2$. The joined source/Maxwell errors must still verify that the actual domain stays inside that registered interval; these arithmetic values alone do not certify the complete platform.

Long exposure suppresses the frequency-scale bare-axis error without changing the physical controls by the unknown response. Any proposed amplitude variation in a hypothesis class must remain in its preregistered weak-drive, phase and service-error domain.

#### Finite observation law and design

##### 1. Exact instrument and calibration

For each design row $i$, a nominated physical Ramsey exposure produces the phase $\theta_i=\omega_iT_iy_i$ on the calibrated target/reference coherence. A preparation $|+\rangle$, that phase unitary, and an equatorial $Y$-basis pointer measurement give $A_{i}$ in $\{-1,+1\}$ with mean $m_i=\sin(\theta_i)$. Every outcome is retained. Actual phase preparation/transfer, basis controls, finite reference and pointer services must be supplied by the platform; the formula alone is not a replacement for a dipole clock.

Take $n_{i}$ independently prepared test replicas at each row, conditional on one fixed registered static source. No random common source sector is suppressed. Put $a_i=\omega_iT_i>0$ and $Y_i=\operatorname{mean}(A_i)/a_i$. Then

$$
\begin{aligned}
\mathbb{E}\, Y_i&=\sin(a_i y_i)/a_i, \\
\mathrm{Var}\, Y_i&=[1-\sin^2(a_i y_i)]/(n_i a_i^2).
\end{aligned}
$$

Distinct rows use disjoint pointers, Gaussian/noise services if any, and fresh independently prepared targets. For the deterministic source the covariance is diagonal. If source parameters are random and privately retained, total covariance must additionally include $\operatorname{Cov}(\mathbb{E}[Y\mid J])$; merely repeating a held source does not divide that term by $n$.

For $|a_iy_i|\le q<\pi/2$ the calibration $y\to\sin(a_iy)/a_i$ is injective with derivative at least $\cos(q)$. Its exact inverse is $\arcsin(a_i\mathbb{E}Y_i)/a_i$. The raw estimator mean differs from $y_{i}$ by at most $a_i^2|y_i|^3/6$. No inverse is assigned outside its registered interval, and noisy out-of-range data are not silently clipped into a successful certificate.

##### 2. Exact finite-law distinguishability

Two phase-response vectors y,z in the same q-box obey

$$
\lvert m_i(y)-m_i(z)\rvert\ge a_i\cos(q)\lvert y_i-z_i\rvert.
$$

For a row with $p_y=(1+m_i(y))/2$ and $p_z=(1+m_i(z))/2$, thresholding its empirical success frequency at $(p_y+p_z)/2$ has each simple-hypothesis error at most $\exp[-n_i(p_y-p_z)^2/2]$ by Hoeffding. Therefore any nonzero certified response separation is detectable with a finite explicitly selected $n_{i}$. This does not claim a uniform test for nuisance-parameter classes with no separation; those classes must have a positive certified margin.

More generally, if a response-class distance is $d>0$ in Euclidean norm for $k$ rows, some row has separation $\ge d/\sqrt{k}$. Its bit mean separates by at least $\min_i(a_i)\cos(q)d/\sqrt{k}$. A finite net/class decision may use all rows and must account for its union bound. The accepted linear-model projection theorem supplies a nominal margin; all physical/readout remainders must be subtracted before asserting a positive physical margin.

##### 3. Optional Gaussian reduction

Attach an independently supplied Gaussian electronics source $Z_i\sim N(0,\sigma_i^2)$, $\sigma_i>0$, to the retained readout, with its preparation, storage and addition services explicitly priced. This source is optional and is not needed for exact finite-law identifiability. Actual $Y_{i}$ becomes $\operatorname{mean}(A_i)/a_i+Z_i$. Its exact density is a finite binomial mixture of Gaussians, not a Gaussian. Its covariance is exactly
$\Sigma_{\mathrm{actual},ii}=\sigma_i^2+[1-m_i^2]/(n_ia_i^2)$.

Let $Q$ be the nominal common-covariance Gaussian law with mean vector $m_i/a_i$ and $\Sigma_Z=\operatorname{diag}(\sigma_i^2)$. Translation of a scalar Gaussian satisfies $\mathrm{TV}(N(u,\sigma^2),N(v,\sigma^2))\le|u-v|/(\sigma\sqrt{2\pi})$. Convexity, a coordinate coupling, and Cauchy--Schwarz therefore yield

$$
\mathrm{TV}(\mathrm{Law}(Y),Q)\le\sum_i\sqrt{1-m_i^2}/(\sqrt{n_i}\,a_i\sigma_i\sqrt{2\pi}).
$$

The physical-to-leading-response bias $b_{i}$ adds at most $\sum_i|b_i|/(\sigma_i\sqrt{2\pi})$. Thus the accepted common-Gaussian design theorem can be consumed with a displayed total variation remainder and the electronics covariance $\Sigma_{Z}$, without misusing the exact signal-dependent covariance or calling a finite spin experiment Gaussian. The Gaussian approximation error tends to zero as $n_{i}$ grows at fixed positive electronics noise.

##### 4. Finite reference changes the leading design

For a EM-decoupled finite reference at $r_{f}$ and the original nominal spherical retained energy $E_0$, the leading weak-field response is

$$
v_i=-E_0(1/r_i-1/r_f),
$$

with amplitude $c_G=G/c^4$. A reference at finite radius is not a zero-potential clock. Its lapse is included exactly in the actual phase map and the leading reference term is retained here.

With fixed radiated power $P$ and matched leading electromagnetic coefficient, $u_i=P/r_i^2$. For $r_1\ne r_2$,
$\det[u,v]=-PE_0(r_2-r_1)[1-(r_1+r_2)/r_f]/(r_1^2r_2^2)$.

Consequently the finite-reference design is identifiable precisely when $r_f\ne r_1+r_2$ (besides positive $P,E_0$ and distinct radii). The nominated geometric choice $r_1=4R,r_2=8R,r_f=32R$ satisfies this with factor 5/8. This is a nonzero exact determinant; no signal data chose it. Local lapse conversion of power and drive frequency, Stark nonlinearities, source binding energy and finite-radius Maxwell errors are additional explicit terms, not erased by this determinant.

##### 5. Source-independent engineering nomination

A possible frozen weak design uses S.1c material parameters $x=2^{-20},s=x/2,w=1/6$ and arbitrary chosen independent radius unit $R>0$, the three radii above, local target gap $\omega_0=2^{20}c/R$, positive $|\Delta|=\omega_0/8$ and nominal weak-drive ratio $\Omega/|\Delta|=2^{-10}$. These are engineering ratios, not measured or fitted EM/gravity coefficients. The actual emitted power must be computed from the source Maxwell/current normalization and target dipole; it is not assigned by the desired discrimination result. This nomination is provisional until those services and all remainders have a common source-bound realization.

#### Finite services, work, timing and momentum

##### 1. Additional test boundary, expressly stated

The exterior Maxwell solution is driven by the specified origin current. Its target TLS factors are one-way effective test dipoles: the imposed classical field enters each target Hamiltonian, while their polarization does not enter the emitter's Maxwell equation. This is distinct from zero gravitational backreaction, and both boundaries are part of the registered source. Every target interaction/control port separately supplies or receives its Hamiltonian work. The emitter-only Poynting balance is not claimed to pay that work. A self-consistent reciprocal Maxwell source with many charged atoms is a different assertion, not silently obtained here.

The constituent effective target is exactly the declared two-dimensional dipole of item 6 of the bounded curved Maxwell part above, not a microscopic commuting-position model. Its independently chosen $d_{\mathrm{eff}}>0$ has units C m. The original L.2.1 dipole/field boundary is the consumed constitutive model. Any explicit realization of the source names both boundaries.

##### 2. Finite assay and actual stock

Use $n=2^{24}$ noninteracting effective target factors at each site $r_1=4R,r_2=8R$. Thus there are $2n$ targets, $2n$ ready binary pointers and $2n$ binary outcome stores. They are all prepared before one common finite interrogation and exposed in parallel to the deterministic classical field, so the emitter waveform is not reset or replayed $n$ times. The joint Hamiltonian is a tensor sum of the declared individual target Hamiltonians; pointer controls act on separate target/pointer pairs. Product readiness therefore gives independent records conditional on the fixed source. Neither common random source noise nor an unproved refresh law is hidden.

For each target there is one ready preparation, at most two local rotations for preparation and reference-frame readout, one target/pointer controlled-copy unitary, and one finite-duration native binary record instrument. A local principal logarithm implements each specified finite-dimensional unitary, with operator norm of its dimensionless Hermitian generator at most $\pi$. Equivalent rotations can be combined; the upper service census uses four such finite-duration control slots per target, each of proper duration
 $t_c=2^{-60}R/c$.
A fifth duration-$t_c$ slot is reserved for the native detector/read/copy service. All slots, unused identities included, are installed and retained. Ready targets/pointers and record services are native formal primitives with their specified energy/reference/control ports, not inferred for free from an entropy formula.

The target gap is independently fixed at $\omega_0=2^{20}c/R$. During control slots the unremoved ambient target/drive Hamiltonian contributes a norm-integral error. If $|\Omega|\le 2^8c/R$ throughout these finite slots, its contribution per unitary is at most $(\omega_0+|\Omega|)t_c/2<2^{-40}$. Four slots give $<2^{-38}$. A native detector has its nominated exact instrument with no further mathematical error; any nonideal alternative must supply a replacement error certificate. The corresponding per-target bit-mean service error is $<2^{-37}$. No cancelling pulse tuned to a hypothetical unknown carrier amplitude is used. Actual reference-axis commands are fixed by the independent reference phase rule; arbitrary constant drive phase is handled by the uniform bare-Ramsey bound.

For a waveform choice $h(s)=1-\cos(2\pi s/t_c)$, the controlled generator $H_c(s)=\hbar h(s)G/t_c$ has integral $\hbar G$, vanishes at both endpoints and implements $\exp(-iG)$ in the isolated native control slot. Its peak norm is $\le 2\pi\hbar/t_c$, and total norm variation $\le 4\pi\hbar/t_c$. The ambient Hamiltonian is not erased; the above Duhamel bound accounts for it. This supplies an explicit finite upper reservation for every installed control port, independent of target outcomes.

##### 3. Target interaction and control work

For a deterministic time-dependent finite Hamiltonian $H_j(t)$, the target's signed work is the actual integral $W_j=\int\operatorname{tr}[\rho_j(t)\,dH_j/dt]\,dt$. The state is the unique actual source-driven unitary solution and all postmeasurement branches are retained. The port capacity can be reserved before outcomes by

 $$
 C_j=\int\lVert dH_j/dt\rVert\,dt,
 $$

with separate supply and return capacity each $C_{j}$. This bound includes the actual drive/reference/control waveform on every finite slot. The constant bare gap contributes readiness holding energy, not a repeated work debit.

For the circular drive, over a local duration $T_{j}$ and amplitude $\Omega(t)$, a sufficient drive-port reservation is

 $$
 C_{\mathrm{drive},j}\le(\hbar/2)\int(|d\Omega/dt|+|\Omega(t)|\omega_d)\,dt,
 $$

plus the finite launch-field variation contribution calculated from its smooth Maxwell solution. Equivalently one may use the exact integral $\lVert dH_{\mathrm{drive}}/dt\rVert$ for that source-defined solution. The latter is the controlling value if its tighter derivative bound is not evaluated. It is finite on the finite closed campaign because the current, turn-on profile and field are smooth. The source packet fixes those functions, so this is an exact source functional, not an unspecified 'enough energy' placeholder.

Add the four native control reservations $\le 16\pi\hbar/t_c$ per target, the ready target/pointer/record holdings, and the explicit detector/reference-service energy quantities. Reference and detector are the accepted finite native service convention with assigned positive fixed ready/holding/operation tariffs. In this new nomination take one independent energy unit $E_c=\hbar c/R$ for each native ready binary pointer, record and detector event; hold each for the actual finite interval at tariff $E_{c}\,c/R$. A zero logical Hamiltonian is not a zero installation or retention tariff. These service tariffs are separate resource costs, not gravitational energy or a claim of thermodynamic minimum.

Each target uses at most its exact source-defined $C_{\mathrm{drive},j}$ plus $16\pi\hbar/t_c$ for supply reservation, the same capacity for possible returned work, and its ready gap/reference stock. The $2n$-factor total sums those entries once. The Maxwell emitter work reservation from its positive wave-energy estimate is a separate row; it does not multiply by $n$ and does not include target interaction work. Total source/target work is their sum plus the finite native service tariffs. No field flux, returned work, stored energy or readiness holding is entered twice.

##### 4. Timing and retention

Use one global tortoise coordinate. Each site begins its interrogation at the event whose outgoing retarded coordinate $U=q-x(r_i)$ is zero. Row-specific finite reference launch offsets deliver those starts; their separation interval is the same reference proper $T_{\mathrm{ref}}=R/c$. All initial preparations finish before the corresponding start. The reference and source waveform phase are independent predeclared controls. No observation determines a start time, gap, amplitude or source parameter.

End each record's retention only after a common release later than the largest finite outward drive travel, target interrogation, five local service slots, and return null travel to the finite reference, with an additional R/c guard. S.1c supplies the exact finite null-delay integrals. Every target, pointer, control descriptor, reservoir/return capacity and outcome record is held through that release; the finite waveform preparation may begin at the much earlier source launch and its own stock remains held for that complete interval. The Maxwell turn-off must be later than the protected interrogation region as specified in the bounded curved Maxwell source construction. Any persisting scattering tail and conductor surface current after the drive ends remain owned field/source contents; they are not claimed to vanish at turn-off.

##### 5. What is and is not proved

Every prescribed gate, source pulse, test target and pointer occurs a finite number of times with a finite duration, bounded Hamiltonian/reservation and finite retention interval. Actual field/current work and target/control work have different ports and are explicitly summed. This completes the finite inventory at the stated native service boundary. It is not a microscopic construction of those admitted services or a resource optimum.

##### 6. Momentum and reference ownership clarification

The finite reference is an EM-decoupled clock constitutive service: its coupling to the nominated source mode is exactly zero. No unmodeled conducting screen at $r_{f}$ is inserted into the solved Maxwell geometry. A practical shield would scatter and requires its own current/error problem; it is not claimed here.

The impressed-current actuator and inner conductor also have an external support four-force port. The local Maxwell force density $F^{\nu\lambda}J_\lambda$, and the boundary Maxwell traction on the perfect conductor, are assigned once to that support/actuator record. The field identity $\nabla_\mu T_{\mathrm{EM}}^{\mu\nu}=-F^{\nu\lambda}J_\lambda$ includes all four components. Their Killing-energy contraction is the work row already counted, not a second energy debit. Static support forces can be nonzero despite zero mechanical power. Their actual force/impulse functionals over the finite campaign are fixed by the same field/current solution and surface stress, are finite, and are retained alongside the work/battery record. The target/test-port force and internal Hamiltonian work likewise belong to their separate external interaction/support service, not the emitter's reciprocal Maxwell tensor.

Late passive conductor currents and finite-energy scattered field may remain at the final release. They are explicit endpoint field/apparatus stock, not silently erased or claimed to have compact duration. The source's preparation/assay/release ledger ends with that retained stock. No instantaneous disposal or cost-free source reset is assumed.

#### Joined error and populated covariance certificate

##### 1. Exact nomination

Use the actual S.1c material branch, the Maxwell source and the finite service invoice as written. Set $x=2^{-20},s=x/2,w=1/6$, independent radius $R>0$, fixed independent physical constants $c,G,\hbar,\epsilon_0>0$ and dipole $d_{\mathrm{eff}}>0$ with their stated units. Source current lies in $2R<r<3R$, perfect inner conductor at $2R$; sites $4R,8R$ and EM-decoupled reference $32R$. Fix $\omega_0=2^{20}c/R$, $\Delta_0=\omega_0/8$, $kR=7\cdot 2^{17}$, $\kappa R=2^{-60}$. The emitter power is

 $$
 P=2\pi\epsilon_0 c\hbar^{2}(4R)^{2}(\Delta_0/1024)^{2}/(d_{\mathrm{eff}}^{2}D),\quad D=3/2.
 $$

This fixes $\Omega_{\mathrm{nom}}(4R)=\Delta_0/1024$, with inverse-radius amplitude at $8R$. The source's exact positive radiation functional $K$ normalizes the current amplitude; no target observation or fitted response enters it.

Use the same frozen smooth cutoff and on/off functions, explicit finite $L$, retarded-$U=0$ target starts and common reference interval $T=R/c$. Source amplitude, gap, reference, controls, readout, $n=2^{24}$ parallel copies/site and all holdings/work ports are frozen before data. The actual local $\Delta_i=\omega_0-ck/N_i$ is positive. There is one common $k$, never a radius-dependent retune. Unknown constant Jost/drive phase does not change any measurement axes; the general $3p$ bare-axis bound handles it.

##### 2. Primitive exact inequalities

Write $x_0=2^{-20}$ for the fixed readout normalization $a=\omega_0T=1/x_0$. To certify a useful comparison envelope, allow nominal gravitational scale $X\in[0,2x_0]$ and electromagnetic amplitude-squared multiplier $e\in[0,2]$. The nominal chosen physical platform has $X=x_0,e=1$. The finite-predicate comparison laws need only carry these explicitly bounded component/error records, not an assertion that every arbitrary coefficient is the same microscopic material.

At all sites $r\ge 4R$, $\eta\le 2X$. Hence
 $N_i^{2}\ge 1-X/2=:n_{2\mathrm{lo}}$,
 $N_f\ge 1-X/16=:n_{f\mathrm{lo}}$,
 $\gamma_i\le 1/n_{f\mathrm{lo}}$,
 $\Delta_i/\Delta_0\ge 8-7/n_{2\mathrm{lo}}=:d_{\mathrm{lo}}>0$.
The inequalities use $\sqrt{1-t}\ge 1-t$. They are conservative and remain valid on the entire stated weak box.

For $\epsilon=2^{-40}$, $t=2/(4kR)$, the Volterra and elementary exponential bounds give

 $$
 \rho\le t/(1-t),
 $$

 $|m_z|^{2}\le 1/[1-4/(4kR)]=:m_{2\mathrm{up}}$,
 $|m_z|^{2}\ge(1-\rho)^{2}=:m_{2\mathrm{lo}}$,
 $K\in[(1-\epsilon)^{2},(1+\epsilon)^{2}]$.
Here $\exp(t)\le 1/(1-t)$ follows termwise from its positive power series for $0\le t<1$. No floating-point transcendental evaluation is needed.

Put $F_{\mathrm{up}}=m_{2\mathrm{up}}/[n_{2\mathrm{lo}}(1-\epsilon)^{2}]$. The combined Maxwell/lapse/local-detuning factor is bounded above by

 $$
 C_{\mathrm{up}}=m_{2\mathrm{up}}/[n_{2\mathrm{lo}}n_{f\mathrm{lo}}(1-\epsilon)^{2}d_{\mathrm{lo}}]
 $$

and below by $C_{\mathrm{lo}}=m_{2\mathrm{lo}}/(1+\epsilon)^{2}$. The lower bound uses $N_i,N_f\le 1$ and $\Delta_i\le\Delta_0$. Thus the EM leading-response correction is at most $U_{\max}\max(C_{\mathrm{up}}-1,1-C_{\mathrm{lo}})$, with $U_{\max}=ex_0/16$.

##### 3. Complete coordinate error sum

All entries below are bounds in the calibrated fractional-frequency coordinate. For mean errors the inverse-sine conversion explicitly uses $1/[a\cos(q)]$, with $q=1/2$ and $\cos(q)\ge 7/8$. The statistical proof may equivalently retain raw mean tubes.

- Gravity, including nominal/material/ADM binding and finite reference: $(45/4)X^{2}$, from accepted S.1c. No second binding correction is added.
- Maxwell/flux/local-detuning/cross: $U_{\max}\max(C_{\mathrm{up}}-1,1-C_{\mathrm{lo}})$.
- Higher Stark: $\gamma_{\max}U_{\max}(ex_0)F_{\mathrm{up}}^{2}/(4d_{\mathrm{lo}}^{3})$.
- Fixed-axis Ramsey correction, arbitrary constant phase: $(8/7)x_0\cdot 3(ex_0)F_{\mathrm{up}}/d_{\mathrm{lo}}^{2}$.
- Nonstatic launch/envelope: $(8/7)x_0\cdot 256F_{\mathrm{up}}\gamma_{\max}[g/(1-g)+\epsilon/(1-\rho)]$, with $g=2^{-60}\gamma_{\max}$. Here $\sqrt{e}\le 2$, $\sqrt{F_{\mathrm{up}}}\le F_{\mathrm{up}}$ and $\Omega_{\mathrm{nom}}(4R)T=128$; the actual target interval and slow-envelope exponent are included. This is a unitary/bit-mean bound, not an asserted scalar drive shift.
- Finite controls/readout service: $(8/7)x_0\cdot 2^{-37}$, using the fixed native gate durations and actual ambient Hamiltonian bound of the finite-services part above.

The sum is less than $1.433\cdot 10^{-5}x_0$ at the nominated member, and less than $5.062\cdot 10^{-5}x_0$ throughout the displayed comparison envelope. Both are strictly below the reserved $10^{-4}x_0$ coordinate budget. The decimal displays summarize the exact positive rational bounds specified above; the governing reservation is $10^{-4}x_0$.

The nominal phase vector is $(-5/32,-5/64)$ before these small errors. Original pure-model coefficient boxes of the strict robust discrimination part below stay within $|ay|\le 7/16$ plus their displayed remainder, strictly within $q=1/2$. Thus the inverse bound is applied only on its proved interval. No raw sine linearization is used; its cubic bias would be too large for this budget.

##### 4. Actual populated covariance and records

Let $U_i^{\mathrm{actual}}$ be the unique time-ordered $2\times 2$ propagator of the actual smooth retarded Maxwell field plus fixed finite controls. Let $\rho_i^{\mathrm{ready}}$ be its fixed prepared density operator and $M_i^{\mathrm{actual}}$ the actual finite native pointer effect difference. The exact, fully source-defined bit mean is

 $$
 m_i=\operatorname{tr}[M_i^{\mathrm{actual}}U_i^{\mathrm{actual}}\rho_i^{\mathrm{ready}}(U_i^{\mathrm{actual}})^*].
 $$

All operands are explicit functions of the frozen source solution, controls and independently given constants; this is a specified deterministic functional, not an unpopulated empirical parameter. Equivalently the construction supplies the exact constant-envelope mean and the rigorous actual mean interval from the source/control errors. The actual probabilities are $(1\pm m_i)/2$, and the complete $2n$-bit law is their product because the source is deterministic and test/record factors do not interact.

The original output covariance is therefore explicitly
 $\Sigma=\operatorname{diag}[(1-m_1^{2})/(na^{2}),(1-m_2^{2})/(na^{2})]$
for the two raw frequency-scaled sample means. It is strictly positive: all actual means lie within $\sin(1/2)$ plus the certified mean error, hence their magnitudes are below $1/2$. In particular $3/(4na^{2})<\Sigma_{ii}\le 1/(na^{2})$. The exact source-defined values and certified intervals, rather than an assumed Gaussian sampling law, are the populated formal covariance record. No hidden common random source variable is discarded.

The precise nearest-class test, tie rule, actual finite-error confidence and positive original pure-carrier-model separation are given in the strict robust discrimination part below. Statistical comparison uses the exact binary laws. The Gaussian electronics/reduction of the finite observation law (its item 3) is optional and lies outside the nominated source/invoice.

#### Strict robust discrimination and finite records

##### 1. Frozen source and leading columns

Use $x=2^{-20},s=x/2,w=1/6$, $r_1=4R,r_2=8R,r_f=32R$, $\omega_0=2^{20}c/R$ and $T=R/c$. Nominal detuning $\Delta_0=\omega_0/8$. Set the emitted intensity scale through the independently chosen source/target normalization so that the flat-leading Rabi amplitude at $r_1$ obeys $\Omega_1/\Delta_0=2^{-10}$. This fixes the required emitter power from its Maxwell geometry and separately specified dipole; it does not fit a gravitational or observational outcome. Its inverse-radius flat-leading amplitude at $r_2$ is half $\Omega_1$.

Then the leading normalized electromagnetic shifts are $U=(x/16,x/64)$. The original nominal retained energy $E_0$ gives the finite-reference gravitational column $V=(-7x/32,-3x/32)$. Thus the two-column design is

$$
A=x\begin{bmatrix} 1/16 & -7/32 \\ 1/64 & -3/32 \end{bmatrix}.
$$

$\det A=-5x^{2}/2048$ and $\lVert A\rVert_F^{2}=249x^{2}/4096$. Its smallest singular value obeys

$$
s_{\min}(A)\ge|\det A|/\lVert A\rVert_F=5x/(32\sqrt{249})>0.0099x.
$$

The physical source does not assert that its gravitational field can be turned off, or that E is the same as EM energy. As in the original response-surface problem, the columns are independently derived physical contributions to the registered leading response. A proposed carrier-only explanation occupies one column subspace; the actual simultaneous-source response has both components. No candidate-dependent rescaling of raw clock data is used.

##### 2. Original response parameter interpretation

For coefficient labels $\alpha=(\alpha_E,\alpha_G)$, the leading prediction is $A\alpha$, with nominal physical $\alpha=(1,1)$. Coefficient identifiability is an inference statement: if two admissible prediction/error records have residual norm at most $e$, then their physical mean responses are separated by at least
$s_{\min}(A)\lVert\alpha-\alpha'\rVert_2-2e$.

This does not claim every arbitrary $\alpha$ corresponds to the same microscopic material, nor that a scalar amplitude substitution preserves the full nonlinear source. Each model's admitted error record must justify its own box. At nominal $\alpha=(1,1)$, distance of $A\alpha$ from the full EM-only subspace is

$$
|\det A|/\lVert U\rVert_2=[5/(32\sqrt{17})]x,
$$

and distance from the full gravity-only subspace is

$$
|\det A|/\lVert V\rVert_2=[5/(64\sqrt{58})]x.
$$

The latter, smaller distance is about0.01026x. These are distances to unrestricted single-column fits, so restricting their amplitudes cannot reduce the margin. They are positive even though both physical effects are small. Full source-model and readout errors must be subtracted from these values before rejecting a carrier-only explanation. This is the original distinguishability purpose; it is not a full gravity/quantum unification claim.

##### 3. Explicit sufficient error budget

It is sufficient to prove an absolute error $\le 10^{-4}x$ in each response coordinate, including source binding/metric truncation, Maxwell finite-radius/curvature transfer, drive detuning redshift and higher Stark, with the nonstatic/control/bare-axis mean errors converted using the explicit inverse factor $1/[a\cos(q)]$. Two competing such error tubes remain separated from the nominal two-carrier vector by at least the above smaller nominal margin minus $2\sqrt{2}\,10^{-4}x$, still positive. This is only a convenient sufficient budget; a different actual certified error below the margin is also valid.

One already available contribution is the accepted S.1c bound $|\gamma_i-1-g_i|\le 5(x+s)^{2}=45x^{2}/4<1.1\cdot 10^{-5}x$. With the uniform constant circular-drive bare-axis bound $|m_{\mathrm{actual}}-\sin(ay)|\le 3(\Omega/\Delta)^{2}$, $a=\omega_0T=2^{20}$, its raw mean discrepancy divided by $a$ is at most $3\cdot 2^{-40}<2.9\cdot 10^{-6}x$; an actual inverse-sine frequency error additionally divides by $\cos(q)$ at the nominal amplitude ratio, before the small source correction factors are included. The fourth-order Stark correction is relative at most $(\Omega/\Delta)^{2}/4$ to its leading shift. Remaining terms require the Maxwell/source proof; they are not assumed zero.

The phase box $|ay|<\pi/4$ holds for the nominal leading source and any sufficiently small displayed total correction. For example nominal components satisfy $|a(U_i+V_i)|\le 5/32$. The exact source proof must verify this after its corrections.

##### 4. Finite-sample use

With fixed bare Ramsey settings, write the exact bit means $m_{i}$. The calibrated ideal sine maps separated frequency-response sets to separated mean-bit sets on the $q$-box with factor $a\cos(q)$, after the bounded physical/axis deviations are subtracted. For two admissible mean sets separated by $d_{m}>0$ in $k$ coordinates, nearest-set classification of empirical bit means has worst-case error at most
$2k\exp[-n_{\min}d_m^{2}/(8k)]$.

The proof is Hoeffding for $A\in[-1,1]$ plus a union bound: an error requires $\lVert\hat{m}-m\rVert_2\ge d_m/2$ and therefore one coordinate deviation $\ge d_m/(2\sqrt{k})$. Thus $n_{\min}\ge(8k/d_m^{2})\log(2k/\alpha)$ is a finite sufficient repetition count for any prescribed positive error $\alpha$. All $n_{\min}$ copies, preparations, pointers and complete records must be charged. The raw covariance remains the exact Bernoulli covariance, not the Gaussian approximation's covariance.

##### 5. Fixed finite comparator and sampling domain

All compared response records use the same source/reference/control settings. Retain only the declared phase-calibrated branch $|a_0y_i|\le q=1/2$, where $a_0=2^{20}$. No discrimination claim is made for arbitrary unbounded amplitudes that wrap the Ramsey phase. The original task asks a registered platform; this explicit dynamic-range limit is its sensor calibration, not an asserted universal amplitude classifier. The distances to the full carrier-only linear subspaces remain valid lower bounds after intersecting those subspaces with this branch.

If the coordinate error bound in §3 is actually proved for the admitted compared records, the two-row mean-space gap from the nominal two-carrier source to either carrier-only class is at least
$\cos(1/2)[5/(64\sqrt{58})]-2\sqrt{2}\,10^{-4}>0.0087$.

This expression keeps the nonlinear sine calibration exactly; it does not use the much larger cubic linearization error of a raw sine readout. It reserves the displayed error for each competing source record. If a comparator has a larger distinct error, its own error must replace that reservation.

Take $n_1=n_2=2^{24}$ independent target/pointer instances. The nearest-class bound is at most $4\exp[-2^{24}(0.0087)^{2}/16]<10^{-30}$. One may instead choose a much smaller $n$ for a specified tolerance, but this explicit finite choice demonstrates nonvacuity. Exact outcome covariance is positive because $|m_i|$ is below $\sin(1/2)$ plus the small certified mean error, strictly below 1.

The finite assay may use n noninteracting test TLS factors at each of the two static sites, prepared and exposed in parallel to the deterministic classical drive, with n separate outcome pointers and records. Conditional independence then follows from the tensor-product target Hamiltonian, product ready state and separate pointer instruments, rather than an unproved refresh of the whole Maxwell field after each trial. The background/test convention sets their backreaction coupling to zero; actual source/control/target/record resources remain charged n times. The source radiation is counted once for the shared classical field, not n times as independent emitted fields. If a different repetition scheme is used, it must supply its own causal/reset/error ledger.

##### 6. Direct original EM-only versus gravity-only comparison

For the original two-carrier-model comparison, declare
 $C_{\mathrm{EM}}=\{a_EU:1/2\le a_E\le 2\}$,
 $C_G=\{a_GV:1/2\le a_G\le 2\}$.
The common instrument, source/reference axes and readout rule are fixed. These are the original carrier-model predictive laws, not a claim of switching off gravity in the same actual material. Each admitted law carries a certified total response/mean error at most the stated tube. It is a bounded, explicit model class; no uniform accuracy over arbitrary unbounded unknown amplitudes is asserted.

For every pair, $\lVert a_EU-a_GV\rVert\ge s_{\min}(A)\sqrt{a_E^{2}+a_G^{2}}\ge s_{\min}(A)/\sqrt{2}$. Therefore the ideal frequency-law distance exceeds $0.00700x$. Their nominal phases stay within $q=1/2$: the largest gravity phase has magnitude $7/16$, and the largest EM phase $1/8$. After a $10^{-4}x$ per-coordinate tube for each law, and using exact sine rather than linearizing it, their bit-mean distance is at least
 $\cos(1/2)[5/(32\sqrt{498})]-2\sqrt{2}\,10^{-4}>0.0058$.

With $n=2^{24}$ pointers per row, the original EM-only versus gravity-only classification error is therefore at most $4\exp[-2^{24}(0.0058)^{2}/16]<10^{-14}$. This is in addition to the separate mixed-source identifiability/rejection statement in §2. If both carrier-only classes are rejected, the conclusion is that neither single-carrier explanation fits, not that the design selected one.

The nominal EM and gravity component laws are explicit nonempty predictions obtained from the separately derived mechanisms. For a more ambitious physical hypothesis family, its claimed error tube must be derived uniformly from its own same-source parameter family; the present statistical class definition does not supply that missing physics. The concrete platform's nominal physical error is verified by the joined error table, and scaled component comparison bounds can be checked on the displayed finite coefficient box.

#### Exact covariance coordinate clarification

##### Original interface and its realization

Proposition S.8.4b defines the leading physical fractional-frequency response y and then registers an additive Gaussian statistical model for its formal linear-design theorem. The comparison equivalence is that carrier models are compared by the laws they induce on the design data. The full task is to populate $c_{E}$, P/E ledgers and $\Sigma$ for a registered platform, bound higher-order remainders and realize the design; a complete formal platform without experimental samples is within this scope.

Theorem S.8.4c supplies a stronger explicit finite observation channel instead of asserting that finite binary observations are Gaussian. Its physical parameter is the calibrated fractional-frequency $y$; its ideal conditional bit mean is $\sin(ay)$; its actual source law differs by the proved bounded mean corrections. This known map is injective on the registered $|ay|\le 1/2$ domain. The complete actual product-binomial law, its raw scaled-bit covariance and an exact decision test are populated. Therefore it satisfies the original observable/discrimination interface, while it does NOT invoke the Gaussian GLS formulas for those non-Gaussian data.

In particular, the $\Sigma$ of the joined error and populated covariance certificate is exactly Cov(bar A/a), not Cov(arcsin(bar A)/a), and E(bar A/a) is not y. Its inverse-cos factor transports mean/model error bounds only; it does not transport covariance through a nonlinear function.

##### Optional explicitly calibrated statistical coordinate

For completeness, a calibrated estimator and its exact finite covariance can be defined on the same already retained records, without changing any experiment. This is deterministic statistical analysis, not a new physical pulse or an assumption of an exact analog hardware compiler.

Let $n=2^{24}$, $a=2^{20}$, $q=1/2$, $p_i=(1+m_i)/2$, and $K_{i}$ be the number of $+1$ outcomes at site $i$. The exact distribution is $\operatorname{Binomial}(n,p_i)$, independently between rows. Define the explicitly clipped calibration table

$$
g(k) = \arcsin(\operatorname{clip}(2k/n-1, -\sin q, \sin q))/a,\quad k=0,\dots,n.
$$

The estimator is $\hat{y}_i=g(K_i)$. Clipping is an explicit statistical definition; it is neither discarded outcomes nor a claimed exact inverse for noisy out-of-range samples. Every bit remains retained. Write

$$
\begin{aligned}
w_{ik} &= \binom{n}{k} p_i^k (1-p_i)^{n-k}, \\
\mu_i &= \sum_{k=0}^n w_{ik} g(k), \\
\Sigma_{\mathrm{cal},ii} &= \sum_{k=0}^n w_{ik} [g(k)-\mu_i]^2, \\
\Sigma_{\mathrm{cal},12} &= \Sigma_{\mathrm{cal},21} = 0.
\end{aligned}
$$

These are exact finite source-defined expressions. They are not obtained by substituting the raw $\Sigma$ into an arcsin derivative. Since $0<p_i<1$ and $g$ is nonconstant, $\Sigma_{\mathrm{cal},ii}>0$.

The function $g$ extended to the empirical bit mean is Lipschitz with constant $1/[a\cos(q)]\le 8/(7a)$, including across its clipping boundaries. The certified actual means satisfy $|m_i|<\sin(q)$, so let $y_{\mathrm{eff},i}=\arcsin(m_i)/a$. Cauchy--Schwarz gives the rigorous sampling-bias bound

 $$
 |\mu_i-y_{\mathrm{eff},i}|\le\sqrt{1-m_i^{2}}/[a\cos(q)\sqrt{n}]\le 8/[7a\sqrt{n}]=(8/7)x_0/4096<2.791\times 10^{-4}x_0.
 $$

Using an independent copy of the empirical mean and $\operatorname{Var}(f(B))=\mathbb{E}[(f(B)-f(B'))^{2}]/2$ also gives

$$
\begin{aligned}
0 < \Sigma_{\mathrm{cal},ii} &\le (1-m_i^2)/[n a^2 \cos(q)^2] \\
&\le 64(1-m_i^2)/(49 n a^2).
\end{aligned}
$$

The physical/model error between $y_{\mathrm{eff},i}$ and the leading $y_{i}$ is separately bounded by the joined certificate ($<10^{-4}x_0$). Thus any statement about the expectation of this optional calibrated estimator must add its displayed finite sampling bias. The candidate never needs this optional estimator's bias for its published margin or confidence: its actual classification operates directly on the exact raw bit-law mean classes and Hoeffding bound. No covariance or bias is implicitly transferred between these two statistical coordinates.

### S.8.5 Theoretical Integration Points

Several framework elements require both appendices for complete understanding:

**1. Bounded-bias premise and endpoint-complete consequence**
- Branch premise: $\alpha_{CC,\max}<0.5$
- Endpoint-complete consequence: Theorem 39 (Section 10)
- Conditional gravitational interpretation: Section S.5 (this appendix)
- The branch premise, theorem consequence, and gravitational model remain logically distinct

**2. Context power requirement**
- Scaling law: Equation S.5 (this appendix)
- Energy accounting: Theorem L.6 (Appendix L)
- Channel distribution: Theorem L.8 (Appendix L)

**3. Stress-energy tensor $T_{\mu\nu}^{(MPU)}$**
- Construction: Definition B.8 (Appendix B)
- Decomposition: Equation L.37 (Appendix L), refined as Equation S.9 (this appendix)
- CC contribution: $\Delta T_{\mu\nu}^{(CC)}$ (Section S.2, this appendix)
- Conservation: Theorem B.5 (Appendix B)

**4. Horizon thermodynamics**
- Area law derivation: Theorem 49, Appendix E
- Application to CC: Theorem L.7 (Appendix L)
- Self-limitation from thermodynamics: implicit throughout this appendix

**5. PCE optimization**
- General framework: Definition 15, Appendix D
- Complexity adaptation: Theorem D.8 (Appendix D)
- CC-specific optimization: Section S.4 (this appendix)
- Mapping existence: Theorem L.1 (Appendix L)

### S.8.6 Energy Accounting Consistency

Assume the mutually exclusive channel ledger of Theorem L.6 and Equations (L.38) and (L.40). Then $P_{\mathrm{agg}}$ is partitioned so that each registered channel contributes once to $T_{\mu\nu}^{(MPU)}$, and $P_{\mathrm{context}}$ splits into radiated and non-radiated components according to that ledger. If the common source also lies on the regular local-equilibrium branch of Theorem B.5, it is covariantly conserved in distributions; on the smooth on-shell variational branch the conservation equation holds pointwise. Channel exclusivity comes from the L.6 ledger, while conservation comes from the separate B.5 hypotheses.

## S.9 Conclusion

This appendix models gravitational feedback from contextual communication. On the stated branches, retained context energy produces weak timing changes, bounded optimization, and selected correlation effects while preserving the causal marginal.

### Technical conclusion ledger

This appendix develops a conditional gravitational-feedback model for operational CC.

**Branch-qualified results:**

1. **Power law:** S.5 follows on the global quadratic operational-cost branch. Proposition S.1a negatively resolves derivation of that global law from Definition 3a's general cost hypotheses by an admissible $\gamma_p=3$ counterexample. A local Taylor law does not imply endpoint divergence.
2. **Source term:** The context contribution to stress-energy uses the retained instantaneous energy $\eta_{\mathrm{ret}}P_{\mathrm{context}}\tau_c$ and a specified perfect-fluid closure.
3. **Proper-time response:** $\Delta\tau_d=KP_{\mathrm{context}}$ follows for the uniform spherical, weak-field geometry, with $K$ carrying $\eta_{\mathrm{ret}}$.
4. **Utility maximizer:** S.27 is the unique interior maximizer of the truncated phenomenological utility when its small-CC and weak-response conditions hold. Appendix-D concentration requires an additional potential-identification and detailed-balance package.
5. **Collapse ceiling:** $r_s<R_S$ gives a system-dependent ceiling distinct from the independently declared bounded-bias endpoint.
6. **Entangled statistics:** A local gravitational phase channel can change selected joint correlations while preserving Bob's marginal; the late-randomized Bob-marginal anomaly is the separate branch-(iii) hypothesis of Postulate 3.
7. **Phase and dephasing:** Deterministic time dilation gives coherent phase rotation. Dephasing requires unresolved noise, a source trace, or the saturated chronometric ND-RID response law.
8. **Appendix-L composition:** Electromagnetic and gravitational maps compose only for an implementation satisfying both source, partition, response, and causal certificates.

Accordingly, gravitational self-limitation is an admissible mechanism on the combined cost, source, geometry, dephasing, and response branches.

**Causality terminology rule.** Every endpoint, bias-strength, gravity-backreaction, or zero-error bound in this appendix is weaker than operational causality. Postulate 2 means exact pre-lightcone context independence by Theorem 39c; a late-randomized Bob-marginal shift lies outside that branch.
