import PureSFormal.Computation.DeletionTwoT2Normalizer

set_option backward.isDefEq.respectTransparency false

/-!
# Unary constructor execution of initial-word normalization

The machine computes the literal `normalizeWord` output. It first counts the
production-list spine, then compares and renames each input label, and finally
reverses the accumulated labels onto the two delay cells.

Natural numbers are immutable unary constructor trees. A successor is allocated
in one operation and shares its predecessor. Equality inspects one constructor
of each operand at a time; it never uses machine-integer equality. Labels in the
output share their existing trees. The counted data operations are constructor
observations, child-reference reads, and constructor allocations. Finite control,
state records, and proof traces are not data operations in this model. The
operation bound is consequently a unary tree/list bound, not a bit-complexity
bound for Lean's native natural-number representation.
-/

namespace PureSFormal.Computation.DeletionTwoNormalizationMachine

open RogozhinTagInput

inductive Primitive where
  | observe
  | readChild
  | allocateCons
  | allocateNil
  | allocateSucc
  deriving DecidableEq, Repr

inductive Event where
  | countRow
  | finishCount
  | readLabel
  | finishScan
  | finishComparison
  | peelComparison
  | emitLabel
  | finishEmit
  deriving DecidableEq, Repr

/-- Each trace lists the data operations performed by its transition. -/
def Event.primitives : Event → List Primitive
  | .countRow => [.observe, .readChild, .allocateSucc]
  | .finishCount => [.observe, .allocateNil, .allocateSucc]
  | .readLabel => [.observe, .readChild, .readChild]
  | .finishScan => [.observe, .allocateNil, .allocateCons, .allocateCons]
  | .finishComparison => [.observe, .observe, .allocateCons]
  | .peelComparison => [.observe, .observe, .readChild, .readChild]
  | .emitLabel => [.observe, .readChild, .readChild, .allocateCons]
  | .finishEmit => [.observe]

def Event.operations (event : Event) : Nat := event.primitives.length

theorem Event.operations_le_four (event : Event) : event.operations ≤ 4 := by
  cases event <;> decide

inductive State where
  | count (rows : List (List Label)) (word : List Label) (count : Nat)
  | scan (word accumulator : List Label) (delay shifted : Nat)
  | compare (left right original : Nat) (word accumulator : List Label)
      (delay shifted : Nat)
  | emit (accumulator output : List Label)
  | done (output : List Label)
  deriving Repr

/-- Every branch uses only the constructor operations listed by its event. -/
def step? : State → Option (Event × State)
  | .count (_ :: rows) word count =>
      some (.countRow, .count rows word (.succ count))
  | .count [] word count =>
      some (.finishCount, .scan word [] count (.succ count))
  | .scan (label :: word) accumulator delay shifted =>
      some (.readLabel, .compare label delay label word accumulator delay shifted)
  | .scan [] accumulator delay _ =>
      some (.finishScan, .emit accumulator [delay, delay])
  | .compare 0 0 _ word accumulator delay shifted =>
      some (.finishComparison, .scan word (shifted :: accumulator) delay shifted)
  | .compare 0 (.succ _) original word accumulator delay shifted =>
      some (.finishComparison, .scan word (original :: accumulator) delay shifted)
  | .compare (.succ _) 0 original word accumulator delay shifted =>
      some (.finishComparison, .scan word (original :: accumulator) delay shifted)
  | .compare (.succ left) (.succ right) original word accumulator delay shifted =>
      some (.peelComparison,
        .compare left right original word accumulator delay shifted)
  | .emit (label :: accumulator) output =>
      some (.emitLabel, .emit accumulator (label :: output))
  | .emit [] output => some (.finishEmit, .done output)
  | .done _ => none

/-- A finite execution records its transition count and primitive trace length. -/
inductive Execution : Nat → Nat → State → State → Prop where
  | refl (state : State) : Execution 0 0 state state
  | next {source middle target : State} {event : Event} {steps operations : Nat}
      (transition : step? source = some (event, middle))
      (rest : Execution steps operations middle target) :
      Execution (steps + 1) (event.operations + operations) source target

theorem Execution.single {source target : State} {event : Event}
    (transition : step? source = some (event, target)) :
    Execution 1 event.operations source target := by
  simpa only [Nat.zero_add, Nat.add_zero] using
    (Execution.next transition (Execution.refl target))

theorem Execution.trans {first middle last : State} {n m c d : Nat}
    (left : Execution n c first middle) (right : Execution m d middle last) :
    Execution (n + m) (c + d) first last := by
  induction left with
  | refl => simpa only [Nat.zero_add] using right
  | next transition rest ih =>
      have joined := Execution.next transition (ih right)
      simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using joined

theorem Execution.operations_le {source target : State} {steps operations : Nat}
    (execution : Execution steps operations source target) :
    operations ≤ 4 * steps := by
  induction execution with
  | refl => exact Nat.le_refl 0
  | @next source middle target event steps operations transition rest ih =>
      have bound := Nat.add_le_add event.operations_le_four ih
      simpa only [Nat.mul_add, Nat.mul_one, Nat.add_comm] using bound

def reverseOnto : List Label → List Label → List Label
  | [], output => output
  | label :: rest, output => reverseOnto rest (label :: output)

def rename (delay label : Nat) : Nat := if label = delay then delay + 1 else label

theorem comparison_execution (left right original : Nat) (word accumulator : List Label)
    (delay shifted : Nat) :
    ∃ operations,
      Execution (min left right + 1) operations
        (.compare left right original word accumulator delay shifted)
        (.scan word ((if left = right then shifted else original) :: accumulator)
          delay shifted) := by
  induction right generalizing left with
  | zero =>
      cases left with
      | zero =>
          exact ⟨3, Execution.single (event := .finishComparison)
            (source := .compare 0 0 original word accumulator delay shifted) rfl⟩
      | succ left =>
          refine ⟨3, ?_⟩
          simpa only [Nat.min_zero, Nat.add_zero, Nat.succ_ne_zero, if_false] using!
            (Execution.single (event := .finishComparison)
              (source := .compare (left + 1) 0 original word accumulator delay shifted) rfl)
  | succ right ih =>
      cases left with
      | zero =>
          refine ⟨3, ?_⟩
          simpa only [Nat.zero_min, Nat.zero_add, Nat.zero_ne_add_one, if_false] using!
            (Execution.single (event := .finishComparison)
              (source := .compare 0 (right + 1) original word accumulator delay shifted) rfl)
      | succ left =>
          obtain ⟨operations, run⟩ := ih left
          refine ⟨4 + operations, ?_⟩
          have next := Execution.next (show step?
            (.compare (left + 1) (right + 1) original word accumulator delay shifted) =
            some (.peelComparison,
              .compare left right original word accumulator delay shifted) from rfl) run
          simpa only [Nat.succ_min_succ, Nat.succ.injEq, Event.operations,
            Event.primitives, List.length_cons, List.length_nil, Nat.reduceAdd,
            Nat.succ_eq_add_one] using next

theorem comparison_steps_le (left right : Nat) :
    min left right + 1 ≤ right + 1 := Nat.add_le_add_right (Nat.min_le_right _ _) _

theorem emit_execution (accumulator output : List Label) :
    ∃ operations, Execution (accumulator.length + 1) operations
      (.emit accumulator output) (.done (reverseOnto accumulator output)) := by
  induction accumulator generalizing output with
  | nil => exact ⟨1, Execution.single (event := .finishEmit)
      (source := .emit [] output) rfl⟩
  | cons label accumulator ih =>
      obtain ⟨operations, run⟩ := ih (label :: output)
      refine ⟨4 + operations, ?_⟩
      exact Execution.next (source := .emit (label :: accumulator) output)
        (event := .emitLabel) rfl run

theorem scan_execution (word accumulator : List Label) (delay : Nat) :
    ∃ steps operations,
      Execution steps operations (.scan word accumulator delay (delay + 1))
        (.done (reverseOnto accumulator
          (word.map (rename delay) ++ [delay, delay]))) ∧
      steps ≤ (delay + 3) * word.length + accumulator.length + 2 := by
  induction word generalizing accumulator with
  | nil =>
      obtain ⟨operations, run⟩ := emit_execution accumulator [delay, delay]
      refine ⟨accumulator.length + 1 + 1, 4 + operations,
        Execution.next (source := .scan [] accumulator delay (delay + 1))
          (event := .finishScan) rfl run, ?_⟩
      simp only [List.length_nil, Nat.mul_zero, Nat.zero_add]
      exact Nat.le_refl _
  | cons label word ih =>
      obtain ⟨compareCost, compareRun⟩ :=
        comparison_execution label delay label word accumulator delay (delay + 1)
      obtain ⟨steps, operations, run, bound⟩ :=
        ih (rename delay label :: accumulator)
      have joined := Execution.trans compareRun run
      have next := Execution.next (show step?
        (.scan (label :: word) accumulator delay (delay + 1)) =
        some (.readLabel,
          .compare label delay label word accumulator delay (delay + 1)) from rfl) joined
      refine ⟨(min label delay + 1 + steps) + 1,
        3 + (compareCost + operations), ?_, ?_⟩
      · exact next
      · have comparisonBound := comparison_steps_le label delay
        have combined := Nat.add_le_add_right (Nat.add_le_add comparisonBound bound) 1
        simp only [List.length_cons, Nat.mul_add, Nat.mul_one, Nat.add_assoc,
          Nat.add_comm, Nat.add_left_comm, Nat.reduceAdd] at combined ⊢
        simpa only [← Nat.add_assoc 1 2, ← Nat.add_assoc 1 3,
          ← Nat.add_assoc 1 4, ← Nat.add_assoc 2 3] using combined

theorem count_execution (rows : List (List Label)) (word : List Label) (count : Nat) :
    ∃ operations, Execution (rows.length + 1) operations (.count rows word count)
      (.scan word [] (count + rows.length) (count + rows.length + 1)) := by
  induction rows generalizing count with
  | nil => exact ⟨3, Execution.single (event := .finishCount)
      (source := .count [] word count) rfl⟩
  | cons row rows ih =>
      obtain ⟨operations, run⟩ := ih (count + 1)
      refine ⟨3 + operations, ?_⟩
      have next := Execution.next (show step? (.count (row :: rows) word count) =
        some (.countRow, .count rows word (count + 1)) from rfl) run
      simpa only [List.length_cons, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm,
        Event.operations, Event.primitives, List.length_nil, Nat.reduceAdd] using next

def initial (program : Program) (word : List Label) : State :=
  .count program.productions word 0

/-- All labels, including labels larger than the table, are handled literally. -/
theorem normalization_execution (program : Program) (word : List Label) :
    ∃ steps operations,
      Execution steps operations (initial program word)
        (.done (DeletionTwoT2Normalizer.normalizeWord program word)) ∧
      steps ≤ program.productions.length + 3 +
        (program.productions.length + 3) * word.length ∧
      operations ≤ 4 * (program.productions.length + 3 +
        (program.productions.length + 3) * word.length) := by
  obtain ⟨countCost, countRun⟩ := count_execution program.productions word 0
  obtain ⟨steps, operations, run, bound⟩ :=
    scan_execution word [] program.productions.length
  simp only [Nat.zero_add] at countRun
  have joined := Execution.trans countRun run
  have stepBound : program.productions.length + 1 + steps ≤
      program.productions.length + 3 +
        (program.productions.length + 3) * word.length := by
    simp only [List.length_nil, Nat.add_zero] at bound
    have combined := Nat.add_le_add_left bound (program.productions.length + 1)
    simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm, Nat.reduceAdd] at combined ⊢
    simpa only [← Nat.add_assoc 1 2] using combined
  refine ⟨program.productions.length + 1 + steps, countCost + operations,
    ?_, stepBound, Nat.le_trans joined.operations_le (Nat.mul_le_mul_left 4 stepBound)⟩
  simpa only [initial, Nat.zero_add, reverseOnto,
    DeletionTwoT2Normalizer.normalizeWord, DeletionTwoT2Normalizer.encodeWord,
    DeletionTwoT2Normalizer.encodeLabel, DeletionTwoT2Normalizer.delayLabel,
    DeletionTwoT2Normalizer.targetHaltLabel, symbolCount, haltLabel, rename] using! joined

end PureSFormal.Computation.DeletionTwoNormalizationMachine
