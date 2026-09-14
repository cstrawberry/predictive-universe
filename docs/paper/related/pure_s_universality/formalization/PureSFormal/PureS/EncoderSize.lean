import PureSFormal.PureS.Clock

/-!
# Exact linear encoder size

The fixed dispatcher contributes only an input-independent constant.  A
literal zero cell adds sixteen syntax-tree nodes and a literal one cell adds
eighteen.  This yields both the exact weighted formula and the sharp uniform
coefficient eighteen used in the manuscript.
-/

namespace PureSFormal.PureS

/-- Exact syntax-tree increment contributed by one live bit wrapper. -/
def liveSizeIncrement (bit : Bool) : Nat :=
  if bit then 18 else 16

/-- Number of zero symbols in an encoded binary word. -/
def zeroCount : List Bool → Nat
  | [] => 0
  | false :: bits => zeroCount bits + 1
  | true :: bits => zeroCount bits

/-- Number of one symbols in an encoded binary word. -/
def oneCount : List Bool → Nat
  | [] => 0
  | false :: bits => oneCount bits
  | true :: bits => oneCount bits + 1

@[simp]
theorem liveSizeIncrement_false : liveSizeIncrement false = 16 :=
  rfl

@[simp]
theorem liveSizeIncrement_true : liveSizeIncrement true = 18 :=
  rfl

/-- The pointwise weight sum is the paper's `16 #0 + 18 #1`. -/
theorem sum_liveSizeIncrement_eq_counts (bits : List Bool) :
    (bits.map liveSizeIncrement).sum =
      16 * zeroCount bits + 18 * oneCount bits := by
  induction bits with
  | nil => rfl
  | cons bit bits ih =>
      cases bit <;>
        simp only [List.map_cons, liveSizeIncrement_false,
          liveSizeIncrement_true, List.sum_cons, zeroCount, oneCount, ih,
          Nat.mul_succ] <;>
        simp [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]

/-- Exact size of a live-cell fold over an arbitrary starting term. -/
theorem size_foldl_live_exact (bits : List Bool) (start : Term) :
    (bits.foldl (fun tail bit => .app (live bit) tail) start).size =
      start.size + (bits.map liveSizeIncrement).sum := by
  induction bits generalizing start with
  | nil => simp
  | cons bit bits ih =>
      rw [List.foldl_cons, ih]
      cases bit <;> simp only [Term.size, size_live_false, size_live_true,
        List.map_cons, liveSizeIncrement_false, liveSizeIncrement_true,
        List.sum_cons]
      · calc
          15 + start.size + 1 + (bits.map liveSizeIncrement).sum =
              (15 + 1 + start.size) +
                (bits.map liveSizeIncrement).sum := by
            rw [Nat.add_assoc 15 start.size 1, Nat.add_comm start.size 1,
              ← Nat.add_assoc 15 1 start.size]
          _ = (16 + start.size) +
                (bits.map liveSizeIncrement).sum := rfl
          _ = (start.size + 16) +
                (bits.map liveSizeIncrement).sum := by
            rw [Nat.add_comm 16 start.size]
          _ = start.size +
                (16 + (bits.map liveSizeIncrement).sum) :=
            Nat.add_assoc _ _ _
      · calc
          17 + start.size + 1 + (bits.map liveSizeIncrement).sum =
              (17 + 1 + start.size) +
                (bits.map liveSizeIncrement).sum := by
            rw [Nat.add_assoc 17 start.size 1, Nat.add_comm start.size 1,
              ← Nat.add_assoc 17 1 start.size]
          _ = (18 + start.size) +
                (bits.map liveSizeIncrement).sum := rfl
          _ = (start.size + 18) +
                (bits.map liveSizeIncrement).sum := by
            rw [Nat.add_comm 18 start.size]
          _ = start.size +
                (18 + (bits.map liveSizeIncrement).sum) :=
            Nat.add_assoc _ _ _

/-- Exact weighted size of the literal word encoding. -/
theorem size_word_exact (bits : List Bool) :
    (word bits).size = 1 + (bits.map liveSizeIncrement).sum := by
  simpa [word, omega] using size_foldl_live_exact bits omega

/-- Size of the live-cell fold over an arbitrary starting term. -/
theorem size_foldl_live_le (bits : List Bool) (start : Term) :
    (bits.foldl (fun tail bit => .app (live bit) tail) start).size ≤
      start.size + 18 * bits.length := by
  induction bits generalizing start with
  | nil => simp
  | cons bit bits ih =>
      have htag : (live bit).size ≤ 17 := by
        cases bit <;> simp
      have hstart :
          (Term.app (live bit) start).size ≤ start.size + 18 := by
        calc
          (Term.app (live bit) start).size =
              (live bit).size + start.size + 1 := by
            simp only [Term.size]
          _ ≤ 17 + start.size + 1 :=
            Nat.add_le_add_right (Nat.add_le_add_right htag start.size) 1
          _ = start.size + 18 := by
            rw [Nat.add_comm 17 start.size, Nat.add_assoc]
      calc
        ((bit :: bits).foldl (fun tail found => Term.app (live found) tail)
            start).size =
            (bits.foldl (fun tail found => Term.app (live found) tail)
              (Term.app (live bit) start)).size := rfl
        _ ≤ (Term.app (live bit) start).size + 18 * bits.length :=
          ih (Term.app (live bit) start)
        _ ≤ (start.size + 18) + 18 * bits.length :=
          Nat.add_le_add_right hstart _
        _ = start.size + 18 * (bit :: bits).length := by
          simp [Nat.mul_succ, Nat.add_assoc, Nat.add_comm,
            Nat.add_left_comm]

/-- A compiled word has at most eighteen nodes per input bit plus `omega`. -/
theorem size_word_le (bits : List Bool) :
    (word bits).size ≤ 1 + 18 * bits.length := by
  simpa [word, omega] using size_foldl_live_le bits omega

/-- Exact separation of the fixed action-code size from the input word. -/
theorem size_generator_exact (actions : Term) (bits : List Bool) :
    (generator actions bits).size = 39 + actions.size + (word bits).size := by
  simp only [generator, environmentCode, dispatcherCode, actCode, seedCode,
    haltCode, haltTag, C, b, Term.size]
  simp [Nat.succ_eq_add_one, Nat.add_assoc, Nat.add_comm,
    Nat.add_left_comm]
  repeat rw [← Nat.add_assoc]

/-- The input-independent constant used in the linear encoder bound. -/
def encoderConstant (actions : Term) : Nat :=
  40 + actions.size

/-- Exact weighted form of the manuscript encoder equation. -/
theorem generator_size_weighted_exact (actions : Term) (bits : List Bool) :
    (generator actions bits).size =
      encoderConstant actions + (bits.map liveSizeIncrement).sum := by
  rw [size_generator_exact, size_word_exact]
  change 39 + actions.size + (1 + (bits.map liveSizeIncrement).sum) =
    (40 + actions.size) + (bits.map liveSizeIncrement).sum
  rw [← Nat.add_assoc]
  congr 1
  calc
    39 + actions.size + 1 = 39 + (actions.size + 1) :=
      Nat.add_assoc _ _ _
    _ = 39 + (1 + actions.size) := by rw [Nat.add_comm actions.size 1]
    _ = 39 + 1 + actions.size := (Nat.add_assoc _ _ _).symm
    _ = 40 + actions.size := rfl

/-- Exact paper form `40 + |Actions| + 16 #0 + 18 #1`. -/
theorem generator_size_counts_exact (actions : Term) (bits : List Bool) :
    (generator actions bits).size =
      encoderConstant actions +
        (16 * zeroCount bits + 18 * oneCount bits) := by
  rw [generator_size_weighted_exact, sum_liveSizeIncrement_eq_counts]

/-- Sharp uniform manuscript bound (S1): `|G_w| ≤ c_A + 18 |w|`. -/
theorem generator_size_le_eighteen (actions : Term) (bits : List Bool) :
    (generator actions bits).size ≤
      encoderConstant actions + 18 * bits.length := by
  rw [generator_size_weighted_exact]
  apply Nat.add_le_add_left
  induction bits with
  | nil => exact Nat.le_refl _
  | cons bit bits ih =>
      cases bit
      · simp only [List.map_cons, liveSizeIncrement_false, List.sum_cons,
          List.length_cons, Nat.mul_succ]
        calc
          16 + (bits.map liveSizeIncrement).sum ≤
              18 + (bits.map liveSizeIncrement).sum :=
            Nat.add_le_add_right (by decide : 16 ≤ 18) _
          _ ≤ 18 + 18 * bits.length := Nat.add_le_add_left ih 18
          _ = 18 * bits.length + 18 := Nat.add_comm _ _
      · simp only [List.map_cons, liveSizeIncrement_true, List.sum_cons,
          List.length_cons, Nat.mul_succ]
        calc
          18 + (bits.map liveSizeIncrement).sum ≤
              18 + 18 * bits.length := Nat.add_le_add_left ih 18
          _ = 18 * bits.length + 18 := Nat.add_comm _ _

/-- Coefficient-forty upper bound for the generator size. -/
theorem generator_size_le (actions : Term) (bits : List Bool) :
    (generator actions bits).size ≤
      encoderConstant actions + 40 * bits.length := by
  rw [size_generator_exact]
  have hword := size_word_le bits
  have hcoefficient : 18 * bits.length ≤ 40 * bits.length :=
    Nat.mul_le_mul_right bits.length (by decide : 18 ≤ 40)
  calc
    39 + actions.size + (word bits).size ≤
        39 + actions.size + (1 + 18 * bits.length) :=
      Nat.add_le_add_left hword _
    _ = encoderConstant actions + 18 * bits.length := by
      have hforty : 39 + actions.size + 1 = 40 + actions.size := by
        rw [Nat.add_assoc, Nat.add_comm actions.size 1, ← Nat.add_assoc]
      rw [encoderConstant, ← Nat.add_assoc, hforty]
    _ ≤ encoderConstant actions + 40 * bits.length :=
      Nat.add_le_add_left hcoefficient _

end PureSFormal.PureS
