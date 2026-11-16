# Certified native source search and autonomous material control

This note gives the finite source with autonomous material control. It
uses the admitted literal native Hamiltonian class of
`NATIVE_CANONICAL_COMMON_REFINEMENT_THEOREM.md`, an autonomous residual-force
potential using the already counted material clock field, and an actual finite
interval-certificate search. It requires no guessed semiclassical constant and
no unbuilt external source-force clock. The common source's unrelated
qualification, preparation, receipt and geometric stocks still remain in the
full ledger.

## 1. Autonomous potential that realizes the full residual force

For each scalar cell v, let the target material path be
q_i=q_i^*(q_0), i=1,2,3. The immutable cell label v fixes these rod reference
values and the precomputed local profiles; it is not a variable silently held
fixed during a material variation. In the present branch q_i^* is constant
along each cell's history. Let r_A(t,v) be the material **force density**: if R_A is the desired
additional canonical force, define r_A=-R_A/(N_v v_v) on the target path.
Then the Hamiltonian force -N_v v_v grad V_ctl equals R_A. On the solved base,
r_A=O(h²) after this volume division. For an admitted selected candidate B,
construct its own frozen profile r_{J,B} from that candidate's actual fixed-F,V
material residual; the bound is O(epsilon_task+h²), not automatically O(h²).
The task controls the required residual derivatives as well as amplitudes.
All finite packet paths, matrices and interval tests use the same actual B and
H_B. Candidate profile coefficients are held fixed during independent metric
variations; they are not silently recalculated with the perturbed metric.

Extend each r_A smoothly with compact support in the material clock coordinate,
without altering it on [1,2]. Define

    W_v'(s)=r_0(s,v)+sum_(i=1)^3 r_i(s,v) (q_i^*)'(s),
    V_ctl,v(q)=W_v(q_0)
           +sum_(i=1)^3 r_i(q_0,v)[q_i-q_i^*(q_0)].         (F1)

Its exact material derivatives are

    partial_i V_ctl = r_i(q_0,v),
    partial_0 V_ctl = W_v'(q_0)
           +sum_i r_i'(q_0,v)[q_i-q_i^*(q_0)]
           -sum_i r_i(q_0,v)(q_i^*)'(q_0).                 (F2)

On the target path they are exactly r_A. In particular, the additional q_0
variation is included, not dropped. For our constant rods, W'=r_0. Reversing the
sign of all r_A realizes the opposite force convention.

The full native control Hamiltonian is

    H_ctl = sum_v N_v v_v [ C_v+V_ctl,v(Q) ],              (F3)

where C_v is a registered positive constant at least the supremum of
|V_ctl,v| on the full native Q spectrum, with a positive margin. Q has a uniform
bound, W is a bounded integral of O(h²) profiles on a fixed interval, and the
rod references are bounded. Therefore C_v=O(h²), and the entire control energy,
all its metric first variations and its physical work/exchange coefficients
are O(h²). No negative offset is subtracted.

All coefficient profiles and C_v are fixed material functions/data under metric
variation. The actual N_v and v_v factors are differentiated. The q_0 dependence
is a dependence on the already present physical material clock, whose complete
canonical kinetic/coupling energy is in H. It is not externally prescribed time.
The true metric dependence H(g(t)) remains intrinsic to the physical evolving
metric. Thus this controller has its own actual material equation and Noether
exchange; it does not need a separate source-force clock.

The finite medium has immutable local cell/reference labels. These labels and
profile descriptions belong to the common source's native stock. Their quantum
state and any rest/holding Hamiltonian remain counted. The controller potential
vanishes in normalized action and metric variation as h→0, so the retained
continuum covariant matter action is the fixed four-field action already proved.
This construction does not claim that an arbitrary prescribed force field on
an open four-dimensional material target is a gradient; it interpolates the
specified force along each one-dimensional material history, which is exactly
what F1 proves.

## 2. Actual native evolution and actual test operators

Use K=8^k truncated oscillator registers and the full positive canonical
Hamiltonian in NATIVE_CANONICAL_COMMON_REFINEMENT_THEOREM.md, with F3 in place of
the externally programmed controller N6. No states or zero-point energies are omitted.
For each fixed scalar J and geometry index k, the finite Hamiltonian
H_J,k(t) is the actual matter Hamiltonian coupled to the actual registered
metric history. All its entries and derivatives are computable. Its normalized
state evolution is

    i eta_k Udot(t)=H_J,k(t) U(t),     U(1)=I.              (F4)

The initial finite coherent state is normalized exactly with a computable
finite sum. Metric tests are the actual derivatives of this whole Hamiltonian,
including F3. Include every cell's energy, momentum and spatial stress, the
registered action/metric-variation tests, their relevant first/second moments,
and the actual source-rate expressions. A rate is computed by

    R_O=partial_t O+(i/eta_k)[H,O],                         (F5)

not by differentiating a separately supplied target-output table. Squares and
mixed moments use the actual finite matrices, with the chosen symmetrization
recorded. Classical comparison values are those of the **corrected** finite
classical Hamiltonian along its exact sampled path. Its difference from the
continuum source is separately bounded by the explicit O(J^-2) consistency and
control estimate.

## 3. A finite, verifiable time-mesh certificate

For a candidate (J,k), compute finite upper bounds

    B_H >= sup ||H(t)||,
    B_H1 >= sup ||Hdot(t)||,
    B_O >= sup ||O(t)||,
    B_O1 >= sup ||Odot(t)||

for every selected test O, including rate/square tests. Absolute row sums or
Frobenius bounds suffice; tight operator bounds are unnecessary. They may be
large and eta-dependent. The finite matrix-entry oracle and explicit analytic
metric/material functions provide them by interval arithmetic.

Approximate the propagator on a time mesh of maximum width Delta by products
of exact or interval-certified exp[-i H(t_j) Delta_j/eta]. Unitarity and Duhamel
bound the total error from freezing H on each interval by

    (B_H1/(2eta)) sum_j Delta_j²
         <= B_H1 Delta/(2eta).                             (F6)

A matrix exponential has a terminating Taylor/scaling-and-squaring certificate;
for the direct Taylor remainder use
exp(||A||)||A||^(L+1)/(L+1)!. Allocate a finite total propagator error epsilon_U.
An observable expectation changes by at most 2B_O epsilon_U plus the separately
charged matrix/state arithmetic errors.

The exact expectation's between-node derivative obeys

    |d <O>/dt| <= B_O1+2 B_H B_O/eta.                      (F7)

Add the explicit derivative bound of its classical comparison. Choose Delta
so F7's contribution is below the allocated between-node tolerance. This is
possible for every finite matrix, regardless of how expensive the resulting
mesh is. It uses actual norms, not favorable semiclassical guesses.

At every time node enclose the exact quantum/classical difference by the above
interval propagator and operator certificates. Accept the candidate only when
all node bounds plus all between-node bounds are strictly below 1/J (or a
smaller registered tolerance). Every accepted (J,k) therefore comes with actual
finite interval certificates for the actual source and metric derivatives.
Partial reads, a failed comparison or an inconclusive interval do not count as
acceptance. Precision and time mesh are refined until a strict result is
available. A strict passing margin can be arranged by searching against 1/(2J)
and certifying against 1/J.

## 4. Why the search terminates

For fixed J, the corrected classical path is smooth, all canonical coefficient
functions have a positive compact extension, and the path stays inside the
cutoff ellipse. The finite-dimensional higher-order Gaussian/Hagedorn argument
in CONSTRUCTIVE_SEMICLASSICAL_DIAGONAL.md proves convergence of the actual finite
quantum evolution and its actual metric/source tests as eta→0 with K∝h²/eta.
Use a high enough packet order for F5 and its squares; a leading Gaussian
norm bound alone does not suffice. No particular numerical constant from that
proof is needed for acceptance: it proves only that some candidate eventually
passes the direct certificate.

The actual geometry sequence has

    R_k=80*2^k,   N_k=8*10^28 R_k³,
    ell_k=delta_prop N_k/R_k,
    eta_k=(hbar kappa/delta_prop²)(R_k/N_k)² -> 0.           (F8)

Therefore, for each J, increasing k eventually makes every finite quantum test
strictly accurate to 1/(2J). For such a candidate, interval propagator/operator
refinement eventually verifies the 1/J threshold. A dovetailed search over k
and certificate precision prevents an inconclusive early candidate from
blocking later passing candidates. This is a terminating total algorithm.

Also require the explicit positive vacuum bound eta_k J^4<=1/J and the
geometry/source interpolation errors assigned to that row. Any finite list of
other asymptotically vanishing stock/clock tests may be added. Choose accepted
k_J>k_(J-1). Then the accepted source family converges along the full declared
common diagonal, with no unresolved constant in the acceptance test.

## 5. Physical and logical boundary

All spaces use d_phys/ell_k and m_phys/ell_k^4 for the declared comparison.
The actual coordinate pitch is delta_prop/R_k and the full vertex count is
N_k^4. Neither is replaced by n_macro=N_k/R_k. Physical kappa and hbar are fixed,
and no new area/capacity calibration is inferred from delta_prop.

The action scale is ell_k²/kappa, source energy scale ell_k/kappa, tensor scale
1/(kappa ell_k²), and backreaction scale ell_k^-2. Positive vacuum energy is
kept and becomes relatively small. The normalized source and Q remain nonzero;
unrescaled Q tends to zero in this explicitly stated macroscopic IR family.

The direct finite certificate is an executable mathematical search definition,
not a claim that its astronomically large first accepted matrix history has
been numerically run. The continuum identities and a small instantaneous
full-native test have been run. A common-source theorem that uses the
terminating construction must clearly distinguish it from an empirical
computation of the finite history.
