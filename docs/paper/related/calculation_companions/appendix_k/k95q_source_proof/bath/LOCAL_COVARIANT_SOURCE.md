# Local conformal defect bath on the actual FLRW geometry

## Result

A local conformally coupled scalar on a timelike 2+1-dimensional defect gives the required bath spectrum of section4 without a spatially extended memory coupling and without a classical filter. Its comoving symmetric correlation is exactly white in physical proper time on EVERY spatially flat FLRW scale factor. The same field becomes the actual Bunch-Davies/Gibbons-Hawking bath on the defect's de Sitter endpoint.

This is a separate physical source branch: an explicit defect field, embedding and local memory coupling. It is not an assertion that the dark-sector source construction of Appendix I already contains a defect. Its intrinsic propagation is causal in the ambient spacetime. The finite regulator has local nearest-neighbor couplings and a memory at one site. The covariance/action, state, proper-time response and full stress functional are specified below; mean source stress is calculable from a retarded classical field. No noiseless quantum filter or inaccessible bath purification is used.

A complete source for Theorem K.9.5q still needs an actual isotropic source census/common PCE and gravitational solution; a single sheet is not silently promoted to homogeneous cosmology.

## 1. Local covariant action and actual defect

Let g be the actual 3+1 spacetime metric. A timelike embedded sheet is described by `Y^mu(xi^a)`, with induced metric `q_ab=g_munu(Y) partial_a Y^mu partial_b Y^nu`. Give it the local action

`S_Sigma=-mu_Sigma integral_Sigma sqrt(-q) d^3xi`, `mu_Sigma>=0`,

and a real scalar

`S_phi=-(1/2) integral_Sigma sqrt(-q)[q^ab partial_a phi partial_b phi+(1/8)R[q] phi^2]d^3xi`.

The value1/8 is the conformal curvature coupling in spacetime dimension3. The embedding is varied, not declared a cost-free external support. Nonzero tension, boundaries and any anchors are retained source terms. A reflection-symmetric plane z=0 in spatially flat FLRW is totally geodesic, `K_ab=0`, and its induced metric is

`q_ab dxi^a dxi^b=-dt^2+a(t)^2(dx^2+dy^2)`.

Reflection-symmetric field/memory data have no normal force, so this plane is a legitimate embedding solution on the supplied geometry. It is not an isotropic volume-filling source.

Two actual material label fields `X^I`, I=1,2, specify the regulator cells. Define `B^IJ=q^ab partial_a X^I partial_b X^J`, on the domain where their gradients span a spacelike two-plane, and `a_Sigma=(det B)^(-1/4)` relative to the recorded comoving lattice units. One explicit reference action is `S_ref=-(mu_ref/2) sum_I integral sqrt(-q) q^ab partial_a X^I partial_b X^I`, with mu_ref>0. Its positive kinetic/reference energy and stress `t_ref,ab=mu_ref sum_I[partial_a X^I partial_b X^I-(1/2)q_ab(partial X^I)^2]` are retained. The labels are varied. Away from localized source forces, X^1=x, X^2=y is the homogeneous reference solution; source-induced label/embedding motion is not silently set to zero. If physical anchors instead constrain them, their forces and stress must replace that omitted variation.

A local memory worldline lies on the sheet. It has the positive dressed Hamiltonian and fixed bare A of the underlying dressed-memory construction, with the ordinary baryonic density record `x=m n/rho_Lambda=1/s`. Its local coupling is

`S_int=-lambda integral A phi(z(tau)) d tau`,

meaning that the BARE interaction Hamiltonian is exactly `lambda A phi` (no f is inserted into that interaction). Projection of the native dressing produces `P A P=f X`, `f=(1+x)^(-1/2)`. Fix the dimensional prospective coupling

`lambda^2=H_Lambda/pi`.

The scalar has dimension(length)^(-1/2), so lambda has dimension(length)^(-1/2), and lambda phi is a physical energy. The coupling normalization is a specified source datum, not a consequence of temperature alone and not a fit to9/2.

The memory, all source counterterms and preparation/measurement controls remain actual worldline terms. Section5 specifies a positive finite regulator and counterterm. Ordinary matter can be represented by a conserved particle-number current with rest energy m n. The construction preserves that number; on a supplied homogeneous comoving history it preserves the kinematic rest-density identity `dot rho_b+3H_cos rho_b=0`. This is not a proof that such a history solves the full localized matter Euler equation: density-dependent worldline/defect interactions can supply distributional chemical-potential gradients even when the nominated ordinary density is spatially constant. The dark/defect interaction stress must be placed in the same gravitational equations. Away from homogeneity, density-dependent interactions can exert material forces; no unproved claim of separate geodesic dust perturbations is made.

## 2. Actual state and exact off-endpoint correlation

Write conformal time `deta=dt/a(t)` and define `chi=sqrt(a) phi`. The exact change of variables gives the ordinary massless2+1 Minkowski scalar action for chi plus the temporal boundary term `-(1/4) integral d^2x [(a_prime/a) chi^2]_initial^final`. That metric-dependent boundary term and its preparation/canonical-transformation work are retained. Prepare the conformal vacuum of chi. This is an actual Gaussian Hadamard state on the induced metric; it is generally not a stationary proper-time thermal state away from de Sitter.

At a comoving point its Wightman function is the distribution

`W(t,t')=1/[4 pi sqrt(a(t)a(t'))] integral_0^infinity exp[-ik(eta(t)-eta(t')-i0)] dk`,

or

`W=[delta(eta-eta')/4 - i PV(1/(eta-eta'))/(4 pi)]/sqrt(a a')`.

Since `delta(eta(t)-eta(t'))=a(t)delta(t-t')`,

`Re W(t,t')=delta(t-t')/4`.

This is the key mechanism. The symmetric covariance is exactly local in physical proper time despite nonstationary a(t). The antisymmetric part and all backreaction retain the actual geometry. Nothing identifies an arbitrary Gibbs bath with a horizon bath.

The field commutator vanishes outside the induced light cone. Every sheet-null curve is also ambient-null because q is induced from g; no superluminal shortcut through an auxiliary metric is introduced.

## 3. Proper-time response with all quantum noise included

After the controlled bright-gap reduction, the local interaction is `lambda f(t) X phi(t,0)`. X is conserved in the projected logical model. A linear Gaussian field coupling has exact coherence exponent

`sigma(t)=2 lambda^2 integral_0^t integral_0^t f(v)f(w) Re W(v,w)dv dw`.

The factor2 is the squared separation of the X eigenvalues divided by2. Consequently

`sigma(t)=(lambda^2/2) integral_0^t f(v)^2 dv`,

`dot sigma=(H_Lambda/(2 pi)) s/(1+s)`,

`kappa_sigma=1/(2 pi)`.

This is an exact distributional continuum result, valid for every regular expanding scale factor, not a frozen-density Markov approximation. The underlying field commutator and conjugate quadratures are retained. The field itself, not a noiseless classical output filter, supplies the noise. The common scalar counterterm does not change this coherence, but is varied for stress.

The literal point field has white operator-distribution noise. Finite spatial and occupation regulators approximate it on stated finite windows. The large-gap and finite-start conventions of the dressed-memory construction still apply; no finite Hamiltonian is claimed to decohere irreversibly at all times. The full response comparison class/action and routing census are not derived merely from this selected response.

## 4. Exact Gibbons-Hawking endpoint of the SAME field

For the actual de Sitter endpoint `a(t)=exp(H_Lambda t)`, the preceding conformal vacuum is the Bunch-Davies state on the induced dS3 geometry. Along the central comoving geodesic,

`W_dS(Delta t)=-i H_Lambda/[8 pi sinh(H_Lambda(Delta t-i0)/2)]`.

Its positive-frequency Fourier transform, in the convention `G(omega)=integral e^(i omega t)W(t)dt`, is

`G(omega)=1/[2(1+exp(-2 pi omega/H_Lambda))]`.

It obeys the BOSONIC KMS detailed-balance identity `G(-omega)=exp(-beta omega)G(omega)` with `beta=2 pi/H_Lambda`. The Fermi-looking denominator is the known odd-dimensional response/statistics inversion, not a claim that this scalar is a fermion.

The positive oscillator spectral measure seen by the local coupling is therefore

`J(omega)=lambda^2 G(omega)(1-exp(-beta omega))/(2 pi)`
`=lambda^2 tanh(pi omega/H_Lambda)/(4 pi)`
`=H_Lambda tanh(pi omega/H_Lambda)/(4 pi^2)`.

This is exactly the required bath spectrum, here produced by an actual local field at the same point. No radial smear, gamma-ratio filter or additional stationary off-endpoint KMS premise is needed. The induced horizon radius and central temperature are the actual H_Lambda^-1 and H_Lambda/(2pi); the sheet horizon is the ambient static-patch horizon intersected with the totally geodesic sheet.

The exact endpoint state has the ordinary entanglement across that horizon. This does not provide access to its outside purifier. Finite-replica local Z sampling remains available without that access.

## 5. Positive finite local source and the curvature IR scale

A false shortcut would complete the massless conformal-frame Hamiltonian with a point source and ignore its logarithmic spatial IR self-energy. Instead use the PHYSICAL-time phi variables. On the homogeneous sheet,

`H_phi(t)=(1/2) integral d^2x [pi_phi^2/a^2+|grad phi|^2+a^2 M(t)^2 phi^2]`,

`M(t)^2=R_Sigma(t)/8`, `R_Sigma=4 dot H_cos+6 H_cos^2`.

For the dust TEST geometry `H_cos^2=H_Lambda^2(1+y/s)`, `dot s=3H_cos s`, one obtains

`R_Sigma=6H_Lambda^2(1+y')>=6H_Lambda^2`,

so `M>=M0=sqrt(3)H_Lambda/2`. This verifies a positive instantaneous canonical field Hamiltonian on that geometric class. It is NOT a curvature-mass lower bound on the improved gravitating energy. In fact `t_00=(1/2)(dot phi+H_cos phi/2)^2+|grad phi|^2/(2a^2)-Delta(phi^2)/(8a^2)`, and after the displayed spatial boundary term its integral is the massless conformal Hamiltonian divided by a. Positive operation generator and actual metric stress are different observables. It does not prove that the coupled defect stress generates the same geometry. The response theorem in section3 does not require this positivity bound; it is the positivity condition used here for the finite Hamiltonian.

Use a finite square worldsheet lattice of comoving spacing ell, with actual local oscillator coordinates Phi_i and momenta Pi_i. A Dirichlet boundary outside the observation region is one option; a local antiperiodic finite torus avoids a zero mode for clean Fourier estimates. At each site choose an active occupation cutoff N_i and a fixed field scale phi_* >0. The actual matrices are `Phi_i=phi_*(b_i+b_i^dagger)/sqrt(2)` and `Pi_i=(b_i-b_i^dagger)/(i sqrt(2)phi_*)`, with `b_i=sum_(r=1)^N_i sqrt(r)|r-1><r|`. Embed them in ceil(log_8(N_i+1)) native8 digits, set both matrices to zero on padded levels, and add H_Lambda times the padded-level projector. All padded transitions are absent. The memory uses the one-digit three-active-state embedding of the dressed-memory construction. Reference fields/controllers carry their own similarly regulated degrees and are not included for free in the bath digit count.

The finite quadratic Hamiltonian is

`H_phi,N=(1/2)sum_i Pi_i^2/(a^2 ell^2)`
`       +(1/2)sum_<ij>(Phi_i-Phi_j)^2+(1/2)a^2 ell^2 M^2 sum_i Phi_i^2`,

with the appropriate positive twisted boundary-edge square in the antiperiodic case. The memory couples only to `lambda A Phi_0`. There is no central memory operator multiplied by an instantaneous horizon-size spatial smear.

All lattice terms are local on the sheet. They are a material-coordinate finite regulator of the covariant action, with proper cell area `v=a^2 ell^2` retained when varying the metric. A finite lattice has its own finite propagation bound; its low-frequency dispersion approaches the induced relativistic light cone. It is not described as an exactly continuum-causal theory at a fixed lattice spacing.

Let K_N be the positive potential matrix. For the projected source, completing its square requires `C_N >= (lambda^2/2)(K_N^-1)_00`. An explicit LOCAL counterterm law that bounds a finite Dirichlet box is the infinite-lattice diagonal at the fixed physical mass M0:

`C_ell(a)=(lambda^2/2) integral_[-pi,pi]^2 d^2q/(2 pi)^2`
`          /[4sin^2(q_x/2)+4sin^2(q_y/2)+a^2 ell^2 M0^2]`.

For a finite antiperiodic torus use its corresponding finite diagonal or a verified upper envelope. This is a fixed regulator-dependent function of the LOCAL proper cell area, not a time schedule chosen to impose a response. Its direct coefficient evaluator is `C_ell=lambda^2 K(4/(4+mu^2))/[pi(4+mu^2)]`, `mu=a ell M0`, where K uses the elliptic MODULUS (square that argument when a library uses the parameter). Thus `C_ell(a)~lambda^2 log[4sqrt(2)/(a ell M0)]/(4 pi)` as ell tends to zero, and `a partial_a C_ell -> -lambda^2/(4pi)`. The curvature mass provides the physical IR floor.

The native three-level source is

`H_full=H_D+H_phi,N+lambda A Phi_0+C_ell(a) f(n)^2 I+delta I`,

`delta=||lambda Phi_0||^2/(4 Omega)`

after finite occupation truncations. The P block is positive by the field-potential square; the Q block is at least Omega(1+x), and the same Schur proof as in the dressed-memory construction makes H_full positive. The truncation uses actual finite coordinate/momentum matrices; positivity of the displayed quadratic squares does not require an exact finite canonical commutator. Omega is chosen after the field/occupation regulator so delta and dynamic projection errors meet the target.

**An explicit inhomogeneous finite-domain extension.** The sharp C_ell(a) bound above is for the homogeneous uniform-cell geometry. It is not asserted for arbitrary surrounding metric/label configurations. A registered wider domain can instead require proper areas `v_i>=a_min^2 ell^2`, positive edge weights `w_ij>=w_min>0`, and `M_i^2>=M0^2`. Then

`K>=w_min L_D+M0^2 a_min^2 ell^2 I`,

so a fixed prospective coefficient

`C_dom=lambda^2 I(M0 a_min ell/sqrt(w_min))/(2w_min)`

bounds every relevant Dirichlet Green diagonal; here `I(mu)=2K(4/(4+mu^2))/[pi(4+mu^2)]`. The same Schur proof is uniform over that field-background domain. This is a genuine finite-source extension with an explicitly charged larger counterterm. It does not inherit the sharp homogeneous renormalized-energy claim: add and vary the whole difference `(C_dom-C_ell(a_Sigma))f^2`, and for w_min<1 its debit may grow logarithmically under cutoff removal. This controls the field/memory matrix for backgrounds in that domain, not a full quantum metric/label kinetic Hamiltonian. The latter remains the coupled-gravity domain in section10.

For every finite source all coefficients, preparation energies and native counts are finite. Native8 embedding of each local oscillator and the memory is exactly the explicit padding recipe stated above; its local site basis, not a nonlocal mode cutoff, is the actual internal hardware record. Field normal modes are used to calculate the state and errors, not asserted to be a free nonlocal gate.

## 6. State preparation and local finite-error interface

The conformal-frame lattice has a positive nearest-neighbor quadratic Hamiltonian. On a finite Dirichlet or antiperiodic box it has a nonzero lowest frequency. An available local preparation algorithm interpolates from decoupled massive oscillators: `K(r)=(1-r)omega_ref^2 I+r K_lattice`. In the untruncated finite quadratic system all instantaneous mode frequencies are at least `min(omega_ref,omega_min)>0`. For a chosen finite native truncation, certify the actual matrix ground-state gap along the interpolation and bound the control derivatives before choosing an adiabatic duration; if a cutoff spoils that certificate, increase it rather than assuming the untruncated gap. This is a specified finite algorithm, not a numerically executed factory for every regulator. A generic alternative compiles the finite state isometry into nearest-neighbor native8 gates with finite precision and all swap/latency/energy costs retained. The exact canonical map is `phi=chi/sqrt(a)`, `pi_phi=sqrt(a)[p_chi-(a_prime/(2a))chi]`, with p_chi=chi_prime after transferring the recorded boundary term. Onsite squeezing and this momentum shear map the state to the physical phi variables. Their finite native controls, proper durations, work and metric boundary term are retained. The alternative explicit finite Householder preparation also remains valid if its nonlocal cost is charged, but is not called a local factory.

For a finite observation window, set `g(eta)=f(t(eta))sqrt(a(t(eta)))` and extend it by zero outside that window. Let `G(omega)=integral g(eta)e^(i omega eta)deta`, `V=TV(g_extended)`, `M_0g=integral|g|`, `M_1g=integral |eta g|`, with the window origin translated to eta=0. The infinite square-lattice dispersion is

`omega_ell(k)=(2/ell)sqrt[sin^2(k_x ell/2)+sin^2(k_y ell/2)]`.

Its exact Gaussian exponent is

`sigma_ell=lambda^2 integral_BZ d^2k/(2pi)^2 |G(omega_ell(k))|^2/omega_ell(k)`.

The continuum exponent is `sigma_0=(lambda^2/2)integral f^2 dt`. For `ell W<=1`, let `c=2/pi`. Splitting momenta at W, using `omega_ell>=c|k|`, `|omega_ell-|k||<=ell^2 |k|^3/12`, `|G|<=M_0g`, `|G'|<=M_1g`, and `|G(omega)|<=V/omega`, gives

`|sigma_ell-sigma_0| <= lambda^2 ell^2/(2pi c)`
`   *[M_0g^2 W^3/36+M_0g M_1g W^4/24]`
`   +lambda^2 V^2(1+c^-3)/(2pi W)`.

Thus `W=ell^(-2/5)` in fixed length units gives a constructive vanishing finite-window error. The exponent is therefore not an unexplained bath oracle. Finite volume has a quantitative separate bound. On an even-N antiperiodic square, let h=2pi/(N ell) be the momentum mesh and choose r>=2h, r<pi/ell. Split cells according to whether their midpoint has |k|<=r. The near-origin sum and integral are bounded using omega_ell>=c|k| and the fact that every such cell lies in the disk r+h. On the remaining cells use |grad omega_ell|<=1. A conservative bound is

`|sigma_ell,N-sigma_ell| <= 3lambda^2 M_0g^2(r+h)/(2pi c)`
` +lambda^2 h/(sqrt(2)ell^2)`
`  *[4M_0g M_1g/(c r)+4M_0g^2/(c^2 r^2)]`.

For each fixed ell it tends to zero, for example with r proportional to h^(1/3) in fixed units. It gives an explicit way to choose N before the occupation/gap cutoffs; a source diagonal can make this error smaller than any nominated tolerance. The corresponding finite-torus counterterm is computed from the same positive Fourier diagonal at M0, or a verified larger bound, and varied as its local cell-area function. This finite coefficient is part of the source description, not a free remote controller. Finite occupation errors follow Gaussian energy-tail estimates; preparation, finite-gap and control errors add by trace-norm/Duhamel bounds. The local finite matrix can be run directly at every regulator stage.

There is no claim of all-time uniform convergence for a fixed finite lattice, nor interchange of a fixed cutoff with the dense endpoint. Finite positive-density starts and separated observation/source limits follow the paid dressed-memory construction. The local-lattice cutoff has its own displayed error, not that construction's Gaussian-cutoff bound.

## 7. Full varied stress, not just the dephasing mean

The bulk sheet field stress is the actual improved tensor

`t_ab[phi]=nabla_a phi nabla_b phi-(1/2)q_ab(nabla phi)^2`
`          +(1/8)[q_ab Box_q-nabla_a nabla_b+G_ab[q]]phi^2`.

Its ambient contribution is

`T_phi^munu(x)=integral_Sigma sqrt(-q) e_a^mu e_b^nu <t^ab> delta^4(x-Y)/sqrt(-g) d^3xi`.

The tension contributes the same pushforward of `-mu_Sigma q^ab`; the explicit reference action adds the pushforward of t_ref. Variation of the embedding gives its normal-force equation, and variation of the scalar gives `(Box_q-R/8)phi=lambda A delta_worldline`. Together with the memory/material and actual reference-label equations these imply the distributional conservation law for the SUM of sheet, field, memory, interaction, counterterm, ordinary material and support stress. An external anchor or boundary supplies its own force term; it cannot be omitted from that identity.

For comoving memory worldlines, write the full local internal energy before projection as

`U=H_D(n)+lambda A phi+C_ell(a_Sigma) f(n)^2+delta`.

Here `a_Sigma=(proper cell area/ell^2)^(1/2)` is the scalar defined by the two material worldsheet coordinates. Keep n and a_Sigma independent while varying g. Let u be the worldline velocity, `h_b^munu=g^munu+u^mu u^nu`, and `h_Sigma^munu` the two-dimensional spatial projector tangent to the sheet. The localized material contribution is

`T_line^munu=integral d tau delta^4(x-z)/sqrt(-g)`
` *[<U>u^mu u^nu+n<partial_n U>h_b^munu`
`   -(a_Sigma/2)<partial_aSigma U>h_Sigma^munu]`.

The final term is essential: the physical ultraviolet cell changes under metric variation. Since `C_ell~lambda^2 log[1/(a_Sigma ell M0)]/(4pi)`, its area derivative has a finite nonzero limit even though C itself diverges. A source that keeps only the f-density derivative would miss this stress. The finite lattice kinetic, edge and curvature terms are varied as well; their continuum limit gives the improved field tensor plus the retained regulator counterterms.

The bright-state derivative caveat of the dressed-memory construction applies here as well. Vary `H_D` before projecting; its O(Omega) density derivative combines with O(1/Omega) bright admixtures. The projected mean force contains `lambda <X phi>+2C_ell f`, while the area derivative contains `partial_aSigma C_ell`. Neither term disappears because its Hamiltonian is a logical phase. Bare gap stress fluctuations and white field stress fluctuations require smearing; no finite pointwise perturbation tensor is inferred from finite mean response.

## 8. Explicit retarded field and calculable backreaction

For the initial conformal vacuum and projected X eigenvalue ±1, the field is a displaced Gaussian state. Let `psi(t,r)` be the retarded classical solution per unit lambda with the sign fixed by `(Box_q-R/8)psi=f delta_worldline`. In conformal coordinates its explicit expression is

`psi(t,r)= -1/sqrt(a(t)) integral_eta0^eta(t) sqrt(a(t')) f(t')`
`                     *G_ret,flat(eta(t)-eta',r) d eta'`,

`G_ret,flat(v,r)=theta(v)theta(v^2-r^2)/(2pi sqrt(v^2-r^2))`.

Thus the conditional mean is `phi_±=±lambda psi`, and

`<t_ab>=<t_ab>_conformal-vacuum+lambda^2 t_ab[psi]`

with the corresponding regulated coincidence/line counterterms. In odd spacetime dimension there is no bulk conformal trace anomaly; on infinite conformally flat space the conformal renormalization scheme takes the free conformal-vacuum stress to the transported Minkowski value0. Finite boxes, defects, boundaries, alternative renormalization conditions and all source-induced terms still have their actual stress. This statement does not set absolute finite-source thermal/preparation energy to zero.

At the source, the unsubtracted causal force is

`lambda<X phi(t,0)>=-lambda^2/(2pi) integral_t0^t`
` f(v)/[sqrt(a(t)a(v))(eta(t)-eta(v))] dv`,

under the same local UV regulator. Its short-distance logarithm is exactly the one canceled by `2C_ell f`, with the retained finite renormalization condition/cell term. This gives a concrete geometry-dependent retarded force and a computable complete mean stress, rather than assigning a pressure from the desired response law. At the exact de Sitter endpoint the denominator is `(2/H)sinh[H(t-v)/2]`, recovering the oscillator commutator of the dressed-memory construction. That construction's static GH mass-renormalization convention can differ from the present local lattice/mass-reference convention by a finite worldline term; to adopt its exact log-coth force convention that term must be specified and varied. Spectral equality alone does not equate energy renormalization conventions. Off endpoint the causal kernel is different although the symmetric noise and clock remain exactly local.

There is also an explicit finite formula for the integrated IMPROVED energy of the field plus local interaction plus counterterm. It shows rather than assumes how both the UV and the net-source IR terms are handled. On a finite conformal-time window, set `q(eta)=sqrt(a) f`, `q(eta_0)=0`,

`Q(k)=integral_eta0^eta q(v)e^(ikv)dv`,
`D(k)=q(eta)-ik e^(-iketa)Q(k)=integral_eta0^eta q_prime(v)e^(-ik(eta-v))dv`,
`mu_c=a(eta) M0`.

The regulator-matched lattice sum is

`E_ell=lambda^2/(2a) integral_BZ d^2k/(2pi)^2`
` *[|D(omega_ell)|^2/omega_ell^2-q^2 mu_c^2/(omega_ell^2(omega_ell^2+mu_c^2))]`.

It uses exactly the same local dispersion and C_ell as the positive source, so the UV cancellation occurs before taking a continuum limit. The limit is

`E_grav,ren= lambda^2/(4pi a) integral_0^infinity`
` [|D(k)|^2-q(eta)^2 mu_c^2/(k^2+mu_c^2)] dk/k`.

Indeed the field energy is `lambda^2/(4pi a) integral k|Q|^2 dk`; the interaction energy is `lambda^2 q/(2pi a) integral Im[e^(-iketa)Q]dk`; and the counterterm is `lambda^2 q^2/(4pi a) integral k/(k^2+mu_c^2)dk`. Their sum is the displayed integrand. Each finite regulator uses the same dispersion/measure in all three terms; finite constants cannot be changed independently after the sum.

For real q_prime of bounded variation, the numerator is O(k^2) at zero, because `D(0)=q` and the first derivative of |D|^2 at zero vanishes. It is O(k^-2) at infinity when q starts at0 and q_prime has bounded variation. Thus the summed energy has a finite UV and IR limit. No massless static IR square has been thrown away. The renormalized improved energy need not be nonnegative; its actual value, not canonical positivity, enters gravity.

The same convention gives the finite density force

`F_f= lambda^2/(2pi sqrt(a)) integral_0^infinity`
` [Re D(k)-q mu_c^2/(k^2+mu_c^2)] dk/k`.

The numerator again cancels the IR constant and has an integrable UV tail. The spatial cell-area derivative and improved tensor terms in section7 remain in the pressures. These are explicit measurable mean-energy/force functionals for a supplied scale-factor history, with no inverse reconstruction from the desired Friedmann equation.

The field energy, pressure, radial flux, defect tension and memory/controller stress can therefore be evaluated from this actual solution at any finite regulator. No off-endpoint bath state or local quantum noise mechanism is missing.

## 9. Scope and the remaining construction

This construction supplies a local covariant field/state/coupling branch, its actual GH endpoint, a positive finite local Hamiltonian regulator, a controlled proper-time response and the full varied source-stress functional/retarded solution. It is a construction at the full scope of the problem, not a second designer background.

It does not yet give an isotropic homogeneous census of these sheets/memories, a source-bound area/capacity/PCE comparison, or a self-consistent solution of the same gravitational equations with the required G response. A sheet carries anisotropic tension and field stress. A three-orientation or statistical sheet ensemble is a separate census with actual intersections, field cross-correlations, energy and anisotropic fluctuations; it cannot be asserted free. In particular, constant positive sheet tension in a comoving leaf array has rho_wall proportional to a^(-1), so it cannot be dismissed merely as a small initial correction to a dust-normalized response. Any density-dependent auxiliary tension would be an additional prospectively specified source term whose n variation is retained, not an after-the-fact subtraction. The dust record remains ordinary baryonic density, while all actual defect/dressing stress belongs in the derived dark/gravitational equations.

The remaining join is to choose and count that source census and solve its same-action gravitational response, then test the resulting source comparison/channel/area and smeared perturbations. This document alone does not give the full source for Theorem K.9.5q.

## 10. Gravitational coefficient and regulator domain

The nonminimal term is a real intrinsic-curvature coupling `-phi^2 R_Sigma/16`. When the ambient metric is dynamical it contributes to its derivative terms; it cannot be treated solely as an external positive oscillator mass. The present bath proof establishes the full varied tensor, not ghost-free gravity for arbitrarily large field amplitude or arbitrarily removed cutoffs. A finite coupled-gravity treatment must bound the actual native field amplitude and momenta and inspect the resulting bulk-plus-sheet kinetic form. No extra sheet Einstein term is appended merely to assert stability. Such a term would define another source branch and would itself need a coupled-mode and coefficient analysis. No independent positivity requirement on each improved stress component is invented. The remaining gravity calculation is a precise action/cutoff-domain problem, not an omitted bath-noise source.
