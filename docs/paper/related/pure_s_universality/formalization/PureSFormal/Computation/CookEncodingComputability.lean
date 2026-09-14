import PureSFormal.Computation.RogozhinInputComputability
import PureSFormal.Computation.DeterministicTapePureSComputability

/-!
# Closed code for Cook's canonical initial word

The code computes the literal radix-eight side counters, materializes the
canonical head/left/right runs, and applies the fixed 114-position one-hot
encoding. Its final Boolean word uses the established bijective bit-list code.
Composing this code with the certified source compilers gives the complete
deterministic-tape-instance to pure-S-term encoder.
-/

namespace PureSFormal.Computation.CookEncodingComputability

open PureSFormal.PureS
open PrimitiveRecursiveListCode

def tagWordCode (word : List Cook.TagSymbol) : Nat := encode (word.map Cook.symbolIndex)

def counterValue (base : Nat) : List Rogozhin46.Symbol → Nat
  | [] => base
  | symbol :: rest => 8 * (7 - Cook.machineSymbolValue symbol + counterValue base rest)

theorem fold_append {α β : Type} (step : β → α → β) (left right : List α) (initial : β) :
    (left ++ right).foldl step initial = right.foldl step (left.foldl step initial) := by
  induction left generalizing initial with
  | nil => rfl
  | cons first rest ih => exact ih (step initial first)

theorem counterValue_left (word : List Rogozhin46.Symbol) :
    counterValue 8 word = Cook.PassClassification.leftCounter word := by
  induction word with
  | nil => rfl
  | cons symbol rest ih => rw [counterValue, ih]; rfl

theorem counterValue_right (word : List Rogozhin46.Symbol) :
    counterValue 0 word = Cook.PassClassification.rightCounter word := by
  induction word with
  | nil => rfl
  | cons symbol rest ih => rw [counterValue, ih]; rfl

namespace Program

open PrimitiveRecursiveListCode.Program
open DeterministicTapeThreeCounterComputability.Program
open ThreeCounterTagComputability.Program

def counterStep : PRCode 2 :=
  mul (lit 8) (add (sub (lit 7) (PRCode.projection 1)) (PRCode.projection 0))

theorem eval_counterStep (previous symbol : Nat) :
    PRCode.eval₂ counterStep previous symbol = 8 * (7 - symbol + previous) := by
  simp only [counterStep, eval_mul, eval_lit, eval_add, eval_sub,
    eval₂_projection_one, eval₂_projection_zero]

theorem fold_counterStep (base : Nat) (word : List Rogozhin46.Symbol) :
    (word.map Cook.machineSymbolValue).reverse.foldl (PRCode.eval₂ counterStep) base = counterValue base word := by
  induction word with
  | nil => rfl
  | cons symbol rest ih =>
      rw [List.map_cons, List.reverse_cons, fold_append, ih]
      change PRCode.eval₂ counterStep (counterValue base rest) (Cook.machineSymbolValue symbol) = _
      rw [eval_counterStep]
      rfl

def counter (base : Nat) : PRCode 1 :=
  PRCode.composeBinary (fold counterStep) reverse (PRCode.constant 1 base)

theorem eval_counter (base : Nat) (word : List Rogozhin46.Symbol) :
    PRCode.eval₁ (counter base) (RogozhinInputComputability.wordCode word) = counterValue base word := by
  rw [counter, eval₁_composeBinary, eval_reverse, RogozhinInputComputability.wordCode,
    decode_encode, eval₁_constant, eval_fold_encode, fold_counterStep]

def field (index : Nat) : PRCode 1 :=
  PRCode.composeBinary lookup (PRCode.projection 0) (PRCode.constant 1 index)

theorem eval_field (index : Nat) (config : Rogozhin46.Config) :
    PRCode.eval₁ (field index) (RogozhinInputComputability.configCode config) =
      [RogozhinInputComputability.stateCode config.state, Cook.machineSymbolValue config.current,
        RogozhinInputComputability.wordCode config.left,
        RogozhinInputComputability.wordCode config.right].getD index 0 := by
  rw [field, eval₁_composeBinary, eval₁_projection_zero, eval₁_constant, eval_lookup,
    RogozhinInputComputability.configCode, decode_encode]

def headCount : PRCode 1 := PRCode.composeBinary PRCode.truncatedSubtraction (PRCode.constant 1 8) (field 1)
def leftCount : PRCode 1 := PRCode.composeUnary (counter 8) (field 2)
def rightCount : PRCode 1 := PRCode.composeUnary (counter 0) (field 3)

theorem eval_headCount (config : Rogozhin46.Config) :
    PRCode.eval₁ headCount (RogozhinInputComputability.configCode config) =
      (Cook.PassClassification.canonicalCounts config).head := by
  rw [headCount, eval₁_composeBinary, eval₁_constant, eval_field, PRCode.eval₂_truncatedSubtraction]
  rfl

theorem eval_leftCount (config : Rogozhin46.Config) :
    PRCode.eval₁ leftCount (RogozhinInputComputability.configCode config) =
      (Cook.PassClassification.canonicalCounts config).left := by
  rw [leftCount, eval₁_composeUnary, eval_field]
  change PRCode.eval₁ (counter 8) (RogozhinInputComputability.wordCode config.left) = _
  rw [eval_counter, counterValue_left]
  rfl

theorem eval_rightCount (config : Rogozhin46.Config) :
    PRCode.eval₁ rightCount (RogozhinInputComputability.configCode config) =
      (Cook.PassClassification.canonicalCounts config).right := by
  rw [rightCount, eval₁_composeUnary, eval_field]
  change PRCode.eval₁ (counter 0) (RogozhinInputComputability.wordCode config.right) = _
  rw [eval_counter, counterValue_right]
  rfl

def canonicalWord : PRCode 1 :=
  PRCode.composeBinary append
    (PRCode.composeBinary replicate (field 0) headCount)
    (PRCode.composeBinary append
      (PRCode.composeBinary replicate
        (PRCode.composeBinary PRCode.addition (PRCode.constant 1 4) (field 0)) leftCount)
      (PRCode.composeBinary replicate
        (PRCode.composeBinary PRCode.addition (PRCode.constant 1 8) (field 0)) rightCount))

theorem eval_canonicalWord (config : Rogozhin46.Config) :
    PRCode.eval₁ canonicalWord (RogozhinInputComputability.configCode config) =
      tagWordCode (Cook.PassClassification.canonicalWord config) := by
  simp only [canonicalWord, eval₁_composeBinary, eval_field, eval_headCount, eval_leftCount,
    eval_rightCount, eval₁_constant, PRCode.eval₂_addition, eval_replicate,
    eval_append, decode_encode, tagWordCode, Cook.PassClassification.canonicalWord,
    Cook.PassClassification.runWord, List.map_append, List.map_replicate, List.append_assoc]
  cases config.state <;> rfl

def oneHot : PRCode 1 :=
  PRCode.composeBinary append
    (PRCode.composeBinary replicate (PRCode.constant 1 0) (PRCode.projection 0))
    (PRCode.composeBinary cons (PRCode.constant 1 1)
      (PRCode.composeBinary replicate (PRCode.constant 1 0)
        (PRCode.composeBinary PRCode.truncatedSubtraction (PRCode.constant 1 Cook.alphabetSize)
          (PRCode.composeUnary PRCode.successor (PRCode.projection 0)))))

theorem eval_oneHot (symbol : Cook.TagSymbol) :
    PRCode.eval₁ oneHot (Cook.symbolIndex symbol) =
      encode ((Cook.oneHot symbol).map DeterministicTapeCode.boolCode) := by
  simp only [oneHot, eval₁_composeBinary, eval₁_composeUnary, eval₁_constant,
    eval₁_projection_zero, eval_replicate, PRCode.eval₂_truncatedSubtraction]
  change PRCode.eval₂ append (encode (List.replicate (Cook.symbolIndex symbol) 0))
    (PRCode.eval₂ cons 1 (encode (List.replicate (Cook.alphabetSize - (Cook.symbolIndex symbol + 1)) 0))) = _
  rw [eval_cons]
  change PRCode.eval₂ append (encode _) (encode (1 :: _)) = _
  rw [eval_append, decode_encode, decode_encode]
  simp only [Cook.oneHot, List.map_append, List.map_replicate, List.map_cons, DeterministicTapeCode.boolCode]

def encodeWord : PRCode 1 := flatMap oneHot

theorem flatMap_oneHot (word : List Cook.TagSymbol) :
    (word.map Cook.symbolIndex).flatMap (fun code => decode (PRCode.eval₁ oneHot code)) =
      (Cook.encodeWord word).map DeterministicTapeCode.boolCode := by
  induction word with
  | nil => rfl
  | cons symbol rest ih =>
      rw [List.map_cons, List.flatMap_cons, eval_oneHot, decode_encode,
        Cook.encodeWord_cons, List.map_append, ih]

theorem eval_encodeWord (word : List Cook.TagSymbol) :
    PRCode.eval₁ encodeWord (tagWordCode word) =
      encode ((Cook.encodeWord word).map DeterministicTapeCode.boolCode) := by
  rw [encodeWord, eval_flatMap, tagWordCode, decode_encode, flatMap_oneHot]

def bitStep : PRCode 2 :=
  add (add (mul (lit 2) (PRCode.projection 0)) (PRCode.projection 1)) (lit 1)

theorem eval_bitStep (previous value : Nat) :
    PRCode.eval₂ bitStep previous value = 2 * previous + value + 1 := by
  simp only [bitStep, eval_add, eval_mul, eval_lit, eval₂_projection_zero, eval₂_projection_one]

theorem fold_bitStep (bits : List Bool) :
    (bits.map DeterministicTapeCode.boolCode).reverse.foldl (PRCode.eval₂ bitStep) 0 =
      DeterministicTapeCode.bitListCode bits := by
  induction bits with
  | nil => rfl
  | cons bit rest ih =>
      rw [List.map_cons, List.reverse_cons, fold_append, ih]
      change PRCode.eval₂ bitStep (DeterministicTapeCode.bitListCode rest) (DeterministicTapeCode.boolCode bit) = _
      rw [eval_bitStep]
      cases bit <;> simp only [DeterministicTapeCode.boolCode, DeterministicTapeCode.bitListCode,
        Nat.add_zero, Nat.add_assoc]

def bitListCode : PRCode 1 :=
  PRCode.composeBinary (fold bitStep) reverse (PRCode.constant 1 0)

theorem eval_bitListCode (bits : List Bool) :
    PRCode.eval₁ bitListCode (encode (bits.map DeterministicTapeCode.boolCode)) =
      DeterministicTapeCode.bitListCode bits := by
  rw [bitListCode, eval₁_composeBinary, eval_reverse, decode_encode, eval₁_constant,
    eval_fold_encode, fold_bitStep]

def canonicalBits : PRCode 1 :=
  PRCode.composeUnary bitListCode (PRCode.composeUnary encodeWord canonicalWord)

theorem eval_canonicalBits (config : Rogozhin46.Config) :
    PRCode.eval₁ canonicalBits (RogozhinInputComputability.configCode config) =
      DeterministicTapeCode.bitListCode (Cook.encodeWord (Cook.PassClassification.canonicalWord config)) := by
  rw [canonicalBits, eval₁_composeUnary, eval₁_composeUnary,
    eval_canonicalWord, eval_encodeWord, eval_bitListCode]

def tagBits : PRCode 1 := PRCode.composeUnary canonicalBits RogozhinInputComputability.Program.compile

theorem eval_tagBits (number : Nat) :
    PRCode.eval₁ tagBits number =
      DeterministicTapeCode.bitListCode (RogozhinT2Cook.encodeBits (DeletionTwoT2Computability.jobDecode number)) := by
  rw [tagBits, eval₁_composeUnary, RogozhinInputComputability.Program.eval_compile, eval_canonicalBits]
  rfl

def sourceBits : PRCode 1 := PRCode.composeUnary tagBits ThreeCounterTagComputability.Program.sourceT2

theorem eval_sourceBits (number : Nat) :
    PRCode.eval₁ sourceBits number = DeterministicTapeCode.bitListCode
      (DeterministicTapeCook.encodeBits (DeterministicTapeCode.instanceDecodeCode number)) := by
  rw [sourceBits, eval₁_composeUnary, ThreeCounterTagComputability.Program.eval_sourceT2,
    eval_tagBits, DeletionTwoT2Computability.jobDecode_code]
  rfl

def sourceTerm : PRCode 1 :=
  PRCode.composeUnary DeterministicTapePureSComputability.FixedEndpoint.generatorProgram sourceBits

theorem eval_sourceTerm (number : Nat) :
    PRCode.eval₁ sourceTerm number =
      (DeterministicTapePureS.encodeTerm (DeterministicTapeCode.instanceDecodeCode number)).code := by
  rw [sourceTerm, eval₁_composeUnary, eval_sourceBits,
    DeterministicTapePureSComputability.FixedEndpoint.generatorProgram_correct]
  rfl

end Program

theorem sourceBits_primitiveRecursive :
    PrimitiveRecursive (fun number => DeterministicTapeCode.bitListCode
      (DeterministicTapeCook.encodeBits (DeterministicTapeCode.instanceDecodeCode number))) :=
  ⟨Program.sourceBits, Program.eval_sourceBits⟩

theorem sourceTerm_primitiveRecursive :
    PrimitiveRecursive (fun number =>
      (DeterministicTapePureS.encodeTerm (DeterministicTapeCode.instanceDecodeCode number)).code) :=
  ⟨Program.sourceTerm, Program.eval_sourceTerm⟩

theorem sourceTerm_computable :
    PartialRecursive.Computable (fun number =>
      (DeterministicTapePureS.encodeTerm (DeterministicTapeCode.instanceDecodeCode number)).code) :=
  PrimitiveRecursive.computable sourceTerm_primitiveRecursive

theorem sourceBits_decode (number : Nat) :
    DeterministicTapeCode.bitListDecode (PRCode.eval₁ Program.sourceBits number) =
      DeterministicTapeCook.encodeBits (DeterministicTapeCode.instanceDecodeCode number) := by
  rw [Program.eval_sourceBits, DeterministicTapeCode.bitListDecode_code]

theorem sourceTerm_decode (number : Nat) :
    Term.decodeCodeTotal (PRCode.eval₁ Program.sourceTerm number) =
      DeterministicTapePureS.encodeTerm (DeterministicTapeCode.instanceDecodeCode number) := by
  rw [Program.eval_sourceTerm, Term.decodeCodeTotal_code]

end PureSFormal.Computation.CookEncodingComputability
