# Correlated terminal failures: exact information and spatial reliable coding

## 1. Scope and actual access map

This construction uses the protected joint-access source and the bounded-bath/prospective-array source of `bath/ARRAY_AND_REGULATOR_PROOF.md`. An all-lanes-DONE sufficient condition is not needed: a mean-failed-fraction coding theorem suffices. The construction neither supplies a covariance/locality proof for a different Hamiltonian nor discards any geometric mode.

There are N actual qualified links, with four ready native inputs 0,2,4,6 per link. All their task/qualifier stocks, purifiers, private dumps, programs and clocks are counted by the inherited source. The independent fresh factory stocks use the prospectively certified rational parameter u_i in [0,1] and depth L_i. Their pass probabilities are

p_i = sum_(r=1)^L_i ((1-u_i)/2)^r.

F_i is the pass bit and D_i is the ACTUAL terminal-DONE bit. Every unfinished lane emits a fixed abort output. D may be arbitrarily correlated across links, with F, and with the common quantum geometry. It is independent of the message/reference. Let Z include the complete public input-independent source/factory/terminal records and all allowed earlier geometric probe records. Write B for the remaining allowed quantum geometry/source output. The sufficient complete receiver channel is

`Phi(rho_XR) = direct_sum_z p_z sigma_B,z tensor [(tensor_i Lambda_(D_i,F_i)) tensor id_R](rho_XR)`.

Lambda_(1,1) is the actual native ready-four routing channel, with output support dimension4; Lambda_(1,0) retains one ready bit, support dimension2; Lambda_(0,F) traces that input and emits a fixed abort, support dimension1. The actual unchanged full-native G and dump maps define Lambda on all eight input levels, not just on ready words. All success and failure outcomes are retained. The expression is a reference-extended map identity, not common geometry marginals.

One physical sufficient source condition is the exact full-history covariance

H_actual = V (H_bare,BQ tensor I_payload-and-factory-work) V*,
V = sum_q |q><q| tensor product_i U_i,q_i,

on the actual invariant clock sector, with the complete stocked state, every allowed earlier probe interaction and material/current variation included in that identity. U_i,q_i are the literal fixed local prefixes. At q_i=G_i they equal the complete word. Trace of the protected clock removes q!=q' terms. Tracing all unfinished-lane data/dumps removes its entire local prefix by unitary invariance of partial trace, including on entangled inputs. Completed prefixes give the actual routed channel. The common conditional B block can remain quantum and entangled across lanes.

If factory preparation is inside the prefix, its full completed Householder acts on independent ready factory stocks, and H_bare is identity on those factors. Then the completed factory law is the product law and independent of the bare clock blocks; a latent product F extension on failed branches is mathematically legitimate because these branches output only abort. This extension is NOT an accessible unfinished factory measurement or a free new record. Sum its hidden failed-branch labels into the conditional common state before forming the actual accessible entropy baseline; do not append their inaccessible Shannon entropy as if it were a public record. More general sources may correlate F and D, but must provide an actual common coupling with the stated joint product marginal of F. Correct one-bit marginals alone do not suffice.

### Literal release boundary

The inherited 48+d word swaps into its outY/outF buffers before its last clock site. Those buffers remain protected INTERNAL data until the q_i=G_i access cut. They are not already exposed communication outputs. The four-operation terminal dilation is: test actual DONE into a ready public flag; conditionally swap the two buffers into ready external registers; copy the flag into a retained private record. This is the protected joint-access instrument with the actual one-clock predicate substituted. The full native predicate rejects padding, zero-clock and multi-clock configurations. Failure does not postselect or discard a run.

The map may be the explicitly declared communication input/output instrument, with encoder/decoder outside the source task boundary. If implemented as additional internal hardware, its four ready native records plus one positive native8 terminal controller PER LINK, controller/source norm and energy, clock freeze or finite-window noncommutation error, local collection/readout latency and support must be counted. The 48+d word does not contain those extra ready registers by implication. Alternatively the master can provide a literal integrated instrument with an equivalent census. No free reset/latch is asserted here.

Private clock coherences, routing dumps, unfinished buffers and purifiers must actually be excluded/protected by the declared cut. Earlier geometric/radiation probes must be included in B under the same covariance, not forgotten at the final time. An extra writable geometric mode is an additional sender input unless separately excluded by the actual task's allowed operations. The theorem is not inferred from slow cones, no-refund valuation, zero mean stress, or the name “private.”

## 2. Exact finite-block Holevo and entropy identity

Define K(z)=sum_i D_i(1+F_i), the number of released ready bits. Conditional support dimension is 2^K. For any ensemble of possibly entangled native inputs, conditioning on input-independent z and appending sigma_B,z gives

chi(Phi) <= ln(2) E K.

Uniform independent ready-four input symbols attain equality in every branch: their released bits are uniform and independent, and conditional individual codeword outputs are pure basis words. Thus

chi_block = ln(2) E K,
S(B,Z,Y)_uniform-ready - S(B,Z) = ln(2) E K.

This is the response entropy increment over the already paid complete accessible source/record baseline. It is not total closed-system entropy, not entropy after crediting private purifiers, and not a reset heat theorem. It uses the stated tensor conditional state, not channel factorization alone with an unproved baseline spectrum. The same dimension proof covers entangled encodings over the declared map's tensor powers. Its mathematical regularized classical capacity is chi_block per block if those tensor powers are the defined communication model. A physical unreset common geometry is NOT thereby a tensor-power source.

Correlated D needs no independence assumption for this exact identity. Nor does F need independence for this identity. Constant all-block outage with probability c>0 is a counterexample to inferring single-spatial-family vanishing-error rate chi_block/N from it: every M-message code has error at least c(1-1/M).

## 3. Spatial coding from mean failure, without all-DONE

Now assume the JOINT marginal law of (F_1,...,F_N) is product Bernoulli(p_i), inherited from actual independent fresh factory stocks at the fixed prospective program. D-F independence is NOT assumed. Put

mu = N + sum_i p_i,
Lfail = sum_i (1-D_i),
delta_bar = E Lfail/N.

Pointwise K >= N+sum_i F_i - 2 Lfail. For any a,t>0, Hoeffding on the product F law and Markov on Lfail give

Pr[K < mu-N(a+2t)] <= exp(-2Na^2) + delta_bar/t.                 (1)

This proof does not union-bound individual failures. It remains useful when Pr(any failure)=1.

For any integer k>=0 and real b>=0 satisfying k <= mu-N(a+2t)-b, there exists a fixed binary linear ready-code encoder with k information bits and average message error

Perr <= exp(-2Na^2) + delta_bar/t + 2^(-b).                    (2)

Proof: draw a 2N-by-k binary generator matrix uniformly, once, independently of the source. Given the revealed received-coordinate set of size K, a nonzero message difference maps to zero on those rows with probability 2^-K. A union bound over the 2^k-1 differences bounds rank failure by min(1,2^(k-K)). Unique linear decoding succeeds whenever the received submatrix has full rank. Split at K>=k+b, then average over the actual message-independent pattern law. Averaging over the chosen generator gives a deterministic generator achieving the bound. The physical pattern law is not replaced by a code-dependent law. The ready native encoding/decoding differs from this bit description only by its known fixed relabeling. Unsuccessful decoding is retained, not postselected.

If the actual pattern law is within total variation eta_F of such a product-marginal coupling, add eta_F to (1)-(2). If the complete actual receiver channel is within HALF diamond distance eta_access of the certified protected channel, add eta_access to decoding error. One-lane error estimates do not establish this whole-block eta_access; the exact whole-source covariance is the preferred input. Do not multiply an average completion error by N and call that the required physical diagonal.

For example choose a=N^-1/4, t=sqrt(delta_bar)+N^-1/4 and b=ceil(sqrt(N)). Then as N->infinity and delta_bar->0, the per-link bit-rate tends to mu/N, with error at most exp(-2sqrt(N))+sqrt(delta_bar)+2^-ceil(sqrt(N)), plus any genuine eta_F and eta_access. Rounding costs at most1/N. The guaranteed rate loss is at most3N^-1/4+2sqrt(delta_bar)+N^-1/2+2/N. No all-DONE trace-distance approximation is used.

This is a mathematical communication-code boundary. Executing a selected generator/decoder/collector inside the physical apparatus requires its literal matrix/program, work, stock, permitted signal transport and latency. Existence of a decoder is not hardware or a new instantaneous collection network. The same-source operational entropy coefficient is realized by the actual uniform ready-code state independently of that optional internal implementation.

## 4. Exact finite mean-capacity and area/force error variables

Let u0 in[0,1] be the selected ideal clock value at this cut, C0=2ln2, A0=4G0 C0=ln2/(pi F0), and G0=1/(8pi F0). The fixed physical A0 and unit dictionary do not vary with index, H, u0, or L. For possibly different certified local programs, define

epsilon_u = (1/N) sum_i |u_i-u0|,
epsilon_L = (1/N) sum_i 2^-L_i,
e = 2 epsilon_u + epsilon_L + 2 delta_bar,
Cbar = chi_block/N = (ln2/N) E K.

The factory marginal and fixed-abort contract give, without any D-F independence,

Cbar >= (1-delta_bar)ln2,
|Cbar-C0/(1+u0)| <= ln2 e.                                   (3)

An expected parameter error may replace epsilon_u if the actual completed factory marginal is the corresponding mixture, but this does NOT provide the product-marginal concentration in section3. The normative prospective driver is deterministic at each registered cut.

Let Abar be the SAME registered physical induced-area census per qualified link, with |Abar/A0-1|<=epsilon_A. It is not a comoving pitch, not the area of all auxiliary stock, and not an independent fit. Include the actual guard gaps, removed cells, border/qualification density and any registration collar in the numerator if they belong to the declared environmental-cell census; summing only smaller held port faces does not silently prove the area of a contiguous patch. For example four removed cells in an m-by-m patch change its effective area per remaining link by the factor m^2/(m^2-4). If supplied as an expectation/operator or guarded-probability certificate, state that valuation explicitly; keep outside-domain, compression, preparation and finite-window errors. Conditioning on a good area result is not free: its failed branches remain in the source/output law, e.g. an actual global area guard can be absorbed into D with its failure probability added to delta_bar. Replacing an expectation area by a sharply observed area requires the corresponding concentration/cut statement.

For delta_bar<1, define Gop=Abar/(4Cbar). Then

|Gop/G0-(1+u0)| <= 2(e+epsilon_A)/(1-delta_bar).               (4)

Let ygeo=F0/F_actual, |ygeo-(1+u0)|<=epsilon_y and |Gmeasured/G0-ygeo|<=epsilon_force for the same physical weak-probe source/cut. Then

|Gop-Gmeasured|/G0 <= 2(e+epsilon_A)/(1-delta_bar)
                    +epsilon_y+epsilon_force.               (5)

Do not double-count the same bank-clock mismatch in both epsilon_u and epsilon_y. A convenient master convention is u0=ygeo-1 (on the selected [0,1] branch), epsilon_y=0, and put the bank-clock, finite bath, target preparation, prediction/rounding and coupled-history errors in epsilon_u. Alternatively use the ideal clock value u0 and a separate epsilon_y. Raw half-trace memory error gamma contributes at most2gamma to epsilon_u for the norm1 Z observable; an already certified direct u error is not doubled. Clamping is1-Lipschitz. All this concerns selected deployment, not a restriction of the full competing-u response/PCE class.

For a separately implemented approximate access channel, section2's exact chi and entropy equality apply only to its certified reference channel. Do not claim exact equality from a small channel norm. The physical reliable-code error changes by at most eta_access. Any desired finite approximate-Holevo/entropy correction needs its actual finite output-dimension continuity budget, including geometry, or a sharper source-specific argument.

## 5. Actual local area and position interface

The private-cell convention of `bath/ARRAY_AND_REGULATOR_PROOF.md` (section3) has tangent(y,z) words and normalx words. All center labels have x=0. For a local geometry coefficient alpha=Avol+zeta*cos(k xcenter)-Acut, the local held-coordinate decoder is

x_word = xcenter + exp(-Acut) D h (word-center_code),

componentwise in the fixed local frame. W(alpha) targets h(word-center_code) approximately c exp(-alpha). Thus actual coordinate offsets are D c exp[-Avol-zeta*cos(k xcenter)], not D c exp[-alpha] with a missing reference scale. At xcenter=0, alpha=Avol+zeta-Acut. The canonical row is(1,1,0,0), so order-p l1 Fourier moments gain at most2^p and order-r parameter jets at most2^r; the constant shift changes only Fourier phase. The induced metric on a planar tangent(y,z) face at normal x is exp[2Avol+2zeta*cos(kx)] times its coordinate area. The residual local factor is exp[2zeta(cos(kx)-1)]; keep its actual local spatial/profile bound, finite word error and geometry domain probability. The index's fixed proper D, actual k and kD are independent.

In particular, use |alpha|<=1/4; the homogeneous |Avol|<=1/4 bound is not applied on the master's whole [-2n/3,n/3] orbit. Write h=2^(-3n-10), guard=4h, beta=2h exp(1/4), and |zeta|<=zmax=8^-n/1024. Since |cos(kx)-1|<=2, every prepared finite position outcome on the local domain satisfies

(1-2guard-beta)^2 exp(-4zmax) <= A_cell/D^2
                                            <= (1-2guard+beta)^2 exp(4zmax).

Exact rational evaluation gives its relative error<8^-n/16 for registered n=1,2,3,4. For general n the bounds h=8^-n/1024, beta<3h and exp(4zmax)<=1+8zmax imply an explicit conservative error<32h=8^-n/32, since (1-5h)^2 exp(4h)<=1 and 1-(1-11h)^2 exp(-4h)<=26h. The first follows from log(1-5h)<=-5h; the second uses exp(-4h)>=1-4h. All h here are at most1/8192. Thus the displayed weaker8^-n/16 bound holds at every n>=1. Here zmax=h. Local small-kD estimates can sharpen this uniform bound, but are not silently substituted.

Each registered cut has its own fixed Acut/reference decoder and a prepared domain certificate, including actual time-window drift and probes. A finite family of prospective fresh port stocks or a paid actual transition can cover growing windows. A single unchanged stock is not claimed to remain in |alpha|<=1/4 throughout the whole cosmological orbit. The scalar shift moves the global derivative-tail interval from[-10,12+3n] to[Acut-10,Acut+12+3n] along Avol+zeta, without changing its length or Fourier magnitudes.

The actual material/reference center map, lapse, shift, current and volume-form variations remain in the source. This decoder is a source interface, not a new uncharged coordinate marker. Constant reference Acut introduces no new dynamical derivative; a genuinely moving material-reference map does. Prospective placement, rod preparation, retained completed clocks, holding connections and local release timing remain paid. Bath-memory worldlines stay geodesic/comoving and are not moved onto accelerated rods by this convention.
