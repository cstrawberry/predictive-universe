import PureSFormal.PureS.Cursor
import PureSFormal.PureS.CountedReduction

/-!
# Finite cursor scripts

A script is a finite list of the four occurrence primitives.  Execution is
deterministic and stops with `none` at the first undefined primitive.  It
examines no future instruction and performs no term operation other than the
strict focused `Rdx` supplied by `Cursor`.
-/

namespace PureSFormal.PureS

/-- A finite sequence of occurrence-level evaluator primitives. -/
abbrev Script := List Primitive

namespace Script

/-- Execute a script from left to right, failing at its first failed primitive. -/
def run : Script → Cursor → Option Cursor
  | [], cursor => some cursor
  | op :: rest, cursor =>
      match op.exec cursor with
      | none => none
      | some next => run rest next

/-- The exact number of mutating instructions in a script. -/
def rdxCount : Script → Nat
  | [] => 0
  | .L :: rest => rdxCount rest
  | .R :: rest => rdxCount rest
  | .U :: rest => rdxCount rest
  | .Rdx :: rest => 1 + rdxCount rest

/-- A cursor-only script contains no `Rdx` instruction. -/
def CursorOnly : Script → Prop
  | [] => True
  | .L :: rest => CursorOnly rest
  | .R :: rest => CursorOnly rest
  | .U :: rest => CursorOnly rest
  | .Rdx :: _ => False

@[simp]
theorem run_nil (cursor : Cursor) : run [] cursor = some cursor := rfl

@[simp]
theorem rdxCount_nil : rdxCount [] = 0 := rfl

/-- A failed first primitive makes the entire nonempty script fail. -/
theorem run_cons_eq_none_of_exec_eq_none
    (op : Primitive) (rest : Script) (cursor : Cursor)
    (h : op.exec cursor = none) :
    run (op :: rest) cursor = none := by
  simp only [run, h]

/-- Successful nonempty execution exposes its first intermediate cursor. -/
theorem run_cons_eq_some_iff
    (op : Primitive) (rest : Script) (before after : Cursor) :
    run (op :: rest) before = some after ↔
      ∃ middle, op.exec before = some middle ∧ run rest middle = some after := by
  constructor
  · intro h
    change (match op.exec before with
      | none => none
      | some middle => run rest middle) = some after at h
    generalize hexec : op.exec before = result at h
    cases result with
    | none => contradiction
    | some middle => exact ⟨middle, rfl, h⟩
  · rintro ⟨middle, hexec, hrest⟩
    change (match op.exec before with
      | none => none
      | some next => run rest next) = some after
    rw [hexec]
    exact hrest

/-- Executing concatenated scripts is sequential composition. -/
theorem run_append (first second : Script) (cursor : Cursor) :
    run (first ++ second) cursor =
      match run first cursor with
      | none => none
      | some middle => run second middle := by
  induction first generalizing cursor with
  | nil => rfl
  | cons op rest ih =>
      simp only [List.cons_append, run]
      generalize hexec : op.exec cursor = result
      cases result with
      | none => rfl
      | some middle => exact ih middle

/-- Mutation counts add under script concatenation. -/
theorem rdxCount_append (first second : Script) :
    rdxCount (first ++ second) = rdxCount first + rdxCount second := by
  induction first with
  | nil => simp only [List.nil_append, rdxCount, Nat.zero_add]
  | cons op rest ih =>
      cases op <;> simp only [List.cons_append, rdxCount, ih, Nat.add_assoc]

/-- Failure of a prefix propagates through every appended suffix. -/
theorem run_append_eq_none_of_run_eq_none
    {first : Script} (second : Script) {cursor : Cursor}
    (h : run first cursor = none) :
    run (first ++ second) cursor = none := by
  rw [run_append, h]

/-- Script execution is functional for a fixed script and starting cursor. -/
theorem run_deterministic
    {script : Script} {before after₁ after₂ : Cursor}
    (h₁ : run script before = some after₁)
    (h₂ : run script before = some after₂) :
    after₁ = after₂ := by
  rw [h₁] at h₂
  exact Option.some.inj h₂

/--
Every successful script performs exactly its syntactic number of pure-S
contractions after cursor metadata is erased.
-/
theorem run_projects_stepsN
    {script : Script} {before after : Cursor}
    (h : run script before = some after) :
    StepsN (rdxCount script) before.erase after.erase := by
  induction script generalizing before after with
  | nil =>
      simp only [run] at h
      cases h
      exact StepsN.refl _
  | cons op rest ih =>
      obtain ⟨middle, hop, hrest⟩ :=
        (run_cons_eq_some_iff op rest before after).mp h
      have htail : StepsN (rdxCount rest) middle.erase after.erase := ih hrest
      cases op with
      | L =>
          change before.left? = some middle at hop
          have herase : middle.erase = before.erase :=
            Cursor.left?_preserves_erase hop
          simpa only [rdxCount, herase] using htail
      | R =>
          change before.right? = some middle at hop
          have herase : middle.erase = before.erase :=
            Cursor.right?_preserves_erase hop
          simpa only [rdxCount, herase] using htail
      | U =>
          change before.up? = some middle at hop
          have herase : middle.erase = before.erase :=
            Cursor.up?_preserves_erase hop
          simpa only [rdxCount, herase] using htail
      | Rdx =>
          change before.rdx? = some middle at hop
          have hhead : StepsN 1 before.erase middle.erase :=
            StepsN.single (Cursor.rdx?_sound hop)
          simpa only [rdxCount] using StepsN.trans hhead htail

theorem rdxCount_eq_zero_of_cursorOnly
    {script : Script} (h : CursorOnly script) : rdxCount script = 0 := by
  induction script with
  | nil => rfl
  | cons op rest ih =>
      cases op with
      | L => exact ih h
      | R => exact ih h
      | U => exact ih h
      | Rdx => contradiction

/-- Every successful cursor-only script preserves the erased bare term. -/
theorem cursorOnly_preserves_erase
    {script : Script} {before after : Cursor}
    (honly : CursorOnly script)
    (hrun : run script before = some after) :
    after.erase = before.erase := by
  have hcount : rdxCount script = 0 := rdxCount_eq_zero_of_cursorOnly honly
  have hsteps : StepsN 0 before.erase after.erase := by
    simpa only [hcount] using run_projects_stepsN hrun
  exact (StepsN.eq_of_zero hsteps).symm

end Script

end PureSFormal.PureS
