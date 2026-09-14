import PureSFormal.Research.RootResetPendingResponseFrontHandoff

/-!
# Canonical C4 preserves the completed Local header and composes with FRAME

Deleting the selected carrier front preserves a completed Local's public
header and independent audit fields. The accumulator decodes exactly the
remaining suffix, retains its Local count, and gains one tombstone. These
facts discharge the following FRAME selector's premises, yielding a checked
two-contraction chain for every appendant and positive pending depth.
-/

namespace PureSFormal.Research.RootResetCompletedFrontPreservation
open PureSFormal.PureS
open RootResetResponseBoundaryStages
open RootResetPersistentResponseSelector

theorem localShape_accumulator_subterm
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : CheckpointDecoder.LocalView program}
    (shape : CheckpointDecoder.LocalShape program tree view term) :
    term.subterm? (localAccumulatorAddress view) = some view.accumulator := by
  rcases shape with ⟨haltField, dispatcher, seedAudit, continuationAudit, halt, dispatch, source⟩
  rcases dispatch with ⟨response, histories, routeShape, actionShape⟩
  rw [source]
  unfold localAccumulatorAddress
  change dispatcher.subterm?
    (RootResetReachableStageGrammar.routeResponseAddress view.route ++
      ActionParser.accumulatorAddress (ActionParser.historyCount program view.label)) = some view.accumulator
  rw [CarrierDecoder.subterm?_append, RootResetReachableStageGrammar.routeResponseAddress_subterm routeShape]
  exact actionShape.accumulator_subterm

theorem contractAt?_subterm_exists
    {whole child target : Term} (outer inner : Address)
    (found : whole.subterm? outer = some child)
    (contracts : whole.contractAt? (outer ++ inner) = some target) :
    ∃ childTarget, child.contractAt? inner = some childTarget := by
  induction outer generalizing whole target with
  | nil =>
      have same : whole = child := by
        cases whole <;> exact Option.some.inj found
      subst whole
      exact ⟨target, contracts⟩
  | cons direction rest ih =>
      cases whole with
      | s => cases direction <;> cases found
      | app fn arg =>
          cases direction with
          | left =>
              rw [List.cons_append, RootResetEulerWalker.contractAt?_app_left] at contracts
              obtain ⟨next, contracted, _⟩ := RootResetStageRegistry.optionMap_eq_some contracts
              exact ih found contracted

          | right =>
              rw [List.cons_append, RootResetEulerWalker.contractAt?_app_right] at contracts
              obtain ⟨next, contracted, _⟩ := RootResetStageRegistry.optionMap_eq_some contracts
              exact ih found contracted

theorem localParsed_accumulator_subterm
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program tree term = some view) :
    term.subterm? (localAccumulatorAddress view) = some view.accumulator :=
  localShape_accumulator_subterm (CheckpointDecoder.parseLocal?_sound parsed)

theorem localShape_after_selectedFront
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source target : Term}
    {view : CheckpointDecoder.LocalView program}
    {bit : Bool} {suffix : List Bool} {outerContext : Context}
    (admissible : Carrier.Admissible continuation)
    (parsed : CheckpointDecoder.parseLocal? program tree source = some view)
    (selected : CanonicalTraversal.SelectedFront program tree bits continuation source bit suffix outerContext)
    (contracts : source.contractAt? (CanonicalTraversal.contextAddress outerContext) = some target) :
    ∃ accumulator,
      CheckpointDecoder.LocalShape program tree (replaceAccumulator view accumulator) target := by
  have shape := CheckpointDecoder.parseLocal?_sound parsed
  have cellNone := RootResetSelectedFrontParserAgreement.parseCell?_none_of_headArity_five_or_six
    (CheckpointDecoder.parseLocal?_headArity parsed)
  have front := RootResetSelectedFrontParserAgreement.firstLiveAddress?_ofSelectedFront admissible selected
  rw [RootResetSelectedFrontParserAgreement.firstLiveAddress?, dif_pos cellNone,
    CheckpointRun.parseBase?_none_of_localShape shape, parsed] at front
  dsimp only at front
  obtain ⟨address, _frontParsed, prefixEq⟩ := RootResetStageRegistry.optionMap_eq_some front
  rw [← prefixEq] at contracts
  obtain ⟨accumulator, innerContracts⟩ := contractAt?_subterm_exists _ _
    (localShape_accumulator_subterm shape) contracts
  obtain ⟨found, foundContracts, foundShape⟩ := localShape_contractAccumulator shape innerContracts
  have same : found = target := Option.some.inj (foundContracts.symm.trans contracts)
  exact ⟨accumulator, same ▸ foundShape⟩

theorem map_succ_injective {first second : Option Nat}
    (equal : first.map Nat.succ = second.map Nat.succ) : first = second := by
  cases first with
  | none => cases second <;> first | rfl | cases equal
  | some first =>
      cases second with
      | none => cases equal
      | some second => exact congrArg some (Nat.succ.inj (Option.some.inj equal))

theorem localCountStep_accumulators
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source target : Term} {sourceView targetView : CheckpointDecoder.LocalView program}
    (sourceParsed : CheckpointDecoder.parseLocal? program tree source = some sourceView)
    (targetParsed : CheckpointDecoder.parseLocal? program tree target = some targetView)
    (counts : RootResetCarrierChronologyPreservation.CountStep program tree source target) :
    RootResetCarrierChronologyPreservation.CountStep program tree sourceView.accumulator targetView.accumulator := by
  have sourceBase := CheckpointRun.parseBase?_none_of_localShape (CheckpointDecoder.parseLocal?_sound sourceParsed)
  have targetBase := CheckpointRun.parseBase?_none_of_localShape (CheckpointDecoder.parseLocal?_sound targetParsed)
  have locals := counts.locals
  have tombstones := counts.tombstones
  have sourceLocals : carrierLocalCount? program tree source =
      (carrierLocalCount? program tree sourceView.accumulator).map Nat.succ := by
    rw [carrierLocalCount?, sourceBase, sourceParsed]
  have targetLocals : carrierLocalCount? program tree target =
      (carrierLocalCount? program tree targetView.accumulator).map Nat.succ := by
    rw [carrierLocalCount?, targetBase, targetParsed]
  have sourceTombs : carrierTombstoneCount? program tree source =
      carrierTombstoneCount? program tree sourceView.accumulator := by
    rw [carrierTombstoneCount?, sourceBase, sourceParsed]
  have targetTombs : carrierTombstoneCount? program tree target =
      carrierTombstoneCount? program tree targetView.accumulator := by
    rw [carrierTombstoneCount?, targetBase, targetParsed]
  rw [sourceLocals, targetLocals] at locals
  rw [sourceTombs, targetTombs] at tombstones
  exact ⟨map_succ_injective locals, tombstones⟩

theorem completed_selectedFront_preserved
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation source : Term}
    {view : CheckpointDecoder.LocalView program}
    {bit : Bool} {suffix : List Bool} {outerContext : Context}
    (admissible : Carrier.Admissible continuation)
    (parsed : CheckpointDecoder.parseLocal? program tree source = some view)
    (selected : CanonicalTraversal.SelectedFront program tree bits continuation source bit suffix outerContext)
    (locals : Nat)
    (localCount : carrierLocalCount? program tree view.accumulator = some locals)
    (tombCount : carrierTombstoneCount? program tree view.accumulator = some (locals + 1)) :
    ∃ target targetContext predecessor accumulator,
      CanonicalTraversal.Descent program tree bits continuation target suffix targetContext ∧
      CanonicalTraversal.FrontCertificate source target bit suffix predecessor outerContext ∧
      CheckpointDecoder.LocalShape program tree (replaceAccumulator view accumulator) target ∧
      CheckpointDecoder.decodeCarrier? program tree accumulator = some suffix ∧
      carrierLocalCount? program tree accumulator = some locals ∧
      carrierTombstoneCount? program tree accumulator = some (locals + 2) := by
  obtain ⟨target, targetContext, predecessor, descent, certificate, counts⟩ :=
    RootResetCarrierChronologyPreservation.SelectedFront.delete_countStep admissible selected
  have contracts : source.contractAt? (CanonicalTraversal.contextAddress outerContext) = some target := by
    rw [Term.contractAt?, certificate.selected_subterm]
    exact certificate.endpoint_replace
  obtain ⟨accumulator, targetShape⟩ := localShape_after_selectedFront admissible parsed selected contracts
  have targetParsed := CheckpointDecoder.parseLocal?_complete targetShape
  have accCounts := localCountStep_accumulators parsed targetParsed counts
  change RootResetCarrierChronologyPreservation.CountStep program tree view.accumulator accumulator at accCounts
  have decoded := CheckpointRun.decodeCarrier?_of_decode program tree bits continuation admissible
    (LocalTransition.Descent.decode_eq program tree bits continuation admissible descent)
  rw [CheckpointDecoder.decodeCarrier?,
    CheckpointRun.parseBase?_none_of_localShape targetShape, targetParsed] at decoded
  have targetLocals : carrierLocalCount? program tree accumulator = some locals := accCounts.locals.trans localCount
  have targetTombs : carrierTombstoneCount? program tree accumulator = some (locals + 2) := by
    rw [accCounts.tombstones, tombCount]
    rfl
  exact ⟨target, targetContext, predecessor, accumulator, descent, certificate,
    targetShape, decoded, targetLocals, targetTombs⟩

open RootResetPendingResponseFrontHandoff
open RootResetWrappedFrameSelectorProof
open RootResetEmptyHandoffContext

theorem completed_C4_FRAME_composition
    {program : CTS.Program} (dispatcher : ActionDispatcher program)
    {term : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program dispatcher.tree term = some view)
    (fresh : view.status = .fresh)
    (nonempty : ∃ first rest, CheckpointDecoder.decodeCarrier? program dispatcher.tree view.accumulator = some (first :: rest))
    (bits : List Bool) (seed : view.seedPayload = word bits)
    (horizon remaining : Nat) (bound : remaining ≤ horizon)
    (continuation : view.continuation = exitTerm program dispatcher horizon remaining bits)
    (locals : Nat)
    (localCount : carrierLocalCount? program dispatcher.tree view.accumulator = some locals)
    (tombCount : carrierTombstoneCount? program dispatcher.tree view.accumulator = some (locals + 1))
    (outerBits : List Bool) (outerContinuation : Term) (count : Nat)
    {nextBit : Bool} {suffix : List Bool} {outerContext : Context}
    (selected : CanonicalTraversal.SelectedFront program dispatcher.tree bits
      (exitTerm program dispatcher horizon remaining bits) term nextBit suffix outerContext) :
    ∃ target targetContext accumulator,
      CanonicalTraversal.Descent program dispatcher.tree bits
        (exitTerm program dispatcher horizon remaining bits) target suffix targetContext ∧
      CheckpointDecoder.LocalShape program dispatcher.tree (replaceAccumulator view accumulator) target ∧
      selectStep? program dispatcher
        (pending (compileActions program dispatcher.tree) outerBits outerContinuation (count + 1) term) =
        some (pending (compileActions program dispatcher.tree) outerBits outerContinuation (count + 1) target) ∧
      selectStep? program dispatcher
        (pending (compileActions program dispatcher.tree) outerBits outerContinuation (count + 1) target) =
        some (pending (compileActions program dispatcher.tree) outerBits outerContinuation count
          (SchedulerResponseInvariant.frameFirstRoot (compileActions program dispatcher.tree) outerBits outerContinuation target)) := by
  have admissible := Dovetail.clockExit_admissible horizon remaining
    (environmentCode (compileActions program dispatcher.tree) bits)
  obtain ⟨target, targetContext, predecessor, accumulator, descent, certificate,
      targetShape, targetDecode, targetLocals, targetTombs⟩ :=
    completed_selectedFront_preserved admissible parsed selected locals localCount tombCount
  obtain ⟨foundPredecessor, sourceEq, c4Selected⟩ := pending_completed_selects_C4 dispatcher parsed fresh
    nonempty bits seed horizon remaining bound continuation locals localCount tombCount outerBits outerContinuation count selected
  have samePred : foundPredecessor = predecessor :=
    (Term.app.inj (SchedulerAscent.context_plug_injective outerContext
      (sourceEq.symm.trans certificate.source_eq))).2
  rw [samePred, ← certificate.target_eq] at c4Selected
  have frameSelected := pending_deleted_selects_FRAME dispatcher
    (CheckpointDecoder.parseLocal?_complete targetShape) fresh targetDecode bits seed
    horizon remaining bound continuation locals targetLocals targetTombs outerBits outerContinuation count
  exact ⟨target, targetContext, accumulator, descent, targetShape, c4Selected, frameSelected⟩

end PureSFormal.Research.RootResetCompletedFrontPreservation
