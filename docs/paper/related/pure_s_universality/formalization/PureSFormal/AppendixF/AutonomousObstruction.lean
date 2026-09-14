import PureSFormal.AppendixF.MaximalPaths
import PureSFormal.PureS.Clock

namespace PureSFormal.AppendixF.AutonomousObstruction
open PureSFormal.PureS PureSFormal.Computation
open PureSFormal.Research.FiniteTreeAutomatonPowerset
open MaximalPaths
local infixl:70 " ⊙ " => Term.app

noncomputable def eventualState (a : Deterministic State) (run : Nat → Term) (q : State) : Nat :=
  @ite Nat (∃ n, a.final (a.branch (a.eval (run n)) q) = true)
    (Classical.propDecidable _) 1 0

theorem eventualState_iff (a : Deterministic State) (run : Nat → Term) (q : State) :
    eventualState a run q = 1 ↔ ∃ n, a.final (a.branch (a.eval (run n)) q) = true := by
  classical
  simp only [eventualState, ite_eq_left_iff]
  simp

/-- F.1. The finite table is existential and nonuniform. Its lookup program
    is nevertheless closed code; no algorithm extracts the table from the path. -/
theorem autonomous_obstruction [DecidableEq State] (source : Nat → Prop)
    (undecidable : ¬ DecidableSet source) (a : Deterministic State)
    (component : Term) (run : Nat → Term) (initial : run 0 = component)
    (native : ∀ n, Step (run n) (run (n + 1))) (payload : Nat → Term)
    (effective : PartialRecursive.Computable (fun x => (payload x).code)) :
    ¬ Exact source (fun x => component ⊙ payload x) a := by
  intro exactness
  apply undecidable
  refine ⟨fun x => eventualState a run (a.eval (payload x)),
    AutomatonComputability.computable_observation a (eventualState a run) payload effective, ?_⟩
  intro x
  let path : Path (component ⊙ payload x) := .infinite (fun n => run n ⊙ payload x)
    (congrArg (fun t => t ⊙ payload x) initial) (fun n => .appLeft (native n) (payload x))
  exact (exactness x path).trans (eventualState_iff a run (a.eval (payload x))).symm

def clockConfiguration : Carrier.Configuration := ⟨.base .s .s, .base .s .s, .hole⟩

theorem clock_infinite : ∃ run : Nat → Term, run 0 = C 0 ⊙ C 0 ∧
    ∀ n, Step (run n) (run (n + 1)) := by
  refine ⟨fun n => clockConfiguration.run n, ?_, clockConfiguration.run_step⟩
  exact clockConfiguration.run_zero

/-- Main-encoder corollary: every computable payload behind the literal outer clock. -/
theorem clock_encoder_obstruction [DecidableEq State] (source : Nat → Prop)
    (undecidable : ¬ DecidableSet source) (a : Deterministic State) (payload : Nat → Term)
    (effective : PartialRecursive.Computable (fun x => (payload x).code)) :
    ¬ Exact source (fun x => (C 0 ⊙ C 0) ⊙ payload x) a := by
  obtain ⟨run, initial, native⟩ := clock_infinite
  exact autonomous_obstruction source undecidable a _ run initial native payload effective

end PureSFormal.AppendixF.AutonomousObstruction
