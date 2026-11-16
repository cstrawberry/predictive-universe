# Finite source selector

This document gives the explicit finite comparison class, decoder and acceptance test used by the source construction. The transport uniqueness and physical-selection arguments in §§1–2 and4 of `SOURCE_EQUATION_GEOMETRY_SELECTOR.md` apply to it. This is a deliberately source-relative, inverse-designed action and a background-centered comparison class. The independently declared material action contains the exact branch coefficient functions. This is not a derivation of that background from earlier PU primitives, a universal architecture optimum, or target-independent geometry emergence.

## 1. Actual finite comparison class

Let B*=log(t)+t cos(x)/100, the fixed-action solution. The actual source code is

B_c=B*+ψ(t)Q_c(t−1,x),
ψ(t)=χ(8(t−1))χ(8(2−t)),

where χ is the explicit flat smooth step. Every candidate therefore has exactly the declared initial data, is equal to B* outside the physical slab, and agrees with its full endpoint jets. The operational global extension uses the already installed periodic base extension outside the slab; the physical scalar chart may separately use the raw smooth B* extension near the endpoints. These are the same metric on the retained cosmological slab. No physical periodic-time cosmology is asserted.

At row j, d=K=j+1. Q has degree d Bernstein coefficients and the real Fourier modes cos(0),cos(kx),sin(kx), 1≤k≤K. Each coefficient is in the finite set

{a · 10^−4/H: a∈Z, |a|≤H}, H=16(d+1)^8(K+1)^8.

Thus there are exactly (2H+1)^((d+1)(2K+1)) raw codes, including zero. `candidate_registry.py` is the literal finite decoder. Shape admission uses the computable Bernstein finite-difference/Fourier bound for every mixed derivative of Q through total order6, requiring it to be at most10^−4. Raw codes failing that test have the explicit base/FAIL extension; they are not admitted alternative source metrics. Code zero is an exact solved witness. Code one is nonzero and passes the shape test. This is a growing nontrivial finite class, with bounded coefficient magnitudes and denominators, not an implicit infinite set of rational coefficients.

The common C6 envelope suffices for the source C2 task, its interval completion, the geometry bounds, and the actual controller's first/second rate bounds. Each finite polynomial/cutoff has computable derivatives of every higher order, used when the fixed-J packet proof or certified finite operator evolution needs them. Those higher bounds need not be uniform in the comparison-row index.

## 2. Same actual geometric profile

The exact profile is b_c=exp(B_c), not the reference b* with the candidate carried as metadata. `Candidate.b_iv` implements its global periodic operational profile; `candidate_intervals.py` implements the actual physical chart and derivative boxes. Every propagation line length, smooth receipt, capacity flag q=b_c³/27, μ and c_i, reflecting generator, source metric and controller uses this same selected profile.

The perturbation is supported only on1<t<2. There the base has |B_t|≤1.01, |B_tt|≤1, |B_x|≤.02, |B_tx|≤.01 and |B_xx|≤.02. The explicit cutoff bounds |ψ'|≤2176, |ψ''|<4·10^6 and the Q envelope imply conservative inner bounds |B_t|<1.23, |B_tt|<402, |B_x|<.0201, |B_tx|<.228, |B_xx|<.0201. They fit within the already proved much larger outer-extension coefficient envelopes. In particular1/3<b_c<3 and the fixed common μ,c,G derivative/ellipticity bounds of `geometry/CURVED_GEOMETRY_BE_MOSCO_CERTIFICATE.md` remain valid. The BE(K,∞), local PI, noncollapse, mGH and Mosco estimates therefore apply with the same constants, plus the explicit selected-profile convergence error. No finite BE(K,4) claim is made.

## 3. Actual task and total finite acceptance

`source_task_certificate.py` evaluates the fixed material action's Euler–Lagrange equations and G_ab−κT_ab for Φ=(t,x,y,z), on the candidate's actual metric. It tests all t/x derivatives through total order2. Tensor components that vanish identically and the equal22/33 components are stated in `source_task_certificate.py`. The material residual is Ebar=kappa ell² E, and the Einstein residual is G_cov−kappa T_cov. Uniform positive b bounds convert coordinate components to the physical frame with explicit finite factors; physical stress and rate scales are1/(kappa ell²) and1/(kappa ell³).

The evaluator uses exact difference identities obtained by subtracting the *proved* fixed-action solution. This is an algebraic evaluation of the actual equations, not a distance-to-B* objective. In particular, let δ=B_c−B*, f=κF, v=κℓ²V, tr=f11+f22+f33, and e±=exp(±2B_c), e±*=exp(±2B*). The material residual is

E_A=−3δ_t f_A0+(e−−e−*)[∂x f_A1+B*_x f_A1−(∂A tr)/2]+e−δ_x f_A1,

with the appropriate fixed material derivative for A=0,1; A=2,3 vanish. The Einstein residual formulas in the code are the exact corresponding warped-metric identities. `check_einstein_residuals.py` derives the Christoffel, Ricci and Einstein tensors symbolically for a generic warp B(t,x) and verifies every stated Einstein and material residual formula; its results are in `EINSTEIN_RESIDUAL_CHECKS.json`.

All jets contain outward rational intervals for derivative/factorial coefficients. The smooth cutoff's n-th eta derivative is exp(−1/z)P_n(1/z), with an explicitly computed integer polynomial. On a box crossing z=0, each monomial is bounded by its actual decreasing exponential tail (or k! before the maximum), so the enclosures converge even at the flat endpoints. Reciprocal, exponential, Bernstein and trigonometric box rules are explicit. No floating point equality oracle is used.

Each finite task fixes the box grid and precision first. It accepts iff its rational whole-domain C2 residual upper bound is at most ε. It can conservatively reject a near-threshold code; it cannot run indefinitely attempting to decide equality. Code zero has literal residual zero under the exact identities and is always a continuum task witness. Its actual native realization additionally has to pass the finite-H/source certification. The common native-source refinement is chosen to make those physical errors smaller than the task margin, and each candidate is tested against its own actual H/controller, not a reference candidate's history.

The tested sector is the actual fixed-F,V action, before adding the separately retained consistency controller. The controller cancels the finite trajectory residual, so the full controlled material equation alone is zero for every candidate and is not a discriminator. The task equivalently requires the actual added controller force density and its C2 derivatives to vanish, with all its energy/stress still counted. Full controlled equations plus this vanishing physical sector imply the fixed-action equation in the limit.

The direct C2 residual test is intentional. An amplitude residual alone would not give an O(ε) controller-rate error. The actual autonomous controller uses the residual *force density* with the cell lapse/volume factors retained; its coefficients and source-rate bounds use these C2 receipts and the separately certified finite-difference truncation error.

## 4. Selection and native implementation

`price_select` is a total scan of the finite admitted codes given their finite physical task and price certificates. If each actual full price lies in an interval of width at most ε_price, selecting the smallest upper endpoint has actual price at most the true admitted minimum plus ε_price. Ties use the first code. The task is not residual minimization disguised as a physical price.

The source-relative one-shot price may charge E_initial+T_form(m ln8−S_initial), with all artifacts retained and zero return credit. This is a declared formation/reference-free-energy charge plus retained capital charged once, not a demonstrated exact finite-temperature factory protocol, dissipated heat, or a minimum-work theorem. Exact pure resources remain a paid initial boundary.

The integrated construction (`construction/INDEXED_MASTER_CONSTRUCTION.md`) must define the initial joint state, every native factor, all H and source derivatives, actual resource price/return contract, and a finite description of this direct selection map. An arbitrary finite many-body preparation permutation may encode this terminating map on its full support, as in the explicitly declared interaction class. Calling that a direct interaction is accurate; calling it an executed search circuit without its arithmetic/workspace would not be.

For every task-passing sequence, the actual fixed-action material equation yields

||B_c−B*||∞≤2 exp(6) ||E0||∞.

Together with the common derivative envelope this gives C2 convergence, hence actual source/congruence/metric/geometry convergence. Thus exact or ε_price physical selection has the same limit regardless of how large common stock baselines or small candidate-dependent apparatus debits are. Those costs must still be counted. The master realization is the separate integrated construction.
