# Source-relative Definition 23 qualification and counted endpoint integration

## Result and scope

This construction gives a source-relative qualifying task with an attained minimum program length of **3 bits**, an independent predictive-carrier lower bound of **8 dimensions**, a counted realization on the existing two endpoint factors, and a total indexed direct port/area family. It does not identify this task with the CSW-F4 witness of Theorem 23f.

The two endpoint keys are factors 564 and 711. The source adds 26 native-eight factors: 22 task environment/work factors, two private trained-model archives, one temporary message holder, and one immutable boundary-mode label. Their initial resource ledger is 20 pure factors and six uniform-eight factors. The complete word has 350 entries, including one actual propagation interval. At the worked error budget the source has 785 core factors and 70 additional clock factors, hence 855 physical native-eight factors. Exactly **two**, not 855, are certified predictive keys.

Two interface modes are physically distinguished. Mode 0 preserves the original finite-deadline routing and its finite-L calibration. Mode 1 supplies an exact ideal native G transfer with capacity ln4. Mode 1 is a separately nominated instrument, **not** a recalibration of the inherited field coefficient.

The finite task records of Sections 2–4 (task gates, full response tables, program census and dimension checks) are computed by `qualifying_port_proof.py` in this folder, which builds on `qualifying_port/native_qualifying_port.py`. Its results are in `QUALIFYING_PORT_CERTIFICATE.json` and `QUALIFYING_PORT_FULL_RESPONSE_TABLES.json`.

## 1. Sources used

The source-derived cost, spatial clock, rate, direction selection and calibration belong to the companion source construction in `refined_join/MASTER_CONSTRUCTION_THEOREM.md`. The CSW-F4 result of Theorem 23f remains a separate upstream input; no concrete CSW-F4 witness is supplied here.

Definition 23 separates an attained qualifying program-complexity minimum from the context/dimension result, and reserves Corollary 3 for a separate complexity-capacity bridge. The finite census results stated after Definition 23 do not make a chosen decoder physically exhaustive among all architectures.

The native return and support route are in `return_adapter/NATIVE_RETURN_ADAPTER_PROOF.md`. The Appendix E support and whole-retained-output conditions are E.2a.0a and Remarks E.2a.1–3. The area ledger and separate entropy/calibration requirements are E.6.3 and Remark E.6.3.1.

These conditions leave the conditional port adapter for the CSW-F4 task available as a separate route. They do not allow this XOR task to be substituted for the CSW-F4 task.

## 2. Independently registered finite task

Sample theta, X0 and X1 independently and uniformly from {0,...,7}. Set Y0=X0 xor theta and Y1=X1 xor theta. The predictor begins with a ready-zero native key, predicts the training output, receives Y0, constructs its error, updates the key, and predicts Y1 from the produced key and X1. The score is the externally evaluated probability of prediction equal to X1 xor theta. Its random baseline is 1/8 and the declared margin is 13/16, giving threshold 15/16.

The first four source gates generating Y0 and Y1 are **unconditional for all eight native mode codes**. Candidate programs never own the truth oracle or scorer. Truth generation is therefore not mode-controlled; mode-controlled truth generation could allow noncode modes to spoof their local truth register.

The mode is a deterministic program label fixed before the source samples theta and either context. No training or inference gate writes it. In particular, being marginally independent of theta is not sufficient: a label related to theta through a context or a jointly readable reference is forbidden unless that full joint memory is counted. A universal preparation must obey this typed restriction too.

The fixed operation class has:

1. Read-only, environment-owned theta, contexts and truth registers.
2. Training reads of X0 and Y0 through the nominated observation/feedback ports.
3. A challenge read interface consisting of the full counted predictive carrier, the fresh X1, and the immutable source-independent program label.
4. A future-prediction output, scored before the later error-based update.
5. No causal challenge-time read from training records, errors, key dumps, private archives, another endpoint, or a readable controller reference outside the counted carrier.

Finite universal descriptions may add memory and operations, but every jointly challenge-accessible theta-dependent factor is included in their carrier dimension and complete preparation. Only fixed product fresh ancillary states are free of this memory count. The physical stock and energy of those ancillas are still paid.

The same-state cut is after the **first ten** task gates. In the Python trace this is `trace[9]`, namely trace position 10 under one-based indexing. The remaining five gates evaluate this state and update after scoring. The baseline ultimately learns theta from the future error, but its challenge score is still 1/8. Using its final key marginal would be the wrong state.

The exact full response tables contain 4,096 cases, covering all eight modes and all 512 source triples. They verify truth integrity and mode immutability everywhere. On the six registered task modes the scores are:

- Full loop: 1.
- No update, observation-null, feedback-null, and inference-null: 1/8 each.
- Trained low-two-bit key: 1/2.

Noncode modes 6 and 7 also score 1/8 against the independent truth. Each of the 15 gates is an explicitly extended reversible native permutation, verified on all 512 of its native columns, totaling 7,680 involution checks.

## 3. Exact source-relative program minimum

Fix the physical reference, the task, the common cut, the declared operation class, and one prefix interpreter **before** comparison. Its special descriptions are:

- 0: no-update preparation.
- 10: trained low-two-bit preparation.
- 110: full-loop preparation.
- 111p: a valid, nonempty program p for one fixed universal prefix machine, producing an admitted finite preparation.

All other strings are invalid. The three special words and the universal branch form a prefix-free presentation. Universality has the usual additive overhead; it does not entail deciding the halting problem. Every word in the universal branch has length at least four.

Define C_P as the minimum admitted description length producing the **complete conditional source/model preparation at the common cut**, including its environmental correlations. The predictive state is specified relative to the declared task, not by its unconditioned native marginal. The full-loop key marginal is uniform; that marginal alone cannot express the learned association with theta. The source prior and reference contain no free learned association.

All 15 binary words of length at most three are enumerated. The only qualifying description is 110. Every description shorter than three is invalid or gives one of the two nonqualifying preparations. Description 110 gives the qualifying preparation. Thus the qualifying set is nonempty, its infimum is attained, and

    C_op = C_P(mu_*) = 3 bits = 3 ln2 nats.

No long universal description can lower this minimum. Duplicate longer descriptions do not affect it. No proof of uniqueness of the qualifying state, no global hardware optimum, and no natural-machine invariance of the numerical value three is asserted. The special prefix presentation is a deliberately registered **source-relative** complexity convention. The fixed interpreter is an algorithmic reference for this description length; C_P is not being equated to its physical workspace, gate count, energy, or thermodynamic cost. The actual finite built-in preparation has its physical mode registers, stock and autonomous controller counted in this construction (Sections 6–8). Additional universal realizations must carry their own finite physical resource declarations.

The same argument applies to the actual clock-produced preparations if their complete task process errors are uniformly smaller than 1/16. The actual 110 preparation still scores above threshold, while the shorter baseline and low-two-bit preparations remain below it. This is a minimum over the admitted implemented source class, not attribution of an ideal score to a different physical state.

## 4. Independent active-carrier dimension theorem

Let M be the entire jointly challenge-readable theta-dependent memory of an admitted comparator, of Hilbert dimension d. For a fixed context x, absorb the fixed fresh product ancillas and immutable program label into a POVM {M_theta^x} on M. Write rho_theta for its conditional memory states. Since each rho_theta is positive with trace one, rho_theta <= I. Therefore

    Pr[correct | X1=x]
      = (1/8) sum_theta Tr(M_theta^x rho_theta)
      <= (1/8) sum_theta Tr(M_theta^x)
      = d/8.

Averaging over x leaves the bound unchanged. This proof works for arbitrary mixed encodings and arbitrary quantum inference channels. It does not assume classical basis storage. Any extra quantum reference entangled with the model is part of M; it is not an independent fresh ancilla.

Hence d<=7 implies score<=7/8<15/16. The full loop achieves score one with rho_theta=|theta><theta| and reaches every one of the eight basis states with probability 1/8. It saturates the lower bound at d=8. The computational basis factorization theta=4M+2P+I is an explicit unitary identification with three binary roles.

`qualifying_port_proof.py` also checks the elementary counterexample R uniform, S=R xor theta. Both individual marginals are theta-independent, but the joint pair decodes theta perfectly. Such a pair must be counted jointly. Mere marginal independence of a clock, label, dump or reference does not make it free side information.

For a physical implementation whose **complete reference-stable task process** differs from an admitted ideal process by at most epsilon, event probabilities differ by at most epsilon. Uniformly over the small-carrier comparison class,

    score_small <= 7/8 + epsilon,
    score_full >= 1 - epsilon.

Every epsilon<1/16 leaves threshold 15/16 strictly between these bounds. A private imperfect controller is not assumed to preserve the ideal causal cut exactly; any extra actual influence must lie within this full process bound. An unbounded controller leakage is outside the proved comparison class. Local state-marginal errors are insufficient.

The numerical identities 3 bits=ln8 and d=8 do **not** prove Corollary 3, K0=3, the (O1)–(O3)/(FC) context conditions, or an information/thermodynamic bridge.

## 5. Finite score versus persistent viability

Perfect performance on this finite challenge is permitted by the registered qualifying threshold. It does not satisfy a strict operational band alpha<PP<beta<=1. No positive noise, long-time viability, response-law anchor, self-reference theorem, or stable adaptation dynamics has been inferred from this finite task. Those are separate inputs wherever they are required. This construction therefore makes a Definition 23 task-relative attainment claim, not an Axiom 3 persistent-viability claim.

## 6. Literal two-endpoint insertion

The existing source begins with an arbitrary message on sender 564 and ready-zero receiver 711. Each endpoint receives its own eleven other task factors. Their theta and context samples are independent. The 34-gate prefix added to the existing source is:

1. SWAP sender 564 with the fresh private message holder.
2. Run the first ten task gates at each endpoint. The common pre-challenge cut is now after 21 prefix gates.
3. Run the final five task gates at each endpoint, score externally, and retain the post-feedback keys.
4. SWAP each trained key into its fresh private model archive, leaving both keys ready-zero.
5. SWAP the original message back from its holder to sender 564.

For any source branch and any arbitrary message/reference state, this prefix is exactly

    rho_old_source_and_message -> rho_old_source_and_message tensor sigma_training,

where sigma_training contains the correlated task records and archived keys, is independent of the message, and the temporary holder is zero. This is a unitary identity, not erasure. Disjoint endpoint task blocks prove the joint extension; literal SWAP identities prove all message matrix units, including reference-entangled inputs. On the task side the identity is finite and can be confirmed exhaustively on the 512 task inputs at each endpoint, at the common cut and at the return.

Then the complete inherited history runs on the original factors. The only extension is an added immutable boundary-mode factor controlling the three post-G nonpass erasure/flag operations. For mode 0 these operations are exactly the originals; for any nonzero mode they are identity. All other gates are unchanged. The two registered modes are 0 and 1; the remaining mode sectors have a specified unitary extension and are not admitted message inputs.

The key state that qualifies is the pre-challenge state. The later message encodings and G interaction are operations of the same physical carrier in a separately nominated mode. They are **not** claimed to be the same predictive state or to give every arbitrary message density minimum complexity.

## 7. Native G and the separate ready interaction mode

Let P_0 project onto the four states |M,P,I=0>. The actual native return has Kraus operators

    K_0=P_0,
    K_phi=sum_p |1-p,0,0><phi,p,1|,  phi=0,1.

Their adjoint products sum to I. Their ranges lie in P_0, so every output has support in a fixed four-dimensional subspace. The channel is identity on the complete ready algebra. The four orthogonal ready encodings therefore give a zero-error code of size four. The n-fold output support has dimension 4^n, including entangled input blocks, giving the converse. Consequently C(G)=ln4. Restricting all inputs to the committed I=1 sector gives only ln2.

The physical dilation uses the paid private native-eight factor 565 and four exact transpositions. It is the dilation of `return_adapter/NATIVE_RETURN_ADAPTER_PROOF.md`, Section 1, which is exact on all 64 native dilation columns and all 64 channel matrix units. No thermal pure reset, strict full-state contraction, or intrinsic stochasticity is inferred from tracing this private factor.

In boundary mode 1, the three subsequent nonpass loss/flag operations are skipped on every native column. The normal X-to-Y SWAP, actual species encoder, physical stationary propagation and actual decoder still run. On the one-particle invariant sector the propagation is K_space tensor I_species. Encoder and decoder are genuine code/species swaps. Thus the delivered code is exactly G at ideal registered times, for every reference-entangled input. Factory flags and field/force/Ramsey records are independent of the message and can be appended by an output-only channel; discarding them recovers G. The whole **response quotient** is therefore support-four and capacity ln4. Independent exogenous records are not falsely claimed to be pure or to have literal physical support one.

Mode 0 remains the original routing channel. At dense p=0 and L=2 its ideal capacity is (2-2^-2)ln2=7ln2/4, not ln4. The existing field and reference setter uses precisely this mode-0 value. Mode 1 does not change that setter and supplies no same-mode area/force equality by itself.

## 8. One counted autonomous source

The inherited adaptive core is extended by 26 epsilon N_cloud0 I, epsilon=10^-20, with the same explicitly normalized cloud0 mass profile and its full derivative. It has no state-dependent hidden key energy. All 785 core factors and all their positions are retained.

The positive finite clock is recomputed for the longer word. With W_k the complete desired prefix and a the tick immediately before propagation, use

    H0=W_a^* H_pair W_a,
    V_k=W_k exp(i H0 k tau),
    A=V(I tensor H0)V*, B=V(C tensor I)V*,
    H_actual=A+S B S,

where C is the positive finite Fourier clock and S=sqrt(N_clock) is its actual field-lapse congruence. The clock's full native complement is a nonnegative scalar, decoupled and initially empty. Its pure stock, norm, mass profile, positions, elapsed time and field derivatives are counted. The exact propagation coefficient is g=pi/(sqrt2 T), with T=F tau recomputed for the longer word.

The matrix-entry definition is a finite controlled-unitary sum and finite matrix functional calculus on the full native space. It does not require materializing its exponentially large matrix. It gives a complete correlated state exp(-itH_actual) rho_initial exp(itH_actual), not separate desired marginals. The supplied ordinary gate and initial-density functions are total finite oracles. Computable-real coefficient evaluation remains governed by the inherited certified smooth-family contract.

The implemented clock satisfies the explicit Duhamel process estimate 3 eta ||C|| t_end. Every error allocation is rational. Fixed pre/post primitives have no field dependence. During propagation the phase cancels exactly in V_k. Outside that interval V_k has the form U_fixed exp(iH0 s tau) with 0<=s<=G, where G=349 counts the non-free gates, not the enormous free-interval clock length. Hence ||V'_k||<=G tau M_H and ||B'||<=16 G M_H. This explains the full material bound (1+16G)M_H used here; no factor proportional to the huge free duration has been silently dropped. Separate guarded-window error bounds are retained.

The apparatus has a conservative dense all-factor clock support hyperedge. It does not retain the inherited graph's 152 crossings. No conclusion about independent channel count follows from this hyperedge or its clique projection.

## 9. An actual indexed endpoint/area family

For every positive integer m, define N_m=m^2 modules. Each module is a literal full copy of the counted word, task factors, private stock, field block and newly allocated clock. There is no shared or unlisted factory, memory, controller, energy stock, or field variable. Its exact Hamiltonian is the Kronecker sum of the module Hamiltonians; its initial source state is the tensor product of the module source states with an arbitrary possibly entangled joint message input. The family has total global-ID, factor, gate, position, initial-density-entry and Hamiltonian-entry reduction oracles.

Fix D=4*10^8 in the inherited physical coordinate units. The midpoint of the two original endpoint keys is (245/24,121/12,10). Translate this midpoint to ((i+1/2)D,(j+1/2)D,0) for 0<=i,j<m. All module factor positions lie in their distinct x-y cells. The paired keys lie on opposite sides of z=0 and their segment meets the face at the cell center. Define the registered face as [0,mD]^2 at z=0. Then

    A_m=m^2 D^2,  N_m=m^2,  N_m/A_m=1/D^2 exactly.

There are N_m independently writable native sender factors and N_m readable delivered codes. The count follows from their tensor input/output algebras and reference-stable channel factorization, not graph edges. Every private auxiliary is explicitly indexed and excluded only from the declared response algebra, never from physical mass/resource counts.

Only the 2N_m qualified keys are used in a qualified-MPU spacing statistic. Their within-pair squared distance is 11/48. Because D is much larger, each endpoint's paired key is its unique nearest qualified neighbor for every m, so their mean nearest-neighbor spacing is sqrt(11/48). This is **not** the face pitch D. Neither is it a spacing obtained by counting 855 physical factors as MPUs. No Theorem E.3 isotropic-density/degree hypothesis has been silently inferred from either number.

Set epsilon_m=1/(1000m) and allocate epsilon_m/N_m to each module. The actual clock takes only a strict part of that allowance; any numerical coefficient/synthesis error must be put inside the remainder before claiming a numerical implementation. Tensor-channel telescoping proves a complete joint reference-stable error at most epsilon_m, even for entangled messages. Source-norm error budgets are divided over modules as well. Clock counts can grow with m, but source positions remain inside their fixed cells.

In ready mode the explicit product code sends 4^N_m messages with zero ideal error. The same installed code has actual block error at most epsilon_m. Fano gives

    I(W;W_hat) >= N_m ln4 - h2(epsilon_m) - epsilon_m N_m ln4.

Therefore its reliable-information/area ratio tends to ln4/D^2. For a matching upper limit, the admitted per-module receiver algebra has a fixed finite dimension D_out independent of m (a loose bound is 2*8^785; the clock and added private records are not outputs). The standard conditional-entropy telescoping proof gives, for half-diamond distance delta between block channels,

    |C_actual-C_ideal| <= 4 delta ln(D_out^N_m)
                          +2(1+delta)h2(delta/(1+delta)).

To see the dimension dependence, replace one use at a time in an arbitrary n-use ensemble. The untouched output marginal is unchanged. Write the change in Holevo information as the difference of two conditional entropies with the changed output as the finite-dimensional system. Apply the conditional-entropy continuity bound twice, sum the n replacements, optimize and divide by n. The input reference or private apparatus dimension never appears. With delta<=epsilon_m, dividing by N_m and then by D^2 makes the error vanish. Thus the actual capacity per area has the same limit.

The displayed code is a reliable-information saturation result. Its identification with k_B-weighted thermodynamic response entropy is the separately declared entropy-saturating additive ledger branch of E.6. It is not a heat, horizon, Born, or measured-Newton-G theorem.

## 10. Exact remaining assumptions and nonclaims

1. **Separate Definition 23 branch:** The task, program presentation, operational access cut and same-carrier interaction modes are taken as a source-relative Definition 23 branch of their own. They are not CSW-F4. If a genuine CSW-F4 witness is supplied, the conditional port adapter for it remains a separate valid route.
2. **No Corollary 3 bridge:** The context/reflexivity conditions, complexity-capacity bridge and persistent viability have not been derived. The finite task proves exactly the separate minimum and dimension statements above.
3. **Independent field blocks:** The indexed family is a concrete product source with separate finite field blocks. Promoting it to one interacting/self-consistent universal field is additional source construction, not a consequence of indexing or translation.
4. **Geometry and setter:** For this actual pitch D, the operational area coefficient is C/D^2 and G_boundary=D^2 c^3/(4 hbar C). The inherited finite-L setter uses nominal unit area, so its G_force is not equal to this indexed value. Mode 1 also changes C from 7ln2/4 to ln4 without changing that setter. A same-mode physical setter/binding/source/geometry recalibration is required before claiming equality.
5. **Isotropic Appendix E area branch:** The direct interface count is exact. It is not a proof of the separate isotropic MPU geometry of Appendix E or of the horizon interpretation. If those are required rather than a direct registered boundary family, their hypotheses need an actual map.
6. **Cost and refinement:** The source is counted and positive; that alone does not prove the general P/u operator-compression/cost profile or the common field at all resolutions. Those are separate requirements of the companion construction in `refined_join/MASTER_CONSTRUCTION_THEOREM.md`.
7. **Exact source versus numerical implementation:** The mathematical Hamiltonians use exact rational/computable-real coefficients. The clock perturbation is bounded exactly. An independently rounded numerical synthesis can use this bound only together with its own additional error allocation.

The finite computations are constructive evidence for the statements above, within the stated scope. They do not by themselves establish the complete companion construction.
