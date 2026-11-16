# Exact on-shell stress, cosmological congruence and elliptic join

## Result and scope

There is an explicit, healthy, four-material-field Einstein branch on a genuine
four-dimensional spacetime slab which supplies all of the following together:

* an action whose **actual metric variation** is the source tensor;
* a solution of both its metric and all its material Euler–Lagrange equations;
* a normal cosmological congruence with spatially inhomogeneous expansion;
* identically zero shear, strictly positive predictive-stress variance, and
  strictly positive literal Definition-I.3e backreaction;
* an elliptic equation and a finite source-variance/source-rate bound of physical
  dimension L^-2;
* an explicit positive spectral-gap lower bound and finite computable smooth
  source/flux error bounds.

This is an exact **continuum joining construction**; by itself it is not the
complete source construction. Its remaining inputs are a response-faithful native
MPU realization of the declared material action, with its complete stock and
controller stress included, and the selected finite-network convergence to its
**warped**, not flat, operational metric. Those inputs cannot be replaced by a
Poisson-label assignment, by declaring the apparatus stress absent, or by
identifying a flat operational metric with this curved physical metric. They
belong to the native-stock and geometry parts of the common source.

The native realization and the metric selection are treated in
NATIVE_CANONICAL_COMMON_REFINEMENT_THEOREM.md and
MATERIAL_EQUATION_METRIC_SELECTION.md. The former uses the admitted direct
native finite-interaction class, so no separate simulator is required. The
common source clock, full stock ledger and actual convergence constants remain
explicit there.

The material action is a prospective model choice. It is not asserted to
follow uniquely from PU primitives or to explain astronomical data. No
galaxy/cluster/lensing/CMB result is used or claimed.

PU paper sources: Appendix I, Definitions I.3e/h and Theorem I.3i; Appendix B,
B.8/B.8c/B.8d.1.

## 1. Fixed physical units, domain and geometry

Set c=1. Let ell>0 be a fixed physical length and kappa>0 the gravitational
coupling, with [kappa]=L^2 in hbar=1 units. Material fields are dimensionless.
Use dimensionless coordinates (tau,x,y,z), with 1<=tau<=2 and x,y,z modulo 2pi.
Fix **before evaluating any backreaction**

    epsilon = 1/100,
    b(tau,x) = tau exp(epsilon tau cos x),
    Hbar(tau,x) = 1/tau + epsilon cos x.

The Lorentzian physical metric and Euclidean operational metric on the retained
four-dimensional averaging domain D=[1,2]×T^3 are

    g_L = ell^2[-d tau^2 + b^2(dx^2+dy^2+dz^2)],
    g_E = ell^2[ d tau^2 + b^2(dx^2+dy^2+dz^2)].                  (1)

The physical normal congruence is u=ell^-1 partial_tau. Its proper time is
ell tau. The reflection map is explicit: g_E=g_L+2 u_flat⊗u_flat. Thus the
fourth averaging coordinate is **actual time**, not a duplicated spatial record.
The normalized measure is proportional to b^3 d tau dx dy dz. Definition I.3e
is used literally as its four-dimensional spacetime average. This does not
pretend that the usual three-dimensional Buchert average equals that average.
Both are computable; both have nonzero variance on this branch.

### Ambient operational geometry

A smooth positive periodic extension of b embeds the retained g_E into a compact
smooth four-torus X. For example, in a time circle of period 4, set

    eta(u)=exp(-1/u) for u>0, and eta(u)=0 for u<=0,
    chi(u)=eta(u)/(eta(u)+eta(1-u)),
    psi(s)=chi(2s-1) chi(5-2s),
    b_ext(s,x)=exp(psi(s)[log s + epsilon s cos x])

inside (1/2,5/2), and b_ext=1 off that interval. This is smooth at
both joins, periodic, and equals b exactly on [1,2]. Its global range is
1/3<b_ext<3: the exponent is a convex interpolation between zero and
log s+epsilon s cos x, whose minimum exceeds log(1/2)-0.025 and
whose maximum is less than log(5/2)+0.025. Set g_X=ell^2(ds^2+b_ext^2 d x^2).
The cutoff must be registered as part of the geometry; its derivatives give a
finite explicit Ricci lower bound K. Smooth compact (X,g_X,H^4) is noncollapsed
RCD(K,4). This elementary continuum fact does not supply the required *selected
MPU finite graph family*, its discrete BE bound, or the source-selection map.

Only the physical slab is claimed to solve the positive-material Einstein
model. The extension is an operational compactification, not a claim that
physical time is periodic or that the same positive-material solution exists
on a Lorentzian torus. If a global Lorentzian solution on all of X is required
rather than a retained regular chart, this compactification does not supply it.

## 2. One fixed covariant material action

There are four material clock/rod fields Phi^A taking values in
(1/2,5/2)×T^3. They are a nonlinear sigma model, with a positive target metric
F_AB on a neighborhood of the retained slab and positive potential V.
Let g^* denote the **fixed analytic metric formula (1)** as a function of its
four coordinate arguments. Define the material coefficient functions

    F_AB(Phi) = kappa^-1 [R_AB[g^*](Phi)
                         - (ell^-2 (Phi^0)^-2) g^*_{AB}(Phi)],
    V(Phi) = 1/[kappa ell^2 (Phi^0)^2].                         (2)

These are fixed local coefficient functions of the material fields, **not**
functions of the dynamical spacetime metric. Their explicit component formulas
appear below, so (2) does not hide a field-equation solver inside the action.
The action is

    S = (1/(2kappa)) integral R[g] sqrt(-g) d^4x
        - integral [1/2 F_AB(Phi) g^{mu nu}
                    partial_mu Phi^A partial_nu Phi^B + V(Phi)]
                    sqrt(-g) d^4x.                           (3)

Compactly supported variations in the interior are sufficient. Boundary terms
for a variational initial/boundary-value formulation use the standard metric
boundary term and do not alter the local equations.

The branch is

    g=g_L,       Phi^A=(tau,x,y,z).                            (4)

The rod fields are circle-valued. Their differentials are global, and their
winding is retained rather than introducing a coordinate jump into a difference
operator.

### Explicit coefficients and positive kinetic energy

Write q=epsilon tau cos x, b=tau e^q, h=1/tau+epsilon cos x.
The nonzero coordinate components of R_AB[g^*] are

    R_00 = -6 epsilon cos x/tau - 3 epsilon^2 cos^2 x,
    R_01 = R_10 = 2 epsilon sin x,
    R_11 = 2 epsilon tau cos x + (-1/tau^2+3h^2)b^2,
    R_22 = R_33 = epsilon tau cos x
                    - epsilon^2 tau^2 sin^2 x
                    + (-1/tau^2+3h^2)b^2.                   (5)

All other components vanish. There are no implicit fitted functions.
For positivity, congruence-transform kappa F by diag(1,b^-1,b^-1,b^-1).
Its 00 entry is at least 1/4-6epsilon-3epsilon^2. Its 11 entry is at least
1/4-6epsilon-2epsilon exp(4epsilon). Its 22 and 33 entries are at least
1/4-6epsilon-(epsilon+epsilon^2)exp(4epsilon). Its only off-diagonal entry
has absolute value at most 2epsilon exp(epsilon). Gershgorin therefore gives

    lambda_min >= 1/4 - 6epsilon - 2epsilon exp(4epsilon)
                        - 2epsilon exp(epsilon) > 0.14.      (6)

The omitted 00 subtraction 3epsilon^2 still leaves its own Gershgorin lower
bound above 0.16, so it does not weaken (6). The 22/33 bounds are larger.
The sigma-model kinetic matrix is consequently strictly positive. The potential
is also strictly positive. No ghost field or negative kinetic reservoir is used.
Continuity permits a slightly larger open slab with the same positivity.

## 3. Actual stress and all field equations

Metric variation of the second integral in (3), with F held fixed as a function
of Phi, gives

    T_mu nu = F_AB partial_mu Phi^A partial_nu Phi^B
              - g_mu nu[1/2 F_AB g^{alpha beta}
                 partial_alpha Phi^A partial_beta Phi^B + V]. (7)

On (4), let c=ell^-2 tau^-2. Then F=kappa^-1(R-cg), V=c/kappa, and

    1/2 tr_g F + V = (R/2-c)/kappa.

Substitution into (7) gives **exactly** T=G[g_L]/kappa. Thus the Einstein
equation from (3) is satisfied, including its Hamiltonian and momentum
constraints, not just one selected component.

The material Noether identity is

    nabla_mu T^mu_nu = E_A partial_nu Phi^A,

up to the immaterial convention for the overall sign of E_A. The left side
vanishes by the contracted Bianchi identity, and dPhi has full rank. Therefore
every material equation E_A=0 holds. The verification program `verify_stress.py`
also checks these four equations directly, independently of that argument.

This is an inverse-designed but fixed material source action. It meets the
mathematical common-action/on-shell requirement. Calling it the actual PU
predictive action still requires the native realization described in Section 9;
that identification is not obtained by the above algebra alone.

## 4. Actual expansion, shear and nontrivial observables

From (1), not from an assigned elliptic variable,

    theta = nabla_mu u^mu = (3/ell)(1/tau+epsilon cos x),
    K_ij = -(theta/3) h_ij,
    sigma_ij = 0.                                           (8)

The congruence is geodesic and hypersurface orthogonal. On the full D,

    Q_D = (2/3) Var_D(theta) > 0.                            (9)

Strictness follows because theta is not constant on any open subset and the
volume density is positive. The spatial part itself varies: on every tau slice,
its x derivative is -3epsilon sin x/ell. Thus this is not solely temporal
variance in a homogeneous FRW source. The literal four-dimensional value is
reported by a convergent numerical diagnostic in STRESS_VERIFICATION.json;
positivity is analytic and does not depend on that diagnostic.

Define the source tensor variance in the registered global synchronous
orthonormal frame (u,ell^-1 b^-1 partial_x,ell^-1 b^-1 partial_y,
ell^-1 b^-1 partial_z), using the positive Frobenius tensor norm. This fixes the
otherwise unspecified tensor-variance norm. The nonzero momentum component is

    T_hat0hat1 = 2epsilon sin x/[kappa ell^2 b].              (10)

It is odd in x while the volume weight is even, so its mean is exactly zero.
It is nonzero on a set of positive measure. Hence Var_D(T)>0 and

    <|j|^2>_D <= Var_D(T),      j_i=-T(u,e_i).               (11)

The full Frobenius norm actually counts this off-diagonal component twice; the
weaker bound (11) avoids a convention-dependent improvement.

Observable outputs are proper-time expansion theta, shear magnitude zero,
T in the stated orthonormal frame, and the normalized four-dimensional moments
in (9). They are fixed functions of the same material/metric solution. A native
readout must be calibrated to these functions; they are not assigned labels on
an unrelated graph solution.

## 5. Exact source-energy rate

The actual normal-frame energy density rho=T(u,u) is

    rho = [3h^2 + 2epsilon tau cos x/b^2
                    - epsilon^2 tau^2 sin^2 x/b^2]
                    /(kappa ell^2).                        (12)

The source-energy rate is r=u(rho)=dot rho, a signed physical density rate,
with dimension L^-5. Its dimensionless numerator is

    kappa ell^3 r = -6/tau^3 -6epsilon cos x/tau^2
       -2epsilon cos x exp(-2q)/tau^2
       -4epsilon^2 cos^2 x exp(-2q)/tau
       +2epsilon^3 cos x sin^2 x exp(-2q).                  (13)

For tau∈[1,2], epsilon=0.01, the absolute deviation of
kappa ell^3 tau^3 r from -6 is bounded by

    E = 12epsilon + 4epsilon exp(4epsilon)
           +16epsilon^2 exp(4epsilon)
           +16epsilon^3 exp(4epsilon) < 0.164 < 3.

Consequently

    |r| >= 3/[kappa ell^3 tau^3],
    |u(theta)| = 3/[ell^2 tau^2] <= 2kappa ell |r|.          (14)

This r is the actual change of material energy density along the flow, including
cosmological dilution. It is not asserted to be a separate external free-energy
injection. If the source-rate symbol dot rho_src means only external injected
power, then r must be passed under a distinct declared rate entry, or an
admissible conversion must be supplied. Silently renaming dilution as injected power
would be invalid. The closed material model has no external drive on shell.

## 6. Elliptic source-control certificate

On each slice, the Einstein momentum constraint for (8) is

    grad_h theta = (3kappa/2) j.                            (15)

Let alpha=u(theta)/r. This is smooth, computable, and |alpha|<=2kappa ell by
(13)–(14). Let dt=ell d tau be the unit Euclidean time covector. On D define

    W = alpha r dt + (3kappa/2) j_flat.

The two components are orthogonal in g_E and, by (14)–(15),

    grad_E theta = W^sharp,
    -Delta_E theta = -div_E W^sharp,
    partial_nu theta = W(nu) on the two time faces.         (16)

The last two lines are an elliptic divergence-form equation with its actual
conormal data. Equivalently, for every H^1 test v,

    integral <grad theta,grad v> = integral <W,grad v>.

Constants are fixed by the measured mean theta. Testing with theta-<theta>
gives the standard energy inequality; here the stronger gradient identity also
holds. Equations (11) and (14) give

    <|grad_E theta|^2> <= kappa^2[(9/4) Var_D(T)
                                      +4ell^2 <r^2>].      (17)

This is an equation-derived source bound for the actual cosmological theta.
It does not rely on calling an arbitrary Poisson solution an expansion.

### Spectral gap and Cheeger normalization

Put Ch_D(f)=c_Ch <|grad_E f|^2>, with c_Ch=1/2 for the standard Cheeger
convention (or c_Ch=1 if the upstream energy uses that convention). Define
lambda_1 by the ratio Ch/Var. The statements below retain c_Ch so no
factor-of-two disagreement can be hidden in the graph-to-Cheeger join.

For the product metric g_0=ell^2(d tau^2+d x^2) on D, the ordinary Neumann
Laplacian gap is ell^-2. On D,

    e^-epsilon <= b <= 2e^(2epsilon),
    w_max/w_min <= 8e^(9epsilon),
    g_E <= 4e^(4epsilon) g_0.

Comparison of normalized variance and energy gives the explicit Poincare bound

    Var_D(f) <= P_D <|grad_E f|^2>,
    P_D = 32 e^(13epsilon) ell^2,
    lambda_1(D) >= c_Ch/P_D > 0.                            (18)

Combining (17)–(18), the required quantity is bounded by

    lambda_1^-1 Ch_D(theta) + <sigma^2>
      <= B_D^ell[V_T,r,B,H],

    B_D^ell = P_D kappa^2[(9/4)V_T +4ell^2 <r^2>] + B + H,  (19)

for nonnegative dimension-L^-2 defect budgets B,H. The continuum geometric and
horizon-transfer errors are zero when exact fields and exact flux integrals are
used; finite implementations receive the positive errors in Section 8. Each
term of (19) has dimension L^-2: V_T has L^-8, r^2 has L^-10,
P_D has L^2 and kappa^2 has L^4. No unstated dimensional constant is needed.
Theorem I.3i then gives |Q_D|<=2B_D^ell once its independent geometric and
native-source hypotheses are actually populated.

### Optional certificate avoiding the source-rate interpretation

A pure source-variance certificate is available on this fixed retained branch.
From (12), the dimensionless density differs from 3/tau^2 by at most

    d_rho = 6epsilon+3epsilon^2+(2epsilon+epsilon^2)exp(4epsilon)
           < 0.082.

Consequently every density value on E=[1,5/4]×T^3 exceeds every value on
L=[7/4,2]×T^3 by more than 3/(4kappa ell^2). Each band has normalized
D-measure at least exp(-9epsilon)/32. The pairwise variance identity yields

    Var_D(T) >= Var_D(rho)
        >= 9 exp(-18epsilon)/(16384 kappa^2 ell^4).          (20a)

On the other hand |grad_E theta|^2 <=
[9+9epsilon^2 exp(2epsilon)]/ell^4. At epsilon=0.01 their ratio is less
than 20000 kappa^2. Therefore the alternative

    B_D^ell[V_T,r,B,H] = 20000 P_D kappa^2 V_T + B + H       (20b)

proves the same required bound while ignoring the rate argument entirely.
It remains dimension L^-2. This is deliberately loose and specific to the
registered source family/domain; it is not claimed as a universal stress bound.
It removes any need to equate cosmological dilution with externally injected
source power. The sharper certificate (19) applies if r has the declared
energy-density-rate interpretation.

## 7. A simpler exact initial-slice alternative

If an operational record lift S1_record×T3 is allowed instead of the
literal four-dimensional spacetime domain above, one canonical material scalar
already supplies an exact initial-data branch. In ell=kappa=1 units, put

    phi=(1/4)cos x,  Pi=1, h_ij=delta_ij,
    theta=3-(3/2)phi, K_ij=-(theta/3)h_ij,
    V(phi)=79/32-3phi+(5/4)phi^2.

V has strictly positive minimum 107/160. Its scalar energy satisfies exactly
rho=theta^2/3, and j=-Pi grad phi gives grad theta=(3/2)j. Thus both Einstein
constraints hold. The smooth Einstein-scalar local development supplies the
actual congruence, not a relabeled graph field. On the initial slice,

    sigma=0, Var(theta)=9/128, Q=3/64,
    Var_Frobenius(T)=9747/8192 >0.

The source-only elliptic bound is lambda^-1 Ch(theta)<=
(9kappa^2/(4mu_1)) Var(T), with ordinary Laplacian gap mu_1.
This is an especially simple check, but the record-coordinate typing is an
additional assumption and is **not** used for the primary literal-spacetime
construction in Sections 1–6.

## 8. Finite action, derivatives and computable defects

Here is a precise finite variational discretization interface, not an assertion
that its physical MPU stock already exists. On each retained material cell z_v,
with a registered coordinate cell volume w_v and a circle-aware derivative
D_mu^h, define

    S_m,h = -sum_v w_v sqrt(|g_v|)
       [1/2 F_AB(Phi_v) g_v^{mu nu}
                    D_mu^h Phi_v^A D_nu^h Phi_v^B + V(Phi_v)]. (20)

Its actual independent cell-metric variation gives exactly

    T_h,mu nu = F_AB(Phi_v) D_mu Phi^A D_nu Phi^B
                   - g_v,mu nu L_h,                         (21)

with r_h(delta g)=0 in B.8c's metric-variation identity when the source measure
is the corresponding quadrature measure. On the identity winding field, the
registered local derivatives are exact, so (21) samples (7) exactly. Every
coefficient in (20) is an explicitly computable analytic function on a compact
positive interval. Rational interval evaluation gives a finite coefficient and
metric-variation error at every prescribed precision.

The metric-variation convergence is full-family Riemann convergence, not an
unexplained subsequence selection. For a Lipschitz integrand f on a mesh with
physical cell diameter h,

    |sum_v vol(cell_v) f(z_v) - integral_D f|
       <= h Vol(D) sup_D |grad f|.                          (22)

The integrands for all first variations, energy, theta moments and tensor
moments are explicit analytic functions. Their derivative suprema are finite
and computable from (2), (5), (8), (12), and a specified test norm. This supplies
terminating interval upper bounds, not a fitted asymptotic O(h).

A finite difference solution need not be exactly on shell merely because its
sampled continuum fields are. Residuals of the finite material equations and
any controller action **must be recorded**. Either solve the finite equations
with an independently proved stable convergence theorem, or include the exact
control-force/work/stress action and show its total first variation vanishes
in the common limit. (20)–(22) alone do not establish that physical realization.

### Source-rate, horizon and output errors

For a horizon/null patch entirely inside the retained slab, canonical sigma
matter has

    T(k,k)=F_AB(k.Phi^A)(k.Phi^B)>=0.

Its heat flux is computed from the same tensor (7), not a separately declared
source. A registered patch embedding, null tangent, generator and quadrature
give a continuous explicit integrand. If its derivative bound is L_flux, the
face Riemann error is at most h L_flux times its parameter-domain volume.
If a generator is approximated by -kappa_H lambda k with remainder
|r_chi|<=C_chi lambda^2, the additional exact B.8d remainder bound is
C_T C_k C_chi A ell_H^3/3. The required constants can be obtained by interval
integration of the null/geodesic ODE on this explicit smooth compact slab.
No claim that a non-Killing cosmological patch has C_chi=0 is made.

These are flux errors; converting them into dimension-L^-2 H in (19) requires
the actual source-to-elliptic transfer coefficient. If the native geometry
certificate uses no horizon transfer for this local equation, H=0 is justified
by that absence, not by pretending a nonzero numerical flux error vanished.
The same rule applies to BE consistency errors B: the graph certificate supplies
that map. Formula (19) can carry any nonnegative certified budgets once they
have the stated physical units.

## 9. Native material and controller realization: exact remaining requirement

A physical implementation should register:

1. Four material coordinate registers/oscillators per site, with the rod winding
   sectors and the bounded clock interval, local kinetic matrix F and potential
   V from (2), and positive edge couplings implementing the spatial term of (20).
2. The autonomous material Hamiltonian or a complete unitary/digital simulation
   of it, with all oscillators, finite precision registers, coupling apparatus,
   clock stocks, preparation/reset work and source carriers in one ledger.
3. A finite on-shell or controlled-history sequence, with a quantitative action,
   stress, energy-rate and output convergence certificate to (3)–(4).
4. The metric-response identity for the **whole paying apparatus**, not only the
   simulated sigma-model observable. Uniform apparatus energy may be absorbed
   into a declared cosmological/reference source only through an actual common
   variational calibration; nonuniform apparatus stress may not be discarded.
5. A common operational metric selected from that source and converging to (1)
   on D, together with the 4D noncollapse/BE/PI/Mosco certificate. The same cell
   measures and physical ell must enter (20), the metric and the observables.

The passive classical material interpretation of (3) explicitly declares its
physical primitives. A finite native MPU construction implementing them is a
separate theorem, not supplied by calling the action 'microscopic'. A universal
simulator that outputs the correct numbers does not by itself identify its
own stress with (7). This is the narrow remaining common-source requirement.

## 10. Verification and falsifiers

`verify_stress.py` computes Ricci from the
Christoffel symbols, checks (5), metric variation T=G/kappa, all four material
Euler–Lagrange equations, rho, the momentum constraint, the alternative scalar
Hamiltonian constraint, the analytic positivity/rate margins, and convergent
finite quadrature diagnostics. Its results, in `STRESS_VERIFICATION.json`,
distinguish exact symbolic identities from numerical diagnostics.

Falsifiers include: a failed Ricci/source identity; a negative eigenvalue of F
on the retained domain; a wrong expansion or shear computed from g_L; a failure
of the rate lower bound; a metric/source/control implementation whose total
variation does not converge to (7); or an operational graph family converging
to a metric other than g_E while claiming this common branch.
