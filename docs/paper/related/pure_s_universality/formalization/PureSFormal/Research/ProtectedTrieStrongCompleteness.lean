import PureSFormal.Computation.Enumerable
import PureSFormal.Research.ProtectedTrieStrongTheorem

/-!
# Executable contextual reduction enumeration and terminal observation

This module supplies the finite search layer used by the strong terminal
language.  It enumerates every occurrence address of a finite pure-`S` term,
executes every available contraction at those addresses, and proves exact
agreement with the relational contextual rule.  Iterating that finite list
enumerates every bounded reduction layer.  The terminal test is the fixed
literal labelled observer; it never performs a target reduction or a source
transition replay.
-/

namespace PureSFormal.Research.ProtectedTrieStrongCompleteness

open PureSFormal.Computation
open PureSFormal.PureS
open PureSFormal.Research.ProtectedTrieLabelledObserver
open PureSFormal.Research.ProtectedTrieMachine
open PureSFormal.Research.ProtectedTrieStrong
open PureSFormal.Research.ProtectedTrieTableau

/-! The core library's generic `List.mem_map`, `List.mem_filterMap`, and
`List.mem_flatMap` proofs pass through quotient infrastructure.  The four
elementary structural lemmas below keep this executable search layer inside
the release's `propext`-only trusted profile. -/

theorem mem_map_iff_structural {alpha beta : Type} (value : beta)
    (items : List alpha) (f : alpha -> beta) :
    value ∈ items.map f <->
      exists item, item ∈ items /\ f item = value := by
  induction items with
  | nil =>
      constructor
      · intro hmem
        cases hmem
      · rintro ⟨item, hmem, _⟩
        cases hmem
  | cons head tail ih =>
      constructor
      · intro hmem
        rcases List.mem_cons.mp hmem with heq | htail
        · exact ⟨head, List.Mem.head tail, heq.symm⟩
        · obtain ⟨item, hitem, heq⟩ := ih.mp htail
          exact ⟨item, List.Mem.tail head hitem, heq⟩
      · rintro ⟨item, hitem, heq⟩
        rcases List.mem_cons.mp hitem with hhead | htail
        · subst item
          have hmem : f head ∈ f head :: tail.map f := List.Mem.head _
          exact heq ▸ hmem
        · exact List.Mem.tail (f head) (ih.mpr ⟨item, htail, heq⟩)

theorem mem_filterMap_iff_structural {alpha beta : Type} (value : beta)
    (items : List alpha) (f : alpha -> Option beta) :
    value ∈ items.filterMap f <->
      exists item, item ∈ items /\ f item = some value := by
  induction items with
  | nil =>
      constructor
      · intro hmem
        cases hmem
      · rintro ⟨item, hmem, _⟩
        cases hmem
  | cons head tail ih =>
      cases hhead : f head with
      | none =>
          simp only [List.filterMap, hhead]
          change value ∈ tail.filterMap f <-> _
          constructor
          · intro hmem
            obtain ⟨item, hitem, heq⟩ := ih.mp hmem
            exact ⟨item, List.Mem.tail head hitem, heq⟩
          · rintro ⟨item, hitem, heq⟩
            rcases List.mem_cons.mp hitem with hsame | htail
            · subst item
              rw [hhead] at heq
              contradiction
            · exact ih.mpr ⟨item, htail, heq⟩
      | some mapped =>
          simp only [List.filterMap, hhead]
          change value ∈ mapped :: tail.filterMap f <-> _
          constructor
          · intro hmem
            rcases List.mem_cons.mp hmem with heq | htail
            · subst value
              exact ⟨head, List.Mem.head tail, hhead⟩
            · obtain ⟨item, hitem, heq⟩ := ih.mp htail
              exact ⟨item, List.Mem.tail head hitem, heq⟩
          · rintro ⟨item, hitem, heq⟩
            rcases List.mem_cons.mp hitem with hsame | htail
            · subst item
              rw [hhead] at heq
              cases heq
              exact List.Mem.head _
            · exact List.Mem.tail mapped (ih.mpr ⟨item, htail, heq⟩)

theorem mem_flatMap_iff_structural {alpha beta : Type} (value : beta)
    (items : List alpha) (f : alpha -> List beta) :
    value ∈ items.flatMap f <->
      exists item, item ∈ items /\ value ∈ f item := by
  induction items with
  | nil =>
      constructor
      · intro hmem
        cases hmem
      · rintro ⟨item, hmem, _⟩
        cases hmem
  | cons head tail ih =>
      rw [List.flatMap_cons, List.mem_append]
      constructor
      · intro hmem
        rcases hmem with hhead | htail
        · exact ⟨head, List.Mem.head tail, hhead⟩
        · obtain ⟨item, hitem, hvalue⟩ := ih.mp htail
          exact ⟨item, List.Mem.tail head hitem, hvalue⟩
      · rintro ⟨item, hitem, hvalue⟩
        rcases List.mem_cons.mp hitem with hsame | htail
        · subst item
          exact Or.inl hvalue
        · exact Or.inr (ih.mpr ⟨item, htail, hvalue⟩)

/-- Structural characterization of Boolean existential search, avoiding the
quotient-backed generic library equivalence. -/
theorem any_eq_true_iff_structural {alpha : Type} (items : List alpha)
    (test : alpha -> Bool) :
    items.any test = true <->
      exists item, item ∈ items /\ test item = true := by
  induction items with
  | nil =>
      constructor
      · intro htest
        cases htest
      · rintro ⟨item, hmem, _⟩
        cases hmem
  | cons head tail ih =>
      cases hhead : test head with
      | false =>
          simp only [List.any, hhead, Bool.false_or]
          constructor
          · intro htest
            obtain ⟨item, hitem, htrue⟩ := ih.mp htest
            exact ⟨item, List.Mem.tail head hitem, htrue⟩
          · rintro ⟨item, hitem, htrue⟩
            rcases List.mem_cons.mp hitem with hsame | htail
            · subst item
              rw [hhead] at htrue
              contradiction
            · exact ih.mpr ⟨item, htail, htrue⟩
      | true =>
          simp only [List.any, hhead, Bool.true_or]
          constructor
          · intro _
            exact ⟨head, List.Mem.head tail, hhead⟩
          · intro _
            exact True.intro

/-- All valid root-relative occurrence addresses, in preorder. -/
def occurrenceAddresses : Term -> List Address
  | .s => [[]]
  | .app fn arg =>
      [] ::
        (occurrenceAddresses fn |>.map (PureSFormal.PureS.Direction.left :: ·)) ++
        (occurrenceAddresses arg |>.map (PureSFormal.PureS.Direction.right :: ·))

/-- The occurrence list contains exactly the addresses at which lookup
succeeds. -/
theorem mem_occurrenceAddresses_iff (term : Term) (address : Address) :
    address ∈ occurrenceAddresses term <->
      exists selected, Term.subterm? term address = some selected := by
  induction term generalizing address with
  | s =>
      cases address with
      | nil =>
          change [] ∈ ([[]] : List Address) <->
            exists selected, (some Term.s : Option Term) = some selected
          constructor
          · intro _
            exact ⟨Term.s, rfl⟩
          · intro _
            exact List.Mem.head []
      | cons direction rest =>
          cases direction <;>
            change _ :: rest ∈ ([[]] : List Address) <->
              exists selected, (none : Option Term) = some selected
          all_goals
            constructor
            · intro hmem
              rcases List.mem_cons.mp hmem with heq | htail
              · cases heq
              · cases htail
            · rintro ⟨selected, heq⟩
              cases heq
  | app fn arg ihFn ihArg =>
      cases address with
      | nil =>
          change [] ∈
              ([] ::
                ((occurrenceAddresses fn).map
                    (PureSFormal.PureS.Direction.left :: ·) ++
                  (occurrenceAddresses arg).map
                    (PureSFormal.PureS.Direction.right :: ·))) <->
            exists selected, (some (.app fn arg) : Option Term) = some selected
          constructor
          · intro _
            exact ⟨.app fn arg, rfl⟩
          · intro _
            exact List.Mem.head _
      | cons direction rest =>
          cases direction with
          | left =>
              simp only [Term.subterm?]
              constructor
              · intro hmem
                have htail :
                    PureSFormal.PureS.Direction.left :: rest ∈
                      (occurrenceAddresses fn).map
                          (PureSFormal.PureS.Direction.left :: ·) ++
                        (occurrenceAddresses arg).map
                          (PureSFormal.PureS.Direction.right :: ·) := by
                  change PureSFormal.PureS.Direction.left :: rest ∈
                    [] ::
                      ((occurrenceAddresses fn).map
                          (PureSFormal.PureS.Direction.left :: ·) ++
                        (occurrenceAddresses arg).map
                          (PureSFormal.PureS.Direction.right :: ·)) at hmem
                  rcases List.mem_cons.mp hmem with hnil | htail
                  · cases hnil
                  · exact htail
                rcases List.mem_append.mp htail with hleft | hright
                · obtain ⟨path, hpath, heq⟩ :=
                    (mem_map_iff_structural
                      (PureSFormal.PureS.Direction.left :: rest)
                      (occurrenceAddresses fn)
                      (PureSFormal.PureS.Direction.left :: ·)).mp hleft
                  have hpathEq : path = rest := (List.cons.inj heq).2
                  subst path
                  exact (ihFn rest).mp hpath
                · obtain ⟨path, _, heq⟩ :=
                    (mem_map_iff_structural
                      (PureSFormal.PureS.Direction.left :: rest)
                      (occurrenceAddresses arg)
                      (PureSFormal.PureS.Direction.right :: ·)).mp hright
                  cases heq
              · rintro ⟨selected, hselected⟩
                apply List.Mem.tail
                apply List.mem_append_left
                apply (mem_map_iff_structural _ _ _).mpr
                exact ⟨rest, (ihFn rest).mpr ⟨selected, hselected⟩, rfl⟩
          | right =>
              simp only [Term.subterm?]
              constructor
              · intro hmem
                have htail :
                    PureSFormal.PureS.Direction.right :: rest ∈
                      (occurrenceAddresses fn).map
                          (PureSFormal.PureS.Direction.left :: ·) ++
                        (occurrenceAddresses arg).map
                          (PureSFormal.PureS.Direction.right :: ·) := by
                  change PureSFormal.PureS.Direction.right :: rest ∈
                    [] ::
                      ((occurrenceAddresses fn).map
                          (PureSFormal.PureS.Direction.left :: ·) ++
                        (occurrenceAddresses arg).map
                          (PureSFormal.PureS.Direction.right :: ·)) at hmem
                  rcases List.mem_cons.mp hmem with hnil | htail
                  · cases hnil
                  · exact htail
                rcases List.mem_append.mp htail with hleft | hright
                · obtain ⟨path, _, heq⟩ :=
                    (mem_map_iff_structural
                      (PureSFormal.PureS.Direction.right :: rest)
                      (occurrenceAddresses fn)
                      (PureSFormal.PureS.Direction.left :: ·)).mp hleft
                  cases heq
                · obtain ⟨path, hpath, heq⟩ :=
                    (mem_map_iff_structural
                      (PureSFormal.PureS.Direction.right :: rest)
                      (occurrenceAddresses arg)
                      (PureSFormal.PureS.Direction.right :: ·)).mp hright
                  have hpathEq : path = rest := (List.cons.inj heq).2
                  subst path
                  exact (ihArg rest).mp hpath
              · rintro ⟨selected, hselected⟩
                apply List.Mem.tail
                apply List.mem_append_right
                apply (mem_map_iff_structural _ _ _).mpr
                exact ⟨rest, (ihArg rest).mpr ⟨selected, hselected⟩, rfl⟩

/-- Redex addresses are obtained by a finite filter over all occurrences. -/
def redexAddresses (term : Term) : List Address :=
  (occurrenceAddresses term).filter fun address =>
    match Term.subterm? term address with
    | none => false
    | some selected => selected.contractRoot?.isSome

/-- A listed redex address has a successful address-level contraction. -/
theorem mem_redexAddresses_iff (term : Term) (address : Address) :
    address ∈ redexAddresses term <->
      exists target, Term.contractAt? term address = some target := by
  constructor
  · intro hmem
    obtain ⟨haddress, hredex⟩ := List.mem_filter.mp hmem
    obtain ⟨selected, hselected⟩ :=
      (mem_occurrenceAddresses_iff term address).mp haddress
    simp only [hselected] at hredex
    cases hroot : selected.contractRoot? with
    | none => simp [hroot] at hredex
    | some replacement =>
        obtain ⟨ctx, _, hreplace⟩ := Term.context_of_subterm hselected
        refine ⟨ctx.plug replacement, ?_⟩
        have hreplaceAt := hreplace replacement
        simp [Term.contractAt?, hselected, hroot, hreplaceAt]
  · rintro ⟨target, hcontract⟩
    obtain ⟨selected, replacement, hselected, hroot, hreplace⟩ :=
      Term.contractAt?_spec hcontract
    apply List.mem_filter.mpr
    constructor
    · exact (mem_occurrenceAddresses_iff term address).mpr ⟨selected, hselected⟩
    · simp [hselected, hroot]

/-- Every one-step target reachable from a term, computed as a finite list. -/
def oneStepResults (term : Term) : List Term :=
  (redexAddresses term).filterMap (Term.contractAt? term)

/-- The address of the hole of a one-hole context. -/
def contextHoleAddress : Context -> Address
  | .hole => []
  | .appLeft ctx _ => .left :: contextHoleAddress ctx
  | .appRight _ ctx => .right :: contextHoleAddress ctx

/-- Looking up the literal hole address returns the plugged term. -/
theorem subterm?_plug_hole (ctx : Context) (term : Term) :
    Term.subterm? (ctx.plug term) (contextHoleAddress ctx) = some term := by
  induction ctx with
  | hole => simp [Context.plug, contextHoleAddress, Term.subterm?]
  | appLeft ctx right ih => simpa [contextHoleAddress, Term.subterm?] using ih
  | appRight left ctx ih => simpa [contextHoleAddress, Term.subterm?] using ih

/-- Replacing at the literal hole address fills that same context. -/
theorem replace?_plug_hole (ctx : Context) (old replacement : Term) :
    Term.replace? (ctx.plug old) (contextHoleAddress ctx) replacement =
      some (ctx.plug replacement) := by
  induction ctx with
  | hole => simp [Context.plug, contextHoleAddress, Term.replace?]
  | appLeft ctx right ih =>
      simp only [Context.plug, contextHoleAddress, Term.replace?]
      rw [ih]
      rfl
  | appRight left ctx ih =>
      simp only [Context.plug, contextHoleAddress, Term.replace?]
      rw [ih]
      rfl

/-- Contracting at the literal hole address performs the contextual root
contraction exactly. -/
theorem contractAt?_plug_redex (ctx : Context) (x y z : Term) :
    Term.contractAt? (ctx.plug (Term.redex x y z)) (contextHoleAddress ctx) =
      some (ctx.plug (Term.contractum x y z)) := by
  unfold Term.contractAt?
  rw [subterm?_plug_hole]
  change Term.replace? (ctx.plug (Term.redex x y z))
    (contextHoleAddress ctx) (Term.contractum x y z) = _
  exact replace?_plug_hole ctx (Term.redex x y z) (Term.contractum x y z)

/-- The finite executable successor list is extensionally exact. -/
theorem mem_oneStepResults_iff (source target : Term) :
    target ∈ oneStepResults source <-> Step source target := by
  constructor
  · intro hmem
    unfold oneStepResults at hmem
    obtain ⟨address, haddress, hcontract⟩ :=
      (mem_filterMap_iff_structural target (redexAddresses source)
        (Term.contractAt? source)).mp hmem
    exact Term.contractAt?_sound hcontract
  · rintro ⟨ctx, x, y, z, rfl, rfl⟩
    unfold oneStepResults
    apply (mem_filterMap_iff_structural _ _ _).mpr
    refine ⟨contextHoleAddress ctx, ?_, contractAt?_plug_redex ctx x y z⟩
    exact (mem_redexAddresses_iff _ _).mpr
      ⟨ctx.plug (Term.contractum x y z), contractAt?_plug_redex ctx x y z⟩

/-- Terms reached by exactly `depth` contextual contractions. -/
def reductionLayer : Nat -> Term -> List Term
  | 0, source => [source]
  | depth + 1, source =>
      (reductionLayer depth source).flatMap oneStepResults

/-- Membership in finite list flattening, stated in a proof-friendly form. -/
theorem mem_flatMap_iff {alpha beta : Type} (value : beta)
    (items : List alpha) (f : alpha -> List beta) :
    value ∈ items.flatMap f <->
      exists item, item ∈ items /\ value ∈ f item := by
  exact mem_flatMap_iff_structural value items f

/-- Every enumerated bounded-layer member is relationally reachable. -/
theorem mem_reductionLayer_steps {depth : Nat} {source target : Term}
    (hmem : target ∈ reductionLayer depth source) :
    Steps source target := by
  induction depth generalizing target with
  | zero =>
      have heq : target = source := by simpa [reductionLayer] using hmem
      subst target
      exact .refl source
  | succ depth ih =>
      have hflat : List.Mem target
          ((reductionLayer depth source).flatMap oneStepResults) := by
        simpa only [reductionLayer] using! hmem
      obtain ⟨middle, hmiddle, htarget⟩ :=
        (mem_flatMap_iff target (reductionLayer depth source)
          oneStepResults).mp hflat
      exact Steps.tail (ih hmiddle) ((mem_oneStepResults_iff middle target).mp htarget)

/-- Every finite relational reduction occurs in one executable bounded layer. -/
theorem steps_mem_some_reductionLayer {source target : Term}
    (hsteps : Steps source target) :
    exists depth, target ∈ reductionLayer depth source := by
  induction hsteps with
  | refl => exact ⟨0, List.Mem.head []⟩
  | tail hprefix hlast ih =>
      obtain ⟨depth, hmiddle⟩ := ih
      refine ⟨depth + 1, ?_⟩
      simp only [reductionLayer]
      exact (mem_flatMap_iff _ _ oneStepResults).mpr
        ⟨_, hmiddle, (mem_oneStepResults_iff _ _).mpr hlast⟩

/-- The current literal observer reports at least one terminal record. -/
def hasTerminalLabel (term : Term) : Bool :=
  (labelledProjection term).any fun entry => entry.label.terminal

/-- Propositional terminal observation on one current term. -/
def TerminalObserved (term : Term) : Prop :=
  exists entry, entry ∈ labelledProjection term /\
    entry.label.terminal = true

/-- The executable terminal test is exact. -/
theorem hasTerminalLabel_eq_true_iff (term : Term) :
    hasTerminalLabel term = true <-> TerminalObserved term := by
  constructor
  · intro htest
    obtain ⟨entry, hmem, hterminal⟩ :=
      (any_eq_true_iff_structural (labelledProjection term)
        (fun entry => entry.label.terminal)).mp
          (by simpa only [hasTerminalLabel] using htest)
    exact ⟨entry, hmem, hterminal⟩
  · rintro ⟨entry, hmem, hterminal⟩
    unfold hasTerminalLabel
    exact (any_eq_true_iff_structural _ _).mpr ⟨entry, hmem, hterminal⟩

/-- Reachability of one literal terminal record from a supplied finite term. -/
def EventuallyTerminalObserved (source : Term) : Prop :=
  exists target, Steps source target /\ TerminalObserved target

/-- Total bounded search through the exact reduction layer. -/
def terminalObservedAtDepth (source : Term) (depth : Nat) : Bool :=
  (reductionLayer depth source).any hasTerminalLabel

/-- Bounded search is sound and complete for terminal observation. -/
theorem eventuallyTerminalObserved_iff (source : Term) :
    EventuallyTerminalObserved source <->
      exists depth, terminalObservedAtDepth source depth = true := by
  constructor
  · rintro ⟨target, hsteps, hterminal⟩
    obtain ⟨depth, hmem⟩ := steps_mem_some_reductionLayer hsteps
    refine ⟨depth, ?_⟩
    unfold terminalObservedAtDepth
    exact (any_eq_true_iff_structural _ _).mpr
      ⟨target, hmem, (hasTerminalLabel_eq_true_iff target).mpr hterminal⟩
  · rintro ⟨depth, htest⟩
    unfold terminalObservedAtDepth at htest
    obtain ⟨target, hmem, hterminal⟩ :=
      (any_eq_true_iff_structural _ _).mp htest
    exact ⟨target, mem_reductionLayer_steps hmem,
      (hasTerminalLabel_eq_true_iff target).mp hterminal⟩

/-- Reachable literal terminal observation is semidecidable by an explicit
finite reduction-depth witness. -/
theorem eventuallyTerminalObserved_semidecidable :
    BoundedlySemidecidable EventuallyTerminalObserved :=
  ⟨terminalObservedAtDepth, eventuallyTerminalObserved_iff⟩

end PureSFormal.Research.ProtectedTrieStrongCompleteness
