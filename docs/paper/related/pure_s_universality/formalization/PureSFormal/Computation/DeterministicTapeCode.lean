import Std
import PureSFormal.Computation.PrimitiveRecursive
import PureSFormal.PureS.TermNatCode
import PureSFormal.Research.ProtectedTrieDeterministicCompiler

/-!
# Total natural codes for deterministic tape instances

The component codes are bijections. Finite lists use zero for the empty list
and one plus Cantor pairing for a cons cell. Boolean lists use the direct
binary bijection. Consequently every natural decodes to one instance and both
round trips hold without a malformed-code side condition.
-/

namespace PureSFormal.Computation.DeterministicTapeCode

open PureSFormal.PureS
open PureSFormal.Research.ProtectedTrieMachine
open PureSFormal.Research.ProtectedTrieDeterministicCompiler

/-- The primitive-recursive triangular-number program uses the same
recurrence as the Cantor coding of pure-S terms. -/
theorem triangularValue_eq_termTriangle (number : Nat) :
    PRCode.triangularValue number = Term.triangle number := by
  induction number with
  | zero => rfl
  | succ number ih =>
      rw [PRCode.triangularValue, Term.triangle_succ, ih]

/-- The closed primitive-recursive pairing program computes the repository's
canonical Cantor pairing function. -/
theorem eval₂_cantorPair_eq_termPair (first second : Nat) :
    PRCode.eval₂ PRCode.cantorPair first second = Term.pair first second := by
  rw [PRCode.eval₂_cantorPair, Term.pair,
    triangularValue_eq_termTriangle]

/-- The primitive-recursive diagonal program identifies the diagonal of the
repository's executable Cantor unpairing. -/
theorem cantorDiagonalValue_eq_unpair_sum (number : Nat) :
    PRCode.cantorDiagonalValue number =
      (Term.unpair number).1 + (Term.unpair number).2 := by
  have encoded := Term.pair_unpair number
  cases unpaired : Term.unpair number with
  | mk left right =>
      simp only [unpaired, Prod.fst, Prod.snd] at encoded ⊢
      rw [Term.pair, ← triangularValue_eq_termTriangle] at encoded
      have candidateLower :
          PRCode.triangularValue (left + right) ≤ number := by
        calc
          PRCode.triangularValue (left + right) ≤
              PRCode.triangularValue (left + right) + right :=
            Nat.le_add_right _ _
          _ = number := encoded
      have rightLe : right ≤ left + right := Nat.le_add_left right left
      have candidateUpper :
          number < PRCode.triangularValue (left + right + 1) := by
        calc
          number = PRCode.triangularValue (left + right) + right := encoded.symm
          _ ≤ PRCode.triangularValue (left + right) + (left + right) :=
            Nat.add_le_add_left rightLe _
          _ < PRCode.triangularValue (left + right) + (left + right) + 1 :=
            Nat.lt_succ_self _
          _ = PRCode.triangularValue (left + right + 1) := by
            rw [PRCode.triangularValue]
      exact PRCode.cantorDiagonal_unique
        (PRCode.cantorDiagonalValue_bounds number).1
        (PRCode.cantorDiagonalValue_bounds number).2
        candidateLower candidateUpper

/-- The primitive-recursive right-coordinate program agrees with executable
Cantor unpairing. -/
theorem eval₁_cantorRight_eq_unpair_snd (number : Nat) :
    PRCode.eval₁ PRCode.cantorRight number = (Term.unpair number).2 := by
  have encoded := Term.pair_unpair number
  cases unpaired : Term.unpair number with
  | mk left right =>
      simp only [unpaired, Prod.fst, Prod.snd] at encoded ⊢
      rw [Term.pair, ← triangularValue_eq_termTriangle] at encoded
      rw [PRCode.eval₁_cantorRight,
        cantorDiagonalValue_eq_unpair_sum, unpaired]
      simp only [Prod.fst, Prod.snd]
      rw [← encoded, Nat.add_sub_cancel_left]

/-- The primitive-recursive left-coordinate program agrees with executable
Cantor unpairing. -/
theorem eval₁_cantorLeft_eq_unpair_fst (number : Nat) :
    PRCode.eval₁ PRCode.cantorLeft number = (Term.unpair number).1 := by
  have encoded := Term.pair_unpair number
  cases unpaired : Term.unpair number with
  | mk left right =>
      simp only [unpaired, Prod.fst, Prod.snd] at encoded ⊢
      rw [Term.pair, ← triangularValue_eq_termTriangle] at encoded
      rw [PRCode.eval₁_cantorLeft,
        cantorDiagonalValue_eq_unpair_sum, unpaired]
      simp only [Prod.fst, Prod.snd]
      rw [← encoded, Nat.add_sub_cancel_left, Nat.add_sub_cancel]

namespace NatList

/-- Bijection constructor for finite lists over a naturally coded type. -/
def encode (elementCode : α → Nat) : List α → Nat
  | [] => 0
  | head :: tail => Term.pair (elementCode head) (encode elementCode tail) + 1

/-- Total inverse list decoder. -/
def decode (elementDecode : Nat → α) (number : Nat) : List α :=
  if zero : number = 0 then
    []
  else
    let coordinates := Term.unpair (number - 1)
    elementDecode coordinates.1 :: decode elementDecode coordinates.2
termination_by number
decreasing_by
  have paired : Term.pair (Term.unpair (number - 1)).1
      (Term.unpair (number - 1)).2 = number - 1 :=
    Term.pair_unpair (number - 1)
  have smaller := Term.right_lt_pair_succ
    (Term.unpair (number - 1)).1 (Term.unpair (number - 1)).2
  rw [paired] at smaller
  have oneLe : 1 ≤ number :=
    Nat.succ_le_of_lt (Nat.zero_lt_of_ne_zero zero)
  simpa only [Nat.sub_add_cancel oneLe] using smaller

@[simp]
theorem decode_encode (elementCode : α → Nat) (elementDecode : Nat → α)
    (inverse : ∀ value, elementDecode (elementCode value) = value)
    (values : List α) :
    decode elementDecode (encode elementCode values) = values := by
  induction values with
  | nil => simp [encode, decode]
  | cons head tail ih =>
      rw [encode, decode.eq_def]
      have nonzero : Term.pair (elementCode head) (encode elementCode tail) + 1 ≠ 0 := by
        exact Nat.succ_ne_zero _
      simp only [nonzero, ↓reduceIte]
      simp only [Nat.add_sub_cancel, Term.unpair_pair, inverse, ih]
      simp

@[simp]
theorem encode_decode (elementCode : α → Nat) (elementDecode : Nat → α)
    (inverse : ∀ number, elementCode (elementDecode number) = number)
    (number : Nat) :
    encode elementCode (decode elementDecode number) = number := by
  induction number using Nat.strongRecOn with
  | ind number ih =>
      by_cases zero : number = 0
      · subst number
        rw [decode.eq_def, encode.eq_def]
        simp
      · rw [decode.eq_def]
        simp only [zero, ↓reduceIte, dite_false]
        have paired := Term.pair_unpair (number - 1)
        have smallerPair := Term.right_lt_pair_succ
          (Term.unpair (number - 1)).1 (Term.unpair (number - 1)).2
        rw [paired] at smallerPair
        have oneLe : 1 ≤ number :=
          Nat.succ_le_of_lt (Nat.zero_lt_of_ne_zero zero)
        have smaller : (Term.unpair (number - 1)).2 < number := by
          simpa only [Nat.sub_add_cancel oneLe] using smallerPair
        change Term.pair
          (elementCode (elementDecode (Term.unpair (number - 1)).1))
          (encode elementCode (decode elementDecode (Term.unpair (number - 1)).2)) + 1 =
          number
        rw [inverse, ih _ smaller, paired]
        exact Nat.sub_add_cancel oneLe

end NatList

/-- Canonical Boolean digit. -/
def boolCode : Bool → Nat
  | false => 0
  | true => 1

/-- Total Boolean decoder used in the rule code. -/
def boolDecode (number : Nat) : Bool :=
  match number % 2 with
  | 0 => false
  | _ => true

@[simp]
theorem boolDecode_code (value : Bool) : boolDecode (boolCode value) = value := by
  cases value <;> rfl

theorem boolCode_decode (number : Nat) :
    boolCode (boolDecode number) = number % 2 := by
  rcases Nat.mod_two_eq_zero_or_one number with zero | one
  · simp [boolDecode, zero, boolCode]
  · simp [boolDecode, one, boolCode]

/-- Direction digit in the order left, stay, right. -/
def directionCode : PureSFormal.Research.ProtectedTrieMachine.Direction → Nat
  | .left => 0
  | .stay => 1
  | .right => 2

/-- Total direction decoder used in the rule code. -/
def directionDecode (number : Nat) :
    PureSFormal.Research.ProtectedTrieMachine.Direction :=
  match number % 3 with
  | 0 => .left
  | 1 => .stay
  | _ => .right

@[simp]
theorem directionDecode_code
    (direction : PureSFormal.Research.ProtectedTrieMachine.Direction) :
    directionDecode (directionCode direction) = direction := by
  cases direction <;> rfl

theorem directionCode_decode (number : Nat) :
    directionCode (directionDecode number) = number % 3 := by
  have bound := Nat.mod_lt number (by decide : 0 < 3)
  unfold directionDecode
  cases equation : number % 3 with
  | zero => rfl
  | succ remainder =>
      cases remainder with
      | zero => rfl
      | succ remainder =>
          cases remainder with
          | zero => rfl
          | succ remainder =>
              have impossible : remainder + 3 < 3 := by
                simpa only [equation, Nat.succ_eq_add_one, Nat.add_assoc,
                  Nat.add_comm, Nat.add_left_comm] using bound
              exact False.elim
                ((Nat.not_lt_of_ge (Nat.le_add_left 3 remainder)) impossible)

/-- Rule code `bit + 2 * (direction + 3 * nextState)`. -/
def ruleCode (rule : Rule) : Nat :=
  boolCode rule.write + 2 * (directionCode rule.move + 3 * rule.nextState)

/-- Total inverse of `ruleCode`. -/
def ruleDecode (number : Nat) : Rule :=
  let rest := number / 2
  { write := boolDecode number
    move := directionDecode rest
    nextState := rest / 3 }

theorem one_add_two_mul_div_two (number : Nat) :
    (1 + 2 * number) / 2 = number := by
  calc
    (1 + 2 * number) / 2 = (1 + number * 2) / 2 := by rw [Nat.mul_comm]
    _ = 1 / 2 + number := Nat.add_mul_div_right 1 number (by decide)
    _ = number := by rw [Nat.div_eq_of_lt (by decide : 1 < 2), Nat.zero_add]

theorem direction_add_three_mul_div_three
    (direction : PureSFormal.Research.ProtectedTrieMachine.Direction)
    (number : Nat) :
    (directionCode direction + 3 * number) / 3 = number := by
  have digitLt : directionCode direction < 3 := by
    cases direction <;> decide
  calc
    (directionCode direction + 3 * number) / 3 =
        (directionCode direction + number * 3) / 3 := by rw [Nat.mul_comm]
    _ = directionCode direction / 3 + number :=
      Nat.add_mul_div_right _ _ (by decide)
    _ = number := by rw [Nat.div_eq_of_lt digitLt, Nat.zero_add]

@[simp]
theorem ruleDecode_code (rule : Rule) : ruleDecode (ruleCode rule) = rule := by
  cases rule with
  | mk write move nextState =>
      have rest : (ruleCode ⟨write, move, nextState⟩) / 2 =
          directionCode move + 3 * nextState := by
        cases write with
        | false =>
            simp [ruleCode, boolCode, Nat.mul_div_right]
        | true =>
            simpa [ruleCode, boolCode] using
              one_add_two_mul_div_two (directionCode move + 3 * nextState)
      have writeEq : boolDecode (ruleCode ⟨write, move, nextState⟩) = write := by
        cases write <;>
          simp [ruleCode, boolCode, boolDecode, Nat.add_mul_mod_self_right]
      have moveEq : directionDecode (directionCode move + 3 * nextState) = move := by
        cases move <;>
          simp [directionDecode, directionCode, Nat.add_mul_mod_self_right]
      simp only [ruleDecode, rest, writeEq, moveEq,
        direction_add_three_mul_div_three]

@[simp]
theorem ruleCode_decode (number : Nat) : ruleCode (ruleDecode number) = number := by
  unfold ruleCode ruleDecode
  rw [boolCode_decode, directionCode_decode, Nat.mod_add_div (number / 2) 3]
  exact Nat.mod_add_div number 2

/-- Option coding reserves zero for absence. -/
def optionCode (elementCode : α → Nat) : Option α → Nat
  | none => 0
  | some value => elementCode value + 1

/-- Total inverse option decoder. -/
def optionDecode (elementDecode : Nat → α) : Nat → Option α
  | 0 => none
  | number + 1 => some (elementDecode number)

@[simp]
theorem optionDecode_code (elementCode : α → Nat) (elementDecode : Nat → α)
    (inverse : ∀ value, elementDecode (elementCode value) = value)
    (value : Option α) :
    optionDecode elementDecode (optionCode elementCode value) = value := by
  cases value with
  | none => rfl
  | some value => simp [optionCode, optionDecode, inverse]

@[simp]
theorem optionCode_decode (elementCode : α → Nat) (elementDecode : Nat → α)
    (inverse : ∀ number, elementCode (elementDecode number) = number)
    (number : Nat) :
    optionCode elementCode (optionDecode elementDecode number) = number := by
  cases number with
  | zero => rfl
  | succ number => simp [optionCode, optionDecode, inverse]

/-- Natural code for one deterministic state row. -/
def stateRowCode (row : DeterministicTape.StateRow) : Nat :=
  Term.pair (optionCode ruleCode row.onFalse) (optionCode ruleCode row.onTrue)

/-- Total inverse state-row decoder. -/
def stateRowDecode (number : Nat) : DeterministicTape.StateRow :=
  { onFalse := optionDecode ruleDecode (Term.unpair number).1
    onTrue := optionDecode ruleDecode (Term.unpair number).2 }

@[simp]
theorem stateRowDecode_code (row : DeterministicTape.StateRow) :
    stateRowDecode (stateRowCode row) = row := by
  cases row with
  | mk onFalse onTrue =>
      unfold stateRowDecode stateRowCode
      rw [Term.unpair_pair]
      rw [optionDecode_code ruleCode ruleDecode ruleDecode_code]
      rw [optionDecode_code ruleCode ruleDecode ruleDecode_code]

@[simp]
theorem stateRowCode_decode (number : Nat) :
    stateRowCode (stateRowDecode number) = number := by
  unfold stateRowCode stateRowDecode
  rw [optionCode_decode ruleCode ruleDecode ruleCode_decode]
  rw [optionCode_decode ruleCode ruleDecode ruleCode_decode]
  exact Term.pair_unpair number

/-- Natural code for a finite deterministic machine table. -/
def machineCode (machine : DeterministicTape.Machine) : Nat :=
  NatList.encode stateRowCode machine.states

/-- Total inverse machine decoder. -/
def machineDecode (number : Nat) : DeterministicTape.Machine :=
  { states := NatList.decode stateRowDecode number }

@[simp]
theorem machineDecode_code (machine : DeterministicTape.Machine) :
    machineDecode (machineCode machine) = machine := by
  cases machine with
  | mk states =>
      unfold machineDecode machineCode
      rw [NatList.decode_encode stateRowCode stateRowDecode stateRowDecode_code]

@[simp]
theorem machineCode_decode (number : Nat) :
    machineCode (machineDecode number) = number := by
  unfold machineCode machineDecode
  rw [NatList.encode_decode stateRowCode stateRowDecode stateRowCode_decode]

/-- Direct bijective code for finite Boolean lists. -/
def bitListCode : List Bool → Nat
  | [] => 0
  | false :: tail => 2 * bitListCode tail + 1
  | true :: tail => 2 * bitListCode tail + 2

/-- Total inverse Boolean-list decoder. -/
def bitListDecode : Nat → List Bool
  | 0 => []
  | number + 1 => (if number % 2 = 1 then true else false) ::
      bitListDecode (number / 2)
termination_by number => number
decreasing_by
  exact Nat.lt_succ_of_le (Nat.div_le_self number 2)

@[simp]
theorem bitListDecode_code (bits : List Bool) :
    bitListDecode (bitListCode bits) = bits := by
  induction bits with
  | nil => rw [bitListCode, bitListDecode.eq_def]
  | cons bit tail ih =>
      cases bit with
      | false =>
          rw [bitListCode, bitListDecode.eq_def]
          have quotient : 2 * bitListCode tail / 2 = bitListCode tail :=
            Nat.mul_div_right _ (by decide)
          simp only [Nat.add_sub_cancel, Nat.mul_mod_right, Nat.zero_ne_one,
            ↓reduceIte, quotient, ih]
      | true =>
          rw [bitListCode, bitListDecode.eq_def]
          have quotient : (2 * bitListCode tail + 1) / 2 = bitListCode tail := by
            calc
              (2 * bitListCode tail + 1) / 2 =
                  (1 + bitListCode tail * 2) / 2 := by
                    simp only [Nat.mul_comm, Nat.add_comm]
              _ = 1 / 2 + bitListCode tail :=
                Nat.add_mul_div_right 1 (bitListCode tail) (by decide)
              _ = bitListCode tail := by
                rw [Nat.div_eq_of_lt (by decide : 1 < 2), Nat.zero_add]
          have remainder : (2 * bitListCode tail + 1) % 2 = 1 := by
            calc
              (2 * bitListCode tail + 1) % 2 =
                  (1 + bitListCode tail * 2) % 2 := by
                    simp only [Nat.mul_comm, Nat.add_comm]
              _ = 1 % 2 := Nat.add_mul_mod_self_right 1 (bitListCode tail) 2
              _ = 1 := Nat.mod_eq_of_lt (by decide)
          simp only [Nat.add_sub_cancel, remainder, ↓reduceIte, quotient, ih]

@[simp]
theorem bitListCode_decode (number : Nat) :
    bitListCode (bitListDecode number) = number := by
  induction number using Nat.strongRecOn with
  | ind number ih =>
      cases number with
      | zero => rw [bitListDecode.eq_def, bitListCode]
      | succ number =>
          have smaller : number / 2 < number + 1 :=
            Nat.lt_succ_of_le (Nat.div_le_self number 2)
          rw [bitListDecode.eq_def]
          by_cases odd : number % 2 = 1
          · simp only [odd, ↓reduceIte, bitListCode, ih _ smaller]
            have recombine := Nat.mod_add_div number 2
            calc
              2 * (number / 2) + 2 =
                  (number % 2 + 2 * (number / 2)) + 1 := by
                    rw [odd]
                    calc
                      2 * (number / 2) + 2 =
                          (2 * (number / 2) + 1) + 1 :=
                        Nat.add_succ (2 * (number / 2)) 1
                      _ = (1 + 2 * (number / 2)) + 1 := by
                        rw [Nat.add_comm (2 * (number / 2)) 1]
              _ = number + 1 := congrArg (fun value => value + 1) recombine
          · have even : number % 2 = 0 := by
              rcases Nat.mod_two_eq_zero_or_one number with even | one
              · exact even
              · exact False.elim (odd one)
            simp only [odd, ↓reduceIte, bitListCode, ih _ smaller]
            have recombine := Nat.mod_add_div number 2
            have twice : 2 * (number / 2) = number := by
              simpa only [even, Nat.zero_add] using recombine
            exact congrArg (fun value => value + 1) twice

/-- Canonical natural code of a deterministic tape instance. -/
def instanceCode (source : DeterministicTape.Instance) : Nat :=
  Term.pair (machineCode source.machine)
    (Term.pair source.initialState (bitListCode source.input))

/-- Total inverse of `Instance.code`. -/
def instanceDecodeCode (number : Nat) : DeterministicTape.Instance :=
  let outer := Term.unpair number
  let inner := Term.unpair outer.2
  { machine := machineDecode outer.1
    initialState := inner.1
    input := bitListDecode inner.2 }

@[simp]
theorem instanceDecodeCode_code (source : DeterministicTape.Instance) :
    instanceDecodeCode (instanceCode source) = source := by
  cases source
  simp [instanceDecodeCode, instanceCode]

@[simp]
theorem instanceCode_decodeCode (number : Nat) :
    instanceCode (instanceDecodeCode number) = number := by
  simp [instanceDecodeCode, instanceCode, Term.pair_unpair]

theorem instanceCode_injective : ∀ {first second : DeterministicTape.Instance},
    instanceCode first = instanceCode second → first = second := by
  intro first second equal
  have decoded := congrArg instanceDecodeCode equal
  simpa using decoded

theorem instanceCode_surjective : ∀ number, ∃ source, instanceCode source = number := by
  intro number
  exact ⟨instanceDecodeCode number, instanceCode_decodeCode number⟩

theorem instanceCode_bijective :
    (∀ {first second}, instanceCode first = instanceCode second → first = second) ∧
    (∀ number, ∃ source, instanceCode source = number) :=
  ⟨instanceCode_injective, instanceCode_surjective⟩

/-- Tape halting transported through the total instance decoder. -/
def CodedDeterministicTapeHalts (number : Nat) : Prop :=
  DeterministicTape.Halts (instanceDecodeCode number)

@[simp]
theorem codedHalts_code_iff (source : DeterministicTape.Instance) :
    CodedDeterministicTapeHalts (instanceCode source) ↔ DeterministicTape.Halts source := by
  simp [CodedDeterministicTapeHalts]

end PureSFormal.Computation.DeterministicTapeCode

namespace PureSFormal.PureS.Term

/-- Total executable inverse of the natural code. The fallback branch is
provably unreachable for the bijective Cantor coding. -/
def decodeCodeTotal (number : Nat) : Term :=
  match decodeCode? number with
  | none => .s
  | some term => term

@[simp]
theorem decodeCodeTotal_code (term : Term) :
    decodeCodeTotal term.code = term := by
  simp [decodeCodeTotal]

@[simp]
theorem code_decodeCodeTotal (number : Nat) :
    (decodeCodeTotal number).code = number := by
  cases decoded : decodeCode? number with
  | none =>
      have total := decodeCode?_isSome number
      rw [decoded] at total
      contradiction
  | some term =>
      simp only [decodeCodeTotal, decoded]
      exact code_eq_of_decodeCode?_eq_some decoded

end PureSFormal.PureS.Term

namespace PureSFormal.Research.ProtectedTrieDeterministicCompiler.DeterministicTape.Instance

/-- Canonical natural code exposed on the source-instance namespace. -/
def code (source : Instance) : Nat :=
  PureSFormal.Computation.DeterministicTapeCode.instanceCode source

/-- Total inverse of `code`. -/
def decodeCode (number : Nat) : Instance :=
  PureSFormal.Computation.DeterministicTapeCode.instanceDecodeCode number

@[simp]
theorem decodeCode_code (source : Instance) : decodeCode source.code = source :=
  PureSFormal.Computation.DeterministicTapeCode.instanceDecodeCode_code source

@[simp]
theorem code_decodeCode (number : Nat) : (decodeCode number).code = number :=
  PureSFormal.Computation.DeterministicTapeCode.instanceCode_decodeCode number

theorem code_bijective :
    (∀ {first second : Instance}, first.code = second.code → first = second) ∧
    (∀ number, ∃ source : Instance, source.code = number) :=
  PureSFormal.Computation.DeterministicTapeCode.instanceCode_bijective

end PureSFormal.Research.ProtectedTrieDeterministicCompiler.DeterministicTape.Instance

namespace PureSFormal.Computation

/-- Natural-number language obtained by decoding the canonical tape-instance
numbering and asking whether that instance halts. -/
abbrev CodedDeterministicTapeHalts : Nat → Prop :=
  DeterministicTapeCode.CodedDeterministicTapeHalts

@[simp]
theorem codedDeterministicTapeHalts_code_iff
    (source :
      PureSFormal.Research.ProtectedTrieDeterministicCompiler.DeterministicTape.Instance) :
    CodedDeterministicTapeHalts source.code ↔
      PureSFormal.Research.ProtectedTrieDeterministicCompiler.DeterministicTape.Halts source :=
  DeterministicTapeCode.codedHalts_code_iff source

end PureSFormal.Computation
