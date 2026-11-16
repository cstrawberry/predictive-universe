# Actual finite-window force parameters before the H diagonal

## Scope

This supplies a quantitative k-selection bound for the actual finite polynomial bank and a terminating finite-L, positive-eta comparison procedure. It uses the calibrated full-action equations, not a principal-only static experiment. The physical source finally has finite k,L and strictly positive eta. The eta=0 and L=infinity systems below are comparison ODEs, not claims that the homogeneous unanchored source is regular. Exact high-k upper-witness plans are specified for adaptive indices1,2,3; the extremely large witness wave numbers are not claimed to have been expanded or evolved. The actual response-oracle binding and a worked selected member are separate.

Normalize H_Lambda=F0=1 only for this parameter choice. Put a=exp(-q/3), k(t)=K/a, r=Fq/F, and use the actual bank throughout. Its q interval is fixed before K. Every real coefficient bound below is independent of K and is computed from the bank's certified C2 envelopes, not from an unrelated fitted curve. For the indexed bank, F>=1/2, r<1/18 and |Fqq|<=1/10+E2. Conservative rational bounds are computed for a,H,Hdot,Hddot,r,rdot, s,s_dot,s_ddot and c0=rho/(2F) on the whole registered interval. The expanding background has qdot=-3H and H>=1, so T<=(q_start-q_end)/3.

## A quantitative high-k estimate

In the L=infinity, eta=0 comparison, let S=s/K²=rho/(2Fk²), z=zeta, d=delta_b and e=z-Sd. The exact equations are

e''+B_H e'+omega² e= -A1 d' - A0 d,

d''+2H d'=c0 d+(5/2)k²e,

omega²=K²/(2a²)+5rho/(4F), B_H=3H(1-r),

K² A1=2s'+H(1-3r)s,

K² A0=s''+B_H s'+s²/a².

The registered tracking data have d=1,d'=e=e'=0 initially. Choose such rational bounds a_min,a_max,h,h1,h2,r0,r1,s_min,s_max,s1,s2,c0_max on the registered window. Define

omega0=1/(2a_max), b_H=3h(1+r0), b_H1=3h1(1+r0)+3h r1,

b1=2s1+h(1+3r0)s_max,

b0=s2+b_H s1+s_max²/a_min²,

c_omega=3h(1+r0), c_force=5/(2a_min² omega0).

These give omega>=K omega0 and |(omega²)'|/(2omega²)<=c_omega. For w=K² sqrt(e'²+omega²e²), the upper Dini derivative satisfies

w'<=c_omega w+b1|d'|+b0|d|.

Positive B_H was retained; dropping its dissipative contribution only enlarges the bound. With C=1+2h+c0_max+b0+b1+c_omega+c_force and K>=1, comparison of |d|+|d'|+w yields a common bound M=3^ceil(CT), since exp(x)<=3^ceil(x). In particular

|e|<=M/(omega0 K³), |e'|<=M/K².

Let d_ref solve d_ref''+2H d_ref'=c0 d_ref with data(1,0). Its integrating-factor representation gives d_ref>=1. The forced difference obeys

|d-d_ref|+|d'-d_ref'| <= [T c_force M 3^ceil((1+2h+c0_max)T)]/K.

Consequently the explicit lower choice K>=2 times the bracket gives d>=1/2 over the whole window. The actual normal ordinary-density reference N=-S d then has |N|>=s_min/(2K²). This is not an assumption about a Newtonian-gauge density.

## Actual force, lensing, spatial and bulk-electric projections

The limiting source has Q=3z',

Phi=-z+f z', f=3H(1-3r)/k²,

Psi=-z+g z', g=3H/k².

The source equations give z''=-B_H z'-(k²/2)e and its exact derivative. One first proves bounds |z|<=M z0/K², |z'|<=M z1/K², |z''|<=M z2/K, |z'''|<=M z3. It then bounds f,g and their required derivatives by fixed coefficients/K². These elementary product bounds give the displayed response constants C_Phi,C_Psi,C_spatial,C_electric,C_density, all expressed divided by M. Every named normalized error is at most M C_name/K. The lensing average inherits the maximum of the Phi/Psi errors. A slip ratio follows only after a separately certified nonzero Phi denominator, or directly from these two errors when they are below1/2.

The literal spatial bulk row is -a k³ z. The literal electric bulk row is

a[k³ Phi-k D+Q Bdot/k+k B A]+G',

D=Psi''+2H Psi'+H Phi'+2B Phi, B=Hdot+H²,

G=-K(z'-H A-Q)=K(2z'+H A),

A=-S d-(5/2)e.

The G' term is essential: it is the first-order source's retained endpoint boundary difference, not a bare-curvature phase. The electric constant bounds D, the normal-frame/shift term, lapse weighting and G'. Relative errors use a k³ N. That reference has a fixed sign throughout the registered window, so the same pointwise relative bound also bounds its time integral. Actual spatial smearing, nonlinear amplitude, field quantization, clock, readout and source errors still have their own allocations; this lemma does not erase them.

## Finite exact wave number and source coefficients

Set the requested high-k allocation to epsilon/8. The preceding finite constants are converted to an integer exponent e_K with K>=2^e_K sufficient for both d>=1/2 and every named relative error. The conversion need not expand 3^ceil(CT). On the actual cube side ell, choose odd n=2^e_n+1 with e_n>=1 and e_n>=e_K+ceil(log2(max(1,ell/6))). Since pi>3, the exact k_com=2pi n/ell exceeds2^e_K. This is an exact-computable physical coefficient, not replacement of pi by a rounded rational. The full31n current grid and actual cube volume/charges are retained by their separate source map. A smaller odd n may instead be chosen by the strict full-window certified response test; the explicit large witness guarantees that such a search can terminate.

## Finite L and positive eta

For this fixed finite K and the actual bank, the full calibrated finite-L six-dimensional velocity ODE is the comparison object. Scale the controller displacement by L^(-1/2) as in the source theorem. Its bounded coefficient blocks on this compact window give O(1/L) physical controller/metric error; initial physical controller displacement and velocity are zero. The exact row coefficients and their finitely many derivatives converge too. The limiting density denominator is separated from zero, so the normalized full-window errors converge. This proves termination of the L=256*4^n search using a total outward interval-ODE enclosure with requested error tending to zero.

After that L is selected, compare the same actual finite-L source at eta=8^(-m) to eta=0. Ordinary finite-dimensional ODE and row-coefficient continuity on the positive kinetic/constraint box proves termination of this second search. A candidate with uncertified denominator or parameter-domain failure returns no upper bound and is skipped. It must not be divided through or accepted. The final source always has eta>0. Exact source coefficient entry oracles, finite rational interval arithmetic, adaptive step subdivision and convergent Taylor/Picard enclosures give a total implementation for each fixed candidate, even if its runtime is very large. No enumeration is claimed to have been run.

The search explicitly dovetails candidate index and bounded enclosure-refinement depth: at round r it revisits every candidate index up to r at depth r. Every call is bounded and may return no certificate. Thus an earlier zero/touching density denominator cannot stall the procedure forever. A fixed later strict-margin candidate is revisited at arbitrarily fine enclosure depth and eventually passes.

The separate density_slicing constant bounds db+3H Q/k² versus db. The latter is the actual foliation-normal local T_nn amplitude by the retained worldline/Jacobian calculation. If the alternative Newtonian-event slicing denominator is used, numerator and denominator errors a,b give (a+b)/(1-b), for b<1. No denominator relabeling is made here.

The final calibration error is the sum of the separately allocated high-k, finite-L and anchor errors. H is chosen only afterward for physical source, area, holding and native-cutoff budgets. This order forbids treating the fixed-wave-number force error as an H-dependent error. All physical perturbation amplitudes and actual detector mean errors remain separately normalized and charged.
