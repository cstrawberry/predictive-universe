import PureSFormal.Research.RootResetAppenderFiniteRows
import PureSFormal.PureS.SchedulerResponseInvariant

/-! Every actual unfinished appender mutation matches one finite compiler row. -/
namespace PureSFormal.Research.RootResetAppenderMutationFiniteRows
open PureSFormal.PureS
open SchedulerResponseInvariant RootResetAppenderFiniteRows

theorem mutation_spec {expected : Nat} {remaining : List Bool} {initial : Term}
    {outer : List Term} {done : Bool} {source : Term}
    (progress : ActionMutation expected remaining initial outer done source) (unfinished : done = false) :
    ∃ spec ∈ specsFrom outer.length remaining, spec.pattern.matchesBool source = true := by
  induction progress with
  | first bit rest initial outer count =>
      exact ⟨Spec.first bit rest outer.length, List.Mem.head _, first_matches bit rest initial initial outer⟩
  | second bit rest initial outer count =>
      cases rest with
      | nil => cases unfinished
      | cons next tail =>
          exact ⟨Spec.second next tail outer.length, List.Mem.tail _ (List.Mem.head _),
            second_matches next tail (extendAccumulator bit initial) (pushHistory bit initial) outer⟩
  | @inner bit rest initial outer done source progress ih =>
      obtain ⟨spec, member, matched⟩ := ih unfinished
      refine ⟨spec, List.Mem.tail _ (List.mem_append_right _ ?_), matched⟩
      exact member

end PureSFormal.Research.RootResetAppenderMutationFiniteRows
