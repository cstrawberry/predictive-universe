# Appendix E: Thermodynamic Limits and Horizon Entropy Area Law

**E.1 Introduction**

This appendix develops branch-qualified information-theoretic and thermodynamic bounds for Non-Deterministic Reflexive Interaction Dynamics (ND–RID, Definition 6, Definition A.2.2) governing the MPU 'Evolve' process (Definition 27). Registered reset ledgers and refresh/minorization channels give distinct capacity statements. Geometric link counting gives an area-scaling upper bound, while the saturated Horizon Entropy Area Law of Theorem 49 additionally requires the density certificate, capacity-achieving code, entropy-saturating response distribution, additive channel ledger, and operational calibration stated in Theorem E.6. The gravity derivation in Section 12 consumes that complete horizon branch together with its own local-equilibrium hypotheses.

The derivation proceeds logically:
1.  Separate the structural reset-support value $\varepsilon_0=\ln2$ (Proposition 5; Appendix J, Theorem J.1) from the physical implementation bound $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)$ on the registered reset branch of Definition 28 and Theorem 31; a positive physical floor additionally requires $H_q(P\mid R)\ge h_{\min}>0$. (Section E.2: Theorem E.1, Corollary E.1)
2.  Establish the reset-support capacity deficit caused by a registered completed reset: resetting an $r$-dimensional factor inside the $d_0$-dimensional MPU Hilbert space bounds the completed-cycle capacity by $C(\mathcal E_N)\le\ln d_0-\ln r$, hence by $\ln d_0-\ln2$ for a binary reset. SPAP alone does not register this architecture. (Section E.4: Proposition E.2a)
3.  Establish strict trace-distance contractivity ($f_{\mathrm{RID}} < 1$) and the corresponding strict capacity bound ($C(\mathcal{E}_N)<\ln d_0$) on the separate refresh/minorization branch where the averaged channel contains a nonzero input-independent full-state refresh component. (Section E.3: Lemma E.1; Section E.4: Theorem E.2)
4.  Establish the geometric scaling of effective independent boundary information channels, conditional on emergent geometric regularity (Theorem 43), incorporating correlation effects. (Section E.5: Theorem E.3)
5.  Synthesize the per-channel and boundary-count bounds into the conditional area bound of Theorem E.6; obtain equality on its capacity-achieving, entropy-saturating, additive-ledger branch; and define the operational coupling through the Bekenstein–Hawking normalization. (Section E.6)
6.  Perform a structural consistency check linking the emergent Planck scale to microscopic MPU parameters. (Section E.7)

Natural units where $\hbar=c=k_B=1$ are used for core derivations, restored where appropriate. Dimensionless quantities like entropy, capacity, $\varepsilon_0$, and $\varepsilon_{\mathrm{phys}}$ are in nats.

**Convention E.0 (Structural and Registered Reset Ledgers).** The value $\varepsilon_0=\ln2$ is the log-cardinality of a binary reset-support alphabet. Physical reset heat is distribution-sensitive and is recorded separately through $q(P,R)$. Neither ledger implies the refresh-mixture hypothesis of Lemma E.1.

**E.2 Irreversibility and Thermodynamic Costs of Reflexive MPU Interactions**

Let $\mathcal I_N=\{\mathcal E_{N,o}\}_{o\in O}$ be a normalized quantum instrument and let $\mathcal E_N=\sum_o\mathcal E_{N,o}$ be its average CPTP channel. Instrument normalization fixes probabilities and poststates; it does not determine a thermodynamic implementation.

**Theorem E.1 (Conditional Physical Reset Ledger).** Let $P$ be a classical pre-reset record, let $R$ contain every classical record retained and unchanged through the reset, and let $q(P,R)$ be their actual joint law. Assume a degenerate register Hamiltonian, an isothermal bath at temperature $T$, cyclic control, and return of the register and controller to their initial Hamiltonians. Then
$$
\varepsilon_{\mathrm{reset}}
:=
\frac{\langle Q_{\mathrm{bath}}\rangle}{k_BT}
=
H_q(P\mid R)+\varepsilon_{\mathrm{diss}},
\qquad
\varepsilon_{\mathrm{diss}}\ge0.
\tag{E.1}
$$
The memory entropy change is $-k_BH_q(P\mid R)$, the bath entropy export is $k_B\varepsilon_{\mathrm{reset}}$, and the total entropy production is $k_B\varepsilon_{\mathrm{diss}}$. An additive measurement or feedback term requires a separate theorem and a no-double-counting ledger.

*Proof.* Before reset, the joint classical memory entropy is
$$
S_{PR}^{\mathrm{in}}
=
k_BH_q(P,R).
$$
After $P$ is reset to one ready value while the law of $R$ is unchanged, the joint memory entropy is
$$
S_{PR}^{\mathrm{out}}
=
k_BH_q(R).
$$
Therefore
$$
\Delta S_{PR}
=
k_B\bigl(H_q(R)-H_q(P,R)\bigr)
=
-k_BH_q(P\mid R).
$$
The bath receives heat $\langle Q_{\mathrm{bath}}\rangle$, so its entropy change is $\Delta S_{\mathrm{bath}}=\langle Q_{\mathrm{bath}}\rangle/T$. Cyclic return of the controller and Hamiltonians leaves no additional endpoint entropy term in this ledger. The second law gives
$$
\Delta S_{\mathrm{tot}}
=
\Delta S_{PR}+\Delta S_{\mathrm{bath}}
=
k_B\left(
\varepsilon_{\mathrm{reset}}-H_q(P\mid R)
\right)
\ge0.
$$
Define $\varepsilon_{\mathrm{diss}}:=\Delta S_{\mathrm{tot}}/k_B$. Rearrangement gives (E.1) and $\varepsilon_{\mathrm{diss}}\ge0$. ∎

**Corollary E.1 (Conditional Thermodynamic Irreversibility).** Under Theorem E.1, the reset is thermodynamically irreversible exactly when $\varepsilon_{\mathrm{diss}}>0$. Positive bath heat may occur at reversible Landauer saturation because the memory entropy decreases. Information gain or nonunitarity of $\mathcal E_N$ alone supplies no positive entropy-production bound without a registered implementation ledger.

*Proof.* Theorem E.1 identifies total entropy production with $k_B\varepsilon_{\mathrm{diss}}$, so it is positive exactly when $\varepsilon_{\mathrm{diss}}>0$. At saturation $\varepsilon_{\mathrm{diss}}=0$ and $\varepsilon_{\mathrm{reset}}=H_q(P\mid R)$, which can be positive. The derivation uses the registered reset and does not use information gain or channel nonunitarity. ∎

**E.3 Strict Contractivity of the Average 'Evolve' Channel**

On the refresh/minorization branch, the averaged `Evolve` channel contains a nonzero input-independent full-state refresh component and is strictly trace-distance contractive. A registered completed reset by itself yields only Proposition E.2a's support-capacity deficit; it does not require full-state contraction.


**Lemma E.1 (Strict Contractivity of the Average "Evolve" Channel).**
Let the average ND–RID "Evolve" channel be the CPTP map:
$$
\mathcal{E}_N(\rho)=\sum_o \mathcal{E}_{N,o}(\rho)
$$
where each outcome map $\mathcal{E}_{N,o}:\mathcal{S}(\mathcal{H}_{d_0})\to \mathcal{S}(\mathcal{H}_{d_0})$. Assume the averaged dynamics contains a nonzero input-independent refresh component: there exist a CPTP map $\Psi$, a fixed state $\sigma\in\mathcal{S}(\mathcal{H}_{d_0})$, and a weight $p\in(0,1]$ such that
$$
\mathcal{E}_N=(1-p)\Psi + p\,T_\sigma,
\qquad
T_\sigma(\rho):=\mathrm{Tr}(\rho)\,\sigma.
\tag{E.2a}
$$
(Within PU, $T_\sigma$ is the full-state refresh/minorization branch of the SPAP cycle-closure reset. Theorem 31 supplies the conditional registered-reset ledger $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)$; the full-state decomposition (E.2a) is the additional branch hypothesis used for strict trace-distance contraction.)

Then:

1. (**Strict trace-distance contractivity**) For all density operators $\rho_1,\rho_2$:
$$
D_{\mathrm{tr}}(\mathcal{E}_N(\rho_1),\mathcal{E}_N(\rho_2))
\le f_{\text{RID}}\,D_{\mathrm{tr}}(\rho_1,\rho_2),
\qquad
f_{\text{RID}}:=1-p\in[0,1).
\tag{E.2}
$$
Moreover, for every traceless operator $X$,
$$
\mathcal{E}_N(X)=(1-p)\Psi(X).
\tag{E.2b}
$$

2. (**Primitivity under full-rank refresh**) If additionally $\sigma\succ0$ (full rank), then $\mathcal{E}_N$ is strictly positive and hence primitive, with a unique full-rank fixed point $\rho_{\text{fix}}$ (Sanz et al. 2010).

*Proof.*
Let $\rho_1,\rho_2$ be states and set $\Delta:=\rho_1-\rho_2$ (Hermitian with $\mathrm{Tr}(\Delta)=0$). Since $T_\sigma(\Delta)=\mathrm{Tr}(\Delta)\sigma=0$, the decomposition (E.2a) gives (E.2b) and
$$
\mathcal{E}_N(\Delta)=(1-p)\Psi(\Delta).
$$
Because $\Psi$ is CPTP, it contracts trace distance between states, hence contracts the trace norm of traceless Hermitian operators. Concretely, write $\Delta=\Delta_+-\Delta_-$ with $\Delta_\pm\succeq0$ and $\mathrm{Tr}(\Delta_+)=\mathrm{Tr}(\Delta_-)=t$. Then $\Delta=t(\rho_+-\rho_-)$ with $\rho_\pm:=\Delta_\pm/t$ states, so
$$
\|\Psi(\Delta)\|_1
=t\,\|\Psi(\rho_+)-\Psi(\rho_-)\|_1
\le t\,\|\rho_+-\rho_-\|_1
=2t
=\|\Delta\|_1.
$$
Therefore,
$$
D_{\mathrm{tr}}(\mathcal{E}_N(\rho_1),\mathcal{E}_N(\rho_2))
=\tfrac12\|\mathcal{E}_N(\Delta)\|_1
=(1-p)\tfrac12\|\Psi(\Delta)\|_1
\le (1-p)\tfrac12\|\Delta\|_1
=(1-p)\,D_{\mathrm{tr}}(\rho_1,\rho_2),
$$
which is (E.2) with $f_{\text{RID}}=1-p<1$.

If $\sigma\succ0$ and $p>0$, then for every state $\rho$,
$$
\mathcal{E}_N(\rho)=(1-p)\Psi(\rho)+p\sigma\succ0,
$$
so $\mathcal{E}_N$ is strictly positive. Strict positivity implies primitivity and uniqueness of the full-rank fixed point (Sanz et al. 2010). QED

**Theorem E.1a (No-Free-Perfect-Transfer Family and Scope of Contractivity).** The standard no-cloning obstruction, no-deleting obstruction, and pure-branch monogamy obstruction are members of a single PU no-free-perfect-transfer family, but they are not all consequences of Lemma E.1 alone. More precisely:

1. universal deterministic cloning is excluded by trace-distance monotonicity of CPTP maps;
2. universal deterministic deletion on a closed reversible branch either violates inner-product preservation or transfers the deleted information to an environment;
3. pure-branch monogamy follows from the structure of extensions of pure bipartite states, while quantitative monogamy inequalities are supplied by the entropy-cone/min-cut and Hilbert-space branches;
4. Lemma E.1 supplies the strict refresh-channel mechanism for thermodynamic and regular statistical ND-RID branches containing the component $pT_\sigma$.

*Proof.*

**No-cloning.** Suppose a CPTP map $\mathcal C$ universally cloned pure states:
$$
\mathcal C(|\psi\rangle\langle\psi|)
=
|\psi\rangle\langle\psi|\otimes|\psi\rangle\langle\psi|
$$
for all unit vectors $|\psi\rangle$. Choose two nonorthogonal, nonidentical pure states with
$$
r:=|\langle\psi|\phi\rangle|\in(0,1).
$$
For pure states,
$$
D_{\mathrm{tr}}(\psi,\phi)=\sqrt{1-r^2},
$$
where $\psi=|\psi\rangle\langle\psi|$ and $\phi=|\phi\rangle\langle\phi|$. The cloned outputs have overlap $r^2$, hence trace distance
$$
D_{\mathrm{tr}}(\psi\otimes\psi,\phi\otimes\phi)
=
\sqrt{1-r^4}.
$$
Since $0<r<1$,
$$
\sqrt{1-r^4}>\sqrt{1-r^2}.
$$
This strictly increases trace distance, contradicting CPTP contractivity. Therefore universal deterministic cloning is impossible.

**No-deleting.** A closed reversible deletion operation must be represented by an isometry on system plus environment. Suppose
$$
V\bigl(|\psi\rangle|\psi\rangle|A\rangle\bigr)
=
|\psi\rangle|0\rangle|B_\psi\rangle
$$
for all $|\psi\rangle$. For two nonorthogonal states $|\psi\rangle,|\phi\rangle$ with $r=\langle\psi|\phi\rangle\in(0,1)$ after phase choice, preservation of inner products gives
$$
r^2
=
r\,\langle B_\psi|B_\phi\rangle.
$$
Hence
$$
\langle B_\psi|B_\phi\rangle=r.
$$
If $|B_\psi\rangle$ is independent of $\psi$, then $\langle B_\psi|B_\phi\rangle=1$, contradicting $r\in(0,1)$. If $|B_\psi\rangle$ depends on $\psi$, the environment retains exactly the missing state-dependence. The second copy has not been physically deleted; its information has been transferred to the environment. Therefore universal deletion is excluded as no-free-erasure of quantum information.

**Pure-branch monogamy.** Let $\rho_{AB}=|\Psi\rangle\langle\Psi|_{AB}$ be pure, and let $\rho_{ABC}$ be any extension with $\mathrm{Tr}_C\rho_{ABC}=\rho_{AB}$. Since $\rho_{AB}$ has one-dimensional support, positivity of $\rho_{ABC}$ implies its support lies in
$$
\operatorname{span}\{|\Psi\rangle_{AB}\}\otimes\mathcal H_C.
$$
Therefore
$$
\rho_{ABC}=|\Psi\rangle\langle\Psi|_{AB}\otimes\rho_C
$$
for some state $\rho_C$. Hence a subsystem already in a pure entangled state with its partner cannot share nontrivial additional correlations with a third subsystem. Quantitative monogamy inequalities used elsewhere in PU are supplied by the entropy-cone/min-cut branch and the standard Hilbert-space inequalities, not by Lemma E.1 alone.

Combining the three cases, each obstruction forbids a perfect free transfer, duplication, deletion, or unrestricted sharing of finite quantum predictive content. Lemma E.1 strengthens this family on ND-RID branches with a nonzero refresh component by giving strict contraction $f_{\text{RID}}<1$, but the entire family should not be collapsed into Lemma E.1 alone. ∎

**E.4 Limited Information Capacity Across Boundaries due to ND–RID**

There are two independent capacity statements. First, a registered completed reset of an $r$-dimensional factor confines completed outputs to support dimension at most $d_0/r$, hence $C(\mathcal E_N)\le\ln d_0-\ln r$; for a binary factor, $r=2$ (Proposition E.2a).

Second, on the refresh/minorization branch, strict contractivity is ensured by the presence of a nonzero input-independent full-state refresh component in the averaged ND-RID "Evolve" channel (Lemma E.1). Physical overhead only adds nonnegative dissipation; non-unitarity alone is not sufficient to guarantee strict trace-distance contraction. On this branch the average Evolve channel $\mathcal{E}_N$ satisfies
$$
f_{\mathrm{RID}}\bigl(\mathcal{E}_N\bigr)<1 ,
$$
and the corresponding flagged-mixture argument enforces a strict capacity bound below $\ln d_0$ (Theorem E.2).

**E.4.1 Definitions for Channel Capacity**

To formalize this, we use standard definitions from quantum information theory (all logarithms are natural, giving units of nats, unless specified otherwise):

*   **Quantum Channel:** A quantum channel is a completely–positive, trace–preserving (CPTP) linear map $\Phi: \mathcal{B}(\mathcal{H}_{in}) \to \mathcal{B}(\mathcal{H}_{out})$, where $\mathcal{H}_{in}$ and $\mathcal{H}_{out}$ are finite-dimensional Hilbert spaces. For the ND–RID 'Evolve' channel $\mathcal{E}_N$, we have $\mathcal{H}_{in} = \mathcal{H}_{out} = \mathcal{H}_{d_0}$, the $d_0$-dimensional MPU Hilbert space. $\mathcal{B}(\mathcal{H})$ denotes the space of bounded linear operators on $\mathcal{H}$, and $\mathcal{S}(\mathcal{H}_{d_0})$ the set of density operators on $\mathcal{H}_{d_0}$.
*   **Trace-Norm Contractivity Factor $f_{\mathrm{RID}}(\Phi)$:** Define the worst-case trace-distance contraction coefficient:
  $$
  f_{\text{RID}}(\Phi):=\sup_{\rho_1\neq\rho_2}\frac{D_{\mathrm{tr}}(\Phi(\rho_1),\Phi(\rho_2))}{D_{\mathrm{tr}}(\rho_1,\rho_2)}\in[0,1].
  $$
  Lemma E.1 gives a sufficient structural condition for strict contraction: if $\Phi$ contains a nonzero refresh component of weight $p>0$ (i.e., $\Phi=(1-p)\Psi+pT_\sigma$), then $f_{\text{RID}}(\Phi)\le 1-p<1$.

  For context: unitary channels (and, more generally, channels that preserve trace distance for all state pairs, i.e. trace-distance isometries) satisfy $f_{\text{RID}}=1$. However, $f_{\text{RID}}=1$ can also occur for non-unitary channels that preserve a noiseless classical or quantum subspace. The condition $f_{\text{RID}}<1$ is strictly stronger than non-unitarity and is the relevant property used here.
*   **One–Shot and Regularized Classical Capacities:** For a channel $\Psi$, the one–shot Holevo capacity is
    $$
    \chi^{\ast}(\Psi):=\max_{\{p_{k},\rho_{k}\}} \Bigl[ S\Bigl(\sum_{k}p_{k}\Psi(\rho_{k})\Bigr) -\sum_{k}p_{k}S\bigl(\Psi(\rho_{k})\bigr) \Bigr]
    \tag{E.3a}
    $$
    where $S(\cdot)$ is the von Neumann entropy. The classical Shannon capacity $C(\Phi)$ is the regularized limit (HSW Theorem):
    $$
    C(\Phi):=\lim_{n\to\infty}\frac1n\chi^{\ast}(\Phi^{\otimes n})
    \tag{E.3b}
    $$
    It is always true that $\chi^{\ast}(\Phi)\le C(\Phi)\le\ln d_0$. For the PU framework, we are interested in the true information transmission rate $C(\mathcal{E}_N)$. The following theorem establishes that this rate is strictly less than the ideal maximum if the channel is contractive.


**Theorem E.2 (Fundamental Strict Bound on ND--RID Channel Capacity on the Refresh Branch).**
Let $\mathcal E_N$ act on the $d_0$-dimensional MPU Hilbert space and assume
$$
\mathcal E_N
=
(1-p)\Psi+pT_\sigma,
\qquad
T_\sigma(\rho)=\operatorname{Tr}(\rho)\sigma,
\qquad
p\in(0,1].
$$
Then
$$
C(\mathcal E_N)
\le
(1-p)\ln d_0
<
\ln d_0.
\tag{E.3}
$$
For subsequent use, write
$$
C_{\max}(f_{\mathrm{RID}};\mathcal E_N)
:=
C(\mathcal E_N),
$$
with $C_{\max}(f_{\mathrm{RID}})$ permitted as shorthand only when the ND--RID channel and its refresh decomposition have already been declared. The symbol does not assert that $f_{\mathrm{RID}}$ alone determines capacity.

*Proof.* Introduce the flagged channel
$$
\widetilde{\mathcal E}_N(\rho)
=
(1-p)\Psi(\rho)\otimes|0\rangle\langle0|
+
p\sigma\otimes|1\rangle\langle1|.
$$
Tracing out the flag gives $\mathcal E_N$, so data processing gives
$$
C(\mathcal E_N)
\le
C(\widetilde{\mathcal E}_N).
$$
For an arbitrary classical-message code over $n$ uses, including entangled code states, let $F^n$ be the independently generated flag string. Because $I(M;F^n)=0$,
$$
I(M;B^nF^n)
=
\sum_f\Pr(F^n=f)I(M;B^n\mid F^n=f).
$$
If $f$ contains $k(f)$ refresh flags, the corresponding outputs equal $\sigma^{\otimes k(f)}$ and carry no message dependence. The other outputs occupy a space of dimension at most $d_0^{n-k(f)}$, so the Holevo dimension bound gives
$$
I(M;B^n\mid F^n=f)
\le
(n-k(f))\ln d_0.
$$
Averaging and using $\mathbb E[k(F^n)]=np$ yields
$$
I(M;B^nF^n)
\le
n(1-p)\ln d_0.
$$
Taking the supremum over codes, dividing by $n$, and regularizing proves
$$
C(\widetilde{\mathcal E}_N)
\le
(1-p)\ln d_0.
$$
The claimed bound follows, with no rank condition on $\sigma$. ∎


**Proposition E.2a (Reset-Support Capacity Deficit for a Registered Completed Cycle).**
Let a registered completed-reset branch act on the factorization
$$
\mathcal H_{d_0}=\mathcal H_K\otimes\mathcal H_R,
\qquad
\dim\mathcal H_R=r\ge2,
\qquad
\dim\mathcal H_K=d_0/r,
$$
where the reset register $\mathcal H_R$ is returned to a fixed ready state $|0\rangle_R$. Let the completed channel have the form
$$
\Phi(\rho)
=
\operatorname{Tr}_R(U\rho U^\dagger)\otimes |0\rangle\langle0|_R
$$
for some unitary $U$ on $\mathcal H_{d_0}$. Then the regularized classical capacity of $\Phi$ satisfies
$$
C(\Phi)\le \ln d_0-\ln r.
\tag{E.2a-cap}
$$
For a binary registered reset, $r=2$, hence
$$
C(\Phi)\le \ln d_0-\ln2.
\tag{E.2a-bin}
$$
On the minimal MPU branch $d_0=8$,
$$
C(\Phi)\le 2\ln2.
\tag{E.2a-min}
$$

*Proof.* The range of $\Phi$ is contained in the subspace
$$
\mathcal H_K\otimes\operatorname{span}\{|0\rangle_R\},
$$
whose dimension is $d_0/r$. Therefore, for any ensemble $\{p_m,\rho_m\}$, the average output state and all individual output states have support contained in a Hilbert space of dimension at most $d_0/r$. The one-shot Holevo information obeys
$$
\chi(\{p_m,\Phi(\rho_m)\})
=
S\!\left(\sum_m p_m\Phi(\rho_m)\right)
-
\sum_m p_m S(\Phi(\rho_m))
\le
S\!\left(\sum_m p_m\Phi(\rho_m)\right)
\le
\ln(d_0/r).
$$
For every $n$ and every input state $\rho^{(n)}$,
$$
\operatorname{supp}\!\left[\Phi^{\otimes n}(\rho^{(n)})\right]
\subseteq
\left(\mathcal H_K\otimes\operatorname{span}\{|0\rangle_R\}\right)^{\otimes n}.
$$
Indeed, each output reset factor is fixed to $|0\rangle_R$, independently of correlations among the input factors. Hence every output ensemble of $\Phi^{\otimes n}$ is supported on a Hilbert space of dimension at most $(d_0/r)^n$, and therefore
$$
\chi^*(\Phi^{\otimes n})\le n\ln(d_0/r).
$$
Dividing by $n$ and taking the regularized HSW limit [Holevo 1998; Schumacher–Westmoreland 1997] gives
$$
C(\Phi)=\lim_{n\to\infty}\frac1n\chi^*(\Phi^{\otimes n})
\le
\ln d_0-\ln r.
$$
A binary registered reset has $r=2$, giving (E.2a-bin), and the minimal MPU branch has $d_0=8$, giving (E.2a-min). ∎

**Remark E.2a.1 (Scope of the reset-support bound).**
Proposition E.2a is a support-dimension theorem. It does not assert strict trace-distance contraction on all of $\mathcal H_{d_0}$. Full-state strict contraction is the separate refresh/minorization branch of Lemma E.1. The PCE residual-budget equality
$$
C_{\max}^*=\ln d_0-\varepsilon_0
$$
is the saturation of the reset-support bound when the reset is binary, $\varepsilon_0=\ln2$, and no additional response-relevant overhead is retained.

**Remark E.2a.2 (Whole-retained-output support condition).**
Proposition E.2a extends to any channel whose entire retained output, after the PPI quotient, has support in a fixed subspace of dimension at most $d_0/r$. Returning only $\mathcal H_R$ to $|0\rangle_R$ does not establish that condition when a retained environment or auxiliary output carries input-dependent information. Every response-active retained factor must be included in the output-support dimension before applying the HSW bound. Thus extension beyond the displayed normal form requires an explicit whole-retained-output support certificate.

**Remark E.2a.3 (Branch attribution for downstream uses).**
Two structurally distinct finite-transfer routes are now available, and downstream theorems use one or the other depending on what they need.

| Downstream result | Branch used | What it needs |
|:---|:---|:---|
| Area-law coefficient (Theorem E.6) and $G_{\mathrm{op}}$ | Declared channel capacity together with Theorem E.3 density, capacity-achievement, entropy-saturation, and additive-ledger certificates | Proposition E.2a supplies the optional specialization $C(\mathcal E_N)=2\ln2$ only when its whole-retained-output support bound is achieved on $d_0=8$ |
| Bekenstein--Hawking identification | The preceding saturated operational branch plus the information--entropy bridge and $G_{\mathrm{op}}=G$ calibration | Not a consequence of reset support alone |
| Strict capacity inequality $C(\mathcal E_N)<\ln d_0$ (Thm E.2) | Refresh/minorization (Lem E.1) | Strict, possibly non-quantitative bound |
| Mixing/primitivity, unique full-rank fixed point (Sanz et al. 2010) | Refresh/minorization (Lem E.1) | Strict trace-distance contraction $f_{RID}<1$ |
| Data-processing contraction $f_{RID}<1$ (Thm N.10, App C, App K transport) | Refresh/minorization (Lem E.1) | Strict trace-distance contraction across multiple cycles |
| Born-rule / GNS / PCE non-contextuality | Independent of branch | Algebraic, does not invoke either capacity route |

When a downstream argument needs a quantitative residual-budget number, it lives on the reset-support branch. When it needs strict trace-distance contraction or fixed-point uniqueness, it lives on the refresh/minorization branch. Results derivable from either branch are labeled at point of use.

**Definition E.2a.4 (Retained Link Ledger and Actualization Threshold).** Fix a retained ND-RID link $\ell$ after its last completed 'Evolve' commit. Define the retained link ledger
$$
I_\ell(t):=\sup_{0\le s\le t} I_{\mathrm{ext}}(s),
$$
where $I_{\mathrm{ext}}(s)$ is the supremum, over retained finite boundary protocols in the PPI quotient (Definition P.6.2), of reliable extractable correlation in nats across $\ell$ from the local process window at $s$. The running supremum makes $I_\ell$ nondecreasing and treats unitarily unwound correlations as already exposed capacity demands. Let $C_{\max}$ denote the certified per-cycle reliable capacity threshold for the selected route: the quantitative reset-support capacity of Proposition E.2a when the residual-budget number is used, or the branch-specific strict capacity record supplied with Theorem E.2 when the refresh/minorization route is used. A mere upper bound is not itself a threshold unless the capacity-route record fixes the operational value used in the comparison. Define the first capacity-saturation time
$$
\tau_s:=\inf\{t>0:I_\ell(t)\ge C_{\max}\}.
$$
If this set is empty in the operational window, no capacity-threshold commit is certified in that window.

**Proposition E.2a.5 (Capacity-Threshold Commit Gate).** Suppose $\tau_s$ is finite, $I_\ell$ is $C^1$ on $[0,\tau_s]$, $I_\ell(0)=0$, $\dot I_\ell(t)>0$ on $(0,\tau_s]$, $\dot I_\ell(t)$ is nondecreasing up to $\tau_s$, and the armed link carries maintenance rent $\Phi_\ell>0$ per unit time. For the renewal-cycle cost per verified nat
$$
c(\tau)=\frac{\varepsilon_0+\Phi_\ell\tau}{\min\{I_\ell(\tau),C_{\max}\}},
\qquad
\varepsilon_0>0,
$$
the unique deterministic minimizer over positive commit times is $\tau=\tau_s$. Thus, on the stated branch, the PCE-selected commit rule is: commit at first certified capacity saturation. Under stationary flux $I_\ell(\tau)=\dot I\,\tau$, the rate is
$$
\Gamma_{\mathrm{Evolve}}=\frac{\dot I}{C_{\max}},
$$
and on the residual-budget minimal branch $C_{\max}^*=2\ln2$ this becomes $\Gamma_{\mathrm{Evolve}}=\dot I/(2\ln2)$.

*Proof.* By continuity, the definition of $\tau_s$ gives $I_\ell(\tau_s)=C_{\max}$. For $\tau>\tau_s$, the verified payload is fixed at $C_{\max}$ while $\varepsilon_0+\Phi_\ell\tau$ is strictly increasing, so $c$ strictly increases. For $0<\tau\le\tau_s$, nondecreasing $\dot I_\ell$ makes $I_\ell$ convex with $I_\ell(0)=0$, hence $I_\ell(\tau)\le\tau\dot I_\ell(\tau)$. Differentiating on this interval gives
$$
c'(\tau)
=
\frac{\Phi_\ell I_\ell(\tau)-(\varepsilon_0+\Phi_\ell\tau)\dot I_\ell(\tau)}
{I_\ell(\tau)^2}
\le
-\frac{\varepsilon_0\dot I_\ell(\tau)}{I_\ell(\tau)^2}
<0.
$$
Therefore $c$ strictly decreases up to $\tau_s$ and strictly increases after $\tau_s$. For any randomized adapted stopping rule with finite expectations and $\mathbb E[\min\{I_\ell(\tau),C_{\max}\}]>0$, the pointwise inequality
$$
\varepsilon_0+\Phi_\ell\tau
\ge
c(\tau_s)\min\{I_\ell(\tau),C_{\max}\}
$$
implies, after taking expectations,
$$
\frac{\mathbb E[\varepsilon_0+\Phi_\ell\tau]}
{\mathbb E[\min\{I_\ell(\tau),C_{\max}\}]}
\ge c(\tau_s),
$$
with equality only when the stopping rule is supported on deterministic minimizers. Since the minimizer is unique, equality forces $\tau=\tau_s$ almost surely. ∎

**Gate E.2a.G1 (Decaying-Flux Landauer-Dominance Record).** If $\dot I_\ell$ decreases on the commit window, Proposition E.2a.5 remains available only when the finite record certifies
$$
\Phi_\ell\bigl(I_\ell(\tau)-\tau\dot I_\ell(\tau)\bigr)
\le
\varepsilon_0\dot I_\ell(\tau)
\qquad
(0<\tau\le\tau_s).
$$
This is exactly the derivative sign condition $c'(\tau)\le0$ before saturation. If it is not certified, timing remains a branch arming predicate rather than a theorem-level threshold.

**Definition E.2a.6 (Actualization-Threshold Certificate $\mathfrak C_{\mathrm{act}}$).** An actualization-threshold certificate is a finite record
$$
\mathfrak C_{\mathrm{act}}
=
(\text{capacity-route record},\;\text{flux-shape record or Gate E.2a.G1 record},\;\text{local process-tensor causal-control record},\;\text{ledger-to-laboratory bridge},\;\text{forward lock};\;[\mathfrak Q_{\mathrm{ML}}\ \text{optional for absolute clock rates}]),
$$
with all entries fixed before comparison. When a chronometric reduction is asserted, the certificate also includes the reduction record identifying $\dot I_{ij}=C_{\max}\Gamma_{\mathrm{ch}}^{(ij)}$ with the saturated chronometric branch of Theorem 47c. A branch carrying $\mathfrak C_{\mathrm{act}}$ may read the “significant interaction” clause of Definition 27 as the capacity-saturation predicate of Definition E.2a.4. Without this certificate, Definition 27 keeps its explicit branch interaction predicate.

**Corollary E.2a.7 (Threshold/Gravity Cross-Lock on the Calibration Branch).** On the Appendix E/Q calibration branch using the same certified $C_{\max}$ in the threshold ledger and in Equation (E.9),
$$
G\,C_{\max}=\frac{\eta\delta^2c^3}{4\hbar\chi}.
$$
On the residual-budget, throughput-saturated, ideal-packing branch with $C_{\max}^*=2\ln2$, $\chi^*=1$, and $\eta^*=1$, this is the same calibration that yields Equation (Q.18). A mismatch between the measured threshold ledger and the gravitational calibration falsifies that combined branch rather than introducing a tunable parameter.

*Proof.* Rearranging Equation (E.9) gives the displayed identity. The specialization is exactly the substitution recorded in Appendix Q, §Q.2. ∎

**Definition E.2a.8 (Metered Actualization Certificate $\mathfrak C_{\mathrm{meter}}(R)$).** A metered actualization certificate for an interface register $R$ is a refinement of $\mathfrak C_{\mathrm{act}}$ with finite record
$$
\mathfrak C_{\mathrm{meter}}(R)
=
(R,\mathcal A_R,\Delta C_R,I_{\mathrm{acq}}^R,C_{\max}^{(R)},\epsilon_{\mathrm{meter}},\text{monotone acquisition interval},\text{overwrite bound},\text{no-early-firing audit},\text{process-tensor no-future-to-past causality audit},\text{forward lock}).
$$
Here $\mathcal A_R$ is the retained register alphabet, $I_{\mathrm{acq}}^R(t)$ is the certified acquired retained information in nats, $C_{\max}^{(R)}$ is the fixed register threshold, and $\epsilon_{\mathrm{meter}}$ is the pre-locked timing residual. For a certified binary one-register interface,
$$
C_{\max}^{(R)}=\ln2,
\qquad
\Delta C_R\ge \ln2-\epsilon_{\mathrm{meter}}
$$
is the metered subledger threshold. This does not replace the link-cycle threshold $C_{\max}$ of Definition E.2a.4 unless the certificate identifies the retained link with that one-register interface.

**Corollary E.2a.9 (Stationary Metered Event Rate).** On a branch carrying $\mathfrak C_{\mathrm{meter}}(R)$ with stationary acquisition flux
$$
I_{\mathrm{acq}}^R(t)=\dot I_{\mathrm{acq}}^R t
$$
and with no overwrite before commit, the certified metered event rate is
$$
\Gamma_{\mathrm{Evolve}}^{(R)}=\frac{\dot I_{\mathrm{acq}}^R}{C_{\max}^{(R)}}.
$$
For the binary one-register subledger this becomes $\Gamma_{\mathrm{Evolve}}^{(R)}=\dot I_{\mathrm{acq}}^R/\ln2$ up to the recorded residual. The residual-budget link branch remains $\dot I/C_{\max}$ and gives $\dot I/(2\ln2)$ only on the residual-budget minimal branch of Proposition E.2a.5.

*Proof.* The first metered commit occurs at the first time when the monotone acquisition ledger reaches $C_{\max}^{(R)}$ within the residual tolerance. Under stationary flux this time is $C_{\max}^{(R)}/\dot I_{\mathrm{acq}}^R$, and the reciprocal is the displayed rate. The final sentence is the distinction between the register subledger and the link-cycle ledger of Definition E.2a.4. ∎

**Remark E.2a.10 (Metered Subledger Guardrail).** A $\ln2$ threshold is a certified binary-register acquisition threshold, not a universal per-link ND-RID threshold and not a heat quantum. Reversible writing or acquisition need not dissipate heat. A physical lower bound arises only for a separately registered erase, reset, or overwrite satisfying Theorem 31, in which case the bound is distribution-sensitive through $H_q(P\mid R)$; verification, syndrome, recovery, and implementation overhead remain separate ledger entries.



**Corollary E.2 (Entropy Bound per ND--RID Channel).** Let $C(\mathcal E_N)$ be the classical capacity of the declared ND--RID channel. If the thermodynamic boundary ledger counts only reliably distinguishable classical response labels transmitted through that channel, then its asymptotic entropy rate satisfies
$$
S_{\mathrm{channel}}^{\mathrm{rel}}
\le
k_BC(\mathcal E_N).
\tag{E.4}
$$
Equality may be used only on a branch carrying a capacity-achieving code, an entropy-saturating response distribution, and a ledger identifying the transmitted response entropy with the boundary thermodynamic entropy.

*Proof.* Consider a sequence of reliable codes using $n$ independent channel uses to distinguish $M_n$ classical response labels. By the converse part of the classical channel-coding theorem,
$$
\limsup_{n\to\infty}\frac1n\ln M_n
\le
C(\mathcal E_N).
$$
For any probability law on those labels, Shannon entropy is at most $\ln M_n$. Therefore the thermodynamic response entropy per use obeys
$$
\limsup_{n\to\infty}
\frac{k_BH(M_n)}{n}
\le
k_B\limsup_{n\to\infty}\frac{1}{n}\ln M_n
\le
k_BC(\mathcal E_N).
$$
This proves (E.4). The reverse inequality requires the three additional saturation entries stated above. ∎

**E.5 Geometric Scaling of Boundary Information Channels (Conditional Derivation)**

The derivation of the Area Law requires understanding how the number of effective independent information channels crossing a boundary scales with the boundary's area in the emergent regular spacetime. This scaling is a consequence of the geometric regularity established by Theorem 43.

**Theorem E.3 (Boundary Channel Density from Geometric Regularity and Density Certificate).**
Conditional on the Necessary Emergence of Geometric Regularity (Theorem 43), consider the MPU network $\mathcal{N}$ whose emergent geometry is described by a D=4 dimensional manifold $(M, g_{\mu\nu})$ satisfying uniform volume growth and bounded Ricci curvature. Let $\mathcal{H} \subset M$ be a smooth, compact, 2-dimensional boundary surface (e.g., a cross-section of a causal horizon) with area $\mathcal{A} = \text{Area}(\mathcal{H})$. Geometric regularity gives the deterministic upper bound of Lemma E.5.1. On the density-certificate branch where the macroscopic transversality/orientation factor $\eta$ and independence factor $\chi$ exist, the total number of effective independent information channels $N_{eff_links}$ crossing this boundary $\mathcal{H}$ has the asymptotic area density
$$
N_{eff_links} = \sigma_{eff_link}\;\mathcal A\;+\;o(\mathcal A)
\tag{E.5}
$$
where $\sigma_{eff_link}$ is the effective surface density of independent information channels. This density is related to the underlying geometric density of potential links and the impact of correlations. Specifically:
*   Let $\sigma_{geom_link} = 1 / (\eta \delta^2)$ be the purely geometric surface density of potential boundary-crossing links. Let $\sigma_{\max}:=1/\delta^2$ denote the reference maximal admissible link density at operational resolution $\delta$ (one link footprint per surface cell of area $\delta^2$ in the macroscopic regular regime). Define the geometric inefficiency factor by
$$
\eta := \frac{\sigma_{\max}}{\sigma_{geom_link}},
$$
so $\eta\ge 1$ and the mean surface area per potential link is $\eta \delta^2$. The limit $\eta=1$ corresponds to saturating the reference density $\sigma_{\max}$ in the macroscopic regular regime.

*   Let $\chi$ be a dimensionless independence factor ($0 < \chi \le 1$) defined so that the effective independent-link count satisfies $N_{eff_links}=\chi N_{geom_links}$. Thus $\chi=1$ corresponds to statistically independent boundary links and $\chi<1$ quantifies the reduction in effective independent channels due to cross-link correlations. The effective density is then $\sigma_{eff_link}=\chi/(\eta\delta^2)$; the equilibrium values are fixed in Appendix Q.

*Proof.* Lemma E.5.1 gives the theorem-level upper bound
$$
N_{\partial A}\le c_+\frac{\mathcal A}{\delta^2}
$$
under geometric regularity, bounded degree, finite edge range, and quasi-uniform upper density. The density-certificate branch adds the macroscopic transversality datum that the geometric boundary-link count has an asymptotic density
$$
N_{\mathrm{geom\,links}}
=
\frac{\mathcal A}{\eta\delta^2}+o(\mathcal A),
\qquad
\eta\ge1.
$$
The independence factor $\chi$ is defined by the finite-response quotient of correlated boundary links:
$$
N_{\mathrm{eff\,links}}=\chi N_{\mathrm{geom\,links}}+o(\mathcal A),
\qquad
0<\chi\le1.
$$
Substituting the density certificate gives
$$
N_{\mathrm{eff\,links}}
=
\frac{\chi}{\eta\delta^2}\mathcal A+o(\mathcal A)
=
\sigma_{\mathrm{eff\,link}}\mathcal A+o(\mathcal A).
$$
The $o(\mathcal A)$ term is negligible in the macroscopic limit $\mathcal A\gg\delta^2$. ∎


### E.5.1 Geometric Bounds on Boundary-Crossing Link Count (Upper bound unconditional; lower bound requires an extra hypothesis)

Theorem E.3 uses the scaling $N_{\mathrm{eff\,links}}=\Theta(\mathcal{A}/\delta^2)$. The following lemma isolates a deterministic geometric upper bound behind that scaling in a form that is fully rigorous under the stated regularity hypotheses.

Let $\Sigma$ be a spatial slice with induced Riemannian metric $g$ and let $A\subset\Sigma$ be a region with smooth boundary surface $\mathcal{H}:=\partial A$ of area $\mathcal{A}=\mathrm{Area}(\mathcal{H})$. Let $\delta$ be the mean microscopic MPU spacing, and let $z_{\max}$ be the maximal network degree. Assume there exists an embedding $\iota:\mathcal{V}\to\Sigma$ such that every edge $\{u,v\}\in\mathcal{E}$ connects vertices whose embedded distance is bounded by a fixed multiple of $\delta$:
$$
d_g(\iota(u),\iota(v))\le m\,\delta
\quad\text{for all }\{u,v\}\in\mathcal{E},
$$
for some fixed integer $m\ge 1$.

Define the (undirected) boundary-crossing edge count
$$
N_{\partial A}:=\#\bigl\{\{u,v\}\in\mathcal{E}:\; \iota(u)\in A,\ \iota(v)\notin A\bigr\}.
$$

**Lemma E.5.1 (Deterministic upper bound for $N_{\partial A}$).**
Assume that $\mathcal H$ is a compact $C^2$ surface with tubular radius $r_{\mathcal H}>0$, that ambient volume comparison holds throughout $T_{r_{\mathcal H}}(\mathcal H)$, and that the embedded vertex set satisfies the packing estimate
$$
\#(\iota(\mathcal V)\cap U)
\le \frac{C_{\mathrm{pack}}}{\delta^3}
\operatorname{Vol}_g(T_{\delta/2}(U))
\tag{E.5a.0}
$$
for every measurable $U\subset T_{r_{\mathcal H}-\delta/2}(\mathcal H)$. Assume also $(m+1/2)\delta<r_{\mathcal H}$. Then a constant $c_+>0$, depending only on these geometric constants, $z_{\max}$, and $m$, satisfies
$$
N_{\partial A}
\le
c_+\,\frac{\mathcal A}{\delta^2}.
\tag{E.5a}
$$

*Proof.*
Every boundary-crossing edge has an endpoint in $T_{m\delta}(\mathcal H)$, so
$$
N_{\partial A}
\le z_{\max}\#\bigl(\iota(\mathcal V)\cap T_{m\delta}(\mathcal H)\bigr).
$$
Apply (E.5a.0) with $U=T_{m\delta}(\mathcal H)$. Since
$$
T_{\delta/2}(T_{m\delta}(\mathcal H))
\subseteq T_{(m+1/2)\delta}(\mathcal H),
$$
the tubular-coordinate Jacobian bound gives a constant $C_{\mathrm{tube}}$ such that
$$
\operatorname{Vol}_g(T_{(m+1/2)\delta}(\mathcal H))
\le C_{\mathrm{tube}}(m+1/2)\delta\mathcal A.
$$
Consequently,
$$
N_{\partial A}
\le z_{\max}C_{\mathrm{pack}}C_{\mathrm{tube}}(m+1/2)
\frac{\mathcal A}{\delta^2}.
$$
Taking $c_+=z_{\max}C_{\mathrm{pack}}C_{\mathrm{tube}}(m+1/2)$ proves the claim. $\square$

**Additional Hypothesis E.5.1-LB (When a matching lower bound holds).**
A two-sided estimate $N_{\partial A}\ge c_-\,\mathcal{A}/\delta^2$ requires an additional structural hypothesis on the embedded interaction graph (e.g., a unit-disk/nearest-neighbor type rule guaranteeing a uniformly positive fraction of edges transverse to any smooth cut at scale $\delta$). In Appendix E we absorb such orientation/transversality information into the $\eta=O(1)$ factor in $\sigma_{\mathrm{geom\,link}}=1/(\eta\delta^2)$.

**Remark E.5.1a (Connection to $\eta$ and $\chi$).**
Lemma E.5.1 supplies the deterministic geometric upper bound behind the scaling used in Theorem E.3. The packing/orientation factor $\eta$ encodes the transversality details of the interaction graph relative to the surface, while the correlation factor $\chi$ encodes the reduction from geometric links to independent ND–RID information channels.

## E.6 Conditional Area Bounds from Local Many-Body and Boundary-Channel Structure

This section separates three statements: rigorous local many-body correlation bounds on their stated hypotheses, a higher-dimensional entanglement ansatz where no general theorem is available, and the operational boundary-channel bound of Theorem E.6. Operational equality additionally requires the capacity-achieving, entropy-saturating, and additive-ledger entries stated below. Identifying $G_{\mathrm{op}}$ with measured Newton $G$ is a separate external calibration, not an antecedent of the channel equality.

### E.6.1 Local Many-Body Branch Prerequisites

**Lemma E.6.1 (Locality, Finite Propagation Speed, Mixing, and Clustering).**
Assume a selected ND-RID implementation carries the following local many-body data and, where indicated, their additional consequences:

1. **Locality hypothesis:** The interaction Hamiltonian or generator is short-range, has finite interaction length $\ell_0$, and has the uniform local norm bound required by Proposition F.1.  
2. **Finite Lieb-Robinson Velocity:** Locality and bounded interaction strength imply a finite information propagation speed $v_{\text{LR}}$ (Proposition F.1), so that for local observables $O_A,O_B$:
$$
\|[\mathcal{E}_N^{*n}(O_A),O_B]\| \le C \|O_A\|\|O_B\| e^{-\mu(d(A,B)-v_{\text{LR}} n\tau)}.
\tag{E.3c}
$$
3. **Mixing (trace-distance contraction)**: If $\mathcal{E}_N$ satisfies Lemma E.1 with $f_{\text{RID}}<1$ and is primitive (unique fixed point $\rho_{\text{fix}}$), then for any state $\rho$:
$$
D_{\mathrm{tr}}(\mathcal{E}_N^{n}(\rho),\rho_{\text{fix}})
\le f_{\text{RID}}^{n}\,D_{\mathrm{tr}}(\rho,\rho_{\text{fix}})
\le f_{\text{RID}}^{n}.
\tag{E.4b}
$$
Define the (discrete-time) mixing gap $\Delta_{\text{gap}}:=-(1/\tau)\ln f_{\text{RID}}>0$.
4. **Exponential-clustering certificate**: When exponential clustering is used below, assume separately that the stationary state $\rho_{\mathrm{fix}}$ satisfies constants $C_{\mathrm{cl}}>0$ and $\xi>0$, uniform in system size, such that for disjointly supported local observables $O_A,O_B$,
$$
\left|\operatorname{Tr}(\rho_{\mathrm{fix}}O_AO_B)
-\operatorname{Tr}(\rho_{\mathrm{fix}}O_A)\operatorname{Tr}(\rho_{\mathrm{fix}}O_B)\right|
\le C_{\mathrm{cl}}\|O_A\|\|O_B\|e^{-d(A,B)/\xi}.
\tag{E.4c}
$$
This certificate may be discharged by a dissipative clustering theorem only after its locality, volume-uniform rapid-mixing, and any reversibility or stability hypotheses have been verified for the particular ND--RID channel family. Equations (E.3c)--(E.4b) alone do not assign a numerical value to $\xi$.

*Proof.*  
(1) is an explicit implementation hypothesis; Definition 6 specifies reflexive transition dependence but does not imply metric locality, finite range, or a bounded local generator.  
(2) is Proposition F.1; it depends on the locality scale and bounded local-generator norm, not on $f_{\mathrm{RID}}$.  
(3) follows by induction. For $n=1$ it is the one-step contraction (E.2). If it holds at $n$, then, using $\mathcal E_N(\rho_{\mathrm{fix}})=\rho_{\mathrm{fix}}$,
$$
D_{\mathrm{tr}}(\mathcal E_N^{n+1}(\rho),\rho_{\mathrm{fix}})
\le f_{\mathrm{RID}}D_{\mathrm{tr}}(\mathcal E_N^n(\rho),\rho_{\mathrm{fix}})
\le f_{\mathrm{RID}}^{n+1}D_{\mathrm{tr}}(\rho,\rho_{\mathrm{fix}}).
$$
The final bound follows from $D_{\mathrm{tr}}(\rho,\sigma)\le1$ for density operators. Item (4) is an explicit additional certificate and therefore needs no inference from items (1)--(3). $\square$


### E.6.1a Mutual-Information Area Bound for Local Gibbs States

For later interpretation, it is useful to record a rigorous distribution-free bound showing that *any* finite-range Gibbs state has boundary-limited total correlations as measured by mutual information.

**Theorem E.4a (Distribution-free mutual-information area bound for local Gibbs states).**
Let $H$ be a finite-range Hamiltonian on the MPU graph, decomposed as $H=\sum_Z h_Z$ with $\mathrm{diam}(Z)\le r_0$ and $\|h_Z\|\le J$ for all $Z$. Let
$$
\rho_\beta:=\frac{e^{-\beta H}}{\mathrm{Tr}(e^{-\beta H})}
$$
be the Gibbs state at inverse temperature $\beta>0$. For any bipartition of the vertex set into $A$ and $\bar A$, define
$$
I(A:\bar A)_{\rho_\beta}:=S(\rho_{\beta,A})+S(\rho_{\beta,\bar A})-S(\rho_\beta).
$$
Write $H=H_A+H_{\bar A}+H_{\partial A}$, where $H_A$ contains all $h_Z$ supported entirely in $A$, $H_{\bar A}$ contains those supported entirely in $\bar A$, and $H_{\partial A}$ contains the remaining (boundary-crossing) terms. Then
$$
I(A:\bar A)_{\rho_\beta}
\le
2\beta\,\|H_{\partial A}\|
\le
2\beta\sum_{Z:\,Z\cap A\ne\emptyset,\,Z\cap\bar A\ne\emptyset}\|h_Z\|.
\tag{E.MI}
$$

*Proof.*
Consider the free-energy functional
$$
F_\beta(\sigma):=\mathrm{Tr}(H\sigma)-\frac{1}{\beta}S(\sigma).
$$
The Gibbs state $\rho_\beta$ minimizes $F_\beta$ over all density operators $\sigma$, so $F_\beta(\rho_\beta)\le F_\beta(\sigma)$ for all $\sigma$. Choose $\sigma:=\rho_{\beta,A}\otimes\rho_{\beta,\bar A}$, for which $S(\sigma)=S(\rho_{\beta,A})+S(\rho_{\beta,\bar A})$. The variational inequality gives
$$
S(\rho_{\beta,A})+S(\rho_{\beta,\bar A})-S(\rho_\beta)
\le
\beta\Big(\mathrm{Tr}(H\sigma)-\mathrm{Tr}(H\rho_\beta)\Big).
$$
Because $\sigma$ and $\rho_\beta$ share the same marginals on $A$ and on $\bar A$, the contributions of $H_A$ and $H_{\bar A}$ cancel, leaving
$$
I(A:\bar A)_{\rho_\beta}
\le
\beta\Big(\mathrm{Tr}(H_{\partial A}\sigma)-\mathrm{Tr}(H_{\partial A}\rho_\beta)\Big).
$$
For any observable $O$ and any two states $\rho,\sigma$, one has $|\mathrm{Tr}(O(\sigma-\rho))|\le \|O\|\,\|\sigma-\rho\|_1\le 2\|O\|$. Applying this with $O=H_{\partial A}$ yields $I(A:\bar A)_{\rho_\beta}\le 2\beta\|H_{\partial A}\|$, and subadditivity of the operator norm gives the last inequality. $\square$

**Remark E.6.1a.**
Theorem E.4a controls *total* correlations across $\partial A$ at nonzero temperature in any dimension. In contrast, a von Neumann entropy area law for ground states is fully rigorous in the 1D gapped setting (Hastings), while in higher dimensions one typically adopts an area-scaling ansatz for entanglement entropy as a semiclassical consistency input.


### E.6.2 Entanglement Entropy Area Scaling

In local many-body systems, correlations between a region and its complement are limited by boundary interactions. In one spatial dimension this can be made fully rigorous for gapped Hamiltonians, while in higher dimensions it is widely expected (and verified in many models) but not known in complete generality. Since the PU area law used downstream is derived operationally from boundary-channel counting (Theorem E.3, Corollary E.2, and Lemma E.5.1), the entanglement picture is optional context rather than a required input.

**Theorem E.4' (One-Dimensional Ground-State Area Law; Higher-Dimensional Ansatz).**
Let $H$ be a one-dimensional finite-range Hamiltonian with finite on-site Hilbert-space dimension, uniformly bounded local interactions, a unique ground state $\rho_0=|\Omega\rangle\langle\Omega|$, and a spectral gap bounded below independently of chain length. Then there is a constant $C$ depending on the local dimension, interaction bounds, range, and gap, but not on the length of a connected interval $A$, such that
$$
S(\rho_{0,A})
\le
C.
$$

In spatial dimensions greater than one, the relation
$$
S_{\mathrm{ent}}(A)
\le
\eta_{\mathrm{ent}}|\partial A|
\tag{E.6a}
$$
is a separately declared semiclassical ansatz unless a model-specific area-law theorem is supplied. It is not used as an independent input to the operational channel-counting argument.

*Proof.* The one-dimensional conclusion is the area-law theorem of Hastings (2007, *Journal of Statistical Mechanics* P08024). Its hypotheses match the one-dimensional assumptions above: finite interaction range and strength, finite local dimension, a ground state, and a system-size-independent gap. The higher-dimensional display is labeled as an ansatz and has no theorem-level proof in this appendix. ∎

**Remark E.6.2a (Rigorous boundary-correlation control at finite temperature).**
For Gibbs states in any dimension, a distribution-free boundary law holds for mutual information (Theorem E.4a), which already captures the PU requirement that total correlations across $\partial A$ are controlled by boundary interaction terms.

### E.6.3 Theorem E.5 (Operational Horizon Entropy Bound and Calibrated Saturation)

**Summary of Theorem E.5 (Operational area bound and saturated coupling).** Let $\mathcal H$ be a causal-horizon cross-section of area $\mathcal A$ on the branch of Theorem E.3, and let $S_{\mathrm{rel}}(\mathcal A)$ denote the reliable thermodynamic response entropy of the boundary channels crossing $\mathcal H$, as in Theorem E.6. Boundary-channel counting gives
$$
S_{\mathrm{rel}}(\mathcal A)
\le
k_B\frac{\chi C(\mathcal E_N)}{\eta\delta^2}\mathcal A+o(\mathcal A).
\tag{E.6b}
$$
Equality holds only on the jointly capacity-achieving, entropy-saturating, additive-ledger branch stated in Theorem E.6. When the saturated coefficient is positive, define the operational coupling $G_{\mathrm{op}}$ and the operational Planck area $L_{P,\mathrm{op}}^2:=G_{\mathrm{op}}\hbar/c^3$ by
$$
\frac{\chi C(\mathcal E_N)}{\eta\delta^2}
=
\frac{1}{4L_{P,\mathrm{op}}^2}
=
\frac{c^3}{4G_{\mathrm{op}}\hbar}.
\tag{E.6c}
$$
Then, on that branch,
$$
S_{\mathrm{rel}}(\mathcal A)
=
\frac{k_Bc^3\mathcal A}{4G_{\mathrm{op}}\hbar}+o(\mathcal A).
\tag{E.6d}
$$

**Remark E.6.3.1 (Calibration vs. derivation).**
Equation (E.6c) is the internal PU definition of the coupling that appears in the Einstein equations derived from the Clausius relation in Section 12; it fixes a relation among $\delta,\eta,\chi,$ and $C(\mathcal E_N)$ in the microscopic model. Identifying $S_{\mathrm{rel}}$ with thermodynamic horizon entropy, and $G_{\mathrm{op}}$ with the experimentally measured Newton constant, are separate calibration bridges external to the counting argument; neither follows from the upper bound (E.6b).

**Proposition E.6.3.2 (Refresh-Parameter Identity and Separate Reset Ledger).** Work on the refresh-parametrized ND--RID branch
$$
\mathcal E_N
=
(1-p)\Psi+pT_\sigma,
\qquad
T_\sigma(\rho)=\operatorname{Tr}(\rho)\sigma,
\qquad
p\in[0,1].
$$
Assume the strict capacity gap on this branch is certified through the refresh relation
$$
f_{\mathrm{RID}}
=
1-p
<
1.
$$
Then
$$
p>0,
\qquad
f_{\mathrm{RID}}<1.
$$
This conclusion is a channel-structure statement. If a physical implementation also resets a classical record $P$ while retaining $R$, Theorem E.1 separately gives
$$
\frac{\langle Q_{\mathrm{bath}}\rangle}{k_BT}
=
H_q(P\mid R)+\varepsilon_{\mathrm{diss}},
\qquad
\varepsilon_{\mathrm{diss}}\ge0.
$$
A positive conditional-heat floor requires $H_q(P\mid R)>0$, and positive total entropy production requires $\varepsilon_{\mathrm{diss}}>0$.

*Proof.* The identity $f_{\mathrm{RID}}=1-p<1$ gives $1-p<1$ and hence $p>0$. The remaining display is Theorem E.1 applied only when its registered-reset hypotheses hold. Neither $p>0$ nor information gain determines $H_q(P\mid R)$ or $\varepsilon_{\mathrm{diss}}$. ∎

**Remark E.6.3.3 (Scope of the refresh-parameter identity).** An area-law coefficient by itself does not imply $p>0$ without specifying the microscopic channel branch. A strict gap caused by an unrelated noisy channel, or a coefficient introduced only by calibration, would not prove SPAP refresh. Proposition E.6.3.2 is the exact reverse statement available inside the refresh-parametrized ND-RID branch used in Lemma E.1 and Theorem E.2.

### E.6.4 Connection to Channel Capacity Derivation

Theorem E.3 and Corollary E.2 give the density-branch bound
$$
\frac{S_{\mathrm{rel}}(\mathcal A)}{\mathcal A}
\le
k_B\frac{\chi C(\mathcal E_N)}{\eta\delta^2}+o(1).
$$
Equality holds only under the three saturation entries of Theorem E.6. On that branch, Definition (E.6c) writes the positive saturated coefficient as $1/(4L_{P,\mathrm{op}}^2)=c^3/(4G_{\mathrm{op}}\hbar)$. If the entanglement area-scaling ansatz of Theorem E.4' is also adopted as semiclassical context, matching its coefficient to this operational density is an additional consistency requirement rather than a second derivation.

### E.6.5 Derivation of the Horizon Entropy Area Law (Unified Synthesis)

We combine the entropy-per-channel upper bound of Corollary E.2 with the geometric channel-count bounds of Lemma E.5.1 and, on its density-certificate branch, Theorem E.3. This gives an area-scaling upper bound. The area-law equality of Theorem 49 requires the additional saturation and additive-ledger hypotheses stated in Theorem E.6.

**Theorem E.6 (Conditional Thermodynamic Boundary Area Bound and Saturated Area Law).**
Let $\mathcal E_N$ be the declared ND--RID channel and let $C(\mathcal E_N)$ be its classical capacity. Under emergent geometric regularity and Lemma E.5.1,
$$
S_{\mathrm{rel}}(\mathcal A)
\le
k_BC(\mathcal E_N)c_+\frac{\mathcal A}{\delta^2}.
$$
On the density-certificate branch of Theorem E.3, the sharper asymptotic bound is
$$
S_{\mathrm{rel}}(\mathcal A)
\le
k_B\left(
\frac{\chi C(\mathcal E_N)}{\eta\delta^2}
\right)\mathcal A
+
o(\mathcal A).
\tag{E.6}
$$
If the branch additionally carries a capacity-achieving code, an entropy-saturating response distribution, and an additive thermodynamic ledger for the effective independent channels, then equality holds in (E.6).

For a positive saturated coefficient, define the operational coupling $G_{\mathrm{op}}$ and operational Planck area $L_{P,\mathrm{op}}^2:=G_{\mathrm{op}}\hbar/c^3$ by
$$
\frac{\chi C(\mathcal E_N)}{\eta\delta^2}
=
\frac{1}{4L_{P,\mathrm{op}}^2}
=
\frac{c^3}{4G_{\mathrm{op}}\hbar}.
\tag{E.7}
$$
Then the saturated relation is
$$
S_{\mathrm{rel}}(\mathcal A)
=
\frac{k_Bc^3\mathcal A}{4G_{\mathrm{op}}\hbar}
+
o(\mathcal A)
=
\frac{k_B\mathcal A}{4L_{P,\mathrm{op}}^2}
+
o(\mathcal A),
\tag{E.8}
$$
and
$$
G_{\mathrm{op}}
=
\frac{\eta\delta^2c^3}
{4\hbar\chi C(\mathcal E_N)}.
\tag{E.9}
$$
Identifying $G_{\mathrm{op}}$ with the measured Newton constant is a separate calibration.

*Proof.* Corollary E.2 bounds the reliable thermodynamic response entropy of each channel by $k_BC(\mathcal E_N)$. Summing over at most $c_+\mathcal A/\delta^2$ boundary-crossing channels proves the first inequality. On the density-certificate branch,
$$
N_{\mathrm{eff}}
=
\frac{\chi}{\eta\delta^2}\mathcal A
+
o(\mathcal A),
$$
so the same per-channel bound gives (E.6). The three additional saturation entries make both the per-channel entropy bound and the effective-channel sum achievable, giving equality. Equations (E.7)--(E.9) are algebraic consequences of the operational definition of $G_{\mathrm{op}}$; the factor $1/4$ is the chosen Bekenstein--Hawking normalization of that definition. ∎

### E.6.6 Bekenstein--Hawking Normalization Identity

On the saturation branch of Theorem E.6, define
$$
\rho_S
:=
\frac{\chi C(\mathcal E_N)}{\eta\delta^2}.
$$
The operational convention $\rho_S=c^3/(4\hbar G_{\mathrm{op}})$ gives
$$
\frac{\chi C(\mathcal E_N)}{\eta\delta^2}
=
\frac{c^3}{4\hbar G_{\mathrm{op}}}.
\tag{E.10}
$$
Substitution into the saturated entropy density gives
$$
S_{\mathrm{rel}}(\mathcal A)
=
k_B\frac{c^3}{4\hbar G_{\mathrm{op}}}\mathcal A
+
o(\mathcal A).
\tag{E.11}
$$
With $L_{P,\mathrm{op}}^2:=G_{\mathrm{op}}\hbar/c^3$,
$$
S_{\mathrm{rel}}(\mathcal A)
=
k_B\frac{\mathcal A}{4L_{P,\mathrm{op}}^2}
+
o(\mathcal A).
\tag{E.12}
$$
These equations verify consistency with the Bekenstein--Hawking convention. The channel-counting argument determines the coefficient $\rho_S$; the numeral $1/4$ enters through the definition of $G_{\mathrm{op}}$. An independent derivation of that numeral would require a separately normalized gravitational or horizon-thermodynamic input.

**Remark E.1 (Illustrative Equal-Cell Restatement of Horizon Entropy)**

On the density-certificate, capacity-achieving, entropy-saturating, additive-ledger branch of Theorem E.6, the area-law coefficient is the effective channel density times the certified per-channel capacity. Equation (E.9) defines $G_{\mathrm{op}}$ by writing that coefficient in Bekenstein–Hawking normalization; identifying it with measured $G$ is a calibration. The following unit-cell construction is an additional interpretation on that branch.

A registered reachable binary quotient has structural log-cardinality $\varepsilon_0=\ln2$ nats. This is not, by itself, generated physical entropy. If a physical branch resets a record $P$ with retained side information $R$, conditional Landauer gives
$$
\frac{\Delta S_{\mathrm{env}}}{k_B}\ge H_q(P\mid R).
$$
A positive $\ln2$ floor therefore requires the separately stated condition $H_q(P\mid R)\ge\ln2$. The notation $\Delta S_{\mathrm{SPAP}}$ is reserved for an explicitly registered physical reset cost and is not identified with $\varepsilon_0$ without that reset ledger.

$$
\Delta S_{\text{SPAP}} = \ln 2
\tag{E.13}
$$


Assume the saturation and calibration branch of Theorem E.6 and a registered physical reset ledger satisfying $H_q(P\mid R)=\ln2$ with zero excess dissipation. If one further assigns one such reset entropy to each independent effective horizon cell, define $\Delta\mathcal A_{\mathrm{cell}}$ by
$$
\Delta S_{\text{SPAP}} = \frac{\Delta\mathcal{A}_{cell}}{4G} \quad \text{(in natural units where } \hbar=c=k_B=1 \text{)}.
\tag{E.13a}
$$
Substituting $\Delta S_{\text{SPAP}} = \ln2$:
$$
\ln2 = \frac{\Delta\mathcal{A}_{cell}}{4G} \quad \Rightarrow \quad \Delta\mathcal{A}_{cell} = 4G\ln2.
\tag{E.13b}
$$
On an additional illustrative equal-cell ansatz, assign each independent horizon cell the structural count $\varepsilon_0=\ln2$ and the area $\Delta\mathcal A_{\mathrm{cell}}=4G\ln2$. Then
$$
S=N_{\mathrm{cells}}\varepsilon_0
=\left(\frac{\mathcal A}{4G\ln2}\right)\ln2
=\frac{\mathcal A}{4G}.
\tag{E.13c}
$$
This is an algebraic restatement of the area law after the cell area and independent-additivity ansatz have been imposed. It does not derive a horizon-cell ontology, $G$, or the cell density from SPAP. Compatibility with Theorem E.6 additionally requires the independently calibrated identity $\sigma_{\mathrm{eff\,link}}C_{\max}=1/(4G)$; Theorem E.2's strict capacity bound alone supplies no saturation or value $C_{\max}=\ln2$.

**Corollary E.6.1 (Conditional Residual-Capacity Arithmetic).** Assume residual-capacity saturation $C_{\max}^{*}=\ln d_0-\varepsilon_0$, together with $d_0=8$, $\varepsilon_0=\ln2$, and $a=2$. Then
$$
C_{\max}^{*}
=2\ln2
=a\varepsilon_0.
\tag{E.13d}
$$

*Proof.* Since $\ln8=3\ln2$,
$$
C_{\max}^{*}=3\ln2-\ln2=2\ln2=a\varepsilon_0.
$$
$\square$

**Corollary E.6.2 (Conditional Length-to-Illustrative-Cell-Area Arithmetic).** Assume $\delta^2=8\ln2\,L_P^2$, $\Delta\mathcal A_{cell}=4\ln2\,L_P^2$, and $a=2$. Then
$$
\delta^2=a\,\Delta\mathcal A_{cell}.
\tag{E.13e}
$$

*Proof.* Direct division gives
$$
\frac{\delta^2}{\Delta\mathcal A_{cell}}
=\frac{8\ln2}{4\ln2}
=2
=a.
$$
$\square$

*Remark.* The two corollaries prove only the displayed arithmetic identities under their explicit residual-capacity, spacing, cell-area, and active-rank assumptions. They do not establish fundamental thermodynamic cells, a two-level ontology, or a common origin for $a$, $C_{\max}^{*}$, and the illustrative cell area.

**E.7 Conditional Planck--MPU Calibration**

Assume the residual-capacity saturation certificate
$$
C_{\max}^{*}=\ln d_0-\varepsilon_0,
\tag{E.14}
$$
the minimal-branch values $d_0=8$ and $\varepsilon_0=\ln2$, the density choices $\chi=\eta=1$, and the operational normalization
$$
\frac{\delta^2}{L_P^2}=\frac{4\chi C_{\max}^{*}}{\eta}.
$$
Then
$$
C_{\max}^{*}
=\ln8-\ln2
=2\ln2,
\tag{E.15}
$$
and
$$
\frac{\delta}{L_P}
=\sqrt{8\ln2}
=2.354820045\ldots.
\tag{E.16}
$$

*Proof.* Equation (E.15) follows from $\ln8=3\ln2$. Substitution into the normalization gives
$$
\frac{\delta^2}{L_P^2}=4(2\ln2)=8\ln2.
$$
Both lengths are positive, so taking the positive square root gives (E.16). The result is conditional on the saturation, density, and operational-normalization certificates; the arithmetic does not prove those inputs. $\square$



## E.8 Bulk Reconstruction from Boundary Channels

On the geometric, density-certificate, and saturation branch of Theorem 49, the boundary entropy has area scaling. This section derives capacity gates for bulk reconstruction and proves exact reconstruction only when a compatible isometric encoding or Petz-sufficient recovery family is supplied.

### E.8.1 The Reconstruction Problem

**Definition E.8.1 (Bulk-Boundary Correspondence).** For a region $A$ with boundary $\partial A$ in the emergent geometry, the bulk-boundary correspondence is an encoding map:

$$\Phi: \mathcal{H}_{\text{bulk}}(A) \to \mathcal{H}_{\text{boundary}}(\partial A)$$

that isometrically embeds bulk degrees of freedom into boundary data up to the channel capacity limit.

**Theorem E.8.1 (Exact Reconstruction from a Supplied Isometric Boundary Code).** Let $\mathcal C\subseteq\mathcal H_{\mathrm{bulk}}(A)$ be a code subspace and suppose there is an isometry
$$
\Phi:\mathcal C\hookrightarrow\mathcal H_{\mathrm{boundary}}(\partial A),
\qquad
\Phi^\dagger\Phi=\mathbf1_{\mathcal C}.
$$
Then every operator on $\mathcal C$ has an exact boundary representative on the encoded subspace. Such an isometry can exist only if
$$
\dim\mathcal C
\le
\dim\mathcal H_{\mathrm{boundary}}(\partial A).
$$
If the encoded state is subsequently passed through a noisy boundary channel $\mathcal N$, exact reconstruction additionally requires a recovery channel $\mathcal R$ satisfying
$$
\mathcal R\circ\mathcal N\circ\mathcal E
=
\operatorname{id}_{\mathcal S(\mathcal C)},
\qquad
\mathcal E(\rho)=\Phi\rho\Phi^\dagger.
$$
The classical capacity bound
$$
\limsup_{n\to\infty}\frac1n\ln M_n
\le
N_{\mathrm{channels}}C(\mathcal E_N)
$$
is a necessary asymptotic budget for $M_n$ reliably distinguishable classical boundary response labels. It is not sufficient for an exact quantum isometry or recovery map.

*Proof.* For an operator $O_A$ on $\mathcal C$, set
$$
O_{\partial A}
:=
\Phi O_A\Phi^\dagger.
$$
For every code state $\rho$,
$$
\operatorname{Tr}
\left(O_{\partial A}\Phi\rho\Phi^\dagger\right)
=
\operatorname{Tr}
\left(\Phi^\dagger\Phi O_A\Phi^\dagger\Phi\rho\right)
=
\operatorname{Tr}(O_A\rho).
$$
Thus reconstruction is exact on the encoded subspace. The dimension inequality is necessary for an injective linear isometry and is sufficient for an abstract isometry between the two Hilbert spaces. After a noisy channel, the displayed recovery identity directly restores every code state and hence every code response. The classical coding converse yields the last inequality but contains no assertion about coherent superpositions, proving the stated separation. ∎

**Remark E.8.1a.**
The statement above corrects the operator-mapping direction: for an encoding channel $\mathcal{E}$ (bulk states to boundary states), the adjoint $\mathcal{E}^\dagger$ maps boundary observables to bulk observables. The correct boundary representative of a bulk operator on an isometrically encoded code is the pushforward $O_{\partial A}=\Phi O_A\Phi^\dagger$.

### E.8.2 Reconstruction Without AdS

**Theorem E.8.2 (Capacity-Compatible Non-AdS Boundary Reconstruction Gate).** Let a bounded regular region satisfy:
1. geometric regularity (Theorem 43);
2. area-law entropy scaling on the density-certificate and saturation branch (Theorem 49);
3. finite ND-RID channel capacity supplied by Proposition E.2a and, where needed, the refresh/minorization branch of Theorem E.2.

Then the capacity-counting part of the PU holography mechanism is local and does not rely on AdS boundary conditions. On the density-certificate branch of Theorem E.3, a boundary cut of area $\mathcal A$ has effective channel count
$$
N_{\mathrm{channels}}=\sigma_{\mathrm{eff}}\mathcal A+o(\mathcal A),
\qquad
\sigma_{\mathrm{eff}}=\frac{\chi}{\eta\delta^2},
$$
and per-channel capacity $C_{\max}$. Any exact retained bulk code of Hilbert dimension $d_{\mathrm{code}}$ reconstructible through that cut must satisfy the budget gate
$$
\ln d_{\mathrm{code}}\le N_{\mathrm{channels}}C_{\max}=\sigma_{\mathrm{eff}}C_{\max}\mathcal A+o(\mathcal A).
\tag{E.8.2a}
$$
Conversely, if a compatible boundary encoding channel and recovery family are supplied on the nested ND-RID branch and satisfy the Petz-sufficiency condition of Definition E.8.1b, then every retained bulk response is reconstructible from boundary protocol responses by Theorem E.8.1c. Thus capacity is the necessary finite-response budget, while reconstruction is theorem-level only on the compatible encoding/recovery branch.

*Proof.*

**Step 1 (Local reconstruction scale).** Choose a geodesic ball $B_\epsilon(p)$ in the two-scale regime
$$
\delta\ll\epsilon\ll R_{\mathrm{curv}},
\tag{E.8.2.0}
$$
where $R_{\mathrm{curv}}$ bounds the local curvature radius and the density certificate is uniform on the ball. In three spatial dimensions the area of its geodesic-sphere boundary obeys
$$
\mathcal A_\epsilon
=4\pi\epsilon^2\left(1+O\left(\frac{\epsilon^2}{R_{\mathrm{curv}}^2}\right)\right).
$$
The density certificate therefore gives
$$
N_\epsilon
=\frac{\chi}{\eta\delta^2}\mathcal A_\epsilon
+o_{\delta/\epsilon}\left(\frac{\mathcal A_\epsilon}{\delta^2}\right).
$$

**Step 2 (Encoding capacity).** The total boundary budget is
$$
C_{\mathrm{total}}
=N_\epsilon C_{\max}
=\frac{\chi C_{\max}}{\eta\delta^2}\mathcal A_\epsilon
+o_{\delta/\epsilon}\left(\frac{\mathcal A_\epsilon}{\delta^2}\right).
$$
On the reset-support saturation branch $C_{\max}=2\ln2$, and on the Appendix-Q packing branch $\delta^2=8\ln2\,L_P^2$. If the separate density factors satisfy $\chi=\eta=1$, then
$$
C_{\mathrm{total}}
=\frac{\mathcal A_\epsilon}{4L_P^2}
+o_{\delta/\epsilon}\left(\frac{\mathcal A_\epsilon}{L_P^2}\right).
$$
The saturated area-law budget is $S_{\max}=\mathcal A_\epsilon/(4L_P^2)$, so the two quantities agree to leading order in the declared scale regime. This proves capacity compatibility. Exact reconstruction further requires the compatible encoding/recovery branch recorded in Definition E.8.1b and Theorem E.8.1c.

**Step 3 (Nested reconstruction branch).** For a larger region $A$, decompose into nested shells:
$$
A=\bigcup_{n=0}^{\lfloor R/\epsilon\rfloor}\mathrm{Shell}_n,
$$
where $\mathrm{Shell}_n$ is the annulus between radii $n\epsilon$ and $(n+1)\epsilon$.

Capacity compatibility on each shell is necessary for a nested reconstruction. If, in addition, the branch supplies compatible shell encodings $\Phi_n$ and recovery maps $\mathcal R_n$ satisfying the finite Petz-sufficiency condition of Definition E.8.1b on overlaps, then Theorem E.8.1c reconstructs each shell's retained response ledger from its boundary ledger. Iterating the compatible maps reconstructs the retained bulk response quotient. Without this encoding/recovery certificate, capacity counting alone does not assert existence of a canonical reconstruction map.

**Step 4 (Independence from global geometry).** The capacity gate uses only local properties:
- local channel density $\sigma_{\mathrm{eff}}$ from the density-certificate branch of Theorem E.3;
- local finite capacity $C_{\max}$ from Proposition E.2a, with refresh-branch strict capacity available from Theorem E.2 when strict contraction is needed;
- local entropy density from the area law (Theorem 49).

No global geometric assumptions such as asymptotic flatness, negative cosmological constant, or conformal boundary enter the capacity gate. Exact reconstruction additionally requires the compatible nested encoding/recovery certificate stated above. ∎

*Remark: Distinction from AdS/CFT.* The holography established here differs fundamentally from AdS/CFT correspondence [Maldacena 1999]. AdS/CFT posits a duality between quantum gravity in anti-de Sitter space and conformal field theory on its boundary, with bulk reconstruction proceeding via the Ryu-Takayanagi formula [Ryu & Takayanagi 2006] and entanglement wedge reconstruction [Dong et al. 2016]. The present construction requires neither AdS geometry nor conformal field theory; it follows solely from ND-RID channel capacity limits and geometric regularity. The two approaches may be complementary descriptions in contexts where both apply.

**Corollary E.8.1 (Emergent Finite-Response Holography).** Holography is not an additional principle but a branch consequence of the derivation chain:
$$
\text{ND-RID channels}
+
\text{geometric regularity}
+
\text{finite capacity}
\Rightarrow
\text{area-law boundary budget}
\Rightarrow
\text{boundary reconstruction on Petz-sufficient nested encoding branches}.
$$

The retained bulk response quotient contains no independent exterior-measurable information beyond what is encoded in the boundary response presheaves on the reconstruction branch. Volume remains an emergent nested-boundary description at finite operational resolution; labels that change no retained boundary or exterior protocol response are response-null surplus by PPI/PCE.

**Corollary E.8.1a (Boundary Response-Quotient Holography).** Let $A$ satisfy the capacity hypotheses of Theorem E.8.2 and assume, in addition, a compatible family of nested boundary encodings and recovery maps satisfying Definition E.8.1b on every overlap. Let $\rho,\rho'$ be two states in the recovered code family whose boundary protocol-response presheaves satisfy
$$
\mathcal R_{\partial A}(\rho)\simeq\mathcal R_{\partial A}(\rho').
\tag{E.8.1a.1}
$$
Then $\rho$ and $\rho'$ are operationally identical for all retained exterior observables on this reconstruction branch.

*Proof.* The additional hypothesis supplies the nested recovery family required by the converse clause of Theorem E.8.2. Hence every retained exterior response in the recovered code is represented by a finite boundary protocol or a finite compatible composition over nested cuts. Equation (E.8.1a.1) makes all such response statistics equal. The operational Yoneda reconstruction of Theorem P.6.1b.3 therefore identifies the two states in the retained exterior response quotient. $\square$

**Theorem E.8.1g (Predictive Screen Representability).** Fix a region $R$ and a finite budget $B$. Let $\operatorname{Ext}_{R,B}$ be the exterior-response functor assigning to every retained exterior protocol its finite response distribution. A predictive screen for $R$ is a finite boundary response object $\Sigma_R$ with response presheaf $R_{\Sigma_R}$ and boundary update channel $\Lambda_{\partial R}$ such that
$$
\operatorname{Ext}_{R,B}
=
\Lambda_{\partial R}\circ R_{\Sigma_R}
\tag{E.8.1g.1}
$$
as finite response functors. It is PCE-minimal when no proper response quotient of $\Sigma_R$ has the same exterior-response functor.

Assume a family-wide boundary-sufficiency certificate: there is one finite boundary object $\Sigma_R$ and one retained channel $\Lambda_{\partial R}$ such that (E.8.1g.1) holds for every code state and every retained exterior protocol. In the quantum branch, this may be certified by a single CPTP recovery/factorization map valid on the convex hull of the code family; in the classical branch, by one sufficient statistic for the full retained experiment. A statewise condition
$$
I(R:\operatorname{ext}\mid\partial R)=0
\tag{E.8.1g.2}
$$
is sufficient only when its Markov recovery maps agree on the whole tested family.

Under the family-wide certificate, a PCE-minimal predictive screen exists and is unique up to PPI equivalence. Every retained exterior observable factors through it, and two interiors with naturally isomorphic screens are indistinguishable by all retained exterior protocols. If the same screen also satisfies the local KMS and min-cut hypotheses used in Theorem 12.1, its entropy supplies that theorem's boundary input.

*Proof.* The common sufficiency map gives the factorization (E.8.1g.1) simultaneously for the entire finite response experiment. Because the response quotient is finite, its sufficient quotients contain a minimal element. The Blackwell/PCE compression rule of Appendix M.6.11 identifies any two minimal representatives of the same full experiment up to response equivalence, and operational Yoneda identifies response-equivalent representatives up to PPI equivalence. The KMS/min-cut conclusion invokes its separate stated hypotheses and does not follow from a statewise Markov identity alone. $\square$

**Remark E.8.1a.1 (Status Relative to AdS/CFT).** Corollary E.8.1a is a finite-response holography statement, not a claim of conformal duality or AdS boundary dynamics. It establishes operational reconstruction in the PU quotient wherever the nested ND-RID boundary-channel hypotheses hold. The stronger Page-curve entropy statement remains branch-gated until the horizon code supplies a trace-coupled entropy-continuity promotion certificate in the sense of Definition K.3d.4c. Definition K.3d.4a and Theorem K.3d.4b provide the finite Golay-expander route for supplying moment-design control on a horizon syndrome branch; by itself that route gives moment/purity control unless the trace-coupled promotion is also certified.

The relative determinant route is kept separate from entropy monotonicity. A Page-curve, P-GSL, or area-law certificate can constrain allowed signs and flows, but it does not by itself supply the four-dimensional determinant-class, zero-mode, or anomaly data required by $\mathfrak GY_U^{(4)}$.

**Definition E.8.1b (Petz-Sufficient Boundary Compression).** Let $\mathcal C_A$ be a finite retained bulk code family for a region $A$, let
$$
\mathcal E_{\partial A}:\mathcal B(\mathcal H_{\mathrm{code}})\to\mathcal B(\mathcal H_{\partial A})
$$
be the finite boundary compression channel, and let $\sigma$ be a full-rank reference state on $\mathcal H_{\mathrm{code}}$. The branch is Petz-sufficient on $\mathcal C_A$ when the Petz recovery map
$$
\mathcal R_{\sigma,\mathcal E_{\partial A}}(X)
=
\sigma^{1/2}
\mathcal E_{\partial A}^{*}
\left[
\mathcal E_{\partial A}(\sigma)^{-1/2}
X
\mathcal E_{\partial A}(\sigma)^{-1/2}
\right]
\sigma^{1/2}
\tag{E.8.1b.1}
$$
is well-defined on the support of $\mathcal E_{\partial A}(\sigma)$ and satisfies
$$
\mathcal R_{\sigma,\mathcal E_{\partial A}}
\mathcal E_{\partial A}(\rho)
=
\rho
\tag{E.8.1b.2}
$$
for every $\rho$ in the convex hull of $\mathcal C_A$.

**Theorem E.8.1c (Petz-Sufficiency Holography).** On a Petz-sufficient finite boundary-compression branch, every retained bulk protocol response on $\mathcal C_A$ is reconstructible from boundary protocol responses. Equivalently, two code states with the same boundary response presheaf are identical in the retained bulk response quotient.

*Proof.* Let $O$ be any retained bulk effect or observable on the code. Define the boundary representative
$$
O_{\partial A}
=
\mathcal R_{\sigma,\mathcal E_{\partial A}}^{*}(O).
\tag{E.8.1c.1}
$$
For any $\rho\in\operatorname{conv}(\mathcal C_A)$,
$$
\operatorname{Tr}(O\rho)
=
\operatorname{Tr}\left(O\,\mathcal R_{\sigma,\mathcal E_{\partial A}}\mathcal E_{\partial A}(\rho)\right)
$$
by (E.8.1b.2). By the definition of the adjoint channel,
$$
\operatorname{Tr}\left(O\,\mathcal R_{\sigma,\mathcal E_{\partial A}}\mathcal E_{\partial A}(\rho)\right)
=
\operatorname{Tr}\left(\mathcal R_{\sigma,\mathcal E_{\partial A}}^{*}(O)\,\mathcal E_{\partial A}(\rho)\right)
=
\operatorname{Tr}\left(O_{\partial A}\,\mathcal E_{\partial A}(\rho)\right).
$$
Thus every retained bulk response equals a boundary response.

If $\rho$ and $\rho'$ have naturally isomorphic boundary response presheaves, then for every retained boundary representative $O_{\partial A}$,
$$
\operatorname{Tr}\left(O_{\partial A}\mathcal E_{\partial A}(\rho)\right)
=
\operatorname{Tr}\left(O_{\partial A}\mathcal E_{\partial A}(\rho')\right).
$$
By the equality just proved, every retained bulk protocol has the same response on $\rho$ and $\rho'$. The operational Yoneda reconstruction of Theorem P.6.1b.3 therefore identifies the two states in the retained bulk response quotient. ∎

**Corollary E.8.1d (Zero Data-Processing Loss on a Petz-Sufficient Branch).** If the branch is Petz-sufficient for $\rho$ and the reference state $\sigma$, then
$$
D(\rho\Vert\sigma)
=
D(\mathcal E_{\partial A}(\rho)\Vert\mathcal E_{\partial A}(\sigma)).
\tag{E.8.1d.1}
$$

*Proof.* Monotonicity of relative entropy under $\mathcal E_{\partial A}$ gives
$$
D(\rho\Vert\sigma)
\ge
D(\mathcal E_{\partial A}(\rho)\Vert\mathcal E_{\partial A}(\sigma)).
$$
Monotonicity under $\mathcal R_{\sigma,\mathcal E_{\partial A}}$ gives
$$
D(\mathcal E_{\partial A}(\rho)\Vert\mathcal E_{\partial A}(\sigma))
\ge
D(\mathcal R_{\sigma,\mathcal E_{\partial A}}\mathcal E_{\partial A}(\rho)\Vert
\mathcal R_{\sigma,\mathcal E_{\partial A}}\mathcal E_{\partial A}(\sigma)).
$$
Using (E.8.1b.2) for $\rho$ and the Petz recovery identity for $\sigma$, the right side is $D(\rho\Vert\sigma)$. The two inequalities therefore squeeze the middle term to equality. ∎

**Definition E.8.1e (Predictive Recoverability Slack).** Let $\Phi:\mathcal B(\mathcal H_A)\to\mathcal B(\mathcal H_B)$ be a finite-dimensional CPTP channel and let $\sigma\succ0$ be a faithful reference state. For every state $\rho$ with $\operatorname{supp}\rho\subseteq\operatorname{supp}\sigma$, define the predictive recoverability slack
$$
\Delta_\Phi^\sigma(\rho)
:=
D(\rho\Vert\sigma)
-
D(\Phi(\rho)\Vert\Phi(\sigma)).
\tag{E.8.1e.1}
$$
If the support condition for either relative entropy fails, the corresponding term is understood in the standard extended sense. A branch is zero-slack for $(\rho,\sigma,\Phi)$ when
$$
\Delta_\Phi^\sigma(\rho)=0.
\tag{E.8.1e.2}
$$

**Theorem E.8.1f (Zero Slack iff Exact Predictive Recovery).** On the finite faithful branch of Definition E.8.1e,
$$
\Delta_\Phi^\sigma(\rho)\ge0.
\tag{E.8.1f.1}
$$
Moreover,
$$
\Delta_\Phi^\sigma(\rho)=0
\tag{E.8.1f.2}
$$
if and only if the Petz recovery map
$$
\mathcal R_{\sigma,\Phi}(X)
=
\sigma^{1/2}
\Phi^*
\left[
\Phi(\sigma)^{-1/2}
X
\Phi(\sigma)^{-1/2}
\right]
\sigma^{1/2}
\tag{E.8.1f.3}
$$
is well-defined on $\operatorname{supp}\Phi(\sigma)$ and satisfies
$$
\mathcal R_{\sigma,\Phi}\Phi(\rho)=\rho,
\qquad
\mathcal R_{\sigma,\Phi}\Phi(\sigma)=\sigma.
\tag{E.8.1f.4}
$$
Thus positive $\Delta_\Phi^\sigma(\rho)$ is exactly the finite amount of predictive distinguishability lost by the channel that is not recoverable from the retained response algebra. A PCE branch may impose exact reversible channel-capacity thermodynamics only on the zero-slack subbranch; any retained positive slack must remain as an explicit non-equilibrium response term.

*Proof.* Inequality (E.8.1f.1) is monotonicity of quantum relative entropy under the CPTP channel $\Phi$. If (E.8.1f.4) holds, then monotonicity under $\mathcal R_{\sigma,\Phi}$ gives
$$
D(\Phi(\rho)\Vert\Phi(\sigma))
\ge
D(\mathcal R_{\sigma,\Phi}\Phi(\rho)\Vert\mathcal R_{\sigma,\Phi}\Phi(\sigma))
=
D(\rho\Vert\sigma).
$$
Together with monotonicity under $\Phi$, this forces equality and hence (E.8.1f.2).

Conversely, assume (E.8.1f.2). Petz's equality theorem for monotonicity of relative entropy (D. Petz, “Sufficient subalgebras and the relative entropy of states of a von Neumann algebra,” *Communications in Mathematical Physics* **105** (1986), 123--131) states that, for a CPTP map $\Phi$ and density operators $\rho,\sigma$ with finite relative entropy, equality
$$
D(\rho\Vert\sigma)=D(\Phi(\rho)\Vert\Phi(\sigma))
$$
holds if and only if the Petz map associated with $(\sigma,\Phi)$ recovers both $\rho$ and $\sigma$. Here the algebras are finite dimensional, $\Phi$ is CPTP by Definition E.8.1e, $\sigma\succ0$, and $\operatorname{supp}\rho\subseteq\operatorname{supp}\sigma$, so both input relative entropies are finite. The inverse of $\Phi(\sigma)$ in (E.8.1f.3) is taken on its support, exactly as required by the theorem. Therefore Petz's theorem applies and gives (E.8.1f.4). $\square$

**Theorem E.8.1h (Budget Pushforward-Pullback and Recoverability Equality).** Let $B_1$ be a finer finite predictive budget than $B_2$, and let
$$
C_{21}:K_{B_1}(S)\longrightarrow K_{B_2}(S)
\tag{E.8.1h.1}
$$
be the finite-response coarse-graining map. Pullback of affine observables is
$$
C_{21}^{\sharp}:\operatorname{Aff}(K_{B_2}(S))\longrightarrow\operatorname{Aff}(K_{B_1}(S)),
\qquad
C_{21}^{\sharp}O:=O\circ C_{21}.
\tag{E.8.1h.2}
$$
Then for every retained affine observable $O$ and every $q\in K_{B_1}(S)$,
$$
O(C_{21}q)
=
(C_{21}^{\sharp}O)(q).
\tag{E.8.1h.3}
$$
Consequently, every distinguishability functional in the ledger that is known to obey data processing under the corresponding stochastic or CPTP coarse-graining is monotone under loss of budget resolution.

For a tested family $\mathcal T\subseteq K_{B_1}(S)$, suppose there is a retained recovery channel
$$
R_{12}:K_{B_2}(S)\longrightarrow K_{B_1}(S)
\tag{E.8.1h.4}
$$
such that
$$
R_{12}C_{21}q\sim_{\mathrm{PPI}}q
\qquad
\text{for all }q\in\mathcal T.
\tag{E.8.1h.5}
$$
Then every PPI-invariant distinguishability functional that obeys data processing has equality on the tested family. The converse holds only when a specified equality theorem supplies recovery: for finite faithful quantum relative entropy this is Petz sufficiency as in Theorem E.8.1f, while the classical Blackwell statement requires equality of the full retained decision experiment rather than equality of one unspecified functional.

*Proof.* Equation (E.8.1h.3) is the definition of pullback. Let $D$ be a PPI-invariant functional satisfying data processing. Applying data processing to $C_{21}$ gives
$$
D(C_{21}q,C_{21}q')\le D(q,q'),
$$
and applying it to $R_{12}$ and using (E.8.1h.5) gives
$$
D(q,q')
=D(R_{12}C_{21}q,R_{12}C_{21}q')
\le D(C_{21}q,C_{21}q').
$$
Thus equality holds. A converse is asserted only on the Petz or Blackwell branch whose separate hypotheses imply a recovery map. $\square$

**Corollary E.8.2 (Conditional Resolution Limit).** Assume the Appendix-Q packing and reset-support saturation branch and the following local-addressability certificate: spatial alternatives contained in one $\delta$-cell can be separated only by the independently addressable boundary channels incident on that cell, and neither repeated uses nor collective nonlocal encodings create additional spatial labels below that cell scale. Then the reconstruction resolution is of order $\delta=\sqrt{8\ln2}\,L_P$.

*Proof.* By the local-addressability certificate, a retained spatial distinction must occupy a distinct addressable cell or a distinct response label among the channels assigned to that cell. The packing branch places cell centers at spacing $\delta$, and the reset-support branch bounds each completed minimal channel by $2\ln2$ nats. Hence no additional independently addressable spatial cell exists below scale $\delta$. The conclusion is conditional on the certificate; channel capacity and spacing alone do not exclude sub-cell parameter estimation or nonlocal superresolution. $\square$

## E.8.3 Holographic Saturation as PCE Attractor

### E.8.3.1 Introduction

The preceding sections establish $S\leq\mathcal A/(4G)$ on the geometric-regularity, density-certificate, reset-support, and calibration branches of Theorem 49. Proposition E.2a supplies the residual channel budget on its completed binary reset-support branch, while Theorem E.2 supplies strict contractivity on its refresh/minorization branch. This section introduces an additional phenomenological utilization model. Under a registered positive idle-maintenance cost, additive channel accounting, a nondecreasing benefit function, and projected deterministic gradient dynamics, Theorem E.8.3.4 proves that the scalar utilization coordinate reaches $S_{max}=\mathcal A/(4G)$ in finite time. The theorem makes no point-convergence claim for nonzero stochastic forcing and does not prove capacity-achieving channel codes.

The logical statuses are:

| Item | Result | Status |
|------|--------|--------|
| Theorem 31 | $\varepsilon_{\mathrm{reset}}\geq H_q(P\mid R)$ on a registered reset branch; a positive floor requires $H_q(P\mid R)\geq h_{\min}>0$ | Conditional bound |
| Proposition E.2a | $C_{\max}\leq\ln d_0-\ln2$ on the completed binary reset-support branch | Conditional capacity bound |
| Theorem E.2 | $C_{\max}<\ln d_0$ on the refresh/minorization branch | Conditional strict capacity bound |
| Theorem E.6 / Theorem 49 | $S\leq\mathcal A/(4G)$ on the density-certificate and calibration branch | Conditional area bound |
| **Theorem E.8.3.4** | $S(t)$ reaches $S_{max}$ under the projected deterministic additive-utilization model | **Conditional model theorem** |

### E.8.3.2 Bulk vs. Boundary Information Storage

Consider a spatial region $\mathcal{R}$ with boundary $\partial\mathcal{R}$ of area $\mathcal{A}$, containing a configuration of MPUs storing total accessible information $I_{tot}$. The information may be encoded in two qualitatively distinct ways:

**Definition E.8.3.1 (Encoding Modes).**
- **Bulk encoding:** Information distributed throughout the interior of $\mathcal{R}$, scaling with volume $\mathcal{V}$.
- **Boundary encoding:** Information localized to degrees of freedom at or near $\partial\mathcal{R}$, scaling with area $\mathcal{A}$.

We analyze the PCE cost of each encoding mode for fixed total information $I_{tot}$.

### E.8.3.3 Derivation of the Retrieval Cost Coefficient from PCE Potential

Before analyzing bulk versus boundary encoding costs, we derive the retrieval cost coefficient $\gamma_{ret}$ from the fundamental PCE potential structure (Definition D.1).

**Lemma E.8.3.1 (Serialized-Reset Retrieval-Cost Bound).**
Assume a retrieval protocol with the following properties: (i) carrying one retained nat from depth $r$ uses at least $n\ge r/\delta$ sequential links; (ii) every used link performs a distinct completed registered reset with $H_q(P\mid R)\ge h_{\min}>0$; (iii) reset work is neither reused nor amortized across links; and (iv) each completed link carries at most $C_{\max}>0$ retained nats. Then the entropy cost per retained nat obeys
$$
\Delta S_{\mathrm{retrieval}}(r)
\ge \frac{r}{\delta}\frac{h_{\min}}{C_{\max}},
$$
and the corresponding lower-bound coefficient is
$$
\gamma_{ret}^{\min}:=\frac{h_{\min}}{\delta C_{\max}}.
\tag{E.8.3a}
$$

*Proof.* The registered-reset theorem gives an entropy cost at least $H_q(P\mid R)\ge h_{\min}$ for each reset. A link carrying no more than $C_{\max}$ retained nats therefore costs at least $h_{\min}/C_{\max}$ per retained nat. By hypotheses (i)--(iii), the costs of the $n$ sequential links add, and hence
$$
\Delta S_{\mathrm{retrieval}}(r)
\ge n\frac{h_{\min}}{C_{\max}}
\ge\frac r\delta\frac{h_{\min}}{C_{\max}}.
\tag{E.8.3b}
$$
Dividing by $r$ gives (E.8.3a). Since entropy is dimensionless in natural units, $\gamma_{ret}^{\min}$ has dimension $[\mathrm{length}]^{-1}$. Reversible transmission, protocols without a registered reset on every link, and protocols with amortized resets are outside the hypotheses. $\square$

**Corollary E.8.3.1 (Conditional Numerical Lower Bound).**
If, in addition, $h_{\min}=\ln2$, $C_{\max}=2\ln2$, and $\delta=\sqrt{8\ln2}\,L_P$, then
$$
\gamma_{ret}^{\min}
=\frac{\ln2}{\sqrt{8\ln2}\,L_P\,2\ln2}
=\frac{1}{2\sqrt{8\ln2}\,L_P}
\approx\frac{0.2123}{L_P}.
$$

### E.8.3.4 PCE Cost of Bulk Encoding

**Theorem E.8.3.1 (Conditional Excess Cost of Serial Bulk Retrieval).**
Fix the same accessible information content $I_{tot}>0$ for two encodings in a region of linear size $L$. Assume the serialized-reset hypotheses of Lemma E.8.3.1, no cache or alternative local query path, and the linear access-cost model
$$
V_{op}(\bar r)=V_{op}^{(0)}+\gamma_{ret}^{\min}I_{tot}\bar r,
\qquad
\gamma_{ret}^{\min}=\frac{h_{\min}}{\delta C_{\max}}.
\tag{E.8.3d}
$$
Assume that the bulk encoding has mean retrieval depth $\bar r_{bulk}\ge c_1L$ and the boundary encoding has mean retrieval depth $\bar r_{boundary}\le c_0\delta$, where $c_0,c_1>0$. If $c_1L>c_0\delta$, the model assigns the bulk encoding the larger access cost.

*Proof.* Per retained nat, the two modeled access costs satisfy
$$
\langle\Delta S_{access}\rangle_{bulk}
=\gamma_{ret}^{\min}\bar r_{bulk}
\ge\gamma_{ret}^{\min}c_1L,
\tag{E.8.3e}
$$
and
$$
\langle\Delta S_{access}\rangle_{boundary}
=\gamma_{ret}^{\min}\bar r_{boundary}
\le\gamma_{ret}^{\min}c_0\delta.
\tag{E.8.3f}
$$
At the same $I_{tot}$, the corresponding operational costs are
$$
V_{op}^{(bulk)}
=V_{op}^{(0)}+\gamma_{ret}^{\min}I_{tot}\bar r_{bulk},
\tag{E.8.3h}
$$
$$
V_{op}^{(boundary)}
=V_{op}^{(0)}+\gamma_{ret}^{\min}I_{tot}\bar r_{boundary}.
\tag{E.8.3i}
$$
Their difference obeys
$$
\Delta V_{op}
=\gamma_{ret}^{\min}I_{tot}(\bar r_{bulk}-\bar r_{boundary})
\ge\gamma_{ret}^{\min}I_{tot}(c_1L-c_0\delta)>0.
\tag{E.8.3j}
$$
Thus this serial-access model produces an $\Omega(L/\delta)$ per-nat bulk-to-boundary ratio when both depth estimates are sharp. A comparison that changes the two information contents from area scaling to volume scaling is not a comparison at the stipulated $I_{tot}$. $\square$

### E.8.3.5 PCE Selection of Boundary Encoding

**Theorem E.8.3.2 (Boundary Minimum in the Linear Serial-Access Model).**
Assume the serial-access hypotheses and linear cost model of Theorem E.8.3.1. Let $\phi\in[0,1]$ be the boundary-encoded fraction of the same information content $I_{tot}$, and assume the two fractions contribute additively with mean depths $L$ and $c_0\delta$. Then
$$
V(\phi)
=V^{(0)}+(1-\phi)I_{tot}\gamma_{ret}^{\min}L
+\phi I_{tot}\gamma_{ret}^{\min}c_0\delta.
\tag{E.8.3k}
$$
If $L>c_0\delta$, this model has its unique minimum at $\phi=1$.

*Proof.* Differentiation gives
$$
\frac{\partial V}{\partial\phi}
=I_{tot}\gamma_{ret}^{\min}(c_0\delta-L)<0.
\tag{E.8.3l}
$$
Therefore $V$ is strictly decreasing on $[0,1]$ and
$$
\operatorname*{argmin}_{\phi\in[0,1]}V(\phi)=\{1\}.
\tag{E.8.3m}
$$
The conclusion applies only to the declared additive serial-access model. $\square$

### E.8.3.6 Derivation of Idle Channel Cost Structure

Before proving saturation is an attractor, we must derive the cost structure for channels that are present but not utilized.

**Lemma E.8.3.2 (Idle-Maintenance Cost on a Registered-Reset Branch).**
Choose an operational cost interval. Suppose that keeping one idle boundary channel available during that interval requires a registered number $\kappa_{maint}\in\mathbb N$ with $\kappa_{maint}\ge1$ of completed logically irreversible resets, every such reset obeys
$$
H_{q_j}(P_j\mid R_j)\ge h_{\min}>0,
$$
and the reset costs add. If $\Phi_{idle}$ denotes the registered reset-entropy cost for one maintained idle channel, then
$$
\Phi_{idle}\ge\kappa_{maint}h_{\min}>0.
\tag{E.8.3n}
$$
Equality holds on the subbranch where every reset saturates the conditional-entropy floor and no additional maintenance cost is included.

*Proof.* Theorem 31 gives $\varepsilon_{\mathrm{reset},j}\ge H_{q_j}(P_j\mid R_j)\ge h_{\min}$ for each registered reset. Additivity over the $\kappa_{maint}$ reset events gives
$$
\Phi_{idle}
=\sum_{j=1}^{\kappa_{maint}}\varepsilon_{\mathrm{reset},j}
\ge\kappa_{maint}h_{\min}>0.
$$
If every inequality is saturated and there is no other maintenance contribution, equality follows. ∎

**Corollary E.8.3.2 (Total Idle-Channel Cost on the Maintenance Branch).**
For $N_{idle}$ idle channels satisfying Lemma E.8.3.2, channel additivity gives
$$
V_{prop}^{(idle)}
=N_{idle}\Phi_{idle}
\ge N_{idle}\kappa_{maint}h_{\min}.
\tag{E.8.3o}
$$
The equality in (E.8.3o) holds on the floor-saturating subbranch of the lemma.

*Proof.* Sum the one-channel inequality over the $N_{idle}$ registered channels. ∎

### E.8.3.7 Construction of the PCE Potential as Function of Boundary Entropy

We now construct the explicit form of the PCE potential $V(S)$ as a function of boundary entropy $S$, enabling rigorous verification of attractor conditions.

**Hypothesis E.8.3.3 (Additive Utilization-Potential Branch).**
Assume the density, capacity-saturation, and calibration branch on which
$$
S_{max}=N_{eff}C_{\max}=\frac{\mathcal A}{4G}.
$$
For a coarse-grained utilization variable $S\in[0,S_{max}]$, assume:

1. active channel contributions are additive and saturated, so
$$
N_{active}(S)=\frac{S}{C_{\max}},
\qquad
N_{idle}(S)=N_{eff}-\frac{S}{C_{\max}};
$$
2. $\Phi_{idle}>0$ is an incremental opportunity cost for an unused channel, distinct from the active-channel maintenance already included in $V_0$;
3. $B:[0,1]\to\mathbb R_{\geq0}$ is a declared differentiable utilization-benefit function with $B(0)=0$.

**Theorem E.8.3.3 (PCE Potential on the Additive Utilization Branch).**
Under Hypothesis E.8.3.3, define
$$
V(S)
=V_0+\Phi_{idle}\left(N_{eff}-\frac{S}{C_{\max}}\right)
-\Gamma_0B\left(\frac{S}{S_{max}}\right).
\tag{E.8.3p}
$$
For the linear choice $B(u)=B_0u$, this becomes
$$
V(S)
=V_0+\Phi_{idle}\left(N_{eff}-\frac{S}{C_{\max}}\right)
-\Gamma_0B_0\frac{S}{S_{max}}.
\tag{E.8.3q}
$$
The corresponding benefit term is
$$
V_{benefit}(S)=\Gamma_0B_0\frac{S}{S_{max}}.
\tag{E.8.3r}
$$

*Proof.* Hypothesis 1 gives the idle-channel count. Hypothesis 2 assigns it the incremental cost $\Phi_{idle}N_{idle}(S)$ without counting active maintenance a second time. Hypothesis 3 assigns benefit $\Gamma_0B(S/S_{max})$, which enters the PCE potential with a minus sign. Their sum with $V_0$ is (E.8.3p); substituting $B(u)=B_0u$ gives (E.8.3q)--(E.8.3r). ∎

This theorem defines a phenomenological potential. The finite-time saturation conclusion of Theorem E.8.3.4 additionally requires $C_{\max}>0$, $B\in C^1([0,1])$ with $B'(u)\geq0$, and the projected deterministic gradient equation. Neither theorem supplies point convergence under nonzero stochastic forcing or a capacity-achieving channel code.

### E.8.3.8 Saturation of the Holographic Bound as PCE Attractor

**Theorem E.8.3.4 (Deterministic Saturation on the Additive Utilization Branch).**
Assume Hypothesis E.8.3.3, $\Phi_{idle}>0$, $C_{\max}>0$, $\Gamma_0\ge0$, and $B\in C^1([0,1])$ with $B'(u)\ge0$. Let $S$ obey the projected deterministic gradient equation on $[0,S_{max}]$,
$$
\dot S
=\Pi_{T_{[0,S_{max}]}(S)}\bigl(-\eta_SV'(S)\bigr),
\qquad \eta_S>0,
\tag{E.8.3s}
$$
where $T_{[0,S_{max}]}(S)$ is the tangent cone. Then $S_{max}$ is the unique global minimizer of $V$, every solution with $S(0)\in[0,S_{max}]$ reaches $S_{max}$ in finite time and remains there, and
$$
t_{sat}
\le\frac{(S_{max}-S(0))C_{\max}}{\eta_S\Phi_{idle}}.
\tag{E.8.3t}
$$

*Proof.* Put $u=S/S_{max}$. Differentiating (E.8.3p) gives
$$
V'(S)
=-\frac{\Phi_{idle}}{C_{\max}}
-\frac{\Gamma_0}{S_{max}}B'(u)
\le-\frac{\Phi_{idle}}{C_{\max}}<0.
$$
Thus $V$ is strictly decreasing on the compact interval and has the unique minimizer
$$
S^*=S_{max}=\frac{\mathcal A}{4G}.
\tag{E.8.3u}
$$
For $S<S_{max}$ the tangent cone contains the positive direction, so (E.8.3s) reduces to
$$
\dot S=-\eta_SV'(S)
\ge\eta_S\frac{\Phi_{idle}}{C_{\max}}>0.
$$
Integration until the first hitting time gives
$$
S(t)-S(0)
\ge t\eta_S\frac{\Phi_{idle}}{C_{\max}},
$$
which implies (E.8.3t). At $S=S_{max}$, the projection of the positive unconstrained velocity onto the tangent cone $(-\infty,0]$ is zero, so the solution remains at $S_{max}$.

For $B(u)=B_0u$, the derivative is constant and the hitting time is exactly
$$
t_{sat}(S_0)
=\frac{S_{max}-S_0}
{\eta_S\left(\frac{\Phi_{idle}}{C_{\max}}+\frac{\Gamma_0B_0}{S_{max}}\right)}.
\tag{E.8.3v}
$$
No convergence claim for a nonzero stochastic forcing follows from this deterministic argument. $\square$

**Corollary E.8.3.3 (Lyapunov Function for the Projected Deterministic Dynamics).**
The function $\mathcal L(S)=S_{max}-S$ is nonnegative and vanishes only at $S_{max}$. For $S<S_{max}$,
$$
\dot{\mathcal L}(S)
=-\dot S
=\eta_SV'(S)
\le-\eta_S\frac{\Phi_{idle}}{C_{\max}}<0,
$$
and at $S_{max}$ it remains zero. Hence it is a strict Lyapunov function for (E.8.3s). $\square$

### E.8.3.9 Physical Interpretation

**Corollary E.8.3.4 (Economic Interpretation on the Additive Serial-Maintenance Branch).**
Assume the serial-access model of Theorem E.8.3.1, the registered idle-maintenance hypothesis E.8.3.2, the additive utilization hypothesis E.8.3.3, and the deterministic projected dynamics of Theorem E.8.3.4. On this branch, boundary encoding minimizes the declared serial retrieval term, unused channels carry the declared incremental opportunity cost, and increasing utilization increases the declared benefit function. The endpoint $S=S_{max}$ is therefore the minimum of this phenomenological potential. These hypotheses do not derive an area bound for implementations outside the branch.

**Corollary E.8.3.5 (Conditional Interpretation of Saturated Boundary Utilization).**
On the additive utilization branch of Hypothesis E.8.3.3 and under the projected deterministic dynamics of Theorem E.8.3.4, the boundary-utilization coordinate reaches $S_{max}=\mathcal A/(4G)$. If a black-hole horizon is independently identified with a state on this branch, its saturated entropy is compatible with the Bekenstein--Hawking value.

*Proof.* Theorem E.8.3.4 supplies the endpoint $S=S_{max}$ for the stipulated scalar dynamics. Substitution of the calibrated value $S_{max}=\mathcal A/(4G)$ gives the stated compatibility. The theorem contains no evolution equation for matter or geometry, so it does not imply gravitational collapse or uniqueness of a black-hole state. $\square$

### E.8.3.10 Implications for Emergent Gravity

Theorem E.8.3.4 supplies a conditional deterministic saturation mechanism for the utilization variable. Applying it to the local Rindler horizons used in Section 12 requires an additional bridge showing that each such horizon carries the additive utilization potential and projected dynamics of Hypothesis E.8.3.3. Without that bridge, local equilibrium saturation remains a hypothesis of the Clausius-to-field-equation argument rather than a consequence of Appendix E.


### E.8.4 Max-Flow/Min-Cut Form of PU Holography and Shared Reconstruction

**Definition E.8.4a (Finite Predictive Channel Network).** Let $\mathcal N_A=(V,E)$ be a finite directed MPU channel network associated with a region $A$, with source set $S\subset V$, sink set $T\subset V$, and edge capacities
$$
C_e\ge0
$$
measured in nats per admissible channel use. For a cut $\Gamma\subset E$ separating $S$ from $T$, define
$$
C(\Gamma)=\sum_{e\in\Gamma}C_e.
\tag{E.8.4.1}
$$
Define the maximal predictive through-capacity by
$$
I_{\max}(S:T)
=
\sup\{\text{reliably transmissible nats per use from }S\text{ to }T\}.
\tag{E.8.4.2}
$$

**Theorem E.8.4b (Max-Flow/Min-Cut for the Independent Classical-Pipe Branch).** Assume that every edge $e$ is an independent classical pipe of asymptotic reliable rate $C_e$, all edges may be used simultaneously, intermediate vertices may store and route classical messages without an additional rate constraint, and there are no interference, broadcast, secrecy, shared-energy, or quantum-coherence constraints. Then
$$
\boxed{
I_{\max}(S:T)
=
\min_{\Gamma:S|T}C(\Gamma)
}
\tag{E.8.4.3}
$$
where the minimum is over all cuts separating $S$ from $T$.

*Proof.* Add a supersource with edges to $S$ and a supersink with edges from $T$, each auxiliary edge having capacity larger than $\sum_{e\in E}C_e$. For any cut $\Gamma$, every routed message crosses an edge of $\Gamma$. Independence and simultaneous usability imply that at blocklength $n$ the cut carries at most $n\sum_{e\in\Gamma}C_e+o(n)$ reliable nats. Hence
$$
I_{\max}(S:T)\le\min_\Gamma C(\Gamma).
$$

The finite max-flow/min-cut theorem supplies a feasible flow $f$ of value $\min_\Gamma C(\Gamma)$. If all capacities are rational, choose a common denominator $q$. Over a block of $q$ channel uses, route $qf(e)$ message units through each edge; flow conservation pairs incoming and outgoing units at every intermediate vertex, and the edge constraints $f(e)\le C_e$ make every routing feasible. Independent pipe codes achieve every edge rate below $C_e$, so every network rate below the flow value is achievable. For real capacities, choose rational capacities $C_e^{(n)}<C_e$ converging upward to $C_e$. Their max-flow values converge to the real max-flow value because the minimum ranges over finitely many cuts. Taking the supremum of achievable rates proves the reverse inequality. $\square$

**Corollary E.8.4c (Area Law as Minimum Predictive Cut).** Suppose the PCE-attractor branch has approximately uniform boundary channel capacity $C_{\max}^{*}$ and effective channel density $\sigma_{\mathrm{eff}}$ across a smooth cut surface $\gamma$, with boundary correction $o(\mathcal A(\gamma))$. Then
$$
I_{\max}(A:A^c)
=
C_{\max}^{*}\sigma_{\mathrm{eff}}
\min_{\gamma\sim\partial A}\mathcal A(\gamma)
+
o(\mathcal A).
\tag{E.8.4.4}
$$

*Proof.* By Theorem E.8.4b, the maximal transmissible predictive information equals the minimum cut capacity. On the stated branch, a cut approximating $\gamma$ contains
$$
N_\gamma=\sigma_{\mathrm{eff}}\mathcal A(\gamma)+o(\mathcal A)
$$
effective channels, each with capacity $C_{\max}^{*}$ up to the same finite-resolution correction. Therefore
$$
C(\gamma)
=
C_{\max}^{*}\sigma_{\mathrm{eff}}\mathcal A(\gamma)+o(\mathcal A).
$$
Minimizing over cuts gives (E.8.4.4). ∎

**Definition E.8.4d (Shared Predictive Reconstruction Advantage).** Let $A$ and $B$ be two finite boundary reconstruction regions in the same predictive channel network. Let
$$
C_A=\min_{\Gamma_A}C(\Gamma_A),
\qquad
C_B=\min_{\Gamma_B}C(\Gamma_B)
$$
be the separate minimum reconstruction cuts, and let
$$
C_{A\cup B}=\min_{\Gamma_{A\cup B}}C(\Gamma_{A\cup B})
$$
be the minimum cut for reconstructing $A$ and $B$ jointly. Define the shared reconstruction advantage
$$
\Delta_{\mathrm{rec}}(A:B)
=
C_A+C_B-C_{A\cup B}.
\tag{E.8.4.5}
$$

**Theorem E.8.4e (Emergent Bridges from Shared Predictive Redundancy).** In a finite PU reconstruction network,
$$
\Delta_{\mathrm{rec}}(A:B)>0
$$
if and only if joint reconstruction of $A$ and $B$ uses strictly fewer predictive channel nats than separate reconstruction. Equivalently, the excess
$$
\Delta_{\mathrm{rec}}(A:B)
$$
is exactly the shared predictive redundancy capacity available to the joint reconstruction problem. If the regular continuum representation of the same network exists, any connected geometric bridge assigned to the pair $(A,B)$ represents this shared reconstruction redundancy; it is not an additional fundamental spacetime object.

*Proof.* The separate reconstruction cost is, by definition,
$$
C_{\mathrm{sep}}(A:B)=C_A+C_B.
$$
The joint reconstruction cost is, by definition,
$$
C_{\mathrm{joint}}(A:B)=C_{A\cup B}.
$$
Thus
$$
\Delta_{\mathrm{rec}}(A:B)
=
C_{\mathrm{sep}}(A:B)-C_{\mathrm{joint}}(A:B).
$$
Therefore $\Delta_{\mathrm{rec}}(A:B)>0$ exactly when the joint reconstruction cut has lower capacity cost than the sum of the two separate cuts. The amount saved is precisely the number of predictive nats that need not be transmitted twice because they are carried by common channels, common syndromes, or common reconstructive constraints. This is the definition of shared predictive redundancy capacity.

On the regular continuum branch, the geometric description is obtained by representing finite channel-capacity and reconstruction relations as an effective metric geometry. Since the finite theorem already identifies the invariant content as shared redundancy capacity, any connected geometric bridge in the continuum representation is a representation of that finite reconstruction relation, not an independent microscopic geometric degree of freedom. ∎

**Corollary E.8.4f (RT-Type Formula Without AdS Assumptions).** In the finite PU network, the holographic bottleneck is a minimum predictive cut. When the regular continuum limit exists, the cut functional becomes an area functional with coefficient fixed by the ND-RID channel capacity, and shared geometric connectivity is represented by joint reconstruction advantage.

*Proof.* Theorem E.8.4b is purely finite and uses only channel capacities. Corollary E.8.4c converts the finite cut count into an area functional using geometric regularity and the channel-density hypothesis. Theorem E.8.4e identifies the finite invariant underlying connected joint reconstruction. No AdS asymptotics, fundamental metric path integral, or gravitational Hilbert-space factorization enters the argument. ∎

**Corollary E.8.4g (Local Horizon Entropy as Predictive Min-Cut).** Let $B$ be a sufficiently small causal diamond on the regular operational-continuum branch, and let $\Gamma_B$ range over finite predictive cuts separating the operational interior of $B$ from its exterior boundary data. On the local horizon-saturation branch, with uniform channel capacity $C_{\max}^{*}$ and effective channel density $\sigma_{\mathrm{eff}}$, the horizon entropy is the minimum predictive cut:
$$
S_{\mathrm{cut}}(B)
:=
\min_{\Gamma_B}\sum_{e\in\Gamma_B}C_e
=
C_{\max}^{*}\sigma_{\mathrm{eff}}\mathcal A(\partial B)
+
o(\mathcal A)
=
\frac{\mathcal A(\partial B)}{4G}
+
o(\mathcal A).
\tag{E.8.4.6}
$$
For a one-parameter local Rindler perturbation satisfying Theorem 48a, assume additionally that the same family of finite cuts has a differentiable entropy-identification remainder
$$
S(\lambda)-S_{\mathrm{cut}}(\lambda)=r(\lambda),
\qquad
r(\lambda)-r(0)=o(\lambda).
\tag{E.8.4.7a}
$$
Then
$$
S_{\mathrm{cut}}(\lambda)-S_{\mathrm{cut}}(0)
=\frac{\delta Q}{T_U}+o(\lambda),
\qquad
T_U=\frac{\kappa}{2\pi}.
\tag{E.8.4.7}
$$

*Proof.* On the independent classical-pipe and regular density branch, Theorem E.8.4b and Corollary E.8.4c give
$$
S_{\mathrm{cut}}(B)
=C_{\max}^{*}\sigma_{\mathrm{eff}}\mathcal A(\partial B)+o(\mathcal A).
$$
The calibration $C_{\max}^{*}\sigma_{\mathrm{eff}}=1/(4G)$ proves the zeroth-order area expression (E.8.4.6). Theorem 48a gives along the declared perturbation
$$
S(\lambda)-S(0)=\frac{\delta Q}{T_U}+O(\lambda^2).
$$
Subtracting (E.8.4.7a) at $\lambda$ and at $0$ yields
$$
S_{\mathrm{cut}}(\lambda)-S_{\mathrm{cut}}(0)
=\frac{\delta Q}{T_U}+O(\lambda^2)-o(\lambda)
=\frac{\delta Q}{T_U}+o(\lambda),
$$
which is (E.8.4.7). $\square$

**Definition E.8.4h (Recovery Length and Recovery Metric).** Let $\mathcal B$ be a finite set of operational reconstruction regions in a finite predictive channel network. For $A,B\in\mathcal B$, define the directed one-step recovery cut
$$
\chi(A|B)
=
\min_{\Gamma:A|B}C(\Gamma),
\tag{E.8.4.8}
$$
where the minimum ranges over finite cuts whose removal separates the predictive data required for reconstructing $A$ from the available data in $B$. Define the symmetric one-step recovery length
$$
\ell_{\mathrm{rec}}(A,B)
=
\frac12\big(\chi(A|B)+\chi(B|A)\big).
\tag{E.8.4.9}
$$
The recovery metric is the shortest-path closure
$$
d_{\mathrm{rec}}(A,B)
=
\inf_{A=A_0,\ldots,A_n=B}
\sum_{j=1}^{n}\ell_{\mathrm{rec}}(A_{j-1},A_j),
\tag{E.8.4.10}
$$
where the infimum ranges over finite chains in $\mathcal B$, including the empty chain when $A=B$.

**Theorem E.8.4i (Recovery Geometry from Predictive Channel Capacity).** For every finite predictive channel network and finite reconstruction set $\mathcal B$, $d_{\mathrm{rec}}$ is a pseudometric on $\mathcal B$. After quotienting by the zero-distance relation
$$
A\sim B
\quad\Longleftrightarrow\quad
d_{\mathrm{rec}}(A,B)=0,
$$
it becomes a genuine metric on $\mathcal B/\!\sim$. Moreover, $d_{\mathrm{rec}}$ is the greatest pseudometric bounded above by the one-step recovery lengths:
$$
d(A,B)\le\ell_{\mathrm{rec}}(A,B)\ \forall A,B
\quad\Longrightarrow\quad
d(A,B)\le d_{\mathrm{rec}}(A,B)\ \forall A,B.
$$

*Proof.* Non-negativity and symmetry follow from (E.8.4.9) and (E.8.4.10). For the triangle inequality, concatenate a chain from $A$ to $B$ with a chain from $B$ to $C$; taking infima gives
$$
d_{\mathrm{rec}}(A,C)
\le
d_{\mathrm{rec}}(A,B)+d_{\mathrm{rec}}(B,C).
$$
Thus $d_{\mathrm{rec}}$ is a pseudometric. Quotienting by zero distance is the standard metric quotient of a pseudometric space.

Let $d$ be any pseudometric satisfying $d(A,B)\le\ell_{\mathrm{rec}}(A,B)$ for all one-step pairs. For any chain $A=A_0,\ldots,A_n=B$,
$$
d(A,B)
\le
\sum_{j=1}^{n}d(A_{j-1},A_j)
\le
\sum_{j=1}^{n}\ell_{\mathrm{rec}}(A_{j-1},A_j).
$$
Taking the infimum over chains gives $d(A,B)\le d_{\mathrm{rec}}(A,B)$. ∎

**Corollary E.8.4j (Metric Limit under a No-Shortcut Certificate).** Let $r_\epsilon\downarrow0$. Assume that admissible one-step recovery pairs satisfy $d_g(p,q)\le r_\epsilon$, that every minimizing $g$-geodesic can be partitioned into admissible steps of mesh at most $r_\epsilon$, and that a function $\omega(r)\downarrow0$ gives the uniform estimate
$$
\left|\ell_{\mathrm{rec}}(A_\epsilon(p),A_\epsilon(q))-\mu d_g(p,q)\right|
\le\omega(r_\epsilon)d_g(p,q)
\tag{E.8.4.11}
$$
for all admissible pairs, with $\mu>0$. Then
$$
\frac{d_{\mathrm{rec},\epsilon}(A_\epsilon(p),A_\epsilon(q))}{\mu}
\longrightarrow d_g(p,q).
$$
On an independent classical-pipe horizon branch that also satisfies Corollary E.8.4g,
$$
S_{\mathrm{cut}}(B)
=\min_{\Gamma_B}\sum_{e\in\Gamma_B}C_e
=\frac{\mathcal A(\partial B)}{4G}+o(\mathcal A)
$$
is the corresponding minimum-cut recovery barrier.

*Proof.* For every admissible chain from $p$ to $q$, (E.8.4.11) and the triangle inequality give
$$
\sum_j\ell_{\mathrm{rec},j}
\ge(\mu-\omega(r_\epsilon))\sum_jd_g(p_{j-1},p_j)
\ge(\mu-\omega(r_\epsilon))d_g(p,q).
$$
Taking the infimum proves the lower bound. Partition a minimizing geodesic into admissible steps. Its $g$-length sum is $d_g(p,q)$, so (E.8.4.11) gives the upper bound
$$
d_{\mathrm{rec},\epsilon}(p,q)
\le(\mu+\omega(r_\epsilon))d_g(p,q).
$$
The squeeze theorem gives the metric limit. The barrier identity is Corollary E.8.4g under its separate channel and saturation hypotheses. $\square$

**Definition E.8.4k (Predictive Update-Current Entropy).** Let $\mathcal N=(V,E)$ be a finite predictive channel network with edge capacities $C_e$ as in Definition E.8.4a. Let
$$
\gamma=(t_0,t_1,\ldots,t_n)
$$
be a finite retained update path. At step $j$, let $M_j$, $\mathcal F_j$, and $(Y_{e,j})_{e\in E}$ be finite retained random variables: $M_j$ is the retained interior predictive distinction before the update, $\mathcal F_j$ is the retained history available before the channel use, and $Y_{e,j}$ is the finite response variable carried by edge $e$. For a cut $\Gamma\subset E$, write
$$
Y_{\Gamma,j}=(Y_{e,j})_{e\in\Gamma}
$$
and define the conditional update-current through $\Gamma$ at step $j$ by
$$
\mathsf J_{\Gamma,j}
:=
I(M_j;Y_{\Gamma,j}\mid\mathcal F_j).
\tag{E.8.4.12}
$$
The predictive update-current entropy of $\gamma$ through $\Gamma$ is
$$
\mathcal S_{\mathrm{upd}}(\Gamma;\gamma)
:=
\sum_{j=0}^{n-1}\mathsf J_{\Gamma,j}.
\tag{E.8.4.13}
$$
For a one-slice horizon update, write $\mathcal S_{\mathrm{upd}}(\Gamma)$ for $n=1$.

**Theorem E.8.4l (Update-Current Entropy Bound and Descent).** For every finite retained update path of Definition E.8.4k:

1. $\mathcal S_{\mathrm{upd}}(\Gamma;\gamma)\ge0$.
2. If each edge variable satisfies the retained capacity condition
$$
H(Y_{e,j}\mid\mathcal F_j)\le C_e
\quad\text{for all }e,j,
\tag{E.8.4.14}
$$
then
$$
\mathsf J_{\Gamma,j}
\le
\sum_{e\in\Gamma}C_e,
\qquad
\mathcal S_{\mathrm{upd}}(\Gamma;\gamma)
\le
\sum_{j=0}^{n-1}\sum_{e\in\Gamma}C_e.
\tag{E.8.4.15}
$$
3. If $\phi_{e,j}$ is any deterministic coarse-graining of $Y_{e,j}$ and $\phi_\Gamma(Y_{\Gamma,j})=(\phi_{e,j}(Y_{e,j}))_{e\in\Gamma}$, then
$$
I(M_j;\phi_\Gamma(Y_{\Gamma,j})\mid\mathcal F_j)
\le
I(M_j;Y_{\Gamma,j}\mid\mathcal F_j).
\tag{E.8.4.16}
$$
4. If $Z_j$ is any exterior readout whose retained dependence on $M_j$ factors through the cut variables,
$$
M_j\longrightarrow Y_{\Gamma,j}\longrightarrow Z_j
\quad\text{conditionally on }\mathcal F_j,
\tag{E.8.4.17}
$$
then
$$
I(M_j;Z_j\mid\mathcal F_j)
\le
\mathsf J_{\Gamma,j}.
\tag{E.8.4.18}
$$
5. In the stationary one-slice case, if $Y_{\Gamma,0}$ is a lossless sufficient retained state coordinate for $M_0$ over $\mathcal F_0$, meaning $H(M_0\mid Y_{\Gamma,0},\mathcal F_0)=0$, then
$$
\mathcal S_{\mathrm{upd}}(\Gamma)
=
I(M_0;Y_{\Gamma,0}\mid\mathcal F_0)
=
H(M_0\mid\mathcal F_0).
\tag{E.8.4.19}
$$
Thus predictive entropy is a functional of retained update current. Ordinary retained state entropy is recovered only on the lossless sufficient one-slice branch.

*Proof.* Conditional mutual information is nonnegative, proving (1). For (2),
$$
I(M_j;Y_{\Gamma,j}\mid\mathcal F_j)
\le
H(Y_{\Gamma,j}\mid\mathcal F_j)
\le
\sum_{e\in\Gamma}H(Y_{e,j}\mid\mathcal F_j)
\le
\sum_{e\in\Gamma}C_e,
$$
where the first inequality is the entropy upper bound on mutual information, the second is subadditivity of conditional entropy, and the third is (E.8.4.14). Summing over $j$ gives the path bound in (E.8.4.15). For (3), deterministic post-processing gives the conditional Markov chain
$$
M_j\longrightarrow Y_{\Gamma,j}\longrightarrow \phi_\Gamma(Y_{\Gamma,j})
\quad\text{given }\mathcal F_j,
$$
so conditional data processing gives (E.8.4.16). For (4), the assumed conditional Markov chain (E.8.4.17) gives (E.8.4.18) by the same conditional data-processing inequality. For (5),
$$
I(M_0;Y_{\Gamma,0}\mid\mathcal F_0)
=
H(M_0\mid\mathcal F_0)-H(M_0\mid Y_{\Gamma,0},\mathcal F_0)
=
H(M_0\mid\mathcal F_0),
$$
using lossless sufficiency. ∎

**Theorem E.8.4m (Horizon No-Surplus Theorem).** Let $B$ be a sufficiently small causal diamond on the regular operational-continuum branch. Let $\mathfrak G_B$ be the finite family of predictive cuts separating the retained operational interior of $B$ from exterior boundary data, and let $\mathfrak G_B^{\mathrm{suf}}\subseteq\mathfrak G_B$ be the nonempty subfamily of cuts through which every retained exterior task readout factors in the sense of (E.8.4.17). Let $\mathscr Z_B$ be the finite retained exterior task-readout family. Use the one-slice notation $\mathcal S_{\mathrm{upd}}(\Gamma)$ of Definition E.8.4k. On the local horizon-saturation branch of Corollary E.8.4g, write
$$
S_{\mathcal H}(B):=S_{\mathrm{cut}}(B)
=
\min_{\Gamma\in\mathfrak G_B}\sum_{e\in\Gamma}C_e.
$$
Define the task grain
$$
\mathcal I_B
:=
\sup_{Z\in\mathscr Z_B} I(M;Z\mid\mathcal F).
\tag{E.8.4.20}
$$
Suppose the local horizon-saturation record supplies a capacity-tight sufficient min-cut $\Gamma_B^*\in\mathfrak G_B^{\mathrm{suf}}$ such that
$$
\Gamma_B^*\in\arg\min_{\Gamma\in\mathfrak G_B}\sum_{e\in\Gamma}C_e,
\qquad
\mathcal S_{\mathrm{upd}}(\Gamma_B^*)
=
\sum_{e\in\Gamma_B^*}C_e
=
\mathcal I_B.
\tag{E.8.4.21}
$$
Suppose further that the retained horizon branch is PCE-no-surplus: it represents the horizon by a least-update-current sufficient cut and quotients every retained channel whose removal leaves all readouts in $\mathscr Z_B$ unchanged. This condition supplies the no-redundancy interpretation of the minimizing sufficient cut; the equalities below follow from sufficiency, (E.8.4.21), and Corollary E.8.4g. Then the local horizon entropy is the least sufficient predictive update-current entropy and equals the finite min-cut entropy:
$$
S_{\mathcal H}(B)
=
\min_{\Gamma\in\mathfrak G_B^{\mathrm{suf}}}\mathcal S_{\mathrm{upd}}(\Gamma)
=
\mathcal I_B
=
\min_{\Gamma\in\mathfrak G_B}\sum_{e\in\Gamma}C_e.
\tag{E.8.4.22}
$$
On the uniform local horizon branch of Corollary E.8.4g this gives
$$
S_{\mathcal H}(B)
=
C_{\max}^{*}\sigma_{\mathrm{eff}}\mathcal A(\partial B)
+
o(\mathcal A)
=
\frac{\mathcal A(\partial B)}{4G}
+
o(\mathcal A).
\tag{E.8.4.23}
$$

*Proof.* Fix $\Gamma\in\mathfrak G_B^{\mathrm{suf}}$. For every $Z\in\mathscr Z_B$, sufficiency gives the conditional Markov chain
$$
M\longrightarrow Y_\Gamma\longrightarrow Z
\quad\text{given }\mathcal F.
$$
By Theorem E.8.4l,
$$
I(M;Z\mid\mathcal F)
\le
\mathcal S_{\mathrm{upd}}(\Gamma).
$$
Taking the supremum over $Z\in\mathscr Z_B$ gives
$$
\mathcal I_B\le \mathcal S_{\mathrm{upd}}(\Gamma)
$$
for every sufficient cut, hence
$$
\mathcal I_B
\le
\min_{\Gamma\in\mathfrak G_B^{\mathrm{suf}}}\mathcal S_{\mathrm{upd}}(\Gamma).
$$
The capacity-tight sufficient min-cut $\Gamma_B^*$ satisfies
$$
\min_{\Gamma\in\mathfrak G_B^{\mathrm{suf}}}\mathcal S_{\mathrm{upd}}(\Gamma)
\le
\mathcal S_{\mathrm{upd}}(\Gamma_B^*)
=
\mathcal I_B,
$$
so the first equality in (E.8.4.22) follows. The same hypothesis gives
$$
\min_{\Gamma\in\mathfrak G_B}\sum_{e\in\Gamma}C_e
=
\sum_{e\in\Gamma_B^*}C_e
=
\mathcal I_B,
$$
which proves the finite min-cut equality. Corollary E.8.4g gives
$$
S_{\mathcal H}(B)=S_{\mathrm{cut}}(B)
=
\min_{\Gamma\in\mathfrak G_B}\sum_{e\in\Gamma}C_e.
$$
Combining this identity with the two minima proved above gives (E.8.4.22). The PCE-no-surplus clause records that the minimizing sufficient current is represented without response-null retained channels. Corollary E.8.4g evaluates the final min-cut on the uniform regular branch as
$$
C_{\max}^{*}\sigma_{\mathrm{eff}}\mathcal A(\partial B)+o(\mathcal A),
$$
and the Appendix E calibration identifies $C_{\max}^{*}\sigma_{\mathrm{eff}}=1/(4G)$ in natural units. This proves (E.8.4.23). ∎

**Remark E.8.4m.1 (Scope of the No-Surplus Result).** Theorem E.8.4m upgrades the entropy input of the local horizon branch from a static boundary count to a finite update-current statement on the capacity-tight sufficient min-cut branch. It does not replace the Section 12 Clausius/KMS/Raychaudhuri and metric-action gates. It supplies the entropy ledger that those gates use when deriving the reversible Einstein branch.

**Spatial-record factorization guardrail.** The absence of a total internal self-model does not imply that a complete exterior record exists. A boundary-rate claim for a bounded region $\Omega$ requires a separate finite record proving that every retained exterior readout factors through declared boundary variables $Y_{\partial\Omega,j}$, that each channel has capacity $C_e$, and that the channel-use rate $\nu_e$ is fixed. Under those assumptions only,
$$
\dot I_{\mathrm{out}}(\Omega)
\le
\sum_{e\in\partial\Omega}\nu_e C_e.
$$
A covariant light-sheet statement additionally requires the relevant geometric, focusing, caustic, overlap, and matter hypotheses. Off-equilibrium applicability requires an explicit entropy-production and time-dependent channel ledger; it does not follow from spatial SPAP alone.

### E.8.5 PU Entropy-Cone Constraints

**Definition E.8.5a (Predictive Cut Entropy Vector).** Let $\mathcal N=(V,E)$ be a finite undirected predictive channel network with nonnegative edge capacities $C_e$. Let boundary regions be labeled by a finite set $\mathcal B$. For each $A\subseteq\mathcal B$, define the cut entropy
$$
S(A)
=
\min_{U\subseteq V:\,A\subseteq U,\,\mathcal B\setminus A\subseteq V\setminus U}
\sum_{e\in\delta U}C_e,
\tag{E.8.5.1}
$$
where $\delta U$ is the set of edges with one endpoint in $U$ and the other in $V\setminus U$.

**Theorem E.8.5b (Submodularity of Predictive Cut Entropies).** For all boundary subsets $A,B\subseteq\mathcal B$,
$$
S(A)+S(B)\ge S(A\cap B)+S(A\cup B).
\tag{E.8.5.2}
$$

*Proof.* Let $U_A$ and $U_B$ be minimizing vertex sets for $S(A)$ and $S(B)$. The graph cut function
$$
w(U)=\sum_{e\in\delta U}C_e
$$
is submodular:
$$
w(U_A)+w(U_B)\ge w(U_A\cap U_B)+w(U_A\cup U_B).
$$
This follows edge by edge: an edge crossing both $U_A$ and $U_B$ contributes at least as much to the left side as to the right side, and the same is immediate for edges crossing one or neither of the two cuts.

The set $U_A\cap U_B$ is an admissible cut set for $A\cap B$, and $U_A\cup U_B$ is an admissible cut set for $A\cup B$. Therefore
$$
S(A\cap B)\le w(U_A\cap U_B),
\qquad
S(A\cup B)\le w(U_A\cup U_B).
$$
Combining these inequalities gives (E.8.5.2). ∎

**Theorem E.8.5c (Monogamy on the Pure Predictive Min-Cut Branch).** Suppose $A,B,C$ are boundary regions and $O$ is the purifier region, so the full boundary is $A\cup B\cup C\cup O$. For finite undirected predictive min-cut entropies,
$$
S(AB)+S(AC)+S(BC)
\ge
S(A)+S(B)+S(C)+S(ABC).
\tag{E.8.5.3}
$$

*Proof.* Let $U_{AB}$, $U_{AC}$, and $U_{BC}$ be minimizing vertex sets for the cuts $AB$, $AC$, and $BC$. Assign to each vertex a bit string
$$
(x,y,z)\in\{0,1\}^3
$$
recording membership in $U_{AB}$, $U_{AC}$, and $U_{BC}$ respectively. The boundary regions have fixed patterns
$$
A:(1,1,0),
\qquad
B:(1,0,1),
\qquad
C:(0,1,1),
\qquad
O:(0,0,0).
$$
Define four new vertex sets:
$$
W_A=\{(1,1,0)\},
\qquad
W_B=\{(1,0,1)\},
\qquad
W_C=\{(0,1,1)\},
$$
and
$$
W_{ABC}=V\setminus\{(0,0,0)\}.
$$
These are admissible cut sets for $A$, $B$, $C$, and $ABC$ respectively.

For any edge, the number of original cuts among $U_{AB}$, $U_{AC}$, $U_{BC}$ that it crosses is the Hamming distance between the endpoint bit strings. The number of new cuts among $W_A,W_B,W_C,W_{ABC}$ that it crosses is never larger than that Hamming distance. This is checked on the eight possible bit strings and follows because each $W$ separates only boundary patterns already separated by at least one of the original three coordinate cuts. Multiplying by the nonnegative edge capacity and summing over edges gives
$$
w(W_A)+w(W_B)+w(W_C)+w(W_{ABC})
\le
w(U_{AB})+w(U_{AC})+w(U_{BC}).
$$
Since the $W$ sets are admissible but not necessarily minimal,
$$
S(A)+S(B)+S(C)+S(ABC)
\le
w(W_A)+w(W_B)+w(W_C)+w(W_{ABC}).
$$
Using minimality of the original cuts,
$$
w(U_{AB})+w(U_{AC})+w(U_{BC})
=
S(AB)+S(AC)+S(BC).
$$
Combining the three displayed inequalities gives (E.8.5.3). ∎

**Corollary E.8.5d (Entropy-Cone Tests for PU Holography).** Any finite PU entropy vector represented by predictive min-cuts must obey the graph entropy-cone inequalities generated by finite cut functions, including submodularity and, on the pure branch, monogamy of mutual information. A proposed area/channel entropy assignment violating these inequalities cannot be represented by a finite PU min-cut network at that resolution.

*Proof.* Theorems E.8.5b and E.8.5c prove necessary inequalities for every finite predictive cut network. Any violation contradicts the assumed min-cut representation. ∎

## E.9 General Horizon Theorem

### E.9.1 Prediction Saturation

**Definition E.9.1 (Causal Prediction Boundary).** A surface $\Sigma$ in the emergent spacetime is a *causal prediction boundary* if:
1. $\Sigma$ separates spacetime into regions $A$ (interior) and $\bar{A}$ (exterior)
2. Prediction of states in $A$ from data in $\bar{A}$ requires information transfer across $\Sigma$

Any ND-RID channel crossing $\Sigma$ counts as a boundary link. Capacity saturation has the certificate meaning of Definition E.9.2: a registered reliable rate must achieve an independently certified capacity. The scalar deterministic utilization theorem E.8.3.4 does not supply that coding certificate, so saturation remains an additional branch condition.

**Definition E.9.2 (Channel Saturation).** A channel is saturated only when a registered achievable reliable rate reaches its independently certified capacity. On the completed-reset minimal branch, Proposition E.2a supplies
$$
C_{\max}(f_{\mathrm{RID}})
\le\ln d_0-\varepsilon_0
=\ln8-\ln2
=2\ln2.
$$
The equality $C_{\max}=2\ln2$ requires both equality in the reset-support capacity bound and an achievable capacity-saturating code. Physical equality in the reset cost requires a separate overhead-free implementation certificate.

### E.9.2 Conditional Boundary Area Budget

**Theorem E.9.1 (Boundary Area Budget on the Density-Certificate Branch).** Let $\Sigma$ satisfy the density certificate
$$
N_{\mathrm{channels}}
=\frac{\chi}{\eta\delta^2}\mathcal A+o(\mathcal A),
$$
and assume additive independent channel budgets bounded by $C_{\max}$. Define $S_\Sigma^{\mathrm{op}}$ as the maximum reliable boundary information budget in nats. Then
$$
S_\Sigma^{\mathrm{op}}
\le\frac{\chi C_{\max}}{\eta\delta^2}\mathcal A+o(\mathcal A).
\tag{E.9.1a}
$$
If every channel saturates the reset-support bound, the budgets add without correlation loss, $\chi=\eta=1$, $C_{\max}=2\ln2$, and $\delta^2=8\ln2\,L_P^2$, then
$$
S_\Sigma^{\mathrm{op}}
=\frac{\mathcal A}{4L_P^2}+o(\mathcal A/L_P^2).
\tag{E.9.1b}
$$
Identifying this operational information budget with thermodynamic horizon entropy is an additional information--entropy bridge. Under that bridge and in the macroscopic limit,
$$
S_\Sigma=\frac{\mathcal A}{4G}
$$
in natural units, or
$$
S_\Sigma=\frac{k_Bc^3\mathcal A}{4G\hbar}
$$
in SI units.

*Proof.* Additivity and the per-channel upper bound give
$$
S_\Sigma^{\mathrm{op}}
\le N_{\mathrm{channels}}C_{\max}
=\frac{\chi C_{\max}}{\eta\delta^2}\mathcal A+o(\mathcal A),
$$
which is (E.9.1a). Under the equality certificates,
$$
\frac{\chi C_{\max}}{\eta\delta^2}
=\frac{2\ln2}{8\ln2\,L_P^2}
=\frac{1}{4L_P^2},
$$
proving (E.9.1b). The thermodynamic formulas follow only after applying the stated bridge and $L_P^2=G$ in natural units or $L_P^2=G\hbar/c^3$ in SI units. $\square$

### E.9.3 Classification of Horizons

**Theorem E.9.2 (Geometric Classification of the Listed Stationary Horizons).** The following examples are causal prediction boundaries in the sense of Definition E.9.1:

| Horizon Type | Physical Context | Causal mechanism |
|:-------------|:-----------------|:-----------------|
| Event horizon | Schwarzschild black hole | no future-directed causal curve returns from the interior |
| Cosmological | de Sitter static patch | regions beyond the static-patch horizon are causally inaccessible |
| Rindler | uniformly accelerated observer | the observer's worldline has a causal wedge boundary |

Their causal character does not by itself establish microscopic channel-capacity saturation. If an example also satisfies every density, additivity, saturation, calibration, and information--entropy hypothesis of Theorem E.9.1, then the corresponding operational area budget applies.

*Proof.* For Schwarzschild spacetime, the event horizon is the boundary of the causal past of future null infinity. Its surface gravity $\kappa=c^4/(4GM)$ gives
$$
T_H=\frac{\hbar\kappa}{2\pi k_Bc}
=\frac{\hbar c^3}{8\pi GMk_B}.
$$
For de Sitter spacetime, the static-patch horizon has radius $r_\Lambda=\sqrt{3/\Lambda}$ and separates the observer from events outside the patch. For a uniformly accelerated Minkowski observer, the Rindler wedge has a causal boundary and
$$
T_U=\frac{\hbar a}{2\pi k_Bc}.
$$
These facts establish the three causal classifications. They do not compare an achieved microscopic rate with $C_{\max}$. On a separately certified saturation branch, substituting $\mathcal A=16\pi G^2M^2/c^4$ gives the Schwarzschild area expression, and substituting $\mathcal A=4\pi r_\Lambda^2$ gives
$$
\frac{\mathcal A}{4G}=\frac{3\pi}{G\Lambda}
$$
in natural units. $\square$

#### E.9.3.1 Temperature as a Geometric Inverse-Time Scale

The listed stationary-horizon temperatures share the algebraic form $T=\hbar\Gamma/(2\pi k_B)$ for the stated geometric inverse-time scales.

**Theorem E.9.3 (Temperature Structure of the Listed Stationary Horizons).** For the Rindler, Schwarzschild, and de Sitter horizons in the table below,
$$
T=\frac{\hbar}{2\pi k_B}\Gamma,
$$
where the corresponding rate $\Gamma$ has dimension $[\mathrm{time}]^{-1}$. No claim is made here for a general nonstationary causal horizon.

| Horizon Type | Rate $\Gamma$ | Temperature | Reference |
|:-------------|:--------------|:------------|:----------|
| Rindler | Proper acceleration $a/c$ | $T_U = \hbar a/(2\pi k_B c)$ | Unruh 1976 |
| Schwarzschild | Surface gravity $\kappa/c$ | $T_H = \hbar\kappa/(2\pi k_B c)$ | Hawking 1975 |
| de Sitter | Hubble rate $H_\Lambda$ | $T_{dS} = \hbar H_\Lambda/(2\pi k_B)$ | Gibbons & Hawking 1977 |

*Proof.* The Unruh temperature $T_U = \hbar a/(2\pi k_B c)$ can be written:
$$
T_U = \frac{\hbar}{2\pi k_B} \cdot \frac{a}{c} = \frac{\hbar}{2\pi k_B} \cdot \Gamma_a
$$
where $\Gamma_a = a/c$ has dimensions of inverse time.

For Hawking radiation, the surface gravity $\kappa = c^4/(4GM)$ gives $\Gamma_\kappa = \kappa/c$, the rate of exponential peeling of null generators from the horizon.

For de Sitter space, $H_\Lambda = c\sqrt{\Lambda/3}$ is the Hubble expansion rate at the cosmological horizon.

Thus the table establishes a common geometric inverse-time form. Identifying $\Gamma$ with a channel information-processing rate requires a separate operational channel-and-clock certificate and is not proved here. ∎

**Corollary E.9.3.1 (Prefactor Universality).** *The prefactor $\hbar/(2\pi k_B)$ relates the quantum of action $\hbar$ to thermal energy via Boltzmann's constant $k_B$, with the factor $2\pi$ arising from the periodicity of Euclidean time in the thermal field theory representation* [Gibbons & Hawking 1977].

### E.9.4 Holographic Content

Throughout this subsection, we work in natural units ($c = \hbar = k_B = 1$, $L_P^2 = G$) where entropy and information are measured in nats.

**Theorem E.9.4 (Exterior Information Bound on a Reconstructible Code).** Let $\mathcal C_A\subseteq\mathcal H_A$ be an interior code whose retained classical labels are recoverable from exterior measurements through independent boundary channels $\mathcal E_i$. Then
$$
I_{\max}^{\mathrm{ext}}(\mathcal C_A)
\le\sum_i C(\mathcal E_i).
\tag{E.9.4a}
$$
On the saturation and calibration branch of Theorem E.9.1, the right-hand side equals $\mathcal A/(4G)$ in natural units. Equality in (E.9.4a) requires an achievable joint code attaining every channel budget and no correlation loss.

*Proof.* For any ensemble of code labels and any exterior measurement, the Holevo bound gives accessible mutual information no greater than the Holevo information of the boundary output ensemble. The independent product-channel hypothesis and the definition of classical capacity bound the asymptotic rate by $\sum_iC(\mathcal E_i)$. Taking the supremum over code ensembles and exterior measurements proves (E.9.4a). The final coefficient follows from Theorem E.9.1 only under its equality certificates. $\square$

**Corollary E.9.4a (Comparison with the Bekenstein Bound).** If a system independently satisfies the Bekenstein inequality
$$
S\le\frac{2\pi RE}{\hbar c}
$$
and $E=Rc^4/(2G)$, then, for a spherical boundary $\mathcal A=4\pi R^2$,
$$
\frac{2\pi RE}{\hbar c}
=\frac{\pi R^2c^3}{G\hbar}
=\frac{\mathcal A}{4L_P^2}.
$$

*Proof.* Substitute the stated value of $E$ and $L_P^2=G\hbar/c^3$. $\square$

**Corollary E.9.1 (Dimension Bound for a Perfectly Reconstructible Code).** If $d_{\mathrm{code}}$ mutually orthogonal, equiprobable code states are perfectly recoverable from the boundary, then
$$
\ln d_{\mathrm{code}}
\le I_{\max}^{\mathrm{ext}}(\mathcal C_A)
\le\frac{\mathcal A}{4G}
$$
on the saturation/calibration branch, and hence
$$
d_{\mathrm{code}}\le\exp\left(\frac{\mathcal A}{4G}\right).
$$
The same inequality applies to $\dim\mathcal H_A$ only if every state of $\mathcal H_A$ belongs to such a perfectly reconstructible code.

*Proof.* Perfect recovery of $d_{\mathrm{code}}$ equiprobable labels yields mutual information $\ln d_{\mathrm{code}}$. Apply Theorem E.9.4 and exponentiate. $\square$


## E.9.5 Conditional Unitary Representation of a Closed Retained Automorphism Circuit

We now give a conditional unitary-representation theorem for a retained finite-dimensional closed circuit whose interaction layers are already registered $*$-automorphisms. Capacity finiteness and SPAP do not imply that automorphism premise.

### E.9.5.1 Preliminary Definitions and Prior Results

This section derives global unitarity from the causal and thermodynamic structure established in preceding sections. For reference, the key prior results upon which the derivation depends are:

- **Summary of Hypothesis 1 (Nominated MPU Reality Model):** On this nominated physical-realization branch, the internally accessible substrate is modeled as a network $\mathcal N$ of interacting Minimal Predictive Units, with no internally accessible degrees of freedom outside the registered network. This is branch data, not a consequence of SPAP, capacity finiteness, or the Cogito.

  *Remark (Consistency with P.5):* The closed-system assumption is consistent with the authentic simulation architecture (Appendix P.5). "No external degrees of freedom accessible to internal systems" refers to internal physical reality; external observation channels (Definition P.5.3) operate outside this substrate by construction, satisfying internal inaccessibility ($\mathbb{E}[\Delta Q \mid E; M] = 0$ for all internal procedures $M \in \mathcal{M}_{int}$) and non-intervention.

- **Recall Definition 6 / Definition A.2.2 (ND-RID):** Non-Deterministic Reflexive Interaction Dynamics govern the MPU 'Evolve' process, characterized by probabilistic outcomes $P(o|x,y)$ and state transitions $P(x'|x,y,o)$. The defining characteristic is the dependence of state transformation on outcome, creating a reflexive loop.

- **Recall Definition 26 (Internal Evolution):** Between 'Evolve' interactions, each MPU evolves unitarily via $U_0(\Delta t) = e^{-i\hat{H}\Delta t/\hbar}$ with self-adjoint Hamiltonian $\hat{H}$.

- **Recall Definition 27 ('Evolve'/ND-RID):** The interaction process between MPUs, implementing reflexive state updates. By construction, 'Evolve' acts on pairs of interacting MPUs through their joint Hilbert space $\mathcal{H}_A \otimes \mathcal{H}_B$, without coupling to additional external systems. This is an instance of ND-RID (Definition 6, Definition A.2.2).

- **Recall Definition 35 (Propagation Cost Metric):** The fundamental MPU spacing $\delta$ defines the characteristic length scale of the network, with the propagation cost metric $d_{\mathcal{N}}(u,v)$ measuring minimum cumulative cost along network paths.

- **Recall from Theorem 23:** The MPU Hilbert space dimension satisfies $d_0 \ge 8$ for $K_0=3$; the minimal branch used in the Appendix Z backbone has $d_0 = 8$ (Theorem Z.2).

- **Recall from Theorem 29 and Corollary 29.1:** The internal Hamiltonian supplies a characteristic timescale and a task-specific orthogonalization bound. A positive lower duration for each ND-RID traversal is separately registered in the branch hypothesis of Theorem E.10.2; it is not a consequence of Theorem 29 alone.

- **Recall from Proposition 5, Definition 28, Theorem J.1, Lemma J.1, and Theorem 31:** Theorem J.1 gives the structural binary reset-support value $\varepsilon_0=\ln2$. On the declared prescribed-ready binary-ancilla architecture, Lemma J.1 gives a noninjective merge when its reachable-domain hypothesis is satisfied. If that architecture performs a registered reset satisfying Definition 28, Theorem 31 gives $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)$; equality at $\ln2$ additionally requires a conditionally uniform binary record and zero dissipative overhead.

- **Summary of Lemma E.1 (Strict Contractivity):** If the average Evolve channel contains a nonzero input-independent refresh component, $\mathcal{E}_N=(1-p)\Psi+pT_\sigma$ with $p>0$, then it is strictly contractive in trace distance with factor $f_{\text{RID}}=1-p<1$. If $\sigma\succ0$, the channel is strictly positive and hence primitive (unique full-rank fixed point). No universal quantitative lower bound on $p$ follows from $\varepsilon$ alone.

- **Summary of Theorem E.2 (Refresh-Branch Capacity Bound):** If the averaged channel has the nonzero input-independent refresh component of Lemma E.1, its classical information capacity satisfies $C_{\max} \equiv C(\mathcal{E}_N) < \ln d_0$.

- **Theorem E.10.2 (Velocity Bound):** On its registered serialized edge-clock branch, $v_{\mathrm{ser}}\le\delta/\tau_{\min}$; equality and identification with $c$ require the separate one-link-attainment and scale-identification hypotheses.

### E.9.5.2 Notation

Throughout this section:

- $\mathcal{S}(\mathcal{H})$ denotes the set of density operators (positive semidefinite, trace-one) on Hilbert space $\mathcal{H}$
- $\mathcal{B}(\mathcal{H})$ denotes the algebra of bounded linear operators on $\mathcal{H}$
- $\mathcal{U}(\mathcal{H})$ denotes the group of unitary operators on $\mathcal{H}$
- $\mathrm{tr}_B[\cdot]$ denotes the partial trace over subsystem $B$
- $D_{\text{tr}}(\rho, \sigma) = \frac{1}{2}\|\rho - \sigma\|_1$ denotes trace distance
- $S(\rho) = -\mathrm{tr}(\rho \ln \rho)$ denotes von Neumann entropy (in nats) [von Neumann 1932]
- $I(A:B)_\rho = S(\rho_A) + S(\rho_B) - S(\rho_{AB})$ denotes quantum mutual information
- $d_0 = 8$ on the minimal Appendix Z branch (Theorem Z.2; Theorem 23 gives $d_0\ge 8$)
- $\delta$ is the fundamental MPU spacing (Definition 35)
- $\varepsilon_0=\ln2$ on the attractor branch (Definition 15a; Theorem 31 gives $\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)\quad(\text{registered reset branch; a positive floor requires }H_q(P\mid R)\ge h_{\min}>0)$)

### E.9.5.3 Information Capacity of Cauchy Surfaces

**Definition E.9.5.1 (Information Capacity of a Cauchy Surface).** For a Cauchy surface $\Sigma$ in the emergent spacetime (Theorem 43), define the information capacity as the maximum von Neumann entropy achievable by states on $\Sigma$. For the finite-dimensional Hilbert space $\mathcal{H}_{\Sigma}$ arising from the discrete MPU network:

$$\mathcal{C}(\Sigma) := \sup_{\rho \in \mathcal{S}(\mathcal{H}_{\Sigma})} S(\rho) = \ln \dim(\mathcal{H}_{\Sigma})$$

where $\mathcal{S}(\mathcal{H}_{\Sigma})$ denotes the set of density operators on the Hilbert space $\mathcal{H}_{\Sigma}$ associated with $\Sigma$, and the equality holds because the supremum is achieved by the maximally mixed state $\rho_* = \mathbb{I}/\dim(\mathcal{H}_{\Sigma})$.

*Proof of equality.* For any density operator $\rho$ on a $d$-dimensional Hilbert space, $S(\rho) \leq \ln d$ with equality if and only if $\rho = \mathbb{I}/d$ [Nielsen & Chuang 2010, Theorem 11.8]. ∎

### E.9.5.4 Closed System Assumption and Exhaustive Channel Mediation

**Assumption E.9.5.1 (Closed System).** The MPU network $\mathcal{N}$ constitutes a closed system from the internal perspective: no information exchange occurs with degrees of freedom accessible to internal systems. 

This assumption follows from Hypothesis 1 (Section 7.1) together with the authentic simulation architecture (Appendix P.5). External observation channels (Definition P.5.3) satisfy internal inaccessibility ($\mathbb{E}[\Delta Q \mid E; M] = 0$ for all internal procedures $M \in \mathcal{M}_{int}$, condition (ii) of Definition P.5.3) and non-intervention (condition (iii) of Definition P.5.3), ensuring that from the internal perspective, the network evolves as if closed (Remark P.5.1). External observation extracts information without constituting an interaction from the internal viewpoint.

For Theorem E.9.5, internal closure supplies the absence of an external retained environment. The unitary conclusion additionally requires the theorem's finite ordered circuit decomposition, response-preserving pairwise $*$-automorphisms on disjoint factors, self-adjoint free generators, and equality of the endpoint Hilbert-space dimensions. Under these hypotheses, every layer is unitary and their finite composition is unitary.

**Lemma E.9.5.1 (Exhaustive Channel Mediation).** *All information transfer between spacelike-separated regions in the MPU network is mediated by ND-RID channels. There exists no mechanism for information propagation outside this channel structure.*

*Proof.*

**Step 1 (MPU network structure).** By Definition 23, the MPU network $\mathcal N=(\mathcal V,\mathcal E,\{w_{uv}\})$ consists of MPU vertices and weighted possible ND-RID edges. On the separately registered Hilbert/comparator branch, Theorem 23 gives $d_0\ge8$ and Theorem Z.2 gives $d_0=8$. The network topology determines which MPUs can interact directly.

**Step 2 (Definitional completeness of dynamics).** The MPU dynamics are exhaustively specified by:

- Definition 26: Internal unitary evolution $U_0(\Delta t) = e^{-i\hat{H}\Delta t/\hbar}$ between interactions
- Definition 27: 'Evolve'/ND-RID interactions between MPUs (instantiating Definition 6/A.2.2)
- Hypothesis 1: on the nominated closed-network branch, $\mathcal N$ is the complete admitted internal substrate; excluding other internally accessible degrees of freedom is a branch premise, not a derived fact about the realized universe

These definitions constitute the complete dynamical specification of the framework. Any hypothetical mechanism $\mathcal{M}$ for information transfer that is not reducible to compositions of internal evolution and ND-RID interactions would, by definition, lie outside the framework's ontology.

**Step 3 (Interaction locality from ND-RID structure).** By Definition A.2.2, ND-RID interactions act on specific subsystems $(A, B)$ with probabilistic outcome functions $V_{\text{prob}}: X \times Y \to \Delta(O)$ and state transformations $T_{\text{prob}}: X \times Y \times O \to \Delta(X)$. For the MPU 'Evolve' process (Definition 27), these functions act on the joint state space of interacting MPU pairs. On the separately registered serialized edge-clock branch of Theorem E.10.2, information propagation satisfies $v_{\mathrm{ser}}\le\delta/\tau_{\min}$. Equality with an attained $c$ requires that theorem's additional one-link-attainment and scale-identification hypotheses. Theorem 29 alone does not give the per-edge duration bound. Consequently, sequential transfer between non-adjacent MPUs is a conclusion only on the declared nearest-neighbor serialization branch.

**Step 4 (Channel decomposition at boundaries).** Consider any two spacelike-separated regions $A$ and $B$ on a Cauchy surface $\Sigma$. Let $\bar{A} = \Sigma \setminus A$ denote the complement of $A$. The Hilbert space factorizes as $\mathcal{H}_{\Sigma} = \mathcal{H}_{A} \otimes \mathcal{H}_{\bar{A}}$. Any causal curve connecting $A$ to $B \subseteq \bar{A}$ must pass through the boundary $\partial A$. By Theorem E.3, this boundary hosts $N_{\text{channels}} = \sigma_{\text{eff}} \cdot |\partial A|$ effective independent ND-RID channels, where:

$$\sigma_{\text{eff}} = \frac{\chi}{\eta\delta^2}$$

is the effective channel density, $\eta$ is the geometric packing coefficient, and $\chi \in (0,1]$ is the correlation correction factor (Theorem E.3).

**Step 5 (Pre-existing correlations).** The tensor product structure $\mathcal{H}_{\Sigma} = \mathcal{H}_{A} \otimes \mathcal{H}_{\bar{A}}$ implies that correlations between $A$ and $\bar{A}$ are encoded in the joint state $\rho_{A\bar{A}} \in \mathcal{S}(\mathcal{H}_A \otimes \mathcal{H}_{\bar{A}})$. Pre-existing correlations (including entanglement established by prior interactions) persist via the tensor product structure. All dynamical modifications to correlations between $A$ and $\bar{A}$—that is, changes to the mutual information $I(A:\bar{A})$—are mediated exclusively through ND-RID channels crossing $\partial A$.

**Step 6 (Completeness).** By Steps 2–5, the ND-RID channel structure exhaustively accounts for all information transfer mechanisms within the framework's ontology. ∎

### E.9.5.5 Hilbert Space Dimension Conservation

**Lemma E.9.5.2 (Hilbert Space Dimension Conservation).** *For a closed MPU network of fixed topology evolving between Cauchy surfaces $\Sigma_1 \to \Sigma_2$, the Hilbert space dimensions satisfy:*

$$\dim(\mathcal{H}_{\Sigma_1}) = \dim(\mathcal{H}_{\Sigma_2})$$

*Proof.*

**Step 1 (MPU counting).** A Cauchy surface $\Sigma$ intersects a definite number $N_{\text{MPU}}(\Sigma)$ of MPUs in the network. On the minimal MPU branch used here, each MPU has Hilbert space dimension $d_0 = 8$ (Theorem Z.2; Theorem 23 gives the lower bound $d_0\ge 8$). The total Hilbert space dimension is:

$$\dim(\mathcal{H}_{\Sigma}) = d_0^{N_{\text{MPU}}(\Sigma)} = 8^{N_{\text{MPU}}(\Sigma)}$$

**Step 2 (Conservation of MPU number).** We establish that ND-RID dynamics preserve the total MPU count through three sub-arguments:

*(a) Local preservation:* By Definition 27 and Definition A.2.2, the 'Evolve' process acts on the state spaces of participating MPUs without creating or destroying network vertices. The quantum instrument representation (Section E.2) maps $\mathcal{E}_N: \mathcal{S}(\mathcal{H}_{d_0}^{\otimes k}) \to \mathcal{S}(\mathcal{H}_{d_0}^{\otimes k})$ for $k$ interacting MPUs, preserving the tensor product structure and thus the count of constituent factors.

*(b) Global vertex set invariance:* The MPU network $\mathcal{N} = (\mathcal{V}, \mathcal{E}, \{w_{uv}\})$ (Definition 23) has vertex set $\mathcal{V}$ corresponding to MPUs. The 'Evolve' dynamics modify edge weights $w_{uv}$ and vertex states but not the vertex set itself. For a closed network (Hypothesis 1 with no external boundary), $|\mathcal{V}|$ is an invariant of the dynamics.

*(c) Cauchy surface intersection:* A Cauchy surface $\Sigma$ intersects each MPU worldline exactly once (by definition of Cauchy surface in the emergent spacetime, established via Theorem 43 and Section 11). Therefore:

$$N_{\text{MPU}}(\Sigma_1) = |\mathcal{V}| = N_{\text{MPU}}(\Sigma_2) \equiv N_{\text{total}}$$

**Step 3 (Dimension equality).** Combining Steps 1 and 2:

$$\dim(\mathcal{H}_{\Sigma_1}) = d_0^{N_{\text{total}}} = \dim(\mathcal{H}_{\Sigma_2})$$

∎

### E.9.5.6 Joint Unitarity of ND-RID Operations

The following lemma establishes the central technical result on the closed retained-ledger branch: reduced ND-RID channels may be contractive after restriction to a subsystem, while the complete pair ledger is represented by a finite-dimensional $*$-automorphism and therefore by unitary conjugation. The proof uses finite matrix-algebra automorphism structure rather than inferring joint unitarity from a reduced CPTP channel.

**Lemma E.9.5.3 (Joint ND-RID Operations are Finite-Response Unitary Automorphisms).** Let $A$ and $B$ be an interacting MPU pair on the closed retained-ledger branch of Assumption E.9.5.1. Let
$$
\mathcal H_{AB}:=\mathcal H_A\otimes\mathcal H_B,
\qquad
\mathfrak A_{AB}:=\mathcal B(\mathcal H_{AB}).
$$
Assume the joint retained ND-RID update is complete on the pair ledger and carries the automorphism certificate: in the Heisenberg picture it is a unital response-preserving $*$-automorphism
$$
\alpha_{AB}:\mathfrak A_{AB}\to\mathfrak A_{AB}.
$$
Then there exists a unitary operator
$$
U_{AB}\in\mathcal U(\mathcal H_{AB})
$$
such that
$$
\alpha_{AB}(X)=U_{AB}^{\dagger}XU_{AB}
\qquad
(X\in\mathfrak A_{AB}).
$$
Equivalently, the Schrödinger-picture joint state update is
$$
\rho_{AB}\mapsto U_{AB}\rho_{AB}U_{AB}^{\dagger}.
$$

**Remark E.9.5.3a (Automorphism Certificate on the Closed Retained Ledger).** The automorphism input is the branch certificate required for Lemma E.9.5.3. Closedness, PPI completeness, and retained injectivity are necessary ledger conditions, but they do not by themselves force an arbitrary retained CPTP update to be multiplicative. A unital trace-preserving completely positive map on a finite matrix algebra can be injective and still fail to be a $*$-automorphism. The closed retained-ledger branch therefore includes a response-product preservation certificate, equivalently
$$
\alpha_{AB}(XY)=\alpha_{AB}(X)\alpha_{AB}(Y),
\qquad
\alpha_{AB}(X^*)=\alpha_{AB}(X)^*,
\qquad
\alpha_{AB}(I)=I,
$$
for all retained pair-ledger observables $X,Y\in\mathfrak A_{AB}$. In the finite-dimensional full matrix algebra, this certificate is exactly the condition that the Heisenberg update is a $*$-automorphism. Lemma E.9.5.3 then converts that algebraic certificate into unitary conjugation. Reduced subsystem contractivity remains compatible with this statement because partial trace or restriction to a subsystem need not preserve the automorphism structure.

*Proof.* Since $\mathcal H_{AB}$ is finite dimensional, choose an orthonormal basis $\{e_i\}_{i=1}^d$ with $d=\dim\mathcal H_{AB}$ and let
$$
E_{ij}:=|e_i\rangle\langle e_j|
$$
be the standard matrix units. Because $\alpha_{AB}$ is a unital $*$-automorphism, the family
$$
F_{ij}:=\alpha_{AB}(E_{ij})
$$
satisfies the same matrix-unit relations:
$$
F_{ij}F_{kl}
=
\alpha_{AB}(E_{ij}E_{kl})
=
\delta_{jk}\alpha_{AB}(E_{il})
=
\delta_{jk}F_{il},
$$
and
$$
F_{ij}^{\dagger}
=
\alpha_{AB}(E_{ij}^{\dagger})
=
\alpha_{AB}(E_{ji})
=
F_{ji}.
$$
Automorphisms preserve minimal projections, so the projections $F_{ii}=\alpha_{AB}(E_{ii})$ are mutually orthogonal rank-one projections whose sum is the identity:
$$
\sum_iF_{ii}
=
\alpha_{AB}\left(\sum_iE_{ii}\right)
=
\alpha_{AB}(I)
=
I.
$$
Choose unit vectors $f_i$ with
$$
F_{ii}=|f_i\rangle\langle f_i|.
$$
From
$$
F_{ii}F_{ij}F_{jj}=F_{ij},
$$
each $F_{ij}$ maps the line $\mathbb C f_j$ into the line $\mathbb C f_i$ and vanishes on the orthogonal complement of $\mathbb C f_j$. Hence
$$
F_{ij}=\lambda_{ij}|f_i\rangle\langle f_j|
$$
for some phases $\lambda_{ij}\in U(1)$, with $\lambda_{ii}=1$. The matrix-unit relation $F_{ij}F_{jk}=F_{ik}$ gives
$$
\lambda_{ij}\lambda_{jk}=\lambda_{ik}.
$$
Taking $\mu_i:=\lambda_{i1}$ gives
$$
\lambda_{ij}=\mu_i\overline{\mu_j}.
$$
Set $g_i:=\mu_i f_i$. Then
$$
|g_i\rangle\langle g_j|
=\mu_i\overline{\mu_j}|f_i\rangle\langle f_j|
=F_{ij}
$$
for all $i,j$. Relabeling $g_i$ as $f_i$ yields
$$
F_{ij}=|f_i\rangle\langle f_j|.
$$

Define the unitary $W:\mathcal H_{AB}\to\mathcal H_{AB}$ by
$$
We_i=f_i.
$$
Then
$$
W E_{ij} W^\dagger
=
|f_i\rangle\langle f_j|
=
F_{ij}
=
\alpha_{AB}(E_{ij}).
$$
By linearity, $\alpha_{AB}(X)=WXW^\dagger$ for every $X\in\mathfrak A_{AB}$. Setting
$$
U_{AB}:=W^\dagger
$$
gives
$$
\alpha_{AB}(X)=U_{AB}^{\dagger}XU_{AB}.
$$
The dual Schrödinger-picture map is therefore
$$
\rho_{AB}\mapsto U_{AB}\rho_{AB}U_{AB}^{\dagger}.
$$
∎

### E.9.5.7 Composition Lemmas

**Lemma E.9.5.4 (Composition of Unitary Operations).** *The composition of unitary operations is unitary. If $U_1: \mathcal{H} \to \mathcal{H}$ and $U_2: \mathcal{H} \to \mathcal{H}$ are unitary, then $U_2 U_1$ is unitary.*

*Proof.*

$$(U_2 U_1)^\dagger (U_2 U_1) = U_1^\dagger U_2^\dagger U_2 U_1 = U_1^\dagger \mathbb{I} U_1 = U_1^\dagger U_1 = \mathbb{I}$$

Similarly:

$$(U_2 U_1)(U_2 U_1)^\dagger = U_2 U_1 U_1^\dagger U_2^\dagger = U_2 \mathbb{I} U_2^\dagger = U_2 U_2^\dagger = \mathbb{I}$$

∎

**Lemma E.9.5.5 (Tensor Product of Unitary Operations).** *If $U_1: \mathcal{H}_1 \to \mathcal{H}_1$ and $U_2: \mathcal{H}_2 \to \mathcal{H}_2$ are unitary, then $U_1 \otimes U_2: \mathcal{H}_1 \otimes \mathcal{H}_2 \to \mathcal{H}_1 \otimes \mathcal{H}_2$ is unitary.*

*Proof.*

$$(U_1 \otimes U_2)^\dagger (U_1 \otimes U_2) = (U_1^\dagger \otimes U_2^\dagger)(U_1 \otimes U_2) = (U_1^\dagger U_1) \otimes (U_2^\dagger U_2) = \mathbb{I}_1 \otimes \mathbb{I}_2 = \mathbb{I}_{12}$$

The reverse product follows analogously. ∎

### E.9.5.8 Main Theorem: Unitarity from Closed-System ND-RID Structure

**Remark E.9.5.0 (Closed-Network First Reading).** The derivational order in this subsection is closed-network first. The theorem proves that the internally complete MPU network evolves by a unitary total map between complete Cauchy-surface ledgers. Reduced ND-RID contractivity is then read as the result of restricting this closed evolution to a subsystem and tracing inaccessible partner/correlation degrees of freedom. Thus the framework does not infer global unitarity from a noisy local channel. It infers local apparent non-unitarity from restriction of a closed global evolution.

**Theorem E.9.5 (Unitarity of a Closed Finite-Layer Retained-Ledger Circuit).** Let a closed finite MPU network evolve between Cauchy surfaces $\Sigma_1\to\Sigma_2$. Assume:

1. the interval admits a finite ordered circuit decomposition into free-evolution layers and interaction layers;
2. each interaction layer is a tensor product of pairwise disjoint retained-ledger $*$-automorphisms of Lemma E.9.5.3 and identities on the other factors;
3. every free layer is generated by the self-adjoint single-MPU Hamiltonians of Definition 26; and
4. $\dim\mathcal H_{\Sigma_1}=\dim\mathcal H_{\Sigma_2}$ as in Lemma E.9.5.2.

Then the total evolution operator
$$
U:\mathcal H_{\Sigma_1}\to\mathcal H_{\Sigma_2}
$$
is unitary.

*Proof.*

**Step 1 (Declared circuit decomposition).** By hypothesis 1, choose interaction times
$$
t_{\Sigma_1}=t_0<t_1<\cdots<t_n=t_{\Sigma_2}
$$
that delimit the finite layers. Hypotheses 2--3 identify each layer as either:

*(a)* a tensor product of single-MPU free evolutions $U_0^{(v)}(\Delta t)=e^{-i\hat H_v\Delta t/\hbar}$; or

*(b)* a tensor product of pairwise disjoint retained-ledger interaction automorphisms and identity factors.

**Step 2 (Unitarity of internal evolution).** By Definition 26, internal MPU evolution is explicitly unitary, governed by the Schrödinger equation with self-adjoint Hamiltonian $\hat{H}_v$. For each MPU $v$ and time interval $[t_k, t_{k+1}]$ without interactions:

$$U_0^{(v)}(t_{k+1} - t_k) = e^{-i\hat{H}_v (t_{k+1} - t_k)/\hbar}$$

satisfies $(U_0^{(v)})^\dagger U_0^{(v)} = \mathbb{I}$.

For the entire network during a non-interaction interval:

$$U_{\text{free}}(t_k, t_{k+1}) = \bigotimes_{v \in \mathcal{V}} U_0^{(v)}(t_{k+1} - t_k)$$

This is unitary by Lemma E.9.5.5 (applied inductively).

**Step 3 (Unitarity of pairwise interactions).** By Lemma E.9.5.3, each complete retained pair ledger for an ND-RID interaction is a finite-dimensional $*$-automorphism of
$$
\mathcal B(\mathcal H_A\otimes\mathcal H_B),
$$
and hence is implemented in the Schrödinger picture by a unitary operator $U_{AB}$ on
$$
\mathcal H_A\otimes\mathcal H_B.
$$

**Step 4 (Unitarity of simultaneous non-overlapping interactions).** At any instant, multiple non-overlapping MPU pairs may interact simultaneously. The ND-RID structure (Definition 27, Definition A.2.2) specifies pairwise interactions; simultaneous interactions involving disjoint subsystems decompose into concurrent pairwise operations.

Let $\mathcal{P}_k = \{(A_1, B_1), (A_2, B_2), \ldots, (A_m, B_m)\}$ denote the set of interacting pairs at time $t_k$, where $\{A_1, B_1, A_2, B_2, \ldots, A_m, B_m\}$ are pairwise disjoint. The joint interaction operator is:

$$U_{\text{int}}(t_k) = U_{A_1 B_1} \otimes U_{A_2 B_2} \otimes \cdots \otimes U_{A_m B_m} \otimes \mathbb{I}_{\text{rest}}$$

where $\mathbb{I}_{\text{rest}}$ is the identity on non-interacting MPUs. By Lemma E.9.5.5, this tensor product of unitaries is unitary.

**Step 5 (Unitarity of full evolution).** The complete evolution from $\Sigma_1$ to $\Sigma_2$ is the composition:

$$U_{\text{total}} = U_{\text{int}}(t_{n-1}) \cdot U_{\text{free}}(t_{n-2}, t_{n-1}) \cdot U_{\text{int}}(t_{n-2}) \cdots U_{\text{free}}(t_0, t_1) \cdot U_{\text{int}}(t_0)$$

(with $U_{\text{int}}(t_k) = \mathbb{I}$ if no interactions occur at $t_k$).

By Lemma E.9.5.4, the composition of unitary operators is unitary:

$$U_{\text{total}}^\dagger U_{\text{total}} = \mathbb{I}, \qquad U_{\text{total}} U_{\text{total}}^\dagger = \mathbb{I}$$

**Step 6 (Closed system constraint).** By Assumption E.9.5.1 (Closed System), following from Hypothesis 1:

- No information can enter from outside the system (none accessible to internal systems)
- No information can exit to outside the system (none detectable by internal systems)
- All MPU interactions are internal to the total system
- The Stinespring environment for any reduced subsystem dynamics is contained within $\mathcal{H}_{\Sigma}$ itself

A Cauchy surface $\Sigma$ is, by definition, a complete spatial slice through the emergent spacetime (Theorem 43, Section 11). For internal dynamics with no boundary accessible to internal systems, this completeness is exact.

**Step 7 (Conclusion).** The total evolution operator $U_{\text{total}}: \mathcal{H}_{\Sigma_1} \to \mathcal{H}_{\Sigma_2}$ is:

- A composition of unitary operators (Steps 2–5)
- Therefore unitary (Lemmas E.9.5.4, E.9.5.5)
- Acting between spaces of equal dimension (Lemma E.9.5.2)

Hence $U_{\text{total}}^\dagger U_{\text{total}} = U_{\text{total}} U_{\text{total}}^\dagger = \mathbb{I}$, establishing global unitarity. ∎

### E.9.5.9 Corollaries

**Corollary E.9.5.1 (Unitarity as the Representation of Closed Retained-Ledger Automorphism).** *Unitarity of the total retained quantum evolution is not imposed as a separate Hilbert-space postulate; it is the finite-dimensional representation of the closed retained response algebra's $*$-automorphism dynamics.*

The structural binary reset-support value $\varepsilon_0=\ln2$ (Proposition 5; Definition 28) and the closed-system condition generate two compatible but level-distinct derivation chains:

**Branch I (Reduced Causal Capacity Characterization):**

$$
\varepsilon_0=\ln2
\xrightarrow[\text{Prop E.2a}]{}
C_{\max}\le\ln d_0-\ln2
\xrightarrow[\text{Thm E.3}]{}
\text{finite boundary capacity}
\xrightarrow[\text{Thm E.6}]{}
S_{BH}=\frac{\mathcal A}{4G}.
$$

On refresh/minorization subbranches, Lemma E.1 and Theorem E.2 add the strict reduced-channel route
$$
f_{RID}<1\to C_{\max}<\ln d_0,
$$
which supplies contraction and mixing statements but is not the quantitative source of the residual-budget value $C_{\max}^*=2\ln2$.

**Branch II (Closed Global Unitarity):**

$$
\text{Closed retained ledger}
+
\text{ND-RID pair automorphisms}
\xrightarrow[\text{Lem E.9.5.3}]{}
U_{AB}\text{ unitary on complete pair ledgers}
\xrightarrow[\text{Thm E.9.5}]{}
\text{global retained unitarity}.
$$

For systems with observation channels (Appendix P.5), Branch II applies to internal dynamics when the channel satisfies Definition P.5.3, ensuring internal closure from the internal perspective.

The registered reset-support capacity deficit, reduced-state entropy growth under entangling unitary dynamics, and perspectival access restriction are separate branch statements. Their coexistence is compatible with global retained unitarity, but SPAP alone supplies none of the reset channel, the entangling dynamics, or a monotone entropy-production certificate.

*Proof.* The derivation chains are verified by tracing the logical dependencies:

**Branch I:**
1. The declared binary reset-support ledger has the structural value $\varepsilon_0=\ln2$ (Proposition 5; Definition 28). On a physical reset branch satisfying Definition 28, Theorem 31 separately gives $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)$; a positive physical floor requires $H_q(P\mid R)\ge h_{\min}>0$.
2. The completed binary reset-support branch gives the support-dimension capacity deficit
   $$
   C_{\max}\le\ln d_0-\ln2
   $$
   by Proposition E.2a.
3. On the minimal $d_0=8$ PCE residual-budget saturation branch, this gives
   $$
   C_{\max}^*=2\ln2.
   $$
4. Finite capacity plus geometric regularity and the density-certificate branch of Theorem E.3 gives finite boundary information $S_{\max}\propto\mathcal A$.
5. On the capacity-achieving, entropy-saturating, additive-ledger branch of Theorem E.6, the area bound is saturated; defining $G_{\mathrm{op}}$ by the Bekenstein–Hawking normalization gives $S_{BH}=\mathcal A/(4G_{\mathrm{op}})$ in natural units.

On refresh/minorization subbranches, the additional full-state refresh component gives $f_{RID}<1$ and the strict capacity inequality $C_{\max}<\ln d_0$ by Lemma E.1 and Theorem E.2. That strict-contraction route is used for mixing, fixed-point, and reduced-channel contraction statements; the reset-support route is used for quantitative residual-budget channel counting.

**Branch II:**
1. Closed system (Hypothesis 1) and PPI completeness identify the total retained response ledger on a complete Cauchy surface.
2. Definition 27/A.2.2 supplies the pairwise ND-RID interaction ledger.
3. On the closed retained-ledger branch, the pair interaction is represented in the Heisenberg picture by a unital response-preserving $*$-automorphism of the full pair algebra.
4. Lemma E.9.5.3 converts this finite-dimensional automorphism into unitary conjugation on $\mathcal H_A\otimes\mathcal H_B$.
5. Unitary tensoring and composition give global retained unitarity by Theorem E.9.5.

Branch I uses a registered reset-support channel and separate saturation and calibration hypotheses to obtain its reduced-capacity and area-law statements. Branch II uses a closed retained-ledger automorphism and ND-RID pair structure to prove global retained unitarity. The two coexist because the Branch I channel is a subsystem restriction of the Branch II closed evolution together with its reset register, so reduced contractivity is not a loss of globally retained information; neither branch is a consequence of SPAP entropy. ∎

---

**Corollary E.9.5.2 (Conditional Black-Hole Information Conservation).** Assume that the retained black-hole-plus-radiation algebra is closed and satisfies every finite-layer automorphism hypothesis of Theorem E.9.5 throughout the evaporation interval. Assume also a retained factorization
$$
\mathcal H_{\mathrm{total}}(t)
=\mathcal H_{\mathrm{BH}}(t)\otimes\mathcal H_{\mathrm{rad}}(t)
$$
compatible with the total unitary identifications. Then
$$
S_{\mathrm{fine}}(\rho_{\mathrm{total}}(t))
=S_{\mathrm{fine}}(\rho_{\mathrm{total}}(0)).
$$
If the initial total state is pure and complete evaporation leaves a one-dimensional black-hole factor with no remnant or untracked sector, the final radiation state is pure.

*Proof.*

**Step 1 (System definition).** Consider the black hole plus radiation as a closed system occupying a region $\mathcal{R}$ with boundary $\partial\mathcal{R}$ at spatial infinity (or a large sphere encompassing all radiation). The total Hilbert space factorizes as $\mathcal{H}_{\text{total}} = \mathcal{H}_{\text{BH}} \otimes \mathcal{H}_{\text{rad}}$, where the dimensions evolve as the horizon shrinks and radiation accumulates.

**Step 2 (Unitarity application).** By Theorem E.9.5, the evolution of this closed system is unitary:

$$\rho_{\text{total}}(t) = U(t)\rho_{\text{total}}(0)U(t)^\dagger$$

Unitary evolution preserves von Neumann entropy:

$$S(\rho_{\text{total}}(t)) = S(U(t)\rho_{\text{total}}(0)U(t)^\dagger) = S(\rho_{\text{total}}(0))$$

by the unitary invariance of von Neumann entropy [von Neumann 1932].

**Step 3 (Conditional capacity bookkeeping).** If the horizon also satisfies the geometric, density-certificate, saturation, additive-ledger, and calibration hypotheses of Theorem E.6 at each time, then its retained boundary budget is proportional to $\mathcal A_H(t)/(4G_{\mathrm{op}})$. If $\mathcal A_H(t)\to0$ within that branch, this budget tends to zero. The fine-grained entropy equality in the corollary follows from the retained unitary alone; interpreting the changing tensor factors as transfer to radiation and horizon–radiation correlations uses this additional horizon branch.

**Step 4 (Page curve emergence — horizon entropy-continuity branch).** The entanglement entropy between radiation and remaining black hole, $S_{\mathrm{ent}}(t)=S(\rho_{\mathrm{rad}}(t))$ for the reduced radiation state, follows the Page curve only on the explicitly marked horizon entropy-continuity branch supplied by Theorem K.3.

**Horizon Entropy-Continuity Branch Hypothesis (Trace-Coupled Coupling Certificate).** There is a coupling of the PU reduced early-radiation state $\rho_E^{\mathrm{PU}}(t)$ and the Haar reduced state $\rho_E^{\mathrm{Haar}}(t)$ such that, almost surely,
$$
T_t
=
\frac12\left\|\rho_E^{\mathrm{PU}}(t)-\rho_E^{\mathrm{Haar}}(t)\right\|_1
\le\varepsilon_t,
\qquad
0\le\varepsilon_t\le1-\frac1{d_E(t)}.
$$
This certificate is the additional horizon entropy-continuity promotion certificate $\mathfrak C_{\mathrm{PageTV}}$ of Definition K.3d.4c. It may be attached to an accepted horizon moment-operator design certificate $\mathfrak C_{\mathrm{Hdesign}}$ (Definition K.3d.4), to the Golay-expander certificate of Definition K.3d.4a, or to an accepted scrambling-saturation certificate $\mathfrak C_{\mathrm{scr}}$ (Definition F.10.4b.6a) that includes the required design and trace-continuity entries. The bare moment certificate alone supplies only moment/purity control, and capacity saturation alone does not supply fast scrambling. When the trace-coupled promotion is accepted, the certified error is denoted $\varepsilon_{\mathrm{Page}}$. Supporting framework elements include:

- The modular chaos bound of Theorem F.10.4b.5 controls the maximum OTOC growth rate on KMS/OTOC branches
- An accepted $\mathfrak C_{\mathrm{scr}}$ supplies the separate expander, frame-potential, or approximate-design record needed for fast scrambling
- The thermalization timescale $t_{\mathrm{scramble}}\sim\beta\ln S_{BH}$ is theorem-level only when the mixing/saturation record supplies the logarithmic estimate
- The spectral gap $\Delta_{\mathrm{gap}}>0$ (Lemma E.6.1) supports exponential approach to equilibrium, but it is not by itself a Page-curve trace-distance certificate
Under the trace-coupled coupling certificate, Theorem K.3 (Appendix K) gives, via Audenaert's sharp Fannes inequality,
$$
\left|\mathbb E\,S(\rho_E^{\mathrm{PU}}(t))-S_{\mathrm{Page}}(d_E(t),d_L(t))\right|
\le
\varepsilon_t\ln(d_E(t)-1)+h_2(\varepsilon_t),
$$
where
$$
S_{\mathrm{Page}}(d_E,d_L)
=
\sum_{j=d_>(t)+1}^{d_E(t)d_L(t)}\frac1j
-
\frac{d_<(t)-1}{2d_>(t)},
\qquad
d_<=\min\{d_E,d_L\},\
d_>=\max\{d_E,d_L\},
$$
and $h_2(x)=-x\ln x-(1-x)\ln(1-x)$. The error term reduces to $\varepsilon_{\mathrm{Page}}\ln(d_E-1)+h_2(\varepsilon_{\mathrm{Page}})$ when the certified bound replaces $\varepsilon_t$. If only a second-moment ($t_{\mathrm{des}}=2$) design certificate is accepted, the theorem-level conclusion is the Haar Page-purity law of Corollary K.3.1 rather than the full von Neumann entropy law.

On the trace-coupled Page branch, the Page curve has the following leading behavior:

- *Early times* ($d_E\ll d_L$): $S_{\mathrm{ent}}(t)\approx\ln d_E(t)$, increasing with the radiation factor.
- *Page turnover* ($d_E\approx d_L$): $S_{\mathrm{ent}}$ is maximal when $\ln d_E\approx\ln d_L$. If coarse thermodynamic bookkeeping gives $\ln d_E\approx S_{\mathrm{rad}}$ and $\ln d_L\approx S_{\mathrm{BH}}$, this condition is $S_{\mathrm{rad}}\approx S_{\mathrm{BH}}$; each is approximately one half of the initial entropy when their sum is conserved.
- *Late times* ($d_E\gg d_L$): $S_{\mathrm{ent}}(t)\approx\ln d_L(t)$, which equals $\mathcal A_H(t)/(4G)$ only on the separately calibrated horizon-entropy branch.

**Step 5 (Final state).** At complete evaporation ($\mathcal{A}_H \to 0$), unitarity (Theorem E.9.5) guarantees that the final radiation state $\rho_{\text{rad}}^{\text{final}}$ is pure if the initial state was pure: $S(\rho_{\text{rad}}^{\text{final}}) = S(\rho_{\text{initial}}) = 0$. All information is encoded in the radiation correlations. ∎

**Remark E.9.5.1: Status of horizon entropy-continuity and scrambling certificates.** The trace-coupled coupling certificate of Step 4 is an additional entropy-continuity promotion certificate $\mathfrak C_{\mathrm{PageTV}}$ (Definition K.3d.4c). It may be attached to an accepted moment-operator, Golay-expander, or scrambling-saturation certificate (Definitions K.3d.4, K.3d.4a, and F.10.4b.6a), but no one of these supplies the others unless the relevant finite records are explicitly included. On a branch carrying the relative-entropy contraction trace-coupling certificate of Definition K.3d.4d, Theorem K.3d.4e converts the certified relative-entropy contraction estimate into the required trace-distance error. Without that additional contraction or trace-coupling certificate, Landauer entropy accounting, OTOC growth, spectral gaps, and moment control remain supporting evidence rather than a first-principles derivation of the von Neumann Page-curve trace coupling. The supporting framework elements below are status-preserved:

*(i) Supporting evidence:*
- The spectral gap $\Delta_{\text{gap}} = -\tau^{-1}\ln f_{\text{RID}} > 0$ (Lemma E.6.1) ensures exponential mixing
- a separately registered detailed-balance/physical-time or complete-passivity certificate selects the physical equilibrium branch; Proposition G.1.9.2 alone supplies only a conditional lower-production preference


- The modular chaos bound limits $\lambda_L$, and $\mathfrak C_{\mathrm{scr}}$ is the separate finite record required to promote a horizon branch to fast scrambling

*(ii) Required for first-principles Page-curve derivation:*
- A trace-distance or relative-entropy continuity certificate for the radiation state
- A frame-potential, approximate-design, or expander-mixing calculation for the retained horizon channel
- Verification that the entropy comparison uses the same retained algebra and capacity valuation as the horizon-area ledger

*(iii) Independence of core result:* The central claim—information conservation via unitarity (Steps 1–3)—is independent of the trace-coupled entropy-continuity promotion certificate and follows directly from Theorem E.9.5. The von Neumann Page curve (Step 4) provides additional structure only under that stated certificate; bare moment-design control gives the Page-purity branch, and bare scrambling control gives disturbance-spreading rather than entropy continuity.

**Corollary E.9.5.2a (Information-Paradox Status Split).** The black-hole information result in Corollary E.9.5.2 has two status layers:

1. **Structural conservation layer:** closed-system unitarity and finite channel-capacity transfer imply that information is not fundamentally destroyed; it is relocated into horizon-radiation and radiation-radiation correlations.

2. **Entropy-continuity branch layer:** von Neumann Page-curve behavior follows only under the trace-coupled horizon entropy-continuity promotion certificate stated in Step 4. A bare moment-design certificate gives the Page-purity branch rather than the full entropy curve.

*Proof.* Fine-grained information conservation uses the closed retained-algebra hypotheses of Theorem E.9.5 and unitary invariance of von Neumann entropy. It does not require the area law. A horizon-capacity transfer interpretation additionally requires the time-indexed geometric, density-certificate, saturation, additive-ledger, and calibration branch of Theorem E.6. Step 4 separately adds the trace-coupled entropy-continuity certificate to compare reduced radiation entropy with the Page average through Audenaert continuity. Without that certificate, conservation remains valid; a retained moment-design certificate supplies the Page-purity row but not the von Neumann entropy curve. ∎

**Definition E.9.5d (Retained Finite-Response Horizon Channel).** On a refining sequence of finite operational covers $\{\mathcal U_n\}$ carrying an accepted finite KMS-descent certificate of Definition F.10.12a, the retained finite-response horizon channel is the tuple
$$
\mathfrak H_n^{\mathrm{ret}}
=
\left(
\mathcal A_n^{\mathrm{ret}},
\mathcal A_n^{\mathrm{coarse}},
\pi_{\mathrm{hor},n},
U_n,
\ker_{\mathrm{hid}}\pi_{\mathrm{hor},n},
g_{\mathrm{hor},n}
\right)
\tag{E.9.5d.1}
$$
with the following entries.

1. $\mathcal A_n^{\mathrm{ret}}$ is the finite retained protocol algebra over $\mathcal U_n$ after quotienting response-null labels by Corollary P.6.1b.8 and Theorem D.1d.

2. $\mathcal A_n^{\mathrm{coarse}}\subseteq\mathcal A_n^{\mathrm{ret}}$ is the finite subalgebra accessible to the exterior coarse-grained horizon protocol, equivalent to the channel min-cut quotient of Theorem E.6 applied to the cover.

3. $\pi_{\mathrm{hor},n}:\mathcal A_n^{\mathrm{ret}}\to\mathcal A_n^{\mathrm{coarse}}$ is the conditional expectation onto the exterior coarse-grained subalgebra.

4. $U_n:\mathcal A_n^{\mathrm{ret}}\to\mathcal A_n^{\mathrm{ret}}$ is the microscopic PU update channel on the retained algebra at scale $n$, obtained from the closed-system unitary evolution of Theorem E.9.5 restricted to retained finite responses.

5. $\ker_{\mathrm{hid}}\pi_{\mathrm{hor},n}$ is the kernel of $\pi_{\mathrm{hor},n}$ inside the retained quotient. It contains only response-hidden retained classes. Response-null surplus has already been removed before forming $\mathcal A_n^{\mathrm{ret}}$.

6. $g_{\mathrm{hor},n}>0$ is the finite violation gap assigned by the retained algebra record to any update class that merges two distinct retained finite-response classes. Because $\mathcal A_n^{\mathrm{ret}}$ is finite, this gap may be taken as the minimum positive retained-response violation cost over the excluded non-injective update classes.

**Theorem E.9.5e (No Fundamental Deletion in the Retained Algebra).** Suppose the finite KMS-descent certificate of Definition F.10.12a is accepted on the cover $\mathcal U_n$, the retained finite-response horizon channel $\mathfrak H_n^{\mathrm{ret}}$ of Definition E.9.5d is constructed, and $U_n$ is injective on retained finite-response classes. Then no two distinct retained finite-response classes are merged by the microscopic horizon update. Apparent equality after $\pi_{\mathrm{hor},n}$ is exterior coarse-graining, not deletion in $\mathcal A_n^{\mathrm{ret}}$.

*Proof.* Let $[A],[B]\in\mathcal A_n^{\mathrm{ret}}$ with $[A]\ne[B]$. By the injectivity hypothesis, $[U_n(A)]\ne[U_n(B)]$. Therefore $U_n$ does not identify distinct retained finite-response classes. The exterior projection $\pi_{\mathrm{hor},n}$ may still satisfy $\pi_{\mathrm{hor},n}(U_n(A))=\pi_{\mathrm{hor},n}(U_n(B))$, in which case $U_n(A)-U_n(B)\in\ker_{\mathrm{hid}}\pi_{\mathrm{hor},n}$ by Definition E.9.5d. This is exterior coarse-graining, not deletion in $\mathcal A_n^{\mathrm{ret}}$. ∎

**Definition E.9.5f (Exterior Recovery Sufficiency Certificate).** An exterior recovery sufficiency certificate for the cover $\mathcal U_n$ is a finite record
$$
\mathfrak S_{\mathrm{hor},n}
=
(\mathfrak H_n^{\mathrm{ret}},\mathcal C_n,s_n,\epsilon_n)
\tag{E.9.5f.1}
$$
where $\mathcal C_n\subseteq\mathcal A_n^{\mathrm{coarse}}$ is the coarse exterior record retained by the protocol, $s_n:\mathcal C_n\to\mathcal A_n^{\mathrm{ret}}$ is a finite section on the image of $\pi_{\mathrm{hor},n}\circ U_n$, and $\epsilon_n\ge0$ is the certified recovery error in the retained response norm. It is accepted when
$$
\left\|s_n(\pi_{\mathrm{hor},n}(U_n(A)))-U_n(A)\right\|_{\mathrm{ret}}
\le
\epsilon_n
\tag{E.9.5f.2}
$$
for every retained generator $A$ in the finite protocol algebra, with $\epsilon_n$ fixed before comparison. Exact deterministic exterior recovery is the special case $\epsilon_n=0$; a refining deterministic recovery theorem uses a sequence with $\epsilon_n\to0$.

**Theorem E.9.5f.1 (Exterior Recovery Only under Sufficiency).** If $\mathfrak S_{\mathrm{hor},n}$ is accepted, then the map $\mathcal R_n=s_n$ recovers the retained horizon update from the coarse exterior record with certified error $\epsilon_n$:
$$
\left\|\mathcal R_n(\pi_{\mathrm{hor},n}(U_n(A)))-U_n(A)\right\|_{\mathrm{ret}}
\le
\epsilon_n.
\tag{E.9.5f.3}
$$
Without such a sufficiency certificate, Theorem E.9.5e proves no fundamental deletion in the retained algebra but does not assert deterministic recovery from the exterior coarse algebra alone.

*Proof.* The recovery estimate is exactly (E.9.5f.2) with $\mathcal R_n=s_n$. If the certificate is absent, $\pi_{\mathrm{hor},n}$ may identify distinct retained updates that differ by an element of $\ker_{\mathrm{hid}}\pi_{\mathrm{hor},n}$. The injectivity of $U_n$ on the retained algebra prevents deletion before projection but does not construct a section of the exterior projection. ∎

**Corollary E.9.5f.2 (Recovery/Page Separation).** The exterior recovery certificate $\mathfrak S_{\mathrm{hor},n}$ and the Page/design scrambling certificates are distinct promotion gates. $\mathfrak S_{\mathrm{hor},n}$ supplies deterministic recovery in retained response norm. A Page-curve or Page-purity statement requires the separate moment-design, frame-potential, or trace-continuity certificate of Appendix K. Neither gate follows from retained-algebra conservation alone.

*Proof.* Theorem E.9.5e uses only retained injectivity. Definition E.9.5f adds a finite section of the exterior projection. Appendix K adds design or trace-continuity estimates comparing reduced radiation states to a Page reference. These are different finite maps and have different error norms, so Theorem P.14.1f blocks promotion from one gate to the other without an explicit overlap certificate. ∎

**Corollary E.9.5e.1 (Status of the Horizon Sector).** On every branch carrying an accepted finite KMS-descent certificate of Definition F.10.12a and injective retained update $U_n$, the horizon structural-conservation row of Convention P.14.1k is closed by Theorem E.9.5e. The exterior recovery row is certificate-complete only after an accepted exterior recovery sufficiency certificate $\mathfrak S_{\mathrm{hor},n}$ is supplied. The von Neumann Page-curve estimate remains on the trace-coupled entropy-continuity branch of Corollary E.9.5.2a and Definition K.3d.4c; without that promotion, a moment-design certificate supplies only the Page-purity row.

*Proof.* For the structural-conservation row, $Q_S$ is the finite family of retained horizon update classes on $\mathcal A_n^{\mathrm{ret}}$, $\sim_S$ is equality of retained response presheaves, $\mathcal R_S$ is the finite protocol response family on the retained algebra, $V_S$ is the PCE cost restricted to horizon update data, $q_S^*$ is the injective retained update class supplied by Theorem E.9.5, and $\Pi_S$ are the overlap maps to the accepted KMS and emergent-metric rows. A non-injective deletion class merges two distinct retained finite-response classes, so it fails at least one retained protocol response and is excluded by the PPI quotient or assigned violation cost at least $g_{\mathrm{hor},n}$ by the accepted retained algebra record. Hence the no-deletion structural layer is closed by Theorem E.9.5e, and its strict-certificate reading is closed by Theorem D.8.9b when the retained algebra record supplies the gap $g_{\mathrm{hor},n}$ of Definition E.9.5d. Exterior recovery from $\mathcal A_n^{\mathrm{coarse}}$ requires the additional finite section data of Definition E.9.5f; without that data, Theorem E.9.5f.1 explicitly forbids promotion to deterministic exterior recovery. The Page-curve estimate requires the separate scrambling assumption of Corollary E.9.5.2a. ∎

**Corollary E.9.5e.2 (Page-Curve Branch Status).** The structural-conservation layer of Corollary E.9.5.2a is closed by Theorem E.9.5e under the injectivity hypothesis alone, without invoking the trace-coupled entropy-continuity promotion certificate of Step 4 of Corollary E.9.5.2 or the exterior recovery sufficiency certificate of Definition E.9.5f. The exterior recovery / Page-curve estimate retains its certificate-gated status in Convention P.14.1k and is closed only on the additional acceptance of either the exterior recovery sufficiency certificate $\mathfrak S_{\mathrm{hor},n}$ (for deterministic exterior recovery via Theorem E.9.5f.1) or the horizon entropy-continuity promotion certificate $\mathfrak C_{\mathrm{PageTV}}$ of Definition K.3d.4c (for the von Neumann Page-curve estimate). A bare moment-design certificate closes the Page-purity row only.

*Proof.* Theorem E.9.5e uses only the unitary closure of Theorem E.9.5 on the retained algebra and the injectivity hypothesis. It does not invoke the trace-coupled entropy-continuity promotion certificate of Step 4 of Corollary E.9.5.2, nor the recovery-section property of Definition E.9.5f. Therefore the structural-conservation layer of Corollary E.9.5.2a is closed regardless of those additional hypotheses. The exterior recovery and Page-curve layers each require an additional certificate as noted, by Theorem E.9.5f.1 and Definition K.3d.4c respectively. ∎

---

**Corollary E.9.5.3 (Unitarity Is Sufficient but Not Necessary for Persistent Predictability).** The unitary retained-ledger dynamics of Theorem E.9.5 preserves global distinguishability and is compatible with sustained prediction. POP alone does not imply unitarity, because nonunitary dynamics can support a persistent better-than-random prediction task.

*Proof.* Let $(X_t)_{t\ge0}$ be the stationary binary Markov chain with
$$
\Pr(X_{t+1}=X_t\mid X_t)=q,
\qquad
\Pr(X_{t+1}\ne X_t\mid X_t)=1-q,
\qquad \frac12<q<1,
$$
and stationary law $\Pr(X_t=0)=\Pr(X_t=1)=1/2$. Its transition matrix is
$$
P=\begin{pmatrix}q&1-q\\1-q&q\end{pmatrix}.
$$
This stochastic evolution is not a unitary permutation when $q\in(1/2,1)$. Nevertheless, the predictor $\widehat X_{t+1}=X_t$ has accuracy
$$
\Pr(\widehat X_{t+1}=X_{t+1})=q>\frac12
$$
at every time in the stationary process. Thus a sustained one-step better-than-random prediction task exists under nonunitary dynamics.

Long-lag mutual information may decay because the nontrivial eigenvalue of $P$ is $2q-1\in(0,1)$, but POP's one-step predictive regularity remains stationary. A deterministic reset supplies a second counterexample: after one step the future state is known with certainty even though information about the initial state is erased. Therefore information conservation is sufficient for reversible global evolution under Theorem E.9.5's automorphism hypotheses, but it is not a necessary condition for predictability or POP satisfiability. $\square$

---

**Corollary E.9.5.4 (Reduced Channels of a Unitary Pair Evolution).** Let $U_{AB}$ be the unitary representative of a retained pair automorphism and let $\rho_B$ be an assigned environment state. Then
$$
\mathcal E_A(\rho_A)
=\operatorname{Tr}_B\!\left[U_{AB}(\rho_A\otimes\rho_B)U_{AB}^\dagger\right]
$$
is CPTP. It is strictly contractive only when an additional hypothesis, such as the refresh/minorization decomposition of Lemma E.1, supplies a contraction coefficient below one.

If the input is $\rho_A\otimes\rho_B$ and $\rho'_{AB}=U_{AB}(\rho_A\otimes\rho_B)U_{AB}^\dagger$, then
$$
I(A:B)_{\rho'}
=S(\rho_A')+S(\rho_B')-S(\rho_A)-S(\rho_B)
=\Delta S_A+\Delta S_B
\ge0.
\tag{E.9.5.4a}
$$
Neither $\Delta S_A$ nor $\Delta S_B$ has a definite sign.

*Proof.* A unitary conjugation followed by partial trace is CPTP. Unitary invariance and product additivity give
$$
S(\rho'_{AB})=S(\rho_A\otimes\rho_B)=S(\rho_A)+S(\rho_B),
$$
which yields (E.9.5.4a) from the definition of mutual information. Nonnegativity follows from subadditivity. If $U_{AB}$ is SWAP, $\rho_A$ is mixed, and $\rho_B$ is pure, then $\rho_A'$ is pure and $\Delta S_A=-S(\rho_A)<0$, proving that no marginal sign claim is available. The identity unitary gives the identity reduced channel, proving that dilation alone does not imply strict contraction. The registered-reset entropy bound is a separate thermodynamic statement and does not equal the correlation term in (E.9.5.4a). $\square$

### E.9.5.10 Numerical Values

For reference, we collect the key numerical values appearing in this section:

| Quantity | Symbol | Value | Source |
|:---------|:-------|:------|:-------|
| MPU Hilbert space dimension | $d_0$ | 8 on the minimal branch | Theorem 23; Theorem Z.2 |
| Structural entropy cost | $\varepsilon_0$ | $\ln 2 \approx 0.693$ nats | Proposition 5; Definition 28; Theorem J.1 |
| Physical implementation cost | $\varepsilon_{\mathrm{phys}}$ | $H_q(P\mid R)+\varepsilon_{\mathrm{diss}}\ge H_q(P\mid R)$ on a registered reset branch | Theorem 31; Theorem J.1 |
| Maximum structural channel capacity | $C_{\max}$ | $\ln d_0 - \varepsilon_0 = 2\ln 2 \approx 1.386$ nats | Eq. E.15 (Appendix E) |
| Contractivity factor bound | $f_{\text{RID}}$ | $\le 1-p$ for some $p\in(0,1]$ (refresh weight) | Lemma E.1 |
| MPU spacing / Planck length | $\delta/L_P$ | $\sqrt{8\ln 2} \approx 2.355$ | Appendix Q, Eq. Q.18 |

### E.9.5.11 Concluding Remarks

**Remark E.9.5.2: Relation to Standard Quantum Mechanics.** In standard quantum mechanics, unitarity is postulated as an axiom governing closed-system evolution (Postulate 2 of von Neumann's formulation [von Neumann 1932]). In the finite-response PU ledger, the closed-system result is sharper and algebraic: once the complete retained Cauchy-surface response algebra evolves by $*$-automorphisms, finite-dimensional matrix-algebra structure forces those automorphisms to be unitary conjugations.

The key insight is that while reduced ND-RID channels may be strictly contractive on refresh/minorization branches ($f_{\mathrm{RID}}<1$, Lemma E.1), this contractivity is a reduced-subsystem phenomenon. The complete retained pair ledger evolves by the unitary representative of Lemma E.9.5.3, and tracing or restricting to a subsystem can produce apparent non-unitarity without destroying retained global information. The derivation applies to internally closed retained ledgers; open systems exhibit apparent non-unitarity through coupling to degrees of freedom outside the subsystem being described, consistent with the standard quantum formalism and with Corollary E.9.5.4.

**Remark E.9.5.3: Consistency with Arrow of Time.** Global unitarity (Theorem E.9.5) and thermodynamic irreversibility (Appendix O, Theorem O.3) are compatible because they describe different operational levels:

- *Global level:* The von Neumann entropy of the total closed-system state is conserved under $U_{\text{total}}$. If $\rho_{\text{total}}(0)$ is pure, it remains pure throughout evolution.

- *Subsystem level:* Every physical observer occupies a subsystem perspective, accessing only reduced states via partial trace. Reduced-state entropy can increase through correlations with inaccessible degrees of freedom. On a separate registered-reset branch satisfying Definition 28, Theorem 31 gives $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)$; that heat ledger does not quantify the correlation information.

Appendix O's thermodynamic arrow holds only on its common forward/reverse path-measure and positive entropy-production branch. Predictor embedding or a perspectival subsystem split alone does not ensure a thermodynamic ratchet for every observer. Global retained unitarity, reduced-state entropy change, registered-reset heat, and pathwise entropy production therefore remain compatible but logically distinct ledgers.

**Remark E.9.5.4: Derivational Priority.** The framework places unitarity and conditional thermodynamic irreversibility in compatible but logically distinct ledgers. Unitarity follows on the closed retained-ledger branch carrying the response-product-preserving $*$-automorphism certificate of Lemma E.9.5.3 and Theorem E.9.5. The registered-reset inequality $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)$ follows from Definition 28 and Theorem 31. These results describe global retained dynamics and a specified reset implementation, respectively.

The parallel derivation structure:

$$
\text{SPAP}
\xrightarrow[\text{Thm 31}]{\varepsilon_0=\ln2,\ \varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)\quad(\text{registered reset branch; a positive floor requires }H_q(P\mid R)\ge h_{\min}>0)}
\begin{cases}
\text{Branch I:} & C_{\max}\le\ln d_0-\ln2 \to S_{BH}=\mathcal A/(4G) \\
\text{Branch I-ref:} & f_{RID}<1\to C_{\max}<\ln d_0 \\
\text{Branch II:} & U_{AB}\text{ unitary}\to\text{global unitarity (internally closed)}
\end{cases}
$$

demonstrates that the causal capacity bounds, refresh-branch contraction, and global unitarity are complementary level-distinct consequences of a single source: the thermodynamic cost of self-referential prediction.

**Remark E.9.5.5: Role of Closed-System Assumption.** The derivation of global retained unitarity (Theorem E.9.5) critically depends on the closed retained-ledger reading of Hypothesis 1. Closedness alone means that no retained information is exchanged with degrees of freedom accessible to internal systems; PPI completeness further requires the total retained response algebra on a complete Cauchy surface to carry the full internal response ledger. These conditions are necessary, but not sufficient, to make a general CPTP update unitary. The missing load-bearing condition is the pairwise response-product preservation certificate stated in Remark E.9.5.3a, i.e. that the complete retained pair update is a $*$-automorphism rather than merely an injective CPTP map.

Thus the theorem-level content is
$$
\text{closed complete retained ledger}
+
\text{pairwise }*\text{-automorphism certificate}
+
\text{dimension conservation}
\Longrightarrow
\text{unitary total representative}.
$$
Without the automorphism certificate, a closed dissipative CPTP map would not be forced to be unitary. With the certificate, Lemma E.9.5.3 converts the finite-dimensional algebraic automorphism statement into unitary dynamics.

The assumption admits a natural extension to systems with external observation (Appendix P.5). An observation channel satisfying Definition P.5.3 permits external information extraction while preserving internal closure: internal systems gain no information from the channel ($\Delta I_{int} = 0$) and internal states are not modified by external reading. From the internal perspective, such a system satisfies Assumption E.9.5.1, and Theorem E.9.5 applies to its internal dynamics. The external observer incurs the thermodynamic cost $\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)\quad(\text{registered reset branch; a positive floor requires }H_q(P\mid R)\ge h_{\min}>0)$ in their own context (Theorem 33), consistent with the Reflexivity Constraint.

---


## E.10 Conditional Serialized Propagation and Reset-Cost Bounds

This section separates two independent ledgers: a conditional thermodynamic cost for physically registered resets and a kinematic speed bound for separately registered serialized finite-range propagation. Neither ledger alone proves a Lieb--Robinson commutator estimate.

### E.10.1 Conditional Reset Cost of Correlation Extension

**Definition E.10.1 (Registered Correlation-Extension Cost).** Let a retained path use $n$ channels, and let $J_{\mathrm{reset}}\subseteq\{1,\ldots,n\}$ be the set of channel uses that physically reset a memory register $P_j$ while retaining side information $R_j$. For every $j\in J_{\mathrm{reset}}$, record
$$
\varepsilon_{\mathrm{reset},j}
\ge H_{q_j}(P_j\mid R_j).
$$
The registered reset contribution and total PCE comparison are
$$
S_{\mathrm{reset}}:=\sum_{j\in J_{\mathrm{reset}}}\varepsilon_{\mathrm{reset},j},
\qquad
\Delta V_{\mathrm{corr}}:=V_{\mathrm{prop}}+\gamma S_{\mathrm{reset}},
$$
where $\gamma\ge0$ is a declared conversion coefficient. Theorem 31 supplies this inequality only for the registered reset operation. A per-use floor of $\ln2$ requires a conditionally uniform binary register with no retained predictive side information; it is not a consequence of SPAP alone.

**Lemma E.10.1 (Metric Link-Count Bound).** If every edge in a serialized path has propagation-metric length at most $\delta$, then a path spanning distance $R$ uses
$$
n\ge\left\lceil\frac{R}{\delta}\right\rceil
$$
edges. Equality requires a separately exhibited geodesic path whose edges attain the length bound.

*Proof.* The triangle inequality gives $R\le\sum_{j=1}^{n}\ell_j\le n\delta$. Taking ceilings proves the bound; neither geometric regularity nor a continuum approximation proves equality. ∎

**Theorem E.10.1 (Conditional Linear Reset-Cost Comparison).** Assume the metric hypotheses of Lemma E.10.1, one registered reset per traversed edge so that $J_{\mathrm{reset}}=\{1,\ldots,n\}$, constants $h_{\min}>0$ and $\gamma>0$ with
$$
H_{q_j}(P_j\mid R_j)\ge h_{\min}
$$
for every use, and no unrecorded negative term in the declared PCE comparison. Then
$$
S_{\mathrm{reset}}\ge h_{\min}\left\lceil\frac{R}{\delta}\right\rceil,
\qquad
\Delta V_{\mathrm{corr}}-V_{\mathrm{prop}}
\ge\gamma h_{\min}\left\lceil\frac{R}{\delta}\right\rceil.
$$
This is a conditional cost lower bound. It does not establish kinematic locality, exponential clustering, or a Lieb--Robinson commutator bound; those require their standard independent locality and interaction hypotheses.

*Proof.* Sum the registered conditional-entropy inequalities over the at least $\lceil R/\delta\rceil$ traversed edges and multiply by $\gamma$. ∎

### E.10.2 Serialized Propagation-Speed Bound and Conditional Attainment

**Summary of Theorem E.10.2 (Serialized Propagation-Speed Bound and Conditional Attainment).** Assume that (i) propagation between non-adjacent MPUs is implemented by serialized nearest-neighbor ND-RID traversals, (ii) each traversed edge has length at most $\delta$ in the retained propagation metric, and (iii) each edge traversal takes at least a separately registered time $\tau_{\min}>0$. Then every serialized propagation path satisfies
$$
v_{\mathrm{ser}}\le \frac{\delta}{\tau_{\min}}.
$$
If, in addition, a retained one-link propagation process attains length $\delta$ in time $\tau_{\min}$ and the continuum scale identification fixes
$$
\frac{\delta}{L_P}=\frac{\tau_{\min}}{t_P},
$$
then the supremum is attained and
$$
v_{\max}^{(\mathrm{ser})}=\frac{\delta}{\tau_{\min}}=\frac{L_P}{t_P}=c.
$$
Theorem 29 identifies an internal operational generator and characteristic timescale; it does not by itself establish hypothesis (iii) for every distinguishable transition or the one-link attainment hypothesis.

*Proof.* A serialized path spanning metric distance $R$ requires at least $R/\delta$ successive edge traversals. Hypothesis (iii) therefore gives
$$
t(R)\ge \frac{R}{\delta}\,\tau_{\min},
$$
and hence
$$
\frac{R}{t(R)}\le \frac{\delta}{\tau_{\min}}.
$$
This proves the upper bound. Equality requires an admissible propagation process attaining both the length and time bounds. Under the stated one-link-attainment and scale-identification hypotheses,
$$
v_{\max}^{(\mathrm{ser})}=\frac{\delta}{\tau_{\min}}=\frac{L_P}{t_P}=c.
$$
Without attainment, the argument proves only the displayed upper bound. ∎

*Remark: Relation to Standard Lieb-Robinson Bounds.* A Lieb-Robinson estimate derives a finite commutator-growth velocity from locality, bounded interactions, and finite interaction range. The conditional argument above is a serialized path bound from separately declared metric and timing hypotheses. A reset-entropy ledger may motivate a physical implementation cost, but it neither establishes the traversal-time hypothesis nor proves attainment by itself.

**Corollary E.10.1 (Activity-Conditioned Propagation Dissipation).** Let $r_{\mathrm{upd}}$ be the realized rate of completed registered reset-support updates, and let $\bar h$ be their mean conditional entropy $H_q(P\mid R)$ on the declared ensemble. Then
$$
\frac{dS_{\mathrm{env}}}{dt}
\ge r_{\mathrm{upd}}k_B\bar h.
\tag{E.10.3}
$$
For a serialized uniform path with link length $\delta$ and $v=r_{\mathrm{upd}}\delta$,
$$
\frac{1}{k_B}\frac{dS_{\mathrm{env}}}{dt}
\ge\frac{\bar h}{\delta}v.
\tag{E.10.4}
$$
The specialization $\bar h=\ln2$ requires a conditionally uniform binary reset with no retained side information. On the registered edge-clock branch of Theorem E.10.2, $r_{\mathrm{upd}}\le1/\tau_{\min}$; this is a rate ceiling, not a positive activity floor. At separately registered saturated activity, the right-hand side becomes $k_B\bar h/\tau_{\min}$.

*Proof.* Apply Theorem 31 to each completed registered reset and average over the realized update ensemble. The path identity $v=r_{\mathrm{upd}}\delta$ gives (E.10.4). The clock premise supplies only the stated upper rate bound. ∎

**Corollary E.10.2 (Conditional Locality Bound in the Serialized ND-RID Regime).** On the branch of Theorem E.10.2, locality and the speed bound use three independent inputs:
1. a nearest-neighbor successive serialization rule;
2. a separately registered positive edge-traversal duration $\tau_{\min}$ and link-length bound $\delta$;
3. the retained propagation metric and its declared edge-weight bounds.

A reset-entropy ledger and PCE optimization may constrain implementation cost, but they do not establish these kinematic inputs. For a path of $n$ edges, the branch assumptions give $t\ge n\tau_{\min}$ and distance at most $n\delta$, hence
$$
v\le\frac{\delta}{\tau_{\min}}.
$$
The scale identification converts this into the numerical upper bound $c$; equality requires the additional one-link-attainment hypothesis. ∎

### E.10.3 Summary

| Result | Statement | Origin |
|:-------|:----------|:-------|
| Theorem E.10.1 | Linear long-range cost holds only under its registered reset-operation and benefit certificates | Conditional PCE ledger |
| Theorem E.10.2 | $v_{\mathrm{ser}}\le\delta/\tau_{\min}$; equality with $c$ only under one-link attainment and scale identification | Registered serialized edge clock + spacing; separate attainment |
| Corollary E.10.1 | $dS_{\mathrm{env}}/dt\ge r_{\mathrm{upd}}k_B\bar h$ for the registered reset ensemble | Conditional Landauer ledger + realized rate |


| Corollary E.10.2 | Serialized locality gives a conditional speed upper bound | Registered serialization, edge clock, spacing, and metric bounds |

The registered serialized branch yields a finite operational speed upper bound from its edge-length and edge-time data. An attained light-cone speed and the equality $c=\delta/\tau_{\min}$ require the separate one-link-attainment, scale-identification, and Corollary 46a/Appendix O Lorentzian hypotheses. They do not follow from entropy cost or PCE optimization alone.

---


## E.11 Conclusion

This appendix gives a conditional operational area-law construction, bulk and horizon refinements, and the two scoped results of Section E.10: registered reset operations can carry a linear implementation cost, while independent serialized edge-length and edge-time hypotheses give a propagation-speed upper bound. The area-law argument has two branch-qualified stages:

**Stage 1 (Boundary Correlations and Operational Area Law, Sections E.6.1–E.6.3):** On the independently registered local many-body branch, the finite-range and bounded-strength hypotheses give a Lieb-Robinson bound; the refresh/minorization branch separately gives a mixing gap; and exponential clustering requires the additional uniform certificate in Lemma E.6.1. A distribution-free boundary law holds for mutual information in finite-range Gibbs states under Theorem E.4a. A von Neumann entanglement-entropy area law is theorem-level in the stated one-dimensional gapped setting; the higher-dimensional entanglement area inequality remains the explicit ansatz of Theorem E.4'.

**Stage 2 (Operational Channel Counting, Sections E.6.4–E.6.5):** A completed reset gives the support-loss capacity bound of Proposition E.2a. Strict contraction requires the independent full-state refresh/minorization decomposition of Lemma E.1, and Theorem E.2 supplies the strict capacity bound only on that branch. Together with the boundary-density certificate of Theorem E.3, these inputs yield the operational area-law coefficient on the stated branch. The standard $1/(4G)$ normalization and the residual-budget values remain branch calibrations.
**Synthesis:** Equation (E.9) links the emergent coupling $G$ to microscopic MPU parameters. Identifying this $G$ with the experimentally measured Newton constant is a calibration step; after calibration, Equations E.14–E.16 constrain the allowed microscopic parameter combinations. Section 12 uses the proportionality $\delta S\propto\delta\mathcal{A}$ to derive the Einstein Field Equations via the Clausius relation.