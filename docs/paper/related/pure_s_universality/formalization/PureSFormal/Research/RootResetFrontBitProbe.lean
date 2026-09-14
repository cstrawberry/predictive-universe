import PureSFormal.Research.RootResetDeletedBitAgreement
import PureSFormal.Research.RootResetResponseBitFiniteValue

/-! A fixed finite marked-root guard followed by the deleted-front-bit scan.
Marked roots return false immediately. Every other input delegates the exact
restoring scanner and defaults an absent tombstone to false. -/
namespace PureSFormal.Research.RootResetFrontBitProbe
open PureSFormal.PureS
open FiniteController
open RootResetPatternFragment (PC)
open RootResetCarrierNonemptyProbe (mapCommand liftConfiguration)

abbrev classifier (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :=
  RootResetMixedLocalFragment.classifier .marked program tree
abbrev QueryControl (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :=
  RootResetLabelledEdgeProbe.Control (RootResetDeletedBitRows.rows program tree) RootResetDeletedBitRows.labels
abbrev Answer := RootResetLabelledPatternFragment.Control RootResetDeletedBitRows.labels

def readAnswer (answer : Answer) : Bool :=
  ((RootResetLabelledPatternFragment.answer? answer).getD none).getD false

inductive Control (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) where
  | guarded (pc : PC (classifier program tree))
  | reading (pc : QueryControl program tree)
  | done (bit : Bool)

def cover (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : List (Control program tree) :=
  [.done false, .done true] ++
    (RootResetPatternFragment.machine (classifier program tree)).states.map Control.guarded ++
    (RootResetDeletedBitRows.machine program tree).states.map Control.reading

theorem covers (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (state : Control program tree) :
    state ∈ cover program tree := by
  cases state with
  | done bit =>
      apply List.mem_append.mpr ∘ Or.inl ∘ List.mem_append.mpr ∘ Or.inl
      cases bit
      · exact List.Mem.head _
      · exact List.Mem.tail _ (List.Mem.head _)
  | guarded pc => exact List.mem_append.mpr (Or.inl (List.mem_append.mpr (Or.inr
      (RootResetCompletedLocalPatterns.map_member _ ((RootResetPatternFragment.machine (classifier program tree)).covers pc)))))
  | reading pc => exact List.mem_append.mpr (Or.inr
      (RootResetCompletedLocalPatterns.map_member _ ((RootResetDeletedBitRows.machine program tree).covers pc)))

def transition (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (state : Control program tree) (node : Probe.NodeKind) (incoming : Probe.Incoming) : Command (Control program tree) :=
  match state with
  | .guarded pc => match pc.val with
    | .answer true => .stay (.done false)
    | .answer false => .stay (.reading (.descending
        ⟨RootResetEdgeSpine.whole (RootResetDeletedBitRows.rows program tree), ProbeCompiler.Control.self_mem_nodes _⟩))
    | _ => mapCommand Control.guarded ((RootResetPatternFragment.machine (classifier program tree)).transition pc node incoming)
  | .reading pc => match pc with
    | .done answer => .stay (.done (readAnswer answer))
    | _ => mapCommand Control.reading ((RootResetDeletedBitRows.machine program tree).transition pc node incoming)
  | .done bit => .stay (.done bit)

def machine (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Machine (Control program tree) :=
  ⟨fun _ => cover program tree, covers program tree, transition program tree⟩

def initial (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) : Configuration (Control program tree) :=
  liftConfiguration Control.guarded (RootResetPatternFragment.initial (classifier program tree) origin)

def queryInitial (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) : Configuration (Control program tree) :=
  liftConfiguration Control.reading (RootResetDeletedBitRows.initial program tree origin)

theorem guarded_step (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (configuration : Configuration (PC (classifier program tree)))
    (running : RootResetCarrierNonemptyProbe.anyAnswer? configuration = false) :
    step (machine program tree) (liftConfiguration Control.guarded configuration) =
      liftConfiguration Control.guarded (step (RootResetPatternFragment.machine (classifier program tree)) configuration) := by
  apply RootResetCarrierNonemptyProbe.step_lift
  intro state current
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := current
  subst runtime
  rcases state with ⟨pc, member⟩
  cases pc with
  | answer bit => cases running
  | observeNode onS onApp => rfl
  | observeIncoming onRoot onLeft onRight => rfl
  | move operation next => rfl

theorem reading_step (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (configuration : Configuration (QueryControl program tree))
    (running : RootResetLabelledEdgeProbe.done? configuration = false) :
    step (machine program tree) (liftConfiguration Control.reading configuration) =
      liftConfiguration Control.reading (step (RootResetDeletedBitRows.machine program tree) configuration) := by
  apply RootResetCarrierNonemptyProbe.step_lift
  intro state current
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := current
  subst runtime
  cases state with
  | done answer => cases running
  | descending pc => rfl
  | reading pc => rfl
  | ascending answer pc => rfl

theorem guard_runs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) :
    ∃ used, used ≤ RootResetMixedLocalFragment.classifyBound .marked program tree ∧
      run (machine program tree) (used + 1) (initial program tree origin) =
        if RootResetCompletedLocalPatterns.accepts .marked program tree origin.focus then
          ⟨some (.done false), origin⟩ else queryInitial program tree origin := by
  obtain ⟨member, execution⟩ := RootResetMixedLocalFragment.classifier_runs .marked program tree origin
  obtain ⟨used, bounded, lifted⟩ := RootResetCarrierNonemptyProbe.run_to_boundary
    (RootResetPatternFragment.machine (classifier program tree)) (machine program tree) Control.guarded
    RootResetCarrierNonemptyProbe.anyAnswer? (RootResetMixedLocalFragment.classify_absorbs (classifier program tree))
    (guarded_step program tree) _ (RootResetPatternFragment.initial (classifier program tree) origin)
    (by rw [execution]; rfl)
  rw [execution] at lifted
  refine ⟨used, Nat.le_trans bounded (RootResetCompletedLocalFragment.familyTicks_bound _ _), ?_⟩
  rw [initial, run_add, lifted]
  have finish (bit : Bool) (member : ProbeCompiler.Control.answer bit ∈ ProbeCompiler.Control.nodes (classifier program tree)) :
      run (machine program tree) 1 (liftConfiguration Control.guarded ⟨some ⟨.answer bit, member⟩, origin⟩) =
        if bit then ⟨some (.done false), origin⟩ else queryInitial program tree origin := by
    cases bit <;> rfl
  exact finish _ member

theorem query_runs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin after : Cursor) (answer : Answer) (ticks : Nat)
    (execution : run (RootResetDeletedBitRows.machine program tree) ticks
      (RootResetDeletedBitRows.initial program tree origin) = ⟨some (.done answer), after⟩) :
    ∃ used, used ≤ ticks ∧ run (machine program tree) (used + 1) (queryInitial program tree origin) =
      ⟨some (.done (readAnswer answer)), after⟩ := by
  obtain ⟨used, bounded, lifted⟩ := RootResetCarrierNonemptyProbe.run_to_boundary
    (RootResetDeletedBitRows.machine program tree) (machine program tree) Control.reading
    RootResetLabelledEdgeProbe.done? (RootResetLabelledEdgeProbe.terminal_absorbs _ _)
    (reading_step program tree) ticks (RootResetDeletedBitRows.initial program tree origin) (by rw [execution]; rfl)
  rw [execution] at lifted
  refine ⟨used, bounded, ?_⟩
  rw [queryInitial, run_add, lifted]
  rfl

def budget (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) : Nat :=
  RootResetMixedLocalFragment.classifyBound .marked program tree + RootResetDeletedBitRows.budget program tree origin + 2

theorem all_input_budget (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (source : Term) (parents : List ParentFrame) :
    ∃ ticks bit, ticks ≤ budget program tree ⟨source, .right haltCode :: parents⟩ ∧
      run (machine program tree) ticks (initial program tree ⟨source, .right haltCode :: parents⟩) =
        ⟨some (.done bit), ⟨source, .right haltCode :: parents⟩⟩ := by
  let origin : Cursor := ⟨source, .right haltCode :: parents⟩
  obtain ⟨guardTicks, guardBound, guardRun⟩ := guard_runs program tree origin
  cases marked : RootResetCompletedLocalPatterns.accepts .marked program tree source with
  | true =>
      rw [show RootResetCompletedLocalPatterns.accepts .marked program tree origin.focus = true from marked] at guardRun
      refine ⟨guardTicks + 1, false, ?_, guardRun⟩
      exact Nat.le_trans (Nat.add_le_add_right guardBound 1)
        (Nat.le_trans (Nat.add_le_add_right (Nat.le_add_right _ _) 1) (Nat.le_succ _))
  | false =>
      rw [show RootResetCompletedLocalPatterns.accepts .marked program tree origin.focus = false from marked] at guardRun
      obtain ⟨queryTicks, descended, queryBound, execution, walks⟩ := RootResetDeletedBitRows.all_input program tree source parents
      obtain ⟨used, bounded, queryRun⟩ := query_runs program tree origin origin _ queryTicks execution
      refine ⟨guardTicks + 1 + (used + 1), readAnswer (RootResetLabelledPatternFragment.finished RootResetDeletedBitRows.labels descended.focus), ?_, ?_⟩
      · have total := Nat.add_le_add guardBound (Nat.le_trans bounded queryBound)
        simpa only [budget, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using Nat.add_le_add_right total 2
      · rw [run_add, guardRun]
        exact queryRun

theorem done_absorbs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (bit : Bool) (cursor : Cursor) (ticks : Nat) :
    run (machine program tree) ticks ⟨some (.done bit), cursor⟩ = ⟨some (.done bit), cursor⟩ := by
  induction ticks with
  | zero => rfl
  | succ ticks ih => exact ih

def done? {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    (configuration : Configuration (Control program tree)) : Bool :=
  match configuration.control with | some (.done _) => true | _ => false

theorem terminal_absorbs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (configuration : Configuration (Control program tree)) (ended : done? configuration = true) (ticks : Nat) :
    run (machine program tree) ticks configuration = configuration := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => cases ended
  | some state => cases state with
    | done bit => exact done_absorbs program tree bit cursor ticks
    | guarded pc => cases ended
    | reading pc => cases ended

def coefficient (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  RootResetMixedLocalFragment.classifyBound .marked program tree + 2 +
    RootResetLabelledEdgeProbe.coefficient (RootResetDeletedBitRows.rows program tree) RootResetDeletedBitRows.labels

theorem budget_erase (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) :
    budget program tree origin ≤ coefficient program tree * origin.erase.size := by
  have guardBound : RootResetMixedLocalFragment.classifyBound .marked program tree + 2 ≤
      (RootResetMixedLocalFragment.classifyBound .marked program tree + 2) * origin.erase.size := by
    simpa only [Nat.mul_one] using Nat.mul_le_mul_left
      (RootResetMixedLocalFragment.classifyBound .marked program tree + 2) (Term.size_pos origin.erase)
  have queryBound := RootResetLabelledEdgeProbe.budget_erase (RootResetDeletedBitRows.rows program tree) RootResetDeletedBitRows.labels origin
  simpa only [budget, coefficient, Nat.add_mul, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using Nat.add_le_add guardBound queryBound

theorem all_input (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (source : Term) (parents : List ParentFrame) :
    ∃ ticks bit, ticks ≤ coefficient program tree * (Cursor.mk source (.right haltCode :: parents)).erase.size ∧
      run (machine program tree) ticks (initial program tree ⟨source, .right haltCode :: parents⟩) =
        ⟨some (.done bit), ⟨source, .right haltCode :: parents⟩⟩ := by
  obtain ⟨ticks, bit, bounded, execution⟩ := all_input_budget program tree source parents
  exact ⟨ticks, bit, Nat.le_trans bounded (budget_erase program tree _), execution⟩

theorem mutationCount_zero (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (configuration : Configuration (Control program tree)) : mutationCount (machine program tree) configuration = 0 := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      rw [← RootResetCarrierNonemptyProbe.commandCount_eq_mutationCount]
      cases state with
      | done bit => rfl
      | guarded pc =>
          rcases pc with ⟨code, member⟩
          have safe : ProbeCompiler.Control.NoRdx (classifier program tree) :=
            RootResetCompletedLocalFragment.family_readOnly _ _ _ True.intro True.intro
          have zero := RootResetPatternFragment.mutationCount_zero _ safe ⟨some ⟨code, member⟩, cursor⟩
          rw [← RootResetCarrierNonemptyProbe.commandCount_eq_mutationCount] at zero
          cases code with
          | answer bit => cases bit <;> rfl
          | observeNode onS onApp =>
              simp only [machine, transition, RootResetCarrierNonemptyProbe.commandCount_map]
              exact zero
          | observeIncoming onRoot onLeft onRight =>
              simp only [machine, transition, RootResetCarrierNonemptyProbe.commandCount_map]
              exact zero
          | move operation next =>
              simp only [machine, transition, RootResetCarrierNonemptyProbe.commandCount_map]
              exact zero
      | reading pc =>
          have zero := RootResetLabelledEdgeProbe.mutationCount_zero (RootResetDeletedBitRows.rows program tree) RootResetDeletedBitRows.labels ⟨some pc, cursor⟩
          rw [← RootResetCarrierNonemptyProbe.commandCount_eq_mutationCount] at zero
          cases pc with
          | done answer => rfl
          | descending pc =>
              simp only [machine, transition, RootResetCarrierNonemptyProbe.commandCount_map]
              exact zero
          | reading pc =>
              simp only [machine, transition, RootResetCarrierNonemptyProbe.commandCount_map]
              exact zero
          | ascending answer pc =>
              simp only [machine, transition, RootResetCarrierNonemptyProbe.commandCount_map]
              exact zero

theorem runMutationCount_zero (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (ticks : Nat) (configuration : Configuration (Control program tree)) :
    runMutationCount (machine program tree) ticks configuration = 0 := by
  induction ticks generalizing configuration with
  | zero => rfl
  | succ ticks ih => rw [runMutationCount, mutationCount_zero, ih, Nat.zero_add]

theorem erase_run (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (ticks : Nat) (configuration : Configuration (Control program tree)) :
    (run (machine program tree) ticks configuration).cursor.erase = configuration.cursor.erase := by
  have projected := run_projects_stepsN (machine program tree) ticks configuration
  rw [runMutationCount_zero] at projected
  exact (StepsN.eq_of_zero projected).symm

theorem generated_path_runs {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits decoded : List Bool} {continuation source : Term}
    (admissible : Carrier.Admissible continuation)
    (path : CarrierDecoder.PathDecodes program tree bits continuation source decoded)
    (parents : List ParentFrame) :
    ∃ ticks, ticks ≤ coefficient program tree * (Cursor.mk source (.right haltCode :: parents)).erase.size ∧
      run (machine program tree) ticks (initial program tree ⟨source, .right haltCode :: parents⟩) =
        ⟨some (.done (RootResetResponseBitFiniteValue.value program tree source)), ⟨source, .right haltCode :: parents⟩⟩ := by
  let origin : Cursor := ⟨source, .right haltCode :: parents⟩
  obtain ⟨guardTicks, guardBound, guardRun⟩ := guard_runs program tree origin
  cases marked : RootResetCompletedLocalPatterns.accepts .marked program tree source with
  | true =>
      rw [show RootResetCompletedLocalPatterns.accepts .marked program tree origin.focus = true from marked] at guardRun
      refine ⟨guardTicks + 1, ?_, ?_⟩
      · apply Nat.le_trans _ (budget_erase program tree origin)
        exact Nat.le_trans (Nat.add_le_add_right guardBound 1)
          (Nat.le_trans (Nat.add_le_add_right (Nat.le_add_right _ _) 1) (Nat.le_succ _))
      · simpa only [RootResetResponseBitFiniteValue.value, marked, ↓reduceIte] using guardRun
  | false =>
      rw [show RootResetCompletedLocalPatterns.accepts .marked program tree origin.focus = false from marked] at guardRun
      obtain ⟨queryTicks, state, queryBound, execution, answer⟩ := RootResetDeletedBitAgreement.generated_path_runs admissible path parents
      obtain ⟨used, bounded, queryRun⟩ := query_runs program tree origin origin state queryTicks execution
      refine ⟨guardTicks + 1 + (used + 1), ?_, ?_⟩
      · apply Nat.le_trans _ (budget_erase program tree origin)
        have total := Nat.add_le_add guardBound (Nat.le_trans bounded queryBound)
        simpa only [budget, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using Nat.add_le_add_right total 2
      · rw [run_add, guardRun]
        simpa only [RootResetResponseBitFiniteValue.value, marked, Bool.false_eq_true,
          ↓reduceIte, readAnswer, answer, Option.getD_some] using queryRun

end PureSFormal.Research.RootResetFrontBitProbe
