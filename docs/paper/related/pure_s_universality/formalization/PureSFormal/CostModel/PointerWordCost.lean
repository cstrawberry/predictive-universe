import PureSFormal.CostModel.FiniteArenaMachine

/-!
# Pointer-word instantiation of the finite shared arena

The structural arena ledger counts one-edge inspections and constant-arity
record mutations.  This module fixes a concrete binary representation for
node identifiers: a retained node is addressed by its duplicate-free list
index, using `log2(retainedCard)+1` bits.  Every `app` record contains one tag
and two such pointer words.  The theorems below prove that every retained
identifier and both fields of every application record fit that width.

This is the representation theorem needed to interpret a charged structural
operation on a pointer machine or logarithmic-word RAM.  It does not charge
the exponentially large tree readback.
-/

namespace PureSFormal.CostModel

open PureSFormal.PureS

namespace FiniteArena

variable {ι : Type}

/-- Binary code of a retained identifier in the store's duplicate-free
record table. -/
def pointerIndex [DecidableEq ι] (store : FiniteArena ι) (node : ι) : Nat :=
  store.retained.idxOf node

/-- Sufficient bit width for every retained identifier. -/
def pointerWordWidth (store : FiniteArena ι) : Nat :=
  Nat.log2 store.retainedCard + 1

/-- One tag bit and two pointer fields suffice for either node form. -/
def recordBitWidth (store : FiniteArena ι) : Nat :=
  1 + 2 * store.pointerWordWidth

/-- Bit charge obtained by expanding each constant-arity structural charge
to one whole record word. -/
def structuralBitCharge (store : FiniteArena ι) (operations : Nat) : Nat :=
  operations * store.recordBitWidth

theorem retainedCard_pos (store : FiniteArena ι) :
    0 < store.retainedCard := by
  unfold retainedCard
  rw [List.length_pos_iff]
  intro hempty
  have hroot := store.retained_complete store.arena.root
  simp [hempty] at hroot

theorem pointerIndex_lt_retainedCard [DecidableEq ι]
    (store : FiniteArena ι) (node : ι) :
    store.pointerIndex node < store.retainedCard := by
  exact List.idxOf_lt_length_of_mem (store.retained_complete node)

theorem retainedCard_lt_pointerCapacity (store : FiniteArena ι) :
    store.retainedCard < 2 ^ store.pointerWordWidth := by
  exact Nat.lt_log2_self

/-- Every node identifier has a binary representation of exactly the chosen
pointer-word width. -/
theorem pointerIndex_lt_pointerCapacity [DecidableEq ι]
    (store : FiniteArena ι) (node : ι) :
    store.pointerIndex node < 2 ^ store.pointerWordWidth :=
  Nat.lt_trans (store.pointerIndex_lt_retainedCard node)
    store.retainedCard_lt_pointerCapacity

/-- Public bit-representation contract for one concrete finite store. -/
structure PointerWordCertificate [DecidableEq ι]
    (store : FiniteArena ι) : Prop where
  positiveRecords : 0 < store.retainedCard
  everyPointerFits : ∀ node,
    store.pointerIndex node < 2 ^ store.pointerWordWidth
  applicationFieldsFit : ∀ node fn arg,
    store.arena.cell node = .app fn arg →
      store.pointerIndex fn < 2 ^ store.pointerWordWidth ∧
      store.pointerIndex arg < 2 ^ store.pointerWordWidth
  recordWidth : store.recordBitWidth = 1 + 2 * store.pointerWordWidth
  chargedBits : ∀ operations,
    store.structuralBitCharge operations =
      operations * store.recordBitWidth

theorem pointerWordCertificate [DecidableEq ι] (store : FiniteArena ι) :
    PointerWordCertificate store where
  positiveRecords := store.retainedCard_pos
  everyPointerFits := store.pointerIndex_lt_pointerCapacity
  applicationFieldsFit := by
    intro node fn arg _hcell
    exact ⟨store.pointerIndex_lt_pointerCapacity fn,
      store.pointerIndex_lt_pointerCapacity arg⟩
  recordWidth := rfl
  chargedBits := fun _ => rfl

end FiniteArena

end PureSFormal.CostModel
