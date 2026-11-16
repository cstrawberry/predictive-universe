# Appendix N: Prediction Relativity and the Unified Cost of Transgression

## N.1 Master Principle: The PCE Potential

On a registered finite-resolution branch, the PU variational grammar nominates a **PCE Potential** $V$ that balances declared operation and interaction costs against predictive benefit. Definition D.1 is a branch-indexed potential schema. For a single MPU $i$ interacting with its local environment, one admitted decomposition is

$$
V_i = \underbrace{V_{op}(i)}_{\text{Operational Cost}} + \underbrace{V_{\mathrm{prop}}(i)}_{\text{Propagation Cost}} - \underbrace{V_{\mathrm{benefit}}(i)}_{\text{Predictive Benefit}}
\tag{N.1}
$$

where each term is a rate only after the branch supplies a common unit and metering record:
*   **$V_{op}$**: The declared cost of maintaining and operating the MPU's internal complexity $C_i$, represented by the branch functions $R(C_i)$ and $R_I(C_i)$ [Def. 3].
*   **$V_{\mathrm{prop}}$**: The declared cost of predictive links with neighbors, including any registered information-loss term and, on a physical reset branch, an implementation cost satisfying $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)$. The structural log-cardinality $\varepsilon_0=\ln2$ is not itself a heat or power without the reset and unit bridges [Appx. C, D].
*   **$V_{\mathrm{benefit}}$**: A branch reward functional built from the registered Predictive Performance record $PP$ [Def. 7, D.1].

Equation D.8 nominates the stochastic model
$$
dx_t=-\eta(x_t)\operatorname{grad}_gV(x_t)\,dt+\sigma(x_t)\,dW_t,
\qquad \sigma\sigma^*=2D,
$$
only on a branch fixing a finite-dimensional smooth state manifold $X$ (a vector space is allowed), a Riemannian metric $g$, tangent mobility $\eta_x:T_xX\to T_xX$, Brownian dimension $m$, a filtered probability space with an $m$-dimensional Brownian motion, a diffusion factor $\sigma_x:\mathbb R^m\to T_xX$ satisfying $\sigma_x\sigma_x^*=2D_x$, coefficient domains and regularity, boundary behavior, and either a Stratonovich convention or an Itô convention with the required connection/chart data. A common unit/metering record is also required. If a reset entropy enters a cost term, a registered reset frequency is required to make an entropy rate; physical power additionally requires the declared temperature/energy conversion. Theorem N.1a supplies, on the complete quadratic package, a unique strong solution, the unique global minimizer $b$ as the globally exponentially attracting equilibrium of the deterministic flow, convergence of every finite-second-moment law to the invariant law $\mathcal N(b,\beta^{-1}H^{-1})$, and concentration at $b$ in the low-noise limit $\beta\to\infty$; other packages require the separate existence, stability, ergodicity, low-noise, or attractor certificates stated in Appendix D. The principles below are therefore conditional inputs to this branch model.

<a id="theorem-n1a-complete-anisotropic-quadratic-pce-diffusion-package"></a>**Theorem N.1a (Complete Anisotropic Quadratic PCE Diffusion Package).** Fix $d\ge1$, the domain $X=\mathbb R^d$ with Euclidean metric and no boundary, $b\in\mathbb R^d$, symmetric positive-definite matrices $H,M\in\mathbb R^{d\times d}$, and $\beta>0$. Give $V$ the common declared cost unit and choose the time unit so that $MH$ has units of inverse time. Set
$$
V(x)=\frac12(x-b)^{\mathsf T}H(x-b),
\qquad
dX_t=-MH(X_t-b)\,dt+\sqrt{2\beta^{-1}M}\,dW_t.
\tag{N.1a.1}
$$
This is Equation D.8 with $g=I$, $\eta=M$, $D=\beta^{-1}M$ and the Itô convention. It has the following complete conclusions.

1. For every square-integrable initial law independent of $W$, Equation (N.1a.1) has a unique nonexplosive strong solution.
2. The deterministic mobility-gradient flow $\dot x=-MH(x-b)$ is globally defined, and $b$ is the unique global minimizer of $V$ and its globally exponentially attracting equilibrium.
3. With
   $$
   A=M^{1/2}HM^{1/2},
   \qquad \lambda_*:=\lambda_{\min}(A)>0,
   \tag{N.1a.2}
   $$
   the exact transformed solution $Y_t=M^{-1/2}(X_t-b)$ is
   $$
   Y_t=e^{-At}Y_0+\sqrt{2\beta^{-1}}
   \int_0^te^{-A(t-s)}\,dW_s.
   \tag{N.1a.3}
   $$
4. The unique invariant law is
   $$
   \pi_\beta=\mathcal N\!\left(b,\beta^{-1}H^{-1}\right),
   \tag{N.1a.4}
   $$
   and synchronous coupling gives, for the Wasserstein distance induced by

   $$
   \|x\|_{M^{-1}}:=\|M^{-1/2}x\|_2,
   $$

   $$
   W_{2,M^{-1}}(\mu P_t,\nu P_t)
   \le e^{-\lambda_*t}W_{2,M^{-1}}(\mu,\nu).
   \tag{N.1a.5}
   $$
   Hence every finite-second-moment law converges to $\pi_\beta$, and the stationary process obeys the ergodic time-average theorem for every $f\in L^1(\pi_\beta)$.
5. In the low-noise limit, $\pi_\beta\Rightarrow\delta_b$ as $\beta\to\infty$.

*Proof.* The coefficients are globally Lipschitz, so the Itô existence and pathwise-uniqueness theorem gives item 1. Positive definiteness of $H$ gives the unique minimizer. Applying $M^{-1/2}$ gives $dY_t=-AY_tdt+\sqrt{2\beta^{-1}}dW_t$, and variation of constants gives (N.1a.3). Since $A\succeq\lambda_*I$, the deterministic flow contracts by $e^{-\lambda_*t}$. The Gaussian covariance $\Sigma=\beta^{-1}A^{-1}$ solves $A\Sigma+\Sigma A=2\beta^{-1}I$, so the Gaussian law is invariant. Transforming back gives covariance $\beta^{-1}H^{-1}$.

For any invariant probability law of $Y$, with no moment assumption, its characteristic function satisfies
$$
\phi(u)=\phi(e^{-At}u)
\exp\!\left[-\frac1{2\beta}u^{\mathsf T}A^{-1}(I-e^{-2At})u\right].
$$
As $t\to\infty$, continuity at zero gives $\phi(e^{-At}u)\to1$, proving uniqueness of the displayed Gaussian invariant law. Under synchronous coupling the stochastic integrals cancel, and the contraction of $e^{-At}$ proves (N.1a.5) for finite-second-moment laws by taking infima over initial couplings. In particular these laws converge in the stated Wasserstein distance.

In the stationary Gaussian process, cross-covariances of two finite time blocks separated by time $t$ tend to zero exponentially. Their joint Gaussian laws therefore converge to the product laws. Approximation by bounded cylinder functions extends this mixing property to the stationary path law, which is consequently ergodic. The continuous-time ergodic theorem then gives the stated time-average conclusion for every $f\in L^1(\pi_\beta)$. Finally, the stationary covariance tends to zero as $\beta\to\infty$, proving $\pi_\beta\Rightarrow\delta_b$. ∎

<a id="definition-n1b-arctan-perspective-and-response-map-for-the-initialized-two-port-source"></a>**Definition N.1b (Arctan Perspective and Response Map for the Initialized Two-Port Source).** The source N-OU-LOOP-2 below consumes the following existing geometric context/response/update construction, with its own two-port coefficients $B=I$ and $\sigma$ as specified in Theorem N.1c.

On $\mathbb{C}^8$ let $A_1=E_{12}-E_{21}$ and $A_2=E_{34}-E_{43}$. Put

$$
\begin{aligned}
&\theta_j(x)=\arctan x_j,\quad U(x)=\exp[\theta_1(x)A_1+\theta_2(x)A_2],\\
&s(x)=(P_1(x),\ldots,P_8(x)),\quad P_i(x)=U(x)|i\rangle\langle i|U(x)^\dagger.
\end{aligned}
$$

Each projector is an actual labeled rank-one measurement context of the retained Hilbert/instrument branch, not an arbitrary coordinate renamed as a context. A1,A2 commute. In each active 2x2 block,

$$
P_{\mathrm{first}}(x)=1/(1+x_j^{2}) \begin{bmatrix} 1 & -x_j\\ -x_j & x_j^{2} \end{bmatrix}.
$$

Consequently $x_j=-(P_{\mathrm{first}})_{12}/(P_{\mathrm{first}})_{11}$, and the denominator is strictly positive for every finite $x$. Thus the map is globally injective on $\mathbb{R}^{2}$ onto its open two-dimensional submanifold of the complete flag space. Its inverse is smooth there. There is no artificial reflecting or absorbing boundary. OU paths are continuous and bounded on each compact time interval almost surely, so their image never hits the chart edge at finite time.

For each active block, the source admits preparations $|\mathrm{first}\rangle$ and $(|\mathrm{first}\rangle+|\mathrm{second}\rangle)/\sqrt{2}$, followed by the labeled projector $P_{\mathrm{first}}(x)$. Their probabilities are

$$
r_j=1/(1+x_j^{2}),\quad q_j=(1-x_j)^{2}/[2(1+x_j^{2})].
$$

They give the exact response inverse $x_j=(1-2q_j)/(2r_j)$. Therefore distinct voltage states have distinct finite preparation/measurement response tables. These are standard positive normalized projective instruments on the existing $\mathbb{C}^8$ branch. No Born law is calibrated from the desired diffusion; it is consumed as an accepted independent branch input. The inverse is an equality of exact operational probabilities, not an assertion that finite samples estimate arbitrary large $x$ with uniform accuracy. Statistical precision degrades near the chart edge and is not concealed.

For any pair of source endpoints x,y, apply the actual control unitary

$$
U(y)U(x)^\dagger=\exp[\sum_j(\arctan y_j-\arctan x_j)A_j].
$$

Over a declared control interval $\delta>0$ this is generated by the self-adjoint Hamiltonian

$$
H_{x,y}=i\hbar\sum_j(\arctan y_j-\arctan x_j)A_j/\delta.
$$

It maps every labeled projector $P_i(x)$ to $P_i(y)$. The update uses the source endpoint and is an external controlled apparatus update; it is not an autonomous channel depending only affinely on a density matrix.

For a source grid $t_0<\dots<t_n$, feed the exact circuit endpoints $X_{tj}$ into these controls. The full finite context history is exactly $(s(X_{t_0}),\dots,s(X_{t_n}))$, conditional on every source history. The Markov kernel on the open chart is

$$
K_t(s(x),A)=P_t(x,\{y:s(y) \in A\}).
$$

The Chapman-Kolmogorov equation follows from bijective change of variable. Every admitted bounded Borel finite-history response agrees after pullback. Refining the grid gives the continuous path map $s(X)$, because $\arctan$ and the matrix exponential are continuous and locally Lipschitz. One must distinguish an endpoint protocol (which can wait for the control interval) from the ideal zero-latency continuous controller limit; a finite control duration is not secretly ignored. The continuous ideal limit is specified directly by the Stratonovich controlled unitary equation

$$
\begin{aligned}
dU_t &= \sum_j A_j U_t \circ d\theta_j(X_t),\\
d\theta_j(X_t) &= (1+X_{j,t}^{2})^{-1} \circ dX_{j,t}.
\end{aligned}
$$

Commutation integrates it exactly to $U(X_t)$. Ito conversion gives

$$
\begin{aligned}
d\theta_j &= [(-B(X-b))_j/(1+X_j^{2}) - X_j(\sigma\sigma^{\mathsf T})_{jj}/(1+X_j^{2})^{2}]\,dt\\
&\quad + (1+X_j^{2})^{-1} \sum_l \sigma_{jl}\, dW_l.
\end{aligned}
$$

The displayed second term is the exact chart correction; omitting it is an adversarial negative control. This is the formal controlled-white-source realization of all time points. It requires the stated ideal limiting source, not experimental zero latency.

<a id="theorem-n1c-initialized-minimum-mpu-same-state-quadratic-cost-and-response-faithful-two-port-ou-source"></a>**Theorem N.1c (Initialized Minimum MPU, Same-State Quadratic Cost and Response-Faithful Two-Port OU Source).**

#### 1. Primitive physical technology and declaration order

First register a source technology, without referring to $C_P$, $C_{\mathrm{op}}$, an MPU or a desired minimizer:

- Two capacitor storage ports have $C_{\mathrm{ph}}=C_0\operatorname{diag}(2,3)$.
- Resistor ports connect each node to its specified constant voltage reference $v_0b$, $b=(1,1)$, with $G_{\mathrm{ph}}=g_0\operatorname{diag}(2,3)$. There is no inter-node resistor. Set $t_0=C_0/g_0$.
- The independent two resistor-current sources have integrated covariance $2k_{B}T\,G_{\mathrm{ph}}\,dt_{\mathrm{ph}}$, supplied by the ideal classical thermal-current branch. Equivalently this is the Brownian limit of the explicitly registered independent port-current impulses; no finite-bandwidth device is asserted to have exact white spectrum.
- A physical forecast/acquisition board has three independently installed enable switches: $a$ for a writable storage interface, $b_{f}$ for the affine forecast service, and $c_{v}$ for the outcome acquisition/comparison/writeback service. Each enable has a separately readable configuration register. There are exactly eight configurations. There is no programmable general-purpose CPU or alternate wiring port in this technology. The service is a fixed ideal analog arithmetic/instrument branch; its finite action table and tariffs are stated below.
- The board clock is $\Delta=\ln(2)t_0$. The reference source recipe, capacitances, conductances, temperature and clock are the same in every switch configuration. Initial storage is the physical voltage $v_0b$, not an arbitrary unknown real input.
- Each source occurrence retains the voltage trajectory, terminal charge, completed forecast, acquired endpoint, innovation, comparison record, writeback record, configuration and clock. These are measured on the specified ideal nonloading instrument branch. No historical or laboratory registration is asserted.

These source primitives define the technology before the predictive task or minimization is computed. An ideal analog source with finite-source approximations is admitted as a formal-realization convention, rather than as a hardware-experiment requirement.

#### 2. Derive the OU coefficients from those ports

In normalized voltage $x=z/v_0$, source time $t=t_{\mathrm{ph}}/t_0$ and energy $\theta=k_BT/(C_0v_0^{2})$, Kirchhoff balance gives

$$
\begin{aligned}
C\,dx&=-C(x-b)\,dt+\sqrt{2\theta C}\,dW,\quad C=\operatorname{diag}(2,3),\\
dX&=-(X-b)\,dt+\sqrt{2\theta C^{-1}}\,dW.
\end{aligned}
\tag{N-loop.1}
$$

A concrete finite source approximant makes the white-source convention explicit. At each source microtick $h$, two independent fresh fair sign sources deliver charge impulses $q_j=\pm\sqrt{2\theta C_jh}$, followed by the exact passive capacitor relaxation for duration $h$. Each fair source may be realized by its own freshly prepared $I/2$ qubit and $Z$ readout driving the corresponding signed current pulse; these are new independent supplies, not M-01's seven-bit pulse source. The current-pulse Hamiltonian/control and charge unit are registered by the capacitor port law, and no source bit is identified with reset heat. The voltage recursion is $X_{m+1}-b=e^{-h}[X_m-b+\sqrt{2\theta C^{-1}h}\,\epsilon_m]$. For every fixed time its characteristic function is a product of cosines. Using $\log\cos z=-z^{2}/2+O(z^{4})$ for small $z$, the sum of quadratic terms converges to the OU covariance integral and the fourth-order remainder is $O(h)$ on a finite horizon. Centered independent increments have bounded fourth moments, so the standard stopped-increment tightness estimate gives path convergence; the limiting linear martingale problem is unique by its explicit solution. Thus this is a justified finite instrument/current-source family for the ideal noise, not just a matrix labeled “physical noise”. A finite $h$ source is not asserted to have exact Gaussian transition law, and pulse bandwidth/cost is not claimed uniform in the white limit. The registered ideal thermal-current source is the limiting model whose continuous energy balance is audited below.

The two driving port currents are independent and both response-active. Since the source factor is invertible, the complete W path is recovered from X by

$$
W_t=(2\theta C^{-1})^{-1/2}\Bigl[X_t-X_0+\int_0^t(X_u-b)\,du\Bigr].
$$

No null circulation noise is discarded in this source.

The physical resistor dissipation at the two voltage differences is

$$
P_R(x)=g_0 v_0^{2}(x-b)^{\mathsf T}C(x-b).
\tag{N-loop.2}
$$

Let $P_0=g_0v_0^{2}$. The numerical source potential, after subtracting state-independent overhead and benefit, is $V(x)=P_R/P_0=(x-b)^{\mathsf T}C(x-b)$. Therefore

$$
\begin{aligned}
&H=2C=\operatorname{diag}(4,6),\quad M=(1/2)C^{-1}=\operatorname{diag}(1/4,1/6),\\
&\beta^{-1}=2\theta,\quad\sigma=\sqrt{2\theta C^{-1}},\\
&MH=I,\quad\sigma\sigma^{\mathsf T}=2\beta^{-1}M.
\end{aligned}
\tag{N-loop.3}
$$

These are derived from independent capacitor/conductance/noise records and the actual dissipative power; they are not the H,M of N-RC-PORT-3. The local state metric is the Euclidean metric in normalized voltage, with no boundary and Ito convention. In physical voltage/time coordinates,

$$
\begin{aligned}
H_{\mathrm{ph}} &= 2G_{\mathrm{ph}},\\
M_{\mathrm{ph}} &= (1/2)\, C_{\mathrm{ph}}^{-1},\\
\beta_{\mathrm{ph}}^{-1} &= 2 k_B T/t_0,\\
\sigma_{\mathrm{ph}} &= C_{\mathrm{ph}}^{-1}\sqrt{2 k_B T G_{\mathrm{ph}}}.
\end{aligned}
$$

The identity $G_{\mathrm{ph}}=C_{\mathrm{ph}}/t_0$ proves the physical Einstein relation and drift. $H_{\mathrm{ph}}$ has units power/voltage², $M_{\mathrm{ph}}$ voltage²/(power·time), $\beta_{\mathrm{ph}}^{-1}$ power and $\sigma_{\mathrm{ph}}$ voltage/sqrt(time). It is the proportional relaxation times, a source-level resistor/capacitor relation, that makes the dissipative cost and noise fit the same quadratic package.

#### 3. The source state actually performs prediction, verification and update

Choose $\theta=1$ for the fully numerical witness. The exact endpoint law over the board interval $\delta=\ln 2$ is

$$
\begin{gathered}
X_{n+1}=a(X_n)+Z_n,\\
a(x)=(x+b)/2,\\
Z_n\ \text{independent}\ N(0,S_\delta),\quad S_\delta=(3/4)C^{-1}.
\end{gathered}
\tag{N-loop.4}
$$

Distinguish the continuously evolving capacitor $X_{t}$ from the held model latch $M_{n}$ used during the next forecast interval. Initialize $M_0=X_0=b$. The forecast service reads $M_{n}$ and writes $a(M_n)$; it does not receive future $Z_{n}$. Acquisition reads the actual next capacitor endpoint $X_{n+1}$; comparison produces $e_n=X_{n+1}-a(M_n)$; verified writeback is $M_{n+1}=a(M_n)+e_n=X_{n+1}$. Induction proves $M_n=X_n$ at every decision time on the active branch. Hence the active verification error is exactly $Z_{n}$, while the held model need not equal the changing capacitor between decisions. The archive retains all records. The same source endpoint actively determines the next predictive model; no independent predictor is appended to an idle noise coordinate. If verification is disabled, $M$ is held while $X$ continues evolving, so this is a genuine response-active intervention.

The implemented loop is the following finite stage table:

1. held model-latch read $M_{n}$ (equal to $X_{n}$ on the active branch);
2. affine prediction $a=(M_n+b)/2$;
3. actual source acquisition $y$ at the next registered clock endpoint;
4. error comparison $e=y-a$;
5. verified model-latch writeback $M_{n+1}=a+e$;
6. score write $L=(2/3)e^{\mathsf T}Ce$.

Every operation is a specified ideal analog source service, with a positive calibrated service cost and a fixed call count independent of x and the realized noise. The quadratic score service is bilinear analog arithmetic; no uncharged digital arbitrary-precision calculation is claimed. Finite precision implementations constitute approximations with their own errors, not an exact implementation of arbitrary real arithmetic. The branch is explicit about using the ideal services, just as it is about ideal white current sources.

On the active branch all intermediate records, including the held latch $M_t=X_{\lfloor t/\delta\rfloor\delta}$ between ticks and the deterministic clock phase, are functions of the retained $X$ path and fixed initialization. Source port noise is likewise recovered from $X$. Thus neither the verification error nor an unbounded response-active data stream has been removed from the full response map. Between completed loop stages the source state continues to obey (N-loop.1); the service archive is a read-only functional of its history and exerts no unregistered feedback force. Logical writeback changes the held model latch to the actual verified endpoint. It does not claim that the continuously changing capacitor waits for the verifier or that writing its already attained value would be an adaptive latch update.

The three Fundamental Predictive Loop phases are present: a current model generates a future prediction; actual acquisition generates an error; and that error determines the next committed model. Full-loop qualification refers to this initialized process and its declared evaluation window, not to a demand that every runtime real voltage is a new minimum-complexity microstate.

#### 4. Compute the same-task qualification and compare the complete census

The task is prediction of the source's next endpoint under the registered clock and initial condition. The loss and performance use the Definition-7 convention with the reciprocal taken after expectation:

$$
\begin{gathered}
L(\hat{a},Y)=(2/3)(Y-\hat{a})^{\mathsf T}C(Y-\hat{a}), \\
PP=1/[1+\mathbb{E}L].
\end{gathered}
$$

For the actual forecast $a(X_n)$, $\mathbb{E}[L\mid X_n=x]=(2/3)\operatorname{Tr}(CS_\delta)=1$ for every $x$. Hence $PP_{\mathrm{loop}}=1/2$ in every cycle and every finite evaluation window. This uniformity follows from the independently derived conditional source law, not from defining the observed $PP$ to equal a desired number.

The matched randomized forecast baseline has the same information $X_{n}$ and the same forecast mean $a(X_n)$, but adds an independent draw $Z'_n$ with exactly the same $N(0,S_\delta)$ law. Its error $Z_n-Z'_n$ has covariance $2S_\delta$, hence $\mathbb{E}L_{\mathrm{random}}=2$ and $PP_{\mathrm{random}}=1/3$. This is a genuine same-task randomized predictor; it is more informed than an uninformed random guess. Register $\epsilon_{\mathrm{acc}}=1/12$. Then

$$
1/2>1/3+1/12=5/12.
\tag{N-loop.5}
$$

The forecast service is adaptively state-sensitive: if $X_{n}$ differs, $a(X_n)$ differs, and all source values have a corresponding predictive mean. Nulling memory forces the forecast to ignore the current state; nulling forecast replaces it by the specified independent randomized baseline; nulling verification/writeback leaves the old model unchanged after a nonzero innovation. The complete eight-mask technology is exhausted by $(a,b_f,c_v)\in\{0,1\}^{3}$. Only $(1,1,1)$ has all three integrated loop phases. In particular each other mask has one of the following exact witnesses:

- $a=0$: the committed model cannot be changed from its specified null value; for $x\ne x'$ its forecast ignores the registered model distinction;
- $b_{f}=0$: the prediction port is the independent matched randomized baseline and attains $PP=1/3$, not the required margin;
- $c_{v}=0$: the acquisition/comparison/writeback map is replaced by its typed null and never uses $e$ to update. Since the Gaussian innovation is nonzero with probability one, its next model disagrees with the verified source endpoint with probability one.

The last two cases exhibit a response failure, not merely an unused role name. A mask missing more than one role has all the relevant failures. Physical full-loop membership includes the actual three-phase requirement in Definition 13, so a frozen lucky forecast without writeback is not a hidden qualifying architecture. Every switch configuration and null response is explicitly admitted; none is removed because it loses the optimization. In the $c_{v}=0$ comparator, forecasts depend on held $M_{0}$ rather than current $X_{n}$; therefore the active-branch covariance/PP computation is not incorrectly applied to that comparator.

#### 5. A fixed, noncircular hierarchy and a proved minimum initialized MPU

Here the claim is technology-relative. It does not classify all physically possible processors or alter a prior global hierarchy. The original source certificate may be populated on a newly registered formal realization; target-aware construction does not require a historical precommitment.

Fix a universal prefix machine U before evaluating qualification. Codes 0abc (four bits) invoke the above hardware-source assembler and instantiate the eight physical initial configurations $\mu_{abc}$. Codes 1p simulate an ordinary fixed universal prefix machine U0 on p, using a separate general-purpose simulator service. The disjoint leading bits and prefix-freeness of U0 make U prefix-free and universal. The $\mu_{abc}$ are physically distinguishable by their retained switch registers even when some behavioral outputs agree.

The declared physical technology contains the source board and its hardwired assembler, but no simulator CPU/source service. Its admissibility predicates are therefore

$$
L_n=\{0abc:a,b,c\in\{0,1\}\}\quad\text{for every } n\ge 0.
\tag{N-loop.6}
$$

This is a source-inventory/syntax constraint: each admissible command is a complete valid setting of the three physical switches; the $1p$ branch has no realizing service in this technology. It is not an assertion that universal simulation is impossible in other technologies, nor a rule excluding a program because it is a cheaper qualifying competitor. The condition contains no $C_P$, $C_{\mathrm{op}}$, MPU, score or outcome test. It is exactly the physical class on which this finite source certificate is claimed. Every member of that class is populated and compared.

Take $K(P)=\text{prefix-program length}$, as in the finite-alphabet/length convention of Theorem 2.4.1a. For each $\mu_{abc}$, $0abc$ is a common full-hierarchy realizer. No admitted word has length below four; and a different $0a'b'c'$ produces different retained switch data. Therefore

$$
M_n(\mu_{abc})=\{0abc\},\quad C_{P,n}(\mu_{abc})=C_P(\mu_{abc})=4.
\tag{N-loop.7}
$$

This is an exact exclusion proof, not a claimed minimum based on a finite search without source coverage. The physical inventory and decoder prove coverage; the small census then proves the minimum. By section 4, the qualifying set within this declared technology is $Q=\{\mu_{111}\}$. Thus $C_{\mathrm{op}}=4$ is attained and $\mu_{111}$ is a Definition 23 initialized MPU on this registered source/task/hierarchy branch.

The numeral 4 is a program-length result for this presentation, not K0 or a universal MPU size. The quantum register capacity remains a distinct quantity. No equality to the fixed physical hierarchy of another source is asserted. In particular this certificate does not complete the independent broader MPU realization census.

**Runtime distinction.** $U(0111,\mu_{\mathrm{ref}})=\mu_{111}$ specifies the initialized source architecture, including its stochastic law and physical primitive resources. It does not enumerate or deterministically print every future Brownian sample path. $X_{t}$ is the runtime state of that one source, and (N-loop.1) derives its stochastic state dynamics. The continuous-law representation and source-driven conditional states are supplied by the registered stochastic primitive. The certificate does not assert that every realized $x$ is itself a separate finite deterministic output of $U$, nor that every future conditional state separately minimizes $C_{P}$. This is precisely the architecture-to-runtime map needed to avoid the countability confusion.

#### 6. Actual same-state PCE resource identity

Let the physical service costs of the six stage-table operations be fixed nonnegative amounts $e_1,\dots,e_6$, with $e_2,e_3,e_5>0$. Initial board preparation is a fixed finite resource $e_{\mathrm{init}}$; charge it over the registered evaluation horizon $T_{\mathrm{eval}}$. Let $\gamma>0$ be the registered power-equivalent reward per unit $PP$. These inputs are source tariffs, not functions fitted to $H$ or the stationary covariance. One fully populated instance takes $e_1=\dots=e_6=E_0$, $e_{\mathrm{init}}=E_0$, $T_{\mathrm{eval}}=2\Delta$ and $\gamma=P_0$, giving $P_{\mathrm{const}}=13E_0/(2\Delta)$. The service meter counts each completed source operation once at its fixed declared tariff; it is not a claim that Landauer entropy or unknown-device electrical consumption equals that tariff. With $\Delta=\ln 2\,t_0$, define

$$
\begin{aligned}
P_{\mathrm{const}}&=(\sum_j e_j)/\Delta+e_{\mathrm{init}}/T_{\mathrm{eval}},\\
V_{\mathrm{full}}(x)&=P_R(x)+P_{\mathrm{const}}-\gamma\,PP_{\mathrm{loop}}.
\end{aligned}
\tag{N-loop.8}
$$

Every admitted completed stage has exactly the six occurrences above; changing an outcome does not change its charge. The noise ports and capacitor energy are owned by the electrical source. For its centered physical storage $E=1/2(z-z_b)^{\mathsf T}C_{\mathrm{ph}}(z-z_b)$, Ito's formula gives

$$
dE=-P_R\,dt_{\mathrm{ph}}+[2k_B T/t_0]\,dt_{\mathrm{ph}}+dM_{\mathrm{energy}}.
\tag{N-loop.9}
$$

The two-resistor source therefore has exact state-dependent dissipative term $P_{R}$ and a state-independent mean bath-injection term. It is not licensed to count the same injected energy as both a fresh operational cost and a second copy of dissipated heat. If a separate bath-maintenance tariff is registered, it adds a state-independent source row here. No physical reset or entropy-to-heat claim is needed. Constant-voltage-reference work is handled by the centered storage convention, including its work term in the change from uncentered capacitor energy.

Since $PP_{\mathrm{loop}}=1/2$ everywhere on the registered evaluation task, $P_{\mathrm{const}}-\gamma/2$ is a constant. Thus the exact same-state PCE objective $V_{\mathrm{full}}$, modulo its explicitly recorded additive constant, is the physical resistor dissipation whose coefficients were derived in (N-loop.3). The prediction, source state, cost meter and clock are the same; this is not a performance-dependent quadratic profile chosen after the OU solution.

The branch resource vector can equivalently record $(P_R,P_{\mathrm{const}},PP_{\mathrm{random}}-PP_{\mathrm{loop}})$, with its signed reward convention kept separate from positive resource entries; positive source-resource cone and a fixed benefit subtraction yield the same scalarization. Nothing identifies stored energy with heat in arbitrary circuits: (N-loop.9) and $G_{\mathrm{ph}}=C_{\mathrm{ph}}/t_0$ prove the specific identity in this source.

#### 7. MPU-state and response realization map

Use the $\arctan$ complete-flag map of Definition N.1b, applied to this source's $x$ and its new $\sigma$. At completed decision times, the source and held model coincide and the identified operational decision state is $S_x=(\rho_{\mathrm{ready}},s(x))$ with $\rho_{\mathrm{ready}}=I_8/8$. The constant ready quantum state is not asserted to carry $x$; $x$ is the response-active perspective component. Between those times the full physical protocol additionally contains the held latch, clock phase and archive just described. A single instantaneous $S_{x}$ is not claimed to recover an earlier held latch; the complete realization is the path map from the retained $X$ trajectory, which does recover it exactly. The autonomous OU coordinate is the capacitor/model-source state, while the initialized MPU is its explicitly typed full loop and clocked model interface. Its registered preparations/readouts satisfy

$$
\begin{aligned}
&r_j=1/(1+x_j^{2}),\quad q_j=(1-x_j)^{2}/[2(1+x_j^{2})],\\
&x_j=(1-2q_j)/(2r_j).
\end{aligned}
$$

Thus distinct actual predictive storage states produce distinct retained quantum protocol responses. Each source endpoint update $x\to y$ produces the actual context-control unitary $U(y)U(x)^\dagger$. This transports every labeled context projector, and its Hamiltonian/continuous-source limits are supplied in the context proof. The source's two port currents, held latch, deterministic phase, all stage forecasts, acquired outcomes, innovations, writebacks, score, energy and cost records are functions of the full retained $x$ path and the fixed primitive/source data; the inverse context-probe map recovers $x$. This proves a response-faithful bijection on the complete admitted source histories. There is no unrecorded third current port in this source.

The source noise is external to the initialized program description but explicitly part of its physical stochastic primitive inventory. The phase clock, source parameters and ready resources are held fixed under response equivalence; no arbitrary simulator procedure is introduced through a concealed side channel.

#### 8. Analytic package and original obligation map

For this actual source, $H=2C$, $M=C^{-1}/2$, $b=(1,1)$, $\beta^{-1}=2\theta$ and $\lambda_*=1$ in source time. The unique invariant covariance is

$$
\begin{aligned}
\beta^{-1}H^{-1} &= \theta C^{-1},\\
MH S+S HM &= 2\theta C^{-1}=\sigma \sigma^{\mathsf T}.
\end{aligned}
$$

The source solution is $X_t=b+e^{-t}(X_0-b)+\int_0^t e^{-(t-u)}\sigma\,dW_u$. It gives strong uniqueness, no explosion, the unique minimum, invariant Gaussian and weighted contraction $e^{-t}$. N.1a supplies all-law ergodicity and low-noise conclusions. The initialized MPU witness starts at $X_0=b$; arbitrary initial square-integrable laws remain valid mathematical source inputs for the analytic theorem, but are not falsely assigned the same exact program complexity or a newly proved initialization recipe.

Obligations:

- Formal MPU identification: sections 3–5 explicitly populate the full loop, actual task, matched random baseline, positive margin, complete finite technology and exact hierarchy/minimum. Section 7 identifies its runtime state with an operational quantum/perspective state.
- Same-state coefficients: sections 1–2 derive H,M,b from the physical source whose voltages drive that same loop.
- Noise and source: both actual current ports, their independent source law and response records are fixed; their full path is recoverable from the retained voltage path.
- Common cost/time units: sections 2 and 6 give physical and numerical matrices, the physical dissipative cost and all state-dependent/constant resource rows, with no reset entropy inference.
- Response-faithful realization: the source-to-loop and source-to-perspective maps and inverses preserve every admitted finite source protocol and full retained path record, section 7.

This is an original-owner discharge on the N-OU-LOOP-2 registered formal technology, conditional on reading the exact original MPU certificate through the source-relative initialized-system/runtime interpretation of the runtime distinction above. It neither requires a universal hardware census nor weakens N.1a to a bounded/nonlinear package.

## N.2 Divergence Laws for Hardware and Software Limits

The PCE Potential incorporates costs that diverge as the system approaches fundamental physical or logical limits. Two such divergences are critical:

*   **Predictive Divergence** [Thm. 14]. Fix a preregistered target $\alpha_{\mathrm{tgt}}<\alpha_{\mathrm{SPAP}}$ and set $\delta_{\text{SPAP}}:=\alpha_{\mathrm{SPAP}}-\alpha_{\mathrm{tgt}}$. On a task class carrying the Bernoulli reduction, independence, confidence, and operation-count certificate $\mathfrak C_{B.2}$, Theorem 14 gives
    $$
    C_{\text{uni}}(\delta_{\text{SPAP}})
    =
    \Omega\left(\frac{\log(1/\delta_{\text{SPAP}})}{\delta_{\text{SPAP}}^2}\right).
    \tag{N.2}
    $$
    An observed $PP$ may replace $\alpha_{\mathrm{tgt}}$ only when the certificate registers that identification and retains its confidence condition. Transfer to a specific predictive-complexity notion such as $C_P$ requires the separate domination bridge on the same task family.

*   **Relativistic Divergence** (Special Relativity). The kinetic energy required to accelerate a particle of rest mass $m_0$ to a velocity $v$ diverges as $v$ approaches the invariant speed $c$:
    $$
    \mathcal{E}_{\text{kin}}(v) = m_0c^2(\gamma(v)-1), \qquad \gamma(v)=\frac{1}{\sqrt{1-v^2/c^2}}
    \tag{N.3}
    $$

## N.3 Conditional Response Models for Predictive Resource Costs

The UCT keeps endpoint kinetic work, SPAP complexity, proper-acceleration response, and internal implementation heating as distinct ledger entries. This section registers response models under which selected entries may be placed in one frame-consistent work functional.

### N.3.1 Registered Temperature-Response Branch for Resource Costs

The physical operational cost function $R(C)$ (Definition 3) represents the power required to maintain and operate an implementation of predictive complexity $C$. On the temperature-response branch used below, evaluate this rate in the chosen local comoving frame, extend it to $R(C,T_{\mathrm{eff}})$, and assume over the admitted operating range that
$$
\frac{\partial R}{\partial T_{\mathrm{eff}}}\ge0,
\qquad
\frac{\partial^2R}{\partial C\,\partial T_{\mathrm{eff}}}\ge0.
$$
Strict inequalities may be imposed on ranges where the implementation certificate supports them. These monotonicities are branch hypotheses to be tested or supplied for the implementation; Landauer's bound alone does not prove them for every predictive system.

### N.3.2 Thermodynamic Costs of Physical Acceleration (Unruh Effect)

Theorem N.4a constructs an accelerated detector on the retained massive-Dirac source, with a nonzero Unruh detailed-balance spectrum and controlled finite-switching and continuum errors. Its uniformly accelerated response has temperature (Unruh 1976)
$$
T_U(a) = \frac{\hbar a}{2\pi c k_B}.
\tag{N.4}
$$
This temperature characterizes detector transition ratios rather than a literal ambient energy flux. Its use as an effective noise source and the combination
$$
T_{\mathrm{eff}}(a):=T_{\mathrm{bath}}+T_U(a)
$$
are the additional assumptions of the declared additive-temperature branch. More general backgrounds and nonstationary trajectories require their detector response functions rather than this additive approximation.

<a id="theorem-n4a-accelerated-detector-on-the-retained-dirac-source"></a>**Theorem N.4a (Accelerated Detector on the Retained Dirac Source).** Fix the massive free-Dirac source, its geometry-first finite matrices $K_n$, states $D_n$, tensor encoding and calibrated physical clock of Theorems F.10.4b.8a–F.10.4b.8e. The finite source/control realization uses positive computable registered parameters with certified calibration errors and the finitely described smooth profiles specified below. Fix $\rho>0$ and put $\nu=c/\rho$. A detector centered on
$$
 z(\tau)=(\rho\sinh(\nu\tau),\rho\cosh(\nu\tau),0,0),
 \qquad a=c^2/\rho,
 \qquad \tau_U=2\pi/\nu
 \tag{N.4a.1}
$$
uses coordinates $x^0=ct$ and its metric proper time $\tau$. The following bounded, spatially smeared detector has an explicit finite-source realization, convergent complete finite-switching responses and a nonzero continuum spectrum satisfying Unruh detailed balance.

**Source and detector.** Choose a finitely described computable normalized smooth Cauchy spinor $f$, with certified support, derivative and normalization bounds, with compact support in a connected ball centered at $(\rho,0,0)$ whose closure lies in $x^1>0$. For example, take a fixed unit spinor times the normalized bump $\exp[-1/(1-|x-(\rho,0,0)|^2/r^2)]$ inside the ball, zero outside, with $0<r<\rho/4$. The unitary coordinate transformation in Theorem F.10.4b.8b is understood when applying its cell averages $E_n$. Write
$$
 C=(I+e^{2\pi K})^{-1},\quad q=\langle f,Cf\rangle,\quad
 B=a^*(f)a(f)-qI,\quad B(\tau)=\alpha^{\rm phys}_\tau(B),
 \tag{N.4a.2}
$$
where $K$ is the independently defined geometric boost generator. The observable is self-adjoint, parity even and has norm at most one. Its geometric support is the boosted image of the initial Cauchy patch; the Dirac time-slice construction supplies compact spacetime representatives in the same wedge. The detector is an extended comoving probe.

For all sufficiently large $n$, set $r_n=\|E_nf\|>0$, $f_n=E_nf/r_n$, $q_n=\langle f_n,C_nf_n\rangle$ and $B_n=a^*(f_n)a(f_n)-q_nI$, with $C_n=(I+e^{2\pi K_n})^{-1}$. The actual field Hamiltonian remains
$H_n=(\hbar c/\rho)d\Gamma(K_n)$; no spectral branch is discarded. Add an ordinary detector qubit with $H_D=\hbar\Omega|e\rangle\langle e|$, $\Omega>0$. Choose $\chi$ as a finite real computable linear combination of rational translations and positive rational dilations of the standard bump $b(t)=\exp[-1/(1-t^2)]$ for $|t|<1$, zero otherwise, with supplied coefficient precision and derivative/integral error certificates. One nonzero bump suffices. For this real $\chi\in C_c^\infty(\mathbb R)$ and a computable coupling $g$ of inverse-time dimension, the target switched Hamiltonian is
$$
 H_{n,\rm det}(\tau)=H_n+H_D+
 \hbar g\chi(\tau)\sigma_x\otimes B_n.
 \tag{N.4a.3}
$$
The input is $D_n\otimes|g\rangle\langle g|$ for excitation, or $D_n\otimes|e\rangle\langle e|$ for de-excitation. Measuring $P_e=|e\rangle\langle e|$ or $P_g=I-P_e$ after switch-off gives the exact detector output. Both outcomes and the joint postmeasurement field state are retained. A local controlled-NOT to a fresh pointer followed by its computational-basis readout realizes this instrument; its preparation, pointer, archive, routing, readout and any later reset are charged. The vacuum field is supplied by the same-source limit of $D_n$ proved in Appendix F.

**Finite switching and continuum errors.** Let the switching support have diameter at most $T$, put $L_1=\|\chi\|_1$ and $\eta=|g|L_1$. In the interaction picture, the coupling is

$$
\hbar g\chi(\tau)(e^{i\Omega\tau}\sigma_++e^{-i\Omega\tau}\sigma_-)\otimes B_n(\tau).
$$

Define
$$
 W_n(t)=\operatorname{Tr}(D_nB_n(t)B_n),\qquad
 F_n(\Omega,\chi)=\int d\tau\,d\sigma\,
 \chi(\tau)\chi(\sigma)e^{-i\Omega(\tau-\sigma)}W_n(\tau-\sigma).
 \tag{N.4a.4}
$$
Let $p_{n,+}$ and $p_{n,-}$ be the exact excitation and de-excitation probabilities. They obey
$$
 |p_{n,\pm}-g^2F_n(\pm\Omega,\chi)|
 \le R(\eta),\qquad
 R(\eta)=2\eta(\sinh\eta-\eta)+(\sinh\eta-\eta)^2.
 \tag{N.4a.5}
$$
Indeed only odd Dyson orders connect opposite detector levels. The first-order block has norm at most $\eta$, and its remaining odd orders have norm at most $\sinh\eta-\eta$. Expanding the squared block gives (N.4a.5), uniformly in the source dimension. In particular $R(\eta)=O(\eta^4)$ at fixed switching. The integral in (N.4a.4) is nonnegative because it is the expectation of $X^*X$ for the first-order transition operator.

All comparison errors below refer to the actual source. For a proper-time difference window $|t|\le T$, take the geometric orbit window $S=\nu T$, a thermal integral cutoff $L>0$, and the source errors $\varepsilon_n^{\rm geom}(f,S)$, $b_n(f,L)$ and $G(f,S)$ of (F.10.4b.8b-L7), (F.10.4b.8b-L10) and their definitions. The explicit bound
$$
 d_n(T,L)=2\varepsilon_n^{\rm geom}(f,S)+4(1-r_n)
 +b_n(f,L)+\frac{2a_n}{\pi}G(f,S)
 \tag{N.4a.6}
$$
bounds every normalized ordered two-point contraction between the evolved $f_n$ modes and its continuum counterpart, including the complementary $I-C_n$ contraction and $|q_n-q|$. Enlarge the box to contain the geometric orbits through boost time $\max\{S,L\}$ and their stencil collars, covering both propagation and the thermal integral. First increasing $L$, then refining $n$, makes $d_n$ tend to zero. To check the bound, replace each normalized $f_n$ by $E_nf$, charge $1-r_n$ per occurrence, apply (F.10.4b.8b-L7) to each evolved argument, and use (F.10.4b.8b-L11) with the other continuum orbit vector. For $I-C_n$, include the identical cell-projection bound for the CAR scalar contraction. Stationarity reduces a pair of times to their difference.

Wick's rule gives the exact connected correlation
$$
 W(t)=\langle f,Cv(\nu t)f\rangle
       \langle v(\nu t)f,(I-C)f\rangle,
 \qquad v(s)=e^{\mathrm{isK}},
 \tag{N.4a.7}
$$
and the same formula with $K_n,C_n,f_n$ holds at every finite stage. Each factor has modulus at most one. Consequently
$$
 \sup_{|t|\le T}|W_n(t)-W(t)|\le2d_n(T,L),\qquad
 |F_n(\Omega,\chi)-F(\Omega,\chi)|\le2L_1^2d_n(T,L).
 \tag{N.4a.8}
$$
Preparation trace error, gauge leakage, gate approximation and clock/readout errors add their ordinary trace-response bounds to the measured probability. They are not divided by $g^2$ until the stricter budget for measuring a response coefficient has been met.

There is also a complete nonperturbative finite-window limit. The bounded continuum interaction has a norm-convergent Dyson series and defines a unitary $U$ and probability $p_\pm$. For any integer $M\ge1$, one explicit, deliberately loose bound is
$$
 |p_{n,\pm}-p_\pm|
 \le d_n(T,L)\sum_{k=1}^{M}
 \frac{(4\eta)^k k(2k)!}{k!}
 +2\left[e^{2\eta}-\sum_{k=0}^{M}\frac{(2\eta)^k}{k!}\right].
 \tag{N.4a.9}
$$
Expand the two Dyson factors in the probability and retain total order at most $M$. A product of $k$ centered occupations expands into at most $2^k$ terms. Wick pairing, telescoping of each product of at most $k$ contractions, and the centering errors cost at most $2^k k(2k)!d_n$. The sum of the two ordered-integral coefficient bounds at total order $k$ is $(2\eta)^k/k!$. Each discarded tail is bounded by the displayed exponential tail. This proves (N.4a.9): first choose $M$ for the tail, then $L,n$ for its finite coefficient sum. It does not assume convergence of the finite states in norm on the entire field algebra. For arbitrary fixed finite detector/reference dimension the same argument works entrywise, with its finite matrix-norm factors, and covers every detector outcome. For a fixed finite family of additional smooth local field tests, enlarge the contraction family to include their Cauchy spinors and boost windows, and replace $d_n$ by the maximum of their normalized (F.10.4b.8b-L7)/(F.10.4b.8b-L11) errors; finite word expansion gives the corresponding coefficient factors. Norm approximation then extends each fixed test to the norm closure of that grammar. This proves the complete retained instrument response comparison on those finite test families, while retaining every finite source output and its correlations. Norm-local convergence of $B_n(t)$ and the unitary Duhamel bound $\|U[V]-U[V']\|\le\hbar^{-1}\int\|V-V'\|d\tau$ separately control every bounded control replacement.

**Spectrum and a nonzero gap interval.** Let $\mu_f$ be the spectral probability measure of $K$ in $f$, and write $c(k)=(1+e^{2\pi k})^{-1}$. The Fourier convention in this paragraph is
$W(t)=\int e^{-i\omega t}\,\mathsf s(d\omega)$ and $\widehat\chi(u)=\int e^{-iu t}\chi(t)dt$.
Equation (N.4a.7) proves, without a detector-temperature assumption,
$$
 \mathsf s(A)=\iint \mathbf1_A(\nu(l-k))\,
 c(k)[1-c(l)]\,\mu_f(dk)\mu_f(dl),\qquad
 F(\Omega,\chi)=\int|\widehat\chi(\Omega+\omega)|^2\,\mathsf s(d\omega).
 \tag{N.4a.10}
$$
Swapping $k,l$ and using
$c(l)[1-c(k)]=e^{-2\pi(l-k)}c(k)[1-c(l)]$
gives the measure identity
$\mathsf s(-d\omega)=e^{-\tau_U\omega}\mathsf s(d\omega)$.
The finite-source spectral measure has the identical formula with the eigenvalue weights of $K_n,f_n$; it is discrete and satisfies the same detailed-balance identity. This identity concerns the spectral measure; finite-switching transition probabilities are compared with it in (N.4a.15)–(N.4a.16).

For the displayed compact smooth $f$, $\mu_f$ has a density $w\in L^1(\mathbb R)\cap L^\infty(\mathbb R)$. Here is a direct check of the spectral type needed for this assertion. On the all-space Cauchy Hilbert space, Fourier transformation gives
$$
 K_{\rm all}=iH_D(p)\partial_{p_1}+\frac i2\alpha^1,
 \quad H_D(p)=\alpha\cdot p+m\beta,\quad
 E(p)=\sqrt{|p|^2+m^2}.
 \tag{N.4a.11}
$$
The Clifford relations give $[K_{\rm all},H_D/E]=0$. Thus its two rank-two energy-sign bundles are invariant. In the Dirac matrix representation, a global smooth diagonalizing unitary is

$$
R(p)=[2E(E+m)]^{-1/2}\begin{pmatrix}(E+m)I_2&-\boldsymbol\sigma\cdot p\\ \boldsymbol\sigma\cdot p&(E+m)I_2\end{pmatrix};
$$

its first and last two columns frame the two bundles. Multiplication verifies $R^*R=I$ and $R^*H_DR=\operatorname{diag}(EI_2,-EI_2)$. For each fixed $p_\perp$, put $m_\perp=\sqrt{m^2+|p_\perp|^2}$ and $p_1=m_\perp\sinh u$. Expressing the spinor in those frames and multiplying by $\sqrt{E}$ changes the measure $dp_1$ to $du$. On the two bundles the resulting operator is

$$
\pm i\partial_u+A_\pm(u,p_\perp),
$$

with a smooth Hermitian $2\times2$ connection. For sign $\sigma\in\{+1,-1\}$, solve $G_\sigma'=i\sigma A_\sigma G_\sigma$, $G_\sigma(0)=I$. Hermiticity preserves $G_\sigma^*G_\sigma=I$, and substituting $G_\sigma\psi$ removes the connection. Smooth sections compact in $u,p_\perp$ form a core for the resulting translations; integration of the geometric boost equation on this core identifies the self-adjoint groups and their generators. This gives a unitary equivalence with the two translation generators $\pm i\partial_u$, fiberwise in $p_\perp$. The rapidity variable ranges over all of $\mathbb R$. Fourier transformation in $u$ therefore makes $K_{\rm all}$ multiplication by a real variable with Lebesgue measure.

The positive and negative half-space Cauchy subspaces reduce the geometric boost: the boost preserves their respective wedges, and finite propagation identifies the Cauchy-data action in both time directions. Its restriction to the positive half-space is exactly the $K$ of Appendix F. It therefore has absolutely continuous spectral measures. More quantitatively, zero extension of the chosen $f$ is smooth and compactly supported on all space; its momentum transform is Schwartz. The rapidity representation $\Psi(u,p_\perp)$ obeys
$$
 \|\Psi(u,\cdot)\|_{L^2(dp_\perp)}
 =\left(\int E(p)|\widehat f(p)|^2dp_\perp\right)^{1/2},
 \qquad \int\|\Psi(u,\cdot)\|_2du<\infty.
 \tag{N.4a.12}
$$
The equality combines both energy signs; all frame and gauge matrices are unitary. The integrability follows from $m_\perp\ge m>0$, $E=m_\perp\cosh u$, $|p_1|=m_\perp|\sinh u|$ and a Schwartz bound of order greater than four. The vector-valued Fourier transform of $\Psi$ is bounded and continuous, while Plancherel gives its squared norm integral one. The density $w$, the sum of the squared fiber norms at the two signed Fourier variables, is consequently bounded, nonnegative and integrable with integral one.

It follows that $\mathsf s(d\omega)=s(\omega)d\omega$, where
$$
 s(\omega)=\frac1\nu\int_{\mathbb R}
 c(k)[1-c(k+\omega/\nu)]w(k)w(k+\omega/\nu)\,dk,
 \quad s(-\omega)=e^{-\tau_U\omega}s(\omega).
 \tag{N.4a.13}
$$
Both $cw$ and $(1-c)w$ belong to $L^2$, so translation continuity and Cauchy–Schwarz make $s$ continuous and bounded. Moreover
$$
 s(0)=\frac1\nu\int c(k)[1-c(k)]w(k)^2dk>0.
 \tag{N.4a.14}
$$
An explicit continuity budget is available. Write $\Psi_\pm$ for the two signed rapidity components and set

$$
M_j=\sum_{\sigma=\pm}\int |u|^j\|\Psi_\sigma(u,\cdot)\|_2du,\quad j=0,1.
$$

The same Schwartz estimate makes both finite. Vector-valued Fourier differentiation gives
$\|w\|_\infty\le M_0^2/(2\pi)$ and a Lipschitz constant $M_0M_1/\pi$ for $w$.
Since $|c'|\le\pi/2$, convolution in (N.4a.13) gives the Lipschitz constant
$L_s=\nu^{-2}(M_0M_1/\pi+M_0^2/4)$ for $s$.
Thus $\Omega_*=s(0)/(2L_s)>0$ has $s(\omega)\ge s(0)/2$ for $|\omega|<\Omega_*$. The effective input grammar also permits a finite positive-gap selection. Compute $w$ on a finite spectral interval by compact rapidity/transverse quadrature and the displayed gauge ODE, bounding their tails by the supplied Schwartz seminorms. For the remaining $|k|>A$ part of $s(0)$, the spectral moment gives the explicit bound
$\|w\|_\infty\|Kf\|^2/(4\nu A^2)$.
Successively increase cutoffs and precision until a positive rational lower bound for $s(0)$ is certified; positivity ensures termination. Computable upper bounds for $M_0,M_1$ then give an upper bound for $L_s$. Choose a positive rational multiple of the registered frequency unit $\nu$ below the resulting lower bound for $\Omega_*$. Freeze that detector gap before collecting its data. This gives a nonzero excitation and de-excitation rate at the selected gap. It also gives a nonzero actual finite experiment. For nonzero compact smooth $\chi$, its entire Fourier transform cannot vanish on the open interval where $s>0$, so $F(\pm\Omega,\chi)>0$. Choose $n$ so (N.4a.8) leaves $F_n$ above half that positive value, then $g\ne0$ small enough that $R(\eta)<g^2F_n/2$, and apparatus probability error below $g^2F_n/4$. Equations (N.4a.5) and (N.4a.8) then give a strictly positive implemented transition probability in each separately prepared direction.

**Long observation and weak response.** Let $\chi_T(\tau)=\chi(\tau/T)$ for fixed nonzero real compact smooth $\chi$, where $T\ge1$ is an integer dimensionless dilation. Then
$$
 \lim_{T\to\infty}\frac{F(\pm\Omega,\chi_T)}{T\|\chi\|_2^2}
 =2\pi s(\mp\Omega),\qquad
 \frac{s(-\Omega)}{s(\Omega)}
 =e^{-\hbar\Omega/(k_BT_U)},\quad
 T_U=\frac{\hbar a}{2\pi c k_B}.
 \tag{N.4a.15}
$$
Indeed changing variables $v=T(\Omega+\omega)$ in (N.4a.10) gives the approximate-identity integral. For $R>0$ its error from $2\pi s(-\Omega)$ is at most
$$
 2\pi\sup_{|x+\Omega|\le R/T}|s(x)-s(-\Omega)|
 +\frac{2\|s\|_\infty}{\|\chi\|_2^2}
       \int_{|v|>R}|\widehat\chi(v)|^2dv.
 \tag{N.4a.16}
$$
First choose $R$, then $T$. This is the same finite-switching versus detailed-balance distinction treated for scalar detectors by Fewster et al. (2016b); here (N.4a.10)–(N.4a.16) prove it for the bounded even-CAR source.

The order of operations is explicit. At each fixed switching window refine the actual source, controls and clock to the errors in (N.4a.8)–(N.4a.9); then take the long-window response limit. To obtain the same limit from exact transition probabilities, also take $g_T\to0$ so that

$$
R(|g_T|T\|\chi\|_1)/(g_T^2T)\to0;
$$

for example $g_T=g_0T^{-2}$ suffices. Choose the finite-source and apparatus probability error $o(g_T^2T)$, which the fixed-window construction permits. Then the exact probability divided by $g_T^2T\|\chi\|_2^2$ tends to the right side of (N.4a.15). Independent repetitions estimate that small probability: a direct Hoeffding bound requires at least $\log(2/\zeta)/(2\delta_p^2)$ preparations for additive probability error $\delta_p$ and failure probability $\zeta$. Every repetition consumes the full source, detector, clock and readout preparation record. This establishes leading weak-response detailed balance.

**Actual finite controls and proper time.** The source encoder of Theorem F.10.4b.8c realizes both parity sectors. In a connected regional cell set containing $\operatorname{supp}f$, use the routed even Givens capture $W_n$ of Theorem F.10.4b.8e, with all its paths inside that set and its collar, to send $f_n$ to the port mode $p$ next to the detector. The pulse
$\exp[-i\theta\sigma_x\otimes(n_p-q_nI)]$
and the return $W_n^*$ implement
$\exp[-i\theta\sigma_x\otimes B_n]$ exactly on the code. The $q_n$ term is an ordinary, charged one-qubit control. The central controlled occupation is parity even and bounded radius. With $Q_n=\dim\mathcal K_n^{\rm lat}$ denoting the source mode count, each capture/return uses $O(Q_ne_n)$ local gates as a valid upper bound; every traversed source mode and gauge qubit remains in the carrier.

Partition the physical switching window with mesh $h$. At a sample time $\tau_j$ set $\theta_j=g\chi(\tau_j)\Delta\tau_j$. Free evolution between kicks and these pulses define a finite product. In the interaction picture the ideal integrand $A(\tau)=g\chi(\tau)\mu(\tau)B_n(\tau)$ is norm continuous. Replacing it by the stepwise value gives unitary error at most the interval length times its actual modulus of continuity; splitting free evolution and coupling adds the finite commutator product-formula bound. These quantities are computable from the finite matrices, $\chi$ and $h$, and tend to zero at fixed $n$ as $h\to0$.

Each routed block has actual positive duration $d_j$. Suppress the field free terms during its capture/pulse/return as in Theorem F.10.4b.8e, retaining the detector's free phase or compensating it by a charged local pulse. The discrepancy from the ideal kick schedule is at most
$\sum_j(\|H_n^{\rm all}\|+\|H_D\|)d_j/\hbar$
in unitary norm, in addition to synthesis errors; the optional $H_n^{\rm all}$ is replaced by the encoded Hamiltonian on the code-prepared branch. All blocks occupy their stated slots inside the same physical interval. A block with total rotation-angle budget $A_j$ fits a prescribed capture/return duration by using gate norm $\hbar A_j/(d_j-d_{p,j})$; the middle pulse has norm at most $\hbar|\theta_j|/d_{p,j}$. Choose the finite product first, then positive $d_j$ smaller than its slots and with the displayed total error below the requested tolerance. Actual energies generally grow; the source resource ledger retains them. Source preparation, routing distance, every gate angle, full carrier dimension, precision, peak norm and total duration are supplied by this construction.

The clocks, pulse-table distribution, geometric redshifts and timing errors are those of Theorem F.10.4b.8e. A timing displacement $\delta\tau_a$ of a pulse of norm $h_a$ contributes at most $2\|h_a\|\delta\tau_a/\hbar$ to a complete trace-response error, plus twice the timing-failure probability. The clock calibration frequency $\Omega_C$ is independent of the detector gap $\Omega$ and of the thermal period. For growing windows prepare a clock with a correspondingly longer unambiguous readout period, retaining its precision and energy costs; this changes its apparatus capacity, not the proper-time unit. The detector gap $\Omega$ is independently calibrated in proper time. Refinement changes spatial resolution, pulse strengths and precision and leaves the proper time $\tau=\rho s/c$ unchanged. The admitted control class is the paid externally scheduled bounded-radius class of Appendix F, with its nonuniform gate norms. The free Dirac source's causal limit supplies no uniform relativistic propagation-speed bound for these amplified detector-control gates.

**Energy and source ownership.** The finite apparatus follows the explicitly specified Rindler placement paths. Each source cell and routed apparatus module at radius $r_i>0$ has proper acceleration $c^2/r_i$, lapse $d\tau_i=(r_i/\rho)d\tau$ and the support-force and inertial kinetic-work budgets stated in Theorem F.10.4b.8e, using its actual maximal internal/control energy. For a compact proper-time window the finite source has a finite support-work sum. Preparation stock, the detector's internal energy, control/synchronization work, mechanical support work, field energy and the persistent readout record have separate owners. This consumes the prescribed-support source of Appendix F.

For the ideal finite switched Hamiltonian, unitary differentiation gives the exact reference-time work identity
$$
 W_{\rm sw}=\int\operatorname{Tr}[\varrho(\tau)\partial_\tau H_{n,\rm det}(\tau)]d\tau
 =\Delta\langle H_n\rangle+\Delta\langle H_D\rangle,
 \tag{N.4a.17}
$$
because the interaction is zero at both endpoints. A scalar offset making a finite $H_n$ positive cancels from this equality. For the actual routed implementation use its actual piecewise Hamiltonian, including jump work, cancellation, pulse and compensation terms; the same identity accounts for each control and free-energy endpoint. Its absolute switching-work budget is bounded by $\sum_j\|H(\tau_j^+)-H(\tau_j^-)\|$ for instantaneous control changes, or by $\int\|\partial_\tau H\|d\tau$ for declared smooth ramps. Local proper-energy budgets have the explicit $\rho/r_i$ conversion of Theorem F.10.4b.8e. A pulse norm times its duration is an action budget. Mechanical support is separately metered on the registered timelike paths. Readout and any reset add their actual separate energy/entropy accounts. The single switched experiment performs no compulsory cyclic erasure, and (N.4a.17) assigns no reset heat to the KMS spectral weight. The proposed identification of MPU reset dissipation with this response is the separate heat/source bridge of Section N.7.2. ∎

### N.3.3 Internal Thermodynamic Costs from "Predictive Acceleration"

Internal implementation heating is distinct from the proper-acceleration/Unruh branch. Choose an operational throughput coordinate $A_{\mathrm{pred}}$ measured per unit proper time--for example a registered completed-reset rate or a separately defined complexity-update rate--and specify its implementation before comparing costs. Definition 28 and Definition J.1 register the binary structural quotient, and Theorem J.1 gives its log-cardinality $\varepsilon_0=\ln2$. On a separately registered physical-reset branch, Theorem 31 gives $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)$; conversion into heat requires the implementation's reset temperature, activity fraction, and dissipation ledger.

Suppose that implementation supplies a generated-heat rate $\dot Q_{\mathrm{gen}}(A_{\mathrm{pred}})$, a cooling law $\dot Q_{\mathrm{diss}}(T)$, and a finite thermal response. If the resulting internal temperature affects the prediction channel according to the monotonicity hypothesis of Lemma N.4, the associated implementation-specific overhead may be recorded as $C_{\mathrm{noise,internal}}(A_{\mathrm{pred}})$ inside $C_{\mathrm{req}}$. No such overhead follows from SPAP or Landauer alone without this heat-balance bridge.

### N.3.4 Effective Limits on the Rate of Predictive Acceleration

If a particular implementation has a finite maximum cooling rate and a monotone generated-heat law, define an implementation-dependent threshold, when it exists, by
$$
\left.\dot Q_{\mathrm{gen}}(A_{\mathrm{pred}})\right|_{A_{\mathrm{pred,crit}}}
=
\dot Q_{\mathrm{diss,max}}.
\tag{N.4a}
$$
Operation above that threshold may produce thermal runaway in that model. The quantity $A_{\mathrm{pred,crit}}$ depends on the registered processor and cooling mechanism. PCE can favor operation below it only after this implementation-specific term has been incorporated into the relevant PCE potential.

## N.4 The Unified Cost of Transgression (UCT)

<a id="theorem-nuct-frame-consistent-additive-mean-work-bound"></a>**Theorem N.UCT (Frame-Consistent Additive Mean-Work Bound).** Prescribe a timelike payload trajectory over $0\le\tau\le\tau_f$ with finite $\tau_f>0$, starting from laboratory rest. Assume the payload begins and ends with invariant mass $m_0>0$ and the same internal stored energy. Laboratory work is the only net energy supply; every additional incoming energy source or recoverable field-energy change must be entered separately. Throughout this theorem and its direct work-ledger consequences, work, exported energy and power denote ensemble means along that prescribed trajectory. Let
$$
R_{\mathrm{com}}(\tau):=R(C_{\mathrm{req}}(\tau),T_{\mathrm{eff}}(\tau))\ge0
$$
be a measurable lower bound on the mean exported predictive-loss energy per unit proper time in the instantaneous comoving frame. Require zero mean exported spatial momentum there, a disjoint kinetic-energy ledger, and integrability of $\gamma R_{\mathrm{com}}$. Then
$$
W_{\mathrm{tot}}^{\mathrm{lab}}\ge m_0c^2(\gamma_f-1)+\int_0^{\tau_f}\gamma(\tau)R_{\mathrm{com}}(\tau)\,d\tau.\tag{N.5}
$$
A random trajectory requires the corresponding conditional momentum premise and expectation of the trajectory-dependent integral. Invariant-mass, internal-energy, anisotropic-momentum, other-supply or recoverable-field-energy changes require their explicit four-momentum entries. ∎

> **Box N.1: Derived Scaling of Kinetic vs Predictive Contributions**
>
> Consider one-dimensional motion from laboratory rest with constant proper acceleration $a>0$ over proper-time duration $\tau_f>0$, constant refresh entropy coordinate $C\ge0$, constant proper cycle time $\tau_{\mathrm{cycle}}>0$, and payload mass $m_0>0$. Use the mean-energy convention of Theorem N.UCT. The final rapidity is $\eta=a\tau_f/c>0$, so that
>
> $$
> \gamma(v_f)=\cosh\eta,\qquad v_f=c\tanh\eta.
> $$
>
> The Unruh temperature is (Equation N.4)
>
> $$
> T_U(a)=\frac{\hbar a}{2\pi c k_B}.
> $$
>
> In the Landauer-saturating limit for a logically irreversible refresh of $C$ bits of predictive state (Theorem 31), the modeled acceleration-dependent incremental energy dissipation per refresh is (Theorem N.3)
>
> $$
> E_{\text{pred}}^{\mathrm{sat}}(a,C)
> =k_B T_U(a)\,(\ln 2)\,C
> =\frac{\hbar\ln 2}{2\pi c}\,a\,C.
> $$
>
> If such refreshes occur on an independently registered proper cycle time $\tau_{\mathrm{cycle}}>0$, the corresponding Landauer-saturating comoving predictive power is
>
> $$
> P_{\text{pred}}^{\mathrm{sat,com}}(a,C)
> =\frac{E_{\text{pred}}^{\mathrm{sat}}(a,C)}{\tau_{\mathrm{cycle}}}
> =\frac{\lambda_{PM}}{\tau_{\mathrm{cycle}}}\,a\,C,
> $$
>
> where $\lambda_{PM}=\hbar\ln 2/(2\pi c)$ (Definition N.4). Under the isotropic-export hypotheses of Theorem N.UCT, the associated saturation-branch laboratory work is
>
> $$
> W_{\text{pred}}^{\mathrm{sat,lab}}
> =\int_0^{\tau_f}\gamma(\tau)P_{\text{pred}}^{\mathrm{sat,com}}\,d\tau
> =\frac{\lambda_{PM}c}{\tau_{\mathrm{cycle}}}\,C\sinh\eta.
> $$
>
> The kinetic work is (Lemma N.3)
>
> $$
> W_{\text{kin}}^{\mathrm{lab}}
> =m_0c^2(\gamma(v_f)-1)
> =m_0c^2(\cosh\eta-1).
> $$
>
> Their laboratory-frame ratio on this segment is therefore
>
> $$
> \frac{W_{\text{pred}}^{\mathrm{sat,lab}}}{W_{\text{kin}}^{\mathrm{lab}}}
> =\frac{\lambda_{PM}}{m_0c\,\tau_{\mathrm{cycle}}}\;C\;\frac{\sinh\eta}{\cosh\eta-1}.
> $$
>
> This is a special Landauer-saturating, isotropic-export example. The full UCT bound (Equation N.5) adds background and internal contributions through $T_{\mathrm{eff}}(\tau)$ and $C_{\mathrm{req}}(\tau)$ and retains the same Lorentz factor in the laboratory energy ledger.

## N.5 Proof of the UCT Theorem

We restate the theorem (Equation N.5) for convenience before proceeding with the proof.

> **Restatement N.UCT (Frame-Consistent Form for Proof Use).**
> Under the prescribed-trajectory, ensemble-mean, invariant-mass, equal-internal-energy, zero-mean-comoving-momentum, disjoint-ledger and source-exhaustion hypotheses of Theorem N.UCT, let
> $$
> R_{\mathrm{com}}(\tau)
> :=
> R\!\left(C_{\mathrm{req}}(\tau),T_{\mathrm{eff}}(\tau)\right)
> $$
> be predictive-loss energy per unit proper time in the instantaneous comoving frame. Then the laboratory work obeys
> $$
> W_{\mathrm{tot}}^{\mathrm{lab}}
> \ge
> m_0c^2(\gamma_f-1)
> +
> \int_0^{\tau_f}\gamma(\tau)R_{\mathrm{com}}(\tau)\,d\tau.
> $$
> Additional invariant-mass, internal-energy, anisotropic-momentum, or recoverable-field-energy changes require the explicit four-momentum terms listed in the theorem.

### N.5.1 Preparatory Lemmas

<a id="lemma-n1-comoving-predictive-power-bound"></a>**Lemma N.1 (Comoving Predictive Power Bound).** In the instantaneous comoving frame, the exported predictive-loss power required by the declared operational-cost model obeys
$$
P_{\mathrm{pred}}^{\mathrm{com}}(\tau)
\ge
R_{\mathrm{com}}(\tau)
:=
R\!\left(C_{\mathrm{req}}(\tau),T_{\mathrm{eff}}(\tau)\right).
$$
*Proof.* This is the temperature-dependent operational-cost assumption of Section N.3.1, evaluated in the instantaneous comoving frame. Transformation of the associated exported energy to another frame is a separate four-momentum step and is not contained in the definition of $R_{\mathrm{com}}$. ∎

<a id="lemma-n2-conditional-transfer-of-the-spap-divergence-bound"></a>**Lemma N.2 (Conditional transfer of the SPAP divergence bound).** Fix a target $\alpha_{\mathrm{tgt}}<\alpha_{\mathrm{SPAP}}$ and set $\delta_{\mathrm{SPAP}}:=\alpha_{\mathrm{SPAP}}-\alpha_{\mathrm{tgt}}\in(0,\delta_0]$. Suppose $\mathfrak C_{B.2}$ is accepted for the same task family and that
$$
C_{\mathrm{SPAP}}(\alpha_{\mathrm{tgt}})
\ge
C_{\mathrm{uni}}(\delta_{\mathrm{SPAP}}).
$$
Then
$$
C_{\mathrm{SPAP}}(\alpha_{\mathrm{tgt}})
\ge
c_{\mathrm{SPAP}}
\frac{\log(1/\delta_{\mathrm{SPAP}})}
{\delta_{\mathrm{SPAP}}^2}.
$$
An observed value $PP$ may be substituted for $\alpha_{\mathrm{tgt}}$ only when the certificate registers that identification and its confidence event.

*Proof.* Theorem 14 gives the displayed lower bound for $C_{\mathrm{uni}}(\delta_{\mathrm{SPAP}})$ on the certified task family. Transitivity with the domination hypothesis proves the claim. ∎

<a id="lemma-n3-relativistic-work"></a>**Lemma N.3 (Relativistic work).** For a point particle of rest mass $m_0$, the minimum work required to accelerate it from rest to speed $v_f<c$, with no dissipative losses, is
$$
W_{\mathrm{kin}}(v_f)
=
m_0c^2(\gamma(v_f)-1).
$$

*Proof.* The relativistic energy at speed $v$ is $E(v)=\gamma(v)m_0c^2$. The work–energy theorem gives
$$
W_{\mathrm{kin}}
=
E(v_f)-E(0)
=
\gamma(v_f)m_0c^2-m_0c^2,
$$
which is the stated expression. Any dissipation can only increase the required input work. ∎

<a id="lemma-n4-complexity-cost-of-environmental-noise"></a>**Lemma N.4 (Complexity Cost of Environmental Noise).** Fix a prediction task and let $PP(C,T_{\text{eff}})$ denote the maximal predictive performance achievable at operational complexity $C$. Assume
$$
T_2\ge T_1
\quad\Longrightarrow\quad
PP(C,T_2)\le PP(C,T_1)
$$
for every admissible $C$. Fix $PP_{\text{op}}\in(\alpha,\beta)$ and a temperature domain $\mathcal T$ such that, for every $T\in\mathcal T$, the feasible set
$$
\mathcal F_T:=\{C\ge C_{op}:PP(C,T)\ge PP_{\text{op}}\}
$$
is nonempty and has finite infimum. Define $C^*(T):=\inf\mathcal F_T$. Then $C^*$ is non-decreasing on $\mathcal T$. For a chosen $T_{\text{base}}\in\mathcal T$,
$$
C_{\text{noise}}(T):=C^*(T)-C^*(T_{\text{base}})
$$
is finite and non-decreasing for $T\ge T_{\text{base}}$ in $\mathcal T$.

*Proof.* If $T_2\ge T_1$ and $C\in\mathcal F_{T_2}$, monotonicity gives
$$
PP(C,T_1)\ge PP(C,T_2)\ge PP_{\text{op}},
$$
so $C\in\mathcal F_{T_1}$. Thus $\mathcal F_{T_2}\subseteq\mathcal F_{T_1}$, and taking finite infima gives $C^*(T_2)\ge C^*(T_1)$. Subtracting the same finite baseline value preserves the inequality. ∎

### N.5.2 Proof of the Inequality (N.5)

*Proof of the Inequality (N.5).*

1.  **Registered Work Ledgers:** Under the theorem's hypotheses, endpoint kinetic work and isotropically exported predictive-loss work are disjoint contributions to the laboratory input ledger. Equation (N.5) is a lower bound on their sum; stored-energy changes, anisotropic momentum, recoverable field energy, or other work channels require their own explicit entries.

2.  **Lower Bound on Predictive Work:** The comoving predictive-loss rate at proper time $\tau$ is at least
    $$
    R_{\mathrm{com}}(\tau)
    =R(C_{\text{req}}(\tau),T_{\text{eff}}(\tau)).
    $$
    Along the prescribed trajectory, the mean comoving exported four-momentum increment is $(dE_{\mathrm{com}}/c,\mathbf0)$, with $dE_{\mathrm{com}}\ge R_{\mathrm{com}}(\tau)d\tau$. A Lorentz boost is linear and deterministic at each $\tau$, so its mean laboratory energy is $dE_{\mathrm{lab}}=\gamma(\tau)dE_{\mathrm{com}}$. Integrating the nonnegative lower bound gives
    $$
    W_{\text{pred}}^{\mathrm{lab}}
    \ge
    \int_0^{\tau_f}\gamma(\tau)R(C_{\text{req}}(\tau),T_{\text{eff}}(\tau))\,d\tau,
    $$
    On the optional SPAP/noise decomposition branch, require a registered source-disjointness audit proving that the SPAP, external-noise, internal-noise, and $T_{\mathrm{eff}}$ entries do not charge the same physical mechanism twice. With $\alpha_{\mathrm{tgt}}(\tau)$ fixed by the registered task schedule, define
    $$
    C_{\text{req}}(\tau)
    =
    C_{\text{SPAP}}(\alpha_{\mathrm{tgt}}(\tau))
    +C_{\text{noise,external}}(a(\tau))
    +C_{\text{noise,internal}}(A_{\text{pred}}(\tau)).
    $$

3.  **Explicit SPAP lower bound (optional form):** Assume one same-family $\mathfrak C_{B.2}$ and domination certificate supplies constants $c_{\text{SPAP}}>0$ and $\delta_0>0$ uniformly over the entire target schedule. By Lemma N.2, for $\delta(\tau)=\alpha_{\text{SPAP}}-\alpha_{\mathrm{tgt}}(\tau)\in(0,\delta_0]$,
    $$
    C_{\text{SPAP}}(\alpha_{\mathrm{tgt}}(\tau))
    \ge
    c_{\text{SPAP}}\,\frac{\log(1/\delta(\tau))}{\delta(\tau)^2}.
    $$
    Since $R(C,T)$ is non-decreasing in $C$ (Definition 3), this yields
    $$
    W_{\text{pred}}^{\mathrm{lab}}
    \ge
    \int_0^{\tau_f}\gamma(\tau)R\!\left(
    c_{\text{SPAP}}\frac{\log(1/\delta(\tau))}{\delta(\tau)^2}
    +C_{\text{noise,external}}(a(\tau))
    +C_{\text{noise,internal}}(A_{\text{pred}}(\tau)),
    T_{\text{eff}}(\tau)\right)\,d\tau.
    $$
    This transfer uses the same-family domination hypothesis of Lemma N.2. Replacing $\alpha_{\mathrm{tgt}}(\tau)$ by an observed $PP(\tau)$ additionally requires the registered confidence event.

4.  **Add Kinetic Work:** The laboratory kinetic work required to accelerate from rest to velocity $v_f$ is at least $W_{\text{kin}}^{\mathrm{lab}}\ge m_0c^2(\gamma_f-1)$ (Lemma N.3). The theorem's disjoint-ledger hypothesis permits addition, giving exactly (N.5). QED.

<a id="theorem-nucta-exact-four-momentum-resource-ledger-and-sharp-causal-export-bound"></a>**Theorem N.UCTa (Exact Four-Momentum Resource Ledger and Sharp Causal-Export Bound).** Retain the prescribed timelike payload trajectory of Theorem N.UCT, starting from laboratory rest, with laboratory velocity $\mathbf v(\tau)$, $\beta(\tau):=|\mathbf v(\tau)|/c$ and Lorentz factor $\gamma(\tau)$. Treat the payload as a pointlike body with four-momentum $p=m(\tau)u$, where $u$ is its four-velocity and $m(\tau)>0$ is an absolutely continuous invariant mass with $m(0)=m_0$. In the instantaneous comoving frame register, per unit proper time and as ensemble means along the trajectory, the supplied four-momentum rate $f_{\mathrm{in}}$ with components $(P_{\mathrm{in}}/c,\mathbf F_{\mathrm{in}})$, delivered to the payload by the laboratory source and a declared field, and the exported four-momentum rate $k$ with components $(R/c,\boldsymbol\Pi)$, with $\gamma(|P_{\mathrm{in}}|+c|\mathbf F_{\mathrm{in}}|+R+c|\boldsymbol\Pi|)$ integrable. Assume source exhaustion, $dp/d\tau=f_{\mathrm{in}}-k$, and let the laboratory work $W_{\mathrm{tot}}^{\mathrm{lab}}$ and the laboratory-frame energy change $\Delta E_F$ of the declared field satisfy $W_{\mathrm{tot}}^{\mathrm{lab}}-\Delta E_F=\int_0^{\tau_f}\gamma(P_{\mathrm{in}}+\mathbf v\cdot\mathbf F_{\mathrm{in}})\,d\tau$. Put $\Delta U:=(m(\tau_f)-m_0)c^2$. Then:

1. The ledger is exact:
   $$
   W_{\mathrm{tot}}^{\mathrm{lab}}
   =m_0c^2(\gamma_f-1)+\gamma_f\Delta U+\Delta E_F
   +\int_0^{\tau_f}\gamma\,(R+\mathbf v\cdot\boldsymbol\Pi)\,d\tau.
   \tag{N.5a}
   $$
   Its entries are the laboratory energy changes of disjoint owners: payload motion at the initial rest mass, the boosted change $\gamma_f\Delta U$ of payload rest energy, the declared field, and the exported kinetic, predictive and anisotropic radiation. The four-vector balance behind (N.5a) holds in every inertial frame, so under source exhaustion no entry is counted twice or omitted.
2. If the export is future-directed causal, $R\ge c|\boldsymbol\Pi|$, then with the Doppler factor $D:=\gamma(1-\beta)=\sqrt{(1-\beta)/(1+\beta)}$,
   $$
   W_{\mathrm{tot}}^{\mathrm{lab}}
   \ge m_0c^2(\gamma_f-1)+\gamma_f\Delta U+\Delta E_F
   +\int_0^{\tau_f}D\,R\,d\tau,
   \tag{N.5b}
   $$
   with equality exactly when $\boldsymbol\Pi=-(R/c)\,\mathbf v/|\mathbf v|$ for almost every $\tau$ with $R>0$ and $\mathbf v\ne0$.
3. With $\boldsymbol\Pi=0$, $\Delta U=0$, $\Delta E_F=0$ and $R\ge R_{\mathrm{com}}$, Equation (N.5a) reproduces (N.5).
4. The zero-mean-comoving-momentum premise of Theorem N.UCT cannot be removed. For rectilinear motion along a fixed unit vector $\mathbf e$ with constant proper acceleration $a>0$, constant $m=m_0$, constant $R>0$ and backward null export $\boldsymbol\Pi=-(R/c)\,\mathbf e$, the supply $P_{\mathrm{in}}=R$ and $\mathbf F_{\mathrm{in}}=(m_0a-R/c)\,\mathbf e$ realizes the trajectory, and with $\eta=a\tau_f/c$,
   $$
   W_{\mathrm{tot}}^{\mathrm{lab}}
   =m_0c^2(\cosh\eta-1)+\frac{Rc}{a}\bigl(1-e^{-\eta}\bigr)
   =m_0c^2(\cosh\eta-1)+\int_0^{\tau_f}\gamma R\,d\tau-\frac{Rc}{a}(\cosh\eta-1),
   \tag{N.5c}
   $$
   which lies strictly below the right side of (N.5) with $R_{\mathrm{com}}=R$.

*Proof.* A four-vector with comoving components $(E/c,\mathbf p)$ has laboratory time component $\gamma(E+\mathbf v\cdot\mathbf p)/c$. Applying this to $dp/d\tau=f_{\mathrm{in}}-k$ gives
$$
\frac{d}{d\tau}\bigl(\gamma mc^2\bigr)=\gamma(P_{\mathrm{in}}+\mathbf v\cdot\mathbf F_{\mathrm{in}})-\gamma(R+\mathbf v\cdot\boldsymbol\Pi).
$$
Integrating from laboratory rest, where $\gamma(0)=1$, and using the definition of $\Delta E_F$ gives $W_{\mathrm{tot}}^{\mathrm{lab}}-\Delta E_F=\gamma_fm(\tau_f)c^2-m_0c^2+\int_0^{\tau_f}\gamma(R+\mathbf v\cdot\boldsymbol\Pi)\,d\tau$, and $\gamma_fm(\tau_f)c^2-m_0c^2=m_0c^2(\gamma_f-1)+\gamma_f\Delta U$ proves (N.5a). Each entry is the laboratory energy change of one owner, and the underlying four-vector identity is Lorentz covariant. Causality gives $\mathbf v\cdot\boldsymbol\Pi\ge-|\mathbf v||\boldsymbol\Pi|\ge-\beta R$, hence $\gamma(R+\mathbf v\cdot\boldsymbol\Pi)\ge\gamma(1-\beta)R$, with equality exactly when $\mathbf v\cdot\boldsymbol\Pi=-\beta R$. For $\mathbf v\ne0$ and $R>0$ this forces $|\boldsymbol\Pi|=R/c$ antiparallel to $\mathbf v$, while for $\mathbf v=0$ or $R=0$ equality is automatic; integration proves (N.5b). Item 3 is the displayed specialization. In item 4 the comoving components of $dp/d\tau=f_{\mathrm{in}}-k$ read $c^2\dot m=P_{\mathrm{in}}-R=0$ and $m_0a=F_{\mathrm{in}}-\Pi$ along the direction of motion, which the stated supply satisfies. There $\gamma=\cosh(a\tau/c)$, $\beta=\tanh(a\tau/c)$ and $D=e^{-a\tau/c}$, so $\int_0^{\tau_f}DR\,d\tau=(Rc/a)(1-e^{-\eta})$ and $\int_0^{\tau_f}\gamma R\,d\tau=(Rc/a)\sinh\eta$, whose difference is $(Rc/a)(\cosh\eta-1)>0$. ∎

<a id="theorem-nuctb-autonomous-predictive-export-from-an-lc-vacuum-tem-source"></a>**Theorem N.UCTb (Autonomous Predictive Export from an LC–Vacuum-TEM Source).** The physical source and field entries of Theorem N.UCTa have the following nonzero realization on an inertial, variable-rest-energy branch. The source is an ideal lumped LC boundary node permanently connected to two identical, oppositely directed vacuum coaxial TEM guides. Ideal lumped constitutive elements, fixed perfectly conducting guides and their stationary constraint supports, the prepared finite initial field ensemble, and the point-port internal-energy convention below are the admitted physical model. The node/field coupling is the boundary law of the displayed action. All energy supplied during the run comes from the finite initial incoming-field inventory.

1. **Physical source, boundary action and field owners.** Fix $0<a<b$, vacuum constants $\epsilon_0,\mu_0>0$ with $c=(\epsilon_0\mu_0)^{-1/2}$, and define
   $$
   C'=\frac{2\pi\epsilon_0}{\ln(b/a)},\qquad
   L'=\frac{\mu_0}{2\pi}\ln(b/a),\qquad
   Z_0=\sqrt{L'/C'},\qquad L'C'=c^{-2}.
   \tag{N.UCTb.1}
   $$
   Both guides have coordinate $x\ge0$ increasing away from the node; their axes are $\mathbf e$ and $-\mathbf e$. Let $\phi_\pm(x,\tau)$ be their flux coordinates and $\Phi(\tau)$ the node flux, with $\phi_\pm(0,\tau)=\Phi(\tau)$. For $C,L>0$ the action is
   $$
   \mathscr A=\int\left[\frac C2\dot\Phi^2-\frac{\Phi^2}{2L}
   +\sum_{\sigma=\pm}\int_0^D
      \left(\frac{C'}2\dot\phi_\sigma^2-
                  \frac1{2L'}(\partial_x\phi_\sigma)^2\right)dx\right]d\tau.
   \tag{N.UCTb.2}
   $$
   The dot is the node's proper time, equal to laboratory time on this rest branch. The two guides are mirror copies, and the admitted initial data and boundary conditions preserve that symmetry. Choose $D$ sufficiently long that the retained time window has no signal at the outer endpoints. Their later terminations have no role in this window. The boundary constraint in (N.UCTb.2), together with the ideal capacitor and inductor terms, specifies the physical lumped-port model; the theorem derives its response and ledger on that model.

   Write the incoming and outgoing traveling voltage amplitudes on either arm as $h$ and $o$. With $F'=h$, $G'=o$ and $\phi(x,\tau)=F(\tau+x/c)+G(\tau-x/c)$, the physical voltage and outward current are
   $$
   V=h(\tau+x/c)+o(\tau-x/c),\qquad
   I=\frac{o(\tau-x/c)-h(\tau+x/c)}{Z_0}.
   \tag{N.UCTb.3}
   $$
   The fields in the annular vacuum region are $E_r=V/[r\ln(b/a)]$ and $B_\varphi=\mu_0I/(2\pi r)$ in each arm's oriented cylindrical frame. Variation of (N.UCTb.2) gives the vacuum TEM wave equation and
   $$
   v:=\dot\Phi=h+o,\qquad
   C\dot v+\frac\Phi L=\frac{2(h-o)}{Z_0},\qquad
   C\ddot\Phi+\frac2{Z_0}\dot\Phi+\frac\Phi L=\frac4{Z_0}h.
   \tag{N.UCTb.4}
   $$
   Thus the incoming field, the source state and its outgoing field are coupled by the same autonomous boundary dynamics.

   The disjoint dynamic energy owners are the node energy $E_{LC}=Cv^2/2+\Phi^2/(2L)$, the incoming traveling fields $E_F$, and the outgoing traveling fields $E_{\mathrm{out}}$. Static conductor/support and material energies have fixed owners and zero changes on this ideal stationary branch. Cross terms cancel in the total TEM energy even where the two waves overlap. In a no-return window with zero initial outgoing field,
   $$
   \begin{aligned}
   E_F(\tau)&=\frac2{Z_0}\int_\tau^\infty h(s)^2ds,
   &P_{in}(\tau)&=\frac{2h(\tau)^2}{Z_0},\\
   E_{\mathrm{out}}(\tau)&=\frac2{Z_0}\int_0^\tau o(s)^2ds,
   &R(\tau)&=\frac{2o(\tau)^2}{Z_0},\\
   \dot E_{LC}&=P_{in}-R,
   &E_{LC}+E_F+E_{\mathrm{out}}&=E_{LC}(0)+E_F(0).
   \end{aligned}
   \tag{N.UCTb.5}
   $$
   Here the amplitude is extended by zero outside its stated incoming support and before any outgoing response. The incoming-only $E_F$ is the declared field owner in N.UCTa; exported radiation belongs to $E_{\mathrm{out}}$ and is not counted there a second time.

2. **Actual source/field four-momentum record.** On one arm, integration across the annulus gives energy per unit length $(h^2+o^2)/(Z_0c)$, outward Poynting power $(o^2-h^2)/Z_0$, momentum per unit length $(o^2-h^2)/(Z_0c^2)$, and outward longitudinal momentum flux $(h^2+o^2)/(Z_0c)$. In particular an outgoing component of power $o^2/Z_0$ has null four-momentum rate $(o^2/(Z_0c),\pm o^2\mathbf e/(Z_0c))$ in the two arms. Their sum is
   $$
   k=(R/c,\mathbf0),\qquad
   f_{in}=(P_{in}/c,\mathbf0),\qquad \boldsymbol\Pi=\mathbf0.
   \tag{N.UCTb.6}
   $$
   The opposite incoming components have the same cancellation. The node port forces from incident and departing waves cancel between arms. During overlap the cylindrical-wall radial Maxwell traction can be nonzero: its signed radial stress is $2\epsilon_0ho/[r^2\ln^2(b/a)]$. That stress belongs to the fixed conductor/support owner. Its local mechanical power is zero because the supports are stationary, and its azimuthally integrated vector and paired axial forces have zero resultant. The source record includes these constraint stresses; it does not discard them by treating an overlapping field as a single traveling wave.

   Register a positive material/base mass $m_b$ and the point-port payload's internal-energy mass
   $$
   m(\tau)=m_b+\frac{E_{LC}(\tau)}{c^2},\qquad
   u_b=(c,\mathbf0),\qquad p=m u_b.
   \tag{N.UCTb.7}
   $$
   This is the admitted point-payload description of the lumped internal energy. The mirror-symmetric field forces and stationary support constraints maintain its rest trajectory. Equations (N.UCTb.5)--(N.UCTb.7) give $dp/d\tau=f_{in}-k$ with $m>0$ and an absolutely continuous mass. With $E_{LC}(0)=0$, the exact N.UCTa fields for every retained final time are
   $$
   \gamma=1,\quad m_0=m_b,\quad
   W_{\mathrm{tot}}^{lab}=0,\quad
   \Delta U=E_{LC}(\tau_f),\quad
   \Delta E_F=-\int_0^{\tau_f}P_{in}\,d\tau,
   \quad
   0=\Delta U+\Delta E_F+\int_0^{\tau_f}R\,d\tau.
   \tag{N.UCTb.8}
   $$
   The work/field identity in N.UCTa is populated by $W_{\mathrm{tot}}^{lab}-\Delta E_F=\int P_{in}d\tau$. The initial prepared field inventory supplies the input; no external work source, changing circuit parameter or release actuator acts during this run. All rates and the payload trajectory are identical on every sign branch below, so the equalities hold on each source atom and hence for their ensemble means. Lorentz transformation of these retained four-vectors gives the frame-covariant ledger; the physical construction itself is the registered rest branch.

3. **A populated finite preparation and nonzero ringdown.** Set
   $$
   L=Z_0^2C,\qquad \gamma_0=\frac1{Z_0C},\qquad
   T_0=\gamma_0^{-1},\qquad
   h_z(\tau)=
   \begin{cases}zH\sin^2(\pi\gamma_0\tau),&0\le\gamma_0\tau\le1,\\0,&\text{otherwise},\end{cases}
   \quad z\in\{-1,1\},\quad H>0.
   \tag{N.UCTb.9}
   $$
   Supply this finite incoming Cauchy datum on both guides: $V(x,0)=h_z(x/c)$, $I(x,0)=-h_z(x/c)/Z_0$, and $\Phi(0)=v(0)=0$. A flux representative is $\phi_\pm(x,0)=\int_0^{x/c}h_z(s)ds$. Its constant tail carries zero electric and magnetic fields. The voltage and current vanish outside $0\le x\le cT_0$, and the initial compatibility at the node holds since $h_z(0)=0$. The prepared packets, including their sign and energy, are input resources present before the ledger interval.

   Put $u=\gamma_0\tau$ and $\Phi_z(\tau)=zH y(u)/\gamma_0$. The unique boundary solution is
   $$
   y(u)=4\int_0^{\min(u,1)}(u-s)e^{-(u-s)}\sin^2(\pi s)ds,
   \qquad
   v_z=zH y'(u),\qquad
   o_z=zH\,[y'(u)-\mathbf1_{[0,1]}(u)\sin^2(\pi u)].
   \tag{N.UCTb.10}
   $$
   It is a solution of $y''+2y'+y=4\sin^2(\pi u)$ on $[0,1]$ and the homogeneous equation afterwards, with zero initial position and derivative. Define $a_1=y(1)$ and $b_1=y(1)+y'(1)$. The integrand gives $a_1>0$, and for $r=u-1\ge0$,
   $$
   y(1+r)=e^{-r}(a_1+b_1r),\qquad
   g(1+r):=y'(1+r)=e^{-r}(b_1-a_1-b_1r),
   \qquad J=\int_1^2g(u)^2du>0.
   \tag{N.UCTb.11}
   $$
   The explicit bounds $a_1\ge1/(4e)$ and $J\ge1/(64e^4)$ give a finite readout-conditioning certificate. Thus after the input ends, the source emits a nonzero autonomous signal. The total incoming inventory and node energy are
   $$
   E_F(0)=\frac{3H^2}{4Z_0\gamma_0}=\frac34CH^2,
   \qquad E_{LC}(\tau)=\frac{CH^2}{2}\,[y'(u)^2+y(u)^2].
   \tag{N.UCTb.12}
   $$
   In particular $E_{LC}(T_0)>0$ and all the node's stored energy is exported during its full ringdown on infinite guides; on a finite guide the theorem uses the finite no-return window. For the complete finite trial take $\tau_f=9T_0/4$, a readout location $x_d=cT_0/4$ and guide length $D=4cT_0$. The selected emission subwindow is $[T_0,2T_0]$ at the node; its delayed observation is $[5T_0/4,9T_0/4]$ at $x_d$. The energy ledger (N.UCTb.8) runs through the full $\tau_f$, including any additional node radiation after $2T_0$. Both windows precede the first possible outer-endpoint interaction.

4. **Predictive source, retained records and response map.** The prepared source ensemble has a fair teacher bit $Y$, an independent bit $B$ with $\Pr(B=1)=1/4$, observation $X=Y\oplus B$, and sign $z=2X-1$. The four source atoms $(Y,B)$ have probabilities $3/8,1/8,3/8,1/8$ in the order $(0,0),(0,1),(1,0),(1,1)$. Realize the retained observation and teacher records by two isolated, shielded ideal capacitors with positive capacitances $C_X,C_Y$ and nonzero charges $(2X-1)Q_X$, $(2Y-1)Q_Y$, where $Q_X,Q_Y>0$. Their energies are $E_X=Q_X^2/(2C_X)$ and $E_Y=Q_Y^2/(2C_Y)$, independent of the bit values. The observation capacitor is the payload's retained predictive memory; include its energy once in $m_b=m_{mat}+E_X/c^2$, with $m_{mat}>0$ carrying the remaining constant payload energy. The teacher capacitor stays at the protected external source port with its separate constant energy $E_Y$. The complete source record recovers $B=X\oplus Y$, so it requires no third memory. The field preparation depends only on $X$ through (N.UCTb.9). The teacher record is absent from predictor/receiver data until its later declared verification. Isolation and shielding are part of this ideal input-record model; both record energies are constant during the run and add no unrecorded exchange to (N.UCTb.8).

   The admitted ready-source code pairs each observation-capacitor sign with the same incoming-pulse sign $z=2X-1$. The source construction and prediction/readout identities are quantified on this code. Its stored predictive model is the committed posterior forecast
   $$
   p_X=\Pr(Y=1\mid X)=\frac12+\frac{2X-1}{4}.
   \tag{N.UCTb.13}
   $$
   Its physical model state is the sign of the retained payload capacitor, whose voltage is $(2X-1)Q_X/C_X$; the registered decoder is $p_X=1/2+C_XV_X/(4Q_X)$. The ready code carries that same forecast in the incoming pulse and resulting source/field solution. The normalized outgoing response is the pushforward of the four-atom source law by the unique boundary evolution (N.UCTb.10), together with the retained truth record. Both correct and incorrect prediction events are included. All running LC/TEM fields and predictor/receiver-accessible records, together with every energy ledger, depend only on $X$. The teacher capacitor's $Y$-dependent static field remains inside its shielded source owner. The source carrier has all four ready atoms $(X,Y)$ and admits every probability law on them; the displayed BSC law selects the scoring record in (N.UCTb.15). Joint later effects resolving $X$ and $Y$ separate the four atoms. Autonomous evolution, finite time restriction, retained-record selection and normalized classical postprocessing form the declared response protocols. Let $J_\tau(X,Y)$ be the complete capacitor/node/field state obtained at elapsed time $\tau$ from that ready atom. For the autonomous physical evolution $U_{\tau,s}$, uniqueness gives $U_{\tau,s}J_s(X,Y)=J_\tau(X,Y)$ whenever $0\le s\le\tau\le\tau_f$. Thus the realization is a family indexed by elapsed time, or equivalently a complete trajectory code. Its initial four-atom image is the ready-state class; the later images are the evolved classes. This family intertwines the declared operations pointwise and hence preserves every finite protocol law, its histories and classical spectator extension. Record-query functionals do not insert an unmodeled powered receiver into the node energy ledger. An intervention that changes the stored observation alone or independently relabels a pulse leaves the admitted ready code and requires its own preparation/response record.

   The actual field supports the registered linear readout
   $$
   \mathscr O_z=
   \frac1J\int_1^2 g(u)\,
      o_z\!\left(\frac{u}{\gamma_0}\right)du=zH,
   \qquad p_{\mathrm{read}}=\frac12+\frac{\mathscr O_z}{4H}=p_X.
   \tag{N.UCTb.14}
   $$
   At $x_d$ use the same outgoing characteristic delayed by $x_d/c$; it is selected from the local TEM voltage/current as $(V+Z_0I)/2$. The observation is an explicit functional of the physical outgoing field, and source-to-observable equality (N.UCTb.14) is the response-faithful realization map. It is a registered observable, not an additional powered detector whose resources have been omitted from the source ledger. An inserted receiver that changes the port boundary law has its own circuit and energy owners.

   Later verification uses the retained $Y$ with squared loss. Both the circuit-coded forecast and its outgoing readout have
   $$
   \mathbb E[(p_X-Y)^2]=\frac3{16},\qquad
   \mathbb E[(1/2-Y)^2]=\frac14,
   \qquad \text{predictive gain}=\frac1{16}>0.
   \tag{N.UCTb.15}
   $$
   Thus the exported waveform carries the actual forecast of a fixed, nontrivial prediction task. The positive rate $R$ in (N.UCTb.5) is energy physically transferred into that implementation's outgoing predictive record. Its identification is the derived Maxwell Poynting flux, without identifying it with a reset heat or a universal minimum over all source amplitudes. The original temperature/Unruh and constant-mass specializations of N.UCT retain their separately stated premises.

5. **Finite response and ledger error record.** For an additive error $n(u)$ in the calibrated outgoing voltage record over $1\le u\le2$,
   $$
   |\widetilde{\mathscr O}-zH|
       \le\frac{\|n\|_{L^2[1,2]}}{\sqrt J},\qquad
   |\widetilde p-p_X|
       \le\frac{\|n\|_{L^2[1,2]}}{4H\sqrt J},
   \tag{N.UCTb.16}
   $$
   where the reported forecast is clipped to $[0,1]$. Its squared loss changes by at most twice the second bound, without any assumption that the readout error is independent of $Y$. For either incoming or outgoing two-arm power record on $[0,\tau_f]$, if its common-mode voltage error is $e$ and its exact voltage is $w$,
   $$
   \left|\frac2{Z_0}\int[(w+e)^2-w^2]d\tau\right|
   \le\frac2{Z_0}\,[2\|w\|_2\|e\|_2+\|e\|_2^2].
   \tag{N.UCTb.17}
   $$
   For an error in the symmetric incoming waveform and the initial node state, with the same $C,L,Z_0$, define $E_\delta(0)=C(\delta v(0))^2/2+(\delta\Phi(0))^2/(2L)$. Linearity and passivity give the derived source-to-output bound
   $$
   \int_0^{\tau_f}(\delta o)^2d\tau\le
   \int_0^{\tau_f}(\delta h)^2d\tau+\frac{Z_0}{2}E_\delta(0).
   \tag{N.UCTb.18}
   $$
   On the matched window, the voltage norm in dimensionless time obeys
   $$
   \|\delta o(u/\gamma_0)\|_{L^2([1,2],du)}\le
   \left[\gamma_0\left(\int_0^{\tau_f}(\delta h)^2d\tau+\frac{Z_0}{2}E_\delta(0)\right)\right]^{1/2}.
   \tag{N.UCTb.19}
   $$
   A total-variation error $\varepsilon_{task}$ in the four-atom task law changes a bounded squared-loss mean by at most $\varepsilon_{task}$. Together with a uniform clipped-forecast error $\delta_p$, the retained gain is at least $1/16-\varepsilon_{task}-2\delta_p$.

   A source-parameter or boundary perturbation is admitted to this response certificate only with its own bound on these actual voltage records; the exact passive equations fix the unperturbed records. Symmetric common-mode perturbations preserve the zero-net-momentum source class. For an asymmetric forcing, its momentum and recoil must be registered separately and is not silently projected onto the rest solution.

*Proof.* Varying the line terms of (N.UCTb.2) yields $C'\partial_\tau^2\phi=(1/L')\partial_x^2\phi$. Integration by parts contributes $\sum_\sigma(\partial_x\phi_\sigma)(0)\delta\Phi/L'$ at the node. The node variation therefore gives $C\ddot\Phi+\Phi/L=\sum_\sigma\partial_x\phi_\sigma(0)/L'$. Since $\partial_x\phi=(h-o)/c$ and $L'c=Z_0$, this is (N.UCTb.4). Its forcing is supplied by the incoming characteristic of the initial field, and its unique solution determines the outgoing characteristic. The resulting wave solutions and node solve the common initial-boundary problem.

For the TEM fields, $E_r=(h+o)/[r\ln(b/a)]$ and $cB_\varphi=(o-h)/[r\ln(b/a)]$. The electric plus magnetic energy density is therefore $\epsilon_0(h^2+o^2)/[r^2\ln^2(b/a)]$; integrating $2\pi r\,dr$ gives $C'(h^2+o^2)=(h^2+o^2)/(Z_0c)$. The integrated Poynting flux is $VI=(o^2-h^2)/Z_0$, with no cross term. Division by $c^2$ gives momentum density. The longitudinal Maxwell momentum flux is the integrated energy density because both fields are transverse, giving $(h^2+o^2)/(Z_0c)$. The radial Maxwell stress is $(\epsilon_0E_r^2-B_\varphi^2/\mu_0)/2=2\epsilon_0ho/[r^2\ln^2(b/a)]$. Its azimuthal integral has zero vector resultant. The walls are stationary, so traction does no mechanical work. Equal mirrored arms cancel longitudinal momentum transfer at the junction, for both incident and outgoing components. This proves the stress and momentum assertions without dropping the overlap terms.

Changing variables from $x$ to the traveling-wave argument gives the two field inventories in (N.UCTb.5) during the stated finite-support, no-return interval. Multiplying the node equation by $v$ gives $\dot E_{LC}=2v(h-o)/Z_0=2(h^2-o^2)/Z_0$. Summing with the field derivatives proves exact total energy conservation. The source field owner is incoming-only, while the outgoing characteristic is the exported owner; their sum is the actual Maxwell field energy by the preceding cancellation identity. The source and guide constraints have their stated zero-work, zero-resultant ownership. Consequently every changing energy and momentum component is present once. Definition (N.UCTb.7) then gives $c^2\dot m=P_{in}-R$ and zero spatial force, which is exactly the four-momentum balance. Substituting the populated changes into N.UCTa proves (N.UCTb.8) and its field/work identity. Positivity of the fixed base mass guarantees the trajectory's positive invariant mass.

The retarded Green function of $(d/du+1)^2$ is $u e^{-u}$ for $u\ge0$. Convolution with the compact input gives (N.UCTb.10), with the initial and matching conditions at $u=1$. Its integrand is strictly positive on a subinterval at $u=1$, so $a_1>0$. The homogeneous critically damped solution after that time is (N.UCTb.11). If $J=0$, its continuous derivative would vanish throughout $1\le u\le2$, forcing $b_1=0$ and $a_1=0$ from the displayed affine factor, a contradiction. For $1/4\le s\le3/4$, one has $1-s\ge1/4$, $e^{-(1-s)}\ge e^{-1}$ and $\sin^2(\pi s)\ge1/2$, so the convolution gives $a_1\ge1/(4e)$. Moreover $J\ge e^{-2}\int_0^1[(b_1-a_1)-b_1r]^2dr=e^{-2}(a_1^2-a_1b_1+b_1^2/3)\ge e^{-2}a_1^2/4$, proving the stated lower bound. Thus the outgoing ringdown is nonzero. Integrating $\sin^4(\pi u)$ on $[0,1]$ gives $3/8$, proving the inventory in (N.UCTb.12); substituting $v=zHy'$ and $\Phi=zHy/\gamma_0$ with $L=Z_0^2C$ gives its energy formula. Both homogeneous terms decay to zero, so the full ringdown returns the stored node energy to the outgoing fields on infinite guides. The stated finite guide length keeps all retained characteristics away from the outer endpoints until after the final delayed observation.

The source atom law is normalized, $X$ is fair, and Bayes' rule gives (N.UCTb.13). The two isolated capacitor energies are independent of their signs and constant; assigning $E_X$ to $m_b$ and $E_Y$ to the external source gives the stated disjoint memory ownership. The two later charge-sign effects recover $X,Y$, so the physical code is injective on the full four-atom source. Uniqueness of the autonomous field/node evolution gives time composition and history restriction. Pullback of record effects and pushforward of normalized probability laws commute on each source atom; linear extension proves the asserted finite protocol and spectator identities. Linearity of the boundary problem makes its two field solutions exact sign reversals with identical quadratic energy/stress rates, so every source atom has the same trajectory and resource ledger. During $1\le u\le2$ the incoming amplitude is zero and $o_z=zHg(u)$. Substitution into (N.UCTb.14) gives the registered field readout. The delayed characteristic at $x_d$ is the same function, and solving (N.UCTb.3) for the outgoing voltage gives $(V+Z_0I)/2$. The physical record depends only on $X$, and the independently retained teacher bit is consumed only by the subsequent score. Conditional squared-loss minimization yields $p_X(1-p_X)=3/16$ for either observation; the constant forecast gives $1/4$, proving (N.UCTb.15). This establishes predictive ownership of the actual record whose energy flux was calculated.

Cauchy–Schwarz in the fixed nonzero matched-filter direction gives (N.UCTb.16); clipping toward $[0,1]$ cannot increase distance from $p_X\in[0,1]$. For forecasts and truth in $[0,1]$, squared loss is two-Lipschitz in its forecast argument. Expanding $(w+e)^2-w^2=2we+e^2$ and applying Cauchy–Schwarz gives (N.UCTb.17). Apply the same positive-energy identity (N.UCTb.5) to the linear difference solution with input $\delta h$ and initial state $(\delta\Phi,\delta v)$. Its final energy is nonnegative, so rearranging that identity gives (N.UCTb.18); the change of variables $u=\gamma_0\tau$ gives its record-norm bound. The task-law bound is the total-variation inequality for a loss in $[0,1]$. Adding it to the two-Lipschitz forecast bound proves the gain envelope, since the constant half forecast has loss exactly $1/4$ for every binary truth law. These are bounds on the stated complete field-derived records, with the declared symmetry and ownership conditions retained. ∎

Theorem N.UCTb supplies an autonomous LC–vacuum-TEM realization on its inertial four-atom ready code. The following distinct kinetic-scattering source extends the populated source classes to finite quantum registers with arbitrary references, generated accelerated trajectories and causal finite-step mean export profiles. Its scattering and clock laws are declared independently of the LC boundary action.

<a id="theorem-nuctc-finite-memory-radiation-source-for-the-uct-ledger"></a>**Theorem N.UCTc (Finite-Memory Radiation Source for the UCT Ledger).** The persistent-export branch of Theorem 7.6k has a response-faithful relativistic realization with an explicit radiation field and an independently specified propulsion mechanism. Its source is the following ideal radiation-transport and internal-state collision model.

Use Minkowski coordinates $x^0=ct$, signature $(+---)$ and a prescribed continuously differentiable, piecewise $C^2$ future-timelike worldline $z:[0,\tau_f]\to\mathbb R^{1,3}$, starting from laboratory rest, with $0<\tau_f<\infty$. Write $u=\dot z$, $u\cdot u=c^2$, and choose an absolutely continuous comoving orthonormal triad $e_i$, so $u\cdot e_i=0$ and $e_i\cdot e_j=-\delta_{ij}$. The payload has constant invariant mass $m_0>0$ and a degenerate finite memory $M=(\mathbb C^2)^{\otimes q}$, $q\ge1$. A smaller finite memory is embedded in a fixed code subspace of $M$. The momentum and internal-state degrees of freedom are distinct source coordinates. Actual source controls have finite descriptors: a finite partition of proper time with positive rational durations, piecewise constant rational proper-acceleration components $a_i$ and auxiliary force offsets $s_i$, and fixed algebraic polarization/direction settings. On each partition interval the comoving frame is Fermi--Walker transported:
$$
\dot u=\sum_i a_i e_i,\qquad
\dot e_i=\frac{a_i}{c^2}u.
$$
The solution is a finite product of explicitly specified matrix exponentials; integrating $u$ gives $z$. The constant-acceleration rectilinear example has $u=(c\cosh(a\tau/c),c\sinh(a\tau/c),0,0)$. The realization therefore has a finite control description.

The radiation source consists of independently addressable, positive-energy massless transport channels, each with a two-dimensional internal polarization carrier. The source includes the local polarization reference bases paired with its memory ports. Inertial coordinate changes transport those bases with the source; the scattering matrix below is written in these registered bases. A ray with momentum $p=(E/c)\ell$, $E>0$, $\ell=(1,\mathbf n)$, $|\mathbf n|=1$, follows $x=a+s\ell$. Between collisions its internal state is unchanged and its energy is $E I$ on the polarization carrier. This is a kinetic radiation field: its stress tensor is the sum of the ray stress tensors below, and interference between distinct registered transport channels is outside this source grammar. The constitutive collision laws are transmission with exchange of a memory qubit and the incident polarization, and specular reflection without a polarization-dependent momentum change. These fixed laws, the physical channel labels, the full incident-state domain, and the positive mass shell specify the source before any desired export rate is chosen.

At a transmission collision the two-qubit scattering matrix is
$$
S|a\rangle_M|b\rangle_B=|b\rangle_M|a\rangle_B,
\qquad a,b\in\{0,1\}.
\tag{N.UCTc.1}
$$
It acts as the identity on the incident momentum and all unaddressed systems. The source admits every polarization state, every positive incident energy and every incident direction. Thus the same scattering matrix acts on the full classical-quantum direct integral of momentum sectors, rather than being specified on one prepared input. Momentum labels are classical source coordinates; every polarization density matrix and its spectator correlations are admitted on each fiber. Coherence between distinct ray channels is absent from this kinetic source algebra. It is unitary, commutes with the free four-momentum, and is an energy-conserving internal-state scattering law. The model treats collisions as boundary scattering events; its specified physical dynamics are the free ray transport together with these scattering matrices. The source operates at the ideal kinetic scattering resolution; a Maxwell wave-packet implementation is a different source class.

A registered reset consumes $q$ distinct incoming carriers, each in $|0\rangle$, each with comoving energy $\epsilon_j>0$, and applies the tensor product of (N.UCTc.1). For $j=1,\ldots,J$, where $J<\infty$, choose a registered interval $I_j=(t_j,t_j+\Delta_j)\subset(0,\tau_f)$ with rational $t_j,\Delta_j>0$; the intervals are disjoint and ordered. An independently supplied uniform clock phase $U_j\in(0,1)$ gives $T_j=t_j+\Delta_j U_j$ and $h_j=\mathbf1_{I_j}/\Delta_j$. A second independent uniform phase selects from a finite list of algebraic unit directions using registered nonnegative algebraic probabilities summing to one. This fixes a constant probability measure $\mu_j$ on the comoving unit sphere, and write $\mu_{j,\tau}=\mu_j$. The uniform-phase source, exact clock delay and finite threshold comparison are declared ideal source services; their laws are fixed independently of the memory input. The finite descriptors enumerate every outcome and require no sampler for an arbitrary real function. The carrier momenta are transmitted unchanged, including in each individual realization. The finite inventory is exactly $qJ$ blank carriers; their input energy and their initially pure internal states are retained in the source account. Subsequent emitted carriers are preserved as separate external radiation records, including every correlation with spectators. The complete interface includes the input memory/reference system, whose state is transported by the channel without making an extra copy, the classical phase registers $U_j,V_j$, the finite control descriptor, every carrier allocation and emitter/absorber energy receipt, and every outgoing polarization register. Phase registers are read-only source inputs. Timing, directions, drive records and energy receipts are deterministic functions of those registers and the finite descriptor; they are carried through the realization rather than removed by a marginalization. The source promises no cyclic return of the external phase records or the consumed blank stock. The resetter's retained side-information ledger is distinct from the exported register: outgoing carriers have owner $X$, with no return or feedback port during the source interval. Including those carriers in the global verification interface supplies the persistent-export certificate of item 3 of Theorem 7.6k.

A second, deterministic radiation field provides propulsion. Write $\dot u=\sum_i a_i e_i$ and use the registered piecewise constant $s_i\ge0$. For each $i$ send two specularly reflected beams with incident comoving powers
$$
J_{i,+}=\frac c2\bigl((m_0a_i)_++s_i\bigr),
\qquad
J_{i,-}=\frac c2\bigl((-m_0a_i)_++s_i\bigr),
\qquad x_+:=\max(x,0).
\tag{N.UCTc.2}
$$
The $+$ beam has incoming direction $e_i$ and outgoing direction $-e_i$; the $-$ beam reverses these directions. These are continuous, deterministic kinetic-radiation beams. At each reflection the incoming and outgoing comoving energies agree. The free incoming rays are obtained by extending the prescribed incident null directions backwards from $z(\tau)$, and the outgoing rays by extending the reflected directions forwards. A null line meets the timelike worldline at most once, so this construction assigns each collision unambiguously. Emitters, absorbers and any initial radiation stock are part of the declared source boundary.

With $\bar n_j(\tau):=\int\mathbf n\,\mu_{j,\tau}(d\mathbf n)$, the source has the following conclusions. The vector components in (N.UCTc.5) use the transported triad. In laboratory scalar products they are rotated into the boost-aligned comoving axes of Theorem N.UCTa. Explicitly, with $\boldsymbol\beta=\mathbf v/c$ and $\mathbf e_i$ the laboratory spatial part of $e_i$, put $\mathbf r_i=\mathbf e_i-[\gamma/(\gamma+1)]e_i^0\boldsymbol\beta$ and $\boldsymbol\Pi_{\mathrm{boost}}=\sum_i\Pi_i\mathbf r_i$. Then $\mathbf r_i$ is an orthonormal spatial triad and $c k^0=\gamma R+c\sum_i\Pi_i e_i^0=\gamma(R+\mathbf v\cdot\boldsymbol\Pi_{\mathrm{boost}})$. The laboratory formulas below use this boost-aligned momentum vector.

1. For every input state $\rho_{MZ}$, including an arbitrary spectator $Z$, a reset has the exact joint output
   $$
   \rho_{MZ}\otimes|0\rangle\!\langle0|_B^{\otimes q}
   \longmapsto
   |0\rangle\!\langle0|_M^{\otimes q}\otimes\rho_{BZ}.
   \tag{N.UCTc.3}
   $$
   Thus the ready-register map and the persistent exported record are realized on one carrier. The retained terminal tests are the complete finite family of tensor-Pauli polarization analyzers, applied after the final source slice. Their apparatus and absorption energy lie outside this emission ledger; the source realization supplies their incident states and their complete predicted outcome laws. For a chosen analyzer let $L_y$ be its mutually orthogonal spectral projectors; all outcomes, including zero-probability outcomes, are retained and $\sum_yL_y^*L_y=I$. The declared terminal tester has the following normalized input-output instrument on the exported register:
   $$
   \rho_{MZ}\longmapsto
   |0\rangle\!\langle0|_M^{\otimes q}\otimes
   (L_y\otimes I_Z)\rho_{BZ}(L_y^*\otimes I_Z).
   \tag{N.UCTc.4}
   $$
   The sum over all outcomes is trace preserving. Every input, spectator correlation, terminal-test outcome and finite word in the registered scattering grammar is included. The claim realizes the emission channel and its response to these testers; the tester apparatus is a separate supplied interface. Polarization tomography separates the complete input-state quotient; the realization preserves composition, tensor products, adjoints, trace pairings and probabilities. The stochastic time/direction registers and every derived source receipt are retained with their declared normalized laws.

2. The ensemble exported reset-record radiation has comoving rates
   $$
   R(\tau)=q\sum_{j=1}^{J}\epsilon_j h_j(\tau),
   \qquad
   \boldsymbol\Pi(\tau)=\frac q c
   \sum_{j=1}^{J}\epsilon_j h_j(\tau)\bar n_j(\tau).
   \tag{N.UCTc.5}
   $$
   These are energy and momentum fluxes of the actual outgoing carriers. In particular $R\ge c|\boldsymbol\Pi|$. They are integrable, and their Lorentz-transformed laboratory energy is $\int\gamma(R+\mathbf v\cdot\boldsymbol\Pi_{\mathrm{boost}})\,d\tau$.

3. The radiation-pressure transfer from (N.UCTc.2) is exactly
   $$
   f_D=\sum_i\frac{2(J_{i,+}-J_{i,-})}{c}e_i
       =m_0\dot u,
   \qquad u\cdot f_D=0.
   \tag{N.UCTc.6}
   $$
   Hence the prescribed worldline solves the payload equation with the displayed physical beams. Each reset transmission has zero net four-momentum transfer to the body, including before averaging. The deterministic drive therefore maintains the same worldline for every memory state, reset time and export direction.

4. Let $F$ own every incoming reset-carrier segment and both segments of every drive-beam ray. Let $X$ own every outgoing reset-record segment. These owners are disjoint at the collision cut, and the memory's ready-register operation, the blank-carrier supply, the reflected drive field and the outgoing record all retain their distinct labels. For a directed ray segment $a+s\ell$, $0\le s\le L$, define
   $$
   T_{\mathrm{ray}}^{\mu\nu}(x)
     :=c p^\mu\ell^\nu\int_0^L
             \delta^{(4)}(x-a-s\ell)\,ds.
   \tag{N.UCTc.7}
   $$
   Its $00$ component integrates to the ray energy on every laboratory slice intersecting its interior. Sum (N.UCTc.7) over the finite random reset carriers and integrate it against the drive-beam intensity measure. With expectation taken for the random carriers, these operations define $T_F$ and $T_X$ as finite-energy distributional stress tensors. The source-boundary four-current $j_S$ is the signed sum of the actual emitted and absorbed ray momenta. Their divergences are
   $$
   \begin{aligned}
   \partial_\nu T_F^{\mu\nu}
     &=c j_S^\mu-c\int_0^{\tau_f}
          (f_D^\mu+k^\mu)\delta^{(4)}(x-z(\tau))\,d\tau,\\
   \partial_\nu T_X^{\mu\nu}
     &=c\int_0^{\tau_f}k^\mu
          \delta^{(4)}(x-z(\tau))\,d\tau,
   \end{aligned}
   \tag{N.UCTc.8}
   $$
   where $k$ has comoving components $(R/c,\boldsymbol\Pi)$. In the second line the exported rays continue freely through the final slice; any later absorption lies outside the ledger interval. Consequently the independently computed field energy
   $E_F(t)=\int T_F^{00}(ct,\mathbf x)\,d^3x$ and the source-boundary energy
   $W_{\mathrm{tot}}^{\mathrm{lab}}:=c\int j_S^0\,d^4x$
   satisfy
   $$
   W_{\mathrm{tot}}^{\mathrm{lab}}-\Delta E_F
     =c\int_0^{\tau_f}(f_D^0+k^0)\,d\tau,
   \qquad
   W_{\mathrm{tot}}^{\mathrm{lab}}
     =m_0c^2(\gamma_f-1)+\Delta E_F
       +\int_0^{\tau_f}\gamma(R+\mathbf v\cdot\boldsymbol\Pi_{\mathrm{boost}})\,d\tau.
   \tag{N.UCTc.9}
   $$
   Here a source boundary that injects or recovers radiation transfers precisely the displayed signed energy from or to its work store. Alternatively, initial radiation stock is counted in $E_F(t_0)$ and can give $W_{\mathrm{tot}}^{\mathrm{lab}}=0$. Both conventions use the same transport equation, and neither counts the incoming blank-carrier energy a second time as payload heat. A field-empty endpoint realization is also explicit. Extend the body worldline by an initial rest interval and a final coasting interval. Choose a common laboratory emission slice before all collisions and a common absorption slice after them. Terminate the incoming rays backwards on the emission slice and every outgoing drive ray forwards on the absorption slice; use the resulting endpoints as the prescribed emitter/absorber array. Leave the outgoing reset rays unabsorbed. The source array has bounded spatial support, finite total energy and the same finite analytic descriptor as the rays. Immediately before emission and immediately after drive absorption, $F$ is empty, so $\Delta E_F=0$. Every boundary transfer is retained in $j_S$.

5. Every finite step profile with algebraic nonnegative energy rates and algebraic comoving momentum rates satisfying $R\ge c|\boldsymbol\Pi|$, on disjoint rational intervals inside $(0,\tau_f)$, has an explicit source compiler. On each interval of duration $\Delta$ with $R>0$, take one reset with $q\epsilon=R\Delta$ and uniform completion time. Put $b=c\boldsymbol\Pi/R$. For $b\ne0$ choose the algebraic unit directions $\pm b/|b|$ with probabilities $(1\pm|b|)/2$; for $b=0$ choose an equal opposite pair. Zero-rate intervals consume no carriers. This finite compilation reproduces the prescribed step profile exactly through (N.UCTc.5). The compiled profile is the ensemble mean over the random completion times and directions of this finite carrier inventory.

*Proof.* The matrix $S$ permutes the four two-qubit basis vectors, so $S^*=S$, $S^2=I$, and it is unitary on the entire internal carrier. Since the free momentum acts as a scalar on each polarization fiber, $S$ commutes with all four momentum components. Tensoring with untouched systems proves (N.UCTc.3) first on matrix units $|a\rangle\langle b|_M\otimes Z_{ab}$ and then by linearity on every joint density operator. The formula includes the off-diagonal matrix units and therefore preserves entanglement with $Z$. Substituting the declared polarization analyzer gives (N.UCTc.4), and the projector normalization gives its trace identity. The map $|\psi\rangle_M\mapsto|0\rangle_M^{\otimes q}|\psi\rangle_B$ is an isometry $V$ with $V^*V=I$. Conjugation by the carrier identification preserves multiplication, adjoints and trace pairing, and the inverse readout of the exported register recovers $\rho_{MZ}$. The finite tensor-Pauli basis separates the memory marginal; tensoring it with every retained spectator effect separates the complete joint state. Repeated application proves the assertions for every finite word, retaining previous radiation registers rather than tracing them out during the induction. Appending the independently normalized phase laws and retaining the phases together with their deterministic timing, direction and source-receipt functions preserves normalization and all joint response laws. The complete source interface is therefore the state-and-record quotient just specified: equality of its full tester laws is preserved in both directions. The externally supplied terminal tester is evaluated on the output state.

For a reset at $\tau$ in direction $\mathbf n$, each emitted carrier has comoving four-momentum $(\epsilon_j/c,\epsilon_j\mathbf n/c)$. Taking the finite expectation over its time and direction gives (N.UCTc.5). The triangle inequality and $|\bar n_j|\le1$ give causality. The finite piecewise-analytic timelike worldline has bounded $\gamma$ and bounded speed below $c$, so all Lorentz-transformed rates are integrable. The time-component boost gives the stated exported laboratory energy.

An incident drive ray in direction $e_i$ has comoving momentum rate $(J_{i,+}/c)(u/c+e_i)$, and its reflected outgoing rate is $(J_{i,+}/c)(u/c-e_i)$. Their difference is $2J_{i,+}e_i/c$. The opposite beam contributes $-2J_{i,-}e_i/c$. Since $x_+-(-x)_+=x$, (N.UCTc.2) gives (N.UCTc.6). The temporal component in the comoving frame is zero, so the drive changes momentum without changing invariant mass. The incoming and outgoing reset momenta are identical on each fiber of (N.UCTc.1); they cancel exactly in the payload impulse balance. Thus $d(m_0u)/d\tau=f_D$ for every realized reset history. All beam intensities and energies on the finite interval are integrable because $a_i$, $s_i$ and $\gamma$ are bounded.

For a compactly supported smooth test function, differentiation of (N.UCTc.7) and integration by parts in $s$ give
$$
\partial_\nu T_{\mathrm{ray}}^{\mu\nu}
   =c p^\mu\bigl[\delta^{(4)}(x-a)
                   -\delta^{(4)}(x-a-L\ell)\bigr].
$$
This identity supplies all endpoints, including emitters and absorbers. At a drive reflection, the outgoing minus incoming endpoint contributions are $-c f_D\,d\tau$. At a reset, the incoming segment ends in $F$ with contribution $-c k\,d\tau$, and its outgoing segment begins in $X$ with contribution $+c k\,d\tau$. Boundary emission and absorption are exactly $c j_S$. Linearity, finite energy and Tonelli's theorem give (N.UCTc.8). The payload stress tensor $T_B^{\mu\nu}=c\int m_0u^\mu u^\nu\delta^{(4)}(x-z(\tau))\,d\tau$, continued along the body worldline outside the interval, has interior divergence $c\int f_D^\mu\delta^{(4)}(x-z(\tau))\,d\tau$. Hence $\partial_\nu(T_B+T_F+T_X)^{\mu\nu}=c j_S^\mu$. Integration between the initial and final laboratory slices proves (N.UCTc.9); the spatial boundary can be taken outside the finite ray segments, or the identical boundary flux can be included explicitly. In particular $c\int f_D^0\,d\tau=m_0c^2(\gamma_f-1)$. This derives the field identity required by Theorem N.UCTa from the separately defined stress tensor and source current. The enumeration of ray segments proves source exhaustion: all free-field contributions are assigned to $F$ or $X$, every scattering endpoint is paired above, and the ideal collision law has no interaction energy stored between its incoming and outgoing boundary states.

The frame equations preserve all inner products: for example $d(u\cdot e_i)/d\tau=-a_i+a_i=0$, and $d(u\cdot u)/d\tau=0$. Their constant-coefficient matrix-exponential solution therefore remains future timelike, and supplies the advertised finite controls and worldline. Finally $|b|\le1$ makes the two probabilities in item 5 nonnegative, summing to one, with mean direction $b$. Every quantity used by the finite clock and threshold sampler is explicitly algebraic except the prescribed matrix-exponential frame transport. Substitution proves the compiled rate formula. On a zero-rate interval causality forces $\boldsymbol\Pi=0$. This exhausts the declared finite-step compiler class. In the padded endpoint construction, finite propagation speed and compactness of the collision interval bound every source endpoint position; all incoming $F$ segments are created after the initial slice and all outgoing drive $F$ segments end before the final slice. Thus its claimed zero field-energy change follows from the actual segment inventory. In particular constant rectilinear proper acceleration $a>0$, with rational $a$ and $\tau_f$, uniform reset time during that acceleration interval and the single backward direction give $\boldsymbol\Pi=-(R/c)\mathbf e$, $P_{\mathrm{in}}=R$ and $\mathbf F_{\mathrm{in}}=(m_0a-R/c)\mathbf e$. Equation (N.UCTc.9) then gives exactly the backward-export work in (N.5c), with the initial and final padding contributing no kinetic or reset-export increment. Equal opposite reset directions instead give $\boldsymbol\Pi=0$ and the additive work equality of (N.5), with $R_{\mathrm{com}}=R$ for this registered reset-export implementation. ∎

The source in Theorem N.UCTc resets a predictive register by exporting its complete displaced record. For an explicit predictive initial source, supply the classical joint state on memory $X$ and future target $Y$ with probabilities $q(0,0)=q(1,1)=3/8$ and $q(0,1)=q(1,0)=1/8$. The complete retained side information is $Y$ and the independent timing/direction registers; there is no retained copy of $X$. The predictor's access is the memory, and the later target is $Y$. This four-row mixed initial-state contract gives $\Pr(Y=X)=3/4$ and $H(X\mid Y)=h_{\mathrm{nat}}(1/4)>0$, where $h_{\mathrm{nat}}(p)=-p\ln p-(1-p)\ln(1-p)$. At the registered forecast time, (N.UCTc.3) returns the memory to its ready value and exports $X$, including its correlations with $Y$. Reading the outgoing polarization in the computational basis supplies the prediction $X$ of the later target $Y$, with success probability $3/4$; the memory-independent symmetric predictor succeeds with probability $1/2$. The target and terminal readout are scheduled after the source interval, with the forecast read before the target is released. The joint mixed state is a supplied initial source; no hidden seed that reconstructs $X$ is added to the retained interface. Its displaced record therefore occupies the persistent-export branch of Theorem 7.6k. The resulting $R$ is an implementation-specific radiation-energy charge for that completed predictive-memory return. Thermal erasure heat is governed by Definition 28, and the microscopic Unruh identification by Section N.7.2.

<a id="corollary-nuctd-source-populated-uct-realization-and-initial-stock-completion"></a>**Corollary N.UCTd (Source-Populated UCT Realization and Initial-Stock Completion).** The physical-source identification of the export $(R,\boldsymbol\Pi)$ and of the declared field in Theorem N.UCTa, together with its formal realization, is populated by the independently specified kinetic radiation source of Theorem N.UCTc. Its scope is every finite input memory and reference state, every finite registered scattering word and retained tester outcome, and every source descriptor, stock and causal algebraic finite-step export profile specified in that theorem. Every finite collision descriptor admits an initial-stock realization with the same collision/emission channel and payload trajectory, with no active emitter, absorber, clock or threshold operation during the retained source interval. Its initial-stock and source/field records are computed separately: full boundary-work records need not agree with those of a boundary-driven realization. Its actual exported radiation and declared-field stress satisfy the hypotheses and conclusion of Theorem N.UCTa.

*Proof.* First realize the source without an operating timing or direction-selection service. Fix its finite descriptor and an initial laboratory slice strictly before every collision. Its independently supplied phase registers determine the completion times and selected directions by the finite formulas of N.UCTc. Boost each selected positive null momentum from the specified comoving frame to the laboratory frame, extend the corresponding null line backward from its collision event to the initial slice, and place the specified blank carrier there. Give these initial states exactly the pushforward of the supplied phase law. Retain the phases and every allocation and separately computed initial-stock/energy receipt. The maps use only the same finite threshold comparisons and finite products of matrix exponentials already specified by the source; they neither inspect the memory input nor introduce a sampler for an arbitrary function. Similarly place the deterministic incoming propulsion intensity on the initial slice by backward transport from each of its prescribed collision events.

The finite collision interval and bounded frame coefficients imply bounded $\gamma$ and bounded initial ray positions. Each reset uses exactly q positive-energy carriers, giving qJ carriers in total; the deterministic drive intensity has finite total energy by the finite control bounds. A null line meets the timelike body at most once. Free transport therefore produces exactly the prescribed collision events, and the fixed source scattering laws produce the same collision/emission history as N.UCTc, with the distinct source/field records belonging to this initial-stock preparation. Leave outgoing drive rays in the declared field F through the final slice and outgoing reset rays in X. For the distributional stress calculation continue incoming segments slightly before the initial slice and outgoing segments beyond the final slice, so their preparation and eventual absorption endpoints lie strictly outside the retained slab. No boundary emitter or absorber acts during this interval. The read-only phase records need no in-run update, and timing is physically encoded in the initially supplied ray positions. This construction consumes a supplied initial ensemble, not a cyclically restored preparation apparatus. Its initial radiation energy, blank purity, phases and retained records remain explicit resources.

For completeness, on the full internal carrier the source scattering matrix is $S|a,b\rangle=|b,a\rangle$, so $S^*=S$ and $S^2=I$. Momentum acts as a scalar on each polarization fiber and S commutes with it. On arbitrary matrix units of the input memory and an arbitrary untouched reference, the tensor product of these swaps gives
$$
 |a\rangle\langle b|_M\otimes Z_{ab}\otimes|0\rangle\langle0|_B
 \longmapsto
 |0\rangle\langle0|_M\otimes|a\rangle\langle b|_B\otimes Z_{ab}.
$$
Linear extension proves the complete-reference state identity (N.UCTc.3), including all off-diagonal blocks. The isometry $V|a\rangle=|0\rangle|a\rangle$ has $V^*V=I$ and identifies the full input algebra with its physical output corner; it preserves multiplication, adjoints and trace pairing, with the corner projector as its unit. The complete family of supplied tensor-Pauli tests and all spectator effects separates the state. Each analyzer includes all its projectors, whose sum is I, so its outcome maps sum to a trace-preserving map. Retaining previous exports and all classical source records proves composition, tensoring and history restriction by induction on every finite scattering word. Thus the realization preserves and reflects the complete registered response quotient.

Each outgoing reset carrier actually has comoving four-momentum $(\epsilon_j/c,\epsilon_j n/c)$. Averaging the normalized completion-time and direction law gives exactly
$$
 R=q\sum_j\epsilon_j h_j,
 \qquad \Pi=(q/c)\sum_j\epsilon_jh_j\bar n_j.
$$
The inequality $c|\Pi|\le R$ follows from $|\bar n_j|\le1$. Conversely, for every stated finite-step profile, $q\epsilon=R\Delta$ and the two directions $\pm b/|b|$ with weights $(1\pm|b|)/2$, where $b=c\Pi/R$, recover its exact mean; use an equal opposite pair when b is zero and no stock when R is zero. This is the full compiler domain of item 5 of Theorem N.UCTc. A repeated reset of an already ready memory exports the ready state; a later reset exports fresh predictive information only after an independently supplied input or update operation.

The propulsion beams have nonnegative incident powers $J_{i,\pm}$ from (N.UCTc.2). Their reflected momentum difference is $2(J_{i,+}-J_{i,-})e_i/c=m_0a_ie_i$. Summing over i gives $f_D=m_0\dot u$ and $u\cdot f_D=0$. Every reset transmission separately preserves its momentum, so it adds no random recoil. Hence the prescribed worldline is the solution of the populated payload balance for every memory input and every source history.

The field energy is computed from its own stress tensor: each directed segment has the independently specified stress tensor (N.UCTc.7), whose slice energy is its positive ray energy and whose divergence is its initial momentum endpoint minus its final momentum endpoint, multiplied by c. F contains all incoming reset segments and both segments of each drive ray; X contains every outgoing reset segment. A reset collision thus contributes $-ck$ to F and $+ck$ to X. A drive collision contributes $-cf_D$ to F. All external source endpoints contribute $cj_S$. Summing these exact contributions gives (N.UCTc.8). Adding the body stress cancels the interior endpoints. Integration over the laboratory slab yields
$$
 W_{\rm tot}^{lab}-\Delta E_F
 =c\int(f_D^0+k^0)d\tau
 =m_0c^2(\gamma_f-1)
  +\int\gamma(R+v\cdot\Pi_{\mathrm{boost}})d\tau.
$$
In the initial-stock realization the interior source current vanishes and $W_{\rm tot}^{lab}=0$; the same identity is supplied by the actual decrease of F's initial inventory. The source-boundary convention with emitters and recoverable drive radiation instead has the signed work current of N.UCTc.9. Neither convention duplicates the incoming blank energy as payload heat. Every field segment, collision and boundary endpoint has exactly one owner, and the ideal boundary-scattering law has no omitted intercollision interaction energy. Thus $f_{in}=f_D+k$ and the independently constructed F supply the source-exhaustion and work/field hypotheses of N.UCTa.

For nonvacuity set $q=J=1$ and use the independently supplied mixed binary memory/target law with equal diagonal probabilities $3/8$ and equal off-diagonal probabilities $1/8$. The memory forecasts the target with probability $3/4$, versus $1/2$ for its memory-independent symmetric baseline. At the completed return the memory is ready and its full former record and target correlations are in $X$, with no retained copy or reconstructing seed. The radiated energy just computed therefore belongs to an actual predictive-memory export. This is the persistent-export alternative of Theorem 7.6k. Nonzero carrier energy supplies a nonvacuous source. The source identification, declared-field exhaustion and response-faithful realization that Theorem N.UCTa requires are all obtained on this one independently specified source class. ∎

## N.6 Interpretation and Programme

*   **Two Costs in One Conditional Ledger:** Relativistic endpoint kinetic work and predictive-resource cost can be entered in the same work ledger, but velocity and proper acceleration are distinct variables. A body may coast inertially at high constant velocity with $a=0$ and therefore has no Unruh increment. On the detector-response, additive-temperature, and active-refresh branch, periods of nonzero proper acceleration can add a predictive-loss term; internal processing can add a separate self-heating term. The UCT combines these declared contributions.

*   **No Simple Algebraic Lock:** There is no algebraic equality linking $v$ and $PP$, and proper acceleration rather than velocity activates the modeled Unruh increment. Within a specified trajectory class, fixed boundary data, and an accepted response/refresh branch, the right-hand side of (N.5) or (N.18) may be used as a conditional objective or lower-bound surrogate. A finite budget can then produce a trade-off between trajectory work and predictive resources, but the UCT alone does not force every system to lower $PP$, adopt a smoother path, or contract its predictive horizon. **Temporal Horizon Contraction** and **Predictive Resolution Contraction** label possible outputs of that registered optimization model. Incorporating the complete functional into the global PCE potential $V$ remains future work.

*   **Empirical Test:** On the registered detector-response, additive-temperature, active-refresh, and export branch, proper acceleration contributes a specified incremental refresh cost whose effect on predictive performance can be tested after baseline thermal and implementation costs are controlled. Geodesic motion does not activate the proper-acceleration term without an additional orbital bridge. Laboratory, astrophysical, biological, or artificial-system tests must therefore certify the relevant response and refresh mechanism before interpreting a null or positive result as a UCT test.

## N.7 Ontological Interpretation of Prediction Relativity

The preceding sections construct an accelerated-detector response on the retained Dirac source and a conditional work ledger that consumes it. The relational account below proposes an identification between that emergent-spacetime description and predictive updating.

### N.7.1 Motion as an Emergent Interpretation of a Predictive Process

At the most fundamental level of the PU framework, there is no pre-existing spacetime for an MPU to "move through." Reality consists of a relational network of interacting MPUs (Hypothesis 1). In this foundational view:

* "Position" is an emergent property defined by an MPU aggregate's pattern of predictive relationships with the rest of the network.

* "Motion" is the macroscopic interpretation of a continuous, coordinated evolution of this relational pattern.

* "Physical Acceleration" is therefore not a primary concept but the emergent description of a rapid, resource-intensive reconfiguration of the system's predictive relationships with the entire network. It is fundamentally an act of predictive work on a massive scale.

### N.7.2 Relational Interpretation of the Unruh Effect: Open Microscopic Bridge

Theorem N.4a supplies the finite source Hamiltonian, accelerated observable, vacuum comparison, calibrated proper clock, nonzero KMS spectrum and finite-window response errors on the named Dirac source. PU's relational interpretation additionally proposes that acceleration corresponds to rapid relational updating.

Identifying MPU update or reset dissipation with that spectrum requires a same-source heat/export map, with its generator, state, worldline, clock, and source ownership independently specified. That map must identify the actual exported heat and exclude double counting with detector/control work and the field response. Theorem N.4a keeps those energy ledgers separate; its detector spectrum is the response input to this further identification.

Accordingly, "processing heat" and the Unruh bath enter the UCT cost ledger as analogous contributions. If an independently defined serialized link-cycle time $\tau_{\mathrm{link}}$ is used to set $a_*:=c/\tau_{\mathrm{link}}$, substitution into the standard Unruh formula gives the formal identity
$$
\frac{\hbar}{k_B T_U(a_*)}=2\pi\tau_{\mathrm{link}}.
$$
This algebra does not derive $\tau_{\mathrm{link}}$, a universal minimum update time, or the Unruh effect from SPAP.

### N.7.3 Consistency of the Two Descriptive Layers

Theorem N.4a derives the operational Unruh response on its declared source. The relational interpretation concerns the additional identification of that source dynamics with the MPU update/reset mechanism, through the heat/export bridge specified in Section N.7.2.

On this proposed relational reading, "software" prediction and "hardware" motion may contribute to one resource ledger while remaining physically distinct processes. Their identification as facets of one microscopic mechanism is a hypothesis requiring the bridge specified in Section N.7.2, not a conclusion of the UCT theorem.

## N.8 A High-Precision Test for Predictive Drag in Binary Pulsars

The proper-acceleration active-refresh branch of the UCT supplies a conditional acceleration-dependent loss term. The centers of mass of an ideal gravitational binary follow geodesics and therefore do not possess the proper acceleration entering the standard Unruh formula. Binary-pulsar timing becomes a test of UCT only after the additional orbital-acceleration bridge of Definition N.12a is declared; its fitted factor $q_{\mathrm{act}}^{\mathrm{orb}}$ is not a prediction of the proper-acceleration theorem.

#### N.8.1 The Perfect Laboratory: Why Binary Pulsars?

Binary pulsars are ideal for this test for several key reasons:

*   **Extreme and Variable Accelerations:** The two neutron stars in the Double Pulsar system, PSR J0737–3039A/B, orbit each other every 2.45 hours on a mildly eccentric ($e \approx 0.088$) orbit with a semi-major axis of approximately $8.8 \times 10^8$ m (Kramer et al. 2021). This yields an average orbital speed of $v \approx 6.3 \times 10^5$ m/s (~0.2% $c$) and an average centripetal acceleration of $a_{\mathrm{avg}} \approx 4.5 \times 10^2$ m/s² (~45 $g$). Crucially, the eccentricity causes the acceleration to vary predictably, ranging from approximately 38 $g$ at apastron (maximum separation) to approximately 54 $g$ at periastron (minimum separation), providing a strongly modulated, time-dependent signal for probing acceleration-dependent effects.

*   **Ultra-Precise Clocks:** Kramer et al. (2021) use 16 years of timing data and a modified Tempo binary model to test GR's orbital-decay prediction at a fractional level of $1.3\times10^{-4}$ with 95% confidence. Their intrinsic derivative is $\dot P_b^{\mathrm{int}}=-1.247752(79)\times10^{-12}$ s/s; its quoted uncertainty is $7.9\times10^{-17}$ s/s.

*   **Clean Gravitational System:** The double-neutron-star composition removes an extended stellar companion from this comparator, but neither compactness alone nor the source record here establishes a numerical bound placing tidal dissipation, mass transfer, or other classical effects below the stated timing sensitivity. Such effects must be bounded or fitted as nuisance terms in the declared GR null model before any residual is attributed to UCT.

*   **Precision GR Baseline:** The declared null model is a specified post-Newtonian timing and radiative model, with the quadrupole flux as its leading term and with kinematic, Galactic, propagation, and system-specific nuisance corrections included or bounded in the same fit. The cited comparisons test that complete baseline rather than an exact quadrupole-only formula:
    *   **PSR B1913+16 (Hulse–Taylor):** after the stated corrections, the measured-to-GR orbital-decay ratio is $0.997\pm0.002$, a $0.3\%$ central offset with a quoted $0.2\%$ uncertainty (Weisberg et al. 2010).
    *   **PSR J0737–3039A/B (Double Pulsar):** the long-baseline timing analysis reports the quoted $0.013\%$ comparison precision within its specified timing model and correction ledger (Kramer et al. 2021). A UCT residual test must retain those nuisance and extrinsic terms in its null model.

#### N.8.2 Standard Model vs. Predictive Universe: A Tale of Two Energy Drains

**Declared GR null model:** The post-Newtonian timing/radiative model predicts the orbital decay, with Einstein's quadrupole flux as the leading radiation term. Any claim that gravitational radiation exhausts the fitted loss budget is conditional on the same model's higher-order terms and on the registered bounds or nuisance treatment for kinematic, Galactic, tidal, mass-transfer, propagation, and other system-specific effects. The comparator is therefore $(dP_b/dt)_{\mathrm{GR}}$ from that declared model, not an exact quadrupole-only law.

**Conditional Orbital-Bridge Model (GR + UCT bridge):** The proper-acceleration UCT theorem adds no center-of-mass loss channel for ideal geodesic motion. The alternative timing model below adds a channel only by postulating the orbital-acceleration bridge of Definition N.12a.

*   **The Conditional Mechanism:** The bridge admits the timing-model orbital acceleration as an effective relational variable and fits $q_{\mathrm{act}}^{\mathrm{orb}}$. Any exported energy must also be entered explicitly and without double counting in the orbital ledger.
*   **The Model Energy Loss:** On that bridge define positive loss powers by $P_{\mathrm{loss}}:=-dE_{\mathrm{orb}}/dt$. The additive model is
$$
P_{\mathrm{loss,model}}(t)
=
P_{\mathrm{loss,GR(GW)}}(t)
+
P_{UCT}^{\mathrm{orb}}(t),
$$
where $P_{UCT}^{\mathrm{orb}}\ge0$ is the empirical bridge term defined below.

#### N.8.3 Conditional Orbital-Bridge Signature and Identifiability

The key to detecting this effect lies in the fact that the two energy loss mechanisms have different functional dependencies on the orbital parameters.

*   **The GR Signal:** The power radiated in GWs depends on the third time derivative of the system's quadrupole moment. For a binary orbit, this scales in a complex way with the stars' velocities and separation, but is characteristically strongest near periastron where orbital speed is maximal and separation is minimal.
*   **The Conditional Bridge Signal:** On the proper-acceleration, active-refresh, and Landauer-saturating branch, the modeled comoving increment for a system $S$ is
    $$
    P_{UCT}(S;a)
    =
    \frac{\lambda_{PM}}{\tau_{\mathrm{cycle}}}\,a\,C_{\mathrm{eff}}
    =
    q_{\mathrm{act}}(S)\frac{c}{2\pi}m_Sa.
    $$
    This formula uses proper acceleration. For a geodesic binary it enters the timing model only after Definition N.12a replaces that input by its declared orbital variable and introduces the distinct fitted factor $q_{\mathrm{act}}^{\mathrm{orb}}$. The proper-acceleration factor $q_{\mathrm{act}}$, the orbital factor $q_{\mathrm{act}}^{\mathrm{orb}}$, and Proposition N.4's boundary utilization $q$ remain distinct unless an additional bridge equates them.

For a fixed orbital-bridge factor, the candidate correction follows the phase dependence of the acceleration combination specified in Definition N.12a and can perturb $\dot P_b$. Its distinguishability from GR, tidal, magnetospheric, and timing-model nuisance terms is an identifiability question for the fitted model.

#### N.8.4 The Experimental Test: A Precision Timing Analysis

The search for this effect constitutes a high-precision data analysis challenge.

1.  **Acquire Data:** Utilize long-term, high-cadence timing data from the best-suited binary pulsar system, such as the Double Pulsar (PSR J0737−3039A/B).

2.  **Establish the Null Hypothesis (Model$_{GR}$):**
     *   Employ a state-of-the-art pulsar timing model (e.g., the T2 model used in TEMPO2 software) that incorporates all known relativistic effects, including orbital decay due to GW emission as predicted by GR.
     *   Fit this Model$_{GR}$ to the timing data to determine the system's parameters (masses, orbital elements, etc.) with the highest possible precision.
     *   Calculate the timing residuals: Residuals = Data $-$ Model$_{GR}$. If GR is the complete theory, these residuals should be statistically indistinguishable from random noise.

3.  **Construct the Alternative Hypothesis (Model$_{UCT}$):**
    *   Begin with the standard Model$_{GR}$.
    *   The proper-acceleration UCT amplitude is fixed by Section N.8.6 as
        $$
        \Xi(S)=q_{\mathrm{act}}(S)\,\frac{c^2m_S}{\hbar\ln2}.
        $$
        A binary-pulsar timing model may use this normalization only after adding the orbital-acceleration test bridge of Definition N.12a. On that bridge the cumulative anomalous energy loss is modeled by $P_{UCT}^{\mathrm{orb}}(t)$, with fitted parameter $q_{\mathrm{act}}^{\mathrm{orb}}$, rather than by an unconstrained dimensional amplitude $\Xi$.
    *   This defines a new, expanded timing model: Model$_{UCT}$ = Model$_{GR}$ + Correction$_{UCT}(q_{\mathrm{act}}^{\mathrm{orb}})$ on the orbital-acceleration bridge.

4.  **Perform a Bayesian Model Comparison:**
    *   Use a Bayesian inference framework (e.g., employing nested sampling or MCMC techniques) to simultaneously fit both Model$_{GR}$ and Model$_{UCT}$ to the dataset.
    *   This analysis will yield the posterior probability distributions for all parameters in both models. Crucially, it will also allow for the calculation of the **Bayesian evidence** (or marginal likelihood), $Z$, for each model.
    *   The test consists of comparing the evidence via the **Bayes factor**:
$$ B = \frac{Z(\text{Model}_{UCT})}{Z(\text{Model}_{GR})} $$

*   If $B\approx1$, the declared models have comparable marginal likelihood under the registered priors; this alone supplies no parameter bound. A one-sided limit on $q_{\mathrm{act}}^{\mathrm{orb}}$ requires the timing-likelihood and response certificates of Corollary N.12.2. No limit on $\Xi$ follows unless an additional typed bridge identifies it with the fitted orbital coefficient.
*   If $B\gg1$ under preregistered model priors, the data favor the declared UCT timing model relative to the declared GR model. Calling this a bridge detection additionally requires the registered decision threshold, posterior-predictive checks, nuisance and alternative-model audit, identifiability of the orbital template, and the stated replication rule; a Bayes factor alone does not establish the physical bridge.

#### N.8.5 Challenges and Outlook

This is an extraordinarily difficult measurement that pushes the boundaries of precision science.

*   **Magnitude Problem:** The published GR comparison motivates a search near the quoted $1.3\times10^{-4}$ fractional precision scale, but that scale is not a bound on $P_{UCT}^{\mathrm{orb}}/P_{GW}$ or on $q_{\mathrm{act}}^{\mathrm{orb}}$. Such a bound requires the accepted timing-likelihood and uniform response certificates of Corollary N.12.2.
*   **Degeneracy Problem:** The primary systematic challenge is ensuring that any detected signal isn't mimicking some other subtle, unmodeled physical effect. High-eccentricity systems are essential, as they provide a wide dynamic range of acceleration, which is key to tracing out the functional form of $P_{UCT}(a)$ and distinguishing it from other potential systematics. A full analysis must rigorously account for or model effects like tidal dissipation and magnetospheric interactions, even if they are expected to be negligible.

Despite these hurdles, the declared alternative defines a testable question once its branch and identifiability assumptions are registered. A positive result supports the orbital bridge only under the preregistered likelihood and alternative audit; a null result constrains $q_{\mathrm{act}}^{\mathrm{orb}}$ only through accepted timing-likelihood and uniform response certificates as in Corollary N.12.2.

#### N.8.6 Active-Refresh Normalization and Conditional Binary-Pulsar Bridge

<a id="definition-n12-proper-acceleration-active-refresh-factor"></a>**Definition N.12 (Proper-Acceleration Active-Refresh Factor).** For a system $S$ of inertial mass $m_S>0$ undergoing proper acceleration magnitude $a>0$, let $q_{\mathrm{act}}(S;a)\in[0,1]$ be an independently registered fraction of the certified boundary-update cycles activated by the acceleration response. Define the saturated Landauer lower-bound scale
$$
P_{\mathrm{UCT}}^{\mathrm{sat}}(S;a)
:=\frac{c}{2\pi}m_Sa,
\qquad
P_{\mathrm{UCT}}^{\mathrm{LB}}(S;a)
:=q_{\mathrm{act}}(S;a)P_{\mathrm{UCT}}^{\mathrm{sat}}(S;a).
$$
Every implementation on Theorem N.6's detector-response branch satisfies $\dot Q_{\mathrm{act}}\ge P_{\mathrm{UCT}}^{\mathrm{LB}}$. The model signal equality $P_{\mathrm{UCT}}=P_{\mathrm{UCT}}^{\mathrm{LB}}$ is available only on its additional same-rate reversible-limit overlap; dissipative overhead belongs to a separate heat ledger and is not absorbed into $q_{\mathrm{act}}$. The symbol $q_{\mathrm{act}}$ is not identified with the relational-utilization coordinate $q$ of Proposition N.4 unless an additional typed bridge proves that equality.

<a id="theorem-n12-forced-form-of-the-proper-acceleration-uct-amplitude"></a>**Theorem N.12 (Forced Form of the Proper-Acceleration UCT Amplitude).** *If the N.8.3 proper-acceleration signal is written as*
$$
P_{UCT}(S;a)=\lambda_{PM}\,a\,\Xi(S),
\qquad
\lambda_{PM}=\frac{\hbar\ln2}{2\pi c},
$$
*then*
$$
\Xi(S)=q_{\mathrm{act}}(S;a)\,\frac{c^2m_S}{\hbar\ln2}.
$$
*On the saturated proper-acceleration active-refresh and same-rate reversible-limit overlap, $q_{\mathrm{act}}=1$ and hence*
$$
\Xi_{\mathrm{sat}}(S)=\frac{c^2m_S}{\hbar\ln2}.
$$

*Proof.* Equating $P_{UCT}=\lambda_{PM}a\Xi$ with Definition N.12 gives
$$
\frac{\hbar\ln2}{2\pi c}a\Xi
=
q_{\mathrm{act}}\frac{c}{2\pi}m_Sa.
$$
For $a>0$, cancellation and rearrangement give the displayed expression. $\square$

<a id="corollary-n12b-proper-acceleration-entropy-drag-observable"></a>**Corollary N.12b (Proper-Acceleration Entropy Drag Observable).** On the proper-acceleration active-refresh, detector-response, and same-rate reversible-limit overlap of Definition N.12 and Theorem N.6, the registered UCT signal power of a system $S$ of inertial mass $m_S$ undergoing proper acceleration magnitude $|a|$ is
$$
\boxed{
P_{\mathrm{UCT}}(S;a)
=
q_{\mathrm{act}}(S;a)\frac{c}{2\pi}m_S|a|.
}
\tag{N.12b}
$$
Consequently the dimensionless calorimetric observable
$$
\boxed{
\mathcal Q_a
:=
\frac{2\pi P_{\mathrm{excess}}}{c\,m_S|a|}
}
\tag{N.12c}
$$
equals $q_{\mathrm{act}}$ after ordinary mechanical, electromagnetic, thermal, and material loss channels are subtracted:
$$
\mathcal Q_a=q_{\mathrm{act}}.
$$
For an ideal freely falling system whose center of mass follows a geodesic, the proper four-acceleration vanishes,
$$
a^\mu=u^\nu\nabla_\nu u^\mu=0,
$$
and the proper-acceleration UCT channel gives
$$
P_{\mathrm{UCT}}=0.
$$
Thus the branch predicts a proper-acceleration drag channel, not a coordinate-acceleration or gravitational-field channel.

*Proof.* On the stated same-rate reversible-limit overlap, the signal equality in Definition N.12 gives
$$
q_{\mathrm{act}}(S;a)
=
\frac{P_{UCT}(S;a)}
{P_{UCT}^{\mathrm{sat}}(S;a)}
$$
with
$$
P_{UCT}^{\mathrm{sat}}(S;a)=\frac{c}{2\pi}m_S|a|.
$$
Solving for $P_{UCT}$ gives Equation N.12b. Dividing Equation N.12b by $c\,m_S|a|/(2\pi)$ gives $\mathcal Q_a=q_{\mathrm{act}}$. The Unruh temperature entering Theorem N.3 depends on proper acceleration magnitude, not coordinate acceleration. For geodesic motion $a^\mu=0$, so $T_U=0$ for the acceleration-induced increment and the corresponding UCT power vanishes. ∎

<a id="theorem-n12c-fixed-hardware-finite-gibbs-collision-heat-and-work-precursor"></a>**Theorem N.12c (Fixed-Hardware Finite Gibbs-Collision Heat and Work Precursor).**

#### 0. Result and exact scope

For each finite resource index $n$, one fixed positive Hamiltonian, detector gap, reset-gap ladder, battery, program and real proper-time cycle duration works at every acceleration $a\in[0,a_{\max}]$. Only the states of explicitly supplied thermal input cells vary with $a$. The supplied temperature law is $\Theta(a)=k_BT(a)=\hbar a/(2\pi c)$; it is a conditional input, not a microscopic derivation of the Unruh effect.

Fix $E_0>0$, $\Theta_{\max}>0$ and $\tau_*>0$ independently of $a$. A complete detector/reset cycle has the uniform limiting work and total bath-energy increase

$$
W_\infty(\Theta)=Q_\infty(\Theta)=E_0+\Theta\log(1+\exp(-E_0/\Theta)).
\tag{1}
$$

The exact zero-temperature run uses the same hardware and ground-state input cells, and has $W_n(0)=Q_n(0)=E_0$ for every $n$. Thus the derived, baseline-subtracted, normalized heat response is

$$
\begin{aligned}
r_{\mathrm{heat}}(\Theta;E_0) &= [W_\infty(\Theta)-W_\infty(0)]/(\Theta\ln 2) \\
&= \log(1+\exp(-E_0/\Theta))/\ln 2,
\end{aligned}
\tag{2}
$$

$$
r_{\mathrm{heat}}(0;E_0)=0.
$$

For $\Theta>0$ it lies strictly between 0 and 1, increases with $\Theta$, decreases with $E_0$, and tends to 1 only as $\Theta/E_0\to\infty$. It is not universal. Its exact finite-resource and parameter uncertainty are derived below, including convergence uniform down to $\Theta=0$.

**This heat response is not the independently counted q_act.** The original Definition N.12 makes $q_{\mathrm{act}}$ an independently counted active/total boundary-cycle fraction. Theorem N.6 requires a common-value conditional entropy $\ln 2$ on its counted active reset cycles and a same-rate reversible-limit overlap. This construction instead produces one biased reset in every scheduled slot, with entropy $h(g)<\ln 2$. The normalization in (2) is a heat ratio, not an event map. The strict distinction is proved in Section 10. This heat-ratio theorem alone supplies no independently counted activation coefficient.

All logarithms are natural. Energies are local proper-frame energies. The construction is an owned finite Gibbs-collision source with supplied inputs, not the Dirac detector instrument of Theorem N.4a, not an identified MPU boundary carrier, and not an empirical apparatus.

#### 1. Fixed devices and independently variable thermal states

For integer $n\ge 2$ register

$$
\begin{aligned}
&\delta=E_0/n^{2},\quad k_0=n^{2},\quad N=n^{3},\quad e_j=E_0+j\delta\quad (j=0,\dots,N), \\
&A=k_0+N,\quad L=n^{8},\quad d_W=L+4A.
\end{aligned}
\tag{3}
$$

For $\Theta>0$ let $g_j(\Theta)=1/(1+\exp(e_j/\Theta))$; at $\Theta=0$ set every $g_{j}=0$. All supplied factors initially form a product:

- $M$ is a two-level memory with $H_{M}=0$, ready in $|1\rangle$.
- $D$ is a source qubit with $H_D=E_0|1\rangle\langle 1|$ and population $g_{0}$.
- $B_{j}$ is a reset cell with $H_j=e_j|1\rangle\langle 1|$ and population $g_{j}$.
- $W$ is a finite work store, $H_W=\delta\sum_{k=0}^{d_W-1}k|k\rangle\langle k|$, initially the pure packet $\eta=L^{-1/2}\sum_{k=2A}^{2A+L-1}|k\rangle$.
- $C$ is a three-position program, bare Hamiltonian zero, initially $|0\rangle$.
- $O$ is a clock qubit, $H_O=(2\pi\hbar/\tau_*)|1\rangle\langle 1|$, initially $|+\rangle$.

Put $H_0=H_D+\sum H_j+H_W$ and nominate the work/control store $\Sigma=WCO$ with $H_\Sigma=H_W+H_O$. $D$ and all $B_{j}$ together are Gibbs for their fixed sum Hamiltonian at $\Theta>0$. At $\Theta=0$ they are the unique ground-state product. Their preparation is a supplied resource: the theorem does not construct the refrigeration, acceleration-induced thermalization or regeneration of spent cells.

For a given $n$, none of $E_0$, $\delta$, $N$, $A$, $L$, $H_0$, $\eta$, $C$, $H_O$, $\tau_*$, or the gates and interaction below depends on $a$ or $\Theta$. Changing $n$ is the declared growing-resource idealization, not changing acceleration on a fixed device. The upper range $\Theta_{\max}$ is fixed before selecting $n$.

#### 2. Complete detector, source response and records

Define the full finite energy-preserving permutation $U_{D}$ by swapping each pair

$$
|1_M,0_D,k_W\rangle\leftrightarrow|0_M,1_D,(k-k_0)_W\rangle,\quad k=k_0,\dots,d_W-1,
\tag{4}
$$

and fixing all other basis vectors. The detector has no coin or postselection. On the actual guarded input, if b is the initial D bit,

$$
M_{\mathrm{out}}=b,\quad D_{\mathrm{out}}=1,\quad W_{\mathrm{out}}=\eta\text{ shifted downward } k_0(1-b).
$$

Thus $P:=M_{\mathrm{out}}$ is an actual classical record with law $\operatorname{Bernoulli}(g_0)$, the spent source is deterministic, and

$$
Q_D=E_0(1-g_0)=-\Delta\langle H_W\rangle_D.
\tag{5}
$$

The record is source responsive: with the installed hardware held fixed, replacing $g_{0}$ by $p$ changes $\Pr(P=1)$ to $p$. Testing the same channel on separately prepared memory inputs 0 and 1 gives probabilities $p_{\mathrm{up}}=g_0$ and $p_{\mathrm{down}}=1-g_0$, so their ratio is $\exp(-E_0/\Theta)$. These are exact finite-cell population response and detailed balance statements. They are not a continuum KMS spectrum or proof that a supplied thermal source came from acceleration.

There is no readout copy, discarded measurement flag or hidden selector. At the reset cut the complete unchanged classical side record from this detector is $R=D_{\mathrm{out}}=1$. Consequently

$$
H(P|R)=h(g_0),
\tag{6}
$$

where $h(p)=-p\ln p-(1-p)\ln(1-p)$. It is strictly smaller than $\ln 2$ for every finite positive $E_0/\Theta$. An unknown purification of the supplied Gibbs source is not silently present: the initial branch is the explicitly registered mixed product state. A preparation model retaining such a purification or an outcome copy would require its additional source and conditional-information audit.

The actual work-store state at this cut is the mixture of $\eta$ and $\eta_{-k_0}$ with weights $g_{0}$ and $1-g_0$. Their overlap is $c=1-k_0/L$. Its smaller eigenvalue is

$$
\lambda_-=[1-\sqrt{1-4g_0(1-g_0)(1-c^{2})}]/2\le k_0/(2L).
$$

Hence $S(\Sigma_{\mathrm{in}})=I(\Sigma:PR)_{\mathrm{in}}=h(\lambda_-)\le h(k_0/(2L))$, uniformly in $\Theta$. The identity holds because every conditional $\Sigma$ state is pure and $C,O$ are known pure product factors at the cut. Any side information obtainable from $W$ alone cannot expose more than this mutual information. The reset cells remain exactly Gibbs and independent of $PR\Sigma$. No finite member is mislabeled as an exactly independent ideal work source; the deviations are retained and vanish in the limit.

#### 3. Shifted-ladder reset and exact finite heat

It is essential that the reset ladder starts above E0. Reusing a ladder starting near zero would not yield (1) for this fixed biased record.

On $x=(m,b_1,\ldots,b_N)$, let

$$
\begin{aligned}
V_Rx &= (b_N,m,b_1,\dots,b_{N-1}), \\
s_R(x) &= (k_0+1)m+\sum_{j=1}^{N-1}b_j-(k_0+N)b_N.
\end{aligned}
\tag{7}
$$

The change in reset-bath energy is $\delta s_R(x)$, and $|s_R|\le A$. For $A\le k\le d_W-A-1$ prescribe

$$
|x,k\rangle\mapsto|V_Rx,k-s_R(x)\rangle.
\tag{8}
$$

This is an injection within each finite $H_B+H_W$ energy shell. Complete unused domain and image vectors within each shell by a fixed lexicographic bijection. In the zero-energy shell choose identity, which is possible because the prescribed central band has no zero-energy input. The resulting full unitary $U_{R}$ conserves $H_{0}$ exactly and does not act on $D$.

The initial battery and its detector output lie in the prescribed central band: the latter support begins at $2A-k_0\ge A$ and ends below $d_W-A-1$. The cumulative detector-plus-reset shift is

$$
s_{\mathrm{cyc}}=k_0+m+\sum_{j=1}^{N-1}b_j-(k_0+N)b_N,
\tag{9}
$$

which lies in [−N,A]. Thus no realized gate uses a negative level or the arbitrary completion of (8).

The reset puts the fresh final bit $b_{N}$ into M. Its error before the final $X_{M}$ is $g_{N}$ and it is independent of R. The final energy-free $X_{M}$ restores the original ready direction with failure probability $g_{N}$. It is included in the actual clock construction below.

The exact mean reset heat is

$$
\begin{aligned}
Q_R &= \sum_{j=1}^{N}e_j(g_{j-1}-g_j) \\
&= E_0g_0+\delta\sum_{j=0}^{N-1}g_j-e_Ng_N.
\end{aligned}
\tag{10}
$$

For $\Theta>0$ the binary Gibbs identity gives

$$
\begin{aligned}
Q_R &= \Theta[h(g_0)-h(g_N)]+D_E, \\
D_E &= \Theta\sum_{j=1}^{N}D(\operatorname{Bern}(g_{j-1})\,\|\,\operatorname{Bern}(g_j))\ge 0.
\end{aligned}
\tag{11}
$$

There is a stronger temperature-uniform representation. Since

$$
\begin{aligned}
\int_{E_0}^{e_N}g(e;\Theta)\,de \\
&= \Theta\log(1+\exp(-E_0/\Theta))-\Theta\log(1+\exp(-e_N/\Theta)),
\end{aligned}
$$

one has exactly

$$
\begin{aligned}
D_E &= \delta\sum_{j=0}^{N-1}g_j-\int_{E_0}^{e_N}g(e;\Theta)\,de, \\
0\le D_E &\le \delta(g_0-g_N)\le\delta g_0\le\delta/2.
\end{aligned}
\tag{12}
$$

The inequalities are the left-Riemann estimate for a decreasing function. They avoid a singular crude estimate proportional to $1/\Theta$. Thus the reset is a genuine conditional-Landauer saturation limit for entropy $h(g_0)$, uniformly in $\Theta\in[0,\Theta_{\max}]$. It is not a conditionally uniform-bit reset.

The complete cycle obeys

$$
\begin{aligned}
Q_n=Q_D+Q_R &= E_0+\delta\sum_{j=0}^{N-1}g_j-e_Ng_N \\
&= E_0+\Theta\log(1+\exp(-E_0/\Theta))-\Theta h(g_N)+D_E.
\end{aligned}
\tag{13}
$$

The detector heat (5) is not dropped. For $\Theta=0$ the actual unitary run has $b=m=b_j=0$, detector debit $E_0$, reset heat zero, final ready state exact and total $Q_n=E_0$. Equation (13) extends continuously to this run, but no zero-temperature division of Landauer's inequality is used.

#### 4. One actual fixed clock and positive Hamiltonian

Put $t=\tau_*/3$ and define the unitary program shift

$$
J=|1\rangle\langle 0|_C\otimes U_D+|2\rangle\langle 1|_C\otimes U_R+|0\rangle\langle 2|_C\otimes X_M.
\tag{14}
$$

It commutes with $H_{0}$. In a joint eigenbasis with $H_{0}$ energy $e$ and $J$ eigenvalue $\exp(-i\phi)$, choose $\theta\in[0,2\pi)$ congruent to $\phi-et/\hbar$ and set $K$'s eigenvalue to $\hbar\theta/t$. Then

$$
\begin{aligned}
&0\le K<(6\pi\hbar/\tau_{*})I,\quad [K,H_0]=0, \\
&\exp[-i(H_0+K)t/\hbar]=J.
\end{aligned}
\tag{15}
$$

All the spectral data in this prescription are $\Theta$-independent. The single positive fixed Hamiltonian $H_{\mathrm{tot}}=H_0+K+H_O$ gives the actual detector endpoint at $t$, reset endpoint at $2t$ and ready-direction endpoint at $3t=\tau_*$. $C$ returns exactly and uncorrelated after the whole cycle. $O$ also returns exactly because its phase period is $\tau_*$.

The Hamiltonian has genuine ground zero: take $D,B,W$ and $O$ in their bare ground states, $M$ in $|+\rangle$ and $C$ uniform. $U_{D}$ and the chosen zero-shell $U_{R}$ act as identity on this vector, $X_{M}$ fixes $|+\rangle$, and $J$ has eigenvalue 1, so $K$ vanishes there.

This is a spectral finite-matrix construction. Its addressed dimension and synthesis precision grow with $n$. No locality, laboratory implementability or efficient gate compilation is inferred. No duration is chosen after evaluating heat. In particular $\tau_*$ is fixed across $a$, unlike the temperature-retuned Q07 calibration $\tau=\hbar/\Theta$. There is no claim $W\tau_*=\hbar\ln 2$, Margolus–Levitin saturation, or equality between work debit and total stored Hamiltonian energy.

#### 5. Work, entropy, correlations and energy quality

Conservation of $H_{0}$ and K, and return of the clock Hamiltonians, give the exact boundary identity

$$
W_n:=-\Delta\langle H_\Sigma\rangle=-\Delta\langle H_W\rangle=Q_D+Q_R=Q_n.
\tag{16}
$$

The initial battery energy, clock energy, positive interaction and supplied source energies are all retained. Stored energy is not baseline-subtracted to manufacture a speed-limit equality. Baseline subtraction in (2) compares measured cycle debits of two actual protocols using the same $H_{\mathrm{tot}}$.

At the reset/full-cycle endpoints, all thermal branch variables are classical and every conditional battery is a pure translate by at most $A$. Since $\langle\eta|\eta_{\mathrm{shift}}\rangle=1-|\mathrm{shift}|/L$, the full state is within half trace distance

$$
t_n=\sqrt{2A/L}
$$

of $\eta_{W}$ tensored with its actual rest marginal. Set

$$
b_n=h(t_n)+t_n\ln(d_W-1).
$$

For $n\ge 2$, $t_n<1-1/d_W$, so entropy continuity gives

$$
S(W_{\mathrm{out}})\le b_n\to 0,\quad I(W_{\mathrm{out}}:\text{rest})\le 2b_n\to 0,
\tag{17}
$$

uniformly in $\Theta$. C,O are pure product at the endpoints, so the same bounds apply to $\Sigma$. These are separately established information estimates, not estimates multiplied by a diverging bath Hamiltonian to obtain heat convergence.

At most 2A+1 distinct translates occur. The largest output eigenvalue is at least 1−2A/L. Assigning the remaining spectral weight to at most 2A low W levels bounds passive energy by

$$
P_{\mathrm{out}}\le 4\delta A^{2}/L\to 0.
\tag{18}
$$

For $\Sigma$ the same bound follows by assigning those eigenvalues to low $W$ levels with $C,O$ in their ground sectors. Its initial whole-cycle state is pure, so whole-cycle ergotropy loss differs from $W_{n}$ by at most (18). At the reset input rank is at most two and passive energy is at most $\delta k_0/(2L)$; the reset-leg ergotropy difference is bounded by $\delta k_0/(2L)+4\delta A^{2}/L$. $C$ and $O$ need not return their state over the reset subinterval: they were nominated as parts of the work/control store from the outset, and their entropy, correlations and mean energies are accounted.

For completeness let $A_{\mathrm{reset}}=PR\Sigma$ at each reset boundary. Because $B$ is initially independent Gibbs and $R$ is unchanged,

$$
\begin{aligned}
Q_R/\Theta-[H(P|R)-H(P_{\mathrm{out}}|R)] \\
&= c_\Sigma+I(A_{\mathrm{reset}}:B)_{\mathrm{out}}+D(\rho_{B,\mathrm{out}}\,\|\,\gamma_B), \\
c_\Sigma &= S(\Sigma_{\mathrm{in}})-S(\Sigma_{\mathrm{out}})-I(PR:\Sigma)_{\mathrm{in}}+I(PR:\Sigma)_{\mathrm{out}}.
\end{aligned}
\tag{19}
$$

Here $S(\Sigma_{\mathrm{in}})=I(PR:\Sigma)_{\mathrm{in}}$ exactly, the remaining $\Sigma$ terms vanish by (17), and the left side is $D_E/\Theta$. The bath marginal is the product with populations $g_0,\ldots,g_{N-1}$, so its relative entropy is exactly $D_E/\Theta$. Thus the full retained global entropy ledger, not just a numerical heat value, is compatible with limiting saturation. Indeed $D_E/\Theta\to 0$ uniformly as shown below. The equality also yields $c_\Sigma+I(A_{\mathrm{reset}}:B)_{\mathrm{out}}=0$ for this exact model.

The classical initial thermal-branch energy-transfer distribution has variance

$$
\begin{aligned}
\operatorname{Var}(\delta s_{\mathrm{cyc}}) &= \delta^{2}\sum_{j=0}^{N-1}g_j(1-g_j) \\
&\quad +e_N^{2}g_N(1-g_N) \\
&\le E_0^{2}/(4n)+e_N^{2}\exp(-e_N/\Theta_{\max})\to 0.
\end{aligned}
\tag{20}
$$

This is a property of the registered classical input mixture and its energy-conserving translations. It does not assume a two-point battery energy measurement, which would destroy its coherence. Any actual calorimeter, sampling detector or archived heat readout is an additional owned implementation, not included for free.

#### 6. Uniform convergence and explicit precision

For every $\Theta\in[0,\Theta_{\max}]$,

$$
\begin{aligned}
|Q_n(\Theta)-Q_\infty(\Theta)| \\
&\le \delta/2+\Theta_{\max}\,h(g(e_N;\Theta_{\max})) \\
&\le E_0/(2n^{2})+(e_N+\Theta_{\max})\exp(-e_N/\Theta_{\max}).
\end{aligned}
\tag{21}
$$

The last inequality uses $h(g(x))=\log(1+e^{-x})+x/(1+e^{x})\le(1+x)e^{-x}$. In particular the error vanishes uniformly. The final memory reset error satisfies $g_N\le\exp(-e_N/\Theta_{\max})$.

Define $r_n(\Theta)=(Q_n(\Theta)-E_0)/(\Theta\ln 2)$ for $\Theta>0$ and $r_n(0)=0$ by its actual continuous limit. Since $x/(1+e^{x})\le xe^{-x}\le 1/e$,

$$
D_E/\Theta\le\delta g_0/\Theta\le\delta/(eE_0)=1/(en^{2}).
$$

Consequently

$$
\begin{aligned}
\sup_{0\le\Theta\le\Theta_{\max}}|r_n(\Theta)-r_{\mathrm{heat}}(\Theta)| \\
&\le [h(g(e_N;\Theta_{\max}))+1/(en^{2})]/\ln 2.
\end{aligned}
\tag{22}
$$

The ideal response is in $[0,1)$, but a small-resource $r_{n}$ is not asserted to be a count fraction or even positive at every temperature. A sufficient condition for strict positive excess at every $0<\Theta\le\Theta_{\max}$ is

$$
2(e_N/\delta)\exp(-N\delta/\Theta_{\max})<1,
\tag{23}
$$

because $Q_n-E_0\ge\delta g_0-e_Ng_N$ and $g_N/g_0\le 2\exp(-N\delta/\Theta_{\max})$. An upper bound $r_{n}<1$ follows if (22)'s error is smaller than $1-r_{\mathrm{heat}}(\Theta_{\max})$. These are eventually satisfied for the registered bounded temperature range.

A complete state implementation error $\varepsilon_{n}$ in half trace distance at either endpoint changes a mean energy by at most $2\varepsilon_n$ times the corresponding actual energy norm. An explicit norm bound is

$$
\lVert H_{\mathrm{tot}}\rVert\le E_0+NE_0+\delta N(N+1)/2+\delta(d_W-1)+8\pi\hbar/\tau_{*}.
$$

Thus $\varepsilon_n=O(n^{-10})$ gives vanishing $O(E_0n^{-4})$ energy errors uniformly over the temperature range. Entropy continuity requires its logarithmic dimensions as well. Duhamel gives $\lVert U-\tilde{U}\rVert\le t\lVert H-\tilde{H}\rVert/\hbar$ for Hamiltonian synthesis errors on each interval. Timing error uses the same actual norm. Exact energy-shell-preserving approximations can preserve $H_{0}$ conservation; otherwise their energy defects must enter the ledger.

These are absolute energy controls. Normalizing an arbitrary implementation error by $\Theta$ is not uniformly safe near $\Theta=0$: a reported heat-ratio error additionally requires an error budget $o(\Theta)$, or restriction to $\Theta\ge\Theta_{\min}>0$. Equation (22) is uniformly valid because it bounds the exact thermal discretization analytically; it is not a universal noise-amplification guarantee.

#### 7. Finite batches, reuse and service-rate scope

A finite horizon contains only finitely many supplied source/reset cells, batteries and preparations. Their number and energies must be entered rather than assuming an infinite free bath. The theorem above needs one D, N reset cells, one battery, one ready-memory preparation and the registered clocks/program per cycle. It does not regenerate any spent body or the battery.

For a finite batch of $K$ cycles, either use $K$ independently prepared copies of this exact device, activated in independently fixed disjoint proper-time slots, or explicitly implement and count the service routing for sequential fresh ports. The first construction is a finite tensor product of registered complete cycles with independently scheduled origins. It has exactly $K$ finished operation slots by $K\tau_*$ and mean total heat $KQ_n$. It is an owned finite batch, not a finite autonomous apparatus operating forever. The slot count is $N_{\mathrm{slot}}(T)=\lfloor T/\tau_*\rfloor$ on its covered horizon, with endpoint discrepancy $<1$. It is a count of these detector/reset operations, not yet N04's certified relational boundary events.

For true reuse of one $M$ with fresh independent $D,B,W$ in each slot, the finite reset error cannot be ignored. The full swap (4) still gives $P_{r}$ equal to the fresh source bit, while $D_{\mathrm{out}}$ equals the old memory bit. Hence $P_{r}$ remains independent of every old classical record. The first cycle has $Q_{n}$; subsequent cycles have mean $Q_n-E_0g_N$, since their memory input is excited with probability $1-g_N$. After $K$ slots,

$$
\mathbb{E}[Q_{\mathrm{batch}}]=KQ_n-(K-1)E_0g_N.
\tag{24}
$$

The reset law is unchanged, and the extra mean-rate defect is bounded uniformly by $E_0\exp(-e_N/\Theta_{\max})/\tau_*$. Formula (24) does not itself supply an uncharged port-routing or preparation mechanism. Its assumption is the stated fresh-input service, with all spent cells and correlations retained.

If this fixed-slot service is explicitly extended to one countable supplied-resource run, its compatible finite prefixes give a formal operation rate $1/\tau_*$ and mean heat rate $(Q_n-E_0g_N)/\tau_*$; the initial discrepancy is $O(1)$. The $n\to\infty$ limit has $Q_\infty/\tau_*$ at the same operation rate. Such an open extension has unbounded incoming resource inventory and is not assigned finite total stored energy or a finite reusable work store. This provides a same-rate result for this source's operation/reset-entropy $h(g_0)$, but not the original $\ln 2$ active-boundary-cycle saturation certificate.

#### 8. Baseline, parameter intervals and empirical uncertainty

The $a=0$ baseline is an actual ground-input execution at the same device parameters and proper period, with source excitation energy E0 exported per cycle. It is not zero work, not a removed stored battery baseline and not an unspecified comparison apparatus. At $\Theta>0$,

$$
\begin{aligned}
\Delta Q_D &= Q_D(\Theta)-Q_D(0)=-E_0g_0, \\
Q_{R,\infty}(\Theta) &= \Theta h(g_0), \\
\Delta Q_{\mathrm{total},\infty} &= \Theta h(g_0)-E_0g_0.
\end{aligned}
\tag{25}
$$

The detector's negative differential contribution explains why the total excess is smaller than the entropy-based reset heat. Removing that contribution would change the observable and destroy the claimed full-boundary ledger.

For calibrated $E_0\in[E_-,E_+]$ with $E_->0$ and $\Theta\in[\Theta_-,\Theta_+]$, monotonicity yields the rigorous ideal interval

$$
r_{\mathrm{heat}}(E_+,\Theta_-)\le r_{\mathrm{heat}}(E_0,\Theta)\le r_{\mathrm{heat}}(E_-,\Theta_+),
\tag{26}
$$

using value 0 at $\Theta_-=0$. Add $\pm$ the appropriate bound (22) for the fixed actual ladder, plus independently certified preparation/control/calorimetry errors. If the physical energy spacing is uncertain, evaluate the exact sum (13) on its actual calibrated spacing or include its spectral-error budget; do not treat $E_0$ and $\delta$ as unrelated when the commensurate lift requires $E_0=k_0\delta$.

The differential sensitivities are

$$
\begin{aligned}
\partial r_{\mathrm{heat}}/\partial E_0 &= -g_0/(\Theta\ln 2), \\
\partial r_{\mathrm{heat}}/\partial\Theta &= E_0g_0/(\Theta^{2}\ln 2), \\
\partial Q_\infty/\partial E_0 &= 1-g_0,\quad \partial Q_\infty/\partial\Theta=h(g_0).
\end{aligned}
\tag{27}
$$

The derivatives extend continuously at $\Theta=0$ for fixed $E_0>0$. A nonzero background temperature would require a different comparison, $Q_\infty(\Theta_{\mathrm{bg}}+\Theta_U)-Q_\infty(\Theta_{\mathrm{bg}})$, not (2). No additive-temperature conclusion or environmental refrigeration cost is inferred merely from the present zero-background supplied-reservoir branch.

If an independently implemented calorimeter reports mean heat intervals $[Q_-,Q_+]$ and baseline $[B_-,B_+]$ at a known $\Theta>0$, the measured excess-ratio interval is $[(Q_--B_+)/(\Theta\ln 2),(Q_+-B_-)/(\Theta\ln 2)]$. $\Theta$ and energy uncertainty require joint interval propagation. This is an error-propagation statement only; no dataset, apparatus confidence interval or actual calorimeter is supplied here. Statistical bounds on the classical branch distribution (20) are available once a legitimate sampling observation is specified; they are not automatically read out from a coherent work battery.

#### 9. Acceleration and common proper-time interpretation

The varying input is independently prescribed proper acceleration $a$ and supplied Gibbs cells at $\Theta(a)$. The hardware evolves in the independently calibrated proper coordinate with fixed $\tau_*$. For the standard symmetric accelerated segment, use proper endpoints $\pm\tau_*/2$ and inertial endpoints $\pm b_a$, where

$$
\begin{aligned}
b_a &= (c/a)\sinh(a\tau_{*}/(2c)), \\
f_a(u) &= d\tau_{\mathrm{prop}}/du=[1+(au/c)^{2}]^{-1/2}.
\end{aligned}
$$

In an inertial-coordinate implementation the generator is $f_a(u)H_{\mathrm{tot}}$, so the actual propagator is $\exp[-iH_{\mathrm{tot}}\Delta\tau_{\mathrm{prop}}/\hbar]$. All factors use the same lapse. The endpoint lapse values agree, and the net work of this lapse drive is $\int f_a'(u)\langle H_{\mathrm{tot}}\rangle\,du=0$ since $\langle H_{\mathrm{tot}}\rangle$ is constant. Its varying control profile and actual norm are still resource data. Proper-frame energy and inertial endpoint energy are not silently equated.

At $a=0$ the continuous limit is $f=1$ and $b=\tau_*/2$. Thus no retuning of proper hardware or proper period is needed. The inertial waveform necessarily changes with the prescribed worldline; its generation and physical chassis acceleration are not furnished free. This is a conditional common-clock service convention, not a microscopic mechanical or gravitational realization.

#### 10. Heat-ratio and independently counted-event nonidentification

The original row requires: “define counted boundary cycles, baseline subtraction and clock/saturation, then derive $q(a,\text{system})$ with uncertainty.” Its title specifies the acceleration-active refresh coefficient $q_{\mathrm{act}}$. Definition N.12 and Theorem N.6 resolve the symbol's meaning: it is a fraction of independently certified completed boundary events, not whatever number makes a heat equality true.

This branch supplies a genuine same-hardware heat observable, baseline, real cycle clock, complete reset entropy ledger and uniform finite-resource uncertainty. It does not supply the following missing identifications:

1. **Active versus total certified boundary events.** Every slot at $\Theta>0$ contains a positive-entropy reset. Tagging all these reset slots active gives a count fraction 1, not (2). Tagging source excitations gives fraction $g_{0}$, but a source excitation is not a certified $\ln 2$ reset and no retained-tag entropy audit has been supplied. The construction has no other activation gate yielding (2).
2. **Common-value entropy.** The actual reset removes $h(g_0)-h(g_N)$, converging to $h(g_0)<\ln 2$. Dividing this entropy by $\ln 2$ gives an entropy-equivalent bit throughput, not an integer event-count fraction. Its limiting value $h(g_0)/\ln 2$ also differs strictly from $r_{\mathrm{heat}}$ by $E_0g_0/(\Theta\ln 2)>0$.
3. **The same active-subfamily heat equality.** The reset heat is $\Theta h(g_0)$, whereas the full baseline-subtracted heat is $\Theta h(g_0)-E_0g_0$. The latter includes a decreased detector heat, not a count of additional reversible uniform-bit erasures. Definition N.12 does not allow overhead or a changed source ledger to be absorbed into $q_{\mathrm{act}}$.
4. **Boundary-source and normalization admission.** N.4.0d's oscillator-boundary count certificate, Theorem N.4a's Dirac detector response, and this new Gibbs-collision source are different owned carriers and protocols. No source/operation/record intertwiner between them is supplied. This proof does not establish the original relational boundary, action-rate or mass normalization merely by assigning the same word “cycle.”
5. **Original uncertainty.** Equation (22) and (26) quantify $r_{\mathrm{heat}}$ for this model. A count-based $q_{\mathrm{act}}$ needs its actual activation law, observed or derived rate, clock/count errors and any same-rate limit compatibility. Those cannot be inherited from an unrelated heat ratio.

A demand to derive the Minkowski-vacuum Unruh effect, to realize a literal chassis autonomously, or to establish every MPU hierarchy level is not added merely to reject this branch. Admission of a supplied-reservoir formal source for N04 is a separate question for its original predicate; even with that source class admitted, points 1–3 remain explicit failures of this identification.

No impossibility theorem is asserted for every fixed-hardware construction. A different source could possess an actual acceleration-dependent activation flag, conditionally uniform active reset records and an independently counted common clock. Such a source must prove its own gates and source-exhaustive baseline ledger. It cannot obtain those facts by relabeling (2).

<a id="lemma-n12d-exact-invariant-old-spectator-extension-of-the-registered-reset-ledger"></a>**Lemma N.12d (Exact Invariant-Old-Spectator Extension of the Registered Reset Ledger).**

#### Statement and exact qualification

The full old history need not satisfy Definition 28's fresh-auxiliary independence premise. In particular an old quantum work store can be correlated with a retained old classical record. It is **not** reclassified as a fresh current reset auxiliary or declared independent. The present construction instead proves the following conservative extension of the current-module reset theorem, with exactly the same conditional-entropy and bath-heat conclusion.

Fix any finite past block $\Omega$ on $R_{\mathrm{old}}Q_{\mathrm{old}}$, with $R_{\mathrm{old}}$ classical and $Q_{\mathrm{old}}$ arbitrary, possibly correlated with $R_{\mathrm{old}}$. Let $X$ be the current reset block $PR_{\mathrm{cur}}\Sigma_{\mathrm{cur}}B$, together with its current unchanged independent auxiliary factors. Suppose at the actual reset input

$$
\rho_{\mathrm{in}}=\Omega_{R_{\mathrm{old}},Q_{\mathrm{old}}}\otimes\sigma_{X,\mathrm{in}},
$$

and the actual reset endpoint map, on the admitted program/source input sector and for every $\Omega$, is

$$
\begin{aligned}
\rho_{\mathrm{out}} &= \Omega_{R_{\mathrm{old}},Q_{\mathrm{old}}}\otimes\sigma_{X,\mathrm{out}}, \\
\sigma_{X,\mathrm{out}} &= V_{\mathrm{current}}\,\sigma_{X,\mathrm{in}}\,V_{\mathrm{current}}^{\dagger}.
\end{aligned}
$$

Assume the current block has the registered bath, reset and finite-work-defect data. Then adjoining $\Omega$ leaves every current conditional-erasure, heat, entropy-balance and work-defect identity unchanged. No bound on the old block's entropy, dimension or internal correlations is needed beyond the finite-entropy premise at each finite horizon.

#### Proof

Let $R_{\mathrm{full}}=(R_{\mathrm{cur}},R_{\mathrm{old}})$. Product factorization at **both** reset cuts gives

$$
\begin{aligned}
H(P|R_{\mathrm{full}})_{\mathrm{in}} &= H(P|R_{\mathrm{cur}})_{\mathrm{in}}, \\
H(P_{\mathrm{out}}|R_{\mathrm{full}})_{\mathrm{out}} &= H(P_{\mathrm{out}}|R_{\mathrm{cur}})_{\mathrm{out}}.
\end{aligned}
$$

Thus the erased conditional entropy difference is identical. This is stronger than equality of the old marginal alone: the complete old block is restored with its correlations and remains product with the fresh block.

The bath reduced state is $\sigma_{B}$ at both cuts. With the same physical bath Hamiltonian $H_{B}$,

$$
Q_{\mathrm{full}}=\operatorname{Tr}[H_B(\sigma_{B,\mathrm{out}}-\sigma_{B,\mathrm{in}})]=Q_{\mathrm{current}}.
$$

All global entropy terms split additively into $S(\Omega)$ plus the current term, so the old term cancels exactly. For an explicit check of pre-existing work/reference correlations, set $\Sigma_{\mathrm{full}}=(\Sigma_{\mathrm{cur}},Q_{\mathrm{old}})$. At either cut,

$$
\begin{aligned}
S(\Sigma_{\mathrm{full}}) &= S(\Sigma_{\mathrm{cur}})+S(Q_{\mathrm{old}}), \\
I(P\,R_{\mathrm{full}}:\Sigma_{\mathrm{full}}) \\
&= I(P\,R_{\mathrm{cur}}:\Sigma_{\mathrm{cur}})+I(R_{\mathrm{old}}:Q_{\mathrm{old}}).
\end{aligned}
$$

Consequently the complete finite work-store correction

$$
\begin{aligned}
c_\Sigma &= S(\Sigma_{\mathrm{in}})-S(\Sigma_{\mathrm{out}}) \\
&\quad -I(PR:\Sigma)_{\mathrm{in}}+I(PR:\Sigma)_{\mathrm{out}}
\end{aligned}
$$

is exactly the current-module correction. The old $S(Q_{\mathrm{old}})$ and $I(R_{\mathrm{old}}:Q_{\mathrm{old}})$ terms cancel separately; neither is assumed small or zero. Likewise

$$
\begin{aligned}
I(P\,R_{\mathrm{full}}\,\Sigma_{\mathrm{full}}:B)_{\mathrm{out}} \\
&= I(P\,R_{\mathrm{cur}}\,\Sigma_{\mathrm{cur}}:B)_{\mathrm{out}},
\end{aligned}
$$

and the bath relative entropy is unchanged. Hence the full finite Gibbs/conditional-entropy identity is precisely the current identity, with no new remainder or uncharged entropy sink. The current work-store entropy/correlation estimates apply to the current change; they are not falsely asserted for the absolute entropy of all past stores. All these statements are made at a finite horizon: $S(\Omega)$, $S(Q_{\mathrm{old}})$ and $I(R_{\mathrm{old}}:Q_{\mathrm{old}})$ are finite for each current slot. Their cancellation is exact before any long-time limit, so no infinity-minus-infinity expression is formed even though the retained history grows without bound along the open run. Taking the proved current resource limit preserves the same heat bound or saturation equality. This proves the extension.

The same proof permits a known uncoupled spectator free drift $\Omega_{\mathrm{out}}=(I_{R_{\mathrm{old}}}\otimes U_{\mathrm{old}})\Omega_{\mathrm{in}}(I_{R_{\mathrm{old}}}\otimes U_{\mathrm{old}})^\dagger$, provided it preserves the retained record algebra and the old energy observables. It leaves $S(\Omega)$, $S(Q_{\mathrm{old}})$, $I(R_{\mathrm{old}}:Q_{\mathrm{old}})$ and the old mean energy unchanged. The identity above is then the identity of the **current-operation interaction map**, with harmless free drift factored out. A nondegenerate coherent spent battery is not claimed to remain literally frozen under its free Hamiltonian.

#### Exact application to the frozen N04 construction

After capture, SWAP has moved the full prior M/reference state into spent $Y_{\mathrm{out}}$. Fresh P is uniform and product with that entire old block, current D, fresh baths and current work/control factors. Conditional on the retained current activation value, this gives the displayed tensor input for any finite history.

On the actual reset interval $t$ to $3t$, $t=\tau/3$, the endpoint propagator satisfies

$$
J^{2}(|1\rangle_C\otimes\psi)=|0\rangle_C\otimes U_{\mathrm{sel}}\,\psi.
$$

$U_{\mathrm{sel}}$ is identity on $Y_{\mathrm{out}}$ and every old factor. Thus the required complete endpoint product is an explicit operator identity, not an assumption inferred from the absence of a measured heat change. Fractional evolution may temporarily involve $Y_{\mathrm{out}}$; only the exactly restored endpoint block enters this finite reset balance. The smooth pulse is zero at both cuts, so no interaction-energy endpoint is hidden in the extension.

Current non-work auxiliaries, such as the unselected cold bank on the active branch, obey the current independence/return conditions. Old work stores and references are instead the exactly invariant block handled by the proved lemma. Fresh complete modules could also be used, but are not required to remove or erase their old records. Nothing in this extension admits a new purity resource, restores an old battery, discards a reference, removes a retained copy of P, or assumes global auxiliary independence.

The N04 count law and hot/cold baseline remain unchanged. Conditional entropy per current event is still ln2, finite heat is the same $H_{n}$ or $C_{n}$, and the same-rate limiting heat equals the independently counted activation scale. Therefore the original N04 positive result holds **with this explicit invariant-spectator extension**, rather than through a claim that the correlated enlarged input literally satisfies every base Definition-28 independence clause. The extension is proved within the constructive S2/S5 result and introduces no new unresolved physical premise.

<a id="theorem-n12e-independently-counted-acceleration-active-boundary-fraction-and-same-rate-reset-limit"></a>**Theorem N.12e (Independently Counted Acceleration-Active Boundary Fraction and Same-Rate Reset Limit).**

#### 1. Main theorem and conditional domain

Fix a registered uniformly accelerated proper clock, an independently supplied response-temperature law $\Theta(a)=\hbar a/(2\pi c)$, a fixed $E_0>0$, a fixed proper boundary period $\tau>0$, and an operating interval $0\le\Theta\le\Theta_{\max}$. The response-temperature law is a primitive of this conditional branch. It is not derived from acceleration or identified with the Dirac detector source of Theorem N.4a.

There exists an explicitly populated oscillator-boundary × finite-control/collision source with these properties:

1. Its total completed boundary events are actual recorded first returns of the same oscillator pair, $N_{\mathrm{total}}(T)=\lfloor T/\tau\rfloor$. Every event has a physically return-projector-controlled capture and reset service.
2. A fixed-gap Gibbs activation qubit $D$ selects the positive-temperature reset bank. Its retained value $d$ labels the active event, independently of the captured record to be erased. The actual active count is $N_{\mathrm{act}}(T)=\sum_{r\le N_{\mathrm{total}}(T)}d_r$.
3. All source Hamiltonians, record/gap choices, program gates, battery preparations and proper slot durations remain fixed when $a$ changes. Only the explicitly supplied Gibbs input laws change.
4. On the supplied IID input process,

   $$
   \begin{aligned}
   q_{\mathrm{act}}(a;E_0) &= \lim_{T\to\infty}N_{\mathrm{act}}(T)/N_{\mathrm{total}}(T)\\
   &= g(a)=1/(1+\exp(E_0/\Theta(a)))
   \end{aligned}
   \tag{A1}
   $$

   almost surely and in every $L^p$, $1\le p<\infty$. At $a=0$, $q_{\mathrm{act}}=0$ exactly. The count definition precedes and is independent of any heat observation.
5. Each captured reset record has conditional entropy $\ln 2$ given every retained classical side record, including $D$ and the previous memory's output. Each active cycle has a positive-temperature reset whose final conditional entropy and work-store defects vanish uniformly in the declared resource limit, at the unchanged real period $\tau$. Every inactive cycle uses a separately owned cold-ground reset and is also an actual completed reset.
6. At finite $n$, the same-device $a=0$ baseline is $C_n=\delta/2$ per completed event. Its full source/service bath-energy excess is

   $$
   \Delta Q_n(a)=g(a)[H_n(\Theta(a))-C_n],
   \tag{A2}
   $$

   with $H_{n}$ the actual hot-reset heat, not a parameter chosen from the desired coefficient. At the same completed-event rate,

$$
\lim_{n\to\infty}\Delta Q_n(a)/\tau=g(a)\,\Theta(a)\ln 2/\tau.
\tag{A3}
$$

   Both the absolute excess and its normalized ratio have explicit uniform errors down to $a=0$. The active-subfamily mean heat separately tends $g\Theta\ln 2/\tau$.

The input and operation model is entirely explicit below. It has one genuine boundary carrier, full normalized success/failure responses, a declared cut, complete resource ownership and an independently derived count law. It is a conditional mathematical source realization. It neither predicts $q_{\mathrm{act}}$ for an unspecified natural body nor derives the Unruh input, mass calibration, body-export heat, gravity or orbital loss. Conditional admission of this source is the remaining scope judgment; it is not replaced by an assertion that it is the Dirac detector source of Theorem N.4a or an arbitrary original MPU source.

#### 2. The original gate and why a heat ratio alone did not suffice

The original target row is “S2/S5: define counted boundary cycles, baseline subtraction and clock/saturation, then derive $q(a,\text{system})$ with uncertainty.” Definition N.12 defines $q_{\mathrm{act}}$ as the independently registered fraction of certified boundary-update cycles activated by the acceleration response. Theorem N.6 uses actual active/total counts; its conversion to erased entropy uses common per-cycle conditional entropy. Corollary N.5.2 adds a deterministic completed-schedule and same-rate reversible-limit requirement for the heat statement.

Theorem N.12c proves a different useful quantity $\log(1+\exp(-E_0/\Theta))/\ln 2$. It is not a count fraction and is not used as $q_{\mathrm{act}}$ here. The present construction adds an actual retained activation flag, actual counted events, uniform reset records on those events, and conditional count-to-heat summation. It does not repair the old ratio by relabeling it.

#### 3. Fixed private service module

For integer $n\ge 2$ set

$$
\begin{aligned}
&\delta=E_0/n^{2},\quad N=n^{3},\quad A=N,\quad L=n^{8},\quad d_W=L+4A, \\
&e_j=j\delta\quad(j=1,\dots,N),\quad e_{\max}=N\delta=E_0n.
\end{aligned}
\tag{A4}
$$

All quantities in (A4) are hardware choices independent of a. A module contains:

- $D$, activation qubit $H_D=E_0|1\rangle\langle 1|$, initially diagonal with $\Pr(D=1)=g(a)$.
- $Y$, a supplied old-record source qubit $H_{Y}=0$, in $I/2$.
- $M$, the degenerate capture/reset memory $H_{M}=0$, initially ready $|0\rangle$ for the first event.
- $B_j^h$, hot reset cells of fixed gaps $j\delta$, in their Gibbs product at $\Theta(a)$. For $\Theta=0$ their state is the ground product.
- $B_j^c$, cold reset cells of the same fixed gaps, each initially $|0\rangle$.
- $W$, $H_W=\delta\sum_{k=0}^{d_W-1}k|k\rangle\langle k|$, initially $\eta=L^{-1/2}\sum_{k=2A}^{2A+L-1}|k\rangle$.
- $C$, a three-position zero-bare-energy program, initially $|0\rangle$.
- $O$, $H_O=(2\pi\hbar/\tau)|1\rangle\langle 1|$, initially $|+\rangle$.

The supplied factors are independent at the first start; a reused M may carry earlier correlations, which Section 9 retains. Put

$$
H_0=H_D+H_h+H_c+H_W,\quad \Sigma=WCO,\quad H_\Sigma=H_W+H_O.
$$

Y's uniform state is a real supplied entropy-bearing old record, not a hidden fair randomizer. Its initial law and later spent state belong to the source inventory. No preparation label or reference purifying Y is present in the registered initial product state. If such a label is retained in an actual preparation, the conditional-entropy premise must be reassessed. The cold cells are explicit purity resources; their renewal at any ambient positive temperature is not free or included in (A2).

The first gate is $U_{\mathrm{cap}}=\mathrm{SWAP}(Y,M)$. For the first event it gives $P:=M=Y_{\mathrm{in}}$, $Y_{\mathrm{out}}=0$. For reused $M$ it moves that entire old state and its reference correlations to $Y_{\mathrm{out}}$ and still makes $P$ an independent uniform bit. $D$ remains unchanged. This is an actual old-record capture, not an independent outcome label appended after a reset.

For either bank $B=(B_1,\ldots,B_N)$, define

$$
\begin{aligned}
V(m,b_1,\dots,b_N) &= (b_N,m,b_1,\dots,b_{N-1}), \\
s(m,b) &= m+\sum_{j=1}^{N-1}b_j-Nb_N,\quad |s|\le N.
\end{aligned}
\tag{A5}
$$

On central $W$ levels $A\le k\le d_W-A-1$ prescribe $|x,k\rangle\to|Vx,k-s(x)\rangle$ and complete unused states by a fixed lexicographic bijection within each energy shell. Complete the zero-energy shell by identity. This is a full finite unitary $U_{h}$ or $U_{c}$ with exact conservation of $H_{0}$. The prescribed band includes the entire actual initial battery packet and there is no prior work shift during capture, so no actual branch touches the arbitrary completion.

The selected reset is

$$
U_{\mathrm{sel}}=|1\rangle\langle 1|_D\otimes U_h+|0\rangle\langle 0|_D\otimes U_c.
\tag{A6}
$$

D is not measured, erased, replenished or discarded by this gate. It is already classical and retained. $U_{\mathrm{sel}}$ commutes with $H_{D}$ and $H_{0}$, so activation-source energy debit is exactly zero. The unselected bank is untouched. All conditional branches, including $d=0$, are retained.

#### 4. Complete fixed-time implementation

Let $t=\tau/3$ and

$$
\begin{aligned}
J &= |1\rangle\langle 0|_C\otimes U_{\mathrm{cap}}+|2\rangle\langle 1|_C\otimes U_{\mathrm{sel}} \\
&\quad +|0\rangle\langle 2|_C\otimes I.
\end{aligned}
\tag{A7}
$$

Because each gate commutes with $H_{0}$, $J$ is a full unitary commuting with $H_{0}$. In a joint eigenbasis $H_0=e$ and $J=e^{-i\phi}$, define $K$ by the eigenvalue $\hbar\theta/t$, where $\theta\in[0,2\pi)$ is congruent to $\phi-et/\hbar$. Then

$$
\begin{aligned}
&0\le K<(6\pi\hbar/\tau)I,\quad [K,H_0]=0, \\
&e^{-i(H_0+K)t/\hbar}=J.
\end{aligned}
\tag{A8}
$$

This is the same energy-shell spectral compilation as the accepted Q07 construction, here applied to two full explicitly controlled reset banks and a capture gate. For the embedded realization, use this compiled $K$ with a fixed closed pulse on each stage. If $u=jt+s$, $0\le s\le t$, $j=0,1,2$, put

$$
\begin{aligned}
w(u) &= 2\sin^{2}(\pi s/t), \\
\Lambda(u) &= \int_0^u w(v)\,dv=jt+s-[t/(2\pi)]\sin(2\pi s/t).
\end{aligned}
$$

Then $w$ and its derivative vanish at every stage boundary, $w\ge 0$, and $\Lambda(jt)=jt$. The actual private generator is $H_0+w(u)K+H_O$. Because $[H_0,K]=0$, its propagator is $\exp[-i(H_0u+K\Lambda(u))/\hbar]$ times the $O$ evolution. Thus every physical stage endpoint is exactly the same $J$ in (A8), while the interaction is off at every reset cut. The pulses are smooth fixed external proper-clock controls, with peak norm at most $2\lVert K\rVert$ and unchanged integrated norm action $\tau\lVert K\rVert$. This embedded implementation is explicitly controlled, not claimed autonomous. $K$ and the pulse waveform are fixed across $a$. Since both $H_{0}$ and $J$ commute with $D$, their spectral function $K$ also commutes with $D$, so the activation value is unchanged even between gate endpoints. The actual endpoints are capture at $\tau/3$, reset at $2\tau/3$, and $C$'s pure uncorrelated return at $\tau$. $O$ also returns at $\tau$. No hidden exposure or final reset operation is added to the real duration. The third stage is identity because ready is $|0\rangle$.

The private Hamiltonian $H_0+K+H_O$ is nonnegative with actual ground zero: all energetic factors and $Y,M$ in $|0\rangle$, $O$ in ground and $C$ uniform give $J$ eigenvalue 1, $H_0=K=0$. The dimension and precision needed to compile $K$ grow with $n$; no locality or efficiency is asserted. Work/heat is not identified with its total ground-subtracted stored energy.

#### 5. Genuine oscillator boundary and event-controlled service

Use the one-channel physical oscillator/return-register source of Theorem N.4.0d, with declared proper period $\tau$ and a finite-duration record stroke ending at every $r\tau$. Its invariant occupancy code is the qubit pair $|\Psi(u)\rangle=(|00\rangle+e^{-2\pi iu/\tau}|11\rangle)/\sqrt{2}$, apart from its retained common free phase. Its pair Hamiltonian $H_{B}$ generates this orbit. Put $\Pi(u)=|\Psi(u)\rangle\langle\Psi(u)|$ and $\Pi=\Pi(0)$.

The original return pointer is a genuine physical two-rail cell. Its interaction-picture pulse is $\Pi\otimes(I-X_B)$, with the stated amplitude giving a full pointer flip during its record stroke. Hence the complete return instrument has the $\Pi$ success and $I-\Pi$ failure leaves; on the prepared orbit success is certain exactly when the whole stroke has completed. Its first positive projective-state return is $\tau$ and its actual completed-event count is $\lfloor T/\tau\rfloor$. The original oscillator preparation, affine private clock, ready pointer cells, pointer readout and their number-state energies remain owned. They are not regenerated for free.

Add the private service factors of Section 3 to the system side of the same named relational cut. Keep their bare energies present on both success and failure branches. During an event slot use the additional programmed interaction

$$
H_{\mathrm{prog}}(u)=w(u)\,\Pi(u)\otimes K,
\tag{A9}
$$

beside $H_B+H_0+H_O$ and the original return-pointer Hamiltonian/control. All terms are positive except none is required to be negative; the displayed sum is a well-defined finite-code positive Hamiltonian with the original oscillator free extension. It is independent of $a$. The original pulse and (A9) commute in the boundary interaction picture because both are controlled by the same $\Pi$ and act on disjoint service factors.

In that picture the joint private propagator is exactly

$$
\Pi\otimes e^{-i[H_0u+K\Lambda(u)]/\hbar}+(I-\Pi)\otimes e^{-iH_0u/\hbar},
\tag{A10}
$$

with the independent O evolution and pointer stroke included. Thus success executes the actual capture/reset program (A7), while failure executes known free private drift. The complete instrument retains both leaves; its Kraus operators at a completed interval have the form

$$
\begin{aligned}
L_1 &= U_B(\tau)\,\Pi\otimes U_{\mathrm{private}}, \\
L_0 &= U_B(\tau)(I-\Pi)\otimes U_{\mathrm{free}}, \\
L_1^{\dagger}L_1+L_0^{\dagger}L_0 &= I.
\end{aligned}
\tag{A11}
$$

The pointer isometry realizes them physically, and tensoring any reference preserves normalization. Activation refinement by the commuting projectors $|d\rangle\langle d|_D$ gives the complete labeled instrument $(b,d)$. The actual active event is $(b=1,d=1)$, while total completion is $b=1$ at the registered boundary time. All failure and inactive labels stay in the response grammar.

This coupling is stronger than just labeling an unrelated clock tick a reset. The main source's actual return projector controls the update/reset service. An off-orbit failure does not execute it. On the registered prepared branch $\Pi=1$, the main pair follows its original orbit and the complete private state evolves exactly as in Sections 3–4. At every time it factors as

$$
|\Psi(u)\rangle\langle\Psi(u)|_{S_BE}\otimes\rho_{\mathrm{private}}(u).
\tag{A12}
$$

$\rho_{\mathrm{private}}$ need not be pure. Since every service factor is inside the system side Ŝ,

$$
I(\hat{S}:E)=2\ln 2
$$

exactly. For any finite number of independent channels the same argument gives $I(\hat{S}:E_A)=2|A|\ln 2$. The upper bound remains $2\ln(\dim E_A)$, because enlarging the system side does not enlarge the fixed boundary channel dimension. Thus the relational normalization and actual return counts are re-proved on this enlarged source; they are not inherited by incorrectly claiming its mixed services equal the old pure $\chi$.

The enlarged operation grammar is the original occupancy/source/readout grammar together with the finite service factors, their fixed Hamiltonians, the full energy-shell permutations (including completions), the explicitly specified source preparation maps, the $\Pi(u)$-controlled interaction (A9), and the complete $(b,d)$ readout instrument. Every added operation is an actual finite matrix/isometry, including arbitrary spectator identity factors; products and compositions preserve complete normalization. The physical source is this stated augmented oscillator × finite quantum-service class, rather than an unnamed original carrier whose operation admission has merely been assumed.

All source terms are owned exactly once: main pair and its event controller/pointers by Theorem N.4.0d; D,Y,M,both banks,W,C,O and K by this private service. K couples through $\Pi$ and is an explicitly declared boundary-controlled term, not an omitted private spectator on arbitrary inputs. On the actual branch (A12) proves the lack of an additional mutual-information remainder. Heat deposited in the private banks remains inside Ŝ. It is reservoir heat for the reset subsystem, not energy already proved exported from the whole body across E.

#### Control work and starts

At the actual prepared branch $\langle\Pi'(u)\rangle=0$, since differentiating a rank-one transported projection has zero expectation in its own range, and the boundary/private product law makes the corresponding $\Pi'\otimes K$ expectation zero. The other drive-work term is $w'(u)\langle\Pi(u)\otimes K\rangle$. The latter expectation is conserved in the boundary interaction picture because $[K,H_0]=0$ and the original pointer pulse commutes with it. Consequently each complete stage pulse has net drive work $\langle\Pi K\rangle[w(\mathrm{end})-w(\mathrm{start})]=0$. This applies separately to the capture stage and to both stages inside the actual reset interval $[\tau/3,\tau]$. No switching charge from outside that interval is used to cancel a charge inside it.

At $u=0$, $\tau/3$, $2\tau/3$ and $\tau$ the added interaction is exactly zero, and the pointer stroke is also off at the reset input and output cuts. The register/controller bare Hamiltonians are therefore genuinely equal at those cuts. Pulse amplitude, derivative, integrated norm and clock-alignment precision remain explicit resources; no instantaneous unowned switching or autonomous-control claim is used.

For independent supplied modules in successive slots, free phases before their arrival/start are precompensated by the declared clock/preparation service, or the module is supplied with the stated $\eta,C,O$ state at its scheduled arrival. That is an owned input service, independent of $a$, not a claim that a coherent battery waits unchanged under free evolution. The original boundary record stroke and private program overlap on disjoint service factors at the same $\tau$; no serial duration is silently added.

#### 6. Complete reset cut and hot/cold heat

At the actual reset cut $u=\tau/3$, $P$ is a uniform classical bit independent of every earlier retained record, of $D$ and of the fresh hot/cold cells and current work/control store. For the first event the complete old-source record is $Y_{\mathrm{out}}=0$. Under reuse it is the old $M$ with its correlations, retained explicitly. The complete classical side record, whose joint law and identity are unchanged between the actual reset input/output boundaries, includes

$$
\begin{aligned}
R=(&D,Y_{\mathrm{out}},\text{ all earlier retained classical flags/outputs}, \\
&\text{the unchanged completed-event archive}).
\end{aligned}
$$

The known main oscillator state, present pointer state and nonclassical spectator factors are independent of $P$ at this cut. The work/control store is pure product then: capture has no battery shift. Therefore $H(P|R)=\ln 2$ exactly at every finite $n$. No copy of $P$ is introduced into $R$. Source- and controller-side quantum correlations do not hide a copy, since capture moves the entire old memory/reference state into $Y_{\mathrm{out}}$ and the incoming $Y$ is an independent mixed qubit.

Write $h_j=1/(1+\exp(j\delta/\Theta))$, $j\ge 1$, and $h_{0}=1/2$. In the active branch $d=1$, the actual reset heat is

$$
\begin{aligned}
H_n(\Theta) &= \sum_{j=1}^{N}j\delta(h_{j-1}-h_j) \\
&= \delta/2+\delta\sum_{j=1}^{N-1}h_j-N\delta h_N.
\end{aligned}
\tag{A13}
$$

$M_{\mathrm{out}}$ is $\operatorname{Bernoulli}(h_N)$. The hot bath is initially Gibbs and independent of all nonbath factors conditional on the retained $d=1$ tape; the cold bank is unchanged. Exactly,

$$
\begin{aligned}
H_n &= \Theta[\ln 2-h(h_N)]+D_E, \\
D_E &= \Theta\sum_{j=1}^{N}D(\operatorname{Bern}(h_{j-1})\,\|\,\operatorname{Bern}(h_j)), \\
0\le D_E &\le \delta(1/2-h_N)\le\delta/2.
\end{aligned}
\tag{A14}
$$

The last bound follows from the left Riemann sum for $\int_0^{e_{\max}}(1+e^{e/\Theta})^{-1}\,de$. It is a mean conditional-erasure identity with the full finite final entropy, not an exact pure finite erasure.

In the inactive branch $d=0$, the cold inputs are all zero, $s=m$, $M_{\mathrm{out}}=0$ exactly and

$$
C_n=\delta/2.
\tag{A15}
$$

This follows directly from the same full unitary. The positive-temperature Landauer theorem is not divided by zero or invoked on this ground branch. The spent cold bank receives the record entropy and energy $\delta m$. The initial ground purity of all $N$ cells is owned.

Every conditional bath heat is the actual W debit. The activation source D has zero energy change. Y,M,C have zero bare energy; O returns with unchanged mean energy; K's expectation is constant while it is on and switching work cancels. The original oscillator/return services have identical laws and energies at every a, so their separately owned contribution cancels in the same-hardware baseline. Their reset-cut treatment is specified next; they are not silently assumed separately cyclic during a fractional period. If a chosen physical service adds a-dependent overhead, it must be included separately and cannot be hidden in $q_{\mathrm{act}}$.

The complete module mean is

$$
\begin{aligned}
Q_n(a) &= g\,H_n(\Theta)+(1-g)C_n, \\
Q_n(0) &= C_n, \\
\Delta Q_n &= g[H_n(\Theta)-C_n].
\end{aligned}
\tag{A16}
$$

At $a=0$ the same physical D is in its ground state, so only the cold gate runs. The supplied hot cells also approach ground but are unselected. This is an actual baseline execution of the same hardware, with the same event definition, uniform old-record inputs and period.

The full mixture of hot and cold banks is not one Gibbs bath at a common positive temperature. The positive-temperature theorem applies to the active conditional subfamily; the cold branch is separately computed. That is the typed scope of (A14)–(A16).

#### 7. Work-store quality and same-rate reversible limit

#### The complete reset-cut work/control owner

For the embedded boundary realization, enlarge the nominated work/control store from the private $\Sigma$ to $\Sigma_{\mathrm{ext}}$ by including the main oscillator pair, the current pure return pointer, and its already registered pure clock/control factors or ideal deterministic work-control service. This owner is declared before applying a reset theorem. At the reset cut the main pair has a known pure phase, the current pointer is ready, and the record stroke is off; at the completed-cycle endpoint the main pair has returned and the pointer is the pure success state, with the stroke again off. The pointer's two rail states have the same one-excitation free energy. The main pair's mean free energy is constant. Hence these factors contribute zero mean debit, zero entropy and zero correlations with P,R or the baths at both endpoints on the actual branch. They need not return their individual states during the reset subinterval; that state change is handled by the ideal-work/control exception, exactly as for C and O.

Their bare Hamiltonians are unchanged at the two cuts. Their positive stored energy and all driving waveforms remain in the Hamiltonian/resource inventory. They are not thrown away to make a heat equality. The fixed external affine proper-clock/control primitive is the one declared by Theorem N.4.0d, now with the explicit zero-endpoint waveform (A9); it is an ideal deterministic work service, not an unmodeled entropy sink. The original pointer stroke can be chosen in the last $\tau/6$, so it does not overlap the reset-input cut $\tau/3$ and still finishes at $\tau$.

For $\Sigma_{\mathrm{ext}}$, a pure boundary/control factor does not change the battery's nonzero density eigenvalues. Its initial passive energy is the fixed admitted work-store ground value; the final passive excess over that same ground is bounded by assigning the small tail eigenvalues to low W levels with every other factor in its admitted ground. Thus the passive-energy correction below and the pure-work conclusion apply unchanged, even if a fixed-occupation code has a nonzero constant ground baseline. No reset theorem is applied while calling a noncyclic fractional Bell phase a separately cyclic auxiliary.

Every realized reset shifts $W$ by at most $N$. With $t_n=\sqrt{2N/L}$ and $b_n=h(t_n)+t_n\ln(d_W-1)$, the packet-overlap and entropy-continuity proof of Theorem N.12c gives, uniformly over $D$ and $\Theta$,

$$
\begin{aligned}
&S(\Sigma_{\mathrm{out}})\le b_n\to 0,\quad I(\Sigma_{\mathrm{out}}:\text{rest})\le 2b_n\to 0, \\
&P_{\mathrm{passive,out}}\le 4\delta N^{2}/L\to 0.
\end{aligned}
\tag{A17}
$$

At reset input $\Sigma$ is exactly pure and independent. At whole-cycle output C,O are again pure product. At the reset cut the clocks and boundary factors belong to the just-declared $\Sigma_{\mathrm{ext}}$; they may change state during the reset leg but have the stated energy, entropy and correlation character. The reset-leg and whole-cycle work debit differs from ergotropy loss by at most the passive-energy bound. Finite entropy/correlation deviations are explicit, not discarded by naming W “work.”

For each active branch the global unitary entropy identity gives (writing $\Sigma$ for the complete $\Sigma_{\mathrm{ext}}$ owner here)

$$
\begin{aligned}
H_n/\Theta-[\ln 2-h(h_N)] \\
&= c_\Sigma+I(PR\Sigma:B_h)_{\mathrm{out}}+D(\rho_{B_h,\mathrm{out}}\,\|\,\gamma_{B_h}), \\
c_\Sigma &= -S(\Sigma_{\mathrm{out}})+I(PR:\Sigma)_{\mathrm{out}}.
\end{aligned}
\tag{A18}
$$

The hot-bath marginal is the product with populations $1/2,h_1,\ldots,h_{N-1}$, so the final relative entropy is $D_E/\Theta$. For every fixed $\Theta>0$ it vanishes as $n\to\infty$; the information defects vanish by (A17). Since the other terms are nonnegative except the explicitly bounded $c_\Sigma$, the final nonbath/bath correlation also vanishes. This supplies the actual Definition-28 ideal-work and bath limit on each fixed operating point. Exact finite pure reset is never asserted.

The complete final conditional memory entropy is $H(M_{\mathrm{out}}|R)=g\,h(h_N)$ and its average failure probability is $g\,h_N\le(1/2)e^{-e_{\max}/\Theta_{\max}}$. Inactive memories reset exactly. The duration is $\tau$ for every $n$ and $a$, so these limits do not slow the count clock.

Uniform absolute bounds are

$$
\begin{aligned}
|H_n(\Theta)-\Theta\ln 2| &\le \delta/2+\Theta_{\max}\,h(h_N(\Theta_{\max})), \\
|\Delta Q_n-g\Theta\ln 2| &\le [\delta/2+\Theta_{\max}\,h(h_N(\Theta_{\max}))]/2.
\end{aligned}
\tag{A19}
$$

There is a sharper one-sided normalized excess estimate:

$$
\begin{aligned}
\Delta Q_n-g\Theta\ln 2 &= -g[\Theta h(h_N)+\delta/2-D_E]\le 0, \\
0\le g-\Delta Q_n/(\Theta\ln 2) \\
&\le [h(h_N(\Theta_{\max}))/2+1/(2en^{2})]/\ln 2.
\end{aligned}
\tag{A20}
$$

Here $g/\Theta\le 1/(eE_0)$ for $\Theta>0$. Both ratios are extended by 0 at $\Theta=0$. Thus convergence of the heat-derived ratio to the independently counted coefficient is uniform down to the actual zero-temperature baseline. A small finite-resource excess ratio can be negative at high temperature because the finite hot reset is poor; it is never used to define the count $q_{\mathrm{act}}$. The exact count $g$ remains in $[0,1/2]$ for every $n$.

If $\Theta_{\max}$ is fixed, $h(h_N(\Theta_{\max}))\le(1+e_{\max}/\Theta_{\max})e^{-e_{\max}/\Theta_{\max}}$. This gives an explicit $n$ for any specified idealization error. Absolute implementation errors use the actual finite Hamiltonian norm, bounded by

$$
\sup_u\lVert H_{\mathrm{private}}(u)\rVert\le E_0+\delta N(N+1)+\delta(d_W-1)+14\pi\hbar/\tau.
\tag{A21}
$$

A trace-norm/gate/timing error budget $O(n^{-10})$ gives vanishing $O(E_0n^{-4})$ energy error. Normalized empirical or implementation energy errors require a separate $o(\Theta)$ budget near $\Theta=0$; the exact thermal bound (A20) does not license division of arbitrary noise by a vanishing temperature.

#### 8. Count law, deterministic-tape heat summation and uncertainty

Presupply independent $D_{r}$ with $\Pr(D_r=1)=g(a)$, independent of the incoming $Y_{r}$ and both reset banks. They are retained in the output tape unchanged. The physical return records identify all $r\le m(T):=\lfloor T/\tau\rfloor$, so

$$
N_{\mathrm{total}}(T)=m(T),\quad N_{\mathrm{act}}(T)=\sum_{r=1}^{m(T)}D_r.
\tag{A22}
$$

For a fixed realized activation tape d, the selected completed schedule is deterministic and independent of the reset records $Y_{r}$. Conditional on that tape, exact finite-horizon summation gives

$$
\begin{aligned}
\mathbb{E}[Q_{\mathrm{act},m}\mid D=d] &= H_n(\Theta)\sum_{r\le m}d_r, \\
\mathbb{E}[Q_{\mathrm{total},m}\mid D=d] &= H_n(\Theta)\sum d_r+C_n(m-\sum d_r).
\end{aligned}
\tag{A23}
$$

The complete current-module reset law is the same on each admitted previous history by capture/independence, so no unconditional independence of past spent outputs is needed for this expectation. Averaging (A23) gives

$$
\mathbb{E}\,Q_{\mathrm{act},m}=mgH_n,\quad \mathbb{E}\,Q_{\mathrm{total},m}=m[gH_n+(1-g)C_n].
\tag{A24}
$$

These are direct proofs. We do not claim that a random unconditioned active schedule literally satisfies N.5.2's deterministic-schedule hypothesis. Rather, (A23) is the requisite conditional-schedule extension and (A24) proves the mean conclusion without changing the heat or count owners.

The strong law yields (A1); bounded convergence yields all finite $L^p$ limits. For $m\ge 1$ the actual count estimator $\hat{q}=N_{\mathrm{act}}/m$ obeys

$$
\Pr(|\hat{q}-g|\ge\varepsilon)\le 2\exp(-2m\varepsilon^{2}).
\tag{A25}
$$

Thus a two-sided $(1-\alpha)$ interval has halfwidth $\sqrt{\log(2/\alpha)/(2m)}$, intersected with $[0,1]$. This concerns actual $D$/event counting, independently of bath heat. A count readout instrument reads the retained commuting $(b_r,d_r)$ flags and retains every outcome. Its preparation, readout and timing costs are owned; ideal finite matrix readout is not an empirical detector-accuracy claim.

If the independent total-event counter fixes the denominator $m$ and at most $k$ activation labels are wrong or missing (with missing labels assigned a declared value for the estimate), add $k/m$ to the deterministic count-ratio error. This bound is not used for a silently changed denominator. More generally, if $|\hat{A}-N_{\mathrm{act}}|\le k_A$ and $|\hat{m}-m|\le k_T<m$, then

$$
|\hat{A}/\hat{m}-N_{\mathrm{act}}/m|\le(k_A+k_T)/(m-k_T),
$$

with the final interval intersected with $[0,1]$. A clock-window uncertainty $|\delta T|\le u$ changes the number of fully completed events by at most $K=\lceil u/\tau\rceil+1$ and the active count by at most $K$. It is a count error first; if a changed-window ratio is compared to the nominal $m$-event ratio, a safe corresponding ratio bound is $\min(1,2K/(m-K))$ when $m>K$. If $m\le K$, report the uninformative $[0,1]$ ratio range. The possible endpoint events are retained rather than postselected out. Calibration $\Theta\in[\Theta_-,\Theta_+]$, $E_0\in[E_-,E_+]$ gives

$$
g(E_+,\Theta_-)\le q_{\mathrm{act}}\le g(E_-,\Theta_+),
\tag{A26}
$$

with lower value 0 at $\Theta_-=0$. The derivatives are $\partial g/\partial E_0=-g(1-g)/\Theta$ and $\partial g/\partial\Theta=E_0g(1-g)/\Theta^{2}$; they extend continuously to $\Theta=0$ for $E_0>0$. A source preparation error bounded by $\varepsilon_{D}$ in half trace distance changes its flag probability by at most $\varepsilon_{D}$; add that to the activation-law interval. The IID confidence statement requires the registered independent supply. If instead every conditional flag mean given the preceding tape is certified to lie within $\varepsilon_{D}$ of $g$, the conditional Hoeffding bound gives the same sampling halfwidth around those conditional means, hence total deviation at most $\varepsilon_{D}$ plus that halfwidth. Unbounded preparation correlations are not covered. Parameter/model, finite-count, clock and reset-saturation uncertainties remain separately typed.

#### 9. One common supplied-resource run and reuse

At a completed-endpoint horizon $T=m\tau$, the run uses one oscillator boundary pair and its private clock/return controller, $m$ supplied activation bits and old-record source cells, $m$ hot banks, $m$ cold banks, $m$ finite work/control modules and the corresponding return pointers, plus any fixed preparation/readout cells specified by Theorem N.4.0d. At an arbitrary $T$ with $m=\lfloor T/\tau\rfloor$, include the additional currently operating module and its inputs/pointer whenever $T>m\tau$: the supplied prefix has $m+1$ modules while only $m$ completed events are counted. Count every incoming and spent cell. The count and expected heat formulas at that horizon are finite statements with no bath renewal assumption.

For a common infinite-time process, extend these ports to one fixed index set $r\ge 1$, with locally finite start times $(r-1)\tau$, the same module Hamiltonians and arrival preparations at every index, and all outputs retained. This is the explicit open supplied-resource extension already required for the original oscillator's common-run result. Every finite horizon uses a finite prefix, and later operations do not act on completed activation flags or event pointers. The fixed interaction laws and product fresh inputs define compatible finite joint distributions and unitary local processes. No finite total energy, finite reusable bank or free infinite supply is assigned to this extension.

The logical memory $M$ can be reused. At slot $r$ its possibly imperfect state and all prior correlations are swapped into that slot's incoming $Y_{r}$. Since $Y_{r}$ starts independently in $I/2$, the postcapture $P_{r}$ is exactly uniform and independent of every past factor, $D_{r}$, current banks and $\Sigma_{r}$. The spent $Y_{\mathrm{out},r}$ is retained, including its correlations. Therefore the exact per-slot conditional entropy and heat law survive reuse at every $n$, and the residual memory is not silently prepared pure for free. Reset information in the spent hot/cold cells and old $Y$ cells is not erased later within this model. Past spent bath and old-$Y$ computational bits are retained classical records. Past work stores and quantum references are never acted on by the current module. Their existing correlations with the old record block are identical at the actual reset input/output boundaries. They can be carried as spectator parts of the work/reference inventory rather than falsely declared newly independent auxiliaries. After capture the entire past block is product with the fresh $P$, current baths and current work module (current $D$ is also fresh). On the actual reset interval from $t$ to $3t$, the endpoint propagator is $J^{2}$ restricted to initial $C=1$, hence

$$
J^{2}(|1\rangle_C\otimes\psi)=|0\rangle_C\otimes U_{\mathrm{sel}}\,\psi.
$$

$U_{\mathrm{sel}}$ is identity on $Y_{\mathrm{out}}$ and the entire past block. Thus the current conditional entropy/heat proof factors from the identical spectator block at the two reset boundaries. A fractional spectral-program propagator can temporarily mix program sectors and need not preserve current $Y_{\mathrm{out}}$ or its old correlations at each intermediate instant; no such stronger continuous-time assertion is used. Any non-work auxiliary used in the current hot conditional branch, including the unselected cold bank, is independent of its current (P,R) and returns unchanged. This distinction avoids using a fresh-current-module proof to erase prior correlations from the global account.

At fixed $n$, the mean energy of an incomplete current module is bounded by its finite actual spectral span; the event controller has a finite bound as well. Hence endpoint/incomplete-module energy terms are $O_n(1)=o(T)$. Divide (A24) by $T$ to obtain the actual long-time mean heat rates $gH_n/\tau$ and $[gH_n+(1-g)C_n]/\tau$. Then $n\to\infty$ gives (A3) and the active-subfamily equality at the unchanged count rate. The order is $T\to\infty$ for each fixed finite module followed by $n\to\infty$; no unproved exchange of two limits or finite-battery perpetual run is used.

#### 10. General specified fixed activation systems

The same construction works for a finite fixed activation Hamiltonian $H_{A}\ge 0$, with its ground energy normalized to zero by one fixed common shift, and a commuting flag projection F. Require F to vanish on the ground eigenspace, and supply the normalized Gibbs state at $\Theta$, with its zero-temperature ground-space limit at $\Theta=0$. Replace the D-controlled selection by its F/I−F-controlled counterpart and retain the full spectral activation label as a classical side record. Then the independently counted coefficient is

$$
q_{\mathrm{act}}(a;H_A,F)=\operatorname{Tr}(F\exp(-H_A/\Theta(a)))/\operatorname{Tr}(\exp(-H_A/\Theta(a))).
\tag{A27}
$$

This is a derived partition-function ratio for the specified source and flag, not a fitted duty factor. Spectral degeneracies and both branch dimensions are included. The source energy is unchanged because $[F,H_A]=0$. IID supplied activators give the same count and heat proof with $g$ replaced by (A27).

For normalized convergence down to zero, let $\Delta_{F}>0$ be the smallest energy in $F$ and let $d_{F}$ be its rank, $d_{0}\ge 1$ the ground multiplicity. Then $q_{\mathrm{act}}\le(d_F/d_0)e^{-\Delta_F/\Theta}$, so $q_{\mathrm{act}}/\Theta\le d_F/(e\,d_0\Delta_F)$. Thus the uniform error in (A20) is replaced by $[h(h_N(\Theta_{\max}))+\delta d_F/(2e\,d_0\Delta_F)]/\ln 2$, using $q\le 1$ for the tail. If $F=0$, the coefficient is identically zero.

No monotonicity is asserted for arbitrary $F$. Differentiation gives $dq/d\Theta=\operatorname{Cov}_\Theta(F,H_A)/\Theta^{2}$. An upper-energy threshold flag has nonnegative covariance; an intermediate energy band can have nonmonotone activation. Finite Boolean networks of independent gapped source bits are special commuting cases when their flag is a fixed Boolean function.

#### 11. Admission and nonclaims

On its explicit conditional source domain, the construction supplies the actual originally missing interfaces: same-carrier recorded boundary events; source-responsive activation flag; complete normalized maps with failures; fixed proper hardware and clock; actual all-cycle capture/reset ledger with conditional entropy ln2; same-hardware zero-acceleration baseline; same-rate hot-reset saturation; actual count coefficient and finite/calibration uncertainty. Its declared source and supplied-temperature premises remain attached to the result.

The following stronger statements are not proved or needed merely to derive this registered event fraction:

- acceleration physically prepares these Gibbs source cells or supplies the cold purity;
- equality with the Dirac detector of Theorem N.4a, an arbitrary natural MPU, or every possible system;
- autonomous delivery, finite perpetual resources, local interaction synthesis or experimentally practical complexity;
- body-export heat across the relational cut, a physical mass/action calibration, or the downstream $cma/(2\pi)$ mechanical signal;
- literal single-positive-temperature Gibbs status of the combined hot/cold bank;
- exact pure reset or exactly ideal work storage at finite $n$.

If a downstream consumer supplies the same-cycle action/mass and export bridges, it may use (A27) as the actual independently counted activation coefficient, subject to those bridges. This theorem does not silently complete the other owners. The declared response law and source cut are part of the theorem's premises, not conclusions.

<a id="definition-n12a-orbital-acceleration-test-bridge"></a>**Definition N.12a (Orbital-Acceleration Test Bridge).** For a gravitationally bound binary whose centers of mass follow ideal geodesic motion, the coordinate or relative orbital acceleration is not the proper acceleration entering the Unruh temperature in Equation N.4. A binary-pulsar UCT timing test therefore requires the following additional **orbital-acceleration bridge**:

1. the timing-model orbital acceleration magnitudes $|a_A(t)|$ and $|a_B(t)|$ are admitted as effective relational acceleration variables for the UCT loss channel;
2. the UCT orbital loss is modeled by
$$
P_{UCT}^{\mathrm{orb}}(t)
=
q_{\mathrm{act}}^{\mathrm{orb}}\frac{c}{2\pi}
\left(m_A|a_A(t)|+m_B|a_B(t)|\right);
$$
3. this loss enters the orbital-energy balance additively with the gravitational-wave channel.

Absent this bridge, the proper-acceleration UCT term gives no center-of-mass double-pulsar bound for ideal geodesic orbital motion. The parameter $q_{\mathrm{act}}^{\mathrm{orb}}$ is a bridge parameter and is not automatically equal to the proper-acceleration factor $q_{\mathrm{act}}$.

<a id="corollary-n121-conditional-saturated-bridge-power-for-the-double-pulsar"></a>**Corollary N.12.1 (Conditional Saturated-Bridge Power for the Double Pulsar).** *For PSR J0737–3039A/B with $m_A=1.338M_\odot$, $m_B=1.249M_\odot$, relative semi-major axis $a_{\mathrm{orb}}=8.79\times10^8$ m, and eccentricity $e=0.0878$ (Kramer et al. 2021), the orbit-averaged saturated orbital-bridge power is*
$$
\langle P_{UCT}^{\mathrm{orb,sat}}\rangle
=
\frac{c}{2\pi}
\left(
m_A\langle |a_A|\rangle + m_B\langle |a_B|\rangle
\right)
\approx
5.47\times10^{40}\,\mathrm W,
$$
*where*
$$
\langle r^{-2}\rangle_t=\frac{1}{a_{\mathrm{orb}}^2\sqrt{1-e^2}},
\qquad
\langle |a_A|\rangle=Gm_B\langle r^{-2}\rangle_t,
\qquad
\langle |a_B|\rangle=Gm_A\langle r^{-2}\rangle_t.
$$

*Proof.* Parametrize the Kepler ellipse by the eccentric anomaly $E$. Then
$$
r=a_{\mathrm{orb}}(1-e\cos E),
\qquad
dt=\frac{1-e\cos E}{n}\,dE,
\qquad
T=\frac{2\pi}{n}.
$$
Consequently
$$
\langle r^{-2}\rangle_t
=\frac1T\int_0^T\frac{dt}{r^2}
=\frac{1}{2\pi a_{\mathrm{orb}}^2}
\int_0^{2\pi}\frac{dE}{1-e\cos E}.
$$
With $u=\tan(E/2)$, splitting the integral at $E=\pi$ gives
$$
\int_0^{2\pi}\frac{dE}{1-e\cos E}
=2\int_{-\infty}^{\infty}
\frac{du}{(1-e)+(1+e)u^2}
=\frac{2\pi}{\sqrt{1-e^2}}.
$$
This proves the displayed time average. Newtonian center-of-mass kinematics gives
$$
|a_A|=\frac{Gm_B}{r^2},
\qquad
|a_B|=\frac{Gm_A}{r^2}.
$$
Using $M_\odot=1.98847\times10^{30}\,\mathrm{kg}$, $G=6.67430\times10^{-11}\,\mathrm{m^3kg^{-1}s^{-2}}$, and $c=2.99792458\times10^8\,\mathrm{m\,s^{-1}}$ gives
$$
m_A=2.66057\times10^{30}\,\mathrm{kg},
\qquad
m_B=2.48360\times10^{30}\,\mathrm{kg},
$$
and
$$
\langle r^{-2}\rangle_t
=1.29928\times10^{-18}\,\mathrm{m^{-2}}.
$$
Therefore
$$
\langle P_{UCT}^{\mathrm{orb,sat}}\rangle
=\frac{c}{2\pi}
\left(2Gm_Am_B\langle r^{-2}\rangle_t\right)
=5.46809\times10^{40}\,\mathrm W,
$$
which rounds to the stated value. ∎

<a id="corollary-n122-timing-likelihood-promotion-gate-and-leading-sensitivity"></a>**Corollary N.12.2 (Timing-Likelihood Promotion Gate and Leading Sensitivity).** For the same binary, the leading-quadrupole Peters comparator is
$$
\langle P_{GW}^{\mathrm{quad}}\rangle
=
\frac{32}{5}
\frac{G^4(m_Am_B)^2(m_A+m_B)}
{c^5a_{\mathrm{orb}}^5}
f(e),
\qquad
f(e):=
\frac{1+\tfrac{73}{24}e^2+\tfrac{37}{96}e^4}{(1-e^2)^{7/2}}.
$$
At $e=0.0878$,
$$
f(e)=1.05157065\ldots,
\qquad
\langle P_{GW}^{\mathrm{quad}}\rangle
=2.36060\times10^{25}\,\mathrm W,
$$
and hence the leading fixed-parameter response coefficient is
$$
K_{\mathrm{quad}}
:=
\frac{\langle P_{UCT}^{\mathrm{orb,sat}}\rangle}
{\langle P_{GW}^{\mathrm{quad}}\rangle}
=
\frac{5.46809\times10^{40}}{2.36060\times10^{25}}
=2.31640\times10^{15}.
\tag{N.12d}
$$

An observational upper bound requires two independently accepted records:

1. a timing-likelihood certificate $\mathfrak C_{\mathrm{tim}}$ fixing the data set, complete post-Newtonian timing and radiative null model, mass and ephemeris inputs, Galactic, kinematic, propagation, and system-specific nuisance parameters, priors or sampling rule, covariance, confidence construction, and numerical tolerance, and returning a one-sided $(1-\alpha)$ upper limit $r_+^{(1-\alpha)}$ for the nonnegative fractional anomalous orbital-decay response;
2. a response certificate $\mathfrak C_{\mathrm{resp}}$ fixing the UCT acceleration profile and its insertion into that same timing model and proving, uniformly over its declared nuisance and parameter domain,
$$
r(q,\nu)
:=
\frac{\dot P_b(0,\nu)-\dot P_b(q,\nu)}{\lvert\dot P_b^{\mathrm{GR}}(\nu)\rvert}
\ge K_-q,
\qquad K_->0,
\tag{N.12e}
$$
with the sign convention chosen so that an additional loss has $r\ge0$. The proof of (N.12e) must include the nonlinear remainder, refitting response, and all correlations with $\nu$; the leading comparator (N.12d) does not by itself establish $K_-=K_{\mathrm{quad}}$.

On the intersection of these records,
$$
\boxed{
q_{\mathrm{act}}^{\mathrm{orb}}
\le
\frac{r_+^{(1-\alpha)}}{K_-}
}
\tag{N.12f}
$$
at the confidence status declared by $\mathfrak C_{\mathrm{tim}}$.

*Proof.* Acceptance of $\mathfrak C_{\mathrm{tim}}$ gives

$$
r(q_{\mathrm{act}}^{\mathrm{orb}},\nu)\le r_+^{(1-\alpha)}
$$

under its declared decision rule. Acceptance of $\mathfrak C_{\mathrm{resp}}$ gives

$$
K_-q_{\mathrm{act}}^{\mathrm{orb}}\le r(q_{\mathrm{act}}^{\mathrm{orb}},\nu)
$$

uniformly over the same nuisance domain. Since $K_->0$, division gives (N.12f). The evaluations of $f(e)$, the quadrupole power, and $K_{\mathrm{quad}}$ are direct substitutions and establish only the leading fixed-parameter sensitivity. ∎

If the quoted fractional comparison precision $1.3\times10^{-4}$ is inserted only as a diagnostic scale and if $K_{\mathrm{quad}}$ is used only as the leading response comparator, then
$$
q_{\mathrm{sens}}
:=
\frac{1.3\times10^{-4}}{2.31640\times10^{15}}
=5.61215\times10^{-20}.
\tag{N.12g}
$$
This number becomes a bound only if the timing analysis independently certifies $r_+^{(1-\alpha)}=1.3\times10^{-4}$ under its stated convention and the response audit certifies $K_-=K_{\mathrm{quad}}$ over the fitted domain.

<a id="corollary-n123-conditional-saturated-bridge-exclusion-criterion"></a>**Corollary N.12.3 (Conditional Saturated-Bridge Exclusion Criterion).** On the orbital-acceleration test bridge, the saturated branch $q_{\mathrm{act}}^{\mathrm{orb}}=1$ is excluded at the status declared by $\mathfrak C_{\mathrm{tim}}$ whenever accepted certificates satisfy
$$
\frac{r_+^{(1-\alpha)}}{K_-}<1.
$$
The currently quoted comparison precision and leading power ratio do not, without the two promotion certificates of Corollary N.12.2, establish that exclusion. This leaves the proper-acceleration factor $q_{\mathrm{act}}$ of Definition N.12 and the boundary-channel utilization factor $q$ of Proposition N.4 logically separate.

*Proof.* Equation (N.12f) and $r_+^{(1-\alpha)}/K_-<1$ are incompatible with $q_{\mathrm{act}}^{\mathrm{orb}}=1$. The parameter-separation statement follows from Definition N.12a. ∎

<a id="remark-n121-leading-active-refresh-sensitivity"></a>**Remark N.12.1 (Leading Active-Refresh Sensitivity).** Equation (N.12g) is a leading sensitivity to the orbital-bridge coefficient, not by itself a microscopic count of actively refreshed degrees of freedom. On the independent mass-normalization branch $\mathfrak B_{\mathrm{mass}}$, a neutron star with $m=1.338M_\odot$ has
$$
\mathcal I_{\mathrm{rel}}
=\frac{2c^2\tau_{\min}m}{\hbar}
\approx5.76\times10^{38}\ \text{nats}.
$$
Turning a certified bound on $q_{\mathrm{act}}^{\mathrm{orb}}$ into a bound on an active-information count additionally requires a microscopic activity map proving that this bridge coefficient is the corresponding information fraction and that its ledger is source-exhaustive and free of double counting.

<a id="corollary-n124-forward-looking-diagnostic-sensitivity"></a>**Corollary N.12.4 (Forward-Looking Diagnostic Sensitivity).** A prospective fractional timing scale of $10^{-5}$ with the leading comparator (N.12d) gives
$$
q_{\mathrm{sens}}^{\mathrm{future}}
=
\frac{10^{-5}}{2.31640\times10^{15}}
=4.31704\times10^{-21}
\approx4.3\times10^{-21}.
$$
This is a prospective diagnostic, not a forecasted bound. It becomes a same-system bound only if the future release supplies an accepted timing-likelihood certificate with the corresponding $r_+^{(1-\alpha)}$ and an accepted response certificate supplies $K_-$ in the same fitted model. An orbital-phase identification additionally requires the response certificate to distinguish the declared acceleration profile from every registered nuisance template.

<a id="corollary-n125-four-momentum-orbital-share-and-jeans-timing-template"></a>**Corollary N.12.5 (Four-Momentum Orbital Share and Jeans Timing Template).** Apply the four-momentum balance of Theorem N.UCTa, in its covariant form $Dp/d\tau=-k$ on a background metric, to a body with no nongravitational supply whose comoving export is $k=(R/c^2)u+\Pi$ with $\Pi\cdot u=0$ and $R\ge c|\Pi|$.

1. The balance splits into $dm/d\tau=-R/c^2$ and $m\,Du/d\tau=-\Pi$. An isotropic export, $\Pi=0$, keeps a geodesic worldline geodesic and drains only rest mass; the motion changes only through the comoving momentum export $\Pi$.
2. In the Newtonian two-body limit with masses $m_i$, positions $\mathbf x_i$, velocities $\mathbf v_i$, separation $r=|\mathbf x_1-\mathbf x_2|$, rest-mass loss $\dot m_i=-R_i/c^2$, and equations $m_i\dot{\mathbf v}_i=\mathbf F_i-\boldsymbol\Pi_i$ with mutual Newtonian forces $\mathbf F_1=-\mathbf F_2$, the orbital energy $E_{\mathrm{orb}}=\frac12m_1|\mathbf v_1|^2+\frac12m_2|\mathbf v_2|^2-Gm_1m_2/r$ obeys, with $j$ the companion of $i$,
   $$
   \dot E_{\mathrm{orb}}=-\sum_{i=1}^2\mathbf v_i\cdot\boldsymbol\Pi_i-\sum_{i=1}^2\frac{R_i}{c^2}\left(\frac12|\mathbf v_i|^2-\frac{Gm_j}{r}\right).
   \tag{N.12h}
   $$
   For causal exports $|\boldsymbol\Pi_i|\le R_i/c$ this gives
   $$
   |\dot E_{\mathrm{orb}}|\le\sum_{i=1}^2\kappa_iR_i,
   \qquad
   \kappa_i:=\frac{|\mathbf v_i|}{c}+\frac{|\mathbf v_i|^2/2+Gm_j/r}{c^2}.
   \tag{N.12i}
   $$
3. The relative coordinate $\mathbf x=\mathbf x_1-\mathbf x_2$ obeys $\ddot{\mathbf x}=-GM\mathbf x/r^3+\mathbf f$ with $M=m_1+m_2$, $\dot M=-(R_1+R_2)/c^2$ and $\mathbf f=-\boldsymbol\Pi_1/m_1+\boldsymbol\Pi_2/m_2$. Its osculating specific energy $\epsilon=\frac12|\dot{\mathbf x}|^2-GM/r$, semimajor axis $a=-GM/(2\epsilon)$ and period $P_b=2\pi\sqrt{a^3/(GM)}$ satisfy exactly
   $$
   \dot\epsilon=-\frac{G\dot M}{r}+\dot{\mathbf x}\cdot\mathbf f,
   \qquad
   \dot a=\frac{a\dot M}{M}\left(1-\frac{2a}{r}\right)+\frac{2a^2}{GM}\,\dot{\mathbf x}\cdot\mathbf f,
   \qquad
   \frac{\dot P_b}{P_b}=\frac32\frac{\dot a}a-\frac12\frac{\dot M}M.
   $$
   For $\mathbf f=0$ the specific angular momentum $h=|\mathbf x\times\dot{\mathbf x}|$ is conserved and $d(e^2)/dt=(2h^2\dot M/(GM^2))(1/a-1/r)$. Averaging over one Kepler orbit at frozen elements and frozen $\dot M$, with $\langle1/r\rangle_t=1/a$, gives
   $$
   \frac{\langle\dot P_b\rangle}{P_b}
   =\frac{2(R_1+R_2)}{Mc^2}+\frac{3a}{GM}\langle\dot{\mathbf x}\cdot\mathbf f\rangle,
   \tag{N.12j}
   $$
   and, for isotropic exports with $R_1+R_2>0$, $\langle\dot a\rangle=-a\dot M/M$, $\langle\dot e\rangle=0$ and $\langle\dot P_b\rangle/P_b=-2\dot M/M>0$.
4. A realization of item 3 of Definition N.12a by causal comoving export, with UCT orbital loss $P_{\mathrm{UCT}}^{\mathrm{orb}}$ in the orbital-energy balance, requires $R_1+R_2\ge P_{\mathrm{UCT}}^{\mathrm{orb}}/\max_i\kappa_i$ by (N.12i). The same export contributes the rest-mass term $2(R_1+R_2)/(Mc^2)\ge2P_{\mathrm{UCT}}^{\mathrm{orb}}/(\max_i\kappa_iMc^2)$ to (N.12j), which lengthens the period, whereas an orbital-energy loss shortens it. An isotropic source-exhaustive export carries this Jeans term alone. The timing template of the orbital bridge is therefore fixed by the split of the export into $R_i$ and $\boldsymbol\Pi_i$.

*Proof.* Write $p=mu$ with $u\cdot u=-c^2$ and $u\cdot Du/d\tau=0$. Contracting $Dp/d\tau=-k$ with $u$ gives $-c^2\,dm/d\tau=-(R/c^2)(-c^2)$, hence $dm/d\tau=-R/c^2$, and the orthogonal part is $m\,Du/d\tau=-\Pi$; for $\Pi=0$ the worldline equation is the geodesic equation. In the Newtonian limit, $\sum_im_i\mathbf v_i\cdot\dot{\mathbf v}_i=\mathbf F_1\cdot(\mathbf v_1-\mathbf v_2)-\sum_i\mathbf v_i\cdot\boldsymbol\Pi_i$ cancels the fixed-mass derivative of the potential energy, and the mass derivatives contribute $\sum_i\frac12\dot m_i|\mathbf v_i|^2-G(\dot m_1m_2+m_1\dot m_2)/r$; substituting $\dot m_i=-R_i/c^2$ gives (N.12h), and the triangle inequality with $|\boldsymbol\Pi_i|\le R_i/c$ gives (N.12i). Dividing the two equations of motion by the masses and subtracting gives the relative equation. Differentiating $\epsilon$ and using that equation gives $\dot\epsilon$; differentiating $a=-GM/(2\epsilon)$ and substituting $\epsilon=-GM/(2a)$ gives $\dot a$, and $P_b\propto a^{3/2}M^{-1/2}$ gives the period relation. For $\mathbf f=0$ the force is central, so $h$ is conserved, and differentiating $e^2=1+2\epsilon h^2/(G^2M^2)$ gives the displayed rate. With the eccentric anomaly $E$, $r=a(1-e\cos E)$ and $dt=(1-e\cos E)\,dE/n$ with $n=2\pi/P_b$, so $\langle1/r\rangle_t=1/a$; averaging the exact relations at frozen elements gives (N.12j) and the isotropic rates. Item 4 combines (N.12i) with the first term of (N.12j). ∎

#### N.8.7 Phase-Resolved Export Response and Field-Derived Orbital Timing

<a id="corollary-n126-phase-resolved-zero-recoil-radiation-response"></a>**Corollary N.12.6 (Phase-Resolved Zero-Recoil Radiation Response).** In the Newtonian two-body model of Corollary N.12.5, suppose that $m_i>0$, that there is no nongravitational supply or force other than the registered export, and that each body's outgoing radiation has an antipodally even nonnegative angular energy-flux measure $\Lambda_i(t,d\mathbf n)$ in its comoving frame. Use the Newtonian time and source-rate convention of that corollary. The measure is the energy flux of the outgoing field at the source cut; an outgoing null component contributes four-momentum rate $(d\Lambda_i/c,\mathbf n\,d\Lambda_i/c)$. Require finite, locally integrable total fluxes. Then their actual export moments are
$$
R_i(t)=\int_{S^2}\Lambda_i(t,d\mathbf n),\qquad
\boldsymbol\Pi_i(t)=\frac1c\int_{S^2}\mathbf n\,\Lambda_i(t,d\mathbf n)=\mathbf0.
\tag{N.12k}
$$
The conclusions below hold more generally whenever the computed first angular moments vanish. Antipodal symmetry is a sufficient source condition and permits an anisotropic angular intensity.

Write $R=R_1+R_2$, $M=m_1+m_2$, $\mathbf x=\mathbf x_1-\mathbf x_2$, $r=|\mathbf x|$, $\mathbf v=\dot{\mathbf x}$ and $\mathbf h=\mathbf x\times\mathbf v$. Consider a collision-free interval on which the osculating specific energy $\epsilon=|\mathbf v|^2/2-GM/r$ is negative and $|\mathbf h|>0$. Define $a=-GM/(2\epsilon)$, $P_b=2\pi\sqrt{a^3/(GM)}$ and the eccentricity vector
$$
\mathbf e=\frac{\mathbf v\times\mathbf h}{GM}-\frac{\mathbf x}{r},\qquad e=|\mathbf e|<1.
$$
All instantaneous identities are exact in this Newtonian model, with absolutely continuous masses and derivatives understood almost everywhere.

1. The source changes the gravitational mass parameter and the osculating elements according to
   $$
   \dot M=-\frac R{c^2},\qquad \dot{\mathbf h}=\mathbf0,\qquad
   \frac{\dot P_b}{P_b}=\frac R{Mc^2}\left(\frac{3a}{r}-1\right),\qquad
   \dot{\mathbf e}=\frac R{Mc^2}\left(\mathbf e+\frac{\mathbf x}{r}\right).
   \tag{N.12l}
   $$
   Since $r<2a$ on a bound osculating state,
   $$
   \frac{\dot P_b}{P_b}\ge\frac R{2Mc^2},
   \tag{N.12m}
   $$
   with strict inequality wherever $R>0$. Hence every nonzero zero-recoil export lengthens the osculating period on its bound interval, independently of its orbital-phase profile.

2. For a frozen Kepler ellipse, let $\langle\cdot\rangle_t$ denote its normalized time average, retain the actual phase profile $R(t)$ in the integrand, and define
   $$
   \operatorname{Cov}_t(R,r^{-1})
      :=\langle R/r\rangle_t-\langle R\rangle_t\langle r^{-1}\rangle_t.
   $$
   The first-order secular responses obtained by this frozen-orbit averaging are
   $$
   \frac{\langle\dot P_b\rangle_t}{P_b}
      =\frac{2\langle R\rangle_t}{Mc^2}
       +\frac{3a}{Mc^2}\operatorname{Cov}_t(R,r^{-1}),
   \qquad
   \left\langle\frac{d(e^2)}{dt}\right\rangle_t
      =\frac{2a(1-e^2)}{Mc^2}\operatorname{Cov}_t(R,r^{-1}).
   \tag{N.12n}
   $$
   If $R=F(r)$ with $F$ nonincreasing on the traversed radial interval, this covariance is nonnegative. It is strictly positive when $e>0$ and $F(r)$ is not constant almost everywhere under the orbital time measure. Thus phase concentration toward periastron increases the period response above the frozen-rate Jeans value and increases $e^2$. Formula (N.12n) includes the constant-rate case of (N.12j).

3. If the source's total power profile is $R(t)=A/r(t)^2$ with $A\ge0$ fixed over the frozen orbit, put
   $$
   \overline R=\frac{A}{a^2\sqrt{1-e^2}},\qquad
   \rho=\frac{\overline R}{Mc^2}.
   $$
   Its first-order secular response is
   $$
   \begin{aligned}
   \langle\dot M\rangle_t&=-\frac{\overline R}{c^2},
   &\frac{\langle\dot a\rangle_t}{a}
      &=\rho\frac{1+e^2}{1-e^2},\\
   \langle\dot{\mathbf e}\rangle_t&=\rho\mathbf e,
   &\frac{\langle\dot P_b\rangle_t}{P_b}
      &=\rho\frac{2+e^2}{1-e^2}.
   \end{aligned}
   \tag{N.12o}
   $$
   For $e>0$ this gives $\langle\dot e\rangle_t=\rho e$ and zero averaged apsidal rotation; the vector formula covers $e=0$. These are averages of the instantaneous response on a frozen ellipse, rather than exact finite-change solutions of the varying-mass orbit.

*Proof.* Reflection $\mathbf n\mapsto-\mathbf n$ preserves each $\Lambda_i$ and reverses its vector integrand. Therefore the first angular moment equals its negative and vanishes. The energy moment is nonnegative. These moments are those of the outgoing null-radiation field: a ray's stress tensor (N.UCTc.7) transports its energy and momentum to the source cut, and the endpoint identity in that theorem adds the moments over all emitted rays. The sum carries future-causal four-momentum with comoving spatial part zero. No incident-field supply is included in this branch. The balance in Corollary N.12.5 consequently gives $\dot m_i=-R_i/c^2$ and zero recoil, which proves (N.12k) and yields
$$
\ddot{\mathbf x}=-\frac{GM}{r^3}\mathbf x,\qquad
\dot M=-\frac R{c^2},\qquad \dot{\mathbf h}=\mathbf0.
$$
Substitute $\mathbf f=0$ and $\dot M=-R/c^2$ into the exact osculating identities in item 3 of that corollary. Then
$$
\frac{\dot a}{a}=\frac R{Mc^2}\left(\frac{2a}{r}-1\right),\qquad
\frac{\dot P_b}{P_b}
   =\frac32\frac{\dot a}{a}-\frac12\frac{\dot M}{M}
   =\frac R{Mc^2}\left(\frac{3a}{r}-1\right).
$$
For the eccentricity vector, direct differentiation gives
$$
\frac{d}{dt}\left(\frac{\mathbf v\times\mathbf h}{GM}\right)
 =\frac{\ddot{\mathbf x}\times\mathbf h}{GM}
   -\frac{\dot M}{M}\frac{\mathbf v\times\mathbf h}{GM}.
$$
The vector triple-product identity and the central acceleration imply

$$
\ddot{\mathbf x}\times\mathbf h/(GM)=d(\mathbf x/r)/dt.
$$

Subtraction of this derivative leaves
$\dot{\mathbf e}=-(\dot M/M)(\mathbf e+\mathbf x/r)$, proving (N.12l). The vis-viva identity $|\mathbf v|^2=GM(2/r-1/a)$ and $|\mathbf h|>0$ imply $2/r-1/a>0$, hence $r<2a$. This proves (N.12m). For any subinterval, integration of the nonnegative logarithmic period rate proves monotonicity; its change is strict if $R>0$ on a set of positive measure.

Taking the scalar product of $\dot{\mathbf e}$ with $2\mathbf e$ yields
$$
\frac{d(e^2)}{dt}
 =\frac{2R}{Mc^2}\left(e^2+\mathbf e\cdot\frac{\mathbf x}{r}\right)
 =\frac{2(1-e^2)R}{Mc^2}\left(\frac ar-1\right).
$$
For the last equality, the osculating identities give

$$
\mathbf e\cdot\mathbf x/r=|\mathbf h|^2/(GMr)-1=a(1-e^2)/r-1.
$$

On the frozen ellipse, $\langle r^{-1}\rangle_t=1/a$ by Corollary N.12.5. Averaging this $e^2$ identity and the exact period identity proves (N.12n). Let $r'$ be an independent copy of the radius under normalized orbital time measure. Then
$$
2\operatorname{Cov}_t(F(r),r^{-1})
 =\mathbb E\left[(F(r)-F(r'))(r^{-1}-{r'}^{-1})\right].
$$
Both factors have the same sign when $F$ is nonincreasing. The integrand is nonnegative. When $F(r)$ is nonconstant almost everywhere, two sets of positive time measure have separated values of $F$; monotonicity then separates their radii, so the integrand is positive on their product. This proves the strict assertion. A circular orbit has constant radius and zero covariance.

For the inverse-square source profile, use true anomaly $f$ on the frozen ellipse. Conservation of angular momentum gives $dt=r^2df/|\mathbf h|$, while
$$
r=\frac{a(1-e^2)}{1+e\cos f},\qquad
|\mathbf h|=\sqrt{GMa(1-e^2)},\qquad
P_b=2\pi\sqrt{\frac{a^3}{GM}}.
$$
Consequently
$$
\langle R\rangle_t=\frac{A}{P_b|\mathbf h|}\int_0^{2\pi}df
 =\frac{A}{a^2\sqrt{1-e^2}}=\overline R,
\qquad
\frac{\langle R/r\rangle_t}{\overline R}
 =\frac1{2\pi}\int_0^{2\pi}\frac{df}{r}
 =\frac1{a(1-e^2)}.
$$
In a fixed oriented basis of the orbital plane, $\mathbf x/r=(\cos f,\sin f)$ after choosing the periastron axis; for $e=0$ choose any axis. Hence
$\langle R\,\mathbf x/r\rangle_t=\mathbf0$. Averaging the exact mass, semimajor-axis, eccentricity-vector and period identities now gives every formula in (N.12o). The vector rate is parallel to $\mathbf e$, proving the scalar eccentricity and apsidal statements for $e>0$. The averaging holds the elements and $A$ fixed while integrating the phase dependence of the source; this is precisely the stated first-order secular operation. ∎

<a id="corollary-n127-sharp-angular-flux-timing-interval"></a>**Corollary N.12.7 (Sharp Angular-Flux Timing Interval).** Use the Newtonian two-body model, time/rate convention and no-nongravitational-supply contract of Corollary N.12.5. At each body's comoving source cut supply a finite nonnegative outgoing angular energy-flux measure $\Lambda_i(t,d\mathbf n)$ on $S^2$, as in Corollary N.12.6, now with unrestricted first angular moment. Its actual moments are
$$
R_i=\int_{S^2}\Lambda_i(d\mathbf n),\qquad
\boldsymbol\Pi_i=\frac1c\int_{S^2}\mathbf n\,\Lambda_i(d\mathbf n).
\tag{N.12p}
$$
For time-dependent profiles require $t\mapsto\Lambda_i(t,\cdot)$ to be weakly measurable, with nonnegative locally integrable total powers. Along time-dependent solutions, instantaneous identities hold almost everywhere for absolutely continuous masses. Retain every emitted ray and its energy in the outgoing field ledger. The source-cut measures and their angular control profiles are supplied data; Theorem N.12.9 derives one such profile from an internal-field source.

Consider an instantaneous collision-free bound nonradial state, with $m_i>0$, $M=m_1+m_2$, $\mathbf x=\mathbf x_1-\mathbf x_2$, $r=|\mathbf x|$, $\mathbf v=\dot{\mathbf x}$, $\epsilon=|\mathbf v|^2/2-GM/r<0$, $a=-GM/(2\epsilon)$ and $\mathbf x\times\mathbf v\ne0$. Put $R=R_1+R_2$, $\widehat{\mathbf v}=\mathbf v/|\mathbf v|$, and
$$
A=\frac{R}{Mc^2}\left(\frac{3a}{r}-1\right),\qquad
B=\frac{3a|\mathbf v|}{GMc}
       \left(\frac{R_1}{m_1}+\frac{R_2}{m_2}\right).
\tag{N.12q}
$$
Nonradiality ensures $|\mathbf v|>0$, so $\widehat{\mathbf v}$ is defined. Both $A$ and $B$ have units of inverse time, and $B=0$ exactly when $R=0$. The conclusions are as follows.

1. For fixed powers $R_i$, the attainable moment set is exactly $|\boldsymbol\Pi_i|\le R_i/c$. Every pair is represented by at most two antipodal angular atoms for each emitting body. The possible relative recoil accelerations form exactly the ball
   $$
   \mathbf f=-\frac{\boldsymbol\Pi_1}{m_1}
               +\frac{\boldsymbol\Pi_2}{m_2},\qquad
   |\mathbf f|\le b:=\frac1c\left(\frac{R_1}{m_1}+\frac{R_2}{m_2}\right).
   \tag{N.12r}
   $$
   If $R_i>0$, nonnegative smooth angular densities have exactly the strict interior $|\boldsymbol\Pi_i|<R_i/c$ as their moment image. The angular atoms are ideal kinetic-radiation beams; their finite number at a cut is distinct from a finite description or physical synthesis of an arbitrary time-dependent emitter.

2. The exact attainable interval of instantaneous osculating-period responses is
   $$
   \boxed{\quad
   \frac{\dot P_b}{P_b}\in[A-B,A+B],\qquad
   P_b=2\pi\sqrt{\frac{a^3}{GM}}.
   \quad}
   \tag{N.12s}
   $$
   If $R=0$, the unique response is zero. If $R>0$, the lower endpoint requires, and is attained exactly by,
   $$
   \Lambda_1=R_1\delta_{\widehat{\mathbf v}},\qquad
   \Lambda_2=R_2\delta_{-\widehat{\mathbf v}};
   \tag{N.12t}
   $$
   a zero-power body has the zero measure. The upper endpoint reverses both directions. Smooth angular densities attain precisely $(A-B,A+B)$, with the same infimum and supremum. In particular a strictly shortening-period response exists exactly when $B>A$, both for measures and for smooth angular densities. If $B=A>0$, the zero response is attained by (N.12t), while every smooth angular density gives a positive response.

3. On a fixed frozen Kepler ellipse with positive constant masses, supply any nonnegative integrable phase profiles $R_i(t)$ and use the same normalized time average as Corollary N.12.6. The exact range of the first-order frozen-orbit average over measurable angular-measure profiles is
   $$
   \frac{\langle\dot P_b\rangle_t}{P_b}
      \in[\langle A\rangle_t-\langle B\rangle_t,
           \langle A\rangle_t+\langle B\rangle_t].
   \tag{N.12u}
   $$
   When $\langle R\rangle_t>0$, endpoint equality requires the corresponding directions in (N.12t) for almost every phase at which the respective body emits, with respect to $R_i(t)dt$. Angular densities that are smooth in direction at every emitting phase attain precisely the open interval. If the supplied powers are smooth in time, the interior witnesses below are smooth jointly in time and direction. These averages are the first-order operation on the frozen ellipse, not finite-change solutions of a perturbed orbit.

*Proof.* The triangle inequality in (N.12p) gives $c|\boldsymbol\Pi_i|\le R_i$. Conversely, for $R_i>0$ put $\alpha_i=c|\boldsymbol\Pi_i|/R_i\in[0,1]$ and choose $\mathbf u_i$ in the direction of a nonzero $\boldsymbol\Pi_i$, or any unit direction if it vanishes. Then
$$
\Lambda_i=\frac{R_i}{2}
   \bigl[(1+\alpha_i)\delta_{\mathbf u_i}
          +(1-\alpha_i)\delta_{-\mathbf u_i}\bigr]
\tag{N.12v}
$$
has precisely the prescribed moments. This is the moment construction also used in Theorem N.UCTc's finite-step compiler; here the supplied outgoing-only emission and rest-mass budget remain those of Corollary N.12.5. If $R_i=0$, nonnegativity forces $\Lambda_i=0$. The sum of the two momentum balls is the ball in (N.12r). Explicitly, for $b>0$ and any $|\mathbf f|\le b$, take
$\boldsymbol\Pi_1=-(R_1/c)\mathbf f/b$ and
$\boldsymbol\Pi_2=(R_2/c)\mathbf f/b$.

For completeness the smooth moment image has an explicit construction. With solid-angle measure $d\Omega$, unit $\mathbf u$ and $\kappa>0$, define
$$
w_{\kappa,\mathbf u}(\mathbf n)
  =\frac{\kappa e^{\kappa\mathbf u\cdot\mathbf n}}
          {4\pi\sinh\kappa},\qquad
L(\kappa)=\coth\kappa-\frac1\kappa.
\tag{N.12w}
$$
Integration with $s=\mathbf u\cdot\mathbf n$ gives
$\int w_{\kappa,\mathbf u}d\Omega=1$ and
$\int\mathbf n w_{\kappa,\mathbf u}d\Omega=L(\kappa)\mathbf u$.
The derivative of $L$ is the strictly positive variance of $s$ under this density. Its limits are $L(0)=0$ and $L(\infty)=1$, so every strict interior moment is attained by a unique finite $\kappa$ and the chosen direction; the zero moment uses the uniform density. Conversely, $|\int\mathbf n\,d\Lambda|=\int d\Lambda>0$ forces the measure to concentrate at a single direction: if $\mathbf u$ is the normalized mean, the nonnegative integral $\int(1-\mathbf u\cdot\mathbf n)d\Lambda$ vanishes. A smooth nonzero angular density cannot concentrate on one point. This proves item 1 and the angular equality criterion.

The emission moments are source-exhaustive in the stated outgoing-ray model. Each angular component carries the future-null momentum increment $(d\Lambda_i/c,\mathbf n\,d\Lambda_i/c)$. Integrating the ray stress and its endpoint identity (N.UCTc.7) over emission time and direction gives exactly these energy and momentum moments at the emitting cut. The negative body endpoint cancels the positive outgoing-field endpoint when the body follows the export balance. No incoming ray or propulsive supply is added. Contracting that balance and taking its Newtonian spatial part gives
$$
\dot m_i=-\frac{R_i}{c^2},\qquad
m_i\dot{\mathbf v}_i=\mathbf F_i-\boldsymbol\Pi_i,\qquad
\ddot{\mathbf x}=-\frac{GM}{r^3}\mathbf x+\mathbf f.
$$
A finite interval must retain positive masses, equivalently
$\int_{t_0}^tR_i(s)ds<m_i(t_0)c^2$ for each body, and remain in the stated collision-free bound nonradial region. This is an energy-budget and state-admission condition, rather than an independent energy source. The ray endpoint argument supplies the local export ledger within the Newtonian model; its gravitational force retains the model's own approximation.

Direct differentiation, using $\dot M=-R/c^2$, gives
$$
\dot\epsilon=-\frac{G\dot M}{r}+\mathbf v\cdot\mathbf f,
\qquad
\frac{\dot a}{a}
  =\frac{\dot M}{M}\left(1-\frac{2a}{r}\right)
     +\frac{2a}{GM}\mathbf v\cdot\mathbf f.
$$
Therefore
$$
\frac{\dot P_b}{P_b}
  =\frac32\frac{\dot a}{a}-\frac12\frac{\dot M}{M}
  =A+\frac{3a}{GM}\mathbf v\cdot\mathbf f.
$$
The coefficient of the acceleration scalar product has units of time squared per length squared; multiplying $\mathbf v\cdot\mathbf f$ gives inverse time. The ball (N.12r) now gives (N.12s). For $R>0$, both positive-power summands must saturate their scalar-product bounds to reach an endpoint. The angular equality criterion proves (N.12t) and its reversed counterpart. For any $-1<\eta<1$, the choices
$\boldsymbol\Pi_1=\eta(R_1/c)\widehat{\mathbf v}$ and
$\boldsymbol\Pi_2=-\eta(R_2/c)\widehat{\mathbf v}$
give response $A-\eta B$ and admit smooth densities by (N.12w). This proves the entire open interval, including every interior zero response.

The vis-viva identity $|\mathbf v|^2=GM(2/r-1/a)$ and nonradiality imply $r<2a$. Thus $A>0$ and $B>0$ whenever $R>0$. The interval and its smooth interior then give all shortening and zero-response cases in item 2.

On the frozen ellipse the coefficients multiplying $R_i$ in $A$ and $B$ are bounded, so their averages exist for the stated power profiles. Integrating the pointwise interval gives (N.12u). Its endpoints are attained by the measurable beam profiles (N.12t), and convex interpolation of the two profiles attains every value between them. The pointwise deficits from an endpoint are nonnegative. Vanishing integrated deficit consequently requires endpoint equality almost everywhere in the stated power-weighted sense. For an angular density at every emitting phase the deficit is positive there, hence its integral is positive when $\langle R\rangle_t>0$. Conversely, taking one constant $\eta\in(-1,1)$ in the preceding smooth construction gives every interior average.

Finally the endpoint limits are quantitative. Use density $R_1w_{\kappa,\widehat{\mathbf v}}$ for body 1 and $R_2w_{\kappa,-\widehat{\mathbf v}}$ for body 2. Their response is $A-L(\kappa)B$, and
$$
0<1-L(\kappa)
 =\frac1\kappa-\frac{2}{e^{2\kappa}-1}
 <\frac1\kappa.
$$
Thus their lower-endpoint error is less than $B/\kappa$ instantaneously and less than $\langle B\rangle_t/\kappa$ after averaging. Reversing directions gives the upper-endpoint limits. This proves the smooth attainment/limit distinction without replacing a smooth density by a pencil beam. ∎

<a id="theorem-n128-null-sheet-port-source-with-asymmetric-export-and-passive-axis"></a>**Theorem N.12.8 (Null-Sheet Port Source with Asymmetric Export and Passive Axis).** Use signature $(-,+,+,+)$, $x^0=ct$ and proper time $\tau$. The declared source consists of:

1. a timelike point-node worldline $z(\tau)$, $u=dz/d\tau$, $u\cdot u=-c^2$, with positive base mass $m_b$ and proper internal flux coordinate $\Phi$, constants $C,L>0$ and action
$$
S_{\rm node}=\int\Bigl[-m_bc^2+\frac C2\dot\Phi^2-\frac{\Phi^2}{2L}\Bigr]d\tau ,
$$
the lumped capacitor/inductor law being the same type of ideal local constitutive premise as in Theorem N.UCTb;
2. two positive-energy massless scalar channels $\sigma=\pm$ with impedances $Z_\sigma>0$, parameter surfaces $\Sigma_\sigma$ with common boundary $z$, immersions $X_\sigma(\tau,\lambda)$, $\lambda\ge0$, and actions
$$
S_\sigma=-\frac1{2Z_\sigma}\int_{\Sigma_\sigma}\sqrt{-h}\,h^{ab}\,\partial_a\varphi_\sigma\,\partial_b\varphi_\sigma\,d\tau\,d\lambda,\qquad
h_{ab}=g_{\mu\nu}(X_\sigma)\,\partial_aX_\sigma^\mu\,\partial_bX_\sigma^\nu,\qquad
\varphi_\sigma(\tau,0)=\Phi(\tau);
$$
the embedding is an ideal beam carrier, the channels are distinguishable scalar polarizations, and intersections create no interaction, as for the kinetic noninteracting ray law of Theorem N.UCTc;
3. outgoing generators that are affinely parametrized null geodesics with $X_\sigma(\tau,0)=z(\tau)$ and $\partial_\lambda X_\sigma(\tau,0)=l_\sigma(\tau)=u(\tau)/c+\sigma e(\tau)$, $e\cdot e=1$, $e\cdot u=0$; there is no incoming characteristic, no initial channel field energy, and no driven proper-acceleration control or orbital-acceleration substitution;
4. a finite retained proper-time interval on which the generators exist, with all channel stress in its causal output and the residual node energy at the final cut retained; self-intersections are avoided by shortening the interval or counted as separate noninteracting rays, and no reflecting endpoint lies in the retained causal domain;
5. a passive point rotor: a fixed rotational inertia $I>0$ and a material orthonormal triad $E_A$, $A=1,2,3$, with $E_A\cdot u=0$, $E_A\cdot E_B=\delta_{AB}$, action $S_{\rm rot}=(I/4)\int\sum_{AB}\omega_{AB}^2\,d\tau$, $\omega_{AB}=E_A\cdot\nabla_\tau E_B$, the orthonormality constraints retained, prepared with $\omega_{AB}=0$; the emitter axis is $e=E_1$, and the rotor's hardware and rest energy belong to $m_b$.

These laws fix the source before any power is calculated. Then:

(a) **Admittance.** With $\tau$ the retarded boundary label, $\varphi_\sigma(\tau,\lambda)=\Phi(\tau)$ solves the massless field equation exactly, and the boundary variation of channel $\sigma$ contributes $-\dot\Phi/Z_\sigma$ to the node equation:
$$
C\ddot\Phi+\Bigl(\frac1{Z_+}+\frac1{Z_-}\Bigr)\dot\Phi+\frac\Phi L=0.
\tag{N.12.8.1}
$$
(b) **Stress and export.** Channel $\sigma$ carries outgoing proper power $P_\sigma=\dot\Phi^2/Z_\sigma$ and source four-momentum rate $k_\sigma^\mu=(P_\sigma/c)\,l_\sigma^\mu$. Its ambient stress is the pushforward of the same sheet stress,
$$
T_\sigma^{\mu\nu}(x)=\int P_\sigma(\tau)\,l_\sigma^\mu(\tau,\lambda)\,l_\sigma^\nu(\tau,\lambda)\,\delta_g\bigl(x,X_\sigma(\tau,\lambda)\bigr)\,d\lambda\,d\tau,
\qquad
\nabla_\nu T_\sigma^{\mu\nu}=c\int k_\sigma^\mu(\tau)\,\delta_g\bigl(x,z(\tau)\bigr)\,d\tau ,
\tag{N.12.8.2}
$$
apart from explicitly retained later terminal boundaries, and there is no distributed support force or support work on the outgoing branch.

(c) **Balance.** With $E=C\dot\Phi^2/2+\Phi^2/(2L)$, $m=m_b+E/c^2$, $R=P_++P_-$ and $k=k_++k_-$, one has $\dot E=-R$ and $\nabla_\tau(mu)=-k$; hence $\dot m=-R/c^2$ and $m\ge m_b>0$. Here $\int R\,d\tau$ is proper emitted energy; the energy seen by an observer follows from the transported null momenta, including their Doppler factors.

(d) **Ringdown and asymmetric export.** Let $Z_\pm=Z/(1\pm\delta)$ with $0\le\delta<1$, so that $1/Z_++1/Z_-=2/Z$, and put $L=Z^2C$, $\gamma=1/(ZC)$, $s=\gamma\tau$. With initial current $I_0$, zero voltage and $E_0=LI_0^2/2$,
$$
\Phi=LI_0(1+s)e^{-s},\quad
V=\dot\Phi=-LI_0\gamma\,s\,e^{-s},\quad
E=E_0e^{-2s}(1+2s+2s^2),\quad
R=4\gamma E_0\,s^2e^{-2s},
$$
$$
P_\pm=(1\pm\delta)\frac{V^2}Z,\qquad
k=\frac R{c^2}u+\frac{\delta R}c\,e,\qquad
\boldsymbol\Pi=\frac{\delta R}c\,e,\qquad
|\boldsymbol\Pi|<\frac Rc ,
\tag{N.12.8.3}
$$
with $\dot m=-R/c^2$ and $m\,a=-\delta R\,e/c$, $a=\nabla_\tau u$. The power is nonzero for $I_0\neq0$ and $\tau>0$, $R_{\max}=4\gamma E_0e^{-2}$ and $\int_0^\infty R\,d\tau=E_0$. For $\delta=0$, $\boldsymbol\Pi=0$ and the node worldline is a geodesic. The power coefficient $4\gamma E_0$ is fixed by the initial field stock and the impedance and capacitance.

(e) **Passive axis.** The rotor stays at zero proper angular velocity, carries no changing rotational energy, and
$$
\nabla_\tau E_A=\frac{a\cdot E_A}{c^2}\,u ,
\tag{N.12.8.4}
$$
the Fermi–Walker law of a nonrotating spatial director.

*Proof.* (a) Put $J=\partial_\tau X$ and $l=\partial_\lambda X$. Nullness gives $h_{\lambda\lambda}=0$. Commuting coordinate fields and the affine geodesic equation give $\partial_\lambda g(J,l)=g(\nabla_\lambda J,l)=g(\nabla_\tau l,l)=\frac12\partial_\tau g(l,l)=0$, and at the boundary $g(J,l)=g(u,u/c+\sigma e)=-c$. Throughout each sheet, therefore, $h=\begin{pmatrix}A&-c\\-c&0\end{pmatrix}$, $\sqrt{-\det h}=c$, $h^{\tau\tau}=0$ and $h^{\lambda\tau}=-1/c$. A field depending only on $\tau$ satisfies $\partial_a[\sqrt{-h}\,h^{ab}\partial_b\varphi]=\partial_\lambda[-\dot\Phi]=0$. At the node $A=-c^2$, the outward unit normal of the field domain is $n^a=(1/c,-1)$, so $n^a\partial_a\varphi=\dot\Phi/c$, and the boundary measure is $c\,d\tau$. Integration by parts gives $\delta S_\sigma|_{\rm boundary}=-\int(\dot\Phi/Z_\sigma)\,\delta\Phi\,d\tau$, while $\delta S_{\rm node}=-\int(C\ddot\Phi+\Phi/L)\,\delta\Phi\,d\tau$; together they give (N.12.8.1). No acceleration or curvature term is dropped: the calculation uses the induced two-dimensional metric of the exact null-geodesic branch and never assumes $a=0$.

(b) The sheet stress is $t^{ab}=Z_\sigma^{-1}[\partial^a\varphi\,\partial^b\varphi-\frac12h^{ab}(\partial\varphi)^2]$. Since $h^{\tau\tau}=0$ the gradient is null, and the only nonzero contravariant component in retarded coordinates is $t^{\lambda\lambda}=\dot\Phi^2/(Z_\sigma c^2)$. The normal embedding force density $t^{ab}K_{ab}{}^\mu$ vanishes because only the $\lambda\lambda$ component is occupied and $\nabla_\lambda l=0$ gives $K_{\lambda\lambda}=0$. The ambient stress (N.12.8.2) follows by metric variation, with $\delta S=(1/2c)\int T^{\mu\nu}\delta g_{\mu\nu}\,dV_g$, or from the null-ray formula (N.UCTc.7) with $dp^\mu=(P_\sigma/c)\,l^\mu d\tau$; covariant integration by parts along each affine generator gives its emission boundary term. The sheet field and its ray pushforward are two descriptions of one energy entry and are counted once.

(c) Multiplying the node equation by $\dot\Phi$ gives $\dot E=-R$. Varying an arbitrary worldline lapse $N$ in $N[C(\Phi'/N)^2/2-\Phi^2/(2L)-m_bc^2]$ gives $-(m_bc^2+E)$, so the internal energy contributes $E/c^2$ to the invariant mass; the boundary traction supplies $-k$. Contracting $\nabla_\tau(mu)=-k$ with $u$ gives $\dot m=-R/c^2$, and the orthogonal projection gives the recoil equation; the divergence of the node stress cancels the ray source.

(d) With $L=Z^2C$ the node equation has the repeated characteristic root $-\gamma$; the initial conditions give $\Phi$ and $V$, and substitution into $E$ with $C\gamma^2=1/L$ gives $E$ and $R=2V^2/Z$. Moreover $\int_0^\infty4\gamma E_0s^2e^{-2s}d\tau=E_0$, and $s^2e^{-2s}$ is maximal at $s=1$. Channel $\sigma$ has power $V^2/Z_\sigma=(1\pm\delta)V^2/Z$ along $l_\sigma=u/c\pm e$; summing $k_\sigma=(P_\sigma/c)\,l_\sigma$ gives (N.12.8.3), and $|\boldsymbol\Pi|=\delta R/c<R/c$. The recoil equation is the orthogonal part of $\nabla_\tau(mu)=-k$; for $\delta=0$ it is the geodesic equation.

(e) The outgoing scalar channels carry no intrinsic spin and attach at the source point, so their traction exerts no torque about the material center; there is no offset nozzle, lever arm, imposed rotation or external angular-momentum supply. The rotational Euler–Lagrange balance is angular-momentum conservation with zero torque and zero initial angular momentum, so $\omega_{AB}=0$ remains a solution with rotational energy $I\sum\omega_{AB}^2/4=0$; the constraint multipliers vanish because no boundary imposes an orientation torque. Expanding $\nabla_\tau E_A$ in the basis $\{u,E_B\}$, the spatial coefficients vanish since $\omega_{BA}=0$; writing $\nabla_\tau E_A=\kappa_Au$ and differentiating $E_A\cdot u=0$ gives $-\kappa_Ac^2=-E_A\cdot a$, which is (N.12.8.4), and orthonormality is preserved. A finite off-center antenna, a channel carrying polarization angular momentum, an imposed rotating material frame or an extended body's tidal torque is a different source branch. ∎

In the Newtonian model of Corollary N.12.5 the source enters through its registered clock maps $\tau_i(t)$, $\alpha_i=d\tau_i/dt>0$, with coordinate-time inputs
$$
R_i^t(t)=\alpha_i(t)R_i(\tau_i(t)),\qquad
\boldsymbol\Pi_i^t(t)=\frac{\delta R_i^t(t)}c\,\mathbf n_i,\qquad
\frac{dm_i}{dt}=-\frac{R_i^t}{c^2},\qquad
\ddot{\mathbf x}=-\frac{G(m_1+m_2)\mathbf x}{r^3}-\frac{\boldsymbol\Pi_1^t}{m_1}+\frac{\boldsymbol\Pi_2^t}{m_2},
$$
where $\mathbf n_i$ is the Euclidean image of the passive axis. The choices $\alpha_i=1$ and constant $\mathbf n_i$ belong to that Newtonian idealization; a post-Newtonian interpretation retains its own clock, frame, propagation and dynamical remainders, and the coordinate gravitational acceleration is not substituted for the proper acceleration of an Unruh detector. With $\delta=0$ the source supplies $\boldsymbol\Pi_i=0$ and only the Jeans channel of Corollaries N.12.5–N.12.6; an orbital-energy loss requires $\delta>0$ and an axis with a component against the orbital velocity, which Theorem N.12.9 supplies.

<a id="theorem-n129-eccentric-autonomous-source-and-finite-pn-timing"></a>**Theorem N.12.9 (Eccentric Autonomous Source and Finite PN Timing).** On the ideal constrained LC/cam/counterrotor source below, with the outgoing positive scalar ports of Theorem N.12.8, the finite 2.5PN coefficient hierarchy, the calibrated relative-state phase instrument, two affine timing nuisances, seven named bounded correction channels and the bounded correlated-noise law specified below, the construction derives a retained-order pointwise orbital bridge and an explicit nonvacuous timing-confidence functional on one eccentric unequal-mass binary. Its derived source coordinate is
$$
q_{\mathrm{act,ret}}^{\mathrm{orb}}=\pi\lambda\epsilon^6,\qquad0\le\lambda\le1,
\tag{N.12.9.1}
$$
and its nonlinear fitted report obeys, uniformly over the full nuisance domain, including arbitrary source-aligned correction directions with total calibration support $B_{\rm cal}\le1/10$,
$$
0.56\,\lambda\le r(\lambda,\nu)\le0.63\,\lambda .
\tag{N.12.9.2}
$$
The source uses internal fields and owned mechanical constraints; no coordinate orbital acceleration enters an Unruh-temperature law. Proper emitted power, observer-frame radiation energy, recoil work, mass loss, center-of-mass recoil and residual internal stock are distinct entries.

**A. Eccentric pointwise orbital bridge from an autonomous LC clockwork.**

*A.1 Kepler reference.* Use $GM=a_{\rm orb}=n_0=1$, $\epsilon=\sqrt{GM/a_{\rm orb}}/c$, $e=439/5000$, $h=\sqrt{1-e^2}$ and mass fractions $m_1=1338/2587$, $m_2=1249/2587$, $\eta=m_1m_2$: the mass ratio and eccentricity of PSR J0737–3039A/B used in Corollary N.12.1, in reference units, with the physical scale $a_{\rm orb}=8.79\times10^8$ m and total mass $2.587M_\odot$ fixing $\epsilon$. For real $\chi$ let $E(\chi)$ solve $E-e\sin E=\chi$ and define
$$
r_K(\chi)=1-e\cos E(\chi),\qquad
\Theta_K(\chi)=\arg\bigl(\cos E(\chi)-e,\ h\sin E(\chi)\bigr)\ \text{(unwrapped)},\qquad
F(\chi)=\int_0^\chi r_K(s)^{-1/2}ds .
$$
These functions are fixed before any output: $r_K\in[1-e,1+e]$, $F'=r_K^{-1/2}$, $\Theta_K'=h/r_K^2$, and none depends on the perturbed orbit or its measured velocity. The clockwork below is an initial program, not orbital feedback.

*A.2 Autonomous internal action.* At each node $i$ keep the scalar ports of Theorem N.12.8 with $Z=1$, $Z_+=2/3$, $Z_-=2$, $\delta=1/2$ and $C=L=1$, and add an ideal cam constraint
$$
\Phi_i(\chi_i)=\sqrt\lambda\,\epsilon^2\sqrt{\frac{m_i}{2h}}\,F(\chi_i),\qquad0\le\lambda\le1,
$$
on an internal mechanical coordinate $\chi_i$ with kinetic coefficient $J_i=m_i/100$, together with two point rotors of inertia $I_r=\epsilon^{10}$ and angles $\psi_i\pm\Theta_K(\chi_i)$. This constraint is a new source law, and its conjugate reaction acts on the finite-energy clock. With the two holonomic cam constraints and the flux constraint enforced in the autonomous action, the reduced proper-time internal Lagrangian is
$$
L_i=\frac{J_i}2\dot\chi^2+I_r\bigl[\dot\psi^2+\Theta_K'(\chi)^2\dot\chi^2\bigr]+\frac12\Phi_i'(\chi)^2\dot\chi^2-\frac12\Phi_i(\chi)^2 .
$$
It has no explicit time dependence, negative-energy reservoir or externally maintained voltage; the full node action is $\int[-m_{bi}c^2+L_i]\,d\tau$ joined to the same outgoing scalar-sheet actions. The cam/gear law is an ideal local constitutive premise of the same status as the point rotor of Theorem N.12.8. Prepare $\chi_i(0)=0$, $\dot\chi_i(0)=1$, $\dot\psi_i(0)=0$; the emitted positive axis belongs to the first rotor, rotated initially by $\pi/2$ from the radius, and the second rotor is the compensating carrier, with opposed initial tangent axes on the two bodies. The source-field torque about the point attachment vanishes (Theorem N.12.8(e)), so $\psi$ is cyclic, its momentum $2I_r\dot\psi$ stays zero and the rotor angular momenta cancel; their rotational energies and the cam torque work are contained in $L_i$. With
$$
A_i=J_i+2I_r\Theta_K'^2+\Phi_i'^2,\qquad U_i=\Phi_i^2/2,
$$
the clock equation, including the LC and outgoing-field reaction, is
$$
A_i\ddot\chi+\tfrac12A_i'\dot\chi^2+U_i'=-2\Phi_i'(\chi)^2\dot\chi ,
$$
and the internal energy and emission law are
$$
H_i=\tfrac12A_i\dot\chi^2+U_i\ge0,\qquad
R_i=2\Phi_i'(\chi)^2\dot\chi^2\ge0,\qquad
\dot H_i=-R_i,\qquad
k_i=\frac{R_i}{c^2}u_i+\frac{\delta R_i}c\,e_i,\qquad
\boldsymbol\Pi_i=\frac{\delta R_i}c\,e_i .
$$
These follow from the displayed action and the port admittance (N.12.8.1). Residual $H_i$ and all scalar radiation are entered once; $R_i$ is proper emitted power, the observer-frame energy follows from the transported null momenta with their Doppler terms, and the leading orbital work computed below comes from the recoil momentum, with the rest-mass and kinetic mass-loss entries retained at their orders. Set $m_{bi}=m_i-H_i(0)/c^2$, so each initial total gravitational mass is $m_i$; the initial stock is
$$
H_i(0)=\frac{m_i}{200}+\frac{I_rh^2}{(1-e)^4}+\frac{\lambda\epsilon^4m_i}{4h(1-e)},
$$
finite with $m_{bi}>0$ for $\epsilon\le0.01$. The member $\lambda=0$ has the same clock energy, zero emitting-field amplitude and no port loss.

*A.3 Existence and quantitative control.* Since $A_i\ge J_i>0$ and $H_i$ decreases, the clock speed is bounded on each energy sublevel, and the reduced source equation has a unique solution on the finite observation window and beyond. If the preloaded channels are initially constant, the nonzero initial voltage creates only a bounded first-derivative jump at the outgoing initial wavefront, with continuous field and flux coordinate and locally integrable energy; alternatively a finite earlier preparation segment with its output stock is included. For $|\chi|\le14$ and $e<0.1$ one has $r_K\ge0.9$, $|F|<15$, $|F'|<1.06$, $|F''|<0.066$, $|\Theta_K'|<1.24$ and $|\Theta_K''|<0.31$. With $|\dot\chi|\le2$ the clock equation gives $|\ddot\chi|\le4000\,\epsilon^4$ for $\epsilon\le0.01$, and integration on $0\le t\le4\pi<13$ gives
$$
|\dot\chi-1|\le52000\,\epsilon^4,\qquad|\chi-t|\le338000\,\epsilon^4,
$$
strictly inside the bootstrap margins. The leading source waveform is therefore
$$
R_i(t)=\frac{\lambda\epsilon^4m_i}{h\,r_K(t)}+O(\lambda\epsilon^8),\qquad
e_1(t)=e_t(\Theta_K(t))+O(\epsilon^4),\qquad
e_2(t)=-e_t(\Theta_K(t))+O(\epsilon^4),
$$
with the power remainder at most $250000\,\lambda\epsilon^8$ in the Newtonian clock convention. Proper-clock lapse and local-frame PN corrections change these at relative order $\epsilon^2$ and reach the recoil at $\epsilon^7$; source-specific gravitational mass changes first enter the orbit at $\epsilon^6$, ray self-metric terms at $\epsilon^9$, and the counterrotating carrier has zero net spin and energy of order $\epsilon^{10}$.

*A.4 Pointwise bridge at orbital order $\epsilon^5$.* The relative recoil is
$$
a_{\rm source}(t)=-\frac{\lambda\epsilon^5\,e_t(t)}{h\,r_K(t)},
$$
purely transverse, so the radial/transverse split is fixed. Since the leading tangential velocity is $h/r_K$, $-v\cdot a_{\rm source}=\lambda\epsilon^5/r_K^2$ and $P_{\rm source}=\eta\lambda\epsilon^5/r_K^2$. The unequal masses produce a center-of-mass recoil with $\ddot B=\delta\lambda\epsilon^5(m_2-m_1)\,e_t/(hr_K)$ and $B(0)=\dot B(0)=0$, whose kinetic energy starts at $\epsilon^{10}$ and does not alter the relative orbital-energy balance at $\epsilon^5$. The orbital-acceleration sum of Definition N.12a on the same leading binary is $(c/2\pi)[m_1|a_1|+m_2|a_2|]=\eta/(\pi\epsilon r_K^2)$, so the derived constant coefficient is (N.12.9.1) and
$$
P_{\rm source}=q_{\mathrm{act,ret}}^{\mathrm{orb}}\,\frac c{2\pi}\bigl(m_1|a_1|+m_2|a_2|\bigr)
$$
holds at every point of the eccentric orbit in the retained source-power equation, with no averaged scalar and no signed residual at that order. Ordinary GR radiation reaction is a separate additive term of the same model. The identity belongs to the finite PN hierarchy: the clockwork is programmed on the registered leading Kepler orbit, and its backreaction and the changed binary motion enter at the higher orders displayed above.

**B. Finite-PN timing certificate on the same binary.**

*B.1 Model.* With the data of A.1, $\epsilon=0.00208470907678\ldots$ and $d=\epsilon^5=3.93756092475\ldots\times10^{-14}<10^{-12}$. The leading orbit is $R(t)=(\cos E-e,\ h\sin E)$, $E-e\sin E=t$, $r=1-e\cos E$, with period $T=2\pi$; write $V=R'$, $r_p=1-e$ and $e_t=\mathsf JR/r$ with $\mathsf J$ the rotation by $\pi/2$. The normalized source force is $f_s(t)=-e_t(t)/(h\,r(t))$, so $V\cdot f_s=-1/r^2$. Use the complete order-reduced harmonic-coordinate 2.5PN point-particle coefficient hierarchy with Hadamard regularization and no incoming radiation (Blanchet, Faye and Ponsot 1998, eqs. (8.4)–(8.6)), with all initial coefficient perturbations zero. With $F_0,F_2,F_4$ the complete two-body first-order state vector fields before forming the relative coordinate and $Z_0$ the barycentric leading Kepler state, define
$$
Z_2'=DF_0(Z_0)Z_2+F_2(Z_0),\qquad
Z_4'=DF_0(Z_0)Z_4+\tfrac12D^2F_0(Z_0)[Z_2,Z_2]+DF_2(Z_0)Z_2+F_4(Z_0),\qquad
Z_2(0)=Z_4(0)=0,
$$
and let $X_2,X_4$ be the differences of their position components; the noncollision leading orbit gives unique solutions on the finite interval. The 2.5PN coefficients $U_g,U_s$ satisfy
$$
U_j''=\mathsf A(t)U_j+f_j(t),\qquad
\mathsf A=-\frac{\mathbb 1}{r^3}+\frac{3RR^{\mathsf T}}{r^5},\qquad
U_j(0)=U_j'(0)=0,
$$
$$
f_g=\frac{8\eta}{5r^3}\Bigl[\Bigl(3|V|^2+\frac{17}{3r}\Bigr)\dot r\,\frac Rr-\Bigl(|V|^2+\frac3r\Bigr)V\Bigr].
$$
Conservative-PN/source cross terms start at $\epsilon^7$. The center-of-mass recoil of A.4 stays in the source ledger; the relative readout below is translation invariant. The reconstructed relative position is
$$
X_\lambda=R+\epsilon^2X_2+\epsilon^4X_4+d\,(U_g+\lambda U_s),
$$
an exact finite effective model with a declared reconstruction.

*B.2 Kepler monodromy.* Write $z=(R,V)$, $\dot z=F_K(z)$ and $E_K=|V|^2/2-1/r$. On the base orbit $E_K=-1/2$, $T=2\pi$ and $dT/dE_K=3T$. Differentiating $\Phi_{T(z)}(z)=z$ gives the one-period variational map
$$
M=\mathbb 1+N,\qquad Nw=-3T\,(dE_K\cdot w)\,\dot z(0),\qquad N^2=0 .
$$
For a periodic forcing $f_j$, with $W_j=(U_j,U_j')$ and $b_j=W_j(T)$, variation of constants over successive periods gives $W_j(kT)=k\,b_j+\tfrac12k(k-1)\,Nb_j$, and $dE_K\cdot b_j=\int_0^TV\cdot f_j\,dt$. For the source this is $-T/h$. For the GR force it is $-TA_g$ with
$$
A_g=\frac{32}5\,\eta\,f(e),\qquad f(e)=\frac{1+\frac{73}{24}e^2+\frac{37}{96}e^4}{(1-e^2)^{7/2}} :
$$
the power of $f_g$ is $(8\eta/5)\bigl[2r^{-3}-\frac{32}3r^{-4}+(\frac{49}3-3e^2)r^{-5}-\frac{35}3h^2r^{-6}\bigr]$, and with $dt=r\,dE$ and $I_n=(2\pi)^{-1}\int_0^{2\pi}(1-e\cos E)^{-n}dE$, namely $I_2=h^{-3}$, $I_3=(2+e^2)/(2h^5)$, $I_4=(2+3e^2)/(2h^7)$, $I_5=(8+24e^2+3e^4)/(8h^9)$, the average reduces exactly to $-A_g$.

*B.3 Calibrated phase readout and period report.* The recorded state readout first applies the same deterministic conservative coordinate calibration to every source-on and null member,
$$
Z_\lambda=X_\lambda-\epsilon^2X_2-\epsilon^4X_4=R+d\,(U_g+\lambda U_s),
$$
a known coordinate correction of the declared formal instrument. The unwrapped geometric angle $\theta=\arg Z$ is converted into the fixed-$e$ mean-anomaly coordinate $H_e(\theta)=E_\theta-e\sin E_\theta$, $\cos E_\theta=(e+\cos\theta)/(1+e\cos\theta)$, $\sin E_\theta=h\sin\theta/(1+e\cos\theta)$, with continuous winding; then $H_e(\theta_K(t))=t$, $H_e'(0)=r_p^2/h$, and the measured phase is $\Phi_\lambda=H_e(\arg Z_\lambda)$. The registered input is three digitized phase values at $t_k=kT$, $k=0,1,2$, with absolute digitization error at most $\tau_d=d\cdot10^{-12}$. For both forces the radial coefficient is odd and the transverse coefficient even under $t\mapsto T-t$; Gauss' equations give $\delta\omega(T)=0$ and $\int_0^Trf_R\,dt=0$, the power is even, so $\int_0^T\delta E_K\,dt=\frac T2\delta E_K(T)$ and $\delta M(T)=\frac32A_jT^2$; at periastron the fixed-$e$ calibration has $\partial_e\theta=0$. Hence the affine term vanishes and
$$
p_j(kT)=\tfrac32A_j(kT)^2,\qquad A_s=\frac1h,\qquad A_g=\frac{32}5\eta f(e).
$$
With the angular-momentum-loss coefficients $H_s=1/h$, $H_g=\frac{32}5\eta(1+\frac78e^2)/h^4$ (from $R\times f_g=-\frac{8\eta}5h\,r^{-3}(5/r-1)$) and $D_j=-2r_pA_j-(hH_j-h^2A_j)/e$, the sampled displacements are exactly
$$
U_{j,x}(t_k)=D_j\,t_k,\qquad U_{j,y}(t_k)=\frac{3hA_j}{2r_p}\,t_k^2,
$$
since $\delta a=-2A_jt_k$, $\delta h=-H_jt_k$, $\delta e=(hH_j-h^2A_j)t_k/e$, the radial variation at periastron is $r_p\delta a-\delta e$, and the nilpotent monodromy supplies the quadratic $y$ term. The fitted quadratic coefficients are therefore
$$
c_s=\frac3{2h}=1.505815273441\ldots,\qquad c_g=\frac{48}5\,\eta f(e)=2.520782537407\ldots .
$$
Retain two affine timing nuisances $\alpha\in[-1,1]^2$ and seven named timing-correction channels (kinematic, Galactic, propagation, tidal dissipation, mass transfer, magnetospheric, other system-specific), each with an arbitrary three-epoch vector $\zeta_j$, $|\zeta_{jk}|\le\beta_j$, $\beta_j\ge0$, $B_{\rm cal}=\sum_j\beta_j\le1/10$. These supports are declared calibration premises; every vector direction is admitted, including the source $t^2$ direction, with no orthogonality, frequency separation or nuisance prior. The timing-correction law is additive in phase at the retained order,
$$
F_k(\lambda,\nu)=\Phi_\lambda(t_k)+d\Bigl[\alpha_0+\alpha_1t_k+\sum_{j=1}^7\zeta_{jk}\Bigr],\qquad\nu=(\alpha,\zeta_1,\ldots,\zeta_7).
$$
Fit $(1,t,t^2)$ exactly; the quadratic and frequency rows are $L_2=(1,-2,1)/(2T^2)$ and $L_1=(-3,4,-1)/(2T)$. $L_2$ annihilates both affine nuisance columns, and the projected contribution of the seven correction vectors is bounded by $d\rho$, $\rho=(2/T^2)B_{\rm cal}$. With $b_1=L_1F$ and $b_2=L_2F$ the report is
$$
P_b=\frac{2\pi}{b_1},\qquad B=\dot P_b=-\frac{4\pi b_2}{b_1^2},\qquad r(\lambda,\nu)=\frac{B(0,\nu)-B(\lambda,\nu)}{|B(0,\nu)|},
$$
the derivative at reference time zero of the fitted phase-period function $2\pi/(b_1+2b_2t)$.

*B.4 Uniform nonlinear bounds.* On $0\le t\le2T<13$, for a planar perturbing acceleration with $|f|\le F_*$, Gauss' equations give $|\delta E_K|<\frac{10}9F_*t$, $|\delta a|<\frac{20}9F_*t$, $|\delta e|<\frac{20}9F_*t$, $|\delta\omega|<26F_*t$ and $|\delta M|<\frac53F_*t^2+29F_*t$, the last from $\dot{\delta M}=-3\delta E_K-2rf_R-h\,\dot{\delta\omega}$; with $|\partial_er|<1.1$, $|\partial_Mr|<0.1$, $|\partial_M\theta|<1.24$, $|\partial_e\theta|<2.2$ this gives $|U|<1500F_*$. Since $|f_s|<2$ and $|f_g|<4$, $|U_s|<3000$, $|U_g|<6000$ and $|U_g+\lambda U_s|<9000$. For $d\le10^{-12}$ the path $Z$ stays at distance at least $r_p-9000d>0$ from the origin, so the winding is unique and all sampled $Z$ have positive first coordinate. Using $H_e'\le1.24$, $|H_e''|<0.28$, $r_p>0.9$, $|\arg Z-dU_y/r_p|\le4d^2|U|^2$ and the source-derivative error $10d^2|U||U_s|$,
$$
\bigl|\Phi_\lambda(t_k)-t_k-d\,p_\lambda(t_k)\bigr|\le10^9d^2,\qquad
\bigl|\partial_\lambda\Phi_\lambda(t_k)-d\,p_s(t_k)\bigr|\le10^9d^2 .
$$
With $\|L_2\|_1=2/T^2<0.051$ and $\|L_1\|_1=4/T<0.637$, the nuisance domain $B_{\rm cal}\le1/10$ adds at most $0.0051d$ to the quadratic and $0.0637d$ to the fitted frequency, and
$$
1.50d<\partial_\lambda b_2<1.52d,\quad 2.50d<b_2<4.10d,\quad |\partial_\lambda b_1|<6000d,\quad 0.999<b_1<1.001,\quad 31d<|B(0,\nu)|<33d .
$$
Hence $4\pi(1.49)d<\partial_\lambda[-B(\lambda,\nu)]<4\pi(1.53)d$, and integration at the same $\nu$ proves (N.12.9.2). The finite-model response coefficient is $K_-=0.56/(\pi\epsilon^6)>0$ with $r(q,\nu)\ge K_-q$ uniformly on $q\in[0,\pi\epsilon^6]$ and the full nuisance support. At zero projected correction $w=L_2\sum_j\zeta_j=0$ the leading coefficient is $c_s/c_g=5/[32\eta hf(e)]$, which equals the comparator $K_{\rm quad}=2.3164007649\ldots\times10^{15}$ of (N.12d) after multiplication by $1/(\pi\epsilon^6)$; at general $w$ the leading response is $c_s/(c_g+w)$, and $K_-$ is strictly smaller than $K_{\rm quad}$.

*B.5 Noise, confidence and nuisance refit.* Let $\sigma=d\cdot10^{-6}$, $\mathsf C=\mathbb 1+\frac1{10}\mathbf 1\mathbf 1^{\mathsf T}$ on $\mathbb R^3$, and $U$ with three independent Uniform$[-1,1]$ coordinates. The undigitized observation is $Y_*=F(\lambda,\nu)+\sigma\mathsf CU$, and the record $Y$ is a rational digitization with $\|Y-Y_*\|_\infty\le\tau_d$. Its covariance is $(\sigma^2/3)[\mathbb 1+\frac{23}{100}\mathbf 1\mathbf 1^{\mathsf T}]$ (variances $123\sigma^2/300$, covariances $23\sigma^2/300$). The exact undigitized joint confidence region is $\{(\lambda,\nu):\|\mathsf C^{-1}(Y_*-F(\lambda,\nu))\|_\infty\le\sigma\}$, and for digitized $Y$ one uses $\sigma_{\rm eff}=\sigma+10\tau_d$, since $\mathsf C^{-1}=\mathbb 1-\frac1{13}\mathbf 1\mathbf 1^{\mathsf T}$ has row absolute sum $14/13$. Its coverage is one. Since $L_2\mathsf C=L_2$, the projected noise is at most $2\sigma/T^2$; with $b_{20}=L_2\Phi_0$ the reported upper limits are
$$
\lambda_+=\min\Bigl(1,\max\Bigl(0,\frac{L_2Y-b_{20}+d\rho+2\sigma_{\rm eff}/T^2}{1.50d}\Bigr)\Bigr),\qquad r_+=0.63\,\lambda_+,
$$
and every admissible record satisfies $\lambda\le\lambda_+$ and $r(\lambda,\nu)\le r_+$, without Gaussian or asymptotic approximation. Two source values compatible with the same record and any permitted nuisances satisfy $|\lambda-\lambda'|\le\Delta_{\rm cal}=[2\rho+2(2/T^2)\sigma_{\rm eff}/d]/1.50$; for every source-off record $\lambda_+\le\min(1,\Delta_{\rm cal})$, which is nonvacuous whenever $2(2/T^2)[B_{\rm cal}+\sigma_{\rm eff}/d]<1.50$, and the resulting $q$ limit lies below $\pi\epsilon^6$ when $\Delta_{\rm cal}<8/9$. Both hold throughout $B_{\rm cal}\le1/10$; for $\beta_j=1/100$, $B_{\rm cal}=7/100$ and $\Delta_{\rm cal}<0.004729$. Exact point identification is not available, because the admitted nuisance vectors contain a source-aligned direction; source values separated by more than $\Delta_{\rm cal}$ are distinguished by every admissible record. The evaluation uses outward rational interval arithmetic with the closed sampled forms of B.3: square roots by 80-digit integer square-root enclosures, $\pi$ by Machin's formula with alternating-series enclosures, and, for a sample $Z=(x,y)$ with $x>0$, $z=\sqrt{(1-e)/(1+e)}\,y/(\sqrt{x^2+y^2}+x)$ and the phase shift $2\arctan z-2ez/(1+z^2)$, with $|z|<10^{-7}$; the upper endpoint of the resulting enclosure is reported. ∎

## N.9 The UCT as a Strategic Choice Between Intensive and Extensive Knowledge Acquisition

The UCT permits a conditional finite-budget optimization between knowledge-acquisition strategies only after a trajectory class, prediction task, response model, active-refresh mechanism, and non-double-counted work ledger have been registered.

1.  **Rindler Response and Sampling:** An ideal detector on an eternally uniformly accelerated worldline has a Rindler horizon and a KMS response characterized by $T_U=\hbar a/(2\pi c k_B)$. Only on the declared response and refresh branch may the modeled increment enter the predictor's cost ledger. Broad sampling may also include inertial coasting, for which proper acceleration and the Unruh increment vanish.

2.  **The Prediction Coherence Boundary and the Cost of Modeling:** For a preregistered target schedule $\alpha_{\mathrm{tgt}}(\tau)<\alpha_{\mathrm{SPAP}}$ on task classes carrying $\mathfrak C_{B.2}$, Theorem 14 gives
    $$
    C_{\mathrm{uni}}(\delta_{\mathrm{SPAP}})
    =
    \Omega\!\left(
    \frac{\log(1/\delta_{\mathrm{SPAP}})}
    {\delta_{\mathrm{SPAP}}^2}
    \right),
    \qquad
    \delta_{\mathrm{SPAP}}
    :=
    \alpha_{\mathrm{SPAP}}-\alpha_{\mathrm{tgt}}.
    $$
    Transfer to $C_P$ or $C_{\mathrm{SPAP}}$ requires the same-family domination bridge of Lemma N.2. An observed $PP$ may instantiate the target only with the registered confidence event.

For a specified proper-time interval, suppose the baseline task power, the saturation-branch acceleration-refresh increment, endpoint kinetic work, and all other entries are disjoint and transformed to the laboratory ledger according to Theorem N.UCT. If the available laboratory work is $B_{\mathrm{lab}}$, a necessary feasibility condition is
$$
m_0c^2(\gamma_f-1)
+
\int_0^{\tau_f}\gamma(\tau)
\left[
P_{\mathrm{task}}^{\mathrm{com}}(PP(\tau))
+
P_{\mathrm{pred}}^{\mathrm{sat,com}}(a(\tau),C(\tau))
\right]d\tau
+
W_{\mathrm{other}}^{\mathrm{lab}}
\le B_{\mathrm{lab}},
$$
where
$$
P_{\mathrm{pred}}^{\mathrm{sat,com}}(a,C)
=
\frac{\lambda_{PM}aC}{\tau_{\mathrm{cycle}}}.
$$
This is a conditional work-budget constraint, not the mixed-frame identity $P_{\mathrm{total}}=P_{\mathrm{kin}}(a)+P_{\mathrm{task}}+P_{\mathrm{noise}}$.

An intensive strategy may allocate more of this budget to task fidelity and less to endpoint or refresh work. An extensive strategy may allocate more to reaching additional sampling regions. Neither conclusion is forced: inertial coasting can provide spatial coverage without a continuous Unruh increment, and task performance need not fall unless the accepted finite budget and cost functions make the alternatives compete. PCE selects among such strategies only after the complete objective, trajectory constraints, and branch data have been supplied.

## <a id="n10-conditional-unruh-landauer-acceleration-refresh-formula"></a>N.10 Conditional Unruh–Landauer Acceleration–Refresh Formula

The following equation isolates the Landauer-saturating acceleration-dependent refresh increment on the declared detector-response branch.

### <a id="n101-saturating-acceleration-refresh-formula"></a>N.10.1 Saturating Acceleration–Refresh Formula

<a id="theorem-n3-predictive-energy-cost-under-acceleration"></a>**Theorem N.3 (Predictive Energy Cost Under Acceleration).** On the detector-response and additive-temperature branch of Section N.3.2, suppose a refresh is performed in the instantaneous comoving frame by sequential registered classical resets satisfying every hypothesis of Definition 28, with additive heat accounting and total conditional erasure entropy $\sum_jH_{q_j}(P_j\mid R_j)=C\ln2$. Assume its declared Landauer-saturating implementation limit exists for the modeled Unruh-temperature increment, with the convergence conditions of Definition 28. At $a=0$, interpret the expression only through the corresponding convergent limit. Then

$$
\boxed{E_{\text{pred}}^{\text{sat}}(a, C) = \frac{\hbar \ln 2}{2\pi c} \cdot a \cdot C}
\tag{N.14}
$$

This is a branch-conditional saturation value. A non-saturating implementation may dissipate more, and the theorem does not derive the Unruh detector response from microscopic MPU dynamics.

*Proof.* For the registered resets at a common temperature $T>0$, Theorem 31 and heat additivity give $\langle Q_{\mathrm{bath}}\rangle\ge k_BT\sum_jH_{q_j}(P_j\mid R_j)=k_BT C\ln2$. The declared saturation limit, including the resource-closure and convergence conditions of Definition 28, therefore has

$$
E_{\min}(T,C)=k_B T (\ln 2)\,C.
$$

For an MPU undergoing proper acceleration $a$, the effective Unruh temperature contribution is (Equation N.4)

$$
T_U(a)=\frac{\hbar a}{2\pi c k_B}.
$$

Isolating the acceleration-dependent (Unruh-induced) increment by setting $T=T_U(a)$ gives

$$
E_{\text{pred}}^{\mathrm{sat}}(a,C)=k_B T_U(a) (\ln 2)\,C
=\frac{\hbar \ln 2}{2\pi c}\,a\,C,
$$

which is the stated formula. ∎

<a id="remark-n101-conditional-dimensional-analogy-to-e-mc2"></a>**Remark N.10.1: Conditional Dimensional Analogy to $E=mc^2$.**
Equation (N.14) contains $c^{-1}$ because the accepted Unruh-temperature formula contains $c^{-1}$. On the detector-response and Landauer-saturating active-refresh branch, this yields a motion–refresh coefficient involving $\hbar$, $\ln2$, and $c$. The resemblance to a relativistic energy relation is dimensional and branch-conditional.

### N.10.2 The Prediction-Motion Coupling Coefficient

<a id="definition-n4-prediction-motion-coupling-coefficient"></a>**Definition N.4 (Prediction-Motion Coupling Coefficient).**
On the detector-response and Landauer-saturating active-refresh branch, define the acceleration–refresh coefficient

$$
\boxed{\lambda_{PM} \equiv \frac{\hbar \varepsilon_0}{2\pi c} = \frac{\hbar \ln 2}{2\pi c} \approx 3.88 \times 10^{-44} \text{ kg·m}}
\tag{N.15}
$$

This coefficient collects constants already consumed by that conditional bridge:

- **Quantum input** ($\hbar$): the imported quantum action scale;
- **Structural information input** ($\varepsilon_0=\ln2$): the exact binary structural coefficient, which is not by itself a physical dissipation energy;
- **Relativistic input** ($c$): the invariant-speed constant already present in the accepted Unruh formula.

On the stated saturation branch, Equation (N.14) can be written

$$
E_{\text{pred}}^{\text{sat}} = \lambda_{PM} \cdot a \cdot C.
\tag{N.16}
$$

<a id="remark-n102-dimensional-analysis"></a>**Remark N.10.2: Dimensional Analysis.**
The coefficient $\lambda_{PM}$ has dimensions
$$
[\lambda_{PM}]
=
\frac{[\text{Energy}\cdot\text{Time}]}{[\text{Length}/\text{Time}]}
=
[ML].
$$
Thus
$$
[E_{\text{pred}}^{\text{sat}}]
=
[ML]\,[LT^{-2}]
=
[ML^2T^{-2}],
$$
as required for the conditional saturation energy.

<a id="remark-n103-relation-to-fundamental-scales"></a>**Remark N.10.3: Relation to Fundamental Scales.**
Using $m_P=\sqrt{\hbar c/G}$, $L_P=\sqrt{\hbar G/c^3}$, and the identity $m_PL_P=\hbar/c$ gives

$$
\lambda_{PM}
=
\frac{\ln2}{2\pi}\frac{\hbar}{c}
=
\frac{\ln2}{2\pi}m_PL_P.
$$

This is an algebraic rewriting of the branch coefficient.

### <a id="n103-unruh-landauer-saturation-calibration"></a>N.10.3 Unruh–Landauer Saturation Calibration

<a id="definition-n5-unruh-landauer-saturation-coefficient"></a>**Definition N.5 (Unruh–Landauer Saturation Coefficient).**
Let $c_\gamma:=c$ denote the invariant speed already appearing in the Lorentz and Unruh formulas. On the Landauer-saturating branch of Theorem N.3 with $aC>0$, define
$$
E_{\mathrm{pred}}^{\mathrm{sat}}(a,C)
:=
\frac{\hbar\varepsilon_0}{2\pi c}\,aC
$$
and extract the denominator constant
$$
c_\varepsilon^{\mathrm{sat}}
:=
\frac{\hbar\varepsilon_0 aC}{2\pi E_{\mathrm{pred}}^{\mathrm{sat}}(a,C)}.
$$
Then
$$
\boxed{c_\gamma=c_\varepsilon^{\mathrm{sat}}=c.}
\tag{N.17}
$$

Equation (N.17) is a calibration identity on the Unruh–Landauer saturation branch. It follows because the standard Unruh temperature already contains the invariant speed $c$. For a nonsaturating implementation with actual acceleration-dependent dissipation $E_{\mathrm{pred}}\ge E_{\mathrm{pred}}^{\mathrm{sat}}$, the same inferred ratio obeys
$$
\frac{\hbar\varepsilon_0 aC}{2\pi E_{\mathrm{pred}}}\le c,
$$
with equality only at saturation.

**Interpretation:** $c_\gamma$ is the kinematic invariant speed. The symbol $c_\varepsilon^{\mathrm{sat}}$ is a convenient readout of the same already-present constant from one conditional cost formula.

<a id="proposition-n103a-no-margolus-levitingamma-product-bound-from-n17"></a>**Proposition N.10.3a (No Margolus-Levitin/Gamma Product Bound from N.17).** Equation (N.17) records a coefficient comparison $c_\gamma=c_\varepsilon^{\mathrm{sat}}$ on the Landauer-saturating Unruh branch; it is not an independent operational measurement of a second invariant speed. It does not identify the limiting operation $v \to c$ with saturation of the Margolus-Levitin orthogonalization bound, and it does not imply any universal lower bound of the form
$$
\frac{E_{\mathrm{ML}}}{m c^2}\,\frac{1}{\gamma} \ge \text{constant independent of }m.
$$
The frame-covariant quantum-speed-limit statement on the unitary internal branch remains Corollary 29.1: if a normalized state evolves under a time-independent self-adjoint Hamiltonian $\hat H\ge E_0I$ with finite positive mean excitation energy $E_{\mathrm{ML}} := \langle \hat H-E_0\rangle$, and a proper internal cycle of duration $\tau_0$ reaches an orthogonal state, then
$$
E_{\mathrm{ML}}\tau_0 \ge \frac{\pi\hbar}{2}.
$$
If the same internal cycle is described in an inertial lab frame in which the system has Lorentz factor $\gamma$, then $\tau_{\mathrm{lab}}=\gamma\tau_0$, hence
$$
E_{\mathrm{ML}}\frac{\tau_{\mathrm{lab}}}{\gamma} \ge \frac{\pi\hbar}{2}.
$$
Equivalently, using $\hbar=m_Pc^2t_P$,
$$
\frac{E_{\mathrm{ML}}}{m c^2} \ge \frac{\pi}{2}\frac{m_P}{m}\frac{t_P}{\tau_0}.
$$
The factor $m_P/m$ is unavoidable when the speed-limit energy is normalized by $m c^2$, and no additional factor $1/\gamma$ suppresses the proper-time bound. Empirical content resides in the conditional Unruh–Landauer law and the frame-consistent UCT work ledger, not in the coefficient identity by itself. In particular, neither Equation (N.17) nor the Margolus–Levitin bound implies $c=\delta/\tau_{\min}$.

*Proof.* Equation (N.17) follows by comparing the coefficient in the saturating Unruh–Landauer formula with the same $c$ already present in the imported Unruh temperature. It contains neither the spacing $\delta$ nor the cycle time $\tau_{\min}$. It contains no statement about the state-dependent Hamiltonian quantity $E_{\mathrm{ML}}$, no orthogonality condition, and no condition that the Lorentz limit $v\to c$ be reached. Corollary 29.1 supplies the only Margolus-Levitin input used inside PU, namely $E_{\mathrm{ML}}\tau_0\ge\pi\hbar/2$ in the system's proper internal time. Lorentz time dilation changes the coordinate duration of that internal cycle by $\tau_{\mathrm{lab}}=\gamma\tau_0$ and leaves the proper-time inequality unchanged. Rearranging the proper-time inequality and substituting $\hbar=m_Pc^2t_P$ gives the displayed PU-unit form. A bound with $(E_{\mathrm{ML}}/mc^2)/\gamma$ and a positive right-hand side independent of $m$ would be frame-dependent and would tend to zero under boosts of the same massive system, while the proper-time speed limit is invariant. Hence such a product bound is not derivable from Theorem N.3, Definition N.5, Equation (N.17), or Corollary 29.1. ∎

### N.10.4 Physical Consequences

<a id="corollary-n31-conditional-laboratory-work-functional-for-predictive-trajectories"></a>**Corollary N.3.1 (Conditional Laboratory Work Functional for Predictive Trajectories).**
Under the hypotheses of Theorem N.UCT and on the Landauer-saturating refresh branch of Theorem N.3, define the comoving incremental predictive power
$$
P_{\text{pred}}^{\mathrm{sat,com}}(\tau)
=
\frac{\lambda_{PM}a(\tau)C(\tau)}{\tau_{\mathrm{cycle}}(\tau)}.
\tag{N.18a}
$$
Then the corresponding simplified laboratory work bound is
$$
W_{\text{tot}}^{\mathrm{lab}}
\ge
m_0c^2(\gamma_f-1)
+
\int_0^{\tau_f}\gamma(\tau)P_{\text{pred}}^{\mathrm{sat,com}}(\tau)\,d\tau.
\tag{N.18}
$$
Here $\tau_{\mathrm{cycle}}$ is a proper cycle time, and $[P_{\text{pred}}^{\mathrm{sat,com}}]=[ML^2T^{-3}]$. Additional background, internal-noise, nonsaturating, anisotropic-export, or stored-energy contributions remain in the full N.5 ledger. Within a specified trajectory class and boundary conditions, minimizing the right-hand-side functional defines the conditional optimal-trajectory problem.

*Proof.* Theorem N.3 supplies the saturated comoving energy per refresh, and division by the proper cycle time gives (N.18a). The boost of an isotropic comoving energy increment contributes the factor $\gamma(\tau)$ proved in Section N.5. Adding the disjoint laboratory kinetic ledger gives (N.18). ∎

Within a specified trajectory class, and only when the registered UCT response and refresh branch is active, minimizing (N.18) can favor smoother proper-acceleration profiles over sharper ones. Whether the full PCE potential selects such a path depends on the remaining background, internal-noise, stored-energy, and boundary-condition entries in the complete ledger.

<a id="corollary-n32-conditional-comoving-predictive-complexity-reduction-under-acceleration"></a>**Corollary N.3.2 (Conditional Comoving Predictive-Complexity Reduction Under Acceleration).**
Assume the detector-response, additive-temperature, active-refresh, and Landauer-saturating branch of Theorem N.3. Use a continuous resource coordinate $C\in[0,C_0]$ with $C_0>0$, and require a registered identification of its per-refresh conditional erasure entropy with $C\ln2$ throughout this comparison family. A discrete resource model requires an additional interpolation or realizability certificate before this continuous optimization describes its implementations. Let a constant comoving non-kinetic power budget satisfy
$$
R(C_0)=P_{\mathrm{avail}}^{\mathrm{com}},
$$
where $R:[0,C_0]\to[0,P_{\mathrm{avail}}^{\mathrm{com}}]$ is continuously differentiable, $R(0)=0$, and $R'(C)>0$ on this interval. At constant proper acceleration $a\ge0$ and constant proper cycle time $\tau_{\mathrm{cycle}}>0$, define $C_a$ by
$$
R(C_a)+\frac{\lambda_{PM}aC_a}{\tau_{\mathrm{cycle}}}
=P_{\mathrm{avail}}^{\mathrm{com}}.
\tag{N.19}
$$
Then $C_a\le C_0$, and implicit differentiation gives
$$
\frac{dC_a}{da}
=
-\frac{\lambda_{PM}C_a/\tau_{\mathrm{cycle}}}
{R'(C_a)+\lambda_{PM}a/\tau_{\mathrm{cycle}}}
\le0.
\tag{N.19a}
$$
Consequently, for small $a$,
$$
C_a-C_0
=
-\frac{P_{\mathrm{pred}}^{\mathrm{sat,com}}(a,C_0)}{R'(C_0)}
+o(a),
\qquad
P_{\mathrm{pred}}^{\mathrm{sat,com}}(a,C_0)
=
\frac{\lambda_{PM}aC_0}{\tau_{\mathrm{cycle}}}.
\tag{N.19b}
$$

*Proof.* Strict monotonicity makes the left side of (N.19) strictly increasing in $C_a$ and no smaller than $R(C_a)$, proving existence/uniqueness on the admitted range and $C_a\le C_0$. Differentiating (N.19) proves (N.19a), and the first-order expansion at $a=0$ gives (N.19b). The $o(a)$ remainder follows from the stated continuous differentiability; an $O(a^2)$ remainder would require stronger regularity. The budget is entirely comoving and non-kinetic; laboratory endpoint kinetic work and the factor $\gamma$ enter separately through (N.18). Thus the contraction is conditional on proper acceleration and the retained response/refresh bridge, not on velocity alone. ∎

### N.10.5 Conceptual Summary

Relativistic motion and increasingly demanding prediction targets consume different resources. They can be compared in one work budget without treating them as the same physical limit.

**Technical ledger.**

The Unified Cost of Transgression places two distinct resource effects in one frame-consistent work ledger:

|Domain |Limit |Resource statement |Status |
|--------------|----------------------|-------------------------------------------------------------|---------------|
|**Kinematics**|$v \to c$ |$m_0c^2(\gamma-1)\to\infty$ |standard relativistic input |
|**Prediction target**|$\alpha_{\mathrm{tgt}}\uparrow\alpha_{\mathrm{SPAP}}$|$C_{\mathrm{uni}}(\delta)=\Omega\!\left(\log(1/\delta)/\delta^2\right)$ as $\delta\downarrow0$ under $\mathfrak C_{B.2}$ |transfers to $C_P$ only with the same-family bridge of Lemma N.2 |
|**Acceleration coupling**|$a\ne0$ |Unruh–Landauer incremental cost on the registered saturation/activation branch |conditional bridge |

Here $\delta=\alpha_{\mathrm{SPAP}}-\alpha_{\mathrm{tgt}}$. When the Unruh response and predictive-refresh bridge are active, acceleration adds a prediction-related term to the distinct kinetic and SPAP ledgers. Substitution of an observed $PP$ for the target requires the registered confidence event.

Equation (N.17) recovers the same $c$ from the saturated Unruh–Landauer formula because that formula imports $c$ through the standard Unruh temperature. It is a consistency calibration, not a derivation of Lorentz causality from SPAP. Theorem 46 supplies only the independent uniform operational speed upper bound. An attained normalized frontier $c=\delta/\tau_{\min}$ requires the separate uniform-weight one-link-attainment branch, and its Lorentzian invariant-speed interpretation requires Corollary 46a and the full Appendix O package.

The coefficient $\lambda_{PM}=\hbar\varepsilon_0/(2\pi c)$ is therefore a dimensional coefficient on a conditional bridge. Its small SI value alone does not establish an observable or microscopic MPU mechanism; an experiment also requires an activation fraction, refresh rate, detector response, background subtraction, and a non-double-counted energy ledger.

## N.11 Inertial Mass as Relational Information

Section N.3 supplied a conditional acceleration–refresh cost on its registered detector-response branch, while Section N.7 proposed a relational interpretation of motion. The mass construction below is a separate conditional ledger governed by its own $\mathfrak B_{\mathrm{mass}}$ hypotheses.

### N.11.1 The Relational Ontology of "Being"

Appendix N studies a relational state ledger for a declared system--environment split. The ledger quantifies correlations across that split; it does not by definition exhaust every observable that distinguishes the system from a vacuum state. Operational vacuum equivalence requires a separate equality-of-response certificate on the retained observable algebra.

<a id="definition-n6-relational-information-content"></a>**Definition N.6 (Relational Information Content).** On a registered finite-dimensional system--environment carrier, or on a branch where all three entropies in the following expression are finite, the relational information content $\mathcal I_{\mathrm{rel}}(S_{\mathrm{sys}})$ is the quantum mutual information across the declared split $S_{\mathrm{sys}}:E_{\mathrm{env}}$. An infinite-dimensional extension through relative entropy requires its own domain and finiteness record before use in the finite mass ledger:

$$
\mathcal I_{\mathrm{rel}}(S_{\mathrm{sys}}) := I(S_{\mathrm{sys}}:E_{\mathrm{env}}) = S_{\mathrm{vN}}(\rho_{S_{\mathrm{sys}}}) + S_{\mathrm{vN}}(\rho_{E_{\mathrm{env}}}) - S_{\mathrm{vN}}(\rho_{S_{\mathrm{sys}}E_{\mathrm{env}}})
\tag{N.20}
$$

measured in nats, where $S_{\mathrm{vN}}(\rho):=-\operatorname{Tr}(\rho\ln\rho)$ is the von Neumann entropy (von Neumann 1932) and $\rho_{S_{\mathrm{sys}}E_{\mathrm{env}}}$ is the joint state of the system/environment pair.

This definition connects directly to the interpretation of entanglement as predictive coupling (Proposition 10, Section 8.6): every bipartite pure state satisfies $I(A:B)=2S_{\mathrm{vN}}(\rho_A)$, and maximally entangled pure states maximize this quantity at given local dimensions. Quantum mutual information quantifies total correlation across the declared split. Calling that correlation predictive coupling is an interpretation; an operational anticipation claim additionally requires a specified prediction task, accessible observables, and a performance comparison.

<a id="proposition-n4-certified-boundary-decomposition-of-relational-information"></a>**Proposition N.4 (Certified Boundary Decomposition of Relational Information).** Definition N.6 fixes $\mathcal I_{\mathrm{rel}}=I(S:E)$ as a state quantity. A boundary relational-normalization certificate is a finite record
$$
\mathfrak C_{\partial}
=
\left(
\{(S_i,E_i,\rho_i,I_i,C_i^{\mathrm{rel}},q_i)\}_{i=1}^{N_{\partial}},
\mathfrak A_{\partial},
\mathfrak O_{\partial}
\right),
$$
where $\mathfrak A_{\partial}$ is one of the following typed additivity records:

1. an exact factorization
   $$
   \rho_{SE}=\bigotimes_{i=1}^{N_{\partial}}\rho_{S_iE_i},
   \qquad I_i:=I(S_i:E_i)_{\rho_i};
   $$
2. an ordered environment decomposition $E=E_1\cdots E_{N_{\partial}}$ with
   $$
   I_i:=I(S:E_i\mid E_{<i})_\rho,
   \qquad
   I(S:E)_\rho=\sum_i I_i,
   $$
   verified by the quantum mutual-information chain rule.

The record $\mathfrak O_{\partial}$ proves source exhaustion and absence of double counting. Each $C_i^{\mathrm{rel}}>0$ is a registered relational normalization budget satisfying
$$
I_i\ge0,
\qquad I_i\le C_i^{\mathrm{rel}}<\infty,
\qquad
q_i:=\frac{I_i}{C_i^{\mathrm{rel}}}\in[0,1].
$$
Calling $C_i^{\mathrm{rel}}$ an operational capacity additionally requires a declared admissible class $\mathcal A_i$, a proof that
$$
C_i^{\mathrm{rel}}=\sup_{x\in\mathcal A_i}I_i(x),
$$
and either an attaining witness or an explicit approximation sequence with certified error. Without that record it is a normalization budget, and $C_i^{\mathrm{rel}}=2\varepsilon_0$ is a calibration rather than a capacity theorem.

Acceptance requires exact spectral identities proving
$$
\boxed{
\mathcal I_{\mathrm{rel}}
=\sum_{i=1}^{N_{\partial}}I_i
=\sum_{i=1}^{N_{\partial}}q_iC_i^{\mathrm{rel}}.
}
\tag{N.21}
$$
or interval-certified evaluations with declared residual bounds; on the interval route every displayed equality is replaced by, and propagated as, a two-sided error bound.
On the common-value branch $C_i^{\mathrm{rel}}=C_*^{\mathrm{rel}}$ and $q_i=q$, Equation (N.21) becomes
$$
\mathcal I_{\mathrm{rel}}=qN_{\partial}C_*^{\mathrm{rel}}.
$$
The saturated relational-boundary branch is the additional condition $q=1$.

The budgets $C_i^{\mathrm{rel}}$ are registered relational-cut normalizations, not the unassisted HSW capacities of Theorem E.2. If an operational-capacity route identifies them with entanglement-assisted capacities or finite-window cut-set bounds, the channel ensemble, assistance, admissible class, number of uses, coding error, upper-bound proof, and attainment or approximation convention are entries of $\mathfrak C_{\partial}$. No such identification follows from quantum mutual information alone.

*Proof.* Product-state additivity proves the first route. The quantum chain rule proves the second route, and strong subadditivity gives $I_i\ge0$. The source-exhaustion audit prevents a term from appearing twice. The definitions $I_i=q_iC_i^{\mathrm{rel}}$ give the second equality in (N.21), and common $C_i^{\mathrm{rel}}$ and $q_i$ give the specialization. This is a finite certificate theorem, not a PCE saturation theorem. Indeed, a maximally entangled $d\times d$ pure state has $I(S:E)=2\ln d$, while the unassisted classical capacity of the noiseless $d$-level identity channel is $\ln d$. Therefore the former cannot generally be bounded or decomposed by the latter. ∎

<a id="proposition-n40a-exact-two-channel-additivity-and-split-order-criterion"></a>**Proposition N.4.0a (Exact Two-Channel Additivity and Split-Order Criterion).** For every finite-dimensional state $\rho_{SE_1E_2}$,
$$
\begin{aligned}
&I(S:E_1)+I(S:E_2)-I(S:E_1E_2)\\
&\hspace{2em}=I(E_1:E_2)-I(E_1:E_2\mid S).
\end{aligned}
\tag{N.4.0a.1}
$$
Consequently, the two marginal channel contributions are additive exactly when
$$
I(E_1:E_2)=I(E_1:E_2\mid S).
\tag{N.4.0a.2}
$$
The chain-rule allocations to the named channel $E_1$ in the two orders are
$$
I(S:E_1)
\quad\text{and}\quad
I(S:E_1\mid E_2),
\tag{N.4.0a.3}
$$
and they agree exactly under the same condition (N.4.0a.2); the statement is symmetric for $E_2$.

Marginal independence of the carriers is insufficient. Let $E_1,E_2$ be independent uniform classical bits and let $S=E_1\mathbin{\mathrm{XOR}}E_2$, represented as a diagonal quantum state. Then
$$
I(E_1:E_2)=0,
\quad I(S:E_1)=I(S:E_2)=0,
\quad I(S:E_1E_2)=\ln2,
\tag{N.4.0a.4}
$$
whereas
$$
I(S:E_2\mid E_1)=I(S:E_1\mid E_2)=\ln2.
\tag{N.4.0a.5}
$$
Thus the ordered chain rule always preserves the total but assigns the entire contribution to whichever carrier is second. A split-independent concurrent-channel attribution requires a condition at least strong enough to exclude this synergy; absence of a shared marginal carrier alone does not do so.

*Proof.* Expanding both sides of (N.4.0a.1) in von Neumann entropies gives
$$
S(S)+S(E_1)+S(E_2)-S(SE_1)-S(SE_2)-S(E_1E_2)+S(SE_1E_2)
$$
on each side. The chain-rule identity
$I(S:E_1)-I(S:E_1\mid E_2)=I(E_1:E_2)-I(E_1:E_2\mid S)$
then proves the order criterion. In the XOR state, each single bit is independent of $S$, while the pair determines $S$; the displayed values follow directly. ∎

<a id="proposition-n40b-complete-multichannel-split-classification-and-qubit-carrier-normalization"></a>**Proposition N.4.0b (Complete Multichannel Split Classification and Qubit-Carrier Normalization).** Fix $N\ge2$ and a finite-dimensional state $\rho_{SE_1\cdots E_N}$ with local dimensions $d_S$ and $d_{E_i}$. For $A\subseteq[N]:=\{1,\ldots,N\}$ let $E_A$ be the composite of the channels in $A$, let $A^c:=[N]\setminus A$, and set
$$
f(A):=I(S:E_A)_\rho,
\qquad
f(\varnothing):=0.
$$
For an ordering $\pi$ of $[N]$ and a channel $i$, let $P_\pi(i)$ be the set of channels that precede $i$. The ordered chain-rule allocation of route 2 of Proposition N.4 is
$$
a_i^\pi:=I(S:E_i\mid E_{P_\pi(i)})=f(P_\pi(i)\cup\{i\})-f(P_\pi(i)).
\tag{N.4.0b.1}
$$
Then:

1. $a_i^\pi\ge0$ and $\sum_ia_i^\pi=I(S:E)$ for every ordering $\pi$.
2. For every channel $i$ and every $A\subseteq[N]\setminus\{i\}$,
   $$
   I(S:E_i)-I(S:E_i\mid E_A)=I(E_i:E_A)-I(E_i:E_A\mid S).
   \tag{N.4.0b.2}
   $$
3. The following are equivalent: (a) every channel receives the same allocation in every ordering; (b) $a_i^\pi=I(S:E_i)$ for every $i$ and every $\pi$; (c) $f$ is additive, $I(S:E_A)=\sum_{i\in A}I(S:E_i)$ for every $A\subseteq[N]$; (d) $I(E_i:E_A)=I(E_i:E_A\mid S)$ for every $i$ and every $A\subseteq[N]\setminus\{i\}$. For $N=2$, condition (c) is the single identity $I(S:E_1E_2)=I(S:E_1)+I(S:E_2)$, which (N.4.0a.1) converts into (N.4.0a.2).
4. For $N\ge3$, condition (c) is implied neither by its top member $A=[N]$ nor by all of its proper members. On diagonal states built from independent uniform bits: if $S=E_1\oplus E_2$, $E_3=S$ and every further channel is a fixed pure qubit, then $I(S:E)=\sum_iI(S:E_i)=\ln2$, while $I(S:E_1E_2)=\ln2\ne0=I(S:E_1)+I(S:E_2)$, and the allocation to $E_2$ is $\ln2$ in the ordering $(1,2,3,\ldots)$ and $0$ in the ordering $(3,1,2,\ldots)$. If $S=E_1\oplus\cdots\oplus E_N$, then $f(A)=0$ for every $A\ne[N]$ and $f([N])=\ln2$, so the whole allocation goes to the last channel of each ordering.
5. For every channel $i$, every $A\subseteq[N]\setminus\{i\}$ and every state,
   $$
   0\le I(S:E_i\mid E_A)\le2\ln\min(d_S,d_{E_i}),
   \tag{N.4.0b.3}
   $$
   with equality for every $A$ in a maximally entangled state of Schmidt rank $\min(d_S,d_{E_i})$ between $S$ and $E_i$, tensored with any state of the remaining channels. The same bound with $S_i$ in place of $S$ governs route 1. Hence on the admissible class $\mathcal A_i$ of all states of the declared carrier, $\sup_{\mathcal A_i}I_i=2\ln\min(d_S,d_{E_i})$ is attained. For a qubit channel carrier with $d_{E_i}=2\le d_S$ this supremum is $2\ln2=2\varepsilon_0$, so the budget $C_i^{\mathrm{rel}}=2\varepsilon_0$ carries the admissible class, supremum proof and attaining witness that Proposition N.4 requires before $C_i^{\mathrm{rel}}$ is called an operational capacity.
6. If every channel is saturated at $C_i^{\mathrm{rel}}=2\ln d_{E_i}$ in one ordering, equivalently $I(S:E)=2\ln d_E$, then $d_S\ge d_E$ and $f(A)=2\ln d_{E_A}$ for every $A\subseteq[N]$. Consequently (c) holds and every ordering assigns $2\ln d_{E_i}$ to channel $i$: on the saturated branch the chain-rule attribution is split-independent.

*Proof.* Strong subadditivity gives $a_i^\pi\ge0$, and the allocations telescope to $f([N])=I(S:E)$. Expanding both sides of (N.4.0b.2) in von Neumann entropies gives
$$
S(S)+S(E_i)+S(E_A)-S(SE_i)-S(SE_A)-S(E_iE_A)+S(SE_iE_A)
$$
on each side; this is (N.4.0a.1) with $E_2$ replaced by the composite $E_A$. Every $A\subseteq[N]\setminus\{i\}$ equals $P_\pi(i)$ for an ordering that lists $A$ first and $i$ next. Hence (a) holds exactly when $f(A\cup\{i\})-f(A)$ does not depend on $A$, that is, equals its value $f(\{i\})=I(S:E_i)$ at $A=\varnothing$; this is (b). Induction on $|A|$ turns (b) into (c), and (c) gives $f(A\cup\{i\})-f(A)=f(\{i\})$, which is (b). Equation (N.4.0b.2) identifies (b) with (d). In the first bit witness, $E_1$ and $E_2$ are each independent of $S$, the pair determines $S$, and $E_3$ determines $S$; therefore $I(S:E_1E_2)=I(S:E_3)=I(S:E)=\ln2$, $I(S:E_1)=I(S:E_2)=0$, $I(S:E_2\mid E_1)=\ln2$ and $I(S:E_1\mid E_3)=I(S:E_2\mid E_1E_3)=0$. In the parity witness every proper subfamily of independent uniform bits is independent of the total parity, and the full family determines it.

For (N.4.0b.3), the Araki--Lieb inequality $S(XY)\ge|S(X)-S(Y)|$ gives $I(X:Y)\le2\min(S(X),S(Y))\le2\ln\min(d_X,d_Y)$. The chain rule gives $I(S:E_i\mid E_A)=I(S:E_iE_A)-I(S:E_A)\le I(S:E_iE_A)\le2\ln d_S$ and, symmetrically, $I(S:E_i\mid E_A)\le I(E_i:SE_A)\le2\ln d_{E_i}$. In the product witness $S$ is uncorrelated with $E_A$, so $I(S:E_i\mid E_A)=I(S:E_i)=2\ln\min(d_S,d_{E_i})$. For item 6, $2\ln d_E=I(S:E)\le2\ln d_S$ gives $d_S\ge d_E$. For every $A$, the same bound gives $f(A)\le2\ln d_{E_A}$, while $f([N])=f(A)+I(S:E_{A^c}\mid E_A)\le f(A)+2\ln d_{E_{A^c}}$ gives $f(A)\ge2\ln d_E-2\ln d_{E_{A^c}}=2\ln d_{E_A}$. Since $\ln d_{E_A}=\sum_{i\in A}\ln d_{E_i}$, $f$ is additive. ∎

<a id="proposition-n40c-explicit-concurrent-no-shared-server-boundary-realization"></a>**Proposition N.4.0c (Explicit Concurrent No-Shared-Server Boundary Realization).** Fix $N\ge1$, $\hbar>0$ and periods $\tau_1,\ldots,\tau_N>0$. On $\mathcal H=\bigotimes_{i=1}^N(\mathbb C^2_{S_i}\otimes\mathbb C^2_{E_i})$ put $S:=S_1\cdots S_N$, take the qubit channels $E_i$, and set
$$
H=\sum_{i=1}^NH_i,
\qquad
H_i=\frac{2\pi\hbar}{\tau_i}|1\rangle\!\langle1|_{S_i},
\qquad
\psi(0)=\bigotimes_{i=1}^N\Phi^+_{S_iE_i},
\tag{N.4.0c.1}
$$
where $\Phi^+=(|00\rangle+|11\rangle)/\sqrt2$ and each $H_i$ acts as the identity on the other factors. Then:

1. $\psi(t)=\bigotimes_i\Phi_i(t)$ with $\Phi_i(t)=(|00\rangle+e^{-2\pi it/\tau_i}|11\rangle)/\sqrt2$, and $I(S:E_A)_{\psi(t)}=2|A|\ln2$ for every $A\subseteq[N]$ and every $t\ge0$. Both routes of Proposition N.4 hold with $I_i=2\ln2=C_i^{\mathrm{rel}}$ and $q_i=1$, the budget being the attained supremum of Proposition N.4.0b, and $\mathcal I_{\mathrm{rel}}=2N\ln2$ satisfies (N.21).
2. Channel $i$ returns to its initial state exactly at the times $t\in\tau_i\mathbb Z_{\ge0}$, because $|\langle\Phi_i(0)|\Phi_i(t)\rangle|^2=\cos^2(\pi t/\tau_i)$. Taking a completed cycle of channel $i$ to be a first return, every cycle lasts exactly $\tau_i$, $N_i(T)=\lfloor T/\tau_i\rfloor$, and $N_i(T)/T\to1/\tau_i$ in one common run.
3. The generators $H_i$ act on pairwise disjoint tensor factors, commute, and give $e^{-iHt/\hbar}=\bigotimes_ie^{-iH_it/\hbar}$. The reduced trajectory and the cycle count of channel $i$ depend only on $(\tau_i,\Phi^+_{S_iE_i})$, each local energy $\langle H_i\rangle=\pi\hbar/\tau_i$ is separately conserved, and the cycle intervals of each channel tile $[0,\infty)$, so the cycles of distinct channels run simultaneously. No server, clock, energy supply or serialization constraint is shared, and the concurrency certificate of Corollary N.4.1 holds.
4. With $\varepsilon_i=\varepsilon_0=\ln2$, Equation (N.24) gives $\dot\varepsilon_\partial=\sum_i\ln2/\tau_i$. For $\tau_i=\tau_{\min}$ this equals $N\ln2/\tau_{\min}=\mathcal I_{\mathrm{rel}}/(2\tau_{\min})$, which is (N.25) at $q=1$.

*Proof.* Each $H_i$ has eigenvalues $0$ and $2\pi\hbar/\tau_i$, so $e^{-iH_it/\hbar}$ multiplies $|11\rangle_{S_iE_i}$ by $e^{-2\pi it/\tau_i}$ and fixes $|00\rangle_{S_iE_i}$. A local unitary on $S_i$ preserves Schmidt coefficients, so every $\Phi_i(t)$ is maximally entangled and the global state is a product over channels. Hence $\rho_{SE_A}$ is the product of the pure pairs $(S_i,E_i)$ for $i\in A$ with the maximally mixed $S_j$ for $j\notin A$, which gives $I(S:E_A)=2|A|\ln2$. The overlap is $|(1+e^{-2\pi it/\tau_i})/2|^2=\cos^2(\pi t/\tau_i)$, equal to one exactly on $\tau_i\mathbb Z$; the counts and limits follow. Disjoint supports give commutation, the tensor-product propagator, factor-local reduced dynamics and separate energy conservation, with $\langle\Phi^+|H_i|\Phi^+\rangle=\pi\hbar/\tau_i$. Item 4 is substitution into (N.24) and (N.25). ∎

<a id="theorem-n40d-clocked-oscillator-boundary-and-recorded-cycle-admission"></a>**Theorem N.4.0d (Clocked Oscillator Boundary and Recorded-Cycle Admission).** Fix finitely many channels $i=1,\ldots,N$, periods $\tau_i>0$, record-stroke durations $0<\delta_i<\tau_i$, preparation-slot durations $a_i>0$, and positive angular frequencies $\nu_i,\mu_i$. The source class consists of the following independently specified oscillator, control and readout operations. A clock/control service is an explicit primitive of this class: the private clock of channel $i$ has deterministic readout kernel $c_i(t)=\alpha_i t+\beta_i$, where $\alpha_i>0$ and $\beta_i$ are registered, and its time extractor is $(c_i-\beta_i)/\alpha_i$. Here $t,\tau_i,\delta_i,a_i$ are in seconds and the frequencies are in inverse seconds. Each channel has its own clock, controller, preparation port and fresh-record port; there is no runtime shared clock, server or energy-supply constraint. This is the externally clocked control branch. The affine calibration and prescribed-time service are physical-theory inputs with zero error on the declared class.

For each $i$, use four bosonic modes $(s_{i0},s_{i1},e_{i0},e_{i1})$ with canonical number operators $n_{s_{ir}},n_{e_{ir}}$. Write $N_{S_i}=n_{s_{i0}}+n_{s_{i1}}$ and $N_{E_i}=n_{e_{i0}}+n_{e_{i1}}$. The admitted carrier is the joint sector $N_{S_i}=N_{E_i}=1$, with occupancy encoding
$$
V_i|x,y\rangle
=s_{ix}^{\dagger}e_{iy}^{\dagger}|\mathrm{vac}\rangle,
\qquad x,y\in\{0,1\}.
\tag{N.4.0d.1}
$$
The source free Hamiltonian after preparation is
$$
H_i^0=\hbar\nu_i(N_{S_i}+N_{E_i})+
\hbar\Omega_i n_{s_{i1}},\qquad \Omega_i=2\pi/\tau_i.
\tag{N.4.0d.2}
$$
All source terms are normal ordered. The positive baseline energy is retained. On the admitted sector, $V_i^\dagger H_i^0V_i=2\hbar\nu_i I+\hbar\Omega_i P_{1,S_i}$; the first term changes the propagator by a scalar phase and contributes to its energy ledger.

**Preparation and separating readout.** For a dual-rail pair $z=(z_0,z_1)$ define
$$
X_z=z_0^\dagger z_1+z_1^\dagger z_0,\qquad
Z_z=n_{z_0}-n_{z_1},\qquad
D_z=(X_z+Z_z)/\sqrt2.
$$
On $N_z=1$, $D_z$ is the Hadamard matrix. During preparation the rail gap is set to zero, leaving the baseline $\hbar\nu_i(N_{S_i}+N_{E_i})$. A slot of length $a_i$ with control $\pi\hbar(N_z-D_z)/(2a_i)$ implements $D_z$ on that sector, up to the baseline scalar phase. A slot with control $\pi\hbar n_{s_{i1}}n_{e_{i1}}/a_i$ implements controlled-$Z$. Starting with one excitation in rail $0$ of each pair, apply in chronological order $D_{S_i},D_{E_i},\mathrm{CZ}_{S_iE_i},D_{E_i}$. The four slots finish at $t=0$, when the registered gap is enabled. The resulting pair state is
$$
\Psi_i(0)=\frac{s_{i0}^\dagger e_{i0}^\dagger+s_{i1}^\dagger e_{i1}^\dagger}{\sqrt2}|\mathrm{vac}\rangle
=V_i\Phi^+.
\tag{N.4.0d.3}
$$
The control switch fixes a piecewise specified Hamiltonian; it is included in the private controller's source record. Its gap-energy increment on (N.4.0d.3) is $\hbar\Omega_i/2$.

The source readout primitive resolves the two rail occupancies and retains a code-failure outcome when their sum is not one. Terminal Pauli readouts are physically generated as follows: measure the occupations for $Z$; apply $D_z$ and then measure for $X$; apply the phase $S^\dagger=\operatorname{diag}(1,-i)$, then $D_z$, then measure for $Y$. The phase is generated over a chosen duration $b>0$ by $\pi\hbar n_{z_1}/(2b)$. In these terminal protocols the rail gap is first set to zero, with the state at the query time as input. Tensor products of these readouts on all retained code factors are admitted. They separate every density matrix of the finite retained sector; their controls, phase-switch operations and durations are part of that terminal protocol. Thus both oscillator states and their response equivalence are specified before the normalization is evaluated.

**Return records.** Record cell $B_{ik}$ is a fresh dual-rail oscillator pair with common rail frequency $\mu_i$, total occupation one and initial state $|0\rangle_B=|1,0\rangle$. It belongs to channel $i$'s system side. Write $X_{B_{ik}}$ for its encoded rail-exchange operator. Its free energy is $\hbar\mu_i$ throughout the code. Let $U_i^0(t)=e^{-itH_i^0/\hbar}$ and let
$$
P_i(t)=U_i^0(t)|\Psi_i(0)\rangle\!\langle\Psi_i(0)|U_i^0(t)^\dagger.
$$
With $|u_i\rangle=s_{i0}^\dagger e_{i0}^\dagger|\mathrm{vac}\rangle$ and $|v_i\rangle=s_{i1}^\dagger e_{i1}^\dagger|\mathrm{vac}\rangle$, its full oscillator expression is
$$
P_i(t)=\tfrac12\bigl(|u_i\rangle\!\langle u_i|+|v_i\rangle\!\langle v_i|
+e^{i\Omega_i t}|u_i\rangle\!\langle v_i|
+e^{-i\Omega_i t}|v_i\rangle\!\langle u_i|\bigr).
$$
It is zero off the indicated rank-two subspace. The following bounded joint-mode meter coupling is an additional explicitly admitted Hamiltonian of the engineered source, alongside the quadratic and cross-Kerr preparation controls. On the final interval $[k\tau_i-\delta_i,k\tau_i]$ of cycle $k$, add the control
$$
H_{ik}^{\mathrm{rec}}(t)
=\frac{\pi\hbar}{\delta_i}P_i(t)\otimes
\frac{\Pi_{B_{ik}}-\widehat X_{B_{ik}}}{2},
\tag{N.4.0d.4}
$$
where $\Pi_B$ is the single-excitation projector and $\widehat X_B=|1,0\rangle\!\langle0,1|+|0,1\rangle\!\langle1,0|$ is zero off that sector. The private clock opens and closes this window at its readings $\alpha_i(k\tau_i-\delta_i)+\beta_i$ and $\alpha_i k\tau_i+\beta_i$. Every completed cell is thereafter isolated from the running system. It is retained and can be read through the declared number-readout port. The controller has no dependence on its outcome. The moving projector in (N.4.0d.4) is a prescribed source control, calculated from (N.4.0d.2)--(N.4.0d.3); it performs a joint $S_iE_i$ operation and is retained in the full response record.

For a finite horizon $T$, supply $m_i(T)=\lfloor T/\tau_i\rfloor+1$ fresh cells for each $i$. This includes any active last stroke and at most one unused future cell. The complete finite source comprises the main modes, these cells, the private service records and the declared terminal readout resources. The system side $\widehat S_i$ contains $S_i$, its cells and its private service records; the boundary side is exactly the admitted two-dimensional $E_i$ sector. The latter is the rank-two carrier in the normalization statement. Every private clock/program label is a fixed deterministic input, represented in the response record by a singleton classical algebra. The algebraic operation admission covers arbitrary states of the full finite oscillator sector. The capacity test class instead starts from arbitrary density matrices of the main-pair sectors, supplies every record cell in its fixed ready state, and applies the declared running operations up to the queried time. The actual cycle branch uses the specific product Bell preparation (N.4.0d.3). These are separate quantified domains: full-sector operation intertwining, ready-input capacity tests, and the prepared Bell-cycle run.

Then the following assertions hold.

1. **Total response-faithful admission.** The tensor occupancy isometry, extended to every supplied record cell and by the identity on classical service labels, identifies the physical sector with its finite logical carrier. It intertwines each preparation, free propagator, record control, occupation instrument and terminal tomography operation, their finite compositions, and their spectator extensions. In particular, for every admitted operation leaf $\mathcal K_b$, its logical leaf $K_b$, every sector state $\rho$, and every admitted terminal effect $F$,
   $$
   \mathcal K_b(V\rho V^\dagger)=VK_b(\rho)V^\dagger,
   \qquad
   \operatorname{Tr}[\widehat F\mathcal K_b(V\rho V^\dagger)]
   =\operatorname{Tr}[F K_b(\rho)].
   \tag{N.4.0d.5}
   $$
   Zero leakage follows from number-sector invariance. The terminal tensor-Pauli family is separating, so equality of its complete response table is equality of the retained density operator. The realization covers the declared operation class, including its response-active record cells, rather than a selected state or a single outcome.

2. **Finite-duration return instrument.** For one record window starting at $a=k\tau_i-\delta_i$ and ending at $b=k\tau_i$, let $P=P_i(a)$, $Q=I-P$ on the admitted pair, and $U=e^{-i\delta_iH_i^0/\hbar}$. The source-to-pair-and-record isometry at the end of the window is
   $$
   W_{ik}|\psi\rangle
   =UP|\psi\rangle\otimes|1\rangle_{B_{ik}}
   +UQ|\psi\rangle\otimes|0\rangle_{B_{ik}}.
   \tag{N.4.0d.6}
   $$
   A scalar record free phase is omitted from this isometry. Number readout gives the total normalized instrument with leaves $UP\rho PU^\dagger$ and $UQ\rho QU^\dagger$, together with their two recorded labels. Since $UPU^\dagger=P_i(b)=|\Psi_i(0)\rangle\!\langle\Psi_i(0)|$, this is exactly the registered Bell return test at the endpoint, transported through the free evolution. No assertion that the off-orbit inputs have period $\tau_i$ is used.

   On the prepared cycle branch, the pair is unchanged by the record control at every intermediate time. It follows its free orbit, the cell evolves independently, and at $b$ its state is $|1\rangle$. Each completed cell is therefore an orthogonal physical success record of that endpoint return. For arbitrary inputs the cell may be correlated with the pair; (N.4.0d.6) retains that correlation. Reading completed cells later produces the same joint leaf probabilities as reading them at their endpoints, because subsequent operations are identities on them.

3. **Populated boundary normalization.** On the prepared cycle branch, at every finite time the complete state has the factorization
   $$
   \rho_{\widehat SE}(t)
   =\bigotimes_{i=1}^N\bigl(|\Psi_i(t)\rangle\!\langle\Psi_i(t)|
   \otimes|\chi_i(t)\rangle\!\langle\chi_i(t)|\bigr),
   \quad
   \Psi_i(t)=U_i^0(t)\Psi_i(0),
   \tag{N.4.0d.7}
   $$
   where $\chi_i(t)$ includes that channel's active, completed and unused record cells and its fixed service labels. The cells are pure and independent of the main pair even during a stroke. Thus every channel subfamily satisfies
   $$
   I(\widehat S:E_A)=2|A|\ln2,
   \quad
   I_i=2\ln2,\quad
   C_i^{\mathrm{rel}}=2\ln2=2\varepsilon_0,\quad q_i=1.
   \tag{N.4.0d.8}
   $$
   Here $C_i^{\mathrm{rel}}$ is the attained supremum over the declared ready-input capacity class at each queried time, with either marginal or ordered allocation as in Proposition N.4.0b. The ambient all-state bound uses $\dim E_i=2$ and therefore bounds that source class; its prepared Bell member attains the bound. It is a relational-information normalization, with its admissible class and witness supplied. An unassisted transmission capacity is a different functional.

   The record $\mathfrak C_\partial$ is populated by the pairs $(\widehat S_i,E_i)$, the states in (N.4.0d.7), and the values in (N.4.0d.8). Its additivity record is the displayed tensor factorization, and the ordered-chain route gives the same values for every ordering. Its source-ownership record assigns the main pair, private controller, clock, ready input and every record cell exactly once to channel $i$; every cell and service factor lies on $\widehat S_i$, and only $E_i$ crosses the declared relational cut. On the actual branch the added factors contribute zero mutual information, as (N.4.0d.7) proves. The record has no omitted boundary carrier, reused label, shared interaction term or entropy remainder.

4. **Completed events and concurrent rates.** On that same run,
   $$
   |\langle\Psi_i(0),\Psi_i(t)\rangle|^2
   =\cos^2(\pi t/\tau_i).
   \tag{N.4.0d.9}
   $$
   Consequently the source pair's first positive projective-state return is $\tau_i$, and its subsequent first-return intervals are $[(k-1)\tau_i,k\tau_i]$. The completed record cell at $k\tau_i$ is exactly the success leaf of item 2 for that return. A cell during an unfinished stroke is not included in the completed-event count. The physical count is therefore
   $$
   N_i(T)=\lfloor T/\tau_i\rfloor.
   \tag{N.4.0d.10}
   $$
   Every generator, service and record port is channel local. Their propagators and instrument leaves factor over $i$, so on the prepared product branch the reduced law and count of one channel are independent of the periods, states, controls and counts of every other channel. For correlated test inputs, the same factorization is the locality of each unconditional marginal map; selective conditioning keeps its full joint outcome law. With the registered structural increment $\varepsilon_i=\ln2$, the finite accumulated update ledger is $\sum_i\ln2\,\lfloor T/\tau_i\rfloor$.

   For the common-run asymptotic statement, explicitly extend each private fresh-record port to the countable index set $k\ge1$, with a locally finite schedule and the same ready input and control at every index. This is an open, unbounded supplied-resource extension of the finite source, represented by the compatible local tensor-product process. Every finite horizon touches finitely many cells and has exactly the finite-horizon law above. It supplies one common run, on which
   $$
   \lim_{T\to\infty}\frac{N_i(T)}T=\frac1{\tau_i},
   \qquad
   \dot\varepsilon_\partial=\sum_i\frac{\ln2}{\tau_i}.
   \tag{N.4.0d.11}
   $$
   This populates Corollary N.4.1's concurrency record. On $\tau_i=\tau_{\min}$, the rate is $N\ln2/\tau_{\min}=\mathcal I_{\mathrm{rel}}/(2\tau_{\min})$. The finite-source certificates and the unbounded supplied-resource extension have different resource scopes. The extension is not assigned finite total stored energy or a finite reusable memory.

5. **Finite source and unit ledger.** Before an optional terminal tomography protocol, the horizon-$T$ carrier has $4N+2\sum_i m_i(T)$ oscillator modes and $2N+\sum_i m_i(T)$ ready excitations. It uses $4N$ preparation pulses, at most $\sum_i m_i(T)$ local record pulses, and $N$ private clock/control and ready-input services. The four preparation controls have code-restricted integrated norm action $4\pi\hbar$ per channel. Each completed record pulse has code-restricted norm action $\pi\hbar$; an unfinished one contributes its elapsed fraction. The positive free stored energy of the prepared main pairs and supplied cells is
   $$
   E_{\mathrm{free}}(T)
   =\sum_i\left(2\hbar\nu_i+\frac{\pi\hbar}{\tau_i}
   +m_i(T)\hbar\mu_i\right).
   \tag{N.4.0d.12}
   $$
   The source record separately lists the number-state ready preparations, clock and control services, gap switches and any terminal detector/readout operation. The stated norm action is a control-operator integral; no reset-heat or erased-entropy identification is used. The increment $\varepsilon_i=\ln2$ is the structural entry of Proposition N.4.0c, while Corollary N.4.1's same-cycle reset interpretation still requires its separate conditional-entropy/reset certificate.

A nonzero finite member has $N=2$, $\tau_1=\tau_0$, $\tau_2=2\tau_0$, $a_i=\tau_0/8$, $\delta_i=\tau_i/4$, $\nu_i=\mu_i=2\pi/\tau_0$, identity clock units and $T=2\tau_0$. It has counts $(2,1)$, $\mathcal I_{\mathrm{rel}}=4\ln2$, structural accumulated update $3\ln2$, five supplied record cells, eighteen oscillator modes and nine ready excitations. Its preparation-plus-completed-record norm action is $11\pi\hbar$, and its free stored energy is $39\pi\hbar/(2\tau_0)$. The corresponding supplied-resource rate is $3\ln2/(2\tau_0)$.

*Proof.* Each two-mode single-excitation sector has the orthonormal occupation basis $z_0^\dagger|\mathrm{vac}\rangle,z_1^\dagger|\mathrm{vac}\rangle$. Direct application of the creation and annihilation operators gives the matrices $X,Z$ and $D=(X+Z)/\sqrt2$, with $D^2=I$. The number operators, quadratic rail controls and cross-Kerr term preserve the two total occupations. The bounded record projector and pointer rail exchange also commute with them. Hence every specified operation preserves the admitted sector. The number Hamiltonians are self-adjoint on their usual number-operator domains. Preparation controls reduce on each fixed-number block to finite self-adjoint matrices; the record terms are bounded. Their piecewise propagators are therefore well defined, and restriction to the admitted finite block commutes with propagation. Restriction of (N.4.0d.2) gives the stated scalar baseline and qubit phase generator.

On $N_z=1$, the Hadamard control propagator is $e^{-i\pi(I-D)/2}=D$, since it acts as $1$ on the $+1$ eigenspace and $-1$ on the $-1$ eigenspace. The cross-Kerr pulse is $\operatorname{diag}(1,1,1,-1)$ on the two encoded bits. Thus the chronological product is $(I\otimes D)\mathrm{CZ}(D\otimes D)$, which maps $|00\rangle$ to $(|00\rangle+|11\rangle)/\sqrt2$. The gap is zero during those slots, so the baseline commutes and supplies only a common phase. At the handoff the state is unchanged by switching the Hamiltonian, while its expected gap energy increases to $\hbar\Omega_i/2$. This proves the preparation and energy statement without neglecting a noncommuting free drift.

For tomography, $DZD=X$ and $SXS^\dagger=Y$. Thus the three stated procedures realize $(I\pm Z)/2$, $(I\pm X)/2$ and $(I\pm Y)/2$. Their sums and differences span $I,X,Y,Z$; tensor products span the full matrix algebra on any finite number of code factors. The resulting response table is therefore separating. The phase and rail pulses have the same restricted matrices as their logical counterparts. Occupation projections restrict to the corresponding logical projectors, and every code-failure leaf has zero probability on sector states. Multiplication, tensor products and partial traces commute with the occupancy isometry on its range. Induction over a finite operation word, with outcome labels retained, proves (N.4.0d.5), including arbitrary spectator identity factors. The clock extractor and window conditions are literally the same deterministic functions in the two descriptions, so their recorded timing responses also intertwine.

For a record window, transform by the free pair propagator measured from its starting time $a$. The identity $P_i(t)=e^{-i(t-a)H_i^0/\hbar}P_i(a)e^{i(t-a)H_i^0/\hbar}$ makes the interaction-picture control constant, equal to $\pi\hbar P\otimes(I-X_B)/(2\delta_i)$ on the admitted block. The pointer's free Hamiltonian is scalar there. The interaction-picture propagator for elapsed time $s\in[0,\delta_i]$ is
$$
(I-P)\otimes I+P\otimes e^{-i\pi s(I-X_B)/(2\delta_i)}.
$$
At $s=\delta_i$, the latter exponential is $X_B$. Acting on a ready pointer proves (N.4.0d.6). Orthogonality of its two pointer outputs gives the two CP leaves, whose adjoint products sum to $P+Q=I$. The same identities after tensoring any reference prove complete normalization. On the actual input $P_i(a)$, the pair remains in the moving range of $P_i(t)$, so the control acts only on the pointer. The pair and pointer factor at every intermediate time. Earlier completed pointers never re-enter a generator, so their measurements commute with all later evolutions and deferred number readout has the same joint outcome laws.

Initially the channels and their fresh cells are products. The preceding factorization applies independently to every local record stroke, and the free propagator acts independently on each channel. This proves (N.4.0d.7) for all finite times. Each main pair has Schmidt coefficients $(1/\sqrt2,1/\sqrt2)$, and all its service factors are pure and independent. Thus the entropy of $E_i$ and of $\widehat S_i$ is $\ln2$, while the joint state is pure. The product-state entropy identities give $I(\widehat S:E_A)=2|A|\ln2$. For arbitrary states on the finite admitted carrier, Proposition N.4.0b gives $I(\widehat S:E_i\mid E_A)\le2\ln\dim E_i=2\ln2$, as well as the marginal bound. The prepared state attains both, for every $A$ and every ordering. This establishes the full normalization record. The assignment of every mode and operation to one private channel proves source exhaustion and no double counting; the service factors' vanishing contribution follows from the proved product state rather than from declaring the meter a spectator on arbitrary inputs.

The scalar baseline drops out of the return probability. The remaining overlap is $(1+e^{-i\Omega_i t})/2$, so its squared modulus is (N.4.0d.9). It equals one exactly when $t\in\tau_i\mathbb Z$. The record stroke leaves this orbit unchanged and ends in the orthogonal success cell at precisely those positive endpoints. No cell is counted until its entire prescribed stroke is complete. This proves the first-return/event identification and (N.4.0d.10). Disjoint source and service factors give tensor-product evolution even when different channels' windows overlap. Hence there is no cross-channel serialization loss. The infinite supplied-resource extension uses one fixed index set and one fixed schedule; restriction to any finite horizon involves only its finite prefix. Product ready inputs and the consistent finite compositions define its local process, so the counts in (N.4.0d.10) belong to that one process. Since $0\le T/\tau_i-\lfloor T/\tau_i\rfloor<1$, division by $T$ and a finite sum prove (N.4.0d.11). The extension may be viewed as incoming fresh cells with all completed cells retained; it requires an unbounded supply over unbounded time.

Finally, each supplied record uses two modes and one excitation. On its one-excitation block a Hadamard-control norm is $\pi\hbar/a_i$, and the controlled-$Z$ norm is the same; the four slots therefore contribute $4\pi\hbar$. The projector product in (N.4.0d.4) has norm one, giving $\pi\hbar$ per complete record stroke. The free expectation of a main pair is $2\hbar\nu_i+\hbar\Omega_i/2$, and each supplied cell contributes $\hbar\mu_i$, proving (N.4.0d.12). The displayed finite member follows by substituting its parameters, with $m_1=3$ and $m_2=2$. ∎

The source-to-sector and complete recorded-cycle conclusions above establish the mathematical admission predicate on the full declared operation/readout class. The formal source, ideal private affine clock/control and fresh-ready services remain explicit premises; no universal-hardware, autonomous-source or empirical calibration claim is inferred.

### N.11.2 Open-System Thermodynamics and the KMS Condition

A physical steady-state exchange claim requires a separately registered open-system activity record.

<a id="theorem-n4-activity-conditioned-steady-state-exchange-bound"></a>**Theorem N.4 (Activity-Conditioned Steady-State Exchange Bound).** Assume a registered active boundary channel on which completed exchange cycles are serialized, so distinct cycles on that channel do not overlap in physical time, and whose physical-time certificate states that every completed cycle has duration at least $\tau_{\min}>0$. Let $N(T)$ count cycles wholly completed in $[0,T]$ and define
$$
r_e:=\limsup_{T\to\infty}\frac{N(T)}T.
$$
Then
$$
0\le r_e\le\frac1{\tau_{\min}}.
$$
Equality holds only on a separately registered saturated-activity branch; relational information, modular KMS status, detailed balance, and Theorem 29 alone prove neither the duration premise, positive activity, nor saturation.

*Proof.* On a faithful active-support state $\rho_a$, Theorem G.1.9.5 supplies the modular representation
$$
\sigma_t^{\rho_a}(A)=\rho_a^{it}A\rho_a^{-it}.
\tag{N.22}
$$
This identity supplies no physical clock. On the separate Equation-Q.18 and saturated-Proposition-Q.6.1 calibration branch one may register
$$
\tau_{\min}=\sqrt{8\ln2}\,t_P,
\tag{N.23}
$$
but only after accepting its response-active physical-time bridge. The serialized duration certificate gives $N(T)\tau_{\min}\le T$. Taking the declared limsup yields $r_e\le1/\tau_{\min}$; equality is precisely the additional saturated-activity condition. ∎

<a id="remark-n41-open-vs-closed-systems"></a>**Remark N.4.1: Open vs. Closed Systems.** An active open-system exchange is compatible with the second law only after the environment and all reset records are included in one entropy ledger.

<a id="corollary-n41-boundary-update-ledger-rate-on-the-certified-concurrent-branch"></a>**Corollary N.4.1 (Boundary Update-Ledger Rate on the Certified Concurrent Branch).** Let an accepted $\mathfrak C_{\partial}$ have finitely many channels $i=1,\ldots,N_{\partial}$. Specify a completed-cycle structural increment $\varepsilon_i\ge0$ and duration $\tau_i>0$ for each channel. Require a concurrency certificate for one common run in which the completed-cycle counts satisfy the actual limits
$$
\lim_{T\to\infty}\frac{N_i(T)}T=\frac1{\tau_i}
\qquad\text{for every }i.
$$
The certificate must exclude reductions from shared servers, clocks, energy supplies or serialization. Require an additive, source-exhaustive update ledger with no interaction or double-counted term. Define its steady mean rate along this run by
$$
\boxed{
\dot\varepsilon_{\partial}
:=\lim_{T\to\infty}\frac1T\sum_{i=1}^{N_{\partial}}\varepsilon_iN_i(T)
=\sum_{i=1}^{N_{\partial}}\frac{\varepsilon_i}{\tau_i}.
}
\tag{N.24}
$$
On the common-value branch
$$
\varepsilon_i=\varepsilon_0,
\qquad
\tau_i=\tau_{\min},
\qquad
C_i^{\mathrm{rel}}=C_*^{\mathrm{rel}},
\qquad
q_i=q\in(0,1],
$$
Proposition N.4 gives
$$
\dot\varepsilon_{\partial}
=\frac{\varepsilon_0N_{\partial}}{\tau_{\min}}
=\frac{\varepsilon_0\mathcal I_{\mathrm{rel}}}
{qC_*^{\mathrm{rel}}\tau_{\min}}.
$$
If an independent relational-normalization calibration verifies
$$
C_*^{\mathrm{rel}}=2\varepsilon_0,
$$
then
$$
\boxed{
\dot\varepsilon_{\partial}
=\frac{\mathcal I_{\mathrm{rel}}}{2q\tau_{\min}}.
}
\tag{N.25}
$$
The canonical saturated-boundary value is the specialization $q=1$. Boundary utilization does not prove $C_*^{\mathrm{rel}}=2\ln2$, and single-channel saturation does not prove concurrency.

Equation (N.24) is a structural update rate. A same-cycle reset certificate may identify it with the throughput of erased conditional entropy by requiring registered resets with $H_{p_i}(P_i\mid R_i)=\varepsilon_i$ and an exhaustive source ledger. The law $p_i$ is distinct from the utilization coordinate $q_i$ unless a typed bridge proves otherwise. A conditionally uniform binary reset with no retained side information has conditional entropy $\ln2$; alphabet cardinality alone does not supply that ensemble. Mean bath-heat bounds require the complete reset implementation and temperature premises and the summation/limit conditions of Corollary N.5.2. The erased-entropy rate is not total entropy production: a reversible reset can erase positive conditional entropy while the total entropy-production rate vanishes.

*Proof.* In the common run, the finite sum of the actual limits $\varepsilon_iN_i(T)/T$ gives (N.24). The common-value specialization, $q>0$, and Equation (N.21) give the next display. Substitution of $C_*^{\mathrm{rel}}=2\varepsilon_0$ gives (N.25). The additional same-cycle certificate identifies the conditional-entropy throughput only; Corollary N.5.2 states the separately justified mean-heat conclusion. ∎

<a id="corollary-n42-certified-off-reference-boundary-rate-residual-decomposition"></a>**Corollary N.4.2 (Certified Off-Reference Boundary-Rate Residual Decomposition).** Work on the common-value, concurrent, saturated-activity, relational-normalization-calibrated branch of Corollary N.4.1, so $q\in(0,1]$ and $\mathcal I_{\mathrm{rel}}>0$. Suppose a source-exhaustive rate certificate fixes nonnegative, same-unit entries $\sigma_{\mathrm{KMS}}$ and $\sigma_{\mathrm{oh}}$ and proves
$$
\dot\varepsilon_{\mathrm{pred}}
=\frac{\mathcal I_{\mathrm{rel}}}{2q\tau_{\min}}
+\sigma_{\mathrm{KMS}}+\sigma_{\mathrm{oh}}.
$$
Define the algebraic $q=1$ benchmark
$$
\mathcal R_N
:=
\dot\varepsilon_{\mathrm{pred}}
-\frac{\mathcal I_{\mathrm{rel}}}{2\tau_{\min}},
\tag{N.25a}
$$
and
$$
\Delta_q
:=
\frac{\mathcal I_{\mathrm{rel}}}{2\tau_{\min}}
\left(\frac1q-1\right).
\tag{N.25b}
$$
Then
$$
\boxed{
\mathcal R_N
=\Delta_q+\sigma_{\mathrm{KMS}}+\sigma_{\mathrm{oh}}
\ge0.
}
\tag{N.25c}
$$
Equality holds exactly when $q=1$ and both certified excess entries vanish. Interpreting the benchmark as a realizable comparison additionally requires a matched feasible $q=1$ witness with the same declared quantities; the sign identity itself is algebraic.

*Proof.* Subtract the $q=1$ reference rate from the source-exhaustive identity. Since $0<q\le1$, $\Delta_q\ge0$; the other two terms are nonnegative certificate entries. No sign conclusion is available for an unsaturated, bottlenecked, or source-incomplete branch. ∎

<a id="remark-n421-operational-signature"></a>**Remark N.4.2.1 (Operational Signature).** The decomposition (N.25c) is independently testable by measuring the per-channel rates and auditing the named sources. A KMS representation alone neither defines $\sigma_{\mathrm{KMS}}$ nor makes it nonnegative in this ledger.

### <a id="n113-mass-action-calibration-from-a-certified-relational-boundary-ledger"></a>N.11.3 Mass--Action Calibration from a Certified Relational Boundary Ledger

<a id="theorem-n5-mass-action-calibration-from-a-certified-relational-boundary-ledger"></a>**Theorem N.5 (Mass--Action Calibration from a Certified Relational Boundary Ledger).** Let $\mathfrak B_{\mathrm{mass}}^{\mathrm{rate}}(q)$ consist of:

1. an accepted common-value boundary certificate $\mathfrak C_{\partial}$ with $C_i^{\mathrm{rel}}=C_*^{\mathrm{rel}}$ and $q_i=q\in(0,1]$;
2. the common-run saturated-activity, concurrency and source-exhaustion certificate of Corollary N.4.1, with $\varepsilon_i=\varepsilon_0>0$ and $\tau_i=\tau_{\min}>0$ for every channel;
3. the independently verified calibration $C_*^{\mathrm{rel}}=2\varepsilon_0$; and
4. an accepted action/update identification for the same cycles,
   $$
   \left|\frac{d\mathcal S_{\mathrm{action}}}{d\tau}\right|
   =\hbar\dot\varepsilon_{\partial},
   $$
   obtained from Corollary Q.0.1 only after $\kappa_A=\hbar$, the recovery sequence, normalization, and source-overlap map are fixed.
5. stationarity of $\mathcal I_{\mathrm{rel}},q,C_*^{\mathrm{rel}},\tau_{\min}$ and the action coefficient over the proper-time interval used below; without stationarity the formulas are pointwise and must be integrated.

Then the coefficient of the rest-action ledger is
$$
\boxed{
m
=\frac{\hbar\mathcal I_{\mathrm{rel}}}
{2q c^2\tau_{\min}}.
}
\tag{N.26}
$$
Let $\mathfrak B_{\mathrm{mass}}(q)$ additionally include the Equation-Q.18/Proposition-Q.6.1 clock and spacing calibration
$$
\tau_{\min}=\sqrt{8\varepsilon_0}\,t_P,
\qquad
\delta=\sqrt{8\varepsilon_0}\,L_P.
$$
On that extended branch,
$$
m
=\frac{\mathcal I_{\mathrm{rel}}}{2q\sqrt{8\varepsilon_0}}m_P
=\frac{\mathcal I_{\mathrm{rel}}}{2q}\frac{L_P}{\delta}m_P.
$$
The canonical symbol $\mathfrak B_{\mathrm{mass}}$ denotes $\mathfrak B_{\mathrm{mass}}(1)$. With $\varepsilon_0=\ln2$, its coefficient is $0.212\ldots\,m_P$ per certified relational nat.

*Proof.* Corollary N.4.1 gives
$$
\dot\varepsilon_{\partial}
=\frac{\mathcal I_{\mathrm{rel}}}{2q\tau_{\min}}.
\tag{N.27}
$$
For the relativistic rest-action magnitude,
$$
|\mathcal S_{\mathrm{rest}}|=mc^2\tau.
\tag{N.28}
$$
Stationarity and the accepted action/update identification for the same source-exhaustive cycles give, over proper time $\tau$,
$$
\frac{|\mathcal S_{\mathrm{rest}}|}{\hbar}
=\dot\varepsilon_{\partial}\tau
=\frac{\mathcal I_{\mathrm{rel}}\tau}{2q\tau_{\min}}.
\tag{N.29}
$$
Canceling $\tau$ proves
$$
m=\frac{\hbar\mathcal I_{\mathrm{rel}}}{2q c^2\tau_{\min}}.
\tag{N.30}
$$
Only on $\mathfrak B_{\mathrm{mass}}(q)$ may one substitute $\tau_{\min}=\sqrt{8\varepsilon_0}\,t_P$ and $m_Pc^2=\hbar/t_P$. With $\varepsilon_0=\ln2$,
$$
\frac1{2\sqrt{8\ln2}}=0.212330450\ldots,
\tag{N.31}
$$
which proves the calibrated specialization. ∎

<a id="remark-n51-branch-dependence-and-interaction-with-leech-norm-information-calibration"></a>**Remark N.5.1 (Branch Dependence and Interaction with Leech Norm--Information Calibration).** The base rate formula belongs to $\mathfrak B_{\mathrm{mass}}^{\mathrm{rate}}(q)$; the Planck coefficient additionally requires $\mathfrak B_{\mathrm{mass}}(q)$; and the canonical absolute coefficient uses $q=1$. Define $\mathfrak B_{\mathrm{mass}}^{\mathrm{therm}}(q)$ as $\mathfrak B_{\mathrm{mass}}^{\mathrm{rate}}(q)$ plus the same-cycle reset law $p_i$, conditional-entropy/source-exhaustion record, equilibrium temperature, and Landauer implementation data. This branch proves Corollary N.5.2's heat inequality; exact heat equality requires the further same-rate reversible-limit convergence and compatibility certificate stated there. A separate Leech certificate may supply $\mathcal I_{\mathrm{rel}}(v)=\gamma|v|$. Absolute Leech masses require $\mathfrak B_{\mathrm{mass}}(q)$ and fixed $\gamma/q$; root geometry alone fixes only dimensionless norm ratios.

<a id="corollary-n51-rest-energy-as-certified-relational-action-rate"></a>**Corollary N.5.1 (Rest Energy as Certified Relational Action Rate).** On $\mathfrak B_{\mathrm{mass}}^{\mathrm{rate}}(q)$,
$$
E=mc^2
=\frac{\hbar\mathcal I_{\mathrm{rel}}}{2q\tau_{\min}}.
\tag{N.32}
$$
On $\mathfrak B_{\mathrm{mass}}(q)$ this becomes
$$
E=\frac{\mathcal I_{\mathrm{rel}}}{2q\sqrt{8\varepsilon_0}}E_P.
$$

*Proof.* Multiply (N.26) by $c^2$. The Planck form uses the additional clock calibration and $E_P=\hbar/t_P$. ∎

**Remark N.5.1a (Energy as Proper-Time Action Rate).** Equation (N.32) has units of energy because it is action per proper time. It is not a power law. Without $\mathfrak B_{\mathrm{mass}}^{\mathrm{therm}}(q)$ it is also not a heat or entropy-production statement.

<a id="corollary-n52-mass-branch-action-erasure-entropy-and-mean-heat-rates"></a>**Corollary N.5.2 (Mass-Branch Action, Erasure-Entropy and Mean-Heat Rates).** On $\mathfrak B_{\mathrm{mass}}^{\mathrm{therm}}(q)$, let every update cycle be a registered reset satisfying the complete Definition 28 contract. Require conditional erasure entropy $H_{p_i}(P_i\mid R_i)=\varepsilon_i$ on the admitted reset histories and one constant temperature $T_{\mathrm{eff}}>0$. For this heat-rate conclusion, require prescribed deterministic completed-cycle schedules independent of the reset outcomes, with counts $N_i(T)$ satisfying the common limits of Corollary N.4.1. Require finite mean cycle heats and a justified conditional summation over completed cycles. Any additional overhead has nonnegative mean; incomplete-cycle and endpoint terms have mean $o(T)$ in the total bath heat $Q_{\mathrm{bath}}(T)$. Define
$$
\dot Q_{\mathrm{bath}}^{\mathrm{mean}}
:=\liminf_{T\to\infty}\frac{\mathbb E Q_{\mathrm{bath}}(T)}{T}.
$$
The heat-rate symbols $\dot Q$ and $\dot Q_{\mathrm{act}}$ in Theorem N.6 and Definition N.12 inherit this ensemble-mean, long-time convention on their full declared branches; they do not denote individual reset heats or instantaneous sample-path derivatives. The action/update identification gives
$$
\boxed{
\mathcal E_{\mathrm{act}}
:=\left|\frac{d\mathcal S_{\mathrm{action}}}{d\tau}\right|
=\hbar\dot\varepsilon_{\partial}
=\frac{\hbar\mathcal I_{\mathrm{rel}}}{2q\tau_{\min}}
=mc^2.
}
\tag{N.32a}
$$
The erasure-entropy throughput and mean bath-heat bound are
$$
\boxed{
\dot\varepsilon_{\partial}
=\frac{\mathcal I_{\mathrm{rel}}}{2q\tau_{\min}},
\qquad
\dot Q_{\mathrm{bath}}^{\mathrm{mean}}
\ge k_BT_{\mathrm{eff}}
\frac{\mathcal I_{\mathrm{rel}}}{2q\tau_{\min}}.
}
\tag{N.32b}
$$
This is not a pathwise heat bound or an identification of erased entropy with total entropy production. Equality is a reversible-limit statement requiring a protocol family whose mean heat rates converge to the displayed value, all excess rates vanish, and the same activity/concurrency certificate remains compatible with the limit.

*Proof.* The action/update identity, Corollary N.4.1 and Theorem N.5 concern the same source-exhaustive cycles and give (N.32a). Conditional Landauer and the prescribed counting rule give
$$
\mathbb E Q_{\mathrm{bath}}(T)
\ge k_BT_{\mathrm{eff}}\sum_i\varepsilon_iN_i(T)+o(T).
$$
Divide by $T$ and use the finite common count limits to obtain (N.32b). The equality assertion needs the separately supplied limiting protocol family and rate compatibility. ∎

<a id="remark-n52a-off-branch-rate-residual"></a>**Remark N.5.2a (Off-Branch Rate Residual).** Corollary N.4.2 supplies a nonnegative residual only on its source-exhaustive concurrent saturated-activity and relational-normalization certificate. Unsaturated activity, a shared bottleneck, or a ledger-identification failure has no unconditional residual sign.

### N.11.4 Conditional Mechanical Realization of Relational Inertia

<a id="theorem-n6-inertia-as-relational-update-resistance"></a>**Theorem N.6 (Inertia as Relational Update Resistance).** On $\mathfrak B_{\mathrm{mass}}^{\mathrm{rate}}(q)$, assume a mechanical-realization certificate $\mathfrak C_{\mathrm{mech}}$ that (i) maps changes of the declared relational pattern $\mathcal P(S)=\{\rho_{S,E_i}\}$ to the source-exhaustive cycles of $\mathfrak C_{\partial}$ and (ii) verifies that the coefficient $m$ of Equation (N.26) is the coefficient in the retained worldline momentum/acceleration response. Then the inertial coefficient is proportional to the certified relational information.

On the stronger $\mathfrak B_{\mathrm{mass}}^{\mathrm{therm}}(q)$ and Landauer--Unruh detector-response branch, require the complete counting, temperature, conditional-reset and mean-heat premises of Corollary N.5.2 for the active subfamily. Along its prescribed common run with at least one boundary channel, let $N_{\mathrm{act}}(T)$ count the active completed cycles and require
$$
\frac{N_{\mathrm{act}}(T)}{\sum_iN_i(T)}
\longrightarrow q_{\mathrm{act}}\in[0,1].
$$
Since the common-cycle branch has $\varepsilon_i=\varepsilon_0$, its active erased-entropy throughput is $q_{\mathrm{act}}\dot\varepsilon_{\partial}$. Here $\dot Q_{\mathrm{act}}$ denotes the long-time mean bath-heat rate of that active subfamily, as in Corollary N.5.2. The Landauer lower-bound scale is
$$
P_{\mathrm{UCT}}^{\mathrm{LB}}(a)
:=q_{\mathrm{act}}k_BT_U\frac{\mathcal I_{\mathrm{rel}}}{2q\tau_{\min}}
=q_{\mathrm{act}}\frac{c}{2\pi}ma.
$$
Every physical implementation on that branch satisfies $\dot Q_{\mathrm{act}}\ge P_{\mathrm{UCT}}^{\mathrm{LB}}(a)$. The equality
$$
P_{\mathrm{UCT}}(a)=q_{\mathrm{act}}\frac{c}{2\pi}ma
$$
is available only on an additional same-rate reversible-limit certificate satisfying the equality and compatibility clause of Corollary N.5.2. These are compatibility statements, not independent derivations of $\mathfrak C_{\mathrm{mech}}$, the mechanical inertial coefficient, or a force law.

*Proof.* The mechanical-realization certificate identifies the retained response coefficient with the rest-action coefficient, and Theorem N.5 gives
$$
m=\frac{\hbar\mathcal I_{\mathrm{rel}}}{2qc^2\tau_{\min}}.
$$
On the thermodynamic branch, Corollary N.5.2 and $k_BT_U=\hbar a/(2\pi c)$ give
$$
\dot Q_{\mathrm{act}}
\ge q_{\mathrm{act}}k_BT_U\frac{\mathcal I_{\mathrm{rel}}}{2q\tau_{\min}}
=q_{\mathrm{act}}\frac{\hbar a}{2\pi c}\frac{\mathcal I_{\mathrm{rel}}}{2q\tau_{\min}}
=q_{\mathrm{act}}\frac{c}{2\pi}ma.
$$
Equality is exactly the additional reversible-limit overlap condition. The final expression substitutes the already accepted mass coefficient and therefore proves compatibility only. ∎

<a id="proposition-n6a-mechanical-scale-modulus-before-response-calibration"></a>**Proposition N.6a (Mechanical Scale Modulus before Response Calibration).** Register a nonempty relational-pattern history, its source-exhaustive update ledger, and a positive relational mass coefficient $m_{\mathrm{rel}}$. Let $Q$ be a nonempty open subset of $\mathbb R^d$ with its Euclidean metric, where $d\ge1$, and let $U:Q\to\mathbb R$ be continuously differentiable. Admit local classical trajectories with at least one initial condition $(q_0,v_0)$ having $v_0\ne0$. For every dimensionless $\lambda>0$, define
$$
L_\lambda(q,\dot q)
=\lambda\left(\frac{m_{\mathrm{rel}}}{2}\|\dot q\|^2-U(q)\right).
\tag{N.6a.1}
$$
All members have the same classical solution set for the same initial data on their common existence intervals:
$$
m_{\mathrm{rel}}\ddot q=-\nabla U(q).
\tag{N.6a.2}
$$
They leave the registered relational state, mutual-information value and update count unchanged, while
$$
p_\lambda=\lambda m_{\mathrm{rel}}\dot q.
\tag{N.6a.3}
$$
Thus the relational and trajectory data alone do not determine the momentum-response coefficient. A unit coefficient requires an independent momentum/source calibration or an axiom removing this scaling freedom.

*Proof.* A positive constant multiplying the Lagrangian cancels from its Euler--Lagrange equation, so the solution sets coincide; uniqueness or global existence is not asserted. The continuous force gives a local classical solution for the admitted initial data, and differentiation with respect to velocity gives (N.6a.3). At the nonzero initial velocity, distinct values of $\lambda$ give distinct canonical momenta. The registered relational data contain no $\lambda$ coordinate. In particular $\lambda=1$ and $\lambda=2$ give inequivalent realizations under the stated momentum-response test. ∎

<a id="proposition-n6b-relativistic-free-action-rigidity-and-mechanical-scale-fixing"></a>**Proposition N.6b (Relativistic Free-Action Rigidity and Mechanical Scale Fixing).** Work in Minkowski spacetime with $x^0=ct$ and $\eta=\operatorname{diag}(-1,1,1,1)$, and let $\mathcal C^+:=\{\dot x:\eta(\dot x,\dot x)<0,\ \dot x^0>0\}$ be the future timelike cone. Let $F:\mathcal C^+\to\mathbb R$ be $C^1$, invariant under the restricted Lorentz group and positively homogeneous of degree one, $F(s\dot x)=sF(\dot x)$ for $s>0$; homogeneity is the reparametrization invariance of the free worldline action $S=\int F(dx/d\sigma)\,d\sigma$. Then:

1. There is a constant $\kappa\in\mathbb R$ with $F(\dot x)=-\kappa\sqrt{-\eta(\dot x,\dot x)}/c$, so $S=-\kappa\int d\tau$ along every future timelike worldline.
2. In laboratory time the Lagrangian is $L=-\kappa\sqrt{1-|\mathbf v|^2/c^2}$, the canonical momentum is $\mathbf p=\kappa\gamma\mathbf v/c^2$, the energy is $\kappa\gamma$, the rest-action rate is $|dS/d\tau|=|\kappa|$, and
   $$
   L=-\kappa+\frac{\kappa}{2c^2}|\mathbf v|^2+O\!\left(\frac{\kappa|\mathbf v|^4}{c^4}\right).
   \tag{N.6b.1}
   $$
   The momentum-response coefficient is therefore $\kappa/c^2$, which for $\kappa>0$ is the rest-action rate divided by $c^2$.
3. The free member ($U=0$, $d=3$) of the family (N.6a.1) has the relativistic completion $S_\lambda=-\lambda m_{\mathrm{rel}}c^2\int d\tau$, whose Lagrangian is $\lambda\frac{m_{\mathrm{rel}}}2|\dot q|^2$ up to the constant $-\lambda m_{\mathrm{rel}}c^2$ and higher orders in $|\dot q|/c$, and whose rest-action rate is $\lambda m_{\mathrm{rel}}c^2$. If the certified action of item 4 of Theorem N.5 is this free worldline action and $m_{\mathrm{rel}}$ is the coefficient $m$ of (N.26), then Equations (N.28)--(N.30) of Theorem N.5 fix its rest-action rate as $mc^2$, so $\lambda mc^2=mc^2$, $\lambda=1$ and $\mathbf p=\gamma m\mathbf v$. On that identification branch the retained momentum response of a free body has the coefficient of (N.26), which is clause (ii) of $\mathfrak C_{\mathrm{mech}}$ in Theorem N.6 for free bodies.
4. Without the rest-action identification the modulus of Proposition N.6a remains: every $\kappa>0$ gives the same free worldlines, the straight future timelike lines, and the registered relational data contain no $\kappa$ coordinate.

*Proof.* (1) For $N>0$ the restricted Lorentz group acts transitively on the hyperboloid $\{\dot x\in\mathcal C^+:-\eta(\dot x,\dot x)=N^2\}$, since a boost carries each of its points to $(N,0,0,0)$. Invariance makes $F$ constant on each hyperboloid, $F(\dot x)=h(N)$ with $N=\sqrt{-\eta(\dot x,\dot x)}$, and homogeneity gives $h(sN)=sh(N)$, hence $h(N)=Nh(1)$. Put $\kappa:=-c\,h(1)$. Along a worldline parametrized by $\sigma$, $\sqrt{-\eta(\dot x,\dot x)}=c\,d\tau/d\sigma$, which gives $S=-\kappa\int d\tau$. (2) With $\sigma=t$, $\dot x=(c,\mathbf v)$ and $\sqrt{-\eta(\dot x,\dot x)}=c\sqrt{1-|\mathbf v|^2/c^2}$. Differentiation gives $\mathbf p$, the Legendre transform $\mathbf p\cdot\mathbf v-L=\kappa\gamma$ gives the energy, and Taylor expansion of the square root gives (N.6b.1) with the next term $\kappa|\mathbf v|^4/(8c^4)$. (3) Item 2 with $\kappa=\lambda m_{\mathrm{rel}}c^2$ gives the displayed Lagrangian, momentum and rest-action rate. Equations (N.28)--(N.30) fix the rest-action rate of the certified action as $mc^2$, and $m>0$ gives $\lambda=1$. (4) For $\kappa\ne0$ the Euler--Lagrange equation $d(\kappa\gamma\mathbf v)/dt=0$ gives constant $\mathbf v$ for every $\kappa$, and Proposition N.6a records that the relational data carry no scale coordinate. ∎

<a id="theorem-n6c-prepared-rateq-body-confined-mode-source-and-signed-action-recovery"></a>**Theorem N.6c (Prepared Rate(q) Body, Confined-Mode Source and Signed Action Recovery).**

#### 1. Exact predicate and independently fixed coordinates

The relational-inertia realization requires the physical-source identification, its interacting/bound-body extension, and the common response and observable realization. Theorem N.5 explicitly allows \(q\in(0,1]\); it requires (i) common certified boundary values, (ii) saturated concurrent source-exhaustive cycles, (iii) independent \(C_*=2\varepsilon_0\), (iv) the same-cycle action identification from Q.0.1 after action-unit, recovery, normalization and source-overlap certification, and (v) stationarity. N.6 requires the relational-pattern-to-cycle map and the actual momentum/acceleration coefficient. These are the obligations tested below.

Register positive physical constants \(\hbar,c,A\). The clock energy gap \(A\) is fixed before selecting a preparation. On the pair \(S_iE_i\), let
\[
H_{C,i}=A\Pi_i,\quad \Pi_i=|11\rangle\langle11|,
\qquad
\psi_p=\sqrt{1-p}|00\rangle+\sqrt p|11\rangle,
\quad 0<p<1.
\tag{N.6c.P1}
\]
There are two variants, indexed by an independently fixed \(E_0\ge0\): an unbound cell with \(E_0=0\), and a cell carrying the positive-ground-energy confined mode constructed in §4. Its stationary ground vector is denoted \(\zeta_0\). The full cell rest generator and initial state are
\[
K_i=H_{C,i}\otimes I+I\otimes K_{B,i},\qquad
\Psi_{p,i}=\psi_p\otimes\zeta_0,
\quad K_{B,i}\zeta_0=E_0\zeta_0.
\tag{N.6c.P2}
\]
For the unbound variant, the auxiliary is one-dimensional with zero generator. The physical energy reference is fixed in these operators. The actual cell mean energy is \(E(p)=Ap+E_0\); its value is not defined from relational information or a desired mass.

For a body of \(N\ge1\) identical independently owned cells, use the tensor product state and \(K=\sum_iK_i\). The declared worldline source is the scalar internal-state action
\[
S[x,\Psi]=\int\left[\frac{i\hbar}{2}(\langle\Psi,d\Psi\rangle-\langle d\Psi,\Psi\rangle)
-\langle\Psi,K\Psi\rangle d\tau\right]+S_{\rm ext}[x].
\tag{N.6c.P3}
\]
The energy reference, normalization and physical proper clock are retained. Fixed-internal-population endpoint Legendre reduction is used, with the explicit endpoint calculation below. It gives
\[
S_R=S_{R,\rm src}+S_{\rm ext},\qquad S_{R,\rm src}=-E_N\int d\tau,\qquad E_N=N(Ap+E_0).
\tag{N.6c.P4}
\]
The source coupling is fixed before the calibration test below. No extra scalar rest term is silently fitted or discarded. Its input domain consists of a classical timelike worldline and a normalized quantum internal state; the force couples to that worldline and leaves the internal populations fixed. This is an explicit hybrid physical model, not an unspecified claim that every quantum clock carries this mechanical action.

#### 2. W4-N6: all-p boundary, clock and calibration classification

Put \(h(p)=-p\ln p-(1-p)\ln(1-p)\). For every \(0<p<1\),
\[
\Psi_{p,i}(\tau)=e^{-iE_0\tau/\hbar}
\left(\sqrt{1-p}|00\rangle+\sqrt p\,e^{-iA\tau/\hbar}|11\rangle\right)\otimes\zeta_0.
\tag{N.6c.P5}
\]
The pair Schmidt eigenvalues are \(1-p,p\), so
\[
I_i=2h(p),\quad C_i^{\rm rel}=2\ln2,\quad
q_i=q(p)=h(p)/\ln2\in(0,1],\qquad
I_{\rm rel}=2Nh(p).
\tag{N.6c.P6}
\]
The capacity record is independent of \(p\): for all states of a qubit environment with the finite entropies used in Definition N.6, Araki–Lieb gives \(I(S_i:E_i)\le2S(E_i)\le2\ln2\). A Bell pair tensor the same bound-mode ground attains it. In the bound variant the mode belongs to \(S_i\); its product pure state contributes no entropy, so all three entropies remain finite. Product factorization across cells proves every subfamily identity \(I(S:E_J)=2|J|h(p)\) and absence of repeated boundary terms.

The actual pair return fidelity is
\[
|\langle\psi_p,\psi_p(\tau)\rangle|^2
=1-4p(1-p)\sin^2\!\left(\frac{A\tau}{2\hbar}\right).
\tag{N.6c.P7}
\]
Since \(p(1-p)>0\), the first positive ray return is exactly
\[
T=2\pi\hbar/A.
\tag{N.6c.P8}
\]
The stationary bound ground changes only the overall phase, so it does not change this event. Register the same first-return convention as N.4.0c and one binary structural support label per completed cycle, with \(\varepsilon_0=\ln2\). Then
\[
N_i(\tau)=\lfloor\tau/T\rfloor,\qquad
\dot\varepsilon_\partial=N\ln2/T.
\tag{N.6c.P9}
\]
The cell generators act on disjoint factors and their periods and counts depend only on local data. Independent local sources therefore run concurrently; no serialized server or shared energy supply limits the rate. Equal numerical gaps do not mean that a single service resource performs all cycles.

The normalization \(C_*=2\varepsilon_0\) follows from the separately proved qubit capacity and the registered binary structural alphabet. It does not identify structural increments with erased entropy or heat.

**Calibration theorem.** For the fixed source class (N.6c.P1)–(N.6c.P3), equality of the actual rest-action rate and the original update rate holds if and only if
\[
E_N=\hbar\dot\varepsilon_\partial
\quad\Longleftrightarrow\quad
p+\frac{E_0}{A}=\kappa,
\qquad \kappa:=\frac{\ln2}{2\pi}.
\tag{N.6c.P10}
\]
For \(E_0\ge0\), there is exactly one admissible preparation iff \(E_0/A<\kappa\), namely
\[
p_*=\kappa-E_0/A.
\tag{N.6c.P11}
\]
Indeed \(0<\kappa<1/2\), so this condition is equivalent to \(0<p_*<1\). At \(E_0/A=\kappa\), the formal solution \(p=0\) has zero mutual information, $q=0$ and no nontrivial first-return cycle, and is excluded. Above that threshold no positive probability solves the equation.

*Proof.* Substitute the independently calculated \(E_N=N(Ap+E_0)\) and (N.6c.P8)–(N.6c.P9), cancel \(NA>0\), and solve the strictly increasing affine equation. This classifies all preparations, not merely a fitted example. ∎

At the selected physical state,
\[
m_I=\frac{E_N}{c^2}
=\frac{N\hbar\ln2}{c^2T}
=\frac{\hbar I_{\rm rel}}{2q(p_*)c^2T}.
\tag{N.6c.P12}
\]
The last equality uses the actually measured Schmidt entropy and its independent capacity. It does not set q to one. In fact \(p_*<1/2\), so q is strictly below one.

#### 3. Owned preparation and independent action-unit calibration

The probability in (N.6c.P11) is a **physical excitation probability**, \(p_*={\rm Tr}(\rho\Pi_i)\), invariant under simultaneous conjugation of source and state. It is not a renamed information coordinate. Let \(\theta_*:=\arcsin\sqrt{p_*}\in(0,\pi/2)\), and start the pair in the registered zero-energy vector \(|00\rangle\). For a chosen positive preparation time \(t_p\), set
\[
B_p=\hbar\theta_*/t_p,\quad
Y_L=i(|11\rangle\langle00|-|00\rangle\langle11|),\quad
H_p=B_p(I+Y_L).
\tag{N.6c.P13}
\]
The eigenvalues of \(H_p\) are \(0,2B_p,B_p,B_p\), so the pulse Hamiltonian is nonnegative. Preparation is performed at rest, so its laboratory and proper durations agree. During the pulse the owned controller replaces \(A\Pi_i\) by \(H_p\), equivalently supplying the explicit control \(V_p=H_p-A\Pi_i\). The bound Hamiltonian stays on. Direct exponentiation gives
\[
e^{-iH_pt_p/\hbar}|00\rangle
=e^{-i\theta_*}\bigl(\cos\theta_*|00\rangle+\sin\theta_*|11\rangle\bigr).
\tag{N.6c.P14}
\]
Switching back to \(A\Pi_i\) leaves exactly the desired state up to a global phase, with the physical post-preparation energy reference restored.

The controller's work on the pair is explicitly owned:

| Stage | Work into pair | Reason |
|---|---:|---|
| Switch on | \(B_p\) | Initial energy changes from 0 to \(\langle00\vert H_p\vert00\rangle\) |
| Hold pulse | 0 | Constant Hamiltonian; its mean energy is conserved |
| Switch off | \(Ap_*-B_p\) | Final energy changes from \(B_p\) to \(Ap_*\) |
| Total | \(Ap_*\) | Exactly the retained excitation energy |

Negative switch-off work is recovered by the controller rather than erased from the ledger. The controller is decoupled before the stationary common run begins, so it supplies no hidden ongoing clock drive or body mass. Its pulse duration, gap and switching work remain setup resources. This is a controlled preparation protocol, not an autonomous preparation claim.

The action unit is independently registered by quantum phase calibration: measure the source gap \(A\) using its eigenstate energy difference and measure the relative phase frequency \(\omega\) on a nonzero-visibility two-level calibration preparation. The source evolution gives \(\omega=A/\hbar\), so the registered ratio \(A/\omega=\hbar\) fixes \(\kappa_A\) before choosing \(p_*\) or constructing the structural ledger. Neither \(\ln2\), \(q\), nor the desired mass is used to infer this action scale. Calibration preparations and their work are separately owned setup runs.

#### 4. A genuinely confined mode with fixed positive ground energy

Fix \(\mu>0\) independently. Before solving for \(p\), choose the rational device ratios
\[
E_c=A/32,\quad B=A/64,\quad
\Omega=A/(32\hbar).
\tag{N.6c.P15}
\]
On \(L^2(\mathbb R,dq_B)\), let
\[
K_B=E_c-B+\frac{\widehat\pi_B^2}{2\mu}
+\frac{\mu\Omega^2\widehat q_B^2}{2}.
\tag{N.6c.P16}
\]
Define it by its Hermite diagonal self-adjoint realization, with eigenvalues \(E_0+n\hbar\Omega\) and domain \(\sum_n(E_0+n\hbar\Omega)^2|c_n|^2<\infty\). Its independently fixed positive ground energy is
\[
E_0=E_c-B+\hbar\Omega/2=A/32.
\tag{N.6c.P17}
\]
The source ledger charges constituent rest energy, negative binding depth, kinetic zero-point energy and potential zero-point energy exactly once. The normalized ground wavefunction and retained width are
\[
\zeta_0(q_B)=\left(\frac{\mu\Omega}{\pi\hbar}\right)^{1/4}
e^{-\mu\Omega q_B^2/(2\hbar)},\qquad
\langle q_B^2\rangle=\frac{\hbar}{2\mu\Omega}.
\tag{N.6c.P18}
\]
This is an occupied confining interaction, not an uncharged spectator or a finite label called a bound state. The whole cell generator remains positive. Since \(\ln2>1/2\) and \(\pi<4\), \(\kappa>1/16>1/32\), so the uniquely calibrated pair state exists and has
\[
p_*^{\rm bound}=\frac{\ln2}{2\pi}-\frac1{32}>0.
\tag{N.6c.P19}
\]
The body energy is \(A(p_*^{\rm bound}+1/32)=A\kappa\), while its q is the actual \(h(p_*^{\rm bound})/\ln2\). No oscillator or mass parameter is altered after this preparation is selected.

#### Owned ground-state preparation

One may supply the verified ground state as a named input resource carrying energy \(E_0\). An explicit unitary transfer from a separately owned reference ground is also available. Put \(\Omega_0=4\Omega\), \(t_B=32/\Omega_0\), \(s=t/t_B\), and
\[
b(t)=1+10s^3-15s^4+6s^5,\qquad
\omega_B(t)^2=\frac{\Omega_0^2}{b(t)^4}-\frac{\ddot b(t)}{b(t)}.
\tag{N.6c.P20}
\]
For \(0\le s\le1\), \(1\le b\le2\), \(b_s'=30s^2(1-s)^2\ge0\), \(|b_s''|\le15\), and both first and second derivatives vanish at the endpoints. Hence
\(\omega_B(t)^2\ge\Omega_0^2/16-15/t_B^2=49\Omega_0^2/1024>0\).
The positive controlled oscillator
\[
K_B(t)=E_c-B+\widehat\pi_B^2/(2\mu)+\mu\omega_B(t)^2\widehat q_B^2/2
\]
has the exact normalized Gaussian solution
\[
\zeta(q_B,t)=\left(\frac{\mu\Omega_0}{\pi\hbar}\right)^{1/4}b^{-1/2}
\exp\left[-\frac{\mu\Omega_0q_B^2}{2\hbar b^2}
+\frac{i\mu\dot b q_B^2}{2\hbar b}
-\frac i2\int_0^t\frac{\Omega_0}{b(u)^2}du
-\frac{i(E_c-B)t}{\hbar}\right].
\tag{N.6c.P21}
\]
Substitution into the Schrödinger equation gives precisely the relation in (N.6c.P20). At the endpoints this transfers the \(\Omega_0\) ground to the \(\Omega\) ground up to phase. The reference resource initially carries
\(E_{{\rm ref}}=E_c-B+\hbar\Omega_0/2=5A/64\), and the controller's net work is
\(E_0-E_{{\rm ref}}=-3A/64\), recovered into its owned work store. No reset or heat equality is assumed. All these controls end before the first-return common run; the stationary source after preparation is exactly (N.6c.P2).

#### 5. The finite additive ledger is built from the clock, before the source match

The physical phase lift is \(\vartheta(\tau)=A\tau/\hbar\), measured from the prepared state at \(\tau=0\). Its observable coordinates are
\[
\langle X_SX_E\rangle=2\sqrt{p(1-p)}\cos\vartheta,\quad
\langle X_SY_E\rangle=-2\sqrt{p(1-p)}\sin\vartheta,\quad
\langle\Pi\rangle=p.
\tag{N.6c.P22}
\]
Because the visibility is nonzero, the continuous positive unwrap of \(\arg(\langle XX\rangle-i\langle XY\rangle)\) recovers the phase and the first-return events. This is an ensemble-history coordinate, not an unmodeled single-sample continuous measurement.

Register a continuous additive phase-progress ledger \(F:\mathbb R_{\ge0}\to\mathbb R\), with \(F(u+v)=F(u)+F(v)\) and full-return normalization \(F(2\pi)=\ln2\). These two properties uniquely imply
\[
F(\vartheta)=\frac{\ln2}{2\pi}\vartheta.
\tag{N.6c.P23}
\]
Indeed additivity proves the formula first for rational multiples of \(2\pi\), and continuity extends it to every nonnegative phase. The record uses only the independently registered binary full-cycle value and the actual phase; it contains no \(p\), \(E_0\) or target mass.

For a finite history with accumulated proper time \(\tau\), its positive accrued value decomposes exactly as
\[
N F(A\tau/\hbar)
=N\ln2\lfloor\tau/T\rfloor
+N\ln2\{\tau/T\}.
\tag{N.6c.P24}
\]
The first term is the completed-update ledger. The second is the explicitly owned unfinished endpoint fraction, bounded by \(N\ln2\), not an additional completed update. It disappears after division by a long proper-time horizon. A partition may split a cycle into several history segments, but additivity preserves its single \(\ln2\) contribution.

There are two typed orientations: \(\mathcal L^+\) is the positive accrued structural magnitude; \(\mathcal L^-=-\mathcal L^+\) is its oriented rest-action ledger. The physical source uses \(S_{R,\rm src}=\hbar\mathcal L^-\) on the calibrated branch; N.5 uses \(|dS_{R,\rm src}/d\tau|=\hbar\dot\varepsilon_\partial\). The sign is not hidden in a negative mass. Q.0.1 allows a declared additive dimensionless history ledger; both oriented values and their structural-magnitude map are registered explicitly here. The next theorem proves recovery for both, so no minimizer of the positive magnitude is substituted for a minimizer of the signed mechanical action.

#### 6. W4-N7: nonquadratic same-source recovery with retained response control

Fix a laboratory horizon \(L>0\), endpoints \(x_a,x_b\in\mathbb R^d\), a speed budget \(v_*<c\) and a velocity-variation budget \(0\le V<\infty\), with \(|x_b-x_a|<Lv_*\). Let
\[
\mathcal K=\{x\in W^{1,1}([0,L];\mathbb R^d):x(0)=x_a,x(L)=x_b,
\ \|\dot x\|_\infty\le v_*,\ \dot x\in BV,\ {\rm TV}(\dot x)\le V\}.
\tag{N.6c.P25}
\]
Use strong \(W^{1,1}\) topology. Set \(f(v)=\sqrt{1-|v|^2/c^2}\), \(\tau[x]=\int_0^Lf(\dot x)dt\), \(r=N\ln2/T\), and \(\gamma_*=(1-v_*^2/c^2)^{-1/2}\). On the uniform dyadic mesh of size \(h_n=L2^{-n}\), let \(\mathcal K_n\) be the piecewise-affine members of \(\mathcal K\). For \(s\in\{+1,-1\}\), define
\[
\mathcal L_n^s[x]=s r\sum_jh_n f(v_j)
\quad(x\in\mathcal K_n),\qquad
\mathcal L^s[x]=s r\tau[x]\quad(x\in\mathcal K),
\tag{N.6c.P26}
\]
and extend by \(+\infty\) elsewhere. Each finite term in (N.6c.P26) is the actual signed clock phase-progress increment on that inertial segment, by (N.6c.P23), not a discretized mass formula chosen later.

**Recovery claim.** Both signs satisfy equicoercive \(\Gamma\)-convergence \(\mathcal L_n^s\to\mathcal L^s\). The nodal interpolants \(I_nx\) form an explicit recovery sequence for every \(x\in\mathcal K\), with
\[
\|\dot I_nx-\dot x\|_1\le h_nV,\qquad
\|I_nx-x\|_\infty\le h_nV,
\quad
|\tau[I_nx]-\tau[x]|\le\frac{\gamma_*v_*}{c^2}h_nV.
\tag{N.6c.P27}
\]
Every finite ledger has a minimizer and their minimizing cluster points minimize its corresponding limit. The signed free action has the unique straight-line minimizer. On the explicit two-sided admissible tangent domains below, the first variations also converge quantitatively.

*Proof.* Bounded sets of BV functions with a common \(L^\infty\) bound are compact in \(L^1\). Their integrals with fixed initial point are therefore compact in \(W^{1,1}\). Lower semicontinuity of total variation, the speed bound and endpoint continuity make \(\mathcal K\) closed, hence compact. It contains every finite admissible domain, proving equicoercivity.

For a nodal interpolant, its velocity on a cell is the average of \(\dot x\) on that cell. Convexity of the speed ball preserves \(v_*\). If \(a_j\) denotes these averages, then
\[
\sum_j|a_{j+1}-a_j|
\le\frac1{h_n}\int_0^{L-h_n}|\dot x(t+h_n)-\dot x(t)|dt
\le {\rm TV}(\dot x).
\]
The usual BV translation estimate follows directly by integrating the variation measure over intervals of length \(h_n\). The same measure estimate within each cell gives \(\|\dot I_nx-\dot x\|_1\le h_nV\). Endpoints are preserved because cell integrals are preserved; integrating the velocity error gives the position bound. On the speed ball, \(|\nabla f|\le\gamma_*v_*/c^2\), proving the proper-time bound and recovery convergence.

The functional \(\tau\) is continuous on \(\mathcal K\) in the declared topology by that same Lipschitz estimate. Consequently every converging sequence with finite liminf has its limit in \(\mathcal K\) and satisfies the liminf inequality for either sign. Nodal recovery proves the matching limsup. The finite domains are compact and nonempty, and their continuous functionals have minimizers. The fundamental \(\Gamma\)-convergence conclusion applies. Finally \(f\) is strictly concave on the speed ball, so Jensen gives \(\tau[x]\le Lf((x_b-x_a)/L)\), with equality only for constant velocity. This proves uniqueness for \(\mathcal L^-\), not for \(\mathcal L^+\). ∎

#### First variations and actual response

The compact budgeted set \(\mathcal K\) has no open interior in strong \(W^{1,1}\), so no ambient-interior assertion is used. A concrete two-sided tangent regime is: the base path has strict margins \(\|\dot x\|_\infty\le v_*-\delta_v\) and \({\rm TV}(\dot x)\le V-\delta_V\), with \(\delta_v,\delta_V>0\); the variation has zero endpoints and \(\dot y\in BV\cap L^\infty\). For
\[
|\epsilon|<\min\{\delta_v/\|\dot y\|_\infty,\ \delta_V/{\rm TV}(\dot y)\},
\]
omitting a ratio with zero denominator, both \(x+\epsilon y\) and \(I_nx+\epsilon I_ny\) belong to their corresponding admissible domains. This follows from the triangle inequality and the same averaging/variation bounds proved above. More generally an explicitly supplied two-sided admissible tangent interval suffices. When \(V=0\), this statement only uses the available tangents; one can enlarge a predeclared finite budget to admit a particular bounded-variation compactly supported test variation. On this regime,
\[
D\mathcal L^-[x][y]
=\frac r{c^2}\int_0^L\gamma(\dot x)\dot x\cdot\dot y\,dt.
\tag{N.6c.P28}
\]
The map \(v\mapsto\gamma(v)v\) is Lipschitz on the speed ball with constant \(\gamma_*^3\). If \(x_n\to x\) and \(y_n\to y\) strongly in \(W^{1,1}\), and \(\|\dot y_n\|_\infty\le M_y\), the derivative difference is bounded by
\[
\frac r{c^2}\left(\gamma_*^3M_y\|\dot x_n-\dot x\|_1
+\gamma_*v_*\|\dot y_n-\dot y\|_1\right)\longrightarrow0.
\tag{N.6c.P29}
\]
Nodal variation recovery supplies this condition for every fixed Lipschitz tangent variation. Thus Theorem N.6c does not rely on \(\Gamma\)-convergence alone to transfer stationary response.

The path budget has a physical force interpretation. In the independently derived response (N.6c.P3), finite total impulse bounds \(p\), hence gives a strict subluminal velocity bound; the inverse momentum map has derivative norm at most \(c^2/E_N\), so it also bounds total velocity variation. Conversely each polygon is realized by finitely many owned momentum kicks between its inertial segments. On the stated speed ball the required total kick magnitude is bounded by \((E_N\gamma_*^3/c^2)(V+2v_*)\), including preparation from rest and return to rest if requested. Each kick's work is the actual change in \(\gamma E_N\); it is an external-source entry, not an uncounted internal update.

#### Source and clock convergence

Every polygon uses the same fixed generator and prepared state. Its proper-time segment duration is exactly \(h_nf(v_j)\), so its internal propagator is the product of the actual commuting increments \(e^{-iK h_nf(v_j)/\hbar}\). Their product is \(e^{-iK\tau[I_nx]/\hbar}\). The initial state lies in a finite occupied spectral subspace even in the ground-mode variant; the maximum occupied body energy is \(N(E_0+A)\). Hence
\[
\|\Psi(\tau[I_nx])-\Psi(\tau[x])\|
\le\frac{N(E_0+A)}{\hbar}|\tau[I_nx]-\tau[x]|.
\tag{N.6c.P30}
\]
Expectation values of every bounded retained effect therefore converge with a certified bound. The same proper-time error bound is uniform at every intermediate laboratory time, because the prefix error is bounded by the full velocity L1 error in (N.6c.P27). Phase and proper-time errors are therefore controlled by (N.6c.P27). Completed counts are stable away from return thresholds. Individual interior return times converge with an error bounded by the uniform proper-clock error times \(\gamma_*\), since \(d\tau/dt\ge1/\gamma_*\); no uniform-in-time convergence of discontinuous count staircases is asserted.

The source overlap concerns the source-only Routh action \(S_{R,\rm src}=S_R-S_{\rm ext}\). External controls are owned separately, including the kicks that realize polygons. This source overlap is historywise, not only numerical at a single cycle:
\[
S_{R,\rm src}[x]-\hbar\mathcal L^-[x]
=-\left(E_N-\frac{N\hbar\ln2}{T}\right)\tau[x].
\tag{N.6c.P31}
\]
By W4-N6 this residual vanishes for every admissible history exactly at the physically prepared \(p_*\). The same equality holds on every discrete polygon. Together with independently calibrated \(\kappa_A=\hbar\), (N.6c.P26)–(N.6c.P31) populate Q.0.1's topology, equicoercivity, liminf, recovery, history ledger, normalization and source-overlap gates. The positive orientation gives the recovered action magnitude; the negative orientation is the actual mechanical rest action, with N.5's absolute rate map linking the two.

#### 7. Mechanical and retained observable map

Vary (N.6c.P3) before substituting the state equation. The Berry term has no velocity dependence at fixed internal curve; the source term gives
\[
p_{\rm kin}=\gamma E_Nv/c^2,\quad
\mathcal E_{\rm lab}=\gamma E_N,\quad
\frac{dp_{\rm kin}}{dt}=F,\quad
F=\frac{E_N}{c^2}\gamma\left(I+\frac{\gamma^2vv^{\mathsf T}}{c^2}\right)\dot v.
\tag{N.6c.P32}
\]
From rest with \(J(t)=\int_0^tF(s)ds\),
\[
v(t)=\frac{c^2J(t)}{\sqrt{E_N^2+c^2|J(t)|^2}},\quad
\tau(t)=\int_0^t\frac{ds}{\gamma(s)},\quad
N_i(t)=\lfloor\tau(t)/T\rfloor.
\tag{N.6c.P33}
\]
The source-only lab energy is distinguished from any external force potential; its change is the supplied work \(\int F\cdot v\,dt\). Fixed-population Routh endpoint terms are exactly those computed below. In the bound ground variant the occupied state is in every power domain, so no unbounded-operator differentiation gap occurs.

The complete retained coordinates are the independently measured gap and frequency \((A,\omega)\), physical excitation \(p_*\), pair phase quadratures (N.6c.P22), exact Schmidt entropy/capacity/utilization, completed return events and endpoint progress, bound width and energy entries when present, worldline position/momentum/velocity, supplied impulse and work, and the actual source energy. At (N.6c.P11), (N.6c.P32) has exactly the coefficient (N.26). Thus the preparation, cycle, recovery and momentum maps use one source rather than parallel adjustable ledgers.

#### Berry phase, boundary terms and the different quantum momentum protocol

For one cell write the occupied components as \(\sqrt{w_a}e^{-i\theta_a}\), with \(w_0=1-p,w_1=p\), energies \(k_0=E_0,k_1=E_0+A\), and conserved occupation actions \(J_a=\hbar w_a\). The unreduced action is
\[
S_{\rm int}=\int\left(\sum_aJ_a\dot\theta_a-E(p)\dot\tau\right)dt.
\tag{N.6c.P34}
\]
Before elimination, variation of the occupations gives \(\dot\theta_a=k_a\dot\tau/\hbar\), modulo the common normalization gauge; variation of phases conserves the occupations. For fixed occupation endpoints, the Routh transformation subtracts the endpoint term
\( [\sum_aJ_a\theta_a]_0^L\), making \(S_{R,\rm src}=-E(p)\tau\). Its variation cancels the phase endpoint term and leaves exactly the momentum in (N.6c.P32). Fixed phase endpoints instead describe a different boundary-value problem; silently discarding its boundary phase is invalid.

On a Schrödinger solution, the two integrands in (N.6c.P34) cancel and the unreduced internal action is zero. After a full pair return, the actual internal propagator on the prepared vector gives only the global phase \(-E_0T/\hbar\). The mean dynamical phase is \(-(E_0+Ap)T/\hbar\), and the ray geometric phase is \(2\pi p\) modulo \(2\pi\). Their sum is \(-E_0T/\hbar\). Thus the mean-energy Routh phase is not the full interferometric return phase. In particular the unbound calibrated cell has \(U(T)\psi_{p_*}=\psi_{p_*}\), while its mechanical Routh action divided by \(\hbar\) is \(-\ln2\). Neither statement contradicts the other: they refer to different retained response/boundary protocols.

A precise diagnostic prevents overextending (N.6c.P32). On the occupied two-level subspace of the bound variant, \(K\ge E_0I>0\). The alternative fully quantum free centre-of-mass model
\[
\widehat H(P)=\sqrt{c^2|P|^2+K^2}
\quad\hbox{on }L^2(\mathbb R^d,dP)\otimes\mathcal H_{\rm occ}
\tag{N.6c.P35}
\]
is a positive self-adjoint multiplication operator on its natural square-integrability domain. Its velocity operator is the bounded multiplication operator
\(\widehat V=c^2P/\sqrt{c^2|P|^2+K^2}\), obtained by differentiating its spectral fibers. A momentum impulse acting identically on the internal energy sectors translates every sector by the same \(J\). Starting with momentum measures tending to a $\delta$ mass at zero gives the rigorous narrow-packet limit
\[
\bar v(J)=(1-p)\frac{c^2J}{\sqrt{E_0^2+c^2|J|^2}}
+p\frac{c^2J}{\sqrt{(E_0+A)^2+c^2|J|^2}},
\qquad
D\bar v(0)=c^2\left(\frac{1-p}{E_0}+\frac p{E_0+A}\right)I.
\tag{N.6c.P36}
\]
The limit follows from bounded continuity of the velocity fibers. The small-impulse inertial coefficient is therefore
\[
m_{\rm common\ impulse}
=\left[c^2\left(\frac{1-p}{E_0}+\frac p{E_0+A}\right)\right]^{-1}
<\frac{E_0+Ap}{c^2}\qquad(0<p<1,A>0).
\tag{N.6c.P37}
\]
The strict inequality is the weighted harmonic/arithmetic mean inequality. No physical positive-variance wavepacket is silently replaced by an exact momentum eigenvector; (N.6c.P36) is explicitly a limit of normalizable preparations. Their finite-width responses are the corresponding integrals of the displayed bounded fibers. For \(E_0=0\), the occupied zero-energy branch has the massless \(c^2J/(c|J|)\) response for \(J\ne0\), so this common-impulse protocol has no finite derivative at the origin.

By contrast, the sharp **common-velocity** spectral protocol uses sector-dependent momenta \(P_a=\gamma(v)k_av/c^2\). Directly,
\[
\sum_aw_aP_a=\gamma(v)E(p)v/c^2,\qquad
\sum_aw_a\sqrt{k_a^2+c^2|P_a|^2}=\gamma(v)E(p).
\tag{N.6c.P38}
\]
These are exact identities of the sharp fiber protocol and limiting values of appropriately narrow sector-conditioned packets. They do not make (N.6c.P36) equal to (N.6c.P32), and do not by themselves certify preservation of the original reduced clock state under a quantum boost. A finite-width quantum centre of mass generally carries additional motion energy and can entangle with the clock. A claimed full quantum body must retain those sources, widths, preparations and reduced-state maps separately.

The mechanical content of Theorem N.6c is accordingly the exact variation and externally driven classical-worldline response of (N.6c.P3), with its declared fixed-population endpoint protocol. The internal energy, entanglement and return-time calculations do not alone derive (N.6c.P3). The distinction is part of the physical input domain and cannot be removed by renaming an inertial coefficient.

<a id="theorem-n6d-arbitrary-finite-graph-interacting-and-bound-prepared-bodies"></a>**Theorem N.6d (Arbitrary Finite Graph-Interacting and Bound Prepared Bodies).**

#### 1. Source fixed before preparation

Fix $N\ge 1$, $A,\hbar,c>0$, and a symmetric graph weight matrix \(m_{ij}=m_{ji}\in\mathbb Z_{\ge0}\), with \(m_{ii}=0\). Write
\[
M=\sum_{i<j}m_{ij},\qquad \eta=M/N,\qquad
\Pi_i=|11\rangle\langle11|_{S_iE_i}.
\tag{N.6d.G1}
\]
The graph and weights are fixed source parameters, not functions selected after a target momentum is specified. A single positive edge already gives an actual intercell interaction; connected graphs are permitted for every $N\ge 2$. Let \(K_{B,i}\) be either the unbound zero source or the independently fixed confining oscillator of Theorem N.6c, with stationary ground energy $E_0$. Define
\[
K_G=\sum_i(A\Pi_i+K_{B,i})
+A\sum_{i<j}m_{ij}\Pi_i\Pi_j.
\tag{N.6d.G2}
\]
Every term is positive except the independently accounted oscillator binding offset already included in its positive $K_{B}$. Thus $K_{G}$ is self-adjoint and nonnegative on the oscillator tensor-sum domain. The graph term is bounded. The energy reference is retained.

Prepare
\[
\Psi_p=\bigotimes_{i=1}^N
\bigl(\sqrt{1-p}|00\rangle_i+\sqrt p|11\rangle_i\bigr)
\otimes\zeta_0^{\otimes N},\qquad 0<p<1.
\tag{N.6d.G3}
\]
Every occupation word z has strictly positive weight
\(w_z=p^{|z|}(1-p)^{N-|z|}\). On that word, the actual energy is
\[
E_z=NE_0+A F_G(z),\qquad
F_G(z)=\sum_i z_i+\sum_{i<j}m_{ij}z_iz_j\in\mathbb Z_{\ge0}.
\tag{N.6d.G4}
\]
The exact evolving state is \(\sum_z\sqrt{w_z}e^{-iE_z\tau/\hbar}|z\rangle_S|z\rangle_E\otimes\zeta_0^{\otimes N}\), where the scalar oscillator phase is counted only once as part of $E_{z}$. The actual expectation is
\[
E_G(p)=N(E_0+Ap)+AMp^2.
\tag{N.6d.G5}
\]
The factor $p^{2}$ is the product occupation expectation at preparation. It remains constant because every occupation projector commutes with $K_{G}$. No independence of phases at later times is assumed.

#### Independent source calibration and a genuine interaction

The first and mixed second excitation differences of the diagonal energy table are A and \(Am_{ij}\):
\[
E_{e_i}-E_0^{\rm word}=A,\quad
E_{e_i+e_j}-E_{e_i}-E_{e_j}+E_0^{\rm word}=Am_{ij},
\qquad E_0^{\rm word}=NE_0.
\tag{N.6d.G6}
\]
A nonzero mixed difference cannot be written as a sum of independent single-cell energies. Thus a positive edge is a genuine source interaction, not an interaction label attached to a product Hamiltonian.

The full finite clock source can be calibrated off the occupied trajectory: computational basis energy preparations determine its diagonal entries; real and imaginary two-basis-vector superpositions determine every off-diagonal entry. On the full clock carrier \((\mathbb C^2\otimes\mathbb C^2)^{\otimes N}\), this is a finite Hermitian matrix determination. It distinguishes omitted edges, extra higher-body terms and an off-history source that merely imitates this trajectory. The oscillator source/domain is independently specified as in the prepared packet. These calibration runs and their preparation work are owned setup resources. No assertion of low calibration complexity is made.

#### 2. Every boundary subfamily, with actual placement

Take \(S=S_1\cdots S_N\) together with all bound modes, and boundary channels \(E_i\). The graph phase in (N.6d.G4) is equivalent on the occupied correlated support to the local-on-$S$ unitary
\[
U_S(\tau)=\exp[-iA F_G(n_{S_1},\ldots,n_{S_N})\tau/\hbar].
\tag{N.6d.G7}
\]
Consequently every bipartition $S:E_J$ has the same mutual information as at preparation. Directly, tracing all $E$ gives the diagonal $S$ spectrum \(w_z\). For any \(J\subseteq\{1,\ldots,N\}\), tracing $E$ outside $J$ gives mutually orthogonal pure blocks indexed by the complementary $S$ occupation word $y$. Their probabilities are the product marginals \(w_y\). Therefore
\[
S(S)=Nh(p),\quad S(E_J)=|J|h(p),\quad
S(SE_J)=(N-|J|)h(p),
\quad I(S:E_J)=2|J|h(p)
\tag{N.6d.G8}
\]
for every time and every subfamily, including empty/full subfamilies. No conditional-block entropy or interaction entropy is discarded. All entropies are finite because the bound modes remain in pure ground states and the populated clock carrier is finite.

The interacting history is generally not a product over the $N$ pairs, so its boundary certificate explicitly uses **Proposition N.4 route 2**, rather than importing the independent-pair route. For every ordering of the channels, the chain rule and (N.6d.G8) give
\[
I(S:E_i\mid E_{<i})=I(S:E_{\le i})-I(S:E_{<i})=2h(p).
\tag{N.6d.G8a}
\]
This proves split independence for every ordering, not merely the displayed labeling. Its matching conditional capacity is independently bounded by
\[
I(S:E_i\mid E_{<i})=S(E_i\mid E_{<i})-S(E_i\mid SE_{<i})\le2\ln2,
\tag{N.6d.G8b}
\]
because each conditional entropy involving the qubit $E_{i}$ lies between $-\ln 2$ and $\ln 2$ on the declared finite-entropy state class. A Bell pair between $S_{i}$ and $E_{i}$ independent of $E_{<i}$ and all other factors, with the same pure bound modes, attains $2\ln 2$. Thus the route-2 capacity is exactly \(C_i=2\ln2\), independently of $p$ or the graph. Hence every channel has the same actual utilization
\(q=h(p)/\ln2\in(0,1]\). Graph phases do not alter the independent normalization \(C_i=2\varepsilon_0\) for the registered binary structural cycle value \(\varepsilon_0=\ln2\).

#### 3. Exact returns, including all positive-weight conditional blocks

Put \(T=2\pi\hbar/A\). Integer weights make every clock phase in (N.6d.G4) return at T. Because the zero word and every single-excitation word have positive weights and energy difference A, the first positive **whole-body ray** return is exactly T.

For a nonempty $J$ and a fixed complementary word $y$, define the conditional block polynomial
\[
f_{J,y}(z_J)=F_G(z_J,y),\qquad
 d_{J,y}=\gcd\{f_{J,y}(z_J)-f_{J,y}(0):z_J\in\{0,1\}^J\}.
\tag{N.6d.G9}
\]
Zeros do not affect the gcd. It is a positive integer: exciting any one $i\in J$ gives
\(1+\sum_{j\notin J}m_{ij}y_j\ge1\). Every conditional amplitude is positive. The pure conditional block therefore has first ray-return time
\[
T_{J,y}=T/d_{J,y}.
\tag{N.6d.G10}
\]
Indeed a return means \(t A(f(z)-f(0))/\hbar\in2\pi\mathbb Z\) for all $z$. The gcd criterion and Bézout identity are equivalent to \(t A d_{J,y}/\hbar\in2\pi\mathbb Z\). This classifies every populated block, rather than incorrectly assigning the same period to each.

The actual registered boundary pattern is the **whole** density matrix \(\rho_{S,E_J}\), the orthogonal direct sum of all these positive-weight blocks. Its return requires simultaneous return of every block. In particular the block $y=0$ has \(d_{J,0}=1\), since a single excitation in J changes its energy by exactly A. Thus, for every nonempty J,
\[
\rho_{S,E_J}(t)=\rho_{S,E_J}(0),\ t>0
\quad\Longleftrightarrow\quad t\in T\mathbb Z_{>0}.
\tag{N.6d.G11}
\]
The oscillator global phase cancels in the densities and does not affect the whole-body ray criterion. Individual blocks can return earlier, but no shorter time returns the registered pattern. This is the exact original first-return convention, not a replacement by a visibility threshold or an approximate phase crossing.

Each channel's count in the same autonomous run is exactly
\(N_i(\tau)=\lfloor\tau/T\rfloor\), so the saturated concurrent rate is \(N\ln2/T\). There is no scheduling operation or shared server; the complete fixed generator evolves all channels simultaneously. Interactions change phases and energy, but the actual simultaneous-count proof excludes any hidden serialization or energy-supply bottleneck on this autonomous run.

#### 4. Exhaustive interaction ownership and the unique preparation

The source ledger owns the graph terms as follows:

- Cell $i$ owns its $A\Pi_i$ excitation and its entire bound source $K_{B,i}$.
- Each unordered edge $\{i,j\}$ owns exactly one operator $Am_{ij}\Pi_i\Pi_j$ and one energy entry $Am_{ij}p^{2}$.
- The body total is the sum view (N.6d.G5), not a second charge.
- If a per-cell allocation is desired, assign half of each edge expectation to each endpoint. Summing the endpoint rows gives exactly $AMp^{2}$. This is an accounting convention; the interaction operator is still a single jointly supported source and is never asserted to factor.
- External preparation/controller work and later mechanical force work are separate entries, with no hidden ongoing drive.

The registered update ledger contains one binary structural label per channel pattern return. An edge does not create an independent extra completed event or a second binary label. This is an explicit source-exhaustive choice of structural event ledger, not a claim that arbitrary computational gate counts or heat records have no interaction cost. The edge's full physical energy is retained in (N.6d.G5), and the historywise overlap below tests whether this complete source, including every edge, fits that declared ledger. Omitting an edge energy changes that test and generally fails it.

Set \(r=E_0/A\) and \(\kappa=\ln2/(2\pi)\). The full same-source condition is
\[
E_G(p)=N\hbar\ln2/T
\quad\Longleftrightarrow\quad
p+r+\eta p^2=\kappa.
\tag{N.6d.G12}
\]
For every fixed graph and $r\ge 0$, a preparation with $0<p<1$ exists iff $r<\kappa$. It is unique, since the left side is strictly increasing on $p\ge 0$. Explicitly,
\[
p_G=\begin{cases}
\kappa-r,&\eta=0,\\[2mm]
\displaystyle\frac{2(\kappa-r)}{1+\sqrt{1+4\eta(\kappa-r)}},&\eta>0.
\end{cases}
\tag{N.6d.G13}
\]
It obeys \(0<p_G\le\kappa-r<1/2\). At $r=\kappa$ the only nonnegative root is $p=0$, excluded because $q=0$ and the clock has no nontrivial populated coherence. For $r>\kappa$ there is no admissible root. This classifies the complete registered all-$p$ graph family, rather than using an unowned scalar energy shift.

The independently fixed bound-mode example has $r=1/32<\kappa$, so every such finite graph, including arbitrary connected integer-weight graphs, has an explicitly populated confined-mode member. The graph parameters and oscillator are fixed before selecting $p_{G}$. The selection is performed by an owned physical pulse, not by changing information units or a momentum coordinate.

#### Owned preparation with the graph energy charged

At rest start all pairs at $|00\rangle$, and the bound modes at their explicitly prepared ground states. For \(\theta=\arcsin\sqrt{p_G}\) and chosen $t_{p}>0$, replace the complete clock-plus-graph generator by
\(\sum_i B_p(I+Y_{L,i})\), with \(B_p=\hbar\theta/t_p\), for time $t_{p}$. Keep the bound generators on. This nonnegative pulse sum produces (N.6d.G3) up to a global phase. Switch back to the independently fixed graph source (N.6d.G2).

The work into the clock/graph sector is $NB_p$ on, zero during the hold, and \(ANp_G+AMp_G^2-NB_p\) off. Its total is exactly \(ANp_G+AMp_G^2\). The latter includes every edge. Negative switching work is recovered by the owned controller. Bound-mode preparation and work remain the explicit $5A/64\to 2A/64$ per-cell transfer already proved. No controller remains coupled during the autonomous stationary graph run.

#### 5. Actual phase readout and source-first recovery

For a vertex i, let \(\mathcal N(i)=\{j:m_{ij}>0\}\). Retain the actual bounded Hermitian observables
\[
O_{i,c}=X_{S_i}X_{E_i}\prod_{j\in\mathcal N(i)}|0\rangle\langle0|_{S_j},\qquad
O_{i,s}=X_{S_i}Y_{E_i}\prod_{j\in\mathcal N(i)}|0\rangle\langle0|_{S_j}.
\tag{N.6d.G14}
\]
Since all neighbors are zero on the measured block, the energy difference of the i coherence is exactly A. Tracing over all other occupations gives
\[
\langle O_{i,c}\rangle=v_i\cos\vartheta,
\qquad \langle O_{i,s}\rangle=-v_i\sin\vartheta,
\quad v_i=2\sqrt{p_G(1-p_G)}(1-p_G)^{|\mathcal N(i)|}>0,
\quad\vartheta=A\tau/\hbar.
\tag{N.6d.G15}
\]
Their norms are at most one; if positive effects are required, use \( (I\pm O_{i,c})/2\) and \( (I\pm O_{i,s})/2\) and recover the signed expectations from their differences. These are unconditioned observable expectations; division by the independently retained positive visibility is a stated extraction map. There is no zero-probability postselection. Statistical sampling effort can grow with the inverse visibility; no uniform graph-size measurement-cost claim is made. The positive continuous phase unwrap recovers the actual return schedule established in (N.6d.G11).

The continuous additive phase ledger is fixed by the same source-independent conditions as the prepared packet: $F(u+v)=F(u)+F(v)$, continuity, and $F(2\pi)=\ln 2$. Thus $F=\ln 2\,\vartheta/(2\pi)$. Its completed-cycle and unfinished endpoint parts remain exactly separated. The signed source ledger is
\(\mathcal L^-=-N F(A\tau/\hbar)\), with positive magnitude \(\mathcal L^+=-\mathcal L^-\).

Use precisely the already certified strong-W1,1/BV velocity domain, fixed endpoints, speed and total-variation budgets, dyadic polygons, nodal recovery and uniformly admissible first-variation tangents of Theorem N.6c, recovery section. Neither topology nor physical clock is changed by the graph. Each polygon still has the actual propagator \(e^{-iK_G\tau[x_n]/\hbar}\); the maximum occupied energy is now
\[
E_{\max}=NE_0+A(N+M).
\tag{N.6d.G16}
\]
Consequently the source-vector recovery bound is \(E_{\max}|\tau[x_n]-\tau[x]|/\hbar\), with the previously proved uniform clock error. Both signed/positive $\Gamma$ recoveries and first variations carry over verbatim because their finite ledger terms depend on the same actual proper time and F. This is a literal application with an explicitly changed source bound, not a generic quadratic-kernel replacement.

#### 6. Same action, derived response and complete overlap

Declare the same independently fixed hybrid physical model as the prepared source of Theorem N.6c:
\[
S[x,\Psi]=\int\left[\frac{i\hbar}{2}(\langle\Psi,d\Psi\rangle-\langle d\Psi,\Psi\rangle)
-\langle\Psi,K_G\Psi\rangle d\tau\right]+S_{\rm ext}.
\tag{N.6d.G17}
\]
The source is now genuinely interacting; its conserved eigen-occupation actions, rather than independent cell phases, are the fixed Routh boundary data. Vary before eliminating the internal state. The same exact reduction gives
\[
S_{R,\rm src}=-E_G(p)\tau,\quad
P=\gamma E_G(p)v/c^2,\quad
\frac{dP}{dt}=F_{\rm ext},\qquad
S_R=S_{R,\rm src}+S_{\rm ext}.
\tag{N.6d.G18}
\]
Energy degeneracies cause no problem: choose a fixed eigenbasis, retain the prepared coefficients, and sum their fixed actions; populations within a degenerate block can also be grouped because the common energy is the same. The response has no independent adjustable mechanical $\lambda$.

For every admitted history and every recovery polygon, the complete source residual is
\[
S_{R,\rm src}-\hbar\mathcal L^-
=-NA\{p+r+\eta p^2-\kappa\}\tau.
\tag{N.6d.G19}
\]
It vanishes exactly at the owned preparation (N.6d.G13). Thus the interaction has neither been discarded nor inserted as a compensating invisible source. All energy, boundary, clock, source/recovery and momentum maps use the same $K_{G}$ and state.

At the selected state,
\[
m_I=E_G(p_G)/c^2
=\frac{N\hbar\ln2}{c^2T}
=\frac{\hbar I_{\rm rel}}{2q(p_G)c^2T}.
\tag{N.6d.G20}
\]
This populates the original N.5 rate(q) identification and N.6 mechanical map on the graph-interacting, optionally bound, formal-body class. The actual graph source/probe data remain retained. Distinct graphs with equal M and hence equal mean mass are not automatically response-equivalent: (N.6d.G6), the conditional periods (N.6d.G10), and off-history source probes can distinguish them. Only simultaneous source/state/effect conjugations and vertex relabelings preserving the complete retained data are treated as coordinate equivalences.

At a full return the entire internal vector has phase $-NE_0T/\hbar$. The Routh action has phase $-E_GT/\hbar$. Their difference is supplied by the Berry/boundary contribution of the occupied eigenstate phases, exactly as in the prepared packet. No total quantum return phase is substituted for the mechanical Routh action.

<a id="remark-n111-scope-of-the-machian-interpretation"></a>**Remark N.11.1: Scope of the Machian Interpretation.** Quantum mutual information satisfies $\mathcal I_{\mathrm{rel}}=0$ exactly when the state is a product across the declared split. On $\mathfrak B_{\mathrm{mass}}^{\mathrm{rate}}(q)$, Equation (N.26) then assigns zero to this particular relational mass coefficient. It does not follow that the system is vacuum, that every retained observable vanishes, or that no other mass/source ledger is present. Operational indistinguishability from a specified vacuum requires a separate certificate proving equality of all retained response functionals. Thus the Machian reading is a branch interpretation of the certified relational contribution.

<a id="theorem-n114a-complete-finite-retained-algebra-response-test-and-zero-mi-vacuum-refutation"></a>**Theorem N.11.4a (Complete Finite Retained-Algebra Response Test and Zero-MI Vacuum Refutation).** Let $\mathcal H$ be finite-dimensional, let $\mathfrak A\subseteq\mathcal B(\mathcal H)$ be a unital $*$-subalgebra, and let $\mathbb E_{\mathfrak A}$ be the trace-preserving Hilbert--Schmidt conditional expectation onto $\mathfrak A$. For density operators $\rho$ and $\omega$, the following are equivalent:
$$
\begin{aligned}
&\operatorname{Tr}(E\rho)=\operatorname{Tr}(E\omega)
&&\text{for every retained effect }0\le E\le I, E\in\mathfrak A;\\
&\mathbb E_{\mathfrak A}(\rho)=\mathbb E_{\mathfrak A}(\omega).
\end{aligned}
\tag{N.11.4a.1}
$$
Moreover,
$$
\sup_{\substack{0\le E\le I\\E\in\mathfrak A}}
\left|\operatorname{Tr}E(\rho-\omega)\right|
=\frac12\left\|\mathbb E_{\mathfrak A}(\rho-\omega)\right\|_1.
\tag{N.11.4a.2}
$$
Thus $\mathfrak A$ is response-complete for all finite states exactly when $\mathfrak A=\mathcal B(\mathcal H)$; on that branch equality of every retained response is equivalent to $\rho=\omega$.

Zero relational information does not imply this equivalence. On two qubits $S,E$, take
$$
\rho_{SE}=|1,0\rangle\!\langle1,0|,
\qquad
\omega_{SE}=|0,0\rangle\!\langle0,0|.
\tag{N.11.4a.3}
$$
Both states are product states and hence have $I(S:E)=0$, but the retained two-outcome instrument with effect
$$
E_1=|1\rangle\!\langle1|_S\otimes I_E
\tag{N.11.4a.4}
$$
has response probabilities $1$ and $0$. Therefore the universal proposition that zero relational mass implies operational equivalence to a specified vacuum is false even on a finite response-complete carrier.

*Proof.* For $A\in\mathfrak A$, orthogonality of the conditional expectation gives

$$
\operatorname{Tr}[A(\rho-\omega)]=\operatorname{Tr}[A\mathbb E_{\mathfrak A}(\rho-\omega)].
$$

This proves the reverse implication in (N.11.4a.1), and the forward implication follows because the linear span of effects in a unital finite-dimensional $*$-algebra is the whole algebra. Put $\Delta=\mathbb E_{\mathfrak A}(\rho-\omega)$. Its positive spectral projection $P_+$ belongs to $\mathfrak A$, and since $\operatorname{Tr}\Delta=0$,
$\operatorname{Tr}(P_+\Delta)=\frac12\|\Delta\|_1$; the variational characterization of trace norm gives (N.11.4a.2). If $\mathfrak A$ is proper, choose a nonzero traceless Hermitian $K\in\ker\mathbb E_{\mathfrak A}$ and sufficiently small $\epsilon>0$; $I/\dim\mathcal H\pm\epsilon K$ are distinct states with identical retained responses, proving the response-completeness criterion. Equations (N.11.4a.3)--(N.11.4a.4) are evaluated directly. ∎

### N.11.5 The Weak Equivalence Principle

<a id="theorem-n7-weak-equivalence-principle-from-a-common-ledger-on-mathfrak-b_mass"></a>**Theorem N.7 (Weak Equivalence Principle from a Common Ledger on $\mathfrak B_{mass}$).** Let a tested class of simple probes lie on canonical $\mathfrak B_{mass}$, and define its positive certified mass--action ledger
$$
L(P):=\frac{\mathcal I_{\mathrm{rel}}(P)}{2\sqrt{8\varepsilon_0}}m_P>0.
$$
Assume independently verified realization maps
$$
m_I(P)=\beta_I L(P),
\qquad
m_G(P)=\beta_G L(P),
\qquad \beta_I,\beta_G>0,
$$
with probe-independent coefficients, a common operational metric, and source exhaustion/no double counting. Then $m_G(P)/m_I(P)=\beta_G/\beta_I$ for every probe. If one independently calibrated reference probe $P_*$ satisfies $m_G(P_*)=m_I(P_*)$, then
$$
m_G(P)=m_I(P)
$$
for every probe in the class. Simplicity alone establishes none of these bridge premises.

*Proof.* Division is legitimate because $L,\beta_I,\beta_G>0$ and gives the probe-independent ratio $\beta_G/\beta_I$. Reference equality forces $\beta_G/\beta_I=1$, which then holds for the full tested class. No entropy or heat interpretation is used; that stronger reading requires $\mathfrak B_{\mathrm{mass}}^{\mathrm{therm}}(1)$. ∎

<a id="corollary-n71-universality-of-free-fall-on-the-common-ledger-and-weak-field-response-branch"></a>**Corollary N.7.1 (Universality of Free Fall on the Common-Ledger and Weak-Field Response Branch).** Let bodies satisfy Theorem N.7 and, on the same operational metric, an independently accepted weak-field test-body response law
$$
F=m_Gg,
\qquad
a=F/m_I,
$$
with negligible self-force and backreaction on the declared approximation domain. Then every such body has $a=g$.

*Proof.* Theorem N.7 gives $m_G/m_I=1$ after its reference calibration. Substitution in the registered response law gives $a=(m_G/m_I)g=g$. ∎

The conclusion is a branch theorem. Testing the branch requires propagating the retained source and response maps into a signed composition-dependent Eötvös parameter and comparing that output with the cited equivalence-principle measurements.

### N.11.5a Universal Certified Mass Ledgers and Typed Response Separation

Theorem N.7 establishes $m_I=m_G$ for simple systems only on the common $\mathfrak B_{mass}$ source/response ledger and its independently calibrated reference equality.

### N.11.5a.1 The Data Processing Inequality

<a id="definition-n111-distinguishability-monotone"></a>**Definition N.11.1 (Distinguishability Monotone).** A distinguishability monotone $\mathcal{M}$ is a function on pairs of quantum states satisfying:

$$
\mathcal{M}(\mathcal{E}(\rho), \mathcal{E}(\sigma)) \leq \mathcal{M}(\rho, \sigma)
$$

for all CPTP maps $\mathcal{E}$ and all finite-dimensional density operators $\rho,\sigma$. Concrete examples are trace distance $D_{\rm tr}(\rho,\sigma)=\tfrac12\|\rho-\sigma\|_1$; quantum relative entropy $S(\rho\|\sigma)=\operatorname{tr}[\rho(\log\rho-\log\sigma)]$, extended to $+\infty$ when $\operatorname{supp}\rho\nsubseteq\operatorname{supp}\sigma$; and Bures distance
$$
d_{\rm B}(\rho,\sigma)=\sqrt{2-2f(\rho,\sigma)},\qquad
f(\rho,\sigma)=\operatorname{tr}\sqrt{\sqrt\rho\,\sigma\sqrt\rho}.
$$
For trace distance, the variational trace-norm formula and the positive unital adjoint of a CPTP map give contractivity. Relative-entropy data processing on the stated support domain is the positive-map theorem cited in Corollary N.10.1. Uhlmann's purification formula identifies $f$ as the maximal overlap of purifications. A Stinespring isometry applied to maximizing input purifications preserves their overlap and yields purifications of the output states, so $f(\mathcal E\rho,\mathcal E\sigma)\ge f(\rho,\sigma)$ and consequently $d_{\rm B}(\mathcal E\rho,\mathcal E\sigma)\le d_{\rm B}(\rho,\sigma)$. Fidelity itself is nondecreasing and is not an example of the decreasing convention in this definition. No unspecified generalized quasi-entropy family is asserted here.

<a id="theorem-n10-nd-rid-data-processing-and-refresh-branch-contractivity"></a>**Theorem N.10 (ND-RID Data Processing and Refresh-Branch Contractivity).** On the Hilbert/instrument branch, assume that the averaged ND-RID `Evolve` update $\mathcal E_N$ is represented by a CPTP map and therefore satisfies the data processing inequality with non-expansive trace-distance factor $0\le f_{RID}\le1$. On refresh/minorization branches satisfying Lemma E.1 it is strictly contractive:

$$
D_{tr}(\mathcal{E}_N(\rho), \mathcal{E}_N(\sigma)) \leq f_{RID} \cdot D_{tr}(\rho, \sigma)
\tag{N.33}
$$

where $0 \leq f_{RID} < 1$ is the refresh-branch contractivity factor established in Lemma E.1. Without the refresh/minorization hypothesis, CPTP data processing still gives the non-expansive bound with $0\le f_{RID}\le1$, while Proposition E.2a supplies the completed reset-support capacity deficit.

*Proof.* By Lemma E.1, the averaged ND-RID 'Evolve' channel contains a nonzero input-independent refresh component, so it admits a decomposition
$$
\mathcal{E}_N=(1-p)\Psi+pT_{\sigma_{\mathrm{reset}}},
\qquad p\in(0,1],
\qquad T_{\sigma_{\mathrm{reset}}}(\rho)=\mathrm{Tr}(\rho)\sigma_{\mathrm{reset}}.
$$
For $\Delta:=\rho-\sigma$ we have $\mathrm{Tr}(\Delta)=0$, hence $T_{\sigma_{\mathrm{reset}}}(\Delta)=0$ and
$$
\mathcal{E}_N(\Delta)=(1-p)\Psi(\Delta).
$$
Since $\Psi$ is CPTP, it contracts trace distance, implying $\|\Psi(\Delta)\|_1\le \|\Delta\|_1$. Therefore
$$
D_{tr}(\mathcal{E}_N(\rho),\mathcal{E}_N(\sigma))
=\tfrac12\|\mathcal{E}_N(\Delta)\|_1
\le (1-p)\tfrac12\|\Delta\|_1
=(1-p)\,D_{tr}(\rho,\sigma),
$$
so (N.33) holds with $f_{RID}=1-p<1$. ∎

<a id="corollary-n101-relative-entropy-contractivity"></a>**Corollary N.10.1 (Relative Entropy Contractivity).** The ND-RID channel satisfies:

$$
S(\mathcal{E}_N(\rho) \| \mathcal{E}_N(\sigma)) \leq S(\rho \| \sigma).
\tag{N.34}
$$

If $\mathcal{E}_N$ has a nonzero refresh component $\mathcal{E}_N=(1-p)\Psi+pT_{\sigma_{\mathrm{reset}}}$ with $p>0$ (Lemma E.1), then for all pairs with $S(\rho\|\sigma)<\infty$ one has the quantitative bound
$$
S(\mathcal{E}_N(\rho) \| \mathcal{E}_N(\sigma)) \le (1-p)\,S(\rho \| \sigma),
$$
hence strict inequality for all $\rho\neq\sigma$ with finite relative entropy.

*Proof.* The first inequality is the quantum data processing inequality for relative entropy under a trace-preserving positive map (Müller-Hermes and Reeb 2017, Theorem 1); the ND-RID channel is CPTP and hence meets this hypothesis.

For the quantitative contraction, define the flagged channel
$$
\widetilde{\mathcal{E}}_N(\rho)=(1-p)\,\Psi(\rho)\otimes|0\rangle\langle0|+p\,\sigma_{\mathrm{reset}}\otimes|1\rangle\langle1|.
$$
Tracing out the flag yields $\mathcal{E}_N=\mathrm{Tr}_F\circ \widetilde{\mathcal{E}}_N$, so by data processing,
$$
S(\mathcal{E}_N(\rho)\|\mathcal{E}_N(\sigma)) \le S(\widetilde{\mathcal{E}}_N(\rho)\|\widetilde{\mathcal{E}}_N(\sigma)).
$$
Since the flag distribution is input-independent, the relative entropy of the flagged outputs decomposes as
$$
S(\widetilde{\mathcal{E}}_N(\rho)\|\widetilde{\mathcal{E}}_N(\sigma))=(1-p)\,S(\Psi(\rho)\|\Psi(\sigma)).
$$
Applying data processing to $\Psi$ gives $S(\Psi(\rho)\|\Psi(\sigma))\le S(\rho\|\sigma)$, hence
$$
S(\mathcal{E}_N(\rho)\|\mathcal{E}_N(\sigma)) \le (1-p)\,S(\rho\|\sigma),
$$
which is strict whenever $p>0$ and $S(\rho\|\sigma)\in(0,\infty)$. ∎

<a id="proposition-n115a1a-quantum-state-contractivity-budget-for-equivalence-tests"></a>**Proposition N.11.5a.1a (Quantum-State Contractivity Budget for Equivalence Tests).** Let $r$ label a matter sector or internal quantum preparation branch, and suppose its ND-RID channel satisfies
$$
D_{tr}(\mathcal E_r(\rho),\mathcal E_r(\sigma))
\le
f_rD_{tr}(\rho,\sigma),
\qquad
0\le f_r<1,
$$
for all density operators $\rho,\sigma$. For $D_{tr}(\rho,\sigma)>0$, define the realized distinguishability contraction ratio
$$
\mathfrak d_r(\rho,\sigma)
:=
\frac{D_{tr}(\mathcal E_r(\rho),\mathcal E_r(\sigma))}
{D_{tr}(\rho,\sigma)}.
$$
Then
$$
0\le\mathfrak d_r(\rho,\sigma)\le f_r.
$$
For two sectors $r,s$, the maximal DPI budgets differ by
$$
\left|
f_rD_{tr}(\rho,\sigma)-f_sD_{tr}(\rho,\sigma)
\right|
=
|f_r-f_s|D_{tr}(\rho,\sigma).
$$
Consequently, if $f_r=f_s$ for all matter sectors at the same coarse-graining scale, their certified worst-case DPI budgets coincide. This equality does not imply
$$
\mathfrak d_r(\rho,\sigma)=\mathfrak d_s(\rho,\sigma)
$$
for a particular state pair, nor does it identify the channels. Exclusion of a DPI-mediated equivalence-principle deviation requires equality of the realized contraction ratios on the registered probe class, or a stronger channel-level universality certificate. Sector-dependent values of $f_r$ are sufficient evidence of nonuniversal budgets but are not necessary for sector-dependent realized contraction.

*Proof.* The first inequality is the assumed trace-distance contractivity divided by the positive number $D_{tr}(\rho,\sigma)$. Nonnegativity follows from nonnegativity of trace distance. The budget-difference identity is algebraic:
$$
|f_rD-f_sD|=|f_r-f_s|D,
\qquad
D:=D_{tr}(\rho,\sigma).
$$
The density-operator domain includes pure states, mixed states, coherent superpositions, and reduced states of entangled systems, so the same bound applies to all such internal preparations. If all sectors share the same value $f$, the DPI contraction budget is universal and cannot distinguish matter composition or internal quantum preparation. These conclusions concern DPI budgets only. They enter Theorem N.11's converse only after a typed overlap map sends $f_r$ into $\beta_I$, $\beta_G$, or the common metric and the non-compensation audit applies. ∎

### N.11.5a.2 Retained-Ledger Equivalence and Refresh-Branch DPI

Equivalence-principle behavior is a common-source/common-response statement. The relational boundary coefficient used by Theorem N.5, the unassisted communication capacity of Theorem E.2, and a refresh contraction factor are distinct typed data unless an explicit overlap certificate relates them.

<a id="definition-n110-retained-typed-coupling-ledger"></a>**Definition N.11.0 (Retained Typed Coupling Ledger).** For a simple matter sector at a fixed coarse-graining scale, define
$$
\lambda(\mathfrak S_{\mathrm{mat}})
=
\bigl(
C_*^{\mathrm{rel}},q,\tau_{\min},\lambda_A,
T_{\mu\nu}^{(\mathrm{src})},
C_{\mathrm{HSW}},f_{\mathrm{RID}},\mathfrak O_N
\bigr),
$$
where $C_*^{\mathrm{rel}},q,\tau_{\min}$ are the boundary-decomposition and activity entries of Proposition N.4 and Corollary N.4.1, $\lambda_A$ is the action-per-structural-update coefficient in units of $\hbar$, $T_{\mu\nu}^{(\mathrm{src})}$ is the retained gravitational source map, $C_{\mathrm{HSW}}$ and $f_{\mathrm{RID}}$ are optional communication/refresh entries, and $\mathfrak O_N$ is the type and no-double-counting audit. Entrywise equality of response-active entries is a sufficient certificate; response universality itself means constancy of $\Xi_{\mathcal R}$ on a common metric and permits registered common rescalings as in Definitions N.11.0a--b. No definition identifies $C_*^{\mathrm{rel}}$ with $C_{\mathrm{HSW}}$.

<a id="definition-n110a-retained-response-ledger-and-equivalence-ratio"></a>**Definition N.11.0a (Retained Response Ledger and Equivalence Ratio).** For a retained response channel $\mathcal R$ and probe $P$, let $I_{\mathcal R}(P)>0$ be the response coefficient and $Q_{\mathcal R}(P)$ the source coefficient in the first nonzero finite response. Define
$$
\Xi_{\mathcal R}(P):=\frac{Q_{\mathcal R}(P)}{I_{\mathcal R}(P)}.
$$
The channel is equivalence-principle-bearing on a probe class exactly when $\Xi_{\mathcal R}$ is constant after the PPI quotient. It is sector-selective when a retained label changes this ratio.

<a id="definition-n110b-metric-universal-ledger"></a>**Definition N.11.0b (Metric-Universal Ledger).** A response channel is metric-universal on a probe class when every retained probe reconstructs the same operational metric, and there is one scalar ledger $L(P)$ with probe-independent nonzero coefficients $\alpha_{\mathcal R},\beta_{\mathcal R}$ such that
$$
Q_{\mathcal R}(P)=\alpha_{\mathcal R}L(P),
\qquad
I_{\mathcal R}(P)=\beta_{\mathcal R}L(P),
$$
while every proposed species-dependent response is either PPI-null or assigned to a separate certificate. On the gravitational branch, $L(P)$ is the certified mass--action ledger of Theorem N.5, not an unassisted channel-capacity ledger.

The **non-compensation branch** is the subbranch on which the induced map from retained ledger records modulo PPI-null changes and common rescalings to $\Xi_{\mathcal R}$ is injective on the tested class. Equivalently, two accepted records with equal $\Xi_{\mathcal R}$ may differ only by a PPI-null entry or a registered common rescaling. This is an injectivity premise on the declared probe class. An exhaustive finite audit additionally requires a finite registered comparison list and terminating procedures for its response-ratio and quotient-equivalence comparisons.

<a id="theorem-n11a-equivalence-constitutive-separation-law"></a>**Theorem N.11a (Equivalence--Constitutive Separation Law).** On a fixed branch and coarse-graining scale:

1. metric universality implies equivalence-principle behavior;
2. a retained label that changes $\Xi_{\mathcal R}$ on the non-compensation branch excludes equivalence-principle behavior on the full probe class; and
3. conversely, on the non-compensation branch, equivalence-principle behavior forces every retained variation to be common, PPI-null, or restricted to a constant-ratio subprobe class.

*Proof.* Metric universality gives $\Xi_{\mathcal R}=\alpha_{\mathcal R}/\beta_{\mathcal R}$, independent of the probe. If a retained label changes the ratio, two probes have different responses to the same non-null drive. On the non-compensation branch this difference cannot be canceled. Conversely, constant response for all tested probes forces $Q_{\mathcal R}/I_{\mathcal R}$ to be constant after quotienting. ∎

<a id="corollary-n11a1-gravitygaugeconstitutive-classification"></a>**Corollary N.11a.1 (Gravity/Gauge/Constitutive Classification).** A gravitational branch whose metric, inertial coefficient, and stress-source maps satisfy Definition N.11.0b is equivalence-principle-bearing. A converse constraint on retained variations requires the non-compensation branch of Theorem N.11a. Gauge and constitutive channels are generally sector-selective; they obey an equivalence principle only on subprobe classes with constant retained source-to-response ratio.

*Proof.* Apply Theorem N.11a to the gravitational, gauge, and constitutive response ratios. A common word such as *emergent* supplies none of the required equalities. ∎

<a id="remark-n11a2-emergence-is-not-the-equivalence-criterion"></a>**Remark N.11a.2 (Emergence Is Not the Equivalence Criterion).** The operative distinction is metric-universal/common-ledger versus sector-selective/constitutive-ledger, not emergent versus fundamental.

<a id="theorem-n11b-canonical-coupled-source-curved-recovery-and-noncompensating-common-metric-ratio"></a>**Theorem N.11b (Canonical Coupled Source, Curved Recovery and Noncompensating Common-Metric Ratio).**

#### Proved claim and exact branch

An eight-dimensional, genuinely coupled boundary source admits a disclosed preparation for which the first-return structural update rate, the physical fixed-population rest action, and the inertial/passive/Hilbert source all share one positive ledger. For every finite tensor product of these cells,

\[
 I_{\rm rel}=2N\ln2,\quad \dot\varepsilon_\partial=N\ln2/T,
 \quad E_N=N\hbar\ln2/T,\quad
 m_I=m_G^{\rm passive}=m_G^{\rm Hilbert}=E_N/c^2.
\]

The source Hamiltonian determines the energy; no mass measurement or gravitational response selects its coefficient. A curved, nonquadratic polygon recovery below proves the actual Q.0.1 action/update and source-overlap gate, including a common topology, equicoercivity, both signed and positive ledgers, first variations and distributional Hilbert-source convergence.

**Scope.** Theorem N.11b is a formal finite-source realization on the common metric-only point-probe branch. Its cycles use the owner's first-return convention. Its explicit continuous phase-accrual ledger includes owned incomplete-cycle endpoint entries. It establishes Theorem N.5's rate branch and the explicit canonical-reference entries of Corollary N.11.1; the additional Q.18/Q.6.1 Planck clock/spacing branch is separately identified in Section 11.

#### Source inputs

Branch inputs, fixed before deriving any response, are $c>0$, an independently calibrated quantum action unit $\hbar>0$, a source spectral gap $A>0$, $T=2\pi\hbar/A$, the finite preparation below, the normalized state/worldline action in Section 5, one smooth common operational metric, and the path/control budgets of Section 6. No inertial mass, gravitational charge, Newton constant, or second gravitational sector is a source input. The action unit can be checked as $A/\omega$ from the independently specified Schrödinger frequency $\omega=A/\hbar$; $\ln 2$ does not determine it.

#### 2. An actual interacting elementary source

Let $H=S\otimes P\otimes C$, with each factor $\mathbb{C}^2$, let $E=P\otimes C$ be the named boundary environment, and put

\[
 n=|1\rangle\langle1|,\qquad K=A n_S n_C,\qquad
 |\psi_p(0)\rangle=|\Phi^+\rangle_{SP}\otimes
 (\sqrt{1-p}|0\rangle+\sqrt p|1\rangle)_C,\quad 0<p<1.
\tag{N.11b.2.1}
\]

Identity factors are understood. All eight levels and their energies are specified by $K$; there is no discarded bath or binding term. A concrete preparation is a Bell preparation on $SP$ followed by the rotation $R_y(2\arcsin\sqrt{p})$ on $C$. Preparation apparatus is outside the retained free-probe interval and its supplied preparation energy is accounted for externally. During that interval $K$ is autonomous and nonnegative.

Write $\theta=\omega\tau$, $\omega=A/\hbar$, $a=\sqrt{p(1-p)}$. Exact evolution is

\[
 \psi_p(\tau)=\frac1{\sqrt2}\left[
 |00\rangle_{SP}(\sqrt{1-p}|0\rangle+\sqrt p|1\rangle)_C+
 |11\rangle_{SP}(\sqrt{1-p}|0\rangle+\sqrt p e^{-i\theta}|1\rangle)_C
 \right].
\tag{N.11b.2.2}
\]

The two displayed environment vectors have orthogonal $P$ support and unit norm. Thus $\rho_S=I_2/2$, the total state is pure and its Schmidt spectrum on $S:E$ is $(1/2,1/2)$ for every $\tau$. Therefore $I(S:E)=2\ln 2$. On the explicit admissible capacity class of ALL density matrices on $\mathbb{C}^2\otimes\mathbb{C}^4$, Araki–Lieb gives

\[
 I(S:E)\le 2\min\{S(S),S(E)\}\le2\ln2.
\]

The actual history (N.11b.2.2) attains the bound at every time. Hence $C_{\mathrm{rel}}=2$ ln2 is an attained relational-cut capacity and $q=1$. This is not an unassisted communication capacity.

The registered structural support is the two-element boundary label set $\{0,1\}$ on $S$, so $\varepsilon_0=\ln|\{0,1\}|=\ln 2$, independently of $p$. This is a completed-cycle structural label convention, not a heat or erasure claim.

#### 2.1 The cycle is a boundary interaction cycle

The occupied spectral weights of K are 1-p/2 at energy zero and p/2 at energy A. Thus

\[
 \langle\psi_p(0)|\psi_p(\tau)\rangle=1-p/2+(p/2)e^{-i\theta},
 \quad |\langle\psi_p(0)|\psi_p(\tau)\rangle|^2
 =1-2p(1-p/2)\sin^2(\theta/2).
\tag{N.11b.2.3}
\]

Since $0<p<1$, equality to one holds exactly when $\theta$ is an integer multiple of $2\pi$. The first positive ray return is $T$; every completed cycle has duration $T$, the cycles tile the proper-time half-line and the count is $\lfloor\tau/T\rfloor$.

These returns are not an environment-only clock grafted onto a fixed boundary state. With the usual Pauli $Y=\begin{bmatrix}0&-i\\i&0\end{bmatrix}$, exact expectations are

\[
 \langle n_S X_C\rangle=a\cos\theta,\qquad
 \langle n_S Y_C\rangle=-a\sin\theta,
\]
\[
 \langle X_C\rangle=a(1+\cos\theta),\quad
 \langle Y_C\rangle=-a\sin\theta,\quad
 \operatorname{Cov}(n_S,X_C)=\tfrac a2(\cos\theta-1).
\tag{N.11b.2.4}
\]

At every nonreturn time the last covariance is nonzero, while it is zero initially. Any evolution $I_{S}\otimes U_{E}$ would preserve $\rho_{\mathrm{SP}}$ here when $U_{E}$ acts on $C$ alone, whereas tracing out $C$ in (N.11b.2.2) gives a Bell coherence multiplied by $(1-p)+p\exp(i\theta)$. More generally the connected interaction is certified directly by $K$'s mixed energy difference $K_{11}-K_{10}-K_{01}+K_{00}=A$; $K$ cannot be written as $K_{S}\otimes I+I\otimes K_{E}$. Its actual conditional $S:C$ correlations change. Because $S$ and $P$ are perfectly correlated on this particular occupied history, an alternative operator $An_Pn_C$ acting only on $E$ can imitate that history. We therefore do not infer operator ownership from that history alone: $K$ is the declared independently calibrated 8D operator. A calibration preparation $|1\rangle_S|0\rangle_P\otimes(|0\rangle+|1\rangle)_C/\sqrt{2}$ acquires a $C$ relative phase at frequency $A/\hbar$ under $K$ and none under $An_Pn_C$; the preparation with $S=0,P=1$ interchanges these outcomes. These preparations and conditional phase readouts fix the named $S:C$ coupling independently of the mass or gravity experiment. They are apparatus calibration states, not extra accepted response probes. The two joint observables in (N.11b.2.4) reconstruct $\cos\theta$ and $\sin\theta$, and continuity plus $\theta(0)=0$ gives the unwrapped phase lift, including each completed return.

The minimum ray-overlap modulus is $1-p>0$. Hence this branch does not contain an orthogonal half-cycle. It is consistent with the common-cycle Margolus–Levitin obstruction of Theorem Q.0.10d.3 for an orthogonal-update/Bell-history branch. If a consumer adds orthogonal distinguishability to its update definition, it must reject this branch under that extra premise rather than count its first returns as orthogonal updates.

#### 2.2 Independently derived energy and disclosed canonical preparation

The exact source mean and variance are

\[
 E(p)=Ap/2=\pi\hbar p/T,\qquad
 \operatorname{Var}K=A^2(p/2)(1-p/2).
\tag{N.11b.2.5}
\]

Energy is constant by autonomous unitary evolution. Its action-per-completed-structural-cycle coefficient is therefore

\[
 \lambda_A(p)=\frac{E(p)T}{\hbar\epsilon_0}=\frac{\pi p}{\ln2}.
\tag{N.11b.2.6}
\]

The equation $\lambda_{A}=1$ has exactly one preparation in (0,1):

\[
 p_*=\ln2/\pi.
\tag{N.11b.2.7}
\]

Indeed $0<\ln 2<1<\pi$. This is a disclosed designed preparation, not a theorem selecting $p$ for all sources and not a fit to a mass or acceleration. $K$, its gap, its phase period, the finite support and the full family of preparations are specified first; solving their derived dimensionless action ratio selects one member. The canonical energy $E_*=\hbar\ln 2/T$ is a consequence. A Ramsey measurement of this same $K$ in Section 10 can independently check the preparation energy without using gravity.

#### 3. Full product boundary, activity and source exhaustion

For $N\ge 1$ take N disjoint copies of (N.11b.2.1) with the same T,p and put

\[
 K_N=\sum_{i=1}^N A n_{S_i}n_{C_i},\qquad
 \psi_{N,p}(0)=\bigotimes_i\psi_p(0),\qquad E_i=P_iC_i.
\tag{N.11b.3.1}
\]

The summands act on disjoint factors, commute and individually conserve their means. The propagator and state are tensor products for every proper time. For every Aset subset of [N],

\[
 I(S:E_{\mathrm{Aset}})=2|\mathrm{Aset}|\ln2,
 \quad I_i=2\ln2,\quad I_{\rm rel}=2N\ln2.
\tag{N.11b.3.2}
\]

Proof: tracing unselected $E_{i}$ leaves maximally mixed $S_{i}$, while each selected cell is pure across $S_i:E_i$ and has $S_{i}$ entropy $\ln 2$. Entropies add across the product. All chain-rule allocations are consequently $2\ln 2$ in every ordering. The capacity certificate uses Proposition N.4 route 1 on $S_i:E_i$; it does not assert that $2\ln 2$ is the supremum on the larger unrestricted carrier $S:E_i$ when $N>1$. Each actual cell itself attains the dimension-sharp capacity in Section 2; no decomposition of the two internal environment factors $P_i,C_i$ is counted as an additional channel.

Each channel has count $N_i(\tau)=\lfloor\tau/T\rfloor$, determined entirely by its own initial state and generator. Evolution of one factor neither waits for nor consumes another's clock, energy supply or server. A common proper-time parameter describes simultaneous independent Hamiltonians, not a serialized shared clock apparatus. The full system has no intercell generator or extra time-varying source. Thus the same-run concurrency and source-exhaustion certificate is explicit, and

\[
 \lim_{\tau\to\infty}\frac{\epsilon_0\sum_iN_i(\tau)}\tau
 =\frac{N\ln2}{T}=\frac{I_{\rm rel}}{2T}.
\tag{N.11b.3.3}
\]

The finite-horizon count remainder has magnitude $<N\ln 2$. All interaction energy $An_Sn_C$ is owned within its one named channel and occurs exactly once in $K_{N}$. The complete internal source mean is $E_N=NAp/2$. There is no extra KMS, reset, maintenance, binding or endpoint energy assigned to the free stationary interval. Physical mechanical drives and readout controls, when used, are separately owned in Section 10.

#### 4. An implemented additive phase ledger, including incomplete cycles

The completed-cycle count ledger and the continuous phase-progress ledger are different declared records. They agree on full cycles and have the same stationary rate. For one cell the measured phase in (N.11b.2.4) supplies a circle-valued clock and its continuous lift $\theta(\tau)=\omega\tau$. Define the orientation of the rest-action ledger as negative proper-time accumulation.

**Phase-ledger uniqueness under its declared implementation rules.** A continuous additive real-valued function $J$ on lifted phase increments, invariant under changing the initial phase, with $J(2\pi)=-\varepsilon_0$, is uniquely

\[
 J(\Delta\theta)=-\frac{\epsilon_0}{2\pi}\Delta\theta.
\tag{N.11b.4.1}
\]

Proof: additivity gives $J(nz)=nJ(z)$ for integers; normalization fixes rational multiples of $2\pi$; continuity extends to all real increments. These are explicit ledger implementation rules, not consequences of cardinality alone. They depend only on the actual phase clock and the registered completed-cycle label. The positive activity-magnitude ledger is $-J$ for forward histories.

For any interval $[a,b]$, write $\theta=2\pi k+r$ with $k=\lfloor\theta/(2\pi)\rfloor$ and $0\le r<2\pi$. Then the exact accounting is

\[
 J(\theta_b-\theta_a)=-\epsilon_0(k_b-k_a)
 -\frac{\epsilon_0}{2\pi}(r_b-r_a).
\tag{N.11b.4.2}
\]

The first term counts completed returns. The second is the explicit initial/final phase-accrual balance and telescopes over any partition. It is not an extra completed update. It has magnitude $<\varepsilon_0$ and contributes zero to the long-time rate. Summing over cells and arbitrary path segments gives a finite additive dimensionless implementation record with no double counting. Definition Q.0.1 permits these declared step entries; its narrower “one binary label and no other contribution” count proposition is used only for the completed-count part.

On a worldline with proper duration $\Delta\tau$, this implementation gives

\[
 \mathcal L^-=-\frac{N\epsilon_0}{T}\Delta\tau,
 \qquad\mathcal L^+=\frac{N\epsilon_0}{T}\Delta\tau.
\tag{N.11b.4.3}
\]

These formulas have been derived from the finite source phase and the additive normalized ledger. They have not been defined by dividing a desired mass action by $\hbar$. The source action will be calculated independently next. The actual source-overlap condition will hold only at the derived preparation (N.11b.2.7).

#### 5. One action, actual Routh reduction and the physical source

Use the normalized finite-state point-probe action on the chosen metric (signature -+++; $x^0=ct$)

\[
 S[x,\psi,\nu;g]=\int\left[
 \frac{i\hbar}{2}(\langle\psi,d\psi\rangle-\langle d\psi,\psi\rangle)
 -\langle\psi,K_N\psi\rangle d\tau
 +\nu(\langle\psi,\psi\rangle-1)d\tau\right].
\tag{N.11b.5.1}
\]

The metric enters only through proper time; the internal state is a Lorentz scalar. $K_{N}$ includes all retained rest source and fixes its energy zero. There is no independent mass or gravitational-charge term. Internal variation gives Schrödinger ray evolution and $E_N=\operatorname{Tr}(\rho K_N)$ is conserved.

To retain the worldline mechanics, diagonalize $K_{N}$ and write occupied amplitudes $\sqrt{w_a}\exp(-i\theta_a)$. The internal Lagrangian is $\hbar\sum_a w_a\dot{\theta}_a-E_N\dot{\tau}$. At fixed conserved actions $J_a=\hbar w_a$, Routh reduction subtracts $\sum_a J_a\dot{\theta}_a$ BEFORE putting phases on shell. Equivalently the endpoint convention includes $-[\sum_a J_a\theta_a]$, fixes the occupations and worldline endpoints, and leaves the final phases free under worldline variation. Removing the redundant global phase gives the same cancellation of its boundary term. The resulting action is

\[
 S_R[x;g]=-E_N\int d\tau.
\tag{N.11b.5.2}
\]

The unreduced full state action vanishes on this Schrödinger solution. At a completed period $T$, the actual internal propagator sends $\psi$ back to itself with total phase 0 modulo $2\pi$, whereas $S_R(T)=-E_NT=-N\hbar\ln 2$ at $p_*$. The Berry integral is $+E_NT$ and the unreduced dynamical contribution is $-E_NT$; Routh reduction removes the cyclic-angle term with its stated endpoint convention. Thus $-N\ln 2$ is the reduced mechanical action in units of $\hbar$, not a claim about the full internal return phase. No Berry/dynamical cancellation is used as the source calibration.

The worldline in (N.11b.5.1) is a classical sharply localized test-probe coordinate coupled to a prepared internal quantum state. Its variational response is the expectation-source response of this specified hybrid model. $K_{N}$ is not an energy eigenvalue on that preparation; its nonzero variance is retained. We do not assert that a fully quantized centre of mass has a sharp scalar mass $E_N/c^2$, or that mass-dependent entanglement in such an enlarged model can be discarded. The response protocol in Section 10 measures the classical coefficient of this declared action at fixed internal populations.

Direct metric differentiation, with $u=dx/d\tau$ and

\[
 \delta S=\frac1{2c}\int T^{\mu\nu}\delta g_{\mu\nu}\sqrt{-g}\,d^4x,
\]

gives

\[
 \delta d\tau=-\frac{u^\mu u^\nu\delta g_{\mu\nu}}{2c^2}d\tau,
 \quad
 T^{\mu\nu}_{\rm src}(y)=\frac{E_N}{c}
 \int u^\mu u^\nu\frac{\delta^{(4)}(y-x(\tau))}{\sqrt{-g(y)}}d\tau.
\tag{N.11b.5.3}
\]

At rest in a local inertial frame $T^{00}=E_N\delta^3$, so the Hilbert mass coefficient is $E_N/c^2$. Metric variation and worldline variation are taken at the same fixed occupations. The normalization multiplier contributes zero on normalized states, and the Berry form is metric independent. Source conservation holds locally away from finite worldline endpoints for free geodesics; for driven paths its divergence is the explicitly owned external force density.

In a static metric $g_{00}=-(1+2\Phi/c^2)$, $g_{ij}=\delta_{ij}$, the coordinate-time Lagrangian is

\[
 L=-E_N\sqrt{1+2\Phi/c^2-|v|^2/c^2}
   =-E_N+\frac{E_N}{2c^2}|v|^2-\frac{E_N}{c^2}\Phi+O((|\Phi|+|v|^2)^2).
\tag{N.11b.5.4}
\]

Consequently $m_I=m_G^{\mathrm{passive}}=m_G^{\mathrm{Hilbert}}=E_N/c^2$. In a local Minkowski frame $p_{\mathrm{mech}}=E_N\gamma v/c^2$. The equality follows from one populated action, rather than an independently stipulated Newtonian law. Its exact remainder for $z=2\Phi/c^2-|v|^2/c^2$, $|z|\le r<1$, is bounded by $E_Nz^2/[8(1-r)^{3/2}]$.

Combining (N.11b.4.3) and (N.11b.5.2) for arbitrary p proves the exact independently derived source-overlap classification

\[
 S_R=\lambda_A(p)\hbar\mathcal L^-,\qquad
 S_R-\hbar\mathcal L^-=-\frac{N\hbar}{T}(\pi p-\ln2)\int d\tau.
\tag{N.11b.5.5}
\]

For any positive-duration history this vanishes exactly at $p=p_*$. There is no adjustable ledger scale remaining after the completed-cycle normalization and the independent $\hbar$ calibration. At $p_*$, equality holds historywise, not just at one period or one test trajectory.

#### 6. Common curved history space and populated finite ledgers

Fix the explicit common metric

\[
 ds^2=-n(x)^2c^2dt^2+|dx|^2,\qquad
 n(x)^2=1+2Gx^1/c^2,\quad G>0.
\tag{N.11b.6.1}
\]

This is the same metric used for every probe and its clock and source. Choose a compact convex box $\Omega$ within $n^{2}>0$, a lab-time interval $[0,L]$, fixed endpoints $x_0,x_f\in\Omega$, and budgets

\[
 n_{\min}=\min_\Omega n>0,\quad
 0<v_{\max}<c n_{\min},\quad V<\infty,
 \quad \delta=n_{\min}^2-v_{\max}^2/c^2>0.
\]

Let $K$ be all absolutely continuous paths $x:[0,L]\to\Omega$ with these endpoints, $|\dot{x}|\le v_{\max}$ a.e. and $\operatorname{TV}(\dot{x})\le V$. Require $K$ nonempty, for example $x_0=x_f$ in the interior, which admits the constant path and small nonconstant loops. The ambient topology is strong $W^{1,1}$; on this fixed-initial-point class it is equivalently uniform convergence of $x$ plus $L^1$ convergence of $v=\dot{x}$.

**Compactness.** A sequence in $K$ has velocities bounded in $\mathrm{BV}$ and $L^\infty$, hence an $L^1$-convergent subsequence $v_j\to v$. Integration from $x_0$ gives uniform convergence of $x_{j}$; its limit remains in the closed convex box, preserves endpoints and the speed bound. Lower semicontinuity of variation preserves $\operatorname{TV}(v)\le V$. Thus $K$ is compact in the declared topology. This is a real physical/control budget, not a claim of compactness for all unrestricted relativistic paths. Off shell these paths are admissible controlled histories. Polygon coordinate paths generally require an owned continuous covariant force between vertices as well as finite kicks at vertices; they are not falsely described as free geodesic segments. Smooth metric coefficients and the speed margin bound the force from the connection, and BV velocity bounds the total kick impulse on the compact patch. No such drive modifies the internal $K_{N}$.

For $h=L/2^k$, let $K_{h}$ be the paths in $K$ that are affine on each mesh cell. Let $I_{h}x$ be nodal interpolation. Its velocity on each cell is the cell average of $v$, so it preserves the speed bound and endpoints; convexity preserves $\Omega$. It also preserves the BV budget. To see the last claim, write neighboring averages as integrals over a common offset $s\in[0,h]$; the sum of norms of their differences is at most the average of the variation of $v$ along the increasing offset sample sequence, hence $\le\operatorname{TV}(v)$.

The standard cell double-integral estimate gives

\[
 \|v_h-v\|_{L^1}\le h\,TV(v)\le hV,
 \qquad
 d_h:=\|I_hx-x\|_\infty\le\min\{hV,v_{\max}h/2\}.
\tag{N.11b.6.2}
\]

For the second speed bound, at offset s the interpolation error is bounded by 2 vmax s(h-s)/h. Thus $I_{h}$ x lies in $K_{h}$ and converges to x with an explicit rate.

Define the actual proper-time rate

\[
 a(x,v)=\sqrt{n(x)^2-|v|^2/c^2},\quad
 \tau_x(t)=\int_0^t a(x(s),v(s))ds.
\]

It lies between $\sqrt{\delta}$ and $n_{\max}$. On the convex allowed $(x,v)$ set its derivatives satisfy

\[
 |\nabla_x a|\le C_x:=G/(c^2\sqrt\delta),\quad
 |\nabla_v a|\le C_v:=v_{\max}/(c^2\sqrt\delta).
\]

Therefore

\[
 \sup_{0\le t\le L}|\tau_{I_hx}(t)-\tau_x(t)|
 \le R_h:=C_x Ld_h+C_vhV\longrightarrow0.
\tag{N.11b.6.3}
\]

On a polygon segment beginning at $y$ with velocity $v$ and length $h$, put $\alpha=n(y)^2-|v|^2/c^2$, $\beta=2Gv^1/c^2$. The actual phase increment uses the exact segment proper time

\[
 \Delta\tau=\int_0^h\sqrt{\alpha+\beta s}\,ds
 =\begin{cases}
 2[(\alpha+\beta h)^{3/2}-\alpha^{3/2}]/(3\beta),&\beta\ne0,\\
 h\sqrt\alpha,&\beta=0.
 \end{cases}
\tag{N.11b.6.4}
\]

The timelike margin makes both radicands positive. There is no quadrature approximation or hidden independent clock. Assign each actual cell the finite step entry $-\varepsilon_0\omega\Delta\tau/(2\pi)$, or its positive magnitude, and sum over the $N$ cells and finitely many polygon steps. This is the concrete finite ledger carried by the recovery sequence.

#### 7. Full Gamma recovery for both orientations

On the strong $W^{1,1}$ ambient space define extended functionals

\[
 F_h^\pm(x)=\begin{cases}
 \pm(N\epsilon_0/T)\tau_x(L),&x\in K_h,\\+\infty,&\text{otherwise},
 \end{cases}\quad
 F^\pm(x)=\begin{cases}
 \pm(N\epsilon_0/T)\tau_x(L),&x\in K,\\+\infty,&\text{otherwise}.
 \end{cases}
\tag{N.11b.7.1}
\]

Here $F^-$ is the signed action-oriented implementation and $F^+$ its activity magnitude. The plus-infinity convention is unchanged for the negative orientation.

**Curved recovery claim.** Both sequences are equicoercive and $\Gamma$-converge to their corresponding limits. Every $x\in K$ has the explicit recovery $x_h=I_hx$ with

\[
 |F_h^\pm(x_h)-F^\pm(x)|\le(N\epsilon_0/T)R_h.
\tag{N.11b.7.2}
\]

Proof. Every finite sublevel lies in the same compact $K$, proving equicoercivity for both signs. If $x_h\to x$ and the liminf is finite, pass to a finite-valued subsequence attaining it; compact closed $K$ contains $x$. Strong velocity and uniform position convergence, the derivative bounds above and integration imply $\tau_{x_h}(L)\to\tau_x(L)$. Thus the liminf is exactly $F^\pm(x)$ along that subsequence, giving its required inequality. If $x$ is outside $K$, no finite-valued subsequence converges to it. For $x\in K$, (N.11b.6.2)–(N.11b.6.3) prove admissibility, convergence and (N.11b.7.2). Outside $K$ the recovery upper bound is vacuous. Both limits are proper because $K$ is nonempty, and bounded below because $\tau\le Ln_{\max}$. Each $K_{h}$ is compact and the finite formula continuous, so minima exist. The same proof applies separately to each sign; no false inference of negative $\Gamma$ convergence by multiplying a positive $\Gamma$ limit by $-1$ is made. QED.

This supplies the topology, equicoercivity, liminf, properness and explicit recovery required by Theorem Q.0.1. Its separately fixed $\kappa_A=\hbar$ gives $\hbar F_h^-\xrightarrow{\Gamma}\hbar F^-$. At $p_*$, Section 5 proves $\hbar F_h^-$ equals the ACTUAL Routh action on every polygon; hence its limit is the actual same-source continuum action. This is Corollary Q.0.1 with a populated microscopic phase ledger and source-overlap map.

#### 8. Recovery preserves state, first variations and the Hilbert source

The preceding scalar $\Gamma$ convergence alone would not establish physical source overlap. The following estimates supply that extra gate.

#### 8.1 Actual internal histories

For $U_x(t)=\exp(-iK_N\tau_x(t)/\hbar)$, spectral calculus gives

\[
 \sup_t\|U_{I_hx}(t)-U_x(t)\|\le\|K_N\|R_h/\hbar=NA R_h/\hbar.
\]

Consequently for the same initial density matrix,

\[
 \sup_t\|\rho_{I_hx}(t)-\rho_x(t)\|_1\le2NA R_h/\hbar,
\quad
 |\langle O\rangle_h-\langle O\rangle|\le2\|O\|NA R_h/\hbar.
\tag{N.11b.8.1}
\]

These bounds include the actual joint phase readouts (N.11b.2.4), the clock, the boundary states and every bounded internal observable; the source mean $E_{N}$ is exactly identical at every mesh level because $K_{N}$ is conserved.

#### 8.2 First variations

Take $x\in K$ with explicit strict margins: $\operatorname{dist}(x(t),\partial\Omega)\ge\mu_x>0$ for every $t$, $|v|\le v_{\max}-\mu_v$ a.e. for $\mu_v>0$, and $\operatorname{TV}(v)\le V-\mu_V$ for $\mu_V>0$. Let $\eta$ have zero endpoint values, $\eta\in W^{1,\infty}$, and $\dot{\eta}\in\mathrm{BV}$; a $C^2$ fixed-endpoint variation is sufficient. Put

\[
 s_0=\tfrac12\min\left\{\frac{\mu_x}{\|\eta\|_\infty},
 \frac{\mu_v}{\|\dot\eta\|_\infty},
 \frac{\mu_V}{TV(\dot\eta)}\right\},
\]

omitting zero-denominator entries (and taking any positive $s_0$ if $\eta=0$). Triangle inequalities and subadditivity of variation show $x+s\eta$ is in $K$ for every $|s|\le s_0$. The inner parallel box at distance $\mu_{x}$ is convex, nodal averaging preserves the velocity and variation bounds, and interpolation cannot increase the displayed $\eta$ norms or derivative variation. Hence the same two-sided interval works for every $I_hx+sI_h\eta$. No topological interior of the compact strong-$W^{1,1}$ class is asserted. For $\eta_h=I_h\eta$,

\[
 D F^-(x)[\eta]=-
 \frac{N\epsilon_0}{Tc^2}\int_0^L
 \frac{G\eta^1-v\cdot\dot\eta}{a(x,v)}\,dt.
\tag{N.11b.8.2}
\]

The finite-level derivative has exactly the same formula at $x_h,\eta_h$. The coefficients are smooth with uniformly bounded derivatives under the fixed margin. Uniform $x_h\to x,\eta_h\to\eta$ and $L^1$ velocity convergence, with bounded velocities, imply convergence of both terms. Thus $DF_h^-(x_h)[\eta_h]\to DF^-(x)[\eta]$, and likewise for the plus sign and for $\hbar$ multiples. The corresponding weak worldline variation is the actual action variation by (N.11b.5.5). No generic stationary-point transfer is inferred from $\Gamma$ convergence alone; this direct derivative convergence is the extra certificate. Metric variation is handled next.

#### 8.3 Distributional source convergence with an explicit bound

Let $w=(c,v)$, $W=\sqrt{c^2+v_{\max}^2}$, and let $f_{\mu\nu}(t,x)$ be a smooth compactly supported covariant test tensor in the metric patch. Pairing (N.11b.5.3) with $f$ using its invariant volume gives

\[
 \langle T_x,f\rangle=\frac{E_N}{c}\int_0^L
 \frac{w^\mu w^\nu}{a(x,v)}f_{\mu\nu}(ct,x(t))\,dt.
\tag{N.11b.8.3}
\]

Use Euclidean tensor norms for this estimate and put

\[
 D_x=W^2 C_x/\delta,\qquad
 D_v=2W/\sqrt\delta+W^2C_v/\delta.
\]

Differentiating $B(x,v)=w\otimes w/a$ gives $|\partial_xB|\le D_x$, $|\partial_vB|\le D_v$ and $|B|\le W^2/\sqrt{\delta}$. Along the convex allowed domain the mean-value estimate, (N.11b.6.2) and (N.11b.6.3) yield

\[
 |\langle T_{I_hx}-T_x,f\rangle|\le\frac{E_N}{c}
 \left[\|f\|_\infty(D_xLd_h+D_vhV)
 +\frac{W^2}{\sqrt\delta}\operatorname{Lip}_x(f)Ld_h\right].
\tag{N.11b.8.4}
\]

It tends to zero. The pairing convention incorporates the $\delta$ distribution and volume, so there is no missing determinant factor. Since T is precisely the metric derivative of the same finite-level action, this proves convergence of the actual source map, not merely convergence of an assigned mass number. Force/endpoint distributions are retained separately as in Section 5. At fixed endpoints no endpoint term contaminates a compactly supported interior metric variation.

#### 9. Canonical N.5 admission and the full declared probe quotient

At $p=p_*$, every hypothesis of N.5's rate branch is now populated:

- The actual common boundary has $C_{\mathrm{rel}}=2\ln 2$, $q=1$ and $I_{\mathrm{rel}}=2N\ln 2$, with exact spectral additivity and attained capacity.
- The actual first-return counts are saturated, concurrent and source exhaustive, with $\varepsilon_0=\ln 2$ and $T>0$.
- $C_{\mathrm{rel}}=2\varepsilon_0$ follows independently from the dimension-sharp cut bound and the structural binary support.
- The separately normalized finite phase ledger has the curved recovery of Sections 6–7. The action scale is independently $\hbar$, and the actual state, action and Hilbert source overlap is (N.11b.5.5), (N.11b.8.1) and (N.11b.8.4). Hence $|dS_R/d\tau|=\hbar\dot{\varepsilon}_\partial$ on the same cycles.
- The internal preparation, mean, period, cut entropy and normalization are stationary in proper time.

Thus

\[
 L(Q_N):=m_N=\frac{N\hbar\ln2}{c^2T}
 =\frac{\hbar I_{\rm rel}}{2c^2T}>0
\tag{N.11b.9.1}
\]

is an actual certified mass-action ledger of Theorem N.5 on its rate branch. No thermal/reset conclusion is used.

Fix once and for all a finite $N_{\max}\ge 1$. The admitted probe class consists of all finite tensor words of the elementary canonical cell with total number $1\le N\le N_{\max}$, all parenthesizations and cell permutations, and all their proper-time histories and common-metric test-body placements within the fixed compact metric patch and path/control budgets of Section 6. Recovery and its bounds are asserted on that domain. The local action and Hilbert identities of Section 5 remain valid more generally, but unrestricted non-BV histories are not added to the recovered probe class. A composite is the coincident point-probe tensor product with $K$ the sum. It is not a spatially extended bound body or a new intercell-interacting preparation. This is the complete class; there are no unlisted states or preparation values in its response claim.

Every word uniquely flattens to $Q_{N}$ up to its registered associator and factor-permutation unitary. Those unitaries intertwine K, the state, the whole source and every transported observable. Every admitted composition is one of these words and is thus covered. Histories and placements are common response inputs, rather than changes of the intrinsic coupling record; source maps are compared as functions of the same such inputs.

The retained intrinsic ledger contains $T,p_*,\varepsilon_0,C_{\mathrm{rel}},q,\lambda_A=1$, the action/source/mechanical maps, and their exact no-double-counting certificate. All intensive entries are identical. Every extensive entry $I_{\mathrm{rel}},E,L,S_R,T_{\mathrm{src}}$ and channel count is multiplied by $N$. Define registered common rescaling $Q_N\sim Q_M$ to multiply these extensive entries by $M/N$ while preserving the intensives and every normalized response map. Word associators and permutations are PPI-null. Optional spectroscopic/preparation labels are carried by separate internal-observable certificates; they are not declared null merely because gravity ignores them.

After this specified quotient there is exactly one intrinsic retained coupling record. The derived ratio $\Xi=m_G/m_I$ is 1 for every word and history. The induced map from quotient records to $\Xi$ is therefore injective: two accepted records with the same $\Xi$ differ by exactly the registered common rescaling and word equivalences. This proves non-compensation on the entire admitted class, not on selected pairwise examples. A terminating finite audit enumerates $N,M=1,\ldots,N_{\max}$, checks positivity and equality of the rational symbolic ratio 1, and tests their quotient with the unique factor $M/N$. Word normalization terminates by flattening the finite parse tree and sorting its cells. This is the exhaustive finite comparison procedure required by Definition N.11.0b.

For $Q_{1}$ the actual reference entries are $q_*=1,C_*=2\varepsilon_0,T_*=T$ and $\lambda_{A,*}=1$. Its inertial and gravitational equality is derived in Section 5, not assumed. Thus the canonical reference of Corollary N.11.1 is populated by a physical finite-source action on this formal branch. With $m_0(Q_N)=\hbar I_{\mathrm{rel}}/(2c^2T)$, $\lambda_I=\Theta_T=1$, all sector deviations $D_{AB}$ and Eotvos parameters vanish. A noncanonical Bell family with a different $I_{\mathrm{rel}}/E$ record is not adjoined to this quotient: that record would not be a common rescaling of the present one.

#### 10. Same metric, clock and finite observable protocol

The source-clock phase from (N.11b.2.4) measures proper time modulo $T$, with continuous phase tracking resolving the lift. At each location and prescribed coordinate velocity $v$ it measures $a(x,v)=d\tau/dt$. In a time-adapted chart with $g_{00}<0$, the ten choices $v=0$, $\pm v_0e_i$ ($i=1,2,3$), and $v_0(e_i+e_j)$ ($i<j$), for sufficiently small $v_0$, reconstruct the ten coefficients of the quadratic form

\[
 a^2=-g_{00}-2g_{0i}v^i/c-g_{ij}v^iv^j/c^2.
\]

Differences of the +/- choices give g0i; their sums with $v=0$ give gii; the mixed choices then give gij. All $Q_{N}$ have identical elementary phase clocks and yield the same metric. This also supplies a constructive operational common-metric certificate, rather than merely naming one metric in the action.

For a finite clock-reading window $b>0$ in (N.11b.6.1), follow the owned constant-coordinate-velocity segment and estimate $a_0$ by its lifted phase increment divided by $\omega b$. Along that segment $|da/dt|\le Gv_{\max}/(c^2\sqrt{\delta})$, so the error is at most $e_b=Gv_{\max}b/(2c^2\sqrt{\delta})$. Choose $\omega n_{\max}b<\pi$ to remove phase-wrap ambiguity on a single window. Squaring gives an error at most $\epsilon_{b}=2n_{\max}e_b+e_b^2$ in each observed quadratic value. The linear ten-velocity formulas then bound the metric errors by $\epsilon_{b}$ for $g_{00}$, $c\,\epsilon_b/(2v_0)$ for $g_{0i}$, and $2c^2\epsilon_b/v_0^2$ for both $g_{ii}$ and $g_{ij}$. Thus the differential tomography has an explicit finite-window approximation. These are ideal expectation-value observables; finite sample counting errors, if imposed, are separate from the deterministic window error and must be propagated through the same formulas.

#### 10.1 Source calibration independent of acceleration

An owned Ramsey control applies the same finite $K_{N}$ conditionally on a control qubit, with a fixed zero-generator reference arm. Its generator is $|1\rangle\langle 1|_{\mathrm{control}}\otimes K_{N}$, so the reference and control are explicit calibration apparatus, not additional free-probe rest source. The complex fringe is

\[
 A_N(s)=\operatorname{Tr}(\rho e^{-iK_Ns/\hbar})
 =\left(1-r+r e^{-iAs/\hbar}\right)^N,\qquad r=p_*/2.
\tag{N.11b.10.1}
\]

The control $X$ and $Y$ means determine its real and imaginary parts. Its derivative gives $E_N=-\hbar\operatorname{Im}A_N'(0)$. The symmetric finite estimator

\[
 \widehat E_N(s)=-\hbar\,\operatorname{Im}[A_N(s)-A_N(-s)]/(2s)
\]

obeys, by $|\sin z-z|\le|z|^3/6$,

\[
 |\widehat E_N(s)-E_N|\le
 \frac{\operatorname{Tr}(\rho K_N^3)s^2}{6\hbar^2},
\quad
 \operatorname{Tr}(\rho K_N^3)=A^3\big[Nr+3N(N-1)r^2+N(N-1)(N-2)r^3\big].
\tag{N.11b.10.2}
\]

The last expression is the third moment of an exactly populated Binomial(N,r) occupied energy distribution. This protocol measures the actual rest-energy ledger, including its fixed reference, without using gravitational motion.

#### 10.2 Mechanical and gravitational response

An explicitly instantaneous finite-magnitude kick $J$ in a local orthonormal frame, starting at rest, has $p=J$ and

\[
 v=\frac{c^2J}{\sqrt{E_N^2+c^2|J|^2}},\qquad
 \frac{|J|}{\gamma|v|}=E_N/c^2.
\tag{N.11b.10.3}
\]

The kick source owns its delivered mechanical energy $\sqrt{E_N^2+c^2|J|^2}-E_N$. No finite-duration flat-chart impulse law is asserted in a curved chart. The alternative pointwise response derivative at rest is $\partial p/\partial v=(E_N/c^2)I$.

For metric (N.11b.6.1), free release at $x^1=0,v=0$ has, for $0\le Gt/c<\pi/2$,

\[
 x^1(t)=-\frac{c^2}{2G}\sin^2(Gt/c),\quad
 v^1(t)=-\frac c2\sin(2Gt/c),\quad
 \tau(t)=t/2+\frac c{4G}\sin(2Gt/c),
\]
\[
 p_1(t)=-\frac{E_N}{c}\tan(Gt/c),\qquad
 H_{\rm lab}=n\sqrt{E_N^2+c^2p_1^2}=E_N.
\tag{N.11b.10.4}
\]

Differentiation verifies the Euler–Lagrange equations of (N.11b.5.4) and the proper-time identity. Restrict to a compact initial interval lying in the budgets of Section 6. The trajectory, clock rate and initial acceleration -G are independent of N. This is an exact finite response on the same metric, with the Hilbert coefficient independently available from (N.11b.5.3) and the source mean from (N.11b.10.1).

A static support experiment at potential $\Phi$ has rest lab energy $W(\Phi)=E_N\sqrt{1+2\Phi/c^2}$; the finite quotient

\[
 \frac{W(\Phi)-W(0)}{c^2(\sqrt{1+2\Phi/c^2}-1)}=E_N/c^2
\tag{N.11b.10.5}
\]

measures the passive coefficient. The support is an owned external force. These experiments distinguish the intrinsic source from preparation, support, kick and Ramsey-control work. The construction is an admitted formal measurement model; it does not claim an empirical implementation for arbitrary matter.

#### 11. Owner coverage and the remaining stronger extension

The construction supplies the weak-equivalence ratio predicate on its explicitly classified formal class, including its exact finite source, finite and continuum ledger, independently derived inertial and Hilbert-source maps, common operational metric, complete composite class, no-compensation quotient and finite observables. It also fills the canonical-reference entries and the actual Q.0.1 recovery/source-overlap gate, so the N.5 rate mass-action entry of Definition N.11.0b is populated rather than inferred from a free-standing inverse theorem.

The owner makes an explicit distinction:

- N.5 rate branch uses $T>0$ and the proved same-cycle action/update identification. All five hypotheses are proved here.
- Full $B_{\mathrm{mass}}$ additionally requires the Equation Q.18/Proposition Q.6.1 clock-and-spacing bridge $T=\sqrt{8\varepsilon_0}\,t_P$, $\delta_{\mathrm{spacing}}=\sqrt{8\varepsilon_0}\,L_P$. No Planck length, Planck time or spacing is derived by the present finite source.
- Theorem N.11 literally names full $B_{\mathrm{mass}}$. Applying that particular theorem with its absolute Planck-normalized coefficient still requires the extra bridge. Defining $T$ numerically to match a Planck expression would not by itself prove that bridge.
- Corollary N.11.1's displayed canonical-reference entries and its generalized same-cycle algebra are all populated here. The direct source ratio also follows without invoking Theorem N.11's stronger Planck specialization.

The existing populated history witness fixes $c=1$, $G=1/10$, $\Omega=[-1,1]^3$, $L=1$, both endpoints zero, $v_{\max}=1/2$ and $V=1$. Its $n_{\min}^2=4/5$ and timelike margin $\delta=11/20$. The nonconstant retained path is $x^1=t(1-t)/4$, $x^2=x^3=0$, with velocity total variation $1/2$. These are source-fixed model inputs, not fitted gravitational response parameters.

<a id="theorem-n11-equivalence-principle-from-a-universal-certified-mass-ledger-on-mathfrak-b_mathrmmass-converse-on-the-non-compensation-branch"></a>**Theorem N.11 (Equivalence Principle from a Universal Certified Mass Ledger on $\mathfrak B_{\mathrm{mass}}$; Converse on the Non-Compensation Branch).** Let a tested probe class lie on canonical $\mathfrak B_{\mathrm{mass}}$, with positive certified mass--action ledger $L(P)>0$. Suppose independently checkable mechanical and gravitational realization maps satisfy
$$
m_I(P)=\beta_I L(P),
\qquad
m_G(P)=\beta_G L(P),
\qquad \beta_I,\beta_G>0,
$$
where $\beta_I,\beta_G$ are probe-independent, the operational metric is common, and the source audit is exhaustive and has no double counting. Then
$$
\frac{m_G(P)}{m_I(P)}=\frac{\beta_G}{\beta_I}
$$
for every probe, so the source-to-inertial ratio is universal. Universality of free fall additionally requires the common weak-field test-body response law of Corollary N.7.1. If one independently calibrated reference probe $P_*$ satisfies $m_G(P_*)=m_I(P_*)$, then the common ratio is $1$. Conversely, on the non-compensation branch of Definition N.11.0b, a retained ledger change outside the PPI-null/common-rescaling quotient changes this ratio and violates universality. Equality of $C_{\mathrm{HSW}}$ or $f_{\mathrm{RID}}$ alone is neither necessary nor sufficient.

*Proof.* Positivity permits division and cancels $L(P)$, giving the probe-independent ratio $\beta_G/\beta_I$. Reference equality forces $\beta_G=\beta_I$. The converse is the injectivity clause defining the non-compensation branch. Communication and refresh entries affect the result only through a separately certified map into $\beta_I$, $\beta_G$, or the common metric. ∎

<a id="corollary-n111-ep-violations-as-certified-coupling-ledger-deviations"></a>**Corollary N.11.1 (EP Violations as Certified Coupling-Ledger Deviations).** Fix $\varepsilon_0>0$ and a canonical reference with $q_*=1$, $C_*^{\mathrm{rel}}=2\varepsilon_0$, $\tau_*>0$, and $\lambda_{A,*}=1$. For every tested sector $S$, require
$$
\mathcal I_{\mathrm{rel}}(S),C_*^{\mathrm{rel}}(S),q(S),
\tau_{\min}(S),\lambda_A(S),\Theta_T(S)>0,
$$
the common-value additive/source-exhaustive branch of Corollary N.4.1, and the generalized same-cycle action map
$$
\left|\frac{d\mathcal S_{\mathrm{action}}}{d\tau}\right|
=\lambda_A(S)\hbar\dot\varepsilon_{\partial}(S).
$$
Accept its coefficient as $m_I(S)c^2$, and define
$$
m_0(S):=\frac{\hbar\mathcal I_{\mathrm{rel}}(S)}{2c^2\tau_*},
$$
$$
\lambda_I(S)
:=
\lambda_A(S)
\frac{2\varepsilon_0}{C_*^{\mathrm{rel}}(S)}
\frac{\tau_*}{q(S)\tau_{\min}(S)},
\qquad
\Theta_T(S):=\frac{m_G(S)}{m_0(S)}.
$$
The pre-calibration algebra of Corollary N.4.1 then gives
$$
m_I(S)
=\frac{\lambda_A(S)\hbar\varepsilon_0\mathcal I_{\mathrm{rel}}(S)}
{q(S)C_*^{\mathrm{rel}}(S)c^2\tau_{\min}(S)}
=m_0(S)\lambda_I(S),
$$
and hence
$$
\frac{m_G(S)}{m_I(S)}=\frac{\Theta_T(S)}{\lambda_I(S)}.
$$
For every positive same-unit quantity $X$, define
$$
\Delta_{AB}\ln X:=\ln\frac{X(A)}{X(B)}.
$$
Then, with $r_S:=m_G(S)/m_I(S)$,
$$
\boxed{
D_{AB}:=\ln\frac{r_A}{r_B}
=
\Delta_{AB}\ln\Theta_T
-\Delta_{AB}\ln\lambda_A
+\Delta_{AB}\ln C_*^{\mathrm{rel}}
+\Delta_{AB}\ln q
+\Delta_{AB}\ln\tau_{\min}.
}
\tag{N.35}
$$
For positive test-body accelerations in one common external field, additionally assume the registered response law $a_S=r_Sg$ with common $g>0$ and negligible self-force and backreaction. Then the Eötvös parameter obeys the exact identity
$$
\boxed{
\eta_{AB}
=\frac{2|r_A-r_B|}{r_A+r_B}
=2\tanh\frac{|D_{AB}|}{2}.
}
\tag{N.35a}
$$
Thus $\eta_{AB}=|D_{AB}|+O(|D_{AB}|^3)$ near zero. A refresh-coordinate term may be substituted only if an accepted differentiable overlap certificate fixes one displayed response-active entry as a function of $f_{\mathrm{RID}}$.

*Proof.* Additivity gives $\dot\varepsilon_\partial=\varepsilon_0\mathcal I_{\mathrm{rel}}/(qC_*^{\mathrm{rel}}\tau_{\min})$. The generalized action map and accepted rest-action identification give the displayed $m_I$. Substitute $\lambda_I$ into $r_S=\Theta_T/\lambda_I$ and take logarithms of ratios; common constants cancel, proving (N.35). The registered response law cancels the common $g$ in the Eötvös ratio. Setting $r_A/r_B=e^{D_{AB}}$ and simplifying $2|e^{D_{AB}}-1|/(e^{D_{AB}}+1)$ then gives (N.35a). ∎

### N.11.5a.3 Information-Theoretic Interpretation

<a id="remark-n117-finite-response-coupling-universality"></a>**Remark N.11.7: Finite-Response Coupling Universality.** Data processing constrains distinguishability under a specified CPTP channel. Proposition N.4 instead decomposes state mutual information through a certified relational cut. Theorem N.11 concerns universality of the inertial/stress-source ratio, with value one only after reference calibration. These three statements can coexist, but none implies another without a typed overlap map.

| Ledger | Quantity | Role |
|:--|:--|:--|
| State correlation | $I(S:E)$ and $C_*^{\mathrm{rel}}$ | certified relational mass input |
| Communication | $C_{\mathrm{HSW}}$ | reliable unassisted transmission budget |
| Refresh | $f_{\mathrm{RID}}$ | distinguishability contraction bound |
| Gravity | $m_G/m_I$ | tested source-to-response ratio |

<a id="remark-n118-exact-testable-bound"></a>**Remark N.11.8: Exact Testable Bound.** If $0\le\eta_{AB}\le\eta_{\mathrm{exp}}<2$, then Equation (N.35a) gives the exact falsifier
$$
|D_{AB}|
\le2\operatorname{artanh}\!\left(\frac{\eta_{\mathrm{exp}}}{2}\right).
\tag{N.36}
$$
This bounds the full combination in Equation (N.35), not each coordinate separately. A bound on $f_{\mathrm{RID}}$ follows only after an independently specified differentiable map from $f_{\mathrm{RID}}$ to one displayed coordinate is accepted.

### N.11.5a.4 Connection to Horizon Thermodynamics

The horizon package below is distinct from the equivalence and refresh packages; the comparison makes their optional typed overlap explicit.

<a id="proposition-n6-horizons-as-finite-response-capacity-boundaries"></a>**Proposition N.6 (Horizons as Finite-Response Capacity Boundaries).** Let a causal boundary $\mathcal H$ lie on the full Theorem-E.6 horizon package: a declared retained channel with capacity $C(\mathcal E_N)$, a capacity-achieving coding sequence, an entropy-saturating response distribution, an additive thermodynamic ledger, an effective-link density/refinement certificate, and the calibration defining $G_{\mathrm{op}}$. If the registered horizon branch saturates that certified boundary budget, define the dimensionless retained boundary ledger by
$$
C_{\mathrm{boundary}}(\mathcal H)
:=\frac{S_{\mathrm{rel}}(\mathcal A)}{k_B}.
$$
Then
$$
\boxed{
C_{\mathrm{boundary}}(\mathcal H)
=N_{\mathrm{eff\,links}}C(\mathcal E_N)
=\frac{c^3\mathcal A}{4G_{\mathrm{op}}\hbar}+r_E(\mathcal A)
=\frac{\mathcal A}{4L_{P,\mathrm{op}}^2}+r_E(\mathcal A),
}
\tag{N.37}
$$
where $L_{P,\mathrm{op}}^2:=G_{\mathrm{op}}\hbar/c^3$ and the density/refinement certificate requires
$$
\frac{r_E(\mathcal A)}{\mathcal A/\delta^2}\longrightarrow0
$$
in its declared macroscopic limit. Replacing $G_{\mathrm{op}}$ by measured $G$ requires the independent gravitational calibration of Theorem E.6. Horizonhood alone proves neither channel-capacity attainment nor entropy saturation.

*Proof.* The capacity-achieving, entropy-saturating, and additive-ledger records identify $S_{\mathrm{rel}}/k_B$ with the total retained channel budget. The density/refinement record and Theorem E.6 give the first two equalities in (N.37). The definition $L_{P,\mathrm{op}}^2=G_{\mathrm{op}}\hbar/c^3$ gives the last. Replacing $G_{\mathrm{op}}$ by measured $G$ is exactly the separate calibration clause. ∎

<a id="corollary-n112-typed-separation-of-equivalence-and-horizon-area-certificates"></a>**Corollary N.11.2 (Typed Separation of Equivalence and Horizon-Area Certificates).** The equivalence-principle and horizon-area conclusions use distinct typed certificate packages:

- the equivalence-principle branch uses the relational cut ledger $C_*^{\mathrm{rel}}$, the mass--action coefficient, the inertial response, the retained stress-source map, source exhaustion, and a common operational metric;
- the area-law branch uses the registered unassisted classical capacity $C(\mathcal E_N)$; Proposition E.2a's reset-support bound may supply its numerical value only on a same-channel attainment certificate, together with effective-link density, boundary saturation, and refinement control; and
- the refresh branch uses the contraction factor $f_{\mathrm{RID}}$ only for the registered data-processing or mixing statement.

Neither $C_*^{\mathrm{rel}}=C_{\mathrm{HSW}}$ nor a shared microscopic carrier is implicit. The two conclusions coexist on an intersection branch only if an overlap certificate gives a type-correct map between their state, channel, and response records and proves absence of double counting. Even on that intersection, neither conclusion implies the other.

*Proof.* Theorem N.11 depends on probe-independent inertial and gravitational realization maps, a common metric, and source exhaustion; a reference equality is needed only to set their universal ratio to one. Theorems E.3 and E.6 depend instead on a channel-capacity density and horizon-saturation package. Proposition N.4 explicitly distinguishes quantum mutual information and its relational cut budget from unassisted channel capacity and its reset-support bound, while Theorem N.10 types $f_{\mathrm{RID}}$ as a contraction bound. Hence there is no common mathematical input without an additional overlap certificate. With such a certificate the antecedent packages can coexist; their distinct remaining premises still prevent either conclusion from entailing the other. ∎

### N.11.6 Complexity-Dependent Equivalence Principle Violation

For systems with $C_{\mathrm{agg}}>C_{op}$, the explicit constitutive branch below defines a possible correction ledger.

<a id="theorem-n8-complexity-correction-to-the-equivalence-principle-on-the-cc-gravitational-response-branch"></a>**Theorem N.8 (Complexity Correction to the Equivalence Principle on the CC-Gravitational Response Branch).** Work on the saturated chronometric Appendix-S branch
$$
\Gamma_{\mathrm{deco}}
=\frac{|\Delta E|}{\hbar}K_{\mathrm{eff}}P_{\mathrm{context}},
\qquad K_{\mathrm{eff}}>0,
\tag{N.39}
$$
and on $\mathfrak B_{\mathrm{mass}}^{\mathrm{therm}}(1)$. Let $P:=P_{\mathrm{context}}\ge0$ be constant over the declared response window $\tau_c$, and assume the common-ledger baseline $m_I=m_G=m_0>0$. Hold the baseline relational-cut, clock, utilization, normalization, and action coefficients fixed over that window.

Assume independently a same-cycle incremental response certificate
$$
\dot\varepsilon_{\mathrm{CC}}
:=\frac1{k_B}\left.\frac{dS_{\mathrm{env}}^{\mathrm{reset}}}{d\tau}\right|_{\mathrm{CC}}
=\frac{\mathcal I_{\mathrm{rel}}}{2\tau_{\min}}
\left(1+\Gamma_{\mathrm{deco}}\tau_{\min}\right),
\tag{N.40}
$$
where $S_{\mathrm{env}}^{\mathrm{reset}}$ is the exported same-cycle reset entropy, and assume the action-overlap and mechanical-realization maps
$$
\left|\frac{d\mathcal S_{\mathrm{action}}^{\mathrm{CC}}}{d\tau}\right|
=\hbar\dot\varepsilon_{\mathrm{CC}},
\qquad
m_I^{(\mathrm{CC})}c^2
=\left|\frac{d\mathcal S_{\mathrm{action}}^{\mathrm{CC}}}{d\tau}\right|.
$$
Assume also the retained instantaneous source record and stress-source realization
$$
E_{\mathrm{grav}}^{\mathrm{inst}}
=\eta_{\mathrm{ret}}P\tau_c,
\qquad 0<\eta_{\mathrm{ret}}\le1,
\qquad
m_G^{(\mathrm{CC})}-m_0
=\frac{E_{\mathrm{grav}}^{\mathrm{inst}}}{c^2},
$$
and a source-exhaustion/no-double-counting certificate relating the Appendix-S source, decoherence response, inertial action increment, exported reset entropy, retained energy, and gravitational stress source. Define the independently measurable response coefficients
$$
a:=\frac{\eta_{\mathrm{ret}}\tau_c}{m_0c^2},
\qquad
b:=\frac{|\Delta E|}{\hbar}K_{\mathrm{eff}}\tau_{\min},
$$
which both have units $\mathrm W^{-1}$. Then
$$
m_I^{(\mathrm{CC})}=m_0(1+bP),
\qquad
m_G^{(\mathrm{CC})}=m_0(1+aP),
$$
and the exact fractional response is
$$
\boxed{
\delta_C
:=\frac{m_G^{(\mathrm{CC})}-m_I^{(\mathrm{CC})}}
{m_I^{(\mathrm{CC})}}
=\frac{(a-b)P}{1+bP}.
}
\tag{N.38}
$$
For $|bP|<1$,
$$
\delta_C=(a-b)P+R_2,
\qquad
|R_2|\le\frac{|b(a-b)|P^2}{1-|bP|}.
$$
Neither $C_{\mathrm{agg}}>C_{\mathrm{op}}$ nor the decoherence law proves any of the incremental-response, action-overlap, mechanical-realization, retained-source, stress-source-realization, baseline-equivalence, or no-double-counting premises.

*Proof.* Equation (N.40) differs from the baseline certified structural-update rate by the factor $1+\Gamma_{\mathrm{deco}}\tau_{\min}=1+bP$. The accepted same-cycle action and mechanical-realization maps give $m_I^{(\mathrm{CC})}=m_0(1+bP)$. The retained-source and stress-source-realization records add $\eta_{\mathrm{ret}}P\tau_c/c^2=m_0aP$ to the common gravitational baseline, giving $m_G^{(\mathrm{CC})}=m_0(1+aP)$. Direct subtraction and division prove (N.38). The remainder identity is
$$
R_2=-\frac{b(a-b)P^2}{1+bP},
$$
whose denominator is bounded below by $1-|bP|$. ∎

The separately defined Appendix-S coherence-response coefficient is
$$
K_\Gamma
=\frac{|\Delta E|}{\hbar}K_{\mathrm{eff}}\tau_{\mathrm{coh}}^0
=\frac{4\pi G}{3c^4}(1+3w_c)
\frac{|\Delta E|\,\eta_{\mathrm{ret}}rL_q\tau_c\tau_{\mathrm{coh}}^0}
{\hbar V_S}.
\tag{N.41}
$$
The coefficient $K_\Gamma$ is not the exact response coefficient in Equation (N.38). If an independent calibration gives $a-b=K_\Gamma$, then
$$
\delta_C=\frac{K_\Gamma P}{1+bP};
$$
therefore $K_\Gamma P$ is only the leading small-$|bP|$ term. At the explicitly stipulated fully retained point $\eta_{\mathrm{ret}}=1$ of Remark N.11.2a, Equation (N.41) gives $K_\Gamma P=9.9908\times10^{-41}$.

<a id="remark-n112-distinguishing-prediction"></a>**Remark N.11.2: Distinguishing Prediction.** Standard physics predicts $\delta_C = 0$ exactly. Quantum-spacetime phenomenology commonly parameterizes potential new effects as Planck-suppressed corrections controlled by ratios such as $E/E_P$ (or $p/E_P$), without dependence on macroscopic computational activity (Amelino-Camelia 2013). On the declared branch, the leading small-power signature is $\delta_C=(a-b)P_{\mathrm{context}}+R_2$, with the explicit remainder bound stated after Equation (N.38) in Theorem N.8; the exact law is rational rather than proportional. It differs from a correction controlled only by an energy-to-Planck-scale ratio and becomes a PU prediction only after the decoherence, same-cycle response, mechanical-realization, retained-source, stress-source-realization, coefficient-calibration, and source-exhaustion records are independently accepted.

<a id="remark-n112a-explicit-illustrative-parameter-point-for-equation-n41"></a>**Remark N.11.2a (Explicit Illustrative Parameter Point for Equation (N.41)).** To make the order-of-magnitude statement in Theorem N.8 reproducible, stipulate the following model inputs:
$$
\Delta E=1\,\mathrm{eV},
\quad
r=5\,\mathrm{cm},
\quad
L_q=10\,\mathrm{nm},
\quad
\tau_c=1\,\mathrm{s},
\quad
\tau_{\mathrm{coh}}^0=1.9\times10^{-5}\,\mathrm{s},
$$
$$
V_S=10^{-3}\,\mathrm{m^3},
\quad
w_c=\frac13,
\quad
\eta_{\mathrm{ret}}=1,
\quad
P_{\mathrm{context}}=0.1\,\mathrm W.
$$
Using the CODATA 2022 values of $G$ and $\hbar$, the exact SI value of $c$, and the exact SI electronvolt conversion (Mohr et al. 2025; NIST 2024), Equation (N.41) gives
$$
K_\Gamma=9.9908\times10^{-40}\,\mathrm{W^{-1}},
\qquad
K_\Gamma P_{\mathrm{context}}=9.9908\times10^{-41}.
$$
Equivalently,
$$
\begin{aligned}
K_\Gamma P_{\mathrm{context}}={}&(9.9908\times10^{-41})
\left(\frac{\Delta E}{1\,\mathrm{eV}}\right)
\left(\frac r{5\,\mathrm{cm}}\right)
\left(\frac{L_q}{10\,\mathrm{nm}}\right)
\left(\frac{\tau_c}{1\,\mathrm s}\right)\\
&\times
\left(\frac{\tau_{\mathrm{coh}}^0}{1.9\times10^{-5}\,\mathrm s}\right)
\left(\frac{10^{-3}\,\mathrm{m^3}}{V_S}\right)
\left(\frac{1+3w_c}{2}\right)
\left(\frac{\eta_{\mathrm{ret}}}{1}\right)
\left(\frac{P_{\mathrm{context}}}{0.1\,\mathrm W}\right).
\end{aligned}
$$
These values are stipulated illustrative inputs. The calculation validates only the numerical evaluation and dimensions of Equation (N.41).

<a id="proposition-n81-conditional-self-model-maintenance-mean-heat-ledger"></a>**Proposition N.8.1 (Conditional Self-Model Maintenance Mean-Heat Ledger).** Let a maintenance cycle of duration $\tau_{\mathrm{cycle}}>0$ contain a prescribed deterministic finite number $n_{\mathrm{reset}}$ of sequential classical resets. Require the complete Definition 28 contract for every reset, conditional on the admitted histories, at one temperature $T_{\mathrm{eff}}>0$, with finite mean heats and a justified conditional-expectation and additive heat ledger. Suppose
$$
n_{\mathrm{reset}}\ge c_-C_{\mathrm{uni}}(\delta_{\mathrm{maint}}),
\qquad c_->0,
\qquad H_{p_j}(P_j\mid R_j)\ge h_{\min}>0.
$$
Here the registered $C_{\mathrm{uni}}(\delta_{\mathrm{maint}})$ is finite and nonnegative, $p_j$ is the actual reset law on the admitted history, and $R_j$ includes all classical information retained and unchanged through that reset. The law $p_j$ is unrelated to the relational-utilization coordinate $q$ without a typed bridge. Define the mean bath-heat power and a nominated retained-source coefficient by
$$
P_{\mathrm{reset}}:=\frac{\mathbb E Q_{\mathrm{cycle}}}{\tau_{\mathrm{cycle}}},
\qquad
P_{\mathrm{ret}}:=\eta_{\mathrm{ret}}P_{\mathrm{reset}},
\qquad 0\le\eta_{\mathrm{ret}}\le1.
$$
Then
$$
P_{\mathrm{reset}}
\ge
\frac{k_BT_{\mathrm{eff}}}{\tau_{\mathrm{cycle}}}
c_-h_{\min}C_{\mathrm{uni}}(\delta_{\mathrm{maint}}).
\tag{N.44}
$$
The physical retained-source interpretation of $P_{\mathrm{ret}}$ requires an independent allocation/transfer certificate, including any storage, release or reabsorption and the associated energy supplies. The displayed definition does not itself turn already exported bath heat into retained system energy.

For the laboratory work claim, additionally require the complete prescribed-trajectory, ensemble-mean and source/work-closure premises of Theorem N.UCT, and certify that the net exported mean energy has proper-time density $P_{\mathrm{reset}}(\tau)$ and zero mean spatial momentum in the comoving frame. Then
$$
W_{\mathrm{reset}}^{\mathrm{lab}}
\ge\int_0^{\tau_f}\gamma(\tau)P_{\mathrm{reset}}(\tau)\,d\tau.
\tag{N.45}
$$
If only part of the reset heat is net exported, this formula uses that separately metered export density; retained or stored-energy changes require their own four-momentum entries. Every local-system, environment and radiation source must belong to one exhaustive, nonoverlapping coupling ledger.

*Proof.* The conditional reset contract and the tower property give
$$
\mathbb E Q_j
\ge k_BT_{\mathrm{eff}}h_{\min}.
$$
Finite deterministic summation therefore yields
$$
\mathbb E Q_{\mathrm{cycle}}
=\sum_{j=1}^{n_{\mathrm{reset}}}\mathbb E Q_j
\ge n_{\mathrm{reset}}k_BT_{\mathrm{eff}}h_{\min}
\ge k_BT_{\mathrm{eff}}c_-h_{\min}C_{\mathrm{uni}}(\delta_{\mathrm{maint}}).
$$
Division by the positive cycle duration proves (N.44). The retained coefficient is a declared ledger relation; its physical interpretation needs the separate allocation certificate.

On the net-export branch, the mean comoving four-momentum increment is $(P_{\mathrm{reset}}(\tau)d\tau/c,\mathbf0)$. The prescribed Lorentz boost is linear, so its mean laboratory energy is $\gamma(\tau)P_{\mathrm{reset}}(\tau)d\tau$. The source/work-closure premise and integration give (N.45). Neither argument gives a sample-path heat floor or permits counting the same energy simultaneously as a retained and an exported source. ∎

<a id="remark-n81-magnitude-and-observability"></a>**Remark N.8.1 (Magnitude and Observability).** The self-model maintenance contribution to stress-energy (Equation N.44) is controlled by $\delta_{\text{maint}}$ and $\tau_{\text{cycle}}$, both of which are system-specific parameters not yet bounded from first principles within the framework. The final MICROSCOPE titanium--platinum result is $\eta(\mathrm{Ti},\mathrm{Pt})=(-1.5\pm2.3_{\mathrm{stat}}\pm1.5_{\mathrm{syst}})\times10^{-15}$ (Touboul et al. 2022). Comparison with this result requires a model that maps the retained stress-energy contribution to a signed, composition-dependent Eötvös parameter and propagates the experimental statistical and systematic uncertainties. Determining that map and independently modeling $\delta_{\text{maint}}$ for specific physical systems (e.g., biological neural networks and crystalline solids of equal mass) constitute open problems.

**Definition N.8.1a (Self-Model Maintenance Window Certificate).** Fix $0<\delta_{\mathrm{maint}}<1$, $c_->0$, $C_{\mathrm{avail}}>0$, $T_{\mathrm{eff}}>0$, and $\tau_{\mathrm{cycle}}>0$. The temperature $T_{\mathrm{eff}}$ is the bath temperature used in Equation N.44. The record certifies
$$
C_{\mathrm{uni}}(\delta)\ge
c_-\frac{\log(1/\delta)}{\delta^2},
\qquad
C_{\mathrm{uni}}(\delta_{\mathrm{maint}})\le C_{\mathrm{avail}}.
\tag{N.8.1a.1}
$$

**Proposition N.8.1b (Maintenance Accuracy and Conditional Power Floor).** The certificate of Definition N.8.1a implies
$$
\delta_{\mathrm{maint}}
\ge
\left[
\frac{c_-}{2C_{\mathrm{avail}}}
W\!\left(\frac{2C_{\mathrm{avail}}}{c_-}\right)
\right]^{1/2}.
\tag{N.8.1b.1}
$$
If the record additionally satisfies the complete finite-cycle mean-reset premises of Proposition N.8.1 at the same $T_{\mathrm{eff}}$ and $\tau_{\mathrm{cycle}}$, with the prescribed deterministic count $n_{\mathrm{reset}}\ge c_-C_{\mathrm{uni}}$ and
$$
H_{p_j}(P_j\mid R_j)\ge\ln2
$$
on every admitted reset history, then the mean bath-heat power $P_{\mathrm{self}}:=\mathbb E Q_{\mathrm{cycle}}/\tau_{\mathrm{cycle}}$ satisfies
$$
P_{\mathrm{self}}
\ge
\frac{k_BT_{\mathrm{eff}}\ln2}{\tau_{\mathrm{cycle}}}
c_-^2\frac{\log(1/\delta_{\mathrm{maint}})}
{\delta_{\mathrm{maint}}^2}.
\tag{N.8.1b.2}
$$

*Proof.* Set
$$
A=\frac{2C_{\mathrm{avail}}}{c_-}>0,
\qquad
u=\delta_{\mathrm{maint}}^{-2}>1.
$$
The certificate gives $u\log u\le A$. The function $u\mapsto u\log u$ is strictly increasing on $[1,\infty)$. Solving $u\log u=A$ gives $\log u=W(A)$ and $u=e^{W(A)}=A/W(A)$. Therefore
$$
\delta_{\mathrm{maint}}^2=\frac1u\ge\frac{W(A)}A
=\frac{c_-}{2C_{\mathrm{avail}}}W\!\left(\frac{2C_{\mathrm{avail}}}{c_-}\right).
$$
Positive square roots give (N.8.1b.1). Under the additional reset hypotheses, conditional Landauer and additivity give
$$
P_{\mathrm{self}}\tau_{\mathrm{cycle}}
\ge
k_BT_{\mathrm{eff}}n_{\mathrm{reset}}\ln2
\ge
k_BT_{\mathrm{eff}}c_-C_{\mathrm{uni}}\ln2,
$$
and the complexity lower bound proves (N.8.1b.2). ∎

<a id="theorem-n82-equivalence-complexity-lock"></a>**Theorem N.8.2 (Equivalence–Complexity Lock).** On canonical $\mathfrak B_{mass}$, let
$$
m_0(S):=\frac{\mathcal I_{\mathrm{rel}}(S)}{2\sqrt{8\varepsilon_0}}m_P>0,
$$
and let accepted mechanical and gravitational realization maps give positive coefficients
$$
m_I(S)=m_0(S)+\Delta m_I(S)>0,
\qquad
m_G(S)=m_0(S)+\Delta m_G(S)>0.
$$
For two test bodies $A,B$ in one common external weak field of magnitude $g>0$, let $a_S=[m_G(S)/m_I(S)]g>0$ denote the acceleration magnitudes under the registered response law, with negligible self-force and backreaction. Define
$$
r_S:=\frac{m_G(S)}{m_I(S)},
\qquad
\delta_S:=\ln r_S.
$$
Then the Eötvös parameter obeys the exact identity
$$
\eta_{AB}
:=2\frac{|a_A-a_B|}{a_A+a_B}
=2\tanh\frac{|\delta_A-\delta_B|}{2}.
$$
If an independently accepted linear log-response certificate gives
$$
\delta_S=\zeta_{\mathrm{EP}}\chi_S,
$$
then
$$
\boxed{
\eta_{AB}
=2\tanh\!\left(
\frac{|\zeta_{\mathrm{EP}}|\,|\chi_A-\chi_B|}{2}
\right).
}
\tag{N.46}
$$
For $|\zeta_{\mathrm{EP}}(\chi_A-\chi_B)|\ll1$, this is
$$
\eta_{AB}
=|\zeta_{\mathrm{EP}}|\,|\chi_A-\chi_B|
+O\!\left(|\zeta_{\mathrm{EP}}(\chi_A-\chi_B)|^3\right).
$$
If the accepted source and response maps give $\Delta m_G(S)=\Delta m_I(S)$ for every $S$, then $r_S=1$ and $\eta_{AB}=0$. The complexity measure alone supplies neither the linear response nor a nonzero violation.

*Proof.* Positivity permits division. Substitution of $a_S=r_Sg$ into the Eötvös definition gives $2|r_A-r_B|/(r_A+r_B)$. Since $r_A/r_B=e^{\delta_A-\delta_B}$, elementary simplification gives the hyperbolic-tangent identity. The linear log-response substitution proves (N.46), and the Taylor expansion of $2\tanh(x/2)$ at $x=0$ has linear term $x$ and cubic remainder. Equal inertial and gravitational increments give $r_S=1$ directly. ∎

#### A constructive predictive-maintenance matched-body response

<a id="proposition-n83b-finite-use-self-maintenance-complete-test-source-ownership-and-a-sealed-zero-eotvos-response"></a>**Proposition N.8.3b (Finite-use self-maintenance, complete test-source ownership and a sealed zero-Eotvos response).** On the B.2e committed-report task and the explicitly declared hybrid/atomic background-test source below, there is a matched enable/idle pair with:

1. an actual $\delta=1/8$ qualifying self-predictive strategy, the original task-relative finite $C_{\mathrm{uni}}$, and a physical return of its used workspace/supplier bits with retained model/verification;
2. ten normal-bath gains $W=k_BT\ln 4$ and opposite work-stock debits, a data-independent owned clock, and identical complete falling-carrier Hilbert stress despite the nonzero internal heat transfer;
3. S.1c's independently specified positive external material metric, a derived positive initial released-relative-to-static acceleration $g$, actual paired-null signaling and recoil absorption, and signed/unsigned $\eta=0$ with denominator $2g>0$;
4. a complete fixed-axis finite spin instrument, retained failure records, finite timing/work/force/stock ownership and an explicit total precision-gravity source-model decision whose false rejection probability is less than $1/50$ on its registered source/error domain.

The construction uses a newly declared **neutral compound test** source. Its source parameters, stock laws and measurement settings are fixed before the output law is calculated. The owning source and decision definitions below specify its mechanical, thermodynamic and statistical domain.

*Construction and proof.* The following source, action, finite algorithms and decision specify the branch completely.

#### 1. Exact task and complexity identification

Register $C_{\mathrm{uni}}$ as **the task-relative quantity in B.2e (B.5k--n)** at $\delta=1/8$, $a=1/4$, with the full inherited B.2e competitor grammar and unit acquisition/Boolean architecture. The selected finite source ROM realizes one member of that full task class; $C_{\mathrm{uni}}$ retains its original operation-cost meaning.

The task score is $L=(p-X)^2+\mathbf{1}\{c(q)\ne Y\}+\mathbf{1}\{c(r)\ne Z\}$; its own transition $X=\mathbf{1}\{p\le 1/2\}$ reads the retained self-model. $H$ is immutable and public access to $H$ is only through complete fresh acquisition triples. All provider-internal $H/E/Z$ gates, intermediate inverse wires, clock coordinates and raw bath suffixes remain private. The public macro-call locks all four physical acquisition pulses before returning $X/Y/Z$. This source grammar preserves B.5q's transcript factorization for every admissible competitor.

The actual selected branch sets $p=1/2,r=0$, trains $q$ by majority of five fresh $Y$ values and commits before a sixth fresh evaluation. The displayed 49-gate prefix produces the actual complete triple, majority, evaluation errors and score. The explicit gate identities below establish the path law for both $H$ values and every 12-bit fresh source word. The wrong-majority probability is $53/512<1/8$; correct/wrong conditional performances are $4/7$ and $4/9$, so the B.5n violation probability is exactly $53/512$ for target $25/56$. The task uses B.5n's conditional-performance criterion; its separately computed mean risk is $821/1024$.

Every fixed controlled-X/minterm instruction in the listed prefix is a finite Boolean instruction in B.2f's formal operation realization; each four-private-gate acquisition realizes one public B.5s macro and is physically overcharged rather than undercharged. The actual emitted prefix, stored finite program and readiness trace therefore give a finite admissible strategy cost. The larger emitted native invoice 223,809 counts all 63 registers,111,712 ROM bits, pulse/readiness suppliers and the entire 118-pulse return wrapper, including redundant positive readiness charges. It bounds the cost of that actual strategy prefix from above. Hence

$$
(3/2)\ln 2\le C_{\mathrm{uni},\mathrm{B2e}}(1/8)\le 223{,}809<\infty.
$$

The lower bound is B.5p; the upper bound uses the actual feasible prefix and an overcounted physical trace. The added signal/receiver ROM and substrates have separate physical owners. Both enable states retain the same task/class and information restrictions. Their comparison isolates maintenance *activity*; it supplies neither an unequal structural-$C_{\mathrm{uni}}$ pair nor a universal complexity-response coefficient.

The later private workspace-return routine cannot revise the committed report or provide an extra precommit sign observation. It preserves the actual committed q, verification triple, score and commitment record in nine copied output cells, uncomputes work, then returns the ten used training supplier cells to zero using owned baths. B.2e's committed-report task and all pre-return source observations are preserved. The terminal interface exposes the retained model/verification cells; a post-return old-address archive interface is a separate paid recovery service.

#### 2. Actual internal module and finite-use clock

Use the 63-register, 118-pulse internal source and all-data-independent clock constructed explicitly below. Let $\theta_b=k_BT>0$, $W=\theta_b\ln 4$ and $p_0=4J$. The baseline $m_bc^2>0$ is supplied independently. The ten normal binary-word Gibbs baths have finite mean $W$ each; ten pure work batteries have $W$ each. Every original physical substrate is counted once, for energy $111{,}904\,e$. The normal baths are infinite-dimensional and have finite partition function, mean energy and entropy.

Keep the original 118 smooth nonnegative disjoint pulse profiles on proper-time $[0,L]$, set $L=R/c$ and $\Delta=L/118$, and enlarge the phase circumference to $P=16R/c$. Profiles vanish identically on $[L,P]$. These values are source/control inputs fixed before any outcome. With $f$ linear on the invariant momentum strip, the exact solution on every initialized trajectory is

$$
\begin{aligned}
&q=\tau\text{ before wrap},\quad p=p_0-g_j(q),\quad \langle K_j\rangle=g_j(q), \\
&f(p)+\langle K_j\rangle=p_0.
\end{aligned}
$$

This holds for both enable states and every training word/reference. Logical/flag generators have zero initial expectation by their ready auxiliary flag; reset generators have zero initial expectation by their fresh work batteries. The bounded Hamiltonians conserve that expectation during each pulse. Active logical endpoints implement the emitted gates, passive endpoints are their actual global phase. The source domain fixes classical enables $C=0$ or 1; the displayed unitary retains the corresponding sector phases.

Active finite-use return transfers exactly $10W$ from batteries to the ten baths, while the same closed internal module conserves total mean energy. Its outgoing bath words retain all returned information and all correlations. The controller is off after $\tau=L$, but $q$ continues on its longer circle. The returned workspace coexists with changed bath/battery stocks and an advancing clock. This is **finite-use computational workspace/supplier return**. Definition 28's per-reset cyclic-controller premise and the N.8.1 floor apply to a different contract; the present heat and stress follow directly from the action.

#### 3. Neutral same-action carrier and actual source tensor

Use $c=1$ in this paragraph. On an arbitrary parameter $s$ let $N=\sqrt{-g_{\mu\nu}X'^\mu X'^\nu}$. Supply the neutral compound source action

$$
\begin{aligned}
S_{\mathrm{body}} &= \int[p\,q'+i\hbar\operatorname{Tr}(\rho_0U^{*}U')-NE]\,ds, \\
E &= m_b+111904\,e+f(p)+\operatorname{Tr}[\rho(H_0+K(q))] \\
&\quad +408819\,e_{\mathrm{sub}}+2\epsilon(b_0+b_1) \\
&\quad +e_{\mathrm{fee}}(q_0+z_0+q_1+z_1).
\end{aligned}
$$

Here $H_0$ is exactly the ten bath+battery Hamiltonians, $b_0,b_1$ are the two occupied emission-store bits, and each $(q_j,z_j)$ is its fee supply/receipt pair; these $q_j$ are stock labels, not the phase $q$. The independently supplied positive extra substrates $408{,}819\,e_{\mathrm{sub}}$ count the actual 51,097-byte emission ROM,36 data/status/shadow bits, two event tags and five native service/calibration mounts. All enter the same carrier action before its motion law is varied. The registers' bare logical energies may be degenerate, but their positive substrates remain present.

The symplectic terms are metric-independent and the energy term multiplies the same lapse N. Variation on each smooth segment gives the displayed internal Hamilton equations and

$$
\begin{aligned}
T_{\mathrm{body}}^{\mu\nu} &= \int E\,u^{\mu}u^{\nu}\delta_g\,d\tau, \\
d(Eu_\mu)/d\tau-(E/2)\,\partial_\mu g_{ab}u^{a}u^{b} &= 0.
\end{aligned}
$$

Since the whole $E$ is constant on each between-emission segment, this is the geodesic equation with the same strictly positive inertial coefficient $E$. The passive metric-action derivative is the same coefficient; expanding $-EN$ at rest in a weak static potential gives $-E-E\Phi$. Restoring $c$ yields $m_I=E/c^2=m_G^{\mathrm{pass}}$ from this neutral action.

Initially

$$
E_{\mathrm{ready}}=m_bc^{2}+111904\,e+p_0+20W+408819\,e_{\mathrm{sub}}+4\epsilon+2e_{\mathrm{fee}}.
$$

The start and end emissions each debit $2\epsilon$ from the actual stock term. The fee transfers between carried supply and receipt, so its sum remains $2e_{\mathrm{fee}}$. The first emission precedes the measured geodesic segment and the second follows its last maintenance pulse. Therefore throughout that segment $E=E_{\mathrm{ready}}-2\epsilon>0$ in both enable states. Any positive baseline and positive independent stock parameters give this positivity.

For each internal carried sector the stress is its own action-derived energy times $uu$. During a reset the active bath has $W+Q_j$ and battery $W-Q_j$, with $Q_j=W\sin^2(\beta_j)$ and $\beta_j=\hbar^{-1}\int g_{j}\,d\tau$; passive $Q_{j}=0$. Clock/interaction energies are $p_0-g_j$ and $g_{j}$ in both preparations. Their exchange currents are respectively $\pm\dot{Q}_ju$ and $\pm\dot{g}_ju$, plus the actual transport $e_{\mathrm{sector}}a$ term; summing cancels all internal exchanges. On the geodesic segment $a=0$. These currents are derivatives of the displayed source terms. Thus complete carried $T_{\mathrm{body}}$ is identical although its sector allocation and retained information differ.

#### 4. Background solve, passive response and export ownership

The external metric is the actual S.1c Einstein source with its material bulk and confining shell, $w=1/6,s=x/2$, $x=1/32$. Its bulk/shell actions, stresses and ADM/binding split are consumed unchanged. They give

$$
\begin{aligned}
\alpha &= x+x\sqrt{1-x}-x^{2}/4>0, \\
M_{\mathrm{ext}} &= c^{2}R\alpha/(2G),\quad f=1-\alpha R/r.
\end{aligned}
$$

The source-to-metric map is **background source -> its exact Einstein metric**; all actual probe/signal/detector tensors and open test-port balances remain accounted, but are projected out of this background solve by the declared test model. They retain their nonzero passive Hilbert tensors and coupling to that metric. This exact projected test model fixes the gravitational approximation: a fully coupled or finite-size realization requires its own backreaction, self-force and size-error certificate.

The two bodies start at rest $r_0=4R$ with identical complete energy/stocks and differ only in static enable. Each start/end local leaf emits independently owned future null particles

$$
k_+=\epsilon(u+n),\quad k_-=\epsilon(u-n).
$$

The net comoving spatial momentum is zero, so the body's positive mass changes without changing $u$. Their total local four-momentum $2\epsilon u$ exactly cancels its jump. The finite permutation specified below supplies the normalized emission primitive and preserves that four-momentum identity on its full carrier. Its $2^{18}$ physical binary codes and padded complement, fresh statuses/shadows, fees and once-only scheduler are in the displayed source. All failures retain input/shadow records. Every outward/inward null has its own einbein action and nonzero null stress. Inward signals remain owned transparent test propagation/export across the material boundary.

At the static $r_f=8R$ reference, each outward ping is absorbed by its own freshly released finite-mass catcher:

$$
P_{\mathrm{after}}=M_CU_f+k,\quad M_{\mathrm{after}}=\sqrt{M_C^{2}+2M_CE_{\mathrm{rec}}}.
$$

The actual received energy splits into rest gain and recoil kinetic energy. The photon's ending current and catcher's momentum jump cancel. The complete independently fixed absorption permutation, padded physical codes and fee/status/shadow records are retained. Each catcher subsequently follows its actual free geodesic. The stationary spin is a separate supported receiver; the charged native leaf copies the classical event tag while leaving that spin and the private task registers untouched.

The emitter, nulls and released catchers have explicit action-derived tensors and local vertex balance. The stationary receiver/clock/coil/control and pre-release catcher supports use the **open test-service contracts** of Theorem S.7.3c: their actual force/work, finite storage, Joule heat, interaction-work source, response-time and retained records have named owners. A static carried energy has divergence (dot E U+E a)delta, balanced by its owned open port; zero translational support work does not mean zero force. The source boundary is open at those named S7 ports. Their force/work balances and RL heat/storage ledgers are the admitted detector specification; an autonomous closed anchor/Maxwell-material realization is a stronger source model.

All original 63 registers, ten baths/batteries,118 pulses and $111{,}904\,e$ substrates remain once. The falling wrapper adds $408{,}819\,e_{\mathrm{sub}}+4\epsilon+2e_{\mathrm{fee}}$. At the receiver the displayed inventory includes 407,864 absorption-ROM bits,804,472 controller-ROM bits,36 absorption/status/shadow bits,78 controller/history bits, four spin factors, two finite-mass catchers, support/control/calibration mounts, two fee stocks, positive service durations and all longitudinal/gate actuator/work/heat stores. The finite native service parameters are independently supplied model inputs. The work store is sized before the run to conservative positive peak storage/interaction demands and finite gate/coil/service heat. Recovered energy returns to that same named store. These entries exhaust the once-only stock/port ledger at the declared native strength.

#### 5. Positive operational acceleration and actual fixed-axis readout

The displayed geodesic proof gives the unique smooth released trajectory (the turning-point square-root equation alone is not used), with $r>3.99R$ during $0\le\tau\le R/c$. At release its acceleration relative to the initially comoving **static local reference frame** is

$$
g=\alpha c^{2}/[32R\sqrt{1-\alpha/4}]>0.
$$

Its own proper accelerometer acceleration is zero. This registered relational measurement is the mechanical response used below. Equal passive/inertial coefficients yield $a_A=a_B=g$ in that same external field, so

$$
\begin{aligned}
\eta_{\mathrm{signed}} &= 2(a_A-a_B)/(a_A+a_B)=0, \\
\eta_{\mathrm{unsigned}} &= 2|a_A-a_B|/(a_A+a_B)=0.
\end{aligned}
$$

The positive external source and its geodesic response supply the denominator 2g.

Actual moving emission and null propagation determine the first/second receiver arrivals. With $q=c\tau/R,z=r/R,v=-z',e_{\mathrm{geo}}=\sqrt{1-\alpha/4},N_f=\sqrt{1-\alpha/8}$, their proper interval is

$$
U=(R/c)\,V,\quad V=N_f\int_0^1 dq/(e_{\mathrm{geo}}-v(q)).
$$

This retarded hitting equation includes emitter motion. It obeys $1<V\le 288/277$, $dV/d\alpha\ge 1/16$ and a strictly positive free-minus-held response. The received photon energy is $\epsilon(e_{\mathrm{geo}}-v)/N_f$, derived from the same null propagation.

The static receiver, built on the test-service model of Theorem S.7.3c, is prepared in $|+\rangle$, has fixed longitudinal $H=\hbar\omega Z/2$ with $\omega=c/(4R)$, and fixed physical effect $(I+Y)/2$. First/second arrivals initiate its cubic up/down ramps of $d=R/(4c)$. Their half-areas plus plateau give exactly exposure $U$. The normalized complete spin instrument gives $p=[1+\sin(\omega U)]/2$, with both Born outcomes retained. All native gate/coil/support work is charged; including $Q_{\mathrm{long}}=R_{\mathrm{coil}}I_*^2(U-9d/35)$ and the separately owned interaction work.

The source supplies all ready/failure histories, fresh controller shadows, safe bounded down-ramps, watchdog 8R/c, fixed readout 9R/c and common public release 10R/c in the receiver's proper time. The displayed coarse bounds put the last signal before 6.51R/c and even failure field-off before 8.25R/c. Coordinate release is below 11R/c; the emitter remains exterior and its 16R/c clock has not wrapped. The receiver reports only its failure bit, Born bit and the fixed common release label. Raw arrival times, recoil records, kernel shadows and source/control parameters remain private at their owners.

The source is geometry- and task-data-independent in its full clock/energy response. Active/idle detector laws therefore agree for every fixed common admitted source/calibration record: same geodesic, emission stocks, null/catcher laws, controller history and normalized Born law. The gravity-channel equivalence retains the distinct private task-output and bath-suffix laws. At $x=1/32$ the verified nominal $p$ interval is around 0.6242942393931 and $gR/c^2$ around 0.00194519191319; these values are calculated from the registered source.

#### Constructive source details and proof

The following finite algorithms specify the new primitives completely at the calibrated hybrid/atomic test strength of S.1c and S.7.3c.

**The actual 49-gate predictive prefix.** There are $H$; $E_i,Z_i,X_i,Y_i,O_i$ ($0\le i\le 5$); $q,\mathrm{commit},\mathrm{err}_y,\mathrm{err}_z$; four score bits; nine retained copy bits; one auxiliary flag; enable; three fixed report-code bits; and ten battery bits:63 qubits. Initialize $E_i\sim\operatorname{Bern}(3/4),Z_i\sim\operatorname{Bern}(1/4)$ independently, $H$ fixed, batteries 1, $p=1/2,r=0$, other work 0. Here the report code and the phase-clock momentum are distinct registers despite either sometimes being denoted $p$. A notation $\mathrm{CNOT}(a,b)$ flips $b$ when $a=1$; a negative control flips on 0. Each listed operation is an involution on its full bit space.

For $i=0,\ldots,4$ apply $H\to Y_i,E_i\to Y_i,\text{negative report-threshold}\to X_i,Z_i\to O_i$:20 gates. For each of the 16 five-bit words $y$ with weight $\ge 3$, flip $q$ controlled on the exact word $(Y_0,\ldots,Y_4)=y$:16 gates. Flip commit:1 gate. Perform the four acquisition gates at $i=5$:4 gates. Flip $\mathrm{err}_y$ controlled separately by $q$ and $Y_{5}$; flip $\mathrm{err}_z$ controlled separately by $r$ and $O_5$:4 gates. Flip $\mathrm{score}_0$; flip $\mathrm{score}_2$ separately by $\mathrm{err}_y$ and $\mathrm{err}_z$; flip $\mathrm{score}_3$ controlled by both errors:4 gates. Thus there are 49 gates and the binary score is $1+4\mathrm{err}_y+4\mathrm{err}_z=4L$. Copy $(q,X_5,Y_5,O_5,\mathrm{score}_0,\ldots,\mathrm{score}_3,\mathrm{commit})$ to nine fresh cells; reverse the 49 gates; append one identity-data flag pulse. The resulting logical sequence has $49+9+49+1=108$ pulses. At its end all work has returned, the actual trained model and evaluation are retained, and the original supplier bits are recovered with their full correlations. Ten subsequent pulses return $E_0,\ldots,E_4,Z_0,\ldots,Z_4$ to zero. The evaluation supplier $E_5,Z_5$ and $H$ remain owned.

For either H the majority is wrong with probability

$$
\begin{aligned}
\sum_{k=3}^{5}\binom{5}{k}(1/4)^{k}(3/4)^{5-k} \\
&= (90+15+1)/1024=53/512.
\end{aligned}
$$

Correct/wrong conditional risks are $1/4+1/4+1/4=3/4$ and $1/4+3/4+1/4=5/4$. Therefore the stated conditional performances and violation probability follow directly; averaging gives $3/4+(1/2)(53/512)=821/1024$. The gate-by-gate identities preserve the actual trained model on every source word. The native registry allocates 111,712 immutable program-ROM bits and 118 pulse-service owners. Together with 63 qubits, ten bath mounts and one phase-clock mount this gives 111,904 positive substrate units. This is an explicit finite nonminimal allocation. All supplier/program/readiness preparations and physical pulses are charged; the larger 223,809 invoice is a valid upper bound on the task prefix. Internal provider gates remain private even though they are counted.

**Normal bath and exact one-use return.** For each returned bit supply a separate word bath with basis $v\in\{0,1\}^*$, $H_B|v\rangle=W|v|\,|v\rangle$, and Gibbs probability $(1/2)4^{-|v|}$, where $W=k_BT\ln 4$. Its partition function is 2, mean word length 1, mean energy $W$ and finite entropy $3\ln 2$. Supply a pure battery $A=1$ of gap $W$. Pair every $|b,v,1\rangle$ with $|0,vb,0\rangle$; these disjoint pairs have equal $H_B+H_A$ energy. Let $Y=i\sum_{b,v}(|0,vb,0\rangle\langle b,v,1|-|b,v,1\rangle\langle 0,vb,0|)$, a Pauli-$Y$ operator on each pair, and zero on the complement. Then $Y$ is bounded self-adjoint, norm 1, strongly commutes with $H_B+H_A$, and has zero expectation on every ready $A=1$ input/reference state. A $\pi/2$ rotation gives a phase times the paired partner: the memory is exactly 0, the battery exactly 0, the bath gains exactly $W$, and its word retains $b$. On unpaired sectors the full unitary is still defined. The full supplier retains the displaced information; ten copies give the actual $10W$ transfer.

**Bounded all-data-independent clock.** Choose any fixed smooth bump $b>0$ on $(0,1)$, zero with all derivatives at the endpoints; let $I_b=\int_0^1 b$. On the 118 slots of $\Delta=L/118$ set

$$
\begin{aligned}
g_j(q) &= \pi\hbar\,b((q-j\Delta)/\Delta)/(2\Delta I_b), \\
J &= \max g_j,\quad p_0=4J.
\end{aligned}
$$

All profiles are zero outside their slots and on $L\le q<P=16L$. Choose a smooth $0\le\chi\le1$, equal 1 on $[2J,5J]$, zero outside $[J,6J]$, and $f(p)=p_0+\int_{p_0}^{p}\chi(r)\,dr$. Thus $J\le f\le6J$ and $f=p$ on $[2J,5J]$. For a logical involution $U_j$ use $V_j=U_j\otimes X_{\mathrm{flag}}$ and $K_j=g_j(I-CV_j)$. For a return pulse use $K_j=g_j(I+CY_j)$. Include the actual $H_0$ and canonical/quantum symplectic terms in the body action. The fresh flag/battery makes $\langle CV_j\rangle$ or $\langle CY_j\rangle$ zero at the start; the relevant operator commutes with the instantaneous Hamiltonian, so it stays zero. Therefore

$$
\begin{aligned}
&\dot{q}=f'(p),\quad \dot{p}=-g_j'(q), \\
&q=\tau,\quad p=p_0-g_j(q),\quad \langle K_j\rangle=g_j(q).
\end{aligned}
$$

Since $p$ remains in $[3J,4J]$, $\dot{q}=1$ is self-consistent and closes the invariant-strip proof. This argument holds for all data/reference states. The 108 active flag toggles are even; passive toggles are absent. $\exp[-i(\pi/2)(I-V_j)]=V_j$, whereas a passive logical pulse is its actual global phase. Classical $C=0/1$ is the declared domain. The whole internal energy $f+\langle H_0+K\rangle=p_0+20W$ is constant. The longer clock circumference supplies the off window through the declared release horizon.

**Full finite local emission/absorption kernels.** A seven-bit input word $x$ is mapped once with a fresh status and eight-bit blank shadow. The emission word is $(\text{armed},\text{used},\text{stock},\text{pay},\text{receipt},\text{out},\text{in})$. Test failure conditions in this order:used; not armed; out or in occupied; empty stock; $(\text{pay},\text{receipt})\ne(1,0)$. Otherwise success. Every row marks $\text{used}=1$ and retains the entire old $x$ in shadow code $1+\text{lex\_index}(x)$. A failure changes no other datum. Success changes $(\text{stock},\text{pay},\text{receipt},\text{out},\text{in})$ to $(0,0,1,1,1)$. Status labels in lexicographic order are blank,already-fired,empty-emission-stock,fee-unready,not-armed,occupied-local-null-slot,success. All 128 forward rows are thereby specified independently of gravity. They preserve the shells

$$
(2\,\mathrm{stock}+\mathrm{out}+\mathrm{in},\;\mathrm{out}-\mathrm{in},\;\mathrm{pay}+\mathrm{receipt}),
$$

which are the coefficients of $\epsilon u$, $\epsilon n$ and $e_{\mathrm{fee}}u$ in local four-momentum. On the finite valid carrier $128\times 7\times 129=115{,}584$ states, keep those ready-record rows and, separately in each shell, match unused domain and unused range states in increasing lexicographic order. The specified rows are injective because their old-input shadows are distinct; equal finite shell cardinalities prove that this completion exists and is a permutation. On unused physical three-bit status/eight-bit shadow codes act as identity. The full carrier has $128\times 8\times 256=262{,}144$ codes, all normalized and shell-preserving. Complementary inverse rows remain private under the once-only scheduler.

The absorption word is $(\text{armed},\text{used},\text{photon},\text{caught},\text{pay},\text{receipt},\text{tag\_matches})$. In order test used; not armed; no photon; already caught; wrong tag; fee-unready. Success changes $(\text{photon},\text{caught},\text{pay},\text{receipt})$ to $(0,1,0,1)$; failures only mark used and retain the complete old word. The eight statuses are blank,already-fired,catcher-already-spent,fee-unready,no-incoming-photon,not-armed,success,wrong-event-tag. Complete within shells $(\text{photon}+\text{caught},\text{pay}+\text{receipt})$, then identity-pad unused shadow codes. There are $128\times 8\times 129=132{,}096$ nontrivial-domain states and again 262,144 full physical codes. For fixed actual incoming $k$ the catcher states have $P(\text{caught})=M_CU_f+\text{caught}\cdot k$; hence those shell invariants preserve exact total four-momentum on every completed row. Failure leaves its photon on its owned continuing null geodesic. Both primitives are total normalized classical channels, affine on mixtures, identity on untouched quantum factors, and have two separately stocked once-only invocations.

The paired emitted momenta are future null because $u\cdot u=-1,n\cdot n=1,u\cdot n=0$, and $k_++k_-=2\epsilon u$. The emitter loss therefore cancels exactly, with no spatial recoil. At absorption $P_{\mathrm{after}}=M_CU_f+k$ implies $-P_{\mathrm{after}}^2=M_C^2+2M_CE_{\mathrm{rec}}>0$. The energy receipt $E_{\mathrm{rec}}$ splits into rest gain $M_{\mathrm{after}}-M_C$ and kinetic energy $M_C+E_{\mathrm{rec}}-M_{\mathrm{after}}$. Fee supply/receipt transfers cancel separately. These identities prove local distributional conservation for the actual nonzero worldline/null tensors, without a static clamp impulse.

**Finite receiver controller on every history.** Let mode belong to waiting/up/hold/down/done and let bad,start_seen,end_seen be bits. Initially $(\text{waiting},0,0,0)$. The six events are start,end,up-done,down-done,watchdog,fault. Retain the full old state and event in a fresh nine-bit slot at every event. The following rules specify all $40\times 6$ rows, with unspecified fields unchanged:

- start sets start_seen. Only waiting with previously unseen start enters up and starts the native cubic rise; otherwise set bad.
- end sets end_seen. Hold with previously unseen end enters down and starts the full fall. Up with unseen end enters down, sets bad and starts a safe fall from the actual current coefficient. Waiting enters done/bad. Every other case sets bad.
- up-done sends up to hold; down-done sends down to done. Other modes ignore these completion events, so a canceled rise never restarts current.
- watchdog sends up/hold to down/bad with a safe fall; waiting to done/bad; down remains down and sets bad; done stays done.
- fault sets bad and safely lowers up/hold; waiting enters done; other modes do not change current.

The safe waveform is $h_0[1-h(s/d)],h(t)=3t^2-2t^3,0\le s\le d$, where $h_0\in[0,1]$ is the latched actual current coefficient. It is continuous with finite slope $\le 3/(2d)$. There are at most two delivered signal events, one rise completion, one fall completion and one watchdog: eight fresh history slots suffice. All 24 unused six-bit state codes and unused event codes retain their old code, latch bad and execute the same safe fall before done. This covers every physical code. The full-input history makes each fresh-slot map injective; finite lexicographic completion supplies a total private reversible extension. Every row has probability one, bad is monotone, done never restarts current, and watchdog followed by fall-completion terminates every mode. The static native analog clock/current coordinates and their work/readiness ports are separately owned.

The same finite instrument is executed after field-off on every history, reporting the retained bad bit and both Born outcomes at the same release label. Wrong/missing triggers retain their failure flag and use their actual safe waveform in the same normalized output instrument. The exact ready source has the genuine success history.

**Finite timing and port budgets.** S.1c's larger weak box gives $\alpha\le 15/64$ and $N_f^2\ge 497/512$. During emitter proper time $[0,R/c]$, $r\ge 3R$ and $f\ge 59/64$, whence $t_{\mathrm{last}}\le 384R/(59c)<6.51R/c$ and $U\ge\sqrt{497/512}\,R/c>d=R/(4c)$. Ready fall is finished before $6.76R/c$; watchdog $8R/c$ finishes every failure fall by $8.25R/c$. Fixed readout $9R/c$, effect/copy/setting durations $R/(16c)$ each and release $10R/c$ fit strictly. Coordinate release $<11R/c$. While $r\ge 3R$, inward proper acceleration is at most $5c^2/(384R)$; its displacement by $11R/c$ is at most $605R/768<R$, closing the first-exit bootstrap. Thus the emitter remains exterior and neither $16R/c$ phase clock wraps before release.

Before release, held catchers and the static spin/coil/record package each have their actual standing support force; its zero translational work does not delete that force. After absorption the catchers recoil freely. At most 80 native gate-actuator records use the finite formulas of Theorem S.7.3c

$$
\begin{aligned}
Q_{k,l} &= 6R_lg_l^{2}/(5\alpha_l^{2}d_k), \\
E_{\mathrm{peak},(k,l)} &\le 9L_lg_l^{2}/(8\alpha_l^{2}d_k^{2}), \\
|\dot{I}| &\le 6|g_l|/(\alpha_ld_k^{2}).
\end{aligned}
$$

The longitudinal coil has $Q=R_{\mathrm{coil}}I_*^2(U-9d/35)$, transient $L_{\mathrm{coil}}I^2/2$, and its own supply. The separate ideal interaction port owns $\int\operatorname{Tr}(\rho\dot{H})\,d\tau$; net-zero endpoint work does not mean zero peak stock. Finite independent service-power bounds times the declared clock/detector/record durations own the remaining work. Size the local work store before outcomes to the sum of positive peak interaction/storage demands plus bounded gate/coil/service heat through the watchdog, returning recovered energy to that same store. These are the test-port entries of Theorem S.7.3c defined above.

#### Geometric and calibration proof

For the source family $0<x\le 1/16$, $\alpha=x+x\sqrt{1-x}-x^2/4$ satisfies $(123/64)x\le\alpha<2x\le 1/8$ and $\alpha'(x)>7/4$. S.1c's positive material bulk/shell actions give the exact exterior $f=1-\alpha R/r$. Put $q=c\tau/R,z=r/R,T=ct/R,e_{\mathrm{geo}}=\sqrt{1-\alpha/4}$. Geodesic normalization and Killing conservation give

$$
\begin{aligned}
&fT'=e_{\mathrm{geo}},\quad z'^{2}=\alpha(1/z-1/4), \\
&z''=-\alpha/(2z^{2}),\quad z(0)=4,\quad z'(0)=0.
\end{aligned}
$$

The smooth second-order equation selects the unique released solution, unlike the square-root equation alone at its turning point. On $q\le 1$ a $z\ge 3$ bootstrap gives $v=-z'\le\alpha q/18$ and $z\ge 4-\alpha q^2/36\ge 1151/288>3.99$; a first exit is impossible. Consequently $e_{\mathrm{geo}}\ge 31/32,e_{\mathrm{geo}}-v\ge 277/288$ and $f\ge 23/24$. At the initial turning point static local time is $e_{\mathrm{geo}}\,dt$ and radial proper distance $dr/e_{\mathrm{geo}}$. The geodesic equation gives $d^2r/dt^2=-GM_{\mathrm{ext}}f_0/r_0^2$, so the local relative inward acceleration is $GM_{\mathrm{ext}}/(r_0^2e_{\mathrm{geo}})=\alpha c^2/(32Re_{\mathrm{geo}})>0$. Covariant free-fall proper acceleration remains zero.

Let $h(z)=z+\alpha\log(z-\alpha)$, the dimensionless tortoise coordinate. An outward ping has $T_{\mathrm{arr}}(q)=T(q)+h(8)-h(z(q))$. Since $f=e_{\mathrm{geo}}^2-v^2$,

$$
\begin{aligned}
dT_{\mathrm{arr}}/dq &= (e_{\mathrm{geo}}+v)/f=1/(e_{\mathrm{geo}}-v), \\
V &= cU/R=N_f\int_0^1 dq/(e_{\mathrm{geo}}-v).
\end{aligned}
$$

Thus $1<N_f/e_{\mathrm{geo}}\le V\le 288/277$. The held-at $4R$ comparison function is $V_h=N_f/e_{\mathrm{geo}}$. The bounds $\alpha q/32\le v\le\alpha q/18$ give

$$
63\alpha/4096\le V-V_h\le 256\alpha/8587<\alpha/32.
$$

For source sensitivity let $y=-\partial_\alpha z,w=\partial_\alpha v$. Their equations $y'=w,w'=1/(2z^2)+\alpha y/z^3$ with zero initial values imply $y,w\ge 0$, strictly positive after release. Both $H=N_f/e_{\mathrm{geo}}$ and $v/e_{\mathrm{geo}}$ increase; $H'=H/[16(1-\alpha/8)(1-\alpha/4)]\ge 1/16$. Hence $V'\ge 1/16$. At fixed physical $\omega=c/(4R)$, the actual cubic rise/fall areas give angle $\phi=V/4\in(1/4,72/277)$, and fixed $|+\rangle,Y$ gives $p=(1+\sin\phi)/2$. Its derivative in $\phi$ is at least $217/450$ and $dp/d\alpha\ge 217/28800$. This proves nonzero response, alias-free inverse and positive denominator, without a programmed $g$ coefficient.

For independently bounded placement/duration/frequency errors use the compact box

$$
\begin{aligned}
&\alpha\in[0,1/8],\quad z_0\in[15/4,17/4],\quad z_f\in[31/4,33/4], \\
&\ell=cL_{\mathrm{emit}}/R\in[3/4,5/4],\quad \kappa=\omega R/c\in[1/5,3/10].
\end{aligned}
$$

The same continuation gives $z>3,v\le 5/576,e_{\mathrm{geo}}\ge 29/30,N_f\ge 61/62$ and $e_{\mathrm{geo}}-v\ge 19/20$. Thus $3/4\le V\le 25/19$ and $3/20\le\phi\le 15/38<2/5$, so $dp/d\phi\ge 23/50$. For two records, Gronwall applied on $q\le 5/4$ to $D=|\Delta z|+|\Delta v|$ gives $D'\le D+d_\alpha/18$ and $\exp(5/4)<4$. Therefore $D\le 4d_{z_0}+d_\alpha/6$. Inserting this in $|\Delta v'|\le d_\alpha/18+|\Delta z|/216$ gives $|\Delta v|\le d_\alpha/14+d_{z_0}/40$. The lapse differences obey $|\Delta e_{\mathrm{geo}}|\le d_\alpha/7+d_{z_0}/200$ and $|\Delta N_f|\le d_\alpha/15+d_{z_f}/900$. Dividing by the positive $19/20$ denominator and integrating proves

$$
\begin{aligned}
|\Delta V| &\le (5/12)d_\alpha+(1/24)d_{z_0}+(1/640)d_{z_f}+(20/19)d_\ell, \\
|\Delta\phi| &\le (25/19)d_\kappa+(1/8)d_\alpha+(1/80)d_{z_0} \\
&\quad +(3/6400)d_{z_f}+(6/19)d_\ell+\epsilon_{\mathrm{phase}}.
\end{aligned}
$$

A separately certified complete instrument probability error $\epsilon_{\mathrm{bit}}$ adds to half this phase bound. For the nominal family $|\Delta\alpha|\le(28800/217)|\Delta p|$ and $|\Delta(gR/c^2)|\le|\Delta\alpha|/28$. $R$ uncertainty is separately converted through $g=(c^2/R)(gR/c^2)$ using its positive lower bound. These bounds propagate the named actual parameter errors.

For the explicit $x=1/32$ witness the exact radial parametrization

$$
\begin{aligned}
z &= 4\cos^{2}\chi, \\
1 &= (8/\sqrt{\alpha})(\chi+\sin\chi\cos\chi), \\
T &= e_{\mathrm{geo}}+4e_{\mathrm{geo}}\sqrt{\alpha}\,\chi \\
&\quad +2\alpha\operatorname{atanh}[(\sqrt{\alpha}/(2e_{\mathrm{geo}}))\tan\chi]
\end{aligned}
$$

has its unique $\chi\in(0,1/16)$. Substitution into $V=N_f[T+h(4)-h(z)]$ gives

$$
\begin{aligned}
1.0048908641855897222385204858332542264752<V \\
&<1.0048908641855897222385204858332542264753, \\
0.0019451919131895136667419030665840311489<gR/c^{2} \\
&<0.0019451919131895136667419030665840311490, \\
0.6242942393930993249638398504523962610644<p_0 \\
&<0.6242942393930993249638398504523962610645.
\end{aligned}
$$

These bounds can be reproduced with rational outward intervals as follows, which fixes a finite arithmetic verifier rather than using floating-point evidence. Use grid $10^{-60}$ and round every operation outward. Bracket $\sqrt{a/b}$ by integer-square-root bounds at scale $10^{100}$. Enclose $\sin/\cos$ on $[0,1]$ by 48 Taylor terms plus/minus the next term (alternating terms decrease); enclose $\operatorname{atanh}t$ on $[0,1/2)$ by 48 positive terms and tail $t^{97}/[97(1-t^2)]$; compute $\log y=2\operatorname{atanh}((y-1)/(y+1))$ for the displayed $y$ near 1. Bisect $\chi\in[0,1/16]$ 220 times against the monotone equation $\chi+\sin(2\chi)/2=\sqrt{\alpha}/8$, comparing interval endpoints; if an overlap occurs, retain that bracket. The retained root bracket and the above substitutions with outward operations imply the decimal enclosures. The same calculation gives

$$
p_{\mathrm{free}}-p_{\mathrm{held}}>0.0001183857548932225078422808427122667561.
$$

The analytic continuation/sensitivity argument proves the source family; the nominal rational interval supplies the independent source prediction in the decision.

**Finite quantum measurement.** The receiver has target, retained preparation ancilla, pointer and copied record spin. Its three positive-duration preparation slots specialize the Schmidt/preparation route of Theorem S.7.3c to the exact target $|+\rangle$; unused pure ancilla stock remains retained. With $F=(I+Y)/2$ fixed in its physical tetrad, put $A(F)=\arcsin\sqrt{F}$. A fresh pointer $M=|0\rangle$ and the actual positive-duration generator $\hbar A(F)\otimes Y_M/d_F$ give

$$
|\psi\rangle|0\rangle\to\sqrt{I-F}\,|\psi\rangle|0\rangle+\sqrt{F}\,|\psi\rangle|1\rangle.
$$

A fixed smooth envelope of the same area gives the same endpoint. After the true exposure unitary $U=\exp(-i\omega U_{\mathrm{arr}}Z/2)$, the complete leaves are $K_0=\sqrt{I-F}\,U$ and $K_1=\sqrt{F}\,U$. Their squared adjoints sum to identity, preserving arbitrary spectators; the actual pointer Born read and charged copy to the retained record produce both outcomes. The field is off for these operations. $F$ remains fixed in the physical tetrad throughout the run. The physical $|+\rangle$ input and this fixed $Y$ effect yield $p=(1+\sin(\omega U_{\mathrm{arr}}))/2$ by direct two-component matrix multiplication. On failure histories the safe waveform supplies its actual integral in place of $U_{\mathrm{arr}}$ and the same normalized pointer is executed. All preparation, effect, record and setting/gate/coil/support resources are the finite services of Theorem S.7.3c named above.

#### Precision seal: 1. Object being decided

The null source H0 is the actual paired source specified in Proposition N.8.3b above: an enabled genuine B.2e majority-maintenance body and an otherwise identical disabled body, with the same complete source-action rest coefficient, positive exterior background, release geometry, signal stocks and fixed-axis receiver. Its prediction is the **common gravity-channel law**

$$
\begin{aligned}
p_0 &= [1+\sin(V(\alpha_0)/4)]/2, \\
\alpha_0 &= 1/32+(1/32)\sqrt{31/32}-1/4096, \\
V(\alpha) &= \sqrt{1-\alpha/8}\int_0^1 dq/(\sqrt{1-\alpha/4}-v(q)), \\
z'' &= -\alpha/(2z^{2}),\quad z(0)=4,\quad z'(0)=0,\quad v=-z'.
\end{aligned}
$$

The freely falling body has zero proper accelerometer acceleration. The registered positive acceleration is the initial release relative to the static local frame,

$$
g_0R/c^{2}=\alpha_0/[32\sqrt{1-\alpha_0/4}]>0.
$$

The same-action source gives $m_G^{\mathrm{pass}}/m_I=1$ for each preparation. Hence its signed and unsigned Eotvos parameters are zero with denominator $2g_0>0$. Here $m_G^{\mathrm{pass}}$ is the nonzero passive coefficient established by the action variation above.

The functional tests H0's registered gravity public channel and calibrates its one common nominal-family g. Its image in $\eta$ is the singleton{0}; inference over arbitrary nongeodesic/EP alternatives requires a broader response family. The theorem specifies a predeclared theoretical decision and confidence guarantee; application to experimental observations is a separate record.

#### Precision seal: 2. Independently fixed trial count and stock scaling

Use $n=2^{40}$ independent fresh ready complete trials for each preparation. This fixes one finite precision budget. Each trial is the entire declared finite-use source, including a fresh predictive source, ten normal Gibbs baths and batteries, phase clock, two emission stocks, finite status/shadow ROMs, two null pairs, two catchers, static support/control services, four-spin receiver, pointer and retained outcome. Each complete trial uses fresh stocks and ends at its registered $10R/c$ reference-proper release.

The probability experiment is the finite tensor/product of these complete trials conditional on the one registered deterministic external source/calibration record. It can be realized as finitely many noninteracting labelled test copies, with all stocks and stress/port entries summed once. The finite product uses the same background/test convention as each copy. A common random nuisance, if admitted, must have the stated conditional product law at every retained nuisance value; the guarantee then holds conditionally and by averaging.

All 2n raw status/outcome words are retained. Counts are their deterministic sufficient statistic. Finite sum/comparison postprocessing defines the decision. A physical implementation of this offline algorithm has its own finite Boolean trace/stocks, separate from the falling-body mass. The experiment's actual receiver/controller/record stocks are included in each trial.

#### Precision seal: 3. Fixed calibration and error envelope

The nominal registered dimensionless data are $z_0=4,z_f=8,\ell=1,\kappa=1/4$. The exact source has these values and exact native channels; its actual errors are zero. The seal additionally allows *independently certified* errors bounded by $e_0=2^{-40}$ in each of

$$
\begin{aligned}
&|\Delta\alpha|,\;|\Delta z_0|,\;|\Delta z_f|,\;|\Delta\ell|, \\
&|\Delta\kappa|,\;\epsilon_{\mathrm{phase}},\;\epsilon_{\mathrm{bit}}.
\end{aligned}
$$

The actual compactness $\alpha$ is one fixed common source parameter across both bodies and all trials; the other bounded geometry/instrument discrepancies may vary deterministically across trials. Each actual parameter remains in the broad geometry box above. The first five errors use its dimensionless definitions. $\epsilon_{\mathrm{phase}}$ owns residual ramp-area/gap-axis/timing error not counted again in those five coordinates. $\epsilon_{\mathrm{bit}}$ bounds the unconditional probability discrepancy of the complete final instrument's binary coordinate (assign bit 0 to a non-success for this bound), after the phase contribution. Each error has its independently certified source/service record.

The displayed geometric phase-error bound and $|\sin a-\sin b|\le|a-b|$ give

$$
\begin{aligned}
|p_{\mathrm{actual}}-p_0| &\le e_0\cdot[(25/19+1/8+1/80+3/6400+6/19+1)/2+1] \\
&< 4e_0=:e.
\end{aligned}
$$

This holds separately for A and B, even for distinct bounded placement/readout errors. These differences enter as nuisance deviations from the ideal matched geometry. The actual same-action ideal source still has ratio one.

The exact ready control source has failure probability zero. To state an optional robust complete-instrument extension, allow a separately certified per-trial probability of any retained non-success status at most $f_0=2^{-80}$. These failures are never postselected. The union probability of any such flag over $2n$ trials is at most $2nf_0=2^{-39}$. The concentration statement below applies to the unconditional bit coordinate of the normalized complete channel with its displayed bias bound. A failed record may be assigned bit 0 for this intermediate calculation, while the final decision still rejects its non-success flag. Ready exact channels make this distinction vacuous.

All allowed error records and probability guarantees are frozen before outcomes. The nominal p0 is enclosed, by the integer/rational interval proof above, in the rational interval

$$
\begin{aligned}
P=[&0.6242942393930993249638398504523962610644, \\
&0.6242942393930993249638398504523962610645].
\end{aligned}
$$

Their width is $10^{-40}$. The decision registry `N.8.3b-majority-neutral-test-source-seal` with release convention `receiver-proper-10R/c` fixes those rational decimals, all tolerances, $n$ and the release convention.

#### Precision seal: 4. Total finite functional

The actual native public trial record is (receiver_failure,bit,common_release_label), with two bits and the fixed release label. The private arrival times, recoil energies and kernel shadows retain their previously assigned owners. The local receiver controller supplies its already owned failure bit for missing, wrong-tag, duplicate or out-of-order input; all private source statuses/shadows remain retained at their original owners. The counting map uses the two-bit public words, records $N_A,N_B,K_A,K_B$ and $F_A,F_B$, where $N$ counts every trial, $K$ counts the nominated bit (assigned zero when receiver_failure=1), and $F$ counts every public failure. The fixed common release label is a record-interface check, not a variable timestamp observable. All raw public words remain available to verify the map.

The following rational functional has exactly these outcomes:

1. **INVALID** if the registered identifier and release convention or syntax/count domain fail, $N_{A}$ or $N_{B}$ differs from $n$, a count is not an integer in its required range, or the raw-to-count check fails. This outcome identifies an input/provenance failure.
2. **REJECT_SOURCE** if $F_A+F_B>0$. This rejects the registered ready-source record without dropping failed trials.
3. Otherwise put $h=2^{-18}$ and

   $$
   I_S=[K_S/n-h-e,\ K_S/n+h+e] \cap [0,1].
   $$

   Let $J=I_A\cap I_{B}$ BEFORE using $P$. Return **COMPATIBLE_SOURCE** iff $J\cap P$ is nonempty, and **REJECT_SOURCE** otherwise. Store $J$ separately from $J\cap P$, together with all exact endpoints and the reason.

All comparisons are rational integer arithmetic. Equality endpoints are compatible. The function terminates on every finite syntactically valid count input and uses no search that can run forever at a transcendental equality. The separate raw record-to-count map is a bounded finite loop over exactly 2n words. Arbitrary malformed finite inputs are INVALID.

#### Precision seal: 5. Confidence guarantee and finite sensitivity

For independent bounded Bernoulli bit coordinates, not necessarily identical under independently fixed per-trial bounded calibration errors, Hoeffding's exponential argument gives

$$
\Pr(|K_S/n-\operatorname{mean}_ip_{Si}|>h)\le 2\exp(-2nh^{2}).
$$

The common $p_0$ lies within $e$ of each mean. Thus, outside a union event of probability $\le 4\exp(-32)$, both $I_{A}$ and $I_{B}$ contain the true $p_0$ in $P$. The functional is compatible unless a retained failure is present. Including its separate union budget,

$$
\Pr_{H_0}(\mathrm{REJECT\,SOURCE})\le 4\exp(-32)+2^{-39}<1/50.
$$

An elementary rational proof of the conservative inequality is $\exp(32)>1+32+32^2/2=545>400$, hence $4\exp(-32)<1/100$, while $2^{-39}<1/100$. INVALID lies outside the valid experiment-record probability space. The exact source has no status-failure contribution.

Conversely a decision rejection is compatible with shot noise at the declared small probability, a wrong calibration/source record, unmodeled support/control dynamics, or a different force law. The source-model decision reports that disagreement under its stated attribution domain.

The nominal $p(\alpha)$ is strictly increasing and $dp/d\alpha\ge 217/28800$. Thus one can map the **untruncated common interval $J=I_A\cap I_B$**, intersected with the nominal-family response range $p([0,1/8])$, through its registered inverse, with $|\Delta\alpha|\le(28800/217)|\Delta p|$ and $|\Delta(gR/c^2)|\le|\Delta\alpha|/28$. The per-trial bias relative to $p(\text{actual common }\alpha)$ uses only the non-$\alpha$ nuisance terms; the same $4e_0$ envelope is conservative for those fewer terms. Consequently $J$ covers that common ideal response with the same union bound. Intersect its inverse with the independently registered actual common-$\alpha$ calibration interval and with $\alpha>0$. **Do not invert $J\cap P$ for this purpose:** $P$ encloses the fixed nominal $p_0$, not all allowed actual source parameters. The small source-calibration offset may move $p(\text{actual }\alpha)$ outside $P$ while remaining in $J$. $J\cap P$ is solely the nominal-source compatibility statistic. The interval estimates the one common source parameter. The fixed $Y$ phase is alias-free in $[3/20,2/5]$, with $|\Delta\phi|\le(50/23)|\Delta p|$; finite inverse bounds require no unobserved timestamp readout.

At $x=1/32$ the actual source-derived free/held probability separation is rigorously greater than 0.0001183857548932225078422808427122667561, while $4(h+e)<0.000015259$. Therefore the derived instrument has finite gravity sensitivity larger than the seal's conservative statistical/calibration width. The held comparator serves as a calculated response function. The source-model test above still concerns the active/idle falling pair.

For any integer $m\ge 18$ the family $n=2^{2m+4}$, $h=2^{-m}$ and independently certified decreasing calibration errors gives the same exponent 32 and arbitrarily fine model-family precision with finite (increasing) stocks. This gives finite-resource model-family precision at every registered $m$.

The complete finite source law is the product/causal composition of the displayed normalized primitive leaves, the actual Hamiltonian propagators and the final pointer instrument. The same action gives identical falling-carrier stress and mechanics, while the positive external background gives a nonzero relational denominator. The retarded readout and independent source prediction make the decision gravity-sensitive: equal count arrays shifted sufficiently far from P are rejected. The confidence proof uses all outcomes and explicitly scales failure probabilities by the number of trials. This proves the four assertions. ∎

### N.11.7 Conditional Connection to Particle-Mass Hierarchies

<a id="proposition-n5-mass-ratios-from-information-ratios"></a>**Proposition N.5 (Mass Ratios from Information Ratios).** On the canonical mass--action branch $\mathfrak B_{\mathrm{mass}}$ of Theorem N.5, let two systems have relational information contents $\mathcal I_1\ge0$ and $\mathcal I_2>0$. Then
$$
\frac{m_1}{m_2}=\frac{\mathcal I_1}{\mathcal I_2}.
\tag{N.42}
$$

*Proof.* Theorem N.5 gives, for $i=1,2$,
$$
m_i=K\mathcal I_i,
\qquad
K:=\frac{m_P}{2\sqrt{8\varepsilon_0}}>0.
$$
Since $\mathcal I_2>0$, one has $m_2=K\mathcal I_2>0$, and division is legitimate. Therefore
$$
\frac{m_1}{m_2}
=\frac{K\mathcal I_1}{K\mathcal I_2}
=\frac{\mathcal I_1}{\mathcal I_2}.
$$
∎

<a id="theorem-n9-information-hierarchy-compatibility-under-a-common-mass-certificate"></a>**Theorem N.9 (Information--Hierarchy Compatibility under a Common Mass Certificate).** Assume Proposition N.5 at one declared matching scale and an accepted Theorem-T.39 certificate that realizes the same charged-lepton sector matrix and verifies the residual-bearing Theorem-T.42.6 exponents $L_{\tau\mu}$ and $L_{\mu e}$. Then
$$
\log\frac{\mathcal I_\tau}{\mathcal I_\mu}
=\log\frac{m_\tau}{m_\mu}=L_{\tau\mu},
\qquad
\log\frac{\mathcal I_\mu}{\mathcal I_e}
=\log\frac{m_\mu}{m_e}=L_{\mu e}.
\tag{N.43}
$$
Consequently,
$$
\log\frac{\mathcal I_\tau}{\mathcal I_e}
=\log\frac{m_\tau}{m_e}
=L_{\tau e}:=L_{\tau\mu}+L_{\mu e}.
$$

*Proof.* Proposition N.5 gives equality of every positive mass ratio with the
corresponding information ratio. The accepted T.39 certificate supplies the
two common-scale mass/exponent equalities. Multiplication of adjacent positive
ratios and taking logarithms gives the final identity. ∎

**Corollary N.9.1 (Certificate-Gated Ordered Lepton-Ratio Invariant).** If
$L_{\tau\mu}\ne0$, the hypotheses of Theorem N.9 give
$$
\mathcal R_\ell
=\frac{\log(m_\tau/m_e)}{\log(m_\tau/m_\mu)}
=\frac{L_{\tau\mu}+L_{\mu e}}{L_{\tau\mu}}.
$$
On Theorem T.42.6's registered zero-remainder branch this diagnostic is
$$
\mathcal R_\ell^{\mathrm{model},(0)}
=2.922175196389323\ldots.
$$
The value $3$ occurs only in the leading quadratic subbranch with one common
coefficient and zero quartic and higher residuals. The information scale
cancels, but the physical equality remains gated by the common Proposition-N.5
and Theorem-T.39 certificate package. ∎

<a id="proposition-n9a-information-invariant-flavor-mass-modulus"></a>**Proposition N.9a (Information-Invariant Flavor-Mass Modulus).** Fix a three-dimensional flavor-label carrier $F$ with basis $e,\mu,\tau$ and one common finite system--environment carrier. Fix $p\in(0,1)$ and, for each flavor $f$, let
$$
|\Psi_f\rangle
=|f\rangle_F\otimes
\left(\sqrt p\,|00\rangle_{SE}+\sqrt{1-p}\,|11\rangle_{SE}\right),
\tag{N.9a.1}
$$
so all three relational informations equal
$$
I_f=2h(p),
\qquad
h(p)=-p\ln p-(1-p)\ln(1-p)>0.
\tag{N.9a.2}
$$
Independently choose any positive ordered triple $(m_e,m_\mu,m_\tau)$ and define the flavor mass operator
$$
M_{\mathrm{fl}}=\operatorname{diag}(m_e,m_\mu,m_\tau).
\tag{N.9a.3}
$$
Every relational state, reduced spectrum, mutual information and same-scale information ratio is unchanged as the positive triple varies, while both mass ratios vary freely. More generally, local unitaries on either side of the split preserve all $I_f$ and can change the displayed wavefunction representatives. Therefore accepted flavor wavefunctions and relational mutual information do not determine a mass hierarchy without a separately fixed common-scale map from those states to $M_{\mathrm{fl}}$ and its RG transport.

*Proof.* The reduced $S$ and $E$ eigenvalues of (N.9a.1) are $p,1-p$, so purity gives $I_f=2h(p)$ for each flavor. Equation (N.9a.3) is an independent positive operator on the flavor-label factor and imposes no constraint on those reduced eigenvalues. Choosing, for example, $(1,2,3)$ and $(1,4,16)$ yields response-distinct mass ratios over identical information data. Mutual information is invariant under local unitaries, proving the final statement. ∎

<a id="theorem-n9b-independently-calibrated-same-source-state-to-mass-realization"></a>**Theorem N.9b (Independently Calibrated Same-Source State-to-Mass Realization).** On the finite charged free-Dirac source below, complete marked covariance and an independently calibrated same-clock reference determine the actual flavor mass matrix. The same generator supplies its physical rest poles, a normalized finite control/readout realization, exact free shell reduction and explicit cutoff, calibration, statistical and instrument remainders. On the fixed-carrier selected-pair family, Definition N.6 mutual information has the stated calibrated nonlinear inverse to a scalar rest mass. The canonical kinetic action, source coefficients, positive mass domain and calibration providers are explicit branch inputs.

*Proof and source specification.*

### Source, covariance, response and complete invoice

#### 1. Source, independent inputs, and physical clock

Fix $\hbar>0$, $c>0$, a spacing $a>0$, an integer $n\ge 2$, and a spatial periodic box of side $L=na$. Time $t$ is continuous physical time; $a$ never rescales this clock. There are twelve complex fermion modes per site: a four-component Dirac spinor and a marked three-dimensional flavor space. All original annihilation modes carry one common registered $U(1)$ charge. Antiparticle excitations below have the opposite charge. The finite one-particle dimension is $d=12n^3$ and Fock dimension $2^d$.

Let $B$ and $A_i$, $i=1,2,3$, be fixed Hermitian 4 by 4 Dirac matrices satisfying $B^{2}=A_i^{2}=I$, $\{B,A_i\}=0$ and $\{A_i,A_j\}=2\delta_{ij}I$. Their traces and $\operatorname{Tr}(B A_i)$ vanish. Fix a Hermitian positive definite flavor energy matrix $\Delta$, a Wilson coefficient $r>0$, and bounds

$$
0<\Delta_{\min}I\le\Delta\le\Delta_{\max}I.
$$

$\Delta$ belongs to the source's onsite coefficients, rather than an independent mass readout added after preparation. The following explicit graph fixes an example without importing any particle mass:

$$
\begin{aligned}
\Delta &= E_{*}(I_3+L_{\mathrm{path}}), \\
L_{\mathrm{path}} &= \begin{bmatrix} 1 & -1 & 0 \\ -1 & 2 & -1 \\ 0 & -1 & 1 \end{bmatrix}, \\
E_{*} &= \hbar/\tau_{*},\quad \tau_{*}>0\text{ registered independently}.
\end{aligned}
$$

Its eigenenergies are $E_*,2E_*,4E_*$ with eigenvectors proportional to $(1,1,1)$, $(1,0,-1)$, $(1,-2,1)$. For the explicit exact test source choose $b=\log(2)/E_*$; a reference gap $E_{\mathrm{ref}}=E_*$ then has occupation $1/3$, and the three positive-energy rest occupations are $1/3,1/5,1/17$. These choices are independent source/calibration inputs. This graph is a source choice, not a derivation of the original predictive flavor operator.

On the box momenta $p_i=2\pi\hbar k_i/L$ in the first Brillouin zone define

$$
\begin{aligned}
k_{a,i}(p) &= (\hbar/a)\sin(ap_i/\hbar), \\
w_a(p) &= (r\hbar c/a)\sum_i[1-\cos(ap_i/\hbar)], \\
h_a(p) &= c\sum_iA_ik_{a,i}(p)\otimes I_3 \\
&\quad +B\otimes[\Delta+w_a(p)I_3].
\end{aligned}
\tag{1}
$$

The many-body source is $H_a=\mathrm{d}\Gamma(h_a)$, with its full finite ground-energy baseline retained. Its clock is $\exp(-iH_{a}t/\hbar)$. In position space (1) has nearest-neighbor hopping: the onsite matrix is $B\otimes(\Delta+3r\hbar c/a\,I)$; the coefficient of $\exp(+i a p_i/\hbar)$ is $(\hbar c/2a)(-iA_i-rB)\otimes I$ and the reverse coefficient is its adjoint. This explicitly fixes support, strength and units. Strength grows as $1/a$ in a continuum sequence.

The physical dimensionful mass matrix on the limiting Dirac branch is $M=\Delta/c^{2}$. Defining that output is justified by the poles in section 3, not by a name assigned to a label register. No dynamical photon, weak interaction or Higgs field is included. The common global charge may be probed by a registered external $U(1)$ potential; no Standard Model RG claim follows.

#### 2. Thermal state, calibration, and exact inverse

Fix a positive inverse temperature b, with units inverse energy, and initially set chemical potential $\mu=0$. The same physical generator prepares the finite Gibbs state

$$
\rho_a=\exp(-bH_a)/\operatorname{Tr}\exp(-bH_a).
$$

Section 5 constructs its pure finite preparation, including native drift. The retained system alone is Gibbs/KMS for its free source flow. The total pure system-purifier state is not asserted to be KMS.

For the convention $C_{ij}=\operatorname{Tr}(\rho a_j^\dagger a_i)$, diagonalization of $h_{a}$ makes every mode independent. A mode of one-particle energy $e$ has probabilities proportional to $1$ and $\exp(-be)$, whence

$$
C_a=[I+\exp(bh_a)]^{-1}.
\tag{2}
$$

All eigenvalues lie strictly between zero and one at every finite regulator. Thus the Hermitian matrix logarithm gives

$$
\begin{aligned}
K_b(C) &= b^{-1}[\log(I-C)-\log C], \\
K_b(C_a(p)) &= h_a(p).
\end{aligned}
\tag{3}
$$

This is a physical-clock inverse only because (2) has been proved for the actual source generator. An arbitrary covariance is not silently promoted to a physical Hamiltonian. The nonlinear logarithm is classical parameter reconstruction from the completely normalized measurement records of independent prepared copies. It is not a CPTP operation that changes a single unknown state into a new mass operator. The formal realization is the common source relation and its physical readout, rather than a universal state-controlled mass actuator.

Define the fixed marked partial trace

$$
\Phi_B(X)=(1/4)\operatorname{Tr}_{\mathrm{Dirac}}[(B\otimes I_3)X].
$$

Using the Dirac trace identities, (1)-(3) imply the full, label-locked state-to-mass map

$$
M=(1/c^{2})[\Phi_B(K_b(C_a(p)))-w_a(p)I_3]
\tag{4}
$$

at every registered momentum, and in particular $M=\Phi_B(K_b(C_a(0)))/c^{2}$. One common $b$ and one common spin/flavor frame are used. If a chemical potential is included, $K_b(C)=h_a-\mu I$, and $\Phi_{B}$ removes that scalar exactly. The scalar is separately recovered as $\mu=-\operatorname{Tr}K_b(C)/12$. No unknown matrix-valued chemical potential is admitted.

The independent energy-temperature calibration is a neutral reference two-level system with Hamiltonian $E_{\mathrm{ref}}|1\rangle\langle1|$, $E_{\mathrm{ref}}>0$. $E_{\mathrm{ref}}$ is registered by its real-time Ramsey phase $E_{\mathrm{ref}}t/\hbar$ on the same clock, independently of $\Delta$. Prepare this reference at the same $b$. Its occupation $q_{\mathrm{ref}}$ in $(0,1/2)$ satisfies

$$
b=\log[(1-q_{\mathrm{ref}})/q_{\mathrm{ref}}]/E_{\mathrm{ref}}.
\tag{5}
$$

The source supplies the reference and its common-temperature preparation; it does not infer common temperature from arbitrary occupations. Multiplying every source energy by $s$ and replacing $b$ by $b/s$ leaves $C$ unchanged. Equation (5) removes this scale freedom with an independently owned datum. A many-body additive scalar also leaves $C$ unchanged; the finite baseline is fixed by $H_a=\mathrm{d}\Gamma(h_a)$, not reconstructed from covariance. No metric-variational vacuum energy is inferred from (4).

Equations (2)-(5) can equivalently be proved in the usual quasifree density-matrix representation. The relevant public provenance is Peschel (2003). The elementary diagonalization above proves the formula needed here without importing an inverse modular-flow-to-physical-clock assumption.

#### 3. Poles and retained propagation from the same operator

The flavor matrix commutes with the spin matrices and the Wilson scalar. Consequently

$$
\begin{aligned}
h_a(p)^{2} &= I_4\otimes[c^{2}|k_a(p)|^{2}I_3 \\
&\qquad +(\Delta+w_a(p)I_3)^{2}].
\end{aligned}
\tag{6}
$$

If $\Delta=\sum_j\delta_j P_j$, every flavor projector is obtained from the same matrix reconstructed by (4). The source poles are

$$
\begin{aligned}
E_{a,j}(p) &= \sqrt{c^{2}|k_a(p)|^{2}+(\delta_j+w_a(p))^{2}}, \\
z &= \pm E_{a,j}(p),
\end{aligned}
\tag{7}
$$

with the usual spin multiplicity two. For Im $z>0$ the actual retarded one-particle transfer is

$$
\begin{aligned}
R_a(z,p) &= [zI-h_a(p)]^{-1} \\
&= [zI+h_a(p)]\,[z^{2}I-h_a(p)^{2}]^{-1}.
\end{aligned}
\tag{8}
$$

The sign convention is fixed by exp(-i $h_{a}$ t/hbar). Matrix elements of that unitary and of (8) are retained preparation/readout amplitudes in the same marked modes. Preparation of a one-excitation wave packet, free evolution for t, and a registered linear-optical mode readout realize these amplitudes; finite full instruments and drift ownership are in section 6. No unrelated mass-observable matrix is appended.

At $p=0$, $k_a=w_a=0$, so the positive rest poles are exactly $\delta_{j}$ at every $a$ and $n$. The limiting continuum operator is

$$
\begin{aligned}
h(p) &= c\,A\cdot p\otimes I+B\otimes\Delta, \\
E_j(p) &= \sqrt{c^{2}|p|^{2}+\delta_j^{2}}.
\end{aligned}
$$

Hence its Lorentzian mass shell is $E^{2}-c^{2}p^{2}=\delta_j^{2}=m_j^{2}c^{4}$ and $m_j=\delta_j/c^{2}$. The continuum kinetic curvature is $d^{2}E_j/dp_i\,dp_k\ \text{at zero}=\delta_{ik}/m_j$.

At finite Wilson spacing the kinetic curvature is different and is explicitly retained:

$$
\begin{aligned}
1/m_{\mathrm{kin},a,j} &= c^{2}/\delta_j+r\,a\,c/\hbar, \\
m_{\mathrm{kin},a,j} &= m_j/[1+r\,a\,\delta_j/(\hbar c)].
\end{aligned}
\tag{9}
$$

Thus a finite regulator's acceleration/group-velocity curvature is not silently identified with its rest pole. Its relative discrepancy is at most $r a\Delta_{\max}/(\hbar c)$, and vanishes in the stated common-clock limit. This does not prove a force-response map for an arbitrary externally projected force protocol.

#### 4. Uniform band remainders and exact free reduction

Fix a physical momentum ball $|p|\le P$ and compare regulator momenta with the same continuum momenta. The elementary inequalities $|\sin x-x|\le|x|^{3}/6$ and $0\le 1-\cos x\le x^{2}/2$ imply

$$
\begin{aligned}
\lVert h_a(p)-h(p)\rVert &\le \epsilon_a(P) \\
&:= c\,a^{2}P^{3}/(6\hbar^{2})+r\,c\,a\,P^{2}/(2\hbar).
\end{aligned}
\tag{10}
$$

This bound is uniform on that band. Duhamel's formula and the resolvent identity give

$$
\begin{aligned}
\lVert\exp(-ih_at/\hbar)-\exp(-iht/\hbar)\rVert \\
&\le |t|\,\epsilon_a(P)/\hbar, \\
\lVert R_a(z,p)-R(z,p)\rVert &\le \epsilon_a(P)/(\operatorname{Im}z)^{2}.
\end{aligned}
\tag{11}
$$

Weyl's inequality bounds every sorted pole shift by $\epsilon_a(P)$. Both poles and complete normalized unitary response inherit these bounds, not only a fitted dispersion. For a normalized compact-band wave packet the same bounds follow after integration. Fixed-box momentum subspaces embed isometrically as $a$ decreases through divisors of the fixed box length. Every fixed finite momentum set is eventually present. On the common torus, the union of these sets is dense; (11) and the two unitary norm bounds give strong convergence for every one-particle state by first truncating its tail. This directly proves the one-particle source statement. A physical finite-excitation comparison uses the explicitly diagonalized particle/hole labels $(p,j,\text{spin},\text{charge})$ in (13): their positive generators are the diagonal $E_{a,j}(p)$, whose differences are bounded by $\epsilon_a(P)$. On a fixed number $m$ of those labeled excitations the relative-to-vacuum propagator error is at most $m|t|\epsilon_a(P)/\hbar$. The embedding is the source spectral-mode map, not the identity between differently filled vacuum vectors. For example its positive Dirac spinor in the standard $B$-diagonal representation is $[(E+m_{j,a})\chi;\ c\,\sigma\cdot k_a\chi]/\sqrt{2E(E+m_{j,a})}$, with $m_{j,a}=\delta_j+w_a$ and $\chi$ one of the two registered spin vectors; the negative spinor is $[-c\,\sigma\cdot k_a\chi;\ (E+m_{j,a})\chi]$ with the same denominator. The flavor projector is $P_{j}$. The finite vacuum phases and energy baselines are retained in each regulator; they are excluded only from the explicitly relative excitation response. There is no convergence claim for a global continuum Gibbs trace, a uniform full-Fock norm limit, an implementer between infinite filled seas, or a finite vacuum-energy limit.

For a full finite lattice, the Fourier momentum blocks are exactly decoupled. In a finite Grassmann Gaussian action with a registered finite time-frequency regulator, split its inverse propagator into low and high momentum blocks:

$$
K=\operatorname{diag}(K_{\mathrm{low}},K_{\mathrm{high}}).
$$

Integration over the high Grassmann variables is exactly

$$
\begin{aligned}
\int D(\mathrm{high})\exp(-\bar{\psi}K\psi) \\
&= \det(K_{\mathrm{high}})\exp(-\bar{\psi}_{\mathrm{low}}K_{\mathrm{low}}\psi_{\mathrm{low}}).
\end{aligned}
\tag{12}
$$

The Schur correction is zero because the off-diagonal blocks vanish. All determinant normalization factors are retained as vacuum/free-energy records; source derivatives of those factors are not discarded. Equivalently, the finite thermal density operator factorizes over the mode partition, and tracing high modes leaves exactly the original low Gibbs density operator. Therefore the retained free inverse propagator, canonical field coefficient and matrix $\Delta$ have exact zero running, zero interaction threshold correction and zero loop remainder in this admitted quadratic theory. At every retained scale the physical pole conversion remains $m_j=\delta_j/c^{2}$, with (9)-(11) the separately stated spatial-regulator remainder. A rescaled Wilsonian parameter may have its engineering dimension; that convention is distinct from running a fixed-unit physical $\Delta$.

Projecting out a complete invariant flavor eigenspace similarly gives an exact retained block and an owned determinant factor. In a marked non-eigen flavor split, off-diagonal blocks generally survive; then the correct Schur operator is $K_{LL}-K_{LH}K_{HH}^{-1}K_{HL}$ and no zero-threshold statement applies. The source does not claim Standard Model $\beta$ functions, radiative mass renormalization, or charged-lepton threshold matching.

#### 5. Constructive preparation with native drift

Diagonalize the actual finite $h_{a}$. Filling its negative-energy modes gives the finite Dirac vacuum. The source Hamiltonian may be written exactly as

$$
\begin{aligned}
H_a &= E_{\mathrm{vac}}I+\sum_lE_ln_l, \\
E_{\mathrm{vac}} &= -2\sum_{p,j}E_{a,j}(p),\quad E_l>0,
\end{aligned}
\tag{13}
$$

where l runs over positive-particle and negative-hole excitation modes, two spin states each. This is an equality with the finite baseline retained. The occupation preparation of this reference Slater state, its charge provider, work record and phase reference are part of the source preparation. No continuum vacuum subtraction supplies a gravitational claim.

The filled reference state has an explicit charge-conserving preparation. Begin with the supplied empty original-mode product state and $d/2$ occupied provider fermions $r_{l}$, one for each negative eigenmode $a_{l}$, all of the same original charge. Give each provider the independently registered positive gap $E_{\mathrm{ref}}$. With $Q_l=i(a_l^\dagger r_l-r_l^\dagger a_l)$, $\theta=\pi/2$, and native drift $H_0=e_l n_{a_l}+E_{\mathrm{ref}}n_{r_l}$ plus the commuting spectators, use the same smooth interaction-picture pulse as (14), with $Y_{l}$ replaced by $Q_{l}$. The exact endpoint swaps the provider occupation into $a_{l}$, with its native clock phase. The full two-mode instrument is unitary on all four occupation states; it neither postselects nor erases a charge record. All even disjoint pair pulses commute. The resulting source is exactly the filled negative-mode Slater state, with $d/2$ original charges and baseline $E_{\mathrm{vac}}$; the $d/2$ providers are empty and remain owned. Source charge is not removed by a relative-charge convention.

For each such loading pulse, with $\Delta_e=|e_l-E_{\mathrm{ref}}|$, the reservations are peak $2\hbar\theta/T$, norm-action $\hbar\theta$, derivative peak $2\pi\hbar\theta/T^{2}+2\theta\Delta_e/T$, and gross switching $\le 4\hbar\theta/T+\theta\Delta_{e}$. Its actual net work is $e_l-E_{\mathrm{ref}}$. Recovered work is counted only if the corresponding battery operation is performed; it does not remove the provider preparation, bandwidth, gross throughput or memory costs. The initially empty source and occupied providers are declared pure preparation inputs; no equilibrium reset cost or perpetual reuse follows. The $d/2$ additional provider modes are included in the full hardware count below.

For each excitation mode l append a distinct fermion purifier of equal energy $E_{l}$ and opposite charge. Start both excitation modes empty and set

$$
\begin{aligned}
q_l &= [1+\exp(bE_l)]^{-1}, \\
\theta_l &= \arcsin\sqrt{q_l}, \\
Y_l &= i(c_l^{\dagger}b_l^{\dagger}-b_lc_l).
\end{aligned}
$$

$Y_{l}$ is Hermitian, norm one on its active even sector, and commutes with total $U(1)$ charge and parity. For duration $T>0$ use

$$
\begin{aligned}
f_T(t) &= 2\sin^{2}(\pi t/T)/T,\quad 0\le t\le T, \\
H_{c,l}(t) &= \hbar\theta_lf_T(t) \\
&\qquad \exp(-iH_0t/\hbar)\,Y_l\exp(iH_0t/\hbar),
\end{aligned}
\tag{14}
$$

where $H_{0}$ contains the complete source and purifier native drift. The actual propagator is exactly

$$
U_l(T)=\exp(-iH_0T/\hbar)\exp(-i\theta_lY_l).
$$

It prepares $\cos(\theta_l)|00\rangle+\exp(-2iE_lT/\hbar)\sin(\theta_l)|11\rangle$, up to the retained baseline phase. The system marginal has occupation $q_{l}$. Different even pair generators commute. Parallel pulses therefore prepare the complete thermal marginal of (13), which is exactly (2). The nonzero phases belong to the physical clock and can be retained; mutual information does not depend on them.

For a pair the norm, action and work-throughput reservations are

$$
\begin{aligned}
\text{peak }\lVert H_{c,l}\rVert &\le 2\hbar\theta_l/T, \\
\int\lVert H_{c,l}\rVert\,dt &= \hbar\theta_l, \\
\text{peak }\lVert\dot{H}_{c,l}\rVert &\le 2\pi\hbar\theta_l/T^{2}+4E_l\theta_l/T, \\
\int\lVert\dot{H}_{c,l}\rVert\,dt &\le 4\hbar\theta_l/T+2E_l\theta_l.
\end{aligned}
\tag{15}
$$

Here $\lVert[H_0,Y_l]\rVert=2E_l$, $\int f_{T}=1$ and $\int|f_T'|=4/T$. Since the controls vanish at both endpoints, their actual net work on the pair is $2E_l q_l$; the larger final expression bounds gross switching throughput. Parallel implementation sums all reservations; serial implementation sums all durations. The highest modulation frequency $2\max E_l/\hbar$, coefficient precision and spatial support are explicit resources. The matrix-function/eigenmode controller is global on the finite box unless a separate local synthesis is supplied. It is not assumed to have uniformly bounded resources as $a$ decreases.

The neutral reference qubit has its own pure Gibbs purification and the same b. It uses an independently registered $E_{\mathrm{ref}}$ and the identical two-level rotation construction. Thus the common-temperature condition and the calibration reference have an actual finite preparation. State-source coefficients, rather than observed masses, determine the preparation angles. All purifier degrees of freedom are retained or explicitly transferred to the environment. There is no inference of heat from tracing them out. Repeated trials allocate fresh prepared purifiers and readout archives, or require an additional completely specified reset provider.

#### 6. Full covariance readout and resource ledger

At $p=0$ only twelve marked original CAR modes are needed for (4). The rest of the source may remain in its prepared product of momentum-block Gibbs states. A registered Fourier/mode unitary maps these modes to readout ports. For any normalized vector $v$ of these twelve modes, measuring the occupation $n(v)=a^\dagger(v)a(v)$ gives the binary probabilities $\operatorname{Tr}(C|v\rangle\langle v|)$ and its complement. The exact projective instrument is

$$
\rho\to n(v)\,\rho\,n(v),\quad \rho\to[I-n(v)]\,\rho\,[I-n(v)].
\tag{16}
$$

A degenerate binary pointer and the full unitary

$$
W_v=n(v)\otimes X_{\mathrm{pointer}}+[I-n(v)]\otimes I_{\mathrm{pointer}}
$$

give these conditional channels. Both outcomes are retained, including empty-port outcomes. A passive source mode rotation is only a way to synthesize this entire instrument; recording a fine occupation table and later forgetting it would generally be a different channel.

Use the twelve coordinate vectors and, for each unordered pair $i<j$, $(e_i+e_j)/\sqrt{2}$ and $(e_i+ie_j)/\sqrt{2}$. These 144 settings determine every diagonal, real and imaginary covariance entry. In the stated $C$ convention the second pair setting gives minus $\operatorname{Im}C_{ij}$ after subtracting the diagonal average. No off-diagonal information or normalization outcome is omitted.

For any finite target unitary $W$ on the full source-purifier-pointer hardware, including state preparation, mode routing and (16), the following independent full-carrier synthesis is available. Let $H_{0}$ be the entire registered native drift, choose a Hermitian $A$ of norm at most $\pi$ such that $\exp(-iA)=\exp(iH_0T/\hbar)W$, and use

$$
H_c(t)=\hbar f_T(t)\exp(-iH_0t/\hbar)\,A\exp(iH_0t/\hbar).
$$

The actual endpoint is $W$. This owns native drift in the full conditional instrument. The reservations are peak $2\hbar\lVert A\rVert/T$, norm-action $\hbar\lVert A\rVert$, derivative peak $2\pi\hbar\lVert A\rVert/T^{2}+4\lVert A\rVert\lVert H_0\rVert/T$, and gross switching throughput at most $4\hbar\lVert A\rVert/T+2\lVert A\rVert\lVert H_0\rVert$. Charge-conserving $W$ and $H_{0}$ permit the logarithm separately on charge blocks, retaining charge conservation. Phase and clock controls are assumed available on those declared blocks and their whole support is charged.

A readout need not know the unknown source matrix to compensate it. There is also an explicitly mass-independent finite-duration option. For the fixed marked occupation instrument choose $A_v=(\pi/2)(I-W_v)$, so $\lVert A_v\rVert=\pi$ and $\exp(-iA_v)=W_v$, and apply $H_c(t)=\hbar f_T(t)A_v$ with the actual native $H_{0}$ left on. This control depends only on the registered ports and pointer. Duhamel relative to the control-only evolution gives

$$
\begin{aligned}
\lVert U_{\mathrm{actual}}(T)-W_v\rVert &\le TH_{\mathrm{bound}}/\hbar, \\
\lVert\text{instrument}_{\mathrm{actual}}-\text{instrument}_{\mathrm{ideal}}\rVert_{\diamond} \\
&\le 2TH_{\mathrm{bound}}/\hbar,
\end{aligned}
$$

where $H_{\mathrm{bound}}$ is a prior complete native norm bound independent of the unknown orientation/eigenvalues inside the declared $\Delta$ domain. The comparison includes all conditional subnormalized states and a reference. All outcome probabilities therefore have the safe error bound $2TH_{\mathrm{bound}}/\hbar$. The fixed-control peak is $2\pi\hbar/T$, norm-action $\pi\hbar$, derivative peak $2\pi^{2}\hbar/T^{2}$, and gross switching reservation $4\pi\hbar/T$. A prior requested covariance error $\epsilon_{\mathrm{sys}}$ is met by $T\le\epsilon_{\mathrm{sys}}\hbar/(72H_{\mathrm{bound}})$ for the twelve-mode tomography. Its increased strength, bandwidth and throughput are owned, rather than erased by a fast-clock convention. Any spectator native motion is either included in $H_{\mathrm{bound}}$ or explicitly retained as its commuting free output flow. This option establishes a noncircular calibrated readout even when $\Delta$ itself is what the state measurements reconstruct. The source-aware exact compensated instrument above remains a separate, stronger implementation when those native coefficients are already supplied by the source.

For $n^{3}$ sites, $d=12n^{3}$ original modes, $d$ excitation purifiers and a binary readout pointer give $2d+1$ binary degrees of freedom before reference/calibration providers and archives. With reference plus its purifier this core has $2d+3$ binary degrees. The actual parallel filled-vacuum preparation adds $d/2$ charged provider modes, so the complete count is $5d/2+3$, plus declared synthesis workspace and archives. A full-matrix implementation has $D=2^{5d/2+3}$ levels and a $D$ by $D$ coefficient table; $b_{\mathrm{bit}}$ precision reserves a declared constant times $D^{2}b_{\mathrm{bit}}$ storage budget plus coefficient-evaluation workspace rather than a constant-cost oracle. The Gaussian preparation (14) has a much smaller explicit coefficient description, but no automatic local compilation bound is assumed. Native energy satisfies $\lVert H_a\rVert\le\sum_l|e_l(h_a)|\le dH_{\max}$ with $H_{\max}=\Delta_{\max}+(6r+\sqrt{3})\hbar c/a$; purifier energy and reference/pointer baselines are added once. Neither recovered work nor an inert padding subspace removes that reservation.

For the fixed graph record, the coefficient interface is constructive. At each finite $n$ the Fourier phases are the marked $n$-th roots of unity; with rational $r$ and rational dimensionless $a$ and clock choices, the one-particle matrices have algebraic entries. Certified polynomial root isolation, spectral projectors and a marked Gram-Schmidt choice produce the eigenmodes. The positive gap excludes a particle/hole ambiguity. Rational interval range-reduced power series evaluate exp, log, square roots and the finite preparation angles to any requested accuracy. The explicit mass-independent $A_{v}$ readout avoids a principal-log branch-decision problem. These finite calculations terminate at every declared regulator/precision; their table size and workspace are charged. No materialization of the complete $2^{813}$-dimensional hardware table of the $n=3$ example is assumed. The general source-aware principal-argument dilation remains an analytic implementation theorem when exact native coefficients are supplied.

Each setting/trial pays the complete source preparation, calibration share, routing, duration, controls, archive and purifier/provider use. The physical raw outcomes remain binary and complete. Exact response formulas are not exact finite-shot estimates. A positive heat/reset bound requires its own bath and completed reset protocol; none is asserted here.

#### 7. Outward calibration and statistical propagation

Let $C=C_a(0)$, and assume its spectrum lies in $[\eta,1-\eta]$, $\eta>0$, fixed from the independently registered $b$ and energy domain. For $\mu=0$, $\eta=[1+\exp(b\Delta_{\max})]^{-1}$ suffices. Let a Hermitian estimate $\tilde{C}$ satisfy $\lVert\tilde{C}-C\rVert\le\epsilon<\eta$. Then $\tilde{C}$ and $I-\tilde{C}$ are positive. The integral resolvent formula for log gives

$$
\lVert\log X-\log Y\rVert\le\lVert X-Y\rVert/\lambda_{\min}(X,Y)
$$

for positive matrices. Hence

$$
\lVert K_b(\tilde{C})-K_b(C)\rVert\le 2\epsilon/[b(\eta-\epsilon)].
\tag{17}
$$

In a $B$-diagonal spin frame, $\Phi_{B}$ is a signed average of four diagonal compressions, so $\lVert\Phi_B(X)\rVert\le\lVert X\rVert$. Equation (17) therefore bounds the reconstructed energy matrix and, after division by $c^{2}$, its mass matrix. Weyl's inequality gives individual ordered mass intervals. If the lower bound for a denominator mass is positive, ratio intervals are obtained by dividing lower numerator by upper denominator and upper numerator by lower denominator; no linearized interval is substituted.

If b is known only within error $\delta_{b}$ and both true and reconstructed b are at least $b_{\min}>0$, then

$$
\begin{aligned}
\lVert\tilde{\Delta}-\Delta\rVert \\
&\le 2\epsilon/[b_{\min}(\eta-\epsilon)]+\delta_b\Delta_{\max}/b_{\min}.
\end{aligned}
\tag{18}
$$

An independently calibrated interval $c\in[c_{\min},c_{\max}]$ propagates by division by $c_{\max}^{2}$ and $c_{\min}^{2}$. If $q_{\mathrm{ref}}$ is known within $\delta_{q}$ and $E_{\mathrm{ref}}\in[E_{\min},E_{\max}]$, with $0<q_{\mathrm{ref}}-\delta_q<q_{\mathrm{ref}}+\delta_q<1/2$, (5) yields the outward interval

$$
\begin{aligned}
&[\operatorname{logit}(q_{\mathrm{ref}}+\delta_q)/E_{\max}, \\
&\;\operatorname{logit}(q_{\mathrm{ref}}-\delta_q)/E_{\min}].
\end{aligned}
\tag{19}
$$

For each of the 144 binary settings use R independent complete trials. Hoeffding and a union bound make every setting probability accurate to $\delta_{p}$ with probability at least

$$
1-2\cdot 144\exp(-2R\delta_p^{2}).
$$

Reconstructing a Hermitian twelve-dimensional covariance then gives each diagonal error at most $\delta_{p}$ and each real/imaginary off-diagonal error at most $2\delta_p$. A row-sum bound yields $\lVert\tilde{C}-C\rVert\le 36\delta_p$. Thus choosing $\epsilon=36\delta_p$ in (17)-(18) gives a full finite-shot matrix and pole certificate, conditional only on its explicitly stated confidence event. Source preparation/readout systematic errors enter $\epsilon$ through their actual channel-to-probability bounds and are not absorbed into a statistical claim. The high-energy condition number grows with $b\Delta_{\max}$; the theorem makes no uniform cold-state inverse guarantee.

#### 8. Relational information on this realized source

A single positive excitation mode of rest energy $\delta_{j}$ and its opposite-charge purifier are in the actual pure state constructed by (14). Their mutual information is

$$
\begin{aligned}
I_j &= 2h(q_j),\quad q_j=[1+\exp(b\delta_j)]^{-1}, \\
h(q) &= -q\log q-(1-q)\log(1-q).
\end{aligned}
\tag{20}
$$

On $\delta_{j}>0$ this is strictly decreasing, because

$$
dI_j/d\delta_j=-2b^{2}\delta_jq_j(1-q_j)<0.
$$

The inverse is well defined on $0<I_j<2\log 2$:

$$
\delta_j=b^{-1}\operatorname{logit}[h_-^{-1}(I_j/2)],
\tag{21}
$$

where h_- is binary entropy restricted to (0,1/2). It is a genuine same-source information-to-rest-pole map, nonlinear and independently calibrated. Spin/particle multiplicities multiply I by their registered number if a larger subsystem is chosen; the subsystem convention is fixed before comparing flavors.

For two unequal positive masses in this source, $m_1<m_2$ implies $I_1>I_2$. Therefore no common positive $K$ can satisfy $m_j=KI_j$ for both. The explicit graph source realizes masses in ratio $1:2:4$ and inversely ordered mutual informations. N.5's linear law cannot be imported onto this source solely from the existence of a thermal state or a physical mass pole: at least its boundary/action-update overlap is absent. This is a source-specific incompatibility, not a universal refutation of N.5's stated conditional branch.

Full matrix data also carry more than the three scalar entropies. For a fixed nontrivial unitary $U$, $\Delta$ and $U\Delta U^\dagger$ have identical unordered spectra and eigenmode informations. In a fixed physical flavor frame their covariances and propagation matrices generally differ. Equation (4) respects that orientation: it is equivariant under a simultaneous registered basis change, not invariant under changing only the source mass orientation while leaving preparation/readout labels fixed. A covariance measured on a proper subsystem may likewise have an entanglement Hamiltonian unrelated to the restricted source generator; only the complete admitted $p$-block and its actual thermal source are used above.

### Fixed-carrier information and no-alias calibration completion

#### 2. A fixed common S:E information-only family

The complete all-pair preparation in the base proof prepares the Gibbs covariance used for matrix reconstruction. A different, expressly identified specialization prepares an information-only family on one fixed carrier and split; it must not be mislabeled as the complete Gibbs state.

Keep the same full finite field S, all its purifier modes E, the same physical generator, fixed $b>0$ and fixed energy reference. Load the same negative-mode vacuum $\Omega$ with the same occupied charge providers and work ledger. Begin all excitation purifiers empty. For a chosen positive rest eigenmode j, activate only its existing neutral pair pulse, leaving every other pair inactive. The resulting pure state, including the source baseline phase when appropriate, is

$$
\begin{aligned}
\Phi_j &= \sqrt{1-q_j}\,|\Omega,0_E\rangle \\
&\quad +\exp(-2i\delta_jT/\hbar)\sqrt{q_j} \\
&\qquad a_j^{*}b_j^{*}|\Omega,0_E\rangle, \\
q_j &= (1+\exp(b\delta_j))^{-1}.
\end{aligned}
$$

Here $a_{j}^*$ creates the positive-charge field excitation and $b_{j}^*$ its opposite-charge purifier. Both branches have the same total charge. The two source vectors and two environment vectors are orthogonal. All unactivated modes and emptied loading providers are unchanged pure spectators, whether those providers are included on the environment side or separately retained. Thus the full fixed $S:E$ split, not a differently chosen two-mode subsystem for each $j$, has exactly two nonzero Schmidt probabilities $1-q_j$ and $q_{j}$. Consequently

$$
\begin{aligned}
I_j &= I(S:E)_{\Phi_j}=2h(q_j), \\
\delta_j &= b^{-1}\operatorname{logit}[h_-^{-1}(I_j/2)], \\
m_j &= \delta_j/c^{2}.
\end{aligned}
$$

The selector $j$ and marked eigenmode frame belong to the source record. This family requires no extra field, purifier or occupied loading provider beyond the existing hardware; selecting one of the already owned pulses is a registered control choice. Each selected pair still pays its duration, phase modulation, work $2\delta_j q_j$, preparation controls and fresh-copy archive. The same field generator has the rest pole $\delta_{j}$ whether one pair or all pairs are prepared. Inactive pairs do not contribute entropy, while the all-pair Gibbs preparation has the sum of all pair informations. These are distinct preparations on the same carrier.

This is a nonlinear scalar information-to-rest-mass map on an admitted source family. It is not a linear N.5 law, a universal map on arbitrary states, a recovery of flavor orientation from scalar information, or a one-copy nonlinear quantum channel. The full matrix reconstruction remains the complete covariance/independent-reference construction in the source proof.

#### 3. Conditioning of the scalar information inverse

At fixed $b$, on $\delta\in[\delta_{\min},\delta_{\max}]$ with $\delta_{\min}>0$, define

$$
\begin{aligned}
q_{\min} &= (1+\exp(b\delta_{\max}))^{-1}, \\
L_I &= 2b^{2}\delta_{\min}q_{\min}(1-q_{\min})>0.
\end{aligned}
$$

Since $q$ is decreasing and $q(1-q)$ is increasing on $(0,1/2)$, differentiation gives

$$
\begin{aligned}
dI/d\delta &= -2b^{2}\delta q(1-q), \\
|dI/d\delta| &\ge L_I.
\end{aligned}
$$

The mean-value theorem implies $|\tilde{\delta}-\delta|\le\epsilon_I/L_I$ whenever both information values and their connecting interval stay within the declared image. This is an explicit compact-domain bound; it supplies no uniform guarantee as $\delta_{\min}$ approaches zero or $b\delta_{\max}$ grows without bound.

For an information interval [Ilo,Ihi] contained in (0,2 log2), monotonicity of h_- gives

$$
q_{\mathrm{lo}}=h_-^{-1}(I_{\mathrm{lo}}/2),\quad q_{\mathrm{hi}}=h_-^{-1}(I_{\mathrm{hi}}/2).
$$

With an independently calibrated $b\in[b_{\mathrm{lo}},b_{\mathrm{hi}}]$, $0<b_{\mathrm{lo}}\le b_{\mathrm{hi}}$, the outward energy interval is

$$
[\operatorname{logit}(q_{\mathrm{hi}})/b_{\mathrm{hi}},\;\operatorname{logit}(q_{\mathrm{lo}})/b_{\mathrm{lo}}].
$$

Use directed interval enclosures for h, its monotone bisection and logit. Divide the positive endpoints by $c_{\max}^{2}$ and $c_{\min}^{2}$ for the outward mass interval when c is uncertain. This uses the already owned independent reference calibration; it does not estimate temperature from an uncalibrated source entropy. For ratios, use outward division only after the denominator interval has a strictly positive lower endpoint.

#### 4. Independent reference phase, without alias removal by assumption

$E_{\mathrm{ref}}$ remains an independently registered positive physical source input; its Ramsey evolution is a response certificate, not a claim that one phase modulo $2\pi$ identifies an unbounded unknown gap. When this response is used to refine its calibration, use the already admitted positive prior interval $0<E_{\min}\le E_{\mathrm{ref}}\le E_{\max}$. Choose an independently registered duration

$$
0<T_{\mathrm{cal}}<\pi\hbar/E_{\max}.
$$

Prepare the neutral reference at the Ramsey boundary in $|+\rangle$. For its native Hamiltonian $E_{\mathrm{ref}}|1\rangle\langle 1|$ the later state is $(|0\rangle+\exp(-i\phi)|1\rangle)/\sqrt{2}$, with $\phi=E_{\mathrm{ref}}T_{\mathrm{cal}}/\hbar$ strictly between zero and $\pi$. Measure both quadratures on independent copies: $x=\langle X\rangle=\cos(\phi)$ and $s=-\langle Y\rangle=\sin(\phi)$. The known half-plane and the pair $(x,s)$ select the unique $\phi=\operatorname{atan2}(s,x)\in(0,\pi)$, and $E_{\mathrm{ref}}=\hbar\phi/T_{\mathrm{cal}}$. This removes no physical clock time or calibration cost.

The pure reference preparation, both binary quadrature instruments, repeated copies, pointer records and errors are part of the existing finite control/readout ledger. They may use source-aware exact preparation or the corresponding fixed-control, prior-drift finite-error implementation; no unknown phase is silently corrected. With probability intervals and actual systematic-error intervals, intersect the resulting quadrature rectangle with the unit-circle arc fixed by $[E_{\min},E_{\max}]$ and $T_{\mathrm{cal}}$. Its minimum and maximum phase give an outward $E_{\mathrm{ref}}$ interval. If the errors do not isolate a smaller arc, retain the prior interval rather than asserting a uniquely refined estimate. Timing and $\hbar$ uncertainty, if admitted, enter the same outward division; the no-alias condition must hold for their entire prior ranges. The common-temperature occupation interval then propagates through equation (19) above. This is a finite formal calibration protocol, not executed Ramsey data.

∎

### N.11.8 Typed Dependency Chain and Independent Gates

The structural carrier route and the mass route meet only at explicitly certified entries. The carrier route gives
$$
(\mathrm{O1})\text{--}(\mathrm{O3})+(\mathrm{FC})
\Longrightarrow K_0=3,\quad N_{\mathrm{vis}}^{\min}=8,
\qquad
d_0=8\ \text{on the stated Hilbert/comparator branch},
$$
and the registered binary quotient independently gives $\varepsilon_0=\ln2$. These statements do not supply a relational-cut decomposition, a channel-activity record, or an action map.

The mass route is the typed conjunction
$$
\boxed{
\left.
\begin{gathered}
\mathfrak C_{\partial}:\quad
\mathcal I_{\mathrm{rel}}
=\sum_i I_i
=\sum_i q_iC_i^{\mathrm{rel}},\\
C_i^{\mathrm{rel}}=C_*^{\mathrm{rel}},\quad q_i=q\in(0,1],\\
\lim_{T\to\infty}N_i(T)/T=1/\tau_i\ \text{on one common run with additive concurrent activity and no shared bottleneck},\\
\varepsilon_i=\varepsilon_0,\quad \tau_i=\tau_{\min},\\
C_*^{\mathrm{rel}}=2\varepsilon_0,\\
\mathcal I_{\mathrm{rel}},q,C_*^{\mathrm{rel}},\tau_{\min}
\text{ and the action coefficient are stationary on the integration interval},\\
\left|d\mathcal S_{\mathrm{action}}/d\tau\right|
=\hbar\dot\varepsilon_{\partial}
\end{gathered}
\right\}
\Longrightarrow
m=\frac{\hbar\mathcal I_{\mathrm{rel}}}{2qc^2\tau_{\min}}.
}
$$
The Equation-Q.18/Proposition-Q.6.1 clock calibration then gives
$$
\tau_{\min}=\sqrt{8\varepsilon_0}\,t_P
\Longrightarrow
m=\frac{\mathcal I_{\mathrm{rel}}}{2q\sqrt{8\varepsilon_0}}m_P.
$$
The canonical branch is $q=1$. A physical erasure-entropy or mean-heat reading is not part of this implication. It requires the complete same-cycle reset contract and the deterministic common-schedule, finite-horizon summation and limiting conditions of Corollary N.5.2; mean-heat equality additionally requires its separately certified reversible-limit protocol.

| Step | Result | Independent certificate |
|:--|:--|:--|
| 1 | $\mathcal I_{\mathrm{rel}}=\sum_iq_iC_i^{\mathrm{rel}}$ | relational split, exact product additivity or ordered QCMI chain rule, source exhaustion, no double counting |
| 2 | $\dot\varepsilon_{\partial}=\sum_i\varepsilon_i/\tau_i$ | actual limits $N_i(T)/T\to1/\tau_i$ on one common run, additive concurrency, no shared bottleneck |
| 3 | $\dot\varepsilon_{\partial}=\mathcal I_{\mathrm{rel}}/(2q\tau_{\min})$ | common positive increments/durations and independent $C_*^{\mathrm{rel}}=2\varepsilon_0$ normalization calibration |
| 4 | $m=\hbar\mathcal I_{\mathrm{rel}}/(2qc^2\tau_{\min})$ | stationarity on the integration interval, same-cycle action/update map, and accepted rest-action ledger; without stationarity the relation is pointwise |
| 5 | Planck-normalized coefficient | clock/spacing calibration and $m_Pc^2=\hbar/t_P$ |
| 6 | erased-entropy throughput, mean bath-heat inequality and limiting equality | complete Corollary N.5.2 reset, temperature, deterministic counting, finite-horizon expectation/summation and limit contracts |

The relational normalization budgets $C_i^{\mathrm{rel}}$, the registered unassisted capacity $C(\mathcal E_N)$ and its separately typed reset-support upper bound, and the refresh factor $f_{\mathrm{RID}}$ are distinct inputs. No equality among them is used in the mass derivation.

### N.11.9 Physical Interpretation

<a id="remark-n113-conditional-mass-interpretation"></a>**Remark N.11.3: Conditional Mass Interpretation.** On $\mathfrak B_{\mathrm{mass}}^{\mathrm{rate}}(q)$, Theorem N.5 assigns a rest-action coefficient to an accepted, source-exhaustive relational cut ledger. The Planck-normalized expression additionally requires $\mathfrak B_{\mathrm{mass}}(q)$, and the canonical coefficient uses $q=1$. Relational information outside those branches carries no absolute mass assignment.

<a id="remark-n114-what-rest-energy-is"></a>**Remark N.11.4: What Rest Energy Is.** Corollary N.5.1 identifies rest energy with the certified proper-time action rate
$$
E=mc^2
=\frac{\hbar\mathcal I_{\mathrm{rel}}}{2q\tau_{\min}}.
$$
The corresponding structural update rate is $\mathcal I_{\mathrm{rel}}/(2q\tau_{\min})$. A physical heat reading uses the complete thermal branch of Corollary N.5.2: the same-cycle reset law and conditional-entropy/source record, positive common temperature, full Definition 28 implementation, deterministic completed-cycle schedule, finite-horizon conditional summation and the declared long-time mean-heat convention. Exact mean-heat equality requires its further same-rate reversible-limit convergence and compatibility certificate.

<a id="remark-n115-conditional-inertia-interpretation"></a>**Remark N.11.5: Conditional Inertia Interpretation.** Theorem N.6 shows that the already accepted rest-action coefficient is compatible with a registered relational-update ledger and, on the stronger thermodynamic/Unruh branch, supplies a refresh-power lower-bound scale. Exact refresh-power equality additionally requires the same-rate reversible-limit certificate of Corollary N.5.2.

<a id="remark-n116-conditional-connection-to-uct"></a>**Remark N.11.6: Conditional Connection to UCT.** The UCT includes $m_0$ as an input. On canonical $\mathfrak B_{\mathrm{mass}}$, Theorem N.5 permits
$$
m_0
=\frac{\mathcal I_{\mathrm{rel}}}{2\sqrt{8\varepsilon_0}}m_P.
$$
Under all the prescribed-trajectory, ensemble-mean, positive-mass, endpoint and source-exhaustion premises of Theorem N.UCT, the laboratory mean-work ledger may then be written
$$
W_{\mathrm{tot}}^{\mathrm{lab}}
\ge
\frac{\mathcal I_{\mathrm{rel}}}{2\sqrt{8\varepsilon_0}}
E_P(\gamma_f-1)
+
\int_0^{\tau_f}\gamma(\tau)R_{\mathrm{com}}(\tau)\,d\tau.
$$
The first term is the conditional mass substitution. The second is the laboratory energy of the separately certified comoving exported-loss ledger; the two terms must pass the UCT source-overlap audit.

### N.11.10 Summary

Appendix N proves a typed family of branch theorems.

| Result | Proved content | Independent gate retained |
|:--|:--|:--|
| Proposition N.4 | finite certified decomposition of $I(S:E)$ through relational normalization budgets | split, additivity/chain rule, exact spectral identities or propagated interval residuals, exhaustion, no double counting |
| Theorem N.4 | $0\le r_e\le1/\tau_{\min}$ for serialized registered cycles | physical clock and duration record; saturation is additional |
| Corollary N.4.1 | $\dot\varepsilon_\partial=\sum_i\varepsilon_i/\tau_i$ and its common-value specialization | actual completed-count limits on one common run, additive/source-exhaustive update ledger, concurrency, common increments/durations, and $C_*^{\mathrm{rel}}=2\varepsilon_0$ normalization |
| Theorem N.5 | $m=\hbar\mathcal I_{\mathrm{rel}}/(2qc^2\tau_{\min})$ | relational cut, source exhaustion, stationarity or pointwise reading, action/update map; Planck form needs the clock branch |
| Corollary N.5.1 | $E=mc^2$ as certified proper-time action rate | same mass branch; no thermodynamic meaning without $\mathfrak B_{\mathrm{mass}}^{\mathrm{therm}}(q)$ |
| Theorem N.6 | compatibility of the accepted inertial coefficient with the relational update ledger and a refresh-power lower-bound scale | mechanical realization; thermodynamic and detector-response gates; same-rate reversible limit for equality |
| Theorems N.7 and N.11 | a universal $m_G/m_I$ ratio on a common metric/source/response ledger | retained stress-source map, common metric, source exhaustion; value one only after reference calibration |
| Theorem N.8 | exact rational constitutive response with a controlled first-order expansion | decoherence, thermodynamic overlap, incremental mechanical and stress-source realization, retained source, calibration, positive-retention, and no-double-counting records |
| Proposition N.8.3b | actual finite-use predictive-maintenance heat/stress, positive external-gravity readout, signed/unsigned $\eta=0$ and a sealed finite precision decision | the explicitly populated B.2e/native hybrid-atomic background-test source and common-source error domain |
| Theorem N.9 | ordered charged-lepton relations on the Appendix T branch | physical labels, coefficient, scheme, running and remainder certificates |

The protected upstream result is the exact relational-state ledger $\mathcal I_{\mathrm{rel}}=I(S:E)$ and its accepted finite decompositions. The mass, thermodynamic, equivalence, complexity-response, and flavor readings are progressively stronger intersection branches. Failure of a downstream certificate removes only that reading; it does not invalidate the upstream correlation theorem.

---
