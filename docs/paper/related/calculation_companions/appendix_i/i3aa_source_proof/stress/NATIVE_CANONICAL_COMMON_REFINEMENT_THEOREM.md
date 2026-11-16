# Native canonical common-refinement source theorem

## Admitted native primitive and scope

CERTIFIED_NATIVE_SOURCE_SEARCH.md gives the preferred form of two parts of this
construction: an autonomous potential using the already counted material clock,
in place of the external profile controller of Section 3, and an actual
finite-U/metric-derivative interval-certificate search, in place of an
acceptance condition stated through an unidentified constant C_J. The
external-profile controller is kept below, but it is not the preferred
controller.

The construction uses the following precise native class, also used by the
companion source construction: a directly declared finite self-adjoint
many-body Hamiltonian on native 8-dimensional tensor factors, with a total
matrix-entry oracle, complete code/noncode extension, actual physical
coefficient/material dependence, and a paid finite description/preparation
record. Such a Hamiltonian is the literal material interaction, not a digitally
simulated observable. This is the crucial additional premise, not assumed in
FINITE_CANONICAL_SOURCE_AND_IR_SCALING.md. In the PU paper, Appendix B,
Definition B.4, explicitly registers self-adjoint system–auxiliary interactions
with their matrix elements and coupling scale as branch data. Section 2 of
`refined_join/MASTER_CONSTRUCTION_THEOREM.md` records the full-native positive
Hamiltonian/entry oracle and paid description/stock convention. This
construction uses that class, not the companion construction's galaxy response
or its numerical outputs.

Under that premise the sigma-model material source below has an explicit native
Hamiltonian, source operators which really are its metric derivatives, full
positive vacuum energies, and a terminating common-refinement construction.
The common autonomous clock/history and its additional source stress still
belong to the integration in the master construction
(`construction/INDEXED_MASTER_CONSTRUCTION.md`). This theorem does not
charge those sources zero. All limits here use an explicitly rescaled macroscopic length.

## 1. Three separately recorded scales

Use the actual geometry constructor's indices, not an invented identification
of coordinate pitch and propagation length. For geometry refinement k,

    R_k=80*2^k,
    N_k=8*10^28 R_k^3,
    rho_k=R_k/N_k,
    n_macro,k=N_k/R_k.

If the fixed physical **propagation** length is delta_prop, define

    ell_k=delta_prop/rho_k=delta_prop N_k/R_k,
    eta_k=hbar kappa/ell_k^2=c_0 rho_k^2,
    c_0=hbar kappa/delta_prop^2.                             (N1)

The coordinate pitch is ell_k/N_k=delta_prop/R_k, not delta_prop. There are
N_k^4 genuine geometry vertices. Keep physical hbar and kappa fixed; kappa is
the coupling of the PU paper's thermodynamic branch. No new identification of
delta_prop with an area/access calibration is made.

The source action and energy units are ell_k^2/kappa and ell_k/kappa. Therefore
the quantum action's Berry coefficient is exactly hbar. Let scalar resolution
J, h=1/J, grow independently and much more slowly than geometry refinement.
The scalar mesh has O(J^3) cells, each with a finite block of native register
factors. The source matrices below use eta=eta_k and ell=ell_k. Interpolation
and source windows associate them to the same actual geometry, clock and volume
records. All comparisons use d_phys/ell_k and m_phys/ell_k^4.

For brevity, any subsequent n in matrix/occupation formulae means n_macro,k,
not N_k. Every full geometry/qualifier stock count must still use N_k,R_k
exactly. Scalar and geometry pitches are not interchangeable.

## 2. Literal truncated oscillator registers on all native states

There are four canonical register modes per scalar cell. For one mode choose
K=8^k and the usual truncated ladder on **all K states**:

    a|m> = sqrt(m)|m-1>,     m=0,...,K-1,
    a^dagger|K-1> = 0.

There is no hidden noncode block in this choice. All factors are genuine native
8-level factors. Define reference frequency omega=1/h and

    Q = sqrt(eta/(2h^2)) (a+a^dagger),
    P = -i sqrt(eta h^2/2) (a-a^dagger),
    Pi = P/h^3.                                            (N2)

Their truncated commutator is retained exactly; no false exact finite-dimensional
canonical commutation relation is asserted. Field chart centers/rod winding may
be added as fixed coordinate offsets. Choose a fixed R larger than the entire
classical field-coordinate range on the retained slab and set

    K(J,n) = next_power_of_8( C_R h^2/eta_n ).               (N3)

Then ||Q||<=C sqrt(C_R), uniformly in n; ||Pi||<=C sqrt(C_R)/h.
The factor-eight rounding changes only these explicit constants. Choose C_R so
the classical phase-space trajectory stays strictly inside the corresponding
number-cutoff ellipse. Smooth positive extensions of F,V outside that retained
chart keep the **full** native Hamiltonian positive.

Joint Q fields at a cell commute. Their finite spectral decomposition, followed
by evaluation of F and its positive inverse, defines F(Q)^-1 exactly as a
computable finite matrix. The native kinetic energy is

    (1/(2v)) sum_AB P_A [F(Q)^-1]_AB P_B,                    (N4)

with v=h^3 sqrt(det gamma). It is positive because F(Q)^-1 is a positive
operator matrix. The spatial gradient and V terms are the commuting-position
terms in (A1) of FINITE_CANONICAL_SOURCE_AND_IR_SCALING.md. The shift term uses
symmetric ordering. At the retained zero shift, the entire Hamiltonian is
positive. Every oscillator zero-point contribution and every ordering
contribution remains in it.

### Total matrix-entry oracle

A row/column is decoded into its K-ary oscillator indices. Ladder entries are
zero or square roots of integers. Q is a finite Jacobi matrix with algebraic
simple eigenvalues; an interval eigensolver with its finite spectral-gap tests
computes its diagonalizer. F,V are the explicit computable coefficient functions
of the main proof (EXACT_ACTION_CONGRUENCE_ELLIPTIC_JOIN.md). Their evaluation
on joint eigenvalues and the finite positive
matrix inversion produce each entry of (N4). The remaining gradient, potential,
metric and control terms are finite sums/products of these entries. This is a
total entry oracle on the entire 8^k tensor product, at any requested certified
precision, including all metric first derivatives. There is no undefined
out-of-code case or omitted full-Hamiltonian extension.

The number of native factors is

    k_total = O(J^3 log K) = O(J^3 [log n+log J+1]).         (N5)

This is a dimension/description count, not an independent claim that other
capacity/clock stocks have zero energy. The admitted direct-interaction class
makes (N4) the physical interaction rather than requiring a separate simulator
for every entry.

## 3. A positive, paid classical consistency controller

Centered spatial differences on the exact analytic field Phi=(tau,x,y,z) and
metric from the main proof produce a material Euler–Lagrange residual
r_J(tau,v)=O(h^2), including the time derivatives of this fixed profile.
Taylor's theorem computes its uniform constant from the analytic formulae.
This does not assert that the full residual recomputed at a varying metric has
small metric derivative.
Define p_J from the discrete kinetic Legendre map applied to the exact sampled
q and qdot. The first Hamilton equation is exact; r_J is the remaining momentum
equation residual.

Add the actual native potential

    H_ctl,J = sum_v N_v v_v [ c_J(tau,v) - r_J(tau,v).Q_v ],     (N6)

with the sign of r chosen to cancel that residual. The profile r_J(tau,v) is
computed once from the fixed target g* and then held fixed under metric
variation: partial_g r_J=0. Its positive offset is also a fixed controller
profile, partial_g c_J=0. The actual lapse and physical cell-volume factors
remain metric-dependent and are differentiated. This is an externally
programmed, paid control profile, not the full residual recomputed at each
candidate metric. Choose, for example,
c_J=R_Q sum_A sqrt(r_J,A^2+h^4), where R_Q bounds ||Q_A||.
Then (N6)>=0 and its total normalized energy, work-rate coefficient and
registered metric derivatives are O(h^2), uniformly in n, because only its
explicit lapse/volume/material couplings vary while its coefficient table is
fixed. Smallness of a residual at g* alone would NOT imply smallness of its
metric derivative. If an intrinsic metric-dependent controller is preferred,
the correct alternative coefficient is the truncation defect
E_h[g,q*]-E_cont[g,q*], not E_h[g,q*] alone; its metric-test derivative is O(h²)
on the registered uniformly smooth metric-test class. That alternative
requires including all derivative/clock couplings in the action. The sampled
continuum material trajectory is now an exact **classical** trajectory of the
finite corrected Hamiltonian. This does not falsely declare sampled fields
on shell for an uncorrected discretization.

The offset c_J is not subtracted: it is positive physical controller energy and
is differentiated along with (N6). Its normalized source vanishes as J→infinity.
The profile is external until an independent physical source clock/material
label realizes its tau-dependence. That clock's equation and stress account for
the Noether energy exchange. Substituting Phi^0 for tau is not automatic: its
material variation differentiates r_J and changes the residual-canceling force.
A separate source-clock program may realize the declared tau-dependence. Its own clock/rest/preparation
Hamiltonian is an additional term in the common history of the master
construction and must be counted. The O(h^2) statement concerns the actual force/offset (N6), not an
unbuilt clock's total stress.

## 4. Coherent preparation, retained vacuum and cutoff

Prepare the finite register product of normalized projected coherent packets
centered on the exact classical initial data. Their coefficient oracle is the
finite list

    exp(-|alpha|^2/2) alpha^m/sqrt(m!),  0<=m<K,

with its actual finite normalization. All preparation/purity stock is charged
by the common source record. The reference coherent occupation is
O(h^2/eta) per mode and O(h^-1/eta) in total. The actual Hamiltonian is (N4), not
the reference number operator.

The summed **positive** vacuum/ordering energy in normalized source units is
O(eta J^4). The field variance is O(eta J^2), and the momentum-density variance
is O(eta J^4). The same bounds, with the relevant explicit coefficient norms,
apply to the metric first variations. No normal-ordering subtraction is used.
Physically, the vacuum/source energy ratio is O(c_0 J^4/n^2), while the total
physical vacuum energy is O(hbar J^4/(n delta_0)).

For initial coherent data the cutoff tail obeys the exact Poisson Chernoff
bound in (A7). For evolved data use finite-time semiclassical propagation and
microlocal cutoff estimates, not that initial Poisson formula. With J fixed,
the classical trajectory has a positive distance from the cutoff ellipse;
truncated and untruncated smooth-symbol evolutions agree to arbitrary prescribed
semiclassical order there, with computable constants. One elementary route is:
approximate the smooth coefficients and their required derivatives by
polynomials on the bounded Q range; a polynomial couples only finitely many
number levels, so the truncation discrepancy is confined to a fixed-width
boundary layer; propagate weighted coherent moment/cutoff bounds and then take
the polynomial accuracy to the declared tolerance. Positivity is preserved by
approximating F within less than half its proved lower eigenvalue.

A finite cutoff does not satisfy an exact CCR and does not have the continuum
oscillator spectrum. Those are approximation conclusions on the retained
states, with the boundary error counted, not primitive assertions.

## 5. Actual quantum evolution and source-derivative convergence

For fixed J, the actual finite state obeys

    i eta_n d psi/dtau = (H_J,K(g)+H_ctl,J) psi.             (N7)

Its finite variational action is (A2), with (N6) included. For every registered
metric perturbation, its source is exactly the corresponding Hamiltonian
first-variation expectation. State, Hamiltonian, source and source clock thus
have one common interface; an independently assigned diagonal observable is
never used.

For fixed J the following finite-dimensional semiclassical statement applies:
for the finite family comprising every cell's energy, momentum, spatial stress,
required metric first variations, source-rate observable and products needed
for first/second spatial moments, there is a computable C_J such that

    max_test | quantum expectation - classical value |
         <= C_J sqrt(eta_n) + cutoff_error + oracle_error,  (N8)

uniformly for tau∈[1,2]. Local density normalizations h^-3 are included in the
test symbols before C_J is computed. Thus (N8) is not a norm-only bound for
unbounded stress observables.

A reproducible way to generate C_J is to register a compact phase-space
neighborhood of the exact corrected path, bounds of the Hamiltonian/test
symbols through sufficiently high finite derivative order, and its linearized
flow bound. Taylor expansion of the Hamiltonian around the path, Gaussian
moments, and Duhamel give the quadratic-packet remainder. Differentiating the
same construction for the metric-test symbols gives (N8). Alternatively use the
finite Weyl product commutator expansion and integrate the transported test
symbol. The constants are built from finitely many suprema of explicit smooth
functions on compact boxes, finite dimension-dependent combinatorial constants
and exponentials of the derivative bounds. Interval arithmetic supplies
terminating upper bounds. No uniform-in-J polynomial estimate is assumed.

This is a constructive theorem scheme: the final native source record must
store its derivative bounds/C_J and cutoff/oracle error certificate, or an
explicit verified upper bound for them. It is not a numerical computation of a
large quantum history; the main symbolic verification (`verify_stress.py`)
checks only the continuum identities.

## 6. A terminating diagonal without an unproved exponent guess

For each J, let C_J>=1 be an actual upper certificate in (N8), increased to cover
all finite tests in that row. Choose the geometry index k_J recursively, with
k_J>k_(J-1), so that n_J:=n_macro,k_J=N_k_J/R_k_J satisfies

    n_J >= 2 n_(J-1),
    n_J >= J^3 sqrt(c_0) C_J,
    c_0 J^4/n_J^2 <= J^-2,
    cutoff_error(J,n_J) <= J^-2,
    oracle_error(J,n_J) <= J^-2.                            (N9)

The actual vertex count is N_k_J^4, and eta=c_0(R_k_J/N_k_J)^2.
Take K by (N3), increasing the fixed safety ellipse or the certified tail
margin if the cutoff test requires it. Every condition is a terminating
arithmetic/interval test. For fixed J, semiclassical localization makes the
cutoff error vanish as n→infinity, so the search terminates. This yields an
explicit computable sequence rather than asserting that an unproved
n=2^(J^2) estimate happens to suffice. If a sharper polynomial/tame bound for
C_J is supplied, a simpler closed form n_J may replace this search.

On this diagonal, every normalized source expectation, metric variation, first
moment, second moment and source-rate error tends to zero. The real controller
source (N6) is O(J^-2) and also vanishes. The sampled continuum field values are
exact classically for the corrected finite material action. Consequently the
whole material action/metric variation has the common full-family continuum
limit (3)–(7) of the main proof. Since that limit is actually on shell, its
conserved source, physical congruence and elliptic certificate all join.

## 7. What is and is not established

Under the admitted native finite-interaction class, this construction supplies
an actual finite material Hamiltonian and a constructive **rescaled** source
limit, not just a continuum ansatz. The following still belong to the master
construction:

* instantiate or dominate the finite semiclassical/cutoff/metric-test constants
  in the final diagonal record rather than call an unchecked guessed exponent
  a verified finite certificate;
* pay the description, preparation, controller clock and all auxiliary source
  stocks in the same history, and show their normalized stress/variation either
  vanishes or is incorporated into the retained source action;
* use the curved operational geometry and actual capacity/length/clock maps,
  with d_phys/ell_n and m_phys/ell_n^4 as the declared comparison variables.

A generic admitted family does not supply these last bookkeeping identities by
itself. In particular, paid purity preparation outside the measured window may
legitimately leave a zero-energy degenerate ready state inside the window, but
one must neither erase the preparation payment nor claim the paying source has
zero stress while it is actually present in that window.

The source field's physical Q goes as ell_n^-2 and tends to zero in the IR;
its normalized Q ell_n^2 remains the nonzero value established in the main
proof. This is permitted by the literal I.3h normalization language if that
rescaled branch is registered. It does not prove a fixed-physical-size quantum
continuum limit or silently change the domain D to do so.
