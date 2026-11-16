# Constructive semiclassical constants and the actual geometry diagonal

## Purpose and scope

The native-source theorem must not leave an unidentified constant C_J as an
extra premise. This note specifies a finite constant-generation algorithm and
its proof route. It is a mathematical construction; no large-dimensional
quantum-history computation has been executed. The small full-native matrix
computation is instantaneous only.

An informal closed-form majorant such as 10^6 is not a verified constant. The
safe constants are the output of the finite recurrences and interval enclosures
below. Their generation is expensive but terminating. The admitted native class
charges the actual finite coefficient oracle/description, not an assertion that
this enormous computation has been performed for every J.

## 1. Input and explicit derivative data

Fix one scalar resolution J and its finitely many cells. The classical path is
the exact sampled field with the paid fixed-profile consistency controller, or
an independently enclosed unforced classical finite-lattice path. Register:

* the finite canonical dimension d=4 times the number of scalar cells;
* the positive extensions of F,V and the full metric coefficient functions;
* the path, initial reference oscillator covariance and its phase-space margin
  from the chosen Fock cutoff ellipse;
* all local energy, momentum, stress, metric-test derivative and moment symbols;
* their time and phase-space derivatives through order 12, on a fixed compact
  neighborhood large enough for the path and cutoff comparisons.

Every entry is an explicit smooth elementary function, finite sum, matrix
inverse with a proved positive lower bound, or derivative of these objects.
Finite interval subdivision plus the analytic denominator lower bounds gives
upper bounds for all needed suprema. For the positive cutoff extensions, use
the explicitly registered bump and its derivative formulas, not a black-box
unknown smooth function. Globally growing gradient terms are at most quadratic
in coordinates; Gaussian moments handle their tails separately.

## 2. Exact symbol of the actual kinetic operator

For a cell, write A=F^-1 and v=h³ sqrt(det gamma). The actual operator
(2v)^-1 sum_AB P_A A_AB(Q)P_B has Weyl symbol

    H_0,kin(q,p) + eta² H_2,kin(q),
    H_0,kin=(2v)^-1 sum_AB p_A A_AB(q)p_B,
    H_2,kin=(8v)^-1 sum_AB partial_A partial_B A_AB(q).       (C1)

This ordering term is retained, including its metric derivative. It is not a
vacuum subtraction. Symmetric shift ordering has its usual exact Weyl symbol;
the position potential/gradient/controller terms are unchanged. Thus the
untruncated comparison operator has an explicit symbol H_0+eta² H_2.

## 3. A finite higher-order packet construction

A leading Gaussian alone is inadequate if one wants actual source-rate squares:
those operators can contain eta^-2 in their full finite-matrix norm. Use a
finite Hagedorn/Hermite expansion through order eta^(5/2).

Let z(t) be the exact classical path. The phase S solves the classical action
ODE, and the real symplectic linearized flow L solves

    Ldot = J_symplectic Hess(H_0)(t,z(t)) L,   L(1)=I.       (C2)

Its norm is bounded by exp(integral ||Hess H_0||). Propagate the initial complex
Gaussian pair by L; its positive Wronskian prevents a zero determinant. This
avoids any unsupported global Riccati-chart assumption.

After classical translation and the metaplectic transform, construct

    psi_app = exp(iS/eta) Translate(z) Meta(L)
                sum_(r=0)^5 eta^(r/2) c_r(t),              (C3)

where c_0 is the vacuum and c_r belongs to the Hermite span of total degree
at most 3r. Each c_r is a finite vector. If P_m is the m-th homogeneous Taylor
term of H_0 transformed by L, and Q_m the corresponding term of H_2, the finite
recursion is

    i cdot_r = sum_(m=3)^(r+2) P_m c_(r-m+2)
                  + sum_(m=0)^(r-2) Q_m c_(r-m-2),         (C4)

with c_r(1)=0 for r>0. Empty sums vanish. The eta powers from the Taylor terms
and the division by eta in Schrödinger's equation give exactly these indices.
All matrices in (C4) are finite ladder-polynomial matrices. Their entries and
norm bounds are computed by finite algebra from derivatives in Section 1.

Taylor-expand H_0 through degree 7 and H_2 through degree 3. The first omitted
terms contribute O(eta^4) to the Schrödinger residual, and Duhamel therefore
gives O(eta^3) state error on a unit time interval. To certify the actual
constant, bound the Taylor integral remainder using derivative order 8 and the
exact Gaussian/Hermite moments, including the at-most-quadratic kinetic symbol.
The maximum Hermite degree is 15; all moments needed are finite gamma/factorial
expressions. The ordering term requires no higher derivatives than the
registered order 12. The same finite calculation bounds normalization error.

A constant generator is therefore:

1. interval-bound C2 on [1,2];
2. enumerate the finite Hermite coefficient arrays C4 and bound their ODE
   integrals by interval quadrature or a Gronwall majorant;
3. enumerate the finite Taylor remainder monomials;
4. evaluate their absolute Gaussian/Hermite moment majorants;
5. sum these quantities, with the actual coefficient derivative bounds.

This produces a definite finite A_J with

    ||psi_exact-psi_app|| <= A_J eta³                      (C5)

for eta below an explicitly computed positive threshold, before finite Fock
cutoff. The proof uses the actual Hamiltonian (C1); it does not prescribe the
quantum state to follow a desired classical path.

## 4. Finite Fock cutoff, including its functional calculus

For definiteness choose K=next_power_8(2^20 h²/eta). Then

    ||Q||<=4096,       ||Pi||<=4096/h.

The target field coordinates lie inside the cutoff ellipse with a large fixed
margin. For a propagated Gaussian, its number exponential moment is an
explicit Gaussian determinant/quadratic-form integral. Hermite polynomial
factors are obtained by finitely many derivatives of that integral. Search for
a rational s_J>0 such that these exponential moments are finite uniformly on
[1,2] and their coherent-displacement exponent stays strictly below the chosen
K margin. This search terminates: at s=0 the derivative is the finite number
expectation, while the cutoff ellipse contains the classical path strictly.
Interval enclosures of C2–C4 certify this test.

Apply this number-tail test **per oscillator** and then take a union bound
over the d oscillator modes. K is a per-mode cutoff. A single total-number
threshold K would be invalid because total classical occupation grows with d.
The tensor-product cutoff has the required per-mode classical margin.
Chernoff's inequality then provides computable a_J>0,b_J<infinity and finite
integer m_J such that the packet mass and all required polynomial moments in
the cutoff boundary layer are at most

    b_J eta^(-m_J) exp(-a_J/eta).                           (C6)

The finite matrix F(Q_K) is not blindly identified with the compression of
F(Q_infinity). To compare them, approximate the coefficient functions and their
registered metric derivatives by polynomials on the fixed Q range, at error
eta^5. A quantitative Jackson/Chebyshev bound using the recorded derivatives
produces an explicit degree L(eta)=O_J(eta^(-5/12)), which is o(K). In more than
one local material coordinate use the finite tensor-product polynomial; the
local arity is fixed. Positive coefficient approximations are retained by
requiring their error below half the kinetic lower bound.

A polynomial of degree L cannot see the truncated ladder except within L
levels of its boundary. Therefore C6 bounds the polynomial compression error.
The uniform coefficient approximation and its finite momentum factors give
O_J(eta^5) operator error on the retained finite phase box, hence O_J(eta^4)
Duhamel error. Outside the fixed Q box, also bound the untruncated comparison polynomial:
its degree L=O_J(eta^(-5/12)) is o(1/eta), so its growth is dominated by the
Gaussian tail exp(-c/eta). A uniform approximation only inside the box would
not control this exterior term. These polynomial exterior bounds are charged
in the same remainder. Every
coefficient, degree and tail constant is included in the generator, and the
small-eta threshold ensures L<K/4.

Combining C5 and C6 yields a finite-matrix state bound with a computable
polynomial prefactor and a strictly positive exponential rate. Any finite
coefficient-oracle error is set below eta^5 divided by the computed momentum
and test norms, so it enters the same remainder budget.

## 5. Actual source observables, rates and their metric derivatives

On the full truncated space the energy/stress/metric first-variation operators
have norm bounded by a computable polynomial in J and the fixed coefficient
bounds, independently of eta: Q is bounded and Pi is bounded by 4096J.
Products needed for source first/second moments obey the same property.

The actual source-rate operator is partial_t O+(i/eta)[H,O]. Its full native
norm can be O_J(eta^-1), and its square O_J(eta^-2). Multiplying C5 by those
actual norms still gives a vanishing O_J(eta) contribution. This is why the
higher-order expansion was specified, instead of promoting a leading Gaussian
estimate into an unjustified rate certificate.

For the packet's expectation, Taylor/Gaussian moments applied to the actual
symbols and their ordering corrections give their classical values with a
computable O_J(sqrt eta) remainder. Boundary commutator anomalies of the finite
ladder are covered by C6, not an exact-CCR claim. Include the metric derivatives
and their products as tests before generating the constants.

The final generator returns finite numbers A_J,B_J>0, integer m_J, a_J>0 and
eta_star,J>0 such that all registered normalized source/action/metric-derivative,
first/second-moment and rate errors are bounded by

    A_J sqrt eta + B_J eta^(-m_J) exp(-a_J/eta),
    0<eta<=eta_star,J.                                    (C7)

This is the required explicit finite **constant-generation procedure**. It is
not the assumption that a favorable constant exists. The generated record is
finite for each J; its code, actual values when instantiated, and requested
precision are part of the paid source description.

## 6. Join to the actual R,N geometry sequence

For the geometry's R_k=80*2^k and N_k=8*10^28 R_k³, use

    ell_k=delta_prop N_k/R_k,
    eta_k=c_0(R_k/N_k)²,
    physical coordinate pitch=delta_prop/R_k,
    actual geometry vertices=N_k^4.

After generating the finite record for J, choose the least k>k_(J-1) for which

    eta_k<=eta_star,J,
    A_J sqrt(eta_k)<=J^-2,
    B_J eta_k^(-m_J) exp(-a_J/eta_k)<=J^-2,
    eta_k J^4<=J^-2,

and the generated cutoff/oracle tests pass. All comparisons use certified
interval arithmetic and may be made strict with a factor-two margin. Since
eta_k→0, the search terminates. The source/geometry/common-history refinements
may add further finitely checkable smallness tests to this same search.

This construction proves a computable common diagonal without an unjustified
polynomial uniform semiclassical estimate. It retains fixed physical hbar,
kappa and propagation length, retains the positive vacuum energy, and rescales
physical distances/measures by ell_k and ell_k^4. The normalized source,
backreaction and observables converge to the nontrivial common branch.

## Scope of the integration

The derivation above addresses the material Hamiltonian and, if used, the actual
small residual force/offset. Its time dependence through actual g is intrinsic.
Any extra programmed clock for the residual force, its Noether exchange, all
preparation/receipt/qualifier stocks and their physical metric variations still
have to be included in the common-source record of the master construction
(`construction/INDEXED_MASTER_CONSTRUCTION.md`). This note neither
sets those sources to zero nor quantizes an Einstein Hamiltonian.
