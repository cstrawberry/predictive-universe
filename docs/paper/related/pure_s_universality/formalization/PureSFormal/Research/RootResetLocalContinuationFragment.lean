import PureSFormal.Research.RootResetPatternFragment
import PureSFormal.PureS.CheckpointDecoder

/-!
# Finite Local continuation entry and return

The exact fresh and marked Local shell skeletons compile into one concrete
finite controller. A successful entry reaches the literal RL continuation;
an ordinary mismatch restores the exact starting cursor, even below other
parents. Entry takes at most 167 microticks on every input. The separate UU
return row restores the enclosing shell around any replacement continuation.
All runs are read-only. The explicit cover has 2499 materialized rows, with
repeated PC values; no claim of 2499 distinct controls is made.

This fragment validates Local syntax only. Fresh-shell success does not
certify a completed nonempty response: a full dispatcher must establish that
admission condition before using continuation entry. The generated Base
exclusion is unconditional and follows the fixed LR-field shape.
-/
namespace PureSFormal.Research.RootResetLocalContinuationFragment

open PureSFormal.PureS
open FiniteController
open RootResetPatternFragment

def bPattern : Pattern := .app .s .s
def haltTagPattern : Pattern := .app bPattern .s
def haltCodePattern : Pattern := .app bPattern haltTagPattern

def shellPattern (haltField : Pattern) : Pattern :=
  .app (.app (.app haltField .hole) (.app (.app .s .hole) .hole)) (.app .hole .hole)

def freshPattern : Pattern := shellPattern (.app haltCodePattern .hole)
def markedPattern : Pattern := shellPattern (.app (.app .s .hole) (.app haltTagPattern .hole))

def enter : Code := .move .R (.move .L (.answer true))
def leave : Code := .move .U (.move .U (.answer false))
def markedCode : Code := ProbeCompiler.compile markedPattern enter (.answer false)
def entry : Code := ProbeCompiler.compile freshPattern enter markedCode
def whole : Code := .observeNode entry leave

abbrev Control := PC whole
abbrev machine := RootResetPatternFragment.machine whole

theorem entry_mem : entry ∈ whole.nodes := by
  change entry ∈ whole :: (entry.nodes ++ leave.nodes)
  exact List.Mem.tail _ (List.mem_append.mpr (Or.inl (ProbeCompiler.Control.self_mem_nodes _)))

theorem leave_mem : leave ∈ whole.nodes := by
  change leave ∈ whole :: (entry.nodes ++ leave.nodes)
  exact List.Mem.tail _ (List.mem_append.mpr (Or.inr (ProbeCompiler.Control.self_mem_nodes _)))

def initial (cursor : Cursor) : Configuration Control := ⟨some ⟨entry, entry_mem⟩, cursor⟩
def returning (cursor : Cursor) : Configuration Control := ⟨some ⟨leave, leave_mem⟩, cursor⟩

theorem fresh_matches (audit dispatcher seedPayload seedAudit continuation continuationAudit : Term) :
    freshPattern.matchesBool (CheckpointDecoder.openShell (freshHField audit) dispatcher
      seedPayload seedAudit continuation continuationAudit) = true := rfl

theorem marked_matches
    (leftAudit rightAudit dispatcher seedPayload seedAudit continuation continuationAudit : Term) :
    markedPattern.matchesBool (CheckpointDecoder.openShell (Carrier.markedHField leftAudit rightAudit)
      dispatcher seedPayload seedAudit continuation continuationAudit) = true := rfl

theorem readOnly : whole.NoRdx := by
  constructor
  · apply ProbeCompiler.compile_noRdx
    · trivial
    · apply ProbeCompiler.compile_noRdx <;> trivial
  · trivial

theorem entry_included (pc : Code) (member : pc ∈ entry.nodes) : pc ∈ whole.nodes :=
  nodes_trans entry_mem member

theorem marked_included (pc : Code) (member : pc ∈ markedCode.nodes) : pc ∈ whole.nodes := by
  apply entry_included
  exact ProbeCompiler.selected_nodes_in_compile freshPattern enter markedCode .s pc member


def accepts (source : Term) : Bool := freshPattern.matchesBool source || markedPattern.matchesBool source
def boundary (source : Term) : Code := if accepts source then enter else .answer false
def probeTicks (source : Term) : Nat := ProbeCompiler.probeCost freshPattern source +
  if freshPattern.matchesBool source then 0 else ProbeCompiler.probeCost markedPattern source

theorem probe_runs (origin : Cursor) :
    ∃ member : boundary origin.focus ∈ whole.nodes,
      run machine (probeTicks origin.focus) (initial origin) =
        ⟨some ⟨boundary origin.focus, member⟩, origin⟩ := by
  obtain ⟨firstMember, firstRun⟩ := RootResetPatternFragment.compile_runs
    freshPattern enter markedCode whole origin entry_included
  cases fresh : freshPattern.matchesBool origin.focus with
  | true =>
      simp only [fresh, ↓reduceIte] at firstMember firstRun
      simp only [probeTicks, fresh, ↓reduceIte, Nat.add_zero, boundary, accepts, Bool.true_or]
      exact ⟨firstMember, firstRun⟩
  | false =>
      simp only [fresh, Bool.false_eq_true, ↓reduceIte] at firstMember firstRun
      change run machine (ProbeCompiler.probeCost freshPattern origin.focus) (initial origin) = _ at firstRun
      obtain ⟨secondMember, secondRun⟩ := RootResetPatternFragment.compile_runs
        markedPattern enter (.answer false) whole origin marked_included
      simp only [boundary, accepts, fresh, Bool.false_or, probeTicks, ↓reduceIte]
      refine ⟨secondMember, ?_⟩
      change run machine (ProbeCompiler.probeCost freshPattern origin.focus +
        ProbeCompiler.probeCost markedPattern origin.focus) (initial origin) = _
      rw [run_add, firstRun]
      simpa only [boundary, accepts, fresh, Bool.false_or, markedCode] using secondRun

theorem probeTicks_bound (source : Term) : probeTicks source ≤ 165 := by
  have first : ProbeCompiler.probeCost freshPattern source ≤ 83 :=
    Nat.le_of_lt_succ (ProbeCompiler.probeCost_lt_executionBound freshPattern source)
  have second : ProbeCompiler.probeCost markedPattern source ≤ 82 :=
    Nat.le_of_lt_succ (ProbeCompiler.probeCost_lt_executionBound markedPattern source)
  unfold probeTicks
  cases freshPattern.matchesBool source with
  | true => exact Nat.le_trans (by simpa only [↓reduceIte, Nat.add_zero] using first) (by decide)
  | false => exact Nat.add_le_add first second

theorem accepts_continuation {source : Term} (accepted : accepts source = true) :
    ∃ left continuation audit, source = .app left (.app continuation audit) := by
  cases source with
  | s => cases accepted
  | app left right =>
      cases right with
      | s =>
          simp only [accepts, freshPattern, markedPattern, shellPattern, Pattern.matchesBool,
            Bool.and_false, Bool.false_or] at accepted
          cases accepted
      | app continuation audit => exact ⟨left, continuation, audit, rfl⟩

theorem enter_runs (member : enter ∈ whole.nodes)
    (left continuation audit : Term) (parents : List ParentFrame) :
    ∃ yesMember : ProbeCompiler.Control.answer true ∈ whole.nodes,
      run machine 2 ⟨some ⟨enter, member⟩, ⟨.app left (.app continuation audit), parents⟩⟩ =
        ⟨some ⟨.answer true, yesMember⟩,
          ⟨continuation, .left audit :: .right left :: parents⟩⟩ := by
  exact ⟨nodes_trans member (List.Mem.tail _ (List.Mem.tail _ (List.Mem.head _))), rfl⟩

theorem leave_runs (left continuation audit : Term) (parents : List ParentFrame) :
    ∃ noMember : ProbeCompiler.Control.answer false ∈ whole.nodes,
      run machine 2 (returning ⟨continuation, .left audit :: .right left :: parents⟩) =
        ⟨some ⟨.answer false, noMember⟩, ⟨.app left (.app continuation audit), parents⟩⟩ := by
  exact ⟨nodes_trans leave_mem (List.Mem.tail _ (List.Mem.tail _ (List.Mem.head _))), rfl⟩

theorem accepted_runs {source : Term} (accepted : accepts source = true) (parents : List ParentFrame) :
    ∃ left continuation audit, ∃ yesMember : ProbeCompiler.Control.answer true ∈ whole.nodes,
      source = .app left (.app continuation audit) ∧
      run machine (probeTicks source + 2) (initial ⟨source, parents⟩) =
        ⟨some ⟨.answer true, yesMember⟩,
          ⟨continuation, .left audit :: .right left :: parents⟩⟩ := by
  obtain ⟨left, continuation, audit, sourceEq⟩ := accepts_continuation accepted
  subst source
  obtain ⟨member, probeRun⟩ := probe_runs ⟨.app left (.app continuation audit), parents⟩
  simp only [boundary, accepted, ↓reduceIte] at probeRun member
  obtain ⟨yesMember, enterRun⟩ := enter_runs member left continuation audit parents
  refine ⟨left, continuation, audit, yesMember, rfl, ?_⟩
  rw [run_add, probeRun]
  exact enterRun

theorem missed_runs {source : Term} (missed : accepts source = false) (parents : List ParentFrame) :
    ∃ noMember : ProbeCompiler.Control.answer false ∈ whole.nodes,
      run machine (probeTicks source) (initial ⟨source, parents⟩) =
        ⟨some ⟨.answer false, noMember⟩, ⟨source, parents⟩⟩ := by
  simpa only [boundary, missed, Bool.false_eq_true, ↓reduceIte] using probe_runs ⟨source, parents⟩


theorem states_length : machine.states.length = 2499 := by
  rw [RootResetPatternFragment.states_length]
  rfl

theorem runMutationCount_zero (ticks : Nat) (configuration : Configuration Control) :
    runMutationCount machine ticks configuration = 0 :=
  RootResetPatternFragment.runMutationCount_zero whole readOnly ticks configuration

theorem erase_run (ticks : Nat) (configuration : Configuration Control) :
    (run machine ticks configuration).cursor.erase = configuration.cursor.erase :=
  RootResetPatternFragment.erase_run whole readOnly ticks configuration

theorem accepted_shape_runs (left continuation audit : Term) (parents : List ParentFrame)
    (accepted : accepts (.app left (.app continuation audit)) = true) :
    ∃ yesMember : ProbeCompiler.Control.answer true ∈ whole.nodes,
      run machine (probeTicks (.app left (.app continuation audit)) + 2)
        (initial ⟨.app left (.app continuation audit), parents⟩) =
        ⟨some ⟨.answer true, yesMember⟩,
          ⟨continuation, .left audit :: .right left :: parents⟩⟩ := by
  obtain ⟨member, probeRun⟩ := probe_runs ⟨.app left (.app continuation audit), parents⟩
  simp only [boundary, accepted, ↓reduceIte] at probeRun member
  obtain ⟨yesMember, enterRun⟩ := enter_runs member left continuation audit parents
  refine ⟨yesMember, ?_⟩
  rw [run_add, probeRun]
  exact enterRun

theorem fresh_enters
    (audit dispatcher seedPayload seedAudit continuation continuationAudit : Term)
    (parents : List ParentFrame) :
    let source := CheckpointDecoder.openShell (freshHField audit) dispatcher
      seedPayload seedAudit continuation continuationAudit
    ∃ yesMember : ProbeCompiler.Control.answer true ∈ whole.nodes,
      run machine (probeTicks source + 2) (initial ⟨source, parents⟩) =
        ⟨some ⟨.answer true, yesMember⟩,
          ⟨continuation, .left continuationAudit ::
            .right (.app (.app (freshHField audit) dispatcher)
              (.app (.app .s seedPayload) seedAudit)) :: parents⟩⟩ := by
  apply accepted_shape_runs
  change accepts (CheckpointDecoder.openShell (freshHField audit) dispatcher
    seedPayload seedAudit continuation continuationAudit) = true
  simp only [accepts, fresh_matches, Bool.true_or]

theorem marked_enters
    (leftAudit rightAudit dispatcher seedPayload seedAudit continuation continuationAudit : Term)
    (parents : List ParentFrame) :
    let source := CheckpointDecoder.openShell (Carrier.markedHField leftAudit rightAudit)
      dispatcher seedPayload seedAudit continuation continuationAudit
    ∃ yesMember : ProbeCompiler.Control.answer true ∈ whole.nodes,
      run machine (probeTicks source + 2) (initial ⟨source, parents⟩) =
        ⟨some ⟨.answer true, yesMember⟩,
          ⟨continuation, .left continuationAudit ::
            .right (.app (.app (Carrier.markedHField leftAudit rightAudit) dispatcher)
              (.app (.app .s seedPayload) seedAudit)) :: parents⟩⟩ := by
  apply accepted_shape_runs
  change accepts (CheckpointDecoder.openShell (Carrier.markedHField leftAudit rightAudit)
    dispatcher seedPayload seedAudit continuation continuationAudit) = true
  simp only [accepts, marked_matches, Bool.or_true]

theorem accepted_time_bound (source : Term) : probeTicks source + 2 ≤ 167 :=
  Nat.add_le_add_right (probeTicks_bound source) 2

theorem generatedBase_misses (actions continuation queue seedPayload beta : Term) :
    accepts (CheckpointDecoder.openBase actions continuation queue seedPayload beta) = false := by
  simp only [accepts, freshPattern, markedPattern, shellPattern,
    CheckpointDecoder.openBase, CheckpointDecoder.openEnvironment, Pattern.matchesBool,
    Bool.and_false, Bool.false_and, Bool.false_or]

theorem all_input (origin : Cursor) :
    ∃ ticks configuration, ticks ≤ 167 ∧ run machine ticks (initial origin) = configuration ∧
      ((∃ noMember, configuration = ⟨some ⟨ProbeCompiler.Control.answer false, noMember⟩, origin⟩) ∨
       (∃ left continuation audit yesMember,
        origin.focus = .app left (.app continuation audit) ∧
        configuration = ⟨some ⟨ProbeCompiler.Control.answer true, yesMember⟩,
          ⟨continuation, .left audit :: .right left :: origin.parents⟩⟩)) := by
  rcases origin with ⟨source, parents⟩
  cases accepted : accepts source with
  | false =>
      obtain ⟨member, execution⟩ := missed_runs accepted parents
      exact ⟨probeTicks source, _, Nat.le_trans (probeTicks_bound source) (by decide),
        execution, Or.inl ⟨member, rfl⟩⟩
  | true =>
      obtain ⟨left, continuation, audit, member, shape, execution⟩ := accepted_runs accepted parents
      exact ⟨probeTicks source + 2, _, accepted_time_bound source,
        execution, Or.inr ⟨left, continuation, audit, member, shape, rfl⟩⟩


end PureSFormal.Research.RootResetLocalContinuationFragment
