import PureSFormal.Research.ProtectedTrieDeterministicCompiler
import PureSFormal.Research.ProtectedTrieMachineAgreement

/-!
# Independent relational agreement for the deterministic tape source

The target relation independently specifies lookup, cell replacement, and
left/stay/right motion with blank extension of a finite tape window. The
deterministic compiler always chooses occurrence slot zero. This is a
semantics agreement theorem, not a new universality theorem or a proof of
equivalence with a separately imported infinite-tape machine library.
-/

namespace PureSFormal.Computation.SourceChronologySourceModel

open PureSFormal.Research.ProtectedTrieDeterministicCompiler

abbrev TextbookStep (machine : DeterministicTape.Machine)
    (row next : DeterministicTape.Row) : Prop :=
  PureSFormal.Research.ProtectedTrieMachineAgreement.TextbookStep
    (compileMachine machine) row false next

theorem step_iff_textbook (machine : DeterministicTape.Machine)
    (row next : DeterministicTape.Row) :
    DeterministicTape.step? machine row = some next ↔ TextbookStep machine row next := by
  rw [← compile_step_slot0 machine row]
  exact PureSFormal.Research.ProtectedTrieMachineAgreement.step?_eq_some_iff_textbookStep
    (compileMachine machine) row next false

/-- Exactly n independently relational source steps. -/
inductive TextbookRun (machine : DeterministicTape.Machine) :
    Nat → DeterministicTape.Row → DeterministicTape.Row → Prop where
  | zero (row : DeterministicTape.Row) : TextbookRun machine 0 row row
  | succ {fuel : Nat} {initial next final : DeterministicTape.Row}
      (step : TextbookStep machine initial next)
      (rest : TextbookRun machine fuel next final) :
      TextbookRun machine (fuel + 1) initial final

theorem run_iff_textbook (machine : DeterministicTape.Machine) (fuel : Nat)
    (initial final : DeterministicTape.Row) :
    DeterministicTape.runFor? machine initial fuel = some final ↔
      TextbookRun machine fuel initial final := by
  induction fuel generalizing initial with
  | zero =>
      constructor
      · intro same
        cases same
        exact .zero final
      · intro run
        cases run
        rfl
  | succ fuel ih =>
      constructor
      · intro run
        cases stepped : DeterministicTape.step? machine initial with
        | none =>
            rw [DeterministicTape.runFor?, stepped] at run
            contradiction
        | some next =>
            rw [DeterministicTape.runFor?, stepped] at run
            exact .succ ((step_iff_textbook machine initial next).mp stepped) ((ih next).mp run)
      · intro run
        cases run with
        | succ stepped rest =>
            rw [DeterministicTape.runFor?, (step_iff_textbook machine _ _).mpr stepped]
            exact (ih _).mpr rest

end PureSFormal.Computation.SourceChronologySourceModel
