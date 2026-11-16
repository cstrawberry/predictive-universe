# The actual finite spacetime slab and smooth receipts

This part of the warped geometry of `../CURVED_GEOMETRY_BE_MOSCO_CERTIFICATE.md` (the curved certificate) gives the finite retained-domain construction on the source slab, and installs a physical smooth receipt coefficient in place of the nonsmooth floor max(1,x). The warped metric, source slab and length unit are those of the curved certificate. The flat comparison lemma is not used here.

The geometric conclusion required by Theorem I.3i is obtained from the graph BE(K,infinity) bound, the measured-GH/Mosco limit and the direct smooth noncollapsed RCD(K,4) proof of the curved certificate, not from a finite BE(K,4) bound. The finite BE(K,4) counterexample in §7 of the curved certificate rules out only that finite route, not the continuum conclusion. Nothing below asserts finite vertex spaces are length spaces or turns infinity into four in a graph inequality.

## 1. One common index, exact cell faces, and the capacity measure

Keep R_n=80*2^n, N_n=8*10^28 R_n^3, h=1/N, rho=Rh and the coefficients G, mu, c_i of the curved certificate. The **whole ambient network** uses the uniform phase-shifted grid

    y(j)=((j_0+1/2)h,j_1h,j_2h,j_3h), j in (Z/NZ)^4.

Every ambient argument of the curved certificate is uniform in its base point and grid phase, so the same curvature, metric, Mosco and global estimates apply on this grid. This is one consistently shifted ambient family, not a second collection of domain nodes unrelated to the retained graph.

In physical coordinates the node is

    t_j=4(j_0+1/2)h, x_j=2pi j_1h,
    z_2,j=2pi j_2h, z_3,j=2pi j_3h.

Let M=N/4 and retain

    D_n={j:M<=j_0<2M, 0<=j_1,j_2,j_3<N}.

Its cardinality is M N^3. Its cell is [j_0h,(j_0+1)h] in time and the three periodic centered intervals [j_ih-h/2,j_ih+h/2). These cells partition exactly

    D_y=[1/4,1/2] times T^3,
    D=[1,2] times (R/2pi Z)^3.

The endpoint surfaces are **cell faces**, not ghost nodes. N divisible by four makes both faces exact. Every coordinate cell has y-volume h^4 and physical coordinate volume 4(2pi)^3 ell^4 h^4. There are no omitted half cells or double-counted boundary cells.

At this same node, use q_j=b(t_j,x_j)^3/27 and the actual flagged native capacity C_j=q_j ln4 from the common-source adapter (`common_source/CAPACITY_VOLUME_AND_OPERATION_MODES.md`). The domain measure is the literal restriction of the ambient capacity measure,

    m_n^D(j)=ell^4 mu(y(j))h^4
       =[4(2pi)^3 ell^4 h^4] * 27 C_j/ln4.

Its total mass is a quadrature approximation to volume_g(D), not incorrectly declared equal to that volume at finite n. In contrast, the sum of coordinate cell volumes is **exactly** ell^4(2pi)^3. Normalized means divide by the actual finite total m_n^D(D_n).

The total indexing oracles in `slab_family.py` map local slab index a into j_0=M+(a mod M), j_1=floor(a/M) mod N, and so on. The same j determines the ambient key ID, position, measure, midpoint coefficients, material field, stress, expansion, readout and edge receipt. There is no independent resampling.

Use the ambient propagation metric restricted to D_n when comparing this retained averaging subset with D carrying the ambient distance. This does not claim that D is geodesically convex or itself RCD. Its Neumann Sobolev energy is specified separately below, as is standard for a domain inside a smooth RCD manifold.

## 2. A differentiable physical receipt, with its exact added error

For each actual propagation edge, let x=ell_g(y,s)/rho and epsilon_n=1/R. Replace max(1,x) by the physically installed coefficient

    F_epsilon(x)=(1+x+sqrt((x-1)^2+epsilon^2))/2.

Then

    max(1,x)<=F_epsilon(x)<=max(1,x)+epsilon/2,
    0<F'_epsilon(x)<1,
    F''_epsilon(x)=epsilon^2/[2((x-1)^2+epsilon^2)^(3/2)]
                   <=1/(2epsilon).

Its full native receipt/stock energy coefficient is this exact computable smooth real. It has no derivative kink at the many exact x=1 edges. The n-independent weight bounds are 1<=w_epsilon<=41.

If d_n is the max-floor metric of the curved certificate and d_n^epsilon the smoothed one, positivity of every max-floor weight gives

    d_n<=d_n^epsilon<=(1+epsilon/2)d_n.

With alpha_n and beta_n from (3.1) of the curved certificate, put

    alpha_n^epsilon=(1+epsilon/2)(1+alpha_n)-1,
    beta_n^epsilon=(1+epsilon/2)beta_n.

Then d_g<=d_n^epsilon<=(1+alpha_n^epsilon)d_g+beta_n^epsilon. The added uniform metric error is at most (epsilon/2)[20(1+alpha_n)+beta_n]. Replace the max-floor mGH distortion 20alpha_n+beta_n by 20alpha_n^epsilon+beta_n^epsilon; all limits are unchanged. Local volume/PI constants may be enlarged once by the factor 3/2 since epsilon<=1; no n-dependent constant is needed. The axis diffusion coefficients and energies are unchanged by this separate receipt smoothing.

For an arbitrary metric variation H along the edge, with G>=4I and v=hs, differentiation of the actual length gives

    Dx[H]=(1/(2rho)) integral (v^T H v)/sqrt(v^T G v),
    D^2x[H,J]=-(1/(4rho)) integral
              (v^T H v)(v^T J v)/(v^T G v)^(3/2).

Since |v|<=2rho,

    |Dx[H]|<=||H||_infinity/2,
    |D^2x[H,J]|<=||H||_infinity||J||_infinity/16,
    |Dw_epsilon[H]|<=||H||_infinity/2,
    |D^2w_epsilon[H,J]|
       <=[1/(8epsilon)+1/16]||H||_infinity||J||_infinity.  (2.1)

These are the actual two-sided material derivatives, not one-sided derivatives of max. The constructor supplies certified rational intervals for x,F,F',F'', and for the length variations with constant symmetric edge perturbations. In (2.1), H varies the dimensionless coordinate metric G; a variation of the full physical metric ell^2G is divided by ell^2 before applying the bound. Piecewise-constant perturbations are handled by splitting the same integral at their finitely many change points. General smooth perturbations obey (2.1).

For the two full native-eight stock/receipt factors of the edge adapter (`common_source/NATIVE_EDGE_COST_AND_CHANNEL.md`) with spectra theta*w*(0,...,7), smoothing changes their joint operator by at most 7theta epsilon per edge. The exact first-variation norm of the pair is at most 7theta||H||. Summing these bounds with the **actual** number of charged factors and the source's price scales gives the common source error; it is not omitted on the ground that epsilon is small. Smoothing alone does not prove that a growing total apparatus has vanishing stress. This section supplies the per-factor norm/derivative increments needed by that proof.

## 3. The actual reflecting finite-volume form

On D_n retain the eight-coordinate diffusion policy, but delete a time jump if it would leave D_n. Spatial jumps remain periodic. For every retained oriented axis edge j->j+e_i set

    a_+(j)=c_i(y(j)+he_i/2)/(mu(y(j))h^2 ell^2),
    a_-(j+e_i)=c_i(y(j)+he_i/2)/(mu(y(j+e_i))h^2 ell^2).

No jump, ghost state or reentry channel crosses t=1 or t=2. These rates are nonnegative and satisfy detailed balance for m_n^D. Their sum remains bounded by 432/(ell^2 h^2), so the same paid finite-tick construction works after the length rescaling. The physical boundary rule is zero **diffusion-policy** flux, which is exactly the natural reflecting/Neumann form.

Let L_n^D be this generator, Gamma_n^D its actual carré du champ, and

    E_n^D(f)=-(1/2)<f,L_n^D f>_(m_n^D)
      =(ell^2 h^2/2) sum_(internal unoriented axis edges)
          c_i(y+he_i/2)|f(y+he_i)-f(y)|^2.              (3.1)

This equals (1/2)integral Gamma_n^D dm_n^D. Its normalized version divides by m_n^D(D_n), and converges to normalized standard Cheeger energy (1/2)<|grad_g f|^2>_D. The graph is connected, so its kernel is exactly the constants. No uniform BE bound on the reflecting boundary graph is asserted or needed; the ambient network carries the global BE certificate, while the averaging domain needs a positive Neumann gap.

## 4. Uniform finite Neumann gap with the correct normalization

Let epsilon_0=1/100 denote the fixed source inhomogeneity, distinct from the receipt smoothing epsilon_n. On the entire physical slab and every face midpoint,

    b_min=e^-epsilon_0, b_max=2e^(2epsilon_0),
    b_max^3/b_min^3=8e^(9epsilon_0), b_max^2=4e^(4epsilon_0).

The unweighted product finite-volume Laplacian has M centered time nodes with spacing 1/M=4h and N periodic nodes per spatial circle with spacing 2pi/N. Its nonzero time eigenvalues are 4M^2 sin^2(pi k/(2M)); the first is >=4. Its first spatial eigenvalue is

    nu_N=(N^2/pi^2)sin^2(pi/N), 4/pi^2<=nu_N<=1,
    nu_N->1.

The exact product Neumann gap is therefore nu_N. Weighted variance is bounded above by b_max^3 times the uniform variance, and (3.1) is bounded below by b_min^3/b_max^2 times the corresponding reference gradient energy. Consequently, for every f,

    Var_(normalized m_n^D)(f)
       <= [32e^(13epsilon_0)ell^2/nu_N]
            <Gamma_n^D(f)>_(m_n^D).

With E_n^D normalized as **one half** of the gradient energy, the finite Cheeger-ratio gap satisfies

    lambda_1,n^D >= nu_N/[64e^(13epsilon_0)ell^2]
                 >=1/[16pi^2 e^(13epsilon_0)ell^2]>0.  (4.1)

No factor of two is hidden. In particular this supplies the finite counterpart of the source's continuum bound lambda_1(D)>=1/[64e^(13epsilon_0)ell^2]. The latter follows directly by the same continuous comparison, or from the form convergence and compactness below. The reflecting stencil has the exact intended boundary condition, rather than a torus gap relabeled as a domain gap.

## 5. Domain Mosco convergence, including the boundary

Interpolate a node function constantly on the **exact** cells of Section 1. On D_y these cells tile a fixed rectangle, so there is no moving-domain or symmetric-difference assumption. Their density error is uniformly bounded by h||Dmu||. The exact isometric variant multiplies each constant by [mu(y)h^4/integral_cell mu]^(1/2), a factor converging uniformly to one.

For the liminf, bounded E_n^D controls each coordinate forward difference on its internal edges by uniform ellipticity. Extend those differences by zero on the boundary half-layers they do not cover. Against compactly supported interior tests, discrete summation by parts identifies every weak limit with the distributional derivative of the limiting function. Hence that function lies in H^1(D_y), and weighted weak lower semicontinuity gives

    Ch_D(f) <= liminf E_n^D(f_n),

with unnormalized energies on both sides and the physical ell factors restored. The missing half-layers have thickness h/2 at each end; no derivative constraint or zero trace is imposed on f at either boundary.

For recovery, sample any smooth f on the closed slab, periodic spatially. Its spatial energy quadratures cover the whole slab. Its time-edge dual cells cover [1/4+h/2,1/2-h/2] times T^3; the omitted layers have total y-volume h and their smooth energy tends to zero. Midpoint differences and quadrature therefore yield E_n^D(f)->Ch_D(f). Smooth functions up to the boundary are dense in H^1 of this rectangle, with no homogeneous Neumann restriction. A diagonal argument gives recovery for every H^1 function. Together these are the full weak-liminf and strong-recovery Mosco assertions for the reflecting form.

For compactness, reflect the M time-node values evenly at both endpoint **faces**, repeat the resulting 2M-periodic array twice to obtain N time nodes, and keep the spatial coordinates periodic. Adjacent reflected values across each face agree, so the extension adds no boundary jump. Its unweighted L^2 norm and nearest-neighbor energy are exactly four times those on D. Uniform coefficient bounds and the ambient Fourier compactness argument then give compactness of bounded-domain-energy families. Thus the Neumann gaps converge to the true domain gap, and the fixed-mean resolvents converge. This proves domain passage, rather than assuming it from ambient convergence.

An explicit smooth energy recovery bound is available. Put q_i=c_i|partial_i f|^2 in y coordinates, F_i=||partial_i f||, T_i=||partial_i^3 f|| and d_i=h^2 T_i/24. Central Taylor expansion at each internal face gives |D_i^h f-partial_i f(face)|<=d_i. For ell=1,

    |E_n^D(f)-Ch_D(f)|
      <= (h/8)sum_i Lip(q_i)+(h/2)||q_0||
          +(c_max/8)sum_i[2F_i d_i+d_i^2].          (5.1)

The first term is cell quadrature on a domain of y-volume 1/4, the second is the two missing time half-layers, and the last is finite differencing. Multiply by ell^2 for unnormalized physical energies. Normalizing by finite volume adds the separately bounded mass quadrature error; it is not silently discarded.

## 6. Exact common-index stress, expansion and observable map

At the same node j put

    Phi_j=(t_j,x_j,z_2,j,z_3,j),
    b_j=t_j exp(epsilon_0 t_j cos x_j),
    H_j=1/t_j+epsilon_0 cos x_j,
    theta_j=3H_j/ell, sigma_j=0.

The rods are circle-valued. Their registered winding-aware coordinate differences are exactly their coordinate increments even across a periodic seam; subtracting two principal-value labels would be wrong.

Use the explicit source Ricci components R_00,R_01,R_11,R_22=R_33 of the stress certificate (`stress/EXACT_ACTION_CONGRUENCE_ELLIPTIC_JOIN.md`) at (t_j,x_j). Set

    Rbar_j=-R_00+(R_11+R_22+R_33)/b_j^2,
    T_hat00=(R_00+Rbar_j/2)/(kappa ell^2),
    T_hat01=T_hat10=R_01/(kappa ell^2 b_j),
    T_hatii=(R_ii/b_j^2-Rbar_j/2)/(kappa ell^2).

All other frame entries are zero. This is the **same actual variational tensor** sampled in the source's declared synchronous orthonormal frame. In particular its density and energy-rate outputs are the source's formulas (12)–(13), not a second independent stress table. `source_outputs_iv` evaluates these functions with certified rational outward intervals from the common integer index. It also evaluates theta, r and the zero shear.

Let Q_n(f)=h^4 sum_(D_n)mu(y)f(y), M_n=Q_n(1), and M=integral_Dy mu. For every Lipschitz source output f,

    |Q_n(f)-integral_Dy mu f| <= (h/4)Lip(mu f),
    |M_n-M| <= (h/4)Lip(mu),
    |<f>_n-<f>_D| <= (h/32)[Lip(mu f)+||f||Lip(mu)]. (6.1)

The last bound uses the actual M_n>=32/4=8. It applies componentwise to tensors and to f^2 and products. A readout error ||f_read-f_sample||<=zeta adds zeta to the mean error and at most 4||f||zeta+2zeta^2 to the variance error. Constant interpolation also has ||I_n f-f||_infinity<=h Lip(f). All constants are finite and computable from the analytic source formulas on this compact slab; a fixed C^s candidate bound makes them uniform.

Consequently the sampled tensor means/covariances, expansion means/variances, shear energy and literal backreaction

    Q_D,n=(2/3)Var_n(theta)-2<sigma^2>_n

converge along this **same** n to their source values. In this branch sigma=0 at every exact sample and Q_D,n>0 already whenever M>=2, because theta varies between time nodes of the same spatial column. Source tensor variance is also positive at finite levels with N divisible by four: the two x nodes pi/2 and 3pi/2 have equal positive weights and opposite nonzero T_hat01. Thus neither nontriviality is inferred only from a numerical limit.

## 7. The actual elliptic source and its nonzero conormal data

The source certificate proves the covector identity dtheta=W, where W is constructed from the actual momentum j and energy-density rate r (or the source-only alternative bound). Pull it into the same y coordinates. On every retained axis edge define the actual source flux sample by its line average

    W_(j,i)=(1/h)integral_0^h W_i(y(j)+s e_i) ds.

Because dtheta=W **on this source solution**, this equals [theta_(j+ei)-theta_j]/h. This equality is derived from the source, not a definition of an arbitrary Poisson variable as expansion. Hence for every finite test v,

    2 E_n^D(theta,v)
       =ell^2 h^4 sum_(internal edges)c_i(face) W_(j,i) D_i^h v.  (7.1)

The measured mean of theta fixes its constant. Connectivity and (4.1) make it the unique finite weak solution with that mean. The exact line averages are computable from the same analytic r/j source; for the explicit branch they reduce to differences of 1/t and cos x.

Do not mistake the reflecting **diffusion-policy** form for homogeneous physical conormal data of theta. The actual continuum theta has nonzero conormal derivative on t=1,2. The functional on the right of (7.1) converges to integral <W,dv>, whose integration by parts contains exactly that source conormal term. If encoded as nodal -L_n^D theta, its boundary entries may grow like 1/h; only the weak H^-1 functional is claimed uniformly controlled by ||W||_2. No false uniform L^2 bound for a boundary delta source is used.

Cauchy–Schwarz in (7.1), the Neumann gap, and the energy/flux quadrature estimate yield the finite source-control inequality with the same source-variance/rate bounds and explicit vanishing quadrature/readout errors. In particular, one can carry the source's conservative continuum certificate

    B_D^ell=20000[32e^(13epsilon_0)ell^2] kappa^2 Var_D(T)

through (6.1), (5.1) and (4.1), using its finite factor nu_N^-1 and adding the displayed energy/variance quadrature errors. For a completely explicit error ledger, let eta_E,n be the right side of (5.1), with the physical ell^2 factor, let delta_M,n=ell^4 h Lip(mu)/4, and set M_min=8ell^4. The source supplies

    G_max=[9+9 epsilon_0^2 exp(2epsilon_0)]/ell^4

as an upper bound for |grad_g theta|^2. Define

    delta_G,n=2 eta_E,n/M_min+G_max delta_M,n/M_min.

Then |<Gamma_n^D(theta)>_n-<|grad_g theta|^2>_D|<=delta_G,n. Let delta_T,n be the sum of the componentwise tensor-variance errors obtained from (6.1), including any certified readout error. Put P_D=32 exp(13epsilon_0)ell^2. The finite entirely source-only certificate is

    B_n^ell=(P_D/nu_N)
       [20000 kappa^2 Var_n(T)+delta_G,n+20000 kappa^2 delta_T,n].

The exact inequality lambda_1,n^-1 E_n^D(theta)/m_n^D(D_n)<=B_n^ell follows from (4.1) and the source gradient bound. Every term has dimension L^-2 after multiplication by P_D; delta_G has dimension L^-4 and delta_T has dimension L^-8. These positive explicit errors vanish, and B_n^ell tends to the source certificate. Optional nonnegative BE/transfer budgets may be added, but none is manufactured from a missing conversion factor.

This does not identify a cosmological dilution rate with external injected power. No horizon-transfer contribution is needed to obtain (7.1).

## 8. Uniform selected-candidate extension and exact scope

Let the source selector (`common_source/FINITE_SOURCE_SELECTOR.md`) admit diagonal warped candidates B_n=log b_n on the same domain/operational extension, with common positive b bounds, common C^s bounds for sufficiently large fixed s (s>=6 suffices for every consistency calculation here), and convergence B_n->B_* in C^2. Keep the one grid, exact slab faces, reflecting rule and source winding conventions fixed. All measure, metric, smooth receipt, Neumann coercivity, compactness and Mosco arguments above are uniform. Replace the explicit b_min,b_max in (4.1) by the common candidate bounds, or by sharper branch bounds where these are proved. Smooth coefficient and source-output convergence then pass every expression in Sections 5–7 to the same selected source. For candidates with material histories different from the exact identity-field witness, the actual variational tensor of that candidate action and the actual congruence must be evaluated before taking the limit; the witness formulas in `source_outputs_iv` are not substituted for those candidate outputs. Their required uniform material-history bounds and convergence are separate premises of the source selector.

This uniform statement does not prove the source-equation uniqueness or the finite selector of `common_source/`. It does not allow an off-diagonal metric under an unchanged axis stencil. It does not claim the physical Lorentzian field equation outside the retained slab. It supplies the finite-domain and smooth-material-coefficient part of that common join.
