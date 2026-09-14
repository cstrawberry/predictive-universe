import PureSFormal.AppendixF.FinitePathPrograms

namespace PureSFormal.AppendixF.MaximalPaths
open PureSFormal.PureS
open PureSFormal.Research.FiniteTreeAutomatonPowerset
open FinitePathPrograms

theorem Path.accepts_initial (a : Deterministic State) (path : Path start) (accepted : a.accepts start = true) :
    path.Accepts a := by
  cases path with
  | infinite run initial native => exact ⟨0, initial ▸ accepted⟩
  | finite terms last native normal =>
    cases native with
    | nil => exact Or.inr accepted
    | cons edge rest => exact Or.inl ⟨start, List.Mem.head _, accepted⟩

def prependOne (edge : Step start next) : Path next → Path start
  | .infinite run initial native =>
    .infinite (fun n => match n with | 0 => start | k + 1 => run k) rfl (by
      intro n
      cases n with
      | zero =>
        change Step start (run 0)
        rw [initial]
        exact edge
      | succ n => exact native n)
  | .finite terms last native normal => .finite (start :: terms) last (.cons edge native) normal

theorem prependOne_accepts (a : Deterministic State) (edge : Step start next) (path : Path next) :
    (prependOne edge path).Accepts a ↔ a.accepts start = true ∨ path.Accepts a := by
  cases path with
  | infinite run initial native =>
    constructor
    · rintro ⟨n, accepted⟩
      cases n with
      | zero => exact Or.inl accepted
      | succ n => exact Or.inr ⟨n, accepted⟩
    · intro accepted
      cases accepted with
      | inl accepted => exact ⟨0, accepted⟩
      | inr accepted => obtain ⟨n, accepted⟩ := accepted; exact ⟨n + 1, accepted⟩
  | finite terms last native normal =>
    simp only [prependOne, Path.Accepts, List.mem_cons]
    constructor
    · intro accepted
      cases accepted with
      | inr accepted => exact Or.inr (Or.inr accepted)
      | inl accepted =>
        obtain ⟨t, member, accepted⟩ := accepted
        cases member with
        | inl same => exact Or.inl (same ▸ accepted)
        | inr member => exact Or.inr (Or.inl ⟨t, member, accepted⟩)
    · intro accepted
      cases accepted with
      | inl accepted => exact Or.inl ⟨start, Or.inl rfl, accepted⟩
      | inr accepted =>
        cases accepted with
        | inr accepted => exact Or.inr accepted
        | inl accepted => obtain ⟨t, member, accepted⟩ := accepted; exact Or.inl ⟨t, Or.inr member, accepted⟩

def prependWalk (start : Term) (terms : List Term) (valid : Walk start terms)
    (path : Path (endpoint start terms)) : Path start :=
  match terms with
  | [] => path
  | next :: rest => prependOne valid.1 (prependWalk next rest valid.2 path)

theorem prependWalk_accepts (a : Deterministic State) (start : Term) (terms : List Term)
    (valid : Walk start terms) (path : Path (endpoint start terms)) :
    (prependWalk start terms valid path).Accepts a ↔
      (∃ t ∈ start :: terms, a.accepts t = true) ∨ path.Accepts a := by
  induction terms generalizing start with
  | nil =>
    constructor
    · intro accepted; exact Or.inr accepted
    · intro accepted
      cases accepted with
      | inr accepted => exact accepted
      | inl accepted =>
        obtain ⟨t, member, accepted⟩ := accepted
        have same := List.mem_singleton.mp member
        exact path.accepts_initial a (same ▸ accepted)
  | cons next rest ih =>
    change Path (endpoint next rest) at path
    change Step start next ∧ Walk next rest at valid
    change (prependOne valid.1 (prependWalk next rest valid.2 path)).Accepts a ↔ _
    rw [prependOne_accepts, ih next valid.2 path]
    constructor
    · intro accepted
      cases accepted with
      | inl accepted => exact Or.inl ⟨start, List.Mem.head _, accepted⟩
      | inr accepted =>
        cases accepted with
        | inr accepted => exact Or.inr accepted
        | inl accepted => obtain ⟨t, mem, accepted⟩ := accepted; exact Or.inl ⟨t, List.Mem.tail _ mem, accepted⟩
    · intro accepted
      cases accepted with
      | inr accepted => exact Or.inr (Or.inr accepted)
      | inl accepted =>
        obtain ⟨t, member, accepted⟩ := accepted
        cases List.mem_cons.mp member with
        | inl same => exact Or.inl (same ▸ accepted)
        | inr member => exact Or.inr (Or.inl ⟨t, member, accepted⟩)

end PureSFormal.AppendixF.MaximalPaths
