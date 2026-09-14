import PureSFormal.Research.RootResetCarrierEdgePatterns
import PureSFormal.Research.RootResetCompletedLocalFragment

/-!
# Finite pattern and designated-edge execution

A fixed finite list of pattern/address rows compiles to local observations
and L/R moves. Matching selects the first row and follows its literal path;
exhausted mismatch restores the exact origin. The explicit execution bound
depends only on the row list. No runtime parser, path register, or mutation
appears in the finite machine.
-/

namespace PureSFormal.Research.RootResetEdgeFragment
open PureSFormal.PureS
open FiniteController
open RootResetPatternFragment
open RootResetCarrierEdgePatterns

def follow : Address → Cursor → Option Cursor
  | [], cursor => some cursor
  | .left :: rest, cursor => cursor.left?.bind (follow rest)
  | .right :: rest, cursor => cursor.right?.bind (follow rest)

def pathCode : Address → Code → Code
  | [], next => next
  | .left :: rest, next => .move .L (pathCode rest next)
  | .right :: rest, next => .move .R (pathCode rest next)

theorem path_readOnly (address : Address) (next : Code) (safe : next.NoRdx) :
    (pathCode address next).NoRdx := by
  induction address with
  | nil => exact safe
  | cons side rest ih => cases side <;> exact ih

theorem path_runs (address : Address) (next whole : Code) (before after : Cursor)
    (followed : follow address before = some after)
    (included : ∀ pc, pc ∈ (pathCode address next).nodes → pc ∈ whole.nodes) :
    ∃ lastMember : next ∈ whole.nodes,
      run (RootResetPatternFragment.machine whole) address.length
        ⟨some ⟨pathCode address next, included _ (ProbeCompiler.Control.self_mem_nodes _)⟩, before⟩ =
        ⟨some ⟨next, lastMember⟩, after⟩ := by
  induction address generalizing before with
  | nil =>
      have equal : before = after := Option.some.inj followed
      subst before
      exact ⟨included _ (ProbeCompiler.Control.self_mem_nodes _), rfl⟩
  | cons side rest ih =>
      rcases before with ⟨source, parents⟩
      cases source with
      | s => cases side <;> cases followed
      | app fn arg =>
          cases side with
          | left =>
              have tailIncluded : ∀ pc, pc ∈ (pathCode rest next).nodes → pc ∈ whole.nodes := by
                intro pc member
                exact included pc (List.Mem.tail _ member)
              obtain ⟨lastMember, tailRun⟩ := ih ⟨fn, .left arg :: parents⟩ followed tailIncluded
              exact ⟨lastMember, tailRun⟩
          | right =>
              have tailIncluded : ∀ pc, pc ∈ (pathCode rest next).nodes → pc ∈ whole.nodes := by
                intro pc member
                exact included pc (List.Mem.tail _ member)
              obtain ⟨lastMember, tailRun⟩ := ih ⟨arg, .right fn :: parents⟩ followed tailIncluded
              exact ⟨lastMember, tailRun⟩

def select : List EdgeRow → Term → Option EdgeRow
  | [], _ => none
  | row :: rows, source => if row.pattern.matchesBool source then some row else select rows source

def familyCode : List EdgeRow → Code
  | [] => .answer false
  | row :: rows => ProbeCompiler.compile row.pattern (pathCode row.address (.answer true)) (familyCode rows)

def selectedCode (rows : List EdgeRow) (source : Term) : Code :=
  match select rows source with
  | none => .answer false
  | some row => pathCode row.address (.answer true)

def probeTicks : List EdgeRow → Term → Nat
  | [], _ => 0
  | row :: rows, source => ProbeCompiler.probeCost row.pattern source +
      if row.pattern.matchesBool source then 0 else probeTicks rows source

def ticks (rows : List EdgeRow) (source : Term) : Nat :=
  probeTicks rows source + match select rows source with
    | none => 0
    | some row => row.address.length

def bound : List EdgeRow → Nat
  | [] => 0
  | row :: rows => ProbeCompiler.executionBound row.pattern + row.address.length + bound rows

theorem select_sound (rows : List EdgeRow) (source : Term) (row : EdgeRow)
    (selected : select rows source = some row) : row ∈ rows ∧ row.pattern.matchesBool source = true := by
  induction rows with
  | nil => cases selected
  | cons first rest ih =>
      cases matched : first.pattern.matchesBool source with
      | true =>
          have equal : first = row := Option.some.inj (by simpa only [select, matched, ↓reduceIte] using selected)
          subst first
          exact ⟨List.Mem.head _, matched⟩
      | false =>
          have tailSelected : select rest source = some row := by
            simpa only [select, matched, Bool.false_eq_true, ↓reduceIte] using selected
          obtain ⟨member, rowMatched⟩ := ih tailSelected
          exact ⟨List.Mem.tail _ member, rowMatched⟩

theorem probe_runs (rows : List EdgeRow) (whole : Code) (origin : Cursor)
    (included : ∀ pc, pc ∈ (familyCode rows).nodes → pc ∈ whole.nodes) :
    ∃ lastMember : selectedCode rows origin.focus ∈ whole.nodes,
      run (RootResetPatternFragment.machine whole) (probeTicks rows origin.focus)
        ⟨some ⟨familyCode rows, included _ (ProbeCompiler.Control.self_mem_nodes _)⟩, origin⟩ =
        ⟨some ⟨selectedCode rows origin.focus, lastMember⟩, origin⟩ := by
  induction rows with
  | nil => exact ⟨included _ (ProbeCompiler.Control.self_mem_nodes _), rfl⟩
  | cons row rows ih =>
      obtain ⟨firstMember, firstRun⟩ := RootResetPatternFragment.compile_runs row.pattern
        (pathCode row.address (.answer true)) (familyCode rows) whole origin included
      cases matched : row.pattern.matchesBool origin.focus with
      | true =>
          simp only [matched, ↓reduceIte] at firstMember firstRun
          simp only [selectedCode, select, matched, ↓reduceIte, probeTicks, Nat.add_zero]
          exact ⟨firstMember, firstRun⟩
      | false =>
          simp only [matched, Bool.false_eq_true, ↓reduceIte] at firstMember firstRun
          have tailIncluded : ∀ pc, pc ∈ (familyCode rows).nodes → pc ∈ whole.nodes := by
            intro pc member
            apply included
            have selectedMember := ProbeCompiler.selected_nodes_in_compile row.pattern
              (pathCode row.address (.answer true)) (familyCode rows) origin.focus pc
            simp only [matched, Bool.false_eq_true, ↓reduceIte] at selectedMember
            exact selectedMember member
          obtain ⟨lastMember, lastRun⟩ := ih tailIncluded
          simp only [selectedCode, select, matched, Bool.false_eq_true, ↓reduceIte, probeTicks]
          refine ⟨lastMember, ?_⟩
          simp only [familyCode]
          rw [run_add, firstRun]
          exact lastRun

theorem ticks_bound (rows : List EdgeRow) (source : Term) : ticks rows source ≤ bound rows := by
  induction rows with
  | nil => exact Nat.le_refl _
  | cons row rows ih =>
      have first := Nat.le_of_lt (ProbeCompiler.probeCost_lt_executionBound row.pattern source)
      cases matched : row.pattern.matchesBool source with
      | true =>
          simp only [ticks, probeTicks, select, matched, ↓reduceIte, Nat.add_zero, bound]
          exact Nat.le_trans (Nat.add_le_add_right first _) (Nat.le_add_right _ _)
      | false =>
          have combined := Nat.add_le_add first ih
          have enlarged := Nat.le_trans combined (Nat.add_le_add_right
            (Nat.le_add_right (ProbeCompiler.executionBound row.pattern) row.address.length) (bound rows))
          simpa only [ticks, probeTicks, select, matched, Bool.false_eq_true, ↓reduceIte,
            bound, Nat.add_assoc] using enlarged

theorem family_readOnly (rows : List EdgeRow) : (familyCode rows).NoRdx := by
  induction rows with
  | nil => trivial
  | cons row rows ih => exact ProbeCompiler.compile_noRdx _ (path_readOnly _ _ True.intro) ih

abbrev Control (rows : List EdgeRow) := PC (familyCode rows)
abbrev machine (rows : List EdgeRow) := RootResetPatternFragment.machine (familyCode rows)
abbrev initial (rows : List EdgeRow) := RootResetPatternFragment.initial (familyCode rows)

theorem selected_runs (rows : List EdgeRow) (origin after : Cursor) (row : EdgeRow)
    (selected : select rows origin.focus = some row)
    (followed : follow row.address origin = some after) :
    ∃ lastMember : ProbeCompiler.Control.answer true ∈ (familyCode rows).nodes,
      run (machine rows) (ticks rows origin.focus) (initial rows origin) =
        ⟨some ⟨.answer true, lastMember⟩, after⟩ := by
  obtain ⟨probeMember, probeRun⟩ := probe_runs rows (familyCode rows) origin (fun _ h => h)
  simp only [selectedCode, selected] at probeMember probeRun
  obtain ⟨lastMember, pathRun⟩ := path_runs row.address (.answer true) (familyCode rows)
    origin after followed (fun pc member => nodes_trans probeMember member)
  refine ⟨lastMember, ?_⟩
  have combined := (congrArg (run (machine rows) row.address.length) probeRun).trans pathRun
  simpa only [ticks, selected, run_add] using! combined

theorem missed_runs (rows : List EdgeRow) (origin : Cursor)
    (selected : select rows origin.focus = none) :
    ∃ lastMember : ProbeCompiler.Control.answer false ∈ (familyCode rows).nodes,
      run (machine rows) (ticks rows origin.focus) (initial rows origin) =
        ⟨some ⟨.answer false, lastMember⟩, origin⟩ := by
  obtain ⟨member, execution⟩ := probe_runs rows (familyCode rows) origin (fun _ h => h)
  simp only [selectedCode, selected] at member execution
  refine ⟨member, ?_⟩
  simpa only [ticks, selected, Nat.add_zero] using! execution

theorem follow_subterm (address : Address) (before after : Cursor)
    (followed : follow address before = some after) :
    before.focus.subterm? address = some after.focus := by
  induction address generalizing before with
  | nil =>
      have equal : before = after := Option.some.inj followed
      subst before
      cases after.focus <;> rfl
  | cons side rest ih =>
      rcases before with ⟨source, parents⟩
      cases source with
      | s => cases side <;> cases followed
      | app fn arg =>
          cases side with
          | left => exact ih ⟨fn, .left arg :: parents⟩ followed
          | right => exact ih ⟨arg, .right fn :: parents⟩ followed

theorem follow_exists (address : Address) (source target : Term)
    (subterm : source.subterm? address = some target) (parents : List ParentFrame) :
    ∃ after, follow address ⟨source, parents⟩ = some after ∧ after.focus = target := by
  induction address generalizing source parents with
  | nil =>
      have equal : source = target := by
        cases source <;> exact Option.some.inj subterm
      exact ⟨⟨source, parents⟩, rfl, equal⟩
  | cons side rest ih =>
      cases source with
      | s => cases side <;> cases subterm
      | app fn arg =>
          cases side with
          | left => exact ih fn subterm (.left arg :: parents)
          | right => exact ih arg subterm (.right fn :: parents)

theorem follow_size_lt (address : Address) (before after : Cursor)
    (proper : address ≠ []) (followed : follow address before = some after) :
    after.focus.size < before.focus.size := by
  cases address with
  | nil => exact False.elim (proper rfl)
  | cons side rest => exact CarrierDecoder.subterm_size_lt (follow_subterm _ _ _ followed)

theorem follow_erase (address : Address) (before after : Cursor)
    (followed : follow address before = some after) : after.erase = before.erase := by
  induction address generalizing before with
  | nil =>
      have equal : before = after := Option.some.inj followed
      subst before
      rfl
  | cons side rest ih =>
      rcases before with ⟨source, parents⟩
      cases source with
      | s => cases side <;> cases followed
      | app fn arg =>
          cases side with
          | left => exact ih ⟨fn, .left arg :: parents⟩ followed
          | right => exact ih ⟨arg, .right fn :: parents⟩ followed

def Valid (rows : List EdgeRow) : Prop :=
  ∀ row ∈ rows, row.address ≠ [] ∧ ∀ source, row.pattern.matchesBool source = true →
    ∃ target, source.subterm? row.address = some target

theorem runMutationCount_zero (rows : List EdgeRow) (count : Nat) (configuration : Configuration (Control rows)) :
    runMutationCount (machine rows) count configuration = 0 :=
  RootResetPatternFragment.runMutationCount_zero _ (family_readOnly rows) count configuration

theorem erase_run (rows : List EdgeRow) (count : Nat) (configuration : Configuration (Control rows)) :
    (run (machine rows) count configuration).cursor.erase = configuration.cursor.erase :=
  RootResetPatternFragment.erase_run _ (family_readOnly rows) count configuration

end PureSFormal.Research.RootResetEdgeFragment


