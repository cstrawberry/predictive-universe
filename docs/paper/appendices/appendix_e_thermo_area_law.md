# Appendix E: Thermodynamic Limits and Horizon Entropy Area Law

**E.1 Introduction**

This appendix separates three questions: the heat required to reset a physical record, the information that an interaction channel can carry, and the amount of information that can be supported across a boundary. Under additional density and calibration conditions, the boundary count produces the familiar horizon-area relation used later in the gravity argument.

**Technical ledger.**

This appendix develops branch-qualified information-theoretic and thermodynamic bounds for Non-Deterministic Reflexive Interaction Dynamics (ND–RID, Definition 6, Definition A.2.2) governing the MPU 'Evolve' process (Definition 27). Registered reset ledgers and refresh/minorization channels give distinct capacity statements. Geometric link counting gives an area-scaling upper bound, while the saturated Horizon Entropy Area Law of Theorem 49 additionally requires the density certificate, capacity-achieving code, entropy-saturating response distribution, additive channel ledger, and operational calibration stated in Theorem E.6. The gravity derivation in Section 12 consumes that complete horizon branch together with its own local-equilibrium hypotheses.

The derivation proceeds logically:
1.  Separate the structural reset-support value $\varepsilon_0=\ln2$ (Proposition 5; Appendix J, Theorem J.1) from the physical implementation bound $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)$ on the registered reset branch of Definition 28 and Theorem 31; a positive uniform floor inferred from this entropy bound requires $H_q(P\mid R)\ge h_{\min}>0$. (Section E.2: Theorem E.1, Corollary E.1)
2.  Establish the reset-support capacity deficit caused by a registered completed reset: resetting an $r$-dimensional factor inside the $d_0$-dimensional MPU Hilbert space bounds the completed-cycle capacity by $C(\mathcal E_N)\le\ln d_0-\ln r$, hence by $\ln d_0-\ln2$ for a binary reset. SPAP alone does not register this architecture. (Section E.4: Proposition E.2a)
3.  Establish strict trace-distance contractivity ($f_{\mathrm{RID}} < 1$) and the corresponding strict capacity bound ($C(\mathcal{E}_N)<\ln d_0$) on the separate refresh/minorization branch where the averaged channel contains a nonzero input-independent full-state refresh component. (Section E.3: Lemma E.1; Section E.4: Theorem E.2)
4.  Establish the geometric scaling of effective independent boundary information channels, conditional on emergent geometric regularity (Theorem 43), incorporating correlation effects. (Section E.5: Theorem E.3)
5.  Synthesize the per-channel and boundary-count bounds into the conditional area bound of Theorem E.6; obtain equality on its capacity-achieving, entropy-saturating, additive-ledger branch; and define the operational coupling through the Bekenstein–Hawking normalization. (Section E.6)
6.  Perform a structural consistency check linking the emergent Planck scale to microscopic MPU parameters. (Section E.7)

Natural units where $\hbar=c=k_B=1$ are used for core derivations, restored where appropriate. Dimensionless quantities like entropy, capacity, $\varepsilon_0$, and $\varepsilon_{\mathrm{phys}}$ are in nats.

**Convention E.0 (Binary-Support/Physical-Reset Ledger Separation).** The value $\varepsilon_0=\ln2$ is the log-cardinality of a binary reset-support alphabet. Physical reset heat is distribution-sensitive and is recorded separately through $q(P,R)$. Neither ledger implies the refresh-mixture hypothesis of Lemma E.1.

**E.2 Irreversibility and Thermodynamic Costs of Reflexive MPU Interactions**

Let $\mathcal I_N=\{\mathcal E_{N,o}\}_{o\in O}$ be a normalized quantum instrument and let $\mathcal E_N=\sum_o\mathcal E_{N,o}$ be its average CPTP channel. Instrument normalization fixes probabilities and poststates; it does not determine a thermodynamic implementation.

**Theorem E.1 (Conditional Physical Reset Ledger).** Let $P$ be a classical pre-reset record, let $R$ contain every classical record retained and unchanged through the reset, and let $q(P,R)$ be their actual joint law. Assume the physical implementation, complete-erasure, and convergence hypotheses of Definition 28, applied to this record: the initially Gibbs bath at $T>0$ is independent of all non-bath resources, the joint dynamics include every entropy-bearing resource, and the auxiliary state and correlation ledger closes as declared there. Then
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
The memory entropy change is $-k_BH_q(P\mid R)$. The thermodynamic entropy exported with heat is $\langle Q_{\mathrm{bath}}\rangle/T=k_B\varepsilon_{\mathrm{reset}}$; this is not generally the finite bath's von Neumann entropy change. The thermodynamic excess ledger is $k_B\varepsilon_{\mathrm{diss}}$. An additive measurement or feedback term requires a separate theorem and a no-double-counting ledger.

*Proof.* First take the finite-resource balance, and write $S$ for dimensionless von Neumann entropy. Let $M$ contain all non-bath degrees of freedom, including $(P,R)$ and the auxiliary resources. Complete erasure and unchanged retained memory give
$$
S(PR)_{\mathrm{in}}-S(PR)_{\mathrm{out}}
=H_q(P,R)-H_q(R)
=H_q(P\mid R).
$$
The auxiliary state and correlation closure in Definition 28 makes the same entropy difference hold for $M$. The initial state is $\rho_M\otimes\tau_B$, and joint unitarity therefore gives
$$
S(B)_{\mathrm{out}}-S(B)_{\mathrm{in}}
=H_q(P\mid R)+I(M:B)_{\mathrm{out}}.
$$
For the bath Hamiltonian $H_B$ and its initial Gibbs state $\tau_B=e^{-\beta H_B}/\operatorname{tr}(e^{-\beta H_B})$, where $\beta=(k_BT)^{-1}$, the definition of relative entropy gives
$$
\beta\langle Q_{\mathrm{bath}}\rangle
=S(B)_{\mathrm{out}}-S(B)_{\mathrm{in}}
+D(\rho_{B,\mathrm{out}}\Vert\tau_B).
$$
Consequently
$$
\varepsilon_{\mathrm{reset}}-H_q(P\mid R)
=I(M:B)_{\mathrm{out}}
+D(\rho_{B,\mathrm{out}}\Vert\tau_B)
\ge0.
$$
This is the complete-erasure specialization of the conditional balance in Reeb and Wolf (2014, Section 5.1, Equation (59)); both terms are nonnegative. Definition 28's convergence hypotheses transfer the inequality to the declared ideal limits. The finite physical bath entropy change equals $\langle Q_{\mathrm{bath}}\rangle/T-k_BD(\rho_{B,\mathrm{out}}\Vert\tau_B)$, so replacing that entropy change by heat divided by temperature requires an additional reservoir limit. ∎

**Corollary E.1 (Conditional Thermodynamic Irreversibility).** Under Theorem E.1, the reset has positive thermodynamic excess exactly when $\varepsilon_{\mathrm{diss}}>0$. Positive bath heat may occur at reversible Landauer saturation because the memory entropy decreases. Information gain or nonunitarity of $\mathcal E_N$ alone supplies no positive excess bound without a registered implementation ledger.

*Proof.* The thermodynamic excess ledger is
$$
\frac{\langle Q_{\mathrm{bath}}\rangle}{T}+\Delta S_{PR}
=k_B\bigl(\varepsilon_{\mathrm{reset}}-H_q(P\mid R)\bigr)
=k_B\varepsilon_{\mathrm{diss}}.
$$
It is positive exactly when $\varepsilon_{\mathrm{diss}}>0$. At saturation $\varepsilon_{\mathrm{reset}}=H_q(P\mid R)$, which can be positive. This ledger is distinct from the conserved fine-grained entropy of the complete joint unitary state. The proof uses the registered reset, not information gain or channel nonunitarity. ∎

**E.3 Strict Contractivity of the Average 'Evolve' Channel**

On the refresh/minorization branch, the averaged `Evolve` channel contains a nonzero input-independent full-state refresh component and is strictly trace-distance contractive. A registered completed reset by itself yields only Proposition E.2a's support-capacity deficit; it does not require full-state contraction.


**Lemma E.1 (Strict Contractivity of the Average "Evolve" Channel).**
Let $\{\mathcal E_{N,o}\}_o$ be a normalized quantum instrument whose outcome maps are completely positive and trace-nonincreasing, and let its average ND–RID "Evolve" channel be the CPTP map
$$
\mathcal{E}_N(\rho)=\sum_o \mathcal{E}_{N,o}(\rho).
$$
Assume the averaged dynamics contains a nonzero input-independent refresh component: there exist a CPTP map $\Psi$, an input-independent state $\sigma\in\mathcal{S}(\mathcal{H}_{d_0})$, and a weight $p\in(0,1]$ such that
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
Because $\Psi$ is CPTP, it contracts trace distance between states, hence contracts the trace norm of traceless Hermitian operators. If $\Delta=0$, both sides of (E.2) vanish. Otherwise, write the Jordan decomposition $\Delta=\Delta_+-\Delta_-$ with $\Delta_\pm\succeq0$ and $\mathrm{Tr}(\Delta_+)=\mathrm{Tr}(\Delta_-)=t=\tfrac12\|\Delta\|_1>0$. Then $\Delta=t(\rho_+-\rho_-)$ with $\rho_\pm:=\Delta_\pm/t$ states, so
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
    It is always true that $\chi^{\ast}(\Phi)\le C(\Phi)\le\ln d_0$. For the PU framework, we are interested in the true information transmission rate $C(\mathcal{E}_N)$. The following theorem establishes that this rate is strictly less than the ideal maximum on the stated refresh/minorization branch.


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

**Corollary E.2a.0 (Exact Capacity of the Completed-Reset Normal Form).** Under the exact channel hypotheses of Proposition E.2a,
$$
C(\Phi)=\ln(d_0/r).
\tag{E.2a-exact}
$$
For any orthonormal basis $\{|k\rangle_K\}_{k=1}^{d_0/r}$ and any unit vector $|r_0\rangle_R$, the input states
$$
\rho_k
=
U^\dagger
\bigl(|k\rangle\!\langle k|_K\otimes|r_0\rangle\!\langle r_0|_R\bigr)
U
\tag{E.2a-code}
$$
produce the mutually orthogonal outputs
$$
\Phi(\rho_k)=|k\rangle\!\langle k|_K\otimes|0\rangle\!\langle0|_R.
$$
The uniform ensemble is a one-use zero-error code attaining $\ln(d_0/r)$ nats, and its product code attains that rate at every block length.

*Proof.* Substitution of (E.2a-code) into Proposition E.2a's channel gives the displayed orthogonal outputs. Their uniform mixture is maximally mixed on the $d_0/r$-dimensional retained output support and every individual output is pure, so the Holevo information is $\ln(d_0/r)$. Orthogonal measurement decodes with zero error. Hence $C(\Phi)\ge\ln(d_0/r)$, while Proposition E.2a gives the reverse inequality. ∎

**Resolution TV-AREA-02-R1.** Corollary E.2a.0 gives `positive-discharge` of the exact regularized capacity, achieving ensemble, and explicit code for the frozen completed-reset normal form. Exact capacity of a different refresh/minorization channel still depends on its complete channel specification; the refresh weight alone does not determine it.

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
| Mixing/primitivity, unique full-rank stationary state (Sanz et al. 2010) | Refresh/minorization with $\sigma\succ0$ (Lem E.1) | A nonzero refresh weight $p>0$ and a full-rank refresh state |
| Data-processing contraction $f_{RID}<1$ (Thm N.10, App C, App K transport) | Refresh/minorization (Lem E.1) | Strict trace-distance contraction across multiple cycles |
| Born-rule / GNS / independently registered noncontextuality and Born-domain completeness | Independent of branch | Algebraic selector package; PCE supplies only its quotient/cost interpretation and neither capacity route is invoked |

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

**Proposition E.2a.5 (Capacity-Threshold Commit Gate).** Suppose $C_{\max}>0$, $\tau_s$ is finite, $I_\ell$ is $C^1$ on $[0,\tau_s]$, $I_\ell(0)=0$, $\dot I_\ell(t)>0$ on $(0,\tau_s]$, $\dot I_\ell(t)$ is nondecreasing up to $\tau_s$, and the armed link carries maintenance rent $\Phi_\ell>0$ per unit time. For the renewal-cycle cost per verified nat
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

**Gate E.2a.G1 (Decaying-Flux Landauer-Dominance Record).** For a deterministic registered acquisition curve, retain all hypotheses of Proposition E.2a.5 except that $\dot I_\ell$ need not be nondecreasing. In particular, $C_{\max}>0$, $\tau_s<\infty$, $\varepsilon_0>0$, $\Phi_\ell>0$, $I_\ell(0)=0$, and $I_\ell$ is $C^1$ with $\dot I_\ell>0$ up to saturation; the retained ledger does not decrease after saturation. Suppose the finite record certifies
$$
\Phi_\ell\bigl(I_\ell(\tau)-\tau\dot I_\ell(\tau)\bigr)
\le
\varepsilon_0\dot I_\ell(\tau)
\qquad
(0<\tau\le\tau_s).
$$
This is exactly the derivative sign condition $c'(\tau)\le0$ before saturation. Together with the strictly increasing post-saturation cost, it certifies $\tau_s$ as a deterministic minimizer and yields Proposition E.2a.5's expected-cost to expected-payload inequality for randomized stopping rules. Its uniqueness conclusion and equality only at $\tau_s$ additionally require $c(\tau)>c(\tau_s)$ for every $0<\tau<\tau_s$; strict inequality in the displayed gate for every such $\tau$ is sufficient. Without that extra comparison, equality may occur at other deterministic minimizers. If the weak gate is not certified, timing remains a branch arming predicate rather than a theorem-level threshold.

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
Here $\mathcal A_R$ is the retained register alphabet, $I_{\mathrm{acq}}^R(t)$ is the certified acquired retained information in nats, $C_{\max}^{(R)}$ is the registered threshold in nats, and $\epsilon_{\mathrm{meter}}\ge0$ is the pre-locked information residual in nats. A timing tolerance must be converted through the certified acquisition law before entering this residual; for example, a bound $\lvert\dot I_{\mathrm{acq}}^R\rvert\le M$ on the comparison interval gives $\lvert\delta I\rvert\le M\lvert\delta t\rvert$, with $M$ measured in nats per unit time. For a certified binary one-register interface,
$$
C_{\max}^{(R)}=\ln2,
\qquad
\Delta C_R\ge \ln2-\epsilon_{\mathrm{meter}}
$$
is the metered subledger threshold. This does not replace the link-cycle threshold $C_{\max}$ of Definition E.2a.4 unless the certificate identifies the retained link with that one-register interface.

**Corollary E.2a.9 (Stationary Metered Event Rate).** On a branch carrying $\mathfrak C_{\mathrm{meter}}(R)$ with stationary acquisition flux
$$
I_{\mathrm{acq}}^R(t)=\dot I_{\mathrm{acq}}^R t,
\qquad
\dot I_{\mathrm{acq}}^R\ge0,
\qquad
C_{\max}^{(R)}>0,
$$
and with no overwrite before commit, the nominal first-passage metered event rate is
$$
\Gamma_{\mathrm{Evolve}}^{(R)}=\frac{\dot I_{\mathrm{acq}}^R}{C_{\max}^{(R)}}.
$$
For the binary one-register subledger this becomes $\Gamma_{\mathrm{Evolve}}^{(R)}=\dot I_{\mathrm{acq}}^R/\ln2$. Comparisons with realized firing times or measured event rates retain the registered meter residual. The residual-budget link branch remains $\dot I/C_{\max}$ and gives $\dot I/(2\ln2)$ only on the residual-budget minimal branch of Proposition E.2a.5.

*Proof.* If $\dot I_{\mathrm{acq}}^R=0$, the positive nominal threshold is never reached and the nominal event rate is zero. If $\dot I_{\mathrm{acq}}^R>0$, the first nominal commit occurs when $I_{\mathrm{acq}}^R(t)=C_{\max}^{(R)}$, at time $C_{\max}^{(R)}/\dot I_{\mathrm{acq}}^R$; its reciprocal is the displayed rate. A nonzero meter residual belongs to the comparison between this nominal first passage and realized firing. The link-cycle formula uses the separate ledger of Definition E.2a.4. ∎

**Remark E.2a.10 (Metered Subledger Guardrail).** A $\ln2$ threshold is a certified binary-register acquisition threshold, not a universal per-link ND-RID threshold and not a heat quantum. Reversible writing or acquisition need not dissipate heat. A physical lower bound arises only for a separately registered erase, reset, or overwrite satisfying Theorem 31, in which case the bound is distribution-sensitive through $H_q(P\mid R)$; verification, syndrome, recovery, and implementation overhead remain separate ledger entries.

**Proposition E.2a.11 (Canonical Causal First-Passage Meter).** Let $I_{\mathrm{acq}}^R(t)$ be an adapted, right-continuous, nondecreasing retained-information process on a registered no-overwrite interval, with $I_{\mathrm{acq}}^R(0)=0$, and fix $C_{\max}^{(R)}>0$. Define
$$
M_R(t):=\min\{I_{\mathrm{acq}}^R(t),C_{\max}^{(R)}\},
\qquad
A_R(t):=\mathbf1\{M_R(t)=C_{\max}^{(R)}\},
\tag{E.2a.11.1}
$$
and
$$
\tau_R:=\inf\{t>0:I_{\mathrm{acq}}^R(t)\ge C_{\max}^{(R)}\}.
\tag{E.2a.11.2}
$$
Then $M_R$ and $A_R$ are adapted and nondecreasing. If the threshold set is empty, $A_R$ never fires. Otherwise right-continuity gives $A_R(t)=0$ for every $t<\tau_R$ and $A_R(t)=1$ for every $t\ge\tau_R$. Thus the meter is causal and has no early firing. If the registered acquisition curve is deterministic and satisfies all of Proposition E.2a.5's renewal-cost hypotheses, committing at its first firing is the unique deterministic cost minimizer, and that proposition also supplies the expected-cost to expected-payload bound for randomized stopping rules. No such unrestricted expected-ratio optimality is asserted for a general random acquisition process.

*Proof.* Equation (E.2a.11.1) uses only the acquisition history available at time $t$, so adaptedness is preserved. Monotonicity of $I_{\mathrm{acq}}^R$ makes both displayed processes nondecreasing. If the threshold set is nonempty, the definition of its infimum gives $I_{\mathrm{acq}}^R(t)<C_{\max}^{(R)}$ before $\tau_R$. A decreasing sequence of threshold times converging to $\tau_R$, right-continuity, and monotonicity give $I_{\mathrm{acq}}^R(\tau_R)\ge C_{\max}^{(R)}$; monotonicity then preserves that inequality. This proves the firing statements. On the deterministic acquisition branch with its complete hypotheses, Proposition E.2a.5 supplies the optimization conclusion because its minimum cost is a common constant in the expectation inequality. ∎

**Resolution TV-EACT-01-R1 (Metadata).** Exact domain: adapted, right-continuous, nondecreasing retained-information processes on a registered no-overwrite interval. Premises: a positive certified threshold and, for the unrestricted renewal-cost optimization claim, a deterministic registered acquisition curve satisfying all of Proposition E.2a.5's hypotheses. Equivalence: meters are compared by their firing history on the same acquisition filtration. Budget: the full registered interval through first passage. Verifier: adaptedness, right-continuity and monotonicity checks, exact first-passage comparison and, on the deterministic acquisition branch, Proposition E.2a.5. Falsifier: early firing, decrease on the interval or dependence on a future acquisition value. Provenance class: source-internal stopping-rule construction. Downstream consumers: Definition 27, `TV-MPU-02` and owner `TV-EACT-01`. Nonvacuity: $I_{\mathrm{acq}}^R(t)=vt$ with a registered constant $v>0$. This is `positive-discharge` of the mathematical renewal/meter component at its stated scope; population of $\mathfrak C_{\mathrm{meter}}(R)$ and physical realization remain `C+R`-open.



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

The area bound requires a separately registered $D=4$ manifold and boundary geometry. Theorem 43 supplies only regularity of certified global minimizers; Theorem 43.5/44–45 supply the manifold branch, while Lemma E.5.1 and Theorem E.3 supply the independent boundary-count and density certificates.

**Theorem E.3 (Boundary Channel Density from Geometric Regularity and Density Certificate).**
Conditional on the verified strict-comparator geometric-regularity branch of Theorem 43, consider the MPU network $\mathcal N$ whose emergent geometry is described on the separate operational-continuum branch by a $D=4$ dimensional manifold $(M,g_{\mu\nu})$ satisfying uniform volume growth and bounded Ricci curvature. Let $\mathcal H\subset M$ be a smooth, compact, two-dimensional boundary surface, such as a causal-horizon cross-section, with area $\mathcal A=\operatorname{Area}(\mathcal H)$. Geometric regularity gives the deterministic upper bound of Lemma E.5.1. On the density-certificate branch where the macroscopic transversality/orientation factor $\eta$ and independence factor $\chi$ exist, the total number of effective independent information channels $N_{eff_links}$ crossing $\mathcal H$ has the asymptotic area density
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

*   Let $\chi$ be a dimensionless independence factor ($0 < \chi \le 1$) defined so that the effective independent-link count satisfies $N_{eff_links}=\chi N_{geom_links}$. Thus $\chi=1$ corresponds to statistically independent boundary links and $\chi<1$ quantifies the reduction in effective independent channels due to cross-link correlations. The effective density is then $\sigma_{eff_link}=\chi/(\eta\delta^2)$; the conditional coordinate assignments are given by Lemmas Q.2.2–Q.2.3 on their separate throughput-saturated branches; their simultaneous use does not establish a coupled equilibrium.

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

**Theorem E.5.2 (Exact Cubic Refinement Certificate for the Lower Area Law).** Fix $n,L\in\mathbb N$ with $N:=Ln$ even and $N\ge8$, let $h=1/n$, and take the nearest-neighbor cubic graph on the periodic box
$$
\Lambda_{n,L}=(h\mathbb Z/(L\mathbb Z))^3.
\tag{E.5.2.1}
$$
In the ambient flat three-torus, let $A_{n,L}$ be the slab $h/2<x<L/2+h/2$, with $x$ read modulo $L$, and let $\mathcal H_{n,L}:=\partial A_{n,L}$. Its two flat two-torus components are the planes $x=h/2$ and $x=L/2+h/2$, separated by $L/2$, and its total area is $\mathcal A=2L^2$. Then:

1. every graph edge with one endpoint in $A_{n,L}$ and one outside it is normal to $\mathcal H_{n,L}$ and has length $h$, and the number of these crossing edges is exactly
$$
N_{\partial}=2N^2=\frac{\mathcal A}{h^2};
\tag{E.5.2.2}
$$
2. let $\mathcal S_{n,L}:=\{h/2,L/2+h/2\}\times(h\mathbb Z/(L\mathbb Z))^2$ be the surface-cell centers on $\mathcal H_{n,L}$. For $h\le r\le L/4$, with each closed ball centered in the corresponding discrete set, the lattice vertices and surface-cell centers satisfy uniform lower and upper Ahlfors counts
$$
c_3(r/h)^3\le\#(B_r\cap\Lambda_{n,L})\le C_3(r/h)^3,
\qquad
c_2(r/h)^2\le\#(B_r\cap\mathcal S_{n,L})\le C_2(r/h)^2;
\tag{E.5.2.3}
$$
3. assign to each crossing edge an independent binary symmetric channel with crossover $\epsilon\in(0,1/2)$. For independent edge parameters $\vartheta_e$, the joint response Fisher matrix is diagonal with entries
$$
I_{ee}=\frac{1}{\epsilon(1-\epsilon)}>0,
\tag{E.5.2.4}
$$
after using the crossover probability as local coordinate. Hence its effective response rank is exactly $N_{\partial}$ and $\chi=1$;
4. along any sequence $n,L\to\infty$, the normalized count obeys
$$
h^2N_{\mathrm{eff}}=\mathcal A,
\tag{E.5.2.5}
$$
so the density remainder is identically zero and in particular is $o(\mathcal A)$.

*Proof.* Each of the $N^2$ lattice sites in the plane $x=0$ has one nearest-neighbor edge into the slab through $x=h/2$, and each of the $N^2$ sites in the plane $x=L/2$ has one edge out through $x=L/2+h/2$. No tangential edge crosses either component. Hence $N_{\partial}=2N^2=\mathcal A/h^2$, proving (E.5.2.2) and transversality for an actual region boundary. The normal tube is embedded for radii below $L/4$. Since $N\ge8$, one can choose $3h/2<r_{\mathcal H}<L/4$, as required in Lemma E.5.1 with $\delta=h$ and $m=1$. Disjoint open radius-$h/2$ balls around lattice vertices give its packing estimate with $C_{\mathrm{pack}}=6/\pi$; the flat tube has volume $2r\mathcal A$ for $r<L/4$.

For (E.5.2.3), a ball of radius at most $L/4$ has no periodic identification within its interior, and a ball centered on one surface component does not meet the other component. In dimension $d=2$ or $3$, an inscribed cube of coordinate radius $r/\sqrt d$ and a circumscribed cube of coordinate radius $r$ give
$$
\left(2\left\lfloor\frac{r}{h\sqrt d}\right\rfloor+1\right)^d
\le \#(B_r\cap h\mathbb Z^d)
\le \left(2\left\lfloor\frac rh\right\rfloor+1\right)^d.
$$
For $r/h\ge1$, the left side is at least $d^{-d/2}(r/h)^d$ and the right side is at most $3^d(r/h)^d$. Thus $c_2=1/2$, $C_2=9$, $c_3=3^{-3/2}$ and $C_3=27$ suffice uniformly.

For each registered input bit, the observed error bit of its BSC response is Bernoulli with crossover coordinate $\vartheta_e$. At $\vartheta_e=\epsilon$, its score has mean zero and second moment $1/[\epsilon(1-\epsilon)]$. Independence of the edge experiments therefore makes the joint Fisher matrix diagonal with these positive entries. Its rank is $N_{\partial}=2N^2$. Consequently $N_{\mathrm{eff}}=N_{\partial}$ and $h^2N_{\mathrm{eff}}=2L^2=\mathcal A$, proving (E.5.2.5) and the zero remainder. ∎

**Resolution TV-EAREA-01-R1 (Metadata).** Exact domain: cubic periodic refinements (E.5.2.1) with even $N=Ln\ge8$, the registered half-box slab $A_{n,L}$ with its two-component boundary, and the full product family of crossing BSC responses to registered input bits. Premises: nearest-neighbor edges, $\epsilon\in(0,1/2)$ and the declared geometric embedding. Equivalence: channels are identified only when their labeled edge-response experiments agree. Budget: all lattice vertices, edges, both sets of surface-cell centers and response coordinates at every admitted $n,L$. Verifier: exact crossing-edge census, tube and packing checks, cube/ball comparison and Fisher-rank computation. Falsifier: a nontransverse crossing, violation of either Ahlfors count, a rank defect or a nonzero normalized remainder. Provenance class: source-internal refining-network construction. Downstream consumers: Theorem E.3, Lemma E.5.1, Theorem E.6 and `TV-EAREA-01`. Theorem E.5.2 certifies transversality, matching lower counts, full effective independence/rank and zero $o(\mathcal A)$ remainder on this refining family, giving `positive-discharge` of `TV-EAREA-01`.

## E.6 Conditional Area Bounds from Local Many-Body and Boundary-Channel Structure

This section separates three statements: rigorous local many-body correlation bounds on their stated hypotheses, a higher-dimensional entanglement ansatz where no general theorem is available, and the operational boundary-channel bound of Theorem E.6. Operational equality additionally requires the capacity-achieving, entropy-saturating, and additive-ledger entries stated below. Identifying $G_{\mathrm{op}}$ with measured Newton $G$ is a separate external calibration, not an antecedent of the channel equality.

### E.6.1 Local Many-Body Branch Prerequisites

**Lemma E.6.1 (Locality, Finite Propagation Speed, Mixing, and Clustering).**
Assume a selected ND-RID implementation carries the following local many-body data and, where indicated, their additional consequences:

1. **Local implementation hypothesis:** Take the registered cycle duration $\tau>0$ and use the graph metric of Proposition F.1 for distances and support diameters. Any physical-distance version must apply the same declared length conversion to the range, separation, and velocity. For the complete averaged network update $\mathcal E_N$, including all refresh, measurement, and reset components that enter that update, register either (a) $\mathcal E_N^*=\alpha_\tau=e^{\tau\mathcal L^*}$ with all local-Lindblad, finite-range, norm, degree, and incidence hypotheses of Proposition F.1, or (b) a depth-$D$ circuit of local CPTP maps whose supports are pairwise disjoint within each layer and have diameter at most $\ell_0$, with $D$ and $\ell_0$ uniform across the network family.
2. **Finite Lieb-Robinson Velocity:** On either registered local implementation branch, for integers $n\ge0$ and local observables $O_A,O_B$,
$$
\|[\mathcal{E}_N^{*n}(O_A),O_B]\| \le C \|O_A\|\|O_B\| e^{-\mu(d(A,B)-v_{\text{LR}} n\tau)}.
\tag{E.3c}
$$
On branch (a), the support factor in Proposition F.1 is included in $C=C_\mu|A|$; no support-independent prefactor is asserted. On branch (b), one may take $v_{\text{LR}}=D\ell_0/\tau$, $C=2$, and any $\mu>0$.
3. **Mixing (trace-distance contraction)**: If $\mathcal{E}_N$ satisfies Lemma E.1 with $f_{\text{RID}}<1$ and is primitive (unique fixed point $\rho_{\text{fix}}$), then for any state $\rho$:
$$
D_{\mathrm{tr}}(\mathcal{E}_N^{n}(\rho),\rho_{\text{fix}})
\le f_{\text{RID}}^{n}\,D_{\mathrm{tr}}(\rho,\rho_{\text{fix}})
\le f_{\text{RID}}^{n}.
\tag{E.4b}
$$
For $0<f_{\text{RID}}<1$, define the (discrete-time) mixing gap $\Delta_{\text{gap}}:=-(1/\tau)\ln f_{\text{RID}}>0$. When $f_{\text{RID}}=0$, the channel reaches $\rho_{\text{fix}}$ after one application; this case has the extended-value convention $\Delta_{\text{gap}}=+\infty$.
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
(2) follows on branch (a) by applying Proposition F.1 at $t=n\tau$. On branch (b), each adjoint gate is unital and acts identically outside its support, so one update enlarges the support by at most $D\ell_0$. The commutator therefore vanishes when $d(A,B)>nD\ell_0$. Elsewhere, operator-norm contractivity gives $\|[\mathcal E_N^{*n}(O_A),O_B]\|\le2\|O_A\|\|O_B\|$, which proves (E.3c) with the declared constants. These propagation bounds use the registered local implementation, not $f_{\mathrm{RID}}$.
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

**Theorem E.4'.1 (Finite-Depth Local-Circuit Area Law and Locality Counterexample).** Let a bounded-degree metric graph carry $q$-dimensional sites, let $|\Omega_0\rangle$ be a product state, and let $U=U_L\cdots U_1$ be a depth-$L$ circuit. In each layer the gates have pairwise disjoint supports, every gate acts on at most $k$ sites, and every support has diameter at most $r$. For every region $A$,
$$
S\!\left(\operatorname{tr}_{\bar A}U|\Omega_0\rangle\!\langle\Omega_0|U^*\right)
\le 2Lk\,|\partial_r A|\ln q,
\tag{E.4'.1.1}
$$
where $\partial_r A$ is the set of sites of $A$ within graph distance $r$ of $\bar A$. This is a theorem-level entanglement area law in every spatial dimension for the declared finite-depth circuit family.

Finite local dimension, bounded interaction degree, uniqueness, and a uniform spectral gap do not imply a geometric area law after metric locality is removed. On $2m$ $q$-level sites with $q\ge2$ and $m\ge1$, divided into $A=\{a_1,\ldots,a_m\}$ and $\bar A=\{b_1,\ldots,b_m\}$, set
$$
H_m=\sum_{j=1}^m\left(I-|\Phi_q\rangle\!\langle\Phi_q|_{a_jb_j}\right),
\qquad
|\Phi_q\rangle=q^{-1/2}\sum_{s=1}^q|s,s\rangle.
\tag{E.4'.1.2}
$$
The terms commute and have disjoint supports, the ground state is unique, and the gap is one, while
$$
S(A)=m\ln q.
\tag{E.4'.1.3}
$$
Embedding the two sets as macroscopic adjacent blocks makes their geometric boundary sublinear in $m$ in dimension greater than one, while the paired interactions have unbounded geometric range. Thus locality is an indispensable hypothesis for a geometric boundary bound.

*Proof.* A gate supported entirely in $A$ or entirely in $\bar A$ does not change the entropy across the cut. A crossing gate can change that entropy by at most twice the logarithm of the Hilbert-space dimension on either side of its support, hence by at most $2k\ln q$. In one layer, disjointness lets each crossing gate be assigned a distinct site in $\partial_r A$, so there are at most $|\partial_r A|$ such gates. The initial entropy is zero; summing the entropy changes over $L$ layers proves (E.4'.1.1).

For (E.4'.1.2), each summand is a projector with eigenvalues zero and one. Disjoint support makes the common zero eigenspace the one-dimensional span of $\bigotimes_j|\Phi_q\rangle_{a_jb_j}$ and makes the first excited energy one. The reduced state on $A$ is $q^{-m}I_{q^m}$, so its entropy is $m\ln q$. The final geometric statement follows because the interaction edges pair bulk sites across distances growing with the block diameter. ∎

**Remark E.6.2a (Rigorous boundary-correlation control at finite temperature).**
For Gibbs states in any dimension, a distribution-free boundary law holds for mutual information (Theorem E.4a), which already captures the PU requirement that total correlations across $\partial A$ are controlled by boundary interaction terms.

### E.6.3 Operational Horizon Entropy Ledger

**Summary of Theorem E.6 (Operational area bound and saturated coupling).** A boundary carries at most the reliable response entropy allowed by its registered channels. On the capacity-achieving, entropy-saturating, additive-ledger branch, the bound is attained and its positive coefficient defines $G_{\mathrm{op}}$ through the Bekenstein--Hawking normalization. Identifying $S_{\mathrm{rel}}$ with thermodynamic horizon entropy and $G_{\mathrm{op}}$ with measured Newton $G$ requires the separate bridges of Remark E.6.3.1.

**Technical ledger.**

Let $\mathcal H$ be a causal-horizon cross-section of area $\mathcal A$ on the branch of Theorem E.3, and let $S_{\mathrm{rel}}(\mathcal A)$ denote the reliable thermodynamic response entropy of the boundary channels crossing $\mathcal H$, as in Theorem E.6. Boundary-channel counting gives
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
A positive conditional-heat floor inferred from this entropy bound requires $H_q(P\mid R)>0$, and positive thermodynamic excess requires $\varepsilon_{\mathrm{diss}}>0$.

*Proof.* The identity $f_{\mathrm{RID}}=1-p<1$ gives $1-p<1$ and hence $p>0$. The remaining display is Theorem E.1 applied only when its registered-reset hypotheses hold. Neither $p>0$ nor information gain determines $H_q(P\mid R)$ or $\varepsilon_{\mathrm{diss}}$. ∎

**Remark E.6.3.3 (Scope of the refresh-parameter identity).** An area-law coefficient by itself does not imply $p>0$ without specifying the microscopic channel branch. A strict gap caused by an unrelated noisy channel, or a coefficient introduced only by calibration, would not prove SPAP refresh. Proposition E.6.3.2 is the exact reverse statement available inside the refresh-parametrized ND-RID branch used in Lemma E.1 and Theorem E.2.

### E.6.4 Connection to Channel Capacity Derivation

Theorem E.3 and Corollary E.2 give the density-branch bound
$$
\frac{S_{\mathrm{rel}}(\mathcal A)}{\mathcal A}
\le
k_B\frac{\chi C(\mathcal E_N)}{\eta\delta^2}+o(1).
$$
Equality holds only under the three saturation entries of Theorem E.6. On that branch, Equation (E.6c) writes the positive saturated coefficient as $1/(4L_{P,\mathrm{op}}^2)=c^3/(4G_{\mathrm{op}}\hbar)$. If the entanglement area-scaling ansatz of Theorem E.4' is also adopted as semiclassical context, matching its coefficient to this operational density is an additional consistency requirement rather than a second derivation.

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
A $\ln2$ floor inferred from this entropy bound requires the separately stated condition $H_q(P\mid R)\ge\ln2$. The notation $\Delta S_{\mathrm{SPAP}}$ is reserved for an explicitly registered physical reset cost and is not identified with $\varepsilon_0$ without that reset ledger.

Assume the saturation and calibration branch of Theorem E.6 and a registered physical reset ledger satisfying $H_q(P\mid R)=\ln2$ with zero excess dissipation. On this branch,
$$
\Delta S_{\text{SPAP}} = \ln 2.
\tag{E.13}
$$
If one further assigns one such reset entropy to each independent effective horizon cell, define $\Delta\mathcal A_{\mathrm{cell}}$ by
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

**Step 3 (Nested reconstruction branch).** For a larger bounded region $A$, choose a center $p$ and $R>0$ such that $A\subset B_R(p)$. Define the clipped radial shells
$$
\mathrm{Shell}_n
:=A\cap\{x:n\epsilon\le d(p,x)<(n+1)\epsilon\},
\qquad
0\le n\le\lfloor R/\epsilon\rfloor.
$$
Then
$$
A=\bigcup_{n=0}^{\lfloor R/\epsilon\rfloor}\mathrm{Shell}_n.
$$

Capacity compatibility on each shell is necessary for a nested reconstruction. If, in addition, the branch supplies compatible shell encodings $\Phi_n$ and recovery maps $\mathcal R_n$ satisfying the finite Petz-sufficiency condition of Definition E.8.1b on overlaps, then Theorem E.8.1c reconstructs each shell's retained response ledger from its boundary ledger. Iterating the compatible maps reconstructs the retained bulk response quotient. Without this encoding/recovery certificate, capacity counting alone does not assert existence of a canonical reconstruction map.

**Step 4 (Independence from global geometry).** The capacity gate uses only local properties:
- local channel density $\sigma_{\mathrm{eff}}$ from the density-certificate branch of Theorem E.3;
- local finite capacity $C_{\max}$ from Proposition E.2a, with refresh-branch strict capacity available from Theorem E.2 when strict contraction is needed;
- local entropy density from the area law (Theorem 49).

No global geometric assumptions such as asymptotic flatness, negative cosmological constant, or conformal boundary enter the capacity gate. Exact reconstruction additionally requires the compatible nested encoding/recovery certificate stated above. ∎

*Remark: Distinction from AdS/CFT.* The holography established here differs fundamentally from AdS/CFT correspondence [Maldacena 1999]. AdS/CFT posits a duality between quantum gravity in anti-de Sitter space and conformal field theory on its boundary, with bulk reconstruction proceeding via the Ryu-Takayanagi formula [Ryu & Takayanagi 2006] and entanglement wedge reconstruction [Dong et al. 2016]. The present construction requires neither AdS geometry nor conformal field theory. Its capacity gate uses the ND-RID channel limits and the geometric density certificate; exact bulk reconstruction additionally requires the compatible nested encoding and Petz-sufficient recovery branch of Definition E.8.1b and Theorem E.8.1c. The two approaches may be complementary descriptions in contexts where both apply.

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
as finite response functors. It is quotient-minimal when no proper response quotient of $\Sigma_R$ has the same exterior-response functor.

Assume a family-wide boundary-sufficiency certificate: one finite boundary object $\Sigma_R$ and one retained channel $\Lambda_{\partial R}$ satisfy (E.8.1g.1) for every code state and every retained exterior protocol. In the quantum branch this may be one CPTP recovery/factorization map valid on the convex hull of the code family; in the classical branch, one sufficient statistic for the full retained experiment. A statewise identity
$$
I(R:\operatorname{ext}\mid\partial R)=0
\tag{E.8.1g.2}
$$
is sufficient only when its Markov recovery maps agree on the whole tested family.

Under this certificate, the finite poset of sufficient response quotients has at least one quotient-minimal screen. Every retained exterior observable factors through every sufficient screen, and interiors with naturally isomorphic screens are indistinguishable by all retained exterior protocols. Minimal screens need not be unique.

A unique PCE-minimal screen up to PPI equivalence follows on either of two explicit closure branches:

1. the screen is constructed as the canonical risk-equivalence quotient of one fixed registered full exterior experiment, and PCE cost is strictly increasing under every sufficient risk-null refinement as in Theorem M.6.11b(5); or
2. a registered coarsest-Blackwell screen $\Sigma_R^*$ is supplied such that every sufficient screen admits a response channel to $\Sigma_R^*$, with equality cases identified by PPI equivalence. The PCE cost is constant on each PPI-equivalence class, and the supplied coarse-graining to $\Sigma_R^*$ strictly lowers that cost for every sufficient screen not PPI-equivalent to $\Sigma_R^*$.

On the selected screen’s registered local KMS and min-cut branch, if the screen carries an entropy identified with the horizon entropy, and that entropy satisfies the certified area-law first variation and quantitative localization remainder required by Theorem 12.1, with all remaining hypotheses of that theorem satisfied on the same retained branch, then its entropy supplies that theorem's boundary input.

*Proof.* The common sufficiency map gives (E.8.1g.1) for the whole finite response experiment. Finiteness gives at least one minimal element, but not uniqueness of minimal elements. Exterior-observable factorization follows directly from (E.8.1g.1), and operational Yoneda identifies naturally isomorphic screen responses in the PPI quotient. On branch 1, Theorem M.6.11b gives the canonical quotient and its strict-cost uniqueness. On branch 2, the coarsest-Blackwell property supplies a response channel from every sufficient screen to $\Sigma_R^*$; any other coarsest screen is Blackwell-equivalent and hence PPI-equivalent under the registered equality rule. The registered cost condition excludes every sufficient screen outside that PPI equivalence class from PCE minimality. The horizon statement follows by substituting the certified screen entropy into the area-law and localization hypotheses of Theorem 12.1 on the stipulated common branch. ∎

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
for every $\rho$ in the convex hull of $\mathcal C_A$. A response-reconstruction branch additionally registers, for each retained bulk protocol with complete outcome POVM $\{O_a\}_a$, an admitted finite boundary protocol realizing $\{\mathcal R_{\sigma,\mathcal E_{\partial A}}^*(O_a)\}_a$ on $\operatorname{supp}\mathcal E_{\partial A}(\sigma)$ within the same declared budget. Any finite nested compositions used for reconstruction must also be admitted within that budget. The algebraic recovery identity alone supplies neither protocol availability nor its resource bound.

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

**Theorem E.8.1i (Exhaustive Linear Three-Qutrit Code Search and Recovery Classification).** Let
$$
\mathcal C_{lin}
=\{(c_1,c_2,c_3)\in\mathbb F_3^3:
\{c_1,c_2,c_3\}=\mathbb F_3\},
\tag{E.8.1i.1}
$$
the frozen six-member class of ordered affine-linear three-share encoders, and define
$$
V_c|s\rangle
=\frac1{\sqrt3}\sum_{r\in\mathbb F_3}
|r+c_1s,r+c_2s,r+c_3s\rangle.
\tag{E.8.1i.2}
$$
Exhaust the $6\cdot8$ candidates $(c,B)$ with $c\in\mathcal C_{lin}$ and boundary subset $B\subseteq\{1,2,3\}$. For every one of them:

1. if $|B|\ge2$, compression to $B$ exactly recovers the full logical operator algebra $M_3$;
2. if $|B|\le1$, its exactly recoverable unital operator system is only $\mathbb C I$;
3. among proper subsets in the frozen class, the minimum carrier dimension for full recovery is $3^2=9$, attained by exactly the three two-share subsets for each of the six encoders;
4. all two-share recoveries have zero error. On a nested inclusion $B\subset C$ with $|B|\ge2$, the recovered logical channels agree exactly; on overlaps of incomparable minimizing pairs, the common recoverable operator system is $\mathbb C I$, on which they also agree exactly.

Indeed, if shares $i,j$ are retained and $k$ is erased, the invertible basis change
$$
|a,b\rangle\longmapsto
\left|s=\frac{b-a}{c_j-c_i},\ 
g=a+(c_k-c_i)s\right\rangle
\tag{E.8.1i.3}
$$
maps every compressed encoded state $\rho$ to
$$
\rho_s\otimes I_g/3.
\tag{E.8.1i.4}
$$
Discarding $g$ is the exact recovery.

*Proof.* The six triples in (E.8.1i.1) exhaust the pairwise-distinct coefficient triples over $\mathbb F_3$. Thus $c_j-c_i\ne0$ and (E.8.1i.3) is invertible. In the partial trace over share $k$, surviving ket and bra terms have the same lost-share value $g=r+c_ks$, so the displayed change of basis gives (E.8.1i.4). This proves full recovery from every pair for every frozen encoder. Conversely, every single share is uniform and independent of $s$, and all off-diagonal logical matrix units vanish after tracing the other two shares. A constant channel cannot recover two distinct logical states, so only scalar observables are one-share recoverable. This exhausts all 48 candidates, proves the minimum, and makes each compatible recovered channel the logical identity; the overlap claims follow. ∎

**Resolution TV-EHOLO-01-R1 (Metadata).** Exact domain: all 48 encoder/subset candidates in the frozen linear class (E.8.1i.1)--(E.8.1i.2), all logical states and the full logical operator algebra. Premises: qutrit computational bases and erasure as the nominated boundary compression. Equivalence: codes are compared by their complete logical response channels on each labeled boundary subset. Budget: every encoder, subset, logical matrix unit and nested/incomparable overlap. Verifier: exhaustive six-triple census, isometry, the decoupling transform (E.8.1i.3), one-share constancy and the complete $6\cdot8$ table. Falsifier: an omitted linear encoder/subset, a non-scalar one-share recovery, failure of any two-share recovery or a nonzero claimed overlap error. Provenance class: source-internal finite network-code search and classification. Downstream consumers: Definition E.8.1b, Theorem E.8.1c, `TV-EHOR-02` and `TV-EHOLO-01`. Theorem E.8.1i gives `positive-discharge` only of the frozen-linear-class minimization, recoverable-system classification and overlap/error component. It does not close `TV-EHOLO-01` over the target's full finite network-code search class.

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

Conversely, assume (E.8.1f.2). Use the channel form of Petz's equality theorem for monotonicity of relative entropy: D. Petz, “Sufficient subalgebras and the relative entropy of states of a von Neumann algebra,” *Communications in Mathematical Physics* **105** (1986), 123--131 gives the faithful-state subalgebra result; the channel statement including non-full-rank $\rho$ is given by M. E. Shirokov, “Monotonicity of the Holevo quantity: a necessary condition for equality in terms of a channel and its applications,” arXiv:1106.3297v6, Theorem 3 in Appendix 6.1. For a CPTP map $\Phi$ and density operators $\rho,\sigma$ with finite relative entropy, equality
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

**Corollary E.8.2 (Conditional Resolution Limit).** Assume the Appendix-Q packing and reset-support saturation branch, and consider a registered cell-label reconstruction whose output labels are the packing-cell centers with declared spacing $\delta$. Its cell-center label spacing is
$$
\delta=\sqrt{8\ln2}\,L_P.
$$
A lower bound on the spatial separation resolvable by all admitted protocols additionally requires a registered spatial decoding and separation certificate for that protocol family. Such a metric-resolution bound does not follow from finite channel capacity or from the cell-center spacing alone.

*Proof.* The packing calibration supplies the displayed value of $\delta$, and the registered reconstruction uses those centers as its output labels. This proves the label-spacing statement. A channel carrying one binary label can distinguish two nominated positions inside the same cell even when their separation is arbitrarily smaller than $\delta$; this uses neither repeated transmissions nor a collective nonlocal encoding and is compatible with the bound $C_{\max}\le2\ln2$. Therefore an operational metric-resolution lower bound requires the additional spatial decoding and separation certificate. $\square$

## E.8.3 Holographic Saturation as PCE Attractor

### E.8.3.1 Introduction

This section asks why a network might fully use its available boundary information capacity. It introduces a cost-and-benefit model in which leaving useful channels idle is costly, and shows that deterministic adaptation reaches full use under the stated assumptions.

**Technical ledger.**

The preceding sections establish the asymptotic bound $S\leq\mathcal A/(4G)+o(\mathcal A)$ on the geometric-regularity, density-certificate, reset-support, and calibration branches of Theorem 49. Proposition E.2a supplies the residual channel budget on its completed binary reset-support branch, while Lemma E.1 supplies strict contractivity on its refresh/minorization branch. This section introduces an additional phenomenological utilization model. Under a registered positive idle-maintenance cost, additive channel accounting, a nondecreasing benefit function, and projected deterministic gradient dynamics, Theorem E.8.3.4 proves that the scalar utilization coordinate reaches $S_{max}=\mathcal A/(4G)$ in finite time. The theorem makes no point-convergence claim for nonzero stochastic forcing and does not prove capacity-achieving channel codes.

The logical statuses are:

| Item | Result | Status |
|------|--------|--------|
| Theorem 31 | $\varepsilon_{\mathrm{reset}}\geq H_q(P\mid R)$ on a registered reset branch; a positive uniform floor inferred from this entropy bound requires $H_q(P\mid R)\geq h_{\min}>0$ | Conditional bound |
| Proposition E.2a | $C_{\max}\leq\ln d_0-\ln2$ on the completed binary reset-support branch | Conditional capacity bound |
| Theorem E.2 | $C_{\max}<\ln d_0$ on the refresh/minorization branch | Conditional strict capacity bound |
| Theorem E.6 / Theorem 49 | $S\leq\mathcal A/(4G)+o(\mathcal A)$ on the density-certificate and calibration branch | Conditional asymptotic area bound |
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

*Proof.* Lemma E.8.3.1 gives $\gamma_{ret}^{\min}=h_{\min}/(\delta C_{\max})$. Substitution yields
$$
\gamma_{ret}^{\min}
=\frac{\ln2}{(\sqrt{8\ln2}\,L_P)(2\ln2)}
=\frac{1}{2\sqrt{8\ln2}\,L_P}.
$$
Since $\sqrt{8\ln2}=2.354820045\ldots$, the coefficient is $1/(2\sqrt{8\ln2})=0.212330450\ldots$. ∎

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
Assume the density, capacity-saturation, and calibration branch with $0<S_{max}<\infty$, on which
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
Assume the serial-access model of Theorem E.8.3.1, the registered-reset and maintenance hypotheses of Lemma E.8.3.2, the additive utilization hypothesis E.8.3.3, and the deterministic projected dynamics of Theorem E.8.3.4. On this branch, boundary encoding minimizes the declared serial retrieval term, unused channels carry the declared incremental opportunity cost, and increasing utilization weakly increases the declared benefit function. The endpoint $S=S_{max}$ is therefore the minimum of this phenomenological potential. These hypotheses do not derive an area bound for implementations outside the branch.

*Proof.* Theorem E.8.3.1 gives the strict serial retrieval-cost comparison under its depth hypotheses. Lemma E.8.3.2 gives a positive reset-entropy cost $\Phi_{idle}$ for each maintained idle channel under its reset and additivity hypotheses. Hypothesis E.8.3.3 separately assigns $\Phi_{idle}$ as the incremental opportunity cost and inserts the benefit $B(S/S_{max})$ with a negative sign in the PCE potential. Under Theorem E.8.3.4,
$$
V'(S)
=-\frac{\Phi_{idle}}{C_{\max}}
-\frac{\Gamma_0}{S_{max}}B'(S/S_{max})
<0,
$$
because $\Phi_{idle}>0$ and $B'\ge0$. Hence $V$ has the unique minimum $S=S_{max}$ on $[0,S_{max}]$. ∎

**Corollary E.8.3.5 (Conditional Interpretation of Saturated Boundary Utilization).**
On the additive utilization branch of Hypothesis E.8.3.3 and under the projected deterministic dynamics of Theorem E.8.3.4, the boundary-utilization coordinate reaches $S_{max}=\mathcal A/(4G)$. If a black-hole horizon is independently identified with a state on this branch, its saturated entropy is compatible with the Bekenstein--Hawking value.

*Proof.* Theorem E.8.3.4 supplies the endpoint $S=S_{max}$ for the stipulated scalar dynamics. Substitution of the calibrated value $S_{max}=\mathcal A/(4G)$ gives the stated compatibility. The theorem contains no evolution equation for matter or geometry, so it does not imply gravitational collapse or uniqueness of a black-hole state. $\square$

### E.8.3.10 Implications for Emergent Gravity

Theorem E.8.3.4 supplies a conditional deterministic saturation mechanism for the utilization variable. Applying it to the local Rindler horizons used in Section 12 requires an additional bridge showing that each such horizon carries the additive utilization potential on the branch of Hypothesis E.8.3.3 and the projected dynamics of Theorem E.8.3.4. Without that bridge, local equilibrium saturation remains a hypothesis of the Clausius-to-field-equation argument rather than a consequence of Appendix E.


**Theorem E.8.3.6 (One-Coordinate Utilization Dynamics and Attained Code Branch).** Let $0<S_{max}<\infty$, $V\in C^2([0,S_{max}])$ and $\eta>0$. For the projected deterministic gradient dynamics
$$
\dot S=\Pi_{T_{[0,S_{max}]}(S)}(-\eta V'(S)),
\tag{E.8.3w.1}
$$
the stationary set is exactly
$$
\{S\in(0,S_{max}):V'(S)=0\}
\cup\{0:V'(0)\ge0\}
\cup\{S_{max}:V'(S_{max})\le0\}.
\tag{E.8.3w.2}
$$
An interior stationary point $S_*$ is locally asymptotically stable exactly when it is an isolated stationary strict local minimum, equivalently when some $\delta>0$ obeys
$$
(S-S_*)V'(S)>0
\qquad(0<|S-S_*|<\delta).
\tag{E.8.3w.2a}
$$
The sign-reversed condition makes an isolated strict local maximum unstable. In particular, the sufficient condition $V'(S)\le-g<0$ on the whole interval makes every deterministic trajectory reach $S_{max}$ with the uniform bound
$$
t_{hit}\le\frac{S_{max}-S(0)}{\eta g}.
\tag{E.8.3w.3}
$$

For the reflected stochastic branch
$$
dS_t=-\eta V'(S_t)dt+\sqrt{2D}\,dB_t+dL_t^0-dL_t^{max},
\qquad D>0,
\tag{E.8.3w.4}
$$
the unique invariant law has density
$$
\rho_D(S)=Z_D^{-1}e^{-\eta V(S)/D}
\tag{E.8.3w.5}
$$
on the full interval. Hence nonzero reflected noise neither reaches and stays at the capacity endpoint nor makes it a point-mass attractor. If, for example,
$$
V_{int}(S)=\kappa(S-S_*)^2,
\qquad \kappa>0,\qquad 0<S_*<S_{max},
\tag{E.8.3w.6}
$$
then $S_*$ is the deterministic asymptotically stable point, and (E.8.3w.5) is the truncated Gaussian density proportional to $\exp[-\eta\kappa(S-S_*)^2/D]$ with unique mode $S_*$. With $\eta,\kappa,S_*$ and the interval held constant, this invariant law concentrates at $S_*$ as $D\downarrow0$; no narrow-concentration claim is made for arbitrary $D>0$.

Capacity attainment is nonempty on the same finite response grammar. For $m\ge1$, take $m$ independent noiseless qutrit boundary pipes and the uniform message ensemble on $\mathbb F_3^m$. The identity product code has
$$
S=H(M)=m\ln3
=\sum_{j=1}^m C_j=S_{max},
\tag{E.8.3w.7}
$$
with zero decoding error. Coupled to any potential with $V'\le-g<0$, this is the attained endpoint of (E.8.3w.1). Under the serial-depth hypotheses of Theorem E.8.3.2, the same endpoint is also the strict boundary-over-bulk optimum.

*Proof.* Projection onto the tangent cone is zero precisely in the cases listed in (E.8.3w.2). For an isolated interior stationary point, the one-dimensional phase-line criterion gives local asymptotic stability exactly when the vector field points strictly toward $S_*$ on both sides, which is (E.8.3w.2a); integrating its sign shows that $S_*$ is a strict local minimum. Conversely, continuity and isolation make $V'$ nonzero with constant sign on each punctured side, and strict minimality forces precisely the signs in (E.8.3w.2a). Reversing both signs gives instability. Under the uniform negative derivative, $\dot S\ge\eta g$ until the endpoint, proving (E.8.3w.3). The zero-flux stationary Fokker--Planck equation for (E.8.3w.4) is
$D\rho'+\eta V'\rho=0$, whose normalized positive solution is (E.8.3w.5). Its zero flux and integration by parts show that it is invariant for the reflected generator
$$
\mathcal L f=Df''-\eta V'f',
\qquad f'(0)=f'(S_{max})=0.
$$
To prove uniqueness, let $\pi$ be any invariant probability law and let $a$ be any continuous function on the interval. Put
$$
g(s)=a(s)-\int_0^{S_{max}}a(u)\rho_D(u)\,du,
\qquad
f'(s)=\frac{1}{D\rho_D(s)}
\int_0^s\rho_D(u)g(u)\,du.
$$
The density is positive and bounded away from zero on the compact interval, so this defines a $C^2$ function $f$ after choosing its additive constant. Its derivative vanishes at both endpoints because $\int\rho_Dg=0$. Using $\rho_D'/\rho_D=-\eta V'/D$ gives $\mathcal Lf=g$. Invariance implies $\int\mathcal Lf\,d\pi=0$, hence $\int a\,d\pi=\int a\rho_D\,ds$ for every continuous $a$. Therefore $\pi$ is exactly the law with density $\rho_D$, proving uniqueness; positivity proves full support. Equation (E.8.3w.6) has the asserted unique deterministic minimum and truncated Gaussian invariant density. For its small-noise concentration, fix a neighborhood radius $r>0$ smaller than the distance from $S_*$ to either endpoint. The mass outside that neighborhood is at most
$$
\frac{S_{max}}{r}\exp\!\left(-\frac{3\eta\kappa r^2}{4D}\right),
$$
by bounding the numerator on $\lvert S-S_*\rvert\ge r$ and the normalizing integral on $\lvert S-S_*\rvert\le r/2$; this bound tends to zero. Finally, a noiseless qutrit pipe has capacity $\ln3$, and the uniform product ensemble attains the additive sum with exact identity decoding, proving (E.8.3w.7). ∎

**Resolution TV-EHOLO-03-R1 (Metadata).** Exact domain: arbitrary $C^2$ scalar utilization potentials on a positive finite interval $[0,S_{max}]$, their projected deterministic flow, their constant-noise reflected diffusion, and the finite product-qutrit attainment branch. Premises: $0<S_{max}<\infty$, $\eta>0$, and $D>0$ on the stochastic branch. Equivalence: implementations are compared by their utilization path law and complete boundary-code response law. Budget: the full interval, both boundaries, every stationary point and all $m$ channel factors. Verifier: tangent-cone signs, isolated-minimum phase-line analysis, the zero-flux equation, Neumann-Poisson uniqueness calculation and exact code entropy/decoding. Falsifier: an omitted stationary branch, a stability claim violating (E.8.3w.2a), endpoint absorption under $D>0$, an incorrect invariant density or a capacity deficit in (E.8.3w.7). Provenance class: source-internal dynamical classification, counterbranch and finite code construction. Downstream consumers: Theorems E.8.3.2--E.8.3.4 and `TV-EHOLO-03`. Theorem E.8.3.6 gives `positive-discharge` only of the declared one-coordinate deterministic/reflected-diffusion and noiseless product-qutrit component. It does not close `TV-EHOLO-03` as a whole or prove coexistence of every target predicate in one formal holographic realization.

### E.8.4 Max-Flow/Min-Cut Form of PU Holography and Shared Reconstruction

**Definition E.8.4a (Finite Predictive Channel Network).** Let $\mathcal N_A=(V,E)$ be a finite directed MPU channel network associated with a region $A$, with nonempty source and sink sets $S,T\subset V$ satisfying $S\cap T=\varnothing$, and finite real edge capacities
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

The finite max-flow/min-cut theorem supplies a feasible flow $f$ of value $\min_\Gamma C(\Gamma)$. If all capacities are rational, choose a rational maximum flow $f$ and a common denominator $q$ for the capacities and flow values. Over a block of $q$ channel uses, route $qf(e)$ message units through each edge; flow conservation pairs incoming and outgoing units at every intermediate vertex, and the edge constraints $f(e)\le C_e$ make every routing feasible. Independent pipe codes achieve every edge rate below $C_e$, so every network rate below the flow value is achievable. For real capacities, choose nonnegative rational capacities $0\le C_e^{(n)}\le C_e$ converging upward to $C_e$, with $C_e^{(n)}=0$ whenever $C_e=0$. Their max-flow values converge to the real max-flow value because the minimum ranges over finitely many cuts. Taking the supremum of achievable rates proves the reverse inequality. $\square$

**Theorem E.8.4b.1 (Joint-Use Polytope Classification).** Retain the classical pipes and routing assumptions of Theorem E.8.4b, but let a nonempty compact convex set
$$
\mathcal P\subseteq[0,1]^E
$$
specify the feasible average edge-use vectors imposed by shared energy, interference, or scheduling. At use vector $u$, edge $e$ has available average capacity $u_eC_e$. If every $u\in\mathcal P$ is achievable by time sharing and pipe codes, then the exact network capacity is
$$
I_{\mathcal P}(S:T)
=\max_{u\in\mathcal P}\min_{\Gamma:S|T}
\sum_{e\in\Gamma}u_eC_e.
\tag{E.8.4b.1.1}
$$
Writing $C_*:=\min_\Gamma\sum_{e\in\Gamma}C_e$, the unconstrained classical value is retained exactly when there exists $u^*\in\mathcal P$ satisfying
$$
\sum_{e\in\Gamma}u_e^*C_e\ge C_*
\qquad\text{for every }S|T\text{ cut }\Gamma.
\tag{E.8.4b.1.2}
$$
Otherwise the shared-resource constraint strictly lowers the value. For two parallel unit-capacity edges and
$$
\mathcal P=\{(u_1,u_2)\in[0,1]^2:u_1+u_2\le1\},
$$
Equation (E.8.4b.1.1) gives $I_{\mathcal P}=1$, while the additive unconstrained cut has capacity $2$.

*Proof.* Fix $u\in\mathcal P$. Theorem E.8.4b applied to the capacities $u_eC_e$ gives the inner minimum in (E.8.4b.1.1). Time sharing realizes every feasible $u$, compactness attains the outer maximum, and no schedule has an average use vector outside $\mathcal P$; hence the displayed maximum is exact. Since $0\le u_e\le1$, every constrained cut capacity is at most its unconstrained value, so $I_{\mathcal P}\le C_*$. Equality holds precisely when some feasible $u^*$ makes every cut at least $C_*$, which is (E.8.4b.1.2). In the two-edge example the only cut has capacity $u_1+u_2\le1$, and equality is attainable, proving the strict counterexample. ∎

This theorem exhausts the classical joint-scheduling branch. Coherent quantum channels, broadcast hyperedges, secrecy resources, and nonadditive channel combinations require their own operational capacity functions and are not classified by the polytope formula.

**Corollary E.8.4c (Area Law as Minimum Predictive Cut).** On the independent classical-pipe branch of Theorem E.8.4b, suppose the PCE-attractor branch has approximately uniform boundary channel capacity $C_{\max}^{*}$ and effective channel density $\sigma_{\mathrm{eff}}$. Let $\{\Gamma_\gamma:\gamma\sim\partial A\}$ represent all separating finite cuts used in that theorem by smooth cut surfaces; the surface family in the minimum consists of these representatives. Assume that
$$
\mathcal A_*:=\min_{\gamma\sim\partial A}\mathcal A(\gamma)>0
$$
is attained and that, along the declared asymptotic family,
$$
C(\Gamma_\gamma)
=C_{\max}^{*}\sigma_{\mathrm{eff}}\mathcal A(\gamma)+r_\gamma,
\qquad
\sup_\gamma|r_\gamma|=o(\mathcal A_*).
$$
This uniform remainder includes both the channel-density and per-channel capacity approximations. Then
$$
I_{\max}(A:A^c)
=
C_{\max}^{*}\sigma_{\mathrm{eff}}
\min_{\gamma\sim\partial A}\mathcal A(\gamma)
+
o(\mathcal A_*).
\tag{E.8.4.4}
$$

*Proof.* Theorem E.8.4b identifies the maximal transmissible predictive information with the minimum over the same finite cuts. Put $R_*=\sup_\gamma|r_\gamma|$. Every cut has capacity at least $C_{\max}^{*}\sigma_{\mathrm{eff}}\mathcal A_*-R_*$. A representative attaining the area minimum has capacity at most $C_{\max}^{*}\sigma_{\mathrm{eff}}\mathcal A_*+R_*$. Hence
$$
\left|I_{\max}(A:A^c)-C_{\max}^{*}\sigma_{\mathrm{eff}}\mathcal A_*\right|
\le R_*
=o(\mathcal A_*),
$$
which proves (E.8.4.4). ∎

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

**Corollary E.8.4f (RT-Type Formula Without AdS Assumptions).** On the independent classical-pipe branch of Theorem E.8.4b, the finite-network holographic bottleneck is a minimum predictive cut. When the regular continuum limit exists and the hypotheses of Corollary E.8.4c hold, the cut functional becomes an area functional with coefficient
$$
C_{\max}^{*}\sigma_{\mathrm{eff}},
$$
where both the saturated per-channel capacity $C_{\max}^{*}$ and the effective channel-density certificate $\sigma_{\mathrm{eff}}$ are required. Shared geometric connectivity represents joint reconstruction advantage on the separate branch of Theorem E.8.4e.

*Proof.* Theorem E.8.4b is purely finite and uses only channel capacities. Corollary E.8.4c converts the finite cut count into an area functional using geometric regularity and the channel-density hypothesis. Theorem E.8.4e identifies the finite invariant underlying connected joint reconstruction. No AdS asymptotics, fundamental metric path integral, or gravitational Hilbert-space factorization enters the argument. ∎

**Corollary E.8.4g (Local Horizon Entropy as Predictive Min-Cut).** On the independent classical-pipe branch of Theorem E.8.4b, let $B$ be a sufficiently small causal diamond on the regular operational-continuum branch, and let $\Gamma_B$ range over finite predictive cuts separating the operational interior of $B$ from its exterior boundary data. On the local horizon-saturation branch, with uniform channel capacity $C_{\max}^{*}$ and effective channel density $\sigma_{\mathrm{eff}}$, assume that this cut family satisfies Corollary E.8.4c, that $\partial B$ realizes its minimum-area representative, and that $C_{\max}^{*}\sigma_{\mathrm{eff}}=1/(4G)$ on the registered calibration branch. Then the horizon entropy is the minimum predictive cut:
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

**Definition E.8.4h (Recovery Length and Recovery Metric).** Let $\mathcal B$ be a finite set of operational reconstruction regions in a finite predictive channel network. For every ordered pair of distinct regions $A,B\in\mathcal B$, register a nonempty family of separating recovery cuts with finite capacities, and define
$$
\chi(A|B)
=
\min_{\Gamma:A|B}C(\Gamma).
\tag{E.8.4.8}
$$
The cuts in this family separate the predictive data required for reconstructing $A$ from the available data in $B$. Set $\chi(A|A)=0$. Define the symmetric one-step recovery length
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

**Theorem E.8.4i (Recovery Geometry from Predictive Channel Capacity).** On the finite-cut domain of Definition E.8.4h, $d_{\mathrm{rec}}$ is a finite pseudometric on $\mathcal B$. After quotienting by the zero-distance relation
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

**Corollary E.8.4j (Metric Limit under a No-Shortcut Certificate).** Let $r_\epsilon\downarrow0$. At each resolution, register a finite set $P_\epsilon$ of geometric representatives and an injective identification $p\mapsto A_\epsilon(p)$ with the retained reconstruction labels. Define $d_{\mathrm{rec},\epsilon}$ by shortest chains using only the declared admissible one-step pairs between these representatives; all other one-step operations are excluded. Assume that admissible pairs satisfy $d_g(p,q)\le r_\epsilon$, that a minimizing $g$-geodesic between every pair in $P_\epsilon$ can be partitioned into admissible steps with all partition points in $P_\epsilon$, and that a function $\omega(r)\downarrow0$ gives the uniform estimate
$$
\left|\ell_{\mathrm{rec}}(A_\epsilon(p),A_\epsilon(q))-\mu d_g(p,q)\right|
\le\omega(r_\epsilon)d_g(p,q)
\tag{E.8.4.11}
$$
for all admissible pairs, with $\mu>0$. Then for registered sequences $p_\epsilon\to p$ and $q_\epsilon\to q$ in the metric $d_g$,
$$
\frac{d_{\mathrm{rec},\epsilon}(A_\epsilon(p_\epsilon),A_\epsilon(q_\epsilon))}{\mu}
\longrightarrow d_g(p,q).
$$
On an independent classical-pipe horizon branch that also satisfies Corollary E.8.4g,
$$
S_{\mathrm{cut}}(B)
=\min_{\Gamma_B}\sum_{e\in\Gamma_B}C_e
=\frac{\mathcal A(\partial B)}{4G}+o(\mathcal A)
$$
is the corresponding minimum-cut recovery barrier.

*Proof.* For sufficiently small $\epsilon$, $\omega(r_\epsilon)<\mu$. The injective representative assignment makes every admissible label chain a chain of its specified geometric points. For any such chain from $p_\epsilon$ to $q_\epsilon$, (E.8.4.11) and the metric triangle inequality give
$$
\sum_j\ell_{\mathrm{rec},j}
\ge(\mu-\omega(r_\epsilon))\sum_jd_g(p_{j-1},p_j)
\ge(\mu-\omega(r_\epsilon))d_g(p_\epsilon,q_\epsilon).
$$
Taking the infimum over precisely these admitted chains proves the lower bound. The registered geodesic partition has length sum $d_g(p_\epsilon,q_\epsilon)$, so it supplies the upper bound
$$
d_{\mathrm{rec},\epsilon}(A_\epsilon(p_\epsilon),A_\epsilon(q_\epsilon))
\le(\mu+\omega(r_\epsilon))d_g(p_\epsilon,q_\epsilon).
$$
Since $\lvert d_g(p_\epsilon,q_\epsilon)-d_g(p,q)\rvert\le d_g(p_\epsilon,p)+d_g(q_\epsilon,q)$, the squeeze proves the limit. The barrier identity is Corollary E.8.4g under its separate channel and saturation hypotheses. $\square$

**Theorem E.8.4n (Exact Serialized Recovery Chain and Γ-Convergence).** For each $N\ge1$, let
$\mathcal B_N=\{A_0,\ldots,A_N\}$ and register only adjacent one-step recoveries. Each admissible step $A_i\leftrightarrow A_{i+1}$ is an exact classical forwarding channel for the retained response and has normalized recovery cost $N^{-1}$; nonadjacent one-step operations are inadmissible. The shortest admissible recovery cost is
$$
d_N(A_i,A_j)=\frac{|i-j|}{N}.
\tag{E.8.4n.1}
$$
Under $\iota_N(A_i)=i/N$, this is an isometry onto the uniform grid in $[0,1]$. Consequently it obeys the exact bi-Lipschitz estimate
$$
|\iota_N(A_i)-\iota_N(A_j)|
=d_N(A_i,A_j)
\tag{E.8.4n.2}
$$
and the metric spaces converge to $[0,1]$ with Gromov--Hausdorff distance at most $1/(2N)$.

Define the extended endpoint-cost functional on $[0,1]^2$ by
$$
\mathcal F_N(x,y)=
\begin{cases}
d_N(A_i,A_j),&x=i/N,\ y=j/N,\\
+\infty,&\text{otherwise}.
\end{cases}
\tag{E.8.4n.3}
$$
Then $\mathcal F_N$ Γ-converges in the ordinary product topology to
$$
\mathcal F(x,y)=|x-y|.
\tag{E.8.4n.4}
$$
The construction is no-shortcut complete: every admissible path from $A_i$ to $A_j$ crosses each of the $|i-j|$ intervening cuts at least once, and equality is attained by the monotone chain.

*Proof.* Removing any one of the intervening adjacent transitions disconnects the ordered recovery carrier, so every admissible path must make at least $|i-j|$ steps. The monotone path makes exactly that many, proving (E.8.4n.1)--(E.8.4n.2). Every point of $[0,1]$ lies within $1/(2N)$ of the grid, giving the Gromov--Hausdorff bound. If $(x_N,y_N)\to(x,y)$ and $\mathcal F_N(x_N,y_N)<\infty$, then (E.8.4n.1) gives
$\mathcal F_N(x_N,y_N)=|x_N-y_N|\to|x-y|$, proving the Γ-liminf. Choosing nearest grid points gives a recovery sequence and the Γ-limsup. ∎

**Resolution TV-EHOLO-05-R1 (Metadata).** Exact domain: the complete adjacent-recovery carrier $\mathcal B_N$ for every $N$ and all endpoint pairs. Premises: exact adjacent forwarding, cost $1/N$ and the declared prohibition of nonlocal one-step recovery. Equivalence: response-identical region labels are identified before computing costs. Budget: every admissible path and endpoint pair at every refinement. Verifier: intervening-cut count, monotone-path attainment, the isometry (E.8.4n.2) and Γ-liminf/recovery-sequence checks. Falsifier: an admissible shortcut, a cost different from (E.8.4n.1), failure of exact adjacent forwarding or a violating Γ sequence. Provenance class: source-internal finite recovery construction and continuum proof. Downstream consumers: Definition E.8.4h, Corollary E.8.4j and `TV-EHOLO-05`. The theorem computes every finite cost and proves exact bi-Lipschitz, Gromov--Hausdorff and Γ convergence under a populated local no-shortcut control. It gives `positive-discharge` of the abstract recovery-cost component; realizing this normalized cost table as the specific predictive min-cut channel family of Definition E.8.4h remains `R`-open.

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

**Spatial-record factorization guardrail.** The absence of a total internal self-model does not imply that a complete exterior record exists. A boundary-rate claim for a bounded region $\Omega$ requires a separate finite record proving that every retained exterior readout factors through declared boundary variables $Y_{\partial\Omega,j}$, that the boundary channels satisfy the independent classical-pipe assumptions of Theorem E.8.4b with capacities $C_e$, and that the channel-use rate $\nu_e$ is constant. Under those assumptions only,
$$
\dot I_{\mathrm{out}}(\Omega)
\le
\sum_{e\in\partial\Omega}\nu_e C_e.
$$
A covariant light-sheet statement additionally requires the relevant geometric, focusing, caustic, overlap, and matter hypotheses. Off-equilibrium applicability requires an explicit entropy-production and time-dependent channel ledger; it does not follow from spatial SPAP alone.

### E.8.5 PU Entropy-Cone Constraints

**Definition E.8.5a (Predictive Cut Entropy Vector).** Let $\mathcal N=(V,E)$ be a finite undirected predictive channel network with finite real edge capacities $C_e\ge0$, and let $\mathcal B\subseteq V$ be a specified set of distinct boundary vertices. Boundary regions are subsets of $\mathcal B$. For each $A\subseteq\mathcal B$, define the cut entropy
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

**Theorem E.8.5c (Monogamy on the Pure Predictive Min-Cut Branch).** Let $A,B,C,O$ be pairwise disjoint boundary subsets whose union is $\mathcal B$, with $O$ the purifier region. For finite undirected predictive min-cut entropies,
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

For any edge, the number of original cuts among $U_{AB}$, $U_{AC}$, $U_{BC}$ that it crosses is the Hamming distance between the endpoint bit strings. Let $F(x,y,z)$ be the four membership bits for $W_A,W_B,W_C,W_{ABC}$. Every odd-parity string maps to $(0,0,0,1)$. The even-parity string $(0,0,0)$ maps to $(0,0,0,0)$, while $(1,1,0)$, $(1,0,1)$ and $(0,1,1)$ map to $(1,0,0,1)$, $(0,1,0,1)$ and $(0,0,1,1)$, respectively. Each edge of the three-dimensional bit cube joins an even-parity string to an odd-parity string, so its two images differ in exactly one bit. A shortest bit-cube path between any two endpoint strings therefore shows, by the Hamming triangle inequality, that the image distance is no larger than the original distance. This image distance is exactly the number of new cuts crossed. Multiplying by the nonnegative edge capacity and summing over graph edges gives
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

*Proof.* For Schwarzschild spacetime, the event horizon is the boundary of the causal past of future null infinity. On the collapse-emission branch specified in Theorem E.9.3, its asymptotically normalized surface gravity $\kappa=c^4/(4GM)$ gives
$$
T_H=\frac{\hbar\kappa}{2\pi k_Bc}
=\frac{\hbar c^3}{8\pi GMk_B}.
$$
For de Sitter spacetime, the static-patch horizon has radius $r_\Lambda=\sqrt{3/\Lambda}$ and separates the observer from events outside the patch. For a uniformly accelerated Minkowski observer, the Rindler wedge has a causal boundary. On Theorem E.9.3's Minkowski-vacuum stationary-response branch,
$$
T_U=\frac{\hbar a}{2\pi k_Bc}.
$$
These facts establish the three causal classifications. They do not compare an achieved microscopic rate with $C_{\max}$. On a separately certified saturation branch, substituting $\mathcal A=16\pi G^2M^2/c^4$ gives the Schwarzschild area expression, and substituting $\mathcal A=4\pi r_\Lambda^2$ gives
$$
\frac{\mathcal A}{4G}=\frac{3\pi}{G\Lambda}
$$
in natural units. $\square$

#### E.9.3.1 Temperature as a Geometric Inverse-Time Scale

The listed horizon temperature formulas use a specified quantum state, observer and time normalization. On their certified thermal branches they share the algebraic form $T=\hbar\Gamma/(2\pi k_B)$.

**Theorem E.9.3 (Temperature Structure of the Listed Stationary Horizons).** Assume the field, state and stationary-response or late-time particle-emission certificate specified in the table, with $a>0$, $M>0$ and $H_\Lambda>0$ on the respective branches. The stated temperatures obey
$$
T=\frac{\hbar}{2\pi k_B}\Gamma,
$$
where $\Gamma$ has dimension $[\mathrm{time}]^{-1}$. A causal horizon or stationary metric alone does not specify the quantum state or its thermal response.

| Horizon Type | State and time-normalization branch | Rate $\Gamma$ | Temperature | Reference |
|:-------------|:------------------------------------|:--------------|:------------|:----------|
| Rindler | Minkowski vacuum and a uniformly accelerated observer, with stationary response measured in proper time | $a/c$ | $T_U=\hbar a/(2\pi k_B c)$ | Unruh 1976 |
| Schwarzschild | Collapse in-vacuum and late outgoing emission at future null infinity, with Killing time normalized at infinity | $\kappa/c$ | $T_H=\hbar\kappa/(2\pi k_B c)$ | Hawking 1975 |
| de Sitter | Accepted regular Euclidean/KMS static-patch branch, with time normalized to the central geodesic observer | $H_\Lambda$ | $T_{dS}=\hbar H_\Lambda/(2\pi k_B)$ | Gibbons & Hawking 1977 |

*Proof.* The Rindler state and observer certificate gives $T_U=\hbar a/(2\pi k_B c)$, so $\Gamma_a=a/c$. On the Schwarzschild collapse branch, the late near-horizon affine-parameter relation has the form
$$
U\sim-C\exp[-(\kappa/c)u],
\qquad C>0,
$$
where $u$ is retarded time normalized at infinity. The logarithmic phase and Bogoliubov normalization give the late bosonic occupation factor
$$
\frac{\mathcal T_\omega}{\exp(2\pi\omega c/\kappa)-1},
$$
where $\omega$ is angular frequency and $\mathcal T_\omega$ is the mode's greybody transmission probability. Thus $T_H=\hbar\kappa/(2\pi k_B c)$; for Schwarzschild, $\kappa=c^4/(4GM)$. This outgoing-emission result does not assert that the collapse state is a global KMS equilibrium state. On the accepted de Sitter branch, $H_\Lambda=c\sqrt{\Lambda/3}$ and the static-patch thermal certificate gives $T_{dS}=\hbar H_\Lambda/(2\pi k_B)$. Each formula has the stated inverse-time form. Identifying $\Gamma$ with a channel information-processing rate requires a separate operational channel-and-clock certificate. ∎

**Remark E.9.3.1 (Stationary-Horizon Prefactor Scope).** Where a KMS or Euclidean-regularity certificate applies, it gives imaginary-time period $2\pi/\Gamma$, equivalently angular period $2\pi$ in $\theta=\Gamma\tau_E$. The collapse calculation obtains the same temperature coefficient from the logarithmic phase and its Bogoliubov factors [Hawking 1975]. These are distinct state and boundary-condition certificates for the common coefficient $\hbar/(2\pi k_B)$ [Unruh 1976; Gibbons & Hawking 1977]. They establish neither a universal temperature for arbitrary horizon states nor a real reset duration.

### E.9.4 Holographic Content

Throughout this subsection, we work in natural units ($c = \hbar = k_B = 1$, $L_P^2 = G$) where entropy and information are measured in nats.

**Theorem E.9.4 (Exterior Information Bound on a Reconstructible Code).** Let $\mathcal C_A\subseteq\mathcal H_A$ be an interior code whose retained classical labels are recoverable from exterior measurements of the outputs of one common use of a finite collection of independent boundary channels $\mathcal E_i$. Set $\mathcal E_{\partial}:=\bigotimes_i\mathcal E_i$, use unassisted classical capacities per common boundary use, and assume an accepted additivity certificate
$$
C(\mathcal E_{\partial})=\sum_i C(\mathcal E_i)=:C_{\partial}.
$$
Then
$$
I_{\max}^{\mathrm{ext}}(\mathcal C_A)
\le C_{\partial}.
\tag{E.9.4a}
$$
On the saturation and calibration family of Theorem E.9.1, the finite budget satisfies $C_{\partial}(\mathcal A)=\mathcal A/(4G)+r(\mathcal A)$ with $r(\mathcal A)=o(\mathcal A/G)$ in natural units. Equality in (E.9.4a) requires an achievable joint code attaining the registered budget.

*Proof.* For any ensemble of code labels and any exterior measurement, the Holevo bound gives accessible mutual information no greater than the Holevo information of the boundary output ensemble. The optimized one-use Holevo information is bounded by the regularized unassisted classical capacity $C(\mathcal E_{\partial})$. The accepted additivity certificate identifies this capacity with $C_{\partial}$. Taking the supremum over code ensembles and exterior measurements proves (E.9.4a). The asymptotic area expression, including its remainder, follows from Theorem E.9.1 under all its equality and calibration certificates. $\square$

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

**Corollary E.9.1 (Dimension Bound for a Perfectly Reconstructible Code).** On the branch of Theorem E.9.4, if $d_{\mathrm{code}}$ mutually orthogonal, equiprobable code states are perfectly recoverable from the boundary, then
$$
\ln d_{\mathrm{code}}
\le I_{\max}^{\mathrm{ext}}(\mathcal C_A)
\le C_{\partial},
\qquad
d_{\mathrm{code}}\le e^{C_{\partial}}.
$$
On the saturation and calibration family with $C_{\partial}(\mathcal A)=\mathcal A/(4G)+r(\mathcal A)$ and $r(\mathcal A)=o(\mathcal A/G)$, this gives
$$
d_{\mathrm{code}}(\mathcal A)
\le\exp\!\left(\frac{\mathcal A}{4G}+r(\mathcal A)\right).
$$
The exact finite bound $d_{\mathrm{code}}\le\exp(\mathcal A/(4G))$ holds when an additional certificate gives $C_{\partial}\le\mathcal A/(4G)$. The same dimension bound applies to $\dim\mathcal H_A$ only if every state of $\mathcal H_A$ belongs to such a perfectly reconstructible code.

*Proof.* Perfect recovery of $d_{\mathrm{code}}$ equiprobable labels yields mutual information $\ln d_{\mathrm{code}}$. Theorem E.9.4 bounds this by the certified finite budget $C_{\partial}$, and monotonicity of the exponential gives $d_{\mathrm{code}}\le e^{C_{\partial}}$. Substituting the declared area-family expression retains $r(\mathcal A)$ in the exponent. A certificate $C_{\partial}\le\mathcal A/(4G)$ gives the stated exact finite specialization. $\square$


## E.9.5 Conditional Unitary Representation of a Closed Retained Automorphism Circuit

We now give a conditional unitary-representation theorem for a retained finite-dimensional closed circuit whose interaction layers are already registered $*$-automorphisms. Capacity finiteness and SPAP do not imply that automorphism premise.

### E.9.5.1 Preliminary Definitions and Prior Results

This section records the branch data used by the conditional automorphism-circuit theorem below. Causal organization, thermodynamic reset bounds, and substrate closure do not derive global unitarity; the decisive premises are the registered layerwise response-preserving $*$-automorphisms, self-adjoint free generators, equal endpoint dimensions, and protocol-preservation records.

- **Summary of Hypothesis 1 (Nominated MPU Reality Model):** On this nominated physical-realization branch, the internally accessible substrate is modeled as a network $\mathcal N$ of interacting Minimal Predictive Units, with no internally accessible degrees of freedom outside the registered network. This is branch data, not a consequence of SPAP, capacity finiteness, or the Cogito.

  *Remark (Consistency with P.5):* The closed-system assumption is consistent with the authentic simulation architecture (Appendix P.5). "No external degrees of freedom accessible to internal systems" refers to internal physical reality; external observation channels (Definition P.5.3) operate outside this substrate by construction, satisfying internal inaccessibility ($\mathbb{E}[\Delta Q \mid E; M] = 0$ for all internal procedures $M \in \mathcal{M}_{int}$) and non-intervention.

- **Recall Definition 6 / Definition A.2.2 (RID branches):** RID admits deterministic and explicitly stochastic branches. On Proposition 28's stochastic branch, normalized outcome and transition laws are represented by Markov kernels. This law data is not forced by SPAP.

- **Recall Definition 26 (Internal Prediction):** Internal Prediction is the reset-free phase. Its registered unitary transport is described by a two-time propagator $U_0(t_1,t_0)$. On Theorem 8.7's continuous time-translation-symmetric, reversible, transition-probability-preserving ray branch, this can be chosen as $U_0(t_1,t_0)=e^{-i\hat H(t_1-t_0)/\hbar}$ with a time-independent self-adjoint generator $\hat H$. A general registered free layer of the automorphism circuit uses the two-time propagator supplied by Definition 26.

- **Recall Definition 27 (`Evolve` interaction/update):** Definition 27 nominates the verification/update phase. A pairwise joint-Hilbert instrument, an explicitly stochastic ND-RID kernel, absence of external couplings, and a single registered outcome are separate branch records; Definition 27 alone supplies none of them.

- **Recall Definition 35 (Propagation Cost Metric):** The fundamental MPU spacing $\delta$ defines the characteristic length scale of the network, with the propagation cost metric $d_{\mathcal{N}}(u,v)$ measuring minimum cumulative cost along network paths.

- **Recall from Theorem 23:** The MPU Hilbert space dimension satisfies $d_0 \ge 8$ for $K_0=3$; the minimal branch used in the Appendix Z backbone has $d_0 = 8$ (Theorem Z.2).

- **Recall from Theorem 29 and Corollary 29.1:** The internal Hamiltonian supplies a characteristic timescale and a task-specific orthogonalization bound. A positive lower duration for each ND-RID traversal is separately registered in the branch hypothesis of Theorem E.10.2; it is not a consequence of Theorem 29 alone.

- **Recall from Proposition 5, Definition 28, Theorem J.1, Lemma J.1, and Theorem 31:** Theorem J.1 gives the structural binary reset-support value $\varepsilon_0=\ln2$. On the declared prescribed-ready binary-ancilla architecture, Lemma J.1 gives a noninjective merge when its reachable-domain hypothesis is satisfied. If that architecture performs a registered reset satisfying Definition 28, Theorem 31 gives $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)$; saturation of this bound at $\ln2$ requires a conditionally uniform binary record and zero dissipative overhead.

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
- $\varepsilon_0=\ln2$ on the registered binary-support branch (Definition 28; Definition J.1; Theorem J.1); Definition 15a separately registers the attained PCE-Attractor reference branch, and Theorem 31 gives $\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)$ on a registered reset branch, with a positive uniform floor inferred from this entropy bound requiring $H_q(P\mid R)\ge h_{\min}>0$

### E.9.5.3 Information Capacity of Cauchy Surfaces

**Definition E.9.5.1 (Information Capacity of a Cauchy Surface).** For an assumed Cauchy surface $\Sigma$ on the accepted Lorentzian branch of Corollary 46a, define the information capacity as the maximum von Neumann entropy achievable by states on $\Sigma$. For the finite-dimensional Hilbert space $\mathcal{H}_{\Sigma}$ arising from the discrete MPU network:

$$\mathcal{C}(\Sigma) := \sup_{\rho \in \mathcal{S}(\mathcal{H}_{\Sigma})} S(\rho) = \ln \dim(\mathcal{H}_{\Sigma})$$

where $\mathcal{S}(\mathcal{H}_{\Sigma})$ denotes the set of density operators on the Hilbert space $\mathcal{H}_{\Sigma}$ associated with $\Sigma$, and the equality holds because the supremum is achieved by the maximally mixed state $\rho_* = \mathbb{I}/\dim(\mathcal{H}_{\Sigma})$.

*Proof of equality.* For any density operator $\rho$ on a $d$-dimensional Hilbert space, $S(\rho) \leq \ln d$ with equality if and only if $\rho = \mathbb{I}/d$ [Nielsen & Chuang 2010, Theorem 11.8]. ∎

### E.9.5.4 Closed System Assumption and Exhaustive Channel Mediation

**Assumption E.9.5.1 (Closed System).** The MPU network $\mathcal N$ constitutes a closed system from the internal perspective: no information exchange with degrees of freedom outside the registered network is accessible to internal systems.

This assumption follows from Hypothesis 1 (Section 7.1) together with the authentic simulation architecture (Appendix P.5). External observation channels (Definition P.5.3) satisfy internal inaccessibility ($\mathbb{E}[\Delta Q \mid E; M] = 0$ for all internal procedures $M \in \mathcal{M}_{int}$, condition (ii) of Definition P.5.3) and non-intervention (condition (iii) of Definition P.5.3), ensuring that from the internal perspective, the network evolves as if closed (Remark P.5.1). External observation extracts information without constituting an interaction from the internal viewpoint.

For Theorem E.9.5, internal closure supplies the absence of an external retained environment. The unitary conclusion additionally requires the theorem's finite ordered circuit decomposition, response-preserving pairwise $*$-automorphisms on disjoint factors, self-adjoint free generators, and equality of the endpoint Hilbert-space dimensions. Under these hypotheses, every layer is unitary and their finite composition is unitary.

**Lemma E.9.5.1 (Conditional Registered-Channel Exhaustiveness).** *On the nominated closed-network branch whose admitted internal dynamics are exhausted by the registered reset-free layers and local interaction/update maps, every retained information transfer between separated network regions factors through those maps. This is exhaustiveness within the declared model branch, not a theorem excluding physical mechanisms outside its premises.*

*Proof.*

**Step 1 (MPU network structure).** On the nominated network branch of Hypothesis 1, the MPU network $\mathcal N=(\mathcal V,\mathcal E,\{w_{uv}\})$ consists of vertices representing the units of Definition 23 and weighted possible ND-RID edges. On the separately registered Hilbert/comparator branch, Theorem 23 gives $d_0\ge8$ and Theorem Z.2 gives $d_0=8$. The network topology determines which MPUs can interact directly.

**Step 2 (Registered branch specification).** On the lemma's branch, the admitted dynamics consist of the reset-free internal layers carrying the stated $*$-automorphism/unitary records, the registered local interaction/update maps, and Hypothesis 1's closed-network substrate record. This is an explicit branch specification, not a derivation that Definitions 26--27 exhaust every realized physical mechanism.

**Step 3 (Interaction locality on the registered stochastic edge branch).** When an accepted Proposition-28 law realizes a registered pairwise edge update, its normalized outcome and transition kernels act on the declared subsystem pair. On the separately registered serialized edge-clock branch of Theorem E.10.2, information propagation satisfies $v_{\mathrm{ser}}\le\delta/\tau_{\min}$. Equality with an attained $c$ requires that theorem's one-link-attainment and scale-identification hypotheses, and Theorem 29 alone gives no per-edge duration bound. Sequential transfer between nonadjacent MPUs therefore follows only on the declared pairwise-local serialization branch.

**Step 4 (Channel decomposition at boundaries).** Consider any two spacelike-separated regions $A$ and $B$ on a Cauchy surface $\Sigma$. Let $\bar{A} = \Sigma \setminus A$ denote the complement of $A$. The Hilbert space factorizes as $\mathcal{H}_{\Sigma} = \mathcal{H}_{A} \otimes \mathcal{H}_{\bar{A}}$. Any causal curve connecting $A$ to $B \subseteq \bar{A}$ must pass through the boundary $\partial A$. On the density-certificate branch of Theorem E.3, this boundary has $N_{\text{channels}} = \sigma_{\text{eff}} \cdot |\partial A|+o(|\partial A|)$ effective independent ND-RID channels in the registered macroscopic scaling regime, where:

$$\sigma_{\text{eff}} = \frac{\chi}{\eta\delta^2}$$

is the effective channel density, $\eta$ is the geometric packing coefficient, and $\chi \in (0,1]$ is the correlation correction factor (Theorem E.3).

**Step 5 (Pre-existing correlations).** Correlations between $A$ and $\bar A$ are encoded in the joint state $\rho_{A\bar A}\in\mathcal S(\mathcal H_A\otimes\mathcal H_{\bar A})$. Tensor-product structure alone does not preserve them under every registered local update: a local nonunitary channel can reduce $I(A:\bar A)$ without a channel crossing $\partial A$. On the stronger closed retained-automorphism circuit branch, a unitary layer of the form $U_A\otimes U_{\bar A}$ preserves this mutual information for the declared bipartition. The lemma's locality and exhaustiveness premises concern information transfer between the regions through registered boundary-crossing maps; a change of pre-existing mutual information alone is not such a transfer.

**Step 6 (Completeness).** By Steps 2–5, the ND-RID channel structure exhaustively accounts for all information transfer mechanisms within the framework's ontology. ∎

### E.9.5.5 Hilbert Space Dimension Conservation

**Lemma E.9.5.2 (Hilbert Space Dimension Conservation).** *For a closed MPU network with constant topology, suppose every MPU vertex follows an inextendible causal worldline and the network evolves between Cauchy surfaces $\Sigma_1 \to \Sigma_2$. Then the Hilbert space dimensions satisfy:*

$$\dim(\mathcal{H}_{\Sigma_1}) = \dim(\mathcal{H}_{\Sigma_2})$$

*Proof.*

**Step 1 (MPU counting).** A Cauchy surface $\Sigma$ intersects a definite number $N_{\text{MPU}}(\Sigma)$ of MPUs in the network. On the minimal MPU branch used here, each MPU has Hilbert space dimension $d_0 = 8$ (Theorem Z.2; Theorem 23 gives the lower bound $d_0\ge 8$). The total Hilbert space dimension is:

$$\dim(\mathcal{H}_{\Sigma}) = d_0^{N_{\text{MPU}}(\Sigma)} = 8^{N_{\text{MPU}}(\Sigma)}$$

**Step 2 (Conservation of MPU number).** We establish that ND-RID dynamics preserve the total MPU count through three sub-arguments:

*(a) Local preservation:* On the lemma's constant-topology branch, the registered 'Evolve' instruments act on the state spaces of the same participating MPUs. Each instrument has input and output on $\mathcal{H}_{d_0}^{\otimes k}$ for the declared $k$ participants. Preservation of the vertex set is a branch premise, not a consequence of Definition 27 or Definition A.2.2.

*(b) Global vertex set invariance:* The declared network $\mathcal{N} = (\mathcal{V}, \mathcal{E}, \{w_{uv}\})$ has vertices representing the MPUs of Definition 23. Constant topology keeps $\mathcal V$ unchanged while the admitted dynamics vary vertex states and edge weights. Consequently $|\mathcal V|$ is invariant on this branch; internal closure alone does not establish that invariance.

*(c) Cauchy surface intersection:* By the assumed inextendible causal character of each MPU worldline and the defining property of a Cauchy surface, each $\Sigma_i$ intersects every MPU worldline exactly once. These global causal premises are separate from the geometric-regularity conclusion of Theorem 43. Therefore:

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

**Theorem E.9.5.6 (Multiplicative-Domain Classification of Retained Channels).** Let
$\Phi:M_d\to M_d$ be a unital completely positive Heisenberg channel. Its multiplicative domain is
$$
\operatorname{MD}(\Phi)
=\{X:\Phi(X^*X)=\Phi(X)^*\Phi(X),\ 
\Phi(XX^*)=\Phi(X)\Phi(X)^*\}.
\tag{E.9.5.6.1}
$$
Then:

1. $\operatorname{MD}(\Phi)$ is the unique largest unital $C^*$-subalgebra on which $\Phi$ preserves every product and adjoint;
2. a registered retained algebra $\mathfrak A_{reg}\subseteq M_d$ has all products preserved exactly if and only if
$\mathfrak A_{reg}\subseteq\operatorname{MD}(\Phi)$;
3. if the reversible response axiom supplies a unital completely positive inverse $\Psi:M_d\to M_d$ with
$\Psi\Phi=\Phi\Psi=\mathrm{id}$, then
$\operatorname{MD}(\Phi)=M_d$ and $\Phi(X)=U^*XU$ for a unitary $U$;
4. a proper multiplicative domain identifies the largest product-preserved ledger; it does not determine the complete residual channel or prove that its restriction to an arbitrary registered subalgebra is reversible. For example, with $P_i=|i\rangle\langle i|$, complete dephasing
$$
\Delta(X)=\sum_{i=1}^dP_iXP_i
\tag{E.9.5.6.2}
$$
has multiplicative domain equal to the diagonal algebra and is not an automorphism for $d>1$. The depolarizing channel $\Phi_p(X)=(1-p)X+p\,\operatorname{tr}(X)I/d$, with $0<p\le1$, has multiplicative domain $\mathbb CI$. For $d>1$, the distinct channels $\Phi_t=t\,\mathrm{id}+(1-t)\Delta$, $0<t<1$, all have the diagonal multiplicative domain and restrict to the identity there, but satisfy $\Phi_t(E_{12})=tE_{12}$.

*Proof.* A finite Kraus representation of the unital CP map has the form
$$
\Phi(X)=\sum_{\alpha=1}^rK_\alpha^*XK_\alpha,
\qquad
\sum_\alpha K_\alpha^*K_\alpha=I.
$$
Such a representation follows by factoring the positive Choi matrix $\sum_{i,j}E_{ij}\otimes\Phi(E_{ij})$ into rank-one terms and reshaping their vectors; unitality gives the displayed normalization. Define the isometry $V\xi=\sum_\alpha K_\alpha\xi\otimes e_\alpha$, the representation $\pi(X)=X\otimes I_r$, and $P=VV^*$. Then $\Phi(X)=V^*\pi(X)V$ and
$$
\Phi(X^*X)-\Phi(X)^*\Phi(X)
=\bigl((I-P)\pi(X)V\bigr)^*\bigl((I-P)\pi(X)V\bigr).
$$
The analogous formula for $XX^*$ uses $X^*$. Thus $X\in\operatorname{MD}(\Phi)$ exactly when
$$
\pi(X)V=V\Phi(X),
\qquad
V^*\pi(X)=\Phi(X)V^*.
$$
These identities are closed under sums, scalar multiples and adjoints. If $A,B$ satisfy them, then
$$
\Phi(AB)=V^*\pi(A)\pi(B)V=\Phi(A)\Phi(B),
\qquad
\pi(AB)V=V\Phi(AB),
$$
and the adjoint identity follows by applying the same argument to $B^*A^*$. Hence the domain is a unital $*$-subalgebra; it is norm closed because the two intertwining equations are continuous. For arbitrary $X$ and $A,B$ in the domain,
$$
\Phi(AXB)=\Phi(A)\Phi(X)\Phi(B).
$$
Conversely, every unital $C^*$-subalgebra on which all products are preserved satisfies both defining Schwarz equalities. This proves items 1–2 and the maximality assertion.

For item 3, Schwarz gives $Q_X=\Phi(X^*X)-\Phi(X)^*\Phi(X)\ge0$. Positivity of $\Psi$ and its Schwarz inequality imply
$$
X^*X=\Psi\Phi(X^*X)
\ge\Psi\bigl(\Phi(X)^*\Phi(X)\bigr)
\ge\Psi\Phi(X)^*\Psi\Phi(X)=X^*X.
$$
Consequently $\Psi(Q_X)=0$. The two-sided inverse makes $\Psi$ injective, so $Q_X=0$. Repeating the argument for $XX^*$ gives $\operatorname{MD}(\Phi)=M_d$. The two-sided inverse and multiplicativity make $\Phi$ a $*$-automorphism, and Lemma E.9.5.3 supplies unitary conjugation.

For dephasing, the $i$th diagonal entry of $\Delta(X^*X)-\Delta(X)^*\Delta(X)$ is $\sum_{k\ne i}|X_{ki}|^2$, so zero defect forces $X$ to be diagonal, and diagonal matrices satisfy both equalities. Let $\|X\|_2^2=\operatorname{tr}(X^*X)$. For partial dephasing, write $X=D+O$ with $D=\Delta(X)$ and $O=X-D$. Trace preservation and Hilbert–Schmidt orthogonality give
$$
\operatorname{tr}\!\left[\Phi_t(X^*X)-\Phi_t(X)^*\Phi_t(X)\right]
=(1-t^2)\|O\|_2^2.
$$
For depolarization write $X=aI+Y$, $\operatorname{tr}Y=0$; its defect trace is $[1-(1-p)^2]\|Y\|_2^2$. Positivity of the defects proves the stated domains, and scalar matrices satisfy both equalities. The values on $E_{12}$ distinguish the partial-dephasing channels despite their common product-preserved ledger. ∎

**Resolution TV-EHOR-01-R1 (Metadata).** Exact domain: every finite full-matrix retained Heisenberg channel and every declared registered $C^*$-subalgebra. Premises: unital complete positivity; the reversible branch adds a unital CP two-sided inverse. Equivalence: complete channels are compared by their full retained response maps; equality of multiplicative domains is only equality of product-preserved ledgers. Budget: all algebra elements and both Schwarz equalities. Verifier: the finite Kraus intertwining identities, multiplicative-domain membership, inverse-channel Schwarz squeeze and finite matrix-algebra automorphism representation. Falsifier: a registered product outside the claimed domain, a claimed reversible channel with a nonzero Schwarz defect, or an incorrect example-domain calculation. Provenance class: source-internal exact product-preservation and reversible-channel classification. Downstream consumers: Lemma E.9.5.3, Theorem E.9.5 and `TV-EHOR-01`. Theorem E.9.5.6 classifies the product-preserved ledger, proves unitary representation on the full CP-reversible branch, and supplies explicit proper-ledger residuals. This gives `positive-discharge` of that declared algebraic component; a multiplicative domain alone neither identifies nor realizes a complete physical response channel.

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

### E.9.5.8 Conditional Unitary Representation of a Closed Retained Automorphism Circuit

**Remark E.9.5.0 (Automorphism-Circuit Reading).** The theorem starts from more than closedness: every retained interaction layer must carry the finite response-product-preserving $*$-automorphism certificate of Lemma E.9.5.3, and the circuit, free layers, and endpoint dimensions must satisfy the stated hypotheses. Under that package, restriction or partial trace may produce reduced contractivity while the complete circuit is unitary. A noisy local channel and causal or thermodynamic closedness alone do not imply the package.

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

*(a)* a tensor product of single-MPU free propagators $U_0^{(v)}(t_{k+1},t_k)$ supplied by Definition 26; or

*(b)* a tensor product of pairwise disjoint retained-ledger interaction automorphisms and identity factors.

**Step 2 (Unitarity of internal evolution).** Definition 26 supplies reset-free unitary propagators generated by the self-adjoint Hamiltonians $\hat H_v(t)$ on the registered branch. For each MPU $v$ and time interval $[t_k,t_{k+1}]$ without interactions, the propagator

$$U_0^{(v)}(t_{k+1},t_k)$$

satisfies $(U_0^{(v)})^\dagger U_0^{(v)}=U_0^{(v)}(U_0^{(v)})^\dagger=\mathbb I$.

For the entire network during a non-interaction interval:

$$U_{\text{free}}(t_k,t_{k+1})=\bigotimes_{v\in\mathcal V}U_0^{(v)}(t_{k+1},t_k)$$

This is unitary by Lemma E.9.5.5 (applied inductively).

**Step 3 (Unitarity of pairwise interactions).** By Lemma E.9.5.3, each complete retained pair ledger for an ND-RID interaction is a finite-dimensional $*$-automorphism of
$$
\mathcal B(\mathcal H_A\otimes\mathcal H_B),
$$
and hence is implemented in the Schrödinger picture by a unitary operator $U_{AB}$ on
$$
\mathcal H_A\otimes\mathcal H_B.
$$

**Step 4 (Unitarity of simultaneous non-overlapping interactions).** By hypothesis 2 of Theorem E.9.5, every interaction layer is a tensor product of pairwise disjoint retained-ledger automorphisms and identities on the other factors. Lemma E.9.5.3 represents each pair automorphism by a unitary. The simultaneous layer is therefore:

Let $\mathcal{P}_k = \{(A_1, B_1), (A_2, B_2), \ldots, (A_m, B_m)\}$ denote the set of interacting pairs at time $t_k$, where $\{A_1, B_1, A_2, B_2, \ldots, A_m, B_m\}$ are pairwise disjoint. The joint interaction operator is:

$$U_{\text{int}}(t_k) = U_{A_1 B_1} \otimes U_{A_2 B_2} \otimes \cdots \otimes U_{A_m B_m} \otimes \mathbb{I}_{\text{rest}}$$

where $\mathbb{I}_{\text{rest}}$ is the identity on non-interacting MPUs. By Lemma E.9.5.5, this tensor product of unitaries is unitary.

**Step 5 (Unitarity of full evolution).** The complete evolution from $\Sigma_1$ to $\Sigma_2$ is the composition:

$$U_{\text{total}}=L_nL_{n-1}\cdots L_1$$

(where $L_1,\ldots,L_n$ are all declared free-evolution and interaction layers in chronological order from $\Sigma_1$ through $\Sigma_2$; identity layers may be included, and an empty circuit has the identity as its product).

By Lemma E.9.5.4, the composition of unitary operators is unitary:

$$U_{\text{total}}^\dagger U_{\text{total}} = \mathbb{I}, \qquad U_{\text{total}} U_{\text{total}}^\dagger = \mathbb{I}$$

**Step 6 (Closed system constraint).** By Assumption E.9.5.1 (Closed System), following from Hypothesis 1:

- No information can enter from outside the system (none accessible to internal systems)
- No information can exit to outside the system (none detectable by internal systems)
- All MPU interactions are internal to the total system
- For a registered reduced CPTP map obtained from the product preparation $\rho_A\otimes\sigma_{\bar A}$ with the same $\sigma_{\bar A}$ for every input $\rho_A$, the physical environment is the complementary network subsystem. A pure-state Stinespring representation may require an auxiliary purification of $\sigma_{\bar A}$; internal closure alone does not place that auxiliary factor inside $\mathcal H_\Sigma$. A general initially correlated family requires a separate preparation/assignment certificate before it defines a CPTP map on the full subsystem state space.

The endpoint Cauchy surfaces are premises of Theorem E.9.5. Their global causal property is separate from the geometric regularity established by Theorem 43. Assumption E.9.5.1 supplies the internal closure of the retained network ledger on which the stated circuit acts.

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
N_{\mathrm{eff}}=\frac{\chi}{\eta\delta^2}\mathcal A+o(\mathcal A)
\xrightarrow[\text{Thm E.6 saturation}]{}
\frac{S_{\mathrm{rel}}}{k_B}
=\frac{c^3\mathcal A}{4G_{\mathrm{op}}\hbar}+o(\mathcal A).
$$
The physical horizon reading requires the additional bridges
$S_{\mathrm{rel}}=S_{BH}+o(\mathcal A)$ and $G_{\mathrm{op}}=G$.

On refresh/minorization subbranches, Lemma E.1 and Theorem E.2 add the strict reduced-channel route
$$
f_{RID}<1\to C_{\max}<\ln d_0,
$$
which supplies contraction and mixing statements but is not the quantitative source of the residual-budget value $C_{\max}^*=2\ln2$.

**Branch II (Conditional Closed Retained Automorphism Circuit):**

$$
\text{Closed retained ledger}
+
\text{ND-RID pair automorphisms}
\xrightarrow[\text{Lem E.9.5.3}]{}
U_{AB}\text{ unitary on complete pair ledgers}
\xrightarrow[\text{Thm E.9.5}]{}
\text{global retained unitarity}.
$$

For systems with observation channels (Appendix P.5), Definition P.5.3 can supply only Assumption E.9.5.1's internal nonintervention/closure premise. Branch II applies only if the remaining finite-circuit, layerwise $*$-automorphism, self-adjoint-generator, retained-subalgebra/quotient-descent, and endpoint-dimension hypotheses of Theorem E.9.5 are independently certified.

The registered reset-support capacity deficit, reduced-state entropy growth under entangling unitary dynamics, and perspectival access restriction are separate branch statements. Their coexistence is compatible with global retained unitarity, but SPAP alone supplies none of the reset channel, the entangling dynamics, or a monotone entropy-production certificate.

*Proof.* The derivation chains are verified by tracing the logical dependencies:

**Branch I:**
1. The declared binary reset-support ledger has the structural value $\varepsilon_0=\ln2$ (Proposition 5; Definition 28). On a physical reset branch satisfying Definition 28, Theorem 31 separately gives $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)$; a positive uniform floor inferred from this entropy bound requires $H_q(P\mid R)\ge h_{\min}>0$.
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
5. On the capacity-achieving, entropy-saturating, additive-ledger branch of
   Theorem E.6, the operational bound is saturated and defines
   $G_{\mathrm{op}}$ by
   $S_{\mathrm{rel}}/k_B=\mathcal A/(4L_{P,\mathrm{op}}^2)+o(\mathcal A)$ in
   natural units.  Calling this $S_{BH}$ and setting $G_{\mathrm{op}}=G$ require
   the two independent physical bridges stated above.

On refresh/minorization subbranches, the additional full-state refresh component gives $f_{RID}<1$ and the strict capacity inequality $C_{\max}<\ln d_0$ by Lemma E.1 and Theorem E.2. That strict-contraction route is used for mixing, fixed-point, and reduced-channel contraction statements; the reset-support route is used for quantitative residual-budget channel counting.

**Branch II:**
1. Closed system (Hypothesis 1) and PPI completeness identify the total retained response ledger on a complete Cauchy surface.
2. Hypothesis 2 of Theorem E.9.5 supplies the registered pairwise disjoint interaction layers; Definitions 27 and A.2.2 specify their interaction/update and ND-RID law when the corresponding branch records are supplied.
3. On the closed retained-ledger branch, the pair interaction is represented in the Heisenberg picture by a unital response-preserving $*$-automorphism of the full pair algebra.
4. Lemma E.9.5.3 converts this finite-dimensional automorphism into unitary conjugation on $\mathcal H_A\otimes\mathcal H_B$.
5. Unitary tensoring and composition give global retained unitarity by Theorem E.9.5.

Branch I uses a registered reset-support channel and separate saturation and calibration hypotheses to obtain its reduced-capacity and area-law statements. Branch II uses a closed retained-ledger automorphism and the declared pair structure to prove global retained unitarity. A common realization additionally requires an accepted compatibility record: the registered preparation of the reset and auxiliary factors, the Branch II unitary circuit, and the specified subsystem restriction must reproduce the Branch I channel on its full retained input family and protocol responses within the same resource budget. When that record is supplied, reduced contractivity is compatible with preservation of globally retained information. The separate branch certificates alone do not supply this common realization, and neither branch follows from SPAP entropy. ∎

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

**Step 3 (Conditional capacity bookkeeping).** If the horizon also satisfies the geometric, density-certificate, saturation, additive-ledger, and calibration hypotheses of Theorem E.6 at each time, its retained boundary entropy obeys the finite geometric bound $S_{\mathrm{rel}}(\mathcal A_H(t))/k_B\le C(\mathcal E_N(t))c_+(t)\mathcal A_H(t)/\delta(t)^2$. On the registered macroscopic density and saturation branch, $S_{\mathrm{rel}}/k_B=c^3\mathcal A_H/(4G_{\mathrm{op}}\hbar)+o(\mathcal A_H)$. If $\mathcal A_H(t)\to0$, the budget tends to zero provided the finite geometric bound remains valid and its prefactor $C(\mathcal E_N(t))c_+(t)/\delta(t)^2$ stays uniformly bounded; the large-area asymptotic relation alone does not establish this endpoint limit. The fine-grained entropy equality in the corollary follows from the retained unitary alone; interpreting the changing tensor factors as transfer to radiation and horizon–radiation correlations uses this additional horizon branch.

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
Under the trace-coupled coupling certificate, if $d_E(t)=1$, both reduced radiation entropies and the Page target are zero, so the comparison error is zero. For $d_E(t)\ge2$, Theorem K.3 (Appendix K) and Audenaert's sharp Fannes inequality give
$$
\left|\mathbb E\,S(\rho_E^{\mathrm{PU}}(t))-S_{\mathrm{Page}}(d_E(t),d_L(t))\right|
\le
\varepsilon_t\ln(d_E(t)-1)+h_2(\varepsilon_t).
$$
Indeed the continuity bound applies to every pair in the accepted coupling; its right-hand side is increasing for $0\le\varepsilon_t\le1-1/d_E(t)$, and taking expectations preserves the bound. Here
$$
S_{\mathrm{Page}}(d_E,d_L)
=
\sum_{j=d_>+1}^{d_Ed_L}\frac1j
-\frac{d_<-1}{2d_>},
\qquad
d_<=\min\{d_E,d_L\},
\qquad
d_>=\max\{d_E,d_L\},
$$
and $h_2(x)=-x\ln x-(1-x)\ln(1-x)$ with $h_2(0)=h_2(1)=0$ by continuous extension. For $d_E\ge2$, the same expression with $\varepsilon_{\mathrm{Page}}$ applies when the accepted coupling obeys $T_t\le\varepsilon_{\mathrm{Page}}\le1-1/d_E$; for $d_E=1$ its error is defined as zero. If only a second-moment ($t_{\mathrm{des}}=2$) design certificate is accepted, the theorem-level conclusion is the Haar Page-purity law of Corollary K.3.1 rather than the full von Neumann entropy law.

The exact Haar Page target has the asymptotic regimes $S_{\mathrm{Page}}\sim\ln d_E$ for $d_E\ll d_L$, a turnover near $d_E\approx d_L$, and $S_{\mathrm{Page}}\sim\ln d_L$ for $d_E\gg d_L$. Transferring any displayed asymptotic to the PU entropy requires a bound on the corresponding Page-target remainder together with a certified continuity radius smaller than the claimed accuracy. A rise/turnover/fall theorem additionally requires a time-ordered dimension ledger with the relevant monotonicity and strict adjacent target gaps exceeding the sums of the certified error radii. Identifying the crossing with half the initial entropy requires a conserved coarse entropy ledger. Identifying $\ln d_L$ with $\mathcal A_H/(4G)$ requires the separately calibrated horizon-entropy branch.

**Step 5 (Final state).** Invoke the corollary's explicit endpoint hypotheses: the initial total state is pure, complete evaporation leaves a one-dimensional black-hole factor, and there is no remnant or untracked sector. Theorem E.9.5 then preserves purity of the closed total state, and the one-dimensional final black-hole factor implies that the final radiation state is the total state. Hence
$$
S(\rho_{\mathrm{rad}}^{\mathrm{final}})=0.
$$
The limit $\mathcal A_H\to0$ and retained unitarity alone would not exclude a remnant or untracked tensor factor; the stated endpoint hypotheses do that work. ∎

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

1. **Structural conservation layer:** closed-system retained unitarity preserves the total fine-grained information and prevents fundamental deletion. A time-indexed Theorem-E.6 horizon-capacity and compatible-factorization certificate permits a transfer interpretation; a decomposition into horizon--radiation or radiation--radiation correlations additionally requires an explicit state/channel correlation witness.

2. **Entropy-continuity branch layer:** von Neumann Page-curve behavior follows only under the trace-coupled horizon entropy-continuity promotion certificate stated in Step 4. A bare moment-design certificate gives the Page-purity branch rather than the full entropy curve.

*Proof.* Fine-grained information conservation uses the closed retained-algebra hypotheses of Theorem E.9.5 and unitary invariance of von Neumann entropy. It does not require the area law. A horizon-capacity transfer interpretation additionally requires the time-indexed geometric, density-certificate, saturation, additive-ledger, and calibration branch of Theorem E.6. Step 4 separately adds the trace-coupled entropy-continuity certificate to compare reduced radiation entropy with the Page average through Audenaert continuity. Without that certificate, conservation remains valid; a retained moment-design certificate supplies the Page-purity row but not the von Neumann entropy curve. ∎

**Definition E.9.5d (Retained Finite-Response Horizon Channel).** On a refining sequence of finite operational covers $\{\mathcal U_n\}$, require both an accepted finite KMS-descent certificate of Definition F.10.12a and the complete Theorem-E.9.5 automorphism-circuit certificate. Require in addition, at every $n$,
$$
\operatorname{Ad}_{W_n}(\widetilde{\mathcal A}_n^{\mathrm{ret}})
=\widetilde{\mathcal A}_n^{\mathrm{ret}},
$$
where $W_n$ is the implementing unitary of the accepted complete circuit, $\operatorname{Ad}_{W_n}(X)=W_n^*XW_n$, and $\widetilde{\mathcal A}_n^{\mathrm{ret}}$ is the retained subalgebra before response-null quotienting. Let $q_n:\widetilde{\mathcal A}_n^{\mathrm{ret}}\to\mathcal A_n^{\mathrm{ret}}$ be the accepted algebra quotient. Require $q_n(X)=q_n(Y)$ if and only if $q_n(\operatorname{Ad}_{W_n}(X))=q_n(\operatorname{Ad}_{W_n}(Y))$. Then the descended automorphism is $U_n(q_n(X))=q_n(\operatorname{Ad}_{W_n}(X))$. The retained finite-response horizon channel is the tuple
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

2. $\mathcal A_n^{\mathrm{coarse}}\subseteq\mathcal A_n^{\mathrm{ret}}$ is the finite subalgebra accessible to the exterior coarse-grained horizon protocol. Any identification with a channel min-cut quotient is a separate compatibility entry of the retained channel record on the branch of Corollary E.8.4g. Theorem E.6 supplies the conditional operational boundary-entropy bound and saturated coefficient.

3. $\pi_{\mathrm{hor},n}:\mathcal A_n^{\mathrm{ret}}\to\mathcal A_n^{\mathrm{coarse}}$ is the conditional expectation onto the exterior coarse-grained subalgebra.

4. $U_n:\mathcal A_n^{\mathrm{ret}}\to\mathcal A_n^{\mathrm{ret}}$ is the descended retained automorphism induced by the accepted Theorem-E.9.5 circuit. Its well-definedness uses invariance of $\mathcal A_n^{\mathrm{ret}}$ and preservation of the response-null kernel; neither follows from KMS descent alone.

5. $\ker_{\mathrm{hid}}\pi_{\mathrm{hor},n}$ is the kernel of $\pi_{\mathrm{hor},n}$ inside the retained quotient. It contains only response-hidden retained classes. Response-null surplus has already been removed before forming $\mathcal A_n^{\mathrm{ret}}$.

6. $g_{\mathrm{hor},n}>0$ is a separately certified uniform lower bound on the retained-response violation costs of excluded non-injective update classes. If those classes form a finite nonempty family with positive costs, the bound may be chosen as their minimum. Finite-dimensionality of $\mathcal A_n^{\mathrm{ret}}$ alone supplies neither a finite candidate family nor a positive uniform violation bound.

**Theorem E.9.5e (No Fundamental Deletion in the Retained Algebra).** Suppose the complete channel $\mathfrak H_n^{\mathrm{ret}}$ of Definition E.9.5d is accepted, including KMS descent, the automorphism circuit, retained-subalgebra invariance, and quotient descent, and suppose its descended $U_n$ is injective on retained finite-response classes. Then no two distinct retained finite-response classes are merged by the microscopic horizon update. Apparent equality after $\pi_{\mathrm{hor},n}$ is exterior coarse-graining, not deletion in $\mathcal A_n^{\mathrm{ret}}$.

*Proof.* Let $[A],[B]\in\mathcal A_n^{\mathrm{ret}}$ with $[A]\ne[B]$. By the injectivity hypothesis, $[U_n(A)]\ne[U_n(B)]$. Therefore $U_n$ does not identify distinct retained finite-response classes. The exterior projection $\pi_{\mathrm{hor},n}$ may still satisfy $\pi_{\mathrm{hor},n}(U_n(A))=\pi_{\mathrm{hor},n}(U_n(B))$, in which case $U_n(A)-U_n(B)\in\ker_{\mathrm{hid}}\pi_{\mathrm{hor},n}$ by Definition E.9.5d. This is exterior coarse-graining, not deletion in $\mathcal A_n^{\mathrm{ret}}$. ∎

**Definition E.9.5f (Exterior Recovery Sufficiency Certificate).** An exterior recovery sufficiency certificate for the cover $\mathcal U_n$ is a finite record
$$
\mathfrak S_{\mathrm{hor},n}
=
(\mathfrak H_n^{\mathrm{ret}},\mathcal T_n,\mathcal C_n,s_n,\epsilon_n)
\tag{E.9.5f.1}
$$
where $\mathcal T_n\subseteq\mathcal A_n^{\mathrm{ret}}$ is the specified finite family of retained test observables, $\mathcal C_n\subseteq\mathcal A_n^{\mathrm{coarse}}$ contains all records $\pi_{\mathrm{hor},n}(U_n(A))$ for $A\in\mathcal T_n$, and $s_n:\mathcal C_n\to\mathcal A_n^{\mathrm{ret}}$ is the admitted recovery map on that recorded domain. The error $\epsilon_n\ge0$ is declared before comparison. The certificate is accepted when
$$
\left\|s_n(\pi_{\mathrm{hor},n}(U_n(A)))-U_n(A)\right\|_{\mathrm{ret}}
\le\epsilon_n
\tag{E.9.5f.2}
$$
for every $A\in\mathcal T_n$. Exact deterministic recovery on this tested family is the case $\epsilon_n=0$. A refining recovery claim requires compatible identifications of its asserted test family across resolutions and a uniform bound on that family with $\epsilon_n\to0$. Merely generating an algebra does not extend these estimates to its other elements.

**Theorem E.9.5f.1 (Exterior Recovery Only under Sufficiency).** If $\mathfrak S_{\mathrm{hor},n}$ is accepted, then $\mathcal R_n=s_n$ recovers every registered tested horizon update with certified error $\epsilon_n$: for all $A\in\mathcal T_n$,
$$
\left\|\mathcal R_n(\pi_{\mathrm{hor},n}(U_n(A)))-U_n(A)\right\|_{\mathrm{ret}}
\le\epsilon_n.
\tag{E.9.5f.3}
$$
A uniform statement on a larger family, such as the retained algebra's unit ball, requires a certificate on that family. Without a recovery certificate, Theorem E.9.5e proves no fundamental deletion on its complete retained-channel branch but does not assert deterministic recovery from the exterior coarse algebra alone.

*Proof.* The estimate is exactly (E.9.5f.2) on $\mathcal T_n$. If the full error map is linear, a tested linear combination $\sum_jc_jA_j$ has error at most $\epsilon_n\sum_j|c_j|$ by the triangle inequality; even this additional linearity would not give the same constant on arbitrary combinations or products. Without a sufficiency certificate, the exterior projection may identify distinct retained updates differing by an element of $\ker_{\mathrm{hid}}\pi_{\mathrm{hor},n}$. Injectivity of $U_n$ prevents deletion before projection but supplies no inverse for that projection on the tested family. ∎

**Corollary E.9.5f.2 (Recovery/Page Separation).** The exterior recovery certificate $\mathfrak S_{\mathrm{hor},n}$ and the Page-sector certificates are distinct entries in the stated promotion ledger. $\mathfrak S_{\mathrm{hor},n}$ supplies deterministic recovery in retained response norm. A Page-purity statement uses the separate moment-design or frame-potential certificate of Appendix K, whereas a von Neumann Page-curve statement additionally uses its trace-coupled entropy-continuity certificate $\mathfrak C_{\mathrm{PageTV}}$. The structural-conservation theorem does not supply these additional records.

*Proof.* Theorem E.9.5e establishes retained injectivity on the complete channel branch of Definition E.9.5d. Definition E.9.5f requires a finite recovery section of the exterior projection with its declared error bound. Appendix K requires moment or trace-continuity estimates for the corresponding Page comparison. Thus these are additional entries in the hypotheses of the stated recovery and Page theorems. Theorem P.14.1f supplies a non-identifiability conclusion when two admissible certificate completions satisfy all prior constraints and give inequivalent outputs; no such pair is supplied by the difference of maps or error norms alone. ∎

**Corollary E.9.5e.1 (Status of the Horizon Sector).** On a branch carrying the complete accepted retained channel of Definition E.9.5d, including its automorphism circuit, retained-subalgebra invariance and quotient descent, Theorem E.9.5e establishes no deletion of distinct retained response classes. This closes the structural-conservation row on that declared branch. The exterior recovery row is certificate-complete on its specified tested family only after an accepted exterior recovery sufficiency certificate $\mathfrak S_{\mathrm{hor},n}$ is supplied. The von Neumann Page-curve estimate remains on the trace-coupled entropy-continuity branch of Corollary E.9.5.2a and Definition K.3d.4c; without that promotion, a moment-design certificate supplies only the Page-purity row.

*Proof.* For the structural-conservation row, $Q_S$ is a separately registered finite family of candidate horizon update classes on $\mathcal A_n^{\mathrm{ret}}$, $\sim_S$ is equality of retained response presheaves, $\mathcal R_S$ is the finite protocol response family on the retained algebra, $V_S$ is the PCE cost restricted to horizon update data, $q_S^*$ is the injective retained update class supplied by Theorem E.9.5, and $\Pi_S$ are the overlap maps to the accepted KMS and emergent-metric rows. A non-injective deletion class merges two distinct retained finite-response classes, so it fails at least one retained protocol response and is excluded by the PPI quotient or assigned violation cost at least $g_{\mathrm{hor},n}$ by the accepted retained algebra record. Hence the no-deletion structural layer is closed by Theorem E.9.5e. A strict-selection conclusion from Theorem D.8.9b additionally requires a complete certificate of Definition D.8.9a, including a positive PCE-cost gap from the selected update class to every other retained candidate class, whether injective or non-injective, and accepted overlap maps. The violation gap $g_{\mathrm{hor},n}$ against excluded non-injective updates alone does not supply that all-candidate separation. Exterior recovery from $\mathcal A_n^{\mathrm{coarse}}$ requires the additional finite section data of Definition E.9.5f; without that data, Theorem E.9.5f.1 explicitly forbids promotion to deterministic exterior recovery. Page purity requires the separate moment-design or frame-potential gate of Appendix K, while the von Neumann Page-entropy estimate requires the trace-coupled continuity certificate $\mathfrak C_{\mathrm{PageTV}}$ of Definition K.3d.4c. Neither conclusion follows from scrambling or exterior recovery alone. ∎

**Corollary E.9.5e.2 (Page-Curve Branch Status).** On the complete accepted retained-channel branch of Definition E.9.5d, Theorem E.9.5e establishes the structural-conservation layer of Corollary E.9.5.2a without invoking the trace-coupled entropy-continuity promotion certificate of Step 4 of Corollary E.9.5.2 or the exterior recovery sufficiency certificate of Definition E.9.5f. Deterministic exterior recovery on a specified tested family is supplied by an accepted $\mathfrak S_{\mathrm{hor},n}$ through Theorem E.9.5f.1. Page purity uses its accepted moment-design or frame-potential certificate. The pointwise von Neumann Page-entropy estimate uses an accepted $\mathfrak C_{\mathrm{PageTV}}$ of Definition K.3d.4c, and a global shape statement requires the additional time/dimension/gap ledger of Corollary K.3d.6. These are distinct certificate requirements of the stated theorems; the structural-conservation argument supplies none of the additional recovery or Page estimates.

*Proof.* Theorem E.9.5e applies the complete Definition-E.9.5d contract, including KMS descent, the automorphism circuit, retained-subalgebra invariance and quotient descent. Its descended map is injective and therefore cannot merge distinct retained classes. That argument uses neither an exterior recovery map nor an entropy-continuity estimate. Theorem E.9.5f.1 separately supplies its certified estimate on the registered tested family, while the Page theorems use their corresponding moment or trace-coupling records and, for a global curve shape, the additional time-indexed gap conditions. No formal independence of arbitrary certificate completions is inferred merely from the difference of these hypotheses. ∎

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
| Binary-reset-support capacity | $C_{\max}$ and $C_{\max}^{*}$ | $C_{\max}\le\ln d_0-\varepsilon_0=2\ln2\approx1.386$ nats; $C_{\max}^{*}=2\ln2$ only on the residual-capacity saturation branch | Proposition E.2a; Eqs. E.14--E.15 (Appendix E) |
| Contractivity factor bound | $f_{\text{RID}}$ | $\le 1-p$ for some $p\in(0,1]$ (refresh weight) | Lemma E.1 |
| MPU spacing / operational Planck length | $\delta/L_{P,\mathrm{op}}$ | $\sqrt{8\ln 2}\approx2.355$ on the registered saturation branch; $L_{P,\mathrm{op}}=L_P$ only if $G_{\mathrm{op}}=G$ | Appendix Q, Eq. Q.18 |

### E.9.5.11 Concluding Remarks

**Remark E.9.5.2: Relation to Standard Quantum Mechanics.** In standard quantum mechanics, unitarity is postulated as an axiom governing closed-system evolution (process 2 in [von Neumann 1932, Chapter V, §1, pp. 186–190]). In the finite-response PU ledger, the closed-system result is sharper and algebraic: once the complete retained Cauchy-surface response algebra evolves by $*$-automorphisms, finite-dimensional matrix-algebra structure forces those automorphisms to be unitary conjugations.

The key insight is that while reduced ND-RID channels may be strictly contractive on refresh/minorization branches ($f_{\mathrm{RID}}<1$, Lemma E.1), this contractivity is a reduced-subsystem phenomenon. The complete retained pair ledger evolves by the unitary representative of Lemma E.9.5.3, and tracing or restricting to a subsystem can produce apparent non-unitarity without destroying retained global information. The derivation applies to internally closed retained ledgers; open systems exhibit apparent non-unitarity through coupling to degrees of freedom outside the subsystem being described, consistent with the standard quantum formalism and with Corollary E.9.5.4.

**Remark E.9.5.3: Consistency with Arrow of Time.** Global unitarity (Theorem E.9.5) and thermodynamic irreversibility (Appendix O, Theorem O.3) are compatible because they describe different operational levels:

- *Global level:* The von Neumann entropy of the total closed-system state is conserved under $U_{\text{total}}$. If $\rho_{\text{total}}(0)$ is pure, it remains pure throughout evolution.

- *Subsystem level:* Every physical observer occupies a subsystem perspective, accessing only reduced states via partial trace. Reduced-state entropy can increase through correlations with inaccessible degrees of freedom. On a separate registered-reset branch satisfying Definition 28, Theorem 31 gives $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)$; that heat ledger does not quantify the correlation information.

Appendix O's thermodynamic arrow holds only on its common forward/reverse path-measure and positive entropy-production branch. Predictor embedding or a perspectival subsystem split alone does not ensure a thermodynamic ratchet for every observer. Global retained unitarity, reduced-state entropy change, registered-reset heat, and pathwise entropy production therefore remain compatible but logically distinct ledgers.

**Remark E.9.5.4: Derivational Priority.** The framework places unitarity and conditional thermodynamic irreversibility in compatible but logically distinct ledgers. Unitarity follows on the closed retained-ledger branch carrying the response-product-preserving $*$-automorphism certificate of Lemma E.9.5.3 and Theorem E.9.5. The registered-reset inequality $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)$ follows from Definition 28 and Theorem 31. These results describe global retained dynamics and a specified reset implementation, respectively.

The parallel derivation structure:

$$
\text{SPAP}
\xrightarrow[\text{Thm 31}]{\varepsilon_0=\ln2,\ \varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)\quad(\text{registered reset branch; a positive uniform floor inferred from this entropy bound requires }H_q(P\mid R)\ge h_{\min}>0)}
\begin{cases}
\text{Branch I:} & C_{\max}\le\ln d_0-\ln2
\to S_{\mathrm{rel}}/k_B
=c^3\mathcal A/(4G_{\mathrm{op}}\hbar)+o(\mathcal A)
\quad\text{on E.6's saturation branch} \\
\text{Branch I-phys:} & S_{\mathrm{rel}}=S_{BH}+o(\mathcal A),\quad
G_{\mathrm{op}}=G \\
\text{Branch I-ref:} & f_{RID}<1\to C_{\max}<\ln d_0 \\
\text{Branch II:} & U_{AB}\text{ unitary}\to\text{global unitarity (internally closed)}
\end{cases}
$$

shows that the causal capacity bounds and refresh-branch contraction remain tied to their registered channel branches, while global unitarity follows separately on the closed retained-ledger branch carrying the response-product-preserving $*$-automorphism certificate. These are complementary, level-distinct results.

**Remark E.9.5.5: Role of Closed-System Assumption.** The derivation of global retained unitarity (Theorem E.9.5) critically depends on the closed retained-ledger reading of Hypothesis 1. Closedness alone means that no retained information is exchanged with degrees of freedom outside the network that are accessible to internal systems; PPI completeness further requires the total retained response algebra on a complete Cauchy surface to carry the full internal response ledger. These conditions are necessary, but not sufficient, to make a general CPTP update unitary. The missing load-bearing condition is the pairwise response-product preservation certificate stated in Remark E.9.5.3a, i.e. that the complete retained pair update is a $*$-automorphism rather than merely an injective CPTP map.

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

An observation channel satisfying Definition P.5.3 may permit external information extraction while preserving the registered internal state and excluding the external record from the internal input algebra. This supplies Assumption E.9.5.1's internal closure premise only. Theorem E.9.5 applies to the internal dynamics if, and only if, its remaining finite-circuit, layerwise $*$-automorphism, self-adjoint-generator, retained-subalgebra/quotient-descent, and endpoint-dimension certificates are independently accepted. The external observer's registered reset obeys $\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)$, with a positive floor requiring $H_q(P\mid R)\ge h_{\min}>0$; this cost does not supply the missing automorphism data.

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
edges. Attainment of the rounded bound requires an exhibited path with exactly $\lceil R/\delta\rceil$ edges; it does not require every edge to attain the length bound or the path to be geodesic.

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

**Theorem E.10.2 (Serialized Propagation-Speed Bound and Conditional Attainment).**

Assume that (i) propagation between non-adjacent MPUs is implemented by serialized nearest-neighbor ND-RID traversals, (ii) each traversed edge has length at most $\delta$ in the retained propagation metric, and (iii) each edge traversal takes at least a separately registered time $\tau_{\min}>0$. Then every serialized propagation path satisfies
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

**Corollary E.10.1 (Activity-Conditioned Propagation Dissipation).** Consider a run observed from its registered start at time $0$ through a time $t>0$. Let $N(t)$ count its completed registered reset operations, each satisfying Definition 28 on its own declared ensemble at temperature $T_j>0$. Write $h_j=H_{q_j}(P_j\mid R_j)$ and define
$$
r_{\mathrm{upd}}(t)=\frac{N(t)}t,
\qquad
\bar h_t=
\begin{cases}
N(t)^{-1}\sum_{j=1}^{N(t)}h_j,&N(t)>0,\\
0,&N(t)=0.
\end{cases}
$$
Use the reset-only mean-heat/temperature export ledger
$$
S_{\mathrm{env}}(t)
:=\sum_{j=1}^{N(t)}\frac{\langle Q_{\mathrm{bath},j}\rangle}{T_j}
=k_B\sum_{j=1}^{N(t)}\varepsilon_{\mathrm{reset},j}.
$$
Each heat expectation belongs to its registered reset ensemble; this is neither a pathwise heat bound for each microscopic realization nor an identification with the entropy change of the entire environment. Then
$$
\frac{S_{\mathrm{env}}(t)}t
\ge r_{\mathrm{upd}}(t)k_B\bar h_t.
\tag{E.10.3}
$$
For a serialized uniform path whose declared completed-distance rate is $v(t)=r_{\mathrm{upd}}(t)\delta$,
$$
\frac{S_{\mathrm{env}}(t)}{k_Bt}
\ge\frac{\bar h_t}{\delta}v(t).
\tag{E.10.4}
$$
The specialization $\bar h_t=\ln2$ requires the stated conditionally uniform binary reset ensembles. On Theorem E.10.2's edge-clock branch, if the run starts with no traversal in progress and each counted reset completes one serialized edge traversal, $N(t)\tau_{\min}\le t$ and hence $r_{\mathrm{upd}}(t)\le1/\tau_{\min}$. This is a rate ceiling, not a positive activity floor. At separately registered saturated activity, the lower bound in (E.10.3) is $k_B\bar h_t/\tau_{\min}$. A differential or whole-environment entropy statement requires additional rate-limit and entropy-identification certificates.

*Proof.* Theorem 31 gives $\langle Q_{\mathrm{bath},j}\rangle/T_j\ge k_Bh_j$ for each declared reset ensemble. Sum these inequalities and divide by $t>0$ to obtain (E.10.3); both sums vanish when $N(t)=0$. Substitution of the declared distance-rate identity gives (E.10.4). Serialization from the registered start and the lower duration of every completed edge give the clock ceiling. No pointwise entropy-production inequality follows merely by differentiating this cumulative comparison. ∎

**Corollary E.10.2 (Conditional Locality Bound in the Serialized ND-RID Regime).** On the branch of Theorem E.10.2, locality and the speed bound use three independent inputs:
1. a nearest-neighbor successive serialization rule;
2. a separately registered positive edge-traversal duration $\tau_{\min}$ and link-length bound $\delta$;
3. the retained propagation metric and its declared edge-weight bounds.

A reset-entropy ledger and PCE optimization may constrain implementation cost, but they do not establish these kinematic inputs. For a path of $n$ edges, the branch assumptions give $t\ge n\tau_{\min}$ and distance at most $n\delta$, hence
$$
v\le\frac{\delta}{\tau_{\min}}.
$$
The scale identification converts this into the numerical upper bound $c$; equality requires the additional one-link-attainment hypothesis. ∎

**Theorem E.10.3 (Conditional Serialized Path, Clock and Reset Ledger).** Fix $N\ge1$, $\delta,\tau>0$, and take the path graph
$$
v_0-v_1-\cdots-v_N
\tag{E.10.5}
$$
with every edge assigned propagation length $\delta$. The retained state is a message bit $M$, a token position $j$, a receiver buffer $B_{j+1}$ and an independent clock-work bit $P_j$. At tick $j$, the finite transition
$$
(M,j,B_{j+1}=0,P_j)
\longmapsto
(M,j+1,B_{j+1}=M,0)
\tag{E.10.6}
$$
copies the classical response into the next buffer, advances the token once, and resets $P_j$. Initialize $B_0=M$ at time $0$. For $j=0,\ldots,N-1$, traversal $j$ starts at time $j\tau$ and its tick completes at time $(j+1)\tau$; the receiver response and the token advance in (E.10.6) are unavailable before that completion. Thus the first tick also requires the full duration $\tau$. Register $P_j$ as conditionally uniform with no retained side information, independently for each edge. Register the old message buffer separately with the new exact copy as side information.

Then the unique $v_0$--$v_N$ path is geodesic, has distance $N\delta$, duration $N\tau$, and speed $\delta/\tau$. The one-link case attains both bounds in Theorem E.10.2. With the clock calibration
$$
\tau=\delta/c_*,
\tag{E.10.7}
$$
the retained response front has speed exactly $c_*$. Every message response is reproduced with zero error. The complete per-edge reset ledger is
$$
H(B_j\mid B_{j+1})=0,
\qquad
H(P_j\mid R_j)=\ln2,
\qquad
S_{\mathrm{reset}}\ge N\ln2,
\tag{E.10.8}
$$
and, with $S_{\mathrm{env}}:=\sum_j\langle Q_{\mathrm{bath},j}\rangle/T_j=k_BS_{\mathrm{reset}}$ denoting the registered reset-only export ledger of Corollary E.10.1, the conditional Landauer bound is $S_{\mathrm{env}}\ge k_BN\ln2$. Writing any excess in this same ledger explicitly gives
$$
S_{\mathrm{env}}=k_BN\ln2+S_{\mathrm{excess}},
\qquad S_{\mathrm{excess}}\ge0.
\tag{E.10.9}
$$

*Proof.* A path graph has only one route between its endpoints, so its length is $N\delta$ and no shortcut exists. Serialization and the exact tick gate give duration $N\tau$; $N=1$ proves one-link attainment, and (E.10.7) gives the calibrated speed. The deterministic copy in (E.10.6) preserves the labeled message response. Given the downstream copy, the old message buffer is known and has zero conditional entropy. The independent uniform work bit has conditional entropy $\ln2$, so Theorem 31 gives the per-edge reset lower bound and additivity gives (E.10.8)--(E.10.9). ∎

**Resolution TV-EHOR-03-R1 (Metadata).** Exact domain: every uniform finite path length $N$ in the state machine (E.10.5)--(E.10.9), including the one-link member. Premises: exact serialization, common edge length $\delta$, tick duration $\tau$, independent uniform clock-work bits and the declared classical-copy response. Equivalence: realizations are compared by the joint message, clock and reset-ledger responses. Budget: every edge, tick, buffer and reset entry along the full path. Verifier: unique-path census, transition-table evaluation, clock calibration and conditional-entropy calculation. Falsifier: a shortcut, early tick, message error, unattained one-link bound or missing/miscalculated reset lower-bound entry. Provenance class: source-internal finite conditional construction. Downstream consumers: Definition E.10.1, Theorems E.10.1--E.10.2 and `TV-EHOR-03`. Theorem E.10.3 gives `positive-discharge` only of the uniform-path geodesic, one-link, clock-calibration and conditional reset-ledger component. The general weighted-graph path problem and a response-faithful formal cyclic reset realization, including attainment of the Landauer lower bound, remain open; `TV-EHOR-03` is therefore partial.

### E.10.3 Summary

Long-distance reset costs and propagation speed come from different assumptions. Reset cost depends on actual erasures along the route; the speed limit depends on link length, traversal time, and serial transfer. Equality with the speed of light requires further attainment and spacetime conditions.

**Technical ledger.**

| Result | Statement | Origin |
|:-------|:----------|:-------|
| Theorem E.10.1 | Linear long-range cost holds only under its registered reset-operation and benefit certificates | Conditional PCE ledger |
| Theorem E.10.2 | $v_{\mathrm{ser}}\le\delta/\tau_{\min}$; equality with $c$ only under one-link attainment and scale identification | Registered serialized edge clock + spacing; separate attainment |
| Corollary E.10.1 | $S_{\mathrm{env}}(t)/t\ge r_{\mathrm{upd}}(t)k_B\bar h_t$ for the registered reset-only mean-heat/temperature export ledger and $t>0$ | Conditional Landauer ledger + finite-window completed-update count |


| Corollary E.10.2 | Serialized locality gives a conditional speed upper bound | Registered serialization, edge clock, spacing, and metric bounds |

The registered serialized branch yields a finite operational speed upper bound from its edge-length and edge-time data. An attained light-cone speed and the equality $c=\delta/\tau_{\min}$ require the separate one-link-attainment, scale-identification, and Corollary 46a/Appendix O Lorentzian hypotheses. They do not follow from entropy cost or PCE optimization alone.

---


## E.11 Conclusion

The appendix derives a conditional boundary-area information law and separates it from reset heat and propagation speed. Full area-law equality needs channels that reach capacity plus density and calibration data; a speed bound needs independent link-length and clock assumptions. Together these results supply the thermodynamic input used by the later gravity construction.

**Technical ledger.**

This appendix gives a conditional operational area-law construction, bulk and horizon refinements, and the two scoped results of Section E.10: registered reset operations can carry a linear implementation cost, while independent serialized edge-length and edge-time hypotheses give a propagation-speed upper bound. The area-law argument has two branch-qualified stages:

**Stage 1 (Boundary Correlations and Operational Area Law, Sections E.6.1–E.6.3):** On the independently registered local many-body branch, the finite-range and bounded-strength hypotheses give a Lieb-Robinson bound; the refresh/minorization branch separately gives a mixing gap; and exponential clustering requires the additional uniform certificate in Lemma E.6.1. A distribution-free boundary law holds for mutual information in finite-range Gibbs states under Theorem E.4a. A von Neumann entanglement-entropy area law is theorem-level in the stated one-dimensional gapped setting; the higher-dimensional entanglement area inequality remains the explicit ansatz of Theorem E.4'.

**Stage 2 (Operational Channel Counting, Sections E.6.4–E.6.5):** A completed reset gives the support-loss capacity bound of Proposition E.2a. Strict contraction requires the independent full-state refresh/minorization decomposition of Lemma E.1, and Theorem E.2 supplies the strict capacity bound only on that branch. Together with the boundary-density certificate of Theorem E.3, these inputs yield the operational area-law coefficient on the stated branch. The standard $1/(4G)$ normalization and the residual-budget values remain branch calibrations.
**Synthesis:** Equation (E.9) links the emergent coupling $G$ to microscopic MPU parameters. Identifying this $G$ with the experimentally measured Newton constant is a calibration step; after calibration, Equations E.14–E.16 constrain the allowed microscopic parameter combinations. Section 12 uses the proportionality $\delta S\propto\delta\mathcal{A}$ to derive the Einstein Field Equations via the Clausius relation.
