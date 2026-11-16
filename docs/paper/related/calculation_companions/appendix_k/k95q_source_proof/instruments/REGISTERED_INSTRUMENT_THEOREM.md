# Three separate actual boundary instruments and their source tariffs

This document defines the boundary instruments of the path-augmented registered-cut source and their tariffs. It does not construct an internal detector or perform an execution at actual size. Its active source is CartesianPathSource(CutPCESource) of path_module/PATH_SOURCE_THEOREM.md. The full completion, forecasts, rest rprime and native census of that source are mandatory.

## 1. One source, three uses and two different undressings

For every admitted finite (j,c,k,d), n=j+8, -n<=c<=n rational, use the literal source constructor, exact supplied initial state and the completion path_completion. Let Dp comprise all added PCE/path data; A is everything else, including four-mode finite geometry, the full host and the full global PCE clock. The exact full-native factorization is

Kphys = T (K_Aprime tensor I_Dp) T*,   rho(t)=T[rho_A(t) tensor rho_Dp(P,pi,b)]T*,
T=W_D Vprime,   rho_A(t)=exp(-it K_Aprime)rho_A0 exp(it K_Aprime).

K_Aprime is BARE with respect to Vprime. It still contains the receiver history. The physical primitive entry method already includes Vprime: either complete that physical primitive and then hold once, or complete the bare primitive and apply T once. Never do both. Physical Hamiltonian is H Kphys; dimensionless coordinate t corresponds to physical time t/H.

The separate receiver use ends at t_c=coordinate_time(src,2n-c); Ramsey and PCE use t_T=coordinate_time(src,3n). These are actual source-owned coordinate integrals, not t=(2n-c)/3 or a fraction of the total proper time. Source programs compute their certified final-width enclosures. All three start from the same specified source-family preparation boundary. They are not one sequential measurement run. No earlier receiver intervention is assumed to preserve a later unmeasured evolution.

For receiver analysis only, further undo its exact history Vrec. On the actual invariant prepared sector S,

K_Aprime = Vrec (K_C tensor I_X) Vrec*,
rho_A(t)=Vrec [tau_C(t) tensor rho_X] Vrec*.

X denotes protected payload/factory/work data, with the admitted arm-occupancy sector; C retains all geometry, private rods, receiver clocks, bath, Ramsey and global PCE clock. Arbitrarily entangled communication input/reference is allowed in rho_XR. The initial private task/source purifiers remain part of X, never new accessible outputs. Vrec is controlled by the entire receiver-clock tuple. The scalar profiles and node diagonals commute with it; the guarded all-lane source transforms covariantly, not by a false commuting-guard assertion. Normalized word products, unique seven-root, entire chi, Weyl/AW quantization and the same P_D preserve this identity. The PCE/path rest/clock reads no X factor. Vprime acts on the other clock/data and W_D on geometry/private rods, commuting with Vrec and its clock projectors. This transports the exact identity of receiver/CORRELATED_DONE_TRANSPORT.md to the root of the augmented source, rather than importing a numerical K of the base source.

**Support qualification:** the identity on X is not a global assertion on all native states. The safe value of the cut union source and the receiver parts of the receiver/Ramsey source give digit-dependent positive safe terms for invalid receiver-clock words. The actual one-hot-clock, one-arm, ready-word/media/private-rod sector is invariant before and after root/completion/holding. All actual pre-instrument states lie in its held image. The maps below are defined on EVERY native word, but common receiver-exchange claims concern this actual supported family, with every allowed payload/reference. Invalid sectors stay in the physical census and full Gibbs trace.

## 2. Full native Ramsey instrument and the exact source chain

Use the existing three native8 Ramsey factors (clock,internal,pointer) of the union, index64c+8u+p. The source chain is:

- The module installation cut_modules uses CutRamseyEntries as its actual Ramsey atom; its entry and boundary_entry are those of AmbientRamseyEntries, unchanged.
- The ambient Ramsey matrix source uses the coefficient rows of the receiver/Ramsey source.
- Those rows use the exact internal entries in Q(i,sqrt3), which give the native Ramsey prefixes, clock, physical ZE/ZS and pointer pad.
- The native Ramsey components give the RECORD, not the conserved internal multipole: Z_E=I8 tensor I8 tensor diag(1,-1,1,-1,0,0,0,0).
- The exact calibration data and the completed signal theorem select O=-s_ref Z_E, with s_ref in {-1,+1} the bulk reference sign of the source's amplitude-clock module. This is the full-window electric record whose mean is compared to the actual Qsig, not its lower bound S.

Define R_a diagonal on all512 states by R_a(c,u,p;c',u',p')=delta_cc' delta_uu' delta_pp' 1[-s_ref z(p)=a], a in {-1,0,+1}. Tensor identity on every other factor and all geometric indices. Its two nonzero-value projectors each have rank128, and its zero-value projector rank256. Which128 projector has oriented label+1 is determined by s_ref. The zero sector is NOT discarded even when the initial invariant ready block gives it zero probability.

At t_T the actual source map is D_R(rho)=sum_a R_a rho R_a. The flagged output is sum_a |a><a|_f tensor R_a rho R_a, with the source retained. It is spectrally isometric to D_R(rho), because R_a have orthogonal ranges. The flag is counted once. These R_a commute with Vprime, Vrec and W_D, since their supports are disjoint. They do NOT need to commute with Kphys or with the source's physical ZE multipole. In fact the exact clock/record source has nonzero entries between different pointer-value sectors; a zero energy exchange is not inferred. No endpoint canonical momentum transformation is silently applied to this already-nominated record observable.

The signed exchange is

DeltaE_R = H Tr_A K_Aprime[D_R(rho_A(t_T))-rho_A(t_T)].

It is independent of P, pi and forecast values. Further receiver undressing also makes it independent of the arbitrary communication input on the supported family. The whole flagged entropy increase equals S(D_R(rho_A))-S(rho_A), lies in[0,ln3], and has the same candidate independence. It is not plus the Shannon entropy of the three outcomes a second time. This protocol receives NO PCE response-stock credit.

## 3. Actual PCE DONE/ABORT instrument and return boundary

Let q be the global PCE clock value on the full 8^width(G+1) global-clock space. The terminal threshold is q_fin=last nonidentity edge+1. In the actual cut global clock the last stage is terminal trial, with length N; its last nearest_radius gate is a nonidentity full-native permutation. Hence q_fin=placement(E-1).start+length. The path edges0,1,2 occur strictly before every base stage, so this threshold is unchanged. All q>=q_fin, including q>G native pads, have the same complete history Ufinprime=D012 tensor Uresponse. The projector is P=1[q>=q_fin]; Q=I-P. This is distinct from each receiver's one-hot final-site predicate.

At t_T set D_P(rho)=P rho P+Q rho Q. Retain the explicit orthogonal DONE/ABORT flag. In the single-undressed frame P is A-only and commutes with T. Therefore

DeltaE_P=H Tr_A K_Aprime[D_P(rho_A(t_T))-rho_A(t_T)],
DeltaS_P=S(D_P(rho_A(t_T)))-S(rho_A(t_T)) in[0,ln2].

Both are common at fixed source format/count. The complete unnormalized DONE block, including clock coherences, is P rho_A P tensor Ufinprime rho_Dp Ufinprime*. The proved conditional-stock induction therefore supplies exactly p Rtrial(pi), p=Tr(P rho_A). The only credited roles are original trial initial_bias_stock and bias_stock, with their required complete conditional records. This is access to stock in its proved conditional state, not physical source deletion, reset, a clock latch or a free quench. No new instrument is applied to incomplete ABORT output; its stock stays paid. Path labels, three path output digits, pure path program, selected response copy, all other apparatus/data/ROM and inaccessible purifiers receive no credit. Reading the already-classical complete path records on DONE changes no state.

## 4. Receiver lift: literal maps, unchanged reference-extended access, common exchange

For lane i take the actual native proper_clock indices from the local factor layout of the indexed array. Let q=(q_i)_i be the COMPLETE tuple of these words, not just their DONE bits. Define Q_q to fix exactly these clock digits and act as identity elsewhere. They partition the entire full-native Hilbert space, including zero-, multi-, and padded-clock words. Let D_C(rho)=sum_q Q_q rho Q_q.

The four-operation terminal native permutation Urel is the exact four-operation terminal dilation of receiver/CORRELATED_DONE_CAPACITY.md with internal buffers lane[19],lane[20], and ready boundary labels(halt,outY,outF,private_halt) per lane. On every native word d_i=1 iff the final proper-clock digit is1 and EVERY earlier digit is0. Perform halt XOR d_i; if d_i then swap internal19/outY and20/outF; finally private_halt XOR halt. Its inverse applies these operations in reverse order. All digits0..7 are defined; invalid words fail. Geometry, clocks, arms, private rods, all other lane digits, bath, Ramsey and every PCE/path factor are spectators. Boundary labels start0000.

The nominated lifted receiver output is the FULL joint state

Omega_rec=Urel[D_C(rho(t_c)) tensor |0000...><0000...|_ext]Urel*,
E_rec(rho)=Tr_ext Omega_rec.

This equation declares a mathematical external instrument/dilation, not four extra internal physical records and a free controller. An internal realization would require its actual stock, source, work, support and latency and is not supplied here. No private clock-value record is exposed. The retained source clock itself carries the orthogonal q label after pinching; an optional redundant inaccessible flag has the same spectrum and adds no Shannon entropy. The physical source remains retained; the partial trace here defines its marginal energy, not destruction of external outputs.

The accessible output is the SAME original T_d P_s algebra: released payload/route flags and actual DONE flags, the allowed quantum geometry and earlier probe records, and only the originally admitted public source/factory records. Routing dumps, training archives, payload holder, source clocks, unfinished internal buffers, private flag copies and purifiers remain inaccessible. Added PCE/path data do not become receiver outputs. In particular an unfinished lane emits fixed abort; its latent completed factory label is summed out, not appended as an accessible Shannon label. No all-lanes-DONE conditioning is made.

**Channel equality on all clock tuples:** Urel leaves the complete private q unchanged. In a matrix unit Q_q rho Q_r with q!=r, tracing the private clock in the original accessible channel gives zero, regardless of source, geometry, input/reference coherences or padding. For q=r, inserting D_C changes nothing. Thus the accessible channel of Omega_rec equals the original channel EXACTLY for every source input, including arbitrary reference extensions and native tuples. On actual states it is the established correlated-DONE channel, including its fixed abort branches. This equality concerns accessible restriction; it is not physical erasure of the excluded source factors.

**Energy after release:** define B=W_D Vprime(K_C tensor I_Dp)Vprime*W_D*, so on the supported family Kphys=Vrec(B tensor I_X)Vrec*. For each supported complete q tuple, the q-diagonal block satisfies

Q_q Kphys Q_q=Q_q B Q_q tensor I_X,

since Vrec on that block is one unitary on X. This holds for arbitrary geometric, bath, Ramsey and PCE-clock off-diagonals within the q block; no nearest-neighbor hypothesis is used. Urel changes only the protected buffers and external boundary labels, preserves q and the actual support, and commutes with this diagonal block. Hence

Tr[(Kphys tensor I_ext)Omega_rec]=Tr[Kphys D_C(rho(t_c))].

This is a statement about expectation on the supported state. The entire physical release map is NOT A-only, and it need not conserve energy on arbitrary invalid-clock inputs. Its possible off-support energy is defined by the same finite trace, not set to zero. Support preservation is explicit: buffer indices19/20 occur in neither proper_clock nor the arm set{56,8,...,16}, rods, words or media; D_C changes no diagonal sector; Urel commutes with W_D. The actual held support is therefore preserved. Zero, multi- and padded-clock tuples have zero actual weight by exact invariance; they were not removed from K.

All Q_q commute with W_D,Vprime,Vrec. In the fully undressed frame the source exchange simplifies to

DeltaE_rec=H Tr_C K_C[D_C(tau_C(t_c))-tau_C(t_c)].

This is exactly the whole-H difference before/after the nominated instrument, common to P, pi, forecast VALUES and arbitrary payload/reference. It uses actual K_C with the path rest/root/completion of the augmented source and source time, not a clock energy of the base source. No residual input-dependent energy occurs under these premises. Changing private access, modifying the input sectors, or using a different release requires its own full finite trace and must report any input dependence.

**Entropy:** Urel is isometric with pure boundary labels, so S(Omega_rec)=S(D_C(rho)). Before and after undressing these are tensor products of tau_C or its pinch with unchanged rho_X and rho_Dp. Thus DeltaS_rec=S(D_C(tau_C))-S(tau_C)>=0, independent of candidates/input, with upper bound ln(number of supported clock tuples)=Nlane ln(Grec+1). The coarser full-native bound is Nlane(Grec+1)ln8. Keep the entire source+external output entropy. Entropy of the source marginal after transfer, or of only accessible output, need not increase. CP maps in general do not increase entropy. The accessible information coefficient is the separate proved difference S(B,Z,Y)_uniform-ready-S(B,Z)=ln2 E sum_i D_i(1+F_i), not DeltaS_rec and not a return credit.

## 5. Exact tariffs, retained costs and scope

Use the path ledger's full physical initial tariff Cinitial(P)=Cbase_new+ln4+J_path(P), including joint path stock, all pure output/program factors, response stocks, geometry/bath/clock/rest/source energy, every native safe/pad/word and the unchanged excluded communication-input convention. Initial formation intentionally depends on P. The source Hamiltonian and extra boundary exchange do not. Never add individual path-record marginal entropies to the full joint information.

For each protocol alpha register signed DeltaE_alpha, the separate nonpositive column min(DeltaE_alpha,0), and charge Cboundary_alpha=max(DeltaE_alpha,0)/Theta_phys, Theta_phys>0. No automatic negative-exchange recovery. The joint flagged entropy state and DeltaS_alpha are recorded as above, not guessed work/heat components. All unitary run segments have zero external execution work; this does not erase paid initial stock.

PCE tariff = Cinitial(P)+Cboundary_P-p Rtrial(pi)
= [Cbase_new+ln4-Btrial+Cboundary_P+(1-p)Btrial]+J_path(P)+p Jresp(pi).

Here Btrial=R ln4+N d(q_initial)+NM sum_a d(q_a), d(q)=ln2-h2(q), R=N(1+MB). The enormous(1-p)R ln4 and every other ABORT baseline remain. The coefficient of J_path is1, not p.

Receiver tariff = Cinitial(P)+Cboundary_rec. Ramsey tariff = Cinitial(P)+Cboundary_R. Neither gets a later PCE refund. No combined Ramsey/PCE instrument, refund or simultaneous noncommuting measurement is required or proved. An observation endpoint does not freeze the autonomous source. An implemented switch-off/quench would require its own actual whole-K change and charges.

Raw area remains the nominated unmeasured actual metric/rod expectation and ratio-of-mean-areas/census. No detector or measured area guard is added. In particular there is NO common area-abort outcome and NO additional Cp H^2 term in the receiver failure schedule. The private-clock pinch preserves every receiver DONE probability exactly. Full physical source dimensions and partitions remain; supported trace shortcuts are not Gibbs quotients. The binding adds external mathematical boundary maps, not source hardware or a new installed comparison bank.
