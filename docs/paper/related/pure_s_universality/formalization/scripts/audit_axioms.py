#!/usr/bin/env python3
"""Run Lean's axiom report and enforce the scoped axiom allowlist."""

from __future__ import annotations

import argparse
import os
import pathlib
import re
import subprocess
import sys


ROOT = pathlib.Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT.parent / "src"))
from lean_axiom_report import axiom_report_lines
AUDIT_MODULE = pathlib.Path("PureSFormal/AxiomAudit.lean")

# These sets are exact.  Removing an allowed dependency is welcome, but it
# must be recorded here so the gate and the checked-in audit classification
# cannot silently drift apart.
EXPECTED_AXIOMS: dict[str, frozenset[str]] = {
    'PureSFormal.RootResetHeadline.HeadlineUniversality': frozenset(['Quot.sound', 'propext']),
    'PureSFormal.RootResetHeadline.sCombinatorIsRootResetUniversal': frozenset(['Quot.sound', 'propext']),
    'PureSFormal.AppendixF.FiniteOrbit.acceptsWithin_iff': frozenset(['Quot.sound', 'propext']),
    'PureSFormal.AppendixF.Carrier.eventuallyAccepts_path_iff': frozenset(['Quot.sound', 'propext']),
    'PureSFormal.AppendixF.Carrier.Configuration.run_step': frozenset(['Quot.sound', 'propext']),
    'PureSFormal.AppendixF.RecursiveCall.Configuration.native': frozenset(['Quot.sound', 'propext']),
    'PureSFormal.AppendixF.RecursiveCall.observation_accepts': frozenset(['Quot.sound', 'propext']),
    'PureSFormal.AppendixF.RecursiveCall.eventuallyAccepts_correct': frozenset(['Quot.sound', 'propext']),
    'PureSFormal.AppendixF.AAABoundary.aaa_boundary': frozenset(['Classical.choice', 'Quot.sound', 'propext']),
    'PureSFormal.AppendixF.Carrier.regular_avoidance': frozenset(['Quot.sound', 'propext']),
    'PureSFormal.AppendixF.RecursiveCall.eventuallyAccepts_path_iff': frozenset(['Quot.sound', 'propext']),
    'PureSFormal.AppendixF.RecursiveCall.hold_all_data': frozenset(['Quot.sound', 'propext']),
    'PureSFormal.AppendixF.IncomparableBasins.incomparable': frozenset(['Classical.choice', 'Quot.sound', 'propext']),
    'PureSFormal.AppendixF.AutonomousObstruction.autonomous_obstruction': frozenset(['Classical.choice', 'Quot.sound', 'propext']),
    'PureSFormal.AppendixF.AutonomousObstruction.clock_encoder_obstruction': frozenset(['Classical.choice', 'Quot.sound', 'propext']),
    'PureSFormal.AppendixF.DecidablePathObstruction.decidable_path_obstruction': frozenset(['Classical.choice', 'Quot.sound', 'propext']),
    'PureSFormal.AppendixF.PathFamilies.finite_union_obstruction': frozenset(['Classical.choice', 'Quot.sound', 'propext']),
    'PureSFormal.AppendixF.ComputabilityCertificates.computable_iff_certificate': frozenset(['Classical.choice', 'Quot.sound', 'propext']),
    'PureSFormal.AppendixF.Carrier.Summary.enumeration_bound': frozenset(['Quot.sound', 'propext']),
    'PureSFormal.AppendixF.ClassicalSeeds.pp_seven_steps': frozenset(['propext']),
    'PureSFormal.AppendixF.ClockBoundary.clock_one_redex_all': frozenset(['Quot.sound', 'propext']),
    'PureSFormal.AppendixF.RecursiveCall.recognized_call_has_finite_table': frozenset(['Quot.sound', 'propext']),
    "PureSFormal.PureS.Term.context_of_subterm": frozenset(['propext']),
    "PureSFormal.PureS.Term.replace?_self": frozenset(['propext']),
    "PureSFormal.PureS.Term.replace?_deterministic": frozenset([]),
    "PureSFormal.PureS.Term.contractAt?_sound": frozenset(['propext']),
    "PureSFormal.PureS.Cursor.rdx?_sound": frozenset(['propext']),
    "PureSFormal.PureS.Script.run_projects_stepsN": frozenset(['propext']),
    "PureSFormal.PureS.Pattern.matchesBool_eq_true_iff": frozenset(['propext']),
    "PureSFormal.PureS.Probe.run_spec": frozenset(['propext']),
    "PureSFormal.PureS.Probe.run_ne_none": frozenset(['propext']),
    "PureSFormal.PureS.Probe.run_restores": frozenset(['propext']),
    "PureSFormal.PureS.Probe.run_success_iff": frozenset(['propext']),
    "PureSFormal.PureS.Probe.run_mismatch_iff": frozenset(['propext']),
    "PureSFormal.PureS.Probe.runParent_spec": frozenset(['propext']),
    "PureSFormal.PureS.Probe.runParent_ne_none": frozenset(['propext']),
    "PureSFormal.PureS.Probe.runParent_restores": frozenset(['propext']),
    "PureSFormal.PureS.Probe.runParent_success_iff": frozenset(['propext']),
    "PureSFormal.PureS.Probe.stateBound_pos": frozenset([]),
    "PureSFormal.PureS.FiniteController.erase_run_eq_of_mutation_free": frozenset(['propext']),
    "PureSFormal.PureS.FiniteController.exists_repeat_within_stateBound_of_mutation_free": frozenset(['Quot.sound', 'propext']),
    "PureSFormal.PureS.FiniteController.eventually_periodic_of_mutation_free": frozenset(['Quot.sound', 'propext']),
    "PureSFormal.PureS.Dispatcher.hasRoute_iff_lookup?": frozenset(['propext']),
    "PureSFormal.CTS.iterate_phase_val": frozenset(['propext']),
    "PureSFormal.CTS.iterate_empty": frozenset(['propext']),
    "PureSFormal.CTS.iterate_empty_period": frozenset(['propext']),
    "PureSFormal.CTS.iterate_add": frozenset(['propext']),
    "PureSFormal.PureS.C1_succ": frozenset(['propext']),
    "PureSFormal.PureS.C1_zero": frozenset(['propext']),
    "PureSFormal.PureS.C2_frames": frozenset(['propext']),
    "PureSFormal.PureS.C4_live_delete": frozenset([]),
    "PureSFormal.PureS.C5_push": frozenset([]),
    "PureSFormal.PureS.C6_appender": frozenset(['propext']),
    "PureSFormal.PureS.nodeCode_activate": frozenset(['propext']),
    "PureSFormal.PureS.chosen_ne_dormantCall": frozenset(['propext']),
    "PureSFormal.PureS.RouteGrammar.nodeAlternatives_disjoint": frozenset(['propext']),
    "PureSFormal.PureS.RouteExecution.compiledCall_executeRoute_spec": frozenset(['propext']),
    "PureSFormal.PureS.RouteParser.parse_sound": frozenset(['propext']),
    "PureSFormal.PureS.RouteParser.parse_complete": frozenset(['propext']),
    "PureSFormal.PureS.RouteParser.generated_route_unique": frozenset(['propext']),
    "PureSFormal.PureS.executeAction": frozenset(['propext']),
    "PureSFormal.PureS.Dispatcher.Tree.leaves_chain": frozenset(['propext']),
    "PureSFormal.PureS.Dispatcher.Tree.leafCount_chain": frozenset(['propext']),
    "PureSFormal.PureS.Dispatcher.Tree.leaves_ofList_of_ne_nil": frozenset(['propext']),
    "PureSFormal.PureS.Dispatcher.Tree.exists_hasRoute_of_mem_leaves": frozenset(['propext']),
    "PureSFormal.PureS.length_phaseActions": frozenset(['propext']),
    "PureSFormal.PureS.phase_mem_finRange": frozenset(['propext']),
    "PureSFormal.PureS.mem_phaseActions_of_mem": frozenset([]),
    "PureSFormal.PureS.allActionLabels_ne_nil": frozenset(['propext']),
    "PureSFormal.PureS.actionTree_leaves": frozenset(['propext']),
    "PureSFormal.PureS.mem_allActionLabels": frozenset(['propext']),
    "PureSFormal.PureS.length_allActionLabels": frozenset(['propext']),
    "PureSFormal.PureS.actionTree_leafCount": frozenset(['propext']),
    "PureSFormal.PureS.actionTree_complete": frozenset(['propext']),
    "PureSFormal.PureS.actionTree_lookup_complete": frozenset(['propext']),
    "PureSFormal.PureS.ActionDispatcher.existsRoute": frozenset([]),
    "PureSFormal.PureS.ActionDispatcher.routeLabel_unique": frozenset([]),
    "PureSFormal.PureS.Dispatcher.Tree.findRoute?_sound": frozenset([]),
    "PureSFormal.PureS.Dispatcher.Tree.findRoute?_complete": frozenset(['propext']),
    "PureSFormal.PureS.ActionDispatcher.canonicalRoute_valid": frozenset(['propext']),
    "PureSFormal.PureS.ActionDispatcher.selectedRoute": frozenset([]),
    "PureSFormal.PureS.RouteGrammar.ActivatedRoute.reduceResponse": frozenset(['propext']),
    "PureSFormal.PureS.RouteAction.execute": frozenset(['propext']),
    "PureSFormal.PureS.ActionParser.parse_eq_some_iff": frozenset(['propext']),
    "PureSFormal.PureS.ActionParser.parse_actionResult": frozenset(['propext']),
    "PureSFormal.PureS.ActionParser.ActionShape.accumulator_subterm": frozenset(['propext']),
    "PureSFormal.PureS.DispatchParser.parse_eq_some_iff": frozenset(['propext']),
    "PureSFormal.PureS.DispatchParser.dispatchesTo_rightUnique": frozenset(['propext']),
    "PureSFormal.PureS.framePrefix": frozenset(['propext']),
    "PureSFormal.PureS.freshLocal_mark": frozenset(['propext']),
    "PureSFormal.PureS.markH_ne_zeroAction": frozenset([]),
    "PureSFormal.PureS.Carrier.QueueStep.deterministic": frozenset(['propext']),
    "PureSFormal.PureS.Carrier.QueueSegment.word": frozenset([]),
    "PureSFormal.PureS.Carrier.baseCarrier_ne_shell": frozenset(['propext']),
    "PureSFormal.PureS.Carrier.LocalShell.dispatcher_deterministic": frozenset(['propext']),
    "PureSFormal.PureS.Carrier.Grammar.root_headArity": frozenset([]),
    "PureSFormal.PureS.Carrier.CompletedChain.liftStepsN": frozenset(['propext']),
    "PureSFormal.PureS.CellSpine.decode?_eq_some_iff": frozenset(['propext']),
    "PureSFormal.PureS.CellSpine.decode?_word": frozenset(['propext']),
    "PureSFormal.PureS.CellDeletion.canonicalFront": frozenset(['propext']),
    "PureSFormal.PureS.CellDeletion.IsCanonicalFront.endpoint_decodes": frozenset(['propext']),
    "PureSFormal.PureS.CellDeletion.IsCanonicalFront.hasLaterLive_iff": frozenset(['propext']),
    "PureSFormal.PureS.BasePath.word_subterm": frozenset(['propext']),
    "PureSFormal.PureS.BasePath.validate?_eq_some_iff": frozenset(['propext']),
    "PureSFormal.PureS.BasePath.validated_not_local": frozenset(['propext']),
    "PureSFormal.PureS.BasePath.decodeInitial?_base": frozenset(['propext']),
    "PureSFormal.PureS.MutableBase.queue_subterm": frozenset(['propext']),
    "PureSFormal.PureS.MutableBase.parse?_eq_some_iff": frozenset(['propext']),
    "PureSFormal.PureS.MutableBase.parseMutable?_eq_some_iff": frozenset(['propext']),
    "PureSFormal.PureS.MutableBase.mutableBase_word": frozenset([]),
    "PureSFormal.PureS.MutableBase.stepsN_mutableBase_queue": frozenset(['propext']),
    "PureSFormal.PureS.MutableBase.base_ne_shell": frozenset(['propext']),
    "PureSFormal.PureS.MutableBase.parsed_not_local": frozenset(['propext']),
    "PureSFormal.PureS.MutableBase.mutableBase_root_headArity": frozenset([]),
    "PureSFormal.PureS.ActionDecode.decode_actionAccumulator": frozenset(['propext']),
    "PureSFormal.PureS.ActionDecode.decode_actionAccumulator_eq_CTS": frozenset(['propext']),
    "PureSFormal.PureS.LocalResponse.execute": frozenset(['propext']),
    "PureSFormal.PureS.LocalResponse.executeZeroMarked": frozenset(['propext']),
    "PureSFormal.PureS.LocalResponse.completed_continuation": frozenset(['propext']),
    "PureSFormal.PureS.RootPath.initial_exactBase": frozenset(['propext']),
    "PureSFormal.PureS.RootPath.Root.headArity": frozenset([]),
    "PureSFormal.PureS.RootPath.Path.root_ne_live": frozenset(['propext']),
    "PureSFormal.PureS.RootPath.Path.root_ne_tombstone": frozenset(['propext']),
    "PureSFormal.PureS.RootPath.Path.live_ne_tombstone": frozenset(['propext']),
    "PureSFormal.PureS.RootPath.Path.actionAccumulator": frozenset([]),
    "PureSFormal.PureS.RootPath.execute_fromRoot": frozenset(['propext']),
    "PureSFormal.PureS.RootPath.executeZeroMarked_fromRoot": frozenset(['propext']),
    "PureSFormal.PureS.RootPath.topLive_delete_path": frozenset([]),
    "PureSFormal.PureS.RootPath.Root.deleteBaseFront": frozenset(['propext']),
    "PureSFormal.PureS.CanonicalStep.localAccumulator?_sound": frozenset(['propext']),
    "PureSFormal.PureS.CanonicalStep.localAccumulator?_complete": frozenset(['propext']),
    "PureSFormal.PureS.CanonicalStep.parseCell?_sound": frozenset(['propext']),
    "PureSFormal.PureS.CanonicalStep.classify_sound": frozenset(['propext']),
    "PureSFormal.PureS.CanonicalStep.classify_complete": frozenset(['propext']),
    "PureSFormal.PureS.CanonicalStep.classify_eq_iff": frozenset(['propext']),
    "PureSFormal.PureS.CanonicalStep.classify_eq_base_iff": frozenset(['propext']),
    "PureSFormal.PureS.CanonicalStep.classify_eq_local_iff": frozenset(['propext']),
    "PureSFormal.PureS.CanonicalStep.classify_eq_live_iff": frozenset(['propext']),
    "PureSFormal.PureS.CanonicalStep.classify_eq_tombstone_iff": frozenset(['propext']),
    "PureSFormal.PureS.CanonicalStep.classify_eq_malformed_iff": frozenset(['propext']),
    "PureSFormal.PureS.CanonicalStep.parsedBase_ne_local": frozenset(['propext']),
    "PureSFormal.PureS.CanonicalStep.parsedBase_ne_live": frozenset(['propext']),
    "PureSFormal.PureS.CanonicalStep.parsedBase_ne_tombstone": frozenset(['propext']),
    "PureSFormal.PureS.CanonicalStep.local_ne_live": frozenset(['propext']),
    "PureSFormal.PureS.CanonicalStep.local_ne_tombstone": frozenset(['propext']),
    "PureSFormal.PureS.CanonicalStep.live_ne_tombstone": frozenset(['propext']),
    "PureSFormal.PureS.CanonicalStep.classify_permissiveBase": frozenset(['propext']),
    "PureSFormal.PureS.CanonicalStep.classify_mutableBase": frozenset(['propext']),
    "PureSFormal.PureS.CanonicalStep.classify_base": frozenset(['propext']),
    "PureSFormal.PureS.CanonicalStep.classify_local": frozenset(['propext']),
    "PureSFormal.PureS.CanonicalStep.classify_live": frozenset(['propext']),
    "PureSFormal.PureS.CanonicalStep.classify_tombstone": frozenset(['propext']),
    "PureSFormal.PureS.CanonicalStep.classify_local_fields_independent": frozenset(['propext']),
    "PureSFormal.PureS.CanonicalStep.classify_tombstone_audit_independent": frozenset(['propext']),
    "PureSFormal.PureS.CanonicalStep.classify_local_of_route_action": frozenset(['propext']),
    "PureSFormal.PureS.CarrierDecoder.subterm_size_lt": frozenset(['propext']),
    "PureSFormal.PureS.CarrierDecoder.ProperDescendant.trans": frozenset(['propext']),
    "PureSFormal.PureS.CarrierDecoder.ProperDescendant.size_lt": frozenset(['propext']),
    "PureSFormal.PureS.CarrierDecoder.actionShape_accumulator_descendant": frozenset(['propext']),
    "PureSFormal.PureS.CarrierDecoder.activatedRoute_response_descendant": frozenset(['propext']),
    "PureSFormal.PureS.CarrierDecoder.dispatchShape_accumulator_descendant": frozenset(['propext']),
    "PureSFormal.PureS.CarrierDecoder.localChild_descendant": frozenset(['propext']),
    "PureSFormal.PureS.CarrierDecoder.classifiedLocal_descendant": frozenset(['propext']),
    "PureSFormal.PureS.CarrierDecoder.classifiedLive_descendant": frozenset(['propext']),
    "PureSFormal.PureS.CarrierDecoder.classifiedTombstone_descendant": frozenset(['propext']),
    "PureSFormal.PureS.CarrierDecoder.decode?_permissiveBase": frozenset(['Quot.sound', 'propext']),
    "PureSFormal.PureS.CarrierDecoder.decode?_mutableBase": frozenset(['Quot.sound', 'propext']),
    "PureSFormal.PureS.CarrierDecoder.decode?_local": frozenset(['Quot.sound', 'propext']),
    "PureSFormal.PureS.CarrierDecoder.decode?_live": frozenset(['Quot.sound', 'propext']),
    "PureSFormal.PureS.CarrierDecoder.decode?_tombstone": frozenset(['Quot.sound', 'propext']),
    "PureSFormal.PureS.CarrierDecoder.decode?_sound": frozenset(['Quot.sound', 'propext']),
    "PureSFormal.PureS.CarrierDecoder.decode?_complete": frozenset(['Quot.sound', 'propext']),
    "PureSFormal.PureS.CarrierDecoder.decode?_eq_some_iff": frozenset(['Quot.sound', 'propext']),
    "PureSFormal.PureS.CarrierDecoder.PathDecodes.deterministic": frozenset(['Quot.sound', 'propext']),
    "PureSFormal.PureS.CarrierDecoder.RootDecodes.deterministic": frozenset(['Quot.sound', 'propext']),
    "PureSFormal.PureS.CarrierDecoder.decode?_initial": frozenset(['Quot.sound', 'propext']),
    "PureSFormal.PureS.CarrierDecoder.decode?_local_of_route_action": frozenset(['Quot.sound', 'propext']),
    "PureSFormal.PureS.CarrierActionDecode.decode_appenderAccumulator": frozenset(['Quot.sound', 'propext']),
    "PureSFormal.PureS.CarrierActionDecode.decode_actionAccumulator": frozenset(['Quot.sound', 'propext']),
    "PureSFormal.PureS.CarrierActionDecode.decode_actionAccumulator_eq_CTS": frozenset(['Quot.sound', 'propext']),
    "PureSFormal.PureS.CarrierActionDecode.decode_completed": frozenset(['Quot.sound', 'propext']),
    "PureSFormal.PureS.CarrierActionDecode.executeSelectedDecoded": frozenset(['Quot.sound', 'propext']),
    "PureSFormal.PureS.PendingFrame.environmentCode_eq_envelope": frozenset([]),
    "PureSFormal.PureS.PendingFrame.guard?_eq_some_iff": frozenset(['propext']),
    "PureSFormal.PureS.PendingFrame.guard?_pending": frozenset(['propext']),
    "PureSFormal.PureS.PendingFrame.guard?_liveCell": frozenset(['propext']),
    "PureSFormal.PureS.PendingFrame.tombstone_predecessor_noncollision": frozenset(['propext']),
    "PureSFormal.PureS.PendingFrame.ActionAscent.parent_subterm": frozenset([]),
    "PureSFormal.PureS.PendingFrame.ActionAscent.child_subterm": frozenset(['propext']),
    "PureSFormal.PureS.PendingFrame.ActionAscent.innermost_or_history": frozenset([]),
    "PureSFormal.PureS.PendingFrame.ActionAscent.rejects_guard": frozenset(['propext']),
    "PureSFormal.PureS.PendingFrame.actionShape_ascent_noncollision": frozenset(['propext']),
    "PureSFormal.PureS.PendingFrame.guard?_chosenResponse": frozenset(['propext']),
    "PureSFormal.PureS.PendingFrame.guard?_selectedLeftFork": frozenset(['propext']),
    "PureSFormal.PureS.PendingFrame.guard?_selectedRightFork": frozenset(['propext']),
    "PureSFormal.PureS.PendingFrame.guard?_freshLocalDispatcher": frozenset(['propext']),
    "PureSFormal.PureS.PendingFrame.guard?_markedLocalDispatcher": frozenset(['propext']),
    "PureSFormal.PureS.PendingFrame.fixedBasePath_noncollision": frozenset(['propext']),
    "PureSFormal.PureS.ReachableAudit.SnapshotRoute.toActivatedRoute": frozenset([]),
    "PureSFormal.PureS.ReachableAudit.SnapshotRoute.fresh": frozenset(['propext']),
    "PureSFormal.PureS.ReachableAudit.SnapshotRoute.reduceResponse": frozenset(['propext']),
    "PureSFormal.PureS.ReachableAudit.actionResponse_initial": frozenset([]),
    "PureSFormal.PureS.ReachableAudit.actionResponse_shape": frozenset(['propext']),
    "PureSFormal.PureS.ReachableAudit.actionResponse_steps": frozenset(['propext']),
    "PureSFormal.PureS.ReachableAudit.SnapshotDispatchAt.toDispatchesTo": frozenset(['propext']),
    "PureSFormal.PureS.ReachableAudit.SnapshotDispatchAt.execute": frozenset(['propext']),
    "PureSFormal.PureS.ReachableAudit.SnapshotDispatchAt.reduceAccumulator": frozenset(['propext']),
    "PureSFormal.PureS.ReachableAudit.Layer.toLocalShell": frozenset([]),
    "PureSFormal.PureS.ReachableAudit.Layer.root_headArity": frozenset([]),
    "PureSFormal.PureS.ReachableAudit.Layer.reduceAccumulator": frozenset(['propext']),
    "PureSFormal.PureS.ReachableAudit.Layer.mark": frozenset(['propext']),
    "PureSFormal.PureS.ReachableAudit.Layer.dispatcher_noncollision": frozenset(['propext']),
    "PureSFormal.PureS.ReachableAudit.queueSegment_path": frozenset([]),
    "PureSFormal.PureS.ReachableAudit.actionAccumulator_segment": frozenset([]),
    "PureSFormal.PureS.ReachableAudit.Holds.toRoot": frozenset(['propext']),
    "PureSFormal.PureS.ReachableAudit.Holds.wholeCarrierAudit": frozenset(['propext']),
    "PureSFormal.PureS.ReachableAudit.Holds.initial": frozenset(['propext']),
    "PureSFormal.PureS.ReachableAudit.Holds.executeLayer": frozenset(['propext']),
    "PureSFormal.PureS.ReachableAudit.Holds.markLayer": frozenset(['propext']),
    "PureSFormal.PureS.ReachableAudit.Holds.markedLocal_dispatcher_noncollision": frozenset(['propext']),
    "PureSFormal.PureS.CompleteLayer.executeSelected": frozenset(['propext']),
    "PureSFormal.PureS.CompleteLayer.executeZeroMarked": frozenset(['propext']),
    "PureSFormal.PureS.clock_diagonal": frozenset(['propext']),
    "PureSFormal.PureS.clockWrapper_launch": frozenset([]),
    "PureSFormal.PureS.generator_staging": frozenset(['propext']),
    "PureSFormal.PureS.Dovetail.stage_expand": frozenset(['propext']),
    "PureSFormal.PureS.Dovetail.launch_expandJob": frozenset(['propext']),
    "PureSFormal.PureS.Dovetail.clockExit_admissible": frozenset(['propext']),
    "PureSFormal.PureS.Dovetail.headArity_clockExit_eq_four_iff": frozenset(['propext']),
    "PureSFormal.PureS.Dovetail.headArity_clockExit_eq_three_iff": frozenset(['propext']),
    "PureSFormal.PureS.Dovetail.clockExit_not_localShell": frozenset(['propext']),
    "PureSFormal.PureS.Dovetail.length_stageJobs": frozenset(['propext']),
    "PureSFormal.PureS.Dovetail.generator_to_staging": frozenset(['propext']),
    "PureSFormal.PureS.Dovetail.clockExit_zero_eq_nextStageSource": frozenset([]),
    "PureSFormal.PureS.Dovetail.stageExpanded_zero": frozenset([]),
    "PureSFormal.WeakPath.Realizes.decode_eq_some_iff": frozenset([]),
    "PureSFormal.Rogozhin46.states_length": frozenset([]),
    "PureSFormal.Rogozhin46.symbols_length": frozenset([]),
    "PureSFormal.Rogozhin46.directions_length": frozenset([]),
    "PureSFormal.Rogozhin46.keys_length": frozenset([]),
    "PureSFormal.Rogozhin46.table_length": frozenset([]),
    "PureSFormal.Rogozhin46.state_mem_states": frozenset(['propext']),
    "PureSFormal.Rogozhin46.symbol_mem_symbols": frozenset(['propext']),
    "PureSFormal.Rogozhin46.direction_mem_directions": frozenset(['propext']),
    "PureSFormal.Rogozhin46.key_mem_keys": frozenset(['propext']),
    "PureSFormal.Rogozhin46.keys_nodup": frozenset([]),
    "PureSFormal.Rogozhin46.table_nodup": frozenset([]),
    "PureSFormal.Rogozhin46.mem_map_image": frozenset([]),
    "PureSFormal.Rogozhin46.exists_of_mem_map": frozenset([]),
    "PureSFormal.Rogozhin46.cell_mem_table_iff": frozenset(['propext']),
    "PureSFormal.Rogozhin46.lookup_complete": frozenset(['propext']),
    "PureSFormal.Rogozhin46.lookup_eq_iff_mem": frozenset(['propext']),
    "PureSFormal.Rogozhin46.lookup_unique": frozenset(['propext']),
    "PureSFormal.Rogozhin46.result_unique_of_mem": frozenset(['propext']),
    "PureSFormal.Rogozhin46.transition_eq_halt_iff": frozenset([]),
    "PureSFormal.Rogozhin46.blank_is_four": frozenset([]),
    "PureSFormal.Rogozhin46.halting_cell_count": frozenset([]),
    "PureSFormal.Rogozhin46.running_cell_count": frozenset([]),
    "PureSFormal.Rogozhin46.step?_eq_none_iff": frozenset(['propext']),
    "PureSFormal.Rogozhin46.step?_eq_some_applyTransition": frozenset(['propext']),
    "PureSFormal.Rogozhin46.absorbingStep_of_step?": frozenset(['propext']),
    "PureSFormal.Rogozhin46.absorbingStep_of_halted": frozenset(['propext']),
    "PureSFormal.Rogozhin46.halted_iff": frozenset([]),
    "PureSFormal.Rogozhin46.iterate_of_halted": frozenset(['propext']),
    "PureSFormal.Rogozhin46.iterate_add": frozenset(['propext']),
    "PureSFormal.Rogozhin46.eventuallyHalts_of_halted": frozenset([]),
    "PureSFormal.Rogozhin46.eventuallyHalts_of_step": frozenset(['propext']),
    "PureSFormal.Cook.Index.toNat_bounds": frozenset([]),
    "PureSFormal.Cook.indices_length": frozenset([]),
    "PureSFormal.Cook.indexedBlock_length": frozenset([]),
    "PureSFormal.Cook.structuredAlphabet_length": frozenset([]),
    "PureSFormal.Cook.alphabet_length": frozenset([]),
    "PureSFormal.Cook.index_mem_indices": frozenset(['propext']),
    "PureSFormal.Cook.symbol_mem_alphabet": frozenset(['propext']),
    "PureSFormal.Cook.alphabet_nodup": frozenset([]),
    "PureSFormal.Cook.machineSymbolValue_le_five": frozenset([]),
    "PureSFormal.Cook.machineSymbolBar_bounds": frozenset([]),
    "PureSFormal.Cook.shiftExponent_le_fifty_six": frozenset([]),
    "PureSFormal.Cook.production_head": frozenset([]),
    "PureSFormal.Cook.production_rightStar": frozenset([]),
    "PureSFormal.Cook.indexedProduction_j1": frozenset([]),
    "PureSFormal.Cook.indexedProduction_j7": frozenset([]),
    "PureSFormal.Cook.indexedProduction_j8": frozenset([]),
    "PureSFormal.Cook.indexedProduction_halt_C3": frozenset([]),
    "PureSFormal.Cook.indexedProduction_halt_D3": frozenset([]),
    "PureSFormal.Cook.indexedProduction_eq_nil_iff": frozenset([]),
    "PureSFormal.Cook.productionTable_length": frozenset([]),
    "PureSFormal.Cook.production_complete": frozenset(['propext']),
    "PureSFormal.Cook.productionEntry_mem_iff": frozenset(['propext']),
    "PureSFormal.Cook.production_eq_iff_mem": frozenset(['propext']),
    "PureSFormal.Cook.production_unique": frozenset(['propext']),
    "PureSFormal.Cook.productionTable_nodup": frozenset([]),
    "PureSFormal.Cook.production_rhs_closed": frozenset(['propext']),
    "PureSFormal.Cook.production_length_le_sixty_four": frozenset([]),
    "PureSFormal.Cook.total_rhs_symbol_count": frozenset([]),
    "PureSFormal.Cook.empty_production_count": frozenset([]),
}

NONE_RE = re.compile(r"^'([^']+)' does not depend on any axioms$")
SOME_RE = re.compile(r"^'([^']+)' depends on axioms: \[([^]]*)\]$")
FORBIDDEN_AXIOMS = frozenset({"Classical.choice", "sorryAx"})
PROJECT_PREFIX = "PureSFormal."


def parse_axiom_list(raw: str) -> frozenset[str]:
    """Parse Lean's comma-separated bracket contents as an exact set."""
    if not raw.strip():
        return frozenset()
    names = [name.strip() for name in raw.split(",")]
    if any(not name for name in names):
        raise ValueError(f"malformed axiom list: [{raw}]")
    if len(names) != len(set(names)):
        raise ValueError(f"duplicate axiom in report: [{raw}]")
    return frozenset(names)


def parse_report(output: str) -> dict[str, frozenset[str]]:
    """Parse every nonblank Lean output line, rejecting unrecognized output."""
    report: dict[str, frozenset[str]] = {}
    for line_number, raw_line in enumerate(axiom_report_lines(output), start=1):
        line = raw_line.strip()
        if not line:
            continue

        match = NONE_RE.fullmatch(line)
        if match is not None:
            declaration = match.group(1)
            axioms = frozenset()
        else:
            match = SOME_RE.fullmatch(line)
            if match is None:
                raise ValueError(
                    f"unrecognized Lean output line {line_number}: {raw_line!r}"
                )
            declaration = match.group(1)
            axioms = parse_axiom_list(match.group(2))

        if declaration in report:
            raise ValueError(f"duplicate declaration report: {declaration}")
        report[declaration] = axioms
    return report


def validate_report(report: dict[str, frozenset[str]]) -> None:
    """Require the exact declaration inventory and per-theorem allowlist."""
    failures: list[str] = []
    expected_names = set(EXPECTED_AXIOMS)
    actual_names = set(report)

    for declaration in sorted(expected_names - actual_names):
        failures.append(f"missing declaration: {declaration}")
    for declaration in sorted(actual_names - expected_names):
        failures.append(f"unexpected declaration: {declaration}")

    for declaration in sorted(actual_names):
        actual = report[declaration]
        forbidden = actual & FORBIDDEN_AXIOMS
        if declaration.startswith("PureSFormal.AppendixF.") and "Classical.choice" in EXPECTED_AXIOMS.get(declaration, frozenset()):
            forbidden -= {"Classical.choice"}
        project_axioms = sorted(
            name for name in actual if name.startswith(PROJECT_PREFIX)
        )
        if forbidden:
            failures.append(
                f"{declaration}: forbidden axioms {sorted(forbidden)!r}"
            )
        if project_axioms:
            failures.append(
                f"{declaration}: project-qualified axioms {project_axioms!r}"
            )

    for declaration in sorted(expected_names & actual_names):
        actual = report[declaration]
        expected = EXPECTED_AXIOMS[declaration]
        if actual != expected:
            failures.append(
                f"{declaration}: expected {sorted(expected)!r}, "
                f"found {sorted(actual)!r}"
            )

    if failures:
        raise ValueError("axiom audit failed:\n" + "\n".join(failures))


def arguments() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--lake",
        default=os.environ.get("LAKE", "lake"),
        help="Lake executable path (default: $LAKE or lake)",
    )
    return parser.parse_args()


def main() -> None:
    args = arguments()
    audit_path = ROOT / AUDIT_MODULE
    if not audit_path.is_file():
        raise SystemExit(f"missing Lean audit module: {audit_path}")

    command = [args.lake, "env", "lean", "-Dformat.width=1000000", AUDIT_MODULE.as_posix()]
    try:
        completed = subprocess.run(
            command,
            cwd=ROOT,
            check=False,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            text=True,
            encoding="utf-8",
        )
    except OSError as error:
        raise SystemExit(f"could not execute {args.lake!r}: {error}") from None

    if completed.stdout:
        print(completed.stdout, end="" if completed.stdout.endswith("\n") else "\n")
    if completed.returncode != 0:
        raise SystemExit(
            f"Lean axiom audit command exited with status {completed.returncode}"
        )

    try:
        report = parse_report(completed.stdout)
        validate_report(report)
    except ValueError as error:
        raise SystemExit(str(error)) from None

    print(
        "PASS exact Lean axiom gate "
        f"declarations={len(report)} default_axioms=propext,Quot.sound; "
        "Appendix F classical dependencies match their exact recorded sets"
    )


if __name__ == "__main__":
    main()
