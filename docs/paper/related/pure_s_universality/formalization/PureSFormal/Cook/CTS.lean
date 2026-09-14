import PureSFormal.Cook.Tag
import PureSFormal.CTS.Core

/-!
# Unary compilation to the fixed 912-phase CTS

Each of the 114 Cook tag symbols is encoded by one Boolean block of length
114 with one `true` bit.  The first 114 cyclic appendants are encoded tag
productions and the remaining `7 * 114 = 798` appendants are empty.
-/

namespace PureSFormal.Cook

def alphabetSize : Nat := 114
def deletionNumber : Nat := 8
def paddingPhases : Nat := 798
def ctsPeriod : Nat := 912

/-- Zero-based position of a symbol in the fixed alphabet order. -/
def symbolIndex : TagSymbol → Nat
  | .head state =>
      match state with
      | .A => 0 | .B => 1 | .C => 2 | .D => 3
  | .left state =>
      match state with
      | .A => 4 | .B => 5 | .C => 6 | .D => 7
  | .right state =>
      match state with
      | .A => 8 | .B => 9 | .C => 10 | .D => 11
  | .rightStar state =>
      match state with
      | .A => 12 | .B => 13 | .C => 14 | .D => 15
  | .indexed family state index =>
      let familyOffset :=
        match family with
        | .H => 16 | .L => 48 | .R => 80
      let stateOffset :=
        match state with
        | .A => 0 | .B => 8 | .C => 16 | .D => 24
      familyOffset + stateOffset + (index.toNat - 1)
  | .dummy1 => 112
  | .dummy2 => 113

theorem symbolIndex_lt (symbol : TagSymbol) :
    symbolIndex symbol < alphabetSize := by
  cases symbol with
  | head state => cases state <;> decide
  | left state => cases state <;> decide
  | right state => cases state <;> decide
  | rightStar state => cases state <;> decide
  | indexed family state index =>
      cases family <;> cases state <;> cases index <;> decide
  | dummy1 => decide
  | dummy2 => decide

/-- The numerical position really indexes the symbol in `alphabet`. -/
theorem alphabet_getElem?_symbolIndex (symbol : TagSymbol) :
    alphabet[symbolIndex symbol]? = some symbol := by
  cases symbol with
  | head state => cases state <;> decide
  | left state => cases state <;> decide
  | right state => cases state <;> decide
  | rightStar state => cases state <;> decide
  | indexed family state index =>
      cases family <;> cases state <;> cases index <;> decide
  | dummy1 => decide
  | dummy2 => decide

/-- Different tag symbols have different unary-code positions. -/
theorem symbolIndex_injective
    {left right : TagSymbol} (heq : symbolIndex left = symbolIndex right) :
    left = right := by
  have hleft := alphabet_getElem?_symbolIndex left
  have hright := alphabet_getElem?_symbolIndex right
  rw [heq] at hleft
  rw [hleft] at hright
  exact Option.some.inj hright

/-- One-hot Boolean block at a fixed zero-based alphabet index. -/
def oneHot (symbol : TagSymbol) : List Bool :=
  List.replicate (symbolIndex symbol) false ++
    true :: List.replicate (alphabetSize - (symbolIndex symbol + 1)) false

@[simp]
theorem oneHot_length (symbol : TagSymbol) :
    (oneHot symbol).length = alphabetSize := by
  cases symbol with
  | head state => cases state <;> decide
  | left state => cases state <;> decide
  | right state => cases state <;> decide
  | rightStar state => cases state <;> decide
  | indexed family state index =>
      cases family <;> cases state <;> cases index <;> decide
  | dummy1 => decide
  | dummy2 => decide

/-- Every unary block contains exactly one selected bit. -/
@[simp]
theorem oneHot_count_true (symbol : TagSymbol) :
    (oneHot symbol).count true = 1 := by
  cases symbol with
  | head state => cases state <;> decide
  | left state => cases state <;> decide
  | right state => cases state <;> decide
  | rightStar state => cases state <;> decide
  | indexed family state index =>
      cases family <;> cases state <;> cases index <;> decide
  | dummy1 => decide
  | dummy2 => decide

/-- Symbolwise unary encoding of a tag word. -/
def encodeWord (word : List TagSymbol) : List Bool :=
  word.flatMap oneHot

@[simp]
theorem encodeWord_nil : encodeWord [] = [] :=
  rfl

@[simp]
theorem encodeWord_cons (symbol : TagSymbol) (word : List TagSymbol) :
    encodeWord (symbol :: word) = oneHot symbol ++ encodeWord word :=
  rfl

/-- Encoded length is exactly 114 times the tag-word length. -/
@[simp]
theorem encodeWord_length (word : List TagSymbol) :
    (encodeWord word).length = alphabetSize * word.length := by
  induction word with
  | nil => rfl
  | cons symbol word ih =>
      simp only [encodeWord_cons, List.length_append, oneHot_length, ih,
        List.length_cons, Nat.mul_succ]
      rw [Nat.add_comm]

/-- Number of selected bits equals the source tag-word length. -/
@[simp]
theorem encodeWord_count_true (word : List TagSymbol) :
    (encodeWord word).count true = word.length := by
  induction word with
  | nil => rfl
  | cons symbol word ih =>
      simp only [encodeWord_cons, List.count_append, oneHot_count_true, ih,
        List.length_cons]
      rw [Nat.add_comm]

/-- Binary appendant compiled from one tag production. -/
def binaryProduction (symbol : TagSymbol) : List Bool :=
  encodeWord (production symbol)

@[simp]
theorem binaryProduction_length (symbol : TagSymbol) :
    (binaryProduction symbol).length =
      alphabetSize * (production symbol).length := by
  simp [binaryProduction]

/-- The 114 nonpadding appendants, in alphabet order. -/
def productionAppendants : List (List Bool) :=
  alphabet.map binaryProduction

/-- The exact cyclic list: 114 production appendants then 798 empties. -/
def ctsAppendants : List (List Bool) :=
  productionAppendants ++ List.replicate paddingPhases []

@[simp]
theorem productionAppendants_length : productionAppendants.length = 114 := by
  simp [productionAppendants]

@[simp]
theorem ctsAppendants_length : ctsAppendants.length = ctsPeriod := by
  simp only [ctsAppendants, List.length_append, productionAppendants_length,
    List.length_replicate]
  rfl

/-- Read a cyclic appendant using the proved 912-row list length. -/
def appendantAt (phase : Fin ctsPeriod) : List Bool :=
  ctsAppendants.get (Fin.cast ctsAppendants_length.symm phase)

/-- The fixed positive-period deletion-one cyclic tag program. -/
def rogozhinCookProgram : CTS.Program where
  period := ctsPeriod
  period_pos := by decide
  appendant := appendantAt

@[simp]
theorem rogozhinCookProgram_period : rogozhinCookProgram.period = 912 :=
  rfl

/-- A generic distribution identity for a constant left multiplier. -/
theorem sum_map_mul_left (factor : Nat) (values : List Nat) :
    (values.map fun value => factor * value).sum = factor * values.sum := by
  induction values with
  | nil => rfl
  | cons value values ih =>
      simp only [List.map_cons, List.sum_cons, ih, Nat.mul_add]

/-- Constructive fusion of two maps under a natural-number sum. -/
theorem sum_map_comp (values : List α) (first : α → β)
    (second : β → Nat) :
    ((values.map first).map second).sum =
      (values.map fun value => second (first value)).sum := by
  induction values with
  | nil => rfl
  | cons value values ih =>
      simp only [List.map_cons, List.sum_cons, ih]

/-- Pointwise equal natural-valued maps have equal finite sums. -/
theorem sum_map_pointwise (values : List α) (left right : α → Nat)
    (heq : ∀ value, left value = right value) :
    (values.map left).sum = (values.map right).sum := by
  induction values with
  | nil => rfl
  | cons value values ih =>
      simp only [List.map_cons, List.sum_cons, heq value, ih]

/-- The first 114 appendants contain exactly 303,468 Boolean positions. -/
theorem production_appendant_bit_count :
    (productionAppendants.map List.length).sum = 303468 := by
  have hrhs :
      (alphabet.map fun symbol => (production symbol).length).sum = 2662 := by
    calc
      (alphabet.map fun symbol => (production symbol).length).sum =
          ((alphabet.map fun lhs =>
              ProductionEntry.mk lhs (production lhs)).map
            fun entry => entry.rhs.length).sum := by
              exact (sum_map_comp alphabet
                (fun lhs => ProductionEntry.mk lhs (production lhs))
                (fun entry => entry.rhs.length)).symm
      _ = (productionTable.map fun entry => entry.rhs.length).sum := rfl
      _ = 2662 := total_rhs_symbol_count
  calc
    (productionAppendants.map List.length).sum =
        ((alphabet.map binaryProduction).map List.length).sum := rfl
    _ = (alphabet.map fun symbol => (binaryProduction symbol).length).sum :=
      sum_map_comp alphabet binaryProduction List.length
    _ = (alphabet.map fun symbol =>
        alphabetSize * (production symbol).length).sum := by
      exact sum_map_pointwise alphabet
        (fun symbol => (binaryProduction symbol).length)
        (fun symbol => alphabetSize * (production symbol).length)
        binaryProduction_length
    _ = alphabetSize *
        (alphabet.map fun symbol => (production symbol).length).sum := by
      exact sum_map_mul_left alphabetSize
        (alphabet.map fun symbol => (production symbol).length)
    _ = 303468 := by rw [hrhs]; rfl

theorem sum_append_nat (left right : List Nat) :
    (left ++ right).sum = left.sum + right.sum := by
  induction left with
  | nil => simp
  | cons value left ih =>
      simp only [List.cons_append, List.sum_cons, ih, Nat.add_assoc]

theorem padding_appendant_bit_count (count : Nat) :
    ((List.replicate count ([] : List Bool)).map List.length).sum = 0 := by
  induction count with
  | zero => rfl
  | succ count ih =>
      simp only [List.replicate_succ, List.map_cons, List.length_nil,
        List.sum_cons, Nat.zero_add, ih]

/-- Padding contributes no bits, so the complete 912-row table has the same sum. -/
theorem total_appendant_bit_count :
    (ctsAppendants.map List.length).sum = 303468 := by
  rw [ctsAppendants, List.map_append, sum_append_nat,
    production_appendant_bit_count, padding_appendant_bit_count, Nat.add_zero]

/-- Every fixed binary appendant contains at most `64 * 114 = 7,296` bits. -/
theorem binaryProduction_length_le_7296 (symbol : TagSymbol) :
    (binaryProduction symbol).length ≤ 7296 := by
  rw [binaryProduction_length]
  exact Nat.mul_le_mul_left alphabetSize
    (production_length_le_sixty_four symbol)

/-- Executing all one-actions therefore uses exactly 606,936 push contractions. -/
theorem total_push_contraction_count :
    2 * (ctsAppendants.map List.length).sum = 606936 := by
  rw [total_appendant_bit_count]

end PureSFormal.Cook
