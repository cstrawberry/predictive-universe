# 7. The Minimal Predictive Unit (MPU) Framework

Having established the foundational principles governing adaptive prediction, complexity, self-reference, and dynamics, we now introduce the core MPU model. The role of MPUs is fixed by the Cogito-to-PPI/PCE bridge developed in the Introduction and Appendix P: the framework first isolates the certified process-root, models its operational content as prediction, and then asks for a least nontrivial finite physical carrier on branches where the qualifying infimum is attained. This section defines those carriers, details their Hilbert and perspectival representations on the stated branches, specifies reset-free internal dynamics and branch-dependent interaction/update dynamics, and separates structural register size from the distribution-sensitive thermodynamic reset ledger.

**7.1 Hypothesis 1 (Hyp 1): The Nominated MPU Reality Model**

PU nominates a network of interacting Minimal Predictive Units (MPUs), as defined below, as its foundational physical realization. The nomination preserves the Cogito-certified process root while imposing finite implementation, verifiability, maintenance, update use, and response-null compression. These constraints motivate the MPU as a minimal nontrivial predictive carrier. Hypothesis 1 supplies the substrate premise; the quantum, field, matter, and spacetime conclusions additionally require their declared realization and bridge certificates. Appendix P's singleton result assumes the separately supplied chiral-matter and anomaly package and therefore remains downstream of this substrate premise. The nominated dynamics obey:
*   The Dual Dynamics of reset-free Internal Prediction and registered `Evolve` interaction/update (Section 7.3.3); unitary and stochastic representations require their separately stated branch hypotheses.
*   Optimization via the Prediction Optimization Problem (Axiom 1) and the Principle of Compression Efficiency (Definition 15).
*   Constraints arising from self-reference limits (SPAP, Theorem 10, Theorem 11) and reflexive interaction dynamics (RID, Definition 6).
* The registered binary Commit Snapshot quotient has structural log-cardinality $\varepsilon_0=\ln2$. The reusable full-context return channel $\mathcal G$ merges that label at fixed retained data. If the actual input ensemble is separately certified to be conditionally invariant under input-fibre exchange $\phi\mapsto1-\phi$, Theorem 31a gives $H(\Phi\mid R)=\ln2$ and $\varepsilon_{\mathrm{reset}}\ge\ln2$ on Definition 28's registered thermal branch. The separate CNOT diagnostic remains reversible and carries no such floor. Spacetime coupling uses the independent Appendix E/O bridge certificates.

**7.1.1 Definition 23 (Def 23): Minimal Predictive Unit (MPU)**

Let $\mathcal Q$ be the qualifying set in Definition 13 for the declared environment, score, random baseline, and margin. Assume $\mathcal Q\ne\varnothing$ and that its complexity infimum is attained. A **Minimal Predictive Unit (MPU)** is a state $\mu_*\in\mathcal Q$ satisfying
$$
C_P(\mu_*)=C_{op}
=\min_{\mu\in\mathcal Q}C_P(\mu).
$$
By membership in $\mathcal Q$, it instantiates the adaptive Fundamental Predictive Loop and achieves the declared performance margin.

The operational-context result is separate from this program-complexity minimum. On the realization class satisfying (O1)–(O3) and (FC), Theorem 15 gives $K_0=3$ and $N_{\mathrm{vis}}^{\min}=8$. If those contexts are represented as mutually perfectly distinguishable Hilbert alternatives, Theorem 23 gives $d_0\ge8$. The relation $C_{op}\ge K_0$ additionally requires Corollary 3's complexity-capacity bridge, and the choice $d_0=8$ additionally requires the active-dimension saturation hypotheses.

An MPU's state and dynamics are characterized by:

1. **State representation.** Its perspectival state is $S_{(s)}(t)=(\rho(t),s)$, where $\rho(t)$ is a density operator on $\mathcal H_0$ and $s\in\Sigma$; $(|\psi\rangle,s)$ is the pure-state shorthand fixed in Definition 24.
2. **Dual dynamics.** Definitions 26--27 distinguish reset-free Internal Prediction from the nominated `Evolve` interaction/update law. Their unitary and stochastic representations require the hypotheses of Theorem 8.7 and Proposition 28, respectively. Capacity-triggered actualization is used only when $\mathfrak C_{\mathrm{act}}$ is accepted.
3. **Minimal qualifying complexity.** The equality $C_P(\mu_*)=C_{op}$ holds by the attainment hypothesis and this definition, not by Theorem 16. Suppose the task and evaluation window are those of Axiom 3, a registered order-preserving score bridge identifies Definition 13's accuracy functional and matched random baseline with $PP_W$ and $\alpha$, and a registered same-state complexity bridge sends $\mu_*$ to Definition 19's coordinate $C=C_{op}$. Then membership in $\mathcal Q$ gives $PP_W(\mu_*)>\alpha$. Hence that attained MPU cannot be identified with Definition 19's $\alpha$-valued analytic endpoint; the latter belongs to a separate nonattained boundary branch.

**Metered actualization certificate.** The actualization certificate may be sharpened by an accepted metered actualization subcertificate $\mathfrak C_{\mathrm{meter}}(R)$ (Definition E.2a.8) for an interface register $R$. The certificate specifies the register alphabet, the capacity increment assigned to the retained record, a monotone acquisition interval, an overwrite bound, a no-early-firing comparison against PCE/PPI, and the process-tensor no-future-to-past causality record for the interventions used to read the meter. For a certified binary one-register interface the timing threshold is
$$
\Delta C_R\ge \ln 2-\epsilon_{\mathrm{meter}},
$$
with the residual-budget branch still using the paper's default link-cycle threshold unless this one-register subledger is explicitly present.

**Theorem 23d (Finite Registered MPU-Census Classifier).** Freeze a finite candidate set $\mathcal A$ of typed predictive architectures, their exact original and null-intervened response tables, PPI-admissibility predicates, and one source-exhausted cost $V$ in common units. Assume at least one candidate is admissible, and quotient the admissible candidates by equality of the complete retained response table. For each response class define
$$
v([a]):=\min_{b\in[a]}V(b).
$$
Exact enumeration returns every quotient class, its least-cost representatives, the global minimizer set of $v$, and any strict interclass gap. A unique minimal MPU class exists in this census exactly when one response class has strictly smaller $v$ than every other class.

*Proof.* Every predicate, response equality and cost comparison is decidable on the frozen finite set. Partitioning by table equality is exhaustive. Each response class attains its candidate-cost minimum, and the nonempty finite quotient attains the minimum of $v$. The global class is unique exactly under the displayed strict comparison. ∎

**Resolution TV-MPU-01-R1 (Metadata).** Exact domain: populated finite typed predictive-architecture censuses with a nonempty admissible subcensus, exact original/null response tables, PPI predicates and common-unit costs. Premises: decidability of every supplied predicate and comparison. Equivalence: equality of the complete retained response table, with class cost given by the least representative cost $v$. Budget: every candidate, quotient class and representative in the supplied census. Verifier: exhaustive admissibility, partition and exact cost comparison. Falsifier: an omitted response class, lower-cost omitted representative or claimed strict gap in a tie. Provenance class: source-internal finite classifier schema. Downstream consumers: Definition 23 and `TV-MPU-01`. Nonvacuity: one admissible architecture and a two-class equal-cost census. This is scoped `positive-discharge` for every populated finite census. Theorem 23d alone supplies no exhaustive physical census, common PPI realization or source-exhausted physical cost, so its finite-census result leaves `M+C+R`. Theorem 23e below closes `M` for every frozen bounded total decoder; accepting one decoder and bound as physically exhaustive, populating its records, and realizing them remain `C+R`.

**Theorem 23e (Bounded Description-Census Exhaustion).** Fix an integer $B\ge0$, a finite binary description alphabet, and a total deterministic decoder
$$
\operatorname{Dec}_B:\{w\in\{0,1\}^*:|w|\le B\}
\longrightarrow \mathcal A_{\mathrm{type}}\sqcup\{\bot\}.
$$
Assume that equality of decoded typed architectures, every PPI-admissibility predicate, every retained original and null-intervened response, and the common-unit cost $V$ are decidable. Then exhaustive enumeration of the $2^{B+1}-1$ input words, rejection of $\bot$, and exact deduplication produces the complete decoded architecture class
$$
\mathcal A_B
=
\{\operatorname{Dec}_B(w):|w|\le B,\ \operatorname{Dec}_B(w)\ne\bot\}.
\tag{23e.1}
$$
If its admissible subcensus is nonempty, Theorem 23d returns every retained-response quotient class, every least-cost representative, the complete global minimizer set, and the exact strict-gap decision on $\mathcal A_B$.

*Proof.* The input domain of $\operatorname{Dec}_B$ is finite and is exhausted by length-lexicographic enumeration. Totality assigns one decoded value or $\bot$ to every word. Exact equality removes repeated descriptions without removing a decoded architecture, so (23e.1) contains every architecture admitted by the frozen decoder and bound. The remaining claims are Theorem 23d applied to this proved-complete finite census. ∎

**Resolution TV-MPU-01-R2.** Exact domain: all architectures decoded by one frozen total decoder at description length at most $B$. Premises: the displayed finiteness, totality and decidability conditions and a nonempty admissible subcensus. Equivalence: equality of complete retained response tables, with duplicate descriptions removed first. Budget: all $2^{B+1}-1$ binary words. Verifier: length-lexicographic enumeration, decoder-totality check, exact deduplication and Theorem 23d. Falsifier: an admitted word not enumerated, a decoded architecture absent from $\mathcal A_B$, or an incorrect quotient/minimum/gap result. Nonvacuity is supplied by any decoder admitting the explicit three-register architecture of Section 7.1.3. This gives `positive-discharge` of the mathematical coverage and classifier component for every frozen bounded description universe. Selecting a physically exhaustive decoder and bound, populating the physical response tables, and accepting the common PPI/cost realization remain the `C+R` components.

**7.1.2 Interpretive Convention: Minimal Awareness**

The ongoing MPU cycle—prediction ($P_{int}$), verification ($V$), and update ($D_{cyc}$) under POP—is interpreted here as the most basic operational form of awareness. On the independently accepted Hilbert/Born/instrument/single-outcome branch, Proposition 9 represents an ideal registered verification as an `Evolve` instrument; the convention then assigns its outcome event this same minimal-awareness language. This is an interpretive assignment, not a theorem that Definition 27 makes every interaction an actualization or that phenomenal status supplies any physical premise. All subsequent derivations use the MPU's operational prediction, ND-RID, and POP/PCE properties together with each named branch hypothesis. In particular, $C_{op}\ge K_0$ is used only on Theorem 15 and Corollary 3's (O1)–(O3), (FC), Hilbert-distinguishability, and complexity-capacity branch.

**7.1.3 Example: An Explicit Three-Qubit Register Carrier**

This construction exhibits an eight-dimensional carrier for three binary register roles and an injective reflexive update, and it tests whether the stated reachable circuit actually contains a logically irreversible reset. The structural alphabet value $\varepsilon_0=\ln2$ is a separate log-cardinality ledger. It does not by itself compute $C_P$, establish $C_{op}=K_0$, or prove a global POP optimum; those conclusions require the bridge, attainment, and optimization hypotheses stated separately.

**1. Hilbert Space and Computational Basis**

*   **Hilbert Space:** The MPU carrier is $\mathcal{H}_0 = (\mathbb{C}^2)^{\otimes 3} \cong \mathbb{C}^8$. General states are density operators on $\mathcal H_0$; a pure state may be represented by a ray $[|\psi\rangle]$, with a unit-vector representative when needed. The computational basis vectors are $|b_2 b_1 b_0\rangle$, where $b_j \in \{0,1\}$. The choice $d_0=8$ realizes this explicit register carrier and attains Theorem 15's conditional Hilbert-carrier bound on the (O1)–(O3), (FC) branch; it is not forced by MPU status alone.

*   **Logical Roles of the Three Qubits:**
    1.  **Memory Qubit ($Q_M$, e.g., $b_2$):** Stores the MPU’s current internal model or state under reflexive update.
    2.  **Prediction Qubit ($Q_P$, e.g., $b_1$):** Holds the generated prediction for the next outcome, refreshed each cycle.
    3.  **Interface/Ancilla Qubit ($Q_I$, e.g., $b_0$):** Mediates interaction with the environment and may carry a temporary record. Whether resetting it is logically irreversible depends on the reachable state set and on the retained side information.

**2. Internal Prediction (Unitary) Evolution**

The Internal Prediction phase uses the controlled-NOT $U_{pred}=\mathrm{CNOT}_{M\to P}$ with $Q_P$ initialized to $|0\rangle$. For a basis input $|m\rangle_M$,
$$
U_{pred}|m,0,0\rangle=|m,m,0\rangle.
$$
For a general memory state $|\mu\rangle_M=a|0\rangle+b|1\rangle$, linearity gives
$$
U_{pred}\bigl((a|0\rangle+b|1\rangle)_M|0\rangle_P|0\rangle_I\bigr)
=a|0,0,0\rangle+b|1,1,0\rangle.
$$
This state is entangled between $Q_M$ and $Q_P$ when $ab\ne0$ and therefore is not two copies of $|\mu\rangle$. The circuit coherently correlates the prediction register with the computational-basis value and does not violate no-cloning.

**3. The ‘Evolve’ Interaction Implementing SPAP Logic**

The three-register construction contains two different maps that must not be conflated.

First, after $U_{\mathrm{pred}}$ the diagnostic circuit has reachable subspace
$$
\mathcal R_{\mathrm{diag}}
=
\operatorname{span}\{|0,0,0\rangle,|1,1,0\rangle\}.
$$
For
$$
U_{\mathrm{rev}}:(m,p,i)\longmapsto(\operatorname{NOT}(p\oplus i),p,m),
$$
one has
$$
U_{\mathrm{rev}}U_{\mathrm{pred}}
\bigl((a|0\rangle+b|1\rangle)_M|0\rangle_P|0\rangle_I\bigr)
=
a|1,0,0\rangle+b|0,1,1\rangle.
$$
On this image $I'=P$, so $V=\operatorname{CNOT}_{P\to I}$ resets $I$ coherently. The diagnostic subprotocol is injective and has no positive Landauer floor.

The reusable full-context cycle instead acts on
$$
\mathcal B_{\mathrm{com}}
=
\{|\phi,p,1\rangle:\phi,p\in\{0,1\}\}
$$
and returns it to $c=0$.
Theorem 15's reflexive step remains the injective map
$$
T(\phi,p,1)=(1-p,\phi,0).
$$
The cycle-closing operation follows that step:
$$
(\phi,p,1)
\xrightarrow{\ T\ }
(1-p,\phi,0)
\xrightarrow{\ \text{closure reset}\ }
(1-p,0,0).
$$
Thus O1 injectivity is preserved through the reflex step, and the old-current-state label $\Phi=\phi$ is erased only by the declared closure channel. Let
$$
\Pi_{\mathrm{ready}}
=
\sum_{\phi,p}|\phi,p,0\rangle\langle\phi,p,0|,
$$
and define
$$
K_{\mathrm{ready}}=\Pi_{\mathrm{ready}},
\qquad
K_{\phi}=\sum_{p}|1-p,0,0\rangle\langle\phi,p,1|
\qquad(\phi\in\{0,1\}).
$$
The full-context return channel is
$$
\mathcal G(\rho)
=
K_{\mathrm{ready}}\rho K_{\mathrm{ready}}^\dagger
+
\sum_{\phi}K_{\phi}\rho K_{\phi}^\dagger.
\tag{7.1.3a}
$$
It is CPTP because
$$
K_{\mathrm{ready}}^\dagger K_{\mathrm{ready}}
+
\sum_{\phi}K_{\phi}^\dagger K_{\phi}
=
\Pi_{c=0}+\Pi_{c=1}=I_8 .
$$
Only the label $\Phi$ is merged: coherence between distinct stored predictions is transported, while coherence between the two values of $\phi$ is destroyed. On Commit Snapshot basis states,
$$
\mathcal G\bigl(|\phi,p,1\rangle\langle\phi,p,1|\bigr)
=
|1-p,0,0\rangle\langle1-p,0,0|.
\tag{7.1.3b}
$$
Thus, at fixed retained data, the two values of $\Phi=\phi$ merge.

Let $R$ contain $P$ and every classical record retained and unchanged through closure. Assume as additional ensemble data that, for every $r$ with $\Pr(R=r)>0$, both input labels occur and the actual pre-closure law is invariant under the input-fibre exchange $\phi\mapsto1-\phi$. This is a symmetry of the erased input ensemble, not the physical channel $\mathcal G$. Then
$$
q(\phi\mid R)=\frac12,
\qquad
H_{\mathrm{Sh}}(\Phi\mid R)=\ln2.
\tag{7.1.3c}
$$
Under Definition 28's degenerate-register, cyclic-controller, and isothermal-bath hypotheses,
$$
\frac{\langle Q_{\mathrm{bath}}\rangle}{k_BT}
\ge
H_{\mathrm{Sh}}(\Phi\mid R)
=
\ln2.
\tag{7.1.3d}
$$
Equality is only the quasistatic zero-excess limit. Any unitary dilation of $\mathcal G$ must export an orthogonal record of $\Phi$. If that record remains available, it belongs to $R$ and the one-bit bound is not activated. Reusing a finite MPU on the closed branch instead requires that record to be reset or thermalized as part of returning the controller and environment to their registered cycle conditions. Equations (7.1.3a)–(7.1.3d), not the injective diagnostic circuit, supply the registered one-bit full-context reset.

**4. Capacity and Cost Accounting**

* **Register capacity:** The three binary registers have $C_{cap}=\log_2 8=3$ bits. Within Theorem 15's full-context realization class this attains $K_0=3$.
* **Predictive Physical Complexity:** The construction does not evaluate $C_P$ or $C_{op}$. An equality $C_{op}=K_0$ requires an attained qualifying state and a saturating complexity-capacity bridge.
* **Characteristic internal timescale:** A positive excitation scale and a specified orthogonalization task give Corollary 29.1. Other operations require separate clock data.
* **Full-context reset cost:** The diagnostic subprotocol resets $Q_I$ unitarily and has no positive Landauer floor. The full-context return channel $\mathcal G$ of Equation (7.1.3a) instead merges the Commit Snapshot label $\Phi$. On the conditionally exchange-invariant input-ensemble branch and Definition 28's registered thermal branch, Theorem 31a gives $\varepsilon_{\mathrm{reset}}\ge\ln2$. If either the conditional symmetry or the absence of a retained copy fails, only the general bound $\varepsilon_{\mathrm{reset}}\ge H_q(\Phi\mid R)$ remains.
**5. Solving the Prediction Optimization Problem (POP)**

For this analytic boundary diagnostic, define
$$
\overline V(C)=\lambda R(C)+R_I(C)-\Gamma_0\overline{PP}(C),
$$
where:
*   $R(C)=R(C_{op})+r_p(C-C_{op})^{\gamma_p}$ for $C\ge C_{op}$ and $\gamma_p>1$;
*   $R_I(C)=(r_I/\ln2)\ln(C/K_0)$ for $C>K_0$, with continuous boundary value $R_I(K_0)=0$;
*   $\overline{PP}(C)=\beta-(\beta-\alpha)\exp[-\kappa_{\mathrm{eff}}(C-C_{op})/K_0]$ is the analytic extension of Definition 19.

Assume locally that $C_{op}=\hat C_{target}=K_0$ and $\gamma_p=2$. Then $\overline{PP}(K_0)=\alpha$, while physical $PP$ on this branch is restricted to $C>K_0$. The right derivatives of the extensions are
$$
R'_+(K_0)=0,
\qquad
R''_+(K_0)=2r_p,
$$
$$
R_I'(K_0)=\frac{r_I}{K_0\ln2},
\qquad
R_I''(K_0)=-\frac{r_I}{K_0^2\ln2},
$$
and
$$
\overline{PP}'(K_0)=\frac{(\beta-\alpha)\kappa_{\mathrm{eff}}}{K_0},
\qquad
\overline{PP}''(K_0)=-\frac{(\beta-\alpha)\kappa_{\mathrm{eff}}^2}{K_0^2}.
$$
For minimization of the closed analytic extension on $[K_0,\infty)$, the one-sided necessary condition is
$$
\overline V'_+(K_0)\ge0.
$$
One may impose the stronger equality $\overline V'_+(K_0)=0$, which calibrates
$$
\Gamma_0
=\frac{r_I}{(\beta-\alpha)\kappa_{\mathrm{eff}}\ln2}>0.
$$
Under this calibration,
$$
\overline V''_+(K_0)
=2\lambda r_p
+\frac{r_I}{K_0^2\ln2}(\kappa_{\mathrm{eff}}-1).
$$
If this quantity is positive, the one-sided Taylor expansion gives $\overline V(K_0+h)>\overline V(K_0)$ for all sufficiently small $h>0$; in particular, $\lambda r_p>0$ and $\kappa_{\mathrm{eff}}\ge1$ suffice. Thus $K_0$ is a strict local boundary minimizer of the closed analytic extension only. It is not an attained minimizer on the open physical response-law domain, is not viable under Axiom 3, and cannot be the same-task MPU of Definition 23. Global POP optimality remains unproved.

*Numeric cycle for a dimensionless model-layer arming score:* Set $\alpha=0.60$, $\beta=0.98$, $\kappa_{\mathrm{eff}}=0.25$, $K_0=3$ bits, and $C_{op}=K_0$. Introduce dimensionless policy penalties $c_p=0.10$ and $c_I=0.02$, distinct from the cost-rate coefficients $r_p$ and $r_I$, and define
$$
\Delta\Psi_{arm}
:=\kappa_{\mathrm{eff}}\frac{\Delta C}{1\ \mathrm{bit}}-c_p-c_I.
$$
For $p=(7/10,1/10,1/10,1/10)$ and $\Delta C=0.012$ bits,
$$
\Delta\Psi_{arm}=0.25(0.012)-0.10-0.02=-0.117.
$$
The policy therefore remains passive. The arming threshold is
$$
\Delta\Psi_{arm}>0
\quad\Longleftrightarrow\quad
\Delta C>\frac{0.12}{0.25}\ \mathrm{bit}=0.48\ \mathrm{bit}.
$$
This is a dimensionless illustrative policy, not a consequence of the dimensional PCE force $\Psi$ in Equation (24). A commit still requires the retained-ledger certificate $\mathfrak C_{\mathrm{act}}$ when that branch is invoked.


### **Minimal Predictive Algebra and the Conditional Dimension Bound $d_0\ge8$**

Theorem 15 supplies a finite-context bound only on its full-context realization class. The algebraic argument below studies a narrower Hilbert branch defined by additional architectural hypotheses; PCE does not derive those hypotheses by itself.

**Definition (Minimal Predictive Algebra Branch).**
Assume the MPU carrier is a complex Hilbert space and that the Memory, Prediction, and Interface roles are represented by three unital subalgebras
$$
\mathfrak A_M,\mathfrak A_P,\mathfrak A_I\subseteq\mathfrak A,
$$
each isomorphic to $M_2(\mathbb C)$, with pairwise commuting ranges. Assume further that the multiplication representation of their algebraic tensor product is nonzero. The C*-algebra generated by these labeled factors is called the **Minimal Predictive Algebra** on this branch.

These are independent-register and complex-Hilbert hypotheses. Simultaneous readability of selected record observables alone would require only those selected observables to commute and would not imply three commuting copies of the full qubit matrix algebra. Under the stronger hypotheses above, the following lemma proves the eight-dimensional representation bound. PCE can select the least dimension only after a cost function and the no-additional-benefit condition of the subsequent stability theorem are imposed.

**Lemma (Hilbert-Space Bound for Three Commuting Unital Qubit Factors).**
Let $\mathfrak A$ be a unital C*-algebra with three unital *-monomorphisms
$$
\iota_M,\iota_P,\iota_I:M_2(\mathbb C)\to\mathfrak A
$$
whose ranges commute pairwise. Then every faithful nondegenerate representation of $\mathfrak A$ has Hilbert-space dimension at least eight.

*Proof.* Pairwise commutation makes
$$
\Phi(a\otimes b\otimes c)
:=\iota_M(a)\iota_P(b)\iota_I(c)
$$
a *-homomorphism from $M_2(\mathbb C)^{\otimes3}$ into $\mathfrak A$. It is nonzero because
$$
\Phi(I_2\otimes I_2\otimes I_2)=1_{\mathfrak A}.
$$
The domain is $M_8(\mathbb C)$, which is simple. The kernel of a *-homomorphism is a closed two-sided ideal, so the nonzero map has zero kernel and is injective. Hence $\mathfrak A$ contains a copy of $M_8(\mathbb C)$. Every nonzero representation of $M_8(\mathbb C)$ is a direct sum of its eight-dimensional defining representation, so the restriction of any faithful nondegenerate representation of $\mathfrak A$ has dimension at least eight. ∎

The Principle of Compression Efficiency selects the saturating case $d_0=8$ only after the active-operational-dimension hypotheses stated below are imposed.

**Theorem (PCE Stability of $d_0 = 8$ from Algebraic Completeness).**
Let the PCE potential for an MPU with an active operational dimension $d$ be $V(d) = V_{cost}(d) - V_{benefit}(d)$, subject to the algebraic lower bound $d \ge 8$. The stability of the minimal dimension $d^*=8$ is a necessary consequence of PCE optimization under the following physically-motivated conditions:

1.  **Algebraic Sufficiency and Diminishing Returns:** The core predictive benefit, derived from instantiating the complete, self-referential predictive algebra (SPAP/RID), is fully realized at $d=8$. Assume the marginal predictive benefit $\Delta V_{benefit}(d)=V_{benefit}(d)-V_{benefit}(d-1)$ is significant for $d\le 8$ but vanishes for $d>8$. Any additional dimension is a "spectator" that does not contribute to the core predictive task and is subject to rapidly diminishing returns.
2.  **Monotonic Complexity Cost:** The resource cost of maintaining and integrating an active dimension, $V_{cost}(d)$, is a strictly increasing function of $d$. Adding a dimension always incurs a non-zero physical cost.

Under these conditions, $V(d)$ is strictly increasing for $d>8$, so $d=8$ is the unique minimizer of the static discrete optimization problem on $\{8,9,10,\ldots\}$. This establishes only the unique static minimizer. Decoupling or convergence of larger active sectors requires a separately specified dynamics and convergence theorem.

*Proof.* For any dimension $d > 8$, the change in the potential from adding the $d$-th dimension is $\Delta V(d) = \Delta V_{cost}(d) - \Delta V_{benefit}(d)$. By condition (2), the marginal cost is strictly positive, $\Delta V_{cost}(d) > 0$. By condition (1), the marginal benefit vanishes, $\Delta V_{benefit}(d)=0$. Therefore, the marginal change in the potential is strictly positive: $\Delta V(d) > 0$ for all $d > 8$. This implies that the potential $V(d)$ is a strictly increasing function for $d > 8$. The unique global minimum of $V(d)$ on the allowed domain $d \in \{8, 9, 10, \dots\}$ must therefore occur at the boundary, $d^*=8$. ∎

Here $d$ is the **active operational dimension**, the dimension coupled into the predictive loop. Under the two hypotheses of the preceding theorem, $d=8$ is the unique minimizer of the discrete potential over $\{8,9,10,\ldots\}$. A claim that physical dynamics decouple larger sectors and converge to that minimizer requires an explicit dynamics on dimension sectors and a convergence theorem; the static minimization argument alone does not supply it. Theorem 23 remains the conditional Hilbert-rank lower bound $d_0\ge8$.

### **Logical Structure, Minimal Realization, and Predictive-Semantic Geometry of the MPU State Space**

On Theorem 15's realization class satisfying (O1)–(O3) and (FC), the joint response map
$$
r=(r_m,r_p,r_v):\mathcal S_{\mathrm{vis}}\longrightarrow\{0,1\}^3,
\qquad
r(s)=\bigl(\phi(s),p_{\mathrm{stored}}(s),c_{\mathrm{phase}}(s)\bigr),
$$
is surjective, and the explicit eight-state construction attains the least context set $B_3=\{0,1\}^3$ on that class. Theorem 15 does not force a tensor-product decomposition or an eight-dimensional physical carrier. The former requires the commuting-subalgebra hypotheses of the Minimal Predictive Algebra discussion; the latter requires mutually perfectly distinguishable Hilbert representatives and, for equality $d_0=8$, the admissible-comparator, response-quotient, strict-cost, and minimal-branch hypotheses of Theorem Z.2. The next results apply only on their separately stated algebraic and carrier branches.

**Theorem 23a (Minimal Faithful Realization is 3-Qubit).**
Assume the hypotheses of the lemma above, and let
$$
\mathfrak{A}_{\min}:=C^*(\mathfrak{A}_M,\mathfrak{A}_P,\mathfrak{A}_I).
$$
Then every faithful representation of $\mathfrak{A}_{\min}$ on a Hilbert space of smallest possible dimension is unitarily equivalent to the standard tensor-product representation of $M_2(\mathbb{C})^{\otimes 3}$ on $(\mathbb{C}^2)^{\otimes 3}$.

*Proof.* By the lemma above, the canonical multiplication map
$$
\Phi: M_2(\mathbb{C}) \otimes M_2(\mathbb{C}) \otimes M_2(\mathbb{C}) \to \mathfrak{A}_{\min},\qquad
a \otimes b \otimes c \mapsto abc
$$
is an injective *-homomorphism. Its image is a C*-subalgebra of $\mathfrak{A}_{\min}$ containing the three distinguished subalgebras $\mathfrak{A}_M,\mathfrak{A}_P,\mathfrak{A}_I$. Because $\mathfrak{A}_{\min}$ is the C*-algebra generated by these three subalgebras, $\operatorname{im}\Phi=\mathfrak{A}_{\min}$. Hence
$$
\mathfrak{A}_{\min}\cong M_2(\mathbb{C})^{\otimes 3}\cong M_8(\mathbb{C}).
$$
Let $\pi:\mathfrak A_{\min}\to\mathcal B(\mathcal H_0)$ be a faithful unital representation on a Hilbert space of smallest possible dimension, and let $e_{ij}$ be the matrix units of $M_8(\mathbb C)$. Put $\mathcal H_i:=\pi(e_{ii})\mathcal H_0$. The projections $\pi(e_{ii})$ are pairwise orthogonal and sum to the identity, so
$$
\mathcal H_0=\bigoplus_{i=1}^8\mathcal H_i.
$$
For every $i,j$, $\pi(e_{ij})$ maps $\mathcal H_j$ isometrically onto $\mathcal H_i$, because on these subspaces
$$
\pi(e_{ji})\pi(e_{ij})=\pi(e_{jj}),
\qquad
\pi(e_{ij})\pi(e_{ji})=\pi(e_{ii}).
$$
Thus all $\mathcal H_i$ have a common dimension $n$. Faithfulness implies $\pi(e_{11})\ne0$, so $n\ge1$. Choose an orthonormal basis of $\mathcal H_1$ and transport it to each $\mathcal H_i$ using $\pi(e_{i1})$. In the resulting orthonormal basis,
$$
\mathcal H_0\cong\mathbb C^8\otimes\mathbb C^n,
\qquad
\pi(X)=X\otimes I_n.
$$
Consequently $\dim\mathcal H_0=8n$, and smallest possible faithful dimension forces $n=1$. Under a unitary
$$
U:\mathcal H_0\to\mathbb C^2\otimes\mathbb C^2\otimes\mathbb C^2,
$$
the representation is the standard irreducible one:
$$
U\pi(\Phi(a\otimes b\otimes c))U^\dagger=a\otimes b\otimes c.
$$
Under this identification, the three distinguished commuting subalgebras are carried to
$$
M_2(\mathbb{C}) \otimes I \otimes I,\qquad
I \otimes M_2(\mathbb{C}) \otimes I,\qquad
I \otimes I \otimes M_2(\mathbb{C}).
$$
∎

**Corollary 23a.** Once the three functional roles are specified, the minimal predictive state space admits a factorization
$$
\mathcal{H}_0\cong \mathcal{H}_M \otimes \mathcal{H}_P \otimes \mathcal{H}_I,\qquad
\dim \mathcal{H}_M=\dim \mathcal{H}_P=\dim \mathcal{H}_I=2,
$$
corresponding to the Memory, Prediction, and Interface subsystems of Section 7.1.3. The explicit 3-qubit MPU of Section 7.1.3 is therefore the minimal faithful realization of the stated algebraic assumptions, unique up to unitary equivalence.

*Proof.* Theorem 23a supplies a unitary identification
$$
\mathcal H_0\cong\mathbb C^2\otimes\mathbb C^2\otimes\mathbb C^2
$$
under which the three distinguished algebras act on the first, second, and third factors, respectively. Label these factors $\mathcal H_M$, $\mathcal H_P$, and $\mathcal H_I$ according to their specified functional roles. Each factor is $\mathbb C^2$, so each has dimension two. The minimality and unitary-uniqueness assertions are exactly those of Theorem 23a. ∎

**Convention (Clifford Signature).** Throughout this manuscript, real Clifford algebras $\mathrm{Cl}_{\mathbb R}(p,q)$ are taken with the negative-definite convention on the last $q$ generators, so that $\mathrm{Cl}_{\mathbb R}(p,q)$ is the unital associative $\mathbb R$-algebra generated by $\{e_1,\ldots,e_{p+q}\}$ with $e_i^2=+1$ for $i\le p$ and $e_i^2=-1$ for $i>p$. Under this convention the standard real classification gives $\mathrm{Cl}_{\mathbb R}(0,6)\cong M_8(\mathbb R)$.

**Corollary 23a.1 (Complex Clifford Form of the Minimal Predictive Algebra).**
On the minimal branch,
$$
K_0=3,
\qquad
\mathfrak A_{\min}\cong M_2(\mathbb C)^{\otimes 3}\cong M_8(\mathbb C)\cong \mathrm{Cl}_{\mathbb C}(6).
$$
Equivalently, the minimal predictive algebra is the standard complex Clifford algebra of rank $6=2K_0$ acting on the 8-dimensional complex state space.

With a compatible real-carrier marking $r_V$ on the carrier $V_{\min}\cong\mathbb C^8$ whose fixed carrier is $V_{\min}^{r_V}\cong\mathbb R^8$, the induced marked real form is
$$
\mathfrak A_{\min}^{r_V}
=
\{T\in\mathfrak A_{\min}: r_V T r_V^{-1}=T\}
\cong M_8(\mathbb R)\cong \mathrm{Cl}_{\mathbb R}(0,6),
\qquad
\mathfrak A_{\min}^{r_V}\otimes_{\mathbb R}\mathbb C\cong \mathfrak A_{\min}.
$$
The complex algebra alone selects only $M_8(\mathbb C)\cong\mathrm{Cl}_{\mathbb C}(6)$ up to complex unitary equivalence. The real form $\mathrm{Cl}_{\mathbb R}(0,6)$ is selected exactly after the compatible real-carrier marking is included. Such a marking is non-canonical: real structures on $\mathbb C^8$ form a single $U(8)$-orbit, so the marking is genuinely additional data, not a discovery internal to $\mathfrak A_{\min}$. An octonionic product, real cross-product, Cayley four-form, or $\mathrm{Spin}(7)$ stabilizer is not determined by $\mathfrak A_{\min}$ or by the real-carrier mark alone.

*Proof.* Theorem 15 gives $K_0=3$, and Theorem 23a gives
$$
\mathfrak A_{\min}\cong M_2(\mathbb C)^{\otimes3}\cong M_8(\mathbb C).
$$
The complex Clifford classification of Chevalley (1954) applies because the scalar field is $\mathbb C$, the quadratic form is nondegenerate, and its dimension is the even integer $2n$. It gives
$$
\mathrm{Cl}_{\mathbb C}(2n)\cong M_{2^n}(\mathbb C).
$$
With $n=3$, this is $\mathrm{Cl}_{\mathbb C}(6)\cong M_8(\mathbb C)$.

A compatible real-carrier marking is an antiunitary involution $r_V:V_{\min}\to V_{\min}$. It induces the antilinear involution $T\mapsto r_VTr_V^{-1}$ of $\mathfrak A_{\min}$. Its invariant carrier $V_{\min}^{r_V}$ is an 8-dimensional real vector space, and the invariant algebra is
$$
\operatorname{End}_{\mathbb R}(V_{\min}^{r_V})\cong M_8(\mathbb R).
$$
The real classification of Chevalley (1954) applies to the nondegenerate real quadratic space of signature $(0,6)$ under the sign convention declared above and gives
$$
\mathrm{Cl}_{\mathbb R}(0,6)\cong M_8(\mathbb R).
$$
Complexification gives $M_8(\mathbb R)\otimes_{\mathbb R}\mathbb C\cong M_8(\mathbb C)$. Hence the marked real form complexifies to the required complex algebra. Carrier real structures form a single $U(8)$-orbit, so choosing one is additional carrier data.

The hypotheses used here contain only a complex matrix algebra, its irreducible complex module, and optionally a carrier real structure. They contain no octonionic multiplication, real cross-product, or Cayley four-form. Since a $\mathrm{Spin}(7)$ stabilizer requires a Cayley four-form on an oriented real 8-dimensional carrier, it does not follow from the stated data. ∎

**Remark 23a.1a (Hurwitz Coherence Check).** On the minimal branch, $d_0=8$ is also the maximal dimension of a normed division algebra over $\mathbb R$. This is a secondary coherence check already compatible with the Appendix Z branch data; it is not an independent derivation of $d_0=8$.

**Corollary 23a.1b (Numerical Hurwitz Coincidence).** The Horizon Constant equals the number of non-real normed division algebras over $\mathbb R$:
$$
K_0=3=\#\{\mathbb C,\mathbb H,\mathbb O\}.
$$

*Proof.* Theorem 15 gives $K_0=3$. Hurwitz's classification (Hurwitz 1898) applies to finite-dimensional unital real division algebras carrying a positive-definite multiplicative norm. It states that such an algebra is isomorphic to exactly one of
$$
\mathbb R,\qquad\mathbb C,\qquad\mathbb H,\qquad\mathbb O.
$$
Removing the real algebra leaves precisely the three pairwise non-isomorphic algebras $\mathbb C$, $\mathbb H$, and $\mathbb O$. Their number is therefore $3=K_0$. ∎

**Theorem 23a.1c (Negative Resolution of the Hurwitz Coincidence).** Let $\mathsf{SPAP}_{\min}$ be the groupoid whose objects are minimal-branch SPAP register configurations
$$
(\mathcal H_0,\mathfrak A_M,\mathfrak A_P,\mathfrak A_I)
$$
realizing the conclusions of Theorem 23a and Corollary 23a, and whose morphisms are unitary intertwiners preserving the three labeled functional factors. Let $\mathsf{Hur}_{\neq\mathbb R}$ be the groupoid of non-real normed real division algebras over $\mathbb R$ with algebra isomorphisms. Then no functor
$$
F:\mathsf{SPAP}_{\min}\to \mathsf{Hur}_{\neq\mathbb R}
$$
has essential image consisting of the three Hurwitz objects
$$
\mathbb C,\quad \mathbb H,\quad \mathbb O.
$$
In particular, the equality
$$
K_0=3=\#\{\mathbb C,\mathbb H,\mathbb O\}
$$
is not the count of a shared categorical image, and the two categories are not equivalent.

*Proof.* By Theorem 23a, every faithful minimal realization of the minimal predictive algebra is unitarily equivalent to the standard representation of $M_2(\mathbb C)^{\otimes 3}$ on $(\mathbb C^2)^{\otimes 3}$. Corollary 23a identifies the three distinguished commuting factors with the Memory, Prediction, and Interface subsystems. Therefore every object of $\mathsf{SPAP}_{\min}$ is isomorphic to the standard 3-qubit configuration
$$
\big((\mathbb C^2)^{\otimes 3},
M_2(\mathbb C)\otimes I\otimes I,
I\otimes M_2(\mathbb C)\otimes I,
I\otimes I\otimes M_2(\mathbb C)\big),
$$
so $\mathsf{SPAP}_{\min}$ has exactly one isomorphism class of objects.

Hurwitz's theorem (Hurwitz 1898) applies because the objects of $\mathsf{Hur}_{\neq\mathbb R}$ are finite-dimensional unital real division algebras with positive-definite multiplicative norm. It classifies the non-real objects as exactly the three pairwise non-isomorphic algebras
$$
\mathbb C,\qquad \mathbb H,\qquad \mathbb O.
$$
Thus $\mathsf{Hur}_{\neq\mathbb R}$ has three isomorphism classes.

Now let $F:\mathsf{SPAP}_{\min}\to \mathsf{Hur}_{\neq\mathbb R}$ be any functor. Functors send isomorphic source objects to isomorphic target objects. Since all objects of $\mathsf{SPAP}_{\min}$ are mutually isomorphic, every object in the essential image of $F$ lies in a single target isomorphism class. Hence
$$
\#\big(\operatorname{EssIm}(F)/\cong\big)\le 1.
$$
This makes it impossible for the essential image to consist of all three non-isomorphic Hurwitz objects. Therefore no such functor exists, and a fortiori the categories are not equivalent. ∎

**Remark 23a.1d (What Survives).** Corollary 23a.1b remains a valid numerical coherence check. Theorem 23a.1c excludes a categorical derivation of the three non-real Hurwitz objects from the canonical minimal-branch SPAP configuration groupoid. A coarser comparison between the ordered three-register tower and the first three nontrivial Cayley-Dickson stages may still be mathematically useful, but that would be a separate construction on a different source category; it is not the same as a functor from the canonical minimal-branch SPAP configuration category.

The compatible real-carrier refinement of Corollary 23a.1 selects the $\mathrm{Cl}_{\mathbb R}(0,6)$ real form. Cayley--Dickson, octonionic, or $\mathrm{Spin}(7)$ data remain additional markings unless the branch separately supplies an octonionic product, a Cayley four-form, or an equivalent stabilizer datum. They are compatible with the $d_0=8$ carrier but do not replace Theorem 15's context count, Theorem 23's Hilbert lower bound, Theorem Z.2's same-class comparator, the Peirce tangent count, or the mode--channel/kissing-number selection.

**Remark 23a.1e (Inner Symmetry of the Three-Register SPAP Frame).** Let

$$
\mathcal H_{\mathrm{PU}}^{\mathrm{SPAP}}
=
\mathcal H_M\otimes\mathcal H_P\otimes\mathcal H_I
\cong
(\mathbb C^2)^{\otimes3}
$$

be the standard minimal SPAP carrier of Theorem 23a and Corollary 23a, and let

$$
\mathfrak A_M=M_2(\mathbb C)\otimes I\otimes I,
\qquad
\mathfrak A_P=I\otimes M_2(\mathbb C)\otimes I,
\qquad
\mathfrak A_I=I\otimes I\otimes M_2(\mathbb C)
$$

be the three distinguished register subalgebras. The label-preserving projective inner symmetry of this SPAP frame is

$$
\mathrm{Inn}_{\mathrm{SPAP}}^{\mathrm{lab}}
:=
\{U\in U(\mathcal H_{\mathrm{PU}}^{\mathrm{SPAP}}):
U\mathfrak A_XU^*=\mathfrak A_X\text{ for }X=M,P,I\}/U(1)
\cong
(\mathrm{PSU}(2))^3.
$$

If the branch keeps only the unordered three-factor frame and allows relabeling of the three functional registers, the corresponding projective frame normalizer is

$$
\mathrm{Inn}_{\mathrm{SPAP}}^{\mathrm{fr}}
\cong
(\mathrm{PSU}(2))^3\rtimes S_3,
$$

with $S_3$ acting by factor permutation. Thus the semidirect product occurs only on the frame-relabeling convention; with fixed Memory, Prediction, and Interface labels, the symmetry is the connected label-preserving product $(\mathrm{PSU}(2))^3$.

*Proof.* The generated algebra $\mathfrak A_M\vee\mathfrak A_P\vee\mathfrak A_I$ is the full matrix algebra $M_8(\mathbb C)$, so preserving the full algebra alone would impose no restriction beyond unitarity. The operative datum is the three-factor frame $(\mathfrak A_M,\mathfrak A_P,\mathfrak A_I)$. A unitary that preserves each factor subalgebra induces an inner automorphism of each copy of $M_2(\mathbb C)$ and hence is represented, up to a scalar phase, by a tensor product $U_M\otimes U_P\otimes U_I$ with $U_X\in U(2)$. Quotienting the scalar phase and the phase of each factor leaves $PU(2)^3\cong(\mathrm{PSU}(2))^3$. If the frame is treated as unordered, one may additionally permute the three tensor factors, giving the semidirect product by $S_3$. This is compatible with Theorem G.10.3 on each active two-dimensional kernel and with Corollary 23a's factorization. ∎

Where a downstream rigidity statement says "fixed up to inner unitary on the predictive carrier," the label-preserving class is $\mathrm{Inn}_{\mathrm{SPAP}}^{\mathrm{lab}}$ unless that statement explicitly permits register relabeling, in which case the frame-normalizer class $\mathrm{Inn}_{\mathrm{SPAP}}^{\mathrm{fr}}$ is used. This naming changes no previously proved rigidity content.


**Theorem 23b (Operational Pure-State Geometry on the Minimal Branch).**
On the minimal active branch $d_0=8$, the MPU pure-state description admits the following quotient form.

(i) The normalized amplitude component $|\psi\rangle\in\mathcal H_0$ with $\langle\psi|\psi\rangle=1$, modulo global phase $|\psi\rangle\sim e^{i\theta}|\psi\rangle$, is a ray $[\psi]\in\mathbb P(\mathcal H_0)\cong\mathbb{CP}^7$, endowed with the Fubini-Study metric.

(ii) The perspective component is $s\in\Sigma\cong U(8)/U(1)^8$, equipped with the quotient Riemannian metric of Definition 25 below.

(iii) Hence the operational pure-state datum is a point $([\psi],s)\in\mathbb{CP}^7\times\Sigma$, endowed with the product of these two metrics.

(iv) Under the factorization $\mathcal{H}_0\cong \mathcal{H}_M \otimes \mathcal{H}_P \otimes \mathcal{H}_I$ (Corollary 23a), the fully separable pure states are exactly the image of the Segre embedding
$$
\operatorname{Seg}: \mathbb{CP}^1\times \mathbb{CP}^1\times \mathbb{CP}^1 \hookrightarrow \mathbb{CP}^7,\qquad
([\psi_M],[\psi_P],[\psi_I])\mapsto[\psi_M\otimes\psi_P\otimes\psi_I].
$$

*Proof.* By Proposition 7, operational outcome probabilities are invariant under a global phase, so the physically relevant pure amplitude is the ray $[\psi]$. Because $\dim \mathcal{H}_0=8$ on the minimal active branch, the ray space is $\mathbb{P}(\mathcal{H}_0)\cong \mathbb{CP}^7$ with its standard Fubini-Study metric. Theorem 25 and Definition 25 below identify the perspective space with $\Sigma\cong U(8)/U(1)^8$ and equip it with a quotient Riemannian metric. The product therefore gives the stated smooth metric structure on $\mathbb{CP}^7\times \Sigma$. Finally, under the three-qubit factorization, a pure state is fully separable if and only if it is a simple tensor $\psi_M\otimes\psi_P\otimes\psi_I$, and these are exactly the points in the image of the Segre embedding. ∎

**Theorem 23c (Predictive-Semantic Geometry of the MPU State Space).**
Assume the three-qubit factorization of Corollary 23a and the Born rule of Proposition 7. Then the geometry of the pure-state space has direct predictive meaning in two senses.

(i) For any smooth normalized one-parameter family $|\psi(\theta)\rangle$, letting $\gamma(\theta)=[\psi(\theta)]\in \mathbb{CP}^7$, the quantum Fisher information and the Fubini-Study metric satisfy
$$
F_Q(\theta)=4\,g_{FS}\big(\dot\gamma(\theta),\dot\gamma(\theta)\big).
$$
Hence the Fubini-Study metric is the local optimal statistical-distinguishability metric for predictive state families [Braunstein & Caves 1994].

(ii) The Segre variety above is exactly the locus of fully factorized pure states. A ray lies outside this locus if and only if it is not fully separable with respect to $\mathcal{H}_M\otimes\mathcal{H}_P\otimes\mathcal{H}_I$, and therefore encodes non-factorizable correlations across the memory/prediction/interface decomposition.

*Proof.* For a smooth normalized family $|\psi(\theta)\rangle$, differentiation of $\langle\psi(\theta)|\psi(\theta)\rangle=1$ shows that $\langle\psi|\partial_\theta\psi\rangle$ is purely imaginary. The Fubini-Study quadratic form is
$$
g_{FS}(\dot\gamma,\dot\gamma)
=\langle\partial_\theta\psi|\partial_\theta\psi\rangle
-|\langle\psi|\partial_\theta\psi\rangle|^2.
$$
For $\rho_\theta=|\psi(\theta)\rangle\langle\psi(\theta)|$, the symmetric-logarithmic-derivative formula gives
$$
F_Q(\theta)
=4\left(\langle\partial_\theta\psi|\partial_\theta\psi\rangle
-|\langle\psi|\partial_\theta\psi\rangle|^2\right)
=4g_{FS}(\dot\gamma,\dot\gamma).
$$
The Braunstein–Caves theorem (Braunstein & Caves 1994) applies because $\rho_\theta$ is a smooth one-parameter family of normalized density operators on the finite-dimensional carrier $\mathcal H_0$, and its optimization ranges over all POVMs. It identifies $F_Q$ with the supremum of the classical Fisher information of the corresponding Born distributions. This proves part (i).

For part (ii), by definition the Segre map sends a triple of rays to the ray of their simple tensor. Its image is therefore exactly the set of fully separable rays. A ray outside the image has no simple-tensor representative and hence is not fully separable across the Memory, Prediction, and Interface factors. ∎

*Remark.* The result identifies the geometric boundary between fully factorized and internally correlated pure states. No particular scalar entanglement measure is fixed here.

**Corollary 23c.1 (Predictive Fisher Metric and Cramér-Rao Gate).**
Let $\Theta$ be a finite-dimensional smooth chart of MPU protocol-response states and let
$$
\rho:\Theta\to\mathcal D(\mathcal H_0)
$$
be a $C^2$ family of density matrices on the retained Hilbert branch. The chart is read on the retained identifiable support stratum, with the usual lower-semicontinuous SLD extension at rank-change boundary points. For any finite retained protocol POVM $E=\{E_i\}$ define
$$
p_i(\theta)=\operatorname{tr}(\rho(\theta)E_i)
$$
and the classical Fisher matrix
$$
F^{(E)}_{ab}(\theta)
=
\sum_{i:p_i(\theta)>0}
p_i(\theta)
\partial_a\log p_i(\theta)
\partial_b\log p_i(\theta),
\tag{23c.1}
$$
again with the usual lower-semicontinuous extension at zero-probability boundary points. Let $F^Q_{ab}$ be the symmetric logarithmic derivative quantum Fisher matrix, defined by
$$
\partial_a\rho
=
\frac12(L_a\rho+\rho L_a),
\qquad
F^Q_{ab}
=
\frac12\operatorname{tr}\rho(L_aL_b+L_bL_a).
\tag{23c.2}
$$
Then:

1. for every finite retained protocol $E$,
$$
F^{(E)}(\theta)\preceq F^Q(\theta);
\tag{23c.3}
$$

2. for every regular locally unbiased estimator $\hat\theta$ built from $n$ independent repetitions of the retained protocol $E$, on every identifiable subspace on which $F^{(E)}$ is nonsingular,
$$
\operatorname{Cov}_\theta(\hat\theta)
\succeq
\frac1n\big(F^{(E)}(\theta)\big)^{-1};
\tag{23c.4}
$$

3. the tensor
$$
h_{ab}(\theta):=\frac14F^Q_{ab}(\theta)
\tag{23c.5}
$$
is a canonical positive semidefinite predictive distinguishability tensor on the retained response-state chart. Its kernel consists exactly of tangent directions $v=v^a\partial_a$ for which
$$
\partial_v\rho=0
$$
as a retained density-operator tangent, equivalently for which every retained Born probability has zero first variation for every effect in the protocol-complete retained finite-response class. After quotienting PPI response-null directions, $h$ is positive definite on the locally identifiable quotient.

On the pure-state branch of Theorem 23c,
$$
h=g_{FS}.
\tag{23c.6}
$$

*Proof.* The $C^2$ hypothesis, finite-dimensional carrier, and retained support convention make the SLDs in (23c.2) well defined on each constant-rank support stratum. The Braunstein–Caves information inequality (Braunstein & Caves 1994) applies to every POVM on such a finite-dimensional differentiable state family and gives
$$
F^{(E)}\preceq F^Q,
$$
proving item 1. Rao's Cramér–Rao inequality (Rao 1945) applies because item 2 assumes a regular locally unbiased estimator based on $n$ independent repetitions, differentiable outcome probabilities on their positive-probability support, and a nonsingular Fisher matrix on the identifiable subspace. Fisher information adds under independent repetitions, so the sample information is $nF^{(E)}$ and
$$
\operatorname{Cov}_\theta(\hat\theta)
\succeq(nF^{(E)})^{-1}
=\frac1n(F^{(E)})^{-1}.
$$
On a singular chart the same calculation is restricted to the identifiable image, equivalently to the quotient by the kernel.

For $L_v=v^aL_a$,
$$
F^Q(v,v)=\operatorname{tr}(\rho L_v^2)\ge0.
$$
In finite dimension this vanishes exactly when $L_v$ vanishes on the support of $\rho$, which by the SLD equation is equivalent on the retained support stratum to $\partial_v\rho=0$. Conversely, $\partial_v\rho=0$ permits $L_v=0$. Since $\partial_vp_i=\operatorname{tr}((\partial_v\rho)E_i)$, protocol completeness makes this equivalent to vanishing first variation of every retained Born probability. Thus the kernel is exactly the PPI response-null tangent space, proving item 3. Theorem 23c gives $F^Q(v,v)=4g_{FS}(v,v)$ on every pure-state tangent. Polarization then gives $h=g_{FS}$. ∎


**7.2 MPU State Representation: Perspectival State and Hilbert Space**

We now detail the necessary mathematical structure for representing the state of an MPU.

**7.2.1 Theorem 23 (Conditional Hilbert-Space Dimension Bound)**

Assume the full-context realization hypotheses of Theorem 15, so the retained state has eight response classes, and assume the Hilbert branch represents them as mutually perfectly distinguishable states. Then
$$
d_0\ge N_{\mathrm{vis}}=8.
\quad \text{(41)}
$$

*Proof.* Let the eight states be $\rho_1,\ldots,\rho_8$. Perfect distinguishability supplies effects $E_1,\ldots,E_8$ such that
$$
0\le E_j\le I,
\qquad
\sum_{j=1}^8E_j\le I,
\qquad
\operatorname{tr}(\rho_iE_j)=\delta_{ij}.
$$
Write $S_i=\operatorname{supp}\rho_i$. From
$$
\operatorname{tr}\bigl(\rho_i(I-E_i)\bigr)=0
$$
and positivity of both factors, $I-E_i$ vanishes on $S_i$, so $E_i x=x$ for $x\in S_i$. For $j\ne i$, $\operatorname{tr}(\rho_jE_i)=0$ similarly implies $E_i y=0$ for $y\in S_j$. Therefore, for $x\in S_i$ and $y\in S_j$,
$$
\langle x,y\rangle
=\langle E_ix,y\rangle
=\langle x,E_iy\rangle
=0.
$$
Thus the eight nonzero supports are mutually orthogonal, and
$$
d_0=\dim\mathcal H_0
\ge\sum_{i=1}^8\dim S_i
\ge8.
$$
If the separate active-dimension PCE theorem is assumed and its no-additional-benefit and increasing-cost hypotheses hold, its saturating representative has $d_0=8$. The distinguishability argument alone proves only the lower bound. ∎

**7.2.2 Proposition 4 (Complex Hilbert Representation on the $C^*$-Algebra Branch)**

Assume the retained operational questions form a unital complex $C^*$-algebra $\mathcal A$ and the operational statistics define a positive normalized linear functional $\omega:\mathcal A\to\mathbb C$. Then there are a complex Hilbert space $\mathcal H_\omega$, a unital *-representation $\pi_\omega:\mathcal A\to\mathcal B(\mathcal H_\omega)$, and a cyclic unit vector $\Omega_\omega$ such that
$$
\omega(A)=\langle\Omega_\omega,\pi_\omega(A)\Omega_\omega\rangle.
$$
If $\pi_\omega(\mathcal A)$ contains eight nonzero mutually orthogonal projections $Q_1,\ldots,Q_8$ representing the support subspaces of the eight Theorem-23 context states, then $\dim\mathcal H_\omega\ge8$. A sufficient condition is that the generated algebra contain a specified copy of $M_8(\mathbb C)$ with nonzero mutually orthogonal minimal projections $q_1,\ldots,q_8$, that $Q_i=\pi_\omega(q_i)$, and that $\omega$ be faithful on this copy.
*Proof.* Define
$$
\mathcal N_\omega:=\{A\in\mathcal A:\omega(A^*A)=0\}.
$$
Positivity gives the Cauchy-Schwarz inequality
$$
|\omega(A^*B)|^2\le\omega(A^*A)\omega(B^*B),
$$
so
$$
\langle[A],[B]\rangle:=\omega(A^*B)
$$
is a well-defined inner product on $\mathcal A/\mathcal N_\omega$. Complete this pre-Hilbert space to $\mathcal H_\omega$. Left multiplication defines
$$
\pi_\omega(C)[A]=[CA].
$$
The $C^*$ inequality gives
$$
\|[CA]\|^2
=\omega(A^*C^*CA)
\le\|C\|^2\omega(A^*A),
$$
so $\pi_\omega(C)$ extends boundedly and $\pi_\omega$ is a *-representation. With $\Omega_\omega=[1]$,
$$
\langle\Omega_\omega,\pi_\omega(A)\Omega_\omega\rangle
=\omega(A),
$$
and $\pi_\omega(\mathcal A)\Omega_\omega$ is dense by construction. Under the additional same-representation support hypothesis in the proposition, the eight nonzero response supports are mutually orthogonal in $\mathcal H_\omega$, so $\dim\mathcal H_\omega\ge8$. ∎

**7.2.3 Definition 24 (Def 24): Perspectival State $S_{(s)}(t)$**
The complete operational quantum state of an MPU at time $t$ is the perspectival state
$$
S_{(s)}(t)=(\rho(t),s),
$$
where $\rho(t)$ is a density operator on $\mathcal H_0$ and $s\in\Sigma$ is the perspective index. A pure-state branch is the special case $\rho(t)=|\psi(t)\rangle\langle\psi(t)|$. This typing includes reduced states and general quantum instruments without assigning a state vector to a mixed subsystem. Interaction outcomes under Definition 27 are indexed by the registered context $s$ and updated by the instrument formalism of Appendix M.
When $\rho=|\psi\rangle\langle\psi|$, the notation $(|\psi\rangle,s)$ is permitted only as shorthand for $(|\psi\rangle\langle\psi|,s)$; it does not change the general density-operator type.

**7.2.4 Theorem 24 (Nondegenerate Projective Contexts and Basis Rays)**

On the Born/Hilbert branch, a labeled complete rank-one projective measurement on $\mathcal H_0$ corresponds bijectively to an ordered orthonormal basis modulo an independent phase for each basis vector.

*Proof.* A labeled rank-one projective measurement is a family $\{P_i\}_{i=1}^{d_0}$ satisfying
$$
P_iP_j=\delta_{ij}P_i,
\qquad
\sum_{i=1}^{d_0}P_i=I,
\qquad
\operatorname{rank}P_i=1.
$$
For each $i$, choose a unit vector $|i\rangle$ spanning $\operatorname{ran}P_i$. Orthogonality of the projectors gives $\langle i|j\rangle=0$ for $i\ne j$, and completeness makes the vectors an ONB. Replacing $|i\rangle$ by $e^{i\theta_i}|i\rangle$ leaves $P_i=|i\rangle\langle i|$ unchanged, and these are the only choices of a unit vector spanning the same rank-one range. Conversely, every ordered ONB defines the labeled projectors $P_i=|i\rangle\langle i|$, with Born probabilities $\operatorname{tr}(\rho P_i)$. Higher-rank projective contexts correspond to orthogonal decompositions into subspaces rather than to ONBs. ∎

**7.2.5 Theorem 25 (Structure of Perspective Space $\Sigma$)**

Let perspectives be identified with ordered ONBs modulo per-vector phases. Then the space of distinct perspectives $\Sigma$ is isomorphic to the complex homogeneous space
$$
\Sigma \;\cong\; U(d_0)\, /\, U(1)^{d_0}.
$$
*Proof:* Any ordered ONB $\{ |i′\rangle \}$ is related to a reference ONB $\{ |i\rangle \}$ by $U \in U(d_0)$, $|i′\rangle = U|i\rangle$. Multiplying each $|i′\rangle$ by $e^{i\theta_i}$ leaves Born probabilities invariant; these phase changes form the maximal torus $T \cong U(1)^{d_0}$. Distinct perspectives are cosets in $U(d_0)/T$. □

*Remark:* If outcome labels are physically irrelevant, one may further quotient by the permutation group $S_{d_0}$, giving $U(d_0)/(U(1)^{d_0} \rtimes S_{d_0})$. Here we fix ordered ONBs to retain outcome labels inherent in control and recursion roles.

**7.2.6 Definition 25 (Def 25): Perspective Space $\Sigma$ and Metric**

Let $T=U(1)^{d_0}$ and identify $\Sigma=U(d_0)/T$. Equip $U(d_0)$ with the bi-invariant Riemannian metric induced by the Frobenius inner product. Its geodesic distance is
$$
d_U(A,B)
:=\frac1{\sqrt2}
\min\{\|X\|_F:X^\dagger=-X,\ e^X=A^\dagger B\}.
$$
For perspectives $s_j=[U_j]$, define the quotient distance
$$
d_\Sigma(s_1,s_2)
:=\inf_{D_1,D_2\in T}d_U(U_1D_1,U_2D_2).
\quad \text{(42)}
$$
Because the right action of the compact torus $T$ is isometric, this is the geodesic distance of the quotient Riemannian metric and is independent of the representatives. The minimization over all skew-Hermitian logarithms makes the definition global, including matrices with eigenvalue $-1$.

**7.2.7 Corollary 26 (Perspective Space on the Ordered Rank-One Context Branch)**

If perspectives are defined to be labeled complete rank-one projective contexts on $\mathcal H_0$, then
$$
\Sigma\cong U(d_0)/U(1)^{d_0}.
$$

*Proof.* Theorem 24 identifies each such context with an ordered ONB modulo an independent phase on each vector. The unitary group acts transitively on ordered ONBs. The stabilizer of the reference basis rays is the diagonal torus $U(1)^{d_0}$. The orbit-stabilizer description of this transitive action therefore gives the quotient. SPAP and the Born rule do not by themselves require this particular context class. ∎

**7.3 MPU Dual Dynamics Driven by POP**

The operational cycle of an MPU, driven by the nominated POP objective, has two declared dynamical modes acting on the Perspectival State $S_{(s)}(t)=(\rho(t),s)$.

**7.3.1 Theorem 27 (Diagonal Limitation on Universal MPU Outcome Prediction)**

Assume the MPU realization class has the effective coding, self-reference closure, and predicate-realization hypotheses of Theorem 10a. Then no total predictor can correctly predict every binary `Evolve` outcome throughout that diagonal-closed class.

*Proof.* Let $P$ be any total binary predictor proposed for all encoded `Evolve` systems in the class. Theorem 10a supplies a diagonal system $S_P$ in the same class whose output obeys
$$
O(S_P)=1-P(\langle S_P\rangle).
$$
Therefore
$$
O(S_P)\ne P(\langle S_P\rangle),
$$
so $P$ fails on at least that system. Since $P$ was arbitrary, no total predictor is correct on the whole class. This conclusion does not assert that each individual `Evolve` event is stochastic or that no restricted deterministic predictor succeeds on a proper subclass. ∎

**7.3.2 Proposition 28 (Stochastic Transition-Kernel Hypothesis on the PPI Quotient)**

Let $X_{\mathrm{ret}}$ be the retained finite-response state space and let $\mathcal O$ be a finite outcome set. Assume as branch data that the effective `Evolve` law is stochastic and countably additive on $\mathcal O$, depends measurably on $x\in X_{\mathrm{ret}}$, and has no retained deterministic refinement. Then it is represented by a Markov kernel
$$
K:\,X_{\mathrm{ret}}\times2^{\mathcal O}\to[0,1].
$$
Equivalently, for singleton outcomes,
$$
K(o\mid x)\ge0,
\qquad
\sum_{o\in\mathcal O}K(o\mid x)=1.
$$

*Proof.* For each $x$, countable additivity and normalization make $A\mapsto K(x,A)$ a probability measure on the finite set $\mathcal O$. Measurable dependence on $x$ gives the defining measurability condition of a Markov kernel. The no-refinement hypothesis states the intended intrinsic interpretation. Theorem 27 supplies only the absence of a universally correct total predictor on a diagonal-closed class; it does not derive these stochastic assumptions. ∎

**7.3.3 Dual Dynamics Overview**

Each basic unit changes in two ways. Between interactions it develops its current prediction without recording an outcome. During an interaction it can register an outcome, check the prediction, and update its state.

**Technical ledger.**

The declared MPU cycle has two modes acting on $S_{(s)}(t)=(\rho(t),s)$:

**7.3.3.1 Definition 26 (Def 26): Internal Prediction Evolution**

Between `Evolve` interactions, the quantum component undergoes reset-free unitary transport
$$
\rho(t_1)=U(t_1,t_0)\rho(t_0)U(t_1,t_0)^\dagger.
\tag{43a}
$$
This mode performs no verification, outcome actualization, or response-relevant irreversible merge. On the continuous time-translation-symmetric Hilbert branch of Theorem 8.7, $U$ is a strongly continuous unitary propagator. For a differentiable pure-state shorthand $\rho(t)=|\psi(t)\rangle\langle\psi(t)|$, a representative vector obeys
$$
i\hbar\frac{d}{dt}|\psi(t)\rangle=\hat H(t)|\psi(t)\rangle.
\tag{43}
$$
Here $\hat H(t)$ is self-adjoint and is defined up to the usual scalar phase gauge on the density-operator dynamics. Its interpretation as a physical baseline-energy generator additionally requires Theorem 29's clock and power calibration.

**7.3.3.2 Theorem 29 (Generator and Conditional Energy Calibration)**

Let the internal evolution be generated by a self-adjoint Hamiltonian $\hat H$ bounded below by $E_0$, and let $\rho$ be a density operator satisfying
$$
\operatorname{Tr}\!\left(\rho(\hat H-E_0I)\right)<\infty.
$$
Then
$$
\langle\hat H-E_0\rangle_\rho
:=
\operatorname{Tr}\!\left(\rho(\hat H-E_0I)\right)
$$
is a finite nonnegative mean excitation energy. To relate it to the baseline power $R(C_{op})$, assume a registered cycle rate $\nu>0$ and the calibration
$$
R(C_{op})=\nu\langle\hat H-E_0\rangle_\rho.
$$
Equivalently, for cycle duration $\tau=1/\nu$, the calibrated energy per cycle is $R(C_{op})\tau$.

*Proof.* The spectral lower bound $\hat H\ge E_0I$ gives $\hat H-E_0I\ge0$. Positivity of $\rho$ therefore gives
$$
\operatorname{Tr}\!\left(\rho(\hat H-E_0I)\right)\ge0,
$$
and the stated trace-domain hypothesis makes it finite. The registered calibration gives the power identity. Multiplication by $\tau=1/\nu$ yields
$$
R(C_{op})\tau
=
\nu\langle\hat H-E_0\rangle_\rho\frac1\nu
=
\langle\hat H-E_0\rangle_\rho.
$$
∎

For a specified orthogonalization task with positive mean excitation, Corollary 29.1 gives a characteristic time. No state-independent positive duration for every distinguishable transition, stochastic update, edge traversal, or channel use follows from finite Hilbert dimension or a bounded spectrum alone.

**Corollary 29.1 (Margolus–Levitin Recovery on the Unitary Internal Branch).** For internal prediction dynamics
$$
i\hbar\,\partial_t |\psi\rangle = \hat H |\psi\rangle,
$$
with time-independent Hamiltonian bounded below by $E_0$, any transition between orthogonal prediction states obeys the standard quantum speed limit
$$
t_\perp \ge \frac{\pi\hbar}{2\langle \hat H - E_0\rangle}.
$$
Within PU, this is the ordinary unitary-branch orthogonalization limit. Any irreversible-cycle action inequality such as $\Delta\mathcal S_i\ge\hbar\ln2$ requires a separately stated action-cost bridge and its hypotheses; it is not implied by the Margolus–Levitin theorem or by the registered-reset entropy bound.

*Proof.* Assume $|\psi(0)\rangle$ is normalized, $\hat H$ is time independent and bounded below by $E_0$, and
$$
\bar E:=\langle\psi(0)|(\hat H-E_0)|\psi(0)\rangle>0.
$$
The Margolus-Levitin orthogonalization theorem (Margolus and Levitin, 1998) applies to the unitary orbit $e^{-i\hat Ht/\hbar}|\psi(0)\rangle$ and gives
$$
t_\perp\ge\frac{\pi\hbar}{2\bar E}
$$
for the first time at which the evolved state is orthogonal to the initial state. These hypotheses concern that orthogonalization task and do not imply a positive duration for arbitrary stochastic updates or nonorthogonal transitions. ∎

**7.3.3.3 Definition 27 (Def 27): Registered Interaction/Update Instrument Branch ('Evolve'/ND-RID)**

Upon an interaction $N(t)$ satisfying the branch's arming predicate, the nominated `Evolve` law applies. On a branch carrying $\mathfrak C_{\mathrm{act}}$, arming means that the retained link ledger reaches its certified threshold; otherwise arming remains explicit branch data. A normalized instrument $\{\mathcal I_i^N\}$ and a conditional perspective kernel determine
$$
(\rho_i',s')
\sim
\operatorname{Evolve}\big((\rho,s),N,\Delta t\big),
\qquad
\rho_i'=\frac{\mathcal I_i^N(\rho)}
{\operatorname{tr}\mathcal I_i^N(\rho)}
\tag{44}
$$
for outcomes with nonzero probability.

1. **Registered instrument update:** $p_i=\operatorname{tr}\mathcal I_i^N(\rho)$ and $\sum_i\mathcal I_i^N$ is trace preserving. Only the nondegenerate sharp repeatability branch gives $\rho_i'=|i\rangle_s\langle i|_s$.
2. **Conditional perspective shift:** given $i$, $s'$ is drawn from the normalized kernel $G_{\mathrm{persp}}(s'|s,i,N,\Delta t)$. Its drift data are either interaction-model data (Appendix M.3.3.1) or derived on the interrogative-efficiency branch (Appendix M.3.3.2).

The post-event state is therefore $(\rho_i',s')$, with $(|i\rangle_s,s')$ permitted only as the pure-state shorthand of Definition 24. Theorem 27 does not derive eventwise stochasticity, and Theorem 28a does not derive the physical instrument or single-run selector. A physical reset cost follows only under Definition 28 and Theorem 31; $\varepsilon_0=\ln2$ alone is not a heat bound.

**7.3.4 Theorem 28a (Conditional Born-Rule Representation on the Hilbert Branch).**

Let $\omega:[0,I]\to[0,1]$ be defined on every effect of a finite-dimensional complex Hilbert space, with $\omega(I)=1$, and suppose it is noncontextual and satisfies
$$
\sum_i\omega(E_i)=1
$$
for every finite POVM $\{E_i\}$ with $\sum_iE_i=I$. Then there is a unique density operator $\rho$ such that
$$
\omega(E)=\operatorname{tr}(\rho E)
$$
for every effect $E$. For a certified pure state $\rho=|\psi\rangle\langle\psi|$ and retained rank-one outcome $E_i=|i\rangle\langle i|$, one has $\omega(E_i)=|\langle i|\psi\rangle|^2$.

*Proof.* Theorem 8.2 supplies the noncontextual quotient only on its stated PPI/PCE branch. Finite additivity on arbitrary POVM effects is an explicit hypothesis of the present theorem, stronger than Lemma 8.2a's orthogonal-refinement conclusion. Under that effect-level affine/additive hypothesis, the Busch selector represents the functional by a unique positive trace-one operator $\rho$, giving the trace formula. Substitution of $\rho=|\psi\rangle\langle\psi|$ and $E_i=|i\rangle\langle i|$ gives
$$
\operatorname{tr}(\rho E_i)
=\operatorname{tr}(|\psi\rangle\langle\psi|i\rangle\langle i|)
=\langle i|\psi\rangle\langle\psi|i\rangle
=|\langle i|\psi\rangle|^2.
$$
SPAP can motivate the search for a nonclassical probabilistic representation, but it does not establish the Hilbert, noncontextuality, or additivity hypotheses used here. ∎

**7.4 Conditional Thermodynamic Ledger for an 'Evolve' Implementation**

The thermodynamic ledger of an 'Evolve' implementation depends on its physical operations. On a branch satisfying Definition 28, a registered reset obeys $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)$, and a positive uniform floor additionally requires $H_q(P\mid R)\ge h_{\min}>0$. Neither $C_P\ge K_0$ nor the structural alphabet value $\varepsilon_0=\ln2$ activates a reset or proves irreversibility. The relation $C_{op}\ge K_0$ is available only under the realization and complexity-capacity bridge hypotheses of Corollary 3.

**7.4.1 Theorem 30 (Physical State Change from a Retained Distinguishable Record)**

Suppose an `Evolve` event writes a nontrivial retained finite-response record: there is an admitted finite protocol whose response distinguishes the pre-event record class $x$ from the post-event record class $x'$. Then every faithful physical implementation undergoes a transition from a representative $\sigma_x$ to a physically distinguishable representative $\sigma_{x'}$. This conclusion supplies no positive lower bound on the transition duration.

*Proof.* PPI identifies two physical configurations only when every admitted finite protocol has the same response on them. By hypothesis, one admitted protocol distinguishes $x$ and $x'$. Hence their faithful physical representatives cannot lie in the same PPI equivalence class, so $\sigma_{x'}\ne\sigma_x$ in the retained physical state space. An implementation that writes the record therefore changes physical state. The argument uses retained distinguishability; SPAP alone does not require every acquired datum to alter a particular internal variable. ∎

**7.4.2 Proposition 5 (Structural Binary Register and Reset Alternative)**

Let a reusable cycle act on a reachable logical domain containing a binary prediction record $P$. At closure, either the cycle map is injective on that domain or it is not. In the injective case, any label displaced from $P$ remains recoverable from the post-cycle state and may be included in retained side information $R$. In the noninjective case, at least two reachable logical inputs have the same post-cycle state, so the operation merges or overwrites a logical distinction. The alphabet log-cardinality is
$$
\varepsilon_0:=\ln2,
$$
but no ensemble-independent average-heat lower bound follows.

*Proof.* The injective/noninjective alternatives exhaust all maps on the reachable domain. If the map is injective, its inverse on its image recovers the full input, including the displaced binary label, from the retained output. If it is noninjective, there are $x\ne y$ with the same output, so their distinction is erased from the retained state. The number $\ln2$ is the logarithm of the record alphabet size. Average reset heat depends on the actual conditional distribution $q(P\mid R)$ and therefore is not determined by alphabet size alone. ∎

**7.4.3 Definition 28 (Structural and Registered Reset Ledgers)**

Let $P\in\{0,1\}$ be a classical pre-reset record, let $R$ contain every classical record retained and unchanged through the reset, and let $q(P,R)$ be their actual joint law. On a branch with a degenerate register Hamiltonian, a bath at temperature $T$, cyclic control, and an isothermal reset returning the register and controller to their initial Hamiltonians, define
$$
\varepsilon_0:=\ln2,
\qquad
\varepsilon_{\mathrm{reset}}:=\frac{\langle Q_{\mathrm{bath}}\rangle}{k_BT},
\qquad
\varepsilon_{\mathrm{diss}}:=\varepsilon_{\mathrm{reset}}-H_q(P\mid R).
$$
Conditional Landauer gives $\varepsilon_{\mathrm{diss}}\ge0$. If no physical reset is registered, $\varepsilon_{\mathrm{reset}}$ is not assigned merely from the alphabet size.

**7.4.4 Theorem 31 (Conditional Physical Reset Bound)**

Under Definition 28,
$$
\varepsilon_{\mathrm{reset}}
=H_q(P\mid R)+\varepsilon_{\mathrm{diss}}
\ge H_q(P\mid R),
\qquad
\varepsilon_{\mathrm{diss}}\ge0.
\tag{45}
$$
Because $P$ is binary, $0\le H_q(P\mid R)\le\ln2$. If $H_q(P\mid R)=\ln2$, then $\varepsilon_{\mathrm{reset}}\ge\ln2$, with equality exactly when $\varepsilon_{\mathrm{diss}}=0$. The numerical equality $\varepsilon_{\mathrm{reset}}=\ln2$ alone does not imply either maximal conditional entropy or thermodynamic saturation.

*Proof.* Definition 28 gives $\varepsilon_{\mathrm{diss}}=\varepsilon_{\mathrm{reset}}-H_q(P\mid R)$, and conditional Landauer gives $\varepsilon_{\mathrm{diss}}\ge0$, proving (45). A classical binary conditional entropy lies in $[0,\ln2]$. When it equals $\ln2$, Equation (45) reads $\varepsilon_{\mathrm{reset}}=\ln2+\varepsilon_{\mathrm{diss}}$, so equality with $\ln2$ is equivalent to zero excess dissipation. Conversely, $\varepsilon_{\mathrm{reset}}=\ln2$ is compatible with any smaller conditional entropy when $\varepsilon_{\mathrm{diss}}=\ln2-H_q(P\mid R)>0$. ∎

**Theorem 31a (Conditionally Exchange-Invariant Full-Context Reset Bound).** Let $\mathcal G$ be Equation (7.1.3a), let $\Phi$ be the Commit Snapshot label merged by Equation (7.1.3b), and let $R$ contain every record retained and unchanged through closure. Assume the actual pre-closure joint law obeys $q(\phi\mid R=r)=q(1-\phi\mid R=r)$ for every $r$ of positive probability, equivalently invariance under the input-fibre exchange, and assume no retained record resolves $\Phi$. Then
$$
q(\phi\mid R)=\frac12,
\qquad
H_{\mathrm{Sh}}(\Phi\mid R)=\ln2.
$$
If Definition 28 also holds,
$$
\varepsilon_{\mathrm{reset}}
=
\frac{\langle Q_{\mathrm{bath}}\rangle}{k_BT}
\ge\ln2.
\tag{45a}
$$

*Proof.* For fixed $R=r$, put $x=q(0\mid r)$. Invariance gives $x=q(1\mid r)=1-x$, hence $x=1/2$. Averaging the conditional binary entropies gives $\ln2$. Equation (7.1.3b) merges the two values at fixed retained data, so Theorem 31 gives (45a). ∎

**7.4.5 Theorem 32 (Registered Reset Bound for `Evolve`)**

An `Evolve` implementation satisfying Definition 28 obeys
$$
\frac{\langle Q_{\mathrm{bath}}\rangle}{k_BT}\ge H_q(P\mid R).
\tag{46}
$$
Normalization of the quantum instrument determines outcome probabilities and poststates, not heat. Information-acquisition or feedback terms may be added only under a separately stated thermodynamic theorem and a no-double-counting certificate.

*Proof.* Definition 28 identifies $\varepsilon_{\mathrm{reset}}=\langle Q_{\mathrm{bath}}\rangle/(k_BT)$. Substitution into Theorem 31 gives Equation (46). A trace-preserving instrument supplies a Kraus normalization identity containing no bath temperature, Hamiltonian, work, or heat variable, so normalization alone supplies no additional thermodynamic term. ∎

**7.4.6 Theorem 33 (Conditional Reflexivity Trade-Off)**

If a registered branch satisfies $\Delta I\ge\Delta I_{\min}>0$ and $H_q(P\mid R)\ge h_{\min}>0$, then
$$
\Delta I\,\varepsilon_{\mathrm{reset}}
\ge\Delta I_{\min}h_{\min}
=:\kappa_r>0.
\tag{48}
$$
Without a registered reset and a positive distribution-sensitive entropy bound, no universal positive $\kappa_r$ follows.

*Proof.* Theorem 31 and the entropy hypothesis give $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)\ge h_{\min}>0$. All factors are nonnegative, so multiplication by $\Delta I\ge\Delta I_{\min}>0$ gives the displayed inequality. If either positive lower bound is absent, the same multiplication yields no positive constant. ∎

**7.4.7 Baseline Operational Costs vs. Interaction Costs**

Baseline resources sustain the internal predictive dynamics but do not by themselves imply a reset cost. For a cycle containing registered resets $(P_j,R_j,q_j)$, $j=1,\ldots,n_{\mathrm{reset}}$, the reset contribution obeys
$$
P_{\mathrm{reset}}
\ge
\frac{k_BT}{\tau_{\mathrm{cycle}}}
\sum_{j=1}^{n_{\mathrm{reset}}}H_{q_j}(P_j\mid R_j).
$$
The specialization $P_{\mathrm{reset}}\ge n_{\mathrm{reset}}k_BT\ln2/\tau_{\mathrm{cycle}}$ requires every reset record to be conditionally unbiased. Baseline and reset powers may be added only when their ledgers are disjoint.


## 7.5 The Entropy Unification Principle

### 7.5.1 The Central Result

The registered reachable binary quotient has structural log-cardinality $\varepsilon_0=\ln2$ (Definition 28; Definition J.1; Theorem J.1). A physical heat ledger arises only on a branch satisfying Definition 28, where Theorem 31 gives $\varepsilon_{\mathrm{reset}}=H_q(P\mid R)+\varepsilon_{\mathrm{diss}}\ge H_q(P\mid R)$ with $\varepsilon_{\mathrm{diss}}\ge0$. A positive uniform physical floor requires an independent ensemble bound. Structural log-cardinality, ensemble entropy, bath heat, channel capacity, and horizon entropy remain distinct quantities.

**Theorem 7.5.1 (Conditional Structural-to-Horizon Chain).** *Assume a reachable binary record, a completed tensor-factor reset, the density certificate of Theorem E.3, and the capacity-achieving, entropy-saturating, additive-ledger hypotheses of Theorem E.6. Then:*

$$
\boxed{
\varepsilon_0=\ln2
\xrightarrow{\text{completed reset; Prop E.2a}}
C_{\max}\le\ln d_0-\ln2
\xrightarrow{\text{density certificate}}
N_{eff}=\sigma_{link}\mathcal A+o(\mathcal A)
\xrightarrow{\text{E.6 saturation}}
\frac{S_{\mathrm{rel}}}{k_B}
=\frac{c^3\mathcal A}{4G_{\mathrm{op}}\hbar}+o(\mathcal A)
}
$$

If a separate horizon-entropy identification gives $S_{\mathrm{rel}}=S_{BH}+o(\mathcal A)$ and an external calibration gives $G_{\mathrm{op}}=G$, this reproduces the leading Bekenstein--Hawking law. The local KMS/Clausius theorem stack beginning with Theorem 48a is a separate equation-of-state branch; it proves neither identification.

The first arrow uses reset-support hypotheses rather than heat. The final operational equality uses all three saturation entries and retains its $o(\mathcal A)$ remainder. The measured-$G$ horizon statement requires the two separate calibrations stated in the theorem. On the separate refresh/minorization branch, Lemma E.1 and Theorem E.2 give $f_{RID}<1$ and $C_{\max}<\ln d_0$.

*Proof.* The registered binary quotient gives $\varepsilon_0=\ln2$. Proposition E.2a gives the capacity upper bound under the completed tensor-factor reset hypothesis. Theorem E.3 supplies the effective-channel asymptotics. Theorem E.6 turns their entropy upper bound into
$$
\frac{S_{\mathrm{rel}}}{k_B}
=\frac{c^3\mathcal A}{4G_{\mathrm{op}}\hbar}+o(\mathcal A)
$$
only under capacity achievement, entropy saturation, and additive accounting. The two additional calibrations then give the leading horizon form, still with its asymptotic remainder. Independently, Lemma E.1 and Theorem E.2 prove the refresh/minorization statement. ∎

---

### 7.5.2 The Derivation Chain

#### Stage 1: Structural Binary Register ($\varepsilon_0=\ln2$)

On the declared minimal architecture, the verification/reset-support alphabet has two labels, so its structural log-cardinality is
$$
\varepsilon_0=\ln2.
$$
SPAP alone does not prove that all four logical pairs are reachable or that a binary record is physically erased. Definition J.1 and Lemma J.1 state the additional reachable-domain and fixed-ready-state hypotheses.

#### Stage 2: Conditional Physical Reset Ledger

For an actual classical reset with joint law $q(P,R)$ and all retained side information included in $R$, Theorem J.1 gives
$$
\frac{\langle Q_{\mathrm{bath}}\rangle}{k_BT}
=H_q(P\mid R)+\varepsilon_{\mathrm{diss}},
\qquad \varepsilon_{\mathrm{diss}}\ge0.
$$
The bath heat reaches $k_BT\ln2$ only for a conditionally uniform binary record at zero excess dissipation. The total entropy production is $k_B\varepsilon_{\mathrm{diss}}$, not the bath entropy export. PPI does not replace the implementation and ensemble hypotheses of Landauer's theorem.

#### Stage 3: Information-Theoretic Entropy (Reset Support → Capacity Deficit)

The fixed-support capacity statement is independent of the physical heat ledger. On a branch registering a completed reset of a factor $\mathcal H_R$ to a fixed ready state, one support factor is absent from the completed output ledger.

On the joint Theorem-15/Theorem-23 branch with the same-class comparator of Theorem Z.2, $d_0=8$ and the ideal input-support log-cardinality is $\ln d_0=3\ln2$. This equality is not supplied by SPAP alone.

**Imported result (Proposition E.2a, Reset-Support Capacity Deficit).** Let
$$
\mathcal H_{d_0}=\mathcal H_K\otimes\mathcal H_R,
\qquad
\dim\mathcal H_R=r,
$$
and let a registered completed reset return $\mathcal H_R$ to a fixed ready state. Every output of the completed channel then lies in a support of dimension at most $d_0/r$, so
$$
C(\mathcal E_N)\le \ln d_0-\ln r.
$$
For a binary registered reset, $r=2$.
$$
C(\mathcal E_N)\le \ln d_0-\ln2.
$$
On the minimal branch $d_0=8$ this gives
$$
C(\mathcal E_N)\le 2\ln2.
$$

On the refresh/minorization branch, the averaged ND-RID channel contains a nonzero input-independent full-state refresh component,
$$
\mathcal{E}_N=(1-p)\Psi+pT_\sigma,
\qquad p>0,
$$
so Lemma E.1 gives $f_{\text{RID}}=1-p<1$. The flagged erasure-mixture argument of Theorem E.2 then yields
$$
C(\mathcal{E}_N)\le (1-p)\ln d_0 < \ln d_0.
$$
This strict contraction branch is compatible with, but logically separate from, the reset-support bound.

**Connection:** $\text{completed binary reset-support certificate}\xrightarrow{\text{Prop E.2a}} C_{\max}\le \ln d_0-\ln2$, with the additional refresh branch $\mathcal E_N=(1-p)\Psi+pT_\sigma \xrightarrow{\text{Lemma E.1}} f_{RID}<1 \xrightarrow{\text{Thm E.2}} C_{\max}<\ln d_0$.

#### Stage 4: Landauer Pointer and Active Kernel Dimension

The minimal verification architecture carries a two-label structural record. Its Hilbert realization is a separate representation statement; its registered reset heat remains distribution-sensitive under Theorem J.1. The MPU Hilbert space decomposes by the active verification record and its orthogonal complement:
$$
\mathcal{H}_0=\mathcal{H}_a\oplus\mathcal{H}_b.
$$
Here $\mathcal{H}_a$ is the active kernel carrying the sharp match/mismatch verification record, and $\mathcal{H}_b$ is the inactive complement relative to that minimal verification act.

The active kernel is not the rank of an arbitrary yes/no effect. A yes/no test is represented by an effect, and in the sharp repeatable case by a projector, together with its complement. The SPAP verification record itself has two internally sharp record states:
$$
E=0
\qquad
\text{and}
\qquad
E=1,
$$
where $E=A\oplus P$ records match versus mismatch of actuality and stored prediction. Both values must be possible in a faithful predictive cycle; otherwise the loop is hard-coded to succeed or fail and no nontrivial verification occurs.

In the Hilbert carrier, two sharp record alternatives require two orthogonal rays. Therefore the active verification carrier satisfies
$$
a=\dim_{\mathbb C}\mathcal{H}_a\ge2.
$$
The entropy capacity of an $a$-dimensional active register is $\ln a$. To represent the declared two-label structural quotient within the active kernel, admissibility also requires
$$
\ln a \ge \varepsilon_0.
$$
Since $\varepsilon_0=\ln2$ and $a$ is an integer, both the record-distinguishability requirement and the entropy-capacity requirement have the same unique minimal solution:
$$
a=2.
$$
A one-dimensional active sector cannot represent both record values. If alternatives present for $a>2$ are response-null, PPI quotients them. If they are response-active, selection of $a=2$ requires a registered comparison showing that they add no benefit for the declared task while active dimension carries a strictly increasing cost, or an equivalent strict PCE gap certificate. Without that hypothesis PCE need not demote the larger active sector. Extra dissipative overhead does not require a larger active kernel unless it changes a retained finite protocol response.

**Imported result (Theorem Z.1, Landauer Pointer).** The dimension $a$ of the active kernel satisfies
$$
a=2.
$$
With $d_0=8$ on the minimal Hilbert branch, the inactive complement has
$$
b=d_0-a=8-2=6,
$$
and the block decomposition is
$$
\mathcal{H}_0=\mathbb C^2\oplus\mathbb C^6.
$$


The PCE-Attractor density operator (Appendix Z, Section Z.2.5) takes the form:

$$\rho_0 = \frac{I_2}{2} \oplus 0_6 = \mathrm{diag}\left(\frac{1}{2}, \frac{1}{2}, 0, 0, 0, 0, 0, 0\right)$$

where $I_2/2$ is the maximally mixed state on the 2-dimensional active subspace and $0_6$ represents the zero operator on the 6-dimensional inactive complement ($b = d_0 - a = 6$). The von Neumann entropy restricted to the active subspace is:

$$
S(\rho_0)
=
-\operatorname{tr}(\rho_0\ln\rho_0)
=
\ln2
=
\varepsilon_0,
$$
which is a numerical state-counting identity for the specified maximally mixed active state. It does not identify structural log-cardinality with conditional entropy, bath heat, or total entropy production.

#### Stage 4a: Error Correction Structure (The Golay Realization)

The active kernel dimension $a = 2$ initiates the canonical chain:

$$
a=2\xrightarrow{b=d_0-a}b=6\xrightarrow{M=2ab}M=24
\xrightarrow{\text{predictive-recovery rate gate}}k=12
\xrightarrow{\text{accepted }\mathfrak C_{\mathrm{dist}}}\mathcal G_{24}=[24,12,8].
$$

On the predictive-recovery MacWilliams Golay branch of Theorem Z.13b—namely Definition Z.13b.0, Theorem Z.13b.0a, and the fixed-rate maximum-distance criterion—the endpoint is a binary linear $[24,12,8]$ code, unique up to coordinate permutation by Theorem U.1. The dual-asymmetry gate alone fixes only $k=12$; it proves neither distance-eight attainment nor Golay uniqueness.

**Remark (Conditional Error-Correction Interpretation).** On the predictive-recovery MacWilliams branch, the $[24,12,8]$ Golay code is a classical redundancy ledger with rate $1/2$. The twelve parity coordinates support reconstruction only after a classical encoder, error model, syndrome map, and decoder have been specified.

This code rate is not another expression for the SPAP entropy $\varepsilon_0=\ln2$, and it does not show that half of all physical interface modes protect the other half. Entropy capacity, redundancy, and thermodynamic export are distinct quantities. A physical identification requires a response-active encoding/channel/recovery certificate and a non-double-counted resource ledger.



Channel capacity, code redundancy, and entropy are separate ledgers:

- **Channel-capacity view:** $C_{\max}$ bounds the reliable communication rate of a specified channel under its coding regime.
- **Error-correction view:** a classical $[n,k,d]$ code has redundancy $n-k$ coordinates and rate $k/n$; correction guarantees also require a specified channel and decoder.
- **Entropy view:** Shannon or von Neumann entropy is a functional of a registered probability distribution or state.

For the $[24,12,8]$ code, the redundancy is $12$ coordinates and the rate is $1/2$. Neither quantity follows from $\varepsilon_0=\ln2$. A physical relation among the ledgers requires a response-active encoder, channel, recovery map, reset protocol, and non-double-counted resource certificate.

#### Stage 5: Conditional Gravitational Entropy Calibration

Let the effective channel count satisfy
$$
N_{eff}=\sigma_{link}\mathcal A,
\qquad
\sigma_{link}=\frac{\chi}{\eta\delta^2}.
$$
If each channel has capacity at most $C_{\max}$ nats, then
$$
\frac{S_{boundary}}{k_B}
\le N_{eff}C_{\max}
=\sigma_{link}C_{\max}\mathcal A.
$$
Assume the capacity-achieving, entropy-saturating, additive-ledger branch of Theorem E.6. With $S_{\mathrm{boundary}}:=S_{\mathrm{rel}}$, Theorem E.6 defines the positive operational coefficient by
$$
\sigma_{\mathrm{link}}C_{\max}
=\frac{c^3}{4G_{\mathrm{op}}\hbar}
$$
and gives
$$
\frac{S_{\mathrm{boundary}}}{k_B}
=\frac{c^3\mathcal A}{4G_{\mathrm{op}}\hbar}+o(\mathcal A).
$$
If an independent horizon-entropy bridge identifies $S_{\mathrm{rel}}=S_{BH}+o(\mathcal A)$ and an external calibration sets $G_{\mathrm{op}}=G$, this becomes the leading Bekenstein--Hawking relation
$$
\frac{S_{BH}}{k_B}
=\frac{c^3\mathcal A}{4G\hbar}+o(\mathcal A).
$$
Using $\sigma_{\mathrm{link}}=\chi/(\eta\delta^2)$ gives
$$
G_{\mathrm{op}}
=\frac{\eta\delta^2c^3}{4\hbar\chi C_{\max}}.
\quad \text{(Equation E.9)}
$$
The dimensions agree:
$$
\left[\frac{\delta^2c^3}{\hbar}\right]
=L^3M^{-1}T^{-2}=[G_{\mathrm{op}}].
$$
Without the three saturation entries, channel counting supplies only the entropy upper bound. It supplies neither the horizon-entropy identification nor the calibration $G_{\mathrm{op}}=G$.

---

### 7.5.3 The Complete Derivation Chain

**Theorem 7.5.2 (Conditional Entropy and Horizon-Calibration Chain).** *Assume the following branch data: a reachable binary verification record, a completed reset to a ready state, the thermodynamic hypotheses of Definition 28, the tensor-factor reset hypotheses of Proposition E.2a, the geometric density certificate of Theorem E.3, the capacity-achieving, entropy-saturating, additive-ledger branch of Theorem E.6, an independent identification $S_{\mathrm{rel}}=S_{BH}+o(\mathcal A)$, and the external calibration $G_{\mathrm{op}}=G$. Then:*

| Step | Source | Statement | Role |
|:-----|:-------|:----------|:-----|
| 1 | Reachable-record hypothesis | The verification alphabet has two response-relevant labels | Structural input |
| 2 | Theorem J.1 | Its log-cardinality is $\varepsilon_0=\ln2$ | Structural register size |
| 3 | Conditional Landauer theorem | $\langle Q_{bath}\rangle/(k_BT)\ge H_q(P\mid R)$ | Distribution-sensitive heat bound |
| 4 | Proposition E.2a | The completed binary reset gives $C_{\max}\le\ln d_0-\ln2$ | Support-capacity deficit |
| 5 | Theorem E.3 | $N_{eff}=\sigma_{link}\mathcal A+o(\mathcal A)$ on the density-certificate branch | Channel counting |
| 6 | Theorem E.6 | $S_{\mathrm{rel}}/k_B=\sigma_{link}C_{\max}\mathcal A+o(\mathcal A)$ and $\sigma_{link}C_{\max}=c^3/(4G_{\mathrm{op}}\hbar)$ on its saturation branch | Operational area coefficient |
| 7 | Independent bridges | $S_{\mathrm{rel}}=S_{BH}+o(\mathcal A)$ and $G_{\mathrm{op}}=G$ | Horizon identification and measured coupling |

*Proof.* Steps 1–2 give the structural number $\ln2$ without assigning heat. Step 3 applies only to the registered ensemble and reset implementation. Step 4 is a separate support-rank statement, and Step 5 counts effective boundary channels. Step 6 is Theorem E.6 on its three-entry saturation branch. Applying the two independent bridges in Step 7 gives the leading Bekenstein--Hawking density and
$$
G
=G_{\mathrm{op}}
=\frac{\eta\delta^2c^3}{4\hbar\chi C_{\max}}.
$$
The local KMS/Clausius and Einstein-equation conclusions require the separate hypotheses of Theorems 48a and 12.1. ∎

---

### 7.5.4 The Operational Coefficient $1/(4L_{P,\mathrm{op}}^2)$

On the capacity-achieving, entropy-saturating, additive-ledger branch of Theorem E.6, define
$$
L_{P,\mathrm{op}}^2
:=\frac{G_{\mathrm{op}}\hbar}{c^3}.
$$
Then the dimensionless operational response-entropy density is
$$
\frac1{k_B}\frac{S_{\mathrm{rel}}}{\mathcal A}
=\frac1{4L_{P,\mathrm{op}}^2}
=\frac{c^3}{4G_{\mathrm{op}}\hbar}
=\sigma_{\mathrm{link}}C_{\max}
=\frac{\chi C_{\max}}{\eta\delta^2}
+o(1).
$$
After the independent bridges $S_{\mathrm{rel}}=S_{BH}+o(\mathcal A)$ and $G_{\mathrm{op}}=G$, one has $L_{P,\mathrm{op}}=L_P$ and recovers the leading Bekenstein--Hawking density. The reset-support and refresh bounds constrain $C_{\max}$ but do not establish saturation. A rate interpretation additionally requires a registered use frequency.

**Conditional MPU Spacing Calibration:** Assume the residual-capacity saturation branch
$$
C_{\max}^*=\ln d_0-\varepsilon_0,
$$
together with $d_0=8$, $\varepsilon_0=\ln2$, and the Appendix Q equilibrium values $\chi^*=\eta^*=1$. Then
$$
C_{\max}^*=\ln8-\ln2=2\ln2.
$$
From Equation E.9 and $L_{P,\mathrm{op}}^2=G_{\mathrm{op}}\hbar/c^3$,
$$
L_{P,\mathrm{op}}^2
=\frac{\eta^*\delta^2}{4\chi^*C_{\max}^*},
$$
so
$$
\frac{\delta}{L_{P,\mathrm{op}}}
=\sqrt{\frac{4\chi^*C_{\max}^*}{\eta^*}}
=\sqrt{8\ln2}
\approx2.35482.
\quad \text{(Equation Q.18)}
$$
The value is conditional on all listed saturation and equilibrium hypotheses. On the external calibration branch $G_{\mathrm{op}}=G$, one has $L_{P,\mathrm{op}}=L_P$. The capacity ratio $C_{\max}^*/\varepsilon_0=2$ may be used by Proposition T.60 only on its separately stated branch.

---

### 7.5.5 The Separated $\varepsilon$ Ledgers

The structural binary value and the physical reset ledger have distinct antecedents:

| Ledger | Statement |
|:-------|:----------|
| **Structural support** | A registered binary quotient has $\varepsilon_0=\ln2$ (Definition 28; Definition J.1; Theorem J.1); Lemma J.1 separately proves noninjectivity for the fixed-ready-state reset. |
| **Physical reset** | A separately registered reset obeys $\varepsilon_{\mathrm{reset}}=H_q(P\mid R)+\varepsilon_{\mathrm{diss}}\ge H_q(P\mid R)$; total entropy production is $k_B\varepsilon_{\mathrm{diss}}$ (Theorem 31) |
| **Active-kernel selection** | Theorem Z.1 fixes $a=2$ only with its sharp-record, entropy-capacity, and no-surplus hypotheses |

On the conjunction of the structural and active-kernel branches,
$$
\varepsilon_0=\ln2
\xrightarrow{\text{record/capacity/no-surplus gates}}
a=2\to M=24
\xrightarrow{\text{predictive-recovery rate gate}}k=12
\xrightarrow{\text{accepted }\mathfrak C_{\mathrm{dist}}}\mathcal G_{24}=[24,12,8].
$$
The physical reset inequality is a separate implementation statement. Neither it nor the Golay code follows from SPAP alone, and physical error correction requires a registered encoder, channel, syndrome instrument, decoder, and non-double-counted resource ledger.

**Corollary (Conditional Decoder-Failure Entropy).** On such a registered classical binary channel, the $[24,12,8]$ code uniquely corrects error patterns of Hamming weight at most $3$. Patterns outside that radius may create residual uncertainty, but their occurrence and entropy contribution are channel-dependent. This conditional contribution is distinct from the per-cycle physical bound $\varepsilon_{\mathrm{phys}}\ge H_q(P\mid R)\quad(\text{registered reset branch; a positive floor requires }H_q(P\mid R)\ge h_{\min}>0)$ and is not a universal second mechanism operating on every MPU cycle.

*Proof.* Let $c$ be the transmitted codeword and $r=c+e$ the received word, with Hamming weight $\operatorname{wt}(e)\le3$. Then $d_H(r,c)\le3$, so a codeword within decoding radius three exists. If another codeword $c'\ne c$ also satisfied $d_H(r,c')\le3$, the triangle inequality would give
$$
d_H(c,c')\le d_H(c,r)+d_H(r,c')\le6,
$$
contradicting the minimum distance $d=8$. Thus radius-three decoding is unique. For errors of weight at least four this argument gives no universal decoding or entropy conclusion; those quantities depend on the registered channel law and decoder. The reset-cost inequality is a separate conditional-entropy statement and does not enter the distance argument. ∎



**Corollary (Conditional Decoder Failure above the Guaranteed Radius).** For a registered $[24,12,8]$ encoder, channel, and decoder, every error pattern of Hamming weight at most
$$
\left\lfloor\frac{8-1}{2}\right\rfloor=3
$$
is uniquely correctable by minimum-distance decoding. Minimum distance alone gives no universal unique-decoding guarantee at weight four or above. Failure probability, residual uncertainty, and thermodynamic cost additionally depend on the channel law, decoder, failure record, and physical reset ledger. Such costs are distinct from the conditional Landauer bound $\varepsilon_{\mathrm{reset}}\ge H_q(P\mid R)$.

*Proof.* Let $c$ be the transmitted codeword and $r=c+e$ with $\operatorname{wt}(e)\le3$. If a distinct codeword $c'$ also satisfied $d_H(r,c')\le3$, then
$$
d_H(c,c')\le d_H(c,r)+d_H(r,c')\le6,
$$
contradicting the minimum distance $8$. Thus decoding is unique through radius three.

Sharpness is witnessed by an octad: take codewords $c=0$ and $c'$ whose support has weight $8$, and let $r$ be the indicator of any four-point subset of that support. Then $d_H(r,c)=d_H(r,c')=4$, so minimum-distance decoding has a tie. The code parameter therefore supplies no universal weight-four guarantee and contains no thermodynamic reset premise. ∎

---

### 7.5.6 Connection to Emergent Gravity

The operational channel ledger and the local-horizon equation-of-state ledger
are distinct and meet only on an explicitly certified common branch:

1. **Operational area budget (Theorems E.3 and E.6).** On the
capacity-achieving, entropy-saturating, additive-ledger branch,
$$
\frac{S_{\mathrm{rel}}}{k_B}
=\frac{c^3\mathcal A}{4G_{\mathrm{op}}\hbar}+o(\mathcal A).
$$
The leading Bekenstein--Hawking form requires the separate bridges
$S_{\mathrm{rel}}=S_{BH}+o(\mathcal A)$ and $G_{\mathrm{op}}=G$.

2. **Physical horizon bridge.** The entropy identification and measured-coupling
   calibration are independent of the channel count.

3. **Local equation-of-state branch.** The local Rindler KMS/Unruh record,
   Clausius relation, Raychaudhuri focusing equation, conserved stress-energy
   source, and all-horizon quantifier are the independent premises used in
   Section 12.

4. **Conditional Einstein equation.** The tensor conclusion follows only on
   the joint local-equilibrium, focusing, source, conservation, and
   normalization branch; channel counting alone supplies none of those gates.

The operational coefficient is
$$
G_{\mathrm{op}}
=\frac{\eta\delta^2c^3}{4\hbar\chi C(\mathcal E_N)}.
$$
It equals the measured gravitational constant only on the external calibration
branch. Section 12 records the conditional Einstein-equation derivation and
its independent source and conservation gates.

## 7.6 Finite-Carrier and MPU-Dynamics Resolution Records

The following results resolve finite mathematical components of `TV-MPU-03`--`TV-MPU-08`. They preserve the distinction between a response representation and a physical implementation.

**Theorem 7.6a (Multiplicity Classification and the Surplus-Dynamics Gate).** Let $\pi:M_8(\mathbb C)\to\mathcal B(\mathcal H)$ be a nonzero unital finite-dimensional representation. There is a finite-dimensional multiplicity space $\mathcal K$ and a unitary identification
$$
\mathcal H\cong\mathbb C^8\otimes\mathcal K,
\qquad
\pi(A)=A\otimes I_{\mathcal K}.
\tag{7.6a.1}
$$
Consequently every finite representation of the three commuting labeled qubit factors has dimension $8m$, where $m=\dim\mathcal K\ge1$. If the retained response algebra is contained in $M_8(\mathbb C)\otimes I_{\mathcal K}$, partial trace over $\mathcal K$ and the embedding $\rho\mapsto\rho\otimes|0\rangle\!\langle0|$ give same-response comparators between every multiplicity-$m$ representative and the multiplicity-one representative.

The static representation data do not force surplus-sector decoupling or convergence. On the same carrier, self-adjoint $H_0\otimes I+I\otimes H_{\mathcal K}$ gives decoupled unitary dynamics, whereas $H_0\otimes I+I\otimes H_{\mathcal K}+A\otimes B$ with nonscalar self-adjoint $A$ and $B$ couples the factors. A response-preserving convergence claim therefore requires a dynamical intertwiner showing that the coupled term is absent or response-null and a Lyapunov or mixing estimate on the same carrier.

*Proof.* The matrix units of $M_8(\mathbb C)$ decompose $\mathcal H$ into eight mutually isomorphic subspaces exactly as in Theorem 23a, giving (7.6a.1). Every retained observable $A\otimes I$ has expectation $\operatorname{tr}(A\operatorname{tr}_{\mathcal K}\rho)$, proving the comparator statement. The two displayed Hamiltonian classes share the same static representation, while the commutator of $A\otimes B$ with a generic $C\otimes I$ is $[A,C]\otimes B\ne0$. Thus the static algebra admits both dynamical behaviors and entails neither decoupling nor convergence. ∎

**Theorem 7.6b (Finite Stochastic Laws Admit Deterministic Response-Null Refinements).** Let a finite `Evolve` model have finite state set $X$, finite outcome set $O$, and normalized kernel $K(o,x'\mid x)$. There is a deterministic refinement on
$$
X\times[0,1]^{\mathbb N}
$$
whose marginal finite-history law on $(X,O)$ is exactly the law generated by $K$.

*Proof.* Order the finitely many pairs $(o,x')$ for each $x$ and partition $[0,1)$ into half-open intervals of lengths $K(o,x'\mid x)$. The deterministic update reads the first seed coordinate, selects its unique interval, emits $o$, updates to $x'$, and left-shifts the seed sequence. Product Lebesgue measure on the seed sequence gives the prescribed conditional probability at every step; induction gives equality of every finite cylinder probability. ∎

Therefore no admitted finite response that omits the seed distinguishes intrinsic stochasticity from this hidden deterministic refinement. A separating operational axiom must either expose a seed-dependent response, impose a certified independence condition that the refinement violates, or exclude response-null hidden refinements as primitive branch data.

**Theorem 7.6c (Clock--Generator Gauge Classification).** Let a ray evolution be
$$
[\psi(t)]=[e^{-iHt/\hbar}\psi(0)].
$$
For every $\lambda>0$ and $c\in\mathbb R$, the transformed clock and generator
$$
t'=\lambda t,
\qquad
H'=\frac{H+cI}{\lambda}
\tag{7.6c.1}
$$
produce the same ray history. Conversely, once a projective one-parameter group and its parameter are fixed, its self-adjoint generators differ only by a scalar multiple of the identity.

*Proof.* Substitution gives
$$
e^{-iH't'/\hbar}=e^{-ict/\hbar}e^{-iHt/\hbar},
$$
so the rays agree. The converse is the uniqueness of the generator of a fixed strongly continuous unitary lift, together with the scalar phase freedom of a lift of a projective group. ∎

Thus the ray law fixes neither the zero of energy nor the conversion between its abstract parameter and physical time. Theorem 29's registered clock and work/power calibration must fix those two gauges before energy per cycle, power, or a dimensionful action ledger is physically identified.

**Theorem 7.6d (Exact Abstract Golay Encoder and Radius-Three Recovery).** Let $\mathcal G_{24}\subset\mathbb F_2^{24}$ be a binary linear $[24,12,8]$ code on the accepted predictive-recovery branch, let
$$
G:\mathbb F_2^{12}\xrightarrow{\cong}\mathcal G_{24}
$$
be any linear encoder, and let $H:\mathbb F_2^{24}\to\mathbb F_2^{12}$ have kernel $\mathcal G_{24}$. For every syndrome $s$ arising from an error $e$ of Hamming weight at most three, that error is unique. On the correctable received-word set
$$
\mathcal R_3:=\{c+e:c\in\mathcal G_{24},\ \operatorname{wt}(e)\le3\},
$$
the finite lookup
$$
D:\mathcal R_3\to\mathcal G_{24},
\qquad
D(r)=r-e(Hr)
\tag{7.6d.1}
$$
recovers every transmitted codeword.

*Proof.* If $He=He'$ with $\operatorname{wt}(e),\operatorname{wt}(e')\le3$, then $e-e'\in\ker H=\mathcal G_{24}$ and $\operatorname{wt}(e-e')\le6$. Minimum distance eight forces $e=e'$. Equation (7.6d.1) then returns the transmitted codeword. ∎

This is a complete finite algebraic encoder/syndrome/recovery map. A physical record must additionally identify the 24 binary coordinates, realize $G$ and $H$, specify the noise law and syndrome instrument, and account for preparation, storage, recovery, failure, and reset resources without importing the structural $\ln2$ ledger as heat.

**Theorem 7.6e (Source-Exhaustive Binary Reset Classification).** For a binary record $\Phi$ and retained side information $R$, write $p_r=q(\Phi=1\mid R=r)$. Then
$$
H_q(\Phi\mid R)=\sum_rq(r)h_2(p_r),
\qquad
0\le H_q(\Phi\mid R)\le\ln2.
\tag{7.6e.1}
$$
The upper equality holds exactly when $p_r=1/2$ for every $r$ of positive probability, and the lower equality holds exactly when $p_r\in\{0,1\}$ for every such $r$. Under Definition 28,
$$
\varepsilon_{\mathrm{reset}}
=H_q(\Phi\mid R)+\varepsilon_{\mathrm{diss}},
\qquad
\varepsilon_{\mathrm{diss}}\ge0,
\tag{7.6e.2}
$$
Conditional uniformity together with zero excess implies $\varepsilon_{\mathrm{reset}}=\ln2$; on the separately certified conditionally uniform branch, that reset equality is equivalent to zero excess. The numerical reset equality alone does not imply conditional uniformity.

*Proof.* The binary entropy $h_2(p)$ lies in $[0,\ln2]$, reaches its unique maximum at $p=1/2$, and vanishes exactly at $p=0,1$. Averaging proves (7.6e.1); Definition 28 gives (7.6e.2). ∎

In particular, $p_r=\epsilon$ with $0<\epsilon<1/2$ supplies nonempty reset ensembles with arbitrarily small positive conditional entropy as $\epsilon\downarrow0$. Certifying the $\ln2$ equality as Theorem 31a's uniform-source, zero-excess case therefore requires its exchange-invariant source condition and a separately measured zero-excess implementation.

**Theorem 7.6f (Real and Cayley Marking Moduli on $\mathbb C^8$).** Fix the Hermitian complex carrier $V=\mathbb C^8$.

1. Antiunitary involutions on $V$ form one $U(8)$-orbit with stabilizer $O(8)$, and hence their marking space is $U(8)/O(8)$.
2. After an involution selects the real carrier $V_{\mathbb R}\cong\mathbb R^8$, positive Cayley four-forms form the $GL^+(8,\mathbb R)$-orbit with stabilizer $\mathrm{Spin}(7)$. With an orientation and Euclidean metric fixed, the compatible forms comprise the corresponding $SO(8)/\mathrm{Spin}(7)$ orbit.
3. The complex matrix algebra and its three labeled tensor factors select no canonical point in either orbit.

*Proof.* Every antiunitary involution is a conjugation in some orthonormal basis. Changing that basis by $U\in U(8)$ changes the conjugation, and exactly the real orthogonal changes preserve it, proving the first quotient. The second statement is the homogeneous-orbit and stabilizer classification of a positive Cayley form. For the final statement, a carrier real structure commuting with all complex scalar unitaries would satisfy both $J(e^{i\theta}v)=e^{-i\theta}Jv$ by antilinearity and $J(e^{i\theta}v)=e^{i\theta}Jv$ by invariance, which fails for generic $\theta$. A Cayley form requires the already unselected real carrier plus its own orbit point. ∎

Compatibility with the three labeled factors can restrict these moduli only after the admissible normalizer and equivalence relation are frozen. That factor-compatible sub-classification and any physical selector remain open.

**Theorem 7.6g (Exact Normalizer Classification for Surplus Dynamics).** Let $\mathcal K$ be finite-dimensional, put $\mathcal A=M_8(\mathbb C)\otimes I_{\mathcal K}$, and let $H=H^*$ on $\mathbb C^8\otimes\mathcal K$. The following are equivalent:

1. $e^{-itH/\hbar}\mathcal A e^{itH/\hbar}=\mathcal A$ for every $t\in\mathbb R$;
2. $[H,\mathcal A]\subseteq\mathcal A$;
3. there are self-adjoint $H_0$ on $\mathbb C^8$ and $H_{\mathcal K}$ on $\mathcal K$ such that
   $$
   H=H_0\otimes I_{\mathcal K}+I_8\otimes H_{\mathcal K}.
   \tag{7.6g.1}
   $$

On these and exactly these Hamiltonian branches, partial trace intertwines the full response dynamics with the multiplicity-one dynamics:
$$
\operatorname{tr}_{\mathcal K}
\bigl(e^{-itH/\hbar}\rho e^{itH/\hbar}\bigr)
=
e^{-itH_0/\hbar}\operatorname{tr}_{\mathcal K}(\rho)e^{itH_0/\hbar}.
\tag{7.6g.2}
$$

On the split branch, the surplus channel
$$
\Gamma_t=\operatorname{Ad}_{e^{-itH_{\mathcal K}/\hbar}}
\tag{7.6g.3}
$$
converges in operator norm as $t\to\infty$ if and only if $H_{\mathcal K}$ is scalar, in which case $\Gamma_t$ is the identity channel for every $t$. Thus a nontrivial finite-dimensional Hamiltonian surplus has no asymptotic channel limit, while the retained response already descends exactly by (7.6g.2).

*Proof.* Differentiating item 1 at $t=0$ gives item 2. Under item 2, $A\mapsto i[H,A\otimes I]$ is a $*$-derivation of $M_8(\mathbb C)$. Every $*$-derivation of a full matrix algebra is inner, so a self-adjoint $H_0$ satisfies
$$
i[H,A\otimes I]=i[H_0,A]\otimes I
$$
for all $A$. Hence $H-H_0\otimes I$ commutes with $M_8(\mathbb C)\otimes I$. The commutant is $I_8\otimes\mathcal B(\mathcal K)$, which gives (7.6g.1) with $H_{\mathcal K}=H_{\mathcal K}^*$. Item 3 implies item 1 by exponentiation. Factorization of the exponential and unitary invariance of partial trace prove (7.6g.2).

If $\Gamma_t$ has an operator-norm limit $L$, then for every fixed $s$ the group law and continuity of composition give
$$
\Gamma_s
=\lim_{t\to\infty}\Gamma_{t+s}\Gamma_t^{-1}
=LL^{-1}=I.
$$
Hence $\Gamma_t$ is constant. In finite dimension, $\operatorname{Ad}_{e^{-itH_{\mathcal K}/\hbar}}=I$ for every $t$ exactly when $H_{\mathcal K}$ is scalar. The converse is immediate. ∎

Thus (7.6g.1) is the complete finite same-response dynamics class for the representation in Theorem 7.6a, and (7.6g.3) gives the complete finite Hamiltonian convergence classification. A Hamiltonian outside the split class changes at least one retained $M_8(\mathbb C)\otimes I$ response at infinitesimal order. Physical admission of one carrier and generator remains a realization record.

**Theorem 7.6h (Finite-History Response-Quotient Stochasticity Classification).** Let two `Evolve` models with finite retained state and output alphabets be response-equivalent when they induce the same probability for every finite retained history in $(X,O)$. Every normalized kernel on those alphabets is response-equivalent to the deterministic seed refinement of Theorem 7.6b, whose auxiliary seed space need not be finite. Consequently every predicate invariant under retained finite-history response equivalence has the same truth value on the kernel and on that deterministic refinement.

Conversely, a predicate separating the two models must use at least one of the following additions: a retained response whose finite-history law differs; access to an implementation-level variable or observable outside the retained history, such as the seed, hidden memory, or an architecture label; or an admissibility/equivalence premise that structurally excludes the deterministic refinement, such as an exogeneity requirement. These three cases exhaust separator classes on the retained finite-history quotient.

*Proof.* Theorem 7.6b proves equality of every finite cylinder probability. Any invariant predicate is constant on an equivalence class and therefore agrees on the two representatives. If a predicate separates them while every retained cylinder law agrees, it either consumes additional implementation data not measurable in the retained finite-history ledger or changes the admissible representative/equivalence class by a structural premise. If a retained cylinder law differs, the first case applies. These alternatives exhaust whether the separator changes the retained response, extends the observation algebra, or restricts the admissible model class. ∎

The nontrivial Bernoulli kernel and its inverse-transform refinement give a nonempty stochastic/deterministic pair. The theorem gives a coverage-complete `nonentailment` result for intrinsic stochasticity on the retained finite-history quotient and a complete classification of separator types for that pair. The response-only route therefore retains `N`; a physical `Evolve` realization must populate and justify one separator class.

**Theorem 7.6i (Complete Clock--Energy Calibration Fiber).** For a fixed nontrivial projective one-parameter evolution, the set of clock-and-generator presentations is one orbit of the two-parameter action
$$
(\lambda,c):(t,H)\longmapsto
\left(\lambda t,\frac{H+cI}{\lambda}\right),
\qquad \lambda>0,\ c\in\mathbb R.
\tag{7.6i.1}
$$
There is no further finite-dimensional presentation ambiguity. If a registered ray recurrence has abstract period $T>0$ and independently measured physical period $T_{\mathrm{phys}}>0$, then
$$
\lambda=\frac{T_{\mathrm{phys}}}{T}.
\tag{7.6i.2}
$$
If a normalized reference state $\rho_{\mathrm{ref}}$ independently has registered physical energy $E_{\mathrm{ref}}$ for the calibrated generator, then
$$
c=\lambda E_{\mathrm{ref}}-\operatorname{tr}(\rho_{\mathrm{ref}}H).
\tag{7.6i.3}
$$
Equations (7.6i.2)--(7.6i.3) select one presentation in the complete fiber.

*Proof.* Theorem 7.6c proves that (7.6i.1) preserves the ray history and that two generators of one fixed projective parameterization differ by a scalar. A change between two positive parameter units is multiplication by one $\lambda>0$, so these are all presentations. Period comparison gives (7.6i.2). Substitution of $H'=(H+cI)/\lambda$ into $E_{\mathrm{ref}}=\operatorname{tr}(\rho_{\mathrm{ref}}H')$ and $\operatorname{tr}\rho_{\mathrm{ref}}=1$ gives (7.6i.3). ∎

This theorem completes the mathematical modulus and normalization classification. Physical clock, reference-energy, work/power and uncertainty records remain the realization and observable components.

**Theorem 7.6j (Finite Golay Encoding, Syndrome-Instrument and Recovery Certificate).** On the accepted $[24,12,8]$ branch of Theorem 7.6d, let
$$
\mathcal H_{12}=(\mathbb C^2)^{\otimes12},
\qquad
\mathcal H_{24}=(\mathbb C^2)^{\otimes24},
\qquad
V_G:\mathcal H_{12}\longrightarrow\mathcal H_{24},
\qquad
V_G|u\rangle=|Gu\rangle,
$$
and for $s\in\mathbb F_2^{12}$ define
$$
P_s=\sum_{x:Hx=s}|x\rangle\!\langle x|.
\tag{7.6j.1}
$$
The maps $\mathcal S_s(\rho)=P_s\rho P_s$ form a projective syndrome instrument. For every syndrome $s$ having a weight-at-most-three representative, let $e(s)$ be the unique such representative and define
$$
\mathcal R_s(\rho)=X^{e(s)}\rho X^{e(s)}.
\tag{7.6j.2}
$$
For the remaining syndromes, write a failure flag and apply any fixed trace-preserving fallback. The resulting conditional recovery is completely positive and its sum over all syndrome and failure records is trace preserving. For every density operator $\rho$ on $\mathcal H_{12}$ and every bit-flip error $X^e$ with $\operatorname{wt}(e)\le3$,
$$
\mathcal R_{He}\!\circ\mathcal S_{He}
\bigl(X^eV_G\rho V_G^*X^e\bigr)
=V_G\rho V_G^*.
\tag{7.6j.3}
$$

*Proof.* The projectors in (7.6j.1) are orthogonal and sum to the identity, so the syndrome maps form a normalized instrument. Theorem 7.6d gives uniqueness of $e(s)$ in the stated radius. Every encoded basis vector has zero syndrome, and $X^e$ shifts it to syndrome $He$; the same statement holds coherently on the code subspace. Applying $X^{e(He)}=X^e$ gives (7.6j.3). Unitary conditional corrections and the fixed fallback make the complete recorded map CPTP. Gaussian elimination over $\mathbb F_2$ decomposes $V_G$ and the parity computation into a finite CNOT network with initialized ancillas. ∎

The displayed carrier, encoder, correctable noise class, syndrome instrument, decoder and failure record populate a finite model-level recovery certificate. The physical coordinate, implemented gate/instrument, preparation/reset and resource fields remain unpopulated; together with substrate realization and a held-out error experiment, they retain `C+R+E`.

**Theorem 7.6k (Finite Binary Return-Map Exhaustion).** Let $\Phi\in\{0,1\}$ be a pre-return record and let $R$ contain every retained classical side record. A completed classical return map preserves $R$ and sends both inputs to the ready value $0$:
$$
(\phi,r)\longmapsto(0,r).
\tag{7.6k.1}
$$
For each $r$ with both conditional inputs present, (7.6k.1) is noninjective. Every injective or reversible extension of (7.6k.1) therefore writes a record $E$ from which $\phi$ is recoverable conditional on $r$. Exactly one branch in the following priority-ordered accounting partition applies:

1. for every retained $r$, at most one value of $\Phi$ occurs, in which case $H(\Phi\mid R)=0$ before the return;
2. otherwise, a copy of $E$ remains in the retained side-information ledger, in which case $H(\Phi\mid R,E)=0$;
3. otherwise, a persistent-export certificate tracks $E$, or the information it carries, outside the retained ledger, in which case global injectivity may be preserved and no reset-heat conclusion follows for the ready register alone;
4. otherwise, $E$ is restored to its registered initial state by a cyclic isothermal implementation satisfying all premises of Definition 28, in which case that definition gives the conditional Landauer ledger;
5. otherwise, $E$ leaves the retained accounting boundary without a persistent-export certificate or a complete Definition-28 reset certificate, in which case the return map alone assigns no reset heat.

*Proof.* If no conditional pair exists, $\Phi$ is already a function of $R$, which is item 1. Otherwise noninjectivity follows from the reachable inputs $(0,r)$ and $(1,r)$. An injective extension must map those inputs to distinct total outputs; because their ready-register and retained-$R$ outputs agree, the distinction lies in $E$, which makes $\Phi$ a function of $(R,E)$. First test whether a copy of that distinguishing information is retained; if not, test whether it has a persistent certified export; if not, test whether its restoration carries the complete Definition-28 certificate. Failure of all three tests is uncertified removal. These successive complements make items 2--5 disjoint and exhaustive. Only item 4 carries the Definition-28 Landauer conclusion. ∎

Together with Theorem 7.6e, this classifies every finite reachable-source and return-map branch relevant to the binary entropy floor without identifying record export or uncertified removal with erasure heat. A positive $\ln2$ heat equality still requires a populated conditionally uniform source and a cyclic isothermal zero-excess implementation satisfying Definition 28.

**Theorem 7.6l (Labeled Three-Factor Real-Structure Orbits).** Put $V=(\mathbb C^2)^{\otimes3}$ and let
$$
\mathcal A_j=I\otimes\cdots\otimes M_2(\mathbb C)\otimes\cdots\otimes I
$$
be the three labeled matrix factors. Up to conjugation by unitaries preserving every $\mathcal A_j$, antiunitary involutions $J$ satisfying $J\mathcal A_jJ^{-1}=\mathcal A_j$ are classified by the four sign triples
$$
(\epsilon_1,\epsilon_2,\epsilon_3)
\in\{(+,+,+),(+, -,-),(-,+,-),(-,-,+)\}.
\tag{7.6l.1}
$$
Here $J$ has a factorization $J=J_1\otimes J_2\otimes J_3$ up to phase, $J_j^2=\epsilon_jI$, and $J^2=I$ is equivalent to $\epsilon_1\epsilon_2\epsilon_3=1$.

*Proof.* Fix product-basis conjugation $K$. Writing $J=UK$, preservation of every labeled factor implies that $U$ lies in the labeled-factor normalizer, whose unitary elements are product unitaries up to a scalar. Thus $J$ factors into three antiunitaries. From $J^2=I$, each $J_j^2$ is scalar and their scalar product is one. In complex dimension two an antiunitary square is $+I$ or $-I$; under unitary conjugacy each sign has one class, represented by ordinary conjugation and by $i\sigma_yK$, respectively. The even-minus sign triples in (7.6l.1) are therefore the complete orbit list. ∎

The stated involution and labeled-factor-preservation conditions admit all four inequivalent classes and therefore select none. After a global real carrier is selected, a Cayley form remains a point of the separate $SO(8)/\mathrm{Spin}(7)$ marking orbit. The following theorem completes its quotient by every sign-triple stabilizer.

**Theorem 7.6m (Factor-Compatible Cayley Quotients Have No Selected Orbit).** Fix one sign triple $\epsilon=(\epsilon_1,\epsilon_2,\epsilon_3)$ in (7.6l.1), choose the corresponding factor antiunitaries $J_j$, and let $H_\epsilon\le SO(V_{\mathbb R})$ be the image on the fixed real carrier of
$$
\left\{U_1\otimes U_2\otimes U_3:
U_jJ_j=J_jU_j\right\}.
\tag{7.6m.1}
$$
The factor-compatible Cayley markings modulo the complete declared equivalence are exactly the compact double quotient
$$
\mathcal Q_\epsilon
=H_\epsilon\backslash SO(8)/\mathrm{Spin}(7).
\tag{7.6m.2}
$$
For every allowed $\epsilon$, $\mathcal Q_\epsilon$ contains more than one point. Consequently no labeled-factor-compatible real-structure class selects a Cayley marking without an additional premise.

*Proof.* The compatible positive Cayley forms form $X=SO(8)/\mathrm{Spin}(7)$ by Theorem 7.6f. The left action of the complete factor stabilizer identifies exactly the markings related by (7.6m.1), which proves (7.6m.2). The double cover $\mathrm{Spin}(8)\to SO(8)$ identifies the pullback homogeneous space with the unit-spinor sphere $S^7$ and its central two-point quotient with $X$; hence $X\cong\mathbb {RP}^7$ and has dimension seven and fundamental group $\mathbb Z_2$.

For a plus factor, the connected commutant of $J_j$ has dimension one; for a minus factor it is $\mathrm{Sp}(1)$ and has dimension three. The tensor-product map has finite kernel. Thus $\dim H_{(+,+,+)}=3$, so that group cannot act transitively on the seven-dimensional $X$. Each even-minus stabilizer has connected component locally isomorphic to $SO(2)\times\mathrm{Sp}(1)\times\mathrm{Sp}(1)$ and dimension seven. If the full stabilizer acted transitively, its identity component would also act transitively on the connected manifold $X$. Its stabilizer would be discrete and finite, so the orbit map would be a finite covering. The fundamental group of the identity component contains the infinite cyclic factor from $SO(2)$, whereas a covering injects it into $\pi_1(X)=\mathbb Z_2$, a contradiction. None of the four complete stabilizers is transitive, so every orbit quotient in (7.6m.2) has at least two points. ∎

**Resolution TV-MPU-08-R2 (Metadata).** Exact domain: the four sign triples in (7.6l.1) and the full compatible Cayley-form orbit of Theorem 7.6f after the real carrier, orientation and Euclidean metric are fixed. Premises: labeled-factor preservation and no selector outside the corresponding complete stabilizer $H_\epsilon$. Equivalence: the left $H_\epsilon$ action on $SO(8)/\mathrm{Spin}(7)$. Budget: all four stabilizer classes and their complete compact orbit spaces. Verifier: compute the factor-commutant dimensions, the finite tensor-product kernels and the fundamental groups in the proof. Falsifier: a transitive $H_\epsilon$ action for any allowed sign triple or a Cayley marking absent from (7.6m.2). Provenance class: source-internal compact-group and homogeneous-space classification. Downstream consumers: Corollary 23a.1 and every real/$\mathrm{Spin}(7)$ carrier use. Nonvacuity: $SO(8)/\mathrm{Spin}(7)\cong\mathbb {RP}^7$ is nonempty. This is `negative-refutation` of Cayley-marking selection from the complete labeled-factor stabilizer class and discharges the remaining mathematical component of `TV-MPU-08`.

**Theorem 7.6n (Explicit Clock--Energy--Work Calibration Record).** Fix $E>0$ and the eight-dimensional MPU carrier with orthonormal basis $|0\rangle,\ldots,|7\rangle$,
$$
\mathcal H_E=\mathbb C^8,
\qquad
H_E=E\sum_{j=0}^{7}j|j\rangle\!\langle j|,
\qquad
|+\rangle=\frac{|0\rangle+|1\rangle}{\sqrt2}.
\tag{7.6n.1}
$$
Declare the parameter $t$ of $U_E(t)=e^{-itH_E/\hbar}$ to be the registered clock in seconds and use $|0\rangle$ and $|1\rangle$ as the zero- and reference-energy preparations. Then
$$
T_E=\frac{2\pi\hbar}{E},
\qquad
t_\perp=\frac{\pi\hbar}{E},
\qquad
\langle H_E\rangle_+=\Delta_+H_E=\frac E2.
\tag{7.6n.2}
$$
The survival response is
$$
\operatorname{tr}\!\left(
U_E(t)|+\rangle\!\langle+|U_E(t)^*|+\rangle\!\langle+|
\right)
=\cos^2\!\left(\frac{Et}{2\hbar}\right),
\tag{7.6n.3}
$$
Registering $T_E$ as the period in seconds and the two energy values $0,E$ fixes the scale and additive presentation gauges by (7.6i.2)--(7.6i.3).

For a differentiable driven record $(\rho(t),H(t))$, define the work and power extractors
$$
W[0,\tau]=\int_0^\tau
\operatorname{tr}(\rho(t)\dot H(t))\,dt,
\qquad
P(t)=\operatorname{tr}(\rho(t)\dot H(t)).
\tag{7.6n.4}
$$
On the commuting stroke $H(t)=(t/\tau)H_E$, $\rho(t)=|1\rangle\!\langle1|$, they give $P(t)=E/\tau$ and $W[0,\tau]=E$. For the recurrent ray in (7.6n.1), the registered cycle rate $\nu_E=T_E^{-1}$ gives
$$
R_E=\nu_E\langle H_E\rangle_+
=\frac{E^2}{4\pi\hbar},
\qquad
R_ET_E=\frac E2,
\qquad
\Delta_+H_E\,t_\perp=\frac{\pi\hbar}{2}.
\tag{7.6n.5}
$$
Equations (7.6n.1)--(7.6n.5), the two preparation labels, and the binary projector response form a finite formal calibration record: every state, update, response, clock value and extractor is finite-dimensional and exactly verifiable. Energy is in joules, $t$ and $T_E$ are in seconds, $P$ and $R_E$ are in watts, and the two products in (7.6n.5) have energy and action units respectively.

*Proof.* Direct exponentiation gives
$$
U_E(t)|+\rangle
=\frac{|0\rangle+e^{-iEt/\hbar}|1\rangle}{\sqrt2},
$$
which proves (7.6n.2)--(7.6n.3). The registered zero and reference preparations fix the additive gauge by $\langle1|H_E|1\rangle=E$ and $\langle0|H_E|0\rangle=0$; the registered response period fixes the multiplicative clock gauge. Equation (7.6n.4) gives the displayed commuting-stroke values by substitution. The remaining identities follow from $\nu_E=E/(2\pi\hbar)$ and (7.6n.2). ∎

**Resolution TV-MPU-05-R2 (Metadata).** Exact domain: the eight-dimensional MPU carrier (7.6n.1), its active two-level sector and driven commuting stroke. Premises: a declared clock/energy presentation with $E>0$, standard unit dimensions and the displayed preparations. Equivalence: unitary relabeling preserving the registered preparations and response. Budget: two preparations, one binary response, one full-carrier recurrence and one work stroke. Verifier: Equations (7.6n.2)--(7.6n.5), including recurrence, work, power, cycle and uncertainty identities. Falsifier: a wrong recurrence, work integral, unit or displayed identity. Provenance class: source-internal finite model record. Downstream consumers: Theorem 29, Corollary 29.1 and `TV-MPU-05`. Closure still requires independently sourced clock and reference-energy response records and a response-faithful unit/covariance map that selects one point of the complete presentation fiber; `TV-MPU-05` therefore retains `R+O`.

**Resolution ledger 7.6-R1.** All entries below are analytic campaign-resolution artifacts on the displayed finite-dimensional carriers, finite retained alphabets and histories, code blocks, or ensembles. The response-null inverse-transform refinement of Theorems 7.6b and 7.6h may use a standard-Borel auxiliary seed space. Equivalence means equality of the named retained responses or unitary equivalence preserving them, as specified by each row.

| Target | Exact scoped proposition and polarity | Verifier and falsifier | Downstream consumers |
|:--|:--|:--|:--|
| `TV-MPU-03` | The finite representation/multiplicity class and the exact response-autonomous Hamiltonian class (7.6g.1) are `positive-discharge`; nontrivial finite surplus-channel convergence receives `negative-refutation`, while static algebra alone still does not select the split branch. | Check (7.6a.1), the derivation-normalizer equivalence, partial-trace intertwining (7.6g.2), and the group-limit argument for (7.6g.3); a preserving Hamiltonian outside the split form or a convergent nonscalar surplus channel falsifies the classification. | Theorems 23a, Z.2 and every $d_0=8$ dynamics promotion. |
| `TV-MPU-04` | Intrinsic stochasticity from the retained finite-history law alone is `nonentailment`, so the response-only route carries `N`; Theorem 7.6h gives `positive-discharge` of the separator classification for the kernel/refinement pair into changed retained response, added implementation observable, or structural admissibility restriction. | Compare every finite cylinder law with the inverse-transform refinement and type every proposed separator for that pair; a retained-equivalent invariant predicate that distinguishes the representatives, or a separator outside the three registered classes, falsifies the result. | Proposition 28, Definition 27 and single-outcome branches. |
| `TV-MPU-05` | Absolute energy zero and time/energy scale from ray dynamics alone are `nonentailment`; the complete two-parameter presentation fiber and its unique selection by one independent period and reference-energy record are `positive-discharge`. | Substitute (7.6c.1) and verify (7.6i.1)--(7.6i.3); an additional presentation modulus or two calibrated presentations with the same registered period and reference energy falsifies the classification. | Theorem 29, Corollary 29.1 and action/power ledgers. |
| `TV-MPU-06` | The finite model-level carrier, encoder, bit-flip noise class, syndrome instrument, conditional recovery and failure record are `positive-discharge`; the populated physical certificate, realization and held-out test remain open. | Exhaust the weight-$\le3$ error set, verify (7.6j.1)--(7.6j.3), complete positivity and trace preservation; a correctable syndrome collision, recovery failure, or unnormalized recorded map falsifies the result. | Golay recovery, Appendix-U uniqueness and substrate protocols. |
| `TV-MPU-07` | Conditional-entropy, equality and finite return-map branches are `positive-discharge`; record export or uncertified removal alone has no erasure-heat implication, and universal $\ln2$ without a conditionally uniform source and Definition-28 zero-excess implementation is `nonentailment`. | Evaluate (7.6e.1)--(7.6e.2), classify the retained, persistent-export, certified-reset, uncertified-removal and deterministic cases of Theorem 7.6k, and audit every Definition-28 premise; a missing branch or an uncertified Landauer conclusion falsifies the result. | Theorems 31--33 and thermodynamic/reset ledgers. |
| `TV-MPU-08` | Unconstrained real/Cayley marking moduli and the four factor-compatible real-structure orbits are `positive-discharge`; selection of one sign class is `nonentailment`; Theorem 7.6m gives `negative-refutation` of Cayley-marking selection for every complete sign-triple stabilizer quotient. | Verify the two unconstrained stabilizers, factor-normalizer reduction, four sign triples in (7.6l.1), and the dimension/fundamental-group obstruction of Theorem 7.6m; an omitted compatible orbit or a transitive complete stabilizer action falsifies the classification. | Corollary 23a.1 and every real/$\mathrm{Spin}(7)$ carrier use. |
