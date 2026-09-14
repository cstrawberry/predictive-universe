import PureSFormal.AppendixF.PositiveBlocks

namespace PureSFormal.AppendixF.PositiveBlocks
open PureSFormal.PureS
open PureSFormal.AppendixF.Carrier (Trace)

def System.prepend (system : System Config) (start : Term) (segment : List Term)
    (target : Config) (native : Trace start segment (system.term target))
    (positive : 0 < segment.length) : System (Option Config) where
  term c := match c with | none => start | some c => system.term c
  terms c := match c with | none => segment | some c => system.terms c
  next c := some (match c with | none => target | some c => system.next c)
  native c := by cases c with | none => exact native | some c => exact system.native c
  positive c := by cases c with | none => exact positive | some c => exact system.positive c

theorem System.run_property (system : System Config) (invariant : Config → Prop)
    (preserved : ∀ c, invariant c → invariant (system.next c)) (property : Term → Prop)
    (blocks : ∀ c, invariant c → ∀ t ∈ system.terms c, property t)
    (initial : Config) (valid : invariant initial) (n : Nat) : property (system.run n initial) := by
  have allValid : ∀ block, invariant (FiniteOrbit.iterate system.next block initial) := by
    intro block
    induction block with
    | zero => exact valid
    | succ block ih => exact preserved _ ih
  obtain ⟨block, member⟩ := system.run_in_block initial n
  exact blocks _ (allValid block) _ member

theorem System.prepend_property (system : System Config) (start : Term) (segment : List Term)
    (target : Config) (native : Trace start segment (system.term target))
    (positive : 0 < segment.length) (invariant : Config → Prop)
    (preserved : ∀ c, invariant c → invariant (system.next c)) (property : Term → Prop)
    (blocks : ∀ c, invariant c → ∀ t ∈ system.terms c, property t)
    (valid : invariant target) (segmentValid : ∀ t ∈ segment, property t) (n : Nat) :
    property ((system.prepend start segment target native positive).run n none) := by
  apply System.run_property _ (fun c => match c with | none => True | some c => invariant c)
  · intro c hc
    cases c with
    | none => exact valid
    | some c => exact preserved c hc
  · intro c hc
    cases c with
    | none => exact segmentValid
    | some c => exact blocks c hc
  · trivial

end PureSFormal.AppendixF.PositiveBlocks
