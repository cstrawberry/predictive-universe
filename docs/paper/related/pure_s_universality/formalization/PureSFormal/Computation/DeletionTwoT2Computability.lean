import PureSFormal.Computation.DeterministicTapeThreeCounterComputability
import PureSFormal.Computation.DeletionTwoT2Normalizer

/-!
# Closed code for deletion-two pair-padding normalization

The production table is numbered as a natural list of natural-list row codes.
This numbering and the paired program/word job numbering are bijections on all
natural numbers. The closed programs compute the existing label shift, every
normalized row, the appended delay row, and the initial word's delay suffix.
-/

namespace PureSFormal.Computation.DeletionTwoT2Computability

open PureSFormal.PureS
open PrimitiveRecursiveListCode

def programCode (program : RogozhinTagInput.Program) : Nat :=
  encode (program.productions.map encode)

def programDecode (number : Nat) : RogozhinTagInput.Program :=
  ⟨(decode number).map decode⟩

theorem map_decode_encode (rows : List (List Nat)) :
    (rows.map encode).map decode = rows := by
  induction rows with
  | nil => rfl
  | cons row rest ih => rw [List.map_cons, List.map_cons, decode_encode, ih]

theorem map_encode_decode (rows : List Nat) :
    (rows.map decode).map encode = rows := by
  induction rows with
  | nil => rfl
  | cons row rest ih => rw [List.map_cons, List.map_cons, encode_decode, ih]

@[simp] theorem programDecode_code (program : RogozhinTagInput.Program) :
    programDecode (programCode program) = program := by
  cases program with
  | mk rows =>
      change RogozhinTagInput.Program.mk ((decode (encode (rows.map encode))).map decode) = _
      rw [decode_encode, map_decode_encode]

@[simp] theorem programCode_decode (number : Nat) :
    programCode (programDecode number) = number := by
  rw [programCode, programDecode, map_encode_decode, encode_decode]

def jobCode (job : RogozhinTagInput.Job) : Nat :=
  Term.pair (programCode job.program) (encode job.word)

def jobDecode (number : Nat) : RogozhinTagInput.Job :=
  ⟨programDecode (Term.unpair number).1, decode (Term.unpair number).2⟩

@[simp] theorem jobDecode_code (job : RogozhinTagInput.Job) :
    jobDecode (jobCode job) = job := by
  cases job with
  | mk program word =>
      simp only [jobDecode, jobCode, Term.unpair_pair, programDecode_code, decode_encode]

@[simp] theorem jobCode_decode (number : Nat) :
    jobCode (jobDecode number) = number := by
  simp only [jobCode, jobDecode, programCode_decode, encode_decode, Term.pair_unpair]

namespace Program

open PrimitiveRecursiveListCode.Program
open DeterministicTapeThreeCounterComputability.Program

def size : PRCode 2 := PRCode.composeUnary length (PRCode.projection 0)

theorem eval_size (program : RogozhinTagInput.Program) (second : Nat) :
    PRCode.eval₂ size (programCode program) second = RogozhinTagInput.symbolCount program := by
  rw [size, eval₂_composeUnary, eval₂_projection_zero, eval_length, programCode,
    decode_encode, List.length_map]
  rfl

def encodeLabel : PRCode 2 :=
  ifZero (PRCode.composeBinary PRCode.equal (PRCode.projection 1) size)
    (PRCode.projection 1) (add size (lit 1))

theorem eval_encodeLabel (program : RogozhinTagInput.Program) (label : Nat) :
    PRCode.eval₂ encodeLabel (programCode program) label =
      DeletionTwoT2Normalizer.encodeLabel program label := by
  simp only [encodeLabel, eval_ifZero, eval₂_composeBinary, eval₂_projection_one,
    eval_size, PRCode.eval₂_equal, eval_add, eval_lit,
    DeletionTwoT2Normalizer.encodeLabel, DeletionTwoT2Normalizer.targetHaltLabel,
    RogozhinTagInput.haltLabel]
  by_cases equal : label = RogozhinTagInput.symbolCount program <;>
    simp only [equal, ↓reduceIte, Nat.one_ne_zero]

def encodeWord : PRCode 2 := mapWithParameter encodeLabel

theorem eval_encodeWord (program : RogozhinTagInput.Program) (word : List Nat) :
    PRCode.eval₂ encodeWord (programCode program) (encode word) =
      encode (DeletionTwoT2Normalizer.encodeWord program word) := by
  rw [encodeWord, eval_mapWithParameter, decode_encode]
  exact congrArg encode (DeterministicTapeThreeCounterComputability.map_pointwise _ _ _
    (eval_encodeLabel program))

def delayPair : PRCode 2 := cell size (cell size (lit 0))

theorem eval_delayPair (program : RogozhinTagInput.Program) (second : Nat) :
    PRCode.eval₂ delayPair (programCode program) second =
      encode [DeletionTwoT2Normalizer.delayLabel program, DeletionTwoT2Normalizer.delayLabel program] := by
  simp only [delayPair, eval_cell, eval_size, eval_lit]
  rfl

def normalizedRhs : PRCode 2 :=
  ifZero (PRCode.projection 1) (cell size (cell size delayPair))
    (cell size (cell size encodeWord))

theorem eval_normalizedRhs (program : RogozhinTagInput.Program) (rhs : List Nat) :
    PRCode.eval₂ normalizedRhs (programCode program) (encode rhs) =
      encode (DeletionTwoT2Normalizer.normalizedRhs program rhs) := by
  cases rhs with
  | nil =>
      simp only [normalizedRhs, eval_ifZero, eval₂_projection_one, encode, DeterministicTapeCode.NatList.encode,
        ↓reduceIte, eval_cell, eval_size, eval_delayPair, DeletionTwoT2Normalizer.normalizedRhs]
      rfl
  | cons first rest =>
      have nonzero : encode (first :: rest) ≠ 0 := Nat.add_one_ne_zero _
      simp only [normalizedRhs, eval_ifZero, eval₂_projection_one, nonzero, ↓reduceIte,
        eval_cell, eval_size, eval_encodeWord, DeletionTwoT2Normalizer.normalizedRhs,
        List.cons_ne_nil]
      rfl

def normalizeProgram : PRCode 1 :=
  PRCode.composeBinary append
    (PRCode.composeBinary (mapWithParameter normalizedRhs) (PRCode.projection 0) (PRCode.projection 0))
    (PRCode.composeBinary cons
      (PRCode.composeBinary delayPair (PRCode.projection 0) (PRCode.constant 1 0))
      (PRCode.constant 1 0))

theorem eval_normalizeProgram_code (program : RogozhinTagInput.Program) :
    PRCode.eval₁ normalizeProgram (programCode program) =
      programCode (DeletionTwoT2Normalizer.normalizeProgram program) := by
  rw [normalizeProgram, eval₁_composeBinary, eval₁_composeBinary,
    eval₁_projection_zero, eval_mapWithParameter]
  have rows : (decode (programCode program)).map (PRCode.eval₂ normalizedRhs (programCode program)) =
      (program.productions.map (DeletionTwoT2Normalizer.normalizedRhs program)).map encode := by
    rw [programCode, decode_encode, List.map_map, List.map_map]
    exact DeterministicTapeThreeCounterComputability.map_pointwise _ _ _
      (eval_normalizedRhs program)
  rw [rows, eval₁_composeBinary, eval₁_composeBinary, eval₁_projection_zero,
    eval₁_constant, eval_delayPair, eval_cons]
  change PRCode.eval₂ append
      (encode ((program.productions.map (DeletionTwoT2Normalizer.normalizedRhs program)).map encode))
      (encode [encode [DeletionTwoT2Normalizer.delayLabel program, DeletionTwoT2Normalizer.delayLabel program]]) = _
  rw [eval_append, decode_encode, decode_encode]
  rw [programCode, DeletionTwoT2Normalizer.normalizeProgram, List.map_append]
  rfl

theorem eval_normalizeProgram (number : Nat) :
    PRCode.eval₁ normalizeProgram number =
      programCode (DeletionTwoT2Normalizer.normalizeProgram (programDecode number)) := by
  have correct := eval_normalizeProgram_code (programDecode number)
  rw [programCode_decode] at correct
  exact correct

def normalizeWord : PRCode 2 := PRCode.composeBinary append encodeWord delayPair

theorem eval_normalizeWord_code (program : RogozhinTagInput.Program) (word : List Nat) :
    PRCode.eval₂ normalizeWord (programCode program) (encode word) =
      encode (DeletionTwoT2Normalizer.normalizeWord program word) := by
  rw [normalizeWord, eval₂_composeBinary, eval_encodeWord, eval_delayPair,
    eval_append, decode_encode, decode_encode]
  rfl

theorem eval_normalizeWord (number word : Nat) :
    PRCode.eval₂ normalizeWord number word =
      encode (DeletionTwoT2Normalizer.normalizeWord (programDecode number) (decode word)) := by
  have correct := eval_normalizeWord_code (programDecode number) (decode word)
  rw [programCode_decode, encode_decode] at correct
  exact correct

def normalizeJob : PRCode 1 :=
  PRCode.composeBinary PRCode.cantorPair
    (PRCode.composeUnary normalizeProgram PRCode.cantorLeft)
    (PRCode.composeBinary normalizeWord PRCode.cantorLeft PRCode.cantorRight)

theorem eval_normalizeJob (number : Nat) :
    PRCode.eval₁ normalizeJob number = jobCode
      ⟨DeletionTwoT2Normalizer.normalizeProgram (jobDecode number).program,
        DeletionTwoT2Normalizer.normalizeWord (jobDecode number).program (jobDecode number).word⟩ := by
  rw [normalizeJob, eval₁_composeBinary, eval₁_composeUnary, eval₁_composeBinary,
    DeterministicTapeCode.eval₁_cantorLeft_eq_unpair_fst,
    DeterministicTapeCode.eval₁_cantorRight_eq_unpair_snd,
    eval_normalizeProgram, eval_normalizeWord,
    DeterministicTapeCode.eval₂_cantorPair_eq_termPair]
  rfl

end Program

theorem normalizeProgram_primitiveRecursive :
    PrimitiveRecursive (fun number =>
      programCode (DeletionTwoT2Normalizer.normalizeProgram (programDecode number))) :=
  ⟨Program.normalizeProgram, Program.eval_normalizeProgram⟩

theorem normalizeWord_primitiveRecursive :
    PrimitiveRecursive₂ (fun number word =>
      encode (DeletionTwoT2Normalizer.normalizeWord (programDecode number) (decode word))) :=
  ⟨Program.normalizeWord, Program.eval_normalizeWord⟩

theorem normalizedProgram_decode (number : Nat) :
    programDecode (PRCode.eval₁ Program.normalizeProgram number) =
      DeletionTwoT2Normalizer.normalizeProgram (programDecode number) := by
  rw [Program.eval_normalizeProgram, programDecode_code]

theorem normalizedJob_decode (number : Nat) :
    jobDecode (PRCode.eval₁ Program.normalizeJob number) =
      ⟨DeletionTwoT2Normalizer.normalizeProgram (jobDecode number).program,
        DeletionTwoT2Normalizer.normalizeWord (jobDecode number).program (jobDecode number).word⟩ := by
  rw [Program.eval_normalizeJob, jobDecode_code]

end PureSFormal.Computation.DeletionTwoT2Computability
