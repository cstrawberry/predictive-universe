# Exact material-equation selection and residual stability

## Scope

This is a selection/stability theorem **within the declared shear-free diagonal
material-coordinate class**, not for arbitrary Lorentzian metrics. Let
Phi^A=(tau,x,y,z), let the lapse be one and shift zero, and consider

    g_B=ell^2[-d tau^2+exp(2B(tau,x)) d x_vector^2].

The matter coefficient functions F,V stay fixed to the explicit action in
EXACT_ACTION_CONGRUENCE_ELLIPTIC_JOIN.md. They are not recomputed from each
candidate B. All candidates obey |B|<=log 3 on [1,2]×T^3 and the same declared
initial data. Uniform higher-derivative bounds are an independent candidate
restriction, imposed when a C² conclusion is needed.

## Derivation from the actual scalar Euler–Lagrange equation

Use dimensionless normalized material coefficients f_AB=kappa F_AB and
v=kappa ell² V=tau^-2. Write Ebar_0 for the scalar equation multiplied by
kappa ell². In the specified coordinates, direct divergence gives

    Ebar_0 = -3 f_00 B_tau - (1/2) partial_tau f_00
        + exp(-2B)[f_01 B_x+partial_x f_01
                        -(1/2) sum_i partial_tau f_ii]
        -partial_tau v.                                   (S1)

Hence Ebar_0=0 is exactly

    B_tau = A exp(-2B) B_x + C exp(-2B) + D,               (S2)

where

    A=f_01/(3f_00),
    C=[partial_x f_01-(1/2)sum_i partial_tau f_ii]/(3f_00),
    D=-[(1/2)partial_tau f_00+partial_tau v]/(3f_00).        (S3)

The signs in (S1)–(S3) were checked symbolically. The true branch
B*=log tau+epsilon tau cos x solves (S2) identically. It is not selected by
inserting B* into a desired-output table: its fixed action and actual material
residual determine this first-order metric equation.

## Explicit coefficients and bounds

Let u=epsilon tau cos x, epsilon=0.01. The relevant coefficients are

    f_00=tau^-2-6epsilon cos x/tau-3epsilon² cos²x,
    f_01=2epsilon sin x,
    sum_i f_ii=4u-2epsilon²tau²sin²x
                       +3 exp(2u)(1+6u+3u²).

Throughout [1,2]×T^3,

    f_00 >= 0.1897,
    |f_01| <= 0.02,
    |partial_tau sum_i f_ii| <= 0.301910281,
    |A| < 0.036,
    |C| < 0.301,
    |D| < 5.33,
    1/(3f_00) < 2.                                        (S4)

For the trace derivative, a direct upper bound is

    4epsilon+8epsilon²
      +3epsilon exp(4epsilon)(8+36epsilon+24epsilon²).

The value of B* obeys the candidate bound, and |B*_x|<=0.02.

## Stability and uniqueness

Let w=B-B*. Put r=-Ebar_0/(3f_00). Subtracting the exact equation gives

    w_tau - A exp(-2B) w_x
       = [A B*_x+C][exp(-2B)-exp(-2B*)] + r.               (S5)

Along the characteristics of the left side, the mean-value theorem and (S4)
give

    |d w/d tau| <= L |w| + |r|,
    L <= 18[0.02 sup|A|+sup|C|] < 5.42 < 6.

Here exp(-2B),exp(-2B*)<=9 follows from |B|,|B*|<=log3.
The spatial torus has no inflow boundary. Gronwall yields the concrete modulus

    ||B-B*||_infinity <= exp(6)[
          ||B(1)-B*(1)||_infinity+2||Ebar_0||_infinity].    (S6)

Thus the actual equation and initial data select B* uniquely in this class.
A sequence whose initial and action-residual errors vanish converges uniformly.
If it has a common C^s bound with s>2, interpolation yields C² convergence,
with an explicit interpolation constant for the fixed slab/torus. For s=4,
this gives a C² error bounded by a fixed constant times the square root of the
right side of (S6), times the square root of the common C⁴ bound.

The time/space dimensional factors are restored by the same ell used in the
source and operational metric. S6 is a normalized-coordinate estimate; it does
not identify changing physical lengths without the common normalization map.

## Limits of use

The residual must be the **actual action equation** (S1), with its finite
native approximation certified through the source/action map. A separately
programmed residual flag with no such derivative identity does not qualify.
The fixed material-coordinate and shear-free metric class is part of the
registered branch, not a conclusion about all cosmologies. This argument needs
no quantization of Einstein gravity: it can use the classical emergent Einstein
metric branch of the PU paper.

A metric-dependent material Hamiltonian intrinsically changes when the actual
metric evolves. That dependence is not an extra external simulation driver.
Any separate programmed source control, including the optional O(h²) residual
control (N6) of NATIVE_CANONICAL_COMMON_REFINEMENT_THEOREM.md, still requires
its real clock/stress ledger.

`verify_selection_transport.py` checks the exact branch identity and the
explicit bounds; its results are in `SELECTION_TRANSPORT_VERIFICATION.json`.
