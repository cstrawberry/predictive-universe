import PureSFormal.Computation.CounterMachine
import PureSFormal.Computation.RogozhinTagInput
import PureSFormal.Computation.DeletionTwoT2Normalizer

set_option backward.isDefEq.respectTransparency false

/-!
# A two-sweep deletion-two compiler for two-counter programs

This module gives the source-side tag construction independently of the
Rogozhin normalizer.  Register value `n` is represented by a radix-two run of
length `2^n`.  At a live instruction the tested register has scale one and
the other register has scale two.  Consequently the complete old generation
has odd length exactly on the zero branch.

The first sweep emits paired positive/zero alternatives.  On the odd branch
the final old cell consumes the leading positive selector, shifting the next
sweep onto all zero alternatives.  The zero selector emits one sacrificial
cell, which the final odd lane cell consumes.  The resulting word is exactly
the canonical encoding of the next counter state.
-/

namespace PureSFormal.Computation

namespace CounterMachineTag

open CounterMachine

/-! ## Typed deletion-two dynamics -/

/-- Finite-construction symbols before their numerical enumeration. -/
inductive Symbol where
  | head (counter : Nat)
  | filler (counter : Nat)
  | first (counter : Nat)
  | second (counter : Nat)
  | selectPositive (counter : Nat)
  | selectZero (counter : Nat)
  | firstPositive (counter : Nat)
  | firstZero (counter : Nat)
  | secondPositive (counter : Nat)
  | secondZero (counter : Nat)
  | sacrificial
  | sink
  | halt
  deriving DecidableEq, Repr

/-- One total deletion-two transition; short words are absorbing. -/
def tagStep (production : Symbol → List Symbol) : List Symbol → List Symbol
  | selected :: _ignored :: rest => rest ++ production selected
  | word => word

/-- Exact bounded iteration of the typed tag transition. -/
def tagIterate (production : Symbol → List Symbol) :
    Nat → List Symbol → List Symbol
  | 0, word => word
  | fuel + 1, word => tagStep production (tagIterate production fuel word)

@[simp]
theorem tagIterate_zero (production : Symbol → List Symbol)
    (word : List Symbol) :
    tagIterate production 0 word = word := rfl

@[simp]
theorem tagIterate_succ (production : Symbol → List Symbol)
    (fuel : Nat) (word : List Symbol) :
    tagIterate production (fuel + 1) word =
      tagStep production (tagIterate production fuel word) := rfl

theorem tagIterate_add (production : Symbol → List Symbol)
    (left right : Nat) (word : List Symbol) :
    tagIterate production (left + right) word =
      tagIterate production left (tagIterate production right word) := by
  induction left with
  | zero => simp
  | succ left ih =>
      simp only [Nat.succ_add, tagIterate_succ, ih]

/-- Peel the first transition rather than the last one. -/
theorem tagIterate_succ_front (production : Symbol → List Symbol)
    (fuel : Nat) (word : List Symbol) :
    tagIterate production (fuel + 1) word =
      tagIterate production fuel (tagStep production word) := by
  induction fuel with
  | zero => rfl
  | succ fuel ih =>
      rw [tagIterate_succ, ih, tagIterate_succ]

/-! ## Pair sweeps -/

/-- Flatten selected/ignored pairs in their literal queue order. -/
def pairWord : List (Symbol × Symbol) → List Symbol
  | [] => []
  | pair :: rest => pair.1 :: pair.2 :: pairWord rest

@[simp]
theorem pairWord_nil : pairWord [] = [] := rfl

@[simp]
theorem pairWord_cons (selected ignored : Symbol)
    (rest : List (Symbol × Symbol)) :
    pairWord ((selected, ignored) :: rest) =
      selected :: ignored :: pairWord rest := rfl

@[simp]
theorem pairWord_append (left right : List (Symbol × Symbol)) :
    pairWord (left ++ right) = pairWord left ++ pairWord right := by
  induction left with
  | nil => rfl
  | cons pair left ih =>
      cases pair
      simp only [List.cons_append, pairWord_cons, ih]

@[simp]
theorem pairWord_replicate_same (count : Nat) (symbol : Symbol) :
    pairWord (List.replicate count (symbol, symbol)) =
      List.replicate (2 * count) symbol := by
  induction count with
  | zero => rfl
  | succ count ih =>
      simp [List.replicate_succ, ih, Nat.mul_succ]

@[simp]
theorem pairWord_replicate_pair (count : Nat) (selected ignored : Symbol) :
    pairWord (List.replicate count (selected, ignored)) =
      (List.replicate count [selected, ignored]).flatten := by
  induction count with
  | zero => rfl
  | succ count ih => simp [List.replicate_succ, ih]

/-- Outputs selected by a complete pair sweep. -/
def pairOutputs (production : Symbol → List Symbol) :
    List (Symbol × Symbol) → List Symbol
  | [] => []
  | pair :: rest => production pair.1 ++ pairOutputs production rest

@[simp]
theorem pairOutputs_nil (production : Symbol → List Symbol) :
    pairOutputs production [] = [] := rfl

@[simp]
theorem pairOutputs_cons (production : Symbol → List Symbol)
    (selected ignored : Symbol) (rest : List (Symbol × Symbol)) :
    pairOutputs production ((selected, ignored) :: rest) =
      production selected ++ pairOutputs production rest := rfl

@[simp]
theorem pairOutputs_append (production : Symbol → List Symbol)
    (left right : List (Symbol × Symbol)) :
    pairOutputs production (left ++ right) =
      pairOutputs production left ++ pairOutputs production right := by
  induction left with
  | nil => rfl
  | cons pair left ih =>
      cases pair
      simp only [List.cons_append, pairOutputs_cons, ih, List.append_assoc]

/-- Processing a finite old pair generation leaves the tail in front. -/
theorem iterate_pairWord_with_tail
    (production : Symbol → List Symbol)
    (pairs : List (Symbol × Symbol)) (tail : List Symbol) :
    tagIterate production pairs.length (pairWord pairs ++ tail) =
      tail ++ pairOutputs production pairs := by
  induction pairs generalizing tail with
  | nil => simp
  | cons pair pairs ih =>
      cases pair with
      | mk selected ignored =>
          rw [List.length_cons, tagIterate_succ_front]
          change tagIterate production pairs.length
              (pairWord pairs ++ tail ++ production selected) = _
          rw [List.append_assoc, ih]
          simp [pairOutputs, List.append_assoc]

/-- An odd final old cell consumes the first already-emitted output cell. -/
theorem iterate_pairWord_last
    (production : Symbol → List Symbol)
    (pairs : List (Symbol × Symbol)) (last first : Symbol)
    (restOutput : List Symbol)
    (outputsEq : pairOutputs production pairs = first :: restOutput) :
    tagIterate production (pairs.length + 1)
        (pairWord pairs ++ [last]) =
      restOutput ++ production last := by
  rw [tagIterate_succ, iterate_pairWord_with_tail]
  rw [outputsEq]
  rfl

@[simp]
theorem pairOutputs_replicate (production : Symbol → List Symbol)
    (count : Nat) (selected ignored : Symbol) :
    pairOutputs production (List.replicate count (selected, ignored)) =
      (List.replicate count (production selected)).flatten := by
  induction count with
  | zero => rfl
  | succ count ih =>
      simp [List.replicate_succ, ih, pairOutputs]

theorem cons_replicate_eq_append (symbol : Symbol) (count : Nat) :
    symbol :: List.replicate count symbol =
      List.replicate count symbol ++ [symbol] := by
  rw [← List.replicate_succ, List.replicate_succ']

/-- Pair decomposition of a singleton followed by a positive even run. -/
theorem singleton_evenRun (first repeated : Symbol) (count : Nat) :
    first :: List.replicate (2 * (count + 1)) repeated =
      pairWord ((first, repeated) ::
        List.replicate count (repeated, repeated)) ++ [repeated] := by
  induction count with
  | zero => rfl
  | succ count ih =>
      simp only [Nat.mul_succ, List.replicate_succ, pairWord_cons,
        pairWord_replicate_same, List.cons_append, List.append_assoc]
      exact congrArg
        (fun tail => first :: repeated :: repeated :: repeated :: tail)
        (cons_replicate_eq_append repeated (2 * count))


/-! ## The radix-two compiler -/

/-- Unary radix block used for one source register. -/
def radix (value : Nat) : Nat := 2 ^ value

@[simp]
theorem radix_zero : radix 0 = 1 := rfl

@[simp]
theorem radix_succ (value : Nat) :
    radix (value + 1) = 2 * radix value := by
  simp [radix, Nat.pow_succ, Nat.mul_comm]

theorem radix_is_succ (value : Nat) :
    ∃ predecessor, radix value = predecessor + 1 := by
  induction value with
  | zero => exact ⟨0, rfl⟩
  | succ value ih =>
      obtain ⟨predecessor, hradix⟩ := ih
      refine ⟨2 * predecessor + 1, ?_⟩
      rw [radix_succ, hradix]
      simp [Nat.mul_add, Nat.add_assoc]

theorem four_mul (value : Nat) : 4 * value = 2 * (2 * value) := by
  rw [show 4 = 2 * 2 by rfl, Nat.mul_assoc]

theorem eight_mul (value : Nat) :
    8 * value = 2 * (2 * (2 * value)) := by
  rw [show 8 = 2 * 2 * 2 by rfl, Nat.mul_assoc, Nat.mul_assoc]

/-- Whether an instruction has an operational counter branch. -/
def instructionLive : Instruction → Bool
  | .increment _ _ => true
  | .decrementJump _ _ _ => true
  | .accept => false
  | .reject => false

/-- The register inspected by a live instruction. -/
def instructionTested? : Instruction → Option Register
  | .increment register _ => some register
  | .decrementJump register _ _ => some register
  | .accept => none
  | .reject => none

/-- Positive and zero successors; increment has the same successor twice. -/
def branchNext (instruction : Instruction)
    (positive : Bool) : Nat :=
  match instruction with
  | .increment _ next => next
  | .decrementJump _ positiveNext zeroNext =>
      if positive then positiveNext else zeroNext
  | .accept => 0
  | .reject => 0

/-- A live instruction gives scale one to the tested register and two to the other. -/
def scale (instruction : Instruction) (register : Register) : Nat :=
  if instructionTested? instruction = some register then 1 else 2

theorem scale_eq_one_of_tested
    {instruction : Instruction} {register : Register}
    (tested : instructionTested? instruction = some register) :
    scale instruction register = 1 := by
  simp [scale, tested]

theorem scale_eq_two_of_not_tested
    {instruction : Instruction} {register : Register}
    (notTested : instructionTested? instruction ≠ some register) :
    scale instruction register = 2 := by
  simp [scale, notTested]

/-- Canonical source symbol for one register block. -/
def registerSymbol (register : Register) (counter : Nat) : Symbol :=
  match register with
  | .first => .first counter
  | .second => .second counter

/-- Positive-lane alternative for a register cell. -/
def positiveSymbol (register : Register) (counter : Nat) : Symbol :=
  match register with
  | .first => .firstPositive counter
  | .second => .secondPositive counter

/-- Zero-lane alternative for a register cell. -/
def zeroSymbol (register : Register) (counter : Nat) : Symbol :=
  match register with
  | .first => .firstZero counter
  | .second => .secondZero counter

/-- Header for a prospective source label, including accept and rejecting sink. -/
def header (program : Program) (counter : Nat) : List Symbol :=
  match instructionAt program counter with
  | .accept => [.halt, .sink]
  | .reject => [.sink, .sink]
  | .increment _ _ => [.head counter, .filler counter]
  | .decrementJump _ _ _ => [.head counter, .filler counter]

/-- Data blocks disappear when the prospective successor is terminal. -/
def dataBlock (program : Program) (counter : Nat) (register : Register)
    (value : Nat) : List Symbol :=
  let instruction := instructionAt program counter
  if instructionLive instruction then
    List.replicate (scale instruction register * radix value)
      (registerSymbol register counter)
  else []

/-- Canonical tag word for a running source counter/control triple. -/
def canonical (program : Program) (counter firstValue secondValue : Nat) :
    List Symbol :=
  header program counter ++
    dataBlock program counter .first firstValue ++
    dataBlock program counter .second secondValue

/-- Canonical encoding of a complete source state. -/
def encodeState (program : Program) (state : State) : List Symbol :=
  match state.status with
  | .accepted => [.halt, .sink]
  | .rejected => [.sink, .sink]
  | .running => canonical program state.counter state.first state.second

/-- Every canonical header has exactly two cells. -/
@[simp]
theorem header_length (program : Program) (counter : Nat) :
    (header program counter).length = 2 := by
  unfold header
  cases instructionAt program counter <;> rfl

/-- Canonical words never stop merely through shortness. -/
theorem two_le_canonical_length (program : Program)
    (counter firstValue secondValue : Nat) :
    2 ≤ (canonical program counter firstValue secondValue).length := by
  unfold canonical
  rw [List.length_append, List.length_append, header_length]
  rw [Nat.add_assoc]
  exact Nat.le_add_right 2 _

/-- Complete encoded states likewise always have two cells. -/
theorem two_le_encodeState_length (program : Program) (state : State) :
    2 ≤ (encodeState program state).length := by
  cases state with
  | mk counter firstValue secondValue status =>
      cases status with
      | accepted => exact Nat.le_refl 2
      | rejected => exact Nat.le_refl 2
      | running => exact
          two_le_canonical_length program counter firstValue secondValue

/-- Multiplicity emitted by one selected lane cell. -/
def laneMultiplicity (program : Program) (counter : Nat)
    (register : Register) (positive : Bool) : Nat :=
  let instruction := instructionAt program counter
  let next := branchNext instruction positive
  let nextInstruction := instructionAt program next
  if instructionLive nextInstruction then
    let nextScale := scale nextInstruction register
    if instructionTested? instruction = some register then
      match instruction with
      | .increment _ _ => nextScale * (if positive then 4 else 2)
      | .decrementJump _ _ _ => nextScale
      | .accept => 0
      | .reject => 0
    else nextScale
  else 0

/-- Data emitted by one chosen branch lane. -/
def laneOutput (program : Program) (counter : Nat)
    (register : Register) (positive : Bool) : List Symbol :=
  let next := branchNext (instructionAt program counter) positive
  List.replicate (laneMultiplicity program counter register positive)
    (registerSymbol register next)

/-- Total typed production table of the two-sweep construction. -/
def production (program : Program) : Symbol → List Symbol
  | .head counter =>
      [.selectPositive counter, .selectZero counter]
  | .filler _ => [.sink, .sink]
  | .first counter =>
      [.firstPositive counter, .firstZero counter]
  | .second counter =>
      [.secondPositive counter, .secondZero counter]
  | .selectPositive counter =>
      header program (branchNext (instructionAt program counter) true)
  | .selectZero counter =>
      .sacrificial ::
        header program (branchNext (instructionAt program counter) false)
  | .firstPositive counter =>
      laneOutput program counter .first true
  | .firstZero counter =>
      laneOutput program counter .first false
  | .secondPositive counter =>
      laneOutput program counter .second true
  | .secondZero counter =>
      laneOutput program counter .second false
  | .sacrificial => [.sink, .sink]
  | .sink => [.sink, .sink]
  | .halt => []

/-- The rejecting sink is an exact nonhalting fixed point. -/
@[simp]
theorem tagStep_sink (program : Program) :
    tagStep (production program) [.sink, .sink] = [.sink, .sink] := rfl

@[simp]
theorem tagIterate_sink (program : Program) (fuel : Nat) :
    tagIterate (production program) fuel [.sink, .sink] = [.sink, .sink] := by
  induction fuel with
  | zero => rfl
  | succ fuel ih => simp [ih]

/-- Accept is the only source instruction whose canonical word starts in halt. -/
theorem canonical_head_halt_iff (program : Program)
    (counter firstValue secondValue : Nat) :
    (canonical program counter firstValue secondValue).head? = some .halt ↔
      instructionAt program counter = .accept := by
  unfold canonical header
  cases hinstruction : instructionAt program counter with
  | accept => simp
  | reject => simp
  | increment register next => simp
  | decrementJump register positive zeroNext => simp

/-! ## Reflected sweep words -/

/-- Selected/ignored alternatives emitted by the first sweep. -/
def alternatives (counter : Nat) (firstCount secondCount : Nat) :
    List (Symbol × Symbol) :=
  [(.selectPositive counter, .selectZero counter)] ++
    List.replicate firstCount
      (.firstPositive counter, .firstZero counter) ++
    List.replicate secondCount
      (.secondPositive counter, .secondZero counter)

/-- Literal lane word before parity chooses one component of every pair. -/
def alternativeWord (counter : Nat) (firstCount secondCount : Nat) :
    List Symbol := pairWord (alternatives counter firstCount secondCount)

/-! ## Exact first sweeps -/

theorem firstSweep_increment_first_positive
    (program : Program) (counter next predecessor secondValue : Nat)
    (instructionEq : instructionAt program counter =
      .increment .first next) :
    tagIterate (production program)
        (1 + radix predecessor + radix secondValue)
        (canonical program counter (predecessor + 1) secondValue) =
      alternativeWord counter (radix predecessor) (radix secondValue) := by
  let pairs : List (Symbol × Symbol) :=
    [(.head counter, .filler counter)] ++
      List.replicate (radix predecessor) (.first counter, .first counter) ++
      List.replicate (radix secondValue) (.second counter, .second counter)
  have wordEq :
      canonical program counter (predecessor + 1) secondValue =
        pairWord pairs := by
    simp [canonical, header, dataBlock, instructionEq, instructionLive,
      scale, instructionTested?, radix_succ, pairs, registerSymbol,
      List.append_assoc]
  have lengthEq : pairs.length =
      1 + radix predecessor + radix secondValue := by
    simp [pairs]
    simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
  rw [wordEq, ← lengthEq]
  simpa [pairs, alternativeWord, alternatives, production,
    List.append_assoc] using
    iterate_pairWord_with_tail (production program) pairs []

/-- The positive first-register sweep depends only on which register is tested. -/
theorem firstSweep_first_positive_of_tested
    (program : Program) (counter predecessor secondValue : Nat)
    (instruction : Instruction)
    (instructionEq : instructionAt program counter = instruction)
    (liveEq : instructionLive instruction = true)
    (testedEq : instructionTested? instruction = some .first) :
    tagIterate (production program)
        (1 + radix predecessor + radix secondValue)
        (canonical program counter (predecessor + 1) secondValue) =
      alternativeWord counter (radix predecessor) (radix secondValue) := by
  have headerEq : header program counter =
      [.head counter, .filler counter] := by
    unfold header
    rw [instructionEq]
    cases instruction <;> simp_all [instructionLive, instructionTested?]
  let pairs : List (Symbol × Symbol) :=
    [(.head counter, .filler counter)] ++
      List.replicate (radix predecessor) (.first counter, .first counter) ++
      List.replicate (radix secondValue) (.second counter, .second counter)
  have wordEq :
      canonical program counter (predecessor + 1) secondValue =
        pairWord pairs := by
    simp [canonical, dataBlock, instructionEq, liveEq, scale, testedEq,
      headerEq, radix_succ, pairs, registerSymbol, List.append_assoc]
  have lengthEq : pairs.length =
      1 + radix predecessor + radix secondValue := by
    simp [pairs]
    simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
  rw [wordEq, ← lengthEq]
  simpa [pairs, alternativeWord, alternatives, production,
    List.append_assoc] using
    iterate_pairWord_with_tail (production program) pairs []

theorem firstSweep_increment_first_zero
    (program : Program) (counter next secondValue : Nat)
    (instructionEq : instructionAt program counter =
      .increment .first next) :
    tagIterate (production program) (2 + radix secondValue)
        (canonical program counter 0 secondValue) =
      (alternativeWord counter 1 (radix secondValue)).tail := by
  obtain ⟨secondPredecessor, radixSecond⟩ := radix_is_succ secondValue
  let pairs : List (Symbol × Symbol) :=
    [(.head counter, .filler counter),
      (.first counter, .second counter)] ++
      List.replicate secondPredecessor
        (.second counter, .second counter)
  have fuelEq : 2 + radix secondValue = pairs.length + 1 := by
    simp [pairs, radixSecond]
    simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
  rw [fuelEq]
  have wordEq :
      canonical program counter 0 secondValue =
        pairWord pairs ++ [.second counter] := by
    simp [canonical, header, dataBlock, instructionEq, instructionLive,
      scale, instructionTested?, registerSymbol, pairs, radixSecond,
      Nat.mul_add, List.replicate_succ, List.append_assoc]
    exact cons_replicate_eq_append (.second counter)
      (2 * secondPredecessor)
  rw [wordEq]
  have outputsEq : pairOutputs (production program) pairs =
      .selectPositive counter ::
        ((.selectZero counter ::
          [.firstPositive counter, .firstZero counter]) ++
          (List.replicate secondPredecessor
            [.secondPositive counter, .secondZero counter]).flatten) := by
    simp [pairs, pairOutputs, production, List.append_assoc]
  rw [iterate_pairWord_last (production program) pairs
    (.second counter) (.selectPositive counter) _ outputsEq]
  simp [alternativeWord, alternatives, production, radixSecond,
    List.replicate_succ', List.append_assoc]

/-- The zero first-register sweep is shared by increment and decrement. -/
theorem firstSweep_first_zero_of_tested
    (program : Program) (counter secondValue : Nat)
    (instruction : Instruction)
    (instructionEq : instructionAt program counter = instruction)
    (liveEq : instructionLive instruction = true)
    (testedEq : instructionTested? instruction = some .first) :
    tagIterate (production program) (2 + radix secondValue)
        (canonical program counter 0 secondValue) =
      (alternativeWord counter 1 (radix secondValue)).tail := by
  have headerEq : header program counter =
      [.head counter, .filler counter] := by
    unfold header
    rw [instructionEq]
    cases instruction <;> simp_all [instructionLive, instructionTested?]
  obtain ⟨secondPredecessor, radixSecond⟩ := radix_is_succ secondValue
  let pairs : List (Symbol × Symbol) :=
    [(.head counter, .filler counter),
      (.first counter, .second counter)] ++
      List.replicate secondPredecessor
        (.second counter, .second counter)
  have fuelEq : 2 + radix secondValue = pairs.length + 1 := by
    simp [pairs, radixSecond]
    simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
  rw [fuelEq]
  have wordEq :
      canonical program counter 0 secondValue =
        pairWord pairs ++ [.second counter] := by
    simp [canonical, dataBlock, instructionEq, liveEq, scale, testedEq,
      headerEq, registerSymbol, pairs, radixSecond, Nat.mul_add,
      List.replicate_succ, List.append_assoc]
    exact cons_replicate_eq_append (.second counter)
      (2 * secondPredecessor)
  rw [wordEq]
  have outputsEq : pairOutputs (production program) pairs =
      .selectPositive counter ::
        ((.selectZero counter ::
          [.firstPositive counter, .firstZero counter]) ++
          (List.replicate secondPredecessor
            [.secondPositive counter, .secondZero counter]).flatten) := by
    simp [pairs, pairOutputs, production, List.append_assoc]
  rw [iterate_pairWord_last (production program) pairs
    (.second counter) (.selectPositive counter) _ outputsEq]
  simp [alternativeWord, alternatives, production, radixSecond,
    List.replicate_succ', List.append_assoc]

/-- Positive second-register sweep. -/
theorem firstSweep_second_positive_of_tested
    (program : Program) (counter firstValue predecessor : Nat)
    (instruction : Instruction)
    (instructionEq : instructionAt program counter = instruction)
    (liveEq : instructionLive instruction = true)
    (testedEq : instructionTested? instruction = some .second) :
    tagIterate (production program)
        (1 + radix firstValue + radix predecessor)
        (canonical program counter firstValue (predecessor + 1)) =
      alternativeWord counter (radix firstValue) (radix predecessor) := by
  have headerEq : header program counter =
      [.head counter, .filler counter] := by
    unfold header
    rw [instructionEq]
    cases instruction <;> simp_all [instructionLive, instructionTested?]
  let pairs : List (Symbol × Symbol) :=
    [(.head counter, .filler counter)] ++
      List.replicate (radix firstValue) (.first counter, .first counter) ++
      List.replicate (radix predecessor) (.second counter, .second counter)
  have wordEq :
      canonical program counter firstValue (predecessor + 1) =
        pairWord pairs := by
    simp [canonical, dataBlock, instructionEq, liveEq, scale, testedEq,
      headerEq, radix_succ, pairs, registerSymbol, List.append_assoc]
  have lengthEq : pairs.length =
      1 + radix firstValue + radix predecessor := by
    simp [pairs]
    simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
  rw [wordEq, ← lengthEq]
  simpa [pairs, alternativeWord, alternatives, production,
    List.append_assoc] using
    iterate_pairWord_with_tail (production program) pairs []

/-- Zero second-register sweep. -/
theorem firstSweep_second_zero_of_tested
    (program : Program) (counter firstValue : Nat)
    (instruction : Instruction)
    (instructionEq : instructionAt program counter = instruction)
    (liveEq : instructionLive instruction = true)
    (testedEq : instructionTested? instruction = some .second) :
    tagIterate (production program) (2 + radix firstValue)
        (canonical program counter firstValue 0) =
      (alternativeWord counter (radix firstValue) 1).tail := by
  have headerEq : header program counter =
      [.head counter, .filler counter] := by
    unfold header
    rw [instructionEq]
    cases instruction <;> simp_all [instructionLive, instructionTested?]
  let pairs : List (Symbol × Symbol) :=
    [(.head counter, .filler counter)] ++
      List.replicate (radix firstValue) (.first counter, .first counter)
  have fuelEq : 2 + radix firstValue = pairs.length + 1 := by
    simp [pairs]
    calc
      2 + radix firstValue = 1 + (1 + radix firstValue) :=
        Nat.add_assoc 1 1 (radix firstValue)
      _ = radix firstValue + 1 + 1 := by
        simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
  rw [fuelEq]
  have wordEq :
      canonical program counter firstValue 0 =
        pairWord pairs ++ [.second counter] := by
    simp [canonical, dataBlock, instructionEq, liveEq, scale, testedEq,
      headerEq, registerSymbol, pairs, List.append_assoc]
  rw [wordEq]
  have outputsEq : pairOutputs (production program) pairs =
      .selectPositive counter ::
        ((.selectZero counter :: []) ++
          (List.replicate (radix firstValue)
            [.firstPositive counter, .firstZero counter]).flatten) := by
    simp [pairs, pairOutputs, production, List.append_assoc]
  rw [iterate_pairWord_last (production program) pairs
    (.second counter) (.selectPositive counter) _ outputsEq]
  simp [alternativeWord, alternatives, production, List.append_assoc]

/-! ## Exact lane sweeps -/

@[simp]
theorem flatten_replicate_replicate (outer inner : Nat) (symbol : Symbol) :
    (List.replicate outer (List.replicate inner symbol)).flatten =
      List.replicate (outer * inner) symbol := by
  induction outer with
  | zero => simp
  | succ outer ih =>
      simp [List.replicate_succ, ih, Nat.add_mul,
        List.replicate_append_replicate]
      exact Nat.add_comm _ _

theorem replicate_one_plus_mul_append (count multiplier : Nat)
    (symbol : Symbol) (tail : List Symbol) :
    List.replicate multiplier symbol ++
        (List.replicate (count * multiplier) symbol ++ tail) =
      List.replicate ((count + 1) * multiplier) symbol ++ tail := by
  rw [← List.append_assoc, List.replicate_append_replicate]
  congr 2
  rw [Nat.add_mul, Nat.one_mul, Nat.add_comm]

/-- Literal next-generation word selected by one branch lane. -/
def branchWord (program : Program) (counter : Nat) (positive : Bool)
    (firstCount secondCount : Nat) : List Symbol :=
  let instruction := instructionAt program counter
  let next := branchNext instruction positive
  header program next ++
    List.replicate
      (firstCount * laneMultiplicity program counter .first positive)
      (.first next) ++
    List.replicate
      (secondCount * laneMultiplicity program counter .second positive)
      (.second next)

/-- The even positive-alternative word selects exactly every positive lane. -/
theorem positiveLaneSweep (program : Program) (counter : Nat)
    (firstCount secondCount : Nat) :
    tagIterate (production program) (1 + firstCount + secondCount)
        (alternativeWord counter firstCount secondCount) =
      branchWord program counter true firstCount secondCount := by
  let pairs := alternatives counter firstCount secondCount
  have lengthEq : pairs.length = 1 + firstCount + secondCount := by
    simp [pairs, alternatives]
    simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
  unfold alternativeWord
  rw [← lengthEq]
  simpa [pairs, alternatives, pairOutputs, production, branchWord,
    laneOutput, List.append_assoc, Nat.mul_comm] using!
    iterate_pairWord_with_tail (production program) pairs []

/-- Pairing of a lane word after its leading positive selector was removed. -/
def shiftedPairs (selector : Symbol) :
    List (Symbol × Symbol) → List (Symbol × Symbol)
  | [] => []
  | pair :: rest => (selector, pair.1) :: shiftedPairs pair.2 rest

/-- Final zero alternative, or the supplied selector for an empty list. -/
def terminalSecond (selector : Symbol) :
    List (Symbol × Symbol) → Symbol
  | [] => selector
  | pair :: rest => terminalSecond pair.2 rest

/-- Productions of all zero alternatives. -/
def secondOutputs (production : Symbol → List Symbol) :
    List (Symbol × Symbol) → List Symbol
  | [] => []
  | pair :: rest => production pair.2 ++ secondOutputs production rest

/-- Productions of every zero alternative except the final one. -/
def secondaryPrefix (production : Symbol → List Symbol) :
    List (Symbol × Symbol) → List Symbol
  | [] => []
  | [_] => []
  | pair :: next :: rest =>
      production pair.2 ++ secondaryPrefix production (next :: rest)

@[simp]
theorem secondOutputs_append (production : Symbol → List Symbol)
    (left right : List (Symbol × Symbol)) :
    secondOutputs production (left ++ right) =
      secondOutputs production left ++ secondOutputs production right := by
  induction left with
  | nil => rfl
  | cons pair left ih =>
      simp [secondOutputs, ih, List.append_assoc]

@[simp]
theorem secondOutputs_replicate (production : Symbol → List Symbol)
    (count : Nat) (selected ignored : Symbol) :
    secondOutputs production (List.replicate count (selected, ignored)) =
      (List.replicate count (production ignored)).flatten := by
  induction count with
  | zero => rfl
  | succ count ih => simp [List.replicate_succ, secondOutputs, ih]

theorem shiftedPairs_word (selector : Symbol)
    (pairs : List (Symbol × Symbol)) :
    selector :: pairWord pairs =
      pairWord (shiftedPairs selector pairs) ++
        [terminalSecond selector pairs] := by
  induction pairs generalizing selector with
  | nil => rfl
  | cons pair pairs ih =>
      cases pair with
      | mk selected zero =>
          simp only [pairWord_cons, shiftedPairs, terminalSecond,
            List.cons_append]
          rw [ih zero]

theorem shiftedPairs_outputs (production : Symbol → List Symbol)
    (selector : Symbol) (first : Symbol × Symbol)
    (rest : List (Symbol × Symbol)) :
    pairOutputs production (shiftedPairs selector (first :: rest)) =
      production selector ++
        secondaryPrefix production (first :: rest) := by
  induction rest generalizing selector first with
  | nil => simp [shiftedPairs, secondaryPrefix, pairOutputs]
  | cons next rest ih =>
      change production selector ++
          pairOutputs production (shiftedPairs first.2 (next :: rest)) =
        production selector ++
          (production first.2 ++
            secondaryPrefix production (next :: rest))
      rw [ih first.2 next]

@[simp]
theorem shiftedPairs_length (selector : Symbol)
    (pairs : List (Symbol × Symbol)) :
    (shiftedPairs selector pairs).length = pairs.length := by
  induction pairs generalizing selector with
  | nil => rfl
  | cons pair pairs ih =>
      simp [shiftedPairs, ih]

theorem secondaryPrefix_terminal (production : Symbol → List Symbol)
    (first : Symbol × Symbol) (rest : List (Symbol × Symbol)) :
    secondaryPrefix production (first :: rest) ++
        production (terminalSecond first.2 rest) =
      secondOutputs production (first :: rest) := by
  induction rest generalizing first with
  | nil => simp [secondaryPrefix, terminalSecond, secondOutputs]
  | cons next rest ih =>
      simp only [secondaryPrefix, terminalSecond, secondOutputs]
      calc
        production first.2 ++ secondaryPrefix production (next :: rest) ++
              production (terminalSecond next.2 rest) =
            production first.2 ++
              (secondaryPrefix production (next :: rest) ++
                production (terminalSecond next.2 rest)) := by
                  rw [List.append_assoc]
        _ = production first.2 ++ secondOutputs production (next :: rest) := by
              rw [ih next]

/-- Generic odd zero-lane sweep: the selector's first output is sacrificial. -/
theorem zeroLaneSweepAux
    (production : Symbol → List Symbol)
    (selector discarded : Symbol) (selectorTail : List Symbol)
    (first : Symbol × Symbol) (rest : List (Symbol × Symbol))
    (selectorOutput : production selector = discarded :: selectorTail) :
    tagIterate production ((first :: rest).length + 1)
        (selector :: pairWord (first :: rest)) =
      selectorTail ++ secondOutputs production (first :: rest) := by
  rw [shiftedPairs_word]
  have outputsEq :
      pairOutputs production
          (shiftedPairs selector (first :: rest)) =
        discarded ::
          (selectorTail ++ secondaryPrefix production (first :: rest)) := by
    rw [shiftedPairs_outputs, selectorOutput]
    simp [List.append_assoc]
  have lengthEq :
      (shiftedPairs selector (first :: rest)).length =
        (first :: rest).length := shiftedPairs_length _ _
  rw [← lengthEq]
  rw [iterate_pairWord_last production
    (shiftedPairs selector (first :: rest))
    (terminalSecond selector (first :: rest)) discarded _ outputsEq]
  rw [show terminalSecond selector (first :: rest) =
      terminalSecond first.2 rest from rfl]
  rw [List.append_assoc, secondaryPrefix_terminal]

/-- Alternatives belonging to the two register blocks, without the selector. -/
def dataAlternatives (counter : Nat) (firstCount secondCount : Nat) :
    List (Symbol × Symbol) :=
  List.replicate firstCount
      (.firstPositive counter, .firstZero counter) ++
    List.replicate secondCount
      (.secondPositive counter, .secondZero counter)

@[simp]
theorem alternativeWord_tail (counter : Nat)
    (firstCount secondCount : Nat) :
    (alternativeWord counter firstCount secondCount).tail =
      .selectZero counter ::
        pairWord (dataAlternatives counter firstCount secondCount) := by
  simp [alternativeWord, alternatives, dataAlternatives]

/-- The shifted odd word selects exactly every zero lane. -/
theorem zeroLaneSweep (program : Program) (counter : Nat)
    (firstPredecessor secondCount : Nat) :
    tagIterate (production program) (2 + firstPredecessor + secondCount)
        (alternativeWord counter (firstPredecessor + 1) secondCount).tail =
      branchWord program counter false (firstPredecessor + 1)
        secondCount := by
  let firstPair : Symbol × Symbol :=
    (.firstPositive counter, .firstZero counter)
  let restPairs : List (Symbol × Symbol) :=
    List.replicate firstPredecessor
        (.firstPositive counter, .firstZero counter) ++
      List.replicate secondCount
        (.secondPositive counter, .secondZero counter)
  have fuelEq : 2 + firstPredecessor + secondCount =
      (firstPair :: restPairs).length + 1 := by
    simp [firstPair, restPairs]
    simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
  rw [fuelEq]
  rw [alternativeWord_tail]
  have dataEq :
      dataAlternatives counter (firstPredecessor + 1) secondCount =
        firstPair :: restPairs := by
    simp [dataAlternatives, firstPair, restPairs, List.replicate_succ,
      List.append_assoc]
  rw [dataEq]
  have run := zeroLaneSweepAux (production program)
    (.selectZero counter) .sacrificial
    (header program
      (branchNext (instructionAt program counter) false))
    firstPair restPairs rfl
  simpa [branchWord, secondOutputs, firstPair, restPairs, production,
    laneOutput, registerSymbol, List.append_assoc, Nat.mul_comm,
    Nat.add_mul, Nat.add_comm, List.replicate_append_replicate,
    replicate_one_plus_mul_append] using run

/-! ## Lane arithmetic equals the source transition -/

theorem branchWord_increment_first_positive
    (program : Program) (counter next predecessor secondValue : Nat)
    (instructionEq : instructionAt program counter =
      .increment .first next) :
    branchWord program counter true (radix predecessor) (radix secondValue) =
      canonical program next (predecessor + 2) secondValue := by
  unfold branchWord laneMultiplicity canonical dataBlock
  rw [instructionEq]
  simp only [branchNext, instructionTested?]
  cases nextInstruction : instructionAt program next with
  | accept => simp [nextInstruction, instructionLive]
  | reject => simp [nextInstruction, instructionLive]
  | increment register following =>
      cases register <;>
        simp [nextInstruction, instructionLive, scale, instructionTested?,
          registerSymbol, radix_succ, List.append_assoc, Nat.mul_assoc,
          Nat.mul_comm, Nat.mul_left_comm, Nat.mul_add, Nat.add_mul,
          four_mul, eight_mul]
  | decrementJump register positive zeroNext =>
      cases register <;>
        simp [nextInstruction, instructionLive, scale, instructionTested?,
          registerSymbol, radix_succ, List.append_assoc, Nat.mul_assoc,
          Nat.mul_comm, Nat.mul_left_comm, Nat.mul_add, Nat.add_mul,
          four_mul, eight_mul]

theorem branchWord_increment_first_zero
    (program : Program) (counter next secondValue : Nat)
    (instructionEq : instructionAt program counter =
      .increment .first next) :
    branchWord program counter false 1 (radix secondValue) =
      canonical program next 1 secondValue := by
  unfold branchWord laneMultiplicity canonical dataBlock
  rw [instructionEq]
  simp only [branchNext, instructionTested?]
  cases nextInstruction : instructionAt program next <;>
    simp [nextInstruction, instructionLive, scale, instructionTested?,
      registerSymbol, radix_succ, List.append_assoc, Nat.mul_assoc,
      Nat.mul_comm, Nat.mul_left_comm]

theorem branchWord_decrement_first_positive
    (program : Program) (counter positiveNext zeroNext predecessor secondValue : Nat)
    (instructionEq : instructionAt program counter =
      .decrementJump .first positiveNext zeroNext) :
    branchWord program counter true (radix predecessor) (radix secondValue) =
      canonical program positiveNext predecessor secondValue := by
  unfold branchWord laneMultiplicity canonical dataBlock
  rw [instructionEq]
  simp only [branchNext, instructionTested?]
  cases nextInstruction : instructionAt program positiveNext <;>
    simp [nextInstruction, instructionLive, scale, instructionTested?,
      registerSymbol, List.append_assoc, Nat.mul_assoc,
      Nat.mul_comm, Nat.mul_left_comm]

theorem branchWord_decrement_first_zero
    (program : Program) (counter positiveNext zeroNext secondValue : Nat)
    (instructionEq : instructionAt program counter =
      .decrementJump .first positiveNext zeroNext) :
    branchWord program counter false 1 (radix secondValue) =
      canonical program zeroNext 0 secondValue := by
  unfold branchWord laneMultiplicity canonical dataBlock
  rw [instructionEq]
  simp only [branchNext, instructionTested?]
  cases nextInstruction : instructionAt program zeroNext <;>
    simp [nextInstruction, instructionLive, scale, instructionTested?,
      registerSymbol, List.append_assoc, Nat.mul_assoc,
      Nat.mul_comm, Nat.mul_left_comm]

theorem branchWord_increment_second_positive
    (program : Program) (counter next firstValue predecessor : Nat)
    (instructionEq : instructionAt program counter =
      .increment .second next) :
    branchWord program counter true (radix firstValue) (radix predecessor) =
      canonical program next firstValue (predecessor + 2) := by
  unfold branchWord laneMultiplicity canonical dataBlock
  rw [instructionEq]
  simp only [branchNext, instructionTested?]
  cases nextInstruction : instructionAt program next with
  | accept => simp [nextInstruction, instructionLive]
  | reject => simp [nextInstruction, instructionLive]
  | increment register following =>
      cases register <;>
        simp [nextInstruction, instructionLive, scale, instructionTested?,
          registerSymbol, radix_succ, List.append_assoc, Nat.mul_assoc,
          Nat.mul_comm, Nat.mul_left_comm, Nat.mul_add, Nat.add_mul,
          four_mul, eight_mul]
  | decrementJump register positive zeroNext =>
      cases register <;>
        simp [nextInstruction, instructionLive, scale, instructionTested?,
          registerSymbol, radix_succ, List.append_assoc, Nat.mul_assoc,
          Nat.mul_comm, Nat.mul_left_comm, Nat.mul_add, Nat.add_mul,
          four_mul, eight_mul]

theorem branchWord_increment_second_zero
    (program : Program) (counter next firstValue : Nat)
    (instructionEq : instructionAt program counter =
      .increment .second next) :
    branchWord program counter false (radix firstValue) 1 =
      canonical program next firstValue 1 := by
  unfold branchWord laneMultiplicity canonical dataBlock
  rw [instructionEq]
  simp only [branchNext, instructionTested?]
  cases nextInstruction : instructionAt program next <;>
    simp [nextInstruction, instructionLive, scale, instructionTested?,
      registerSymbol, radix_succ, List.append_assoc, Nat.mul_assoc,
      Nat.mul_comm, Nat.mul_left_comm]

theorem branchWord_decrement_second_positive
    (program : Program) (counter positiveNext zeroNext firstValue predecessor : Nat)
    (instructionEq : instructionAt program counter =
      .decrementJump .second positiveNext zeroNext) :
    branchWord program counter true (radix firstValue) (radix predecessor) =
      canonical program positiveNext firstValue predecessor := by
  unfold branchWord laneMultiplicity canonical dataBlock
  rw [instructionEq]
  simp only [branchNext, instructionTested?]
  cases nextInstruction : instructionAt program positiveNext <;>
    simp [nextInstruction, instructionLive, scale, instructionTested?,
      registerSymbol, List.append_assoc, Nat.mul_assoc,
      Nat.mul_comm, Nat.mul_left_comm]

theorem branchWord_decrement_second_zero
    (program : Program) (counter positiveNext zeroNext firstValue : Nat)
    (instructionEq : instructionAt program counter =
      .decrementJump .second positiveNext zeroNext) :
    branchWord program counter false (radix firstValue) 1 =
      canonical program zeroNext firstValue 0 := by
  unfold branchWord laneMultiplicity canonical dataBlock
  rw [instructionEq]
  simp only [branchNext, instructionTested?]
  cases nextInstruction : instructionAt program zeroNext <;>
    simp [nextInstruction, instructionLive, scale, instructionTested?,
      registerSymbol, List.append_assoc, Nat.mul_assoc,
      Nat.mul_comm, Nat.mul_left_comm]

/-! ## Exact source-instruction macros -/

/-- Duration of either sweep for the selected register/value layout. -/
def halfFuel : Register → Nat → Nat → Nat
  | .first, 0, secondValue => 2 + radix secondValue
  | .first, firstValue + 1, secondValue =>
      1 + radix firstValue + radix secondValue
  | .second, firstValue, 0 => 2 + radix firstValue
  | .second, firstValue, secondValue + 1 =>
      1 + radix firstValue + radix secondValue

/-- Exact duration of one complete two-sweep source macro. -/
def macroFuel (register : Register) (firstValue secondValue : Nat) : Nat :=
  halfFuel register firstValue secondValue +
    halfFuel register firstValue secondValue

theorem macroFuel_positive (register : Register)
    (firstValue secondValue : Nat) :
    0 < macroFuel register firstValue secondValue := by
  unfold macroFuel
  apply Nat.add_pos_left
  cases register with
  | first =>
      cases firstValue with
      | zero =>
          exact Nat.add_pos_left (Nat.zero_lt_succ 1) _
      | succ firstPredecessor =>
          exact Nat.add_pos_left
            (Nat.add_pos_left (Nat.zero_lt_succ 0) _) _
  | second =>
      cases secondValue with
      | zero =>
          exact Nat.add_pos_left (Nat.zero_lt_succ 1) _
      | succ secondPredecessor =>
          exact Nat.add_pos_left
            (Nat.add_pos_left (Nat.zero_lt_succ 0) _) _

theorem macro_increment_first (program : Program)
    (counter next firstValue secondValue : Nat)
    (instructionEq : instructionAt program counter =
      .increment .first next) :
    tagIterate (production program) (macroFuel .first firstValue secondValue)
        (canonical program counter firstValue secondValue) =
      canonical program next (firstValue + 1) secondValue := by
  cases firstValue with
  | zero =>
      simp only [macroFuel, halfFuel]
      rw [tagIterate_add,
        firstSweep_first_zero_of_tested program counter secondValue
          (.increment .first next) instructionEq rfl rfl,
        show 2 + radix secondValue = 2 + 0 + radix secondValue by simp,
        zeroLaneSweep,
        branchWord_increment_first_zero program counter next secondValue
          instructionEq]
  | succ predecessor =>
      simp only [macroFuel, halfFuel]
      rw [tagIterate_add]
      rw [firstSweep_first_positive_of_tested program counter predecessor
        secondValue (.increment .first next) instructionEq rfl rfl]
      rw [positiveLaneSweep,
        branchWord_increment_first_positive program counter next predecessor
          secondValue instructionEq]

theorem macro_decrement_first (program : Program)
    (counter positiveNext zeroNext firstValue secondValue : Nat)
    (instructionEq : instructionAt program counter =
      .decrementJump .first positiveNext zeroNext) :
    tagIterate (production program) (macroFuel .first firstValue secondValue)
        (canonical program counter firstValue secondValue) =
      canonical program (if firstValue = 0 then zeroNext else positiveNext)
        (firstValue - 1) secondValue := by
  cases firstValue with
  | zero =>
      simp only [macroFuel, halfFuel]
      rw [tagIterate_add,
        firstSweep_first_zero_of_tested program counter secondValue
          (.decrementJump .first positiveNext zeroNext)
          instructionEq rfl rfl,
        show 2 + radix secondValue = 2 + 0 + radix secondValue by simp,
        zeroLaneSweep,
        branchWord_decrement_first_zero program counter positiveNext zeroNext
          secondValue instructionEq]
      rfl
  | succ predecessor =>
      simp only [macroFuel, halfFuel]
      rw [tagIterate_add]
      rw [firstSweep_first_positive_of_tested program counter predecessor
        secondValue (.decrementJump .first positiveNext zeroNext)
        instructionEq rfl rfl]
      rw [positiveLaneSweep,
        branchWord_decrement_first_positive program counter positiveNext
          zeroNext predecessor secondValue instructionEq]
      simp

theorem macro_increment_second (program : Program)
    (counter next firstValue secondValue : Nat)
    (instructionEq : instructionAt program counter =
      .increment .second next) :
    tagIterate (production program) (macroFuel .second firstValue secondValue)
        (canonical program counter firstValue secondValue) =
      canonical program next firstValue (secondValue + 1) := by
  cases secondValue with
  | zero =>
      obtain ⟨firstPredecessor, firstRadix⟩ := radix_is_succ firstValue
      simp only [macroFuel, halfFuel]
      rw [tagIterate_add,
        firstSweep_second_zero_of_tested program counter firstValue
          (.increment .second next) instructionEq rfl rfl,
        firstRadix,
        show 2 + (firstPredecessor + 1) = 2 + firstPredecessor + 1 by
          rw [Nat.add_assoc],
        zeroLaneSweep, ← firstRadix,
        branchWord_increment_second_zero program counter next firstValue
          instructionEq]
  | succ predecessor =>
      simp only [macroFuel, halfFuel]
      rw [tagIterate_add]
      rw [firstSweep_second_positive_of_tested program counter firstValue
        predecessor (.increment .second next) instructionEq rfl rfl]
      rw [positiveLaneSweep,
        branchWord_increment_second_positive program counter next firstValue
          predecessor instructionEq]

theorem macro_decrement_second (program : Program)
    (counter positiveNext zeroNext firstValue secondValue : Nat)
    (instructionEq : instructionAt program counter =
      .decrementJump .second positiveNext zeroNext) :
    tagIterate (production program) (macroFuel .second firstValue secondValue)
        (canonical program counter firstValue secondValue) =
      canonical program (if secondValue = 0 then zeroNext else positiveNext)
        firstValue (secondValue - 1) := by
  cases secondValue with
  | zero =>
      obtain ⟨firstPredecessor, firstRadix⟩ := radix_is_succ firstValue
      simp only [macroFuel, halfFuel]
      rw [tagIterate_add,
        firstSweep_second_zero_of_tested program counter firstValue
          (.decrementJump .second positiveNext zeroNext)
          instructionEq rfl rfl,
        firstRadix,
        show 2 + (firstPredecessor + 1) = 2 + firstPredecessor + 1 by
          rw [Nat.add_assoc],
        zeroLaneSweep, ← firstRadix,
        branchWord_decrement_second_zero program counter positiveNext zeroNext
          firstValue instructionEq]
      rfl
  | succ predecessor =>
      simp only [macroFuel, halfFuel]
      rw [tagIterate_add]
      rw [firstSweep_second_positive_of_tested program counter firstValue
        predecessor (.decrementJump .second positiveNext zeroNext)
        instructionEq rfl rfl]
      rw [positiveLaneSweep,
        branchWord_decrement_second_positive program counter positiveNext
          zeroNext firstValue predecessor instructionEq]
      simp

/-! ## Source-step simulation at canonical boundaries -/

/-- Every source transition is realized by a finite typed tag segment. -/
theorem encodeState_step (program : Program) (state : State) :
    ∃ fuel,
      tagIterate (production program) fuel (encodeState program state) =
        encodeState program (CounterMachine.step program state) := by
  rcases state with ⟨counter, firstValue, secondValue, status⟩
  cases status with
  | accepted => exact ⟨0, rfl⟩
  | rejected => exact ⟨0, rfl⟩
  | running =>
      cases instructionEq : instructionAt program counter with
      | accept => exact ⟨0, by simp [encodeState, CounterMachine.step,
          canonical, header, dataBlock, instructionEq, instructionLive]⟩
      | reject => exact ⟨0, by simp [encodeState, CounterMachine.step,
          canonical, header, dataBlock, instructionEq, instructionLive]⟩
      | increment register next =>
          cases register with
          | first =>
              refine ⟨macroFuel .first firstValue secondValue, ?_⟩
              simpa [encodeState, CounterMachine.step, instructionEq,
                CounterMachine.write, CounterMachine.read] using
                  macro_increment_first program counter next firstValue
                    secondValue instructionEq
          | second =>
              refine ⟨macroFuel .second firstValue secondValue, ?_⟩
              simpa [encodeState, CounterMachine.step, instructionEq,
                CounterMachine.write, CounterMachine.read] using
                  macro_increment_second program counter next firstValue
                    secondValue instructionEq
      | decrementJump register positiveNext zeroNext =>
          cases register with
          | first =>
              cases firstValue with
              | zero =>
                  refine ⟨macroFuel .first 0 secondValue, ?_⟩
                  simpa [encodeState, CounterMachine.step, instructionEq,
                    CounterMachine.write, CounterMachine.read] using
                    macro_decrement_first program counter positiveNext zeroNext
                      0 secondValue instructionEq
              | succ predecessor =>
                  refine ⟨macroFuel .first (predecessor + 1) secondValue, ?_⟩
                  simpa [encodeState, CounterMachine.step, instructionEq,
                    CounterMachine.write, CounterMachine.read] using
                    macro_decrement_first program counter positiveNext zeroNext
                      (predecessor + 1) secondValue instructionEq
          | second =>
              cases secondValue with
              | zero =>
                  refine ⟨macroFuel .second firstValue 0, ?_⟩
                  simpa [encodeState, CounterMachine.step, instructionEq,
                    CounterMachine.write, CounterMachine.read] using
                    macro_decrement_second program counter positiveNext zeroNext
                      firstValue 0 instructionEq
              | succ predecessor =>
                  refine ⟨macroFuel .second firstValue (predecessor + 1), ?_⟩
                  simpa [encodeState, CounterMachine.step, instructionEq,
                    CounterMachine.write, CounterMachine.read] using
                    macro_decrement_second program counter positiveNext zeroNext
                      firstValue (predecessor + 1) instructionEq

/-- A finite source run is realized at some typed tag boundary. -/
theorem encodeState_run (program : Program) (state : State) :
    ∀ sourceFuel,
      ∃ tagFuel,
        tagIterate (production program) tagFuel (encodeState program state) =
          encodeState program (CounterMachine.run program sourceFuel state)
  | 0 => ⟨0, rfl⟩
  | sourceFuel + 1 => by
      obtain ⟨prefixFuel, prefixRun⟩ := encodeState_run program state sourceFuel
      obtain ⟨stepFuel, stepRun⟩ :=
        encodeState_step program (CounterMachine.run program sourceFuel state)
      refine ⟨stepFuel + prefixFuel, ?_⟩
      rw [tagIterate_add, prefixRun, stepRun]
      rfl

/-! ## Strict-prefix safety of a source macro -/

/-- Before a protected front prefix is exhausted, appended outputs cannot
reach the head of the queue. -/
theorem tagIterate_prefix_head_ne_halt
    (table : Symbol → List Symbol) :
    ∀ (fuel : Nat) (front tail : List Symbol),
      .halt ∉ front →
      2 * fuel < front.length →
      (tagIterate table fuel (front ++ tail)).head? ≠ some .halt
  | 0, front, tail, noHalt, bound => by
      cases front with
      | nil => simp at bound
      | cons first rest =>
          have firstNe : first ≠ .halt := by
            intro firstEq
            apply noHalt
            subst first
            exact List.Mem.head _
          simp [firstNe]
  | fuel + 1, front, tail, noHalt, bound => by
      cases front with
      | nil => simp at bound
      | cons first rest =>
          cases rest with
          | nil =>
              simp only [List.length_cons, List.length_nil] at bound
              simp [Nat.mul_succ] at bound
          | cons second rest =>
              rw [tagIterate_succ_front]
              simp only [List.cons_append, tagStep]
              rw [List.append_assoc]
              apply tagIterate_prefix_head_ne_halt table fuel rest
                (tail ++ table first)
              · intro haltMem
                apply noHalt
                exact List.Mem.tail first (List.Mem.tail second haltMem)
              · simp only [List.length_cons] at bound
                have bound' : 2 * fuel + 2 < rest.length + 2 := by
                  simpa [Nat.mul_succ, Nat.add_assoc] using bound
                exact (Nat.add_lt_add_iff_right).1 bound'

@[simp]
theorem pairWord_length (pairs : List (Symbol × Symbol)) :
    (pairWord pairs).length = 2 * pairs.length := by
  induction pairs with
  | nil => rfl
  | cons pair pairs ih =>
      cases pair
      simp [ih, Nat.mul_succ]

@[simp]
theorem alternativeWord_length (counter firstCount secondCount : Nat) :
    (alternativeWord counter firstCount secondCount).length =
      2 * (1 + firstCount + secondCount) := by
  simp [alternativeWord, alternatives]
  simp [Nat.mul_add, Nat.add_mul, Nat.mul_comm]
  calc
    firstCount * 2 + secondCount * 2 + 1 + 1 =
        (firstCount * 2 + secondCount * 2) + (1 + 1) :=
      Nat.add_assoc _ _ _
    _ = (1 + 1) + (firstCount * 2 + secondCount * 2) :=
      Nat.add_comm _ _
    _ = 1 + 1 + firstCount * 2 + secondCount * 2 :=
      (Nat.add_assoc _ _ _).symm

theorem halt_not_mem_pairWord_of_components
    (pairs : List (Symbol × Symbol))
    (safe : ∀ pair, pair ∈ pairs →
      pair.1 ≠ .halt ∧ pair.2 ≠ .halt) :
    .halt ∉ pairWord pairs := by
  induction pairs with
  | nil => simp
  | cons pair pairs ih =>
      cases pair with
      | mk selected ignored =>
          intro haltMem
          simp only [pairWord_cons, List.mem_cons] at haltMem
          rcases haltMem with selectedEq | ignoredEq | tailMem
          · exact (safe (selected, ignored) (List.Mem.head _)).1
              selectedEq.symm
          · exact (safe (selected, ignored) (List.Mem.head _)).2
              ignoredEq.symm
          · apply ih
              (fun tailPair tailPairMem =>
                safe tailPair
                  (List.Mem.tail (selected, ignored) tailPairMem))
              tailMem

theorem halt_not_mem_alternativeWord
    (counter firstCount secondCount : Nat) :
    .halt ∉ alternativeWord counter firstCount secondCount := by
  unfold alternativeWord
  apply halt_not_mem_pairWord_of_components
  intro pair pairMem
  simp only [alternatives, List.mem_append, List.mem_cons,
    List.not_mem_nil, List.mem_replicate] at pairMem
  rcases pairMem with ((pairEq | impossible) | ⟨_, pairEq⟩) |
      ⟨_, pairEq⟩
  · subst pair
    simp
  · exact False.elim impossible
  · subst pair
    simp
  · subst pair
    simp

theorem halt_not_mem_alternativeWord_tail
    (counter firstCount secondCount : Nat) :
    .halt ∉ (alternativeWord counter firstCount secondCount).tail := by
  exact fun haltMem => halt_not_mem_alternativeWord counter firstCount
    secondCount (List.mem_of_mem_tail haltMem)

/-- Live canonical words contain no halting symbol at any position. -/
theorem halt_not_mem_canonical_of_live
    (program : Program) (counter firstValue secondValue : Nat)
    (live : instructionLive (instructionAt program counter) = true) :
    .halt ∉ canonical program counter firstValue secondValue := by
  cases instructionEq : instructionAt program counter with
  | accept => simp [instructionEq, instructionLive] at live
  | reject => simp [instructionEq, instructionLive] at live
  | increment register next =>
      cases register <;>
        simp [canonical, header, dataBlock, instructionEq,
          instructionLive, scale, instructionTested?, registerSymbol]
  | decrementJump register positiveNext zeroNext =>
      cases register <;>
        simp [canonical, header, dataBlock, instructionEq,
          instructionLive, scale, instructionTested?, registerSymbol]

/-- The selected canonical layout lasts for exactly one half-macro. -/
theorem canonical_prefix_bound_of_tested
    (program : Program) (counter firstValue secondValue fuel : Nat)
    (instruction : Instruction) (register : Register)
    (instructionEq : instructionAt program counter = instruction)
    (liveEq : instructionLive instruction = true)
    (testedEq : instructionTested? instruction = some register)
    (fuelLt : fuel < halfFuel register firstValue secondValue) :
    2 * fuel < (canonical program counter firstValue secondValue).length := by
  have positiveLayout {current firstCount secondCount : Nat}
      (less : current < 1 + firstCount + secondCount) :
      2 * current < 1 + (1 + (2 * firstCount + 2 * secondCount)) := by
    have doubled := Nat.mul_lt_mul_of_pos_left less (Nat.zero_lt_succ 1)
    rw [show 2 * (1 + firstCount + secondCount) =
        1 + (1 + (2 * firstCount + 2 * secondCount)) by
      simp [Nat.mul_add, Nat.add_mul]
      exact (Nat.add_assoc 2 (2 * firstCount) (2 * secondCount)).trans
        (Nat.add_assoc 1 1
          (2 * firstCount + 2 * secondCount))] at doubled
    exact doubled
  have zeroLayout {current count : Nat} (less : current < 2 + count) :
      2 * current < 1 + (1 + (1 + 2 * count)) := by
    have successorLe : current + 1 ≤ 2 + count := Nat.succ_le_of_lt less
    have successorLe' : current + 1 ≤ (1 + count) + 1 := by
      simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using successorLe
    have currentLe : current ≤ 1 + count :=
      Nat.le_of_succ_le_succ successorLe'
    have doubledLe := Nat.mul_le_mul_left 2 currentLe
    have core := Nat.lt_succ_of_le doubledLe
    have rhsEq : Nat.succ (2 * (1 + count)) =
        1 + (1 + (1 + 2 * count)) := by
      simp only [Nat.mul_add, Nat.mul_one, Nat.succ_eq_add_one]
      calc
        2 + 2 * count + 1 = (1 + 1) + 2 * count + 1 := rfl
        _ = 1 + (1 + 2 * count) + 1 :=
          congrArg (fun value => value + 1)
            (Nat.add_assoc 1 1 (2 * count))
        _ = 1 + ((1 + 2 * count) + 1) :=
          Nat.add_assoc 1 (1 + 2 * count) 1
        _ = 1 + (1 + (2 * count + 1)) :=
          congrArg (Nat.add 1) (Nat.add_assoc 1 (2 * count) 1)
        _ = 1 + (1 + (1 + 2 * count)) :=
          congrArg (fun value => 1 + (1 + value))
            (Nat.add_comm (2 * count) 1)
    rw [rhsEq] at core
    exact core
  cases instruction with
  | accept => simp [instructionLive] at liveEq
  | reject => simp [instructionLive] at liveEq
  | increment tested next =>
      cases tested with
      | first =>
          have registerEq : register = .first := by
            simpa [instructionTested?] using testedEq.symm
          subst register
          cases firstValue with
          | zero =>
              have core := zeroLayout fuelLt
              simpa [canonical, header, dataBlock, instructionEq,
                instructionLive, instructionTested?, scale, registerSymbol,
                halfFuel, List.length_append, Nat.mul_add, Nat.add_mul,
                Nat.mul_assoc, Nat.add_assoc, Nat.add_comm,
                Nat.add_left_comm] using core
          | succ predecessor =>
              change fuel < 1 + radix predecessor + radix secondValue at fuelLt
              have fuelLt' :
                  fuel < 1 + radix secondValue + radix predecessor := by
                rw [show 1 + radix secondValue + radix predecessor =
                    1 + radix predecessor + radix secondValue by
                  simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]]
                exact fuelLt
              have core := positiveLayout (firstCount := radix secondValue)
                (secondCount := radix predecessor) fuelLt'
              simpa [canonical, header, dataBlock, instructionEq,
                instructionLive, instructionTested?, scale, registerSymbol,
                halfFuel, radix_succ, List.length_append, Nat.mul_add,
                Nat.add_mul, Nat.mul_assoc, Nat.add_assoc, Nat.add_comm,
                Nat.add_left_comm] using core
      | second =>
          have registerEq : register = .second := by
            simpa [instructionTested?] using testedEq.symm
          subst register
          cases secondValue with
          | zero =>
              have core := zeroLayout fuelLt
              simpa [canonical, header, dataBlock, instructionEq,
                instructionLive, instructionTested?, scale, registerSymbol,
                halfFuel, List.length_append, Nat.mul_add, Nat.add_mul,
                Nat.mul_assoc, Nat.add_assoc, Nat.add_comm,
                Nat.add_left_comm] using core
          | succ predecessor =>
              have core := positiveLayout fuelLt
              simpa [canonical, header, dataBlock, instructionEq,
                instructionLive, instructionTested?, scale, registerSymbol,
                halfFuel, radix_succ, List.length_append, Nat.mul_add,
                Nat.add_mul, Nat.mul_assoc, Nat.add_assoc, Nat.add_comm,
                Nat.add_left_comm] using core
  | decrementJump tested positiveNext zeroNext =>
      cases tested with
      | first =>
          have registerEq : register = .first := by
            simpa [instructionTested?] using testedEq.symm
          subst register
          cases firstValue with
          | zero =>
              have core := zeroLayout fuelLt
              simpa [canonical, header, dataBlock, instructionEq,
                instructionLive, instructionTested?, scale, registerSymbol,
                halfFuel, List.length_append, Nat.mul_add, Nat.add_mul,
                Nat.mul_assoc, Nat.add_assoc, Nat.add_comm,
                Nat.add_left_comm] using core
          | succ predecessor =>
              change fuel < 1 + radix predecessor + radix secondValue at fuelLt
              have fuelLt' :
                  fuel < 1 + radix secondValue + radix predecessor := by
                rw [show 1 + radix secondValue + radix predecessor =
                    1 + radix predecessor + radix secondValue by
                  simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]]
                exact fuelLt
              have core := positiveLayout (firstCount := radix secondValue)
                (secondCount := radix predecessor) fuelLt'
              simpa [canonical, header, dataBlock, instructionEq,
                instructionLive, instructionTested?, scale, registerSymbol,
                halfFuel, radix_succ, List.length_append, Nat.mul_add,
                Nat.add_mul, Nat.mul_assoc, Nat.add_assoc, Nat.add_comm,
                Nat.add_left_comm] using core
      | second =>
          have registerEq : register = .second := by
            simpa [instructionTested?] using testedEq.symm
          subst register
          cases secondValue with
          | zero =>
              have core := zeroLayout fuelLt
              simpa [canonical, header, dataBlock, instructionEq,
                instructionLive, instructionTested?, scale, registerSymbol,
                halfFuel, List.length_append, Nat.mul_add, Nat.add_mul,
                Nat.mul_assoc, Nat.add_assoc, Nat.add_comm,
                Nat.add_left_comm] using core
          | succ predecessor =>
              have core := positiveLayout fuelLt
              simpa [canonical, header, dataBlock, instructionEq,
                instructionLive, instructionTested?, scale, registerSymbol,
                halfFuel, radix_succ, List.length_append, Nat.mul_add,
                Nat.add_mul, Nat.mul_assoc, Nat.add_assoc, Nat.add_comm,
                Nat.add_left_comm] using core

/-- No strict prefix of the first sweep exposes the halting symbol. -/
theorem firstSweep_prefix_ne_halt
    (program : Program) (counter firstValue secondValue fuel : Nat)
    (instruction : Instruction) (register : Register)
    (instructionEq : instructionAt program counter = instruction)
    (liveEq : instructionLive instruction = true)
    (testedEq : instructionTested? instruction = some register)
    (fuelLt : fuel < halfFuel register firstValue secondValue) :
    (tagIterate (production program) fuel
      (canonical program counter firstValue secondValue)).head? ≠ some .halt := by
  simpa using tagIterate_prefix_head_ne_halt (production program) fuel
    (canonical program counter firstValue secondValue) []
    (halt_not_mem_canonical_of_live program counter firstValue secondValue
      (by simpa [instructionEq] using liveEq))
    (canonical_prefix_bound_of_tested program counter firstValue secondValue
      fuel instruction register instructionEq liveEq testedEq fuelLt)

/-- A positive lane word lasts for exactly one half-macro. -/
theorem positiveLane_prefix_ne_halt
    (program : Program) (counter firstCount secondCount fuel : Nat)
    (fuelLt : fuel < 1 + firstCount + secondCount) :
    (tagIterate (production program) fuel
      (alternativeWord counter firstCount secondCount)).head? ≠ some .halt := by
  have bound : 2 * fuel <
      (alternativeWord counter firstCount secondCount).length := by
    simp only [alternativeWord_length]
    exact Nat.mul_lt_mul_of_pos_left fuelLt (Nat.zero_lt_succ 1)
  simpa using tagIterate_prefix_head_ne_halt (production program) fuel
    (alternativeWord counter firstCount secondCount) []
    (halt_not_mem_alternativeWord counter firstCount secondCount) bound

/-- A shifted zero lane word likewise protects its nonhalting old generation
until the exact lane boundary. -/
theorem zeroLane_prefix_ne_halt
    (program : Program) (counter firstPredecessor secondCount fuel : Nat)
    (fuelLt : fuel < 2 + firstPredecessor + secondCount) :
    (tagIterate (production program) fuel
      (alternativeWord counter (firstPredecessor + 1) secondCount).tail).head?
        ≠ some .halt := by
  have bound : 2 * fuel <
      (alternativeWord counter (firstPredecessor + 1) secondCount).tail.length := by
    rw [List.length_tail, alternativeWord_length]
    have successorLe : fuel + 1 ≤ 2 + firstPredecessor + secondCount :=
      Nat.succ_le_of_lt fuelLt
    have doubled := Nat.mul_le_mul_left 2 successorLe
    have plusTwo : 2 * fuel + 1 + 1 ≤
        2 * (2 + firstPredecessor + secondCount) := by
      rw [show 2 * fuel + 1 + 1 = 2 * (fuel + 1) by
        simp [Nat.mul_add, Nat.add_assoc]]
      exact doubled
    have subBound := Nat.le_sub_of_add_le plusTwo
    exact Nat.lt_of_succ_le (by
      simpa [Nat.succ_eq_add_one, Nat.add_assoc, Nat.add_comm,
        Nat.add_left_comm] using subBound)
  simpa using tagIterate_prefix_head_ne_halt (production program) fuel
    (alternativeWord counter (firstPredecessor + 1) secondCount).tail []
    (halt_not_mem_alternativeWord_tail counter (firstPredecessor + 1)
      secondCount) bound

/-- Compose strict-prefix safety across two exact queue sweeps. -/
theorem twoPhase_prefix_ne_halt
    (table : Symbol → List Symbol) (start middle : List Symbol)
    (duration fuel : Nat)
    (firstRun : tagIterate table duration start = middle)
    (firstSafe : ∀ firstFuel, firstFuel < duration →
      (tagIterate table firstFuel start).head? ≠ some .halt)
    (secondSafe : ∀ secondFuel, secondFuel < duration →
      (tagIterate table secondFuel middle).head? ≠ some .halt)
    (fuelLt : fuel < duration + duration) :
    (tagIterate table fuel start).head? ≠ some .halt := by
  by_cases inFirst : fuel < duration
  · exact firstSafe fuel inFirst
  · have durationLe : duration ≤ fuel := Nat.le_of_not_gt inFirst
    have fuelEq : fuel = (fuel - duration) + duration :=
      (Nat.sub_add_cancel durationLe).symm
    have remainderLt : fuel - duration < duration :=
      Nat.sub_lt_left_of_lt_add durationLe fuelLt
    rw [fuelEq, tagIterate_add, firstRun]
    exact secondSafe (fuel - duration) remainderLt

/-- Every strict microstep prefix of a live source macro has a nonhalting
head; a halt can first become visible only at the next canonical boundary. -/
theorem live_macro_prefix_ne_halt
    (program : Program) (counter firstValue secondValue fuel : Nat)
    (instruction : Instruction) (register : Register)
    (instructionEq : instructionAt program counter = instruction)
    (liveEq : instructionLive instruction = true)
    (testedEq : instructionTested? instruction = some register)
    (fuelLt : fuel < macroFuel register firstValue secondValue) :
    (tagIterate (production program) fuel
      (canonical program counter firstValue secondValue)).head? ≠ some .halt := by
  cases register with
  | first =>
      cases firstValue with
      | zero =>
          simp only [macroFuel, halfFuel] at fuelLt
          apply twoPhase_prefix_ne_halt (production program)
            (canonical program counter 0 secondValue)
            (alternativeWord counter 1 (radix secondValue)).tail
            (2 + radix secondValue) fuel
            (firstSweep_first_zero_of_tested program counter secondValue
              instruction instructionEq liveEq testedEq)
          · intro firstFuel firstFuelLt
            exact firstSweep_prefix_ne_halt program counter 0 secondValue
              firstFuel instruction .first instructionEq liveEq testedEq
              firstFuelLt
          · intro secondFuel secondFuelLt
            apply zeroLane_prefix_ne_halt program counter 0
              (radix secondValue) secondFuel
            simpa using secondFuelLt
          · exact fuelLt

      | succ predecessor =>
          simp only [macroFuel, halfFuel] at fuelLt
          apply twoPhase_prefix_ne_halt (production program)
            (canonical program counter (predecessor + 1) secondValue)
            (alternativeWord counter (radix predecessor)
              (radix secondValue))
            (1 + radix predecessor + radix secondValue) fuel
            (firstSweep_first_positive_of_tested program counter predecessor
              secondValue instruction instructionEq liveEq testedEq)
          · intro firstFuel firstFuelLt
            exact firstSweep_prefix_ne_halt program counter (predecessor + 1)
              secondValue firstFuel instruction .first instructionEq liveEq
              testedEq firstFuelLt
          · intro secondFuel secondFuelLt
            exact positiveLane_prefix_ne_halt program counter
              (radix predecessor) (radix secondValue) secondFuel secondFuelLt
          · exact fuelLt
  | second =>
      cases secondValue with
      | zero =>
          simp only [macroFuel, halfFuel] at fuelLt
          obtain ⟨firstPredecessor, firstRadix⟩ := radix_is_succ firstValue
          apply twoPhase_prefix_ne_halt (production program)
            (canonical program counter firstValue 0)
            (alternativeWord counter (radix firstValue) 1).tail
            (2 + radix firstValue) fuel
            (firstSweep_second_zero_of_tested program counter firstValue
              instruction instructionEq liveEq testedEq)
          · intro firstFuel firstFuelLt
            exact firstSweep_prefix_ne_halt program counter firstValue 0
              firstFuel instruction .second instructionEq liveEq testedEq
              firstFuelLt
          · intro secondFuel secondFuelLt
            rw [firstRadix] at secondFuelLt ⊢
            apply zeroLane_prefix_ne_halt program counter firstPredecessor 1
              secondFuel
            simpa [Nat.add_assoc] using secondFuelLt
          · exact fuelLt
      | succ predecessor =>
          simp only [macroFuel, halfFuel] at fuelLt
          apply twoPhase_prefix_ne_halt (production program)
            (canonical program counter firstValue (predecessor + 1))
            (alternativeWord counter (radix firstValue)
              (radix predecessor))
            (1 + radix firstValue + radix predecessor) fuel
            (firstSweep_second_positive_of_tested program counter firstValue
              predecessor instruction instructionEq liveEq testedEq)
          · intro firstFuel firstFuelLt
            exact firstSweep_prefix_ne_halt program counter firstValue
              (predecessor + 1) firstFuel instruction .second instructionEq
              liveEq testedEq firstFuelLt
          · intro secondFuel secondFuelLt
            exact positiveLane_prefix_ne_halt program counter
              (radix firstValue) (radix predecessor) secondFuel secondFuelLt
          · exact fuelLt

/-! ## Reflection: no halting head without source acceptance -/

theorem source_run_succ_front (program : Program) (fuel : Nat)
    (state : State) :
    CounterMachine.run program (fuel + 1) state =
      CounterMachine.run program fuel (CounterMachine.step program state) := by
  induction fuel with
  | zero => rfl
  | succ fuel ih =>
      change CounterMachine.step program
          (CounterMachine.run program (fuel + 1) state) =
        CounterMachine.step program
          (CounterMachine.run program fuel
            (CounterMachine.step program state))
      exact congrArg (CounterMachine.step program) ih

/-- Pointwise negation of source acceptance from an arbitrary state. -/
def NeverAcceptsFrom (program : Program) (state : State) : Prop :=
  ∀ fuel, (CounterMachine.run program fuel state).status ≠ .accepted

theorem neverAcceptsFrom_step
    {program : Program} {state : State}
    (never : NeverAcceptsFrom program state) :
    NeverAcceptsFrom program (CounterMachine.step program state) := by
  intro fuel
  rw [← source_run_succ_front]
  exact never (fuel + 1)

/-- If the source never accepts from a canonical boundary, no typed tag
microstep can expose the halting head. -/
theorem tagIterate_head_ne_halt_of_neverAccepts (program : Program) :
    ∀ fuel state,
      NeverAcceptsFrom program state →
      (tagIterate (production program) fuel
        (encodeState program state)).head? ≠ some .halt := by
  intro fuel
  induction fuel using Nat.strongRecOn with
  | ind fuel ih =>
      intro state never
      rcases state with ⟨counter, firstValue, secondValue, status⟩
      cases status with
      | accepted =>
          exact False.elim (never 0 rfl)
      | rejected =>
          simpa [encodeState] using congrArg List.head?
            (tagIterate_sink program fuel)
      | running =>
          cases instructionEq : instructionAt program counter with
          | accept =>
              have acceptedAtOne :
                  (CounterMachine.run program 1
                    ⟨counter, firstValue, secondValue, .running⟩).status =
                    .accepted := by
                simp [CounterMachine.run, CounterMachine.step, instructionEq]
              exact False.elim (never 1 acceptedAtOne)
          | reject =>
              have encodedSink : encodeState program
                    ⟨counter, firstValue, secondValue, .running⟩ =
                  [.sink, .sink] := by
                simp [encodeState, canonical, header, dataBlock,
                  instructionEq, instructionLive]
              rw [encodedSink, tagIterate_sink]
              simp
          | increment register next =>
              let duration := macroFuel register firstValue secondValue
              by_cases fuelLt : fuel < duration
              · exact live_macro_prefix_ne_halt program counter firstValue
                  secondValue fuel (.increment register next) register
                  instructionEq rfl rfl fuelLt
              · have durationLe : duration ≤ fuel := Nat.le_of_not_gt fuelLt
                have durationPositive : 0 < duration :=
                  macroFuel_positive register firstValue secondValue
                have remainderLt : fuel - duration < fuel :=
                  Nat.sub_lt
                    (Nat.lt_of_lt_of_le durationPositive durationLe)
                    durationPositive
                have fuelEq : fuel = (fuel - duration) + duration :=
                  (Nat.sub_add_cancel durationLe).symm
                rw [fuelEq, tagIterate_add]
                simp only [encodeState]
                cases register with
                | first =>
                    rw [show duration = macroFuel .first firstValue secondValue
                      from rfl]
                    rw [macro_increment_first program counter next firstValue
                      secondValue instructionEq]
                    have nextSafe := ih (fuel - duration) remainderLt
                      (CounterMachine.step program
                        ⟨counter, firstValue, secondValue, .running⟩)
                      (neverAcceptsFrom_step never)
                    cases firstValue <;>
                      simpa [encodeState, CounterMachine.step, instructionEq,
                        CounterMachine.write, CounterMachine.read] using nextSafe
                | second =>
                    rw [show duration = macroFuel .second firstValue secondValue
                      from rfl]
                    rw [macro_increment_second program counter next firstValue
                      secondValue instructionEq]
                    have nextSafe := ih (fuel - duration) remainderLt
                      (CounterMachine.step program
                        ⟨counter, firstValue, secondValue, .running⟩)
                      (neverAcceptsFrom_step never)
                    cases secondValue <;>
                      simpa [encodeState, CounterMachine.step, instructionEq,
                        CounterMachine.write, CounterMachine.read] using nextSafe
          | decrementJump register positiveNext zeroNext =>
              let duration := macroFuel register firstValue secondValue
              by_cases fuelLt : fuel < duration
              · exact live_macro_prefix_ne_halt program counter firstValue
                  secondValue fuel
                  (.decrementJump register positiveNext zeroNext) register
                  instructionEq rfl rfl fuelLt
              · have durationLe : duration ≤ fuel := Nat.le_of_not_gt fuelLt
                have durationPositive : 0 < duration :=
                  macroFuel_positive register firstValue secondValue
                have remainderLt : fuel - duration < fuel :=
                  Nat.sub_lt
                    (Nat.lt_of_lt_of_le durationPositive durationLe)
                    durationPositive
                have fuelEq : fuel = (fuel - duration) + duration :=
                  (Nat.sub_add_cancel durationLe).symm
                rw [fuelEq, tagIterate_add]
                simp only [encodeState]
                cases register with
                | first =>
                    rw [show duration = macroFuel .first firstValue secondValue
                      from rfl]
                    rw [macro_decrement_first program counter positiveNext
                      zeroNext firstValue secondValue instructionEq]
                    have nextSafe := ih (fuel - duration) remainderLt
                      (CounterMachine.step program
                        ⟨counter, firstValue, secondValue, .running⟩)
                      (neverAcceptsFrom_step never)
                    cases firstValue <;>
                      simpa [encodeState, CounterMachine.step, instructionEq,
                        CounterMachine.write, CounterMachine.read] using nextSafe
                | second =>
                    rw [show duration = macroFuel .second firstValue secondValue
                      from rfl]
                    rw [macro_decrement_second program counter positiveNext
                      zeroNext firstValue secondValue instructionEq]
                    have nextSafe := ih (fuel - duration) remainderLt
                      (CounterMachine.step program
                        ⟨counter, firstValue, secondValue, .running⟩)
                      (neverAcceptsFrom_step never)
                    cases secondValue <;>
                      simpa [encodeState, CounterMachine.step, instructionEq,
                        CounterMachine.write, CounterMachine.read] using nextSafe

/-- Eventual typed halt-head exposure from the canonical input. -/
def TypedEventuallyHalts (program : Program) (input : Nat) : Prop :=
  ∃ fuel,
    (tagIterate (production program) fuel
      (encodeState program (CounterMachine.initial input))).head? = some .halt

/-- Constructive reflection of a typed halt head back to a finite accepting
source run.  The induction consumes one exact live-instruction macro whenever
the observed tag time lies beyond the current strict prefix. -/
theorem tagIterate_head_halt_reflects_acceptance (program : Program) :
    ∀ fuel state,
      (tagIterate (production program) fuel
        (encodeState program state)).head? = some .halt →
      ∃ sourceFuel,
        (CounterMachine.run program sourceFuel state).status = .accepted := by
  intro fuel
  induction fuel using Nat.strongRecOn with
  | ind fuel ih =>
      intro state haltHead
      rcases state with ⟨counter, firstValue, secondValue, status⟩
      cases status with
      | accepted =>
          exact ⟨0, rfl⟩
      | rejected =>
          rw [show encodeState program
              ⟨counter, firstValue, secondValue, .rejected⟩ =
                [.sink, .sink] by rfl,
            tagIterate_sink] at haltHead
          simp at haltHead
      | running =>
          let current : State :=
            ⟨counter, firstValue, secondValue, .running⟩
          have reflectLiveMacro
              (duration : Nat)
              (durationPositive : 0 < duration)
              (prefixSafe : ∀ prefixFuel, prefixFuel < duration →
                (tagIterate (production program) prefixFuel
                  (encodeState program current)).head? ≠ some .halt)
              (boundary :
                tagIterate (production program) duration
                    (encodeState program current) =
                  encodeState program (CounterMachine.step program current)) :
              ∃ sourceFuel,
                (CounterMachine.run program sourceFuel current).status =
                  .accepted := by
            by_cases fuelLt : fuel < duration
            · exact False.elim (prefixSafe fuel fuelLt haltHead)
            · have durationLe : duration ≤ fuel := Nat.le_of_not_gt fuelLt
              have remainderLt : fuel - duration < fuel :=
                Nat.sub_lt
                  (Nat.lt_of_lt_of_le durationPositive durationLe)
                  durationPositive
              have fuelEq : fuel = (fuel - duration) + duration :=
                (Nat.sub_add_cancel durationLe).symm
              have nextHalt :
                  (tagIterate (production program) (fuel - duration)
                    (encodeState program
                      (CounterMachine.step program current))).head? =
                    some .halt := by
                rw [fuelEq, tagIterate_add, boundary] at haltHead
                exact haltHead
              obtain ⟨nextFuel, nextAccepts⟩ :=
                ih (fuel - duration) remainderLt
                  (CounterMachine.step program current) nextHalt
              refine ⟨nextFuel + 1, ?_⟩
              rw [source_run_succ_front]
              exact nextAccepts
          cases instructionEq : instructionAt program counter with
          | accept =>
              refine ⟨1, ?_⟩
              simp [CounterMachine.run, CounterMachine.step, instructionEq]
          | reject =>
              have encodedSink : encodeState program current =
                  [.sink, .sink] := by
                simp [current, encodeState, canonical, header, dataBlock,
                  instructionEq, instructionLive]
              rw [encodedSink, tagIterate_sink] at haltHead
              simp at haltHead
          | increment register next =>
              cases register with
              | first =>
                  apply reflectLiveMacro
                    (macroFuel .first firstValue secondValue)
                    (macroFuel_positive .first firstValue secondValue)
                  · intro prefixFuel prefixLt
                    exact live_macro_prefix_ne_halt program counter firstValue
                      secondValue prefixFuel (.increment .first next) .first
                      instructionEq rfl rfl prefixLt
                  · simpa [current, encodeState, CounterMachine.step,
                      instructionEq, CounterMachine.write,
                      CounterMachine.read] using
                      macro_increment_first program counter next firstValue
                        secondValue instructionEq
              | second =>
                  apply reflectLiveMacro
                    (macroFuel .second firstValue secondValue)
                    (macroFuel_positive .second firstValue secondValue)
                  · intro prefixFuel prefixLt
                    exact live_macro_prefix_ne_halt program counter firstValue
                      secondValue prefixFuel (.increment .second next) .second
                      instructionEq rfl rfl prefixLt
                  · simpa [current, encodeState, CounterMachine.step,
                      instructionEq, CounterMachine.write,
                      CounterMachine.read] using
                      macro_increment_second program counter next firstValue
                        secondValue instructionEq
          | decrementJump register positiveNext zeroNext =>
              cases register with
              | first =>
                  apply reflectLiveMacro
                    (macroFuel .first firstValue secondValue)
                    (macroFuel_positive .first firstValue secondValue)
                  · intro prefixFuel prefixLt
                    exact live_macro_prefix_ne_halt program counter firstValue
                      secondValue prefixFuel
                      (.decrementJump .first positiveNext zeroNext) .first
                      instructionEq rfl rfl prefixLt
                  · cases firstValue with
                    | zero =>
                        simpa [current, encodeState, CounterMachine.step,
                          instructionEq, CounterMachine.write,
                          CounterMachine.read] using
                          macro_decrement_first program counter positiveNext
                            zeroNext 0 secondValue instructionEq
                    | succ predecessor =>
                        simpa [current, encodeState, CounterMachine.step,
                          instructionEq, CounterMachine.write,
                          CounterMachine.read] using
                          macro_decrement_first program counter positiveNext
                            zeroNext (predecessor + 1) secondValue instructionEq
              | second =>
                  apply reflectLiveMacro
                    (macroFuel .second firstValue secondValue)
                    (macroFuel_positive .second firstValue secondValue)
                  · intro prefixFuel prefixLt
                    exact live_macro_prefix_ne_halt program counter firstValue
                      secondValue prefixFuel
                      (.decrementJump .second positiveNext zeroNext) .second
                      instructionEq rfl rfl prefixLt
                  · cases secondValue with
                    | zero =>
                        simpa [current, encodeState, CounterMachine.step,
                          instructionEq, CounterMachine.write,
                          CounterMachine.read] using
                          macro_decrement_second program counter positiveNext
                            zeroNext firstValue 0 instructionEq
                    | succ predecessor =>
                        simpa [current, encodeState, CounterMachine.step,
                          instructionEq, CounterMachine.write,
                          CounterMachine.read] using
                          macro_decrement_second program counter positiveNext
                            zeroNext firstValue (predecessor + 1) instructionEq

/-- The reverse implication needed by the typed compiler theorem, without
excluded middle on an unbounded source acceptance proposition. -/
theorem typedEventuallyHalts_implies_accepts_constructive
    (program : Program) (input : Nat) :
    TypedEventuallyHalts program input → CounterMachine.Accepts program input := by
  rintro ⟨tagFuel, haltHead⟩
  obtain ⟨sourceFuel, acceptedStatus⟩ :=
    tagIterate_head_halt_reflects_acceptance program tagFuel
      (CounterMachine.initial input) haltHead
  refine ⟨sourceFuel, ?_⟩
  unfold CounterMachine.acceptsWithin
  rw [acceptedStatus]

/-- The typed deletion-two construction halts exactly on accepted source
inputs. -/
theorem accepts_iff_typedEventuallyHalts (program : Program) (input : Nat) :
    CounterMachine.Accepts program input ↔
      TypedEventuallyHalts program input := by
  constructor
  · rintro ⟨sourceFuel, accepts⟩
    have acceptedStatus :
        (CounterMachine.run program sourceFuel
          (CounterMachine.initial input)).status = .accepted := by
      unfold CounterMachine.acceptsWithin at accepts
      split at accepts <;> simp_all
    obtain ⟨tagFuel, tagRun⟩ := encodeState_run program
      (CounterMachine.initial input) sourceFuel
    refine ⟨tagFuel, ?_⟩
    rw [tagRun]
    cases finalState : CounterMachine.run program sourceFuel
      (CounterMachine.initial input) with
    | mk counter firstValue secondValue status =>
        simp_all [encodeState]
  · exact typedEventuallyHalts_implies_accepts_constructive program input

/-! ## Finite numerical enumeration -/

namespace Numeric

abbrev TagProgram := RogozhinTagInput.Program

/-- The ten indexed symbol families and two global live symbols; the next
label is the designated ordinary tag halt symbol. -/
def ordinaryCount (program : Program) : Nat := 10 * program.length + 2

/-- Executable enumeration of every typed symbol used by a compiled job. -/
def encodeSymbol (program : Program) : Symbol → Nat
  | .head counter => counter
  | .filler counter => program.length + counter
  | .first counter => 2 * program.length + counter
  | .second counter => 3 * program.length + counter
  | .selectPositive counter => 4 * program.length + counter
  | .selectZero counter => 5 * program.length + counter
  | .firstPositive counter => 6 * program.length + counter
  | .firstZero counter => 7 * program.length + counter
  | .secondPositive counter => 8 * program.length + counter
  | .secondZero counter => 9 * program.length + counter
  | .sacrificial => 10 * program.length
  | .sink => 10 * program.length + 1
  | .halt => 10 * program.length + 2

/-- Total inverse used to generate the finite production table. -/
def decodeSymbol (program : Program) (label : Nat) : Symbol :=
  let count := program.length
  if label < count then .head label
  else if label < 2 * count then .filler (label - count)
  else if label < 3 * count then .first (label - 2 * count)
  else if label < 4 * count then .second (label - 3 * count)
  else if label < 5 * count then .selectPositive (label - 4 * count)
  else if label < 6 * count then .selectZero (label - 5 * count)
  else if label < 7 * count then .firstPositive (label - 6 * count)
  else if label < 8 * count then .firstZero (label - 7 * count)
  else if label < 9 * count then .secondPositive (label - 8 * count)
  else if label < 10 * count then .secondZero (label - 9 * count)
  else if label = 10 * count then .sacrificial
  else .sink

/-- Indexed constructors only occur with a genuine source-table index. -/
def Bounded (program : Program) : Symbol → Prop
  | .head counter | .filler counter | .first counter | .second counter
  | .selectPositive counter | .selectZero counter
  | .firstPositive counter | .firstZero counter
  | .secondPositive counter | .secondZero counter => counter < program.length
  | .sacrificial | .sink | .halt => True

/-- A payload inside block `block` lies before the next block boundary. -/
theorem block_lt_next (count counter block : Nat) (bounded : counter < count) :
    block * count + counter < (block + 1) * count := by
  rw [Nat.add_mul, Nat.one_mul]
  exact Nat.add_lt_add_left bounded (block * count)

/-- No point in block `block` lies before an earlier block boundary. -/
theorem block_not_lt_of_le (count counter block earlier : Nat)
    (earlierLe : earlier ≤ block) :
    ¬(block * count + counter < earlier * count) := by
  apply Nat.not_lt_of_ge
  exact Nat.le_trans (Nat.mul_le_mul_right count earlierLe)
    (Nat.le_add_right (block * count) counter)

/-- Removing a block prefix from a point before the next boundary leaves a
payload strictly below the block width. -/
theorem block_sub_lt_count (label count block : Nat)
    (lower : block * count ≤ label)
    (upper : label < (block + 1) * count) :
    label - block * count < count := by
  apply Nat.sub_lt_left_of_lt_add lower
  simpa [Nat.add_mul] using upper

/-- Every indexed family block lies below the two global live labels. -/
theorem block_lt_ordinaryCount (count counter block : Nat)
    (bounded : counter < count) (blockSuccLe : block + 1 ≤ 10) :
    block * count + counter < 10 * count + 2 := by
  have beforeNext := block_lt_next count counter block bounded
  have nextLeTen := Nat.mul_le_mul_right count blockSuccLe
  exact Nat.lt_add_right 2 (Nat.lt_of_lt_of_le beforeNext nextLeTen)

theorem encodeSymbol_lt_count_of_ne_halt
    {program : Program} {symbol : Symbol}
    (bounded : Bounded program symbol) (notHalt : symbol ≠ .halt) :
    encodeSymbol program symbol < ordinaryCount program := by
  cases symbol with
  | head counter =>
      simpa [encodeSymbol, ordinaryCount] using
        block_lt_ordinaryCount program.length counter 0 bounded (by decide)
  | filler counter =>
      simpa [encodeSymbol, ordinaryCount] using
        block_lt_ordinaryCount program.length counter 1 bounded (by decide)
  | first counter =>
      simpa [encodeSymbol, ordinaryCount] using
        block_lt_ordinaryCount program.length counter 2 bounded (by decide)
  | second counter =>
      simpa [encodeSymbol, ordinaryCount] using
        block_lt_ordinaryCount program.length counter 3 bounded (by decide)
  | selectPositive counter =>
      simpa [encodeSymbol, ordinaryCount] using
        block_lt_ordinaryCount program.length counter 4 bounded (by decide)
  | selectZero counter =>
      simpa [encodeSymbol, ordinaryCount] using
        block_lt_ordinaryCount program.length counter 5 bounded (by decide)
  | firstPositive counter =>
      simpa [encodeSymbol, ordinaryCount] using
        block_lt_ordinaryCount program.length counter 6 bounded (by decide)
  | firstZero counter =>
      simpa [encodeSymbol, ordinaryCount] using
        block_lt_ordinaryCount program.length counter 7 bounded (by decide)
  | secondPositive counter =>
      simpa [encodeSymbol, ordinaryCount] using
        block_lt_ordinaryCount program.length counter 8 bounded (by decide)
  | secondZero counter =>
      simpa [encodeSymbol, ordinaryCount] using
        block_lt_ordinaryCount program.length counter 9 bounded (by decide)
  | sacrificial =>
      simpa [encodeSymbol, ordinaryCount] using
        (Nat.lt_add_of_pos_right (n := 10 * program.length)
          (Nat.zero_lt_succ 1))
  | sink =>
      simpa [encodeSymbol, ordinaryCount] using
        (Nat.lt_succ_self (10 * program.length + 1))
  | halt => exact False.elim (notHalt rfl)

theorem encodeSymbol_le_count
    {program : Program} {symbol : Symbol}
    (bounded : Bounded program symbol) :
    encodeSymbol program symbol ≤ ordinaryCount program := by
  cases symbol with
  | head counter =>
      exact Nat.le_of_lt
        (encodeSymbol_lt_count_of_ne_halt bounded (by simp))
  | filler counter =>
      exact Nat.le_of_lt
        (encodeSymbol_lt_count_of_ne_halt bounded (by simp))
  | first counter =>
      exact Nat.le_of_lt
        (encodeSymbol_lt_count_of_ne_halt bounded (by simp))
  | second counter =>
      exact Nat.le_of_lt
        (encodeSymbol_lt_count_of_ne_halt bounded (by simp))
  | selectPositive counter =>
      exact Nat.le_of_lt
        (encodeSymbol_lt_count_of_ne_halt bounded (by simp))
  | selectZero counter =>
      exact Nat.le_of_lt
        (encodeSymbol_lt_count_of_ne_halt bounded (by simp))
  | firstPositive counter =>
      exact Nat.le_of_lt
        (encodeSymbol_lt_count_of_ne_halt bounded (by simp))
  | firstZero counter =>
      exact Nat.le_of_lt
        (encodeSymbol_lt_count_of_ne_halt bounded (by simp))
  | secondPositive counter =>
      exact Nat.le_of_lt
        (encodeSymbol_lt_count_of_ne_halt bounded (by simp))
  | secondZero counter =>
      exact Nat.le_of_lt
        (encodeSymbol_lt_count_of_ne_halt bounded (by simp))
  | sacrificial =>
      exact Nat.le_of_lt
        (encodeSymbol_lt_count_of_ne_halt bounded (by simp))
  | sink =>
      exact Nat.le_of_lt
        (encodeSymbol_lt_count_of_ne_halt bounded (by simp))
  | halt => exact Nat.le_refl _

theorem decode_encode
    {program : Program} {symbol : Symbol}
    (bounded : Bounded program symbol) (notHalt : symbol ≠ .halt) :
    decodeSymbol program (encodeSymbol program symbol) = symbol := by
  cases symbol with
  | head counter =>
      simp [Bounded] at bounded
      simp [decodeSymbol, encodeSymbol, bounded]
  | filler counter =>
      change counter < program.length at bounded
      have h0 : ¬(program.length + counter < program.length) := by
        simpa using block_not_lt_of_le program.length counter 1 1
          (Nat.le_refl 1)
      have h1 : program.length + counter < 2 * program.length := by
        simpa using block_lt_next program.length counter 1 bounded
      simp [decodeSymbol, encodeSymbol, h0, h1]
  | first counter =>
      change counter < program.length at bounded
      have h0 : ¬(2 * program.length + counter < program.length) := by
        simpa using block_not_lt_of_le program.length counter 2 1 (by decide)
      have h1 : ¬(2 * program.length + counter < 2 * program.length) := by
        simpa using block_not_lt_of_le program.length counter 2 2
          (Nat.le_refl 2)
      have h2 : 2 * program.length + counter < 3 * program.length := by
        simpa using block_lt_next program.length counter 2 bounded
      simp [decodeSymbol, encodeSymbol, h0, h1, h2]
  | second counter =>
      change counter < program.length at bounded
      have h0 : ¬(3 * program.length + counter < program.length) := by
        simpa using block_not_lt_of_le program.length counter 3 1 (by decide)
      have h1 : ¬(3 * program.length + counter < 2 * program.length) := by
        simpa using block_not_lt_of_le program.length counter 3 2 (by decide)
      have h2 : ¬(3 * program.length + counter < 3 * program.length) := by
        simpa using block_not_lt_of_le program.length counter 3 3
          (Nat.le_refl 3)
      have h3 : 3 * program.length + counter < 4 * program.length := by
        simpa using block_lt_next program.length counter 3 bounded
      simp [decodeSymbol, encodeSymbol, h0, h1, h2, h3]
  | selectPositive counter =>
      change counter < program.length at bounded
      have h0 : ¬(4 * program.length + counter < program.length) := by
        simpa using block_not_lt_of_le program.length counter 4 1 (by decide)
      have h1 : ¬(4 * program.length + counter < 2 * program.length) := by
        simpa using block_not_lt_of_le program.length counter 4 2 (by decide)
      have h2 : ¬(4 * program.length + counter < 3 * program.length) := by
        simpa using block_not_lt_of_le program.length counter 4 3 (by decide)
      have h3 : ¬(4 * program.length + counter < 4 * program.length) := by
        simpa using block_not_lt_of_le program.length counter 4 4
          (Nat.le_refl 4)
      have h4 : 4 * program.length + counter < 5 * program.length := by
        simpa using block_lt_next program.length counter 4 bounded
      simp [decodeSymbol, encodeSymbol, h0, h1, h2, h3, h4]
  | selectZero counter =>
      change counter < program.length at bounded
      have h0 : ¬(5 * program.length + counter < program.length) := by
        simpa using block_not_lt_of_le program.length counter 5 1 (by decide)
      have h1 : ¬(5 * program.length + counter < 2 * program.length) := by
        simpa using block_not_lt_of_le program.length counter 5 2 (by decide)
      have h2 : ¬(5 * program.length + counter < 3 * program.length) := by
        simpa using block_not_lt_of_le program.length counter 5 3 (by decide)
      have h3 : ¬(5 * program.length + counter < 4 * program.length) := by
        simpa using block_not_lt_of_le program.length counter 5 4 (by decide)
      have h4 : ¬(5 * program.length + counter < 5 * program.length) := by
        simpa using block_not_lt_of_le program.length counter 5 5
          (Nat.le_refl 5)
      have h5 : 5 * program.length + counter < 6 * program.length := by
        simpa using block_lt_next program.length counter 5 bounded
      simp [decodeSymbol, encodeSymbol, h0, h1, h2, h3, h4, h5]
  | firstPositive counter =>
      change counter < program.length at bounded
      have h0 : ¬(6 * program.length + counter < program.length) := by
        simpa using block_not_lt_of_le program.length counter 6 1 (by decide)
      have h1 : ¬(6 * program.length + counter < 2 * program.length) := by
        simpa using block_not_lt_of_le program.length counter 6 2 (by decide)
      have h2 : ¬(6 * program.length + counter < 3 * program.length) := by
        simpa using block_not_lt_of_le program.length counter 6 3 (by decide)
      have h3 : ¬(6 * program.length + counter < 4 * program.length) := by
        simpa using block_not_lt_of_le program.length counter 6 4 (by decide)
      have h4 : ¬(6 * program.length + counter < 5 * program.length) := by
        simpa using block_not_lt_of_le program.length counter 6 5 (by decide)
      have h5 : ¬(6 * program.length + counter < 6 * program.length) := by
        simpa using block_not_lt_of_le program.length counter 6 6
          (Nat.le_refl 6)
      have h6 : 6 * program.length + counter < 7 * program.length := by
        simpa using block_lt_next program.length counter 6 bounded
      simp [decodeSymbol, encodeSymbol, h0, h1, h2, h3, h4, h5, h6]
  | firstZero counter =>
      change counter < program.length at bounded
      have h0 : ¬(7 * program.length + counter < program.length) := by
        simpa using block_not_lt_of_le program.length counter 7 1 (by decide)
      have h1 : ¬(7 * program.length + counter < 2 * program.length) := by
        simpa using block_not_lt_of_le program.length counter 7 2 (by decide)
      have h2 : ¬(7 * program.length + counter < 3 * program.length) := by
        simpa using block_not_lt_of_le program.length counter 7 3 (by decide)
      have h3 : ¬(7 * program.length + counter < 4 * program.length) := by
        simpa using block_not_lt_of_le program.length counter 7 4 (by decide)
      have h4 : ¬(7 * program.length + counter < 5 * program.length) := by
        simpa using block_not_lt_of_le program.length counter 7 5 (by decide)
      have h5 : ¬(7 * program.length + counter < 6 * program.length) := by
        simpa using block_not_lt_of_le program.length counter 7 6 (by decide)
      have h6 : ¬(7 * program.length + counter < 7 * program.length) := by
        simpa using block_not_lt_of_le program.length counter 7 7
          (Nat.le_refl 7)
      have h7 : 7 * program.length + counter < 8 * program.length := by
        simpa using block_lt_next program.length counter 7 bounded
      simp [decodeSymbol, encodeSymbol, h0, h1, h2, h3, h4, h5, h6, h7]
  | secondPositive counter =>
      change counter < program.length at bounded
      have h0 : ¬(8 * program.length + counter < program.length) := by
        simpa using block_not_lt_of_le program.length counter 8 1 (by decide)
      have h1 : ¬(8 * program.length + counter < 2 * program.length) := by
        simpa using block_not_lt_of_le program.length counter 8 2 (by decide)
      have h2 : ¬(8 * program.length + counter < 3 * program.length) := by
        simpa using block_not_lt_of_le program.length counter 8 3 (by decide)
      have h3 : ¬(8 * program.length + counter < 4 * program.length) := by
        simpa using block_not_lt_of_le program.length counter 8 4 (by decide)
      have h4 : ¬(8 * program.length + counter < 5 * program.length) := by
        simpa using block_not_lt_of_le program.length counter 8 5 (by decide)
      have h5 : ¬(8 * program.length + counter < 6 * program.length) := by
        simpa using block_not_lt_of_le program.length counter 8 6 (by decide)
      have h6 : ¬(8 * program.length + counter < 7 * program.length) := by
        simpa using block_not_lt_of_le program.length counter 8 7 (by decide)
      have h7 : ¬(8 * program.length + counter < 8 * program.length) := by
        simpa using block_not_lt_of_le program.length counter 8 8
          (Nat.le_refl 8)
      have h8 : 8 * program.length + counter < 9 * program.length := by
        simpa using block_lt_next program.length counter 8 bounded
      simp [decodeSymbol, encodeSymbol, h0, h1, h2, h3, h4, h5, h6, h7, h8]
  | secondZero counter =>
      change counter < program.length at bounded
      have h0 : ¬(9 * program.length + counter < program.length) := by
        simpa using block_not_lt_of_le program.length counter 9 1 (by decide)
      have h1 : ¬(9 * program.length + counter < 2 * program.length) := by
        simpa using block_not_lt_of_le program.length counter 9 2 (by decide)
      have h2 : ¬(9 * program.length + counter < 3 * program.length) := by
        simpa using block_not_lt_of_le program.length counter 9 3 (by decide)
      have h3 : ¬(9 * program.length + counter < 4 * program.length) := by
        simpa using block_not_lt_of_le program.length counter 9 4 (by decide)
      have h4 : ¬(9 * program.length + counter < 5 * program.length) := by
        simpa using block_not_lt_of_le program.length counter 9 5 (by decide)
      have h5 : ¬(9 * program.length + counter < 6 * program.length) := by
        simpa using block_not_lt_of_le program.length counter 9 6 (by decide)
      have h6 : ¬(9 * program.length + counter < 7 * program.length) := by
        simpa using block_not_lt_of_le program.length counter 9 7 (by decide)
      have h7 : ¬(9 * program.length + counter < 8 * program.length) := by
        simpa using block_not_lt_of_le program.length counter 9 8 (by decide)
      have h8 : ¬(9 * program.length + counter < 9 * program.length) := by
        simpa using block_not_lt_of_le program.length counter 9 9
          (Nat.le_refl 9)
      have h9 : 9 * program.length + counter < 10 * program.length := by
        simpa using block_lt_next program.length counter 9 bounded
      simp [decodeSymbol, encodeSymbol, h0, h1, h2, h3, h4, h5, h6, h7, h8, h9]
  | sacrificial =>
      have before : ∀ k, k ≤ 10 →
          ¬(10 * program.length < k * program.length) := by
        intro k kLe
        exact Nat.not_lt_of_ge (Nat.mul_le_mul_right program.length kLe)
      have countLe : program.length ≤ 10 * program.length := by
        simpa using Nat.mul_le_mul_right program.length (show 1 ≤ 10 by decide)
      simp [decodeSymbol, encodeSymbol, before, countLe]
  | sink =>
      have before : ∀ k, k ≤ 10 →
          ¬(10 * program.length + 1 < k * program.length) := by
        intro k kLe
        exact Nat.not_lt_of_ge (Nat.le_trans
          (Nat.mul_le_mul_right program.length kLe)
          (Nat.le_add_right (10 * program.length) 1))
      have h0 : ¬(10 * program.length + 1 < program.length) := by
        simpa using before 1 (by decide)
      have h1 := before 2 (by decide)
      have h2 := before 3 (by decide)
      have h3 := before 4 (by decide)
      have h4 := before 5 (by decide)
      have h5 := before 6 (by decide)
      have h6 := before 7 (by decide)
      have h7 := before 8 (by decide)
      have h8 := before 9 (by decide)
      have h9 := before 10 (by decide)
      have hEq : 10 * program.length + 1 ≠ 10 * program.length :=
        Nat.ne_of_gt (Nat.lt_succ_self (10 * program.length))
      simp only [decodeSymbol, encodeSymbol, h0, h1, h2, h3, h4, h5, h6,
        h7, h8, h9, hEq, ↓reduceIte]
  | halt => exact False.elim (notHalt rfl)

def numericRhs (program : Program) (symbol : Symbol) : List Nat :=
  (production program symbol).map (encodeSymbol program)

/-- Finite ordinary deletion-two program generated from the source table. -/
def ordinaryProgram (program : Program) : TagProgram where
  productions := (List.range (ordinaryCount program)).map fun label =>
    numericRhs program (decodeSymbol program label)

@[simp]
theorem ordinaryProgram_symbolCount (program : Program) :
    RogozhinTagInput.symbolCount (ordinaryProgram program) =
      ordinaryCount program := by
  simp [RogozhinTagInput.symbolCount, ordinaryProgram]

@[simp]
theorem ordinaryProgram_haltLabel (program : Program) :
    RogozhinTagInput.haltLabel (ordinaryProgram program) =
      ordinaryCount program := by
  simp [RogozhinTagInput.haltLabel]

/-- Lookup in the generated finite table is literal decoding. -/
theorem productionAt_of_lt (program : Program) (label : Nat)
    (labelLt : label < ordinaryCount program) :
    RogozhinTagInput.productionAt (ordinaryProgram program) label =
      numericRhs program (decodeSymbol program label) := by
  simp [RogozhinTagInput.productionAt, ordinaryProgram, labelLt]

/-- Generated lookup at every bounded typed symbol reproduces its numerical
right-hand side. -/
theorem productionAt_encode
    {program : Program} {symbol : Symbol}
    (bounded : Bounded program symbol) (notHalt : symbol ≠ .halt) :
    RogozhinTagInput.productionAt (ordinaryProgram program)
        (encodeSymbol program symbol) = numericRhs program symbol := by
  rw [productionAt_of_lt program (encodeSymbol program symbol)
    (encodeSymbol_lt_count_of_ne_halt bounded notHalt),
    decode_encode bounded notHalt]

/-- Pointwise encoding of a typed queue. -/
def encodeWord (program : Program) (word : List Symbol) : List Nat :=
  word.map (encodeSymbol program)

/-- Out-of-table counter labels take the rejecting default. -/
theorem instructionAt_eq_reject_of_length_le :
    ∀ (program : Program) (counter : Nat),
      program.length ≤ counter → instructionAt program counter = .reject
  | [], counter, _ => rfl
  | _ :: rest, 0, bound => by simp at bound
  | _ :: rest, counter + 1, bound => by
      apply instructionAt_eq_reject_of_length_le rest counter
      simp only [List.length_cons] at bound
      exact Nat.le_of_succ_le_succ bound

theorem index_lt_of_instructionLive
    {program : Program} {counter : Nat}
    (live : instructionLive (instructionAt program counter) = true) :
    counter < program.length := by
  by_cases counterLt : counter < program.length
  · exact counterLt
  · have defaultReject := instructionAt_eq_reject_of_length_le program counter
      (Nat.le_of_not_gt counterLt)
    simp [defaultReject, instructionLive] at live

/-- All indexed symbols in a typed queue use genuine source-table labels. -/
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
  exact False.elim (by simpa using membership)

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
  rcases List.mem_replicate.mp membership with ⟨_, memberEq⟩
  rw [memberEq]
  exact bounded

theorem header_wordBounded (program : Program) (counter : Nat) :
    WordBounded program (header program counter) := by
  cases instructionEq : instructionAt program counter with
  | accept =>
      unfold header
      rw [instructionEq]
      exact wordBounded_pair (by trivial) (by trivial)
  | reject =>
      unfold header
      rw [instructionEq]
      exact wordBounded_pair (by trivial) (by trivial)
  | increment register next =>
      have counterLt := index_lt_of_instructionLive
        (program := program) (counter := counter)
        (by simp [instructionEq, instructionLive])
      unfold header
      rw [instructionEq]
      apply wordBounded_pair
      · change counter < program.length
        exact counterLt
      · change counter < program.length
        exact counterLt
  | decrementJump register positiveNext zeroNext =>
      have counterLt := index_lt_of_instructionLive
        (program := program) (counter := counter)
        (by simp [instructionEq, instructionLive])
      unfold header
      rw [instructionEq]
      apply wordBounded_pair
      · change counter < program.length
        exact counterLt
      · change counter < program.length
        exact counterLt

theorem laneOutput_wordBounded (program : Program) (counter : Nat)
    (register : Register) (positive : Bool) :
    WordBounded program (laneOutput program counter register positive) := by
  unfold laneOutput
  let next := branchNext (instructionAt program counter) positive
  cases nextInstruction : instructionAt program next with
  | accept =>
      intro symbol membership
      have multZero :
          laneMultiplicity program counter register positive = 0 := by
        simp [laneMultiplicity, next, nextInstruction, instructionLive]
      rw [multZero] at membership
      simp at membership
  | reject =>
      intro symbol membership
      have multZero :
          laneMultiplicity program counter register positive = 0 := by
        simp [laneMultiplicity, next, nextInstruction, instructionLive]
      rw [multZero] at membership
      simp at membership
  | increment nextRegister following =>
      have nextLt := index_lt_of_instructionLive
        (program := program) (counter := next)
        (by simp [nextInstruction, instructionLive])
      intro symbol membership
      change symbol ∈ List.replicate _
        (registerSymbol register next) at membership
      simp only [List.mem_replicate] at membership
      rcases membership with ⟨_, rfl⟩
      cases register <;> simpa [Bounded, registerSymbol, next] using nextLt
  | decrementJump nextRegister positiveNext zeroNext =>
      have nextLt := index_lt_of_instructionLive
        (program := program) (counter := next)
        (by simp [nextInstruction, instructionLive])
      intro symbol membership
      change symbol ∈ List.replicate _
        (registerSymbol register next) at membership
      simp only [List.mem_replicate] at membership
      rcases membership with ⟨_, rfl⟩
      cases register <;> simpa [Bounded, registerSymbol, next] using nextLt

theorem production_wordBounded
    {program : Program} {symbol : Symbol}
    (bounded : Bounded program symbol) :
    WordBounded program (production program symbol) := by
  cases symbol with
  | head counter | first counter | second counter =>
      apply wordBounded_pair <;> trivial
  | filler counter | sacrificial | sink =>
      apply wordBounded_pair <;> trivial
  | halt =>
      exact wordBounded_nil program
  | selectPositive counter | selectZero counter =>
      simp only [production]
      first
      | exact header_wordBounded program _
      | intro symbol membership
        simp only [List.mem_cons] at membership
        rcases membership with rfl | inHeader
        · trivial
        · exact header_wordBounded program _ symbol inHeader
  | firstPositive counter =>
      exact laneOutput_wordBounded program counter .first true
  | firstZero counter =>
      exact laneOutput_wordBounded program counter .first false
  | secondPositive counter =>
      exact laneOutput_wordBounded program counter .second true
  | secondZero counter =>
      exact laneOutput_wordBounded program counter .second false

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
    ∀ fuel,
      WordBounded program (tagIterate (production program) fuel word)
  | 0 => bounded
  | fuel + 1 => tagStep_wordBounded (tagIterate_wordBounded bounded fuel)

theorem dataBlock_wordBounded (program : Program) (counter : Nat)
    (register : Register) (value : Nat) :
    WordBounded program (dataBlock program counter register value) := by
  unfold dataBlock
  cases instructionEq : instructionAt program counter with
  | accept =>
      simp only [instructionEq, instructionLive, Bool.false_eq, if_false]
      exact wordBounded_nil program
  | reject =>
      simp only [instructionEq, instructionLive, Bool.false_eq, if_false]
      exact wordBounded_nil program
  | increment tested next =>
      have counterLt := index_lt_of_instructionLive
        (program := program) (counter := counter)
        (by simp [instructionEq, instructionLive])
      simp only [instructionEq, instructionLive, Bool.true_eq, if_true]
      apply wordBounded_replicate
      cases register <;> change counter < program.length <;> exact counterLt
  | decrementJump tested positiveNext zeroNext =>
      have counterLt := index_lt_of_instructionLive
        (program := program) (counter := counter)
        (by simp [instructionEq, instructionLive])
      simp only [instructionEq, instructionLive, Bool.true_eq, if_true]
      apply wordBounded_replicate
      cases register <;> change counter < program.length <;> exact counterLt

theorem canonical_wordBounded (program : Program)
    (counter firstValue secondValue : Nat) :
    WordBounded program (canonical program counter firstValue secondValue) := by
  unfold canonical
  exact wordBounded_append
    (wordBounded_append (header_wordBounded program counter)
      (dataBlock_wordBounded program counter .first firstValue))
    (dataBlock_wordBounded program counter .second secondValue)

theorem encodeState_wordBounded (program : Program) (state : State) :
    WordBounded program (encodeState program state) := by
  cases state with
  | mk counter firstValue secondValue status =>
      cases status with
      | accepted => exact wordBounded_pair (by trivial) (by trivial)
      | rejected => exact wordBounded_pair (by trivial) (by trivial)
      | running => exact canonical_wordBounded program counter firstValue secondValue

set_option maxHeartbeats 1000000 in
theorem decodeSymbol_bounded (program : Program) (label : Nat) :
    Bounded program (decodeSymbol program label) := by
  dsimp only [decodeSymbol]
  split
  next h => simpa [Bounded]
  next h0 =>
    split
    next h1 =>
      simp only [Bounded]
      simpa using block_sub_lt_count label program.length 1
        (by simpa using Nat.le_of_not_gt h0) (by simpa using h1)
    next h1 =>
      split
      next h2 =>
        simp only [Bounded]
        exact block_sub_lt_count label program.length 2
          (Nat.le_of_not_gt h1) h2
      next h2 =>
        split
        next h3 =>
          simp only [Bounded]
          exact block_sub_lt_count label program.length 3
            (Nat.le_of_not_gt h2) h3
        next h3 =>
          split
          next h4 =>
            simp only [Bounded]
            exact block_sub_lt_count label program.length 4
              (Nat.le_of_not_gt h3) h4
          next h4 =>
            split
            next h5 =>
              simp only [Bounded]
              exact block_sub_lt_count label program.length 5
                (Nat.le_of_not_gt h4) h5
            next h5 =>
              split
              next h6 =>
                simp only [Bounded]
                exact block_sub_lt_count label program.length 6
                  (Nat.le_of_not_gt h5) h6
              next h6 =>
                split
                next h7 =>
                  simp only [Bounded]
                  exact block_sub_lt_count label program.length 7
                    (Nat.le_of_not_gt h6) h7
                next h7 =>
                  split
                  next h8 =>
                    simp only [Bounded]
                    exact block_sub_lt_count label program.length 8
                      (Nat.le_of_not_gt h7) h8
                  next h8 =>
                    split
                    next h9 =>
                      simp only [Bounded]
                      exact block_sub_lt_count label program.length 9
                        (Nat.le_of_not_gt h8) h9
                    next h9 =>
                      split <;> simp [Bounded]

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
  apply encodeWord_labelsValid
  exact production_wordBounded bounded

/-- Every row of the generated ordinary table emits only ordinary labels. -/
theorem ordinaryProgram_productionLabelsValid (program : Program) :
    ∀ label, label < RogozhinTagInput.symbolCount (ordinaryProgram program) →
      RogozhinTagInput.LabelsValid (ordinaryProgram program)
        (RogozhinTagInput.productionAt (ordinaryProgram program) label) := by
  intro label labelLt
  rw [ordinaryProgram_symbolCount] at labelLt
  rw [productionAt_of_lt program label labelLt]
  exact numericRhs_labelsValid
    (decodeSymbol_bounded program label)

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
    · exact False.elim ((Nat.ne_of_lt
        (encodeSymbol_lt_count_of_ne_halt bounded halt)) equal)
  · rintro rfl
    simp [encodeSymbol, ordinaryCount]

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

/-- Before the halt head, one numerical ordinary step is exactly pointwise
encoding of the typed deletion-two step. -/
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
            exact firstNe
              ((encodeSymbol_eq_haltLabel_iff firstBounded).1 equal)
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

/-- Exact numerical/typed agreement through any horizon whose earlier typed
heads are nonhalting. -/
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

/-- The explicit halt-head event is preserved by finite enumeration. -/
theorem typedEventuallyHalts_iff_numericHaltHead
    (program : Program) (word : List Symbol)
    (bounded : WordBounded program word) :
    (∃ fuel,
        (tagIterate (production program) fuel word).head? = some .halt) ↔
      ∃ fuel,
        (RogozhinTagInput.iterate (ordinaryProgram program) fuel
          (encodeWord program word)).head? =
            some (RogozhinTagInput.haltLabel (ordinaryProgram program)) := by
  exact typedEventuallyHalts_iff_numericHaltHead_kernel program word bounded

/-! ## Boundary preservation for the generated ordinary trajectory -/

theorem tagStep_eq_self_of_length_lt_two
    (table : Symbol → List Symbol) {word : List Symbol}
    (short : word.length < 2) :
    tagStep table word = word := by
  cases word with
  | nil => rfl
  | cons first rest =>
      cases rest with
      | nil => rfl
      | cons second rest =>
          have twoLe : 2 ≤ rest.length + 1 + 1 := by
            have base := Nat.le_add_left 2 rest.length
            simpa [Nat.add_assoc] using base
          exact False.elim ((Nat.not_lt_of_ge twoLe) short)

theorem tagIterate_eq_self_of_length_lt_two
    (table : Symbol → List Symbol) {word : List Symbol}
    (short : word.length < 2) :
    ∀ fuel, tagIterate table fuel word = word
  | 0 => rfl
  | fuel + 1 => by
      rw [tagIterate_succ,
        tagIterate_eq_self_of_length_lt_two table short fuel,
        tagStep_eq_self_of_length_lt_two table short]

/-- Exact live macro endpoint in complete source-state form. -/
theorem live_macro_step
    (program : Program) (counter firstValue secondValue : Nat)
    (instruction : Instruction) (register : Register)
    (instructionEq : instructionAt program counter = instruction)
    (liveEq : instructionLive instruction = true)
    (testedEq : instructionTested? instruction = some register) :
    tagIterate (production program) (macroFuel register firstValue secondValue)
        (canonical program counter firstValue secondValue) =
      encodeState program (CounterMachine.step program
        ⟨counter, firstValue, secondValue, .running⟩) := by
  cases instruction with
  | accept => simp [instructionLive] at liveEq
  | reject => simp [instructionLive] at liveEq
  | increment tested next =>
      cases tested with
      | first =>
          cases register with
          | first =>
              simpa [encodeState, CounterMachine.step, CounterMachine.write,
                CounterMachine.read, instructionEq] using
                macro_increment_first program counter next firstValue
                  secondValue instructionEq
          | second => simp [instructionTested?] at testedEq
      | second =>
          cases register with
          | first => simp [instructionTested?] at testedEq
          | second =>
              simpa [encodeState, CounterMachine.step, CounterMachine.write,
                CounterMachine.read, instructionEq] using
                macro_increment_second program counter next firstValue
                  secondValue instructionEq
  | decrementJump tested positiveNext zeroNext =>
      cases tested with
      | first =>
          cases register with
          | first =>
              cases firstValue with
              | zero =>
                  simpa [encodeState, CounterMachine.step,
                    CounterMachine.write, CounterMachine.read,
                    instructionEq] using
                    macro_decrement_first program counter positiveNext zeroNext
                      0 secondValue instructionEq
              | succ predecessor =>
                  simpa [encodeState, CounterMachine.step,
                    CounterMachine.write, CounterMachine.read,
                    instructionEq] using
                    macro_decrement_first program counter positiveNext zeroNext
                      (predecessor + 1) secondValue instructionEq
          | second => simp [instructionTested?] at testedEq
      | second =>
          cases register with
          | first => simp [instructionTested?] at testedEq
          | second =>
              cases secondValue with
              | zero =>
                  simpa [encodeState, CounterMachine.step,
                    CounterMachine.write, CounterMachine.read,
                    instructionEq] using
                    macro_decrement_second program counter positiveNext zeroNext
                      firstValue 0 instructionEq
              | succ predecessor =>
                  simpa [encodeState, CounterMachine.step,
                    CounterMachine.write, CounterMachine.read,
                    instructionEq] using
                    macro_decrement_second program counter positiveNext zeroNext
                      firstValue (predecessor + 1) instructionEq

/-- No reachable strict prefix can become short: a short typed word would be
absorbing and could not reach the two-cell next canonical boundary. -/
theorem live_macro_lengthTwo
    (program : Program) (counter firstValue secondValue fuel : Nat)
    (instruction : Instruction) (register : Register)
    (instructionEq : instructionAt program counter = instruction)
    (liveEq : instructionLive instruction = true)
    (testedEq : instructionTested? instruction = some register)
    (fuelLe : fuel ≤ macroFuel register firstValue secondValue) :
    2 ≤ (tagIterate (production program) fuel
      (canonical program counter firstValue secondValue)).length := by
  let current := tagIterate (production program) fuel
    (canonical program counter firstValue secondValue)
  by_cases currentLong : 2 ≤ current.length
  · exact currentLong
  · have currentShort : current.length < 2 := Nat.lt_of_not_ge currentLong
    have futureFixed := tagIterate_eq_self_of_length_lt_two
      (production program) currentShort
      (macroFuel register firstValue secondValue - fuel)
    have durationEq : macroFuel register firstValue secondValue =
        (macroFuel register firstValue secondValue - fuel) + fuel :=
      (Nat.sub_add_cancel fuelLe).symm
    have fullEq : tagIterate (production program)
          (macroFuel register firstValue secondValue)
          (canonical program counter firstValue secondValue) = current := by
      rw [durationEq, tagIterate_add]
      simpa [current] using futureFixed
    have currentEqNext : current =
        encodeState program (CounterMachine.step program
          ⟨counter, firstValue, secondValue, .running⟩) :=
      fullEq.symm.trans (live_macro_step program counter firstValue secondValue
        instruction register instructionEq liveEq testedEq)
    change 2 ≤ current.length
    rw [currentEqNext]
    exact two_le_encodeState_length _ _

theorem numeric_live_macro_step
    (program : Program) (counter firstValue secondValue : Nat)
    (instruction : Instruction) (register : Register)
    (instructionEq : instructionAt program counter = instruction)
    (liveEq : instructionLive instruction = true)
    (testedEq : instructionTested? instruction = some register) :
    RogozhinTagInput.iterate (ordinaryProgram program)
        (macroFuel register firstValue secondValue)
        (encodeWord program (canonical program counter firstValue secondValue)) =
      encodeWord program (encodeState program (CounterMachine.step program
        ⟨counter, firstValue, secondValue, .running⟩)) := by
  rw [iterate_encodeWord_until_halt
    (canonical_wordBounded program counter firstValue secondValue)
    (macroFuel register firstValue secondValue) (by
      intro earlier earlierLt
      exact live_macro_prefix_ne_halt program counter firstValue secondValue
        earlier instruction register instructionEq liveEq testedEq earlierLt)]
  rw [live_macro_step program counter firstValue secondValue instruction
    register instructionEq liveEq testedEq]

theorem iterate_eq_self_of_absorbingStep_eq
    {program : RogozhinTagInput.Program} {word : List Nat}
    (fixed : RogozhinTagInput.absorbingStep program word = word) :
    ∀ fuel, RogozhinTagInput.iterate program fuel word = word
  | 0 => rfl
  | fuel + 1 => by
      rw [RogozhinTagInput.iterate_succ,
        iterate_eq_self_of_absorbingStep_eq fixed fuel, fixed]

theorem encoded_halt_pair_fixed (program : Program) :
    RogozhinTagInput.absorbingStep (ordinaryProgram program)
      (encodeWord program [.halt, .sink]) =
        encodeWord program [.halt, .sink] := by
  simp [encodeWord, RogozhinTagInput.absorbingStep,
    RogozhinTagInput.step?, encodeSymbol, ordinaryCount]

theorem encoded_sink_pair_fixed (program : Program) :
    RogozhinTagInput.absorbingStep (ordinaryProgram program)
      (encodeWord program [.sink, .sink]) =
        encodeWord program [.sink, .sink] := by
  have stepEncoded := absorbingStep_encodeWord
    (program := program) (word := [.sink, .sink])
    (by
      apply wordBounded_pair
      · trivial
      · trivial)
    (by simp)
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

/-- Every horizon of the generated ordinary job is a valid two-cell source
boundary, including the absorbing accept and reject endpoints. -/
theorem ordinaryTrajectory_boundary (program : Program) :
    ∀ fuel state,
      DeletionTwoT2Normalizer.Boundary (ordinaryProgram program)
        (RogozhinTagInput.iterate (ordinaryProgram program) fuel
          (encodeWord program (encodeState program state))) := by
  intro fuel
  induction fuel using Nat.strongRecOn with
  | ind fuel ih =>
      intro state
      rcases state with ⟨counter, firstValue, secondValue, status⟩
      cases status with
      | accepted =>
          have fixed := iterate_eq_self_of_absorbingStep_eq
            (encoded_halt_pair_fixed program) fuel
          rw [show encodeState program
              ⟨counter, firstValue, secondValue, .accepted⟩ =
                [.halt, .sink] from rfl, fixed]
          exact encodedPair_boundary program .halt .sink (by trivial)
            (by trivial)
      | rejected =>
          have fixed := iterate_eq_self_of_absorbingStep_eq
            (encoded_sink_pair_fixed program) fuel
          rw [show encodeState program
              ⟨counter, firstValue, secondValue, .rejected⟩ =
                [.sink, .sink] from rfl, fixed]
          exact encodedPair_boundary program .sink .sink (by trivial)
            (by trivial)
      | running =>
          cases instructionEq : instructionAt program counter with
          | accept =>
              have canonicalEq : canonical program counter firstValue secondValue =
                  [.halt, .sink] := by
                simp [canonical, header, dataBlock, instructionEq,
                  instructionLive]
              rw [show encodeState program
                  ⟨counter, firstValue, secondValue, .running⟩ =
                    canonical program counter firstValue secondValue from rfl,
                canonicalEq,
                iterate_eq_self_of_absorbingStep_eq
                  (encoded_halt_pair_fixed program) fuel]
              exact encodedPair_boundary program .halt .sink (by trivial)
                (by trivial)
          | reject =>
              have canonicalEq : canonical program counter firstValue secondValue =
                  [.sink, .sink] := by
                simp [canonical, header, dataBlock, instructionEq,
                  instructionLive]
              rw [show encodeState program
                  ⟨counter, firstValue, secondValue, .running⟩ =
                    canonical program counter firstValue secondValue from rfl,
                canonicalEq,
                iterate_eq_self_of_absorbingStep_eq
                  (encoded_sink_pair_fixed program) fuel]
              exact encodedPair_boundary program .sink .sink (by trivial)
                (by trivial)
          | increment register next =>
              let duration := macroFuel register firstValue secondValue
              by_cases fuelLt : fuel < duration
              · have agreement := iterate_encodeWord_until_halt
                    (canonical_wordBounded program counter firstValue secondValue)
                    fuel (by
                      intro earlier earlierLt
                      exact live_macro_prefix_ne_halt program counter firstValue
                        secondValue earlier (.increment register next) register
                        instructionEq rfl rfl (Nat.lt_trans earlierLt fuelLt))
                rw [show encodeState program
                    ⟨counter, firstValue, secondValue, .running⟩ =
                      canonical program counter firstValue secondValue from rfl,
                  agreement]
                exact ⟨encodeWord_labelsValid
                    (tagIterate_wordBounded
                      (canonical_wordBounded program counter firstValue
                        secondValue) fuel),
                  by
                    simpa [encodeWord] using
                      (live_macro_lengthTwo program counter firstValue
                        secondValue fuel (.increment register next) register
                        instructionEq rfl rfl (Nat.le_of_lt fuelLt))⟩
              · have durationLe : duration ≤ fuel := Nat.le_of_not_gt fuelLt
                have durationPositive : 0 < duration :=
                  macroFuel_positive register firstValue secondValue
                have remainderLt : fuel - duration < fuel :=
                  Nat.sub_lt
                    (Nat.lt_of_lt_of_le durationPositive durationLe)
                    durationPositive
                have fuelEq : fuel = duration + (fuel - duration) := by
                  rw [Nat.add_comm]
                  exact (Nat.sub_add_cancel durationLe).symm
                rw [show encodeState program
                    ⟨counter, firstValue, secondValue, .running⟩ =
                      canonical program counter firstValue secondValue from rfl,
                  fuelEq, DeletionTwoT2Normalizer.tagIterate_add]
                rw [show duration = macroFuel register firstValue secondValue
                  from rfl]
                rw [numeric_live_macro_step program counter firstValue secondValue
                  (.increment register next) register instructionEq rfl rfl]
                exact ih (fuel - duration) remainderLt _

          | decrementJump register positiveNext zeroNext =>
              let duration := macroFuel register firstValue secondValue
              by_cases fuelLt : fuel < duration
              · have agreement := iterate_encodeWord_until_halt
                    (canonical_wordBounded program counter firstValue secondValue)
                    fuel (by
                      intro earlier earlierLt
                      exact live_macro_prefix_ne_halt program counter firstValue
                        secondValue earlier
                        (.decrementJump register positiveNext zeroNext) register
                        instructionEq rfl rfl (Nat.lt_trans earlierLt fuelLt))
                rw [show encodeState program
                    ⟨counter, firstValue, secondValue, .running⟩ =
                      canonical program counter firstValue secondValue from rfl,
                  agreement]
                exact ⟨encodeWord_labelsValid
                    (tagIterate_wordBounded
                      (canonical_wordBounded program counter firstValue
                        secondValue) fuel),
                  by
                    simpa [encodeWord] using
                      (live_macro_lengthTwo program counter firstValue
                        secondValue fuel
                        (.decrementJump register positiveNext zeroNext) register
                        instructionEq rfl rfl (Nat.le_of_lt fuelLt))⟩
              · have durationLe : duration ≤ fuel := Nat.le_of_not_gt fuelLt
                have durationPositive : 0 < duration :=
                  macroFuel_positive register firstValue secondValue
                have remainderLt : fuel - duration < fuel :=
                  Nat.sub_lt
                    (Nat.lt_of_lt_of_le durationPositive durationLe)
                    durationPositive
                have fuelEq : fuel = duration + (fuel - duration) := by
                  rw [Nat.add_comm]
                  exact (Nat.sub_add_cancel durationLe).symm
                rw [show encodeState program
                    ⟨counter, firstValue, secondValue, .running⟩ =
                      canonical program counter firstValue secondValue from rfl]
                rw [fuelEq, DeletionTwoT2Normalizer.tagIterate_add]
                rw [show duration = macroFuel register firstValue secondValue
                  from rfl]
                rw [numeric_live_macro_step program counter firstValue secondValue
                  (.decrementJump register positiveNext zeroNext) register
                  instructionEq rfl rfl]
                exact ih (fuel - duration) remainderLt _

/-! ## Public ordinary and restricted jobs -/

def ordinaryInitialWord (program : Program) (input : Nat) : List Nat :=
  encodeWord program (encodeState program (CounterMachine.initial input))

def ordinaryJob (program : Program) (input : Nat) : RogozhinTagInput.Job :=
  ⟨ordinaryProgram program, ordinaryInitialWord program input⟩

theorem ordinaryInitialBoundary (program : Program) (input : Nat) :
    DeletionTwoT2Normalizer.Boundary (ordinaryProgram program)
      (ordinaryInitialWord program input) := by
  exact ordinaryTrajectory_boundary program 0 (CounterMachine.initial input)

theorem ordinaryTrajectory (program : Program) (input : Nat) :
    ∀ horizon,
      DeletionTwoT2Normalizer.Boundary (ordinaryProgram program)
        (RogozhinTagInput.iterate (ordinaryProgram program) horizon
          (ordinaryInitialWord program input)) := by
  intro horizon
  exact ordinaryTrajectory_boundary program horizon
    (CounterMachine.initial input)

theorem ordinaryEventuallyHalts_iff_haltHead
    (program : Program) (input : Nat) :
    RogozhinTagInput.EventuallyHalts (ordinaryJob program input) ↔
      ∃ horizon,
        (RogozhinTagInput.iterate (ordinaryProgram program) horizon
          (ordinaryInitialWord program input)).head? =
            some (RogozhinTagInput.haltLabel (ordinaryProgram program)) := by
  unfold RogozhinTagInput.EventuallyHalts ordinaryJob
  constructor
  · rintro ⟨horizon, halted⟩
    exact ⟨horizon,
      ((ordinaryTrajectory program input horizon).halted_iff_head).1 halted⟩
  · rintro ⟨horizon, haltHead⟩
    exact ⟨horizon,
      ((ordinaryTrajectory program input horizon).halted_iff_head).2 haltHead⟩

theorem accepts_iff_ordinaryEventuallyHalts
    (program : Program) (input : Nat) :
    CounterMachine.Accepts program input ↔
      RogozhinTagInput.EventuallyHalts (ordinaryJob program input) := by
  rw [ordinaryEventuallyHalts_iff_haltHead]
  exact (accepts_iff_typedEventuallyHalts program input).trans
    (typedEventuallyHalts_iff_numericHaltHead program
      (encodeState program (CounterMachine.initial input))
      (encodeState_wordBounded program (CounterMachine.initial input)))

/-- Premise-free compiler from a direct-input two-counter job to Rogozhin's
literal restricted `T2` input class. -/
def compileT2 (program : Program) (input : Nat) : RogozhinTagInput.Job :=
  ⟨DeletionTwoT2Normalizer.normalizeProgram (ordinaryProgram program),
    DeletionTwoT2Normalizer.normalizeWord (ordinaryProgram program)
      (ordinaryInitialWord program input)⟩

theorem compileT2_isT2 (program : Program) (input : Nat) :
    RogozhinTagInput.IsT2 (compileT2 program input).program := by
  exact DeletionTwoT2Normalizer.normalize_isT2 (ordinaryProgram program)
    (ordinaryProgram_productionLabelsValid program)

theorem compileT2_wellFormed (program : Program) (input : Nat) :
    RogozhinTagInput.WellFormed (compileT2 program input).program
      (compileT2 program input).word := by
  exact DeletionTwoT2Normalizer.normalize_wellFormed
    (ordinaryProgram program) (ordinaryProgram_productionLabelsValid program)
    (ordinaryInitialBoundary program input)

theorem accepts_iff_compileT2_eventuallyHalts
    (program : Program) (input : Nat) :
    CounterMachine.Accepts program input ↔
      RogozhinTagInput.EventuallyHalts (compileT2 program input) := by
  have normalizedIff := DeletionTwoT2Normalizer.eventuallyHalts_iff
    (ordinaryProgram program) (ordinaryInitialWord program input)
    (ordinaryProgram_productionLabelsValid program)
    (ordinaryInitialBoundary program input)
    (ordinaryTrajectory program input)
  exact (accepts_iff_ordinaryEventuallyHalts program input).trans
    normalizedIff.symm

def compileUniversalInput (job : CounterMachine.UniversalInput) :
    RogozhinTagInput.Job := compileT2 job.program job.input

theorem universalAccepts_iff_compileUniversalInput (job :
    CounterMachine.UniversalInput) :
    CounterMachine.UniversalAccepts job ↔
      RogozhinTagInput.EventuallyHalts (compileUniversalInput job) := by
  exact accepts_iff_compileT2_eventuallyHalts job.program job.input

end Numeric







end CounterMachineTag

end PureSFormal.Computation
