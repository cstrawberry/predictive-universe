# Proof-Life: A Finite Verification-Gated Toy Universe for Proof Reachability

**Abstract**

Receiver-relative evidence in Sections 12.1–12.8 uses heterogeneous evidence budgets, frozen capacity records, Fisher self-model geometry and a certified integration rule. A constructive pair of histories retains the same verified predecessor records but makes a terminal probe fail in a stale model and pass in a current model. Its executable record separates verification, novelty, budget and integration decisions.

Proof-Life is a finite grid-based toy universe for the Predictive Universe framework. Its local target library is the disjoint union
$$
\mathcal T_0=\mathcal T_0^{proof}\sqcup\mathcal T_0^{diag}.
$$
The proof sector contains bounded proof-existence targets
$$
O_{\psi,N}:=\mathsf{BProof}_{\mathcal F_0}(\psi,N),
$$
whose truth is decided by a finite verifier over a canonical finite candidate-certificate set. The diagonal sector contains finite protocol targets induced by the phase-indexed diagonal package of Appendix A.5.6a. No diagonal protocol target is identified with an arithmetic proof target unless an explicit coding extension is introduced; the two sectors are typed separately.

Each cell executes prediction, verification, retained update, and reachability growth. A proof target is retained only when a positive certificate or a negative exhaustion trace passes the finite verifier and the associated register has positive expected predictive gain in the PCE quotient. Neighbor propagation is certificate-gated: a positive proof-object may spread only after each receiving cell independently verifies the certificate. The extended negative channel of Theorem PL.3 transmits a complete canonical exhaustion message; each receiver independently recomputes the bounded truth and verifies every trace field before novelty-gated retention or relay.

Theorem PL.4 supplies a canonical tagged codec for the proof/diagonal coproduct. It preserves each sector tag and every target field. Its declared cross-sector bridge admits target-selection links only: selection may schedule a target in the other sector, but it imports no truth value or evidence and never identifies the proof verifier with the diagonal access verifier.

The optional S-Life sector of Theorem PL.5 adjoins finite targets $\mathsf{SReach}(M,\ulcorner Q\urcorner,N)$ with $N<\infty$ and checked-total predicate code $\ulcorner Q\urcorner$. Positive evidence is a verified redex-position trace, while negative evidence is the complete canonical reduction tree through depth $N$. The extended codec uses a third $\texttt{sreach}$ tag and preserves PL.4's selection-only rule between unequal sectors. The pure-$\mathbf S$ companion (Cinematic Strawberry, 2026) supplies the exact selected trajectory; Theorem PL.5 supplies the bounded verification layer, and decoded proof or diagonal objects retain their sector-specific verifiers.

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
The base model has five internal roles; Theorem PL.5 adds one optional typed execution role.

1. **Fundamental Predictive Loop.** Each cell selects a target, stores a prediction, verifies the prediction against a finite response, and updates only through the verified register. This is the finite-toy realization of the prediction, verification, and update ordering of Definition 4.

2. **PCE quotienting.** A verification register that gives no positive expected predictive gain is update-null in the retained predictive quotient. This is the toy-instance of Definition 15 and Lemma A.5.6a.5.

3. **PPI finite response.** The objects admitted into the retained toy universe are finite protocol-response objects: bounded proof-existence targets with certificates or finite exhaustion traces, and finite diagonal protocol targets with trace-certified register data. This matches the finite-response formulation of Definition P.6.2.

4. **SPAP phase separation.** Each cell carries the three operational roles
$$
(\phi_i(t),p^{stored}_i(t),c^{phase}_i(t)),
$$
where $\phi_i(t)$ is the active target, $p^{stored}_i(t)$ is the stored prediction, and $c^{phase}_i(t)$ separates prediction, verification, update, and historical readout. This is the finite-grid specialization of the role separation used in Theorem 15 and Appendix A.5.6a.

5. **Typed diagonal access.** A diagonal object $E_{B,t}$ is not silently treated as an element of the bounded arithmetic formula list $\mathsf{Form}_L$. It enters Proof-Life through $\mathcal T_0^{diag}$ as a finite protocol target governed by Appendix A.5.6a. This preserves the type distinction between bounded proof-existence objects and phase-indexed self-reference objects.

6. **Typed S-Life verification.** The optional sector $\mathcal T_0^{\mathbf S}$ routes bounded pure-$\mathbf S$ reduction targets to Theorem PL.5's finite verifier. Its tag preserves the distinction among reduction reachability, arithmetic proofhood, and phase-indexed diagonal access.

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

Negative bounded facts may be retained locally when an exhaustion trace passes. The minimal positive-certificate channel does not carry them. The extended channel of Theorem PL.3 instead transmits
$$
m^-_{\psi,N}
=
\bigl(\operatorname{code}(O_{\psi,N}),\operatorname{Exh}_{\mathcal F_0}(\psi,N)\bigr).
$$
A recipient resolves the target code, independently recomputes the bounded truth, checks formula and bound identity, runs the full exhaustion verifier, and applies the same duplicate-target novelty quotient. A novel accepted negative message is retained and queued for relay; an accepted duplicate is recorded but has zero gain, and an invalid message is recorded as failed and is not relayed.

Write $\mathsf{Step}_{\min}$ for the local transitions of Section 4 together with the positive-certificate channel above, and write $\mathsf{Step}_{\pm}$ for the extension that also contains these negative-message transitions. Theorem PL.1 requires only $\mathsf{Step}_{\min}$. The displayed extended program and Theorem PL.2 use $\mathsf{Step}_{\pm}$; Theorem PL.3 proves the added negative subrelation and its communication-cost classification.

Diagonal-sector targets do not propagate by either proof-evidence channel. The tagged codec of Theorem PL.4 permits proof and diagonal sectors to nominate one another's next target while preserving the coproduct tag. Beyond the unchanged source and destination target codes, a cross-sector selection carries no certificate, exhaustion trace, diagonal evidence label, register value, or history datum. Diagonal evidence may be shared only by a separate protocol that transmits the trace-certified register and history data required by the selected access mode.

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

The following reference implementation is a finite executable instance of the Proof-Life construction. It implements the bounded certificate calculus, complete finite exhaustion verification, verification-gated retention, independently verified positive-certificate and negative-exhaustion propagation, the typed proof/diagonal target codec, the selection-only cross-sector bridge, and the A.5.6a diagonal access triality.

Save as `proof_life.py` and run:

```bash
python proof_life.py
```

```python
from __future__ import annotations

from dataclasses import dataclass, field
from typing import Any, Dict, Iterable, List, Optional, Tuple, Union
import json
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


DIAGONAL_MODES = ("act", "ext", "hist", "lite-act", "lite-hist")


@dataclass(frozen=True)
class DiagonalTarget:
    predictor: str
    time: int
    mode: str
    bound: int

    def code(self) -> str:
        return f"DIAG[{self.predictor};t={self.time};mode={self.mode};N={self.bound}]"


@dataclass(frozen=True)
class ExhaustionMessage:
    target_code: str
    trace: ExhaustionTrace


Evidence = Union[Certificate, ExhaustionTrace, None]
Target = Union[ProofTarget, DiagonalTarget]


class ToyProofSystem:
    """
    A finite certificate calculus for bounded proof-existence claims.

    A ProofTarget(formula, bound) is true exactly when the canonical finite
    candidate set contains a valid certificate for formula whose cost is at
    most the stated bound.
    """

    def raw_verify(self, formula: Formula, cert: Certificate) -> bool:
        # Python bool is a subclass of int and compares equal to 0 or 1.
        # Exact type checks must precede dataclass/tuple equality.
        if (
            type(formula) is not Formula
            or type(formula.kind) is not str
            or type(formula.args) is not tuple
            or type(cert) is not Certificate
            or type(cert.rule) is not str
            or type(cert.args) is not tuple
        ):
            return False
        k = formula.kind
        a = formula.args
        if not all(type(x) is int for x in a):
            return False
        if not all(type(x) is int for x in cert.args):
            return False

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
            return 2 * w == n

        if k == "COMP" and cert.rule == "FACTOR":
            (n,) = a
            if len(cert.args) != 2:
                return False
            u, v = cert.args
            return 1 < u < n and 1 < v < n and u * v == n

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
        if (
            type(trace) is not ExhaustionTrace
            or type(trace.formula) is not Formula
            or type(trace.formula.kind) is not str
            or type(trace.formula.args) is not tuple
            or not all(type(x) is int for x in trace.formula.args)
            or type(trace.bound) is not int
            or trace.bound < 0
            or type(trace.checked) is not tuple
            or any(
                type(cert) is not Certificate
                or type(cert.rule) is not str
                or type(cert.args) is not tuple
                or not all(type(x) is int for x in cert.args)
                for cert in trace.checked
            )
        ):
            return False

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


def valid_proof_target(target: Any, L: int, N_max: int) -> bool:
    arities = {"ADD": 3, "MUL": 3, "EVEN": 1, "COMP": 1, "PRIME": 1}
    return (
        type(L) is int
        and L >= 0
        and type(N_max) is int
        and N_max >= 0
        and type(target) is ProofTarget
        and type(target.formula) is Formula
        and type(target.formula.kind) is str
        and target.formula.kind in arities
        and type(target.formula.args) is tuple
        and len(target.formula.args) == arities[target.formula.kind]
        and all(type(x) is int and 0 <= x <= L for x in target.formula.args)
        and type(target.bound) is int
        and 0 <= target.bound <= N_max
    )


class ExhaustionTraceCodec:
    """Minimax fixed-width codec for a frozen nonempty negative target library."""

    def __init__(
        self,
        targets: Tuple[ProofTarget, ...],
        system: ToyProofSystem,
        L: int,
        N_max: int,
    ) -> None:
        if (
            type(targets) is not tuple
            or type(system) is not ToyProofSystem
            or not all(valid_proof_target(target, L, N_max) for target in targets)
        ):
            raise ValueError("invalid exhaustion-codec domain")
        by_code = {target.code(): target for target in targets}
        if len(by_code) != len(targets):
            raise ValueError("duplicate target code")
        self.system = system
        self.negative_targets = tuple(
            sorted(
                (target for target in targets if not system.bounded_theorem_truth(target)),
                key=lambda target: target.code(),
            )
        )
        if not self.negative_targets:
            raise ValueError("negative target library is empty")
        self.by_code = {target.code(): target for target in self.negative_targets}
        self.index_by_code = {
            target.code(): index for index, target in enumerate(self.negative_targets)
        }
        self.width = (len(self.negative_targets) - 1).bit_length()

    def encode(self, message: ExhaustionMessage) -> str:
        if (
            type(message) is not ExhaustionMessage
            or type(message.target_code) is not str
            or type(message.trace) is not ExhaustionTrace
            or message.target_code not in self.by_code
        ):
            raise ValueError("invalid exhaustion message")
        target = self.by_code[message.target_code]
        if (
            message.trace.formula != target.formula
            or message.trace.bound != target.bound
            or not self.system.verify_exhaustion_trace(message.trace)
        ):
            raise ValueError("noncanonical exhaustion message")
        index = self.index_by_code[message.target_code]
        return "" if self.width == 0 else format(index, f"0{self.width}b")

    def decode(self, bits: str) -> ExhaustionMessage:
        if (
            type(bits) is not str
            or len(bits) != self.width
            or any(bit not in "01" for bit in bits)
        ):
            raise ValueError("invalid fixed-width codeword")
        index = 0 if self.width == 0 else int(bits, 2)
        if index >= len(self.negative_targets):
            raise ValueError("unused fixed-width codeword")
        target = self.negative_targets[index]
        return ExhaustionMessage(
            target_code=target.code(),
            trace=self.system.exhaustion_trace(target.formula, target.bound),
        )


class TypedTargetCodec:
    """Canonical tagged codec and safe cross-sector selection bridge."""

    def __init__(
        self,
        L: int,
        N_max: int,
        time_max: int,
        predictors: Tuple[str, ...],
    ) -> None:
        if (
            type(L) is not int
            or L < 0
            or type(N_max) is not int
            or N_max < 0
            or type(time_max) is not int
            or time_max < 0
            or type(predictors) is not tuple
            or not predictors
            or any(
                type(name) is not str
                or not name
                or not name.isascii()
                or not name.replace("_", "a").isalnum()
                for name in predictors
            )
            or len(set(predictors)) != len(predictors)
        ):
            raise ValueError("invalid typed-target-codec domain")
        self.L = L
        self.N_max = N_max
        self.time_max = time_max
        self.predictors = predictors

    def valid_diagonal_target(self, target: Any) -> bool:
        return (
            type(target) is DiagonalTarget
            and type(target.predictor) is str
            and target.predictor in self.predictors
            and type(target.time) is int
            and 0 <= target.time <= self.time_max
            and type(target.mode) is str
            and target.mode in DIAGONAL_MODES
            and type(target.bound) is int
            and 0 <= target.bound <= self.N_max
        )

    def encode(self, target: Target) -> str:
        if valid_proof_target(target, self.L, self.N_max):
            payload = ["proof", target.formula.kind, list(target.formula.args), target.bound]
        elif self.valid_diagonal_target(target):
            payload = [
                "diag",
                target.predictor,
                target.time,
                target.mode,
                target.bound,
            ]
        else:
            raise ValueError("target is outside the typed codec domain")
        return json.dumps(payload, ensure_ascii=True, separators=(",", ":"))

    def decode(self, code: str) -> Target:
        if type(code) is not str:
            raise ValueError("target code is not a string")
        try:
            payload = json.loads(code)
        except (TypeError, ValueError, json.JSONDecodeError) as error:
            raise ValueError("invalid target code") from error
        if json.dumps(payload, ensure_ascii=True, separators=(",", ":")) != code:
            raise ValueError("noncanonical target code")
        if type(payload) is not list or not payload:
            raise ValueError("invalid target payload")
        if payload[0] == "proof" and len(payload) == 4:
            kind, args, bound = payload[1:]
            if type(args) is not list:
                raise ValueError("invalid proof payload")
            target: Target = ProofTarget(Formula(kind, tuple(args)), bound)
            if not valid_proof_target(target, self.L, self.N_max):
                raise ValueError("proof payload is outside the codec domain")
            return target
        if payload[0] == "diag" and len(payload) == 5:
            predictor, time, mode, bound = payload[1:]
            target = DiagonalTarget(predictor, time, mode, bound)
            if not self.valid_diagonal_target(target):
                raise ValueError("diagonal payload is outside the codec domain")
            return target
        raise ValueError("unknown target-sector tag")

    def sector(self, code: str) -> str:
        target = self.decode(code)
        return "proof" if type(target) is ProofTarget else "diag"

    def cross_sector_link_allowed(self, source_code: str, target_code: str, role: str) -> bool:
        if type(role) is not str or role not in ("select", "evidence"):
            return False
        source = self.decode(source_code)
        target = self.decode(target_code)
        if (type(source) is ProofTarget) == (type(target) is ProofTarget):
            return False
        return role == "select"


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
    exhaustion_broadcasts: List[ExhaustionMessage] = field(default_factory=list)
    score: int = 0

    # PU role triad.
    phi: Optional[Target] = None
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
        truth, _ = system.decide_target(target)

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

        if passed and expected_gain_positive:
            self.known[target.code()] = (truth, evidence)
            self.score += 1

            if truth and isinstance(evidence, Certificate):
                self.broadcasts.append((target.code(), evidence))
            elif not truth and isinstance(evidence, ExhaustionTrace):
                self.exhaustion_broadcasts.append(
                    ExhaustionMessage(target_code=target.code(), trace=evidence)
                )

        reg = VerificationRegister(
            target_code=target.code(),
            prediction=prediction,
            truth=truth,
            passed=passed,
            expected_gain_positive=expected_gain_positive,
            evidence=evidence,
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
        self.c_phase = "verify"
        truth, _ = system.decide_target(target)
        passed = (
            truth
            and isinstance(cert, Certificate)
            and system.verify_certificate(target.formula, target.bound, cert)
        )
        expected_gain_positive = passed and target.code() not in self.known

        if expected_gain_positive:
            self.known[target.code()] = (True, cert)
            self.score += 1
            self.broadcasts.append((target.code(), cert))

        self.history.append(
            VerificationRegister(
                target_code=target.code(),
                prediction=1,
                truth=truth,
                passed=passed,
                expected_gain_positive=expected_gain_positive,
                evidence=cert,
                note="independently verified positive-certificate broadcast",
            )
        )
        self.c_phase = "update"
        return expected_gain_positive

    def import_exhaustion(
        self,
        target: ProofTarget,
        message: ExhaustionMessage,
        system: ToyProofSystem,
    ) -> bool:
        self.c_phase = "verify"
        truth, _ = system.decide_target(target)
        passed = (
            not truth
            and type(message) is ExhaustionMessage
            and type(message.target_code) is str
            and message.target_code == target.code()
            and type(message.trace) is ExhaustionTrace
            and message.trace.formula == target.formula
            and message.trace.bound == target.bound
            and system.verify_exhaustion_trace(message.trace)
        )
        expected_gain_positive = passed and target.code() not in self.known

        if expected_gain_positive:
            self.known[target.code()] = (False, message.trace)
            self.score += 1
            self.exhaustion_broadcasts.append(message)

        self.history.append(
            VerificationRegister(
                target_code=target.code(),
                prediction=0,
                truth=truth,
                passed=passed,
                expected_gain_positive=expected_gain_positive,
                evidence=message.trace if type(message) is ExhaustionMessage else None,
                note="independently verified negative-exhaustion broadcast",
            )
        )
        self.c_phase = "update"
        return expected_gain_positive


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
        exhaustion_outgoing: List[Tuple[Tuple[int, int], ExhaustionMessage]] = []

        for pos, cell in self.cells.items():
            for code, cert in cell.broadcasts:
                outgoing.append((pos, code, cert))
            for message in cell.exhaustion_broadcasts:
                exhaustion_outgoing.append((pos, message))
            cell.broadcasts.clear()
            cell.exhaustion_broadcasts.clear()

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

        for pos, message in exhaustion_outgoing:
            target = target_by_code.get(message.target_code)
            if target is None:
                continue

            for npos in self.neighbors(pos):
                neighbor = self.cells[npos]

                if neighbor.import_exhaustion(target, message, self.system):
                    events.append(
                        f"t={t} {neighbor.name}: imported verified negative "
                        f"{message.target_code} from {self.cells[pos].name}"
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

    message = ExhaustionMessage(negative_target.code(), valid_exh)
    recipient = Cell(name="NEG-RX", search_budget=0)
    assert recipient.import_exhaustion(negative_target, message, system)
    assert not recipient.import_exhaustion(negative_target, message, system)
    assert recipient.known[negative_target.code()] == (False, valid_exh)

    negative_library = (
        negative_target,
        ProofTarget(Formula("COMP", (17,)), 1),
        ProofTarget(Formula("PRIME", (0,)), 1),
    )
    exhaustion_codec = ExhaustionTraceCodec(negative_library, system, L=17, N_max=1)
    bits = exhaustion_codec.encode(message)
    assert exhaustion_codec.decode(bits) == message
    assert len(bits) == exhaustion_codec.width == 2

    target_codec = TypedTargetCodec(L=17, N_max=3, time_max=1, predictors=("A", "B"))
    diagonal_target = DiagonalTarget("B", 0, "act", 3)
    proof_code = target_codec.encode(negative_target)
    diagonal_code = target_codec.encode(diagonal_target)
    assert target_codec.decode(proof_code) == negative_target
    assert target_codec.decode(diagonal_code) == diagonal_target
    assert target_codec.cross_sector_link_allowed(proof_code, diagonal_code, "select")
    assert not target_codec.cross_sector_link_allowed(proof_code, diagonal_code, "evidence")

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

**Theorem PL.2 (Reference-Implementation Refinement on the Declared Runtime Domain).** Fix finite $L,N_{\max}\in\mathbb N$. Let $\mathcal D_{\mathrm{run}}(L,N_{\max})$ be the following partial runtime domain of the displayed Python program.

1. A `Formula` is an exact instance of the displayed dataclass. Its kind is one of `ADD`, `MUL`, `EVEN`, `COMP`, `PRIME`; its arity is respectively $3,3,1,1,1$; and every argument lies in $\{0,\ldots,L\}$.
2. A `ProofTarget` is an exact instance of the displayed dataclass whose formula satisfies item 1 and whose bound satisfies $0\le N\le N_{\max}$. Formula arguments, proof bounds, search budgets, grid dimensions, and every other integer-valued runtime entry $x$ satisfy the exact Python predicate `type(x) is int`. Thus `bool`, floating-point numbers, and integer-like foreign scalar types are outside the integer entries of $\mathcal D_{\mathrm{run}}$. Python `bool` remains the type of the internal truth, pass, and gain-flag slots produced by the program. Budgets are nonnegative, and a grid step uses positive dimensions and a nonempty prevalidated target library.
3. A `Certificate` is an exact instance of the displayed dataclass, with an exact-string rule and a tuple of exact Python integers. Unsupported rules and wrong certificate arities are verifier inputs and must be rejected. An `ExhaustionTrace` is an exact instance with a formula and bound satisfying items 1--2 and a tuple of exact `Certificate` objects. Predictions are the exact integer values $0,1$ or the literal abstention value $\bot$ used by the program.
4. A reachable cell state starts empty or satisfies the verifier-generated invariant: every `known` entry was installed by a passing nonduplicate local register or a passing nonduplicate recipient verification; every broadcast contains the certificate of a verified positive target; histories contain the submitted evidence, including the evidence of a failed register; and `score == len(known)`.

Any `Formula` with an unknown kind, a wrong arity, or a nonexact or out-of-range argument is outside $\mathcal D_{\mathrm{run}}$, as is any target with a nonexact or out-of-range bound. This is a partial-domain refinement theorem: the target library is validated before execution, so malformed and unknown formula branches are unreachable in $\mathcal D_{\mathrm{run}}$.

Define $\rho$ by mapping `Formula`, `Certificate`, `ProofTarget`, and `ExhaustionTrace` to $\psi$, $p$, $O_{\psi,N}$, and $\operatorname{Exh}_{\mathcal F_0}(\psi,N)$ of Sections 2--4; map `known` to the duplicate-target quotient $[D_i]_Q$ used by the executable novelty functional, a `VerificationRegister` to $R_i$, `broadcasts` to the positive-certificate message multiset, and `score` to $|[D_i]_Q|$. Then, on every local call in $\mathcal D_{\mathrm{run}}$, the reference implementation and Sections 2--3 have identical candidate enumeration, raw and bounded verifier value, bounded decision, and exhaustion-verifier value under $\rho$. Every prediction, verification, novelty-gated retained update, and positive-certificate recipient update produced by the program maps under $\rho$ to a transition permitted by Sections 4--5. Every formal candidate, bounded decision, and accepted exhaustion trace has its displayed Python representative. Hence the finite certificate calculus is extensionally equivalent on the declared domain and the executable state machine is a forward refinement of the formal transition system; `ProofLifeGrid.step` supplies one finite scheduler and prediction/broadcast policy rather than all transitions permitted by that system. The three branches of `demo_diagonal_triality` also equal the three-value access truth table stated in Section 8.

*Proof.* For `ADD`, `MUL`, `EVEN`, `COMP`, and `PRIME`, direct substitution into `candidate_certificates` gives exactly the five ordered candidate families in Section 2.1. The candidate filter incorporates the displayed cost bound. After the exact-object and exact-integer guards, the five branches of `raw_verify` are precisely the five clauses of $V^{raw}_{\mathcal F_0}$; unsupported certificate rules and wrong certificate arities return false. The guards precede tuple and dataclass equality, so Python's identities `True == 1` and `False == 0` cannot create a valid certificate.

The bounded verifier is candidate membership followed by the raw verifier. `search_proof` returns the first accepting member of the finite canonical order. If no member accepts, `exhaustion_trace` returns that complete order. Before comparing a submitted trace to the canonical tuple, `verify_exhaustion_trace` checks the exact trace, formula, bound, tuple, certificate, rule, argument-container, and integer types. It then checks tuple equality and rejection of every member. This is exactly Section 2.3 and prevents Boolean aliases from forging either a canonical member, the bound, or the formula arguments. Hence `decide_target` returns the formal truth value with a valid positive certificate or the complete negative exhaustion object.

Under the state invariant, `predict` first returns an already verified retained value and its evidence. For a fresh target it searches at $\min(\text{search budget},N)$: a found certificate gives prediction $1$; absence of a certificate with budget at least $N$ gives prediction $0$ and the complete target-bound exhaustion trace; and absence with smaller budget gives $\bot$. These are exactly the retained, positive, complete-negative, and abstention branches of Section 4.2.

For a local register, `verify_and_update` compares the exact prediction branch with the decided truth and verifies the submitted evidence. It records that submitted evidence whether the register passes or fails, changes `known` and `score` exactly for a passing nonduplicate, and queues a broadcast exactly for a newly retained positive certificate. These are the pass and novelty rules of Sections 4.3--4.4. For an incoming positive certificate, `import_broadcast` enters the verification phase, recomputes the bounded truth, verifies the submitted certificate, records the recipient register, updates on positive novelty, and requeues an accepted new positive certificate. This is Section 5's positive-certificate branch. `TV-PL-02` owns negative-exhaustion transmission.

The proof-sector cases are exhausted by five formula constructors, retained versus fresh prediction, sufficient versus insufficient search budget, the three prediction values, positive-certificate versus negative-exhaustion evidence, duplicate versus novel records, and accepted versus rejected recipient certificates. The prevalidated-library hypothesis excludes malformed and unknown formula branches, while unsupported or malformed certificates take the explicit rejection branch. These transitions preserve the invariant in item 4. Finally, `demo_diagonal_triality` enumerates $1,0,\bot$ and asserts the self, external, and historical outcomes in each case. No further declared verification or transition branch occurs on $\mathcal D_{\mathrm{run}}$. ∎

**Resolution record PL.2-R1 (`TV-PL-01`).**

| Regression artifact field | Record |
|---|---|
| Catalog binding and polarity | `TV-PL-01`; `positive-discharge` of exact finite-calculus equivalence and executable forward refinement on $\mathcal D_{\mathrm{run}}$ |
| Domain and equivalence | The exact partial domain above and the refinement map $\rho$; object identity uses the displayed typed fields and canonical tuple order, and database records are equivalent exactly when they have the same typed target code for the executable novelty quotient |
| Premises | Sections 2--5, the embedded source, the prevalidated-library/state invariant, and no unregistered coercion of Python scalar types |
| General verifier | Theorem PL.2's exhaustive constructor-and-declared-local-transition case proof establishes the all-input result on $\mathcal D_{\mathrm{run}}$; the finite regression is its independent execution witness |
| PL.2-stage finite regression budget | $L=12$, $N_{\max}=6$: $4433$ formulas, $31031$ bounded targets, $29285$ canonical candidates, $215459$ certificate cases checked against both raw and bounded specifications, $30021$ negative exhaustion decisions, $31031$ target decisions, $60$ retained-transition truth-table cases, $3$ positive-propagation cases, and all $3$ diagonal register values; Theorems PL.3--PL.4 and their records below audit the extension branches |
| Adversarial and provenance fixtures | Five Boolean-certificate cases and four Boolean exhaustion aliases were rejected, yielding $0$ admitted invalid aliases. The paired $60$-case register fixture yielded $0$ submitted-evidence mismatches. Five malformed-kind, arity, Boolean-argument, or negative-argument formulas were checked as outside the declared domain. |
| Current source integrity | Section-10 extraction SHA-256 `5fa09968745ba19adfb4925c251a9e4aef7be7bfe1814928eb0fde0f6329d2b1`; core projection SHA-256 `bb6854ec6c62159150e6e4cfc69d4185a42fea48b428a764467c22e501dfabf9`. PL.3-R1 and PL.4-R1 own the added negative-message and codec/bridge branches. |
| Audit artifacts | Independent audit-source SHA-256 `85f9997b2f5b1e6f72e492c3b1e8b7dd247beff7c4acd40b194b509265f7f48c`; compact lexicographically key-sorted UTF-8 JSON without terminal LF input `{"L":12,"N_max":6}` SHA-256 `5985d40be9ac1ae860ea01201d2ca3b51facd30e4223286301ad9ffeab4ff1b3`; deterministic demo-output SHA-256 `291aa33d69f8cd208bd25604796488dbcee1e5afb69766130a3fb4cbffb23749` |
| Independent executions | Python 3.13.12, executable SHA-256 `a38f63d2b8843820b59746250911cd203dbd76c8dc53693007aaa3bda2007232`, compact lexicographically key-sorted UTF-8 JSON audit-record SHA-256 `80059a6299a7f1328f985fc13f2476399ba914a87d2683e1cb4d862226cdb998`; Python 3.12.3, executable SHA-256 `1643dacd9feaedc58f3cc581e4d22577dfe25c09b10282936186ccf0f2e61118`, corresponding audit-record SHA-256 `26788b6c60a51957667ae1a49382702a28cddc792f7c1001fe70bf819f940fbb`; both returned the displayed semantic counts |
| Integrity invalidator | A source/input hash mismatch, a nonexact runtime integer admitted to the formal domain, incomplete enumeration, fixture omission, or disagreement between the proof specification and an executed branch |
| Falsifier | An input in $\mathcal D_{\mathrm{run}}$ on which a finite verifier value differs or a code transition has no permitted formal image, an admitted Boolean alias, an accepted incomplete or reordered exhaustion trace, a failed register that substitutes evidence, or a retained or imported fact without passing verification and novelty |
| Provenance class | `proved-lemma` for all $\mathcal D_{\mathrm{run}}$ transitions plus a source-derived exhaustive finite regression on the stated budget |
| Nonvacuity | The regression contains positive and negative targets, nonempty and empty candidate sets, novel and duplicate records, valid and invalid evidence, accepted and rejected propagation, and every diagonal register value |
| Extension boundary | Theorems PL.3 and PL.4 own negative-exhaustion transmission/cost and the tagged proof/diagonal scheduling functor. Theorem PL.1 retains its LITE, horizon, and physical-instantiation hypotheses. |
| Regression result | Pass for the exact `TV-PL-01` proposition on the declared runtime domain |

**Theorem PL.3 (Negative-Exhaustion Transmission and Fixed-Width Cost).** Fix $L,N_{\max}\in\mathbb N$ and a finite tuple $\mathcal L$ of distinct-code proof targets in $\mathcal D_{\mathrm{run}}(L,N_{\max})$. Let
$$
\mathcal L_-:=\{T\in\mathcal L:\operatorname{val}_{\mathcal F_0}(T)=0\},
\qquad
q:=|\mathcal L_-|>0,
$$
where $\operatorname{val}_{\mathcal F_0}(O_{\psi,N})\in\{0,1\}$ is the bounded truth value decided by Section 2 and $\mathcal L_-$ is ordered lexicographically by the exact target code. For each $T=O_{\psi,N}\in\mathcal L_-$ define the complete negative message
$$
m_T^-:=\bigl(\operatorname{code}(T),\operatorname{Exh}_{\mathcal F_0}(\psi,N)\bigr).
$$
The extended reference implementation has the following properties.

1. `import_exhaustion` accepts $m_T^-$ exactly when the code resolves to $T$, independent bounded decision returns false, the trace has the same formula and bound, and the full exhaustion verifier accepts. A novel accepted target is retained with truth value false, increments the novelty score once, and is queued for relay. An accepted duplicate creates a passing zero-gain history register and is not requeued. Every rejected message creates a failed history register and changes neither retained knowledge, score, nor relay queue.
2. Every $T\in\mathcal L_-$ has one accepted canonical message, and every accepted message represents a negative bounded fact. Thus negative propagation is complete and sound on the frozen library. On a finite connected grid with reliable per-step neighbor delivery, if one cell newly queues $m_T^-$ while every other cell initially lacks $T$, the message reaches each cell after at most its graph distance from the source; novelty prevents indefinite requeue around a cycle.
3. Suppose sender and receiver share $\mathcal F_0$, $L$, $N_{\max}$, the exact ordered tuple $\mathcal L_-$, and the decoder; suppose also that the channel is already identified as the negative-exhaustion subchannel. Excluding the outer polarity tag, addressing, framing, error correction, and the shared library/decoder, any injective fixed-width binary payload whose decoder returns one of the $q$ literal objects $m_T^-$ has width at least
$$
b_{\min}=\lceil\log_2q\rceil.
$$
`ExhaustionTraceCodec` attains this bound by the canonical library index. Its decoder returns an `ExhaustionMessage` whose `trace` field is the complete `ExhaustionTrace`, including the canonical tuple of every candidate, rather than a count or an unexpanded index. The receiver still runs the independent verifier. If the target identity is separately supplied as side information, the conditional message family has $q=1$ and the corresponding payload bound is zero; a mixed-polarity channel requires its outer tag in addition to the displayed negative-subchannel cost.

*Proof.* Exact type guards reject Boolean aliases, nonexact containers, and malformed message fields before semantic acceptance. For a well-typed message, `decide_target` recomputes bounded truth and `verify_exhaustion_trace` reconstructs the canonical candidate tuple and verifies rejection of every member. The remaining code, formula, and bound comparisons bind that trace to the nominated target. The update branch is reached exactly for a valid negative message, while the duplicate quotient makes the second accepted copy gain-null. This proves item 1. Section 2.3 supplies the canonical trace for every negative target, and the same verifier excludes a positive target or an incomplete, reordered, or altered trace, proving item 2. Under the stated all-other-cells-uninformed initial condition, relay advances one graph edge per delivery step and occurs at first retention, so distance induction proves the finite-grid statement. For item 3, $b$ fixed binary positions have at most $2^b$ codewords; injectivity on $q$ messages forces $2^b\ge q$. The codec assigns the integer indices $0,\ldots,q-1$ in exactly $\lceil\log_2q\rceil$ bits and reconstructs the target and its entire deterministic canonical trace, so the lower bound is attained. ∎

**Resolution record PL.3-R1 (`TV-PL-02`).**

| Regression artifact field | Record |
|---|---|
| Catalog binding and polarity | `TV-PL-02`; `positive-discharge` of negative-exhaustion transmission, independent recipient verification/retention, and the fixed-width payload optimum on the declared finite channel |
| Domain and equivalence | Theorem PL.3's exact runtime domain and shared-library cost model; messages are equivalent exactly when their decoded target code, formula, bound, and complete ordered candidate tuple agree |
| Premises and side information | Exact $\mathcal F_0$, $L$, $N_{\max}$, ordered nonempty $\mathcal L_-$, decoder and negative-subchannel identity are shared; polarity tag, addressing, framing, error correction, and shared-description cost are outside $b_{\min}$ and must be added by any enclosing channel |
| General verifier | Exact recipient type/code/formula/bound/truth/exhaustion checks plus the counting lower bound and canonical-index upper construction in Theorem PL.3 |
| Finite regression budget | $L=8$, $N_{\max}=4$: $7425$ proof targets, $7051$ negative and $374$ positive; all $7051$ negative messages round-tripped; $5741$ candidate entries occurred in their complete traces; $14102$ novel/duplicate recipient registers, $28228$ mutated-message rejections, $1141$ unused-word rejections and $5$ malformed-word rejections; $q=7051$ gives the attained optimum $13$ bits |
| Source and audit integrity | Extended embedded Python: `30107` bytes, `879` lines and SHA-256 `5fa09968745ba19adfb4925c251a9e4aef7be7bfe1814928eb0fde0f6329d2b1`; independent audit source SHA-256 `10734aabca5b2924f513a3231688074d70a06b97067269e3a156916a302b32ca`; compact sorted ASCII input SHA-256 `c869f2c871ec0d8357fa391b17a8943f63b3c8c1a3df5f21fa5c0d2bdbf53f51`; deterministic demo-output SHA-256 `0040bfba7961bd35103d464215d03f1dc225a4788dff733c87e3363beac8a027` |
| Independent executions | Python 3.13.12 runtime SHA-256 `a38f63d2b8843820b59746250911cd203dbd76c8dc53693007aaa3bda2007232`, audit-record SHA-256 `f9685cd244fcd76385fe92691fd0a403ba6be512ca0ea68f432a086c9bcaa3ef`; Python 3.12.3 runtime SHA-256 `1643dacd9feaedc58f3cc581e4d22577dfe25c09b10282936186ccf0f2e61118`, audit-record SHA-256 `a4bad5329975f65f8e7baf740953669d71fb24769cb7151d7dcc6f5284884fac` |
| Integrity invalidator | A source/runtime/input/output hash mismatch, incomplete target enumeration, noncanonical library order, omitted fixture, or an uncharged change to the side-information/framing convention |
| Falsifier | A malformed or positive message retained as negative, a valid canonical negative message rejected, a recipient retaining without independent verification and novelty, a decoder returning less than the literal complete trace, a fixed-width code shorter than the counting bound, or a valid code not attaining that bound |
| Provenance class | `proved-lemma` plus source-derived exhaustive finite regression on the stated budgets |
| Nonvacuity | The audited library contains $7051$ negative targets, including empty and nonempty canonical candidate tuples, and $374$ positive controls; accepted, duplicate, malformed, altered and unused-codeword branches all execute |
| Scope | Finite Proof-Life messages only; no physical communication rate, thermodynamic cost, noisy-channel capacity, or negative-exhaustion protocol outside the frozen library follows |
| Regression result | Pass for the exact `TV-PL-02` proposition on the declared runtime and cost domain |

**Theorem PL.4 (Tagged Proof/Diagonal Coding Functor and Safe Bridge Classification).** Fix finite $L,N_{\max},T_{\max}\in\mathbb N$ and a nonempty finite tuple $\mathcal B$ of distinct exact ASCII predictor labels. Let $\mathcal D_{\mathrm{codec}}$ contain the exact proof targets of $\mathcal D_{\mathrm{run}}(L,N_{\max})$ and the exact diagonal targets
$$
\mathsf{Diag}(B,t,\eta,N),
\qquad
B\in\mathcal B,\qquad 0\le t\le T_{\max},\qquad
\eta\in\{\mathrm{act},\mathrm{ext},\mathrm{hist},\mathrm{lite\text{-}act},\mathrm{lite\text{-}hist}\},\qquad
0\le N\le N_{\max}.
$$
`TypedTargetCodec` encodes a proof target as the canonical JSON array
$$
[\texttt{"proof"},\texttt{kind},[\texttt{args}],N]
$$
and a diagonal target as
$$
[\texttt{"diag"},B,t,\eta,N].
$$
All integers have exact Python type `int`; Boolean aliases are rejected. Formula kind, arity and argument range, predictor label, time, access mode and bound are checked exactly, and decoding is accepted only when re-encoding reproduces the input bytes.

Let $\Sigma$ be the finite ASCII-byte alphabet used by this canonical JSON grammar. The encoding and decoding maps are inverse on $\mathcal D_{\mathrm{codec}}$, their images are disjoint by the first tag, and they preserve every target field. Hence the object map, together with identity arrows, is an injective functor
$$
\mathcal C_{\mathrm{tag}}:
\operatorname{Disc}(\mathcal T_0^{\mathrm{proof}}\sqcup\mathcal T_0^{\mathrm{diag}})
\longrightarrow
\operatorname{Disc}(\Sigma^*)
$$
onto its canonical image.

Define the declared cross-sector bridge class $\mathcal B_{\mathrm{sel/ev}}$ to contain an ordered pair of valid target codes and a role in $\{\texttt{select},\texttt{evidence}\}$. `cross_sector_link_allowed` accepts exactly the links whose decoded tags differ and whose role is `select`. An accepted selection link may nominate or schedule the decoded destination target; beyond the unchanged source and destination target codes, it carries no target truth, proof certificate, exhaustion trace, diagonal evidence label, register value or history datum. Every cross-sector `evidence` link is rejected. Therefore this bridge permits proof/diagonal scheduling interaction while preserving the two verifiers and all active, external, historical and LITE access modes. In particular it supplies no proof-to-diagonal or diagonal-to-proof semantic identification and cannot convert an active diagonal target into processed evidence. This is a complete classification of $\mathcal B_{\mathrm{sel/ev}}$, not a classification of every conceivable cross-sector protocol.

*Proof.* The proof and diagonal validators exhaust their displayed finite constructors. Canonical JSON decoding followed by byte-for-byte re-encoding excludes alternate serializations, while exact object and integer guards exclude subclass and Boolean aliases. Direct case analysis on the first array entry proves disjointness, and field reconstruction proves both inverse identities. Discrete source and target categories have identity arrows only, so the injective object map preserves all identities and composition. For a bridge link there are two tag relations and two registered roles. Equal tags fail the cross-sector premise; unequal tags with `select` return true; unequal tags with `evidence` return false. Since the accepted branch returns only permission to schedule the unchanged decoded target and invokes neither evidence verifier, the diagonal phase mode and proof/diagonal semantic separation are invariant. These cases exhaust $\mathcal B_{\mathrm{sel/ev}}$. ∎

**Resolution record PL.4-R1 (`TV-PL-03`).**

| Regression artifact field | Record |
|---|---|
| Catalog binding and polarity | `TV-PL-03`; `positive-discharge` of an explicit type-preserving coding functor and the exact safe-link classification in $\mathcal B_{\mathrm{sel/ev}}$ |
| Domain and equivalence | $\mathcal D_{\mathrm{codec}}$ and the canonical arrays above; targets are equal exactly when their coproduct tag and every typed field agree; code equality is exact canonical JSON byte equality |
| Premises | Finite bounds, a nonempty exact predictor-label tuple, the disjoint proof/diagonal constructors, canonical JSON, and selection/evidence as the complete registered role set of $\mathcal B_{\mathrm{sel/ev}}$ |
| General verifier | Exact runtime/type/domain guards, canonical decode/re-encode, exhaustive two-tag/two-role analysis, and the inverse/functor proof of Theorem PL.4 |
| Finite regression budget | $L=2$, $N_{\max}=2$, $T_{\max}=1$, $\mathcal B=(\texttt{A},\texttt{B})$: all $189$ proof and $60$ diagonal targets, $249$ unique round trips and sector-tag checks, $45360$ ordered cross-sector role checks, $78642$ same-sector cross-API rejections, $12$ malformed-code rejections, $5$ malformed-role rejections, and all $3$ diagonal register values in the separate access triality |
| Source and audit integrity | The same extended source, independent audit source, input, demo-output and dual-runtime hashes recorded in PL.3-R1; the PL.4 counters are fields of those exact audit records |
| Integrity invalidator | A source/runtime/input/output hash mismatch, a missing finite constructor, a code collision, a noncanonical decode, an admitted Boolean alias, or a role omitted from the declared bridge census |
| Falsifier | A failed valid round trip, a proof/diagonal code collision, a field or tag changed by decoding, an accepted cross-sector evidence link, a rejected valid selection link, or a selection link that changes evidence, truth, phase or history state |
| Provenance class | `proved-lemma` plus source-derived exhaustive finite regression on the stated domain |
| Nonvacuity | The audit contains $189$ proof targets and $60$ diagonal targets covering every access mode, both directions of cross-sector selection, rejected evidence links, malformed codes and the three-value diagonal triality |
| Scope | The functor acts on discrete typed target objects, and the bridge class permits scheduling while preserving evidence isolation and distinct proof/diagonal access semantics. Physical instantiation remains conditional on Theorem PL.1's hypotheses and the main framework's realization ledgers. |
| Regression result | Pass for the exact `TV-PL-03` proposition on the declared codec and bridge domain |

## 11. S-Life finite execution certificates

The pure-$\mathbf S$ companion (Cinematic Strawberry, 2026) uses closed ground terms generated by
$$
T::=\mathbf S\mid(T\,T)
$$
and contextual contractions of
$$
\mathbf SXYZ\to XZ(YZ).
$$
Write $\to_{\mathbf S}$ for one such contraction. The predicate symbol $Q$ below denotes a finite-term predicate and is distinct from the cell quality functional $Q_i$.

**Definition PL.5a (S-Life bounded target sector).** Fix a decidable registry of canonical predicate codes $\ulcorner Q\urcorner$. Admission requires either membership in a syntactically total predicate language or a termination certificate accepted by a sound registered checker. For $M\in\mathsf{Term}_{\mathbf S}$ and $N\in\mathbb N$, define
$$
\mathsf{SReach}(M,\ulcorner Q\urcorner,N)=1
\Longleftrightarrow
\exists k\le N\;\exists M_0,\ldots,M_k
\left[
M_0=M\land
\bigwedge_{j<k}M_j\to_{\mathbf S}M_{j+1}
\land Q(M_k)=1
\right].
$$
Each S-Life instance registers a finite target set
$$
\mathcal T_0^{\mathbf S}\subset_{\mathrm{fin}}
\{\mathsf{SReach}(M,\ulcorner Q\urcorner,N)\},
$$
and uses the tagged library
$$
\mathcal T_{0,+\mathbf S}
=
\mathcal T_0^{proof}
\sqcup
\mathcal T_0^{diag}
\sqcup
\mathcal T_0^{\mathbf S}.
$$

A positive certificate is a sequence of redex-occurrence addresses of length at most $N$ whose replay from $M$ ends at a term accepted by $Q$. A negative certificate is the complete canonical reduction tree through depth $N$: every node records and verifies that $Q$ is false, the complete lexicographically ordered list of its redex addresses, and, below depth $N$, one child containing the exact contractum for every listed address. An occurrence address is a word in $\{L,R\}^*$, with the empty word at the root; appending $L$ or $R$ descends to the corresponding child, and addresses use length-first lexicographic order with $L<R$.

In an S-Life-extended instance, Sections 3--6 use $\mathcal T_{0,+\mathbf S}$ in place of $\mathcal T_0$. For an active S-Life target, $p_i^{stored}(t)\in\{1,0,\bot\}$ predicts bounded reachability, bounded nonreachability, or abstention. The register passes exactly when the Boolean prediction agrees with the mechanically decided value and $w_i(t)$ is an accepted certificate of the matching polarity. The retained-update rule of Section 4.4 then applies without changing $Q_i$. A same-tag S-Life evidence message may propagate only when each recipient independently reruns the bounded-reachability verifier and the target is novel in its predictive quotient.

Fix
$$
\operatorname{code}_{\mathbf S}(\mathbf S)=\texttt{0},
\qquad
\operatorname{code}_{\mathbf S}(XY)
=
\texttt{1}\operatorname{code}_{\mathbf S}(X)\operatorname{code}_{\mathbf S}(Y).
$$
The decoder recursively parses exactly one complete tree and rejects truncation or trailing symbols. The extended canonical codec maps an S-Life target to
$$
[\texttt{"sreach"},\operatorname{code}_{\mathbf S}(M),\ulcorner Q\urcorner,N].
$$
Its decoder accepts exactly canonical term codes, registered predicate codes, canonical nonnegative bounds, and targets belonging to $\mathcal T_0^{\mathbf S}$. The tags $\texttt{proof}$, $\texttt{diag}$, and $\texttt{sreach}$ have disjoint images. The extended cross-sector router accepts an unequal-tag link exactly when its registered role is $\texttt{select}$; the accepted link carries only the unchanged source and destination target codes. It rejects every unequal-tag $\texttt{evidence}$ link.

**Theorem PL.5 (Typed finite S-Life verification).** Relative to the soundness of Definition PL.5a's checked-totality registry, every target in $\mathcal T_0^{\mathbf S}$ is mechanically decidable. If the target is true, at least one positive certificate is accepted and every negative certificate is rejected. If the target is false, the complete canonical negative tree is accepted and every positive certificate is rejected. Passing S-Life registers and same-tag recipient updates obey the same verification and novelty gates as the proof sector. The extended codec is injective on $\mathcal T_{0,+\mathbf S}$, decoding inverts encoding on its canonical image, and cross-sector selection preserves the sector tags and transports no evidence. If $Q$ includes a checked deterministic checkpoint-decoder relation, an accepted positive certificate establishes bounded reachability of a term with that decoded state. Arithmetic proofhood and diagonal-access status appearing in decoded data are assigned only by their proof-sector and diagonal-sector verifiers.

*Proof.* Every finite pure-$\mathbf S$ term has finitely many redex occurrences, and every contraction produces another finite term. The reduction tree through finite depth $N$ is therefore finite. Canonical depth-first enumeration decides the target. Replaying an accepted positive address sequence proves the existential clause. When the clause is false, recomputing every outgoing address, child contractum, and $Q$-value verifies the complete $Q$-false tree; completeness excludes a missed positive branch. The leading codec tags prove image disjointness, while canonical field validation proves both inverse identities. Exhausting the unequal-tag cases for the two registered roles proves the router classification. The decoder clause follows by conjunction with the checked terminal predicate. $\square$

**Corollary PL.5.1 (Finite-horizon certificates for universal weak-path execution).** For every deterministic Turing machine $\mathscr M$, finite input $x$, and finite cyclic-tag horizon $n$, put $w=w_{\mathscr M,x}$ and $\delta_R^n(0,w)=(q_n,u_n)$. Corollary 8.1 of the companion pure-$\mathbf S$ paper supplies the compiled term $\operatorname{Enc}_{\mathrm{TM}}(\mathscr M,x)=G_w$; Theorem 7.2 supplies a finite contraction index $\tau_w(n)$ and the exact term-only checkpoint value $\operatorname{Dec}_{\mathbf S}(T^w_{\tau_w(n)})=(n,q_n,u_n)$. The scheduler-generated redex trace is an accepted positive certificate for
$$
\mathsf{SReach}
\bigl(
G_w,
\ulcorner Q_{\mathscr M,x,n}^{\mathrm{CTS}}\urcorner,
\tau_w(n)
\bigr),
$$
where $Q_{\mathscr M,x,n}^{\mathrm{CTS}}(T)=1$ exactly when the companion paper's total decoder satisfies $\operatorname{Dec}_{\mathbf S}(T)=(n,q_n,u_n)$. When $n=\kappa_{c_{\mathscr M,x}}(r)$ is a Rogozhin pass boundary, Corollary 8.1 additionally gives $\operatorname{Dec}_{R}(T^w_{\tau_w(n)})=c_r$. Thus every nominated finite cyclic-tag horizon, including every finite fixed-Rogozhin trajectory horizon, has a finite S-Life witness. Each instance retains a finite target library, and unrestricted halting remains outside the target type. $\square$

$\mathsf{SReach}$ is bounded term-reduction reachability; $\mathcal H_i^{reach}$ remains the cell's budget-relative target-processing horizon. The two objects are related only through an explicitly registered target and verifier. Theorems PL.1--PL.4 and their executable audit cover the base two-sector model. Theorem PL.5 defines the optional mathematical extension; executable S-Life claims require a separately verified implementation.

## 12. What the implementation demonstrates

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
A verified positive proof-certificate or complete negative-exhaustion message may propagate to neighbors, but each neighbor must check the received evidence independently before import. The tagged proof/diagonal codec may separately schedule a target across sectors; that selection transmits neither truth nor evidence.

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

### 12.1 Receiver-Relative Evidence and Retained Growth

Fix a finite target library, an ordered certificate grammar and a verification-cost ledger. For target $T$, let $\mathcal E(T)$ contain every accepted positive certificate and, when $T$ is negative, its unique complete canonical exhaustion trace. With cell budget $B_i(t)$ and registered verifier $V_i$, define
$$
\mathcal E_i(T,t)=\{e\in\mathcal E(T):V_i(T,e)=1,\ c_i(T,e)\le B_i(t)\},\qquad
\mathcal H_i^{ev}(t)=\{T:\mathcal E_i(T,t)\ne\varnothing\}.
$$
The candidate set is a syntactic search domain. Membership in the evidence horizon requires accepted evidence, including the complete negative trace when appropriate.

**Proposition (Barred Handoff).** If $\mathcal E_j(T,t)\ne\varnothing$ and $\mathcal E_i(T,t)=\varnothing$, a message accepted by $j$ remains received data at $i$ until $i$ obtains an affordable accepted verification route. On the fixed verifier and budget, no message can cause valid retention of $T$ at $i$.

*Proof.* Every retaining transition requires an element of $\mathcal E_i(T,t)$; the empty-set premise excludes it. For $\mathrm{PRIME}(29)$ at bound five, the canonical trial certificate costs five. A receiver at budget four is barred and one at budget five can verify it. ∎

For the extension, positive evidence is charged its nominal certificate cost; a negative exhaustion is charged one unit for its header plus the sum of the nominal costs of all canonical candidates. Runtime, integer bit complexity, search enumeration, communication and shared-code descriptions have separate ledgers. Direct certificate membership uses constructor and range checks. A supplied factor can avoid the enumerative search; a complete trial-division certificate still performs its listed primality checks.

The novelty quality $Q(D)=|D|$ assigns gain one to the first verified record of a target and zero to a duplicate. This is the registered finite-library quality. Interpreting it as expected predictive-score gain requires the corresponding task and score map. A random proposed value can produce an informative record when its evidence subsequently verifies.

A growing database at fixed budget need not enlarge $\mathcal H_i^{ev}$. A resource-growth branch registers a rule $B_i(t+1)=B_i(t)+g(R_i(t))$ with $g\ge0$ supported on informative accepted registers, or a verified new procedure that changes evidence availability. If the horizon is invariant under the predictive quotient, Section 6's horizon-crossing theorem applies to that rule. A finite grid with an unbounded history is finite at every stage; a finite-state implementation additionally caps history, counters and run length.

### 12.2 Snapshot-Indexed Capacity and Composition

A capacity target is a tuple $(\texttt{capacity},i,t,r,k,q)$: subject, time, snapshot revision, kind $k\in\{\mathrm{BUD},\mathrm{HOR},\mathrm{REL}\}$, and threshold $q$. A frozen subject record supplies normalized budget, verified-library fraction and empirical verifier reliability. Here $\mathrm{HOR}$ names the verified-library fraction; the evidence-processing horizon remains $\mathcal H_i^{ev}$. The target compares the nominated snapshot coordinate with $q$. Its verifier checks subject identity, time, revision, normalization, and the frozen record. A later snapshot has a different target code.

The complete target grammar is the tagged sum of the existing proof, diagonal and S-Life sectors with this capacity sector and a derived-expression sector. A derived target is a finite expression built from verified leaves by negation, conjunction or disjunction. Its certificate carries the child targets, child values, their evidence and the connective. Verify leaves with their own sector verifiers and evaluate the connective truth table. This structural recursion terminates and preserves truth by induction. A mixed proof/capacity expression retains both tags; its evaluation supplies a Boolean connective, with no implicit conversion of capacity assertions to arithmetic formulas.

Selection links can schedule another sector's target. Evidence translation requires a registered map preserving both the target meaning and the receiving verifier. Theorem PL.4's proof/diagonal selection rule and Theorem PL.5's S-Life sector retain their existing definitions.

### 12.3 Self-Model and Fisher Geometry

Register $\theta=(\hat b,\hat h,\hat\rho)\in[0,1]^3$ and the four-category softmax family with logits
$$
\eta(\theta)=(4\hat\rho,0,4(1-\hat b),-4\hat h).
$$
The categories are admissible pass, admissible failure, budget bar and abstention. For probabilities $p_x$, with logit Jacobian $J$, the real Fisher metric is
$$
G(\theta)=J^\top(\operatorname{diag}p-pp^\top)J.
$$

**Proposition (Identifiability).** $G(\theta)$ is positive definite at every finite $\theta$.

*Proof.* For $v\ne0$, $v^\top Gv$ is the variance, under strictly positive $p$, of the four directional logits $Jv$. Its being zero would make those four numbers equal. The pinned reference logit has derivative zero, so all must vanish; the three nonzero coordinate scales then force $v=0$. ∎

This metric concerns the complete four-category outcome distribution. A Boolean prediction score uses its own outcome map. Numerical failure of a matrix factorization is recorded as numerical failure rather than a failure of this real identifiability result.

For a registered self subspace with basis columns $V$, use the Fisher-orthogonal projector
$$
P_s=V(V^\top GV)^{-1}V^\top G,\qquad P_e=I-P_s.
$$
For $\Delta\theta=\theta'-\theta$, put $a=\|P_s\Delta\theta\|_G$, $b=\|P_e\Delta\theta\|_G$, $\Delta=\sqrt{a^2+b^2}$. The reflexive fraction is $a/\Delta$ for $\Delta>0$ and zero for zero displacement. Pure displacement in the nominated self subspace has fraction one. If $G=LL^\top$, whitening uses $L^\top\Delta\theta$ and the transformed subspace $L^\top V$.

### 12.4 Attainable Predictions and Exact Discrepancy

Let $R:[0,\alpha]\to[0,\infty)$ be continuous and nondecreasing, with $R(0)=0$. Register an integration exclusion $0\le\gamma\le a$. On a compact parameter domain $\Theta$, define
$$
\mathcal A(p)=\{\zeta\in\Theta:\|\zeta-\theta\|_G\le R(p),\
\|P_s(\zeta-\theta')\|_G\ge\gamma\},\qquad
d(p)=\min_{\zeta\in\mathcal A(p)}\|\zeta-\theta'\|_G.
$$
The set is nonempty because it contains $\theta$, is compact, and increases with $p$. Therefore a minimizer exists and $d$ is nonincreasing. The argmin can contain several points.

**Proposition (Tangent-Space Closed Form).** On the unrestricted tangent-space branch, write $r=R(p)$. If $\gamma=0$, $d=\max(0,\Delta-r)$. For $a>0$, $0<\gamma\le a$, and $r_0=\Delta(1-\gamma/a)$,
$$
d(r)=
\begin{cases}
\Delta-r,&0\le r\le r_0,\\
\sqrt{\gamma^2+
 [\max\{0,b-\sqrt{r^2-(a-\gamma)^2}\}]^2},&r>r_0.
\end{cases}
$$

*Proof.* Orthogonal decomposition reduces the optimization to radial distances along the self and external components. Before $r_0$, projection onto the radius-$r$ ball leaves self residual at least $\gamma$ and attains the unconstrained distance. Thereafter, an unconstrained radial optimum violates that residual. The constrained optimum uses self displacement $a-\gamma$ and allocates the remaining radius $\sqrt{r^2-(a-\gamma)^2}$ to the external direction, up to its length $b$. It has the displayed norm. At $r_0$ the branches agree. A bounded $\Theta$ uses this formula when the displayed minimizing point lies in $\Theta$, and otherwise retains the constrained minimization. ∎

For example, $a=b=2$, $r=1$, $\gamma=1/2$ gives $d=2\sqrt2-1$. Both orthogonal components share the radius budget, which fixes the allocation.

### 12.5 Proximity and Certified Decisions

Define
$$
\mathcal P=\{p\in[0,\alpha]:d(p)\le\alpha-p\},\qquad
p_*=\min\mathcal P,\qquad
\mu=(\alpha-p_*)^{-1}.
$$
An empty $\mathcal P$ has infinite proximity by convention; a set with $p_*=\alpha$ also has infinite proximity and carries a distinct boundary-only certificate. Nonempty $\mathcal P$ is compact: the joint constraint set in $(p,\zeta)$ is compact, and projection preserves compactness.

For $p_*<\alpha$, $\mu\ge1/\alpha$, with equality exactly when $\Delta\le\alpha$. An exclusion $\gamma>\alpha$ makes feasibility impossible. At $\gamma=\alpha$, $\Delta=\alpha$ gives $p_*=0$; a larger $\Delta$ gives an empty set. External indexing makes $a=\gamma=0$, and minimum proximity additionally requires $b\le\alpha$.

The registered constants $\alpha=7/50$, $R(p)=\frac25(p/\alpha)^2$, and grid increment $1/16$ define a finite toy integration rule. Its interpretation as a quantitative SPAP boundary requires the task, reduction and cost certificate of Theorem 14 and the domination bridge. The finite construction supplies the integration mechanism to which that certificate would attach.

**Exact scalar decision.** On a one-dimensional Euclidean self branch with displacement $\Delta\ge\gamma$, feasibility is equivalent to
$$
0\le p\le\alpha-\gamma,\qquad
\Delta\le R(p)+\alpha-p.
$$
The right side is convex, so feasibility exists exactly when $\Delta$ does not exceed its larger endpoint value. If $\Delta\le\alpha$, $p_*=0$. If $\Delta>\alpha$ and the far endpoint passes, the positive root of the quadratic is $p_*$ and rational bisection encloses it.

For $\Delta=1/5$, $\gamma=1/16$, the endpoint maximum is
$$
\max\left\{\frac7{50},\frac{1451}{7840}\right\}
=\frac{1451}{7840}<\frac15.
$$
The feasible set is empty. With the same displacement and $\gamma=0$, $p=1/10$ is feasible. With the same evidence and an up-to-date model, $\Delta=0$ gives $\mu=50/7$. These three cases isolate the exclusion constraint and the model discrepancy.

A finite scan of a general Fisher profile returns sampled feasible points or an unresolved result. It certifies neither an empty feasible set nor a minimum. The exact scalar branch below supplies rational emptiness and root-enclosure certificates.

### 12.6 Drift, Order and External Models

Let the library have size $L$ and let $m$ novel external records arrive before an accepted probe. If the probe itself is counted as one retained record and corrects the horizon estimate by $\varepsilon$, unsaturated staleness changes by
$$
\Delta_{\mathrm{stale}}=\frac{m+1}{L}-\varepsilon.
$$
For $L=55$, $m=11$, $\varepsilon=1/16$, this is $137/880$. If probes are excluded from the counted library, the corresponding increment is $11/55-1/16=11/80$. The record convention fixes which formula applies. A refused probe supplies no correction; saturation terminates the linear calculation.

An order witness supplies a reachable sequence of novel verified predecessors that pass their registered integration rules, followed by a novel verified target whose integration set is certified empty. A control supplies the same final database, budget, subject snapshot, target, evidence and novelty with a current model. The exact scalar example permits such a construction: five accepted external records each increase a registered state coordinate by $1/25$ while its self estimate remains fixed; the terminal self probe then has displacement $1/5$. An identity-domain external-work channel verifies those predecessors. A control updates the self estimate after each predecessor. Both histories retain the same five records; the terminal probe fails in the stale model and passes in the current model.

The host uses the nominated subject's frozen snapshot through a registered embedding and carries a separate estimate of that subject. For an accurate external model, displacement is zero and proximity is minimal. An inaccurate external model is evaluated from its actual displacement. A self-indexed alias requires an embedding that identifies the target with the host's self coordinate; changing a label alone does not produce that identification.

### 12.7 Logs, Screening and the Finite Ladder

Process events in the order: input domain, prediction availability, evidence budget, evidence verification, positive gain, profile availability, certified integration, retained update. Record one primary verdict and the additional diagnostic flags. In particular, a duplicate has zero gain even if a separate profile would diverge. Numerical uncertainty is an unresolved decision. Log pre-update and post-update models separately and leave unevaluated profile fields absent.

A finite host can screen a nominated finite family of frozen subject records when its budget and embedding cover their verifiers. Aggregate complexity is the sum of the registered local ledgers. Comparing that sum with a PU threshold requires a unit and domination map. The universal active diagonal obstruction leaves finite historical screening available.

For a ladder of finitely many phase-indexed diagonal targets, each rung's external or historical discharge carries its own trace certificate. Theorem A.5.6a.3 supplies the active obstruction at each newly nominated rung. Iterating those certificates supplies a finite sequence of external discharges. Closure over the admitted active diagonal class remains governed by Appendix A.6's closure hypotheses. A finite external lookup table and an active universal self-closure map have different domains.

### 12.8 Extended Runtime and Verification Record

The following block executes in the namespace of Section 10. It preserves that section's audited source and adds direct positive verification, budgeted positive and negative imports, snapshot capacity targets, derived Boolean targets, Fisher geometry, exact scalar integration decisions, and the matched-state refusal fixture. Nominal verification costs are the declared ledger; the code does not equate them with processor time.

~~~python
from fractions import Fraction as F
from dataclasses import dataclass, field
import math

class DirectProofSystem(ToyProofSystem):
    """Direct positive verification on the registered 64-by-64 envelope."""
    def verify_certificate(self, formula, bound, cert):
        if not valid_proof_target(ProofTarget(formula, bound), 64, 64):
            return False
        if (type(cert) is not Certificate or type(cert.args) is not tuple
                or type(cert.rule) is not str
                or any(type(x) is not int for x in cert.args)):
            return False
        if self.proof_cost(cert) > bound:
            return False
        k, args = formula.kind, formula.args
        if k in ("ADD", "MUL"):
            rule = "ADD_EVAL" if k == "ADD" else "MUL_EVAL"
            member = cert.rule == rule and cert.args == args and bound >= 1
        elif k == "EVEN":
            member = (cert.rule == "EVEN_WITNESS" and len(cert.args) == 1
                      and 0 <= cert.args[0] <= args[0] and bound >= 1)
        elif k == "COMP":
            member = (cert.rule == "FACTOR" and len(cert.args) == 2
                      and all(2 <= x < args[0] for x in cert.args) and bound >= 1)
        else:
            ds = tuple(range(2, math.isqrt(args[0]) + 1)) if args[0] >= 2 else ()
            member = cert.rule == "PRIME_TRIAL" and cert.args == ds
        return member and self.raw_verify(formula, cert)

ALPHA, RADIUS, GRID_STEP = F(7, 50), F(2, 5), F(1, 16)

def radius(p):
    if not 0 <= p <= ALPHA:
        raise ValueError("performance outside registered interval")
    return RADIUS * (p / ALPHA) ** 2

def scalar_profile(delta, gamma=F(0), iterations=96):
    """Exact rational feasibility and enclosure of the least performance."""
    delta, gamma = F(delta), F(gamma)
    if not 0 <= gamma <= delta:
        raise ValueError("exclusion outside registered displacement")
    if delta <= ALPHA:
        return {"status": "finite", "p_interval": (F(0), F(0)),
                "mu_interval": (1 / ALPHA, 1 / ALPHA)}
    if gamma > ALPHA:
        return {"status": "empty", "certificate": ("exclusion", gamma)}
    hi = ALPHA - gamma
    maximum = max(ALPHA, radius(hi) + gamma)
    if delta > maximum:
        return {"status": "empty", "certificate": ("endpoint_bound", maximum)}
    if gamma == 0 and delta == radius(ALPHA):
        return {"status": "boundary_only", "p_interval": (ALPHA, ALPHA)}
    lo = F(0)
    for _ in range(iterations):
        mid = (lo + hi) / 2
        if radius(mid) + ALPHA - mid >= delta:
            hi = mid
        else:
            lo = mid
    return {"status": "finite", "p_interval": (lo, hi),
            "mu_interval": (1 / (ALPHA - lo),
                            None if hi == ALPHA else 1 / (ALPHA - hi))}

def outcome_probabilities(theta):
    if len(theta) != 3 or any(not math.isfinite(x) for x in theta):
        raise ValueError("finite three-coordinate model required")
    bh, hh, rh = theta
    eta = [4 * rh, 0.0, 4 * (1 - bh), -4 * hh]
    weights = [math.exp(x - max(eta)) for x in eta]
    return [x / sum(weights) for x in weights]

def analytic_fisher(theta):
    probs = outcome_probabilities(theta)
    jac = [(0, 0, 4), (0, 0, 0), (-4, 0, 0), (0, -4, 0)]
    means = [sum(p * row[i] for p, row in zip(probs, jac)) for i in range(3)]
    return [[sum(p * (row[i] - means[i]) * (row[j] - means[j])
                 for p, row in zip(probs, jac)) for j in range(3)]
            for i in range(3)]

def linear_solve(matrix, vector):
    n = len(vector)
    rows = [list(matrix[i]) + [vector[i]] for i in range(n)]
    for i in range(n):
        pivot = max(range(i, n), key=lambda j: abs(rows[j][i]))
        rows[i], rows[pivot] = rows[pivot], rows[i]
        if abs(rows[i][i]) < 1e-15:
            raise ArithmeticError("numerical projection unresolved")
        divisor = rows[i][i]
        rows[i] = [x / divisor for x in rows[i]]
        for j in range(n):
            if j != i:
                factor = rows[j][i]
                rows[j] = [x - factor * y for x, y in zip(rows[j], rows[i])]
    return [row[-1] for row in rows]

def fisher_split(theta, delta, self_axes):
    g = analytic_fisher(theta)
    axes, own = tuple(self_axes), [0.0] * 3
    if len(set(axes)) != len(axes) or any(i not in range(3) for i in axes):
        raise ValueError("invalid self basis")
    if axes:
        gram = [[g[i][j] for j in axes] for i in axes]
        rhs = [sum(g[i][j] * delta[j] for j in range(3)) for i in axes]
        for i, value in zip(axes, linear_solve(gram, rhs)):
            own[i] = value
    free = [x - y for x, y in zip(delta, own)]
    def norm(v):
        return math.sqrt(max(0.0, sum(v[i] * g[i][j] * v[j]
                                      for i in range(3) for j in range(3))))
    return norm(own), norm(free)

def tangent_discrepancy(r, a, b, gamma):
    if min(r, a, b, gamma) < 0 or gamma > a:
        raise ValueError("outside tangent branch")
    delta = math.hypot(a, b)
    if gamma == 0:
        return max(0.0, delta - r)
    switch = delta * (1 - gamma / a)
    if r <= switch:
        return delta - r
    available = math.sqrt(max(0.0, r * r - (a - gamma) ** 2))
    return math.hypot(gamma, max(0.0, b - available))

def scan_tangent_profile(a, b, gamma, steps=2001):
    """Candidate witnesses only; a missed finite grid is unresolved."""
    if steps < 2:
        raise ValueError("at least two samples required")
    for i in range(steps):
        p = float(ALPHA) * i / (steps - 1)
        r = float(RADIUS) * (p / float(ALPHA)) ** 2
        residual = tangent_discrepancy(r, a, b, gamma) + p - float(ALPHA)
        if residual < -1e-10:
            return {"status": "sampled_feasible", "p": p, "residual": residual}
    return {"status": "unresolved"}

@dataclass(frozen=True)
class FrozenSnapshot:
    subject: str
    time: int
    revision: int
    budget: int
    known: int
    passes: int
    trials: int
    library_size: int = 55
    budget_scale: int = 8

    def values(self):
        ints = (self.time, self.revision, self.budget, self.known, self.passes,
                self.trials, self.library_size, self.budget_scale)
        if type(self.subject) is not str or not self.subject:
            raise ValueError("subject identity required")
        if any(type(x) is not int or x < 0 for x in ints):
            raise ValueError("nonnegative exact snapshot integers required")
        if (not self.library_size or not self.budget_scale
                or self.passes > self.trials or self.known > self.library_size):
            raise ValueError("inconsistent snapshot counts")
        return (min(F(1), F(self.budget, self.budget_scale)),
                F(self.known, self.library_size),
                F(1) if self.trials == 0 else F(self.passes, self.trials))

@dataclass(frozen=True)
class CapacityRecordTarget:
    subject: str
    time: int
    revision: int
    kind: str
    threshold: F

    def code(self):
        if self.kind not in ("BUD", "HOR", "REL"):
            raise ValueError("unknown capacity coordinate")
        if type(self.threshold) is not F or not 0 <= self.threshold <= 1:
            raise ValueError("rational normalized threshold required")
        if (type(self.subject) is not str or not self.subject
                or type(self.time) is not int or self.time < 0
                or type(self.revision) is not int or self.revision < 0):
            raise ValueError("invalid snapshot identity")
        return ("capacity", self.subject, self.time, self.revision, self.kind,
                self.threshold.numerator, self.threshold.denominator)

@dataclass(frozen=True)
class DerivedRecordTarget:
    operation: str
    children: tuple

    def code(self):
        arity = {"NOT": 1, "AND": 2, "OR": 2}
        if (self.operation not in arity or type(self.children) is not tuple
                or len(self.children) != arity[self.operation]):
            raise ValueError("invalid derived expression")
        return ("derived", self.operation, tuple(target_key(t) for t in self.children))

def target_key(target):
    if type(target) is ProofTarget:
        if not valid_proof_target(target, 64, 64):
            raise ValueError("proof target outside finite library envelope")
        return ("proof", target.formula.kind, target.formula.args, target.bound)
    if type(target) in (CapacityRecordTarget, DerivedRecordTarget):
        return target.code()
    raise ValueError("this verifier requires its registered sector")

def evidence_cost(system, target, evidence):
    target_key(target)
    if type(target) is DerivedRecordTarget:
        if type(evidence) is not tuple or len(evidence) != len(target.children):
            raise ValueError("derived evidence arity mismatch")
        return 1 + sum(evidence_cost(system, t, e)
                       for t, e in zip(target.children, evidence))
    if type(target) is CapacityRecordTarget:
        return 1
    if type(evidence) is Certificate:
        return system.proof_cost(evidence)
    if type(evidence) is ExhaustionTrace:
        if type(evidence.checked) is not tuple:
            raise ValueError("canonical trace tuple required")
        return 1 + sum(system.proof_cost(c) for c in evidence.checked)
    raise ValueError("unknown evidence constructor")

def verify_evidence(system, target, evidence, snapshots):
    target_key(target)
    if type(target) is DerivedRecordTarget:
        if type(evidence) is not tuple or len(evidence) != len(target.children):
            return False, None
        checked = [verify_evidence(system, t, e, snapshots)
                   for t, e in zip(target.children, evidence)]
        if not all(ok for ok, _ in checked):
            return False, None
        vals = [v for _, v in checked]
        value = {"NOT": lambda: not vals[0],
                 "AND": lambda: all(vals), "OR": lambda: any(vals)}[target.operation]()
        return True, value
    if type(target) is CapacityRecordTarget:
        frozen = snapshots.get((target.subject, target.time, target.revision))
        if type(evidence) is not FrozenSnapshot or frozen is None or evidence != frozen:
            return False, None
        axis = {"BUD": 0, "HOR": 1, "REL": 2}[target.kind]
        return True, frozen.values()[axis] >= target.threshold
    if type(evidence) is Certificate:
        return system.verify_certificate(target.formula, target.bound, evidence), True
    if type(evidence) is ExhaustionTrace:
        ok = (evidence.formula == target.formula and evidence.bound == target.bound
              and system.verify_exhaustion_trace(evidence))
        return ok, False
    return False, None

@dataclass
class BudgetedCell:
    name: str
    budget: int
    estimate: F = F(0)
    known: dict = field(default_factory=dict)
    data: list = field(default_factory=list)
    log: list = field(default_factory=list)

    def process(self, target, evidence, stored, system, snapshots,
                actual=None, gamma=F(0)):
        pre = self.estimate
        row = {"cell": self.name, "pre": str(pre), "post": str(pre),
               "profile": None, "gain": 0, "cost": None, "verified": None}
        try:
            key = target_key(target)
            row["target"] = repr(key)
            if type(self.budget) is not int or self.budget < 0:
                verdict = "domain_error"
            elif stored is None:
                verdict = "abstain"
            elif type(stored) is not bool:
                verdict = "domain_error"
            else:
                cost = evidence_cost(system, target, evidence)
                row["cost"] = cost
                if cost > self.budget:
                    self.data.append((key, evidence))
                    verdict = "budget_bar"
                else:
                    ok, truth = verify_evidence(system, target, evidence, snapshots)
                    row["verified"] = ok
                    if not ok or stored != truth:
                        verdict = "verification_failed"
                    elif key in self.known:
                        verdict = "zero_gain"
                    else:
                        row["gain"] = 1
                        if actual is not None and type(target) is CapacityRecordTarget:
                            axis = {"BUD": 0, "HOR": 1, "REL": 2}[target.kind]
                            if F(actual) != evidence.values()[axis]:
                                raise ValueError("integration coordinate disagrees with snapshot")
                        profile = (scalar_profile(abs(F(actual) - pre), gamma)
                                   if actual is not None else scalar_profile(F(0)))
                        row["profile"] = profile["status"]
                        if profile["status"] in ("empty", "boundary_only"):
                            verdict = "integration_refused"
                        elif profile["status"] != "finite":
                            verdict = "unresolved"
                        else:
                            self.known[key] = (truth, evidence)
                            if actual is not None:
                                self.estimate = F(actual)
                            verdict = "retained"
        except (ValueError, TypeError, KeyError, AttributeError, ArithmeticError):
            verdict = "domain_error"
        row["post"], row["verdict"] = str(self.estimate), verdict
        self.log.append(row)
        return verdict

def extension_checks():
    system = DirectProofSystem()
    positive = ProofTarget(Formula("PRIME", (29,)), 5)
    truth, cert = system.decide_target(positive)
    assert truth
    barred, capable = BudgetedCell("low", 4), BudgetedCell("high", 5)
    assert barred.process(positive, cert, True, system, {}) == "budget_bar"
    assert capable.process(positive, cert, True, system, {}) == "retained"
    assert capable.process(positive, cert, True, system, {}) == "zero_gain"
    negative = ProofTarget(Formula("EVEN", (3,)), 1)
    truth, trace = system.decide_target(negative)
    assert not truth
    receiver = BudgetedCell("receiver", 100)
    assert receiver.process(negative, trace, False, system, {}) == "retained"
    altered = ExhaustionTrace(trace.formula, trace.bound, trace.checked[:-1])
    assert receiver.process(negative, altered, False, system, {}) == "verification_failed"
    snap = FrozenSnapshot("subject", 5, 1, 100, 5, 5, 5, library_size=25)
    snapshots = {("subject", 5, 1): snap}
    cap = CapacityRecordTarget("subject", 5, 1, "HOR", F(1, 5))
    host = BudgetedCell("host", 100, estimate=F(1, 5))
    assert host.process(cap, snap, True, system, snapshots, actual=F(1, 5)) == "retained"
    mixed = DerivedRecordTarget("AND", (positive, cap))
    assert host.process(mixed, (cert, snap), True, system, snapshots) == "retained"
    wrong = FrozenSnapshot("other", 5, 1, 0, 0, 0, 0)
    assert host.process(cap, wrong, True, system, snapshots) == "verification_failed"
    stale, current = BudgetedCell("subject", 100), BudgetedCell("subject", 100)
    for n in range(1, 6):
        target = ProofTarget(Formula("ADD", (n, 0, n)), 1)
        evidence = Certificate("ADD_EVAL", (n, 0, n))
        assert stale.process(target, evidence, True, system, {}) == "retained"
        assert current.process(target, evidence, True, system, {},
                               actual=F(n, 25)) == "retained"
    assert stale.known == current.known
    assert stale.process(cap, snap, True, system, snapshots,
                         actual=F(1, 5), gamma=GRID_STEP) == "integration_refused"
    assert current.process(cap, snap, True, system, snapshots,
                           actual=F(1, 5)) == "retained"
    assert scalar_profile(F(1, 5), F(0))["status"] == "finite"
    assert scalar_profile(ALPHA, ALPHA)["p_interval"] == (F(0), F(0))
    assert scalar_profile(RADIUS, F(0))["status"] == "boundary_only"
    a, b = fisher_split((0.5, 0.5, 0.5), (0, 0.2, 0), (1,))
    assert a > 0 and b < 1e-12
    value = tangent_discrepancy(1, 2, 2, 0.5)
    assert abs(value - (2 * math.sqrt(2) - 1)) < 1e-12
    assert analytic_fisher((1, 1, 1))[1][1] < 0.006
    return {"barred_handoff": barred.log[-1]["verdict"],
            "negative_import": "verified", "mixed_target": "verified",
            "stale_terminal": stale.log[-1], "current_terminal": current.log[-1],
            "exclusion_free": "finite", "pure_self_fraction": 1.0,
            "tangent_distance": round(value, 12)}
~~~

The extension source above has SHA-256 `70c8878ac1d38bb0ef80d4770c9b80c5a4c7519d928f3464bc34a37166c2e3df` under UTF-8/LF with one final newline. Its in-memory check runs Section 10's `run_self_checks()` and then `extension_checks()`. Direct positive verification was also compared with the base relation on all `6407` candidate/target pairs for $L=8$, $N_{\max}=4$. Additional fixtures cover NOT/OR composition, wrong snapshot revisions, and abstention. The executable scalar fixture uses a 25-record library so five verified predecessors give the exact coordinate $1/5$.

The run produces:

~~~json
{
  "barred_handoff": "budget_bar",
  "negative_import": "verified",
  "mixed_target": "verified",
  "stale_terminal": {
    "cell": "subject",
    "pre": "0",
    "post": "0",
    "profile": "empty",
    "gain": 1,
    "cost": 1,
    "verified": true,
    "target": "('capacity', 'subject', 5, 1, 'HOR', 1, 5)",
    "verdict": "integration_refused"
  },
  "current_terminal": {
    "cell": "subject",
    "pre": "1/5",
    "post": "1/5",
    "profile": "finite",
    "gain": 1,
    "cost": 1,
    "verified": true,
    "target": "('capacity', 'subject', 5, 1, 'HOR', 1, 5)",
    "verdict": "retained"
  },
  "exclusion_free": "finite",
  "pure_self_fraction": 1.0,
  "tangent_distance": 1.828427124746
}
~~~

The geometry scan reports candidate feasibility or an unresolved result. Certified scalar decisions use rational endpoint bounds and rational root brackets. The S-Life mathematical extension, phase-indexed diagonal access, finite screening and ladder results keep their sector-specific verification requirements. Extending runtime coverage to a new transition requires its input, evidence and simulation relation to the owning mathematical rule.

## 13. Integration map

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
| Complete negative-exhaustion transmission and fixed-width cost | Theorem PL.3 |
| Budgeted evidence, frozen capacity records and Boolean composition | Sections 12.1–12.2 and 12.8 |
| Fisher self-projection, attainable predictions and certified scalar refusal | Sections 12.3–12.5 |
| Reachable order control, external models, screening and ladder scope | Sections 12.6–12.7 |
| Tagged proof/diagonal target codec and selection-only bridge | Theorem PL.4 |
| Bounded pure-$\mathbf S$ reduction reachability and the three-sector selection-only extension | Theorem PL.5 |
| Finite-horizon witnesses for the fixed universal selected path | Corollary PL.5.1; pure-$\mathbf S$ companion (Cinematic Strawberry, 2026), Theorem 1R; Theorems 1--3 |
| Physical thermodynamic reading of irreversible reset, when physically instantiated | Theorem 31; Landauer [1961]; Bennett [1973] |

## 14. Final statement

Proof-Life is a finite, runnable PU toy universe whose proof-sector objects are bounded proof-existence claims and whose diagonal-sector objects are phase-indexed protocol targets. Its cells do not merely hold beliefs. They make predictions about typed finite targets, verify those predictions through finite certificates, complete finite exhaustion traces, or trace-certified diagonal access data, retain only validated predictive information, and propagate positive proof-certificates and complete negative-exhaustion messages only after independent verification. Its tagged proof/diagonal bridge schedules typed targets without transporting evidence or identifying the sectors' access semantics.

On the optional S-Life extension, cells also verify bounded pure-$\mathbf S$ reduction targets through positive redex traces or complete canonical negative trees. Corollary PL.5.1 maps every nominated finite horizon of the companion paper's fixed universal weak path to such a positive target. The three-sector codec preserves the evidence boundary among reduction reachability, arithmetic proofhood, and diagonal access. The runnable implementation covers the two-sector model of Theorems PL.1--PL.4; Theorem PL.5 supplies the optional mathematical third sector.

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
