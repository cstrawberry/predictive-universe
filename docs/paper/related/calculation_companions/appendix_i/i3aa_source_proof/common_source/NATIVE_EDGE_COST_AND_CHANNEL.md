# Actual native edge cost and channel component

This component supplies a response-faithful Definition35 edge primitive. It is not the complete source or geometry/stress join.

## Operator, state and access

An isolated edge has five native-eight factors `(S,R,A,W,F)`: sender, receiver, private dump, paying stock and required receipt. Its communication input is arbitrary on S and a reference. Initialize `(R,A,W,F)=(0,0,1,0)`. Their exact full-native pure-stock formation information is `4 ln8`. All four factors and all future controller factors remain physically counted; communication input is a declared boundary input, not silently prepared by this stock.

Run three explicit native permutations: the public full reusable native return `W_G` on `(S,A)`, SWAP `(S,R)`, and SWAP `(W,F)`. The 64-state `W_G` swaps are `(8,33),(24,1),(40,34),(56,2)`, identity elsewhere. Its channel is the same public full-input native G proved in `return_adapter/NATIVE_RETURN_ADAPTER_PROOF.md`, not a reset-specific two-Kraus substitution. All 64 sender matrix units are checked directly here, so the receiver equality holds with every reference.

Only R is the retained communication algebra. S, A, W, F, source records and controller outputs are not writable extra receiver channels. F is retained under the resource-return task, not exposed as a payload-dependent communication output; its value is input independent. The dump is inaccessible to the receiver but stays in the full resource/source ledger.

The actual output is supported on the four ready codes `0,2,4,6`, and G fixes them. Therefore arbitrary n-use inputs have output support dimension at most `4^n`; the uniform ready code attains `ln4` per use. This proves regularized capacity `ln4`, not a claim that a finite-block decoder has been executed.

## Hamiltonian and physical edge representative

The native algebra accepts **any declared positive computable coefficient w**. The `1+|s|/R` examples in the code are only a flat auxiliary demonstration, not the curved coefficient.

The actual curved family supplies x=ell_g(edge)/rho and the smooth floor

`w=(1+x+sqrt((x-1)^2+epsilon_n^2))/2`, with epsilon_n>0 tending to zero.

It differs from `max(1,x)` by at most epsilon_n/2, has first derivative between zero and one, and has second derivative at most 1/(2epsilon_n). Thus the finite metric error vanishes while the actual material derivative exists even at x=1. All coefficient/derivative norms belong to the common source ledger. The curved slab constructor (`geometry/slab/slab_family.py`) supplies this precise coefficient oracle; the integrated source must bind that oracle, not the flat demonstration. The ideal max metric remains a geometric comparison, not a differentiable physical receipt Hamiltonian.

Fix an energy unit theta>0. W and F have identical full-native Hamiltonian `H=theta*w*diag(0,1,...,7)`. The sender, receiver and private dump have zero payload Hamiltonian plus optional counted state-independent rest. Every gate conserves the entire target/stock/receipt Hamiltonian on all native codes, not only the active inputs. This is exhaustively checked on `8^5=32768` columns.

For the registered cost ensemble, S is a uniform ready code. The exact completed word is

`(s,0,0,1,0) -> (0,s,0,0,1)`.

The returned paying stock changes from energy `theta*w` to zero; the required receipt gains exactly that energy. The full work and information accounting therefore has debit `theta*w` on this fixed communication task, apart from the explicitly separate common construction/controller baseline. No private random record is erased in this ready ensemble. Receiver information is moved from the sender rather than duplicated. Unused edge banks and the same auxiliary pure stocks are returned under the same constraints, so they cancel only where they literally return.

The dimensionless representative is this actual required finite transfer-budget debit divided by theta. Definition35 permits a representative incorporating the finite transfer budget; its displayed entropy/capacity expression is only one possible calibrated representative. We do not identify this energy receipt with heat divided by temperature, assert a positive Landauer entropy floor on the ready ensemble, or equate latency with capacity. If a thermal-reset or full-state-refresh interpretation is wanted, that is an additional operation/ledger and is not claimed here.

The full-input native channel remains G. Its return price on nonready inputs need not equal the ready-code price, and it is not used to define this particular edge-cost task.

## Finite implementation and metric robustness

Each gate is an involution with positive generator proportional to `I-U`. A finite clock/controller implementing the whole required word must be added and priced in the common source. Finite word-clock constructions provide an applicable method, but this note does not count those factors; they are counted with the global word of the common source.

If the complete implemented peredge ready price is bounded uniformly by `(1-epsilon)theta*w` and `(1+epsilon)theta*w` after its common declared baseline, the resulting shortest-path metrics satisfy exactly

`(1-epsilon)d_n <= d_n_actual <= (1+epsilon)d_n`.

This follows by summing the edge inequalities along every finite path and then taking the infimum. It avoids multiplying a vanishing peredge relative error by an unbounded number of hops. A certified additive absolute error can be converted to this bound because `w>=1`. The common source must supply this uniform physical price bound; the exact three-gate algebra supplies the ideal primitive, not an autonomous network controller.

The discrete latency/rate/entropy tuple remains separately registered. The native8 factors at graph vertices require the prospective qualification task and immutable challenge-access contract; auxiliary stocks are not automatically additional MPU vertices or extra propagation edges.

## Checks

`native_edge_source.py` gives total full-native forward/inverse, exact channel matrix-unit and rational interval coefficient oracles. `NATIVE_EDGE_CHECKS.json` records all 32768 inverse/energy checks and all 64 matrix-unit comparisons, with zero residual. The square-root interval uses integer arithmetic only and converges at any requested precision.
