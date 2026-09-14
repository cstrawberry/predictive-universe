import PureSFormal.Computation.RogozhinInputConstructionMachine

/-!
# Measured Rogozhin program-region construction

The compiler builds the actual printed program and data regions. Its budgets
are structural sums over input labels, unary weights and emitted regions, not
source-machine running times. All variable-size helper calls carry their
primitive operation counts.
-/

namespace PureSFormal.Computation.RogozhinProgramConstructionMachine

open PureSFormal.PureS.ParserPrimitiveMachine (Result)
open PureSFormal.PureS
open Rogozhin46 (Symbol)
open RogozhinInputConstructionMachine (length lookup reverseOnto weight dataCode)
open CookWordConstructionMachine (replicateOnto)

def copy {α : Type} : List α → List α → Result (List α)
  | [], tail => ⟨tail, 1⟩
  | head :: rest, tail =>
      let next := copy rest tail
      ⟨head :: next.value, 4 + next.operations⟩

theorem copy_value {α : Type} (word tail : List α) :
    (copy word tail).value = word ++ tail := by
  induction word with
  | nil => rfl
  | cons head rest ih => simp only [copy, ih, List.cons_append]

theorem copy_operations {α : Type} (word tail : List α) :
    (copy word tail).operations = 4 * word.length + 1 := by
  induction word with
  | nil => rfl
  | cons head rest ih => simp only [copy, ih, List.length_cons, Nat.mul_succ,
      Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

/-- Fixed two-cell destructor, sharing the surviving input suffix. -/
def dropTwo {α : Type} : List α → Result (List α)
  | [] => ⟨[], 2⟩
  | _ :: [] => ⟨[], 4⟩
  | _ :: _ :: tail => ⟨tail, 5⟩

theorem dropTwo_value {α : Type} (word : List α) :
    (dropTwo word).value = word.drop 2 := by
  cases word with
  | nil => rfl
  | cons head tail => cases tail <;> rfl

theorem dropTwo_operations_le {α : Type} (word : List α) :
    (dropTwo word).operations ≤ 5 := by
  cases word with
  | nil => exact (by decide : 2 ≤ 5)
  | cons head tail => cases tail with
    | nil => exact (by decide : 4 ≤ 5)
    | cons next rest => exact Nat.le_refl _

def weightBudget (program : RogozhinTagInput.Program) (label : Nat) : Nat :=
  5 * (label * label) + 14 * label + 14 * RogozhinTagInput.weight program label + 1

def weightsBudget (program : RogozhinTagInput.Program) : List Nat → Nat
  | [] => 2
  | label :: rest => 4 + weightBudget program label + weightsBudget program rest

def mapWeights (program : RogozhinTagInput.Program) : List Nat → Result (List Nat)
  | [] => ⟨[], 2⟩
  | label :: rest =>
      let count := weight program label
      let following := mapWeights program rest
      ⟨count.value :: following.value, 4 + count.operations + following.operations⟩

theorem mapWeights_value (program : RogozhinTagInput.Program) (word : List Nat) :
    (mapWeights program word).value = word.map (RogozhinTagInput.weight program) := by
  induction word with
  | nil => rfl
  | cons label rest ih =>
      simp only [mapWeights, RogozhinInputConstructionMachine.weight_value, ih, List.map_cons]

theorem mapWeights_operations_le (program : RogozhinTagInput.Program) (word : List Nat) :
    (mapWeights program word).operations ≤ weightsBudget program word := by
  induction word with
  | nil => exact Nat.le_refl _
  | cons label rest ih =>
      exact Nat.add_le_add (Nat.add_le_add_left
        (RogozhinInputConstructionMachine.weight_operations_le program label) 4) ih

def exponentTail : List Nat → List Symbol → Result (List Symbol)
  | [], tail => ⟨tail, 1⟩
  | count :: rest, tail =>
      let following := exponentTail rest tail
      let ones := replicateOnto Symbol.s0 count following.value
      ⟨.s1 :: .s1 :: ones.value, 5 + following.operations + ones.operations⟩

theorem exponentTail_value (counts : List Nat) (tail : List Symbol) :
    (exponentTail counts tail).value =
      counts.flatMap (fun count => [.s1, .s1] ++ RogozhinTagInput.ones count) ++ tail := by
  induction counts with
  | nil => rfl
  | cons count rest ih =>
      simp only [exponentTail, CookWordConstructionMachine.replicateOnto_value, ih,
        List.flatMap_cons, RogozhinTagInput.ones, List.cons_append,
        List.nil_append, List.append_assoc]

def exponentMass : List Nat → Nat
  | [] => 0
  | count :: rest => count + exponentMass rest

theorem exponentTail_operations (counts : List Nat) (tail : List Symbol) :
    (exponentTail counts tail).operations = 4 * exponentMass counts + 6 * counts.length + 1 := by
  induction counts with
  | nil => rfl
  | cons count rest ih =>
      simp only [exponentTail, CookWordConstructionMachine.replicateOnto_operations,
        ih, exponentMass, List.length_cons, Nat.mul_add, Nat.mul_succ]
      change 5 + (4 * exponentMass rest + 6 * rest.length + 1) + (4 * count + 1) =
        4 * count + 4 * exponentMass rest + (6 * rest.length + (5 + 1)) + 1
      simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

def exponentCode : List Nat → Result (List Symbol)
  | [] => ⟨[], 2⟩
  | count :: rest =>
      let following := exponentTail rest []
      let ones := replicateOnto Symbol.s0 count following.value
      ⟨.s1 :: ones.value, 5 + following.operations + ones.operations⟩

theorem exponentCode_value (counts : List Nat) :
    (exponentCode counts).value = RogozhinTagInput.exponentCode counts := by
  cases counts with
  | nil => rfl
  | cons count rest =>
      simp only [exponentCode, CookWordConstructionMachine.replicateOnto_value,
        exponentTail_value, List.append_nil, RogozhinTagInput.exponentCode, RogozhinTagInput.ones]

theorem exponentCode_operations_le (counts : List Nat) :
    (exponentCode counts).operations ≤ 4 * exponentMass counts + 6 * counts.length + 2 := by
  cases counts with
  | nil => exact Nat.le_refl _
  | cons count rest =>
      simp only [exponentCode, CookWordConstructionMachine.replicateOnto_operations,
        exponentTail_operations, exponentMass, List.length_cons, Nat.mul_add, Nat.mul_succ]
      have rearrange : 5 + (4 * exponentMass rest + 6 * rest.length + 1) + (4 * count + 1) =
          4 * count + 4 * exponentMass rest + (6 * rest.length + 6) + 1 := by
        change _ = 4 * count + 4 * exponentMass rest + (6 * rest.length + (5 + 1)) + 1
        simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
      rw [rearrange]
      exact Nat.add_le_add_left (by decide : 1 ≤ 2) _

def productionExponents (program : RogozhinTagInput.Program) (label : Nat) : Result (List Nat) :=
  let count := length program.productions
  let distinguished := ParserNatPrimitive.subtract count.value 1
  let row := lookup [] program.productions label
  let payload := dropTwo row.value
  let reversed := reverseOnto payload.value []
  let weights := mapWeights program reversed.value
  let lastWeight := weight program distinguished.value
  let thisWeight := weight program label
  let difference := ParserNatPrimitive.subtract lastWeight.value thisWeight.value
  let output := copy weights.value [lastWeight.value, difference.value]
  ⟨output.value, 7 + count.operations + distinguished.operations + row.operations +
    payload.operations + reversed.operations + weights.operations +
    lastWeight.operations + thisWeight.operations + difference.operations + output.operations⟩

theorem productionExponents_value (program : RogozhinTagInput.Program) (label : Nat) :
    (productionExponents program label).value = RogozhinTagInput.productionExponents program label := by
  simp only [productionExponents, copy_value, mapWeights_value,
    RogozhinInputConstructionMachine.reverseOnto_value, List.append_nil,
    dropTwo_value, RogozhinInputConstructionMachine.lookup_value,
    RogozhinInputConstructionMachine.weight_value, ParserNatPrimitive.subtract_value,
    RogozhinInputConstructionMachine.length_value]
  rfl

/-- A sum of input-table scans, unary label weights and copied payload cells. -/
def productionExponentsBudget (program : RogozhinTagInput.Program) (label : Nat) : Nat :=
  let payload := (RogozhinTagInput.productionAt program label).drop 2
  let distinguished := RogozhinTagInput.distinguished program
  7 + (4 * program.productions.length + 2) + (4 * 1 + 2) + (5 * label + 3) +
    5 + (4 * payload.length + 1) + weightsBudget program payload.reverse +
    weightBudget program distinguished + weightBudget program label +
    (4 * RogozhinTagInput.weight program label + 2) + (4 * payload.length + 1)

theorem productionExponents_operations_le (program : RogozhinTagInput.Program) (label : Nat) :
    (productionExponents program label).operations ≤ productionExponentsBudget program label := by
  let count := length program.productions
  let distinguished := ParserNatPrimitive.subtract count.value 1
  let row := lookup [] program.productions label
  let payload := dropTwo row.value
  let reversed := reverseOnto payload.value []
  let weights := mapWeights program reversed.value
  let lastWeight := weight program distinguished.value
  let thisWeight := weight program label
  have budget := Nat.add_le_add (Nat.add_le_add (Nat.add_le_add (Nat.add_le_add
    (Nat.add_le_add (Nat.add_le_add (Nat.add_le_add (Nat.add_le_add
      (Nat.add_le_add (Nat.add_le_add_left
        (Nat.le_of_eq (RogozhinInputConstructionMachine.length_operations program.productions)) 7)
        (ParserNatPrimitive.subtract_operations_le count.value 1))
        (RogozhinInputConstructionMachine.lookup_operations_le ([] : List Nat) program.productions label))
        (dropTwo_operations_le row.value))
        (Nat.le_of_eq (RogozhinInputConstructionMachine.reverseOnto_operations payload.value [])))
        (mapWeights_operations_le program reversed.value))
        (RogozhinInputConstructionMachine.weight_operations_le program distinguished.value))
        (RogozhinInputConstructionMachine.weight_operations_le program label))
        (ParserNatPrimitive.subtract_operations_le lastWeight.value thisWeight.value))
        (Nat.le_of_eq (copy_operations weights.value [lastWeight.value,
          (ParserNatPrimitive.subtract lastWeight.value thisWeight.value).value]))
  apply Nat.le_trans budget
  apply Nat.le_of_eq
  simp only [count, distinguished, row, payload, reversed, weights, thisWeight,
    RogozhinInputConstructionMachine.length_value, ParserNatPrimitive.subtract_value,
    RogozhinInputConstructionMachine.lookup_value, dropTwo_value,
    RogozhinInputConstructionMachine.reverseOnto_value, List.append_nil,
    List.length_reverse, mapWeights_value, List.length_map,
    RogozhinInputConstructionMachine.weight_value, productionExponentsBudget, weightBudget,
    RogozhinTagInput.distinguished, RogozhinTagInput.symbolCount, RogozhinTagInput.productionAt]

def productionCode (program : RogozhinTagInput.Program) (label : Nat) : Result (List Symbol) :=
  let exponents := productionExponents program label
  let output := exponentCode exponents.value
  ⟨.s1 :: .s0 :: output.value, 2 + exponents.operations + output.operations⟩

theorem productionCode_value (program : RogozhinTagInput.Program) (label : Nat) :
    (productionCode program label).value = RogozhinTagInput.productionCode program label := by
  rw [productionCode, exponentCode_value, productionExponents_value]
  rfl

def productionBudget (program : RogozhinTagInput.Program) (label : Nat) : Nat :=
  2 + productionExponentsBudget program label +
    (4 * exponentMass (RogozhinTagInput.productionExponents program label) +
      6 * (RogozhinTagInput.productionExponents program label).length + 2)

theorem productionCode_operations_le (program : RogozhinTagInput.Program) (label : Nat) :
    (productionCode program label).operations ≤ productionBudget program label := by
  have bound := Nat.add_le_add
    (Nat.add_le_add_left (productionExponents_operations_le program label) 2)
    (exponentCode_operations_le (productionExponents program label).value)
  rw [productionExponents_value] at bound
  change 2 + (productionExponents program label).operations +
    (exponentCode (productionExponents program label).value).operations ≤ _
  rw [productionExponents_value]
  exact bound


def descending : Nat → Result (List Nat)
  | 0 => ⟨[], 2⟩
  | .succ count =>
      let rest := descending count
      ⟨count :: rest.value, 4 + rest.operations⟩

theorem descending_value (count : Nat) :
    (descending count).value = (List.range count).reverse := by
  induction count with
  | zero => rfl
  | succ count ih =>
      simp only [descending, ih, List.range_succ, List.reverse_append,
        List.reverse_cons, List.reverse_nil, List.nil_append, List.singleton_append]

theorem descending_operations (count : Nat) :
    (descending count).operations = 4 * count + 2 := by
  induction count with
  | zero => rfl
  | succ count ih =>
      simp only [descending, ih, Nat.mul_succ, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

def productionCodes (program : RogozhinTagInput.Program) : List Nat → List Symbol → Result (List Symbol)
  | [], tail => ⟨tail, 1⟩
  | label :: rest, tail =>
      let production := productionCode program label
      let following := productionCodes program rest tail
      let output := copy production.value following.value
      ⟨output.value, 3 + production.operations + following.operations + output.operations⟩

theorem productionCodes_value (program : RogozhinTagInput.Program) (labels : List Nat) (tail : List Symbol) :
    (productionCodes program labels tail).value =
      labels.flatMap (RogozhinTagInput.productionCode program) ++ tail := by
  induction labels with
  | nil => rfl
  | cons label rest ih =>
      rw [productionCodes, copy_value, productionCode_value, ih, List.flatMap_cons, List.append_assoc]

def productionCodesBudget (program : RogozhinTagInput.Program) : List Nat → Nat
  | [] => 1
  | label :: rest =>
      3 + productionBudget program label + productionCodesBudget program rest +
        (4 * (RogozhinTagInput.productionCode program label).length + 1)

theorem productionCodes_operations_le (program : RogozhinTagInput.Program) (labels : List Nat) (tail : List Symbol) :
    (productionCodes program labels tail).operations ≤ productionCodesBudget program labels := by
  induction labels with
  | nil => exact Nat.le_refl _
  | cons label rest ih =>
      have bound := Nat.add_le_add_right
        (Nat.add_le_add (Nat.add_le_add_left (productionCode_operations_le program label) 3) ih)
        (4 * (RogozhinTagInput.productionCode program label).length + 1)
      simpa only [productionCodes, copy_operations, productionCode_value, productionCodesBudget] using bound

/-- One input-field read, two separator cells, and two prefix cells. -/
def programCode (program : RogozhinTagInput.Program) : Result (List Symbol) :=
  let count := length program.productions
  let labels := descending count.value
  let output := productionCodes program labels.value [.s1]
  ⟨.s3 :: .s1 :: output.value, 5 + count.operations + labels.operations + output.operations⟩

theorem programCode_value (program : RogozhinTagInput.Program) :
    (programCode program).value = RogozhinTagInput.programCode program := by
  rw [programCode, productionCodes_value, descending_value, RogozhinInputConstructionMachine.length_value]
  rfl

def programBudget (program : RogozhinTagInput.Program) : Nat :=
  5 + (4 * program.productions.length + 2) + (4 * program.productions.length + 2) +
    productionCodesBudget program (List.range program.productions.length).reverse

theorem programCode_operations_le (program : RogozhinTagInput.Program) :
    (programCode program).operations ≤ programBudget program := by
  have bound := productionCodes_operations_le program
    (descending (length program.productions).value).value [.s1]
  simp only [programCode, RogozhinInputConstructionMachine.length_operations,
    descending_operations, RogozhinInputConstructionMachine.length_value, descending_value]
  simp only [descending_value, RogozhinInputConstructionMachine.length_value] at bound
  exact Nat.add_le_add_left bound _

def configuration (left : List Symbol) : List Symbol → Result Rogozhin46.Config
  | [] => ⟨⟨.A, .s4, left, []⟩, 2⟩
  | current :: right => ⟨⟨.A, current, left, right⟩, 4⟩

theorem configuration_operations_le (left word : List Symbol) :
    (configuration left word).operations ≤ 4 := by
  cases word with
  | nil => exact (by decide : 2 ≤ 4)
  | cons current right => exact Nat.le_refl _

/-- Input record reads and allocation of the reversal's empty accumulator cost four operations. -/
def compile (job : RogozhinTagInput.Job) : Result Rogozhin46.Config :=
  let program := programCode job.program
  let left := reverseOnto program.value []
  let data := dataCode job.program job.word
  let output := configuration left.value data.value
  ⟨output.value, 4 + program.operations + left.operations + data.operations + output.operations⟩

theorem compile_value (job : RogozhinTagInput.Job) :
    (compile job).value = RogozhinTagInput.compile job := by
  simp only [compile, RogozhinInputConstructionMachine.reverseOnto_value, List.append_nil,
    programCode_value, RogozhinInputConstructionMachine.dataCode_value]
  unfold RogozhinTagInput.compile
  cases RogozhinTagInput.dataCode job.program job.word <;> rfl

def compileBudget (job : RogozhinTagInput.Job) : Nat :=
  4 + programBudget job.program + (4 * (RogozhinTagInput.programCode job.program).length + 1) +
    (20 * RogozhinInputConstructionMachine.squareMass job.word +
      18 * (RogozhinTagInput.dataCode job.program job.word).length + 2) + 4

theorem compile_operations_le (job : RogozhinTagInput.Job) :
    (compile job).operations ≤ compileBudget job := by
  have bound := Nat.add_le_add
    (Nat.add_le_add
      (Nat.add_le_add
        (Nat.add_le_add_left (programCode_operations_le job.program) 4)
        (Nat.le_of_eq (RogozhinInputConstructionMachine.reverseOnto_operations (programCode job.program).value [])))
        (RogozhinInputConstructionMachine.dataCode_operations_le job.program job.word))
        (configuration_operations_le
          (reverseOnto (programCode job.program).value []).value (dataCode job.program job.word).value)
  simpa only [compile, compileBudget, programCode_value] using bound

def cookBits (job : RogozhinTagInput.Job) : Result (List Bool) :=
  let tape := compile job
  let bits := CookWordConstructionMachine.canonicalBits tape.value
  ⟨bits.value, tape.operations + bits.operations⟩

theorem cookBits_value (job : RogozhinTagInput.Job) :
    (cookBits job).value =
      Cook.encodeWord (Cook.PassClassification.canonicalWord (RogozhinTagInput.compile job)) := by
  rw [cookBits, CookWordConstructionMachine.canonicalBits_value, compile_value]

theorem cookBits_operations_le (job : RogozhinTagInput.Job) :
    (cookBits job).operations ≤ compileBudget job +
      5 * (cookBits job).value.length +
      8 * ((RogozhinTagInput.compile job).left.length + (RogozhinTagInput.compile job).right.length) + 17 := by
  have bound := Nat.add_le_add (compile_operations_le job)
    (CookWordConstructionMachine.canonicalBits_operations_le_sizes (compile job).value)
  simp only [compile_value] at bound
  change (compile job).operations + (CookWordConstructionMachine.canonicalBits (compile job).value).operations ≤ _
  rw [compile_value]
  apply Nat.le_trans bound
  apply Nat.le_of_eq
  change _ = compileBudget job +
    5 * (CookWordConstructionMachine.canonicalBits (compile job).value).value.length +
    8 * ((RogozhinTagInput.compile job).left.length + (RogozhinTagInput.compile job).right.length) + 17
  rw [compile_value]
  simp only [Nat.add_assoc]



def productionCells (program : RogozhinTagInput.Program) : List Nat → Nat
  | [] => 0
  | label :: rest => (RogozhinTagInput.productionCode program label).length + productionCells program rest

theorem productionCodes_length (program : RogozhinTagInput.Program) (labels : List Nat) (tail : List Symbol) :
    (productionCodes program labels tail).value.length = productionCells program labels + tail.length := by
  induction labels with
  | nil => exact (Nat.zero_add tail.length).symm
  | cons label rest ih =>
      simp only [productionCodes, copy_value, List.length_append, productionCode_value,
        ih, productionCells, Nat.add_assoc]

theorem programCode_length (program : RogozhinTagInput.Program) :
    (programCode program).value.length =
      3 + productionCells program (List.range program.productions.length).reverse := by
  simp only [programCode, List.length_cons, productionCodes_length,
    descending_value, RogozhinInputConstructionMachine.length_value, List.length_nil]
  change productionCells program (List.range program.productions.length).reverse + 1 + 1 + 1 =
    (1 + 1 + 1) + productionCells program (List.range program.productions.length).reverse
  simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

def windowSize (configuration : Rogozhin46.Config) : Nat :=
  configuration.left.length + 1 + configuration.right.length

theorem compile_window_size (job : RogozhinTagInput.Job) :
    windowSize (compile job).value =
      (RogozhinTagInput.programCode job.program).length +
        max 1 (RogozhinTagInput.dataCode job.program job.word).length := by
  rw [compile_value]
  unfold RogozhinTagInput.compile
  cases data : RogozhinTagInput.dataCode job.program job.word with
  | nil =>
      simp only [windowSize, List.length_reverse, List.length_nil, Nat.add_zero]
      rfl
  | cons current right =>
      simp only [windowSize, List.length_reverse, List.length_cons]
      rw [Nat.max_eq_right (Nat.le_add_left 1 right.length)]
      simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

theorem cookBits_length (job : RogozhinTagInput.Job) :
    (cookBits job).value.length =
      114 * CookWordConstructionMachine.mass (RogozhinTagInput.compile job) := by
  rw [cookBits, CookWordConstructionMachine.canonicalBits_length, compile_value]

/-- This theorem specializes only the tag-job-to-Cook stage: its input is the
already constructed normalized tag job of the source compiler. -/
theorem cookBits_source_value (source : DeterministicTapeCook.SourceInstance) :
    (cookBits (DeterministicTapeCook.compileT2Job source)).value =
      DeterministicTapeCook.encodeBits source := by
  rw [cookBits_value]
  rfl

inductive CopyExecution {α : Type} : List α → List α → List α → Nat → Prop where
  | nil (tail : List α) : CopyExecution [] tail tail 1
  | cons {head : α} {word tail output : List α} {operations : Nat}
      (rest : CopyExecution word tail output operations) :
      CopyExecution (head :: word) tail (head :: output) (4 + operations)

theorem copy_execution {α : Type} (word tail : List α) :
    CopyExecution word tail (copy word tail).value (copy word tail).operations := by
  induction word with
  | nil => exact .nil _
  | cons head rest ih => exact .cons ih

inductive WeightsExecution (program : RogozhinTagInput.Program) : List Nat → List Nat → Nat → Prop where
  | nil : WeightsExecution program [] [] 2
  | cons {label count weightOperations followingOperations : Nat} {word output : List Nat}
      (countRun : RogozhinInputConstructionMachine.WeightExecution program label count weightOperations)
      (following : WeightsExecution program word output followingOperations) :
      WeightsExecution program (label :: word) (count :: output) (4 + weightOperations + followingOperations)

theorem mapWeights_execution (program : RogozhinTagInput.Program) (word : List Nat) :
    WeightsExecution program word (mapWeights program word).value (mapWeights program word).operations := by
  induction word with
  | nil => exact .nil
  | cons label rest ih => exact .cons (RogozhinInputConstructionMachine.weight_execution _ _) ih

inductive ExponentTailExecution : List Nat → List Symbol → List Symbol → Nat → Prop where
  | nil (tail : List Symbol) : ExponentTailExecution [] tail tail 1
  | cons {count followingOperations onesOperations : Nat} {counts : List Nat}
      {tail following output : List Symbol}
      (followingRun : ExponentTailExecution counts tail following followingOperations)
      (onesRun : CookWordConstructionMachine.ReplicateExecution Symbol.s0 count following output onesOperations) :
      ExponentTailExecution (count :: counts) tail (.s1 :: .s1 :: output)
        (5 + followingOperations + onesOperations)

theorem exponentTail_execution (counts : List Nat) (tail : List Symbol) :
    ExponentTailExecution counts tail (exponentTail counts tail).value (exponentTail counts tail).operations := by
  induction counts with
  | nil => exact .nil _
  | cons count rest ih => exact .cons ih (CookWordConstructionMachine.replicateOnto_execution _ _ _)

inductive ExponentExecution : List Nat → List Symbol → Nat → Prop where
  | nil : ExponentExecution [] [] 2
  | cons {count followingOperations onesOperations : Nat} {counts : List Nat}
      {following output : List Symbol}
      (followingRun : ExponentTailExecution counts [] following followingOperations)
      (onesRun : CookWordConstructionMachine.ReplicateExecution Symbol.s0 count following output onesOperations) :
      ExponentExecution (count :: counts) (.s1 :: output) (5 + followingOperations + onesOperations)

theorem exponentCode_execution (counts : List Nat) :
    ExponentExecution counts (exponentCode counts).value (exponentCode counts).operations := by
  cases counts with
  | nil => exact .nil
  | cons count rest =>
      exact .cons (exponentTail_execution _ _) (CookWordConstructionMachine.replicateOnto_execution _ _ _)

inductive ProductionExponentsExecution (program : RogozhinTagInput.Program) (label : Nat) :
    List Nat → Nat → Prop where
  | construct {count countOperations rowOperations reverseOperations weightsOperations
      last this lastOperations thisOperations copyOperations : Nat}
      {row reversed weights output : List Nat}
      (countRun : RogozhinInputConstructionMachine.LengthExecution program.productions count countOperations)
      (rowRun : RogozhinInputConstructionMachine.LookupExecution [] program.productions label row rowOperations)
      (reverseRun : RogozhinInputConstructionMachine.ReverseExecution (dropTwo row).value [] reversed reverseOperations)
      (weightsRun : WeightsExecution program reversed weights weightsOperations)
      (lastRun : RogozhinInputConstructionMachine.WeightExecution program
        (ParserNatPrimitive.subtract count 1).value last lastOperations)
      (thisRun : RogozhinInputConstructionMachine.WeightExecution program label this thisOperations)
      (copyRun : CopyExecution weights [last, (ParserNatPrimitive.subtract last this).value] output copyOperations) :
      ProductionExponentsExecution program label output
        (7 + countOperations + (ParserNatPrimitive.subtract count 1).operations +
          rowOperations + (dropTwo row).operations + reverseOperations + weightsOperations +
          lastOperations + thisOperations + (ParserNatPrimitive.subtract last this).operations + copyOperations)

theorem productionExponents_execution (program : RogozhinTagInput.Program) (label : Nat) :
    ProductionExponentsExecution program label (productionExponents program label).value
      (productionExponents program label).operations :=
  .construct (RogozhinInputConstructionMachine.length_execution _)
    (RogozhinInputConstructionMachine.lookup_execution _ _ _)
    (RogozhinInputConstructionMachine.reverseOnto_execution _ _)
    (mapWeights_execution _ _) (RogozhinInputConstructionMachine.weight_execution _ _)
    (RogozhinInputConstructionMachine.weight_execution _ _) (copy_execution _ _)

inductive ProductionExecution (program : RogozhinTagInput.Program) (label : Nat) :
    List Symbol → Nat → Prop where
  | construct {counts : List Nat} {output : List Symbol} {countOperations outputOperations : Nat}
      (countRun : ProductionExponentsExecution program label counts countOperations)
      (outputRun : ExponentExecution counts output outputOperations) :
      ProductionExecution program label (.s1 :: .s0 :: output) (2 + countOperations + outputOperations)

theorem productionCode_execution (program : RogozhinTagInput.Program) (label : Nat) :
    ProductionExecution program label (productionCode program label).value (productionCode program label).operations :=
  .construct (productionExponents_execution _ _) (exponentCode_execution _)

inductive DescendingExecution : Nat → List Nat → Nat → Prop where
  | zero : DescendingExecution 0 [] 2
  | succ {count operations : Nat} {output : List Nat}
      (rest : DescendingExecution count output operations) :
      DescendingExecution (count + 1) (count :: output) (4 + operations)

theorem descending_execution (count : Nat) :
    DescendingExecution count (descending count).value (descending count).operations := by
  induction count with
  | zero => exact .zero
  | succ count ih => exact .succ ih

inductive ProductionsExecution (program : RogozhinTagInput.Program) :
    List Nat → List Symbol → List Symbol → Nat → Prop where
  | nil (tail : List Symbol) : ProductionsExecution program [] tail tail 1
  | cons {label productionOperations followingOperations copyOperations : Nat} {labels : List Nat}
      {production tail following output : List Symbol}
      (productionRun : ProductionExecution program label production productionOperations)
      (followingRun : ProductionsExecution program labels tail following followingOperations)
      (copyRun : CopyExecution production following output copyOperations) :
      ProductionsExecution program (label :: labels) tail output
        (3 + productionOperations + followingOperations + copyOperations)

theorem productionCodes_execution (program : RogozhinTagInput.Program) (labels : List Nat) (tail : List Symbol) :
    ProductionsExecution program labels tail (productionCodes program labels tail).value
      (productionCodes program labels tail).operations := by
  induction labels with
  | nil => exact .nil _
  | cons label rest ih => exact .cons (productionCode_execution _ _) ih (copy_execution _ _)

inductive ProgramExecution (program : RogozhinTagInput.Program) : List Symbol → Nat → Prop where
  | construct {count countOperations labelsOperations outputOperations : Nat}
      {labels : List Nat} {output : List Symbol}
      (countRun : RogozhinInputConstructionMachine.LengthExecution program.productions count countOperations)
      (labelsRun : DescendingExecution count labels labelsOperations)
      (outputRun : ProductionsExecution program labels [.s1] output outputOperations) :
      ProgramExecution program (.s3 :: .s1 :: output) (5 + countOperations + labelsOperations + outputOperations)

theorem programCode_execution (program : RogozhinTagInput.Program) :
    ProgramExecution program (programCode program).value (programCode program).operations :=
  .construct (RogozhinInputConstructionMachine.length_execution _) (descending_execution _)
    (productionCodes_execution _ _ _)

inductive CompilationExecution (job : RogozhinTagInput.Job) : Rogozhin46.Config → Nat → Prop where
  | construct {program left data : List Symbol} {programOperations leftOperations dataOperations : Nat}
      (programRun : ProgramExecution job.program program programOperations)
      (leftRun : RogozhinInputConstructionMachine.ReverseExecution program [] left leftOperations)
      (dataRun : RogozhinInputConstructionMachine.DataExecution job.program job.word data dataOperations) :
      CompilationExecution job (configuration left data).value
        (4 + programOperations + leftOperations + dataOperations + (configuration left data).operations)

theorem compile_execution (job : RogozhinTagInput.Job) :
    CompilationExecution job (compile job).value (compile job).operations :=
  .construct (programCode_execution _) (RogozhinInputConstructionMachine.reverseOnto_execution _ _)
    (RogozhinInputConstructionMachine.dataCode_execution _ _)

inductive CookExecution (job : RogozhinTagInput.Job) : List Bool → Nat → Prop where
  | construct {configuration : Rogozhin46.Config} {output : List Bool} {tapeOperations bitOperations : Nat}
      (tapeRun : CompilationExecution job configuration tapeOperations)
      (bitRun : CookWordConstructionMachine.CanonicalBitsExecution configuration output bitOperations) :
      CookExecution job output (tapeOperations + bitOperations)

theorem cookBits_execution (job : RogozhinTagInput.Job) :
    CookExecution job (cookBits job).value (cookBits job).operations :=
  .construct (compile_execution _) (CookWordConstructionMachine.canonicalBits_execution _)

end PureSFormal.Computation.RogozhinProgramConstructionMachine
