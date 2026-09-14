import PureSFormal.Research.ProtectedTrieLabelledObserver
import PureSFormal.Research.ProtectedTrieTableauExactResource

/-!
# Structurally metered whole-term labelled observer

The observer combines recursive `Meter` computations under the structural
charging rules of Appendix C.9.1. The value is not paired with an independently
postulated allowance: header and seed parsing, source-code parsing and its
canonical re-encoding guard, protected-path enumeration, candidate parsing,
literal tableau checking, and label extraction all contribute their actual
recursive meters.  The public result is the compact literal label list;
ancestor closure is specified extensionally and is not materialized.
The inherited tableau meters leave `rows.length` without a separate charge
and give the head comparison a fixed charge. They do not account for every
primitive arithmetic operation or all simultaneously retained runtime data.
-/

namespace PureSFormal.Research.ProtectedTrieWholeObserverExactCost

open PureSFormal.PureS
open PureSFormal.Research.ProtectedTrieAlgebra
open PureSFormal.Research.ProtectedTrieCertificates
open PureSFormal.Research.ProtectedTrieEnumeration
open PureSFormal.Research.ProtectedTrieLabelledObserver
open PureSFormal.Research.ProtectedTrieMachine
open PureSFormal.Research.ProtectedTrieMachineCode
open PureSFormal.Research.ProtectedTrieParser
open PureSFormal.Research.ProtectedTrieProjection
open PureSFormal.Research.ProtectedTrieSeed
open PureSFormal.Research.ProtectedTrieStrong
open PureSFormal.Research.ProtectedTrieTableau
open PureSFormal.Research.ProtectedTrieTableauExactCost
open PureSFormal.Research.ProtectedTrieTableauExactResource
open PureSFormal.Research.ProtectedTrieTableauLabel

/-! ## Counted header, normal seed, and source codec -/

def parseHeaderM? : Term -> Meter (Option HeaderView)
  | .app (.app .s seed) body => ⟨some ⟨seed, body⟩, 3, 2⟩
  | _ => ⟨none, 3, 2⟩

@[simp] theorem parseHeaderM?_value (term : Term) :
    (parseHeaderM? term).value = parseHeader? term := by
  cases term with
  | s => rfl
  | app fn body =>
      cases fn with
      | s => rfl
      | app head seed => cases head <;> rfl

def decodeNM? : Term -> Meter (Option BitWord)
  | .s => ⟨some [], 1, 1⟩
  | .app (.app .s .s) tail =>
      let parsed := decodeNM? tail
      ⟨parsed.value.map (List.cons false), parsed.ticks + 3,
        parsed.peak + 1⟩
  | .app (.app .s (.app .s .s)) tail =>
      let parsed := decodeNM? tail
      ⟨parsed.value.map (List.cons true), parsed.ticks + 5,
        parsed.peak + 1⟩
  | _ => ⟨none, 3, 2⟩

@[simp] theorem decodeNM?_value (term : Term) :
    (decodeNM? term).value = decodeN? term := by
  induction term with
  | s => rfl
  | app fn arg ihFn ihArg =>
      cases fn with
      | s => rfl
      | app head value =>
          cases head with
          | app deeper supplied => rfl
          | s =>
              cases value with
              | s => simp [decodeNM?, decodeN?, ihArg]
              | app valueFn valueArg =>
                  cases valueFn with
                  | app deeper supplied => rfl
                  | s => cases valueArg <;> simp [decodeNM?, decodeN?, ihArg]

/-- Counted construction of the normal protected source seed. -/
def encodeNM : BitWord -> Meter Term
  | [] => ⟨.s, 1, 1⟩
  | false :: bits =>
      let tail := encodeNM bits
      ⟨passive .s tail.value, tail.ticks + 4, tail.peak + 2⟩
  | true :: bits =>
      let tail := encodeNM bits
      ⟨passive b tail.value, tail.ticks + 6, tail.peak + 2⟩

@[simp] theorem encodeNM_value (bits : BitWord) :
    (encodeNM bits).value = N bits := by
  induction bits with
  | nil => rfl
  | cons bit bits ih => cases bit <;> simp [encodeNM, N, ih]

theorem encodeNM_ticks_le (bits : BitWord) :
    (encodeNM bits).ticks <= 6 * bits.length + 1 := by
  induction bits with
  | nil => exact Nat.le_refl 1
  | cons bit bits ih =>
      cases bit
      · calc
          (encodeNM (false :: bits)).ticks =
              (encodeNM bits).ticks + 4 := rfl
          _ <= (6 * bits.length + 1) + 4 :=
            Nat.add_le_add_right ih 4
          _ <= ((6 * bits.length + 1) + 4) + 2 :=
            Nat.le_add_right _ _
          _ = 6 * (false :: bits).length + 1 := by
            simp only [List.length_cons, Nat.mul_succ]
      · calc
          (encodeNM (true :: bits)).ticks =
              (encodeNM bits).ticks + 6 := rfl
          _ <= (6 * bits.length + 1) + 6 :=
            Nat.add_le_add_right ih 6
          _ = 6 * (true :: bits).length + 1 := by
            simp [Nat.mul_succ, Nat.add_assoc, Nat.add_comm,
              Nat.add_left_comm]

theorem encodeNM_peak (bits : BitWord) :
    (encodeNM bits).peak = 2 * bits.length + 1 := by
  induction bits with
  | nil => rfl
  | cons bit bits ih =>
      cases bit <;>
        simp [encodeNM, ih, Nat.mul_succ, Nat.add_assoc,
          Nat.add_comm, Nat.add_left_comm]

def decodeDirectionM? : BitWord ->
    Meter (Option (ProtectedTrieMachine.Direction × BitWord))
  | false :: false :: tail => ⟨some (.left, tail), 3, 2⟩
  | false :: true :: tail => ⟨some (.stay, tail), 3, 2⟩
  | true :: false :: tail => ⟨some (.right, tail), 3, 2⟩
  | _ => ⟨none, 3, 2⟩

@[simp] theorem decodeDirectionM?_value (payload : BitWord) :
    (decodeDirectionM? payload).value = decodeDirection? payload := by
  cases payload with
  | nil => rfl
  | cons first rest =>
      cases first <;> cases rest with
      | nil => rfl
      | cons second tail => cases second <;> rfl

def decodeRuleM? : BitWord -> Meter (Option (Rule × BitWord))
  | [] => ⟨none, 1, 1⟩
  | write :: tail =>
      let moved := decodeDirectionM? tail
      match moved.value with
      | none => ⟨none, moved.ticks + 1, moved.peak⟩
      | some (direction, rest) =>
          let numbered := decodeNatM? rest
          ⟨numbered.value.map (fun pair =>
              (⟨write, direction, pair.1⟩, pair.2)),
            moved.ticks + numbered.ticks + 2,
            max moved.peak numbered.peak⟩

@[simp] theorem decodeRuleM?_value (payload : BitWord) :
    (decodeRuleM? payload).value = decodeRule? payload := by
  cases payload with
  | nil => rfl
  | cons write tail =>
      simp only [decodeRuleM?, decodeRule?, decodeDirectionM?_value]
      cases hmove : decodeDirection? tail with
      | none => simp [hmove]
      | some pair =>
          rcases pair with ⟨direction, rest⟩
          simp only [hmove, decodeNatM?_value]
          cases hnumber : decodeNat? rest <;> simp [hnumber]

def decodeRuleOptionM? : BitWord ->
    Meter (Option (Option Rule × BitWord))
  | [] => ⟨none, 1, 1⟩
  | false :: tail => ⟨some (none, tail), 1, 1⟩
  | true :: tail =>
      let parsed := decodeRuleM? tail
      ⟨parsed.value.map (fun pair => (some pair.1, pair.2)),
        parsed.ticks + 1, parsed.peak + 1⟩

@[simp] theorem decodeRuleOptionM?_value (payload : BitWord) :
    (decodeRuleOptionM? payload).value = decodeRuleOption? payload := by
  cases payload with
  | nil => rfl
  | cons present tail =>
      cases present
      · rfl
      · simp only [decodeRuleOptionM?, decodeRuleOption?, decodeRuleM?_value]
        cases hrule : decodeRule? tail <;> simp [hrule]

def decodeOrderedCellM? (payload : BitWord) :
    Meter (Option (OrderedCell × BitWord)) :=
  let first := decodeRuleOptionM? payload
  match first.value with
  | none => ⟨none, first.ticks + 1, first.peak⟩
  | some (slot0, tail) =>
      let second := decodeRuleOptionM? tail
      ⟨second.value.map (fun pair => (⟨slot0, pair.1⟩, pair.2)),
        first.ticks + second.ticks + 1,
        max first.peak second.peak⟩

@[simp] theorem decodeOrderedCellM?_value (payload : BitWord) :
    (decodeOrderedCellM? payload).value = decodeOrderedCell? payload := by
  unfold decodeOrderedCellM? decodeOrderedCell?
  rw [← decodeRuleOptionM?_value payload]
  cases hfirst : (decodeRuleOptionM? payload).value with
  | none => simp only [hfirst, Meter.value, Option.bind_eq_bind,
      Option.bind]
  | some pair =>
      rcases pair with ⟨slot0, tail⟩
      simp only [hfirst, Meter.value, Option.bind_eq_bind, Option.bind]
      rw [decodeRuleOptionM?_value tail]
      cases hsecond : decodeRuleOption? tail with
      | none => simp only [hsecond, Option.map_none]
      | some pair =>
          rcases pair with ⟨slot1, rest⟩
          simp only [hsecond, Option.map_some, Option.pure_def]

def decodeStateRowM? (payload : BitWord) :
    Meter (Option (StateRow × BitWord)) :=
  let first := decodeOrderedCellM? payload
  match first.value with
  | none => ⟨none, first.ticks + 1, first.peak⟩
  | some (onFalse, tail) =>
      let second := decodeOrderedCellM? tail
      ⟨second.value.map (fun pair => (⟨onFalse, pair.1⟩, pair.2)),
        first.ticks + second.ticks + 1,
        max first.peak second.peak⟩

@[simp] theorem decodeStateRowM?_value (payload : BitWord) :
    (decodeStateRowM? payload).value = decodeStateRow? payload := by
  unfold decodeStateRowM? decodeStateRow?
  rw [← decodeOrderedCellM?_value payload]
  cases hfirst : (decodeOrderedCellM? payload).value with
  | none => simp only [hfirst, Meter.value, Option.bind_eq_bind,
      Option.bind]
  | some pair =>
      rcases pair with ⟨onFalse, tail⟩
      simp only [hfirst, Meter.value, Option.bind_eq_bind, Option.bind]
      rw [decodeOrderedCellM?_value tail]
      cases hsecond : decodeOrderedCell? tail with
      | none => simp only [hsecond, Option.map_none]
      | some pair =>
          rcases pair with ⟨onTrue, rest⟩
          simp only [hsecond, Option.map_some, Option.pure_def]

def decodeStateRowsNM? : Nat -> BitWord ->
    Meter (Option (List StateRow × BitWord))
  | 0, payload => ⟨some ([], payload), 1, 1⟩
  | count + 1, payload =>
      let first := decodeStateRowM? payload
      match first.value with
      | none => ⟨none, first.ticks + 1, first.peak⟩
      | some (state, tail) =>
          let rest := decodeStateRowsNM? count tail
          ⟨rest.value.map (fun pair => (state :: pair.1, pair.2)),
            first.ticks + rest.ticks + 1,
            max first.peak (rest.peak + 1)⟩

@[simp] theorem decodeStateRowsNM?_value (count : Nat) (payload : BitWord) :
    (decodeStateRowsNM? count payload).value =
      decodeStateRowsN? count payload := by
  induction count generalizing payload with
  | zero => rfl
  | succ count ih =>
      unfold decodeStateRowsNM? decodeStateRowsN?
      rw [← decodeStateRowM?_value payload]
      cases hfirst : (decodeStateRowM? payload).value with
      | none => simp only [hfirst, Meter.value, Option.bind_eq_bind,
          Option.bind]
      | some pair =>
          rcases pair with ⟨state, tail⟩
          simp only [hfirst, Meter.value, Option.bind_eq_bind, Option.bind]
          rw [ih tail]
          cases hrest : decodeStateRowsN? count tail with
          | none => simp only [hrest, Option.map_none]
          | some pair =>
              rcases pair with ⟨states, rest⟩
              simp only [hrest, Option.map_some, Option.pure_def]

def decodeMachineM? (payload : BitWord) :
    Meter (Option (Machine × BitWord)) :=
  let counted := decodeNatM? payload
  match counted.value with
  | none => ⟨none, counted.ticks + 1, counted.peak⟩
  | some (count, tail) =>
      let rows := decodeStateRowsNM? count tail
      ⟨rows.value.map (fun pair => (⟨pair.1⟩, pair.2)),
        counted.ticks + rows.ticks + 1,
        max counted.peak rows.peak⟩

@[simp] theorem decodeMachineM?_value (payload : BitWord) :
    (decodeMachineM? payload).value = decodeMachine? payload := by
  unfold decodeMachineM? decodeMachine?
  rw [← decodeNatM?_value payload]
  cases hcount : (decodeNatM? payload).value with
  | none => simp only [hcount, Meter.value, Option.bind_eq_bind,
      Option.bind]
  | some pair =>
      rcases pair with ⟨count, tail⟩
      simp only [hcount, Meter.value, Option.bind_eq_bind, Option.bind]
      rw [decodeStateRowsNM?_value count tail]
      cases hrows : decodeStateRowsN? count tail with
      | none => simp only [hrows, Option.map_none]
      | some pair =>
          rcases pair with ⟨rows, rest⟩
          simp only [hrows, Option.map_some, Option.pure_def]

def decodeInstancePrefixM? (payload : BitWord) :
    Meter (Option (Instance × BitWord)) :=
  let machine := decodeMachineM? payload
  match machine.value with
  | none => ⟨none, machine.ticks + 1, machine.peak⟩
  | some (table, tail) =>
      let state := decodeNatM? tail
      match state.value with
      | none => ⟨none, machine.ticks + state.ticks + 1,
          max machine.peak state.peak⟩
      | some (initial, tail) =>
          let input := decodeBitsM? tail
          ⟨input.value.map (fun pair => (⟨table, initial, pair.1⟩, pair.2)),
            machine.ticks + state.ticks + input.ticks + 1,
            max machine.peak (max state.peak input.peak)⟩

@[simp] theorem decodeInstancePrefixM?_value (payload : BitWord) :
    (decodeInstancePrefixM? payload).value =
      decodeInstancePrefix? payload := by
  unfold decodeInstancePrefixM? decodeInstancePrefix?
  rw [← decodeMachineM?_value payload]
  cases hmachine : (decodeMachineM? payload).value with
  | none => simp only [hmachine, Meter.value, Option.bind_eq_bind,
      Option.bind]
  | some pair =>
      rcases pair with ⟨machine, tail⟩
      simp only [hmachine, Meter.value, Option.bind_eq_bind, Option.bind]
      rw [decodeNatM?_value tail]
      cases hstate : decodeNat? tail with
      | none => simp only [hstate]
      | some statePair =>
          rcases statePair with ⟨initial, rest⟩
          simp only [hstate]
          rw [decodeBitsM?_value rest]
          cases hinput : decodeBits? rest with
          | none => simp only [hinput, Option.map_none]
          | some input =>
              rcases input with ⟨bits, suffix⟩
              simp only [hinput, Option.map_some, Option.pure_def]

/-! ### Counted canonical source re-encoder -/

def encodeDirectionM (direction : ProtectedTrieMachine.Direction) : Meter BitWord :=
  ⟨encodeDirection direction, 2, 2⟩

def encodeRuleM (rule : Rule) : Meter BitWord :=
  let numbered := encodeNatM rule.nextState
  ⟨rule.write :: encodeDirection rule.move ++ numbered.value,
    numbered.ticks + 4, numbered.peak + 3⟩

@[simp] theorem encodeRuleM_value (rule : Rule) :
    (encodeRuleM rule).value = encodeRule rule := by
  simp [encodeRuleM, encodeRule, encodeNatM_value]

def encodeRuleOptionM : Option Rule -> Meter BitWord
  | none => ⟨[false], 1, 1⟩
  | some rule =>
      let encoded := encodeRuleM rule
      ⟨true :: encoded.value, encoded.ticks + 1, encoded.peak + 1⟩

@[simp] theorem encodeRuleOptionM_value (slot : Option Rule) :
    (encodeRuleOptionM slot).value = encodeRuleOption slot := by
  cases slot <;> simp [encodeRuleOptionM, encodeRuleOption, encodeRuleM_value]

def encodeOrderedCellM (cell : OrderedCell) : Meter BitWord :=
  let first := encodeRuleOptionM cell.slot0
  let second := encodeRuleOptionM cell.slot1
  let joined := appendM first.value second.value
  ⟨joined.value, first.ticks + second.ticks + joined.ticks + 1,
    max first.peak (max second.peak joined.peak)⟩

@[simp] theorem encodeOrderedCellM_value (cell : OrderedCell) :
    (encodeOrderedCellM cell).value = encodeOrderedCell cell := by
  simp [encodeOrderedCellM, encodeOrderedCell, appendM_value,
    encodeRuleOptionM_value]

def encodeStateRowM (state : StateRow) : Meter BitWord :=
  let first := encodeOrderedCellM state.onFalse
  let second := encodeOrderedCellM state.onTrue
  let joined := appendM first.value second.value
  ⟨joined.value, first.ticks + second.ticks + joined.ticks + 1,
    max first.peak (max second.peak joined.peak)⟩

@[simp] theorem encodeStateRowM_value (state : StateRow) :
    (encodeStateRowM state).value = encodeStateRow state := by
  simp [encodeStateRowM, encodeStateRow, appendM_value,
    encodeOrderedCellM_value]

def encodeStateDataM : List StateRow -> Meter BitWord
  | [] => ⟨[], 1, 1⟩
  | state :: states =>
      let first := encodeStateRowM state
      let rest := encodeStateDataM states
      let joined := appendM first.value rest.value
      ⟨joined.value, first.ticks + rest.ticks + joined.ticks + 1,
        max first.peak (max rest.peak joined.peak)⟩

@[simp] theorem encodeStateDataM_value (states : List StateRow) :
    (encodeStateDataM states).value = encodeStateData states := by
  induction states with
  | nil => rfl
  | cons state states ih =>
      simp [encodeStateDataM, encodeStateData, appendM_value,
        encodeStateRowM_value, ih]

def encodeMachineM (machine : Machine) : Meter BitWord :=
  let measured := lengthM machine.states
  let length := encodeNatM measured.value
  let rows := encodeStateDataM machine.states
  let joined := appendM length.value rows.value
  ⟨joined.value,
    measured.ticks + length.ticks + rows.ticks + joined.ticks + 1,
    max measured.peak (max length.peak (max rows.peak joined.peak))⟩

@[simp] theorem encodeMachineM_value (machine : Machine) :
    (encodeMachineM machine).value = encodeMachine machine := by
  simp [encodeMachineM, encodeMachine, appendM_value, lengthM_value,
    encodeNatM_value, encodeStateDataM_value]

def encodeInstanceM (source : Instance) : Meter BitWord :=
  let machine := encodeMachineM source.machine
  let state := encodeNatM source.initialState
  let input := encodeBitsM source.input
  let first := appendM machine.value state.value
  let all := appendM first.value input.value
  ⟨all.value,
    machine.ticks + state.ticks + input.ticks + first.ticks + all.ticks + 1,
    max machine.peak
      (max state.peak (max input.peak (max first.peak all.peak)))⟩

@[simp] theorem encodeInstanceM_value (source : Instance) :
    (encodeInstanceM source).value = encodeInstance source := by
  simp [encodeInstanceM, encodeInstance, appendM_value, encodeMachineM_value,
    encodeNatM_value, encodeBitsM_value]

/-! ### Linear accumulator encoder used by the public evaluator -/

def encodeNatOntoM : Nat -> BitWord -> Meter BitWord
  | 0, tail => ⟨false :: tail, 1, 1⟩
  | number + 1, tail =>
      let rest := encodeNatOntoM number tail
      ⟨true :: rest.value, rest.ticks + 1, rest.peak + 1⟩

@[simp] theorem encodeNatOntoM_value (number : Nat) (tail : BitWord) :
    (encodeNatOntoM number tail).value = encodeNat number ++ tail := by
  induction number with
  | zero => rfl
  | succ number ih => simp [encodeNatOntoM, encodeNat, ih]

def encodeBitsOntoM (bits tail : BitWord) : Meter BitWord :=
  let measured := lengthM bits
  let joined := appendM bits tail
  let prefixed := encodeNatOntoM measured.value joined.value
  ⟨prefixed.value,
    measured.ticks + joined.ticks + prefixed.ticks + 1,
    max measured.peak (max joined.peak prefixed.peak)⟩

@[simp] theorem encodeBitsOntoM_value (bits tail : BitWord) :
    (encodeBitsOntoM bits tail).value = encodeBits bits ++ tail := by
  simp [encodeBitsOntoM, encodeBits, encodeNatOntoM_value,
    lengthM_value, appendM_value, List.append_assoc]

def encodeDirectionOntoM
    (direction : ProtectedTrieMachine.Direction) (tail : BitWord) :
    Meter BitWord :=
  match direction with
  | .left => ⟨false :: false :: tail, 2, 2⟩
  | .stay => ⟨false :: true :: tail, 2, 2⟩
  | .right => ⟨true :: false :: tail, 2, 2⟩

@[simp] theorem encodeDirectionOntoM_value
    (direction : ProtectedTrieMachine.Direction) (tail : BitWord) :
    (encodeDirectionOntoM direction tail).value =
      encodeDirection direction ++ tail := by
  cases direction <;> rfl

def encodeRuleOntoM (rule : Rule) (tail : BitWord) : Meter BitWord :=
  let numbered := encodeNatOntoM rule.nextState tail
  let directed := encodeDirectionOntoM rule.move numbered.value
  ⟨rule.write :: directed.value,
    numbered.ticks + directed.ticks + 2,
    max numbered.peak (directed.peak + 1)⟩

@[simp] theorem encodeRuleOntoM_value (rule : Rule) (tail : BitWord) :
    (encodeRuleOntoM rule tail).value = encodeRule rule ++ tail := by
  simp [encodeRuleOntoM, encodeRule, encodeNatOntoM_value,
    encodeDirectionOntoM_value, List.append_assoc]

def encodeRuleOptionOntoM (slot : Option Rule) (tail : BitWord) :
    Meter BitWord :=
  match slot with
  | none => ⟨false :: tail, 1, 1⟩
  | some rule =>
      let encoded := encodeRuleOntoM rule tail
      ⟨true :: encoded.value, encoded.ticks + 1, encoded.peak + 1⟩

@[simp] theorem encodeRuleOptionOntoM_value
    (slot : Option Rule) (tail : BitWord) :
    (encodeRuleOptionOntoM slot tail).value =
      encodeRuleOption slot ++ tail := by
  cases slot <;> simp [encodeRuleOptionOntoM, encodeRuleOption,
    encodeRuleOntoM_value]

def encodeOrderedCellOntoM (cell : OrderedCell) (tail : BitWord) :
    Meter BitWord :=
  let second := encodeRuleOptionOntoM cell.slot1 tail
  let first := encodeRuleOptionOntoM cell.slot0 second.value
  ⟨first.value, second.ticks + first.ticks + 1,
    max second.peak first.peak⟩

@[simp] theorem encodeOrderedCellOntoM_value
    (cell : OrderedCell) (tail : BitWord) :
    (encodeOrderedCellOntoM cell tail).value =
      encodeOrderedCell cell ++ tail := by
  simp [encodeOrderedCellOntoM, encodeOrderedCell,
    encodeRuleOptionOntoM_value, List.append_assoc]

def encodeStateRowOntoM (state : StateRow) (tail : BitWord) :
    Meter BitWord :=
  let second := encodeOrderedCellOntoM state.onTrue tail
  let first := encodeOrderedCellOntoM state.onFalse second.value
  ⟨first.value, second.ticks + first.ticks + 1,
    max second.peak first.peak⟩

@[simp] theorem encodeStateRowOntoM_value
    (state : StateRow) (tail : BitWord) :
    (encodeStateRowOntoM state tail).value =
      encodeStateRow state ++ tail := by
  simp [encodeStateRowOntoM, encodeStateRow,
    encodeOrderedCellOntoM_value, List.append_assoc]

def encodeStateDataOntoM : List StateRow -> BitWord -> Meter BitWord
  | [], tail => ⟨tail, 1, 1⟩
  | state :: states, tail =>
      let rest := encodeStateDataOntoM states tail
      let first := encodeStateRowOntoM state rest.value
      ⟨first.value, rest.ticks + first.ticks + 1,
        max (rest.peak + 1) first.peak⟩

@[simp] theorem encodeStateDataOntoM_value
    (states : List StateRow) (tail : BitWord) :
    (encodeStateDataOntoM states tail).value =
      encodeStateData states ++ tail := by
  induction states with
  | nil => rfl
  | cons state states ih =>
      simp [encodeStateDataOntoM, encodeStateData,
        encodeStateRowOntoM_value, ih, List.append_assoc]

def encodeMachineOntoM (machine : Machine) (tail : BitWord) :
    Meter BitWord :=
  let rows := encodeStateDataOntoM machine.states tail
  let measured := lengthM machine.states
  let count := encodeNatOntoM measured.value rows.value
  ⟨count.value, rows.ticks + measured.ticks + count.ticks + 1,
    max rows.peak (max measured.peak count.peak)⟩

@[simp] theorem encodeMachineOntoM_value
    (machine : Machine) (tail : BitWord) :
    (encodeMachineOntoM machine tail).value =
      encodeMachine machine ++ tail := by
  simp [encodeMachineOntoM, encodeMachine, encodeNatOntoM_value,
    encodeStateDataOntoM_value, lengthM_value, List.append_assoc]

def encodeInstanceLinearM (source : Instance) : Meter BitWord :=
  let input := encodeBitsOntoM source.input []
  let initial := encodeNatOntoM source.initialState input.value
  let machine := encodeMachineOntoM source.machine initial.value
  ⟨machine.value, input.ticks + initial.ticks + machine.ticks + 1,
    max input.peak (max initial.peak machine.peak)⟩

@[simp] theorem encodeInstanceLinearM_value (source : Instance) :
    (encodeInstanceLinearM source).value = encodeInstance source := by
  simp [encodeInstanceLinearM, encodeInstance, encodeBitsOntoM_value,
    encodeNatOntoM_value, encodeMachineOntoM_value, List.append_assoc]

theorem encodeNatOntoM_ticks (number : Nat) (tail : BitWord) :
    (encodeNatOntoM number tail).ticks = number + 1 := by
  induction number with
  | zero => rfl
  | succ number ih => simp [encodeNatOntoM, ih]

theorem encodeNatOntoM_peak (number : Nat) (tail : BitWord) :
    (encodeNatOntoM number tail).peak = number + 1 := by
  induction number with
  | zero => rfl
  | succ number ih => simp [encodeNatOntoM, ih]

theorem encodeBitsOntoM_ticks (bits tail : BitWord) :
    (encodeBitsOntoM bits tail).ticks = 3 * bits.length + 4 := by
  simp only [encodeBitsOntoM, lengthM_ticks, appendM_ticks,
    encodeNatOntoM_ticks, lengthM_value]
  rw [show 3 = 1 + 1 + 1 by rfl, Nat.add_mul, Nat.add_mul]
  simp only [Nat.one_mul]
  simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

theorem encodeBitsOntoM_peak_le (bits tail : BitWord) :
    (encodeBitsOntoM bits tail).peak <= bits.length + 1 := by
  unfold encodeBitsOntoM
  simp only [lengthM_value, lengthM_peak, appendM_peak,
    encodeNatOntoM_peak]
  exact (Nat.max_le).2 ⟨Nat.le_refl _, (Nat.max_le).2
    ⟨Nat.le_refl _, Nat.le_refl _⟩⟩

theorem encodeRule_length (rule : Rule) :
    (encodeRule rule).length = rule.nextState + 4 := by
  simp [encodeRule, encodeDirection, encodeNat_length]
  cases rule.move <;> simp [Nat.add_assoc, Nat.add_comm,
    Nat.add_left_comm]

theorem encodeRuleOntoM_ticks (rule : Rule) (tail : BitWord) :
    (encodeRuleOntoM rule tail).ticks = (encodeRule rule).length + 1 := by
  rcases rule with ⟨write, move, nextState⟩
  cases move <;>
    simp [encodeRuleOntoM, encodeNatOntoM_ticks,
      encodeDirectionOntoM, encodeRule_length]

theorem encodeRuleOntoM_peak_le (rule : Rule) (tail : BitWord) :
    (encodeRuleOntoM rule tail).peak <= (encodeRule rule).length + 1 := by
  unfold encodeRuleOntoM
  simp only [encodeNatOntoM_peak, encodeDirectionOntoM]
  apply (Nat.max_le).2
  constructor
  · rw [encodeRule_length]
    exact Nat.add_le_add_left (by decide : 1 <= 5) rule.nextState
  · rw [encodeRule_length]
    cases rule.move <;> simp

theorem encodeRuleOptionOntoM_ticks_le
    (slot : Option Rule) (tail : BitWord) :
    (encodeRuleOptionOntoM slot tail).ticks <=
      (encodeRuleOption slot).length + 1 := by
  cases slot with
  | none => simp [encodeRuleOptionOntoM, encodeRuleOption]
  | some rule =>
      simp [encodeRuleOptionOntoM, encodeRuleOption,
        encodeRuleOntoM_ticks]

theorem encodeRuleOptionOntoM_peak_le
    (slot : Option Rule) (tail : BitWord) :
    (encodeRuleOptionOntoM slot tail).peak <=
      (encodeRuleOption slot).length + 1 := by
  cases slot with
  | none => simp [encodeRuleOptionOntoM, encodeRuleOption]
  | some rule =>
      simp only [encodeRuleOptionOntoM, encodeRuleOption,
        List.length_cons, encodeRuleOntoM_value]
      exact Nat.add_le_add_right (encodeRuleOntoM_peak_le rule tail) 1

theorem encodeOrderedCell_length (cell : OrderedCell) :
    (encodeOrderedCell cell).length =
      (encodeRuleOption cell.slot0).length +
        (encodeRuleOption cell.slot1).length := by
  simp [encodeOrderedCell]

theorem encodeOrderedCellOntoM_ticks_le
    (cell : OrderedCell) (tail : BitWord) :
    (encodeOrderedCellOntoM cell tail).ticks <=
      (encodeOrderedCell cell).length + 3 := by
  unfold encodeOrderedCellOntoM
  have hsecond := encodeRuleOptionOntoM_ticks_le cell.slot1 tail
  have hfirst := encodeRuleOptionOntoM_ticks_le cell.slot0
    (encodeRuleOptionOntoM cell.slot1 tail).value
  have hsum := Nat.add_le_add hsecond hfirst
  rw [encodeOrderedCell_length]
  calc
    (encodeOrderedCellOntoM cell tail).ticks <=
        ((encodeRuleOption cell.slot1).length + 1) +
          ((encodeRuleOption cell.slot0).length + 1) + 1 :=
      Nat.add_le_add_right hsum 1
    _ = (encodeRuleOption cell.slot0).length +
          (encodeRuleOption cell.slot1).length + 3 := by
      rw [show 3 = 1 + 1 + 1 by rfl]
      simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

theorem encodeOrderedCellOntoM_peak_le
    (cell : OrderedCell) (tail : BitWord) :
    (encodeOrderedCellOntoM cell tail).peak <=
      (encodeOrderedCell cell).length + 1 := by
  unfold encodeOrderedCellOntoM
  apply (Nat.max_le).2
  constructor
  · exact Nat.le_trans (encodeRuleOptionOntoM_peak_le cell.slot1 tail)
      (by
        rw [encodeOrderedCell_length]
        exact Nat.add_le_add_right
          (Nat.le_add_left _ _) 1)
  · exact Nat.le_trans
      (encodeRuleOptionOntoM_peak_le cell.slot0
        (encodeRuleOptionOntoM cell.slot1 tail).value)
      (by
        rw [encodeOrderedCell_length]
        exact Nat.add_le_add_right
          (Nat.le_add_right _ _) 1)

theorem encodeRuleOption_length_pos (slot : Option Rule) :
    1 <= (encodeRuleOption slot).length := by
  cases slot <;> simp [encodeRuleOption]

theorem encodeOrderedCell_length_ge_two (cell : OrderedCell) :
    2 <= (encodeOrderedCell cell).length := by
  rw [encodeOrderedCell_length]
  exact Nat.add_le_add
    (encodeRuleOption_length_pos cell.slot0)
    (encodeRuleOption_length_pos cell.slot1)

theorem encodeStateRow_length (state : StateRow) :
    (encodeStateRow state).length =
      (encodeOrderedCell state.onFalse).length +
        (encodeOrderedCell state.onTrue).length := by
  simp [encodeStateRow]

theorem encodeStateRow_length_ge_four (state : StateRow) :
    4 <= (encodeStateRow state).length := by
  rw [encodeStateRow_length]
  exact Nat.add_le_add
    (encodeOrderedCell_length_ge_two state.onFalse)
    (encodeOrderedCell_length_ge_two state.onTrue)

theorem encodeStateRowOntoM_ticks_le
    (state : StateRow) (tail : BitWord) :
    (encodeStateRowOntoM state tail).ticks <=
      3 * (encodeStateRow state).length := by
  unfold encodeStateRowOntoM
  have hsecond := encodeOrderedCellOntoM_ticks_le state.onTrue tail
  have hfirst := encodeOrderedCellOntoM_ticks_le state.onFalse
    (encodeOrderedCellOntoM state.onTrue tail).value
  have hsum := Nat.add_le_add hsecond hfirst
  have hraw : (encodeStateRowOntoM state tail).ticks <=
      (encodeStateRow state).length + 7 := by
    rw [encodeStateRow_length]
    calc
      (encodeStateRowOntoM state tail).ticks <=
          ((encodeOrderedCell state.onTrue).length + 3) +
            ((encodeOrderedCell state.onFalse).length + 3) + 1 :=
        Nat.add_le_add_right hsum 1
      _ = (encodeOrderedCell state.onFalse).length +
          (encodeOrderedCell state.onTrue).length + 7 := by
        rw [show 7 = 3 + 3 + 1 by rfl]
        simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
  have hfour := encodeStateRow_length_ge_four state
  have htwice : 7 <= 2 * (encodeStateRow state).length :=
    Nat.le_trans (by decide : 7 <= 2 * 4)
      (Nat.mul_le_mul_left 2 hfour)
  have hpad := Nat.add_le_add_left htwice
    (encodeStateRow state).length
  exact Nat.le_trans hraw (by
    simpa [Nat.succ_mul, Nat.add_assoc] using hpad)

theorem encodeStateRowOntoM_peak_le
    (state : StateRow) (tail : BitWord) :
    (encodeStateRowOntoM state tail).peak <=
      (encodeStateRow state).length + 1 := by
  unfold encodeStateRowOntoM
  apply (Nat.max_le).2
  constructor
  · exact Nat.le_trans (encodeOrderedCellOntoM_peak_le state.onTrue tail)
      (by
        rw [encodeStateRow_length]
        exact Nat.add_le_add_right (Nat.le_add_left _ _) 1)
  · exact Nat.le_trans
      (encodeOrderedCellOntoM_peak_le state.onFalse
        (encodeOrderedCellOntoM state.onTrue tail).value)
      (by
        rw [encodeStateRow_length]
        exact Nat.add_le_add_right (Nat.le_add_right _ _) 1)

theorem encodeStateDataOntoM_ticks_le
    (states : List StateRow) (tail : BitWord) :
    (encodeStateDataOntoM states tail).ticks <=
      4 * (encodeStateData states).length + 1 := by
  induction states with
  | nil => exact Nat.le_refl 1
  | cons state states ih =>
      unfold encodeStateDataOntoM encodeStateData
      have hstate := encodeStateRowOntoM_ticks_le state
        (encodeStateDataOntoM states tail).value
      have hsum := Nat.add_le_add ih hstate
      have hone : 1 <= (encodeStateRow state).length :=
        Nat.le_trans (by decide : 1 <= 4)
          (encodeStateRow_length_ge_four state)
      have hslack : 2 <= (encodeStateRow state).length + 1 :=
        Nat.succ_le_succ hone
      calc
        (encodeStateDataOntoM (state :: states) tail).ticks <=
            (4 * (encodeStateData states).length + 1) +
              3 * (encodeStateRow state).length + 1 :=
          Nat.add_le_add_right hsum 1
        _ = 4 * (encodeStateData states).length +
              3 * (encodeStateRow state).length + 2 := by
          calc
            4 * (encodeStateData states).length + 1 +
                3 * (encodeStateRow state).length + 1 =
              4 * (encodeStateData states).length +
                3 * (encodeStateRow state).length + (1 + 1) := by
              simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
            _ = 4 * (encodeStateData states).length +
                3 * (encodeStateRow state).length + 2 := by rfl
        _ <= 4 * (encodeStateData states).length +
              3 * (encodeStateRow state).length +
                ((encodeStateRow state).length + 1) :=
          Nat.add_le_add_left hslack _
        _ = 4 * (encodeStateData (state :: states)).length + 1 := by
          simp only [encodeStateData, List.length_append, Nat.mul_add]
          have hfour : 4 * (encodeStateRow state).length =
              3 * (encodeStateRow state).length +
                (encodeStateRow state).length := by
            rw [show 4 = 3 + 1 by rfl, Nat.add_mul, Nat.one_mul]
          rw [hfour]
          simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

theorem encodeStateDataOntoM_peak_le
    (states : List StateRow) (tail : BitWord) :
    (encodeStateDataOntoM states tail).peak <=
      (encodeStateData states).length + states.length + 1 := by
  induction states with
  | nil => exact Nat.le_refl 1
  | cons state states ih =>
      unfold encodeStateDataOntoM encodeStateData
      apply (Nat.max_le).2
      constructor
      · have hplus := Nat.add_le_add_right ih 1
        have hembed := Nat.le_add_left
          ((encodeStateData states).length + states.length + 1 + 1)
          (encodeStateRow state).length
        exact Nat.le_trans hplus (by
          simpa [List.length_append, Nat.add_assoc, Nat.add_comm,
            Nat.add_left_comm] using hembed)
      · have hstate := encodeStateRowOntoM_peak_le state
          (encodeStateDataOntoM states tail).value
        have hembed := Nat.le_add_right
          ((encodeStateRow state).length + 1)
          ((encodeStateData states).length + states.length + 1)
        exact Nat.le_trans hstate (by
          simpa [List.length_append, Nat.add_assoc, Nat.add_comm,
            Nat.add_left_comm] using hembed)

theorem states_length_le_encodeStateData_length (states : List StateRow) :
    states.length <= (encodeStateData states).length := by
  induction states with
  | nil => exact Nat.le_refl 0
  | cons state states ih =>
      simp only [List.length_cons, encodeStateData, List.length_append]
      have hone : 1 <= (encodeStateRow state).length :=
        Nat.le_trans (by decide : 1 <= 4)
          (encodeStateRow_length_ge_four state)
      simpa [Nat.add_comm] using Nat.add_le_add ih hone

theorem encodeMachineOntoM_ticks_le
    (machine : Machine) (tail : BitWord) :
    (encodeMachineOntoM machine tail).ticks <=
      8 * ((encodeMachine machine).length + 1) := by
  unfold encodeMachineOntoM
  have hrows := encodeStateDataOntoM_ticks_le machine.states tail
  have hstates := states_length_le_encodeStateData_length machine.states
  have hmeasureLe : (lengthM machine.states).ticks <=
      (encodeStateData machine.states).length + 1 := by
    rw [lengthM_ticks]
    exact Nat.add_le_add_right hstates 1
  have hcountLe :
      (encodeNatOntoM (lengthM machine.states).value
        (encodeStateDataOntoM machine.states tail).value).ticks <=
        (encodeStateData machine.states).length + 1 := by
    rw [encodeNatOntoM_ticks, lengthM_value]
    exact Nat.add_le_add_right hstates 1
  have hall := Nat.add_le_add
    (Nat.add_le_add hrows hmeasureLe) hcountLe
  have hraw : (encodeMachineOntoM machine tail).ticks <=
      6 * (encodeStateData machine.states).length + 4 := by
    calc
      (encodeMachineOntoM machine tail).ticks <=
          (4 * (encodeStateData machine.states).length + 1) +
            ((encodeStateData machine.states).length + 1) +
            ((encodeStateData machine.states).length + 1) + 1 :=
        Nat.add_le_add_right hall 1
      _ = 6 * (encodeStateData machine.states).length + 4 := by
        rw [show 6 = 4 + 1 + 1 by rfl, Nat.add_mul, Nat.add_mul]
        simp only [Nat.one_mul]
        calc
          4 * (encodeStateData machine.states).length + 1 +
                ((encodeStateData machine.states).length + 1) +
              ((encodeStateData machine.states).length + 1) + 1 =
            4 * (encodeStateData machine.states).length +
              (encodeStateData machine.states).length +
              (encodeStateData machine.states).length +
              (1 + 1 + 1 + 1) := by
            simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
          _ = 4 * (encodeStateData machine.states).length +
              (encodeStateData machine.states).length +
              (encodeStateData machine.states).length + 4 := by rfl
  have hcoeff :
      6 * (encodeStateData machine.states).length + 4 <=
        8 * (encodeStateData machine.states).length + 8 :=
    Nat.add_le_add
      (Nat.mul_le_mul_right (encodeStateData machine.states).length
        (by decide : 6 <= 8))
      (by decide : 4 <= 8)
  have hdata : (encodeStateData machine.states).length + 1 <=
      (encodeMachine machine).length + 1 := by
    unfold encodeMachine
    rw [List.length_append, encodeNat_length]
    have hleft : (encodeStateData machine.states).length <=
        machine.states.length + 1 +
          (encodeStateData machine.states).length := Nat.le_add_left _ _
    exact Nat.add_le_add_right hleft 1
  calc
    (encodeMachineOntoM machine tail).ticks <=
        6 * (encodeStateData machine.states).length + 4 := hraw
    _ <= 8 * (encodeStateData machine.states).length + 8 := hcoeff
    _ = 8 * ((encodeStateData machine.states).length + 1) := by
      rw [Nat.mul_add]
    _ <= 8 * ((encodeMachine machine).length + 1) :=
      Nat.mul_le_mul_left 8 hdata

theorem encodeMachineOntoM_peak_le
    (machine : Machine) (tail : BitWord) :
    (encodeMachineOntoM machine tail).peak <=
      3 * ((encodeMachine machine).length + 1) := by
  unfold encodeMachineOntoM
  have hcommon :
      (encodeStateData machine.states).length +
          machine.states.length + 1 <=
        3 * ((encodeMachine machine).length + 1) := by
    have hbase : (encodeStateData machine.states).length +
          machine.states.length + 1 <=
        (encodeMachine machine).length + 1 := by
      unfold encodeMachine
      rw [List.length_append, encodeNat_length]
      have heq : (encodeStateData machine.states).length +
          machine.states.length + 1 =
          machine.states.length + 1 +
            (encodeStateData machine.states).length := by
        simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
      rw [heq]
      exact Nat.le_succ _
    have htriple (n : Nat) : n <= 3 * n := by
      simpa using Nat.mul_le_mul_right n (by decide : 1 <= 3)
    exact Nat.le_trans hbase
      (htriple ((encodeMachine machine).length + 1))
  apply (Nat.max_le).2
  refine ⟨?_, (Nat.max_le).2 ⟨?_, ?_⟩⟩
  · exact Nat.le_trans
      (encodeStateDataOntoM_peak_le machine.states tail)
      hcommon
  · rw [lengthM_peak]
    exact Nat.le_trans (by
      have hembed := Nat.le_add_left
        (machine.states.length + 1)
        (encodeStateData machine.states).length
      simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using hembed)
      hcommon
  · rw [encodeNatOntoM_peak]
    simp only [lengthM_value]
    exact Nat.le_trans (by
      have hembed := Nat.le_add_left
        (machine.states.length + 1)
        (encodeStateData machine.states).length
      simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using hembed)
      hcommon

theorem encodeInstanceLinearM_ticks_le (source : Instance) :
    (encodeInstanceLinearM source).ticks <=
      16 * ((encodeInstance source).length + 1) := by
  unfold encodeInstanceLinearM
  have hinput := encodeBitsOntoM_ticks source.input []
  have hinitial := encodeNatOntoM_ticks source.initialState
    (encodeBitsOntoM source.input []).value
  have hmachine := encodeMachineOntoM_ticks_le source.machine
    (encodeNatOntoM source.initialState
      (encodeBitsOntoM source.input []).value).value
  have hbitsLen : (encodeBits source.input).length =
      2 * source.input.length + 1 := encodeBits_length source.input
  have hinputLe : (encodeBitsOntoM source.input []).ticks <=
      3 * ((encodeBits source.input).length + 1) := by
    rw [hinput, hbitsLen]
    have hpad := Nat.le_add_right
      (3 * source.input.length + 4)
      (3 * source.input.length + 2)
    exact Nat.le_trans hpad (Nat.le_of_eq (by
      rw [show 3 = 1 + 1 + 1 by rfl, Nat.add_mul, Nat.add_mul]
      simp [Nat.mul_add, Nat.mul_succ, Nat.succ_mul, Nat.add_assoc,
        Nat.add_comm, Nat.add_left_comm]))
  have hinitialLe :
      (encodeNatOntoM source.initialState
        (encodeBitsOntoM source.input []).value).ticks <=
        3 * (source.initialState + 1) := by
    rw [hinitial]
    have hpad := Nat.le_add_right (source.initialState + 1)
      (2 * (source.initialState + 1))
    simpa [Nat.succ_mul, Nat.add_assoc, Nat.add_comm,
      Nat.add_left_comm] using hpad
  have hall := Nat.add_le_add
    (Nat.add_le_add hinputLe hinitialLe) hmachine
  have hplus := Nat.add_le_add_right hall 1
  have hbitsEmbed : (encodeBits source.input).length + 1 <=
      (encodeInstance source).length + 1 := by
    unfold encodeInstance
    rw [List.length_append, List.length_append]
    exact Nat.add_le_add_right (Nat.le_add_left _ _) 1
  have hinitialEmbed : source.initialState + 1 <=
      (encodeInstance source).length + 1 := by
    unfold encodeInstance
    rw [List.length_append, List.length_append, encodeNat_length]
    have hleft : source.initialState + 1 <=
        (encodeMachine source.machine).length +
          (source.initialState + 1) := Nat.le_add_left _ _
    calc
      source.initialState + 1 <=
          (encodeMachine source.machine).length +
            (source.initialState + 1) := hleft
      _ <= (encodeMachine source.machine).length +
            (source.initialState + 1) +
              (encodeBits source.input).length := Nat.le_add_right _ _
      _ <= (encodeMachine source.machine).length +
            (source.initialState + 1) +
              (encodeBits source.input).length + 1 := Nat.le_succ _
  have hmachineEmbed : (encodeMachine source.machine).length + 1 <=
      (encodeInstance source).length + 1 := by
    unfold encodeInstance
    rw [List.length_append, List.length_append]
    have hleft : (encodeMachine source.machine).length <=
        (encodeMachine source.machine).length +
          (encodeNat source.initialState).length +
            (encodeBits source.input).length := by
      calc
        (encodeMachine source.machine).length <=
            (encodeMachine source.machine).length +
              (encodeNat source.initialState).length := Nat.le_add_right _ _
        _ <= (encodeMachine source.machine).length +
              (encodeNat source.initialState).length +
                (encodeBits source.input).length := Nat.le_add_right _ _
    exact Nat.add_le_add_right hleft 1
  let total := (encodeInstance source).length + 1
  have hscaledBits :
      3 * ((encodeBits source.input).length + 1) <= 3 * total :=
    Nat.mul_le_mul_left 3 hbitsEmbed
  have hscaledInitial : 3 * (source.initialState + 1) <= 3 * total :=
    Nat.mul_le_mul_left 3 hinitialEmbed
  have hscaledMachine :
      8 * ((encodeMachine source.machine).length + 1) <= 8 * total :=
    Nat.mul_le_mul_left 8 hmachineEmbed
  have hone : 1 <= total := by
    exact Nat.succ_le_succ (Nat.zero_le _)
  have hsum := Nat.add_le_add
    (Nat.add_le_add (Nat.add_le_add hscaledBits hscaledInitial)
      hscaledMachine) hone
  have hcombine : 3 * total + 3 * total + 8 * total + total =
      14 * total + total := by
    rw [show 14 = 3 + 3 + 8 by rfl, Nat.add_mul, Nat.add_mul]
  have hfinal : 14 * total + total <= 16 * total := by
    have hcoeff : 15 * total <= 16 * total :=
      Nat.mul_le_mul_right total (by decide : 15 <= 16)
    exact Nat.le_trans (Nat.le_of_eq (by
      rw [show 15 = 14 + 1 by rfl, Nat.add_mul, Nat.one_mul])) hcoeff
  exact Nat.le_trans hplus (Nat.le_trans (by
    simpa [total] using hsum) (by
      rw [hcombine]
      simpa [total] using hfinal))

theorem encodeInstanceLinearM_peak_le (source : Instance) :
    (encodeInstanceLinearM source).peak <=
      3 * ((encodeInstance source).length + 1) := by
  unfold encodeInstanceLinearM
  have htriple (n : Nat) : n <= 3 * n := by
    have h13 : 1 <= 3 := by decide
    simpa using Nat.mul_le_mul_right n h13
  have hbits : source.input.length + 1 <=
      (encodeBits source.input).length := by
    rw [encodeBits_length]
    have hpad := Nat.le_add_right (source.input.length + 1)
      source.input.length
    simpa [Nat.two_mul, Nat.add_assoc, Nat.add_comm,
      Nat.add_left_comm] using hpad
  have hinputEmbed : source.input.length + 1 <=
      (encodeInstance source).length + 1 := by
    unfold encodeInstance
    rw [List.length_append, List.length_append]
    exact Nat.le_trans hbits (by
      calc
        (encodeBits source.input).length <=
            (encodeMachine source.machine).length +
              (encodeNat source.initialState).length +
                (encodeBits source.input).length := Nat.le_add_left _ _
        _ <= (encodeMachine source.machine).length +
              (encodeNat source.initialState).length +
                (encodeBits source.input).length + 1 := Nat.le_succ _)
  have hinitialEmbed : source.initialState + 1 <=
      (encodeInstance source).length + 1 := by
    unfold encodeInstance
    rw [List.length_append, List.length_append, encodeNat_length]
    calc
      source.initialState + 1 <=
          (encodeMachine source.machine).length +
            (source.initialState + 1) := Nat.le_add_left _ _
      _ <= (encodeMachine source.machine).length +
            (source.initialState + 1) +
              (encodeBits source.input).length := Nat.le_add_right _ _
      _ <= (encodeMachine source.machine).length +
            (source.initialState + 1) +
              (encodeBits source.input).length + 1 := Nat.le_succ _
  apply (Nat.max_le).2
  refine ⟨?_, (Nat.max_le).2 ⟨?_, ?_⟩⟩
  · exact Nat.le_trans (encodeBitsOntoM_peak_le source.input [])
      (Nat.le_trans hinputEmbed
        (htriple ((encodeInstance source).length + 1)))
  · rw [encodeNatOntoM_peak]
    exact Nat.le_trans hinitialEmbed
      (htriple ((encodeInstance source).length + 1))
  · exact Nat.le_trans (encodeMachineOntoM_peak_le source.machine _)
      (by
        apply Nat.mul_le_mul_left
        unfold encodeInstance
        rw [List.length_append, List.length_append]
        calc
          (encodeMachine source.machine).length + 1 <=
              (encodeMachine source.machine).length +
                (encodeNat source.initialState).length + 1 :=
            Nat.add_le_add_right (Nat.le_add_right _ _) 1
          _ <= (encodeMachine source.machine).length +
                (encodeNat source.initialState).length +
                  (encodeBits source.input).length + 1 :=
            Nat.add_le_add_right (Nat.le_add_right _ _) 1)

def decodeInstanceM? (payload : BitWord) : Meter (Option Instance) :=
  let parsed := decodeInstancePrefixM? payload
  match parsed.value with
  | none => ⟨none, parsed.ticks + 1, parsed.peak⟩
  | some (source, tail) =>
      match tail with
      | _ :: _ => ⟨none, parsed.ticks + 1, parsed.peak⟩
      | [] =>
          let encoded := encodeInstanceLinearM source
          let equal := bitsEqM payload encoded.value
          ⟨if equal.value then some source else none,
            parsed.ticks + encoded.ticks + equal.ticks + 1,
            max parsed.peak (max encoded.peak equal.peak)⟩

@[simp] theorem decodeInstanceM?_value (payload : BitWord) :
    (decodeInstanceM? payload).value = decodeInstance? payload := by
  unfold decodeInstanceM? decodeInstance?
  simp only [decodeInstancePrefixM?_value]
  cases hparsed : decodeInstancePrefix? payload with
  | none => simp [hparsed]
  | some pair =>
      rcases pair with ⟨source, tail⟩
      cases tail with
      | cons bit tail => simp [hparsed]
      | nil =>
          simp only [hparsed, encodeInstanceLinearM_value, bitsEqM_value]
          change (if payload == encodeInstance source then some source else none) =
            if payload = encodeInstance source then some source else none
          by_cases heq : payload = encodeInstance source
          · have hbeq : (payload == encodeInstance source) = true :=
              (bitWordBEq_eq_true_iff _ _).mpr heq
            simp [heq, hbeq]
          · cases hbeq : (payload == encodeInstance source)
            · simp [heq, hbeq]
            · exact False.elim (heq
                ((bitWordBEq_eq_true_iff _ _).mp hbeq))

/-! ## Counted finite encoder -/

/-- The complete public encoder: exact source serialization, normal seed,
fixed `D 2 2` generator, and passive two-field header. -/
def runStrongEncoder (source : Instance) : Meter Term :=
  let serialized := encodeInstanceLinearM source
  let seed := encodeNM serialized.value
  ⟨passive seed.value (D 2 2),
    serialized.ticks + seed.ticks + 4,
    max serialized.peak (seed.peak + 2)⟩

@[simp] theorem runStrongEncoder_value (source : Instance) :
    (runStrongEncoder source).value = strongEncoder source := by
  simp [runStrongEncoder, strongEncoder, encoder, seededHeader, header,
    encodeInstanceLinearM_value, encodeNM_value]

/-- Explicit linear running-time allowance for the actually counted public
encoder, measured in the canonical serialized source length. -/
def strongEncoderTimeBound (source : Instance) : Nat :=
  32 * ((encodeInstance source).length + 1)

/-- Explicit linear peak auxiliary-space allowance for the counted encoder. -/
def strongEncoderSpaceBound (source : Instance) : Nat :=
  3 * ((encodeInstance source).length + 1)

theorem runStrongEncoder_ticks_le (source : Instance) :
    (runStrongEncoder source).ticks <= strongEncoderTimeBound source := by
  unfold runStrongEncoder strongEncoderTimeBound
  simp only [encodeInstanceLinearM_value]
  let total := (encodeInstance source).length + 1
  have hserialized := encodeInstanceLinearM_ticks_le source
  have hseedRaw := encodeNM_ticks_le (encodeInstance source)
  have hseed : (encodeNM (encodeInstance source)).ticks <= 6 * total := by
    have hone : 1 <= 6 := by decide
    have hadd := Nat.add_le_add_left hone
      (6 * (encodeInstance source).length)
    exact Nat.le_trans hseedRaw (by
      simpa [total, Nat.mul_succ] using hadd)
  have hfour : 4 <= 4 * total := by
    have hone : 1 <= total := Nat.succ_le_succ (Nat.zero_le _)
    simpa using Nat.mul_le_mul_left 4 hone
  have hsum := Nat.add_le_add
    (Nat.add_le_add hserialized hseed) hfour
  have hcoeff : 26 * total <= 32 * total :=
    Nat.mul_le_mul_right total (by decide : 26 <= 32)
  calc
    (encodeInstanceLinearM source).ticks +
          (encodeNM (encodeInstance source)).ticks + 4 <=
        16 * total + 6 * total + 4 * total := by
      simpa [total] using hsum
    _ = 26 * total := by
      rw [show 26 = 16 + 6 + 4 by rfl, Nat.add_mul, Nat.add_mul]
    _ <= 32 * total := hcoeff

theorem runStrongEncoder_peak_le (source : Instance) :
    (runStrongEncoder source).peak <= strongEncoderSpaceBound source := by
  unfold runStrongEncoder strongEncoderSpaceBound
  simp only [encodeInstanceLinearM_value]
  apply (Nat.max_le).2
  constructor
  · exact encodeInstanceLinearM_peak_le source
  · rw [encodeNM_peak]
    have hraw : 2 * (encodeInstance source).length + 3 <=
        3 * ((encodeInstance source).length + 1) := by
      have hcoeff : 2 * (encodeInstance source).length <=
          3 * (encodeInstance source).length :=
        Nat.mul_le_mul_right _ (by decide : 2 <= 3)
      have hthree : 3 <= 3 := Nat.le_refl 3
      have hsum := Nat.add_le_add hcoeff hthree
      simpa [Nat.mul_succ] using hsum
    exact hraw

structure StrongEncoderResourceCertificate (source : Instance) : Prop where
  value_eq : (runStrongEncoder source).value = strongEncoder source
  ticks_le : (runStrongEncoder source).ticks <= strongEncoderTimeBound source
  peak_le : (runStrongEncoder source).peak <= strongEncoderSpaceBound source

theorem strongEncoder_exact_resource_certificate (source : Instance) :
    StrongEncoderResourceCertificate source :=
  ⟨runStrongEncoder_value source, runStrongEncoder_ticks_le source,
    runStrongEncoder_peak_le source⟩

/-- Stable public spelling used by the theorem map. -/
theorem strongEncoder_resource_certificate (source : Instance) :
    StrongEncoderResourceCertificate source :=
  strongEncoder_exact_resource_certificate source

/-! ## Counted protected-path and candidate parsers -/

def prefixPathsM (bit : Bool) : List BitWord -> Meter (List BitWord)
  | [] => ⟨[], 1, 1⟩
  | path :: paths =>
      let rest := prefixPathsM bit paths
      ⟨(bit :: path) :: rest.value, rest.ticks + 2, rest.peak + 1⟩

@[simp] theorem prefixPathsM_value (bit : Bool) (paths : List BitWord) :
    (prefixPathsM bit paths).value = paths.map (List.cons bit) := by
  induction paths with
  | nil => rfl
  | cons path paths ih => simp [prefixPathsM, ih]

/-- Deep list-cell count for a materialized list of bit-word addresses. -/
def bitWordListCells : List BitWord -> Nat
  | [] => 0
  | word :: words => word.length + 1 + bitWordListCells words

theorem bitWordListCells_le_of_mem_length_le
    (words : List BitWord) (bound : Nat)
    (hbound : forall word, List.Mem word words -> word.length + 1 <= bound) :
    bitWordListCells words <= words.length * bound := by
  induction words with
  | nil => simp [bitWordListCells]
  | cons word words ih =>
      have hhead := hbound word (List.Mem.head words)
      have htail : forall query, List.Mem query words ->
          query.length + 1 <= bound :=
        fun query hmem => hbound query (List.Mem.tail word hmem)
      have hsum := Nat.add_le_add hhead (ih htail)
      simpa [bitWordListCells, Nat.succ_mul, Nat.add_assoc,
        Nat.add_comm, Nat.add_left_comm] using hsum

theorem bitWordListCells_openedPaths_le (term : Term) :
    bitWordListCells (openedPaths term) <= term.size * term.size := by
  apply Nat.le_trans (bitWordListCells_le_of_mem_length_le
    (openedPaths term) term.size ?_)
  · exact Nat.mul_le_mul_right term.size (openedPaths_length_le_size term)
  · intro path hmem
    exact Nat.succ_le_of_lt (mem_openedPaths_length_lt hmem)

theorem prefixPathsM_ticks (bit : Bool) (paths : List BitWord) :
    (prefixPathsM bit paths).ticks = 2 * paths.length + 1 := by
  induction paths with
  | nil => rfl
  | cons path paths ih =>
      simp [prefixPathsM, ih, Nat.mul_succ, Nat.add_assoc,
        Nat.add_comm, Nat.add_left_comm]

theorem prefixPathsM_peak (bit : Bool) (paths : List BitWord) :
    (prefixPathsM bit paths).peak = paths.length + 1 := by
  induction paths with
  | nil => rfl
  | cons path paths ih => simp [prefixPathsM, ih]

def openedPathsM : Term -> Meter (List BitWord)
  | .app (.app .s left) (.app (.app .s right) _junk) =>
      let leftPaths := openedPathsM left
      let rightPaths := openedPathsM right
      let leftPrefixed := prefixPathsM false leftPaths.value
      let rightPrefixed := prefixPathsM true rightPaths.value
      let joined := appendM leftPrefixed.value rightPrefixed.value
      ⟨[] :: joined.value,
        leftPaths.ticks + rightPaths.ticks + leftPrefixed.ticks +
          rightPrefixed.ticks + joined.ticks + 5,
        max leftPaths.peak
          (max rightPaths.peak
            (max leftPrefixed.peak (max rightPrefixed.peak joined.peak)))⟩
  | _ => ⟨[], 3, 2⟩

@[simp] theorem openedPathsM_value (term : Term) :
    (openedPathsM term).value = openedPaths term := by
  induction term using openedPaths.induct with
  | case1 left right junk ihLeft ihRight =>
      simp [openedPathsM, openedPaths, ihLeft, ihRight, prefixPathsM_value,
        appendM_value]
  | case2 term hnotProtected =>
      cases term with
      | s => rfl
      | app fn arg =>
          cases fn with
          | s => rfl
          | app head left =>
              cases head with
              | app deeper supplied => rfl
              | s =>
                  cases arg with
                  | s => rfl
                  | app argFn junk =>
                      cases argFn with
                      | s => rfl
                      | app argHead right =>
                          cases argHead with
                          | app deeper supplied => rfl
                          | s => exact (hnotProtected left right junk rfl).elim

def reverseM {alpha : Type} : List alpha -> Meter (List alpha)
  | [] => ⟨[], 1, 1⟩
  | item :: items =>
      let rest := reverseM items
      let joined := appendM rest.value [item]
      ⟨joined.value, rest.ticks + joined.ticks + 1,
        max (rest.peak + 1) joined.peak⟩

@[simp] theorem reverseM_value {alpha : Type} (items : List alpha) :
    (reverseM items).value = items.reverse := by
  induction items with
  | nil => rfl
  | cons item items ih => simp [reverseM, ih, appendM_value]

def parsePcAuxM : Nat -> BitWord -> Meter (Option BitWord)
  | _, [] => ⟨none, 1, 1⟩
  | count, false :: payload =>
      let length := lengthM payload
      let equal := natEqM length.value count
      ⟨if equal.value then some payload else none,
        length.ticks + equal.ticks + 2,
        max length.peak equal.peak⟩
  | count, true :: rest =>
      let parsed := parsePcAuxM (count + 1) rest
      ⟨parsed.value, parsed.ticks + 1, parsed.peak + 1⟩

theorem natBEq_eq_true_iff (left right : Nat) :
    (left == right) = true <-> left = right := by
  exact decidableBEq_eq_true_iff left right

@[simp] theorem parsePcAuxM_value (count : Nat) (word : BitWord) :
    (parsePcAuxM count word).value = parsePcAux count word := by
  induction word generalizing count with
  | nil => rfl
  | cons bit rest ih =>
      cases bit with
      | false =>
          change (if (natEqM (lengthM rest).value count).value = true
              then some rest else none) =
            (if rest.length = count then some rest else none)
          rw [lengthM_value, natEqM_value]
          by_cases heq : rest.length = count
          · rw [if_pos heq]
            have hbeq := (natBEq_eq_true_iff rest.length count).mpr heq
            rw [hbeq]
            change (if True then some rest else none) = some rest
            exact if_pos True.intro
          · rw [if_neg heq]
            cases hbeq : (rest.length == count)
            · rfl
            · exact False.elim (heq
                ((natBEq_eq_true_iff rest.length count).mp hbeq))
      | true =>
          change (parsePcAuxM (count + 1) rest).value =
            parsePcAux (count + 1) rest
          exact ih (count + 1)

def parseCandidateAuxM : BitWord -> BitWord ->
    Meter (Option (BitWord × BitWord))
  | _, [] => ⟨none, 1, 1⟩
  | reversed, false :: payloadCode =>
      let payload := parsePcAuxM 0 payloadCode
      let history := reverseM reversed
      ⟨payload.value.map (fun value => (history.value, value)),
        payload.ticks + history.ticks + 2,
        max payload.peak history.peak⟩
  | _, [true] => ⟨none, 2, 1⟩
  | reversed, true :: bit :: rest =>
      let parsed := parseCandidateAuxM (bit :: reversed) rest
      ⟨parsed.value, parsed.ticks + 2, parsed.peak + 1⟩

def parseCandidateM? (word : BitWord) :
    Meter (Option (BitWord × BitWord)) :=
  parseCandidateAuxM [] word

@[simp] theorem parseCandidateAuxM_value (reversed word : BitWord) :
    (parseCandidateAuxM reversed word).value =
      parseCandidateAux reversed word := by
  induction reversed, word using parseCandidateAux.induct with
  | case1 reversed => rfl
  | case2 reversed payloadCode =>
      change (parsePcAuxM 0 payloadCode).value.map
          (fun value => ((reverseM reversed).value, value)) =
        (parsePcAux 0 payloadCode).map
          (fun value => (reversed.reverse, value))
      have hparsed := parsePcAuxM_value 0 payloadCode
      cases hvalue : (parsePcAuxM 0 payloadCode).value with
      | none =>
          rw [hvalue] at hparsed
          rw [← hparsed]
          exact Option.map_none _
      | some value =>
          rw [hvalue] at hparsed
          rw [← hparsed, reverseM_value]
  | case3 reversed => rfl
  | case4 reversed bit rest ih =>
      change (parseCandidateAuxM (bit :: reversed) rest).value =
        parseCandidateAux (bit :: reversed) rest
      exact ih

@[simp] theorem parseCandidateM?_value (word : BitWord) :
    (parseCandidateM? word).value = parseCandidate? word := by
  exact parseCandidateAuxM_value [] word

/-! ## Counted literal label extraction -/

def lastRowM? : List Row -> Meter (Option Row)
  | [] => ⟨none, 1, 1⟩
  | [row] => ⟨some row, 2, 1⟩
  | _ :: rows =>
      let rest := lastRowM? rows
      ⟨rest.value, rest.ticks + 1, rest.peak + 1⟩

@[simp] theorem lastRowM?_value (rows : List Row) :
    (lastRowM? rows).value = lastRow? rows := by
  induction rows with
  | nil => rfl
  | cons row rows ih => cases rows <;> simp [lastRowM?, lastRow?, ih]

/-- Counted construction of the literal availability/terminal label.  Both
ordered occurrence tests use the exact counted source-machine step
procedure. -/
def labelOfRowM (machine : Machine) (row : Row) :
    Meter LiteralHistoryLabel :=
  let slot0 := stepM? machine row false
  let slot1 := stepM? machine row true
  let enabled0 := slot0.value.isSome
  let enabled1 := slot1.value.isSome
  ⟨{ finalRow := row
     slot0Enabled := enabled0
     slot1Enabled := enabled1
     terminal := !enabled0 && !enabled1 },
    slot0.ticks + slot1.ticks + 4,
    max slot0.peak slot1.peak⟩

@[simp] theorem labelOfRowM_value (machine : Machine) (row : Row) :
    (labelOfRowM machine row).value = labelOfRow machine row := by
  simp [labelOfRowM, labelOfRow, slotEnabledB, stepM?_value]

/-- The local Boolean verifier is run first.  Only an accepted literal payload
is parsed a second time to extract the final row actually returned to users. -/
def runLocalLabelVerifier (source : Instance) (history payload : BitWord) :
    Meter (Option LiteralHistoryLabel) :=
  let verified := runLocalVerifier source history payload
  if verified.value then
    let parsed := decodeTableauM? payload
    match parsed.value with
    | none => ⟨none, verified.ticks + parsed.ticks + 1,
        max verified.peak parsed.peak⟩
    | some rows =>
        let final := lastRowM? rows
        match final.value with
        | none => ⟨none,
            verified.ticks + parsed.ticks + final.ticks + 1,
            max verified.peak (max parsed.peak final.peak)⟩
        | some row =>
            let label := labelOfRowM source.machine row
            ⟨some label.value,
              verified.ticks + parsed.ticks + final.ticks + label.ticks + 1,
              max verified.peak
                (max parsed.peak (max final.peak label.peak))⟩
  else ⟨none, verified.ticks + 1, verified.peak⟩

@[simp] theorem runLocalLabelVerifier_value (source : Instance)
    (history payload : BitWord) :
    (runLocalLabelVerifier source history payload).value =
      verifyLabel? source history payload := by
  unfold runLocalLabelVerifier verifyLabel?
  simp only [runLocalVerifier_value, decodeTableauM?_value]
  cases hdecode : decodeTableau? payload with
  | none => simp [verify, hdecode]
  | some rows =>
      cases hguard : (payload == encodeTableau rows &&
          verifyRows source history rows)
      · simp [verify, hdecode, hguard]
      · simp only [verify, hdecode, hguard, Bool.true_eq, ↓reduceIte,
          lastRowM?_value]
        cases hlast : lastRow? rows <;> simp [hlast, labelOfRowM_value]

/-! ## Counted accepted-label collection -/

def collectLabelsM (source : Instance) : List BitWord ->
    Meter (List LabelledHistory)
  | [] => ⟨[], 1, 1⟩
  | path :: paths =>
      let parsed := parseCandidateM? path
      let rest := collectLabelsM source paths
      match parsed.value with
      | none => ⟨rest.value, parsed.ticks + rest.ticks + 1,
          max parsed.peak (rest.peak + 1)⟩
      | some (history, payload) =>
          let checked := runLocalLabelVerifier source history payload
          match checked.value with
          | none => ⟨rest.value,
              parsed.ticks + checked.ticks + rest.ticks + 1,
              max parsed.peak (max checked.peak (rest.peak + 1))⟩
          | some label => ⟨⟨history, payload, label⟩ :: rest.value,
              parsed.ticks + checked.ticks + rest.ticks + 1,
              max parsed.peak (max checked.peak (rest.peak + 1))⟩

@[simp] theorem collectLabelsM_value (source : Instance)
    (paths : List BitWord) :
    (collectLabelsM source paths).value = collectLabels source paths := by
  induction paths with
  | nil => rfl
  | cons path paths ih =>
      unfold collectLabelsM collectLabels
      rw [← parseCandidateM?_value path]
      cases hparse : (parseCandidateM? path).value with
      | none =>
          simp only [hparse, Meter.value]
          exact ih
      | some pair =>
          rcases pair with ⟨history, payload⟩
          simp only [hparse, Meter.value]
          rw [← runLocalLabelVerifier_value source history payload]
          cases hlabel : (runLocalLabelVerifier source history payload).value with
          | none =>
              simp only [hlabel]
              exact ih
          | some label =>
              simp only [hlabel]
              rw [ih]

/-- Counted erasure of literal labelled records to their history fields.
This supports semantic comparison with the ideal projection.  The compact
public evaluator below deliberately does not materialize ancestor closure. -/
def mapHistoriesM : List LabelledHistory -> Meter (List BitWord)
  | [] => ⟨[], 1, 1⟩
  | item :: items =>
      let rest := mapHistoriesM items
      ⟨item.history :: rest.value, rest.ticks + 2, rest.peak + 1⟩

@[simp] theorem mapHistoriesM_value (items : List LabelledHistory) :
    (mapHistoriesM items).value = items.map LabelledHistory.history := by
  induction items with
  | nil => rfl
  | cons item items ih => simp [mapHistoriesM, ih]

def historyPrefixesM : BitWord -> Meter (List BitWord)
  | [] => ⟨[[]], 1, 1⟩
  | bit :: history =>
      let rest := historyPrefixesM history
      let prefixed := prefixPathsM bit rest.value
      ⟨[] :: prefixed.value, rest.ticks + prefixed.ticks + 1,
        max (rest.peak + 1) prefixed.peak⟩

@[simp] theorem historyPrefixesM_value (history : BitWord) :
    (historyPrefixesM history).value = historyPrefixes history := by
  induction history with
  | nil => rfl
  | cons bit history ih =>
      simp [historyPrefixesM, historyPrefixes, prefixPathsM_value, ih]

def ancestorEntriesM : List BitWord -> Meter (List BitWord)
  | [] => ⟨[], 1, 1⟩
  | history :: histories =>
      let first := historyPrefixesM history
      let rest := ancestorEntriesM histories
      let joined := appendM first.value rest.value
      ⟨joined.value, first.ticks + rest.ticks + joined.ticks + 1,
        max first.peak (max (rest.peak + 1) joined.peak)⟩

@[simp] theorem ancestorEntriesM_value (histories : List BitWord) :
    (ancestorEntriesM histories).value = ancestorEntries histories := by
  induction histories with
  | nil => rfl
  | cons history histories ih =>
      simp [ancestorEntriesM, ancestorEntries, historyPrefixesM_value,
        appendM_value, ih]

/-- The compact materialized output of the fixed current-term observer.
Ancestor closure is specified extensionally by `idealOf`; it is not copied
into a potentially cubic unshared list-of-lists result. -/
def runWholeLabelledObserver (term : Term) :
    Meter (List LabelledHistory) :=
  let headerResult := parseHeaderM? term
  match headerResult.value with
  | none => ⟨[], headerResult.ticks + 1, headerResult.peak⟩
  | some view =>
      let seedResult := decodeNM? view.seed
      match seedResult.value with
      | none => ⟨[], headerResult.ticks + seedResult.ticks + 1,
          max headerResult.peak seedResult.peak⟩
      | some bits =>
          let sourceResult := decodeInstanceM? bits
          match sourceResult.value with
          | none => ⟨[],
              headerResult.ticks + seedResult.ticks + sourceResult.ticks + 1,
              max headerResult.peak (max seedResult.peak sourceResult.peak)⟩
          | some source =>
              let paths := openedPathsM view.body
              let labels := collectLabelsM source paths.value
              ⟨labels.value,
                headerResult.ticks + seedResult.ticks + sourceResult.ticks +
                  paths.ticks + labels.ticks + 1,
                max headerResult.peak
                  (max seedResult.peak
                    (max sourceResult.peak
                      (max paths.peak labels.peak)))⟩

/-! ## Exact value theorem -/

theorem runWholeLabelledObserver_labels (term : Term) :
    (runWholeLabelledObserver term).value = labelledProjection term := by
  unfold runWholeLabelledObserver labelledProjection headerBits?
    anchoredOpenedPaths
  rw [← parseHeaderM?_value term]
  cases hheader : (parseHeaderM? term).value with
  | none => simp only [hheader, Meter.value]
  | some view =>
      simp only [hheader, Meter.value]
      rw [← decodeNM?_value view.seed]
      cases hseed : (decodeNM? view.seed).value with
      | none => simp only [hseed]
      | some bits =>
          simp only [hseed]
          rw [← decodeInstanceM?_value bits]
          cases hsource : (decodeInstanceM? bits).value with
          | none => simp only [hsource]
          | some source =>
              simp only [hsource]
              rw [openedPathsM_value, collectLabelsM_value]

/-- Semantic ancestor closure of the compact literal output is exactly the
public strong projection; no ancestor list is constructed by the evaluator. -/
theorem runWholeLabelledObserver_historyIdeal (term : Term) :
    idealOf ((runWholeLabelledObserver term).value.map
        LabelledHistory.history) = strongProjection term := by
  rw [runWholeLabelledObserver_labels]
  exact labelledHistoryIdeal_eq term

/-! ## Compact materialized-output bound -/

theorem regionCode_length (history : BitWord) :
    (r history).length = 2 * history.length := by
  induction history with
  | nil => rfl
  | cons bit history ih =>
      simp [r, ih, Nat.mul_succ, Nat.add_assoc]

theorem payloadCode_length (payload : BitWord) :
    (pc payload).length = 2 * payload.length + 1 := by
  rw [pc_eq_replicate]
  simp [Nat.two_mul, Nat.add_assoc]

theorem candidateCode_length (history payload : BitWord) :
    (a history payload).length =
      2 * history.length + 2 * payload.length + 2 := by
  simp [a, regionCode_length, payloadCode_length, Nat.add_assoc]

theorem history_payload_length_le_candidateCode
    (history payload : BitWord) :
    history.length + payload.length <= (a history payload).length := by
  rw [candidateCode_length]
  have hpad := Nat.le_add_right
    (history.length + payload.length)
    ((history.length + payload.length) + 2)
  simpa [Nat.two_mul, Nat.add_assoc, Nat.add_comm,
    Nat.add_left_comm] using hpad

theorem lastRow?_mem {rows : List Row} {row : Row}
    (hlast : lastRow? rows = some row) : List.Mem row rows := by
  induction rows with
  | nil => simp [lastRow?] at hlast
  | cons first rows ih =>
      cases rows with
      | nil =>
          simp [lastRow?] at hlast
          subst row
          exact List.Mem.head []
      | cons second rows =>
          exact List.Mem.tail first (ih hlast)

theorem encodeRow_length_le_encodeRowData_of_mem
    {row : Row} {rows : List Row} (hmem : List.Mem row rows) :
    (encodeRow row).length <= (encodeRowData rows).length := by
  induction rows with
  | nil => cases hmem
  | cons first rows ih =>
      simp only [encodeRowData, List.length_append]
      cases hmem with
      | head => exact Nat.le_add_right _ _
      | tail _ htail =>
          exact Nat.le_trans (ih htail) (Nat.le_add_left _ _)

/-- Conservative deep-cell charge for the literal final row retained in one
public label (unary naturals, tape spine, and fixed record fields). -/
def rowOutputCells (row : Row) : Nat :=
  row.state + row.head + row.tape.length + 3

theorem rowOutputCells_le_encodeRow_length (row : Row) :
    rowOutputCells row <= (encodeRow row).length := by
  rw [encodeRow_length]
  unfold rowOutputCells
  have htape : row.tape.length <= 2 * row.tape.length := by
    simpa [Nat.two_mul] using
      (Nat.le_add_right row.tape.length row.tape.length)
  exact Nat.add_le_add_right
    (Nat.add_le_add_left htape (row.state + row.head)) 3

theorem rowOutputCells_le_payload
    {payload : BitWord} {rows : List Row} {row : Row}
    (hdecode : decodeTableau? payload = some rows)
    (hlast : lastRow? rows = some row) :
    rowOutputCells row <= payload.length := by
  have hmember := lastRow?_mem hlast
  have hrow := encodeRow_length_le_encodeRowData_of_mem hmember
  have hprefix : (encodeRowData rows).length <=
      (encodeTableau rows).length := by
    unfold encodeTableau
    rw [List.length_append]
    exact Nat.le_add_left _ _
  have hreconstruct := decodeTableau?_reconstruct hdecode
  rw [hreconstruct]
  exact Nat.le_trans (rowOutputCells_le_encodeRow_length row)
    (Nat.le_trans hrow hprefix)

/-- Unshared deep output charge: outer list spine, literal history and payload,
the literal final row, and the fixed ordered-slot/terminal record fields. -/
def labelledEntryOutputCells (entry : LabelledHistory) : Nat :=
  entry.history.length + entry.payload.length +
    rowOutputCells entry.label.finalRow + 8

def labelledOutputCells : List LabelledHistory -> Nat
  | [] => 1
  | entry :: entries =>
      labelledEntryOutputCells entry + 1 + labelledOutputCells entries

theorem labelledProjection_candidate_mem
    {term : Term} {entry : LabelledHistory}
    (hmem : List.Mem entry (labelledProjection term)) :
    List.Mem (a entry.history entry.payload)
      (anchoredOpenedPaths term) := by
  unfold labelledProjection at hmem
  cases hbits : headerBits? term with
  | none =>
      simp only [hbits] at hmem
      cases hmem
  | some bits =>
      cases hsource : decodeInstance? bits with
      | none =>
          simp only [hbits, hsource] at hmem
          cases hmem
      | some source =>
          simp only [hbits, hsource] at hmem
          exact (mem_collectLabels source (anchoredOpenedPaths term)
            entry hmem).1

theorem labelledEntryOutputCells_le
    {term : Term} {entry : LabelledHistory}
    (hmem : List.Mem entry (labelledProjection term)) :
    labelledEntryOutputCells entry <= 8 * (term.size + 1) := by
  have hcandMem := labelledProjection_candidate_mem hmem
  have hcandLt := mem_anchoredOpenedPaths_length_lt_size hcandMem
  have hfields := history_payload_length_le_candidateCode
    entry.history entry.payload
  have hfieldsLe : entry.history.length + entry.payload.length <= term.size :=
    Nat.le_trans hfields (Nat.le_of_lt hcandLt)
  obtain ⟨bits, source, rows, finalRow, hbits, hsource, hdecode,
      hverify, hlast, hlabel⟩ := labelledProjection_literal_final hmem
  have hrow0 := rowOutputCells_le_payload hdecode hlast
  have hpayload : entry.payload.length <= term.size :=
    Nat.le_trans (Nat.le_add_left entry.payload.length entry.history.length)
      hfieldsLe
  have hrow : rowOutputCells entry.label.finalRow <= term.size := by
    rw [hlabel]
    exact Nat.le_trans hrow0 hpayload
  have hsum := Nat.add_le_add hfieldsLe hrow
  have hwithEight := Nat.add_le_add_right hsum 8
  calc
    labelledEntryOutputCells entry <=
        (term.size + term.size) + 8 := by
          simpa [labelledEntryOutputCells, Nat.add_assoc] using hwithEight
    _ <= ((term.size + term.size) + 8) + 6 * term.size :=
      Nat.le_add_right _ _
    _ = (term.size + term.size + 6 * term.size) + 8 := by
      simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
    _ = ((1 + 1 + 6) * term.size) + 8 := by
      rw [Nat.add_mul, Nat.add_mul]
      simp only [Nat.one_mul]
    _ = 8 * term.size + 8 := rfl
    _ = 8 * (term.size + 1) := by rw [Nat.mul_succ]

theorem labelledOutputCells_le_of_entry_bound
    (entries : List LabelledHistory) (bound : Nat)
    (hbound : forall entry, List.Mem entry entries ->
      labelledEntryOutputCells entry + 1 <= bound) :
    labelledOutputCells entries <= entries.length * bound + 1 := by
  induction entries with
  | nil => simp [labelledOutputCells]
  | cons entry entries ih =>
      have hhead := hbound entry (List.Mem.head entries)
      have htail : forall query, List.Mem query entries ->
          labelledEntryOutputCells query + 1 <= bound :=
        fun query hmem => hbound query (List.Mem.tail entry hmem)
      have hsum := Nat.add_le_add hhead (ih htail)
      simpa [labelledOutputCells, Nat.succ_mul, Nat.add_assoc,
        Nat.add_comm, Nat.add_left_comm] using hsum

/-- The actual compact labelled output has a quadratic all-input deep-cell
bound; ancestor closure remains an extensional ideal rather than copied data. -/
theorem runWholeLabelledObserver_outputCells_le (term : Term) :
    labelledOutputCells (runWholeLabelledObserver term).value <=
      10 * (term.size + 1) * (term.size + 1) := by
  rw [runWholeLabelledObserver_labels]
  have hrecords := labelledOutputCells_le_of_entry_bound
    (labelledProjection term) (10 * (term.size + 1)) (by
      intro entry hmem
      have hentry := labelledEntryOutputCells_le hmem
      have hone : 1 <= 2 * (term.size + 1) := by
        have hone' : 1 <= term.size + 1 :=
          Nat.succ_le_succ (Nat.zero_le term.size)
        exact Nat.le_trans hone'
          (by simpa [Nat.two_mul] using
            (Nat.le_add_right (term.size + 1) (term.size + 1)))
      have hadd := Nat.add_le_add hentry hone
      calc
        labelledEntryOutputCells entry + 1 <=
            8 * (term.size + 1) + 2 * (term.size + 1) := hadd
        _ = 10 * (term.size + 1) := by
          rw [← Nat.add_mul])
  have hcount := labelledProjection_length_le term
  let bound := 10 * (term.size + 1)
  have hscaled : (labelledProjection term).length * bound <=
      term.size * bound := Nat.mul_le_mul_right bound hcount
  have hone : 1 <= 10 * (term.size + 1) := by
    have hone' : 1 <= term.size + 1 :=
      Nat.succ_le_succ (Nat.zero_le term.size)
    exact Nat.le_trans hone'
      (by
        have hten : 1 <= 10 := by decide
        simpa [Nat.mul_comm] using Nat.mul_le_mul_right
          (term.size + 1) hten)
  calc
    labelledOutputCells (labelledProjection term) <=
        (labelledProjection term).length * bound + 1 := hrecords
    _ <= term.size * bound + 1 := Nat.add_le_add_right hscaled 1
    _ <= term.size * bound + bound := Nat.add_le_add_left hone _
    _ = 10 * (term.size + 1) * (term.size + 1) := by
      change term.size * bound + bound = bound * (term.size + 1)
      rw [Nat.mul_succ]
      rw [Nat.mul_comm term.size bound]

/-! ## Constructive whole-evaluator resource bounds -/

/-
The lemmas in this section bound the meters that occur in the public
evaluator itself.  They deliberately use only elementary induction and
monotonicity of addition and multiplication; in particular, the resource
certificate does not depend on an arithmetic decision procedure.
-/

theorem whole_mul_self_mono {left right : Nat} (h : left <= right) :
    left * left <= right * right :=
  Nat.mul_le_mul h h

theorem whole_square_le_square_succ (number : Nat) :
    number * number <= (number + 1) * (number + 1) :=
  whole_mul_self_mono (Nat.le_succ number)

theorem whole_pow_two_mono {left right : Nat} (h : left <= right) :
    left ^ 2 <= right ^ 2 := by
  simpa [Nat.pow_two] using whole_mul_self_mono h

theorem whole_linear_le_square (number : Nat) :
    number + 1 <= (number + 1) * (number + 1) := by
  have hone : 1 <= number + 1 := Nat.succ_le_succ (Nat.zero_le number)
  simpa using Nat.mul_le_mul_left (number + 1) hone

theorem bitWordListCells_append (left right : List BitWord) :
    bitWordListCells (left ++ right) =
      bitWordListCells left + bitWordListCells right := by
  induction left with
  | nil => simp [bitWordListCells]
  | cons word words ih =>
      simp [bitWordListCells, ih, Nat.add_assoc]

theorem bitWordListCells_map_cons (bit : Bool) (paths : List BitWord) :
    bitWordListCells (paths.map (List.cons bit)) =
      bitWordListCells paths + paths.length := by
  induction paths with
  | nil => rfl
  | cons path paths ih =>
      simp only [List.map, bitWordListCells, List.length_cons, ih]
      have hone : 1 + (bitWordListCells paths + paths.length) =
          bitWordListCells paths + (paths.length + 1) := by
        rw [← Nat.add_assoc, Nat.add_comm 1 (bitWordListCells paths),
          Nat.add_assoc, Nat.add_comm 1 paths.length]
      rw [Nat.add_assoc, hone, ← Nat.add_assoc]

theorem bitWordListCells_openedPaths_protectedNode
    (left right junk : Term) :
    bitWordListCells (openedPaths (protectedNode left right junk)) =
      bitWordListCells (openedPaths left) + (openedPaths left).length +
        bitWordListCells (openedPaths right) +
          (openedPaths right).length + 1 := by
  rw [openedPaths_protectedNode]
  simp only [bitWordListCells, bitWordListCells_append,
    bitWordListCells_map_cons]
  simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

theorem whole_three_one_blocks (first second third tail : Nat) :
    (first + 1) + (second + 1) + (third + 1) + tail =
      (first + third) + second + (1 + (1 + (1 + tail))) := by
  simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

theorem openedPaths_budget_arithmetic (leftCells leftCount
    rightCells rightCount : Nat) :
    (3 * leftCells + 8 * leftCount + 3) +
          (3 * rightCells + 8 * rightCount + 3) +
        (2 * leftCount + 1) + (2 * rightCount + 1) +
        (leftCount + 1) + 5 <=
      3 * (0 + 1 + (leftCells + leftCount) +
          (rightCells + rightCount)) +
        8 * (leftCount + 1 + rightCount) + 3 := by
  have hover :
      (2 * leftCount + 1) + (2 * rightCount + 1) +
          (leftCount + 1) + 5 <=
        3 * leftCount + 3 * rightCount + 8 := by
    have hconstant : 1 + (1 + (1 + 5)) = 8 := by decide
    have hleft :
        (2 * leftCount + 1) + (2 * rightCount + 1) +
            (leftCount + 1) + 5 =
          (2 * leftCount + leftCount) + 2 * rightCount + 8 := by
      calc
        _ = (2 * leftCount + leftCount) + 2 * rightCount +
              (1 + (1 + (1 + 5))) :=
            whole_three_one_blocks _ _ _ _
        _ = _ := by rw [hconstant]
    have hright :
        3 * leftCount + 3 * rightCount + 8 =
          (2 * leftCount + leftCount) +
            (2 * rightCount + rightCount) + 8 := by
      rw [show 3 = 2 + 1 by rfl, Nat.add_mul, Nat.add_mul]
      simp only [Nat.one_mul]
    rw [hleft, hright]
    have hpad : 2 * rightCount <= 2 * rightCount + rightCount :=
      Nat.le_add_right _ _
    exact Nat.add_le_add_right
      (Nat.add_le_add_left hpad (2 * leftCount + leftCount)) 8
  have htarget :
      3 * (0 + 1 + (leftCells + leftCount) +
            (rightCells + rightCount)) +
          8 * (leftCount + 1 + rightCount) + 3 =
        ((3 * leftCells + 8 * leftCount + 3) +
          (3 * rightCells + 8 * rightCount + 3)) +
          (3 * leftCount + 3 * rightCount + 8) := by
    simp [Nat.mul_add, Nat.mul_succ, Nat.add_assoc,
      Nat.add_comm, Nat.add_left_comm]
  rw [htarget]
  simpa only [Nat.add_assoc] using Nat.add_le_add_left hover
    ((3 * leftCells + 8 * leftCount + 3) +
      (3 * rightCells + 8 * rightCount + 3))

theorem openedPathsM_ticks_le_deep (term : Term) :
    (openedPathsM term).ticks <=
      3 * bitWordListCells (openedPaths term) +
        8 * (openedPaths term).length + 3 := by
  induction term using openedPaths.induct with
  | case1 left right junk ihLeft ihRight =>
      simp only [protectedNode, passive, openedPathsM,
        openedPathsM_value, prefixPathsM_ticks,
        prefixPathsM_value, appendM_ticks, List.length_map,
        openedPaths, bitWordListCells, bitWordListCells_append,
        bitWordListCells_map_cons, List.length_cons, List.length_append]
      have hchildren := Nat.add_le_add ihLeft ihRight
      have hprefix1 := Nat.add_le_add_right hchildren
        (2 * (openedPaths left).length + 1)
      have hprefix2 := Nat.add_le_add_right hprefix1
        (2 * (openedPaths right).length + 1)
      have hprefix3 := Nat.add_le_add_right hprefix2
        ((openedPaths left).length + 1)
      have hprefix4 := Nat.add_le_add_right hprefix3 5
      calc
        _ <= 3 * bitWordListCells (openedPaths left) +
              8 * (openedPaths left).length + 3 +
              (3 * bitWordListCells (openedPaths right) +
                8 * (openedPaths right).length + 3) +
              (2 * (openedPaths left).length + 1) +
              (2 * (openedPaths right).length + 1) +
              ((openedPaths left).length + 1) + 5 := hprefix4
        _ <= _ := by
          exact openedPaths_budget_arithmetic
            (bitWordListCells (openedPaths left))
            (openedPaths left).length
            (bitWordListCells (openedPaths right))
            (openedPaths right).length
  | case2 term hnotProtected =>
      have hpaths : openedPaths term = [] := by
        cases h : openedPaths term with
        | nil => rfl
        | cons path paths =>
            have hopen : OpenedAt term path :=
              (mem_openedPaths_iff_openedAt term path).mp (by
                rw [h]
                exact List.Mem.head paths)
            cases hopen with
            | here left right junk =>
                exact False.elim (hnotProtected left right junk rfl)
            | downLeft right junk hopen =>
                exact False.elim (hnotProtected _ right junk rfl)
            | downRight left junk hopen =>
                exact False.elim (hnotProtected left _ junk rfl)
      cases term with
      | s => simp [openedPathsM, hpaths, bitWordListCells]
      | app fn arg =>
          cases fn with
          | s => simp [openedPathsM, hpaths, bitWordListCells]
          | app head left =>
              cases head with
              | app deeper supplied =>
                  simp [openedPathsM, hpaths, bitWordListCells]
              | s =>
                  cases arg with
                  | s => simp [openedPathsM, hpaths, bitWordListCells]
                  | app argFn junk =>
                      cases argFn with
                      | s => simp [openedPathsM, hpaths, bitWordListCells]
                      | app argHead right =>
                          cases argHead with
                          | app deeper supplied =>
                              simp [openedPathsM, hpaths, bitWordListCells]
                          | s => exact (hnotProtected left right junk rfl).elim

theorem openedPathsM_ticks_le_quadratic (term : Term) :
    (openedPathsM term).ticks <= 14 * (term.size + 1) ^ 2 := by
  have hdeep := openedPathsM_ticks_le_deep term
  have hcells := bitWordListCells_openedPaths_le term
  have hcount := openedPaths_length_le_size term
  have hscaledCells := Nat.mul_le_mul_left 3 hcells
  have hscaledCount := Nat.mul_le_mul_left 8 hcount
  have hsum := Nat.add_le_add (Nat.add_le_add hscaledCells hscaledCount)
    (Nat.le_refl 3)
  have hcoarse : 3 * (term.size * term.size) + 8 * term.size + 3 <=
      14 * ((term.size + 1) * (term.size + 1)) := by
    have honeSquare : 1 <= (term.size + 1) * (term.size + 1) := by
      have hone : 1 <= term.size + 1 :=
        Nat.succ_le_succ (Nat.zero_le term.size)
      exact Nat.mul_le_mul hone hone
    calc
      3 * (term.size * term.size) + 8 * term.size + 3 <=
          3 * ((term.size + 1) * (term.size + 1)) +
            8 * ((term.size + 1) * (term.size + 1)) +
            3 * ((term.size + 1) * (term.size + 1)) := by
              exact Nat.add_le_add
                (Nat.add_le_add
                  (Nat.mul_le_mul_left 3 (whole_square_le_square_succ term.size))
                (Nat.mul_le_mul_left 8
                    (Nat.le_trans (Nat.le_succ term.size)
                      (whole_linear_le_square term.size))))
                (Nat.mul_le_mul_left 3
                  honeSquare)
      _ = 14 * ((term.size + 1) * (term.size + 1)) := by
        simp only [← Nat.add_mul]
  exact Nat.le_trans hdeep (Nat.le_trans hsum (by
    simpa [Nat.pow_two] using hcoarse))

theorem openedPathsM_peak_le (term : Term) :
    (openedPathsM term).peak <= term.size + 1 := by
  induction term using openedPaths.induct with
  | case1 left right junk ihLeft ihRight =>
      simp only [openedPathsM, openedPathsM_value, prefixPathsM_peak,
        prefixPathsM_value, appendM_peak, List.length_map]
      apply (Nat.max_le).2
      constructor
      · have hleft : left.size <=
            (protectedNode left right junk).size := by
          exact Nat.le_trans
            (Nat.le_of_lt (term_size_app_right_lt Term.s left))
            (Nat.le_of_lt (term_size_app_left_lt
              (Term.app Term.s left) (passive right junk)))
        exact Nat.le_trans ihLeft (Nat.succ_le_succ hleft)
      · apply (Nat.max_le).2
        constructor
        · have hright : right.size <=
              (protectedNode left right junk).size := by
            exact Nat.le_trans
              (Nat.le_of_lt (term_size_app_right_lt Term.s right))
              (Nat.le_trans
                (Nat.le_of_lt (term_size_app_left_lt
                  (Term.app Term.s right) junk))
                (Nat.le_of_lt (term_size_app_right_lt
                  (Term.app Term.s left) (passive right junk))))
          exact Nat.le_trans ihRight (Nat.succ_le_succ hright)
        · apply (Nat.max_le).2
          constructor
          · have hleft : left.size <=
                (protectedNode left right junk).size := by
              exact Nat.le_trans
                (Nat.le_of_lt (term_size_app_right_lt Term.s left))
                (Nat.le_of_lt (term_size_app_left_lt
                  (Term.app Term.s left) (passive right junk)))
            exact Nat.le_trans
              (Nat.succ_le_succ (openedPaths_length_le_size left))
              (Nat.succ_le_succ hleft)
          · apply (Nat.max_le).2
            constructor
            · have hright : right.size <=
                  (protectedNode left right junk).size := by
                exact Nat.le_trans
                  (Nat.le_of_lt (term_size_app_right_lt Term.s right))
                  (Nat.le_trans
                    (Nat.le_of_lt (term_size_app_left_lt
                      (Term.app Term.s right) junk))
                    (Nat.le_of_lt (term_size_app_right_lt
                      (Term.app Term.s left) (passive right junk))))
              exact Nat.le_trans
                (Nat.succ_le_succ (openedPaths_length_le_size right))
                (Nat.succ_le_succ hright)
            · have hleft : left.size <=
                  (protectedNode left right junk).size := by
                exact Nat.le_trans
                  (Nat.le_of_lt (term_size_app_right_lt Term.s left))
                  (Nat.le_of_lt (term_size_app_left_lt
                    (Term.app Term.s left) (passive right junk)))
              exact Nat.le_trans
                (Nat.succ_le_succ (openedPaths_length_le_size left))
                (Nat.succ_le_succ hleft)
  | case2 term hnotProtected =>
      cases term with
      | s => exact Nat.le_refl 2
      | app fn arg =>
          cases fn with
          | s =>
              change 2 <= (Term.app Term.s arg).size + 1
              exact Nat.succ_le_succ (Term.size_pos _)
          | app head left =>
              cases head with
              | app deeper supplied =>
                  change 2 <=
                    (Term.app (Term.app (Term.app deeper supplied) left) arg).size + 1
                  exact Nat.succ_le_succ (Term.size_pos _)
              | s =>
                  cases arg with
                  | s =>
                      change 2 <= (Term.app (Term.app Term.s left) Term.s).size + 1
                      exact Nat.succ_le_succ (Term.size_pos _)
                  | app argFn junk =>
                      cases argFn with
                      | s =>
                          change 2 <=
                            (Term.app (Term.app Term.s left)
                              (Term.app Term.s junk)).size + 1
                          exact Nat.succ_le_succ (Term.size_pos _)
                      | app argHead right =>
                          cases argHead with
                          | app deeper supplied =>
                              change 2 <=
                                (Term.app (Term.app Term.s left)
                                  (Term.app (Term.app
                                    (Term.app deeper supplied) right) junk)).size + 1
                              exact Nat.succ_le_succ (Term.size_pos _)
                          | s => exact (hnotProtected left right junk rfl).elim

@[simp] theorem reverseM_length {alpha : Type} (items : List alpha) :
    (reverseM items).value.length = items.length := by
  rw [reverseM_value, List.length_reverse]

theorem reverseM_ticks_le {alpha : Type} (items : List alpha) :
    (reverseM items).ticks <=
      (items.length + 1) * (items.length + 2) := by
  induction items with
  | nil =>
      change 1 <= 2
      decide
  | cons item items ih =>
      simp only [reverseM, appendM_ticks, reverseM_length, List.length_cons]
      have hstep := Nat.add_le_add_right ih (items.length + 2)
      exact Nat.le_trans hstep (by
        calc
          (items.length + 1) * (items.length + 2) +
                (items.length + 2) =
              (items.length + 2) * (items.length + 2) := by
                change _ = ((items.length + 1) + 1) *
                  (items.length + 2)
                simp only [Nat.add_mul, Nat.one_mul]
          _ <= (items.length + 2) * (items.length + 3) :=
            Nat.mul_le_mul_left _ (Nat.le_succ _))

theorem reverseM_peak_le {alpha : Type} (items : List alpha) :
    (reverseM items).peak <= items.length + 1 := by
  induction items with
  | nil => exact Nat.le_refl 1
  | cons item items ih =>
      simp only [reverseM, appendM_peak, reverseM_length, List.length_cons]
      exact (Nat.max_le).2
        ⟨Nat.add_le_add_right ih 1, Nat.le_succ (items.length + 1)⟩

theorem parsePcAuxM_ticks_le (count : Nat) (word : BitWord) :
    (parsePcAuxM count word).ticks <=
      3 * (count + word.length + 1) + word.length := by
  induction word generalizing count with
  | nil =>
      change 1 <= 3 * (count + 1)
      have hone : 1 <= count + 1 :=
        Nat.succ_le_succ (Nat.zero_le count)
      exact Nat.le_trans hone (by
        have hcoeff : 1 <= 3 := by decide
        simpa using Nat.mul_le_mul_right (count + 1) hcoeff)
  | cons bit rest ih =>
      cases bit with
      | false =>
          simp only [parsePcAuxM, lengthM_ticks, natEqM_ticks_le,
            List.length_cons]
          have hsum := Nat.add_le_add
            (Nat.le_refl (rest.length + 1))
            (natEqM_ticks_le_right (lengthM rest).value count)
          have hstep := Nat.add_le_add_right hsum 2
          exact Nat.le_trans hstep (by
            let base := count + rest.length + 2
            have htwo : 2 <= base := by
              unfold base
              exact Nat.le_add_left 2 (count + rest.length)
            have hone : 1 <= base :=
              Nat.le_trans (by decide : 1 <= 2) htwo
            have hbaseTwo : base + 2 <= base + base :=
              Nat.add_le_add_left htwo base
            have hbaseThree : base + base <= 3 * base := by
              have hcoeff : 2 <= 3 := by decide
              simpa [Nat.two_mul] using Nat.mul_le_mul_right base hcoeff
            have hpad := Nat.le_trans hbaseTwo hbaseThree
            have hactual : rest.length + 1 + (count + 1) + 2 =
                base + 2 := by
              unfold base
              simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
            rw [hactual]
            exact Nat.le_trans hpad
              (Nat.le_add_right _ (rest.length + 1)))
      | true =>
          simp only [parsePcAuxM, List.length_cons]
          have hrec := ih (count + 1)
          have hstep := Nat.add_le_add_right hrec 1
          simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
            using hstep

theorem parsePcAuxM_peak_le (count : Nat) (word : BitWord) :
    (parsePcAuxM count word).peak <=
      3 * (count + word.length + 1) + word.length := by
  induction word generalizing count with
  | nil =>
      change 1 <= 3 * (count + 1)
      have hone : 1 <= count + 1 :=
        Nat.succ_le_succ (Nat.zero_le count)
      exact Nat.le_trans hone (by
        have hcoeff : 1 <= 3 := by decide
        simpa using Nat.mul_le_mul_right (count + 1) hcoeff)
  | cons bit rest ih =>
      cases bit with
      | false =>
          simp only [parsePcAuxM, lengthM_peak, List.length_cons]
          apply (Nat.max_le).2
          constructor
          · exact Nat.le_add_left (rest.length + 1)
              (3 * (count + (rest.length + 1) + 1))
          · have heq := natEqM_peak_le_right
              (lengthM rest).value count
            have hlinear : count + 1 <=
                3 * (count + (rest.length + 1) + 1) := by
              have hbase : count + 1 <=
                  count + (rest.length + 1) + 1 := by
                have hone : 1 <= rest.length + 2 :=
                  Nat.succ_le_succ (Nat.zero_le (rest.length + 1))
                simpa [Nat.add_assoc] using Nat.add_le_add_left hone count
              have hcoeff : 1 <= 3 := by decide
              calc
                count + 1 <= count + (rest.length + 1) + 1 := hbase
                _ <= 3 * (count + (rest.length + 1) + 1) := by
                  simpa using Nat.mul_le_mul_right
                    (count + (rest.length + 1) + 1) hcoeff
            exact Nat.le_trans heq
              (Nat.le_trans hlinear (Nat.le_add_right _ (rest.length + 1)))
      | true =>
          simp only [parsePcAuxM, List.length_cons]
          have hrec := ih (count + 1)
          have hstep := Nat.add_le_add_right hrec 1
          simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
            using hstep

theorem bitWord_twoStep_induction {motive : BitWord -> Prop}
    (nilCase : motive [])
    (singletonCase : forall bit, motive [bit])
    (pairCase : forall first second rest,
      motive rest -> motive (first :: second :: rest)) :
    forall word, motive word
  | [] => nilCase
  | [bit] => singletonCase bit
  | first :: second :: rest =>
      pairCase first second rest
        (bitWord_twoStep_induction nilCase singletonCase pairCase rest)

theorem parseCandidateAuxM_false_ticks_raw
    (reversed payloadCode : BitWord) :
    (parseCandidateAuxM reversed (false :: payloadCode)).ticks <=
      (3 * (payloadCode.length + 1) + payloadCode.length) +
        (reversed.length + 1) * (reversed.length + 2) + 2 := by
  simp only [parseCandidateAuxM]
  have hpayload := parsePcAuxM_ticks_le 0 payloadCode
  have hhistory := reverseM_ticks_le reversed
  have hsum := Nat.add_le_add hpayload hhistory
  simpa using Nat.add_le_add_right hsum 2

theorem parseCandidateAuxM_false_numeric
    (reversed payloadCode : BitWord) :
    (3 * (payloadCode.length + 1) + payloadCode.length) +
          (reversed.length + 1) * (reversed.length + 2) + 2 <=
      6 * (reversed.length + (false :: payloadCode).length + 1) ^ 2 +
        (false :: payloadCode).length := by
  let total := reversed.length + (false :: payloadCode).length + 1
  have hpayloadLinear :
      3 * (0 + payloadCode.length + 1) + payloadCode.length <=
        4 * total ^ 2 := by
    have hbase : payloadCode.length + 1 <= total := by
      unfold total
      simp only [List.length_cons]
      exact Nat.le_trans
        (Nat.le_add_left _ reversed.length) (Nat.le_succ _)
    have htotalPos : 1 <= total :=
      Nat.le_trans (Nat.succ_le_succ (Nat.zero_le payloadCode.length)) hbase
    have htotalSquare : total <= total ^ 2 := by
      simpa [Nat.pow_two] using Nat.mul_le_mul_left total htotalPos
    have hbaseSquare := Nat.le_trans hbase htotalSquare
    have hfour := Nat.mul_le_mul_left 4 hbaseSquare
    have hraw : 3 * (payloadCode.length + 1) + payloadCode.length <=
        4 * (payloadCode.length + 1) := by
      simp only [show 4 = 3 + 1 by rfl, Nat.add_mul, Nat.one_mul]
      exact Nat.add_le_add_left (Nat.le_succ _) _
    exact Nat.le_trans (by simpa using hraw) hfour
  have hhistoryMono :
      (reversed.length + 1) * (reversed.length + 2) <= total ^ 2 := by
    have hleft : reversed.length + 1 <= total := by
      unfold total
      simp only [List.length_cons]
      have hone : 1 <= payloadCode.length + 2 :=
        Nat.succ_le_succ (Nat.zero_le (payloadCode.length + 1))
      simpa [Nat.add_assoc] using Nat.add_le_add_left hone reversed.length
    have hright : reversed.length + 2 <= total := by
      unfold total
      simp only [List.length_cons]
      have htwo : 2 <= payloadCode.length + 2 :=
        Nat.add_le_add_right (Nat.zero_le payloadCode.length) 2
      simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
        Nat.add_le_add_left htwo reversed.length
    simpa [Nat.pow_two] using Nat.mul_le_mul hleft hright
  have htwo : 2 <= total ^ 2 := by
    have htwoTotal : 2 <= total := by
      unfold total
      simp only [List.length_cons]
      exact Nat.le_add_left 2 (reversed.length + payloadCode.length)
    rw [Nat.pow_two]
    have hpositive : 0 < total :=
      Nat.lt_of_lt_of_le (by decide : 0 < 2) htwoTotal
    exact Nat.le_trans htwoTotal
      (Nat.le_mul_of_pos_right total hpositive)
  have hfirst := Nat.add_le_add hpayloadLinear hhistoryMono
  have hsecond := Nat.add_le_add_right hfirst 2
  have hpad := Nat.add_le_add_left htwo
    (4 * total ^ 2 + total ^ 2)
  have hcoeff : 4 * total ^ 2 + total ^ 2 + total ^ 2 =
      6 * total ^ 2 := by
    rw [show 6 = 4 + 1 + 1 by rfl, Nat.add_mul, Nat.add_mul]
    simp only [Nat.one_mul]
  rw [hcoeff] at hpad
  have hthird := Nat.le_trans hsecond hpad
  have hfourth := Nat.le_trans hthird
    (Nat.le_add_right (6 * total ^ 2) (false :: payloadCode).length)
  dsimp [total] at hfourth
  simpa only [Nat.zero_add] using! hfourth

set_option maxRecDepth 10000000 in
theorem parseCandidateAuxM_false_ticks_le
    (reversed payloadCode : BitWord) :
    (parseCandidateAuxM reversed (false :: payloadCode)).ticks <=
      6 * (reversed.length + (false :: payloadCode).length + 1) ^ 2 +
        (false :: payloadCode).length := by
  exact Nat.le_trans
    (parseCandidateAuxM_false_ticks_raw reversed payloadCode)
    (parseCandidateAuxM_false_numeric reversed payloadCode)

theorem parseCandidateAuxM_true_singleton_ticks_le (reversed : BitWord) :
    (parseCandidateAuxM reversed [true]).ticks <=
      6 * (reversed.length + [true].length + 1) ^ 2 + [true].length := by
  change 2 <= 6 * (reversed.length + 2) ^ 2 + 1
  have hone : 1 <= 6 * (reversed.length + 2) ^ 2 := by
    have hsquare : 1 <= (reversed.length + 2) ^ 2 := by
      have hpos : 1 <= reversed.length + 2 :=
        Nat.le_add_left 1 (reversed.length + 1)
      simpa [Nat.pow_two] using Nat.mul_le_mul hpos hpos
    have hcoeff : 1 <= 6 := by decide
    exact Nat.le_trans hsquare (by
      simpa using Nat.mul_le_mul_right _ hcoeff)
  exact Nat.succ_le_succ hone

theorem parseCandidate_true_pair_numeric
    (reversed : BitWord) (bit : Bool) (rest : BitWord) (amount : Nat)
    (ih : amount <=
      6 * ((bit :: reversed).length + rest.length + 1) ^ 2 + rest.length) :
    amount + 2 <=
      6 * (reversed.length + (true :: bit :: rest).length + 1) ^ 2 +
        (true :: bit :: rest).length := by
  simp only [List.length_cons]
  have hstep := Nat.add_le_add_right ih 2
  let total := reversed.length + (true :: bit :: rest).length + 1
  have hbase : (bit :: reversed).length + rest.length + 1 <= total := by
    unfold total
    simp only [List.length_cons]
    have hle := Nat.le_succ
      ((bit :: reversed).length + rest.length + 1)
    simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using hle
  have hsquare :
      ((bit :: reversed).length + rest.length + 1) ^ 2 <= total ^ 2 :=
    whole_pow_two_mono hbase
  have hscaled := Nat.mul_le_mul_left 6 hsquare
  have hsum := Nat.add_le_add hscaled (Nat.le_refl (rest.length + 2))
  unfold total at hsum
  exact Nat.le_trans hstep (by
    simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using hsum)

theorem parseCandidateAuxM_true_pair_ticks_le
    (reversed : BitWord) (bit : Bool) (rest : BitWord)
    (ih : (parseCandidateAuxM (bit :: reversed) rest).ticks <=
      6 * ((bit :: reversed).length + rest.length + 1) ^ 2 + rest.length) :
    (parseCandidateAuxM reversed (true :: bit :: rest)).ticks <=
      6 * (reversed.length + (true :: bit :: rest).length + 1) ^ 2 +
        (true :: bit :: rest).length := by
  simp only [parseCandidateAuxM]
  exact parseCandidate_true_pair_numeric reversed bit rest _ ih

def parseCandidateTickBudget (reversed word : BitWord) : Nat :=
  6 * (reversed.length + word.length + 1) ^ 2 + word.length + 1

/- Keeping the recursively computed quantity behind this small wrapper prevents the
   kernel from repeatedly normalizing `parseCandidateAuxM` while it checks the
   well-founded induction proof below. -/
def parseCandidateTickCount (reversed word : BitWord) : Nat :=
  (parseCandidateAuxM reversed word).ticks

theorem parseCandidateAuxM_nil_ticks_le (reversed : BitWord) :
    (parseCandidateAuxM reversed []).ticks ≤
      parseCandidateTickBudget reversed [] := by
  simp only [parseCandidateAuxM]
  unfold parseCandidateTickBudget
  exact Nat.le_add_left 1 _

theorem parseCandidateTickCount_false_le
    (reversed payloadCode : BitWord) :
    parseCandidateTickCount reversed (false :: payloadCode) ≤
      parseCandidateTickBudget reversed (false :: payloadCode) := by
  unfold parseCandidateTickCount parseCandidateTickBudget
  exact Nat.le_trans (parseCandidateAuxM_false_ticks_le reversed payloadCode)
    (Nat.le_add_right _ 1)

theorem parseCandidateTickCount_true_singleton_le (reversed : BitWord) :
    parseCandidateTickCount reversed [true] ≤
      parseCandidateTickBudget reversed [true] := by
  unfold parseCandidateTickCount parseCandidateTickBudget
  exact Nat.le_trans (parseCandidateAuxM_true_singleton_ticks_le reversed)
    (Nat.le_add_right _ 1)

theorem parseCandidateTickCount_true_pair_le
    (reversed : BitWord) (bit : Bool) (rest : BitWord)
    (ih : parseCandidateTickCount (bit :: reversed) rest ≤
      parseCandidateTickBudget (bit :: reversed) rest) :
    parseCandidateTickCount reversed (true :: bit :: rest) ≤
      parseCandidateTickBudget reversed (true :: bit :: rest) := by
  unfold parseCandidateTickCount parseCandidateTickBudget at ih ⊢
  simp only [parseCandidateAuxM]
  let prior :=
    6 * ((bit :: reversed).length + rest.length + 1) ^ 2 + rest.length
  let later :=
    6 * (reversed.length + (true :: bit :: rest).length + 1) ^ 2 +
      (true :: bit :: rest).length
  have hstep : (parseCandidateAuxM (bit :: reversed) rest).ticks + 2 ≤
      (prior + 1) + 2 := Nat.add_le_add_right ih 2
  have hbase : prior + 2 ≤ later := by
    unfold prior later
    exact parseCandidate_true_pair_numeric reversed bit rest _
      (Nat.le_refl _)
  have hwithSlack : (prior + 2) + 1 ≤ later + 1 :=
    Nat.add_le_add_right hbase 1
  have hreassociate : (prior + 1) + 2 = (prior + 2) + 1 := by
    simp only [Nat.add_assoc]
  have hstep' : (parseCandidateAuxM (bit :: reversed) rest).ticks + 2 ≤
      (prior + 2) + 1 := by
    rw [← hreassociate]
    exact hstep
  change (parseCandidateAuxM (bit :: reversed) rest).ticks + 2 ≤ later + 1
  exact Nat.le_trans hstep' hwithSlack

theorem parseCandidateTickCount_le_budget (reversed word : BitWord) :
    parseCandidateTickCount reversed word <=
      parseCandidateTickBudget reversed word := by
  let motive : BitWord → Prop := fun current =>
    ∀ accumulated, parseCandidateTickCount accumulated current ≤
      parseCandidateTickBudget accumulated current
  have hall : motive word := bitWord_twoStep_induction
    (motive := motive)
    (by
      intro accumulated
      change (parseCandidateAuxM accumulated []).ticks ≤
        parseCandidateTickBudget accumulated []
      exact parseCandidateAuxM_nil_ticks_le accumulated)
    (by
      intro bit accumulated
      cases bit with
      | false =>
          exact parseCandidateTickCount_false_le accumulated []
      | true =>
          exact parseCandidateTickCount_true_singleton_le accumulated)
    (by
      intro first second rest ih accumulated
      cases first with
      | false =>
          exact parseCandidateTickCount_false_le accumulated (second :: rest)
      | true =>
          have hrec := ih (second :: accumulated)
          exact parseCandidateTickCount_true_pair_le
            accumulated second rest hrec)
    word
  exact hall reversed

theorem parseCandidateAuxM_ticks_le_budget (reversed word : BitWord) :
    (parseCandidateAuxM reversed word).ticks <=
      parseCandidateTickBudget reversed word := by
  change parseCandidateTickCount reversed word <=
    parseCandidateTickBudget reversed word
  exact parseCandidateTickCount_le_budget reversed word

theorem parseCandidateAuxM_ticks_le (reversed word : BitWord) :
    (parseCandidateAuxM reversed word).ticks <=
      6 * (reversed.length + word.length + 1) ^ 2 + word.length + 1 := by
  exact parseCandidateAuxM_ticks_le_budget reversed word

theorem parseCandidateM?_ticks_le (word : BitWord) :
    (parseCandidateM? word).ticks <= 8 * (word.length + 1) ^ 2 := by
  have hraw := parseCandidateAuxM_ticks_le [] word
  have hword : word.length <= (word.length + 1) ^ 2 := by
    exact Nat.le_trans (Nat.le_succ word.length)
      (by simpa [Nat.pow_two] using whole_linear_le_square word.length)
  have hone : 1 <= (word.length + 1) ^ 2 := by
    exact Nat.le_trans (Nat.succ_le_succ (Nat.zero_le word.length))
      (by simpa [Nat.pow_two] using whole_linear_le_square word.length)
  have htail : word.length + 1 ≤ 2 * (word.length + 1) ^ 2 := by
    have hboth := Nat.add_le_add hword hone
    simpa [Nat.two_mul] using hboth
  have hsum := Nat.add_le_add_left htail
    (6 * (word.length + 1) ^ 2)
  calc
    (parseCandidateM? word).ticks ≤
        6 * (word.length + 1) ^ 2 + word.length + 1 := by
      simpa [parseCandidateM?] using hraw
    _ = 6 * (word.length + 1) ^ 2 + (word.length + 1) := by
      rw [Nat.add_assoc]
    _ ≤ 6 * (word.length + 1) ^ 2 +
        2 * (word.length + 1) ^ 2 := hsum
    _ = 8 * (word.length + 1) ^ 2 := by
      rw [show 8 = 6 + 2 by rfl, Nat.add_mul]

/-! The same structural allowance bounds the candidate parser's live peak. -/

theorem parseCandidateAuxM_false_peak_le
    (reversed payloadCode : BitWord) :
    (parseCandidateAuxM reversed (false :: payloadCode)).peak ≤
      6 * (reversed.length + (false :: payloadCode).length + 1) ^ 2 +
        (false :: payloadCode).length := by
  simp only [parseCandidateAuxM]
  apply (Nat.max_le).2
  constructor
  · have hpayload := parsePcAuxM_peak_le 0 payloadCode
    rw [Nat.zero_add] at hpayload
    calc
      (parsePcAuxM 0 payloadCode).peak ≤
          3 * (payloadCode.length + 1) + payloadCode.length := hpayload
      _ ≤ (3 * (payloadCode.length + 1) + payloadCode.length) +
          (reversed.length + 1) * (reversed.length + 2) :=
        Nat.le_add_right _ _
      _ ≤ ((3 * (payloadCode.length + 1) + payloadCode.length) +
          (reversed.length + 1) * (reversed.length + 2)) + 2 :=
        Nat.le_add_right _ 2
      _ ≤ _ := parseCandidateAuxM_false_numeric reversed payloadCode
  · have hlinear : reversed.length + 1 ≤
        (reversed.length + 1) * (reversed.length + 2) := by
      have hpositive : 1 ≤ reversed.length + 2 :=
        Nat.succ_le_succ (Nat.zero_le (reversed.length + 1))
      simpa [Nat.one_mul] using
        Nat.mul_le_mul_left (reversed.length + 1) hpositive
    calc
      (reverseM reversed).peak ≤ reversed.length + 1 :=
        reverseM_peak_le reversed
      _ ≤ (reversed.length + 1) * (reversed.length + 2) := hlinear
      _ ≤ (3 * (payloadCode.length + 1) + payloadCode.length) +
          (reversed.length + 1) * (reversed.length + 2) :=
        Nat.le_add_left _ _
      _ ≤ ((3 * (payloadCode.length + 1) + payloadCode.length) +
          (reversed.length + 1) * (reversed.length + 2)) + 2 :=
        Nat.le_add_right _ 2
      _ ≤ _ := parseCandidateAuxM_false_numeric reversed payloadCode

theorem parseCandidateTickCount_peak_le_budget (reversed word : BitWord) :
    (parseCandidateAuxM reversed word).peak ≤
      parseCandidateTickBudget reversed word := by
  let motive : BitWord → Prop := fun current =>
    ∀ accumulated, (parseCandidateAuxM accumulated current).peak ≤
      parseCandidateTickBudget accumulated current
  have hall : motive word := bitWord_twoStep_induction
    (motive := motive)
    (by
      intro accumulated
      simp only [parseCandidateAuxM]
      unfold parseCandidateTickBudget
      exact Nat.le_add_left 1 _)
    (by
      intro bit accumulated
      cases bit with
      | false =>
          exact Nat.le_trans (parseCandidateAuxM_false_peak_le accumulated [])
            (Nat.le_add_right _ 1)
      | true =>
          exact Nat.le_trans (by
            exact Nat.le_trans (by decide : 1 ≤ 2)
              (parseCandidateAuxM_true_singleton_ticks_le accumulated))
            (Nat.le_add_right _ 1))
    (by
      intro first second rest ih accumulated
      cases first with
      | false =>
          exact Nat.le_trans
            (parseCandidateAuxM_false_peak_le accumulated (second :: rest))
            (Nat.le_add_right _ 1)
      | true =>
          simp only [parseCandidateAuxM]
          let prior :=
            6 * ((second :: accumulated).length + rest.length + 1) ^ 2 +
              rest.length
          let later :=
            6 * (accumulated.length +
              (true :: second :: rest).length + 1) ^ 2 +
              (true :: second :: rest).length
          have hstep :
              (parseCandidateAuxM (second :: accumulated) rest).peak + 1 ≤
                (prior + 1) + 1 := Nat.add_le_add_right (ih _) 1
          have hbase : prior + 2 ≤ later := by
            unfold prior later
            exact parseCandidate_true_pair_numeric accumulated second rest _
              (Nat.le_refl _)
          change (parseCandidateAuxM (second :: accumulated) rest).peak + 1 ≤
            later + 1
          exact Nat.le_trans hstep (by
            have hpad := Nat.add_le_add_right hbase 1
            exact Nat.le_trans (by
              exact Nat.le_add_right ((prior + 1) + 1) 1) (by
              simpa [Nat.add_assoc] using hpad)))
    word
  exact hall reversed

theorem parseCandidateM?_peak_le (word : BitWord) :
    (parseCandidateM? word).peak ≤ 8 * (word.length + 1) ^ 2 := by
  have hraw := parseCandidateTickCount_peak_le_budget [] word
  have hword : word.length ≤ (word.length + 1) ^ 2 := by
    exact Nat.le_trans (Nat.le_succ word.length)
      (by simpa [Nat.pow_two] using whole_linear_le_square word.length)
  have hone : 1 ≤ (word.length + 1) ^ 2 := by
    exact Nat.le_trans (Nat.succ_le_succ (Nat.zero_le word.length))
      (by simpa [Nat.pow_two] using whole_linear_le_square word.length)
  have htail : word.length + 1 ≤ 2 * (word.length + 1) ^ 2 := by
    have hboth := Nat.add_le_add hword hone
    simpa [Nat.two_mul] using hboth
  have hsum := Nat.add_le_add_left htail
    (6 * (word.length + 1) ^ 2)
  calc
    (parseCandidateM? word).peak ≤
        6 * (word.length + 1) ^ 2 + word.length + 1 := by
      simpa [parseCandidateM?, parseCandidateTickBudget] using hraw
    _ = 6 * (word.length + 1) ^ 2 + (word.length + 1) := by
      rw [Nat.add_assoc]
    _ ≤ 6 * (word.length + 1) ^ 2 +
        2 * (word.length + 1) ^ 2 := hsum
    _ = 8 * (word.length + 1) ^ 2 := by
      rw [show 8 = 6 + 2 by rfl, Nat.add_mul]


theorem mul_add_one_le_succ_mul (coefficient value : Nat)
    (hvalue : 1 <= value) :
    coefficient * value + 1 <= (coefficient + 1) * value := by
  rw [Nat.add_mul, Nat.one_mul]
  exact Nat.add_le_add_left hvalue _

theorem decodeDirectionM?_ticks_le (payload : BitWord) :
    (decodeDirectionM? payload).ticks <= 3 := by
  cases payload with
  | nil => simp [decodeDirectionM?]
  | cons first rest =>
      cases first <;> cases rest with
      | nil => simp [decodeDirectionM?]
      | cons second tail => cases second <;> simp [decodeDirectionM?]

theorem decodeDirectionM?_peak_le (payload : BitWord) :
    (decodeDirectionM? payload).peak <= 2 := by
  cases payload with
  | nil => simp [decodeDirectionM?]
  | cons first rest =>
      cases first <;> cases rest with
      | nil => simp [decodeDirectionM?]
      | cons second tail => cases second <;> simp [decodeDirectionM?]

theorem decodeRuleM?_ticks_le (payload : BitWord) :
    (decodeRuleM? payload).ticks <= 3 * (payload.length + 1) := by
  cases payload with
  | nil => simp [decodeRuleM?]
  | cons write tail =>
      unfold decodeRuleM?
      cases hmove : (decodeDirectionM? tail).value with
      | none =>
          simp only [hmove]
          calc
            (decodeDirectionM? tail).ticks + 1 <= 3 + 1 :=
              Nat.add_le_add_right (decodeDirectionM?_ticks_le tail) 1
            _ <= 3 * ((write :: tail).length + 1) := by
              simp only [List.length_cons]
              exact Nat.le_add_left 4 (3 * tail.length + 2)
      | some pair =>
          rcases pair with ⟨direction, rest⟩
          simp only [hmove]
          have hrest : rest.length + 2 <= tail.length := by
            rw [decodeDirectionM?_value] at hmove
            cases tail with
            | nil => simp [decodeDirection?] at hmove
            | cons first tail =>
                cases first <;> cases tail with
                | nil => simp [decodeDirection?] at hmove
                | cons second suffix =>
                    cases second <;> simp [decodeDirection?] at hmove
                    all_goals rcases hmove with ⟨rfl, rfl⟩ <;> simp
          calc
            (decodeDirectionM? tail).ticks +
                  (decodeNatM? rest).ticks + 2 <=
                3 + (rest.length + 1) + 2 :=
              Nat.add_le_add_right
                (Nat.add_le_add (decodeDirectionM?_ticks_le tail)
                  (decodeNatM?_ticks_le rest)) 2
            _ <= 3 * ((write :: tail).length + 1) := by
              simp only [List.length_cons]
              have h := Nat.add_le_add_right hrest 4
              have h' : rest.length + 6 <= tail.length + 4 := by
                simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using h
              have h'' : rest.length + 6 <= tail.length + 6 :=
                Nat.le_trans h' (Nat.le_add_right _ 2)
              have hfinal : rest.length + 6 <= 3 * (tail.length + 2) :=
                Nat.le_trans h'' (by
                change tail.length + 6 <= 3 * (tail.length + 2)
                rw [Nat.mul_add]
                exact Nat.add_le_add_right
                  (Nat.le_mul_of_pos_left tail.length (by decide : 0 < 3)) 6)
              simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using hfinal

theorem decodeRuleM?_peak_le (payload : BitWord) :
    (decodeRuleM? payload).peak <= payload.length + 2 := by
  cases payload with
  | nil => simp [decodeRuleM?]
  | cons write tail =>
      unfold decodeRuleM?
      cases hmove : (decodeDirectionM? tail).value with
      | none =>
          simp only [hmove]
          exact Nat.le_trans (decodeDirectionM?_peak_le tail) (by
            simp only [List.length_cons]
            exact Nat.le_add_left 2 (tail.length + 1))
      | some pair =>
          rcases pair with ⟨direction, rest⟩
          simp only [hmove]
          apply (Nat.max_le).2
          constructor
          · exact Nat.le_trans (decodeDirectionM?_peak_le tail) (by
              simp only [List.length_cons]
              exact Nat.le_add_left 2 (tail.length + 1))
          · have hrest : rest.length + 2 <= tail.length := by
              rw [decodeDirectionM?_value] at hmove
              cases tail with
              | nil => simp [decodeDirection?] at hmove
              | cons first tail =>
                  cases first <;> cases tail with
                  | nil => simp [decodeDirection?] at hmove
                  | cons second suffix =>
                      cases second <;> simp [decodeDirection?] at hmove
                      all_goals rcases hmove with ⟨rfl, rfl⟩ <;> simp
            exact Nat.le_trans (decodeNatM?_peak_le rest) (by
              simp only [List.length_cons]
              have hfinal : rest.length + 1 <= tail.length + 3 :=
                Nat.le_trans (Nat.le_succ (rest.length + 1))
                  (Nat.le_trans hrest (Nat.le_add_right _ 3))
              simpa [Nat.add_assoc] using hfinal)

/-! Successful prefix parsers consume a literal prefix. -/

theorem decodeDirection?_reconstruct_source {payload tail : BitWord}
    {direction : ProtectedTrieMachine.Direction}
    (hdecode : decodeDirection? payload = some (direction, tail)) :
    payload = encodeDirection direction ++ tail := by
  cases payload with
  | nil => simp [decodeDirection?] at hdecode
  | cons first rest =>
      cases first <;> cases rest with
      | nil => simp [decodeDirection?] at hdecode
      | cons second suffix =>
          cases second <;> simp [decodeDirection?] at hdecode
          all_goals rcases hdecode with ⟨rfl, rfl⟩ <;> rfl

theorem decodeRule?_reconstruct_source {payload tail : BitWord}
    {rule : Rule} (hdecode : decodeRule? payload = some (rule, tail)) :
    payload = encodeRule rule ++ tail := by
  cases payload with
  | nil => simp [decodeRule?] at hdecode
  | cons write rest =>
      simp only [decodeRule?] at hdecode
      cases hmove : decodeDirection? rest with
      | none => simp [hmove] at hdecode
      | some pair =>
          rcases pair with ⟨direction, afterMove⟩
          simp only [hmove, Option.bind_some] at hdecode
          cases hnumber : decodeNat? afterMove with
          | none => simp [hnumber] at hdecode
          | some pair =>
              rcases pair with ⟨number, suffix⟩
              simp [hnumber] at hdecode
              rcases hdecode with ⟨rfl, rfl⟩
              rw [decodeDirection?_reconstruct_source hmove,
                decodeNat?_reconstruct hnumber]
              simp [encodeRule, List.append_assoc]

theorem decodeRuleOption?_reconstruct_source {payload tail : BitWord}
    {slot : Option Rule}
    (hdecode : decodeRuleOption? payload = some (slot, tail)) :
    payload = encodeRuleOption slot ++ tail := by
  cases payload with
  | nil => simp [decodeRuleOption?] at hdecode
  | cons present rest =>
      cases present with
      | false =>
          simp [decodeRuleOption?] at hdecode
          rcases hdecode with ⟨rfl, rfl⟩
          rfl
      | true =>
          simp only [decodeRuleOption?] at hdecode
          cases hrule : decodeRule? rest with
          | none => simp [hrule] at hdecode
          | some pair =>
              rcases pair with ⟨rule, suffix⟩
              simp [hrule] at hdecode
              rcases hdecode with ⟨rfl, rfl⟩
              rw [decodeRule?_reconstruct_source hrule]
              rfl

theorem decodeRuleOption?_tail_length_lt {payload tail : BitWord}
    {slot : Option Rule}
    (hdecode : decodeRuleOption? payload = some (slot, tail)) :
    tail.length < payload.length := by
  rw [decodeRuleOption?_reconstruct_source hdecode,
    List.length_append]
  have hnonempty : 0 < (encodeRuleOption slot).length := by
    cases slot <;> simp [encodeRuleOption]
  exact Nat.lt_add_of_pos_left hnonempty

theorem decodeRuleOptionM?_ticks_le (payload : BitWord) :
    (decodeRuleOptionM? payload).ticks <= 3 * (payload.length + 1) := by
  cases payload with
  | nil => simp [decodeRuleOptionM?]
  | cons present tail =>
      cases present with
      | false =>
          change 1 <= 3 * ((false :: tail).length + 1)
          exact Nat.le_trans (by decide : 1 <= 3)
            (Nat.le_mul_of_pos_right 3 (by simp))
      | true =>
          change (decodeRuleM? tail).ticks + 1 <=
            3 * ((true :: tail).length + 1)
          exact Nat.le_trans
            (Nat.add_le_add_right (decodeRuleM?_ticks_le tail) 1) (by
              simp only [List.length_cons]
              rw [Nat.mul_succ]
              exact Nat.le_add_right _ 2)

theorem decodeRuleOptionM?_peak_le (payload : BitWord) :
    (decodeRuleOptionM? payload).peak <= payload.length + 2 := by
  cases payload with
  | nil => simp [decodeRuleOptionM?]
  | cons present tail =>
      cases present with
      | false => simp [decodeRuleOptionM?]
      | true =>
          change (decodeRuleM? tail).peak + 1 <=
            (true :: tail).length + 2
          simpa only [List.length_cons, Nat.add_assoc] using
            Nat.add_le_add_right (decodeRuleM?_peak_le tail) 1

theorem decodeOrderedCell?_reconstruct_source {payload tail : BitWord}
    {cell : OrderedCell}
    (hdecode : decodeOrderedCell? payload = some (cell, tail)) :
    payload = encodeOrderedCell cell ++ tail := by
  unfold decodeOrderedCell? at hdecode
  cases hfirst : decodeRuleOption? payload with
  | none => simp [hfirst] at hdecode
  | some pair =>
      rcases pair with ⟨slot0, rest⟩
      simp only [hfirst, Option.bind_some] at hdecode
      cases hsecond : decodeRuleOption? rest with
      | none => simp [hsecond] at hdecode
      | some pair =>
          rcases pair with ⟨slot1, suffix⟩
          simp [hsecond] at hdecode
          rcases hdecode with ⟨rfl, rfl⟩
          rw [decodeRuleOption?_reconstruct_source hfirst,
            decodeRuleOption?_reconstruct_source hsecond]
          simp [encodeOrderedCell, List.append_assoc]

theorem decodeOrderedCell?_tail_length_le {payload tail : BitWord}
    {cell : OrderedCell}
    (hdecode : decodeOrderedCell? payload = some (cell, tail)) :
    tail.length <= payload.length := by
  rw [decodeOrderedCell?_reconstruct_source hdecode,
    List.length_append]
  exact Nat.le_add_left _ _

theorem decodeOrderedCellM?_ticks_le (payload : BitWord) :
    (decodeOrderedCellM? payload).ticks <=
      8 * (payload.length + 1) := by
  unfold decodeOrderedCellM?
  cases hfirst : (decodeRuleOptionM? payload).value with
  | none =>
      simp only [hfirst]
      have h := Nat.add_le_add_right
        (decodeRuleOptionM?_ticks_le payload) 1
      exact Nat.le_trans h (by
        have hP : 1 <= payload.length + 1 := Nat.succ_le_succ (Nat.zero_le _)
        exact Nat.le_trans (mul_add_one_le_succ_mul 3 _ hP)
          (Nat.mul_le_mul_right _ (by decide : 4 <= 8)))
  | some pair =>
      rcases pair with ⟨slot0, tail⟩
      simp only [hfirst]
      have hsemantic : decodeRuleOption? payload = some (slot0, tail) := by
        rw [← decodeRuleOptionM?_value]
        exact hfirst
      have htail : tail.length + 1 <= payload.length + 1 :=
        Nat.add_le_add_right (Nat.le_of_lt
          (decodeRuleOption?_tail_length_lt hsemantic)) 1
      have hsecond := Nat.le_trans (decodeRuleOptionM?_ticks_le tail)
        (Nat.mul_le_mul_left 3 htail)
      have hsum := Nat.add_le_add
        (decodeRuleOptionM?_ticks_le payload) hsecond
      have hstep := Nat.add_le_add_right hsum 1
      exact Nat.le_trans hstep (by
        have hP : 1 <= payload.length + 1 := Nat.succ_le_succ (Nat.zero_le _)
        have hrewrite :
            3 * (payload.length + 1) + 3 * (payload.length + 1) + 1 =
              6 * (payload.length + 1) + 1 := by
          rw [show 6 = 3 + 3 by rfl, Nat.add_mul]
        rw [hrewrite]
        exact Nat.le_trans (mul_add_one_le_succ_mul 6 _ hP)
          (Nat.mul_le_mul_right _ (by decide : 7 <= 8)))

theorem decodeOrderedCellM?_peak_le (payload : BitWord) :
    (decodeOrderedCellM? payload).peak <= payload.length + 3 := by
  unfold decodeOrderedCellM?
  cases hfirst : (decodeRuleOptionM? payload).value with
  | none =>
      simp only [hfirst]
      exact Nat.le_trans (decodeRuleOptionM?_peak_le payload)
        (Nat.le_succ _)
  | some pair =>
      rcases pair with ⟨slot0, tail⟩
      simp only [hfirst]
      apply (Nat.max_le).2
      constructor
      · exact Nat.le_trans (decodeRuleOptionM?_peak_le payload)
          (Nat.le_succ _)
      · have hsemantic : decodeRuleOption? payload = some (slot0, tail) := by
          rw [← decodeRuleOptionM?_value]
          exact hfirst
        have htail : tail.length + 2 <= payload.length + 2 :=
          Nat.add_le_add_right (Nat.le_of_lt
            (decodeRuleOption?_tail_length_lt hsemantic)) 2
        exact Nat.le_trans (decodeRuleOptionM?_peak_le tail)
          (Nat.le_trans htail (Nat.le_succ _))

theorem decodeOrderedCellM?_reconstruct_counted {payload tail : BitWord}
    {cell : OrderedCell}
    (hdecode : (decodeOrderedCellM? payload).value = some (cell, tail)) :
    payload = encodeOrderedCell cell ++ tail := by
  unfold decodeOrderedCellM? at hdecode
  dsimp only at hdecode
  cases hfirst : (decodeRuleOptionM? payload).value with
  | none =>
      rw [hfirst] at hdecode
      contradiction
  | some pair =>
      rcases pair with ⟨slot0, rest⟩
      rw [hfirst] at hdecode
      dsimp only at hdecode
      cases hsecond : (decodeRuleOptionM? rest).value with
      | none =>
          rw [hsecond] at hdecode
          contradiction
      | some pair =>
          rcases pair with ⟨slot1, suffix⟩
          rw [hsecond] at hdecode
          dsimp only [Option.map] at hdecode
          have hpair := Option.some.inj hdecode
          have hcell := congrArg Prod.fst hpair
          have htail := congrArg Prod.snd hpair
          change ({ slot0 := slot0, slot1 := slot1 } : OrderedCell) = cell at hcell
          change suffix = tail at htail
          subst cell
          subst tail
          have hfirstSemantic :
              decodeRuleOption? payload = some (slot0, rest) := by
            rw [← decodeRuleOptionM?_value]
            exact hfirst
          have hsecondSemantic :
              decodeRuleOption? rest = some (slot1, suffix) := by
            rw [← decodeRuleOptionM?_value]
            exact hsecond
          rw [decodeRuleOption?_reconstruct_source hfirstSemantic,
            decodeRuleOption?_reconstruct_source hsecondSemantic]
          simp [encodeOrderedCell, List.append_assoc]

theorem decodeOrderedCellM?_tail_length_le_counted {payload tail : BitWord}
    {cell : OrderedCell}
    (hdecode : (decodeOrderedCellM? payload).value = some (cell, tail)) :
    tail.length <= payload.length := by
  rw [decodeOrderedCellM?_reconstruct_counted hdecode,
    List.length_append]
  exact Nat.le_add_left _ _

theorem decodeStateRow?_reconstruct_source {payload tail : BitWord}
    {row : StateRow}
    (hdecode : decodeStateRow? payload = some (row, tail)) :
    payload = encodeStateRow row ++ tail := by
  unfold decodeStateRow? at hdecode
  cases hfirst : decodeOrderedCell? payload with
  | none => simp [hfirst] at hdecode
  | some pair =>
      rcases pair with ⟨onFalse, rest⟩
      simp only [hfirst, Option.bind_some] at hdecode
      cases hsecond : decodeOrderedCell? rest with
      | none => simp [hsecond] at hdecode
      | some pair =>
          rcases pair with ⟨onTrue, suffix⟩
          simp [hsecond] at hdecode
          rcases hdecode with ⟨rfl, rfl⟩
          rw [decodeOrderedCell?_reconstruct_source hfirst,
            decodeOrderedCell?_reconstruct_source hsecond]
          simp [encodeStateRow, List.append_assoc]

theorem decodeStateRow?_tail_length_le {payload tail : BitWord}
    {row : StateRow}
    (hdecode : decodeStateRow? payload = some (row, tail)) :
    tail.length <= payload.length := by
  rw [decodeStateRow?_reconstruct_source hdecode, List.length_append]
  exact Nat.le_add_left _ _

theorem decodeStateRowM?_ticks_le (payload : BitWord) :
    (decodeStateRowM? payload).ticks <=
      17 * (payload.length + 1) := by
  unfold decodeStateRowM?
  cases hfirst : (decodeOrderedCellM? payload).value with
  | none =>
      simp only [hfirst]
      have h := Nat.add_le_add_right
        (decodeOrderedCellM?_ticks_le payload) 1
      have hP : 1 <= payload.length + 1 := Nat.succ_le_succ (Nat.zero_le _)
      have h9 : 9 * (payload.length + 1) <=
          17 * (payload.length + 1) :=
        Nat.mul_le_mul_right _ (by decide : 9 <= 17)
      exact Nat.le_trans h (Nat.le_trans
        (mul_add_one_le_succ_mul 8 _ hP) h9)
  | some pair =>
      rcases pair with ⟨onFalse, tail⟩
      simp only [hfirst]
      have htail : tail.length + 1 <= payload.length + 1 :=
        Nat.add_le_add_right
          (decodeOrderedCellM?_tail_length_le_counted hfirst) 1
      have hsecond := Nat.le_trans (decodeOrderedCellM?_ticks_le tail)
        (Nat.mul_le_mul_left 8 htail)
      have hsum := Nat.add_le_add
        (decodeOrderedCellM?_ticks_le payload) hsecond
      have hstep := Nat.add_le_add_right hsum 1
      have hP : 1 <= payload.length + 1 := Nat.succ_le_succ (Nat.zero_le _)
      exact Nat.le_trans hstep (by
        have hrewrite :
            8 * (payload.length + 1) + 8 * (payload.length + 1) + 1 =
              16 * (payload.length + 1) + 1 := by
          rw [show 16 = 8 + 8 by rfl, Nat.add_mul]
        rw [hrewrite]
        exact mul_add_one_le_succ_mul 16 _ hP)

theorem decodeStateRowM?_peak_le (payload : BitWord) :
    (decodeStateRowM? payload).peak <= payload.length + 4 := by
  unfold decodeStateRowM?
  cases hfirst : (decodeOrderedCellM? payload).value with
  | none =>
      simp only [hfirst]
      exact Nat.le_trans (decodeOrderedCellM?_peak_le payload)
        (Nat.le_succ _)
  | some pair =>
      rcases pair with ⟨onFalse, tail⟩
      simp only [hfirst]
      apply (Nat.max_le).2
      constructor
      · exact Nat.le_trans (decodeOrderedCellM?_peak_le payload)
          (Nat.le_succ _)
      · have htail : tail.length + 3 <= payload.length + 3 :=
          Nat.add_le_add_right
            (decodeOrderedCellM?_tail_length_le_counted hfirst) 3
        exact Nat.le_trans (decodeOrderedCellM?_peak_le tail)
          (Nat.le_trans htail (Nat.le_succ _))

theorem decodeStateRowM?_reconstruct_counted {payload tail : BitWord}
    {row : StateRow}
    (hdecode : (decodeStateRowM? payload).value = some (row, tail)) :
    payload = encodeStateRow row ++ tail := by
  unfold decodeStateRowM? at hdecode
  dsimp only at hdecode
  cases hfirst : (decodeOrderedCellM? payload).value with
  | none =>
      rw [hfirst] at hdecode
      contradiction
  | some pair =>
      rcases pair with ⟨onFalse, rest⟩
      rw [hfirst] at hdecode
      dsimp only at hdecode
      cases hsecond : (decodeOrderedCellM? rest).value with
      | none =>
          rw [hsecond] at hdecode
          contradiction
      | some pair =>
          rcases pair with ⟨onTrue, suffix⟩
          rw [hsecond] at hdecode
          dsimp only [Option.map] at hdecode
          have hpair := Option.some.inj hdecode
          have hrow := congrArg Prod.fst hpair
          have htail := congrArg Prod.snd hpair
          change ({ onFalse := onFalse, onTrue := onTrue } : StateRow) = row at hrow
          change suffix = tail at htail
          subst row
          subst tail
          rw [decodeOrderedCellM?_reconstruct_counted hfirst,
            decodeOrderedCellM?_reconstruct_counted hsecond]
          simp [encodeStateRow, List.append_assoc]

theorem decodeStateRowM?_tail_length_le_counted {payload tail : BitWord}
    {row : StateRow}
    (hdecode : (decodeStateRowM? payload).value = some (row, tail)) :
    tail.length <= payload.length := by
  rw [decodeStateRowM?_reconstruct_counted hdecode, List.length_append]
  exact Nat.le_add_left _ _

theorem decodeStateRowsN?_reconstruct_source {count : Nat}
    {payload tail : BitWord} {rows : List StateRow}
    (hdecode : decodeStateRowsN? count payload = some (rows, tail)) :
    payload = encodeStateData rows ++ tail := by
  induction count generalizing payload rows tail with
  | zero =>
      simp [decodeStateRowsN?] at hdecode
      rcases hdecode with ⟨rfl, rfl⟩
      rfl
  | succ count ih =>
      unfold decodeStateRowsN? at hdecode
      cases hfirst : decodeStateRow? payload with
      | none => simp [hfirst] at hdecode
      | some pair =>
          rcases pair with ⟨row, rest⟩
          simp only [hfirst, Option.bind_some] at hdecode
          cases hrows : decodeStateRowsN? count rest with
          | none => simp [hrows] at hdecode
          | some pair =>
              rcases pair with ⟨tailRows, suffix⟩
              simp [hrows] at hdecode
              rcases hdecode with ⟨rfl, rfl⟩
              rw [decodeStateRow?_reconstruct_source hfirst, ih hrows]
              simp [encodeStateData, List.append_assoc]

theorem decodeStateRowsN?_tail_length_le {count : Nat}
    {payload tail : BitWord} {rows : List StateRow}
    (hdecode : decodeStateRowsN? count payload = some (rows, tail)) :
    tail.length <= payload.length := by
  rw [decodeStateRowsN?_reconstruct_source hdecode, List.length_append]
  exact Nat.le_add_left _ _

theorem decodeStateRowsN?_rows_length_source {count : Nat}
    {payload tail : BitWord} {rows : List StateRow}
    (hdecode : decodeStateRowsN? count payload = some (rows, tail)) :
    rows.length = count := by
  induction count generalizing payload rows tail with
  | zero =>
      simp [decodeStateRowsN?] at hdecode
      exact hdecode.1 ▸ rfl
  | succ count ih =>
      unfold decodeStateRowsN? at hdecode
      cases hfirst : decodeStateRow? payload with
      | none => simp [hfirst] at hdecode
      | some pair =>
          rcases pair with ⟨row, rest⟩
          simp only [hfirst, Option.bind_some] at hdecode
          cases hrows : decodeStateRowsN? count rest with
          | none => simp [hrows] at hdecode
          | some pair =>
              rcases pair with ⟨tailRows, suffix⟩
              simp [hrows] at hdecode
              rcases hdecode with ⟨rfl, rfl⟩
              simp [ih hrows]

theorem decodeStateRowsNM?_ticks_le (count : Nat) (payload : BitWord) :
    (decodeStateRowsNM? count payload).ticks <=
      20 * (count + 1) * (payload.length + 1) := by
  induction count generalizing payload with
  | zero =>
      change 1 <= 20 * (0 + 1) * (payload.length + 1)
      simp only [Nat.zero_add, Nat.mul_one]
      exact Nat.le_trans (by decide : 1 <= 20)
        (Nat.le_mul_of_pos_right 20 (by simp))
  | succ count ih =>
      unfold decodeStateRowsNM?
      cases hfirst : (decodeStateRowM? payload).value with
      | none =>
          simp only [hfirst]
          have hstep := Nat.add_le_add_right
            (decodeStateRowM?_ticks_le payload) 1
          have hP : 1 <= payload.length + 1 :=
            Nat.succ_le_succ (Nat.zero_le _)
          have h18 : 17 * (payload.length + 1) + 1 <=
              18 * (payload.length + 1) :=
            mul_add_one_le_succ_mul 17 _ hP
          have hcoef : 18 <= 20 * (count + 1 + 1) := by
            exact Nat.le_trans (by decide : 18 <= 20)
              (Nat.le_mul_of_pos_right 20 (by simp))
          exact Nat.le_trans hstep (Nat.le_trans h18
            (Nat.mul_le_mul_right _ hcoef))
      | some pair =>
          rcases pair with ⟨row, tail⟩
          simp only [hfirst]
          have htail : tail.length + 1 <= payload.length + 1 :=
            Nat.add_le_add_right
              (decodeStateRowM?_tail_length_le_counted hfirst) 1
          have hrec := Nat.le_trans (ih tail)
            (Nat.mul_le_mul_left (20 * (count + 1)) htail)
          have hsum := Nat.add_le_add
            (decodeStateRowM?_ticks_le payload) hrec
          have hstep := Nat.add_le_add_right hsum 1
          have hP : 1 <= payload.length + 1 :=
            Nat.succ_le_succ (Nat.zero_le _)
          have hone : 17 * (payload.length + 1) +
                20 * (count + 1) * (payload.length + 1) + 1 <=
              18 * (payload.length + 1) +
                20 * (count + 1) * (payload.length + 1) := by
            have hsmall := mul_add_one_le_succ_mul 17 _ hP
            have hadd := Nat.add_le_add_right hsmall
              (20 * (count + 1) * (payload.length + 1))
            simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using hadd
          have hcoef : 18 + 20 * (count + 1) <=
              20 * (count + 1 + 1) := by
            have hadd := Nat.add_le_add_left (by decide : 18 <= 20)
              (20 * (count + 1))
            simpa [Nat.mul_succ, Nat.add_assoc, Nat.add_comm,
              Nat.add_left_comm] using hadd
          exact Nat.le_trans hstep (Nat.le_trans hone (by
            have := Nat.mul_le_mul_right (payload.length + 1) hcoef
            simpa [Nat.add_mul, Nat.mul_assoc,
              Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using this))

theorem decodeStateRowsNM?_peak_le (count : Nat) (payload : BitWord) :
    (decodeStateRowsNM? count payload).peak <=
      payload.length + count + 4 := by
  induction count generalizing payload with
  | zero =>
      change 1 <= payload.length + 0 + 4
      exact Nat.le_add_left 1 (payload.length + 3)
  | succ count ih =>
      unfold decodeStateRowsNM?
      cases hfirst : (decodeStateRowM? payload).value with
      | none =>
          simp only [hfirst]
          exact Nat.le_trans (decodeStateRowM?_peak_le payload) (by
            have hsmall : 4 <= count + 5 :=
              Nat.le_add_left 4 (count + 1)
            have hadd := Nat.add_le_add_left hsmall payload.length
            simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using hadd)
      | some pair =>
          rcases pair with ⟨row, tail⟩
          simp only [hfirst]
          apply (Nat.max_le).2
          constructor
          · exact Nat.le_trans (decodeStateRowM?_peak_le payload) (by
              have hsmall : 4 <= count + 5 :=
                Nat.le_add_left 4 (count + 1)
              have hadd := Nat.add_le_add_left hsmall payload.length
              simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using hadd)
          · have htail := decodeStateRowM?_tail_length_le_counted hfirst
            have hrec := Nat.add_le_add_right (ih tail) 1
            exact Nat.le_trans hrec (by
              have := Nat.add_le_add_right htail (count + 5)
              simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using this)

theorem decodeStateRowsNM?_reconstruct_counted {count : Nat}
    {payload tail : BitWord} {rows : List StateRow}
    (hdecode : (decodeStateRowsNM? count payload).value = some (rows, tail)) :
    payload = encodeStateData rows ++ tail := by
  induction count generalizing payload rows tail with
  | zero =>
      change some ([], payload) = some (rows, tail) at hdecode
      have hpair := Option.some.inj hdecode
      have hrows := congrArg Prod.fst hpair
      have htail := congrArg Prod.snd hpair
      change [] = rows at hrows
      change payload = tail at htail
      subst rows
      subst tail
      rfl
  | succ count ih =>
      unfold decodeStateRowsNM? at hdecode
      dsimp only at hdecode
      cases hfirst : (decodeStateRowM? payload).value with
      | none =>
          rw [hfirst] at hdecode
          contradiction
      | some pair =>
          rcases pair with ⟨row, rest⟩
          rw [hfirst] at hdecode
          dsimp only at hdecode
          cases hrest : (decodeStateRowsNM? count rest).value with
          | none =>
              rw [hrest] at hdecode
              contradiction
          | some pair =>
              rcases pair with ⟨tailRows, suffix⟩
              rw [hrest] at hdecode
              dsimp only [Option.map] at hdecode
              have hpair := Option.some.inj hdecode
              have hrows := congrArg Prod.fst hpair
              have htail := congrArg Prod.snd hpair
              change row :: tailRows = rows at hrows
              change suffix = tail at htail
              subst rows
              subst tail
              rw [decodeStateRowM?_reconstruct_counted hfirst, ih hrest]
              simp [encodeStateData, List.append_assoc]

theorem decodeStateRowsNM?_rows_length_counted {count : Nat}
    {payload tail : BitWord} {rows : List StateRow}
    (hdecode : (decodeStateRowsNM? count payload).value = some (rows, tail)) :
    rows.length = count := by
  induction count generalizing payload rows tail with
  | zero =>
      change some ([], payload) = some (rows, tail) at hdecode
      have hpair := Option.some.inj hdecode
      have hrows := congrArg Prod.fst hpair
      change [] = rows at hrows
      subst rows
      rfl
  | succ count ih =>
      unfold decodeStateRowsNM? at hdecode
      dsimp only at hdecode
      cases hfirst : (decodeStateRowM? payload).value with
      | none => rw [hfirst] at hdecode; contradiction
      | some pair =>
          rcases pair with ⟨row, rest⟩
          rw [hfirst] at hdecode
          dsimp only at hdecode
          cases hrest : (decodeStateRowsNM? count rest).value with
          | none => rw [hrest] at hdecode; contradiction
          | some pair =>
              rcases pair with ⟨tailRows, suffix⟩
              rw [hrest] at hdecode
              dsimp only [Option.map] at hdecode
              have hpair := Option.some.inj hdecode
              have hrows := congrArg Prod.fst hpair
              change row :: tailRows = rows at hrows
              subst rows
              simp [ih hrest]

theorem decodeStateRowsNM?_tail_length_le_counted {count : Nat}
    {payload tail : BitWord} {rows : List StateRow}
    (hdecode : (decodeStateRowsNM? count payload).value = some (rows, tail)) :
    tail.length <= payload.length := by
  rw [decodeStateRowsNM?_reconstruct_counted hdecode,
    List.length_append]
  exact Nat.le_add_left _ _

theorem decodeMachine?_reconstruct_source {payload tail : BitWord}
    {machine : Machine}
    (hdecode : decodeMachine? payload = some (machine, tail)) :
    payload = encodeMachine machine ++ tail := by
  unfold decodeMachine? at hdecode
  cases hcount : decodeNat? payload with
  | none => simp [hcount] at hdecode
  | some pair =>
      rcases pair with ⟨count, rest⟩
      simp only [hcount, Option.bind_some] at hdecode
      cases hrows : decodeStateRowsN? count rest with
      | none => simp [hrows] at hdecode
      | some pair =>
          rcases pair with ⟨rows, suffix⟩
          simp [hrows] at hdecode
          rcases hdecode with ⟨rfl, rfl⟩
          rw [decodeNat?_reconstruct hcount,
            decodeStateRowsN?_reconstruct_source hrows]
          have hlength := decodeStateRowsN?_rows_length_source hrows
          rw [← hlength]
          simp [encodeMachine, List.append_assoc]

theorem decodeMachine?_tail_length_le {payload tail : BitWord}
    {machine : Machine}
    (hdecode : decodeMachine? payload = some (machine, tail)) :
    tail.length <= payload.length := by
  rw [decodeMachine?_reconstruct_source hdecode, List.length_append]
  exact Nat.le_add_left _ _

theorem decodeMachineM?_ticks_le (payload : BitWord) :
    (decodeMachineM? payload).ticks <=
      24 * (payload.length + 1) * (payload.length + 1) := by
  unfold decodeMachineM?
  cases hcount : (decodeNatM? payload).value with
  | none =>
      simp only [hcount]
      have hstep := Nat.add_le_add_right
        (decodeNatM?_ticks_le payload) 1
      have hP : payload.length + 2 <=
          2 * (payload.length + 1) := by
        rw [Nat.mul_add, Nat.mul_one]
        exact Nat.add_le_add_right
          (Nat.le_mul_of_pos_left payload.length (by decide : 0 < 2)) 2
      have h2P := Nat.le_trans hstep hP
      have hPpos : 1 <= payload.length + 1 :=
        Nat.succ_le_succ (Nat.zero_le _)
      have hquad : 2 * (payload.length + 1) <=
          24 * (payload.length + 1) * (payload.length + 1) := by
        have hc : 2 <= 24 * (payload.length + 1) :=
          Nat.le_trans (by decide : 2 <= 24)
            (Nat.le_mul_of_pos_right 24 (by simp))
        exact Nat.mul_le_mul_right _ hc
      exact Nat.le_trans h2P hquad
  | some pair =>
      rcases pair with ⟨count, tail⟩
      simp only [hcount]
      have hsemantic : decodeNat? payload = some (count, tail) := by
        rw [← decodeNatM?_value]
        exact hcount
      have hreconstruct := decodeNat?_reconstruct hsemantic
      have hlen : count + 1 + tail.length = payload.length := by
        have := congrArg List.length hreconstruct
        simpa [List.length_append, encodeNat_length,
          Nat.add_assoc] using this.symm
      have hcountP : count + 1 <= payload.length + 1 :=
        Nat.le_trans (by
          rw [← hlen]
          exact Nat.le_add_right _ tail.length) (Nat.le_succ _)
      have htailP : tail.length + 1 <= payload.length + 1 := by
        rw [← hlen]
        exact Nat.add_le_add_right (Nat.le_add_left _ (count + 1)) 1
      have hrows0 := decodeStateRowsNM?_ticks_le count tail
      have hrows1 := Nat.le_trans hrows0
        (Nat.mul_le_mul_right (tail.length + 1)
          (Nat.mul_le_mul_left 20 hcountP))
      have hrows : (decodeStateRowsNM? count tail).ticks <=
          20 * (payload.length + 1) * (payload.length + 1) :=
        Nat.le_trans hrows1
          (Nat.mul_le_mul_left (20 * (payload.length + 1)) htailP)
      have hsum := Nat.add_le_add
        (decodeNatM?_ticks_le payload) hrows
      have hstep := Nat.add_le_add_right hsum 1
      let P := payload.length + 1
      have hPpos : 1 <= P := Nat.succ_le_succ (Nat.zero_le _)
      have hlinear : P + 20 * P * P + 1 <= 22 * P * P := by
        have hPquad : P <= P * P := by
          simpa [Nat.one_mul] using Nat.mul_le_mul_right P hPpos
        have honequad : 1 <= P * P :=
          Nat.le_trans hPpos hPquad
        have hadd := Nat.add_le_add
          (Nat.add_le_add hPquad (Nat.le_refl (20 * P * P))) honequad
        have hre : P * P + 20 * P * P + P * P = 22 * P * P := by
          calc
            P * P + 20 * P * P + P * P =
                1 * (P * P) + 20 * (P * P) + 1 * (P * P) := by
              simp [Nat.mul_assoc]
            _ = (1 + 20 + 1) * (P * P) := by
              rw [← Nat.add_mul 1 20, ← Nat.add_mul (1 + 20) 1]
            _ = 22 * P * P := by simp [Nat.mul_assoc]
        exact Nat.le_trans hadd (Nat.le_of_eq hre)
      have h22 : 22 * P * P <= 24 * P * P := by
        exact Nat.mul_le_mul_right P
          (Nat.mul_le_mul_right P (by decide : 22 <= 24))
      exact Nat.le_trans hstep (by
        change P + 20 * P * P + 1 <= 24 * P * P
        exact Nat.le_trans hlinear h22)

theorem decodeMachineM?_peak_le (payload : BitWord) :
    (decodeMachineM? payload).peak <= 3 * (payload.length + 1) := by
  unfold decodeMachineM?
  cases hcount : (decodeNatM? payload).value with
  | none =>
      simp only [hcount]
      exact Nat.le_trans (decodeNatM?_peak_le payload)
        (Nat.le_mul_of_pos_left _ (by decide : 0 < 3))
  | some pair =>
      rcases pair with ⟨count, tail⟩
      simp only [hcount]
      apply (Nat.max_le).2
      constructor
      · exact Nat.le_trans (decodeNatM?_peak_le payload)
          (Nat.le_mul_of_pos_left _ (by decide : 0 < 3))
      · have hsemantic : decodeNat? payload = some (count, tail) := by
          rw [← decodeNatM?_value]
          exact hcount
        have hreconstruct := decodeNat?_reconstruct hsemantic
        have hlen : count + 1 + tail.length = payload.length := by
          have := congrArg List.length hreconstruct
          simpa [List.length_append, encodeNat_length,
            Nat.add_assoc] using this.symm
        have hrows := decodeStateRowsNM?_peak_le count tail
        have hbound : tail.length + count + 4 <=
            payload.length + 3 := by
          rw [← hlen]
          exact Nat.le_of_eq (by
            simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm])
        exact Nat.le_trans hrows (Nat.le_trans hbound (by
          change payload.length + 3 <= 3 * (payload.length + 1)
          rw [Nat.mul_add, Nat.mul_one]
          exact Nat.add_le_add_right
            (Nat.le_mul_of_pos_left payload.length (by decide : 0 < 3)) 3))

theorem decodeMachineM?_reconstruct_counted {payload tail : BitWord}
    {machine : Machine}
    (hdecode : (decodeMachineM? payload).value = some (machine, tail)) :
    payload = encodeMachine machine ++ tail := by
  unfold decodeMachineM? at hdecode
  dsimp only at hdecode
  cases hcount : (decodeNatM? payload).value with
  | none => rw [hcount] at hdecode; contradiction
  | some pair =>
      rcases pair with ⟨count, rest⟩
      rw [hcount] at hdecode
      dsimp only at hdecode
      cases hrows : (decodeStateRowsNM? count rest).value with
      | none => rw [hrows] at hdecode; contradiction
      | some pair =>
          rcases pair with ⟨rows, suffix⟩
          rw [hrows] at hdecode
          dsimp only [Option.map] at hdecode
          have hpair := Option.some.inj hdecode
          have hmachine := congrArg Prod.fst hpair
          have htail := congrArg Prod.snd hpair
          change ({ states := rows } : Machine) = machine at hmachine
          change suffix = tail at htail
          subst machine
          subst tail
          have hcountSemantic : decodeNat? payload = some (count, rest) := by
            rw [← decodeNatM?_value]
            exact hcount
          rw [decodeNat?_reconstruct hcountSemantic,
            decodeStateRowsNM?_reconstruct_counted hrows]
          have hlength := decodeStateRowsNM?_rows_length_counted hrows
          rw [← hlength]
          simp [encodeMachine, List.append_assoc]

theorem decodeMachineM?_tail_length_le_counted {payload tail : BitWord}
    {machine : Machine}
    (hdecode : (decodeMachineM? payload).value = some (machine, tail)) :
    tail.length <= payload.length := by
  rw [decodeMachineM?_reconstruct_counted hdecode, List.length_append]
  exact Nat.le_add_left _ _

theorem decodeInstancePrefix?_reconstruct_source {payload tail : BitWord}
    {source : Instance}
    (hdecode : decodeInstancePrefix? payload = some (source, tail)) :
    payload = encodeInstance source ++ tail := by
  unfold decodeInstancePrefix? at hdecode
  cases hmachine : decodeMachine? payload with
  | none => simp [hmachine] at hdecode
  | some pair =>
      rcases pair with ⟨machine, afterMachine⟩
      simp only [hmachine, Option.bind_some] at hdecode
      cases hstate : decodeNat? afterMachine with
      | none => simp [hstate] at hdecode
      | some pair =>
          rcases pair with ⟨initial, afterState⟩
          simp [hstate] at hdecode
          cases hinput : decodeBits? afterState with
          | none => simp [hinput] at hdecode
          | some pair =>
              rcases pair with ⟨input, suffix⟩
              simp [hinput] at hdecode
              rcases hdecode with ⟨rfl, rfl⟩
              rw [decodeMachine?_reconstruct_source hmachine,
                decodeNat?_reconstruct hstate,
                decodeBits?_reconstruct hinput]
              simp [encodeInstance, List.append_assoc]

theorem decodeInstancePrefix?_tail_length_le {payload tail : BitWord}
    {source : Instance}
    (hdecode : decodeInstancePrefix? payload = some (source, tail)) :
    tail.length <= payload.length := by
  rw [decodeInstancePrefix?_reconstruct_source hdecode,
    List.length_append]
  exact Nat.le_add_left _ _

theorem decodeInstancePrefixM?_ticks_le (payload : BitWord) :
    (decodeInstancePrefixM? payload).ticks <=
      32 * (payload.length + 1) * (payload.length + 1) := by
  let P := payload.length + 1
  let Q := P * P
  have hP : 1 <= P := Nat.succ_le_succ (Nat.zero_le _)
  have hPQ : P <= Q := by
    simpa [Q, Nat.one_mul] using Nat.mul_le_mul_right P hP
  have hQ : 1 <= Q := Nat.le_trans hP hPQ
  rw [Nat.mul_assoc]
  change (decodeInstancePrefixM? payload).ticks <= 32 * Q
  unfold decodeInstancePrefixM?
  cases hmachine : (decodeMachineM? payload).value with
  | none =>
      simp only [hmachine]
      have hstep := Nat.add_le_add_right
        (decodeMachineM?_ticks_le payload) 1
      have h25 := mul_add_one_le_succ_mul 24 Q hQ
      exact Nat.le_trans hstep (Nat.le_trans (by
        simpa [P, Q, Nat.mul_assoc] using h25) (by
          exact Nat.mul_le_mul_right Q (by decide : 25 <= 32)))
  | some pair =>
      rcases pair with ⟨machine, tail⟩
      simp only [hmachine]
      have htail : tail.length + 1 <= P :=
        Nat.le_trans (Nat.add_le_add_right
          (decodeMachineM?_tail_length_le_counted hmachine) 1) (Nat.le_refl _)
      have hstateTick : (decodeNatM? tail).ticks <= Q :=
        Nat.le_trans (decodeNatM?_ticks_le tail)
          (Nat.le_trans htail hPQ)
      cases hstate : (decodeNatM? tail).value with
      | none =>
          simp only [hstate]
          have hsum := Nat.add_le_add
            (decodeMachineM?_ticks_le payload) hstateTick
          have hstep := Nat.add_le_add_right hsum 1
          have hone := Nat.add_le_add_left hQ (24 * Q + Q)
          have heq : 24 * Q + Q + Q = 26 * Q := by
            rw [show 26 = 24 + 1 + 1 by rfl,
              Nat.add_mul, Nat.add_mul, Nat.one_mul]
          have hlast : 24 * Q + Q + 1 <= 26 * Q :=
            Nat.le_trans hone (Nat.le_of_eq heq)
          exact Nat.le_trans hstep (Nat.le_trans (by
            simpa [P, Q, Nat.mul_assoc, Nat.add_assoc] using hlast) (by
              exact Nat.mul_le_mul_right Q (by decide : 26 <= 32)))
      | some pair =>
          rcases pair with ⟨initial, rest⟩
          simp only [hstate]
          have hstateSemantic : decodeNat? tail = some (initial, rest) := by
            rw [← decodeNatM?_value]
            exact hstate
          have hrestTail := Nat.le_of_lt
            (decodeNat?_tail_length_lt hstateSemantic)
          have hrestPayload := Nat.le_trans hrestTail
            (decodeMachineM?_tail_length_le_counted hmachine)
          have hinputLinear : (decodeBitsM? rest).ticks <= 3 * P := by
            have h0 := decodeBitsM?_ticks_le rest
            have hmul := Nat.mul_le_mul_left 2 hrestPayload
            have h1 := Nat.add_le_add_right hmul 3
            exact Nat.le_trans h0 (Nat.le_trans h1 (by
              change 2 * payload.length + 3 <= 3 * P
              simp only [P, Nat.mul_add, Nat.mul_one]
              exact Nat.add_le_add_right
                (Nat.mul_le_mul_right payload.length
                  (by decide : 2 <= 3)) 3))
          have hinput : (decodeBitsM? rest).ticks <= 3 * Q :=
            Nat.le_trans hinputLinear (Nat.mul_le_mul_left 3 hPQ)
          have hsum1 := Nat.add_le_add
            (decodeMachineM?_ticks_le payload) hstateTick
          have hsum2 := Nat.add_le_add hsum1 hinput
          have hstep := Nat.add_le_add_right hsum2 1
          have hcoef : 24 * Q + Q + 3 * Q + 1 <= 29 * Q := by
            have hone := Nat.add_le_add_left hQ (24 * Q + Q + 3 * Q)
            have heq : 24 * Q + Q + 3 * Q + Q = 29 * Q := by
              rw [show 29 = 24 + 1 + 3 + 1 by rfl,
                Nat.add_mul, Nat.add_mul, Nat.add_mul, Nat.one_mul]
            exact Nat.le_trans hone (Nat.le_of_eq heq)
          exact Nat.le_trans hstep (Nat.le_trans (by
            simpa [P, Q, Nat.mul_assoc, Nat.add_assoc] using hcoef) (by
              exact Nat.mul_le_mul_right Q (by decide : 29 <= 32)))

theorem decodeInstancePrefixM?_peak_le (payload : BitWord) :
    (decodeInstancePrefixM? payload).peak <=
      3 * (payload.length + 1) := by
  unfold decodeInstancePrefixM?
  cases hmachine : (decodeMachineM? payload).value with
  | none =>
      simp only [hmachine]
      exact decodeMachineM?_peak_le payload
  | some pair =>
      rcases pair with ⟨machine, tail⟩
      simp only [hmachine]
      have htail : tail.length + 1 <= payload.length + 1 :=
        Nat.add_le_add_right
          (decodeMachineM?_tail_length_le_counted hmachine) 1
      cases hstate : (decodeNatM? tail).value with
      | none =>
          simp only [hstate]
          apply (Nat.max_le).2
          exact ⟨decodeMachineM?_peak_le payload,
            Nat.le_trans (decodeNatM?_peak_le tail)
              (Nat.le_trans htail
                (Nat.le_mul_of_pos_left _ (by decide : 0 < 3)))⟩
      | some pair =>
          rcases pair with ⟨initial, rest⟩
          simp only [hstate]
          apply (Nat.max_le).2
          constructor
          · exact decodeMachineM?_peak_le payload
          · apply (Nat.max_le).2
            constructor
            · exact Nat.le_trans (decodeNatM?_peak_le tail)
                (Nat.le_trans htail
                  (Nat.le_mul_of_pos_left _ (by decide : 0 < 3)))
            · have hstateSemantic : decodeNat? tail = some (initial, rest) := by
                rw [← decodeNatM?_value]
                exact hstate
              have hrestTail := Nat.le_of_lt
                (decodeNat?_tail_length_lt hstateSemantic)
              have hrestPayload := Nat.le_trans hrestTail
                (decodeMachineM?_tail_length_le_counted hmachine)
              have hrest : rest.length + 1 <= payload.length + 1 :=
                Nat.add_le_add_right hrestPayload 1
              exact Nat.le_trans (decodeBitsM?_peak_le rest)
                (Nat.le_trans hrest
                  (Nat.le_mul_of_pos_left _ (by decide : 0 < 3)))

theorem decodeInstancePrefixM?_reconstruct_counted {payload tail : BitWord}
    {source : Instance}
    (hdecode : (decodeInstancePrefixM? payload).value = some (source, tail)) :
    payload = encodeInstance source ++ tail := by
  unfold decodeInstancePrefixM? at hdecode
  dsimp only at hdecode
  cases hmachine : (decodeMachineM? payload).value with
  | none => rw [hmachine] at hdecode; contradiction
  | some pair =>
      rcases pair with ⟨machine, afterMachine⟩
      rw [hmachine] at hdecode
      dsimp only at hdecode
      cases hstate : (decodeNatM? afterMachine).value with
      | none => rw [hstate] at hdecode; contradiction
      | some pair =>
          rcases pair with ⟨initial, afterState⟩
          rw [hstate] at hdecode
          dsimp only at hdecode
          cases hinput : (decodeBitsM? afterState).value with
          | none => rw [hinput] at hdecode; contradiction
          | some pair =>
              rcases pair with ⟨input, suffix⟩
              rw [hinput] at hdecode
              dsimp only [Option.map] at hdecode
              have hpair := Option.some.inj hdecode
              have hsource := congrArg Prod.fst hpair
              have htail := congrArg Prod.snd hpair
              change (⟨machine, initial, input⟩ : Instance) = source at hsource
              change suffix = tail at htail
              subst source
              subst tail
              have hstateSemantic :
                  decodeNat? afterMachine = some (initial, afterState) := by
                rw [← decodeNatM?_value]
                exact hstate
              have hinputSemantic :
                  decodeBits? afterState = some (input, suffix) := by
                rw [← decodeBitsM?_value]
                exact hinput
              rw [decodeMachineM?_reconstruct_counted hmachine,
                decodeNat?_reconstruct hstateSemantic,
                decodeBits?_reconstruct hinputSemantic]
              simp [encodeInstance, List.append_assoc]

theorem decodeInstanceM?_ticks_le (payload : BitWord) :
    (decodeInstanceM? payload).ticks <=
      50 * (payload.length + 1) * (payload.length + 1) := by
  let P := payload.length + 1
  let Q := P * P
  have hP : 1 <= P := Nat.succ_le_succ (Nat.zero_le _)
  have hPQ : P <= Q := by
    simpa [Q, Nat.one_mul] using Nat.mul_le_mul_right P hP
  have hQ : 1 <= Q := Nat.le_trans hP hPQ
  rw [Nat.mul_assoc]
  change (decodeInstanceM? payload).ticks <= 50 * Q
  unfold decodeInstanceM?
  cases hparsed : (decodeInstancePrefixM? payload).value with
  | none =>
      simp only [hparsed]
      have hstep := Nat.add_le_add_right
        (decodeInstancePrefixM?_ticks_le payload) 1
      have h33 := mul_add_one_le_succ_mul 32 Q hQ
      exact Nat.le_trans hstep (Nat.le_trans (by
        simpa [P, Q, Nat.mul_assoc] using h33)
        (Nat.mul_le_mul_right Q (by decide : 33 <= 50)))
  | some pair =>
      rcases pair with ⟨source, tail⟩
      cases tail with
      | cons bit tail =>
          simp only [hparsed]
          have hstep := Nat.add_le_add_right
            (decodeInstancePrefixM?_ticks_le payload) 1
          have h33 := mul_add_one_le_succ_mul 32 Q hQ
          exact Nat.le_trans hstep (Nat.le_trans (by
            simpa [P, Q, Nat.mul_assoc] using h33)
            (Nat.mul_le_mul_right Q (by decide : 33 <= 50)))
      | nil =>
          simp only [hparsed]
          have hcanonical : payload = encodeInstance source := by
            simpa using decodeInstancePrefixM?_reconstruct_counted hparsed
          have hencoded0 := encodeInstanceLinearM_ticks_le source
          have hencoded : (encodeInstanceLinearM source).ticks <= 16 * P := by
            simpa [P, hcanonical] using hencoded0
          have hencodedQ : (encodeInstanceLinearM source).ticks <= 16 * Q :=
            Nat.le_trans hencoded (Nat.mul_le_mul_left 16 hPQ)
          have hequal :
              (bitsEqM payload (encodeInstanceLinearM source).value).ticks <= Q :=
            Nat.le_trans (bitsEqM_ticks_le payload _)
              (Nat.le_trans (by simpa [P] using (Nat.le_refl P)) hPQ)
          have hsum1 := Nat.add_le_add
            (decodeInstancePrefixM?_ticks_le payload) hencodedQ
          have hsum2 := Nat.add_le_add hsum1 hequal
          have hstep := Nat.add_le_add_right hsum2 1
          have hone := Nat.add_le_add_left hQ
            (32 * Q + 16 * Q + Q)
          have heq : 32 * Q + 16 * Q + Q + Q = 50 * Q := by
            rw [show 50 = 32 + 16 + 1 + 1 by rfl,
              Nat.add_mul, Nat.add_mul, Nat.add_mul, Nat.one_mul]
          have hcoef : 32 * Q + 16 * Q + Q + 1 <= 50 * Q :=
            Nat.le_trans hone (Nat.le_of_eq heq)
          exact Nat.le_trans hstep (by
            simpa [P, Q, Nat.mul_assoc, Nat.add_assoc] using hcoef)

theorem decodeInstanceM?_peak_le (payload : BitWord) :
    (decodeInstanceM? payload).peak <=
      3 * (payload.length + 1) := by
  unfold decodeInstanceM?
  cases hparsed : (decodeInstancePrefixM? payload).value with
  | none =>
      simp only [hparsed]
      exact decodeInstancePrefixM?_peak_le payload
  | some pair =>
      rcases pair with ⟨source, tail⟩
      cases tail with
      | cons bit tail =>
          simp only [hparsed]
          exact decodeInstancePrefixM?_peak_le payload
      | nil =>
          simp only [hparsed]
          have hcanonical : payload = encodeInstance source := by
            simpa using decodeInstancePrefixM?_reconstruct_counted hparsed
          apply (Nat.max_le).2
          constructor
          · exact decodeInstancePrefixM?_peak_le payload
          · apply (Nat.max_le).2
            constructor
            · simpa [hcanonical] using encodeInstanceLinearM_peak_le source
            · exact Nat.le_trans (bitsEqM_peak_le payload _)
                (Nat.le_mul_of_pos_left _ (by decide : 0 < 3))

/-! ## Counted local literal-label resources -/

theorem lastRowM?_ticks_le (rows : List Row) :
    (lastRowM? rows).ticks <= rows.length + 1 := by
  induction rows with
  | nil => exact Nat.le_refl _
  | cons row rows ih =>
      cases rows with
      | nil => exact Nat.le_refl _
      | cons next rest =>
          simp only [lastRowM?, List.length_cons]
          exact Nat.add_le_add_right ih 1

theorem lastRowM?_peak_le (rows : List Row) :
    (lastRowM? rows).peak <= rows.length + 1 := by
  induction rows with
  | nil => exact Nat.le_refl _
  | cons row rows ih =>
      cases rows with
      | nil => exact Nat.le_succ 1
      | cons next rest =>
          simp only [lastRowM?, List.length_cons]
          exact Nat.add_le_add_right ih 1

theorem labelOfRowM_ticks_le (machine : Machine) (row : Row) :
    (labelOfRowM machine row).ticks <=
      2 * machine.states.length + 8 * row.tape.length + 28 := by
  unfold labelOfRowM
  have h0 := stepM?_ticks_le machine row false
  have h1 := stepM?_ticks_le machine row true
  have hsum := Nat.add_le_add h0 h1
  have hplus := Nat.add_le_add_right hsum 4
  exact Nat.le_trans hplus (by
    simp [Nat.mul_succ, Nat.succ_mul, Nat.add_assoc,
      Nat.add_comm, Nat.add_left_comm])

theorem labelOfRowM_peak_le (machine : Machine) (row : Row) :
    (labelOfRowM machine row).peak <=
      machine.states.length + row.tape.length + 2 := by
  unfold labelOfRowM
  exact (Nat.max_le).2 ⟨stepM?_peak_le machine row false,
    stepM?_peak_le machine row true⟩

def localLabelTimeBound (source : Instance)
    (history payload : BitWord) : Nat :=
  localVerifierTimeBound source history payload +
    16 * (payload.length + 1) ^ 2 +
    (payload.length + 1) +
    (2 * source.machine.states.length + 8 * payload.length + 28) + 4

def localLabelPeakBound (source : Instance)
    (history payload : BitWord) : Nat :=
  localVerifierSpaceBound source history payload +
    16 * (payload.length + 1) ^ 2 +
    (payload.length + 1) +
    (source.machine.states.length + payload.length + 2)

theorem decodedRows_length_le_payload {payload : BitWord} {rows : List Row}
    (hdecode : decodeTableau? payload = some rows) :
    rows.length <= payload.length := by
  have hrows := rows_length_le_encodeTableau_length rows
  have hreconstruct := decodeTableau?_reconstruct hdecode
  rw [hreconstruct]
  exact hrows

theorem decodedFinalTape_length_le_payload {payload : BitWord}
    {rows : List Row} {row : Row}
    (hdecode : decodeTableau? payload = some rows)
    (hlast : lastRow? rows = some row) :
    row.tape.length <= payload.length := by
  have hrow := rowOutputCells_le_payload hdecode hlast
  exact Nat.le_trans (by
    unfold rowOutputCells
    exact Nat.le_trans
      (Nat.le_add_left row.tape.length (row.state + row.head))
      (Nat.le_add_right _ 3)) hrow

theorem whole_first_le_sum4 (a b c d : Nat) : a <= a + b + c + d :=
  Nat.le_trans (Nat.le_add_right a b)
    (Nat.le_trans (Nat.le_add_right (a + b) c)
      (Nat.le_add_right (a + b + c) d))

theorem whole_second_le_sum4 (a b c d : Nat) : b <= a + b + c + d :=
  Nat.le_trans (Nat.le_add_left b a)
    (Nat.le_trans (Nat.le_add_right (a + b) c)
      (Nat.le_add_right (a + b + c) d))

theorem whole_third_le_sum4 (a b c d : Nat) : c <= a + b + c + d :=
  Nat.le_trans (Nat.le_add_left c (a + b))
    (Nat.le_add_right (a + b + c) d)

theorem whole_fourth_le_sum4 (a b c d : Nat) : d <= a + b + c + d :=
  Nat.le_add_left d (a + b + c)

theorem whole_add4_then_one {a b c d A B C D : Nat}
    (ha : a <= A) (hb : b <= B) (hc : c <= C) (hd : d <= D) :
    a + b + c + d + 1 <= A + B + C + D + 4 := by
  have hsum := add_le_add4 ha hb hc hd
  exact Nat.le_trans (Nat.add_le_add_right hsum 1)
    (Nat.add_le_add_left (by decide : 1 <= 4) (A + B + C + D))

theorem runLocalLabelVerifier_ticks_le (source : Instance)
    (history payload : BitWord) :
    (runLocalLabelVerifier source history payload).ticks <=
      localLabelTimeBound source history payload := by
  unfold runLocalLabelVerifier
  have hver := runLocalVerifier_ticks_le source history payload
  cases hverified : (runLocalVerifier source history payload).value with
  | false =>
      simp only [hverified, Bool.false_eq_true, ↓reduceIte]
      unfold localLabelTimeBound
      simpa using whole_add4_then_one hver
        (Nat.zero_le _) (Nat.zero_le _) (Nat.zero_le _)
  | true =>
      simp only [hverified, ↓reduceIte]
      cases hparsed : (decodeTableauM? payload).value with
      | none =>
          simp only [hparsed]
          have hp := decodeTableauM?_ticks_le_quadratic payload
          unfold localLabelTimeBound
          simpa using whole_add4_then_one hver hp
            (Nat.zero_le _) (Nat.zero_le _)
      | some rows =>
          simp only [hparsed]
          have hdecode : decodeTableau? payload = some rows := by
            rw [← decodeTableauM?_value]
            exact hparsed
          have hp := decodeTableauM?_ticks_le_quadratic payload
          cases hfinal : (lastRowM? rows).value with
          | none =>
              simp only [hfinal]
              have hf := lastRowM?_ticks_le rows
              have hrows := decodedRows_length_le_payload hdecode
              have hf' : (lastRowM? rows).ticks <= payload.length + 1 :=
                Nat.le_trans hf (Nat.add_le_add_right hrows 1)
              unfold localLabelTimeBound
              simpa using whole_add4_then_one hver hp hf' (Nat.zero_le _)
          | some row =>
              simp only [hfinal]
              have hlast : lastRow? rows = some row := by
                rw [← lastRowM?_value]
                exact hfinal
              have hf := lastRowM?_ticks_le rows
              have hrows := decodedRows_length_le_payload hdecode
              have hf' : (lastRowM? rows).ticks <= payload.length + 1 :=
                Nat.le_trans hf (Nat.add_le_add_right hrows 1)
              have htape := decodedFinalTape_length_le_payload hdecode hlast
              have hl := labelOfRowM_ticks_le source.machine row
              have hl' : (labelOfRowM source.machine row).ticks <=
                  2 * source.machine.states.length +
                    8 * payload.length + 28 :=
                Nat.le_trans hl (Nat.add_le_add_right
                  (Nat.add_le_add_left (Nat.mul_le_mul_left 8 htape)
                    (2 * source.machine.states.length)) 28)
              unfold localLabelTimeBound
              exact whole_add4_then_one hver hp hf' hl'

theorem runLocalLabelVerifier_peak_le (source : Instance)
    (history payload : BitWord) :
    (runLocalLabelVerifier source history payload).peak <=
      localLabelPeakBound source history payload := by
  unfold runLocalLabelVerifier
  have hver := runLocalVerifier_peak_le source history payload
  cases hverified : (runLocalVerifier source history payload).value with
  | false =>
      simp only [hverified, Bool.false_eq_true, ↓reduceIte]
      unfold localLabelPeakBound
      exact Nat.le_trans hver (whole_first_le_sum4 _ _ _ _)
  | true =>
      simp only [hverified, ↓reduceIte]
      cases hparsed : (decodeTableauM? payload).value with
      | none =>
          simp only [hparsed]
          refine (Nat.max_le).2 ⟨?_, ?_⟩
          · unfold localLabelPeakBound
            exact Nat.le_trans hver (whole_first_le_sum4 _ _ _ _)
          · unfold localLabelPeakBound
            exact Nat.le_trans (decodeTableauM?_peak_le_quadratic payload)
              (whole_second_le_sum4 _ _ _ _)
      | some rows =>
          simp only [hparsed]
          have hdecode : decodeTableau? payload = some rows := by
            rw [← decodeTableauM?_value]
            exact hparsed
          cases hfinal : (lastRowM? rows).value with
          | none =>
              simp only [hfinal]
              refine (Nat.max_le).2 ⟨?_, ?_⟩
              · unfold localLabelPeakBound
                exact Nat.le_trans hver (whole_first_le_sum4 _ _ _ _)
              · refine (Nat.max_le).2 ⟨?_, ?_⟩
                · unfold localLabelPeakBound
                  exact Nat.le_trans
                    (decodeTableauM?_peak_le_quadratic payload)
                    (whole_second_le_sum4 _ _ _ _)
                · have hf := lastRowM?_peak_le rows
                  have hrows := decodedRows_length_le_payload hdecode
                  have hf' : (lastRowM? rows).peak <= payload.length + 1 :=
                    Nat.le_trans hf (Nat.add_le_add_right hrows 1)
                  unfold localLabelPeakBound
                  exact Nat.le_trans hf' (whole_third_le_sum4 _ _ _ _)
          | some row =>
              simp only [hfinal]
              have hlast : lastRow? rows = some row := by
                rw [← lastRowM?_value]
                exact hfinal
              have hrows := decodedRows_length_le_payload hdecode
              have htape := decodedFinalTape_length_le_payload hdecode hlast
              have hf' : (lastRowM? rows).peak <= payload.length + 1 :=
                Nat.le_trans (lastRowM?_peak_le rows)
                  (Nat.add_le_add_right hrows 1)
              have hl' : (labelOfRowM source.machine row).peak <=
                  source.machine.states.length + payload.length + 2 :=
                Nat.le_trans
                  (labelOfRowM_peak_le source.machine row)
                  (Nat.add_le_add_right
                    (Nat.add_le_add_left htape source.machine.states.length) 2)
              refine (Nat.max_le).2 ⟨?_, ?_⟩
              · unfold localLabelPeakBound
                exact Nat.le_trans hver (whole_first_le_sum4 _ _ _ _)
              · refine (Nat.max_le).2 ⟨?_, ?_⟩
                · unfold localLabelPeakBound
                  exact Nat.le_trans
                    (decodeTableauM?_peak_le_quadratic payload)
                    (whole_second_le_sum4 _ _ _ _)
                · refine (Nat.max_le).2 ⟨?_, ?_⟩
                  · unfold localLabelPeakBound
                    exact Nat.le_trans hf' (whole_third_le_sum4 _ _ _ _)
                  · unfold localLabelPeakBound
                    exact Nat.le_trans hl' (whole_fourth_le_sum4 _ _ _ _)

theorem final_decodeInstanceM?_eq_some_encode
    {payload : BitWord} {source : Instance}
    (hdecode : (decodeInstanceM? payload).value = some source) :
    payload = encodeInstance source := by
  rw [decodeInstanceM?_value] at hdecode
  unfold decodeInstance? at hdecode
  cases hparsed : decodeInstancePrefix? payload with
  | none => simp [hparsed] at hdecode
  | some pair =>
      rcases pair with ⟨parsedSource, tail⟩
      cases tail with
      | cons bit tail => simp [hparsed] at hdecode
      | nil =>
          rw [hparsed] at hdecode
          change (if payload = encodeInstance parsedSource then
            some parsedSource else none) = some source at hdecode
          by_cases hequal : payload = encodeInstance parsedSource
          · rw [if_pos hequal] at hdecode
            have hsource := Option.some.inj hdecode
            subst source
            exact hequal
          · rw [if_neg hequal] at hdecode
            contradiction

theorem final_states_length_le_encodeInstance (source : Instance) :
    source.machine.states.length ≤ (encodeInstance source).length := by
  unfold encodeInstance encodeMachine
  rw [List.length_append, List.length_append, List.length_append,
    encodeNat_length]
  calc
    source.machine.states.length ≤ source.machine.states.length + 1 :=
      Nat.le_succ _
    _ ≤ source.machine.states.length + 1 +
        (encodeStateData source.machine.states).length := Nat.le_add_right _ _
    _ ≤ source.machine.states.length + 1 +
        (encodeStateData source.machine.states).length +
          (encodeNat source.initialState).length := Nat.le_add_right _ _
    _ ≤ source.machine.states.length + 1 +
        (encodeStateData source.machine.states).length +
          (encodeNat source.initialState).length +
            (encodeBits source.input).length := Nat.le_add_right _ _

theorem final_initialState_le_encodeInstance (source : Instance) :
    source.initialState ≤ (encodeInstance source).length := by
  unfold encodeInstance
  rw [List.length_append, List.length_append, encodeNat_length]
  exact Nat.le_trans (Nat.le_succ source.initialState)
    (Nat.le_trans
      (Nat.le_add_left _ (encodeMachine source.machine).length)
      (Nat.le_add_right _ (encodeBits source.input).length))

theorem final_input_length_le_encodeInstance (source : Instance) :
    source.input.length ≤ (encodeInstance source).length := by
  unfold encodeInstance
  rw [List.length_append, List.length_append, encodeBits_length]
  have hbits : source.input.length ≤ 2 * source.input.length + 1 := by
    calc
      source.input.length ≤ source.input.length + source.input.length :=
        Nat.le_add_right _ _
      _ ≤ (source.input.length + source.input.length) + 1 := Nat.le_succ _
      _ = 2 * source.input.length + 1 := by rw [Nat.two_mul]
  exact Nat.le_trans hbits (Nat.le_add_left _ _)

theorem final_decoded_states_le {payload : BitWord} {source : Instance}
    (hdecode : (decodeInstanceM? payload).value = some source) :
    source.machine.states.length ≤ payload.length := by
  rw [final_decodeInstanceM?_eq_some_encode hdecode]
  exact final_states_length_le_encodeInstance source

theorem final_decoded_initial_le {payload : BitWord} {source : Instance}
    (hdecode : (decodeInstanceM? payload).value = some source) :
    source.initialState ≤ payload.length := by
  rw [final_decodeInstanceM?_eq_some_encode hdecode]
  exact final_initialState_le_encodeInstance source

theorem final_decoded_input_le {payload : BitWord} {source : Instance}
    (hdecode : (decodeInstanceM? payload).value = some source) :
    source.input.length ≤ payload.length := by
  rw [final_decodeInstanceM?_eq_some_encode hdecode]
  exact final_input_length_le_encodeInstance source

theorem final_initialRow_mass_le_serialized {payload : BitWord}
    {source : Instance}
    (hdecode : (decodeInstanceM? payload).value = some source) :
    rowMass (initialRow source) ≤ 2 * payload.length + 6 := by
  have hform : rowMass (initialRow source) =
      source.initialState + source.input.length + 6 := by
    simp [rowMass, initialRow, Nat.add_assoc, Nat.add_comm,
      Nat.add_left_comm]
  rw [hform]
  have hsum := Nat.add_le_add (final_decoded_initial_le hdecode)
    (final_decoded_input_le hdecode)
  have hsum' := Nat.add_le_add_right hsum 6
  simpa [Nat.two_mul] using hsum'

theorem final_decodeNM?_ticks_le (term : Term) :
    (decodeNM? term).ticks ≤ 6 * (term.size + 1) := by
  have small : ∀ fn arg : Term, 3 ≤ 6 * ((Term.app fn arg).size + 1) := by
    intro fn arg
    have hone : 1 ≤ (Term.app fn arg).size + 1 :=
      Nat.succ_le_succ (Nat.zero_le _)
    have hsix : 6 ≤ 6 * ((Term.app fn arg).size + 1) := by
      simpa using Nat.mul_le_mul_left 6 hone
    exact Nat.le_trans (by decide : 3 ≤ 6) hsix
  have lift : ∀ (fn arg : Term) (amount cost : Nat),
      amount ≤ 6 * (arg.size + 1) → cost ≤ 6 →
      amount + cost ≤ 6 * ((Term.app fn arg).size + 1) := by
    intro fn arg amount cost hamount hcost
    have hsum := Nat.add_le_add hamount hcost
    have hsub : arg.size + 2 ≤ (Term.app fn arg).size + 1 :=
      Nat.succ_le_succ
        (Nat.succ_le_of_lt (term_size_app_right_lt fn arg))
    have hscaled := Nat.mul_le_mul_left 6 hsub
    exact Nat.le_trans hsum (by
      rw [Nat.mul_add]
      exact hscaled)
  induction term with
  | s => decide
  | app fn arg ihFn ihArg =>
      cases fn with
      | s =>
          simp only [decodeNM?]
          exact small _ _
      | app head value =>
          cases head with
          | app deeper supplied =>
              simp only [decodeNM?]
              exact small _ _
          | s =>
              cases value with
              | s =>
                  simp only [decodeNM?]
                  exact lift _ _ _ 3 ihArg (by decide)
              | app valueFn valueArg =>
                  cases valueFn with
                  | app deeper supplied =>
                      simp only [decodeNM?]
                      exact small _ _
                  | s =>
                      cases valueArg with
                      | s =>
                          simp only [decodeNM?]
                          exact lift _ _ _ 5 ihArg (by decide)
                      | app left right =>
                          simp only [decodeNM?]
                          exact small _ _

theorem final_decodeNM?_peak_le (term : Term) :
    (decodeNM? term).peak ≤ term.size + 1 := by
  have small : ∀ fn arg : Term, 2 ≤ (Term.app fn arg).size + 1 := by
    intro fn arg
    exact Nat.succ_le_succ (Term.size_pos _)
  have lift : ∀ fn arg : Term,
      (decodeNM? arg).peak ≤ arg.size + 1 →
      (decodeNM? arg).peak + 1 ≤ (Term.app fn arg).size + 1 := by
    intro fn arg harg
    exact Nat.le_trans (Nat.add_le_add_right harg 1)
      (Nat.succ_le_succ
        (Nat.succ_le_of_lt (term_size_app_right_lt fn arg)))
  induction term with
  | s => decide
  | app fn arg ihFn ihArg =>
      cases fn with
      | s =>
          simp only [decodeNM?]
          exact small _ _
      | app head value =>
          cases head with
          | app deeper supplied =>
              simp only [decodeNM?]
              exact small _ _
          | s =>
              cases value with
              | s =>
                  simp only [decodeNM?]
                  exact lift _ _ ihArg
              | app valueFn valueArg =>
                  cases valueFn with
                  | app deeper supplied =>
                      simp only [decodeNM?]
                      exact small _ _
                  | s =>
                      cases valueArg with
                      | s =>
                          simp only [decodeNM?]
                          exact lift _ _ ihArg
                      | app left right =>
                          simp only [decodeNM?]
                          exact small _ _

theorem final_decodeNM?_value_length_le_size {term : Term} {bits : BitWord}
    (hdecode : (decodeNM? term).value = some bits) :
    bits.length ≤ term.size := by
  rw [decodeNM?_value] at hdecode
  induction term generalizing bits with
  | s =>
      simp [decodeN?] at hdecode
      subst bits
      exact Nat.zero_le _
  | app fn arg ihFn ihArg =>
      cases fn with
      | s => simp [decodeN?] at hdecode
      | app head value =>
          cases head with
          | app deeper supplied => simp [decodeN?] at hdecode
          | s =>
              cases value with
              | s =>
                  simp only [decodeN?] at hdecode
                  cases htail : decodeN? arg with
                  | none => simp [htail] at hdecode
                  | some tail =>
                      simp [htail] at hdecode
                      subst bits
                      have hlen := ihArg htail
                      simp only [List.length_cons, Term.size]
                      exact Nat.le_trans (Nat.add_le_add_right hlen 1)
                        (Nat.le_add_left _ _)
              | app valueFn valueArg =>
                  cases valueFn with
                  | app deeper supplied => simp [decodeN?] at hdecode
                  | s =>
                      cases valueArg with
                      | s =>
                          simp only [decodeN?] at hdecode
                          cases htail : decodeN? arg with
                          | none => simp [htail] at hdecode
                          | some tail =>
                              simp [htail] at hdecode
                              subst bits
                              have hlen := ihArg htail
                              simp only [List.length_cons, Term.size]
                              exact Nat.le_trans (Nat.add_le_add_right hlen 1)
                                (Nat.le_add_left _ _)
                      | app left right => simp [decodeN?] at hdecode

theorem final_one_le_square (bound : Nat) :
    1 ≤ (bound + 1) ^ 2 := by
  have hlinear : 1 ≤ bound + 1 := Nat.succ_le_succ (Nat.zero_le bound)
  exact Nat.le_trans hlinear (by
    simpa [Nat.pow_two] using whole_linear_le_square bound)

theorem final_bound_le_square (bound : Nat) :
    bound ≤ (bound + 1) ^ 2 :=
  Nat.le_trans (Nat.le_succ bound)
    (by simpa [Nat.pow_two] using whole_linear_le_square bound)

theorem final_constant_le_scaled_square (coefficient bound : Nat) :
    coefficient ≤ coefficient * (bound + 1) ^ 2 := by
  simpa using Nat.mul_le_mul_left coefficient (final_one_le_square bound)

theorem final_add_le_add5 {a b c d e A B C D E : Nat}
    (ha : a ≤ A) (hb : b ≤ B) (hc : c ≤ C) (hd : d ≤ D)
    (he : e ≤ E) :
    a + b + c + d + e ≤ A + B + C + D + E :=
  Nat.add_le_add (add_le_add4 ha hb hc hd) he

theorem final_sum_scaled3 (a b c q : Nat) :
    a * q + b * q + c * q = (a + b + c) * q := by
  rw [Nat.add_mul, Nat.add_mul]

theorem final_sum_scaled2 (a b q : Nat) :
    a * q + b * q = (a + b) * q := by
  rw [Nat.add_mul]

theorem final_sum_scaled4 (a b c d q : Nat) :
    a * q + b * q + c * q + d * q = (a + b + c + d) * q := by
  rw [Nat.add_mul, Nat.add_mul, Nat.add_mul]

theorem final_sum_scaled5 (a b c d e q : Nat) :
    a * q + b * q + c * q + d * q + e * q =
      (a + b + c + d + e) * q := by
  rw [Nat.add_mul, Nat.add_mul, Nat.add_mul, Nat.add_mul]

theorem final_trace_bound_le_square
    (source : Instance) (history payload : BitWord) (bound : Nat)
    (hstates : source.machine.states.length ≤ bound)
    (hinput : source.input.length ≤ bound)
    (hhistory : history.length ≤ bound)
    (hpayload : payload.length ≤ bound) :
    localTraceBound source history payload ≤ 22 * (bound + 1) ^ 2 := by
  let Q := (bound + 1) ^ 2
  have hone : 1 ≤ Q := final_one_le_square bound
  have hfirstFactor : history.length + 1 ≤ bound + 1 :=
    Nat.add_le_add_right hhistory 1
  have hstateScale : source.machine.states.length + 13 ≤
      13 * (bound + 1) := by
    have hstateMul : source.machine.states.length ≤ 13 * bound :=
      Nat.le_trans hstates
        (Nat.le_mul_of_pos_left bound (by decide : 0 < 13))
    have hsum := Nat.add_le_add_right hstateMul 13
    simpa [Nat.mul_add] using hsum
  have hfirst :
      (history.length + 1) * (source.machine.states.length + 13) ≤
        13 * Q := by
    have hmul := Nat.mul_le_mul hfirstFactor hstateScale
    simpa [Q, Nat.pow_two, Nat.mul_assoc, Nat.mul_comm,
      Nat.mul_left_comm] using hmul
  have hinside : source.input.length + 2 + payload.length ≤
      2 * (bound + 1) := by
    have hsum := Nat.add_le_add hinput hpayload
    have hpad := Nat.add_le_add_right hsum 2
    simpa [Nat.two_mul, Nat.add_assoc, Nat.add_comm,
      Nat.add_left_comm] using hpad
  have hsecond : 4 * (source.input.length + 2 + payload.length) ≤
      8 * Q := by
    have hmul := Nat.mul_le_mul_left 4 hinside
    have hlinear : bound + 1 ≤ Q := by
      simpa [Q, Nat.pow_two] using whole_linear_le_square bound
    have hscaled := Nat.mul_le_mul_left 8 hlinear
    have hmul' : 4 * (source.input.length + 2 + payload.length) ≤
        8 * (bound + 1) := by
      exact Nat.le_trans hmul (by
        rw [← Nat.mul_assoc]
        exact Nat.le_refl _)
    exact Nat.le_trans hmul' hscaled
  have hthird : payload.length ≤ Q :=
    Nat.le_trans hpayload (final_bound_le_square bound)
  unfold localTraceBound
  have hsum := Nat.add_le_add (Nat.add_le_add hfirst hsecond) hthird
  change _ ≤ 22 * Q
  exact Nat.le_trans hsum (Nat.le_of_eq (by
    simpa only [Nat.one_mul] using final_sum_scaled3 13 8 1 Q))

theorem final_localVerifierTimeBound_le_square
    (source : Instance) (history payload : BitWord) (bound : Nat)
    (hstates : source.machine.states.length ≤ bound)
    (hinput : source.input.length ≤ bound)
    (hinitial : source.initialState ≤ bound)
    (hhistory : history.length ≤ bound)
    (hpayload : payload.length ≤ bound) :
    localVerifierTimeBound source history payload ≤
      117 * (bound + 1) ^ 2 := by
  let Q := (bound + 1) ^ 2
  have hone : 1 ≤ Q := final_one_le_square bound
  have hlinear : bound + 1 ≤ Q := by
    simpa [Q, Nat.pow_two] using whole_linear_le_square bound
  have hp1 : payload.length + 1 ≤ Q :=
    Nat.le_trans (Nat.add_le_add_right hpayload 1) hlinear
  have hp2 : (payload.length + 1) ^ 2 ≤ Q :=
    whole_pow_two_mono (Nat.add_le_add_right hpayload 1)
  have hquad := Nat.mul_le_mul_left 16 hp2
  have hsixtyfour := Nat.mul_le_mul_left 64 hp1
  have hinputQ : source.input.length ≤ Q :=
    Nat.le_trans hinput (final_bound_le_square bound)
  have hthree : 3 ≤ 3 * Q := by
    simpa using Nat.mul_le_mul_left 3 hone
  have hrowRaw : rowMass (initialRow source) ≤ 2 * bound + 6 := by
    have hform : rowMass (initialRow source) =
        source.initialState + source.input.length + 6 := by
      simp [rowMass, initialRow, Nat.add_assoc, Nat.add_comm,
        Nat.add_left_comm]
    rw [hform]
    have hsum := Nat.add_le_add_right (Nat.add_le_add hinitial hinput) 6
    simpa [Nat.two_mul] using hsum
  have hrow : rowMass (initialRow source) ≤ 8 * Q := by
    have htwo : 2 * bound ≤ 2 * Q :=
      Nat.mul_le_mul_left 2 (final_bound_le_square bound)
    have hsix : 6 ≤ 6 * Q := by
      simpa using Nat.mul_le_mul_left 6 hone
    exact Nat.le_trans hrowRaw (by
      have hsum := Nat.add_le_add htwo hsix
      simpa only [← Nat.add_mul] using hsum)
  have htrace := final_trace_bound_le_square source history payload bound
    hstates hinput hhistory hpayload
  change localTraceBound source history payload ≤ 22 * Q at htrace
  have hblock := final_add_le_add5 hinputQ hthree hrow htrace hone
  have hfront := Nat.add_le_add
    (Nat.add_le_add hquad hsixtyfour) hp1
  have hsum := Nat.add_le_add hfront hblock
  have hfinal := Nat.add_le_add_right hsum 1
  unfold localVerifierTimeBound
  exact Nat.le_trans hfinal (by
    have hlast : 1 ≤ Q := hone
    have hpad := Nat.add_le_add_left hlast
      (16 * Q + 64 * Q + Q + (Q + 3 * Q + 8 * Q + 22 * Q + Q))
    have hblockEq : Q + 3 * Q + 8 * Q + 22 * Q + Q = 35 * Q := by
      simpa only [Nat.one_mul] using final_sum_scaled5 1 3 8 22 1 Q
    rw [hblockEq] at hpad
    rw [hblockEq]
    exact Nat.le_trans hpad (Nat.le_of_eq (by
      simpa only [Nat.one_mul] using final_sum_scaled5 16 64 1 35 1 Q)))

theorem final_localLabelTimeBound_le_square
    (source : Instance) (history payload : BitWord) (bound : Nat)
    (hstates : source.machine.states.length ≤ bound)
    (hinput : source.input.length ≤ bound)
    (hinitial : source.initialState ≤ bound)
    (hhistory : history.length ≤ bound)
    (hpayload : payload.length ≤ bound) :
    localLabelTimeBound source history payload ≤
      256 * (bound + 1) ^ 2 := by
  let Q := (bound + 1) ^ 2
  have hone : 1 ≤ Q := final_one_le_square bound
  have hbase := final_localVerifierTimeBound_le_square
    source history payload bound hstates hinput hinitial hhistory hpayload
  change localVerifierTimeBound source history payload ≤ 117 * Q at hbase
  have hp1 : payload.length + 1 ≤ Q :=
    Nat.le_trans (Nat.add_le_add_right hpayload 1) (by
      simpa [Q, Nat.pow_two] using whole_linear_le_square bound)
  have hp2 : (payload.length + 1) ^ 2 ≤ Q :=
    whole_pow_two_mono (Nat.add_le_add_right hpayload 1)
  have hquad := Nat.mul_le_mul_left 16 hp2
  have hstates2 : 2 * source.machine.states.length ≤ 2 * Q :=
    Nat.mul_le_mul_left 2
      (Nat.le_trans hstates (final_bound_le_square bound))
  have hpayload8 : 8 * payload.length ≤ 8 * Q :=
    Nat.mul_le_mul_left 8
      (Nat.le_trans hpayload (final_bound_le_square bound))
  have h28 : 28 ≤ 28 * Q := by
    simpa using Nat.mul_le_mul_left 28 hone
  have hlabel := add_le_add3 hstates2 hpayload8 h28
  have hfour : 4 ≤ 4 * Q := by
    simpa using Nat.mul_le_mul_left 4 hone
  unfold localLabelTimeBound
  have hsum := final_add_le_add5 hbase hquad hp1 hlabel hfour
  exact Nat.le_trans hsum (by
    have hcoeff : 176 * Q ≤ 256 * Q :=
      Nat.mul_le_mul_right Q (by decide : 176 ≤ 256)
    have hlabelEq : 2 * Q + 8 * Q + 28 * Q = 38 * Q := by
      exact final_sum_scaled3 2 8 28 Q
    rw [hlabelEq]
    exact Nat.le_trans (Nat.le_of_eq (by
      simpa only [Nat.one_mul] using final_sum_scaled5 117 16 1 38 4 Q))
      hcoeff)

theorem final_localLabelPeakBound_le_square
    (source : Instance) (history payload : BitWord) (bound : Nat)
    (hstates : source.machine.states.length ≤ bound)
    (hinput : source.input.length ≤ bound)
    (hinitial : source.initialState ≤ bound)
    (hhistory : history.length ≤ bound)
    (hpayload : payload.length ≤ bound) :
    localLabelPeakBound source history payload ≤
      256 * (bound + 1) ^ 2 := by
  let Q := (bound + 1) ^ 2
  have hone : 1 ≤ Q := final_one_le_square bound
  have hbase := final_localVerifierTimeBound_le_square
    source history payload bound hstates hinput hinitial hhistory hpayload
  change localVerifierTimeBound source history payload ≤ 117 * Q at hbase
  have hp1 : payload.length + 1 ≤ Q :=
    Nat.le_trans (Nat.add_le_add_right hpayload 1) (by
      simpa [Q, Nat.pow_two] using whole_linear_le_square bound)
  have hp2 : (payload.length + 1) ^ 2 ≤ Q :=
    whole_pow_two_mono (Nat.add_le_add_right hpayload 1)
  have hquad := Nat.mul_le_mul_left 16 hp2
  have hlast : source.machine.states.length + payload.length + 2 ≤
      4 * Q := by
    have hs := Nat.le_trans hstates (final_bound_le_square bound)
    have hp := Nat.le_trans hpayload (final_bound_le_square bound)
    have htwo : 2 ≤ 2 * Q := by
      simpa using Nat.mul_le_mul_left 2 hone
    have hsum := add_le_add3 hs hp htwo
    exact Nat.le_trans hsum (Nat.le_of_eq (by
      simpa only [Nat.one_mul] using final_sum_scaled3 1 1 2 Q))
  unfold localLabelPeakBound localVerifierSpaceBound
  have hsum := add_le_add4 hbase hquad hp1 hlast
  exact Nat.le_trans hsum (by
    have hcoeff : 138 * Q ≤ 256 * Q :=
      Nat.mul_le_mul_right Q (by decide : 138 ≤ 256)
    exact Nat.le_trans (Nat.le_of_eq (by
      simpa only [Nat.one_mul] using final_sum_scaled4 117 16 1 4 Q)) hcoeff)

theorem final_parsed_candidate_lengths {path history payload : BitWord}
    (hparse : (parseCandidateM? path).value = some (history, payload)) :
    history.length ≤ path.length ∧ payload.length ≤ path.length := by
  have hsemantic : parseCandidate? path = some (history, payload) := by
    rw [← parseCandidateM?_value]
    exact hparse
  have heq := parseCandidate?_sound hsemantic
  have hsum : history.length + payload.length ≤ path.length := by
    rw [heq]
    exact history_payload_length_le_candidateCode history payload
  exact ⟨Nat.le_trans (Nat.le_add_right _ _) hsum,
    Nat.le_trans (Nat.le_add_left _ _) hsum⟩

theorem final_candidate_and_label_tick_unit
    (path : BitWord) (source : Instance) (history payload : BitWord)
    (bound : Nat)
    (hpath : path.length ≤ bound)
    (hstates : source.machine.states.length ≤ bound)
    (hinput : source.input.length ≤ bound)
    (hinitial : source.initialState ≤ bound)
    (hparse : (parseCandidateM? path).value = some (history, payload)) :
    (parseCandidateM? path).ticks +
        (runLocalLabelVerifier source history payload).ticks + 1 ≤
      266 * (bound + 1) ^ 2 := by
  let Q := (bound + 1) ^ 2
  have hlens := final_parsed_candidate_lengths hparse
  have hhistory := Nat.le_trans hlens.1 hpath
  have hpayload := Nat.le_trans hlens.2 hpath
  have hparseRaw := parseCandidateM?_ticks_le path
  have hpathPow := whole_pow_two_mono (Nat.add_le_add_right hpath 1)
  have hparseBound : (parseCandidateM? path).ticks ≤ 8 * Q :=
    Nat.le_trans hparseRaw (Nat.mul_le_mul_left 8 hpathPow)
  have hcheckedRaw := runLocalLabelVerifier_ticks_le source history payload
  have hcheckedPoly := final_localLabelTimeBound_le_square
    source history payload bound hstates hinput hinitial hhistory hpayload
  have hcheckedBound : (runLocalLabelVerifier source history payload).ticks ≤
      256 * Q := Nat.le_trans hcheckedRaw hcheckedPoly
  have hone : 1 ≤ 2 * Q :=
    Nat.le_trans (final_one_le_square bound) (by
      simpa using Nat.mul_le_mul_right Q (by decide : 1 ≤ 2))
  have hsum := Nat.add_le_add (Nat.add_le_add hparseBound hcheckedBound) hone
  exact Nat.le_trans hsum (Nat.le_of_eq (by
    simpa only [Nat.one_mul] using final_sum_scaled3 8 256 2 Q))

theorem final_candidate_tick_unit (path : BitWord) (bound : Nat)
    (hpath : path.length ≤ bound) :
    (parseCandidateM? path).ticks + 1 ≤ 266 * (bound + 1) ^ 2 := by
  let Q := (bound + 1) ^ 2
  have hpathPow := whole_pow_two_mono (Nat.add_le_add_right hpath 1)
  have hparseBound : (parseCandidateM? path).ticks ≤ 8 * Q :=
    Nat.le_trans (parseCandidateM?_ticks_le path)
      (Nat.mul_le_mul_left 8 hpathPow)
  have hone : 1 ≤ 258 * Q :=
    Nat.le_trans (final_one_le_square bound) (by
      simpa using Nat.mul_le_mul_right Q (by decide : 1 ≤ 258))
  have hsum := Nat.add_le_add hparseBound hone
  exact Nat.le_trans hsum (Nat.le_of_eq (by
    simpa only [Nat.one_mul] using final_sum_scaled2 8 258 Q))

theorem final_collector_scaled_succ (unit count : Nat) :
    unit + unit * (count + 1) = unit * (count + 2) := by
  calc
    unit + unit * (count + 1) = unit + (unit * count + unit) := by
      rw [Nat.mul_succ]
    _ = (unit * count + unit) + unit := by
      simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
    _ = unit * ((count + 1) + 1) := (Nat.mul_succ unit (count + 1)).symm
    _ = unit * (count + 2) := rfl

theorem final_collectLabelsM_ticks_le (source : Instance)
    (paths : List BitWord) (bound : Nat)
    (hstates : source.machine.states.length ≤ bound)
    (hinput : source.input.length ≤ bound)
    (hinitial : source.initialState ≤ bound)
    (hpaths : ∀ path, List.Mem path paths → path.length ≤ bound) :
    (collectLabelsM source paths).ticks ≤
      266 * (bound + 1) ^ 2 * (paths.length + 1) := by
  induction paths with
  | nil =>
      simp only [collectLabelsM, List.length_nil, Nat.zero_add]
      have hone : 1 ≤ 266 * (bound + 1) ^ 2 :=
        Nat.le_trans (final_one_le_square bound) (by
          simpa using Nat.mul_le_mul_right ((bound + 1) ^ 2)
            (by decide : 1 ≤ 266))
      simpa using hone
  | cons path paths ih =>
      have hpath := hpaths path (List.Mem.head paths)
      have htail : ∀ query, List.Mem query paths → query.length ≤ bound :=
        fun query hmem => hpaths query (List.Mem.tail path hmem)
      have hrec := ih htail
      unfold collectLabelsM
      cases hparse : (parseCandidateM? path).value with
      | none =>
          simp only [hparse]
          have hunit := final_candidate_tick_unit path bound hpath
          have hsum := Nat.add_le_add hunit hrec
          calc
            (parseCandidateM? path).ticks +
                (collectLabelsM source paths).ticks + 1 =
              ((parseCandidateM? path).ticks + 1) +
                (collectLabelsM source paths).ticks := by
                  simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
            _ ≤ 266 * (bound + 1) ^ 2 +
                266 * (bound + 1) ^ 2 * (paths.length + 1) := hsum
            _ = 266 * (bound + 1) ^ 2 *
                ((path :: paths).length + 1) := by
                  simp only [List.length_cons]
                  exact final_collector_scaled_succ _ paths.length
      | some pair =>
          rcases pair with ⟨history, payload⟩
          cases hchecked :
              (runLocalLabelVerifier source history payload).value with
          | none =>
              simp only [hparse, hchecked]
              have hunit := final_candidate_and_label_tick_unit
                path source history payload bound hpath hstates hinput hinitial hparse
              have hsum := Nat.add_le_add hunit hrec
              calc
                (parseCandidateM? path).ticks +
                    (runLocalLabelVerifier source history payload).ticks +
                      (collectLabelsM source paths).ticks + 1 =
                  ((parseCandidateM? path).ticks +
                    (runLocalLabelVerifier source history payload).ticks + 1) +
                      (collectLabelsM source paths).ticks := by
                    simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
                _ ≤ 266 * (bound + 1) ^ 2 +
                    266 * (bound + 1) ^ 2 * (paths.length + 1) := hsum
                _ = 266 * (bound + 1) ^ 2 *
                    ((path :: paths).length + 1) := by
                  simp only [List.length_cons]
                  exact final_collector_scaled_succ _ paths.length
          | some label =>
              simp only [hparse, hchecked]
              have hunit := final_candidate_and_label_tick_unit
                path source history payload bound hpath hstates hinput hinitial hparse
              have hsum := Nat.add_le_add hunit hrec
              calc
                (parseCandidateM? path).ticks +
                    (runLocalLabelVerifier source history payload).ticks +
                      (collectLabelsM source paths).ticks + 1 =
                  ((parseCandidateM? path).ticks +
                    (runLocalLabelVerifier source history payload).ticks + 1) +
                      (collectLabelsM source paths).ticks := by
                    simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
                _ ≤ 266 * (bound + 1) ^ 2 +
                    266 * (bound + 1) ^ 2 * (paths.length + 1) := hsum
                _ = 266 * (bound + 1) ^ 2 *
                    ((path :: paths).length + 1) := by
                  simp only [List.length_cons]
                  exact final_collector_scaled_succ _ paths.length

theorem final_collectLabelsM_peak_cons_le (source : Instance)
    (path : BitWord) (paths : List BitWord) (bound : Nat)
    (hstates : source.machine.states.length ≤ bound)
    (hinput : source.input.length ≤ bound)
    (hinitial : source.initialState ≤ bound)
    (hpath : path.length ≤ bound)
    (hrec : (collectLabelsM source paths).peak ≤
      266 * (bound + 1) ^ 2 + paths.length + 1) :
    (collectLabelsM source (path :: paths)).peak ≤
      266 * (bound + 1) ^ 2 + (path :: paths).length + 1 := by
  have hparseRaw := parseCandidateM?_peak_le path
  have hpathPow := whole_pow_two_mono (Nat.add_le_add_right hpath 1)
  have hparseBound : (parseCandidateM? path).peak ≤
      266 * (bound + 1) ^ 2 := by
    exact Nat.le_trans hparseRaw (Nat.le_trans
      (Nat.mul_le_mul_left 8 hpathPow)
      (Nat.mul_le_mul_right ((bound + 1) ^ 2)
        (by decide : 8 ≤ 266)))
  unfold collectLabelsM
  cases hparse : (parseCandidateM? path).value with
  | none =>
      simp only [hparse]
      have hpad : 266 * (bound + 1) ^ 2 ≤
          266 * (bound + 1) ^ 2 + (path :: paths).length + 1 :=
        Nat.le_trans (Nat.le_add_right _ (path :: paths).length)
          (Nat.le_succ _)
      apply (Nat.max_le).2
      exact ⟨Nat.le_trans hparseBound hpad, by
        simpa [List.length_cons, Nat.add_assoc] using
          Nat.add_le_add_right hrec 1⟩
  | some pair =>
      rcases pair with ⟨history, payload⟩
      have hlens := final_parsed_candidate_lengths hparse
      have hhistory := Nat.le_trans hlens.1 hpath
      have hpayload := Nat.le_trans hlens.2 hpath
      have hcheckedRaw := runLocalLabelVerifier_peak_le source history payload
      have hcheckedPoly := final_localLabelPeakBound_le_square
        source history payload bound hstates hinput hinitial hhistory hpayload
      have hcheckedBound :
          (runLocalLabelVerifier source history payload).peak ≤
            266 * (bound + 1) ^ 2 :=
        Nat.le_trans (Nat.le_trans hcheckedRaw hcheckedPoly)
          (Nat.mul_le_mul_right ((bound + 1) ^ 2)
            (by decide : 256 ≤ 266))
      cases hchecked :
          (runLocalLabelVerifier source history payload).value <;>
        simp only [hparse, hchecked] <;>
        apply (Nat.max_le).2 <;>
        constructor
      · have hpad : 266 * (bound + 1) ^ 2 ≤
            266 * (bound + 1) ^ 2 + (path :: paths).length + 1 :=
          Nat.le_trans (Nat.le_add_right _ (path :: paths).length)
            (Nat.le_succ _)
        exact Nat.le_trans hparseBound hpad
      · apply (Nat.max_le).2
        have hpad : 266 * (bound + 1) ^ 2 ≤
            266 * (bound + 1) ^ 2 + (path :: paths).length + 1 :=
          Nat.le_trans (Nat.le_add_right _ (path :: paths).length)
            (Nat.le_succ _)
        exact ⟨Nat.le_trans hcheckedBound hpad, by
          simpa [List.length_cons, Nat.add_assoc] using
            Nat.add_le_add_right hrec 1⟩
      · have hpad : 266 * (bound + 1) ^ 2 ≤
            266 * (bound + 1) ^ 2 + (path :: paths).length + 1 :=
          Nat.le_trans (Nat.le_add_right _ (path :: paths).length)
            (Nat.le_succ _)
        exact Nat.le_trans hparseBound hpad
      · apply (Nat.max_le).2
        have hpad : 266 * (bound + 1) ^ 2 ≤
            266 * (bound + 1) ^ 2 + (path :: paths).length + 1 :=
          Nat.le_trans (Nat.le_add_right _ (path :: paths).length)
            (Nat.le_succ _)
        exact ⟨Nat.le_trans hcheckedBound hpad, by
          simpa [List.length_cons, Nat.add_assoc] using
            Nat.add_le_add_right hrec 1⟩

theorem final_list_induction {α : Type} (motive : List α → Prop)
    (nilCase : motive [])
    (consCase : ∀ head tail, motive tail → motive (head :: tail)) :
    ∀ values, motive values := by
  intro values
  induction values with
  | nil => exact nilCase
  | cons head tail ih => exact consCase head tail ih

structure FinalCollectorPeakClaim (source : Instance) (bound : Nat)
    (queries : List BitWord) : Prop where
  bound :
    (∀ path, List.Mem path queries → path.length ≤ bound) →
      (collectLabelsM source queries).peak ≤
        266 * (bound + 1) ^ 2 + queries.length + 1

theorem final_collectorPeakClaim_nil (source : Instance) (bound : Nat) :
    FinalCollectorPeakClaim source bound [] := by
  constructor
  intro _
  change 1 ≤ 266 * (bound + 1) ^ 2 + 0 + 1
  exact Nat.le_trans
    (Nat.le_trans (by decide : 1 ≤ 266)
      (final_constant_le_scaled_square 266 bound))
    (Nat.le_trans (Nat.le_add_right _ 0) (Nat.le_succ _))

theorem final_collectorPeakClaim_cons (source : Instance) (bound : Nat)
    (hstates : source.machine.states.length ≤ bound)
    (hinput : source.input.length ≤ bound)
    (hinitial : source.initialState ≤ bound)
    (path : BitWord) (paths : List BitWord)
    (ih : FinalCollectorPeakClaim source bound paths) :
    FinalCollectorPeakClaim source bound (path :: paths) := by
  constructor
  intro hconsPaths
  have hpath := hconsPaths path (List.Mem.head paths)
  have htail : ∀ query, List.Mem query paths → query.length ≤ bound :=
    fun query hmem => hconsPaths query (List.Mem.tail path hmem)
  have hrec := ih.bound htail
  exact final_collectLabelsM_peak_cons_le source path paths bound
    hstates hinput hinitial hpath hrec

theorem final_allCollectorPeakClaims (source : Instance) (bound : Nat)
    (hstates : source.machine.states.length ≤ bound)
    (hinput : source.input.length ≤ bound)
    (hinitial : source.initialState ≤ bound) :
    ∀ queries, FinalCollectorPeakClaim source bound queries :=
  final_list_induction (FinalCollectorPeakClaim source bound)
    (final_collectorPeakClaim_nil source bound)
    (final_collectorPeakClaim_cons source bound hstates hinput hinitial)

theorem final_collectLabelsM_peak_le (source : Instance)
    (paths : List BitWord) (bound : Nat)
    (hstates : source.machine.states.length ≤ bound)
    (hinput : source.input.length ≤ bound)
    (hinitial : source.initialState ≤ bound)
    (hpaths : ∀ path, List.Mem path paths → path.length ≤ bound) :
    (collectLabelsM source paths).peak ≤
      266 * (bound + 1) ^ 2 + paths.length + 1 :=
  (final_allCollectorPeakClaims source bound hstates hinput hinitial paths).bound hpaths

/-! ## Whole-observer composition -/

theorem final_parseHeaderM?_sound {term : Term} {view : HeaderView}
    (hparse : (parseHeaderM? term).value = some view) :
    term = Term.app (Term.app Term.s view.seed) view.body := by
  apply parseHeader?_sound
  rw [← parseHeaderM?_value]
  exact hparse

theorem final_parseHeaderM?_ticks (term : Term) :
    (parseHeaderM? term).ticks = 3 := by
  cases term with
  | s => rfl
  | app fn arg =>
      cases fn with
      | s => rfl
      | app head value => cases head <;> rfl

theorem final_parseHeaderM?_peak (term : Term) :
    (parseHeaderM? term).peak = 2 := by
  cases term with
  | s => rfl
  | app fn arg =>
      cases fn with
      | s => rfl
      | app head value => cases head <;> rfl

theorem final_pow_step (base exponent : Nat) (hone : 1 ≤ base) :
    base ^ exponent ≤ base ^ (exponent + 1) := by
  rw [Nat.pow_succ]
  exact Nat.le_trans
    (by simpa using Nat.mul_le_mul_left (base ^ exponent) hone)
    (Nat.le_refl _)

theorem final_linear_le_fifth (base : Nat) (hone : 1 ≤ base) :
    base ≤ base ^ 5 := by
  have h12 := final_pow_step base 1 hone
  have h23 := final_pow_step base 2 hone
  have h34 := final_pow_step base 3 hone
  have h45 := final_pow_step base 4 hone
  exact Nat.le_trans (by simpa using h12)
    (Nat.le_trans h23 (Nat.le_trans h34 h45))

theorem final_square_le_fifth (base : Nat) (hone : 1 ≤ base) :
    base ^ 2 ≤ base ^ 5 :=
  Nat.le_trans (final_pow_step base 2 hone)
    (Nat.le_trans (final_pow_step base 3 hone)
      (final_pow_step base 4 hone))

theorem final_cube_le_fifth (base : Nat) (hone : 1 ≤ base) :
    base ^ 3 ≤ base ^ 5 :=
  Nat.le_trans (final_pow_step base 3 hone)
    (final_pow_step base 4 hone)

theorem final_header_seed_body_size
    {term : Term} {view : HeaderView}
    (hparse : (parseHeaderM? term).value = some view) :
    view.seed.size ≤ term.size ∧ view.body.size ≤ term.size := by
  have hterm := final_parseHeaderM?_sound hparse
  subst term
  constructor
  · exact Nat.le_of_lt (Nat.lt_trans
      (term_size_app_right_lt Term.s view.seed)
      (term_size_app_left_lt (Term.app Term.s view.seed) view.body))
  · exact Nat.le_of_lt
      (term_size_app_right_lt (Term.app Term.s view.seed) view.body)

theorem final_success_ticks_le
    {term : Term} {view : HeaderView} {bits : BitWord} {source : Instance}
    (hheader : (parseHeaderM? term).value = some view)
    (hseed : (decodeNM? view.seed).value = some bits)
    (hsource : (decodeInstanceM? bits).value = some source) :
    (parseHeaderM? term).ticks + (decodeNM? view.seed).ticks +
        (decodeInstanceM? bits).ticks + (openedPathsM view.body).ticks +
        (collectLabelsM source (openedPathsM view.body).value).ticks + 1 ≤
      512 * (term.size + 1) ^ 5 := by
  let base := term.size + 1
  let fifth := base ^ 5
  have hone : 1 ≤ base := Nat.succ_le_succ (Nat.zero_le term.size)
  have hsizes := final_header_seed_body_size hheader
  have hseedSucc : view.seed.size + 1 ≤ base :=
    Nat.add_le_add_right hsizes.1 1
  have hbodySucc : view.body.size + 1 ≤ base :=
    Nat.add_le_add_right hsizes.2 1
  have hbits : bits.length ≤ term.size :=
    Nat.le_trans (final_decodeNM?_value_length_le_size hseed) hsizes.1
  have hbitsSucc : bits.length + 1 ≤ base :=
    Nat.add_le_add_right hbits 1
  have hstates : source.machine.states.length ≤ term.size :=
    Nat.le_trans (final_decoded_states_le hsource) hbits
  have hinput : source.input.length ≤ term.size :=
    Nat.le_trans (final_decoded_input_le hsource) hbits
  have hinitial : source.initialState ≤ term.size :=
    Nat.le_trans (final_decoded_initial_le hsource) hbits
  have hpathLengths : ∀ path,
      List.Mem path (openedPathsM view.body).value →
        path.length ≤ term.size := by
    intro path hmem
    rw [openedPathsM_value] at hmem
    exact Nat.le_trans (Nat.le_of_lt (mem_openedPaths_length_lt hmem))
      hsizes.2
  have hpathCount : (openedPathsM view.body).value.length ≤ term.size := by
    rw [openedPathsM_value]
    exact Nat.le_trans (openedPaths_length_le_size view.body) hsizes.2
  have hpathCountSucc : (openedPathsM view.body).value.length + 1 ≤ base :=
    Nat.add_le_add_right hpathCount 1
  have hlinearFifth := final_linear_le_fifth base hone
  have hsquareFifth := final_square_le_fifth base hone
  have hcubeFifth := final_cube_le_fifth base hone
  have hheaderFifth : (parseHeaderM? term).ticks ≤ 3 * fifth := by
    rw [final_parseHeaderM?_ticks]
    exact Nat.le_trans (Nat.mul_le_mul_left 3 hone)
      (Nat.mul_le_mul_left 3 hlinearFifth)
  have hseedFifth : (decodeNM? view.seed).ticks ≤ 6 * fifth := by
    have hraw := final_decodeNM?_ticks_le view.seed
    have hlinear := Nat.mul_le_mul_left 6 hseedSucc
    exact Nat.le_trans (Nat.le_trans hraw hlinear)
      (Nat.mul_le_mul_left 6 hlinearFifth)
  have hbitsSquare : (bits.length + 1) ^ 2 ≤ base ^ 2 := by
    simpa [Nat.pow_two] using whole_mul_self_mono hbitsSucc
  have hsourceFifth : (decodeInstanceM? bits).ticks ≤ 50 * fifth := by
    have hraw : (decodeInstanceM? bits).ticks ≤
        50 * (bits.length + 1) ^ 2 := by
      simpa [Nat.pow_two, Nat.mul_assoc] using decodeInstanceM?_ticks_le bits
    exact Nat.le_trans
      (Nat.le_trans hraw
        (Nat.mul_le_mul_left 50 hbitsSquare))
      (Nat.mul_le_mul_left 50 hsquareFifth)
  have hbodySquare : (view.body.size + 1) ^ 2 ≤ base ^ 2 := by
    simpa [Nat.pow_two] using whole_mul_self_mono hbodySucc
  have hpathsFifth : (openedPathsM view.body).ticks ≤ 14 * fifth := by
    exact Nat.le_trans
      (Nat.le_trans (openedPathsM_ticks_le_quadratic view.body)
        (Nat.mul_le_mul_left 14 hbodySquare))
      (Nat.mul_le_mul_left 14 hsquareFifth)
  have hlabelsCube :
      (collectLabelsM source (openedPathsM view.body).value).ticks ≤
        266 * base ^ 3 := by
    have hraw := final_collectLabelsM_ticks_le source
      (openedPathsM view.body).value term.size
      hstates hinput hinitial hpathLengths
    have hscaled := Nat.mul_le_mul_left (266 * base ^ 2) hpathCountSucc
    exact Nat.le_trans hraw (by
      exact Nat.le_trans hscaled (by
        simp only [base, Nat.pow_succ, Nat.mul_assoc]
        exact Nat.le_refl _))
  have hlabelsFifth :
      (collectLabelsM source (openedPathsM view.body).value).ticks ≤
        266 * fifth :=
    Nat.le_trans hlabelsCube (Nat.mul_le_mul_left 266 hcubeFifth)
  have honeFifth : 1 ≤ 1 * fifth := by
    simpa using Nat.le_trans hone hlinearFifth
  have hfirstFive := final_add_le_add5 hheaderFifth hseedFifth
    hsourceFifth hpathsFifth hlabelsFifth
  have hall := Nat.add_le_add hfirstFive honeFifth
  calc
    (parseHeaderM? term).ticks + (decodeNM? view.seed).ticks +
          (decodeInstanceM? bits).ticks + (openedPathsM view.body).ticks +
          (collectLabelsM source (openedPathsM view.body).value).ticks + 1 ≤
        (3 + 6 + 50 + 14 + 266 + 1) * fifth := by
          exact Nat.le_trans hall (by
            rw [final_sum_scaled5, ← Nat.add_mul]
            exact Nat.le_refl _)
    _ ≤ 512 * fifth := Nat.mul_le_mul_right fifth (by decide)

theorem final_success_peak_le
    {term : Term} {view : HeaderView} {bits : BitWord} {source : Instance}
    (hheader : (parseHeaderM? term).value = some view)
    (hseed : (decodeNM? view.seed).value = some bits)
    (hsource : (decodeInstanceM? bits).value = some source) :
    max (parseHeaderM? term).peak
        (max (decodeNM? view.seed).peak
          (max (decodeInstanceM? bits).peak
            (max (openedPathsM view.body).peak
              (collectLabelsM source (openedPathsM view.body).value).peak))) ≤
      512 * (term.size + 1) ^ 2 := by
  let base := term.size + 1
  let square := base ^ 2
  have hone : 1 ≤ base := Nat.succ_le_succ (Nat.zero_le term.size)
  have hsizes := final_header_seed_body_size hheader
  have hseedSucc : view.seed.size + 1 ≤ base :=
    Nat.add_le_add_right hsizes.1 1
  have hbodySucc : view.body.size + 1 ≤ base :=
    Nat.add_le_add_right hsizes.2 1
  have hbits : bits.length ≤ term.size :=
    Nat.le_trans (final_decodeNM?_value_length_le_size hseed) hsizes.1
  have hbitsSucc : bits.length + 1 ≤ base :=
    Nat.add_le_add_right hbits 1
  have hstates : source.machine.states.length ≤ term.size :=
    Nat.le_trans (final_decoded_states_le hsource) hbits
  have hinput : source.input.length ≤ term.size :=
    Nat.le_trans (final_decoded_input_le hsource) hbits
  have hinitial : source.initialState ≤ term.size :=
    Nat.le_trans (final_decoded_initial_le hsource) hbits
  have hpathLengths : ∀ path,
      List.Mem path (openedPathsM view.body).value →
        path.length ≤ term.size := by
    intro path hmem
    rw [openedPathsM_value] at hmem
    exact Nat.le_trans (Nat.le_of_lt (mem_openedPaths_length_lt hmem))
      hsizes.2
  have hpathCount : (openedPathsM view.body).value.length ≤ term.size := by
    rw [openedPathsM_value]
    exact Nat.le_trans (openedPaths_length_le_size view.body) hsizes.2
  have hpathCountSucc : (openedPathsM view.body).value.length + 1 ≤ base :=
    Nat.add_le_add_right hpathCount 1
  have hlinearSquare : base ≤ square := by
    simpa [square, Nat.pow_two] using whole_linear_le_square term.size
  have hscale512 : square ≤ 512 * square :=
    Nat.le_mul_of_pos_left square (by decide)
  have hheaderPeak : (parseHeaderM? term).peak ≤ 512 * square := by
    rw [final_parseHeaderM?_peak]
    exact Nat.le_trans (final_constant_le_scaled_square 2 term.size)
      (Nat.mul_le_mul_right square (by decide : 2 ≤ 512))
  have hseedPeak : (decodeNM? view.seed).peak ≤ 512 * square :=
    Nat.le_trans (Nat.le_trans (final_decodeNM?_peak_le view.seed)
      hseedSucc) (Nat.le_trans hlinearSquare hscale512)
  have hsourcePeak : (decodeInstanceM? bits).peak ≤ 512 * square := by
    have hraw := decodeInstanceM?_peak_le bits
    have hlinear := Nat.mul_le_mul_left 3 hbitsSucc
    have hthreeSquare := Nat.mul_le_mul_left 3 hlinearSquare
    exact Nat.le_trans (Nat.le_trans (Nat.le_trans hraw hlinear)
      hthreeSquare)
      (Nat.mul_le_mul_right square (by decide : 3 ≤ 512))
  have hpathsPeak : (openedPathsM view.body).peak ≤ 512 * square := by
    exact Nat.le_trans (Nat.le_trans (openedPathsM_peak_le view.body)
      hbodySucc) (Nat.le_trans hlinearSquare hscale512)
  have hlabelsRaw := final_collectLabelsM_peak_le source
    (openedPathsM view.body).value term.size
    hstates hinput hinitial hpathLengths
  have hcountSquare : (openedPathsM view.body).value.length + 1 ≤ square :=
    Nat.le_trans hpathCountSucc hlinearSquare
  have hlabels267 :
      (collectLabelsM source (openedPathsM view.body).value).peak ≤
        267 * square := by
    have hsum := Nat.add_le_add_left hcountSquare (266 * square)
    exact Nat.le_trans hlabelsRaw (by
      exact Nat.le_trans hsum (by
        exact Nat.le_of_eq (by
          simpa using final_sum_scaled2 266 1 square)))
  have hlabelsPeak :
      (collectLabelsM source (openedPathsM view.body).value).peak ≤
        512 * square :=
    Nat.le_trans hlabels267
      (Nat.mul_le_mul_right square (by decide : 267 ≤ 512))
  exact (Nat.max_le).2 ⟨hheaderPeak, (Nat.max_le).2 ⟨hseedPeak,
    (Nat.max_le).2 ⟨hsourcePeak,
      (Nat.max_le).2 ⟨hpathsPeak, hlabelsPeak⟩⟩⟩⟩

/-- Explicit all-input tick polynomial for the actual whole observer. -/
def wholeObserverTimeBound (term : Term) : Nat :=
  512 * (term.size + 1) ^ 5

/-- Explicit all-input structural-meter peak polynomial. -/
def wholeObserverSpaceBound (term : Term) : Nat :=
  512 * (term.size + 1) ^ 2

theorem final_header_ticks_le_time (term : Term) :
    (parseHeaderM? term).ticks ≤ 3 * (term.size + 1) ^ 5 := by
  rw [final_parseHeaderM?_ticks]
  have hone : 1 ≤ term.size + 1 := Nat.succ_le_succ (Nat.zero_le _)
  have hfifth := final_linear_le_fifth (term.size + 1) hone
  exact Nat.le_trans (Nat.mul_le_mul_left 3 hone)
    (Nat.mul_le_mul_left 3 hfifth)

theorem final_seed_ticks_le_time
    {term : Term} {view : HeaderView}
    (hheader : (parseHeaderM? term).value = some view) :
    (decodeNM? view.seed).ticks ≤ 6 * (term.size + 1) ^ 5 := by
  have hsizes := final_header_seed_body_size hheader
  have hseedSucc : view.seed.size + 1 ≤ term.size + 1 :=
    Nat.add_le_add_right hsizes.1 1
  have hone : 1 ≤ term.size + 1 := Nat.succ_le_succ (Nat.zero_le _)
  exact Nat.le_trans
    (Nat.le_trans (final_decodeNM?_ticks_le view.seed)
      (Nat.mul_le_mul_left 6 hseedSucc))
    (Nat.mul_le_mul_left 6
      (final_linear_le_fifth (term.size + 1) hone))

theorem final_source_ticks_le_time
    {term : Term} {view : HeaderView} {bits : BitWord}
    (hheader : (parseHeaderM? term).value = some view)
    (hseed : (decodeNM? view.seed).value = some bits) :
    (decodeInstanceM? bits).ticks ≤ 50 * (term.size + 1) ^ 5 := by
  have hsizes := final_header_seed_body_size hheader
  have hbits : bits.length ≤ term.size :=
    Nat.le_trans (final_decodeNM?_value_length_le_size hseed) hsizes.1
  have hbitsSucc : bits.length + 1 ≤ term.size + 1 :=
    Nat.add_le_add_right hbits 1
  have hsquare : (bits.length + 1) ^ 2 ≤ (term.size + 1) ^ 2 := by
    simpa [Nat.pow_two] using whole_mul_self_mono hbitsSucc
  have hraw : (decodeInstanceM? bits).ticks ≤
      50 * (bits.length + 1) ^ 2 := by
    simpa [Nat.pow_two, Nat.mul_assoc] using decodeInstanceM?_ticks_le bits
  have hone : 1 ≤ term.size + 1 := Nat.succ_le_succ (Nat.zero_le _)
  exact Nat.le_trans (Nat.le_trans hraw (Nat.mul_le_mul_left 50 hsquare))
    (Nat.mul_le_mul_left 50
      (final_square_le_fifth (term.size + 1) hone))

theorem final_header_peak_le_space (term : Term) :
    (parseHeaderM? term).peak ≤ wholeObserverSpaceBound term := by
  rw [final_parseHeaderM?_peak]
  unfold wholeObserverSpaceBound
  exact Nat.le_trans (final_constant_le_scaled_square 2 term.size)
    (Nat.mul_le_mul_right ((term.size + 1) ^ 2) (by decide : 2 ≤ 512))

theorem final_seed_peak_le_space
    {term : Term} {view : HeaderView}
    (hheader : (parseHeaderM? term).value = some view) :
    (decodeNM? view.seed).peak ≤ wholeObserverSpaceBound term := by
  have hsizes := final_header_seed_body_size hheader
  have hseedSucc : view.seed.size + 1 ≤ term.size + 1 :=
    Nat.add_le_add_right hsizes.1 1
  have hlinear : term.size + 1 ≤ (term.size + 1) ^ 2 := by
    simpa [Nat.pow_two] using whole_linear_le_square term.size
  unfold wholeObserverSpaceBound
  exact Nat.le_trans (Nat.le_trans (final_decodeNM?_peak_le view.seed)
      hseedSucc)
    (Nat.le_trans hlinear
      (Nat.le_mul_of_pos_left ((term.size + 1) ^ 2) (by decide)))

theorem final_source_peak_le_space
    {term : Term} {view : HeaderView} {bits : BitWord}
    (hheader : (parseHeaderM? term).value = some view)
    (hseed : (decodeNM? view.seed).value = some bits) :
    (decodeInstanceM? bits).peak ≤ wholeObserverSpaceBound term := by
  have hsizes := final_header_seed_body_size hheader
  have hbits : bits.length ≤ term.size :=
    Nat.le_trans (final_decodeNM?_value_length_le_size hseed) hsizes.1
  have hbitsSucc : bits.length + 1 ≤ term.size + 1 :=
    Nat.add_le_add_right hbits 1
  have hlinear : term.size + 1 ≤ (term.size + 1) ^ 2 := by
    simpa [Nat.pow_two] using whole_linear_le_square term.size
  unfold wholeObserverSpaceBound
  exact Nat.le_trans
    (Nat.le_trans
      (Nat.le_trans (decodeInstanceM?_peak_le bits)
        (Nat.mul_le_mul_left 3 hbitsSucc))
      (Nat.mul_le_mul_left 3 hlinear))
    (Nat.mul_le_mul_right ((term.size + 1) ^ 2) (by decide : 3 ≤ 512))

theorem runWholeLabelledObserver_ticks_le (term : Term) :
    (runWholeLabelledObserver term).ticks ≤ wholeObserverTimeBound term := by
  unfold runWholeLabelledObserver wholeObserverTimeBound
  cases hheader : (parseHeaderM? term).value with
  | none =>
      simp only [hheader]
      have hheaderTick := final_header_ticks_le_time term
      have hone : 1 ≤ 1 * (term.size + 1) ^ 5 := by
        have hbase : 1 ≤ term.size + 1 := Nat.succ_le_succ (Nat.zero_le _)
        simpa using Nat.le_trans hbase
          (final_linear_le_fifth (term.size + 1) hbase)
      have hsum := Nat.add_le_add hheaderTick hone
      exact Nat.le_trans hsum (by
        have heq := final_sum_scaled2 3 1 ((term.size + 1) ^ 5)
        have hfour : (3 + 1) * (term.size + 1) ^ 5 ≤
            512 * (term.size + 1) ^ 5 :=
          Nat.mul_le_mul_right _ (by decide)
        exact Nat.le_trans (Nat.le_of_eq (by simpa using heq)) hfour)
  | some view =>
      simp only [hheader]
      cases hseed : (decodeNM? view.seed).value with
      | none =>
          simp only [hseed]
          have hheaderTick := final_header_ticks_le_time term
          have hseedTick := final_seed_ticks_le_time hheader
          have hbase : 1 ≤ term.size + 1 := Nat.succ_le_succ (Nat.zero_le _)
          have hone : 1 ≤ 1 * (term.size + 1) ^ 5 := by
            simpa using Nat.le_trans hbase
              (final_linear_le_fifth (term.size + 1) hbase)
          have hsum := Nat.add_le_add (Nat.add_le_add hheaderTick hseedTick) hone
          exact Nat.le_trans hsum (by
            have heq := final_sum_scaled3 3 6 1 ((term.size + 1) ^ 5)
            have hten : (3 + 6 + 1) * (term.size + 1) ^ 5 ≤
                512 * (term.size + 1) ^ 5 :=
              Nat.mul_le_mul_right _ (by decide)
            exact Nat.le_trans (Nat.le_of_eq (by simpa using heq)) hten)
      | some bits =>
          simp only [hseed]
          cases hsource : (decodeInstanceM? bits).value with
          | none =>
              simp only [hsource]
              have hheaderTick := final_header_ticks_le_time term
              have hseedTick := final_seed_ticks_le_time hheader
              have hsourceTick := final_source_ticks_le_time hheader hseed
              have hbase : 1 ≤ term.size + 1 :=
                Nat.succ_le_succ (Nat.zero_le _)
              have hone : 1 ≤ 1 * (term.size + 1) ^ 5 := by
                simpa using Nat.le_trans hbase
                  (final_linear_le_fifth (term.size + 1) hbase)
              have hsum := Nat.add_le_add
                (Nat.add_le_add (Nat.add_le_add hheaderTick hseedTick)
                  hsourceTick) hone
              exact Nat.le_trans hsum (by
                have heq := final_sum_scaled4 3 6 50 1
                  ((term.size + 1) ^ 5)
                have hsixty : (3 + 6 + 50 + 1) * (term.size + 1) ^ 5 ≤
                    512 * (term.size + 1) ^ 5 :=
                  Nat.mul_le_mul_right _ (by decide)
                exact Nat.le_trans (Nat.le_of_eq (by simpa using heq)) hsixty)
          | some source =>
              simp only [hsource]
              exact final_success_ticks_le hheader hseed hsource

theorem runWholeLabelledObserver_peak_le (term : Term) :
    (runWholeLabelledObserver term).peak ≤ wholeObserverSpaceBound term := by
  unfold runWholeLabelledObserver
  cases hheader : (parseHeaderM? term).value with
  | none =>
      simp only [hheader]
      exact final_header_peak_le_space term
  | some view =>
      simp only [hheader]
      cases hseed : (decodeNM? view.seed).value with
      | none =>
          simp only [hseed]
          exact (Nat.max_le).2 ⟨final_header_peak_le_space term,
            final_seed_peak_le_space hheader⟩
      | some bits =>
          simp only [hseed]
          cases hsource : (decodeInstanceM? bits).value with
          | none =>
              simp only [hsource]
              exact (Nat.max_le).2 ⟨final_header_peak_le_space term,
                (Nat.max_le).2 ⟨final_seed_peak_le_space hheader,
                  final_source_peak_le_space hheader hseed⟩⟩
          | some source =>
              simp only [hsource]
              exact final_success_peak_le hheader hseed hsource

/-- Kernel-checkable certificate for value, time, peak structural meter,
and compact materialized-output size of the actual whole observer. -/
structure WholeObserverResourceCertificate (term : Term) : Prop where
  value_exact :
    (runWholeLabelledObserver term).value = labelledProjection term
  time_le :
    (runWholeLabelledObserver term).ticks ≤ wholeObserverTimeBound term
  space_le :
    (runWholeLabelledObserver term).peak ≤ wholeObserverSpaceBound term
  output_cells_le :
    labelledOutputCells (runWholeLabelledObserver term).value ≤
      10 * (term.size + 1) * (term.size + 1)

theorem wholeObserver_exact_resource_certificate (term : Term) :
    WholeObserverResourceCertificate term := by
  constructor
  · exact runWholeLabelledObserver_labels term
  · exact runWholeLabelledObserver_ticks_le term
  · exact runWholeLabelledObserver_peak_le term
  · exact runWholeLabelledObserver_outputCells_le term

theorem wholeObserver_resource_certificate (term : Term) :
    WholeObserverResourceCertificate term :=
  wholeObserver_exact_resource_certificate term

end PureSFormal.Research.ProtectedTrieWholeObserverExactCost
