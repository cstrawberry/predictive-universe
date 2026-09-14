*The Look In The Eye (LITE) construction gives an explicit arithmetical example of bounded adaptive self-reference. It defines a total computable function whose branch at input $n$ is selected by finite searches for PA proofs concerning a formula that contains the function's own program index. On the indexed-computation template specialization, LITE realizes the logical form of a Dynamic Self-Reference Operator (DSRO) and illustrates representation, bounded syntactic reasoning, and predicate-evaluation capabilities associated with Property R. It does not by itself establish Effective Operational Property R in a physical Minimal Predictive Unit (MPU) network, prove SPAP, or supply the optimization, reliability, memory, protected-gate, execution, or error-correction certificates required by the certified MPU-network route.*

# LITE: Dynamic Self-Reference in Peano Arithmetic

## Abstract

The Look In The Eye (LITE) construction shows that Peano Arithmetic (PA) can represent a total computable procedure whose output depends on finite proof searches about formulas containing the procedure's own index. Kleene's Second Recursion Theorem supplies the fixed-point index, and decidable bounded proof verification supplies the branch conditions. Once the auxiliary functions, formula template, proof encoding, and fixed point are fixed, the resulting function is mathematically fixed; “dynamic” refers to the self-referential computation performed at each input, not to a previously assigned value changing when a human later finds a proof. When the template represents a property of the indexed computation, the construction gives a concrete DSRO and a logical model of several Property-R capabilities while leaving physical implementation and the diagonal impossibility claims of SPAP as separate results.

## 1. Introduction

### 1.1. Fixed Definitions with Self-Referential Computation

Formal definitions and the PA proof relation are fixed. They can nevertheless describe computations whose branch choices depend on syntactic facts about proofs. LITE exploits this distinction. Given total computable auxiliary functions $g,H_1,H_2$, it constructs a program that, on input $n$, searches a finite proof domain for a target formula and its negation, then returns one of three prescribed outputs.

The construction is “adaptive” in the computational sense: its output is selected by the results of self-referential proof checks performed during evaluation. It is not a temporal mutation rule for PA, and it does not make theoremhood depend on the date or order in which proofs are found. Consistency of PA, written $\operatorname{Con}(\mathrm{PA})$, rules out simultaneous PA proofs of a sentence and its negation, but it is not required for the existence, totality, or computability of the prioritized LITE function.

### 1.2. A Fresh Angle on Self-Reference

Classical Gödelian self-reference uses fixed-point machinery to construct sentences whose content concerns their own provability [1]. LITE uses the same broad arithmetical infrastructure to obtain an indexed family of formulas—one for each natural-number input—and makes the function's output sensitive to bounded PA proofs of those formulas or their negations:

*   **Input-indexed family:** At input $n$, LITE constructs a sentence $\varphi_\beta(n)$ containing the fixed-point index $\beta$ and the numeral for $n$.
*   **Bounded decision:** It checks a finite, decidable proof-search predicate for $\varphi_\beta(n)$ and for $\neg \varphi_\beta(n)$.
*   **Adaptive output:** The two search bits select a prioritized branch of a fixed total computable function.

The family need not couple different inputs. A target sentence $\varphi_\beta(k)$ can mention earlier values $f(0),\ldots,f(k-1)$ only when the chosen formula template explicitly encodes such a relation. The general LITE theorem requires no recurrence from one input to the next.

### 1.3. What This Means for Arithmetic

LITE shows that arithmetic can represent a program that tests bounded provability claims about its own presentation and incorporates the resulting bits into its output:

*   **Fixed but branch-sensitive:** The function is fixed by its parameters and index, while evaluation follows proof-dependent branches.
*   **Finite self-monitoring:** Every proof search terminates at its declared bound.
*   **Parameterized self-reference:** A computable family of self-referential formulas supplies distinct checks at distinct inputs.

The sections below give the construction, prove totality and computability, and state its exact relation to Property R, DSROs, SPAP, and physical PU models.

## 2. Preliminaries

### 2.1. Peano Arithmetic and Gödel Encoding

LITE uses classical **Peano Arithmetic (PA)** together with an acceptable effective numbering of programs and a fixed effective encoding of PA syntax and proofs. Its language contains symbols for zero, successor, addition, multiplication, and the usual first-order logical apparatus. Through Gödel coding, finite formulas and proofs are represented by natural numbers:

**Definition 1 (Gödel Coding):** Fix an effective one-to-one coding $\langle\cdot\rangle:\Sigma^*\to\mathbb N$ of finite syntactic expressions in the language of PA. We use $\ulcorner\psi\urcorner$ for the code of a formula $\psi$.

**Definition 2 (Proof Predicate):** The primitive-recursive relation $Prf(p,c)$ holds exactly when $p$ codes a valid PA proof whose concluding formula has code $c$ [2, 3]. We write $Prf(p,\ulcorner\psi\urcorner)$ when the target is a particular formula $\psi$.

This apparatus lets PA formulas refer to codes of formulas, proofs, and represented computations. The fixed-point construction below supplies the self-referential program presentation.

### 2.2. Bounded Proof Search

Central to LITE is a finite search controlled by a total computable function $g:\mathbb N\to \mathbb N$. Monotonicity is optional.

**Definition 3 (Bounded Proof Search Predicate):** For a formula $\psi$ and a bounding function $g:\mathbb N\to\mathbb N$, the **bounded proof search predicate** $Prf_{\le g(n)}(\ulcorner\psi\urcorner)$ asserts the existence of a proof $p$ for $\psi$ whose Gödel code $p$ satisfies $p\le g(n)$. Formally:
$$
Prf_{\le g(n)}(\ulcorner\psi\urcorner)
\equiv \exists p\le g(n)\,Prf(p,\ulcorner\psi\urcorner).
\tag{1}
$$

For fixed $n$ and $c$, this is a finite decision procedure: test $Prf(p,c)$ for $p=0,\ldots,g(n)$. Thus $(n,c)\mapsto Prf_{\le g(n)}(c)$ is computable, and it is primitive recursive when $g$ is primitive recursive. The numerical-code convention above can equivalently be replaced by a declared proof-word length bound; resource estimates must specify which convention and encoding they use.

### 2.3. The Recursion Theorem

An essential ingredient is **Kleene's Second Recursion Theorem**, which supplies a program index whose behavior can depend on that same index.

**Theorem 1 (Kleene's Second Recursion Theorem):** Let $\{\phi_e\}_{e\in\mathbb N}$ be an acceptable enumeration of the partial computable functions $\mathbb N\to \mathbb N$. For every total computable operator $\Psi:\mathbb N\times\mathbb N\to \mathbb N$, there is an index $\beta$ such that, for every $n\in\mathbb N$,
$$
\phi_\beta(n) = \Psi(\beta, n)
$$

*Proof sketch:* Apply the parameter theorem to the partial computable map $(a,n)\mapsto\Psi(\phi_a(a),n)$. It supplies a total computable function $s$ whose value $s(a)$ indexes the $n$-section of that map. If $\hat s$ indexes $s$, then $\beta=s(\hat s)=\phi_{\hat s}(\hat s)$ satisfies $\phi_\beta(n)=\Psi(\beta,n)$ [2].

Here $\beta$ is a program index in the accepted numbering. LITE uses ordinary computable operations to insert the numeral for that index into a PA formula. The theorem resolves the circularity at the level of program presentation; it is not a consistency theorem for PA and does not assert that PA proves every semantic fact about the resulting program.

## 3. LITE Construction

### 3.1. Main Definition

At the heart of LITE is a function $f:\mathbb N\to\mathbb N$. Let $g,H_1,H_2:\mathbb N\to\mathbb N$ be total computable functions. Let $Sub(x,y,z)$ be the standard primitive-recursive operation that substitutes the numeral for $y$ at the free occurrences of the variable whose code is $z$ in the formula coded by $x$. Let $x_u$ and $x_v$ be distinct object-language variables with Gödel codes $u$ and $v$, and fix a PA formula template $FormTemplate(x_u,x_v)$ whose only free variables are $x_u$ and $x_v$. Define
$$
c_{\alpha,n}
=Sub\!\left(Sub\!\left(\ulcorner FormTemplate(x_u,x_v)\urcorner,\alpha,u\right),n,v\right),
$$

and let $\varphi_\alpha(n)$ be the sentence with code $c_{\alpha,n}$. Thus the template receives both the candidate program index $\alpha$ and the input $n$; the map $(\alpha,n)\mapsto\ulcorner\varphi_\alpha(n)\urcorner$ is computable. The totality theorem below holds for every such template. For the DSRO and Property-R capability interpretation, impose the additional specialization that $FormTemplate(x_u,x_v)$ represents a property of the computation indexed by $x_u$ on input $x_v$.

The LITE function $f$ is defined via the fixed point $\beta$ of the operator $\Psi$ described in Theorem 2 (Section 6.5), satisfying:
$$
f(n)=
\begin{cases}
n+H_1(n),
&\text{if }Prf_{\le g(n)}(\ulcorner\varphi_\beta(n)\urcorner),\\
n+H_2(n),
&\text{if }\neg Prf_{\le g(n)}(\ulcorner\varphi_\beta(n)\urcorner)
\land Prf_{\le g(n)}(\ulcorner\neg\varphi_\beta(n)\urcorner),\\
n+1,
&\text{otherwise}.
\end{cases}
\tag{2}
$$

Here:

*   $Prf_{\le g(n)}$ is the bounded proof-search predicate (Definition 3, Equation (1)).
*   $\varphi_\beta(n)$ is the specific PA sentence whose Gödel code $\ulcorner\varphi_\beta(n)\urcorner$ depends computably on $n$ and the program index $\beta$ of $f$ itself. On the DSRO specialization, it asserts a represented property of the computation $\phi_\beta(n)$.
*   $H_1(n)$ and $H_2(n)$ are the chosen total computable offsets used by the two proof-sensitive branches. They need not differ from the default offset $1$ or from each other.
*   The third case, "otherwise," covers the situation where neither $Prf_{\le g(n)}(\ulcorner\varphi_\beta(n)\urcorner)$ nor $Prf_{\le g(n)}(\ulcorner\neg\varphi_\beta(n)\urcorner)$ holds.
*   **Priority and consistency:** The explicit negation of the first search condition makes the displayed branches mutually exclusive even if the underlying proof system is inconsistent. If $\operatorname{Con}(\mathrm{PA})$ holds, the two unprioritized proof-search predicates cannot both hold. Neither fact is needed to show that the prioritized algorithm returns exactly one value.

The Recursion Theorem supplies an index $\beta$ for which $\phi_\beta(n)=\Psi(\beta,n)$, where $\Psi$ computes the displayed piecewise rule. Setting $f=\phi_\beta$ therefore yields a total computable function with a self-referential presentation. PA can represent the relevant syntax, proof predicate, and finite computations. This metatheoretic construction does not assert the consistency of PA.

### 3.2. Branch Selection by Bounded Proof Search

For each input $n$, the two finite searches return Boolean values $B_1(n)$ and $B_2(n)$. The prioritized pair $(B_1(n),B_2(n))$ selects $n+H_1(n)$, $n+H_2(n)$, or $n+1$. “Discovery” here means success of the specified algorithm within the declared bound; it is not an external event that changes $f(n)$ after the fact.

The formula template controls whether target sentences at different inputs are logically coupled. It may assert only a local property of $\phi_\beta(n)$, or it may explicitly mention values at other inputs, finite traces, averages, or other computable relations. Such a relation does not turn evaluation order into a temporal update rule; it changes the formulas whose bounded provability controls the branches.

### 3.3. Input-Indexed Evaluation

Evaluating the sequence in increasing input order is a convenient presentation, but Equation (2) defines $f(n)$ independently for every $n$ once the fixed parameters are chosen. If $g$ is increasing, later inputs search larger numerical proof-code domains. This can produce long runs of the default branch and isolated proof-sensitive branches. It does not mean that the PA proof set grows with $n$, and a template that relates several inputs creates a logical relation rather than a causal dependence on evaluation order.

## 4. Properties

### 4.1. Totality

Theorem 2 proves that Equation (2) defines a total computable function $f:\mathbb N\to\mathbb N$ for every choice of total computable $g,H_1,H_2$ and every fixed two-variable template satisfying Section 3.1.

**Dynamism:** Like every computable function, LITE has a fixed definition. Its distinctive feature is that its computation performs bounded syntactic searches concerning its own index and branches on their results.

**Rich structure:** Suitable templates can impose logical relations among multiple values of $f$ and thereby create complex sequences. Even without such relations, the distribution of bounded proofs across the indexed family can produce irregular branch patterns.

## 5. Significance

### 5.1. Extending Gödel’s Legacy

Gödel's incompleteness theorems revealed the power and limits of arithmetized syntax and fixed points [1]. LITE uses related machinery to let the computable family $\{\varphi_\beta(n)\}_{n\in\mathbb N}$ govern the branch choices of one total computable function. This is a constructive use of self-reference; it is not itself a new incompleteness theorem.

### 5.2. Bridging Proof Discovery and Function Values

*   **Local Proof Checks:** Instead of relying on global reflection principles (asserting provability implies truth), LITE uses concrete, bounded proof-search predicates ($Prf_{\le g(n)}$) to select the function $f$'s branch at each input $n$.
*   **Unified formalism:** Gödel coding and PA proof verification provide the arithmetical layer, while the Recursion Theorem provides the computability-theoretic fixed point. No reflection principle such as $Prov_{PA}(\ulcorner \psi \urcorner)\to \psi$ is assumed.

### 5.3. Deeper View of Arithmetic’s Expressive Power

On the indexed-computation template specialization, bounded proof verification gives $f$ a syntactic self-monitoring branch. This shows that ordinary arithmetic can represent adaptive branch logic involving its own coded presentations. Turning such a presentation into a physically reliable, resource-bounded predictor on the certified PU route requires the implementation conditions stated in Theorems A.0.2 and A.0.6.

## 6. Formal Analysis

### 6.1. Evaluation Logic

For any requested input $n$, the computation proceeds as follows:

1.  **Input $n$:** Consider the specific sentence $\varphi_\beta(n)$, which contains the program index $\beta$ of $f$.
2.  **Bounded Search:** Perform two finite searches:
    *   Search 1: Check whether $\exists p_1\le g(n)\,Prf(p_1,\ulcorner\varphi_\beta(n)\urcorner)$. Let the result be $B_1$.
    *   Search 2: Check whether $\exists p_2\le g(n)\,Prf(p_2,\ulcorner\neg\varphi_\beta(n)\urcorner)$. Let the result be $B_2$.
3.  **Branching Logic (following Equation (2)):**
    *   If $B_1$ is True, set $f(n) = n + H_1(n)$.
    *   Else if $B_2$ is True (and thus $B_1$ is False by the structure of Equation (2)), set $f(n) = n + H_2(n)$.
    *   Else (if $B_1$ is False and $B_2$ is False), set $f(n) = n + 1$.
4.  **Return:** Output the selected value. A template may encode logical relations among several inputs, but evaluation at $n$ still performs only the two searches specified for $n$.

### 6.2. Potentially Complex Behavior

Although $f$ is total and computable (Theorem 2), direct evaluation can be expensive. Long stretches on the default branch occur when neither target has a proof code at most $g(n)$; a proof-sensitive branch is selected where one of the bounded searches succeeds. Its numerical output may still coincide with another branch's output if the chosen offsets coincide. The sequence depends on the formula template, the bound $g$, the output functions $H_1,H_2$, the proof calculus, and the chosen encodings. Claims about average-case hardness, independence, or asymptotic branch frequency require separate proofs for a specified parameter choice.

### 6.3. Governed by Proof Bounds

The branch at $n$ is governed entirely by two finite searches bounded by $g(n)$. If $g$ is increasing, the numerical search domain is nested, although the target sentence generally changes with $n$. Consequently a proof found for $\varphi_\beta(n)$ says nothing by itself about $\varphi_\beta(n+1)$. The proof calculus remains fixed throughout.

### 6.4. Concrete Example

**Example 1 (Illustrative LITE Function):**
To make LITE more tangible, let us consider a simplified illustrative instance:

*   **Bounding Function:** Define $g(n) = 2^{n+1}$. This total computable function grows exponentially.
*   **Branch Offsets:** Let $H_1(n) = 10$ and $H_2(n) = 20$ (constants). These are total computable.
*   **Formula Template:** Let $FormTemplate(x_u,x_v)$ assert that the program indexed by $x_u$, when run on input $x_v$, halts and outputs a value greater than $x_v+5$. Using fixed PA formulas representing Kleene's primitive-recursive $T$-predicate $T(e,x,y)$ and output-extraction function $U(y)$ [2, Section 58], take
    $FormTemplate(x_u,x_v)\equiv\exists y\,[T(x_u,x_v,y)\land U(y)>x_v+5]$.
    Substituting the numerals for $\beta$ and $n$ gives
    $\varphi_\beta(n)\equiv\exists y\,(T(\bar\beta,\bar n,y)\land U(y)>\bar n+5)$. The bars denote the corresponding PA numerals. The Gödel code $\ulcorner\varphi_\beta(n)\urcorner$ is computable from $\beta$ and $n$ using the $Sub$ function.

For any input $n$, the output is given exactly by the following branch table:

| $B_1(n)$ | $B_2(n)$ | Selected output |
| :---: | :---: | :--- |
| true | either value | $n+10$ |
| false | true | $n+20$ |
| false | false | $n+1$ |

The first row records the priority rule. Under $\operatorname{Con}(\mathrm{PA})$, the combination $B_1(n)=B_2(n)=\mathrm{true}$ cannot occur. The table is conditional; it does not assert that either proof-sensitive branch occurs for this template. In particular, the self-referential content can constrain which bounded proof patterns are possible.

### 6.5. Formal Structure Implementation via Recursion Theorem

**Theorem 2 (Totality and Computability of LITE Function):**
Assume that $g,H_1,H_2$ are total computable functions. Then the function $f$ defined by Equation (2) exists, is total, and is computable.

*Formal Proof Outline:*

1.  **Lemma 1: The Operator $\Psi$ is Total Computable.**
    Define $\Psi: \mathbb N \times \mathbb N \to \mathbb N$ as follows. Given inputs $\alpha$ (potential function index) and $n$, $\Psi(\alpha, n)$ performs these steps:

    *   **Preparation:** Compute $g(n)$, $H_1(n)$, and $H_2(n)$.
    *   **Target code:** Construct $c_{\alpha,n}=\ulcorner\varphi_\alpha(n)\urcorner$ by substituting both $\alpha$ and $n$ into the fixed two-variable template.
    *   **First search:** Determine the truth value $B_1$ of $\exists p\le g(n)\,Prf(p,c_{\alpha,n})$.
    *   **Negated target:** Construct $d_{\alpha,n}=\ulcorner\neg\varphi_\alpha(n)\urcorner$.
    *   **Second search:** Determine the truth value $B_2$ of $\exists p\le g(n)\,Prf(p,d_{\alpha,n})$.
    *   **Branch:** Return the result selected by $B_1,B_2$:

        *   If $B_1$, output $n + H_1(n)$.
        *   Else if $B_2$, output $n + H_2(n)$.
        *   Else, output $n + 1$.

    Since each step involves only total computable functions and finite searches over decidable predicates, the entire procedure for $\Psi(\alpha, n)$ halts and produces a unique natural number for all $\alpha, n$. Thus, $\Psi$ is total computable.

2.  **Lemma 2: Existence of the Fixed Point $\beta$.**
    Since $\Psi$ is a total computable function (by Lemma 1), Kleene's Second Recursion Theorem (Theorem 1) guarantees the existence of an index $\beta \in \mathbb N$ such that for all $n \in \mathbb N$, the partial computable function $\phi_{\beta}$ satisfies $\phi_{\beta}(n) = \Psi(\beta, n)$.

3.  **Lemma 3: The LITE function $f = \phi_{\beta}$ is Total.**
    We define the LITE function $f$ as $f = \phi_{\beta}$. By definition, $f(n) = \Psi(\beta, n)$ for all $n$. Since $\Psi$ is total (by Lemma 1), $\Psi(\beta, n)$ is defined and yields a natural number for all $n$. Therefore, $f(n)$ is defined for all $n \in \mathbb N$, meaning $f$ is a total function.

4.  **Conclusion: $f$ is Total Computable.**
    From Lemma 3, $f$ is total. Since $f=\phi_\beta$, it is computable. The fixed point justifies the self-referential presentation; no consistency assumption is needed for this conclusion. ∎

## 7. Relation to the Predictive Universe Framework

### 7.1. Property R and DSROs

LITE realizes three logical capabilities associated with Property R:

1.  **Representation:** Gödel coding represents a program, its inputs, indexed target sentences, and finite PA proofs as manipulable natural numbers.
2.  **Bounded syntactic reasoning:** The program constructs its own indexed target sentence and executes finite proof checks. On the $T$-predicate specialization, the target sentence represents a claim about an indexed execution; the LITE evaluator itself still performs proof verification rather than unrestricted simulation.
3.  **Predicate evaluation and response:** The two proof-search predicates control a computable output branch.

On the indexed-computation template specialization stated in Section 3.1, this makes LITE a concrete arithmetical DSRO in the sense of Definition 11, Theorem A.1.5, and Theorem A.4.1. It establishes an existence example for bounded adaptive self-reference in a familiar formal setting. Definition 10, Proposition 2, and Appendix A.0 state the finite Property-R subcapacity in terms of coding, an implementable interpreter, uniform finite-program composition, Boolean post-processing, and logical memory. Theorems 10–11 separately assume the applicable deterministic or probabilistic uniform diagonal closure; that closure is not supplied merely by labeling a model class Property R. Totality of LITE does not require $\operatorname{Con}(\mathrm{PA})$; using PA as the formal system $\mathcal F$ in Definition 10 separately adopts that definition's consistency premise.

### 7.2. Separation from SPAP

LITE and SPAP use related fixed-point infrastructure but prove different statements. LITE proves that one self-referential function exists and is total computable. Deterministic SPAP (Theorem 10) excludes a predictor that is perfectly correct on every member of a model class with a nominated binary component and uniform diagonal closure. Probabilistic SPAP (Theorem 11) assumes its own uniform diagonal closure together with finite representation of the reported marginal, threshold decidability, and closure under the selected Bernoulli construction. A total LITE function therefore does not evade or contradict SPAP, and LITE alone does not establish either SPAP theorem.

### 7.3. Finite Resource Envelope

The finiteness claim can be made explicit once a proof encoding and verifier are fixed. Definition 3 uses a numerical proof-code cutoff $p\le g(n)$, which examines $g(n)+1$ candidate codes. Theorem A.4.1c instead uses the alternative length-bounded presentation noted after Definition 3. For that presentation, write $G=g_{\ell}(n)$ for the maximum binary candidate length, let $L_n$ be the greater of the two target-code lengths, and let the explicit polynomials $q(G,L)$ and $s(G,L)$ bound the size and workspace of a uniform proof-verifier circuit. If $q_{\mathrm{prep}}(n)$ and $s_{\mathrm{prep}}(n)$ cover construction of the bound, target codes, and output values, exhaustive parallel search has size

$$
q_{\mathrm{prep}}(n)
+2(2^{G+1}-1)q(G,L_n)
+O(2^G G+L_n),
\tag{3}
$$

while a sequential implementation has workspace

$$
O\!\left(s_{\mathrm{prep}}(n)+G+L_n+s(G,L_n)\right).
\tag{4}
$$

These are encoding-relative upper bounds, not optimality claims. On a PU branch already carrying an accepted QEC compatibility certificate, supplied directly or through an accepted Golay-QEC bootstrap record, together with the protected universal-gate ledger, working memory, code overhead, and finite-execution record required by Theorem A.0.6, a finite verifier circuit can be reversibly compiled with the certified overhead. Equations (3)–(4) do not populate those physical certificates.

### 7.4. Generalizations

*   **Other theories:** The construction applies to any effectively axiomatized theory with decidable proof verification and enough syntax coding. Proof bounds cannot be compared across theories without fixing their proof systems and encodings.
*   **Other bounds:** If $\widetilde g(n)\ge g(n)$ pointwise for the same fixed target code, the numerical candidate domain for $\widetilde g$ contains the domain for $g$. Across distinct LITE instances, however, changing the bound generally changes the fixed-point index and hence the target sentences, so no monotonicity of proof-sensitive branches follows.
*   **Other templates:** Templates can express local output properties, finite-trace properties, or explicit relations among several inputs.
*   **Other verifier transformers:** Corollary A.4.1b states that every total computable verifier transformer $\mathsf V(e,n)$ has an index $\beta$ satisfying $\phi_\beta(n)=\mathsf V(\beta,n)$. This fixed-point presentation proves neither verifier minimality nor machine-independent description complexity. It does not identify $c_{\min}$ with $K_0$, establish $K_0=3$, replace the hierarchy defining $C_P$, discharge the operational alignment conditions for $\hat C_v$ in Theorem 2 and Appendix D, or identify the presentation with $R$ or $R_I$.
*   **Model-indexed LITE:** Appendix A.5.6a defines a distinct predictor- and phase-indexed proof-access construction with active and historical admissibility relations and outputs consisting of an admitted labeled proof or $\bot$. The construction in this article instead uses the global PA proof predicate fixed in Definition 2.

### 7.5. Comparison with Related Fixed-Point Uses

| Framework | Self-reference mechanism | Result |
| :--- | :--- | :--- |
| Gödel sentence | A fixed arithmetical sentence refers to its own provability | Incompleteness under the theorem's stated hypotheses |
| Rosser sentence | A fixed sentence compares proofs of itself and its negation | Incompleteness under weaker consistency assumptions |
| Reflection principle | An added schema relates provability to the asserted formula | A stronger theory, subject to the chosen schema |
| Kleene recursion theorem | A program presentation receives its own index | Existence of a computable fixed-point presentation |
| LITE | An input-indexed formula family and two bounded proof checks | One total computable self-referential branch function |
| SPAP | A coded model class uniformly closed under predictor-dependent, fixed-point-free diagonal responses | No universal perfect predictor on that retained class |

### 7.6. Scope

*   **Parameter and encoding dependence:** There is no canonical LITE function or canonical numerical proof bound. The fixed-point index is effectively obtainable relative to an acceptable numbering, but it is numbering-dependent and may be impractically large.
*   **Computability versus efficiency:** Every individual search terminates. That does not make exhaustive evaluation practical, nor does it establish an average-case complexity classification.
*   **Consistency:** Totality and computability use the priority rule, not $\operatorname{Con}(\mathrm{PA})$. Consistency excludes simultaneous proofs of a target and its negation and is separately part of Definition 10 when PA is chosen as its formal system $\mathcal F$.
*   **Semantic and independence claims:** The construction checks proof syntax; it assumes no global soundness or reflection principle. Long-run behavior or PA-independence requires a separate theorem for the chosen parameters.
*   **Physical realization:** An MPU is a physical predictive carrier, not an arithmetical function. Effective Operational Property R for an MPU network is the separate conditional result of Theorems A.0.2 and A.0.6. It requires the refresh, reduced-cost, Dominant Cost Convexity, and robustness hypotheses selecting a certified $p_{\mathrm{err}}^*<1/2$; an accepted QEC compatibility certificate, supplied directly or through an accepted Golay-QEC bootstrap record; and the working-memory, protected-gate, code-overhead, and finite circuit-execution resources registered for the protected window.

## 8. Conclusion

LITE combines Gödel coding, finite proof verification, computable auxiliary functions, and Kleene's Second Recursion Theorem to construct a total computable function whose output branch depends on bounded PA proofs about a formula containing its own index. The function is fixed once its parameters and fixed-point presentation are fixed; its adaptive character lies in the self-referential computation used to evaluate each input.

Within PU, the indexed-computation template specialization is a logical existence example for DSRO-style bounded self-monitoring and for parts of the Property-R capability profile. SPAP's class-level diagonal obstructions and the physical realization of Effective Operational Property R remain separate, hypothesis-bearing results.

## 9. References

[1] Gödel, K. (1931). Über formal unentscheidbare Sätze der Principia Mathematica und verwandter Systeme I. *Monatshefte für Mathematik und Physik*, 38(1), 173–198. doi:10.1007/BF01700692

[2] Kleene, S. C. (1952). *Introduction to Metamathematics*. North-Holland Publishing Company, Amsterdam. ISBN: 978-0720421033.

[3] Mendelson, E. (2015). *Introduction to Mathematical Logic* (6th ed.). CRC Press. ISBN: 978-1482237726.
