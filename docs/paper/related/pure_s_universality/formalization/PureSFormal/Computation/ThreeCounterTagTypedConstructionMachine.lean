import PureSFormal.Computation.DeletionTwoTableConstructionMachine

/-!
# Primitive construction of typed three-counter tag productions

The source table is read as an immutable list. Branch targets are unary
numbers; input-sensitive bounds count their literal constructor chains.
These routines build syntax and never execute a counter instruction.
-/

namespace PureSFormal.Computation.ThreeCounterTagTypedConstructionMachine

open PureSFormal.PureS.ParserPrimitiveMachine (Result)
open PureSFormal.PureS
open ThreeCounter (Instruction Register Program)
open CounterMachineTag (Symbol)

def targetMass : Instruction → Nat
  | .halt => 0
  | .increment _ next => next
  | .decrementJump _ positive zeroNext => positive + zeroNext

def targetCells : Program → Nat
  | [] => 0
  | instruction :: rest => targetMass instruction + targetCells rest

theorem targetMass_instructionAt_le (program : Program) (control : Nat) :
    targetMass (ThreeCounter.instructionAt program control) ≤ targetCells program := by
  induction program generalizing control with
  | nil => exact Nat.le_refl _
  | cons instruction rest ih =>
      cases control with
      | zero => exact Nat.le_add_right _ _
      | succ control =>
          exact Nat.le_trans (ih control) (Nat.le_add_left _ _)

def instruction (program : Program) (control : Nat) : Result Instruction :=
  RogozhinInputConstructionMachine.lookup .halt program control

theorem instruction_value (program : Program) (control : Nat) :
    (instruction program control).value = ThreeCounter.instructionAt program control := by
  induction program generalizing control with
  | nil => rfl
  | cons first rest ih =>
      cases control with
      | zero => rfl
      | succ control => exact ih control

theorem instruction_operations_le (program : Program) (control : Nat) :
    (instruction program control).operations ≤ 5 * program.length + 3 := by
  induction program generalizing control with
  | nil => exact (by decide : 2 ≤ 3)
  | cons first rest ih =>
      cases control with
      | zero => exact Nat.le_add_left _ _
      | succ control =>
          have bound := Nat.add_le_add_left (ih control) 5
          apply Nat.le_trans bound
          apply Nat.le_of_eq
          rw [List.length_cons, Nat.mul_succ]
          simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

def branch (instruction : Instruction) (positive : Bool) : Result Nat :=
  match instruction with
  | .halt => ⟨0, 1⟩
  | .increment _ next => ⟨next, 2⟩
  | .decrementJump _ positiveNext zeroNext =>
      ⟨if positive then positiveNext else zeroNext, 3⟩

theorem branch_value (instruction : Instruction) (positive : Bool) :
    (branch instruction positive).value = ThreeCounterTag.branchNext instruction positive := by
  cases instruction <;> rfl

theorem branch_operations_le (instruction : Instruction) (positive : Bool) :
    (branch instruction positive).operations ≤ 3 := by
  cases instruction <;> simp only [branch] <;> decide

theorem branch_value_le (instruction : Instruction) (positive : Bool) :
    (branch instruction positive).value ≤ targetMass instruction := by
  cases instruction with
  | halt => exact Nat.le_refl _
  | increment register next => exact Nat.le_refl _
  | decrementJump register positiveNext zeroNext =>
      cases positive with
      | false => exact Nat.le_add_left _ _
      | true => exact Nat.le_add_right _ _

def registerCode : Register → Result Nat
  | .left => ⟨0, 1⟩ | .right => ⟨1, 1⟩ | .scratch => ⟨2, 1⟩

theorem registerCode_value (register : Register) :
    (registerCode register).value = ThreeCounterTag.registerId register := by cases register <;> rfl

theorem registerCode_operations (register : Register) : (registerCode register).operations = 1 := by
  cases register <;> rfl

theorem registerCode_le_two (register : Register) : (registerCode register).value ≤ 2 := by
  cases register <;> decide

def payload (control : Nat) (register : Register) : Result Nat :=
  let code := registerCode register
  let triple := ParserNatPrimitive.multiply 3 control
  let result := ParserNatPrimitive.add code.value triple.value
  ⟨result.value, code.operations + triple.operations + result.operations⟩

theorem payload_value (control : Nat) (register : Register) :
    (payload control register).value = ThreeCounterTag.payload control register := by
  simp only [payload, ParserNatPrimitive.add_value, ParserNatPrimitive.multiply_value,
    registerCode_value, ThreeCounterTag.payload, Nat.add_comm]

theorem payload_operations_le (control : Nat) (register : Register) :
    (payload control register).operations ≤ 19 * control + 12 := by
  have codeBound := Nat.add_le_add_right (Nat.mul_le_mul_left 4 (registerCode_le_two register)) 1
  simp only [payload, registerCode_operations, ParserNatPrimitive.add_operations,
    ParserNatPrimitive.multiply_operations]
  have bound := Nat.add_le_add_left codeBound (1 + ((4 * 3 + 7) * control + 2))
  apply Nat.le_trans bound
  apply Nat.le_of_eq
  change 1 + (19 * control + 2) + (4 * 2 + 1) = 19 * control + (1 + 2 + (4 * 2 + 1))
  simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

def decodePayload : Nat → Result (Nat × Register)
  | 0 => ⟨(0, .left), 2⟩
  | 1 => ⟨(0, .right), 4⟩
  | 2 => ⟨(0, .scratch), 6⟩
  | .succ (.succ (.succ code)) =>
      let rest := decodePayload code
      ⟨(rest.value.1 + 1, rest.value.2), 10 + rest.operations⟩

theorem decodePayload_value (code : Nat) :
    (decodePayload code).value = ThreeCounterTag.decodePayload code := by
  induction code using Nat.strongRecOn with
  | ind code ih =>
      cases code with
      | zero => rfl
      | succ code =>
          cases code with
          | zero => rfl
          | succ code =>
              cases code with
              | zero => rfl
              | succ code =>
                  have smaller : code < code + 1 + 1 + 1 :=
                    Nat.lt_trans (Nat.lt_succ_self code)
                      (Nat.lt_trans (Nat.lt_succ_self _) (Nat.lt_succ_self _))
                  simp only [decodePayload, ThreeCounterTag.decodePayload, ih code smaller]

theorem decodePayload_operations_le (code : Nat) :
    (decodePayload code).operations ≤ 4 * code + 2 := by
  induction code using Nat.strongRecOn with
  | ind code ih =>
      cases code with
      | zero => exact Nat.le_refl _
      | succ code =>
          cases code with
          | zero => exact (by decide : 4 ≤ 4 * 1 + 2)
          | succ code =>
              cases code with
              | zero => exact (by decide : 6 ≤ 4 * 2 + 2)
              | succ code =>
                  have smaller : code < code + 1 + 1 + 1 :=
                    Nat.lt_trans (Nat.lt_succ_self code)
                      (Nat.lt_trans (Nat.lt_succ_self _) (Nat.lt_succ_self _))
                  have bound := Nat.add_le_add_left (ih code smaller) 10
                  apply Nat.le_trans bound
                  calc
                    10 + (4 * code + 2) = 4 * code + 2 + 10 := Nat.add_comm _ _
                    _ ≤ 4 * code + 2 + 12 := Nat.add_le_add_left (by decide : 10 ≤ 12) _
                    _ = _ := by
                      simp only [Nat.mul_succ]

def header (program : Program) (control : Nat) : Result (List Symbol) :=
  let found := instruction program control
  match found.value with
  | .halt => ⟨[.halt, .sink], found.operations + 4⟩
  | _ => ⟨[.head control, .filler control], found.operations + 6⟩

theorem header_value (program : Program) (control : Nat) :
    (header program control).value = ThreeCounterTag.header program control := by
  unfold ThreeCounterTag.header
  rw [← instruction_value]
  cases found : (instruction program control).value <;> simp only [header, found]

theorem header_operations_le (program : Program) (control : Nat) :
    (header program control).operations ≤ 5 * program.length + 9 := by
  have bound := instruction_operations_le program control
  cases found : (instruction program control).value with
  | halt =>
      simp only [header, found]
      apply Nat.le_trans (Nat.add_le_add_right bound 4)
      change 5 * program.length + 3 + 4 ≤ 5 * program.length + 9
      rw [Nat.add_assoc]
      exact Nat.add_le_add_left (by decide : 3 + 4 ≤ 9) _
  | increment register next =>
      simp only [header, found]
      exact Nat.add_le_add_right bound 6
  | decrementJump register positive zeroNext =>
      simp only [header, found]
      exact Nat.add_le_add_right bound 6


def sameRegister (first second : Register) : Result Bool :=
  ⟨match first, second with
    | .left, .left | .right, .right | .scratch, .scratch => true
    | _, _ => false, 2⟩

theorem sameRegister_value (first second : Register) :
    (sameRegister first second).value = decide (first = second) := by
  cases first <;> cases second <;> rfl

def tested (instruction : Instruction) (register : Register) : Result Bool :=
  match instruction with
  | .halt => ⟨false, 1⟩
  | .increment source _ | .decrementJump source _ _ =>
      let compared := sameRegister source register
      ⟨compared.value, 2 + compared.operations⟩

theorem tested_value (instruction : Instruction) (register : Register) :
    (tested instruction register).value =
      decide (ThreeCounterTag.instructionTested? instruction = some register) := by
  cases instruction with
  | halt => rfl
  | increment source next => cases source <;> cases register <;> rfl
  | decrementJump source positive zeroNext => cases source <;> cases register <;> rfl

theorem tested_operations_le (instruction : Instruction) (register : Register) :
    (tested instruction register).operations ≤ 4 := by
  cases instruction <;> simp only [tested, sameRegister] <;> decide

def scale (instruction : Instruction) (register : Register) : Result Nat :=
  let result := tested instruction register
  ⟨if result.value then 1 else 2, result.operations + 1⟩

theorem scale_value (instruction : Instruction) (register : Register) :
    (scale instruction register).value = ThreeCounterTag.scale instruction register := by
  simp only [scale, tested_value, decide_eq_true_eq, ThreeCounterTag.scale]

theorem scale_operations_le (instruction : Instruction) (register : Register) :
    (scale instruction register).operations ≤ 5 :=
  Nat.add_le_add_right (tested_operations_le instruction register) 1

theorem scale_value_le_two (instruction : Instruction) (register : Register) :
    (scale instruction register).value ≤ 2 := by
  rw [scale_value]
  exact ThreeCounterTagConstructionSize.scale_le_two _ _

def selectedLaneFactor (instruction : Instruction) (factor : Result Nat) (test : Result Bool) (positive : Bool) : Result Nat :=
  match instruction with
  | .increment _ _ =>
      let product := ParserNatPrimitive.multiply factor.value (if positive then 4 else 2)
      ⟨product.value, 1 + factor.operations + test.operations + 3 + product.operations⟩
  | .decrementJump _ _ _ => ⟨factor.value, 1 + factor.operations + test.operations + 2⟩
  | .halt => ⟨0, 1 + factor.operations + test.operations + 2⟩

def laneFactor (instruction nextInstruction : Instruction) (register : Register) (positive : Bool) : Result Nat :=
  if ThreeCounterTag.instructionLive nextInstruction then
    let factor := scale nextInstruction register
    let test := tested instruction register
    if test.value then selectedLaneFactor instruction factor test positive
    else ⟨factor.value, 1 + factor.operations + test.operations + 1⟩
  else ⟨0, 1⟩

def laneFormula (instruction nextInstruction : Instruction) (register : Register) (positive : Bool) : Nat :=
  if ThreeCounterTag.instructionLive nextInstruction then
    let nextScale := ThreeCounterTag.scale nextInstruction register
    if ThreeCounterTag.instructionTested? instruction = some register then
      match instruction with
      | .increment _ _ => nextScale * (if positive then 4 else 2)
      | .decrementJump _ _ _ => nextScale
      | .halt => 0
    else nextScale
  else 0

theorem laneFactor_value (instruction nextInstruction : Instruction) (register : Register) (positive : Bool) :
    (laneFactor instruction nextInstruction register positive).value =
      laneFormula instruction nextInstruction register positive := by
  cases nextInstruction with
  | halt => rfl
  | increment nextRegister next =>
      simp only [laneFactor, tested_value, decide_eq_true_eq, laneFormula,
        ThreeCounterTag.instructionLive, ↓reduceIte]
      split
      · cases instruction <;> simp only [selectedLaneFactor, ParserNatPrimitive.multiply_value, scale_value]
      · exact scale_value _ _
  | decrementJump nextRegister nextPositive nextZero =>
      simp only [laneFactor, tested_value, decide_eq_true_eq, laneFormula,
        ThreeCounterTag.instructionLive, ↓reduceIte]
      split
      · cases instruction <;> simp only [selectedLaneFactor, ParserNatPrimitive.multiply_value, scale_value]
      · exact scale_value _ _

theorem laneFactor_operations_le (instruction nextInstruction : Instruction) (register : Register) (positive : Bool) :
    (laneFactor instruction nextInstruction register positive).operations ≤ 80 := by
  have factorBound := scale_operations_le nextInstruction register
  have testBound := tested_operations_le instruction register
  have small := scale_value_le_two nextInstruction register
  have width : (if positive then 4 else 2) ≤ 4 := by cases positive <;> decide
  have productBound : (ParserNatPrimitive.multiply (scale nextInstruction register).value
      (if positive then 4 else 2)).operations ≤ 62 := by
    rw [ParserNatPrimitive.multiply_operations]
    exact Nat.add_le_add_right (Nat.mul_le_mul
      (Nat.add_le_add_right (Nat.mul_le_mul_left 4 small) 7) width) 2
  have base := Nat.add_le_add (Nat.add_le_add_left factorBound 1) testBound
  cases nextInstruction with
  | halt => exact (by decide : 1 ≤ 80)
  | increment nextRegister next =>
      simp only [laneFactor, ThreeCounterTag.instructionLive, ↓reduceIte]
      split
      · cases instruction with
        | increment source target =>
            exact Nat.le_trans
              (Nat.add_le_add (Nat.add_le_add_right base 3) productBound) (by decide : 1 + 5 + 4 + 3 + 62 ≤ 80)
        | decrementJump source targetPositive targetZero =>
            exact Nat.le_trans (Nat.add_le_add_right base 2) (by decide : 1 + 5 + 4 + 2 ≤ 80)
        | halt =>
            exact Nat.le_trans (Nat.add_le_add_right base 2) (by decide : 1 + 5 + 4 + 2 ≤ 80)
      · exact Nat.le_trans (Nat.add_le_add_right base 1) (by decide : 1 + 5 + 4 + 1 ≤ 80)
  | decrementJump nextRegister nextPositive nextZero =>
      simp only [laneFactor, ThreeCounterTag.instructionLive, ↓reduceIte]
      split
      · cases instruction with
        | increment source target =>
            exact Nat.le_trans
              (Nat.add_le_add (Nat.add_le_add_right base 3) productBound) (by decide : 1 + 5 + 4 + 3 + 62 ≤ 80)
        | decrementJump source targetPositive targetZero =>
            exact Nat.le_trans (Nat.add_le_add_right base 2) (by decide : 1 + 5 + 4 + 2 ≤ 80)
        | halt =>
            exact Nat.le_trans (Nat.add_le_add_right base 2) (by decide : 1 + 5 + 4 + 2 ≤ 80)
      · exact Nat.le_trans (Nat.add_le_add_right base 1) (by decide : 1 + 5 + 4 + 1 ≤ 80)

theorem laneFactor_value_le_eight (instruction nextInstruction : Instruction) (register : Register) (positive : Bool) :
    (laneFactor instruction nextInstruction register positive).value ≤ 8 := by
  rw [laneFactor_value]
  exact ThreeCounterTagConstructionSize.lane_formula_le_eight _ _ _ _


def laneOutput (program : Program) (control : Nat) (register : Register) (positive : Bool) : Result (List Symbol) :=
  let current := instruction program control
  let next := branch current.value positive
  let following := instruction program next.value
  let factor := laneFactor current.value following.value register positive
  let code := payload next.value register
  let output := CookWordConstructionMachine.replicateOnto (Symbol.first code.value) factor.value []
  ⟨output.value, 2 + current.operations + next.operations + following.operations +
    factor.operations + code.operations + output.operations⟩

theorem laneOutput_value (program : Program) (control : Nat) (register : Register) (positive : Bool) :
    (laneOutput program control register positive).value =
      ThreeCounterTag.laneOutput program control register positive := by
  simp only [laneOutput, CookWordConstructionMachine.replicateOnto_value, List.append_nil,
    payload_value, laneFactor_value, branch_value, instruction_value]
  rfl

theorem laneOutput_operations_le (program : Program) (control : Nat) (register : Register) (positive : Bool) :
    (laneOutput program control register positive).operations ≤
      10 * program.length + 19 * targetCells program + 136 := by
  let current := instruction program control
  let next := branch current.value positive
  let following := instruction program next.value
  let factor := laneFactor current.value following.value register positive
  have nextBound : next.value ≤ targetCells program := by
    apply Nat.le_trans (branch_value_le current.value positive)
    rw [show current.value = ThreeCounter.instructionAt program control from instruction_value _ _]
    exact targetMass_instructionAt_le _ _
  have payloadBound := Nat.le_trans (payload_operations_le next.value register)
    (Nat.add_le_add_right (Nat.mul_le_mul_left 19 nextBound) 12)
  have outputBound :
      (CookWordConstructionMachine.replicateOnto (Symbol.first (payload next.value register).value) factor.value []).operations ≤ 33 := by
    rw [CookWordConstructionMachine.replicateOnto_operations]
    exact Nat.add_le_add_right (Nat.mul_le_mul_left 4 (laneFactor_value_le_eight _ _ _ _)) 1
  have combined := Nat.add_le_add (Nat.add_le_add (Nat.add_le_add (Nat.add_le_add
    (Nat.add_le_add (Nat.add_le_add_left (instruction_operations_le program control) 2)
      (branch_operations_le current.value positive))
      (instruction_operations_le program next.value))
      (laneFactor_operations_le current.value following.value register positive))
      payloadBound) outputBound
  apply Nat.le_trans combined
  apply Nat.le_of_eq
  change 2 + (5 * program.length + 3) + 3 + (5 * program.length + 3) + 80 +
    (19 * targetCells program + 12) + 33 =
      (5 + 5) * program.length + 19 * targetCells program + (2 + 3 + 3 + 3 + 80 + 12 + 33)
  simp only [Nat.add_mul, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

def branchHeader (program : Program) (control : Nat) (positive : Bool) : Result (List Symbol) :=
  let current := instruction program control
  let next := branch current.value positive
  let output := header program next.value
  ⟨output.value, current.operations + next.operations + output.operations⟩

theorem branchHeader_value (program : Program) (control : Nat) (positive : Bool) :
    (branchHeader program control positive).value =
      ThreeCounterTag.header program (ThreeCounterTag.branchNext (ThreeCounter.instructionAt program control) positive) := by
  simp only [branchHeader, header_value, branch_value, instruction_value]

theorem branchHeader_operations_le (program : Program) (control : Nat) (positive : Bool) :
    (branchHeader program control positive).operations ≤ 10 * program.length + 15 := by
  have combined := Nat.add_le_add
    (Nat.add_le_add (instruction_operations_le program control)
      (branch_operations_le (instruction program control).value positive))
    (header_operations_le program (branch (instruction program control).value positive).value)
  apply Nat.le_trans combined
  apply Nat.le_of_eq
  change (5 * program.length + 3) + 3 + (5 * program.length + 9) =
    (5 + 5) * program.length + (3 + 3 + 9)
  simp only [Nat.add_mul, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

def production (program : Program) : Symbol → Result (List Symbol)
  | .head control => ⟨[.selectPositive control, .selectZero control], 7⟩
  | .first code => ⟨[.firstPositive code, .firstZero code], 7⟩
  | .selectPositive control =>
      let output := branchHeader program control true
      ⟨output.value, 2 + output.operations⟩
  | .selectZero control =>
      let output := branchHeader program control false
      ⟨.sacrificial :: output.value, 3 + output.operations⟩
  | .firstPositive code =>
      let decoded := decodePayload code
      let output := laneOutput program decoded.value.1 decoded.value.2 true
      ⟨output.value, 4 + decoded.operations + output.operations⟩
  | .firstZero code =>
      let decoded := decodePayload code
      let output := laneOutput program decoded.value.1 decoded.value.2 false
      ⟨output.value, 4 + decoded.operations + output.operations⟩
  | .halt => ⟨[], 2⟩
  | _ => ⟨[.sink, .sink], 4⟩

theorem production_value (program : Program) (symbol : Symbol) :
    (production program symbol).value = ThreeCounterTag.production program symbol := by
  cases symbol <;> simp only [production, branchHeader_value, laneOutput_value, decodePayload_value,
    ThreeCounterTag.production, ThreeCounterTag.payloadControl, ThreeCounterTag.payloadRegister]

def symbolPayload : Symbol → Nat
  | .head code | .filler code | .first code | .second code
  | .selectPositive code | .selectZero code | .firstPositive code | .firstZero code
  | .secondPositive code | .secondZero code => code
  | _ => 0

theorem production_operations_le (program : Program) (symbol : Symbol) :
    (production program symbol).operations ≤
      10 * program.length + 19 * targetCells program + 4 * symbolPayload symbol + 142 := by
  have small (value code : Nat) (bounded : value ≤ 142) :
      value ≤ 10 * program.length + 19 * targetCells program + 4 * code + 142 :=
    Nat.le_trans bounded (Nat.le_add_left _ _)
  have headerBound (control : Nat) (positive : Bool) (overhead : Nat) (overheadLe : overhead ≤ 3) :
      overhead + (branchHeader program control positive).operations ≤
        10 * program.length + 19 * targetCells program + 4 * control + 142 := by
    have initial := Nat.add_le_add overheadLe (branchHeader_operations_le program control positive)
    apply Nat.le_trans initial
    calc
      3 + (10 * program.length + 15) = 10 * program.length + (3 + 15) := by
        simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
      _ ≤ 10 * program.length + 142 := Nat.add_le_add_left (by decide : 3 + 15 ≤ 142) _
      _ ≤ _ := Nat.add_le_add_right
        (Nat.le_trans (Nat.le_add_right _ _) (Nat.le_add_right _ _)) _
  have laneBound (code : Nat) (positive : Bool) :
      4 + (decodePayload code).operations +
        (laneOutput program (decodePayload code).value.1 (decodePayload code).value.2 positive).operations ≤
          10 * program.length + 19 * targetCells program + 4 * code + 142 := by
    have combined := Nat.add_le_add (Nat.add_le_add_left (decodePayload_operations_le code) 4)
      (laneOutput_operations_le program (decodePayload code).value.1 (decodePayload code).value.2 positive)
    apply Nat.le_trans combined
    apply Nat.le_of_eq
    change 4 + (4 * code + 2) + (10 * program.length + 19 * targetCells program + 136) =
      10 * program.length + 19 * targetCells program + 4 * code + (4 + 2 + 136)
    simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
  cases symbol with
  | head control => exact small 7 control (by decide)
  | filler control => exact small 4 control (by decide)
  | first code => exact small 7 code (by decide)
  | second code => exact small 4 code (by decide)
  | selectPositive control => exact headerBound control true 2 (by decide)
  | selectZero control => exact headerBound control false 3 (by decide)
  | firstPositive code => exact laneBound code true
  | firstZero code => exact laneBound code false
  | secondPositive code => exact small 4 code (by decide)
  | secondZero code => exact small 4 code (by decide)
  | sacrificial => exact small 4 0 (by decide)
  | sink => exact small 4 0 (by decide)
  | halt => exact small 2 0 (by decide)

theorem production_length_le_eight (program : Program) (symbol : Symbol) :
    (production program symbol).value.length ≤ 8 := by
  rw [production_value]
  exact ThreeCounterTagConstructionSize.production_length_le_eight _ _


theorem instruction_execution (program : Program) (control : Nat) :
    RogozhinInputConstructionMachine.LookupExecution Instruction.halt program control
      (instruction program control).value (instruction program control).operations :=
  RogozhinInputConstructionMachine.lookup_execution _ _ _

inductive DecodeExecution : Nat → Nat × Register → Nat → Prop where
  | zero : DecodeExecution 0 (0, .left) 2
  | one : DecodeExecution 1 (0, .right) 4
  | two : DecodeExecution 2 (0, .scratch) 6
  | next {code control operations : Nat} {register : Register}
      (rest : DecodeExecution code (control, register) operations) :
      DecodeExecution (code + 1 + 1 + 1) (control + 1, register) (10 + operations)

theorem decodePayload_execution (code : Nat) :
    DecodeExecution code (decodePayload code).value (decodePayload code).operations := by
  induction code using Nat.strongRecOn with
  | ind code ih =>
      cases code with
      | zero => exact .zero
      | succ code =>
          cases code with
          | zero => exact .one
          | succ code =>
              cases code with
              | zero => exact .two
              | succ code =>
                  exact .next (ih code (Nat.lt_trans (Nat.lt_succ_self code)
                    (Nat.lt_trans (Nat.lt_succ_self _) (Nat.lt_succ_self _))))

inductive HeaderExecution (program : Program) (control : Nat) : List Symbol → Nat → Prop where
  | halt {operations : Nat}
      (found : RogozhinInputConstructionMachine.LookupExecution Instruction.halt program control .halt operations) :
      HeaderExecution program control [.halt, .sink] (operations + 4)
  | increment {register : Register} {next operations : Nat}
      (found : RogozhinInputConstructionMachine.LookupExecution Instruction.halt program control
        (.increment register next) operations) :
      HeaderExecution program control [.head control, .filler control] (operations + 6)
  | decrementJump {register : Register} {positive zeroNext operations : Nat}
      (found : RogozhinInputConstructionMachine.LookupExecution Instruction.halt program control
        (.decrementJump register positive zeroNext) operations) :
      HeaderExecution program control [.head control, .filler control] (operations + 6)

theorem header_execution (program : Program) (control : Nat) :
    HeaderExecution program control (header program control).value (header program control).operations := by
  have found := instruction_execution program control
  cases value : (instruction program control).value with
  | halt =>
      rw [value] at found
      simpa only [header, value] using HeaderExecution.halt found
  | increment register next =>
      rw [value] at found
      simpa only [header, value] using HeaderExecution.increment found
  | decrementJump register positive zeroNext =>
      rw [value] at found
      simpa only [header, value] using HeaderExecution.decrementJump found

inductive LaneExecution (program : Program) (control : Nat) (register : Register) (positive : Bool) :
    List Symbol → Nat → Prop where
  | construct {current following : Instruction} {currentOperations followingOperations outputOperations : Nat}
      {output : List Symbol}
      (currentRun : RogozhinInputConstructionMachine.LookupExecution Instruction.halt program control current currentOperations)
      (followingRun : RogozhinInputConstructionMachine.LookupExecution Instruction.halt program
        (branch current positive).value following followingOperations)
      (outputRun : CookWordConstructionMachine.ReplicateExecution
        (Symbol.first (payload (branch current positive).value register).value)
        (laneFactor current following register positive).value [] output outputOperations) :
      LaneExecution program control register positive output
        (2 + currentOperations + (branch current positive).operations + followingOperations +
          (laneFactor current following register positive).operations +
          (payload (branch current positive).value register).operations + outputOperations)

theorem laneOutput_execution (program : Program) (control : Nat) (register : Register) (positive : Bool) :
    LaneExecution program control register positive (laneOutput program control register positive).value
      (laneOutput program control register positive).operations :=
  .construct (instruction_execution _ _) (instruction_execution _ _)
    (CookWordConstructionMachine.replicateOnto_execution _ _ _)

inductive BranchHeaderExecution (program : Program) (control : Nat) (positive : Bool) :
    List Symbol → Nat → Prop where
  | construct {current : Instruction} {currentOperations outputOperations : Nat} {output : List Symbol}
      (currentRun : RogozhinInputConstructionMachine.LookupExecution Instruction.halt program control current currentOperations)
      (outputRun : HeaderExecution program (branch current positive).value output outputOperations) :
      BranchHeaderExecution program control positive output
        (currentOperations + (branch current positive).operations + outputOperations)

theorem branchHeader_execution (program : Program) (control : Nat) (positive : Bool) :
    BranchHeaderExecution program control positive (branchHeader program control positive).value
      (branchHeader program control positive).operations :=
  .construct (instruction_execution _ _) (header_execution _ _)

inductive ProductionExecution (program : Program) : Symbol → List Symbol → Nat → Prop where
  | head (control : Nat) : ProductionExecution program (.head control) [.selectPositive control, .selectZero control] 7
  | first (code : Nat) : ProductionExecution program (.first code) [.firstPositive code, .firstZero code] 7
  | filler (code : Nat) : ProductionExecution program (.filler code) [.sink, .sink] 4
  | second (code : Nat) : ProductionExecution program (.second code) [.sink, .sink] 4
  | secondPositive (code : Nat) : ProductionExecution program (.secondPositive code) [.sink, .sink] 4
  | secondZero (code : Nat) : ProductionExecution program (.secondZero code) [.sink, .sink] 4
  | sacrificial : ProductionExecution program .sacrificial [.sink, .sink] 4
  | sink : ProductionExecution program .sink [.sink, .sink] 4
  | halt : ProductionExecution program .halt [] 2
  | selectPositive {control operations : Nat} {output : List Symbol}
      (outputRun : BranchHeaderExecution program control true output operations) :
      ProductionExecution program (.selectPositive control) output (2 + operations)
  | selectZero {control operations : Nat} {output : List Symbol}
      (outputRun : BranchHeaderExecution program control false output operations) :
      ProductionExecution program (.selectZero control) (.sacrificial :: output) (3 + operations)
  | firstPositive {code control decodeOperations outputOperations : Nat} {register : Register} {output : List Symbol}
      (decodeRun : DecodeExecution code (control, register) decodeOperations)
      (outputRun : LaneExecution program control register true output outputOperations) :
      ProductionExecution program (.firstPositive code) output (4 + decodeOperations + outputOperations)
  | firstZero {code control decodeOperations outputOperations : Nat} {register : Register} {output : List Symbol}
      (decodeRun : DecodeExecution code (control, register) decodeOperations)
      (outputRun : LaneExecution program control register false output outputOperations) :
      ProductionExecution program (.firstZero code) output (4 + decodeOperations + outputOperations)

theorem production_execution (program : Program) (symbol : Symbol) :
    ProductionExecution program symbol (production program symbol).value (production program symbol).operations := by
  cases symbol with
  | head control => exact .head _
  | filler control => exact .filler _
  | first code => exact .first _
  | second code => exact .second _
  | secondPositive code => exact .secondPositive _
  | secondZero code => exact .secondZero _
  | sacrificial => exact .sacrificial
  | sink => exact .sink
  | halt => exact .halt
  | selectPositive control => exact .selectPositive (branchHeader_execution _ _ _)
  | selectZero control => exact .selectZero (branchHeader_execution _ _ _)
  | firstPositive code => exact .firstPositive (decodePayload_execution _) (laneOutput_execution _ _ _ _)
  | firstZero code => exact .firstZero (decodePayload_execution _) (laneOutput_execution _ _ _ _)

end PureSFormal.Computation.ThreeCounterTagTypedConstructionMachine
