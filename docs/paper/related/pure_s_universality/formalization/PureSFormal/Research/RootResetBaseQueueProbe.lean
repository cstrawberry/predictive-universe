import PureSFormal.Research.RootResetCompletedResponseProbe

/-!
Finite initial Base queue selection. Before deletion, an even chronology
selects the oldest live cell; an empty queue or the odd post-C4 chronology
selects the checked pending parent. All tests are finite cursor programs.
-/
namespace PureSFormal.Research.RootResetBaseQueueProbe
set_option maxHeartbeats 1000000
set_option maxRecDepth 10000
open PureSFormal.PureS
open FiniteController RootResetProbeSequence RootResetProbeBranch
open RootResetCompletedResponseAtoms RootResetCompletedResponseProbe

def basePattern (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Pattern :=
  (RootResetCarrierNonemptyRows.baseRow (compileActions program tree)).pattern
def baseCode (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : ProbeCompiler.Control :=
  RootResetCompletedLocalFragment.familyCode [basePattern program tree] (.answer true) (.answer false)
def baseWorker (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Worker := codeWorker (baseCode program tree)
def baseBound (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  RootResetCompletedLocalFragment.familyBound [basePattern program tree]

theorem base_query (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) :
    ∃ ticks state, ticks ≤ baseBound program tree ∧
      run (baseWorker program tree).machine ticks ((baseWorker program tree).initial origin) = ⟨some state, origin⟩ ∧
      (baseWorker program tree).answer? state = some ((basePattern program tree).matchesBool origin.focus) := by
  obtain ⟨member, actual⟩ := RootResetCompletedLocalFragment.family_runs [basePattern program tree]
    (.answer true) (.answer false) (baseCode program tree) origin (fun _ h => h)
  simp only [List.any_cons, List.any_nil, Bool.or_false] at member actual
  cases matched : (basePattern program tree).matchesBool origin.focus <;>
    simp only [matched, Bool.false_eq_true, ↓reduceIte] at member actual ⊢ <;>
    exact ⟨_, ⟨.answer _, member⟩, RootResetCompletedLocalFragment.familyTicks_bound _ _, actual, rfl⟩

theorem base_at (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) :
    QueryAt (baseWorker program tree) (baseBound program tree) origin := by
  obtain ⟨ticks, state, bounded, actual, answered⟩ := base_query program tree origin
  exact ⟨ticks, _, state, Nat.le_trans bounded (constant_bound origin _), actual, answered⟩

def oldestOrHandoff (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Worker :=
  RootResetProbeSequence.worker (oldestWorker program tree) handoffWorker
def body (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Worker :=
  RootResetProbeBranch.worker (parityWorker program tree) (oldestOrHandoff program tree) handoffWorker
def worker (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Worker :=
  RootResetProbeBranch.worker (baseWorker program tree) (body program tree) rejectWorker

def oldestCoefficient (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  RootResetCarrierOldestLiveProbe.coefficient program tree + handoffBound + 2
def bodyCoefficient (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  RootResetCarrierParityProbe.coefficient program tree + oldestCoefficient program tree + handoffBound + 2
def coefficient (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  baseBound program tree + bodyCoefficient program tree + 0 + 2

theorem terminal (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : (worker program tree).Terminal :=
  RootResetProbeBranch.terminal (baseWorker program tree) (body program tree) rejectWorker

theorem all_input (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor)
    (boundary : RootResetCompleteCarrierRows.Boundary origin) :
    RestoringAt (worker program tree) (coefficient program tree) origin := by
  have oldestRestores : RestoringAt (oldestOrHandoff program tree) (oldestCoefficient program tree) origin :=
    sequence_at (oldestWorker program tree) handoffWorker (RootResetCarrierOldestLiveProbe.coefficient program tree) handoffBound
      (oldest_terminal program tree) (code_terminal handoffCode) origin (oldest_at program tree origin boundary) (handoff_at origin)
  have bodyRestores : RestoringAt (body program tree) (bodyCoefficient program tree) origin :=
    RootResetProbeBranch.restoring_at (parityWorker program tree) (oldestOrHandoff program tree) handoffWorker
      (RootResetCarrierParityProbe.coefficient program tree) (oldestCoefficient program tree) handoffBound
      (parity_terminal program tree) (RootResetProbeSequence.terminal (oldestWorker program tree) handoffWorker)
      (code_terminal handoffCode) origin (parity_at program tree origin boundary) oldestRestores (handoff_at origin)
  exact RootResetProbeBranch.restoring_at (baseWorker program tree) (body program tree) rejectWorker
    (baseBound program tree) (bodyCoefficient program tree) 0 (code_terminal (baseCode program tree))
    (RootResetProbeBranch.terminal (parityWorker program tree) (oldestOrHandoff program tree) handoffWorker)
    (code_terminal (.answer false)) origin (base_at program tree origin) bodyRestores (reject_at origin)

theorem readOnly (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : (worker program tree).ReadOnly := by
  apply RootResetProbeBranch.readOnly
  · exact code_readOnly _ (RootResetCompletedLocalFragment.family_readOnly _ _ _ True.intro True.intro)
  · exact RootResetProbeBranch.readOnly _ _ _ (parity_readOnly program tree)
      (RootResetProbeSequence.readOnly _ _ (oldest_readOnly program tree) handoff_readOnly) handoff_readOnly
  · exact code_readOnly _ True.intro

end PureSFormal.Research.RootResetBaseQueueProbe
