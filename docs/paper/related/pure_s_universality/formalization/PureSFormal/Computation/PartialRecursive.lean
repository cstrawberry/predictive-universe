import PureSFormal.Computation.PrimitiveRecursive

/-!
# Closed minimization programs

The program syntax contains a closed primitive-recursive program, unary
composition, and unbounded minimization. The evaluator is fuelled and returns
an option. A computability certificate contains both eventual success and
agreement of every successful run with the stated total function.
-/

namespace PureSFormal.Computation

namespace PartialRecursive

/-- Closed first-order minimization code with statically tracked arity. -/
inductive Code : Nat → Type where
  | primitive {arity : Nat} (program : PRCode arity) : Code arity
  | composeUnary {arity : Nat} (outer : Code 1) (inner : Code arity) : Code arity
  | minimize {arity : Nat} (body : Code (arity + 1)) : Code arity

namespace Code

/-- Search a bounded initial segment for the first input whose value is zero. -/
def firstZero (test : Nat → Option Nat) : Nat → Nat → Option Nat
  | 0, _ => none
  | remaining + 1, candidate =>
      match test candidate with
      | none => none
      | some 0 => some candidate
      | some (_ + 1) => firstZero test remaining (candidate + 1)

/-- Extending both the available search interval and every successful test
evaluation preserves a successful bounded minimization result. -/
theorem firstZero_mono
    {firstTest secondTest : Nat → Option Nat}
    (testMono : ∀ candidate value,
      firstTest candidate = some value → secondTest candidate = some value)
    {firstRemaining secondRemaining candidate value : Nat}
    (remainingMono : firstRemaining ≤ secondRemaining)
    (found : firstZero firstTest firstRemaining candidate = some value) :
    firstZero secondTest secondRemaining candidate = some value := by
  induction firstRemaining generalizing secondRemaining candidate with
  | zero =>
      simp [firstZero] at found
  | succ firstRemaining ih =>
      cases secondRemaining with
      | zero =>
          cases Nat.not_succ_le_zero firstRemaining remainingMono
      | succ secondRemaining =>
          have tailMono : firstRemaining ≤ secondRemaining :=
            Nat.le_of_succ_le_succ remainingMono
          cases firstEquation : firstTest candidate with
          | none =>
              simp [firstZero, firstEquation] at found
          | some result =>
              have secondEquation := testMono candidate result firstEquation
              cases result with
              | zero =>
                  simpa [firstZero, firstEquation, secondEquation] using found
              | succ result =>
                  have tailFound :
                      firstZero firstTest firstRemaining (candidate + 1) =
                        some value := by
                    simpa [firstZero, firstEquation] using found
                  simpa [firstZero, secondEquation] using
                    ih tailMono tailFound

/-- Fuel-recursive evaluator used by the public argument order below. -/
def run? : Nat → {arity : Nat} → Code arity → List Nat → Option Nat
  | _, _, .primitive program, input => some (program.eval input)
  | 0, _, .composeUnary _ _, _ => none
  | fuel + 1, _, .composeUnary outer inner, input => do
      let middle <- run? fuel inner input
      run? fuel outer [middle]
  | 0, _, .minimize _, _ => none
  | fuel + 1, arity, .minimize body, input =>
      let parameters := input.take arity
      firstZero (fun candidate => run? fuel body (parameters ++ [candidate]))
        (fuel + 1) 0

/-- Fuel-bounded evaluation. Primitive programs ignore fuel; every recursive
minimization or composition call receives strictly less fuel. -/
def eval? {arity : Nat} (program : Code arity) (fuel : Nat)
    (input : List Nat) : Option Nat :=
  run? fuel program input

/-- Unary evaluation interface. -/
def eval₁? (program : Code 1) (fuel input : Nat) : Option Nat :=
  eval? program fuel [input]

/-- Embed a closed primitive-recursive program. -/
def ofPrimitive {arity : Nat} (program : PRCode arity) : Code arity :=
  .primitive program

@[simp]
theorem eval?_ofPrimitive {arity : Nat} (program : PRCode arity)
    (fuel : Nat) (input : List Nat) :
    eval? (ofPrimitive program) fuel input = some (program.eval input) :=
  by cases fuel <;> rfl

@[simp]
theorem eval₁?_ofPrimitive (program : PRCode 1) (fuel input : Nat) :
    eval₁? (ofPrimitive program) fuel input = some (program.eval₁ input) :=
  by cases fuel <;> rfl

/-- A successful evaluation has one deterministic value at its fixed fuel. -/
theorem eval?_deterministic {arity : Nat} (program : Code arity)
    (fuel : Nat) (input : List Nat) {first second : Nat}
    (hfirst : eval? program fuel input = some first)
    (hsecond : eval? program fuel input = some second) :
    first = second := by
  rw [hfirst] at hsecond
  exact Option.some.inj hsecond

/-- Increasing the fuel cannot change or erase a successful evaluation. -/
theorem eval?_monotone {arity : Nat} (program : Code arity)
    {firstFuel secondFuel : Nat} (fuelMono : firstFuel ≤ secondFuel)
    (input : List Nat) {value : Nat}
    (evaluated : eval? program firstFuel input = some value) :
    eval? program secondFuel input = some value := by
  induction firstFuel generalizing secondFuel arity program input value with
  | zero =>
      cases program with
      | primitive primitive =>
          simpa [eval?, run?] using evaluated
      | composeUnary outer inner =>
          simp [eval?, run?] at evaluated
      | minimize body =>
          simp [eval?, run?] at evaluated
  | succ firstFuel ih =>
      cases secondFuel with
      | zero =>
          cases Nat.not_succ_le_zero firstFuel fuelMono
      | succ secondFuel =>
          have tailFuelMono : firstFuel ≤ secondFuel :=
            Nat.le_of_succ_le_succ fuelMono
          cases program with
          | primitive primitive =>
              simpa [eval?, run?] using evaluated
          | composeUnary outer inner =>
              unfold eval? at evaluated ⊢
              simp only [run?] at evaluated ⊢
              cases innerEquation : run? firstFuel inner input with
              | none => simp [innerEquation] at evaluated
              | some middle =>
                  cases outerEquation : run? firstFuel outer [middle] with
                  | none => simp [innerEquation, outerEquation] at evaluated
                  | some result =>
                      have resultEq : result = value := by
                        simpa [innerEquation, outerEquation] using evaluated
                      have innerExtended :
                          run? secondFuel inner input = some middle :=
                        ih inner tailFuelMono input innerEquation
                      have outerExtended :
                          run? secondFuel outer [middle] = some result :=
                        ih outer tailFuelMono [middle] outerEquation
                      simpa [innerExtended, outerExtended, resultEq]
          | minimize body =>
              unfold eval? at evaluated ⊢
              simp only [run?] at evaluated ⊢
              exact firstZero_mono
                (fun candidate result bodyEvaluated =>
                  ih body tailFuelMono
                    (input.take arity ++ [candidate]) bodyEvaluated)
                (Nat.succ_le_succ tailFuelMono) evaluated

/-- Unary specialization of fuel monotonicity. -/
theorem eval₁?_monotone (program : Code 1)
    {firstFuel secondFuel input value : Nat}
    (fuelMono : firstFuel ≤ secondFuel)
    (evaluated : eval₁? program firstFuel input = some value) :
    eval₁? program secondFuel input = some value :=
  eval?_monotone program fuelMono [input] evaluated

end Code

/-- Total correctness of one unary closed program. -/
structure Code.ComputesTotal (program : Code 1) (function : Nat → Nat) : Prop where
  terminates : ∀ input, ∃ fuel, program.eval₁? fuel input = some (function input)
  agrees : ∀ input fuel value,
    program.eval₁? fuel input = some value → value = function input

/-- Computability means that a closed program carries a total-correctness
certificate for the function. -/
def Computable (function : Nat → Nat) : Prop :=
  ∃ program : Code 1, program.ComputesTotal function

/-- Primitive code embedded in minimization syntax computes the same unary
function at every fuel. -/
theorem Code.ofPrimitive_computes (program : PRCode 1) :
    (Code.ofPrimitive program).ComputesTotal program.eval₁ := by
  constructor
  · intro input
    exact ⟨0, Code.eval₁?_ofPrimitive program 0 input⟩
  · intro input fuel value evaluated
    rw [Code.eval₁?_ofPrimitive] at evaluated
    exact (Option.some.inj evaluated).symm

/-- Every function with closed primitive-recursive code has a closed
minimization-program computability certificate. -/
theorem computable_of_primitiveRecursive {function : Nat → Nat}
    (primitive : PrimitiveRecursive function) : Computable function := by
  rcases primitive with ⟨program, correct⟩
  refine ⟨Code.ofPrimitive program, ?_⟩
  constructor
  · intro input
    exact ⟨0, by rw [Code.eval₁?_ofPrimitive, correct]⟩
  · intro input fuel value evaluated
    rw [Code.eval₁?_ofPrimitive] at evaluated
    exact (Option.some.inj evaluated).symm.trans (correct input)

/-- Computable unary functions are closed under composition, with the
composed closed program retained in the certificate. -/
theorem computable_comp {outer inner : Nat → Nat}
    (outerComputable : Computable outer)
    (innerComputable : Computable inner) :
    Computable (fun input => outer (inner input)) := by
  rcases outerComputable with ⟨outerProgram, outerTotal⟩
  rcases innerComputable with ⟨innerProgram, innerTotal⟩
  refine ⟨Code.composeUnary outerProgram innerProgram, ?_⟩
  constructor
  · intro input
    rcases innerTotal.terminates input with ⟨innerFuel, innerRuns⟩
    rcases outerTotal.terminates (inner input) with ⟨outerFuel, outerRuns⟩
    let sharedFuel := max innerFuel outerFuel
    have innerExtended :
        innerProgram.eval₁? sharedFuel input = some (inner input) :=
      Code.eval₁?_monotone innerProgram (Nat.le_max_left _ _) innerRuns
    have outerExtended :
        outerProgram.eval₁? sharedFuel (inner input) = some (outer (inner input)) :=
      Code.eval₁?_monotone outerProgram (Nat.le_max_right _ _) outerRuns
    change Code.run? sharedFuel innerProgram [input] =
      some (inner input) at innerExtended
    change Code.run? sharedFuel outerProgram [inner input] =
      some (outer (inner input)) at outerExtended
    exact ⟨sharedFuel + 1, by
      simp [Code.eval₁?, Code.eval?, Code.run?, innerExtended, outerExtended]⟩
  · intro input fuel value evaluated
    cases fuel with
    | zero => simp [Code.eval₁?, Code.eval?, Code.run?] at evaluated
    | succ fuel =>
        simp only [Code.eval₁?, Code.eval?, Code.run?] at evaluated
        cases innerEquation : Code.run? fuel innerProgram [input] with
        | none => simp [innerEquation] at evaluated
        | some middle =>
            cases outerEquation : Code.run? fuel outerProgram [middle] with
            | none => simp [innerEquation, outerEquation] at evaluated
            | some result =>
                have middleEq : middle = inner input :=
                  innerTotal.agrees input fuel middle innerEquation
                have resultEq : result = outer middle :=
                  outerTotal.agrees middle fuel result outerEquation
                have valueEq : value = result := by
                  simpa [innerEquation, outerEquation] using evaluated.symm
                exact valueEq.trans (resultEq.trans (congrArg outer middleEq))

end PartialRecursive

namespace PRCode

/-- Canonical embedding of primitive-recursive code into minimization code. -/
def toPartial {arity : Nat} (program : PRCode arity) : PartialRecursive.Code arity :=
  .primitive program

/-- The canonical embedding computes the original unary evaluator. -/
theorem toPartial_computes (program : PRCode 1) :
    program.toPartial.ComputesTotal program.eval₁ :=
  PartialRecursive.Code.ofPrimitive_computes program

end PRCode

namespace PrimitiveRecursive

/-- Every primitive-recursive unary function is computable by a closed
minimization program. -/
theorem computable {function : Nat → Nat}
    (certificate : PrimitiveRecursive function) :
    PartialRecursive.Computable function :=
  PartialRecursive.computable_of_primitiveRecursive certificate

end PrimitiveRecursive

/-- A standard computable many-one reduction between natural-number
languages. Unlike `ExtensionalReduces`, the map carries closed code. -/
structure ComputableManyOneReduces (source target : Nat → Prop) where
  reduction : Nat → Nat
  computable : PartialRecursive.Computable reduction
  correct : ∀ input, source input ↔ target (reduction input)

namespace ComputableManyOneReduces

def refl (predicate : Nat → Prop) :
    ComputableManyOneReduces predicate predicate where
  reduction := id
  computable := PartialRecursive.computable_of_primitiveRecursive
    PrimitiveRecursive.identity
  correct := fun _ => Iff.rfl

/-- Computable many-one reductions compose constructively. -/
def trans {first second third : Nat → Prop}
    (firstSecond : ComputableManyOneReduces first second)
    (secondThird : ComputableManyOneReduces second third) :
    ComputableManyOneReduces first third where
  reduction := fun input => secondThird.reduction (firstSecond.reduction input)
  computable := PartialRecursive.computable_comp
    secondThird.computable firstSecond.computable
  correct := fun input =>
    (firstSecond.correct input).trans
      (secondThird.correct (firstSecond.reduction input))

end ComputableManyOneReduces

end PureSFormal.Computation
