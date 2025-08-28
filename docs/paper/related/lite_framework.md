
*This paper details the Look In The Eye (LITE) framework, providing a rigorous demonstration within Peano Arithmetic (PA) of dynamic self-referential computation. LITE constructs an arithmetical function whose behavior adapts based on the discovery of bounded proofs about itself. This formally illustrates the type of sophisticated, reflexive computational mechanism required by foundational aspects of the Predictive Universe (PU) framework, such as Property R (computational richness enabling self-simulation and evaluation) and the logic underpinning the Self-Referential Paradox of Accurate Prediction (SPAP) and Dynamic Self-Reference Operators (DSROs). By showing that standard arithmetic can support such evolving, self-monitoring structures, LITE strengthens the logical plausibility of the computational capabilities presupposed for Minimal Predictive Units (MPUs) within the PU model.*


# LITE: Dynamic Self-Reference in Peano Arithmetic

## Abstract

The Look In The Eye (LITE) framework demonstrates how a system within Peano Arithmetic (PA) can exhibit a dynamic, evolving self-referential structure. By leveraging strong self-reference techniques (via the Recursion Theorem) and bounded proof searches (formalized within PA), LITE reveals a feedback mechanism in which an arithmetical function *updates* its values upon discovering new proofs or refutations about its own behavior. This iterative mechanism challenges the notion that formal arithmetic is merely static, showing instead that PA can support unfolding, adaptive processes guided by proof discoveries. We prove the resulting function is total and computable and discuss inherent computational intractability and potential unpredictability. LITE thus broadens our perspective on definability, self-reference, and how “mathematics can respond to itself” through a carefully orchestrated interplay of function definitions and proof predicates.

## 1. Introduction

### 1.1. The Traditional View: Formal Arithmetic as Static

Historically, many areas of mathematics—such as dynamical systems, ergodic theory, and chaos theory—have dealt extensively with evolving or changing phenomena. However, *within* the framework of **formal arithmetic** (like Peano Arithmetic, PA), the standard approach has often been seen as “static”: once definitions, axioms, and theorems are established, their logical status does not spontaneously shift in response to newly discovered proofs *about* those very definitions. In other words, arithmetic does not typically include a built-in mechanism that causes the system itself to “recompute” or “update” function values based on fresh derivations. Throughout this paper, we make the standard assumption that PA is consistent, denoted Con(PA).

By focusing on **dynamic self-reference** specifically in Peano Arithmetic, the **LITE (Look In The Eye)** framework aims to show that we can incorporate a kind of “feedback loop” directly into the definition of an arithmetical function—without adding new axioms or stepping outside classical PA. This requires assuming the underlying auxiliary functions used in the construction (specifically $g, H_1, H_2$ introduced later) are total computable functions. This approach neither denies nor contradicts the broader history of mathematics involving evolving processes; rather, it highlights how even a traditionally “static” formal theory can be made to adapt its outputs when short proofs about its own behavior appear.

*   **Static Tradition in PA:** Traditional treatments of formal arithmetic seldom integrate a mechanism to automatically change function values in light of new proofs about those functions, keeping definitions fixed once given.
*   **Contrast with Other Fields:** In dynamical systems, geometry, or even certain parts of proof theory, “change” and iteration are commonplace. This paper shows a parallel possibility inside *Peano Arithmetic* itself.
*   **The LITE Perspective:** By constructing a function that checks for short proofs of statements referencing its own code, LITE bridges the gap between “static” arithmetical foundations and the adaptive spirit found in other branches of mathematics.

### 1.2. A Fresh Angle on Self-Reference

Classical Gödelian self-reference focuses on the existence of certain sentences (“I am not provable in PA”) whose truth and provability statuses intertwine in profound ways [1]. LITE extends this tradition by allowing *infinitely many* self-referential statements—one for each natural number input—and by making the function’s value at each step sensitive to whether these statements (or their negations) are provably derivable within specific bounded lengths:

*   **Iterative Aspect:** At each input $n$, LITE inspects a statement $ϕ(n)$ referencing the function itself and checks (within a fixed proof-length bound) for a derivation of $ϕ(n)$ or its negation.
*   **Adaptive Definition:** If either is found, the function $f(n)$ “shifts” in a prescribed manner. If not, it follows a default path.
*   **Dynamic Self-Reference:** Because $f$ can change, new proofs that appear down the line may further alter its trajectory, creating a fully *iterative* feedback loop.

In bridging the power of the Recursion Theorem with bounded searches for proofs, LITE creates a genuinely adaptive structure. Instead of a single diagonal that remains inert, LITE’s approach is to generate a family of statements whose provability shapes the next stage of $f$’s definition.

### 1.3. What This Means for Arithmetic

LITE reveals that arithmetic can “listen” to whether a statement about itself is provable (or refutable) within specific short-proof bounds, then incorporate that discovery into its own next step. This viewpoint transforms our usual conception of arithmetic:

*   **From Static to Dynamic:** The values of $f(n)$ are not predetermined by a closed-form or fixed recursion; instead, they can adapt in real time as proofs emerge.
*   **Embedding Feedback Loops:** By referencing its own code and bounding proof lengths, $f$ exemplifies a system that self-monitors and self-updates, all within standard PA.
*   **Richer Self-Reference:** Unlike single-shot sentences, we now have an entire sequence of self-referential statements guiding these internal changes.

The sections below lay out how LITE is formally constructed, the mathematical details that ensure its consistency, and why it broadens the frontier of arithmetical definability and self-reference.

## 2. Preliminaries

### 2.1. Peano Arithmetic and Gödel Encoding

LITE rests on classical **Peano Arithmetic (PA)**. Its language comprises symbols for 0, successor ($S(⋅)$), addition, multiplication, and ordering, along with the usual logical machinery (first-order logic with equality). As stated in Section 1.1, we assume Con(PA). Through *Gödel numbering*, every finite string (be it a formula or proof) is encoded as a natural number:

**Definition 1 (Gödel Coding):** A bijection $⟨·⟩: Σ^* → ℕ$ assigns unique natural number codes to syntactic expressions (formulas, proofs, terms) in the language of PA, enabling arithmetic to reason about its own syntax numerically. We use $⌈ψ⌉$ to denote the Gödel code of a specific formula $\psi$.

**Definition 2 (Provability Predicate):** Within PA, the relation $Prf(p, c)$ is definable by a primitive recursive formula (often denoted $\mathtt{Prf}(p, c)$) (Mendelson 2015; Kleene 1952). It asserts that the natural number $p$ is the Gödel code of a valid PA proof of the formula whose Gödel code is $c$. We write $Prf(p, ⌈ψ⌉)$ when $c$ is the Gödel code of a specific formula $\psi$.

With this apparatus, statements in arithmetic can *self-reflect*: they can contain references to codes of formulae and proofs, including statements about the function $f$ we aim to define.

### 2.2. Bounded Proof Search

Central to LITE is the notion of checking for a proof within a specific size bound, controlled by a total computable, typically increasing, function $g: ℕ → ℕ$.

**Definition 3 (Bounded Proof Search Predicate):** For a formula $\psi$ and a bounding function $g: ℕ → ℕ$, the **bounded proof search predicate** $Prf_{\le g(n)}(⌈ψ⌉)$ asserts the existence of a proof $p$ for $\psi$ whose Gödel code $p$ satisfies $p \le g(n)$. Formally:
$$
Prf_{\le g(n)}(⌈ψ⌉) \equiv ∃p \le g(n) \, Prf(p, ⌈ψ⌉) \quad \text{(1)}
$$
Checking $Prf_{\le g(n)}(⌈ψ⌉)$ for fixed $n$ is a finite procedure, as it involves checking the decidable predicate $Prf(p, ⌈ψ⌉)$ for only finitely many values $p \in \{0, 1, ..., g(n)\}$. Since $Prf$ is primitive recursive and bounded quantification preserves this property (when the bound $g(n)$ is computable), the predicate $Prf_{\le g(n)}(c)$ is decidable for each $n, c$. Moreover, the relation $R(n, c) \equiv Prf_{\le g(n)}(c)$ is computable (and indeed primitive recursive if $g$ is). If no proof $p \le g(n)$ exists, the search terminates without success; if one exists, it is eventually identified. This bounding technique makes the entire process definable *inside* PA and ensures that checking these proofs does not require stepping outside the system.

By coupling $g(n)$ with the function we define, LITE effectively “asks” at each stage whether certain statements can be proven (or refuted) under that growing size limit. This local proof search is the engine of the dynamic update process.

### 2.3. The Recursion Theorem

An essential ingredient is the **Recursion Theorem**, which guarantees that a function can validly reference its own code without inconsistency.

**Theorem 1 (Kleene's Second Recursion Theorem):** For any total computable function (operator) $\Psi: ℕ \times ℕ \to ℕ$, there exists a natural number (index) $\beta$ such that for all $n \in ℕ$, the partial computable function $φ_β$ with index $\beta$ satisfies:
$$
φ_β(n) = \Psi(\beta, n)
$$
*Proof:* See standard texts on computability theory, Kleene 1952.

By interpreting $\beta$ as the “Gödel code of $f$,” we obtain a legitimate self-referential definition: $f$ can talk about $f$. In LITE, this theorem underpins how the formula $ϕ(n)$ can explicitly mention properties related to the value $f(n)$ itself, enabling the dynamic interplay between proof discovery and numeric values.

## 3. LITE Construction

### 3.1. Main Definition

At the heart of LITE is a function $f: ℕ → ℕ$. We define $f$ using the Recursion Theorem (Theorem 1) applied to an operator $\Psi(\alpha, n)$ that implements the following case distinction. Let $g: ℕ → ℕ$, $H_1: ℕ → ℕ$, and $H_2: ℕ → ℕ$ be predefined total computable functions. Let $Sub(x, y, z)$ be the standard primitive-recursive substitution function yielding the Gödel code of the formula obtained by substituting the numeral for $y$ into the formula with Gödel code $x$ at occurrences of the variable with code $z$. Let $v$ be the Gödel code of a designated free variable (e.g., 'x'). Let $FormTemplate(v)$ be a PA formula with one free variable $v$. We define $ϕ_{\alpha}(n)$ as the formula whose Gödel code is $c_{\alpha, n} = Sub(⌈FormTemplate(v)⌉, \alpha, v)$. This formula $ϕ_{\alpha}(n)$ effectively asserts a property involving the function with index $\alpha$ evaluated at $n$ (as illustrated in Example 1). The mapping $(\alpha, n) \mapsto ⌈ϕ_{\alpha}(n)⌉$ is computable.

The LITE function $f$ is defined via the fixed point $\beta$ of the operator $\Psi$ described in Theorem 2 (Section 6.5), satisfying:
$$
f(n) = \begin{cases} n + H_1(n), & \text{if } Prf_{\le g(n)}(⌈ϕ_{\beta}(n)⌉) \\ n + H_2(n), & \text{if } \neg Prf_{\le g(n)}(⌈ϕ_{\beta}(n)⌉) \land Prf_{\le g(n)}(⌈¬ϕ_{\beta}(n)⌉) \\ n + 1, & \text{otherwise} \end{cases} \quad \text{(2)}
$$
Here:
*   $Prf_{\le g(n)}$ is the bounded proof search predicate (Definition 3, Equation 1).
*   $ϕ_{\beta}(n)$ is the specific PA formula whose Gödel code $⌈ϕ_{\beta}(n)⌉$ depends computably on $n$ and the code $\beta$ of $f$ itself, as constructed above. It makes an assertion about some property related to $f$.
*   $H_1(n)$ and $H_2(n)$ are the chosen total computable functions causing a "jump" if a proof/refutation is found within bound $g(n)$.
*   The third case, "otherwise," covers the situation where neither $Prf_{\le g(n)}(⌈ϕ_{\beta}(n)⌉)$ nor $Prf_{\le g(n)}(⌈¬ϕ_{\beta}(n)⌉)$ holds.
*   **Mutual Exclusivity Note:** The explicit condition $\neg Prf_{\le g(n)}(⌈ϕ_{\beta}(n)⌉)$ in the second case ensures the conditions are syntactically mutually exclusive. Under the assumption Con(PA), it is impossible for PA to prove both $ϕ_{\beta}(n)$ and $¬ϕ_{\beta}(n)$, meaning $Prf_{\le g(n)}(⌈ϕ_{\beta}(n)⌉)$ and $Prf_{\le g(n)}(⌈¬ϕ_{\beta}(n)⌉)$ cannot both be true. The structure respects this, prioritizing the first case.

Because of the Recursion Theorem, there is no logical contradiction in letting the formula $ϕ_{\beta}(n)$ refer to properties related to "the value of $f(n)$" (via code $\beta$), even though $f$ is simultaneously being defined by this piecewise rule. This yields a consistent, total function $f$ defined entirely within PA that dynamically "listens" for short proofs about itself at each input $n$.

### 3.2. Shifting Values Based on Proof Discovery

The novelty lies in how $f(n)$ is not predetermined by a simple recursive or closed-form expression. Instead, its value reacts if a sufficiently short proof ($p \le g(n)$) of $ϕ_{\beta}(n)$ or $¬ϕ_{\beta}(n)$ is discovered by the system. If such a proof is found, LITE “steers” the function value to $n + H_1(n)$ or $n + H_2(n)$, respectively (following the logic in Equation 2). If no such short proof is found, the function defaults to $f(n) = n + 1$.

Because the jump values $n + H_1(n)$ or $n + H_2(n)$ can be significantly different from the default $n+1$, this shift in $f(n)$ can potentially alter the truth value or, more crucially, the *provability within bounded resources* of subsequent statements $ϕ_{\beta}(n+1)$, $ϕ_{\beta}(n+2)$, etc. Over the sequence of natural numbers, $f$ thus evolves under the influence of the system’s ability to locate relevant short derivations, effectively “recording” the discovery of these proofs in its numeric output sequence.

### 3.3. Feedback Over the Natural Numbers

By design, each input $n$ extends the ongoing computation: “Is $ϕ_{\beta}(n)$ provable with proof $\le g(n)$? Is $¬ϕ_{\beta}(n)$ provable with proof $\le g(n)$?” The outcome of this bounded check determines $f(n)$, which in turn potentially influences the context for checks at $n+1, n+2, \dots$. This creates an *iterative feedback loop* throughout the natural numbers. No single instance $n$ necessarily “locks in” the entire future behavior of $f$; instead, each step can bring fresh shifts based on newly accessible derivations within the expanding proof bound $g(n)$. This iterative nature is the cornerstone of LITE’s dynamic self-reference.

## 4. Properties

### 4.1 Proposition 1 (Well-Defined and Total)

The function $f$ defined by Equation (2) via the Recursion Theorem is a well-defined, total function from $ℕ$ to $ℕ$.
*Proof:*
1.  **Consistency via Recursion Theorem:** Theorem 1 guarantees the existence of a consistent index $\beta$ such that $f(n) = \varphi_\beta(n) = \Psi(\beta, n)$ (where $\Psi$ is the operator implementing Equation 2, formally defined in Theorem 2, Section 6.5), resolving the self-reference without paradox.
2.  **Finite Search:** For any given $n$, the value $g(n)$ is finite. Checking for the existence of a proof $p \le g(n)$ for $ϕ_{\beta}(n)$ or $¬ϕ_{\beta}(n)$ using the decidable predicate $Prf(p, c)$ involves searching a finite set of potential proof codes $\{0, 1, ..., g(n)\}$. This is a finite computation.
3.  **Exhaustive and Mutually Exclusive Cases:** The definition (Equation 2) covers all possibilities based on the outcomes of the two bounded proof searches. The conditions are structured to be mutually exclusive:
    *   Case 1: $Prf_{\le g(n)}(⌈ϕ_{\beta}(n)⌉)$ holds.
    *   Case 2: $Prf_{\le g(n)}(⌈ϕ_{\beta}(n)⌉)$ fails AND $Prf_{\le g(n)}(⌈¬ϕ_{\beta}(n)⌉)$ holds.
    *   Case 3: Both $Prf_{\le g(n)}(⌈ϕ_{\beta}(n)⌉)$ and $Prf_{\le g(n)}(⌈¬ϕ_{\beta}(n)⌉)$ fail.
    These three conditions partition all possible outcomes of the finite searches. Exactly one condition must hold for any given $n$. (As noted in 3.1, Con(PA) implies Case 1 and the second conjunct of Case 2 cannot both be true).
4.  **Defined Output:** In each case, the definition assigns a specific natural number ($n+H_1(n)$, $n+H_2(n)$, or $n+1$) as the value of $f(n)$, using the assumed total computable functions $H_1, H_2$.
5.  **Totality:** Since $f(n)$ is uniquely defined via a terminating computation (finite search and case analysis) yielding a natural number for every $n \in ℕ$, $f$ is a total function. (Formal proof follows from Theorem 2). QED

**Dynamism:** Classic recursive functions typically have fixed definitions. In contrast, $f(n)$ as defined by LITE exhibits an intrinsic dynamism: its value at $n$ can shift based on the outcome of the bounded proof search regarding $ϕ_{\beta}(n)$. This "listening" for new derivations introduces an element of *adaptivity* dependent on the proof system's capabilities within the specified bounds.

**Rich Structure:** The value $f(n)$ can influence the provability (within bounds $g(k)$ for $k > n$) of subsequent statements $ϕ_{\beta}(k)$. This can lead to complex behavior: the sequence $f(0), f(1), f(2), \dots$ might exhibit long periods of following the default rule ($f(k) = k+1$) punctuated by sudden large jumps ($f(k) = k+H_1(k)$ or $k+H_2(k)$) when a relevant short proof becomes discoverable as $g(k)$ grows large enough.

## 5. Significance

### 5.1. Extending Gödel’s Legacy

Gödel’s incompleteness theorems revealed the power and limits of self-reference via single, carefully constructed statements [1]. LITE extends this legacy by demonstrating how an *infinite family* of self-referential statements $\{ϕ_{\beta}(n)\}_{n \in ℕ}$, indexed by input $n$, can collectively govern the evolving values of a single arithmetical function $f$. This moves beyond static fixed points to a dynamic, unfolding self-interaction.

### 5.2. Bridging Proof Discovery and Function Values

*   **Local Proof Checks:** Instead of relying on global reflection principles (asserting provability implies truth), LITE uses concrete, bounded proof search predicates ($Prf_{\le g(n)}$) to locally modulate the function $f$'s behavior at each step $n$.
*   **Unified Formalism:** The entire LITE mechanism—self-reference, bounded proof search, conditional function definition—is constructed entirely within standard Peano Arithmetic using definable predicates and the power of the Recursion Theorem, requiring no additional axioms or extensions to the theory.

### 5.3. Deeper View of Arithmetic’s Expressive Power

By embedding a form of "self-monitoring and update" protocol into the definition of $f$, LITE underscores that formal arithmetic possesses the capability to exhibit feedback and adaptation when its self-referential potential is carefully leveraged. This broadens the conventional understanding of what "arithmetical definability" can encompass, suggesting that arithmetic systems can model processes that respond dynamically to facts about their own provability landscape.

## 6. Formal Analysis

### 6.1. Iterative Construction Logic

The computation of $f(n)$ proceeds iteratively for each $n=0, 1, 2, \dots$:
1.  **Input $n$:** Consider the specific formula $ϕ_{\beta}(n)$ (which refers to the code $\beta$ of $f$).
2.  **Bounded Search:** Perform two finite searches:
    *   Search 1: Check if $∃p_1 \le g(n) \, Prf(p_1, ⌈ϕ_{\beta}(n)⌉)$. Let result be $B_1$ (True/False).
    *   Search 2: Check if $∃p_2 \le g(n) \, Prf(p_2, ⌈¬ϕ_{\beta}(n)⌉)$. Let result be $B_2$ (True/False).
3.  **Branching Logic (following Equation 2):**
    *   If $B_1$ is True, set $f(n) = n + H_1(n)$.
    *   Else if $B_2$ is True (and thus $B_1$ is False by the structure of Equation 2), set $f(n) = n + H_2(n)$.
    *   Else (if $B_1$ is False and $B_2$ is False), set $f(n) = n + 1$.
4.  **Potential Cascade:** The value $f(n)$ determined in this step becomes part of the definition used when evaluating $f(k)$ for $k > n$, potentially influencing the truth or bounded provability of $ϕ_{\beta}(k)$ and subsequent values via the construction of $ϕ_{\beta}(k)$.

### 6.2. Potentially Complex Behavior

Although $f$ is total and computable (Theorem 2), its behavior can be complex and potentially unpredictable without performing the explicit bounded proof searches at each step. Long stretches where $f(n) = n+1$ might occur if $ϕ_{\beta}(n)$ and $¬ϕ_{\beta}(n)$ require proofs longer than $g(n)$. Sudden jumps happen when $g(n)$ becomes large enough to encompass a previously too-long proof. The sequence of values $f(0), f(1), \dots$ depends intricately on the interplay between the chosen formula template $FormTemplate$, the growth rate of $g(n)$, the jump functions $H_1, H_2$, and the proof structure of PA.

### 6.3. Governed by Proof Bounds

The dynamic evolution is entirely governed by the sequence of finite proof searches bounded by $g(n)$. As $n$ increases, $g(n)$ typically grows (if $g$ is chosen to be increasing), expanding the horizon of discoverable proofs. This interplay between the expanding search bound and the iterative self-reference defined by $ϕ_{\beta}(n)$ and the Recursion Theorem is the essence of LITE’s dynamic character within a fixed formal system (PA).

### 6.4. Concrete Example

**Example 1 (Illustrative LITE Function):**
To make LITE more tangible, let us consider a simplified illustrative instance:

*   **Bounding Function:** Define $g(n) = 2^{n+1}$. This total computable function grows exponentially.
*   **Jump Functions:** Let $H_1(n) = 10$ and $H_2(n) = 20$ (constants). These are total computable.
*   **Formula Template:** Let $FormTemplate(v)$ be the PA formula template asserting *"The function coded by $v$, when run on input $n$, halts and outputs a value greater than $n+5$"*. Formally, using the Kleene T-predicate $T(e, x, y)$ (meaning program $e$ on input $x$ halts with computation coded by $y$) and the output extraction function $U(y)$ [2, Section 58]:
    $FormTemplate(v) \equiv ∃y [T(v, \underline{n}, y) \land U(y) > \underline{n}+5]$. (Here $\underline{n}$ represents the numeral for $n$, and $v$ is the free variable holding the function index).
    Then $ϕ_{\beta}(n)$ is the formula obtained by substituting the numeral for $\beta$ for $v$:
    $ϕ_{\beta}(n) \equiv ∃y [T(\underline{\beta}, \underline{n}, y) \land U(y) > \underline{n}+5]$. The Gödel code $⌈ϕ_{\beta}(n)⌉$ is computable from $\beta$ and $n$ using the $Sub$ function.

**Step-by-Step Evolution (Hypothetical Scenario):**

1.  **$n = 0$:**
    *   $g(0) = 2^1 = 2$. The system computes $⌈ϕ_{\beta}(0)⌉$ and $⌈¬ϕ_{\beta}(0)⌉$. It then checks if $Prf(0, ⌈ϕ_{\beta}(0)⌉)$, $Prf(1, ⌈ϕ_{\beta}(0)⌉)$, $Prf(2, ⌈ϕ_{\beta}(0)⌉)$ holds, and similarly for $¬ϕ_{\beta}(0)$.
    *   It seems extremely improbable that a proof or refutation of $∃y [T(\underline{\beta}, \underline{0}, y) \land U(y) > 5]$ could have a Gödel code $p \le 2$.
    *   Assume neither $Prf_{\le 2}(⌈ϕ_{\beta}(0)⌉)$ nor $Prf_{\le 2}(⌈¬ϕ_{\beta}(0)⌉)$ holds.
    *   **Result:** $f(0) = 0 + 1 = 1$. (Case 3 of Equation 2)

2.  **$n = 1$:**
    *   $g(1) = 2^2 = 4$. The system checks for proofs $p \in \{0, 1, 2, 3, 4\}$ for $ϕ_{\beta}(1) \equiv ∃y [T(\underline{\beta}, \underline{1}, y) \land U(y) > 6]$ and its negation $¬ϕ_{\beta}(1)$.
    *   Assume again that no such short proof exists.
    *   **Result:** $f(1) = 1 + 1 = 2$. (Case 3)

3.  **... (Suppose $f(k) = k+1$ for $k < 10$) ...**

4.  **$n = 10$:**
    *   $g(10) = 2^{11} = 2048$. Search for proofs $p \le 2048$.
    *   Suppose a PA proof $p_1$ with code $p_1 \le 2048$ is found for $ϕ_{\beta}(10) \equiv ∃y [T(\underline{\beta}, \underline{10}, y) \land U(y) > 15]$. This might occur if the specific structure of $f$ (determined by $\beta$) forces $f(10)$ to satisfy this property under certain conditions provable within PA.
    *   The condition $Prf_{\le 2048}(⌈ϕ_{\beta}(10)⌉)$ is met ($B_1$ is True).
    *   **Result:** $f(10) = 10 + H_1(10) = 10 + 10 = 20$. (Case 1)

5.  **$n = 11$:**
    *   $g(11) = 2^{12} = 4096$. Search for proofs $p \le 4096$.
    *   The statement $ϕ_{\beta}(11) \equiv ∃y [T(\underline{\beta}, \underline{11}, y) \land U(y) > 16]$ now involves $f$'s behavior after the jump at $n=10$.
    *   Suppose now a proof $p_2$ of $¬ϕ_{\beta}(11)$ is found with $p_2 \le 4096$. This means PA proves $∀y [T(\underline{\beta}, \underline{11}, y) \implies U(y) \le 16]$ with a proof code $p_2 \le 4096$.
    *   We check conditions for Equation 2:
        *   Is $Prf_{\le 4096}(⌈ϕ_{\beta}(11)⌉)$ true ($B_1$)? Assume No.
        *   Is $Prf_{\le 4096}(⌈¬ϕ_{\beta}(11)⌉)$ true ($B_2$)? Yes (by assumption).
    *   Since $B_1$ is False and $B_2$ is True, the second condition in Equation 2 is met.
    *   **Result:** $f(11) = 11 + H_2(11) = 11 + 20 = 31$. (Case 2)

This hypothetical sequence illustrates how $f$ evolves dynamically. Its value is determined step-by-step based on the outcome of bounded proof searches concerning statements that refer back to $f$ itself. Note that while the existence of $\beta$ is guaranteed, finding its value or computing $f(n)$ for larger $n$ is generally infeasible.

### 6.5. Formal Structure Implementation via Recursion Theorem

**Theorem 2 (Totality and Computability of LITE Function):**
Assume Con(PA) and that $g, H_1, H_2$ are total computable functions. Then the function $f$ implicitly defined by Equation (2) exists, is total, and is computable.

*Formal Proof Outline:*

1.  **Lemma 1: The Operator $\Psi$ is Total Computable.**
    Define $\Psi: ℕ \times ℕ \to ℕ$ as follows. Given inputs $\alpha$ (potential function index) and $n$, $\Psi(\alpha, n)$ performs these steps:
    a.  Compute $g(n)$, $H_1(n)$, $H_2(n)$. (Possible since $g, H_1, H_2$ are total computable).
    b.  Construct $c_{\alpha,n} = ⌈ϕ_{\alpha}(n)⌉$ using the substitution function $Sub$ applied to a fixed $⌈FormTemplate(v)⌉$ and $\alpha, n$. (This is computable).
    c.  Perform bounded search 1: Determine truth value $B_1$ of $∃p \le g(n) \, Prf(p, c_{\alpha,n})$. (Computable, as $Prf$ is decidable and the search space is finite).
    d.  Construct $d_{\alpha,n} = ⌈¬ϕ_{\alpha}(n)⌉$. (Computable operation on Gödel codes).
    e.  Perform bounded search 2: Determine truth value $B_2$ of $∃p \le g(n) \, Prf(p, d_{\alpha,n})$. (Computable).
    f.  Output result based on $B_1, B_2$:
        *   If $B_1$, output $n + H_1(n)$.
        *   Else if $B_2$, output $n + H_2(n)$.
        *   Else, output $n + 1$.
    Since each step involves only total computable functions and finite searches over decidable predicates, the entire procedure for $\Psi(\alpha, n)$ halts and produces a unique natural number for all $\alpha, n$. Thus, $\Psi$ is total computable.

2.  **Lemma 2: Existence of the Fixed Point $\beta$.**
    Since $\Psi$ is a total computable function (by Lemma 1), Kleene's Second Recursion Theorem (Theorem 1) guarantees the existence of an index $\beta \in ℕ$ such that for all $n \in ℕ$, the partial computable function $φ_{\beta}$ satisfies $φ_{\beta}(n) = \Psi(\beta, n)$.

3.  **Lemma 3: The LITE function $f = φ_{\beta}$ is Total.**
    We define the LITE function $f$ as $f = φ_{\beta}$. By definition, $f(n) = \Psi(\beta, n)$ for all $n$. Since $\Psi$ is total (by Lemma 1), $\Psi(\beta, n)$ is defined and yields a natural number for all $n$. Therefore, $f(n)$ is defined for all $n \in ℕ$, meaning $f$ is a total function.

4.  **Conclusion: $f$ is Total Computable.**
    From Lemma 3, $f$ is total. Since $f = φ_{\beta}$ and $φ_{\beta}$ is by definition a computable function (specifically, the one computed by the program with index $\beta$), $f$ is a total computable function. The self-referential definition via Equation 2 is justified by the existence of the fixed point $\beta$ from the Recursion Theorem, ensuring consistency. QED

## 7. Discussion

### 7.1. From Single Statement to Infinite Family

Traditional self-reference often hinges on a single statement (e.g., Gödel’s sentence $G$ stating its own unprovability). LITE extends this to a structured *infinite family* of statements $\{ϕ_{\beta}(n)\}_{n \in ℕ}$, where each $ϕ_{\beta}(n)$ references the function $f$'s behavior relative to input $n$. This creates a more expansive and dynamic form of self-reference within arithmetic.

### 7.2. Iterative Updates

*   **Ongoing Shifts:** The function $f$ can potentially "evolve" over the natural numbers. If, for some $n_0$, $g(n_0)$ becomes large enough to encompass a proof of $ϕ_{\beta}(n_0)$ or $¬ϕ_{\beta}(n_0)$ that was too long for previous bounds $g(k)$ ($k < n_0$), the value $f(n_0)$ will shift according to rule (2). This update can, in turn, influence the provability landscape for subsequent $ϕ_{\beta}(n)$ ($n > n_0$).
*   **Potential Complexity:** The sequence $f(0), f(1), f(2), \dots$ can exhibit complex behavior. Long periods of default behavior ($f(k)=k+1$) might be interspersed with sudden jumps triggered by the discovery of short proofs within the expanding bound $g(n)$. This pattern depends intricately on the specifics of $ϕ_{\beta}(n)$, $g(n)$, and the proof structure of PA.

### 7.3. New Interpretations of Self-Reference

LITE demonstrates that self-reference can be used constructively within PA not just to prove limitative theorems but to build adaptive structures. The function $f$ "consults" the provability status (within bounds) of statements about itself and reacts accordingly. This reframes self-reference partly as a mechanism for internal feedback and dynamic definition.

### 7.4. Possible Generalizations and Connections

*   **Stronger Theories:** The LITE construction principle can be adapted to stronger formal systems beyond PA (e.g., ZFC set theory), potentially leading to functions with even richer dynamic behaviors if the stronger system proves more statements within comparable bounds.
*   **Variants of $g(n)$:** The choice of the bounding function $g(n)$ significantly impacts the dynamics. Slower-growing $g(n)$ would lead to rarer updates, while faster growth might reveal proofs more quickly.
*   **More Complex $ϕ(n)$:** The formula template $FormTemplate$ could involve more intricate properties of $f$ (e.g., properties of $f(k)$ for multiple $k<n$, averages, comparisons with other computable functions) leading to more complex feedback loops.
*   **Connection to Modal Logic:** The dynamic nature of LITE, where the function's definition depends on provability assertions about itself, bears some resemblance to fixed-point constructions in modal logics of provability (like GL) or modal µ-calculus. However, LITE operates directly within arithmetic using bounded, concrete proof searches rather than abstract modal operators, and focuses on generating a sequence of values rather than analyzing the properties of a single fixed-point formula. A deeper comparison might explore translating LITE-like dynamics into modal frameworks.

### 7.5. Comparison with Classic Self-Reference Frameworks

Table 1 provides a comparison between LITE and classic frameworks dealing with self-reference or related concepts in formal arithmetic.

**Table 1:** Comparison of Self-Reference Frameworks

| Framework                 | Style of Reference                                          | Static vs. Dynamic           | Typical Outcome                                                    |
| :------------------------ | :---------------------------------------------------------- | :--------------------------- | :----------------------------------------------------------------- |
| Gödel’s Single Sentence   | Fixed statement: “I am not provable.”                       | Static once formulated       | Establishes incompleteness                                         |
| Rosser Variants           | Fixed statement using disjunctions/orderings                | Static                       | Avoids assumptions about $\omega$-consistency; incompleteness      |
| Reflection Principles     | Schema added globally: $Prov_{PA}(⌈φ⌉) \implies φ$          | Static extension of theory   | Strengthens the theory, proves consistency of weaker theory        |
| **LITE**                  | Infinite family $ϕ_{\beta}(n)$; bounded proof checks for each $n$ | Dynamic function definition | Self-referential function $f$ evolves based on found short proofs |

*Caption:* Table 1 contrasts the LITE framework with traditional approaches to self-reference and reflection in formal arithmetic, highlighting LITE's dynamic nature based on an infinite family of bounded proof checks.

### 7.6. Limitations

While the LITE framework offers a novel perspective, certain limitations should be acknowledged:

*   **Parameter Dependence:** The specific behavior of the LITE function $f$ is highly dependent on the choices made for $g(n)$, $H_1(n)$, $H_2(n)$, and the formula template $FormTemplate$. Different choices can lead to vastly different dynamic patterns, and there is no single "canonical" LITE function.
*   **Computational Intractability:** While $Prf_{\le g(n)}(⌈ψ⌉)$ is theoretically computable, searching for proofs up to a bound $g(n)$ that grows even moderately fast is computationally infeasible in practice. LITE demonstrates theoretical possibility rather than providing a practical algorithm for computing $f(n)$ for non-trivial $n$.
*   **Non-Constructivity of Index $\beta$:** The Recursion Theorem guarantees the *existence* of the index $\beta$, but its standard proofs are non-constructive. Finding the actual Gödel code $\beta$ is generally not straightforward.
*   **Predictability and Independence:** Due to the reliance on finding proofs in PA—a complex and undecidable system—predicting the long-term behavior of $f(n)$ is extremely difficult. For certain choices of parameters, questions like "Does $f(n)$ eventually become $n+1$ permanently?" might even be independent of PA itself.

These limitations highlight that LITE is primarily a conceptual framework demonstrating the *possibility* of dynamic self-reference within PA.

## 8. Conclusion

The LITE (Look In The Eye) framework underscores a novel view of self-reference in which an arithmetical function $f(n)$ can dynamically shift its values based on whether short proofs concerning related statements $ϕ_{\beta}(n)$ or their negations appear within a growing bound $g(n)$. In contrast to single-shot Gödelian statements, LITE orchestrates a *sequence* of evolving self-referential checks, producing an unfolding chain of potential updates across the natural numbers. Each time new relevant derivations are found within the allowed bound, $f$ is potentially redefined for that input, weaving a feedback loop into the very fabric of arithmetic.

By relying solely on standard tools—Gödel coding, the definable proof predicate $Prf$, computable auxiliary functions, and the Recursion Theorem—this construction remains entirely within classical Peano Arithmetic (assuming its consistency). It challenges the notion that arithmetic must always be a static discipline; instead, LITE reveals that PA can exhibit intrinsic "liveliness," adapting its functional outputs based on new proof discoveries in an ongoing manner. The ramifications touch not just on the theory of self-reference, but on how we conceive the possible internal transformations and adaptive potential a formal system can possess. The boundary between “the system that states truths” and “the system that adapts dynamically with those truths” is shown by LITE to be far more flexible than typically assumed.

Ultimately, LITE pushes us to recognize that self-reference in arithmetic need not be limited to static assertions or paradoxes. With careful construction involving bounded proof searches and the Recursion Theorem, we can build a total computable function (Theorem 2) that truly “observes” aspects of its own provability landscape and adjusts itself accordingly—marking a significant step forward in understanding the dynamic computational possibilities inherent within formal arithmetic itself.

## 9. References

[1] Gödel, K. (1931). Über formal unentscheidbare Sätze der Principia Mathematica und verwandter Systeme I. *Monatshefte für Mathematik und Physik*, 38(1), 173–198. doi:10.1007/BF01700692

[2] Kleene, S. C. (1952). *Introduction to Metamathematics*. North-Holland Publishing Company, Amsterdam. ISBN: 978-0720421033.

[3] Mendelson, E. (2015). *Introduction to Mathematical Logic* (6th ed.). CRC Press. ISBN: 978-1482237726.