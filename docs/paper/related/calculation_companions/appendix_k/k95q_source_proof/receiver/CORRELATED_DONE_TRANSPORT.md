# Exact correlated-DONE transport for the enlarged indexed source

This is a consequence of the enlarged indexed source and its declared
protected boundary, which the enlargement leaves unchanged; it is not an
additional physical source or a forecast/resource diagonal. It uses sections
1–4 of `receiver/CORRELATED_DONE_CAPACITY.md`.

## Exact joint-map hypotheses

Let Nlane be the number of actual qualified receiver lanes, not the PCE
stream count `8^(8n)`. Let Vrec be the product of the actual fixed receiver
prefix unitaries, controlled by their valid clock nodes. Undoing Vrec removes
the receiver data gates. Profile/node factors commute with Vrec; the sum X
and the actual spectral guard transform covariantly. Matched local stock
depends on rod readiness and arm occupancy, not protected payload/factory
values; arm occupancy is invariant under the literal program. Fixed
words/media and the other modules are spectators. Thus the bare full source
is identity on receiver payload, factory and work factors on the actual
reducing sector. The normalized lift, the unique root of the enlarged source, the entire chi
and the Weyl/AW/P_D completion preserve this exact identity.

The added indexed PCE profile/rest/clock primitive reads none of those
receiver data factors. Its history unitary acts on its own PCE data/clock and
commutes with Vrec. Full source conjugation is retained. W_D acts only on
geometry/private rods and also commutes with Vrec. Consequently neither the
enlarged state nor its added clock spoils receiver protected-history
factorization. The common BQ state may be arbitrarily correlated internally.

Each receiver uses its actual deterministic prospective program, hence a
fixed rational u_i and routing depth L_i. Its completed local Householder
acts on independent ready factory stocks, while the bare source is identity
on those factors. The JOINT latent factory marginal therefore is
product_i Bernoulli(p_i), p_i=sum_(r=1)^L_i[(1-u_i)/2]^r. This is a product
law, not just one-bit marginals. A different rounding changes the actual
u_i but not this product-law argument; its prediction error remains separate.

At the actual terminal T_d P_s boundary, private clocks and unfinished
buffers/dumps are traced or protected. Every unfinished lane emits fixed
abort. Completed prefixes implement the same actual completed local routing
map. Partial trace removes an unfinished local unitary even on an arbitrary
entangled payload/reference input. Clock trace removes cross-prefix terms.
This gives the reference-extended direct-sum map of the correlated-DONE
theorem, with input-independent conditional common quantum block. Latent
factory labels on failed branches are summed into that common block, not
created as new accessible records or credited as baseline entropy.

For this EXACT mathematical state and DECLARED instrument, eta_F=0 and
eta_access=0. This is exact covariance, not a conversion of single-lane mean
bounds to a whole-block diamond estimate. No all-lanes-DONE event is needed.
Unmodelled early private-clock access, new probe interactions, a changed
boundary/dilation, or preparation/operator approximation require their own
full-channel/initial-state error; they are not covered by the zero values.
The source's local completion estimate is for its stated unmodified evolution.

## The actual mean failed fraction supplied here

For every lane i the projector onto its actual final valid clock node is a
norm-one allowed receiver test. The local comparison and same-j
classical proper-clock bound of the enlarged source give

  Pr(D_i=0) <= d_j + H a1_rec,j + H^2 a2_rec,j,

where d_j is the classical receiver DONE-loss bound and a1_rec,j, a2_rec,j
are the local receiver coefficients of H and H^2 in the same-j indexed bound
graph.

Their bounds are uniform in lane rank and arbitrary protected input/reference.
Thus, without any independence premise on D,

  delta_bar = (1/Nlane) sum_i Pr(D_i=0)
            <= min(1, d_j + H a1_rec,j + H^2 a2_rec,j).

The independent global guard's first/second derivatives and full-array
terms are ALREADY in the receiver a1 coefficient. Do not automatically add
the separate statistical guard bound again. If a separately declared
guard-abort event is part of D, its probability may be added once.

If the actual global physical-area-domain event is explicitly included in
the abort convention, define D'_i=D_i*1_good. Its failure probability obeys

  delta_bar' <= min(1, d_j + H a1_rec,j
                   + H^2(a2_rec,j + c_area)),

where c_area is the bad area-cut probability divided by H^2.

There is no factor Nlane on this common-event contribution. Using the
proved expected raw-area census does not require an additional measured
area guard. Other or concentrated area valuations need their own instrument
and failure accounting.

## What operational coding then imports, and what it does not

With those exact joint-map/product-law premises, the coding theorem of `receiver/CORRELATED_DONE_CAPACITY.md`, section3, gives,
for any Nlane, its deterministic binary ready-code existence bound. Choosing
a=Nlane^(-1/4), t=sqrt(delta_bar)+Nlane^(-1/4), b=ceil(sqrt(Nlane)) gives

  error <= exp(-2 sqrt(Nlane)) + sqrt(delta_bar) + 2^(-b),
  bit-rate loss <= 3 Nlane^(-1/4) + 2 sqrt(delta_bar)
                   + Nlane^(-1/2) + 2/Nlane.

The finite Holevo identity is not being substituted for this spatial coding
argument. The bounds require Nlane growing and delta_bar tending to zero;
the final j,H,code-length and prediction/exposure/resource diagonal remains
separate. There is no claim of physical tensor-power reuse of an unreset
quantum geometry, no M-lane product-channel approximation, and no all-DONE
condition. Internal implementation of an encoder/decoder/collector, if
requested rather than treated as the declared communication boundary,
still carries its actual stock, work and transport obligations.
