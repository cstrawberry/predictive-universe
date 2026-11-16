# Finite canonical source and physically counted infrared scaling

## Scope

This specifies the correct finite material Hamiltonian and actual metric-source
operators for the on-shell model in EXACT_ACTION_CONGRUENCE_ELLIPTIC_JOIN.md.
It also gives a physically dimensional semiclassical/refinement scaling and
states the remaining native implementation obligation. It does **not** replace
that obligation with a diagonal matrix whose entries are desired stresses.

The key distinction is between (i) a finite *quantization of an explicitly
metric-coupled material Hamiltonian*, for which its energy and stress really are
its metric derivatives, and (ii) a device which merely calculates those numbers.
Only (i), with all additional paying stocks included, can satisfy B.8c.

## 1. Canonical cell Hamiltonian, including every metric direction

Use scalar mesh h=1/n on the three spatial material coordinates. A fixed
integer-factor rectangular lattice accounts for the 2pi periods; this changes
only constants. There are N_h=O(h^-3) sites and d_h=4N_h canonical pairs.
The scalar mesh is distinct from the finer geometry/capacity mesh. With an ADM
lapse N_v, shift beta_v, spatial metric gamma_v, and coordinate cell weight h^3,
let v_v=h^3 sqrt(det gamma_v). The actual dimensionless cell Hamiltonian is

    H_h = sum_v { N_v [ (1/(2v_v)) p_v^T F(q_v)^-1 p_v
                   + v_v (1/2 gamma_v^{ij}
                         D_i q_v^T F(q_v) D_j q_v + V(q_v)) ]
                   + beta_v^i p_v . D_i q_v }.               (A1)

Factors of kappa and ell are restored below. The rod derivative includes its
winding. F and V are the fixed coefficients of the main proof. Extend them
smoothly, positively and periodically outside the retained clock/rod chart;
this extension is fixed beforehand and is never sampled by the classical
solution on the retained time interval. Its finite derivative bounds enter all
quantization/error constants.

At N=1, beta=0 the Hamiltonian is positive. A sufficiently small open metric
neighborhood preserves coercivity. The lapse derivative is the material energy;
the shift derivative is the material momentum; the spatial metric derivatives
are the material spatial stresses. This is the canonical Legendre transform of
the same action, not an independent stress prescription. These variations must
include v_v, F(q_v), the derivative contraction and all declared metric-dependent
coupling coefficients. F's dependence on q is varied as a material coefficient,
not as an extra dependence on the dynamical metric.

## 2. A finite matrix with those actual derivatives

A direct finite rotor/grid construction is possible:

* Each canonical coordinate has M grid positions on a registered compact
  extension chart, with its diagonal position functions and discrete Fourier
  transform U_M.
* Its momentum is P=U_M^* diag(eta k) U_M, with symmetric retained Fourier
  integers k. The effective commutator scale eta is physical, as in Section 4.
* All q coordinates commute. Evaluate the positive matrix A(q)=F(q)^-1 by
  simultaneous spectral calculus. Quantize each kinetic term as
  sum_AB P_A A_AB(Q) P_B, divided by 2v_v. It is positive since A(Q)>0.
* Quantize the spatial/potential terms as their commuting position functions.
  Quantize the shift term by symmetric ordering; its derivative at beta=0 is
  unambiguous. This gives an explicitly finite Hermitian H_h,M(g).

Every matrix entry is a terminating computable expression in the fixed smooth
coefficients, Fourier phases and physical couplings. Certified quadrature and
rational intervals can replace transcendental entries with certified errors.
The native kinetic/potential couplers are the actual Hamiltonian H_h,M(g).
The source operators are its actual derivatives with respect to N,beta,gamma.
No stress operator is separately set after H has been chosen.

The microscopic canonical quantum action is

    S_h,M[psi,g] = integral [ i eta <psi,d psi/dtau>
                                      - <psi,H_h,M(g) psi> ] d tau. (A2)

Its metric variation is exactly the expectation of the Hamiltonian derivative;
its state variation is the actual finite Schrödinger equation. This supplies a
finite action/expectation/metric-variation identity, not only a measured label.
The physical action prefactor in Section 4 converts eta to the fixed hbar.

A sparse or structured mathematical matrix specification is not yet a physical
construction of the couplers. If the native MPU class admits arbitrary such
finite local material Hamiltonians as prospective primitives, (A1)–(A2) provide
the declared primitive. Otherwise the native source must actually compile them,
and its clock, coupling, rest/vacuum and control stress must join the same action.
An uncharged ideal Hamiltonian-simulation oracle cannot do this work.

## 3. Coherent expectation, evolution and truncation requirements

For fixed h, choose Gaussian/coherent initial packets centered on the classical
canonical initial data. Local canonical momentum is p=h^3 pi. A useful positive
reference oscillator frequency is omega_h~h^-1. Its fluctuation scales are

    Var(q) ~ eta h^-2,
    Var(pi) ~ eta h^-4.                                     (A3)

The same scales follow from a finite torus packet away from the extension-chart
boundary. For bounded smooth target data, the reference coherent occupation per
canonical mode and its sum are

    occupation_per_mode = O(h^2/eta),
    occupation_total    = O(h^-1/eta).                     (A4)

This is a count, not a claim that all those occupations are free. Physical
energy includes the full Hamiltonian expectation.

Taylor expansion with Gaussian moments yields, initially,

    |<H_h>-H_h(classical)| <= C eta h^-4,                    (A5)

and the same type of estimate for **each registered metric first derivative**,
with C depending on the declared coefficient/test norms. Spatial first and
second source moments require the corresponding higher symbol derivatives and
Gaussian moments; they are not inferred from state-norm convergence alone.

For finite time, the packets must evolve by the actual H_h,M, not by a list of
prescribed centers. For fixed h, standard finite-dimensional semiclassical
propagation/Egorov estimates apply on a compact phase-space neighborhood of the
classical path. A self-contained certificate can use the following ingredients:

1. interval enclosure of the classical lattice trajectory and its distance from
   the extension-chart boundary;
2. bounds on the Hamiltonian derivatives through the order needed for the
   state/source observables;
3. a Gronwall bound for its linearized flow;
4. Taylor/Duhamel bounds for the quadratic wavepacket approximation, or a
   direct commutator/Egorov remainder bound;
5. explicit Fourier/grid cutoff and coefficient-evaluation errors.

The metric derivatives of H are included as observables from the start. With a
finite family of such tests this gives computable constants C_h and a bound
C_h sqrt(eta), plus cutoff errors. This paragraph is an implementation recipe,
not a verified uniform-in-h theorem. A continuum action-limit claim requires
the actual constants or a proved uniform/polynomial estimate.

A conservative alternative to assuming a polynomial uniform constant is an
explicit diagonal. With bounded coefficient derivatives and the naive Euclidean
coordinate norm, lattice derivative and linearized-flow bounds are finite
powers of h^-1 followed by exp(C h^-r). Choose the macroscopic length to defeat
that *proved* bound. One may also compute C_h first and set

    eta_n <= 1/[n^4 (1+C_h)^2]                              (A6)

with an additional cutoff tolerance n^-2 and a spatial discretization tolerance
n^-2. The bound and the diagonal must be generated before asserting convergence.
The existence of each finite C_h does not supply a particular polynomial p.

For a plain coherent state with mean occupation A, a Fock cutoff K>A gives the
explicit Poisson tail bound

    Pr(N>=K) <= exp[-K log(K/A)+K-A].                        (A7)

For evolved/squeezed/nonlinear states, (A7) cannot simply be reused. Use evolved
weighted number-moment bounds or a finite torus/Fourier error certificate. A
norm-only truncation bound is insufficient for the unbounded energy/stress
observables. A reference cutoff K~C h^2/eta is an initial occupancy estimate;
the additional evolved tail margin must be certified. This distinction is part
of the required finite-source record.

## 4. Physical scaling: hbar and kappa do not change

Let l_P=sqrt(hbar kappa). With the units of the main proof, the physical action
scale and effective quantum parameter are

    A_n = ell_n^2/kappa,
    eta_n = hbar/A_n = hbar kappa/ell_n^2,
    E_n = ell_n/kappa.                                     (A8)

The physical Hamiltonian is E_n H_h, and proper time is ell_n tau. Then
A_n eta_n=hbar: the microscopic Schrödinger equation has the actual fixed hbar.
Thus eta_n→0 is a growing macroscopic action/length limit, not a change of nature's
Planck constant.

If a proved source error is O(eta h^-r), the explicit polynomial family

    h_n=1/n,      ell_n=l_P n^p,       eta_n=n^-2p           (A9)

makes that error vanish when 2p>r. A C_h sqrt(eta) error with C_h=O(n^s)
requires p>s. If only an exponential C_h is proved, use (A6) to define ell_n,
or an explicitly adequate faster growth. Merely saying 'p is large' without
bounding r,s is not a proof.

For (A9), the leading mode/occupation/vacuum counts are

    canonical modes       O(n^3),
    occupation per mode   O(n^(2p-2)),
    total occupation      O(n^(2p+1)),
    normalized vacuum energy O(n^(4-2p)),
    physical vacuum energy O(sqrt(hbar/kappa) n^(4-p)).      (A10)

The last two lines use the full positive zero-point sum

    E_vac <= C N_h hbar/(ell_n h_n).

No zero-point energy has been subtracted. For p>2 its ratio to the classical
source energy goes to zero; for p>4 its total physical value also decreases.
A fixed positive potential offset and all matrix-ordering vacuum terms stay in
the Hamiltonian and in its metric derivative. Additional physical rest energy
of an implementation is **not** covered by this oscillator zero-point estimate.

The classical source and backreaction have the actual physical scales

    T ~ 1/(kappa ell_n^2),   r ~ 1/(kappa ell_n^3),
    Q ~ 1/ell_n^2,          B^ell ~ 1/ell_n^2.              (A11)

The dimensionless Q ell_n^2 stays strictly positive. The unrescaled Q tends to
zero; that fact must not be concealed as a fixed-size nonzero limit.

## 5. What the common refinement may honestly assert

A rescaled common family can converge to the nontrivial normalized branch if

    d_bar_n = d_phys_n/ell_n,
    m_bar_n = m_phys_n/ell_n^4,
    T_bar_n = kappa ell_n^2 T_phys_n,
    Q_bar_n = ell_n^2 Q_phys_n                              (A12)

are the declared comparison variables, and the same ell_n enters all clocks,
Hamiltonians, geometry measures and observable normalizations. This is a
legitimate infrared/macroscopic scaling branch. It is not convergence of the
unrescaled physical spaces to a fixed compact torus of fixed diameter.

Definition I.3h requires the 'declared physical-length normalization' but does
not require ell_n to be constant. Therefore a clearly registered rescaled branch
is not excluded by that definition. A stronger requirement which fixes one
physical macroscopic geometry across n would exclude (A12); that choice belongs
to the actual branch-selection record. In either case,
the source variance and Q must be reported in both physical and normalized units.

The scalar mesh and MPU geometry mesh need not coincide. Their physical
locations, cell integrals and source interpolation maps must commute in the
common diagonal. It is invalid to multiply only the source by ell_n while
leaving the geometry's length or clock unchanged.

## 6. The stock/controller ledger condition that cannot be omitted

Let E_app,n and T_app,n be the actual native apparatus energy and metric stress
outside the material Hamiltonian (A1), including clocks, memory, coupler setting,
preparation carriers and all reference/vacuum/rest stocks. To obtain precisely
the continuum source above, the native record needs at least

    E_app,n / E_n -> 0,
    ||kappa ell_n^2 T_app,n||_(retained source topology) -> 0, (A13)

or an explicit retained nonzero limit incorporated into the material action and
its inverse-designed coefficients. Energy smallness alone does not prove stress
smallness, since highly stiff metric couplings can have large derivatives.
The ledger therefore needs the same bound for the metric derivatives and the
spatial/temporal concentration controls used in B.8c.

For a K-level mode it is not enough to charge log K abstract bits. The source
record must state the real physical implementation and its paying stocks. An
unoccupied but costly level structure or a large setting field still contributes.
Likewise a digital simulator that executes H with an unpaid clock is not the
actual material model. An autonomous native oscillator/coupler realization can
avoid ongoing digital gates; its fabrication/preparation/coupling stocks must
still be counted and their actual metric derivative joined.

Given a native stock family with explicit finite prices and derivative bounds,
(A13) is a checkable scaling condition. Without those bounds, increasing ell_n
is not automatically a cure: if apparatus cost grows too rapidly as eta_n
shrinks, its stress can remain leading or dominate the target. This is the
precise remaining input; a better Poisson solver would not supply it.
