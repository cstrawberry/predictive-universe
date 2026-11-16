# <a id="appendix-l-unified-foundation-energy-accounting-and-thermodynamic-consistency"></a>Appendix L: Unified Foundation — Energy Accounting and Thermodynamic Consistency

## **L.0 Foundational Insight: Awareness as Primary**

The Predictive Universe framework begins from the irreducible certainty of awareness itself. The starting point is the Cartesian cogito ergo sum—"I think, therefore I am"—which establishes awareness as the one indubitable fact of existence. However, within the operational context of this framework, thinking is fundamentally predictive: to think is to anticipate, to form expectations about what comes next, to distinguish self from non-self through anticipatory models. Thus we reformulate: praedico ergo sum—"I predict, therefore I am."

On PU's consciousness-first ontology, awareness is fundamental and irreducible (Appendix P.2), and prediction is its operational manifestation (Appendix P.3.1). Anticipation, comparison of expected with actual outcomes, and adaptive updating are the activities modeled by the predictive loop.

**Interpretive note (outside the deductive premise ledger).** The Minimal Awareness convention (Section 7.1.2) interprets the complete operational MPU cycle—prediction ($P_{\text{int}}$), verification ($V$), and update ($D_{\text{cyc}}$), including the 'Evolve' interaction—as the most basic operational form of awareness. No theorem, proposition, corollary, numerical estimate, energy ledger, thermodynamic conclusion, or coupling hierarchy in this appendix uses that interpretation as a hypothesis. The formal arguments use only the operational MPU definitions and the explicitly cited logical, thermodynamic, carrier, and branch premises.

PU is consciousness-first: awareness need not emerge from physical processes; rather, physical processes are most parsimoniously understood as patterns within awareness (Appendix P.2.3). The MPU formalism models awareness operationally.

Within the consciousness-first ontology, POP and PCE organize finite predictive activity under resource constraints. The mathematical results below use the explicit MPU, carrier, response, and energy-ledger premises stated in their theorem bodies; a Hilbert carrier, electromagnetic current, metric response, CC outcome shift, or physical coupling enters through those premises.

## **The Core Informational Comparison**

Appendix O, Theorem O.2 identifies synchronized phase-sector minimizers and, under its low-noise detailed-balance hypotheses, stationary concentration near that set. Select a synchronized configuration on this branch and independently register its processing rhythm. Choose an energy origin for $\hat H_{\text{eff}}$ and assume $0<\langle\hat H_{\text{eff}}\rangle<\infty$. On this branch define
$$
\tau_{\text{medium}}
:=
\frac{\hbar}{\langle\hat H_{\text{eff}}\rangle}.
\tag{L.0}
$$
This is an operational convention relative to the chosen energy origin, not an invariant energy-time equality. A propagating modulation of the registered rhythm is a temporal wave in the sense of Appendix O, Definition O.1 only after its evolution equation, initial/boundary data, and causal-response law are specified.

A temporal modulation has an electromagnetic interpretation only after an accepted Maxwell-carrier record supplies a conserved current, gauge field, source geometry, and nonzero radiating multipole. It has a gravitational interpretation only after an accepted metric branch supplies a complete conserved stress tensor, continuum limit, and Einstein-response map.

When electromagnetic radiation and retained matter energy occur in one implementation, a non-overlapping ledger may charge both to the aggregate input power $P_{\text{agg}}$. Their target responses remain distinct functions. A numerical electromagnetic-to-gravitational comparison requires a common source, target, geometry, retention fraction, units, and covariance ledger.

## **Scope and Organization of This Appendix**

The appendix provides:

1. context-state and mapping definitions for a declared CC implementation;
2. a conditional coherent-charge/AC-Stark candidate construction for engineered systems;
3. energy, reset, conservation, locality, and stress-energy obligations that every claimed implementation must satisfy; and
4. preregistered tests that distinguish a target response from source leakage, ordinary field effects, selection artifacts, and underpowered null results.

The coherent-charge construction is a candidate implementation class, and biological carrier proposals are hypotheses. Physical CC closure requires one preregistered record containing a source state, causal carrier, context-to-generator map, normalized target instrument, nonzero effect with sign and interval, non-overlapping energy/reset ledgers, artifact controls, and blinded replication, compatible with the selected locality branch.
## **L.1 Context State and Constraints on Mapping $\mathcal{M}$**

The CC hypothesis posits that a complex aggregate's internal state influences local MPU interactions. We formalize this "internal state" in this context.

## **Definition L.1 (Context State $\text{context}_S$)**

Let $\rho_{\mathrm{agg}}(t)$ be the aggregate density operator of an MPU aggregate $S$ (Definition 29) on $\mathcal H_{\mathrm{agg}}$. Let $\mathcal O_{\mathrm{full}}=\{\hat O_\gamma\}_{\gamma\in\mathcal G}$ be a specified family of bounded self-adjoint observables that separates the admissible density operators: if $\operatorname{tr}(\rho\hat O_\gamma)=\operatorname{tr}(\rho'\hat O_\gamma)$ for every $\gamma$, then $\rho=\rho'$. Under this informational-completeness hypothesis, the full expectation family determines the admissible state.

Choose a class of admissible control policies and a utility functional. A finite observable subfamily $\{\hat O_\alpha\}_{\alpha\in\mathcal I}$ is operationally sufficient for that control problem when every admissible control output and every utility value used by the POP objective factor through the vector $\big(\operatorname{tr}(\rho\hat O_\alpha)\big)_{\alpha\in\mathcal I}$. It is inclusion-minimal when no proper subfamily has this factorization property. Assume that at least one finite operationally sufficient family exists and that the optimization below attains a minimum over the registered candidate families.

For each candidate family define
$$ V_{\text{context}}[\{\hat{O}_\alpha\}] = \lambda_{\text{rep}} C_P(\{\hat{O}_\alpha\}) + \lambda_{\text{ctrl}} R_{\text{cost}}(\{\hat{O}_\alpha\}) - \Gamma_{\text{utility}} U_{\text{bias}}(\{\langle\hat{O}_\alpha\rangle\}). \tag{L.1} $$
The weights carry whatever conversion units are required to make the three terms commensurate. PCE selects a minimizing family. Minimal sufficiency is an additional registered property of that minimizer; it follows only if every deletion destroys operational sufficiency and every admissible addition has nonnegative net marginal value in $V_{\text{context}}$.

For a selected finite, self-adjoint family, define
$$ \text{context}_S(t) := \begin{pmatrix} \langle \hat{O}_{\alpha_1} \rangle_t \\ \langle \hat{O}_{\alpha_2} \rangle_t \\ \vdots \\ \langle \hat{O}_{\alpha_{|\mathcal{I}|}} \rangle_t \end{pmatrix} \in \mathcal{C}_{\text{ctx}} \subseteq \mathbb{R}^{|\mathcal{I}|}. \tag{L.2} $$
Only the physically instantiated state enters these expectation values; semantic truth by itself is not a control variable.

## **Definition L.2 (Context-to-Control Mapping)**

The mapping $\mathcal M:\mathcal C_{\text{ctx}}\to\mathcal P_{\text{control}}$ translates a context vector into physically realizable control parameters. POP-admissibility is a registered property relative to specified norms, a cost model, and a feedback law. It requires:

(i) For a declared asymptotic family indexed by $C_{\text{agg}}$, an explicit implementation bound such as $C_{\mathcal M}(C_{\text{agg}})\le p(\log C_{\text{agg}})$ for a stated polynomial $p$ and all $C_{\text{agg}}\ge C_*$.

(ii) A registered resource bound such as $R_{\mathcal M}\le\eta_{\text{cost}}R_{\text{core}}(C_{\text{agg}})$ with $0\le\eta_{\text{cost}}<1$.

(iii) The Lipschitz, bounded-range, bounded-cost, invariant-domain, and contraction hypotheses stated in Lemma L.1 whenever its stability conclusions are used.

PCE may optimize over mappings satisfying these conditions. Minimization of an unspecified PCE potential does not itself imply them.

## **Lemma L.1 (Consequences of Registered Mapping Bounds)**

Let $\mathcal C_{\mathrm{ctx}}\subseteq\mathbb R^{|\mathcal I|}$ be nonempty and complete for its registered norm metric, and let $\mathcal P_{\mathrm{control}}$ be finite-dimensional. Assume an admissible mapping $\mathcal M:\mathcal C_{\mathrm{ctx}}\to\mathcal P_{\mathrm{control}}$ satisfies
$$ \|\mathcal M(c_1)-\mathcal M(c_2)\|_{\mathcal P}\le L_{\mathcal M}\|c_1-c_2\|_{\mathcal C}, $$
$$ \|\mathcal M(c)\|_{\mathcal P}\le P_{\max}, $$
and assume the feedback map has the form $c_{n+1}=F(\mathcal M(c_n))$, maps $\mathcal C_{\mathrm{ctx}}$ into itself, and has Lipschitz constant $L_F$ with $L_FL_{\mathcal M}<1$. Assume also that the physical cost is bounded on the closed control ball of radius $P_{\max}$.

Then finite-variance context noise produces finite-variance control noise, every realized control has finite registered cost, and the feedback iteration has a unique globally attracting state.

*Proof.* If $C,C'$ are independent copies of a square-integrable random context, then
$$
\mathbb E\|\mathcal M(C)-\mathcal M(C')\|_{\mathcal P}^2
\le L_{\mathcal M}^2\mathbb E\|C-C'\|_{\mathcal C}^2<\infty,
$$
so the control variance is finite. The range bound places every control in the stated ball, on which the registered cost is bounded by hypothesis. Finally,
$$
\|F(\mathcal M(c_1))-F(\mathcal M(c_2))\|_{\mathcal C}
\le L_FL_{\mathcal M}\|c_1-c_2\|_{\mathcal C}.
$$
Because $L_FL_{\mathcal M}<1$, the Banach contraction theorem gives a unique attracting state and convergence from every initial context in $\mathcal C_{\mathrm{ctx}}$. These are admissibility consequences; PCE can compare their costs but does not imply the hypotheses by minimization alone. ∎

## **Theorem L.1 (Existence of a PCE-Optimal Mapping on a Compact Admissible Class)**

Assume the admissible class of mappings satisfying Lemma L.1 is nonempty and compact in the chosen topology on the mapping space, and assume both $\Delta PP(\mathcal{M})$ and $R_{\mathcal{M}}(\mathcal{M})$ are continuous on that class. Under POP/PCE optimization dynamics (Section 6, Appendix D), there exists a mapping $\mathcal{M}$ maximizing the net predictive benefit
$$ \mathcal{F}[\mathcal{M}] = \Gamma_0 \Delta PP(\mathcal{M}) - \lambda R_{\mathcal{M}}(\mathcal{M}) \tag{L.3} $$
subject to the resource constraints, where $\Gamma_0$ is the power-conversion factor (Definition 20), $\Delta PP$ is improvement in predictive performance, $\lambda$ is effective resource scarcity (Definition 20), and $R_{\mathcal{M}}$ is the operational cost of implementing $\mathcal{M}$.

*Proof.* By assumption, the admissible class of mappings satisfying Lemma L.1 is compact, and the functional $\mathcal{F}$ is continuous on that class because it is a linear combination of the continuous functionals $\Delta PP$ and $R_{\mathcal{M}}$. The Weierstrass theorem therefore implies that $\mathcal{F}$ attains a maximum on the admissible class. Hence there exists at least one admissible mapping $\mathcal{M}$ maximizing the net predictive benefit. Appendix D, Theorem D.5 may then be invoked separately, when its low-noise detailed-balance hypotheses are satisfied, to conclude concentration of the stationary measure near such an optimum. ∎

<a id="theorem-l1a-finite-minimal-context-quotient-and-complete-sufficiency-classification"></a>**Theorem L.1a (Finite Minimal Context Quotient and Complete Sufficiency Classification).** Let $\Omega$ be a finite set of admissible aggregate states and let
$$
r:\Omega\longrightarrow\mathcal Y
$$
collect every control output and utility value used by one registered control problem. Define $\omega\sim_r\omega'$ exactly when $r(\omega)=r(\omega')$, and let $T_*:\Omega\to\Omega/{\sim_r}$ be the quotient map. A statistic $T:\Omega\to\mathcal T$ is operationally sufficient exactly when
$$
T(\omega)=T(\omega')\Longrightarrow\omega\sim_r\omega'.
\tag{L.1a.1}
$$
Equivalently, the partition induced by $T$ refines the response partition induced by $T_*$. The quotient $T_*$ is the unique cardinality-minimal sufficient statistic up to a bijection of its image.

For a finite registered collection of observable families $\mathfrak F$, write $T_F$ for the expectation vector generated by $F\in\mathfrak F$. Then all inclusion-minimal sufficient families are exactly
$$
\left\{F\in\mathfrak F:
\exists\bar r_F\ \text{such that }r=\bar r_F\circ T_F,
\text{ and for every }F'\in\mathfrak F\text{ with }F'\subsetneq F,
\nexists g_{F'}\ \text{such that }r=g_{F'}\circ T_{F'}
\right\}.
\tag{L.1a.2}
$$
Distinct families in (L.1a.2) may encode the same quotient, so uniqueness of the operational context state does not imply uniqueness of an observable generating family.

*Proof.* A factorization $r=\bar r\circ T$ exists exactly when $r$ is constant on every fiber of $T$, which is (L.1a.1). Hence every sufficient $T$ has at least as many fibers as $T_*$, and equality forces a one-to-one relabeling of the quotient fibers. Applying the same fiber test to each registered family and comparing it with every registered proper subfamily proves (L.1a.2). ∎

This theorem exhausts finite operational sufficiency and its minimizers once the response table is supplied. Constructing the physical source-to-generator map associated with a selected quotient remains the independent realization step of Definition L.2.

<a id="theorem-l1b-expectation-and-single-shot-realization-of-the-minimal-context-quotient"></a>**Theorem L.1b (Expectation and Single-Shot Realization of the Minimal Context Quotient).** In Theorem L.1a, let each $\omega\in\Omega$ be a distinct density operator $\rho_\omega$ on a finite-dimensional $\mathcal H_{\mathrm{agg}}$, let the quotient have cells $\mathcal F_1,\ldots,\mathcal F_K$, and put
$$
V_r:=\operatorname{span}_{\mathbb R}\{\rho_\omega-\rho_{\omega'}:\omega\sim_r\omega'\}.
\tag{L.1b.1}
$$

(a) *(Expectation realization.)* Some finite family of bounded self-adjoint observables has an expectation vector (L.2) that realizes $T_*$ up to a bijection of values exactly when $\rho_\omega-\rho_{\omega'}\notin V_r$ for every pair $\omega\not\sim_r\omega'$. In that case one observable $O_*$ suffices.

(b) *(Countermodel.)* For the qubit states $\rho_1=|0\rangle\langle0|$, $\rho_2=I/2$, $\rho_3=|1\rangle\langle1|$ and a response table with $r(1)=r(3)\ne r(2)$, the quotient has two cells, while every operationally sufficient expectation statistic takes three distinct values. Hence the cardinality-minimal statistic of Theorem L.1a need not be an expectation vector of Definition L.1.

(c) *(Single sufficient observable.)* For every response table on distinct states there is one observable $O$ whose expectation $\omega\mapsto\operatorname{tr}(\rho_\omega O)$ is operationally sufficient; it separates all elements of $\Omega$.

(d) *(Single-shot extraction.)* A CPTP map $\Lambda$ from the aggregate to a $K$-level classical control register with $\Lambda(\rho_\omega)=|k\rangle\langle k|$ for every $\omega\in\mathcal F_k$ exists exactly when states in different cells have mutually orthogonal supports. In that case, with $\Pi_k$ the projector onto the span of the supports in $\mathcal F_k$, $\Pi_0:=I-\sum_k\Pi_k$ and a cyclic shift $X$ on $\mathbb C^K$, the unitary
$$
U_*:=\sum_{k=1}^K\Pi_k\otimes X^k+\Pi_0\otimes I
\tag{L.1b.2}
$$
maps $\rho_\omega\otimes|0\rangle\langle0|$ to $\rho_\omega\otimes|k\rangle\langle k|$ for every $\omega\in\mathcal F_k$, labelling the control basis by $\mathbb Z_K$ with $|K\rangle=|0\rangle$. It retains the aggregate state and commutes with $H_{\mathrm{agg}}\otimes I+I\otimes H_C$ whenever $H_C=0$ and every $\Pi_k$ commutes with $H_{\mathrm{agg}}$; for $K=2$ and $H_{\mathrm{agg}}=0$ it is the encoder of Theorem L.12.8b.

*Proof.* (a) Every observable defines the real-linear functional $\ell(X)=\operatorname{tr}(XO)$ on Hermitian operators, and every such functional arises in this way. An expectation vector is constant on each cell exactly when all its functionals vanish on $V_r$. If some cross-cell difference lies in $V_r$, every such vector takes equal values on that pair, so it cannot realize $T_*$. Conversely, let $D_1,\ldots,D_m$ be the cross-cell differences, none in $V_r$, and let $\ell_1,\ldots,\ell_s$ be a basis of the annihilator of $V_r$. For each $i$ some $\ell_j(D_i)\ne0$, so $\lambda\mapsto\sum_j\lambda^{j-1}\ell_j(D_i)$ is a nonzero polynomial of degree less than $s$. Some $\lambda\in\{0,1,\ldots,m(s-1)\}$ is a root of none of them, and $O_*$ representing $\sum_j\lambda^{j-1}\ell_j$ is constant on cells and separates them.

(b) Here $V_r=\mathbb R\sigma_z$ and $\rho_2-\rho_1=-\sigma_z/2\in V_r$, so (a) excludes realization. Every expectation statistic is affine with $T(\rho_2)=\tfrac12[T(\rho_1)+T(\rho_3)]$; sufficiency requires $T(\rho_2)\ne T(\rho_1)$ and $T(\rho_2)\ne T(\rho_3)$, which forces $T(\rho_1)\ne T(\rho_3)$ and three distinct values.

(c) Apply the construction of (a) with $V_r$ replaced by $\{0\}$ and $D_i$ ranging over all nonzero differences of distinct states.

(d) If $\Lambda$ exists, $E_k:=\Lambda^*(|k\rangle\langle k|)$ satisfies $0\le E_k\le I$, $\operatorname{tr}(\rho_\omega E_k)=1$ on $\mathcal F_k$ and $\operatorname{tr}(\rho_{\omega'}E_k)=0$ off it. The first equality places $\operatorname{supp}\rho_\omega$ in the eigenvalue-one eigenspace of $E_k$ and the second places $\operatorname{supp}\rho_{\omega'}$ in its kernel; these spaces are orthogonal. Conversely, orthogonality makes the $\Pi_k$ mutually orthogonal, so $U_*$ is a direct sum of unitaries and hence unitary, and $\Pi_k\rho_\omega=\rho_\omega$ on $\mathcal F_k$ gives the displayed action; tracing out the aggregate gives $\Lambda$. The commutation statement follows because each summand of $U_*$ is a product of an operator commuting with $H_{\mathrm{agg}}$ and a control operator commuting with $H_C=0$. ∎

<a id="theorem-l1c-populated-context-quotient-and-controlled-generator-certificate"></a>**Theorem L.1c (Populated Context Quotient and Controlled-Generator Certificate).** The engineered source class of Theorem L.12.8b admits a populated Definition L.1 context problem with a unique two-cell sufficient quotient, a deterministic nondemolition encoder, an exact context-to-generator map and a strict finite comparison of its sufficient observable families. Use that theorem's typed, retained source register $S$, its finite retained-record convention, and the Hilbert/instrument branch of Theorem 9.7i. Let one retained record $R$ be binary and set
$$
\Omega=\{\rho_{jr}:j,r\in\{0,1\}\},\qquad
\rho_{jr}=|s_j,r\rangle\!\langle s_j,r|,\qquad
H_S=H_R=0.
\tag{L.1c.1}
$$
These are the four registered source preparations, in the order $(0,0),(0,1),(1,0),(1,1)$. The source law may be any specified probability vector $(q_{jr})$; all four preparations remain in the admitted preparation class. The aggregate-context typing of $S$ is the imported source-class premise of Theorem L.12.8b. The register $R$ retains auxiliary source information and is left unchanged by the control operations.

Fix $0<\alpha<1$, $\theta=\arcsin\sqrt\alpha$, and positive durations $\tau_e,\tau_p,\tau_i$. Register every binary policy
$$
\Pi=\{\pi:\{0,1\}\longrightarrow\{0,1\}\}.
$$
Policy choice is an exogenous setting. Its argument is the selected source coordinate $j$; the registered policies have no access to $r$. Fresh control registers $C,D$, an auxiliary $N$ and a readout memory $M$ start at $0$. A fresh coin $Y$ starts at $I_2/2$, a target $T$ at its registered density operator (with the response maps extended linearly to input operators $X$), and an ancilla $A$ at $P_0=|0\rangle\!\langle0|$. Every register has zero free Hamiltonian on the registered operation interval. The preparation is a product with the retained source. Write $X_B$ for a Pauli bit flip on register $B$ and $Z_Y=P_0-P_1$ on the coin.

The extraction and policy pulses are
$$
\begin{aligned}
U_e&=\sum_{j=0}^1|s_j\rangle\!\langle s_j|\otimes X_C^j,
& H_e&=\frac{\pi\hbar}{2\tau_e}|s_1\rangle\!\langle s_1|\otimes(I-X_C),\\
V_\pi&=\sum_{c=0}^1|c\rangle\!\langle c|_C\otimes X_D^{\pi(c)},
& H_\pi&=\frac{\pi\hbar}{2\tau_p}\sum_{c=0}^1\pi(c)|c\rangle\!\langle c|_C\otimes(I-X_D).
\end{aligned}
\tag{L.1c.2}
$$
Identity factors on unlisted registers are understood. Thus $U_e=e^{-i\tau_eH_e/\hbar}$ and $V_\pi=e^{-i\tau_pH_\pi/\hbar}$. After these operations $C=j$ and $D=\pi(j)$, while $S,R$ are retained. Apply the Theorem 9.7i pulse
$$
H_{\mathrm{int}}=-\frac{\hbar\theta}{\tau_i}P_{1,D}\otimes Z_Y\otimes\mathrm{SW}_{TA},
\qquad
U_{b,k}=\cos(b\theta)I+i(-1)^k\sin(b\theta)\mathrm{SW}_{TA},
\tag{L.1c.3}
$$
where $b=\pi(j)$ and $k$ is the coin value. Copy the target's computational-basis value into $M$, and use the projective record service of (L.12.8b.4), jointly resolving the commuting coin and memory projectors $P_{k,Y}P_{m,M}$. The coin is already diagonal in this basis; this refinement retains its value without changing the nonselective state. These operations occupy ordered bounded supports as in (L.12.8b.12), and each is extended by the identity on spacelike factors.

The registered control response includes the actuator setting, the pre-readout target channel for every target-state/effect probe, the complete terminal outcome-labeled operation on $C,D,N,Y,T,A,M$, and the utility equal to the terminal target-$0$ probability at input $I_2/2$. The pre-readout and terminal endpoints are registered separately; the latter includes the projective readout disturbance. In the output order $C,D,Y,M,N;T,A$, its exact operation is
$$
\mathcal Q_{\pi,j}^{k,m}(X)=\frac12
|j,b,k,m,0\rangle\!\langle j,b,k,m,0|
\otimes
(P_m\otimes I_A)U_{b,k}(X\otimes P_0)U_{b,k}^{\dagger}(P_m\otimes I_A).
\tag{L.1c.4}
$$
The full source-retaining operation tensors this output with $\rho_{jr}$; it is independent of $r$ on the declared control-output registers. The response vector $r(\rho_{jr})$ in Theorem L.1a contains (L.1c.4) for all four policies and both values of $k,m$, the pre-readout channel (L.1c.5), and the stated utility. Source auditing of $R$ is a separate retained-input protocol; the context quotient below preserves $R$ in the realization rather than erasing it.

The following assertions hold.

1. **Complete response table and source map.** Each map in (L.1c.4) is completely positive and
   $\sum_{k,m}\operatorname{tr}\mathcal Q_{\pi,j}^{k,m}(X)=\operatorname{tr}X$.
   Before the terminal projective readout, discarding $Y,A$ gives
   $$
   \Lambda_{\pi,j}(X)=(1-\alpha\pi(j))X+\alpha\pi(j)\operatorname{tr}(X)P_0.
   \tag{L.1c.5}
   $$
   For $\lambda=\alpha\pi(j)$, its unnormalized input-first Choi matrix and its Pauli transfer matrix, in the respective orders $00,01,10,11$ and $I,\sigma_x,\sigma_y,\sigma_z$, are
   $$
   J(\Lambda_{\pi,j})=
   \begin{pmatrix}
   1&0&0&1-\lambda\\
   0&0&0&0\\
   0&0&\lambda&0\\
   1-\lambda&0&0&1-\lambda
   \end{pmatrix},
   \qquad
   L_{\pi,j}=
   \begin{pmatrix}
   1&0&0&0\\
   0&1-\lambda&0&0\\
   0&0&1-\lambda&0\\
   \lambda&0&0&1-\lambda
   \end{pmatrix}.
   \tag{L.1c.6}
   $$
   Here $J(\Lambda)=\sum_{a,b}|a\rangle\!\langle b|\otimes\Lambda(|a\rangle\!\langle b|)$, and the transfer matrix acts on the coefficients of $I,\sigma_x,\sigma_y,\sigma_z$. These matrices specify the whole target channel. Equation (L.1c.4) additionally retains its coin, ancilla, control and outcome records.

   At input $I_2/2$ the utility is
   $$
   u_\pi(j)=\frac{1+\alpha\pi(j)}2.
   \tag{L.1c.7}
   $$
   In policy order $00,01,10,11$, the four source rows have utilities
   $$
   \begin{array}{c|cccc}
   (j,r)&00&01&10&11\\\hline
   (0,0)&1/2&1/2&(1+\alpha)/2&(1+\alpha)/2\\
   (0,1)&1/2&1/2&(1+\alpha)/2&(1+\alpha)/2\\
   (1,0)&1/2&(1+\alpha)/2&1/2&(1+\alpha)/2\\
   (1,1)&1/2&(1+\alpha)/2&1/2&(1+\alpha)/2
   \end{array}.
   $$
   The total context-to-generator map is
   $$
   \mathcal M_\pi(j)=-\frac{\hbar\theta}{\tau_i}\pi(j)Z_Y\otimes\mathrm{SW}_{TA}.
   \tag{L.1c.8}
   $$
   In the metric $|j-j'|$, its operator-norm bound and Lipschitz constant are at most $\hbar\theta/\tau_i$, in energy units. For either nonconstant policy, its two generator values and its two target-channel values are distinct.

2. **Exhaustive sufficient quotients and observable realizers.** Equality of the complete registered response is exactly equality of $j$. Hence
   $$
   T_*(\rho_{jr})=j,
   \qquad
   \mathcal F_0=\{\rho_{00},\rho_{01}\},\quad
   \mathcal F_1=\{\rho_{10},\rho_{11}\}
   \tag{L.1c.9}
   $$
   is the unique cardinality-minimal sufficient statistic up to relabeling. The complete sufficient partition census consists of the four partitions obtained by independently retaining or splitting each doubleton $\mathcal F_j$. They have respectively $2,3,3,4$ cells.

   In the source basis of (L.1c.1),
   $$
   V_r=\operatorname{span}_{\mathbb R}
   \{\operatorname{diag}(1,-1,0,0),\operatorname{diag}(0,0,1,-1)\}.
   \tag{L.1c.10}
   $$
   A Hermitian observable realizes $T_*$ exactly by its expectation values if and only if its diagonal is $(a,a,b,b)$ with $a\ne b$; its off-diagonal entries are arbitrary subject to Hermiticity. For a finite observable family, the corresponding condition is that every member has diagonal $(a_\ell,a_\ell,b_\ell,b_\ell)$ and the two vectors $(a_\ell)_\ell,(b_\ell)_\ell$ differ. In particular,
   $$
   O_*=|s_1\rangle\!\langle s_1|\otimes I_R,
   \qquad
   N_*=I_S\otimes|1\rangle\!\langle1|_R
   \tag{L.1c.11}
   $$
   separate the four admitted pure source preparations. If arbitrary classical mixtures are included in the source-audit domain, the separating family $\{O_*,N_*,O_*N_*\}$ additionally records their joint probability. The finite quotient (L.1c.9) concerns the four preparation labels; randomization over those labels is retained in $(q_{jr})$. Among the complete direct-subregister family census
   $$
   \mathfrak F=\{\varnothing,\{O_*\},\{N_*\},\{O_*,N_*\}\},
   \tag{L.1c.12}
   $$
   the sufficient members are exactly $\{O_*\}$ and $\{O_*,N_*\}$, and $\{O_*\}$ is the unique inclusion-minimal sufficient member. Its deletion loses the two response classes; adding $N_*$ preserves the complete control response.

3. **Nondemolition realization and faithfulness.** The map
   $$
   \rho_{jr}\longmapsto
   U_e(\rho_{jr}\otimes P_{0,C})U_e^\dagger
   =\rho_{jr}\otimes|j\rangle\!\langle j|_C
   \tag{L.1c.13}
   $$
   realizes the quotient by a certain recorded value while retaining the source. It is the support-projector encoder of Theorem L.1b, with the output labels chosen as $0,1$. The source-to-context-to-generator-to-response diagram commutes for every $\rho_{jr}$, every policy, every input operator and every outcome in (L.1c.4). It extends by linearity to every classical source law $(q_{jr})$ and by identity to every retained spectator. Two quotient values have different utility under policy $01$ by exactly $\alpha/2$, so the realization is faithful on the context quotient. The full retained source separately distinguishes the two nuisance values within each cell.

4. **A populated selection ledger.** Register a serial extraction architecture in which each copied coordinate uses one duration-$\tau_e$ controlled bit flip. The feasible families for the context problem are the two sufficient members of (L.1c.12). For $\{O_*\}$ use (L.1c.13). For $\{O_*,N_*\}$ additionally copy $R$ into the fresh auxiliary $N$ and reversibly uncompute that copy from the unchanged $R$ before applying $V_\pi$. Both implementations therefore return the same $N=0$ and realize (L.1c.4). Preparation, policy control, interaction, readout copying and the projective record service have fixed positive durations, with total
   $$
   \tau_b=\tau_{\mathrm{prep}}+\tau_p+\tau_i+\tau_{\mathrm{rd}}+\tau_{\mathrm{met}}>0.
   $$
   Every register other than the exactly uncomputed $N$ remains a one-use retained resource. The registered resource in (L.1) is the total serial operation time, so its complete ledger is
   $$
   R_{\mathrm{cost}}(\{O_*\})=\tau_b+\tau_e,
   \qquad
   R_{\mathrm{cost}}(\{O_*,N_*\})=\tau_b+3\tau_e.
   \tag{L.1c.14}
   $$
   Set $\lambda_{\mathrm{rep}}=0$, choose $\lambda_{\mathrm{ctrl}}>0$ with units converting seconds to the chosen objective unit, and use the same $\Gamma_{\mathrm{utility}}$ and source/policy distribution for both implementations. Every utility in their registered problem is the same, and consequently
   $$
   V_{\mathrm{context}}(\{O_*,N_*\})-
   V_{\mathrm{context}}(\{O_*\})
   =2\lambda_{\mathrm{ctrl}}\tau_e>0.
   \tag{L.1c.15}
   $$
   Thus $\{O_*\}$ is the unique Definition L.1 minimizer in this complete direct-subregister comparison class. The representation coefficient is the declared zero coefficient of this time-resource branch; (L.1c.14) is an elapsed-time account. The same physical source, encoder and control response carry its deletion test, addition test and strict comparison.

The source choice $q_{jr}=1/4$, $\alpha=1/4$ and all six durations equal to a specified $\tau_0>0$ populates every displayed field. The identity-policy target-$0$ column is $(1/2,1/2,5/8,5/8)$, the utility averaged uniformly over the four policies is $9/16$, the two complete durations are $6\tau_0$ and $8\tau_0$, and the objective gap is $2\lambda_{\mathrm{ctrl}}\tau_0$. The source, retained-record, control, coin, ancilla, target, auxiliary and readout registers occupy nine qubits. The comparison exhausts (L.1c.12) on its registered serial architecture; alternative extraction architectures have their own comparison predicates.

*Proof.* Each summand of $U_e$ or $V_\pi$ is a unitary on an orthogonal control sector. On a sector selected for a bit flip,
$$
e^{-i\pi(I-X_B)/2}=e^{-i\pi/2}e^{i\pi X_B/2}=(-i)(iX_B)=X_B,
$$
while an unselected sector has zero pulse Hamiltonian. This proves (L.1c.2) and the exact source-retaining write identities. Since $\mathrm{SW}_{TA}^2=I$, exponentiation gives (L.1c.3). All pulse Hamiltonians and unitaries are finite, and all free-energy commutators vanish on the chosen degenerate-register branch.

For fixed $\pi,j,k,m$, prepare $A$ in $|0\rangle$, apply $U_{b,k}$, project the target with $P_m$, and append the displayed orthogonal record. This is one Kraus operation with the factor $1/\sqrt2$, so (L.1c.4) is completely positive. Summing $P_m$ over $m$, using unitarity, and summing the two coin weights gives trace preservation. Consequently every registered endpoint and coarse-graining of the full recorded operation is normalized. The input source enters these operations through $j$ alone, so the formula covers all source nuisance values without deleting a response-active output record.

For any $2$ by $2$ matrix $X$, the swap identities give
$$
\begin{aligned}
\operatorname{tr}_A\!\left[U_{b,k}(X\otimes P_0)U_{b,k}^\dagger\right]
={}&\cos^2(b\theta)X+\sin^2(b\theta)\operatorname{tr}(X)P_0\\
&+i(-1)^k\sin(b\theta)\cos(b\theta)[P_0,X].
\end{aligned}
$$
The coin average cancels the last term. Since $b\in\{0,1\}$ and $\sin^2\theta=\alpha$, this proves (L.1c.5) for every input operator. Equivalently the Kraus family $\sqrt{1-\lambda}I,\sqrt\lambda|0\rangle\!\langle0|,\sqrt\lambda|0\rangle\!\langle1|$ has squared sum $I$ and gives that map. Applying it to the four matrix units yields the Choi matrix, and applying it to $I,\sigma_x,\sigma_y,\sigma_z$ yields the transfer matrix. Taking the $P_0$ expectation at $I_2/2$ proves (L.1c.7). The unitary operators $Z_Y$ and $\mathrm{SW}_{TA}$ both have norm one, which gives the stated norm and Lipschitz bounds in (L.1c.8).

For equal $j$, (L.1c.4), the actuator values and all utilities agree for all policies. For unequal $j$, the policy $01$ has target-$0$ probabilities separated by $\alpha/2>0$. Thus equality of the full response is exactly equality of $j$. Theorem L.1a now makes sufficiency equivalent to refining the two-doubleton partition. Each doubleton has two possible partitions, giving the four exhaustive refinements and their cell counts. This also proves uniqueness of the two-cell minimum.

The only nonzero within-cell difference directions are those in (L.1c.10). A Hermitian observable is orthogonal to both exactly when its first two diagonal entries agree and its last two diagonal entries agree. Its expectations on the two cells differ exactly when $a\ne b$. Applying that statement coordinatewise proves the finite-family criterion; off-diagonal entries do not enter expectations at the four source preparations. The expectations of $(O_*,N_*)$ are $(j,r)$, which separate the four preparations. The empty and $N_*$ families identify $\rho_{00}$ with $\rho_{10}$ and are insufficient; the two families containing $O_*$ retain $j$ and are sufficient. This proves the entire direct-subregister census and both minimal-sufficiency tests.

The two cell supports $|s_0\rangle\otimes\mathcal H_R$ and $|s_1\rangle\otimes\mathcal H_R$ are orthogonal. Equation (L.1c.2) therefore gives (L.1c.13) directly and is precisely the support-controlled construction of Theorem L.1b. The subsequent policy pulse supplies $b=\pi(j)$ and hence (L.1c.3)--(L.1c.4), proving the full commuting response diagram. Convex linearity proves it for arbitrary classical source laws, including laws with zero atoms. Identity extension proves the spectator statement. The two distinct identity-policy probabilities prove faithfulness on the quotient, whereas direct source readout continues to separate the retained $r$ values.

Finally the nuisance controlled flip applied twice is the identity and restores $N=0$ without altering $R$. It contributes exactly two extra positive-duration services. The preparation and all other services are common, so (L.1c.14) exhausts both serial accounts. With the declared zero representation coefficient and identical utilities, subtraction gives (L.1c.15). The finite nonempty feasible census then has exactly the stated minimizer. Substitution of the displayed nonvacuous parameters gives the four probabilities, $9/16$ utility and the two durations. ∎

## **L.2 Electromagnetic Field Generation and Stress-Energy Contribution**

### **Theorem L.2 (Electromagnetic Field on a Registered Coherent-Dipole Branch)**

Assume that the context-to-control map is realized by a conserved classical current $J^\mu$ supported in a source of diameter $a$, that its electric dipole moment has a nonzero harmonic component at angular frequency $\omega$, that $a\ll c/\omega$, and that the observation point lies in the radiation zone. Assume Maxwell's equations for this current. At leading electric-dipole order, the retarded radiation field is nonzero whenever the transverse component of the dipole acceleration is nonzero. Its electromagnetic stress-energy tensor is

$$ T_{\mu\nu}^{(\text{EM})} = \frac{1}{\mu_0}\left(F_{\mu\alpha}F_{\nu}{}^{\alpha} - \frac{1}{4}g_{\mu\nu}F_{\alpha\beta}F^{\alpha\beta}\right), \tag{L.4} $$

where $F_{\mu\nu}=\partial_\mu A_\nu-\partial_\nu A_\mu$. Theorem L.1 supplies only an optimizer in a registered mapping class; the conserved-current, multipole, size, and radiation-zone conditions are independent carrier hypotheses. Under the stress-energy decomposition of Appendix B, Definition B.8, this field contribution is one component of $T_{\mu\nu}^{(\text{MPU})}$.

Note on Stress-Energy Decomposition: The total MPU stress-energy tensor admits multiple useful decompositions. By field type (Theorem L.6): $T_{\mu\nu}^{(\text{MPU})} = T_{\mu\nu}^{(\text{matter})} + T_{\mu\nu}^{(\text{EM})}$. By CC contribution (Appendix S): $T_{\mu\nu}^{(\text{matter})} = T_{\mu\nu}^{(\text{baseline})} + \Delta T_{\mu\nu}^{(\text{CC})}$. Combined: $T_{\mu\nu}^{(\text{MPU})} = T_{\mu\nu}^{(\text{baseline})} + \Delta T_{\mu\nu}^{(\text{CC})} + T_{\mu\nu}^{(\text{EM})}$, where $T_{\mu\nu}^{(\text{baseline})}$ is the matter stress-energy at minimum operational state ($C_{\text{agg}} = C_{op}$), $\Delta T_{\mu\nu}^{(\text{CC})}$ is the additional stress-energy from maintaining high-CC context ($C_{\text{agg}} > C_{op}$), and $T_{\mu\nu}^{(\text{EM})}$ is the electromagnetic field contribution.

Proof.

The PCE-optimized mapping determines control parameters:

$$ \mathcal{M}(\text{context}_S) \to \{\omega_{\text{rad}}(t), E_0(t), \phi_{\text{rad}}(t), \vec{\epsilon}_{\text{rad}}(t)\} \tag{L.5} $$

Coherence Mechanism: Within aggregate $S$ (Definition 29), constituent MPUs acquire outcome information through registered network couplings, using the verification-and-update capability $b_v$ of Definition 5. On branches satisfying the strict-improvement antecedent of Theorem 34, high-CC aggregates develop the capability to bias local 'Evolve' outcomes through POP/PCE optimization. For electromagnetic field generation, this requires coordinating $N_{\text{osc}}$ oscillating charge distributions to achieve phase coherence.

Assume $N_{\mathrm{osc}}\ge1$ equal dipoles with peak amplitude $d_{\mathrm{dip}}>0$, common unit polarization $\vec\epsilon$, frequency $\omega$, and propagation phases included in $\phi_j$. Their complex amplitude is
$$
\vec D_{\mathrm{total}}
=d_{\mathrm{dip}}\vec\epsilon\sum_{j=1}^{N_{\mathrm{osc}}}e^{i\phi_j}.
\tag{L.6}
$$
On the electrically small carrier branch, register a positive phase-independent transfer factor $A$ such that $E_0=A|\sum_j e^{i\phi_j}|$. Let $b>0$ be a constant linearized predictive-benefit coefficient on this phase family, for example the registered reference value of $\Gamma_0\partial PP/\partial E_0$, and let $R_{\mathrm{osc}}$ be phase-independent. The objective is
$$
\mathcal F[\{\phi_j\}]
=bE_0(\{\phi_j\})-\lambda R_{\mathrm{osc}}(N_{\mathrm{osc}}).
\tag{L.7}
$$
For independent uniform phases the cross terms have zero expectation, giving $\mathbb E|\sum_j e^{i\phi_j}|^2=N_{\mathrm{osc}}$. For deterministic phases,
$$
\left|\sum_j e^{i\phi_j}\right|\le N_{\mathrm{osc}},
$$
with equality precisely when all unit complex summands have the same phase. Since $bA>0$, maximizing this objective is equivalent to maximizing that modulus, so every maximizer satisfies
$$
\phi_j=\phi_{\mathrm{rad}}\pmod{2\pi}\quad\text{for all }j.
\tag{L.8}
$$
If the coefficient in (L.7) is allowed to vary with $E_0$, its positivity alone is insufficient: the product of that coefficient with $E_0$ must itself be increasing on the admitted range.
At leading electric-dipole order, the standard time-averaged radiated power is
$$ P_{\text{rad}} = \frac{N_{\text{osc}}^2 d_{\text{dip}}^2 \omega^4}{12\pi\epsilon_{\text{vac}} c^3}. \tag{L.9} $$
If any stated hypothesis fails, (L.7) does not by itself establish phase alignment or the $N_{\text{osc}}^2$ law.

Stress-Energy Derivation: The electromagnetic field energy density is:

$$ u_{\text{EM}}(x,t) = \frac{\epsilon_{\mathrm{vac}}}{2}|\vec{E}_{\text{rad}}(x,t)|^2 + \frac{1}{2\mu_0}|\vec{B}_{\text{rad}}(x,t)|^2 \tag{L.10} $$

Use $x^0=ct$ and $d^4x=dx^0d^3x$. In SI units the Maxwell action is
$$ S_{\text{EM}}[A] = -\frac{1}{4\mu_0c} \int d^4x \, \sqrt{-g} \, F_{\mu\nu}F^{\mu\nu}. \tag{L.11} $$
For this coordinate convention define
$$ T_{\mu\nu}^{(\text{EM})} = -\frac{2c}{\sqrt{-g}}\frac{\delta S_{\text{EM}}}{\delta g^{\mu\nu}}. \tag{L.12} $$
Using
$$
\delta\sqrt{-g}=-\frac{1}{2}\sqrt{-g}\,g_{\mu\nu}\delta g^{\mu\nu},
\qquad
\delta(F_{\alpha\beta}F^{\alpha\beta})
=2F_{\mu\alpha}F_\nu{}^\alpha\delta g^{\mu\nu},
$$
one obtains
$$
\delta S_{\text{EM}}
=-\frac{1}{4\mu_0c}\int d^4x\sqrt{-g}
\left[-\frac{1}{2}g_{\mu\nu}F_{\alpha\beta}F^{\alpha\beta}
+2F_{\mu\alpha}F_\nu{}^\alpha\right]\delta g^{\mu\nu}.
$$
Substitution into (L.12) gives
$$
T_{\mu\nu}^{(\text{EM})}
=\frac{1}{\mu_0}\left(F_{\mu\alpha}F_\nu{}^\alpha
-\frac{1}{4}g_{\mu\nu}F_{\alpha\beta}F^{\alpha\beta}\right),
$$
which is Equation (L.4). ∎

### **Corollary L.2.1 (Off-Resonant Two-Level AC Stark Interaction)**

Let $\vec E_{\text{rad}}(t)=\operatorname{Re}(E_0(t)\vec\epsilon_{\text{rad}}e^{-i\omega_{\text{rad}}t})$, where the envelope varies slowly on the scales $|\Delta|^{-1}$ and $\omega_{\text{rad}}^{-1}$. With
$$ H_{\text{int}}(t)=-\vec d_{\text{TLS}}\cdot\vec E_{\text{rad}}(t), \tag{L.13} $$
define $\Omega_R=|\vec d_{\text{TLS}}\cdot\vec\epsilon_{\text{rad}}|E_0/\hbar$ and $\Delta=\omega_{\text{TLS}}-\omega_{\text{rad}}$. Under the rotating-wave approximation and $|\Delta|\gg\max(|\Omega_R|,\Gamma)$, the following calculation applies.

*Proof.* The rotating-frame eigenvalue separation is $\sqrt{\Delta^2+|\Omega_R|^2}$. Therefore
$$
\sqrt{\Delta^2+|\Omega_R|^2}-|\Delta|
=\frac{|\Omega_R|^2}{2|\Delta|}+O\!\left(\frac{|\Omega_R|^4}{|\Delta|^3}\right).
$$
Tracking the sign of $\Delta$, the transition angular-frequency shift is
$$ \delta_{\text{Stark}}(t)=\frac{|\Omega_R(t)|^2}{2\Delta(t)}+O\!\left(\frac{|\Omega_R(t)|^4}{|\Delta(t)|^3}\right), \qquad \Omega_R(t)=\frac{|\vec d_{\text{TLS}}\cdot\vec\epsilon_{\text{rad}}|E_0(t)}{\hbar}. \tag{L.14} $$
Each individual dressed level has leading shift magnitude $|\Omega_R|^2/(4|\Delta|)$. A change in a Lindblad rate follows only when the specified bath spectral density or jump operators depend on the shifted level spacing; Definition 30 supplies a bound on an already established probability bias, not a derivation of that bias. ∎

### **Proposition L.1 (Conditional Far-Detuned Spectral Selectivity)**

Consider two target transitions driven by the same field on the rotating-wave branch of Corollary L.2.1. Assume their dipole projections and linewidths are registered and each satisfies $|\Delta_a|\gg\max(|\Omega_{R,a}|,\Gamma_a)$. Then
$$ |\delta_{\text{Stark},a}|=\frac{|\Omega_{R,a}|^2}{2|\Delta_a|}+O\!\left(\frac{|\Omega_{R,a}|^4}{|\Delta_a|^3}\right). \tag{L.15} $$
For equal nonzero Rabi amplitudes at leading order, the transition having smaller $|\Delta_a|$ has the larger shift as long as both detunings remain in the stated domain.

*Proof.* Corollary L.2.1 gives the displayed expansion. With equal leading numerators, $x\mapsto1/x$ is strictly decreasing for $x>0$, so $0<|\Delta_1|<|\Delta_2|$ implies $1/|\Delta_1|>1/|\Delta_2|$. Polarization selectivity enters through $|\Omega_{R,a}|^2=|\vec d_a\cdot\vec\epsilon|^2E_0^2/\hbar^2$. The proof gives no conclusion at $\Delta=0$ or when the far-detuned inequalities fail. ∎
## **L.3 Gravitational Time Dilation from Aggregate Energy**

### **Theorem L.3 (Exterior Weak-Field Time Dilation on a Quasistatic Retained-Energy Branch)**

Assume a weak, quasistatic, spherically symmetric source of radius $R_S$, with negligible retardation over the measurement interval. Assume its active Poisson density can be modeled by an isotropic component with $p=w u$, so that $\rho_{\mathrm{act}}=(u+3p)/c^2=(1+3w)u/c^2$. Let
$$ E_{\text{grav}}^{\text{inst}}:=\int_{r\le R_S}u(\mathbf x)\,d^3x $$
be the energy localized in the source at the measurement time. For a radially oriented target of extent $L_q\ll r$ at $r>R_S$,
$$ \Delta\tau_d=\frac{\Delta\Phi}{c^2}\tau_c, \tag{L.16} $$
where
$$ \Delta\Phi=G(1+3w)\frac{E_{\text{grav}}^{\text{inst}}}{c^2r^2}L_q+O\!\left(\frac{L_q^2}{r^2}\frac{GE_{\text{grav}}^{\text{inst}}}{c^2r}\right). \tag{L.17} $$

*Proof.* Under the stated active-density model,
$$ M_{\text{eff}}=\int\rho_{\text{act}}\,dV=\frac{1+3w}{c^2}E_{\text{grav}}^{\text{inst}}. \tag{L.18} $$
Spherical symmetry gives the exterior acceleration
$$ g(r)=\frac{GM_{\text{eff}}}{r^2}. \tag{L.19} $$
Taylor's theorem applied to the exterior potential over a radial interval $L_q\ll r$ gives
$$ \Delta\Phi=g(r)L_q+O(L_q^2\sup|\Phi''|). $$
If a fraction $\eta_{\text{ret}}\in[0,1]$ of energy supplied during $\tau_c$ remains localized, then $E_{\text{grav}}^{\text{inst}}=\eta_{\text{ret}}P_{\text{agg}}\tau_c$, and hence
$$ \Delta\Phi=\frac{G\eta_{\text{ret}}P_{\text{agg}}\tau_c(1+3w)}{c^2r^2}L_q+O(L_q^2\sup|\Phi''|). \tag{L.20} $$
Energy that has crossed the source boundary is excluded from $E_{\text{grav}}^{\text{inst}}$. This proves (L.17) and the retained-power specialization.

In the weak-field limit, $g_{00}=-(1+2\Phi/c^2)$ and therefore
$$ \frac{d\tau}{dt}=\sqrt{-g_{00}}=\left(1+\frac{2\Phi}{c^2}\right)^{1/2}=1+\frac{\Phi}{c^2}+O\!\left(\frac{\Phi^2}{c^4}\right). \tag{L.21} $$
For $|\Phi|\ll c^2$, the differential proper-time accumulation across the target over coordinate interval $\tau_c$ is
$$ \Delta\tau_d=\frac{\Delta\Phi}{c^2}\tau_c+O\!\left(\tau_c\frac{\Phi\Delta\Phi}{c^4},\tau_c\frac{(\Delta\Phi)^2}{c^4}\right). $$
At first order this is Equation (L.16). ∎

For a complete static isolated source, including its confinement stresses, Theorem S.1b gives the exterior active mass $E_{\mathrm{grav}}^{\mathrm{inst}}/c^2$, so (L.17) then holds with $w=0$; a nonzero $w$ describes an isotropic sector whose confinement stresses are not included in the modeled source.

### **Corollary L.3.1 (Gravitational Phase Difference)**

For the phase convention $\phi=-\omega_{\text{TLS}}\tau$, the oriented phase difference is
$$ \Delta\phi_{\text{grav}}=-\omega_{\text{TLS}}\Delta\tau_d=-\frac{\omega_{\text{TLS}}}{c^2}\Delta\Phi\,\tau_c+\text{higher-order weak-field terms}. \tag{L.22} $$
Consequently
$$|\Delta\phi_{\text{grav}}|=\frac{\omega_{\text{TLS}}}{c^2}|\Delta\Phi|\tau_c+\text{higher-order weak-field terms}.$$

*Proof.* Subtracting $\phi_1=-\omega_{\text{TLS}}\tau_1$ and $\phi_2=-\omega_{\text{TLS}}\tau_2$ gives $\phi_1-\phi_2=-\omega_{\text{TLS}}(\tau_1-\tau_2)$. Substitute Equation (L.16) and take an absolute value for the magnitude statement. ∎

## **L.4 Quantitative Comparison: Parametric Analysis**

### **Proposition L.4 (Parametric Scaling Analysis for High-Complexity Aggregates)**

For a macroscopic MPU aggregate (Definition 29) with aggregate Predictive Physical Complexity $C_{\text{agg}} = C_P(\mu_{\text{agg}})$ satisfying $C_{\text{agg}} \ge C_{op}$ (Definition 13, Corollary 3) where $C_{op}$ is the task-indexed Operational Threshold and where the additional relation $C_{op}\ge K_0$ is invoked only under all realization and complexity-capacity hypotheses of Corollary 3 but is not used in the scaling identities below, the electromagnetic and gravitational effect magnitudes scale with aggregate and target parameters as follows.

### **General Scaling Laws:**

*Proof.* Corollary L.2.1 and Theorem L.3 give the following two leading responses.

(a) Electromagnetic transition shift on the two-level, rotating-wave, far-detuned branch:
$$ \left|\frac{\delta_{\text{Stark}}}{\omega_{\text{TLS}}}\right| = \frac{d_{\text{TLS}}^2 E_0^2}{2\hbar^2\omega_{\text{TLS}}|\Delta|}+O\!\left(\frac{|\Omega_R|^4}{\omega_{\text{TLS}}|\Delta|^3}\right). \tag{L.23} $$
For a specified radiation pattern and polarization, $E_0^2$ scales as $P_{\text{rad}}/r^2$ in the radiation zone.

(b) Gravitational phase shift on the exterior retained-energy branch of Theorem L.3:
$$ \left|\frac{\Delta\phi_{\text{grav}}}{2\pi}\right| = \frac{\omega_{\text{TLS}}G\eta_{\text{ret}}P_{\text{agg}}\tau_c^2|1+3w|L_q}{2\pi c^4r^2}+O\!\left(\frac{L_q^2}{r^2}\right). \tag{L.24} $$

### **Dominance Ratio:**

At leading order, when every denominator is nonzero,
$$ \mathcal R:=\frac{|\delta_{\text{Stark}}|/\omega_{\text{TLS}}}{|\Delta\phi_{\text{grav}}|/(2\pi)}=\frac{\pi d_{\text{TLS}}^2c^4r^2E_0^2}{\hbar^2\omega_{\text{TLS}}^2|\Delta|G\eta_{\text{ret}}P_{\text{agg}}\tau_c^2|1+3w|L_q}. \tag{L.25} $$
This expression does not determine a number until the carrier, target, geometry, and retention inputs are supplied. ∎

### **Representative Case (Engineered Coherent-Charge Implementation).**

The stated data do not define a valid numerical implementation. A quantitative comparison requires a measured differential dynamic polarizability or an allowed-transition model, a positive drive frequency, $|\Delta|\gg\max(\Omega_R,\Gamma)$, a retention-time/field-energy solution, and a common uncertainty ledger for electromagnetic and gravitational responses. Therefore no numerical dominance ratio is reported here.

### **Proposition L.5 (Indeterminacy of the Dominance Ratio from the Stated Data)**

The assumptions and scaling relations in §L.4 do not determine a numerical value or a positive lower bound for
$$ \mathcal{R} \equiv \frac{\delta_{\text{EM}}}{\delta_{\text{grav}}}. \tag{L.35} $$

*Proof.* Equations (L.23)–(L.25) leave unspecified the dipole matrix element, field amplitude or source-to-field transfer, detuning, transition frequency, retained-energy fraction, equation-of-state factor, target geometry, and common uncertainty model. For admissible positive values of the remaining parameters, the electromagnetic response tends to zero as $E_0\to0$, while the gravitational response can remain nonzero when retained source energy is nonzero. Conversely, increasing a permitted electromagnetic source amplitude can increase the electromagnetic response within its perturbative domain. Hence the scaling laws alone imply neither $\mathcal R>1$ nor any finite numerical interval. ∎

## **L.4.1 Biological Implementation Hypothesis: Sub-Radiant Coherence Optimization**

*This section presents a biological implementation hypothesis distinct from the engineered coherent-charge mechanism (Sections L.4, L.11.4). Its conditional propositions model how biological constraints can select alternative realizations satisfying Theorem L.9's universal requirements.*

### **L.4.1.1 The Biological Constraint Optimization Problem**

<a id="definition-l41-biological-constraint-set-mathcalb"></a>**Definition L.4.1 (Biological Constraint Set $\mathcal{B}$)**
The biological constraint set for neural systems comprises:
- Thermal environment: $T = 310$ K, yielding $k_B T = 4.28 \times 10^{-21}$ J (27 meV)
- Metabolic power budget: $P_{\text{available}} \le \epsilon_{CC} P_{\text{brain}}$ where $\epsilon_{CC} \lesssim 0.01$ and $P_{\text{brain}} \approx 20$ W, giving $P_{CC} \lesssim 0.2$ W
- Aqueous dielectric environment: $\epsilon_r \approx 80$, Debye screening length $\lambda_D \approx 1$ nm
- Carbon-based chemistry: Covalent bond energies $\sim 1$–5 eV, hydrogen bonds $\sim 0.1$–0.3 eV
- Distributed architecture: No centralized control, $N \sim 10^{11}$ neurons with $\sim 10^{15}$ synapses

<a id="proposition-l42-conditional-sub-radiant-optimization"></a>**Proposition L.4.2 (Conditional Sub-Radiant Optimization)**
Let $d_j\ge0$, $\alpha_2>0$, and
$$\mathcal{F}_{\text{bio}}[\{\phi_j\}] = \alpha_1 C_{\text{internal}}(\{\phi_j\}) - \alpha_2 P_{\text{rad}}(\{\phi_j\}) - \alpha_3 P_{\text{metabolic}}(\{\phi_j\}),$$
where
$$P_{\text{rad}} = \frac{\omega^4}{12\pi\epsilon_{\mathrm{vac}} c^3}\left|\sum_{j=1}^N d_j e^{i\phi_j}\right|^2.$$
If $C_{\text{internal}}$ and $P_{\text{metabolic}}$ are phase-independent and the polygon condition
$$\max_j d_j\le\sum_{k\ne j}d_k$$
holds, then every phase choice satisfying $\sum_jd_je^{i\phi_j}=0$ maximizes $\mathcal F_{\text{bio}}$.

*Proof.* The polygon condition is necessary and sufficient for vectors of lengths $d_j$ to form a closed polygon, so it is equivalent to the existence of phases with zero vector sum. Because $P_{\text{rad}}\ge0$, such phases attain its global minimum. Under the phase-independence hypotheses, the other two terms are constant on the phase torus, and minimizing $P_{\text{rad}}$ maximizes $\mathcal F_{\text{bio}}$. If either phase-independence or the polygon condition fails, no sub-radiant conclusion follows from this functional. A separate compatibility calculation is required if nearest-neighbor alignment is imposed. ∎

<a id="proposition-l42a-coherence-resource-objectives-do-not-identify-a-control-response"></a>**Proposition L.4.2a (Coherence–Resource Objectives Do Not Identify a Control Response).** Let a registered carrier comparison assign to each carrier only a coherence datum $\tau$ and a resource datum $R$, and suppose both admissibility and the objective factor through $(\tau,R)$. If the admissible response-map class contains all three maps
$$
\mathcal M_0(c)=0
\qquad\text{and}\qquad
\mathcal M_{\pm}(c)=\pm\epsilon f(c)
\tag{L.4.2a.1}
$$
for one bounded nonconstant $f$ and one $\epsilon>0$, while holding $(\tau,R)$ fixed, then the objective cannot identify the context-to-control response, its sign, or its nonzero magnitude.

*Proof.* The three extensions have identical $(\tau,R)$ and therefore identical admissibility and objective values by hypothesis. They are response-inequivalent because $\mathcal M_0$ vanishes while $\mathcal M_+$ does not, and $\mathcal M_+$ and $\mathcal M_-$ have opposite signs. ∎

Consequently a microtubule, radical-pair, membrane, or other carrier census based only on coherence and resource cost cannot discharge its response-map component. A response-faithful source and target operator must enter the comparison objective or its certificate as independently typed data.

<a id="proposition-l42b-sub-radiant-dipole-arrays-carry-no-dipole-order-target-response"></a>**Proposition L.4.2b (Sub-Radiant Dipole Arrays Carry No Dipole-Order Target Response).** Let $N\ge2$ point dipoles with common unit polarization $\boldsymbol\epsilon$, amplitudes $d_j\ge0$ and phases $\phi_j$ oscillate at angular frequency $\omega>0$ at positions $|\mathbf x_j|\le a$, so that $\mathbf J_\omega=-i\omega\sum_jd_je^{i\phi_j}\boldsymbol\epsilon\,\delta(\mathbf x-\mathbf x_j)$, and put $S:=\sum_jd_je^{i\phi_j}$ and $k=\omega/c$.

(a) The exact outgoing amplitude of Theorem L.8.2c is
$$
\mathcal A_\omega(\mathbf n)=\frac{\mu_0\omega^2}{4\pi}P_{\mathbf n}\boldsymbol\epsilon\sum_jd_je^{i\phi_j}e^{-ik\mathbf n\cdot\mathbf x_j},
\qquad
\left|\mathcal A_\omega(\mathbf n)-\frac{\mu_0\omega^2S}{4\pi}P_{\mathbf n}\boldsymbol\epsilon\right|
\le\frac{\mu_0\omega^2}{4\pi}\,ka\sum_jd_j.
\tag{L.4.2b.1}
$$

(b) At dipole order the array is the point dipole $S\boldsymbol\epsilon$, whose radiated power is the $P_{\mathrm{rad}}$ of Proposition L.4.2. In every direction its angular power density is at most $3P_{\mathrm{rad}}/(8\pi)$, so a far-zone target at distance $r$ receives peak field $E_0^2\le3P_{\mathrm{rad}}/(4\pi\epsilon_{\mathrm{vac}}cr^2)$ and, on the branch of Corollary L.2.1, the leading AC-Stark shift (L.23) obeys
$$
|\delta_{\mathrm{Stark}}|\le\frac{3d_{\mathrm{TLS}}^2P_{\mathrm{rad}}}{8\pi\epsilon_{\mathrm{vac}}c\hbar^2|\Delta|r^2}.
\tag{L.4.2b.2}
$$
Every sub-radiant configuration $S=0$, in particular every maximizer of Proposition L.4.2 under its polygon condition, has identically zero dipole-order field and zero dipole-order target response at every point.

(c) For $S=0$ the exact far-zone amplitude obeys $|\mathcal A_\omega(\mathbf n)|\le(\mu_0\omega^2/4\pi)\,ka\sum_jd_j$, and the exact radiated power obeys
$$
P_{\mathrm{EM}}\le\frac{(ka)^2\omega^4(\sum_jd_j)^2}{8\pi\epsilon_{\mathrm{vac}}c^3}
=\frac32(ka)^2P_{\mathrm{coh}},
\qquad
P_{\mathrm{coh}}:=\frac{\omega^4(\sum_jd_j)^2}{12\pi\epsilon_{\mathrm{vac}}c^3},
\tag{L.4.2b.3}
$$
where $P_{\mathrm{coh}}$ is the dipole-order power of the in-phase configuration.

*Proof.* (a) Substitution of the point current into the amplitude of Theorem L.8.2c gives the first formula. The bounds $|e^{-is}-1|\le|s|$, $|\mathbf n\cdot\mathbf x_j|\le a$ and $\|P_{\mathbf n}\boldsymbol\epsilon\|\le1$ give the estimate.

(b) Replacing each phase factor $e^{-ik\mathbf n\cdot\mathbf x_j}$ by $1$ gives the point dipole $S\boldsymbol\epsilon$ and $P_{\mathrm{rad}}=\omega^4|S|^2/(12\pi\epsilon_{\mathrm{vac}}c^3)$. Its angular power density is $\epsilon_{\mathrm{vac}}c|\mathcal A_{\mathrm{dip}}(\mathbf n)|^2/2=3P_{\mathrm{rad}}\|P_{\mathbf n}\boldsymbol\epsilon\|^2/(8\pi)\le3P_{\mathrm{rad}}/(8\pi)$, using $\mu_0^2\epsilon_{\mathrm{vac}}^2c^4=1$. The far-zone intensity is this density divided by $r^2$ and equals $\epsilon_{\mathrm{vac}}cE_0^2/2$. Substitution into (L.23) with $|\Omega_R|\le d_{\mathrm{TLS}}E_0/\hbar$ gives (L.4.2b.2). For $S=0$ the dipole moment vanishes, so its complete retarded field vanishes at every point.

(c) With $S=0$, (L.4.2b.1) bounds $|\mathcal A_\omega|$ pointwise. Theorem L.8.2c gives $P_{\mathrm{EM}}=\epsilon_{\mathrm{vac}}c\|\mathcal A_\omega\|_2^2/2\le\epsilon_{\mathrm{vac}}c\cdot4\pi\sup_{\mathbf n}|\mathcal A_\omega(\mathbf n)|^2/2$, which gives (L.4.2b.3). ∎

<a id="theorem-l42c-complete-normal-instrument-carrier-classification-and-matched-biological-responses"></a>**Theorem L.4.2c (Complete Normal-Instrument Carrier Classification and Matched Biological Responses).** On the declared source-faithful normal physical preparation/channel/readout class, retained response effects and the annihilator of actual reachable resource-matched state differences give a complete response classification, including owned memory, adaptive controls, infinite auxiliaries and dark reaction sectors. The following exact Maxwell, screened membrane and spin-chemical/material-transport constructions populate near-field, beyond-dipole and operational non-electromagnetic biological source/target response maps. Constitutive laws, control and preparation reachability, resource owners and response errors are supplied explicitly.

Here “non-electromagnetic carrier” denotes physical chemical/matter transport between source and receiver. The source field remains a local control. The construction assumes no new fundamental interaction and makes no empirical specimen identification. The following are declared formal biological mechanism models.

*Proof and complete source constructions.*

### Uniform physical instrument and matched-response classification

## 1. Typed source, memory and target

A source record consists of a finite Hilbert space $S$, a reachable state set $R$ contained in $D(S)$, a specified preparation map or preparation protocol establishing $R$, and Hermitian source/resource observables $C_1,\dots,C_s$. An instrument record contains:

- a finite ordered set of intervention times;
- an initial owned memory state $\sigma_{M}$, or a specified physical CPTP preparation map carrying source-memory correlations;
- CP trace-nonincreasing maps for each observed transition, whose sums are trace preserving;
- any adaptive choice rule, including its classical record;
- a final finite-outcome POVM or output instrument;
- assigned Hamiltonians, external work/clock controls, bath and record ownership.

Preparation, memory and control resources are part of the record even when the output effect does not retain them. Two devices with the same response effect can have different physical costs.

### Theorem I1: complete effect representation

For every such record and each complete outcome x, there is a unique Hermitian effect $E_{x}$ on S such that

$$
\begin{aligned}
&p_x(\rho)=\operatorname{tr}(E_x \rho)\quad \text{for every } \rho \in D(S),\\
&E_x\ge 0,\quad \sum_x E_x=I.
\end{aligned}
\tag{I1}
$$

Every bounded scalar output $f(x)$ is represented by $A_f=\sum_xf(x)E_x$. Two records are response-equivalent on $R$ exactly when their effects differ by an element of

$\operatorname{span}_{\mathbb{R}}(R)^{\perp}$

for every outcome. If normalized state differences rather than absolute outcomes are compared, the relevant annihilator is the span of those differences.

**Proof.** First retain classical registers holding the adaptive histories. Conditional operations become block-controlled CP maps or their normal-instrument composition when histories are continuous. Keep the quantum memory instead of replacing its reduced dynamics by a Markov approximation. Composition gives a CP instrument $K_{x}$ on the physical source-plus-memory space. Its initial-state map is the declared physical CPTP preparation $\iota$; a product memory uses $\iota(\rho)=\rho\otimes\sigma_{M}$. Define $E_x=\iota^*K_x^*(I)$, incorporating the final POVM into $K_{x}$ if needed. Complete positivity gives $E_{x}\ge 0$; trace preservation of the summed instrument gives $\sum E_x=I$. The trace-adjoint identity gives (I1). Density matrices span the Hermitian matrices, proving uniqueness. The equivalence criterion follows by subtraction and the nondegenerate trace pairing. QED.

This proof applies to every finite quantum comb with its memory retained. It does not require fresh independent baths at each step. Context-dependent choices of the apparatus must be represented as explicit controlled records: for a finite program alphabet $u$, use a direct-sum carrier and effects $\bigoplus E_{x,u}$. A continuous control parameter instead gives a typed family $E_{x,u}$ with its own reachability relation; it cannot be hidden inside a supposedly fixed $E_{x}$.

### Corollary I1a: arbitrary owned auxiliaries and normal instruments

The conclusion holds when the physical source, bath, memory or target Hilbert space is infinite dimensional, provided the retained preparation space S is finite and the supplied preparation/instrument maps are normal CP maps with a normalized total instrument. No finite-memory approximation is required. In the Schrodinger picture $\iota$ maps trace-class operators on S to the physical trace-class space; the dual normal maps pull bounded target effects back to bounded effects on S. The proof of I1 is unchanged.

A continuous outcome space gives a POVM $E(A)=\iota^*K(A)^*(I)$, countably additive in the weak operator topology. Bounded scalar scores give $A_f=\int f\,dE$. Every finite retained output partition is therefore covered, as is its complete normal outcome measure. An unbounded physical cost is also a finite Hermitian pullback when its absolute expectation is finite on $\iota(I/d)$: positivity bounds every density $\rho$ by $d(I/d)$, so the expectation is finite and uniformly bounded on every input density. Polarization then defines the unique Hermitian cost matrix. This condition is checked on the actual implementation; the bounded output effect alone says nothing about its cost.

Source-memory correlations may be included through a specified linear CPTP preparation $\iota$. An arbitrary assignment of a different environment state to each input density is not automatically CP or even affine and is not licensed by this corollary. A finite response-equivalent dilation of the pulled-back POVM also does not preserve the original environment's work, heat or information cost by itself. Those entries continue to refer to the original owned implementation.

The quantifiers here range over every finite d, every finite number of intervention slots, and every admitted normal physical auxiliary realization. There is no fixed dimension or bounded decoder enumeration. Continuous control families remain typed families; comparing any two actual settings requires their actual control resources and does not presume a finite universal programmable apparatus.

### General normal-source extension

For a genuinely infinite-dimensional retained source algebra $A$, a supplied normal physical instrument still defines effects $E_{x}$ in $A$ with $p_x(\omega)=\omega(E_x)$ for normal source states $\omega$. Positivity, normalization, and countable additivity follow as above. Let $L$ be the norm-closed real linear span in the predual $A_*$ of the reachable matched normal-state differences. The exact criterion remains $E_{x}$ in $L^{\perp}$. Its proof is the same evaluation identity and continuity. Finite affine-fiber formula (I4), finite SDP attainment, and finite-matrix reaction spectral calculations are the specifically finite-dimensional conclusions; they are not asserted for an arbitrary infinite source. Thus infinite physical auxiliaries and infinite retained sources are not excluded from response representation, while the computational and realization claims retain their exact domains.

## 2. Exact matched-resource quotient

For the admitted reachable set R, define the linear matching records

$$
c(\rho)=(\operatorname{tr}(C_1 \rho),\ldots,\operatorname{tr}(C_s \rho)).
$$

Let

$$
L_{R,C} = \operatorname{span}_{\mathbb{R}} \{\rho-\sigma : \rho,\sigma \in R,\ c(\rho)=c(\sigma)\}.
\tag{I2}
$$

### Theorem I2: complete response-identification criterion

An outcome effect E has the same response for every admitted matched pair if and only if

$$
E \in L_{R,C}^{\perp}.
\tag{I3}
$$

If it fails, at least one admitted matched pair has unequal response. Thus the quotient $\operatorname{Herm}(S)/L_{R,C}^{\perp}$ is the complete linear response datum invisible to the specified resource matching.

**Proof.** Equality on every matched pair means $\operatorname{tr}[E(\rho-\sigma)]=0$ for all generators of (I2), equivalently on their real linear span. Failure on the span implies failure on at least one generating difference, since otherwise linearity would give zero on the span. QED.

The explicit appearance of $R$ is indispensable. An effect outside $\operatorname{span}\{I,C_i\}$ can still be constant on an unreachable or singleton preparation family. Formula (I3) is a classification of the actual admitted reachable relation, not a claim that arbitrary density operators can be prepared.

### Corollary I2a: exact affine-fiber calculation, including boundary fibers

Fix r and let

$$
F_r=\{\rho\ge 0:\operatorname{tr}\rho=1,\ \operatorname{tr}(C_i\rho)=r_i\text{ for every }i\}
$$

be nonempty. Let P be the projection onto the span of the ranges of all $\rho$ in $F_{r}$. Then E is constant on this entire fiber if and only if

$$
P E P \in \operatorname{span}_{\mathbb{R}}\{P, P C_1 P,\ldots,P C_s P\}.
\tag{I4}
$$

**Proof.** A finite convex combination of members of $F_{r}$ has range $P$: choose finitely many whose ranges span $P$ and average them with positive weights. Call this state $\bar{\rho}$. It is strictly positive on $P$. Every Hermitian $X=PXP$ with $\operatorname{tr}X=0$ and $\operatorname{tr}(C_iX)=0$ can therefore be added to or subtracted from $\bar{\rho}$ with sufficiently small coefficient while preserving positivity and all constraints. Consequently the difference span of $F_{r}$ is exactly the kernel of these linear functionals within $\operatorname{Herm}(P)$. Its orthogonal complement is the span of their representing matrices, which gives (I4). QED.

If a physical preparation channel $P_{\mathrm{src}}$ maps an arbitrary admitted preparation density matrix $\sigma$ to the source state, apply the same theorem to the pulled-back effect $P_{\mathrm{src}}^*(E)$ and resources $P_{\mathrm{src}}^*(C_i)$ on the preparation space. This gives a finite matrix test for the entire reachable image of that channel. Restricting its input states or controls requires the corresponding smaller reachable set.

### Quantitative response range

For a full affine fiber $F_{r}$ the maximum and minimum of $\operatorname{tr}(E\rho)$ are attained, since $F_{r}$ is compact. They are the two finite semidefinite programs

$$
\max/\min\ \operatorname{tr}(E\rho),\quad\text{subject to}\quad\rho\ge 0,\quad\operatorname{tr}\rho=1,\quad\operatorname{tr}(C_i\rho)=r_i.
$$

On the forced support P, $\bar{\rho}$ above is a strictly feasible relative point, so the usual finite-dimensional separating-hyperplane proof gives the dual certificates

upper: $y_0+\sum_iy_ir_i$ with $y_0P+\sum_iy_iPC_iP\ge PEP$,
lower: $y_0+\sum_iy_ir_i$ with $y_0P+\sum_iy_iPC_iP\le PEP$.

One can also certify the result directly: any feasible dual tuple bounds every primal state by the trace pairing, and equality with an exhibited feasible state certifies the optimum. This avoids relying on a numerical status flag. A positive certified max-minus-min interval realizes response inequivalence whenever the optimizer states have the declared preparation realization.

## 3. Finite realization and ownership

An effect tuple satisfying (I1) always admits the isometry

$$
V \psi = \sum_x \sqrt{E_x}\, \psi \otimes |x\rangle.
$$

$V^*V=I$. Extending an orthonormal basis extends $V$ to a unitary on a finite source-plus-ready-record space. Measuring the record gives the exact stated response. Thus effect positivity and normalization completely classify finite *formal* outcome realizability. This construction does not assert that an arbitrary unitary belongs to a specified molecule's control algebra; that question remains in $R$ and the typed physical instrument record.

For a fixed finite unitary $U$, choose its spectral phases in $[-\pi,\pi]$ and define $H=(i\hbar/\tau)\log U$. Then $U=\exp(-iH\tau/\hbar)$ with $\lVert H\rVert\le\pi\hbar/\tau$. This gives a bounded scheduled Hamiltonian realization and its units/duration. It is not automatically an allowed biological Hamiltonian, nor an autonomous restored clock. A physical comparison uses its already declared source/control algebra and cost ledger. The low-field radical-pair construction supplies a distinct physical spin/chemical realization with those operators populated; it does not invoke an arbitrary logarithm as its molecular control.

Pure ready records are explicit one-use resources. Approximate finite-temperature reset can use the fixed-time finite Gibbs controlled-SWAP bath dilation given later in this proof. Source work, bath energy/correlations, readout records and controller time remain assigned to disjoint owners. Taking an effect quotient never proves that the discarded implementation resources vanish.

## 4. Reaction effects with dark sectors and no lower reaction floor

Let $R=\mathbb{C}^d$, let $G$ generate any finite trace-decreasing CP semigroup $T_{t}$ on the unrecombined radical carrier, and let $B_{a}\ge 0$ be its finite product-rate operators. Assume

$$
G^*(I)=-K,\quad K=\sum_a B_a\ge 0.
\tag{D1}
$$

Internal Hamiltonian/noise and inter-sector transfers are allowed. No inequality $K\ge\kappa I$ is imposed.

### Theorem D1: complete product and no-reaction effects

The following operator-norm limits exist:

$$
\begin{aligned}
D &= \lim_{t\to\infty} T_t^*(I),\\
E_a &= \lim_{T\to\infty} \int_0^T T_t^*(B_a)\, dt.
\end{aligned}
\tag{D2}
$$

They satisfy

$$
\begin{aligned}
&D\ge 0,\quad E_a\ge 0,\quad D+\sum_a E_a=I,\\
&G^*(D)=0,\quad G^*(E_a)=-B_a.
\end{aligned}
\tag{D3}
$$

For every source state $\rho$, $\operatorname{tr}(D\rho)$ is its probability of never reaching any recorded product, and $\operatorname{tr}(E_a\rho)$ is its eventual product-$a$ probability. The set $\{E_a,D\}$ is a complete POVM, including the residual outcome.

Moreover:

- $D$ is the greatest fixed effect $F$ with $0\le F\le I$ and $G^*(F)=0$.
- $E_{a}$ is the least positive solution $F\ge 0$ of $G^*(F)=-B_a$ in the positive-semidefinite order.
- At finite $T$ the exact omitted product effects sum to $T_T^*(I)-D$. In particular the uniform total omitted probability is $\lVert T_T^*(I)-D\rVert$.

**Proof.** $T_s^*(I)\le I$, so $T_{t+s}^*(I)\le T_t^*(I)$. This is a decreasing positive matrix family, hence converges in operator norm in finite dimension. Differentiating $T_t^*(I)$ and using (D1) gives

$$
\sum_a \int_0^T T_t^*(B_a)\,dt = I-T_T^*(I).
$$

Each integral is positive and increases with $T$, bounded above by $I$. Thus each has an operator-norm limit and their sum is $I-D$. Semigroup continuity gives $T_s^*(D)=D$. For any fixed effect $F\le I$, $F=T_t^*(F)\le T_t^*(I)$, so $F\le D$.

The integral identity for an individual effect gives

$$
E_a-T_s^*(E_a)=\int_0^s T_t^*(B_a)\,dt.
$$

Differentiating at $s=0$ proves $G^*(E_a)=-B_a$. Conversely, if $F\ge 0$ solves that equation, then

$$
F-T_T^*(F)=\int_0^T T_t^*(B_a)\,dt.
$$

Its second term is positive, so $F$ dominates every finite integral and hence $E_{a}$. Finally $E_a-E_a(T)=T_T^*(E_a)$; summing gives $T_T^*(I-D)=T_T^*(I)-D$. A positive effect's largest expectation over density matrices is its operator norm, proving the exact tail assertion. QED.

### Dark effects need not be projections

Take a classical two-state unrecombined carrier with states b and d. From b, transfer to d at rate 1 and to an absorbing product at rate 1; d has no outgoing jump. Then

$$
D=\operatorname{diag}(1/2,1),\quad E_{\mathrm{product}}=\operatorname{diag}(1/2,0).
$$

The no-reaction effect records eventual dark capture and is not a Hilbert-space projection. A classification that simply deletes ker K would miss the response from b. The largest subspace on which reaction never occurs with probability one is the eigenvalue-1 space of D; reachable capture into it is already included by the effect D.

### Spectral computation and certified tails

Since $T_t^*$ is uniformly bounded, $G^*$ has spectrum in $\operatorname{Re}z\le 0$, and every eigenvalue on the imaginary axis is semisimple. Let $P_{s}$ be its Riesz projection onto $\operatorname{Re}z<0$ and $P_{\mathrm{per}}=I-P_s$. The positive integrability in (D2) implies $P_{\mathrm{per}}B_a=0$: a nonzero finite sum of nondecaying exponentials cannot have the convergent integral in (D2). Therefore

$$
\begin{aligned}
E_a &= -(G^*|_{\operatorname{range} P_s})^{-1} B_a,\\
P_{\mathrm{per}} E_a &= 0.
\end{aligned}
\tag{D4}
$$

These conditions, together with $G^*E_a=-B_a$, uniquely select the canonical effects even when $G^*$ is singular. The survival limit is $D=P_0I$, where $P_{0}$ is the zero-eigenvalue Riesz projection; the nonzero imaginary-axis parts of $I$ vanish because $T_t^*(I)$ converges.

A certified stable spectral decomposition or resolvent contour supplies constants $C,g>0$ and an integer $m$ for

$$
\lVert T_T^*(I)-D\rVert\le C(1+T^{m-1})\exp(-gT).
\tag{D5}
$$

Here $g$ can be any strict certified lower gap for the stable spectrum and $C$ includes the chosen spectral/projector/Jordan bounds. Equation (D5) is not supplied merely by identifying eigenvalues numerically. Alternatively, the exact positive difference $T_T^*(I)-D$ can be bounded directly by outward matrix propagation. If there is no stable component, all $E_{a}$ vanish and the product tail is zero. Without a certified spectral separation, a uniform perturbation bound cannot be inferred: arbitrarily small leakage can change a dark probability discontinuously at infinite time.

## 5. Complete finite retained-carrier classification

Together I1–I2 and D1 give the following exhaustive decision structure for the declared finite retained-instrument class:

1. Compile the typed source/control/memory/target instrument, preserving its reachable preparations and resource record.
2. Pull every retained outcome back to its source effect. Finite memory and adaptive feedback are included in the compilation.
3. If observation is an eventual reaction, include every product effect and D. A positive reaction floor is one useful special case, not a requirement.
4. Form the span of physically reachable, resource-matched source differences. Response is constant exactly when every retained effect annihilates that span.
5. On a full affine preparation fiber, use (I4) or the certified response-range optimization. For a stricter physical control algebra, use its actual reachable relation.
6. A nonconstant branch requires an exhibited reachable pair plus its physical preparation/target/source ledger. The low-field construction provides such a populated instance; a general effect quotient alone does not provide a molecule.

Every finite retained-source normal-instrument implementation falls into these cases, even with an infinite owned physical auxiliary. This covers non-Markov memory and dark sectors without enumerating molecular names. The general normal-source extension covers response representation and the annihilator criterion for infinite retained sources as well. The finite spectral and SDP algorithms apply precisely on their stated finite sectors. Context-dependent apparatus must be represented explicitly, and unbounded cost records require the stated integrability check.

### Exact full-retarded finite sources and target instruments

## 1. Typed source and target data

Use real physical fields $\operatorname{Re}(E_\omega\exp(-i\omega t))$, $\omega>0$, $k=\omega/c$, and $\epsilon_0\mu_0c^2=1$. Fix distinct $x_1,\dots,x_N$ in $\mathbb{R}^3$. The source space is $V=\mathbb{C}^{3N}$, with $p=(p_1,\dots,p_N)$ the peak complex electric dipole moments, in coulomb-metres. The distributional polarization, charge and current are

$$
P_p(x)=\sum_j p_j\, \delta(x-x_j),
$$

$$
\rho_p=-\operatorname{div} P_p,\quad J_p=-i \omega P_p.
\tag{1}
$$

Consequently $-i\omega\rho_p+\operatorname{div}J_p=0$ exactly. The source map $p\to(\rho_p,J_p)$ is linear and injective.

At a target $x$ unequal to every $x_{j}$ define $R_j=|x-x_j|$, $n_j=(x-x_j)/R_j$. The exact electric transfer tensor is

$$
\begin{aligned}
G_k(R) &= \exp(ikR)/(4 \pi \epsilon_0)\, \bigl[ (k^2/R)(I-n n^{\mathsf T})\\
&\qquad +(1/R^3-ik/R^2)(3 n n^{\mathsf T}-I) \bigr],
\end{aligned}
\tag{2}
$$

where R here also denotes the displacement vector where needed. Thus

$$
E_p(x)=\sum_j G_k(x-x_j)p_j=:H_x p.
\tag{3}
$$

The target can be any finite collection of bounded linear field functionals. Write its transfer as $H:V\to\mathbb{C}^m$ and its positive quadratic readout as

$$
A=H^* W H,\quad W=W^* \ge 0,\quad Q_{\mathrm{target}}(p)=p^* A p.
\tag{4}
$$

Examples are a point polarization component, a spatially averaged field, and a positive sum of field intensities. A point Stark target with transition dipole $d$ uses the row $h=(d^*G_k(x-x_j))_j$ and $u(p)=|hp|^2/\hbar^2$. All target units reside in $H$ and $W$, independently of the source objective.

### Proof of (2)

Let $g_k(R)=\exp(ikR)/(4\pi R)$, the outgoing scalar fundamental solution. On $R\ne 0$, Maxwell's equations with (1) give

$$
E_p=(1/\epsilon_0)(k^2I+\nabla\nabla^{\mathsf T})g_k*P_{p}.
$$

For a radial $g$, $\nabla\nabla^{\mathsf T}g=(g''-g'/R)nn^{\mathsf T}+(g'/R)I$. Substitution of $g'_k$ and $g''_k$ gives (2). This derivation retains the $R^{-1}$, $R^{-2}$ and $R^{-3}$ terms and all separation phases; it contains no expansion in $ka$ or $kR$.

## 2. Exact radiation matrix and its strict positivity

Define $P_n=I-nn^{\mathsf T}$ and

$$
R_{ij}=(3/(8 \pi)) \int_{S^2} P_n \exp(ik\, n \cdot (x_i-x_j))\, d\Omega.
\tag{5}
$$

Every block is real symmetric, $R_{ji}=R_{ij}$, and $R_{ii}=I_3$. Put

$$
P_0=\omega^4/(12 \pi \epsilon_0 c^3)=c k^4/(12 \pi \epsilon_0).
$$

The exact emitted power is

$$
P_{\mathrm{rad}}(p)=P_0\, p^* R p.
\tag{6}
$$

For $i\ne j$ let $z=k|x_i-x_j|$ and $u=(x_i-x_j)/|x_i-x_j|$. Then

$$
R_{ij}=(j_0(z)-j_2(z)/2)I +(3j_2(z)/2)uu^{\mathsf T},
\tag{7}
$$

$$
j_0(z)=\sin(z)/z,
$$

$$
j_2(z)=(3/z^3-1/z)\sin(z)-3\cos(z)/z^2.
$$

Equivalently, its transverse and longitudinal eigenvalues are

$$
r_\perp(z)=(3/2)[\sin(z)/z+\cos(z)/z^2-\sin(z)/z^3],
$$

$$
r_\parallel(z)=3[\sin(z)-z \cos(z)]/z^3.
\tag{8}
$$

Their removable values at zero are one.

### Theorem EM1 (complete radiation classification)

For all finite $N$ and all distinct positions at $k>0$, $R$ is positive definite. Therefore every nonzero point-array source radiates a strictly positive amount. Dipole-order cancellation $\sum_jp_j=0$ is distinct from exact cancellation of the complete emitted field.

### Proof

Taking R large in (2) gives the outgoing amplitude

$$
A_p(n)=k^2/(4\pi\epsilon_0)\,P_n\sum_j p_j\exp(-ik\,n\cdot x_j).
$$

The outward time-averaged flux is $\epsilon_{0}c|A_p(n)|^2/2$. Integrating gives (5)-(6). The angular integral can be evaluated without a special-function assumption: $\int\exp(izn\cdot u)\,d\Omega=4\pi\sin(z)/z$; differentiating twice in the displacement gives the integral of $nn^{\mathsf T}$. Subtracting it from $I$ times the scalar integral yields (7)-(8).

It remains to show strict positivity. If $p^*Rp=0$, the continuous nonnegative angular integrand vanishes, so $A_p(n)=0$ for all $n$. Each Cartesian component of $E_{p}$ solves the scalar Helmholtz equation outside a ball containing the sources and is outgoing. Expand that component on a surrounding sphere into spherical harmonics. Its outgoing continuation has terms $a_{lm}h_l^{(1)}(kr)Y_{lm}(n)$. The far-field coefficient of each such term is a nonzero scalar multiple of $a_{lm}$, because $h_l^{(1)}(kr)=(-i)^{l+1}\exp(ikr)/(kr)+O(r^{-2})$. Orthogonality and the zero far-field amplitude force every $a_{lm}=0$. Thus $E_{p}$ vanishes outside the enclosing sphere.

Every component is real analytic on the connected domain $\mathbb{R}^3\setminus\{x_1,\dots,x_N\}$. Analytic continuation therefore makes $E_{p}$ vanish on that entire punctured domain. Near $x_{j}$, the other dipoles have bounded analytic fields, whereas (2) has leading singularity

$[3n(n\cdot p_j)-p_j]/(4\pi\epsilon_0r^3)$.

If $p_j\ne 0$, this angular function cannot vanish identically: its squared angular integral is positive, or simply its longitudinal and transverse eigenvalues are 2 and $-1$ for every real $n$. The unbounded singularity cannot be cancelled by analytic fields from the other sources. Hence every $p_{j}=0$, proving $R>0$. The outgoing expansion and analyticity argument are also a direct proof of the uniqueness fact used here. QED.

Coincident dipoles must first be merged by summing their moments; the result then applies to the merged distinct sites. This is the complete degeneracy in the point-array class.

## 3. Sharp target-response bound

### Theorem EM2

For fixed geometry, frequency, target $A\ge 0$ and power budget $\bar{P}>0$,

$$
\begin{aligned}
&\max_{P_{\mathrm{rad}}(p)\le\bar P} p^*Ap\\
&\quad =(\bar P/P_0)\, \lambda_{\max}(R^{-1/2} A R^{-1/2}).
\end{aligned}
\tag{9}
$$

The maximum is attained. For a single target row h,

$$
\max |hp|^2=(\bar P/P_0)\, h R^{-1} h^*,
\tag{10}
$$

and an attaining source is a scalar multiple of $R^{-1}h^*$, normalized to saturate the power budget.

### Proof

Set $q=R^{1/2}p$. The constraint is $\lVert q\rVert^{2}\le\bar P/P_0$ and the objective is $q^*R^{-1/2}AR^{-1/2}q$. Rayleigh's principle proves (9), including attainment. The rank-one case has the unique nonzero eigenvalue $hR^{-1}h^*$, proving (10). QED.

This is an exact fixed-geometry replacement for a universal near-field bound expressed only through total emitted power. It automatically includes destructive interference, all multipoles, longitudinal fields and the target orientation. The finite eigenvalue problem is the verifier; no far-zone directivity bound is imported into the near field.

### Corollary EM2a (absence of a frequency-uniform near-field power ceiling)

Take two dipoles $p$ and $-p$ parallel to the $z$ axis at $z=+d/2$ and $z=-d/2$. At a target $z=R>d/2$,

$$
\begin{aligned}
E_z &= (p/(2\pi \epsilon_0))\, \bigl[ \exp(ik(R-d/2))((R-d/2)^{-3}-ik(R-d/2)^{-2})\\
&\qquad -\exp(ik(R+d/2))((R+d/2)^{-3}-ik(R+d/2)^{-2}) \bigr].
\end{aligned}
\tag{11}
$$

Their exact power is

$$
\begin{aligned}
P_{\mathrm{rad}} &= 2P_0 |p|^2[1-r_\parallel(kd)]\\
&= c |p|^2 d^2 k^6/(60 \pi \epsilon_0)+O(k^8).
\end{aligned}
\tag{12}
$$

As $k$ decreases to zero, $E_{z}$ tends to the nonzero static difference of the two inverse cubes in (11). Therefore $|E_z|^{2}/P_{\mathrm{rad}}$ grows as $k^{-6}$. A bound uniform over frequencies needs an additional stored-energy, current, geometry or bandwidth constraint.

### Proof

The longitudinal specialization of (2) gives (11). Equations (6)-(8) give the first part of (12). Taylor expansion gives $r_\parallel(z)=1-z^{2}/10+z^{4}/280+O(z^{6})$. The strict inequality $(R-d/2)^{-3}>(R+d/2)^{-3}$ proves the limiting field is nonzero. QED.

## 4. Exact classification of resource-matched responses

Let $Q>0$ be a registered quadratic source resource form and $R>0$ a second registered form (radiation, with its constant suppressed). Two sources are matched when

$$
p^*Qp=q^*Qq,\quad p^*Rp=q^*Rq.
\tag{13}
$$

### Theorem EM3 (necessary and sufficient criterion)

For any Hermitian response form $A$, the response $p^*Ap$ is equal for every pair matched by (13) if and only if

$$
A=aQ+bR
\tag{14}
$$

for real a,b. Thus the complete response is determined by those two resource numbers precisely for the two-dimensional real linear span in (14).

### Proof

Whiten $Q$ and diagonalize $Q^{-1/2}RQ^{-1/2}$; the assertion is unchanged by that invertible transformation. We may assume $Q=I$ and $R=\operatorname{diag}(\lambda_1,\ldots,\lambda_n)$.

Changing the relative phases of a vector supported on coordinates $i,j$ leaves both resources fixed. Its $A$-expectation can therefore be phase independent only if $A_{ij}=0$ for $i\ne j$. This includes pairs inside degenerate eigenspaces; equivalently, $A$ is scalar on each eigenspace after arbitrary internal basis changes. Write $A=\operatorname{diag}(\alpha_i)$.

For probability vectors $w$ and $w'$ with $\sum w_i=\sum w'_i=1$ and $\sum\lambda_i w_i=\sum\lambda_i w'_i$, response matching says $\sum\alpha_i(w_i-w'_i)=0$. Every vector $v$ orthogonal to $1$ and $\lambda$ is a scalar multiple of such a difference: start from the strictly positive uniform probability vector and use $w'=w+tv$ with sufficiently small nonzero $t$. Hence $\alpha$ is orthogonal to the common kernel of the two linear functionals, so $\alpha$ belongs to $\operatorname{span}_{\mathbb{R}}\{1,\lambda\}$. This proves (14), including the scalar-$R$ case. The reverse implication follows by substituting the two equal resource values. QED.

This strengthens Proposition L.4.2a from an abstract three-map assumption to an exact criterion for every quadratic target of the whole finite-array class.

### Fully populated matched-control pair

Choose one length $\ell>0$, $k=1/\ell$, sources $x_{1}=0$ and $x_2=\ell e_z$, and target $x=2\ell e_z$. Restrict both moments to the $z$ direction. Let

$$
p_+=(p,ip),\quad p_-=(p,-ip),\quad p>0,
$$

$$
Q=I_2,\quad R=\begin{bmatrix} 1 & r\\ r & 1 \end{bmatrix},\quad r=3(\sin 1-\cos 1).
$$

Both sources have $Q$-resource $2p^{2}$ and radiation $2P_0p^{2}$. Their complete dipole-order aggregate magnitudes are also equal: $|p_1+p_2|^{2}=2p^{2}$. The longitudinal target row, with common factor $C=1/(2\pi\epsilon_0\ell^{3})$, is

$$
h=C\, [g_1,g_2],
$$

$$
g_1=\exp(2i)(1/8-i/4),\quad g_2=\exp(i)(1-i).
$$

Since

$$
\operatorname{Im}(\overline{g_1}g_2)=(\cos 1-3\sin 1)/8<0,
$$

$$
\lvert hp_+\rvert^{2}-\lvert hp_-\rvert^{2}=C^{2}p^{2}(3\sin 1-\cos 1)/2>0.
\tag{15}
$$

The sign follows, for example, from $\sin 1>1-1/6=5/6$ and $\cos 1<1$. The entire pair is exact; no numerical fitting enters it. Moreover $A=h^*h$ has an imaginary off-diagonal entry, whereas every $aI+bR$ is real. Theorem EM3 independently certifies the response distinction.

## 5. An explicit quantum target map and remainder

For a two-level target in the specified rotating-wave carrier, take

$$
H_{\mathrm{tar}}(p)=(\hbar/2)[\Delta\, \sigma_z+\operatorname{Re}(\Omega(p))\sigma_x-\operatorname{Im}(\Omega(p))\sigma_y],
$$

$$
\Omega(p)=d^*E_p(x)/\hbar,\quad \Delta>0.
$$

The initial state is $|g\rangle\langle g|$ and the endpoint is $\Pi_e=|e\rangle\langle e|$. At duration $T$,

$$
\begin{aligned}
M_T(p) &= \operatorname{tr}(\Pi_e \exp(-iH_{\mathrm{tar}}(p)T/\hbar)|g\rangle\langle g|\exp(iH_{\mathrm{tar}}(p)T/\hbar))\\
&= u/(\Delta^2+u)\, \sin^2((T/2)\sqrt{\Delta^2+u}),\quad u=|\Omega(p)|^2.
\end{aligned}
\tag{16}
$$

For each fixed classical $p$ this is a normalized CPTP target instrument; as a function of $p$ it is a classical response kernel, not a linear CPTP map on amplitudes. On any amplitude-bounded class $u\le u_{\max}$, choosing $0<T<\pi/\sqrt{\Delta^{2}+u_{\max}}$ makes it strictly increasing in $u$. Indeed its derivative is

$$
\begin{aligned}
&\Delta^2/(\Delta^2+u)^2\, \sin^2((T/2)\sqrt{\Delta^2+u})\\
&\quad + u T/[4(\Delta^2+u)^{3/2}]\, \sin(T \sqrt{\Delta^2+u}) >0.
\end{aligned}
$$

Equation (15) therefore gives a strict matched-source probability difference under this explicit target, not merely a field-amplitude difference.

The dressed transition shift is $\delta(u)=\sqrt{\Delta^{2}+u}-\Delta$ and satisfies

$$
0 \le u/(2\Delta)-\delta(u) \le u^2/(8\Delta^3).
\tag{17}
$$

Taylor's formula for $\sqrt{1+x}$ and $|(\sqrt{1+x})''|\le 1/4$ for $x\ge 0$ prove (17). Thus the perturbative Stark response and its absolute error are both populated. Formula (16) is exact in the declared rotating-wave two-level model; applying it outside that physical target model requires its own counter-rotating, bath and loading ledger.

## 6. Finite charge/current realization and source resource

The singular point source is replaced by an explicit finite polarization. Fix disjoint balls $B_b(x_j)$ of radius $b>0$ and set

$$
f_b(y)=3/(4\pi b^3)\, 1_{|y|<b},
$$

$$
\begin{aligned}
P_p(x) &= \sum_j p_j f_b(x-x_j),\\
\rho_p &= -\operatorname{div} P_p,\quad J_p=-i \omega P_p.
\end{aligned}
\tag{18}
$$

The charge is the finite surface charge density $(3/(4\pi b^{3}))(p_j\cdot n)$ on each sphere; the current is a bounded volume current. Charge continuity holds distributionally, including the boundary. The sources are finite polarized spheres, not point dipoles with an omitted self-energy.

Define the real scalar form factor

$$
F_b(k)=3[\sin(kb)-kb \cos(kb)]/(kb)^3,\quad F_b(0)=1.
\tag{19}
$$

### Theorem EM4 (exact compact-source realization)

Outside the union of balls,

$$
E_p^{(b)}(x)=F_b(k)\, H_x p,
$$

$$
P_{\mathrm{rad}}^{(b)}=P_0 F_b(k)^2\, p^*Rp.
\tag{20}
$$

If $F_b(k)\ne 0$, the point-array response classification transfers exactly, with $A$ replaced by $F_b(k)^{2}A$. If $F_b(k)=0$, every external target field and the radiation vanish for this source family, even for nonzero internal polarization.

For a material source with positive resistivity $1/\sigma_s$, the exact Ohmic power required to support the prescribed current is

$$
\begin{aligned}
P_{\mathrm{ohm}} &= (1/(2\sigma_s)) \int |J_p|^2\, dx\\
&= 3\omega^2/(8\pi \sigma_s b^3) \sum_j |p_j|^2.
\end{aligned}
\tag{21}
$$

Every term is finite. The matched pair above has equal $P_{\mathrm{rad}}^{(b)}$ and equal $P_{\mathrm{ohm}}$.

### Proof

For $|R|>b$, angular integration of the outgoing scalar Green function gives

$$
\int_{S^2} g_k(R-rn)\,d\Omega_n=4\pi\, g_k(R) \sin(kr)/(kr).
$$

Multiplying by the radial density and integrating $0\le r\le b$ yields (19) times $g_k(R)$. Applying $(k^{2}I+\nabla\nabla^{\mathsf T})/\epsilon_0$ proves the exterior field formula. Its far-zone limit proves the power formula. The vanishing form-factor case is therefore completely classified rather than excluded silently.

The disjoint supports make $\int|P_p|^{2}=\sum_j|p_j|^{2}\int f_{b}^{2}$, and $\int f_b^{2}=3/(4\pi b^{3})$. Equation (21) follows. The static internal field of a uniformly polarized sphere is finite; the time-harmonic volume current and finite surface charge add locally bounded or finite-jump fields. Hence the near-source field energy is finite. The finite-time retarded version has finite energy on every bounded observation region, with emitted energy crossing the boundary explicitly charged. QED.

For $0<kb<\pi$, $\sin(kb)-kb\cos(kb)>0$, since its derivative is $kb\sin(kb)>0$ and it vanishes at zero. In particular $b=\ell/10$ is an explicit disjoint positive-form-factor realization of the matched pair.

### Complete power accounting

An impressed electrical/chemical drive maintains (18). The differential Poynting identity gives, for a control volume containing sources and any loaded target,

$$
W_{\mathrm{drive}} = \Delta U_{\mathrm{EM}} + Q_{\mathrm{ohm}} + E_{\mathrm{out}} + W_{\mathrm{target}} + \Delta U_{\mathrm{source}}.
\tag{22}
$$

The terms have separate ownership: field storage, source dissipation, outgoing flux, target exchange, and material source storage. In periodic operation with no target loading and stationary source storage, (22) reduces to $P_{\mathrm{drive}}=P_{\mathrm{ohm}}+P_{\mathrm{rad}}$. Target work is added when the target is loaded. It is not charged again as emitted power. The source's own static polarization energy may be included as a positive quadratic form $Q_{\mathrm{mat}}$; the resource-matching criterion EM3 applies to the resulting registered forms.

The prescribed finite sources are a formal electrodynamic realization. To identify these particular currents with a biological substrate requires its constitutive and source-control data. A vacuum Green tensor is not an aqueous dielectric calibration; the latter has dispersion, screening and loss data of its own.

### Complete compact-current electromagnetic class

## 1. Complete typed source and field operators

Let $\Omega$ be any bounded open source region in $\mathbb{R}^3$, $\omega>0$, $k=\omega/c$, and let $S=L^2(\Omega;\mathbb{C}^3)$. Extend $P$ by zero outside $\Omega$ and define the conserved harmonic source

$$
\rho_P=-\operatorname{div}P,\quad J_P=-i\omega P.
$$

The continuity equation is exact in distributions. Smooth compact $P$ gives ordinary finite charge/current densities. The $L^2$ completion also admits the usual weak polarization/interface charge description; local field energy is finite on bounded regions under the standard weak Maxwell realization. A time-harmonic radiator's field is not asserted globally square integrable over all of infinite space.

With $g_k(x)=\exp(ik|x|)/(4\pi|x|)$, the exact outgoing field outside the source is

$$
E_P(x)=\epsilon_0^{-1} (k^2 I+\nabla \nabla) \int_\Omega g_k(x-y)P(y)\,dy.
\tag{G1}
$$

Fix any finite set of target points or bounded spatial averages a positive distance from $\Omega$. Their weighted field transfer $H:S\to\mathbb{C}^m$ is bounded, because the kernel and its derivatives are bounded on the separated source/target sets. A positive target weight $W$ defines $A=H^*WH\ge 0$ and response $\langle P,AP\rangle$.

The outgoing angular field is

$$
\begin{aligned}
F(P)(n)&=k^2/(4\pi\epsilon_0)(I-nn^{\mathsf T})\\
&\qquad\int_\Omega\exp(-ik\,n\cdot y)P(y)\,dy.
\end{aligned}
$$

Its radiation operator is

$$
\begin{aligned}
R &= (\epsilon_0 c/2)F^*F\ge 0,\\
P_{\mathrm{rad}} &= \langle P,RP\rangle.
\end{aligned}
\tag{G2}
$$

Unlike the distinct finite point-array matrix, R on the full compact-source space need not be positive definite. No inverse of R is silently assumed. All angular phases and spatial orders remain in (G1)–(G2).

A declared finite conductivity with $0<\sigma_{\min}\le\sigma(x)\le\sigma_{\max}<\infty$ gives the coercive dissipation operator

$$
\begin{aligned}
Q &= (\omega^2/(2\sigma(x)))I,\\
P_{\mathrm{ohm}} &= \langle P,QP\rangle,\quad Q\ge q_{\min} I>0.
\end{aligned}
\tag{G3}
$$

The drive, field storage, material polarization, outgoing radiation, dissipation and target loading retain the same Poynting ownership as in the compact-ball realization. Specifying a current is not a claim that its actuator, preparation or reset is free.

## 2. Complete resource-identification theorem

### Theorem G1

For bounded Hermitian A,R and bounded coercive Q on a complex Hilbert source space, the following are equivalent:

(a) For all sources $P,P'$, equality of $\langle P,QP\rangle,\langle P,RP\rangle$ with the corresponding two primed values implies equality of $\langle P,AP\rangle$ and $\langle P',AP'\rangle$.

$$
\text{(b) } A=\alpha Q+\beta R \text{ for real } \alpha,\beta.
\tag{G4}
$$

The same statement holds when (a) is tested on every vector in a dense complex linear physical source domain, such as smooth compact polarizations.

**Proof.** Whiten $Q$ to reduce to $Q=I$. Restrict the three quadratic forms to any finite-dimensional complex source subspace $V$. Diagonalize the finite compression of $R$. Relative-phase variations force the compression of $A$ to be diagonal in that eigenbasis; matched probability weights force its diagonal to lie in the real span of $1$ and the $R$ eigenvalues. Thus $A|_V=\alpha_V I+\beta_V R|_V$ as quadratic forms, by the finite-dimensional proof EM3.

If $R$ is not scalar, choose two unit vectors $u,v$ having distinct $R$ Rayleigh quotients. Their $A$ and $R$ expectations determine unique $\alpha,\beta$. Every finite subspace containing $u,v$ therefore has those same coefficients. Adjoining any vector $x$ proves $\langle x,(A-\alpha I-\beta R)x\rangle=0$. Complex polarization gives the operator identity. If $R$ is scalar, every finite subspace instead forces $A$ scalar, with the scalar fixed by any one unit vector. The reverse implication follows by substitution. For a dense physical domain choose $u,v$ and all finite subspaces inside that domain, then extend the bounded quadratic identity by continuity. QED.

This is uniform over all source dimensions and geometries. It is not a finite-current enumeration or a multipole cutoff. Additional physical reachability restrictions use the actual matched-difference annihilator of the exact matched-resource quotient above; (G4) does not replace those restrictions by unrestricted source control.

## 3. Sharp budgets and nonradiating directions

For the physical radiation operator $R\ge 0$ and $\eta>0$ set $B_\eta=R+\eta Q$. It is bounded and coercive. Under $\langle P,B_\eta P\rangle\le P_{\mathrm{budget}}$, the exact sharp supremum is

$$
\sup \langle P,AP\rangle =P_{\mathrm{budget}} \lVert W^{1/2} H B_\eta^{-1/2}\rVert^2.
\tag{G5}
$$

**Proof.** Substitute $z=B_\eta^{1/2}P$ and use the operator norm. For finite target dimension the positive operator $B_\eta^{-1/2}AB_\eta^{-1/2}$ has finite rank; when nonzero its largest eigenvalue is attained in the Hilbert completion. A dense smooth physical source domain approaches the same supremum by norm continuity. Attainment in a narrower physical domain requires the maximizing source to belong to that domain. QED.

For radiation alone, a finite ceiling C exists precisely when

$$
A\le C R \text{ as quadratic forms}.
\tag{G6}
$$

Equivalently there is a bounded map $T$ from $\operatorname{closure}(\operatorname{range}R^{1/2})$ to the weighted target space such that

$$
W^{1/2}H=T R^{1/2}.
\tag{G7}
$$

The least $C$ is $\lVert T\rVert^{2}$ for this uniquely defined map on the range closure.

**Proof.** If (G6) holds, define $T(R^{1/2}P)=W^{1/2}HP$. The inequality both makes this well-defined on any null directions and bounds it by $\sqrt{C}$; continuity extends it to the range closure. Conversely (G7) implies (G6). The supremum over the dense range fixes the least constant. QED.

Thus nonradiating directions are retained rather than divided out without checking the target. If $RP=0$ but $W^{1/2}HP\ne 0$, no radiation-only ceiling can hold for that target. Even when every such null direction is target-invisible, a finite ceiling still requires boundedness of (G7), not merely null-space inclusion. For vacuum targets in the unbounded connected component of the source complement, the outgoing uniqueness/Rellich property makes a compact nonradiating source field-invisible in that component; a separated target in a bounded cavity is not covered by this assertion. That fact alone does not establish the bounded factorization constant. Positive ohmic/source control supplies the unconditional finite ceiling (G5).

## 4. Realized responses and biological typing

The exact finite compact-ball matched pair already supplies a conserved finite source attaining unequal near-field target response at equal radiation and dissipation. The field-to-two-level target instrument in the earlier proof realizes its normalized response within the explicitly declared effective target Hamiltonian. The membrane construction supplies a separate finite biological material Green operator and charged conformational target; it does not reuse vacuum permittivity for water or lipid.

Together these statements classify the full compact-polarization Maxwell source class and its target/resource maps without restricting it to electric-dipole order. A different dispersive, nonlinear, anisotropic or active material requires its actual constitutive field operator and domain. When that physical source-to-target process is a normal instrument, the general effect/annihilator classification applies to it without inventing a vacuum reduction. These are the physical preparation and channel classes in the matched response comparison.

### Biological near-field material, source back-reaction and charged gate

## 1. Finite material geometry and exact electrostatic transfer

Let the finite shielded patch occupy

$\Omega=(0,L)\times(0,L)\times(-H,H)$,
$L=20$ nm, $H=10$ nm, $d=7$ nm.

The central membrane/protein dielectric is $|z|<d/2$, with $\epsilon_m=4\epsilon_0$. The outer aqueous regions have $\epsilon_w=80\epsilon_0$ and screening length $\lambda_{D}=1$ nm. Set $\epsilon_{0}=8.854\times 10^{-12}$ F/m as the declared constitutive parameter. A neutral enclosing conductor provides the zero-potential boundary. All charge profiles below are odd under $z$ reflection, as is the induced screened charge; their total charge vanishes. The symmetric enclosure therefore requires no net imported charge. Its induced surface charge and field are included in the electrostatic solution.

The specified fixed-parameter linear-screened material operator is

$$
\begin{aligned}
A \phi &= -\operatorname{div}(\epsilon(z) \operatorname{grad} \phi)\\
&\quad +\epsilon_w \lambda_D^{-2} 1_{\mathrm{water}} \phi,\\
\phi|_{\mathrm{boundary}} &= 0.
\end{aligned}
\tag{M1}
$$

Its positive quadratic form defines a unique weak Green operator $G=A^{-1}$. The effective material model assigns the source energy $\frac{1}{2}\langle\rho,G\rho\rangle$. This is the energy convention of the formal Hamiltonian realization below. Interpreting the same expression as a real electrolyte potential of mean force does not, by itself, identify microscopic solvent internal energy or heat; that stronger interpretation needs its solvent entropy/energy record. This is the declared Debye-Huckel continuum constitutive model, including a declared quadratic screened-material energy. It is not an inference that every solvent obeys this law at arbitrary voltage. The numerical instance below remains an exact mathematical statement for this operator; a nonlinear solvent law can replace it and is then a different typed material map.

Let

$$
\begin{aligned}
\psi(x,y) &= \pi^2/(4L^2) \sin(\pi x/L) \sin(\pi y/L),\\
f_s &= \psi(x,y)[\delta(z-s)-\delta(z+s)],\\
a &= 4\ \mathrm{nm},\quad b=1.75\ \mathrm{nm}.
\end{aligned}
\tag{M2}
$$

The positive and negative sheets each have unit integral. They are finite-area charge sheets with finite electrostatic energy, not point charges with divergent self-energy. The sinusoidal transverse profile vanishes on the lateral boundary. A source charge $Q$ means $\rho_{\mathrm{source}}=Qf_a$. Opening a conformational gating coordinate transfers the effective charge $q$ from the positive to the negative membrane face profile, giving $\rho_{\mathrm{gate}}=-qf_b$. Here $q=e=1.602176634\times 10^{-19}$ C. The closed coordinate has zero change from its fixed neutral reference charge profile. That reference's even contribution and conformation-independent energy can be retained without altering the odd-mode calculation.

The charged coordinate represents displacement of protein gating charge; it is not a claim of ion conduction through the pore. The target is the open conformation itself. A subsequent ionic current is an additional response map.

Define

$$
A_s=\langle f_a,G f_a\rangle,\quad A_g=\langle f_b,G f_b\rangle,\quad B=\langle f_a,G f_b\rangle.
\tag{M3}
$$

All three entries have inverse-farad units. They are populated by the following one-dimensional formula. Put

$$
\begin{aligned}
k_\parallel&=\sqrt{2}\,\pi/L,\\
\eta_m&=k_\parallel,\\
\eta_w&=\sqrt{k_\parallel^2+\lambda_D^{-2}},\\
N&=\int\psi^2\,dx\,dy=\pi^4/(64L^2).
\end{aligned}
$$

On $0<z<H$ solve $-(\epsilon u')'+\epsilon\eta^{2}u=0$ with $u(0)=0$ and $\epsilon_m u'(0)=1$. Let $v(H)=0$, $\epsilon_w v'(H)=-1$. Both are positive in the interior. In each constant material layer the state $(\phi,\epsilon\phi')$ propagates by

$$
T_{\eta,\epsilon}(\ell)=
\begin{pmatrix}
\cosh(\eta\ell)&\sinh(\eta\ell)/(\epsilon\eta)\\
\epsilon\eta\sinh(\eta\ell)&\cosh(\eta\ell)
\end{pmatrix}.
\tag{M4}
$$

The one-dimensional Dirichlet Green function is

$$
G_1(z,t)=u(\min(z,t))\,v(\max(z,t))/u(H).
$$

Consequently

$$
A_s=2N G_1(a,a),\quad A_g=2N G_1(b,b),\quad B=2N G_1(a,b)>0.
\tag{M5}
$$

These are exact layered-field transfer coefficients, including screening, boundary images and every spatial order. They do not use a dipole truncation. The construction is a near-field electrostatic carrier; it does not infer an AC far-zone signal from a stored membrane voltage.

**Proof.** The transverse sine is a Dirichlet Laplacian eigenfunction with eigenvalue $2\pi^{2}/L^{2}$. Oddness imposes the zero condition at $z=0$. Flux and potential are continuous across $z=d/2$. The Wronskian $\epsilon(u'v-uv')$ is constant and equals $u(H)$ at $H$. The standard derivative jump verifies the Green formula. Multiplying by the transverse squared norm and the two equal half-domain contributions gives (M5). Positivity of $u$ and $v$ gives $B>0$. QED.

## 2. Source back-reaction and finite carrier Hamiltonian

The source has two fixed charge sectors $c=+1,-1$ with $Q_c=cQ$, $Q=e$. The gate has closed $z=0$ and open $z=1$. Its full field/configuration energy is

$$
\begin{aligned}
U(c,z) &= 1/2\, \langle cQ f_a-zq f_b,G(cQ f_a-zq f_b)\rangle+\Delta_{\mathrm{conf}} z\\
&= Q^2 A_s/2 + z[\Delta_{\mathrm{conf}}+q^2 A_g/2-cQq B].
\end{aligned}
\tag{M6}
$$

Choose the declared conformational offset $\Delta_{\mathrm{conf}}=-q^{2}A_g/2$, so the two conformations are degenerate at zero source charge. This is a specified member of the two-state gating family, not a measured tuning of a named protein. Then

$$
\begin{aligned}
U(c,z) &= U_0-c E z,\\
U_0 &= Q^2 A_s/2,\quad E=QqB>0.
\end{aligned}
\tag{M7}
$$

The full finite source/gate Hamiltonian is the diagonal four-state operator with these energies. The source charge remains in its actual sector; the complete field changes from $cQ\,Gf_a$ to $cQ\,Gf_a-q\,Gf_b$ when the gate opens. Thus its effect is not an externally clamped voltage with ignored displacement-charge back-reaction. The cross energy and gate self-energy are already present once in (M6).

A nonzero intrinsic offset $\Delta$ changes the gaps to Delta-cE and does not remove strict response ordering for the constant-total-rate thermal model below. $\Delta=0$ is chosen to give equal bath spectra and an especially transparent exact finite Hamiltonian realization.

## 3. Same thermal input and finite physical clock

Take $T_{\mathrm{bath}}=310$ K, $\beta=1/(k_BT_{\mathrm{bath}})$, $k_B=1.380649\times 10^{-23}$ J/K. A thermal two-level ancilla has Hamiltonian $H_B=E|1\rangle\langle 1|$ and its Gibbs state $\gamma_{B}$. Its excited population is

$$
r=1/(1+\exp(\beta E)).
\tag{M8}
$$

The same ancilla state, energy spectrum and clock are used in both source sectors. Let $\sigma_+=|\mathrm{open}\rangle\langle\mathrm{closed}|$ on the gate and $b_+=|1\rangle\langle0|$ on the ancilla. During the finite interval $\tau=1$ ms apply

$$
\begin{aligned}
H_{\mathrm{int}} &= \hbar g\, [P_+(\sigma_+ b_+ +\sigma_- b_-)\\
&\qquad +P_-(\sigma_+ b_- +\sigma_- b_+)],\\
g &= \theta/\tau,\\
\theta &= \arcsin \sqrt{1-\exp(-\nu \tau)},\quad \nu=1000\ \text{per second}.
\end{aligned}
\tag{M9}
$$

This is a source-sector-resolved energy-exchange coupling between the actual gate transition and a resonant thermal degree of freedom. The source projectors $P_+$ and $P_-$ do not change charge. The operator is Hermitian, has norm $\hbar g$, and commutes with $H_{\mathrm{source,gate}}+H_B$: in the $+$ sector opening releases $E$ into the bath, while in the $-$ sector it absorbs $E$. No rotating-wave or instantaneous-gate limit is used after (M9) is declared as the allowed exchange Hamiltonian.

Start the gate closed and keep its native Hamiltonian (M7) active throughout. Each active two-dimensional exchange block rotates by $\theta$. Exact propagation gives

$$
\begin{aligned}
p_+(\tau) &= (1-\exp(-\nu \tau))(1-r),\\
p_-(\tau) &= (1-\exp(-\nu \tau))r,\\
p_+-p_- &= (1-\exp(-\nu \tau))\tanh(\beta E/2)>0.
\end{aligned}
\tag{M10}
$$

The target instrument is the two projectors $\{P_{\mathrm{open}},P_{\mathrm{closed}}\}$. Hence the result is an exactly normalized probability response of the finite physical channel, not an unnormalized susceptibility.

**Proof.** In the $+$ sector the only initially occupied exchange-eligible state is closed,bath-0, with population $1-r$; it converts to open,bath-1 with probability $\sin^{2}\theta$. In the $-$ sector closed,bath-1 has population $r$ and converts to open,bath-0 with the same probability. $H_{0}$ commutes with $H_{\mathrm{int}}$, so native phases do not change these populations. Substitute $\sin^{2}\theta=1-\exp(-\nu\tau)$. QED.

The equivalent continuous thermal population model has rates

$$
\begin{aligned}
k_c(\mathrm{open}|\mathrm{closed}) &= \nu/[1+\exp(-c \beta E)],\\
k_c(\mathrm{closed}|\mathrm{open}) &= \nu/[1+\exp(c \beta E)],
\end{aligned}
\tag{M11}
$$

which sum to $\nu$ and obey local detailed balance $k_{\mathrm{forward}}/k_{\mathrm{reverse}}=\exp(c\beta E)$. Its exact closed-initial population at time $\tau$ is (M10). The finite ancilla construction realizes this single specified-time population response. It does not claim that one finite ancilla realizes the entire irreversible semigroup for every time.

## 4. Exact finite resource controls and ledger

The matched input resource record is:

- source charges +Q and -Q with equal field energy $U_{0}$, equal charge magnitude and equal profile geometry;
- the same closed gate state and intrinsic conformational energy;
- the same 310 K bath ancilla $\gamma_{B}$, including its energy, entropy and spectrum;
- the same finite duration $\tau$ and magnitude g of the exchange Hamiltonian;
- the same ready readout memory and the same orthogonal-label readout interaction.

Charge reversal is the one source-setting difference under comparison. It is not replaced by a different temperature, clock, target or control duration. Initial source/gate total energies are exactly equal, not merely close. The same construction supplies the entire matched family as the exact transfer coefficients and Q vary over the declared admissible geometry/material class.

The native Hamiltonian remains on during exchange. The interaction has zero mean initially because the gate and bath are diagonal. Since $H_{\mathrm{int}}$ commutes with the total Hamiltonian during the hold, its mean remains zero; switching this interaction off therefore also has zero mean work. The norm and switching waveform are equal in both sectors. A bounded smooth turn-on/off can instead be used: all $H_{\mathrm{int}}(t)$ are scalar multiples of the same operator and commute with $H_{0}$, so only the common pulse area $\int g(t)\,dt=\theta$ matters. Finite switching is therefore exact.

Opening changes the field-plus-conformation energy by -cE. The thermal ancilla's mean energy changes by +cE $p_{c}$, so

$$
\Delta U_{\mathrm{gate,source}} + \Delta E_{\mathrm{bath}}=0.
\tag{M12}
$$

These are different response outputs in the two arms and are not relabeled as unequal input resources. The source cross energy is not counted again as an independent voltage-source work term. The global finite-unitary evolution preserves total entropy; correlations and the final bath state remain owned records.

A degenerate two-state ready memory copies the orthogonal gate label through a finite controlled unitary commuting with the native source/gate Hamiltonian. Its finite interaction norm, pulse area and input pure-state resource are identical. A one-use trial retains that memory and bath. Repeated use must charge their replacement or reset; a common supplied reset budget may use the finite Gibbs reset construction already proved, with its actual entropy/energy export retained. No autonomous restored clock or free reset is included in the probability formula.

The static source can be prepared from zero charge by opposite finite charging paths $Q_c(t)=cQ\,s(t)$, with the gate held closed. The explicit finite current $J_z=\dot Q_c(t)\,\psi(x,y)\,1_{(-a,a)}(z)$ satisfies $\operatorname{div}J=-\dot Q_c f_a$, hence the charge continuity equation. The gating displacement similarly has $J_z=-q\dot z\,\psi\,1_{(-b,b)}$; in the finite quantum model $\dot z$ is the Heisenberg derivative of $P_{\mathrm{open}}$. These are conserved quasistatic source/target current records, rather than a claim of a full retarded Maxwell completion. Linearity gives opposite potential/current and identical charging work $U_{0}$; any declared linear source resistance gives identical $\int R\,I(t)^{2}dt$. The preparation actuator and its charge transport are owned by this step. It is an explicit finite-energy boundary/source preparation, not spontaneous creation of the charge sheets. During response the source is isolated at fixed charge.

## 5. Positive certificate and finite resource bounds

The populated transfer (M5) gives the following analytic rational bounds; the outward layered-coefficient and thermal-population intervals are given in [the membrane calculation tables](../related/calculation_companions/appendix_l/l4-2c-reaction-and-transport-tables.md#layered-membrane-calculations).

For the positive solution u, crossing from $\epsilon_{m}$ to $\epsilon_{w}$ decreases its ordinary derivative. Comparing with the constant $\eta_{w}$ equation gives

$$
\begin{aligned}
u(H) &\le \sinh(\eta_w H)/(\epsilon_m \eta_w),\\
u(b) &\ge b/\epsilon_m,\\
v(a) &\ge (H-a)/\epsilon_w.
\end{aligned}
$$

Since $10^{9}<\eta_w<1.1\times 10^{9}$ per meter and $\sinh(11)<30000$,

$$
B > [2 \times 3^4/(64L^2)]\, b(H-a)10^9/(30000\, \epsilon_w).
\tag{M13}
$$

The bound $\sinh(11)<30000$ is checked by an exact rational exponential-series upper bound. All remaining constants in (M13) are rational. Put $x_{\mathrm{lower}}=e^{2}B_{\mathrm{lower}}/(k_BT_{\mathrm{bath}})$. Because $\exp(1)>2$ and $\tanh(x/2)\ge x/(2+x)$,

$$
p_+-p_->x_{\mathrm{lower}}/(4+2x_{\mathrm{lower}})>4 \times 10^{-6}.
\tag{M14}
$$

This deliberately loose strict interval is independent of floating propagation. Evaluating the explicit layer formulas with outward rational $\pi$, square-root and exponential-series intervals gives the sharper strict certificate $0.00544212<p_+-p_-<0.00544214$. The exact endpoints for the layer coefficients, energy, thermal populations and gap are given in [the membrane calculation tables](../related/calculation_companions/appendix_l/l4-2c-reaction-and-transport-tables.md#layered-membrane-calculations).

The positive Green quadratic form is bounded by the unscreened Dirichlet form with permittivity $\epsilon_{m}$. In particular $G_1(s,s)\le H/\epsilon_m$, so

$$
\begin{aligned}
A_s,A_g &\le 2N H/\epsilon_m,\\
U_0 &\le e^2 N H/\epsilon_m.
\end{aligned}
\tag{M15}
$$

Cauchy-Schwarz gives $B\le\sqrt{A_sA_g}$, hence $E\le 2U_{\mathrm{upper}}$. The exact rational check verifies $U_{\mathrm{upper}}<0.18$ eV and $E<0.36$ eV. The gate intrinsic offset has magnitude below 0.18 eV. All field and chemical energies in this small construction are finite and within the explicitly declared molecular-scale range. Delivering even the conservative total $4U_{\mathrm{upper}}$ during a 1 ms preparation would average below $1.2\times 10^{-16}$ W before separately specified actuator losses; this is a bound on the modeled source work, not a claim that unspecified apparatus consumes that amount.

### Spin-selective chemical source and complete reaction effects

## 1. Typed spin, product and context operators

Let

$$
\begin{gathered}
\lvert S\rangle=(\lvert\uparrow,\downarrow\rangle-\lvert\downarrow,\uparrow\rangle)/\sqrt{2}, \\
\lvert T\rangle=(\lvert\uparrow,\downarrow\rangle+\lvert\downarrow,\uparrow\rangle)/\sqrt{2}.
\end{gathered}
$$

Write $X,Y,Z$ for Pauli matrices in the ordered basis $(S,T)$, with $Z=|S\rangle\langle S|-|T\rangle\langle T|$. Products $|P_S\rangle,|P_T\rangle$ are orthogonal chemical states. The carrier is

$$
\begin{aligned}
H_{\mathrm{car}} &= \operatorname{span}\{S,T,P_S,P_T\}=\mathbb{C}^4,\\
P_R &= |S\rangle\langle S|+|T\rangle\langle T|.
\end{aligned}
$$

The source Hamiltonian is

$$
H_R=E_R P_R+(\hbar \Omega/2)X,\quad E_R>\hbar|\Omega|/2.
\tag{1}
$$

In the two-electron space the difference-Zeeman operator $s_{1z}-s_{2z}$, with $s_{z}$ eigenvalues $\pm 1/2$, restricts to $X$. Thus an electron frequency difference $\Omega$ realizes the mixing term in (1). Exchange $s_{1}\cdot s_{2}$ is diagonal in $(S,T)$ and supplies a relative $Z$-phase pulse. These are explicit spin operators of the admitted radical-pair class.

For a context value c in [-1,1], prepare

$$
\rho_c=(I_2+\eta c Y)/2 \text{ on the radical subspace},\quad 0<\eta\le 1.
\tag{2}
$$

Its eigenvalues are $(1+\eta c)/2$ and $(1-\eta c)/2$. In particular the controls $c=+1$ and $c=-1$ have identical populations $1/2$, spectrum, entropy, purity, mean energy $E_{R}$ and coherence magnitude $\eta/2$. They differ in the sign of one spin phase. At $\eta=1/2$ their density matrices are strictly positive.

A relative-phase exchange pulse sends the common state $(I_2+\eta X)/2$ to the two controls by opposite $\pi/2$ $Z$-rotations. During preparation retain the common offset $E_RP_R$ and turn off only the mixing term, so the two spin levels are degenerate. Turning on $(\hbar\Omega/2)X$ then has zero mean work for both controls because $\operatorname{tr}(X\rho_c)=0$. Creating the radical excitation from a zero-energy product costs $E_{R}$ on both arms and is charged to the source preparation. Any realization cost of preparation is accounted separately below.

## 2. Exact finite reaction instrument

Fix $q\in(0,1)$, $\theta$ real, and let $U_\theta=\exp(-i\theta X/2)$ on the radical subspace, with identity on products. A reaction step has Kraus operators

$$
\begin{aligned}
K_0 &= \sqrt{q}P_R+|P_S\rangle\langle P_S|+|P_T\rangle\langle P_T|,\\
K_S &= \sqrt{1-q}\,|P_S\rangle\langle S|,\\
K_T &= \sqrt{1-q}\,|P_T\rangle\langle T|.
\end{aligned}
\tag{3}
$$

Their adjoint products sum to $I_{4}$. Therefore $R_q(\rho)=\sum_a K_a\rho K_a^*$ is CPTP, preserves pre-existing products, and sends each reaction to the correctly typed product. One full step is

$$
E_{\theta,q}=R_q \circ \operatorname{Ad}(U_\theta).
\tag{4}
$$

The target measurement is the three-outcome product instrument

$$
\Pi_S=|P_S\rangle\langle P_S|,\quad \Pi_T=|P_T\rangle\langle P_T|,\quad \Pi_R=P_R.
\tag{5}
$$

The response is the entire probability triple, including unrecombined radicals. No postselection is performed.

### Theorem RP1 (complete finite response)

After $m\ge 1$ steps, the probabilities are

$$
\begin{aligned}
Y_S^{(m)}(c) &= (1-q^m)/2\\
&\quad + (\eta c(1-q)/2) \sum_{n=1}^m q^{n-1} \sin(n \theta),
\end{aligned}
$$

$$
\begin{aligned}
Y_T^{(m)}(c) &= (1-q^m)/2\\
&\quad - (\eta c(1-q)/2) \sum_{n=1}^m q^{n-1} \sin(n \theta),
\end{aligned}
$$

$$
Y_R^{(m)}(c)=q^m.
\tag{6}
$$

The finite sum has the exact closed form

$$
\begin{aligned}
&\sum_{n=1}^m q^{n-1}\sin(n \theta)\\
&\quad =\operatorname{Im}[ \exp(i \theta)(1-(q \exp(i \theta))^m)/(1-q \exp(i \theta)) ].
\end{aligned}
\tag{7}
$$

Every matched-control pair c and -c has the same reaction count, mean source-energy history and full outcome-record entropy.

### Proof

A unitary rotation around $X$ preserves the $X$ component and rotates the initial Bloch vector $(0,\eta c,0)$ to $(0,\eta c\cos(n\theta),\eta c\sin(n\theta))$. A trajectory surviving $n-1$ reaction steps has probability $q^{n-1}$; its normalized spin state has undergone $n$ rotations when it reaches reaction step $n$. The singlet population is $[1+\eta c\sin(n\theta)]/2$. Multiplying by $1-q$ and summing gives (6). The triplet formula is the complementary population. Survival is $q^{m}$. The geometric identity proves (7). For $c$ and $-c$, the $S/T$ probabilities at every step are exchanged and their sum remains fixed. Products have equal assigned energy, and the spin $X$ expectation is zero throughout. Therefore both controls have the same source-energy and reaction-count histories. Exchanging two outcome labels leaves entropy unchanged. QED.

### Populated exact instance

Take

$$
\eta=1/2,\quad q=1/2,\quad \theta=\pi/2,\quad m=2.
$$

Then $\sin(\theta)=1$, $\sin(2\theta)=0$, so

$$
\begin{aligned}
(Y_S,Y_T,Y_R)(+1) &= (1/2,1/4,1/4),\\
(Y_S,Y_T,Y_R)(-1) &= (1/4,1/2,1/4).
\end{aligned}
\tag{8}
$$

The singlet-product probability changes by exactly $1/4$. Each arm has survival $1/4$, reaction probability $3/4$, input entropy $h(3/4)$, and three-outcome Shannon entropy $(3/2)\ln 2$. The unrecombined spin block remains mixed: the full carrier von Neumann entropy is $(3/2)\ln 2+(1/4)h(3/4)$. The source-to-output map is affine:

$$
(Y_S,Y_T,Y_R)(c)=(3/8+c/8,3/8-c/8,1/4).
\tag{9}
$$

The baseline $c=0$ differs from either endpoint by total-variation distance $1/8$. It obeys the strict bounded-bias condition $1/8<1/2$ and never forces a deterministic endpoint.

## 3. Finite Stinespring realization

For each reaction step introduce a fresh record qutrit with basis (0,s,t). On two mutually orthogonal two-dimensional planes define real rotations

$$
\begin{gathered}
\lvert S,0\rangle\to\sqrt{q}\lvert S,0\rangle+\sqrt{1-q}\lvert P_S,s\rangle, \\
\lvert P_S,s\rangle\to-\sqrt{1-q}\lvert S,0\rangle+\sqrt{q}\lvert P_S,s\rangle,
\end{gathered}
$$

$$
\begin{gathered}
\lvert T,0\rangle\to\sqrt{q}\lvert T,0\rangle+\sqrt{1-q}\lvert P_T,t\rangle, \\
\lvert P_T,t\rangle\to-\sqrt{1-q}\lvert T,0\rangle+\sqrt{q}\lvert P_T,t\rangle,
\end{gathered}
\tag{10}
$$

and use the identity on the orthogonal complement. This is a unitary. Tracing the qutrit initially in $|0\rangle$ gives exactly (3). Two such records and the source carrier have dimension $4\cdot 3^{2}=36$. Adding the two-valued context register gives dimension 72. For a fixed context branch, a two-level purifier suffices (dimension 144 if the redundant context register is retained). An equally weighted genuinely classical $\pm$ context with mixed conditional sources has rank four and requires a four-level purifier for a globally pure dilation, giving dimension 288.

The spin rotations are generated by (1). The two reaction rotations are generated by the bounded Hermitian generator $i(|b\rangle\langle a|-|a\rangle\langle b|)$ on their respective planes, with rotation angle $\arccos(\sqrt{q})$. Thus every gate, initial register and measured operator is explicitly specified. Equation (8) is a finite instrument calculation, not an assumption about an unspecified open-system generator.

A separate product-label target can be included as a three-state initially ready memory and copied by a unitary controlled by the orthogonal projectors in (5). Its observable is the S-label projector. This preserves the probabilities in (6). A finite nearest-neighbour transport chain can move the product label before this readout. Use a fixed sequential swap schedule whose target backward circuit light cone contains no context-dependent input before the declared arrival. This gives exact pre-arrival context independence, including mediated paths. For a finite continuous final gate, arrival is its onset of possible target dependence. A metric identification additionally supplies the physical length/time map.

## 4. Resource and energy map

Use the source energy (1). Assign energy $E_{R}$ to each nonready reaction-record state $s,t$ and zero to $0$, with product carrier energies zero. For the prepared family (2), $\operatorname{tr}(X\rho)=0$ is preserved during each surviving spin rotation and after every nonselective reaction.

Before the $n$-th step the expected radical energy is $E_Rq^{n-1}$; afterward it is $E_Rq^n$. The newly excited reaction record has expected energy $E_R(1-q)q^{n-1}$. Therefore

$$
\Delta\langle E_{\mathrm{source}}\rangle + \Delta\langle E_{\mathrm{record}}\rangle =0
\tag{11}
$$

at each complete reaction step on every prepared control state. For the two-step instance, the records receive $(3/4)E_R$ and the source retains $E_R/4$. Both controls have exactly this ledger. The reaction interaction is externally switched. Its switching work is the standard finite-Hamiltonian term $\int\operatorname{tr}(\rho(t)\,dH(t)/dt)\,dt$ and is kept explicitly; the net average over a completed reaction gate on this family is zero by (11). Its fluctuations, implementation losses and control-reference maintenance are distinct resource fields, not inferred to vanish from the mean identity.

The resolved reaction-label histories are exchanged by s/t and their assigned energies are equal. Any ledger explicitly defined as a label-blind function of those histories therefore has equal distributions. This does not establish equality of arbitrary coherent-gate work statistics or controller costs. Those need an independently specified symmetry-preserving implementation, with asymmetric product energies or bath couplings propagated as additional physical inputs.

### A finite thermal reset protocol

The source/control/record registers are finite. A concrete approximate reset of a $d$-level degenerate register can raise $d-1$ levels to $E_{\max}$, equilibrate against a bath at $T$, then return all levels to zero. The raising work is at most $E_{\max}$; lowering can be charged at zero extracted benefit. The Gibbs error outside the ready state is at most $(d-1)\exp(-E_{\max}/(k_BT))$. If the bath channel is explicitly specified as the refresh semigroup

$$
\Phi_t(\rho)=\exp(-\nu t)\rho+(1-\exp(-\nu t))\tau_G,
$$

then the trace distance to its Gibbs state is at most $\exp(-\nu t)$. To obtain total reset error $\le\epsilon$ for $r$ registers of dimension at most $d$, choose

$$
\begin{aligned}
E_{\max} &= k_BT \ln(2r(d-1)/\epsilon),\\
t_{\mathrm{reset}} &= \nu^{-1} \ln(2r/\epsilon).
\end{aligned}
\tag{12}
$$

Each register then has trace-distance reset error at most $\epsilon/r$, and the full product reset has error at most $\epsilon$ by telescoping. The total raising-work bound is $rE_{\max}$. For an actual record beginning with gap $E_{R}$, quench directly to $E_{\max}$: if its initial excited population is $p$, the quench work is $(E_{\max}-E_R)p$. If thermal refresh leaves excited population $p_{f}$, bath heat is $E_{\max}(p-p_f)$, and lowering the gap contributes work $-E_{\max}p_f$. These satisfy $W=\Delta E_{\mathrm{record}}+Q_{\mathrm{bath}}$ with $\Delta E_{\mathrm{record}}=-E_Rp$. Thus the original record excitation is neither omitted nor counted a second time; the upper raising-work budget $rE_{\max}$ remains valid. Equation (12) is a conditional channel-error and raising-work bound for the specified positive refresh rate $\nu$. The finite bath dilation below supplies a Hamiltonian/unitary at each chosen reset time; it does not supply an autonomous clock, restoration of the controller, or exact finite-temperature preparation of the pure fresh records. The finite CPTP construction starts with those ready records as explicit input resources; approximate resets supply approximate next trials.

**Fixed-time finite bath dilation.** For a specified $t>0$ put $p=\exp(-\nu t)$. Take a $d$-level bath ancilla $B$ in $\tau_{G}$ with the same raised Hamiltonian as the register $A$, and a two-level coin $C$ in $\operatorname{diag}(p,1-p)$. This coin is a Gibbs state at $T$ with energy difference $k_BT\ln[p/(1-p)]$ (a common offset makes both levels nonnegative). The controlled SWAP

$$
U=|0\rangle\langle 0|_C \otimes I_{AB} + |1\rangle\langle 1|_C \otimes \mathrm{SWAP}_{AB}
$$

commutes with $H_A+H_B+H_C$. Tracing $B,C$ gives exactly $\Phi_{t}$. This is an explicit finite energy-conserving bath unitary for each fixed $t$. The incoming Gibbs ancillas are reservoir resources; their outgoing energy and correlations belong to that reservoir ledger. A different $t$ may require a different coin state, so this construction does not realize the entire semigroup with one fixed finite autonomous bath.

For a register correlated with a reference, the same dilation gives $(\Phi_t\otimes\mathrm{id})(\rho)=p\rho+(1-p)\tau_G\otimes\rho_{\mathrm{ref}}$. The trace distance to $\tau_{G}\otimes\rho_{\mathrm{ref}}$ is at most $p$. Adding the Gibbs tail and telescoping proves the joint reset error used in (12), without an independence assumption on the incoming registers. The gate schedule and restoration of its clock/controller remain distinct owned resources.

For the displayed two-step protocol, the reaction records require $r=2,d=3$. Including preparation and readout adds their explicitly counted registers. The displayed raising-work and refresh-time bounds are finite. At $T=310$ K they can enter a metabolic test $E_{\mathrm{trial}}/t_{\mathrm{trial}}\le 0.2$ W once the additional control and bath costs have been populated. No finite total implementation cost or measured neuronal repetition rate follows before those entries are supplied.

## 5. Continuous-rate radical-pair family and dephasing

The conventional reaction model is obtained on $H_{\mathrm{car}}$ from

$$
\begin{aligned}
H &= (\hbar \Omega/2)X,\\
L_S &= \sqrt{\kappa}\,|P_S\rangle\langle S|,\\
L_T &= \sqrt{\kappa}\,|P_T\rangle\langle T|,\\
L_\phi &= \sqrt{\gamma/2}\,Z,
\end{aligned}
$$

where $\kappa>0$, $\gamma\ge 0$ and $Z$ vanishes on the product subspace. The GKLS generator is trace preserving. Its radical block obeys

$$
\begin{aligned}
\rho_R' &= -i[\Omega X/2,\rho_R]-\kappa \rho_R\\
&\quad +(\gamma/2)(Z\rho_R Z-\rho_R).
\end{aligned}
\tag{13}
$$

The trace of the radical block is exp(-kappa t). After dividing out that trace, its Bloch coordinates satisfy

$$
\begin{gathered}
x'=-\gamma x, \\
y'=-\gamma y-\Omega z, \\
z'=\Omega y,
\end{gathered}
$$

with initial $x=z=0$, $y=\eta c$. The infinite-time singlet yield is

$$
Y_S(c)=1/2 + \eta c \kappa \Omega/[2(\kappa(\kappa+\gamma)+\Omega^2)],
$$

$$
Y_T(c)=1-Y_S(c).
\tag{14}
$$

### Proof

Taking Laplace transforms of the y,z equations at $s>0$ gives

$$
\tilde z(s)=\eta c \Omega/[s(s+\gamma)+\Omega^2].
$$

The singlet reaction rate is $\kappa\exp(-\kappa t)(1+z(t))/2$. Integrating and using $\tilde z(\kappa)$ proves (14). Positivity and normalization follow independently from the full GKLS construction. QED.

The endpoint contrast is

$$
\begin{aligned}
D &= Y_S(+1)-Y_S(-1)\\
&= \eta \kappa \Omega/[\kappa(\kappa+\gamma)+\Omega^2].
\end{aligned}
\tag{15}
$$

For $\Omega\ge 0$ its maximum is attained at $\Omega=\sqrt{\kappa(\kappa+\gamma)}$, giving

$$
D_{\max}=(\eta/2)\sqrt{\kappa/(\kappa+\gamma)}.
\tag{16}
$$

A finite cutoff time T changes either yield by at most exp(-kappa T), because this is the total unrecombined probability. This is an absolute, fully populated tail bound.

For $\gamma=0$, $\Omega=\kappa$, $\eta=1/2$ and $T=2\pi/\kappa$, integration gives the exact three-outcome probabilities

$$
\begin{aligned}
Y_S(+1) &= (5/8)(1-\exp(-2\pi)),\\
Y_T(+1) &= (3/8)(1-\exp(-2\pi)),\\
Y_R(+1) &= \exp(-2\pi),
\end{aligned}
$$

with S and T interchanged at $c=-1$. The contrast is (1-exp(-2pi))/4.

These formulas quantify exactly how a supplied dephasing rate suppresses the response. The temperature alone does not determine $\gamma$, $\kappa$, $\Omega$ or $\eta$. No Ising critical exponent, macroscopic coherence time or neural field response is inferred from them.

## 7. Complete yield classification for finite spin-selective reaction models

The explicit instance extends to the entire following finite carrier class, including any specified finite nuclear-spin extension. Let $R=\mathbb{C}^d$ be the radical space, $H=H^*$ any Hamiltonian, $C_{l}$ any finite collection of internal noise jumps, and $L_a:R\to P_a$ spin-selective product jumps into mutually orthogonal absorbing product spaces. Set

$$
B_a=L_a^*L_a,\quad K=\sum_a B_a \ge \kappa_{\min} I,\quad \kappa_{\min}>0.
$$

The unrecombined generator is

$$
\begin{aligned}
G(\rho) &= -i[H/\hbar,\rho]+\sum_l(C_l \rho C_l^* - \{C_l^*C_l,\rho\}/2)\\
&\quad -\{K,\rho\}/2.
\end{aligned}
\tag{21}
$$

### Theorem RP2 (all finite reaction effects and certified tails)

There is exactly one tuple of effects $E_{a}$ solving

$$
G^*(E_a)=-B_a.
\tag{22}
$$

They satisfy $E_{a}\ge 0$ and $\sum_a E_a=I$. The exact complete chemical yield from any initial density matrix $\rho$ is

$$
Y_a(\rho)=\operatorname{tr}(E_a \rho).
\tag{23}
$$

Every finite-time omitted yield is bounded by $\exp(-\kappa_{\min}T)$. Thus a $d^{2}$-dimensional linear solve, with its certified inverse, determines every product response for every preparation in this class.

### Proof

The trace-decreasing CP semigroup $T_t=\exp(tG)$ is the radical compression of the full trace-preserving shelving-state GKLS semigroup. For $\rho\ge 0$,

$$
(d/dt)\operatorname{tr}(T_t \rho)=-\operatorname{tr}(K T_t \rho)\le -\kappa_{\min} \operatorname{tr}(T_t \rho).
$$

Gronwall gives $\operatorname{tr}(T_t\rho)\le\exp(-\kappa_{\min}t)\operatorname{tr}(\rho)$. Equivalently $T_t^*(I)\le\exp(-\kappa_{\min}t)I$, so the infinity-to-infinity norm (matrix operator norm on both domain and codomain) of the CP map $T_t^*$ is at most $\exp(-\kappa_{\min}t)$. Therefore the norm-convergent integrals

$$
E_a=\int_0^\infty T_t^*(B_a)\,dt
$$

are positive and satisfy (22). The same semigroup bound makes $-G^*$ invertible with inverse norm at most $1/\kappa_{\min}$. This proves uniqueness. Since $G^*(I)=-K$, uniqueness applied to the sum of (22) gives $\sum_a E_a=I$. Integrating the product creation rates proves (23). The total population still radical at $T$ is at most $\exp(-\kappa_{\min}T)$, and every omitted nonnegative product probability is no larger. QED.

### Corollary RP2a (exact response/resource identifiability)

Let $C_1,\ldots,C_s$ be fixed Hermitian resource observables. For the full state space, the yield $Y_{a}$ is the same for every pair $\rho,\sigma$ having equal $\operatorname{tr}(C_i\rho)=\operatorname{tr}(C_i\sigma)$ if and only if

$$
E_a \in \operatorname{span}_{\mathbb{R}}\{I,C_1,\ldots,C_s\}.
\tag{24}
$$

For necessity, any Hermitian $X$ orthogonal to $I$ and all $C_{i}$ gives two states $I/d\pm\epsilon X$ for sufficiently small $\epsilon$. Their resource values agree, so $\operatorname{tr}(E_aX)=0$. Orthogonality in the finite real Hermitian matrix space gives (24). Sufficiency follows by substitution. This is a coverage-complete finite operator criterion, rather than a selected list of examples.

### Corollary RP2b (outward perturbation propagation)

Suppose a second physical finite generator has $G'^*=G^*+D$ with the superoperator norm induced by matrix operator norm (infinity-to-infinity), $\lVert D\rVert\le\epsilon_G<\kappa_{\min}$, and $B'_a=B_a+\delta B_a$ with $\lVert\delta B_a\rVert\le\epsilon_B$. The inverse perturbation series and (22) give

$$
\lVert E'_a-E_a\rVert\le(\epsilon_B+\epsilon_G)/(\kappa_{\min}-\epsilon_G),
\tag{25}
$$

because $\lVert E_a\rVert\le 1$. Preparation error $D_{\mathrm{tr}}(\rho',\rho)\le\epsilon_\rho$ adds at most $\epsilon_{\rho}$ to a probability error for a physical effect $E'_a$. A finite observation time adds $\exp(-\kappa_{\min}T)$, or the corresponding certified bound for the perturbed reaction floor. Every term is charged once.

To verify the probability-preparation term, use $0\le E'_a\le I$ and the variational definition of trace distance. To verify (25), subtract the two effect equations:

$$
G'^*(E'_a-E_a)=-\delta B_a-D(E_a),
$$

and bound $\lVert(G'^*)^{-1}\rVert\le 1/(\kappa_{\min}-\epsilon_G)$.

This supplies the exact finite comparison mechanism needed to test additional molecular H, hyperfine, exchange, reaction and noise records when they are furnished. The positive reaction floor is a stated coverage boundary; trapped/nonreacting sectors require a separate survival-effect branch.

### Full electron/nuclear molecular spin and matched-input class

## 2. Typed full-spin model

The following is our explicit CP realization of that source-informed kinetic model. Time is measured in microseconds and fields in millitesla. Define

$$
R = \mathbb{C}^2_{e_1} \otimes \mathbb{C}^2_{e_2} \otimes \mathbb{C}^3_{n_1} \otimes \mathbb{C}^3_{n_2},\quad d=36.
$$

The electron spin operators $s_{i}$ are Pauli/2; each nuclear spin $I_{i}$ is the standard spin-1 representation with $I_z=\operatorname{diag}(1,0,-1)$. Tensor factors absent from an expression carry identities. Let $Q_{S}$ be the electronic singlet projector $\otimes I_9$, $Q_T=I-Q_S$, and set

$$
\begin{gathered}
h(B)=\gamma[B(s_{1z}+s_{2z})+a_1s_1\cdot I_{1}+a_2s_2\cdot I_{2}], \\
\gamma=2\pi\times 28,\quad a_1=0.51,\quad a_2=0.32.
\end{gathered}
$$

Here $h=H/\hbar$ has inverse-microsecond units. Its matrix is real symmetric in the product-$z$ basis, including the products of two imaginary $y$-spin matrices.

The internal jump operators are the six $\sqrt{r}\,s_{i,\alpha}$ and $\sqrt{2s}\,Q_S$. Put

$$
\begin{aligned}
&k_S=3.6,\quad k_f=1,\quad r=8.2,\quad s=1400,\\
&K=k_S Q_S+k_f I,\\
&G(\rho)=-i[h,\rho]+\sum_l D[C_l](\rho)-\{K,\rho\}/2.
\end{aligned}
\tag{M1}
$$

The dephasing jump gives exactly $-s(Q_S\rho Q_T+Q_T\rho Q_S)$. Each product channel has its own orthogonal absorbing copy: a 9-dimensional singlet-product space and a 36-dimensional forward-product space. Their jumps are $\sqrt{k_S}$ times the isometry on the singlet subspace and $\sqrt{k_f}$ times the isometry on $R$. This yields a finite 81-dimensional shelving-state GKLS carrier. A GKLS semigroup is a specified effective open-system law; this finite carrier dimension does not assert a finite autonomous bath realization for all times.

The reaction effects are the unique solutions

$$
G^*(E_S)=-k_S Q_S,\quad E_f=I-E_S.
\tag{M2}
$$

Theorem RP2 proves $0\le E_S\le I$, exact yields $\operatorname{tr}(E_S\rho)$, and omitted reaction probability at time $T$ at most $\exp(-T)$. At $T=20$ microseconds the exact bound is $\exp(-20)$. This gives a response-complete model for every initial density operator on $R$. It does not infer the actual molecular preparation from the electronic triplet label alone.

## 3. Theorem M1: exact matched-input response in the molecular spin class

More generally let $k_S,k_f>0$, $r\ge 0$, $s\ge 0$, let $h$ be the real Hamiltonian above with at least one nonzero hyperfine coefficient, and let $E=E_S$ solve (M2). Then

$$
W=(E-\overline{E})/2 \text{ is nonzero}.
\tag{M3}
$$

Consequently, for $\delta=1/(2d\lVert W\rVert)$, the two states

$$
\rho_+=I/d+\delta W,\quad \rho_-=I/d-\delta W
\tag{M4}
$$

are strictly positive, complex conjugates and have exactly the same spectrum, entropy, purity, electronic singlet/triplet populations, and expectation of every real symmetric observable, including h. Their singlet-yield difference is strictly positive:

$$
\operatorname{tr}[E(\rho_+-\rho_-)]=2 \delta \operatorname{tr}(W^2)>0.
\tag{M5}
$$

The equality of all real observables supplies a precise matched-input class. Preparation implementations, the later product-record entropy, and their work/heat statistics require their own resource records.

### Proof

Write $G^*=i[h,\cdot]+D$, where $D$ contains the internal dissipators and reaction loss. Every coefficient of $D$ maps real matrices to real matrices: $s_x,s_z,Q_S$ are real, and $s_{y}$ is purely imaginary so its quadratic dissipator is real. $D$ has the same positive reaction floor $k_{f}$ as $G$, hence is invertible by the proof of RP2.

Suppose $W=0$. Then $E$ is real symmetric. Since $D(E)$ and $-k_SQ_S$ are real, the imaginary part of (M2) implies $[h,E]=0$. The real part implies $D(E)=-k_SQ_S$.

The unique solution of this latter equation is explicitly

$$
\begin{aligned}
E_D &= u Q_S+v Q_T,\\
v &= r u/(r+2 k_f),\\
u &= k_S / [k_S+k_f+3 r k_f/(r+2 k_f)].
\end{aligned}
\tag{M6}
$$

To verify it, sum the six electron-spin terms on $Q_{S}$. Each electron spin sends the singlet to the corresponding triplet with amplitude magnitude 1/2, so

$$
\begin{aligned}
\sum_{i,\alpha} s_{i,\alpha} Q_S s_{i,\alpha} &= Q_T/2,\\
\sum_{i,\alpha} s_{i,\alpha}^2 &= 3I/2.
\end{aligned}
$$

Thus the random-field dissipator on $Q_{S}$ is $r(Q_T/2-3Q_S/2)$, its value on $I$ is zero, and the singlet-triplet dephasing term vanishes on $uQ_S+vQ_T$. The reaction terms give

$$
\begin{aligned}
D(E_D) &= [-3r(u-v)/2-(k_S+k_f)u]Q_S\\
&\quad +[r(u-v)/2-k_f v]Q_T.
\end{aligned}
$$

Substitution of (M6) proves $D(E_D)=-k_SQ_S$. Invertibility proves $E=E_D$. But $u>v\ge 0$, whereas $[h,Q_S]$ is nonzero: its $S$-to-$T_0$ block contains the nonzero nuclear operator $\gamma(a_1I_{1z}-a_2I_{2z})/2$. Therefore $[h,E_D]=(u-v)[h,Q_S]$ is nonzero, contradicting $[h,E]=0$. This proves (M3).

$W$ is Hermitian and purely imaginary, with zero diagonal and trace. Its spectral norm bounds (M4) below by $I/(2d)$. Complex conjugation exchanges the two states, preserving their eigenvalues. For every real symmetric $A$, $\operatorname{tr}(AW)=0$ because $W$ is imaginary antisymmetric, proving the matched observable claims. Writing $E=\operatorname{Re}(E)+W$ gives $\operatorname{tr}(EW)=\operatorname{tr}(W^{2})>0$, proving (M5). QED.

### Scope of this advance

M1 establishes exact response inequivalence inside a complete molecular spin class with all electronic and two specified nuclear sectors retained. Its input states are explicit operator formulas. The finite low-field pumping, formation, current and material-transport constructions below supply a constructively reachable matched-control family in the declared formal molecular model, without full control of M1's effect-defined states. Identification with the paper's measured source state is a separate empirical assertion.

### Existing exact rational generator certificate assembly

At the molecular proof's declared reference field $B=10\,\mathrm{mT}$, the exact certificate assembly is as follows. The low-field source below varies only the explicitly specified rational Zeeman diagonal.

A rational Hermitian candidate $\hat E$ has real and imaginary entries equal to integers divided by $M=10^{14}$. The four complete low-field candidate matrices and their residual bounds are specified in [the reaction-effect matrix tables](../related/calculation_companions/appendix_l/l4-2c-reaction-and-transport-tables.md#reaction-effect-matrices) and [reaction residual tables](../related/calculation_companions/appendix_l/l4-2c-reaction-and-transport-tables.md#reaction-residual-bounds). The residual proof uses the integer generator assembly and rational intervals below, independently of how the candidate was selected.

Let $P$ be the electronic SWAP $\otimes$ nuclear identity, so $Q_S=(I-P)/2$. In the product-$z$ basis,

$$
h=(\pi/100)(A+\sqrt{2}\, C),
$$

where $A,C$ are integer matrices. For basis $(e_1,e_2,m_1,m_2)$, $e_i=\pm 1/2$ and $m_{i}\in\{1,0,-1\}$,

$$
A_{jj}=5600[10(e_1+e_2)+(51/100)e_1m_1+(32/100)e_2m_2].
$$

C connects simultaneous electron/nuclear flip-flops on molecule 1 with entry 1428 and on molecule 2 with entry 896. All other entries are zero. Thus the generator assembly is algebraic, not inferred from numerical agreement.

For an integer real or imaginary candidate matrix $V=M\operatorname{Re}(\hat E)$ or $M\operatorname{Im}(\hat E)$, define

$$
\begin{aligned}
D_{20}(V) &= 41 \sum_{i,\alpha} \sigma_{i,\alpha} V \sigma_{i,\alpha}\\
&\quad -14302 V+14000 PVP+18(PV+VP).
\end{aligned}
$$

The imaginary Pauli factors are represented by integer real antisymmetric matrices with their exact $i^{2}$ sign. Then

$$
\begin{aligned}
&G^*(\hat E)+k_S Q_S\\
&\quad = [5 D_{20}(M \hat E)+180M(I-P)\\
&\qquad +i \pi([A,M \hat E]+\sqrt{2}[C,M \hat E])]/(100M).
\end{aligned}
\tag{M10}
$$

Enclose $\pi$ using Machin's identity $16\arctan(1/5)-4\arctan(1/239)$ and alternating-series rational remainders. It encloses $\sqrt{2}$ between adjacent rational numbers obtained by an integer square root of $2\times 10^{160}$. Entrywise rational bounds and $\lVert R\rVert\le 36\max_{ij}|R_{ij}|$ certify the residual below $10^{-7}$ per microsecond. The exact reaction-floor inverse bound gives $\lVert\hat E-E_S\rVert<10^{-7}$. The actual computed rational bound is approximately $1.045\times 10^{-9}$; only proved rational comparisons are used.

### Finite low-field pumping, formation, currents and response

## 1. Native response effect

Use the 36-dimensional radical carrier and source-informed generator $G_{B}$ defined by (M1)–(M2) in the full electron/nuclear molecular construction above, including all four electron states, two spin-1 nuclei, hyperfine terms, random-field relaxation, singlet/triplet dephasing, singlet reaction and forward reaction. All displayed rates have inverse-microsecond units. Let

$$
\begin{aligned}
&J_S=3.6\, Q_S,\quad K=3.6\, Q_S+I\ge I,\\
&G_B^*(E_B)=-J_S,\\
&\rho_T=Q_T/27.
\end{aligned}
\tag{L1}
$$

For every $B$ the exact eventual singlet yield is $y(B)=\operatorname{tr}(E_B\rho_T)$. Native reaction survival is bounded by $\exp(-t)$, with $t$ in microseconds.

The controls change only the uniform Zeeman term:

$$
\begin{aligned}
h_B &= \gamma[B(s_{1z}+s_{2z})+0.51\, s_1 \cdot I_1+0.32\, s_2 \cdot I_2],\\
\gamma &= 2\pi \times 28\ \text{per microsecond per mT}.
\end{aligned}
\tag{L2}
$$

The plus/minus apparatus has the same carrier, source state, field-coil geometry, absolute control-current waveform, noise, reaction rates, clock window and readout operator. Its total fields are 9 and 11 mT (or 9.9 and 10.1 mT).

### Theorem L1: exact native low-field contrast

For the stated model,

$$
\begin{gathered}
0.001210<y(9)-y(11)<0.001212, \\
0.000121<y(9.9)-y(10.1)<0.000122.
\end{gathered}
\tag{L3}
$$

The same intervals remain valid for the finite formation/readout protocols below.

**Proof certificate.** The [reaction residual certificates](../related/calculation_companions/appendix_l/l4-2c-reaction-and-transport-tables.md#reaction-residual-bounds) and [complete matrix tables](../related/calculation_companions/appendix_l/l4-2c-reaction-and-transport-tables.md#reaction-effect-matrices) specify a rational Hermitian candidate $\hat E_B$ for each of the four fields. Substitution bounds each adjoint-equation residual using the exact integer generator assembly (M10), Machin-series rational bounds for $\pi$, and integer-square-root bounds for $\sqrt{2}$. $B$ is rational in every case, so the diagonal Hamiltonian matrix remains rational/algebraic exactly. The positive reaction floor gives

$$
\lVert\hat E_B-E_B\rVert\le\lVert G_B^*(\hat E_B)+J_S\rVert.
$$

The candidate yields $\operatorname{tr}(\hat E_BQ_T/27)$ are rational. Their outward intervals, including the finite-source tails, prove (L3). The complete Hermitian matrices, exact yields and residual bounds are specified in those calculation tables. Every residual comparison is rational. QED.

## 2. Finite kinetic source formation

Adjoin a nine-dimensional spinless excited precursor sector $g$, retaining the two nuclear factors, and a four-state record consisting of spin-0 $|\mathrm{ready}\rangle$ and spin-1 states $r_{m}$. Define the isometry

$$
V |g,n,\mathrm{ready}\rangle = \sum_{m=-1}^1 (-1)^{1-m}|T_m,n,r_{-m}\rangle/\sqrt{3}.
\tag{L4}
$$

It maps electron-plus-record total spin zero to total spin zero and preserves the nuclear label n. The nuclear state itself need not have total spin zero. The finite formation jump is

$$
L_{\mathrm{form}}=\sqrt{b}\, V,\quad b=2\ \text{per microsecond}.
\tag{L5}
$$

Native spin, noise and reaction operators act on the radical sector and extend by zero to the precursor, with identity on the record. The full shelving carrier including products, precursor and record has dimension 360. Initially the precursor nuclear state is $I_9/9$ and the record is ready. Formation then occurs at an exponential waiting time with rate $b$. After formation the reduced radical state is exactly $\rho_{T}$. The record is retained as an owned memory; tracing it for the spin calculation is legitimate because subsequent operations act identically on each record sector.

For a field held fixed during the trial, each formation time produces the same eventual yield $y(B)$. Hence the complete eventual source yield is $y(B)$, without a rapid-formation approximation. At finite time $T$ the unresolved probability is bounded by

$$
\begin{aligned}
&\exp(-bT)+\int_0^T b \exp(-bs) \exp(-(T-s))\, ds\\
&\quad =2 \exp(-T)-\exp(-2T) <2 \exp(-T).
\end{aligned}
\tag{L6}
$$

All native terms remain active after each formation event. With $T=20$ microseconds, the two-arm correction is below $4\exp(-20)$. This correction is included in the rational certificate for (L3).

The control fields can be established with finite ramps before the trial and held steady during formation/readout. The spinless precursor and thermal nuclear identity do not encode a hidden phase during that setup. A finite-rate formation source replaces an instantaneous density-matrix preparation.

## 3. Finite pumping from a stable initial precursor

For a source beginning before optical excitation, add a stable spinless ground precursor $g_{0}$ with the same nine nuclear states. A finite optical-pump jump maps

$$
\lvert g_0,n,\mathrm{ready}\rangle\to\lvert g,n,\mathrm{ready}\rangle
$$

at rate $a=10^{-4}$ per microsecond $=100$ per second. The photon reservoir owns the excitation energy. Together with (L5) and the native dynamics, this is a finite GKLS source of dimension $(81+9+9)\times 4=396$. It starts from the stable precursor state with thermal nuclear identity and a ready record. Its eventual yield remains $y(B)$: both preparatory transitions occur with probability one before the radical response.

A declared effective pump rate is a source parameter; it is not inferred solely from illumination intensity. This model includes the optical pumping as an explicit reaction rather than assuming a pre-existing radical. The chemistry and source rate must be matched to a specimen only when that stronger empirical identification is claimed.

The total unresolved probability is dominated by the sum of independent waiting times with rates a, $b=2$ and $\kappa=1$. The radical stage is stochastically no slower than its rate-1 exponential survival bound. For distinct positive rates a,b,kappa, convolution gives

$$
\begin{aligned}
P_{\mathrm{unresolved}}(T) &\le \sum_{r \in \{a,b,\kappa\}}\\
&\quad \Bigl[\prod_{s \ne r} s/(s-r)\Bigr] \exp(-rT).
\end{aligned}
\tag{L7}
$$

For $a=10^{-4},b=2,\kappa=1$, the coefficient of $\exp(-\kappa T)$ is negative. Dropping it bounds (L7) above by the other two positive terms. Their coefficient sum is less than 1.001. At $T=200000\,\text{microseconds}=0.2\,\text{seconds}$,

$$
P_{\mathrm{unresolved}}(T)<1.001 \exp(-20).
\tag{L8}
$$

Thus the two-arm finite-pump correction is below $2.002\exp(-20)$, smaller than the $4\exp(-20)$ already included in the saved certificate. Both finite source protocols therefore satisfy (L3).

## 4. Source, target, energy and reset ownership

The target is the singlet-product label projector. Product labels are stable once formed; a finite ready memory can copy the orthogonal labels by a controlled unitary. This is the explicitly typed chemical target. A separate neuronal, membrane or behavioral target requires its own response map.

Assign a declared precursor/radical excitation offset $E_{R}$ (for example 3 eV) and declared product energies $E_S,E_F\in[0,E_R]$. The pump reservoir supplies $E_{R}$ on each successful ground-to-excited transition. Formation preserves the assigned offset; the reduced triplet/nuclear source has zero mean of the traceless native spin Hamiltonian. Any formation-bath energy fluctuations remain owned by that bath. Product retention is $E_SY_S+E_FY_F$ and is entered once. Internal-noise and chemical-reaction heat is computed from the same generator as

$$
\dot Q_{\mathrm{to\,system}} = \sum_l \operatorname{tr}[H\, D[L_l](\rho)].
\tag{L9}
$$

External switching work is $\operatorname{tr}(\rho\dot H)$. These definitions give the first-law identity by differentiating $\operatorname{tr}(H\rho)$; no product energy is counted again as heat. The two arms have identical initial source, pump rate and absorbed-pump count distribution. They can have different product retention and heat, which are response outputs rather than silently assumed matched controls.

The control fields are established before pumping. Initial mean spin switching work is zero on the spinless source. Turning the control field off after readout, while retaining the common bias, contributes at most the control-Hamiltonian norm times the surviving source probability, plus any separately specified product magnetic moment. In the label-only absorbing-product model the latter is zero. A product magnetic Hamiltonian may be added without changing label probabilities, but its energy must then be retained in (L9).

The control norm at 1 mT is $\hbar\gamma\times 1\,\mathrm{mT}$, approximately $1.16\times 10^{-7}$ eV, well below the chemical offset. It is approximately $1.16\times 10^{-8}$ eV for the 0.1 mT controls. There is no short-pulse high-field approximation.

The angular-momentum record has a spin-0 ready state and a spin-1 output sector. It is an explicit one-use low-entropy resource. Repeated use can employ the fixed-time finite Gibbs bath dilation given earlier in this proof, with $d=4$ and its actual gap-switch work. Each reset error is added once to the probability interval. For instance, a total preparation/readout/reset trace-distance error below $10^{-5}$ per arm still leaves the 1 mT contrast strictly positive with a large margin. The clock schedules finite ramps, a finite pump/reaction interval and finite readout; an autonomous restored clock is a stronger separately owned implementation, not silently supplied by a waveform.

## 5. Finite current source and matched field resources

A concrete source model uses closed toroidal wires carrying axisymmetric currents. The common bias source has 1,000 circular centerlines:

$$
\begin{aligned}
&r_j=(1.05+0.10j)\ \mathrm{mm},\quad j=0,\ldots,9,\\
&z_k=(k-49.5)\,0.10\ \mathrm{mm},\quad k=0,\ldots,99.
\end{aligned}
$$

The control source has 200 loops at radii 2.05 and 2.15 mm with the same axial positions. Every wire has circular cross-section radius $w=49$ micrometers. The declared conductivity satisfies $\sigma\ge 5\times 10^{7}$ S/m; permeability is supplied in the broad interval $[1.25,1.27]\times 10^{-6}$ H/m. Current density is azimuthal and uniform across each wire section. It is divergence-free, with finite support, finite resistive power and finite field energy. The external electromotive source owns the work needed to maintain that specified current.

For a zero-width centerline loop, the center-field/current coefficient is

$$
k(r,z)=\mu_0 r^2/[2(r^2+z^2)^{3/2}].
\tag{L10}
$$

Finite-wire averaging changes the total coefficient by at most 0.6%. To verify that bound, put $f(r,z)=r^{2}/(r^{2}+z^{2})^{3/2}$. Its Hessian operator norm is at most $(33/4)/(r^{2}+z^{2})^{3/2}$. A symmetric circular cross-section has zero first moment and mean squared radius $w^{2}/2$. Taylor's theorem therefore gives the relative average error at most

$$
\begin{aligned}
&(33/16)(w/r_{\min})^2/(1-w/r_{\min})^3 <0.006,\\
&r_{\min}=1.05\ \mathrm{mm}.
\end{aligned}
\tag{L11}
$$

The wire's resistive power is exactly $I^{2}R$ in this current-density model, with

$$
R=2 \sum_{\mathrm{loops}} r/[\sigma w^2].
\tag{L12}
$$

The cancellation of $\pi$ follows from loop length $2\pi r$ and wire area $\pi w^{2}$. The two coil resistances, field coefficients and required currents are bounded using the exact rational geometry and integer-square-root enclosures. Their input and bound values are given in [the finite-current tables](../related/calculation_companions/appendix_l/l4-2c-reaction-and-transport-tables.md#current-geometry-spatial-bounds). The calculation includes (L11), and certifies

$$
P_{\mathrm{bias}}+P_{\mathrm{control}} <0.2\ \mathrm{W}
\tag{L13}
$$

for 10 mT bias and 1 mT control. The computed rigorous upper bound is approximately 0.19016904 W. The declared model therefore has explicit power headroom for additional assigned source losses; it does not assign all real apparatus overhead zero by inference.

The two control currents are opposite, with equal magnitude at every point in the fixed ramp/hold waveform. Their Joule losses are exactly equal. Bias current and bias losses are common. The mutual field-energy term changes sign during setup, but both current cycles return to zero quasistatic coil storage, so the mutual storage change over the cycle is zero; outgoing ramp radiation remains separately owned. Field/source work, molecular retention and reaction heat must be compared through the complete cycle ledger, rather than treating the mutual energy as radiated loss. Ramps can be made slow enough to respect any remaining positive power margin because the finite-wire field energy is finite; this does not change the steady-field reaction interval.

### Mutual storage and complete-cycle work

Let $B_{B}$ and $B_{C}$ denote the unit-current fields of the actual finite bias and control windings. Define their finite inductance coefficients by

$$
\begin{aligned}
L_B&=\mu_0^{-1}\int|B_B|^2\,dx,\\
L_C&=\mu_0^{-1}\int|B_C|^2\,dx,\\
M&=\mu_0^{-1}\int B_B\cdot B_C\,dx.
\end{aligned}
$$

Finite wire cross-sections make these integrals finite; Cauchy-Schwarz gives $|M|\le\sqrt{L_BL_C}$. At the held currents the actual magnetic storage is

$$
U_c=1/2\, L_B I_B^2+1/2\, L_C I_C^2+c M I_B I_C,\quad c=+1,-1.
$$

Thus $U_+-U_-=2MI_BI_C$. Equal Joule loss does not imply equal held-field energy. The two input programs start from the same zero-field state and the same charged work-reservoir state. Setting up their fields draws different reversible storage work; the remaining reservoir energy must be retained with the field rather than dropping that difference. A common finite reservoir capacity/budget covers the larger draw. Its branch-dependent actual draw is not declared equal.

For each complete finite current cycle, returning both windings to zero restores zero quasistatic coil storage. An outgoing radiation pulse can still occupy space at that finite endpoint and is retained in $E_{\text{ramp-radiation}}$, as either outgoing field energy or already crossed flux. The exact Poynting ledger is

$$
W_{\mathrm{drive},c}=Q_{\mathrm{Joule}}+E_{\text{ramp-radiation},c}+W_{\mathrm{molecule},c}+\Delta U_{\text{other-owned},c}.
$$

Here the quasistatic coil-storage change over the complete cycle is zero, including the mutual term; the propagating field is already retained in $E_{\text{ramp-radiation}}$. The disjoint wire supports and opposite equal-magnitude control waveforms prove exact equality of $Q_{\mathrm{Joule}}$. Radiation emitted by the finite ramps can have a sign-dependent interference term and is retained separately. Likewise, molecular switching work and later chemical retention/heat are response outputs; no equality of all realized work records is asserted. An energy-recovering drive returns the reversible storage to its work reservoir; a dissipative discharge must instead charge that energy to its actual dump and cannot claim the same ledger.

There is an explicit common finite bound for ramp radiation. Write $J_c(x,t)=f(t)J_c^0(x)$, with a common smooth ramp/hold/ramp envelope. Closed azimuthal currents obey $\int J_c^0\,dx=0$. If $M_1\ge\int|x||J_c^0(x)|\,dx$ is a common bound, the exact far-field expression and Minkowski's inequality give

$$
E_{\text{ramp-radiation},c}\le\mu_0 M_1^2/(4\pi c_{\mathrm{light}}^3)\int|f''(t)|^2\,dt.
$$

Indeed subtract $f'(t)\int J_c^0=0$ from the retarded-current integral, apply the fundamental theorem of calculus to $f'(t+n\cdot x/c_{\mathrm{light}})-f'(t)$, and then its $L^{2}$ time bound. Integrating over solid angle gives the displayed constant. For two quintic ramps $f(s)=10s^{3}-15s^{4}+6s^{5}$ of duration $\tau_{r}$ each, the last integral is $240/(7\tau_r^{3})$. The actual compact coil geometry has $|x|<6$ mm and $\int|J_c^0|\,dx=2\pi\sum_{\mathrm{loops}}|I_{\mathrm{loop}}|r_{\mathrm{loop}}$, so the already certified current bounds give a finite common $M_{1}$. Increasing a common finite ramp duration suppresses this separately owned radiation without changing the held-field reaction certificate.

Accordingly the exact matched record consists of the specified initial source and work-reservoir resources, common bias, equal-magnitude control program, common duration/budget, and equal Joule dissipation. The branch-dependent field storage, reversible work transfers, ramp radiation and molecular heat/work are explicitly resolved. A comparison that additionally demands equal held-field storage or equal actual total drive work would require another source construction or its declared matching tolerance; that equality is not used by this response theorem.

### Actual finite-source spatial field

Retain the actual finite-wire Biot–Savart field at each electron coordinate $x_{i}$, with the declared source coordinates satisfying $|x_i|\le a=5$ nm. This statement is uniform over those positions and does not identify coordinates of a particular specimen. The entire source ball is more than $d=1$ mm from every current element. Axial symmetry and reflection symmetry of the winding imply $\nabla B(0)=0$. For $F(z)=z/|z|^{3}$ and a unit vector $v$,

$$
\begin{gathered}
D^{2}F(z)[v,v]=-6v(z\cdot v)/|z|^{5}-3z/|z|^{5}+15z(z\cdot v)^{2}/|z|^{7}, \\
\lVert D^{2}F(z)[v,v]\rVert\le 24/|z|^{4}.
\end{gathered}
$$

Taylor's integral remainder in the Biot–Savart expression therefore gives

$$
\begin{aligned}
&\sup_{|x|\le a} |B(x)-B(0)|\\
&\quad \le (12 \mu_0/(4\pi))\, a^2 d^{-4} \int |J(y)|\,dy\\
&\quad =6 \mu_0 a^2 d^{-4} \sum_{\mathrm{loops}} |I_{\mathrm{loop}}|\, r_{\mathrm{loop}}.
\end{aligned}
\tag{L14}
$$

The last equality holds exactly for the uniform azimuthal current densities: their cross-sectional first radial moment is the centerline radius. Summing bias and control currents by absolute value bounds both control signs. The rational current bounds in [the finite-current tables](../related/calculation_companions/appendix_l/l4-2c-reaction-and-transport-tables.md#current-geometry-spatial-bounds) give a field error below $2.76\times 10^{-11}$ T.

For the actual two-electron Hamiltonian this yields

$$
\begin{gathered}
\lVert\delta h\rVert\le\gamma\times 1000\,\delta B, \\
\lVert\delta G^*\rVert_{\infty\to\infty}\le 2\lVert\delta h\rVert.
\end{gathered}
\tag{L15}
$$

Here $\gamma=56\pi<176$ in the units of (L2). Both the center-field and actual spatial generators have the same reaction floor $\kappa=1$ per microsecond. Applying the actual-generator inverse to the center-effect residual gives

$$
\lVert E_{\mathrm{actual}}-E_{\mathrm{center}}\rVert\le 2\lVert\delta h\rVert/\kappa.
\tag{L16}
$$

This stationary effect bound does not grow with the optical-pump waiting time. The finite source tails remain (L6)/(L8), because the spatial perturbation is Hamiltonian. The exact rational coil certificate proves a per-arm yield error below 9.72 parts per million. Together with the already tail-corrected (L3), the actual spatial-source comparison satisfies

$$
\begin{aligned}
&P_S(\text{control } -1\ \mathrm{mT})-P_S(\text{control } +1\ \mathrm{mT})>0.001190,\\
&P_S(\text{control } -0.1\ \mathrm{mT})-P_S(\text{control } +0.1\ \mathrm{mT})>0.000100.
\end{aligned}
\tag{L17}
$$

Thus the source region and finite current geometry are included in the response certificate. Microscopic lead, driver, optical-readout and thermal-extraction restrictions belong in the resource map when those additional devices are included in the admitted implementation.

### Spatial material carrier, receiver and complete finite-ramp bound

## 1. Source, spatial channel and target

Use the finite pumped source with the same initial precursor/nuclei, matched controls and actual finite-coil fields as (L1)–(L17) in the low-field construction above. At source time $T_{s}=0.2$ s, its singlet-product probability difference obeys

$$
p_S^-(T_s)-p_S^+(T_s)>0.001190.
\tag{C1}
$$

Every source arm has unresolved precursor/radical probability below

$$
\epsilon_s=1.001 \exp(-20).
\tag{C2}
$$

After $T_{s}$, turn off both the local opposite control fields and the common bias with the same finite ramp duration $\tau_{r}$. All native reactions remain active. For the declared neutral divergence-free compact coil currents, wait an additional 1 ns after the currents become zero. The maximum coil-to-transport-region distance is below 1 cm, so every retarded current argument then lies after switch-off; the impressed-current Maxwell field is exactly zero throughout the transport region. This finite settling interval is part of $\tau_{r}$. Thereafter use the same zero-external-field chemical generator in both arms and begin the material-transport clock. Switching work for the full bias-plus-control term is charged to the source; its molecular contribution is bounded by $\epsilon_{s}\int\lVert\dot H_{\mathrm{field}}(t)\rVert\,dt$, since the product sectors are field-independent. For an exactly common monotone field-amplitude envelope this reduces to $\epsilon_s\lVert H_{\mathrm{field}}(\mathrm{initial})\rVert$; the integral is the general finite-ramp ledger bound. Stable products keep their label, and all additional singlet yield is bounded by the unresolved probability (C2). Thus at any later time

$$
p_S^-(T_s+\tau_r+t)-p_S^+(T_s+\tau_r+t)>0.001190-\epsilon_s.
\tag{C3}
$$

No instantaneous freezing or rejection of the residual source is needed.

Adjoin the molecule's finite material-position register X with three physical locations

$x_0=0$, $x_1=\ell$, $x_2=2\ell$,
$\ell=10$ nm.

The source location is $x_0$; $x_2$ is a receiver-bound state with a finite unbinding rate. The chemical Hilbert space is carried unchanged by each positional jump. Declare the diffusion input $D=10^{-10}\,\mathrm{m^2/s}$ and

$$
k=D/\ell^{2}=10^{6}\ \text{per second}.
$$

The explicit position jump operators are

$$
\begin{aligned}
L_{10} &= \sqrt{k}\,|1\rangle\langle 0|,\\
L_{01} &= \sqrt{k}\,|0\rangle\langle 1|,\\
L_{21} &= \sqrt{k}\,|2\rangle\langle 1|,\\
L_{12} &= \sqrt{k \eta}\,|1\rangle\langle 2|,\quad \eta=10^{-6}.
\end{aligned}
\tag{C4}
$$

Each is tensored with the identity on the complete chemical source carrier. The receiver unbinding rate is $k\eta=1$ per second, and is retained during the finite observation window. These are local matter hopping/capture operators; no field-propagation amplitude enters them. The two neighboring jumps $0\leftrightarrow1$ are the symmetric diffusion part, and $1\leftrightarrow2$ is reversible receptor capture/release. A finite trap/readout reset is a resource of the receiver.

The channel is a finite trace-preserving GKLS evolution. The stable-product dynamics is the identity on its chemical label and commutes with the position channel. Residual radical chemistry may retain its actual position-dependent magnetic terms; its entire probability is bounded by (C2). The finite source-plus-position carrier has dimension $3\times 396=1188$ for the fully pumped construction. Start $X$ in $|0\rangle\langle 0|$ in both arms. The receiver outcome effect is

$$
E_{\mathrm{receive},S}=P_S \otimes |2\rangle\langle 2|,
\tag{C5}
$$

with the complementary outcomes singlet/not-arrived, other chemical labels/arrived, and other/not-arrived. Their probabilities sum to one. This explicitly identifies both the source chemical operator $P_{S}$ and the spatial target operator.

## 2. Exact finite delivery probability

First set $\eta=0$ as a reference process. Its transient position generator on {0,1}, using column probabilities, is

$$
Q_X=k\begin{bmatrix} -1 & 1\\ 1 & -2 \end{bmatrix}.
\tag{C6}
$$

Starting at 0, the total transient probability is

$$
\begin{aligned}
s_X(t) &= \exp(-3kt/2)[\cosh(\sqrt{5}kt/2)\\
&\qquad +(3/\sqrt{5})\sinh(\sqrt{5}kt/2)].
\end{aligned}
\tag{C7}
$$

The reference delivery probability is $h_0(t)=1-s_X(t)$. Both the exact matrix exponential and direct substitution into the two Kolmogorov equations verify (C7). In particular $h_{0}$ is strictly between zero and one for every $t>0$.

For $t=20$ microseconds, $kt=20$. Using $2<\sqrt{5}<2.237$ gives

$$
\begin{aligned}
s_X(t) &< (5/4)\exp[-(3-2.237)20/2]\\
&= (5/4)\exp(-7.63)<0.001.
\end{aligned}
\tag{C8}
$$

The last inequality follows from the finite Taylor lower bound $\exp(7.63)>1250$, so it can be certified using rational arithmetic. Therefore $h_0(t)>0.999$. Couple the actual reversible process to this reference until its first receiver-release event. The total release hazard is at most $k\eta$, so the probability that the two paths differ is at most $k\eta t=2\times 10^{-5}$. The actual bound-state occupation $h(t)$ therefore satisfies $h(t)>0.99898$. This comparison retains the actual finite unbinding process rather than taking an irreversible zero-temperature limit.

The source state at $T_{s}$ is block diagonal between its absorbing product sectors and the unresolved sector: this follows directly from the initial precursor state and the orthogonal reaction jumps. The stable singlet-product block has trace $p_S^c(T_s)$. Its subsequent chemical dynamics is the identity, its initial position is $|0\rangle\langle 0|$, and (C4) acts as identity on the chemical label. On this block the exact generator is therefore identity $\otimes G_{\mathrm{position}}$; exponentiation gives the position channel. Taking (C5) yields the exact stable contribution $h(t)p_S^c(T_s)$.

All products formed after $T_{s}$, including during the finite field ramp or after spatial motion, arise from the unresolved block with total trace at most $\epsilon_{s}$. Complete positivity and trace preservation keep its receiver probability between zero and $\epsilon_{s}$. Hence the actual response has the exact decomposition

$$
P_{\mathrm{receive},S}^c=h(t)p_S^c(T_s)+r_c,\quad 0\le r_c\le\epsilon_s.
\tag{C9}
$$

This proves the required factorization on the transmitted stable chemical sector, while bounding the entire residual sector without imposing an unphysical position-independent field on it. A fully factorized post-source chemical model is an optional special case, not the premise of the physical bound. Combining (C1), (C2), (C8) and $\epsilon_s<10^{-8}$ gives

$$
\begin{aligned}
&P_{\mathrm{receive},S}^- -P_{\mathrm{receive},S}^+\\
&>0.99898\times 0.001190-10^{-8}>0.001188.
\end{aligned}
\tag{C10}
$$

This is a finite-time source-to-material-carrier-to-target result. It does not replace material propagation by an instantaneous readout at the source.

## 3. Source and resource ownership

The matched records include the same molecule/chemical carrier, initial position, spatial coordinates, diffusion coefficient, hopping/capture rates, bath, observation time, trap and readout. The hopping operators are exactly chemical-label blind. The finite source controls differ only in the already declared local sign. After the source interval the remaining chemical and spatial operators are common.

The material positions are isoenergetic over $0\leftrightarrow 1$. Take the declared solvent temperature $T_{X}=298$ K and the bound-state energy $H_X=-\Delta_X|2\rangle\langle 2|$, with $\Delta_X=k_BT_X\ln(10^{6})$, approximately 0.355 eV. Then $k_{\mathrm{capture}}/k_{\mathrm{release}}=10^{6}=\exp(\beta_X\Delta_X)$, so all positional rates obey thermal detailed balance. The common solvent owns translational relaxation and the specified $D$. Each capture releases $\Delta_{X}$ to that solvent, and each release reabsorbs it. The exact average positional heat is $\Delta_Xh(t)$, with an equal and opposite carrier-energy change. All position-only trajectory statistics, including capture/release counts and the $H_{X}$ contribution to heat, are exactly the same in both arms. Any additional chemical/source heat remains in its separate ledger; it is not inferred to match from positional rates. No infinite trap gap or missing reverse reaction is assumed.

A physical reset of the receiver-bound molecule requires release/replacement and its associated energy/record treatment. The one-use calculation retains the molecule, receiver record and bath. Repetition uses the same separately charged release/reset protocol in both arms; ideal erasure or an autonomous restored clock is not included.

A finite bounded Hamiltonian and a common fixed-time Stinespring record realize the position channel, but its resource ledger is not inferred from its Kraus rank. The physical declaration here is the thermal hopping/capture model (C4), with position, solvent, trap and clock retained. An actual hydrodynamic or molecular-motion identification must supply the corresponding D, rate and trapping model. The number D above is a declared model input, not a reported MagLOV measurement.

Since exactly one complete molecular carrier is transported in either arm, all position-only output statistics and every position-only trajectory functional are identical. The source chemical product distribution is the transmitted response. Target signal energy or chemical-label entropy need not be equal, and each remains in its output owner. All source/bath/readout records stay available; no costless erasure is invoked.

The specified initial receiver has no other signal-bearing molecule. A common background and finite detector efficiency can also be included without being hidden in the signal. If a false click occurs independently with probability b and a true receiver singlet is detected with probability d, the exact two-outcome instrument is

$$
\begin{aligned}
E_{\mathrm{click}} &= b I+(1-b)d\, E_{\mathrm{receive},S},\\
E_{\mathrm{no\,click}} &= I-E_{\mathrm{click}}.
\end{aligned}
$$

It is normalized and is realized by the target measurement plus two common classical coins. Its observed contrast is exactly $(1-b)d$ times (C10), by conditioning on these independent records. For $b\le0.01$ and $d\ge0.99$ the certified observed gap remains above 0.001164. Those background/efficiency records and their preparation/reset costs are common inputs; a context-dependent background requires its own error bound and does not satisfy this independence premise.

If a stable product label can be lost during transport at a common rate $\delta$, extend its sector with a lost-label outcome. Independence from the spatial channel multiplies the stable contribution in (C9) by $\exp(-\delta t)$, while newly formed residual labels still contribute at most $\epsilon_{s}$. Thus the contrast is bounded below by $h(t)\exp(-\delta t)\times 0.001190-\epsilon_s$. An exact multiplier for the entire response additionally requires a persistent erasure flag acting on all later labels. More general label perturbations with certified probability $\eta$ per arm subtract at most $2\eta$ from (C10). A nonzero decay bound is therefore permitted; stable shelving is the exactly solved $\delta=0$ member of the declared family.

**Finite rational calculations.** The cited calculation tables specify the complete finite data for the preceding arguments. All fractions in the tables are exact. Decimal approximations accompany their rational bounds.

For the first certificate the tensor-product basis is the product-z basis already fixed above: electron labels in the order \(+1/2,-1/2\), nuclear labels in the order \(1,0,-1\), with the last tensor factor varying fastest. For each listed field \(B\), the two integer components of the $36\times36$ Hermitian matrix define
\[
\widehat E_B=(V_B^{\mathrm R}+iV_B^{\mathrm I})/10^{14}.
\]
The upper-triangular table and Hermitian symmetry specify every entry, including zeros. Substitution into (M10), replacing the common Zeeman field 10 by the listed rational \(B\). The Machin alternating-series and integer-square-root enclosures stated above give the displayed exact residual bounds. The positive reaction-floor inverse proves the corresponding effect error; pairing with \(Q_T/27\) gives the exact candidate yields. For a pair of fields, subtract their candidate yields and add each effect error once and the two finite-source tail bounds once. The resulting outward intervals are recorded in [the reaction residual tables](../related/calculation_companions/appendix_l/l4-2c-reaction-and-transport-tables.md#reaction-residual-bounds). The tighter row-sum residual certificate is an additional bound on these same arrays, rather than a new source or a floating solver test.

The second and third certificates use precisely the closed-wire geometry, conductivity, permeability and reaction-floor perturbation proof (L10)–(L16). Their ramp coefficient multiplies \(\tau_r^{-3}\), with \(\tau_r\) in seconds; mutual storage and branch-dependent drive work remain in the complete-cycle ledger above. The fourth certificate evaluates the explicit layered Green functions and thermal-population formulas already proved in the membrane construction, using outward rational \(\pi\), square-root and exponential-series intervals. The fifth uses the declared reversible three-state transport generator at \(kt=20\), positive uniformization, and the exponential Taylor lower/geometric-remainder upper bounds. Its source-tail and receiver errors are added once, as in the spatial material proof. The tables fix all inputs and bounds for these finite rational calculations.

##### Four complete rational reaction-effect witnesses

For $B=9,99/10,101/10,11$ mT, write $\widehat E_B=10^{-14}A_B$. The following table specifies the upper triangle of each Hermitian $36\times36$ matrix $A_B$. An entry $(a,b)$ means $a+ib$. Every unlisted upper-triangular entry is zero, and $(A_B)_{ji}=\overline{(A_B)_{ij}}$. Indices start at one in the product-$z$ basis specified above. Thus the table includes every matrix entry without repeating the conjugate lower triangle.

The complete indexed upper triangles are given in [the reaction-effect matrix table](../related/calculation_companions/appendix_l/l4-2c-reaction-and-transport-tables.md#reaction-effect-matrices).

The exact field assignments, candidate yields, individual effect-error bounds and both control-pair gap intervals are given in [the reaction residual tables](../related/calculation_companions/appendix_l/l4-2c-reaction-and-transport-tables.md#reaction-residual-bounds).

##### Finite-current geometry, power and spatial effect bounds

The complete bias/control geometry, power, permeability and spatial error enclosures are given in [the finite-current tables](../related/calculation_companions/appendix_l/l4-2c-reaction-and-transport-tables.md#current-geometry-spatial-bounds).

##### Exact residual row sums, finite-source tails and refined coil/ramp bounds

The four residual-row-sum witnesses, tail-adjusted gaps, finite-source tails, coil components and finite-ramp bounds are given in [the refined reaction and coil tables](../related/calculation_companions/appendix_l/l4-2c-reaction-and-transport-tables.md#refined-reaction-coil-ramp-expanded-bounds).

##### Layered membrane coefficients, thermal populations and response interval

The exact layered Green-function coefficient intervals, source and gap energies, thermal populations and certified probability gap are given in [the membrane calculation tables](../related/calculation_companions/appendix_l/l4-2c-reaction-and-transport-tables.md#layered-membrane-calculations).

##### Reversible material transport and retained target response bounds

**Reversible material delivery and receiver response.**

The expanded exact transport and retained-response endpoints are given in [the reversible material delivery bounds](../related/calculation_companions/appendix_l/l4-2c-reaction-and-transport-tables.md#transport-bounds). The positive-uniformization and source-tail arguments above remain the verification of these bounds.

**Reversible material delivery and receiver response — Actual receiver occupation.**

The full exact interval is given in [the receiver occupation table](../related/calculation_companions/appendix_l/l4-2c-reaction-and-transport-tables.md#receiver-occupation).

∎

### **L.4.1.2 Physical Implementation Substrates**

<a id="theorem-l43-activated-channel-decoherence-model"></a>**Theorem L.4.3 (Activated-Channel Decoherence Model)**
Assume that one statistically independent decoherence channel has rate
$$\Gamma_{\text{act}}(T)=\Gamma_0(T)\exp\left(-\frac{\Delta E_{\text{shield}}}{k_BT}\right)$$
with $T>0$ and $\Delta E_{\text{shield}}\ge0$, and that all remaining independent channels have total rate $\Gamma_{\text{intrinsic}}\ge0$. Then
$$\Gamma_{\text{eff}}=\Gamma_0(T)\exp\left(-\frac{\Delta E_{\text{shield}}}{k_BT}\right)+\Gamma_{\text{intrinsic}}.$$

*Proof.* Independent exponential decay channels multiply their survival factors:
$$e^{-\Gamma_{\text{act}}t}e^{-\Gamma_{\text{intrinsic}}t}=e^{-(\Gamma_{\text{act}}+\Gamma_{\text{intrinsic}})t}.$$
Thus their generators and rates add, giving the displayed formula. The barrier suppresses only the channel assumed to obey the activated model. ∎

**Application to Candidate Substrates (illustrative):**

**(A) Microtubule Networks (Penrose-Hameroff Substrate)**
For comparison with the proposed Orchestrated Objective Reduction framework (Penrose, 1996; Hameroff and Penrose, 2014), take the following illustrative microtubule inputs; their physical applicability is not assumed:
- Structure: Cylindrical lattices, 25 nm diameter, 13 protofilaments
- Model input: $\Gamma_0=k_BT/h=6.46\times10^{12}\,\mathrm{s}^{-1}$ at $T=310\,\mathrm K$
- Assumed barrier: $\Delta E_{\text{shield}}=0.2\,\mathrm{eV}$
- Activated-channel factor: $\exp[-\Delta E_{\text{shield}}/(k_BT)]=5.60\times10^{-4}$
- Activated-channel rate: $\Gamma_{\text{act}}=3.62\times10^9\,\mathrm{s}^{-1}$
- Activated-channel lifetime when $\Gamma_{\text{intrinsic}}=0$: $\tau_{\text{act}}=1/\Gamma_{\text{act}}=2.76\times10^{-10}\,\mathrm s=276\,\mathrm{ps}$

For the separate relation $E\tau=\hbar$, the input $E=10^{-30}\,\mathrm J$ gives $\tau=1.05\times10^{-4}\,\mathrm s$. A 40 Hz period is $1/40=2.50\times10^{-2}\,\mathrm s$, about 237 times larger. These inputs do not yield a 40 Hz timescale.

**(B) Radical-Pair Candidate Inputs**
- A specified radical-pair Hamiltonian, reaction operators, and magnetic-field response must be supplied.
- Any critical law $\chi(T)\propto|T-T_c|^{-\gamma}$ requires an independently established universality class and critical temperature; radical-pair kinetics alone does not select the 3D-Ising exponent.
- A coherence time must identify the measured spin observable, solvent, temperature, and kinetic model before it can enter a carrier calculation.

**(C) Membrane-Voltage Candidate Inputs**
- A field of $10^7$ V/m across 7 nm corresponds to a potential difference of $0.070$ V.
- Oscillation frequencies and gap-junction conductances are classical network inputs.
- A millimeter-scale classical voltage-correlation domain is not, without an additional coherence observable, a millimeter-scale quantum-coherence domain.

### **L.4.1.3 Near-Field Influence Mechanism**

<a id="proposition-l44-cavity-energy-field-scale"></a>**Proposition L.4.4 (Cavity-Energy Field Scale)**
Let a driven mode of angular frequency $\omega$ have quality factor $Q:=\omega U/P_{\text{loss}}$, stored energy $U$, and loss power $P_{\text{loss}}$. Define its effective electric mode volume by $U=\epsilon_{\mathrm{vac}}E_{\mathrm{rms}}^2V_{\mathrm{eff}}$. Then
$$E_{\mathrm{rms}}=\sqrt{\frac{QP_{\mathrm{loss}}}{\omega\epsilon_{\mathrm{vac}}V_{\mathrm{eff}}}}.$$

*Proof.* The definition of $Q$ gives $U=QP_{\mathrm{loss}}/\omega$. Substitution into the definition of $V_{\mathrm{eff}}$ and solution for $E_{\mathrm{rms}}$ give the formula. ∎

For $P_{\mathrm{loss}}=2.0\times10^{-14}$ W, $Q=100$, $f=10$ GHz, $V_{\mathrm{eff}}=10^{-18}\,\mathrm m^3$, and $\epsilon_{\mathrm{vac}}=8.854\times10^{-12}\,\mathrm{F/m}$,
$$E_{\mathrm{rms}}=\sqrt{\frac{100(2.0\times10^{-14})}{2\pi(10^{10})(8.854\times10^{-12})(10^{-18})}}=1.90\times10^3\,\mathrm{V/m}.$$
A spatial near-field enhancement requires a normalized mode profile obtained from Maxwell's equations and boundary conditions; it is not a universal function of $r/\lambda$. A biological response additionally requires a measured field-to-channel transfer function, so no somatic-control conclusion follows from this field scale alone.

### **L.4.1.4 Multi-Scale Hierarchical Organization**

**Connection to Levin's Bioelectric Cognition**

Michael Levin's work develops and surveys scale-free cognition and multiscale bioelectric control as hypotheses and organizing frameworks for biological systems (Levin, 2019, 2021; Fields and Levin, 2020):

<a id="definition-l42-hierarchical-complexity-ansatz"></a>**Definition L.4.2 (Hierarchical-Complexity Ansatz)**
For a specified gap-junction network model, one may test the dimensionless ansatz

$$C_{\text{agg}}(N,g)=C_0N^{\alpha(g)},\qquad \alpha(g)=1+\beta\tanh(g/g_c),$$
where $g/g_c$ is dimensionless and $\beta\le1$. This is a model input, not a consequence of PCE.

<a id="theorem-l45-diffusive-point-impulse-correlation-length-scale"></a>**Theorem L.4.5 (Diffusive Point-Impulse Correlation-Length Scale)**
Let $d\ge1$, $D_{\mathrm{eff}}>0$, and let
$$
u(r,t)
=
(4\pi D_{\mathrm{eff}}t)^{-d/2}
\exp\!\left[-\frac{r^2}{4D_{\mathrm{eff}}t}\right]
$$
be the radial free-space fundamental solution of $\partial_tu=D_{\mathrm{eff}}\Delta u$ on $\mathbb R^d$ for $t>0$. For every threshold $q\in(0,1)$, the unique radius $R_q(t)>0$ satisfying $u(R_q(t),t)/u(0,t)=q$ is
$$R_q(t)=\sqrt{4D_{\mathrm{eff}}t\ln(1/q)}.$$

*Proof.* The common positive prefactor cancels, so
$$
\frac{u(r,t)}{u(0,t)}
=
\exp\!\left[-\frac{r^2}{4D_{\mathrm{eff}}t}\right].
$$
This function is continuous and strictly decreasing from $1$ to $0$ for $r\in[0,\infty)$, so there is a unique $R_q(t)>0$ with ratio $q$. Taking logarithms gives
$$
\ln q=-\frac{R_q(t)^2}{4D_{\mathrm{eff}}t},
$$
and solving for the positive radius proves the formula. ∎

Thus a diffusive model supplies only the scale $R=O(\sqrt{D_{\mathrm{eff}}\tau_c})$. Identifying it with a biological cognitive radius requires boundary conditions, a threshold, and empirical estimates of $D_{\mathrm{eff}}$ and $\tau_c$. Neither $D_{\mathrm{eff}}=D_0(1+g/g_0)$ nor metabolic heat proportionality to $C_{\mathrm{agg}}$ follows from the diffusion equation.

### **L.4.1.5 Relationship to Orchestrated Objective Reduction**

The Penrose--Hameroff Orch OR proposal supplies a comparison class of substrate hypotheses. The table sets each Orch OR aspect beside its PU status:

| **Aspect** | **Orch OR** | **PU status** |
|------------|-------------|---------------|
| **Consciousness origin** | associated with OR events | awareness is fundamental on the consciousness-first ontology; the Minimal Awareness convention (Section 7.1.2) interprets the MPU cycle as its most basic operational form, and no physical theorem depends on that interpretation |
| **Quantum mechanics** | fundamental with an OR modification | reconstructed on the explicit quantum-closure branches |
| **Gravity's role** | proposed OR trigger | a CC feedback or resource ceiling exists only on Appendix S's registered carrier, retained-source, and response branch |
| **Timescale** | $E t=\hbar$ as an OR threshold | $\tau_{\mathrm{medium}}=\hbar/E_{\mathrm{eff}}$ is a registered characteristic convention on the L.0 branch, not a minimum-update theorem |
| **Anesthetic action** | proposed disruption of tubulin states | change of $C_{\mathrm{agg}}$, crossing of $C_{op}$, and any CC response are empirical hypotheses |

The following remain empirical comparison targets: coherence of a specified microtubule observable at $310\,\mathrm K$; any registered $25$--$40\,\mathrm{ms}$ event timescale; anesthetic transfer to that observable; a nonzero aggregate carrier; and a metabolic or gravitational response discriminating the carrier from ordinary physiology. The illustrative input $E=10^{-30}\,\mathrm J$ in $E\tau=\hbar$ gives $\tau=1.05\times10^{-4}\,\mathrm s$, not a $25$--$40\,\mathrm{ms}$ interval. Theorem L.6 can audit a measured metabolic ledger but predicts no nonzero signature; Theorem 39 proves only its endpoint-gate consequence on the independently declared bounded-bias branch; Appendix S's self-limitation statement remains conditional on its complete physical realization certificates.

### **L.4.1.6 Critical Amplification for Non-Local Influence**

<a id="proposition-l46-conditional-linear-response-amplification-ledger"></a>**Proposition L.4.6 (Conditional Linear-Response Amplification Ledger)**
Let $b_{\mathrm{seed}}$ be a dimensionless probability bias produced by a specified phase-to-probability transfer function. Assume, rather than infer, a linear-response regime in which a dimensionless normalized susceptibility $\chi_N$, a justified temporal gain $G_t$, and a justified cooperative gain $G_N$ multiply without overlap. Then
$$|\Delta P_{\mathrm{obs}}|=\mathcal A_{\mathrm{crit}}|b_{\mathrm{seed}}|,
\qquad
\mathcal A_{\mathrm{crit}}:=\chi_NG_tG_N,$$
subject to $0\le P_0+\Delta P_{\mathrm{obs}}\le1$ and to the domain of validity of linear response.

*Proof.* The conclusion is the composition of the three assumed linear gains. Probability normalization supplies the displayed bound. No product law follows if the gains share degrees of freedom, if the response is nonlinear, or if correlations prevent multiplicative composition. ∎

A phase estimate such as $|\Delta\phi_{\mathrm{grav}}|\sim10^{-40}$ rad is not $b_{\mathrm{seed}}$; a target Hamiltonian, initial state, measurement, and transfer derivative $\partial P/\partial\phi$ are required. If a separately derived probability seed were $10^{-40}$ and the desired bias were $10^{-3}$, their quotient would be $10^{37}$. The numerical factors $10^{10}$, $10^3$, and $10^{24}$ merely multiply to that value and are not derived by this proposition.

<a id="theorem-l46a-exact-nonlinear-gain-bandwidth-noise-region-for-a-saturating-target"></a>**Theorem L.4.6a (Exact Nonlinear Gain–Bandwidth–Noise Region for a Saturating Target).** Consider the explicit scalar target
$$
\tau_x\dot x=-x+\tanh(gx+u),
\qquad \tau_x>0,
\tag{L.4.6a.1}
$$
with loop gain $g\ge0$. For $0\le g<1$, every constant input $u$ has a unique globally attracting equilibrium $x_*$, and
$$
\chi_0:=\frac{dx_*}{du}
=\frac{1-x_*^2}{\kappa_*},
\qquad
\omega_b:=\frac{\kappa_*}{\tau_x},
\qquad
\kappa_*:=1-g(1-x_*^2)>0.
\tag{L.4.6a.2}
$$
Hence the exact local gain–bandwidth product is
$$
\chi_0\omega_b=\frac{1-x_*^2}{\tau_x}.
\tag{L.4.6a.3}
$$
If additive white noise gives the linearized stochastic equation
$$
d\delta x=-\frac{\kappa_*}{\tau_x}\delta x\,dt+\sigma\,dW_t,
$$
its stationary variance is
$$
\operatorname{Var}(\delta x)=\frac{\sigma^2\tau_x}{2\kappa_*}.
\tag{L.4.6a.4}
$$
At $u=0,x_*=0$, increasing $g\uparrow1$ raises the static gain to $(1-g)^{-1}$ while the bandwidth falls to $(1-g)/\tau_x$ and the noise variance diverges as $(1-g)^{-1}$. For $g>1$, the zero equilibrium is unstable; at $g=1$ it is nonhyperbolic and has zero linear bandwidth.

*Proof.* For $g<1$, the fixed-point map $x\mapsto\tanh(gx+u)$ is a contraction, so it has one equilibrium. The continuous-time vector field
$$
F_u(x)=\frac{-x+\tanh(gx+u)}{\tau_x}
$$
obeys $F_u'(x)\le-(1-g)/\tau_x<0$. For any two solutions, the mean-value theorem therefore gives
$$
\frac{d}{dt}|x_1-x_2|^2
\le-\frac{2(1-g)}{\tau_x}|x_1-x_2|^2,
$$
so the unique equilibrium is globally exponentially attracting. Implicit differentiation of $x_*=\tanh(gx_*+u)$ gives the first formula in (L.4.6a.2). Linearization gives decay rate $\kappa_*/\tau_x$ and the transfer bandwidth. The Ornstein–Uhlenbeck variance gives (L.4.6a.4). At the origin $\kappa_*=1-g$; its sign gives the final stability classification. ∎

This solves the nonlinear gain, bandwidth, noise, and stability region for the declared target. A physical carrier must still supply its parameters and map a context intervention to $u$.

<a id="theorem-l46b-sharp-phase-to-probability-transfer-and-seed-data-processing-ceiling"></a>**Theorem L.4.6b (Sharp Phase-to-Probability Transfer and Seed Data-Processing Ceiling).** Let a finite-dimensional seeded register carry a state $\rho$, let $G$ be a self-adjoint phase generator with spectral spread $\Delta g:=g_{\max}-g_{\min}>0$, and let a context $c\in\{0,1\}$ imprint the phase $\varphi_c$ through $\rho_c:=e^{-i\varphi_cG}\rho e^{i\varphi_cG}$, with $\delta:=\varphi_1-\varphi_0$. Let $\Lambda$ be any context-independent CPTP map acting on the register together with any context-independent ancilla, amplifier or energy-supply state $\sigma$, let $0\le E\le I$ be any output effect, and put $P_c:=\operatorname{tr}[E\Lambda(\rho_c\otimes\sigma)]$ and $P(\varphi):=\operatorname{tr}[E\Lambda(e^{-i\varphi G}\rho e^{i\varphi G}\otimes\sigma)]$. Then:

(a) $F(\rho_0,\rho_1)\ge|\operatorname{tr}(\rho e^{-i\delta G})|\ge\cos(\Delta g|\delta|/2)$ whenever $\Delta g|\delta|\le\pi$, where $F$ is the Uhlmann root fidelity, and
$$
|P_1-P_0|
\le D(\rho_0,\rho_1)
\le\sin\!\left(\min\left\{\frac{\Delta g|\delta|}{2},\frac\pi2\right\}\right).
\tag{L.4.6b.1}
$$

(b) $P$ is differentiable and $|P'(\varphi)|\le\Delta g/2$ for every $\varphi$.

(c) *(Optimal instrument.)* For the qubit generator $G=\sigma_z/2$, state $|+\rangle=(|0\rangle+|1\rangle)/\sqrt2$ and readout $E=|{+_y}\rangle\langle{+_y}|$ with $|{+_y}\rangle=(|0\rangle+i|1\rangle)/\sqrt2$,
$$
P(\varphi)=\frac{1+\sin\varphi}{2},
\qquad
P'(0)=\frac12=\frac{\Delta g}{2},
\tag{L.4.6b.2}
$$
and the Helstrom projector of $\rho_1-\rho_0$ attains $|P_1-P_0|=|\sin(\delta/2)|$ for $|\delta|\le\pi$. A context-independent dephasing before readout that multiplies the energy-basis coherence by a real factor $m\in[0,1]$ gives exactly $P(\varphi)=(1+m\sin\varphi)/2$.

(d) *(Seeded registers.)* If the register consists of $N$ units and $G=\sum_{k=1}^NG^{(k)}$ with copies of one unit generator of spread $\Delta g_1$, then every input, entangled or not, obeys $|P_1-P_0|\le\sin(\min\{N\Delta g_1|\delta|/2,\pi/2\})$. A product input $\rho_{\mathrm u}^{\otimes N}$ with $\Delta g_1|\delta|\le\pi$ obeys
$$
|P_1-P_0|
\le\sqrt{1-\cos^{2N}(\Delta g_1|\delta|/2)}
\le\sqrt N\,\sin(\Delta g_1|\delta|/2).
\tag{L.4.6b.3}
$$
For $G^{(k)}=\sigma_z^{(k)}/2$, the input $(|0\cdots0\rangle+|1\cdots1\rangle)/\sqrt2$ with its Helstrom readout attains $\sin(N|\delta|/2)$ for $N|\delta|\le\pi$, and $|+\rangle^{\otimes N}$ with its Helstrom readout attains the first bound in (L.4.6b.3).

(e) *(Amplification ceiling.)* For $0<\Delta g_1|\delta|\le\pi$, relative to the optimal single-unit seed $b_{\mathrm{seed}}:=\sin(\Delta g_1|\delta|/2)$ of (a), every context-independent CPTP amplifier of $N$ seeded units has gain
$$
\mathcal A:=\frac{|P_1-P_0|}{b_{\mathrm{seed}}}\le N,
\qquad
\mathcal A\le\sqrt N\ \text{for product seeds}.
\tag{L.4.6b.4}
$$
When the seed $b_{\mathrm{seed}}$ of Proposition L.4.6 is this optimal single-unit transfer, a composite gain $\mathcal A_{\mathrm{crit}}$ realized by such processing of phase seeds therefore requires $N\ge\mathcal A_{\mathrm{crit}}$ seeded units, and $N\ge\mathcal A_{\mathrm{crit}}^2$ for product seeds; the illustrative value $10^{37}$ requires $N\ge10^{37}$, respectively $N\ge10^{74}$. A realization of Theorem L.4.6a whose input $u$ is produced by such processing obeys the same bounds on every context-conditioned outcome probability.

*Proof.* (a) Let $\Pi_k$ be the spectral projectors of $G$ with eigenvalues $g_k$ and $q_k:=\operatorname{tr}(\rho\Pi_k)$. Unitary invariance gives $F(\rho_0,\rho_1)=F(\rho,e^{-i\delta G}\rho e^{i\delta G})$. For the purification $|\Psi\rangle=\sum_j\sqrt{\lambda_j}|j\rangle|j\rangle$ of $\rho=\sum_j\lambda_j|j\rangle\langle j|$, Uhlmann's theorem gives $F\ge|\langle\Psi|(e^{-i\delta G}\otimes I)|\Psi\rangle|=|\operatorname{tr}(\rho e^{-i\delta G})|=|\sum_kq_ke^{-i\delta g_k}|$. After multiplication by $e^{i\delta(g_{\max}+g_{\min})/2}$, the points $e^{-i\delta g_k}$ have arguments in $[-\Delta g|\delta|/2,\Delta g|\delta|/2]$ and real parts at least $\cos(\Delta g|\delta|/2)\ge0$; their convex combination has the same lower bound on its real part, hence on its modulus. The Fuchs–van de Graaf inequality $D\le\sqrt{1-F^2}$ gives $D(\rho_0,\rho_1)\le\sin(\Delta g|\delta|/2)$ in this range, and $D\le1$ always. Finally, $\Lambda$ and $(\cdot)\otimes\sigma$ are context-independent CPTP maps, trace distance contracts under them, and Lemma 9.1 bounds $|P_1-P_0|$ by the resulting trace distance.

(b) Put $F_{\mathrm{reg}}:=\operatorname{tr}_{\mathrm{anc}}[(I\otimes\sigma)\Lambda^*(E)]$, an effect on the register with $P(\varphi)=\operatorname{tr}(F_{\mathrm{reg}}\rho_\varphi)$. Differentiation gives $P'(\varphi)=\operatorname{tr}(\rho_\varphi\,i[G,F_{\mathrm{reg}}])$. With $g_0:=(g_{\max}+g_{\min})/2$, $\|i[G,F_{\mathrm{reg}}]\|=\|[G-g_0I,F_{\mathrm{reg}}-I/2]\|\le2\|G-g_0I\|\|F_{\mathrm{reg}}-I/2\|\le\Delta g/2$.

(c) The state $e^{-i\varphi\sigma_z/2}|+\rangle=(e^{-i\varphi/2}|0\rangle+e^{i\varphi/2}|1\rangle)/\sqrt2$ gives $P(\varphi)=|1-ie^{i\varphi}|^2/4=(1+\sin\varphi)/2$. For pure states $D=\sqrt{1-|\langle\psi_0|\psi_1\rangle|^2}=|\sin(\delta/2)|$, and Lemma 9.1 shows that the Helstrom projector attains it. The dephasing multiplies the coherence by $m$, which multiplies the $\sin\varphi$ term by $m$.

(d) The spread of $\sum_kG^{(k)}$ is $N\Delta g_1$, so (a) applies. For product inputs, the root fidelity is multiplicative, so $F\ge\cos^N(\Delta g_1|\delta|/2)$ and $D\le\sqrt{1-F^2}$ gives the first bound in (L.4.6b.3); the second follows from $1-y^N\le N(1-y)$ for $y=\cos^2(\Delta g_1|\delta|/2)\in[0,1]$. The two displayed inputs are pure with overlaps $\cos(N\delta/2)$ and $\cos^N(\delta/2)$, so their trace distances equal the stated values, and Lemma 9.1 gives attainment.

(e) The bound $|\sin(Nx)|\le N|\sin x|$ follows by induction from $\sin((n+1)x)=\sin(nx)\cos x+\cos(nx)\sin x$. Combining it with (d) gives $\mathcal A\le N$ when $N\Delta g_1|\delta|\le\pi$ and $\mathcal A\le1/b_{\mathrm{seed}}\le N$ otherwise, because then $\pi/(2N)<\Delta g_1|\delta|/2\le\pi/2$ and concavity of the sine on $[0,\pi/2]$ gives $\sin(\Delta g_1|\delta|/2)\ge\sin(\pi/(2N))\ge1/N$; the product bound is the second inequality in (L.4.6b.3). ∎

<a id="theorem-l46c-finite-context-phase-carrier-with-a-complete-noise-and-pulse-ledger"></a>**Theorem L.4.6c (Finite Context-Phase Carrier with a Complete Noise and Pulse Ledger).** The phase-instrument branch of Theorem L.4.6b has a source-retaining finite realization for every integer $N\ge1$. Use the typed binary aggregate-context source $S$ and retained-record convention of Theorem L.12.8b, with one binary record $R$ retained throughout. The four source preparations are $|s_j,r\rangle$, $j,r\in\{0,1\}$, with any registered classical law. Consume fresh registers $C,M,Q_1,\ldots,Q_N,E_1,\ldots,E_N$ in state $|0\rangle$. All free Hamiltonians vanish on the registered strokes, and the following pulse Hamiltonians and their positive durations are part of the realization record.

The source encoder of (L.12.8b.1) writes $j$ into $C$ while retaining $S,R$. On the target register $Q$, prepare
$$
|\mathrm{GHZ}_N\rangle=
\frac{|0\rangle^{\otimes N}+|1\rangle^{\otimes N}}{\sqrt2}
\tag{L.4.6c.1}
$$
by a Hadamard on $Q_1$ followed by the fanout $F_N=\prod_{i=2}^N\mathrm{CNOT}_{Q_1\to Q_i}$. For $N=1$, $F_1=I$. Let
$$
G_N=\frac12\sum_{i=1}^N Z_{Q_i},\qquad
H_\varphi=\hbar\Omega(P_{1,C}-I_C/2)\otimes G_N,\qquad
\delta=\Omega\tau_\varphi,
\tag{L.4.6c.2}
$$
where $\Omega$ has units $\mathrm s^{-1}$ and $\tau_\varphi>0$ is the pulse duration. In source sector $j$ the pulse gives $e^{-i\varphi_jG_N}$ with
$$
\varphi_j=(j-1/2)\delta,
\qquad
\Delta g=N,
\qquad
\operatorname{Var}_{\mathrm{GHZ}_N}(G_N)=N^2/4.
\tag{L.4.6c.3}
$$
The phases and generator spread are therefore calculated from the source-controlled pulse.

Prepare each noise register by
$$
|e_i\rangle=e^{-i\beta_iY_{E_i}}|0\rangle
=\cos\beta_i|0\rangle+\sin\beta_i|1\rangle,
\qquad 0\le\beta_i\le\pi/4,
\tag{L.4.6c.4}
$$
using $H_{\beta_i}=\hbar\beta_iY_{E_i}/\tau_{\beta_i}$ during $\tau_{\beta_i}>0$. Apply $\mathrm{CZ}_{E_i,Q_i}$ once for every $i$. These fresh preparations and noise operations are context independent. Every $E_i$ remains retained; the target-only channel is obtained by tracing them out. Define
$$
w_\xi=\prod_{i=1}^N(\cos^2\beta_i)^{1-\xi_i}(\sin^2\beta_i)^{\xi_i},
\qquad
\epsilon_\xi=(-1)^{\sum_i\xi_i},
\qquad
m=\sum_\xi w_\xi\epsilon_\xi
=\prod_{i=1}^N\cos(2\beta_i).
\tag{L.4.6c.5}
$$
Powers with exponent zero equal one, including at a zero base. Thus $\sum_\xi w_\xi=1$ and $m\in[0,1]$. On an arbitrary target operator $X$, discarding the noise register gives the complete channel $\mathcal D_\beta(X)=\sum_\xi w_\xi Z^\xi XZ^\xi$, where $Z^\xi=\prod_i Z_{Q_i}^{\xi_i}$. The scalar $m$ is its coherence multiplier on the two GHZ code vectors.

Decode with $F_N^\dagger$. Write
$$
|\psi_{j,\xi}\rangle=
\frac{e^{-iN\varphi_j/2}|0\rangle+
\epsilon_\xi e^{iN\varphi_j/2}|1\rangle}{\sqrt2},
\qquad
|\Psi_j\rangle=
\sum_{\xi\in\{0,1\}^N}\sqrt{w_\xi}|\xi\rangle_E
\otimes|\psi_{j,\xi}\rangle_{Q_1}\otimes|0\rangle^{\otimes(N-1)}.
\tag{L.4.6c.6}
$$
This is the coherent decoded state before the record service. On $Q_1$, let $\Pi_0=|+_y\rangle\langle+_y|$, $\Pi_1=|-_y\rangle\langle-_y|$ and implement the readout copy
$$
W_{\mathrm{rd}}=\Pi_0\otimes I_M+\Pi_1\otimes X_M,
\qquad
H_{\mathrm{rd}}=\frac{\pi\hbar}{2\tau_{\mathrm{rd}}}
\Pi_1\otimes(I_M-X_M),
\qquad
W_{\mathrm{rd}}=e^{-i\tau_{\mathrm{rd}}H_{\mathrm{rd}}/\hbar}.
\tag{L.4.6c.7}
$$
The terminal projective record service jointly resolves the commuting computational-basis projectors of $E$ and $M$. Its retained leaf at $(\xi,a)$, conditional on source preparation $|s_j,r\rangle$, is
$$
\begin{aligned}
\Sigma_{j,r}^{\xi,a}={}&
|s_j,r,j\rangle\!\langle s_j,r,j|_{SRC}
\otimes w_\xi|\xi\rangle\!\langle\xi|_E\\
&\otimes \Pi_a|\psi_{j,\xi}\rangle\!\langle\psi_{j,\xi}|\Pi_a
\otimes|0\rangle\!\langle0|^{\otimes(N-1)}
\otimes|a\rangle\!\langle a|_M.
\end{aligned}
\tag{L.4.6c.8}
$$
Its register order is $S,R,C;E;Q_1;Q_2,\ldots,Q_N;M$. The leaves are obtained by unitary evolution followed by the stated projectors; (L.4.6c.8) retains the actual postmeasurement target and environment states.

The source/controller algebra on $S,R,C$ is retained by the source owner and is outside the amplifier and receiver access algebra. The latter consists of $Q,E,M$. After the phase pulse, every operation, fresh resource and duration on that algebra is context independent. The registered target-only readout retains $a$ and forgets $\xi$; the registered noise-assisted readout retains $(\xi,a)$. Both endpoint restrictions are recorded separately. The source, phase and receiver operations have ordered bounded causal supports, and their extensions to spectator factors are identities.

1. **Normalized physical response and noise attribution.** The complete $(\xi,a)$ instrument is completely positive and trace preserving after summing its outcomes. Its exact outcome law is
   $$
   p_j(\xi,a)=\frac{w_\xi}{2}
   \left[1+(-1)^a\epsilon_\xi\sin(N\varphi_j)\right].
   \tag{L.4.6c.9}
   $$
   In particular $\sum_a p_j(\xi,a)=w_\xi$ is context independent. The target-only probability of $a=0$ and its signed context contrast are
   $$
   P_j=\frac{1+m\sin(N\varphi_j)}2,
   \qquad
   P_1-P_0=m\sin(N\delta/2).
   \tag{L.4.6c.10}
   $$
   For $0<N\delta\le\pi$, the response is strictly positive exactly when $m>0$, equivalently every $\beta_i<\pi/4$.

   The receiver statistic $b=a\oplus(\sum_i\xi_i\bmod2)$ is a deterministic coarse-graining of the already recorded joint outcome. Its contrast is
   $$
   \Pr_1(b=0)-\Pr_0(b=0)=\sin(N\delta/2).
   \tag{L.4.6c.11}
   $$
   Thus (L.4.6c.10) gives the attenuation of the declared target-only endpoint, while (L.4.6c.11) gives the response when the retained noise record is consumed. The bit $b$ is an event statistic of the record, rather than an additional written quantum memory.

2. **Attained phase transfer on the declared access algebras.** On the target alone, after phase imprinting and noise, the two states have trace distance
   $$
   D(\rho_{Q,1},\rho_{Q,0})=m|\sin(N\delta/2)|.
   \tag{L.4.6c.12}
   $$
   The decoder and readout in (L.4.6c.7) attain this distance. With the noise record included, the two output distributions have total-variation distance $|\sin(N\delta/2)|$, attained by the parity-corrected statistic. This equals the trace distance of the pure phase seeds before the context-independent noise dilation. In particular $m=1$ attains Theorem L.4.6b's finite-phase ceiling on $0<N\delta\le\pi$.

   For a single continuously varied phase $\varphi$, the target-only response and slope are
   $$
   P(\varphi)=\frac{1+m\sin(N\varphi)}2,
   \qquad
   P'(\varphi)=\frac{mN}{2}\cos(N\varphi).
   \tag{L.4.6c.13}
   $$
   For $0<\delta\le\pi/N$, comparison with the optimal noiseless single-unit seed gives the exact gain
   $$
   \mathcal A_N=m\frac{\sin(N\delta/2)}{\sin(\delta/2)}\le N,
   \qquad
   \lim_{\delta\downarrow0}\mathcal A_N=mN.
   \tag{L.4.6c.14}
   $$
   The context-independent decoder, noise resource and readout therefore realize an explicit member of the amplification class, with every response-active noise record assigned its endpoint.

3. **Complete pulse and finite-resource ledger.** Realize each Hadamard, controlled bit flip or controlled phase flip $U=U^\dagger$, $U^2=I$, by
   $$
   H_U=\frac{\pi\hbar}{2\tau_U}(I-U)
   \tag{L.4.6c.15}
   $$
   during a positive $\tau_U$. This supplies the source encoder, GHZ preparation, the $N$ controlled noise flips and fanout decoding. The readout pulse is (L.4.6c.7). Each such nontrivial reflection pulse has integrated operator norm $\pi\hbar$. Each noise-preparation rotation has norm action $\hbar\beta_i$, and the phase pulse has norm action $\hbar N|\delta|/4$.

   Use one serial service port. The sequence contains one source encoder; one Hadamard and $N-1$ fanout gates; $N$ noise-preparation rotations; one phase pulse; $N$ controlled noise flips; $N-1$ decoding gates; and one readout pulse. Hence there are $4N+2$ Hamiltonian pulses on $2N+4$ qubits, counting $S,R,C,Q,E,M$. The complete coherent pulse action is
   $$
   A_{\mathrm{pulse}}:=\sum_\ell\int\|H_\ell(t)\|\,dt
   =\hbar\left[(3N+1)\pi+\sum_{i=1}^N\beta_i+\frac{N|\delta|}{4}\right].
   \tag{L.4.6c.16}
   $$
   A fresh-ready-register service of duration $\tau_{\mathrm{ready}}>0$ precedes these pulses, and the joint projective record service of duration $\tau_{\mathrm{met}}>0$ follows them. These two finite instrument services and the supplied ready/source preparations are separate primitive resources in the ledger. The total serial duration is their duration sum plus every listed pulse duration. If each duration equals $\tau_0>0$, it is
   $$
   T_{\mathrm{run}}=(4N+4)\tau_0.
   \tag{L.4.6c.17}
   $$
   All consumed registers remain one-use retained records after readout. The resource fields are register occupancy, pulse norm action, service count and elapsed time; they assign neither cyclic reset heat nor mechanical work to these quantities. The source/controller, phase pulse, noise preparation, noise coupling, decoder and record service each own exactly their displayed registers or generator terms, with no second gain assigned to the same pulse.

4. **Response error map.** For two phase/noise parameter records in the stated noise-angle domain, with $|\delta-\delta_0|\le\varepsilon_\delta$ and $|\beta_i-\beta_{i,0}|\le\varepsilon_i$, the target-only contrast obeys
   $$
   \left|m\sin(N\delta/2)-m_0\sin(N\delta_0/2)\right|
   \le 2\sum_i\varepsilon_i+\frac N2\varepsilon_\delta.
   \tag{L.4.6c.18}
   $$
   Each symmetric-context probability has at most half this error. If $\delta=\Omega\tau_\varphi$ is specified through separate bounds about $(\Omega_0,\tau_{\varphi,0})$, one may take
   $$
   \varepsilon_\delta=
   \tau_{\varphi,0}\varepsilon_\Omega+
   |\Omega_0|\varepsilon_\tau+\varepsilon_\Omega\varepsilon_\tau.
   \tag{L.4.6c.19}
   $$
   Exact records give zero remainder.

A fully populated member has $N=2$, source law $q_{jr}=1/4$, all durations $\tau_0$, $\Omega=\pi/(4\tau_0)$ and $\beta_1=\beta_2=\pi/12$. It has $\delta=\pi/4$, $m=3/4$, generator spread $2$, variance $1$, eight qubits, ten pulses, total duration $12\tau_0$ and pulse action $175\pi\hbar/24$. Its target-only probabilities and contrasts are
$$
(P_0,P_1)=\left(\frac{8-3\sqrt2}{16},\frac{8+3\sqrt2}{16}\right),
\qquad
P_1-P_0=\frac{3\sqrt2}{8},
\qquad
\Pr_1(b=0)-\Pr_0(b=0)=\frac{\sqrt2}{2}.
\tag{L.4.6c.20}
$$
The input angles and durations specify the finite construction; the probabilities are its derived outputs.

*Proof.* The source encoder preserves each $|s_j,r\rangle$ and writes $j$ by (L.12.8b.1). The Hadamard and fanout send $|0\rangle^{\otimes N}$ to (L.4.6c.1). On a computational string of Hamming weight $w$, $G_N$ has eigenvalue $(N-2w)/2$, giving extrema $\pm N/2$ and spread $N$. Its two GHZ components have equal weights at those extrema, so its mean is zero and variance $N^2/4$. On $C=j$, the phase Hamiltonian is $\hbar\Omega(j-1/2)G_N$, proving the phase and unit identities.

The noise-rotation identity follows from $Y^2=I$ and $Y|0\rangle=i|1\rangle$. Expanding their product preparation gives coefficients $\sqrt{w_\xi}$. A controlled phase flip on the $i$th target multiplies the all-one GHZ component by $(-1)^{\xi_i}$ and leaves the all-zero component unchanged. Their product therefore supplies $\epsilon_\xi$. The fanout inverse sends the two GHZ basis strings to $|0\rangle|0\rangle^{\otimes(N-1)}$ and $|1\rangle|0\rangle^{\otimes(N-1)}$, proving the coherent state (L.4.6c.6). Product expansion of $\sum_\xi w_\xi\epsilon_\xi$ gives $\prod_i(\cos^2\beta_i-\sin^2\beta_i)$, which is (L.4.6c.5).

The operator $\Pi_1\otimes(I-X_M)/2$ is a projection. Exponentiating it at angle $\pi$ gives $I-\Pi_1\otimes(I-X_M)=W_{\mathrm{rd}}$, proving (L.4.6c.7). Acting on an arbitrary target vector with $M=0$, this unitary gives $\sum_a\Pi_a|\psi\rangle\otimes|a\rangle_M$. The joint environment/memory projectors therefore produce exactly (L.4.6c.8). A unitary followed by a projector is a Kraus operation, and the projectors sum to the identity. This proves complete positivity and nonselective trace preservation on the full carrier, as well as normalization for every classical source law.

Direct inner-product evaluation gives
$$
\langle\psi_{j,\xi}|\Pi_a|\psi_{j,\xi}\rangle
=\frac{1+(-1)^a\epsilon_\xi\sin(N\varphi_j)}2.
$$
This proves (L.4.6c.9). Summing over $a$ gives the noise law $w_\xi$; summing over $\xi$ gives (L.4.6c.10). For the coarse event $b=0$, take $a=\sum_i\xi_i\bmod2$, so $(-1)^a\epsilon_\xi=1$ in every summand. Summing those weights proves (L.4.6c.11). On $0<N\delta\le\pi$, the sine in the signed contrast is positive, and the product $m$ is positive exactly when every noise angle is below $\pi/4$.

After discarding $E$, the target state is supported on the GHZ code and is
$$
\rho_Q(\varphi)=\frac12
\begin{pmatrix}
1&m e^{-iN\varphi}\\
m e^{iN\varphi}&1
\end{pmatrix}
$$
in the ordered basis $|0\rangle^{\otimes N},|1\rangle^{\otimes N}$. At the symmetric phase pair its difference is $m\sin(N\delta/2)\sigma_y$ on that code. Its eigenvalues are opposite with magnitude $m|\sin(N\delta/2)|$, proving (L.4.6c.12) and readout attainment. The joint laws differ at $(\xi,a)$ by $w_\xi(-1)^a\epsilon_\xi\sin(N\delta/2)$. Half the sum of their absolute differences is therefore $|\sin(N\delta/2)|$, since $\sum_\xi w_\xi=1$. The pure phase seeds have overlap $\cos(N\delta/2)$, so their trace distance has the same value. The subsequent noise dilation and readout use context-independent resources, and the source/controller algebra is excluded from this receiver comparison as declared. Thus the result consumes exactly the access class of Theorem L.4.6b. Differentiating the displayed target probability proves (L.4.6c.13). The inequality $|\sin(Nx)|\le N|\sin x|$ and the sine limit at zero prove (L.4.6c.14).

For a Hermitian involution $U$, $(I-U)/2$ is a projection and $e^{-i\pi(I-U)/2}=U$. Each stated reflection gate has a nonzero minus-one eigenspace, so its Hamiltonian norm is $\pi\hbar/\tau_U$. The noise rotation has norm $\hbar\beta_i/\tau_{\beta_i}$, and $\|P_{1,C}-I_C/2\|=1/2$ and $\|G_N\|=N/2$ give $\|H_\varphi\|=\hbar|\Omega|N/4$. The reflection-pulse count is
$$
1+1+(N-1)+N+(N-1)+1=3N+1.
$$
Adding the $N$ rotations and one phase pulse gives $4N+2$ pulses. Counting $S,R,C,M$ and the two $N$-qubit registers gives $2N+4$ qubits. Summing their norm actions, and then adding the two primitive service durations to the pulse durations, proves (L.4.6c.16)--(L.4.6c.17). These counts include every listed operation; a separately written parity-corrected memory would require its own additional implementation.

Finally $|\cos(2\beta)-\cos(2\beta_0)|\le2|\beta-\beta_0|$. Telescoping the two products of factors in $[0,1]$ gives $|m-m_0|\le2\sum_i\varepsilon_i$. The sine is one-Lipschitz, and $m_0\le1$, so subtracting the two contrasts proves (L.4.6c.18). The symmetric probability formula divides that difference by two. Expanding $\Omega\tau_\varphi-\Omega_0\tau_{\varphi,0}$ proves (L.4.6c.19). Substitution of the populated member gives (L.4.6c.20) and its resource values. ∎

### **L.4.1.7 Relationship to Controversial Experimental Claims**

*The following section addresses reported anomalous phenomena that require independent replication and states the conditions for attributing such an effect to a CC mechanism.*

**Random Number Generator Studies**
The cited literature includes intention experiments, reviews, and observational event-correlation studies (Radin and Nelson, 1989; Cardeña, 2018; Bösch et al., 2006; Nelson et al., 2002):
- Statistical scope: Bösch et al. (2006) report very small, heterogeneous pooled effects and identify publication bias as a possible explanation. Nelson et al. (2002) analyze network-variance statistics around major world events, rather than an operator-intention protocol. These different statistics do not define a common probability shift $|\Delta P|$ without a study-specific conversion and uncertainty model.
- Candidate condition: a registered phase-to-probability transfer may include a calibrated susceptibility near a specified target instability
- Candidate mechanism: Proposition L.4.6 supplies gain composition only under its separately assumed linear-response and non-overlap conditions; $\mathcal A_{\mathrm{crit}}\sim10^{37}$ is an illustrative gain input

**Double-Slit Interference Studies**
Claims of consciousness-correlated pattern changes (Radin et al., 2013):
- Reported statistic: in the first experiment's 50 test sessions, the composite spectral-magnitude/phase effect size was $es=z/\sqrt{N}=-0.73\pm0.14$ (standard error) at a 3 s lag; the 100 control sessions gave $0.04\pm0.10$. These standardized statistics are not a percentage change in fringe visibility.
- Candidate PU interpretation: a photon-radical-pair model would require an independently registered carrier, target response, and operating regime; the reported statistics establish none of these entries

**Critical Assessment:**
Attribution to a CC mechanism requires:
1. A registered carrier and phase-to-probability response within its validity domain
2. Calibrated experimental parameters and an independent replication
3. Isolation from conventional electromagnetic interference

On the conditional response model of Proposition L.4.6, a large measured susceptibility near a specified target instability is one testable gain mechanism. Attributing a reported deviation to it requires a registered carrier, a phase-to-probability transfer function, controls for conventional interference, and independent replication.

Likewise, an observer-state comparison can test whether a measured coherence time or radiative-loss observable changes with the intervention. Increases of $\tau_c$, sub-radiant states, or enlarged probability seeds under meditation are empirical hypotheses that such a comparison tests, separately from reports of group differences in an outcome statistic.

## **L.5 Unified Energy Accounting**

### **Theorem L.6 (First-Law Ledger and Non-Overlapping Stress-Energy Partition)**

Let $\mathcal V$ be a stationary control volume for a registered time and energy-current convention, with outward boundary $\mathcal S$. Supply its local energy-balance certificate, with stored energies and all boundary powers measured in that same convention. An inertial laboratory balance or a stationary Killing-energy balance is an admissible branch. In a nonstationary geometry, any additional geometric-work term must be included in the registered input/work ledger before the displayed equality is used; covariant stress-energy conservation alone does not remove that term. Let $E_{\mathrm{matter}}^{\mathcal V}$ and $E_{\mathrm{EM}}^{\mathcal V}$ be the stored contributions, and assign external input and electromagnetic, heat and mechanical output to disjoint exhaustive channels. Then that energy-balance certificate gives
$$
P_{\text{agg}}
=\frac{d}{dt}\left(E_{\text{matter}}^{\mathcal V}+E_{\text{EM}}^{\mathcal V}\right)
+P_{\text{EM}}^{\text{out}}+P_{\text{heat}}^{\text{out}}+P_{\text{mech}}^{\text{out}}. \tag{L.36}
$$
On the matter-plus-electromagnetic branch of Appendix B, Definition B.8,
$$ T_{\mu\nu}^{(\text{MPU})}=T_{\mu\nu}^{(\text{matter})}+T_{\mu\nu}^{(\text{EM})}. \tag{L.37} $$
If all external sources are included in this total tensor, its field equations imply
$$ \nabla^\mu T_{\mu\nu}^{(\text{MPU})}=0. \tag{L.38} $$

*Proof.* Integrate the registered local energy-current balance over $\mathcal V$ using its time parameter and measure, and apply its boundary divergence theorem. By the certificate, the volume derivative is the stored matter-plus-field energy, the input term contains every admitted external or geometric work contribution, and the disjoint output terms are the declared boundary powers. Thus
$$
P_{\text{agg}}
=\dot E_{\text{stored}}^{\mathcal V}
+P_{\text{EM}}^{\text{out}}+P_{\text{heat}}^{\text{out}}+P_{\text{mech}}^{\text{out}},
\qquad
E_{\text{stored}}^{\mathcal V}:=E_{\text{matter}}^{\mathcal V}+E_{\text{EM}}^{\mathcal V}. \tag{L.39}
$$
Transfers between oscillator kinetic energy and field energy change the two stored terms with opposite signs and therefore cancel in their sum:
$$
\dot E_{\text{matter}\to\text{EM}}
+\dot E_{\text{EM}\leftarrow\text{matter}}=0. \tag{L.40}
$$
On the inertial SI Maxwell branch, the exact outward electromagnetic power through the control boundary uses the complete fields:
$$
P_{\mathrm{EM}}^{\mathrm{out}}
=\int_{\mathcal S}\vec S\cdot d\vec A
=\int_{\mathcal S}\frac1{\mu_0}(\vec E\times\vec B)\cdot d\vec A.
\tag{L.41}
$$
Replacing these fields by their radiation parts requires a separately controlled radiation-zone and, when used, time-averaging approximation. In another registered energy-current convention, the flux is the corresponding electromagnetic contribution to that current.
The partition is non-overlapping by the stated definitions of stored energy and disjoint boundary channels. In steady state $\dot E_{\text{stored}}^{\mathcal V}=0$; only on that branch does input power equal the sum of outward powers. ∎

Stress-Energy Accounting: On the SI Maxwell branch, the electromagnetic tensor is
$$ T_{\mu\nu}^{(\text{EM})} = \frac{1}{\mu_0}\left(F_{\mu\alpha}F_{\nu}{}^{\alpha} - \frac{1}{4}g_{\mu\nu}F_{\alpha\beta}F^{\alpha\beta}\right). \tag{L.42} $$
This normalization agrees with Equation (L.11) and the Poynting flux in (L.41).

No perfect-fluid form follows for a general driven aggregate. If an isotropic local-equilibrium approximation is independently justified, let $U^\mu U_\mu=-1$, let $\epsilon_m$ be matter energy density, and let $p$ be isotropic pressure. On that branch,
$$ T_{\mu\nu}^{(\text{matter})}=(\epsilon_m+p)U_\mu U_\nu+pg_{\mu\nu}. \tag{L.43} $$
Anisotropic stress, viscosity, heat flux, and external drives require their corresponding tensor terms.

With every interaction contribution assigned to one registered sector,
$$ T_{\mu\nu}^{(\text{MPU})}(t)=T_{\mu\nu}^{(\text{matter})}(t)+T_{\mu\nu}^{(\text{EM})}(t). \tag{L.44} $$
The Lorentz-force exchange terms cancel between the two divergences. If no omitted external sector exchanges energy-momentum with this system, then
$$ \nabla^\mu T_{\mu\nu}^{(\text{MPU})}=0. \tag{L.45} $$
On the Einstein-equation branch of Theorem 50, the resulting source obeys
$$ R_{\mu\nu}-\frac{1}{2}Rg_{\mu\nu}+\Lambda g_{\mu\nu}=\frac{8\pi G}{c^4}T_{\mu\nu}^{(\text{MPU})}. \tag{L.46} $$
Internal matter-field exchange terms cancel in the divergence of the complete tensor; this does not make its pointwise value invariant under internal evolution. Energy density and spatial stress may redistribute while the total source remains covariantly conserved. Non-double-counting is a property of the declared sector assignment and boundary ledger, not a consequence of labeling input power as radiated or retained.

<a id="theorem-l6a-canonical-five-sector-source-audit-and-unique-ownership"></a>**Theorem L.6a (Canonical Five-Sector Source Audit and Unique Ownership).** Fix an oriented spacetime slab and let $X$ be the real vector space of covariant slab records
$$
x=(T^{\mu\nu},j^\nu_{\partial}),
$$
where $T^{\mu\nu}$ is a finite signed symmetric tensor distribution in the bulk and $j^\nu_{\partial}$ is its oriented boundary four-flux, both in one fixed energy-momentum unit convention. Fix a finite set $\mathcal E$ of elementary transactions carrying values in $X$. Let
$$
\mathcal L=\{\mathrm{source},\mathrm{stored},\mathrm{radiated},
\mathrm{reset},\mathrm{thermal}\}.
$$
An ownership map $\lambda:\mathcal E\to\mathcal L$ defines the disjoint partition
$$
\mathcal E_\ell:=\lambda^{-1}(\ell),
\qquad
\mathcal E=\coprod_{\ell\in\mathcal L}\mathcal E_\ell.
\tag{L.6a.0}
$$
The common audit space is the direct sum
$$
\mathcal A=\bigoplus_{\ell\in\mathcal L}X^{\mathcal E_\ell},
\tag{L.6a.1}
$$
with canonical projections $P_\ell$. They obey
$$
P_\ell P_m=\delta_{\ell m}P_\ell,
\qquad
\sum_{\ell\in\mathcal L}P_\ell=I_{\mathcal A}.
\tag{L.6a.2}
$$
With all output-oriented components positive, define the balance map
$$
\mathfrak D(a)
=\Sigma P_{\mathrm{source}}a
-\Sigma(P_{\mathrm{stored}}+P_{\mathrm{radiated}}
+P_{\mathrm{reset}}+P_{\mathrm{thermal}})a,
\tag{L.6a.3}
$$
where $\Sigma$ sums the transaction coordinates in $X$. A ledger is conserved exactly when $\mathfrak D(a)=0$.

The family $(P_\ell)$ is the unique family of linear projections that is the identity on its labeled summand and zero on every other labeled summand. The partition (L.6a.0) gives every transaction exactly one coordinate and one owner, and the sum in (L.6a.2) is exhaustive. Any attempt to enter one transaction in two sectors is outside $\mathcal A$ unless the ownership map is changed and the transaction is duplicated as a distinct audited event. The total stress-energy/boundary-flux record recomposes uniquely as
$$
\mathscr R_{\mathrm{tot}}(a)
=\sum_{\ell\in\mathcal L}\Sigma P_\ell a.
\tag{L.6a.4}
$$
Every spacetime pushforward preserving the ownership labels acts diagonally on (L.6a.1), commutes with each $P_\ell$, and therefore makes (L.6a.4) covariant.

*Proof.* The fibers of the function $\lambda$ are pairwise disjoint and exhaust $\mathcal E$, proving (L.6a.0). Equations (L.6a.1)--(L.6a.2) are the universal coordinate projections of the resulting direct sum. A projection with the stated action agrees with $P_\ell$ on every summand and hence on all of $\mathcal A$, proving uniqueness. Equation (L.6a.3) is the first-law balance in the common stress-energy/flux space. Summation gives (L.6a.4). A label-preserving pushforward maps each summand to itself, which proves commutation and covariance. ∎

The construction supplies one common audit and an exact no-double-counting test. A proposed implementation must still populate the tagged transactions and prove that its physical source-to-record map is exhaustive.

<a id="theorem-l6b-exhaustive-covariant-records-and-dual-gravitational-attribution-on-the-inertial-branch"></a>**Theorem L.6b (Exhaustive Covariant Records and Dual Gravitational Attribution on the Inertial Branch).** In Minkowski spacetime with inertial coordinates, let $T^{\mu\nu}=\sum_{\ell\in\mathcal S}T_\ell^{\mu\nu}$ be a finite sum of symmetric $C^1$ sector tensors with past-compact, spatially compact support, exchange currents $f_\ell^\nu:=\partial_\mu T_\ell^{\mu\nu}$ and external source $j_{\mathrm{ext}}^\nu:=\sum_\ell f_\ell^\nu$. Let $\mathcal D$ be a compact region with piecewise $C^1$ boundary, split into finitely many boundary pieces $\partial\mathcal D=\bigcup_kB_k$, and define the four-vector records
$$
R_{\ell,k}^\alpha:=\int_{B_k}T_\ell^{\mu\alpha}\,d\Sigma_\mu,
\qquad
X_\ell^\alpha:=\int_{\mathcal D}f_\ell^\alpha\,d^4x,
\qquad
J^\alpha:=\int_{\mathcal D}j_{\mathrm{ext}}^\alpha\,d^4x,
\tag{L.6b.1}
$$
with outward orientation.

(a) *(Sector balance.)* $\sum_kR_{\ell,k}^\alpha=X_\ell^\alpha$ for every sector $\ell$ and every $\alpha$.

(b) *(Exhaustive audit.)* $\sum_{\ell,k}R_{\ell,k}^\alpha=J^\alpha$. For a slab $\mathcal D=[x^0_1,x^0_2]\times V$, tag the final-minus-initial slice records of each sector as stored, the side record of each sector with its registered output label, and $J^\alpha$ as source. Every nonzero record then has exactly one owner, and the balance map (L.6a.3) vanishes identically for every such sector decomposition. A Poincaré map $\Lambda$ carries the records of $(T_\ell,\mathcal D)$ to $\Lambda^\alpha{}_\beta$ times those of the transformed tensors on $\Lambda\mathcal D$.

(c) *(Dual gravitational attribution.)* The retarded linearized field $\bar h^{\mu\nu}=-(16\pi G/c^4)\sum_\ell G_{\mathrm{ret}}*T_\ell^{\mu\nu}$ is the exact sum of the sector fields $\bar h_\ell^{\mu\nu}:=-(16\pi G/c^4)G_{\mathrm{ret}}*T_\ell^{\mu\nu}$, and
$$
\partial_\mu\bar h_\ell^{\mu\nu}=-\frac{16\pi G}{c^4}G_{\mathrm{ret}}*f_\ell^\nu,
\qquad
\partial_\mu\bar h^{\mu\nu}=-\frac{16\pi G}{c^4}G_{\mathrm{ret}}*j_{\mathrm{ext}}^\nu.
\tag{L.6b.2}
$$
The total is a harmonic-gauge solution of the linearized Einstein equation exactly when $j_{\mathrm{ext}}=0$, and a sector tensor $T_\ell$ is an admissible linearized source by itself exactly when $f_\ell=0$. On every open region where Maxwell fields and charged dust obey the coupled equations, $f_{\mathrm{EM}}^\nu=-F^\nu{}_\mu J^\mu=-f_{\mathrm{matter}}^\nu$, so if $F^\nu{}_\mu J^\mu\ne0$ somewhere on that region, neither sector alone is the source of a solution of the linearized Einstein equation on it, while their sum is conserved there and the exchange cancels in $j_{\mathrm{ext}}$.

*Proof.* (a) For fixed $\alpha$, the vector field $V^\mu=T_\ell^{\mu\alpha}$ is $C^1$, and Gauss's theorem on $\mathcal D$ gives $\oint_{\partial\mathcal D}V^\mu d\Sigma_\mu=\int_{\mathcal D}\partial_\mu V^\mu d^4x=X_\ell^\alpha$; the boundary integral splits over the pieces $B_k$. (b) Summing (a) over $\ell$ gives $J^\alpha$. For a slab the outward boundary consists of the final slice, the reversed initial slice and the side, so the tagged records are the stored change and the outflows. Moving $J^\alpha$ to the source label and all other records to output labels gives $\mathfrak D(a)=J^\alpha-\sum_{\ell,k}R^\alpha_{\ell,k}=0$. The tagging assigns each record one label by construction. Poincaré maps preserve $d^4x$ and map oriented boundary pieces to oriented boundary pieces, and $T_\ell^{\mu\alpha}$ transforms tensorially, which gives the covariance statement. (c) Linearity of retarded convolution gives the sum. Retarded convolution commutes with derivatives on past-compact distributions, which gives (L.6b.2). In harmonic gauge the linearized Einstein equation reads $\Box\bar h^{\mu\nu}=-16\pi GT^{\mu\nu}/c^4$, satisfied by $G_{\mathrm{ret}}*$ since $\Box G_{\mathrm{ret}}=\delta$; the gauge condition holds exactly when $G_{\mathrm{ret}}*j_{\mathrm{ext}}=0$, that is when $j_{\mathrm{ext}}=0$, because applying $\Box$ recovers $j_{\mathrm{ext}}$. The linearized Bianchi identity makes the linearized Einstein tensor divergence-free on every open set, so a source must be conserved there; this gives the sector criterion and its local form on a region. For Maxwell–dust, $\partial_\mu T^{\mu\nu}_{\mathrm{EM}}=-F^\nu{}_\mu J^\mu$ and $\partial_\mu T^{\mu\nu}_{\mathrm{matter}}=F^\nu{}_\mu J^\mu$ by the Lorentz-force law. ∎

<a id="theorem-l6c-observer-current-records-including-geometric-work"></a>**Theorem L.6c (Observer-Current Records, Including Geometric Work).** Let a Lorentzian spacetime region have a piecewise smooth compact boundary, and let its symmetric sector tensors satisfy $\nabla_\mu T_\ell^{\mu\nu}=f_\ell^\nu$. Register a smooth vector field $\xi$ as the energy-current convention. Define
$$
j_\ell^\mu[\xi]=-T_\ell^{\mu\nu}\xi_\nu,\quad
R_{\ell k}[\xi]=\int_{B_k}j_\ell^\mu d\Sigma_\mu,\quad
X_\ell[\xi]=-\int_{\mathcal D}f_\ell^\nu\xi_\nu dV,
\quad W_\ell[\xi]=-\int_{\mathcal D}T_\ell^{\mu\nu}\nabla_{(\mu}\xi_{\nu)}dV.
\tag{L.6c.1}
$$
Then $\sum_kR_{\ell k}=X_\ell+W_\ell$, and summing over the physical sectors cancels every internal exchange. These are scalar records relative to the registered current; on a curved region they take the place of the inertial four-vector components of (L.6b.1). Boundary pieces, current convention and owner labels transform together under diffeomorphisms. A Killing convention has $W_\ell=0$; a normalized accelerated-observer field generally does not.

*Proof.* The product rule gives $\nabla_\mu j_\ell^\mu=-f_\ell\cdot\xi-T_\ell^{\mu\nu}\nabla_{(\mu}\xi_{\nu)}$. Gauss's theorem proves the statement sector by sector. Symmetry permits replacement of $\nabla\xi$ by its symmetric part. Summation uses the actual tensor decomposition rather than treating a transferred energy as a second external output. Each integrand and oriented integral is geometrically defined. ∎

For example, on a compact region in the right Minkowski wedge $x>|t|$, the boost Killing field $\xi=(x\partial_t+t\partial_x)/L$, $L>0$, is timelike. Its nonconstant spatial weights give a different physical energy convention from every constant inertial time translation. Its normalized observers accelerate. Registering $\xi/\sqrt{-\xi^2}$ instead retains its nonzero $W$ term. This supplies a non-inertial current convention that retains geometric work. All such records here are over compact windows; for a Coulomb tail the absolute first spatial moment of the energy density, on which a global boost charge depends, need not converge.

<a id="theorem-l6d-constraint-populated-finite-cauchy-retarded-attribution"></a>**Theorem L.6d (Constraint-Populated Finite-Cauchy Retarded Attribution).** Use $c=1$, signature $(-+++)$, $\kappa=16\pi G$, and $\Box=-\partial_t^2+\Delta$. Let a finite family of symmetric smooth tensors $T_\ell$ be specified on $[0,T]\times\mathbb R^3$, with $|\partial_x^\alpha T_\ell(0,x)|\le C_\alpha(1+|x|)^{-4-|\alpha|}$ for every multi-index $|\alpha|\le3$, and bounded derivatives on compact spacetime sets. These bounds make the initial Newton integrals and their needed derivatives well defined. Compactly supported matter plus smooth Coulomb-field stress $O(|x|^{-4})$ is admitted. No past-compactness is required.

Write $N=(-\Delta)^{-1}$, with kernel $(4\pi|x-y|)^{-1}$. For each sector supply these *owned initial gravitational data*:
$$
a_\ell^{0\nu}=\kappa N T_\ell^{0\nu}(0),\quad a_\ell^{ij}=0,
\qquad b_\ell^{00}=-\partial_i a_\ell^{i0},\quad
b_\ell^{0i}=b_\ell^{ij}=0.
\tag{L.6d.1}
$$
Symmetry fixes the remaining entries. If $M_rf(x)=(4\pi)^{-1}\int_{S^2}f(x+r\omega)d\omega$, set
$$
\bar h_\ell(t)=\partial_t[tM_ta_\ell]+tM_tb_\ell
+\kappa\int_0^t(t-s)M_{t-s}T_\ell(s)\,ds.
\tag{L.6d.2}
$$
The finite source integral is retarded after the initial surface. The first two terms are the registered gravitational data present at the initial surface. The map is linear, $\bar h=\sum_\ell\bar h_\ell$, and it solves $\Box\bar h=-\kappa T$.

Let $C_\ell^\nu=\partial_\mu\bar h_\ell^{\mu\nu}$ and $f_\ell^\nu=\partial_\mu T_\ell^{\mu\nu}$. Then
$$
C_\ell(0)=\partial_tC_\ell(0)=0,\qquad
\Box C_\ell=-\kappa f_\ell.
\tag{L.6d.3}
$$
Thus the complete field is in harmonic gauge exactly when $\sum_\ell f_\ell=0$. An individual sector is an admissible linearized Einstein source exactly when it is separately conserved. Adding any separately registered, source-independent homogeneous harmonic-gauge solution preserves this statement.

*Proof.* Kirchhoff's formula proves the wave equation and initial data. The finite integral samples spheres of radius at most $t$ during the interval $[0,t]$, so no source values before the initial surface enter. At $t=0$, the divergence vanishes because $b^{00}=-\partial_i a^{i0}$, $b^{0j}=0$, and $a^{ij}=0$. The wave equation gives

$$
\partial_tC^\nu(0)=\Delta a^{0\nu}+\kappa T^{0\nu}(0)+\partial_i b^{i\nu}=0.
$$

The last derivative is zero, and $\Delta NT=-T$. Differentiating the wave equation gives (L.6d.3). Uniqueness of the zero-data homogeneous wave problem proves sufficiency of conservation; applying $\Box$ to $C=0$ proves necessity. The initial elliptic constraint data are fixed on the initial surface; every later change of a sector propagates by the retarded finite-Cauchy map. ∎

<a id="construction-l6e-one-covariant-internal-state-maxwell-dust-source"></a>**Construction L.6e (One Covariant Internal-State Maxwell–Dust Source).** The registered source is a classical–quantum mean-field material model. Its quantum state is one finite internal fibre over a classical material distribution. The common classical field is sourced by the current and stress of the action below. This constitutive source class, and its normalized response interface, are part of its registration.

Use natural electromagnetic units $c=\epsilon_0=\mu_0=1$. Fix a nonzero charge $q\ne0$. Choose a smooth nonnegative radial material density $n_0$, supported in an annulus $a_0<a<a_1$, normalized by $\int n_0\,d^3a=1$. The material measure $d\nu=n_0d^3a$ is fixed. At finite bath depth $D\ge1$, the internal stock consists of a degenerate memory qubit $P$, one two-level work battery $A$, and one bath with basis the binary words $v$ of length at most $D$. There are $2^{D+1}-1$ bath levels in the single internal fibre. A retained finite-dimensional spectator $R$ with declared zero bare Hamiltonian is permitted; its occupied dimension is retained in the finite source description. Bounded measurable fields of internal observables form the classical–quantum algebra $L^\infty(\nu)\bar\otimes\mathcal B(\mathcal H_D\otimes\mathcal H_R)$, with normalized state
$$
\omega(O)=\int\operatorname{tr}[\rho(a)O(a)]d\nu(a).
\tag{L.6e.1}
$$
The material coordinate is a source parameter; it is never reset, copied into a free tape or treated as a countable supply of additional stock. The response experiment selects one classical label with law $\nu$ once and uses the same finite quantum fibre throughout; it does not independently resample a fresh register at each probe. At the registered source endpoint, an externally supplied finite adaptive terminal tester has Kraus operators $L_{r_j\mid h_j,\alpha_j}(a)$, with $\sum_{r_j,\alpha_j}L^*L=I$ for every history and almost every $a$. Its complete word law is
$$
p(r_1,\ldots,r_k)=\int\sum_{\alpha_1,\ldots,\alpha_k}
\operatorname{tr}\bigl[L_{r_k\mid h_k,\alpha_k}(a)\cdots L_{r_1,\alpha_1}(a)\rho_{\mathrm{out}}(a)L^*_{r_1,\alpha_1}(a)\cdots L^*_{r_k\mid h_k,\alpha_k}(a)\bigr]d\nu(a).
\tag{L.6e.1a}
$$
Positivity and successive Kraus normalization prove that this is one normalized joint law. Identity extension includes every spectator. These terminal testers act on the output after the source slab, outside the source action (L.6e.5). The reset itself is the actual unitary in (L.6e.3). Total stock, energy and heat below are expectations in (L.6e.1) over the single fibre; additional terminal probes leave the source bath inventory unchanged. The current and stress are the constitutive mean-field sources of this one finite-measure hybrid state.

Fix $\theta=k_BT_b>0$, $W>\theta\ln2$, and $r=2e^{-W/\theta}<1$. Put
$$
H_B|v\rangle=W|v|\,|v\rangle,\quad H_A=W|1\rangle\langle1|,
\qquad \gamma_{B,D}=Z_D^{-1}e^{-H_B/\theta},
\quad Z_D=\frac{1-r^{D+1}}{1-r}.
\tag{L.6e.2}
$$
For each $|v|<D$, pair $|b,v,1\rangle$ with $|0,vb,0\rangle$, $b=0,1$. These are disjoint equal-energy pairs. Let
$$
Y_D=i\sum_{b,v:|v|<D}(|0,vb,0\rangle\langle b,v,1|-|b,v,1\rangle\langle0,vb,0|),
\quad K_D=H_B+H_A+g(I+Y_D),\quad g>0.
\tag{L.6e.3}
$$
The unpaired subspace is fixed by $Y_D$. It has norm one, $[Y_D,H_B+H_A]=0$, and $K_D\ge0$. The fixed term $g(I+Y_D)$ is the actual coherent reset interaction; its constant positive offset is included once in the material source.

The initial state is $\rho_{PR}\otimes\gamma_{B,D}\otimes|1\rangle\langle1|_A$, with the bath and work stock independent of all non-bath resources. The source geometry and every classical probe record are initially independent of this state. For every $\rho_{PR}$,
$$
\operatorname{tr}(\rho K_D)=E_{B,D}+W+g,
\qquad E_{B,D}=W\left[\frac r{1-r}-\frac{(D+1)r^{D+1}}{1-r^{D+1}}\right].
\tag{L.6e.4}
$$
Indeed, $Y_D$ is off-diagonal in the battery basis and the initial battery is $|1\rangle\langle1|$, so its expectation vanishes for every memory/reference density matrix, including all coherences and entanglement. In particular the classical flow is independent of the memory input, so the memory map below is a linear channel.

For material worldlines $z(\lambda,a)$, unitary frames $U(\lambda,a)$, and $\rho=U\rho_0U^*$, register the single action
$$
S=-\frac14\int F_{\mu\nu}F^{\mu\nu}dV
+\int d\nu(a)\left\{\int i\hbar\operatorname{tr}(\rho_0U^*dU)
-\int[m_0+\operatorname{tr}(\rho K_D)]d\tau
+q\int A_\mu dz^\mu\right\},\qquad m_0>0.
\tag{L.6e.5}
$$
Here $F=dA$, $A_0=-\phi$, $F_{0i}=-E_i$, and the Maxwell equation is $\nabla_\mu F^{\nu\mu}=J^\nu$. The mixed-state action uses the unitary orbit directly, without a purification of the retained side information.

Unitary-frame variation, worldline variation, field variation and metric variation give, respectively,
$$
i\hbar D_\tau\rho=[K_D,\rho],\qquad
m_D a^\mu=qF^\mu{}_{\nu}u^\nu,\qquad
J^\mu=qnu^\mu,\qquad
T_{\rm mat}^{\mu\nu}=m_Dnu^\mu u^\nu,
\quad m_D=m_0+E_{B,D}+W+g.
\tag{L.6e.6}
$$
The Berry term is metric independent, while variation of proper time supplies the entire displayed mass. The internal equation makes $D_\tau\operatorname{tr}(\rho K_D)=0$. Material transport gives $\nabla_\mu(nu^\mu)=0$. Consequently
$$
\nabla_\mu T_{\rm mat}^{\mu\nu}=F^\nu{}_{\lambda}J^\lambda,
\qquad \nabla_\mu T_{\rm EM}^{\mu\nu}=-F^\nu{}_{\lambda}J^\lambda,
\qquad \nabla_\mu(T_{\rm mat}+T_{\rm EM})^{\mu\nu}=0.
\tag{L.6e.7}
$$
All bath, battery and coherent interaction energies are already in $m_D$.

**Explicit solution and finite interval.** Let
$Q(a)=4\pi q\int_0^a n_0(s)s^2ds$.
For each shell solve the ordinary differential equations
$$
\dot R=\frac p{\sqrt{m_D^2+p^2}},\qquad
\dot p=\frac{qQ(a)}{4\pi R^2},\qquad R(0,a)=a,\quad p(0,a)=0.
\tag{L.6e.8}
$$
Set $b=a/a_0$, $s=t/a_0$, $x=R/a_0$, $y=p/m_0$, $\mu=m_D/m_0\ge1$, and
$A(b)=qQ(a_0b)/(4\pi m_0a_0)\ge0$, $A_*=\|A\|_\infty$, $C_*=\|A'\|_\infty$.
Choose any positive $S$ satisfying
$$
S^2(C_*+4A_*)\le\tfrac12,\quad
4A_*(C_*+4A_*)S^3/3<\tfrac12\alpha,
\qquad \alpha=[1+(A_*S)^2]^{-1/2}.
\tag{L.6e.9}
$$
Such a choice exists and uses only the registered source. On $0\le s\le S$, $x\ge b$, $0\le y\le A_*S$, and $3/4\le x_b\le5/4$. Indeed, while $|x_b|\le2$, differentiation gives $|y_b|\le s(C_*+4A_*)$ and $|x_b-1|\le s^2(C_*+4A_*)/2\le1/4$, closing the bootstrap. Ordinary Picard iteration applies on $x\ge1$ with uniformly bounded derivatives, so all these solutions and their shell derivatives exist on that interval.

Invert $r=R(t,a)$ on the material annulus and set
$$
E(t,r)=\frac{Q(a(t,r))}{4\pi r^2}\,\mathbf e_r,
\qquad B=0,
\qquad n\gamma=\frac{n_0(a)a^2}{R^2R_a}.
\tag{L.6e.10}
$$
Extend $Q$ by zero inside the inner shell and by the total charge outside the outer shell. Smooth vanishing of $n_0$ at its support edges makes this a smooth field; the origin has a vacuum neighborhood. Gauss follows by differentiation in $r$. At fixed $r$, $\partial_t Q(a(t,r))=-4\pi r^2 qn\gamma v$, giving Ampere; Faraday follows because the electric field is radial and $B=0$. The Lorentz-force law is exactly (L.6e.8). The field has finite Coulomb energy and $O(r^{-4})$ stress. It has nonzero matter–field exchange for $t>0$ and nonzero density, but its Poynting flux and radiative output are exactly zero.
Its complete positive laboratory energy is
$$
\mathcal E_D(t)=\int\sqrt{m_D^2+p(t,a)^2}\,d\nu(a)+\frac12\int_{\mathbb R^3}|E(t,x)|^2d^3x.
\tag{L.6e.10a}
$$
The material derivative is $\int qE\cdot v\,d\nu$; Ampere gives the opposite field-energy derivative. Thus $\mathcal E_D$ is constant and nonzero, with no omitted flux at infinity. Its conservation also verifies directly why this source cannot be replaced by a past-compact representative.

Proper time obeys $\partial_s(\tau/a_0)=\mu/\sqrt{\mu^2+y^2}\ge\alpha$. The derivative bound
$|\partial_b(\tau/a_0)|\le A_*(C_*+4A_*)S^3/3$, together with (L.6e.9), makes the relevant proper-time level surfaces spacelike. Choose $\tau_*=a_0\alpha S/2$ and then $g=\pi\hbar/(2\tau_*)$. These choices are consistent: the interval bounds used only $m_D\ge m_0$, not an upper bound on $g$. Every material element reaches the common endpoint $\tau=\tau_*$ inside the certified slab.

**Exact reset, thermal transfer and errors.** At $\tau_*$, the internal propagator is, up to the owned free phases and a global phase, $\exp(-i\pi Y_D/2)$. Its successfully paired subspace returns $P$ and $A$ to zero and appends the displaced memory to the bath word. The unpaired initial boundary has probability
$$
\delta_D=\frac{(1-r)r^D}{1-r^{D+1}}\le r^D.
\tag{L.6e.11}
$$
It leaves $P$ unchanged and $A=1$. Therefore the memory channel is exactly
$\mathcal R_D=(1-\delta_D)\mathcal R_0+\delta_D\operatorname{id}$, where $\mathcal R_0$ replaces $P$ by its ready state and preserves every reference. Its half-diamond error is $\delta_D$. The joint $PA$ replacement error is also exactly $\delta_D$, because the failed battery sector is orthogonal to the successful sector. The actual heat and battery withdrawal are
$$
Q_{B,D}=W_{A,D}=W(1-\delta_D).
\tag{L.6e.12}
$$
For a fair memory independent of retained data, its final error is $\delta_D/2$, its entropy is $h(\delta_D/2)$, the battery entropy is $h(\delta_D)$, and its mutual information with the entire remaining source obeys $I(A:\mathrm{rest})\le2S(A)=2h(\delta_D)$; the same bound holds for mutual information with any subsystem. For arbitrary memory/reference inputs the same exact mixture also gives the dimension-independent bound
$$
-\delta_D\ln2\le S(P_{\rm out}\mid R)\le h(\delta_D)+\delta_D\ln2.
\tag{L.6e.12a}
$$
The lower bound is conditional-entropy concavity; the upper bound follows by adjoining the classical success/boundary flag, whose entropy is $h(\delta_D)$. Thus the conditional-entropy difference converges uniformly even when the finite reference dimension is not fixed. At finite depth, $W_{A,D}$ denotes battery energy withdrawal; the battery entropy and its correlations are the displayed nonzero residuals, so each finite source is an imperfect reset.

On the countable binary-word bath, $Z=(1-r)^{-1}$, $E_B=Wr/(1-r)$, and $S_B=E_B/\theta+\ln Z$ are finite. The same bounded direct-sum $Y$ strongly commutes with $H_B+H_A$. Its exact unitary returns $P=A=0$, leaves $R$ unchanged, and has $Q_B=W_A=W$. For the fair independent memory, bath entropy increases by $\ln2$ and $D(\rho'_B\Vert\gamma_B)=W/\theta-\ln2$. The battery remains pure and uncorrelated. This is the normal exact-erasure extension of Definition 28; at every finite depth the reset is the imperfect one above. Equations (L.6e.11)–(L.6e.12) prove conditional-entropy, pure-work and mean-heat convergence, while
$$
m_\infty-m_D=\frac{W(D+1)r^{D+1}}{1-r^{D+1}}.
\tag{L.6e.13}
$$
The dimensionless shell solutions obey

$$
\sup_{s\le S}(|x_D-x_\infty|+|y_D-y_\infty|)\le[(m_\infty-m_D)/m_0]S e^{LS},
$$

$L=\max(1,2A_*)$, by the Lipschitz bounds of (L.6e.8). The normal source has its own action, (L.6e.5) with the countable bath, and its own shell solution, obtained by the same argument with $m_\infty$.

**Sector and ownership ledger.** Set $e_B=\operatorname{tr}(\rho H_B)$, $e_A=\operatorname{tr}(\rho H_A)$, $e_C=\operatorname{tr}[\rho g(I+Y)]$. The actual matter tensor splits once as
$$
T_{\rm mat}=n(m_0+e_A+e_B+e_C)u\otimes u,
\qquad \dot e_A=-\dot e_B,\quad \dot e_C=0,\quad e_C=g.
\tag{L.6e.14}
$$
Every sector divergence is calculated, not assigned: for $s=A,B,C$,
$\nabla_\mu(ne_su^\mu u^\nu)=n\dot e_su^\nu+ne_sa^\nu$.
The first terms are the paired work-to-bath transfer; the second terms are each carried energy's actual inertial share of the common acceleration. The physical internal heat four-current is $q_B^\nu=n\dot e_Bu^\nu$, and the battery transfer is $-q_B^\nu$. The proper internal heat is (L.6e.12); in a Killing or another observer convention the same transfer is the weighted integral $-\int q_B\cdot\xi\,dV$, not the unweighted scalar $W$. Acceleration-induced changes of $ne_su\otimes u$ remain mechanical transfer. The Gibbs temperature $T_b$ belongs to the supplied internal bath Hamiltonian; no acceleration temperature or Unruh identification is used. Summing gives (L.6e.7). The bath gain $Q_B$ is entered once under its thermal owner. Battery withdrawal is the corresponding source/work debit. The reset process owns the displayed channel and coherent-interaction carrier $T_C=ng\,u\otimes u$. This is a source-derived tensor.

Here is the finite cut-record map, with its receiving type explicit. Retain the five physical tensors $T_s$, $s\in\{0,A,B,C,\mathrm{EM}\}$, their exchange currents, and their actual raw restrictions to every registered cap and side piece. Let
$\Delta_s[\xi]$ be final-minus-initial stored current energy and $F_{s,k}[\xi]$ the outward current integral on side piece $k$, as in L.6c. The source tensors are retained before this finite integration; the gravitational map uses those actual tensors. A finite list of transaction IDs consists of every cap difference, every side restriction, and every geometric-work contribution. Its owner map is:

* each $\Delta_s$: **stored**;
* each bath side record $F_{B,k}$: **thermal**;
* each coherent-reset side record $F_{C,k}$: **reset**;
* actual radiative EM side records: **radiated** (zero on the present spherical source);
* all external/geometric input records and the negatives of body, battery and bound-EM side records: **source**, with their mechanical, battery energy/entropy-degradation, or electromagnetic-work subtype retained; the battery subtype is ideal pure work only in the normal limit.

In this source the EM record is entirely bound-field transport. For a cut intersecting the moving material, the reset and thermal side currents are actual carried interaction and bath energy. For a cut containing the entire material support those two outward records vanish, while their internal source and reset-channel records remain nontrivial. The side pieces and carriers are disjoint transaction IDs; a cap record is not entered again as a side record. In this difference convention the source label carries **external input only**; initial stocks enter through the cap differences. With $W_{\rm geom}=\sum_sW_s$, its image balance is exactly
$$
\underbrace{W_{\rm geom}-\sum_k(F_{0,k}+F_{A,k}+F_{\mathrm{EM},k})}_{\mathsf{source}}
=\underbrace{\sum_s\Delta_s}_{\mathsf{stored}}
+\underbrace{\sum_kF_{C,k}}_{\mathsf{reset}}
+\underbrace{\sum_kF_{B,k}}_{\mathsf{thermal}}
+\underbrace{0}_{\mathsf{radiated}}.
\tag{L.6e.15}
$$
Any actual external source is added to the source side by L.6c. Internal battery-to-bath and matter-to-field exchange currents cancel before (L.6e.15) is formed. Contracting with a different $\xi$ changes all entries together and leaves their ownership unchanged.

The precise relation to L.6a is a covariant **current-integration image** of its raw transaction records. Integration acts separately on each transaction coordinate and therefore commutes with the five ownership projections. Equation (L.6e.15) proves $\mathfrak D_{\rm image}=0$ in that scalar current-record space; using the four inertial translation currents gives the integrated four-vector version. The raw tensor and boundary-flux distributions on different caps and side pieces are retained in the space $X$ of L.6a with their physical ownership; Gauss's theorem supplies the balance in the integrated image.

The nonzero Coulomb–mechanical exchange, explicit reset channel, battery debit, bath gain, actual coherent interaction, finite initial stocks and all retained records belong to (L.6e.5). Translate the center of the annulus into a compact right-Rindler wedge to apply L.6c's non-inertial current convention. Apply L.6d to the same conserved complete source and every displayed sector; its Coulomb tail satisfies the initial Newton-integrability condition. This supplies one common action, source, record map and retarded attribution. The material model is the declared hybrid continuum source on Minkowski spacetime, with linearized gravitational attribution. The autonomous interaction remains present after the registered endpoint; later ready-state storage or repeated operation is a different protocol with its own control and stock requirements.

<a id="lemma-l6f-an-explicit-x-valued-representation-of-the-integrated-audit"></a>**Lemma L.6f (An Explicit $X$-Valued Representation of the Integrated Audit).** Fix one smooth non-null boundary collar of the registered slab, its directed unit flux conormal $n_\mu$, defined by $d\Sigma_\mu=n_\mu d\Sigma$ for positive induced measure, with $n\cdot n=\varepsilon\in\{-1,1\}$, a nonnegative tangential bump $\beta$ of integral one, and a smooth normal cutoff $\chi$ with $\chi(0)=1$. The collar lies away from corners, and its orientation is fixed before any transaction is evaluated. This directed-conormal convention includes the sign of a spacelike cap; it does not insert a second $\varepsilon$ into the flux integral. In the stated $c=1$ convention, $\beta$ has inverse three-volume units, $\chi$ and the normalized geometric vectors are dimensionless, and a four-momentum record $R$ therefore gives stress units for $\mathcal T_R$. On the inertial four-vector branch, transport a record vector $R$ constantly through this collar. Define
$$
\mathcal T_R^{\mu\nu}=\chi\beta\left[\varepsilon(n^\mu R^\nu+R^\mu n^\nu)-(n\cdot R)n^\mu n^\nu\right],
\qquad \mathcal J_R^\nu=n_\mu\mathcal T_R^{\mu\nu}\big|_{\partial\mathcal D}.
\tag{L.6f.1}
$$
This is a finite signed symmetric tensor and its actual normal boundary flux, so $\iota(R)=(\mathcal T_R,\mathcal J_R)$ belongs to the record space $X$ of L.6a. Its trace is $\mathcal J_R=\beta R$; hence integrated trace recovers $R$. The map is linear and injective. On the scalar observer-current branch, choose the smooth boundary vector $v=\xi/(-\xi^2)$ where $\xi$ is timelike, put $R=e v$, and extend it by the registered collar. Then the integrated observer-current trace is $-\int\xi\cdot\mathcal J_R=e$, giving a linear injective encoding of scalar current records.

*Proof.* Contracting (L.6f.1) with $n_\mu$ gives

$$
\chi\beta[R^\nu+\varepsilon(n\cdot R)n^\nu-\varepsilon(n\cdot R)n^\nu]=\chi\beta R^\nu.
$$

At the boundary $\chi=1$; normalization of $\beta$ gives the claimed recovery. This proves injectivity as well as the required bulk/flux relation. On the scalar branch $-\xi\cdot v=1$. All defining data transform with the geometry, proving covariance of the registered representation. ∎

Apply $\iota$ separately to the actual integrated transactions of (L.6e.15), retaining their IDs and ownership. Its linearity gives $\mathfrak D_X=\iota(\mathfrak D_{\mathrm{image}})=0$, and its coordinatewise action commutes with each ownership projection. Injectivity gives the converse as well: the encoded balance vanishes exactly when the actual integrated balance vanishes, so the representation cannot conceal an unbalanced record. The representation encodes the integrated physical balance proved above. The recomposed sum of encoded records is an audit-coordinate record; the gravitational attribution uses the source tensors of (L.6e.5)–(L.6e.7), not $\mathcal T_R$.

Exact domain: the smooth sector/current class of L.6c, the stated decaying Cauchy data of L.6d, and the registered hybrid constitutive source of L.6e on its certified pre-crossing finite slab, including every finite bath depth and its explicitly proved normal limit. Equivalence: the full physical sector and boundary records, the normalized shared-label terminal laws, and the declared integrated audit representation; it does not replace raw physical tensors by encoding tensors. Budget: every carrier, battery and bath level, paired and boundary branch, classical material label under its finite normalized measure, specified finite terminal tester, sector, boundary piece and Cauchy constraint. Verifiers: the action variations, shell derivative bounds, Gauss and Ampere identities, positive conserved energy, all-input matrix-unit reset map, Gibbs sums, entropy and heat limits, both initial gravitational constraint identities, and the cut-record owner list. Falsifiers include an omitted interaction source, a mismatch between channel and stock, input-dependent mean mass on the admitted memory/reference class, a nonnormalized terminal law, missing mechanical or geometric work, duplicate battery/heat charging, a nonzero alleged radiative flux in the spherical source, a failed Cauchy constraint, or use of an audit encoding as a physical gravitational source. Premises: Gauss's theorem, Kirchhoff's formula and uniqueness for the wave equation, the Newtonian potential on the decaying initial data, the Picard and Gronwall estimates for (L.6e.8), the action variations of (L.6e.5), Kraus normalization, concavity of conditional entropy and $I(A:B)\le2S(A)$. Nonvacuity: every nonzero charge $q$, every smooth radial annular density $n_0$ and every depth $D\ge1$; (L.6e.9) supplies the shell interval.

The construction establishes the source-population, beyond-inertial record-map and conserved-source retarded-attribution predicate on this registered mean-field continuum implementation. The record comparison uses the explicit equivalence by tagged integrated records, with Lemma L.6f supplying an injective, covariant, physically dimensioned representation in the unchanged space $X$. Raw cap and side distributions remain retained, and only the common-action tensors enter gravity. Scope limits: the implementation is a declared classical–quantum mean-field Maxwell–dust continuum on Minkowski spacetime, solved on a finite pre-crossing slab, with linearized gravitational attribution; its electromagnetic sector is a bound Coulomb field, so its radiated record is zero; the reset is exact only in the normal limit, each finite depth carrying the error $\delta_D\le r^D$ of (L.6e.11); the bath temperature is a parameter of the internal Hamiltonian; the retarded attribution is the finite-Cauchy map of Theorem L.6d, with source-owned constraint data on the initial surface; the non-inertial records are taken on compact windows. The past-compact obstruction of Theorem L.6b and all earlier source restrictions remain in force.

## **L.6 Connection to Thermodynamic Gravity Derivation**

### **Theorem L.7 (Conditional Horizon-Thermodynamic Consistency of the Aggregate Source)**

Assume the local-equilibrium horizon hypotheses of Theorems 48a.0 and 48a, the saturated and calibrated area-law branch of Theorem 49 together with its uniform first-variation convergence hypothesis, the Unruh temperature, and covariant conservation of the complete aggregate stress-energy tensor. Work with the limiting horizon-entropy first variation after that refinement limit. Require the joint shrinking-patch, normalized boost-error and uniform optical-data conditions stated below for each base point and null direction, and the smoothness needed for the final Bianchi/conservation argument. Then the local Clausius relation implies the Einstein equation with that complete tensor as source, up to a cosmological constant. This is a consistency derivation for an independently specified source tensor; it does not derive an electromagnetic carrier, retained aggregate energy, or either channel's microscopic origin.

Proof.

Theorem 49 (Section 12), using Theorem E.6, gives the saturated area law and its conditional first-variation limit. Let $S$ be a potential for the limiting first variation $\delta S=\Sigma_I\delta\mathcal A$, with its additive constant chosen so that:

$$ S = \frac{k_B c^3}{4G\hbar}\mathcal{A} = \Sigma_I \mathcal{A} \tag{L.47} $$

where the information density is:

$$ \Sigma_I = k_B\sigma_{\text{link}} C_{\text{max}} = \frac{k_B\chi}{\eta\delta^2} C_{\text{max}}. \tag{L.48} $$

with channel surface density $\sigma_{\text{link}} = \chi/(\eta\delta^2)$ (Theorem E.3), MPU spacing $\delta$, geometric factor $\eta$, correlation factor $\chi$, and dimensionless Non-Deterministic Reflexive Interaction Dynamics (ND-RID, Definition 6) channel capacity $C_{\text{max}}$ measured in nats. The factor $k_B$ in Equation (L.48) converts nats per unit area to thermodynamic entropy per unit area. Theorem E.2 gives $C_{\max}<\ln d_0$ on the refresh/minorization branch, and Proposition E.2a gives $C_{\max}\le\ln d_0-\ln2$ on the completed binary reset-support branch. The registered physical reset ledger $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)$ is a separate result of Theorem 31.

At a base point $p$ and a null direction $k_0$, use a family of hypersurface-orthogonal horizon patches with affine length $0\le\ell\le h$, initial area $A_h>0$ and transverse diameter tending to zero. Parallel transport the generators for comparison with $k_0$. Require uniform convergence of the contractions $T_{\mu\nu}k^\mu k^\nu$ and $R_{\mu\nu}k^\mu k^\nu$ to their values at $(p,k_0)$. The optical certificate supplies initial expansion $\sup|\theta(0)|=o(h)$ and shear $\sup_{0\le\ell\le h}|\sigma|=o(1)$, together with uniformly bounded curvature and regular solutions over the patch. These are uniform shrinking-patch conditions, not consequences of continuity at one point with a transverse region of nonzero limiting size.

Choose a positive boost scale $\kappa$ independent of $h$, with boost and surface orientation
$$
\chi^\mu=-\frac{\kappa\ell}{c^2}k^\mu+r_h^\mu,
\qquad
d\Sigma^\nu=k^\nu\,d\ell\,dA_\ell,
\qquad
\sup|r_h|=o(\kappa h/c^2).
$$
The bounded complete source and this remainder certificate give
$$
\delta Q
=-\frac{\kappa A_hh^2}{2c^2}
T_{\mu\nu}(p)k_0^\mu k_0^\nu+o(A_hh^2).
\tag{L.49}
$$
Indeed, uniform convergence replaces the contraction by its base-point value in the weighted integral, $\int_0^h\ell\,d\ell=h^2/2$, and the boost-error integral is $o(A_hh^2)$. The optical estimate below gives $dA_\ell=(1+o(1))dA_0$. Every additional source contribution enters linearly; in particular,
$$
\delta Q_{\mathrm{agg}}
=-\frac{\kappa}{c^2}\int_0^h\!\int
\ell\left(T_{\mu\nu}^{(\mathrm{EM})}
+\Delta T_{\mu\nu}^{(\mathrm{matter})}\right)
k^\mu k^\nu\,dA_\ell\,d\ell+o(A_hh^2).
\tag{L.50}
$$
On the independently certified thermal branch,
$$
T=\frac{\hbar\kappa}{2\pi k_Bc},
\tag{L.51}
$$
and require the normalized local Clausius identity
$$
\delta Q-T\delta S=o(A_hh^2).
\tag{L.52}
$$
The limiting entropy first variation gives
$$
T\delta S=\frac{\hbar\kappa}{2\pi k_Bc}\Sigma_I\delta A.
\tag{L.53}
$$

The four-dimensional Raychaudhuri equation is
$$
\frac{d\theta}{d\ell}
=-\frac12\theta^2-\sigma_{ab}\sigma^{ab}
+\omega_{ab}\omega^{ab}-R_{\mu\nu}k^\mu k^\nu.
\tag{L.54}
$$
Hypersurface orthogonality sets $\omega_{ab}=0$. The uniform initial, shear and curvature bounds first give $\theta=O(h)+o(h)$ on the interval; integrating the equation and using uniform convergence then gives
$$
\theta(\ell)=-\ell R_{\mu\nu}(p)k_0^\mu k_0^\nu+o(h)
\tag{L.55}
$$
uniformly for $0\le\ell\le h$. Thus $dA_\ell/d\ell=\theta\,dA_\ell$ gives
$$
\delta A=-\frac{A_hh^2}{2}R_{\mu\nu}(p)k_0^\mu k_0^\nu
+o(A_hh^2).
\tag{L.56}
$$
Dividing (L.52) by $A_hh^2$ and taking the limit yields
$$
T_{\mu\nu}(p)k_0^\mu k_0^\nu
=\frac{\hbar c\Sigma_I}{2\pi k_B}
R_{\mu\nu}(p)k_0^\mu k_0^\nu.
\tag{L.57}
$$
The calibrated value $\Sigma_I=k_Bc^3/(4G\hbar)$ therefore gives $S_{\mu\nu}k^\mu k^\nu=0$ for all null $k$, where $S_{\mu\nu}=R_{\mu\nu}-(8\pi G/c^4)T_{\mu\nu}$.

For completeness, in an orthonormal frame of signature $-+++$ take $k=(1,\mathbf n)$ for every unit spatial $\mathbf n$. Comparing $\mathbf n$ with $-\mathbf n$ gives $S_{0i}=0$. Taking coordinate axes gives $S_{ii}=-S_{00}$, and taking $(e_i+e_j)/\sqrt2$ gives $S_{ij}=0$ for $i\ne j$. Hence $S_{\mu\nu}=f g_{\mu\nu}$. On the stipulated smooth conserved-source branch, the contracted Bianchi identity implies $\nabla_\nu f=\frac12\nabla_\nu R$, so $f=R/2-\Lambda$ with constant $\Lambda$ on each connected component. Therefore
$$
R_{\mu\nu}-\frac12Rg_{\mu\nu}+\Lambda g_{\mu\nu}
=\frac{8\pi G}{c^4}T_{\mu\nu}^{(\mathrm{MPU})}.
\tag{L.58}
$$
The source, thermal and normalized shrinking-patch certificates are independent hypotheses of this compatibility derivation. It constructs neither an aggregate carrier nor those certificates. ∎

### **Remark L.7.1 (Consistency Check vs. Independent Derivation)**

Theorem L.7 is a conditional algebraic compatibility check. On its complete conserved-source, local-equilibrium, area-law, Unruh-temperature, and Clausius branch, it verifies that independently registered electromagnetic and retained-matter entries may occur in the same stress-energy ledger used by the horizon derivation of Einstein's equation. It constructs neither carrier and proves neither contribution nonzero. More precisely:

(i) a certified electromagnetic contribution enters $T_{\mu\nu}^{(\mathrm{MPU})}$ through Definition B.8;

(ii) a certified retained-matter contribution enters through the same complete-source ledger;

(iii) their sum is admissible as an Einstein source only when every exchange sector is included and covariant conservation holds; and

(iv) Theorem L.6 supplies first-law bookkeeping for declared disjoint channels, not existence of a CC source.

Theorem 50's horizon argument remains conditional on its own local-equilibrium and calibrated area-law premises. Failure of a proposed CC carrier to meet these source and conservation gates rejects that carrier branch; it does not by itself require modifying Einstein's equation or contradict the upstream PU structure.

On the stated joint branch, standard EFE accepts any independently constructed conserved aggregate stress-energy contribution.

## **L.7 Conditional Temporal-Modulation Channel Decomposition**

On the joint branch stated in Theorem L.8, the electromagnetic and gravitational models of Theorems L.2 and L.3 can be represented as frequency-labeled projections of one temporal-modulation variable.

### **Theorem L.8 (Conditional Temporal-Modulation Channel Decomposition)**

Let $t\mapsto\delta\tau(x,t)$ be real-valued and either a Schwartz function for each $x$ or a tempered distribution. With the Fourier convention
$$
\widetilde{\delta\tau}(x,\omega)=\frac{1}{2\pi}\int_{-\infty}^{\infty}\delta\tau(x,t)e^{i\omega t}\,dt,
$$
Fourier inversion gives the following identity pointwise on the Schwartz branch and distributionally on the tempered-distribution branch:
$$ \delta\tau(x,t) = \int_{-\infty}^{\infty} d\omega\, \widetilde{\delta\tau}(x,\omega) e^{-i\omega t}. \tag{L.59} $$
Reality requires $\widetilde{\delta\tau}(x,-\omega)=\widetilde{\delta\tau}(x,\omega)^*$.

The Fourier identity alone establishes no electromagnetic or gravitational carrier. The following channel statements are conditional:

(a) On a branch with $\omega\tau_{\text{medium}}\gg1$, a spatially varying modulation produces the phase mismatch calculated below. A compensating potential proportional to $\partial_\mu\phi$ is pure gauge because $\partial_\mu\partial_\nu\phi-\partial_\nu\partial_\mu\phi=0$. Electromagnetic radiation occurs only under the additional coherent-charge hypothesis of Theorem L.2: a conserved source current must have a nonzero time-dependent radiating multipole whose Maxwell solution has $F_{\mu\nu}\ne0$.

(b) On a branch with $\omega\tau_{\text{medium}}\ll1$, a modulation is quasi-static relative to the MPU cycle. Gravity responds to the complete instantaneous stress-energy. If a fraction $\eta_{\text{ret}}$ of energy supplied over $\tau_c$ remains localized in volume $V_S$, the associated mean retained energy density is $\eta_{\text{ret}}P_{\text{agg}}\tau_c/V_S$. Energy carried away is not part of that local source.

The carrier crossover set by $1/\tau_{\text{medium}}$ and target resonance set by $\omega_{\text{TLS}}$ are independent scales unless an additional relation between them is supplied.

Proof.

(a) High-Frequency Regime ($\omega \gg 1/\tau_{\text{medium}}$) → Electromagnetic Radiation

### **Step 1: Phase Mismatch Generation**

Write $\tau_0:=\tau_{\text{medium}}$ and assume $|\delta\tau(x,t)|\le q\tau_0$ for some $0<q<1$, with the supremum taken over the interval joining $0$ and $t$. The exact identity
$$
\frac{1}{\tau_0+z}=\frac{1}{\tau_0}-\frac{z}{\tau_0^2}
+\frac{z^2}{\tau_0^2(\tau_0+z)}
$$
gives a remainder bounded by $|z|^2/[\tau_0^3(1-q)]$. Hence
$$
\phi_i(t)=\frac{t}{\tau_0}-\frac{1}{\tau_0^2}\int_0^t\delta\tau(x_i,t')\,dt'+R_i(t),
\qquad
|R_i(t)|\le\frac{|t|\|\delta\tau\|_\infty^2}{\tau_0^3(1-q)}.
$$
For $\delta\tau(x,t)=\delta\tau_0(x)\cos(\omega t)$ with $\omega\ne0$,
$$
\phi_i(t)=\frac{t}{\tau_0}-\frac{\delta\tau_0(x_i)}{\omega\tau_0^2}\sin(\omega t)+R_i(t).
$$
If $\delta\tau_0$ is twice continuously differentiable on the segment joining $x_i$ and $x_j$, Taylor's theorem gives
$$
\Delta\phi_{ij}(t)
=-\frac{\nabla\delta\tau_0(x_j)\cdot(x_i-x_j)}{\omega\tau_0^2}\sin(\omega t)
+O\!\left(\frac{\|D^2\delta\tau_0\|_\infty|x_i-x_j|^2}{|\omega|\tau_0^2}
+\frac{|t|\|\delta\tau\|_\infty^2}{\tau_0^3(1-q)}\right). \tag{L.60a}
$$

A rapid spatially varying modulation therefore produces an oscillatory phase mismatch proportional to the modulation amplitude and its spatial gradient. This is the input required for the coherence-restoring gauge response discussed below.

### **Step 2: Reformulation via Cycle-Rate Perturbation**

Define the cycle-rate perturbation by
$$
\delta\nu(x,t):=\frac{1}{\tau(x,t)}-\frac{1}{\tau_0}.
$$
A separate harmonic-rate branch assumes
$$
\delta\nu(x,t)=\delta\nu_0(x)\cos(\omega t),
\qquad
|\delta\nu_0(x)|<\tau_0^{-1},
\qquad \omega\ne0.
$$
Its positive period is $\tau(x,t)=[\tau_0^{-1}+\delta\nu_0(x)\cos(\omega t)]^{-1}$. Integrating the rate with $\phi_i(0)=0$ gives exactly
$$
\phi_i(t)=\frac{t}{\tau_0}+\frac{\delta\nu_0(x_i)}{\omega}\sin(\omega t),
$$
and hence
$$
\Delta\phi_{ij}(t)
=\frac{\delta\nu_0(x_i)-\delta\nu_0(x_j)}{\omega}\sin(\omega t). \tag{L.60b}
$$
The specified link cost is therefore
$$
V_{\text{prop}}^{(\text{phase})}
=\frac{\kappa_{\text{phase}}\sin^2(\omega t)}{\omega^2}
\sum_{\langle ij\rangle}|\delta\nu_0(x_i)-\delta\nu_0(x_j)|^2. \tag{L.61}
$$
The reciprocal change of variables is exact, but a sinusoidal period perturbation generally produces a rate with a constant shift and higher harmonics. Equations (L.60b)–(L.61) apply to the harmonic-rate ansatz; the sinusoidal-period ansatz in Step 1 has its stated perturbative error. Neither ansatz supplies the independent radiating-current transfer required in Step 3.

### **Step 3: Gauge Field Compensation**

The minimal coupling prescription (Appendix G, Section G.4) compensates the phase mismatch through
$$
A_\mu\to A_\mu-g_{\text{em}}^{-1}\partial_\mu\phi.
\tag{L.62}
$$
The oscillatory phase $\phi_i^{\mathrm{osc}}:=\phi_i-t/\tau_0$ satisfies $\partial_t\phi_i^{\mathrm{osc}}=\delta\nu_0(x_i)\cos(\omega t)$; the full derivative is $\partial_t\phi_i=\tau_0^{-1}+\delta\nu_0(x_i)\cos(\omega t)$. Consequently the modulation of the time-component compensation potential obeys
$$
\delta A_0(x,t)\propto \frac{1}{g_{\text{em}}}\delta\nu_0(x)\cos(\omega t),
$$
with the proportionality and sign determined by (L.62) and the registered time-coordinate normalization.
The phase-compensation potential alone has zero field strength. On an additional coherent-charge carrier branch, assume a calibrated linear transfer
$$p_0=K_\nu\delta\nu_0,$$
where $K_\nu$ has units of dipole moment times time. On the leading electric-dipole branch, for $\mathbf p(t)=\mathbf p_0\cos(\omega t)$,
$$
\mathbf E_{\mathrm{dip}}(\mathbf r,t)
=\frac{\omega^2}{4\pi\epsilon_{\mathrm{vac}}c^2r}
\widehat{\mathbf r}\times(\mathbf p_0\times\widehat{\mathbf r})
\cos[\omega(t-r/c)], \tag{L.63}
$$
with $\mathbf B_{\mathrm{dip}}=c^{-1}\widehat{\mathbf r}\times\mathbf E_{\mathrm{dip}}$. Thus
$$
\langle u_{\mathrm{dip}}\rangle
=\epsilon_{\mathrm{vac}}\langle|\mathbf E_{\mathrm{dip}}|^2\rangle
\propto\frac{\omega^4K_\nu^2\delta\nu_0^2}{r^2}. \tag{L.64}
$$
For a finite source, its higher-multipole far-field correction can also scale as $r^{-1}$; it is not included in an $O(r^{-2})$ near-field remainder. Theorem L.8.2c gives an explicit amplitude-error certificate for transferring the dipole prediction to the complete Maxwell field.

The exact reciprocal identity is
$$
\delta\nu=-\frac{\delta\tau}{\tau_0^2}
+\frac{\delta\tau^2}{\tau_0^2(\tau_0+\delta\tau)}.
$$
For a small sinusoidal period perturbation, its leading harmonic amplitude is $\delta\nu_0=-\delta\tau_0/\tau_0^2$, with rate error $O(\delta\tau_0^2/\tau_0^3)$ including other harmonics. The radiation statement requires the calibrated carrier transfer and the declared dipole approximation or complete-field error certificate.

(b) Low-Frequency Regime ($\omega\tau_0\ll1$) → Conditional Gravitational Response

### **Step 1: Quasi-Static Approximation**

With the energy origin and positivity assumptions of Equation (L.0), $\langle H_{\text{eff}}\rangle=\hbar/\tau$. For $|\delta\tau|\le q\tau_0$ with $q<1$,
$$
\langle H_{\text{eff}}\rangle(x,t)
=\langle H_{\text{eff}}\rangle_0
\left[1-\frac{\delta\tau(x,t)}{\tau_0}
+O\!\left(\frac{\delta\tau^2}{\tau_0^2}\right)\right]. \tag{L.65}
$$

### **Step 2: Retained Energy Density**

Let $\eta_{\mathrm{ret}}\in[0,1]$ denote the fraction of the registered input energy $P_{\mathrm{agg}}\tau_c$ assigned to an additional localized matter sector at measurement time. The energy-current ledger must identify this as an increment relative to the baseline and exclude energy already counted in the electromagnetic sector or other stored terms. For constant mean input over $\tau_c>0$ and source volume $V_S>0$,
$$
\delta E_{\mathrm{ret}}=\eta_{\mathrm{ret}}P_{\mathrm{agg}}\tau_c,
\qquad
\langle\delta u\rangle=\frac{\delta E_{\mathrm{ret}}}{V_S}.
\tag{L.66}
$$
This is a volume average; a local uniform-density model is an additional assumption.

### **Step 3: Stress-Energy Sourcing**

On that uniform matter-increment branch, in a local orthonormal rest frame,
$$
T_{\hat0\hat0}^{(\mathrm{matter})}
=\epsilon_{\mathrm{baseline}}+\delta u
=\epsilon_{\mathrm{baseline}}+
\frac{\eta_{\mathrm{ret}}P_{\mathrm{agg}}\tau_c}{V_S}.
\tag{L.67}
$$

### **Step 4: Geometric Response**

On the Einstein-equation branch,
$$ R_{\mu\nu}-\frac{1}{2}Rg_{\mu\nu}+\Lambda g_{\mu\nu}=\frac{8\pi G}{c^4}T_{\mu\nu}^{(\text{MPU})}. \tag{L.68} $$
On scales for which the $\Lambda$ contribution is negligible, and under the quasistatic isotropic active-density model $p=wu$ with $1+3w\ge0$,
$$ \nabla^2\Phi=4\pi G(1+3w)\frac{u}{c^2}, \tag{L.69} $$
so a uniform retained increment inside a sphere of radius $R_S=(3V_S/4\pi)^{1/3}$ obeys
$$ \nabla^2\delta\Phi=4\pi G(1+3w)\frac{\eta_{\text{ret}}P_{\text{agg}}\tau_c}{c^2V_S}. \tag{L.70} $$

### **Step 5: Interior and Exterior Geometry**

Spherical symmetry and regularity at the origin give
$$
|\nabla\delta\Phi(r)|
=\frac{4\pi G}{3}(1+3w)\frac{\eta_{\text{ret}}P_{\text{agg}}\tau_c}{c^2V_S}
\begin{cases}
r,&0\le r\le R_S,\\
R_S^3/r^2,&r\ge R_S.
\end{cases}
$$
For a radial target segment of length $L_q>0$ on which $\delta\Phi$ is twice continuously differentiable, Taylor's theorem gives, with $\Delta\Phi$ denoting the magnitude of its endpoint difference,
$$
\Delta\Phi=|\nabla\delta\Phi(r)|L_q+
O\!\left(L_q^2\sup_{\text{segment}}\|D^2\delta\Phi\|\right).
\tag{L.71}
$$
The Hessian bound controls variation along the segment; the Laplacian alone does not supply that bound.
The exterior branch $r>R_S$ is exactly the retained-energy formula of Theorem L.3. Finally,
$$ \Delta\tau_d=\frac{\Delta\Phi}{c^2}\tau_c+O\!\left(\tau_c\frac{\Phi\Delta\Phi}{c^4},\tau_c\frac{(\Delta\Phi)^2}{c^4}\right). \tag{L.72} $$

Conclusion: Fourier decomposition and the phase calculation apply to the registered temporal modulation. They do not select a physical carrier. On the additional conserved-current branch, a calibrated nonzero dipole produces Maxwell radiation. On the additional retained-energy branch, localized stress-energy produces a weak gravitational response. The pure phase-compensation potential produces neither radiation nor stress-energy by itself.

The approximations used here separate according to $\omega\tau_{\mathrm{medium}}\gg1$ and $\omega\tau_{\mathrm{medium}}\ll1$. Resonance of a specified target is governed independently by $|\omega-\omega_{\mathrm{TLS}}|$. No universal crossover follows unless a relation among the carrier and target scales is supplied. ∎

### **Corollary L.8.1 (No Carrier-Independent Coupling Ratio)**

Theorem L.8 supplies no numerical electromagnetic-to-gravitational ratio. On the coherent-charge branch, the response depends on the calibrated source transfer, Maxwell geometry, target dipole, detuning, and bath. On the gravitational branch, it depends on the complete retained stress-energy, equation of state, and geometry. The constants $\alpha_{\mathrm{em}}$ and $G$ have different dimensions and cannot be divided without a common dimensionless observable.

Appendix Z's coupling calibration and Appendix E's entropy-density calibration may be used only after all branch hypotheses in those appendices and the carrier data above are supplied. Proposition L.5 establishes that the inputs in this appendix do not determine a numerical dominance bound.

*Proof.* Equation (L.25) shows that a dimensionless response ratio depends on carrier, target, retention, and geometry inputs absent from this corollary. The dimensions of $\alpha_{\mathrm{em}}$ and $G$ also differ, so the constants alone cannot form that observable. Proposition L.5 supplies the indeterminacy conclusion. ∎

### **Corollary L.8.2 (Conditional Cavitation-Boundary Radiation Criterion)**

A cavitation preparation yields a certified electromagnetic component only when Definition L.8.2b supplies a conserved coherent-charge source with a nonzero radiating dipole component and a Maxwell radiation-zone solution. Acceleration of an unspecified boundary supplies neither a charge current nor a detector response. In Appendix L, vacuum permittivity is $\epsilon_{\mathrm{vac}}$; $\varepsilon_0=\ln2$ denotes the SPAP constant.

*Proof.* Maxwell's equations are sourced by $J^\mu$, not by an unlabeled acceleration field. If the certified dipole spectrum vanishes, Theorem L.8.2c gives zero dipole power. If it has positive certified spectral weight, that theorem gives a positive electromagnetic component. Detectability remains conditional on the separate detector record required by Definition L.8.2b. ∎

### **Lemma L.8.2a (Preparation Independence of the Carrier Calculation)**

Suppose two preparations produce identical conserved source current, material response, initial data, boundary conditions, and Maxwell radiation branch. Then their far-zone Maxwell fields are identical.

*Proof.* The difference of the two fields solves the homogeneous Maxwell initial-boundary-value problem with zero initial and boundary data. Uniqueness of that registered problem makes the difference vanish. Thus the output depends on the carrier data, not on the preparation label. ∎

### **Definition L.8.2b (Cavitation-Boundary Temporal-Wave Certificate)**

Fix a finite collapse interval, boundary $\Sigma(t)$, Fourier convention, retained band $\mathcal B_{\mathrm{ret}}$, positive spectral measure $\mu_{\mathrm{spec}}$, and
$$
\mathbf p_\omega=
\int_{\Sigma_*}\boldsymbol\chi_\Sigma(\sigma,\omega)
\widetilde{\delta\nu}_\Sigma(\sigma,\omega)\,dA.
\tag{L.8.2b.1}
$$
An accepted $\mathfrak C_{\mathrm{cav}}$ certifies localization, small amplitude, the carrier hypotheses of Theorem L.8 and the phase-frame and connection hypotheses of Section G.3, and the retarded Maxwell branch. It also supplies the complete-field amplitude-error bound and spectral power identity specified in Theorem L.8.2c, a non-overlapping nonnegative power ledger, and either a positive-weight line with $\omega\ne0$ and $\mathbf p_\omega\ne0$ or
$$
0<\int_{\mathcal B_{\mathrm{ret}}}
\omega^4|\mathbf p_\omega|^2\,d\mu_{\mathrm{spec}}(\omega)<\infty.
\tag{L.8.2b.2}
$$
The record also fixes spectral normalization and residuals. Detectability claims require an additional detector transfer, noise, threshold, and decision record.

### **Theorem L.8.2c (Dipole Radiation on the Certified Branch)**

Consider a harmonic conserved current with angular frequency $\omega\ne0$, supported in $|\mathbf x|\le a$, with sufficient regularity and finite moments for the uniform retarded far-field expansion. Write $\mathbf p(t)=\operatorname{Re}(\mathbf p_\omega e^{-i\omega t})$, $k=\omega/c$ and $P_{\mathbf n}=I-\mathbf n\mathbf n^\top$. Its exact outgoing transverse amplitude and dipole part are
$$
\mathcal A_\omega(\mathbf n)
=\frac{i\mu_0\omega}{4\pi}P_{\mathbf n}
\int\mathbf J_\omega(\mathbf x)e^{-ik\mathbf n\cdot\mathbf x}\,d^3x,
\qquad
D_\omega(\mathbf n)
=\frac{\omega^2}{4\pi\epsilon_{\mathrm{vac}}c^2}P_{\mathbf n}\mathbf p_\omega.
$$
Thus $\mathbf E_\omega=e^{ikr}\mathcal A_\omega/r+O(r^{-2})$. With $\mathcal R_\omega=\mathcal A_\omega-D_\omega$,
$$
\langle u_{\mathrm{EM}}\rangle
=\frac{\epsilon_{\mathrm{vac}}}{2r^2}
|D_\omega(\widehat{\mathbf r})+\mathcal R_\omega(\widehat{\mathbf r})|^2
+O(r^{-3}).
\tag{L.8.2c.1}
$$
The leading electric-dipole power is
$$
P_{\mathrm{dip}}(\omega)
=\frac{\omega^4|\mathbf p_\omega|^2}
{12\pi\epsilon_{\mathrm{vac}}c^3}.
\tag{L.8.2c.2}
$$
A complete-field certificate with $0\le\eta<1$ and
$\|\mathcal R_\omega\|_{L^2(S^2)}
\le\eta\|D_\omega\|_{L^2(S^2)}$
gives
$$
(1-\eta)^2P_{\mathrm{dip}}(\omega)
\le P_{\mathrm{EM}}(\omega)
\le(1+\eta)^2P_{\mathrm{dip}}(\omega).
$$
A nonzero dipole coefficient alone is a statement about the leading dipole model; the complete field uses this error certificate.

*Proof.* On the stated retarded branch, the spatial vector potential is
$$
\mathbf A(t,\mathbf r)=\frac{\mu_0}{4\pi}
\int\frac{\mathbf J(t-|\mathbf r-\mathbf x|/c,\mathbf x)}
{|\mathbf r-\mathbf x|}\,d^3x.
$$
Expanding in $a/r$ retains the finite-source phase $e^{-ik\mathbf n\cdot\mathbf x}$ in its $r^{-1}$ coefficient. Taking the transverse electric field $-\partial_t\mathbf A_\perp$ gives $\mathcal A_\omega$ above; the outgoing magnetic amplitude is $\mathbf n\times\mathbf E_\omega/c+O(r^{-2})$. Current conservation and the vanishing boundary term give
$$
\int\mathbf J_\omega\,d^3x=-i\omega\mathbf p_\omega.
$$
Replacing the finite-source phase by $1$ therefore gives $D_\omega$. More precisely, $|e^{-is}-1|\le|s|$ yields the explicit absolute bound
$$
|\mathcal R_\omega(\mathbf n)|
\le\frac{\mu_0|\omega|}{4\pi}|k|a
\int|\mathbf J_\omega(\mathbf x)|\,d^3x.
$$
This correction is another $r^{-1}$ far-field amplitude. Small $|k|a$ supplies an absolute bound but needs comparison with $D_\omega$ to establish the relative certificate.

For real harmonic fields the mean squared field is half the squared complex amplitude. Since $1/(\mu_0c^2)=\epsilon_{\mathrm{vac}}$, the electric and magnetic contributions give (L.8.2c.1) and
$P_{\mathrm{EM}}=\epsilon_{\mathrm{vac}}c\|\mathcal A_\omega\|_2^2/2$.
For a possibly complex dipole vector,
$$
|P_{\mathbf n}\mathbf p_\omega|^2
=|\mathbf p_\omega|^2-|\mathbf n\cdot\mathbf p_\omega|^2,
\qquad
\int_{S^2}n_i n_j\,d\Omega=\frac{4\pi}{3}\delta_{ij}.
$$
The latter identity follows from rotation symmetry and its trace $\int_{S^2}|\mathbf n|^2d\Omega=4\pi$. Consequently
$\int_{S^2}|P_{\mathbf n}\mathbf p_\omega|^2d\Omega
=8\pi|\mathbf p_\omega|^2/3$,
which gives (L.8.2c.2) without requiring a real polarization axis. The triangle and reverse triangle inequalities applied to $D_\omega+\mathcal R_\omega$ prove the two power bounds.

For a spectrum, the certificate additionally identifies its registered averaged power with the integral of these mode powers against $\mu_{\mathrm{spec}}$, with a common $\eta<1$. This includes the time-window normalization and elimination of cross terms required by that identity. The positive finite integral in (L.8.2b.2) then gives $0<P_{\mathrm{EM}}<\infty$. The independent non-overlapping channel ledger supplies $P_{\mathrm{EM}}\le P_{\mathrm{agg}}$. No detector response or general source realization follows from these conditional estimates. ∎

### **Remark L.8.2d (Scope)**

No transfer function, numerical spectrum, pulse duration, or detector sensitivity follows from acceleration, near-field phase, or thermodynamic cost alone.

<a id="proposition-l82e-spherical-cavitation-has-no-electromagnetic-radiation-channel"></a>**Proposition L.8.2e (Spherical Cavitation Has No Electromagnetic Radiation Channel).** Let a compact Maxwell source in flat space have exactly spherical charge density and radial current,
$$
\rho(t,\mathbf x)=\rho(t,r),
\qquad
\mathbf J(t,\mathbf x)=J_r(t,r)\widehat{\mathbf r},
$$
with $\partial_t\rho+\nabla\cdot\mathbf J=0$. Then its total charge is constant, every electric multipole of order $\ell\ge1$ vanishes, every magnetic multipole vanishes, and the exterior retarded field is the static Coulomb field with $\mathbf B=0$. Consequently a purely radial spherical boundary motion, including a spherical cavitation collapse, radiates zero electromagnetic power.

*Proof.* Angular integration annihilates every spherical harmonic with $\ell\ge1$, so all electric multipoles beyond the monopole vanish. Radial current gives $\mathbf x\times\mathbf J=0$, and spherical symmetry similarly annihilates all higher magnetic multipoles. Charge conservation fixes the monopole. The unique spherically symmetric exterior Maxwell solution is therefore $\mathbf E=Q\widehat{\mathbf r}/(4\pi\epsilon_{\mathrm{vac}}r^2)$ and $\mathbf B=0$, whose Poynting flux vanishes. ∎

A nonzero cavitation-radiation certificate must therefore contain a symmetry-breaking charged multipole or another response-active current. Boundary acceleration alone cannot populate Definition L.8.2b.

<a id="theorem-l82f-symmetry-selection-rules-for-cavitation-radiation-and-an-explicit-axial-radiator"></a>**Theorem L.8.2f (Symmetry Selection Rules for Cavitation Radiation and an Explicit Axial Radiator).** Let a harmonic conserved current $\mathbf J_\omega$ satisfy the hypotheses of Theorem L.8.2c, with charge density $\rho_\omega=\nabla\cdot\mathbf J_\omega/(i\omega)$ and outgoing amplitude $\mathcal A_\omega$. Let $K\subseteq O(3)$ be a group with $\mathbf J_\omega(g\mathbf x)=g\mathbf J_\omega(\mathbf x)$ for all $g\in K$; then also $\rho_\omega(g\mathbf x)=\rho_\omega(\mathbf x)$. Use polar angles $(\theta,\phi)$ about $\widehat{\mathbf z}$ with unit vectors $\widehat{\boldsymbol\theta},\widehat{\boldsymbol\phi}$.

(a) $\mathcal A_\omega(g\mathbf n)=g\,\mathcal A_\omega(\mathbf n)$ for every $g\in K$ and $\mathbf n\in S^2$.

(b) *(Spherical class.)* If $K\supseteq SO(3)$, then $\mathcal A_\omega\equiv0$; this recovers Proposition L.8.2e frequency by frequency.

(c) *(Axial class without swirl.)* If $K$ contains every rotation about $\widehat{\mathbf z}$ and every reflection through a plane containing $\widehat{\mathbf z}$, then
$$
\mathcal A_\omega(\mathbf n)=a_\omega(\theta)\,\widehat{\boldsymbol\theta}(\mathbf n),
\qquad
a_\omega(0)=a_\omega(\pi)=0,
\tag{L.8.2f.1}
$$
so every $\widehat{\boldsymbol\phi}$-polarized component vanishes, the pattern is independent of $\phi$, and the dipole coefficient $\mathbf p_\omega$ is parallel to $\widehat{\mathbf z}$.

(d) *(Axial class with equatorial mirror.)* If $K$ also contains $z\mapsto-z$, then $a_\omega(\pi-\theta)=-a_\omega(\theta)$, the radiation vanishes in the equatorial plane, and $\mathbf p_\omega=0$, so the dipole term $D_\omega$ of Theorem L.8.2c vanishes.

(e) *(Explicit axial radiator.)* Let $g\ge0$ be a smooth radial function supported in $|\mathbf x|\le a$ with $\int g\,d^3x=1$, let $p\in\mathbb C\setminus\{0\}$, and put $\mathbf J_\omega(\mathbf x):=-i\omega p\,g(|\mathbf x|)\widehat{\mathbf z}$, so that $\rho_\omega=-p\,\partial_zg$ and $\mathbf p_\omega=p\widehat{\mathbf z}$. This source has the symmetry of (c) and is odd under $z\mapsto-z$. With $k=\omega/c$,
$$
\mathcal A_\omega(\mathbf n)=-\frac{\mu_0\omega^2p\,\hat g(k)}{4\pi}\sin\theta\,\widehat{\boldsymbol\theta},
\qquad
\hat g(k):=4\pi\int_0^ag(r)\frac{\sin kr}{kr}r^2\,dr\in\left[1-\frac{k^2a^2}{6},1\right],
\tag{L.8.2f.2}
$$
and the exact radiated power is
$$
P_{\mathrm{EM}}(\omega)=\hat g(k)^2\,\frac{\omega^4|p|^2}{12\pi\epsilon_{\mathrm{vac}}c^3}.
\tag{L.8.2f.3}
$$
For $ka<\sqrt6$ this is the complete-field certificate of Theorem L.8.2c with $\eta=k^2a^2/6$. The far-zone field scales as $r^{-1}$, its intensity as $r^{-2}\sin^2\theta$, and the spectrum as $\omega^4\hat g(\omega/c)^2|p|^2$.

*Proof.* (a) Substituting $\mathbf x=g\mathbf y$ with $|\det g|=1$ and $(g\mathbf n)\cdot(g\mathbf y)=\mathbf n\cdot\mathbf y$ gives $\int\mathbf J_\omega(\mathbf x)e^{-ik(g\mathbf n)\cdot\mathbf x}d^3x=g\int\mathbf J_\omega(\mathbf y)e^{-ik\mathbf n\cdot\mathbf y}d^3y$, and $P_{g\mathbf n}g=gP_{\mathbf n}$. The divergence commutes with orthogonal maps, which gives the invariance of $\rho_\omega$.

(b) Every rotation about $\mathbf n$ fixes $\mathbf n$, so by (a) the transverse vector $\mathcal A_\omega(\mathbf n)$ is fixed by all of them and vanishes.

(c) On the axis, the same argument with rotations about $\widehat{\mathbf z}$ gives $\mathcal A_\omega(\pm\widehat{\mathbf z})=0$. Off the axis, the reflection through the plane spanned by $\widehat{\mathbf z}$ and $\mathbf n$ fixes $\mathbf n$ and $\widehat{\boldsymbol\theta}$ and reverses $\widehat{\boldsymbol\phi}$, so the transverse vector $\mathcal A_\omega(\mathbf n)$ is a multiple of $\widehat{\boldsymbol\theta}$. A rotation by $\alpha$ about $\widehat{\mathbf z}$ maps $\widehat{\boldsymbol\theta}(\theta,\phi)$ to $\widehat{\boldsymbol\theta}(\theta,\phi+\alpha)$, so the coefficient is independent of $\phi$. From $\int\mathbf J_\omega\,d^3x=-i\omega\mathbf p_\omega$ and the symmetry, $\mathbf p_\omega$ is fixed by every rotation about $\widehat{\mathbf z}$, hence parallel to $\widehat{\mathbf z}$.

(d) The mirror $M_z$ maps $\mathbf n(\theta,\phi)$ to $\mathbf n(\pi-\theta,\phi)$ and $\widehat{\boldsymbol\theta}(\theta,\phi)$ to $-\widehat{\boldsymbol\theta}(\pi-\theta,\phi)$, so (a) gives $a_\omega(\pi-\theta)=-a_\omega(\theta)$ and $a_\omega(\pi/2)=0$. The same symmetry gives $M_z\mathbf p_\omega=\mathbf p_\omega$, which with (c) forces $\mathbf p_\omega=0$ and hence $D_\omega=0$.

(e) The current is fixed by rotations about $\widehat{\mathbf z}$ and by reflections through planes containing it, and $\rho_\omega=\nabla\cdot\mathbf J_\omega/(i\omega)=-p\,\partial_zg$ changes sign under $z\mapsto-z$. Also $\int\mathbf J_\omega d^3x=-i\omega p\widehat{\mathbf z}$. Radial integration gives $\int g(|\mathbf x|)e^{-ik\mathbf n\cdot\mathbf x}d^3x=\hat g(k)$ for every $\mathbf n$, and $P_{\mathbf n}\widehat{\mathbf z}=-\sin\theta\,\widehat{\boldsymbol\theta}$, which gives (L.8.2f.2). The bounds $1-x^2/6\le\sin x/x\le1$, $g\ge0$, $\int g=1$ and $|\mathbf x|\le a$ on the support give the interval for $\hat g(k)$. Theorem L.8.2c gives $P_{\mathrm{EM}}=\epsilon_{\mathrm{vac}}c\|\mathcal A_\omega\|_2^2/2$, and $\int_{S^2}\sin^2\theta\,d\Omega=8\pi/3$ with $\mu_0^2\epsilon_{\mathrm{vac}}c=1/(\epsilon_{\mathrm{vac}}c^3)$ gives (L.8.2f.3). The remainder $\mathcal R_\omega=(\hat g(k)-1)D_\omega$ satisfies $\|\mathcal R_\omega\|_2\le(k^2a^2/6)\|D_\omega\|_2$. The scaling statements follow from $\mathbf E_\omega=e^{ikr}\mathcal A_\omega/r+O(r^{-2})$. ∎

<a id="theorem-l82g-complete-compact-current-radiation-quotient-and-symmetry-classification"></a>**Theorem L.8.2g (Complete Compact-Current Radiation Quotient and Symmetry Classification).**

#### Domain and equivalence

Fix positive vacuum constants, $c=(\varepsilon\mu)^{-1/2}$, $a>0$, real $\omega\ne 0$ and $k=\omega/c$. Let $J$ be any compactly supported vector distribution in $B_{a}$ whose outgoing field and power satisfy the regularity assumed in L.8.2c (in particular every integrable current with the required derivatives). Its Fourier transform is entire, so its restriction to the real sphere is well defined. The ordinary integrals below are distributional pairings on this broader branch. Define $\rho=\operatorname{div}J/(i\omega)$, distributionally if needed. This covers the conserved harmonic-current class of that theorem, including smooth, integrable, surface and point sources when admitted there; no rotational, reflection, axial, or no-swirl symmetry is imposed. The retarded/outgoing solution is used. Radiation equivalence means equality of the complete outgoing transverse amplitude, not equality of near fields inside the source or microscopic realizations.

Define the linear map

$$
T_\omega J(n)=P_n \int J(x)\exp(-ik\, n\cdot x)\,dx,\quad P_n=I-nn^{\mathsf T},
$$

$$
A_\omega=(i\mu\omega/4\pi)T_\omega J.
$$

This is the already proved Maxwell map in L.8.2c. The following theorem completes its classification rather than adding a new carrier hypothesis.

#### Full response quotient

1. $J$ radiates if and only if $T_\omega J$ is not identically zero. Two currents are radiation-equivalent if and only if their difference belongs to $\ker T_\omega$.
2. Let $Y_{lm}$ be orthonormal scalar spherical harmonics, $l\ge 1$, $|m|\le l$. Put $E_{lm}=\nabla_S Y_{lm}/\sqrt{l(l+1)}$ and $M_{lm}=n\times E_{lm}$. These form a complete orthonormal basis of square-integrable transverse vector fields. Define $a_{lm}=\langle E_{lm},A_\omega\rangle$ and $b_{lm}=\langle M_{lm},A_\omega\rangle$. Then

   $$
   \begin{aligned}
   A_\omega &= \sum_{l,m}(a_{lm} E_{lm}+b_{lm} M_{lm}),\\
   P_{\mathrm{rad}} &= (\varepsilon c/2)\sum_{l,m}(|a_{lm}|^{2}+|b_{lm}|^{2}).
   \end{aligned}
   $$

   Consequently the entire current class, including all classes outside the three symmetries in L.8.2f, is classified by its two coefficient arrays modulo the exactly specified kernel. Radiation is equivalent to at least one nonzero coefficient. Magnetic/swirl channels and arbitrary nonaxisymmetric m are included.
3. On the smooth compact-source branch,

   $$
   \ker T_\omega=\{(\operatorname{curl}\operatorname{curl}-k^{2})F/(i\omega\mu):F\in C_c^\infty(B_a;\mathbb{C}^3)\}.
   $$

   For support in a closed ball, replace $C_c^\infty(B_a)$ by smooth functions supported in that same closed ball. This is an equality of sets, not only a sufficient construction.
4. Every finite choice of electric/magnetic multipole coefficients is realized by a smooth current in an arbitrarily chosen nonempty concentric shell inside $B_{a}$. This is not a claim that every tangential $L^2$ field is realizable by a compact current. Compact currents have analytic far amplitudes and impose additional range regularity.

#### Proof

The power identity in L.8.2c is $P_{\mathrm{rad}}=\varepsilon c\lVert A_\omega\rVert^{2}/2$. Its coefficient is positive, establishing (1). The Hodge decomposition on $S^2$ has no harmonic one-form sector. Expanding the scalar potentials in $Y_{lm}$ gives $E_{lm}$ and $M_{lm}$; integration by parts gives their orthonormality and completeness. Parseval gives (2).

For (3), Maxwell's electric equation is $(\operatorname{curl}\operatorname{curl}-k^{2})E=i\omega\mu J$. A compact smooth $F$ with the displayed $J$ is itself an outgoing solution with zero exterior field, hence zero radiation. Conversely, zero far amplitude implies that the outgoing electric field vanishes outside $B_{a}$ by the Maxwell Rellich uniqueness theorem. The field of a smooth compact current is smooth (one may use the retarded Helmholtz potential plus its differentiated charge potential). Thus $E$ is a smooth compact $F$ and $J$ has the displayed form. This identifies the full smooth kernel, including non-symmetry-protected null currents; it does not identify zero dipole moment with zero radiation.

The kernel statement also has a distributional version on the admitted compact-source branch. If $J\in\mathcal E'(B_a;\mathbb C^3)$ has zero outgoing amplitude, its retarded electric field $E$ is smooth and source-free outside its support. Exterior outgoing uniqueness makes $E$ vanish outside a ball containing that support. Thus $E$ is a compactly supported distribution in the containing ball and
$$
J=\frac{(\operatorname{curl}\operatorname{curl}-k^2)E}{i\omega\mu}.
$$
Conversely any compactly supported distributional $E$ defines this current and an outgoing solution with zero exterior field. This proves the kernel identity in the compact distribution class; for an open containing ball, first enclose the compact source in a smaller closed ball. A specified intermediate regularity class is obtained by intersecting this distributional operator range with that class. No equality of unproved potential regularity norms is needed. Smooth currents recover the smooth statement already proved.

For (4), choose the standard outgoing electric/magnetic vector spherical wave with the desired finite far coefficients. It is smooth away from the origin and solves the source-free Maxwell equation there. Choose a radial $C^\infty$ cutoff $\chi$ equal to zero inside $r_{1}$ and one outside $r_2$, $0<r_1<r_2<a$. Set $E=\chi E_{\mathrm{out}}$ and $J=(\operatorname{curl}\operatorname{curl}-k^{2})E/(i\omega\mu)$. $J$ is smooth and supported in $r_1\le r\le r_2$. Its field is $E$ by outgoing uniqueness, so its far amplitude is exactly the nominated finite array. Superposition gives every finite array. ∎

#### All compact-group selection rules

For any closed $K\subseteq O(3)$, act on currents by $U_gJ(x)=gJ(g^{-1}x)$ and on transverse fields by $V_gA(n)=gA(g^{-1}n)$. Then $T_\omega U_g=V_gT_\omega$. Define the normalized Haar projector $\Pi_K=\int_K V_g\,dg$. Every $K$-invariant source has its amplitude in $\operatorname{ran}\Pi_{K}$, and its coefficient vectors obey the corresponding finite-dimensional invariant-subspace condition in each $l$ sector (including the appropriate polar/pseudopolar parity for improper rotations).

Conversely every finite multipole array fixed by $\Pi_{K}$ has a K-invariant compact-current realization: average the finite shell realization above over K. Averaging preserves support, smoothness and the outgoing amplitude. Thus these selection rules are sufficient as well as necessary at every finite multipole order. There is no unenumerated symmetry exception: K may be trivial, finite, axial, chiral, full rotational, or a mixed reflection group.

The intertwining follows by changing variables $x=gy$ and $P_{gn}g=gP_n$. Haar averaging is an orthogonal projector because $V$ is a unitary representation of the compact group. This proves all assertions. The old $\mathrm{SO}(3)$, axial-no-swirl and axial-mirror cases are specializations, not assumptions of the new classifier.

#### Finite source-derived certificates

For the integrable-current branch let $J_1=\int|J(x)|\,dx$ and $z=|k|a$. The coefficient criterion above does not need this extra branch assumption. Replace $\exp(-ikn\cdot x)$ by its order-$N$ Taylor polynomial to define $A_{N}$. Uniformly on $S^2$,

$$
\lvert A_\omega-A_N\rvert\le C_N:=(\mu\lvert\omega\rvert/(4\pi))J_1e^{z}z^{N+1}/(N+1)!.
$$

Therefore

$$
\max(0,\lVert A_N\rVert_2-\sqrt{4\pi}\,C_N) \le \lVert A_\omega\rVert_2 \le \lVert A_N\rVert_2+\sqrt{4\pi}\,C_N.
$$

These yield certified lower/upper powers after squaring and multiplying by $\varepsilon c/2$. The components of $A_{N}$ are polynomials of degree at most $N+2$ restricted to $S^2$ and tangent to it. Their $E/M$ expansion therefore has no $l>N+3$ (this intentionally conservative cutoff avoids relying on a sharper cancellation). It can be integrated exactly from the finite source moments.

Proof: use the Taylor remainder bound $|e^{w}-\sum_{j=0}^{N}w^{j}/j!|\le e^{|w|}|w|^{N+1}/(N+1)!$, projection norm at most one, then triangle/reverse-triangle inequalities. For the harmonic-degree claim, $E_{lm}$ has component degrees at most $l+1$ and $M_{lm}$ degree $l$; scalar polynomial decomposition and Hodge decomposition, or coupling a scalar degree $\le N+2$ polynomial to a vector, give the stated safe bound. ∎

The cutoff can be sharpened to electric orders $\ell\le N+1$ and magnetic orders $\ell\le N$. To prove this, let $W_N(n)$ be the vector polynomial of degree at most $N$ before transverse projection, and split it into homogeneous pieces $W_j$. On the unit sphere,
$$
\operatorname{div}_{S^2}(P_nW_j)
=\operatorname{div}W_j-(j+2)n\cdot W_j,
\qquad
\operatorname{curl}_{S^2}(P_nW_j)=n\cdot\operatorname{curl}W_j.
$$
The first scalar polynomial has degree at most $j+1$ and the second degree at most $j$. Integration by parts expresses the electric and magnetic vector-spherical-harmonic coefficients through these two scalar fields, respectively. Scalar polynomial harmonic decomposition then makes the electric coefficients zero above $N+1$ and the magnetic coefficients zero above $N$. This also proves the earlier conservative cutoff.

For the same integrable-current branch, the phase $k n\cdot x$ is real. The integral Taylor remainder therefore has modulus at most $|k n\cdot x|^{N+1}/(N+1)!$, because the exponential factor in that remainder has modulus one. Thus the same power interval holds with the sharper error constant
$$
C_N^{\mathrm{sharp}}
=\frac{\mu|\omega|}{4\pi}J_1\frac{z^{N+1}}{(N+1)!},
$$
without the factor $e^z$. Both refinements use the same finite source moments and preserve the stated branch and exact-zero scope.

This is a constructive certificate for every nonzero amplitude: $C_N\to 0$ and a positive lower bound eventually appears. It is not an algorithm that decides exact zero for arbitrary real-function input after finitely many samples. Exact zero is characterized by the exact smooth kernel above. No finite sampled grid is called coverage-complete.

<a id="definition-l82h-actuated-charged-cavity-and-observable-clock-source"></a>**Definition L.8.2h (Actuated Charged-Cavity and Observable Clock Source).**

#### 1. Fixed source data and smooth collapse

Use SI-type dimensions with $\varepsilon=\varepsilon_{\mathrm{vac}}$, $\mu=\mu_0$, $c=(\varepsilon\mu)^{-1/2}$, and a positive action unit $\hbar$. Register $R_0,T,D,\nu_0,\kappa>0$, $0<\varepsilon_c\le 1/4$ and $0<\delta\le 1/4$. Here $\varepsilon_{c}$ is a dimensionless collapse fraction, distinct from $\varepsilon_{\mathrm{vac}}$. Put $a=(1+\delta)R_0$ and require

$$
b:=a/(cT)\le 10^{-6},\quad \kappa\, \varepsilon_c R_0\le\nu_0/4,\quad \nu_0T\le 10^{-3}.
\tag{1}
$$

Let

$$
\begin{aligned}
w(s) &= 630s^4(1-s)^4,\quad 0\le s\le 1,\ \text{and } w=0 \text{ otherwise},\\
F(s) &= \int_{-\infty}^s w(v)\,dv,\\
R(t) &= R_0[1-\varepsilon_c F(t/T)].
\end{aligned}
\tag{2}
$$

Thus $F=0$ before 0, $F=1$ after 1, and within [0,1],

$$
F(s)=126s^5-420s^6+540s^7-315s^8+70s^9.
$$

The radius decreases monotonically from $R_0$ to $R_1=R_0(1-\varepsilon_c)$ during the finite interval $[0,T]$, with four continuous derivatives at the endpoints (globally $C^4$, not $C^\infty$). The cavity does not reach a singular zero radius. The current is zero outside that interval; the initial and final electrostatic dipoles can differ. Tempered Fourier transforms, expressly permitted by L.8, cover those static endpoints. The radiation spectrum below avoids $\omega=0$ and uses the compactly supported current rather than illegally squaring a DC $\delta$ distribution.

Choose the fixed nonnegative radial weight

$$
\begin{aligned}
g(s) &= C_\delta (s-1)^4(1+\delta-s)^4\, 1_{[1,1+\delta]}(s),\\
C_\delta^{-1} &= \int_1^{1+\delta} s(s-1)^4(1+\delta-s)^4\, ds.
\end{aligned}
\tag{3}
$$

Then $\int s\,g(s)\,ds=1$. Every integral in this source is over fixed finite bounds or an explicitly convergent field integral. The polynomial source is $C^3$ at its spatial edges; smoother bump replacements are optional and unnecessary for the stated first/second derivative bounds.

#### 2. Material charges, continuity and symmetry breaking

Label fluid parcels by $(s,u)$, $1<s<1+\delta$, $u\in S^2$. Their positions and velocity are

$$
X(s,u,t)=sR(t)u,\quad v(t,x)=(\dot R/R)x.
$$

Attach the fixed signed material charge measure

$$
dQ=(3D/(4\pi))\, g(s)(e_z\cdot u)\, ds\, d\Omega.
\tag{4}
$$

This can be resolved into two nonnegative densities of positive/negative charge species: $dQ_+=(3D/(8\pi))g(s)(1+\cos\theta)\,ds\,d\Omega$ and $dQ_-=-(3D/(8\pi))g(s)(1-\cos\theta)\,ds\,d\Omega$. Each species is advected by the same controlled flow. Their positive mass density is spherical; their net electric charge is not.

With $r=|x|$ and $s=r/R(t)$, the actual Eulerian fields are

$$
\begin{aligned}
\rho(t,x)&=[3D/(4\pi)]\,g(s)\cos\theta/[R(t)r^{2}],\\
J(t,x)&=\rho(t,x)(\dot R/R)x.
\end{aligned}
\tag{5}
$$

At the smooth support edges these extend by zero. Both species separately satisfy continuity by pushforward of a time-independent material measure. Equivalently, differentiating (5) gives $\partial_t\rho+\operatorname{div}J=0$. The total charge is zero and the exact electric dipole is

$$
p(t)=\int x\rho\, dx=D R(t)e_z,\quad \int J\, dx=D \dot R(t)e_z.
\tag{6}
$$

The factors follow from $\int u_iu_j\,d\Omega=(4\pi/3)\delta_{ij}$ and $\int sg=1$. Every parcel speed is at most $a\varepsilon_c\lVert w\rVert_\infty/T$; $\lVert w\rVert_\infty=315/128$. Conditions (1) therefore keep every speed well below $c$. There is no imposed superluminal rigid response: local actuator programs are supplied before the event and the explicit trajectory is only that frozen protocol.

This current is invariant under rotations about z and mirrors containing z, with no swirl. It is not invariant under the equatorial mirror. It is the required class-(c) symmetry-broken current. The exact spherical no-radiation theorem is respected: its premise of spherical **charge density** fails.

#### 3. Physical temporal-rate transducer, not a fitted dipole constant

The clock interface is fixed before solving Maxwell's equation or selecting a detector. The cam is a bidirectional holonomic linkage, and the nominated input is its ring-radius/inertia servo: prescribe $\nu_{\mathrm{cmd}}(t)=\nu_0+\kappa\varepsilon_cR_0F(t/T)$, set $b_{\mathrm{rot}}(t)=\sqrt{3\hbar/(2m_{\mathrm{rot}}\nu_{\mathrm{cmd}}(t))}$, and the cam forces $R=R_0-(\nu_{\mathrm{cmd}}-\nu_0)/\kappa$. The forces in Section 4 include every reflected mechanical/electromagnetic load. Thus the selected drive orientation is rate-control → physical inertia/radius → material current, rather than a post hoc inference from a separately driven dipole. A boundary-linked neutral rotor has angle $\theta\in S^1$, angular-momentum states $|m\rangle$ with $m\in\mathbb{Z}$, and the explicitly engineered positive moment of inertia

$$
\begin{aligned}
I(R) &= 3\hbar/\{2[\nu_0+\kappa(R_0-R)]\},\\
H_{\mathrm{rot}}(R) &= L^{2}/[2I(R)].
\end{aligned}
\tag{7}
$$

One realization of the radius law is a neutral rotor mass $m_{\mathrm{rot}}$ running on a ring with cam-constrained radius $b_{\mathrm{rot}}(R)=\sqrt{I(R)/m_{\mathrm{rot}}}$. The smooth finite cam profile is part of the mechanical source specification; a fixed-radius free rotor would not have this law. Its radial kinetic energy and the force from the $R$ derivative of $H_{\mathrm{rot}}$ are source loads, not free changes of clock units.

A tangent-plane mounting makes that separation explicit. Let the rotor center move in its fixed radial direction, normal to the ring plane. The center velocity, radial ring velocity and angular ring velocity are then pairwise orthogonal, so the point-mass kinetic energy is
$$
\frac{m_{\rm rot}}2|\dot c|^2+
\frac{m_{\rm rot}}2\dot b_{\rm rot}^{\,2}+
\frac{I(R)}2\dot\theta^{\,2}.
$$
The first two terms are mechanical stores and introduce no hidden angular drive. The angular Hamiltonian is consequently the stated $L^2/[2I(R)]$, with all radial constraint work and reaction forces retained in the mechanical ledger. The ring dimensions and housing are fixed to fit throughout the registered radius interval.

Prepare $|\psi_{\mathrm{rot}}\rangle=\sqrt{1/3}|1\rangle+\sqrt{2/3}|2\rangle$. The Hamiltonians at different $R$ commute, so no adiabatic approximation occurs. Since the mean of $m^{2}$ is 3 and the difference $2^{2}-1^{2}$ is also 3,

$$
\begin{aligned}
\langle H_{\mathrm{rot}}\rangle/\hbar &= \nu(R):=\nu_0+\kappa(R_0-R),\\
\varphi_2(t)-\varphi_1(t) &= -\int\nu(R(t))\,dt.
\end{aligned}
\tag{8}
$$

The rate $\nu$ is an angular phase rate (radians are dimensionless), consistently with L.8 $\dot\phi=1/\tau$. Its full interference pattern repeats after $2\pi$ accumulated radians; $\tau=1/\nu$ is the registered rhythm scale and is not asserted to be a full $2\pi$ rotation period.

The rotor's angular probability density contains a nonzero interference term proportional to $\cos[\theta-\int\nu\,dt+\phi_0]$. Thus $\nu$ is an actual observable cycle/beat rate as well as exactly the L.0 energy-origin convention. It is not the unobservable global phase of one energy eigenstate. The initial superposition, phase reference and its finite preparation are retained resources.

Set $\tau_\Sigma=1/\nu(R)$ and $\delta\nu_\Sigma(t)=\kappa(R_0-R(t))$, uniform on the reference surface $\Sigma_*=\{r=R_0\}$. Its positive-period modulation obeys

$$
\delta\tau_\Sigma=-\delta\nu_\Sigma/[\nu_0(\nu_0+\delta\nu_\Sigma)],\quad |\delta\tau_\Sigma|/\tau_0\le 1/5.
$$

On $B_{\mathrm{ret}}$, $\omega\tau_\Sigma\ge[1/(2T)]/[5\nu_0/4]\ge 400$, explicitly placing the retained component on L.8's high-frequency branch. Lower frequencies and static endpoints are retained elsewhere in the ledger and are not mislabeled high-frequency.

The **derived** source interface is exact on every admitted $R(t)$, not just its leading harmonic:

$$
\begin{aligned}
p(t)-p_0&=-(D/\kappa)\delta\nu_\Sigma(t)e_z,\\
R&=R_0-\delta\nu_\Sigma/\kappa,\\
\rho[\delta\nu_\Sigma]&\ \text{given by (5)},\quad J[\delta\nu_\Sigma]=-\rho[\delta\nu_\Sigma]\,\delta\dot\nu_\Sigma\,x/(\kappa R).
\end{aligned}
\tag{9}
$$

Consequently Def. L.8.2b is populated for $\omega\ne 0$ with

$$
\begin{aligned}
\chi_\Sigma(\sigma,\omega) &= -D e_z/(4\pi R_0^{2}\kappa),\\
\tilde p(\omega) &= \int_{\Sigma_*} \chi_\Sigma\, \delta\tilde\nu_\Sigma(\omega)\,dA.
\end{aligned}
\tag{10}
$$

$\chi$ has units dipole·time/area. It is derived from material charge transport and the independently specified rotor cam law; it is not fitted to the emitted spectrum. No claim is made that a passive rotor with $I\propto R^{2}$ supplies (10).

Independently register the L.0 synchronized baseline: finitely many boundary rotor units start with the same observable beat phase and $\nu_0$, on a connected positive-weight phase-comparison graph. The equal-phase sector is a synchronized minimizer of the declared cosine/quadratic phase cost; it is prepared, not claimed to emerge without dynamics. Identical prescribed $H_{\mathrm{rot}}(R(t))$ preserves the common rhythm. The local Hermitian phase lines carry a nonzero integer $U(1)$ character, and their complex-linear edge identifications with cost $\lambda_{uv}|\psi_u-U_{uv}\psi_v|^{2}$, $\lambda_{uv}>0$, supply the exact G.3 compact-frame/edge-local comparison premises. This **neutral rotor phase connection** may be flat and is distinct from the charged matter Maxwell connection. Charged carrier lines independently use Wilson transport of the actual Maxwell field in their fixed charge unit. No identification of these two connections, or of a neutral phase gradient with Maxwell curvature, occurs. The current (5), not synchronization or the word MPU, sources the electromagnetic field. The recorded processing rhythm is the actual rotor beat/read-compare phase cycle; this construction does not assert a generic oscillator is a complete autonomous MPU.

This construction registers a local temporal **modulation** and its material transducer. It does not assert that this rate solves an autonomous free scalar temporal-wave equation or that the auxiliary rate itself propagates on the electromagnetic characteristic cone. The original L.8.2b carrier calculation is the causal retarded Maxwell response to the explicit current.

#### 4. Actual collapse mechanics and finite actuation

The coating is a compressible barotropic charged fluid surrounding an empty cavity, not an incompressible Rayleigh–Plesset shell. Choose a smooth positive reference mass density on the same annulus, with both charge species included and sufficient neutral ballast. Push it forward by $X=Rsu$ to obtain $\rho_{m}$. This obeys its own continuity equation and has $\operatorname{div}v=3\dot R/R$. Choose pressure $p_m=K\rho_m^{2}$, $K>0$, with positive internal-energy density $u_m=K\rho_m^{2}$. $K$ and ballast are source data; they may be chosen to keep the nominated sound speeds subluminal. The smooth zero-density edges carry zero barotropic pressure.

The momentum equation is

$$
\rho_m(\partial_t v+v\cdot\nabla v)=-\nabla p_m+\rho E+J\times B+f_{\mathrm{clock}}+f_{\mathrm{act}}.
\tag{11}
$$

Here $f_{\mathrm{clock}}$ denotes the specified neutral clock/cam mechanical loads. The exact local actuator force is

$$
f_{\mathrm{act}}=\rho_m(\ddot R/R)x+\nabla p_m-\rho E-J\times B-f_{\mathrm{clock}}.
\tag{12}
$$

The fields in (12) are the retarded fields computed from (5), or the total fields when the detector is loaded. This is a populated feed-forward force on the prescribed protocol, equivalently a local Lorentz-force cancellation plus the registered acceleration/pressure drive. Separate species controllers or internal neutral supports enforce their common flow. Tangential electromagnetic loads are included; no missing anisotropic force is assigned to a spherical pressure. The void boundary $r=R(t)$ is a real moving material boundary in this model.

Equations (2)–(5),(7),(11)–(12), initial static fields, initial resting parcels, the two rotor populations and no incoming radiative field form an exact driven solution. This inverse-drive construction is the same allowed type of externally prescribed physical service as the explicit polarization source of Theorem L.11.2c, but with different fluid mechanics and an actual collapse current. It is not a solution of the **unforced** free-bubble equation and is not advertised as one.

For a finite number of rotor units the cam radial kinetic energy is a smooth positive contribution to mechanical storage. For example one rotor adds $(m_{\mathrm{rot}}/2)(db_{\mathrm{rot}}/dR)^{2}\dot R^{2}$, in addition to center-of-mass kinetic terms. Its angular energy is (7), and the generalized radial load is $-\partial_RH_{\mathrm{rot}}$. On $R_1\le R\le R_0$ all these coefficients and forces are bounded. Source profiles have bounded derivatives, compact matter support, and finite separated retarded fields; hence the total required force and gross work are finite.

More explicitly, with $U_{m}$ including fluid internal/kinetic and cam radial kinetic energy, $U_{\mathrm{clock}}$ the actual rotor energy, and $U_{\mathrm{EM}}$ the full electromagnetic field energy, the coupled local work identities give

$$
\begin{aligned}
&E_{\mathrm{rad}}+U_{m,f}+U_{\mathrm{clock},f}+U_{\mathrm{EM,static},f}\\
&\quad = U_{m,i}+U_{\mathrm{clock},i}+U_{\mathrm{EM,static},i} + W_+-W_-,
\end{aligned}
\tag{13}
$$

where W_± are the positive/negative parts of total actuator work. All displayed stores are nonnegative under their fixed energy origins. Additional finite preparation/readout/ready-record services are separately owned. Electromagnetic output is counted once; it is not added a second time to W_+. If work is recovered, W_− is credited to the actuator; otherwise it becomes an explicitly owned heat output.

A finite gross ceiling is $\int_0^T\int|f_{\mathrm{act}}\cdot v|\,dx\,dt$ plus the corresponding absolute finite cam-drive work and ready-resource preparation costs. Every integrand is fixed by the source formulas. This is a finite constructive bound, not an optimum or a universal power ceiling. Initial static fields decay as $r^{-3}$ because the source is neutral dipolar, so their complete exterior energy is finite. The source budget $E_{\mathrm{in}}=U_i+W_+$ bounds the radiated energy; dividing by the declared reporting time gives the non-overlapping nonnegative power ledger required in L.8.2b.

#### Comparison of radial transport and clock laws

A volume-preserving charged coating has a different exact current law. Let $s$ be its initial physical radius, let $h\ge0$ be smooth with compact support strictly inside $R_0<s<B_0$, and carry the fixed signed measure $dQ=h(s)\cos\theta\,ds\,d\Omega$. For $R_1\le R(t)\le R_0$, put
$$
r(s,t)=\bigl[s^3+R(t)^3-R_0^3\bigr]^{1/3},\qquad
v_r=\frac{R^2\dot R}{r^2},\qquad
r_s=\frac{s^2}{r^2}.
$$
The Jacobian identity $r^2r_s=s^2$ proves volume preservation. Pushforward of $dQ$ gives the Eulerian density $\rho_e=h(s)\cos\theta/s^2$ and current $J=\rho_ev_r e_r$, with $s$ evaluated at the inverse material map. Continuity follows from this pushforward, and $\operatorname{div}v=r^{-2}\partial_r(r^2v_r)=0$. Angular integration yields
$$
p_z(R)=\frac{4\pi}{3}\int h(s)r(s,R)\,ds,\qquad
\frac{dp_z}{dR}=4\pi R^2\int\frac{h(s)}{r(s,R)^2}\,ds>0.
$$
Thus the dipole is an invertible smooth function of $R$ on the registered interval, generally different from the homothetic law $DR$. Smooth compact material support away from the cavity keeps every field regular.

The corresponding radial incompressible Euler motion can also be checked directly. With constant liquid density $\rho_L$, inner radius $b(t)>0$ and $A=b^2\dot b$,
$$
u_r(r,t)=\frac{A(t)}{r^2},\qquad
p_L(r,t)=C(t)+\frac{\rho_L\dot A(t)}r
                 -\frac{\rho_L A(t)^2}{2r^4}.
$$
Indeed $\partial_tu_r+u_r\partial_ru_r=\dot A/r^2-2A^2/r^5=-\partial_rp_L/\rho_L$. For an infinite exterior liquid, $C=p_\infty$ and
$$
p_L(b)-p_\infty=\rho_L\bigl(b\ddot b+\tfrac32\dot b^2\bigr).
$$
A clean interface with surface tension $\gamma$ has pressure command $p_g-p_\infty=\rho_L(b\ddot b+3\dot b^2/2)+2\gamma/b$. For a finite shell, $B(t)^3-b(t)^3$ is constant and
$$
p_L(b)-p_L(B)=\rho_L\dot A(1/b-1/B)
-\frac{\rho_LA^2}{2}(1/b^4-1/B^4).
$$
These are exact nonrelativistic radial-fluid identities. The actual charge Lorentz force and any anisotropic coating or clock load still require their explicit actuator/support terms in the momentum equation and work ledger. This comparison does not assign them to radial pressure.

There is likewise a distinct natural-inertia clock law. If $I(R)=I_0(R/R_0)^2$ with $I_0=3\hbar/(2\nu_0)$ and the same $m=1,2$ populations $1/3,2/3$, the commuting angular Hamiltonians give both positive mean-energy rate and relative phase rate
$$
\nu(R)=\nu_0\frac{R_0^2}{R^2},\qquad
R=R_0(1+\delta\nu/\nu_0)^{-1/2}.
$$
On the homothetic charged-source branch this produces the exact nonlinear relation
$$
\delta p_z=DR_0\bigl[(1+\delta\nu/\nu_0)^{-1/2}-1\bigr].
$$
Taylor's theorem, using the second derivative $3(1+x)^{-5/2}/4$, gives for $|\delta\nu|\le q\nu_0$, $q<1$,
$$
\left|\delta p_z+\frac{DR_0}{2\nu_0}\delta\nu\right|
\le\frac{3DR_0}{8\nu_0^2(1-q)^{5/2}}|\delta\nu|^2.
$$
For a collapse-only excursion $\delta\nu\ge0$, replace $(1-q)^{-5/2}$ by $1$. The fixed angular energy origin remains the $m=0$ level; radial constraint work and mechanical stores remain separately owned.

For a separately fixed even return-to-baseline profile $R(t)=R_0[1-\epsilon f(t/T)]$, where $0<\epsilon<1$, $0\le f\le1$ is nonzero, smooth and supported in $[-1,1]$, both $\delta R\le0$ and $\delta\nu\ge0$ have compact support. Their transforms are real. On $|\omega|T\le1$,
$$
|\widetilde{\delta R}(\omega)|
\ge\frac{\cos(1)}{2\pi}\int|\delta R(t)|\,dt>0,\qquad
\widetilde{\delta\nu}(\omega)
\ge\frac{\cos(1)}{2\pi}\int\delta\nu(t)\,dt>0.
$$
These inequalities follow by pairing the even functions with $\cos(\omega t)\ge\cos(1)$ on their support. For uniform boundary rate and fixed reference area $A_*$, the finite coefficient
$$
\chi_f(\omega)=\frac{D\,\widetilde{\delta R}(\omega)}
 {A_*\widetilde{\delta\nu}(\omega)}e_z
$$
therefore realizes the modulation-to-dipole identity for this fixed profile. It is a waveform-specific spectral extraction from the stated nonlinear material law; it asserts no arbitrary-drive linear, causal-LTI or passive susceptibility. The affine cam transducer specified earlier retains its separate uniform linear-response scope. Each alternative retains its own fluid, control, field and detector obligations when used as a full source.

The same even excursion has a complete-field relative certificate that uses the sign of its displacement and permits either sign of $\dot R$. For the homothetic source with its original normalized $g$, put $\mathfrak f_k(r)=3j_1(kr)/(kr)$, continuously equal to one at $kr=0$, and choose $F_k'=\mathfrak f_k$. Define the scalar effective dipole
$$
p_k(t)=D\int g(\lambda)\bigl[F_k(\lambda R(t))-F_k(\lambda R_0)\bigr]\,d\lambda.
$$
Differentiation gives $\dot p_k=D\dot R\int\lambda g(\lambda)\mathfrak f_k(\lambda R)\,d\lambda$. The exact angular current integral therefore yields, at $k=\omega/c$ and $\omega\ne0$,
$$
\widetilde A(\omega,n)=\frac{\mu\omega^2}{4\pi}\widetilde p_k(\omega)P_ne_z.
$$
This is the full outgoing electric-$\ell=1$ amplitude. The solid-ball representation gives $|\mathfrak f_k(r)-1|\le k^2r^2/10$. Integrating this bound between $\lambda R_0$ and $\lambda R(t)$, using $g\ge0$, $\int\lambda g=1$ and $\lambda R\le a$ and $\lambda R_0\le a$, proves
$$
|p_k(t)-D\delta R(t)|\le\frac{k^2a^2}{10}D|\delta R(t)|.
$$
Fourier integration and the preceding even-profile lower bound now give
$$
\frac{|\widetilde p_k-D\widetilde{\delta R}|}
 {D|\widetilde{\delta R}|}
\le\frac{(ka)^2}{10\cos(|\omega|T)}
\le\frac{(ka)^2}{10\cos1},\qquad |\omega|T\le1.
$$
Both amplitudes have the same angular factor, so this is also their complete $L^2(S^2)$ relative-field error. On any retained band bounded away from zero where the right side is below one, the dipole spectral weight is strictly positive and the full field is certified. No sign condition on $\dot R$ was used: the sign of $\delta R$ prevents the Fourier-cancellation loophole for this fixed excursion class.

<a id="theorem-l82i-derived-collapse-radiation-generic-time-scaling-bound-and-finite-detector-record"></a>**Theorem L.8.2i (Derived Collapse Radiation, Generic Time-Scaling Bound and Finite Detector Record).**

#### 5. Exact all-wavelength Maxwell solution

Use $f(z)=3j_1(z)/z$, $f(0)=1$. Angular integration gives the identity

$$
\begin{aligned}
&P_n\int_{S^{2}} u(e_z\cdot u)e^{-iz\, n\cdot u}\,d\Omega\\
&\quad =(4\pi/3)f(z)P_n e_z.
\end{aligned}
\tag{14}
$$

Therefore at each source time,

$$
\begin{aligned}
P_n\int J(t,x)e^{-ik n\cdot x}\,dx &= D \dot R(t)\, f_t(k)P_n e_z,\\
f_t(k) &= \int_1^{1+\delta} s\, g(s)\, f(ksR(t))\,ds.
\end{aligned}
\tag{15}
$$

With the original convention $\tilde f(\omega)=(1/2\pi)\int f(t)e^{i\omega t}\,dt$, define

$$
\begin{aligned}
B(\omega) &= (1/2\pi)\int_0^T \dot R(t)f_t(\omega/c)e^{i\omega t}\,dt,\\
B_0(\omega) &= (1/2\pi)\int_0^T \dot R(t)e^{i\omega t}\,dt.
\end{aligned}
$$

The exact outgoing amplitude is

$$
\tilde A(\omega,n)=i\mu\omega D\, B(\omega)P_n e_z/(4\pi).
\tag{16}
$$

It has purely electric $l=1$ angular content **at every wavelength**, despite the moving radial profile. This is an exact symmetry-plus-angular-integration fact, not the point-dipole approximation. The ordinary dipole Fourier coefficient on $\omega\ne 0$ is $\tilde p=DB_0/(-i\omega)$, whereas the complete exterior field uses $\tilde p_{\mathrm{eff}}=DB/(-i\omega)$. These two are not silently identified.

A useful exact time-domain form is obtained from

$$
\begin{aligned}
&K_A(u)=3c/(4A)[1-(cu/A)^{2}]\, 1_{|u|\le A/c},\quad \int K_A\,du=1,\\
&\int K_A(u)e^{i\omega u}\,du=f(\omega A/c).
\end{aligned}
$$

Put

$$
\begin{aligned}
q(u) &= \int_0^T \dot R(t)\int s\, g(s)K_{sR(t)}(u-t)\,ds\,dt,\\
p_{\mathrm{eff}}(u) &= D\Bigl[R_0+\int_{-\infty}^u q(v)\,dv\Bigr]e_z.
\end{aligned}
\tag{17}
$$

Thus $p_{\mathrm{eff}}$ changes from $DR_0$ to $DR_1$, $\dot p_{\mathrm{eff}}=Dq\,e_z$, and its derivatives are supported in $[-a/c,T+a/c]$. For every $r>a$ the entire exterior field equals the ordinary retarded electric-dipole field with $p_{\mathrm{eff}}$:

$$
\begin{aligned}
E(rn,t) &= (1/(4\pi\varepsilon))\bigl\{[3n(n\cdot p_{\mathrm{eff}})-p_{\mathrm{eff}}]/r^{3}\\
&\quad +[3n(n\cdot\dot p_{\mathrm{eff}})-\dot p_{\mathrm{eff}}]/(cr^{2})\\
&\quad +n\times(n\times\ddot p_{\mathrm{eff}})/(c^{2}r)\bigr\},
\end{aligned}
\tag{18}
$$

with every $p_{\mathrm{eff}}$ term evaluated at $u=t-r/c$; $B$ is the corresponding curl field. Equation (18) follows frequency by frequency from (16), Maxwell exterior uniqueness and the electric-$l=1$ outgoing solution, with the correct static dipole endpoints added. It includes induction and static terms. The apparently negative support in $u$ only expresses near-side propagation: the earliest physical detector arrival is $(r-a)/c>0$.

The far-zone field is exactly $-D\,P_ne_z\,\dot q(u)/(4\pi\varepsilon c^{2}r)$, its intensity scales as $r^{-2}\sin^{2}\theta$, and the full radiated energy is

$$
E_{\mathrm{rad}}=D^{2}/(6\pi\varepsilon c^{3})\int\dot q(u)^{2}\,du.
\tag{19}
$$

Its spectrum on positive $\omega$ is

$$
dE_{\mathrm{rad}}/d\omega=2D^{2}\omega^{2}|B(\omega)|^{2}/(3\varepsilon c^{3}).
\tag{20}
$$

This factor uses the original $1/(2\pi)$ Fourier convention and includes both conjugate frequencies of the real field. No harmonic factor-of-two is imported into a finite pulse.

#### 6. Positive retained band and complete-field certificate

Register $B_{\mathrm{ret}}=[1/(2T),1/T]$. On this band the phase centered at $T/2$ varies by at most $1/2$ radian. Since $\dot R$ has one sign,

$$
\lvert B_0(\omega)\rvert\ge\varepsilon_cR_0\cos(\omega T/2)/(2\pi)\ge\varepsilon_cR_0\cos(1/2)/(2\pi)>0.
\tag{21}
$$

The exact $f$ is the characteristic function of a uniform solid ball projected on an axis. The inequality $1-\cos x\le x^{2}/2$ and the ball's axial variance $1/5$ give

$$
1-z^{2}/10\le f(z)\le 1.
$$

Consequently

$$
\begin{gathered}
\lvert B-B_0\rvert\le(ka)^{2}\varepsilon_cR_0/(20\pi), \\
\lvert B-B_0\rvert/\lvert B_0\rvert\le\eta(\omega):=(ka)^{2}/[10\cos(\omega T/2)]\le b^{2}/[10\cos(1/2)]<1.
\end{gathered}
\tag{22}
$$

The exact $L^2(S^2)$ amplitude error is bounded by $\eta$ times the ordinary dipole amplitude. This proves L.8.2c's complete-field relative certificate on a positive-measure band with no cancellation loophole. For $b\le 10^{-6}$, $\eta<1.2\times 10^{-13}$. In particular the band contains strictly positive finite radiated energy.

Choose reporting duration $T_{\mathrm{rep}}=T+2a/c$. For the positive-frequency convention register $\mu_{\mathrm{spec}}=(8\pi/T_{\mathrm{rep}})\,d\omega$. Then integrating the harmonic power functional $\omega^{4}|\tilde p|^{2}/(12\pi\varepsilon c^{3})$ against $\mu_{\mathrm{spec}}$ gives the correct finite-pulse mean power $E_{\mathrm{dip,ret}}/T_{\mathrm{rep}}$; applying (22) gives its complete-field interval. The remainder of the positive spectrum is retained as a distinct nonnegative output, not deleted from the energy ledger. This populates the spectral normalization, positive-weight condition and residual requirements in L.8.2b.

#### 7. Exact time scaling and controlled dipole limit

Write $\beta=R_0/(cT)$, $\rho(s)=1-\varepsilon_cF(s)$, and define $Q_\beta$ by $q(Tv)=-\varepsilon_cR_0Q_\beta(v)/T$ using (17). Then $Q_\beta$ is explicitly the variable-width convolution of $w$ with the kernels of radii $\beta s_{\mathrm{rad}}\rho(s)$; its support is $[-b,1+b]$ and $\int Q_\beta=1$. Equations (18)–(19) give the exact family scaling

$$
\begin{aligned}
E_{\mathrm{rad}} &= [D^{2}\varepsilon_c^{2}R_0^{2}/(6\pi\varepsilon c^{3}T^{3})]\, I_\beta,\\
I_\beta &= \int Q_\beta'(v)^{2}\,dv.
\end{aligned}
\tag{23}
$$

The waveform, range scaling, broadened duration $T+2a/c$ and the entire finite-size correction are fixed by the same source. At fixed radius, changing $T$ changes $\beta$; therefore an exact $T^{-3}$ law without $I_\beta$ would be incorrect. The controlled electrically-small limit is

$$
I_0=\int_0^1 w'(s)^{2}\,ds=5040/143.
$$

For explicit error control let $W_j=\lVert w^{(j)}\rVert_\infty$ on the real line, $b=\beta(1+\delta)$, and $u=b\varepsilon_cW_0<1$. A conservative finite bound is

$$
\begin{aligned}
E_\beta &:= \sqrt{1+2b}\,\{bW_2/(1-u)^{3}+W_1[(1-u)^{-3}-1]\},\\
|\sqrt{I_\beta}-\sqrt{5040/143}| &\le E_\beta.
\end{aligned}
\tag{24}
$$

To prove it, represent the ball kernel by $z\in[-1,1]$ with density $3(1-z^{2})/4$. For each $s_{\mathrm{rad}},z$ the retarded map is $v=s+\beta s_{\mathrm{rad}}\rho(s)z$. Its derivative is $1-\beta\varepsilon_cs_{\mathrm{rad}}w(s)z\ge 1-u>0$. Pushforward gives $Q_\beta$ as a positive average of $w(s)/(1-\beta\varepsilon_cs_{\mathrm{rad}}w(s)z)$. Differentiating with respect to $v$ cancels the two terms containing $ww'$, leaving exactly $w'(s)/(1-\beta\varepsilon_cs_{\mathrm{rad}}w(s)z)^{3}$. Also $|s-v|\le b$. The mean-value theorem and the common support interval give (24). These arguments include the endpoints since $w$ extended by zero is $C^3$.

The profile constants and the resulting finite numerical margin are explicit. Put $x=2s-1$. On $0\le s\le1$,
$$
w=\frac{315}{128}(1-x^2)^4,\qquad
w'=-\frac{315}{8}x(1-x^2)^3,\qquad
w''=-\frac{315}{4}(1-x^2)^2(1-7x^2).
$$
Consequently
$$
W_0=\frac{315}{128},\qquad
W_1=\frac{1215}{49\sqrt7},\qquad
W_2=\frac{315}{4}.
$$
The maximum of $w$ is at $x=0$. Differentiating $x(1-x^2)^3$ gives $(1-x^2)^2(1-7x^2)$, so the positive maximum of $|w'|$ is at $|x|=1/\sqrt7$. For $|w''|$, set $y=x^2$; the relevant endpoint and stationary values of $|(1-y)^2(1-7y)|$ at $y=0,3/7,1$ are $1,32/49,0$. This proves all three constants, including the zero extension outside the interval. The polynomial identity and Beta integral also give
$$
\int_0^1w(s)\,ds=630B(5,5)=1,
\qquad
I_0=\int_0^1w'(s)^2\,ds
=630^2\,16\,[B(7,7)-4B(8,7)+4B(9,7)]
=\frac{5040}{143}.
$$
Here $B(a,b)=(a-1)!(b-1)!/(a+b-1)!$ for the positive integer arguments displayed. Writing $\Delta=E_\beta$, inequality (24) gives the full energy interval
$$
\bigl[\max\{0,\sqrt{I_0}-\Delta\}\bigr]^2
\le I_\beta\le(\sqrt{I_0}+\Delta)^2.
$$
At $b\le10^{-6}$ and $\varepsilon_c\le1/4$, one has $u\le315/(512\cdot10^6)$ and $\Delta<97/10^6$. These inequalities can be checked entirely with rational bounds: use $\sqrt7>13/5$ and $\sqrt{1+2b}<1+b$ in (24), then substitute the preceding upper bounds for $b,u,W_1,W_2$. Since $\sqrt{5040/143}>59/10$,
$$
\frac{|I_\beta-I_0|}{I_0}
\le\frac{2\Delta}{\sqrt{I_0}}+\frac{\Delta^2}{I_0}
<\frac{33}{10^6}.
$$
This controls the entire emitted pulse energy through the same exact finite-size kernel, as well as its limit proportional to $T^{-3}$.

#### 8. A directly derived finite-range detector transfer

Place the detector center at $x_D=re_x$, $r\ge 100cT>a$, with sensitive axis $e_{z}$. Compare context 0 (the initial source kept static at $R_0$) and context 1 (the collapse above). At the exact center define the sensing window

$$
t_0=(r-a)/c,\quad t_1=r/c+T/2,\quad \tau_D=t_1-t_0>0.
$$

Subtract the static context-0 field and integrate (18). Since $q\le 0$ and $p_{\mathrm{eff}}-p_0\le 0$,

$$
\begin{aligned}
G_0 &:= \int_{t_0}^{t_1}[E_{1,z}-E_{0,z}](x_D,t)\,dt\\
&= -D/(4\pi\varepsilon)\bigl\{r^{-3}\int_{-a/c}^{T/2}\delta R_{\mathrm{eff}}(u)\,du\\
&\quad +(cr^{2})^{-1}\delta R_{\mathrm{eff}}(T/2)+(c^{2}r)^{-1}q(T/2)\bigr\}>0,
\end{aligned}
\tag{25}
$$

where $\delta R_{\mathrm{eff}}=p_{\mathrm{eff},z}/D-R_0$. Every displayed term is nonnegative after the outside minus sign; the last is strictly positive. Thus the detector cannot be detecting a mathematically zero integrated radiation pulse by mistake. The gate stops midway through the pulse, rather than integrating both radiative lobes to zero.

An explicit lower bound follows from $w\ge 1$ on $[2/5,3/5]$, $b\le 1/10$ and $R_1/a\ge 3/5$. For $|t-T/2|\le R_1/(2c)$, every kernel in (17) is at least $9c/(16a)$, so

$$
\begin{aligned}
-q(T/2) &\ge [9R_1/(16a)]\, \varepsilon_c R_0/T\ge(27/80)\varepsilon_c R_0/T,\\
G_0/D &\ge 27\varepsilon_c R_0/(320\pi\varepsilon c^{2}rT)>0.
\end{aligned}
\tag{26}
$$

The measured finite-range field is explicitly decomposed into radiation, induction and changed static dipole contributions. The last term of (25) is its radiative transfer $G_{\mathrm{rad}}$. The positive other terms obey

$$
(G_{\mathrm{ind}}+G_{\mathrm{stat}})/G_{\mathrm{rad}} \le(80/27)[cT/r+(cT/r)^{2}(1/2+b)]<0.030.
$$

Thus the nominated point detector is in a quantitatively radiation-dominated range. The changed final Coulomb field is not reported as radiation. Equation (19) separately certifies the actual positive outgoing radiative flux.

The detector is a charged two-site rail, with endpoints $re_x\pm\ell e_z$, equal positive charge $q_{d}>0$ at each site, and a common smooth charge-cloud profile $f_{bD}$ supported in radius $b_{D}$. The fixed one-particle code has Hamiltonian $H_0=\hbar\nu_DI$, $\nu_D>0$, with hopping off during sensing. A context-independent negative background neutralizes the common charge. Exact scalar-plus-Peierls gauge covariance gives

$$
\begin{aligned}
H_{\mathrm{sig}}(t) &= -d\, E_{\mathrm{av},c}(t)\, Z,\quad d=q_d\ell,\\
E_{\mathrm{av},c}(t) &= (2\ell)^{-1}\int_{-\ell}^\ell\int f_{b_D}(y)\, E_{c,z}(x_D+s e_z+y,t)\,dy\,ds.
\end{aligned}
\tag{27}
$$

This is the charged-link grammar of Theorem L.11.2d, with a **different exact transient waveform** and a degenerate Ramsey target, so no AC-Stark or rotating-wave approximation is reused.

To choose finite cloud/link dimensions construct a source-derived Lipschitz ceiling $L$ for the integrated field per unit $D$ on $|x-x_D|\le(r-a)/2$. One explicit Jefimenko ceiling is

$$
L:=\tau_D/(4\pi\varepsilon|D|)\{2Q_0/d_0^{3}+2Q_1/(cd_0^{2})+Q_2/(c^{2}d_0)+I_1/(c^{2}d_0^{2})+I_2/(c^{3}d_0)\},
\tag{28}
$$

$d_0=(r-a)/2$, $Q_j=\int\sup_t|\partial_t^j(\rho_1-\rho_0)|\,dx$ and $I_j=\int\sup_t|\partial_t^jJ_1|\,dx$. All suprema are over the finite affected interval; the zero-order charge difference is bounded by its endpoint/supremum values. The suprema belong **inside** the spatial integrals because retardation samples different times. The smooth separated source makes every quantity finite and explicitly computable from (2)–(5). The actual Lipschitz constant is at most the defined $L$. Differentiating Jefimenko's kernels proves that ceiling: geometric derivatives yield $2/R^{3}$ or $1/R^{2}$ and retarded-time derivatives add $1/c$.

Choose $b_D+\ell$ less than both $(r-a)/2$ and $[G_0/(100DL)]$. Then the exact averaged transfer

$$
K:=D^{-1}\int_{t_0}^{t_1}[E_{\mathrm{av},1}-E_{\mathrm{av},0}]\,dt
$$

obeys $K\ge 0.99G_0/D>0$. The finite cloud/link averaging changes the full point transfer by at most one percent; (18) remains available to propagate each near-field term separately if a different geometry is chosen. This is a physical finite voltage transfer computed from source and geometry, not an unspecified detector gain.

#### 9. Quantum noise, complete instrument and decision record

During sensing $Z$ is conserved. Prepare the charged rail in $|{+x}\rangle$ and use a Ramsey phase reference to subtract the known context-0 phase $\theta_0=(d/\hbar)\int E_{\mathrm{av},0}\,dt$. The signal angle is

$$
\Delta\theta=(dD/\hbar)K.
\tag{29}
$$

For the registered classical-current branch, the outgoing quantized Maxwell field is a coherent displacement of vacuum. This follows directly from the forced free-field Hamiltonian: each transverse mode is a linearly forced oscillator, so its evolution is a Weyl displacement times a phase. Quantization does not turn a pure gauge phase into a source; the displacement is generated by (5). Static Coulomb endpoints are included in the longitudinal energy/mean field.

More explicitly, take the interaction picture with respect to the c-number-source forced-field unitary $U_c(t)$. Its exact displacement identity is $U_c^\dagger EU_c=E_{\mathrm{free}}+E_{\mathrm{classical},c}$; hence the remaining detector Hamiltonian contains the computed classical field plus the same free vacuum field in both contexts. This identity is exact even with detector loading because it is a change of interaction picture, not removal of the detector from the total Hamiltonian. The source current is maintained by its declared actuator.

The same charged rail admits the gauge-covariant polarization representation of Theorem L.11.2d: its transverse fluctuation interaction during the window is $-dZE_g(t)$, with $g$ the smooth cloud plus line-average form factor. $Z^{2}=I$ makes the polarization self-energy a context-independent scalar; it remains in the energy ledger. The exact interaction-picture sensing unitary is a conditional Weyl displacement times a scalar phase and the classical signal rotation. Let

$$
\begin{aligned}
\sigma_g^{2}&=\hbar/[2\varepsilon(2\pi)^{3}]\int d^{3}k\,c|k|\,|\hat g(k)|^{2}[1-(\hat k\cdot e_z)^{2}],\\
\zeta_\lambda(k)&=(i d/\hbar)\sqrt{\hbar c|k|/(2\varepsilon(2\pi)^{3})}\\
&\qquad(e_z\cdot\varepsilon_\lambda(k))\,\hat g(k)\int_{t_0}^{t_1}e^{ic|k|t}\,dt.
\end{aligned}
$$

A compact C3 cloud, for example the explicit polynomial smearing of Theorem L.11.2d, has finite $\sigma_{g}^{2}$. The initial product vacuum/rail-ready state is specified in the polarization representation. Its Coulomb-gauge state is the image under the exact PZW transformation and need not be a bare-vacuum product. Preparation and Ramsey effects are conjugated by that same unitary. Finite preparation pulses act on this registered ready resource with their separately budgeted error; no equality of vacua across gauges is assumed.

The commutator of the fluctuation Hamiltonians at two times is $d^{2}Z^{2}$ times a field c-number commutator. Since $Z^{2}=I$, the Magnus expansion terminates after a scalar second term, while the classical signal rotation commutes. Preparation, logical rotations and the endpoint effect are all transported by the same polarization-gauge unitary; an untransformed site-meter is never compared with a transformed state. The exact reduced off-diagonal multiplier is

$$
V=\exp(-2\lVert\zeta\rVert^{2}),\quad \lVert\zeta\rVert\le|d|\tau_D\sigma_g/\hbar.
\tag{30}
$$

The factor 2 follows from the overlap of the two coherent field states displaced by $\pm\zeta$. All source/target forcing commutators beyond this are scalars or the computed classical retarded phase; no bath-rate assumption or perturbative Markov limit is used. The complete dephasing channel is CPTP with Kraus operators $\sqrt{(1+V)/2}\,I$ and $\sqrt{(1-V)/2}\,Z$, followed by the signal $Z$ rotation. A coherent source displacement changes the phase but not the vacuum-noise factor $V$, so $V$ is the same in both contexts.

Choose $\ell$ small enough that $|d|\tau_D\sigma_g/\hbar\le 1/100$ while keeping $\ell>0$. This choice is noncircular: fix the cloud first; its line-average Fourier multiplier has modulus at most one, hence $\sigma_g\le\sigma_{\mathrm{cloud}}$ uniformly as $\ell\to 0$. Shrinking $\ell$ preserves the spatial transfer bound. Then set the finite source charge parameter

$$
D=\pi\hbar/(8dK).
\tag{31}
$$

Here K is already defined per unit D and independent of D by the linear Maxwell equations. Equations (1)–(10) and the fluid ballast/actuator loads are registered with that value before any data are generated. Source work may be large but is finite; this is an existence witness, not a practical-material efficiency claim.

With $\Delta\theta=\pi/8$, measure the Ramsey quadrature whose positive outcome probability is

$$
p_c=[1+V \sin(2(\theta_c-\theta_0))]/2.
$$

Then $p_0=1/2$ and $p_1=1/2+V/(2\sqrt{2})$, with $V\ge\exp(-1/5000)$. The ideal gap exceeds 0.3534. Both outcomes are retained. A finite positive rail-mixing rotation followed by the positive cross-Kerr pointer/occupation instrument of Theorem L.11.2d realizes this binary effect, with all outcome leaves and spent pointer/environment outputs retained, using the exact charged-rail grammar of Theorem L.11.2d. No postselection occurs.

Physical preparation/readout pulses have finite duration. The source-derived electric drift is bounded on their finite schedule; the smeared vacuum coupling has finite norm on the prepared-field isometry. Duhamel bounds therefore let smooth finite-amplitude pulse words approximate the ideal preparation and readout with any nominated positive error. Use total event-probability error at most 1/100 per context (source/field preparation, phase-reference and meter included). These are achieved by shortening finite controls and supplying the finite required amplitudes under the admitted prescribed-control grammar, not by claiming instantaneous gates. The target remains neutralized and all auxiliary rail/pointer packets are neutral, avoiding an omitted charged source.

The actual probabilities consequently satisfy

$$
p_0\in[0.49,0.51],\quad p_1>0.8434,\quad p_1-p_0>0.3334.
\tag{32}
$$

For independent fully supplied trials, threshold the retained click fraction at 2/3. Under either hypothesis the distance to the threshold is greater than 3/20. Hoeffding's inequality gives total two-sided decision-error bound

$$
P_{\mathrm{error}}\le 2 \exp[-2n(3/20)^{2}].
\tag{33}
$$

Thus $n=118$ gives error below 0.01. The record specifies the two source contexts, same detector/channel, finite sensing window, exact transfer K, intrinsic coherent/vacuum noise V, separate finite gate budget, fixed threshold, sample count and decision functional. Technical environmental noise is set to the declared vacuum-ready source; no empirical noise calibration or real detector performance is inferred. Independent repetitions require fresh complete ready resources and isolation from earlier spent/emitted outputs; a single environment is not reused to manufacture independence.

#### 10. Loaded source and resource ownership

The classical continuum source and its classical detector loading obey the total-field force (12) and the ordinary energy identity (13). For the quantum receiver, the explicitly admitted source is the **externally maintained c-number current service** (5), coupled to quantized Maxwell modes. Equation (12) is not claimed to be an operator-valued measurement-feedback controller, or an exact quantization of the fluid. The quantum field and detector are dynamical; the externally maintained current, prescribed cam/clock controls and their mean work are separately owned source services, as on the original classical-current branch of L.2 and the source of Theorem L.11.2d. This distinction prevents a classical force from being said to cancel vacuum fluctuations exactly.

Here is a finite, general-current loaded certificate. Write $\omega_k=c|k|$ and $\hat J(t,k)=\int J(t,x)e^{-ik\cdot x}\,dx$. In a transverse polarization basis, the source interaction-picture coherent displacement satisfies

$$
\begin{aligned}
\dot\beta_{c,\lambda}(t,k) &= i e^{i\omega_k t}\, \varepsilon_\lambda(k)^*\cdot\hat J_c(t,k)\\
&\qquad /\sqrt{2\varepsilon\hbar\omega_k(2\pi)^{3}}.
\end{aligned}
\tag{34}
$$

For a complete finite preparation/sensing/readout horizon S set

$$
\begin{aligned}
B_N &= \int_0^S\lVert\dot\beta_c(t)\rVert_2\,dt,\\
B_E &= \int_0^S\lVert\sqrt{\hbar\omega}\,\dot\beta_c(t)\rVert_2\,dt.
\end{aligned}
$$

Both are finite. At $k=0$, the number-norm integrand is $O(|k|^{-1})$ against $d^{3}k$ and is integrable. At infinity two integrable spatial derivatives of $J$ give $\hat J=O(|k|^{-2})$, sufficient for $B_N$; $B_E$ is finite directly by Parseval from $J\in L^2$. Uniform finite source derivative bounds and compact current time support make the time integrals finite. In particular,

$$
\lVert\beta_c(t)\rVert\le B_N,\quad \lVert\sqrt{\hbar\omega}\,\beta_c(t)\rVert\le B_E.
$$

The detector's time-dependent linear field coupling has bounded matter operator norm |d|, even during its rail-control gates. Define

$$
\begin{aligned}
\sigma_1^{2} &= \hbar^{2}/[2\varepsilon(2\pi)^{3}]\int d^{3}k\, \omega_k^{2}\, |\hat g(k)|^{2}[1-(\hat k\cdot e_z)^{2}],\\
B_{N,D} &= |d|S\sigma_g/\hbar,\quad B_{E,D}=|d|S\sigma_1/\hbar.
\end{aligned}
\tag{35}
$$

The same C3 smearing makes $\sigma_{1}$ finite. Integrating the exact Heisenberg annihilator equation and applying Minkowski's inequality on the prepared-vacuum isometry gives

$$
\begin{aligned}
\langle N_F\rangle &\le (B_N+B_{N,D})^{2},\\
\langle H_F\rangle &\le (B_E+B_{E,D})^{2}.
\end{aligned}
\tag{36}
$$

During the commuting sensing segment these also follow directly from the conditional Weyl displacements $\beta_c\pm\zeta$. The annihilator proof covers the finite noncommuting preparation/readout segments without assuming they have the sensing Kraus form. These are independent weighted-energy bounds; small state distance is not used to infer small energy.

The mean transverse source-to-free-field exchange (the Lorentz-power ledger) has the exact oscillator pairing of $\dot\beta_c$ with the field amplitude. Cauchy–Schwarz in the energy weight yields

$$
\int_0^S |\langle P_{\mathrm{source}},T(t)\rangle|\,dt \le 2B_E(B_E+B_{E,D}).
\tag{37}
$$

Equation (37) bounds field exchange, not by itself the gross work $\int|\langle\partial_tH_{\mathrm{source}}\rangle|$ of a time-dependent Hamiltonian control. To give that separate bound write $f_c(t,k)=e^{-i\omega_kt}\dot\beta_c(t,k)$ and $H_{\mathrm{source}}=i\hbar\int[a^\dagger f_c-af_c^*]$. Its regularity is set by $J$ and its explicit time derivative, rather than the oscillatory interaction-picture factor. Define $C_N=\int_0^S\lVert\partial_tf_c\rVert_2\,dt$, finite by the same low/high-frequency arguments applied to $\partial_tJ$. Then

$$
\int_0^S|\langle\partial_t H_{\mathrm{source}}\rangle|\,dt\le 2\hbar\, C_N(B_N+B_{N,D}).
\tag{38}
$$

The difference between these work conventions is the derivative of source-interaction storage. Equations (37) and (38) are **not** added as two costs; use the Hamiltonian-drive convention with its interaction store restored for the quantum expectation ledger.

Longitudinal source/self/cross Coulomb terms are finite because both clouds are smooth and separated. Bound their absolute drive work by the explicitly computable quantity $\int_0^S\lVert\partial_tH_C(t)\rVert\,dt$ on the finite detector code, adding any classical source Coulomb variation separately exactly once. Preparation/readout drive work is bounded by $\int\lVert\partial_tH_{\mathrm{ctrl}}\rVert\,dt$ and the retained positive scalar baselines on their finite schedules. Thus every loaded source, coupling, detector and control contribution has a finite ceiling. In this quantum extension (13) is the corresponding **expectation** first law with the coupling/Coulomb scalars restored; it is not a hard photon-number or realization-wise energy ceiling.

The pulse's final radiative energy is independently (19). At low frequency $B(\omega)=O(1)$, so (20) divided by $\hbar\omega$ remains integrable; at high frequency finite energy already controls photon number outside any neighborhood of zero. The detector's additional displacement has the finite bounds (35). Source radiation plus target loading therefore remains a finite-energy, finite-mean-number process at the specified finite instance. The initial static charge fields, target background and polarization self-energy are counted once. There is no arbitrary loaded-source inference from an unloaded energy bound.

The signed charge layer, neutral ballast, finite rotor preparation, phase-comparison references, fluid pressure/drive, initial electrostatic field, positive detector baseline, control pulses, neutral pointers and spent outcomes have distinct owners. Registers are supplied and stored rather than asserted to be erased at zero cost. Classical continuum/control and ready quantum resources are explicit source inputs; no autonomous finite battery, exact finite-temperature reset, unique PU realization or whole-lifecycle optimum is asserted.

## **L.8 Experimental Protocols and Testable Predictions**

<a id="protocol-convention-l80-matched-receiver-operation-count-audits"></a>**Protocol Convention L.8.0 (Matched-Receiver Operation-Count Audits).**

A receiver-relative operation-count audit must register all of the following before cost data are inspected:

1. the exact serialized input and its sampling law, with the same realized serialization delivered to both receivers in each yoked trial;
2. a typed target-binding map proving which receiver treats the input as self-model content and which treats it as external content;
3. a receiver-exchange isomorphism for instruction semantics and cost units, including calibrated counter uncertainty;
4. restoration from registered initial-state snapshots or an explicit carryover model, with setup and restoration costs separated from the integration subtask;
5. randomized crossed receiver and target labels, blinded analysis, and checks for address resolution, memory locality, cross-talk, and order effects;
6. Theorem M.10.5's effective descriptions, moduli, and decision certificate, fixed independently of the cost observations;
7. when Appendix B is tested, Corollary B.2.2's constants and execution class together with either a fixed-path count or a verified all-path upper bound.

Let $Y_{\mathrm{nTRr}}$ be the counted cost for ladder index $n$, target label $T$, receiver label $R$, and replicate $r$. A crossed analysis may use
$$
Y_{\mathrm{nTRr}}
=
a_n+b_{nR}+d_{nT}
+\gamma_n\mathbf1_{\{R=T\}}
+u_r+\varepsilon_{\mathrm{nTRr}},
\tag{L.72a}
$$
with a preregistered covariance model and identification constraints such as
$$
\sum_R b_{nR}=0,
\qquad
\sum_T d_{nT}=0
\qquad(n\ \text{fixed}).
$$
The coefficient $\gamma_n$ estimates a receiver-target interaction after ladder-specific receiver and target effects are removed. A nonzero value does not uniquely identify SPAP proximity: ordinary address binding, cache locality, update routing, or another receiver-target interaction can produce it unless excluded by the implementation certificate.

For a fixed exact design whose constrained design matrix $X$ has full column rank and whose errors are independent and homoskedastic with variance $\sigma^2$, ordinary least squares has $\operatorname{Cov}(\widehat\beta\mid X)=\sigma^2(X^\top X)^{-1}$; the usual estimator is $s^2(X^\top X)^{-1}$ under its residual-degree-of-freedom assumptions. With paired trials, repeated receivers, uncertain $\mu$ enclosures, heteroskedasticity, or carryover, the applicable covariance is the preregistered generalized-least-squares or hierarchical covariance. No trial count follows before the finite target effect, covariance, counter error, and exclusion model are supplied.

This convention is a design and audit rule. It does not convert a lower complexity bound into a finite-ladder slope law and does not assign heat without registered resets.

### **Protocol L.1 (Electromagnetic Channel Detection)**

This protocol tests the coherent-charge carrier implementation analyzed in Proposition L.4. Testing alternative carrier implementations may require different target systems and measurement strategies, pending specification of their mechanisms through POP/PCE derivation.

Apparatus Configuration:

Primary Target: Trapped ion with controllable transition frequency $\omega_{\text{TLS}}/(2\pi) = 1$–10 GHz

Alternative Targets: NV center ($\omega_{\text{TLS}}/(2\pi) \approx 2.87$ GHz), superconducting qubit (tunable $\omega_{\text{TLS}}$)

Isolation: Cryogenic shielding, double-layer mu-metal magnetic shielding, grounded Faraday cage

Field Calibration: Known classical field $E_{\text{cal}}$ to calibrate AC Stark response

Decoherence Monitoring: Continuous measurement of coherence times $T_1$, $T_2$ to track environmental perturbations

### **Measurement Sequence:**

Baseline Characterization: Measure probability distribution $P_{\text{Born}}(i)$ for target observable without aggregate influence over $N_{\text{cal}} \gtrsim 10^6$ trials. Establish baseline decoherence rates $\gamma_0$.

Aggregate Application: Apply high-complexity MPU aggregate $S$ (controlled laboratory system with well-characterized $C_{\text{agg}} \ge C_{op}$ implementing engineered coherent-charge carrier) at controlled distance $r$.

Statistical Measurement: Measure probability distribution $P_{\text{obs}}(i)$ over $N_{\text{trials}}$ repetitions.

Deviation Analysis: Compute $\Delta P(i) = P_{\text{obs}}(i) - P_{\text{Born}}(i)$.

Significance Test: Apply $\chi^{2}$ test for deviation significance.

### **Statistical Requirements:**

For independent identically distributed Bernoulli trials with a known baseline $p_0\in(0,1)$, let $\Delta p>0$ and $p_1=p_0+\Delta p\in(0,1)$ be the preregistered alternative. Write $z_q$ for the standard-normal $q$-quantile. For a one-sided asymptotic $z$-test with $0<\alpha,\beta<1/2$, size $\alpha$ and target power $1-\beta$, the normal approximation gives
$$
N_{\mathrm{trials}}
\approx
\frac{\left[z_{1-\alpha}\sqrt{p_0(1-p_0)}+z_{1-\beta}\sqrt{p_1(1-p_1)}\right]^2}{(p_1-p_0)^2}.
\tag{L.73}
$$
Replacing $p_1(1-p_1)$ by $p_0(1-p_0)$ gives the fixed-null-variance, local-alternative approximation
$$
N_{\mathrm{trials}}
\approx
\frac{(z_{1-\alpha}+z_{1-\beta})^2p_0(1-p_0)}{(\Delta p)^2},
$$
which is not the general power formula.
If the baseline is estimated from finite data, its sampling variance must be added; a multinomial endpoint requires the corresponding covariance matrix and test statistic. The Hamiltonian ratio $\delta/\omega$ cannot be substituted for $\Delta p$ until a target-specific open-system likelihood derives that map. Consequently, the present conditional Stark-scaling formulas do not determine a trial count or experimental timeline.

### **Practical Mitigation Strategies:**

Parallel Measurements: Deploy $N_{\text{parallel}}$ independent ion traps operating simultaneously

Enhanced Coupling: Utilize near-resonant detuning or cavity enhancement to increase $\delta/\omega$

Improved Field Generation: Engineered structures (plasmonic antennas, metamaterial enhancement)

Target Optimization: Select target systems with larger dipole moments or lower transition frequencies

### **Control Protocols:**

Temporal Randomization: Aggregate conditions randomly interleaved (blind to measurement system)

Distance Variation: Vary $r$ to test $\delta(r) \propto 1/r^2$ prediction

Frequency Detuning: Vary $\Delta = \omega_{\text{TLS}} - \omega_{\text{rad}}$ to verify $\delta \propto 1/\Delta$

Blind Analysis: Measurement sequence unknown to experimenters during data collection

Null Control: Identical protocol with aggregate in low-complexity state ($C_{\text{agg}} < C_{op}$) or deactivated

### **Protocol L.2 (Energy Conservation Verification)**

Apparatus:

Calorimeter: Precision water-bath or gas-flow calorimeter to measure total heat output from aggregate $S$, sensitivity $\sim 0.1$ W

EM Field Probes: Calibrated antennas at distances $r_1, r_2, \ldots$ covering frequency range $10^7$–$10^{11}$ Hz

Temperature Sensors: Thermocouples or thermistors monitoring thermal dissipation $P_{\text{heat}}$

### **Measurements:**

Total Power Input: $P_{\mathrm{agg}}$ from operational power monitoring.

Radiated EM Power: $P_{EM}=\int_{\mathcal S}\vec S\cdot d\vec A$ over a closed calibrated surface.

Boundary Heat Flow: $P_{heat,out}$ measured or inferred from a calibrated thermal model.

Mechanical Work: $P_{\mathrm{mech}}$ measured at the control-volume boundary.

Stored Energy: $E_{\mathrm{stored}}$ includes thermal, electromagnetic, chemical, and mechanical storage inside the control volume. In an isothermal lumped model its thermal term is $C_VT$, so $dE_{\mathrm{thermal}}/dt=C_VdT/dt$ only when $C_V$ is constant.

Energy Closure Test: for $P_{\mathrm{agg}}>0$, use
$$
\epsilon_{\mathrm{closure}}
=\frac{\left|P_{\mathrm{agg}}-P_{\mathrm{EM}}-P_{\mathrm{heat,out}}-P_{\mathrm{mech}}-dE_{\mathrm{stored}}/dt\right|}
{P_{\mathrm{agg}}}.
\tag{L.74}
$$
For $P_{\mathrm{agg}}=0$, use the absolute power residual in the numerator, with a threshold in power units, or divide it by a separately registered positive reference power. Acceptance thresholds must follow from propagated calibration and model uncertainties; conservation alone does not select a percentage.

### **Protocol L.3 (Gravitational Channel Test)**

Apparatus:

Atomic Interferometer: State-of-art sensitivity $\Delta\tau/\tau \sim 10^{-18}$ (optical clock comparison, Sr or Yb lattice clocks)

### **Test Configuration:**

Position target quantum system at distance $r \approx 0.5$ m from aggregate $S$ maintaining high-CC state ($C_{\text{agg}} \gg C_{op}$).

### **Measurement:**

Compare proper-time accumulation in the target and reference clocks over a registered integration time $T_{\text{int}}\in[10^3,10^5]\,\mathrm s$.

Framework status:

No numerical $\Delta\tau_d$ follows until the localized source stress-energy, retention fraction, source-target geometry, and clock response are supplied. If the conditional value
$$
\Delta\tau_d=6.6\times10^{-54}\,\mathrm s
\tag{L.75}
$$
is imported from a separately validated source model, a fractional clock sensitivity of $10^{-18}$ gives
$$
\Delta\tau_{\min}
\in[10^{-15},10^{-13}]\,\mathrm s
$$
and therefore
$$
\frac{\Delta\tau_{\min}}{\Delta\tau_d}
\in[1.5\times10^{38},1.5\times10^{40}].
\tag{L.76}
$$

Expected Outcome:

For the separately imported comparator $\Delta\tau_d=6.6\times10^{-54}\,\mathrm s$, the declared apparatus is many orders of magnitude too insensitive; a null result is therefore non-identifying. Such a result is consistent with Proposition L.5 but does not confirm electromagnetic dominance. A discriminating test would require sensitivity to a range on which the competing models predict different detectable outcomes.

### **Prediction L.1 (Conditional Electromagnetic-to-Gravitational Comparison)**

For a specified far-field implementation, define $\mathcal R$ only after the electromagnetic and gravitational responses are evaluated for the same source, target, geometry, observation interval, and endpoint likelihood. The scaling relations in this appendix do not determine the sign of $\mathcal R-1$ or a numerical interval for $\mathcal R$.

### **Prediction L.2 (Conditional Far-Detuned Selectivity)**

If $|\Delta|\gg\max\{\Omega_R,\Gamma\}$, the drive amplitude is held constant, and a specified likelihood is linear in the perturbative Stark shift, then
$$
|\Delta P(\Delta)|
\propto\frac{|\delta_{\mathrm{Stark}}(\Delta)|}{\omega_{TLS}}
\propto\frac1{|\Delta|}.
\tag{L.77}
$$
This asymptotic relation does not apply in the resonant region $|\Delta|\lesssim\max\{\Omega_R,\Gamma\}$.

### **Prediction L.3 (Distance Scaling in Far-Field Regime)**

For radiative regime $r \gg \lambda_{\text{rad}} = 2\pi c/\omega_{\text{rad}}$, electromagnetic field amplitude scales as:

$$ E_0(r) \propto \frac{1}{r} \tag{L.78} $$

Therefore AC Stark shift:

$$ \delta(r) \propto \frac{E_0^2(r)}{\Delta} \propto \frac{1}{r^2} \tag{L.79} $$

### **Prediction L.4 (Conditional Coherence-Time Window)**

For a protocol that requires an order-one Stark phase within each coherent interrogation, the nonzero angular-frequency shift $|\delta_{\mathrm{Stark}}|$ gives the parametric design window
$$
\frac{1}{|\delta_{\mathrm{Stark}}|}
\lesssim\tau_m
\lesssim
\min\left\{
\frac{1}{\gamma_\phi+\Gamma},
\frac{1}{\Gamma_{\mathrm{context}}}
\right\}.
\tag{L.80}
$$
The nonnegative rates describe target dephasing, natural linewidth and context variation; a zero rate contributes no finite upper limit. This window exists only if its lower scale does not exceed either upper scale. It is not a necessary condition for statistical detection over repeated trials.

For example, the ideal Bernoulli Ramsey law $p(\delta)=[1+\sin(\delta\tau_m)]/2$ has local Fisher information $\tau_m^2$ per trial at $\delta=0$: $(p')^2/[p(1-p)]=\tau_m^2$. Thus $N$ independent trials can have local signal-to-noise scale $|\delta|\tau_m\sqrt N$ even when $|\delta|\tau_m\ll1$. A realizable sensitivity requires a registered likelihood, noise, repetition and resource budget.

## **L.8.4 Framework-Specific Differential Observables**

The following observables distinguish PU framework predictions from alternative interpretations, enabling experimental discrimination:

Observable 1: Threshold and Selection Behavior

PU branch prediction: $C_{\mathrm{agg}}\leq C_{op}$ implies zero operational CC. For $C_{\mathrm{agg}}>C_{op}$, nonzero influence additionally requires the strict class-level PCE improvement in Theorem L.9.

Observable 2: Endpoint and Causality Gates

Bounded-bias branch gate: the branch independently declares $\alpha_{CC,\max}<0.5$, and Theorem 39 proves that this excludes endpoint-complete forcing of both outcomes of every binary coarse-graining. Finite-window zero-error and exact causal conclusions require Theorems 39a and 39c, respectively. This does not predict saturation at $0.5$.

Observable 3: Complete Energy Accounting

PU metric-branch prediction: every physical energy contribution enters the complete stress-energy ledger. Protocol L.2 must measure boundary flows and stored-energy changes; the ledger does not require all power to appear as heat. A biological sign comparison requires a preregistered metabolic model and is not determined by conservation alone.

Observable 4: Coherence-Time Dependence

PU conditional prediction: Equation (L.80) describes the branch requiring an order-one phase per coherent interrogation. Statistical resolvability across repeated trials requires the registered likelihood, noise, repetition and resource model; absence of that window alone does not exclude detection. A quantitative law relating efficacy or pattern error to $\tau_c$ also requires that model.

Observable 5: Spatial Decay

PU carrier prediction: on the far-field AC-Stark branch, $E\propto r^{-1}$ and $\delta_{\mathrm{Stark}}\propto E^2\propto r^{-2}$. For a dipolar reactive near field $E\propto r^{-3}$, the perturbative Stark shift scales as $r^{-6}$. Other response mechanisms require their own field-to-probability maps.

## **L.9 Universal Requirements for CC Implementations**

### **Theorem L.9 (Consistency Requirements and Mapping-Class Selection Conditions)**

Every physical implementation on the emergent metric branch must satisfy the energy-accounting, stress-energy, and operational-causality requirements (i)-(iii). Conditions (iv)-(v) characterize the compact Lipschitz admissible mapping class used by Theorem L.1 and the strict-improvement branch used to select nonzero influence; they are branch hypotheses, not implementation-independent necessities.

(i) Energy Conservation (Theorem L.6): The implementation must account for all power flows with each energy component contributing exactly once to the total stress-energy tensor $T_{\mu\nu}^{(\text{MPU})}$ (Definition B.8), satisfying $\nabla^\mu T_{\mu\nu}^{(\text{MPU})} = 0$.

(ii) Stress-Energy ledger: Every measured CC-associated matter, field, and boundary-flux contribution must be entered exactly once in a complete covariantly conserved $T_{\mu\nu}^{(\mathrm{MPU})}$. If the local-equilibrium horizon, area-law, Unruh-temperature, and Clausius hypotheses are also satisfied, Theorem L.7 verifies that this independently specified complete source is compatible with the Einstein equation up to a cosmological constant.

(iii) Endpoint, zero-error, and causality constraints: On the branch independently satisfying $\alpha_{CC,\max}<0.5$, Theorem 39 excludes endpoint-complete forcing of both outcomes of every binary coarse-graining. Finite-window zero-error exclusion additionally requires all regular-branch hypotheses of Theorem 39a. These are reliability statements. Exact operational causality requires the pre-lightcone context-independence hypothesis and conclusion of Theorem 39c.

(iv) POP/PCE Optimization (Lemma L.1, Theorem L.1): The context-to-control mapping $\mathcal{M}: \text{context}_S \to$ control parameters must be:

Lipschitz continuous with constant $L_{\mathcal{M}}$ optimized by PCE

Bounded in control output: $|\mathcal{M}(\text{context}_S)|_{\mathcal{P}} \le P_{\text{max}}$

Stable under feedback if $\text{context}_S$ is influenced by past CC effects

Satisfying the cost-benefit constraint (Equation L.3)

(v) Threshold and strict-improvement emergence: assume $\mathcal F$ is continuous on the nonempty compact admissible class $\mathfrak A$, and that its null/Born-realizing class $\mathfrak N_0$ is nonempty and closed in $\mathfrak A$. Define the following class values, using $\sup\varnothing=-\infty$ for an empty non-null complement:
$$
F_0^*:=\max_{\mathcal M\in\mathfrak N_0}\mathcal F[\mathcal M],
\qquad
F_+^*:=\sup_{\mathcal M\in\mathfrak A\setminus\mathfrak N_0}
\mathcal F[\mathcal M].
$$
For $C_{\mathrm{agg}}(S)>C_{op}$, every PCE maximizer is non-null if $F_+^*>F_0^*$, while every maximizer is null if $F_+^*<F_0^*$. If $F_+^*=F_0^*$, a null maximizer exists; a non-null maximizer exists exactly when the complement attains its supremum. Thus equality of the class values need not give selection degeneracy. On the threshold-scaling branch of Definition 31, $C_{\mathrm{agg}}(S)\le C_{op}$ gives $\mathrm{CC}(S)=0$ regardless of available power.

Proof of Necessity.

(i) Energy Conservation: Suppose an implementation violates energy conservation, with energy appearing or disappearing. Then $\nabla^\mu T_{\mu\nu}^{(\text{MPU})} \ne 0$, violating covariant conservation (Theorem B.5) required by diffeomorphism invariance of the emergent effective theory (Appendix F, Theorem F.1). This contradicts the framework's foundational structure. Therefore energy conservation is necessary.

(ii) Stress-Energy ledger: The effective-action and horizon-gravity branches are formulated with a complete covariantly conserved source tensor. An implementation that omits a measured energy or flux contribution from that tensor does not satisfy those branch hypotheses, so Theorem L.7 cannot be applied to it. Thus source completeness is a compatibility condition for the stated emergent-gravity branch; Theorem L.7 does not independently derive that condition.

(iii) Endpoint, zero-error, and causality constraints: For a binary event with Born probability $p\in(0,1)$, forcing both deterministic endpoints requires biases $1-p$ and $-p$. Definition 30 bounds their magnitudes by $\mathrm{CC}(S)$, so endpoint completeness requires
$$
\mathrm{CC}(S)\geq\max\{p,1-p\}\geq\frac12.
$$
Thus $\mathrm{CC}(S)<1/2$ excludes endpoint-complete deterministic forcing. Theorem 39a supplies finite-window zero-error exclusion only under its regular-branch hypotheses. Neither implication gives exact causal independence; that conclusion requires Theorem 39c.

(iv) POP/PCE mapping class: Theorem L.1 assumes a nonempty compact admissible class on which $\Delta PP$ and $R_{\mathcal M}$ are continuous. Lipschitz control, bounded output, and feedback stability are sufficient regularity conditions used to define one such class. Feedback stability is required only when the context dynamics contain the corresponding feedback loop. These conditions permit application of Weierstrass' theorem and, on the separate low-noise detailed-balance branch, Theorem D.5; PCE does not prove that every physically realizable mapping must be Lipschitz.

(v) Threshold and strict-improvement emergence: continuity and compactness give a global maximizer, and the nonempty closed null class attains $F_0^*$. If $F_+^*>F_0^*$, the definition of supremum supplies a non-null map with value exceeding every null value; hence a global maximizer cannot be null. Theorem 34 gives a nonzero operational map only under its additional strict-improvement branch hypotheses. If $F_+^*<F_0^*$, every non-null value is below an attained null value, so all maximizers are null; this includes an empty complement. If the class values are equal, each null-class maximizer is global, and a non-null global maximizer exists if and only if the complement attains that common value. Without such attainment, every global maximizer is null. On the threshold-scaling branch of Definition 31, $C_{\mathrm{agg}}\le C_{op}$ gives $\mathrm{CC}(S)=0$. These cases exhaust the class-value comparison. ∎

### **Corollary L.9.1 (Implementation Non-Uniqueness)**

If two or more physical implementations independently satisfy conditions (i)--(v) of Theorem L.9 together with the applicable thermodynamic and causal constraints, the theorem admits all of them and supplies no implementation-level uniqueness conclusion. Proposition L.4 gives a parametric coherent-charge candidate scaling, not an existence or optimization certificate for a realized carrier; Proposition L.5 proves that its stated data do not determine a numerical dominance ratio. Biological or other carriers remain candidates until their source-to-control, retention, response, and uncertainty records independently satisfy Theorem L.9.

### **Corollary L.9.2 (Threshold and Detectability Cases)**

Let $F_0^*$ and $F_+^*$ be the class optima in Theorem L.9.

(a) On the threshold-scaling branch of Definition 31, $C_{\mathrm{agg}}\le C_{op}$ implies $\mathrm{CC}(S)=0$. Hence the CC-attributable detectable influence region in Definition L.9.3 is empty.

(b) If $C_{\mathrm{agg}}>C_{op}$ and $F_+^*>F_0^*$, every PCE maximizer is non-null. Under the separate strict-improvement operational-map hypotheses this gives $\mathrm{CC}(S)>0$. To conclude $R_{\mathrm{eff}}>0$, the declared spatial carrier must cross the positive detection threshold at the reference time for a registered observable and a point at positive distance from $\mathbf x_S$.

(c) If $C_{\mathrm{agg}}>C_{op}$ and $F_+^*<F_0^*$, every maximizer is null, so $\mathrm{CC}(S)=0$ and the CC-attributable detectable region is empty. If the class values are equal, null maximizers exist, and non-null maximizers exist exactly when the complement attains that common value. Equality without complement attainment therefore selects only null maximizers.

*Proof.* Part (a) uses the stated Definition 31 branch. Part (c) follows from the attained-value comparison in Theorem L.9. For (b), strict improvement excludes null maximizers, but a nonzero operational norm alone supplies neither a threshold crossing nor positive spatial radius. A registered threshold-crossing point at the reference time and positive distance belongs to the defining slice of Definition L.9.3, so its positive distance is a lower bound on the supremum. ∎

### **Remark L.9.1 (External Field Dominance Independence)**

Proposition L.5 proves that the stated carrier, target, geometry, and retention data determine neither a numerical value nor a positive lower bound for $\mathcal R$. Consequently no electromagnetic-over-gravitational dominance claim, baseline ratio, or finite range follows for the analyzed external-field candidate. Near-field, biochemical, internal-correlation, and other channel hierarchies likewise require independently calibrated source-to-control and response records before they can be compared under Theorem L.9.
### **L.9.2 Spatiotemporal Bounds on CC Influence**

The definition and propositions below formalize the spatial and temporal extent of CC influence together with the response, exhaustion, and energy conditions that bound it.

### **Definition L.9.3 (Spatiotemporal Influence Region)**

For aggregate $S$ with $\text{CC}(S)$, the spatiotemporal influence region $\mathcal{I}(S,t)$ is defined as:

$$
\mathcal{I}(S,t) = \left\{ (x,t') : \exists \text{ observable } O : |\Delta P_S(O;x,t')| \ge \epsilon_{\text{detect}}, \ |t'-t| \le \tau_c(S) \right\}
$$

where:

$\Delta P_S(O;x,t')$ is achievable bias on observable $O$ at spacetime point $(x,t')$

$\epsilon_{\text{detect}}$ is detection threshold (typically $\epsilon_{\text{detect}} \sim \sqrt{\epsilon_{\text{noise}}^2 + \epsilon_{\text{stat}}^2}$ combining environmental noise and statistical uncertainty)

$\tau_c(S)$ is the registered context coherence time; Proposition L.9.4 identifies it as $\Gamma_{\mathrm{context}}^{-1}$ on the exponential-autocorrelation branch.

Use a positive detection threshold and the registered observable/protocol family. The spatial extent at the reference time is
$$
R_{\mathrm{eff}}(S,t)
=\sup\{|\mathbf x-\mathbf x_S|:(\mathbf x,t)\in\mathcal I(S,t)\}.
$$
Assign $R_{\mathrm{eff}}=0$ when this slice is empty; otherwise take the supremum in $[0,\infty]$. The definition permits infinite extent and does not itself provide a decay or causality bound.

Note: Relationship to Standard Causal Structure

Causal containment requires an independent response certificate. On a retarded branch, let $\mathcal W_S$ be the registered source history that can affect the admitted target protocols, and require $\Delta P_S=0$ outside its future causal domain $J^+(\mathcal W_S)$. Then a positive detection threshold gives $\mathcal I(S,t)\subseteq J^+(\mathcal W_S)$. A continuum lightcone interpretation additionally requires the metric and propagation identification in Appendix F and the exact operational-causality hypotheses of Theorem 39c. An instantaneous source event $(\mathbf x_S,t)$ is not a substitute for the source history: a signal emitted earlier can already be detectable at positive distance on the reference-time slice.

### **Proposition L.9.3 (Conditional Far-Field Spatial Extent)**

Assume a registered endpoint and radial carrier family obey
$$
|\Delta P(r)|=K_{\mathrm{impl}}\frac{P_{\mathrm{agg}}}{r^2}
$$
on a specified far-field interval of positive radii, with $K_{\mathrm{impl}}>0$, $P_{\mathrm{agg}}>0$ and $\epsilon_{\mathrm{detect}}>0$. Here $K_{\mathrm{impl}}$ has units $[\mathrm{length}]^2/[\mathrm{power}]$. Its branch threshold radius is
$$
R_*=\sqrt{\frac{K_{\mathrm{impl}}P_{\mathrm{agg}}}
{\epsilon_{\mathrm{detect}}}},
\qquad
P_{\mathrm{agg}}=\frac{\epsilon_{\mathrm{detect}}}{K_{\mathrm{impl}}}R_*^2,
$$
provided $R_*$ lies in the response interval and is realized within the admitted causal domain at the reference time.

*Proof.* The positive $r^{-2}$ response is strictly decreasing. Solving its threshold equality gives $R_*$; within the stated interval the endpoint is detectable exactly on its portion with $r\le R_*$. This proves a branch threshold statement. To identify $R_*=R_{\mathrm{eff}}$ from Definition L.9.3, an additional exhaustion certificate must exclude threshold crossings at every larger radius for every registered observable and direction, including regions outside that far-field interval. With that exclusion and the crossing at $R_*$, the defining supremum equals $R_*$. Without it, a second endpoint or a response outside the interval can give a larger, even unbounded, extent. Equation (L.24) does not determine $K_{\mathrm{impl}}$ for a probability endpoint without a likelihood map. ∎

### **Proposition L.9.4 (Conditional Temporal Extent)**

Suppose, for elapsed time $t\ge0$, the registered context autocorrelation satisfies
$$
|G_{\mathrm{context}}(t)|
=|G_{\mathrm{context}}(0)|e^{-\Gamma_{\mathrm{context}}t},
\qquad
|G_{\mathrm{context}}(0)|>0,\quad
\Gamma_{\mathrm{context}}>0.
$$
Its unique finite $e^{-1}$ coherence time is
$$
\tau_c(S)=\frac1{\Gamma_{\mathrm{context}}}.
$$
For $\Gamma_{\mathrm{context}}=0$ and positive initial amplitude there is no finite $e^{-1}$ time; if the initial amplitude is zero, this relative-decay convention is undefined.

If a separate ledger supplies available sustaining energy $E_{\mathrm{avail}}\ge0$ and a constant positive lower bound $P_{\mathrm{hold}}$ on sustaining power over an interval of length $\tau_c$, feasibility requires
$$
P_{\mathrm{hold}}\tau_c\le E_{\mathrm{avail}},
\qquad
\tau_c\le\frac{E_{\mathrm{avail}}}{P_{\mathrm{hold}}}.
$$
No bound involving $C_{\mathrm{agg}}-C_{op}$ follows without an explicit map from complexity to available energy.

*Proof.* Divide the exponential law by its positive initial amplitude and solve $e^{-\Gamma_{\mathrm{context}}t}=e^{-1}$. Strict decrease gives uniqueness; a zero rate never reaches that fraction. For the energy bound, integration gives $E_{\mathrm{used}}\ge P_{\mathrm{hold}}\tau_c$, while the independent feasibility ledger gives $E_{\mathrm{used}}\le E_{\mathrm{avail}}$. ∎

### **Proposition L.9.5 (Conditional Energy-Range-Time Trade-off)**

Under the stationary endpoint response law of Proposition L.9.3, let $R>0$ be a registered test radius inside its validity and causal domain throughout an interval of duration $\tau_c>0$. Maintaining that endpoint above the positive detection threshold requires
$$
P_{\mathrm{agg}}(t)\ge
P_{\min}:=\frac{\epsilon_{\mathrm{detect}}}{K_{\mathrm{impl}}}R^2
\qquad(0\le t\le\tau_c).
$$
For measurable supplied power, the energy therefore satisfies
$$
E_{\mathrm{agg}}=\int_0^{\tau_c}P_{\mathrm{agg}}(t)\,dt
\ge\frac{\epsilon_{\mathrm{detect}}}{K_{\mathrm{impl}}}R^2\tau_c.
$$
Using a global influence radius in place of $R$ additionally requires the exhaustion and threshold-realization conditions of Proposition L.9.3 at the relevant times.

*Proof.* Rearrange $K_{\mathrm{impl}}P_{\mathrm{agg}}(t)/R^2\ge\epsilon_{\mathrm{detect}}$ at each time. Integrating this nonnegative lower bound gives the energy inequality; no global spatial conclusion is used. ∎

<a id="theorem-l96-exact-exponential-range-time-energy-frontier"></a>**Theorem L.9.6 (Exact Exponential Range–Time–Energy Frontier).** Consider the explicit implementation class with nonnegative range $R$, retention time $t$, source energy $E$, positive attenuation coefficients $\mu$ and $\tau^{-1}$, response-per-energy coefficient $\zeta>0$ with units of inverse energy, and dimensionless locked threshold $q>0$, whose dimensionless response is
$$
\delta(R,t;E)=\zeta E e^{-\mu R-t/\tau}.
\tag{L.9.6.1}
$$
Order feasible triples by preferring larger $R$ and $t$ and smaller $E$, subject to $\delta\ge q$. The complete Pareto frontier is
$$
\mathcal F
=\left\{(R,t,E):R,t\ge0,
\ E=\frac q\zeta e^{\mu R+t/\tau}\right\}.
\tag{L.9.6.2}
$$
On the full class, no triple is a strict optimum for all three objectives. For positive scalarization weights $\alpha,\beta,\gamma$, consider
$$
J=\gamma E-\alpha R-\beta t.
\tag{L.9.6.3}
$$
Register a nonempty compact rectangle in the nonnegative $(R,t)$ plane. At each point of that rectangle, allow every $E\ge(q/\zeta)e^{\mu R+t/\tau}$, with no additional energy floor or ceiling. Minimizing $J$ then reduces exactly to minimizing
$$
\frac{\gamma q}{\zeta}e^{\mu R+t/\tau}-\alpha R-\beta t
\tag{L.9.6.4}
$$
on that rectangle. Every interior minimizer satisfies
$$
\gamma\mu E=\alpha,
\qquad
\frac{\gamma E}{\tau}=\beta.
\tag{L.9.6.5}
$$
Unless $\alpha/\mu=\beta\tau$, no interior scalar optimum exists and a minimum lies on the rectangle's boundary. Additional energy bounds require their own constrained feasible set and are not absorbed into this substitution.

*Proof.* In the full class, any $E>(q/\zeta)e^{\mu R+t/\tau}$ can be reduced at unchanged $R,t$, so it is dominated. On the equality surface, weakly increasing $R,t$ with at least one strict increase strictly raises the required energy; decreasing energy forces at least one of them to decrease. Thus every equality point is nondominated. Unbounded admissible $R,t$ preclude a joint strict optimum. For the scalarized branch, $\gamma>0$ makes the least feasible energy optimal at each registered $(R,t)$, proving the substitution. The reduced objective is continuous on the compact rectangle and hence attains a minimum. Its two interior derivatives give (L.9.6.5); incompatibility of those equations forces boundary attainment. ∎

The theorem reports the complete frontier for the declared attenuation class. Exhausting all implementations satisfying Theorem L.9 requires a separate proof that their response laws reduce to (L.9.6.1), or a larger frontier census.

<a id="theorem-l96a-pareto-frontier-for-general-monotone-implementation-laws"></a>**Theorem L.9.6a (Pareto Frontier for General Monotone Implementation Laws).** Let $Q=I_R\times I_t\subseteq[0,\infty)^2$ be a product of closed intervals, let $q>0$, and let $\delta:Q\times[0,\infty)\to[0,\infty)$ be continuous with $E\mapsto\delta(R,t;E)$ strictly increasing and $\delta(R,t;0)<q$. Order feasible triples, $\delta\ge q$, as in Theorem L.9.6, and put
$$
E_{\min}(R,t):=\inf\{E\ge0:\delta(R,t;E)\ge q\}\in(0,\infty].
\tag{L.9.6a.1}
$$

(a) A triple is feasible exactly when $E\ge E_{\min}(R,t)$, and $\delta(R,t;E_{\min}(R,t))=q$ when $E_{\min}(R,t)<\infty$. The Pareto frontier consists exactly of the points $(R,t,E_{\min}(R,t))$ with $E_{\min}(R,t)<\infty$ for which no $(R',t')\in Q$ with $R'\ge R$, $t'\ge t$ and $(R',t')\ne(R,t)$ has $E_{\min}(R',t')\le E_{\min}(R,t)$.

(b) If $\delta(\cdot,t;E)$ and $\delta(R,\cdot;E)$ are strictly decreasing for every $E>0$, then $E_{\min}$ is strictly increasing in each argument on $\{E_{\min}<\infty\}$, and the frontier is the entire graph of $E_{\min}$ over that set.

(c) $E_{\min}$ is lower semicontinuous on $Q$. For positive weights $\alpha,\beta,\gamma$ and a compact rectangle $Q_0\subseteq\{E_{\min}<\infty\}$, minimizing $\gamma E-\alpha R-\beta t$ over feasible triples with $(R,t)\in Q_0$ reduces to minimizing $\gamma E_{\min}(R,t)-\alpha R-\beta t$ on $Q_0$, and a minimizer exists.

(d) *(Factorized laws.)* Let $\delta=\zeta Ea(R)b(t)$ with $\zeta>0$ and positive $C^2$ functions $a,b$ with $a'<0$ and $b'<0$, and put $A:=1/a$, $B:=1/b$. If
$$
\frac{AA''}{A'^2}\,\frac{BB''}{B'^2}<1
\tag{L.9.6a.2}
$$
at every interior point of $Q_0$, every minimizer in (c) lies on the boundary of $Q_0$. For the exponential class (L.9.6.1) the product in (L.9.6a.2) equals $1$ identically. For the inverse-square spatial law of Proposition L.9.3 with the exponential temporal law of Proposition L.9.4, $\delta=\zeta ER^{-2}e^{-t/\tau}$ on $R\ge R_0>0$, the product equals $1/2$; this law satisfies (b), its scalar minimizers lie on the boundary, and it is not of the form (L.9.6.1) on any open set of radii.

*Proof.* (a) By strict monotonicity and continuity in $E$, the feasible energies at fixed $(R,t)$ form the closed up-set $[E_{\min}(R,t),\infty)$, and $E_{\min}>0$ because $\delta(R,t;0)<q$; continuity then gives $\delta(R,t;E_{\min})=q$. A feasible triple with $E>E_{\min}(R,t)$ is dominated by $(R,t,E_{\min}(R,t))$. The point $(R,t,E_{\min}(R,t))$ is dominated exactly when a feasible $(R',t',E')$ has $R'\ge R$, $t'\ge t$, $E'\le E_{\min}(R,t)$ and one strict inequality. Equality $(R',t')=(R,t)$ would force $E'<E_{\min}(R,t)$, which is infeasible; otherwise feasibility gives $E_{\min}(R',t')\le E'\le E_{\min}(R,t)$, and conversely such a pair supplies the dominating triple $(R',t',E_{\min}(R',t'))$.

(b) For $(R',t')\ge(R,t)$ with $(R',t')\ne(R,t)$, passing through $(R',t)\in Q$ gives $\delta(R',t';E)<\delta(R,t;E)$ at $E=E_{\min}(R,t)$, so $\delta(R',t';E_{\min}(R,t))<q$. Monotonicity in $E$ and closedness of the feasible up-set give $E_{\min}(R',t')>E_{\min}(R,t)$, and (a) places every graph point on the frontier.

(c) By (a), $E_{\min}(R,t)\le c$ exactly when $\delta(R,t;c)\ge q$, a closed condition by continuity, so every sublevel set is closed. Since $\gamma>0$, the least feasible energy is optimal at each $(R,t)$. A lower semicontinuous function minus a continuous one attains its minimum on the compact set $Q_0$.

(d) Here $E_{\min}=(q/\zeta)A(R)B(t)$ with $A',B'>0$. Put $c_0:=\gamma q/\zeta>0$ and $f:=c_0AB-\alpha R-\beta t$. At an interior local minimizer the Hessian of $f$ is positive semidefinite, so $c_0^2(AA''BB''-A'^2B'^2)\ge0$; division by $A'^2B'^2>0$ contradicts (L.9.6a.2). For $A=e^{\mu R}$ and $B=e^{t/\tau}$ each ratio equals $1$. For $A=R^2$ the ratio is $R^2\cdot2/(2R)^2=1/2$. The inverse-square law is continuous, strictly increasing in $E$ with $\delta(R,t;0)=0<q$, and strictly decreasing in $R$ and $t$ for $E>0$. If it agreed with $\zeta'Ee^{-\mu R-t/\tau'}$ on an open set, $R^{-2}e^{\mu R}$ would be locally constant there, whereas its derivative $(\mu-2/R)R^{-2}e^{\mu R}$ vanishes only at $R=2/\mu$. ∎

Theorem L.9.6k also supplies the exact threshold-budget quotient, complete Pareto census and scalar-infimum/attainment criterion for arbitrary response laws, including discontinuous and nonmonotone laws; its all-threshold cut family reconstructs every weakly energy-monotone law. Corollary L.9.6l computes jump, plateau, saturation and oscillatory frontiers, and Proposition L.9.6m proves the obstruction to a uniform exact finite algorithm on its full discontinuous program-presentation class. This obstruction does not contradict the represented semialgebraic and exact-parameter algorithms of Theorems L.9.6g--L.9.6j, whose presentation classes are restricted explicitly. Falsifiers for the continuous classification remain a nondominated feasible triple off the graph of $E_{\min}$, a strictly decreasing law with a dominated graph point, an interior minimizer under (L.9.6a.2), or an exponential representation of the inverse-square law on an open set. The existing continuous-class conclusions establish the stated frontier/existence predicate and refute exponential-class reduction; no physical implementation is inferred from a scalar-law classification alone.

<a id="proposition-l96b-admitted-finite-mpu-source-to-endpoint-component"></a>**Proposition L.9.6b (Admitted Finite MPU Source-to-Endpoint Component).** The following source-preserving join uses the already qualified R14 constructor and the bounded common-fiber instrument. Its fixed finite service is an attained local component. Construction and Theorem L.9.6n extends this same paid endpoint to a complete conserved causal apparatus and attained finite-use range–time–energy frontier. Section numbers are local.

**A qualified microscopic MPU source reaching a nonzero instrument**

## Result

The original minimality issue need not be reproved or assumed. The source of Definition 2.6e and Theorem 2.6f contains three complete R14-ByteExact-StackSemantics-v2 MPU constituents, each with $C_P=C_{\mathrm{op}}=8$ on the original nominal qualifying class. Reusing its post-run forecast-control port and existing cost-meter instrument gives an explicit source-to-context-to-endpoint difference of **1/6**, on the same paid finite source.

The finite-register composition and the qualified-MPU join have distinct domains. This proposition uses the fully qualified R14 source, its unchanged predictive task and the source-preserving endpoint construction specified above.

Construction and Theorem L.9.6n supplies the complete spacetime stress and the exact causal and clock interfaces of this component, with an explicitly paid finite-use cost convention.

## 1. Imported source, unchanged qualification and nonzero context support

Use the complete source of Theorem 2.6f, not only the three-state motor projection. Keep all three original devices, their finite trees, six XOR gates, reversible shadows, protected histories, source exclusions, timers and ROM. Their original runs have service times $0,7\tau,14\tau$. Their nominal task has fair $Y_0$, independent $Z_i$ with $\Pr(Z_i=1)=1/4$, $Y_i=Y_{i-1}\oplus Z_i$, and fair independent fallback. On successful completion the returned prediction is $Y_1$; on unsuccessful termination it is the fallback. The success event is independent of these environment variables. The returned prediction $j$ is therefore fair in both branches, so both context labels have probability $1/2$; failed paths are included.

Theorem 2.4.1h, on the byte-exact semantics of Definition 2.4.1i, proves that this R14 source attains the complexity minimum on its original nominal physically admitted class. Its source hierarchy admits smaller, failing and larger capacities before the complexity argument. Definition 13 does not authorize replacing its qualifying domain by a convenient finite list. We do not do so. Neither the aggregate nor the message module is assigned a new complexity minimum.

The source of Definition 2.6e already permits a returned forecast bit after $14\tau$ to choose between two registered message preparations, with a paid controller service and no earlier feedback. Use this exact port. Choose the registered low message states $|0\rangle$ and $|1\rangle$ according to $j$. Leave the three MPU devices intact throughout the stated paid storage interval to $18\tau$. This is the source-context map $j\to\rho_j=|j\rangle\langle j|$; its two values are bounded and Lipschitz in the discrete metric. The corresponding retained source is not consumed or reset.

## 2. Use only an existing admitted instrument

Choose the chart $g=(1,1,1)$ of Definition 2.6e, $x=0$, and either allowed high cartridge $\lambda=3$ or $4$. The message is on $H_{\mathrm{msg}}=\mathbb{C}^4$ with low subspace $\operatorname{span}\{|0\rangle,|1\rangle,|2\rangle\}$ and high basis $|e\rangle$. The high branch is retained in the instrument even though both chosen input states are low.

The existing terminal meter first measures high versus low. On the low branch it selects an edge e uniformly from {01,12,20}, then measures the spectral projectors of

$$
K_{uv} = (|u\rangle-|v\rangle)(\langle u|-\langle v|).
$$

Its eigenvalues are $2$ and $0$, with $\Pi_{uv,2}=K_{uv}/2$ and $\Pi_{uv,0}=P_L-\Pi_{uv,2}$. The low outcome maps are

$$
I_{uv,k}(X) = (1/3)\, \Pi_{uv,k} X \Pi_{uv,k}.
$$

Add $I_{\mathrm{high}}(X)=P_eXP_{e}$. All are CP. The sum of their adjoint effects is $P_{e}+(1/3)\sum_{\mathrm{edges}}P_L=I_4$, so the whole instrument is normalized on every input, not only the two selected preparations.

For the single locked endpoint $A=\{\mathrm{edge}_{12},k=2\}$,

$$
\begin{aligned}
p(A|j=0) &= 0,\\
p(A|j=1) &= 1/6.
\end{aligned}
$$

The signed source-conditioned probability difference is exactly +1/6. This comes from an already admitted outcome map, not an invented attenuation coefficient or freely chosen stress source. The complete seven-outcome pointer distributions have total-variation distance 1/3 (four low outcome coordinates differ by magnitude 1/6, with the high outcome zero for both). This is a bound for that pointer event algebra, not the whole retained source apparatus. The original forecast and executed preparation records remain in the complete source and may distinguish the two contexts exactly. No response-active record is erased from the physical ledger to manufacture a universal sub-half bound. The two classical preparation channels to the message and their composition with the meter are normalized; their difference is trace-annihilating. The declared endpoint is strictly nontrivial and below 1/2. No assertion about the maximum norm over every possible source endpoint is inferred from this one endpoint bound.

## 3. Same admitted clock and cost ownership

Choose the full existing four-slot postrun schedule: preparation, paid identity, paid identity, terminal meter. This ends at $18\tau$. The positive calibrated $E,\tau,\ell$ obey the inherited source feasibility inequality $E\tau\ge 100\hbar$. Use the inherited sixteen-subslot pulse profiles, primitive generators, source pointer, meter randomizer and gap-raising receipt cells without changing the allowed catalogue.

The four calls consume four distinct completion receipts of energy E. At $x=0$ the extra meter receipt on outcome (uv,k) is 3E k. For both rho0 and rho1, its expected value is

$$
E\, \operatorname{Tr}[(K_{01}+K_{12}+K_{20})\rho_j]=2E.
$$

Thus the postrun operational call-plus-additional-meter expected debit is $6E$ for either context. This equality does not erase the random receipt distribution: on each port input, exactly two edge/$k=2$ events have probability $1/6$ each and receipt $6E$, and all other low outcomes have receipt $0$. The source context changes which tagged event has positive probability even though this aggregate expected debit is equal.

Keep, in addition, the entire inherited R14 consumed-resource law, all preflight stock and ROM invoices, the message reservation and its controller/record inventory, the three-device storage invoice

$12[6978+68\cdot 2^{72}+2^{1332}]R+12R$,

and its registered energy/resource price. This is the postrun storage contract of Definition 2.6e, not a new free extension. The R14 allocated60E is not silently treated as actual consumed work. Available reserves, peak reservations, actual receipt energies and resource-price scalarization retain distinct owner types. The expected total is the inherited common source/stock cost plus6E, with the complete random R14/receipt law retained.

No new reset is performed. The source of Definition 2.6e deliberately retains displaced states, source purification, pointers, histories and receipts in its complete finite stock. The absence of a reset heat charge is therefore an actual finite-use convention, not a claim of free cyclic erasure.

## 4. Scope of the component

This supplies a response-active concrete microscopic source on the nominal MPU class of Theorem 2.4.1h, an authorized control port, an exact normalized outcome instrument, a nonzero signed endpoint, the existing clock and finite cost/source owners. The source-typing obstacle is discharged **for this finite-source/interface component**, by reuse of the source qualification of Theorem 2.4.1h.

The range–time–energy source-to-frontier interface requires more than the existence of some qualified source with some nonzero response: it requires microscopic identification through the nominated interfaces, and an arbitrary conserved stress is insufficient. The source of Definition 2.6e explicitly supplies a finite propagation-cost metric and independently adopted service/timer contracts, not a Lorentzian metric or a covariantly conserved complete apparatus stress. Neither its triangle distance ell nor its paid service slots prove exact pre-lightcone independence in the L.9 branch. The spacetime source of the apparatus, reservoirs and timed drivers is a datum separate from energy receipt conservation and paid maintenance. A complete conserved distributional or expectation apparatus stress is admissible; action/metric variation is only an optional variational-branch route, and a full Einstein/AQFT/KMS theorem is not added as a requirement.

This original component ends at $18\tau$ with its archive and pointer stocks retained. Construction and Theorem L.9.6n supplies the full $(R,t,E)$ feasible-set map: it leaves the whole original apparatus stationary, adds an explicitly paid retained-stock extension through $20\tau$, and copies this actual committed meter event through two new local classical collision services onto an owned inertial courier and receiver. The construction proves the exact physical energy image, its distinct upper-budget closure, complete observer-current/resource costs and attained frontier on that finite-use contract. The contract has no idle-closed or cyclic reset service. The meter remains an actually executed source-owned instrument, not a free diagnostic query. This ordinary source-dependent quantum preparation/readout is not claimed to demonstrate a new Born-rule anomaly or a selected PCE improvement. Canonical Equation L.83 is a gravitational coupling expression, not a cost tariff; no numerical source-gravity bridge is inferred from it.

Construction and Theorem L.9.6n supplies a source-preserving join on its explicitly registered finite-use apparatus: the admitted R14 source of Definition 2.6e and all its qualifying alternatives remain intact, the actual endpoint is causally delivered, all owners are paid, and the source-to-frontier map is proved. The added local collision leaves, classical calibration packages and finite-use cost convention are declared as new source data. No empirical or biological test is included.

**Remark L.9.5a (Conditional Appendix-S Self-Limitation Gate).** Appendix S's decoherence constraint, combined with the power floor of Proposition L.9.5, bounds a registered test radius. On a stationary overlap branch, suppose $P_{\mathrm{context}}=\chi P_{\mathrm{agg}}$ with $\chi>0$, $K_{\mathrm{eff}}>0$, $|\Delta E|>0$ and $\tau_c>0$, and let $0\le\Lambda_{\max}<\infty$. Require a certificate that retention over $\tau_c$ imposes
$$
\Gamma_{\mathrm{deco}}\tau_c
=\frac{|\Delta E|}{\hbar}K_{\mathrm{eff}}\chi P_{\mathrm{agg}}\tau_c
\le\Lambda_{\max}.
$$
For a registered test radius $R>0$ under Proposition L.9.5, with $K_{\mathrm{impl}}>0$ and $\epsilon_{\mathrm{detect}}>0$, the two power inequalities give
$$
\frac{\epsilon_{\mathrm{detect}}}{K_{\mathrm{impl}}}R^2
\le P_{\mathrm{agg}}
\le\frac{\Lambda_{\max}\hbar}
{|\Delta E|K_{\mathrm{eff}}\chi\tau_c},
\qquad
R^2\le
\frac{K_{\mathrm{impl}}\Lambda_{\max}\hbar}
{\epsilon_{\mathrm{detect}}|\Delta E|K_{\mathrm{eff}}\chi\tau_c}.
$$
Identifying this tested radius with $R_{\mathrm{eff}}$ requires the global exhaustion and threshold-realization certificate of Proposition L.9.3. If $|\Delta E|=0$, the displayed decoherence term supplies no finite power ceiling. Without the power-identification, rate, retention-threshold and non-overlap records, the Appendix-S relation remains a conditional compatibility formula.

<a id="theorem-l96c-clocked-scalar-carrier-and-retained-record-frontier"></a>**Theorem L.9.6c (Clocked Scalar Carrier and Retained-Record Frontier).** The following independently specified effective scalar/material source has exact retarded propagation, a conserved complete physical stress, positive finite operating stock, a finite pointer instrument and an attained range–deadline–initial-energy frontier. Its scalar field and clocks are classical continuous degrees of freedom, its finite internal registers obey the stated unitary expectation-valued constitutive law, and its material sheets use the weak transmission equations proved below. Supplied initial readiness, precise clock phases and all final records remain in the inventory. This is a complete calculation for that physical model. It does not identify the model with the microscopic MPU action/tensor in the named Definition B.8/F.4 source, nor determine a conditional complete-flag perspective kernel.

**1. One action and the owned switching clock.** Set $c=1$, retain $\hbar$, and use $\mathbb R_t\times\mathbb R_x\times\mathbb T^2$ with transverse area $A>0$. The scalar action is
$$
S_\phi=-\frac12\int\sqrt{|g|}\,g^{\mu\nu}\partial_\mu\phi\partial_\nu\phi.
\tag{L.9.6c.1}
$$
For every material module supply a real canonical pair $(\theta,p)$ and a finite internal density orbit $\rho=U\rho_0U^*$. Its action along the material line is
$$
S_{\rm mod}=\int ds\{i\hbar\operatorname{Tr}(\rho_0U^*U')+p\theta'
-N[M+p+\operatorname{Tr}(\rho H(\theta,\phi))]\},\quad N=\sqrt{-g(x',x')}.
\tag{L.9.6c.2}
$$
Independent clock, internal, material and metric variation give, in proper time,
$$
\dot\theta=1,\quad\dot p=-\operatorname{Tr}(\rho\partial_\theta H),\quad
 i\hbar\dot\rho=[H,\rho],\quad E=M+p+\operatorname{Tr}\rho H,
$$
$$
\nabla_\tau(Eu_\nu)=-\operatorname{Tr}(\rho\partial_\phi H)\partial_\nu\phi,\quad
\dot E=\operatorname{Tr}(\rho\partial_\phi H)\dot\phi.
\tag{L.9.6c.3}
$$
The explicit $\theta$ derivatives cancel between clock momentum and interaction energy. The source is $J=\sum_{\rm material}\operatorname{Tr}(\rho\partial_\phi H)$ and the module stress is $Euu$ on its worldline; its divergence cancels the scalar exchange current, so the total physical tensor is conserved. Omitting $p$ during switching would lose this cancellation. Synchronized origins $\theta=0$ and zero scalar Cauchy data are supplied at $t=0$. There is no scalar Gauss constraint requiring a preexisting field. The source lines already exist, and their nonzero initial coupling has zero interaction energy because $\phi=0$. Their preparation is not assigned zero manufacturing work.

Choose a smooth symmetric step
$$
a(u)=\begin{cases}e^{-1/u},&u>0,\\0,&u\le0,\end{cases}\qquad
\sigma(u)=\frac{a(u)}{a(u)+a(1-u)}.
$$
It vanishes below zero, equals one above one and satisfies $\sigma(u)+\sigma(1-u)=1$. Fix $d_S>0$, $d_R\ge d_S$, $D>0$. A registered setting $T\ge0$ uses
$$
h_T(\theta)=1-\sigma((\theta-T)/d_S),\quad
G(y)=\sigma(y/D),\quad g_T(\theta)=G(T-\theta).
\tag{L.9.6c.4}
$$
The source stays fully coupled until $T$ and shuts off by $T+d_S$; the receiver smoothly stops sensing by $T$. Both clocks remain afterward, freely running, rather than being unowned reset resources.

**2. The retarded source and its exact reaction debit.** Retain an orthogonal source context $j=\pm1$ and choose $H_S=q h_T(\theta)Z_C\phi$, $q>0$, with input $Z_C=j$. It commutes with the retained context. A uniform source sheet at $x=a$ has
$$
\mathcal H_T(s)=\int_0^sh_T(v)\,dv,\quad I_T(s)=\int_0^sh_T(v)^2\,dv\quad(s>0),
\qquad\mathcal H_T(s)=I_T(s)=0\quad(s\le0),
$$
$$
\phi_{j,a}(s,x)=-\frac{qj}{2A}\mathcal H_T(s-|x-a|),\quad
P=\frac{q^2}{2A},\quad c_S=\int_0^{d_S}[1-\sigma(v/d_S)]^2dv.
\tag{L.9.6c.5}
$$
It solves $\Box\phi=qj h_T(s)\delta(x-a)/A$ in distributions. The source clock and its full module energy are
$$
p_S(s)=p_{S0}+P[h_T(s)\mathcal H_T(s)-I_T(s)],\quad
\langle H_S\rangle=-Ph_T(s)\mathcal H_T(s),\quad
E_S(s)=M_S+p_{S0}-PI_T(s).
\tag{L.9.6c.6}
$$
Indeed integrate $\dot p=-qj h_T'\phi$ and use $\int h_T'\mathcal H_T=h_T\mathcal H_T-I_T$. The final clock debit is exactly
$$
W=P(T+c_S),\quad p_S(\mathrm{final})=p_{S0}-W,\quad H_S(\mathrm{final})=0.
\tag{L.9.6c.7}
$$
Choose $p_{S0}=p_{\min}+W$, $p_{\min}>0$. Since $h_T,\mathcal H_T\ge0$ and $I_T\le T+c_S$, $p_S\ge p_{\min}$ and $E_S\ge M_S+p_{\min}$ at all later times. No finite-stock emitter is continued into a negative-mass branch.

The actual field components are
$$
T_\phi^{00}=T_\phi^{xx}=\frac{q^2}{4A^2}h_T(s-|x-a|)^2 1_{\{s>|x-a|\}},\quad
T_\phi^{0x}=\operatorname{sgn}(x-a)T_\phi^{00},\quad T_\phi^{yy}=T_\phi^{zz}=0.
\tag{L.9.6c.8}
$$
Their energy integral is $PI_T(s)$ and their final energy is $W$. Add the source sheet $E_S(s)\delta(x-a)/A$ in the $00$ entry. Its energy loss cancels the field's distributional source divergence, while the equal opposite outgoing normal stresses give zero recoil. This can be verified without multiplying a $\delta$ by a discontinuous derivative: if $a_t$ is the common tangential derivative and $b_\pm$ the two normal traces, then $[b]=qjh_T/A$ and
$$
[T_\phi^{0x}]=-a_t[b],\qquad
[T_\phi^{xx}]=[b](b_++b_-)/2.
\tag{L.9.6c.9}
$$
Pillbox conservation therefore gives sheet energy rate $qjh_Ta_t$ and normal force $-qjh_T(b_++b_-)/2$. In (L.9.6c.5), $b_\pm=\pm qjh_T/(2A)$, reproducing (L.9.6c.6) and zero force. These are the declared local weak transmission equations; no general finite-thickness microscopic limit is assumed. A tube at radius $L$ sees outward power $Ph_T(s-L)^2$. Its storage and integrated flux transfer the same $W$ once; they are not added to initial stock as a second payment. The scalar's later constant memory plateau has zero gradient energy.

**3. A finite pointer after sensing.** Supply receiver qubit $Q$, pointer/archive $L$ ready in $|0\rangle$, and its clock, with total rest/readiness baseline $M_R>0$. Let $\Pi_-=(I-Z_Q)/2$. Choose a nonnegative smooth pulse $b$ supported in $(0,d_R)$ with $\int b=\pi\hbar/2$, and use
$$
H_R(\theta,\phi)=\lambda g_T(\theta)\phi X_Q+b(\theta-T)\Pi_-\otimes X_L,
\qquad\lambda>0.
\tag{L.9.6c.10}
$$
Its sensing and readout supports are disjoint. Register the physical inputs $\rho_\vartheta=(I-\vartheta Y_Q)/2$, $\vartheta=\pm1$, or their classical mixtures. Their $\langle X_Q\rangle=0$ is invariant during sensing, so the receiver has zero mean scalar source, force and sensing clock work on this constitutive input family. This is not a quantized-field statement that source fluctuations vanish.

At $T$ sensing is off. The readout generator $K=\Pi_-\otimes X_L$ has initial mean zero, conserved during its pulse, so its clock momentum does not change. Its finite unitary is
$$
U_{\rm read}=e^{-i(\pi/2)\Pi_-\otimes X_L}
=\Pi_+\otimes I-i\Pi_-\otimes X_L.
\tag{L.9.6c.11}
$$
Its actual pointer CP maps are $\mathcal I_\pm(\rho)=\Pi_\pm U_{\rm sense}\rho U_{\rm sense}^*\Pi_\pm$, with sum trace preserving. Both the target and archive remain, along with source/context and both clocks. The outer outcome uses the independently registered instrument rule, without inserting its Born weight into a normalized conditional perspective kernel. On the registered inputs $E_R=M_R+p_{R0}$ throughout. A uniform interaction-norm reserve below gives a positive operating margin, not merely a zero expectation.

For separation $d=b-a>0$, every source time contributing before receiver cutoff is in its full-amplitude stage, so $\phi_{j,a}(s,b)=-qj(s-d)_+/(2A)$ for $s\le T$. Define
$$
\Psi(u)=\int_0^uG(y)(u-y)dy\ (u>0),\quad\Psi(u)=0\ (u\le0),\quad
B=\lambda q/(A\hbar).
\tag{L.9.6c.12}
$$
Integration of the same Hamiltonian gives
$$
U_{\rm sense}=e^{-i\alpha X_Q},\quad\alpha=-\frac{\lambda qj}{2A\hbar}\Psi(T-d),\quad
\Pr(+\mid\vartheta,j,a,b,T)=\frac12+\frac{\vartheta j}{2}\sin[B\Psi(T-d)].
\tag{L.9.6c.13}
$$
The controlled pointer flip exactly reproduces the sensed $Z$ probabilities. Moreover $\Psi'(u)=\int_0^uG(y)dy>0$ for $u>0$ and
$$
(u-D)_+^2/2\le\Psi(u)\le u_+^2/2.
\tag{L.9.6c.14}
$$
All receiver channels agree before actual arrival, since their local scalar Hamiltonians then agree; a later pointer readout cannot create pre-arrival context dependence.

**4. Smooth expectation source and its decision law.** Independently prepare source position $a$ and receiver displacement $v$ with normalized smooth densities $v_S,v_R$ supported in $[-w,w]$, and put $b=R+v$, $R>2w$. The statistical action is the probability-weighted integral of the complete conditional scalar/module/clock actions, retaining the conditional fields and internal states as separate variables. Its metric variation is the expected complete stress, not the stress of the mean scalar. Conditional conservation and energy balances survive averaging. The material contributions are $E_S(s)v_S(x)/A$ and $E_Rv_R(x-R)/A$, and the field contribution is the convolution of (L.9.6c.8) with $v_S$. It is smooth for $s>0$, conserved and finite, with compact energy support on each compact observation-time slice. Finite weighted quadratures converge on compact smooth metric tests by continuity of translated weak pairings and their common finite support. This is the specified constitutive expectation-source construction, not a finite-thickness or microscopic MPU continuum theorem.

If $z=a-v$ has convolution density $h$ on $[-2w,2w]$, the actual nonlinear preparation average is
$$
F(u)=\frac12\int h(z)\sin[B\Psi(u+z)]\,dz,\qquad
\Pr(+\mid\vartheta,j,R,T)=\frac12+\vartheta jF(T-R).
\tag{L.9.6c.15}
$$
Every conditional field variance stays in the energy account; no mean-field substitution inside the sine is made. If $\vartheta$ is fair and the retained context satisfies $\Pr(C=\vartheta)=1-e$, $0\le e\le1/2$, with positions and policy randomness independent of that pair given its registered common causal history, the direct fixed coupling $j=C$ gives
$$
V_{\rm context}=\frac12+(1-2e)F(T-R),\qquad V_{\rm prior}=\frac12.
\tag{L.9.6c.16}
$$
The prior uses a fixed information-free sign. Alternative fixed hardware operators $+1,-1,-Z_C$ have the same scalar stress/clock debit because their squared charge is one; this is not a free runtime reconfiguration. The fixed null coupling $0$ has no scalar signal, retains its initial stock and produces the uniform pointer law. It never meets a positive threshold.

For the declared diagonal target-label input algebra, compare the active pointer channel $\Phi_j$ with that actual null channel $\Phi_0$. Both are stochastic, hence CP and trace preserving; their difference is trace annihilating. On input probabilities $p_\vartheta$ its signed output is $jF(T-R)(\sum_\vartheta\vartheta p_\vartheta)(1,-1)$. Its maximum event bias, equivalently half the induced trace norm, is $F(T-R)$; the opposite-context contrast is $2F(T-R)$. A retained classical reference gives the same bound by summing its conditional blocks. This concerns that endpoint algebra, not the whole archived source, whose retained context can distinguish the signs. An arbitrary qubit input with nonzero $\langle X_Q\rangle$ changes the coupled scalar solution; no all-qubit physical extension is inferred from the conditional unitary formula.

**5. A completely populated compact family.** Set $\hbar=A=q=\lambda=1$, hence $P=1/2$, $B=1$, and register
$$
w=1/100,\quad D=1/20,\quad d_S=d_R=1/4,\quad
M_S=p_{\min}=M_R=1,\quad p_{R0}=25,\quad0\le T\le3/4,\quad R\ge3/100.
\tag{L.9.6c.17}
$$
Use the normalized density proportional to $\exp[-1/(1-(x/w)^2)]$ on $(-w,w)$ for both positions. For the pointer choose
$$
b(s)=\frac\pi2\beta(s),\quad
\beta(s)=\frac2{d_RI}\exp\!\left[-\frac1{1-(2s/d_R-1)^2}\right],\quad
I=\int_{-1}^1e^{-1/(1-r^2)}dr
\tag{L.9.6c.18}
$$
on $(0,d_R)$ and zero outside. Its integral is $\pi/2$. The interval $[-1/2,1/2]$ gives $I\ge e^{-4/3}$ and hence $\|bK\|\le(\pi/d_R)e^{1/3}<18$. The sensing norm is at most $\lambda q(T+d_S)/(2A)\le1/2$, and its support is disjoint from readout. Thus $p_{R0}=25$ exceeds the entire receiver interaction norm with a positive reserve. Both its actual mean energy and all operating energies remain positive.

Symmetry gives $\int_0^1\sigma=1/2$ and $1/4<\int_0^1\sigma^2<1/2$, so $1/16<c_S<1/8$. Choose $p_{S0}=1+(T+c_S)/2$. Then the final source momentum is one, receiver momentum stays25, field energy is $W=(T+c_S)/2$, and the complete initial Hamiltonian stock is
$$
E_{\rm initial}=M_S+p_{S0}+M_R+p_{R0}=28+(T+c_S)/2.
\tag{L.9.6c.19}
$$
All pointer purity, context/target preparation, clock origins, momenta and continuous program parameters are retained readiness inputs, not a preparation-work minimum. The objective below is this initial energetic stock with that common readiness inventory. On the entire box $\Psi(T-R+z)\le0.77^2/2=0.29645$, so $0\le F<\sin(0.29645)/2<0.147<1/2$.

For endpoint threshold $\epsilon=1/100$, $F$ is continuous and strictly increasing for $u>-2w$ in this small-phase domain: differentiate its compact integral and use $\Psi'\ge0$, with a positive-measure set having positive derivative and cosine. Equation (L.9.6c.14) gives
$$
F(0.17)\le\tfrac12\sin(0.19^2/2)<0.01,
\qquad F(0.28)\ge\tfrac12\sin((0.26-0.05)^2/2)>0.01.
$$
There is a unique $a_\epsilon\in(0.17,0.28)$ with $F(a_\epsilon)=\epsilon$. This inverse is fixed by the independently chosen physical source and meter, not inserted as a response law. For an advantage threshold with imperfect context $e<1/2$, use the corresponding amplitude threshold $\epsilon/(1-2e)$ whenever reachable in the registered box. For $e=1/2$ no positive advantage is possible. The numerical frontier below uses perfect context or the endpoint amplitude convention.

**6. Scheduled completion and actual free retention.** Register $R\in[0.03,1]$ and final deadline $t\in[d_R,1]$. First the scheduled-completion slice has $t=T+d_R$, by which both shutdown and readout have completed. Its exact feasible set and its Pareto graph, for larger $R,t$ and smaller $E$, are
$$
R\le t-d_R-a_\epsilon,\quad E\ge28+P(t-d_R+c_S),
$$
$$
R=t-d_R-a_\epsilon,\quad E=28+P(t-d_R+c_S),\quad
 d_R+0.03+a_\epsilon\le t\le1.
\tag{L.9.6c.20}
$$
At fixed $t$, a smaller range or extra stock is dominated; different graph times cannot dominate because their required energy strictly increases. For $\alpha,\beta,\gamma>0$, the scalarization $\gamma E-\alpha R-\beta t$ has slope $\gamma P-\alpha-\beta$ along this slice, selecting its lower endpoint, upper endpoint or entire segment according as that slope is positive, negative or zero.

Scheduled completion is not maximum retained-record capability. Include every available idle continuation $t\ge T+d_R$ to the registered horizon1. After the pulse, context, target and pointer persist, both clocks run at constant positive momentum, and no additional energy is used. For $E\ge28$ define
$$
T_{\max}=\min\{t-d_R,(E-28)/P-c_S\}.
\tag{L.9.6c.21}
$$
If $T_{\max}<0$, only the null option is admitted and the budget response is zero. Otherwise the exact attained active budget response is
$$
\delta(R,t;E)=F(T_{\max}-R).
\tag{L.9.6c.22}
$$
Extra source stock is unused positive clock momentum and changes no coupling. Monotonicity over the actual compact setting interval proves optimality. The allowed $T=0$ still has finite shutdown/readout, but no receiver sensing; it gives the null endpoint.

Eliminating $T$ at the positive threshold yields
$$
t\ge R+a_\epsilon+d_R,\qquad E\ge28+P(R+a_\epsilon+c_S).
\tag{L.9.6c.23}
$$
Necessity follows from (L.9.6c.21)–(L.9.6c.22); sufficiency uses the actual setting $T=R+a_\epsilon$ and keeps the outputs until $t$. The complete idle-closed frontier is
$$
t=1,\quad E=28+P(R+a_\epsilon+c_S),\qquad
0.03\le R\le1-d_R-a_\epsilon.
\tag{L.9.6c.24}
$$
Every earlier deadline is dominated by waiting at unchanged range/stock. At deadline1 extra energy is dominated, while increasing range on the graph strictly increases the required stock. These arguments exhaust the declared family and every graph point is realized. Its scalarization has slope $\gamma P-\alpha$ in $R$, with $-\beta$ constant. The finite horizon is a comparison-domain datum, not a derived memory lifetime. On an unbounded ideal lossless-retention extension every finite deadline is dominated, so there is no finite Pareto point. This differs from falsely excluding free waiting to create a time tradeoff.

**7. Exact lower-bounded clock extension.** The linear clock energy can be replaced globally without changing any registered trajectory. Choose the clock energy unit $E_*=1$ for the numerical member (L.9.6c.17); the following dimensionful formula uses that same independently registered unit. Define
$$
\chi(p)=\frac{3E_*}8+\int_{E_*/4}^p\sigma(4s/E_*-1)\,ds.
\tag{L.9.6c.25}
$$
It is smooth, $\chi'\ge0$, $\chi=3E_*/8$ below $E_*/4$, and $\chi=p$ above $E_*/2$. Indeed symmetry makes its transition integral $E_*/8$, so its value at $E_*/2$ is $E_*/2$; endpoint flatness supplies all derivatives. In (L.9.6c.2) keep the canonical term $p\theta'$ but replace the clock energy $p$ in the lapse term by $\chi(p)$. Then $\dot\theta=\chi'(p)$, $\dot p=-\operatorname{Tr}\rho\partial_\theta H$ and $E=M+\chi(p)+\operatorname{Tr}\rho H$. In these clock energy units the registered source has $p_S\ge E_*$ and receiver $p_R=25E_*$, so the two laws agree on an open neighborhood of their whole trajectories, including any extra positive stock. The converse holds for every modified trajectory remaining above $E_*/2$. Fields, sources, positive operating energies, instrument, costs and frontier are exactly identical. Only the clock term receives a global lower bound; the full interacting field/material Hamiltonian and a finite-dimensional quantum-clock realization are not inferred.

**8. The exact receiving interfaces.** The statistical action and positive complete source above are stronger than a prescribed waveform, but have not been identified with a registered microscopic MPU/ND-RID family, its cost/action, B.4 tensor or F.4 continuum state. Quadraturing an independently supplied material ensemble is not that identification. Definition B.8's named source requires the actual same-source map; no generic action or scalar-times-identity expectation representation proves it. Proposition L.9.6b supplies its different qualified finite-MPU endpoint component, not a map to the scalar, clock and readout source of this theorem. Neither result alone joins their range, clock, energy and spacetime interfaces. No extra empirical, biological or all-hardware minimum requirement is imposed.

The output maps here are $\mathcal I_k^j(\rho)=\Pi_kU_j\rho U_j^*\Pi_k$ with the same fixed sharp pointer basis. They fix the density evolution and outer Born weights. Appendix M's normalized conditional complete-flag kernel is additional data in
$$
p_k^j(\rho)\,\delta_{\rho_k^j}(d\rho')\,G_{\rm persp}(ds'\mid s,k,N_j,\Delta t).
\tag{L.9.6c.26}
$$
A compatible interface chooses a fixed full apparatus flag $s_k$ for each outcome, including any spectator completion, and $G_{\rm persp}=\delta_{s_k}$ independently of the source sign. Its unconditional law can change with the Born probabilities, while this conditional kernel does not. Counting the Born change again inside $G_{\rm persp}$ would double count the outcome. The source equations do not select a physical interaction for the separate flag variable or a decision-advantage-to-drift map. Therefore (L.9.6c.16)'s positive decision advantage alone does not entail a positive conditional perspective-drift advantage. Such a same-source interaction must retain its own control/clock/source and energy owners. This logical independence is specific to the displayed carrier, not a universal prohibition on other drift mechanisms. $\square$

### L.9.6d–j Discontinuous and Nonmonotone Range–Time–Energy Frontiers

The following law-to-frontier results extend Theorem L.9.6a without continuity or energy-monotonicity assumptions. They retain the dominance order and positive scalar weights of Theorem L.9.6. They classify prescribed laws; their bounded response values do not establish an independently calibrated physical implementation satisfying Theorem L.9. The separately populated source and its exact frontier in Theorem L.9.6c retain their own scope.

Write $x=(R,t)\in Q$, a product of closed intervals in the nonnegative plane. Except where compactness is stated, $Q$ need not be bounded. Let $q>0$ and let $\delta:Q\times[0,\infty)\to[0,\infty)$ be any function. No regularity is implicit. Its threshold feasibility relation is

$$
 F=\{(x,E):\delta(x,E)\ge q\},\qquad F_x=\{E\ge0:(x,E)\in F\}.
$$

The order of Theorem L.9.6 is unchanged: $(y,E')$ dominates $(x,E)$ if $y\ge x$ coordinatewise and $E'\le E$, with at least one strict inequality. “Pareto” always means strong nondominance in that order, not weak Pareto efficiency. The scalar objective is the original

$$
 J(x,E)=\gamma E-\alpha R-\beta t,
 \qquad \alpha,\beta,\gamma>0.
$$

Define the **first-energy value and endpoint tag**

$$
 m(x)=\inf F_x\in[0,\infty],\qquad
 a(x)=\begin{cases}1,&m(x)<\infty\text{ and }m(x)\in F_x,\\0,&\text{otherwise.}\end{cases}
 \tag{L.9.6d.1}
$$

Thus $m=\infty$ means an empty fiber. If the original subthreshold-zero condition $\delta(x,0)<q$ is retained, $m=0$ is allowed only with $a=0$. Discontinuous laws can approach threshold feasibility at arbitrarily small positive energy.

<a id="theorem-l96d-attainment-tagged-frontier-classification-for-arbitrary-laws"></a>**Theorem L.9.6d (Attainment-Tagged Frontier Classification for Arbitrary Laws).**

For arbitrary $\delta$, put $D=\{x:m(x)<\infty\}$ and define

$$
 F_x^\uparrow=\bigcup_{e\in F_x}[e,\infty).
$$

Then:

**(a) Canonical fibers.** Every fiber has exactly one of the following upper closures:

$$
 F_x^\uparrow=\begin{cases}
 \varnothing,&m(x)=\infty,\\
 [m(x),\infty),&m(x)<\infty,\ a(x)=1,\\
 (m(x),\infty),&m(x)<\infty,\ a(x)=0.
 \end{cases}\tag{L.9.6d.2}
$$

The pair $(m,a)$ is the unique description of this upper closure. No physical ability to waste energy is assumed: $F^\uparrow$ is an order-theoretic normalization, not a claim that all normalized triples are physically feasible.

**(b) Pareto points.** The complete original Pareto set consists exactly of $(x,m(x))$ satisfying $a(x)=1$ and

$$
 \text{for every }y\in Q,\ y\ge x,\ y\ne x:
 \quad m(y)>m(x)\quad\text{or}\quad[m(y)=m(x)\text{ and }a(y)=0].
 \tag{L.9.6d.3}
$$

Here $m(y)=\infty$ satisfies the first alternative. $F$ and $F^\uparrow$ have identical Pareto sets, including the case of an empty Pareto set despite nonempty $F$.

**(c) Exact scalar values and all minimizers.** With the usual infimum conventions,

$$
 \inf_F J=\inf_{x\in D} f(x),\qquad
 f(x)=\gamma m(x)-\alpha R-\beta t.\tag{L.9.6d.4}
$$

If the common value $v$ is finite, the entire attained minimizer set is

$$
 \{(x,m(x)):x\in D,\ f(x)=v,\ a(x)=1\}.\tag{L.9.6d.5}
$$

If $F$ is empty or $v=-\infty$ there is no minimizer. These conclusions are invariant under replacing $F$ by $F^\uparrow$. The tag $a$ cannot be omitted from (L.9.6d.3) or (L.9.6d.5).

**(d) Complete mathematical representation.** Conversely, every function $m:Q\to[0,\infty]$ and tag $a:Q\to\{0,1\}$, with $a=0$ where $m=\infty$, is represented by a bounded threshold law. Specifically, choose $d\ge q$ and set

$$
 \delta_{m,a}(x,E)=d\,1_{\{m(x)<E\ \mathrm{or}\ [m(x)=E,\ a(x)=1]\}}.\tag{L.9.6d.6}
$$

Its pair is exactly $(m,a)$. It has subthreshold zero response precisely when $m(x)>0$ or $[m(x)=0,\ a(x)=0]$ at every $x$. If $m$ and $a$ are Borel, this law is Borel. If $q<1/2$ one may choose $q\le d<1/2$, retaining a response bounded by one-half. Physical realization requires the separately stated source maps.

**Proof.** If $m<\infty$ and $E>m$, the defining property of the infimum supplies $e\in F_x$ with $e<E$; hence $E$ is in $F_x^\uparrow$. No $E<m$ belongs to that upper closure. The endpoint belongs exactly when $m$ itself is feasible. This proves (a) and uniqueness.

For (b), take any feasible $E>m(x)$. Choose $e\in F_x$ with $e<E$. Then $(x,e)$ dominates $(x,E)$, irrespective of disconnectedness or nonmonotonicity of $F_x$. Consequently every Pareto point must have $E=m(x)$ and $a(x)=1$. Such a point cannot be dominated in its own $x$-fiber. At another $y\ge x$, $y\ne x$, there is a feasible $e\le m(x)$ exactly when $m(y)<m(x)$, or when $m(y)=m(x)$ and $a(y)=1$. If the inequality of infima is strict, choose $e$ sufficiently close to $m(y)$; if it is equality, only the attained endpoint can work. This is exactly the negation of (L.9.6d.3). Formula (L.9.6d.2) preserves all of these tests.

For (c), on any nonempty fiber $\inf_{E\in F_x}\gamma E=\gamma m(x)$. Taking infima over $x$ proves (L.9.6d.4), including extended values. If a feasible $(x,E)$ attains a finite $v$, then

$$
 v=J(x,E)\ge f(x)\ge v.
$$

Both inequalities are equalities and $\gamma>0$ gives $E=m(x)$, $a(x)=1$. Conversely every point in (L.9.6d.5) is feasible and attains $v$. Every actual $J$ is finite, so $-\infty$ cannot be attained. Empty feasibility has no minimizer. The same proof applies to $F^\uparrow$.

For (d), the feasible fibers of (L.9.6d.6) are exactly (L.9.6d.2), because $d\ge q>0$. Their values and tags are the supplied ones. The Borel and zero-energy statements follow directly from the defining inequalities. $\square$

**Why a usual untagged generalized inverse is insufficient.** On a singleton $Q$, $F=[1,\infty)$ and $G=(1,\infty)$ have the same $m=1$. $F$ has a Pareto point and an attained scalar minimum; $G$ has neither. A dominance error also occurs if $x<y$, $m(x)=m(y)=1$, $a(x)=1$, $a(y)=0$: the attained point at $x$ is not dominated by $y$. Replacing the latter open fiber by its closure would invent a dominator.

<a id="corollary-l96e-nondecreasing-laws-with-jumps-and-plateaux"></a>**Corollary L.9.6e (Nondecreasing Laws with Jumps and Plateaux).**

If $E\mapsto\delta(x,E)$ is merely nondecreasing, $F_x$ itself is exactly (L.9.6d.2). Thus (L.9.6d.1)–(L.9.6d.5) classify every such law, with no continuity assumption. If the energy law is right-continuous at a finite $m(x)$, then $a(x)=1$. At an upward jump, $\delta(x,m(x))$ can strictly exceed $q$; the equality $\delta(x,m(x))=q$ from Theorem L.9.6a need not survive. Energy plateaux are handled without any strict-increase hypothesis.

**Proof.** A nonempty upper set contains every $E$ above its infimum; its sole undetermined point is its infimum. For right continuity, choose feasible $E_n$ decreasing to $m(x)$; continuity from the right gives $\delta(x,m(x))\ge q$. $\square$

The weak/strict threshold distinction is the standard generalized-inverse distinction. The endpoint implication here is proved directly on the stated finite-energy domain.

<a id="theorem-l96f-closed-normal-forms-and-scalar-attainment"></a>**Theorem L.9.6f (Closed Normal Forms and Scalar Attainment).**

Regard $m$ as extended-real-valued. The normalized relation $F^\uparrow$ is closed in $Q\times[0,\infty)$ **if and only if** $m$ is lower semicontinuous on $Q$ and $a(x)=1$ at every finite $m(x)$.

If $F$ itself is closed, these two conditions hold. Therefore, if $Q$ is compact, $F$ is nonempty, and $F$ is closed, every positive scalarization $J$ has an attained minimum and $F$ has at least one Pareto point. More generally it suffices that the normalized relation is closed. It is not necessary that every $x$ be feasible or that $\delta$ be energy-monotone or continuous. Upper semicontinuity of $\delta$ is one sufficient way to make $F$ closed.

**Proof.** A closed $F^\uparrow$ must contain its finite-fiber limit $m(x)$, so $a=1$. It is then the epigraph of $m$. An epigraph is closed exactly when $m$ is lower semicontinuous: along convergent $x_n$ with bounded $m(x_n)$, pass to a convergent subsequence of the energy coordinates for one direction; for the other use $m(x)\le\liminf_n m(x_n)\le\lim_n E_n$. This gives a direct sequential proof because $Q$ is metrizable.

If $F$ is closed, a minimizing energy sequence in a fixed nonempty fiber converges to $m(x)$, proving $a=1$. To prove lower semicontinuity, if $x_n\to x$ and $\liminf_n m(x_n)<\infty$, choose a subsequence realizing that liminf; the pairs $(x_n,m(x_n))$ are in $F$ and converge, so their limit is in $F$. Thus $m(x)\le\liminf_n m(x_n)$.

On compact $Q$, $f=\gamma m-\alpha R-\beta t$ is proper lower semicontinuous and bounded below, hence attains its finite infimum; the tag is one there. Alternatively, start with one feasible incumbent $J_0$. Every competitor with $J\le J_0$ has $E\le[J_0+\max_Q(\alpha R+\beta t)]/\gamma$. The relevant closed set is compact. Any positive-weight scalar minimizer is Pareto because a dominator would strictly lower $J$. Upper semicontinuity makes $\{\delta\ge q\}$ closed by definition. $\square$

**Failure modes are genuine.** Closed energy fibers alone do not ensure a scalar minimum. Let $Q=[0,1]\times\{0\}$, $m(0)=2$ and $m(R)=1+R$ for $R>0$, all tags one, and use (L.9.6d.6). For $0<\alpha<\gamma$ the scalar infimum is $\gamma$, approached as $R$ decreases to zero, but never attained. Here $m$ is not lower semicontinuous. Conversely $m$ identically one is lower semicontinuous, but if all tags are zero no minimum exists. Both conditions in Theorem L.9.6f are needed for its closed-normal-form conclusion.

**Strict spatial attenuation does not remove energy-jump plateaux.** Let $s=\mu R+t/\tau$ and

$$
 h(E)=\begin{cases}E/10,&0\le E<1,\\
 2/5+(1-e^{-(E-1)})/20,&E\ge1.
 \end{cases}
$$

The response $\delta=e^{-s}h(E)$ is strictly increasing in energy, discontinuous at $E=1$, and strictly decreasing in both $R$ and $t$ for every $E>0$. For $q=1/5$ and any compact rectangle with $0\le s\le\log2$, however, $m$ identically equals one. Only the rectangle's upper-right corner is Pareto. Thus the full-graph conclusion of Theorem L.9.6a(b) uses continuity essentially; strict spatial decrease alone is insufficient.

<a id="theorem-l96g-exact-semialgebraic-threshold-law-classification"></a>**Theorem L.9.6g (Exact Semialgebraic Threshold-Law Classification).**

Suppose $Q$ and $F$ are given by finite Boolean combinations of polynomial equalities and strict or weak inequalities with rational or real-algebraic coefficients. The relation $F$ need not be closed or connected and need not be the graph/superlevel set of a continuous law. The threshold $q$ and all scalar weights are rational or real algebraic and are supplied exactly. There is a terminating algorithm producing:

- a quantifier-free description of $D$ and the graph of the finite part of $m$;
- the endpoint-tag partition $a=0$ or 1;
- a quantifier-free description of the **entire** Pareto set;
- feasibility, boundedness below and attainment decisions for $J$, its exact algebraic infimum when finite, and a quantifier-free description of every minimizer;
- a real-algebraic sample minimizer whenever the minimizer set is nonempty.

**Algorithm and proof.** Write $\Phi(x,E)$ for the input feasibility formula, including $Q$ and $E\ge0$. Perform real quantifier elimination on the following finite formulas:

$$
 D(x)\ \Longleftrightarrow\ \exists E\,\Phi(x,E),
$$

$$
 M(x,u)\ \Longleftrightarrow\ u\ge0\ \land
 [\forall E\,(\Phi(x,E)\Rightarrow E\ge u)]\ \land
 [\forall h>0\ \exists E\,(\Phi(x,E)\land E<u+h)].\tag{L.9.6g.1}
$$

The last conjunct ensures nonemptiness and approachability, rather than allowing an arbitrary lower bound. Thus $M$ is exactly the finite infimum graph. Split its points by $\Phi(x,u)$ and its negation to get the tag. Substitute those descriptions into (L.9.6d.3), eliminating its finite $y$-quantifier, or equivalently eliminate the direct polynomial dominance formula. This yields the entire Pareto relation, not merely supported points found by weighted sums.

For scalarization, eliminate $x$,$E$ from

$$
 V(z)\Longleftrightarrow\exists x,E\,[\Phi(x,E)\land z=\gamma E-\alpha R-\beta t].\tag{L.9.6g.2}
$$

A semialgebraic subset of the real line is a finite union of intervals and points, with finite endpoints in the real algebraic numbers (the real closure of the field generated by the algebraic input coefficients), or infinite endpoints. Its exact cell decomposition tells whether $V$ is empty, unbounded below, or has a finite leftmost endpoint, and whether that endpoint belongs to $V$. This directly separates minimum from unattained infimum. For a finite attained $v$, the minimizers are exactly $\Phi$ and $J=v$; standard real-algebraic cell sampling supplies a point.

Use the terminating real-closed-field elimination and algebraic-sampling interface already stated in Theorem E.8.2.5, Section 5. Termination follows from that interface; all displayed formulas have finitely many variables and polynomial atoms. Algebraic coefficients can equivalently be represented by minimal polynomials with isolating intervals. $\square$

**Scope.** The construction uses established real quantifier elimination on exactly represented input. It covers every finitely represented semialgebraic discontinuous/nonmonotone law, not arbitrary real-oracle laws or unrestricted transcendental expressions. The analytical families below lie outside global semialgebraicity and are evaluated separately.

**Bounded digital saturation families.**

Fix $R_{\max},t_{\max}>0$, $Q=[0,R_{\max}]\times[0,t_{\max}]$, $\mu,\tau,\Delta>0$, $0<\rho<1$ and $0<q<d<1/2$. Define

$$
 s=\mu R+t/\tau,\quad A=\mu R_{\max},\quad B=t_{\max}/\tau,\quad S=A+B,
$$

$$
 a_n=d(1-\rho^n),\qquad
 L_n=\log(a_n/q)\ (n\ge1),\quad L_0=-\infty,\quad
 L_\infty=\log(d/q)>0.
$$

The strictly increasing sequence $L_n$ tends to $L_\infty$ without attaining it. Consider the bounded, nondecreasing but non-strict and discontinuous energy response

$$
 \delta_{\rm dig}(R,t;E)=d(1-\rho^{\lfloor E/\Delta\rfloor})e^{-s}.\tag{L.9.6h.1}
$$

The parameter dimensions are as follows: $\Delta$ is energy, $\mu$ inverse length, $\tau$ time, and $d,q,\rho$ are dimensionless.

<a id="theorem-l96h-complete-digital-frontier-and-finite-scalar-optimum"></a>**Theorem L.9.6h (Complete Digital Frontier and Finite Scalar Optimum).**

**(a) Feasibility and first energy.** A point $x$ has some feasible energy exactly when $s<L_\infty$. On that domain,

$$
 n(s)=\min\{n\ge1:s\le L_n\}
 =\left\lceil\frac{\log(1-(q/d)e^s)}{\log\rho}\right\rceil,
 \qquad m(x)=\Delta n(s),\quad a(x)=1.\tag{L.9.6h.2}
$$

The ceiling is exact, including equality at a step, and is not to be evaluated with unverified floating-point rounding at a boundary.

**(b) Entire Pareto set.** It is the union

$$
 \bigcup_{n:\ 0\le L_n<S}
 \{(R,t,n\Delta):0\le R\le R_{\max},\ 0\le t\le t_{\max},\ \mu R+t/\tau=L_n\},\tag{L.9.6h.3}
$$

plus the single upper-right-corner point

$$
 (R_{\max},t_{\max},n_c\Delta),\qquad
 n_c=\min\{n:L_n\ge S\},\tag{L.9.6h.4}
$$

when $S<L_\infty$. If $S\ge L_\infty$, the corner is infeasible and (L.9.6h.3) has infinitely many nonempty steps. If some $L_n=S$, it contributes via (L.9.6h.4), not twice. No two-dimensional energy plateau interior is Pareto.

**(c) Finite exact scalar optimization.** Put $p=\alpha/\mu$, $r=\beta\tau$ and $W=pA+rB$. Define, for $0\le c\le S$,

$$
 H(c)=\max\{p u+r v:0\le u\le A,\ 0\le v\le B,\ u+v\le c\}.
$$

This function is explicit. If $p\ge r$,

$$
 H(c)=p\min(c,A)+r\max(0,c-A);\tag{L.9.6h.5}
$$

if $r\ge p$, exchange $(p,A)$ with $(r,B)$. Let $n_0=\min\{n:L_n\ge0\}$ and $c_n=\min(L_n,S)$ for $n\ge n_0$, and

$$
 J_n=\gamma\Delta n-H(c_n),\qquad
 N=\left\lfloor\frac{J_{n_0}+W}{\gamma\Delta}\right\rfloor.\tag{L.9.6h.6}
$$

Then $N\ge n_0$ and the exact global scalar minimum is

$$
 \min_{n_0\le n\le N}J_n.\tag{L.9.6h.7}
$$

Every minimizing implementation is obtained from a minimizing $n$ and an optimizer in (L.9.6h.5), at $E=n\Delta$. If $p>r$, the unique allocation is $u=\min(c_n,A)$, $v=\max(0,c_n-A)$; if $r>p$ use its transpose; if $p=r$ every allowed point of the slice $u+v=c_n$ is optimal. Convert $R=u/\mu,\ t=\tau v$. Energies $n>n_c$, where defined, cannot minimize and may be discarded.

**Proof.** At fixed $E$ with integer $n=\lfloor E/\Delta\rfloor$, threshold crossing is equivalent to $d(1-\rho^n)\ge qe^s$, or $s\le L_n$. The supremum $d$ is never attained at finite $n$, giving the strict domain $s<L_\infty$. Solving $\rho^n\le1-(q/d)e^s$, remembering $\log\rho<0$, gives (L.9.6h.2). The first feasible energy is exactly $n(s)\Delta$ because floor includes the left endpoint.

At level $n$, every feasible $x$ satisfies $s\le L_n$. If $L_n<S$ and $s<L_n$, at least one coordinate can increase within the box to reach the slice $s=L_n$; the increased point is feasible at the same energy. Conversely, at $s=L_n$, every strict coordinatewise increase violates that level's bound, and every lower energy has level at most $n-1$ with $L_{n-1}<L_n$. Such a point is Pareto. If $L_n\ge S$, the corner dominates all other points at that level, and only its first feasible level can survive. These arguments prove (L.9.6h.3)–(L.9.6h.4), including every endpoint and the infinite-step case.

For positive scalar weights the energy can always be reduced to a level endpoint. At $E=n\Delta$ the feasible spatial/time domain is $u+v\le c_n$. Its linear benefit is maximized by filling the coordinate with the larger reward per unit of $s$ first, proving (L.9.6h.5) by a transfer argument: if $p>r$, unused $u$-capacity and positive $v$ can be traded by an equal increment, strictly increasing the benefit. Positive weights also saturate the cap $c_n$. This proves $J_n$ and its optimizer list. Since $H\le W$,

$$
 J_n\ge\gamma\Delta n-W.
$$

Any $n$ with $J_n\le J_{n_0}$ therefore satisfies $n\le(J_{n_0}+W)/(\gamma\Delta)$. All discarded levels strictly lose to the incumbent, so the finite set (L.9.6h.7) is exact and nonempty. Its optimizer cannot have an unnecessarily high energy level because lowering energy at the same $x$ strictly lowers $J$. $\square$

**Evaluated infinite-frontier example.** Take $d=2/5,\ q=1/10,\ \rho=1/2,\ \Delta=\mu=\tau=R_{\max}=t_{\max}=\gamma=\beta=1,\ \alpha=2$. Then $S=2>\log4$, so the frontier contains infinitely many steps and the upper-right corner is infeasible. Nevertheless $n_0=1$ and $N=\lfloor4-2\log2\rfloor=2$. The only scalar candidates are $J_1=1-2\log2$ and $J_2=1-\log3$. Since $J_2-J_1=\log(4/3)>0$, the unique minimum is at $(R,t,E)=(\log2,0,1)$. No numerical truncation of the infinite step family is involved.

<a id="theorem-l96i-open-digital-thresholds-and-complete-nonattainment"></a>**Theorem L.9.6i (Open Digital Thresholds and Complete Nonattainment).**

Replace $\lfloor E/\Delta\rfloor$ in (L.9.6h.1) by

$$
 k(E)=\max\{0,\lceil E/\Delta\rceil-1\}.\tag{L.9.6i.1}
$$

The resulting bounded left-continuous digital law has the same $m(x)$ and the same $D$ as (L.9.6h.1), but $a(x)=0$ at every finite $m(x)$. Its complete Pareto set is empty. Every positive scalarization has the finite infimum (L.9.6h.7), approached arbitrarily closely, and has no minimizer.

**Proof.** At fixed $s$, level $n(s)$ first appears for $E>n(s)\Delta$, never at equality, and persists at least to $(n(s)+1)\Delta$. Thus the feasible fiber is $(n(s)\Delta,\infty)$. Every feasible energy can be decreased at fixed $x$. Theorem L.9.6d(b)–(c) proves the claims; explicit approximation uses the digital optimizer's $x$ and $E=n\Delta+\varepsilon$ with $0<\varepsilon<\Delta$, so $J$ differs from the infimum by $\gamma\varepsilon$. $\square$

Theorems L.9.6h–L.9.6i evaluate two explicitly specified infinite-step response families. Their endpoint convention determines Pareto and scalar-minimum existence even though every scalar infimum is unchanged.

**Periodic resonant energy families.**

Keep the same finite rectangle, $\mu,\tau,q,d$ and the definitions of $A,B,S,s$, but take $\omega>0$ with units inverse energy. Let

$$
 \delta_{\rm res}(R,t;E)=d e^{-s}\sin^2(\omega E).\tag{L.9.6j.1}
$$

This response is smooth but not nondecreasing in energy; it has infinitely many disconnected feasible resonance bands. Define $L=\log(d/q)>0$ and $z(s)=(q/d)e^s$.

<a id="theorem-l96j-complete-resonant-frontier-and-two-candidate-scalar-optimum"></a>**Theorem L.9.6j (Complete Resonant Frontier and Two-Candidate Scalar Optimum).**

**(a) Entire energy feasibility.** $D=\{x:s\le L\}$. For $x\in D$ put $b(s)=\arcsin\sqrt{z(s)}\in(0,\pi/2]$. Then

$$
 F_x=\bigcup_{k=0}^{\infty}
 \left[\frac{k\pi+b(s)}{\omega},
       \frac{(k+1)\pi-b(s)}{\omega}\right],\quad
 m(x)=\frac{b(s)}{\omega},\quad a(x)=1.\tag{L.9.6j.2}
$$

At $s=L$ each interval is a singleton. The complete Pareto set is the entire graph $E=m(x)$ on $D$. Every later lobe is dominated at the same $R$,$t$ by the first-lobe threshold.

**(b) Exact positive-weight scalar solution.** Let $C=\min(S,L)$, let $H$ be (L.9.6h.5), and minimize

$$
 g(s)=\frac{\gamma}{\omega}\arcsin\sqrt{(q/d)e^s}-H(s),
 \qquad 0\le s\le C.\tag{L.9.6j.3}
$$

This is a strictly convex one-variable function, hence has a unique minimizing $s$. $H$ has at most two linear pieces. On a closed piece $[\ell,h]$ with slope $w>0$, its unique constrained minimizing $s$ is

$$
 s_w=\operatorname{clip}_{[\ell,h]}
 \log\left[\frac d q\frac{4\omega^2w^2}{\gamma^2+4\omega^2w^2}\right].\tag{L.9.6j.4}
$$

Evaluate $g$ at the at most two resulting candidates and choose its smaller value; equality can occur only if both give the same global $s$. All original minimizers have $E=m(s)$, and their $R$,$t$ allocations are exactly the maximizers of $H(s)$ from Theorem L.9.6h(c). This gives every minimizer, including the continuum of tied allocations when $p=r$.

**Proof.** On each period of $\sin^2$, threshold crossing is exactly between $b$ and $\pi-b$; crossing exists iff $z\le1$. This gives (L.9.6j.2). The first-energy function is strictly increasing in $s$, so any strict coordinatewise increase in $R$,$t$ strictly increases $m$, when it remains feasible. Theorem L.9.6d gives the complete graph frontier.

For fixed $s$, positive scalarization chooses the maximal benefit $H(s)$, proving (L.9.6j.3). For $0\le s<L$,

$$
 m'(s)=\frac{\sqrt z}{2\omega\sqrt{1-z}},\qquad
 m''(s)=\frac{\sqrt z}{4\omega(1-z)^{3/2}}>0.\tag{L.9.6j.5}
$$

Thus $m$ is strictly convex on $[0,L)$, extends continuously and strictly convexly to $L$, and $H$ is concave (its slope can only decrease at the allocation switch). Hence $g$ is strictly convex on $[0,C]$. On a linear piece, stationarity is $\gamma m'=w$, whose unique solution is $z=4\omega^2w^2/(\gamma^2+4\omega^2w^2)$, giving (L.9.6j.4). Since the derivative is strictly increasing, constraining a piece clips its unconstrained root to the piece endpoints. If an endpoint equals $L$ the derivative tends to positive $\infty$, consistent with the same formula. The one or two pieces cover the full compact interval, proving the candidate rule and attainment. $\square$

**Exact-parameter scope.** The finite candidate rules (L.9.6h.7) and (L.9.6j.4) are exact symbolic characterizations with exact parameter comparisons, not a decidability claim for arbitrary oracle-supplied real/transcendental data.

**Physical source scope.** Equation (L.9.6j.1) prescribes a mathematical response law with energy variable $E$. Its physical realization requires the energy, control, time and measurement map and the source ledger of Theorem L.9; pulse area alone does not supply that map.

<a id="theorem-l96k-complete-energy-cut-classification-and-attainment"></a>**Theorem L.9.6k (Complete Energy-Cut Classification and Attainment).** Let $Q\subseteq[0,\infty)^2$ be nonempty, let $q>0$, and let $\delta:Q\times[0,\infty)\to[0,\infty)$ be any response law. No continuity or monotonicity is assumed. Write $x=(R,t)$ and order triples by larger $R,t$ and smaller $E$, as in Theorem L.9.6. Define the energy fiber, its lower cut and its endpoint bit by
$$
A_x:=\{E\ge0:\delta(x;E)\ge q\},\qquad
m(x):=\inf A_x,\qquad
b(x):=\mathbf1_{\{m(x)<\infty,\ m(x)\in A_x\}},
\tag{L.9.6k.1}
$$
with $\inf\varnothing=+\infty$. The following statements classify the threshold optimization of every such law.

(a) *(Exact budget quotient.)* For every finite budget $B\ge0$,
$$
A_x\cap[0,B]\ne\varnothing
\quad\Longleftrightarrow\quad
m(x)<B\ \text{ or }\ [m(x)=B\text{ and }b(x)=1].
\tag{L.9.6k.2}
$$
Two laws have the same answers to every range--time--energy-budget feasibility query exactly when their pairs $(m,b)$ agree. This quotient preserves budget feasibility; for a nonmonotone law it need not preserve feasibility at an exact energy.

(b) *(Complete Pareto census.)* The entire frontier is
$$
\begin{split}
\mathcal F=\{(x,m(x)):\ &m(x)<\infty,\ b(x)=1,\quad
\text{there is no }y\in Q\text{ with }y\ge x,\ y\ne x,\\
&[m(y)<m(x)\ \text{or}\ (m(y)=m(x)\text{ and }b(y)=1)]\}.
\end{split}
\tag{L.9.6k.3}
$$
Here $y\ge x$ means both coordinate inequalities. In particular, every fiber with an unattained lower cut contributes no Pareto point, even when it contains feasible energies. A competitor with a strictly smaller lower cut dominates whether or not that lower cut is attained; an equal-cut competitor dominates precisely when its endpoint bit is one.

(c) *(Scalar infimum and exact attainment.)* Let $Q_0\subseteq Q$ be nonempty and compact and let $\alpha,\beta,\gamma>0$. Put
$$
f(x):=\gamma m(x)-\alpha R-\beta t,
\qquad
j_*:=\inf_{x\in Q_0}f(x).
\tag{L.9.6k.4}
$$
The infimum of $J=\gamma E-\alpha R-\beta t$ over the actual feasible triples above $Q_0$ is exactly $j_*$. If that feasible set is nonempty, $j_*$ is finite, and its complete set of minimizers is
$$
\{(x,m(x)):x\in Q_0,\ f(x)=j_*,\ b(x)=1\}.
\tag{L.9.6k.5}
$$
Thus minimizing the lower-cut function without checking its endpoint bit can produce a value that no implementation attains. If the actual feasible set above $Q_0$ is nonempty and closed in $Q_0\times[0,\infty)$, a minimizer exists. Upper semicontinuity of $\delta$ on that product is one sufficient condition for closedness.

(d) *(Weak energy monotonicity.)* If $E\mapsto\delta(x;E)$ is nondecreasing, its fiber is exactly one of
$$
\varnothing,\qquad [m(x),\infty),\qquad (m(x),\infty),
\tag{L.9.6k.6}
$$
with the last two alternatives distinguished by $b(x)=1$ and $b(x)=0$. This includes discontinuities, plateaus and saturation. When the finite lower cut exists, right continuity in energy makes $b(x)=1$. If the law is also nonincreasing in $R,t$, then $x\le y$ implies $A_y\subseteq A_x$ and $m(x)\le m(y)$. Consequently an attained point above $x$ is Pareto exactly when no coordinatewise larger distinct $y$ has the same finite lower cut and an attained endpoint. For laws strictly increasing in energy and continuous as in Theorem L.9.6a, these formulas recover that theorem.

(e) *(Exhaustion of lower-cut data.)* Every function $m:Q\to[0,\infty]$ and every bit function $b:Q\to\{0,1\}$ with $b=0$ on $\{m=\infty\}$ is realized by the bounded energy-nondecreasing law
$$
\delta_{m,b}(x;E)
=q\,\mathbf1_{\{m(x)<E\}\,\cup\,\{m(x)=E,\ b(x)=1\}}.
\tag{L.9.6k.7}
$$
The additional subthreshold condition $\delta(x;0)<q$ holds exactly when $b(x)=0$ wherever $m(x)=0$. Thus no regularity, endpoint attainment or nonempty Pareto frontier follows from weak energy monotonicity alone. Equation (L.9.6k.7) is a complete scalar-law construction; physical admission of a law is supplied by its own source and L.9 realization.

(f) *(Lossless reconstruction across thresholds.)* For an energy-nondecreasing, finite-valued response law, the lower cut and endpoint bit at every positive threshold recover the whole law, including its jump values. More precisely, for each $x$ and $u>0$ supply a pair $(m_u(x),b_u(x))$ allowed by (e), and let
$$
C_u(x):=\{E\ge0:E>m_u(x)\text{ or }[E=m_u(x),\ b_u(x)=1]\}.
\tag{L.9.6k.8}
$$
These are the threshold fibers of exactly one such law if and only if, for each $x$,
$$
C_v(x)\subseteq C_u(x)\ (0<u<v),\qquad
C_u(x)=\bigcap_{0<v<u}C_v(x),\qquad
\bigcap_{u>0}C_u(x)=\varnothing.
\tag{L.9.6k.9}
$$
The unique law is
$$
\delta(x;E)=\sup\bigl(\{u>0:E\in C_u(x)\}\cup\{0\}\bigr).
\tag{L.9.6k.10}
$$
Thus the all-threshold cut family is a lossless classification of weakly energy-monotone response laws; the one-threshold pair in (a) is the smaller invariant sufficient for the registered optimization.

*Proof.* If $A_x$ is empty, both sides of (L.9.6k.2) are false. Otherwise its infimum is finite and every element is at least $m(x)$. For $B>m(x)$, the definition of infimum supplies an $E\in A_x$ with $E<B$; at $B=m(x)$ the only possible element in $A_x\cap[0,B]$ is $m(x)$ itself. This proves (a). Conversely the collection of feasible budgets is a nonempty open or closed upper ray when $A_x$ is nonempty; its infimum recovers $m(x)$ and its membership at that infimum recovers $b(x)$. Empty budget data recover $m(x)=\infty,b(x)=0$. These recovery statements prove both directions of quotient completeness.

For (b), take any feasible $(x,E)$. If $E>m(x)$, choose $E'\in A_x$ with $m(x)\le E'<E$; then $(x,E')$ dominates it. Hence a Pareto point must have $E=m(x)$ and $b(x)=1$. Such a point cannot be dominated at the same $x$. A different $y\ge x$ dominates it exactly when $A_y\cap[0,m(x)]$ is nonempty, and (a) evaluates that condition exactly as in (L.9.6k.3). This proves necessity and sufficiency, including unattained competitor cuts.

For (c), every feasible value is at least $f(x)\ge j_*$. If no fiber is nonempty, both infima are $+\infty$. Otherwise compactness bounds $\alpha R+\beta t$, while $m\ge0$ and one feasible finite triple supplies an upper bound, so $j_*$ is finite. Given $\varepsilon>0$, choose $x\in Q_0$ with finite $m(x)$ and $f(x)<j_*+\varepsilon/2$. Choose $E\in A_x$ with $E<m(x)+\varepsilon/(2\gamma)$. Its actual objective is less than $j_*+\varepsilon$, proving equality of infima. At a minimizer, $E>m(x)$ would permit a strict energy decrease at fixed $x$, so $E=m(x)$ and $b(x)=1$. The remaining condition is $f(x)=j_*$; conversely it suffices. If the actual feasible set is closed, fix one feasible objective value $J_0$ and a minimizing sequence whose objective values are at most $J_0+1$. With $M=\max_{Q_0}(\alpha R+\beta t)$, all its energies are at most $(J_0+1+M)/\gamma$. It therefore has a subsequence in a compact product converging to an actual feasible point, and continuity of $J$ gives the minimum. An upper semicontinuous function has closed superlevel sets, proving the final sufficient condition.

For (d), energy monotonicity makes $A_x$ an upper set. If it is nonempty, every $E>m(x)$ exceeds some member of $A_x$ and hence belongs to it. Membership at $m(x)$ is exactly its bit. If the law is right-continuous there, the feasible sequence $m(x)+1/n$ gives $\delta(x;m(x))\ge q$ in the limit. Spatial/time monotonicity gives the claimed fiber inclusion. A smaller competitor cut in (b) is then impossible, leaving precisely the equal-cut, attained-endpoint test. For the continuous strictly energy-increasing law of Theorem L.9.6a, every finite lower cut is attained and $\delta(x;m(x))=q$, so its frontier and scalar formulas are the stated special case.

Finally, direct evaluation of (L.9.6k.7) gives exactly the three fibers in (L.9.6k.6) with the prescribed cut and bit, including an empty fiber at $m=\infty$ and an open ray at $m=0,b=0$. Its range is $\{0,q\}$, so it is bounded, and its only possible change in energy is an upward step. Evaluating it at zero proves the last equivalence in (e).

For (f), actual superlevel sets are nested in their thresholds, satisfy the displayed increasing-threshold intersection identity, and have empty intersection over all positive thresholds because the response is finite at each energy. Conversely, under (L.9.6k.9), fix $x,E$. Empty intersection supplies a threshold $u_0$ whose cut excludes $E$; nesting excludes $E$ at every higher threshold. Hence the supremum in (L.9.6k.10) is finite. If that value is $a>0$, nesting gives $E\in C_u(x)$ for every $0<u<a$: a member threshold larger than $u$ exists by the definition of supremum. The intersection identity then gives $E\in C_a(x)$. No threshold larger than $a$ contains $E$. If $a=0$, no positive threshold contains it. Thus $C_u(x)=\{E:\delta(x;E)\ge u\}$ for every $u>0$. Each $C_u(x)$ is an upper ray, so $E\le E'$ implies every threshold met at $E$ is met at $E'$ and consequently $\delta(x;E)\le\delta(x;E')$. Finally, positive superlevel memberships determine any nonnegative finite number, proving uniqueness. ∎

<a id="corollary-l96l-computed-jump-plateau-saturation-and-oscillatory-frontiers"></a>**Corollary L.9.6l (Computed Jump, Plateau, Saturation and Oscillatory Frontiers).** The following laws supply explicit cases of Theorem L.9.6k. All response values are dimensionless. Fix positive units $E_0,L_0,T_0$, write $r=R/L_0$, $s=t/T_0$, $e=E/E_0$ and $h=1+r+s$, and use $q=1/2$ except where another threshold is stated.

(i) On $(r,s)\in[0,1]^2$, the closed-jump law $\delta=\mathbf1_{\{e\ge h\}}$ has $m=E_0h,b=1$ and the entire graph $E=E_0h$ as its frontier. The open-jump law $\delta=\mathbf1_{\{e>h\}}$ has the same lower cut and $b=0$ everywhere, and its frontier is empty. With $\gamma=1/E_0$, $\alpha=1/L_0$ and $\beta=1/T_0$, both scalar infima equal one; the first law attains it at every point of its frontier and the second attains it nowhere. In particular, discontinuous laws may cross the threshold by a jump rather than satisfy $\delta(x;m(x))=q$.

(ii) On $(r,s)\in[0,2]^2$, the plateau law
$$
\delta=\frac{\min\{e,1\}}{h}
\tag{L.9.6l.1}
$$
has finite cuts precisely on $r+s\le1$. There $m=E_0h/2$, the cut is attained, and the full frontier is $E=E_0h/2$. By contrast,
$$
\delta=\frac{1-e^{-e}}{h}
\tag{L.9.6l.2}
$$
has finite cuts precisely on $r+s<1$, where $m=E_0\log(2/(1-r-s))$, with every cut attained and the whole graph Pareto. At $r+s=1$ its response supremum equals $q$ but no finite energy is feasible. A supremum response at threshold therefore cannot replace a threshold-attainment test.

(iii) On $(r,s)\in[0,1]^2$, the continuous nonmonotone law
$$
\delta=\sin^2(e/h)
\tag{L.9.6l.3}
$$
has exact feasible energy fibers
$$
A_{R,t}=\bigcup_{k=0}^{\infty}
[E_0h(\pi/4+k\pi),\ E_0h(3\pi/4+k\pi)].
\tag{L.9.6l.4}
$$
Its entire frontier is $E=\pi E_0h/4$. Energy budgets at least this cut are feasible, although many exact energies above it are infeasible.

(iv) On $(r,s)\in[0,1]^2$, let the lower cut be $m=E_0$ everywhere. The step-law construction (L.9.6k.7) with $b=1$ everywhere has the singleton frontier $(L_0,T_0,E_0)$. With $b=1$ only at $(R,t)=(0,0)$, it instead has the singleton frontier $(0,0,E_0)$. These two laws have the same constant lower-cut function; endpoint bits change both the frontier and the attainment of scalar optima. For the second law and the weights in (i), the scalar infimum is $-1$, approached at $(L_0,T_0,E)$ as $E\downarrow E_0$, and is unattained.

*Proof.* In (i), the definition of each step gives its cut and bit. The function $h$ is strictly increasing under every nonzero coordinatewise increase, so (L.9.6k.3) gives the asserted frontiers. Substitution gives $f=h-r-s=1$, and (L.9.6k.5) gives exact attainment. In (ii), the inequality $\min\{e,1\}\ge h/2$ is solvable exactly when $h\le2$, with least solution $e=h/2$. The inequality $1-e^{-e}\ge h/2$ is solvable at a finite $e$ exactly when $h<2$, and solving it gives the displayed logarithm. Both finite-cut functions strictly increase under a coordinatewise increase, so their whole graphs are Pareto. At $h=2$, $1-e^{-e}<1$ at every finite energy. In (iii), $\sin^2 z\ge1/2$ for $z\ge0$ holds exactly on the closed intervals $[\pi/4+k\pi,3\pi/4+k\pi]$, which proves the complete fiber formula. The first interval gives an attained cut strictly increasing in both coordinates. Finally, for the first law in (iv), every point except the upper-right corner has a distinct larger point with the same attained cut; for the second law the sole attained cut is at the lower-left corner and every other point has an equal unattained cut. Formula (L.9.6k.3) proves both frontiers. The scalar lower-cut value is $1-r-s$ and reaches $-1$ only at the upper-right corner, whose bit is zero in the second law. ∎

<a id="proposition-l96m-no-uniform-finite-algorithm-for-the-entire-discontinuous-class"></a>**Proposition L.9.6m (No Uniform Finite Algorithm for the Entire Discontinuous Class).** Even for energy-nondecreasing, right-continuous, bounded response laws on a one-point range--time domain, specified by programs that evaluate the response at every nonnegative rational energy, no always-terminating algorithm decides whether the feasible set is empty. Consequently no always-terminating algorithm returns the complete frontier together with its emptiness decision for that entire presentation class.

*Proof.* Fix $E_0=1$ in the registered energy unit and $q=1/2$. From an arbitrary program $p$ construct a rational-input evaluator as follows: on $E\in\mathbb Q_{\ge0}$, simulate $p$ for $\lfloor E/E_0\rfloor$ steps and return one if it has halted, zero otherwise. Count halting steps starting at one. Every evaluation terminates. If $p$ never halts, its law is identically zero and the feasible set is empty. If it first halts at step $n\ge1$, its real-energy law is exactly $\mathbf1_{\{E\ge nE_0\}}$: bounded, nondecreasing, right-continuous, with a closed feasible set and the singleton frontier at $nE_0$. An emptiness decider would therefore decide halting. Such a decider cannot exist: if $H(p,z)$ decided whether $p$ halts on $z$, the program that on input $p$ loops when $H(p,p)$ says halt and halts otherwise would contradict $H$ on its own code. This proves the first assertion, and the second would imply the first. The conclusion concerns exact global computation from the stated finite presentations; each response evaluation and the structural classification remain valid. ∎

<a id="construction-and-theorem-l96n-source-preserving-finite-causal-apparatus-and-attained-frontier"></a>**Construction and Theorem L.9.6n (Source-Preserving Finite Causal Apparatus and Attained Frontier).** The following augmented finite-use local classical-collision/expectation-stress source preserves the entire original qualified R14 source family and the bounded preparation/record catalogue of Definition 2.6e. On its selected original low word it preserves the paid $18\tau$ meter endpoint and signed difference $1/6$, supplies exact pre-lightcone independence and a complete conserved apparatus stress, and realizes its exact physical energy image, upper-budget feasible set and attained Pareto frontier. The source uses the unchanged pointer, two explicitly registered paid classical copy primitives and a preprepared inertial courier. Its retained-stock horizon is $20\tau$; the construction is finite-use and has no cyclic reset.

The original receipt standard is denoted $e$ here, with $e\tau\ge100\hbar$. Put
 $$
B_R=6978+68\,2^{72}+2^{1332},\qquad B_M=4160+b_{\rm ROM},\qquad mc^2=258e,
\qquad \mathcal E_0=(3B_R+B_M+32434)e+\left(\frac{B_M}{128}+1\right)e.
\tag{L.9.6n.1}
$$
All terms are the actual owned initial stocks specified below. Retention is measured from the original returned forecast at $14\tau$. The entire attained physical initial-energy frontier is
 $$
\mathscr F_{\rm phys}=
\left\{\left(2c\tau x,6\tau,
\mathcal E_0+258e\big[(1-x^2)^{-1/2}-1\big]\right):0\le x\le\frac35\right\}.
\tag{L.9.6n.2}
$$
The proof separately supplies exact-energy fibers, their upper-budget epigraph, observer-current battery debits, the proper-debit service-price convention and every positive scalar optimum, and keeps these resource types distinct.

**1. Exact source, ingress and scope**

Let $e,\tau,\ell$ be the positive standards of Definition 2.6e, with $e\tau\ge100\hbar$; use $e$ for the old receipt unit to avoid confusing it with the new total source-energy budget $\mathcal E$. Keep the three *complete* R14 constituents, their old source presentation and all capacities, the nominal task, all constructor bytes, trees, gates, records, shadows, ROM, supplies and timers. Keep both high cartridges and every source branch. Fix the low word of Proposition L.9.6b: chart $(1,1,1)$, knob $x=0$, returned forecast $j$ selects $P_j$, then two paid identities and the mandatory meter. The old source executes unchanged through its paid $18\tau$ endpoint.

The physical source ingress is the restricted one of Definition 2.6e: (a) the two original source objects have initial states $P_0,P_1$; (b) every complete lifecycle starts with its registered preparation; (c) preparation acts on a fresh zero register and SWAPs with the old data, retaining the displaced input; (d) protocol objects are typed prefixes of these lifecycles and arrows only refine prefixes/projections, never append an extra action. The original executed preparation/program/forecast labels are retained. The abstract initial object name $p_i$ need not have been an old readable record: allocate one of the already paid source-side 256 record bits as an immutable initialization-choice bit i, jointly prepared with the original standard state $P_i$. This bit is source-preparation metadata; it reads no incoming state and adds no protocol action. Projection forgets this added bit and returns exactly the old $P_i$ source; its ready/holding/substrate costs are already in the reserved 256-bit account. The all-input normalized Kraus formula of the meter is retained as well. The additional provider constructed below is a source on this *complete labeled prepared domain*.

The physical spacetime is Minkowski space. The finite graph ports and edge-cost metric $d(u,v)=\ell$ are internal marked addresses of the source's compound body, not Lorentzian coordinates. Initially its three disjoint R14 factors and message factors share one compound material worldline. This is a point-body/internal-fibre constitutive model, at the distributional-source strength permitted in Proposition L.9.6b.

Use a finite source/observation horizon $20\tau$. The original return port becomes available at $14\tau$; the new retention coordinate is the actual elapsed source-frame time

$$
t=T_{\rm read}-14\tau,\qquad4\tau\le t\le6\tau.
$$

The original paid source, its forecast context, its histories and the meter record are retained through $20\tau$. Thus courier flight time is $s=t-4\tau$, while $t$ remains the retention time.

**2. A local bounded clock/driver completion**

The full local source law has the original supplied finite CTMC collision primitives and the original finite quantum pulse primitives. The former are local proper-time kernels on the compound body's worldline. They remain model inputs, exactly as in owners S03 and S11 of Definition 2.4.1g. Each jump has exactly the old finite logical map, shadow/history writes and battery/receiver transfer $(q,z)\mapsto(q-1,z+1)$, preserving $(q+z)e$ pathwise. Proper time equals the old calibrated time throughout the stationary original run, so the complete stopped path law, snapshots and every eligible old response cylinder are unchanged.

For a quantum service branch, retain its exact native Hamiltonian $H(q)$, including the prescribed $\sin^2$ gate pulse, all gap profiles, pointer coupling, actual receipt gaps, and any simultaneous bare terms. There is at most one active quantum pulse. Introduce a classical canonical clock pair $(q,p)$ with autonomous internal energy

$$
K(q,p,\rho)=m_b c^2+f(p)+\operatorname{Tr}[\rho H(q)].
$$

The finite active strip is chosen so that $f(p)=p$, $f'(p)=1$ there; outside it choose a smooth positive bounded extension. For example a smooth cutoff $\chi=1$ on $[900e,1100e]$, zero outside $[800e,1200e]$, gives

$$
f(p)=900e+\int_{900e}^{p}\chi(r)\,dr,
$$

so $800e\le f\le1200e$ and $f=p$ on the active strip. The old $1000e$ operating supply is realized by $p_0=1000e$ and is counted once. The selected low word has four e call receipts, one extra receipt of at most $6e$, empty high cartridges, and a pulse peak below $1.28e$; even retaining a conservative separate $4e$ cartridge operator gives $\sup\|H\|<32e$. Its full finite branch is inside the displayed margin. The $32e$ peak reservation is a service/capacity owner.

The local action, on each actual classical branch, is

$$
S_{\rm loc}=\int p\,dq+\int i\hbar\operatorname{Tr}(\rho_0U^*\,dU)-\int K\,d\sigma,
$$

where $\sigma$ is proper time and $\rho=U\rho_0U^*$. Its equations are

$$
\begin{gathered}
\frac{dq}{d\sigma}=f'(p)=1, \\
\frac{dp}{d\sigma}=-\operatorname{Tr}[\rho\,\partial_qH(q)], \\
i\hbar\frac{d\rho}{d\sigma}=[H(q),\rho].
\end{gathered}
$$

Since $\frac{d\operatorname{Tr}(\rho H)}{d\sigma}=\operatorname{Tr}(\rho\partial_qH)$, the total internal energy is constant. In particular

$$
p(q)=p_0+\operatorname{Tr}(\rho_0H(q_0))-\operatorname{Tr}(\rho(q)H(q)).
$$

The norm bound keeps p strictly within the linear strip, closing the invariant-strip proof. Hence the source executes the **same** waveform at the same old time, not just the same final gate.

The map from an input density to its mean-work $p$ is non-affine, so these equations are applied conditionally on the source label: the complete initialized source label is sampled once—including that added immutable initial-choice bit and the original preparation/program records—and the actual native outcome tree is used. Conditional on each such retained label/history, the finite registered active state is known, and the clock trajectory above is part of that prepared source. At any time its complete state is

$$
\sum_{l,h}\pi_lw(h\mid l)\,|l,h\rangle\langle l,h|\otimes\delta_{p_{lh}(q)}\otimes\rho_{lh}(q).
$$

Here $w(h\mid l)$ is exactly the original Born/CTMC weight; $p_{lh},\rho_{lh}$ are independent of the mixture weights $\pi_l$. This is affine on the complete extended labeled source domain that projects to every original prepared source, including every clock interval readout.

Native computational-pointer reads are performed at the original seams, not deferred past an exposed record. Their pulse has ended; remaining bare data/cartridge, independent receipt and diagonal retained-control terms commute with the pointer projectors. Thus each read preserves average energy. In the selected low word the data and pointer are degenerate, and before the extra receipt raise every outcome has the same bare energy. Its subsequent outcome-dependent gap raising transfers exactly 0 or $6e$ from p to the actual receipt. Therefore the *selected low source* has the same constant total mass on **each** outcome history. This is stronger than the expectation-conservation statement for general catalogued words. The original observed intermediate record/update/test laws survive literally, since neither their Kraus maps, conditioning rule nor execution time changed.

Clock q and its phase/preparation record, the work-buffer carrier and its source calibration are explicit extra provider owners. Native commands and branch control reuse the already owned original decoder/branch ROM; the only added digital ROM is the exactly counted wrapper descriptor and two copy tables below. The state histories used in the proof are determined by the existing native dynamics; no further trajectory table or branch ROM is added. Positive ready/holding prices for every genuinely added owner are registered below. A smooth analog pulse/clock law remains a physical constitutive input, as the old exact pulse/timer calibration already was; the clock is classical.

**3. Complete local stress**

For each body, list every static substrate/stock baseline and each active energy sector once. The local action uses the sum of those baselines and the displayed clock, battery, quantum, receipt and internal interaction energies. Metric variation gives, in units $c=1$,

$$
T_{\rm body}^{\mu\nu}(x)=\int M(\sigma)u^\mu u^\nu\delta^4(x-z(\sigma))\,d\sigma.
$$

The Berry and $p\,dq$ terms are metric-independent; proper-time variation supplies the **whole actual** internal energy coefficient $M$. On every selected low history $M$ is constant. The free worldline variation makes u constant. Distributional integration by parts therefore gives $\partial_\mu T_{\rm body}^{\mu\nu}=0$ between local classical copy events; Section 4 proves conservation at those events as well. The expectation of this tensor has the same property.

The sector coefficients are the actual registered energies: all substrate/ROM/ready stocks; R14 supply and received-energy counters; message work buffer $f(p)$; all retained native receipts; and native interaction $\operatorname{Tr}(\rho H_{\rm pulse})$. Their exchange currents are their computed proper-time derivatives times $u$. The clock and native driven-energy derivatives cancel by the equations above; each original R14 battery/receiver transfer cancels pathwise. A receipt gain is counted once. Storage prices and reservations remain distinct from physical energy unless an explicit supplied energy store realizes them.

The initial source is specified on a finite Cauchy slice and its free prehistory may be extended; as a positive conserved source it is not past-compact.

**4. Inertial courier**

The entire original R14 source of Definition 2.6e remains on its stationary worldline $x=0$, including the original message, meter, pointer, receipt, driver and archive factors. A separate, source-owned classical courier has a degenerate blank payload bit, finite controller/flags/fresh shadows, a one-token charged-copy supply/receiver pair, and positive rest mass m. It is prepared as an initial Cauchy stock, independent of all R14 source labels and randomness, on the inertial worldline

$$
x_C(T)=v(T-18\tau),\qquad0\le v\le v_{\max}=3c/5.
$$

At the initial source-frame slice $T=0$ its actual position is $-18\tau v$, velocity v and physical energy $\gamma(v)mc^2$. This incoming kinetic energy is **part of the owned initial stock**. The courier crosses the stationary source at the already completed original endpoint $T=18\tau$. It then continues on the same inertial worldline. The two atomic classical copies have distributional internal sector powers.

A separately owned stationary receiver, initially independent of the source, is at $r\ge0$. The canonical endpoint protocol sets $r=R$ and receives at the reference time. An inner receiver $r<R$ may copy earlier and retain its result; the continuing courier is not removed from the global source or hidden from its influence radius. The full finite source is the original stationary apparatus plus this incoming courier and receiver, with their actual complete initial energy and subsequent stress.

**Two complete local charged-copy laws**

The first interaction uses the **actual classical pointer label** a of the already executed original seven-outcome meter. Its truth table is

$$
\begin{gathered}
f(\mathrm{high})=f(01\!:\!0)=f(01\!:\!2)=f(12\!:\!0)=f(20\!:\!0)=f(20\!:\!2)=0, \\
f(12\!:\!2)=1.
\end{gathered}
$$

At the common event $T=18\tau$, after the old meter return in the local kernel order, execute the finite reversible classical lookup $(a,y)\mapsto(a,y\mathbin{\mathrm{XOR}}f(a))$, with $y$ the initially blank courier bit. The original pointer remains intact at the source. Supply/receiver counters on the courier exchange $(q_C,z_C)=(1,0)\mapsto(0,1)$, transferring one actual $e$. Its one-call flag, lookup record, receipt and fresh shadow are retained. The complete original pointer/control shadow, under the permutation-extension convention of owner S05 of Definition 2.4.1g, stays in the stationary source. The courier carries $A$, not a copy of $j$ or the whole seven-outcome pointer. More precisely, for each valid original label $a$ its **entire** courier-owned output is $\sigma_{C,f(a)}=|f(a)\rangle\langle f(a)|\otimes\sigma_{C,\mathrm{fixed}}$, where $\sigma_{C,\mathrm{fixed}}$ contains the same charged counter pair $(0,1)$, executed flag 1, success status, constant pickup-command tag, fixed geometry and all remaining blank/retained local cells. Every source-side lookup intermediate containing $a$ and the complete $a$-containing shadow remains at $x=0$. The new full pointer-label ROM is at the source. Thus no courier lookup record, fee flag, timing field or hidden shadow can distinguish two labels with the same $f(a)$. At receiver copy, its complete output is likewise a fixed state indexed only by the incoming binary $y$; duplicating $y$ into its retained local shadow adds no information about $a$ beyond $y$.

At receiver contact execute $(y,b)\mapsto(y,b\mathbin{\mathrm{XOR}}y)$, with b its blank event bit, and its independent charge $(q_T,z_T)=(1,0)\mapsto(0,1)$. Keep y on the courier. The receiver's old control/blank values and new receipt are retained. Each logical core is a permutation; the original fresh-shadow extension makes the full finite charged update reversible on its represented address set. Ready/stock failures have explicit retained labels and identity-or-already-incurred resource updates; a repeated one-call flag returns `already-copied` without generating an unowned fresh output. All rows, including unreachable rows and zero-probability histories, have one normalized classical output kernel. The corresponding quantum operation on the old source is the identity on every untouched quantum factor and a classical controlled permutation on an already measured pointer.

These two copies are **new explicitly registered source-extension primitives**, added to the executable menu of the R14 source of Definition 2.6e. They use the same *model strength* and finite reversible-extension convention as the local atomic charged classical collisions of owners S05, S10 and S11 of Definition 2.4.1g, and their full kernel, stock and local collision law are specified here. The R14 grammar applies its stochastic collision or scheduled controller kernel at an event, with no service duration; likewise the new contacts have zero temporal support in this declared point-body collision model, finite stock, one actual e debit each and finite retained tables/shadows. No instantaneous operation acts across separated spacetime points.

The one-e counter transfer preserves the courier's or receiver's total rest energy. All payload/control/shadow logical levels have equal declared bare energy. Source pointer a and its body energy are unchanged. The local collision law has identity output on each body's translational four-momentum, so every worldline remains inertial and every body's total mass is the same before and after. In the same $c=1$ stress convention, the individual supply/receipt stresses have opposite event currents $\pm e u^\nu\delta_{\rm event}$. For the moving courier the source-frame energy transfer is $\gamma e$, not e; e is its proper internal debit. The total currents cancel, while the delta-supported sector powers remain. Thus the worldline stress has zero distributional divergence at these contacts, by the explicit normalized internal energy-preserving update.

**5. Original-source preservation, including unexecuted alternatives**

The new frontier executes the selected low word only; its source qualification uses the complete original families.

For **every finite original $R_h$**, keep the full original finite carrier and charged kernels on a neutral inertial compound worldline. Its main supply is $(h+3)e$ and its verifier supply is $3e$; every charge is the same pathwise energy-preserving supply/receiver exchange. Its original calibrated three-trigger timer is implemented by a finite-window canonical phase q with $\dot q=1$ and a constant positive clock energy, retaining the original three triggers $0,h\tau/2,h\tau$. A bounded phase circle longer than $(h+1)\tau$ suffices. The timer package has explicit clock/substrate energy and the old operation/maintenance invoices. For $h=0$ the original immediate stop is retained. Each source is finite; no simultaneous infinite inventory over all h is asserted.

Projection to every original coordinate intertwines preparations and each primitive transition exactly. Proper time is the same old clock. Multiplication gives every eligible finite word; the same stopped generator gives every original rational waiting kernel and event-cylinder coefficient; conditioning gives every retained prefix law. Thus every old capacity—including smaller failing capacities—and every old constructor remains physically realized before the original source-relative complexity theorem is invoked. The complexity value eight belongs to the unchanged original constituents and their constructor bytes.

For the **full original bounded catalogue of Definition 2.6e**, use the same provider equations on every finite labeled preparation/action/outcome branch, including the words not selected here. Its executed ingress is the two standard $P_0/P_1$ source objects and its finite named preparation catalogue. Its source records expose the preparation/program labels; prefix/projection arrows never add an unknown active-input ingress. A displaced input is retained; the original incoming state is known from the complete source label.

The full catalogue has at most four fee energies $4e$, a maximal extra meter receipt $9e$, even both cartridge gap operators totaling $7e$, and one active pulse of norm below $1.28e$. A uniform $32e$ bound is sufficient on the explicitly degenerate scratch and ROM completion. Negative beam generators need the symmetric bound rather than the selected low word's positivity; initial offsets are retained. At native pointer-read seams the boundary Hamiltonian commutes with the pointer projectors, so average energy is conserved; between seams each conditional branch has constant energy. For the full high catalogue these are not the same as pathwise conservation across every read. If $\Delta_j$ is the conditional bare-energy jump at a read while p is unchanged, the exact branch identity is $p=p_0+\operatorname{Tr}(\rho_0H_0)-\operatorname{Tr}(\rho H)+\sum_j\Delta_j$. There are at most two ordinary measured actions and one terminal high/low seam with a nonzero high-cartridge energy jump; each has $|\Delta_j|\le4e$. The subsequent low spectral meter read is degenerate and adds no such jump. All fee receipts and earlier control energies are fixed on the history. Hence the conservative bound is $|p-p_0|\le32e+32e+12e=76e$; for the actual initial $P_0/P_1$ preparations $E_{\rm initial}=0$, giving $p\in[956e,1044e]$. The $[900e,1100e]$ strip therefore contains every full-catalogue branch even after the accumulated seam corrections. The body is stationary, so the same complete expectation stress is conserved on all original catalogued words. The selected low word has the stronger per-history constant mass used here.

Every originally exposed intermediate record and test is performed at its original time with its original kernel; no deferred-read equivalence is needed. Joint source/clock responses are affine mixtures over actual retained source labels and returned histories, not sharp ensemble means. Under $D_g$, state and Hamiltonian conjugate together, leaving all provider-energy traces invariant. On low words the high cartridge remains empty and adds no clock leak. All old marked source/dressing comparisons therefore survive.

After $18\tau$ the new wrapper only reads/copies the actual classical endpoint and retains all stocks. It never feeds back to the qualifying run. Projection forgets only added spatial/provider/courier/receiver coordinates and extra wrapper records; on all old states, labels, operators, receipts, times and admissible prefix/refinement responses it is identity. The full R14 family and the full catalogue of Definition 2.6e have physical embeddings; only the selected low word is followed by this particular courier experiment.

**6. Complete finite inventory and actual price/energy map**

All original resources are retained; none is replaced by the courier bit.

Let

$$
\begin{gathered}
B_R=6978+68\cdot2^{72}+2^{1332}, \\
B_M=4160+b_{\rm ROM},
\end{gathered}
$$

where $b_{\rm ROM}$ is the old exact canonical message-decoder ROM length. Keep every original R14 preparation and $[0,14\tau]$ resource invoice, all $60e$ allocated main/verifier supplies and their actual random consumed law, all original timers, and the old message's 4096 classical bits, 64 qubits, ROM, $1000e$ operating work, $32e$ peak reservation, displaced input/purifier stocks, mandatory fee and extra-meter receipts.

The original extra holding invoice to $18\tau$ remains $12B_R+12$ resource credits. The new finite-use wrapper actually prepays two more $\tau$ of capacity: $6B_R+6$ credits for the three original constituents/timer packages and $2B_M$ credits for the original message. Its clock/ROM/receiver/courier stocks are also owned and held through $20\tau$. Courier proper time in that interval is at most the prepaid capacity; unused prepaid capacity is not refunded. This is an explicitly fixed finite service.

The canonical wrapper descriptor is the single JSON line below. Its UTF-8 bytes, counted without a terminating newline, code-fence bytes or surrounding text, number 2,672, hence **21,376 new descriptor ROM bits**; their SHA-256 digest is

`5c4ac6179f374b54737b5becd74afa52984466b50b2f72b52e6a7af3a3ad289f`.

The surrounding exposition is not additional executed ROM.

```json
{"analog_packages":{"capacity_credits_per_slot_each":1,"digital_bits":0,"finite_classical_coordinates_not_finite_distinguishable_codes":true,"names":["velocity","receiver_position","reference_time"],"ready_credits_each":1,"rest_units_each":1},"baseline_units_per_bit_or_qubit":1,"clock":{"cutoff_support_units":[800,1200],"initial_work_units":1000,"linear_strip_units":[900,1100],"phase_capacity_credits_per_slot_each":1,"phase_mount_rest_units_each":1,"phase_packages":2,"phase_ready_credits_each":1,"provider_domain":"complete original labeled prepared lifecycle","receiver_clock_energy_units":1},"constituents":3,"courier":{"acceleration":false,"ballast":false,"bits":256,"initial_context_independent":true,"initial_worldline":"x(T)=v*(T-18*tau)","mount_rest_units":1,"original_pointer_retained_at_source":true,"pickup":"local charged classical event copy","pickup_full_pointer_shadow_owner":"stationary source","pickup_slot":18,"pickup_supply_units":1,"speed_limit_c":[3,5]},"energy_formula":"Ebase+m*c^2*((1-v^2/c^2)^(-1/2)-1)","energy_type":"complete physical initial Cauchy stock energy, not consumed work","forecast_return_slot":14,"message":{"actions":["paid-identity","paid-identity"],"chart":[1,1,1],"entire_original_module_stays_at_source":true,"knob":0,"preparations":["P0","P1"],"terminal":"original seven-outcome cost meter"},"native_copy_rom_bits":{"pickup_at_source":4608,"receiver":4608},"new_capacity_credit_per_bit_slot":1,"new_ready_credit_per_bit":1,"original_source":"R14-ByteExact-StackSemantics-v2 + Foundations-2.6e","original_timer_package":{"clock_energy_units":[1,2],"substrate_units":[1,2],"total_units":1},"outside_scope":["cyclic reset","unknown active-input clock channel","finite-duration smooth microscopic collision","Einstein/AQFT/KMS theorem","strict PCE/Born anomaly"],"preflight_energy_realization":{"gap":"C_stock=(B_M/128+1)*e","is_added_physical_realization_not_price_identity":true,"joint_energy_counted_once":true,"owners":["supplier-battery","retained-preflight-receipt"]},"range_type":"outermost context-bearing radius at reference time; courier is not hidden after an inner receiver copy","receiver":{"bits":256,"copy":"local charged classical bit copy","copy_supply_units":1,"mount_rest_units":1,"position":"r<=R; canonical r=R","stop_or_absorb_courier":false},"retained_capacity_slots":20,"retention_type":"source-frame reference time minus original forecast return at14*tau","source_extra_bits":256,"source_pickup_fixture_rest_units":1,"source_program":"00001111","source_run_slots":18,"truth_table":{"01:0":0,"01:2":0,"12:0":0,"12:2":1,"20:0":0,"20:2":0,"high":0},"version":"L08-Inertial-Classical-Courier-v2-candidate"}
```

It adds exactly 768 reserved digital bits: 256 source-side copy/preflight/controller records, 256 courier bits and 256 receiver bits. Its lookup table and flags are explicit. It reuses the old native finite decoder and all old ROM owners; this descriptor length is not substituted for the old full hardware complexity. In addition, both complete native copy lookup tables are physically supplied: each has 512 rows of 9 output bits, hence 4608 ROM bits. One table remains at the source and the other at the receiver. The added digital stock is therefore 31360 bits: 768 mutable/record bits, 9216 native-table ROM bits and 21376 descriptor ROM bits. Each new digital bit has a one-credit ready price and a one-credit-per-$\tau$ capacity price; its fixed $20\tau$ ready-plus-holding invoice is **658560 credits**.

There are separately **three analog calibration packages** for velocity, receiver position and reference time, and **two phase packages** for the new pulse-driver realization and receiver clock. Each has one-credit ready cost and one-credit-per-$\tau$ capacity cost, so their extra ready/$20\tau$ holding invoice is 105 credits. These finite classical coordinates are continuous, not finitely many distinguishable digital codes; their exact values/phase calibration are independently supplied constitutive initial data, as were the original exact time/energy standards. Their physical baseline energies are separately counted below. The original R14 timer packages remain separately present and priced by their old source accounts.

**One fully populated positive baseline instance**

Choose common scalar rest baselines e per original or added digital bit/qubit/ROM address; they do not change logical gaps, pulse generators or old empty-receipt-zero work observables. Original R14 timer packages have total energy e each, explicitly split as a constant e/2 clock energy and e/2 substrate. The new source pulse clock uses the **existing** $1000e$ reservoir once plus its one-e phase mount. The receiver has a one-e clock energy and one-e phase mount in addition to its one-e copy supply and one-e body mount. The source pickup fixture and three analog calibration packages each have a one-e baseline. The $32e$ peak reservation remains a service/capacity owner and stores no energy.

The preflight invoice $C_{\rm stock}=(B_M/128+1)e$ of (2.6f.6) is a price; this completion explicitly supplies a two-level supplier battery/retained-receipt pair with common gap $C_{\rm stock}$ and fixed total occupation one. Its local preflight charge transfers the occupation and the actual completed receipt remains at the source. This is an **added physical realization of the existing preflight service**, counted once. Its record and two cells fit the source-side reserved bits. All other purely resource-credit tariffs retain their separate price type; they are not inserted into gravity as heat.

On the explicit zero-logical-drift completion of old information/ancillary addresses just described, with every address's positive substrate already counted, the actual masses are

$$
\begin{gathered}
mc^2=258e, \\
M_Tc^2=4870e, \\
M_Sc^2=(3B_R+B_M+21376+5930)e+C_{\rm stock}.
\end{gathered}
$$

The courier's $258e$ is 256 bit baselines, its actual one-e pickup supply and its one-e mount. The receiver's $4870e$ is 256 bits plus 4608 lookup-ROM bits, its operation supply, clock energy, phase mount, body mount, and two position/reference-time calibration baselines. Source constant $5930e$ is 256 extra records plus 4608 pickup-ROM bits, the original $1000e$ message supply, $60e$ R14 supplies, three original timer packages, one new pulse-clock mount, one pickup fixture and one velocity-calibration baseline. This is an explicit choice of all previously unspecified bare ancillary Hamiltonians as degenerate, with their positive physical substrate energies given, while every old specified energetic term remains unchanged.

The complete ready source's physical initial energy at $v=0$ is therefore the populated finite value

$$
\mathcal E_0=[3B_R+B_M+32434]e+C_{\rm stock}.
$$

At general v the actual total initial Cauchy stock is

$$
\mathcal E(v)=\mathcal E_0+mc^2[\gamma(v)-1].
$$

It is the integral of the complete action/collision source's $T^{00}$ on its initial Cauchy slice. The courier's incoming energy $\gamma mc^2$ is counted once; the rest of the apparatus is stationary. Actual-energy feasibility and an upper bound on the available energy budget are distinguished explicitly below.

**Actual consumed work and resource-priced costs remain distinct**

Let N be the unchanged stopped collision count of one R14 copy. Its exact mean is

$$
\mu=\sum_{k=0}^{13}a_k\left[1-\exp(-42)\sum_{r=0}^{k}\frac{42^r}{r!}\right]
$$

$$
=\frac{6332206}{531441}-\frac{451637768435228233868}{1899901575}\exp(-42)
$$

$$
\approx11.915162600109881744,
$$

where $a_k$ is the original direction-walk survival mass after k jumps before reaching level 6. The tail-sum proof uses the original independent rate $3/\tau$ Poisson count and stopped 14-jump/deadline law. The original 14-jump first-passage value remains 828608/1594323.

The three R14 copies consume exactly their old random e charge per collision, three scheduled controllers and three verifiers each. The original message still consumes four e fees plus its actual $0$ or $6e$ extra-meter receipt, with expectation $6e$. The two new copies consume exactly $2e$. Thus the sum of proper internal debits is

$$
W_{\rm proper}=e(3\mu+26)\approx61.745487800329645232e,
$$

independent of v. This is an invariant per-service price convention, distinct from the source-frame energy-current account. In the one common source-frame observer convention, the courier's e transfer has energy $\gamma e$, whereas all other transfers occur at rest. Consequently

$W_{\rm lab}(v)=e(3\mu+25+\gamma(v))=W_{\rm proper}+e[\gamma(v)-1]$. Add the separately physically realized preflight debit $C_{\rm stock}$, the actual inherited preparation service and the registered positive resource-credit scalarization **with their original types**. The full random law, not only its expectation, remains the three stopped source histories, the tagged native meter outcome and two deterministic copy receipts.

These operational battery debits are internal supply-to-receipt transfers, not net external signed work on the complete closed source: they cancel in the total stress. The courier's kinetic energy is not consumed during these inertial copies; it remains in its owned outgoing motion. Consequently the initial-energy and consumed-work frontiers are related by the affine map below, not by an additive constant. The priced *initial-stock* invoice, if it prices each unit of provided kinetic stock at one energy unit, has the same R-dependent cut up to its independently fixed nonkinetic price baseline. The source-frame operation-energy frontier has the same range/retention geometry but a different normalization: on the minimally stocked apparatus $W_{\rm lab}=W_{\rm proper}+(\mathcal E-\mathcal E_0)/258$. The sum-of-proper-debits service-price frontier instead collapses to the joint largest admitted range/retention at the same $W_{\rm proper}$. These distinct observer/resource conventions are part of the source-to-cost join, not omitted costs.

**7. Actual endpoint, pre-lightcone independence and global radius**

The old j port is fair including failed source paths. Its unchanged meter has $p(A\mid0)=0$, $p(A\mid1)=1/6$. The two deterministic conditional copies therefore give exactly the same receiver event probabilities after receipt. Both the source pointer and the courier bit are retained; no postselection or reset occurs. The original seven-outcome pointer TV is $1/3$ and the full source records can distinguish j perfectly at $x=0$. The new courier bit's total variation is $1/6$.

Before pickup the entire courier is independent of j. Before local receiver contact the receiver is independent of j. No source-to-courier or courier-to-receiver operation acts at spacelike separation; the copied bit moves along a timelike worldline. The complete neutral apparatus stress is independent of j because all total body masses, initial positions, velocities and the two charged-copy total energies are independent of j. There are no electromagnetic source fields in this constitutive neutral model. Thus the construction proves exact operational pre-lightcone context-independence for the declared target interface; the before-contact statement concerns this isolated receiver.

The source context is retained from its original forecast return at $14\tau$. At reference time $T=14\tau+t$, $t\in[4\tau,6\tau]$, courier position is

$$
R=v(t-4\tau).
$$

**R is the outermost context-bearing radius.** The original full source stays at 0, the continuing courier carrying the actual A record is at $R$, and any receiver that copied earlier lies at $r\le R$. The courier cannot be hidden when computing Definition L.9.3's supremum. For $0<q\le1/6$ its actual bit event crosses threshold at $R$; no context-bearing source factor or local endpoint lies at a larger radius in this registered apparatus. This supplies the exhaustion certificate. At $R=0$ the stationary courier and receiver can copy locally at $18\tau$ and retain their records until any allowed reference time, so the point $(0,6\tau)$ is actually available.

For canonical receiver placement $r=R>0$, copy occurs at the reference time itself. Earlier delivery at an inner receiver is allowed and fully retained; it does not change the global relation $R=v(t-4\tau)$ or lower the initial energy at a given global radius. Initial ready-stock placement and calibration are supplied before the context port is returned and independent of j.

**8. Exact physical feasible set and attained frontier**

Fix the original locked endpoint and threshold $0<q\le1/6$, for example $q=1/12$. For a registered ready protocol the actual signed endpoint difference is exactly $+1/6$ once the physical receiver has copied, and zero beforehand. This is the actual response law. On a triple with no admissible ready source, no executed physical channel is claimed. If a total optimization function is desired, define $\Delta(R,t;\mathcal E)$ as the supremum of attained locked endpoint differences among the declared protocols at that actual global radius and retention whose physical initial energy is at most the upper budget $\mathcal E$, and give its **empty-set value 0**. This **budget-response** extension is an administrative convention outside the source domain; on exact physical source energies the image below applies.

The exact actual-energy image is the continuous image of the compact physical parameter rectangle: $\Phi(v,t)=(v(t-4\tau),t,\mathcal E_0+mc^2[\gamma(v)-1])$, with $0\le v\le3c/5$ and $4\tau\le t\le6\tau$. Accordingly its exact energy fibers are singleton $\{\mathcal E_{\rm cut}(R,t)\}$ at every allowed point with $t>4\tau$, the interval $[\mathcal E_0,\mathcal E_0+mc^2/4]$ at the corner $t=4\tau,R=0$ (different incoming velocities have not yet separated spatially), and empty outside the kinematic domain.

The corresponding **upper-budget threshold-feasible set** is exactly

$$
\begin{gathered}
4\tau\le t\le6\tau, \\
0\le R\le(3c/5)(t-4\tau), \\
\mathcal E\ge\mathcal E_0+mc^2\left[\left(1-\frac{R^2}{c^2(t-4\tau)^2}\right)^{-1/2}-1\right],
\end{gathered}
$$

with the endpoint convention $t=4\tau\Rightarrow R=0$ and the bracket zero. Necessity follows from the actual inertial courier radius, mandatory fixed stock and its energy $\gamma mc^2$. Sufficiency is the unchanged source run, two explicit local copies and the canonical receiver placement, whose actual energy is at most the given budget. No extra unused-energy carrier is needed or postulated. This exhausts the registered class: it has exactly one preprepared inertial courier, mandatory fixed finite inventory and no reset, alternate faster carrier or unowned supply.

The exact actual-energy image and the budget-feasible set have the same complete attained Pareto frontier, preferring larger R,t and smaller **physical initial energy or its upper budget**, namely

$$
\left\{\left(R,6\tau,\mathcal E_0+mc^2\left[\left(1-\frac{R^2}{4c^2\tau^2}\right)^{-1/2}-1\right]\right):0\le R\le6c\tau/5\right\}.
$$

Every point is actually attained. For $t<6\tau$ the same R at $6\tau$ is feasible with no greater energy and strictly greater retention. A budget strictly above the attained cut is dominated by lowering the allowed budget to that cut. In the exact actual-energy image, the nonminimal-energy corner protocols are dominated by the stationary courier at $t=6\tau$. At $t=6\tau$ the cut is strictly increasing in $R$>0, so no larger R with no greater energy can dominate a graph point. This also covers $R=0$ and includes the maximum-speed endpoint:$\gamma(3c/5)=5/4$, $R_{\max}=6c\tau/5$ and its actual kinetic increment is $mc^2/4=129e/2$.

The front is one-dimensional because retention capacity is prepaid and bounded through $20\tau$. That dimension is a consequence of the source contract. For the actual **source-frame operational-battery-debit** objective the attained frontier is the same graph with energy coordinate $W_{\rm proper}+e\left[\left(1-\frac{R^2}{4c^2\tau^2}\right)^{-1/2}-1\right]$; the courier contributes its proper debit boosted by $\gamma$. For the separately declared **sum-of-proper-debits service-price** objective, every protocol has the same $W_{\rm proper}$, so its frontier is the single attained point $(6c\tau/5,6\tau,W_{\rm proper})$ (plus separately fixed price offsets). A resource-priced *initial-stock* convention differs from the physical initial-energy front by its exact registered fixed nonkinetic baseline. These statements keep reserve, observer-current work, invariant service prices, preflight energy and resource tariffs distinct.

For $q>1/6$ no positive-radius courier/receiver endpoint crosses this locked threshold. Other source observables at $x=0$ retain their original laws.

**9. Branch scope and declared source admission**

Theorem L.9(i)–(ii) uses the complete actual clock/driver/counter/body source and its conserved distributional or expectation stress, with every boundary flux and initial stock owned. Theorem L.9(iii)'s exact pre-lightcone condition is proved by the local contact/worldline factorization. Endpoint-complete forcing and finite-window zero-error exclusion keep the extra hypotheses of Theorem L.9(iii).

The map $j\mapsto P_j$ is bounded and Lipschitz on the two-point discrete context set; it has no feedback into the original qualifying source. Theorem L.9(iv)–(v)'s compact PCE map class and strict-improvement condition remain separate branches.

Source admission: this augmented source registers the two fully specified local copy kernels as new extension leaves at the inherited charged-classical-collision model strength, with their exact kernels, charges, shadows, stock, normalized failure laws, unchanged original source interfaces and common stress. This establishes the source-preserving finite-use realization on the displayed augmented local-collision/expectation-stress branch.

**Finite native-copy census**

Both full physical lookup tables are specified, including every failure row. An input $x$ has 9 bits: pointer/control label $a[3]$, target $y[1]$, supply $q[1]$, receipt $z[1]$, one-call flag $d[1]$, and old status[2]. Pointer code 7 is invalid for pickup; codes $\ge2$ are invalid for receiver's padded binary input. If $d=1$ return `already-copied`; if the supply pair is not $(1,0)$, return `insufficient-stock`; otherwise consume the one $e$ charge, set $d=1$ and either return `invalid-label` or XOR the stated $f(a)$. The full control label $a$ is unchanged and $q+z$ is unchanged in all 512 rows. Old status and every overwritten control field are retained in the fresh shadow. A nonfresh-shadow request is outside the ready service and has a normalized identity/rejection response, not an asserted energy-conserving use of a corrupted work register.

The supplied $9\to9$ table F has the full logical permutation extension $(x,h)\mapsto(h\mathbin{\mathrm{XOR}}F(x),x)$ on 18 bits. Exhaustive verification checks all 262144 permutation states for bijectivity and all 512 F rows for pointer/counter-energy preservation. The physical charged service uses $h=0$, as the original fresh-shadow source convention requires, and energy preservation is proved for that service. Source/courier/receiver placement of main and shadow coordinates is as specified above. For exact byte reconstruction, the displayed field order is most-significant to least-significant bit. Pickup control codes 0 through 6 mean high,01:0,01:2,12:0,12:2,20:0,20:2, respectively. Status codes 0,1,2,3 mean success,invalid-label,insufficient-stock,already-copied. Enumerate input rows $x=0$ through 511 in increasing numeric order; concatenate each nine-bit output in most-significant-bit-first order, then split the resulting 4608-bit stream into 576 consecutive bytes, each most-significant-bit first. These conventions and the preceding case distinction determine both tables completely; the proof text is not additional executed ROM. Each serialized table has 576 bytes, with SHA-256 digests

- pickup table: `e34414ebb573c18b81df5e34ee382393fd05c1c77a3b79869849c3956c701c51`;
- receiver table: `41c5831d7fd090982b2af2ecda1c7e8b3409849c60e4c8f218c484c9590c5206`.

For the old post-measurement source state $\rho=\sum_a|a\rangle\langle a|\otimes\sigma_a$, the pickup maps it to the same block $\sigma_a$ tensored with its actual classical copy/shadow. Tracing all new wrapper factors gives exactly the old $\rho$, including every conditional quantum/reference correlation. This proves preservation of the full committed pointer/source state. At the receiver the copied courier bit is already classical and the same argument applies. Both shadows remain paid, retained and causally located.

**Source-energy normalization**

The kinetic formula is derived from the same material source. For an inertial body, the proper-time action gives $p^\mu=mu^\mu$; along $x=vT$, $d\sigma=dT\sqrt{1-v^2/c^2}$. Hence the initial energy $cp^0=\gamma mc^2$, and its increment relative to the identical ready body at rest is $mc^2(\gamma-1)$. Every physical energy budget above is the integral of these actual mass/clock/internal-source terms on one common Cauchy slice. A source-energy variable normalized to exclude the fixed nonkinetic ready inventory is $\mathcal E-\mathcal E_0$; that translation is exact. It is distinct from the source-frame operation energy $W_{\rm lab}$ and from the sum of proper debits $W_{\rm proper}$.

The clock, copy and stress arguments are derived here from the native source model of Definitions 2.4.1g and 2.6e.

**Attained scalar optimum on this same actual source**

For positive scalarization weights $\alpha,\beta,\eta$, minimize $\eta\mathcal E-\alpha R-\beta t$ on the exact physical source image or its upper-budget closure. Dominance puts every minimizer on the proved frontier, so $t=6\tau$ and the energy is the attained cut. Write $x=R/(2c\tau)$ and $K=2\tau\alpha/(\eta mc)$. The reduced derivative is

$$
\frac{\eta mc}{2\tau}\frac{x}{(1-x^2)^{3/2}}-\alpha.
$$

The ratio $\frac{x}{(1-x^2)^{3/2}}$ is strictly increasing on $[0,3/5]$, with endpoint values 0 and $75/64$. Therefore the unique optimum is $x=3/5$ when $K\ge75/64$; otherwise it is the unique $x\in(0,3/5)$ satisfying

$$
K^2(1-x^2)^3=x^2.
$$

This unique root, together with $t=6\tau$ and the displayed energy cut, is the exact attained optimizer for every positive weight triple. Monotonicity or its equivalent unique cubic root in $y=x^2$ gives finite-precision isolation to any requested tolerance. The scalar weights are registered external objective weights on the constructed apparatus class. The source-frame battery-debit objective has the same calculation with the kinetic energy scale $mc^2$ replaced by e, while the proper-debit tariff objective selects the largest admitted R and t.

## **L.10 Internal Consistency and Theoretical Validation**

### **Theorem L.10 (Conditional Compatibility Checklist for the Dual-Channel Framework)**

Assume one nonempty branch simultaneously satisfies the hypotheses of Corollary L.2.1, Theorems L.3 and L.6--L.8, Theorem B.5, Theorems 39, 39a, and 39c at their distinct scopes, and Propositions L.9.3--L.9.5, with common units, source ownership, and overlap maps. Then the supplied electromagnetic and gravitational mechanisms satisfy the following compatibility checklist:

(a) GR Compatibility: Gravitational time dilation (Theorem L.3) follows from weak-field Einstein equations with standard stress-energy source $T_{\mu\nu}^{(\text{MPU})}$ (Definition B.8).

(b) QED Compatibility: AC Stark shift (Corollary L.2.1) follows from standard time-dependent perturbation theory applied to dipole coupling Hamiltonian.

(c) Energy Conservation: Theorem L.6 gives $P_{\text{agg}}=\dot E_{\text{stored}}^{\mathcal V}+P_{\text{EM}}^{\text{out}}+P_{\text{heat}}^{\text{out}}+P_{\text{mech}}^{\text{out}}$ for the registered control volume and disjoint boundary channels, with each physical component contributing exactly once to the complete stress-energy tensor $T_{\mu\nu}^{(\text{MPU})}$ (Definition B.8). Covariant conservation $\nabla^\mu T_{\mu\nu}^{(\text{MPU})}=0$ follows on the regular branch of Theorem B.5, distributionally and, on its smooth on-shell subbranch, pointwise.

(d) Conditional thermodynamic compatibility: Given independently specified carrier stress-energy, the local-equilibrium horizon hypotheses, the saturated/calibrated area-law branch, the Unruh temperature, the Clausius relation, and covariant source conservation, Theorem L.7 reproduces the Einstein equation with the aggregate tensor as source. It does not derive either carrier.

(e) Conditional temporal-wave representation: If the common cycle-rate modulation and the separate high-frequency electromagnetic and low-frequency gravitational response hypotheses of Theorem L.8 are jointly supplied, the two responses can be represented as frequency sectors of that modulation. This is a branch compatibility statement, not a derivation of the carriers from one scalar field.

(f) Endpoint, zero-error, and causal scope: On the branch independently satisfying $\alpha_{CC,\max}<0.5$, Theorem 39 excludes endpoint-complete forcing of both outcomes of every binary coarse-graining. Finite-window zero-error exclusion additionally requires the regularity hypotheses of Theorem 39a. Exact operational causality is supplied only on the pre-lightcone context-independence branch of Theorem 39c.

(g) Spatiotemporal Bounds: Propositions L.9.3–L.9.5 give threshold, duration and energy-range-time bounds on their registered response branches. A finite global spatial extent additionally requires exhaustion of all admitted endpoints and regions beyond the branch threshold; the inverse-rate duration requires a positive decay rate and nonzero initial correlation. These conditions do not follow from the influence-region definition alone.

*Proof.* Fix a branch on which the hypotheses of Theorems L.3, L.6-L.8, B.5, 39, 39a, 39c, and Propositions L.9.3-L.9.5 are simultaneously satisfied. Clauses (a)-(e) then follow by direct substitution of the common stress-energy, perturbative, and thermodynamic data into the cited conclusions. Clause (f) has the three distinct scopes stated above. Clause (g) follows only with the registered response, energy, and duration ledgers of Propositions L.9.3-L.9.5. Hence (a)-(g) form a conditionally compatible checklist on the common branch. The cited results alone do not prove that this branch is nonempty; existence of a joint realization remains an additional hypothesis. ∎

### **Theorem L.11 (Conditional Electron-Scale Coupling-Ratio Evaluation)**

Fix the Appendix Z scheme-specific electromagnetic core and its stated interface inputs, the Appendix E gravitational calibration branch, and the externally normalized electron mass. The following is then a dimensionless electron-scale evaluation; it is not an aggregate carrier-response ratio. The bare Appendix Z coupling is $u^*=8^{1/24}-1\approx0.0905$, which its conditional Ward map converts to

$$ \alpha_{\text{em}}(\text{bulk}) = \frac{u^*}{4\pi} \approx \frac{1}{138.843} \tag{L.81a} $$

Including the registered interface-response and $SU(2)$ transport inputs, Appendix Z gives the scheme-specified sinc-core candidate $\alpha^{-1}_{0}=137.03609205522863\ldots$ (Theorem Z.26). The physical comparison identity is $\alpha^{-1}=\alpha^{-1}_{0}+R_\alpha$ only after a complete remainder certificate is supplied. The diagnostic hypercharge-recoil construction gives $R_{\alpha}^{YR\perp}=-0.00009287769839723537\ldots$ and $\alpha^{-1}_{\mathrm{cand}}=137.03599917753023\ldots$; Corollary Z.27.11k.21.1 records that candidate, while its operator-realization and source-exhaustion gates remain open. The electromagnetic fine structure constant in standard form is:

$$ \alpha_{\text{em}} = \frac{e^2}{4\pi\epsilon_{\mathrm{vac}}\hbar c} \tag{L.81b} $$

From Appendix E (Equation E.9), the gravitational constant is:

$$ G = \frac{\eta\delta^2 c^3}{4\hbar\chi C_{\text{max}}} \tag{L.82} $$

where $\delta$ is MPU spacing, $\eta$ is geometric packing factor, $\chi$ is channel correlation factor, and $C_{\text{max}}$ is ND-RID capacity.

The gravitational fine structure constant for mass $m$ is:

$$ \alpha_{\text{grav}} = \frac{Gm^2}{\hbar c} = \frac{\eta\delta^2 m^2c^2}{4\hbar^2\chi C_{\text{max}}} \tag{L.83} $$

For electron mass $m_e$:

$$ \alpha_{\text{grav}}^{(e)} = \frac{Gm_e^2}{\hbar c} \approx 1.75 \times 10^{-45} \tag{L.84} $$

The ratio at the MPU operational scale is:

$$ \frac{\alpha_{\text{em}}(\text{MPU})}{\alpha_{\text{grav}}^{(e)}} \approx \frac{7.2 \times 10^{-3}}{1.75 \times 10^{-45}} \approx 4.1 \times 10^{42} \tag{L.85} $$

The order-$10^{43}$ value is the arithmetic ratio of the supplied electron-scale electromagnetic and gravitational couplings on this branch.

The dimensionless electron-scale ratio does not by itself determine an aggregate field-response ratio. From Equations (L.81b) and (L.83),
$$
\frac{\alpha_{em}}{\alpha_{\mathrm{grav}}^{(m)}}
=\alpha_{em}\frac{4\hbar^2\chi C_{\max}}
{\eta\delta^2m^2c^2}.
$$
For $m=m_e$ and the numerical values displayed above, this is approximately $4.1\times10^{42}$. An aggregate ratio has the conditional form
$$
\mathcal R_{\mathrm{agg}}
=\frac{\alpha_{em}}{\alpha_{\mathrm{grav}}^{(e)}}\eta_{impl},
$$
where $\eta_{impl}$ must be computed independently from a specified geometry, field solution, target response, detuning, and likelihood. ∎

## **L.11 Physical Mechanism Details: AC Stark Implementation**

This section provides detailed implementation of the AC Stark mechanism introduced in Theorem L.2 and Corollary L.2.1 for the coherent-charge carrier analyzed in Proposition L.4.

## **L.11.1 Coherent Dipole Radiation Mechanism**

Assume a registered electromagnetic-source branch on which $\mathcal M(\text{context}_S(t))$ controls a conserved current $J^\mu$ with a nonzero time-dependent radiating multipole. Solving Maxwell's equations with the stated geometry and boundary conditions then defines $\vec E_{\text{rad}}(t)$ and its frequency, amplitude, phase, and polarization. The existence and normalization of this current are implementation data, not consequences of Theorem L.1.

On the registered interaction-clock branch, assume $\tau_{\mathrm{int}}\ge\tau_{\min}>0$. The dispersive dipole approximation in a suitable interaction picture is
$$
H_{\mathrm{int}}(t)\approx
\frac{\hbar}{2}\delta_{\mathrm{Stark}}(t)\sigma_z.
\tag{L.86}
$$
For frozen parameters on the two-level rotating-wave branch, the signed transition-frequency shift is
$$
\delta_{\mathrm{Stark}}
=\frac{|\Omega_R|^2}{2\Delta}
+O\!\left(\frac{|\Omega_R|^4}{|\Delta|^3}\right),
\qquad
\Omega_R=\frac{|\mathbf d_{\mathrm{TLS}}\cdot\boldsymbol\epsilon_{\mathrm{rad}}|E_0}{\hbar},
\qquad
\Delta=\omega_{\mathrm{TLS}}-\omega_{\mathrm{rad}}.
\tag{L.87}
$$
Indeed, the rotating-frame eigenvalue separation is $\sqrt{\Delta^2+|\Omega_R|^2}$; its expansion about nonzero $\Delta$, with the detuning sign retained, gives (L.87).

The instantaneous spectral expansion remains uniform for varying parameters when $|\Delta|\ge\Delta_{\min}>0$ and $|\Omega_R/\Delta|$ is uniformly small. Using it as the dynamical Hamiltonian (L.86) additionally requires a rotating-wave and adiabatic-elimination certificate over the complete interaction interval. That certificate must control the time-dependent dressed-basis term $-i\hbar W^\dagger\dot W$, including any omitted geometric phase, and other discarded terms. For example, a registered effective-frame Hermitian remainder $R(t)$ with $\int_0^{\tau_{\mathrm{int}}}\|R(t)\|\,dt/\hbar\le\varepsilon_{\mathrm{dyn}}$ bounds the propagator error by $\varepsilon_{\mathrm{dyn}}$ through Duhamel's formula and unitary norm preservation. The inequality $|\Delta|\gg\max\{|\Omega_R|,\Gamma\}$ alone does not control these time-variation errors.
The operator
$$
\sigma_z=|e\rangle\langle e|-|g\rangle\langle g|
$$
is the population-difference observable; the two spectral projectors are $|e\rangle\langle e|$ and $|g\rangle\langle g|$.

## **L.11.2 Open System Dynamics and Rate Modulation**

The 'Evolve' process for the target MPU is described by a master equation for its density matrix $\rho$ (the Lindblad equation below):

$$ \dot{\rho} = -\frac{i}{\hbar}[H_{\text{TLS}} + H_{\text{int}}(t),\rho] + \sum_k \gamma_k^{(0)}\mathcal{L}_k[\rho] \tag{L.88} $$

Here $H_{\mathrm{TLS}}$ is the intrinsic TLS Hamiltonian and $\mathcal L_k$ are the baseline Lindblad superoperators with rates $\gamma_k^{(0)}$. Equation (L.86) gives energy-level shifts $\pm\hbar\delta_{\mathrm{Stark}}(t)/2$, so their separation changes by $\hbar\delta_{\mathrm{Stark}}(t)$. A measured bath or jump-operator response may convert that spacing change into modulated effective rates. Such a response requires its own generator certificate; changing the Hamiltonian in (L.88) while keeping every rate and jump operator constant does not itself modulate those dissipative terms.

For a registered finite positive reference amplitude $0<E_{\mathrm{max}}<\infty$ with $|E_0(t)|\le E_{\mathrm{max}}$ throughout the control window, define
$$
\Phi_S(t)=\frac{E_0(t)^2}{E_{\mathrm{max}}^2},
\qquad 0\le\Phi_S(t)\le1.
\tag{L.89}
$$
If the attainable field amplitude is identically zero, its absolute amplitude may be used directly; the quotient with a zero reference amplitude is undefined. On the positive-reference branch, the effective rates can be modeled as:

$$ \gamma_k(t) \approx \gamma_k^{(0)}\bigl[1+\chi_k(\omega_{\text{rad}}(t), \Delta(t))\Phi_S(t) + O(\Phi_S^2(t))\bigr] \tag{L.90} $$

where $\chi_k$ is a dimensionless rate susceptibility, dependent on $d_{\text{TLS}}$, $E_{\text{max}}$, and details of the TLS-environment coupling modulated by the Stark shift.

**Note on Born Response.** The CC model changes the effective Hamiltonian and the Lindblad rates $\gamma_k$; it does not alter the probability functional. On the selected complex-Hilbert branch, Theorem 8.3 gives the trace weight $\operatorname{tr}(\rho E_k)$ and Principle 8.0c identifies it with the registered single-run outcome probability. Changing the generator can change $\rho$ and the instrument effects $E_k$, hence the numerical probabilities, without changing that rule. Empirical-frequency convergence requires a separate i.i.d., exchangeable, or stationary-ergodic repeated-trial certificate.

Let $L_S(t)$ denote the bounded time-dependent Lindblad generator on $0\leq t\leq\tau_{int}$ and let
$$
\mathcal U_S(\tau_{int},0)
:=\mathcal T\exp\!\left(\int_0^{\tau_{int}}L_S(t)\,dt\right).
$$
Then
$$
P_{\mathrm{obs}}(i)
=\operatorname{tr}\!\left(E_i\mathcal U_S(\tau_{int},0)(\rho)\right)
=\operatorname{tr}(\rho E_i)
+\int_0^{\tau_{int}}
\operatorname{tr}\!\left(\rho L_S^\dagger(t)(E_i)\right)dt
+O(M^2\tau_{int}^2),
\tag{L.91}
$$
provided $\sup_{0\leq t\leq\tau_{int}}\|L_S(t)\|\leq M<\infty$. For a constant generator this reduces to the exponential and linear term in the original formula. The context branch must separately verify $|\Delta P(i)|\leq\mathrm{CC}(S)$.

<a id="theorem-l112a-exact-stark-amplitude-damping-endpoint-and-nuisance-bound"></a>**Theorem L.11.2a (Exact Stark–Amplitude-Damping Endpoint and Nuisance Bound).** Let $c\in\{0,1\}$ label two frozen Maxwell source solutions at one target. Suppose their certified dispersive shifts are $\delta_c$, including the remainder in Equation (L.87), and let the target bath have a nonnegative $C^1$ decay law $\gamma(\omega)$ on an interval containing $\omega_{\mathrm{TLS}}+\delta_c$. For an initially excited target, constant interaction time $\tau>0$, amplitude-damping jump $\sigma_-$, and the excited-state endpoint $E_e=|e\rangle\langle e|$, the normalized endpoint probabilities are exactly
$$
p_c
=\operatorname{tr}(E_e\rho_c(\tau))
=\exp[-\gamma(\omega_{\mathrm{TLS}}+\delta_c)\tau],
\tag{L.11.2a.1}
$$
and the locked response is
$$
\mathcal A_{\mathrm{AD}}:=p_1-p_0\in[-1,1].
\tag{L.11.2a.2}
$$
It is nonzero exactly when the two sampled bath rates differ. Its exact susceptibility is
$$
\frac{\partial p_c}{\partial\delta_c}
=-\tau\gamma'(\omega_{\mathrm{TLS}}+\delta_c)p_c.
\tag{L.11.2a.3}
$$
For the nuisance comparison, assume the entire frequency segment joining $\omega_{\mathrm{TLS}}+\delta_c$ to $\omega_{\mathrm{TLS}}+\widehat\delta_c$ lies in the certified bath interval for each $c$. On those segments require $|\gamma'|\le L_\gamma$ and $0\le\gamma\le\gamma_{\max}$. Let $|\widehat\delta_c-\delta_c|\le e_c$ and compare nonnegative durations $\tau$ and $\widehat\tau_c$ with $|\widehat\tau_c-\tau|\le e_\tau$. Define $\widehat p_c=\exp[-\gamma(\omega_{\mathrm{TLS}}+\widehat\delta_c)\widehat\tau_c]$ and $\widehat{\mathcal A}_{\mathrm{AD}}=\widehat p_1-\widehat p_0$. Then
$$
|\widehat{\mathcal A}_{\mathrm{AD}}-\mathcal A_{\mathrm{AD}}|
\le\tau L_\gamma(e_0+e_1)+2\gamma_{\max}e_\tau.
\tag{L.11.2a.4}
$$

*Proof.* The Stark Hamiltonian commutes with $E_e$, while amplitude damping gives $\dot p_c=-\gamma(\omega_{\mathrm{TLS}}+\delta_c)p_c$, $p_c(0)=1$. Solving yields (L.11.2a.1), and differentiation gives (L.11.2a.3). Compare each perturbed endpoint first at the original duration $\tau$. The frequency derivative has magnitude at most $\tau L_\gamma$ throughout the certified segment. Next vary duration at the perturbed frequency; its derivative has magnitude $\gamma e^{-\gamma t}\le\gamma_{\max}$ for all intervening nonnegative times. Thus $|\widehat p_c-p_c|\le\tau L_\gamma e_c+\gamma_{\max}e_\tau$. The triangle inequality for the two endpoints gives (L.11.2a.4). ∎

This theorem supplies a dimensionless endpoint, sign, susceptibility, nuisance variables, and a rigorous uncertainty functional once the frozen Maxwell shifts and bath law are populated.

<a id="theorem-l112b-certified-dispersive-remainder-and-finite-collision-bath-realization"></a>**Theorem L.11.2b (Certified Dispersive Remainder and Finite Collision-Bath Realization).**

(a) Let $\Delta\ne0$ and $\Omega_R\ge0$ be frozen, and let $\delta_{\mathrm{ex}}:=\operatorname{sgn}(\Delta)\bigl(\sqrt{\Delta^2+\Omega_R^2}-|\Delta|\bigr)$ be the signed change of the rotating-frame eigenvalue separation. Then $\delta_{\mathrm{ex}}$ has the sign of $\Delta$ when $\Omega_R>0$, and
$$
0\le\frac{\Omega_R^2}{2|\Delta|}-|\delta_{\mathrm{ex}}|\le\frac{\Omega_R^4}{8|\Delta|^3}.
\tag{L.11.2b.1}
$$
Thus Equation (L.87) holds for frozen parameters with the explicit remainder constant $1/8$.

(b) Let the target Hamiltonian be $\tfrac{\hbar}{2}\omega_c\sigma_z$ with $\omega_c:=\omega_{\mathrm{TLS}}+\delta_c$, as in Theorem L.11.2a. Let the bath consist of $n\ge1$ fresh qubits of frequency $\omega_b$, each initially in its ground state and coupled to the target in turn for a duration $\tau_0>0$ by
$$
H_{\mathrm{col}}=\frac{\hbar\omega_c}{2}\sigma_z\otimes I+\frac{\hbar\omega_b}{2}I\otimes\sigma_z+\hbar g\,(\sigma_+\otimes\sigma_-+\sigma_-\otimes\sigma_+),
\qquad g>0.
$$
With $\nu_c:=\omega_c-\omega_b$ and $R_c:=\sqrt{g^2+\nu_c^2/4}$, each collision transfers the excitation with probability
$$
p_{\mathrm{col}}(\nu_c)=\frac{g^2}{R_c^2}\sin^2(R_c\tau_0),
\tag{L.11.2b.2}
$$
and an initially excited target has, after the $n$ collisions, excited probability exactly
$$
p_c=\bigl(1-p_{\mathrm{col}}(\nu_c)\bigr)^n.
\tag{L.11.2b.3}
$$
Whenever $p_{\mathrm{col}}<1$ at the frequencies used, (L.11.2b.3) is Equation (L.11.2a.1) with $\tau=n\tau_0$ and the smooth nonnegative decay law $\gamma(\omega):=-\tau_0^{-1}\ln[1-p_{\mathrm{col}}(\omega-\omega_b)]$. The susceptibility (L.11.2a.3) then holds with this $\gamma$, and the locked response $\mathcal A_{\mathrm{AD}}=p_1-p_0$ is nonzero exactly when $p_{\mathrm{col}}(\nu_1)\ne p_{\mathrm{col}}(\nu_0)$.

*Proof.* (a) Put $x=\Omega_R^2/\Delta^2\ge0$ and $f(x)=\sqrt{1+x}$. Since $f''<0$ and $f'''>0$ on $[0,\infty)$, Taylor's theorem with Lagrange remainder gives $1+x/2-x^2/8\le f(x)\le1+x/2$. Multiplication by $|\Delta|$ and subtraction of $|\Delta|$ give $\Omega_R^2/(2|\Delta|)-\Omega_R^4/(8|\Delta|^3)\le|\delta_{\mathrm{ex}}|\le\Omega_R^2/(2|\Delta|)$, and $\sqrt{\Delta^2+\Omega_R^2}>|\Delta|$ for $\Omega_R>0$ fixes the sign.

(b) $H_{\mathrm{col}}$ commutes with the excitation number $\sigma_z\otimes I+I\otimes\sigma_z$. The vector $|g,g\rangle$ is an eigenvector, and on $\operatorname{span}\{|e,g\rangle,|g,e\rangle\}$ the Hamiltonian is $\hbar(\tfrac{\nu_c}{2}Z'+gX')$ plus a multiple of the identity, where $Z',X'$ are Pauli operators on that span. Rabi's formula gives the transfer probability (L.11.2b.2). With the ancilla in its ground state, the post-collision amplitude of $|e,g\rangle$ arises only from the prior excited component, with modulus squared $1-p_{\mathrm{col}}$, and tracing out the ancilla leaves excited probability $(1-p_{\mathrm{col}})$ times its prior value. Induction over the fresh ancillas gives (L.11.2b.3). Taking logarithms gives the exponential form with the displayed $\gamma$, which is smooth and nonnegative where $p_{\mathrm{col}}<1$; differentiation gives (L.11.2a.3), and strict monotonicity of $x\mapsto(1-x)^n$ on $[0,1)$ gives the response criterion. ∎

<a id="theorem-l112c-exact-coherent-dipole-maxwell-source-transfer-and-finite-actuator-ledger"></a>**Theorem L.11.2c (Exact Coherent-Dipole Maxwell Source, Transfer and Finite Actuator Ledger).**

#### 1. A smooth, conserved, genuinely radiating source

Use SI units, vacuum permittivity $\epsilon_{\rm vac}$, $c^{-2}=\epsilon_{\rm vac}\mu_0$, and the phasor convention $e^{-i\omega t}$. Let $a>0$ be the **source radius**; its diameter in Theorem L.2's convention is $2a$. Define
\[
 Z=4\pi\int_0^1 v^2e^{-1/(1-v^2)}\,dv>0,\qquad
 f(\mathbf x)=\frac{1}{Za^3}
 \begin{cases}e^{-1/(1-|\mathbf x|^2/a^2)},&|\mathbf x|<a,\\0,&|\mathbf x|\ge a.\end{cases}
\tag{L.11.2c.M1}
\]
Then $f\in C_c^\infty(\mathbb R^3)$, $f\ge0$, and $\int f=1$. For a real scalar pulse $p\in C_c^\infty(\mathbb R)$ put
\[
 \mathbf P(t,\mathbf x)=p(t)f(\mathbf x)\widehat{\mathbf x},\qquad
 \rho=-p(t)\partial_x f,\qquad
 \mathbf j=\dot p(t)f\widehat{\mathbf x}.
\tag{L.11.2c.M2}
\]
These are compact, smooth **charge and electric-current densities**, rather than a gauge/phase ansatz. Direct differentiation and integration by parts give
\[
 \dot\rho+\nabla\cdot\mathbf j=0,\quad
 \int\rho\,d^3x=0,\quad
 \int\mathbf x\rho\,d^3x=p(t)\widehat{\mathbf x},\quad
 \int\mathbf j\,d^3x=\dot p(t)\widehat{\mathbf x}.
\tag{L.11.2c.M3}
\]
Use the unique retarded Maxwell solution with zero incoming radiation and zero fields before the source starts. For reference, the standard retarded potentials are recorded by Fitzpatrick (n.d.-a); the explicit finite-source evaluation below is derived here.

For a harmonic component $\widetilde p e^{-i\omega t}$, define $k=\omega/c>0$ and
\[
 F(k)=4\pi\int_0^a r^2f(r)\frac{\sin kr}{kr}\,dr.
\tag{L.11.2c.M4}
\]
The elementary angular integral of the outgoing Green function gives, **exactly for every $r>a$**,
\[
 \int\frac{e^{ik|\mathbf r-\mathbf x|}}{4\pi|\mathbf r-\mathbf x|}f(\mathbf x)d^3x
 =F(k)\frac{e^{ikr}}{4\pi r}.
\tag{L.11.2c.M5}
\]
For example, on a shell of radius $s<r$, substituting $d=|\mathbf r-\mathbf x|$ in the polar integral yields $e^{ikr}\sin(ks)/(kr s)$ before the radial shell weight is applied. Thus (L.11.2c.M5) requires no omitted multipole remainder. Its exterior vector field is pure electric $\ell=1$.

Because $\sin z/z=\int_0^1\cos(tz)dt$ and $1-z^2/2\le\cos z\le1$,
\[
 1-\frac{k^2\langle r^2\rangle_f}{6}\le F(k)\le1,\qquad
 F(k)\ge1-\frac{k^2a^2}{6}.
\tag{L.11.2c.M6}
\]
In particular $0<ka<\sqrt6$ guarantees $F(k)>0$. The complete-field correction to the point electric-dipole amplitude is the explicit factor $F(k)$, not an unregistered transfer constant.

#### 2. Exact exterior fields, near terms included

For $\widetilde{\mathbf p}=\widetilde p\widehat{\mathbf x}$ and $\mathbf n=\mathbf r/r$, differentiation of (L.11.2c.M5) gives
\[
 \widetilde{\mathbf E}(\mathbf r)=\frac{F(k)e^{ikr}}{4\pi\epsilon_{\rm vac}}
 \left\{\frac{k^2}{r}(I-\mathbf n\mathbf n^\top)\widetilde{\mathbf p}
 +\left(\frac1{r^3}-\frac{ik}{r^2}\right)
 [3\mathbf n(\mathbf n\cdot\widetilde{\mathbf p})-\widetilde{\mathbf p}]\right\},
\tag{L.11.2c.M7}
\]
\[
 \widetilde{\mathbf B}(\mathbf r)=
 \frac{\mu_0F(k)e^{ikr}}{4\pi}
 \left(\frac{\omega^2}{cr}+\frac{i\omega}{r^2}\right)
 (\mathbf n\times\widetilde{\mathbf p}).
\tag{L.11.2c.M8}
\]
One direct verification uses $g=e^{ikr}/(4\pi r)$, $\widetilde\phi=-F\widetilde{\mathbf p}\cdot\nabla g/\epsilon_{\rm vac}$ and $\widetilde{\mathbf A}=-i\mu_0\omega F\widetilde{\mathbf p}g$; then $\widetilde{\mathbf E}=-\nabla\widetilde\phi+i\omega\widetilde{\mathbf A}$ and $\widetilde{\mathbf B}=\nabla\times\widetilde{\mathbf A}$ give (L.11.2c.M7)–(L.11.2c.M8).

At $\mathbf r_T=R\widehat{\mathbf z}$, $R>a$, the electric field is precisely $x$-polarized and
\[
 \widetilde E_x(R\widehat{\mathbf z})=
 \frac{F(k)\widetilde p e^{\mathrm{ikR}}}{4\pi\epsilon_{\rm vac}}
 \left(\frac{k^2}{R}+\frac{ik}{R^2}-\frac1{R^3}\right).
\tag{L.11.2c.M9}
\]
For peak dipole $D=|\widetilde p|>0$, set $X=kR$ and $Q(X)=1-X^{-2}+X^{-4}\ge3/4$. Its exact target amplitude is
\[
 E_{\rm ctr}=\frac{D F(k)k^2}{4\pi\epsilon_{\rm vac}R}\sqrt{Q(X)}>0.
\tag{L.11.2c.M10}
\]
The relative complex-amplitude error incurred by dropping the $R^{-2}$ and $R^{-3}$ terms is $\sqrt{X^{-2}+X^{-4}}$. They need not be dropped. The harmonic mean radiated power and its exact center-field normalization are
\[
 \overline P_{\rm rad}=\frac{\omega^4D^2F(k)^2}{12\pi\epsilon_{\rm vac}c^3}
 =\frac{4\pi\epsilon_{\rm vac}cR^2}{3Q(X)}E_{\rm ctr}^2.
\tag{L.11.2c.M11}
\]
The prefactor agrees with the conventional point-dipole limit described by Fitzpatrick (n.d.-b). Here the finite-size factor is retained exactly.

For $N$ coherent subpopulations with equal dipole phasor magnitude $d$, replace $\widetilde p$ by $d\sum_{j=1}^Ne^{i\phi_j}$. Both field and complete radiated power then follow from (L.11.2c.M7) and (L.11.2c.M11). Equal phases give $N^2d^2$ in the radiative power. A phase-independent $R_{\rm osc}$ can count overhead, but cannot count the **complete** source energy at fixed $d$; the radiative tariff changes with coherence. This construction asserts source/response realization and does not infer a total-energy PCE optimum from Theorem L.2's phase-independent-overhead objective.

#### 3. Exact finite-link transfer and a quantitative nonzero certificate

Let the target link join $R\widehat{\mathbf z}-\ell\widehat{\mathbf x}$ to $R\widehat{\mathbf z}+\ell\widehat{\mathbf x}$, with $\ell>0$. At coordinate $s\in[-\ell,\ell]$, put
\[
 r_s=\sqrt{R^2+s^2},\quad u_s=s^2/r_s^2,
\]
\[
 A(r)=\frac{k^2}{r}+\frac{ik}{r^2}-\frac1{r^3},\qquad
 B(r)=-\frac{k^2}{r}-\frac{3ik}{r^2}+\frac3{r^3},
\]
\[
 H(s)=e^{ikr_s}[A(r_s)+u_sB(r_s)],\qquad
 \mathcal T_\ell=\frac{F(k)}{8\pi\epsilon_{\rm vac}\ell}\int_{-\ell}^{\ell}H(s)\,ds.
\tag{L.11.2c.M12}
\]
Then the **exact** averaged electric phasor and voltage are
\[
 \widetilde E_{\rm av}=\widetilde p\,\mathcal T_\ell,\qquad
 \widetilde V_{+-}=-2\ell\widetilde E_{\rm av}.
\tag{L.11.2c.M13}
\]
The voltage formula holds in the tree/link gauge $A_{\rm link}=\int_{-\ell}^{\ell}\mathbf A\cdot d\mathbf s=0$. Generally the gauge-invariant identity is

$$
\phi_+-\phi_-+\partial_t A_{\rm link}=-\int\mathbf E\cdot d\mathbf s.
$$

A gauge transformation on this single link can set $A_{\rm link}=0$; in a Peierls Hamiltonian the endpoint scalar terms and hopping phase transform together. The resulting scalar difference is therefore a genuine electric field, not a physical effect inferred from a pure gauge.

Here is a conservative derivative certificate requiring no quadrature. Since $r_s\ge R$, $|r_s'|\le1$, $0\le u_s\le1$, and $|u_s'|\le2/R$,
\[
 \sup_s|H'(s)|\le
 \frac{2k^3}{R}+\frac{8k^2}{R^2}+\frac{18k}{R^3}+\frac{18}{R^4}=:L_H.
\tag{L.11.2c.M14}
\]
Also $|H(0)|=(k^2/R)\sqrt{Q(X)}\ge\sqrt3k^2/(2R)$. Averaging $|H(s)-H(0)|\le L_H|s|$ therefore yields
\[
 \left|\frac{\widetilde E_{\rm av}-\widetilde E_{\rm ctr}}{\widetilde E_{\rm ctr}}\right|
 \le\eta_\ell:=\frac{k\ell}{\sqrt3}
 \left(2+\frac8X+\frac{18}{X^2}+\frac{18}{X^3}\right).
\tag{L.11.2c.M15}
\]
Thus $\eta_\ell<1$ implies $\mathcal T_\ell\ne0$, and
$(1-\eta_\ell)E_{\rm ctr}\le|\widetilde E_{\rm av}|\le(1+\eta_\ell)E_{\rm ctr}$.

The requested witness
\[
 \omega=10^{14}\ {\rm s}^{-1},\quad ka=10^{-2},\quad kR=100,\quad k\ell=10^{-6}
\tag{L.11.2c.M16}
\]
has $a=2.99792458\times10^{-8}\ {\rm m}$, $R=2.99792458\times10^{-4}\ {\rm m}$, $\ell=2.99792458\times10^{-12}\ {\rm m}$, $F\ge0.9999833333$, and $\eta_\ell<1.203\times10^{-6}$. Its exact link transfer is nonzero. These geometrical numbers alone make no claim that two sharply localized orbitals at that separation realize an empirical TLS.

For any desired finite nonzero link phasor $\widetilde E_*$, choose the source phasor
\[
 \widetilde p=\widetilde E_*/\mathcal T_\ell,\qquad
 D=|\widetilde E_*|/|\mathcal T_\ell|<\infty.
\tag{L.11.2c.M17}
\]
This fixes amplitude **and** phase without a fitted free transfer. For a link charge $q$, the endpoint energy difference is $qV_{+-}=-2q\ell E_{\rm av}$; the conversion to a Rabi amplitude must use the chosen target basis and its Hamiltonian convention.

#### 4. Finite turn-on, exact plateau, and strict causal support

Let $h(v)=0$ for $v\le0$ and $h(v)=e^{-1/v}$ for $v>0$, and define the smooth step $S(v)=h(v)/[h(v)+h(1-v)]$. Given $\tau_r>0$, $T>2\tau_r$, and a phase $\varphi$, set
\[
 \chi(t)=S(t/\tau_r)S((T-t)/\tau_r),\qquad
 p_b(t)=bD\chi(t)\cos(\omega t-\varphi),\quad b\in\{0,1\}.
\tag{L.11.2c.M18}
\]
This pulse vanishes outside $[0,T]$ and is exactly sinusoidal on $[\tau_r,T-\tau_r]$. It is not claimed to be globally monochromatic. The context bit $b$ is encoded in locally available actuator programs before the source starts. Distributing that bit from a newly chosen remote location requires its own causal preparation interval; synchronized turn-on does not transmit a new bit instantaneously across the source.

Define the even, nonnegative line marginal
\[
 w(z)=2\pi\int_{|z|}^{a}r f(r)\,dr\quad(|z|\le a),\qquad
 \int_{-a}^{a}w(z)dz=1,
\]
\[
 q_b(t)=\int_{-a}^{a}w(z)p_b(t+z/c)\,dz.
\tag{L.11.2c.M19}
\]
The Fourier multiplier of this convolution is $F(\omega/c)$. With $t_r=t-r/c$ and $\mathbf q=q_b\widehat{\mathbf x}$, the exact exterior **pulse** fields are
\[
 \mathbf E=\frac1{4\pi\epsilon_{\rm vac}}
 \left\{\frac{3\mathbf n(\mathbf n\cdot\mathbf q)-\mathbf q}{r^3}
 +\frac{3\mathbf n(\mathbf n\cdot\dot{\mathbf q})-\dot{\mathbf q}}{cr^2}
 +\frac{\mathbf n\times(\mathbf n\times\ddot{\mathbf q})}{c^2r}\right\}_{t_r},
\tag{L.11.2c.M20}
\]
\[
 \mathbf B=-\frac{\mu_0}{4\pi}\left\{\mathbf n\times
 \left(\frac{\dot{\mathbf q}}{r^2}+\frac{\ddot{\mathbf q}}{cr}\right)\right\}_{t_r}.
\tag{L.11.2c.M21}
\]
The apparently advanced shifts in $q_b$ are only a center-based representation of the extended source: $t-r/c+z/c\le t-(r-a)/c<t$ for every exterior point. At the center target the field is identically zero for $t<(R-a)/c$, and vanishes again after $T+(R+a)/c$.

The harmonic target-center formula is exact throughout
\[
 [\tau_r+(R+a)/c,\ T-\tau_r+(R-a)/c].
\tag{L.11.2c.M22}
\]
For the complete link, replace the lower endpoint by
$\tau_r+(\sqrt{R^2+\ell^2}+a)/c$ and keep the upper endpoint in (L.11.2c.M22). Choose $T$ so this interval contains the required interaction window. On that window the exact finite-link field (L.11.2c.M13) has a constant phasor. The finite ramps need no rotating-wave or adiabatic approximation to establish this Maxwell fact.

#### 5. Finite radiation energy and explicit source-work bound

Angular integration of the $r^{-1}$ terms in (L.11.2c.M20) gives the exact total radiated energy
\[
 W_{\rm rad}=\frac1{6\pi\epsilon_{\rm vac}c^3}
 \int_{\mathbb R}|\ddot q_b(t)|^2dt
 \le\frac1{6\pi\epsilon_{\rm vac}c^3}\int_{\mathbb R}|\ddot p_b(t)|^2dt
 \le\frac{T B_2^2}{6\pi\epsilon_{\rm vac}c^3}<\infty,
\tag{L.11.2c.M23}
\]
where $B_j=\sup_t|p_b^{(j)}(t)|$. The first inequality is Jensen's inequality followed by integration. If the $q_1$ harmonic plateau contains $m\ge1$ complete periods, with $\tau=2\pi m/\omega$, then
\[
 W_{\rm rad}\ge\frac{D^2F(k)^2\omega^4\tau}{12\pi\epsilon_{\rm vac}c^3}>0.
\tag{L.11.2c.M24}
\]
For (L.11.2c.M18), convenient explicit conservative bounds are
\[
 B_0\le D,\quad B_1\le D(\omega+22/\tau_r),\quad
 B_2\le D(\omega^2+44\omega/\tau_r+645/\tau_r^2).
\tag{L.11.2c.M25}
\]
Indeed $\|S'\|_\infty\le8e<22$ and
$\|S''\|_\infty\le512/e+108+128e<645$; these follow by differentiating the quotient, using $h(v)+h(1-v)\ge e^{-2}$ on $[0,1]$, and $\sup_{v>0}v^{-m}e^{-1/v}=(m/e)^m$. The two ramps are disjoint.

The smooth source avoids point-dipole self-energy divergence. For all $\mathbf x$ inside the source, Jefimenko's retarded electric-field expression gives
\[
 |\mathbf E(\mathbf x,t)|\le E_S:=\frac2{\epsilon_{\rm vac}}
 \left(aG B_0+\frac{a^2G B_1}{c}+\frac{a^2 f_0 B_2}{c^2}\right)<\infty,
\tag{L.11.2c.M26}
\]
where $f_0=\|f\|_\infty=e^{-1}/(Za^3)$ and
$G=\|\nabla f\|_\infty\le8e^{-2}/(Za^4)$. To verify the bound, use
$|\rho|\le B_0G$, $|\dot\rho|\le B_1G$, $|\dot{\mathbf j}|\le B_2f_0$ and
\[
 \int_{B_a}|\mathbf x-\mathbf y|^{-2}d^3y\le8\pi a,\qquad
 \int_{B_a}|\mathbf x-\mathbf y|^{-1}d^3y\le8\pi a^2.
\]
These follow by enlarging the translated integration region to $B_{2a}$. The same argument bounds $\mathbf B$; the retarded fields have bounded spatial support at every finite time, hence finite total field energy.

#### 6. A populated local actuator and non-overlapping battery ledger

One explicit continuum source branch has a scalar local polarization coordinate $u(t,\mathbf x)$, $\mathbf P=f u\widehat{\mathbf x}$, mechanical energy density
\[
 e_{\rm m}=\tfrac12 f(M\dot u^2+Ku^2),\qquad M>0,\quad K\ge0,
\tag{L.11.2c.M27}
\]
and local equation
\[
 M\ddot u+\Gamma\dot u+Ku=E_x+F_{\rm ext}(t,\mathbf x),\qquad\Gamma\ge0.
\tag{L.11.2c.M28}
\]
Here $u$ has dipole units, $M\ddot u$, $Ku$, and $F_{\rm ext}$ have electric-field units; the factors of $f$ fix their energy normalization. This is an ideal local classical polarization-oscillator model, with a specified finite active drive. It is not an assertion that an arbitrary material has these constitutive parameters.

The explicit local drive
\[
 F_{{\rm ext},b}=M\ddot p_b+\Gamma\dot p_b+Kp_b-E_{b,x}
\tag{L.11.2c.M29}
\]
with initially resting oscillators enforces $u=p_b$ exactly. $E_{b,x}$ is the retarded field already computed, so (L.11.2c.M29) is a populated feed-forward drive; equivalently its last term can be implemented as local field feedback. It does not impose a nonlocal rigidity constraint. The required force is bounded by $MB_2+\Gamma B_1+KB_0+E_S$.

Define the physical actuator power, oscillator energy, and heat by
\[
 P_{\rm ext}=\dot p_b\left(M\ddot p_b+\Gamma\dot p_b+Kp_b
 -\int fE_{b,x}d^3x\right),\quad
 U_{\rm m}=\tfrac12(M\dot p_b^2+Kp_b^2),\quad
 Q_{\rm loss}=\Gamma\int\dot p_b^2dt.
\tag{L.11.2c.M30}
\]
The Maxwell energy balance $\dot U_{\rm EM}+\oint\mathbf S\cdot d\mathbf A=-\int\mathbf j\cdot\mathbf E$ and (L.11.2c.M28) give
\[
 \frac{d}{dt}(U_{\rm m}+U_{\rm EM})+\oint\mathbf S\cdot d\mathbf A
 =P_{\rm ext}-\Gamma\dot p_b^2.
\tag{L.11.2c.M31}
\]
This is the standard Poynting energy identity (Fitzpatrick n.d.-a) with the source owner explicitly supplied.

After the complete pulse and clearance of the local near field, the oscillators are back at rest. Integrating over any enclosing sphere and the complete event gives
\[
 W_{\rm net}:=\int P_{\rm ext}dt=W_{\rm rad}+Q_{\rm loss}.
\tag{L.11.2c.M32}
\]
The conservative gross battery tariff and maximum instantaneous power obey
\[
 W_+:=\int[P_{\rm ext}]_+dt
 \le T B_1(MB_2+\Gamma B_1+KB_0+E_S)<\infty,
\tag{L.11.2c.M33}
\]
\[
 |P_{\rm ext}|\le B_1(MB_2+\Gamma B_1+KB_0+E_S),\qquad
 W_-:=\int[-P_{\rm ext}]_+dt,\quad W_+-W_-=W_{\rm net}.
\tag{L.11.2c.M34}
\]
A battery reserve equal to the right side of (L.11.2c.M33) suffices throughout the event. With recovery, $W_-$ is credited back to that battery; without recovery, it is dissipated in the actuator and counted once as an additional heat owner. $W_{\rm rad}$ is an output in (L.11.2c.M32), **not a second input expense added to $W_+$**. $U_{\rm m}$ and local field energy are temporary stores, not additional cycle expenses. Digital preparation/reset and instrumentation, if used, receive separate work/heat owners and are not implied to be free by this source model.

A coupled target that extracts energy must be included in the complete ledger. The same local feedback law can hold the prescribed source current using the **total** field, and then the battery supplies the changed radiative output plus target energy and losses. Equations (L.11.2c.M26) and (L.11.2c.M33) are the proven bound for the source-only vacuum solution; they are not an unproved bound on an arbitrary added target's backreaction. A prescribed-field/weak-probe target model must explicitly retain its approximation certificate.

#### Optional separated-target extension of the source tariff

A concrete sufficient backreaction bound is available when a target's additional **conserved Maxwell current** is supplied. Suppose its support stays at distance at least $d>0$ from the source and
$Q_0=\int\sup_t|\rho_T|$, $Q_1=\int\sup_t|\partial_t\rho_T|$, and $J_1=\int\sup_t|\partial_t\mathbf j_T|$ are finite. Jefimenko's formula gives
\[
 E_{\rm back}\le\frac1{4\pi\epsilon_{\rm vac}}
 \left(\frac{Q_0}{d^2}+\frac{Q_1}{cd}+\frac{J_1}{c^2d}\right).
\tag{L.11.2c.M35}
\]
The time supremum is **inside** each spatial integral because different source points are sampled at different retarded times. Use the total field in (L.11.2c.M29), and replace $E_S$ in (L.11.2c.M33)–(L.11.2c.M34) by $E_S+E_{\rm back}$. For a conserved classical two-endpoint charge/link-current realization with one charge $q$, endpoint occupation $n_+(t)\in[0,1]$, and $I=q\dot n_+$, one may use $Q_0\le2|q|$, $Q_1\le2\sup|I|$, and $J_1\le2\ell\sup|\dot I|$. These distributional target currents may equivalently be regularized into narrow smooth orbitals and a tube while preserving a positive separation. The bound does not by itself identify a quantum target's Maxwell current or remove its self-field obligations; that identification remains a declared component of the coupled branch.

<a id="theorem-l112d-registered-maxwell-peierls-stark-carrier-fixed-positive-bath-and-complete-instrument"></a>**Theorem L.11.2d (Registered Maxwell–Peierls Stark Carrier, Fixed Positive Bath and Complete Instrument).**

#### Result, original quantifiers, and limits

The unchanged original predicate is:

The construction specifies the Maxwell current and geometry, derives the driven-target rotating-wave and elimination bounds, and realizes the bath, carrier and observable on one common source.

The source retains a registered Maxwell current/geometry, a driven-target reduction certificate, and a matched bath/carrier/observable. Its explicit scope note says that a biological implementation or physical experiment is not required, while replacing the mechanism by an arbitrary phase instrument is invalid. The original predicate already admits **frozen drives and finite collision baths**, with equivalence by endpoints, susceptibilities and locked responses. It does not ask for every possible emitter, a universal material substrate, or an exactly Markovian finite bath for every real time.

This construction keeps that mechanism. A conserved, electrically small, finite-duration polarization current radiates a nonzero, solved Maxwell field. That field supplies the actual electric voltage across a charged two-site target. A fixed positive occupation interaction with neutral oscillator rails supplies a physical finite bath. A joint rotating-wave bound and a separate dressed-contact bound relate the full driven Hamiltonian to the diagonal Stark target **seen by that same bath**. The endpoint has a rigorously nonzero response; its error is much smaller than the response.

The source is an explicitly registered **externally controlled Maxwell–Peierls/oscillator-rail physical model**, using the prescribed-time, quadratic and positive cross-Kerr control grammar already admitted in Theorem 8.8f.3 and the charged two-site spatial-orbital grammar with Peierls link phase specified in §2 below. It is not a claim about a fabricated atom, a biological aggregate, an autonomous microscopic actuator, a universal PCE optimum, or observed calibration. Section 9 additionally gives an ultraviolet-regularized field certificate for neglecting target radiation/field entanglement, rather than calling an unbounded weak-probe approximation exact. The quantized extension is additional support; the original classical-current branch does not demand microscopic QED.

The proof supplies finite protocols, positive physical times, source/unit maps, normalized complete channels and instruments, a finite verifier, and separate work/storage/ready-resource owners. This is the finite-dressing standard of Definition P.6.2. No global hierarchy realizer, MPU minimality, or total lifecycle optimum follows.

#### 1. Exact source and geometry contract

The complete Maxwell derivation appears as Theorem L.11.2c. Its equation labels are M1–M35. The following data specify the source before interpreting any response.

* Choose a physical second, length standard, charge unit $q\ne 0$, action unit $\hbar$, vacuum constants $\varepsilon_{\mathrm{vac}}$, $\mu_0$, and $c=(\varepsilon_{\mathrm{vac}}\mu_0)^{-1/2}$.
* The emitter is the radial compact bump $f_{a}$ of (L.11.2c.M1), with polarization $P_c(t,x)=p_c(t)f_a(x)e_x$. Its charge and current are $\rho_c=-p_c\partial_xf_a$ and $j_c=\dot p_cf_ae_x$. Conservation is an identity. The source is neutral and its electric dipole is $p_ce_x$.
* The context is the retained orthogonal binary source register of L.1c/L.12.8b. The already registered nondemolition copy exposes $c\in\{0,1\}$ to a local finite waveform controller. The two policies are $p_{0}=0$ and a specified positive-frequency sinusoidal pulse $p_{1}$. Both source labels and waveform programs remain owned. No source label is read directly at the target.
* Use no incoming classical radiation and the retarded solution. Source amplitude and phase are determined by the **exact** transfer (L.11.2c.M12)–(L.11.2c.M17). The finite ramps and causal delay are included. The target is prepared only after the complete link is inside the exact harmonic plateau (L.11.2c.M22).

For the witness in Section 7 choose

$$
\omega=10^{10}\ \mathrm{s}^{-1},\quad k=\omega/c,\quad ka=1/100,\quad kR=100,\quad k\ell\le 10^{-6}.
$$

Thus $a\approx 2.998\times 10^{-4}$ m and $R\approx 2.998$ m using the displayed SI light speed. Here $a$ is the radius, so the source diameter in Theorem L.2 is $2a$. The original illustrative $\omega=10^{14}$ in Theorem L.11.2c's M16 is **not** the witness frequency; the invariant dimensionless geometry is rescaled here. The upper bound $\ell\le 2.998\times 10^{-8}$ m may be made smaller by Section 9's independently declared small-dipole choice.

The source form factor $F_a(k)\ge 1-(ka)^{2}/6>0.9999833$. The exact center field includes all $R^{-1}$, $R^{-2}$ and $R^{-3}$ terms. The finite-link average differs from the center phasor by at most $1.203\times 10^{-6}$ relatively; hence the exact link transfer is nonzero. Neither a far-field truncation nor an unspecified transfer constant is used.

For a target charge-cloud form factor $f_{b}$ introduced in Section 9, choose $kb=1/100$. Since the complete cloud stays outside the emitter, the spherical average multiplies the exact link transfer by $F_b(k)$, with $F_b(k)\ge 1-(kb)^{2}/6>0$. Thus the desired Rabi amplitude fixes the source phasor uniquely by

$$
\tilde p_c = -\hbar\, \Omega_c / [q\ell\, F_b(k)\, T_\ell].
\tag{1}
$$

The minus sign chooses the target drive $+\hbar\Omega_c\cos(\omega t)X$; a time-origin phase is included in the phasor. On the declared plateau control window register $E_{\max}=\hbar\Omega_1/|q\ell|$ for the target-averaged field, so L.89 has $\Phi_{S}=0$ or $1$ in the two contexts. Its finite relation to the center and unsmeared radiation fields is the exact $F_bT_\ell$ transfer above; these field observables are not silently identified. Without cloud smearing set $F_{b}=1$. All quantities in (1) are computed from the registered source, target geometry and charge; no response or measured susceptibility is fitted.

#### 2. Charged target: energy, charge, current and electric coupling

Use two equal-charge spatial rails $c_+,c_-$ and the exactly invariant one-particle code. Their endpoints are $Re_z\pm\ell e_x$. In site coordinates set

$$
H_T^0=\hbar\nu_T(N_++N_-)-(\hbar\omega_0/2)(c_+^\dagger c_-+c_-^\dagger c_+),
$$

with $\nu_T>\omega_0/2+\Omega_{\max}$. Its energy eigenstates are

$$
\lvert e\rangle=(\lvert{+}\rangle-\lvert{-}\rangle)/\sqrt{2},\quad \lvert g\rangle=(\lvert{+}\rangle+\lvert{-}\rangle)/\sqrt{2}.
$$

In this basis $H_T^0=\hbar\nu_TI+\hbar\omega_0Z/2$ and $N_+-N_-=X$. Both states carry the same total charge $q$. Thus the transition dipole is an actual nonzero charge-position matrix element $d=q\ell$, rather than a transition between different superselection charges.

The gauge-covariant link Hamiltonian is the two-site Peierls Hamiltonian with the scalar terms $q\phi_+N_++q\phi_-N_-$ and Peierls phase $q\int A\cdot dl/\hbar$. For a single tree edge choose the link gauge $\int A\cdot dl=0$. The exact identity

$$
\varphi_+-\varphi_-+\partial_t\int A\cdot dl=-\int E\cdot dl
$$

then gives, after removing only a common code scalar,

$$
H_{\mathrm{EM},T}(t)=-q\ell\, E_{\mathrm{av}}(t)X=\hbar\Omega_c \cos(\omega t)X.
\tag{2}
$$

For the smeared source the same identity is averaged against $f_{b}$. It produces the factor $F_{b}$ in (1), without a long-wavelength target truncation. The dipole matrix element is qℓ; the two-level Hilbert space is the registered charged graph matter source itself, not an unproved truncation of a many-level atom.

The electric link current is $-\partial H/\partial A_{\mathrm{link}}$. Differentiating the site occupations gives its exact discrete continuity equation. A smooth continuum charge/current realization is obtained by convolving the endpoint densities and straight link current with $f_{b}$. A fixed, context-independent negative background neutralizes the identity part of the charge density. The transition charge density and polarization are explicitly

$$
\rho_T(x)=qX[f_b(x-r_T-\ell e_x)-f_b(x-r_T+\ell e_x)]/2,
$$

$$
\begin{aligned}
P_T(x) &= dX\, g_{b,\ell}(x)e_x,\\
g_{b,\ell}(x) &= (2\ell)^{-1}\int_{-\ell}^{\ell} f_b(x-r_T-se_x)\,ds,
\end{aligned}
$$

$$
\rho_T=-\nabla\cdot P_T,\quad j_T=\partial_t P_T.
\tag{3}
$$

The last derivative uses the actual Heisenberg dynamics. It is an operator continuity identity. The background and its electrostatic energy are retained, not removed by relabeling a charged state as neutral.

#### 3. A fixed positive physical bath contact

A bath element consists of **neutral** oscillator rails b_+,b_−, one excitation, with

$$
H_B^0=\hbar\nu_B(N_{B+}+N_{B-})-(\hbar\omega_b/2)(b_+^\dagger b_-+b_-^\dagger b_+),
$$

$\nu_B>\omega_b/2$, and initial energy ground state $|g\rangle_B$. The code eigenvectors use the same $\pm$ convention. The rail excitation has no electric dipole coupling to the emitter in this source grammar; its gap and contact are independently specified oscillator-control data. It is not a Gibbs state inferred after fitting a desired decay rate.

Switch on the two admitted positive occupation contacts

$$
H_{\mathrm{contact}}=2\hbar g(N_+N_{B+}+N_-N_{B-}),\quad g>0.
\tag{4}
$$

On the code, (4) is exactly $\hbar g(I+X_SX_B)$. This follows from $N_\pm=(I\pm X_S)/2$ and their bath analogues. It is nonnegative on the entire occupation Fock space and preserves each rail pair's excitation number. The scalar $\hbar gI$ has no channel effect but remains in switching-work/energy records.

Consequently the actual pair Hamiltonian, after removing code scalars, is

$$
H_c(t)/\hbar=\omega_0 Z_S/2+\omega_b Z_B/2+\Omega_c \cos(\omega t)X_S+gX_SX_B.
\tag{5}
$$

The **same $\omega_b$, $g$, initial bath and contact** are used for both context values. No context command reaches the bath or changes its rate by decree. Neutral-rail cross-Kerr is an admitted physical control port of this source; a claim about any particular material realizing that port requires its own hardware calibration. Positivity, code invariance and the complete code pullback are supplied here.

For $n$ collisions supply $n$ fresh ground bath factors and apply (4) to each for $\tau_{0}$, with $T=n\tau_0$. Used factors and their remaining correlations are stored in $B_{\mathrm{SPENT}}$. They are not recycled or asserted to be reset at finite temperature. The simplest witness uses $n=1$. At all times the full rail Hamiltonian can be nonnegative: the stated positive target/bath baselines dominate the bounded one-particle drive, and (4) is already positive.

#### 4. Joint rotating-wave certificate, including the bath

Use the rotating frame $R(t)=\exp[-i\omega t(Z_S+Z_B)/2]$. Define $\Delta=\omega_0-\omega>0$ and $\Delta_b=\omega_b-\omega$. In that frame the Hamiltonian is $K_c+V_c(t)$, in inverse seconds, where

$$
K_c=\Delta Z_S/2+\Delta_b Z_B/2+\Omega_c X_S/2+g(\sigma_+\tau_-+\sigma_-\tau_+),
$$

$$
\begin{aligned}
V_c(t) &= (\Omega_c/2)(\sigma_+e^{2i\omega t}+\sigma_-e^{-2i\omega t})\\
&\quad +g(\sigma_+\tau_+e^{2i\omega t}+\sigma_-\tau_-e^{-2i\omega t}).
\end{aligned}
\tag{6}
$$

The first fast term is the electric-drive counterterm. The second is the actual bath contact's pair term. Dropping it silently would have assumed the desired exchange bath.

For any collision start $s$, the primitive $Q(t)=\int_s^tV_c(u)\,du$ satisfies

$$
\begin{gathered}
\lVert V_c(t)\rVert\le v_c:=\Omega_c/2+g, \\
\lVert Q(t)\rVert\le q_c:=v_c/\omega, \\
2\lVert K_c\rVert\le|\Delta|+|\Delta_b|+\Omega_c+2g.
\end{gathered}
\tag{7}
$$

Each summand in $V$ acts on disjoint transition pairs internally, so its norm is its displayed amplitude; integrate $e^{±2i\omega u}$ and use $|e^{ix}-e^{iy}|\le 2$ for the primitive. Triangle inequality then gives (7).

**Lemma.** If $H(t)=K+V(t)$ is bounded Hermitian, $Q(s)=0$, $\lVert Q\rVert\le q$, $\lVert V\rVert\le v$, then

$$
\lVert U_H(t,s)-e^{-i(t-s)K}\rVert\le q[1+(t-s)(2\lVert K\rVert+v)].
\tag{8}
$$

*Proof.* Integrate $U_H(u,s)^\dagger Q'(u)e^{-i(u-s)K}$ by parts in the Duhamel integral. The boundary has norm $\le q$. Its integrand is $iU_H^\dagger[(K+V)Q-QK]e^{-i(u-s)K}$, whose norm is $\le q(2\lVert K\rVert+v)$. All outside propagators are unitary. The proof is invariant under spectator tensoring. ∎

For the sequence of fresh collisions, leave inactive bath factors in their exact free interaction pictures. Apply (8) in each active two-factor interval and telescope. This proves the all-input, spectator-stable unitary bound

$$
\varepsilon_{\mathrm{RWA},c} \le n(\Omega_c/2+g)/\omega \cdot [1+\tau_0(|\Delta|+|\Delta_b|+3\Omega_c/2+3g)].
\tag{9}
$$

There is no inverse dissipative propagator, no assumption that a bath rate is invariant under a frame change, and no unreported rescaling of the physical clock.

#### 5. Dressed target and the same bath: elimination error

Put $s_c=\sqrt{\Delta^{2}+\Omega_c^{2}}$, $\theta_c=\arctan(\Omega_c/\Delta)$, $W_c=\exp(-i\theta_cY_S/2)$. Then

$$
\begin{aligned}
W_c^\dagger(\Delta Z_S+\Omega_c X_S)W_c &= s_c Z_S,\\
\delta_c &= s_c-\Delta,\\
0\le\Omega_c^{2}/(2\Delta)-\delta_c &\le \Omega_c^4/(8\Delta^{3}).
\end{aligned}
\tag{10}
$$

The last inequality is the certified dispersive remainder of Theorem L.11.2b. In the dressed frame, the contact is **actually** $W_c^\dagger V_{\mathrm{ex}}W_c$, where $V_{\mathrm{ex}}=g(\sigma_+\tau_-+\sigma_-\tau_+)$. Replace it by $V_{\mathrm{ex}}$ only with the explicit bound

$$
\begin{gathered}
\lVert W_c^\dagger V_{\mathrm{ex}}W_c-V_{\mathrm{ex}}\rVert\le 2g\lVert W_c-I\rVert, \\
\lVert W_c-I\rVert=2\sin(\lvert\theta_c\rvert/4).
\end{gathered}
\tag{11}
$$

For all n collisions together the initial/final basis changes occur once, while the interaction remainder integrates over T. Duhamel therefore gives

$$
\varepsilon_{\mathrm{dress},c} \le 2(1+gT)\lVert W_c-I\rVert.
\tag{12}
$$

This conservative bound is sufficient; the exact contact norm is $g\sin(|\theta_c|/2)$, which could improve it.

No time-dependent dressed-basis term has been hidden. $\Omega_{c}$ and $\Delta$ are constant throughout the proved interval, so $W_c^\dagger\dot W_c=0$ there. The derivative of $R(t)$ is exactly the subtraction of $\omega$ in (6). Source ramps lie before the common preparation boundary and after the endpoint; they are not called adiabatic by an inequality $|\Delta|\gg\Omega$ alone. Equations (9)–(12), including boundary dressing and the changed bath contact, are the required finite-window RWA/elimination certificate on the frozen branch.

Undoing the common rotation yields the comparison Hamiltonian

$$
H_{\mathrm{eff},c}/\hbar=(\omega_0+\delta_c)Z_S/2+\omega_b Z_B/2+g(\sigma_+\tau_-+\sigma_-\tau_+).
\tag{13}
$$

This is **exactly the matched target/bath Hamiltonian** of L.11.2b. The diagonal Stark shift is seen by a physically fixed bath through its detuning, not by keeping an arbitrary Lindblad equation fixed and relabeling its rates.

#### 6. Complete channel, actual observable, and response

Let $\nu_c=\omega_0+\delta_c-\omega_b$ and $R_c=\sqrt{g^{2}+\nu_c^{2}/4}$. For a single collision of length $\tau_{0}$ with a ground bath, the full ideal channel has Kraus operators

$$
\begin{aligned}
K_0 &= e^{i(\omega_0+\delta_c+\omega_b)\tau_0/2}|g\rangle\langle g|\\
&\quad +[\cos(R_c\tau_0)-i\nu_c \sin(R_c\tau_0)/(2R_c)]|e\rangle\langle e|,\\
K_1 &= -ig \sin(R_c\tau_0)/R_c \cdot |g\rangle\langle e|.
\end{aligned}
\tag{14}
$$

Directly $K_0^\dagger K_0+K_1^\dagger K_1=I$. Its $n$-fold composition is the complete finite collision channel $\Psi_{c}$. The actual channel $\Phi_{c}$ is obtained by the time-ordered unitary (5), the same prepared bath factors and a partial trace. Both maps are CPTP for every input, including entangled inputs.

Unitary-isometry distance bounds imply

$$
(1/2)\lVert\Phi_c-\Psi_c\rVert_\diamond\le\varepsilon_{\mathrm{RWA},c}+\varepsilon_{\mathrm{dress},c}.
\tag{15}
$$

The endpoint excited effect $E_e=|e\rangle\langle e|$ is the **energy-basis occupation** of the charged target. It is measured by a fixed site-to-energy rail rotation followed by the admitted occupation meter, or equivalently by a positive pointer contact conjugated by that rotation. A pointer-ready state, positive meter time, detector, source compensation and retained binary archive are charged. The output leaves are the actual CP maps $P_m U_{\mathrm{meter}}(\cdot\otimes|0\rangle\langle0|)U_{\mathrm{meter}}^\dagger P_m$. Their sum is TP. Meter calibration error enters the final $\eta_{c}$ below. The target's remaining state, bath and meter/control environments are stored on the declared source side; the retained response alphabet is the binary endpoint, without postselection.

With the common initial state $|e\rangle\langle e|$,

$$
p_c=[1-g^{2} \sin^{2}(R_c\tau_0)/R_c^{2}]^n.
\tag{16}
$$

On any registered frequency interval where the bracket is positive,

$$
\begin{aligned}
\gamma(\omega_T) &= -\tau_0^{-1} \log\bigl[1-g^{2} \sin^{2}(\tau_0\sqrt{g^{2}+(\omega_T-\omega_b)^{2}/4})\, /\\
&\qquad (g^{2}+(\omega_T-\omega_b)^{2}/4)\bigr]
\end{aligned}
\tag{17}
$$

is a smooth nonnegative **endpoint decay law**, and $p_c=e^{-\gamma(\omega_0+\delta_c)T}$. Its susceptibility is $-T\gamma'(\omega_0+\delta_c)p_c$, exactly as L.11.2a. The complete collision channel also has the phase in (14); it is not asserted to equal the particular continuous-time $\omega_T$-only Lindblad semigroup at all times. This distinction preserves the original endpoint equivalence rather than silently promoting it.

For an explicit bath interval $\omega_T-\omega_b\in[-2,0]$, $g=\tau_0=1$, write $x=\sqrt{1+\nu^{2}/4}\in[1,\sqrt{2}]$. Then $p_{\mathrm{col}}=(\sin x/x)^{2}\le\sin^{2}1<1$. The function $\sin x/x$ decreases because $(x\cos x-\sin x)'=-x\sin x<0$ on that interval. Thus $\gamma$ is $C^\infty$ there. A coarse, explicit derivative bound is $|\gamma'|\le 4/\cos^{2}1$, obtained by differentiating $\sin^{2}x/x^{2}$ and using $|dx/d\nu|\le 1/2$. Equation (17), not this coarse bound, is the registered susceptibility. Finite-difference measurements at $\delta\pm h$ can be compared to (17) with error $(\eta_++\eta_-)/(2h)$ plus the directly differentiable ideal finite-difference remainder; channel closeness alone is not claimed to give derivative closeness.

Let $M$ be the ideal binary endpoint measurement channel. Let $C_c^{\mathrm{act}}$ denote the actual complete target-input-to-binary-output channel, including its finite meter $M_c^{\mathrm{act}}$ and any registered actual propagation controls; common commands do not by themselves make the driven meter identical in the two contexts. Require the stated control/meter budgets uniformly as half-diamond bounds over all target/spectator inputs, as supplied by the isometry estimates in Section 8.1. Define $L_{\mathrm{CC}}=C_1^{\mathrm{act}}-C_0^{\mathrm{act}}$. It is complex-linear, Hermitian-preserving and trace-annihilating. Hence it satisfies Definition 30 and every endpoint bias is $\le\lVert L_{\mathrm{CC}}\rVert_{\mathrm{op}}$. For the ideal channels $M\Psi_c$, the excited outcome is $p_c\rho_{ee}$ for arbitrary $\rho$, so their operational difference norm is exactly $|p_1-p_0|$. Equation (15) bounds the complete actual retained-event response, not just one selected preparation.

#### 7. A finite, robustly nonzero instance

Fix the independent values, in seconds,

$$
\begin{aligned}
&n=1,\quad \tau_0=T=1,\quad g=1\ \mathrm{s}^{-1},\quad \Delta=10^4\ \mathrm{s}^{-1},\quad \omega=10^{10}\ \mathrm{s}^{-1},\\
&\omega_0=\omega+\Delta,\quad \omega_b=\omega_0+2\ \mathrm{s}^{-1},\\
&\Omega_0=0,\quad \Omega_1=\sqrt{40004}\ \mathrm{s}^{-1}.
\end{aligned}
$$

Then $\delta_{0}=0$ and $\delta_1=2\,\mathrm{s}^{-1}$ **exactly**, while $\Omega_1/\Delta\approx 0.020001$ and $\gamma\le-\log(\cos^{2}1)\approx 1.2327\,\mathrm{s}^{-1}\ll\Delta$. The leading Stark formula differs from $\delta_{1}$ by $0.0002\,\mathrm{s}^{-1}$; the exact shift, not the truncated one, is used in the endpoint.

The two predictions are

$$
\begin{aligned}
p_0 &= 1-(1/2)\sin^{2}\sqrt{2}\approx 0.512159217968538,\\
p_1 &= \cos^{2}1\approx 0.291926581726429,\\
A_{\mathrm{eff}} &= p_1-p_0\approx -0.220232636242109.
\end{aligned}
\tag{18}
$$

The analytically proved bounds evaluate to

$$
\begin{aligned}
\varepsilon_{\mathrm{RWA},0} &= 0.0000020006,\\
\varepsilon_{\mathrm{RWA},1} &< 0.000205101,\\
\varepsilon_{\mathrm{dress},0} &= 0,\\
\varepsilon_{\mathrm{dress},1} &< 0.039996501.
\end{aligned}
\tag{19}
$$

Their sum is below 0.040203603. These numbers are arithmetic evaluations of the proofs, not fitted errors or numerical propagation at an unresolved frequency.

For additional source/control/readout budgets $\eta_0=\eta_1=0.001$, with uniform half-diamond control/meter bounds for the channel statements and a separately bounded preparation error for the witnessed input, the full actual response obeys

$$
-0.262436240 < A_{\mathrm{actual}} < -0.178029033.
\tag{20}
$$

If the optional quantized-field comparison of Section 9 consumes $\zeta=0.001$ per context **in addition** to those budgets, the conservative interval is

$$
-0.264436240 < A_{\mathrm{actual},Q} < -0.176029033.
\tag{21}
$$

Thus the response remains strictly negative with a finite margin. For the retained binary event algebra,

$$
0.176<\mathrm{CC}(S)<0.265<1/2
\tag{22}
$$

on the quantized extended record; the lower bound is witnessed by $|e\rangle\langle e|$. No full unmeasured quantum-output norm is identified with this binary event-algebra norm.

A reproducible exact check is included below. Rational alternating-series enclosures for $\cos(2)$ and $\cos(2\sqrt{2})$ certify (18), using $A_{\mathrm{eff}}=[2\cos 2-1-\cos(2\sqrt{2})]/4$. Cruder rational $\Omega_1<201$, $\theta_1<201/10000$, and $\sin u\le u$ also certify a slightly wider strictly negative interval without trusting floating-point transcendental calls.

Source/meter uncertainty can be retained directly. A useful norm budget for the Hamiltonian errors over T is

$$
\begin{aligned}
\eta_{\mathrm{dyn}} &\le T(|\delta\omega_0|+|\delta\omega_b|)/2+T|\delta g|+T|\delta\Omega|\\
&\quad +\Omega_{\max}[T|\delta\varphi|+T^{2}|\delta\omega|/2].
\end{aligned}
\tag{23}
$$

Add half trace-norm preparation error for the particular prepared-state witness, and uniform half-diamond meter/switching/control errors for channel and CC claims. One may conservatively include the preparation allowance in the latter total, but preparation-specific accuracy alone is not a channel-norm certificate. Endpoint timing error obeys $|\delta p|\le(\Omega_{\max}+g)|\delta T|$ because the diagonal free Hamiltonians commute with $E_{e}$. Equation (23) makes every requested tolerance a finite specified source-precision requirement; it does not claim such a calibration was performed.

For independent prepared trials, the binary law is already specified. If $N$ trials are taken in each context, Hoeffding and a union bound give a difference-of-means statistical radius $r=\sqrt{2\log(4/\alpha)/N}$ with failure probability $\le\alpha$. For example $N=10{,}000$, $\alpha=.01$ gives $r<.035$, smaller than the margin in (21). Copies, fresh baths, emitter runs and archives must all be charged. This is a prospective likelihood/sample certificate, not empirical validation.

#### 8. Source ownership, finite work and causal timing

1. **Context/command owner.** One retained context label, one copied waveform command, the finite analytic pulse program and its clock coefficients. Copying does not erase $S$. Work/latency of command installation are counted before the source turns on. No context signal reaches the target before the retarded support bound.
2. **Emitter owner.** The local polarization oscillators, source current, finite pulse duration, and gross source battery tariff (L.11.2c.M33). The source-only identity $W_{\mathrm{net}}=W_{\mathrm{rad}}+Q_{\mathrm{loss}}$ must not be mistaken for the total loaded-device cost. Coherent radiation changes the radiative tariff; no phase-independent total-cost optimizer is inferred.
3. **Target/bath owner.** Two charged rails, two neutral rails per fresh bath, positive baselines, the exact contact (4), and the actual source field. Target/bath stored energies are finite; in the fixed code they are bounded by their largest specified eigenvalues plus $\hbar\Omega_{\max}$ and $2\hbar g$. Switching (4) costs at most $2\hbar g$ in absolute mean work per edge, with exact work $\operatorname{tr}[\rho(H_{\mathrm{after}}-H_{\mathrm{before}})]$ retained. It is not silently called bath heat.
4. **External-work service.** The prescribed-current/clocked-control source is a driven open apparatus. Loading of that service is recorded by the actual first-law work, not by summing unloaded radiated power twice. For the finite target/bath model, $W_{\mathrm{drive}}=\int\operatorname{tr}[\rho(t)\partial_tH_{\mathrm{drive}}(t)]\,dt$, with $|W_{\mathrm{drive}}|\le\hbar\Omega_{\max}\omega T$ plus finite preparation/ramp variation, and each control pulse has its own $\int\lVert\partial_tH_{\mathrm{control}}\rVert\,dt$ bound. Those are finite conservative resource ceilings, not optimal work values. The optional field model below gives a finite loaded-source work bound and exact field/matter energy balance as well.
5. **Readout/ready owners.** Pure excited targets, ground bath factors, meter-ready pointers and detector services are consumed supplied resources. Their preparation is part of the source contract; exact pure reset from a faithful finite-temperature bath is never asserted. Used quantum factors remain in $B_{\mathrm{SPENT}}$, and every classical outcome is archived. If cycling is desired, a separate approximate-reset protocol, errors and heat/work record are required.
6. **Timing.** Choose smooth source ramps with $\tau_{r}>0$ and a finite total source pulse whose common link plateau contains target preparation, the complete $T$ interval, and endpoint readout. Each operation has positive duration. A detector that requires finite time is compared with the endpoint using its calibrated instrument map; no zero-latency record is asserted. The source-target signal is retarded Maxwell propagation, and identity extension on unrelated spacelike factors preserves their nonselective marginals.

This populated ledger is finite for every fixed accuracy. It does not claim bounded resources uniformly as the dipole tends to zero, errors tend to zero, or the number of trials diverges. It supplies formal physicalizability, not a minimum over every apparatus.

#### 8.1 Finite common preparation and meter, with the drive left present

Here is a terminating implementation of the errors just allocated, rather than an assumption that fast controls stop the drive. Supply a fresh neutral two-rail logical input packet, one fresh ground neutral bath packet, and a neutral pointer in $|0\rangle$. The logical input is $|e\rangle$ for the displayed witness and arbitrary, possibly spectator-entangled $\rho$ for the channel certificate. A logical swap, compiled from rotations and cross-Kerr controlled-NOTs, transfers this state into the charged receiver code while preserving each pair’s one-excitation sector and the target’s charge; the old state and all its correlations move into a separately retained spent packet. This is a state-transfer operation, not erasure or motion of an electric charge. All added packets and pointers are neutral, so they introduce no omitted charged-source field couplings in Section 9. Every control is common to the two contexts. The channel’s mathematical input is the neutral logical packet; the exact swap supplies its common encoding into the charged target.

Quadratic rail rotations and positive cross-Kerr contacts implement the swap and the endpoint pointer copy. A controlled-$Z$ is $\exp(-i\pi n_1n_{P1})$, with pointer Hadamards giving a controlled-NOT; a fixed target site/energy rotation converts $n_{1}$ to $E_{e}$. Three controlled-NOTs give a swap. Inverse basis rotations are retained when a Lüders target endpoint is specified. Fewer than 100 elementary rotations, number phases and positive occupation contacts suffice for these fixed-size words; no asymptotic synthesis theorem is needed.

For each finite word choose a smooth pulse with integrated dimensionless generator $G$, $\lVert G\rVert\le\pi$ for a one-qubit rotation or a conditional phase. Let $M$ bound the unwanted free-plus-classical-drive code Hamiltonian in inverse seconds during the word, for example the sum of all relevant positive gaps plus $\Omega_{\max}$ and contact norms after removing code scalars. Duhamel gives unitary deviation $\le M\tau_{\mathrm{gate}}$ over a word of total duration $\tau_{\mathrm{gate}}$, regardless of its pulse amplitudes. Thus choose $\tau_{\mathrm{gate}}\le\eta_{\mathrm{gate}}/M$. Positive baselines exceeding each finite negative control eigenvalue make the full second-quantized quadratic Hamiltonian nonnegative. Every resulting coefficient and energy is finite. The source class has no fixed amplitude cap; this argument must be redone if a specific apparatus imposes one.

The field is never switched off or replaced by those controls. In the optional quantized model its unbounded fluctuation coupling is handled by Section 9's vacuum-isometry bound over the **whole** preparation/evolution/copy window. Pointer occupation is read after isolation, with its separate positive detector latency. Drift during later storage cannot alter that already copied pointer bit. All the unitary/isometry estimates hold after arbitrary spectator extension, so they give uniform half-diamond instrument bounds, including every outcome leaf. The separately supplied prepared state has its own half trace-norm error. This proves existence of common finite preparation and meter services at the stated tolerances. It does not claim those gates are practical in a particular laboratory.

#### 8.2 A fully populated clock and additional-error allocation

Take the emitter pulse (L.11.2c.M18) with total source duration $T_{s}=7/2$ seconds and ramp $\tau_{r}=1/4$ second. The complete smeared link is on its harmonic plateau well before $t=1$ second: its largest delay is at most $[R+a+b+\ell]/c<1.001\times 10^{-8}$ seconds in this witness. Start the common preparation word at $t=1$. Let $M_{p}$ and $M_{m}$ be the finite unwanted-Hamiltonian bounds specified in Section 8.1 for its explicit preparation and pointer-copy words, and take

$$
\begin{aligned}
\tau_p&=\min(1/100,1/(2000\max(1,M_p))),\\
\tau_m&=\min(1/100,1/(2000\max(1,M_m)))\ \text{seconds},
\end{aligned}
$$

where the numbers 1 in max use the inverse-second reference unit. Their unitary and uniform half-diamond errors are each at most 0.0005. The one-second collision starts at $t_*=1+\tau_p$ and ends at $2+\tau_p$. The common pointer-copy ends before 2.02; a neutral-pointer occupation detector and archive service of duration 0.1 seconds releases the record before 2.12. All these events are in the plateau. Source phase in (1) is offset by $\omega t_*$ to make the interaction-clock waveform $\cos(\omega t)$. Source radiation clears the target long before the $T_{\mathrm{all}}=4$-second field bound ends.

Supply the exact nominal model coefficients, ideal ready packet/bath source states and the admitted occupation detector; no empirical accuracy is inferred from those physical-theory inputs. Allocate $\eta_{p}=0.0005$ and $\eta_{m}=0.0005$, hence $\eta_{c}=0.001$ for each context. They are uniform gate-isometry bounds, so the channel-norm and particular-input claims use the same allowance. If coefficient, input-source or detector errors are submitted instead, subtract their stated contributions from this finite budget or widen (20)–(22). In the quantum completion reserve $\zeta=0.001$ additionally, as explicitly used in (21). One complete run therefore has a fixed finite causal schedule and a fully allocated nonzero margin.

#### 9. Optional regularized electromagnetic-field certificate and loaded work

This section specifies a stronger model in which the omission of quantum field fluctuations and target radiation is quantitatively controlled. It is not an import of a microscopic atom theorem, a claim of unregularized QED, or a requirement added to the original target.

#### 9.1 Physical regularization, finite variance, and the small-dipole choice

Use the nonnegative, compact, $C^3$ target profile

$$
f_b(x)=[3465/(512\pi b^{3})](1-|x|^{2}/b^{2})^4\quad\text{for } |x|<b,\ \text{and } 0\ \text{otherwise.}
\tag{24}
$$

Its integral is one because $\int_0^1 r^{2}(1-r^{2})^{4}\,dr=128/3465$. Let $F_b(k)$ be its radial Fourier transform. The transition polarization is exactly (3); its Fourier transform is $F_b(|k|)\operatorname{sinc}(k_x\ell)e^{-ik\cdot r_T}$. Its Coulomb/longitudinal selfenergy and its transverse polarization selfenergy are finite scalars, because $X^{2}=I$. The neutralizing background fixes the identity charge sector and adds only its specified static energy and calibration fields.

For the usual two transverse polarizations, write the smeared free electric operator as $\hat E_g=i[a(G)-a^\dagger(G)]$, with continuum commutators $[a_\lambda(k),a^\dagger_\mu(k')]=\delta_{\lambda\mu}\delta^{3}(k-k')$ and coefficient

$$
\begin{aligned}
G_\lambda(k) &= \sqrt{\hbar c|k|/(2\varepsilon_{\mathrm{vac}}(2\pi)^{3})}\, (e_x\cdot\varepsilon_\lambda(k))\\
&\quad F_b(|k|)\operatorname{sinc}(k_x\ell)e^{-ik\cdot r_T}.
\end{aligned}
$$

Thus the vacuum variance $C_g^{2}=\lVert G\rVert^{2}$ obeys

$$
C_g^{2}\le C_b^{2}:=\hbar c/(6\pi^{2}\varepsilon_{\mathrm{vac}})\int_0^\infty k^{3}|F_b(k)|^{2}\,dk.
\tag{25}
$$

The angular polarization integral is $\int(1-n_x^{2})\,d\Omega=8\pi/3$. This is an exact finite-source normalization, not an unspecified vacuum noise coefficient.

For a completely explicit bound, let $f_{1}$ denote (24) at $b=1$. Parseval and Cauchy–Schwarz give

$$
\begin{aligned}
\int u^{3}|F_1(u)|^{2}\,du &\le 2\pi^{2} \lVert f_1\rVert_2 \lVert\nabla f_1\rVert_2,\\
\lVert f_1\rVert_2^{2} &= 24255/(8398\pi),\\
\lVert\nabla f_1\rVert_2^{2} &= 10395/(221\pi).
\end{aligned}
$$

Consequently use the finite registered number

$$
\begin{aligned}
C_*^{2} &= \hbar c/(3\varepsilon_{\mathrm{vac}} b^{4}) \cdot \sqrt{(24255\cdot 10395)/(8398\cdot 221)}/\pi,\\
C_g &\le C_b\le C_*.
\end{aligned}
\tag{26}
$$

As an independent ultraviolet-tail certificate, $\Delta^{2}f_1=(3465/(512\pi))(720-3360r^{2}+3024r^{4})$ inside the unit ball; the first three boundary derivatives vanish, so no $\delta$ term occurs. Its $L^1$ norm is at most $A=72765/2$. Hence $|F_1(u)|\le\min(1,A/u^{4})$, and $\int u^{3}|F_1(u)|^{2}\,du\le A/2$. The same bound proves finiteness of every field moment used below, including the energy-weighted one.

Choose a finite full active/preparation/readout horizon $T_{\mathrm{all}}$, e.g. 4 seconds, and an error $\zeta=0.001$. The independently specified target separation is

$$
\ell=\min[10^{-6}/k,\ \hbar\zeta/(T_{\mathrm{all}} |q| C_*)],\quad d=q\ell.
\tag{27}
$$

It is strictly positive. Both target modes keep the same primitive charge $q$; it is their registered geometrical dipole that is small. The source amplitude in (1) is then large but finite. This is a controlled family of physical model parameters, not an effective dipole inferred from the wanted endpoint. For indicative SI values, $b=.01c/\omega$ gives $C_*\approx 0.7394$ V/m, $\ell\approx 2.23\times 10^{-19}$ m and $E_{\mathrm{av}}\approx 5.92\times 10^{5}$ V/m. These unusually conservative ideal-source values are not a hardware recommendation or a measurement. The analytic definitions (24)–(27) determine the formal instance; rounded SI examples are not proof inputs.

#### 9.2 Hamiltonian, gauge transport and well-posedness

In the multipolar representation the actual Hamiltonian is

$$
\begin{aligned}
H_{Q,c}(t) &= H_c(t)+H_f-d X_S \hat E_g+E_{\mathrm{self}} I+H_{\mathrm{other\,controls}}(t),\\
H_f &= \sum_\lambda\int\hbar c|k|\, a^\dagger_\lambda(k)a_\lambda(k)\,d^{3}k.
\end{aligned}
\tag{28}
$$

The classical longitudinal source coupling is the $-dXE_{L}$ part of (2); the source-created transverse displacement supplies the remaining $-dXE_T$. $E_{\mathrm{self}}=(d^{2}/(2\varepsilon_{\mathrm{vac}}))\int|g_{b,\ell}(x)e_x|^{2}\,dx$ includes both projections and is finite. Complete the transverse field square; it is a nonnegative square plus its explicit scalar. The remaining matter/contact Hamiltonian has the positive baselines already supplied.

This representation is related to the smeared Peierls link by the exact unitary

$$
U_{\mathrm{PZW}}=\exp\Bigl[-(i/\hbar)\int P_T\cdot A_T\, dx\Bigr].
\tag{29}
$$

Its sign is fixed so the Peierls link phase is removed from hopping. Conjugation shifts the canonical transverse field momentum by $P_{T}$, giving $-P_T\cdot E_T$ and $P_T^{2}/(2\varepsilon_{\mathrm{vac}})$; longitudinal Coulomb energy gives $P_L^{2}/(2\varepsilon_{\mathrm{vac}})$ and the source term $-P_T\cdot E_L$. Because the supports of the source and target polarizations are disjoint, no unidentified local overlap term appears. Density contacts (4) commute with (29). This is a gauge map of the declared regularized charged-graph/field model. It is not an assertion that every continuum atom projects to that model.

The vacuum-reference preparation, complete instrument and spectator input are specified in the representation (28). In Peierls coordinates they are transported by (29), including the meter effects. A bare product in one gauge is not silently called a product in the other. Gauge-covariant hopping controls and occupation contacts implement the transported charged-rail word; no measurement of an unknown field phase is inserted. The dressed ready source has finite energy, since its conditional field displacement has finite norm and energy-weighted norm. It is a supplied ready resource; no exact finite-temperature purification is inferred.

The form factors have $\lVert G\rVert<\infty$ and $\lVert G/\sqrt{c|k|}\rVert<\infty$. The inequalities

$$
\begin{gathered}
\lVert a(G)\psi\rVert\le\lVert G/\sqrt{\hbar c\lvert k\rvert}\rVert\,\lVert H_f^{1/2}\psi\rVert, \\
\lVert a^\dagger(G)\psi\rVert^{2}=\lVert a(G)\psi\rVert^{2}+\lVert G\rVert^{2}\lVert\psi\rVert^{2}
\end{gathered}
$$

make the interaction infinitesimally form-bounded relative to $H_{f}$. The semibounded closed quadratic form, after the displayed scalar, defines a self-adjoint Hamiltonian. The finite smooth classical/control terms are bounded on the invariant matter code and give a well-defined finite-time propagator. Finite-photon smooth vectors are a common form core. The same construction follows by field-mode/energy cutoffs followed by the dominated form limit. No operator norm of Ê_g is asserted.

#### 9.3 The complete-state Duhamel certificate

Work in the coherent displacement frame of the conserved classical source. Its classical mean is exactly the retarded Maxwell solution of Theorem L.11.2c; the reference fluctuation field starts in vacuum. Include preparations, common controls, pointers, spent factors and spectators in the finite matter system. In the comparison evolution with $-dX\hat E_g$ omitted, the fluctuation field stays vacuum and $\lVert X\rVert=1$ throughout all conjugated control segments. Duhamel on that input isometry gives

$$
\begin{aligned}
&\sup_{\lVert\psi\rVert=1} \lVert[U_Q-U_{\mathrm{reference}}](\psi\otimes|\mathrm{vac}\rangle)\rVert\\
&\quad \le(1/\hbar)\int_0^{T_{\mathrm{all}}} \lVert d X \hat E_g U_{\mathrm{reference}}(t)(\psi\otimes|\mathrm{vac}\rangle)\rVert\,dt\\
&\quad \le T_{\mathrm{all}} |d| C_g/\hbar\le\zeta.
\end{aligned}
\tag{30}
$$

It holds for every spectator-entangled input. Partial trace and any instrument therefore have half diamond distance at most $\zeta$ on the prepared-field channel. This is the precise limited-input certificate appropriate to a supplied vacuum/coherent field. It is not a global norm estimate between two unbounded-field unitaries, and it does not cover arbitrary unregistered incoming photons.

Source turn-on and target preparation can be included in this same full horizon. The comparison target is overwritten by the common ready-state swap on the plateau; prior target information goes to a spent packet. The actual quantum field need not be reset at that intermediate boundary. Its accumulated discrepancy is already bounded by (30). Independent repeated trials require independently supplied full ready sources (including the field input and spent-output isolation), rather than assuming that one finite bath can be reused.

#### 9.4 Energy and source loading are bounded separately

Channel closeness does not control an unbounded field energy. Instead the exact Heisenberg annihilator integral, using $\lVert X\rVert=1$, gives in the displaced frame

$$
\begin{aligned}
\sqrt{\langle N_f\rangle_t} &\le |d|t\lVert G\rVert/\hbar,\\
\langle H_f\rangle_t &\le (dt/\hbar)^{2} C_E^{2},\\
C_E^{2} &:= \sum_\lambda\int\hbar c|k|\, |G_\lambda(k)|^{2}\,d^{3}k<\infty.
\end{aligned}
\tag{31}
$$

A direct derivation integrates $\dot a_\lambda(k)=-ic|k|a_\lambda(k)+{}$ a bounded-system source proportional to $dG_\lambda(k)/\hbar$, applies it to the initial vacuum vector, and uses Minkowski. This is an independent energy proof. In particular $C_E^{2}\le\hbar^{2}c^{2}/(6\pi^{2}\varepsilon_{\mathrm{vac}}b^{5})\int u^{4}|F_1(u)|^{2}\,du$, with the finite explicit bound $1/5+A^{2}/3$ for the last integral. Undoing the source displacement $\alpha$ gives

$$
\sqrt{\langle H_f\rangle_{\mathrm{physical}}}\le\sqrt{E_{\mathrm{classical}}}+|d|t\, C_E/\hbar.
\tag{32}
$$

The target's radiative loading and its interference with the incident field are included in (32), rather than ignored as part of an unloaded radiation estimate.

For completeness, the prescribed classical current has a finite loaded **external-work service**. In Coulomb gauge its transverse source Hamiltonian is $i\hbar[a^\dagger(\beta(t))-a(\beta(t))]$, with $\beta=\dot\alpha+i(c|k|)\alpha$. For $j_{\mathrm{source}}=\dot pf_ae_x$,

$$
\begin{gathered}
\lVert\beta(t)\rVert=B_a|\dot p(t)|, \\
\lVert\dot\beta(t)\rVert=B_a|\ddot p(t)|, \\
B_a^{2}=[6\pi^{2}\hbar\varepsilon_{\mathrm{vac}}c]^{-1}\int_0^\infty k|F_a(k)|^{2}\,dk<\infty, \\
\lVert\alpha(t)\rVert\le B_a\int_0^t|\dot p(u)|\,du.
\end{gathered}
\tag{33}
$$

The Fourier coefficient follows directly from the quantized A normalization and transverse projection. The smooth compact source makes all these norms finite at zero and infinite k. The expectation of the source power obeys the conservative bound

$$
\lvert\langle\partial_tH_{\mathrm{source}}\rangle\rvert\le 2\hbar\lVert\dot\beta\rVert[\lVert\alpha\rVert+\zeta+1].
\tag{34}
$$

Add the finite longitudinal loading variation $|d|\int|\dot E_{L,\mathrm{av}}|\,dt$, the total variation of the specified source Coulomb/selfenergy scalars, and the separate finite local-control/contact variations. Thus one finite gross mean-work ceiling is the integral of (34) plus those terms. The same specified Hamiltonian gives exact mean first-law accounting by $d\langle\operatorname{tr}(\rho H)\rangle/dt=\langle\partial_tH\rangle$ when the external pulse is smooth, with the usual finite energy jumps for switched contacts. Field output, matter output, stored baseline, spent-bath energy and mechanical loss have different owners. Do not add M33, $W_{\mathrm{rad}}$ and (34) as three expenses: M33 is the classical unloaded actuator bound; (33)–(34) are the loaded field/control-service bound for this stronger model. Each is used in its own declared realization.

For first-law statements restore every dropped scalar: the rail terms $\hbar\nu_TN_T$ and $\hbar\nu_BN_B$, all added positive control baselines, the scalar $\hbar gI$ in the code restriction of (4), the source Coulomb scalar, and $E_{\mathrm{self}}$. The fixed neutralizer has been included in the total charge model of (3); $E_{\mathrm{self}}$ in (28) is the total longitudinal-plus-transverse polarization selfenergy after that neutralization. There is no second background selfenergy entry to add. Any implementation with an additional inert charged support must register its independent constant/variable energy separately. These restored terms have zero channel effect but retain their actual stored-energy and switching-work effects.

These are finite energy and mean-work records for an externally prescribed current and finite-time control service. They do not prove a finite autonomous microscopic battery implements every c-number current exactly. If a hard finite photon/energy ceiling is required, (31)–(32) yield finite cutoff tail probabilities by Markov; a projected ready-state/channel approximation must add its resulting trace-distance error before using (21). No bounded-resource uniform limit or exact thermal reset of a vacuum continuum is claimed.

## **L.11.3 Parameter and Feasibility Status**

Equations (L.87)--(L.90) give conditional scaling only. A quantitative implementation requires a real differential dynamic polarizability or a valid allowed-transition matrix element, a positive drive frequency, a detuning and linewidth satisfying the perturbative inequality, a field solution consistent with geometry and boundary conditions, and a measured rate susceptibility. None is supplied here, so no field threshold, probability bias, dominance ratio, or detection time is claimed.

## **L.11.4 Worked-Example Status**

A valid worked example uses a measured differential dynamic polarizability through allowed optical states, a positive drive frequency, $|\Delta|\gg\max(\Omega_R,\Gamma)$, a retention time when converting power to stored energy, and a specified open-system likelihood.

### **L.11.4a Error-Budget Status**

A numerical error budget and detection time require the implementation and likelihood data listed in Section L.11.3.

## **L.11.5 Relationship to Appendix S: Gravitational Self-Limitation**

If a CC implementation has a measured nonzero power ledger, its localized energy and boundary fluxes contribute to the complete stress-energy tensor without duplicate entries. Appendix S studies conditional feedback models for such a registered source.

### **Division of Labor:**

**Appendix L (This Appendix): Conditional forward direction**
- Specifies which source, retention, geometry, and target-response data a quantitative implementation requires
- Enters localized energy and radiation once in the complete stress-energy ledger
- Supplies conditional AC-Stark and gravitational scaling relations
- Leaves the electromagnetic-to-gravitational response ratio undetermined without implementation data
- Takes $P_{\text{agg}}$ as registered input power

**Appendix S: Feedback direction**
- Given $P_{\text{context}} \to$ energy density $u_{\text{context}} \to$ gravitational potential
- Gravitational potential → time dilation gradient $\Delta\tau_d$ across target (Section S.3)
- Time dilation → phase decoherence → reduced effective CC (Section S.7)
- Identifies an optimum of the truncated utility in its declared validity regime (Section S.4); stationary concentration additionally requires the potential identification and low-noise detailed-balance hypotheses of Theorem D.5
- Provides feedback analysis: gravity → limits CC

### **Complementary Nature:**

On the joint Appendix S branch, the feedback construction requires:

1. a specified constitutive power law $P_{\text{context}}(\text{CC})$;
2. a retention fraction giving $u_{\text{context}}=\eta_{\text{ret}}P_{\text{context}}\tau_c/V_S$;
3. a weak-field source geometry mapping $u_{\text{context}}$ to $\Delta\tau_d$;
4. a stochastic or unresolved-phase model mapping $\Delta\tau_d$ to decoherence;
5. a calibrated law mapping coherence loss to $\text{CC}_{\text{eff}}$; and
6. a specified PCE objective whose minimizer exists in the feasible domain.

The bounded-bias ceiling is independent of those gravitational hypotheses, Theorem 39 supplies only its endpoint-complete consequence, and operational causality additionally requires Theorem 39c. Resource, weak-field, and collapse ceilings bound only the branches satisfying their respective assumptions.

### **Quantitative Connection:**

On the constitutive branch of Appendix S, assume
$$
P_{\text{context}}(\text{CC})
=
A\left[\frac{\text{CC}}{\alpha-\text{CC}}\right]^2,
\qquad
A>0,
\qquad
0\leq\text{CC}<\alpha.
$$
If a fraction $\eta_{\text{ret}}\in(0,1]$ of the supplied energy remains localized for $\tau_c$, then
$$
u_{\text{context}}
=
\frac{\eta_{\text{ret}}P_{\text{context}}\tau_c}{V_S}.
$$
For a uniform spherical source of radius $R_S=(3V_S/4\pi)^{1/3}$, register two clocks on the same outward radial segment from $r$ to $r+L_q$, with $r\ge0$, $L_q>0$ and $r+L_q\le R_S$. Require the retained density $\eta_{\mathrm{ret}}P_{\mathrm{context}}\tau_c/V_S$ to be stationary throughout a clock-comparison interval of coordinate duration $\tau_c$. This is a prepared or steady retention branch; an input accumulating from zero needs its time-dependent density integrated explicitly. On the stated weak-field, isotropic active-density branch, put
$$
B:=\frac{4\pi G}{3c^2}(1+3w_c)
\frac{\eta_{\mathrm{ret}}P_{\mathrm{context}}\tau_c}{V_S}.
$$
The interior potential gradient is $\Phi'(x)=Bx$, so its signed endpoint difference is
$$
\Delta\Phi_{\mathrm{diff}}
=\int_r^{r+L_q}Bx\,dx
=B\left(rL_q+\frac{L_q^2}{2}\right).
$$
At first order in the weak gravitational potential, integration over the common coordinate duration $\tau_c$ gives
$$
\Delta\tau_d=K_{\mathrm{ret}}P_{\mathrm{context}},
\qquad
K_{\mathrm{ret}}:=
\eta_{\mathrm{ret}}\frac{4\pi G}{3c^4}(1+3w_c)
\frac{rL_q+L_q^2/2}{V_S}\tau_c^2.
$$
For $r>0$ and $L_q/r\ll1$, dropping the $L_q^2/2$ term gives the local-gradient approximation with relative geometric error $L_q/(2r)$. At $r=0$ that approximation loses the leading nonzero quadratic term. Other clock orientations, source-boundary crossings or finite-potential corrections require the corresponding geometric response certificate.

For the ideal-retention value $\eta_{\text{ret}}=1$, choose $r=0.05\,\mathrm m$, which lies inside the sphere of volume $10^{-3}\,\mathrm m^3$. With $\tau_c=0.1\,\mathrm s$, $w_c=1/3$, and $L_q=10^{-9}\,\mathrm m$,
$$
K_{\text{ret}}
\approx
3.46\times10^{-53}\,\mathrm{s/W},
\qquad
\Delta\tau_d
\approx
6.92\times10^{-52}\,\mathrm s
$$
at $P_{\text{context}}=20\,\mathrm W$.

The dimensionless phase scale is
$$
\left|\frac{\Delta E\,\Delta\tau_d}{\hbar}\right|.
$$
A value of order unity can reduce ensemble coherence only when a specified noise or unresolved-phase distribution converts phase dispersion into dephasing. The power divergence, calibrated dephasing response, and Schwarzschild ceiling are separate conditional restrictions.

### **Conditional Results Imported from Appendix S:**

**Section S.1:** The rational power law is a registered constitutive branch, with positive parameters and $\mathrm{CC}<\alpha$.

**Section S.2:** Local gravity is sourced by retained energy $\eta_{\text{ret}}P_{\text{context}}\tau_c$ entered once in the complete stress-energy ledger.

**Section S.3:** The weak-field proper-time formula is conditional on the specified source geometry and operating region.

**Section S.4:** A self-limiting optimum exists only after the utility, attenuation response, and feasible domain are specified.

**Section S.5:** The deterministic endpoint bound and the Schwarzschild resource ceiling are independent restrictions; neither derives the other.

**Section S.6:** Alice-side local CPTP modulation may change joint correlations but preserves Bob's marginal exactly.

**Section S.7:** A proper-time difference produces a phase. Dephasing requires a noise or unresolved-phase ensemble and a calibrated response law.

**Section S.8:** Complementarity requires a mutually exclusive energy decomposition; covariant conservation alone does not prevent duplicate ledger entries.

Appendix S therefore supplies conditional feedback models and resource ceilings.

## **L.12 Causal Information as the Fundamental Basis of CC Influence**

### **L.12.1 Overview: Four Levels of Description**

The discussion separates a physical carrier model, an experimental control problem, the target information available to the controller, and a timing model. A measurable shift still requires a calibrated carrier and response.

**Technical ledger.**

Sections L.11.1–L.11.4 define a conditional AC-Stark implementation class. A quantitative realization still requires the source, geometry, detuning, susceptibility, and likelihood data listed in Section L.11.3. The logical levels used below are:

|Level |Object |Status |
|:------------------------|:----------------------------------------------------------------|:--------------------------------------------------------------|
|**Field-theoretic** |Dipole Hamiltonian and conditional rate expansion |Valid on the registered EM-source and perturbative branches |
|**Operational** |Context-dependent control policy and observed endpoint |Requires a carrier-to-endpoint response calibration |
|**Information-theoretic** |Mutual information and posterior decision reward |Defined for the normalized causal joint law |
|**Temporal model** |Clock-rate perturbation and perspective kernel |Requires the constitutive response certificates of Section L.12.3 |

Under causal separation, a strict target-conditioned advantage beyond the best information-free policy implies positive causal information. Context refinement enlarges the policy set and cannot lower the optimal decision reward. The Appendix N acceleration result remains conditional on its detector-response, active-refresh, saturation, and CC-to-UCT allocation branches.

-----

### **L.12.2 The Causal Information Content of the Context State**

#### **L.12.2.1 Epistemic Status of Target Parameters**

Let
$$
\theta_T:=(\omega_{\text{TLS}},\vec d_{\text{TLS}},\chi_k,\rho_T)
$$
collect the target parameters and its time-indexed state relevant to the registered control interval. Relative to the aggregate's information, assign a prior probability law $\pi$ on a specified measurable parameter space $\Theta_T$. Prior independence between $\theta_T$ and $\text{context}_S$ is an additional causal-separation hypothesis; it does not follow from absence of direct contact when common causes or initial correlations are present.

Information about $\theta_T$ may enter the context through causal ND-RID records or common-cause records admitted by the causal model. For ordinary unassisted classical communication through a channel with output dimension $d_0$, the Holevo bound limits a use to $\ln d_0$ nats. Applying this bound to an acquisition history requires the same protocol class, with all decoder side information and conditional increments accounted for; preshared entanglement or an extra side channel is not included. Theorem E.2 sharpens this to $C_{\max}(f_{RID})<\ln d_0$ on the refresh/minorization branch, while Proposition E.2a gives $C_{\max}\le\ln d_0-\ln2$ on the completed binary reset-support branch; Equation (E.15) gives equality at $2\ln2$ only on the minimal $d_0=8$ PCE residual-budget saturation branch. If an information-resolving step also performs a registered reset satisfying Definition 28, Theorem 31 gives $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)$, with a positive uniform floor inferred from this entropy bound only under $H_q(P\mid R)\ge h_{\min}>0$. If the analysis uses $\text{context}_S(t)$ as a minimal sufficient statistic for $\theta_T$, that sufficiency and minimality are branch assumptions to be verified for the chosen joint law and likelihood.

#### **L.12.2.2 The Causal Interaction Ensemble**

Let $\mathcal H_{ST}(t)=(N_1,\ldots,N_K)$ be the ordered ND-RID history up to time $t$. Let $p_K=\mathbb P(|\mathcal H_{ST}(t)|=K)$, let $\nu_K$ be the conditional probability law of the ordered history given $K$, and let
$$
Q_K(dc,d\theta\mid h)
$$
be the conditional joint probability kernel of $C_t:=\mathrm{context}_S(t)$ and $\Theta:=\theta_T$ given history $h$. Define
$$
\mathcal P_{causal}(dc,d\theta)
:=\sum_{K=0}^\infty p_K
\int Q_K(dc,d\theta\mid h)\,\nu_K(dh).
\tag{L.92}
$$
Assume $p_K\geq0$, $\sum_Kp_K=1$, and that every $Q_K$ and $\nu_K$ is a probability kernel or probability measure. Then $\mathcal P_{causal}$ is a normalized probability measure. Factorization
$$
Q_K(dc,d\theta\mid h)
=Q_K^C(dc\mid h)Q_K^\Theta(d\theta\mid h)
$$
may be used only on a branch that explicitly assumes conditional independence given the history.

<a id="definition-l121-causal-information-as-target-conditioned-relational-information"></a>**Definition L.12.1 (Causal Information as Target-Conditioned Relational Information).** The **causal information content** of aggregate $S$ about target $T$ at time $t$ is the mutual information (in nats) between $S$'s context state $\text{context}_S(t)$ (Definition L.1) and the target configuration $\theta_T$ relevant for CC coupling, under the joint law $\mathcal{P}_{\text{causal}}$ induced by the causal ND-RID interaction history $\mathcal{H}_{ST}(t)$. Formally:

$$
\mathcal{I}(S \to T,t) := I_{\mathcal{P}_{\text{causal}}}\!\left(\text{context}_S(t);\theta_T\right) \leq I(S:T)_t \leq \mathcal{I}_{\text{rel}}(S)_t \tag{L.93}
$$

Assume that $\text{context}_S$ and $\theta_T$ are outputs of local channels applied to the same joint $S$-$T$ law and that $T$ is a subsystem of the environment $E$. Data processing then gives
$$
\mathcal I(S\to T,t)\leq I(S:T)_t\leq I(S:E)_t=\mathcal I_{\mathrm{rel}}(S)_t.
$$
For an acquisition bound, register one target variable $\Theta$ and a classical retained history $H_k=(H_0,Y_1,\ldots,Y_k)$ with $I(\Theta;H_0)=0$. Assume at most $K$ uses, that every receiver side record is included in this history, and that each conditional encoding/measurement is in the unassisted classical protocol class with certified increment
$I(\Theta;Y_k\mid H_{k-1})\le C_{\max}$.
If the retained context is obtained from that history without an additional target-correlated input, then chain rule and data processing give
$$
\mathcal I(S\to T,t)\le I(\Theta;H_K)
=\sum_{k=1}^K I(\Theta;Y_k\mid H_{k-1})
\le KC_{\max}.
$$
The record may pad unused slots by constant symbols. A capacity belonging to a different assistance or memory model cannot supply the conditional-increment bound. Pre-existing or common-cause mutual information must be charged to the initial history rather than inferred from the number of direct interactions. For every normalized joint law, $\mathcal I(S\to T,t)>0$ exactly when its two variables are not independent.

*Conditional connection to target mass:* The inequality $I(S:T)_t\le\mathcal I_{\mathrm{rel}}(T)_t$ is branch independent. Only when all compared targets share $\mathfrak B_{mass}$ and one universal mass-per-information coefficient may Theorem N.5 rewrite that upper scale in terms of $m_T$. Off that branch, no monotone heavier-target conclusion follows; actual causal information remains limited by causal history and channel capacity.

<a id="lemma-l121-zero-causal-information-under-causal-separation"></a>**Lemma L.12.1 (Zero Causal Information under Causal Separation).** Let $C_t:=\text{context}_S(t)$ and $\Theta:=\theta_T$. Assume that the initial law factorizes across the relevant $S$ and $T$ records and that the causal model contains no common-cause path into both $C_t$ and $\Theta$. If there is also no directed ND-RID path between the two records up to time $t$, then $\mathcal I(S\to T,t)=0$.

*Proof.* Under the initial-factorization and no-common-cause hypotheses, causal separation gives
$$
\mathcal P_{\mathrm{causal}}(C_t,\Theta)
=\mathcal P_{\mathrm{causal}}(C_t)\mathcal P_{\mathrm{causal}}(\Theta).
$$
Therefore
$$
\mathcal I(S\to T,t)
=\int \log\!\left(
\frac{d\mathcal P_{C_t,\Theta}}
{d(\mathcal P_{C_t}\otimes\mathcal P_\Theta)}
\right)d\mathcal P_{C_t,\Theta}
=0.
$$
Without the two separation hypotheses, an empty direct interaction history does not imply the displayed factorization. ∎

#### **L.12.2.3 Temporal Ordering of Causal Information: The Arrow of Time Constraint**

Let $(\mathcal F_t)_{t\ge0}$ be the filtration generated by ND-RID records available by time $t$. Assume the context process is adapted, so $\text{context}_S(t)$ is $\mathcal F_t$-measurable. The path-ratio branch of Theorem O.3 supplies a statistical time asymmetry when its common-measure and entropy-production hypotheses hold; it does not establish adaptedness.

<a id="corollary-l122-past-record-dependence-and-lossless-refinement-monotonicity"></a>**Corollary L.12.2 (Past-Record Dependence and Lossless-Refinement Monotonicity).** The adapted context at time $t$ uses only records in $\mathcal F_t$. For the information comparison, register the same target random variable $\Theta$ and one joint law of $(\Theta,C_1,C_2)$, where $C_j=\mathrm{context}_S(t_j)$ and $t_2\ge t_1$. If $C_1=g(C_2)$ almost surely for a measurable map $g$, then
$$
I(\Theta;C_1)\le I(\Theta;C_2).
$$
This is the comparison of $\mathcal I(S\to T,t_j)$ only when both occurrences refer to that common target variable and joint law. Replacing the target by its evolving state at each time is a different comparison and requires an additional dynamical information certificate. Without recoverability, retained information may also decrease under compression, forgetting or overwrite.

*Proof.* Adaptedness gives the past-record statement. The deterministic relation gives the Markov chain $\Theta\to C_2\to C_1$ and hence the displayed data-processing inequality. No relation between $I(C_1;\Theta_{t_1})$ and $I(C_2;\Theta_{t_2})$ follows from this argument when the two target variables differ. ∎

-----

### **L.12.3 Temporal Engineering as the Physical Substrate**

#### **L.12.3.1 CC Influence as Temporal Wave Modulation**

On the clock-variable branch of Appendices O and P, write the local cycle rate as
$$
\tau(x_T,t)
=
\tau_{\text{medium}}
\left[1+\delta\tau_{\text{CC}}(x_T,t)\right].
\tag{L.94}
$$
Here $\tau_{\text{medium}}=\hbar/\langle\hat H_{\text{eff}}\rangle$ and $\delta\tau_{\text{CC}}$ is dimensionless. The Fourier representation of Theorem L.8 decomposes a sufficiently regular modulation into frequency components, whose physical carriers are identified branch by branch:

- A high-frequency component is electromagnetic only on a branch with a conserved charge current whose time-dependent multipole produces a Maxwell solution with $F_{\mu\nu}\ne0$. The AC-Stark response then additionally requires the detuning and target-coupling hypotheses of Section L.11.
- A low-frequency component contributes to gravitational time dilation only through the complete localized stress-energy tensor. Supplied work contributes to the local source only to the extent recorded by the retention and boundary-flux ledger.

Causal information governs a decision-theoretic target-conditioned advantage only under the joint-law and causal-separation hypotheses of Definition L.12.1 and Lemma L.12.1. Positive mutual information permits posterior-conditioned control; it does not by itself establish a carrier field or a nonzero target response.

<a id="proposition-l120-conditional-temporal-engineering-precision-bound"></a>**Proposition L.12.0 (Conditional Temporal-Engineering Precision Bound).** Let $\omega_{\mathrm{TLS}}>0$. In the EM/AC-Stark branch, require a clock-response certificate identifying the normalized cycle perturbation with the normalized TLS period change:
$$
1+\delta\tau_{\mathrm{CC}}
=\frac{\tau(x_T,t)}{\tau_{\mathrm{medium}}}
=\frac{T_{\mathrm{TLS}}(\omega_{\mathrm{TLS}}+\delta_{\mathrm{Stark}}^{\mathrm{real}})}
{T_{\mathrm{TLS}}(\omega_{\mathrm{TLS}})},
\qquad T_{\mathrm{TLS}}(\omega)=\frac{2\pi}{\omega}.
$$
This identification is additional to the convention $\tau_{\mathrm{medium}}=\hbar/\langle H_{\mathrm{eff}}\rangle$. Assume a carrier certificate gives
$$
|\delta_{\mathrm{Stark}}^{\mathrm{real}}|
\le\eta_{\mathrm{res}}\delta_{\mathrm{Stark}}^{\max},
\qquad0\le\eta_{\mathrm{res}}\le1,
\qquad0\le\delta_{\mathrm{Stark}}^{\max}\le q\omega_{\mathrm{TLS}},
\quad0<q<1.
$$
Then
$$
|\delta\tau_{\mathrm{CC}}|
\le\eta_{\mathrm{res}}
\frac{\delta_{\mathrm{Stark}}^{\max}}{\omega_{\mathrm{TLS}}}
+\frac{\eta_{\mathrm{res}}^2}{1-q}
\frac{(\delta_{\mathrm{Stark}}^{\max})^2}{\omega_{\mathrm{TLS}}^2}.
\tag{L.95}
$$
The second term explicitly bounds the quadratic remainder. Context refinement orders the optimal decision reward only under Proposition L.12.1's policy-inclusion premise; neither scalar mutual information nor complexity alone orders this clock response.

*Proof.* The positive-frequency certificate gives

$$
\delta\tau_{\mathrm{CC}}=-d/(\omega_{\mathrm{TLS}}+d)
$$

with $d=\delta_{\mathrm{Stark}}^{\mathrm{real}}$. The exact identity
$$
-\frac{d}{\omega_{\mathrm{TLS}}+d}
=-\frac d{\omega_{\mathrm{TLS}}}
+\frac{d^2}{\omega_{\mathrm{TLS}}(\omega_{\mathrm{TLS}}+d)}
$$
and $\omega_{\mathrm{TLS}}+d\ge(1-q)\omega_{\mathrm{TLS}}>0$ yield (L.95). No identification of an energy-origin-dependent MPU rhythm with a TLS clock follows without the supplied clock-response certificate. ∎

#### **L.12.3.2 Connection to the Perspective Transition Kernel**

On a registered perspective-response branch, let the physical signal $N(t)$ enter the conditional kernel $G_{\text{persp}}(s'|s,k,N,\Delta t)$ and assume its drift potential is
$$
V_k(s')
=
\frac{\lambda_{\text{drift}}}{2}d_\Sigma^2(s',s_k).
\tag{L.96}
$$
The map from $N(t)$ and the context record to $\lambda_{\text{drift}}$ is an implementation-specific constitutive law. Its information-free value may be a nonzero baseline $\lambda_{\text{drift}}^{\text{prior}}$. Convergence toward a projective kernel requires a separately stated large-drift limit and normalization theorem; it does not follow from mutual information alone. On the smooth interrogative-efficiency subbranch of Appendix M.3.3.2 with a unique nondegenerate global minimizer and positive isotropic Hessian, Definition M.3.3f and Proposition M.3.3h identify the drift target with that minimizer and $\lambda_{\text{drift}}$ with its isotropic Hessian scale. Equation (L.96) is then the local second-order normal form, and Theorem M.3.3e bounds the attainable benefit entering the potential. On the separate branch where the registered benefit, execution-cost, and self-cost profiles are all constant on $\Sigma$, Corollary M.3.3i gives the isotropic information-free baseline.

<a id="corollary-l123-conditional-perspective-drift-response"></a>**Corollary L.12.3 (Conditional Perspective-Drift Response).** Assume a perspective-kernel response certificate supplies constants $\lambda_{\mathrm{drift}}^{\mathrm{prior}}\geq0$ and $\lambda_{\mathrm{drift}}^{span}\geq0$ such that
$$
0\leq\lambda_{\mathrm{drift}}^{\mathrm{eff}}(S,T)-\lambda_{\mathrm{drift}}^{\mathrm{prior}}
\leq\lambda_{\mathrm{drift}}^{span}
\bigl(\eta_{\mathrm{res}}(S,T)-\eta_{\mathrm{prior}}\bigr)_+.
\tag{L.97}
$$
Context refinement under Proposition L.12.1's policy-inclusion hypothesis cannot reduce the certified upper envelope
$\lambda_{\mathrm{drift}}^{\mathrm{span}}(\eta_{\mathrm{res}}-\eta_{\mathrm{prior}})_+$.
It does not thereby order the maximum physically attainable drift advantage; that conclusion additionally requires nested drift-feasible sets or an attained response law identifying that maximum with the envelope. Zero causal information gives $\eta_{\mathrm{res}}=\eta_{\mathrm{prior}}$ on the common decision model and hence no drift advantage under (L.97). It gives zero total drift only if $\lambda_{\mathrm{drift}}^{\mathrm{prior}}=0$ is separately supplied. Target identification and an admissible matching action permit, but do not force, saturation.

*Proof.* Policy inclusion makes $\eta_{\mathrm{res}}$ nondecreasing, and $x\mapsto(x-\eta_{\mathrm{prior}})_+$ is nondecreasing. This orders the right side of (L.97) only. An upper bound can increase while an admissible drift value decreases; no lower comparison between such values follows from (L.97). At zero information the right side vanishes, so both sides of the nonnegative advantage bound coincide at zero. ∎

#### <a id="l1233-conditional-acceleration-refresh-bound-on-causal-information-acquisition"></a>**L.12.3.3 Conditional Acceleration–Refresh Bound on Causal Information Acquisition**

On the detector-response, additive-temperature, active-refresh, and Landauer-saturating branch of Corollary N.3.2, let a fixed comoving non-kinetic power budget sustain baseline complexity $C_0$. At constant proper acceleration $a$, the sustainable complexity $C_a$ is defined by
$$
R(C_a)+\frac{\lambda_{PM}aC_a}{\tau_{\mathrm{cycle}}}
=R(C_0),
\qquad
C_a\le C_0,
\qquad
\lambda_{PM}=\frac{\hbar\ln2}{2\pi c}.
\tag{L.98}
$$
All quantities in this equation are evaluated in the same instantaneous comoving frame; endpoint kinetic work remains in the separate laboratory ledger.

A further CC-to-UCT allocation bridge is required. Let $\mathfrak B_{\mathrm{CC-UCT}}$ assert that, for the target and protocol class under study, the maximum target-directed causal-information acquisition rate is a specified nondecreasing function $F(C)$ of sustainable predictive complexity, with the same remaining channel resources held fixed. Only on this bridge does $C_a\le C_0$ imply
$$
\left.\frac{d\mathcal I(S\to T)}{dt}\right|_{\max}^{(a)}
=F(C_a)
\le F(C_0)
=\left.\frac{d\mathcal I(S\to T)}{dt}\right|_{\max}^{(0)}.
\tag{L.99}
$$
On the additional local-linear branch $F(C)=\kappa C$, require $\kappa>0$, $C_0>0$, $\tau_{\mathrm{cycle}}>0$ and a $C^1$ resource law near $C_0$ with $R'(C_0)>0$. The local solution branch of (L.98) through $(a,C_a)=(0,C_0)$ then satisfies
$$
\frac{F(C_a)}{F(C_0)}
=\frac{C_a}{C_0}
=1-\frac{\lambda_{\mathrm{PM}}a}
{\tau_{\mathrm{cycle}}R'(C_0)}+o(a)
\qquad(a\downarrow0).
$$
Indeed, the derivative with respect to $C$ of the defining equation at $(0,C_0)$ is $R'(C_0)>0$, so the implicit-function theorem gives a unique local $C^1$ branch. Differentiating gives

$$
R'(C_0)C'_0+\lambda_{\mathrm{PM}}C_0/\tau_{\mathrm{cycle}}=0,
$$

which proves the expansion after division by positive $C_0$. If $\kappa C_0=0$, the acquisition-rate ratio is undefined and only the unnormalized inequality (L.99) applies. The detector/refresh and CC-to-UCT allocation certificates remain independent; inertial motion has no Unruh increment in this model.

-----

### <a id="l124-model-target-resonance-as-physical-implementation-of-causal-information"></a>**L.12.4 Model–Target Resonance as Physical Implementation of Causal Information**

#### **L.12.4.1 Resonance Factor as Estimation Performance**

The AC Stark shift:

$$
\delta_{\text{Stark}}(t) \simeq \frac{\Omega_R^2(t)}{2\Delta(t)}, \qquad \Omega_R(t) = \frac{|\vec{d}_{\text{TLS}} \cdot \vec{\epsilon}_{\text{rad}}(t)|\, E_0(t)}{\hbar} \tag{L.100}
$$

depends on the aggregate's knowledge of $\hat{d}_{\text{TLS}}$ and $\omega_{\text{TLS}}$ through the choices of $\vec{\epsilon}_{\text{rad}}$ and $\omega_{\text{rad}}$, set by $\mathcal{M}(\text{context}_S)$ (Definition L.2, Theorem L.1). The **model–target resonance factor** is defined as the optimal expected target alignment under context-dependent control:

$$
\eta_{\text{res}}(S, T) := \sup_{\hat{\mathbf{d}}(\cdot), \hat{\omega}(\cdot)} \mathbb{E}_{\mathcal{P}_{\text{causal}}}\!\left[ \left|\hat{\mathbf{d}}(\text{context}_S) \cdot \hat{\mathbf{d}}_{\text{TLS}}\right|^2 \cdot \frac{\Delta_{\text{opt}}^2}{\Delta_{\text{opt}}^2 + (\omega_{\text{TLS}} - \hat{\omega}(\text{context}_S))^2} \right] \in [0,1] \tag{L.101}
$$

Here $\Delta_{\mathrm{opt}}>0$ is the design scale, and the dipole vectors are real unit vectors. The physical drive retains a nonzero detuning satisfying $|\Delta_{\mathrm{drive}}|\gg\max\{\Omega_R,\Gamma\}$. For an admissible policy that attains the supremum, $\eta_{\mathrm{res}}=1$ holds exactly when its chosen dipole axis agrees almost surely with the target axis up to sign and its frequency estimate equals $\omega_{\mathrm{TLS}}$ almost surely. Indeed, both factors in (L.101) lie in $[0,1]$; expectation one forces each factor to equal one almost surely, and the two equality conditions follow. Conversely those conditions give reward one. This identifies the response-relevant pair $([\hat{\mathbf d}_{\mathrm{TLS}}],\omega_{\mathrm{TLS}})$, where $[\hat{\mathbf d}]=\{\hat{\mathbf d},-\hat{\mathbf d}\}$, without requiring a point-mass posterior for other components of $\theta_T$. A supremum of one need not be attained without an attainment certificate. For example, an exactly known target axis and frequency $\omega_0$ with allowed frequency actions $\omega_0+1/n$, $n\ge1$, have supremum reward one and no maximizing action. Exact identification of all of $\theta_T$ is sufficient when the matching action is admissible; a scalar mutual-information equality alone supplies neither identification nor attainment.
Zero causal information restricts performance to the optimal information-free baseline $\eta_{\mathrm{prior}}\geq0$.

<a id="proposition-l121-resonance-reward-is-monotone-under-context-refinement"></a>**Proposition L.12.1 (Resonance Reward Is Monotone under Context Refinement).** Let $C_1,C_2$ be two context variables on the same target experiment and assume $C_1=g(C_2)$ for a measurable deterministic coarse-graining $g$. If every $C_1$-policy composed with $g$ is admissible as a $C_2$-policy, then
$$
\eta_{\mathrm{res}}(C_1;T)\leq\eta_{\mathrm{res}}(C_2;T),
\qquad
I(C_1;\theta_T)\leq I(C_2;\theta_T).
\tag{L.102}
$$
No ordering of $\eta_{\mathrm{res}}$ follows from the mutual-information inequality alone.

*Proof.* If $u_1$ is an admissible policy based on $C_1$, then $u_2:=u_1\circ g$ is an admissible policy based on $C_2$ and has the same expected reward. Hence the supremum over $C_2$-policies is at least the supremum over $C_1$-policies. The Markov chain $\theta_T\to C_2\to C_1$ and data processing give $I(C_1;\theta_T)\leq I(C_2;\theta_T)$. ∎

<a id="corollary-l124-zero-causal-information-implies-no-target-conditioned-advantage"></a>**Corollary L.12.4 (Zero Causal Information Implies No Target-Conditioned Advantage).** If $\mathcal{I}(S \to T) = 0$, then $\text{context}_S$ is independent of $\theta_T$ and no context-dependent control policy can outperform the best information-free (context-independent) policy in expected target alignment. In particular, any strict improvement beyond the best information-free baseline implies $\mathcal{I}(S \to T) > 0$.

*Proof.* If $\mathcal{I}(S \to T) = 0$, then $\mathcal{P}(\theta_T \mid \text{context}_S) = \mathcal{P}(\theta_T)$, so $\text{context}_S$ and $\theta_T$ are independent. For any context-dependent policy $u(\text{context}_S)$ (collecting $\hat{\mathbf{d}}$ and $\hat{\omega}$), the expected alignment is a convex combination of information-free performance values, hence is bounded above by the supremum over fixed (context-independent) policies. ∎

<a id="theorem-l124a-complete-binary-causal-policy-and-carrier-classification"></a>**Theorem L.12.4a (Complete Binary Causal-Policy and Carrier Classification).** Let the target bit $\Theta$ be unbiased, let the aggregate context be
$$
C=\Theta\oplus Z_q,
\qquad Z_q\sim\operatorname{Bernoulli}(q),
\qquad0\le q\le\frac12,
$$
and let a binary carrier transmit the chosen policy output through
$$
Y=u(C)\oplus Z_s,
\qquad Z_s\sim\operatorname{Bernoulli}(s),
\qquad0\le s\le\frac12,
\tag{L.12.4a.1}
$$
with independent noises. The four deterministic policies are exhausted by the two constants, identity, and complement. Both constant policies have accuracy $1/2$; identity and complement have accuracies
$$
1-q-s+2qs,
\qquad
q+s-2qs.
\tag{L.12.4a.2}
$$
Thus identity is optimal, with advantage over the information-free baseline
$$
\Delta_{\mathrm{bin}}
=\frac12(1-2q)(1-2s).
\tag{L.12.4a.3}
$$
The context information and one-use carrier capacity are
$$
I(\Theta;C)=\ln2-h(q),
\qquad
C_{\mathrm{carrier}}=\ln2-h(s),
\tag{L.12.4a.4}
$$
where $h(x)=-x\ln x-(1-x)\ln(1-x)$. The causal chain $\Theta\to C\to u(C)\to Y$ obeys
$$
I(\Theta;Y)\le I(\Theta;C),
\qquad
I(\Theta;Y)\le C_{\mathrm{carrier}}.
\tag{L.12.4a.5}
$$
For a registered use time $\tau_{\mathrm{use}}>0$, the carrier rate is $C_{\mathrm{carrier}}/\tau_{\mathrm{use}}$. A perspective response law
$$
\lambda_{\mathrm{drift}}=\lambda_0+2\kappa\Delta_{\mathrm{bin}},
\qquad\kappa>0,
\tag{L.12.4a.6}
$$
Here $\kappa$ has the same drift-rate units as $\lambda_0$. The law satisfies $\lambda_0\le\lambda_{\mathrm{drift}}\le\lambda_0+\kappa$, and its excess above baseline vanishes exactly when $q=1/2$ or $s=1/2$.

*Proof.* Direct enumeration gives (L.12.4a.2); randomized policies are convex combinations and cannot exceed the best deterministic value. Equations (L.12.4a.3)--(L.12.4a.4) are the binary-symmetric-channel formulas. Data processing gives the first inequality in (L.12.4a.5), and the channel-capacity bound gives the second. The remaining statements follow by substitution. ∎

This is a complete policy, rate, precision, drift, and DPI solution for the declared binary DAG. General context alphabets, causal graphs, and physical source maps require their own classifications.

<a id="theorem-l124b-finite-alphabet-causal-policy-classification-and-quantitative-advantage-bound"></a>**Theorem L.12.4b (Finite-Alphabet Causal-Policy Classification and Quantitative Advantage Bound).** Let $\mathcal T$, $\mathcal C$ and $\mathcal X$ be finite target, context and carrier-input alphabets, let $P$ be a joint law of $(\Theta,C)$ on $\mathcal T\times\mathcal C$, and let $r:\mathcal T\times\mathcal X\to[0,1]$ be a registered reward. Consider any finite causal DAG containing $\Theta$, $C$, the carrier input $X$ and the target record, including latent common causes and directed ND–RID paths into $\Theta$ and $C$, in which $X$ is produced from $C$ by a policy kernel $\kappa(x\mid c)$ whose randomness is independent of every other variable, neither $\Theta$ nor $C$ is a descendant of $X$, and the expected reward given $(\Theta,C,X)$ equals $r(\Theta,X)$. Define
$$
V(\kappa):=\sum_{\theta,c,x}P(\theta,c)\kappa(x\mid c)r(\theta,x),
\qquad
V_0:=\max_{x\in\mathcal X}\sum_\theta P(\theta)r(\theta,x),
\qquad
f(c,x):=\sum_\theta P(\theta\mid c)r(\theta,x).
\tag{L.12.4b.1}
$$

(a) The optimal value is $V^*:=\max_\kappa V(\kappa)=\sum_{c:P(c)>0}P(c)\max_xf(c,x)$. A policy is optimal exactly when, for every $c$ with $P(c)>0$, $\kappa(\cdot\mid c)$ is supported on $\operatorname{arg\,max}_xf(c,x)$; randomization never exceeds the best deterministic policy. The value depends on the graph only through $P$ and $r$.

(b) With $\operatorname{osc}g:=\max g-\min g$, $\omega(r):=\max_x\operatorname{osc}_\theta r(\theta,x)$ and $\omega'(r):=\max_{x,x'}\operatorname{osc}_\theta[r(\theta,x)-r(\theta,x')]$, the advantage $\Delta:=V^*-V_0$ obeys
$$
0\le\Delta\le\bar d\,\min\{\omega(r),\omega'(r)\},
\qquad
\bar d:=\sum_cP(c)\,d_{\mathrm{TV}}\bigl(P_{\Theta\mid c},P_\Theta\bigr).
\tag{L.12.4b.2}
$$

(c) In nats, $\bar d\le\sqrt{I(\Theta;C)/2}$. Hence $\Delta\le\min\{\omega(r),\omega'(r)\}\sqrt{I(\Theta;C)/2}$, a strict advantage $\Delta>0$ forces $I(\Theta;C)\ge2\Delta^2/\min\{\omega(r),\omega'(r)\}^2$, and the causal-separation hypotheses of Lemma L.12.1 give $\Delta=0$.

(d) If the target record is the output $Y$ of a carrier channel $W(y\mid x)$ whose noise is independent of $(\Theta,C)$ given $X$, then $I(\Theta;Y)\le\min\{I(\Theta;C),C(W)\}$, where $C(W)$ is the one-use Shannon capacity.

(e) For the binary DAG of Theorem L.12.4a with $r(\theta,x)=\Pr(Y=\theta\mid X=x)$, one has $\bar d=\tfrac12-q$ and $\omega(r)=1-2s$, and the upper bound in (L.12.4b.2) holds with equality, recovering (L.12.4a.3).

*Proof.* (a) The independence of the policy randomness, the position of $X$ downstream of $(\Theta,C)$ and the reward hypothesis give the joint weight $P(\theta,c)\kappa(x\mid c)$ and conditional reward $r(\theta,x)$, so $V(\kappa)=\sum_cP(c)\sum_x\kappa(x\mid c)f(c,x)$. For each $c$ the inner average is at most $\max_xf(c,x)$, with equality exactly under the support condition, and the graph enters only through these quantities.

(b) A constant policy at a maximizer $x_0$ of $V_0$ gives $\Delta\ge0$. Put $\mu_c:=P_{\Theta\mid c}-P_\Theta$, a signed measure of total mass zero with $\sum_\theta|\mu_c(\theta)|=2d_{\mathrm{TV}}(P_{\Theta\mid c},P_\Theta)$. Subtracting the midrange of $g$ shows $|\sum_\theta\mu_c(\theta)g(\theta)|\le d_{\mathrm{TV}}(P_{\Theta\mid c},P_\Theta)\operatorname{osc}g$. Since $f(c,x)=\sum_\theta\mu_c(\theta)r(\theta,x)+\sum_\theta P(\theta)r(\theta,x)\le\sum_\theta\mu_c(\theta)r(\theta,x)+V_0$, averaging $\max_xf(c,x)-V_0$ over $c$ gives $\Delta\le\bar d\,\omega(r)$. Also $\sum_cP(c)f(c,x_0)=V_0$, and $f(c,x)-f(c,x_0)=\sum_\theta\mu_c(\theta)[r(\theta,x)-r(\theta,x_0)]+[\sum_\theta P(\theta)r(\theta,x)-V_0]\le\sum_\theta\mu_c(\theta)[r(\theta,x)-r(\theta,x_0)]$, so averaging $\max_x[f(c,x)-f(c,x_0)]$ gives $\Delta\le\bar d\,\omega'(r)$.

(c) Pinsker's inequality gives $d_{\mathrm{TV}}(P_{\Theta\mid c},P_\Theta)\le\sqrt{D(P_{\Theta\mid c}\|P_\Theta)/2}$, and concavity of the square root with $I(\Theta;C)=\sum_cP(c)D(P_{\Theta\mid c}\|P_\Theta)$ gives $\bar d\le\sqrt{I(\Theta;C)/2}$. Under Lemma L.12.1, $P_{\Theta\mid c}=P_\Theta$ for every $c$ with $P(c)>0$, so $\bar d=0$.

(d) The hypotheses give the Markov chain $\Theta\to C\to X\to Y$. Data processing gives $I(\Theta;Y)\le I(\Theta;C)$ and $I(\Theta;Y)\le I(X;Y)\le C(W)$.

(e) For $\Theta$ unbiased and $C=\Theta\oplus Z_q$, each $P_{\Theta\mid c}$ is $(1-q,q)$ up to order, so its distance from the uniform law is $\tfrac12-q$; each row of the binary symmetric carrier has oscillation $1-2s$. Their product is $\tfrac12(1-2q)(1-2s)$, which is (L.12.4a.3). ∎

<a id="theorem-l124c-standard-borel-causal-policy-classification"></a>**Theorem L.12.4c (Standard-Borel Causal-Policy Classification).**

Let $T,C,A$ be nonempty standard Borel spaces, let $P$ be a probability on $T\times C$, and let $r:T\times A\to[0,1]$ be jointly Borel. Write $\mu=P_\Theta$, $\nu=P_C$, and choose a Borel probability kernel $Q_c=P_{\Theta\mid C=c}$. A policy is a Borel probability kernel $\kappa(da\mid c)$, implemented with randomness independent of $(\Theta,C)$, so its joint law is $P(d\theta,dc)\kappa(da\mid c)$. Define

$$
f(c,a)=\int r(\theta,a)Q_c(d\theta),\qquad
g(c)=\sup_{a\in A}f(c,a),\qquad
b(a)=\int r(\theta,a)\mu(d\theta),
$$
$$
V(\kappa)=\int f(c,a)\kappa(da\mid c)\nu(dc),\quad
V_0=\sup_{a\in A}b(a),\quad
V^*=\sup_\kappa V(\kappa).
$$

The same conclusions hold for universally measurable policies or policies measurable for the completion of $\nu$; for this fixed law they have Borel versions with the same value. Every Borel kernel on a standard Borel action space can be realized as a Borel function of the context and one independent uniform random variable. Arbitrary globally bounded real rewards reduce to this normalization by an affine change of scale. Supremum, rather than maximum, is essential unless attainment is established.

**(a) Exact value and approximate policies.** The function $f$ is jointly Borel, $g$ is upper semianalytic and therefore universally measurable, and

$$
V^*=\int g(c)\nu(dc).
\tag{L.12.4c.1}
$$

For every $\varepsilon>0$, there is a universally measurable deterministic policy $a_\varepsilon(c)$ with $f(c,a_\varepsilon(c))\ge g(c)-\varepsilon$ for every $c$. There is a Borel deterministic policy with this inequality $\nu$-almost surely. In particular, randomization cannot increase the supremal value.

**(b) All exact optimizers and the attainment criterion.** Put

$$
M_c=\{a\in A:f(c,a)=g(c)\},\qquad I=\{c:M_c\ne\varnothing\}.
$$

The set $I$ is universally measurable. A policy is optimal exactly when

$$
\kappa(M_c\mid c)=1\quad\text{for }\nu\text{-almost every }c.
\tag{L.12.4c.2}
$$

An optimal policy exists if and only if $\nu(I)=1$; whenever one exists, a Borel deterministic optimal policy exists. Here “concentrates on $M_c$” is the intended meaning of support; no topological-support condition is being imposed.

**(c) Total variation, mutual information, and causal separation.** Define

$$
d(c)=\|Q_c-\mu\|_{\rm TV},\quad \bar d=\int d(c)\nu(dc),\quad
\omega=\sup_a\operatorname{osc}_{\theta}r(\theta,a),
$$
$$
\omega'=\sup_{a,a'}\operatorname{osc}_{\theta}
\bigl(r(\theta,a)-r(\theta,a')\bigr),\qquad h=\min\{\omega,\omega'\}.
$$

With total variation normalized as $\sup_B|Q(B)-\mu(B)|$,

$$
0\le\Delta:=V^*-V_0\le h\bar d,
\qquad
\bar d=\|P-\mu\otimes\nu\|_{\rm TV}
\le\min\{1,\sqrt{I(\Theta;C)/2}\}.
\tag{L.12.4c.3}
$$

The information is in nats and may be infinite. When $h>0$, strict advantage implies $I(\Theta;C)\ge2\Delta^2/h^2$; when $h=0$, $\Delta=0$. Independence gives $\Delta=0$. These statements include singular posterior laws.

**(d) Carrier channels and graph equivalence.** If $Y$ is generated from $A$ by a Borel channel $W(dy\mid a)$ on a standard Borel output space, with no further dependence on $(\Theta,C)$ given $A$, then

$$
I(\Theta;Y)\le\min\{I(\Theta;C),\operatorname{Cap}(W)\},\qquad
\operatorname{Cap}(W)=\sup_{\xi\in\mathcal P(A)}I_\xi(A;Y).
\tag{L.12.4c.4}
$$

All quantities depend on a causal implementation only through $P$, the registered reward, and the carrier kernel. Thus this extends L.12.4b to standard Borel alphabets for every causal realization having its stated independent-policy factorization and conditional-reward property. It does not derive that factorization from an unspecified physical source.

*Proof.*

Kernel integration makes $f$ jointly Borel. For every real $t$,
$\{c:g(c)>t\}$ is the projection of the Borel set

$$
\{(c,a):f(c,a)>t\},
$$

hence is analytic. This proves upper semianalyticity. The Jankov–von Neumann selection theorem (Brown and Purves 1973; Shreve and Bertsekas 1979), applied to these superlevel sets at a finite grid of thresholds, supplies a universally measurable policy within one grid step of $g$. More explicitly, choose $\delta<\varepsilon$, select on the projection of each $\{f>k\delta\}$, and at a context with $g(c)>0$ use the largest grid threshold strictly below $g(c)$. Where $g(c)=0$, use a fixed action. This gives the claimed pointwise error bound. A map from the completion of a Borel probability space into a standard Borel space has a Borel version almost surely, so it gives the Borel assertion too.

Every policy satisfies $V(\kappa)\le\int g\,d\nu$. The approximate policies give the reverse supremal inequality, proving (L.12.4c.1). For a completion-measurable kernel, regard $c\mapsto\kappa_c$ as a completion-measurable map into the standard Borel space $\mathcal P(A)$; its Borel version has the same value. This justifies the policy-class assertion without changing the law or allowing anticipatory randomness.

For completeness, exact attainment needs no compactness premise. Fix any Borel probability $\rho$ on $C$, and choose a Borel version $g_\rho$ of $g$, agreeing outside a Borel $\rho$-null set $N_\rho$. The set
$$
G_\rho=\{(c,a):f(c,a)=g_\rho(c)\}
$$
is Borel. Its projection is analytic and agrees with $I$ outside $N_\rho$. Therefore $I$ belongs to the completion of every $\rho$, proving universal measurability. Apply analytic uniformization to $G_\nu$; extend the resulting selector by a fixed action off its domain, and take a Borel version under $\nu$. If $\nu(I)=1$, this is an exact Borel optimal policy almost surely.

For any kernel, the nonnegative defect satisfies
$$
V^*-V(\kappa)=\int\!\int[g(c)-f(c,a)]\kappa(da\mid c)\nu(dc).
$$
This is zero exactly when the inner defect is zero almost surely, which is exactly (L.12.4c.2). A nonempty probability measure cannot concentrate on an empty set; hence an optimizer forces $\nu(I)=1$. This proves both directions of (b).

Constant policies imply $V^*\ge V_0$, even if the prior supremum is unattained. For any bounded Borel $u$, the signed measure $Q_c-\mu$ has mass zero, and subtracting the midrange gives
$$
\left|\int u\,d(Q_c-\mu)\right|
\le d(c)\operatorname{osc}u.
$$
Consequently $f(c,a)\le V_0+d(c)\omega$, and integration after taking the supremum gives $\Delta\le\bar d\omega$. Fix **any** action $a_0$; no prior maximizer is required. Then
$$
f(c,a)-f(c,a_0)
\le d(c)\omega'+V_0-b(a_0).
$$
Taking the supremum and integrating yields

$$
V^*-b(a_0)\le\bar d\omega'+V_0-b(a_0),
$$

hence the second oscillation bound.

The measurable decomposition constructed below gives simultaneously a Borel Hahn-positive set for $Q_c-\mu$, so $d(c)$ is Borel and
$\|P-\mu\otimes\nu\|_{\rm TV}=\int d(c)d\nu$.
Alternatively the latter identity follows from total-variation disintegration. The relative-entropy chain rule gives

$$
I(\Theta;C)=\int D(Q_c\|\mu)d\nu,
$$

including $+\infty$. Applying Pinsker to each posterior and then Cauchy–Schwarz proves (L.12.4c.3). If $I=0$, $Q_c=\mu$ almost surely and the two Bayes values coincide.

Finally, the policy and carrier factorization gives the statistical Markov chain $\Theta-C-A-Y$. This does not assert that $\Theta\to C$ is an actual directed causal edge. Data processing gives $I(\Theta;Y)\le I(\Theta;C)$ and $I(\Theta;Y)\le I(A;Y)\le\operatorname{Cap}(W)$. ∎

**Nonattainment.**

Let $\Theta=C$ be a fair binary variable, let $A=\{0,1\}\times(0,1)$, and set $r(\theta,(b,t))=t\mathbf1_{\{\theta=b\}}$. Then $V_0=1/2$, $V^*=1$, and $\Delta=1/2$, but no prior action and no informed policy attain their respective suprema. Any randomized policy still has a strictly positive integrated defect $1-r$. This is why replacing the finite theorem's maxima with maxima on arbitrary standard Borel spaces would be false.

<a id="theorem-l124d-complete-bounded-reward-decision-envelope"></a>**Theorem L.12.4d (Complete Bounded-Reward Decision Envelope).**

Fix $P,\mu,\nu,Q$ as above. For $c\in C$ and $v\in[0,1]$, define the posterior testing curve

$$
\beta_c(v)=\sup\left\{\int u\,dQ_c:
u:T\to[0,1]\text{ Borel},\ \int u\,d\mu\le v\right\},
\qquad B_P(v)=\int\beta_c(v)\nu(dc).
\tag{L.12.4d.1}
$$

**(a) Simultaneous attained testing curves.** There is a jointly Borel function
$R:C\times[0,1]\times T\to[0,1]$ such that, for **every** $(c,v)$,

$$
\int R(c,v,\theta)\mu(d\theta)=v,\qquad
\int R(c,v,\theta)Q_c(d\theta)=\beta_c(v).
\tag{L.12.4d.2}
$$

The function $(c,v)\mapsto\beta_c(v)$ is Borel. Each testing curve and $B_P$ are nondecreasing, concave, and continuous on the closed interval $[0,1]$.

**(b) The entire attainable region.** Over all nonempty standard Borel action spaces and all Borel $[0,1]$-rewards, the set of pairs of prior and informed supremal Bayes values is exactly

$$
\left\{(v,w):0\le v\le1,\quad v\le w\le B_P(v)\right\}.
\tag{L.12.4d.3}
$$

Every pair in this region can be attained by a decision problem with the action alphabet $A=C$, a prior baseline attained by every action, and the Borel deterministic identity policy $a(c)=c$ optimal. In particular, the maximal possible advantage is a **maximum**:

$$
\mathfrak A(P):=\max_{A,r}(V^*-V_0)
=\max_{0\le v\le1}\{B_P(v)-v\}.
\tag{L.12.4d.4}
$$

**(c) Exact comparison with total variation.** There is a simultaneous measurable Lebesgue decomposition
$$
Q_c(d\theta)=q(c,\theta)\mu(d\theta)+Q_c^\perp(d\theta),
\quad Q_c^\perp\perp\mu,\quad s(c)=Q_c^\perp(T),
\tag{L.12.4d.5}
$$
with a Borel singular support $S\subset C\times T$ satisfying $\mu(S_c)=0$ for every $c$, and $q$ finite and nonnegative. Then

$$
\beta_c(0)=s(c),\quad \beta_c(1)=1,\qquad
\beta_c(v)=s(c)+\inf_{\lambda\ge0}
\left\{\lambda v+\int(q(c,\theta)-\lambda)_+\mu(d\theta)\right\}.
\tag{L.12.4d.6}
$$

For $v>0$ the displayed infimum has a finite measurable minimizing threshold; at $v=0$ it need not have a finite minimizer. Furthermore,

$$
d(c)=s(c)+\int(q(c,\theta)-1)_+\mu(d\theta)
=\max_{v\in[0,1]}\{\beta_c(v)-v\}.
\tag{L.12.4d.7}
$$

Thus $\mathfrak A(P)\le\bar d$, with equality if and only if there is a single $v\in[0,1]$ satisfying

$$
\mu\{q(c,\cdot)>1\}\le v\le\mu\{q(c,\cdot)\ge1\}
\quad\text{for }\nu\text{-almost every }c.
\tag{L.12.4d.8}
$$

Finally, $\mathfrak A(P)=0$ if and only if $P=\mu\otimes\nu$.

**(d) Decision-envelope data processing.** If a standard Borel context $Z$ is a garbling of $C$, meaning that its conditional law given $(\Theta,C)$ is a kernel depending only on $C$, then for every budget,
$$
B_{P_{\Theta,Z}}(v)\le B_{P_{\Theta,C}}(v),\qquad
\mathfrak A(P_{\Theta,Z})\le\mathfrak A(P_{\Theta,C}).
\tag{L.12.4d.9}
$$

*Proof.*

**1. A decomposition that is valid simultaneously, including null context labels.** Choose finite Borel partitions $\mathcal F_n$ increasing to a countable generator of $\mathcal B(T)$. For a cell $D\in\mathcal F_n$, set
$$
h_n(c,\theta)=\frac{\mu(D)}{\mu(D)+Q_c(D)}\quad(\theta\in D),
$$
using zero when the denominator is zero. These functions are Borel. Put
$h=\limsup_n h_n$, $S=\{h=0\}$, and
$$
q(c,\theta)=\begin{cases}(1-h(c,\theta))/h(c,\theta),&h(c,\theta)>0,\\0,&h(c,\theta)=0.\end{cases}
$$
Fix $c$, and let $\rho_c=\mu+Q_c$. The sequence $h_n(c,\cdot)$ is the conditional-expectation martingale of $d\mu/d\rho_c$ along these finite partitions. Martingale convergence identifies $h(c,\cdot)=d\mu/d\rho_c$, $\rho_c$-almost surely. Hence $\mu(S_c)=0$, $Q_c^\perp=\mathbf1_{S_c}Q_c$, and the identity (L.12.4d.5) holds for this $c$. This argument holds for every $c$, without discarding any context labels. It also proves $q\in L^1(\mu)$ with integral $1-s(c)$. Kernel integration makes $s$ Borel.

The Borel set $S\cup\{q>1\}$ is a positive Hahn set for $P-\mu\otimes\nu$, and its section is one for $Q_c-\mu$. This proves the total-variation identities used in L.12.4c and in (L.12.4d.7).

**2. A Borel Neyman–Pearson test for every context and budget.** For $v>0$, set
$$
t(c,v)=\inf\{z\in\mathbb Q_{\ge0}:\mu(q(c,\cdot)>z)\le v\}.
$$
This is a finite Borel function, since the tail integrals are Borel and tend to zero. Right continuity of the tail and its left limit give
$$
a(c,v):=\mu(q>t)\le v\le\mu(q\ge t)=a(c,v)+b(c,v),
\qquad b(c,v):=\mu(q=t).
$$
When $t=0$, the right inequality uses $\mu(q\ge0)=1$. Define
$$
\gamma(c,v)=\begin{cases}(v-a(c,v))/b(c,v),&b(c,v)>0,\\0,&b(c,v)=0.\end{cases}
$$
All these functions are Borel, and $0\le\gamma\le1$. Now set
$$
R(c,v,\theta)=\mathbf1_{S_c}(\theta)
+\mathbf1_{S_c^c}(\theta)
\left[\mathbf1_{\{q(c,\theta)>t(c,v)\}}
+\gamma(c,v)\mathbf1_{\{q(c,\theta)=t(c,v)\}}\right]
\quad(v>0),
$$
and set $R(c,0,\theta)=\mathbf1_{S_c}(\theta)$. This definition is jointly Borel and has prior integral exactly $v$, including when $\mu$ has atoms. Fractional values of the reward handle threshold atoms; no nonatomicity assumption is hidden here.

If $u$ is any feasible test with $\mu u\le v$, then for $v>0$,
$$
\int(R-u)dQ_c
=\int_{S_c}(1-u)dQ_c
+\int(q-t)(R-u)d\mu
+t\left(v-\int u\,d\mu\right)\ge0.
$$
The middle integrand is nonnegative above and below the threshold, and vanishes at it. At $v=0$, feasibility forces $u=0$ $\mu$-almost surely, so $\int u\,dQ_c\le s(c)$, attained by $\mathbf1_{S_c}$. This proves (L.12.4d.2). It also gives (L.12.4d.6): a threshold test has value $s+tv+\int(q-t)_+d\mu$, while any $\lambda\ge0$ gives the corresponding upper bound. At budget zero, the tail integral tends to zero as $\lambda\to\infty$.

**3. Regularity and endpoints.** Joint measurability of $\beta$ follows by integrating $R$ against $Q_c$. Monotonicity follows from nested feasible sets; mixing feasible tests proves concavity. A finite concave function is continuous on $(0,1)$. To check zero, for every $K>0$,
$$
0\le\beta_c(v)-s(c)
\le Kv+\int_{\{q>K\}}q\,d\mu.
$$
First let $v\downarrow0$, then $K\uparrow\infty$. At one, the feasible test $\mathbf1_{S_c}+v\mathbf1_{S_c^c}$ gives

$$
\beta_c(v)\ge s(c)+(1-s(c))v,
$$

which tends to one. Thus the curve is continuous on the closed interval and lies above the identity. Dominated convergence gives closed-interval continuity of $B_P$; its other claimed properties follow by integration. Notice that $B_P(0)=\int s\,d\nu$, which can be positive.

**4. The converse bound and all attainable pairs.** For any decision problem with $V_0=v$, every action reward $r(\cdot,a)$ has prior integral at most $v$. Therefore
$$
f(c,a)\le\beta_c(v),\qquad V^*\le B_P(v).
$$
Constant policies give $V^*\ge v$. This proves containment in (L.12.4d.3), without assuming prior or posterior attainment.

Conversely, fix $v$. Use $A=C$ and the Borel reward
$r_v(\theta,a)=R(a,v,\theta)$.
Every action has prior reward exactly $v$, **including context labels of zero $\nu$-probability**. Hence the baseline is exactly $v$. At context $c$, the identity action gives $\beta_c(v)$; no action can exceed that testing optimum. Thus the identity policy is optimal and the informed value is $B_P(v)$.

For any $w$ between $v$ and $B_P(v)$, use
$$
r_{v,\alpha}(\theta,a)=(1-\alpha)v+\alpha R(a,v,\theta),\qquad
\alpha=\frac{w-v}{B_P(v)-v}
$$
when the denominator is positive, and the constant reward $v$ otherwise. Every action still has prior value $v$, the identity policy is optimal, and its value is exactly $w$. This proves the full reverse inclusion. Compactness of $[0,1]$ and continuity of $B_P(v)-v$ give an attaining $v_*$ for (L.12.4d.4), and the constructed decision problem attains the maximal advantage.

**5. Exact total-variation criterion and the independence converse.** The signed-measure maximization formula gives
$$
d(c)=\max_{0\le u\le1}\left(\int u\,dQ_c-\int u\,d\mu\right)
=s(c)+\int(q-1)_+d\mu.
$$
An attaining test must equal one $Q_c^\perp$-almost surely and on $\{q>1\}$ $\mu$-almost surely, and equal zero on $\{q<1\}$ $\mu$-almost surely. On $\{q=1\}$ it can take any values in $[0,1]$. Consequently the exact prior budgets at which $\beta_c(v)-v=d(c)$ are precisely
$$
[\mu(q>1),\mu(q\ge1)].
$$
This proves (L.12.4d.7). Since $d(c)-(\beta_c(v)-v)\ge0$, equality after integrating is equivalent to equality almost surely. An outer maximizing $v_*$ exists, so the condition is both necessary and sufficient for $\mathfrak A(P)=\bar d$.

If the joint law is independent, every testing curve is $\beta_c(v)=v$ almost surely and $\mathfrak A(P)=0$. Conversely, if $\mathfrak A(P)=0$, then $B_P(v)-v=0$ for every rational $v\in[0,1]$. The nonnegative functions $\beta_c(v)-v$ therefore vanish on a common full-measure set of contexts for all rational budgets; continuity extends this to every budget. Their maximum is $d(c)$, so $\bar d=0$, proving independence.

**6. Garbling.** Every policy based on $Z$ can be simulated by a policy based on $C$: first sample the garbling kernel, then the $Z$-policy kernel. For each registered reward this preserves its prior baseline and its $Z$-policy value. Choose the reward in part (b) attaining $B_{P_{\Theta,Z}}(v)$. Its simulated $C$-policy cannot exceed $B_{P_{\Theta,C}}(v)$, by the converse already proved. Maximizing the resulting inequality after subtracting $v$ proves the advantage inequality. ∎

**Boundary cases of the complete decision class.**

1. **Perfect atomless observation, wholly singular posteriors.** Let $\Theta=C\sim\mathrm{Unif}[0,1]$. Then $Q_c=\delta_c$, $s(c)=1$, $\beta_c(v)=1$ for all budgets, and $\mathfrak A(P)=1$, attained at $v=0$. Take $A=[0,1]$, $r(\theta,a)=\mathbf1_{\{\theta=a\}}$, and the identity policy. Every prior action has value zero, the informed reward is one, and $I(\Theta;C)=+\infty$. In particular, the assertion “posteriors are almost surely absolutely continuous with respect to the prior” is false.

2. **Strictly smaller than average posterior total variation.** Let $\Theta=C\sim\mathrm{Bernoulli}(p)$, $0<p\le1/2$. Then
$$
B_P(v)=(1-p)\min\{v/(1-p),1\}+p\min\{v/p,1\},
$$
so $\mathfrak A(P)=p$, whereas $\bar d=2p(1-p)$. Equality holds only for $p=1/2$ (or the excluded degenerate endpoint). The common maximizing budgets for the advantage are $[p,1-p]$. This witnesses why the exact fixed-law envelope cannot be replaced by $\bar d$.

3. **Independent context.** If $Q_c=\mu$ almost surely, $\beta_c(v)=v$, the attainable region is the diagonal, and no bounded reward has a positive information advantage.

4. **Threshold atoms.** If a likelihood ratio is constant on an atom, exact intermediate budgets require fractional test values; the $\gamma$ term supplies them. This randomization is part of the registered reward construction. The optimizing policy itself remains deterministic.

<a id="theorem-l127a-complete-matrix-measure-class-of-continuous-resonance-responses"></a>**Theorem L.12.7a (Complete Matrix-Measure Class of Continuous Resonance Responses).** Fix the design width $\Delta>0$. A target consists of a real unit dipole direction $d\in S^2$ and frequency $\nu\in\mathbb R$; directions $d$ and $-d$ have the same retained response. An action is $(u,\omega)\in S^2\times\mathbb R$, with reward
$$
r(d,\nu;u,\omega)=(d^{\mathsf T}u)^2K_\Delta(\omega-\nu),
\qquad K_\Delta(x)=\frac{\Delta^2}{\Delta^2+x^2}.
\tag{L.12.7a.1}
$$
Let $c\mapsto\pi_c$ be any probability kernel from a standard Borel context space to $S^2\times\mathbb R$. Define the real symmetric matrix-valued measure and its response field by
$$
M_c(B)=\int_{S^2\times B}dd^{\mathsf T}\,\pi_c(dd\,d\nu),
\qquad
G_c(\omega)=\int_{\mathbb R}K_\Delta(\omega-\nu)\,dM_c(\nu).
\tag{L.12.7a.2}
$$
Then the following statements hold.

1. The posterior action reward is exactly $f(c,u,\omega)=u^{\mathsf T}G_c(\omega)u$. The measures $M_c$ are positive semidefinite on every Borel set and have $\operatorname{tr}M_c(\mathbb R)=1$. Conversely, every Borel kernel of real symmetric positive semidefinite matrix measures with that trace normalization is produced by a probability kernel $\pi_c$. Thus (L.12.7a.2) characterizes the entire posterior resonance-response class, including atomic, singular continuous and absolutely continuous frequency laws.
2. Two posterior laws have the same reward for every action if and only if their matrix measures $M$ agree. With the Fourier convention $\widehat G(t)=\int e^{-it\omega}G(\omega)\,d\omega$ and $\widehat M(t)=\int e^{-it\nu}\,dM(\nu)$, their exact inversion relation is
$$
\widehat G(t)=\pi\Delta e^{-\Delta|t|}\widehat M(t).
\tag{L.12.7a.3}
$$
The quotient retains the frequency-resolved dipole second moment. Higher angular moments that leave $M$ unchanged are absent from this reward record.
3. Intrinsically, a real symmetric matrix function $G\in C_0(\mathbb R;\operatorname{Sym}_3)\cap L^1(\mathbb R;\operatorname{Sym}_3)$ belongs to the class exactly when
$$
H(t):=\frac{e^{\Delta|t|}}{\pi\Delta}\widehat G(t)
\quad\text{is matrix positive definite and}\quad
\operatorname{tr}H(0)=1.
\tag{L.12.7a.4}
$$
Here matrix positive definiteness has the convention (12.5.5p.2) of Theorem 12.5.5p, with an equivalent reversal of all time arguments when required by the Fourier sign. Every field in this class satisfies
$$
G(\omega)\succeq0,\qquad
\int_{\mathbb R}\operatorname{tr}G(\omega)\,d\omega=\pi\Delta,
\qquad
\lim_{|\omega|\to\infty}\|G(\omega)\|=0.
\tag{L.12.7a.5}
$$

*Proof.* The identity for $f$ follows from $(d^{\mathsf T}u)^2=u^{\mathsf T}dd^{\mathsf T}u$ and integration. Positivity and trace normalization follow from $dd^{\mathsf T}\succeq0$ and $\operatorname{tr}(dd^{\mathsf T})=1$.

We give the converse for a whole context kernel, so its construction also supplies measurable posterior laws. Put $\mu_c=\operatorname{tr}M_c$, a probability kernel. Positivity implies that every matrix entry of $M_c$ is absolutely continuous with respect to $\mu_c$, with a real symmetric density $A_c(\nu)\succeq0$ and $\operatorname{tr}A_c(\nu)=1$ almost everywhere. A jointly Borel version can be constructed explicitly. Partition $\mathbb R$ into half-open dyadic intervals of length $2^{-n}$. On an interval $I$ with $\mu_c(I)>0$, set $A_n(c,\nu)=M_c(I)/\mu_c(I)$; on a zero-mass interval set $A_n=I_3/3$. These are Borel functions of $(c,\nu)$. For each fixed $c$, their entries are conditional expectations of the corresponding Radon–Nikodym densities with respect to the increasing dyadic sigma-algebras. The martingale convergence theorem, whose limit sigma-algebra is the Borel sigma-algebra, gives $A_n\to A_c$ for $\mu_c$-almost every $\nu$. Take this limit wherever it exists in the closed set of positive semidefinite trace-one matrices, and $I_3/3$ elsewhere. The resulting $A(c,\nu)$ is jointly Borel and is a valid density for every $c$.

Let $v_j(c,\nu)=A(c,\nu)^{1/2}e_j$ and $w_j(c,\nu)=\|v_j(c,\nu)\|^2$, for $1\le j\le3$. If $w_j>0$, put $d_j=v_j/\sqrt{w_j}$; if $w_j=0$, put $d_j=e_1$. The matrix square root is continuous on positive semidefinite matrices, so these are Borel choices. They satisfy
$$
\sum_{j=1}^3w_j=1,
\qquad
\sum_{j=1}^3w_jd_jd_j^{\mathsf T}=A.
\tag{L.12.7a.6}
$$
The probability kernel that, conditional on $\nu\sim\mu_c$, assigns direction $d_j(c,\nu)$ with probability $w_j(c,\nu)$ therefore has exactly the given $M_c$. Zero weights cause no ambiguity in the kernel or its response.

For a fixed $M$, positivity bounds the operator norm of $G(\omega)$ by

$$
\operatorname{tr}G(\omega)=\int K_\Delta(\omega-\nu)\,d\mu(\nu).
$$

Dominated convergence proves continuity and vanishing at infinity. Each entry is integrable: its absolute integral is bounded by $\pi\Delta$ times the total variation of the corresponding finite matrix-measure entry. Tonelli's theorem and $\int K_\Delta=\pi\Delta$ prove the trace identity in (L.12.7a.5).

The scalar Fourier integral is
$$
\int_{\mathbb R}e^{-itx}\frac{\Delta^2}{\Delta^2+x^2}\,dx
=\pi\Delta e^{-\Delta|t|}.
\tag{L.12.7a.7}
$$
For $t>0$, close the contour in the lower half-plane. The pole at $-i\Delta$, with clockwise orientation, gives the stated value; the upper half-plane gives the $t<0$ case, and $t=0$ is the elementary integral. Fubini now gives (L.12.7a.3). Its multiplier is nonzero for every real $t$, and uniqueness of Fourier transforms of finite measures, proved in Theorem 12.5.5p, recovers $M$ from $G$. Conversely, equal $M$ gives equal $G$. The quadratic values on $u=e_j$ and $u=(e_j+e_k)/\sqrt2$ recover every entry of a real symmetric $G$, proving the equivalence in item 2.

For item 3, necessity follows from (L.12.7a.3) and positive matrix measures. Conversely, the continuous positive-definite function $H$ has, by the matrix representation established in Theorem 12.5.5p, a unique finite positive Hermitian matrix measure $M$ with Fourier transform $H$ in the chosen sign convention. Since $G$ is real symmetric, $H(t)^{\mathsf T}=H(t)$. Uniqueness gives $M(B)^{\mathsf T}=M(B)$; together with Hermitian positivity this makes each $M(B)$ real symmetric. Its trace mass is one. The convolution $K_\Delta*M$ has Fourier transform $\widehat G$ by (L.12.7a.7). Fourier uniqueness on $L^1$, and continuity of both fields, imply equality everywhere. Item 1 supplies its posterior realization. ∎

<a id="theorem-l127b-global-resonance-optimization-and-certified-frequency-cutoff"></a>**Theorem L.12.7b (Global Resonance Optimization and Certified Frequency Cutoff).** In Theorem L.12.7a, allow every Borel policy with actions in the full space $S^2\times\mathbb R$, including randomized policies with independent policy randomness. Let $\lambda(c,\omega)=\lambda_{\max}(G_c(\omega))$, and define
$$
v(c)=\max_{\omega\in\mathbb R}\lambda(c,\omega),
\qquad
\mathcal Z_c=\{(u,\omega):\lambda(c,\omega)=v(c),\ G_c(\omega)u=v(c)u,\ \|u\|=1\}.
\tag{L.12.7b.1}
$$
For every context $c$, $0<v(c)\le1$ and $\mathcal Z_c$ is nonempty and compact. There is a Borel maximizing policy. If $\nu_C$ is the context law, the optimal reward and all its attaining policies are
$$
V^*=\int v(c)\,d\nu_C(c),
\qquad
\kappa\text{ is optimal}\quad\Longleftrightarrow\quad
\kappa(\mathcal Z_c\mid c)=1\quad\text{for }\nu_C\text{-almost every }c.
\tag{L.12.7b.2}
$$
No compact frequency window or separate measurable-maximizer certificate is required for this full action class.

An explicit measurable finite cutoff is obtained from the frequency marginal $\mu_c=\operatorname{tr}M_c$:
$$
b(c)=\tfrac13\operatorname{tr}G_c(0)>0,
\qquad
R(c)=\min\{n\ge1:\mu_c(\{|\nu|>n\})\le b(c)/4\},
\qquad
B(c)=R(c)+\Delta\sqrt{4/b(c)-1}.
\tag{L.12.7b.3}
$$
Every maximizing frequency satisfies $|\omega|<B(c)$. On any grid covering $[-B(c),B(c)]$ with consecutive spacing at most $h$, including its endpoints, the exact matrix eigenvalues give the certificate
$$
0\le v(c)-\max_{\omega\text{ on the grid}}\lambda(c,\omega)
\le\frac{3\sqrt3}{16\Delta}\,h.
\tag{L.12.7b.4}
$$
If each computed matrix is real symmetric and has operator-norm error at most $\eta$, the computed grid maximum differs from $v(c)$ by at most $\eta+3\sqrt3 h/(16\Delta)$.

Let $V_0$ be the optimal reward without context, computed from the prior matrix measure $\overline M=\int M_c\,d\nu_C(c)$. Then
$$
V^*-V_0=0
\quad\Longleftrightarrow\quad
\text{some constant action belongs to }\mathcal Z_c
\text{ for }\nu_C\text{-almost every }c.
\tag{L.12.7b.5}
$$
Moreover, $V^*=1$ exactly when, almost surely in $c$, the posterior response-relevant pair $([d],\nu)$ is a point mass. The measurable maximizing policy supplies its matching axis and frequency. These are statements about the registered estimation reward (L.101); conversion to an implemented carrier response retains (L.106) and its physical detuning and source certificates.

*Proof.* Theorem L.12.7a gives a jointly Borel field, continuous in $\omega$. The largest eigenvalue is continuous in a real symmetric matrix, so $\lambda$ has the same properties. For every fixed frequency, the trace of $G_c(\omega)$ is strictly positive because $K_\Delta>0$ and $\mu_c$ is a probability measure. Hence $\lambda(c,\omega)\ge\operatorname{tr}G_c(\omega)/3>0$. Vanishing at infinity then gives a positive attained maximum in a finite interval. The reward bound gives $v\le1$. The maximum over unit $u$ is the largest eigenvalue, with equality exactly on its unit top eigenspace; this proves the description of $\mathcal Z_c$. Its frequency set is closed and bounded, and the eigenvector equation defines a closed subset of its product with $S^2$, proving compactness.

All quantities in (L.12.7b.3) are Borel. The minimum defining $R$ is finite because the frequency tails decrease to zero. If $|\omega|\ge B(c)$ and $|\nu|\le R(c)$, then $K_\Delta(\omega-\nu)\le b(c)/4$. Consequently,
$$
\lambda(c,\omega)\le\operatorname{tr}G_c(\omega)
\le b(c)/4+\mu_c(\{|\nu|>R(c)\})
\le b(c)/2
<b(c)\le\lambda(c,0).
\tag{L.12.7b.6}
$$
This proves the strict cutoff.

We verify measurability of a maximizing choice directly. Write $\omega=B(c)t$ with $t\in[-1,1]$ and let $K=S^2\times[-1,1]$, a fixed compact metric space. The function
$F(c,u,t)=u^{\mathsf T}G_c(B(c)t)u$ is jointly Borel and continuous on $K$ for each $c$. A fixed countable dense subset of $K$ computes its supremum, so $v$ is Borel. To select a maximizer, fix for each integer $n$ a finite cover of $K$ by closed sets of diameter at most $2^{-n}$. At the first level choose the first cover set on which the maximum equals $v(c)$; at the next level choose the first intersection with the previously chosen set having that property, and continue. For each fixed finite sequence of choices, the intersection is a fixed compact set. Its maximum is a Borel function of $c$, obtained on a countable dense subset of that compact set; empty intersections are discarded. Therefore every choice is Borel. The nested nonempty compact intersections have diameters tending to zero and meet the maximizing set at each level, so their unique limiting point is a maximizer. Picking fixed representatives for each of the countably many possible finite intersections shows that the limit is Borel. Returning from $t$ to $\omega=B(c)t$ gives the required Borel action.

For any policy the nonnegative conditional defect is
$$
v(c)-\int u^{\mathsf T}G_c(\omega)u\,\kappa(du\,d\omega\mid c).
$$
It vanishes exactly when the policy is concentrated on $\mathcal Z_c$. Integrating proves (L.12.7b.2), and the deterministic Borel maximizing policy proves attainment.

Differentiation of the scalar kernel gives
$$
\sup_{x\in\mathbb R}|K'_\Delta(x)|
=\sup_{y\ge0}\frac{2y}{\Delta(1+y^2)^2}
=\frac{3\sqrt3}{8\Delta}.
\tag{L.12.7b.7}
$$
The maximum occurs at $y=1/\sqrt3$. Integration against $dd^{\mathsf T}$, whose operator norm is one, gives this Lipschitz constant for $G_c$ in operator norm. The variational formula for the largest eigenvalue gives the same constant for $\lambda(c,\cdot)$. Every maximizing frequency is within $h/2$ of a grid point, proving (L.12.7b.4). The same variational formula bounds eigenvalue errors by the matrix operator-norm errors, giving the stated perturbed certificate.

The prior law is another probability law of the same class, so it has an attaining constant action $a_0$. Fubini gives $V_0=\int f(c,a_0)\,d\nu_C(c)$. Since $v(c)-f(c,a_0)\ge0$, equality $V^*=V_0$ forces $a_0\in\mathcal Z_c$ almost surely. Conversely, a constant action that is posterior-optimal almost surely has expected reward $V^*$, so the prior optimum equals it. This proves (L.12.7b.5).

Finally, under an optimal policy the reward is bounded by one. Its expectation is one exactly when, almost surely, both factors in (L.12.7a.1) equal one. These equations are $d=\pm u$ and $\nu=\omega$. Hence for almost every context its posterior is concentrated on one axis-frequency pair. Conversely, such a posterior has $v(c)=1$; the Borel maximizing policy constructed above attains that value. The source reward and physical-response certificates keep the interpretation stated in the theorem. ∎

<a id="theorem-l127c-exact-detuned-carrier-and-actual-perspective-response"></a>**Theorem L.12.7c (Exact Detuned Carrier and Actual Perspective Response).** The following complete source populates the physical carrier and perspective-response conditions jointly on one declared controlled finite experiment while preserving the full continuous classification above. Local section numbers belong to this source.

**An exact detuned physical source and finite perspective response**

All statements below concern one registered finite, externally controlled quantum experiment. This is an engineered exchange-carrier branch, not an asserted Maxwell, AC-Stark clock, gravitational, autonomous, biological, or Born-rule-violation mechanism.

## 1. Obligation and dependency

The original continuous-alphabet obligation is to extend the classification and construct the physical source, carrier channel and perspective-response map. Theorems L.12.4c–d and L.12.7a–b supply the standard-Borel classification and continuous resonance optimization. They are not reproved or restricted here. This construction supplies one nonempty same-source physical branch for the remaining conjuncts, including the causal access, populated reward, nonzero detuning, operational response calibration and actual perspective instrument. It does not claim physical realization of every abstract Borel law.

Original equations L.101 and L.106 distinguish estimation reward from implementation efficiency; L.96–97 require a registered perspective kernel and calibrated excess drift. We populate all these objects in a single experiment. The finite-support kernel below is a probability measure on actual flags, not a density with respect to full-manifold volume and not the time kernel of the separate smooth diffusion in M.5a. Its reference measure is explicitly counting measure on its two-point support. No Dirac-density substitution into the smooth branch is made.

## 2. Registered source and causal access

Fix $t^*>0$, $\hbar>0$. Let $\Theta$ be a fair classical bit stored in a target-private two-level orientation register. Its two values select real orthogonal unit dipole axes $e_{x}$ and $e_{y}$. The target transition frequency is the known constant $\omega_T=1100/t^*$. Independently supply classical noise bits $Q\sim\mathrm{Bernoulli}(1/4)$, $E\sim\mathrm{Bernoulli}(1/8)$, $B\sim\mathrm{Bernoulli}(1/2)$, and $D\sim\mathrm{Bernoulli}(1/2)$. Every mixed bit has a retained private purification; equivalently prepare $\sqrt{1-p}|00\rangle+\sqrt{p}|11\rangle$ and retain the second register. The orientation has its own fair purification. The policy has no access to these purifiers, $\Theta$, $E$, $Q$, $B$ or $D$. All are part of the apparatus resource boundary.

Prepare a blank context bit, copy $\Theta$ nondestructively into it, and XOR $Q$ into this copy. The acquired context is $C=\Theta\oplus Q$. Read $C$ in its computational basis and retain the acquisition outcome. Conditional on that actualized history, the context register is $|c\rangle\langle c|$ and the bounded observable $O_C=|1\rangle\langle 1|$ has expectation $c$. This is the literal expectation-valued context used by the predictor; its unconditioned expectation $1/2$ is not used as an informed context. The readout and its private record are counted. The finite source register may be embedded into the declared aggregate carrier without asserting a new minimum-MPU theorem. The target orientation itself is unchanged. This is a direct record-acquisition history, not an assertion that an initially correlated joint law arose without a path. The source law and all physical couplings are fixed before choosing a policy.

An admissible predictor produces $X=u(C)$, where $u$ is any of the four Boolean functions, or a randomized mixture using an independently supplied policy register. The encoding channel gives $Y=X\oplus E$. Retain $Y$ as a separate classical label; it is not the consumed carrier port. Before carrier preparation, make nondemolition copies of $\Theta$ and this $Y$ into fresh private archives $A_\Theta,A_Y$. Those archives are retained and inaccessible to the predictor and retained click event algebra. Their partial trace physically dephases both labels, including on coherent test inputs. The carrier is prepared in excitation port $|Y\rangle$. The policy only receives $C$ and its own independent randomness. The target's orientation gates its local interaction physically; no comparison $\Theta=X$ is available to the predictor or actuator.

The exact classical factorization, after the target readout below, is

$$
P(\theta,c,x,y,z,b,d)= (1/2)\, Q_q(c|\theta)\, \kappa(x|c)\, W_s(y|x)\, [\alpha\, 1_{y=\theta}]^z [1-\alpha\, 1_{y=\theta}]^{1-z} (1/4),
$$

where $q=1/4$, $s=1/8$ and $\alpha=1/2501$. The convention at zero probability is the ordinary Bernoulli law, not $0^0$. All channels are chronological instruments; $\Theta$ and $C$ precede $X$. Retaining purifiers and gate records does not give the predictor additional access.

For any policy define $r=\Pr(X=\Theta)$ and $a=\Pr(Y=\Theta)$. Then $a=s+(1-2s)r=1/8+3r/4$. Identity, complement and the two constant policies give respectively $r=3/4,1/4,1/2,1/2$. Independent randomized policies give their convex hull. Thus the exact optimum is $r^*=3/4$, $a^*=11/16$. The optimal information-free values are $r_0=a_0=1/2$. The delivered advantage is $a^*-a_0=3/16$.

The mutual information of acquired context is $\ln 2-h(1/4)>0$. The carrier is precisely an unassisted one-use BSC with capacity $\ln 2-h(1/8)$; no target-private side record is receiver assistance for that channel. The subsequent detector is a target interaction and is not falsely treated as satisfying $\Theta\to Y\to Z$, since $\Theta$ also enters the target Hamiltonian.

## 3. Exact off-resonant carrier and target response

The carrier Hilbert space is $\operatorname{span}\{|v\rangle,|x\rangle,|y\rangle\}$. Write $a_j=|v\rangle\langle j|$. The target TLS has $|g\rangle,|e\rangle$, with $\sigma_+=|e\rangle\langle g|$. During the interaction pulse use

$$
H=\hbar\omega_T |e\rangle\langle e| + \hbar\omega_C (|x\rangle\langle x|+|y\rangle\langle y|) + \hbar g \sum_{j=x,y} |j\rangle\langle j|_\Theta \otimes (\sigma_+ a_j + \sigma_- a_j^\dagger),
$$

with $\omega_C=1000/t^*$, $g=1/t^*$. Identity factors are implicit. The orientation remains nondemolition. This finite Hamiltonian conserves total target-plus-carrier excitation number. It is positive: in each interacting one-excitation block its diagonal entries are $\omega_T,\omega_C$ and determinant $\omega_T\omega_C-g^{2}>0$; vacuum has zero energy, unmatched excitation has energy $\omega_{C}$, and two-excitation states have energy $\omega_T+\omega_C$ and cannot couple. No negative-energy instability or infinite oscillator truncation is being assumed.

Initially the TLS is $|g\rangle$ and the carrier is $|Y\rangle$. For $Y=\Theta$ the occupied block is $\{|g,Y\rangle,|e,v\rangle\}$ with frequency matrix $\begin{bmatrix}\omega_C & g \\ g & \omega_T\end{bmatrix}$. For $Y\ne\Theta$ there is no transfer. Put $\Omega=\sqrt{(\omega_T-\omega_C)^{2}+4g^{2}}=\sqrt{10004}/t^*$ and choose pulse duration $\tau=\pi/\Omega$. Exact exponentiation gives

$$
\Pr(e \mid Y=\Theta)=4g^{2}/\Omega^{2} \sin^{2}(\Omega\tau/2)=1/2501=:\alpha,
$$

$$
\Pr(e \mid Y\ne\Theta)=0.
$$

A nondemolition energy measurement of the TLS gives the actual click $Z$. In the idle control the carrier is $|v\rangle$, so $Z=0$ exactly. The click is a target transition, not a paid reward coin. Its energy change is $\hbar\omega_TZ$. Carrier energy loss and switching work are retained in the common ledger below.

The physical detuning is $\Delta_{\mathrm{drive}}=\omega_T-\omega_C=100/t^*\ne 0$. The isolated finite model has $\Gamma=0$; using $\Omega_R=2g$, the exact ratio is $|\Delta_{\mathrm{drive}}|/\Omega_R=50$. More generally replace $100$ by $D\ge 100$ and $\omega_{T}$ by $(1000+D)/t^*$: $\alpha_D=4/(D^{2}+4)$, $\tau_D=\pi t^*/\sqrt{D^{2}+4}$, giving an arbitrarily large, explicitly controlled detuning margin. No dispersive approximation is needed. The estimator's frequency action is separately $\hat\omega=\omega_T$, not $\omega_{C}$. Estimation at the target frequency does not remove drive detuning.

## 4. Populated resonance reward and operational CC calibration

For L.101 choose any $\Delta_{\mathrm{opt}}>0$, allow all real unit-vector estimates and all frequency estimates, and set the true axes to $e_x,e_y$ and true frequency to $\omega_{T}$. Conditional on $C=c$, the posterior axis matrix has eigenvalues $3/4,1/4,0$. The Lorentzian frequency factor is at most one and is attained by $\hat\omega=\omega_T$. Therefore the full continuous action supremum in L.101 is $\eta_{\mathrm{res}}=3/4$, attained by choosing $e_{c}$. Without context it is $\eta_{\mathrm{prior}}=1/2$. Thus the Boolean implementation attains the full L.101 optimum, rather than optimizing only a silently restricted action set. For suboptimal Boolean policies $r$ is their achieved alignment, not the supremum $\eta_{\mathrm{res}}$.

The implementation efficiency at the optimum is $\eta_{\mathrm{impl}}=a^*=11/16\le 3/4=\eta_{\mathrm{res}}$. For information-free optimal policies it is $1/2$. For every admitted randomized policy $a\le 11/16\le\eta_{\mathrm{res}}$. This independently proves the replacement required in L.106. On comparisons of optimal coarse versus refined context policies, $a^*=s+(1-2s)\eta_{\mathrm{res}}$ and $\eta_{\mathrm{res}}\ge 1/2$.

Here is an operational-map certificate, including its normalization. On the eight-dimensional retained $\Theta\otimes Y\otimes Z$ event space, let $M=\sum_j|j,j\rangle\langle j,j|$ on $\Theta\otimes Y$. Define channels on every operator $X$ by first taking the diagonal of $\operatorname{Tr}_ZX$ in the $\Theta,Y$ basis. The idle channel $\Phi_{0}$ preserves that classical diagonal and prepares $Z=0$. The active channel $\Phi_{1}$ prepares $Z\sim\mathrm{Bernoulli}(\alpha)$ in each matched block and $Z=0$ in each unmatched block, preserving the same labels. These are actual reduced measure-and-prepare channels from the detector experiment: the private archives implement dephasing on every coherent label input, not only on the nominal classical source. For the map extension to arbitrary incoming $Z$, swap the old $Z$ into a fresh private archive and use its supplied blank replacement for the new click. This physical preparation implements $\operatorname{Tr}_Z$ on every input, while retaining the old information outside the declared event algebra. The target TLS and carrier are supplied fresh for this channel invocation. Let $L_S=\Phi_1-\Phi_0$. This is a complex-linear endomap, Hermitian-preserving and trace-annihilating. For every state $\rho$,

$$
(1/2)\lVert L_S(\rho)\rVert_1=\alpha\, \operatorname{Tr}[(M\otimes I_Z)\rho]\le\alpha.
$$

Equality holds on any matched-label state, and the event $Z=1$ achieves that difference. Hence Definition 30 gives $\mathrm{CC}(S)=\lVert L_S\rVert_{\mathrm{op}}=\alpha$ exactly. In the actual source, $|\Delta P(Z=1)|=\alpha a=\mathrm{CC}(S)\eta_{\mathrm{impl}}$. Every effect on this retained output algebra obeys the same upper bound by the trace norm. This is a difference of physical active/idle instruments, not a violation of the Born rule or a derivation of a nonzero CC value from abstract information alone. The supplied carrier fixes the map.

Unobserved purifiers and microscopic phase records remain in the resource boundary but are not covertly added to this declared retained target-click event algebra. A norm on a larger event algebra is a different certificate and is not claimed equal to $\alpha$.

## 5. Two actual perspectives and an instrument-induced kernel

Let the MPU probe Hilbert space be $\mathbb{C}^8$ with ordered basis $|0\rangle,\ldots,|7\rangle$. Let $s_{0}$ be its ordered canonical rank-one projective context. Let $R$ be the real rotation by $\pi/4$ in the first two basis vectors, identity on the others, and $s_1=Rs_0$. These are distinct complete ordered flags in $\Sigma=U(8)/U(1)^8$. Equip $\Sigma$ with the original normal homogeneous metric induced by $-\operatorname{Tr}(XY)/2$. Put $d=d_\Sigma(s_0,s_1)>0$. All formulas use this actual geodesic distance, not an unrelated distance between bit labels. It is finite and positive because $\Sigma$ is a compact Riemannian manifold and the flags are distinct. In fact $d=\pi/4$ exactly. The rotation curve has speed $1$ under the stated metric and gives the upper bound $\pi/4$. Projection of an ordered flag to its first ray is $1$-Lipschitz: for a horizontal anti-Hermitian tangent $A$ the flag speed squared is $\sum_{i<j}|A_{ij}|^{2}$, whereas the first-ray Fubini–Study speed squared is $\sum_{i>0}|A_{i0}|^{2}$. The first-ray distance is $\arccos|\langle 0|R|0\rangle|=\pi/4$, yielding the matching lower bound. Thus $d^{2}=\pi^{2}/16$ is completely explicit.

A preliminary canonical projective measurement of the supplied probe state $|0\rangle$ produces the actual outcome $k=0$ with certainty and retains its pointer. Its complete apparatus flag is $s_k=s_0$; this preliminary measurement leaves the probe in $|0\rangle$. This registers the conditioning outcome and complete target flag before the carrier-driven context update. Both previous contexts $s\in\{s_0,s_1\}$ are admitted. After measuring $Z$, compute $F=B[(1-Z)+ZD]$ reversibly into a blank bit, retaining $Z,B,D$. Thus $F=B$ when $Z=0$ and $F=BD$ when $Z=1$. Set the next instrument to the actual complete projective measurement with projectors $P_{F,j}=R^F|j\rangle\langle j|(R^\dagger)^F$. This is implemented by controlled $R^\dagger$ before a canonical measurement and controlled $R$ afterward, with a complete retained outcome record $j$.

The literal realized physical signal in L.96 is $N=Z$. Conditional on $Z=z$ the next-context weights are

$$
w_0(z)=1/2+z/4,\quad w_1(z)=1/2-z/4.
$$

For any probe input $\rho$ at the later context-measurement port (after the preliminary k readout), the actual subnormalized instrument branches are

$$
I_{z,F,j}(\rho)=w_F(z)\, P_{F,j}\rho P_{F,j}.
$$

Summing over $j$ has trace $w_F(z)$, for every input $\rho$. Therefore the actual conditional perspective kernel is

$$
\begin{aligned}
G_Z(s_0|s,k=0,N=z,T) &= 1/2+z/4,\\
G_Z(s_1|s,k=0,N=z,T) &= 1/2-z/4,
\end{aligned}
$$

for both admitted previous contexts $s$. Both conditional kernels have full support and finite potentials. The detector record $Z$ is a genuine retained outcome, not renamed as a statistical law. Summing the instrument over its actual click law $\mathrm{Bernoulli}(\alpha a)$ gives the distinct source-averaged kernel

$$
\bar G(s_0|s)=(1+\alpha a/2)/2,\quad \bar G(s_1|s)=(1-\alpha a/2)/2.
$$

No Born factor is multiplied a second time. If conditioning additionally on the later probe outcome j, Bayes' rule changes the flag weights; that different posterior is not asserted to equal $G_{Z}$ or Gbar. The label $k=0$ is the preliminary apparatus outcome and names its complete target flag; it is distinct from the later j.

For the supplied probe $|0\rangle$, $\Pr(j=0\mid Z=z)=3/4+z/8$, since context $s_{0}$ yields outcome $0$ surely and context $s_{1}$ yields it with probability $1/2$. Consequently $\Pr(j=0)=3/4+\alpha a/8$, with prior-policy advantage $\alpha(a-1/2)/8>0$. This changes an actual projective-instrument response, not just a label. Ideal finite-model implementation error is zero.

Both $G_{Z}$ for each fixed $z$ and $\bar G$ have constant rows on the admitted support. Thus each contracts total variation and $W_{1}$ for the actual restricted metric $d_\Sigma$ to zero in one use. This is forgetting of the initial context, not convergence to $\delta_{s_0}$. Mean squared distance to the target under $\bar G$ is $d^{2}(1-\alpha a/2)/2$, strictly decreasing with $a$. No singular or sharp-projective limit is invoked.

## 6. Literal-signal potentials and effective L.97 calibration

Register the same positive full-use clock T for every admitted policy. For each realized signal z use counting measure on the actual two-context support and the finite-use convention

$$
\begin{aligned}
G_Z(s'|s) &= \exp[-T V_z(s')]/\sum_{u\in\{s_0,s_1\}}\exp[-T V_z(u)],\\
V_z(s') &= \lambda_z d_\Sigma^{2}(s',s_0)/2.
\end{aligned}
$$

The physically derived odds are 1 at $z=0$ and 3 at $z=1$. Therefore

$$
\lambda_0=0,\quad \lambda_1=2\ln 3/(Td^{2}).
$$

This is a literal $N=Z$ instance of L.96, with finite nonnegative coefficient on every realized branch. The convention declares potential per unit use-time; $\beta_z=T\lambda_z$ is the dimensionless Gibbs coefficient. It is not an identification with the smooth diffusion generator/Hessian in M.5a. For $z=1$ the original finite-interaction M.5 shape on this registered counting support has $K=1$ and $\sigma^{2}=1/(T\lambda_1)$; for $z=0$ it is the uniform zero-potential branch. Neither is claimed to be a volume density on the whole flag manifold.

There are two distinct effective response summaries, both determined by this same instrument:

1. The mean realized conditional drift coefficient is

$$
\lambda_{\mathrm{eff}}:=\mathbb{E}[\lambda_Z]=2\alpha a\ln 3/(Td^{2}).
$$

Its prior value is $\lambda_{\mathrm{prior}}=\alpha\ln 3/(Td^{2})$. On optimal policies whose feasible sets include constants, $a^*=s+(1-2s)\eta_{\mathrm{res}}\ge 1/2$. Hence the exact attained calibration is

$$
\begin{aligned}
\lambda_{\mathrm{eff}}-\lambda_{\mathrm{prior}} &= \lambda_{\mathrm{span}}(\eta_{\mathrm{res}}-\eta_{\mathrm{prior}}),\\
\lambda_{\mathrm{span}} &= 2\alpha(1-2s)\ln 3/(Td^{2}),\quad \eta_{\mathrm{prior}}=1/2.
\end{aligned}
$$

This supplies L.97 with equality for the registered mean-conditional response convention. It is not claimed that averaging conditional potentials produces the potential of their mixture. A deliberately inferior policy may have $a<1/2$; it is not forced into the nonnegative optimal-advantage bound.

2. The potential coefficient of the separate source-averaged kernel Gbar is

$$
\bar\lambda(a)=4\operatorname{atanh}(\alpha a/2)/(Td^{2}).
$$

It follows by taking that kernel's actual odds. Its baseline is $\bar\lambda(1/2)$, and the derivative bound gives

$$
0\le\bar\lambda(a^*)-\bar\lambda(1/2)\le[2\alpha(1-2s)/(Td^{2}(1-\alpha^{2}/4))](\eta_{\mathrm{res}}-1/2).
$$

This is a second, explicitly coarse-grained calibration, not the mean coefficient in item1. The exact signal-conditioned potentials, mean effective coefficient and marginal potential are kept distinct. The physical response and both effective coefficients are strictly increasing in a. Under a lossless context refinement, copying every coarser policy makes the feasible physical policy sets nested, so the physically attained optima are nondecreasing. This proves attainable ordering from the implemented response, rather than inferring it merely from a rising upper bound. At zero causal information $\eta_{\mathrm{res}}=1/2$, so both excess responses vanish while their prior baselines remain nonzero.

## 7. Common clock, physical control and full finite ledger

Use one fresh finite apparatus per experiment. There is no reuse/reset claim. Register a finite list of preparation, acquisition, policy, channel, detector, reversible Boolean, controlled rotation and readout gates. Compile every finite unitary with the bounded principal-log Hamiltonian: if $U=e^{-iK}$, $\lVert K\rVert\le\pi$, run $H_U=(\hbar/t^*)(K+\pi I)$ for $t^*$. Its endpoint is $U$ up to an irrelevant common phase, $H_{U}\ge 0$ and $\lVert H_U\rVert\le 2\pi\hbar/t^*$. Classical measurements are finite unitary copying dilations followed by retaining the pointer. Any purification preparation is a unitary on supplied blank registers. The four Boolean policies can be implemented by the same fixed truth-table circuit with a two-bit program; all program values have identical register size and scheduled duration. Randomized mixtures retain a finite four-valued program with an arbitrary supplied distribution. Their exact probabilities are source-state parameters, not unpriced precision-free computed outputs.

For definiteness choose $N=32$ macro-unitary slots. Slots 1–6 prepare the $\Theta,Q,E,B,D$ pairs and four-valued policy-program purification; slots 7–8 copy $\Theta$ and XOR $Q$ into $C$; slot 9 reads and retains $C$; slot 10 evaluates the selected Boolean truth table into blank $X$; slots 11–12 copy $X$ and XOR $E$ into $Y$; slots 13–14 copy $\Theta$ and retained $Y$ into their private archives; slot 15 swaps incoming $Z$ into its private blank archive; slot 16 prepares carrier port $|Y\rangle$ from $|v\rangle$; slot 17 makes the preliminary canonical probe readout $k$; the carrier pulse follows; slot 18 copies the target energy into detector $Z$; slot 19 reversibly computes $F$ into a blank bit; slot 20 applies controlled $R^\dagger$; slot 21 copies the canonical eight-valued probe outcome $j$; slot 22 applies controlled $R$. Slots 23–32 are identity padding. Copying-readout dilations retain their pointers and any environment required by the declared projective instrument. Each numbered slot is one finite unitary on the whole finite apparatus; the principal-log construction implements these macro-unitaries directly, so no uncounted primitive gate decomposition is assumed. Schedule slots 17 and 18 immediately before and after the pulse, respectively. Source preparation starts at time zero. Let the carrier pulse have duration $\tau$ above and allow one $t^*$ holding/switching slot at each end. Set $T=(N+2)t^*+\tau$. Every policy uses this same full elapsed window, including preparation, acquisition, measurement and perspective execution. No overlapping pipelines or limit $T\to 0$ is invoked. If an implementation uses a longer finite gate decomposition, increase $N$ and $T$ consistently in every formula. Ideal piecewise-controlled switches are part of this registered controlled finite-Hamiltonian branch; autonomy and manufacture are not inferred.

The initial supply consists of the orientation, its purification, noise bits and their purifications, context, policy program and purifier if mixed, carrier qutrit, target TLS, probe octet, finite copying pointers, reversible scratch and schedule/controller record. Every blank and purification is supplied once and retained. A gate-by-gate construction needs only finitely many qubits; N and the full gate list are admitted apparatus data, not a varying resource hidden in a limit. No register is erased, recycled, discarded from the accounting boundary or accessible outside its specified causal port.

One explicit finite register inventory is: five bit/purifier pairs for $\Theta,Q,E,B,D$ (ten qubits); a four-valued policy program and four-valued purifier (four qubit-equivalent dimensions); $C,X,Y,Z,F$ (five qubits); $A_\Theta,A_Y$ and the incoming-$Z$ archive (three qubits); the $C$ readout pointer and its private copy (two qubits); a private copy of the target-click pointer $Z$ (one qubit); the preliminary $k$ pointer and its private copy (two eight-level registers); the later $j$ pointer and its private copy (two eight-level registers); the target TLS (one qubit), carrier qutrit and probe octet. A 35-valued classical schedule/program record is retained for the controlled sequence. Thus a sufficient complete Hilbert-space dimension is $35\cdot 3\cdot 8\cdot 2^{38}$, before an optional work-storage dilation. Each readout slot denotes the finite unitary that both copies its projective outcome into its pointer and copies that pointer into the listed private environment. Partial tracing only for the declared observed algebra then realizes the stated projective CP instrument, while the private copies remain inside the resource ledger. Initial blank pointer, archive and scratch states are all supplied and charged as stock; no outcome is erased. The pulse controls and the bounded work supplier are external declared resources, not claimed to form an autonomous clock.

All memories and source bits may be energetically degenerate; their nonzero dimension, preparation and purity stock are nevertheless declared resources. The carrier starts at time zero in $|v\rangle$ with zero energy and has energy $\hbar\omega_C$ after its funded slot 16 preparation; the target and probe start in their registered ground/pure states. The exchange coupling has norm $\hbar g$. Turning it on/off changes the energy ledger by the actual state expectation of that term; each switch has absolute work at most $\hbar g$, hence total absolute interaction-switch work at most $2\hbar g$. The registered free Hamiltonian on the nondegenerate target/carrier subsystem has norm $E_{\mathrm{free}}=\hbar(\omega_T+\omega_C)$; all other memory and probe factors may be degenerate. Gate controls replace the free Hamiltonian during each gate slot, rather than silently adding an uncompensated free evolution. Switching from free evolution to $H_{U}$ and back costs at most $2(\lVert H_U\rVert+E_{\mathrm{free}})$ in absolute work per slot. Thus total absolute gate-switch work is at most $N(4\pi\hbar/t^*+2E_{\mathrm{free}})$. Retain a work source with supplied finite budget $W_{\mathrm{sup}}\ge N(4\pi\hbar/t^*+2E_{\mathrm{free}})+2\hbar g+\hbar\omega_C$, plus initial source preparation stock. Actual energy balance is $\Delta E_{\mathrm{system}}=W_{\mathrm{control}}$ on each isolated controlled stage; no unrecorded heat or free-reset term is used. Work sources and switching records remain separate from the target-click reward. This bound is conservative, includes scalar offsets, and does not identify integrated work with a rate: any declared rate is divided by the same $T$.

The apparatus's cost record is the tuple (all initial states and dimensions, N, T, Hamiltonian norms, $W_{\sup}$, retained final records). This target asks for a source/response bridge, not a unique economic price or a proof of Landauer saturation. If a numerical service price is added, it is an independent declared cost on this entire tuple. No thermodynamic L.103–105 conclusion is imported without its reset hypotheses.

## 8. Conclusion and precise limits

The same registered source gives an independently generated context, a real target-gated detuned carrier, the full continuous-action resonance optimum, a calibrated operational influence norm, and an actual normalized two-context projective-response kernel. Its strictly positive excess drift and probe response are derived from the target-click instrument. Together with the standard-Borel and continuous-resonance classification of Theorems L.12.4c–d and L.12.7a–b, this gives the causal-information-to-response law on its declared physical branch. It adds no universal biological, autonomous, smooth-diffusion, Maxwell or gravity assertion.

-----

### **L.12.5 Resource Cost of Causal Information Acquisition**

<a id="theorem-l122-conditional-reset-cost-of-causal-information"></a>**Theorem L.12.2 (Conditional Reset Cost of Causal Information).** Let a registered protocol use a finite deterministic number $n_{\mathrm{int}}$ of interactions. On one common target law, write its complete classical decoding histories as $H_k=(H_{k-1},Y_k)$ and define $\Delta I_k:=I(\theta_T;Y_k\mid H_{k-1})$. Suppose $0<I_0:=\sum_k\Delta I_k<\infty$ and an operational certificate for the actual protocol, including all decoder side information, gives $0\le\Delta I_k\le C_{\max}<\infty$ with $C_{\max}>0$. An unassisted classical-capacity bound is used only on that communication branch, without uncharged entanglement assistance or side channels. Then
$$
n_{\mathrm{int}}
\ge
\left\lceil\frac{I_0}{C_{\max}}\right\rceil.
\tag{L.103}
$$
For the reset bound, require every counted interaction to contain a distinct registered reset with classical pre-reset law $q_k(P_k,R_k)$, satisfying the full hypotheses of Definition 28 and Theorem E.1. All reset baths have the same $T>0$; the required bath independence, auxiliary closure and finite-resource or justified-limit conditions hold for each event. Define the acquisition bath heat as the sum of these event mean heats, with no duplicated bath contribution and no conditioning on a subset selected by its realized heat:
$$
\langle Q_{\mathrm{bath}}^{\mathrm{acq}}\rangle
:=\sum_{k=1}^{n_{\mathrm{int}}}\langle Q_{\mathrm{bath},k}\rangle,
\qquad
\frac{\langle Q_{\mathrm{bath}}^{\mathrm{acq}}\rangle}{k_BT}
\ge
\sum_{k=1}^{n_{\mathrm{int}}}H_{q_k}(P_k\mid R_k).
\tag{L.103a}
$$
If this same collection supplies the additional uniform floor $H_{q_k}(P_k\mid R_k)\ge h_{\min}>0$ for every $k$, then
$$
\frac{\langle Q_{\mathrm{bath}}^{\mathrm{acq}}\rangle}{k_BT}
\ge
h_{\min}\left\lceil\frac{I_0}{C_{\max}}\right\rceil.
\tag{L.103b}
$$
On the separate registered-reset branch of Theorem 33, define the bath entropy export $\Delta S_k:=\langle Q_{\mathrm{bath},k}\rangle/T=k_B\varepsilon_{\mathrm{reset},k}$ and $\Delta S_{\mathrm{acq}}:=\sum_k\Delta S_k$. If every counted interaction satisfies $\Delta I_k\ge\Delta I_{\min}>0$ and $H_{q_k}(P_k\mid R_k)\ge h_{\min}>0$, set $\kappa_r:=\Delta I_{\min}h_{\min}$. Then Theorem 33 gives $\Delta I_k(\Delta S_k/k_B)\ge\kappa_r$, and
$$
I_0\frac{\Delta S_{\mathrm{acq}}}{k_B}
\ge
\sum_{k=1}^{n_{\mathrm{int}}}\Delta I_k\frac{\Delta S_k}{k_B}
\ge
\kappa_r n_{\mathrm{int}}.
\tag{L.104}
$$

*Proof.* The capacity bound gives $\Delta I_k\le C_{\max}$, hence $I_0\le n_{\mathrm{int}}C_{\max}$ and (L.103). Theorem E.1 gives $\langle Q_{\mathrm{bath},k}\rangle/(k_BT)=H_{q_k}(P_k\mid R_k)+\varepsilon_{\mathrm{diss},k}\ge H_{q_k}(P_k\mid R_k)$ for each registered reset; summing gives (L.103a), and the declared uniform floor plus (L.103) gives (L.103b). Under the additional Theorem 33 hypotheses, all factors are nonnegative, so expanding the product of the two sums gives
$$
\left(\sum_k\Delta I_k\right)
\left(\sum_j\frac{\Delta S_j}{k_B}\right)
\ge
\sum_k\Delta I_k\frac{\Delta S_k}{k_B},
$$
and summing the eventwise trade-offs proves (L.104). ∎

<a id="corollary-l125-conditional-pce-acquisition-rate-cost"></a>**Corollary L.12.5 (Conditional PCE Acquisition-Rate Cost).** Assume the complete acquisition and reset hypotheses of Theorem L.12.2, including its uniform floor $h_{\min}>0$, and let $\tau_{\mathrm{acq}}>0$ be the registered duration. Put $n=n_{\mathrm{int}}$ and define the charged mean bath-heat power by $R_{\mathrm{acq}}:=\langle Q_{\mathrm{bath}}^{\mathrm{acq}}\rangle/\tau_{\mathrm{acq}}$. Then
$$
R_{\mathrm{acq}}
\ge\frac{k_BT}{\tau_{\mathrm{acq}}}
\sum_{k=1}^{n}H_{q_k}(P_k\mid R_k)
\ge\frac{k_BT}{\tau_{\mathrm{acq}}}h_{\min}
\left\lceil\frac{I_0}{C_{\max}}\right\rceil.
$$
To insert this heat ledger into Equation (L.1), additionally require $\lambda_{\mathrm{ctrl}}\ge0$ and an acquisition-window accounting certificate with $R_{\mathrm{cost}}\ge R_{\mathrm{acq}}$. In particular, identifying a work or total-resource cost with this bath-heat power requires the corresponding energy, storage and payer balance. If the remaining terms in that window are the displayed representation cost and utility $U_{\mathrm{bias}}(I_0)$, then
$$
V_{\mathcal I}
\ge\lambda_{\mathrm{rep}}C_P(\text{context}_S)
+\lambda_{\mathrm{ctrl}}\frac{k_BT}{\tau_{\mathrm{acq}}}
h_{\min}\left\lceil\frac{I_0}{C_{\max}}\right\rceil
-\Gamma_{\mathrm{utility}}U_{\mathrm{bias}}(I_0).
\tag{L.105}
$$
The first inequality follows by dividing (L.103a) by the positive duration; the second uses its uniform-floor branch. Multiplication by the nonnegative control coefficient and substitution of the declared resource-cost bound give (L.105).
This bounds registered-reset acquisition power on the registered window. A continuing maintenance cost requires a separate refresh-rate ledger, and the information–reset-cost product of Theorem 33 belongs to its separately registered branch.

-----

### **L.12.6 The Effective CC Influence Bound**

Let a specified implementation supply a carrier-response certificate with efficiency $\eta_{\text{impl}}(S,T)\in[0,1]$:
$$
|\Delta P(i;S\to T)|
\leq
\mathrm{CC}(S)\eta_{\text{impl}}(S,T)
\leq
\mathrm{CC}(S).
\tag{L.106}
$$
The estimation reward $\eta_{\text{res}}$ of Equation (L.101) may replace $\eta_{\text{impl}}$ only when an independent calibration proves $\eta_{\text{impl}}\leq\eta_{\text{res}}$. Without that calibration, Definition 30 supplies only $|\Delta P|\leq\mathrm{CC}(S)$.

<a id="corollary-l127-em-resonance-factor-as-a-posterior-bayes-reward"></a>**Corollary L.12.7 (EM Resonance Factor as a Posterior Bayes Reward).** Let $C:=\text{context}_S$ and define
$$
r(d,\nu;\hat d,\omega)
:=|d\cdot\hat d|^2
\frac{\Delta_{\mathrm{opt}}^2}{\Delta_{\mathrm{opt}}^2+(\omega-\nu)^2},
\qquad\|d\|=\|\hat d\|=1.
$$
Assume $C$ and the target pair take values in standard Borel spaces, and register a regular conditional target law $\pi_c$. Let the common action set $A\subset S^2\times\mathbb R$ be nonempty and compact, with all measurable $A$-valued policies admissible. Define
$$
f(c,a):=\int r(a;\hat d,\omega)\,\pi_c(d\hat d\,d\omega),
\qquad
v(c):=\max_{a\in A}f(c,a).
$$
Require a measurable maximizing selection $a^*(c)\in\operatorname*{arg\,max}_{a\in A}f(c,a)$ as part of the posterior-policy certificate. Compactness supplies pointwise maximizers; using them as a policy requires this selection property. Then
$$
\eta_{\mathrm{res}}^{EM}(S,T)
=\mathbb E[v(C)]
=\mathbb E\!\left[
\max_{a\in A}\mathbb E[r(a;\hat d_{\mathrm{TLS}},\omega_{\mathrm{TLS}})\mid C]
\right].
\tag{L.107}
$$
An attained value of one has the dipole-axis and frequency equality conditions stated after (L.101). Exact posterior identification of that response-relevant pair, with an admissible measurable matching policy, is sufficient. Under zero mutual information between $C$ and the target pair, the value reduces to the optimal prior-only reward.

*Proof.* The reward is bounded and jointly measurable, and is continuous in the action because $\Delta_{\mathrm{opt}}>0$. Integration against the registered probability kernel makes $f$ jointly measurable; dominated convergence makes $f(c,\cdot)$ continuous. Compactness gives its maximum. A countable dense subset of $A$ computes the same supremum, so $v$ is measurable. Every admissible policy has conditional reward at most $v(C)$; the supplied measurable selection attains it. Taking expectations proves (L.107). Independence makes $\pi_c$ equal to the prior almost surely, and a constant maximizing action attains the prior value. The reward-one conclusion follows from the nonnegative-defect argument after (L.101).

For the polarization factor alone, if every unit direction is admissible, write $M_c=\mathbb E[\hat d_{\mathrm{TLS}}\hat d_{\mathrm{TLS}}^T\mid C=c]$. Its expected reward is $d^TM_cd$; diagonalizing the positive matrix shows that any unit eigenvector for its largest eigenvalue maximizes it. For squared frequency loss with finite conditional second moment, the identity $\mathbb E[(\omega-\nu)^2\mid C]=\operatorname{Var}(\omega\mid C)+(\nu-\mathbb E[\omega\mid C])^2$ gives the conditional mean when admissible. That loss identity does not apply to the Lorentzian reward. ∎

-----

### **L.12.7 Locality as a PCE Consequence: Three Independent Enforcement Mechanisms**

<a id="theorem-l12-conditional-locality-of-target-conditioned-cc-advantage"></a>**Theorem L.12 (Conditional Locality of Target-Conditioned CC Advantage).** Assume:

1. the initial joint law obeys the causal-Markov condition that $\text{context}_S$ and $\theta_T$ are conditionally independent whenever there is no common-cause or directed ND-RID path from the causal past to both records;
2. $\text{context}_S(t)$ is generated only from records available in the causal past at time $t$;
3. the relevant ND-RID branch has an exact causal cone, or the Appendix F continuum bridge applies and its limiting cone is the geometric lightcone.

Then any target-conditioned resonance advantage beyond the optimal information-free baseline can occur only for a target whose relevant record shares a causal past with $S$. In the Appendix F continuum branch, that history is contained in the geometric past lightcone. A Lieb-Robinson estimate without an exact-cone hypothesis gives only quantitative suppression outside an effective cone.

*Proof.* Let $C=\text{context}_S(t)$ and $\Theta=\theta_T$. Corollary L.12.4 gives
$$
\text{target-conditioned advantage}>0
\quad\Longrightarrow\quad
I(C;\Theta)>0.
$$
Under hypothesis 1, absence of a common-cause or directed causal path implies
$$
\mathcal P(C,\Theta)=\mathcal P(C)\mathcal P(\Theta),
$$
which gives $I(C;\Theta)=0$. The contrapositive therefore implies that positive target-conditioned advantage requires a shared causal history. Hypothesis 2 excludes dependence on post-$t$ events. Hypothesis 3 confines every directed interaction path to the declared causal cone; on the continuum branch this is the geometric past lightcone. Combining these implications proves the claim. ∎

<a id="remark-l124-distinct-roles-of-the-three-restrictions"></a>**Remark L.12.4 (Distinct Roles of the Three Restrictions).** Exact propagation supplies the spatial causal cone. The arrow-of-time branch supplies past directionality. A registered range-cost lower bound can make sufficiently distant correlations PCE-disfavored when its cost exceeds the bounded utility, but it does not make finite spacelike correlations identically zero. These restrictions are logically distinct and are not interchangeable proofs of exact locality.

-----

### **L.12.8 The Unified Picture**

The conditional relations of this section can be organized as follows:

|Level |Established object |Additional branch requirement |
|:------------------------|:--------------------------------------------------------------------|:--------------------------------------------------------------------|
|**Temporal model** |Dimensionless clock perturbation $\delta\tau_{\text{CC}}$ |A registered map from a physical carrier to the clock variable |
|**Information-theoretic** |Mutual information $\mathcal I(S\to T)$ and decision reward $\eta_{\text{res}}$ |A normalized joint law and the causal-separation hypotheses |
|**Operational** |Target-conditioned advantage under context refinement |A carrier-response certificate converting a policy reward to $\Delta P$ |
|**Field-theoretic** |Conditional AC-Stark and Lindblad scaling |A source current, target coupling, detuning regime, and measured susceptibility |

These levels are compatible only on branches satisfying all requirements in the last column. A shared state or a model record does not replace the causal carrier needed for a target-local response.

<a id="corollary-l126-conditional-information-theoretic-influence-bound"></a>**Corollary L.12.6 (Conditional Information-Theoretic Influence Bound).** On an implementation satisfying the response certificate of Equation (L.106),
$$
|\Delta P(i;S\to T)|
\leq
\text{CC}(S)\eta_{\text{impl}}(S,T).
\tag{L.108}
$$
If an additional calibration proves
$$
\eta_{\text{impl}}(S,T)\leq f(\eta_{\text{res}}(S,T))
$$
for a specified nondecreasing $f:[0,1]\to[0,1]$, then
$$
|\Delta P(i;S\to T)|
\leq
\text{CC}(S)f(\eta_{\text{res}}(S,T)).
$$
Proposition L.12.1 makes $\eta_{\text{res}}$ non-decreasing along context refinements. It does not define a universal function of the scalar mutual information alone.

*Proof.* The first inequality is Equation (L.106). Substitution of the calibration inequality gives the second. The refinement statement is exactly the policy-set inclusion proved in Proposition L.12.1. ∎

-----

### **L.12.9 The Entanglement-Mediated Channel**

The causal information framework extends first to the local-CPTP entanglement-correlation branch, where $S$ modulates preparation, measurement, or local context channels while preserving no-signaling marginal identities. The stronger nonlocal/state-mediated marginal-anomaly branch is branch (iii) of Postulate 3, PU's statistical-FTL hypothesis, separate from the core CC closure; it lies outside the exact pre-lightcone context-independence branch by Corollary 39c.1, so a certified shift would select it over that branch, while a null result keeps that branch. Its external regular finite-window model carries the declared support, sampling, information-rate, and validation gates of Section 10. The branch analyzed here uses pre-existing entanglement in the global state $\omega_{AB}$ and local context-dependent modulation of joint statistics $\omega(A \otimes B)$.

<a id="definition-l122-entanglement-causal-information-on-the-operator-schmidt-branch"></a>**Definition L.12.2 (Entanglement Causal Information on the Operator-Schmidt Branch).** Let $\omega_{AB}$ be a bipartite density operator on finite-dimensional Hilbert spaces $\mathcal H_A\otimes\mathcal H_B$. Equivalently, in an infinite-dimensional representation, assume that
$$
X_{AB}:=\omega_{AB}-\omega_A\otimes\omega_B
$$
is Hilbert-Schmidt and admits an operator-Schmidt expansion
$$
X_{AB}=\sum_j s_j A_j\otimes B_j
$$
in orthonormal local Hilbert-Schmidt operator families. Let $\mathcal B_{AB}:=(\{A_j\},\{B_j\},\{s_j\})$ denote a chosen such record and set $\theta_{AB}:=(\omega_{AB},\mathcal B_{AB})$. The entanglement causal information is
$$
\mathcal I_{\text{ent}}(S,\omega_{AB})
:=
I_{\mathcal P_{\text{causal}}}
(\text{context}_S;\theta_{AB}).
\tag{L.109}
$$
For a general AQFT state outside this branch, Equation (L.109) requires a separately specified finite measurement record in place of $\mathcal B_{AB}$.

<a id="proposition-l122-pairwise-entanglement-correlator-bound"></a>**Proposition L.12.2 (Pairwise Entanglement-Correlator Bound).** Let $\omega_0$ be a common baseline state and suppose two local-context outputs satisfy
$$
D(\omega_{C_{A,j}},\omega_0)\leq\mathrm{CC}(S_A),
\qquad j=1,2,
$$
where $D(\rho,\sigma):=\frac12\|\rho-\sigma\|_1$. For $\mathrm{CC}(S_A)>0$, define
$$
\eta_{\mathrm{ent}}^{pair}:=
\frac{D(\omega_{C_{A,1}},\omega_{C_{A,2}})}
{2\mathrm{CC}(S_A)}\in[0,1],
$$
and set $\eta_{\mathrm{ent}}^{pair}=0$ when $\mathrm{CC}(S_A)=0$. Then
$$
\left|\omega_{C_{A,1}}(A\otimes B)-
\omega_{C_{A,2}}(A\otimes B)\right|
\leq4\mathrm{CC}(S_A)\eta_{\mathrm{ent}}^{pair}
\|A\|_\infty\|B\|_\infty.
\tag{L.110}
$$
Zero entanglement causal information implies no target-conditioned advantage over the best information-free local policy; it implies $\eta_{\mathrm{ent}}^{pair}=0$ only under an additional zero-baseline hypothesis requiring all information-free context policies to induce the same joint state.

*Proof.* The triangle inequality gives
$$
D(\omega_{C_{A,1}},\omega_{C_{A,2}})
\leq D(\omega_{C_{A,1}},\omega_0)+D(\omega_0,\omega_{C_{A,2}})
\leq2\mathrm{CC}(S_A),
$$
so $\eta_{\mathrm{ent}}^{pair}\in[0,1]$. With $\Delta\omega=\omega_{C_{A,1}}-\omega_{C_{A,2}}$, trace-norm Hölder gives
$$
|\operatorname{tr}(\Delta\omega\,A\otimes B)|
\leq\|\Delta\omega\|_1\|A\otimes B\|_\infty
=2D(\omega_{C_{A,1}},\omega_{C_{A,2}})
\|A\|_\infty\|B\|_\infty,
$$
which is Equation (L.110). ∎

<a id="theorem-l128-target-conditioned-entanglement-advantage-requires-causal-information"></a>**Theorem L.12.8 (Target-Conditioned Entanglement Advantage Requires Causal Information).** Let the local-CPTP entanglement branch satisfy the causal-separation hypotheses of Lemma L.12.1 with target parameter $\theta_{AB}$. If a context policy achieves expected joint-correlation performance strictly above the supremum attainable by policies independent of $\theta_{AB}$, then
$$
\mathcal I_{\mathrm{ent}}(S,\omega_{AB})>0,
$$
and the aggregate's context shares a causal or common-cause history with the relevant entanglement record. The aggregate need not have participated in preparing $\omega_{AB}$ merely to apply a local channel that changes joint correlators. Every such local CPTP channel preserves Bob's marginal by Corollary L.12.8a.

*Proof.* If $\mathcal I_{\mathrm{ent}}=0$, then $\text{context}_S$ and $\theta_{AB}$ are independent. The convex-mixture argument of Corollary L.12.4, with $\theta_T$ replaced by $\theta_{AB}$, shows that a context-dependent policy cannot exceed the optimal information-free expected performance. The contrapositive proves the first implication. Lemma L.12.1's causal-separation hypotheses convert positive mutual information into the existence of a causal or common-cause history. Corollary L.12.8a independently proves marginal invariance for every Alice-side CPTP channel. ∎

**Corollary L.12.8a (Core CC No-Signaling Branch).** The core CC mechanism in this appendix is the local-CPTP branch. For every bipartite state $\omega_{AB}$ and every Alice-side local context channel $\Phi_A^C$,
$$
\omega_{AB}^C=(\Phi_A^C\otimes \mathrm{id}_B)(\omega_{AB})
$$
satisfies
$$
\operatorname{tr}_A(\omega_{AB}^C)
=
\operatorname{tr}_A(\omega_{AB})
\tag{L.111}
$$
whenever $\Phi_A^C$ is completely positive and trace-preserving. Therefore Bob-side marginal shifts under late-randomized Alice context choices are not a consequence of core CC. They belong only to the separated nonlocal/state-mediated marginal-anomaly branch of Postulate 3. By Corollary 39c.1 such a shift lies outside the exact pre-lightcone context-independence branch, and observing one would select branch (iii) over that branch; as an external regular finite-window model, it is subject to the zero-error, sample-complexity, information-rate, and validation gates of Section 10.

*Proof.* For any Bob-side observable $B$,
$$
\operatorname{tr}\!\left[(I_A\otimes B)(\Phi_A^C\otimes \mathrm{id}_B)(\omega_{AB})\right]
=
\operatorname{tr}\!\left[(\Phi_A^{C\,*}(I_A)\otimes B)\omega_{AB}\right].
$$
Because $\Phi_A^C$ is trace-preserving, its Heisenberg adjoint is unital:
$$
\Phi_A^{C\,*}(I_A)=I_A.
$$
Thus
$$
\operatorname{tr}\!\left[(I_A\otimes B)\omega_{AB}^C\right]
=
\operatorname{tr}\!\left[(I_A\otimes B)\omega_{AB}\right]
$$
for every $B$, which is exactly (L.111). Hence a Bob-side marginal anomaly cannot be produced by the local-CPTP core branch. ∎

<a id="theorem-l128b-finite-energy-conserving-context-to-carrier-to-instrument-witness"></a>**Theorem L.12.8b (Finite Energy-Conserving Context-to-Carrier-to-Instrument Witness).** Let the selected finite aggregate-context statistic of Definition L.1 have exactly two registered values represented by a typed source register
$$
\mathcal H_S=\operatorname{span}\{|s_0\rangle,|s_1\rangle\},
\qquad
\langle s_0|s_1\rangle=0,
\qquad
H_S=0.
$$
Its registered input ensemble is classical in this basis. Let $C$ be a degenerate binary control register, initially in $|0\rangle_C$, and define
$$
\begin{aligned}
c_*&:\mathcal C_{\mathrm{ctx}}\longrightarrow\{0,1\},
&c_*(s_j)&=j,\\
U_{\mathrm{ctx}}
&:=|s_0\rangle\!\langle s_0|\otimes I_C
+|s_1\rangle\!\langle s_1|\otimes X_C,
&\mathcal E_{\mathrm{ctx}}(X)&:=U_{\mathrm{ctx}}XU_{\mathrm{ctx}}^\dagger .
\end{aligned}
\tag{L.12.8b.1}
$$
Thus $U_{\mathrm{ctx}}|s_j,0\rangle=|s_j,j\rangle$, $\mathcal E_{\mathrm{ctx}}$ is CPTP, and $[U_{\mathrm{ctx}},H_S+H_C]=0$ for $H_C=0$. The source register is not consumed or reset: its orthogonal label is retained as the context input. During a registered duration $\tau_{\mathrm{ctx}}>0$, this encoder stores $c_*(S)$ in $C$; the finite map $\mathcal M(s)=c_*(s)$ is bounded and Lipschitz in the discrete context metric, with $\{0,1\}\subset\mathcal P_{\mathrm{control}}$.

Let a two-level carrier have basis $|0\rangle_a,|1\rangle_a$, lowering operator $a:=|0\rangle_a\!\langle1|$, and energy $H_a=\hbar\omega|1\rangle_a\!\langle1|$. Let a battery with $E\ge\hbar\omega$ obey $H_B|E\rangle_B=E|E\rangle_B$ and $H_B|E-\hbar\omega\rangle_B=(E-\hbar\omega)|E-\hbar\omega\rangle_B$. During a registered duration $\tau_{\mathrm{prep}}>0$, let $U_{\mathrm{prep}}$ be the identity on the $C=0$ sector, swap
$$
|1\rangle_C|0\rangle_a|E\rangle_B
\longleftrightarrow
|1\rangle_C|1\rangle_a|E-\hbar\omega\rangle_B,
\tag{L.12.8b.2}
$$
and act identically on the orthogonal complement. The swapped vectors have equal total energy, hence $[U_{\mathrm{prep}},H_C+H_a+H_B]=0$.

Let the carrier meet a resonant two-level target with $H_T=\hbar\omega|e\rangle_T\!\langle e|$, initially in $|g\rangle_T$, and write $\sigma_+=|e\rangle_T\!\langle g|$. For a registered duration $\tau_{\mathrm{int}}>0$, use
$$
H_{aT}=\hbar g(a\sigma_++a^\dagger\sigma_-),
\qquad
U_{\mathrm{int}}=e^{-i\tau_{\mathrm{int}}H_{aT}/\hbar}.
\tag{L.12.8b.3}
$$
During $\tau_{\mathrm{rd}}>0$, a degenerate readout memory $M$, initially $|0\rangle_M$, records the target by the controlled-NOT unitary $|g,0\rangle_{TM}\mapsto|g,0\rangle_{TM}$ and $|e,0\rangle_{TM}\mapsto|e,1\rangle_{TM}$. On the full post-readout register algebra put
$$
P_m:=I_{\mathrm{all}\setminus M}\otimes|m\rangle_M\!\langle m|,
\qquad
\mathcal I_m(X):=P_mXP_m,
\qquad m\in\{0,1\}.
\tag{L.12.8b.4}
$$
Each $\mathcal I_m$ is CP, and $\sum_m\mathcal I_m$ is trace preserving because $P_0+P_1=I$. Thus these are outcome maps of a normalized instrument, not merely its effects; $\Pr(M=m)=\operatorname{tr}\mathcal I_m(\rho)$.

Define target channels and their Definition-30 response map by
$$
\Phi_c(X)
=\operatorname{tr}_a\!\left[
U_{\mathrm{int}}(|c\rangle_a\!\langle c|\otimes X)U_{\mathrm{int}}^\dagger
\right],
\qquad
L_{\mathrm{G9CC}}:=\Phi_1-\Phi_0.
\tag{L.12.8b.5}
$$
Both $\Phi_c$ are CPTP, so $L_{\mathrm{G9CC}}$ is complex-linear, Hermitian-preserving and trace-annihilating. For $\rho_g=|g\rangle\langle g|$ and $E_e=|e\rangle\langle e|$,
$$
\begin{aligned}
p(M=1\mid C=c)&=c\sin^2(g\tau_{\mathrm{int}}),\\
\mathfrak A_{\mathrm{G9CC}}
&:=\operatorname{tr}\!\left[E_eL_{\mathrm{G9CC}}(\rho_g)\right]\\
&=p(M=1\mid\operatorname{do}(C=1))-p(M=1\mid\operatorname{do}(C=0))
=\sin^2(g\tau_{\mathrm{int}}).
\end{aligned}
\tag{L.12.8b.6}
$$
Fixing $0<g\tau_{\mathrm{int}}<\pi$ gives a normalized strictly positive response with locked positive sign.

The battery is the unique actuation-energy owner. Conditional on $C=1$, its borrowed energy is recomposed after the interaction as
$$
\hbar\omega
=\hbar\omega\cos^2(g\tau_{\mathrm{int}})
+\hbar\omega\sin^2(g\tau_{\mathrm{int}}),
\tag{L.12.8b.7}
$$
the carrier and target mean energies. Let degenerate side registers $R_C,R_M$, initially $|0,0\rangle$, copy $(C,M)$ during $\tau_{\mathrm{log}}>0$. During $\tau_{\mathrm{ret}}>0$, let the energy-conserving return unitary swap
$$
\begin{aligned}
|1,0,1,g,E-\hbar\omega\rangle_{\mathrm{CMaTB}}
&\longleftrightarrow|1,0,0,g,E\rangle_{\mathrm{CMaTB}},\\
|1,1,0,e,E-\hbar\omega\rangle_{\mathrm{CMaTB}}
&\longleftrightarrow|1,1,0,g,E\rangle_{\mathrm{CMaTB}},
\end{aligned}
\tag{L.12.8b.8}
$$
and be the identity on the $C=0$ reachable state and the orthogonal complement. Every outcome branch thereby returns the carrier, target and actuation battery to $|0,g,E\rangle_{\mathrm{aTB}}$ while $S$ remains the retained context input and the four degenerate registers hold their classical labels.

Let $R_{\mathrm{ext}}$ contain every other finite classical record retained and unchanged through reset, and register the actual source law $q_{jr}:=\Pr(S=s_j,R_{\mathrm{ext}}=r)$. Put
$$
p_{1|j}:=j\sin^2(g\tau_{\mathrm{int}}),
\qquad p_{0|j}:=1-p_{1|j}.
$$
Immediately after logging, the actual joint law is
$$
q(s_j,c,m,r_C,r_M,r)
=q_{jr}\,p_{m|j}\,
\delta_{c,j}\delta_{r_C,j}\delta_{r_M,m},
\qquad
\sum_{j,r}q_{jr}=1.
\tag{L.12.8b.9}
$$
In particular, this specifies the ensemble to which the reset entropy refers; $S$ and $R_{\mathrm{ext}}$ are retained side information rather than erased registers.

All of $C,M,R_C,R_M$ have zero Hamiltonian. Register four serial isothermal bit resets at temperature $T$, each satisfying every thermodynamic hypothesis of Definition 28, with controller $K_{\mathrm{reset}}$, reset-work store $\mathsf W_{\mathrm{reset}}$, and bath $\Theta_T$. This includes the complete auxiliary-resource return and any required entropy and mean-heat limits. For a bit $X\in\{C,M,R_C,R_M\}$ define the logical CPTP ready-state map, canonically inserted in the $X$ tensor position, by
$$
\mathscr R_X(Y):=|0\rangle_X\!\langle0|\otimes\operatorname{tr}_X Y.
$$
The serial order $C,M,R_C,R_M$ realizes
$$
\mathscr R_{CMR_C R_M}
:=\mathscr R_{R_M}\circ\mathscr R_{R_C}\circ\mathscr R_M\circ\mathscr R_C,
\qquad
\mathscr R_{CMR_C R_M}(Y)
=|0,0,0,0\rangle\!\langle0,0,0,0|\otimes\operatorname{tr}_{CMR_C R_M}Y.
\tag{L.12.8b.10}
$$
For the $i$th bit $X_i$ in this order, the not-yet-reset bits $X_{>i}$ together with $(S,R_{\mathrm{ext}})$ are retained and unchanged during that bit reset. Definition 28 and Theorem 31 therefore apply four times, and the Shannon chain rule gives
$$
\begin{aligned}
Q_{\mathrm{reset}}
&:=\sum_{i=1}^4Q_{X_i}\\
&\ge k_BT\sum_{i=1}^4
H_q(X_i\mid X_{>i},S,R_{\mathrm{ext}})\\
&=k_BT\,H_q(C,M,R_C,R_M\mid S,R_{\mathrm{ext}}).
\end{aligned}
\tag{L.12.8b.11}
$$
Each serial reset carries the complete Definition 28 implementation contract, including an initially independent Gibbs bath, full auxiliary-resource closure, and finite entropy accounting or justified entropy and mean-heat limits. The CPTP maps in (L.12.8b.10) specify the logical resets; a thermodynamic realization requires that separate contract. The store $\mathsf W_{\mathrm{reset}}$ is the sole reset-work owner and $\Theta_T$ the sole reset-heat owner, receiving $Q_{\mathrm{reset}}$; neither is the actuation battery $B$.

Choose bounded world tubes in the strict causal order
$$
W_{\mathrm{ctx}}\prec W_{\mathrm{prep}}\prec W_{\mathrm{int}}
\prec W_{\mathrm{rd}}\prec W_{\mathrm{log}}
\prec W_{\mathrm{ret}}\prec W_{\mathrm{reset}},
\tag{L.12.8b.12}
$$
with four ordered sub-tubes inside $W_{\mathrm{reset}}$. Support the corresponding finite operation in its stated tube, and extend every local operation by the identity on every tensor factor spacelike separated from that support. The total registered cycle time is
$$
\tau_{\mathrm{cyc}}
=\tau_{\mathrm{ctx}}+\tau_{\mathrm{prep}}+\tau_{\mathrm{int}}
+\tau_{\mathrm{rd}}+\tau_{\mathrm{log}}+\tau_{\mathrm{ret}}+\tau_{\mathrm{reset}}>0.
$$
For any stage's nonselective local CPTP map $\Lambda_A$, any spacelike factor $R$, any joint state $\rho_{AR}$ and any observable $Z_R$,
$$
\operatorname{tr}\!\left[(I_A\otimes Z_R)(\Lambda_A\otimes\operatorname{id}_R)(\rho_{AR})\right]
=\operatorname{tr}\!\left[(\Lambda_A^*(I_A)\otimes Z_R)\rho_{AR}\right]
=\operatorname{tr}\!\left[(I_A\otimes Z_R)\rho_{AR}\right].
\tag{L.12.8b.13}
$$
Hence the nonselective remote marginal is invariant at every stage; in particular, the readout uses $\sum_m\mathcal I_m$ until an outcome record is causally transmitted. Joint phase rephasing $a\mapsto e^{i\varphi}a$, $\sigma_+\mapsto e^{-i\varphi}\sigma_+$ leaves the Hamiltonian, energy ledger and instrument probabilities invariant.

*Proof.* Orthogonality of $|s_0\rangle,|s_1\rangle$ makes $U_{\mathrm{ctx}}$ a controlled-$X$ unitary. It fixes each source basis label, maps $|s_j,0\rangle$ to $|s_j,j\rangle$, and commutes with the degenerate source-control Hamiltonian; conjugation is therefore an energy-conserving CPTP encoder that retains $S$. The preparation and return swaps exchange orthogonal equal-energy vectors and extend by the identity, so they too are unitary and energy conserving. On the carrier-target one-excitation sector,
$$
|1,g\rangle
\longmapsto
\cos(g\tau_{\mathrm{int}})|1,g\rangle
-i\sin(g\tau_{\mathrm{int}})|0,e\rangle,
$$
whereas $|0,g\rangle$ is fixed. The memory unitary copies the orthogonal target energy label. Each outcome map has the single Kraus operator $P_m$ and is CP, while
$\operatorname{tr}\sum_mP_mXP_m=\operatorname{tr}X$; this proves instrument normalization and Equation (L.12.8b.6). Differences of trace-preserving Hermiticity-preserving maps are trace-annihilating and Hermiticity preserving, proving the Definition 30 binding, and excitation conservation proves (L.12.8b.7). The swaps in (L.12.8b.8) restore the only two reachable $C=1$ outcome branches; the $C=0$ branch is already ready. Summing (L.12.8b.9) over $c,m,r_C,r_M,j,r$ gives one. Each map in (L.12.8b.10) is CPTP, their composition resets exactly the four declared bits, and applying the binary Definition-28 bound in the displayed serial order gives the four conditional entropies in (L.12.8b.11); their sum is the joint conditional entropy by the chain rule. Finally, trace preservation gives $\Lambda_A^*(I_A)=I_A$, proving (L.12.8b.13) for every remote observable and hence equality of remote marginals. Direct substitution proves phase invariance. ∎

<a id="remark-l125-entanglement-channel-temporal-engineering"></a>**Remark L.12.5 (Entanglement Channel Temporal Engineering).** In the temporal-ontological description (Section L.12.3), the entanglement channel corresponds to modulating the perspective transition kernel $G_{\text{persp}}$ in region $\mathcal{O}_A$ in a way correlated with the operator-basis record $\mathcal{B}_{AB}$ for the joint state on $\mathcal{O}_A\cup\mathcal{O}_B$. On the local-CPTP branch, this modulation may alter joint correlators while Equation (L.111) preserves the $\mathcal O_B$ marginal.

-----

### **L.12.10 Summary**

Target-specific performance requires usable information from a shared causal history. Turning that information into a measurable effect requires separate physical, thermodynamic, and causal records.

**Technical ledger.**

The AC-Stark construction is a conditional implementation class. Under the causal-separation hypotheses, performance strictly above the optimal information-free baseline requires a causal or common-cause record carrying information about the target. This statement does not require direct participation in target preparation and does not turn an abstract model record into a physical carrier. The key results are:

- **Summary of Definition L.12.1 and Equations L.92–L.93:** Causal information $\mathcal{I}(S \to T,t)$ is defined as mutual information under $\mathcal{P}_{\text{causal}}$, satisfying the inequality chain $\mathcal{I}(S \to T) \leq I(S:T) \leq \mathcal{I}_{\text{rel}}(S)$ by data processing under the local-channel and subsystem hypotheses of Definition L.12.1. On a common $\mathfrak B_{mass}$ branch only, Theorem N.5 converts the relational-information upper scale into a target-mass upper scale; the information inequality is independent of that mass-calibration branch.

- **Summary of Corollary L.12.2:** Under the declared adaptedness hypothesis, only records available by the registered time can contribute. The accessible interaction history is cumulative. The retained quantity $\mathcal I(S\to T,t)=I(\text{context}_S(t);\theta_T)$ is monotonically non-decreasing only on the lossless-refinement branch for the same target random variable and one common joint law; it may decrease under compression, forgetting, or finite-memory overwrite.
- **Section L.12.3 (Temporal Engineering):** CC influence is modeled as modulation of $\tau(x_T,t)$ via the declared temporal-wave channels. Causal information governs modulation precision (Equation L.95) and perspective drift strength (Corollary L.12.3). On the Appendix N response/refresh branch plus the explicit $\mathfrak B_{\mathrm{CC-UCT}}$ allocation bridge, Equation (L.99) transfers the conditional reduction $C_a\le C_0$ to a non-increasing causal-information acquisition rate; acceleration alone does not imply that transfer.
- **Summary of Proposition L.12.1 and Equations L.101–L.102:** Resonance factor $\eta_{\text{res}}$ improves under refinement of causal information, proved via the coarse-graining/policy-set inclusion argument. Corollary L.12.4 establishes that any target-conditioned advantage beyond an information-free baseline requires $\mathcal{I}(S \to T) > 0$.
- **Summary of Theorem L.12.2 and Equations L.103–L.105:** A certificate bounding the actual protocol's conditional information increments, with all decoder resources accounted for, bounds the number of interactions needed to acquire $I_0$. Every counted interaction must supply a distinct complete registered reset at the common positive temperature for the additive bath-heat bound; a positive linear floor further requires $H_{q_k}(P_k\mid R_k)\ge h_{\min}>0$ for every reset. Equation (L.105) requires a positive duration, a nonnegative control coefficient and an acquisition-window resource-cost ledger that bounds this bath-heat rate. The information–reset-cost product of Theorem 33 enters only on its separately registered branch. These conditional bounds constrain a specified PCE objective.
- **Summary of Corollary L.12.7 and Equation L.107:** Under its posterior and measurable-policy certificate, the EM resonance reward is the posterior Bayes optimum jointly over polarization and frequency. The principal-eigenvector rule is exact for the polarization-only factor, and the conditional mean is exact for squared frequency loss rather than the Lorentzian reward. Zero mutual information gives the optimal prior-only reward. An attained reward of one identifies the dipole axis up to sign and the transition frequency almost surely, with an admissible matching action; it need not identify other components of the target parameter.
- **Summary of Theorem L.12 (Conditional Locality):** Target-conditioned advantage is confined to a shared causal history when the causal-Markov, adaptedness, and exact-cone hypotheses hold. In the Appendix F continuum branch, the cone is identified with the geometric lightcone only under its bridge assumptions. Thermodynamic range cost supplies an optimization penalty and the arrow-of-time branch supplies directionality; neither alone proves exact locality.
- **Summary of Proposition L.12.2, Theorem L.12.8, and Corollary L.12.8a:** A strict target-conditioned joint-correlation advantage requires positive entanglement causal information under the causal-separation hypotheses; a generic local channel can change joint correlators without such information. Equation (L.110) is the trace-distance pairwise correlator bound with its stated factor, and Equation (L.111) preserves the remote marginal exactly on the local-CPTP branch. No Section 10 capacity bound follows without an additional channel model.

<a id="remark-l126-global-entangled-accounting"></a>**Remark L.12.6 (Global Entangled Accounting).** The aggregate-centered account describes one subsystem acting within the common global state.

The aggregate $S$ and target $T$ are subsystems of a common global state $\omega$, but entanglement alone is not a dynamical channel. On the core local-CPTP branch, a context-dependent operation on $S$ can change joint observables and conditional statistics revealed after comparison, while Corollary L.12.8a gives exact invariance of every spacelike target marginal. A target-local probability shift requires either a causal interaction reaching $T$ or the separately declared marginal-anomaly branch with the validation and causality gates of Section 10.

Every acquisition or control operation that includes a registered reset must appear in the conditional reset ledger of Theorem L.12.2. That accounting is necessary for the registered reset but does not itself derive a target response. Equation (L.106) applies only after a carrier-response map and resonance certificate connect the aggregate's context to the target dynamics. Thus the framework distinguishes three statements: local physical reconfiguration of $S$, changes in joint correlations of $\omega$, and changes in the local outcome law at $T$; none is identified with another solely from global entanglement.

Exact target-local causality follows on the branch with an exact propagation cone and an adapted causal model. Under the causal-separation hypotheses, a strict target-conditioned advantage additionally requires a causal or common-cause record. Thermodynamic range cost can make remote control PCE-disfavored, and the arrow-of-time branch supplies directionality, but neither is an independent proof of exact spatial locality.

## **L.13 Summary**

The appendix supplies conditional carrier models, accounting rules, and empirical tests for proposed complexity-related effects.

**Technical ledger.**

This appendix supplies conditional implementation theorems and accounting guardrails for the CC program; it does not derive a realized CC carrier or a nonzero outcome shift from complexity alone.

## **L.13.1 Foundational Results**

(1) **Consciousness-first ontology.** Awareness is fundamental (Section L.0), and the temporal-wave vocabulary organizes the CC program; a physical carrier and response map enter through the explicit premises of the theorems summarized below.

(2) **Conditional electromagnetic branch (Theorem L.2).** A conserved radiating current, coherent source geometry, phase relation, Maxwell carrier, and context map yield the displayed electromagnetic field and stress tensor. These premises are implementation data.

(3) **Conditional gravitational branch (Theorem L.3).** Registered aggregate energy enters the complete stress tensor; a gravitational response follows only on the accepted metric-continuum and Einstein branches.

(4) **Undetermined channel ratio (Proposition L.5).** The scaling relations do not determine $\mathcal R=\delta_{\mathrm{EM}}/\delta_{\mathrm{grav}}$. A numerical comparison requires a common source model, target-response map, geometry, retention fraction, units, and uncertainty ledger.

(5) **Energy accounting (Theorem L.6).** Mutually exclusive power entries, boundary fluxes, and stored-energy changes are necessary for a non-double-counted ledger. Covariant conservation is a consistency condition on the complete tensor, not proof that the entries were exhaustively or uniquely assigned.

(6) **Conditional horizon thermodynamics (Theorem L.7).** Clausius, area, and Einstein conclusions retain the KMS, horizon, entropy-saturation, normalization, and metric-response premises cited by the theorem.

(7) **Temporal-modulation decomposition (Theorem L.8).** A registered temporal modulation decomposes into frequency sectors: on the conserved-current branch a high-frequency sector radiates through a calibrated dipole, and on the retained-energy branch a low-frequency sector sources a weak gravitational response, each through its own carrier.

(8) **Conditional coupling-scale comparison (Theorem L.11).** The electron-scale ratio near $4.1\times10^{42}$ follows from the displayed branch inputs. No aggregate response ratio follows without an implementation efficiency and common target likelihood.

(9) **Implementation guardrails (Theorem L.9).** Every implementation on the emergent metric branch must satisfy energy conservation, a complete conserved stress-energy ledger, and the endpoint, zero-error, and causality constraints of clause (iii). Above threshold, strict class-level improvement $F_+^*>F_0^*$ makes every PCE maximizer non-null, and on the threshold-scaling branch of Definition 31, $C_{\mathrm{agg}}\le C_{op}$ gives $\mathrm{CC}(S)=0$.

(10) **Conditional spatiotemporal estimates (Propositions L.9.3–L.9.5).** For a registered radial endpoint with $|\Delta P(r)|=K_{\mathrm{impl}}P_{\mathrm{agg}}/r^2$ and positive $K_{\mathrm{impl}},P_{\mathrm{agg}},\epsilon_{\mathrm{detect}}$, the branch threshold is $R_*=\sqrt{K_{\mathrm{impl}}P_{\mathrm{agg}}/\epsilon_{\mathrm{detect}}}$ when realized inside its validity interval and causal domain. Identifying it with the global $R_{\mathrm{eff}}$ additionally requires exclusion of all threshold crossings at larger radii for every admitted endpoint and direction, including regions outside that interval. A correlation law with nonzero initial amplitude and positive exponential decay rate gives $\tau_c=1/\Gamma_{\mathrm{context}}$. At a registered test radius $R$ where the stationary endpoint law holds throughout an interval of duration $\tau_c$, maintaining threshold response requires $E_{\mathrm{agg}}\ge(\epsilon_{\mathrm{detect}}/K_{\mathrm{impl}})R^2\tau_c$. Using a global radius in this last inequality requires the same exhaustion and threshold-realization certificate.

## **Biological Connections:**

Multi-scale hypothesis (L.4.1.4.) connecting to Levin's observations of coordinated bioelectric patterns

Differential observables (L.8.4) enabling experimental discrimination between interpretations

Testable predictions for morphogenesis, gap junction optimization, and calorimetry

## **L.13.2 Experimental Program**

### **Near-term (engineered systems):**

Coherent-charge carrier (Protocol L.1)

Energy accounting (Protocol L.2)

Gravitational-channel sensitivity audit (Protocol L.3)

Evidence adjudication for Protocols L.1-L.3 uses the preregistered Section 13.0a triage: support, null, and failure are assigned only by the fixed endpoint, artifact, sign, stopping-rule, and replication criteria stated there.

### **Medium-term (biological systems, if applicable):**

Operational $C_{\text{agg}}$ proxy development

Bioelectric coherence time measurements

Calorimetry during morphogenesis (planarian test case)

Multi-scale correlation studies

### **Long-term (quantum interface):**

Direct quantum measurement during biological processes

Validation or falsification of biological CC hypotheses

No integration-time forecast follows until a signal amplitude, noise model, endpoint likelihood, and sampling design are registered. Energy accounting tests closure of the physical ledger but does not validate a CC attribution by itself. At the stated sensitivity, the gravitational protocol predicts an unresolved result and cannot determine the electromagnetic-to-gravitational response ratio.

## **L.13.3 Theoretical Significance**

The dual-channel analysis gives a common accounting framework for separately certified electromagnetic and gravitational responses of an MPU aggregate. It establishes compatibility and no-double-counting conditions, with each carrier entering through its own certificate.

Propositions L.9.3–L.9.5 give branch threshold and duration estimates under their calibrated carrier and correlation laws. A finite global spatial extent additionally requires their exhaustion certificate over all admitted endpoints, directions and exterior regions; the inverse-rate duration requires nonzero initial correlation and positive decay rate. The sustaining-energy bound applies to a test radius throughout its certified response interval. Theorem L.11 gives the electron-scale dimensionless ratio near $4.1\times10^{42}$ on its displayed branch.

The biological proposals of Section L.4.1 are empirical hypotheses. A result bears on a CC carrier only through the preregistered source, target, artifact, energy, sign, interval, and replication criteria; bioelectric organization or calorimetric closure alone does not identify CC influence.

Section L.11 defines a candidate coherent-charge AC-Stark implementation class for engineered systems. It yields a quantitative prediction only after a conserved source current, field geometry, valid differential polarizability, detuning regime, rate susceptibility, endpoint likelihood, and complete energy ledger are supplied.

**Causality terminology rule.** Every endpoint, bias-strength, gravity-backreaction, or zero-error bound in this appendix is weaker than operational causality. Postulate 2 means exact pre-lightcone context independence by Theorem 39c; a late-randomized Bob-marginal shift lies outside that branch.
