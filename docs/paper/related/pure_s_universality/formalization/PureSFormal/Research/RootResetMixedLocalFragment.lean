import PureSFormal.Research.RootResetCarrierInverseUnique

/-!
# Finite mixed marked/fresh continuation admission and entry

One finite state cover combines the literal completed-Local classifiers,
the exact origin-restoring carrier probe, and the two RL entry moves.
Marked Local inputs enter directly; generated fresh Local inputs enter iff
the public fresh nonempty admission succeeds. Every input at a generated
entry boundary terminates within the displayed budget, either preserving
the exact origin or entering a parsed Local continuation. All execution is
read-only. The next module supplies cyclic continuation feedback.
-/

namespace PureSFormal.Research.RootResetMixedLocalFragment
open PureSFormal.PureS
open FiniteController
open RootResetPatternFragment
open RootResetCarrierNonemptyProbe

abbrev classifier (status : CheckpointDecoder.HaltStatus) (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) : Code :=
  RootResetCompletedLocalFragment.familyCode
    (RootResetCompletedLocalPatterns.localPatterns status program tree) (.answer true) (.answer false)

inductive Control (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) where
  | marked (pc : PC (classifier .marked program tree))
  | fresh (pc : PC (classifier .fresh program tree))
  | probing (pc : RootResetCarrierNonemptyProbe.Control program tree)
  | enterRight
  | enterLeft
  | done (entered : Bool)

def cover (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : List (Control program tree) :=
  [.enterRight, .enterLeft, .done false, .done true] ++
  (RootResetPatternFragment.machine (classifier .marked program tree)).states.map Control.marked ++
  (RootResetPatternFragment.machine (classifier .fresh program tree)).states.map Control.fresh ++
  (RootResetCarrierNonemptyProbe.machine program tree).states.map Control.probing

theorem covers (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (state : Control program tree) : state ∈ cover program tree := by
  simp only [cover, List.mem_append]
  cases state with
  | enterRight => exact Or.inl (Or.inl (Or.inl (List.Mem.head _)))
  | enterLeft => exact Or.inl (Or.inl (Or.inl (List.Mem.tail _ (List.Mem.head _))))
  | done entered =>
      apply Or.inl ∘ Or.inl ∘ Or.inl
      cases entered with
      | false => exact List.Mem.tail _ (List.Mem.tail _ (List.Mem.head _))
      | true => exact List.Mem.tail _ (List.Mem.tail _ (List.Mem.tail _ (List.Mem.head _)))
  | marked pc => exact Or.inl (Or.inl (Or.inr (RootResetCompletedLocalPatterns.map_member _
      ((RootResetPatternFragment.machine (classifier .marked program tree)).covers pc))))
  | fresh pc => exact Or.inl (Or.inr (RootResetCompletedLocalPatterns.map_member _
      ((RootResetPatternFragment.machine (classifier .fresh program tree)).covers pc)))
  | probing pc => exact Or.inr (RootResetCompletedLocalPatterns.map_member _
      ((RootResetCarrierNonemptyProbe.machine program tree).covers pc))

def transition (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (state : Control program tree) (node : Probe.NodeKind) (incoming : Probe.Incoming) : Command (Control program tree) :=
  match state with
  | .marked pc => match pc.val with
    | .answer true => .stay .enterRight
    | .answer false => .stay (.fresh ⟨classifier .fresh program tree, ProbeCompiler.Control.self_mem_nodes _⟩)
    | _ => mapCommand Control.marked ((RootResetPatternFragment.machine (classifier .marked program tree)).transition pc node incoming)
  | .fresh pc => match pc.val with
    | .answer true => .stay (.probing (.descending ⟨RootResetEdgeSpine.whole (edges program tree), ProbeCompiler.Control.self_mem_nodes _⟩))
    | .answer false => .stay (.done false)
    | _ => mapCommand Control.fresh ((RootResetPatternFragment.machine (classifier .fresh program tree)).transition pc node incoming)
  | .probing pc => match pc with
    | .done false => .stay (.done false)
    | .done true => .stay .enterRight
    | _ => mapCommand Control.probing ((RootResetCarrierNonemptyProbe.machine program tree).transition pc node incoming)
  | .enterRight => .exec .R .enterLeft
  | .enterLeft => .exec .L (.done true)
  | .done entered => .stay (.done entered)

def machine (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Machine (Control program tree) :=
  ⟨fun _ => cover program tree, covers program tree, transition program tree⟩

def initial (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) :
    Configuration (Control program tree) := liftConfiguration Control.marked
      (RootResetPatternFragment.initial (classifier .marked program tree) origin)

def freshInitial (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) :
    Configuration (Control program tree) := liftConfiguration Control.fresh
      (RootResetPatternFragment.initial (classifier .fresh program tree) origin)

def probeInitial (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) :
    Configuration (Control program tree) := liftConfiguration Control.probing (RootResetCarrierNonemptyProbe.initial program tree origin)

theorem classify_absorbs (whole : Code) (configuration : Configuration (PC whole))
    (ended : anyAnswer? configuration = true) (ticks : Nat) :
    run (RootResetPatternFragment.machine whole) ticks configuration = configuration := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => cases ended
  | some state =>
      rcases state with ⟨code, member⟩
      cases code with
      | answer result => exact RootResetPatternFragment.answer_absorbing whole result member cursor ticks
      | observeNode onS onApp => cases ended
      | observeIncoming onRoot onLeft onRight => cases ended
      | move operation next => cases ended

theorem marked_step (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (configuration : Configuration (PC (classifier .marked program tree)))
    (running : anyAnswer? configuration = false) :
    step (machine program tree) (liftConfiguration Control.marked configuration) =
      liftConfiguration Control.marked (step (RootResetPatternFragment.machine (classifier .marked program tree)) configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := current
  subst runtime
  rcases state with ⟨code, member⟩
  cases code with
  | answer result => cases running
  | observeNode onS onApp => rfl
  | observeIncoming onRoot onLeft onRight => rfl
  | move operation next => rfl

theorem fresh_step (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (configuration : Configuration (PC (classifier .fresh program tree)))
    (running : anyAnswer? configuration = false) :
    step (machine program tree) (liftConfiguration Control.fresh configuration) =
      liftConfiguration Control.fresh (step (RootResetPatternFragment.machine (classifier .fresh program tree)) configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := current
  subst runtime
  rcases state with ⟨code, member⟩
  cases code with
  | answer result => cases running
  | observeNode onS onApp => rfl
  | observeIncoming onRoot onLeft onRight => rfl
  | move operation next => rfl

def probeDone? {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    (configuration : Configuration (RootResetCarrierNonemptyProbe.Control program tree)) : Bool :=
  match configuration.control with
  | some (.done _) => true
  | _ => false

theorem probe_absorbs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (configuration : Configuration (RootResetCarrierNonemptyProbe.Control program tree))
    (ended : probeDone? configuration = true) (ticks : Nat) :
    run (RootResetCarrierNonemptyProbe.machine program tree) ticks configuration = configuration := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => cases ended
  | some state =>
      cases state with
      | done result => exact RootResetCarrierNonemptyProbe.done_absorbs program tree result cursor ticks
      | descending pc => cases ended
      | reading pc => cases ended
      | ascending result pc => cases ended

theorem probing_step (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (configuration : Configuration (RootResetCarrierNonemptyProbe.Control program tree))
    (running : probeDone? configuration = false) :
    step (machine program tree) (liftConfiguration Control.probing configuration) =
      liftConfiguration Control.probing (step (RootResetCarrierNonemptyProbe.machine program tree) configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := current
  subst runtime
  cases state with
  | done result => cases running
  | descending pc => rfl
  | reading pc => rfl
  | ascending result pc => rfl

def classifyTicks (status : CheckpointDecoder.HaltStatus) (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (source : Term) : Nat :=
  RootResetCompletedLocalFragment.familyTicks (RootResetCompletedLocalPatterns.localPatterns status program tree) source

def classifyBound (status : CheckpointDecoder.HaltStatus) (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  RootResetCompletedLocalFragment.familyBound (RootResetCompletedLocalPatterns.localPatterns status program tree)

theorem classifier_runs (status : CheckpointDecoder.HaltStatus) (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) :
    ∃ member : ProbeCompiler.Control.answer (RootResetCompletedLocalPatterns.accepts status program tree origin.focus) ∈
        (classifier status program tree).nodes,
      run (RootResetPatternFragment.machine (classifier status program tree)) (classifyTicks status program tree origin.focus)
        (RootResetPatternFragment.initial (classifier status program tree) origin) =
        ⟨some ⟨.answer (RootResetCompletedLocalPatterns.accepts status program tree origin.focus), member⟩, origin⟩ := by
  obtain ⟨member, execution⟩ := RootResetCompletedLocalFragment.family_runs
    (RootResetCompletedLocalPatterns.localPatterns status program tree) (.answer true) (.answer false)
    (classifier status program tree) origin (fun _ h => h)
  change (if RootResetCompletedLocalPatterns.accepts status program tree origin.focus = true then ProbeCompiler.Control.answer true else .answer false) ∈ (classifier status program tree).nodes at member
  change run (RootResetPatternFragment.machine (classifier status program tree)) (classifyTicks status program tree origin.focus)
    (RootResetPatternFragment.initial (classifier status program tree) origin) =
    ⟨some ⟨(if RootResetCompletedLocalPatterns.accepts status program tree origin.focus = true then ProbeCompiler.Control.answer true else .answer false), member⟩, origin⟩ at execution
  cases accepted : RootResetCompletedLocalPatterns.accepts status program tree origin.focus <;>
    simp only [accepted, Bool.false_eq_true, ↓reduceIte] at member execution ⊢ <;> exact ⟨member, execution⟩


theorem marked_runs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) :
    ∃ used, used ≤ classifyBound .marked program tree ∧
      run (machine program tree) (used + 1) (initial program tree origin) =
        if RootResetCompletedLocalPatterns.accepts .marked program tree origin.focus
        then ⟨some .enterRight, origin⟩ else freshInitial program tree origin := by
  obtain ⟨member, execution⟩ := classifier_runs .marked program tree origin
  obtain ⟨used, bounded, lifted⟩ := run_to_boundary
    (RootResetPatternFragment.machine (classifier .marked program tree)) (machine program tree) Control.marked
    anyAnswer? (classify_absorbs _) (marked_step program tree)
    (classifyTicks .marked program tree origin.focus) (RootResetPatternFragment.initial (classifier .marked program tree) origin)
    (by rw [execution]; rfl)
  rw [execution] at lifted
  refine ⟨used, Nat.le_trans bounded (RootResetCompletedLocalFragment.familyTicks_bound _ _), ?_⟩
  change run (machine program tree) (used + 1)
    (liftConfiguration Control.marked (RootResetPatternFragment.initial (classifier .marked program tree) origin)) = _
  rw [run_add, lifted]
  generalize acceptedEq : RootResetCompletedLocalPatterns.accepts .marked program tree origin.focus = accepted at *
  cases accepted <;> rfl

theorem fresh_runs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) :
    ∃ used, used ≤ classifyBound .fresh program tree ∧
      run (machine program tree) (used + 1) (freshInitial program tree origin) =
        if RootResetCompletedLocalPatterns.accepts .fresh program tree origin.focus
        then probeInitial program tree origin else ⟨some (.done false), origin⟩ := by
  obtain ⟨member, execution⟩ := classifier_runs .fresh program tree origin
  obtain ⟨used, bounded, lifted⟩ := run_to_boundary
    (RootResetPatternFragment.machine (classifier .fresh program tree)) (machine program tree) Control.fresh
    anyAnswer? (classify_absorbs _) (fresh_step program tree)
    (classifyTicks .fresh program tree origin.focus) (RootResetPatternFragment.initial (classifier .fresh program tree) origin)
    (by rw [execution]; rfl)
  rw [execution] at lifted
  refine ⟨used, Nat.le_trans bounded (RootResetCompletedLocalFragment.familyTicks_bound _ _), ?_⟩
  change run (machine program tree) (used + 1)
    (liftConfiguration Control.fresh (RootResetPatternFragment.initial (classifier .fresh program tree) origin)) = _
  rw [run_add, lifted]
  generalize acceptedEq : RootResetCompletedLocalPatterns.accepts .fresh program tree origin.focus = accepted at *
  cases accepted <;> rfl

theorem probing_runs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin : Cursor) (answer : Bool) (ticks : Nat)
    (execution : run (RootResetCarrierNonemptyProbe.machine program tree) ticks
      (RootResetCarrierNonemptyProbe.initial program tree origin) = ⟨some (.done answer), origin⟩) :
    ∃ used, used ≤ ticks ∧ run (machine program tree) (used + 1) (probeInitial program tree origin) =
      if answer then ⟨some .enterRight, origin⟩ else ⟨some (.done false), origin⟩ := by
  obtain ⟨used, bounded, lifted⟩ := run_to_boundary
    (RootResetCarrierNonemptyProbe.machine program tree) (machine program tree) Control.probing
    probeDone? (probe_absorbs program tree) (probing_step program tree)
    ticks (RootResetCarrierNonemptyProbe.initial program tree origin) (by rw [execution]; rfl)
  rw [execution] at lifted
  refine ⟨used, bounded, ?_⟩
  change run (machine program tree) (used + 1)
    (liftConfiguration Control.probing (RootResetCarrierNonemptyProbe.initial program tree origin)) = _
  rw [run_add, lifted]
  cases answer <;> rfl

theorem enter_runs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (left continuation audit : Term) (parents : List ParentFrame) :
    run (machine program tree) 2 ⟨some .enterRight, ⟨.app left (.app continuation audit), parents⟩⟩ =
      ⟨some (.done true), ⟨continuation, .left audit :: .right left :: parents⟩⟩ := rfl

def budget (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) : Nat :=
  classifyBound .marked program tree + classifyBound .fresh program tree +
    RootResetCarrierNonemptyProbe.budget program tree origin + 5

theorem full_bound (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor)
    (m f p : Nat) (mb : m ≤ classifyBound .marked program tree) (fb : f ≤ classifyBound .fresh program tree)
    (pb : p ≤ RootResetCarrierNonemptyProbe.budget program tree origin) :
    m + 1 + (f + 1) + (p + 1) + 2 ≤ budget program tree origin := by
  have total := Nat.add_le_add_right (Nat.add_le_add (Nat.add_le_add mb fb) pb) 5
  simpa only [budget, show 5 = 1 + 1 + 1 + 2 by rfl, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using total

theorem parsed_shape {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program tree source = some view) :
    ∃ left audit, source = .app left (.app view.continuation audit) := by
  obtain ⟨halt, dispatcher, seedAudit, continuationAudit, _, _, equal⟩ := CheckpointDecoder.parseLocal?_sound parsed
  exact ⟨_, continuationAudit, equal⟩

inductive Outcome (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) :
    Bool → Cursor → Prop where
  | stopped : Outcome program tree origin false origin
  | entered (view : CheckpointDecoder.LocalView program)
      (parsed : CheckpointDecoder.parseLocal? program tree origin.focus = some view)
      (left audit : Term) (shape : origin.focus = .app left (.app view.continuation audit)) :
      Outcome program tree origin true ⟨view.continuation, .left audit :: .right left :: origin.parents⟩

theorem all_input (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin : Cursor) (boundary : RootResetCarrierScanParentBoundary.carrierParent? origin.parents.head? = false) :
    ∃ ticks entered after, ticks ≤ budget program tree origin ∧
      run (machine program tree) ticks (initial program tree origin) = ⟨some (.done entered), after⟩ ∧
      Outcome program tree origin entered after := by
  obtain ⟨m, mb, mr⟩ := marked_runs program tree origin
  cases marked : RootResetCompletedLocalPatterns.accepts .marked program tree origin.focus with
  | true =>
      rw [marked] at mr
      obtain ⟨view, _, parsed⟩ := (RootResetCompletedLocalPatterns.accepts_iff_parse .marked program tree origin.focus).mp marked
      obtain ⟨left, audit, shape⟩ := parsed_shape parsed
      refine ⟨m + 1 + 2, true, _, ?_, ?_, .entered view parsed left audit shape⟩
      · exact Nat.le_trans (Nat.add_le_add_left (show 2 ≤ (0 + 1) + (0 + 1) + 2 by decide) (m + 1))
          (by simpa only [Nat.add_assoc] using full_bound program tree origin m 0 0 mb (Nat.zero_le _) (Nat.zero_le _))
      · rw [run_add, mr]
        rcases origin with ⟨source, parents⟩
        change source = _ at shape
        subst source
        exact enter_runs program tree left _ audit parents
  | false =>
      simp only [marked, Bool.false_eq_true, ↓reduceIte] at mr
      obtain ⟨f, fb, fr⟩ := fresh_runs program tree origin
      cases fresh : RootResetCompletedLocalPatterns.accepts .fresh program tree origin.focus with
      | false =>
          simp only [fresh, Bool.false_eq_true, ↓reduceIte] at fr
          refine ⟨m + 1 + (f + 1), false, origin, ?_, ?_, .stopped⟩
          · exact Nat.le_trans (Nat.le_add_right _ 3)
              (by simpa only [Nat.zero_add, Nat.add_assoc] using full_bound program tree origin m f 0 mb fb (Nat.zero_le _))
          · rw [run_add, mr]
            exact fr
      | true =>
          simp only [fresh, ↓reduceIte] at fr
          obtain ⟨view, _, parsed⟩ := (RootResetCompletedLocalPatterns.accepts_iff_parse .fresh program tree origin.focus).mp fresh
          obtain ⟨left, audit, shape⟩ := parsed_shape parsed
          obtain ⟨p, descended, pb, pr, down⟩ := RootResetCarrierInverseUnique.all_input_restores program tree origin boundary
          obtain ⟨used, ub, ur⟩ := probing_runs program tree origin _ p pr
          have bounded := full_bound program tree origin m f used mb fb (Nat.le_trans ub pb)
          have prefixRun : run (machine program tree) (m + 1 + (f + 1) + (used + 1)) (initial program tree origin) =
              if RootResetCarrierNonemptyAgreement.isLive? descended.focus
              then ⟨some .enterRight, origin⟩ else ⟨some (.done false), origin⟩ := by
            have firstTwo : run (machine program tree) (m + 1 + (f + 1)) (initial program tree origin) = probeInitial program tree origin := by
              rw [run_add, mr]
              exact fr
            rw [run_add, firstTwo]
            exact ur
          cases answer : RootResetCarrierNonemptyAgreement.isLive? descended.focus with
          | false =>
              simp only [answer, Bool.false_eq_true, ↓reduceIte] at prefixRun
              exact ⟨_, false, origin, Nat.le_trans (Nat.le_add_right _ 2) bounded, prefixRun, .stopped⟩
          | true =>
              simp only [answer, ↓reduceIte] at prefixRun
              refine ⟨_ + 2, true, _, bounded, ?_, .entered view parsed left audit shape⟩
              rw [run_add, prefixRun]
              rcases origin with ⟨source, parents⟩
              change source = _ at shape
              subst source
              exact enter_runs program tree left _ audit parents


theorem mutationCount_zero (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (configuration : Configuration (Control program tree)) : mutationCount (machine program tree) configuration = 0 := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      rw [← commandCount_eq_mutationCount]
      cases state with
      | done entered => rfl
      | enterRight => rfl
      | enterLeft => rfl
      | marked pc =>
          rcases pc with ⟨code, member⟩
          have safe : (classifier .marked program tree).NoRdx :=
            RootResetCompletedLocalFragment.family_readOnly _ _ _ True.intro True.intro
          have zero := RootResetPatternFragment.mutationCount_zero _ safe ⟨some ⟨code, member⟩, cursor⟩
          cases code <;> try { rename_i result; cases result <;> rfl }
          all_goals
            simp only [machine, transition, commandCount_map]
            rw [commandCount_eq_mutationCount]
            exact zero
      | fresh pc =>
          rcases pc with ⟨code, member⟩
          have safe : (classifier .fresh program tree).NoRdx :=
            RootResetCompletedLocalFragment.family_readOnly _ _ _ True.intro True.intro
          have zero := RootResetPatternFragment.mutationCount_zero _ safe ⟨some ⟨code, member⟩, cursor⟩
          cases code <;> try { rename_i result; cases result <;> rfl }
          all_goals
            simp only [machine, transition, commandCount_map]
            rw [commandCount_eq_mutationCount]
            exact zero
      | probing pc =>
          have zero := RootResetCarrierNonemptyProbe.mutationCount_zero program tree ⟨some pc, cursor⟩
          cases pc <;> try { rename_i result; cases result <;> rfl }
          all_goals
            simp only [machine, transition, commandCount_map]
            rw [commandCount_eq_mutationCount]
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

theorem done_absorbs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (entered : Bool) (origin : Cursor) (ticks : Nat) :
    run (machine program tree) ticks ⟨some (.done entered), origin⟩ = ⟨some (.done entered), origin⟩ := by
  induction ticks with
  | zero => rfl
  | succ ticks ih => exact ih

theorem marked_misses_fresh {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program tree source = some view) (fresh : view.status = .fresh) :
    RootResetCompletedLocalPatterns.accepts .marked program tree source = false := by
  cases marked : RootResetCompletedLocalPatterns.accepts .marked program tree source with
  | false => rfl
  | true =>
      obtain ⟨other, status, otherParsed⟩ := (RootResetCompletedLocalPatterns.accepts_iff_parse .marked program tree source).mp marked
      have equal : other = view := Option.some.inj (otherParsed.symm.trans parsed)
      subst other
      rw [fresh] at status
      cases status

theorem generated_fresh_runs
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits decoded : List Bool} {continuation source : Term}
    {view : CheckpointDecoder.LocalView program}
    (admissible : Carrier.Admissible continuation)
    (parsed : CheckpointDecoder.parseLocal? program tree source = some view)
    (fresh : view.status = .fresh)
    (path : CarrierDecoder.PathDecodes program tree bits continuation view.accumulator decoded)
    (origin : Cursor) (atSource : origin.focus = source)
    (boundary : RootResetCarrierScanParentBoundary.carrierParent? origin.parents.head? = false) :
    ∃ ticks left audit, ticks ≤ budget program tree origin ∧
      source = .app left (.app view.continuation audit) ∧
      run (machine program tree) ticks (initial program tree origin) =
        if (RootResetPersistentRouteA.parseFreshNonempty? program tree source).isSome
        then ⟨some (.done true), ⟨view.continuation, .left audit :: .right left :: origin.parents⟩⟩
        else ⟨some (.done false), origin⟩ := by
  obtain ⟨left, audit, shape⟩ := parsed_shape parsed
  obtain ⟨m, mb, mr⟩ := marked_runs program tree origin
  have markNo : RootResetCompletedLocalPatterns.accepts .marked program tree origin.focus = false :=
    atSource ▸ marked_misses_fresh parsed fresh
  simp only [markNo, Bool.false_eq_true, ↓reduceIte] at mr
  obtain ⟨f, fb, fr⟩ := fresh_runs program tree origin
  have freshYes : RootResetCompletedLocalPatterns.accepts .fresh program tree origin.focus = true := by
    rw [atSource]
    exact (RootResetCompletedLocalPatterns.accepts_iff_parse .fresh program tree source).mpr ⟨view, fresh, parsed⟩
  simp only [freshYes, ↓reduceIte] at fr
  obtain ⟨p, pb, pr⟩ := RootResetCarrierInverseUnique.fresh_admission_restores admissible parsed fresh path origin atSource boundary
  obtain ⟨used, ub, ur⟩ := probing_runs program tree origin _ p pr
  have bounded := full_bound program tree origin m f used mb fb (Nat.le_trans ub pb)
  have firstTwo : run (machine program tree) (m + 1 + (f + 1)) (initial program tree origin) = probeInitial program tree origin := by
    rw [run_add, mr]
    exact fr
  have prefixRun : run (machine program tree) (m + 1 + (f + 1) + (used + 1)) (initial program tree origin) =
      if (RootResetPersistentRouteA.parseFreshNonempty? program tree source).isSome
      then ⟨some .enterRight, origin⟩ else ⟨some (.done false), origin⟩ := by
    rw [run_add, firstTwo]
    exact ur
  cases answer : (RootResetPersistentRouteA.parseFreshNonempty? program tree source).isSome with
  | false =>
      simp only [answer, Bool.false_eq_true, ↓reduceIte] at prefixRun
      refine ⟨_, left, audit, Nat.le_trans (Nat.le_add_right _ 2) bounded, shape, ?_⟩
      simpa only [answer, Bool.false_eq_true, ↓reduceIte] using prefixRun
  | true =>
      simp only [answer, ↓reduceIte] at prefixRun
      refine ⟨_ + 2, left, audit, bounded, shape, ?_⟩
      simp only [answer, ↓reduceIte]
      rw [run_add, prefixRun]
      rcases origin with ⟨source', parents⟩
      change source' = source at atSource
      subst source'
      rw [shape]
      exact enter_runs program tree left _ audit parents

end PureSFormal.Research.RootResetMixedLocalFragment

