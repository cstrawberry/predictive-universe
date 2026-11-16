# The actual warped geometry: finite network, capacity volume, uniform BE and continuum

## 1. Exact operational compactification and its physical slab

Use coordinates y in the unit four-torus. Physical coordinates are t=4y_0 and (x,z_2,z_3)=2pi(y_1,y_2,y_3). Let eta(u)=exp(-1/u) for u>0 and zero otherwise, chi(u)=eta(u)/(eta(u)+eta(1-u)), and

    psi(t)=chi(2t-1) chi(5-2t),
    u(t,x)=psi(t)[log t+0.01 t cos x] on 1/2<t<5/2,
    u=0 outside that interval, b=exp u.

Extend periodically in t with period 4. These are exact smooth functions. The operational Riemannian metric is

    g_E=dt^2+b(t,x)^2(dx^2+dz_2^2+dz_3^2),
    G(y)=diag(16,4pi^2 b^2,4pi^2 b^2,4pi^2 b^2).

On D=[1,2] times the spatial three-torus, psi=1, so this is **exactly** the positive-sign version of the source's metric, not a flat space carrying curved labels. The Lorentzian source and its on-shell matter are separate constructions. No cosmological equation is asserted outside D.

Write mu=sqrt(det G)=4(2pi)^3 b^3 and c_i=mu G^{ii}. Thus c_0=(2pi)^3 b^3/4 and c_j=8pi b for j=1,2,3. The following very loose, fully uniform constants suffice:

    4 I <= G <= 400 I,
    32 <= mu <= 27648,
    2 <= c_i <=1728,
    ||grad mu||<=2.5*10^8, ||Hess mu||<=2.8*10^12,
    ||grad c_i||<=1.6*10^7, ||Hess c_i||<=1.8*10^11,
    ||DG||<=3*10^6=:G_1, ||D^2G||<=2*10^10.

Here derivatives are in y, and tensor norms are Euclidean operator norms. A direct verification is as follows. On [0,1], eta<=1, |eta'|<=1 and |eta''|<=8; eta(u)+eta(1-u)>=exp(-2)>1/8. Quotient differentiation gives |chi'|<=136, |chi''|<=5440, hence |psi'|<=544 and |psi''|<=200000. On the support, |log t|<=1, t<=5/2, 1/t<=2, so |u|<=1.025, |u_t|<=560, |u_x|<=0.025, |u_tt|<=210000, |u_tx|<=14, |u_xx|<=0.025. After the coordinate change, ||grad_y u||<=3000 and ||Hess_y u||<=4*10^6. Differentiating exp(u), exp(3u), and the diagonal metric yields the displayed bounds; 1/3<b<3 follows from exp(1.025)<3. The matrix-valued derivative bounds use the maximum diagonal entry, not a sum over four copies. All higher derivatives also have computable finite bounds, obtained from the finite derivative polynomials of exp(-1/u) and the same denominator floor.

## 2. Finite objects and the actual capacity census

For n>=0 set R=80*2^n, N=8*10^28 R^3, h=1/N, rho=Rh. Let X_n=(Z/NZ)^4, and install the finite symmetric propagation direction set

    S_R={s in Z^4:0<||s||_infinity<=R}.

For each oriented edge (y,y+hs), let

    ell_g(y,s)= integral_0^1 sqrt((hs)^T G(y+v hs)(hs)) dv,
    w_(y,s)=max(1,ell_g(y,s)/rho), delta_n=rho.

The integral is an exact computable positive real. Reversal parameterization proves w_(y,s)=w_(y+hs,-s). Its operational cost is supplied by the physical required-receipt adapter with this exact w. As 2<=sqrt(G)<=20 and |s|<=2R,

    1<=w_(y,s)<=40.

These n-independent bounds meet Definition 35; the metric is the finite shortest-path sum of delta_n w, not a metric declared independently of the edge debit. The finite set has explicit integer membership, so no undecidable threshold comparison is needed to decide whether an edge exists.

At each vertex the native G ready code has support four. Apply the paid independent flagged erasure with success probability

    q_y=b(y)^3/27 in (1/729,1).

Its actual capacity is C_y=q_y ln4: reveal the input-independent flag, use four orthogonal ready letters on success and one fixed failure output, and apply the conditional output-support converse to arbitrary entangled blocks. The same uniform ready input attains every conditional support bound. This proof uses the **whole** allowed output and excludes private dumps. The finite reference measure is therefore the calibrated capacity census

    m_n({y})=h^4 [108(2pi)^3/ln4] C_y=mu(y)h^4.

It is not assigned by geometric fiat. Its total mass tends to the Riemannian volume. Normalized averages use m_n/m_n(X_n); the unnormalized limit mu dy is the standard H_g^4. Those two measures are not conflated.

### The explicitly retained diffusion policy

All S_R edges are actual positive-cost propagation interfaces. The diffusion policy uses **only** the eight coordinate-neighbor transfers; the other interfaces remain available for propagation-distance tasks, but have zero selection probability in this policy. This support difference is part of the declared operational task, not an unmentioned identification of two graphs. Set

    a_(+i)(y)=c_i(y+h e_i/2)/(mu(y)h^2),
    a_(-i)(y)=c_i(y-h e_i/2)/(mu(y)h^2),
    L_n f=sum_(i,+/-) a_(+/-i)(f(y+/-he_i)-f(y)),
    Gamma_n(f)=(1/2)sum_(i,+/-)a_(+/-i)|f(y+/-he_i)-f(y)|^2,
    E_n=(1/2)integral Gamma_n dm_n.

Then m_y a_(+i)(y)=m_(y+he_i) a_(-i)(y+he_i)=h^2 c_i(y+he_i/2), so this is a reversible generator on the same qualified vertex set. In particular

    E_n(f)=(h^4/2)sum_(y,i)c_i(y+he_i/2)|[f(y+he_i)-f(y)]/h|^2.  (2.1)

The matrix entries are computable reals, not falsely asserted to be rational. A finite diagonal stock with these finitely many probabilities realizes the finite choice; any rounded implementation needs its own certified error allowance. Choose Q_n=432/h^2, which bounds every exit rate, and tau_n=1/(16R^2 Q_n^2). P_n=I+tau_n L_n is an actual stochastic tick. A finite stock for floor(R/tau_n) ticks suffices. Reversibility gives spectrum in [-2Q_n,0], hence the same elementary logarithm estimate as in the flat comparison lemma (`FLAT_GEOMETRY_MOSCO_RCD_CERTIFICATE.md`, §2) proves, for 0<=t<=R,

    ||P_n^floor(t/tau_n)-exp(tL_n)||_(L2(m_n)->L2(m_n))
      <=1/(2R)+1/(8R^2 Q_n).

Native G transfers ready symbols exactly; the erasure used for the capacity census is a separately declared input/output mode. It is not silently inserted into this conservative random-walk policy. The installed native source, receipt and erasure modes, their stock counts and allowed outputs must be verified by the source adapter. The actual isolated words and arbitrary-reference checks are supplied by `common_source/native_edge_source.py` and `common_source/native_capacity_measure.py`; the latter proves exactly C=q ln4 and the physical cell formula m=h_t h_x^3*27C/ln4. Their common controller and shared source belong to the common source construction, not to this geometry proof.

## 3. Quantitative convergence of the operational metric

Let d_g be the geodesic distance of G. Every edge cost max(rho,ell_g) is at least its actual g-length, so d_n>=d_g. The coordinate torus has Euclidean diameter 1, hence diam_g<=20.

For the upper bound, take a minimizing g-geodesic, divide it into consecutive arclength pieces of length 3rho/2 and a final shorter piece, and round every interior division point to a nearest grid point. Endpoints already on the grid are unchanged. Each rounding moves at most h in Euclidean distance and at most 20h in g-distance. A lifted segment of arclength <=3rho/2 has Euclidean displacement at most 3rho/4. Its rounded displacement has each coordinate at most 3rho/4+2h<=rho, since R>=80. Thus it is one of the actual S_R edges (zero increments can be omitted).

For a full-length segment, its rounded endpoint distance is at least 3rho/2-40h>=rho. Its straight-edge length is therefore at least rho, so its edge cost equals ell_g, not a residual floor. Using the norm-variation estimate

    ||v|_(G(y))-|v|_(G(z))| <= (G_1/4)|y-z||v|,

compare the straight chord with the minimizing segment in the metric frozen at the latter's first endpoint. The two endpoint-rounding errors contribute at most 40h. Since every lifted segment and its chord stay within O(rho) of that endpoint, the remaining comparison is at most 3G_1 rho^2. More explicitly, the frozen comparison along the geodesic costs at most (G_1/16)(3rho/2)^2; the chord correction costs at most (G_1/4)(15rho/4)(11rho/4), totaling less than 3G_1rho^2. This also bounds the final short segment; its floor adds at most rho.

There are at most d_g/(3rho/2)+1 segments. Consequently

    d_g <= d_n <= (1+alpha_n)d_g+beta_n,
    alpha_n=80/(3R)+2G_1 rho,
    beta_n=40h+3G_1 rho^2+rho.                          (3.1)

This is a quantitative convergence certificate with epsilon_n=20alpha_n+beta_n->0. Cubes centered at the vertices have Euclidean radius h. The sampled density differs from mu on such a cube by at most M_mu,1 h, where M_mu,1=2.5*10^8. The common correspondence metric used in the flat lemma and this total-variation estimate give a measured GH bound

    d_mGH((X_n,d_n,m_n),(T^4,d_g,mu dy))
       <=epsilon_n/2+(20+M_mu,1)h.                    (3.2)

For conventions using probability measures, normalize both sides and add the elementary normalization error, at most 2M_mu,1 h/32. The unnormalized limit remains H_g^4; normalization does not establish noncollapse until that scale is restored.

## 4. Uniform local volume, doubling, Poincare and spectral estimates

There is also a coarser bound which is uniform from the first n and convenient for local estimates. Travel along coordinate directions in chunks of at most R grid spacings. Each full chunk costs at most 20rho and each final chunk at most 20rho, giving

    2d_E <= d_g <= d_n <=40d_E+80rho.

For 160rho<=r<=1/100 this implies

    X_n intersect B_E(y,r/80) subset B_dn(y,r)
      subset X_n intersect B_E(y,r/2).

Using the centered cubes, h<=r/160 and 32<=mu<=27648 yields

    v_-r^4<=m_n(B_dn(y,r))<=v_+r^4,
    v_-=32omega_4/160^4, v_+=27648omega_4,
    omega_4=pi^2/2.

Thus local doubling has constant 16v_+/v_- whenever r and 2r are retained. These constants are huge but n-independent, and the resolution cutoff tends to zero.

For the Dirichlet (1,2)-PI take 160rho<=r<=1/4200. The coordinate cube Q of radius r/2 contains B_dn(y,r). Its grid side count M<=2r/h, and it lies in B_dn(y,42r), by the coarse metric bound. Tensorized path Poincare gives the counting-measure inequality sum_Q|f-f_Q|^2<=M^2 sum_internal_edges|df|^2. By (2.1), the integral of Gamma over Q is at least c_min h^2 times that edge sum. The weighted mean minimizes weighted variance; consequently

    integral_(B_r)|f-f_(B_r)|^2 dm_n
       <=(4mu_max/c_min)r^2 integral_(B_(42r))Gamma_n(f)dm_n.

Volume comparison gives the explicit averaged (1,2)-PI constant

    C_PI=[(4mu_max/c_min)(v_+/v_-)42^4]^(1/2),

with dilation 42. This is an energy/carre-du-champ PI on the finite network, not a false curve-upper-gradient assertion on an isolated vertex metric.

Globally, compare (2.1) with the unit-torus coordinate difference energy. Its Cheeger-normalized gap is at least 8, from sin(pi k/N)>=2|k|/N. Since E_n>=c_min E_flat and weighted variance is at most mu_max times the uniform variance,

    inf_(nonconstant f) E_n(f)/Var_(unnormalized m_n)(f)
       >=8c_min/mu_max >=1/1728.                    (4.1)

Here unnormalized variance means integral|f-mean_m f|^2; equivalently the ratio of normalized energy to normalized variance. This full-torus estimate does not replace the source's separate Neumann estimate on the slab D.

## 5. Full Mosco convergence to the correct Cheeger energy

Use centered coordinate cells. Constant interpolation I_n f has measure-density error bounded relatively by M_mu,1 h/mu_min. If an exact Hilbert isometry is wanted, multiply f on cell Q_y by [mu(y)h^4/integral_Qy mu]^(1/2); this factor tends uniformly to one. Thus constant interpolation and this isometry define the same strong/weak varying-space convergence.

Suppose I_n f_n converges weakly in L^2(mu dy) to f and E_n(f_n) is bounded. Uniform lower ellipticity in (2.1) bounds every piecewise-constant forward difference D_i^h f_n in L^2. Extract their weak limits. Periodic discrete summation by parts against any smooth test, followed by uniform convergence of test differences, identifies those limits as the distributional derivatives partial_i f. Therefore f belongs to H^1. The coefficient step functions c_i(y+he_i/2) converge uniformly to c_i. Weak lower semicontinuity of the weighted L^2 norm gives

    liminf E_n(f_n) >=(1/2)integral sum_i c_i |partial_i f|^2 dy
                   =(1/2)integral |grad_g f|^2 dvol_g
                   =Ch_g(f).

For a smooth periodic f, sample it at the vertices. The finite differences converge uniformly to its derivatives, and quadrature in (2.1) gives E_n(f|X_n)->Ch_g(f), while I_n f converges strongly. Smooth functions are dense in H^1 on this smooth compact manifold. A diagonal approximation provides a recovery sequence for every H^1 function; for functions with infinite Ch any strong L^2 approximation suffices. This proves both clauses of Mosco convergence, not just consistency on smooth functions.

The same coefficient bounds and the flat Fourier tail estimate give compactness of bounded-energy, bounded-L^2 sequences. A quantitative smooth recovery error follows directly from

    |D_i^h f(y)-partial_i f(y)| <=(h/2)||D^2 f||_infinity,
    |c_i(y+he_i/2)-c_i(y)| <=(h/2)M_c,1,

and the cell quadrature bound h Lip(g) applied to each smooth energy integrand. Thus one may use the sum over four i of

    (h/4) M_c,1 (||partial_i f||+h||D^2f||/2)^2
    +(c_max/2)[h||partial_i f||||D^2f||+h^2||D^2f||^2/4]
    +(h/2)Lip(c_i|partial_i f|^2)

as a conservative absolute energy error. This identifies the same metric and the same capacity measure as in (3.2).

## 6. A full global graph BE lower bound, with explicit constants

This section concerns **all** functions on every finite graph, not only sampled smooth functions. Let A={+/-e_i:i=0,...,3}; the radius-two stencil has 41 distinct vertices, including 0. Subtract f(0), and regard its other 40 values as a vector F. Write

    b_s(z;h)=c_i(y+h(z+s/2))/mu(y+hz), s=+/-e_i,
    Gamma_2,n(f)(y)=h^-4 Q_h(F),
    Gamma_n(f)(y)=(1/(2h^2))sum_s b_s(0;h)F_s^2.

The exact quadratic form is

    Q_h(F)= (1/4)sum_(t,s)b_t(0)[b_s(t)(F_(t+s)-F_t)^2-b_s(0)F_s^2]
            -(1/2)sum_(t,s)b_t(0)F_t[b_s(t)(F_(t+s)-F_t)-b_s(0)F_s].  (6.1)

F_0=0 and all coefficient arguments carry h. Equation (6.1) is a direct expansion of Gamma_2=(1/2)L Gamma-Gamma(f,Lf), so there is no missing local term.

At h=0, b_s=c_i/mu=b_-s. Commutativity gives

    Q_0(F)=(1/4)sum_(s,t)b_s b_t Z_st^2,
    Z_st=F_(s+t)-F_s-F_t.                            (6.2)

Its kernel is **exactly** the four-dimensional linear restrictions F_z=p.z. Indeed Z_(e_i,-e_i)=0 forces F_-ei=-F_ei; all other radius-two values are then fixed by Z_st=0. Conversely linear restrictions make every Z zero.

For an arbitrary F set p_i=(F_ei-F_-ei)/2, l_z=p.z and g=F-l. Then g_ei=g_-ei=-Z_(ei,-ei)/2, and g_(s+t)=Z_st+g_s+g_t. Summing over the eight first neighbors and choosing one representation for each of the 32 second neighbors proves

    ||g||^2 <=100 sum_(s,t)Z_st^2,
    ||l||^2=22|p|^2<=11sum_s F_s^2.                 (6.3)

The factor 100 is conservative: each first neighbor occurs at most eight times in the chosen second-neighbor representations, giving a bound below 10. With

    b_min=1/13824, lambda_0=b_min^2/400,

(6.2) therefore gives Q_0(F)>=lambda_0||g||^2.

Reflection z->-z and h->-h gives Q_-h(F reflected)=Q_h(F). For a linear l, its reflection is -l and quadratic forms ignore that sign. Hence Q_h(l) is even in h and Q'_0(l)=0. This is the necessary first-order cancellation on the entire kernel; merely bounding all coefficients by O(h) would not prove uniform curvature.

The global coefficient bounds in Section 1 imply for z=0 or z in A, uniformly in y and h,

    |b_s(z;h)|<=B_0=54,
    |partial_h b_s(z;h)|<=B_1=5*10^8,
    |partial_h^2 b_s(z;h)|<=B_2=10^16.

For clarity, permissible formulas before numerical enlargement are

    B_1=(3/2)M_c,1/mu_min+c_max M_mu,1/mu_min^2,
    B_2=(9/4)M_c,2/mu_min+3M_c,1 M_mu,1/mu_min^2
         +c_max M_mu,2/mu_min^2+2c_max M_mu,1^2/mu_min^3.

There are 64 pairs in (6.1). Bounding each squared difference by 2||F||^2 and each product by its elementary operator norm gives ||Q_h||<=256B_0^2. Differentiating coefficient products gives

    ||Q'_h||<=512B_0B_1 <=M_1:=2*10^13,
    ||Q''_h||<=512(B_1^2+B_0B_2)<=M_2:=5*10^20.

Taylor expansion and Q'_0(l)=0 now yield

    Q_h(F)>=lambda_0||g||^2
             -h M_1(2||l||||g||+||g||^2)
             -h^2 M_2(||l||^2+||g||^2).

Our h satisfies h<=10^-27 and hence hM_1+h^2M_2<=lambda_0/2. Young's inequality absorbs the cross term with lambda_0||g||^2/4, leaving

    Q_h(F)>=-h^2 C ||l||^2,
    C=4M_1^2/lambda_0+M_2.

Finally, (6.3) and Gamma_n>=b_min sum_s F_s^2/(2h^2) give the **global** all-function inequality

    Gamma_2,n(f)>=-[22C/b_min] Gamma_n(f)>=-10^45 Gamma_n(f).   (6.4)

The last numerical inequality is checked with rational integers by `check_curved_geometry.py`. Thus every finite network has BE(K,infinity) with the single finite K=-10^45. No spectral or spatial cutoff on f is used. The proof also supplies a reusable sufficient theorem for any smooth positive diagonal divergence-form coefficients, after replacing the explicit constants.

## 7. RCD dimension and complete continuum stability certificate

The finite spaces are isolated vertex metric spaces and are not length spaces. Their curve-based metric Cheeger energies are not E_n. Accordingly, do **not** apply Theorem C.6c's finite length-space characterization to them, and do not claim finite BE(K,4) from (6.4).

The continuum has been identified independently and exactly: (3.2) gives its complete smooth metric and Hausdorff measure, Section 5 identifies the Mosco limit with its quadratic Cheeger energy, and (6.4) supplies the actual uniform discrete curvature lower bound. The four-dimensional curvature transfer is completed by direct smooth verification, not by changing infinity to four in a graph inequality.

For completeness, the bounds G>=4I, ||DG||<=3*10^6 and ||D^2G||<=2*10^10 give each Christoffel coefficient at most 1.2*10^6 and each first derivative at most 10^12. The coordinate Ricci formula then bounds each Ricci component by 10^14. Thus Ric(v,v)>=-4*10^14|v|^2>=-10^14 g(v,v), and in particular Ric>=K g for K=-10^45. The ordinary Bochner identity on this four-dimensional smooth compact manifold gives

    Gamma_2(f)=|Hess_g f|^2+Ric(grad_g f,grad_g f)
       >=K Gamma(f)+(Delta_g f)^2/4.

Smooth-core quantities from the finite-volume generator also converge to these ones: centered Taylor expansion gives L_n f->Delta_g f, Gamma_n(f,g)-><grad_g f,grad_g g>, and Gamma_2,n(f)->Gamma_2(f) uniformly for smooth periodic f,g. A direct quantified version follows by expanding the finite expression (6.1) to fourth order in h; the order-zero and odd-order cancellations are exact and the remainder is bounded by h times a finite polynomial in coefficient derivatives through order five and f derivatives through order six. These derivative bounds are computable from the displayed smooth extension. Integrated convergence follows by the explicit density quadrature bound. This is an additional consistency check; the dimension-four limit conclusion already follows from the exact smooth identification and Ricci estimate above.

The smooth compact torus is complete, is a length space, has full support, finite volume, quadratic Cheeger energy, and the Sobolev-to-Lipschitz property. The standard finite-dimensional BE characterization (or the smooth Ricci characterization of RCD) gives

    (T^4,d_g,H_g^4) is noncollapsed RCD*(K,4), K=-10^45.

This is the discrete-to-continuum certificate required by Theorem I.3i on this actual warped branch. It is not a claim that every arbitrary family satisfying only graph BE(K,infinity) has a four-dimensional RCD limit. The literal global **finite-dimensional graph** BE(K,4) premise is in fact false uniformly on this family, as the following explicit test proves. In an open b=1 region put f(0)=0, f(+/-e_i)=1, and f=2 at all other nonzero radius-two vertices. With b_0=1/16, b_1=b_2=b_3=1/(4pi^2) and B=sum_i b_i, one obtains Gamma=h^-2 B, Lf=2h^-2 B, and Gamma_2=2h^-4 sum_i b_i^2. Hence BE(K,4) would require K<-(1/20)h^-2. The strict bound follows by substituting pi<22/7 into [2sum_i b_i^2-B^2]/B. Thus no n-independent K can work. The separately verified smooth dimension-four limit remains valid, but it does not supply a literal finite BE(K,4) bound. That stronger finite premise would require a different discrete-curvature realization.

Restoring the common physical length ell multiplies g by ell^2 and m by ell^4, divides L, Gamma, all spectral gaps and K by ell^2, and leaves the dimension and noncollapse statement unchanged. The same slab D, capacity volume and source operator normalization must be used by the stress/backreaction construction.

## 8. Uniformity for a source-selected finite candidate family

The proof does not require every finite member to use the exact limiting coefficient. It extends to a sequence of smooth **diagonal** metrics G^(n), with one common positive ellipticity interval and common coefficient/measure C^2 bounds, provided G^(n) converges in C^2 to the displayed G. Use the actual candidate's integrated edge lengths, capacity probability, measure density, and midpoint coefficients in all four finite objects. Sections 3–6 then have the same constants. In particular the curvature proof uses only those common bounds and the reflection identity, not the special exponential formula.

If ||G^(n)-G||_operator,infinity<=zeta_n and both are >=4I, norm comparison along each curve gives a relative length error at most zeta_n/8 (or the safe bound zeta_n/4 when no smallness threshold is imposed). This adds at most 5zeta_n to the global metric distortion under diam_g<=20. Uniform convergence of the densities adds their sup-norm error to the measure quadrature error. If max_i||c_i^(n)-c_i||_infinity<=xi_n, the difference between the two discrete energies is bounded by (xi_n/c_min) times either coercive reference energy, up to replacing c_min by the common class lower bound. The liminf and recovery proofs therefore remain valid. Compactness and smooth approximation use only the same class bounds.

This uniformity is sufficient to compose the geometry certificate with a separately proved source-equation/initial-data residual selector whose accepted diagonal candidates converge to G. It does **not** itself prove hyperbolic uniqueness, residual stability, existence of finite accepted candidates, or source selection. Nor does it extend the axis generator to an off-diagonal metric: that would require a different consistent positive stencil and a new curvature argument. Bounds on the whole candidate class, including its periodic extension, must be supplied before invoking the uniform statement.
