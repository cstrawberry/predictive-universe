import PureSFormal.Research.ProtectedTrieSeed

/-!
# Exact size of the protected-trie encoder

The frozen seed is a literal normal-form bit list.  A zero contributes four
syntax nodes and a one contributes six.  The protected-trie generator and
outer two-field header are fixed constants, yielding the public linear bound
`encoder bits ≤ 41 + 6 * bits.length`.
-/

namespace PureSFormal.Research.ProtectedTrieEncoderSize

open PureSFormal.PureS
open PureSFormal.Research.ProtectedTrieAlgebra
open PureSFormal.Research.ProtectedTrieParser
open PureSFormal.Research.ProtectedTrieSeed

/-- Exact syntax contribution of one frozen seed bit. -/
def seedBitCost : Bool -> Nat
  | false => 4
  | true => 6

/-- Exact unshared syntax-tree size of the normal frozen seed. -/
theorem N_size (bits : List Bool) :
    (N bits).size = 1 + (bits.map seedBitCost).sum := by
  induction bits with
  | nil => rfl
  | cons bit bits ih =>
      cases bit <;>
        simp [N, passive, b, seedBitCost, ih, Nat.add_assoc,
          Nat.add_comm, Nat.add_left_comm]

/-- Every frozen bit contributes at most six syntax nodes. -/
theorem sum_seedBitCost_le (bits : List Bool) :
    (bits.map seedBitCost).sum <= 6 * bits.length := by
  induction bits with
  | nil => exact Nat.le_refl 0
  | cons bit bits ih =>
      have hbit : seedBitCost bit <= 6 := by
        cases bit <;> decide
      calc
        ((bit :: bits).map seedBitCost).sum =
            seedBitCost bit + (bits.map seedBitCost).sum := rfl
        _ <= 6 + 6 * bits.length := Nat.add_le_add hbit ih
        _ = 6 * (bit :: bits).length := by
          simp only [List.length_cons, Nat.mul_succ]
          exact Nat.add_comm _ _

theorem N_size_le (bits : List Bool) :
    (N bits).size <= 1 + 6 * bits.length := by
  rw [N_size]
  exact Nat.add_le_add_left (sum_seedBitCost_le bits) 1

/-- The initial changing generator `D₂,₂` has fixed size 37. -/
@[simp]
theorem D_two_two_size : (D 2 2).size = 37 := by
  decide

/-- Exact outer-header size as a sum of its two literal fields. -/
theorem seededHeader_size (bits : List Bool) (body : Term) :
    (seededHeader bits body).size = (N bits).size + body.size + 3 := by
  simp [seededHeader, header, passive, Nat.add_assoc, Nat.add_comm,
    Nat.add_left_comm]
  rw [Nat.add_comm 3 (body.size + (N bits).size)]
  simp only [Nat.one_add]

/-- The complete protected-trie initial term has a uniform linear size bound. -/
theorem encoder_size_le (bits : List Bool) :
    (encoder bits).size <= 41 + 6 * bits.length := by
  unfold encoder
  rw [seededHeader_size, D_two_two_size]
  calc
    (N bits).size + 37 + 3 = (N bits).size + 40 := by rfl
    _ <= (1 + 6 * bits.length) + 40 :=
      Nat.add_le_add_right (N_size_le bits) 40
    _ = 41 + 6 * bits.length := by
      rw [Nat.add_comm (1 + 6 * bits.length) 40, ← Nat.add_assoc]

end PureSFormal.Research.ProtectedTrieEncoderSize
