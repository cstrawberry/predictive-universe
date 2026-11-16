# Exact cutoffs and quadrature endpoints

## Exact cutoff constants

The coefficient extension of `canonical_matter_source.py` has support cutoffs
at the exact rationals 9/10 and 21/10. All normative cutoff predicates operate
on exact Fraction inputs and the constants CUT_LO=Fraction(9,10),
CUT_HI=Fraction(21,10). These values are used in support classification,
clipping and quadrature endpoints; no nearest-rounded decimal value plays any
of these roles. These rules concern the interval oracle only. They do not alter
the underlying Hamiltonian or action, or the continuum action, congruence and
elliptic proofs of `EXACT_ACTION_CONGRUENCE_ELLIPTIC_JOIN.md`.

## Exact classification and clipping

For an input box [a,b]:

* the identity/zero branch is taken only when b<=9/10 or a>=21/10 exactly;
* otherwise the retained box is [max(a,9/10),min(b,21/10)], formed exactly;
* its conversion to interval arithmetic is outward rational division;
* an input portion outside the support explicitly adds the identity/zero branch.

Thus a rational input strictly inside either endpoint cannot be mistaken for
an endpoint or an outside point, even when its gap is much smaller than the
current arithmetic precision. The resulting arithmetic box may be wider than
that gap, which is harmless. It must not become a falsely exact outside value.

The step function is monotone. Its bounds are obtained by exact rational
outward enclosure of its argument, exact comparison with 0 and 1, and outward
point evaluation. The coefficient constants such as 1/100 remain outward
`mp.iv` enclosures; they are not nearest scalars used as logical boundaries.
There are no nearest-rounded `mp.mpf` calls anywhere in
`canonical_matter_source.py`.

## Exact quadrature domain

The W integrators keep the base endpoint 9/10, clipped upper endpoint,
panel boundaries, midpoints and lengths as Fractions throughout. Each panel's
integrand box encloses the exact rational panel. Each length is converted
outward only when multiplying that enclosure. Subdivision does not move the
physical domain.

For uncertain q0 in [a,b], the midpoint is the exact rational (a+b)/2.
The additional endpoint error is the certified density upper bound times the
exact radius (b-a)/2. The output includes that error. When the midpoint clamps
to the zero integral, the routine still tests the resulting interval width;
a broad input box cannot be labeled accurate solely because no integration
panel is needed. Excess input uncertainty returns certified:false.

The theoretical total oracle refines input boxes and/or panel budgets until
its requested error is certified. A finite resource cap still returns false.
No failed/inconclusive enclosure is promoted to an accepted source value.

## Exact outward export and ancillary bound arithmetic

Interval endpoints are exported by integer floor/ceiling directly from their
exact internal binary tuples. No nearest-rounded scalar conversion intervenes.
The result is an outward dyadic rational interval. This also avoids allocating
astronomically large exact denominators for exp(-1/u) near a flat cutoff.

Norm-certificate input predicates use exact rational inputs, including tiny
positive eta. The standalone time-mesh bound helper computes all scalar
implications as Fractions and returns rational strings, not inward-rounded
floats.

## Interfaces

The master construction (`construction/INDEXED_MASTER_CONSTRUCTION.md`) uses
the following interval routines, with the
argument shapes listed in `CANONICAL_MODULE_INTERFACE.md`:

* positive_extended_f_interval
* material_derivatives_interval
* candidate_residual_interval
* control_W_enclosure
* canonical_norm_certificate

The convenience wrapper control_W_interval returns exact rational strings in
lower/upper, plus its interval pair. The scalar helper
certified_time_mesh_bounds likewise returns rational strings for its three
bounds. These two are not used by the master construction's assembled interval
backend.

Floating matrix assembly, SciPy quadrature and floating geometry helpers are
explicit numerical diagnostics, not certified predicate/integration paths.

## Tests

`test_exact_normative_arithmetic.py` checks rational time-bound identities,
tiny eta norm inputs through 2^-2048, and the absence of nearest scalar mpf
calls; its results are in `EXACT_NORMATIVE_ARITHMETIC_CHECKS.json`. The
full-native Hermiticity, metric-derivative, candidate-residual and
coefficient/control tests of `test_canonical_matter_source.py` run against the
same program.

## Remark: why nearest-rounded cutoffs fail

Consider the exact rational

    q=5324132520958563486286153462579 /
      2535301200456458802993406410752
      =21/10-1/12676506002282294014967032053760.

If the cutoffs are replaced by nearest-rounded binary values of `.9` and `2.1`
(for example `mp.mpf('2.1')` at 32 bits), q is classified as outside the
support, and the enclosure at x=0 is V=[1,1]. In fact q is inside the support,
chi(q)>0 and Vraw=1/q²<1, so V(q)<1. The misclassification excludes a nonzero
tail; it is not merely a cosmetic rounding or an overly wide enclosure. With
the exact cutoffs above, q is retained inside the support and the V interval
strictly extends below 1.

## Scope

These rules make the interval oracle exact at its cutoffs and endpoints. They
do not by themselves establish the complete master construction, and no huge
quantum history has been executed.
