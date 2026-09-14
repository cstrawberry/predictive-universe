import PureSFormal.Computation.ThreeCounterSymbolReadbackPrimitive

namespace PureSFormal.Computation.ThreeCounterLiveReadbackPrimitive

open PureSFormal.PureS
open PureSFormal.PureS.ParserPrimitiveMachine (Result)
open ThreeCounter (Program Instruction Register State)
open CounterMachineTag (Symbol)
open ThreeCounterTagTypedConstructionMachine (payload scale symbolPayload)
open ThreeCounterSymbolReadbackPrimitive (mass count equalWords)

set_option maxRecDepth 4096

def counter (current : Instruction) (control : Nat) (register : Register) (word : List Symbol) : Result Nat :=
  let code := payload control register
  let factor := scale current register
  let observed := count (.first code.value) word
  let quotient := ParserNatDivisionPrimitive.divMod factor.value observed.value
  let output := ThreeCounterRadixReadbackPrimitive.read quotient.value.1
  ⟨output.value, code.operations + factor.operations + observed.operations + quotient.operations + output.operations + 10⟩

theorem counter_value (program : Program) (control : Nat) (register : Register) (word : List Symbol) :
    (counter (ThreeCounter.instructionAt program control) control register word).value =
      ThreeCounterTagOutputBoundary.readCounter program control register word := by
  simp only [counter, ThreeCounterRadixReadbackPrimitive.read_value, ParserNatDivisionPrimitive.divMod_value,
    ThreeCounterSymbolReadbackPrimitive.count_value, ThreeCounterTagTypedConstructionMachine.payload_value,
    ThreeCounterTagTypedConstructionMachine.scale_value, ThreeCounterTagOutputBoundary.readCounter,
    ThreeCounterTag.dataSymbol]

theorem payload_le (control : Nat) (register : Register) : (payload control register).value ≤ 3 * control + 2 := by
  rw [ThreeCounterTagTypedConstructionMachine.payload_value]
  cases register <;> exact Nat.add_le_add_left (by decide) _

def counterBudget (control cells : Nat) : Nat :=
  (19 * control + 12) + 5 + (cells * (4 * (3 * control + 2) + 18) + 2) +
    (22 * cells + 3) + ((cells + 1) * (22 * cells + 18)) + 10

theorem counterBudget_mono {control bound : Nat} (bounded : control ≤ bound) (cells : Nat) :
    counterBudget control cells ≤ counterBudget bound cells := by
  unfold counterBudget
  exact Nat.add_le_add_right (Nat.add_le_add_right (Nat.add_le_add_right
    (Nat.add_le_add
      (Nat.add_le_add_right (Nat.add_le_add_right (Nat.mul_le_mul_left 19 bounded) 12) 5)
      (Nat.add_le_add_right (Nat.mul_le_mul_left cells (Nat.add_le_add_right
        (Nat.mul_le_mul_left 4 (Nat.add_le_add_right (Nat.mul_le_mul_left 3 bounded) 2)) 18)) 2))
    (22 * cells + 3)) ((cells + 1) * (22 * cells + 18))) 10

theorem counter_quotient_le (current : Instruction) (control : Nat) (register : Register) (word : List Symbol) :
    (ParserNatDivisionPrimitive.divMod (scale current register).value
      (count (.first (payload control register).value) word).value).value.1 ≤ word.length :=
  Nat.le_trans (ParserNatDivisionPrimitive.quotient_le _ _) (ThreeCounterSymbolReadbackPrimitive.count_le_length _ _)

theorem counter_operations_le (current : Instruction) (control : Nat) (register : Register) (word : List Symbol) :
    (counter current control register word).operations ≤ counterBudget control word.length := by
  have counted := Nat.le_trans (ThreeCounterSymbolReadbackPrimitive.count_operations_le (.first (payload control register).value) word)
    (Nat.add_le_add_right (Nat.mul_le_mul_left word.length
      (Nat.add_le_add_right (Nat.mul_le_mul_left 4 (payload_le control register)) 18)) 2)
  have divided := Nat.le_trans (ParserNatDivisionPrimitive.divMod_operations_le (scale current register).value
    (count (.first (payload control register).value) word).value)
    (Nat.add_le_add_right (Nat.mul_le_mul
      (Nat.add_le_add_right (Nat.mul_le_mul_left 4 (ThreeCounterTagTypedConstructionMachine.scale_value_le_two current register)) 14)
      (ThreeCounterSymbolReadbackPrimitive.count_le_length _ _)) 3)
  have extracted := Nat.le_trans (ThreeCounterRadixReadbackPrimitive.read_operations_le
    (ParserNatDivisionPrimitive.divMod (scale current register).value
      (count (.first (payload control register).value) word).value).value.1)
    (Nat.mul_le_mul (Nat.add_le_add_right (counter_quotient_le current control register word) 1)
      (Nat.add_le_add_right (Nat.mul_le_mul_left 22 (counter_quotient_le current control register word)) 18))
  exact Nat.add_le_add_right (Nat.add_le_add (Nat.add_le_add (Nat.add_le_add
    (Nat.add_le_add (ThreeCounterTagTypedConstructionMachine.payload_operations_le control register)
      (ThreeCounterTagTypedConstructionMachine.scale_operations_le current register)) counted) divided) extracted) 10

theorem counter_power_le (current : Instruction) (control : Nat) (register : Register) (word : List Symbol) :
    2 ^ (counter current control register word).value ≤ word.length + 1 := by
  simp only [counter, ThreeCounterRadixReadbackPrimitive.read_value]
  exact Nat.le_trans (ThreeCounterRadixReadbackPrimitive.radixExponent_power_le _)
    (Nat.add_le_add_right (counter_quotient_le current control register word) 1)

theorem counter_size_le (current : Instruction) (control : Nat) (register : Register) (word : List Symbol) :
    (counter current control register word).value ≤ word.length + 1 :=
  Nat.le_trans (ThreeCounterTagOutputBoundary.value_le_radix _) (counter_power_le _ _ _ _)

def state (current : Instruction) (control : Nat) (word : List Symbol) : Result State :=
  let left := counter current control .left word
  let right := counter current control .right word
  let scratch := counter current control .scratch word
  ⟨⟨control, left.value, right.value, scratch.value, .running⟩,
    left.operations + right.operations + scratch.operations + 6⟩

theorem state_operations_le (current : Instruction) (control : Nat) (word : List Symbol) :
    (state current control word).operations ≤ 3 * counterBudget control word.length + 6 := by
  have bound := Nat.add_le_add_right (Nat.add_le_add
    (Nat.add_le_add (counter_operations_le current control .left word) (counter_operations_le current control .right word))
    (counter_operations_le current control .scratch word)) 6
  simpa only [state, show 3 = 1 + 1 + 1 by rfl, Nat.add_mul, Nat.one_mul] using bound

theorem blockBudget_le {control value cells : Nat} (power : 2 ^ value ≤ cells + 1) (size : value ≤ cells + 1) :
    ThreeCounterTagInputConstructionMachine.blockBudget control value ≤ 30 * (cells + 1) + 19 * control + 22 := by
  have bound := Nat.add_le_add_right (Nat.add_le_add
    (Nat.add_le_add (Nat.add_le_add (Nat.add_le_add_left
      (Nat.add_le_add (Nat.mul_le_mul_left 4 power) (Nat.mul_le_mul_left 3 size)) (1 + 5))
      (Nat.add_le_add_right (Nat.mul_le_mul_left 15 power) 2)) (Nat.le_refl (19 * control + 12)))
      (Nat.add_le_add_right (Nat.mul_le_mul_left 8 power) 1)) 1
  simpa only [ThreeCounterTagInputConstructionMachine.blockBudget, show 30 = 4 + 3 + 15 + 8 by rfl,
    show 22 = 1 + 5 + 2 + 12 + 1 + 1 by rfl,
    Nat.add_mul, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound

def reencodeBudget (programSize control cells : Nat) : Nat :=
  10 * programSize + 3 * (30 * (cells + 1) + 19 * control + 22) + 29

theorem state_reencode_operations_le (program : Program) (current : Instruction) (control : Nat) (word : List Symbol) :
    (ThreeCounterTagInputConstructionMachine.typedState program (state current control word).value).operations ≤
      reencodeBudget program.length control word.length := by
  have bounded := ThreeCounterTagInputConstructionMachine.typedState_operations_le program (state current control word).value
  apply Nat.le_trans bounded
  have scratch := blockBudget_le (control := control) (counter_power_le current control .scratch word) (counter_size_le current control .scratch word)
  have right := blockBudget_le (control := control) (counter_power_le current control .right word) (counter_size_le current control .right word)
  have left := blockBudget_le (control := control) (counter_power_le current control .left word) (counter_size_le current control .left word)
  have bound := Nat.add_le_add_right (Nat.add_le_add_right (Nat.add_le_add_right
    (Nat.add_le_add (Nat.add_le_add (Nat.add_le_add_left scratch (4 + (5 * program.length + 3))) right) left)
    (5 * program.length + 9)) 9) 4
  simpa only [ThreeCounterTagInputConstructionMachine.canonicalBudget, state, reencodeBudget,
    show 10 = 5 + 5 by rfl, show 3 = 1 + 1 + 1 by rfl, show 29 = 4 + 3 + 9 + 9 + 4 by rfl,
    Nat.add_mul, Nat.one_mul, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound

theorem state_value (program : Program) (control : Nat) (word : List Symbol) :
    (state (ThreeCounter.instructionAt program control) control word).value =
      ⟨control, ThreeCounterTagOutputBoundary.readCounter program control .left word,
        ThreeCounterTagOutputBoundary.readCounter program control .right word,
        ThreeCounterTagOutputBoundary.readCounter program control .scratch word, .running⟩ := by
  simp only [state, counter_value]

def validate (program : Program) (current : Instruction) (control : Nat) (word : List Symbol) : Result (Option State) :=
  let candidate := state current control word
  let encoded := ThreeCounterTagInputConstructionMachine.typedState program candidate.value
  let compared := equalWords encoded.value word
  ⟨if compared.value then some candidate.value else none,
    candidate.operations + encoded.operations + compared.operations + 6⟩

theorem validate_value (program : Program) (current : Instruction) (control : Nat) (word : List Symbol) :
    (validate program current control word).value =
      if ThreeCounterTag.encodeState program (state current control word).value = word
      then some (state current control word).value else none := by
  simp only [validate]
  simp only [ThreeCounterSymbolReadbackPrimitive.equalWords_value, ThreeCounterTagInputConstructionMachine.typedState_value]

def validationBudget (programSize control wordMass cells : Nat) : Nat :=
  (3 * counterBudget control cells + 6) + reencodeBudget programSize control cells +
    (4 * wordMass + 18 * cells + 3) + 6

theorem validate_operations_le (program : Program) (current : Instruction) (control : Nat) (word : List Symbol) :
    (validate program current control word).operations ≤ validationBudget program.length control (mass word) word.length :=
  Nat.add_le_add_right (Nat.add_le_add
    (Nat.add_le_add (state_operations_le current control word) (state_reencode_operations_le program current control word))
    (ThreeCounterSymbolReadbackPrimitive.equalWords_operations_le _ _)) 6

def atControl (program : Program) (control : Nat) (word : List Symbol) : Result (Option State) :=
  let current := ThreeCounterTagTypedConstructionMachine.instruction program control
  if ThreeCounterTag.instructionLive current.value then
    let output := validate program current.value control word
    ⟨output.value, current.operations + output.operations + 3⟩
  else ⟨none, current.operations + 3⟩

theorem atControl_value (program : Program) (control : Nat) (word : List Symbol) :
    (atControl program control word).value =
      if ThreeCounterTag.instructionLive (ThreeCounter.instructionAt program control) then
        if ThreeCounterTag.encodeState program (state (ThreeCounter.instructionAt program control) control word).value = word
        then some (state (ThreeCounter.instructionAt program control) control word).value else none
      else none := by
  simp only [atControl, ThreeCounterTagTypedConstructionMachine.instruction_value]
  split
  · exact validate_value _ _ _ _
  · rfl

theorem atControl_operations_le (program : Program) (control : Nat) (word : List Symbol) :
    (atControl program control word).operations ≤
      (5 * program.length + 3) + validationBudget program.length control (mass word) word.length + 3 := by
  have bound := Nat.add_le_add_right (Nat.add_le_add
    (ThreeCounterTagTypedConstructionMachine.instruction_operations_le program control)
    (validate_operations_le program (ThreeCounterTagTypedConstructionMachine.instruction program control).value control word)) 3
  simp only [atControl]
  split
  · exact bound
  · exact Nat.le_trans (Nat.add_le_add_right (Nat.le_add_right _ _) 3) bound

def decode (program : Program) (word : List Symbol) : Result (Option State) :=
  match word with
  | .head control :: _ =>
      let output := atControl program control word
      ⟨output.value, output.operations + 5⟩
  | _ => ⟨none, 5⟩

theorem decode_value (program : Program) (word : List Symbol) :
    (decode program word).value = ThreeCounterTagOutputBoundary.decodeLive? program word := by
  cases word with
  | nil => rfl
  | cons first rest => cases first with
    | head control =>
        simp only [decode, atControl_value, ThreeCounterTagOutputBoundary.decodeLive?,
          ThreeCounterTagOutputBoundary.readLive?, List.head?_cons, state_value]
        split <;> rfl
    | _ => rfl

theorem decode_fields (program : Program) (word : List Symbol) (output : State)
    (found : (decode program word).value = some output) :
    output.control ≤ mass word ∧ output.left ≤ word.length + 1 ∧
      output.right ≤ word.length + 1 ∧ output.scratch ≤ word.length + 1 ∧ output.status = .running := by
  cases word with
  | nil => cases found
  | cons first rest => cases first with
    | head control =>
        simp only [decode, atControl] at found
        split at found
        · simp only [validate] at found
          split at found
          · cases found
            exact ⟨Nat.le_add_right _ _, counter_size_le _ _ _ _, counter_size_le _ _ _ _, counter_size_le _ _ _ _, rfl⟩
          · cases found
        · cases found
    | _ => cases found

theorem validationBudget_mono {control bound : Nat} (bounded : control ≤ bound) (programSize wordMass cells : Nat) :
    validationBudget programSize control wordMass cells ≤ validationBudget programSize bound wordMass cells := by
  unfold validationBudget reencodeBudget
  exact Nat.add_le_add_right (Nat.add_le_add_right (Nat.add_le_add
    (Nat.add_le_add_right (Nat.mul_le_mul_left 3 (counterBudget_mono bounded cells)) 6)
    (Nat.add_le_add_right (Nat.add_le_add_left (Nat.mul_le_mul_left 3 (Nat.add_le_add_right
      (Nat.add_le_add_left (Nat.mul_le_mul_left 19 bounded) (30 * (cells + 1))) 22)) (10 * programSize)) 29))
    (4 * wordMass + 18 * cells + 3)) 6

def decodeBudget (programSize wordMass cells : Nat) : Nat :=
  (5 * programSize + 3) + validationBudget programSize wordMass wordMass cells + 8

theorem counterBudget_mono_all {control controlBound cells cellsBound : Nat}
    (controlLe : control ≤ controlBound) (cellsLe : cells ≤ cellsBound) :
    counterBudget control cells ≤ counterBudget controlBound cellsBound := by
  unfold counterBudget
  exact Nat.add_le_add_right (Nat.add_le_add (Nat.add_le_add (Nat.add_le_add
    (Nat.add_le_add_right (Nat.add_le_add_right (Nat.mul_le_mul_left 19 controlLe) 12) 5)
    (Nat.add_le_add_right (Nat.mul_le_mul cellsLe (Nat.add_le_add_right
      (Nat.mul_le_mul_left 4 (Nat.add_le_add_right (Nat.mul_le_mul_left 3 controlLe) 2)) 18)) 2))
    (Nat.add_le_add_right (Nat.mul_le_mul_left 22 cellsLe) 3))
    (Nat.mul_le_mul (Nat.add_le_add_right cellsLe 1)
      (Nat.add_le_add_right (Nat.mul_le_mul_left 22 cellsLe) 18))) 10

theorem decodeBudget_mono {programSize programBound wordMass massBound cells cellsBound : Nat}
    (programLe : programSize ≤ programBound) (massLe : wordMass ≤ massBound) (cellsLe : cells ≤ cellsBound) :
    decodeBudget programSize wordMass cells ≤ decodeBudget programBound massBound cellsBound := by
  unfold decodeBudget validationBudget reencodeBudget
  exact Nat.add_le_add_right (Nat.add_le_add
    (Nat.add_le_add_right (Nat.mul_le_mul_left 5 programLe) 3)
    (Nat.add_le_add_right (Nat.add_le_add
      (Nat.add_le_add (Nat.add_le_add_right (Nat.mul_le_mul_left 3 (counterBudget_mono_all massLe cellsLe)) 6)
        (Nat.add_le_add_right (Nat.add_le_add (Nat.mul_le_mul_left 10 programLe)
          (Nat.mul_le_mul_left 3 (Nat.add_le_add_right (Nat.add_le_add
            (Nat.mul_le_mul_left 30 (Nat.add_le_add_right cellsLe 1)) (Nat.mul_le_mul_left 19 massLe)) 22))) 29))
      (Nat.add_le_add_right (Nat.add_le_add (Nat.mul_le_mul_left 4 massLe) (Nat.mul_le_mul_left 18 cellsLe)) 3)) 6)) 8

theorem decode_operations_le (program : Program) (word : List Symbol) :
    (decode program word).operations ≤ decodeBudget program.length (mass word) word.length := by
  have small : 5 ≤ decodeBudget program.length (mass word) word.length :=
    Nat.le_trans (by decide : 5 ≤ 8) (Nat.le_add_left _ _)
  cases word with
  | nil => exact small
  | cons first rest => cases first with
    | head control =>
        have bounded : control ≤ mass (.head control :: rest) := Nat.le_add_right _ _
        have step := Nat.add_le_add_right (atControl_operations_le program control (.head control :: rest)) 5
        exact Nat.le_trans step (by
          have increased := Nat.add_le_add_right (Nat.add_le_add_left
            (validationBudget_mono bounded program.length (mass (.head control :: rest)) (.head control :: rest).length)
            (5 * program.length + 3)) 8
          simpa only [decodeBudget, Nat.add_assoc] using increased)
    | _ => exact small

inductive CounterExecution (current : Instruction) (control : Nat) (register : Register) (word : List Symbol) : Nat → Nat → Prop where
  | construct {counted quotient remainder output countOperations divisionOperations outputOperations : Nat}
      (countRun : ThreeCounterSymbolReadbackPrimitive.CountExecution (.first (payload control register).value) word counted countOperations)
      (division : DeterministicTapeDecodeConstructionMachine.DivisionExecution (scale current register).value counted (quotient, remainder) divisionOperations)
      (extraction : ThreeCounterRadixReadbackPrimitive.ExponentExecution quotient quotient output outputOperations) :
      CounterExecution current control register word output
        ((payload control register).operations + (scale current register).operations + countOperations + divisionOperations + outputOperations + 10)

theorem counter_execution (current : Instruction) (control : Nat) (register : Register) (word : List Symbol) :
    CounterExecution current control register word (counter current control register word).value (counter current control register word).operations :=
  .construct (ThreeCounterSymbolReadbackPrimitive.count_execution _ _)
    (DeterministicTapeDecodeConstructionMachine.division_execution _ _) (ThreeCounterRadixReadbackPrimitive.read_execution _)

inductive StateExecution (current : Instruction) (control : Nat) (word : List Symbol) : State → Nat → Prop where
  | construct {left right scratch leftOperations rightOperations scratchOperations : Nat}
      (leftRun : CounterExecution current control .left word left leftOperations)
      (rightRun : CounterExecution current control .right word right rightOperations)
      (scratchRun : CounterExecution current control .scratch word scratch scratchOperations) :
      StateExecution current control word ⟨control, left, right, scratch, .running⟩
        (leftOperations + rightOperations + scratchOperations + 6)

theorem state_execution (current : Instruction) (control : Nat) (word : List Symbol) :
    StateExecution current control word (state current control word).value (state current control word).operations :=
  .construct (counter_execution _ _ _ _) (counter_execution _ _ _ _) (counter_execution _ _ _ _)

inductive ValidationExecution (program : Program) (current : Instruction) (control : Nat) (word : List Symbol) : Option State → Nat → Prop where
  | construct {candidate : State} {encoded : List Symbol} {equal : Bool} {stateOperations encodedOperations equalOperations : Nat}
      (candidateRun : StateExecution current control word candidate stateOperations)
      (materialization : ThreeCounterTagInputConstructionMachine.TypedExecution program candidate encoded encodedOperations)
      (comparison : ThreeCounterSymbolReadbackPrimitive.EqualityExecution encoded word equal equalOperations) :
      ValidationExecution program current control word (if equal then some candidate else none)
        (stateOperations + encodedOperations + equalOperations + 6)

theorem validate_execution (program : Program) (current : Instruction) (control : Nat) (word : List Symbol) :
    ValidationExecution program current control word (validate program current control word).value (validate program current control word).operations :=
  .construct (state_execution _ _ _) (ThreeCounterTagInputConstructionMachine.typedState_execution _ _)
    (ThreeCounterSymbolReadbackPrimitive.equalWords_execution _ _)

inductive AtControlExecution (program : Program) (control : Nat) (word : List Symbol) : Option State → Nat → Prop where
  | live {current : Instruction} {output : Option State} {instructionOperations outputOperations : Nat}
      (lookup : RogozhinInputConstructionMachine.LookupExecution .halt program control current instructionOperations)
      (running : ThreeCounterTag.instructionLive current = true)
      (validation : ValidationExecution program current control word output outputOperations) :
      AtControlExecution program control word output (instructionOperations + outputOperations + 3)
  | halted {current : Instruction} {instructionOperations : Nat}
      (lookup : RogozhinInputConstructionMachine.LookupExecution .halt program control current instructionOperations)
      (stopped : ThreeCounterTag.instructionLive current ≠ true) :
      AtControlExecution program control word none (instructionOperations + 3)

theorem atControl_execution (program : Program) (control : Nat) (word : List Symbol) :
    AtControlExecution program control word (atControl program control word).value (atControl program control word).operations := by
  simp only [atControl]
  split
  next live => exact .live (RogozhinInputConstructionMachine.lookup_execution _ _ _) live (validate_execution _ _ _ _)
  next halted => exact .halted (RogozhinInputConstructionMachine.lookup_execution _ _ _) halted

inductive DecodeExecution (program : Program) : List Symbol → Option State → Nat → Prop where
  | head {control : Nat} {tail : List Symbol} {output : Option State} {operations : Nat}
      (current : AtControlExecution program control (.head control :: tail) output operations) :
      DecodeExecution program (.head control :: tail) output (operations + 5)
  | invalid (word : List Symbol)
      (bad : match word with | .head _ :: _ => False | _ => True) :
      DecodeExecution program word none 5

theorem decode_execution (program : Program) (word : List Symbol) :
    DecodeExecution program word (decode program word).value (decode program word).operations := by
  cases word with
  | nil => exact .invalid [] True.intro
  | cons first rest => cases first with
    | head control => exact .head (atControl_execution _ _ _)
    | _ => exact .invalid _ True.intro

end PureSFormal.Computation.ThreeCounterLiveReadbackPrimitive

