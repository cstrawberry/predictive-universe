# Appendix B: Operational Complexity, Costs, and Stress–Energy Tensor Construction

This appendix provides the detailed construction and justification for key operators used within the Predictive Universe (PU) framework, culminating in the definition of the macroscopic MPU stress-energy tensor $T_{\mu\nu}^{(MPU)}$. This includes the operational complexity operator $\hat{C}_v$ used as a proxy for the theoretical $C_P$, the associated resource cost operators $\hat{R}$ and $\hat{R}_I$, a certificate-relative lower bound for verification/update complexity near a registered quantitative self-prediction boundary, and the operators representing local energy density and flows, ensuring consistency with the framework's principles and conservation laws.

*(Units convention.)* Throughout this appendix we retain explicit
$\hbar$, $c$, and $k_B$ factors so that every operator’s physical
dimension is transparent. Predictive Physical Complexity ($C_P$ and its proxy $\hat C_v$) carries its own base dimension $\mathrm{[Complexity]}$, e.g.\ $[\hat C_v]=\mathrm{[Complexity]}$. Information-theoretic quantities such as the entropy $\varepsilon$ or
the channel capacity $C_{\max}$ are dimensionless, typically expressed
in nats (natural-log base $e$). The physical interpretation of complexity-derived cost terms is conditional on the functional-correspondence branch of Theorem 2. At a joint stable equilibrium with $F_v^{\mathrm{op}}=F_v^{\mathrm{phys}}=0$ for every MPU and the theorem's per-MPU force-identifiability implication, the operational proxy aligns with predictive complexity. Appendix D supplies adaptation dynamics under its separate variational hypotheses.

## B.1 Operational Predictive Physical Complexity $\hat{C}_v$

The theoretical $C_P$ of Equation (1) need not be computable. On the operational branch, register a finite-resolution measurement and a calibration of its retained complexity bins. These data define an observable proxy.

**Definition B.1 (Coarse-Grained Operational Complexity Observable $\hat C_v$).** On the Hilbert branch, define
$$
\hat C_v=\sum_{d=0}^{\infty}\lambda(d)\hat P_d.
\tag{B.1}
$$

 *   $d\in\mathbb N_0$ is a dimensionless label assigned to an experimentally resolved effective circuit-depth bin relative to a specified gate set and reference state $|K_0\rangle$. It is not asserted to equal the exact minimum preparation gate count of every state in that bin.
 *   The orthogonal projectors form a complete family: $\hat P_d\hat P_{d'}=\delta_{dd'}\hat P_d$ and $\sum_d\hat P_d=I$, with strong convergence when the family is infinite. Their ranges need not be exact circuit-complexity level sets, which generally are not linear subspaces.
 *   The assigned complexity values are finite, real and non-decreasing:
     $$
     \lambda(d)=K_0+\Delta C(d),\qquad
     \Delta C(d)\ge0,\qquad \Delta C(0)=0.
     \tag{B.2}
     $$
     Here $K_0>0$ has complexity units.

If $\dim\mathcal H_v=d_0<\infty$, there are at most $d_0$ nonzero mutually orthogonal projectors; all other projectors vanish. Repeated eigenvalues do not alter this rank bound.

The expectation $\langle\psi|\hat C_v|\psi\rangle$ is the proxy for this chosen coarse-graining. Theorem 2 identifies it with $C_P(v)$ on its joint stable-equilibrium and per-MPU force-identifiability branch. Proposition D.1 and Corollary D.2 supply a separate expected mean-square bound under their registered quadratic dynamics. Equivalence between different coarse-grainings requires an explicit response- and cost-preserving coordinate map.

Let $x^*\in\mathcal A$ be a $C_P$-selected representative, and suppose
$$
|C_P(x)-\hat C(x)|\le\varepsilon
\quad(x\in\mathcal A),\qquad
\Delta_P:=
\inf_{\{x\in\mathcal A:[x]\ne[x^*]\}}
\bigl(C_P(x)-C_P(x^*)\bigr)>2\varepsilon.
$$
Then every $x$ outside $[x^*]$ satisfies
$$
\hat C(x)-\hat C(x^*)
\ge C_P(x)-C_P(x^*)-2\varepsilon
\ge\Delta_P-2\varepsilon>0.
$$
Consequently every attained global minimum of $\hat C$ belongs to $[x^*]$. If proxy-based selection is asserted to exist, also assume that $\hat C$ attains its infimum on $\mathcal A$, for example because $\mathcal A$ is finite and nonempty. The gap inequality alone proves exclusion of competing classes, not attainment. Without a certified gap exceeding $2\varepsilon$, this uniform-error argument does not establish exact class selection.

**Theorem B.1a (Complete Spectral-Proxy Reparameterization and Canonical-Coordinate No-Go).** Suppose the nonzero coarse bins in Definition B.1 are $P_0,\ldots,P_N$ with distinct ordered eigenvalues
$$
\lambda_0<\cdots<\lambda_N.
$$
A Hermitian proxy has exactly the same projective response bins and preserves their order if and only if it has the form
$$
\widehat C_h=h(\widehat C)=\sum_{d=0}^Nh(\lambda_d)P_d
\tag{B.2a.1}
$$
for a uniquely determined strictly increasing function $h$ on the finite spectrum. For every cost function $R$ on the original spectrum, define
$$
R_h(z):=R(h^{-1}(z)).
$$
Then
$$
R_h(\widehat C_h)=R(\widehat C),
\tag{B.2a.2}
$$
so all projective response probabilities and all registered functional-calculus costs are unchanged.

In particular, $h_{a,b}(z)=az+b$ with $a>0$ gives an uncountable two-parameter family of response- and cost-preserving coordinates. Therefore the response bins and cost operator do not select a canonical numerical complexity coordinate. Fixing two distinct calibrated bin values removes the affine freedom, but a general monotone freedom is removed only by fixing the value of every retained bin or by an equivalent full functional convention.

*Proof.* If the response projectors are the same, the spectral theorem writes the second proxy uniquely as $\sum_d\mu_dP_d$. Order preservation is exactly $\mu_0<\cdots<\mu_N$. Defining $h(\lambda_d)=\mu_d$ gives the unique strictly increasing function on the finite spectrum and proves (B.2a.1); the converse is immediate. Functional calculus gives
$$
R_h(\widehat C_h)
=\sum_dR_h(h(\lambda_d))P_d
=\sum_dR(\lambda_d)P_d
=R(\widehat C),
$$
which proves (B.2a.2). Projective response probabilities depend only on the $P_d$ and are unchanged. The affine family proves nonuniqueness. Two calibration equations determine $a,b$, whereas arbitrary values $h(\lambda_d)$ at the remaining bins remain free unless those values or an equivalent convention are fixed. ∎

*Proof.* Let
$$
\mathcal D(\hat C_v)
:=\left\{\psi\in\mathcal H_v:
\sum_{d=0}^{\infty}\lambda(d)^2\|\hat P_d\psi\|^2<\infty\right\}.
$$
Orthogonality and completeness of the projectors give
$$
\psi=\sum_d\hat P_d\psi,
\qquad
\|\psi\|^2=\sum_d\|\hat P_d\psi\|^2.
$$
On the displayed domain, $\hat C_v\psi=\sum_d\lambda(d)\hat P_d\psi$ is the real diagonal spectral operator. Its adjoint has the same diagonal coefficients and the same square-summability domain, so $\hat C_v^*=\hat C_v$. For every $\psi\in\mathcal D(\hat C_v)$,
$$
\langle\psi,\hat C_v\psi\rangle
=\sum_d\lambda(d)\|\hat P_d\psi\|^2
\ge K_0\sum_d\|\hat P_d\psi\|^2
=K_0\|\psi\|^2\ge0.
$$
Thus $\hat C_v$ is self-adjoint and positive. The coarse-graining remains branch data and need not coincide with mathematical circuit-complexity level sets. ∎

## B.2 Physical Resource-Cost Operators $\hat{R}, \hat{R}_I$

The physical realization of predictive capability, quantified by complexity, incurs costs. These costs are represented by operators derived from the operational complexity operator $\hat{C}_v$ and the cost functions defined in the main text (Definition 3).

**Theorem B.1 (Physical and Reflexive-Information Cost Operators).** Let $\hat C_v$ be the self-adjoint coarse-grained observable of Definition B.1. At the declared effective temperature, assume that $R$ and $R_I$ are finite, nonnegative Borel functions on its spectrum. If the assigned eigenvalues extend below $C_{op}$, Equation (4) does not supply $R$ there; those values require a separately specified nonnegative extension. Zero projectors may be omitted.

For $f=R$ or $f=R_I$, define
$$
\mathcal D_f:=
\left\{\psi\in\mathcal H_v:
\sum_{\{d:\hat P_d\ne0\}}f(\lambda(d))^2
\|\hat P_d\psi\|^2<\infty\right\}.
$$
Then the self-adjoint positive operators are
$$
\hat R(C_v)=R(\hat C_v)=
\sum_{\{d:\hat P_d\ne0\}}R(\lambda(d))\hat P_d,
\qquad
\hat R_I(C_v)=R_I(\hat C_v)=
\sum_{\{d:\hat P_d\ne0\}}R_I(\lambda(d))\hat P_d,
\tag{B.3}
$$
on $\mathcal D_R$ and $\mathcal D_{R_I}$, respectively. Their positive quadratic forms have domains
$$
\mathcal Q_f:=
\left\{\psi\in\mathcal H_v:
\sum_{\{d:\hat P_d\ne0\}}f(\lambda(d))
\|\hat P_d\psi\|^2<\infty\right\}.
$$
All these domains equal $\mathcal H_v$ when the retained spectrum is finite.

*Proof.* Orthogonal completeness gives a dense subspace of vectors supported on finitely many bins. On $\mathcal D_f$, the sum defining $f(\hat C_v)\psi$ converges in norm because its squared norm is the defining square sum. The adjoint has the same real diagonal coefficients and precisely the same square-summability domain, so the operator is self-adjoint. Its quadratic form is
$$
\|f(\hat C_v)^{1/2}\psi\|^2
=
\sum_{\{d:\hat P_d\ne0\}}f(\lambda(d))
\|\hat P_d\psi\|^2\ge0
\quad(\psi\in\mathcal Q_f).
$$
For $\psi\in\mathcal D_f$ this equals
$\langle\psi,f(\hat C_v)\psi\rangle$. Applying the argument to both cost functions proves the claim. ∎

A normalized state has a finite mean cost only when the corresponding positive spectral integral is finite. Theorem 2 identifies $\langle\hat C_v\rangle$ with $C_P(v)$ on its joint stable-equilibrium and per-MPU force-identifiability branch. It does not generally identify $\langle f(\hat C_v)\rangle$ with $f(\langle\hat C_v\rangle)$; the operator expectations remain spectral averages.

## B.3 Certificate-Relative Complexity Bound for a Registered Quantitative Task

**Definition B.2 (Unified Complexity Functional $C_{\mathrm{uni}}$)**

Fix a registered self-prediction task, score, admissible strategy class, verification rule, and a quantitative certificate that defines a scalar performance boundary $\alpha_{\mathrm{SPAP}}$ for that class. For a target performance $\alpha<\alpha_{\mathrm{SPAP}}$, set $\delta_{\mathrm{SPAP}}:=\alpha_{\mathrm{SPAP}}-\alpha$. Theorems 10–11 supply the class-level diagonal obstruction but do not by themselves supply this scalar certificate.

A $\delta_{\mathrm{SPAP}}$-accurate strategy is a procedure $S$ in the registered admissible class whose verification/calibration loop produces a predictor that achieves performance at least $\alpha_{\mathrm{SPAP}}-\delta_{\mathrm{SPAP}}$ while the probability of violating this target is at most $\delta_{\mathrm{SPAP}}$. For such a strategy, define $\mathrm{Cost}(S;\delta_{\mathrm{SPAP}})$ to be its worst-case number of elementary physical operations, counting (i) each acquisition of an interaction outcome used for verification/calibration and (ii) each elementary internal update step used to process those outcomes and update the predictor. The unified complexity functional is
$$
C_{\mathrm{uni}}\bigl(\delta_{\mathrm{SPAP}}\bigr) := \inf_{S\ \delta_{\mathrm{SPAP}}\text{-accurate}} \mathrm{Cost}(S;\delta_{\mathrm{SPAP}}), \tag{B.4}
$$
with value $+\infty$ when the registered strategy class contains no $\delta_{\mathrm{SPAP}}$-accurate member. The functional is therefore task-, score-, class-, and certificate-relative; it is not a universal complexity function obtained from SPAP alone.

**Theorem B.2 (Conditional Log-Enhanced Quadratic Lower Bound).** For every $0<\delta\le1/8$ and every $\delta$-accurate admissible strategy $S$, assume certificate $\mathfrak C_{B.2}$ maps $S$, under either Bernoulli law $p_\pm=1/2\pm2\delta$, to a test based on $N(S,\delta)$ independent observations whose two errors are at most $\beta(\delta)\le\delta$, and proves
$$
\operatorname{Cost}(S;\delta)\ge c_sN(S,\delta)
$$
with fixed $c_s>0$. Then every such $S$ satisfies
$$
N(S,\delta)\ge\frac{3}{128\delta^2}\ln\!\left(\frac1{4\beta(\delta)}\right),
$$
and taking the infimum over $S$ gives
$$
C_{\mathrm{uni}}(\delta)=\Omega\!\left(\frac{\log(1/\delta)}{\delta^2}\right).\tag{B.5}
$$

*Proof.* The reduction certificate supplies a test with errors $a,b\le\beta(\delta)$ directly; no parameter-estimation premise is needed. If $\beta=0$, no finite number $N$ of observations can satisfy this certificate: both Bernoulli parameters lie strictly between zero and one, so their finite-sample laws are mutually absolutely continuous and no test, including parameter-independent internal randomization, can have both errors zero. The zero-error lower bound is interpreted as $+\infty$, excluding finite-observation and hence finite-cost strategies because $\operatorname{Cost}\ge c_sN$ with $c_s>0$. For $\beta>0$, an infinite observation count already satisfies the extended lower bound. It remains to consider finite $N$ and $0<\beta\le\delta$.

Let $P_-^N$ and $P_+^N$ be the laws of the $N$ independent observations. [Bretagnolle and Huber, *Estimation des densités : risque minimax* (1978), §2, printed p. 345](https://www.numdam.org/item/SPS_1978__12__342_0.pdf) derive the KL/total-variation bound $\operatorname{TV}(P,Q)\le\sqrt{1-e^{-D(P\|Q)}}$ for two probability laws. Every test has $a+b\ge1-\operatorname{TV}(P_-^N,P_+^N)$; using $1-\sqrt{1-u}\ge u/2$ for $0\le u\le1$ gives the displayed testing inequality with the stated KL orientation:
$$
a+b\ge\frac12\exp[-D(P_-^N\|P_+^N)].
$$
Independence gives
$$
D(P_-^N\|P_+^N)=N D(\operatorname{Bern}(p_-)\|\operatorname{Bern}(p_+)).
$$
Since $a+b\le2\beta$, it follows that
$$
ND(\operatorname{Bern}(p_-)\|\operatorname{Bern}(p_+))
\ge\ln\left(\frac1{4\beta}\right).
\tag{B.5b}
$$

Put $x=4\delta\le1/2$. Direct substitution into the Bernoulli relative entropy gives
$$
D(\operatorname{Bern}(p_-)\|\operatorname{Bern}(p_+))
=4\delta\ln\left(\frac{1+x}{1-x}\right).
$$
Moreover,
$$
\ln\left(\frac{1+x}{1-x}\right)
=2\int_0^x\frac{dt}{1-t^2}
\le\frac{2x}{1-x^2}
\le\frac{8x}{3},
$$
because $0\le x\le1/2$. Therefore
$$
D(\operatorname{Bern}(p_-)\|\operatorname{Bern}(p_+))
\le4\delta\frac{8(4\delta)}3
=\frac{128}{3}\delta^2.
$$
Combining this with (B.5b) proves
$$
N\ge\frac{3}{128\delta^2}\ln\left(\frac1{4\beta}\right).
$$
Multiplication by $c_s$ and the infimum over the uniformly certified strategies give (B.5). ∎

**Theorem B.2a (Matching Upper Construction on the Frozen Bernoulli Task).** For $0<\delta\le1/8$, let
$$
N_+(\delta)
:=
\left\lceil
\frac{\ln(2/\delta)}{2\delta^2}
\right\rceil.
\tag{B.5e}
$$
From $N_+(\delta)$ independent Bernoulli observations, the sample mean $\widehat p$ satisfies
$$
\Pr_p(|\widehat p-p|\ge\delta)\le\delta
\tag{B.5f}
$$
for every $p\in[0,1]$. In particular it is a $\delta$-accurate estimator under both hard laws $p_\pm=1/2\pm2\delta$, and thresholding $\widehat p$ at $1/2$ gives both testing errors at most $\delta$. If acquisition and updating use at most $c_u>0$ registered elementary operations per observation plus a fixed $c_0$, the construction costs at most
$$
c_0+c_uN_+(\delta)
=O\!\left(\frac{\log(1/\delta)}{\delta^2}\right).
\tag{B.5g}
$$
On a registered estimator class that contains this sample-mean algorithm, obeys the displayed upper operation ledger, and satisfies Theorem B.2's lower-cost certificate with $\beta(\delta)=\delta$, the frozen Bernoulli minimax operation rate is
$$
\Theta\!\left(\frac{\log(1/\delta)}{\delta^2}\right).
\tag{B.5h}
$$

*Proof.* Hoeffding's inequality gives
$$
\Pr_p(|\widehat p-p|\ge\delta)
\le2e^{-2N_+(\delta)\delta^2}
\le\delta.
$$
Under $p_-$, the event $\widehat p\ge1/2$ implies $\widehat p-p_-\ge2\delta>\delta$; under $p_+$, the event $\widehat p\le1/2$ implies $p_+-\widehat p\ge2\delta>\delta$. Thus both test errors obey the same bound. Counting operations gives (B.5g), and Theorem B.2 supplies the matching asymptotic lower bound. ∎

**Resolution TV-SPAP-02-R1 (Metadata).** Exact domain: independent Bernoulli observations with $0<\delta\le1/8$ and failure budget $\beta(\delta)=\delta$. Premises: Theorem B.2's frozen hard pair and lower-cost certificate, admission of the sample-mean algorithm, and its declared $c_u$ per-observation upper ledger. Equivalence: estimators are compared by their induced output/error law on the two registered parameters. Budget: $N_+(\delta)$ observations and their declared finite operation ledger. Verifier: Hoeffding's exact tail substitution together with Theorem B.2's converse. Falsifier: failure of (B.5f), an exceeded operation ledger, or an admissible algorithm below the certified converse. Provenance class: source-internal probabilistic construction. Downstream consumers: Theorem 14, Corollary B.2.1 and `TV-SPAP-02`. Nonvacuity: the two independent Bernoulli laws and the sample-mean algorithm. This is `positive-discharge` of the frozen hard-family rate. Theorem B.2b and Resolution TV-SPAP-02-R2 below negatively resolve SPAP-only entailment; the task-specific reduction, populated certificate, and physical operation bridge remain `M+C+R`-open.

**Theorem B.2b (SPAP Does Not Entail a Nonvacuous Bernoulli Hard-Family Certificate).** The diagonal-closure hypotheses and conclusions of Theorems 10--11 do not imply the existence of a reduction certificate $\mathfrak C_{B.2}$ admitting any $\delta$-accurate strategy. More precisely, there is a nonempty coded model class carrying the deterministic and rational-probabilistic SPAP diagonal constructions and an admissible protocol registry for which no such nonvacuous B.2 certificate exists.

*Proof.* Take a standard coded class of finite deterministic and rational-probabilistic programs closed under self-description, finite composition, Boolean negation, the rational threshold test $p>1/2$, and the diagonal wrappers of Theorems 10--11. This is a nonempty model class satisfying those theorems' logical hypotheses. Register for each nominated system only the single read-before-commit interaction used by the diagonal construction, and admit one-shot Bernoulli observations at every rational parameter. The registry contains no reset, restart, product, or repeated-trial operation, so it contains no protocol producing two independent observations of one parameter.

The SPAP proofs use one prediction query followed by one diagonal commit and assume no repetition axiom. Suppose a B.2 certificate on this registry admits a strategy at any margin $0<\delta\le1/8$, with $\beta(\delta)\le\delta$. For positive $\beta$, Theorem B.2 requires
$$
N\ge
\frac{3}{128\delta^2}
\ln\!\left(\frac1{4\beta(\delta)}\right)
\ge
\frac{3}{128(1/8)^2}\ln2
=
\frac32\ln2>1.
$$
If $\beta=0$, no test using finitely many observations of these two strictly positive Bernoulli laws can have both errors zero. Thus every nonvacuous certificate would require at least two observations, contradicting the one-shot registry. The registered class satisfies SPAP while failing the B.2 certificate premise. ∎

**Resolution TV-SPAP-02-R2 (Logical Nonentailment Boundary).** Exact domain: coded model classes satisfying Theorems 10--11 and protocol registries not assumed closed under restart, products, or independent repetition. Premises: only the stated SPAP representation, simulation, threshold, Boolean, and diagonal-closure hypotheses. Equivalence: equality of the admitted interaction protocols and induced response laws. Budget: the one prediction query and one diagonal commit in the countermodel. Verifier: replay the diagonal wrapper, audit absence of repeated-trial morphisms, and check the displayed B.2 integer lower bound. Falsifier: a derivation of an admitted two-sample independent protocol from the frozen one-shot registry. Provenance class: source-internal logical countermodel. Downstream consumers: Theorem 14, Corollary B.2.1, `TV-SPAP-02`, and alias `TV-BSR-02`. Nonvacuity: the coded finite-program class and its rational one-shot Bernoulli laws. This is `nonentailment` of a nonvacuous $\mathfrak C_{B.2}$ from SPAP alone, not a no-go for a task-specific reduction after independent repeated-trial, hard-law, confidence, and cost records are supplied. The SPAP-only route therefore carries `N`; the task-specific reduction proof, populated certificate, and physical-operation bridge remain `M+C+R`-open, so the owner and alias both retain `N+M+C+R`.

**Corollary B.2.1 (Conditional Pattern-Specific Cost Inheritance).** Let $\mathcal S_E$ be an admissible integration class with margins $0<\delta_S(E)\le1/8$. Assume one registered task class satisfies the complete reduction certificate of Theorem B.2 with a common $c_s>0$ and confidence function $\beta(\delta)\le\delta$. Suppose a certificate maps every $S\in\mathcal S_E$ to a $\delta_S(E)$-accurate strategy $\mathcal R_E(S)$ in that class and proves
$$
\operatorname{Cost}_{\mathrm{integrate}}(S,E)
\ge
\operatorname{Cost}_{B.2}
(\mathcal R_E(S);\delta_S(E)).
$$
Then
$$
\operatorname{Cost}_{\mathrm{integrate}}(S,E)
\ge C_{\mathrm{uni}}(\delta_S(E)),
\qquad
C_{\mathrm{uni}}(\delta)
=\Omega\!\left(\frac{\log(1/\delta)}{\delta^2}\right)
\quad(\delta\downarrow0).
\tag{B.5a}
$$
The asymptotic statement concerns the registered task family as its margin tends to zero, with the same certificate constants. Self-reference or self-model engagement alone supplies no such reduction.

*Proof.* By admissibility of $\mathcal R_E(S)$ and the definition of the infimum,
$$
\operatorname{Cost}_{B.2}
(\mathcal R_E(S);\delta_S(E))
\ge C_{\mathrm{uni}}(\delta_S(E)).
$$
Combining this with cost preservation proves the first inequality. The complete Theorem B.2 certificate gives the uniform asymptotic lower bound. ∎

**Corollary B.2.2 (Finite Certificate-Level Cost Floor and Audit Scope).**

Let $E$ and an admissible integration strategy $S$ satisfy Corollary B.2.1 with
$$
\delta_S(E)=\frac1{\mu_S(E)}\le\frac18.
$$
Assume the uniform reduction certificate retains the same observation-cost constant $c_s>0$ and error bound $\beta(\delta)\le\delta$ used in Theorem B.2. Then
$$
\operatorname{Cost}_{\mathrm{integrate}}(S,E)
\ge
\frac{3c_s}{128}\,
\mu_S(E)^2
\ln\!\left(\frac{\mu_S(E)}4\right).
\tag{B.5c}
$$

*Proof.* Cost preservation and Theorem B.2 give
$$
\operatorname{Cost}_{\mathrm{integrate}}(S,E)
\ge
c_sN(\mathcal R_E(S),\delta_S(E))
\ge
\frac{3c_s}{128\delta_S(E)^2}
\ln\!\left(
\frac1{4\beta(\delta_S(E))}
\right).
$$
Since $\beta(\delta)\le\delta$ and $\delta_S(E)=1/\mu_S(E)$,
$$
\ln\!\left(
\frac1{4\beta(\delta_S(E))}
\right)
\ge
\ln\!\left(\frac{\mu_S(E)}4\right).
$$
Substitution proves (B.5c). ∎

The bound concerns the worst-case operation count of Definition B.2. A sample mean, median, finite-ladder regression, or individual low-cost execution does not contradict it. A finite implementation audit contradicts the joint implementation-and-reduction certificate only when the registered implementation has one fixed operation count $C_{\mathrm{fix}}(S,E)$ on every admissible execution path and that count is below the right-hand side of (B.5c), or when a verified all-path upper bound $U(S,E)$ satisfies
$$
U(S,E)
<
\frac{3c_s}{128}\,
\mu_S(E)^2
\ln\!\left(\frac{\mu_S(E)}4\right).
\tag{B.5d}
$$
The admissible execution class, $c_s$, and the bridge from instrument counts to Definition B.2 operations must be fixed before outcome inspection.

## B.4 Microscopic Energy Density Operator $\hat{\rho}_v$ and Interaction Structure

The total energy density associated with an individual MPU incorporates contributions from its baseline operation, complexity-related costs, and interactions, including the thermodynamic cost of irreversibility.

**Definition B.3 (Microscopic Energy Density Operator $\hat{\rho}_v$)**

For the microscopic construction through Theorem B.4, use a registered finite closed network and a finite-dimensional Hilbert space for each MPU and each included auxiliary system. All Hamiltonian, cost and interaction operators are self-adjoint; their coefficients, the effective volume $V_{\mathrm{MPU}}>0$ and the operational timescale $\tau_0>0$ have no explicit time dependence on the window considered. Thus all finite sums and commutators below are bounded operators on the common tensor-product Hilbert space. Infinite-network or unbounded-operator extensions require separate existence, domain and commutator certificates. On this finite autonomous branch the microscopic energy-density operator is
$$
\hat{\rho}_v = \frac{1}{V_{\mathrm{MPU}}} \left( \hat{H}_v + \left(\hat{R}(C_v) - R(C_{op})\hat{\mathbb I}_v\right)\tau_0 + \hat{R}_I(C_v)\tau_0 + \hat{E}_{int}(v) \right) \tag{B.6}
$$
where:

1.  **$\hat{H}_v$:** The internal MPU Hamiltonian (Energy operator, from Def 26, Eq 43). Its contribution to energy density is $\hat{H}_v/V_{\mathrm{MPU}}$. On the calibrated branch of Theorem 29, assume that $\hat H_v$ is expressed relative to the registered energy reference $E_0=0$ and that the operational clock satisfies $\tau_0=1/\nu$, so $\langle\hat H_v\rangle=R(C_{op})\tau_0$. Here $R(C_{op})$ is the baseline operational power (Definition 3), and $C_{op}$ is the baseline operational complexity for the declared task (Definition 13).
2.  **$\hat{R}(C_v), \hat{R}_I(C_v)$:** The operational resource cost *power* operators (defined in Theorem B.1, Eq B.3, derived from the power functions $R(C), R_I(C)$ in Definition 3). Since $\langle \hat{H}_v\rangle$ already accounts for the baseline operational energy associated with $R(C_{op})$, the term $\left(\hat{R}(C_v)-R(C_{op})\hat{\mathbb I}_v\right)\tau_0$ contributes only the excess operational energy (above baseline) over the timescale $\tau_0$, while $\hat{R}_I(C_v)\tau_0$ contributes the reflexive/irreversible overhead energy over $\tau_0$. Here $\hat{\mathbb I}_v$ is the identity on $\mathcal H_v$ and $R(C_{op})$ is a scalar (the power evaluated at the fixed baseline complexity $C_{op}$).
3.  **$\hat{E}_{int}(v) = \frac{1}{2}\sum_{v' \sim v} \hat{V}_{vv'}$:** The interaction energy operator (Energy operator). Its contribution to energy density is $\hat{E}_{int}(v)/V_{\mathrm{MPU}}$. Acts on the joint Hilbert space $\mathcal{H}_v \otimes \mathcal{H}_{v'}$ (or larger, if auxiliary degrees implementing ND-RID are included explicitly as in Definition B.4).

The constants $V_{\mathrm{MPU}}$ and $\tau_0$ are separately registered effective volume and operational-clock data for this dimensional conversion. Let $\mathcal N[v]$ contain $v$, all incident-edge endpoints, and every auxiliary degree of freedom in the support of $\hat\rho_v$. Then $\hat\rho_v$ is Hermitian on $\mathcal H_{\mathcal N[v]}$, and its expectation is
$$
\langle\hat\rho_v\rangle
=
\operatorname{tr}_{\mathcal H_{\mathcal N[v]}}\!\left(
\rho_{\mathcal N[v]}\hat\rho_v
\right),
$$
where $\rho_{\mathcal N[v]}$ is the reduced state on that support. This expectation represents the average local energy density assigned to MPU $v$.

**Definition B.4 (Structure of Interaction Operator $\hat{V}_{vv'}$)**

For every undirected interaction edge $\{v,v'\}$, let $\hat V_{vv'}$ be a registered self-adjoint operator supported on $\mathcal H_v\otimes\mathcal H_{v'}$ or on an explicitly registered enlargement by local auxiliary degrees of freedom, and impose
$$
\hat V_{vv'}^\dagger=\hat V_{vv'},
\qquad
\hat V_{vv'}=\hat V_{v'v}.
$$
Its matrix elements and coupling scale are branch data; neither the ND-RID kernel nor the entropy ledger determines them. When reduced ND-RID dynamics is dissipative, $\hat V_{vv'}$ denotes the self-adjoint system–auxiliary interaction on the enlarged support, not a non-Hermitian dissipator inserted into $\hat H_{total}$.

Let $N_{\mathrm{int}}$ be the mean number of completed edge updates and $S_{\mathrm{tot}}$ a registered mean thermodynamic entropy-production ledger. This ledger is not the von Neumann entropy of the complete closed network. Assume an independent dimensionless production-floor certificate $\epsilon\ge0$, with additive accounting such that
$$
\Delta S_{\mathrm{tot}}(I)\ge
k_B\epsilon\,\Delta N_{\mathrm{int}}(I)
$$
on every admitted interval $I$. If both ledgers are absolutely continuous, write $r_{\mathrm{int}}=dN_{\mathrm{int}}/dt$. With a separate throughput certificate $r_{\mathrm{int}}\le1/\tau_{\mathrm{int}}$, $\tau_{\mathrm{int}}>0$, one has almost everywhere
$$
\dot S_{\mathrm{tot}}(t)\ge k_B\epsilon\,r_{\mathrm{int}}(t),
\qquad
0\le r_{\mathrm{int}}(t)\le\frac1{\tau_{\mathrm{int}}}.
\tag{B.10}
$$
The lower rate $k_B\epsilon/\tau_{\mathrm{int}}$ applies only on a sustained throughput-saturation branch. The ND-RID kernel and Theorem 32 do not establish $\epsilon>0$: registered reset heat divided by temperature includes the conditional entropy removed from the record and is distinct from total entropy production. A reversible reset can have positive heat export and zero excess production.



## B.5 Microscopic Flow Operators and Conservation Laws

To construct the full stress-energy tensor, operators for momentum density and momentum flux are defined by requiring local conservation at the microscopic level. We also make the energy-current explicit under a standard locality assumption.

**Definition B.5 (Microscopic Flow Operators $\hat{\pi}_{v,j}$ and $\hat{p}_{v,jk}$)**

Let $\hat{\rho}_v$ be the microscopic energy density operator from (B.6) and define the corresponding local energy operator $\hat{\epsilon}_v := V_{\mathrm{MPU}} \hat{\rho}_v$ (so $\hat{\epsilon}_v$ has units of energy). Let the total Hamiltonian be
$$
\hat{H}_{total} := \sum_v \hat{\epsilon}_v,
$$
interpreted as the global closed Hamiltonian of the MPU network (including any local auxiliary degrees of freedom used to implement ND-RID as in Definition B.4). We define the time derivative in the Heisenberg picture as $\frac{d}{dt}\hat{O} = \frac{i}{\hbar}[\hat{H}_{total}, \hat{O}]$.

Because each $\hat{\epsilon}_v$ is supported on $v$ and its finite set of incident edges, one has $[\hat{\epsilon}_v, \hat{\epsilon}_u]=0$ whenever the supports of $\hat{\epsilon}_v$ and $\hat{\epsilon}_u$ are disjoint. Define the antisymmetric pairwise energy-current operator:
$$
\hat{J}_{v \to u} := \frac{i}{\hbar V_{\mathrm{MPU}}}\,[\hat{\epsilon}_v, \hat{\epsilon}_u] = -\hat{J}_{u \to v}.
$$
Then
$$
\frac{d}{dt}\hat{\rho}_v
= \frac{i}{\hbar V_{\mathrm{MPU}}}\left[\sum_u \hat{\epsilon}_u,\hat{\epsilon}_v\right]
= \sum_u \frac{i}{\hbar V_{\mathrm{MPU}}}[\hat{\epsilon}_u,\hat{\epsilon}_v]
= -\sum_u \hat{J}_{v\to u},
$$
so the local energy continuity equation holds:
$$
\frac{d}{dt}\hat{\rho}_v + \sum_u \hat{J}_{v \to u} = 0. \tag{B.11}
$$

Assume a local chart with a registered discrete divergence and flux assignment for which (B.11) has the directional form
$$
\frac{d}{dt}\hat{\rho}_v + \sum_{j=1}^3 \nabla_j^{(v)} \hat{q}_{v,j} = 0.
$$
On the momentum-flux closure branch, assume in addition that: (i) the discrete translation Noether momentum density $\hat\pi_{v,j}^{\mathrm N}$ exists; (ii) the local relativistic bridge identifies
$$
\hat\pi_{v,j}^{\mathrm N}=\frac{\hat q_{v,j}}{c^2};
$$
and (iii) the corresponding Noether stress $\hat p_{v,jk}$ satisfies
$$
\frac{d}{dt}\hat\pi_{v,j}^{\mathrm N}
+
\sum_{k=1}^3\nabla_k^{(v)}\hat p_{v,jk}=0.
\tag{B.12}
$$
Write $\hat\pi_{v,j}:=\hat\pi_{v,j}^{\mathrm N}$. The stress is defined up to addition of a discrete divergence-free tensor. If the chart, Noether current, relativistic bridge, or closure identity is absent, the canonical stress-tensor construction below does not apply.

## B.6 Canonical Microscopic Stress-Energy Tensor $\hat{T}^{\mu\nu}_{(can)}$

We assemble the density and flux operators into a canonical stress-energy tensor.

**Definition B.6 (Canonical Microscopic Stress-Energy Operator $\hat{T}^{\mu\nu}_{(can)}$)**

The canonical microscopic stress-energy operator $\hat{T}^{\mu\nu}_{(can)}(v)$ for MPU $v$ is defined by its components in a local frame (0=time, j,k=spatial):

*   $\hat{T}^{00}_{(can)}(v) = \hat{\rho}_v$ (Energy Density, Eq B.6)
*   $\hat{T}^{0j}_{(can)}(v) = c \hat{\pi}_{v,j}$ (Energy flux density)
*   $\hat{T}^{j0}_{(can)}(v) = c \hat{\pi}_{v,j}$ (Momentum density scaled)
*   $\hat{T}^{jk}_{(can)}(v) = \hat{p}_{v,kj}$ (Stress)

(By definition $\hat{\pi}_{v,j}:=\hat{q}_{v,j}/c^2$, one has $\hat{T}^{0j}_{(can)}(v)=\hat{T}^{j0}_{(can)}(v)$.)

**Theorem B.3 (Microscopic Conservation Law for $\hat{T}^{\mu\nu}_{(can)}$ on the Momentum-Flux Closure Branch)**

The canonical tensor $\hat{T}^{\mu\nu}_{(can)}(v)$ satisfies the local conservation law using a discrete spacetime divergence $\partial_\mu^{(v)}$ (where $\partial_0^{(v)} = (1/c)\, d/dt$, $\partial_j^{(v)} = \nabla_j^{(v)}$):
$$
\sum_{\mu=0}^{3} \partial_\mu^{(v)} \hat{T}^{\mu\nu}_{(can)}(v) = 0 \quad (\text{for } \nu = 0, 1, 2, 3) \tag{B.13}
$$
*Proof:* For $\nu = 0$,
$$
\sum_{\mu=0}^{3} \partial_\mu^{(v)} \hat{T}^{\mu 0}_{(can)}
= \partial_0^{(v)} \hat{\rho}_v + \sum_{j=1}^3 \nabla_j^{(v)}(c\hat{\pi}_{v,j})
= \frac{1}{c}\frac{d\hat{\rho}_v}{dt} + \frac{1}{c}\sum_{j=1}^3 \nabla_j^{(v)} \hat{q}_{v,j} = 0
$$
by (B.11) and $\hat{q}_{v,j}=c^2\hat{\pi}_{v,j}$ (Definition B.5). For $\nu = k$, one has
$$
\sum_{\mu=0}^{3} \partial_\mu^{(v)} \hat{T}^{\mu k}_{(can)}
= \partial_0^{(v)}(c\hat{\pi}_{v,k}) + \sum_{j=1}^3 \nabla_j^{(v)} \hat{p}_{v,kj}
= \frac{d\hat{\pi}_{v,k}}{dt} + \sum_{j=1}^3 \nabla_j^{(v)} \hat{p}_{v,kj} = 0
$$
by (B.12). ∎

## B.7 Symmetric Physical Microscopic Stress-Energy Tensor $\hat{\Theta}_{\mu\nu}^{(MPU)}$

The canonical tensor is symmetrized using the Belinfante-Rosenfeld procedure to obtain the physically relevant tensor.

**Theorem B.4 (Belinfante-Rosenfeld Symmetrization)**

Let $\hat{S}^{\lambda\mu\nu}(v)$ be a spin current operator antisymmetric in $\mu,\nu$. Assume that the registered discrete derivative satisfies the coordinate Leibniz identities
$$
\partial_\lambda^{(v)}(x^\mu A^\lambda)
=
\delta_\lambda^{\mu}A^\lambda
+
x^\mu\partial_\lambda^{(v)}A^\lambda
$$
on the retained fields and that mixed derivatives commute on the superpotential below. Assume also local energy-momentum conservation (Theorem B.3, Equation B.13) and local total-angular-momentum conservation
$$
\partial_\lambda^{(v)} \left( x^\mu \hat{T}^{\lambda\nu}_{(can)}(v) - x^\nu \hat{T}^{\lambda\mu}_{(can)}(v) - \hat{S}^{\lambda\mu\nu}(v) \right)=0.
$$
Define the Belinfante-Rosenfeld improved tensor by
$$
\hat{\Theta}^{\mu\nu}_{(MPU)}(v)
= \hat{T}^{\mu\nu}_{(can)}(v)
+ \frac{1}{2}\partial_\lambda^{(v)}\!\left(\hat{S}^{\mu\lambda\nu}(v) + \hat{S}^{\nu\lambda\mu}(v) - \hat{S}^{\lambda\mu\nu}(v)\right). \tag{B.14}
$$
Then $\hat{\Theta}^{\mu\nu}_{(MPU)}$ is symmetric and satisfies:
$$
\partial_\mu^{(v)}\hat{\Theta}^{\mu\nu}_{(MPU)} = 0.
$$

*Proof:* From the assumed local conservation of total angular momentum and (B.13), expand the divergence:
$$
0=\partial_\lambda^{(v)}\!\left(x^\mu \hat{T}^{\lambda\nu}_{(can)}-x^\nu \hat{T}^{\lambda\mu}_{(can)}-\hat{S}^{\lambda\mu\nu}\right)
=\hat{T}^{\mu\nu}_{(can)}-\hat{T}^{\nu\mu}_{(can)}-\partial_\lambda^{(v)}\hat{S}^{\lambda\mu\nu},
$$
hence
$$
\hat{T}^{\mu\nu}_{(can)}-\hat{T}^{\nu\mu}_{(can)}=\partial_\lambda^{(v)}\hat{S}^{\lambda\mu\nu}. \quad (\ast)
$$
Define the superpotential
$$
\hat{B}^{\lambda\mu\nu}(v):=\frac{1}{2}\left(\hat{S}^{\mu\lambda\nu}(v)+\hat{S}^{\nu\lambda\mu}(v)-\hat{S}^{\lambda\mu\nu}(v)\right),
$$
so that (B.14) is $\hat{\Theta}^{\mu\nu}_{(MPU)}=\hat{T}^{\mu\nu}_{(can)}+\partial_\lambda^{(v)}\hat{B}^{\lambda\mu\nu}$. Using only $\hat{S}^{\lambda\mu\nu}=-\hat{S}^{\lambda\nu\mu}$, one checks $\hat{B}^{\lambda\mu\nu}=-\hat{B}^{\mu\lambda\nu}$.

*Symmetry.* Compute the antisymmetric part:
$$
\hat{\Theta}^{\mu\nu}_{(MPU)}-\hat{\Theta}^{\nu\mu}_{(MPU)}
=(\hat{T}^{\mu\nu}_{(can)}-\hat{T}^{\nu\mu}_{(can)})+\partial_\lambda^{(v)}(\hat{B}^{\lambda\mu\nu}-\hat{B}^{\lambda\nu\mu}).
$$
A direct substitution gives $\hat{B}^{\lambda\mu\nu}-\hat{B}^{\lambda\nu\mu}=-\hat{S}^{\lambda\mu\nu}$, hence
$$
\hat{\Theta}^{\mu\nu}_{(MPU)}-\hat{\Theta}^{\nu\mu}_{(MPU)}
=(\hat{T}^{\mu\nu}_{(can)}-\hat{T}^{\nu\mu}_{(can)})-\partial_\lambda^{(v)}\hat{S}^{\lambda\mu\nu}=0
$$
by $(\ast)$.

*Conservation.* Using (B.13) and $\hat{B}^{\lambda\mu\nu}=-\hat{B}^{\mu\lambda\nu}$,
$$
\partial_\mu^{(v)}\hat{\Theta}^{\mu\nu}_{(MPU)}
=\partial_\mu^{(v)}\hat{T}^{\mu\nu}_{(can)}+\partial_\mu^{(v)}\partial_\lambda^{(v)}\hat{B}^{\lambda\mu\nu}
=0+\partial_\mu^{(v)}\partial_\lambda^{(v)}\hat{B}^{\lambda\mu\nu}=0,
$$
since the assumed commutation of mixed discrete derivatives makes the double divergence symmetric in $(\mu,\lambda)$ while $\hat{B}^{\lambda\mu\nu}$ is antisymmetric in $(\lambda,\mu)$. ∎

**Definition B.7 (Physical Microscopic Stress-Energy Operator)**

We identify the symmetric, conserved tensor $\hat{\Theta}_{\mu\nu}^{(MPU)}(v)$ from Eq (B.14) as the physical microscopic stress-energy tensor operator for MPU $v$.

## B.8 Macroscopic Stress–Energy Tensor $T_{\mu\nu}^{(MPU)}$

On a regular continuum branch, each convergent subsequence has a macroscopic source tensor obtained from the corresponding coarse-grained MPU operator field. When the metric-variation identification hypotheses of Theorem B.8c hold for that limit, variation of the continuum MPU action gives the same tensor. Existence of one such limit does not prove uniqueness across subsequences; full-family convergence requires additional hypotheses, such as the unique-cluster-point condition of Corollary B.8b.1.

**Definition B.8 (Macroscopic MPU Stress-Energy Tensor $T_{\mu\nu}^{(MPU)}$)**

The macroscopic MPU stress-energy tensor $T_{\mu\nu}^{(MPU)}(x)$ at spacetime point $x$ is the expectation value of the emergent operator field $\hat{\Theta}_{\mu\nu}(x)$ (formalized in Appendix F, Def F.4) in the relevant physical state $\omega$:
$$
T_{\mu\nu}^{\text{(MPU)}}(x) = \omega(\hat{\Theta}_{\mu\nu}(x))
\tag{B.15}
$$
This represents the thermodynamically relevant coarse-grained average $\langle \hat{\Theta}_{\mu\nu}^{(MPU)}(v) \rangle$. On the regular local-equilibrium branch where the continuum MPU action exists and is Gâteaux differentiable, Theorem B.8c identifies the same tensor with the metric variational source
$$
T_{(\mathrm{MPU})}^{\mu\nu}
=
\frac{2}{\sqrt{|g|}}\,
\frac{\delta S_{(\mathrm{MPU})}}{\delta g_{\mu\nu}},
\qquad
T^{(\mathrm{MPU})}_{\mu\nu}
=
-\frac{2}{\sqrt{|g|}}\,
\frac{\delta S_{(\mathrm{MPU})}}{\delta g^{\mu\nu}}
\tag{B.15a}
$$
Thus Corollary B.8d.1 identifies the expectation-value source, Belinfante continuum source, horizon heat-flux source, and metric variational source as the same $T_{\mu\nu}^{(MPU)}$ on the stated branch.

**Theorem B.5 (Macroscopic Covariant Conservation of $T_{\mu\nu}^{(MPU)}$)**

On the regular branch, assume the limiting tensor measure of Theorem B.8b satisfies $\mathbf T\ll dV_g$. Then its $L^1_{\mathrm{loc}}$ density $T_{\mu\nu}^{(MPU)}(x)$ satisfies
$$
\nabla^{\mu}T_{\mu\nu}^{\text{(MPU)}}=0
\tag{B.16}
$$
in the distributional sense. On the smooth on-shell variational branch of Theorems F.1 and B.8c, the same equation holds pointwise.

*Proof.* Definition B.8a supplies the discrete weak-conservation identity and mesh-consistency assumptions. Theorem B.8b(b) passes those identities to the continuum measure $\mathbf T^{\mu\nu}$ and proves
$$
\int\nabla_\mu\psi_\nu\,d\mathbf T^{\mu\nu}=0
$$
for every compactly supported smooth test one-form $\psi$. Under the stated absolute-continuity premise, Theorem B.8b(c) writes $d\mathbf T^{\mu\nu}=T_{(\mathrm{MPU})}^{\mu\nu}dV_g$, so the last display is precisely $\nabla_\mu T_{(\mathrm{MPU})}^{\mu\nu}=0$ in distributions.

On the smooth variational branch, Theorem F.1 applies to the diffeomorphism-invariant on-shell action and gives covariant conservation of its metric-variation tensor. Theorem B.8c identifies that tensor with the continuum measure density, and Corollary B.8d.1 identifies it with the coarse-grained MPU source. Hence the microscopic and variational routes concern the same tensor. Distributional equality agrees with pointwise equality when the tensor is smooth. ∎

## B.9 Correspondence with Standard Forms

The emergent tensor reproduces known physical forms.

**Definition B.8a (Admissible Coarse-Graining).** On the second-countable smooth regular manifold $M_{\mathrm{reg}}$, choose an auxiliary positive fiber norm for tensor total variation. A refinement family with symmetric discrete tensors $\Theta_h^{\mu\nu}(v)$ and sampling measures
$$
\mathbf T_h^{\mu\nu}
:=
\sum_{v\in V_h}\Theta_h^{\mu\nu}(v)\mu_h(v)\delta_{x_v}
\tag{B.19}
$$
is admissible when:

1. For every compact $K\subset M_{\mathrm{reg}}$,
$\sup_{h>0}|\mathbf T_h|(K)<\infty$.
2. For every $\psi\in C_c^\infty(T^*M_{\mathrm{reg}})$,
$$
\sum_{v\in V_h}
\Theta_h^{\mu\nu}(v)\mu_h(v)
(\nabla_\mu^h\psi_\nu^{(h)})(v)=0.
\tag{B.20}
$$
3. For every such $\psi$, there is a compact $K_\psi$ containing $\operatorname{supp}\psi$ in its interior such that, for all sufficiently small $h$, the discrete test gradient vanishes at sampling points outside $K_\psi$, and
$$
\sup_{\{v:x_v\in K_\psi\}}
\left|
(\nabla_\mu^h\psi_\nu^{(h)})(v)
-(\nabla_\mu\psi_\nu)(x_v)
\right|
\le c_\psi h
$$
with $c_\psi$ independent of $h$. Thus the same compact controls the stencil support and the approximation error.

Two admissible families are $\varepsilon$-equivalent if
$|\mathbf T_h-\widetilde{\mathbf T}_h|(K)
=O(h)|\mathbf T_h|(K)$ for every compact $K$.

**Theorem B.8b (Belinfante Continuum Limit and Conservation).** Let $(\mathbf T_h)$ be admissible on the Lorentzian branch of Theorem 45 and Corollary 46a. Then:

(a) There exist $h_j\to0$ and a symmetric tensor-valued Radon measure $\mathbf T$ such that $\mathbf T_{h_j}\rightharpoonup\mathbf T$ locally weak-$*$, meaning convergence against every compactly supported continuous dual tensor field.

(b) For every $\psi\in C_c^\infty(T^*M_{\mathrm{reg}})$,
$$
\int\nabla_\mu\psi_\nu\,d\mathbf T^{\mu\nu}=0.
$$

(c) If $\mathbf T\ll dV_g$, then
$d\mathbf T^{\mu\nu}=T_{(\mathrm{MPU})}^{\mu\nu}dV_g$
for a symmetric $L^1_{\mathrm{loc}}$ density satisfying
$\nabla_\mu T_{(\mathrm{MPU})}^{\mu\nu}=0$ in distributions.

*Proof.* Choose relatively compact open sets $U_m$ exhausting the manifold, with $\overline U_m\subset U_{m+1}$, and smooth compactly supported cutoffs $\chi_m$ equal to one on a neighborhood of $\overline U_m$. On the compact support of each cutoff, total variation bounds $\chi_m\mathbf T_h$. In finitely many local trivializations the weak-$*$ compactness argument applies to finite-rank measure components; the continuous test-section space is separable on a compact metrizable base. Banach–Alaoglu and metrizability therefore give a convergent subsequence for each $m$. Start with any sequence of mesh sizes tending to zero and diagonalize these extractions.

For a continuous test field supported compactly in $U_m$, every later cutoff equals one on its support. The corresponding limits consequently have equal pairings with that test field. These compatible local limits glue to a tensor-valued Radon measure on the manifold. Its local total variation is finite by the uniform compact bounds. Testing the antisymmetric part shows that it vanishes, proving (a). This cutoff argument does not require restrictions to compact boundaries to commute with weak-$*$ limits.

For a smooth test one-form $\psi$, use the common compact $K_\psi$ in Definition B.8a. Equations (B.19)–(B.20) give
$$
0=\int\nabla_\mu\psi_\nu\,d\mathbf T_h^{\mu\nu}+E_h,
\qquad
|E_h|\le
c_\psi h\,|\mathbf T_h|(K_\psi)\longrightarrow0.
$$
The local weak-$*$ limit proves (b). Under absolute continuity, the Radon–Nikodym theorem applied to the finitely many tensor components in each local chart gives the $L^1_{\mathrm{loc}}$ density in (c). The densities agree under coordinate changes, and substitution in (b) gives their distributional divergence identity. ∎

**Corollary B.8b.1 (Paired-Subsequence Independence of Admissible Coarse-Graining).** If $(\mathbf T_h)$ and $(\widetilde{\mathbf T}_h)$ are $\varepsilon$-equivalent admissible coarse-grainings and $h_j\to0$ is a subsequence along which $\mathbf T_{h_j}\rightharpoonup\mathbf T$, then every further subsequence along which $\widetilde{\mathbf T}_{h_j}\rightharpoonup\widetilde{\mathbf T}$ satisfies $\widetilde{\mathbf T}=\mathbf T$. When both limits have local-equilibrium densities, those densities agree almost everywhere. If either full family has a unique weak-$*$ cluster point, both full families converge to that same limit.

*Proof.* For every compactly supported continuous tensor test field $\phi$,
$$
|\langle\mathbf T_{h_j}-\widetilde{\mathbf T}_{h_j},\phi\rangle|
\le
|\mathbf T_{h_j}-\widetilde{\mathbf T}_{h_j}|(K)\sup_K|\phi|
\longrightarrow0.
$$
Passing to the paired limits gives $\langle\mathbf T-\widetilde{\mathbf T},\phi\rangle=0$ for all such $\phi$, hence equality as Radon measures. Radon–Nikodym uniqueness gives equality of densities. Uniqueness of a cluster point upgrades subsequential convergence to convergence of the family. ∎

**Proposition B.8b.2 (Admissibility Does Not Imply Source or Horizon-Flux Uniqueness).** On a flat compact coordinate box with periodic boundary conditions, fix a nonzero constant symmetric tensor $S^{\mu\nu}$ and a sequence $h_n\downarrow0$. Let the $h_n$-lattices use exact cell volumes and consistent finite-difference gradients. Define discrete tensors by the cell averages of
$$
T_n^{\mu\nu}
=
\begin{cases}
0,&n\text{ even},\\
S^{\mu\nu},&n\text{ odd}.
\end{cases}
\tag{B.20a.1}
$$
This is an admissible coarse-graining in the sense of Definition B.8a, but it has the two distinct weak-$*$ cluster points $0$ and $S^{\mu\nu}dV$. Hence admissibility, symmetry, and exact discrete conservation do not force full-family convergence or a unique continuum source.

Moreover, choose a flat local Rindler horizon patch with constant null generator $k^\mu$, positive cross-sectional area, $\kappa>0$, and affine interval $-\ell\le\lambda\le0$ with $\ell>0$. Choose the constant symmetric tensor $S$ so that $S_{\mu\nu}k^\mu k^\nu\ne0$. The two cluster-point horizon quadratures in Theorem B.8d are respectively zero and
$$
-\kappa\int_{\mathcal H}\lambda S_{\mu\nu}k^\mu k^\nu\,d\lambda\,dA,
\tag{B.20a.2}
$$
so horizon flux is not unique either.

*Proof.* Both constant tensors are symmetric and divergence-free. Exact cell averaging gives a uniform total-variation bound on each compact set. Summation by parts with periodic boundary conditions gives the discrete weak-conservation identity, and the consistent finite-difference gradients satisfy Definition B.8a(iii). Thus the family is admissible. Even indices converge exactly to the zero measure; odd indices are Riemann sums converging to $S^{\mu\nu}dV$. Since $S\ne0$, the cluster points differ. The horizon quadrature is linear in the limiting tensor, and the displayed choice of $S$ makes the second value nonzero on a patch of nonzero measure. ∎

Therefore a uniqueness theorem must add a common-action/variation limit, a Cauchy or unique-cluster-point condition, or paired $o(1)$ equivalence strong enough to invoke Corollary B.8b.1. The current admissibility class by itself refutes the universal all-coarse-grainings premise.

**Theorem B.8c (Variational Identification of the Continuum Source Tensor).** Let
$$
S_{(\mathrm{MPU})}[g,\Phi]
=
\int_{M_{\mathrm{reg}}}
\mathcal L_{(\mathrm{MPU})}(g,\Phi)\sqrt{|g|}\,d^4x
$$
be the continuum matter action obtained from Theorem D.6d. Assume:

1. **(H B.8c.1)** $S_{(\mathrm{MPU})}$ is Gâteaux differentiable with respect to compactly supported smooth metric perturbations $\delta g_{\mu\nu}$.
2. **(H B.8c.2)** For every specified compactly supported smooth $\delta g$,
   $$
   \delta_gS_h^{(\mathrm{MPU})}[\delta g]
   =
   \frac12\int\delta g_{\mu\nu}\,d\mathbf T_h^{\mu\nu}
   +
   r_h(\delta g),
   \qquad
   r_h(\delta g)=O(h).
   $$
3. **(H B.8c.3)** Along the subsequence of Theorem B.8b,
   $$
   \delta_gS_{h_j}^{(\mathrm{MPU})}[\delta g]
   \longrightarrow
   \delta_gS_{(\mathrm{MPU})}[g,\Phi;\delta g]
   $$
   for every such $\delta g$.

Then
$$
\delta_g S_{(\mathrm{MPU})}[g,\Phi;\delta g] \;=\; \tfrac12\int_{M_{\mathrm{reg}}}\delta g_{\mu\nu}\,d\mathbf T^{\mu\nu},
$$
and, if $\mathbf T\ll dV_g$, its $L^1_{\mathrm{loc}}$ density satisfies
$$
T_{(\mathrm{MPU})}^{\mu\nu}
=
\frac{2}{\sqrt{|g|}}\,
\frac{\delta S_{(\mathrm{MPU})}}{\delta g_{\mu\nu}},
\qquad
T^{(\mathrm{MPU})}_{\mu\nu}
=
-\frac{2}{\sqrt{|g|}}\,
\frac{\delta S_{(\mathrm{MPU})}}{\delta g^{\mu\nu}}.
\tag{B.21}
$$

*Proof.* By (H B.8c.2),
$$
\delta_g S_h^{(\mathrm{MPU})}[\delta g]
=
\frac12\int \delta g_{\mu\nu}\,d\mathbf T_h^{\mu\nu}
+
r_h(\delta g),
\qquad
r_h(\delta g)=O(h).
$$
For each $\delta g$, weak-$*$ convergence (Theorem B.8b) gives
$$
\int \delta g_{\mu\nu}\,d\mathbf T_{h_j}^{\mu\nu}
\to
\int \delta g_{\mu\nu}\,d\mathbf T^{\mu\nu}.
$$
Combined with (H B.8c.3), which supplies $\delta_g S_{h_j}^{(\mathrm{MPU})}\to\delta_g S_{(\mathrm{MPU})}$, this yields the stated identity. Under the additional absolute-continuity premise $\mathbf T\ll dV_g$,
$$
d\mathbf T^{\mu\nu}=T_{(\mathrm{MPU})}^{\mu\nu}\sqrt{|g|}\,d^4x,
$$
so
$$
\delta_g S_{(\mathrm{MPU})}[g,\Phi;\delta g]
=
\frac12\int_{M_{\mathrm{reg}}}
T_{(\mathrm{MPU})}^{\mu\nu}\delta g_{\mu\nu}\sqrt{|g|}\,d^4x.
$$
Therefore
$$
\frac{\delta S_{(\mathrm{MPU})}}{\delta g_{\mu\nu}}
=
\frac12\sqrt{|g|}\,T_{(\mathrm{MPU})}^{\mu\nu},
$$
which gives the covariant-metric form of (B.21). The inverse-metric form follows from
$$
\delta g^{\alpha\beta}
=
-g^{\alpha\mu}g^{\beta\nu}\delta g_{\mu\nu}.
$$
∎

**Theorem B.8d (Horizon-Flux Closure).** Let $\mathcal H$ be a smooth compact local horizon patch in a local Rindler region with null generator $k^\mu$, affine parameter $\lambda$, and approximate boost Killing field $\chi^\mu=-\kappa\lambda k^\mu+O(\lambda^2)$. Assume (H B.8d.1) continuity of $T_{(\mathrm{MPU})}^{\mu\nu}$ on $\mathcal H$. Let $\mathcal H_h$ be discrete face-unions approximating $\mathcal H$. Assume the flux-consistency certificate
$$
\left|
\sum_{f\subset\mathcal H_h}q_h(f)
-
\sum_{f\subset\mathcal H_h}
T_{\mu\nu}^{(\mathrm{MPU})}(x_f)
\chi^\mu(x_f)n_f^\nu\Delta\Sigma_f
\right|
\le\epsilon_h,
\qquad
\epsilon_h\to0,
$$
and assume that the second sum is a convergent Riemann sum for the horizon integral. Then:

(a) *Flux convergence.*
$$
\sum_{f\subset\mathcal H_h} q_h(f) \;\xrightarrow[h\to 0]{}\; \int_{\mathcal H} T_{\mu\nu}^{(\mathrm{MPU})}\,\chi^\mu\,d\Sigma^\nu.
$$

(b) *Leading Clausius flux and integrated remainder.* Consider a family of one-sided patches $\mathcal H_\ell$ with $-\ell\le\lambda\le0$ and $\ell\downarrow0$, with the orientation $d\Sigma^\nu=k^\nu d\lambda dA$. Suppose their cross-sectional areas are at most $A_\ell$, the auxiliary norms of $T$ and $k$ are uniformly bounded, and
$$
\|\chi+\kappa\lambda k\|\le C_\chi\lambda^2
$$
uniformly on the patches, with the registered $\kappa$ independent of $\ell$. Then
$$
\delta Q_{\mathcal H_\ell}
:=
\int_{\mathcal H_\ell}
T_{\mu\nu}^{(\mathrm{MPU})}\chi^\mu d\Sigma^\nu
=
-\kappa\int_{\mathcal H_\ell}
\lambda T_{\mu\nu}^{(\mathrm{MPU})}k^\mu k^\nu
\,d\lambda\,dA
+
O(A_\ell\ell^3).
$$
This is the leading local flux formula of Equation (68); the integrated remainder uses the patch-size parameter $\ell$, not the dummy integration coordinate $\lambda$.

*Proof.* (a) Let
$$
R_h
:=
\sum_{f\subset\mathcal H_h}
T_{\mu\nu}^{(\mathrm{MPU})}(x_f)
\chi^\mu(x_f)n_f^\nu\Delta\Sigma_f.
$$
By the Riemann-sum hypothesis, $R_h\to\int_{\mathcal H}T_{\mu\nu}^{(\mathrm{MPU})}\chi^\mu d\Sigma^\nu$. By flux consistency,
$$
\left|\sum_fq_h(f)-R_h\right|\le\epsilon_h\to0.
$$
The triangle inequality proves part (a).

(b) Write $\chi^\mu=-\kappa\lambda k^\mu+r^\mu$, with $\|r\|\le C_\chi\lambda^2$, and use the stated null-surface orientation. Substitution gives the leading displayed integral plus
$$
\mathcal R_\ell
=
\int_{\mathcal H_\ell}
T_{\mu\nu}^{(\mathrm{MPU})}r^\mu k^\nu\,d\lambda\,dA.
$$
For compatible auxiliary norms, let $\|T\|\le C_T$ and $\|k\|\le C_k$ uniformly. Then
$$
|\mathcal R_\ell|
\le
C_TC_kC_\chi A_\ell
\int_{-\ell}^{0}\lambda^2\,d\lambda
=
\frac{C_TC_kC_\chi}{3}A_\ell\ell^3.
$$
The leading integral is at most of order $A_\ell\ell^2$ under the same boundedness assumptions. This proves the integrated absolute error estimate; it does not assert a nonzero leading coefficient or a relative-error estimate when the leading contraction vanishes. ∎

**Corollary B.8d.1 (Source-Term Identity).** On $M_{\mathrm{reg}}$, assume the hypotheses of Theorems B.8b and B.8c, absolute continuity $\mathbf T\ll dV_g$, and the continuity, flux-consistency, and Riemann-sum hypotheses of Theorem B.8d. Then the tensor $T_{\mu\nu}^{(\mathrm{MPU})}$ coincides simultaneously with: (1) the continuum Belinfante limit of Theorem B.8b; (2) the metric variational source of Theorem B.8c, written equivalently as
$$
T_{(\mathrm{MPU})}^{\mu\nu}
=
\frac{2}{\sqrt{|g|}}\,
\frac{\delta S_{(\mathrm{MPU})}}{\delta g_{\mu\nu}}
\qquad
\text{or}
\qquad
T^{(\mathrm{MPU})}_{\mu\nu}
=
-\frac{2}{\sqrt{|g|}}\,
\frac{\delta S_{(\mathrm{MPU})}}{\delta g^{\mu\nu}};
$$
(3) a covariantly conserved symmetric tensor ($\nabla_\mu T^{\mu\nu}=0$ by Theorem B.8b(b) and, on the on-shell matter branch, independently by Corollary 45a.1); (4) the horizon heat-flux source of Theorem B.8d. The gravity derivation of §12 therefore uses one and the same stress-energy object at the microscopic, variational, thermodynamic, and conservation levels.

*Proof.* Items (1), (2), (4) follow from Theorems B.8b, B.8c, B.8d. Item (3) follows from Theorem B.8b(b) directly and, when the matter fields satisfy their Euler–Lagrange equations, independently from Corollary 45a.1 applied to the scalar-density matter action of Theorem 45a. The two routes agree because they refer to the same underlying tensor identified by (1) and (2). ∎

**Definition B.8e (Predictive-Engine Rate Certificate $\mathfrak C_{\mathrm{eng}}$).** A predictive-engine rate certificate on a regular branch is a finite record
$$
\mathfrak C_{\mathrm{eng}}
=
(\Phi_F,\;T_{\mathrm{eff}},\;N_{\mathrm{str}},\;C_{\mathrm{ret}}^{\mathrm{nat}},\;\mathcal W_{\mathrm{free}},\;\mathcal O_{\mathrm{oh}},\;\mathcal R_{\mathrm{src}},\;\text{coarse-graining window},\;\text{forward lock})
$$
where $\Phi_F$ records the available-work flux supplied by the complete free-energy and work ledger, $T_{\mathrm{eff}}>0$ is the temperature of the registered reset bath, and $n_{\mathrm{str}}(t)$ counts retained structural quanta in an individual record. The rate-certificate fields are $N_{\mathrm{str}}(t):=\mathbb E[n_{\mathrm{str}}(t)]$ and $C_{\mathrm{ret}}^{\mathrm{nat}}(t):=\varepsilon_0N_{\mathrm{str}}(t)$ when that structural normalization is used. The record $\mathcal W_{\mathrm{free}}$ specifies all paying sources and storage changes, $\mathcal O_{\mathrm{oh}}\ge0$ records mean overhead without double counting charged reset work, and $\mathcal R_{\mathrm{src}}$ records any Source-Principle relocation of payment. Proposition B.8f states the additional reset, counting, interval-budget and rate-regularity premises.

**Proposition B.8f (Conditional Predictive Engine Bound).** On the certificate branch $\mathfrak C_{\mathrm{eng}}$, let $T_{\mathrm{eff}}>0$ be constant on the registered window. Assign each counted retained-structure event to a distinct charged reset satisfying Definition 28 and Theorem 31. For each admitted accounting interval $I$, the indicator $J_j(I)$ that reset $j$ is charged to $I$ is determined by its pre-reset history $\mathcal F_j$. Conditional on every such admitted history, the reset ensemble satisfies
$$
H_q(P_j\mid R_j)\ge h_{\min}>0.
$$
The assignment excludes selection after observing reset heat. Each reset's non-bath degrees of freedom other than the declared work source have zero net internal-energy change, and interaction energies return to their initial values. Thus supplied work $W_j$ equals bath heat in the declared energy ledger. Work and count sums are integrable, with justified interchange of conditional expectations and sums.

In this rate statement, $N_{\mathrm{str}}$ and $C_{\mathrm{ret}}^{\mathrm{nat}}$ are mean count and mean retained content. For $I=[t_0,t_1]$, the distinct assignment gives
$$
\Delta N_{\mathrm{str}}(I)
\le \mathbb E\sum_jJ_j(I).
$$
Write $\overline W_{\mathrm{reset}}(I):=
\mathbb E\sum_jJ_j(I)W_j$ and assume the complete payer budget
$$
\overline W_{\mathrm{reset}}(I)+\mathcal O_{\mathrm{oh}}(I)
\le\int_I\Phi_F(t)\,dt,
\qquad \mathcal O_{\mathrm{oh}}(I)\ge0.
$$
Here $\Phi_F\ge0$ is an integrable available-work flux including every paying source. Withdrawals of stored work must be included in that supply or excluded by endpoint storage closure; incoming flux alone does not impose this budget.

Then
$$
\Delta N_{\mathrm{str}}(I)
\le
\frac{\int_I\Phi_F(t)\,dt}{k_BT_{\mathrm{eff}}h_{\min}}.
$$
If the budget applies to every subinterval and $N_{\mathrm{str}}$ is absolutely continuous, then almost everywhere
$$
\frac{dN_{\mathrm{str}}}{dt}
\le\frac{\Phi_F}{k_BT_{\mathrm{eff}}h_{\min}},
\qquad
\frac{dC_{\mathrm{ret}}^{\mathrm{nat}}}{dt}
\le
\frac{\varepsilon_0\Phi_F}{k_BT_{\mathrm{eff}}h_{\min}}
$$
when $C_{\mathrm{ret}}^{\mathrm{nat}}=\varepsilon_0N_{\mathrm{str}}$ and $\varepsilon_0=\ln2$. For discrete records the interval statement bounds the mean count; individual jumps have no ordinary instantaneous-rate interpretation. Source-Principle relocation retains the complete payer budget in $\mathcal R_{\mathrm{src}}$. Equality requires saturation of the payer budget, zero overhead, no extra charged resets, the entropy floor at each charged reset, and zero excess reset heat.

*Proof.* Conditional Landauer and endpoint energy closure give
$\mathbb E[W_j\mid\mathcal F_j]\ge a$ with
$a:=k_BT_{\mathrm{eff}}h_{\min}$. Since $J_j(I)$ is $\mathcal F_j$-measurable, the certified summation gives
$$
\overline W_{\mathrm{reset}}(I)
=
\mathbb E\sum_jJ_j(I)\mathbb E[W_j\mid\mathcal F_j]
\ge
a\,\mathbb E\sum_jJ_j(I)
\ge a\,\Delta N_{\mathrm{str}}(I).
$$
Combining this with the payer budget proves the interval bound. Absolute continuity and Lebesgue differentiation give the almost-everywhere rate bound when all subintervals are admitted. Multiplication by $\varepsilon_0$ gives the content bound. Equality requires equality at every nonnegative slack. ∎

**Remark B.8f.1 (Reset Cost of a Metered Binary Label).** Writing or retaining a binary label need not dissipate $k_BT_{\mathrm{eff}}\ln2$. That bath-heat lower bound applies only when a separately registered cyclic protocol noninjectively resets a conditionally uniform binary label and no retained side record contains the erased information. More generally Theorem 31 gives $Q_{\mathrm{bath}}\ge k_BT_{\mathrm{eff}}H(P\mid R)$ for the specified reset ensemble; equality additionally requires a thermodynamically reversible implementation with zero excess dissipation. Verification, recovery, and overwrite overheads remain separate nonnegative ledger entries.

**Corollary B.8g (Complexity Backreaction Bound).** On the source-identification branch of Corollary B.8d.1, assume the complete reset, work-budget and mean-count hypotheses of Proposition B.8f on a finite interval $I=[t_0,t_1]$. Let
$$
B_I:=
\frac{\int_I\Phi_F(t)\,dt}
{k_BT_{\mathrm{eff}}h_{\min}}<\infty.
$$
Assume an FRW or Buchert averaging certificate specifies the homogeneity scale, window, source norm and a finite coefficient $K_I\ge0$ such that the retained-growth contribution satisfies
$$
\|\Delta T_{\mathrm{growth}}(I)\|
\le K_I\Delta N_{\mathrm{str}}(I).
$$
Then $\|\Delta T_{\mathrm{growth}}(I)\|\le K_IB_I$. Any initial source contribution has its own registered bound. Negligible contamination of the Appendix U $\Lambda$ branch follows only if the total source bound lies below the residual budget specified before comparison.

*Proof.* The stress tensor of Definition B.8 is the variational source of the retained cost action by Theorem B.8c and Corollary B.8d.1. The averaging certificate converts the local rate bound into the recorded cosmological source term. Comparison with the accepted residual budget is an ordinary strict-certificate comparison; without it the result is a bound, not a negligibility theorem. ∎

**Corollary B.8d.2 (Vacuum Normalization and $\Lambda$-Absorption).** The continuum Belinfante tensor is defined up to an additive metric-proportional constant absorbed into the cosmological constant. Under
$$
T'_{\mu\nu}:=T_{\mu\nu}^{(\mathrm{MPU})}+\sigma g_{\mu\nu},
$$
the Einstein equation (76a) is equivalent to its form with $T'_{\mu\nu}$ and
$$
\Lambda':=\Lambda+\frac{8\pi G}{c^4}\sigma.
$$
The PCE-Attractor convention $T_{\mu\nu}^{(\mathrm{MPU})}|_{\mathrm{vac}}=0$ fixes the allocation of a metric-proportional vacuum term between $T_{\mu\nu}$ and $\Lambda$.

*Proof.* Put $K=8\pi G/c^4$. Since $T_{\mu\nu}^{(\mathrm{MPU})}=T'_{\mu\nu}-\sigma g_{\mu\nu}$,
$$
G_{\mu\nu}+\Lambda g_{\mu\nu}
=
K(T'_{\mu\nu}-\sigma g_{\mu\nu})
$$
is equivalent to
$$
G_{\mu\nu}+(\Lambda+K\sigma)g_{\mu\nu}=KT'_{\mu\nu}.
$$
This is the stated transformation. ∎

**Theorem B.6 (Correspondence with Standard Physical Forms)**

The macroscopic tensor $T_{\mu\nu}^{(MPU)}(x)$ (Def B.8) reproduces standard forms:
(a) **Vacuum State $\omega_{vac}$:** In a Poincaré-invariant vacuum, symmetry implies that the vacuum expectation of the stress-energy tensor is proportional to the metric:
$$
T_{\mu\nu}^{(MPU)}\big|_{vac} = \kappa\, g_{\mu\nu}
$$
for some constant $\kappa$. In the PU convention used in Eq (76), the cosmological constant $\Lambda$ is carried entirely by the geometric term on the left-hand side, and $T_{\mu\nu}^{(MPU)}$ is understood as the renormalized excitation stress-energy with the vacuum contribution absorbed into $\Lambda$. Therefore $\kappa=0$ and
$$
T_{\mu\nu}^{(MPU)}\big|_{vac} = 0. \tag{B.17}
$$

(b) **Perfect Fluid (Isotropic Local-Equilibrium Branch $\omega_{th}$):** Assume the local-equilibrium stress tensor is invariant under spatial rotations in the rest frame of a unit timelike four-velocity $u^\mu$, with $u^\mu u_\mu=-1$. Let $e_{th}$ be its rest-frame energy density and $p_{th}$ its isotropic pressure. Then
$$
T_{\mu\nu}^{(MPU)} \big|_{th}
=
(e_{th}+p_{th})u_\mu u_\nu+p_{th}g_{\mu\nu}.
\tag{B.18}
$$

*Proof.* (a) In a Poincaré-invariant vacuum, translation invariance makes $T_{\mu\nu}^{(MPU)}\big|_{vac}$ constant, and Lorentz invariance restricts a constant symmetric rank-two tensor to a multiple of $g_{\mu\nu}$. In the convention of Equation (76), that vacuum multiple is absorbed into $\Lambda$ by definition of the renormalized excitation tensor, giving (B.17). (b) In the local rest frame and signature $(-,+,+,+)$, isotropy gives $T_{0i}=0$, $T_{ij}=p_{th}\delta_{ij}$, and $T_{00}=e_{th}$. The displayed covariant tensor has exactly those components. Here $e_{th}$ has energy-density units; if a mass density $\rho_m$ is used instead, then $e_{th}=\rho_m c^2$. ∎

## B.10 Construction Pathway (Summary)

The appendix builds a physical stress-and-energy description in stages. It begins with computational and energy records, adds local flow and momentum information, and then passes to a large-scale conserved source when the required physical and geometric links are available.

**Technical ledger.**

This appendix gives a typed construction pathway for $T_{\mu\nu}^{(MPU)}$:

1. operational complexity and cost operators are defined in Definition B.1 and Theorem B.1;
2. the SPAP-side lower bound is obtained on the reduction-certificate branch of Theorem B.2;
3. Definition B.3 converts registered Hamiltonian, reset-power, interaction-energy, volume, and clock data into a microscopic energy-density operator; computational cost alone does not perform this physical conversion;
4. Definitions B.5-B.7 construct flow, canonical, and symmetric tensors when the stated local continuity, momentum-flux, and improvement records exist;
5. Definition B.8 and Theorem B.5 pass to a macroscopic covariantly conserved tensor only on the stated coarse-graining, convergence, and continuum branches; and
6. Theorem B.6 identifies vacuum and perfect-fluid forms after the corresponding symmetry, renormalization, and local-equilibrium hypotheses are supplied.

The resulting tensor is suitable as the source in Equation (76) only on a branch that also carries the metric-continuum, variational, horizon-flux, normalization, and overlap certificates required by the gravity derivation.


