# Actual capacity volume and separate operation modes

This is a native channel component of the source, not the whole source construction.

## Nominated volume channel

At a vertex of the registered operational geometry, let its positive scale factor be a(x), with 1/3<=a<=3. Fix q(x)=a(x)^3/27 before communication input. An independent native flag Z has the actual diagonal state `(1-q)|0><0|+q|1><1|`. The code supplies three pure ready native factors R,A,B. S is the arbitrary communication input, possibly entangled with a reference.

Execute native G on S,A and transfer its output to R, then swap R with the private ready factor B iff Z=0. Release only R,Z. The resulting channel is exactly

`E_q(rho) = q G(rho) tensor |1><1| + (1-q) tr(rho) |0,0><0,0|`.

The full-native permutation is explicit for every code, not just registered 0/1 flags. The ready factors and mixed flag have formation information `4 ln8-H2(q)` relative to the full native reference, before adding any controller. Private B may contain the erased payload; it is retained physically and excluded from receiver access, so there is no free deletion or extra receiver channel.

Conditional on success the actual output support is four-dimensional; on failure it is one-dimensional. The flags are input independent. For any n uses, condition on the actual independent flag sequence and bound retained information by the log of the product of these supports. This gives the regularized unassisted upper bound `n q ln4`, including entangled inputs across uses. Uniform independent ready-code messages attain it. Thus `C(E_q)=q ln4` exactly.

For a cell with coordinate volume v_h, the declared calibrated channel-capacity measure is

`m_h(x)=27 v_h C(E_q)/ln4=v_h a(x)^3`.

This is the actual capacity of a finite source, not the volume element merely attached as metadata. On the curved operational metric `g_E=dt^2+a^2(dx^2+dy^2+dz^2)`, its Riemann limit is the Hausdorff volume. Under physical rescaling by ell, multiply the measure by ell^4, and distinguish normalized domain averages from this unnormalized Hausdorff measure.

## Mode and access discipline

The volume channel is nominated at a fixed immutable source mode before input encoding. Qualification, reliable native G edge propagation, and this flagged volume channel are distinct declared uses of the same typed native keys. Their capacities are not unioned into one larger hypothetical receiver operation set. In particular, one must not report `q ln4` if the receiver is simultaneously authorized to bypass the erasure gate via the other mode.

Every finite source must carry the actual mode/controller/flag stocks, not an inferred switch. Keys used for communication may have been qualified on the registered earlier training task; private training material does not become a challenge-time side channel. Mode changes between episodes have their own complete word and cost. The geometry family can consume the nominated volume measure while retaining the distinct actual edge latency/capacity/entropy tuple of Definition35a.

## Checks and scope

`native_capacity_measure.py` verifies all `8^5=32768` native columns and 128 exact sender matrix units. It checks arbitrary-reference channel equality, input-independent flags and four exact probability/measure examples. The independent probability q is computable from the same operational metric coefficients as the source and geometry; a finite coefficient approximation must carry its resulting capacity/measure error.

The whole source additionally requires one full joint source density, inventory and operation registry integrating these modes; the complete controller/source derivative ledger; selected curved graph geometry and its metric-energy certificates; and the actual predictive matter action/congruence/observable join. None of those is inferred from these local tests.
