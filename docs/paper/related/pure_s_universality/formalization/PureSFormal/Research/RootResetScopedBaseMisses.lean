import PureSFormal.Research.RootResetScopedResponseProbes
import PureSFormal.Research.RootResetActiveClockEndpointAgreement

/-! Actual Base-query misses on the generated dispatcher, action, fuel and CLOCK endpoints. -/
namespace PureSFormal.Research.RootResetScopedBaseMisses
open PureSFormal.PureS
open FiniteController SchedulerInvariant RootResetClockFuelStages RootResetClockFuelCanonicalGrammar
open RootResetCompletedLocalPatterns RootResetProbeSequence RootResetCompletedResponseAtoms
open RootResetCarrierNonemptyProbe (liftConfiguration)

theorem base_pattern_clock (actions : Term) (stage wrappers left right : Nat) (environment : Term) :
    (RootResetCarrierNonemptyRows.basePattern actions).matchesBool
      (.app (clockWrap stage wrappers (.app (C left) (C right))) environment) = false := by
  cases wrappers with
  | zero => cases right <;> rfl
  | succ wrappers =>
      cases wrappers <;> cases left <;> cases right <;>
        simp only [RootResetCarrierNonemptyRows.basePattern, RootResetCarrierNonemptyRows.environmentPattern,
          clockWrap, C, b, literal, actCode, Pattern.matchesBool, Bool.false_and, Bool.and_false]

theorem base_pattern_exit (actions : Term) (stage remaining : Nat) (environment : Term) :
    (RootResetCarrierNonemptyRows.basePattern actions).matchesBool (Dovetail.clockExit stage remaining environment) = false := by
  rw [Dovetail.clockExit, RootResetClockParityWalker.clockWrappers_eq_clockWrap]
  exact base_pattern_clock actions stage remaining (stage + 1) (stage + 1) environment

theorem alphaPattern_exit (actions : Term) (stage remaining : Nat) (environment : Term) :
    (Pattern.app (Pattern.app (RootResetCarrierNonemptyRows.environmentPattern actions)
      (.app (literal b) (RootResetCarrierNonemptyRows.environmentPattern actions))) .hole).matchesBool
      (Dovetail.clockExit stage remaining environment) = false := by
  cases remaining with
  | zero => rfl
  | succ remaining => cases stage <;> rfl

theorem base_pattern_zero (position : ZeroPosition) (actions payload : Term) (stage remaining : Nat) (environment : Term) :
    (RootResetCarrierNonemptyRows.basePattern actions).matchesBool
      (position.row actions payload (Dovetail.clockExit stage remaining environment)).term = false := by
  cases position with
  | call | first | second | fourth => rfl
  | third =>
      simp only [ZeroPosition.row, FuelRow.term, RootResetCarrierNonemptyRows.basePattern,
        Pattern.matchesBool, alphaPattern_exit, Bool.false_and, Bool.and_false]

theorem base_pattern_call (actions payload continuation : Term) (number : Nat) :
    (RootResetCarrierNonemptyRows.basePattern actions).matchesBool
      (FuelRow.call number (CheckpointDecoder.openEnvironment actions payload) continuation).term = false := by
  rfl

theorem base_pattern_positiveHalf (actions leftEnvironment rightEnvironment continuation : Term) (residual : Nat) :
    (RootResetCarrierNonemptyRows.basePattern actions).matchesBool
      (FuelRow.positiveHalf residual leftEnvironment rightEnvironment continuation).term = false := by
  cases residual <;> rfl

theorem pending_pattern_of_not_pending (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (source : Term)
    (notPending : ∀ payload continuation child, source ≠
      .app (.app (CheckpointDecoder.openEnvironment (compileActions program tree) payload) continuation) child) :
    (RootResetPendingBaseProbe.pattern program tree).matchesBool source = false := by
  cases matched : (RootResetPendingBaseProbe.pattern program tree).matchesBool source with
  | false => rfl
  | true =>
      obtain ⟨payload, continuation, child, equal, _⟩ := RootResetPendingAdmissionPatterns.pending_sound _ source _ matched
      exact (notPending payload continuation child equal).elim

theorem pending_pattern_fuel (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (fuel : FuelRow) (canonical : CanonicalFuelRow (compileActions program tree) fuel) :
    (RootResetPendingBaseProbe.pattern program tree).matchesBool fuel.term = false :=
  pending_pattern_of_not_pending program tree fuel.term (RootResetActiveFuelEndpointAgreement.canonical_not_pending program tree fuel canonical)

theorem pending_pattern_local (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (audit dispatcher payload seedAudit continuation continuationAudit : Term) :
    (RootResetPendingBaseProbe.pattern program tree).matchesBool
      (CheckpointDecoder.openShell (freshHField audit) dispatcher payload seedAudit continuation continuationAudit) = false := by
  apply pending_pattern_of_not_pending
  intro seed outer child equal
  have arity := congrArg Term.headArity equal
  change (6 : Nat) = 3 at arity
  cases arity

theorem pending_pattern_clock (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (stage wrappers left right : Nat) (environment : Term) :
    (RootResetPendingBaseProbe.pattern program tree).matchesBool
      (.app (clockWrap stage wrappers (.app (C left) (C right))) environment) = false := by
  apply pending_pattern_of_not_pending
  intro payload continuation child equal
  cases wrappers with
  | zero =>
      have arity := congrArg Term.headArity equal
      cases left <;> change (4 : Nat) = 3 at arity <;> cases arity
  | succ wrappers =>
      have envEq := (Term.app.inj (Term.app.inj equal).1).1
      have rejected : (RootResetPendingAdmissionPatterns.environmentPattern (compileActions program tree)).matchesBool
          (.app .s (C stage)) = false := by cases stage <;> rfl
      rw [envEq, RootResetPendingAdmissionPatterns.environment_matches] at rejected
      cases rejected

theorem pending_pattern_exit (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (stage remaining : Nat) (environment : Term) :
    (RootResetPendingBaseProbe.pattern program tree).matchesBool (Dovetail.clockExit stage remaining environment) = false := by
  rw [Dovetail.clockExit, RootResetClockParityWalker.clockWrappers_eq_clockWrap]
  exact pending_pattern_clock program tree stage remaining (stage + 1) (stage + 1) environment

theorem base_worker_missed (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin : Cursor) (missed : (RootResetBaseQueueProbe.basePattern program tree).matchesBool origin.focus = false) :
    ∃ ticks, run (RootResetBaseQueueProbe.worker program tree).machine ticks
      ((RootResetBaseQueueProbe.worker program tree).initial origin) = ⟨some (.done false), origin⟩ := by
  obtain ⟨ticks, state, bounded, actual, answered⟩ := RootResetBaseQueueProbe.base_query program tree origin
  rw [missed] at answered
  obtain ⟨used, usedBound, execution⟩ := RootResetProbeBranch.testing_runs (RootResetBaseQueueProbe.baseWorker program tree)
    (RootResetBaseQueueProbe.body program tree) RootResetCompletedResponseProbe.rejectWorker
    (code_terminal (RootResetBaseQueueProbe.baseCode program tree)) origin origin ticks state false actual answered
  refine ⟨used + 1 + 1, ?_⟩
  exact (run_add (RootResetProbeBranch.machine (RootResetBaseQueueProbe.baseWorker program tree)
      (RootResetBaseQueueProbe.body program tree) RootResetCompletedResponseProbe.rejectWorker) (used + 1) 1 _).trans
    (congrArg (run (RootResetProbeBranch.machine (RootResetBaseQueueProbe.baseWorker program tree)
      (RootResetBaseQueueProbe.body program tree) RootResetCompletedResponseProbe.rejectWorker) 1) execution)

theorem scoped_base_missed (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin : Cursor) (missed : (RootResetBaseQueueProbe.basePattern program tree).matchesBool origin.focus = false) :
    ∃ ticks, run (RootResetScopedResponseProbes.base program tree).machine ticks
      ((RootResetScopedResponseProbes.base program tree).initial origin) = ⟨some (.done false), origin⟩ := by
  let base := RootResetBaseQueueProbe.worker program tree
  let checkedWorker := RootResetScopedResponseProbes.base program tree
  obtain ⟨baseTicks, baseRun⟩ := base_worker_missed program tree origin missed
  obtain ⟨noTicks, noBound, noRun⟩ := RootResetScopedCarrierWorker.nonpending_runs program tree base base
    (RootResetBaseQueueProbe.terminal program tree) origin origin baseTicks (.done false) false baseRun rfl
  obtain ⟨yesTicks, yesBound, yesRun⟩ := RootResetScopedCarrierWorker.admitted_runs program tree base base
    (RootResetBaseQueueProbe.terminal program tree) origin origin baseTicks (.done false) false baseRun rfl
  obtain ⟨pendingTicks, pendingBound, pendingRun⟩ := RootResetScopedCarrierWorker.pending_runs program tree base base origin
  cases incoming : origin.parents with
  | nil =>
      refine ⟨1 + (noTicks + 1), ?_⟩
      rw [run_add]
      have first : run checkedWorker.machine 1 (checkedWorker.initial origin) =
          liftConfiguration RootResetScopedCarrierWorker.Control.nonpending (base.initial origin) := by
        rcases origin with ⟨focus, parents⟩
        simp only at incoming
        subst parents
        rfl
      rw [first]
      exact noRun
  | cons frame parents =>
      cases frame with
      | left sibling =>
          refine ⟨1 + (noTicks + 1), ?_⟩
          rw [run_add]
          have first : run checkedWorker.machine 1 (checkedWorker.initial origin) =
              liftConfiguration RootResetScopedCarrierWorker.Control.nonpending (base.initial origin) := by
            rcases origin with ⟨focus, frames⟩
            simp only at incoming
            subst frames
            rfl
          rw [first]
          exact noRun
      | right sibling =>
          have first : run checkedWorker.machine 1 (checkedWorker.initial origin) =
              liftConfiguration RootResetScopedCarrierWorker.Control.pending (RootResetPendingParentProbe.initial program tree origin) := by
            rcases origin with ⟨focus, frames⟩
            simp only at incoming
            subst frames
            rfl
          cases admitted : RootResetPendingParentProbe.value program tree origin with
          | false =>
              rw [admitted] at pendingRun
              refine ⟨1 + (pendingTicks + 1), ?_⟩
              rw [run_add, first]
              exact pendingRun
          | true =>
              rw [admitted] at pendingRun
              refine ⟨1 + (pendingTicks + 1) + (yesTicks + 1), ?_⟩
              have firstTwo : run checkedWorker.machine (1 + (pendingTicks + 1)) (checkedWorker.initial origin) =
                  liftConfiguration RootResetScopedCarrierWorker.Control.admitted (base.initial origin) := by
                rw [run_add, first]
                exact pendingRun
              rw [run_add, firstTwo]
              exact yesRun

theorem baseEndpoint_missed (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin : Cursor) (baseMiss : (RootResetBaseQueueProbe.basePattern program tree).matchesBool origin.focus = false)
    (pendingMiss : (RootResetPendingBaseProbe.pattern program tree).matchesBool origin.focus = false) :
    ∃ ticks, run (RootResetScopedResponseProbes.baseEndpoint program tree).machine ticks
      ((RootResetScopedResponseProbes.baseEndpoint program tree).initial origin) = ⟨some (.done false), origin⟩ := by
  obtain ⟨baseTicks, baseRun⟩ := scoped_base_missed program tree origin baseMiss
  obtain ⟨pendingTicks, pendingState, pendingRun, answered⟩ := RootResetPendingBaseProbe.missed program tree origin pendingMiss
  obtain ⟨firstUsed, _, firstRun⟩ := RootResetProbeSequence.first_runs (RootResetScopedResponseProbes.base program tree)
    (RootResetPendingBaseProbe.worker program tree) (RootResetScopedResponseProbes.base_terminal program tree)
    origin origin baseTicks (.done false) false baseRun rfl
  obtain ⟨secondUsed, _, secondRun⟩ := RootResetProbeSequence.second_runs (RootResetScopedResponseProbes.base program tree)
    (RootResetPendingBaseProbe.worker program tree) (RootResetPendingBaseProbe.terminal program tree)
    origin origin pendingTicks pendingState false pendingRun answered
  refine ⟨firstUsed + 1 + (secondUsed + 1), ?_⟩
  change run (RootResetProbeSequence.machine _ _) _ (RootResetProbeSequence.initial _ _ origin) = _
  rw [run_add, firstRun]
  exact secondRun

theorem endpoint_after_base_miss (program : CTS.Program) (layout : ActionDispatcher program)
    (origin endpoint : Cursor) (missed : (RootResetBaseQueueProbe.basePattern program layout.tree).matchesBool origin.focus = false)
    (pendingMiss : (RootResetPendingBaseProbe.pattern program layout.tree).matchesBool origin.focus = false)
    (ticks : Nat)
    (actual : run (RootResetFuelEndpointPipeline.worker program layout).machine ticks
      ((RootResetFuelEndpointPipeline.worker program layout).initial origin) = ⟨some (.done true), endpoint⟩) :
    ∃ used, run (RootResetScopedResponseProbes.endpoint program layout).machine used
      ((RootResetScopedResponseProbes.endpoint program layout).initial origin) = ⟨some (.done true), endpoint⟩ := by
  obtain ⟨baseTicks, baseRun⟩ := baseEndpoint_missed program layout.tree origin missed pendingMiss
  obtain ⟨used, bounded, execution⟩ := RootResetProbeSequence.second_selected (RootResetScopedResponseProbes.baseEndpoint program layout.tree)
    (RootResetFuelEndpointPipeline.worker program layout) (RootResetScopedResponseProbes.baseEndpoint_terminal program layout.tree)
    (RootResetFuelEndpointPipeline.terminal program layout) origin endpoint baseTicks ticks (.done false) (.done true) baseRun rfl actual rfl
  exact ⟨used, execution⟩

end PureSFormal.Research.RootResetScopedBaseMisses
