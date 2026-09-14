import PureSFormal.Research.ProtectedTrieDeterministicCompiler

set_option backward.isDefEq.respectTransparency false

/-!
# Deterministic tape to arithmetic stack-counter compiler

This module is the first, fully executable layer of a compiler from the
independently defined deterministic tape source to counter code.  It represents
the finite tape window by two sentinel-terminated binary stacks.  The left
counter stores cells strictly left of the head, nearest cell first; the right
counter stores the scanned cell followed by cells to its right.

The target in this module has finite source control and two natural counters,
but `push` and `pop?` are arithmetic macro-operations.  Consequently this file
does not claim a compiler into `CounterMachine.Instruction`.  Primitive
increment/decrement implementations of these macros are outside this module.
-/

namespace PureSFormal.Computation.DeterministicTapeCounterCompiler

open PureSFormal.Research.ProtectedTrieDeterministicCompiler

namespace StackCode

/-- Numeric spelling of one Boolean digit. -/
def bit : Bool -> Nat
  | false => 0
  | true => 1

/-- Sentinel-terminated, nearest-cell-first binary stack encoding. -/
def encode : List Bool -> Nat
  | [] => 1
  | value :: rest => 2 * encode rest + bit value

/-- Push one physical bit onto an encoded stack. -/
def push (value : Bool) (stack : Nat) : Nat :=
  2 * stack + bit value

/-- Pop one physical bit.  The sentinel `1` represents the empty stack. -/
def pop? (stack : Nat) : Option (Bool × Nat) :=
  if stack = 1 then
    none
  else
    some (stack % 2 = 1, stack / 2)

/-- Total inverse parser for sentinel-terminated physical stack codes.
`0` is the sole malformed code.  Every positive natural has a unique spelling:
its least-significant bits are the stack contents and its leading `1` is the
sentinel. -/
def decode? (stack : Nat) : Option (List Bool) :=
  if stack = 0 then
    none
  else if stack = 1 then
    some []
  else
    match decode? (stack / 2) with
    | none => none
    | some rest => some ((stack % 2 = 1) :: rest)
termination_by stack
decreasing_by
  rename_i hzero _
  exact Nat.div_lt_self (Nat.zero_lt_of_ne_zero hzero)
    (by decide : 1 < 2)

@[simp]
theorem encode_nil : encode [] = 1 := rfl

@[simp]
theorem encode_cons (value : Bool) (rest : List Bool) :
    encode (value :: rest) = push value (encode rest) := rfl

@[simp]
theorem bit_lt_two (value : Bool) : bit value < 2 := by
  cases value <;> decide

@[simp]
theorem push_encode (value : Bool) (rest : List Bool) :
    push value (encode rest) = encode (value :: rest) := rfl

theorem encode_pos (values : List Bool) : 0 < encode values := by
  induction values with
  | nil => exact Nat.zero_lt_succ 0
  | cons value rest ih =>
      cases value with
      | false =>
          exact Nat.mul_pos (Nat.zero_lt_succ 1) ih
      | true =>
          exact Nat.zero_lt_succ (2 * encode rest)

theorem encode_cons_ne_one (value : Bool) (rest : List Bool) :
    encode (value :: rest) ≠ 1 := by
  have nonzero : encode rest ≠ 0 := Nat.ne_of_gt (encode_pos rest)
  cases encodedEq : encode rest with
  | zero => exact False.elim (nonzero encodedEq)
  | succ encoded =>
      cases value with
      | false =>
          rw [encode, encodedEq]
          change 2 * Nat.succ encoded ≠ 1
          intro impossible
          change Nat.succ (Nat.succ (2 * encoded)) = Nat.succ 0 at impossible
          exact Nat.noConfusion (Nat.succ.inj impossible)
      | true =>
          rw [encode, encodedEq]
          change 2 * Nat.succ encoded + 1 ≠ 1
          intro impossible
          change Nat.succ (Nat.succ (Nat.succ (2 * encoded))) =
            Nat.succ 0 at impossible
          exact Nat.noConfusion (Nat.succ.inj impossible)

@[simp]
theorem encode_cons_mod_two (value : Bool) (rest : List Bool) :
    encode (value :: rest) % 2 = bit value := by
  rw [encode_cons]
  unfold push
  rw [Nat.mul_comm, Nat.add_comm, Nat.add_mul_mod_self_right]
  exact Nat.mod_eq_of_lt (bit_lt_two value)

@[simp]
theorem encode_cons_div_two (value : Bool) (rest : List Bool) :
    encode (value :: rest) / 2 = encode rest := by
  rw [encode_cons]
  unfold push
  rw [Nat.mul_comm, Nat.add_comm]
  rw [Nat.add_mul_div_right (bit value) (encode rest)
    (by decide : 0 < 2)]
  rw [Nat.div_eq_of_lt (bit_lt_two value), Nat.zero_add]

@[simp]
theorem decide_bit_eq_one (value : Bool) : decide (bit value = 1) = value := by
  cases value <;> decide

@[simp]
theorem bit_decide_mod_two (stack : Nat) :
    bit (decide (stack % 2 = 1)) = stack % 2 := by
  have bounded := Nat.mod_lt stack (by decide : 0 < 2)
  cases remainderEq : stack % 2 with
  | zero => simp [remainderEq, bit]
  | succ remainder =>
      cases remainder with
      | zero => simp [remainderEq, bit]
      | succ remainder =>
          rw [remainderEq] at bounded
          have belowOne : Nat.succ remainder < 1 :=
            Nat.lt_of_succ_lt_succ bounded
          have belowZero : remainder < 0 :=
            Nat.lt_of_succ_lt_succ belowOne
          exact False.elim (Nat.not_lt_zero remainder belowZero)

/-- Encoding followed by the total parser recovers the literal stack. -/
@[simp]
theorem decode?_encode (values : List Bool) :
    decode? (encode values) = some values := by
  induction values with
  | nil => simp [decode?]
  | cons value rest ih =>
      rw [decode?]
      rw [if_neg (Nat.ne_of_gt (encode_pos (value :: rest)))]
      rw [if_neg (encode_cons_ne_one value rest)]
      rw [encode_cons_div_two, encode_cons_mod_two]
      simp [ih, decide_bit_eq_one]

/-- Every successful parse is canonical: re-encoding its result gives the
input natural exactly. -/
theorem encode_of_decode?_eq {stack : Nat} {values : List Bool}
    (parsed : decode? stack = some values) : encode values = stack := by
  induction stack using Nat.strongRecOn generalizing values with
  | ind stack ih =>
      rw [decode?] at parsed
      split at parsed
      next => contradiction
      split at parsed
      next sentinel =>
        cases parsed
        simpa using sentinel.symm
      next nonsentinel =>
        rename_i nonzero
        cases recursive : decode? (stack / 2) with
        | none => simp [recursive] at parsed
        | some rest =>
            rw [recursive] at parsed
            cases parsed
            have smaller : stack / 2 < stack :=
              Nat.div_lt_self (Nat.zero_lt_of_ne_zero nonzero)
                (by decide : 1 < 2)
            have restExact : encode rest = stack / 2 :=
              ih (stack / 2) smaller recursive
            rw [encode_cons]
            unfold push
            rw [restExact, bit_decide_mod_two]
            simpa [Nat.add_comm, Nat.mul_comm] using Nat.mod_add_div stack 2

@[simp]
theorem pop?_encode_nil : pop? (encode []) = none := by
  simp [pop?]

@[simp]
theorem pop?_encode_cons (value : Bool) (rest : List Bool) :
    pop? (encode (value :: rest)) = some (value, encode rest) := by
  rw [pop?, if_neg (encode_cons_ne_one value rest)]
  cases value with
  | false => simp [encode, bit]
  | true =>
      have sumEq : 2 * encode rest + 1 = 1 + encode rest * 2 := by
        rw [Nat.mul_comm, Nat.add_comm]
      rw [show encode (true :: rest) = 2 * encode rest + 1 by rfl]
      rw [sumEq]
      rw [Nat.add_mul_mod_self_right]
      rw [Nat.add_mul_div_right 1 (encode rest) (by decide : 0 < 2)]
      simp

end StackCode

namespace StackCounter

abbrev Rule := DeterministicTape.Rule
abbrev Machine := DeterministicTape.Machine

/-- Arithmetic two-stack configuration. -/
structure Configuration where
  state : Nat
  left : Nat
  right : Nat
  deriving DecidableEq, Repr

/-- The empty encoded stack. -/
def empty : Nat := StackCode.encode []

/-- Continue a macrostep after exposing the scanned symbol and right tail. -/
def continueAfterPop (machine : Machine) (configuration : Configuration)
    (symbol : Bool) (rightTail : Nat) : Option Configuration :=
  match DeterministicTape.ruleAt? machine configuration.state symbol with
  | none => none
  | some rule =>
      match rule.move with
      | .stay =>
          some
            { state := rule.nextState
              left := configuration.left
              right := StackCode.push rule.write rightTail }
      | .left =>
          match StackCode.pop? configuration.left with
          | none =>
              some
                { state := rule.nextState
                  left := empty
                  right := StackCode.push false
                    (StackCode.push rule.write rightTail) }
          | some (neighbor, leftTail) =>
              some
                { state := rule.nextState
                  left := leftTail
                  right := StackCode.push neighbor
                    (StackCode.push rule.write rightTail) }
      | .right =>
          some
            { state := rule.nextState
              left := StackCode.push rule.write configuration.left
              right := if rightTail = empty then
                  StackCode.push false empty
                else rightTail }

/-- One arithmetic macrostep.  Undefined source transitions are target halts. -/
def step? (machine : Machine) (configuration : Configuration) :
    Option Configuration :=
  match StackCode.pop? configuration.right with
  | none => none
  | some (symbol, rightTail) =>
      continueAfterPop machine configuration symbol rightTail

/-- Execute exactly `fuel` arithmetic macrosteps, failing after an earlier halt. -/
def runFor? (machine : Machine) : Configuration -> Nat -> Option Configuration
  | configuration, 0 => some configuration
  | configuration, fuel + 1 => do
      let next <- step? machine configuration
      runFor? machine next fuel

/-- Arithmetic-stack halting. -/
def Halts (machine : Machine) (initial : Configuration) : Prop :=
  exists fuel final,
    runFor? machine initial fuel = some final /\ step? machine final = none

end StackCounter

open StackCounter

/-- Source row reconstructed from its two physical stack lists. -/
def rowOf (state : Nat) (left right : List Bool) : DeterministicTape.Row :=
  { state := state
    head := left.length
    tape := left.reverse ++ right }

/-- Arithmetic configuration reconstructed from the same two stack lists. -/
def configurationOf (state : Nat) (left right : List Bool) :
    StackCounter.Configuration :=
  { state := state
    left := StackCode.encode left
    right := StackCode.encode right }

/-- A source row is represented by exact left/right physical stack lists. -/
def Represents (row : DeterministicTape.Row)
    (configuration : StackCounter.Configuration) : Prop :=
  exists state left right,
    right ≠ [] /\
    row = rowOf state left right /\
    configuration = configurationOf state left right

/-- Executable initial arithmetic-stack configuration. -/
def compileInitial (source : DeterministicTape.Instance) :
    StackCounter.Configuration :=
  { state := source.initialState
    left := StackCode.encode [false]
    right := StackCode.encode (source.input ++ [false]) }

theorem initial_represents (source : DeterministicTape.Instance) :
    Represents (DeterministicTape.initialRow source) (compileInitial source) := by
  refine ⟨source.initialState, [false], source.input ++ [false], ?_⟩
  constructor
  · simp
  constructor
  · simp [DeterministicTape.initialRow, rowOf, compileInitial]
  · rfl

theorem getElem?_append_focus {alpha : Type} (front suffix : List alpha)
    (value : alpha) :
    (front ++ value :: suffix)[front.length]? = some value := by
  induction front with
  | nil => rfl
  | cons head front ih =>
      simp only [List.cons_append, List.length_cons, List.getElem?_cons_succ]
      exact ih

theorem replaceAt?_append_focus {alpha : Type} (front suffix : List alpha)
    (oldValue newValue : alpha) :
    PureSFormal.Research.ProtectedTrieMachine.replaceAt?
        (front ++ oldValue :: suffix) front.length newValue =
      some (front ++ newValue :: suffix) := by
  induction front with
  | nil => rfl
  | cons head front ih =>
      simp only [List.cons_append, List.length_cons,
        PureSFormal.Research.ProtectedTrieMachine.replaceAt?]
      rw [ih]
      rfl

@[simp]
theorem scanned?_rowOf (state : Nat) (left tail : List Bool)
    (current : Bool) :
    PureSFormal.Research.ProtectedTrieMachine.scanned?
        (rowOf state left (current :: tail)) = some current := by
  unfold PureSFormal.Research.ProtectedTrieMachine.scanned? rowOf
  simpa using getElem?_append_focus left.reverse tail current

/-- Exact source update on a row already split at the scanned cell. -/
theorem applyRule?_rowOf (state : Nat) (left tail : List Bool)
    (current : Bool) (rule : DeterministicTape.Rule) :
    PureSFormal.Research.ProtectedTrieMachine.applyRule?
        (rowOf state left (current :: tail)) rule =
      some
        (match rule.move with
        | .stay => rowOf rule.nextState left (rule.write :: tail)
        | .left =>
            match left with
            | [] => rowOf rule.nextState [] (false :: rule.write :: tail)
            | neighbor :: leftTail =>
                rowOf rule.nextState leftTail
                  (neighbor :: rule.write :: tail)
        | .right =>
            match tail with
            | [] => rowOf rule.nextState (rule.write :: left) [false]
            | neighbor :: rightTail =>
                rowOf rule.nextState (rule.write :: left)
                  (neighbor :: rightTail)) := by
  unfold PureSFormal.Research.ProtectedTrieMachine.applyRule?
  change
    (do
      let tape <- PureSFormal.Research.ProtectedTrieMachine.replaceAt?
        (left.reverse ++ current :: tail) left.length rule.write
      let moved := PureSFormal.Research.ProtectedTrieMachine.movePadded
        tape left.length rule.move
      pure (PureSFormal.Research.ProtectedTrieMachine.Row.mk
        rule.nextState moved.2 moved.1)) = _
  rw [show left.length = left.reverse.length by simp]
  rw [replaceAt?_append_focus]
  rw [List.length_reverse]
  cases rule.move with
  | stay =>
      rfl
  | left =>
      cases left with
      | nil =>
          rfl
      | cons neighbor leftTail =>
          rw [List.reverse_cons, List.append_assoc]
          rfl
  | right =>
      cases tail with
      | nil =>
          have boundary : ¬(left.length + 1 <
              (left.reverse ++ [rule.write]).length) := by
            rw [List.length_append, List.length_reverse]
            change ¬(left.length + 1 < left.length + 1)
            exact Nat.lt_irrefl _
          unfold PureSFormal.Research.ProtectedTrieMachine.movePadded
          simp only [Bind.bind, instMonadOption, Option.bind]
          rw [if_neg boundary]
          unfold rowOf
          rw [List.reverse_cons, List.append_assoc]
          rfl
      | cons neighbor rightTail =>
          have interior : left.length + 1 <
              (left.reverse ++ rule.write :: neighbor :: rightTail).length := by
            rw [List.length_append, List.length_reverse]
            exact Nat.add_lt_add_left
              (Nat.succ_lt_succ (Nat.zero_lt_succ rightTail.length))
              left.length
          unfold PureSFormal.Research.ProtectedTrieMachine.movePadded
          simp only [Bind.bind, instMonadOption, Option.bind]
          rw [if_pos interior]
          unfold rowOf
          rw [List.reverse_cons, List.append_assoc]
          rfl

/-- Physical stack lists after one supplied source rule. -/
def afterRule (left tail : List Bool) (rule : DeterministicTape.Rule) :
    List Bool × List Bool :=
  match rule.move with
  | .stay => (left, rule.write :: tail)
  | .left =>
      match left with
      | [] => ([], false :: rule.write :: tail)
      | neighbor :: leftTail =>
          (leftTail, neighbor :: rule.write :: tail)
  | .right =>
      match tail with
      | [] => (rule.write :: left, [false])
      | neighbor :: rightTail =>
          (rule.write :: left, neighbor :: rightTail)

theorem applyRule?_rowOf_afterRule (state : Nat) (left tail : List Bool)
    (current : Bool) (rule : DeterministicTape.Rule) :
    PureSFormal.Research.ProtectedTrieMachine.applyRule?
        (rowOf state left (current :: tail)) rule =
      some (rowOf rule.nextState
        (afterRule left tail rule).1 (afterRule left tail rule).2) := by
  cases rule with
  | mk write move nextState =>
      cases move with
      | stay =>
          simpa [afterRule] using
            applyRule?_rowOf state left tail current
              ({ write := write, move := .stay, nextState := nextState } :
                DeterministicTape.Rule)
      | left =>
          cases left with
          | nil =>
              simpa [afterRule] using
                applyRule?_rowOf state [] tail current
                  ({ write := write, move := .left, nextState := nextState } :
                    DeterministicTape.Rule)
          | cons neighbor leftTail =>
              simpa [afterRule] using
                applyRule?_rowOf state (neighbor :: leftTail) tail current
                  ({ write := write, move := .left, nextState := nextState } :
                    DeterministicTape.Rule)
      | right =>
          cases tail with
          | nil =>
              simpa [afterRule] using
                applyRule?_rowOf state left [] current
                  ({ write := write, move := .right, nextState := nextState } :
                    DeterministicTape.Rule)
          | cons neighbor rightTail =>
              simpa [afterRule] using
                applyRule?_rowOf state left (neighbor :: rightTail) current
                  ({ write := write, move := .right, nextState := nextState } :
                    DeterministicTape.Rule)

theorem afterRule_right_ne_nil (left tail : List Bool)
    (rule : DeterministicTape.Rule) :
    (afterRule left tail rule).2 ≠ [] := by
  cases rule with
  | mk write move nextState =>
      cases move with
      | stay => simp [afterRule]
      | left => cases left <;> simp [afterRule]
      | right => cases tail <;> simp [afterRule]

theorem source_step?_rowOf
    (machine : DeterministicTape.Machine) (state : Nat)
    (left tail : List Bool) (current : Bool) (rule : DeterministicTape.Rule)
    (selected : DeterministicTape.ruleAt? machine state current = some rule) :
    DeterministicTape.step? machine (rowOf state left (current :: tail)) =
      some (rowOf rule.nextState
        (afterRule left tail rule).1 (afterRule left tail rule).2) := by
  unfold DeterministicTape.step?
  rw [scanned?_rowOf]
  change
    (do
      let selectedRule <- DeterministicTape.ruleAt? machine state current
      PureSFormal.Research.ProtectedTrieMachine.applyRule?
        (rowOf state left (current :: tail)) selectedRule) = _
  rw [selected]
  exact applyRule?_rowOf_afterRule state left tail current rule

theorem stack_step?_configurationOf
    (machine : DeterministicTape.Machine) (state : Nat)
    (left tail : List Bool) (current : Bool) (rule : DeterministicTape.Rule)
    (selected : DeterministicTape.ruleAt? machine state current = some rule) :
    StackCounter.step? machine
        (configurationOf state left (current :: tail)) =
      some (configurationOf rule.nextState
        (afterRule left tail rule).1 (afterRule left tail rule).2) := by
  unfold StackCounter.step?
  simp only [configurationOf]
  rw [StackCode.pop?_encode_cons]
  unfold StackCounter.continueAfterPop
  simp only [configurationOf]
  rw [selected]
  cases rule with
  | mk write move nextState =>
      cases move with
      | stay => rfl
      | left =>
          cases left with
          | nil => rfl
          | cons neighbor leftTail =>
              rw [StackCode.pop?_encode_cons]
              rfl
      | right =>
          cases tail with
          | nil => rfl
          | cons neighbor rightTail =>
              simp only [afterRule, StackCounter.empty, StackCode.encode_nil]
              simp only [if_neg (StackCode.encode_cons_ne_one neighbor rightTail)]
              rfl

theorem source_step?_rowOf_none
    (machine : DeterministicTape.Machine) (state : Nat)
    (left tail : List Bool) (current : Bool)
    (selected : DeterministicTape.ruleAt? machine state current = none) :
    DeterministicTape.step? machine (rowOf state left (current :: tail)) =
      none := by
  unfold DeterministicTape.step?
  rw [scanned?_rowOf]
  change
    (do
      let selectedRule <- DeterministicTape.ruleAt? machine state current
      PureSFormal.Research.ProtectedTrieMachine.applyRule?
        (rowOf state left (current :: tail)) selectedRule) = none
  rw [selected]
  rfl

theorem stack_step?_configurationOf_none
    (machine : DeterministicTape.Machine) (state : Nat)
    (left tail : List Bool) (current : Bool)
    (selected : DeterministicTape.ruleAt? machine state current = none) :
    StackCounter.step? machine
        (configurationOf state left (current :: tail)) = none := by
  unfold StackCounter.step?
  simp only [configurationOf]
  rw [StackCode.pop?_encode_cons]
  unfold StackCounter.continueAfterPop
  simp only [configurationOf]
  rw [selected]

/-- Pointwise lifting of a relation through matching optional computations. -/
inductive OptionLift {alpha beta : Type} (relation : alpha -> beta -> Prop) :
    Option alpha -> Option beta -> Prop where
  | none : OptionLift relation none none
  | some {left : alpha} {right : beta} :
      relation left right -> OptionLift relation (some left) (some right)

/-- One arithmetic macrostep preserves and reflects one deterministic tape
transition, including undefined-transition halting. -/
theorem step?_related (machine : DeterministicTape.Machine)
    {row : DeterministicTape.Row} {configuration : StackCounter.Configuration}
    (represents : Represents row configuration) :
    OptionLift Represents (DeterministicTape.step? machine row)
      (StackCounter.step? machine configuration) := by
  rcases represents with
    ⟨state, left, right, rightNonempty, rfl, rfl⟩
  cases right with
  | nil => exact False.elim (rightNonempty rfl)
  | cons current tail =>
      cases selected : DeterministicTape.ruleAt? machine state current with
      | none =>
          rw [source_step?_rowOf_none machine state left tail current selected]
          rw [stack_step?_configurationOf_none machine state left tail current
            selected]
          exact OptionLift.none
      | some rule =>
          rw [source_step?_rowOf machine state left tail current rule selected]
          rw [stack_step?_configurationOf machine state left tail current rule
            selected]
          apply OptionLift.some
          refine ⟨rule.nextState, (afterRule left tail rule).1,
            (afterRule left tail rule).2, ?_, rfl, rfl⟩
          exact afterRule_right_ne_nil left tail rule

namespace OptionLift

theorem target_eq_none_of_source_none {alpha beta : Type}
    {relation : alpha -> beta -> Prop} {target : Option beta}
    (related : OptionLift relation Option.none target) :
    target = Option.none := by
  cases related
  rfl

theorem source_eq_none_of_target_none {alpha beta : Type}
    {relation : alpha -> beta -> Prop} {source : Option alpha}
    (related : OptionLift relation source Option.none) :
    source = Option.none := by
  cases related
  rfl

theorem exists_target_of_source_some {alpha beta : Type}
    {relation : alpha -> beta -> Prop} {source : alpha} {target : Option beta}
    (related : OptionLift relation (Option.some source) target) :
    exists targetValue,
      target = Option.some targetValue /\ relation source targetValue := by
  cases related with
  | some relationProof => exact ⟨_, rfl, relationProof⟩

theorem exists_source_of_target_some {alpha beta : Type}
    {relation : alpha -> beta -> Prop} {source : Option alpha} {target : beta}
    (related : OptionLift relation source (Option.some target)) :
    exists sourceValue,
      source = Option.some sourceValue /\ relation sourceValue target := by
  cases related with
  | some relationProof => exact ⟨_, rfl, relationProof⟩

end OptionLift

/-- Exact bounded runs preserve and reflect the row/configuration invariant. -/
theorem runFor?_related (machine : DeterministicTape.Machine) (fuel : Nat)
    {row : DeterministicTape.Row} {configuration : StackCounter.Configuration}
    (represents : Represents row configuration) :
    OptionLift Represents
      (DeterministicTape.runFor? machine row fuel)
      (StackCounter.runFor? machine configuration fuel) := by
  induction fuel generalizing row configuration with
  | zero => exact OptionLift.some represents
  | succ fuel ih =>
      rw [DeterministicTape.runFor?, StackCounter.runFor?]
      have stepRelated := step?_related machine represents
      cases sourceStep : DeterministicTape.step? machine row with
      | none =>
          have targetStep :=
            OptionLift.target_eq_none_of_source_none
              (sourceStep ▸ stepRelated)
          rw [targetStep]
          exact OptionLift.none
      | some nextRow =>
          obtain ⟨nextConfiguration, targetStep, nextRepresents⟩ :=
            OptionLift.exists_target_of_source_some
              (sourceStep ▸ stepRelated)
          rw [targetStep]
          exact ih nextRepresents

/-- The arithmetic-stack compiler preserves and reflects deterministic tape
halting.  This theorem covers the macro-operation layer; it does not lower
`StackCode.push` and `StackCode.pop?` to primitive two-counter instructions. -/
theorem halts_iff_stackCounterHalts (source : DeterministicTape.Instance) :
    DeterministicTape.Halts source <->
      StackCounter.Halts source.machine (compileInitial source) := by
  constructor
  · rintro ⟨fuel, finalRow, sourceRun, sourceHalt⟩
    have relatedRun := runFor?_related source.machine fuel
      (initial_represents source)
    rw [sourceRun] at relatedRun
    obtain ⟨finalConfiguration, targetRun, finalRepresents⟩ :=
      OptionLift.exists_target_of_source_some relatedRun
    have relatedStep := step?_related source.machine finalRepresents
    rw [sourceHalt] at relatedStep
    have targetHalt :=
      OptionLift.target_eq_none_of_source_none relatedStep
    exact ⟨fuel, finalConfiguration, targetRun, targetHalt⟩
  · rintro ⟨fuel, finalConfiguration, targetRun, targetHalt⟩
    have relatedRun := runFor?_related source.machine fuel
      (initial_represents source)
    rw [targetRun] at relatedRun
    obtain ⟨finalRow, sourceRun, finalRepresents⟩ :=
      OptionLift.exists_source_of_target_some relatedRun
    have relatedStep := step?_related source.machine finalRepresents
    rw [targetHalt] at relatedStep
    have sourceHalt :=
      OptionLift.source_eq_none_of_target_none relatedStep
    exact ⟨fuel, finalRow, sourceRun, sourceHalt⟩

end PureSFormal.Computation.DeterministicTapeCounterCompiler
