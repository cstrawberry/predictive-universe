import PureSFormal.AppendixF.RecursiveOrbit
import PureSFormal.AppendixF.PositiveBlocks

namespace PureSFormal.AppendixF.RecursiveCall
open PureSFormal.PureS
open PureSFormal.Research.FiniteTreeAutomatonPowerset

abbrev InternalConfiguration (Label : Type) := {c : Configuration Label // c.data.internal = true}

def pathSystem (table : Label → Admissible) : PositiveBlocks.System (InternalConfiguration Label) where
  term c := c.val.term table
  terms c := c.val.terms table
  next c := ⟨c.val.next table, rfl⟩
  native c := c.val.native table c.property
  positive c := by have := c.val.positive table; omega

theorem pathSystem_iterate (table : Label → Admissible) (c : InternalConfiguration Label) (n : Nat) :
    (FiniteOrbit.iterate (pathSystem table).next n c).val =
      FiniteOrbit.iterate (Configuration.next table) n c.val := by
  induction n with
  | zero => rfl
  | succ n ih => exact congrArg (Configuration.next table) ih

/-- Theorem F.4.3 for the entire infinite native path, not just block boundaries. -/
theorem eventuallyAccepts_path_iff [DecidableEq State] [DecidableEq Label] (a : Deterministic State)
    (labels : FiniteTables.Enumeration Label) (table : Label → Admissible) (c : InternalConfiguration Label) :
    eventuallyAccepts a labels table c.val = true ↔
      ∃ n, a.accepts ((pathSystem table).run n c) = true := by
  rw [eventuallyAccepts_correct a labels table c.val c.property]
  have bridge := (pathSystem table).observations_iff c (fun t => a.accepts t = true)
  change (∃ block term, term ∈ ((FiniteOrbit.iterate (pathSystem table).next block c).val).terms table ∧
    a.accepts term = true) ↔ ∃ n, a.accepts ((pathSystem table).run n c) = true at bridge
  simpa only [pathSystem_iterate] using bridge

end PureSFormal.AppendixF.RecursiveCall
