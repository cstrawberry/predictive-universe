import PureSFormal.Research.RootResetCellSpineRows

/-!
# Finite phase recovery from the designated carrier

Transparent cell descent stops at the first carrier root. Fixed labelled
Base and completed-Local patterns recover zero or the successor phase.
The finite inverse returns to the fresh halt argument while retaining that
phase in finite control. All-input bounds and generated agreement concern
the actual finite machine, with no phase oracle or input path register.
-/
namespace PureSFormal.Research.RootResetCarrierPhaseProbe
open PureSFormal.PureS
open RootResetCompletedLocalPatterns
open RootResetCarrierEdgePatterns

def labelledLocal (status : CheckpointDecoder.HaltStatus) (program : CTS.Program)
    (row : DispatchRow program) : CTS.Phase program × Pattern :=
  ⟨CTS.nextPhase program row.label.1, localPattern status row.pattern⟩

def labels (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :
    List (CTS.Phase program × Pattern) :=
  (CTS.zeroPhase program, RootResetCarrierNonemptyRows.basePattern (compileActions program tree)) ::
    ((dispatchRows program tree).map (labelledLocal .fresh program) ++
      (dispatchRows program tree).map (labelledLocal .marked program))

abbrev machine (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :=
  RootResetLabelledEdgeProbe.machine RootResetCellSpineRows.rows (labels program tree)

abbrev initial (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :=
  RootResetLabelledEdgeProbe.initial RootResetCellSpineRows.rows (labels program tree)

abbrev budget (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :=
  RootResetLabelledEdgeProbe.budget RootResetCellSpineRows.rows (labels program tree)

theorem all_input (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (source : Term) (parents : List ParentFrame) :
    ∃ ticks descended, ticks ≤ budget program tree ⟨source, .right haltCode :: parents⟩ ∧
      FiniteController.run (machine program tree) ticks (initial program tree ⟨source, .right haltCode :: parents⟩) =
        ⟨some (.done (RootResetLabelledPatternFragment.finished (labels program tree) descended.focus)),
          ⟨source, .right haltCode :: parents⟩⟩ ∧
      RootResetEdgeSpine.Walks RootResetCellSpineRows.rows ⟨source, .right haltCode :: parents⟩ descended :=
  RootResetLabelledEdgeProbe.all_input_restores _ _ RootResetCellSpineRows.valid
    RootResetCellSpineRows.inverts _ (RootResetCellSpineRows.halt_boundary source parents)

theorem localRow_label (status : CheckpointDecoder.HaltStatus) (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (row : DispatchRow program)
    (member : row ∈ dispatchRows program tree) (source : Term)
    (matched : (localPattern status row.pattern).matchesBool source = true) :
    ∃ view : CheckpointDecoder.LocalView program,
      CheckpointDecoder.parseLocal? program tree source = some view ∧ view.label = row.label := by
  obtain ⟨left, right, sourceEq, leftMatches, rightMatches⟩ := app_matches matched
  obtain ⟨continuation, continuationAudit, rightEq, _, _⟩ := app_matches rightMatches
  obtain ⟨head, seed, leftEq, headMatches, seedMatches⟩ := app_matches leftMatches
  obtain ⟨haltField, dispatcher, headEq, haltMatched, dispatcherMatched⟩ := app_matches headMatches
  obtain ⟨seedHead, seedAudit, seedEq, seedHeadMatches, _⟩ := app_matches seedMatches
  obtain ⟨sHead, payload, seedHeadEq, sMatched, _⟩ := app_matches seedHeadMatches
  have sEq : sHead = .s := (Pattern.matches_s_iff sHead).mp (Pattern.matchesBool_sound sMatched)
  have haltShape := halt_sound status haltField haltMatched
  obtain ⟨accumulator, dispatchShape⟩ := dispatchRow_sound program tree row member dispatcher dispatcherMatched
  let view : CheckpointDecoder.LocalView program := ⟨status, row.route, row.label, accumulator, payload, continuation⟩
  have shape : CheckpointDecoder.LocalShape program tree view source := by
    refine ⟨haltField, dispatcher, seedAudit, continuationAudit, haltShape, dispatchShape, ?_⟩
    rw [sourceEq, leftEq, headEq, rightEq, seedEq, seedHeadEq, sEq]
    rfl
  exact ⟨view, CheckpointDecoder.parseLocal?_complete shape, rfl⟩

theorem selected_base (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (continuation queue seed beta : Term) :
    RootResetLabelledPatternFragment.selected (labels program tree)
      (CheckpointDecoder.openBase (compileActions program tree) continuation queue seed beta) =
        some (CTS.zeroPhase program) := by
  rw [labels, RootResetLabelledPatternFragment.selected, RootResetCarrierNonemptyRows.base_matches]
  rfl

theorem selected_local {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program tree source = some view) :
    RootResetLabelledPatternFragment.selected (labels program tree) source =
      some (CTS.nextPhase program view.label.1) := by
  obtain ⟨haltField, dispatcher, seedAudit, continuationAudit, haltShape, dispatchShape, sourceEq⟩ :=
    CheckpointDecoder.parseLocal?_sound parsed
  obtain ⟨row, member, routeEq, labelEq, matched⟩ := dispatchRow_complete dispatchShape
  have localMatches : (localPattern view.status row.pattern).matchesBool source = true := by
    rw [sourceEq]
    simp only [localPattern, CheckpointDecoder.openShell, Pattern.matchesBool,
      halt_matches haltShape, matched, Bool.true_and, Bool.and_true]
  have rowMember : labelledLocal view.status program row ∈ labels program tree := by
    apply List.Mem.tail
    apply List.mem_append.mpr
    cases statusEq : view.status with
    | fresh => exact Or.inl (map_member _ member)
    | marked => exact Or.inr (map_member _ member)
  apply RootResetLabelledPatternFragment.selected_of_unique _ _ _ ⟨_, rowMember, localMatches⟩
  intro entry entryMember entryMatched
  rcases List.mem_cons.mp entryMember with first | later
  · subst entry
    change (RootResetCarrierNonemptyRows.basePattern _).matchesBool source = true at entryMatched
    rw [sourceEq, RootResetCarrierNonemptyRows.base_misses_local] at entryMatched
    contradiction
  · rcases List.mem_append.mp later with fresh | marked
    · obtain ⟨found, foundMember, equal⟩ := map_member_inverse _ _ _ fresh
      subst entry
      obtain ⟨foundView, foundParsed, foundLabel⟩ := localRow_label .fresh program tree found foundMember source entryMatched
      have equal := Option.some.inj (foundParsed.symm.trans parsed)
      subst foundView
      exact congrArg (fun label : ActionLabel program => CTS.nextPhase program label.1) foundLabel.symm
    · obtain ⟨found, foundMember, equal⟩ := map_member_inverse _ _ _ marked
      subst entry
      obtain ⟨foundView, foundParsed, foundLabel⟩ := localRow_label .marked program tree found foundMember source entryMatched
      have equal := Option.some.inj (foundParsed.symm.trans parsed)
      subst foundView
      exact congrArg (fun label : ActionLabel program => CTS.nextPhase program label.1) foundLabel.symm

theorem cells_miss_of_arity (source : Term) (arity : source.headArity = 5 ∨ source.headArity = 6) :
    RootResetEdgeFragment.select RootResetCellSpineRows.rows source = none := by
  apply RootResetCarrierNonemptyAgreement.select_none_of_all
  intro row member
  cases matched : row.pattern.matchesBool source with
  | false => rfl
  | true =>
      rcases RootResetCellSpineRows.row_cases row member with equal | equal | equal | equal <;> subst row
      · obtain ⟨predecessor, shape⟩ := RootResetCellSpineRows.live_sound false source matched
        rw [shape, Carrier.headArity_liveCell] at arity
        rcases arity with impossible | impossible <;> cases impossible
      · obtain ⟨predecessor, shape⟩ := RootResetCellSpineRows.live_sound true source matched
        rw [shape, Carrier.headArity_liveCell] at arity
        rcases arity with impossible | impossible <;> cases impossible
      · obtain ⟨predecessor, audit, shape⟩ := RootResetCarrierNonemptyRows.tombstone_sound false source matched
        rw [shape, Carrier.headArity_tombstone] at arity
        rcases arity with impossible | impossible <;> cases impossible
      · obtain ⟨predecessor, audit, shape⟩ := RootResetCarrierNonemptyRows.tombstone_sound true source matched
        rw [shape, Carrier.headArity_tombstone] at arity
        rcases arity with impossible | impossible <;> cases impossible

inductive Reads (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :
    Term → CTS.Phase program → Prop where
  | done (source : Term) (phase : CTS.Phase program)
      (missed : RootResetEdgeFragment.select RootResetCellSpineRows.rows source = none)
      (answer : RootResetLabelledPatternFragment.selected (labels program tree) source = some phase) :
      Reads program tree source phase
  | live {source : Term} {phase : CTS.Phase program} (bit : Bool)
      (inner : Reads program tree source phase) : Reads program tree (.app (PureS.live bit) source) phase
  | tombstone {source : Term} {phase : CTS.Phase program} (bit : Bool) (audit : Term)
      (inner : Reads program tree source phase) : Reads program tree (Carrier.tombstone bit source audit) phase

theorem Reads.walks {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} {phase : CTS.Phase program} (reads : Reads program tree source phase)
    {origin endpoint : Cursor} (atSource : origin.focus = source)
    (walk : RootResetEdgeSpine.Walks RootResetCellSpineRows.rows origin endpoint) :
    RootResetLabelledPatternFragment.selected (labels program tree) endpoint.focus = some phase := by
  induction reads generalizing origin with
  | done source phase missed answer =>
      cases walk with
      | done origin absent => exact atSource ▸ answer
      | next origin after row selected followed rest =>
          rw [atSource, missed] at selected
          contradiction
  | @live source phase bit inner ih =>
      cases walk with
      | done origin missed =>
          rw [atSource, RootResetCellSpineRows.selected_live] at missed
          contradiction
      | next origin after row selected followed rest =>
          rw [atSource, RootResetCellSpineRows.selected_live] at selected
          have equal := Option.some.inj selected
          subst row
          rcases origin with ⟨focus, parents⟩
          change focus = _ at atSource
          subst focus
          have afterEq : ⟨source, .right (PureS.live bit) :: parents⟩ = after := Option.some.inj followed
          subst after
          exact ih rfl rest
  | @tombstone source phase bit audit inner ih =>
      cases walk with
      | done origin missed =>
          rw [atSource, RootResetCellSpineRows.selected_tombstone] at missed
          contradiction
      | next origin after row selected followed rest =>
          rw [atSource, RootResetCellSpineRows.selected_tombstone] at selected
          have equal := Option.some.inj selected
          subst row
          rcases origin with ⟨focus, parents⟩
          change focus = _ at atSource
          subst focus
          have afterEq : ⟨source, .right .s :: .left (.app (valueTag bit) audit) :: parents⟩ = after := Option.some.inj followed
          subst after
          exact ih rfl rest

theorem generated_runs {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} {phase : CTS.Phase program} (reads : Reads program tree source phase)
    (parents : List ParentFrame) :
    ∃ ticks state, ticks ≤ budget program tree ⟨source, .right haltCode :: parents⟩ ∧
      FiniteController.run (machine program tree) ticks (initial program tree ⟨source, .right haltCode :: parents⟩) =
        ⟨some (.done state), ⟨source, .right haltCode :: parents⟩⟩ ∧
      RootResetLabelledPatternFragment.answer? state = some (some phase) := by
  obtain ⟨ticks, descended, bounded, execution, walk⟩ := all_input program tree source parents
  refine ⟨ticks, _, bounded, execution, ?_⟩
  rw [RootResetLabelledPatternFragment.finished_answer, reads.walks rfl walk]

theorem reads_of_local {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} {view : CheckpointDecoder.LocalView program} {phase : CTS.Phase program}
    (parsed : CheckpointDecoder.parseLocal? program tree source = some view)
    (phaseEq : RootResetPersistentResponseSelector.carrierPhase? program tree source = some phase) :
    Reads program tree source phase := by
  have noBase := CheckpointRun.parseBase?_none_of_localShape (CheckpointDecoder.parseLocal?_sound parsed)
  rw [RootResetPersistentResponseSelector.carrierPhase?, noBase, parsed] at phaseEq
  have equal := Option.some.inj phaseEq
  rw [← equal]
  exact .done source _ (cells_miss_of_arity source (CheckpointDecoder.parseLocal?_headArity parsed))
    (selected_local parsed)

theorem path_reads {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits decoded : List Bool} {continuation source : Term}
    (admissible : Carrier.Admissible continuation)
    (path : CarrierDecoder.PathDecodes program tree bits continuation source decoded)
    (phase : CTS.Phase program)
    (phaseEq : RootResetPersistentResponseSelector.carrierPhase? program tree source = some phase) :
    Reads program tree source phase := by
  revert phase
  apply CarrierDecoder.PathDecodes.rec
    (program := program) (tree := tree) (bits := bits) (continuation := continuation) (t := path)
    (motive_1 := fun source _ _ => ∀ phase,
      RootResetPersistentResponseSelector.carrierPhase? program tree source = some phase → Reads program tree source phase)
    (motive_2 := fun source _ _ => ∀ phase,
      RootResetPersistentResponseSelector.carrierPhase? program tree source = some phase → Reads program tree source phase)
  · intro queue beta decoded queueComplete phase phaseEq
    have parsed := CheckpointDecoder.parseBase?_mutableBase (compileActions program tree) bits continuation queue beta
    rw [RootResetPersistentResponseSelector.carrierPhase?, parsed] at phaseEq
    have equal := Option.some.inj phaseEq
    rw [← equal]
    exact .done _ _ (cells_miss_of_arity _ (MutableBase.root_headArity _ bits admissible queue beta))
      (selected_base program tree continuation queue (word bits) beta)
  · intro accumulator dispatcher result decoded inner dispatch shell ih phase phaseEq
    obtain ⟨route, label, dispatchShape⟩ := dispatch
    cases shell with
    | fresh haltAudit seedAudit continuationAudit =>
        let view : CheckpointDecoder.LocalView program := ⟨.fresh, route, label, accumulator, word bits, continuation⟩
        have shape : CheckpointDecoder.LocalShape program tree view
            (Carrier.activeShell bits continuation (freshHField haltAudit) dispatcher seedAudit continuationAudit) :=
          ⟨freshHField haltAudit, dispatcher, seedAudit, continuationAudit, .fresh haltAudit, dispatchShape, rfl⟩
        exact reads_of_local (CheckpointDecoder.parseLocal?_complete shape) phaseEq
    | marked leftAudit rightAudit seedAudit continuationAudit =>
        let view : CheckpointDecoder.LocalView program := ⟨.marked, route, label, accumulator, word bits, continuation⟩
        have shape : CheckpointDecoder.LocalShape program tree view
            (Carrier.activeShell bits continuation (Carrier.markedHField leftAudit rightAudit) dispatcher seedAudit continuationAudit) :=
          ⟨Carrier.markedHField leftAudit rightAudit, dispatcher, seedAudit, continuationAudit,
            .marked leftAudit rightAudit, dispatchShape, rfl⟩
        exact reads_of_local (CheckpointDecoder.parseLocal?_complete shape) phaseEq
  · intro root decoded inner ih phase phaseEq
    exact ih phase phaseEq
  · intro tail decoded bit inner ih phase phaseEq
    rw [RootResetPersistentResponseSelector.carrierPhase?, CheckpointRun.parseBase?_live_none,
      CheckpointRun.parseLocal?_live_none, CanonicalStep.parseCell?_live] at phaseEq
    exact .live bit (ih phase phaseEq)
  · intro predecessor decoded bit audit inner ih phase phaseEq
    rw [RootResetPersistentResponseSelector.carrierPhase?,
      CheckpointRun.parseBase?_tombstone_path_none admissible inner bit audit,
      CheckpointRun.parseLocal?_tombstone_none, CanonicalStep.parseCell?_tombstone] at phaseEq
    exact .tombstone bit audit (ih phase phaseEq)

theorem generated_path_runs {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits decoded : List Bool} {continuation source : Term}
    (admissible : Carrier.Admissible continuation)
    (path : CarrierDecoder.PathDecodes program tree bits continuation source decoded)
    (phase : CTS.Phase program)
    (phaseEq : RootResetPersistentResponseSelector.carrierPhase? program tree source = some phase)
    (parents : List ParentFrame) :
    ∃ ticks state, ticks ≤ budget program tree ⟨source, .right haltCode :: parents⟩ ∧
      FiniteController.run (machine program tree) ticks (initial program tree ⟨source, .right haltCode :: parents⟩) =
        ⟨some (.done state), ⟨source, .right haltCode :: parents⟩⟩ ∧
      RootResetLabelledPatternFragment.answer? state = some (some phase) :=
  generated_runs (path_reads admissible path phase phaseEq) parents

theorem runMutationCount_zero (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (ticks : Nat) (configuration : FiniteController.Configuration (RootResetLabelledEdgeProbe.Control
      RootResetCellSpineRows.rows (labels program tree))) :
    FiniteController.runMutationCount (machine program tree) ticks configuration = 0 :=
  RootResetLabelledEdgeProbe.runMutationCount_zero _ _ ticks configuration

end PureSFormal.Research.RootResetCarrierPhaseProbe
