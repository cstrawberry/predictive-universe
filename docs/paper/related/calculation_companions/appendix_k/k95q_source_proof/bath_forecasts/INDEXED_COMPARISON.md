# All-j actual visibility, positive counts and selected response

## 1. Actual reference and finite-start convention

All times here are dimensionless H_Lambda time. The nominated dynamical bath normalization is kappa=1/(2pi), not9/2 and not the computation clock rate Jstar. Write B(q) for the ACTUAL fixed bank, F(q) for its selected continuum target, and h_B(q)=sqrt(1+exp(q)/B(q)). The actual bank has1/2<=B<=1. Its homogeneous field-limit hazard is Gamma_B(q)=kappa/(1+exp(q)), with0<Gamma_B<kappa<1/6. The scalar reference's coordinate label satisfies dt/du=1/[3h_B(2n-u)], so its full coordinate duration is <=3n/3=n.

Use sigma_B^0(q)=integral_q^(2n) kappa/[3(1+exp(v))h_B(v)] dv. This starts at zero at the physical supplied bath stock. If comparison to the dense-boundary selected curve is wanted, use sigma_ref(q)=sigma_F(2n)+sigma_B^0(q). Its finite-start offset is bounded by epsilon/27, epsilon=8^-n, by the actual bank/clock proof (`bath/ARRAY_AND_REGULATOR_PROOF.md`, section1). The regulator's dense-start omission term already includes this allowance. It is counted ONCE, not set to zero and not added twice.

Thus for every point in the actual full window

  0<=sigma_ref<=kappa*n+epsilon/27<n+1.

Since e<3, m_ref=exp(-sigma_ref)>3^(-(n+1))=:m_min. This proves the lower bound required by the count encoder; it is not inferred from an arbitrary finite quantum mean. The same proof applies to sigma_F itself using its own1/2<=F<=1 background. The estimate is intentionally loose. The all-j family has n=j+8>=9.

## 2. Actual source error ledger and positivity

Let E_reg be the regulator visibility bound of the actual retained bath member. It is exactly the sum given by its late-window plan:

  dense-start omission + lattice dispersion + finite volume
  +2 occupation-state-vector error +2 bright-gap-state-vector error.

The plan proves E_reg<epsilon/2 for the actual antiperiodic graph, occupation cutoff, positive gap and counterterm, on the entire[-n,2n] window. It is not a norm from a small finite-bath diagnostic. The source keeps every positive regulator energy and all native pads.

Let e_target be the actual target's error to the normalized finite Gaussian projection, <=epsilon/4096. It is a VECTOR error, so its contribution to a norm-one expectation is2 e_target. The actual state used in the compiler is the rational target itself. The target error appears only when comparing it to the ideal projected Gaussian used in the continuum limit. No uncontrolled floating eigensolver or “Gaussian enough” assertion is used.

Let E_alpha be the classical homogeneous bath error in the completed SAME-j positive formula graph. It is the actual nonzero-alpha conserved scalar-reference comparison, retained from the source's amplitude construction. It satisfies E_alpha<g with g=epsilon/4096=2^(-3n-12). It is not discarded because the forecast readout has a background label.

Let E_Q=H a1_bath+H^2 a2_bath use the SAME-j local bath coefficients a1_bath,a2_bath of that enlarged positive-clock/rest graph. A quantum coefficient computed without the enlarged clock/rest terms cannot replace them. For a simple additional sufficient condition choose

  H < epsilon/[16(1+a1_bath+a2_bath)], H<=1,

which gives E_Q<epsilon/16. The state stage's g*S/4 condition may be stronger; both conditions are imposed and neither replaces the other. These are fixed-index finite positive constants before H. The common cutoff predicates must also hold.

At every nominated time, and uniformly across the full finite interval, the norm-one readout comparison gives

  |m_actual(t)-m_ref(t)| <= E_source
       := E_reg+2 e_target+E_alpha+E_Q.

No numerical propagation error is part of the exact physical source. An implemented prediction adds its certified E_pred separately; digit rounding adds2^-p separately. If an earlier executed preparation or a changed preparation origin is asserted, add its actual state/visibility error E_preparation and actual origin-exposure modulus. Here the source instead starts from the explicitly supplied post-prepared stock at t=0; no claim is made about its physical preparation or about an unspecified earlier epoch. The finite bath's omitted dense start is already in E_reg, and the PCE's initial latency is retained below.

With the displayed allocations,

  E_source < (1/2+1/2048+1/16)epsilon+g < epsilon.

For all n>=9, epsilon <m_min/4. Consequently m_actual(t)>3m_min/4>0, including all times between cuts. It is also <=1 by ||Z||=1. This proves actual positive visibility despite Z having negative eigenvalues. The source's nominal expectation is a real visibility, not an event probability. The positive output codec does not supply this proof by clipping.

## 3. Numeral/count accuracy and non-saturation

The exact count codec uses s=8^n, p=64(n+1)^3, Dnum=2^p, M=[2(n+1)s]^3, h=ln(4/3)/s^3. The interval midpoint has radius at most1/(32Dnum), and nearest numerator rounding costs1/(2Dnum). Thus the unclipped rational error from the actual mean is less than1/Dnum. The clipping lower endpoint a_min/Dnum, a_min=ceil(Dnum*m_min/4), is at most m_min/2 for these p,n. Both the target m_ref and the proved actual mean lie above it. Upper clipping at1 is nonexpansive about either mean. Retain the actual exception bit; no exception is discarded as an impossible physical event.

Let r be the clipped rational. Then

  |r-m_ref|<=E_source+E_pred+2^-p,
  r>=m_min/4,
  |-ln r-sigma_ref|<=4(E_source+E_pred+2^-p)/m_min=:e_log.

The latter follows from the mean-value theorem for log on[m_min/4,1]. Do not claim an8^-n rate after this division: if E_source<=a_n8^-n then the contribution is12 a_n(3/8)^n. This tends to zero only when the actual coefficient sequence a_n has the required bound. Here E_source/epsilon is bounded by the displayed absolute constant for all j, so the uniform O((3/8)^n) exposure rate DOES hold. That rate is not O(8^-n); a prescribed 8^-j tolerance requires a stronger schedule or a cofinal reindexing.

The cap is inactive. From r>=3^(-(n+1))/4,

  -ln r <=(n+1)ln3+ln4 <2n+4.

Meanwhile M h=8(n+1)^3 ln(4/3)>2(n+1)^3>2n+4 for n>=1. The strict inequalities ln3<2, ln4<2, ln(4/3)>1/4 suffice. Therefore raw count c obeys c<M and

  c h <=-ln r <(c+1)h.

No exact-log comparison is used to compute c. The rational-power binary search decides ties exactly.

Let r_k be the raw counts emitted by the compiler and C_k=max_{j<=k} r_j the count produced by the ACTUAL running-max gates. Since sigma_ref is nondecreasing,

  |h C_k-sigma_ref(t_k)| <=e_log+h.

This is the sup-norm nonexpansiveness of running maximum around a monotone target. It does not assert monotonicity of m_actual or replace the physical reversible max operation. No derivative of the resulting staircase is taken.

## 4. Actual exposure modulus and real latency gaps

Let tau(t)=integral_0^t ell_star(zcl(s)) ds be the actual scalar-reference proper integral. The source proves1/2<=ell_star<=2, hence

  d sigma_ref/d tau = Gamma_B/ell_star <=2kappa<1/3.

This is an ACTUAL bound in the clock's proper coordinate, not a relabeling of the coordinate-time grid. Thus omega_ref(delta)<=delta/3. For the exact positive actual bath exposure Y_actual(t)=-ln m_actual(t), the same log comparison without numerical errors gives e_phys=4E_source/m_min and

  omega_Yactual(delta) <=2e_phys+delta/3.

This is a valid modulus bound for the actual source on the scalar proper clock. At fixed index its nonzero plateau2e_phys is retained; it is a useful comparison modulus, not a claim that it tends to zero as delta alone tends to zero. An ordinary continuity modulus is also available: ||dZ/dq||<=1/2 and the actual finite generator give

  |dY_actual/dtau| <=(8 B+6 h_background,max)/m_min,

using m_actual>=m_min/2. The background maximum is finite and source-computable; the rational bound h_background,max<=1+2*3^(2n) follows from B>=1/2, q<=2n and exp(2n)<3^(2n). The minimum of this linear bound and2e_phys+delta/3 is a genuine vanishing-at-zero modulus. The comparison bound is preferable for an eventual diagonal because B scales with the actual generator and cannot be ignored.

Use exactly the source checkpoint map:

  initial selector/selected/trial preparation: checkpoint3;
  slot k pair completion: checkpoint5+2k;
  final pair: checkpoint E-2;
  terminal records: checkpoint E;
  E=2K+5.

The true proper gaps are delta_init=3Tref/E, delta_pair=2Tref/E, delta_final=2Tref/E. Charge omega_Yactual of EACH applicable gap when transporting actual exposure. In particular the conservative finite sum is

  E_latency_actual <=6e_phys+7Tref/(3E),

or use the sharper minimum modulus for any gap. The reference-only sum is7Tref/(3E), and Tref<=2t_end<=2n, so it is <=14n/(3E) for this member. These are not zero and are not silently identified with uniform coordinate cuts. The exact supplied bath has m_actual(0)=1 and Y_actual(0)=0; the selected response module begins only after checkpoint3. Its origin mismatch is the first of these terms, not a free removal of the first three gates. The dense-start correction in section1 remains separate from this actual initialization latency.

Counts used by a pair are prospective values for its COMPLETION checkpoint. They are not values measured when the earlier lookup gate fires. No claim is made that a changing physical module equals a frozen count staircase at all intervening instants. The theorem below concerns the nominated completed-prefix cuts and their controlled exposure interpolation. A stronger unmeasured continuous-time process or repeated measurement instrument needs its own clock/record theorem.

## 5. Exact selected prefix law and the non-norm-one meter factor

The selected catalog chooses exactly zero refresh bias. The same actual occupancy stock has x>0 with x^(s^3)=3/4. After C completed activated ranks its exact normalized sign mean is m_selected=x^C, hence u_selected=1-exp(-hC). This is a statement about the separate paid selected-refresh module. It does not identify a bath expectation with a Bernoulli probability, dark population or a hidden bath jump record.

On a protected clock shell the actual full source has one completed prefix, and its BQ/data covariance gives exactly that data law. Source BQ state, scalar rest and shell probability are independent of the trial program and forecast VALUES of the fixed stock format. Outside the shell the actual histories remain present.

The physical PCE meter value `meter(L)=1-sqrt(N)(1-2L/N)` has range[1-sqrt(N),1+sqrt(N)] on the actual reachable data support. This support statement matters: an arbitrary native code could decode above N. Here every selected initial sign and refresh outcome is binary, each meter field starts at0, the running-max activation intervals are disjoint, and each rank meter is written at most once by the actual `meter` gate with a count in0..N. Every partial prefix therefore has all meter values in0..N, including prefixes outside the protected shell. Bare factorization and the full history V keep the actual state in the span of those prefixes. A different full-native decoder must use its own norm; the bound is not asserted on unreachable invalid codes. Therefore a checkpoint with wrong-shell probability f has unconditional mean error at most2sqrt(N) f, NOT2f. The actual clock bound is

  f<=2^[-16(n+1)^2]+H a1_clock+H^2 a2_clock.

For an additional chosen mean allowance eta_meter, impose

  H < eta_meter/[8 sqrt(N)(1+a1_clock+a2_clock)], H<=1,
  2sqrt(N)2^[-16(n+1)^2] < eta_meter/2.

For all n>=9, sqrt(N)=8^(4n)=2^(12n), so 2sqrt(N)2^[-16(n+1)^2]<epsilon/2. Indeed the ratio to epsilon is 2^[1+15n-16(n+1)^2], decreasing for n>=9. Choose eta_meter=epsilon. These thresholds are finite and strictly positive; take their conjunction with the actual state/bath source predicates before J and D. The state stage's unscaled failure<epsilon/4 alone would NOT prove an epsilon mean bound for this meter. At the exact terminal endpoint the reference failure term is zero; keep the same conservative bound if desired.

At each completed pair cut,

  |E[u_meter]-[1-exp(-sigma_ref(t_k))]|
      <=e_log+h+2sqrt(N) f_k.

For a direct comparison with the same actual bath, add e_phys to the right side: |h C_k-Y_actual(t_k)|<=e_log+h+e_phys, hence the selected response differs from1-m_actual(t_k) by at most e_log+h+e_phys+2sqrt(N)f_k. The extra term is necessary because the actual finite bath need not be monotone and the physical running maximum is real. This uses the1-Lipschitz property of1-exp(-y) for y>=0. It is an unconditional expectation statement with actual failure included, not postselection. A per-cut bound uniform in k does not assert a simultaneous nondisturbing multi-time measurement history; no unsupported union/joint instrument claim is made.

To compare to the selected source coefficient, let delta_B be the actual bank's certified C0 error (its C2 certificate also bounds C0) and W=3n. The bank/background proof gives

  |[1-exp(-sigma_ref(q))]-(1/B(q)-1)| <=(4+W/18)delta_B,

with the dense initial offset already included in sigma_ref. Equivalently one may choose sigma_B^0 and add the finite-start defect explicitly once. Therefore the selected meter/coefficient discrepancy adds the actual bank term, count/log error, real latency transport when changing cuts, and2sqrt(N)f. Force calibration, area, capacity, formation/return work and normalized small-signal errors remain separate source obligations, not hidden in this visibility calculation.

## 6. Full adaptive U_resp and finite terminal term retained

This compiler changes the fixed exogenous exposure/count stock, not the surrounding actual causal trial-ROM class. The comparator still includes every finite past-addressed truth table and every admissible adaptive/cross-stream strategy. The owner's admissibility predicate is nonnegative u at every cut; it does not impose u<=1. The selected zero-bias program is one member, not a restriction of all candidates. Overshooting u>1 remains allowed.

For each finite hazard horizon S, write alpha=1-u-u'. The actual causal conditional-entropy argument gives the quadratic action I_S=1/2 integral_0^S alpha^2, with no independence assertion about feedback-controlled streams. For I_S<=C,

  |u(y+delta)-u(y)| <=(1+sqrt(C))delta+sqrt(2C delta).

Indeed m=1-u=e^-y+exp-kernel*alpha gives |m|<=1+sqrt(C), and integration of m'=alpha-m yields the bound. This modulus transports bounded-action trajectories under the exposure error above without differentiating a staircase and without excluding negative m or u>1.

The full domain is u(0)=0, u>=0, u-1 andu' in L2(0,infinity). Bounded controls, barrier-preserving truncation, downward grid rounding and zero-control continuation provide the retained recovery class. The uniform all-j transport and horizon-exhaustion statement is proved in sections7-8 below; it does not add a restriction u<=1.

The finite terminal term is NOT dropped. With u(0)=0,

  I_S+1/2 = 1/2 integral_0^S [(u')^2+(u-1)^2] dy
             +1/2 [u(S)-1]^2.

The common initial biased-sign formation debit tends to1/2 and remains in the ledger; at finite N it is the actual N D(Ber((1+1/sqrt(N))/2)||Ber(1/2)) with its known finite correction. A zero-control continuation after S has zero further I-action but has bulk tail energy [u(S)-1]^2/2. The displayed endpoint term is exactly that tail, not a dispensable constant. Nothing in forecasting supplies a free reset, a purifier, a return operation or a zero preparation charge.

## 7. Uniform indexed convergence, horizon exhaustion and same-source independence

Every quantity in sections1-6 is indexed by the genuine j, n=j+8. The
bounds and raw target come from this j's active bath, continuous source and
root, not a fixed example or an n9 input. Regulator E_reg<epsilon/2 and target vector
error<=epsilon/4096 are the retained same-j late-window constructor bounds.
The actual alpha is selected by the family amplitude rule with bath reference
goal epsilon/4096. The source thresholds of section2 make E_Q<epsilon/16. Consequently
E_source<epsilon uniformly in j, and the elementary ratio

  epsilon/m_min=3(3/8)^n

is decreasing and <1/4 for all n>=9. This proves actual positive visibility
at EVERY time across the entire growing interval, not just at a finite list.
The source remains a finite actual nonmonotone quantum bath.

The additional H predicates, the bath quantum threshold and the full-u
scaled clock threshold, are literal nodes appended to the completed same-j
state formula. Choose H=8^(-2k), k>=2, strictly below
the minimum of these and the existing state predicates. Each operand is
strictly positive and finite before H, so searching k=2,3,... terminates.
Keep all state common-J conditions and choose the smallest power8 D only
AFTER that J. The finite compiler approximation changes no physical source
and adds no independent late geometric cutoff.

Let d_n=2^(-p), h_n=ln(4/3)/8^(3n), and

  ephys_n=4 E_source/m_min,
  elog_n=4(E_source+2^(-p-4)+d_n)/m_min,
  b_n=2sqrt(N)[2^[-16(n+1)^2]+H a1_clock+H^2 a2_clock].

The choices above give b_n<epsilon. Since 2^(-p)=o(8^-n),

  ephys_n=O((3/8)^n), elog_n=O((3/8)^n),
  h_n=O(8^-3n), b_n=O(8^-n),
  latency_ref<=14n/(3(2*8^(2n)+5))->0.

For all completed pair cuts SIMULTANEOUSLY as deterministic mathematical
inequalities (not a joint measurement instrument),

  |h_n C_k-sigma_ref(t_k)|<=elog_n+h_n,
  |E u_meter(t_k)-(1-m_actual(t_k))|
       <=elog_n+h_n+ephys_n+b_n.

Including the three applicable real latency gaps adds at most
6ephys_n+14n/(3E). Thus the direct actual-bath error is bounded by
elog_n+h_n+7ephys_n+b_n+14n/(3E), tending to zero. The reference/coefficient
comparison adds (4+n/6)delta_B, where the same-j bank tolerance and its
certified error obey delta_B<=epsilon/[4096(1+3n)]. No hidden coefficient
sequence grows through the logarithm. These are uniform growing-window
bounds with explicit constants, not merely fixed-j convergence.

The reference horizons exhaust [0,infinity). On q in[-n,0], B>=1/2 implies
h_B<=sqrt3 and 1+exp(q)<=2. Therefore

  sigma_B^0(-n)>=kappa*n/(6sqrt3)>n/84.

The earlier q>0 contribution and dense-start offset are nonnegative. The
last pair lies 2Tref/E before the endpoint in the actual proper clock, so
its exposure is >=n/84-2Tref/(3E). The count horizon differs by at most
elog_n+h_n and the actual exposure by at most ephys_n. All therefore tend
to infinity. Upper bounds alone would not prove this conclusion.

The factorization is K_BQ tensor I_data before the complete fixed history
conjugation. Initial BQ, all proper cuts, K_BQ and forecasts depend on j,k,d
and its physical format, not on candidate trial values. Every finite
past-addressed causal trial word, including adaptive cross-stream words,
therefore sees the same exogenous count history and same clock-shell
probabilities. Nothing substitutes statistical independence of adaptive
marks. The actual physical max is retained, and direct nonmonotone-bath
comparison explicitly pays ephys_n. The fixed physical format and source
are common to candidates; this is not a uniform full-native norm or free
formation/return theorem.

## 8. Full U_resp transport, causal liminf and recovery

Use the complete paid finite truth-table grammar of the indexed
host. At rank exposure mesh h_n the exact stream recursion is
m_(r+1)=exp(-h_n)m_r+(1-exp(-h_n))alpha_r. The initial mean normalization is
m_0=1. The conditional chain rule for required initial/fresh/old/exogenous
records and Pinsker give, for ALL causal/adaptive/cross-stream candidates,

  I_discrete >= [(1-exp(-h_n))/h_n] * (1/2 integral alpha^2),
  1-h_n/2 <= (1-exp(-h_n))/h_n <= 1.

The effective alpha here is the conditional aggregate mean control. Jensen
is conditional and averaged; no independence of feedback streams is used.
The exact exponential interpolation is monotone between its endpoints, so
admissible u>=0 at every rank cut gives u>=0 throughout. A candidate is not
made admissible merely because its raw ROM exists; surrounding words that
produce u<0 remain outside the owner's admissible class. No upper constraint
u<=1 is added.

On any finite S and bounded I_S<=C the modulus from section6 is uniform:

  omega_C(delta)=(1+sqrt(C))*delta+sqrt(2C*delta).

The actual count/reference/latency discrepancies in section7 tend to zero.
Composing endpoint interpolants with these approximate exposure coordinates
therefore changes their responses by at most omega_C of that discrepancy.
Clock-shell means add b_n. This is the correct transport statement; no
physical count staircase is differentiated. Because horizons tend to
infinity, every fixed S is eventually covered. Compactness of convolution
m=e^-y+integral_0^y e^[-(y-v)]alpha(v)dv on bounded L2 balls gives compactness
in C([0,S]); weak L2 lower semicontinuity proves the full adaptive local
liminf and exhaustion gives the infinite-horizon lower bound.

Here are quantitative recovery parameters of the SAME declared family:
A_n=n+1, N_n=8^(8n), bias-grid spacing
Delta_n=2A_n/(B_n-1)=8^(-2n), and h_n->0. Clip an arbitrary owner's control
alpha=1-u-u' to [-A_n,A_n] with upper reflection m<=1. For the effective
reflected control alpha_n, its square is no greater than the clipped
square and

  sup|m_n-m| <= ||clip_(A_n)(alpha)-alpha||_2/sqrt2,
  ||m_n-m||_2 <= ||clip_(A_n)(alpha)-alpha||_2.

The right sides tend to zero without any assumed target-dependent rate.
On each rank interval take the exponentially weighted average, which
reproduces the target endpoint and obeys weighted Jensen. Round alpha
downward to the declared bias grid, preserving u>=0. Its sup response
error is <=Delta_n and its action increment on horizon S is at most
Delta_n*sqrt(S)*||alpha_n||_2+S*Delta_n^2/2. The exact binary divergence
series gives additional cost at most

  S*A_n^4/[12*N_n*(1-A_n^2/N_n)].

The actual final exposure is S_n<n+1+o(1), so all these errors vanish along
this single fixed family, not a separate secretly retuned family for each
u. Append alpha=0 after the last included rank. This continuation has zero
further I action, is nonnegative even for overshooting u>1, and has bulk
tail energy (u(S_n)-1)^2/2. Combined with clipping, interval averaging and
horizon exhaustion, it recovers every u with u(0)=0,u>=0,u-1,u' in L2.

The exact finite identity remains

  I_S+1/2 = 1/2 integral_0^S [(u')^2+(u-1)^2]dy
               +1/2*(u(S)-1)^2.

Initial biased-sign formation is the actual finite
N*D(Ber((1+1/sqrt(N))/2)||Ber(1/2)), not a freely dropped debit. It lies between1/2 and1/2+1/[12N(1-1/N)] by the exact binary divergence series and tends to
1/2; the finite correction and any physical work/return prices remain in
the work ledger. For an admissible infinite-domain u, u-1 in H1(0,infinity)
implies its endpoint tends to zero, so the half-square survives correctly
under the exhaustion limit. The unique zero-I response is u=1-exp(-y),
while different unused ROM values may encode the same response. This
response functional statement is not a claim that every physical
source-price correction in the full objective of Theorem K.9.5q is proved here.

## 9. Scope

This construction defines all the numeral sequences by a single complete,
quantitative total finite mathematical algorithm for all j>=1; none has
been numerically evaluated. It supplies actual source binding, literal
native input-word installation, uniform positive visibility, count, real
latency and selected-response convergence and preserves the full adaptive
U_resp/half-square domain.

The full force/area/capacity/work/normalized-signal/resource schedule is a
separate part of the full conjunction (`conjunction/CONJUNCTION_THEOREM.md`).
No manufacturing, internal engine, physical universal compiler, extra
tomography, microscopic locality or executed runtime gate is added. The
boundary of the construction is the paid supplied stock and the declared
mathematical boundary instrument. No empirical input is used.
