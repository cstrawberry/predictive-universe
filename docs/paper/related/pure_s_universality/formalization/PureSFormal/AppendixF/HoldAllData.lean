import PureSFormal.AppendixF.HoldLeaf
import PureSFormal.AppendixF.PrefixPath

namespace PureSFormal.AppendixF.RecursiveCall
open PureSFormal.PureS PureSFormal.AppendixF.HeadInvariant
local infixl:70 " ⊙ " => Term.app

def leafPathSystem (table : Label → Admissible) (n : Nat) (j : Label) (outer : Context) :=
  (pathSystem table).prepend (outer.plug ((Admissible.holds n).term ⊙ (Data.leaf j).term table))
    (leafTerms table n j outer) ⟨leafEndpoint table n j outer, rfl⟩
    (leaf_native table n j outer) (leaf_terms_positive table n j outer)

theorem leaf_path_good (table : Label → Admissible) (lengths : Label → Nat)
    (holds : ∀ j, table j = .holds (lengths j)) (n : Nat) (j : Label) (outer : Context)
    (passive : Passive outer) (k : Nat) : Good ((leafPathSystem table n j outer).run k none) := by
  apply PositiveBlocks.System.prepend_property (pathSystem table) _ _ _ _ _
    (fun c => Passive c.val.context)
  · intro c valid
    exact c.val.hold_next_passive table lengths holds valid
  · intro c valid
    exact c.val.hold_terms_good table lengths holds valid
  · exact leaf_endpoint_passive table n j outer passive
  · exact leaf_terms_good table n j outer passive

/-- Lemma F.4.1, including leaf data and any normal extra arguments: the
    literal native run is infinite and each sample has exactly one redex. -/
theorem hold_all_data (table : Label → Admissible) (lengths : Label → Nat)
    (holds : ∀ j, table j = .holds (lengths j)) (label : Label) (data : Data Label)
    (outer : Context) (passive : Passive outer) :
    ∃ run : Nat → Term,
      run 0 = outer.plug ((table label).term ⊙ data.term table) ∧
      (∀ k, Step (run k) (run (k + 1))) ∧ (∀ k, OneRedex (run k)) ∧
      (∀ t, Steps (run 0) t → OneRedex t ∧ NoPairs t) := by
  cases data with
  | leaf j =>
    let system := leafPathSystem table (lengths label) j outer
    have good := leaf_path_good table lengths holds (lengths label) j outer passive
    refine ⟨fun k => system.run k none, ?_, system.run_step none, fun k => (good k).1, ?_⟩
    · change system.run 0 none = _
      rw [system.run_zero, holds label]
      rfl
    · intro t reachable
      obtain ⟨k, same⟩ := all_reducts_on_path _ (system.run_step none) (fun k => (good k).1) reachable
      exact same ▸ good k
  | node left right =>
    let c : InternalConfiguration Label := ⟨⟨label, .node left right, outer⟩, rfl⟩
    have good := hold_path_good table lengths holds c passive
    refine ⟨fun k => (pathSystem table).run k c, (pathSystem table).run_zero c,
      (pathSystem table).run_step c, fun k => (good k).1, ?_⟩
    intro t reachable
    obtain ⟨k, same⟩ := all_reducts_on_path _ ((pathSystem table).run_step c) (fun k => (good k).1) reachable
    exact same ▸ good k

end PureSFormal.AppendixF.RecursiveCall
