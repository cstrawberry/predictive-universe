# A source-equation selector for the actual curved geometry

This is the mathematical selection interface for the prospective source. Its finite native preparation, complete resource price and common error binding belong to the constructor (`construction/INDEXED_MASTER_CONSTRUCTION.md`), not to this document. It does not establish a universal architecture minimum.

## 1. Task specified from the material source

Fix the material coefficient functions F,V of the independently specified four-field action in `stress/EXACT_ACTION_CONGRUENCE_ELLIPTIC_JOIN.md`. They are held fixed when candidate metrics or physical metric variations are compared. The candidate metric class is

`g_B=ell²[-dt²+exp(2B(t,x))(dx²+dy²+dz²)]`, `Phi=(t,x,y,z)`,

on the actual slab `[1,2] x T3`, with periodic x,y,z. Fix the initial data

`B(1,x)=epsilon cosx`, `B_t(1,x)=1+epsilon cosx`, `epsilon=1/100`.

Candidates are uniformly C^5 bounded, with `|B|<=log3`; a fixed larger C^s bound can be added when a geometric or observable estimate needs it. A finite task tests the actual material action's Phi0 Euler–Lagrange residual and the fixed initial data. It can also test every Einstein/material residual. This is a source-consistency prediction/response task, not comparison with a measured galaxy curve, a desired backreaction value, or a separately assigned Poisson output.

The finite candidate code consists of rational polynomial/trigonometric coefficients under these fixed bounds. No arbitrary non-diagonal metric is claimed to be implemented by the axis finite-volume constructor. The class grows densely within the declared regular diagonal class; it is not a two-candidate comparison.

## 2. Explicit stability from the source equation

Write Fbar=kappa F and Vbar=kappa ell² V. Since Phi=id and the metric is diagonal, the actual Phi0 equation, divided by the positive volume factor, is

`Ebar0 = -3 Fbar00 [B_t - A exp(-2B) B_x - C exp(-2B) - D]`,

where

- `A=Fbar01/(3Fbar00)`;
- `C=(partial_x Fbar01 - (1/2) partial_t sum_i Fbar_ii)/(3Fbar00)`;
- `D=(-(1/2)partial_t Fbar00 - partial_t Vbar)/(3Fbar00)`.

All coefficient functions are fixed source functions. They do not depend on the candidate B. The exact branch is `B*=logt+epsilon t cosx`. Direct symbolic verification and conservative interval bounds are in `stress/verify_selection_transport.py` and its result file `stress/SELECTION_TRANSPORT_VERIFICATION.json`. On this slab,

`Fbar00>=.1897`, `|A|<.036`, `|C|<.301`, `|D|<5.33`,

and `1/(3Fbar00)<2`. The residual equation is a first-order transport equation with smooth coefficients. Subtract the equation for B* and use `|B|<=log3`, `|partial_x B*|<=.02` and the mean-value theorem for exp(-2B). Its zeroth-order difference coefficient has absolute value at most

`18(.02 |A|+|C|)<6`.

Along the candidate's own characteristics, Gronwall therefore yields

`||B-B*||_infinity <= exp(6) [||B(1)-B*(1)||_infinity + 2 ||Ebar0||_infinity]`.

The coefficient regularity follows from the fixed C^5 candidate bound, so these characteristics exist across the compact slab. A residual tending to zero thus forces the **actual metric coefficient** to the source-selected B*. Uniform higher derivative bounds and standard finite-difference interpolation then imply C^2 convergence. For example, with a common C^3 bound M, second derivatives can be estimated by centered or one-sided finite differences with step r: the error is bounded by `C ||B-B*||_infinity/r² + C M r`; choose `r=(||B-B*||_infinity/M)^(1/3)`. A fixed extension across the two endpoints supplies the one-sided version. There is no unproved effective compactness modulus here.

Consequently, every asymptotically task-admissible finite candidate, including every cost-selected candidate, has the same warped metric limit. The result does not depend on ignoring a small candidate-dependent apparatus price.

## 3. A finite, nonempty candidate and residual registry

The explicit finite comparison class used by the source construction, with its literal decoder, shape test and acceptance test, is given in `FINITE_SOURCE_SELECTOR.md`; it perturbs B* by a cutoff Bernstein–Fourier code. This section gives a direct initial-data-preserving parameterization and residual certificate.

A concrete initial-data-preserving parameterization is

`B=epsilon cosx +(t-1)(1+epsilon cosx)+(t-1)² Q(t-1,x)`.

The exact required remainder is the smooth function

`Q*(s)=[log(1+s)-s]/s² = -integral_0^1 u/(1+su) du`,

including `Q*(0)=-1/2`. Its derivatives obey

`||d^m Q*/ds^m||_infinity <= m!/(m+2)`.

At a scalar resolution d, admit rational Bernstein coefficients in s and finitely many real Fourier modes in x, with an explicit fixed C^5 bound. Weighted coefficient finite-difference tests give sufficient finite derivative certificates. The witness uses only the constant x mode: its Bernstein coefficients are rational interval approximations to Q*(j/d). Positive Bernstein averaging and finite-difference formulas preserve the derivative bounds up to the explicitly charged coefficient rounding. Choosing rounding at most d^-6 makes that contribution vanish through fifth order. Bernstein approximation and the displayed derivative bounds give a computable C^1 error tending to zero. Thus the candidate registry is nonempty at every sufficiently fine requested error, with a terminating search for the first such degree/precision. The exact initial B and B_t data hold for every candidate by construction.

The residual is tested on a finite t,x grid. The actual uniform C^2 candidate bound and explicit fixed coefficient derivatives give a finite Lipschitz bound L_E for Ebar0. Evaluate its values with certified rational intervals of width at most epsilon/8; use

`residual_upper=max_grid |Ebar0|_upper + L_E * mesh_diameter`.

This is a rational upper certificate, not an undecidable real equality test. A candidate passes only when that finite upper certificate is at most epsilon. The exact source witness and refinement of the Bernstein degree, rounding and test mesh guarantee a passing candidate. Near-threshold candidates may be conservatively rejected; that does not remove the witness or change the unique limit. The same procedure can include every additional source/metric equation and derivative bound.

## 4. Physical selection and implementation requirements

The source-relative admissible comparison class consists of the actually stocked realizations of these finite task-passing candidate codes, with the same source functions, initial data, output precision, horizon and return contract. It is not a claim that every conceivable architecture belongs to this class. On a finite stocked class the complete physical resource prices have a finite minimum; a certified epsilon-price selector is also sufficient, since **every** task-passing candidate already converges to the same geometry. A source may minimize its actual price without replacing that price by a formal residual objective.

This statement alone does not implement the selector. The common constructor must supply:

1. The finite code range, full native preparation and immutable mode/source records.
2. Actual propagation weights and capacity channels computed from that same candidate, including the smooth receipt floor.
3. Every candidate's complete initial stock, return and material-derivative ledger; no unpriced codebook or controller.
4. The finite selected-code algorithm or a declared direct finite many-body preparation permutation whose translation is defined by that terminating algorithm, with its whole support and description counted. Such a direct permutation is not an unbuilt running search circuit.
5. The residual/error perturbation caused by native source, clock and measurement approximations. The selector tolerance must include it.

The geometric constants depend only on the common regularity/ellipticity bounds, so the same mGH/Mosco/PI/direct-RCD proof applies to this selected sequence once its actual coefficient error is added. A prospective source-relative selector suffices; no global physical-architecture minimum is required. The common realization and the finite slab passage are separate parts of the construction (`construction/INDEXED_MASTER_CONSTRUCTION.md` and `geometry/slab/SLAB_NEUMANN_AND_SMOOTH_RECEIPT.md`).
