# Same cut source: visibility, exact counts and latency

This document proves the visibility, count and latency estimates for the
registered-cut source of registered_cuts/SOURCE_THEOREM.md, whose forecast
words are computed by the finite program of CUT_FINITE_COMPILER.md. It uses
the source-independent algorithms and proofs of the indexed construction
(bath_forecasts/INDEXED_COMPARISON.md). No numerical state, root, generator,
rate, profile or forecast value of the indexed source is used.
CUT_FINITE_COMPILER.md is the complete algorithm.

## Every premise on the cut source

For j>=1, n=j+8 and rational registered c in[-n,n], the common scalar bank,
full-window selector/alpha, bath regulator and actual Gaussian target
algorithms remain those of the indexed same-j source. The prospective
receiver member is constructed with q_cuts=[c]; its cut program and
parameter word are actual outputs of this construction. This changes the
receiver source and its coupled BQ evolution. It does not change the
regulator's full-window analytic visibility error proof. The native initial
coefficients are read from THIS member, with its actual dyadic denominator
and normalization. The scalar alpha theorem, unchanged, gives the same
source-derived classical bath-to-homogeneous mean error. No receiver-clock
approximation enters that classical bath comparison: the receiver is part of
the actual quantum auxiliary perturbation, already covered by the cut_bounds
bath a1,a2.

Let eps=8^-n and mmin=3^[-(n+1)]. Apply the full-window bath comparison
proof to the ACTUAL coupled state of the cut source. Its decomposition remains:

 regulator <=eps/2,
 actual finite target vector contribution <=eps/2048,
 actual full-scalar classical contribution <=eps/4096,
 quantum contribution H*a1_bath+H²*a2_bath <=eps/16.

The latter is enforced by the cut_schedule threshold; all cut-dependent Jc,
profile/position growth and physical tube/root/clock constants are inside
these coefficients. No H threshold uniform in c is claimed. The other
three terms come from the same full-window regulator/target/alpha algorithms,
not from executing a late-cut BQ state. Sum E=eps/2+eps/2048+eps/4096+eps/16.
For n>=9, E<mmin/2. Hence the actual checkpoint mean is strictly positive,
with the norm-one visibility readout of the indexed construction at its
actual full-window q_i. Clipping in the numeral codec is not used to
manufacture this fact.

The C1-C11 mean enclosure has numerical error <=2^[-(p+4)], p=64(n+1)^3;
rounding contributes <=2^-p. With actual final-width checks and the same
positive margin, log visibility error is at most

 4(E+2^[-(p+4)]+2^-p)/mmin = O((3/8)^n).

This is NOT O(8^-n). The physical exposure error (before numerical/rounding)
is <=4E/mmin. Exact rational power comparisons generate the raw integer
count. The cap-inactive proof uses only p,s,M and mmin and therefore remains
identical at c. The actual reversible running maximum gates consume raw
counts; no assumed monotonicity of the actual bath of the cut source is
introduced.

## Full proper checkpoints, latency and adaptive law

The receiver DONE of the cut source is at t(c). The PCE clock still covers
the full scalar proper window and has the identical placement/G/E algorithms.
Its physical profile differs with c, so the source's cut_bounds clock
coefficient includes the exp(c/3) profile defect.

The cut_schedule threshold for the full-u meter is

 H < eps/[8 sqrt(N)(1+a1+a2)], H<=1, N=8^(8n),

with a1,a2 the clock coefficients above. It makes the actual
2sqrt(N)-weighted quantum error strictly smaller than eps/4:

 2sqrt(N)[H a1+H^2 a2]
  <=2sqrt(N) H(a1+a2)
  <(eps/4)(a1+a2)/(1+a1+a2)
  <eps/4.

The state graph's terminal_full_u threshold is the same sufficient
inequality. This threshold does not by itself give the stronger bound eps/8:
for example a1=3, a2=0, H=eps/(33sqrt(N)) obeys it, and the weighted error is
then 2eps/11>eps/8. A bound eps/8 for this weighted quantum contribution would
require strengthening the threshold to H<eps/[16sqrt(N)(1+a1+a2)] before
choosing common J and minimum D; it is not used here.

The protected shell error is 2sqrt(N)2^[-16(n+1)^2], and

 2sqrt(N)*2^[-16(n+1)^2] < eps/2 for every n>=9.

Consequently the full meter error is less than 3eps/4<eps. At the terminal
endpoint the reference wrong-shell term is zero; the same conservative bound
is valid. This is a pointwise prediction statement, not a nondisturbing
measured clock process.

The source's actual PCE stages retain initialization3/E, every pair2/E,
and terminal2/E gaps in scalar proper time. The indexed comparison proof
(bath_forecasts/INDEXED_COMPARISON.md, section 4) bounds these using the
actual exposure modulus, giving the same rational upper bound 14n/(3E) plus6
times the physical log error. The reference horizon lower bound,
sigma_B^0(-n)>n/84, concerns the same full-window scalar bath history and
holds unchanged. No use of the receiver cut's shorter T_c as the PCE
denominator is permitted.

Consequently the indexed envelope (bath_forecasts/INDEXED_COMPARISON.md,
section 7) is a uniform sufficient ABSOLUTE envelope after the c-dependent
choice of H. In that envelope the weighted wrong-shell and quantum meter term
enters through its bound +eps, both in the direct selected-law error and in
the selected error with latency; since the full meter error is less than
3eps/4<eps, the envelope holds with the threshold above, with no smaller H,
additional cutoff or source factor. Its selected law error bound, count mesh,
direct nonmonotone bath term and real three latency terms apply to the cut
source. The response gates of the cut source are exactly those of the indexed
source; therefore every finite adaptive history and its past-record
conditional stock law is the same algebraic map. The full competing U_resp
class remains, including u>1, overshoot and nonmonotone paths. Its
Jensen/liminf and recovery arguments, and finite terminal half-square, use
those identical maps and the exposure/count/clock envelope above. They do not
use an arbitrary forecast callback or replace the selected copy by the host
bath or trial stock.

## Density limits and scope

Uniform absolute forecasts do not by themselves give every relative dense
limit. For each fixed finite c, take j large enough and refine the actual
H/precision schedule; then the dense c->infinity limit may be taken in its
stated order. The simultaneous candidate c=n/4 satisfies
(3/8)^n exp(3n/8)->0. The supported physical endpoint c=n cannot be claimed
to have relative dense exposure asymptotics from this absolute estimate
alone. The initial c=2n zero-exposure cut is not allowed.

The compiler installs fixed values into the already paid literal output
fields. It changes neither full native census nor positive rest F/(1+F),
source program words, state, physical work columns or exact conditional
return induction. A runtime physical compiler is not introduced. The
supplied-stock work convention is that of
registered_cuts/CUT_WORK_AND_GROWTH.md, with the emitted-word height bound of
work_ledger/EMITTER_HEIGHT_BOUND.md. This document concerns the prediction
and program binding only; the active path-bridge augmentation and the whole
conjunction are treated in path_module/ and conjunction/.
