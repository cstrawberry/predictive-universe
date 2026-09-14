import PureSFormal.Research.FiniteTreeAutomatonPowerset

/-! Compilation from explicitly enumerated state types to indexed finite
automata. The enumeration need not be duplicate-free. -/
namespace PureSFormal.Research.FiniteTreeAutomatonEnumeration
open PureSFormal.PureS FiniteTreeAutomatonPowerset

structure Automaton (State : Type) where
  cover : List State
  covers : ∀ state, state ∈ cover
  leaf : State → Bool
  branch : State → State → State → Bool
  final : State → Bool

inductive Run (automaton : Automaton State) : Term → State → Prop where
  | leaf {state} : automaton.leaf state = true → Run automaton .s state
  | branch {left right lstate rstate state} :
      Run automaton left lstate → Run automaton right rstate →
      automaton.branch lstate rstate state = true → Run automaton (.app left right) state

def Automaton.Accepts (automaton : Automaton State) (source : Term) : Prop :=
  ∃ state, Run automaton source state ∧ automaton.final state = true

theorem member_index {α : Type} {values : List α} {value : α}
    (member : value ∈ values) : ∃ index : Fin values.length, values.get index = value := by
  induction member with
  | head => exact ⟨⟨0, Nat.zero_lt_succ _⟩, rfl⟩
  | tail other rest ih =>
    obtain ⟨index, equal⟩ := ih
    exact ⟨index.succ, equal⟩

def indexed (automaton : Automaton State) : Nondeterministic automaton.cover.length where
  leaf := Bits.tabulate _ (fun index => automaton.leaf (automaton.cover.get index))
  branch left right := Bits.tabulate _ (fun index =>
    automaton.branch (automaton.cover.get left) (automaton.cover.get right)
      (automaton.cover.get index))
  final := Bits.tabulate _ (fun index => automaton.final (automaton.cover.get index))

theorem indexed_run_iff (automaton : Automaton State) (source : Term)
    (index : Fin automaton.cover.length) :
    FiniteTreeAutomatonPowerset.Run (indexed automaton) source index ↔
      Run automaton source (automaton.cover.get index) := by
  induction source generalizing index with
  | s =>
    constructor
    · intro actual
      cases actual with
      | leaf accepted =>
        exact Run.leaf ((Bits.get_tabulate _ _ _).symm.trans accepted)
    · intro actual
      cases actual with
      | leaf accepted =>
        exact FiniteTreeAutomatonPowerset.Run.leaf ((Bits.get_tabulate _ _ _).trans accepted)
  | app left right leftIH rightIH =>
    constructor
    · intro actual
      cases actual with
      | branch leftRun rightRun accepted =>
        exact Run.branch ((leftIH _).mp leftRun) ((rightIH _).mp rightRun)
          ((Bits.get_tabulate _ _ _).symm.trans accepted)
    · intro actual
      cases actual with
      | @branch _ _ lstate rstate _ leftRun rightRun accepted =>
        obtain ⟨lindex, leftEq⟩ := member_index (automaton.covers lstate)
        obtain ⟨rindex, rightEq⟩ := member_index (automaton.covers rstate)
        apply FiniteTreeAutomatonPowerset.Run.branch
          ((leftIH lindex).mpr (leftEq.symm ▸ leftRun))
          ((rightIH rindex).mpr (rightEq.symm ▸ rightRun))
        change (Bits.tabulate _ _).get _ = true
        rw [Bits.get_tabulate, leftEq, rightEq]
        exact accepted

theorem indexed_accepts_iff (automaton : Automaton State) (source : Term) :
    (indexed automaton).Accepts source ↔ automaton.Accepts source := by
  constructor
  · rintro ⟨index, actual, accepted⟩
    exact ⟨automaton.cover.get index, (indexed_run_iff _ _ _).mp actual,
      (Bits.get_tabulate _ _ _).symm.trans accepted⟩
  · rintro ⟨state, actual, accepted⟩
    obtain ⟨index, equal⟩ := member_index (automaton.covers state)
    refine ⟨index, (indexed_run_iff _ _ _).mpr (equal.symm ▸ actual), ?_⟩
    change (Bits.tabulate _ _).get _ = true
    rw [Bits.get_tabulate, equal]
    exact accepted

def deterministic (automaton : Automaton State) : Deterministic (Bits automaton.cover.length) :=
  determinize (indexed automaton)

theorem deterministic_accepts_iff (automaton : Automaton State) (source : Term) :
    (deterministic automaton).accepts source = true ↔ automaton.Accepts source := by
  exact (determinize_accepts_iff _ _).trans (indexed_accepts_iff _ _)

theorem complement_accepts_iff (automaton : Automaton State) (source : Term) :
    (complement (deterministic automaton)).accepts source = true ↔ ¬ automaton.Accepts source := by
  exact (complement_determinize_iff _ _).trans (not_congr (indexed_accepts_iff _ _))

end PureSFormal.Research.FiniteTreeAutomatonEnumeration
