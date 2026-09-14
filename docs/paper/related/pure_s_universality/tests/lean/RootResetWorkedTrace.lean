import PureSFormal.Research.RootResetFinitePrioritySelector
import PureSFormal.PureS.BalancedActionTree
import PureSFormal.PureS.PublicDecoder
import PureSFormal.PureS.SchedulerControl
import Lean

/-! Standalone executable worked-example harness. Test-only Repr instances expose
bounded diagnostic descriptions of encountered controls. Driver counters/caps and serialized trees are observational
test instrumentation, never selector state. No global state cover or proof budget runs. -/


set_option maxRecDepth 100000
set_option maxHeartbeats 4000000
open PureSFormal PureSFormal.PureS PureSFormal.Research

/-- Diagnostic projection only: the rest of a shared probe program is not expanded. -/
local instance (priority := 2000) : Repr ProbeCompiler.Control where
  reprPrec q _ := match q with
    | .answer b => "pc.answer(" ++ repr b ++ ")"
    | .observeNode _ _ => "pc.observeNode(<successors omitted>)"
    | .observeIncoming _ _ _ => "pc.observeIncoming(<successors omitted>)"
    | .move primitive _ => "pc.move(" ++ repr primitive ++ ",<successor omitted>)"

deriving instance Repr for PureSFormal.Research.RootResetCarrierNonemptyProbe.Control

deriving instance Repr for PureSFormal.Research.RootResetMixedLocalFragment.Control

deriving instance Repr for PureSFormal.Research.RootResetNestedFrameProbe.Control

deriving instance Repr for PureSFormal.Research.RootResetPendingAdmissionFragment.Control

deriving instance Repr for PureSFormal.Research.RootResetPendingAdmissionInterleaved.Control

deriving instance Repr for PureSFormal.Research.RootResetActiveMarkedFrontend.Control

deriving instance Repr for PureSFormal.Research.RootResetLabelledPatternFragment.Control

deriving instance Repr for PureSFormal.Research.RootResetLabelledEdgeProbe.Control

deriving instance Repr for PureSFormal.Research.RootResetPendingParentProbe.Control

instance (a b : RootResetProbeSequence.Worker) [Repr a.Control] [Repr b.Control] : Repr (RootResetProbeSequence.Control a b) where
  reprPrec q _ := match q with
    | .first s => "first(" ++ repr s ++ ")"
    | .second s => "second(" ++ repr s ++ ")"
    | .done b => "done(" ++ repr b ++ ")"

instance (a b c : RootResetProbeSequence.Worker) [Repr a.Control] [Repr b.Control] [Repr c.Control] : Repr (RootResetProbeBranch.Control a b c) where
  reprPrec q _ := match q with
    | .testing s => "testing(" ++ repr s ++ ")"
    | .positive s => "positive(" ++ repr s ++ ")"
    | .negative s => "negative(" ++ repr s ++ ")"
    | .done b => "done(" ++ repr b ++ ")"

instance (p : CTS.Program) (t : Dispatcher.Tree (ActionLabel p)) (a b : RootResetProbeSequence.Worker) [Repr a.Control] [Repr b.Control] : Repr (RootResetScopedCarrierWorker.Control p t a b) where
  reprPrec q _ := match q with
    | .start => "start"
    | .pending s => "pending(" ++ repr s ++ ")"
    | .nonpending s => "nonpending(" ++ repr s ++ ")"
    | .admitted s => "admitted(" ++ repr s ++ ")"
    | .done b => "done(" ++ repr b ++ ")"

deriving instance Repr for PureSFormal.Research.RootResetCarrierOldestLiveProbe.Control

deriving instance Repr for PureSFormal.Research.RootResetCarrierParityProbe.Control

deriving instance Repr for PureSFormal.Research.RootResetNestedClockCoreProbe.Control

deriving instance Repr for PureSFormal.Research.RootResetNestedClockGrowthProbe.Control

deriving instance Repr for PureSFormal.Research.RootResetNestedUnaryScan.Control

deriving instance Repr for PureSFormal.Research.RootResetNestedUnaryParity.Control

deriving instance Repr for PureSFormal.Research.RootResetNestedClockFirstPass.Result
deriving instance Repr for PureSFormal.Research.RootResetNestedClockFirstPass.Control

deriving instance Repr for PureSFormal.Research.RootResetNestedClockSecondPass.Control

deriving instance Repr for PureSFormal.Research.RootResetNestedClockProbe.Control

deriving instance Repr for PureSFormal.Research.RootResetFrontBitProbe.Control

deriving instance Repr for PureSFormal.Research.RootResetLocalDispatcherProbe.Control

instance (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Repr (RootResetPendingBaseProbe.base program tree).Control := by
  dsimp [RootResetFinitePrioritySelector.SelectionControl, RootResetEmptyAwareResponseProbe.ordinary, RootResetActiveEndpointProbe.Endpoint.worker, PureSFormal.Research.RootResetProbeSequence.worker, PureSFormal.Research.RootResetProbeBranch.worker, PureSFormal.Research.RootResetScopedCarrierWorker.worker, PureSFormal.Research.RootResetCompletedResponseAtoms.codeWorker, PureSFormal.Research.RootResetCompletedResponseAtoms.guardWorker, PureSFormal.Research.RootResetCompletedResponseAtoms.commitWorker, PureSFormal.Research.RootResetCompletedResponseAtoms.handoffWorker, PureSFormal.Research.RootResetCompletedResponseProbe.oldestWorker, PureSFormal.Research.RootResetCompletedResponseProbe.parityWorker, PureSFormal.Research.RootResetCompletedResponseProbe.nonemptyWorker, PureSFormal.Research.RootResetCompletedResponseProbe.rejectWorker, PureSFormal.Research.RootResetCompletedResponseProbe.oldestOrCommit, PureSFormal.Research.RootResetCompletedResponseProbe.body, PureSFormal.Research.RootResetCompletedResponseProbe.worker, PureSFormal.Research.RootResetBaseQueueProbe.baseWorker, PureSFormal.Research.RootResetBaseQueueProbe.oldestOrHandoff, PureSFormal.Research.RootResetBaseQueueProbe.body, PureSFormal.Research.RootResetBaseQueueProbe.worker, PureSFormal.Research.RootResetEndpointPipeline.dispatcherWorker, PureSFormal.Research.RootResetEndpointPipeline.actionWorker, PureSFormal.Research.RootResetEndpointPipeline.clockWorker, PureSFormal.Research.RootResetEndpointPipeline.withTail, PureSFormal.Research.RootResetEndpointPipeline.worker, PureSFormal.Research.RootResetFuelEndpointPipeline.fuelWorker, PureSFormal.Research.RootResetFuelEndpointPipeline.tail, PureSFormal.Research.RootResetFuelEndpointPipeline.worker, PureSFormal.Research.RootResetPendingBaseProbe.base, PureSFormal.Research.RootResetPendingBaseProbe.body, PureSFormal.Research.RootResetPendingBaseProbe.guard, PureSFormal.Research.RootResetPendingBaseProbe.worker, PureSFormal.Research.RootResetEmptyOriginProbe.worker, PureSFormal.Research.RootResetEmptyAwareResponseProbe.emptyBody, PureSFormal.Research.RootResetEmptyAwareResponseProbe.body, PureSFormal.Research.RootResetEmptyAwareResponseProbe.worker, PureSFormal.Research.RootResetScopedResponseProbes.completed, PureSFormal.Research.RootResetScopedResponseProbes.base, PureSFormal.Research.RootResetScopedResponseProbes.baseEndpoint, PureSFormal.Research.RootResetScopedResponseProbes.endpoint, PureSFormal.Research.RootResetActiveEndpointProbe.frontend, PureSFormal.Research.RootResetActiveEndpointProbe.worker, PureSFormal.Research.RootResetResponseCandidateProbe.searchFrontend, PureSFormal.Research.RootResetResponseCandidateProbe.ancestor, PureSFormal.Research.RootResetResponseCandidateProbe.worker, PureSFormal.Research.RootResetFreshResponsePass.worker, PureSFormal.Research.RootResetMarkedCandidateProbe.searchFrontend, PureSFormal.Research.RootResetMarkedCandidateProbe.ancestor, PureSFormal.Research.RootResetMarkedCandidateProbe.worker, PureSFormal.Research.RootResetMarkedHandoffPass.pendingWorker, PureSFormal.Research.RootResetMarkedHandoffPass.worker, PureSFormal.Research.RootResetReplayProbe.worker, PureSFormal.Research.RootResetPriorityReplay.firstWorker, PureSFormal.Research.RootResetPriorityReplay.worker, RootResetFinitePrioritySelector.selectionSpec, RootResetFinitePrioritySelector.laterSpec, RootResetFreshResponsePass.probeSpec, RootResetMarkedHandoffPass.probeSpec, RootResetActiveEndpointProbe.probeSpec, RootResetPriorityReplay.probeSpec]
  infer_instance
deriving instance Repr for PureSFormal.Research.RootResetPendingBaseProbe.Control

deriving instance Repr for PureSFormal.Research.RootResetReadonlySelector.Control

deriving instance Repr for PureSFormal.Research.RootResetFreshAncestorProbe.Control

deriving instance Repr for PureSFormal.Research.RootResetMarkedAncestorProbe.Control

deriving instance Repr for PureSFormal.Research.RootResetPendingAncestorProbe.Control

deriving instance Repr for PureSFormal.Research.RootResetReplayProbe.Control

def tinyProgram : CTS.Program := { period := 2, period_pos := by decide, appendant := fun q => if q.val = 0 then [true] else [] }
def tinyLayout := BalancedActionTree.dispatcher tinyProgram
def tinySpec := RootResetFinitePrioritySelector.selectionSpec tinyProgram tinyLayout
instance : Repr (RootResetReadonlySelector.Control (RootResetFinitePrioritySelector.SelectionControl tinyProgram tinyLayout)) := by
  dsimp [RootResetFinitePrioritySelector.SelectionControl, RootResetEmptyAwareResponseProbe.ordinary, RootResetActiveEndpointProbe.Endpoint.worker, PureSFormal.Research.RootResetProbeSequence.worker, PureSFormal.Research.RootResetProbeBranch.worker, PureSFormal.Research.RootResetScopedCarrierWorker.worker, PureSFormal.Research.RootResetCompletedResponseAtoms.codeWorker, PureSFormal.Research.RootResetCompletedResponseAtoms.guardWorker, PureSFormal.Research.RootResetCompletedResponseAtoms.commitWorker, PureSFormal.Research.RootResetCompletedResponseAtoms.handoffWorker, PureSFormal.Research.RootResetCompletedResponseProbe.oldestWorker, PureSFormal.Research.RootResetCompletedResponseProbe.parityWorker, PureSFormal.Research.RootResetCompletedResponseProbe.nonemptyWorker, PureSFormal.Research.RootResetCompletedResponseProbe.rejectWorker, PureSFormal.Research.RootResetCompletedResponseProbe.oldestOrCommit, PureSFormal.Research.RootResetCompletedResponseProbe.body, PureSFormal.Research.RootResetCompletedResponseProbe.worker, PureSFormal.Research.RootResetBaseQueueProbe.baseWorker, PureSFormal.Research.RootResetBaseQueueProbe.oldestOrHandoff, PureSFormal.Research.RootResetBaseQueueProbe.body, PureSFormal.Research.RootResetBaseQueueProbe.worker, PureSFormal.Research.RootResetEndpointPipeline.dispatcherWorker, PureSFormal.Research.RootResetEndpointPipeline.actionWorker, PureSFormal.Research.RootResetEndpointPipeline.clockWorker, PureSFormal.Research.RootResetEndpointPipeline.withTail, PureSFormal.Research.RootResetEndpointPipeline.worker, PureSFormal.Research.RootResetFuelEndpointPipeline.fuelWorker, PureSFormal.Research.RootResetFuelEndpointPipeline.tail, PureSFormal.Research.RootResetFuelEndpointPipeline.worker, PureSFormal.Research.RootResetPendingBaseProbe.base, PureSFormal.Research.RootResetPendingBaseProbe.body, PureSFormal.Research.RootResetPendingBaseProbe.guard, PureSFormal.Research.RootResetPendingBaseProbe.worker, PureSFormal.Research.RootResetEmptyOriginProbe.worker, PureSFormal.Research.RootResetEmptyAwareResponseProbe.emptyBody, PureSFormal.Research.RootResetEmptyAwareResponseProbe.body, PureSFormal.Research.RootResetEmptyAwareResponseProbe.worker, PureSFormal.Research.RootResetScopedResponseProbes.completed, PureSFormal.Research.RootResetScopedResponseProbes.base, PureSFormal.Research.RootResetScopedResponseProbes.baseEndpoint, PureSFormal.Research.RootResetScopedResponseProbes.endpoint, PureSFormal.Research.RootResetActiveEndpointProbe.frontend, PureSFormal.Research.RootResetActiveEndpointProbe.worker, PureSFormal.Research.RootResetResponseCandidateProbe.searchFrontend, PureSFormal.Research.RootResetResponseCandidateProbe.ancestor, PureSFormal.Research.RootResetResponseCandidateProbe.worker, PureSFormal.Research.RootResetFreshResponsePass.worker, PureSFormal.Research.RootResetMarkedCandidateProbe.searchFrontend, PureSFormal.Research.RootResetMarkedCandidateProbe.ancestor, PureSFormal.Research.RootResetMarkedCandidateProbe.worker, PureSFormal.Research.RootResetMarkedHandoffPass.pendingWorker, PureSFormal.Research.RootResetMarkedHandoffPass.worker, PureSFormal.Research.RootResetReplayProbe.worker, PureSFormal.Research.RootResetPriorityReplay.firstWorker, PureSFormal.Research.RootResetPriorityReplay.worker, RootResetFinitePrioritySelector.selectionSpec, RootResetFinitePrioritySelector.laterSpec, RootResetFreshResponsePass.probeSpec, RootResetMarkedHandoffPass.probeSpec, RootResetActiveEndpointProbe.probeSpec, RootResetPriorityReplay.probeSpec]
  infer_instance


namespace WorkedRootTrace
open FiniteController RootResetSelectorContract
abbrev RootState := RootResetReadonlySelector.Control (RootResetFinitePrioritySelector.SelectionControl tinyProgram tinyLayout)
def rootMachine := RootResetReadonlySelector.machine tinySpec

def emit (fields : List (String × Lean.Json)) : IO Unit := do
  IO.println (Lean.Json.mkObj fields).compress
  (← IO.getStdout).flush

def jn (n : Nat) : Lean.Json := Lean.toJson n
def js (s : String) : Lean.Json := Lean.toJson s

def treePrefix : Term → String
  | .s => "S"
  | .app a b => "A" ++ treePrefix a ++ treePrefix b

def address (cursor : Cursor) : String :=
  String.ofList ((cursorAddress cursor).map fun | .left => 'L' | .right => 'R')

def decoded (term : Term) : Lean.Json :=
  match PublicDecoder.decode tinyProgram tinyLayout.tree term with
  | none => .null
  | some (horizon, config) => Lean.Json.mkObj
      [("horizon", jn horizon), ("phase", jn config.phase.val),
       ("data", js (String.ofList (config.data.map fun b => if b then '1' else '0')))]

def commandTag : Command α → String
  | .stay _ => "stay"
  | .reject => "reject"
  | .exec .L _ => "L"
  | .exec .R _ => "R"
  | .exec .U _ => "U"
  | .exec .Rdx _ => "Rdx"

def nodeTag : Probe.NodeKind → String | .s => "S" | .app => "A"
def incomingTag : Probe.Incoming → String | .root => "root" | .left => "L" | .right => "R"

unsafe def stateId (registry : IO.Ref (Array RootState)) (state : RootState) : IO Nat := do
  let states ← registry.get
  match states.toList.findIdx? (fun known => ptrEq known state) with
  | some index => pure index
  | none =>
      let index := states.size
      registry.set (states.push state)
      emit [("kind", js "control"), ("id", jn index), ("description", js (reprStr state))]
      pure index

unsafe def traceSelect (registry : IO.Ref (Array RootState)) (trace : Bool)
    (cap ticks mutations : Nat) (cfg : Configuration RootState) :
    IO (Nat × Nat × Configuration RootState) := do
  let mut cap := cap
  let mut ticks := ticks
  let mut mutations := mutations
  let mut cfg := cfg
  while true do
    match cfg.control with
    | none => throw (IO.userError "root selector rejected")
    | some q =>
        match RootResetReadonlySelector.haltKind q with
        | some .nf => throw (IO.userError "unexpected target normal form")
        | some .redex =>
            if trace then
              let id ← stateId registry q
              emit [("kind", js "halt"), ("sample", jn 0), ("tick", jn ticks),
                ("control", jn id), ("address", js (address cfg.cursor))]
            return (ticks, mutations, cfg)
        | none =>
            if cap == 0 then throw (IO.userError "root microtick cap exceeded")
            let node := Probe.observeNode cfg.cursor
            let incoming := Probe.observeIncoming cfg.cursor
            let cmd := rootMachine.transition q node incoming
            let next := FiniteController.step rootMachine cfg
            let count := mutationCount rootMachine cfg
            if trace then
              let before ← stateId registry q
              let after ← match next.control with
                | none => throw (IO.userError "trace rejected")
                | some q' => stateId registry q'
              emit [("kind", js "microtick"), ("sample", jn 0), ("tick", jn ticks),
                ("control", jn before), ("node", js (nodeTag node)),
                ("incoming", js (incomingTag incoming)), ("address", js (address cfg.cursor)),
                ("command", js (commandTag cmd)), ("next_control", jn after),
                ("next_address", js (address next.cursor)), ("mutations", jn count)]
            cap := cap - 1
            ticks := ticks + 1
            mutations := mutations + count
            cfg := next
  throw (IO.userError "root selector loop terminated unexpectedly")

def persistentNext (machine : Machine α) : Nat → Nat → Configuration α → Except String (Nat × Configuration α)
  | 0, _, _ => .error "persistent microtick cap exceeded"
  | cap+1, ticks, cfg =>
      match cfg.control with
      | none => .error "persistent reject"
      | some _ =>
          let next := FiniteController.step machine cfg
          if mutationCount machine cfg == 1 then .ok (ticks+1, next)
          else persistentNext machine cap (ticks+1) next

unsafe def run : IO Unit := do
  let registry ← IO.mkRef (#[] : Array RootState)
  let initial := SchedulerControl.initialConfiguration tinyProgram tinyLayout [true, false, true]
  let mut term := initial.cursor.erase
  let mut persistent := initial
  emit [("kind", js "header"), ("schema", js "FRESH_ROOT_WORKED_TRACE_V1"),
    ("appendants", Lean.toJson (["1", ""] : List String)), ("input", js "101"),
    ("samples", jn 85), ("root_cap", jn 1000000), ("persistent_cap", jn 100000),
    ("term_cap", jn 1000000), ("control_coverage", js "retained process-local control-object diagnostic IDs and bounded constructor/current-instruction descriptions; not canonical finite-state identities; no global cover evaluated")]
  emit [("kind", js "initial"), ("term", js (treePrefix term)), ("nodes", jn term.size), ("decoded", decoded term)]
  let mut rootTotal := 0
  let mut persistentTotal := 0
  for sample in [:85] do
    if term.size > 1000000 then throw (IO.userError "term cap exceeded")
    let start := RootResetReadonlySelector.initial tinySpec term
    if address start.cursor != "" then throw (IO.userError "not rooted")
    let (ticks, mutations, after) ← traceSelect registry (sample == 0) 1000000 0 0 start
    if mutations != 1 then throw (IO.userError "not exactly one native contraction")
    let target := after.cursor.erase
    let path := cursorAddress after.cursor
    if term.contractAt? path != some target then throw (IO.userError "native contraction mismatch")
    let (pticks, pnext) ← match persistentNext (SchedulerControl.machine tinyProgram tinyLayout) 100000 0 persistent with
      | .error why => throw (IO.userError why)
      | .ok value => pure value
    if pnext.cursor.erase != target || cursorAddress pnext.cursor != path then
      throw (IO.userError "persistent/root selected-path mismatch")
    let idle1 := FiniteController.step rootMachine after
    let idle2 := FiniteController.step rootMachine idle1
    if idle1.cursor.erase != target || idle2.cursor.erase != target ||
        mutationCount rootMachine after != 0 || mutationCount rootMachine idle1 != 0 then
      throw (IO.userError "terminal state did not preserve term")
    emit [("kind", js "contraction"), ("sample", jn sample), ("initial_address", js (address start.cursor)),
      ("initial_control", js "RootResetReadonlySelector.Control.probe tinySpec.start"),
      ("address", js (address after.cursor)), ("root_microticks", jn ticks),
      ("persistent_microticks", jn pticks), ("mutations", jn mutations),
      ("source_nodes", jn term.size), ("target_nodes", jn target.size),
      ("target", js (treePrefix target)), ("decoded", decoded target), ("absorbing_ticks_checked", jn 2)]
    term := target
    persistent := pnext
    rootTotal := rootTotal+ticks
    persistentTotal := persistentTotal+pticks
  emit [("kind", js "complete"), ("samples", jn 85), ("root_microticks", jn rootTotal),
    ("persistent_microticks", jn persistentTotal), ("final_nodes", jn term.size)]
end WorkedRootTrace

unsafe def main : IO Unit := WorkedRootTrace.run
