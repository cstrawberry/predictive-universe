# Proof-Life: A Finite Verification-Gated Toy Universe for Proof Reachability

**Abstract**

Proof-Life is a finite grid-based toy universe for the Predictive Universe framework. Its local target library is the disjoint union
$$
\mathcal T_0=\mathcal T_0^{proof}\sqcup\mathcal T_0^{diag}.
$$
The proof sector contains bounded proof-existence targets
$$
O_{\psi,N}:=\mathsf{BProof}_{\mathcal F_0}(\psi,N),
$$
whose truth is decided by a finite verifier over a canonical finite candidate-certificate set. The diagonal sector contains finite protocol targets induced by the phase-indexed diagonal package of Appendix A.5.6a. No diagonal protocol target is identified with an arithmetic proof target unless an explicit coding extension is introduced; the two sectors are typed separately.

Each cell executes prediction, verification, retained update, and reachability growth. A proof target is retained only when a positive certificate or a negative exhaustion trace passes the finite verifier and the associated register has positive expected predictive gain in the PCE quotient. Neighbor propagation is certificate-gated: a positive proof-object may spread only after each receiving cell independently verifies the certificate. Negative bounded facts may be retained by verified exhaustion, but they do not propagate in the minimal positive-certificate broadcast rule unless a separate exhaustion-transmission protocol is added.

The model connects directly to the PU Fundamental Predictive Loop (Definition 4), PCE (Definition 15), finite-response PPI (Definition P.6.2), the SPAP three-role register $(\phi,p_{stored},c_{phase})$ in Theorem 15, and the phase-indexed diagonal access theorem-package of Appendix A.5.6a. In the diagonal sector, the object $E_{B,t}$ realizes the operational separation
$$
\text{active self-target at }t
\quad\longrightarrow\quad
\text{external target at }t
\quad\longrightarrow\quad
\text{historical record at }t+1.
$$
At the labeled proof-access layer, Theorem A.5.6a.8 sharpens this into LITE behavior: register-coherent active admissibility forces
$$
\operatorname{LITE}^{\mathrm{act}}_B(t,e_{B,t},N)=\bot
\quad\text{for every }N,
$$
while faithful historical admissibility recovers the correct historical label for all sufficiently large $N$.

## 1. PU interface and scope

Proof-Life is a finite operational model of the PU update pattern
$$
\text{prediction}
\longrightarrow
\text{verification}
\longrightarrow
\text{retained update}
\longrightarrow
\text{reachability growth}.
$$
It has five internal roles.

1. **Fundamental Predictive Loop.** Each cell selects a target, stores a prediction, verifies the prediction against a finite response, and updates only through the verified register. This is the finite-toy realization of the prediction, verification, and update ordering of Definition 4.

2. **PCE quotienting.** A verification register that gives no positive expected predictive gain is update-null in the retained predictive quotient. This is the toy-instance of Definition 15 and Lemma A.5.6a.5.

3. **PPI finite response.** The objects admitted into the retained toy universe are finite protocol-response objects: bounded proof-existence targets with certificates or finite exhaustion traces, and finite diagonal protocol targets with trace-certified register data. This matches the finite-response formulation of Definition P.6.2.

4. **SPAP phase separation.** Each cell carries the three operational roles
$$
(\phi_i(t),p^{stored}_i(t),c^{phase}_i(t)),
$$
where $\phi_i(t)$ is the active target, $p^{stored}_i(t)$ is the stored prediction, and $c^{phase}_i(t)$ separates prediction, verification, update, and historical readout. This is the finite-grid specialization of the role separation used in Theorem 15 and Appendix A.5.6a.

5. **Typed diagonal access.** A diagonal object $E_{B,t}$ is not silently treated as an element of the bounded arithmetic formula list $\mathsf{Form}_L$. It enters Proof-Life through $\mathcal T_0^{diag}$ as a finite protocol target governed by Appendix A.5.6a. This preserves the type distinction between bounded proof-existence objects and phase-indexed self-reference objects.

Proof-Life introduces no new physical postulate and no new PU axiom. It is a finite demonstration layer: mathematical proof objects and diagonal protocol objects are the local “physics” of the toy universe, while physical instantiation in the PU sense remains governed by PPI and the main-framework branch ledgers. The role names “survival,” “reproduction,” and “growth” used below are toy-model names for verification, certificate propagation, and retained reachability expansion; they are not biological-life claims.

## 2. The finite certificate calculus $\mathcal F_0(L,N_{\max})$

Fix finite bounds $L,N_{\max}\in\mathbb N$. Let $\mathsf{Form}_L$ be the finite set of arithmetic formulas with integer arguments in $\{0,1,\ldots,L\}$ and one of the following forms:
$$
\mathrm{ADD}(a,b,c),
\qquad
\mathrm{MUL}(a,b,c),
\qquad
\mathrm{EVEN}(n),
\qquad
\mathrm{COMP}(n),
\qquad
\mathrm{PRIME}(n).
$$
The proof-sector target library is a finite subset
$$
\mathcal T_0^{proof}
\subseteq
\{O_{\psi,N}:\psi\in\mathsf{Form}_L,\ 0\le N\le N_{\max}\}.
$$

### 2.1 Canonical relevant certificate candidates

For each formula $\psi$ and bound $N$, Proof-Life uses a canonical finite candidate set
$$
\mathsf{Cand}_{\mathcal F_0}(\psi,N).
$$
This set is the admissible evidence space for the bounded target. Arbitrary strings outside this set may be transmitted as data, but they are not admissible certificates for $O_{\psi,N}$.

The candidate set is defined as follows.

For addition,
$$
\mathsf{Cand}_{\mathcal F_0}(\mathrm{ADD}(a,b,c),N)
=
\begin{cases}
\{\mathrm{ADD\_EVAL}(a,b,c)\}, & N\ge1,\\
\varnothing, & N=0.
\end{cases}
$$
For multiplication,
$$
\mathsf{Cand}_{\mathcal F_0}(\mathrm{MUL}(a,b,c),N)
=
\begin{cases}
\{\mathrm{MUL\_EVAL}(a,b,c)\}, & N\ge1,\\
\varnothing, & N=0.
\end{cases}
$$
For evenness,
$$
\mathsf{Cand}_{\mathcal F_0}(\mathrm{EVEN}(n),N)
=
\begin{cases}
\{\mathrm{EVEN\_WITNESS}(w):0\le w\le n\}, & N\ge1,\\
\varnothing, & N=0.
\end{cases}
$$
For compositeness,
$$
\mathsf{Cand}_{\mathcal F_0}(\mathrm{COMP}(n),N)
=
\begin{cases}
\{\mathrm{FACTOR}(u,v):2\le u<n,\\ 2\le v<n\}, & N\ge1,\\
\varnothing, & N=0.
\end{cases}
$$
For primality, let
$$
D_n=(2,3,\ldots,\lfloor\sqrt n\rfloor),
$$
with $D_n=()$ when $\lfloor\sqrt n\rfloor<2$. Then
$$
\mathsf{Cand}_{\mathcal F_0}(\mathrm{PRIME}(n),N)
=
\begin{cases}
\{\mathrm{PRIME\_TRIAL}(D_n)\}, & 1+|D_n|\le N,\\
\varnothing, & 1+|D_n|>N.
\end{cases}
$$

Thus every $\mathsf{Cand}_{\mathcal F_0}(\psi,N)$ is finite by construction. This is the finiteness fact used by the bounded proof predicate; it does not depend on the false claim that all syntactic certificates of small nominal cost are finite.

### 2.2 Verifier and cost

The raw verifier
$$
V_{\mathcal F_0}^{raw}(p,\psi)\in\{0,1\}
$$
accepts exactly the following certificates.

For addition,
$$
V_{\mathcal F_0}^{raw}(\mathrm{ADD\_EVAL}(a,b,c),\mathrm{ADD}(a,b,c))=1
\Longleftrightarrow
a+b=c.
$$
For multiplication,
$$
V_{\mathcal F_0}^{raw}(\mathrm{MUL\_EVAL}(a,b,c),\mathrm{MUL}(a,b,c))=1
\Longleftrightarrow
ab=c.
$$
For evenness,
$$
V_{\mathcal F_0}^{raw}(\mathrm{EVEN\_WITNESS}(w),\mathrm{EVEN}(n))=1
\Longleftrightarrow
2w=n.
$$
For compositeness,
$$
V_{\mathcal F_0}^{raw}(\mathrm{FACTOR}(u,v),\mathrm{COMP}(n))=1
\Longleftrightarrow
1<u<n,
\quad
1<v<n,
\quad
uv=n.
$$
For primality,
$$
V_{\mathcal F_0}^{raw}(\mathrm{PRIME\_TRIAL}(D),\mathrm{PRIME}(n))=1
$$
if and only if $n\ge2$, $D=(2,3,\ldots,\lfloor\sqrt n\rfloor)$, and no $d\in D$ divides $n$.

The certificate costs are
$$
\operatorname{cost}(\mathrm{ADD\_EVAL})=
\operatorname{cost}(\mathrm{MUL\_EVAL})=
\operatorname{cost}(\mathrm{EVEN\_WITNESS})=
\operatorname{cost}(\mathrm{FACTOR})=1,
$$
while
$$
\operatorname{cost}(\mathrm{PRIME\_TRIAL}(D))=1+|D|.
$$
The bounded verifier is
$$
V_{\mathcal F_0}(p,\psi,N)=1
$$
if and only if
$$
p\in\mathsf{Cand}_{\mathcal F_0}(\psi,N),
\qquad
\operatorname{cost}(p)\le N,
\qquad
V_{\mathcal F_0}^{raw}(p,\psi)=1.
$$

For every $N\le N_{\max}$, define the bounded proof-existence object
$$
O_{\psi,N}:=\mathsf{BProof}_{\mathcal F_0}(\psi,N)
$$
by
$$
O_{\psi,N}=1
\Longleftrightarrow
\exists p\in\mathsf{Cand}_{\mathcal F_0}(\psi,N)
\bigl(
V_{\mathcal F_0}(p,\psi,N)=1
\bigr).
$$
Because $\mathsf{Form}_L$ is finite and every $\mathsf{Cand}_{\mathcal F_0}(\psi,N)$ is finite, every $O_{\psi,N}$ is mechanically decidable. The target says that a bounded proof-certificate exists; it does not assert unbounded theoremhood.

### 2.3 Exhaustion traces

A negative verified target is not an informal failure to find a proof. It is a finite exhaustion object
$$
\operatorname{Exh}_{\mathcal F_0}(\psi,N)
=
(\psi,N,(p_1,\ldots,p_m)),
$$
where $(p_1,\ldots,p_m)$ is the canonical ordered enumeration of $\mathsf{Cand}_{\mathcal F_0}(\psi,N)$.

The exhaustion verifier accepts exactly when
$$
(p_1,\ldots,p_m)=\operatorname{Enum}(\mathsf{Cand}_{\mathcal F_0}(\psi,N))
$$
and
$$
\forall k\in\{1,\ldots,m\},
\quad
V_{\mathcal F_0}(p_k,\psi,N)=0.
$$
Thus a trace containing only a count, an incomplete list, a reordered noncanonical list, or a list that omits a candidate is rejected. Since the candidate list is finite, such an exhaustion trace is finite and checkable.

The standard logical background for finite proof predicates, diagonalization, and computable verification is the arithmetization and computability tradition of Gödel, Kleene, and Turing [Gödel 1931; Kleene 1952; Turing 1936]. The bounded-certificate viewpoint is aligned with the proof-complexity perspective in which proof length, proof search, and verification resources are explicitly tracked [Cook and Nguyen 2010].

## 3. Proof-Life cells and target types

Let
$$
\Lambda\subseteq\mathbb Z^2
$$
be a finite grid. The full finite target library is
$$
\mathcal T_0=\mathcal T_0^{proof}\sqcup\mathcal T_0^{diag}.
$$
The proof sector $\mathcal T_0^{proof}$ is defined in Section 2. The diagonal sector is a finite set of protocol targets of the form
$$
\mathsf{Diag}(B,t,\eta,N),
$$
where $B$ is a trace-certified predictor, $t$ is a targeted time, $\eta$ is one of the access modes
$$
\eta\in\{\mathrm{act},\mathrm{ext},\mathrm{hist},\mathrm{lite\text{-}act},\mathrm{lite\text{-}hist}\},
$$
and $N$ is the finite proof-search or trace-bound parameter when the LITE layer is invoked. The diagonal verifier is not $V_{\mathcal F_0}$. It is the finite phase-access verifier induced by Definition A.5.6a.1 and Theorems A.5.6a.2--A.5.6a.8. This preserves the type distinction
$$
O_{\psi,N}\in\mathcal T_0^{proof},
\qquad
\mathsf{Diag}(B,t,\eta,N)\in\mathcal T_0^{diag}.
$$

Each cell $i\in\Lambda$ has state
$$
S_i(t)=
\bigl(
M_i(t),D_i(t),\phi_i(t),p^{stored}_i(t),c^{phase}_i(t),R_i(t),B_i(t),H_i(t)
\bigr).
$$
The components are:
$$
M_i(t)=\text{cell }i\text{'s retained predictive model},
$$
$$
D_i(t)=\text{cell }i\text{'s retained database of verified target records},
$$
$$
\phi_i(t)=\text{the active target in }\mathcal T_0,
$$
$$
p^{stored}_i(t)=\text{the stored prediction about the active target},
$$
$$
c^{phase}_i(t)=\text{the phase marker},
$$
$$
R_i(t)=\text{the finite verification register},
$$
$$
B_i(t)=\text{the local proof-search or protocol budget},
$$
$$
H_i(t)=\text{the finite history of prior targeted registers}.
$$
The explicit MPU role triad is
$$
\boxed{(\phi_i(t),p^{stored}_i(t),c^{phase}_i(t))}.
$$
The active target $\phi_i(t)$ is not identified with a stored past record. The phase marker $c^{phase}_i(t)$ separates the live prediction phase from verification, retained update, and historical evaluation. This separation is essential for embedding the A.5.6a diagonal access structure without confusing an active self-target with a past register value.

## 4. Local Proof-Life cycle

Each cell executes the same finite cycle.

### 4.1 Target selection

The cell selects a target
$$
\phi_i(t)=\theta_i(t)\in\mathcal T_0.
$$
If $\theta_i(t)\in\mathcal T_0^{proof}$, then
$$
\theta_i(t)=O_{\psi,N}
$$
for some $\psi\in\mathsf{Form}_L$ and $N\le N_{\max}$. If $\theta_i(t)\in\mathcal T_0^{diag}$, then $\theta_i(t)$ is a trace-certified diagonal protocol target of the form $\mathsf{Diag}(B,t,\eta,N)$.

The target may be generated from the retained model, imported from a neighboring broadcast, selected from a local frontier, or supplied by the finite diagonal protocol layer.

### 4.2 Prediction

For proof-sector targets, the cell writes
$$
p^{stored}_i(t)\in\{1,0,\bot\}.
$$
The meanings are:
$$
1=\text{a proof-certificate exists within bound }N,
$$
$$
0=\text{no admissible proof-certificate exists within bound }N,
$$
$$
\bot=\text{no Boolean prediction is delivered by the cycle boundary}.
$$
This is the same three-valued register convention used in Definition A.5.6a.1.

For diagonal-sector targets, the prediction is a finite protocol label appropriate to the access mode. In the active and historical processing modes it is a Boolean processing label or $\bot$; in the LITE modes it is either a labeled proof output or $\bot$.

### 4.3 Verification

The verification register has the generic form
$$
R_i(t)=
\bigl(
\theta_i(t),p^{stored}_i(t),y_i(t),w_i(t)
\bigr),
$$
where $y_i(t)$ is the verified target value or label, and $w_i(t)$ is finite evidence.

For proof-sector targets $\theta_i(t)=O_{\psi,N}$, the verifier decides the target by $\mathcal F_0(L,N_{\max})$.

If $p^{stored}_i(t)=1$, the cell must supply a certificate $p$ such that
$$
V_{\mathcal F_0}(p,\psi,N)=1.
$$
If $p^{stored}_i(t)=0$, the cell must supply a finite exhaustion trace
$$
\operatorname{Exh}_{\mathcal F_0}(\psi,N)
$$
accepted by the exhaustion verifier of Section 2.3.

A proof-sector register passes exactly when the stored prediction agrees with the verified value and the required witness is valid:
$$
\operatorname{Pass}(R_i(t))
\Longleftrightarrow
\bigl(p^{stored}_i(t)=1\land y_i(t)=1\land w_i(t)\text{ is a valid bounded certificate}\bigr)
$$
$$
\lor
\bigl(p^{stored}_i(t)=0\land y_i(t)=0\land w_i(t)\text{ is a valid exhaustion trace}\bigr).
$$
If $p^{stored}_i(t)=\bot$, the cell has not actively processed the target at that cycle boundary.

For diagonal-sector targets, the finite evidence $w_i(t)$ is the trace-certified register and history data required by the corresponding access mode. The verifier uses the finite checks specified by Appendix A.5.6a: active self-processing is rejected at the targeted phase, external model-access is accepted when the external register value is available without becoming the active self-target, historical access is accepted after the old register has been appended, and LITE labels are checked against the active or historical admissibility relation.

### 4.4 Retained update

Let $Q_i$ be the predictive-quality functional for cell $i$ and let $\mathcal U_i$ be its admissible update family. For an update $U\in\mathcal U_i$, define
$$
\Delta Q_U(M_i(t),R_i(t))
=
Q_i(U(M_i(t),R_i(t)))-Q_i(M_i(t)).
$$
A passing register is informative when
$$
\sup_{U\in\mathcal U_i}
\mathbb E[
\Delta Q_U(M_i(t),R_i(t))
\mid M_i(t)
]>0.
$$
The retained database evolves by
$$
D_i(t+1)=D_i(t)\cup\{(\theta_i(t),y_i(t),w_i(t))\}
$$
only when the register both passes and is informative. If the register fails or is chance-null, then
$$
[D_i(t+1)]_Q=[D_i(t)]_Q,
\qquad
[M_i(t+1)]_Q=[M_i(t)]_Q.
$$
Thus random guessing, unconstrained assertion, fake exhaustion, and repeated echoing of already-null information do not grow the retained proof universe.

The reference implementation below uses the finite novelty functional
$$
Q_i(D_i)=|D_i|,
$$
with duplicate target records quotiented as zero-gain repeats. In that executable instance, a passing nonduplicate register has positive gain and a duplicate passing register is retained-null. This is a concrete finite PCE toy functional, not a replacement for the full PU quality functional.

The local growth law is
$$
\boxed{
\text{retained growth}
\Longrightarrow
\text{validated predictive information}.
}
$$

## 5. Neighbor propagation

Let $N(i)$ be the finite neighborhood of cell $i$. When cell $i$ verifies a positive proof-sector target
$$
O_{\psi,N}=1
$$
with certificate $p$, it may broadcast
$$
(\psi,N,p)
$$
to neighboring cells $j\in N(i)$.

A neighbor may import the fact only if it independently verifies
$$
V_{\mathcal F_0}(p,\psi,N)=1.
$$
The receiving update is therefore
$$
D_j(t+1)=D_j(t)\cup\{(O_{\psi,N},1,p)\}
$$
only after local verification and positive gain in the recipient's quotient. A false certificate may be transmitted as a string, but it cannot become retained knowledge.

Negative bounded facts may be retained locally when an exhaustion trace passes. They are not propagated by the minimal positive-certificate broadcast rule unless the communication protocol is extended to transmit and verify the full exhaustion trace. This keeps the base model conservative: positive proof-objects reproduce by checkable witnesses, while negative bounded targets require local or explicitly transmitted finite exhaustion.

Diagonal-sector targets do not propagate by the positive proof-certificate broadcast rule. They may be shared only by a protocol that transmits the required trace-certified register and history data for the selected diagonal access mode.

## 6. Reachability horizons

Define the local target-reachability horizon of cell $i$ by
$$
\mathcal H_i^{reach}(t)=
\{\theta\in\mathcal T_0:
\theta\text{ is processable by }M_i(t)\text{ within budget }B_i(t)\}.
$$
A target is locally barred for cell $i$ at time $t$ when it is determinate and checkable in its own sector but
$$
\theta\notin\mathcal H_i^{reach}(t).
$$
A retained transition crosses the local horizon when
$$
\theta\notin\mathcal H_i^{reach}(t)
\qquad\text{and}\qquad
\theta\in\mathcal H_i^{reach}(t+1).
$$
Assume the retained horizon is invariant under predictive equivalence:
$$
[M]_Q=[M']_Q
\Longrightarrow
\mathcal H^{reach}(M)=\mathcal H^{reach}(M').
$$
Then Theorem A.5.6a.6 applies directly: if a retained transition moves a determinate target from outside the horizon to inside it, the responsible register cannot be chance-null. Therefore
$$
\theta\notin\mathcal H_i^{reach}(t)
\land
\theta\in\mathcal H_i^{reach}(t+1)
\Longrightarrow
\sup_{U\in\mathcal U_i}
\mathbb E[\Delta Q_U(M_i(t),R_i(t))\mid M_i(t)]>0.
$$
Proof-Life has reachability growth, but the growth is verification-gated rather than assertion-gated.

## 7. Complexity accounting

Define local cell complexity by
$$
C_i(t)=
\alpha |D_i(t)|+
\beta B_i(t)+
\gamma |\mathcal H_i^{reach}(t)|+
\delta C_{agg}(M_i(t)),
$$
where
$$
\alpha,\beta,\gamma,\delta\ge0,
$$
and
$$
|D_i(t)|=\text{retained target-record count},
$$
$$
B_i(t)=\text{proof-search or protocol budget},
$$
$$
|\mathcal H_i^{reach}(t)|=\text{reachable target count},
$$
$$
C_{agg}(M_i(t))=\text{aggregate model complexity}.
$$
A grid-level complexity measure is
$$
C_\Lambda(t)=\sum_{i\in\Lambda}C_i(t).
$$
In the monotone retained-database variant,
$$
D_i(t)\subseteq D_i(t+1).
$$
If budget and horizon expansions are also admitted only through informative passing registers, then every retained increase of $C_i(t)$ comes from validated target-access, not from noise. This is the proof-object analogue of PU's general PCE rule: response-null surplus is quotiented, while cost-bearing retained growth must be justified by predictive gain.

## 8. Phase-indexed diagonal access inside Proof-Life

Appendix A.5.6a supplies a time-indexed prediction register
$$
P_B:\mathbb N\times\mathbb N\to\{1,0,\bot\}
$$
and, for every trace-certified predictor $B$ and time $t$, a diagonal sentence $E_{B,t}$ with code $e_{B,t}$ such that
$$
E_{B,t}
\leftrightarrow
\neg\operatorname{Pred}_B(t,e_{B,t}).
$$
In the standard model this means
$$
\mathbb N\models E_{B,t}
\Longleftrightarrow
P_B(t,e_{B,t})\ne1.
$$
Proof-Life realizes this access structure through $\mathcal T_0^{diag}$, not by pretending that $E_{B,t}$ is an element of $\mathsf{Form}_L$.

At the targeted time,
$$
\neg\operatorname{Proc}_B(E_{B,t},t).
$$
The three cases are exhaustive:
$$
P_B(t,e_{B,t})=1
\Longrightarrow
E_{B,t}\text{ is false},
$$
$$
P_B(t,e_{B,t})=0
\Longrightarrow
E_{B,t}\text{ is true},
$$
$$
P_B(t,e_{B,t})=\bot
\Longrightarrow
B\text{ gives no Boolean prediction}.
$$
Thus $B$ cannot stably process its own active diagonal target at the targeted time.

A neighboring or external cell $A$ with model access to $B$'s time-$t$ register can process the same object without putting that value into $A$'s own active self-target register. Define
$$
P_A(t,e_{B,t})=
\begin{cases}
0, & P_B(t,e_{B,t})=1,\\
1, & P_B(t,e_{B,t})\in\{0,\bot\}.
\end{cases}
$$
Then
$$
\operatorname{Proc}_A(E_{B,t},t).
$$
After $B$ appends the historical record
$$
H_{B,t+1}=H_{B,t}\cup\{(t,e_{B,t},P_B(t,e_{B,t}))\},
$$
the same old target is no longer a live self-target. It is a past register entry. If $B$ evaluates
$$
P_B(t+1,e_{B,t})=
\begin{cases}
0, & (t,e_{B,t},1)\in H_{B,t+1},\\
1, & (t,e_{B,t},1)\notin H_{B,t+1},
\end{cases}
$$
then
$$
\operatorname{Proc}_B(E_{B,t},t+1).
$$
The regress terminates because $E_{B,t}$ targets $P_B(t,e_{B,t})$, not $P_B(t+1,e_{B,t})$. A fresh diagonal object $E_{B,t+1}$ can be constructed against the next active register, but it is a new target.

Proof-Life therefore contains the operational triality
$$
\boxed{
\text{active self-target}
\quad\longrightarrow\quad
\text{external target}
\quad\longrightarrow\quad
\text{historical record}.
}
$$
The bookkeeping roles that make the triality well typed are
$$
\boxed{
\phi
\quad
p_{stored}
\quad
c_{phase}.
}
$$
The active proposition $\phi$ carries the self-targeting obstruction, the stored prediction preserves the old register value, and the phase marker separates active prediction from historical evaluation. These are operational roles, not logical equivalences.

At the labeled proof-search layer, Proof-Life uses the same distinction. Let $e=e_{B,t}$ and let $y^*_{B,t}$ be the historical label determined by the frozen register. Active admissibility is register-coherent only when an admitted proof for label $y$ agrees with the live register value $P_B(t,e)=y$. Therefore a live cell cannot admit any labeled proof of its own diagonal target as active evidence without creating the consistency contradiction in Theorem A.5.6a.8:
$$
\operatorname{LITE}^{\mathrm{act}}_B(t,e_{B,t},N)=\bot
\quad\text{for every }N.
$$
After the directed historical update, the old register is no longer live self-target data. If the historical admissibility relation admits the finite trace proof of $y^*_{B,t}$, then for all sufficiently large $N$,
$$
\operatorname{LITE}^{\mathrm{hist}}_B(t+1,e_{B,t},N)\ne\bot,
$$
and the returned label is $y^*_{B,t}$. Thus the toy grid distinguishes formal proof existence from active proof admission and from historical proof recovery.

## 9. Main theorem

**Theorem PL.1 (Proof-Life finite toy universe).** Fix finite $L,N_{\max}\in\mathbb N$, a finite grid $\Lambda$, a finite proof-sector target library $\mathcal T_0^{proof}$, a finite diagonal-sector target library $\mathcal T_0^{diag}$, and
$$
\mathcal T_0=\mathcal T_0^{proof}\sqcup\mathcal T_0^{diag}.
$$
Assume:

1. $\mathcal F_0(L,N_{\max})$ uses the canonical finite candidate-certificate sets of Section 2;
2. proof-sector negative evidence is accepted only by the full exhaustion verifier of Section 2.3;
3. the admissible update family satisfies the PCE quotient rule of Lemma A.5.6a.5;
4. retained reachability horizons are invariant under predictive equivalence;
5. every diagonal-sector target is supplied with the trace-certification and access-mode hypotheses required by Appendix A.5.6a;
6. whenever the LITE layer is invoked, active admissibility is register-coherent and historical admissibility is faithful in the sense of Theorem A.5.6a.8.

Then there exists a finite grid-based toy universe in which:

1. proof-sector predicted objects are bounded proof-existence targets $O_{\psi,N}$;
2. diagonal-sector predicted objects are typed phase-access targets $\mathsf{Diag}(B,t,\eta,N)$;
3. retained growth occurs only through passing verification registers with positive expected predictive gain;
4. positive proof-facts propagate only through independently verified certificates;
5. negative proof-sector facts are retained only through complete finite exhaustion traces;
6. locally barred determinate targets can enter a cell's retained reachability horizon only through a non-chance-null register;
7. A.5.6a diagonal objects exhibit self-inaccessibility at the targeted phase, external accessibility at the same time, historical accessibility after the targeted register is recorded, active labeled LITE miss under register-coherent admissibility, and historical labeled LITE recovery under faithful historical admissibility.

*Proof.* Fix $\Lambda$, $L$, $N_{\max}$, $\mathcal T_0^{proof}$, and $\mathcal T_0^{diag}$. For every $\psi\in\mathsf{Form}_L$ and $N\le N_{\max}$, Section 2 defines a finite set $\mathsf{Cand}_{\mathcal F_0}(\psi,N)$. Therefore the truth value of every proof-sector target $O_{\psi,N}$ is decided by a finite search through that set.

Assign each cell $i\in\Lambda$ a finite state
$$
S_i(t)=
\bigl(
M_i(t),D_i(t),\phi_i(t),p^{stored}_i(t),c^{phase}_i(t),R_i(t),B_i(t),H_i(t)
\bigr).
$$
At each cycle the cell selects a target in $\mathcal T_0$, writes a stored prediction, and forms a verification register. For a proof-sector positive prediction, the verifier requires a bounded certificate $p\in\mathsf{Cand}_{\mathcal F_0}(\psi,N)$ accepted by $V_{\mathcal F_0}$. For a proof-sector negative prediction, the verifier requires the canonical finite exhaustion list and checks that every listed candidate fails. Hence fake negative evidence, including a trace that only reports a count or omits candidates, is rejected.

By the retained update rule, $D_i$ and $M_i$ change in the predictive quotient only when the register passes and has positive expected predictive gain. Lemma A.5.6a.5 gives quotient-nullity for chance-null registers, so chance-null records do not generate retained growth.

For propagation, a receiving neighbor imports a positive proof-fact only after verifying the broadcast certificate against $V_{\mathcal F_0}$ and the stated bound. Hence valid positive certificates may spread through the grid, but invalid certificates cannot become retained proof-facts. Negative bounded facts require a complete exhaustion trace and therefore do not propagate in the minimal positive-certificate broadcast rule.

For horizon movement, retained-horizon invariance under predictive equivalence is an explicit hypothesis. If a determinate target moves from outside to inside a cell's retained reachability horizon, Theorem A.5.6a.6 implies that the responsible verification register has positive expected predictive gain. Thus reachability growth is verification-gated.

Finally, take any diagonal-sector target $\mathsf{Diag}(B,t,\eta,N)\in\mathcal T_0^{diag}$. By hypothesis, $B$ is trace-certified and the selected access mode supplies the finite register and history data required by Appendix A.5.6a. Theorem A.5.6a.2 gives the diagonal object $E_{B,t}$ with code $e_{B,t}$. Theorem A.5.6a.3 gives
$$
\neg\operatorname{Proc}_B(E_{B,t},t).
$$
Theorem A.5.6a.4 gives external accessibility for a separated model-access cell $A$ and historical accessibility for $B$ after the time-$t$ register is appended to $H_{B,t+1}$.

For the proof-access layer, register-coherent active admissibility is an explicit hypothesis. Theorem A.5.6a.8 then gives
$$
\operatorname{LITE}^{\mathrm{act}}_B(t,e_{B,t},N)=\bot
\quad\text{for every }N.
$$
The same theorem gives a finite proof code for the correct historical label and, after faithful historical admissibility,
$$
\operatorname{LITE}^{\mathrm{hist}}_B(t+1,e_{B,t},N)\ne\bot
$$
for every sufficiently large $N$, with the returned label equal to $y^*_{B,t}$. These are precisely the stated diagonal processing and labeled proof-access modes. ∎

## 10. Reference implementation

The following reference implementation is a finite executable instance of the Proof-Life construction. It implements the bounded certificate calculus, complete finite exhaustion verification, verification-gated retention, positive-certificate propagation, and the A.5.6a diagonal access triality.

Save as `proof_life.py` and run:

```bash
python proof_life.py
```

```python
from __future__ import annotations

from dataclasses import dataclass, field
from typing import Any, Dict, Iterable, List, Optional, Tuple, Union
import math
import random


@dataclass(frozen=True)
class Formula:
    kind: str
    args: Tuple[int, ...]

    def __str__(self) -> str:
        inside = ",".join(map(str, self.args))
        return f"{self.kind}({inside})"


@dataclass(frozen=True)
class Certificate:
    rule: str
    args: Tuple[Any, ...]

    def __str__(self) -> str:
        inside = ",".join(map(str, self.args))
        return f"{self.rule}[{inside}]"


@dataclass(frozen=True)
class ProofTarget:
    formula: Formula
    bound: int

    def code(self) -> str:
        return f"BPROOF[{self.formula};<= {self.bound}]"

    def __str__(self) -> str:
        return self.code()


@dataclass(frozen=True)
class ExhaustionTrace:
    formula: Formula
    bound: int
    checked: Tuple[Certificate, ...]

    def __str__(self) -> str:
        return f"EXH[{self.formula};<= {self.bound}; checked={len(self.checked)}]"


Evidence = Union[Certificate, ExhaustionTrace, None]


class ToyProofSystem:
    """
    A finite certificate calculus for bounded proof-existence claims.

    A ProofTarget(formula, bound) is true exactly when the canonical finite
    candidate set contains a valid certificate for formula whose cost is at
    most the stated bound.
    """

    def raw_verify(self, formula: Formula, cert: Certificate) -> bool:
        k = formula.kind
        a = formula.args

        if k == "ADD" and cert.rule == "ADD_EVAL":
            x, y, z = a
            return cert.args == a and x + y == z

        if k == "MUL" and cert.rule == "MUL_EVAL":
            x, y, z = a
            return cert.args == a and x * y == z

        if k == "EVEN" and cert.rule == "EVEN_WITNESS":
            (n,) = a
            if len(cert.args) != 1:
                return False
            (w,) = cert.args
            return isinstance(w, int) and 2 * w == n

        if k == "COMP" and cert.rule == "FACTOR":
            (n,) = a
            if len(cert.args) != 2:
                return False
            u, v = cert.args
            return (
                all(isinstance(x, int) for x in (u, v))
                and 1 < u < n
                and 1 < v < n
                and u * v == n
            )

        if k == "PRIME" and cert.rule == "PRIME_TRIAL":
            (n,) = a
            if n < 2:
                return False
            divisors = tuple(range(2, math.isqrt(n) + 1))
            return cert.args == divisors and all(n % d != 0 for d in divisors)

        return False

    def proof_cost(self, cert: Certificate) -> int:
        if cert.rule == "PRIME_TRIAL":
            return 1 + len(cert.args)
        return 1

    def candidate_certificates(self, formula: Formula, bound: int) -> Tuple[Certificate, ...]:
        """
        Returns the canonical finite certificate candidates relevant to this
        toy calculus and this bounded target. Only candidates with cost <= bound
        are included. The enumeration is part of the negative-exhaustion witness.
        """
        if bound < 0:
            return tuple()

        k = formula.kind
        a = formula.args
        out: List[Certificate] = []

        if k == "ADD" and bound >= 1:
            out.append(Certificate("ADD_EVAL", a))

        elif k == "MUL" and bound >= 1:
            out.append(Certificate("MUL_EVAL", a))

        elif k == "EVEN" and bound >= 1:
            (n,) = a
            for w in range(0, max(n, 0) + 1):
                out.append(Certificate("EVEN_WITNESS", (w,)))

        elif k == "COMP" and bound >= 1:
            (n,) = a
            for u in range(2, max(n, 0)):
                for v in range(2, max(n, 0)):
                    out.append(Certificate("FACTOR", (u, v)))

        elif k == "PRIME":
            (n,) = a
            divisors = tuple(range(2, math.isqrt(n) + 1)) if n >= 2 else tuple()
            cert = Certificate("PRIME_TRIAL", divisors)
            if self.proof_cost(cert) <= bound:
                out.append(cert)

        return tuple(cert for cert in out if self.proof_cost(cert) <= bound)

    def verify_certificate(self, formula: Formula, bound: int, cert: Certificate) -> bool:
        candidates = self.candidate_certificates(formula, bound)
        return cert in candidates and self.raw_verify(formula, cert)

    def search_proof(self, formula: Formula, budget: int) -> Optional[Certificate]:
        for cert in self.candidate_certificates(formula, budget):
            if self.verify_certificate(formula, budget, cert):
                return cert
        return None

    def exhaustion_trace(self, formula: Formula, bound: int) -> ExhaustionTrace:
        checked = self.candidate_certificates(formula, bound)
        for cert in checked:
            if self.verify_certificate(formula, bound, cert):
                raise ValueError("Cannot exhaust: a valid certificate exists within the bound.")
        return ExhaustionTrace(formula=formula, bound=bound, checked=checked)

    def verify_exhaustion_trace(self, trace: ExhaustionTrace) -> bool:
        expected = self.candidate_certificates(trace.formula, trace.bound)
        if trace.checked != expected:
            return False
        return all(not self.verify_certificate(trace.formula, trace.bound, cert) for cert in trace.checked)

    def decide_target(self, target: ProofTarget) -> Tuple[bool, Evidence]:
        cert = self.search_proof(target.formula, target.bound)
        if cert is not None:
            return True, cert
        return False, self.exhaustion_trace(target.formula, target.bound)

    def bounded_theorem_truth(self, target: ProofTarget) -> bool:
        truth, _ = self.decide_target(target)
        return truth


@dataclass
class VerificationRegister:
    target_code: str
    prediction: Any
    truth: bool
    passed: bool
    expected_gain_positive: bool
    evidence: Evidence
    note: str


@dataclass
class Cell:
    name: str
    search_budget: int
    known: Dict[str, Tuple[bool, Evidence]] = field(default_factory=dict)
    history: List[VerificationRegister] = field(default_factory=list)
    broadcasts: List[Tuple[str, Certificate]] = field(default_factory=list)
    score: int = 0

    # PU role triad.
    phi: Optional[ProofTarget] = None
    p_stored: Any = None
    c_phase: str = "idle"

    def predict(
        self,
        target: ProofTarget,
        system: ToyProofSystem,
    ) -> Tuple[Any, Evidence, str]:
        self.phi = target
        self.c_phase = "predict"

        if target.code() in self.known:
            known_truth, evidence = self.known[target.code()]
            self.p_stored = 1 if known_truth else 0
            return self.p_stored, evidence, "retained knowledge"

        local_budget = min(self.search_budget, target.bound)
        cert = system.search_proof(target.formula, local_budget)

        if cert is not None:
            self.p_stored = 1
            return 1, cert, "local proof witness"

        if self.search_budget >= target.bound:
            self.p_stored = 0
            return 0, system.exhaustion_trace(target.formula, target.bound), "exhaustive bounded search"

        self.p_stored = "⊥"
        return "⊥", None, "budget insufficient; abstain"

    def verify_and_update(
        self,
        target: ProofTarget,
        prediction: Any,
        evidence: Evidence,
        system: ToyProofSystem,
        note: str,
    ) -> VerificationRegister:
        self.c_phase = "verify"
        truth, canonical_evidence = system.decide_target(target)

        positive_pass = (
            prediction == 1
            and truth
            and isinstance(evidence, Certificate)
            and system.verify_certificate(target.formula, target.bound, evidence)
        )

        negative_pass = (
            prediction == 0
            and not truth
            and isinstance(evidence, ExhaustionTrace)
            and evidence.formula == target.formula
            and evidence.bound == target.bound
            and system.verify_exhaustion_trace(evidence)
        )

        passed = positive_pass or negative_pass
        expected_gain_positive = passed and target.code() not in self.known

        retained_evidence: Evidence = evidence if passed else canonical_evidence

        if passed and expected_gain_positive:
            self.known[target.code()] = (truth, retained_evidence)
            self.score += 1

            if truth and isinstance(retained_evidence, Certificate):
                self.broadcasts.append((target.code(), retained_evidence))

        reg = VerificationRegister(
            target_code=target.code(),
            prediction=prediction,
            truth=truth,
            passed=passed,
            expected_gain_positive=expected_gain_positive,
            evidence=retained_evidence,
            note=note,
        )

        self.history.append(reg)
        self.c_phase = "update"
        return reg

    def import_broadcast(
        self,
        target: ProofTarget,
        cert: Certificate,
        system: ToyProofSystem,
    ) -> bool:
        if target.code() in self.known:
            return False

        if system.verify_certificate(target.formula, target.bound, cert):
            self.known[target.code()] = (True, cert)
            self.score += 1
            return True

        return False


class ProofLifeGrid:
    def __init__(
        self,
        width: int,
        height: int,
        targets: List[ProofTarget],
        seed: int = 7,
    ):
        self.width = width
        self.height = height
        self.targets = targets
        self.system = ToyProofSystem()
        self.rng = random.Random(seed)
        self.cells: Dict[Tuple[int, int], Cell] = {}

        for y in range(height):
            for x in range(width):
                budget = 1 + ((x + 2 * y) % 5)
                self.cells[(x, y)] = Cell(name=f"C{x}{y}", search_budget=budget)

    def neighbors(self, pos: Tuple[int, int]) -> List[Tuple[int, int]]:
        x, y = pos
        out: List[Tuple[int, int]] = []

        for dx, dy in [(-1, 0), (1, 0), (0, -1), (0, 1)]:
            q = (x + dx, y + dy)
            if q in self.cells:
                out.append(q)

        return out

    def step(self, t: int) -> List[str]:
        events: List[str] = []

        for pos, cell in sorted(self.cells.items()):
            target = self.rng.choice(self.targets)
            pred, evidence, note = cell.predict(target, self.system)

            reg = cell.verify_and_update(
                target=target,
                prediction=pred,
                evidence=evidence,
                system=self.system,
                note=note,
            )

            if reg.expected_gain_positive:
                events.append(
                    f"t={t} {cell.name}: retained {reg.target_code} via {reg.note}"
                )

        outgoing: List[Tuple[Tuple[int, int], str, Certificate]] = []

        for pos, cell in self.cells.items():
            for code, cert in cell.broadcasts:
                outgoing.append((pos, code, cert))
            cell.broadcasts.clear()

        target_by_code = {target.code(): target for target in self.targets}

        for pos, code, cert in outgoing:
            target = target_by_code.get(code)
            if target is None:
                continue

            for npos in self.neighbors(pos):
                neighbor = self.cells[npos]

                if neighbor.import_broadcast(target, cert, self.system):
                    events.append(
                        f"t={t} {neighbor.name}: imported verified {code} "
                        f"from {self.cells[pos].name}"
                    )

        return events

    def total_retained(self) -> int:
        return sum(len(cell.known) for cell in self.cells.values())

    def report(self) -> str:
        lines = []

        for pos, cell in sorted(self.cells.items()):
            lines.append(
                f"{cell.name}: budget={cell.search_budget}, "
                f"retained={len(cell.known)}, score={cell.score}"
            )

        return "\n".join(lines)


def diagonal_truth(register_value: Any) -> bool:
    """Truth of E_{B,t}: 'B does not mark this sentence true at t'."""
    return register_value != 1


def demo_diagonal_triality() -> str:
    """
    Demonstrates the A.5.6a access triality:
    self-target obstruction, external access, and past-record access.
    """
    lines = ["Diagonal access demo"]

    for b_register_at_t in [1, 0, "⊥"]:
        label = str(b_register_at_t)
        e_code = "E[B,0]"

        truth_at_t = diagonal_truth(b_register_at_t)

        b_self_processed = (
            (b_register_at_t == 1 and truth_at_t)
            or (b_register_at_t == 0 and not truth_at_t)
        )

        a_prediction = 0 if b_register_at_t == 1 else 1
        a_processed = (
            (a_prediction == 1 and truth_at_t)
            or (a_prediction == 0 and not truth_at_t)
        )

        history = {
            "time": 0,
            "code": e_code,
            "B_marked_true": (b_register_at_t == 1),
        }

        b_prediction_at_t1 = 0 if history["B_marked_true"] else 1
        b_processed_at_t1 = (
            (b_prediction_at_t1 == 1 and truth_at_t)
            or (b_prediction_at_t1 == 0 and not truth_at_t)
        )

        assert not b_self_processed
        assert a_processed
        assert b_processed_at_t1

        lines.append(
            f"B@t={label}: truth={truth_at_t}; "
            f"B self-processes? {b_self_processed}; "
            f"A external={a_prediction}, processes? {a_processed}; "
            f"B@t+1={b_prediction_at_t1}, processes? {b_processed_at_t1}"
        )

    return "\n".join(lines)


def run_self_checks() -> None:
    system = ToyProofSystem()

    checks = [
        (ProofTarget(Formula("EVEN", (8,)), 1), True),
        (ProofTarget(Formula("EVEN", (9,)), 1), False),
        (ProofTarget(Formula("COMP", (15,)), 1), True),
        (ProofTarget(Formula("COMP", (17,)), 1), False),
        (ProofTarget(Formula("PRIME", (0,)), 1), False),
        (ProofTarget(Formula("PRIME", (2,)), 1), True),
        (ProofTarget(Formula("PRIME", (11,)), 3), True),
        (ProofTarget(Formula("PRIME", (29,)), 6), True),
        (ProofTarget(Formula("ADD", (2, 3, 5)), 1), True),
        (ProofTarget(Formula("MUL", (4, 7, 28)), 1), True),
    ]

    for target, expected in checks:
        observed = system.bounded_theorem_truth(target)
        assert observed == expected, (target, observed, expected)

    negative_target = ProofTarget(Formula("EVEN", (9,)), 1)
    valid_exh = system.exhaustion_trace(negative_target.formula, negative_target.bound)
    assert system.verify_exhaustion_trace(valid_exh)

    fake_exh = ExhaustionTrace(
        formula=negative_target.formula,
        bound=negative_target.bound,
        checked=tuple(),
    )
    assert not system.verify_exhaustion_trace(fake_exh)

    adversarial_cell = Cell(name="ADV", search_budget=1)
    reg = adversarial_cell.verify_and_update(
        target=negative_target,
        prediction=0,
        evidence=fake_exh,
        system=system,
        note="fake exhaustion rejected",
    )
    assert not reg.passed
    assert negative_target.code() not in adversarial_cell.known

    invalid_cert = Certificate("EVEN_WITNESS", (4,))
    assert not system.verify_certificate(negative_target.formula, negative_target.bound, invalid_cert)

    demo_diagonal_triality()


def main() -> None:
    run_self_checks()

    targets = [
        ProofTarget(Formula("EVEN", (8,)), 1),
        ProofTarget(Formula("EVEN", (9,)), 1),
        ProofTarget(Formula("COMP", (15,)), 1),
        ProofTarget(Formula("COMP", (17,)), 1),
        ProofTarget(Formula("PRIME", (11,)), 3),
        ProofTarget(Formula("PRIME", (29,)), 6),
        ProofTarget(Formula("ADD", (2, 3, 5)), 1),
        ProofTarget(Formula("MUL", (4, 7, 28)), 1),
    ]

    print(demo_diagonal_triality())
    print()

    grid = ProofLifeGrid(width=3, height=3, targets=targets, seed=11)

    print("Proof-Life grid demo")
    print("Initial retained objects:", grid.total_retained())

    for t in range(6):
        events = grid.step(t)
        print(f"\nCycle {t}: retained total={grid.total_retained()}")

        for event in events[:8]:
            print(" ", event)

        if len(events) > 8:
            print(f"  ... {len(events) - 8} more events")

    print("\nFinal cell report")
    print(grid.report())


if __name__ == "__main__":
    main()
```

## 11. What the implementation demonstrates

The diagonal demo evaluates all three possible values of $B$'s targeted register:
$$
1,
\qquad
0,
\qquad
\bot.
$$
In every case,
$$
B\text{ fails as active self-target at }t,
$$
$$
A\text{ succeeds as external evaluator at }t,
$$
$$
B\text{ succeeds as historical evaluator at }t+1.
$$
This is the A.5.6a access theorem-package in the toy grid.

The grid demo then runs a finite proof universe. Cells retain objects such as
$$
\mathsf{BProof}_{\mathcal F_0}(\mathrm{EVEN}(8),1),
$$
$$
\mathsf{BProof}_{\mathcal F_0}(\mathrm{COMP}(15),1),
$$
$$
\mathsf{BProof}_{\mathcal F_0}(\mathrm{PRIME}(11),3),
$$
$$
\mathsf{BProof}_{\mathcal F_0}(\mathrm{ADD}(2,3,5),1).
$$
A positive bounded target is retained only when a valid proof-certificate is supplied. A negative bounded target is retained only when the complete finite exhaustion trace is supplied and verified. If a cell lacks the necessary budget, it abstains:
$$
p^{stored}_i(t)=\bot.
$$
A verified proof-certificate may propagate to neighbors, but each neighbor must check it before import.

Thus Proof-Life implements the toy identities
$$
\boxed{\text{survival}=\text{verification}},
$$
$$
\boxed{\text{reproduction}=\text{certificate propagation}},
$$
$$
\boxed{\text{growth}=\text{retained proof-reachability expansion}}.
$$
These identities are internal to the toy model and do not redefine biological life in PU.

## 12. Integration map

Proof-Life uses the following internal PU dependencies.

| Role in Proof-Life | PU source |
|---|---|
| Predict, verify, update cycle | Definition 4 |
| Predictive optimization and quotient-null update | Definition 15; Lemma A.5.6a.5 |
| Finite-response physical instantiation discipline | Definition P.6.2 |
| Three-role SPAP register $(\phi,p_{stored},c_{phase})$ | Theorem 15 |
| Time-indexed diagonal target $E_{B,t}$ | Theorem A.5.6a.2 |
| No stable self-processing at targeted time | Theorem A.5.6a.3 |
| External and historical accessibility | Theorem A.5.6a.4 |
| Labeled active miss and historical proof recovery | Definition A.5.6a.7; Theorem A.5.6a.8; Corollary A.5.6a.9 |
| Verification-gated reachability growth | Theorem A.5.6a.6 |
| Physical thermodynamic reading of irreversible reset, when physically instantiated | Theorem 31; Landauer [1961]; Bennett [1973] |

## 13. Final statement

Proof-Life is a finite, runnable PU toy universe whose proof-sector objects are bounded proof-existence claims and whose diagonal-sector objects are phase-indexed protocol targets. Its cells do not merely hold beliefs. They make predictions about typed finite targets, verify those predictions through finite certificates, complete finite exhaustion traces, or trace-certified diagonal access data, retain only validated predictive information, and propagate positive proof-certificates only after independent verification.

The model realizes the PU structure
$$
\boxed{
\text{prediction}
\to
\text{verification}
\to
\text{retained update}
\to
\text{reachability growth}
}
$$
and the A.5.6a access structure
$$
\boxed{
\text{active self-target inaccessible}
\to
\text{external target accessible}
\to
\text{past record accessible}
}.
$$
Therefore Proof-Life is a finite proof-verification model of a predictive universe in which local growth is gated by validated proof-access, phase-indexed self-reference is handled by the stored-register/historical-record distinction, and labeled proof access separates formal proofhood from active admissible evidence.

## References

* Bennett, C. H. (1973). Logical reversibility of computation. *IBM Journal of Research and Development*, *17*(6), 525--532. DOI: 10.1147/rd.176.0525
* Cook, S., & Nguyen, P. (2010). *Logical Foundations of Proof Complexity*. Cambridge University Press.
* Gödel, K. (1931). Über formal unentscheidbare Sätze der Principia Mathematica und verwandter Systeme I. *Monatshefte für Mathematik und Physik*, *38*(1), 173--198. DOI: 10.1007/BF01700692
* Kleene, S. C. (1952). *Introduction to Metamathematics*. Amsterdam: North-Holland Publishing Company & Groningen: P. Noordhoff N.V.
* Landauer, R. (1961). Irreversibility and heat generation in the computing process. *IBM Journal of Research and Development*, *5*(3), 183--191. DOI: 10.1147/rd.53.0183
* Turing, A. M. (1936). On computable numbers, with an application to the Entscheidungsproblem. *Proceedings of the London Mathematical Society*, s2-42(1), 230--265. DOI: 10.1112/plms/s2-42.1.230
