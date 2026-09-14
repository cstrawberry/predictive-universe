import PureSFormal.CTS.Core

/-!
# Constructive data cases for bounded scheduler jobs

Every finite job either keeps a nonempty CTS word throughout its fuel horizon,
or has a least empty iterate.  The least-index certificate is computed by
induction on the finite horizon and introduces no logical choice.
-/

namespace PureSFormal.PureS

namespace SchedulerStageCases

/-- The first empty CTS word within a named finite horizon. -/
structure FirstEmpty
    (program : CTS.Program) (bits : List Bool) (fuel : Nat) : Type where
  index : Nat
  bound : index ≤ fuel
  empty : (CTS.iterate program index (CTS.initial program bits)).data = []
  before : ∀ earlier, earlier < index →
    (CTS.iterate program earlier (CTS.initial program bits)).data ≠ []

/-- Constructive finite classification, retaining either the universal proof
or the explicit least-empty witness as data. -/
inductive Classification
    (program : CTS.Program) (bits : List Bool) (fuel : Nat) : Type where
  | allNonempty
      (holds : ∀ index, index ≤ fuel →
        (CTS.iterate program index (CTS.initial program bits)).data ≠ [])
  | firstEmpty (first : FirstEmpty program bits fuel)

/-- A finite CTS trajectory is exhaustively classified without minimization
or an appeal to classical choice. -/
def allNonempty_or_firstEmpty
    (program : CTS.Program) (bits : List Bool) : ∀ fuel,
    Classification program bits fuel
  | 0 => by
      by_cases empty :
          (CTS.iterate program 0 (CTS.initial program bits)).data = []
      · exact .firstEmpty
          { index := 0
            bound := Nat.le_refl 0
            empty := empty
            before := fun earlier earlierLt =>
              (Nat.not_lt_zero earlier earlierLt).elim }
      · exact .allNonempty (fun index bound => by
          have indexEq : index = 0 := Nat.le_zero.mp bound
          subst index
          exact empty)
  | fuel + 1 => by
      cases allNonempty_or_firstEmpty program bits fuel with
      | firstEmpty first =>
          exact .firstEmpty
            { index := first.index
              bound := Nat.le_trans first.bound (Nat.le_succ fuel)
              empty := first.empty
              before := first.before }
      | allNonempty allBefore =>
          by_cases empty :
              (CTS.iterate program (fuel + 1)
                (CTS.initial program bits)).data = []
          · exact .firstEmpty
              { index := fuel + 1
                bound := Nat.le_refl (fuel + 1)
                empty := empty
                before := fun earlier earlierLt =>
                  allBefore earlier (Nat.lt_succ_iff.mp earlierLt) }
          · apply Classification.allNonempty
            intro index bound
            rcases Nat.lt_or_eq_of_le bound with earlier | final
            · exact allBefore index (Nat.lt_succ_iff.mp earlier)
            · subst index
              exact empty

/-- A nonempty encoded input rules out a least empty index at time zero. -/
theorem FirstEmpty.index_ne_zero
    {program : CTS.Program} {bit : Bool} {suffix : List Bool} {fuel : Nat}
    (first : FirstEmpty program (bit :: suffix) fuel) : first.index ≠ 0 := by
  obtain ⟨index, bound, empty, before⟩ := first
  change index ≠ 0
  intro zero
  rw [zero] at empty
  cases empty

/-- For a nonempty seed, a least empty iterate is one transition after a
fully nonempty prefix. -/
theorem FirstEmpty.split_nonemptySeed
    {program : CTS.Program} {bit : Bool} {suffix : List Bool} {fuel : Nat}
    (first : FirstEmpty program (bit :: suffix) fuel) :
    ∃ previous,
      first.index = previous + 1 ∧
      previous + 1 ≤ fuel ∧
      (∀ index, index ≤ previous →
        (CTS.iterate program index
          (CTS.initial program (bit :: suffix))).data ≠ []) ∧
      (CTS.iterate program (previous + 1)
        (CTS.initial program (bit :: suffix))).data = [] := by
  obtain ⟨index, bound, empty, before⟩ := first
  change ∃ previous,
    index = previous + 1 ∧ previous + 1 ≤ fuel ∧
      (∀ earlier, earlier ≤ previous →
        (CTS.iterate program earlier
          (CTS.initial program (bit :: suffix))).data ≠ []) ∧
      (CTS.iterate program (previous + 1)
        (CTS.initial program (bit :: suffix))).data = []
  cases index with
  | zero => cases empty
  | succ previous =>
      refine ⟨previous, rfl, bound, ?_, empty⟩
      intro index bound
      exact before index (Nat.lt_succ_iff.mpr bound)

/-- At a positive scheduler stage, a first-empty witness for a nonempty seed
splits the stage fuel into the last nonempty index and the number of absorbing
steps that follow the first empty transition. -/
theorem FirstEmpty.split_positiveStage
    {program : CTS.Program} {bit : Bool} {suffix : List Bool} {fuel : Nat}
    (first : FirstEmpty program (bit :: suffix) (fuel + 1)) :
    ∃ previous remaining,
      previous + remaining = fuel ∧
      (∀ index, index ≤ previous →
        (CTS.iterate program index
          (CTS.initial program (bit :: suffix))).data ≠ []) ∧
      (CTS.iterate program (previous + 1)
        (CTS.initial program (bit :: suffix))).data = [] := by
  obtain ⟨previous, indexEq, bound, priorNonempty, empty⟩ :=
    first.split_nonemptySeed
  have previousLe : previous ≤ fuel := by
    exact Nat.succ_le_succ_iff.mp bound
  refine ⟨previous, fuel - previous, Nat.add_sub_of_le previousLe,
    priorNonempty, empty⟩

end SchedulerStageCases

end PureSFormal.PureS
