# Bounded-cost finite MPU geometry with a noncollapsed flat four-torus limit

## 0. Exact claim and physical interface

This is a separate lemma on a flat family, used for comparison with the warped geometry of `CURVED_GEOMETRY_BE_MOSCO_CERTIFICATE.md`; it is not the main warped branch. It uses Definition I.3h and Theorem I.3i of Appendix I, the limitations in Theorems C.6c–C.6c.1 of Appendix C, and Definitions 35 and 35a of Chapter 11.

The theorem below constructs the finite metric, measure, exact stochastic transition operator, Dirichlet form and continuum certificate. Its operational realization consumes **one separately proved physical adapter** with these precisely specified requirements:

1. Each retained vertex is a nominated prospectively qualified native-eight key. Qualification is the source-relative Definition 23 task of the qualified-port construction (`qualifier/DEFINITION23_AND_COUNTED_AREA_PROOF.md`). Keys used for later messages need not remain in their earlier qualifying states.
2. Every admitted oriented edge uses the same actual support-four native G transfer. The ready code is transmitted identically, the private dump is not an allowed output, and an independent required retained-work-receipt debit contributes the positive baseline 1 and the additional debit `sqrt(sum(s_j^2))/R` in the declared cost units. The reverse edge has the same debit. The adapter must prove that this is a real registered resource debit, not a desired length attached as metadata; it must count apparatus, stock and any separate reset ledgers without double counting. This is the finite transfer-budget representative permitted by Definition 35, not a fabricated equality with Landauer heat or an inferred thermal entropy floor.
3. The rational edge-choice probabilities below control those same transmissions. At each tick, a ready predictive symbol is retained at the selected destination (or stays put). No extra receiver interface is licensed by a controller support.
4. All sites have the same retained native information support, of capacity ln4. The normalized channel-capacity volume is therefore the total retained capacity at sites divided by its total, giving the measure below. Extra private apparatus is not counted as an independent retained channel.

The mathematical theorem is unconditional for the explicit finite objects below. Calling them a realized **MPU** family additionally requires a proof of these adapter properties. The label “ND–RID” is not used in place of that proof. A source adapter with positive fixed baseline kappa instead of 1 uses weights kappa+|s|/R and microscopic length Rh/(1+kappa/2); the same proof applies. Baseline 1 is a once-for-all cost-unit normalization, not a fitted metric target.

## 1. Exact constructors and conventions

For every integer n>=0, put

- R=n+3, N=8 R^3, h=1/N;
- X_n=(Z/NZ)^4, embedded at x=h z in the unit flat torus T^4=R^4/Z^4;
- S_R={s in Z^4:0<|s|_2<=2R};
- A_R=sum_{s in S_R} s_1^2, a positive integer;
- m_n({x})=h^4; delta_n=2Rh/3;
- w_s=1+|s|_2/R and edge length delta_n w_s=(2h/3)(R+|s|_2).

The edge x -> x+hs is reduced modulo the torus. Since N>4R, distinct direction vectors give distinct nonzero neighboring vertices. S_R is invariant under signs and coordinate permutations, contains every +/- coordinate vector, and generates the grid. The finite graph is connected. All costs are positive and symmetric, with the **same n-independent bounds 1<=w_s<=3**. This fulfills the uniform-cost requirement of Definition 35. Its metric d_n is exactly the minimum sum of those costs times delta_n, not the ambient Euclidean metric.

Set

    a_s = 1/(h^2 A_R) + 1/(2h^2) if |s|=1,
    a_s = 1/(h^2 A_R) otherwise,
    L_n f(x) = sum_s a_s [f(x+hs)-f(x)],
    Gamma_n(f,g) = (1/2) sum_s a_s [f(x+hs)-f(x)][g(x+hs)-g(x)],
    E_n(f) = (1/2) integral Gamma_n(f,f) dm_n
           = -(1/2) <f,L_n f> = (h^4/4) sum_{x,s} a_s |f(x+hs)-f(x)|^2.

Thus E_n is normalized to converge to the standard Cheeger energy Ch(f)=(1/2) integral |grad f|^2. The associated raw quadratic form is 2 E_n and its Markov generator is L_n. This factor of two matters for the source's definition of lambda_1 as Ch/variance.

Signed permutation symmetry gives, **exactly**,

    sum_s a_s (hs)_i (hs)_j = 2 delta_ij,
    sum_s a_s |hs|^2 = 8,
    rho_n:=max_s |hs|=2Rh ->0.

All rates and measures are rational; costs are positive algebraic numbers with explicit square roots. `geometry_family.py` supplies total vertex, edge, rate, tick, measure and path oracles. Its source definitions do not enumerate an exponentially large full matrix.

## 2. Actual finite-step stochastic realization

Let q_n=sum_s a_s=h^-2(4+|S_R|/A_R) and choose the rational tick

    tau_n = 1/(16 R^2 q_n^2).

A tick stays at x with probability 1-tau_n q_n and sends its ready symbol along s with probability tau_n a_s. These are nonnegative rational numbers summing to one. A finite common denominator therefore supplies an exact finite classical random stock; a controlled transfer is a finite permutation on that stock, a position register, and the ready code. Its native extension and apparatus are physical requirements on the adapter. The stochastic matrix is exactly P_n=I+tau_n L_n. It is reversible for m_n, and **its** difference generator is L_n.

At index n, supply the finite stock for floor(R/tau_n) ticks. No inexhaustible stochastic reservoir is assumed. For 0<=t<=R, writing k=floor(t/tau_n), the spectral theorem and 0<=lambda<=2q_n give

    ||P_n^k - exp(t L_n)||_(2->2)
      <= 8 t tau_n q_n^2 + 2 q_n tau_n
      <= 1/(2R) + 1/(8 R^2 q_n).

Indeed, for z=tau_n lambda<=1/2, 0<=-log(1-z)-z<=2z^2; compare the kth powers to exp(-kz), then account for the residual time. Thus the continuous semigroup is also a certified limit of a genuinely finite stock/finite tick family. L_n is not claimed to be the generator of an unbuilt continuous-time finite reservoir.

## 3. Quantitative propagation metric and measured GH convergence

Write d_T for the standard Euclidean geodesic distance on T^4. Its diameter is 1. Every edge satisfies

    (2h/3)(R+|s|) >= h|s| >= d_T(x,x+hs),

because |s|<=2R. Hence d_n>=d_T.

For x!=y choose the shortest integer lift v of y-x, so d_T(x,y)=h|v|. Put q=ceil(|v|/(2R-2)). Define p_l coordinatewise by floor(l v_j/q), for l=0,...,q; let s_l=p_(l+1)-p_l and omit zero increments. Then sum s_l=v and |s_l-v/q|<2, so |s_l|<=|v|/q+2<=2R. These are actual graph edges. Their total length is at most

    (2h/3)[R q + |v| +2q]
      <= [R/(R-1)] d_T(x,y) + 2h(R+2)/3.

Consequently, with a_R=R/(R-1) and b_R=2h(R+2)/3,

    d_T <= d_n <= a_R d_T+b_R,
    sup_{x,y}|d_n-d_T| <= epsilon_n:=1/(R-1)+b_R ->0.

The special case x=y is immediate. This proof remains valid for paths wrapping around the torus, since the lift realizes one legitimate wrapped path. There is no appeal to a fixed finite generating set. The growing direction net is exactly what avoids the polyhedral-norm obstruction of C.6c.1.

Partition T^4 into the centered grid cubes Q_x, assigning boundary ties measurably. Each cube has volume h^4 and every point in it is within Euclidean distance h of x. Couple m_n at x to Lebesgue measure restricted to Q_x. Embed the disjoint union of the graph and torus in the standard correspondence metric with each paired vertex attached to its torus point at distance epsilon_n/2. The inequality above proves that both component metrics are preserved. This coupling and h-density give

    d_mGH((X_n,d_n,m_n),(T^4,d_T,dx)) <= epsilon_n/2+h.

Here mGH may be defined by the maximum of Hausdorff and Prokhorov distances in a common metric space. The torus has total measure one. With the standard Euclidean normalization of H^4, dx=H^4, not just an unspecified multiple. Noncollapse in the RCD sense is therefore exact.

## 4. Uniform four-dimensional volumes, doubling and local Poincare

Retain local radii

    4 b_R <= r <= 1/8.

There are nonempty such intervals eventually, and every fixed sufficiently small positive radius is retained eventually. No four-dimensional volume law is claimed below the discrete resolution. Since R>=3, a_R<=3/2. Thus

    X_n intersect B_T(x,r/2) subset B_dn(x,r)
      subset X_n intersect B_T(x,r).

The centered cube covering and r>=4b_R>=4h imply

    omega_4 (r/4)^4 <= m_n(B_dn(x,r)) <= omega_4 (5r/4)^4,
    omega_4=pi^2/2.

Open/closed boundary conventions do not affect these conservative inequalities. They follow by including all cubes that meet the smaller Euclidean ball of radius r/2-h, and bounding the union of cubes centered in the outer ball by radius r+h. All these balls lie below the torus injectivity radius.

Therefore the constants v_-=omega_4/256 and v_+=omega_4*(5/4)^4 are uniform. For 4b_R<=r<=1/16,

    m_n(B_dn(x,2r)) <= 10000 m_n(B_dn(x,r)).

For Poincare use 4b_R<=r<=1/32. Let Q be the grid cube |z_j-x_j|<=r (shortest lifts), of side length M=2 floor(r/h)+1<=3r/h. It contains B_dn(x,r), and d_n<=a_R d_T+b_R puts Q inside B_dn(x,4r). On a path with M vertices, telescoping/Cauchy–Schwarz gives variance at most M^2 times the sum of squared nearest-neighbor differences, with counting measure. Tensorizing this estimate coordinate by coordinate yields

    sum_Q |f-f_Q|^2 <= M^2 sum_{internal coordinate edges in Q}|df|^2.

The backbone part of the actual Gamma_n has coefficient 1/(4h^2) on every directed coordinate difference. Hence the integral of Gamma_n over Q dominates (1/(2h^2))h^4 times the internal undirected edge sum. Substituting gives

    integral_B |f-f_B|^2 dm_n
      <= integral_Q |f-f_Q|^2 dm_n
      <= 18 r^2 integral_(B_dn(x,4r)) Gamma_n(f) dm_n.

In the first inequality use the minimizing property of the mean over B and then enlarge the nonnegative integrand. Volume comparison gives m_n(B_(4r))/m_n(B_r)<=160000. Cauchy–Schwarz therefore proves the actual uniform (1,2) inequality

    average_(B_r) |f-f_(B_r)|
      <= 2000 r [average_(B_(4r)) Gamma_n(f)]^(1/2).

These constants are deliberately conservative. They are independent of n, f, x, and retained r. A **metric upper-gradient** PI on the isolated vertex space is not being substituted for this Dirichlet-form PI: on an isolated graph metric the curve-based notion is degenerate. The continuum PI is the usual metric/Sobolev one after the proved limit-energy identification.

## 5. Fourier coercivity, uniform spectral gap and Mosco proof

Use the centered frequency set K_N={-N/2,...,N/2-1}^4 and the orthonormal finite Fourier transform fhat(k). The exact symbol is

    lambda_n(k)=sum_s a_s[1-cos(2pi h k.s)],
    E_n(f)=(1/2)sum_(k in K_N) lambda_n(k)|fhat(k)|^2.

For all k in K_N,

    8 |k|^2 <= lambda_n(k) <= 4pi^2 |k|^2.

The lower bound uses just the backbone: its symbol is 2h^-2 sum_j sin^2(pi h k_j), and |sin(pi u)|>=2|u| for |u|<=1/2. The upper bound follows from 1-cos t<=t^2/2 and the exact covariance 2I. In particular

    Var_mn(f) <= (1/4) E_n(f).

Thus the source convention lambda_1,n=inf E_n/Var has the uniform positive lower bound 4. The generator spectral gap is twice this. Both conventions are kept distinct.

Taylor's inequality |1-cos t-t^2/2|<=t^4/24, together with sum_s a_s|hs|^4<=8rho_n^2, gives the explicit smooth-mode error

    |lambda_n(k)-4pi^2|k|^2|
      <= ((2pi)^4/3) rho_n^2 |k|^4.                 (5.1)

Let J_n f be Fourier interpolation onto K_N and I_n f the function constant on each centered cube Q_x. J_n is an isometry into L^2(T^4). Direct integration over cells makes the cross terms between distinct frequencies vanish. With sinc(t)=sin(t)/t,

    ||I_n f-J_n f||_2^2
      =2 sum_k |fhat(k)|^2 [1-product_j sinc(pi h k_j)]
      <= (pi^2 h^2/3) sum_k |k|^2|fhat(k)|^2
      <= (pi^2 h^2/12) E_n(f).                    (5.2)

This supplies the varying-space identifications, not merely a formal Fourier limit.

For the Mosco liminf, suppose I_n f_n converges weakly to f and liminf E_n(f_n)<infinity. Pass to a bounded-energy subsequence. Equation (5.2) makes J_n f_n-I_n f_n strongly vanish. Each fixed Fourier coefficient converges; (5.1) gives lambda_n(k)->4pi^2|k|^2. Apply the finite-mode lower bound and then increase the finite mode set to obtain

    Ch(f)=(1/2)sum_(k in Z^4)4pi^2|k|^2|fhat(k)|^2
       <= liminf E_n(f_n).

For recovery of f in H^1(T^4), define f_n by fhat_n(k)=fhat(k) on K_N. Then J_n f_n converges strongly to f, E_n(f_n)<=Ch(f), and dominated convergence using the symbol upper bound and (5.1) yields E_n(f_n)->Ch(f). Equation (5.2) makes I_n f_n converge strongly as well. For f outside H^1 the recovery requirement has infinite right side and ordinary L^2 approximation suffices. This is full Mosco convergence, with its weak and strong clauses, to the **Cheeger energy of the same measured GH metric**.

The same lower bound gives compactness of bounded energy and L^2 norm families: Fourier mass above |k|>M is at most E_n/(4M^2). Finite-mode convergence and (5.2) finish the proof. In particular the Neumann gap on D=T^4 converges to 2pi^2. More quantitatively, frequencies |k|^2>=5 have lambda_n>=40>4pi^2, while k=e_1 gives lambda_n<=4pi^2; applying (5.1) on |k|^2<=4 yields

    max(4, 2pi^2-(8/3)(2pi)^4 rho_n^2)
      <= lambda_1,n <= 2pi^2,
    lambda_1(T^4)=2pi^2.

No assertion about spectral gaps of arbitrary moving domains is hidden in this global-domain certificate.

## 6. Global graph curvature and finite-dimensional continuum transfer

For every function on the finite graph, every vertex x, and D_s f(x)=f(x+hs)-f(x), commuting translations give the exact identity

    Gamma_2,n(f)(x)
      :=(1/2)L_n Gamma_n(f)(x)-Gamma_n(f,L_n f)(x)
       =(1/4)sum_(s,t) a_s a_t [D_s D_t f(x)]^2 >=0.   (6.1)

It follows by substituting L=sum a_s D_s and Gamma=(1/2)sum a_s(D_s f)^2, expanding the two differences, and canceling the linear cross terms. This is a **global generator-domain BE(0,infinity)** certificate, not a radius-two test on a polynomial core. Every function belongs to the finite generator domain. It does not assert graph BE(0,4), which is not needed and has not been proved.

Now restrict a periodic C^4 function f to the grid. Put G=||grad f||_infinity, H=||Hess f||_(operator,infinity), M_3=||D^3 f||_(operator,infinity), M_4=||D^4 f||_(operator,infinity). Straight-segment Taylor estimates on the periodic lift and the exact covariance give

    ||L_n f-Delta f||_infinity <= rho_n^2 M_4/3 =: e_L,
    ||Gamma_n(f)-|grad f|^2||_infinity
      <=4rho_n G H+rho_n^2 H^2,
    ||Gamma_2,n(f)-|Hess f|_F^2||_infinity
      <=32rho_n H M_3+16rho_n^2 M_3^2 =: e_2.       (6.2)

For the last bound, write D_s D_t f as the double integral of Hess f along the parallelogram. Its difference from (hs)^T Hess f(x)(ht) is at most rho_n M_3 |hs||ht|. Squaring and summing uses (sum a_s|hs|^2)^2=64. The leading term is exactly |Hess f|_F^2. Symmetry cancels the odd Taylor terms in L_n, giving the first estimate.

Since |Hess f|_F^2>=(Delta f)^2/4 in four dimensions, these same finite tests satisfy

    Gamma_2,n(f) >= (L_n f)^2/4
      - e_2 - (e_L/4)(2||Delta f||_infinity+e_L).    (6.3)

All displayed defects go to zero on each smooth core function. Multiply by any smooth nonnegative test, sum against m_n, and use the cell quadrature estimate |integral I_n g-integral g|<=h Lip(g) for each smooth integrand, together with (6.2). Every integrated term has an explicit vanishing error. The limit is the full smooth-core BE(0,4) inequality for the ordinary torus Laplacian.

On the smooth flat torus the identity Gamma_2=|Hess f|_F^2 extends to the generator-domain integrated inequality by Fourier truncation and closure; admissible bounded test functions are approximated by its positive heat semigroup and then truncation/closure. Equivalently, the flat Riemannian Ricci tensor is identically zero and the classical integrated Bochner formula gives BE(0,4) on its full admissible domain. Its complete length metric, full-support finite measure, quadratic Cheeger energy, Sobolev-to-Lipschitz property and required integrability are the standard directly verifiable smooth compact-manifold properties. The finite-dimensional BE characterization therefore identifies (T^4,d_T,H^4) as noncollapsed RCD*(0,4).

Crucially, the finite vertex spaces are **not length spaces** and their isolated-point metric Cheeger energies would be zero. Theorem C.6c cannot be applied to them by pretending otherwise. We instead give the stronger concrete identification: quantitative measured GH limit + full Mosco limit + explicit curvature-form passage + direct complete smooth limit verification. The extra stability-certificate requirement of Theorem I.3i is thereby met on this flat family without claiming the false finite length-space premises of C.6c.

## 7. Scope and interface

The flat geometry has X=T^4, d=d_T, m=H^4, K=0, dimension 4, D=T^4, Ch=(1/2)int|grad|^2 and lambda_1(D)=2pi^2. All finite local constants and discrete-to-continuum rates above refer to this same family, coordinate unit and operator. The full source, expansion/shear, elliptic source-control and observation identifications would have to be supplied on these exact objects by a source/backreaction construction; they are not inferred from flatness or from a formal analogy with a cosmological metric.

A change of physical length unit L multiplies d, delta, h, rho and r by L, changes L_n and Gamma by L^-2, Ch/normalized variance by L^-2, and gives lambda_1=2pi^2/L^2. For the nonnormalized Hausdorff measure on a side-L torus, multiply the site measure by L^4; the normalized averaging measure remains h^4 in dimensionless coordinates. Do not identify normalized measure and H^4 on a side-L torus without that explicit conversion.

The finite checks in `check_flat_geometry.py`, with results in `FLAT_GEOMETRY_CHECKS.json`, test the indexed definitions and algebraic identities. They do not prove an infinite-sequence theorem by sampling it. The foregoing proof supplies that theorem; the physical adapter proves the realization clause separately.
