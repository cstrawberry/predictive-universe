import PureSFormal.Research.RootResetEulerWalker

/-! For pure S, a fixed source and one-step target determine the contracted
address. The proof uses literal ordered-tree constructors, not a scheduler. -/
namespace PureSFormal.Research.PureSContractionOccurrenceInjectivity
open PureSFormal.PureS
open RootResetEulerWalker

theorem right_ne_app (left right : Term) : right ≠ Term.app left right := by
  intro equal
  have sizes := congrArg Term.size equal
  have smaller : right.size < (Term.app left right).size :=
    Nat.lt_succ_of_le (Nat.le_add_left right.size left.size)
  rw [← sizes] at smaller
  exact (Nat.lt_irrefl _ smaller)

theorem context_plug_injective (context : Context) {before after : Term}
    (equal : context.plug before = context.plug after) : before = after := by
  induction context with
  | hole => exact equal
  | appLeft context right ih => exact ih (Term.app.inj equal).1
  | appRight left context ih => exact ih (Term.app.inj equal).2

theorem step_irreflexive (source : Term) : ¬ Step source source := by
  rintro ⟨context, x, y, z, before, after⟩
  have equal := context_plug_injective context (before.symm.trans after)
  exact right_ne_app y z (Term.app.inj equal).2

theorem contractAt_ne_self (source : Term) (address : Address) :
    source.contractAt? address ≠ some source := by
  intro contracted
  exact step_irreflexive source (Term.contractAt?_sound contracted)

theorem contractAt_root (source : Term) : source.contractAt? [] = source.contractRoot? := by
  cases source <;> simp only [Term.contractAt?, Term.subterm?] <;>
    cases result : Term.contractRoot? _ <;> rfl

theorem optionMap_some {α β : Type} {value : Option α} {f : α → β} {result : β}
    (mapped : value.map f = some result) : ∃ source, value = some source ∧ f source = result := by
  cases value with
  | none => cases mapped
  | some source => exact ⟨source, rfl, Option.some.inj mapped⟩

/-- A root contraction changes both immediate children; a contraction at a
proper descendant changes only one of them. Their literal targets differ. -/
theorem root_ne_descendant (source target : Term) (side : Direction) (address : Address)
    (root : source.contractRoot? = some target)
    (descendant : source.contractAt? (side :: address) = some target) : False := by
  cases source with
  | s => cases root
  | app fn z =>
    cases fn with
    | s => cases root
    | app fn y =>
      cases fn with
      | s => cases root
      | app head x =>
        cases head with
        | app _ _ => cases root
        | s =>
          have targetEq : Term.contractum x y z = target := Option.some.inj root
          subst target
          cases side with
          | left =>
            rw [contractAt?_app_left] at descendant
            obtain ⟨_, _, same⟩ := optionMap_some descendant
            exact right_ne_app y z (Term.app.inj same).2
          | right =>
            rw [contractAt?_app_right] at descendant
            obtain ⟨_, _, same⟩ := optionMap_some descendant
            have sameLeft := (Term.app.inj same).1
            have impossible := (Term.app.inj sameLeft).1
            exact right_ne_app .s x impossible.symm

/-- Address injectivity holds even for equal redexes at distinct occurrences. -/
theorem contractAt_address_injective (source : Term) (first second : Address) (target : Term)
    (atFirst : source.contractAt? first = some target)
    (atSecond : source.contractAt? second = some target) : first = second := by
  induction source generalizing first second target with
  | s =>
    cases first with
    | nil => cases atFirst
    | cons side rest => cases side <;> cases atFirst
  | app fn arg ihFn ihArg =>
    cases first with
    | nil =>
      cases second with
      | nil => rfl
      | cons side rest =>
        rw [contractAt_root] at atFirst
        exact (root_ne_descendant _ _ side rest atFirst atSecond).elim
    | cons side first =>
      cases second with
      | nil =>
        rw [contractAt_root] at atSecond
        exact (root_ne_descendant _ _ side first atSecond atFirst).elim
      | cons other second =>
        cases side <;> cases other
        · rw [contractAt?_app_left] at atFirst atSecond
          obtain ⟨firstTarget, firstRun, firstEq⟩ := optionMap_some atFirst
          obtain ⟨secondTarget, secondRun, secondEq⟩ := optionMap_some atSecond
          have equal := (Term.app.inj (firstEq.trans secondEq.symm)).1
          subst secondTarget
          exact congrArg (Direction.left :: ·) (ihFn first second firstTarget firstRun secondRun)
        · rw [contractAt?_app_left] at atFirst
          rw [contractAt?_app_right] at atSecond
          obtain ⟨firstTarget, firstRun, firstEq⟩ := optionMap_some atFirst
          obtain ⟨_, _, secondEq⟩ := optionMap_some atSecond
          have equal := (Term.app.inj (firstEq.trans secondEq.symm)).1
          subst firstTarget
          exact (contractAt_ne_self fn first firstRun).elim
        · rw [contractAt?_app_right] at atFirst
          rw [contractAt?_app_left] at atSecond
          obtain ⟨firstTarget, firstRun, firstEq⟩ := optionMap_some atFirst
          obtain ⟨_, _, secondEq⟩ := optionMap_some atSecond
          have equal := (Term.app.inj (firstEq.trans secondEq.symm)).2
          subst firstTarget
          exact (contractAt_ne_self arg first firstRun).elim
        · rw [contractAt?_app_right] at atFirst atSecond
          obtain ⟨firstTarget, firstRun, firstEq⟩ := optionMap_some atFirst
          obtain ⟨secondTarget, secondRun, secondEq⟩ := optionMap_some atSecond
          have equal := (Term.app.inj (firstEq.trans secondEq.symm)).2
          subst secondTarget
          exact congrArg (Direction.right :: ·) (ihArg first second firstTarget firstRun secondRun)

theorem rdx_at_cursor_address (before after : Cursor) (contracted : before.rdx? = some after) :
    before.erase.contractAt? (RootResetSelectorContract.cursorAddress before) = some after.erase := by
  rw [RootResetSelectorContract.contractAt?_cursorAddress]
  rcases before with ⟨focus, parents⟩
  cases root : focus.contractRoot? with
  | none => simp only [Cursor.rdx?, root, Option.map_none] at contracted; cases contracted
  | some replacement =>
    simp only [Cursor.rdx?, root, Option.map_some] at contracted
    have equal : (⟨replacement, parents⟩ : Cursor) = after := Option.some.inj contracted
    subst after
    rfl

/-- Two actual contractions with equal source and target trees select the
same address and the same pre-contraction focus, irrespective of controllers. -/
theorem same_source_target_occurrence
    (first second firstAfter secondAfter : Cursor)
    (sameSource : first.erase = second.erase)
    (firstStep : first.rdx? = some firstAfter)
    (secondStep : second.rdx? = some secondAfter)
    (sameTarget : firstAfter.erase = secondAfter.erase) :
    RootResetSelectorContract.cursorAddress first = RootResetSelectorContract.cursorAddress second ∧
      first.focus = second.focus := by
  have firstAt := rdx_at_cursor_address first firstAfter firstStep
  have secondAt := rdx_at_cursor_address second secondAfter secondStep
  rw [← sameSource, ← sameTarget] at secondAt
  have address := contractAt_address_injective _ _ _ _ firstAt secondAt
  refine ⟨address, ?_⟩
  have firstFocus := RootResetSelectorContract.subterm?_erase_cursorAddress first
  have secondFocus := RootResetSelectorContract.subterm?_erase_cursorAddress second
  rw [← sameSource, ← address] at secondFocus
  exact Option.some.inj (firstFocus.symm.trans secondFocus)

end PureSFormal.Research.PureSContractionOccurrenceInjectivity
