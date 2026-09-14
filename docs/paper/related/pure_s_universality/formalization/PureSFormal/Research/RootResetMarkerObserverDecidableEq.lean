import PureSFormal.Research.RootResetFiniteMarkerObserver

/-! Constructive equality for the concrete finite marker observer. The generic
Worker record does not carry an equality procedure for its hidden control type;
this module supplies constructor comparisons for the actual worker composition.
No machine execution, source replay, classical choice or reducibility override
is used to decide equality. -/

namespace PureSFormal.Research.RootResetMarkerObserverDecidableEq
open PureSFormal.PureS
deriving instance DecidableEq for RootResetReplayProbe.Control
deriving instance DecidableEq for RootResetNestedFrameProbe.Control
deriving instance DecidableEq for RootResetCarrierNonemptyProbe.Control
deriving instance DecidableEq for RootResetMixedLocalFragment.Control
deriving instance DecidableEq for RootResetPendingAdmissionFragment.Control
deriving instance DecidableEq for RootResetPendingAdmissionInterleaved.Control
deriving instance DecidableEq for RootResetActiveMarkedFrontend.Control
deriving instance DecidableEq for RootResetFreshAncestorProbe.Control
deriving instance DecidableEq for RootResetMarkedAncestorProbe.Control
deriving instance DecidableEq for RootResetPendingParentProbe.Control
deriving instance DecidableEq for RootResetPendingAncestorProbe.Control
deriving instance DecidableEq for RootResetLabelledPatternFragment.Control
deriving instance DecidableEq for RootResetLabelledEdgeProbe.Control
deriving instance DecidableEq for RootResetCarrierOldestLiveProbe.Control
deriving instance DecidableEq for RootResetCarrierParityProbe.Control
deriving instance DecidableEq for RootResetNestedClockCoreProbe.Control
deriving instance DecidableEq for RootResetNestedUnaryScan.Control
deriving instance DecidableEq for RootResetNestedUnaryParity.Control
deriving instance DecidableEq for RootResetNestedClockFirstPass.Result
deriving instance DecidableEq for RootResetNestedClockFirstPass.Control
deriving instance DecidableEq for RootResetNestedClockSecondPass.Control
deriving instance DecidableEq for RootResetNestedClockGrowthProbe.Control
deriving instance DecidableEq for RootResetNestedClockProbe.Control
deriving instance DecidableEq for RootResetFrontBitProbe.Control
deriving instance DecidableEq for RootResetLocalDispatcherProbe.Control

def replayControlDecidableEq (α : Type) [DecidableEq α] :
    DecidableEq (RootResetReplayProbe.Control α) := inferInstance

def codeWorkerDecidableEq (code : RootResetPatternFragment.Code) :
    DecidableEq (RootResetCompletedResponseAtoms.codeWorker code).Control := by
  dsimp [RootResetCompletedResponseAtoms.codeWorker]
  infer_instance

instance branchControlDecidableEq (test yes no : RootResetProbeSequence.Worker)
    [DecidableEq test.Control] [DecidableEq yes.Control] [DecidableEq no.Control] :
    DecidableEq (RootResetProbeBranch.Control test yes no) := by
  intro left right
  cases left <;> cases right
  case testing.testing a b => exact decidable_of_iff (a = b) (by constructor <;> intro equal <;> cases equal <;> rfl)
  case positive.positive a b => exact decidable_of_iff (a = b) (by constructor <;> intro equal <;> cases equal <;> rfl)
  case negative.negative a b => exact decidable_of_iff (a = b) (by constructor <;> intro equal <;> cases equal <;> rfl)
  case done.done a b => exact decidable_of_iff (a = b) (by constructor <;> intro equal <;> cases equal <;> rfl)
  all_goals exact isFalse (by intro equal; cases equal)

instance sequenceControlDecidableEq (first second : RootResetProbeSequence.Worker)
    [DecidableEq first.Control] [DecidableEq second.Control] :
    DecidableEq (RootResetProbeSequence.Control first second) := by
  intro left right
  cases left <;> cases right
  case first.first a b => exact decidable_of_iff (a = b) (by constructor <;> intro equal <;> cases equal <;> rfl)
  case second.second a b => exact decidable_of_iff (a = b) (by constructor <;> intro equal <;> cases equal <;> rfl)
  case done.done a b => exact decidable_of_iff (a = b) (by constructor <;> intro equal <;> cases equal <;> rfl)
  all_goals exact isFalse (by intro equal; cases equal)

instance scopedControlDecidableEq (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (no yes : RootResetProbeSequence.Worker)
    [DecidableEq no.Control] [DecidableEq yes.Control] :
    DecidableEq (RootResetScopedCarrierWorker.Control program tree no yes) := by
  intro left right
  cases left <;> cases right
  case start.start => exact isTrue rfl
  case pending.pending a b => exact decidable_of_iff (a = b) (by constructor <;> intro equal <;> cases equal <;> rfl)
  case nonpending.nonpending a b => exact decidable_of_iff (a = b) (by constructor <;> intro equal <;> cases equal <;> rfl)
  case admitted.admitted a b => exact decidable_of_iff (a = b) (by constructor <;> intro equal <;> cases equal <;> rfl)
  case done.done a b => exact decidable_of_iff (a = b) (by constructor <;> intro equal <;> cases equal <;> rfl)
  all_goals exact isFalse (by intro equal; cases equal)

instance pendingBaseControlDecidableEq (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    [DecidableEq (RootResetPendingBaseProbe.base program tree).Control] :
    DecidableEq (RootResetPendingBaseProbe.Control program tree) := by
  intro left right
  cases left <;> cases right
  case start.start => exact isTrue rfl
  case base.base a b => exact decidable_of_iff (a = b) (by constructor <;> intro equal <;> cases equal <;> rfl)
  case done.done a b => exact decidable_of_iff (a = b) (by constructor <;> intro equal <;> cases equal <;> rfl)
  all_goals exact isFalse (by intro equal; cases equal)

def observerControlDecidableEq (program : CTS.Program) (layout : ActionDispatcher program) :
    DecidableEq (RootResetFiniteMarkerObserver.observer program layout).Control := by
  unfold RootResetFiniteMarkerObserver.observer RootResetProbeBranch.worker
  refine @branchControlDecidableEq _ _ _ ?_ ?_ ?_
  all_goals dsimp [RootResetFiniteMarkerObserver.selectionWorker, RootResetPriorityReplay.firstWorker,
    RootResetFiniteMarkerObserver.shapeWorker, RootResetFiniteMarkerObserver.rejectWorker,
    RootResetCompletedResponseAtoms.codeWorker]
  all_goals
    repeat' first
      | exact inferInstance
      | refine @branchControlDecidableEq _ _ _ ?_ ?_ ?_
      | refine @sequenceControlDecidableEq _ _ ?_ ?_
      | refine @replayControlDecidableEq _ ?_
      | exact codeWorkerDecidableEq _
      | refine @scopedControlDecidableEq _ _ _ _ ?_ ?_
      | refine @pendingBaseControlDecidableEq _ _ ?_
      | exact (inferInstance : (DecidableEq (RootResetActiveMarkedFrontend.Control program layout.tree)))
      | exact (inferInstance : (DecidableEq (RootResetFreshAncestorProbe.Control program layout.tree)))
      | exact (inferInstance : (DecidableEq (RootResetMarkedAncestorProbe.Control program layout.tree)))
      | exact (inferInstance : (DecidableEq (RootResetPendingAncestorProbe.Control program layout.tree)))
      | exact (inferInstance : (DecidableEq (RootResetLocalDispatcherProbe.Control program layout)))
      | exact (inferInstance : (DecidableEq RootResetNestedClockProbe.Control))
      | exact (inferInstance : (DecidableEq (RootResetCarrierOldestLiveProbe.Control program layout.tree)))
      | exact (inferInstance : (DecidableEq (RootResetCarrierNonemptyProbe.Control program layout.tree)))
      | exact (inferInstance : (DecidableEq (RootResetCarrierParityProbe.Control program layout.tree)))
      | exact (inferInstance : (DecidableEq (RootResetEmptyOriginProbe.Control program layout.tree)))

instance observerDecidableEq (program : CTS.Program) (layout : ActionDispatcher program) :
    DecidableEq (RootResetFiniteMarkerObserver.observer program layout).Control :=
  observerControlDecidableEq program layout

end PureSFormal.Research.RootResetMarkerObserverDecidableEq
