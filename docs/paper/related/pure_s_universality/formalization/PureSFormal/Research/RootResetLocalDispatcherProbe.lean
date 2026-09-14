import PureSFormal.Research.RootResetDispatcherLocalRows
import PureSFormal.Research.RootResetCarrierPhaseProbe
import PureSFormal.Research.RootResetFrontBitProbe

/-!
# Finite Local dispatcher selection from the bare carrier

The entry receives only a cursor.  Fixed Local syntax designates the halt
argument; phase and front-bit probes return to that argument.  Four literal
up moves restore the Local root, then the internally recovered finite label
chooses the dispatcher's fixed route rows.  No origin, carrier, or path is
retained in runtime control.
-/
namespace PureSFormal.Research.RootResetLocalDispatcherProbe
open PureSFormal.PureS
open FiniteController RootResetCarrierNonemptyProbe
open RootResetCompletedLocalPatterns
open RootResetCarrierEdgePatterns (EdgeRow)

def entryRows : List EdgeRow := [⟨localPattern .fresh .hole, [.left, .left, .left, .right]⟩]

abbrev PhaseControl (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :=
  RootResetLabelledEdgeProbe.Control RootResetCellSpineRows.rows (RootResetCarrierPhaseProbe.labels program tree)

abbrev PhaseAnswer (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :=
  RootResetLabelledPatternFragment.Control (RootResetCarrierPhaseProbe.labels program tree)

abbrev dispatchRows (program : CTS.Program) (layout : ActionDispatcher program) (label : ActionLabel program) :=
  RootResetDispatcherLocalRows.rows (selectedAction program) layout.tree (layout.route label)

inductive Control (program : CTS.Program) (layout : ActionDispatcher program) where
  | entry (pc : RootResetEdgeFragment.Control entryRows)
  | phase (pc : PhaseControl program layout.tree)
  | front (phase : CTS.Phase program) (pc : RootResetFrontBitProbe.Control program layout.tree)
  | returnThree (label : Option (ActionLabel program))
  | returnTwo (label : Option (ActionLabel program))
  | returnOne (label : Option (ActionLabel program))
  | dispatch (label : ActionLabel program) (pc : RootResetEdgeFragment.Control (dispatchRows program layout label))
  | done (ready : Bool)

def options (program : CTS.Program) : List (Option (ActionLabel program)) :=
  none :: (allActionLabels program).map some

theorem options_member (program : CTS.Program) (label : Option (ActionLabel program)) : label ∈ options program := by
  cases label with
  | none => exact List.Mem.head _
  | some label => exact List.Mem.tail _ (map_member _ (mem_allActionLabels program label))

def cover (program : CTS.Program) (layout : ActionDispatcher program) : List (Control program layout) :=
  [.done false, .done true] ++
    (RootResetEdgeFragment.machine entryRows).states.map Control.entry ++
    (RootResetCarrierPhaseProbe.machine program layout.tree).states.map Control.phase ++
    RootResetLabelledEdgeProbe.pairs Control.front (List.finRange program.period)
      (RootResetFrontBitProbe.machine program layout.tree).states ++
    (options program).map Control.returnThree ++ (options program).map Control.returnTwo ++
    (options program).map Control.returnOne ++
    (allActionLabels program).flatMap (fun label =>
      (RootResetEdgeFragment.machine (dispatchRows program layout label)).states.map (Control.dispatch label))

theorem covers (program : CTS.Program) (layout : ActionDispatcher program) (state : Control program layout) :
    state ∈ cover program layout := by
  simp only [cover, List.mem_append]
  cases state with
  | done ready =>
      apply Or.inl; apply Or.inl; apply Or.inl; apply Or.inl; apply Or.inl; apply Or.inl; apply Or.inl
      cases ready <;> simp only [List.mem_cons, List.mem_singleton, true_or, or_true]
  | entry pc => exact Or.inl (Or.inl (Or.inl (Or.inl (Or.inl (Or.inl (Or.inr
      (map_member _ ((RootResetEdgeFragment.machine entryRows).covers pc))))))))
  | phase pc => exact Or.inl (Or.inl (Or.inl (Or.inl (Or.inl (Or.inr
      (map_member _ ((RootResetCarrierPhaseProbe.machine program layout.tree).covers pc)))))))
  | front phase pc => exact Or.inl (Or.inl (Or.inl (Or.inl (Or.inr
      (RootResetLabelledEdgeProbe.pairs_member _ _ _ phase pc (phase_mem_finRange phase)
        ((RootResetFrontBitProbe.machine program layout.tree).covers pc))))))
  | returnThree label => exact Or.inl (Or.inl (Or.inl (Or.inr (map_member _ (options_member program label)))))
  | returnTwo label => exact Or.inl (Or.inl (Or.inr (map_member _ (options_member program label))))
  | returnOne label => exact Or.inl (Or.inr (map_member _ (options_member program label)))
  | dispatch label pc => exact Or.inr (SchedulerControl.mem_flatMap_clean _ (mem_allActionLabels program label)
      (map_member _ ((RootResetEdgeFragment.machine (dispatchRows program layout label)).covers pc)))

def phaseFirst (program : CTS.Program) (layout : ActionDispatcher program) : PhaseControl program layout.tree :=
  .descending ⟨RootResetEdgeSpine.whole RootResetCellSpineRows.rows, ProbeCompiler.Control.self_mem_nodes _⟩

def frontFirst (program : CTS.Program) (layout : ActionDispatcher program) : RootResetFrontBitProbe.Control program layout.tree :=
  .guarded ⟨RootResetFrontBitProbe.classifier program layout.tree, ProbeCompiler.Control.self_mem_nodes _⟩

def dispatchFirst (program : CTS.Program) (layout : ActionDispatcher program) (label : ActionLabel program) :
    RootResetEdgeFragment.Control (dispatchRows program layout label) :=
  ⟨RootResetEdgeFragment.familyCode (dispatchRows program layout label), ProbeCompiler.Control.self_mem_nodes _⟩

def transition (program : CTS.Program) (layout : ActionDispatcher program)
    (state : Control program layout) (node : Probe.NodeKind) (incoming : Probe.Incoming) : Command (Control program layout) :=
  match state with
  | .entry pc => match pc.val with
    | .answer true => .stay (.phase (phaseFirst program layout))
    | .answer false => .stay (.done false)
    | _ => mapCommand Control.entry ((RootResetEdgeFragment.machine entryRows).transition pc node incoming)
  | .phase (.done answer) => match RootResetLabelledPatternFragment.answer? answer with
    | some (some phase) => .stay (.front phase (frontFirst program layout))
    | _ => .exec .U (.returnThree none)
  | .phase pc => mapCommand Control.phase ((RootResetCarrierPhaseProbe.machine program layout.tree).transition pc node incoming)
  | .front phase (.done bit) => .exec .U (.returnThree (some (phase, bit)))
  | .front phase pc => mapCommand (Control.front phase) ((RootResetFrontBitProbe.machine program layout.tree).transition pc node incoming)
  | .returnThree label => .exec .U (.returnTwo label)
  | .returnTwo label => .exec .U (.returnOne label)
  | .returnOne none => .exec .U (.done false)
  | .returnOne (some label) => .exec .U (.dispatch label (dispatchFirst program layout label))
  | .dispatch label pc => match pc.val with
    | .answer ready => .stay (.done ready)
    | _ => mapCommand (Control.dispatch label)
        ((RootResetEdgeFragment.machine (dispatchRows program layout label)).transition pc node incoming)
  | .done ready => .stay (.done ready)

def machine (program : CTS.Program) (layout : ActionDispatcher program) : Machine (Control program layout) :=
  ⟨fun _ => cover program layout, covers program layout, transition program layout⟩

def initial (program : CTS.Program) (layout : ActionDispatcher program) (origin : Cursor) : Configuration (Control program layout) :=
  liftConfiguration Control.entry (RootResetEdgeFragment.initial entryRows origin)

def phaseInitial (program : CTS.Program) (layout : ActionDispatcher program) (origin : Cursor) : Configuration (Control program layout) :=
  liftConfiguration Control.phase (RootResetCarrierPhaseProbe.initial program layout.tree origin)

def frontInitial (program : CTS.Program) (layout : ActionDispatcher program) (phase : CTS.Phase program)
    (origin : Cursor) : Configuration (Control program layout) :=
  liftConfiguration (Control.front phase) (RootResetFrontBitProbe.initial program layout.tree origin)

def dispatchInitial (program : CTS.Program) (layout : ActionDispatcher program) (label : ActionLabel program)
    (origin : Cursor) : Configuration (Control program layout) :=
  liftConfiguration (Control.dispatch label) (RootResetEdgeFragment.initial (dispatchRows program layout label) origin)

def carrierCursor (carrier dispatcher seed continuation : Term) (parents : List ParentFrame) : Cursor :=
  ⟨carrier, .right haltCode :: .left dispatcher :: .left seed :: .left continuation :: parents⟩

def localCursor (carrier dispatcher seed continuation : Term) (parents : List ParentFrame) : Cursor :=
  ⟨.app (.app (.app (freshHField carrier) dispatcher) seed) continuation, parents⟩

def returned (program : CTS.Program) (layout : ActionDispatcher program) (label : Option (ActionLabel program))
    (origin : Cursor) : Configuration (Control program layout) :=
  match label with
  | none => ⟨some (.done false), origin⟩
  | some label => dispatchInitial program layout label origin

theorem return_three_runs (program : CTS.Program) (layout : ActionDispatcher program)
    (label : Option (ActionLabel program)) (carrier dispatcher seed continuation : Term) (parents : List ParentFrame) :
    run (machine program layout) 3
      ⟨some (.returnThree label), ⟨freshHField carrier, .left dispatcher :: .left seed :: .left continuation :: parents⟩⟩ =
      returned program layout label (localCursor carrier dispatcher seed continuation parents) := by
  cases label <;> rfl

theorem entry_step (program : CTS.Program) (layout : ActionDispatcher program)
    (configuration : Configuration (RootResetEdgeFragment.Control entryRows))
    (running : anyAnswer? configuration = false) :
    step (machine program layout) (liftConfiguration Control.entry configuration) =
      liftConfiguration Control.entry (step (RootResetEdgeFragment.machine entryRows) configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := current
  subst runtime
  rcases state with ⟨pc, member⟩
  cases pc with
  | answer ready => cases running
  | observeNode onS onApp => rfl
  | observeIncoming onRoot onLeft onRight => rfl
  | move operation next => rfl

theorem phase_step (program : CTS.Program) (layout : ActionDispatcher program)
    (configuration : Configuration (PhaseControl program layout.tree))
    (running : RootResetLabelledEdgeProbe.done? configuration = false) :
    step (machine program layout) (liftConfiguration Control.phase configuration) =
      liftConfiguration Control.phase (step (RootResetCarrierPhaseProbe.machine program layout.tree) configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := current
  subst runtime
  cases state with
  | done answer => cases running
  | descending pc => rfl
  | reading pc => rfl
  | ascending answer pc => rfl

theorem front_step (program : CTS.Program) (layout : ActionDispatcher program) (phase : CTS.Phase program)
    (configuration : Configuration (RootResetFrontBitProbe.Control program layout.tree))
    (running : RootResetFrontBitProbe.done? configuration = false) :
    step (machine program layout) (liftConfiguration (Control.front phase) configuration) =
      liftConfiguration (Control.front phase) (step (RootResetFrontBitProbe.machine program layout.tree) configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := current
  subst runtime
  cases state with
  | done bit => cases running
  | guarded pc => rfl
  | reading pc => rfl

theorem dispatch_step (program : CTS.Program) (layout : ActionDispatcher program) (label : ActionLabel program)
    (configuration : Configuration (RootResetEdgeFragment.Control (dispatchRows program layout label)))
    (running : anyAnswer? configuration = false) :
    step (machine program layout) (liftConfiguration (Control.dispatch label) configuration) =
      liftConfiguration (Control.dispatch label) (step (RootResetEdgeFragment.machine (dispatchRows program layout label)) configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := current
  subst runtime
  rcases state with ⟨pc, member⟩
  cases pc with
  | answer ready => cases running
  | observeNode onS onApp => rfl
  | observeIncoming onRoot onLeft onRight => rfl
  | move operation next => rfl

theorem entry_runs (program : CTS.Program) (layout : ActionDispatcher program) (origin endpoint : Cursor)
    (ticks : Nat) (ready : Bool)
    (member : ProbeCompiler.Control.answer ready ∈ (RootResetEdgeFragment.familyCode entryRows).nodes)
    (execution : run (RootResetEdgeFragment.machine entryRows) ticks (RootResetEdgeFragment.initial entryRows origin) =
      ⟨some ⟨.answer ready, member⟩, endpoint⟩) :
    ∃ used, used ≤ ticks ∧ run (machine program layout) (used + 1) (initial program layout origin) =
      if ready then phaseInitial program layout endpoint else ⟨some (.done false), endpoint⟩ := by
  obtain ⟨used, bounded, lifted⟩ := run_to_boundary (RootResetEdgeFragment.machine entryRows)
    (machine program layout) Control.entry anyAnswer?
    (RootResetMixedLocalFragment.classify_absorbs _) (entry_step program layout)
    ticks (RootResetEdgeFragment.initial entryRows origin) (by rw [execution]; rfl)
  rw [execution] at lifted
  refine ⟨used, bounded, ?_⟩
  rw [initial, run_add, lifted]
  cases ready <;> rfl

theorem phase_runs (program : CTS.Program) (layout : ActionDispatcher program) (origin : Cursor)
    (ticks : Nat) (answer : PhaseAnswer program layout.tree)
    (execution : run (RootResetCarrierPhaseProbe.machine program layout.tree) ticks
      (RootResetCarrierPhaseProbe.initial program layout.tree origin) = ⟨some (.done answer), origin⟩) :
    ∃ used, used ≤ ticks ∧ run (machine program layout) used (phaseInitial program layout origin) =
      ⟨some (.phase (.done answer)), origin⟩ := by
  obtain ⟨used, bounded, lifted⟩ := run_to_boundary (RootResetCarrierPhaseProbe.machine program layout.tree)
    (machine program layout) Control.phase RootResetLabelledEdgeProbe.done?
    (RootResetLabelledEdgeProbe.terminal_absorbs _ _) (phase_step program layout)
    ticks (RootResetCarrierPhaseProbe.initial program layout.tree origin) (by rw [execution]; rfl)
  rw [execution] at lifted
  exact ⟨used, bounded, lifted⟩

theorem front_runs (program : CTS.Program) (layout : ActionDispatcher program) (phase : CTS.Phase program)
    (origin : Cursor) (ticks : Nat) (bit : Bool)
    (execution : run (RootResetFrontBitProbe.machine program layout.tree) ticks
      (RootResetFrontBitProbe.initial program layout.tree origin) = ⟨some (.done bit), origin⟩) :
    ∃ used, used ≤ ticks ∧ run (machine program layout) used (frontInitial program layout phase origin) =
      ⟨some (.front phase (.done bit)), origin⟩ := by
  obtain ⟨used, bounded, lifted⟩ := run_to_boundary (RootResetFrontBitProbe.machine program layout.tree)
    (machine program layout) (Control.front phase) RootResetFrontBitProbe.done?
    (RootResetFrontBitProbe.terminal_absorbs program layout.tree) (front_step program layout phase)
    ticks (RootResetFrontBitProbe.initial program layout.tree origin) (by rw [execution]; rfl)
  rw [execution] at lifted
  exact ⟨used, bounded, lifted⟩

theorem dispatch_runs (program : CTS.Program) (layout : ActionDispatcher program) (label : ActionLabel program)
    (origin endpoint : Cursor) (ticks : Nat) (ready : Bool)
    (member : ProbeCompiler.Control.answer ready ∈ (RootResetEdgeFragment.familyCode (dispatchRows program layout label)).nodes)
    (execution : run (RootResetEdgeFragment.machine (dispatchRows program layout label)) ticks
      (RootResetEdgeFragment.initial (dispatchRows program layout label) origin) =
      ⟨some ⟨.answer ready, member⟩, endpoint⟩) :
    ∃ used, used ≤ ticks ∧ run (machine program layout) (used + 1) (dispatchInitial program layout label origin) =
      ⟨some (.done ready), endpoint⟩ := by
  obtain ⟨used, bounded, lifted⟩ := run_to_boundary (RootResetEdgeFragment.machine (dispatchRows program layout label))
    (machine program layout) (Control.dispatch label) anyAnswer?
    (RootResetMixedLocalFragment.classify_absorbs _) (dispatch_step program layout label)
    ticks (RootResetEdgeFragment.initial (dispatchRows program layout label) origin) (by rw [execution]; rfl)
  rw [execution] at lifted
  refine ⟨used, bounded, ?_⟩
  rw [dispatchInitial, run_add, lifted]
  rfl

theorem phase_accepts (program : CTS.Program) (layout : ActionDispatcher program)
    (answer : PhaseAnswer program layout.tree) (phase : CTS.Phase program)
    (read : RootResetLabelledPatternFragment.answer? answer = some (some phase)) (origin : Cursor) :
    run (machine program layout) 1 ⟨some (.phase (.done answer)), origin⟩ =
      frontInitial program layout phase origin := by
  simp only [run, step, machine, transition, read]
  rfl

theorem phase_misses (program : CTS.Program) (layout : ActionDispatcher program)
    (answer : PhaseAnswer program layout.tree)
    (read : RootResetLabelledPatternFragment.answer? answer = some none)
    (carrier dispatcher seed continuation : Term) (parents : List ParentFrame) :
    run (machine program layout) 4
      ⟨some (.phase (.done answer)), carrierCursor carrier dispatcher seed continuation parents⟩ =
      ⟨some (.done false), localCursor carrier dispatcher seed continuation parents⟩ := by
  change run (machine program layout) (1 + 3) _ = _
  rw [run_add]
  have firstRun : run (machine program layout) 1
      ⟨some (.phase (.done answer)), carrierCursor carrier dispatcher seed continuation parents⟩ =
      ⟨some (.returnThree none), ⟨freshHField carrier, .left dispatcher :: .left seed :: .left continuation :: parents⟩⟩ := by
    simp only [run, step, machine, transition, read]
    rfl
  rw [firstRun]
  exact return_three_runs program layout none carrier dispatcher seed continuation parents

theorem front_returns (program : CTS.Program) (layout : ActionDispatcher program)
    (phase : CTS.Phase program) (bit : Bool) (carrier dispatcher seed continuation : Term) (parents : List ParentFrame) :
    run (machine program layout) 4
      ⟨some (.front phase (.done bit)), carrierCursor carrier dispatcher seed continuation parents⟩ =
      dispatchInitial program layout (phase, bit) (localCursor carrier dispatcher seed continuation parents) := by
  change run (machine program layout) (1 + 3) _ = _
  rw [run_add]
  exact return_three_runs program layout (some (phase, bit)) carrier dispatcher seed continuation parents

def sumBound {α : Type} (measure : α → Nat) : List α → Nat
  | [] => 0
  | first :: rest => measure first + sumBound measure rest

theorem le_sumBound {α : Type} (measure : α → Nat) (values : List α) (value : α)
    (member : value ∈ values) : measure value ≤ sumBound measure values := by
  induction member with
  | head => exact Nat.le_add_right _ _
  | tail first member ih => exact Nat.le_trans ih (Nat.le_add_left _ _)

def dispatchBound (program : CTS.Program) (layout : ActionDispatcher program) : Nat :=
  sumBound (fun label => RootResetEdgeFragment.bound (dispatchRows program layout label)) (allActionLabels program)

theorem dispatch_bound (program : CTS.Program) (layout : ActionDispatcher program) (label : ActionLabel program) :
    RootResetEdgeFragment.bound (dispatchRows program layout label) ≤ dispatchBound program layout :=
  le_sumBound (fun label => RootResetEdgeFragment.bound (dispatchRows program layout label))
    _ label (mem_allActionLabels program label)

def phaseCoefficient (program : CTS.Program) (layout : ActionDispatcher program) : Nat :=
  RootResetLabelledEdgeProbe.coefficient RootResetCellSpineRows.rows (RootResetCarrierPhaseProbe.labels program layout.tree)

def coefficient (program : CTS.Program) (layout : ActionDispatcher program) : Nat :=
  RootResetEdgeFragment.bound entryRows + phaseCoefficient program layout +
    RootResetFrontBitProbe.coefficient program layout.tree + dispatchBound program layout + 7

theorem combined_bound (program : CTS.Program) (layout : ActionDispatcher program) (origin : Cursor)
    (entry phase front dispatch handoffs : Nat)
    (entryBound : entry ≤ RootResetEdgeFragment.bound entryRows)
    (phaseBound : phase ≤ phaseCoefficient program layout * origin.erase.size)
    (frontBound : front ≤ RootResetFrontBitProbe.coefficient program layout.tree * origin.erase.size)
    (dispatchLimit : dispatch ≤ dispatchBound program layout) (handoffBound : handoffs ≤ 7) :
    entry + phase + front + dispatch + handoffs ≤ coefficient program layout * origin.erase.size := by
  have constant (value : Nat) : value ≤ value * origin.erase.size := by
    simpa only [Nat.mul_one] using Nat.mul_le_mul_left value (Term.size_pos origin.erase)
  have total := Nat.add_le_add
    (Nat.add_le_add (Nat.add_le_add (Nat.add_le_add (Nat.le_trans entryBound (constant _)) phaseBound) frontBound)
      (Nat.le_trans dispatchLimit (constant _))) (Nat.le_trans handoffBound (constant 7))
  simpa only [coefficient, Nat.add_mul] using total

theorem entry_shape (source : Term)
    (matched : (localPattern .fresh Pattern.hole).matchesBool source = true) :
    ∃ carrier dispatcher seed continuation,
      source = .app (.app (.app (freshHField carrier) dispatcher) seed) continuation := by
  obtain ⟨a, continuation, sourceEq, aMatches, _⟩ := app_matches matched
  obtain ⟨b, seed, aEq, bMatches, _⟩ := app_matches aMatches
  obtain ⟨halt, dispatcher, bEq, haltMatches, _⟩ := app_matches bMatches
  obtain ⟨code, carrier, haltEq, codeMatches, _⟩ := app_matches haltMatches
  have codeEq := (literal_matches haltCode code).mp codeMatches
  refine ⟨carrier, dispatcher, seed, continuation, ?_⟩
  rw [sourceEq, aEq, bEq, haltEq, codeEq]
  rfl

theorem carrier_erase (carrier dispatcher seed continuation : Term) (parents : List ParentFrame) :
    (carrierCursor carrier dispatcher seed continuation parents).erase =
      (localCursor carrier dispatcher seed continuation parents).erase := rfl

theorem all_input (program : CTS.Program) (layout : ActionDispatcher program) (origin : Cursor) :
    ∃ ticks ready endpoint, ticks ≤ coefficient program layout * origin.erase.size ∧
      run (machine program layout) ticks (initial program layout origin) = ⟨some (.done ready), endpoint⟩ ∧
      (if ready then endpoint.rdx?.isSome = true else endpoint = origin) := by
  cases matched : (localPattern .fresh Pattern.hole).matchesBool origin.focus with
  | false =>
      have selected : RootResetEdgeFragment.select entryRows origin.focus = none := by
        simp only [entryRows, RootResetEdgeFragment.select, matched, Bool.false_eq_true, ↓reduceIte]
      obtain ⟨member, execution⟩ := RootResetEdgeFragment.missed_runs entryRows origin selected
      obtain ⟨used, bounded, actual⟩ := entry_runs program layout origin origin _ false member execution
      have usedBound := Nat.le_trans bounded (RootResetEdgeFragment.ticks_bound _ _)
      refine ⟨used + 1, false, origin, ?_, actual, rfl⟩
      simpa only [Nat.add_zero] using combined_bound program layout origin used 0 0 0 1 usedBound
        (Nat.zero_le _) (Nat.zero_le _) (Nat.zero_le _) (by decide)
  | true =>
      obtain ⟨carrier, dispatcher, seed, continuation, sourceEq⟩ := entry_shape origin.focus matched
      rcases origin with ⟨source, parents⟩
      change source = _ at sourceEq
      subst source
      let origin := localCursor carrier dispatcher seed continuation parents
      let carrierOrigin := carrierCursor carrier dispatcher seed continuation parents
      change (localPattern .fresh Pattern.hole).matchesBool origin.focus = true at matched
      have selected : RootResetEdgeFragment.select entryRows origin.focus =
          some ⟨localPattern .fresh .hole, [.left, .left, .left, .right]⟩ := by
        simp only [entryRows, RootResetEdgeFragment.select, matched, ↓reduceIte]
      obtain ⟨entryMember, entryExecution⟩ := RootResetEdgeFragment.selected_runs entryRows origin carrierOrigin _ selected rfl
      obtain ⟨entryUsed, entryBound, entryActual⟩ := entry_runs program layout origin carrierOrigin _ true entryMember entryExecution
      simp only [↓reduceIte] at entryActual
      have entryLimit := Nat.le_trans entryBound (RootResetEdgeFragment.ticks_bound _ _)
      obtain ⟨phaseTicks, descended, phaseBudget, phaseExecution, _⟩ :=
        RootResetCarrierPhaseProbe.all_input program layout.tree carrier
          (.left dispatcher :: .left seed :: .left continuation :: parents)
      obtain ⟨phaseUsed, phaseBound, phaseActual⟩ := phase_runs program layout carrierOrigin phaseTicks _ phaseExecution
      have queried := (congrArg (run (machine program layout) phaseUsed) entryActual).trans phaseActual
      have phaseLimit : phaseUsed ≤ phaseCoefficient program layout * origin.erase.size := by
        have limit := Nat.le_trans phaseBound (Nat.le_trans phaseBudget
          (RootResetLabelledEdgeProbe.budget_erase RootResetCellSpineRows.rows
            (RootResetCarrierPhaseProbe.labels program layout.tree) carrierOrigin))
        exact limit
      let answer := RootResetLabelledPatternFragment.finished (RootResetCarrierPhaseProbe.labels program layout.tree) descended.focus
      have phaseAnswer := RootResetLabelledPatternFragment.finished_answer
        (RootResetCarrierPhaseProbe.labels program layout.tree) descended.focus
      cases phaseSelected : RootResetLabelledPatternFragment.selected (RootResetCarrierPhaseProbe.labels program layout.tree) descended.focus with
      | none =>
          have read : RootResetLabelledPatternFragment.answer? answer = some none := phaseAnswer.trans (congrArg some phaseSelected)
          have finished := phase_misses program layout answer read carrier dispatcher seed continuation parents
          refine ⟨entryUsed + 1 + phaseUsed + 4, false, origin, ?_, ?_, rfl⟩
          · simpa only [Nat.add_zero, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using!
              combined_bound program layout origin entryUsed phaseUsed 0 0 5 entryLimit phaseLimit
                (Nat.zero_le _) (Nat.zero_le _) (by decide)
          · have total := (congrArg (run (machine program layout) 4) queried).trans finished
            simpa only [run_add] using! total
      | some phase =>
          have read : RootResetLabelledPatternFragment.answer? answer = some (some phase) := phaseAnswer.trans (congrArg some phaseSelected)
          have accepted := phase_accepts program layout answer phase read carrierOrigin
          obtain ⟨frontTicks, bit, frontLimit, frontExecution⟩ := RootResetFrontBitProbe.all_input program layout.tree carrier
            (.left dispatcher :: .left seed :: .left continuation :: parents)
          obtain ⟨frontUsed, frontBound, frontActual⟩ := front_runs program layout phase carrierOrigin frontTicks bit frontExecution
          have frontCost : frontUsed ≤ RootResetFrontBitProbe.coefficient program layout.tree * origin.erase.size :=
            Nat.le_trans frontBound frontLimit
          have returned := front_returns program layout phase bit carrier dispatcher seed continuation parents
          obtain ⟨ready, endpoint, dispatchMember, dispatchExecution, result, dispatchLimit⟩ :=
            RootResetDispatcherLocalRows.all_input (selectedAction program) layout.tree (layout.route (phase, bit)) origin
          obtain ⟨dispatchUsed, dispatchUsedBound, dispatchActual⟩ :=
            dispatch_runs program layout (phase, bit) origin endpoint _ ready dispatchMember dispatchExecution
          have dispatchCost := Nat.le_trans dispatchUsedBound (Nat.le_trans dispatchLimit (dispatch_bound program layout (phase, bit)))
          refine ⟨entryUsed + 1 + phaseUsed + 1 + frontUsed + 4 + (dispatchUsed + 1), ready, endpoint, ?_, ?_, result⟩
          · simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using!
              combined_bound program layout origin entryUsed phaseUsed frontUsed dispatchUsed 7 entryLimit phaseLimit frontCost dispatchCost (Nat.le_refl _)
          · have toFront := (congrArg (run (machine program layout) 1) queried).trans accepted
            have readFront := (congrArg (run (machine program layout) frontUsed) toFront).trans frontActual
            have toDispatch := (congrArg (run (machine program layout) 4) readFront).trans returned
            have total := (congrArg (run (machine program layout) (dispatchUsed + 1)) toDispatch).trans dispatchActual
            simpa only [run_add] using! total

theorem mutationCount_zero (program : CTS.Program) (layout : ActionDispatcher program)
    (configuration : Configuration (Control program layout)) : mutationCount (machine program layout) configuration = 0 := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      rw [← commandCount_eq_mutationCount]
      cases state with
      | done ready => rfl
      | returnThree label => rfl
      | returnTwo label => rfl
      | returnOne label => cases label <;> rfl
      | entry pc =>
          rcases pc with ⟨code, member⟩
          have zero := RootResetPatternFragment.mutationCount_zero _ (RootResetEdgeFragment.family_readOnly entryRows)
            ⟨some ⟨code, member⟩, cursor⟩
          rw [← commandCount_eq_mutationCount] at zero
          cases code with
          | answer bit => cases bit <;> rfl
          | observeNode onS onApp => simp only [machine, transition, commandCount_map]; exact zero
          | observeIncoming onRoot onLeft onRight => simp only [machine, transition, commandCount_map]; exact zero
          | move operation next => simp only [machine, transition, commandCount_map]; exact zero
      | phase pc =>
          have zero := RootResetLabelledEdgeProbe.mutationCount_zero RootResetCellSpineRows.rows
            (RootResetCarrierPhaseProbe.labels program layout.tree) ⟨some pc, cursor⟩
          rw [← commandCount_eq_mutationCount] at zero
          cases pc with
          | done answer =>
              cases result : RootResetLabelledPatternFragment.answer? answer with
              | none => simp only [machine, transition, result]; rfl
              | some phase => cases phase <;> simp only [machine, transition, result] <;> rfl
          | descending pc => simp only [machine, transition, commandCount_map]; exact zero
          | reading pc => simp only [machine, transition, commandCount_map]; exact zero
          | ascending answer pc => simp only [machine, transition, commandCount_map]; exact zero
      | front phase pc =>
          have zero := RootResetFrontBitProbe.mutationCount_zero program layout.tree ⟨some pc, cursor⟩
          rw [← commandCount_eq_mutationCount] at zero
          cases pc with
          | done bit => rfl
          | guarded pc => simp only [machine, transition, commandCount_map]; exact zero
          | reading pc => simp only [machine, transition, commandCount_map]; exact zero
      | dispatch label pc =>
          rcases pc with ⟨code, member⟩
          have zero := RootResetPatternFragment.mutationCount_zero _ (RootResetEdgeFragment.family_readOnly (dispatchRows program layout label))
            ⟨some ⟨code, member⟩, cursor⟩
          rw [← commandCount_eq_mutationCount] at zero
          cases code with
          | answer ready => rfl
          | observeNode onS onApp => simp only [machine, transition, commandCount_map]; exact zero
          | observeIncoming onRoot onLeft onRight => simp only [machine, transition, commandCount_map]; exact zero
          | move operation next => simp only [machine, transition, commandCount_map]; exact zero

theorem runMutationCount_zero (program : CTS.Program) (layout : ActionDispatcher program)
    (ticks : Nat) (configuration : Configuration (Control program layout)) :
    runMutationCount (machine program layout) ticks configuration = 0 := by
  induction ticks generalizing configuration with
  | zero => rfl
  | succ ticks ih => rw [runMutationCount, mutationCount_zero, ih, Nat.zero_add]

theorem erase_run (program : CTS.Program) (layout : ActionDispatcher program)
    (ticks : Nat) (configuration : Configuration (Control program layout)) :
    (run (machine program layout) ticks configuration).cursor.erase = configuration.cursor.erase := by
  have projected := run_projects_stepsN (machine program layout) ticks configuration
  rw [runMutationCount_zero] at projected
  exact (StepsN.eq_of_zero projected).symm

def done? {program : CTS.Program} {layout : ActionDispatcher program}
    (configuration : Configuration (Control program layout)) : Bool :=
  match configuration.control with | some (.done _) => true | _ => false

theorem done_absorbs (program : CTS.Program) (layout : ActionDispatcher program)
    (ready : Bool) (origin : Cursor) (ticks : Nat) :
    run (machine program layout) ticks ⟨some (.done ready), origin⟩ = ⟨some (.done ready), origin⟩ := by
  induction ticks with
  | zero => rfl
  | succ ticks ih => exact ih

theorem terminal_absorbs (program : CTS.Program) (layout : ActionDispatcher program)
    (configuration : Configuration (Control program layout)) (ended : done? configuration = true)
    (ticks : Nat) : run (machine program layout) ticks configuration = configuration := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => cases ended
  | some state => cases state with
    | done ready => exact done_absorbs program layout ready cursor ticks
    | entry pc => cases ended
    | phase pc => cases ended
    | front phase pc => cases ended
    | returnThree label => cases ended
    | returnTwo label => cases ended
    | returnOne label => cases ended
    | dispatch label pc => cases ended

def queryCoefficient (program : CTS.Program) (layout : ActionDispatcher program) : Nat :=
  RootResetEdgeFragment.bound entryRows + phaseCoefficient program layout +
    RootResetFrontBitProbe.coefficient program layout.tree + 6

theorem query_combined_bound (program : CTS.Program) (layout : ActionDispatcher program) (origin : Cursor)
    (entry phase front : Nat) (entryBound : entry ≤ RootResetEdgeFragment.bound entryRows)
    (phaseBound : phase ≤ phaseCoefficient program layout * origin.erase.size)
    (frontBound : front ≤ RootResetFrontBitProbe.coefficient program layout.tree * origin.erase.size) :
    entry + phase + front + 6 ≤ queryCoefficient program layout * origin.erase.size := by
  have constant (value : Nat) : value ≤ value * origin.erase.size := by
    simpa only [Nat.mul_one] using Nat.mul_le_mul_left value (Term.size_pos origin.erase)
  have total := Nat.add_le_add (Nat.add_le_add (Nat.add_le_add
    (Nat.le_trans entryBound (constant _)) phaseBound) frontBound) (constant 6)
  simpa only [queryCoefficient, Nat.add_mul] using total

theorem generated_query {program : CTS.Program} (layout : ActionDispatcher program)
    {input decoded : List Bool} {pathContinuation carrier : Term}
    (admissible : Carrier.Admissible pathContinuation)
    (path : CarrierDecoder.PathDecodes program layout.tree input pathContinuation carrier decoded)
    (phase : CTS.Phase program)
    (phaseEq : RootResetPersistentResponseSelector.carrierPhase? program layout.tree carrier = some phase)
    (dispatcher payload continuation seedAudit continuationAudit : Term) (parents : List ParentFrame) :
    let source := CheckpointDecoder.openShell (freshHField carrier) dispatcher payload seedAudit continuation continuationAudit
    let label : ActionLabel program := (phase, RootResetResponseBitFiniteValue.value program layout.tree carrier)
    ∃ ticks, ticks ≤ queryCoefficient program layout * (Cursor.mk source parents).erase.size ∧
      run (machine program layout) ticks (initial program layout ⟨source, parents⟩) =
        dispatchInitial program layout label ⟨source, parents⟩ := by
  dsimp only
  let seed := Term.app (.app .s payload) seedAudit
  let continuationArgument := Term.app continuation continuationAudit
  let origin := localCursor carrier dispatcher seed continuationArgument parents
  let carrierOrigin := carrierCursor carrier dispatcher seed continuationArgument parents
  have matched : (localPattern .fresh Pattern.hole).matchesBool origin.focus = true := by
    simp only [localPattern, origin, localCursor, seed, continuationArgument, haltPattern, freshHField,
      Pattern.matchesBool, literal_self, Bool.and_self]
  have selected : RootResetEdgeFragment.select entryRows origin.focus =
      some ⟨localPattern .fresh .hole, [.left, .left, .left, .right]⟩ := by
    simp only [entryRows, RootResetEdgeFragment.select, matched, ↓reduceIte]
  obtain ⟨entryMember, entryExecution⟩ := RootResetEdgeFragment.selected_runs entryRows origin carrierOrigin _ selected rfl
  obtain ⟨entryUsed, entryBound, entryActual⟩ := entry_runs program layout origin carrierOrigin _ true entryMember entryExecution
  simp only [↓reduceIte] at entryActual
  have entryLimit := Nat.le_trans entryBound (RootResetEdgeFragment.ticks_bound _ _)
  obtain ⟨phaseTicks, answer, phaseBudget, phaseExecution, read⟩ :=
    RootResetCarrierPhaseProbe.generated_path_runs admissible path phase phaseEq
      (.left dispatcher :: .left seed :: .left continuationArgument :: parents)
  obtain ⟨phaseUsed, phaseBound, phaseActual⟩ := phase_runs program layout carrierOrigin phaseTicks answer phaseExecution
  have phaseLimit : phaseUsed ≤ phaseCoefficient program layout * origin.erase.size :=
    Nat.le_trans phaseBound (Nat.le_trans phaseBudget
      (RootResetLabelledEdgeProbe.budget_erase RootResetCellSpineRows.rows
        (RootResetCarrierPhaseProbe.labels program layout.tree) carrierOrigin))
  have accepted := phase_accepts program layout answer phase read carrierOrigin
  obtain ⟨frontTicks, frontLimit, frontExecution⟩ := RootResetFrontBitProbe.generated_path_runs admissible path
    (.left dispatcher :: .left seed :: .left continuationArgument :: parents)
  obtain ⟨frontUsed, frontBound, frontActual⟩ := front_runs program layout phase carrierOrigin frontTicks _ frontExecution
  have frontCost : frontUsed ≤ RootResetFrontBitProbe.coefficient program layout.tree * origin.erase.size :=
    Nat.le_trans frontBound frontLimit
  have returned := front_returns program layout phase (RootResetResponseBitFiniteValue.value program layout.tree carrier)
    carrier dispatcher seed continuationArgument parents
  refine ⟨entryUsed + 1 + phaseUsed + 1 + frontUsed + 4, ?_, ?_⟩
  · simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using!
      query_combined_bound program layout origin entryUsed phaseUsed frontUsed entryLimit phaseLimit frontCost
  · have queried := (congrArg (run (machine program layout) phaseUsed) entryActual).trans phaseActual
    have toFront := (congrArg (run (machine program layout) 1) queried).trans accepted
    have readFront := (congrArg (run (machine program layout) frontUsed) toFront).trans frontActual
    have total := (congrArg (run (machine program layout) 4) readFront).trans returned
    simpa only [run_add] using! total

theorem generated_finish {program : CTS.Program} (layout : ActionDispatcher program) {ready : Bool}
    {input decoded : List Bool} {pathContinuation carrier : Term}
    (admissible : Carrier.Admissible pathContinuation)
    (path : CarrierDecoder.PathDecodes program layout.tree input pathContinuation carrier decoded)
    (phase : CTS.Phase program)
    (phaseEq : RootResetPersistentResponseSelector.carrierPhase? program layout.tree carrier = some phase)
    (dispatcher payload continuation seedAudit continuationAudit : Term) (parents : List ParentFrame)
    (endpoint : Cursor)
    (member : ProbeCompiler.Control.answer ready ∈ (RootResetEdgeFragment.familyCode
      (dispatchRows program layout (phase, RootResetResponseBitFiniteValue.value program layout.tree carrier))).nodes)
    (execution : let source := CheckpointDecoder.openShell (freshHField carrier) dispatcher payload seedAudit continuation continuationAudit
      run (RootResetEdgeFragment.machine (dispatchRows program layout (phase, RootResetResponseBitFiniteValue.value program layout.tree carrier)))
        (RootResetEdgeFragment.ticks (dispatchRows program layout (phase, RootResetResponseBitFiniteValue.value program layout.tree carrier)) source)
        (RootResetEdgeFragment.initial (dispatchRows program layout (phase, RootResetResponseBitFiniteValue.value program layout.tree carrier)) ⟨source, parents⟩) =
        ⟨some ⟨.answer ready, member⟩, endpoint⟩) :
    let source := CheckpointDecoder.openShell (freshHField carrier) dispatcher payload seedAudit continuation continuationAudit
    ∃ ticks, ticks ≤ coefficient program layout * (Cursor.mk source parents).erase.size ∧
      run (machine program layout) ticks (initial program layout ⟨source, parents⟩) = ⟨some (.done ready), endpoint⟩ := by
  dsimp only at execution ⊢
  let source := CheckpointDecoder.openShell (freshHField carrier) dispatcher payload seedAudit continuation continuationAudit
  let origin : Cursor := ⟨source, parents⟩
  let label : ActionLabel program := (phase, RootResetResponseBitFiniteValue.value program layout.tree carrier)
  obtain ⟨queryTicks, queryBound, queryRun⟩ := generated_query layout admissible path phase phaseEq
    dispatcher payload continuation seedAudit continuationAudit parents
  change queryTicks ≤ queryCoefficient program layout * origin.erase.size at queryBound
  obtain ⟨dispatchUsed, dispatchUsedBound, dispatchActual⟩ := dispatch_runs program layout label origin endpoint _ ready member execution
  have dispatchCost := Nat.le_trans dispatchUsedBound
    (Nat.le_trans (RootResetEdgeFragment.ticks_bound (dispatchRows program layout label) source) (dispatch_bound program layout label))
  refine ⟨queryTicks + (dispatchUsed + 1), ?_, ?_⟩
  · have constant (value : Nat) : value ≤ value * origin.erase.size := by
      simpa only [Nat.mul_one] using Nat.mul_le_mul_left value (Term.size_pos origin.erase)
    have total := Nat.add_le_add (Nat.add_le_add queryBound (Nat.le_trans dispatchCost (constant _))) (constant 1)
    have coefficients : queryCoefficient program layout + dispatchBound program layout + 1 = coefficient program layout := by
      dsimp only [coefficient, queryCoefficient]
      rw [Nat.add_right_comm _ 6 (dispatchBound program layout), Nat.add_assoc]
    rw [← Nat.add_mul, ← Nat.add_mul, coefficients] at total
    simpa only [Nat.add_assoc] using total
  · have total := (congrArg (run (machine program layout) (dispatchUsed + 1)) queryRun).trans dispatchActual
    simpa only [run_add] using total

theorem generated_shape {program : CTS.Program} (layout : ActionDispatcher program)
    {input decoded : List Bool} {pathContinuation carrier : Term}
    (admissible : Carrier.Admissible pathContinuation)
    (path : CarrierDecoder.PathDecodes program layout.tree input pathContinuation carrier decoded)
    (phase : CTS.Phase program)
    (phaseEq : RootResetPersistentResponseSelector.carrierPhase? program layout.tree carrier = some phase)
    {dispatcher : Term} {view : RootResetWholeDispatcherStages.RouteView (ActionLabel program)}
    (shape : RootResetWholeDispatcherStages.RouteShape (selectedAction program) layout.tree
      (layout.route (phase, RootResetResponseBitFiniteValue.value program layout.tree carrier)) view dispatcher)
    (bits : List Bool) (continuation seedAudit continuationAudit : Term) (parents : List ParentFrame) :
    let source := CheckpointDecoder.openShell (freshHField carrier) dispatcher (word bits) seedAudit continuation continuationAudit
    ∃ ticks endpoint, ticks ≤ coefficient program layout * (Cursor.mk source parents).erase.size ∧
      run (machine program layout) ticks (initial program layout ⟨source, parents⟩) = ⟨some (.done true), endpoint⟩ ∧
      RootResetEdgeFragment.follow
        (RootResetAppenderRouteRows.shellAddress ++ RootResetDispatcherStageRows.redexAddress view)
        ⟨source, parents⟩ = some endpoint ∧ endpoint.rdx?.isSome = true := by
  dsimp only
  obtain ⟨endpoint, member, followed, execution, redex⟩ := RootResetDispatcherLocalRows.generated_shape
    shape bits continuation carrier seedAudit continuationAudit parents
  obtain ⟨ticks, bounded, actual⟩ := generated_finish layout admissible path phase phaseEq
    dispatcher (word bits) continuation seedAudit continuationAudit parents endpoint member execution
  exact ⟨ticks, endpoint, bounded, actual, followed, redex⟩

theorem generated_initial {program : CTS.Program} (layout : ActionDispatcher program)
    {input decoded : List Bool} {pathContinuation carrier : Term}
    (admissible : Carrier.Admissible pathContinuation)
    (path : CarrierDecoder.PathDecodes program layout.tree input pathContinuation carrier decoded)
    (phase : CTS.Phase program)
    (phaseEq : RootResetPersistentResponseSelector.carrierPhase? program layout.tree carrier = some phase)
    (argument : Term) (bits : List Bool) (continuation seedAudit continuationAudit : Term) (parents : List ParentFrame) :
    let source := CheckpointDecoder.openShell (freshHField carrier)
      (RouteGrammar.compiledCall (selectedAction program) layout.tree argument)
      (word bits) seedAudit continuation continuationAudit
    ∃ ticks endpoint, ticks ≤ coefficient program layout * (Cursor.mk source parents).erase.size ∧
      run (machine program layout) ticks (initial program layout ⟨source, parents⟩) = ⟨some (.done true), endpoint⟩ ∧
      RootResetEdgeFragment.follow RootResetAppenderRouteRows.shellAddress ⟨source, parents⟩ = some endpoint ∧
      endpoint.rdx?.isSome = true := by
  dsimp only
  obtain ⟨endpoint, member, followed, execution, redex⟩ := RootResetDispatcherLocalRows.generated_initial
    (selectedAction program) layout.tree (layout.route (phase, RootResetResponseBitFiniteValue.value program layout.tree carrier))
    argument bits continuation carrier seedAudit continuationAudit parents
  obtain ⟨ticks, bounded, actual⟩ := generated_finish layout admissible path phase phaseEq
    (RouteGrammar.compiledCall (selectedAction program) layout.tree argument) (word bits)
    continuation seedAudit continuationAudit parents endpoint member execution
  exact ⟨ticks, endpoint, bounded, actual, followed, redex⟩

end PureSFormal.Research.RootResetLocalDispatcherProbe
