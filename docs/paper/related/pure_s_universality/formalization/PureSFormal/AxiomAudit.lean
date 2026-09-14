import PureSFormal.RootResetHeadline
import PureSFormal.AppendixF.AutonomousObstruction
import PureSFormal.AppendixF.PathFamilies
import PureSFormal.AppendixF.RegularAvoidance
import PureSFormal.AppendixF.CarrierRecognition
import PureSFormal.AppendixF.CarrierSummaryBound
import PureSFormal.AppendixF.CallRecognition
import PureSFormal.AppendixF.HoldAllData
import PureSFormal.AppendixF.IncomparableBasins
import PureSFormal.AppendixF.ClassicalSeeds
import PureSFormal.PureS.Term
import PureSFormal.PureS.Reduction
import PureSFormal.PureS.Cursor
import PureSFormal.PureS.Script
import PureSFormal.PureS.Pattern
import PureSFormal.PureS.Probe
import PureSFormal.PureS.MutationFreePeriodicity
import PureSFormal.PureS.Dispatcher
import PureSFormal.PureS.ClosedTerms
import PureSFormal.PureS.Appender
import PureSFormal.PureS.Activation
import PureSFormal.PureS.Arity
import PureSFormal.PureS.RouteGrammar
import PureSFormal.PureS.RouteExecution
import PureSFormal.PureS.RouteParser
import PureSFormal.PureS.Actions
import PureSFormal.PureS.ActionTree
import PureSFormal.PureS.ActionParser
import PureSFormal.PureS.DispatchParser
import PureSFormal.PureS.RouteAction
import PureSFormal.PureS.Frame
import PureSFormal.PureS.Carrier
import PureSFormal.PureS.CellSpine
import PureSFormal.PureS.CellDeletion
import PureSFormal.PureS.BasePath
import PureSFormal.PureS.MutableBase
import PureSFormal.PureS.ActionDecode
import PureSFormal.PureS.LocalResponse
import PureSFormal.PureS.RootPath
import PureSFormal.PureS.CanonicalStep
import PureSFormal.PureS.CarrierDecoder
import PureSFormal.PureS.CarrierActionDecode
import PureSFormal.PureS.PendingFrame
import PureSFormal.PureS.ReachableAudit
import PureSFormal.PureS.CompleteLayer
import PureSFormal.PureS.Clock
import PureSFormal.PureS.Dovetail
import PureSFormal.CTS.Core
import PureSFormal.WeakPath.Interface
import PureSFormal.Rogozhin.Table
import PureSFormal.Rogozhin.Machine
import PureSFormal.Cook.Tag

/-!
# Semantic-layer axiom audit

This module intentionally declares nothing.  It audits the stated
results at each semantic layer, including the headline, Rogozhin and
Appendix F results imported above.

Audit classification:

* `does not depend on any axioms` is the strongest result;
* `propext` and `Quot.sound` are permitted only in the exact per-declaration
  sets recorded by `formalization/scripts/audit_axioms.py`;
* `Classical.choice` is additionally permitted for the seven Appendix F
  declarations whose recorded sets explicitly include it; and
* project-declared axioms, `sorryAx`, and any other unlisted dependency fail
  this audit. Rogozhin imports are part of the audited construction.

Accordingly, "axiom-free" below means free of project-declared mathematical
assumptions.  The command output intentionally exposes, rather than hides,
the exact Lean logical-basis dependencies.

The companion audit script records the exact expected set for every theorem
printed below and rejects both missing declarations and changed axiom sets.
The separate public-declaration audit applies its recorded policy to all
319 public exports; this file does not weaken either gate.
-/

-- Occurrence contexts and functional replacement.
#print axioms PureSFormal.PureS.Term.context_of_subterm
#print axioms PureSFormal.PureS.Term.replace?_self
#print axioms PureSFormal.PureS.Term.replace?_deterministic

-- Address-level and one-cursor contraction soundness.
#print axioms PureSFormal.PureS.Term.contractAt?_sound
#print axioms PureSFormal.PureS.Cursor.rdx?_sound
#print axioms PureSFormal.PureS.Script.run_projects_stepsN
#print axioms PureSFormal.PureS.Pattern.matchesBool_eq_true_iff
#print axioms PureSFormal.PureS.Probe.run_spec
#print axioms PureSFormal.PureS.Probe.run_ne_none
#print axioms PureSFormal.PureS.Probe.run_restores
#print axioms PureSFormal.PureS.Probe.run_success_iff
#print axioms PureSFormal.PureS.Probe.run_mismatch_iff
#print axioms PureSFormal.PureS.Probe.runParent_spec
#print axioms PureSFormal.PureS.Probe.runParent_ne_none
#print axioms PureSFormal.PureS.Probe.runParent_restores
#print axioms PureSFormal.PureS.Probe.runParent_success_iff
#print axioms PureSFormal.PureS.Probe.stateBound_pos
#print axioms PureSFormal.PureS.FiniteController.erase_run_eq_of_mutation_free
#print axioms PureSFormal.PureS.FiniteController.exists_repeat_within_stateBound_of_mutation_free
#print axioms PureSFormal.PureS.FiniteController.eventually_periodic_of_mutation_free
#print axioms PureSFormal.PureS.Dispatcher.hasRoute_iff_lookup?

-- Total CTS iteration, phase behavior, absorbing emptiness, and additivity.
#print axioms PureSFormal.CTS.iterate_phase_val
#print axioms PureSFormal.CTS.iterate_empty
#print axioms PureSFormal.CTS.iterate_empty_period
#print axioms PureSFormal.CTS.iterate_add

-- Counted closed-term laws (C1) and live-cell deletion (C4).
#print axioms PureSFormal.PureS.C1_succ
#print axioms PureSFormal.PureS.C1_zero
#print axioms PureSFormal.PureS.C2_frames
#print axioms PureSFormal.PureS.C4_live_delete
#print axioms PureSFormal.PureS.C5_push
#print axioms PureSFormal.PureS.C6_appender
#print axioms PureSFormal.PureS.nodeCode_activate
#print axioms PureSFormal.PureS.chosen_ne_dormantCall
#print axioms PureSFormal.PureS.RouteGrammar.nodeAlternatives_disjoint
#print axioms PureSFormal.PureS.RouteExecution.compiledCall_executeRoute_spec
#print axioms PureSFormal.PureS.RouteParser.parse_sound
#print axioms PureSFormal.PureS.RouteParser.parse_complete
#print axioms PureSFormal.PureS.RouteParser.generated_route_unique
#print axioms PureSFormal.PureS.executeAction
#print axioms PureSFormal.PureS.Dispatcher.Tree.leaves_chain
#print axioms PureSFormal.PureS.Dispatcher.Tree.leafCount_chain
#print axioms PureSFormal.PureS.Dispatcher.Tree.leaves_ofList_of_ne_nil
#print axioms PureSFormal.PureS.Dispatcher.Tree.exists_hasRoute_of_mem_leaves
#print axioms PureSFormal.PureS.length_phaseActions
#print axioms PureSFormal.PureS.phase_mem_finRange
#print axioms PureSFormal.PureS.mem_phaseActions_of_mem
#print axioms PureSFormal.PureS.allActionLabels_ne_nil
#print axioms PureSFormal.PureS.actionTree_leaves
#print axioms PureSFormal.PureS.mem_allActionLabels
#print axioms PureSFormal.PureS.length_allActionLabels
#print axioms PureSFormal.PureS.actionTree_leafCount
#print axioms PureSFormal.PureS.actionTree_complete
#print axioms PureSFormal.PureS.actionTree_lookup_complete
#print axioms PureSFormal.PureS.ActionDispatcher.existsRoute
#print axioms PureSFormal.PureS.ActionDispatcher.routeLabel_unique
#print axioms PureSFormal.PureS.Dispatcher.Tree.findRoute?_sound
#print axioms PureSFormal.PureS.Dispatcher.Tree.findRoute?_complete
#print axioms PureSFormal.PureS.ActionDispatcher.canonicalRoute_valid
#print axioms PureSFormal.PureS.ActionDispatcher.selectedRoute
#print axioms PureSFormal.PureS.RouteGrammar.ActivatedRoute.reduceResponse
#print axioms PureSFormal.PureS.RouteAction.execute
#print axioms PureSFormal.PureS.ActionParser.parse_eq_some_iff
#print axioms PureSFormal.PureS.ActionParser.parse_actionResult
#print axioms PureSFormal.PureS.ActionParser.ActionShape.accumulator_subterm
#print axioms PureSFormal.PureS.DispatchParser.parse_eq_some_iff
#print axioms PureSFormal.PureS.DispatchParser.dispatchesTo_rightUnique
#print axioms PureSFormal.PureS.framePrefix
#print axioms PureSFormal.PureS.freshLocal_mark
#print axioms PureSFormal.PureS.markH_ne_zeroAction

-- Carrier grammar, canonical registered fields, and cell-spine decoding.
#print axioms PureSFormal.PureS.Carrier.QueueStep.deterministic
#print axioms PureSFormal.PureS.Carrier.QueueSegment.word
#print axioms PureSFormal.PureS.Carrier.baseCarrier_ne_shell
#print axioms PureSFormal.PureS.Carrier.LocalShell.dispatcher_deterministic
#print axioms PureSFormal.PureS.Carrier.Grammar.root_headArity
#print axioms PureSFormal.PureS.Carrier.CompletedChain.liftStepsN
#print axioms PureSFormal.PureS.CellSpine.decode?_eq_some_iff
#print axioms PureSFormal.PureS.CellSpine.decode?_word
#print axioms PureSFormal.PureS.CellDeletion.canonicalFront
#print axioms PureSFormal.PureS.CellDeletion.IsCanonicalFront.endpoint_decodes
#print axioms PureSFormal.PureS.CellDeletion.IsCanonicalFront.hasLaterLive_iff
#print axioms PureSFormal.PureS.BasePath.word_subterm
#print axioms PureSFormal.PureS.BasePath.validate?_eq_some_iff
#print axioms PureSFormal.PureS.BasePath.validated_not_local
#print axioms PureSFormal.PureS.BasePath.decodeInitial?_base
#print axioms PureSFormal.PureS.MutableBase.queue_subterm
#print axioms PureSFormal.PureS.MutableBase.parse?_eq_some_iff
#print axioms PureSFormal.PureS.MutableBase.parseMutable?_eq_some_iff
#print axioms PureSFormal.PureS.MutableBase.mutableBase_word
#print axioms PureSFormal.PureS.MutableBase.stepsN_mutableBase_queue
#print axioms PureSFormal.PureS.MutableBase.base_ne_shell
#print axioms PureSFormal.PureS.MutableBase.parsed_not_local
#print axioms PureSFormal.PureS.MutableBase.mutableBase_root_headArity
#print axioms PureSFormal.PureS.ActionDecode.decode_actionAccumulator
#print axioms PureSFormal.PureS.ActionDecode.decode_actionAccumulator_eq_CTS
#print axioms PureSFormal.PureS.LocalResponse.execute
#print axioms PureSFormal.PureS.LocalResponse.executeZeroMarked
#print axioms PureSFormal.PureS.LocalResponse.completed_continuation
#print axioms PureSFormal.PureS.RootPath.initial_exactBase
#print axioms PureSFormal.PureS.RootPath.Root.headArity
#print axioms PureSFormal.PureS.RootPath.Path.root_ne_live
#print axioms PureSFormal.PureS.RootPath.Path.root_ne_tombstone
#print axioms PureSFormal.PureS.RootPath.Path.live_ne_tombstone
#print axioms PureSFormal.PureS.RootPath.Path.actionAccumulator
#print axioms PureSFormal.PureS.RootPath.execute_fromRoot
#print axioms PureSFormal.PureS.RootPath.executeZeroMarked_fromRoot
#print axioms PureSFormal.PureS.RootPath.topLive_delete_path
#print axioms PureSFormal.PureS.RootPath.Root.deleteBaseFront

-- Total one-step canonical classification and opaque-field invariance.
#print axioms PureSFormal.PureS.CanonicalStep.localAccumulator?_sound
#print axioms PureSFormal.PureS.CanonicalStep.localAccumulator?_complete
#print axioms PureSFormal.PureS.CanonicalStep.parseCell?_sound
#print axioms PureSFormal.PureS.CanonicalStep.classify_sound
#print axioms PureSFormal.PureS.CanonicalStep.classify_complete
#print axioms PureSFormal.PureS.CanonicalStep.classify_eq_iff
#print axioms PureSFormal.PureS.CanonicalStep.classify_eq_base_iff
#print axioms PureSFormal.PureS.CanonicalStep.classify_eq_local_iff
#print axioms PureSFormal.PureS.CanonicalStep.classify_eq_live_iff
#print axioms PureSFormal.PureS.CanonicalStep.classify_eq_tombstone_iff
#print axioms PureSFormal.PureS.CanonicalStep.classify_eq_malformed_iff
#print axioms PureSFormal.PureS.CanonicalStep.parsedBase_ne_local
#print axioms PureSFormal.PureS.CanonicalStep.parsedBase_ne_live
#print axioms PureSFormal.PureS.CanonicalStep.parsedBase_ne_tombstone
#print axioms PureSFormal.PureS.CanonicalStep.local_ne_live
#print axioms PureSFormal.PureS.CanonicalStep.local_ne_tombstone
#print axioms PureSFormal.PureS.CanonicalStep.live_ne_tombstone
#print axioms PureSFormal.PureS.CanonicalStep.classify_permissiveBase
#print axioms PureSFormal.PureS.CanonicalStep.classify_mutableBase
#print axioms PureSFormal.PureS.CanonicalStep.classify_base
#print axioms PureSFormal.PureS.CanonicalStep.classify_local
#print axioms PureSFormal.PureS.CanonicalStep.classify_live
#print axioms PureSFormal.PureS.CanonicalStep.classify_tombstone
#print axioms PureSFormal.PureS.CanonicalStep.classify_local_fields_independent
#print axioms PureSFormal.PureS.CanonicalStep.classify_tombstone_audit_independent
#print axioms PureSFormal.PureS.CanonicalStep.classify_local_of_route_action

-- Total recursive decoding through the permissive public carrier grammar.
#print axioms PureSFormal.PureS.CarrierDecoder.subterm_size_lt
#print axioms PureSFormal.PureS.CarrierDecoder.ProperDescendant.trans
#print axioms PureSFormal.PureS.CarrierDecoder.ProperDescendant.size_lt
#print axioms PureSFormal.PureS.CarrierDecoder.actionShape_accumulator_descendant
#print axioms PureSFormal.PureS.CarrierDecoder.activatedRoute_response_descendant
#print axioms PureSFormal.PureS.CarrierDecoder.dispatchShape_accumulator_descendant
#print axioms PureSFormal.PureS.CarrierDecoder.localChild_descendant
#print axioms PureSFormal.PureS.CarrierDecoder.classifiedLocal_descendant
#print axioms PureSFormal.PureS.CarrierDecoder.classifiedLive_descendant
#print axioms PureSFormal.PureS.CarrierDecoder.classifiedTombstone_descendant
#print axioms PureSFormal.PureS.CarrierDecoder.decode?_permissiveBase
#print axioms PureSFormal.PureS.CarrierDecoder.decode?_mutableBase
#print axioms PureSFormal.PureS.CarrierDecoder.decode?_local
#print axioms PureSFormal.PureS.CarrierDecoder.decode?_live
#print axioms PureSFormal.PureS.CarrierDecoder.decode?_tombstone
#print axioms PureSFormal.PureS.CarrierDecoder.decode?_sound
#print axioms PureSFormal.PureS.CarrierDecoder.decode?_complete
#print axioms PureSFormal.PureS.CarrierDecoder.decode?_eq_some_iff
#print axioms PureSFormal.PureS.CarrierDecoder.PathDecodes.deterministic
#print axioms PureSFormal.PureS.CarrierDecoder.RootDecodes.deterministic
#print axioms PureSFormal.PureS.CarrierDecoder.decode?_initial
#print axioms PureSFormal.PureS.CarrierDecoder.decode?_local_of_route_action
#print axioms PureSFormal.PureS.CarrierActionDecode.decode_appenderAccumulator
#print axioms PureSFormal.PureS.CarrierActionDecode.decode_actionAccumulator
#print axioms PureSFormal.PureS.CarrierActionDecode.decode_actionAccumulator_eq_CTS
#print axioms PureSFormal.PureS.CarrierActionDecode.decode_completed
#print axioms PureSFormal.PureS.CarrierActionDecode.executeSelectedDecoded

-- Address-sensitive pending-frame guard and static noncollision table.
#print axioms PureSFormal.PureS.PendingFrame.environmentCode_eq_envelope
#print axioms PureSFormal.PureS.PendingFrame.guard?_eq_some_iff
#print axioms PureSFormal.PureS.PendingFrame.guard?_pending
#print axioms PureSFormal.PureS.PendingFrame.guard?_liveCell
#print axioms PureSFormal.PureS.PendingFrame.tombstone_predecessor_noncollision
#print axioms PureSFormal.PureS.PendingFrame.ActionAscent.parent_subterm
#print axioms PureSFormal.PureS.PendingFrame.ActionAscent.child_subterm
#print axioms PureSFormal.PureS.PendingFrame.ActionAscent.innermost_or_history
#print axioms PureSFormal.PureS.PendingFrame.ActionAscent.rejects_guard
#print axioms PureSFormal.PureS.PendingFrame.actionShape_ascent_noncollision
#print axioms PureSFormal.PureS.PendingFrame.guard?_chosenResponse
#print axioms PureSFormal.PureS.PendingFrame.guard?_selectedLeftFork
#print axioms PureSFormal.PureS.PendingFrame.guard?_selectedRightFork
#print axioms PureSFormal.PureS.PendingFrame.guard?_freshLocalDispatcher
#print axioms PureSFormal.PureS.PendingFrame.guard?_markedLocalDispatcher
#print axioms PureSFormal.PureS.PendingFrame.fixedBasePath_noncollision

-- Exact snapshot provenance and the reachable whole-root audit invariant.
#print axioms PureSFormal.PureS.ReachableAudit.SnapshotRoute.toActivatedRoute
#print axioms PureSFormal.PureS.ReachableAudit.SnapshotRoute.fresh
#print axioms PureSFormal.PureS.ReachableAudit.SnapshotRoute.reduceResponse
#print axioms PureSFormal.PureS.ReachableAudit.actionResponse_initial
#print axioms PureSFormal.PureS.ReachableAudit.actionResponse_shape
#print axioms PureSFormal.PureS.ReachableAudit.actionResponse_steps
#print axioms PureSFormal.PureS.ReachableAudit.SnapshotDispatchAt.toDispatchesTo
#print axioms PureSFormal.PureS.ReachableAudit.SnapshotDispatchAt.execute
#print axioms PureSFormal.PureS.ReachableAudit.SnapshotDispatchAt.reduceAccumulator
#print axioms PureSFormal.PureS.ReachableAudit.Layer.toLocalShell
#print axioms PureSFormal.PureS.ReachableAudit.Layer.root_headArity
#print axioms PureSFormal.PureS.ReachableAudit.Layer.reduceAccumulator
#print axioms PureSFormal.PureS.ReachableAudit.Layer.mark
#print axioms PureSFormal.PureS.ReachableAudit.Layer.dispatcher_noncollision
#print axioms PureSFormal.PureS.ReachableAudit.queueSegment_path
#print axioms PureSFormal.PureS.ReachableAudit.actionAccumulator_segment
#print axioms PureSFormal.PureS.ReachableAudit.Holds.toRoot
#print axioms PureSFormal.PureS.ReachableAudit.Holds.wholeCarrierAudit
#print axioms PureSFormal.PureS.ReachableAudit.Holds.initial
#print axioms PureSFormal.PureS.ReachableAudit.Holds.executeLayer
#print axioms PureSFormal.PureS.ReachableAudit.Holds.markLayer
#print axioms PureSFormal.PureS.ReachableAudit.Holds.markedLocal_dispatcher_noncollision
#print axioms PureSFormal.PureS.CompleteLayer.executeSelected
#print axioms PureSFormal.PureS.CompleteLayer.executeZeroMarked

#print axioms PureSFormal.PureS.clock_diagonal
#print axioms PureSFormal.PureS.clockWrapper_launch
#print axioms PureSFormal.PureS.generator_staging

-- Outer clock/fuel staging and its exact finite job inventory.
#print axioms PureSFormal.PureS.Dovetail.stage_expand
#print axioms PureSFormal.PureS.Dovetail.launch_expandJob
#print axioms PureSFormal.PureS.Dovetail.clockExit_admissible
#print axioms PureSFormal.PureS.Dovetail.headArity_clockExit_eq_four_iff
#print axioms PureSFormal.PureS.Dovetail.headArity_clockExit_eq_three_iff
#print axioms PureSFormal.PureS.Dovetail.clockExit_not_localShell
#print axioms PureSFormal.PureS.Dovetail.length_stageJobs
#print axioms PureSFormal.PureS.Dovetail.generator_to_staging
#print axioms PureSFormal.PureS.Dovetail.clockExit_zero_eq_nextStageSource
#print axioms PureSFormal.PureS.Dovetail.stageExpanded_zero

-- Exact checkpoint acceptance and rejection for the weak-path interface.
#print axioms PureSFormal.WeakPath.Realizes.decode_eq_some_iff

-- Exact reflected Rogozhin UTM(4,6) program table.
#print axioms PureSFormal.Rogozhin46.states_length
#print axioms PureSFormal.Rogozhin46.symbols_length
#print axioms PureSFormal.Rogozhin46.directions_length
#print axioms PureSFormal.Rogozhin46.keys_length
#print axioms PureSFormal.Rogozhin46.table_length
#print axioms PureSFormal.Rogozhin46.state_mem_states
#print axioms PureSFormal.Rogozhin46.symbol_mem_symbols
#print axioms PureSFormal.Rogozhin46.direction_mem_directions
#print axioms PureSFormal.Rogozhin46.key_mem_keys
#print axioms PureSFormal.Rogozhin46.keys_nodup
#print axioms PureSFormal.Rogozhin46.table_nodup
#print axioms PureSFormal.Rogozhin46.mem_map_image
#print axioms PureSFormal.Rogozhin46.exists_of_mem_map
#print axioms PureSFormal.Rogozhin46.cell_mem_table_iff
#print axioms PureSFormal.Rogozhin46.lookup_complete
#print axioms PureSFormal.Rogozhin46.lookup_eq_iff_mem
#print axioms PureSFormal.Rogozhin46.lookup_unique
#print axioms PureSFormal.Rogozhin46.result_unique_of_mem
#print axioms PureSFormal.Rogozhin46.transition_eq_halt_iff
#print axioms PureSFormal.Rogozhin46.blank_is_four
#print axioms PureSFormal.Rogozhin46.halting_cell_count
#print axioms PureSFormal.Rogozhin46.running_cell_count
#print axioms PureSFormal.Rogozhin46.step?_eq_none_iff
#print axioms PureSFormal.Rogozhin46.step?_eq_some_applyTransition
#print axioms PureSFormal.Rogozhin46.absorbingStep_of_step?
#print axioms PureSFormal.Rogozhin46.absorbingStep_of_halted
#print axioms PureSFormal.Rogozhin46.halted_iff
#print axioms PureSFormal.Rogozhin46.iterate_of_halted
#print axioms PureSFormal.Rogozhin46.iterate_add
#print axioms PureSFormal.Rogozhin46.eventuallyHalts_of_halted
#print axioms PureSFormal.Rogozhin46.eventuallyHalts_of_step

-- Specialized Cook deletion-eight tag alphabet and productions.
#print axioms PureSFormal.Cook.Index.toNat_bounds
#print axioms PureSFormal.Cook.indices_length
#print axioms PureSFormal.Cook.indexedBlock_length
#print axioms PureSFormal.Cook.structuredAlphabet_length
#print axioms PureSFormal.Cook.alphabet_length
#print axioms PureSFormal.Cook.index_mem_indices
#print axioms PureSFormal.Cook.symbol_mem_alphabet
#print axioms PureSFormal.Cook.alphabet_nodup
#print axioms PureSFormal.Cook.machineSymbolValue_le_five
#print axioms PureSFormal.Cook.machineSymbolBar_bounds
#print axioms PureSFormal.Cook.shiftExponent_le_fifty_six
#print axioms PureSFormal.Cook.production_head
#print axioms PureSFormal.Cook.production_rightStar
#print axioms PureSFormal.Cook.indexedProduction_j1
#print axioms PureSFormal.Cook.indexedProduction_j7
#print axioms PureSFormal.Cook.indexedProduction_j8
#print axioms PureSFormal.Cook.indexedProduction_halt_C3
#print axioms PureSFormal.Cook.indexedProduction_halt_D3
#print axioms PureSFormal.Cook.indexedProduction_eq_nil_iff
#print axioms PureSFormal.Cook.productionTable_length
#print axioms PureSFormal.Cook.production_complete
#print axioms PureSFormal.Cook.productionEntry_mem_iff
#print axioms PureSFormal.Cook.production_eq_iff_mem
#print axioms PureSFormal.Cook.production_unique
#print axioms PureSFormal.Cook.productionTable_nodup
#print axioms PureSFormal.Cook.production_rhs_closed
#print axioms PureSFormal.Cook.production_length_le_sixty_four
#print axioms PureSFormal.Cook.total_rhs_symbol_count
#print axioms PureSFormal.Cook.empty_production_count

/-! Appendix F theorem dependencies. -/
#print axioms PureSFormal.AppendixF.FiniteOrbit.acceptsWithin_iff
#print axioms PureSFormal.AppendixF.Carrier.eventuallyAccepts_path_iff
#print axioms PureSFormal.AppendixF.Carrier.Configuration.run_step
#print axioms PureSFormal.AppendixF.RecursiveCall.Configuration.native
#print axioms PureSFormal.AppendixF.RecursiveCall.observation_accepts
#print axioms PureSFormal.AppendixF.RecursiveCall.eventuallyAccepts_correct
#print axioms PureSFormal.AppendixF.AAABoundary.aaa_boundary
#print axioms PureSFormal.AppendixF.Carrier.regular_avoidance
#print axioms PureSFormal.AppendixF.RecursiveCall.eventuallyAccepts_path_iff
#print axioms PureSFormal.AppendixF.RecursiveCall.hold_all_data
#print axioms PureSFormal.AppendixF.IncomparableBasins.incomparable
#print axioms PureSFormal.AppendixF.AutonomousObstruction.autonomous_obstruction
#print axioms PureSFormal.AppendixF.AutonomousObstruction.clock_encoder_obstruction
#print axioms PureSFormal.AppendixF.DecidablePathObstruction.decidable_path_obstruction
#print axioms PureSFormal.AppendixF.PathFamilies.finite_union_obstruction
#print axioms PureSFormal.AppendixF.ComputabilityCertificates.computable_iff_certificate
#print axioms PureSFormal.AppendixF.Carrier.Summary.enumeration_bound
#print axioms PureSFormal.AppendixF.ClassicalSeeds.pp_seven_steps
#print axioms PureSFormal.AppendixF.ClockBoundary.clock_one_redex_all
#print axioms PureSFormal.AppendixF.RecursiveCall.recognized_call_has_finite_table
#print axioms PureSFormal.RootResetHeadline.HeadlineUniversality
#print axioms PureSFormal.RootResetHeadline.sCombinatorIsRootResetUniversal
