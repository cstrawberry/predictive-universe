import PureSFormal.Cook.PassDecoder
import PureSFormal.PureS.ParserCheckpointPrimitive

/-!
# Primitive Cook bitword decoding

The Cook alphabet and its one-hot words form a fixed prepared table. The
decoder uses unary indices, immutable list references, counted Boolean-list
equality, and explicit list copying. Data constructor observations, child
reads, Boolean branches, and data constructor allocations each cost one;
the result records and their operation counters are proof instrumentation.
-/

namespace PureSFormal.Computation.CookWordPrimitive

open PureS PureS.ParserPrimitiveMachine
open PureS.ParserRoutePrimitive (andThen charge andThen_value andThen_operations_le)

def equalBits : List Bool → List Bool → Result Bool
  | [], [] => ⟨true, 2⟩
  | [], _ :: _ => ⟨false, 2⟩
  | _ :: _, [] => ⟨false, 2⟩
  | first :: rest, second :: tail =>
      if first == second then
        let inner := equalBits rest tail
        ⟨inner.value, inner.operations + 9⟩
      else ⟨false, 7⟩

theorem equalBits_value (first second : List Bool) :
    (equalBits first second).value = true ↔ first = second := by
  induction first generalizing second with
  | nil => cases second <;> simp [equalBits]
  | cons bit rest ih =>
      cases second with
      | nil => simp [equalBits]
      | cons other tail =>
          cases bit <;> cases other <;> simp [equalBits, ih]

theorem equalBits_operations_le (first second : List Bool) :
    (equalBits first second).operations ≤ 9 * first.length + 2 := by
  induction first generalizing second with
  | nil => cases second <;> exact Nat.le_refl _
  | cons bit rest ih =>
      cases second with
      | nil => exact Nat.le_add_left _ _
      | cons other tail =>
          unfold equalBits
          split
          · simpa only [List.length_cons, Nat.mul_succ,
              Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using Nat.add_le_add_right (ih tail) 9
          · exact Nat.le_trans (by decide : 7 ≤ 9 + 2)
              (Nat.add_le_add_right (Nat.mul_le_mul_left 9 (Nat.succ_le_succ (Nat.zero_le rest.length))) 2)

def firstTrue : List Bool → Result Nat
  | [] => ⟨0, 2⟩
  | true :: _ => ⟨0, 4⟩
  | false :: rest =>
      let inner := firstTrue rest
      ⟨.succ inner.value, inner.operations + 5⟩

theorem firstTrue_value (bits : List Bool) :
    (firstTrue bits).value = bits.findIdx (fun bit => bit) := by
  induction bits with
  | nil => rfl
  | cons bit rest ih =>
      cases bit <;> simp [firstTrue, List.findIdx_cons, ih]

theorem firstTrue_operations_le (bits : List Bool) :
    (firstTrue bits).operations ≤ 5 * bits.length + 2 := by
  induction bits with
  | nil => exact Nat.le_refl _
  | cons bit rest ih =>
      cases bit with
      | false =>
          simpa only [firstTrue, List.length_cons, Nat.mul_succ,
            Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using Nat.add_le_add_right ih 5
      | true =>
          exact Nat.le_trans (by decide : 4 ≤ 5 + 2)
            (Nat.add_le_add_right (Nat.mul_le_mul_left 5 (Nat.succ_le_succ (Nat.zero_le rest.length))) 2)

def lookup {α : Type} : List α → Nat → Result (Option α)
  | [], _ => ⟨none, 2⟩
  | first :: _, 0 => ⟨some first, 4⟩
  | _ :: rest, .succ index =>
      let inner := lookup rest index
      ⟨inner.value, inner.operations + 4⟩

theorem lookup_value {α : Type} (values : List α) (index : Nat) :
    (lookup values index).value = values[index]? := by
  induction values generalizing index with
  | nil => rfl
  | cons first rest ih =>
      cases index with
      | zero => rfl
      | succ index => exact ih index

theorem lookup_operations_le {α : Type} (values : List α) (index : Nat) :
    (lookup values index).operations ≤ 4 * values.length + 2 := by
  induction values generalizing index with
  | nil => exact Nat.le_refl _
  | cons first rest ih =>
      cases index with
      | zero =>
          exact Nat.le_trans (by decide : 4 ≤ 4 + 2)
            (Nat.add_le_add_right (Nat.mul_le_mul_left 4 (Nat.succ_le_succ (Nat.zero_le rest.length))) 2)
      | succ index =>
          simpa only [lookup, List.length_cons, Nat.mul_succ,
            Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using Nat.add_le_add_right (ih index) 4

def prepareTable (alphabet : List Cook.TagSymbol) : List (Cook.TagSymbol × List Bool) :=
  alphabet.map fun symbol => (symbol, Cook.oneHot symbol)

theorem lookup_prepared_value (alphabet : List Cook.TagSymbol) (index : Nat) :
    (lookup (prepareTable alphabet) index).value =
      (alphabet[index]?).map (fun symbol => (symbol, Cook.oneHot symbol)) := by
  rw [lookup_value]
  exact List.getElem?_map

def oneHotPrepared (table : List (Cook.TagSymbol × List Bool)) (block : List Bool) :
    Result (Option Cook.TagSymbol) :=
  let index := firstTrue block
  let selected := lookup table index.value
  let output := andThen selected fun entry =>
    let equal := equalBits block entry.2
    if equal.value then ⟨some entry.1, equal.operations + 4⟩
    else ⟨none, equal.operations + 3⟩
  ⟨output.value, index.operations + output.operations⟩

def oneHot : List Bool → Result (Option Cook.TagSymbol) :=
  let table := prepareTable Cook.alphabet
  oneHotPrepared table

theorem oneHot_value (block : List Bool) :
    (oneHot block).value = Cook.decodeOneHot? block := by
  unfold oneHot oneHotPrepared
  dsimp only
  rw [andThen_value, firstTrue_value, lookup_prepared_value]
  unfold Cook.decodeOneHot? Cook.decodeOneHotRaw?
  cases Cook.alphabet[block.findIdx (fun bit => bit)]? with
  | none => rfl
  | some symbol =>
      dsimp only [Option.map, Option.bind]
      by_cases same : block = Cook.oneHot symbol
      · rw [if_pos ((equalBits_value _ _).mpr same), if_pos same]
      · rw [if_neg (fun yes => same ((equalBits_value _ _).mp yes)), if_neg same]

theorem oneHotPrepared_operations_le (table : List (Cook.TagSymbol × List Bool)) (block : List Bool) :
    (oneHotPrepared table block).operations ≤ 14 * block.length + 4 * table.length + 12 := by
  have nextBound (entry : Cook.TagSymbol × List Bool) :
      (if (equalBits block entry.2).value then
        ⟨some entry.1, (equalBits block entry.2).operations + 4⟩
      else (⟨none, (equalBits block entry.2).operations + 3⟩ : Result (Option Cook.TagSymbol))).operations ≤
        9 * block.length + 6 := by
    have bound := Nat.add_le_add_right (equalBits_operations_le block entry.2) 4
    split
    · simpa only [show 6 = 2 + 4 by rfl, Nat.add_assoc] using bound
    · exact Nat.le_trans (Nat.add_le_add_left (by decide : 3 ≤ 4) _)
        (by simpa only [show 6 = 2 + 4 by rfl, Nat.add_assoc] using bound)
  have counted := andThen_operations_le (lookup table (firstTrue block).value) _
    (9 * block.length + 6) (fun entry _ => nextBound entry)
  have bounded := Nat.add_le_add (firstTrue_operations_le block)
    (Nat.le_trans counted (Nat.add_le_add_right
      (Nat.add_le_add_right (lookup_operations_le table (firstTrue block).value) 2) _))
  apply Nat.le_trans bounded
  simp only [show 14 = 5 + 9 by rfl, show 12 = 2 + 2 + 2 + 6 by rfl,
    Nat.add_mul, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm, Nat.le_refl]

theorem oneHot_operations_le (block : List Bool) :
    (oneHot block).operations ≤ 14 * block.length + 468 := by
  have bound := oneHotPrepared_operations_le (prepareTable Cook.alphabet) block
  simpa only [prepareTable, List.length_map, Cook.alphabet_length,
    show 4 * 114 = 456 by rfl, show 468 = 456 + 12 by rfl, Nat.add_assoc] using! bound

def cut : Nat → List Bool → Result (List Bool × List Bool)
  | 0, bits => ⟨([], bits), 3⟩
  | .succ _, bits@(.nil) => ⟨([], bits), 4⟩
  | .succ count, bit :: rest =>
      let inner := cut count rest
      ⟨(bit :: inner.value.1, inner.value.2), inner.operations + 9⟩

theorem cut_value (count : Nat) (bits : List Bool) :
    (cut count bits).value = (bits.take count, bits.drop count) := by
  induction count generalizing bits with
  | zero => rfl
  | succ count ih =>
      cases bits with
      | nil => rfl
      | cons bit rest =>
          simp only [cut, ih, List.take_succ_cons, List.drop_succ_cons]

theorem cut_operations_le (count : Nat) (bits : List Bool) :
    (cut count bits).operations ≤ 12 * (count + 1) := by
  induction count generalizing bits with
  | zero => exact (by decide : 3 ≤ 12)
  | succ count ih =>
      cases bits with
      | nil =>
          exact Nat.le_trans (by decide : 4 ≤ 12)
            (ParserRoutePrimitive.constant_le_scale 12 (.succ count))
      | cons bit rest =>
          have bound := Nat.add_le_add (ih rest) (by decide : 9 ≤ 12)
          simpa only [cut, Nat.succ_eq_add_one, Nat.mul_add, Nat.mul_one, Nat.add_assoc] using bound

theorem cut_prefix_length_le (count : Nat) (bits : List Bool) :
    (cut count bits).value.1.length ≤ count := by
  rw [cut_value]
  change (bits.take count).length ≤ count
  rw [List.length_take]
  exact Nat.min_le_left _ _

theorem cut_suffix_lt (bit : Bool) (rest : List Bool) :
    (cut Cook.alphabetSize (bit :: rest)).value.2.length < (bit :: rest).length := by
  rw [cut_value]
  change ((bit :: rest).drop Cook.alphabetSize).length < (bit :: rest).length
  rw [List.length_drop]
  exact Nat.sub_lt (Nat.zero_lt_succ rest.length) (by decide : 0 < Cook.alphabetSize)

def parsePrepared (table : List (Cook.TagSymbol × List Bool)) (bits : List Bool) :
    Result (Option (List Cook.TagSymbol)) :=
  match bits with
  | [] => ⟨some [], 3⟩
  | source@(bit :: rest) =>
      let pieces := cut Cook.alphabetSize source
      let output := andThen (oneHotPrepared table pieces.value.1) fun symbol =>
        charge 1 (andThen (parsePrepared table pieces.value.2) fun remaining =>
          ⟨some (symbol :: remaining), 2⟩)
      ⟨output.value, pieces.operations + 2 + output.operations⟩
termination_by bits.length
decreasing_by
  subst source
  exact cut_suffix_lt bit rest

def parse : List Bool → Result (Option (List Cook.TagSymbol)) :=
  let table := prepareTable Cook.alphabet
  parsePrepared table

theorem parse_nil : (parse []).value = some [] := by rw [parse, parsePrepared]

theorem parse_nil_operations : (parse []).operations = 3 := by rw [parse, parsePrepared]

theorem parse_cons_value (bit : Bool) (rest : List Bool) :
    (parse (bit :: rest)).value =
      (oneHot ((bit :: rest).take Cook.alphabetSize)).value.bind fun symbol =>
        (parse ((bit :: rest).drop Cook.alphabetSize)).value.map (List.cons symbol) := by
  change (parsePrepared _ _).value = _
  rw [parsePrepared]
  change (andThen _ _).value = _
  rw [andThen_value, cut_value]
  change (oneHot ((bit :: rest).take Cook.alphabetSize)).value.bind (fun symbol =>
    (andThen (parse ((bit :: rest).drop Cook.alphabetSize)) fun remaining =>
      ⟨some (symbol :: remaining), 2⟩).value) = _
  cases (oneHot ((bit :: rest).take Cook.alphabetSize)).value with
  | none => rfl
  | some symbol =>
      dsimp only [Option.bind]
      change (andThen _ _).value = _
      rw [andThen_value]
      cases (parse ((bit :: rest).drop Cook.alphabetSize)).value <;> rfl

theorem parse_sound {bits : List Bool} {word : List Cook.TagSymbol}
    (found : (parse bits).value = some word) : bits = Cook.encodeWord word := by
  induction bits using WellFounded.induction (measure List.length).wf generalizing word with
  | h bits ih =>
      cases bits with
      | nil =>
          rw [parse_nil] at found
          have same : [] = word := Option.some.inj found
          cases same
          rfl
      | cons bit rest =>
          rw [parse_cons_value] at found
          cases first : (oneHot ((bit :: rest).take Cook.alphabetSize)).value with
          | none => rw [first] at found; cases found
          | some symbol =>
              rw [first] at found
              dsimp only [Option.bind] at found
              cases suffix : (parse ((bit :: rest).drop Cook.alphabetSize)).value with
              | none => rw [suffix] at found; cases found
              | some remaining =>
                  rw [suffix] at found
                  have same : symbol :: remaining = word := Option.some.inj found
                  cases same
                  have headShape := Cook.decodeOneHot?_sound ((oneHot_value _).symm.trans first)
                  have smaller : ((bit :: rest).drop Cook.alphabetSize).length < (bit :: rest).length := by
                    rw [List.length_drop]
                    exact Nat.sub_lt (Nat.zero_lt_succ rest.length) (by decide : 0 < Cook.alphabetSize)
                  have tailShape := ih _ smaller suffix
                  rw [Cook.encodeWord_cons, ← headShape, ← tailShape]
                  exact (List.take_append_drop Cook.alphabetSize (bit :: rest)).symm

theorem parse_complete (word : List Cook.TagSymbol) :
    (parse (Cook.encodeWord word)).value = some word := by
  induction word with
  | nil => exact parse_nil
  | cons symbol remaining ih =>
      have nonempty := Cook.encodeWord_cons_ne_nil symbol remaining
      cases encoded : Cook.encodeWord (symbol :: remaining) with
      | nil => exact False.elim (nonempty encoded)
      | cons bit rest =>
          rw [parse_cons_value, ← encoded, Cook.take_encodeWord_cons,
            Cook.drop_encodeWord_cons, oneHot_value, Cook.decodeOneHot?_oneHot, ih]
          rfl

theorem parse_value (bits : List Bool) : (parse bits).value = Cook.decodeWord? bits := by
  cases parsed : (parse bits).value with
  | some word =>
      rw [parse_sound parsed]
      exact (Cook.decodeWord?_encodeWord word).symm
  | none =>
      cases decoded : Cook.decodeWord? bits with
      | none => rfl
      | some word =>
          have shape := Cook.decodeWord?_sound decoded
          have accepted := parse_complete word
          rw [← shape, parsed] at accepted
          cases accepted

theorem parse_operations_le (bits : List Bool) : (parse bits).operations ≤ 4000 * (bits.length + 1) := by
  induction bits using WellFounded.induction (measure List.length).wf with
  | h bits ih =>
      cases bits with
      | nil =>
          rw [parse_nil_operations]
          exact (by decide : 3 ≤ 4000)
      | cons bit rest =>
          let pieces := cut Cook.alphabetSize (bit :: rest)
          have smaller := cut_suffix_lt bit rest
          have inner := Nat.le_trans (ih pieces.value.2 smaller)
            (Nat.mul_le_mul_left 4000 (Nat.succ_le_of_lt smaller))
          have firstBlock : (oneHot pieces.value.1).operations ≤ 2064 := by
            have bound := Nat.le_trans (oneHot_operations_le pieces.value.1)
              (Nat.add_le_add_right (Nat.mul_le_mul_left 14 (cut_prefix_length_le Cook.alphabetSize (bit :: rest))) 468)
            exact bound
          have nextBound (symbol : Cook.TagSymbol) :
              (charge 1 (andThen (parse pieces.value.2) fun remaining =>
                ⟨some (symbol :: remaining), 2⟩)).operations ≤ 4000 * (bit :: rest).length + 5 := by
            have counted := andThen_operations_le (parse pieces.value.2)
              (fun remaining => ⟨some (symbol :: remaining), 2⟩) 2 (fun _ _ => Nat.le_refl _)
            have bound := Nat.add_le_add_left
              (Nat.le_trans counted (Nat.add_le_add_right (Nat.add_le_add_right inner 2) 2)) 1
            simpa only [show 5 = 1 + 2 + 2 by rfl,
              Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using! bound
          have counted := andThen_operations_le (oneHot pieces.value.1)
            (fun symbol => charge 1 (andThen (parse pieces.value.2) fun remaining =>
              ⟨some (symbol :: remaining), 2⟩)) (4000 * (bit :: rest).length + 5)
            (fun symbol _ => nextBound symbol)
          have bounded := Nat.add_le_add
            (Nat.add_le_add_right (cut_operations_le Cook.alphabetSize (bit :: rest)) 2)
            (Nat.le_trans counted (Nat.add_le_add_right (Nat.add_le_add_right firstBlock 2) _))
          change (parsePrepared _ _).operations ≤ _
          rw [parsePrepared]
          apply Nat.le_trans bounded
          have extra := Nat.add_le_add_left (by decide : 12 * (Cook.alphabetSize + 1) + 2 + 2064 + 2 + 5 ≤ 4000)
            (4000 * (bit :: rest).length)
          simpa only [Nat.mul_add, Nat.mul_one, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using extra

end PureSFormal.Computation.CookWordPrimitive
