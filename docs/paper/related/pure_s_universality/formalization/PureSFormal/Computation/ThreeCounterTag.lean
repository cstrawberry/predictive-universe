import PureSFormal.Computation.ThreeCounter
import PureSFormal.Computation.CounterMachineTag

set_option backward.isDefEq.respectTransparency false

/-!
# A deletion-two compiler for primitive three-counter machines

This is the three-register form of the two-sweep radix construction.  A
register value `n` is represented by `2^n` equal cells.  The register tested
by the current command has scale one and both other registers have scale two.
Thus the old generation has odd length exactly on a zero branch.  The first
sweep emits paired positive/zero lanes; parity selects one lane in the second
sweep.

The data-symbol payload is the injective pairing `3 * control + registerId`.
Explicit inverse theorems below prevent different source registers from being
identified by this reuse of the generic typed deletion-two alphabet.
-/

namespace PureSFormal.Computation

namespace ThreeCounterTag

open ThreeCounter
open CounterMachineTag

abbrev Symbol := CounterMachineTag.Symbol

/-! ## Control/register payload -/

def registerId : Register -> Nat
  | .left => 0
  | .right => 1
  | .scratch => 2

def registerOfId : Nat -> Register
  | 0 => .left
  | 1 => .right
  | _ => .scratch

def payload (control : Nat) (register : Register) : Nat :=
  3 * control + registerId register

def decodePayload : Nat → Nat × Register
  | 0 => (0, .left)
  | 1 => (0, .right)
  | 2 => (0, .scratch)
  | .succ (.succ (.succ code)) =>
      let decoded := decodePayload code
      (decoded.1 + 1, decoded.2)

def payloadControl (code : Nat) : Nat := (decodePayload code).1

def payloadRegister (code : Nat) : Register := (decodePayload code).2

@[simp] theorem registerId_lt_three (register : Register) :
    registerId register < 3 := by cases register <;> decide

@[simp] theorem registerOfId_registerId (register : Register) :
    registerOfId (registerId register) = register := by cases register <;> rfl

@[simp] theorem payloadControl_payload (control : Nat) (register : Register) :
    payloadControl (payload control register) = control := by
  induction control with
  | zero => cases register <;> rfl
  | succ control ih =>
      cases register <;>
        simpa [payloadControl, payload, registerId, decodePayload,
          Nat.mul_succ, Nat.add_assoc] using ih

@[simp] theorem payloadRegister_payload (control : Nat) (register : Register) :
    payloadRegister (payload control register) = register := by
  induction control with
  | zero => cases register <;> rfl
  | succ control ih =>
      cases register <;>
        simpa [payloadRegister, payload, registerId, decodePayload,
          Nat.mul_succ, Nat.add_assoc] using ih

theorem payload_injective {control otherControl : Nat}
    {register otherRegister : Register}
    (equal : payload control register = payload otherControl otherRegister) :
    control = otherControl /\ register = otherRegister := by
  constructor
  · simpa using congrArg payloadControl equal
  · simpa using congrArg payloadRegister equal

/-! ## Typed compiler -/

def instructionLive : Instruction -> Bool
  | .increment _ _ => true
  | .decrementJump _ _ _ => true
  | .halt => false

def instructionTested? : Instruction -> Option Register
  | .increment register _ => some register
  | .decrementJump register _ _ => some register
  | .halt => none

def branchNext (instruction : Instruction) (positive : Bool) : Nat :=
  match instruction with
  | .increment _ next => next
  | .decrementJump _ positiveNext zeroNext =>
      if positive then positiveNext else zeroNext
  | .halt => 0

def scale (instruction : Instruction) (register : Register) : Nat :=
  if instructionTested? instruction = some register then 1 else 2

def dataSymbol (control : Nat) (register : Register) : Symbol :=
  .first (payload control register)

def positiveSymbol (control : Nat) (register : Register) : Symbol :=
  .firstPositive (payload control register)

def zeroSymbol (control : Nat) (register : Register) : Symbol :=
  .firstZero (payload control register)

def header (program : Program) (control : Nat) : List Symbol :=
  match instructionAt program control with
  | .halt => [.halt, .sink]
  | _ => [.head control, .filler control]

def dataBlock (program : Program) (control : Nat) (register : Register)
    (value : Nat) : List Symbol :=
  let instruction := instructionAt program control
  if instructionLive instruction then
    List.replicate (scale instruction register * radix value)
      (dataSymbol control register)
  else []

def canonical (program : Program) (control left right scratch : Nat) :
    List Symbol :=
  header program control ++
    dataBlock program control .left left ++
    dataBlock program control .right right ++
    dataBlock program control .scratch scratch

def encodeState (program : Program) (state : State) : List Symbol :=
  match state.status with
  | .halted => [.halt, .sink]
  | .running => canonical program state.control state.left state.right state.scratch

def laneMultiplicity (program : Program) (control : Nat)
    (register : Register) (positive : Bool) : Nat :=
  let instruction := instructionAt program control
  let next := branchNext instruction positive
  let nextInstruction := instructionAt program next
  if instructionLive nextInstruction then
    let nextScale := scale nextInstruction register
    if instructionTested? instruction = some register then
      match instruction with
      | .increment _ _ => nextScale * (if positive then 4 else 2)
      | .decrementJump _ _ _ => nextScale
      | .halt => 0
    else nextScale
  else 0

def laneOutput (program : Program) (control : Nat)
    (register : Register) (positive : Bool) : List Symbol :=
  let next := branchNext (instructionAt program control) positive
  List.replicate (laneMultiplicity program control register positive)
    (dataSymbol next register)

def production (program : Program) : Symbol -> List Symbol
  | .head control => [.selectPositive control, .selectZero control]
  | .filler _ => [.sink, .sink]
  | .first code =>
      [.firstPositive code, .firstZero code]
  | .selectPositive control =>
      header program (branchNext (instructionAt program control) true)
  | .selectZero control =>
      .sacrificial ::
        header program (branchNext (instructionAt program control) false)
  | .firstPositive code =>
      laneOutput program (payloadControl code) (payloadRegister code) true
  | .firstZero code =>
      laneOutput program (payloadControl code) (payloadRegister code) false
  | .sacrificial => [.sink, .sink]
  | .sink => [.sink, .sink]
  | .halt => []
  | _ => [.sink, .sink]

def alternatives (control leftCount rightCount scratchCount : Nat) :
    List (Symbol × Symbol) :=
  [(.selectPositive control, .selectZero control)] ++
    List.replicate leftCount
      (positiveSymbol control .left, zeroSymbol control .left) ++
    List.replicate rightCount
      (positiveSymbol control .right, zeroSymbol control .right) ++
    List.replicate scratchCount
      (positiveSymbol control .scratch, zeroSymbol control .scratch)

def alternativeWord (control leftCount rightCount scratchCount : Nat) :
    List Symbol := pairWord (alternatives control leftCount rightCount scratchCount)

def branchWord (program : Program) (control : Nat) (positive : Bool)
    (leftCount rightCount scratchCount : Nat) : List Symbol :=
  let next := branchNext (instructionAt program control) positive
  header program next ++
    List.replicate
      (leftCount * laneMultiplicity program control .left positive)
      (dataSymbol next .left) ++
    List.replicate
      (rightCount * laneMultiplicity program control .right positive)
      (dataSymbol next .right) ++
    List.replicate
      (scratchCount * laneMultiplicity program control .scratch positive)
      (dataSymbol next .scratch)

/-! ## First sweep -/

theorem firstSweep_left_positive
    (program : Program) (control predecessor right scratch : Nat)
    (instruction : Instruction)
    (instructionEq : instructionAt program control = instruction)
    (liveEq : instructionLive instruction = true)
    (testedEq : instructionTested? instruction = some .left) :
    tagIterate (production program)
        (1 + radix predecessor + radix right + radix scratch)
        (canonical program control (predecessor + 1) right scratch) =
      alternativeWord control (radix predecessor) (radix right)
        (radix scratch) := by
  have headerEq : header program control = [.head control, .filler control] := by
    unfold header
    rw [instructionEq]
    cases instruction <;> simp_all [instructionLive, instructionTested?]
  let pairs : List (Symbol × Symbol) :=
    [(.head control, .filler control)] ++
      List.replicate (radix predecessor)
        (dataSymbol control .left, dataSymbol control .left) ++
      List.replicate (radix right)
        (dataSymbol control .right, dataSymbol control .right) ++
      List.replicate (radix scratch)
        (dataSymbol control .scratch, dataSymbol control .scratch)
  have wordEq : canonical program control (predecessor + 1) right scratch =
      pairWord pairs := by
    simp [canonical, dataBlock, instructionEq, liveEq, scale, testedEq,
      headerEq, radix_succ, pairs, dataSymbol, List.append_assoc]
  have lengthEq : pairs.length =
      1 + radix predecessor + radix right + radix scratch := by
    simp [pairs]
    simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
  rw [wordEq, <- lengthEq]
  simpa [pairs, alternativeWord, alternatives, production,
    positiveSymbol, zeroSymbol, dataSymbol, List.append_assoc] using
      iterate_pairWord_with_tail (production program) pairs []

theorem firstSweep_right_positive
    (program : Program) (control left predecessor scratch : Nat)
    (instruction : Instruction)
    (instructionEq : instructionAt program control = instruction)
    (liveEq : instructionLive instruction = true)
    (testedEq : instructionTested? instruction = some .right) :
    tagIterate (production program)
        (1 + radix left + radix predecessor + radix scratch)
        (canonical program control left (predecessor + 1) scratch) =
      alternativeWord control (radix left) (radix predecessor)
        (radix scratch) := by
  have headerEq : header program control = [.head control, .filler control] := by
    unfold header
    rw [instructionEq]
    cases instruction <;> simp_all [instructionLive, instructionTested?]
  let pairs : List (Symbol × Symbol) :=
    [(.head control, .filler control)] ++
      List.replicate (radix left)
        (dataSymbol control .left, dataSymbol control .left) ++
      List.replicate (radix predecessor)
        (dataSymbol control .right, dataSymbol control .right) ++
      List.replicate (radix scratch)
        (dataSymbol control .scratch, dataSymbol control .scratch)
  have wordEq : canonical program control left (predecessor + 1) scratch =
      pairWord pairs := by
    simp [canonical, dataBlock, instructionEq, liveEq, scale, testedEq,
      headerEq, radix_succ, pairs, dataSymbol, List.append_assoc]
  have lengthEq : pairs.length =
      1 + radix left + radix predecessor + radix scratch := by
    simp [pairs]
    simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
  rw [wordEq, <- lengthEq]
  simpa [pairs, alternativeWord, alternatives, production,
    positiveSymbol, zeroSymbol, dataSymbol, List.append_assoc] using
      iterate_pairWord_with_tail (production program) pairs []

theorem firstSweep_scratch_positive
    (program : Program) (control left right predecessor : Nat)
    (instruction : Instruction)
    (instructionEq : instructionAt program control = instruction)
    (liveEq : instructionLive instruction = true)
    (testedEq : instructionTested? instruction = some .scratch) :
    tagIterate (production program)
        (1 + radix left + radix right + radix predecessor)
        (canonical program control left right (predecessor + 1)) =
      alternativeWord control (radix left) (radix right)
        (radix predecessor) := by
  have headerEq : header program control = [.head control, .filler control] := by
    unfold header
    rw [instructionEq]
    cases instruction <;> simp_all [instructionLive, instructionTested?]
  let pairs : List (Symbol × Symbol) :=
    [(.head control, .filler control)] ++
      List.replicate (radix left)
        (dataSymbol control .left, dataSymbol control .left) ++
      List.replicate (radix right)
        (dataSymbol control .right, dataSymbol control .right) ++
      List.replicate (radix predecessor)
        (dataSymbol control .scratch, dataSymbol control .scratch)
  have wordEq : canonical program control left right (predecessor + 1) =
      pairWord pairs := by
    simp [canonical, dataBlock, instructionEq, liveEq, scale, testedEq,
      headerEq, radix_succ, pairs, dataSymbol, List.append_assoc]
  have lengthEq : pairs.length =
      1 + radix left + radix right + radix predecessor := by
    simp [pairs]
    simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
  rw [wordEq, <- lengthEq]
  simpa [pairs, alternativeWord, alternatives, production,
    positiveSymbol, zeroSymbol, dataSymbol, List.append_assoc] using
      iterate_pairWord_with_tail (production program) pairs []

theorem firstSweep_scratch_zero
    (program : Program) (control left right : Nat)
    (instruction : Instruction)
    (instructionEq : instructionAt program control = instruction)
    (liveEq : instructionLive instruction = true)
    (testedEq : instructionTested? instruction = some .scratch) :
    tagIterate (production program) (2 + radix left + radix right)
        (canonical program control left right 0) =
      (alternativeWord control (radix left) (radix right) 1).tail := by
  have headerEq : header program control = [.head control, .filler control] := by
    unfold header
    rw [instructionEq]
    cases instruction <;> simp_all [instructionLive, instructionTested?]
  let pairs : List (Symbol × Symbol) :=
    [(.head control, .filler control)] ++
      List.replicate (radix left)
        (dataSymbol control .left, dataSymbol control .left) ++
      List.replicate (radix right)
        (dataSymbol control .right, dataSymbol control .right)
  have fuelEq : 2 + radix left + radix right = pairs.length + 1 := by
    simp [pairs, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
    exact Nat.add_assoc 1 1 (radix left + radix right)
  rw [fuelEq]
  have wordEq : canonical program control left right 0 =
      pairWord pairs ++ [dataSymbol control .scratch] := by
    simp [canonical, dataBlock, instructionEq, liveEq, scale, testedEq,
      headerEq, pairs, dataSymbol, List.append_assoc]
  rw [wordEq]
  have outputsEq : pairOutputs (production program) pairs =
      .selectPositive control ::
        ((.selectZero control :: []) ++
          (List.replicate (radix left)
            [positiveSymbol control .left, zeroSymbol control .left]).flatten ++
          (List.replicate (radix right)
            [positiveSymbol control .right, zeroSymbol control .right]).flatten) := by
    simp [pairs, pairOutputs, production, dataSymbol, positiveSymbol,
      zeroSymbol, List.append_assoc]
  rw [iterate_pairWord_last (production program) pairs
    (dataSymbol control .scratch) (.selectPositive control) _ outputsEq]
  simp [alternativeWord, alternatives, production, dataSymbol,
    positiveSymbol, zeroSymbol, List.append_assoc]

theorem firstSweep_right_zero
    (program : Program) (control left scratch : Nat)
    (instruction : Instruction)
    (instructionEq : instructionAt program control = instruction)
    (liveEq : instructionLive instruction = true)
    (testedEq : instructionTested? instruction = some .right) :
    tagIterate (production program) (2 + radix left + radix scratch)
        (canonical program control left 0 scratch) =
      (alternativeWord control (radix left) 1 (radix scratch)).tail := by
  have headerEq : header program control = [.head control, .filler control] := by
    unfold header
    rw [instructionEq]
    cases instruction <;> simp_all [instructionLive, instructionTested?]
  obtain ⟨scratchPredecessor, radixScratch⟩ := radix_is_succ scratch
  let pairs : List (Symbol × Symbol) :=
    [(.head control, .filler control)] ++
      List.replicate (radix left)
        (dataSymbol control .left, dataSymbol control .left) ++
      [(dataSymbol control .right, dataSymbol control .scratch)] ++
      List.replicate scratchPredecessor
        (dataSymbol control .scratch, dataSymbol control .scratch)
  have fuelEq : 2 + radix left + radix scratch = pairs.length + 1 := by
    simp [pairs, radixScratch, Nat.add_assoc, Nat.add_comm,
      Nat.add_left_comm]
    exact Nat.add_assoc 1 1 (radix left)
  rw [fuelEq]
  have wordEq : canonical program control left 0 scratch =
      pairWord pairs ++ [dataSymbol control .scratch] := by
    simp [canonical, dataBlock, instructionEq, liveEq, scale, testedEq,
      headerEq, pairs, radixScratch, Nat.mul_add, List.replicate_succ,
      dataSymbol, List.append_assoc]
    exact cons_replicate_eq_append (dataSymbol control .scratch)
      (2 * scratchPredecessor)
  rw [wordEq]
  have outputsEq : pairOutputs (production program) pairs =
      .selectPositive control ::
        ((.selectZero control :: []) ++
          (List.replicate (radix left)
            [positiveSymbol control .left, zeroSymbol control .left]).flatten ++
          [positiveSymbol control .right, zeroSymbol control .right] ++
          (List.replicate scratchPredecessor
            [positiveSymbol control .scratch,
              zeroSymbol control .scratch]).flatten) := by
    simp [pairs, pairOutputs, production, dataSymbol, positiveSymbol,
      zeroSymbol, List.append_assoc]
  rw [iterate_pairWord_last (production program) pairs
    (dataSymbol control .scratch) (.selectPositive control) _ outputsEq]
  simp [alternativeWord, alternatives, production, dataSymbol,
    positiveSymbol, zeroSymbol, radixScratch, List.replicate_succ',
    List.append_assoc]

theorem firstSweep_left_zero
    (program : Program) (control right scratch : Nat)
    (instruction : Instruction)
    (instructionEq : instructionAt program control = instruction)
    (liveEq : instructionLive instruction = true)
    (testedEq : instructionTested? instruction = some .left) :
    tagIterate (production program) (2 + radix right + radix scratch)
        (canonical program control 0 right scratch) =
      (alternativeWord control 1 (radix right) (radix scratch)).tail := by
  have headerEq : header program control = [.head control, .filler control] := by
    unfold header
    rw [instructionEq]
    cases instruction <;> simp_all [instructionLive, instructionTested?]
  obtain ⟨rightPredecessor, radixRight⟩ := radix_is_succ right
  obtain ⟨scratchPredecessor, radixScratch⟩ := radix_is_succ scratch
  let pairs : List (Symbol × Symbol) :=
    [(.head control, .filler control),
      (dataSymbol control .left, dataSymbol control .right)] ++
      List.replicate rightPredecessor
        (dataSymbol control .right, dataSymbol control .right) ++
      [(dataSymbol control .right, dataSymbol control .scratch)] ++
      List.replicate scratchPredecessor
        (dataSymbol control .scratch, dataSymbol control .scratch)
  have fuelEq : 2 + radix right + radix scratch = pairs.length + 1 := by
    simp [pairs, radixRight, radixScratch]
    simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
  rw [fuelEq]
  have rotateRuns (a b : Symbol) (n m : Nat) :
      a :: (List.replicate n a ++ b :: b :: List.replicate m b) =
        List.replicate n a ++ a :: b ::
          (List.replicate m b ++ [b]) := by
    induction n with
    | zero =>
        simp only [List.replicate_zero, List.nil_append]
        rw [cons_replicate_eq_append b m]
    | succ n ih =>
        simp [List.replicate_succ, ih]
  have wordEq : canonical program control 0 right scratch =
      pairWord pairs ++ [dataSymbol control .scratch] := by
    simp [canonical, dataBlock, instructionEq, liveEq, scale, testedEq,
      headerEq, pairs, radixRight, radixScratch, Nat.mul_add,
      List.replicate_succ, dataSymbol, List.append_assoc]
    exact rotateRuns (dataSymbol control .right)
      (dataSymbol control .scratch) (2 * rightPredecessor)
      (2 * scratchPredecessor)
  rw [wordEq]
  have outputsEq : pairOutputs (production program) pairs =
      .selectPositive control ::
        ((.selectZero control ::
          [positiveSymbol control .left, zeroSymbol control .left]) ++
          (List.replicate rightPredecessor
            [positiveSymbol control .right, zeroSymbol control .right]).flatten ++
          [positiveSymbol control .right, zeroSymbol control .right] ++
          (List.replicate scratchPredecessor
            [positiveSymbol control .scratch,
              zeroSymbol control .scratch]).flatten) := by
    simp [pairs, pairOutputs, production, dataSymbol, positiveSymbol,
      zeroSymbol, List.append_assoc]
  rw [iterate_pairWord_last (production program) pairs
    (dataSymbol control .scratch) (.selectPositive control) _ outputsEq]
  simp [alternativeWord, alternatives, production, dataSymbol,
    positiveSymbol, zeroSymbol, radixRight, radixScratch,
    List.replicate_succ', List.append_assoc]

/-! ## Lane sweeps -/

theorem positiveLaneSweep (program : Program) (control : Nat)
    (leftCount rightCount scratchCount : Nat) :
    tagIterate (production program)
        (1 + leftCount + rightCount + scratchCount)
        (alternativeWord control leftCount rightCount scratchCount) =
      branchWord program control true leftCount rightCount scratchCount := by
  let pairs := alternatives control leftCount rightCount scratchCount
  have lengthEq : pairs.length =
      1 + leftCount + rightCount + scratchCount := by
    simp [pairs, alternatives, Nat.add_assoc, Nat.add_comm,
      Nat.add_left_comm]
  unfold alternativeWord
  rw [<- lengthEq]
  simpa [pairs, alternatives, pairOutputs, production, branchWord,
    laneOutput, positiveSymbol, zeroSymbol, dataSymbol, List.append_assoc,
    Nat.mul_comm] using
      iterate_pairWord_with_tail (production program) pairs []

def dataAlternatives (control leftCount rightCount scratchCount : Nat) :
    List (Symbol × Symbol) :=
  List.replicate leftCount
      (positiveSymbol control .left, zeroSymbol control .left) ++
    List.replicate rightCount
      (positiveSymbol control .right, zeroSymbol control .right) ++
    List.replicate scratchCount
      (positiveSymbol control .scratch, zeroSymbol control .scratch)

@[simp] theorem alternativeWord_tail (control : Nat)
    (leftCount rightCount scratchCount : Nat) :
    (alternativeWord control leftCount rightCount scratchCount).tail =
      .selectZero control ::
        pairWord (dataAlternatives control leftCount rightCount scratchCount) := by
  simp [alternativeWord, alternatives, dataAlternatives]

theorem zeroLaneSweep (program : Program) (control : Nat)
    (leftPredecessor rightCount scratchCount : Nat) :
    tagIterate (production program)
        (2 + leftPredecessor + rightCount + scratchCount)
        (alternativeWord control (leftPredecessor + 1) rightCount
          scratchCount).tail =
      branchWord program control false (leftPredecessor + 1) rightCount
        scratchCount := by
  let firstPair : Symbol × Symbol :=
    (positiveSymbol control .left, zeroSymbol control .left)
  let restPairs : List (Symbol × Symbol) :=
    List.replicate leftPredecessor
        (positiveSymbol control .left, zeroSymbol control .left) ++
      List.replicate rightCount
        (positiveSymbol control .right, zeroSymbol control .right) ++
      List.replicate scratchCount
        (positiveSymbol control .scratch, zeroSymbol control .scratch)
  have fuelEq : 2 + leftPredecessor + rightCount + scratchCount =
      (firstPair :: restPairs).length + 1 := by
    simp [firstPair, restPairs, Nat.add_assoc, Nat.add_comm,
      Nat.add_left_comm]
  rw [fuelEq, alternativeWord_tail]
  have dataEq :
      dataAlternatives control (leftPredecessor + 1) rightCount scratchCount =
        firstPair :: restPairs := by
    simp [dataAlternatives, firstPair, restPairs, List.replicate_succ,
      List.append_assoc]
  rw [dataEq]
  have run := zeroLaneSweepAux (production program)
    (.selectZero control) .sacrificial
    (header program (branchNext (instructionAt program control) false))
    firstPair restPairs rfl
  simpa [branchWord, CounterMachineTag.secondOutputs, firstPair, restPairs,
    production, laneOutput, positiveSymbol, zeroSymbol, dataSymbol,
    List.append_assoc, Nat.mul_comm, Nat.add_mul, Nat.add_comm,
    List.replicate_append_replicate, replicate_one_plus_mul_append] using run

/-! ## Lane arithmetic -/

theorem branchWord_increment_left_positive
    (program : Program) (control next predecessor right scratch : Nat)
    (instructionEq : instructionAt program control =
      .increment .left next) :
    branchWord program control true (radix predecessor) (radix right)
        (radix scratch) =
      canonical program next (predecessor + 2) right scratch := by
  unfold branchWord laneMultiplicity canonical dataBlock
  rw [instructionEq]
  simp only [branchNext, instructionTested?]
  cases nextInstruction : instructionAt program next with
  | halt => simp [nextInstruction, instructionLive]
  | increment register following =>
      cases register <;>
        simp [nextInstruction, instructionLive, scale, instructionTested?,
          dataSymbol, radix_succ, List.append_assoc, Nat.mul_assoc,
          Nat.mul_comm, Nat.mul_left_comm, Nat.mul_add, Nat.add_mul,
          four_mul, eight_mul]
  | decrementJump register positive zeroNext =>
      cases register <;>
        simp [nextInstruction, instructionLive, scale, instructionTested?,
          dataSymbol, radix_succ, List.append_assoc, Nat.mul_assoc,
          Nat.mul_comm, Nat.mul_left_comm, Nat.mul_add, Nat.add_mul,
          four_mul, eight_mul]

theorem branchWord_increment_left_zero
    (program : Program) (control next right scratch : Nat)
    (instructionEq : instructionAt program control =
      .increment .left next) :
    branchWord program control false 1 (radix right) (radix scratch) =
      canonical program next 1 right scratch := by
  unfold branchWord laneMultiplicity canonical dataBlock
  rw [instructionEq]
  simp only [branchNext, instructionTested?]
  cases nextInstruction : instructionAt program next <;>
    simp [nextInstruction, instructionLive, scale, instructionTested?,
      dataSymbol, radix_succ, List.append_assoc, Nat.mul_assoc,
      Nat.mul_comm, Nat.mul_left_comm]

theorem branchWord_decrement_left_positive
    (program : Program)
    (control positiveNext zeroNext predecessor right scratch : Nat)
    (instructionEq : instructionAt program control =
      .decrementJump .left positiveNext zeroNext) :
    branchWord program control true (radix predecessor) (radix right)
        (radix scratch) =
      canonical program positiveNext predecessor right scratch := by
  unfold branchWord laneMultiplicity canonical dataBlock
  rw [instructionEq]
  simp only [branchNext, instructionTested?]
  cases nextInstruction : instructionAt program positiveNext <;>
    simp [nextInstruction, instructionLive, scale, instructionTested?,
      dataSymbol, List.append_assoc, Nat.mul_assoc,
      Nat.mul_comm, Nat.mul_left_comm]

theorem branchWord_decrement_left_zero
    (program : Program)
    (control positiveNext zeroNext right scratch : Nat)
    (instructionEq : instructionAt program control =
      .decrementJump .left positiveNext zeroNext) :
    branchWord program control false 1 (radix right) (radix scratch) =
      canonical program zeroNext 0 right scratch := by
  unfold branchWord laneMultiplicity canonical dataBlock
  rw [instructionEq]
  simp only [branchNext, instructionTested?]
  cases nextInstruction : instructionAt program zeroNext <;>
    simp [nextInstruction, instructionLive, scale, instructionTested?,
      dataSymbol, List.append_assoc, Nat.mul_assoc,
      Nat.mul_comm, Nat.mul_left_comm]

theorem branchWord_increment_right_positive
    (program : Program) (control next left predecessor scratch : Nat)
    (instructionEq : instructionAt program control =
      .increment .right next) :
    branchWord program control true (radix left) (radix predecessor)
        (radix scratch) =
      canonical program next left (predecessor + 2) scratch := by
  unfold branchWord laneMultiplicity canonical dataBlock
  rw [instructionEq]
  simp only [branchNext, instructionTested?]
  cases nextInstruction : instructionAt program next with
  | halt => simp [nextInstruction, instructionLive]
  | increment register following =>
      cases register <;>
        simp [nextInstruction, instructionLive, scale, instructionTested?,
          dataSymbol, radix_succ, List.append_assoc, Nat.mul_assoc,
          Nat.mul_comm, Nat.mul_left_comm, Nat.mul_add, Nat.add_mul,
          four_mul, eight_mul]
  | decrementJump register positive zeroNext =>
      cases register <;>
        simp [nextInstruction, instructionLive, scale, instructionTested?,
          dataSymbol, radix_succ, List.append_assoc, Nat.mul_assoc,
          Nat.mul_comm, Nat.mul_left_comm, Nat.mul_add, Nat.add_mul,
          four_mul, eight_mul]

theorem branchWord_increment_right_zero
    (program : Program) (control next left scratch : Nat)
    (instructionEq : instructionAt program control =
      .increment .right next) :
    branchWord program control false (radix left) 1 (radix scratch) =
      canonical program next left 1 scratch := by
  unfold branchWord laneMultiplicity canonical dataBlock
  rw [instructionEq]
  simp only [branchNext, instructionTested?]
  cases nextInstruction : instructionAt program next <;>
    simp [nextInstruction, instructionLive, scale, instructionTested?,
      dataSymbol, radix_succ, List.append_assoc, Nat.mul_assoc,
      Nat.mul_comm, Nat.mul_left_comm]

theorem branchWord_decrement_right_positive
    (program : Program)
    (control positiveNext zeroNext left predecessor scratch : Nat)
    (instructionEq : instructionAt program control =
      .decrementJump .right positiveNext zeroNext) :
    branchWord program control true (radix left) (radix predecessor)
        (radix scratch) =
      canonical program positiveNext left predecessor scratch := by
  unfold branchWord laneMultiplicity canonical dataBlock
  rw [instructionEq]
  simp only [branchNext, instructionTested?]
  cases nextInstruction : instructionAt program positiveNext <;>
    simp [nextInstruction, instructionLive, scale, instructionTested?,
      dataSymbol, List.append_assoc, Nat.mul_assoc,
      Nat.mul_comm, Nat.mul_left_comm]

theorem branchWord_decrement_right_zero
    (program : Program)
    (control positiveNext zeroNext left scratch : Nat)
    (instructionEq : instructionAt program control =
      .decrementJump .right positiveNext zeroNext) :
    branchWord program control false (radix left) 1 (radix scratch) =
      canonical program zeroNext left 0 scratch := by
  unfold branchWord laneMultiplicity canonical dataBlock
  rw [instructionEq]
  simp only [branchNext, instructionTested?]
  cases nextInstruction : instructionAt program zeroNext <;>
    simp [nextInstruction, instructionLive, scale, instructionTested?,
      dataSymbol, List.append_assoc, Nat.mul_assoc,
      Nat.mul_comm, Nat.mul_left_comm]

theorem branchWord_increment_scratch_positive
    (program : Program) (control next left right predecessor : Nat)
    (instructionEq : instructionAt program control =
      .increment .scratch next) :
    branchWord program control true (radix left) (radix right)
        (radix predecessor) =
      canonical program next left right (predecessor + 2) := by
  unfold branchWord laneMultiplicity canonical dataBlock
  rw [instructionEq]
  simp only [branchNext, instructionTested?]
  cases nextInstruction : instructionAt program next with
  | halt => simp [nextInstruction, instructionLive]
  | increment register following =>
      cases register <;>
        simp [nextInstruction, instructionLive, scale, instructionTested?,
          dataSymbol, radix_succ, List.append_assoc, Nat.mul_assoc,
          Nat.mul_comm, Nat.mul_left_comm, Nat.mul_add, Nat.add_mul,
          four_mul, eight_mul]
  | decrementJump register positive zeroNext =>
      cases register <;>
        simp [nextInstruction, instructionLive, scale, instructionTested?,
          dataSymbol, radix_succ, List.append_assoc, Nat.mul_assoc,
          Nat.mul_comm, Nat.mul_left_comm, Nat.mul_add, Nat.add_mul,
          four_mul, eight_mul]

theorem branchWord_increment_scratch_zero
    (program : Program) (control next left right : Nat)
    (instructionEq : instructionAt program control =
      .increment .scratch next) :
    branchWord program control false (radix left) (radix right) 1 =
      canonical program next left right 1 := by
  unfold branchWord laneMultiplicity canonical dataBlock
  rw [instructionEq]
  simp only [branchNext, instructionTested?]
  cases nextInstruction : instructionAt program next <;>
    simp [nextInstruction, instructionLive, scale, instructionTested?,
      dataSymbol, radix_succ, List.append_assoc, Nat.mul_assoc,
      Nat.mul_comm, Nat.mul_left_comm]

theorem branchWord_decrement_scratch_positive
    (program : Program)
    (control positiveNext zeroNext left right predecessor : Nat)
    (instructionEq : instructionAt program control =
      .decrementJump .scratch positiveNext zeroNext) :
    branchWord program control true (radix left) (radix right)
        (radix predecessor) =
      canonical program positiveNext left right predecessor := by
  unfold branchWord laneMultiplicity canonical dataBlock
  rw [instructionEq]
  simp only [branchNext, instructionTested?]
  cases nextInstruction : instructionAt program positiveNext <;>
    simp [nextInstruction, instructionLive, scale, instructionTested?,
      dataSymbol, List.append_assoc, Nat.mul_assoc,
      Nat.mul_comm, Nat.mul_left_comm]

theorem branchWord_decrement_scratch_zero
    (program : Program)
    (control positiveNext zeroNext left right : Nat)
    (instructionEq : instructionAt program control =
      .decrementJump .scratch positiveNext zeroNext) :
    branchWord program control false (radix left) (radix right) 1 =
      canonical program zeroNext left right 0 := by
  unfold branchWord laneMultiplicity canonical dataBlock
  rw [instructionEq]
  simp only [branchNext, instructionTested?]
  cases nextInstruction : instructionAt program zeroNext <;>
    simp [nextInstruction, instructionLive, scale, instructionTested?,
      dataSymbol, List.append_assoc, Nat.mul_assoc,
      Nat.mul_comm, Nat.mul_left_comm]

/-! ## Exact source-instruction macros -/

def halfFuel : Register -> Nat -> Nat -> Nat -> Nat
  | .left, 0, right, scratch => 2 + radix right + radix scratch
  | .left, left + 1, right, scratch =>
      1 + radix left + radix right + radix scratch
  | .right, left, 0, scratch => 2 + radix left + radix scratch
  | .right, left, right + 1, scratch =>
      1 + radix left + radix right + radix scratch
  | .scratch, left, right, 0 => 2 + radix left + radix right
  | .scratch, left, right, scratch + 1 =>
      1 + radix left + radix right + radix scratch

def macroFuel (register : Register) (left right scratch : Nat) : Nat :=
  halfFuel register left right scratch + halfFuel register left right scratch

theorem macro_increment_left (program : Program)
    (control next left right scratch : Nat)
    (instructionEq : instructionAt program control = .increment .left next) :
    tagIterate (production program) (macroFuel .left left right scratch)
        (canonical program control left right scratch) =
      canonical program next (left + 1) right scratch := by
  cases left with
  | zero =>
      simp only [macroFuel, halfFuel]
      rw [tagIterate_add,
        firstSweep_left_zero program control right scratch
          (.increment .left next) instructionEq rfl rfl,
        show 2 + radix right + radix scratch =
          2 + 0 + radix right + radix scratch by simp,
        zeroLaneSweep,
        branchWord_increment_left_zero program control next right scratch
          instructionEq]
  | succ predecessor =>
      simp only [macroFuel, halfFuel]
      rw [tagIterate_add,
        firstSweep_left_positive program control predecessor right scratch
          (.increment .left next) instructionEq rfl rfl,
        positiveLaneSweep,
        branchWord_increment_left_positive program control next predecessor
          right scratch instructionEq]

theorem macro_decrement_left (program : Program)
    (control positiveNext zeroNext left right scratch : Nat)
    (instructionEq : instructionAt program control =
      .decrementJump .left positiveNext zeroNext) :
    tagIterate (production program) (macroFuel .left left right scratch)
        (canonical program control left right scratch) =
      canonical program (if left = 0 then zeroNext else positiveNext)
        (left - 1) right scratch := by
  cases left with
  | zero =>
      simp only [macroFuel, halfFuel]
      rw [tagIterate_add,
        firstSweep_left_zero program control right scratch
          (.decrementJump .left positiveNext zeroNext) instructionEq rfl rfl,
        show 2 + radix right + radix scratch =
          2 + 0 + radix right + radix scratch by simp,
        zeroLaneSweep,
        branchWord_decrement_left_zero program control positiveNext zeroNext
          right scratch instructionEq]
      rfl
  | succ predecessor =>
      simp only [macroFuel, halfFuel]
      rw [tagIterate_add,
        firstSweep_left_positive program control predecessor right scratch
          (.decrementJump .left positiveNext zeroNext) instructionEq rfl rfl,
        positiveLaneSweep,
        branchWord_decrement_left_positive program control positiveNext
          zeroNext predecessor right scratch instructionEq]
      simp

theorem macro_increment_right (program : Program)
    (control next left right scratch : Nat)
    (instructionEq : instructionAt program control = .increment .right next) :
    tagIterate (production program) (macroFuel .right left right scratch)
        (canonical program control left right scratch) =
      canonical program next left (right + 1) scratch := by
  cases right with
  | zero =>
      obtain ⟨leftPredecessor, radixLeft⟩ := radix_is_succ left
      simp only [macroFuel, halfFuel]
      rw [tagIterate_add,
        firstSweep_right_zero program control left scratch
          (.increment .right next) instructionEq rfl rfl,
        radixLeft,
        show 2 + (leftPredecessor + 1) + radix scratch =
          2 + leftPredecessor + 1 + radix scratch by
            simp [Nat.add_assoc],
        zeroLaneSweep, <- radixLeft,
        branchWord_increment_right_zero program control next left scratch
          instructionEq]
  | succ predecessor =>
      simp only [macroFuel, halfFuel]
      rw [tagIterate_add,
        firstSweep_right_positive program control left predecessor scratch
          (.increment .right next) instructionEq rfl rfl,
        positiveLaneSweep,
        branchWord_increment_right_positive program control next left
          predecessor scratch instructionEq]

theorem macro_decrement_right (program : Program)
    (control positiveNext zeroNext left right scratch : Nat)
    (instructionEq : instructionAt program control =
      .decrementJump .right positiveNext zeroNext) :
    tagIterate (production program) (macroFuel .right left right scratch)
        (canonical program control left right scratch) =
      canonical program (if right = 0 then zeroNext else positiveNext)
        left (right - 1) scratch := by
  cases right with
  | zero =>
      obtain ⟨leftPredecessor, radixLeft⟩ := radix_is_succ left
      simp only [macroFuel, halfFuel]
      rw [tagIterate_add,
        firstSweep_right_zero program control left scratch
          (.decrementJump .right positiveNext zeroNext) instructionEq rfl rfl,
        radixLeft,
        show 2 + (leftPredecessor + 1) + radix scratch =
          2 + leftPredecessor + 1 + radix scratch by
            simp [Nat.add_assoc],
        zeroLaneSweep, <- radixLeft,
        branchWord_decrement_right_zero program control positiveNext zeroNext
          left scratch instructionEq]
      rfl
  | succ predecessor =>
      simp only [macroFuel, halfFuel]
      rw [tagIterate_add,
        firstSweep_right_positive program control left predecessor scratch
          (.decrementJump .right positiveNext zeroNext) instructionEq rfl rfl,
        positiveLaneSweep,
        branchWord_decrement_right_positive program control positiveNext
          zeroNext left predecessor scratch instructionEq]
      simp

theorem macro_increment_scratch (program : Program)
    (control next left right scratch : Nat)
    (instructionEq : instructionAt program control =
      .increment .scratch next) :
    tagIterate (production program) (macroFuel .scratch left right scratch)
        (canonical program control left right scratch) =
      canonical program next left right (scratch + 1) := by
  cases scratch with
  | zero =>
      obtain ⟨leftPredecessor, radixLeft⟩ := radix_is_succ left
      simp only [macroFuel, halfFuel]
      rw [tagIterate_add,
        firstSweep_scratch_zero program control left right
          (.increment .scratch next) instructionEq rfl rfl,
        radixLeft,
        show 2 + (leftPredecessor + 1) + radix right =
          2 + leftPredecessor + radix right + 1 by
            simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
            exact Nat.add_assoc 1 2 (radix right),
        zeroLaneSweep, <- radixLeft,
        branchWord_increment_scratch_zero program control next left right
          instructionEq]
  | succ predecessor =>
      simp only [macroFuel, halfFuel]
      rw [tagIterate_add,
        firstSweep_scratch_positive program control left right predecessor
          (.increment .scratch next) instructionEq rfl rfl,
        positiveLaneSweep,
        branchWord_increment_scratch_positive program control next left right
          predecessor instructionEq]

theorem macro_decrement_scratch (program : Program)
    (control positiveNext zeroNext left right scratch : Nat)
    (instructionEq : instructionAt program control =
      .decrementJump .scratch positiveNext zeroNext) :
    tagIterate (production program) (macroFuel .scratch left right scratch)
        (canonical program control left right scratch) =
      canonical program (if scratch = 0 then zeroNext else positiveNext)
        left right (scratch - 1) := by
  cases scratch with
  | zero =>
      obtain ⟨leftPredecessor, radixLeft⟩ := radix_is_succ left
      simp only [macroFuel, halfFuel]
      rw [tagIterate_add,
        firstSweep_scratch_zero program control left right
          (.decrementJump .scratch positiveNext zeroNext) instructionEq rfl rfl,
        radixLeft,
        show 2 + (leftPredecessor + 1) + radix right =
          2 + leftPredecessor + radix right + 1 by
            simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
            exact Nat.add_assoc 1 2 (radix right),
        zeroLaneSweep, <- radixLeft,
        branchWord_decrement_scratch_zero program control positiveNext zeroNext
          left right instructionEq]
      rfl
  | succ predecessor =>
      simp only [macroFuel, halfFuel]
      rw [tagIterate_add,
        firstSweep_scratch_positive program control left right predecessor
          (.decrementJump .scratch positiveNext zeroNext) instructionEq rfl rfl,
        positiveLaneSweep,
        branchWord_decrement_scratch_positive program control positiveNext
          zeroNext left right predecessor instructionEq]
      simp

/-! ## Source-step and run simulation -/

theorem encodeState_step (program : Program) (state : State) :
    exists fuel,
      tagIterate (production program) fuel (encodeState program state) =
        encodeState program (ThreeCounter.step program state) := by
  rcases state with ⟨control, left, right, scratch, status⟩
  cases status with
  | halted => exact ⟨0, rfl⟩
  | running =>
      cases instructionEq : instructionAt program control with
      | halt => exact ⟨0, by simp [encodeState, ThreeCounter.step,
          ThreeCounter.execute, canonical, header, dataBlock,
          instructionEq, instructionLive]⟩
      | increment register next =>
          cases register with
          | left =>
              refine ⟨macroFuel .left left right scratch, ?_⟩
              simpa [encodeState, ThreeCounter.step, ThreeCounter.execute,
                instructionEq,
                ThreeCounter.write, ThreeCounter.read] using
                  macro_increment_left program control next left right scratch
                    instructionEq
          | right =>
              refine ⟨macroFuel .right left right scratch, ?_⟩
              simpa [encodeState, ThreeCounter.step, ThreeCounter.execute,
                instructionEq,
                ThreeCounter.write, ThreeCounter.read] using
                  macro_increment_right program control next left right scratch
                    instructionEq
          | scratch =>
              refine ⟨macroFuel .scratch left right scratch, ?_⟩
              simpa [encodeState, ThreeCounter.step, ThreeCounter.execute,
                instructionEq,
                ThreeCounter.write, ThreeCounter.read] using
                  macro_increment_scratch program control next left right scratch
                    instructionEq
      | decrementJump register positiveNext zeroNext =>
          cases register with
          | left =>
              cases left with
              | zero =>
                  refine ⟨macroFuel .left 0 right scratch, ?_⟩
                  simpa [encodeState, ThreeCounter.step, ThreeCounter.execute,
                    instructionEq, ThreeCounter.write, ThreeCounter.read] using
                      macro_decrement_left program control positiveNext zeroNext
                        0 right scratch instructionEq
              | succ predecessor =>
                  refine ⟨macroFuel .left (predecessor + 1) right scratch, ?_⟩
                  simpa [encodeState, ThreeCounter.step, ThreeCounter.execute,
                    instructionEq, ThreeCounter.write, ThreeCounter.read] using
                      macro_decrement_left program control positiveNext zeroNext
                        (predecessor + 1) right scratch instructionEq
          | right =>
              cases right with
              | zero =>
                  refine ⟨macroFuel .right left 0 scratch, ?_⟩
                  simpa [encodeState, ThreeCounter.step, ThreeCounter.execute,
                    instructionEq, ThreeCounter.write, ThreeCounter.read] using
                      macro_decrement_right program control positiveNext zeroNext
                        left 0 scratch instructionEq
              | succ predecessor =>
                  refine ⟨macroFuel .right left (predecessor + 1) scratch, ?_⟩
                  simpa [encodeState, ThreeCounter.step, ThreeCounter.execute,
                    instructionEq, ThreeCounter.write, ThreeCounter.read] using
                      macro_decrement_right program control positiveNext zeroNext
                        left (predecessor + 1) scratch instructionEq
          | scratch =>
              cases scratch with
              | zero =>
                  refine ⟨macroFuel .scratch left right 0, ?_⟩
                  simpa [encodeState, ThreeCounter.step, ThreeCounter.execute,
                    instructionEq, ThreeCounter.write, ThreeCounter.read] using
                      macro_decrement_scratch program control positiveNext zeroNext
                        left right 0 instructionEq
              | succ predecessor =>
                  refine ⟨macroFuel .scratch left right (predecessor + 1), ?_⟩
                  simpa [encodeState, ThreeCounter.step, ThreeCounter.execute,
                    instructionEq, ThreeCounter.write, ThreeCounter.read] using
                      macro_decrement_scratch program control positiveNext zeroNext
                        left right (predecessor + 1) instructionEq

theorem encodeState_run (program : Program) (state : State) :
    forall sourceFuel,
      exists tagFuel,
        tagIterate (production program) tagFuel (encodeState program state) =
          encodeState program (ThreeCounter.run program sourceFuel state)
  | 0 => ⟨0, rfl⟩
  | sourceFuel + 1 => by
      obtain ⟨prefixFuel, prefixRun⟩ := encodeState_run program state sourceFuel
      obtain ⟨stepFuel, stepRun⟩ :=
        encodeState_step program (ThreeCounter.run program sourceFuel state)
      refine ⟨stepFuel + prefixFuel, ?_⟩
      rw [tagIterate_add, prefixRun, stepRun]
      rfl

def TypedEventuallyHalts (program : Program) (initial : State) : Prop :=
  exists fuel,
    (tagIterate (production program) fuel
      (encodeState program initial)).head? = some .halt

theorem halts_implies_typedEventuallyHalts
    (program : Program) (initial : State) :
    ThreeCounter.Halts program initial -> TypedEventuallyHalts program initial := by
  rintro ⟨sourceFuel, halted⟩
  obtain ⟨tagFuel, tagRun⟩ := encodeState_run program initial sourceFuel
  refine ⟨tagFuel, ?_⟩
  rw [tagRun]
  cases finalState : ThreeCounter.run program sourceFuel initial with
  | mk control left right scratch status =>
      simp_all [encodeState]

/-! ## Strict-prefix safety -/

@[simp] theorem alternativeWord_length
    (control leftCount rightCount scratchCount : Nat) :
    (alternativeWord control leftCount rightCount scratchCount).length =
      2 * (1 + leftCount + rightCount + scratchCount) := by
  simp [alternativeWord, alternatives, pairWord_length]
  simp [Nat.mul_add, Nat.add_mul, Nat.add_assoc, Nat.add_comm,
    Nat.add_left_comm]
  simp [Nat.mul_comm]
  symm
  exact Nat.add_assoc 1 1 _

theorem halt_not_mem_alternativeWord
    (control leftCount rightCount scratchCount : Nat) :
    .halt ∉ alternativeWord control leftCount rightCount scratchCount := by
  unfold alternativeWord
  apply halt_not_mem_pairWord_of_components
  intro pair pairMem
  simp only [alternatives, List.mem_append, List.mem_cons,
    List.not_mem_nil, List.mem_replicate] at pairMem
  rcases pairMem with ((((pairEq | impossible) | ⟨_, pairEq⟩) |
      ⟨_, pairEq⟩) | ⟨_, pairEq⟩)
  · subst pair; simp
  · exact False.elim impossible
  · subst pair; simp [positiveSymbol, zeroSymbol]
  · subst pair; simp [positiveSymbol, zeroSymbol]
  · subst pair; simp [positiveSymbol, zeroSymbol]

theorem halt_not_mem_alternativeWord_tail
    (control leftCount rightCount scratchCount : Nat) :
    .halt ∉ (alternativeWord control leftCount rightCount scratchCount).tail :=
  fun membership => halt_not_mem_alternativeWord control leftCount rightCount
    scratchCount (List.mem_of_mem_tail membership)

theorem halt_not_mem_canonical_of_live
    (program : Program) (control left right scratch : Nat)
    (live : instructionLive (instructionAt program control) = true) :
    .halt ∉ canonical program control left right scratch := by
  cases instructionEq : instructionAt program control with
  | halt => simp [instructionEq, instructionLive] at live
  | increment register next =>
      cases register <;>
        simp [canonical, header, dataBlock, instructionEq, instructionLive,
          scale, instructionTested?, dataSymbol]
  | decrementJump register positive zeroNext =>
      cases register <;>
        simp [canonical, header, dataBlock, instructionEq, instructionLive,
          scale, instructionTested?, dataSymbol]

theorem canonical_prefix_bound_of_tested
    (program : Program) (control left right scratch fuel : Nat)
    (instruction : Instruction) (register : Register)
    (instructionEq : instructionAt program control = instruction)
    (liveEq : instructionLive instruction = true)
    (testedEq : instructionTested? instruction = some register)
    (fuelLt : fuel < halfFuel register left right scratch) :
    2 * fuel < (canonical program control left right scratch).length := by
  have positiveLayout {current firstCount secondCount thirdCount : Nat}
      (less : current < 1 + firstCount + secondCount + thirdCount) :
      2 * current <
        1 + (1 + (2 * firstCount + (2 * secondCount + 2 * thirdCount))) := by
    have doubled :=
      Nat.mul_lt_mul_of_pos_left less (Nat.zero_lt_succ 1)
    have rhsEq : 2 * (1 + firstCount + secondCount + thirdCount) =
        1 + (1 +
          (2 * firstCount + (2 * secondCount + 2 * thirdCount))) := by
      simp [Nat.mul_add, Nat.add_mul, Nat.add_assoc, Nat.add_comm,
        Nat.add_left_comm]
      exact Nat.add_assoc 1 1 _
    rw [rhsEq] at doubled
    exact doubled
  have zeroLayout {current firstCount secondCount : Nat}
      (less : current < 2 + firstCount + secondCount) :
      2 * current <
        1 + (1 + (1 + (2 * firstCount + 2 * secondCount))) := by
    have successorLe : current + 1 ≤ 2 + firstCount + secondCount :=
      Nat.succ_le_of_lt less
    have successorLe' : current + 1 ≤
        (1 + firstCount + secondCount) + 1 := by
      simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using successorLe
    have currentLe : current ≤ 1 + firstCount + secondCount :=
      Nat.le_of_succ_le_succ successorLe'
    have core := Nat.lt_succ_of_le (Nat.mul_le_mul_left 2 currentLe)
    have rhsEq : Nat.succ (2 * (1 + firstCount + secondCount)) =
        1 + (1 + (1 + (2 * firstCount + 2 * secondCount))) := by
      simp [Nat.mul_add, Nat.add_mul, Nat.add_assoc, Nat.add_comm,
        Nat.add_left_comm]
      exact Nat.add_assoc 1 1 _
    rw [rhsEq] at core
    exact core
  cases instruction with
  | halt => simp [instructionLive] at liveEq
  | increment tested next =>
      cases tested with
      | left =>
          have registerEq : register = .left := by
            simpa [instructionTested?] using testedEq.symm
          subst register
          cases left with
          | zero =>
              exact (by
                simpa [canonical, header, dataBlock, instructionEq,
                  instructionLive, instructionTested?, scale, dataSymbol,
                  halfFuel, List.length_append, Nat.mul_add, Nat.add_mul,
                  Nat.mul_assoc, Nat.add_assoc, Nat.add_comm,
                  Nat.add_left_comm] using
                    (zeroLayout fuelLt))
          | succ predecessor =>
              exact (by
                simpa [canonical, header, dataBlock, instructionEq,
                  instructionLive, instructionTested?, scale, dataSymbol,
                  halfFuel, radix_succ, List.length_append, Nat.mul_add,
                  Nat.add_mul, Nat.mul_assoc, Nat.add_assoc, Nat.add_comm,
                  Nat.add_left_comm] using
                    (positiveLayout fuelLt))
      | right =>
          have registerEq : register = .right := by
            simpa [instructionTested?] using testedEq.symm
          subst register
          cases right with
          | zero =>
              exact (by
                simpa [canonical, header, dataBlock, instructionEq,
                  instructionLive, instructionTested?, scale, dataSymbol,
                  halfFuel, List.length_append, Nat.mul_add, Nat.add_mul,
                  Nat.mul_assoc, Nat.add_assoc, Nat.add_comm,
                  Nat.add_left_comm] using
                    (zeroLayout fuelLt))
          | succ predecessor =>
              exact (by
                simpa [canonical, header, dataBlock, instructionEq,
                  instructionLive, instructionTested?, scale, dataSymbol,
                  halfFuel, radix_succ, List.length_append, Nat.mul_add,
                  Nat.add_mul, Nat.mul_assoc, Nat.add_assoc, Nat.add_comm,
                  Nat.add_left_comm] using
                    (positiveLayout fuelLt))
      | scratch =>
          have registerEq : register = .scratch := by
            simpa [instructionTested?] using testedEq.symm
          subst register
          cases scratch with
          | zero =>
              exact (by
                simpa [canonical, header, dataBlock, instructionEq,
                  instructionLive, instructionTested?, scale, dataSymbol,
                  halfFuel, List.length_append, Nat.mul_add, Nat.add_mul,
                  Nat.mul_assoc, Nat.add_assoc, Nat.add_comm,
                  Nat.add_left_comm] using
                    (zeroLayout fuelLt))
          | succ predecessor =>
              exact (by
                simpa [canonical, header, dataBlock, instructionEq,
                  instructionLive, instructionTested?, scale, dataSymbol,
                  halfFuel, radix_succ, List.length_append, Nat.mul_add,
                  Nat.add_mul, Nat.mul_assoc, Nat.add_assoc, Nat.add_comm,
                  Nat.add_left_comm] using
                    (positiveLayout fuelLt))
  | decrementJump tested positive zeroNext =>
      cases tested with
      | left =>
          have registerEq : register = .left := by
            simpa [instructionTested?] using testedEq.symm
          subst register
          cases left with
          | zero =>
              exact (by
                simpa [canonical, header, dataBlock, instructionEq,
                  instructionLive, instructionTested?, scale, dataSymbol,
                  halfFuel, List.length_append, Nat.mul_add, Nat.add_mul,
                  Nat.mul_assoc, Nat.add_assoc, Nat.add_comm,
                  Nat.add_left_comm] using
                    (zeroLayout fuelLt))
          | succ predecessor =>
              exact (by
                simpa [canonical, header, dataBlock, instructionEq,
                  instructionLive, instructionTested?, scale, dataSymbol,
                  halfFuel, radix_succ, List.length_append, Nat.mul_add,
                  Nat.add_mul, Nat.mul_assoc, Nat.add_assoc, Nat.add_comm,
                  Nat.add_left_comm] using
                    (positiveLayout fuelLt))
      | right =>
          have registerEq : register = .right := by
            simpa [instructionTested?] using testedEq.symm
          subst register
          cases right with
          | zero =>
              exact (by
                simpa [canonical, header, dataBlock, instructionEq,
                  instructionLive, instructionTested?, scale, dataSymbol,
                  halfFuel, List.length_append, Nat.mul_add, Nat.add_mul,
                  Nat.mul_assoc, Nat.add_assoc, Nat.add_comm,
                  Nat.add_left_comm] using
                    (zeroLayout fuelLt))
          | succ predecessor =>
              exact (by
                simpa [canonical, header, dataBlock, instructionEq,
                  instructionLive, instructionTested?, scale, dataSymbol,
                  halfFuel, radix_succ, List.length_append, Nat.mul_add,
                  Nat.add_mul, Nat.mul_assoc, Nat.add_assoc, Nat.add_comm,
                  Nat.add_left_comm] using
                    (positiveLayout fuelLt))
      | scratch =>
          have registerEq : register = .scratch := by
            simpa [instructionTested?] using testedEq.symm
          subst register
          cases scratch with
          | zero =>
              exact (by
                simpa [canonical, header, dataBlock, instructionEq,
                  instructionLive, instructionTested?, scale, dataSymbol,
                  halfFuel, List.length_append, Nat.mul_add, Nat.add_mul,
                  Nat.mul_assoc, Nat.add_assoc, Nat.add_comm,
                  Nat.add_left_comm] using
                    (zeroLayout fuelLt))
          | succ predecessor =>
              exact (by
                simpa [canonical, header, dataBlock, instructionEq,
                  instructionLive, instructionTested?, scale, dataSymbol,
                  halfFuel, radix_succ, List.length_append, Nat.mul_add,
                  Nat.add_mul, Nat.mul_assoc, Nat.add_assoc, Nat.add_comm,
                  Nat.add_left_comm] using
                    (positiveLayout fuelLt))

theorem firstSweep_prefix_ne_halt
    (program : Program) (control left right scratch fuel : Nat)
    (instruction : Instruction) (register : Register)
    (instructionEq : instructionAt program control = instruction)
    (liveEq : instructionLive instruction = true)
    (testedEq : instructionTested? instruction = some register)
    (fuelLt : fuel < halfFuel register left right scratch) :
    (tagIterate (production program) fuel
      (canonical program control left right scratch)).head? ≠ some .halt := by
  simpa using tagIterate_prefix_head_ne_halt (production program) fuel
    (canonical program control left right scratch) []
    (halt_not_mem_canonical_of_live program control left right scratch
      (by simpa [instructionEq] using liveEq))
    (canonical_prefix_bound_of_tested program control left right scratch fuel
      instruction register instructionEq liveEq testedEq fuelLt)

theorem positiveLane_prefix_ne_halt
    (program : Program) (control leftCount rightCount scratchCount fuel : Nat)
    (fuelLt : fuel < 1 + leftCount + rightCount + scratchCount) :
    (tagIterate (production program) fuel
      (alternativeWord control leftCount rightCount scratchCount)).head? ≠
        some .halt := by
  have bound : 2 * fuel <
      (alternativeWord control leftCount rightCount scratchCount).length := by
    rw [alternativeWord_length]
    exact Nat.mul_lt_mul_of_pos_left fuelLt (by decide)
  simpa using tagIterate_prefix_head_ne_halt (production program) fuel
    (alternativeWord control leftCount rightCount scratchCount) []
    (halt_not_mem_alternativeWord control leftCount rightCount scratchCount)
    bound

theorem zeroLane_prefix_ne_halt
    (program : Program) (control leftPredecessor rightCount scratchCount fuel : Nat)
    (fuelLt : fuel < 2 + leftPredecessor + rightCount + scratchCount) :
    (tagIterate (production program) fuel
      (alternativeWord control (leftPredecessor + 1) rightCount
        scratchCount).tail).head? ≠ some .halt := by
  have bound : 2 * fuel <
      (alternativeWord control (leftPredecessor + 1) rightCount
        scratchCount).tail.length := by
    rw [List.length_tail, alternativeWord_length]
    have successorLe : fuel + 1 ≤
        2 + leftPredecessor + rightCount + scratchCount :=
      Nat.succ_le_of_lt fuelLt
    have doubled := Nat.mul_le_mul_left 2 successorLe
    have plusTwo : 2 * fuel + 1 + 1 ≤
        2 * (2 + leftPredecessor + rightCount + scratchCount) := by
      rw [show 2 * fuel + 1 + 1 = 2 * (fuel + 1) by
        simp [Nat.mul_add, Nat.add_assoc]]
      exact doubled
    have subBound := Nat.le_sub_of_add_le plusTwo
    exact Nat.lt_of_succ_le (by
      simpa [Nat.succ_eq_add_one, Nat.mul_add, Nat.add_mul,
        Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using subBound)
  simpa using tagIterate_prefix_head_ne_halt (production program) fuel
    (alternativeWord control (leftPredecessor + 1) rightCount
      scratchCount).tail []
    (halt_not_mem_alternativeWord_tail control (leftPredecessor + 1)
      rightCount scratchCount) bound

theorem macroFuel_positive (register : Register) (left right scratch : Nat) :
    0 < macroFuel register left right scratch := by
  unfold macroFuel
  have halfPositive : 0 < halfFuel register left right scratch := by
    cases register with
    | left =>
        cases left with
        | zero =>
            simp only [halfFuel]
            exact Nat.add_pos_left
              (Nat.add_pos_left (by decide : 0 < 2) _) _
        | succ predecessor =>
            simp only [halfFuel]
            exact Nat.add_pos_left
              (Nat.add_pos_left
                (Nat.add_pos_left (by decide : 0 < 1) _) _) _
    | right =>
        cases right with
        | zero =>
            simp only [halfFuel]
            exact Nat.add_pos_left
              (Nat.add_pos_left (by decide : 0 < 2) _) _
        | succ predecessor =>
            simp only [halfFuel]
            exact Nat.add_pos_left
              (Nat.add_pos_left
                (Nat.add_pos_left (by decide : 0 < 1) _) _) _
    | scratch =>
        cases scratch with
        | zero =>
            simp only [halfFuel]
            exact Nat.add_pos_left
              (Nat.add_pos_left (by decide : 0 < 2) _) _
        | succ predecessor =>
            simp only [halfFuel]
            exact Nat.add_pos_left
              (Nat.add_pos_left
                (Nat.add_pos_left (by decide : 0 < 1) _) _) _
  exact Nat.add_pos_left halfPositive _

theorem live_macro_prefix_ne_halt
    (program : Program) (control left right scratch fuel : Nat)
    (instruction : Instruction) (register : Register)
    (instructionEq : instructionAt program control = instruction)
    (liveEq : instructionLive instruction = true)
    (testedEq : instructionTested? instruction = some register)
    (fuelLt : fuel < macroFuel register left right scratch) :
    (tagIterate (production program) fuel
      (canonical program control left right scratch)).head? ≠ some .halt := by
  cases register with
  | left =>
      cases left with
      | zero =>
          simp only [macroFuel, halfFuel] at fuelLt
          apply twoPhase_prefix_ne_halt (production program)
            (canonical program control 0 right scratch)
            (alternativeWord control 1 (radix right) (radix scratch)).tail
            (2 + radix right + radix scratch) fuel
            (firstSweep_left_zero program control right scratch instruction
              instructionEq liveEq testedEq)
          · intro firstFuel firstFuelLt
            exact firstSweep_prefix_ne_halt program control 0 right scratch
              firstFuel instruction .left instructionEq liveEq testedEq
              firstFuelLt
          · intro secondFuel secondFuelLt
            exact zeroLane_prefix_ne_halt program control 0 (radix right)
              (radix scratch) secondFuel (by simpa using secondFuelLt)
          · exact fuelLt
      | succ predecessor =>
          simp only [macroFuel, halfFuel] at fuelLt
          apply twoPhase_prefix_ne_halt (production program)
            (canonical program control (predecessor + 1) right scratch)
            (alternativeWord control (radix predecessor) (radix right)
              (radix scratch))
            (1 + radix predecessor + radix right + radix scratch) fuel
            (firstSweep_left_positive program control predecessor right scratch
              instruction instructionEq liveEq testedEq)
          · intro firstFuel firstFuelLt
            exact firstSweep_prefix_ne_halt program control (predecessor + 1)
              right scratch firstFuel instruction .left instructionEq liveEq
              testedEq firstFuelLt
          · intro secondFuel secondFuelLt
            exact positiveLane_prefix_ne_halt program control
              (radix predecessor) (radix right) (radix scratch) secondFuel
              secondFuelLt
          · exact fuelLt
  | right =>
      cases right with
      | zero =>
          simp only [macroFuel, halfFuel] at fuelLt
          obtain ⟨leftPredecessor, radixLeft⟩ := radix_is_succ left
          apply twoPhase_prefix_ne_halt (production program)
            (canonical program control left 0 scratch)
            (alternativeWord control (radix left) 1 (radix scratch)).tail
            (2 + radix left + radix scratch) fuel
            (firstSweep_right_zero program control left scratch instruction
              instructionEq liveEq testedEq)
          · intro firstFuel firstFuelLt
            exact firstSweep_prefix_ne_halt program control left 0 scratch
              firstFuel instruction .right instructionEq liveEq testedEq
              firstFuelLt
          · intro secondFuel secondFuelLt
            rw [radixLeft] at secondFuelLt ⊢
            exact zeroLane_prefix_ne_halt program control leftPredecessor 1
              (radix scratch) secondFuel (by
                simpa [Nat.add_assoc] using secondFuelLt)
          · exact fuelLt
      | succ predecessor =>
          simp only [macroFuel, halfFuel] at fuelLt
          apply twoPhase_prefix_ne_halt (production program)
            (canonical program control left (predecessor + 1) scratch)
            (alternativeWord control (radix left) (radix predecessor)
              (radix scratch))
            (1 + radix left + radix predecessor + radix scratch) fuel
            (firstSweep_right_positive program control left predecessor scratch
              instruction instructionEq liveEq testedEq)
          · intro firstFuel firstFuelLt
            exact firstSweep_prefix_ne_halt program control left
              (predecessor + 1) scratch firstFuel instruction .right
              instructionEq liveEq testedEq firstFuelLt
          · intro secondFuel secondFuelLt
            exact positiveLane_prefix_ne_halt program control (radix left)
              (radix predecessor) (radix scratch) secondFuel secondFuelLt
          · exact fuelLt
  | scratch =>
      cases scratch with
      | zero =>
          simp only [macroFuel, halfFuel] at fuelLt
          obtain ⟨leftPredecessor, radixLeft⟩ := radix_is_succ left
          apply twoPhase_prefix_ne_halt (production program)
            (canonical program control left right 0)
            (alternativeWord control (radix left) (radix right) 1).tail
            (2 + radix left + radix right) fuel
            (firstSweep_scratch_zero program control left right instruction
              instructionEq liveEq testedEq)
          · intro firstFuel firstFuelLt
            exact firstSweep_prefix_ne_halt program control left right 0
              firstFuel instruction .scratch instructionEq liveEq testedEq
              firstFuelLt
          · intro secondFuel secondFuelLt
            rw [radixLeft] at secondFuelLt ⊢
            exact zeroLane_prefix_ne_halt program control leftPredecessor
              (radix right) 1 secondFuel (by
                have durationEq :
                    2 + leftPredecessor + radix right + 1 =
                      2 + (leftPredecessor + 1) + radix right := by
                  calc
                    2 + leftPredecessor + radix right + 1 =
                        (2 + leftPredecessor) + (radix right + 1) :=
                      Nat.add_assoc _ _ _
                    _ = (2 + leftPredecessor) + (1 + radix right) :=
                      congrArg (Nat.add (2 + leftPredecessor))
                        (Nat.add_comm (radix right) 1)
                    _ = (2 + leftPredecessor + 1) + radix right :=
                      (Nat.add_assoc _ _ _).symm
                    _ = (2 + (leftPredecessor + 1)) + radix right :=
                      congrArg (fun value => value + radix right)
                        (Nat.add_assoc 2 leftPredecessor 1)
                rw [durationEq]
                exact secondFuelLt)
          · exact fuelLt
      | succ predecessor =>
          simp only [macroFuel, halfFuel] at fuelLt
          apply twoPhase_prefix_ne_halt (production program)
            (canonical program control left right (predecessor + 1))
            (alternativeWord control (radix left) (radix right)
              (radix predecessor))
            (1 + radix left + radix right + radix predecessor) fuel
            (firstSweep_scratch_positive program control left right predecessor
              instruction instructionEq liveEq testedEq)
          · intro firstFuel firstFuelLt
            exact firstSweep_prefix_ne_halt program control left right
              (predecessor + 1) firstFuel instruction .scratch instructionEq
              liveEq testedEq firstFuelLt
          · intro secondFuel secondFuelLt
            exact positiveLane_prefix_ne_halt program control (radix left)
              (radix right) (radix predecessor) secondFuel secondFuelLt
          · exact fuelLt

theorem increment_macro_boundary (program : Program)
    (control left right scratch next : Nat) (register : Register)
    (instructionEq : instructionAt program control =
      .increment register next) :
    tagIterate (production program) (macroFuel register left right scratch)
        (encodeState program
          ⟨control, left, right, scratch, .running⟩) =
      encodeState program (ThreeCounter.step program
        ⟨control, left, right, scratch, .running⟩) := by
  cases register with
  | left =>
      simpa [encodeState, ThreeCounter.step, ThreeCounter.execute,
        instructionEq, ThreeCounter.write, ThreeCounter.read] using
          macro_increment_left program control next left right scratch
            instructionEq
  | right =>
      simpa [encodeState, ThreeCounter.step, ThreeCounter.execute,
        instructionEq, ThreeCounter.write, ThreeCounter.read] using
          macro_increment_right program control next left right scratch
            instructionEq
  | scratch =>
      simpa [encodeState, ThreeCounter.step, ThreeCounter.execute,
        instructionEq, ThreeCounter.write, ThreeCounter.read] using
          macro_increment_scratch program control next left right scratch
            instructionEq

theorem decrement_macro_boundary (program : Program)
    (control left right scratch positiveNext zeroNext : Nat)
    (register : Register)
    (instructionEq : instructionAt program control =
      .decrementJump register positiveNext zeroNext) :
    tagIterate (production program) (macroFuel register left right scratch)
        (encodeState program
          ⟨control, left, right, scratch, .running⟩) =
      encodeState program (ThreeCounter.step program
        ⟨control, left, right, scratch, .running⟩) := by
  cases register with
  | left =>
      cases left with
      | zero =>
          simpa [encodeState, ThreeCounter.step, ThreeCounter.execute,
            instructionEq, ThreeCounter.write, ThreeCounter.read] using
              macro_decrement_left program control positiveNext zeroNext
                0 right scratch instructionEq
      | succ predecessor =>
          simpa [encodeState, ThreeCounter.step, ThreeCounter.execute,
            instructionEq, ThreeCounter.write, ThreeCounter.read] using
              macro_decrement_left program control positiveNext zeroNext
                (predecessor + 1) right scratch instructionEq
  | right =>
      cases right with
      | zero =>
          simpa [encodeState, ThreeCounter.step, ThreeCounter.execute,
            instructionEq, ThreeCounter.write, ThreeCounter.read] using
              macro_decrement_right program control positiveNext zeroNext
                left 0 scratch instructionEq
      | succ predecessor =>
          simpa [encodeState, ThreeCounter.step, ThreeCounter.execute,
            instructionEq, ThreeCounter.write, ThreeCounter.read] using
              macro_decrement_right program control positiveNext zeroNext
                left (predecessor + 1) scratch instructionEq
  | scratch =>
      cases scratch with
      | zero =>
          simpa [encodeState, ThreeCounter.step, ThreeCounter.execute,
            instructionEq, ThreeCounter.write, ThreeCounter.read] using
              macro_decrement_scratch program control positiveNext zeroNext
                left right 0 instructionEq
      | succ predecessor =>
          simpa [encodeState, ThreeCounter.step, ThreeCounter.execute,
            instructionEq, ThreeCounter.write, ThreeCounter.read] using
              macro_decrement_scratch program control positiveNext zeroNext
                left right (predecessor + 1) instructionEq

theorem source_run_succ_front (program : Program) (fuel : Nat) (state : State) :
    ThreeCounter.run program (fuel + 1) state =
      ThreeCounter.run program fuel (ThreeCounter.step program state) := by
  induction fuel with
  | zero => rfl
  | succ fuel ih =>
      change ThreeCounter.step program
          (ThreeCounter.run program (fuel + 1) state) =
        ThreeCounter.step program
          (ThreeCounter.run program fuel (ThreeCounter.step program state))
      exact congrArg (ThreeCounter.step program) ih

theorem tagIterate_head_halt_reflects_source (program : Program) :
    forall fuel state,
      (tagIterate (production program) fuel
        (encodeState program state)).head? = some .halt ->
      exists sourceFuel,
        (ThreeCounter.run program sourceFuel state).status = .halted := by
  intro fuel
  induction fuel using Nat.strongRecOn with
  | ind fuel ih =>
      intro state haltHead
      rcases state with ⟨control, left, right, scratch, status⟩
      cases status with
      | halted => exact ⟨0, rfl⟩
      | running =>
          let current : State := ⟨control, left, right, scratch, .running⟩
          have reflectLiveMacro
              (register : Register)
              (durationPositive : 0 < macroFuel register left right scratch)
              (prefixSafe : forall prefixFuel,
                prefixFuel < macroFuel register left right scratch ->
                (tagIterate (production program) prefixFuel
                  (encodeState program current)).head? ≠ some .halt)
              (boundary :
                tagIterate (production program)
                    (macroFuel register left right scratch)
                    (encodeState program current) =
                  encodeState program (ThreeCounter.step program current)) :
              exists sourceFuel,
                (ThreeCounter.run program sourceFuel current).status =
                  .halted := by
            by_cases fuelLt : fuel < macroFuel register left right scratch
            · exact False.elim (prefixSafe fuel fuelLt haltHead)
            · have durationLe : macroFuel register left right scratch ≤ fuel :=
                Nat.le_of_not_gt fuelLt
              have remainderLt :
                  fuel - macroFuel register left right scratch < fuel :=
                Nat.sub_lt
                  (Nat.lt_of_lt_of_le durationPositive durationLe)
                  durationPositive
              have fuelEq : fuel =
                  (fuel - macroFuel register left right scratch) +
                    macroFuel register left right scratch :=
                (Nat.sub_add_cancel durationLe).symm
              have nextHalt :
                  (tagIterate (production program)
                    (fuel - macroFuel register left right scratch)
                    (encodeState program
                      (ThreeCounter.step program current))).head? =
                    some .halt := by
                rw [fuelEq, tagIterate_add, boundary] at haltHead
                exact haltHead
              obtain ⟨nextFuel, nextHalts⟩ :=
                ih (fuel - macroFuel register left right scratch) remainderLt
                  (ThreeCounter.step program current) nextHalt
              refine ⟨nextFuel + 1, ?_⟩
              rw [source_run_succ_front]
              exact nextHalts
          cases instructionEq : instructionAt program control with
          | halt =>
              refine ⟨1, ?_⟩
              simp [ThreeCounter.run, ThreeCounter.step, ThreeCounter.execute,
                instructionEq]
          | increment register next =>
              apply reflectLiveMacro register
                (macroFuel_positive register left right scratch)
              · intro prefixFuel prefixLt
                exact live_macro_prefix_ne_halt program control left right
                  scratch prefixFuel (.increment register next) register
                  instructionEq rfl rfl prefixLt
              · exact increment_macro_boundary program control left right
                  scratch next register instructionEq
          | decrementJump register positiveNext zeroNext =>
              apply reflectLiveMacro register
                (macroFuel_positive register left right scratch)
              · intro prefixFuel prefixLt
                exact live_macro_prefix_ne_halt program control left right
                  scratch prefixFuel
                  (.decrementJump register positiveNext zeroNext) register
                  instructionEq rfl rfl prefixLt
              · exact decrement_macro_boundary program control left right
                  scratch positiveNext zeroNext register instructionEq

theorem typedEventuallyHalts_implies_halts
    (program : Program) (initial : State) :
    TypedEventuallyHalts program initial -> ThreeCounter.Halts program initial := by
  rintro ⟨tagFuel, haltHead⟩
  exact tagIterate_head_halt_reflects_source program tagFuel initial haltHead

theorem halts_iff_typedEventuallyHalts (program : Program) (initial : State) :
    ThreeCounter.Halts program initial ↔ TypedEventuallyHalts program initial :=
  ⟨halts_implies_typedEventuallyHalts program initial,
    typedEventuallyHalts_implies_halts program initial⟩

/-! ## Structural facts used by the finite compiler -/

@[simp] theorem tagStep_sink (program : Program) :
    tagStep (production program) [.sink, .sink] = [.sink, .sink] := rfl

theorem two_le_encodeState_length (program : Program) (state : State) :
    2 ≤ (encodeState program state).length := by
  rcases state with ⟨control, left, right, scratch, status⟩
  cases status with
  | halted => simp [encodeState]
  | running =>
      cases instructionEq : instructionAt program control <;>
        simp [encodeState, canonical, header, dataBlock, instructionEq,
          instructionLive]

/-! ## Finite numerical enumeration -/

namespace Numeric

abbrev TagProgram := RogozhinTagInput.Program

/-- A phantom two-counter table supplies the already-audited ten-block
enumeration with width `3 * program.length`, enough for every paired
control/register payload.  Its instructions are never executed. -/
def enumerationProgram (program : Program) : CounterMachine.Program :=
  List.replicate (3 * program.length) .reject

@[simp] theorem enumerationProgram_length (program : Program) :
    (enumerationProgram program).length = 3 * program.length := by
  simp [enumerationProgram]

abbrev ordinaryCount (program : Program) : Nat :=
  CounterMachineTag.Numeric.ordinaryCount (enumerationProgram program)

abbrev encodeSymbol (program : Program) (symbol : Symbol) : Nat :=
  CounterMachineTag.Numeric.encodeSymbol (enumerationProgram program) symbol

abbrev decodeSymbol (program : Program) (label : Nat) : Symbol :=
  CounterMachineTag.Numeric.decodeSymbol (enumerationProgram program) label

abbrev Bounded (program : Program) (symbol : Symbol) : Prop :=
  CounterMachineTag.Numeric.Bounded (enumerationProgram program) symbol

theorem encodeSymbol_lt_count_of_ne_halt
    {program : Program} {symbol : Symbol}
    (bounded : Bounded program symbol) (notHalt : symbol ≠ .halt) :
    encodeSymbol program symbol < ordinaryCount program :=
  CounterMachineTag.Numeric.encodeSymbol_lt_count_of_ne_halt bounded notHalt

theorem encodeSymbol_le_count
    {program : Program} {symbol : Symbol}
    (bounded : Bounded program symbol) :
    encodeSymbol program symbol ≤ ordinaryCount program :=
  CounterMachineTag.Numeric.encodeSymbol_le_count bounded

theorem decode_encode
    {program : Program} {symbol : Symbol}
    (bounded : Bounded program symbol) (notHalt : symbol ≠ .halt) :
    decodeSymbol program (encodeSymbol program symbol) = symbol :=
  CounterMachineTag.Numeric.decode_encode bounded notHalt

theorem decodeSymbol_bounded (program : Program) (label : Nat) :
    Bounded program (decodeSymbol program label) :=
  CounterMachineTag.Numeric.decodeSymbol_bounded
    (enumerationProgram program) label

theorem control_bounded {program : Program} {control : Nat}
    (controlLt : control < program.length) :
    Bounded program (.head control) := by
  change control < (enumerationProgram program).length
  rw [enumerationProgram_length]
  exact Nat.lt_of_lt_of_le controlLt (by
    simpa using Nat.mul_le_mul_right program.length
      (show 1 ≤ 3 by decide))

theorem payload_bounded {program : Program} {control : Nat}
    (register : Register) (controlLt : control < program.length) :
    Bounded program (dataSymbol control register) := by
  change payload control register < (enumerationProgram program).length
  rw [enumerationProgram_length]
  have beforeNext := CounterMachineTag.Numeric.block_lt_next 3
    (registerId register) control (registerId_lt_three register)
  have nextLe := Nat.mul_le_mul_right 3 (Nat.succ_le_of_lt controlLt)
  exact (by
    simpa [payload, Nat.mul_comm] using
      (Nat.lt_of_lt_of_le beforeNext nextLe))

/-! ### Bounded typed words -/

def WordBounded (program : Program) (word : List Symbol) : Prop :=
  ∀ symbol, symbol ∈ word → Bounded program symbol

theorem wordBounded_append
    {program : Program} {left right : List Symbol}
    (leftBounded : WordBounded program left)
    (rightBounded : WordBounded program right) :
    WordBounded program (left ++ right) := by
  intro symbol membership
  rcases List.mem_append.mp membership with inLeft | inRight
  · exact leftBounded symbol inLeft
  · exact rightBounded symbol inRight

theorem wordBounded_nil (program : Program) :
    WordBounded program [] := by
  intro symbol membership
  simp at membership

theorem wordBounded_cons
    {program : Program} {first : Symbol} {rest : List Symbol}
    (firstBounded : Bounded program first)
    (restBounded : WordBounded program rest) :
    WordBounded program (first :: rest) := by
  intro symbol membership
  rcases List.mem_cons.mp membership with rfl | inRest
  · exact firstBounded
  · exact restBounded symbol inRest

theorem wordBounded_pair
    {program : Program} {first second : Symbol}
    (firstBounded : Bounded program first)
    (secondBounded : Bounded program second) :
    WordBounded program [first, second] :=
  wordBounded_cons firstBounded
    (wordBounded_cons secondBounded (wordBounded_nil program))

theorem wordBounded_replicate
    {program : Program} {count : Nat} {symbol : Symbol}
    (bounded : Bounded program symbol) :
    WordBounded program (List.replicate count symbol) := by
  intro member membership
  rcases List.mem_replicate.mp membership with ⟨_, rfl⟩
  exact bounded

theorem instructionAt_eq_halt_of_length_le :
    ∀ (program : Program) (control : Nat),
      program.length ≤ control → instructionAt program control = .halt
  | [], _, _ => rfl
  | _ :: _, 0, bound => by simp at bound
  | _ :: rest, control + 1, bound => by
      apply instructionAt_eq_halt_of_length_le rest control
      simp only [List.length_cons] at bound
      exact Nat.le_of_succ_le_succ bound

theorem index_lt_of_instructionLive
    {program : Program} {control : Nat}
    (live : instructionLive (instructionAt program control) = true) :
    control < program.length := by
  by_cases controlLt : control < program.length
  · exact controlLt
  · have defaultHalt := instructionAt_eq_halt_of_length_le program control
      (Nat.le_of_not_gt controlLt)
    simp [defaultHalt, instructionLive] at live

theorem header_wordBounded (program : Program) (control : Nat) :
    WordBounded program (header program control) := by
  cases instructionEq : instructionAt program control with
  | halt =>
      simp only [header, instructionEq]
      exact wordBounded_pair (by trivial) (by trivial)
  | increment register next =>
      have controlLt := index_lt_of_instructionLive
        (program := program) (control := control)
        (by simp [instructionEq, instructionLive])
      simp only [header, instructionEq]
      apply wordBounded_pair <;>
        simpa only [Bounded] using! control_bounded controlLt
  | decrementJump register positiveNext zeroNext =>
      have controlLt := index_lt_of_instructionLive
        (program := program) (control := control)
        (by simp [instructionEq, instructionLive])
      simp only [header, instructionEq]
      apply wordBounded_pair <;>
        simpa only [Bounded] using! control_bounded controlLt

theorem laneOutput_wordBounded (program : Program) (control : Nat)
    (register : Register) (positive : Bool) :
    WordBounded program (laneOutput program control register positive) := by
  unfold laneOutput
  let next := branchNext (instructionAt program control) positive
  cases nextInstruction : instructionAt program next with
  | halt =>
      intro symbol membership
      have multZero :
          laneMultiplicity program control register positive = 0 := by
        simp [laneMultiplicity, next, nextInstruction, instructionLive]
      rw [multZero] at membership
      simp at membership
  | increment nextRegister following =>
      have nextLt := index_lt_of_instructionLive
        (program := program) (control := next)
        (by simp [nextInstruction, instructionLive])
      intro symbol membership
      change symbol ∈ List.replicate _ (dataSymbol next register) at membership
      rcases List.mem_replicate.mp membership with ⟨_, rfl⟩
      exact payload_bounded register nextLt
  | decrementJump nextRegister positiveNext zeroNext =>
      have nextLt := index_lt_of_instructionLive
        (program := program) (control := next)
        (by simp [nextInstruction, instructionLive])
      intro symbol membership
      change symbol ∈ List.replicate _ (dataSymbol next register) at membership
      rcases List.mem_replicate.mp membership with ⟨_, rfl⟩
      exact payload_bounded register nextLt

theorem production_wordBounded
    {program : Program} {symbol : Symbol}
    (bounded : Bounded program symbol) :
    WordBounded program (production program symbol) := by
  cases symbol with
  | head control =>
      apply wordBounded_pair <;>
        change control < (enumerationProgram program).length <;> exact bounded
  | filler control | second control | secondPositive control
  | secondZero control | sacrificial | sink =>
      apply wordBounded_pair <;> trivial
  | first code =>
      apply wordBounded_pair <;>
        change code < (enumerationProgram program).length <;> exact bounded
  | selectPositive control =>
      exact header_wordBounded program _
  | selectZero control =>
      exact wordBounded_cons (by trivial) (header_wordBounded program _)
  | firstPositive code =>
      exact laneOutput_wordBounded program (payloadControl code)
        (payloadRegister code) true
  | firstZero code =>
      exact laneOutput_wordBounded program (payloadControl code)
        (payloadRegister code) false
  | halt => exact wordBounded_nil program

theorem tagStep_wordBounded
    {program : Program} {word : List Symbol}
    (bounded : WordBounded program word) :
    WordBounded program (tagStep (production program) word) := by
  cases word with
  | nil => exact bounded
  | cons first rest =>
      cases rest with
      | nil => exact bounded
      | cons second rest =>
          apply wordBounded_append
          · intro symbol membership
            exact bounded symbol
              (List.Mem.tail first (List.Mem.tail second membership))
          · exact production_wordBounded
              (bounded first (List.Mem.head _))

theorem tagIterate_wordBounded
    {program : Program} {word : List Symbol}
    (bounded : WordBounded program word) :
    ∀ fuel, WordBounded program (tagIterate (production program) fuel word)
  | 0 => bounded
  | fuel + 1 => tagStep_wordBounded (tagIterate_wordBounded bounded fuel)

theorem dataBlock_wordBounded (program : Program) (control : Nat)
    (register : Register) (value : Nat) :
    WordBounded program (dataBlock program control register value) := by
  unfold dataBlock
  cases instructionEq : instructionAt program control with
  | halt =>
      simp only [instructionEq, instructionLive, Bool.false_eq, if_false]
      exact wordBounded_nil program
  | increment tested next =>
      have controlLt := index_lt_of_instructionLive
        (program := program) (control := control)
        (by simp [instructionEq, instructionLive])
      simp only [instructionEq, instructionLive, Bool.true_eq, if_true]
      exact wordBounded_replicate (payload_bounded register controlLt)
  | decrementJump tested positiveNext zeroNext =>
      have controlLt := index_lt_of_instructionLive
        (program := program) (control := control)
        (by simp [instructionEq, instructionLive])
      simp only [instructionEq, instructionLive, Bool.true_eq, if_true]
      exact wordBounded_replicate (payload_bounded register controlLt)

theorem canonical_wordBounded (program : Program)
    (control left right scratch : Nat) :
    WordBounded program (canonical program control left right scratch) := by
  unfold canonical
  exact wordBounded_append
    (wordBounded_append
      (wordBounded_append (header_wordBounded program control)
        (dataBlock_wordBounded program control .left left))
      (dataBlock_wordBounded program control .right right))
    (dataBlock_wordBounded program control .scratch scratch)

theorem encodeState_wordBounded (program : Program) (state : State) :
    WordBounded program (encodeState program state) := by
  rcases state with ⟨control, left, right, scratch, status⟩
  cases status with
  | halted => exact wordBounded_pair (by trivial) (by trivial)
  | running => exact canonical_wordBounded program control left right scratch

/-! ### Generated ordinary table -/

def numericRhs (program : Program) (symbol : Symbol) : List Nat :=
  (production program symbol).map (encodeSymbol program)

def ordinaryProgram (program : Program) : TagProgram where
  productions := (List.range (ordinaryCount program)).map fun label =>
    numericRhs program (decodeSymbol program label)

@[simp] theorem ordinaryProgram_symbolCount (program : Program) :
    RogozhinTagInput.symbolCount (ordinaryProgram program) =
      ordinaryCount program := by
  simp [RogozhinTagInput.symbolCount, ordinaryProgram]

@[simp] theorem ordinaryProgram_haltLabel (program : Program) :
    RogozhinTagInput.haltLabel (ordinaryProgram program) =
      ordinaryCount program := by
  simp [RogozhinTagInput.haltLabel]

theorem productionAt_of_lt (program : Program) (label : Nat)
    (labelLt : label < ordinaryCount program) :
    RogozhinTagInput.productionAt (ordinaryProgram program) label =
      numericRhs program (decodeSymbol program label) := by
  simp [RogozhinTagInput.productionAt, ordinaryProgram, labelLt]

theorem productionAt_encode
    {program : Program} {symbol : Symbol}
    (bounded : Bounded program symbol) (notHalt : symbol ≠ .halt) :
    RogozhinTagInput.productionAt (ordinaryProgram program)
        (encodeSymbol program symbol) = numericRhs program symbol := by
  rw [productionAt_of_lt program (encodeSymbol program symbol)
    (encodeSymbol_lt_count_of_ne_halt bounded notHalt),
    decode_encode bounded notHalt]

def encodeWord (program : Program) (word : List Symbol) : List Nat :=
  word.map (encodeSymbol program)

theorem encodeWord_labelsValid
    {program : Program} {word : List Symbol}
    (bounded : WordBounded program word) :
    RogozhinTagInput.LabelsValid (ordinaryProgram program)
      (encodeWord program word) := by
  have go : ∀ source, WordBounded program source →
      ∀ label, label ∈ encodeWord program source →
        label ≤ RogozhinTagInput.haltLabel (ordinaryProgram program) := by
    intro source
    induction source with
    | nil =>
        intro _ label membership
        exact False.elim (by simpa [encodeWord] using membership)
    | cons first rest ih =>
        intro sourceBounded label membership
        change label ∈ encodeSymbol program first ::
          encodeWord program rest at membership
        rcases List.mem_cons.mp membership with firstEq | inRest
        · subst label
          rw [ordinaryProgram_haltLabel]
          exact encodeSymbol_le_count
            (sourceBounded first (List.Mem.head _))
        · apply ih
            (fun symbol inTail =>
              sourceBounded symbol (List.Mem.tail first inTail))
            label inRest
  exact go word bounded

theorem numericRhs_labelsValid
    {program : Program} {symbol : Symbol}
    (bounded : Bounded program symbol) :
    RogozhinTagInput.LabelsValid (ordinaryProgram program)
      (numericRhs program symbol) := by
  exact encodeWord_labelsValid (production_wordBounded bounded)

theorem ordinaryProgram_productionLabelsValid (program : Program) :
    ∀ label, label < RogozhinTagInput.symbolCount (ordinaryProgram program) →
      RogozhinTagInput.LabelsValid (ordinaryProgram program)
        (RogozhinTagInput.productionAt (ordinaryProgram program) label) := by
  intro label labelLt
  rw [ordinaryProgram_symbolCount] at labelLt
  rw [productionAt_of_lt program label labelLt]
  exact numericRhs_labelsValid (decodeSymbol_bounded program label)

theorem encodeSymbol_eq_haltLabel_iff
    {program : Program} {symbol : Symbol}
    (bounded : Bounded program symbol) :
    encodeSymbol program symbol =
        RogozhinTagInput.haltLabel (ordinaryProgram program) ↔
      symbol = .halt := by
  rw [ordinaryProgram_haltLabel]
  constructor
  · intro equal
    by_cases halt : symbol = .halt
    · exact halt
    · exact False.elim
        ((Nat.ne_of_lt (encodeSymbol_lt_count_of_ne_halt bounded halt)) equal)
  · rintro rfl
    simp [CounterMachineTag.Numeric.encodeSymbol,
      CounterMachineTag.Numeric.ordinaryCount]

theorem encodeWord_head_halt_iff
    {program : Program} {word : List Symbol}
    (bounded : WordBounded program word) :
    (encodeWord program word).head? =
        some (RogozhinTagInput.haltLabel (ordinaryProgram program)) ↔
      word.head? = some .halt := by
  cases word with
  | nil => simp [encodeWord]
  | cons first rest =>
      simp only [encodeWord, List.map, List.head?_cons, Option.some.injEq]
      exact encodeSymbol_eq_haltLabel_iff
        (bounded first (List.Mem.head rest))

/-! ### Typed/numerical step and halt agreement -/

theorem absorbingStep_encodeWord
    {program : Program} {word : List Symbol}
    (bounded : WordBounded program word)
    (notHalt : word.head? ≠ some .halt) :
    RogozhinTagInput.absorbingStep (ordinaryProgram program)
        (encodeWord program word) =
      encodeWord program (tagStep (production program) word) := by
  cases word with
  | nil => rfl
  | cons first rest =>
      cases rest with
      | nil => rfl
      | cons second rest =>
          have firstBounded : Bounded program first :=
            bounded first (List.Mem.head _)
          have firstNe : first ≠ .halt := by
            intro firstEq
            apply notHalt
            subst first
            rfl
          have encodedNe : encodeSymbol program first ≠
              RogozhinTagInput.haltLabel (ordinaryProgram program) := by
            intro equal
            exact firstNe ((encodeSymbol_eq_haltLabel_iff firstBounded).1 equal)
          have encodedNeCount : encodeSymbol program first ≠
              ordinaryCount program := by
            simpa using encodedNe
          change RogozhinTagInput.absorbingStep (ordinaryProgram program)
              (encodeSymbol program first :: encodeSymbol program second ::
                encodeWord program rest) =
            encodeWord program (rest ++ production program first)
          simp [RogozhinTagInput.absorbingStep,
            RogozhinTagInput.step?, encodedNe, encodedNeCount]
          rw [productionAt_encode firstBounded firstNe]
          simp [encodeWord, tagStep, numericRhs, List.map_append]

theorem iterate_encodeWord_until_halt
    {program : Program} {word : List Symbol}
    (bounded : WordBounded program word) :
    ∀ fuel,
      (∀ earlier, earlier < fuel →
        (tagIterate (production program) earlier word).head? ≠ some .halt) →
      RogozhinTagInput.iterate (ordinaryProgram program) fuel
          (encodeWord program word) =
        encodeWord program (tagIterate (production program) fuel word)
  | 0, _ => rfl
  | fuel + 1, earlierSafe => by
      rw [RogozhinTagInput.iterate_succ]
      rw [iterate_encodeWord_until_halt bounded fuel (by
        intro earlier earlierLt
        exact earlierSafe earlier (Nat.lt.step earlierLt))]
      rw [absorbingStep_encodeWord
        (tagIterate_wordBounded bounded fuel)
        (earlierSafe fuel (Nat.lt_succ_self fuel))]
      rfl

theorem typedHalt_at_implies_numericHalt
    (program : Program) :
    ∀ fuel word,
      WordBounded program word →
      (tagIterate (production program) fuel word).head? = some .halt →
      ∃ numericFuel, numericFuel ≤ fuel ∧
        (RogozhinTagInput.iterate (ordinaryProgram program) numericFuel
          (encodeWord program word)).head? =
            some (RogozhinTagInput.haltLabel (ordinaryProgram program))
  | 0, word, bounded, haltHead => by
      refine ⟨0, Nat.le_refl 0, ?_⟩
      exact (encodeWord_head_halt_iff bounded).2 haltHead
  | fuel + 1, word, bounded, haltHead => by
      by_cases initialHalt : word.head? = some .halt
      · refine ⟨0, Nat.zero_le _, ?_⟩
        exact (encodeWord_head_halt_iff bounded).2 initialHalt
      · rw [tagIterate_succ_front] at haltHead
        obtain ⟨numericFuel, numericFuelLe, numericHead⟩ :=
          typedHalt_at_implies_numericHalt program fuel
            (tagStep (production program) word)
            (tagStep_wordBounded bounded) haltHead
        refine ⟨numericFuel + 1, Nat.succ_le_succ numericFuelLe, ?_⟩
        have firstStep := absorbingStep_encodeWord bounded initialHalt
        calc
          (RogozhinTagInput.iterate (ordinaryProgram program)
              (numericFuel + 1) (encodeWord program word)).head? =
              (RogozhinTagInput.iterate (ordinaryProgram program)
                numericFuel
                (RogozhinTagInput.iterate (ordinaryProgram program) 1
                  (encodeWord program word))).head? := by
            simpa [Nat.one_add] using congrArg List.head?
              (DeletionTwoT2Normalizer.tagIterate_add
                (ordinaryProgram program) (encodeWord program word)
                1 numericFuel)
          _ = (RogozhinTagInput.iterate (ordinaryProgram program)
                numericFuel
                (encodeWord program
                  (tagStep (production program) word))).head? := by
            exact congrArg
              (fun nextWord =>
                (RogozhinTagInput.iterate (ordinaryProgram program)
                  numericFuel nextWord).head?) firstStep
          _ = some (RogozhinTagInput.haltLabel
                (ordinaryProgram program)) := numericHead

theorem numericHalt_at_implies_typedHalt
    (program : Program) :
    ∀ fuel word,
      WordBounded program word →
      (RogozhinTagInput.iterate (ordinaryProgram program) fuel
        (encodeWord program word)).head? =
          some (RogozhinTagInput.haltLabel (ordinaryProgram program)) →
      ∃ typedFuel, typedFuel ≤ fuel ∧
        (tagIterate (production program) typedFuel word).head? = some .halt
  | 0, word, bounded, haltHead => by
      refine ⟨0, Nat.le_refl 0, ?_⟩
      exact (encodeWord_head_halt_iff bounded).1 haltHead
  | fuel + 1, word, bounded, haltHead => by
      by_cases initialHalt : word.head? = some .halt
      · exact ⟨0, Nat.zero_le _, initialHalt⟩
      · have firstStep := absorbingStep_encodeWord bounded initialHalt
        have numericNext :
            (RogozhinTagInput.iterate (ordinaryProgram program) fuel
              (encodeWord program
                (tagStep (production program) word))).head? =
              some (RogozhinTagInput.haltLabel
                (ordinaryProgram program)) := by
          calc
            (RogozhinTagInput.iterate (ordinaryProgram program) fuel
                (encodeWord program
                  (tagStep (production program) word))).head? =
                (RogozhinTagInput.iterate (ordinaryProgram program) fuel
                  (RogozhinTagInput.iterate (ordinaryProgram program) 1
                    (encodeWord program word))).head? := by
              exact congrArg
                (fun nextWord =>
                  (RogozhinTagInput.iterate (ordinaryProgram program)
                    fuel nextWord).head?) firstStep.symm
            _ = (RogozhinTagInput.iterate (ordinaryProgram program)
                  (fuel + 1) (encodeWord program word)).head? := by
              symm
              simpa [Nat.one_add] using congrArg List.head?
                (DeletionTwoT2Normalizer.tagIterate_add
                  (ordinaryProgram program) (encodeWord program word) 1 fuel)
            _ = some (RogozhinTagInput.haltLabel
                  (ordinaryProgram program)) := haltHead
        obtain ⟨typedFuel, typedFuelLe, typedHead⟩ :=
          numericHalt_at_implies_typedHalt program fuel
            (tagStep (production program) word)
            (tagStep_wordBounded bounded) numericNext
        refine ⟨typedFuel + 1, Nat.succ_le_succ typedFuelLe, ?_⟩
        rw [tagIterate_succ_front]
        exact typedHead

theorem typedEventuallyHalts_iff_numericHaltHead_kernel
    (program : Program) (word : List Symbol)
    (bounded : WordBounded program word) :
    (∃ fuel,
        (tagIterate (production program) fuel word).head? = some .halt) ↔
      ∃ fuel,
        (RogozhinTagInput.iterate (ordinaryProgram program) fuel
          (encodeWord program word)).head? =
            some (RogozhinTagInput.haltLabel (ordinaryProgram program)) := by
  constructor
  · rintro ⟨fuel, haltHead⟩
    obtain ⟨numericFuel, _, numericHead⟩ :=
      typedHalt_at_implies_numericHalt program fuel word bounded haltHead
    exact ⟨numericFuel, numericHead⟩
  · rintro ⟨fuel, haltHead⟩
    obtain ⟨typedFuel, _, typedHead⟩ :=
      numericHalt_at_implies_typedHalt program fuel word bounded haltHead
    exact ⟨typedFuel, typedHead⟩

theorem typedEventuallyHalts_iff_numericHaltHead
    (program : Program) (word : List Symbol)
    (bounded : WordBounded program word) :
    (∃ fuel,
        (tagIterate (production program) fuel word).head? = some .halt) ↔
      ∃ fuel,
        (RogozhinTagInput.iterate (ordinaryProgram program) fuel
          (encodeWord program word)).head? =
            some (RogozhinTagInput.haltLabel (ordinaryProgram program)) :=
  typedEventuallyHalts_iff_numericHaltHead_kernel program word bounded

/-! ### Boundary preservation -/

theorem live_macro_step
    (program : Program) (control left right scratch : Nat)
    (instruction : Instruction) (register : Register)
    (instructionEq : instructionAt program control = instruction)
    (liveEq : instructionLive instruction = true)
    (testedEq : instructionTested? instruction = some register) :
    tagIterate (production program) (macroFuel register left right scratch)
        (canonical program control left right scratch) =
      encodeState program (ThreeCounter.step program
        ⟨control, left, right, scratch, .running⟩) := by
  cases instruction with
  | halt => simp [instructionLive] at liveEq
  | increment tested next =>
      have registerEq : tested = register := by
        simpa [instructionTested?] using testedEq
      subst register
      exact increment_macro_boundary program control left right scratch next
        tested instructionEq
  | decrementJump tested positiveNext zeroNext =>
      have registerEq : tested = register := by
        simpa [instructionTested?] using testedEq
      subst register
      exact decrement_macro_boundary program control left right scratch
        positiveNext zeroNext tested instructionEq

theorem live_macro_lengthTwo
    (program : Program) (control left right scratch fuel : Nat)
    (instruction : Instruction) (register : Register)
    (instructionEq : instructionAt program control = instruction)
    (liveEq : instructionLive instruction = true)
    (testedEq : instructionTested? instruction = some register)
    (fuelLe : fuel ≤ macroFuel register left right scratch) :
    2 ≤ (tagIterate (production program) fuel
      (canonical program control left right scratch)).length := by
  let current := tagIterate (production program) fuel
    (canonical program control left right scratch)
  by_cases currentLong : 2 ≤ current.length
  · exact currentLong
  · have currentShort : current.length < 2 := Nat.lt_of_not_ge currentLong
    have futureFixed :=
      CounterMachineTag.Numeric.tagIterate_eq_self_of_length_lt_two
        (production program) currentShort
        (macroFuel register left right scratch - fuel)
    have durationEq : macroFuel register left right scratch =
        (macroFuel register left right scratch - fuel) + fuel :=
      (Nat.sub_add_cancel fuelLe).symm
    have fullEq : tagIterate (production program)
          (macroFuel register left right scratch)
          (canonical program control left right scratch) = current := by
      rw [durationEq, tagIterate_add]
      simpa [current] using futureFixed
    have currentEqNext : current =
        encodeState program (ThreeCounter.step program
          ⟨control, left, right, scratch, .running⟩) :=
      fullEq.symm.trans (live_macro_step program control left right scratch
        instruction register instructionEq liveEq testedEq)
    change 2 ≤ current.length
    rw [currentEqNext]
    exact two_le_encodeState_length _ _

theorem numeric_live_macro_step
    (program : Program) (control left right scratch : Nat)
    (instruction : Instruction) (register : Register)
    (instructionEq : instructionAt program control = instruction)
    (liveEq : instructionLive instruction = true)
    (testedEq : instructionTested? instruction = some register) :
    RogozhinTagInput.iterate (ordinaryProgram program)
        (macroFuel register left right scratch)
        (encodeWord program
          (canonical program control left right scratch)) =
      encodeWord program (encodeState program (ThreeCounter.step program
        ⟨control, left, right, scratch, .running⟩)) := by
  rw [iterate_encodeWord_until_halt
    (canonical_wordBounded program control left right scratch)
    (macroFuel register left right scratch) (by
      intro earlier earlierLt
      exact live_macro_prefix_ne_halt program control left right scratch
        earlier instruction register instructionEq liveEq testedEq earlierLt)]
  rw [live_macro_step program control left right scratch instruction register
    instructionEq liveEq testedEq]

theorem encoded_halt_pair_fixed (program : Program) :
    RogozhinTagInput.absorbingStep (ordinaryProgram program)
      (encodeWord program [.halt, .sink]) =
        encodeWord program [.halt, .sink] := by
  simp [encodeWord, RogozhinTagInput.absorbingStep,
    RogozhinTagInput.step?, CounterMachineTag.Numeric.encodeSymbol,
    CounterMachineTag.Numeric.ordinaryCount]

theorem encoded_sink_pair_fixed (program : Program) :
    RogozhinTagInput.absorbingStep (ordinaryProgram program)
      (encodeWord program [.sink, .sink]) =
        encodeWord program [.sink, .sink] := by
  have stepEncoded := absorbingStep_encodeWord
    (program := program) (word := [.sink, .sink])
    (wordBounded_pair (by trivial) (by trivial)) (by simp)
  rw [tagStep_sink program] at stepEncoded
  exact stepEncoded

theorem encodedPair_boundary
    (program : Program) (first second : Symbol)
    (firstBounded : Bounded program first)
    (secondBounded : Bounded program second) :
    DeletionTwoT2Normalizer.Boundary (ordinaryProgram program)
      (encodeWord program [first, second]) := by
  refine ⟨encodeWord_labelsValid
      (wordBounded_pair firstBounded secondBounded), ?_⟩
  exact Nat.le_refl 2

theorem ordinaryTrajectory_boundary (program : Program) :
    ∀ fuel state,
      DeletionTwoT2Normalizer.Boundary (ordinaryProgram program)
        (RogozhinTagInput.iterate (ordinaryProgram program) fuel
          (encodeWord program (encodeState program state))) := by
  intro fuel
  induction fuel using Nat.strongRecOn with
  | ind fuel ih =>
      intro state
      rcases state with ⟨control, left, right, scratch, status⟩
      cases status with
      | halted =>
          have fixed :=
            CounterMachineTag.Numeric.iterate_eq_self_of_absorbingStep_eq
              (encoded_halt_pair_fixed program) fuel
          rw [show encodeState program
              ⟨control, left, right, scratch, .halted⟩ =
                [.halt, .sink] from rfl, fixed]
          exact encodedPair_boundary program .halt .sink (by trivial)
            (by trivial)
      | running =>
          cases instructionEq : instructionAt program control with
          | halt =>
              have canonicalEq :
                  canonical program control left right scratch =
                    [.halt, .sink] := by
                simp [canonical, header, dataBlock, instructionEq,
                  instructionLive]
              rw [show encodeState program
                  ⟨control, left, right, scratch, .running⟩ =
                    canonical program control left right scratch from rfl,
                canonicalEq,
                CounterMachineTag.Numeric.iterate_eq_self_of_absorbingStep_eq
                  (encoded_halt_pair_fixed program) fuel]
              exact encodedPair_boundary program .halt .sink (by trivial)
                (by trivial)
          | increment register next =>
              let duration := macroFuel register left right scratch
              by_cases fuelLt : fuel < duration
              · have agreement := iterate_encodeWord_until_halt
                    (canonical_wordBounded program control left right scratch)
                    fuel (by
                      intro earlier earlierLt
                      exact live_macro_prefix_ne_halt program control left right
                        scratch earlier (.increment register next) register
                        instructionEq rfl rfl (Nat.lt_trans earlierLt fuelLt))
                rw [show encodeState program
                    ⟨control, left, right, scratch, .running⟩ =
                      canonical program control left right scratch from rfl,
                  agreement]
                exact ⟨encodeWord_labelsValid
                    (tagIterate_wordBounded
                      (canonical_wordBounded program control left right scratch)
                      fuel),
                  by
                    simpa [encodeWord] using
                      (live_macro_lengthTwo program control left right scratch
                        fuel (.increment register next) register instructionEq
                        rfl rfl (Nat.le_of_lt fuelLt))⟩
              · have durationLe : duration ≤ fuel := Nat.le_of_not_gt fuelLt
                have durationPositive : 0 < duration :=
                  macroFuel_positive register left right scratch
                have remainderLt : fuel - duration < fuel :=
                  Nat.sub_lt
                    (Nat.lt_of_lt_of_le durationPositive durationLe)
                    durationPositive
                have fuelEq : fuel = duration + (fuel - duration) := by
                  rw [Nat.add_comm]
                  exact (Nat.sub_add_cancel durationLe).symm
                rw [show encodeState program
                    ⟨control, left, right, scratch, .running⟩ =
                      canonical program control left right scratch from rfl,
                  fuelEq, DeletionTwoT2Normalizer.tagIterate_add]
                rw [show duration = macroFuel register left right scratch
                  from rfl]
                rw [numeric_live_macro_step program control left right scratch
                  (.increment register next) register instructionEq rfl rfl]
                exact ih (fuel - duration) remainderLt _
          | decrementJump register positiveNext zeroNext =>
              let duration := macroFuel register left right scratch
              by_cases fuelLt : fuel < duration
              · have agreement := iterate_encodeWord_until_halt
                    (canonical_wordBounded program control left right scratch)
                    fuel (by
                      intro earlier earlierLt
                      exact live_macro_prefix_ne_halt program control left right
                        scratch earlier
                        (.decrementJump register positiveNext zeroNext) register
                        instructionEq rfl rfl (Nat.lt_trans earlierLt fuelLt))
                rw [show encodeState program
                    ⟨control, left, right, scratch, .running⟩ =
                      canonical program control left right scratch from rfl,
                  agreement]
                exact ⟨encodeWord_labelsValid
                    (tagIterate_wordBounded
                      (canonical_wordBounded program control left right scratch)
                      fuel),
                  by
                    simpa [encodeWord] using
                      (live_macro_lengthTwo program control left right scratch
                        fuel (.decrementJump register positiveNext zeroNext)
                        register instructionEq rfl rfl
                        (Nat.le_of_lt fuelLt))⟩
              · have durationLe : duration ≤ fuel := Nat.le_of_not_gt fuelLt
                have durationPositive : 0 < duration :=
                  macroFuel_positive register left right scratch
                have remainderLt : fuel - duration < fuel :=
                  Nat.sub_lt
                    (Nat.lt_of_lt_of_le durationPositive durationLe)
                    durationPositive
                have fuelEq : fuel = duration + (fuel - duration) := by
                  rw [Nat.add_comm]
                  exact (Nat.sub_add_cancel durationLe).symm
                rw [show encodeState program
                    ⟨control, left, right, scratch, .running⟩ =
                      canonical program control left right scratch from rfl]
                rw [fuelEq, DeletionTwoT2Normalizer.tagIterate_add]
                rw [show duration = macroFuel register left right scratch
                  from rfl]
                rw [numeric_live_macro_step program control left right scratch
                  (.decrementJump register positiveNext zeroNext) register
                  instructionEq rfl rfl]
                exact ih (fuel - duration) remainderLt _

/-! ### Public ordinary and restricted-T2 jobs -/

def ordinaryInitialWord (program : Program) (initial : State) : List Nat :=
  encodeWord program (encodeState program initial)

def ordinaryJob (program : Program) (initial : State) : RogozhinTagInput.Job :=
  ⟨ordinaryProgram program, ordinaryInitialWord program initial⟩

theorem ordinaryInitialBoundary (program : Program) (initial : State) :
    DeletionTwoT2Normalizer.Boundary (ordinaryProgram program)
      (ordinaryInitialWord program initial) := by
  exact ordinaryTrajectory_boundary program 0 initial

theorem ordinaryTrajectory (program : Program) (initial : State) :
    ∀ horizon,
      DeletionTwoT2Normalizer.Boundary (ordinaryProgram program)
        (RogozhinTagInput.iterate (ordinaryProgram program) horizon
          (ordinaryInitialWord program initial)) := by
  intro horizon
  exact ordinaryTrajectory_boundary program horizon initial

theorem ordinaryEventuallyHalts_iff_haltHead
    (program : Program) (initial : State) :
    RogozhinTagInput.EventuallyHalts (ordinaryJob program initial) ↔
      ∃ horizon,
        (RogozhinTagInput.iterate (ordinaryProgram program) horizon
          (ordinaryInitialWord program initial)).head? =
            some (RogozhinTagInput.haltLabel (ordinaryProgram program)) := by
  unfold RogozhinTagInput.EventuallyHalts ordinaryJob
  constructor
  · rintro ⟨horizon, halted⟩
    exact ⟨horizon,
      ((ordinaryTrajectory program initial horizon).halted_iff_head).1 halted⟩
  · rintro ⟨horizon, haltHead⟩
    exact ⟨horizon,
      ((ordinaryTrajectory program initial horizon).halted_iff_head).2 haltHead⟩

theorem halts_iff_ordinaryEventuallyHalts
    (program : Program) (initial : State) :
    ThreeCounter.Halts program initial ↔
      RogozhinTagInput.EventuallyHalts (ordinaryJob program initial) := by
  rw [ordinaryEventuallyHalts_iff_haltHead]
  exact (halts_iff_typedEventuallyHalts program initial).trans
    (typedEventuallyHalts_iff_numericHaltHead program
      (encodeState program initial) (encodeState_wordBounded program initial))

/-- Premise-free normalization of an arbitrary initialized three-counter
machine into Rogozhin's restricted deletion-two input class. -/
def compileT2 (program : Program) (initial : State) : RogozhinTagInput.Job :=
  ⟨DeletionTwoT2Normalizer.normalizeProgram (ordinaryProgram program),
    DeletionTwoT2Normalizer.normalizeWord (ordinaryProgram program)
      (ordinaryInitialWord program initial)⟩

theorem compileT2_isT2 (program : Program) (initial : State) :
    RogozhinTagInput.IsT2 (compileT2 program initial).program := by
  exact DeletionTwoT2Normalizer.normalize_isT2 (ordinaryProgram program)
    (ordinaryProgram_productionLabelsValid program)

theorem compileT2_wellFormed (program : Program) (initial : State) :
    RogozhinTagInput.WellFormed (compileT2 program initial).program
      (compileT2 program initial).word := by
  exact DeletionTwoT2Normalizer.normalize_wellFormed
    (ordinaryProgram program) (ordinaryProgram_productionLabelsValid program)
    (ordinaryInitialBoundary program initial)

theorem halts_iff_compileT2_eventuallyHalts
    (program : Program) (initial : State) :
    ThreeCounter.Halts program initial ↔
      RogozhinTagInput.EventuallyHalts (compileT2 program initial) := by
  have normalizedIff := DeletionTwoT2Normalizer.eventuallyHalts_iff
    (ordinaryProgram program) (ordinaryInitialWord program initial)
    (ordinaryProgram_productionLabelsValid program)
    (ordinaryInitialBoundary program initial)
    (ordinaryTrajectory program initial)
  exact (halts_iff_ordinaryEventuallyHalts program initial).trans
    normalizedIff.symm

/-- Premise-free compiler on the public bundled three-counter job type. -/
def compileJob (job : ThreeCounter.Job) : RogozhinTagInput.Job :=
  compileT2 job.program job.initial

theorem compileJob_isT2 (job : ThreeCounter.Job) :
    RogozhinTagInput.IsT2 (compileJob job).program :=
  compileT2_isT2 job.program job.initial

theorem compileJob_wellFormed (job : ThreeCounter.Job) :
    RogozhinTagInput.WellFormed (compileJob job).program
      (compileJob job).word :=
  compileT2_wellFormed job.program job.initial

theorem universalHalts_iff_compileJob (job : ThreeCounter.Job) :
    ThreeCounter.UniversalHalts job ↔
      RogozhinTagInput.EventuallyHalts (compileJob job) := by
  exact halts_iff_compileT2_eventuallyHalts job.program job.initial

abbrev compileUniversalInput := compileJob

theorem universalHalts_iff_compileUniversalInput (job : ThreeCounter.Job) :
    ThreeCounter.UniversalHalts job ↔
      RogozhinTagInput.EventuallyHalts (compileUniversalInput job) :=
  universalHalts_iff_compileJob job

end Numeric

end ThreeCounterTag

end PureSFormal.Computation
