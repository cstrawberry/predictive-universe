# Exact native reusable-return adapter and boundary channel

## Result

The routing front end of the finite routing source used by the companion source construction (`refined_join/MASTER_CONSTRUCTION_THEOREM.md`) has an exact, same-factor and same-gate-count replacement implementing the MPU reusable full-context return channel of the PU paper, rather than only a formally matching binary reset. It preserves the dense capacity, the existing capacity-achieving message code, all full-native gate norm bounds, and the initial-domain generator expectation. This is a constructive component theorem. By itself it does not integrate the replacement into the common source, and it does not show that a mathematical carrier alone attains Definition 23 minimality.

The PU paper sources are the MPU register carrier and its reusable return channel, Definitions 23 and 27, and Appendix E, Remark E.2a.2.

## 1. Native operation and complete finite dilation

The MPU register carrier of the paper uses

    |m,p,c> = |M=m,P=p,I=c>,  m,p,c in {0,1}.

Its full reusable return channel is the one specified in the paper, not inferred from the reversible CNOT diagnostic:

    K_ready = sum_(m,p) |m,p,0><m,p,0|,
    K_phi   = sum_p |1-p,0,0><phi,p,1|,
    G(rho)  = K_ready rho K_ready* + sum_phi K_phi rho K_phi*.

The Kraus normalization is exactly I_8. On the committed subspace it performs the injective reflex step followed by the stated closure reset; it preserves the ready subspace as an identity channel.

Let A be one native eight-state factor initially in |0>. Define W_G by four disjoint transpositions, with all other basis vectors fixed:

    |phi,p,1>|0>  <-->  |1-p,0,0>|1+phi>,   phi,p in {0,1}.

In the native-64 basis 8(4m+2p+c)+a the pairs are

    (8,33), (24,1), (40,34), (56,2).

The eight prepared-domain columns are orthonormal. The displayed swaps specify a unitary on all 64 columns, including every noncode auxiliary input; W_G is real, self-adjoint and involutive. The auxiliary outcome 0 has Kraus operator K_ready, outcome 1 has K_0, outcome 2 has K_1, and the remaining auxiliary outcomes have zero Kraus operators on the initial state. Consequently, for every reference E,

    Tr_A [(W_G tensor I_E)(omega_XE tensor |0><0|_A)(W_G tensor I_E)]
       = (G tensor id_E)(omega_XE).

This is exact on every input and every reference. The identity holds exactly, over the integers, on all 64 matrix units; matrix-unit linearity then proves the reference extension without an empirical reference-dimension cutoff.

The auxiliary remains physically present and its full native pure-state resource cost is ln8 nats, not ln3. Its post-operation prepared-input support has dimension 3. It must not be released as an extra response output. This is a paid private-record export, not a claim of exact finite thermal erasure or a Landauer heat of ln2.

## 2. Drop-in compatibility with the finite routing source

The finite routing source supplies an arbitrary eight-state message factor, a pure native-8 private dump, degenerate bare Hamiltonians, and the two-factor gate PRIVATE_P_SWAP. Replace only that gate's complete 64-entry permutation by W_G and interpret the message bits as M,P,I. The routing B0,B1 bits are the native ready-output M,P bits; the low ready/termination bit is native I.

No additional factor, pure stock, gate slot or native arity is required. Both PRIVATE_P_SWAP and W_G are products of four disjoint transpositions on 64 basis states and have identical spectra. A legal positive generator is

    H_G = (pi hbar/(2 tau))(I-W_G).

It has four eigenvalues pi hbar/tau and 60 zero eigenvalues. Its exact gate evolution at tau is W_G. For any initial message rho and dump |0>, the compression of each of PRIVATE_P_SWAP and W_G to the prepared domain is the same ready projector. Thus

    Tr[H_G(rho tensor |0><0|)]
      = (pi hbar/(2 tau)) Pr_rho(I=1),

exactly equal to the PRIVATE_P_SWAP generator expectation with the same coefficient. This is an equality of the compressed operators, not just of their basis diagonals. The routing message/dump bare Hamiltonians are zero, so this substitution does not introduce a bare-energy-changing work-weight requirement. The common clock/controller and every other deployed term still need the source constructor's complete ledger; equal local norms alone are not a certificate for all other interactions.

The complete channels of PRIVATE_P_SWAP and W_G are not identical on arbitrary inputs, so the source with W_G is a distinct declared source. The two channels agree on the complete four-dimensional ready input algebra, including all coherences; this contains the existing capacity-achieving code. A source response record that states the full-input reset of PRIVATE_P_SWAP therefore does not describe the source with W_G and must be restated for it.

## 3. Full native capacity and finite routing composition

The whole retained output of G lies in the fixed four-dimensional subspace I=0. For n uses, including entangled inputs, the whole output lies in its n-fold tensor product. The HSW support bound therefore gives C(G)<=ln4. G is the identity on this complete four-dimensional subspace, so the four ready basis inputs attain ln4, and C(G)=2ln2.

This is the explicit extension allowed by Appendix E, Remark E.2a.2: any channel with the entire retained output confined to dimension d0/r has the same support bound. Dense saturation therefore meets the residual-budget branch of K.9.5e without falsely claiming the two-Kraus normal form. Indeed G has Choi rank 3, whereas a full-8 binary pure-reset normal form has Choi rank 2.

Keep the independent factory with input-independent probabilities q for pass, s for closed, and a for abort, where q+s+a=1. After G, pass preserves M,P; closed and abort export P to the private B1 dump and preserve only M, with their orthogonal termination sectors. The outcome maps are explicitly

    J_pass(rho)   = q V_pass G(rho) V_pass*,
    J_closed(rho) = s V_closed Tr_P[G(rho)] V_closed*,
    J_abort(rho)  = a V_abort Tr_P[G(rho)] V_abort*.

Here the fixed ready factor I=0 is suppressed in the displayed isometries. Each map is CP and the traces sum to Tr rho. For a fixed outcome sequence over n uses, the retained quantum support dimension is 4^(number of pass) 2^(number of nonpass). The outcome sequence is independent of the input. The flag-conditioned Holevo bound, including arbitrary entangled n-use encodings, is therefore n(1+q)ln2. Independent uniform ready-basis messages attain that value, because a pass reveals both bits and a nonpass reveals M only. Hence the exact regularized capacity is

    C(routing after G) = (1+q)ln2.

At finite deadline L, q=sum_(k=1)^L[(1-p)/2]^k, so the dense value is (2-2^(-L))ln2 and the sparse value is ln2. The finite deadline/calibration corrections of the routing source are unchanged. Composition with the actual independent species erasure/arrival instrument multiplies this capacity by its arrival probability; its full transfer/isometry and physical stress conditions are separate component certificates.

The committed-input restriction alone has capacity ln2: all |phi,p,1> outputs lie in the two-dimensional span of |0,0,0>,|1,0,0>. The dense 2ln2 statement uses the full registered native input domain, specifically its four ready encodings. Restricting all permitted encodings to committed snapshots would remove this saturation. That domain choice must remain explicit.

## 4. Complete receiver access after the replacement

For the tensor-reset front end of PRIVATE_P_SWAP, independence from the erased input factor can be checked by a simple Heisenberg algebra condition. That particular condition is not the right one for G: its registered committed branch can depend on the input low bit. The correct sufficient statement is an explicit CPTP factorization of the complete allowed receiver output through the displayed routing-after-G channel, tensor any input-independent exogenous readouts. This includes field, Ramsey, work and controller records if the receiver can access them. A private-dump record leaking elsewhere violates the statement even if the advertised message register alone passes.

The full common-history compiler can prove this by its actual register/control factorization. Scalar equality of the local gate energy or the presence of a degenerate bare message Hamiltonian alone is not sufficient to establish the complete access theorem. In particular, a bare externally observed pulse generator has expectation proportional to Pr(I=1); the source must not silently allow its energy record as an additional response channel. A unitary-history clock whose complete allowed field/controller outputs are input independent is one constructive route, with all of its energy counted.

## 5. What the construction supplies and what remains external

The construction literally supplies the registered MPU closure operation and a normalized finite instrument. Definition 27 permits this nominated instrument with explicit arming and a normalized perspective kernel; a singleton perspective is sufficient. Its Hilbert/Born/single-run interpretation and eventwise-stochasticity branch are not derived from merely tracing A.

The full-native support certificate supplies the precise residual-budget specialization of E.2a.2. No strict full-state refresh, thermal reset claim, capacity-trigger actualization meter, or separate global causality theorem is needed for this branch.

Definition 23 separates attained qualifying complexity from active dimension 8. The detailed witness behind the CSW-F4 result of Theorem 23f is not part of this construction. Therefore using actual qualified endpoint pairs or a tiled array is sufficient only with the following input/interface record:

1. The admitted qualifying task, comparison class, same-state MPU witness and the separate active eight-dimensional native carrier/factorization.
2. The response-faithful map from that carrier to the physical factors operated by W_G; its admissible preparation domain includes the four ready encodings when dense saturation is asserted.
3. An allowed nominated interaction/update mode implementing this instrument without silently changing the qualifying task or cost witness. Auxiliaries may implement that mode and remain fully costed without themselves becoming newly minimal MPUs.
4. The actual upstream geometry/density and port-to-area mapping, plus complete response access restrictions, common stock/control/stress costs, and finite errors.

These are exact external branch data and a finite physical interface requirement. They do not require the companion construction to optimize every auxiliary over all physical architectures. Conversely, citing the CSW-F4 result alone does not supply a same-carrier factorization or prove that this apparatus realizes that source class.

The conditional area/force substitution theorem applies once this interface and the actual common source are joined. This component constructs a literal native MPU return operation; no abstract P-factor operation is left unspecified.
