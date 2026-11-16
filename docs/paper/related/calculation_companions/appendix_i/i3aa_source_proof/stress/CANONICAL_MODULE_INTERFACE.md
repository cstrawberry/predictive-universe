# Executable canonical source interface

Module: `canonical_matter_source.py` (this folder). Its exact cutoff and
endpoint arithmetic is described in `EXACT_CUTOFF_AND_ENDPOINTS.md`.

## Numerical full-native oracle

CanonicalMatterSource(J,K,eta,control=True,metric_callback=None,
controller_profile=None) exposes:

* entry(row,col,t,metric_overrides=None): actual whole-Hamiltonian entry on the
  full K^(4J³) space, including all kinetic, gradient, positive potential and
  actual autonomous controller terms;
* metric_derivative_entry(row,col,t,cell,dN,dbeta,dgamma): actual independent ADM
  metric derivative of the same entire Hamiltonian;
* initial_product_state, inventory, encode, decode, and registered Q budget.

K must be a power of 8. No basis states are omitted. The basis is the ordered Q
spectral basis with each oscillator eigenvector's first component positive.
The local matrices are Q=sqrt(eta/(2h²))(a+a†),
P=-i sqrt(eta h²/2)(a-a†), with h=2pi/J. If the certified spectral worker uses
probabilists' Hermite roots lambda, multiply them by sqrt(eta/(2h²)). This is
not the physicists' Hermite-root scaling.

These matrix routines use floating eigensolvers/arithmetic for numerical
diagnostics. They are not interval certificates. The master construction's
`construction/certified_spectral.py` supplies the exact rational Hermite/Sturm
interval backend.

The ADM identity is

    delta H = sum_v sqrt(gamma) h³ [rho delta N
       - j_i delta beta^i -(N/2) S^{ij} delta gamma_ij].

Legendre duality identifies this with the metric variation of the same matter
action. The sign of the shift derivative is minus the normal-frame momentum
current j, not plus.

## Candidate-specific actual control

make_candidate_controller(J,b_callback,Bt_callback,force_density_bound,profile_id)
freezes that candidate's own force-density profile. Its classical formula is

    r_A=-partial_t f_A0-3 B_t f_A0
       +D_x(b f_A1)/b³ +.5 partial_A f00
       -.5 b^-2 partial_A sum_i fii-partial_A V.

Only r0,r1 can be nonzero on this branch. The sign convention is such that
Hctl=N v Vctl adds canonical force -N v r_A. This is a force density, not a
force already multiplied by volume. The profile is held fixed under metric
variation and then realized as the material potential

    W(q0)+r1(q0)(q1-x_v),    W'=r0.

Its whole-native positive offset is (3+RQbudget)*force_density_bound, with
RQbudget a registered integer upper bound. All of this is included in H and in
its lapse/spatial metric derivatives. No external force clock is needed.

For a non-target metric callback, constructing the source without an explicit
candidate-specific controller profile raises an error. It never silently uses
the base profile for a different metric. The supplied bound covers the entire
clock extension [.9,2.1]. With the base-centered inner-window candidate registry
of `common_source/candidate_registry.py`, the candidate equals the solved base
outside [1,2].

## Executed interval primitives

The following routines perform outward interval arithmetic and export rational
endpoint pairs, rather than merely citing interval pseudocode:

* positive_extended_f_interval(q0_bounds,q1_bounds,bits)
* material_derivatives_interval(t_bounds,x_bounds,bits)
* candidate_residual_interval(t_bounds,x_bounds,J,b_interval,Bt_interval,bits)
* control_W_enclosure(q0_bounds,x_bounds,J,residual_interval,density_bound,
  bits,max_panels)
* canonical_norm_certificate(J,K,eta_bounds,RQ_upper,controller_density_upper,
  b_lower,b_upper,Bt_upper,Btt_upper,bits)

The b/Bt callbacks take rational boxes and requested bits and return rational
endpoint pairs. The residual callback to control_W_enclosure takes
(tb,xb,J,bits) and returns {'certified':True,'entries':{'r0':(...),...}}.
The output W enclosure is certified only if it reaches the requested width.
A resource cap returns certified:false with its reason. The theoretical total
oracle/search raises that cap or dovetails it; it never treats the failed
resource-limited call as an accepted value.

The coefficient extension is chi(t)Fraw+(1-chi(t))I and
chi(t)/t²+(1-chi(t)), with
chi(t)=step(10(t-.9))*step(10(2.1-t)). It has exact uniform bounds

    F >= (2/25) I,       ||F|| <= 7/5,       V <= 100/81.

For example on the raw support, diagonal dominance after spatial congruence
gives a lower bound exceeding .114, and undoing that congruence multiplies by
at least .81 exp(-.042)>.775. Their product exceeds .08=2/25. Convex mixing with
I preserves the lower bound. Simple rational exponential enclosures
exp(.042)<1.043, exp(.021)<1.022 verify these margins.

canonical_norm_certificate returns conservative full-state rational upper bounds
for H,H',H'', cell density, the true commutator source rate, its derivative,
rate squared and its derivative. It includes the actual positive controller
and vacuum energies. Its candidate b/Bt/Btt and control bounds must themselves
be certified receipts. These norms are adequate for the actual finite-U
interval-search time mesh even if numerically very loose.

## Test coverage

`test_canonical_matter_source.py` checks full-native Hermiticity, actual
ADM derivatives against independent perturbations, candidate residual mapping,
positive coefficient intervals at cutoff joins, and a genuine interval W
integration. Its results are in `CANONICAL_SOURCE_MODULE_VERIFICATION.json`.
This is not a large-dimensional finite-U trajectory computation. The assembled
certified entry/time-evolution search and the complete stock ledger belong to
the master construction (`construction/INDEXED_MASTER_CONSTRUCTION.md`).
