import PureSFormal.Research.RootResetCompleteCarrierRows

/-! A finite complete-carrier descent followed by oldest-live inverse selection. -/
namespace PureSFormal.Research.RootResetCarrierOldestLiveProbe
open PureSFormal.PureS
open FiniteController RootResetPatternFragment RootResetCarrierNonemptyProbe
open RootResetCarrierEdgePatterns

abbrev rows := RootResetCompleteCarrierRows.rows
abbrev upCode (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) := RootResetInverseEdgeSpine.familyCode (rows program tree)
abbrev upBase (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) := RootResetPatternFragment.machine (upCode program tree)
abbrev isLive := RootResetCarrierNonemptyAgreement.isLive?

inductive Control (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) where
  | descending (pc : RootResetEdgeSpine.Control (rows program tree))
  | ascending (pc : PC (upCode program tree))
  | reading (pc : PC liveCode)
  | done (ready : Bool)

def cover (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : List (Control program tree) :=
  [.done false, .done true] ++ (RootResetEdgeSpine.machine (rows program tree)).states.map .descending ++
    (upBase program tree).states.map .ascending ++ (RootResetPatternFragment.machine liveCode).states.map .reading

theorem covers (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (state : Control program tree) : state ∈ cover program tree := by
  simp only [cover, List.mem_append]
  cases state with
  | done ready =>
      apply Or.inl; apply Or.inl; apply Or.inl
      cases ready <;> simp only [List.mem_cons, List.mem_singleton, or_true, true_or]
  | descending pc => exact Or.inl (Or.inl (Or.inr (RootResetCompletedLocalPatterns.map_member _ ((RootResetEdgeSpine.machine (rows program tree)).covers pc))))
  | ascending pc => exact Or.inl (Or.inr (RootResetCompletedLocalPatterns.map_member _ ((upBase program tree).covers pc)))
  | reading pc => exact Or.inr (RootResetCompletedLocalPatterns.map_member _ ((RootResetPatternFragment.machine liveCode).covers pc))

def transition (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (state : Control program tree) (node : Probe.NodeKind) (incoming : Probe.Incoming) : Command (Control program tree) :=
  match state with
  | .descending pc => match pc.val with
    | .answer false => .stay (.ascending ⟨upCode program tree, ProbeCompiler.Control.self_mem_nodes _⟩)
    | _ => mapCommand .descending ((RootResetEdgeSpine.machine (rows program tree)).transition pc node incoming)
  | .ascending pc => match pc.val with
    | .answer false => .stay (.done false)
    | .answer true => .stay (.reading ⟨liveCode, ProbeCompiler.Control.self_mem_nodes _⟩)
    | _ => mapCommand .ascending ((upBase program tree).transition pc node incoming)
  | .reading pc => match pc.val with
    | .answer true => .stay (.done true)
    | .answer false => .stay (.ascending ⟨upCode program tree, ProbeCompiler.Control.self_mem_nodes _⟩)
    | _ => mapCommand .reading ((RootResetPatternFragment.machine liveCode).transition pc node incoming)
  | .done ready => .stay (.done ready)

def machine (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Machine (Control program tree) :=
  ⟨fun _ => cover program tree, covers program tree, transition program tree⟩
def initial (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) : Configuration (Control program tree) :=
  liftConfiguration .descending (RootResetEdgeSpine.initial (rows program tree) origin)
def ascending (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) : Configuration (Control program tree) :=
  liftConfiguration .ascending (RootResetPatternFragment.initial (upCode program tree) origin)
def reading (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) : Configuration (Control program tree) :=
  liftConfiguration .reading (RootResetPatternFragment.initial liveCode origin)

theorem inverse_family_runs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) :
    ∃ member : ProbeCompiler.Control.answer (RootResetInverseEdgeSpine.familyResult (rows program tree) origin).isSome ∈ (upCode program tree).nodes,
      run (upBase program tree) (RootResetInverseEdgeSpine.familyTicks (rows program tree) origin + 1)
        (RootResetPatternFragment.initial (upCode program tree) origin) =
        ⟨some ⟨.answer (RootResetInverseEdgeSpine.familyResult (rows program tree) origin).isSome, member⟩,
          (RootResetInverseEdgeSpine.familyResult (rows program tree) origin).getD origin⟩ := by
  obtain ⟨member, execution⟩ := RootResetInverseEdgeSpine.family_runs (rows program tree) (upCode program tree) origin (fun _ h => h)
  change run (upBase program tree) (RootResetInverseEdgeSpine.familyTicks (rows program tree) origin)
    (RootResetPatternFragment.initial (upCode program tree) origin) = _ at execution
  cases found : RootResetInverseEdgeSpine.familyResult (rows program tree) origin with
  | none =>
      simp only [RootResetInverseEdgeSpine.selected, found, Option.isSome_none, Bool.false_eq_true, ↓reduceIte, Option.getD_none] at member execution ⊢
      refine ⟨member, ?_⟩
      rw [run_add, execution]
      rfl
  | some ancestor =>
      simp only [RootResetInverseEdgeSpine.selected, found, Option.isSome_some, ↓reduceIte, Option.getD_some] at member execution ⊢
      have answerMember : ProbeCompiler.Control.answer true ∈ (upCode program tree).nodes := nodes_trans member
        (List.Mem.tail _ (List.mem_append.mpr (Or.inl (List.Mem.head _))))
      refine ⟨answerMember, ?_⟩
      rw [run_add, execution]
      rcases ancestor with ⟨focus, parents⟩
      cases focus <;> rfl

theorem descending_step (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (configuration : Configuration (RootResetEdgeSpine.Control (rows program tree))) (running : falseAnswer? configuration = false) :
    step (machine program tree) (liftConfiguration Control.descending configuration) =
      liftConfiguration Control.descending (step (RootResetEdgeSpine.machine (rows program tree)) configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := current
  subst runtime
  rcases state with ⟨code, member⟩
  cases code with
  | answer bit => cases bit with | false => cases running | true => rfl
  | observeNode _ _ | observeIncoming _ _ _ | move _ _ => rfl

theorem ascending_step (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (configuration : Configuration (PC (upCode program tree))) (running : anyAnswer? configuration = false) :
    step (machine program tree) (liftConfiguration Control.ascending configuration) =
      liftConfiguration Control.ascending (step (upBase program tree) configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := current
  subst runtime
  rcases state with ⟨code, member⟩
  cases code with
  | answer _ => cases running
  | observeNode _ _ | observeIncoming _ _ _ | move _ _ => rfl

theorem reading_step (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (configuration : Configuration (PC liveCode)) (running : anyAnswer? configuration = false) :
    step (machine program tree) (liftConfiguration Control.reading configuration) =
      liftConfiguration Control.reading (step (RootResetPatternFragment.machine liveCode) configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := current
  subst runtime
  rcases state with ⟨code, member⟩
  cases code with
  | answer _ => cases running
  | observeNode _ _ | observeIncoming _ _ _ | move _ _ => rfl

theorem descending_runs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin endpoint : Cursor) (ticks : Nat)
    (member : ProbeCompiler.Control.answer false ∈ (RootResetEdgeSpine.whole (rows program tree)).nodes)
    (execution : run (RootResetEdgeSpine.machine (rows program tree)) ticks (RootResetEdgeSpine.initial (rows program tree) origin) =
      ⟨some ⟨.answer false, member⟩, endpoint⟩) :
    ∃ used, used ≤ ticks ∧ run (machine program tree) (used + 1) (initial program tree origin) = ascending program tree endpoint := by
  obtain ⟨used, bounded, lifted⟩ := run_to_boundary (RootResetEdgeSpine.machine (rows program tree)) (machine program tree) Control.descending
    falseAnswer? (false_terminal_absorbs _ _ (fun member cursor ticks => RootResetEdgeSpine.false_absorbs _ ticks member cursor))
    (descending_step program tree) ticks (RootResetEdgeSpine.initial (rows program tree) origin) (by rw [execution]; rfl)
  rw [execution] at lifted
  refine ⟨used, bounded, ?_⟩
  change run (machine program tree) (used + 1) (liftConfiguration Control.descending (RootResetEdgeSpine.initial (rows program tree) origin)) = _
  rw [run_add, lifted]
  rfl

theorem ascending_runs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) :
    ∃ used, used ≤ RootResetInverseEdgeSpine.familyBound (rows program tree) + 1 ∧
      run (machine program tree) (used + 1) (ascending program tree origin) =
        match RootResetInverseEdgeSpine.familyResult (rows program tree) origin with
        | none => ⟨some (.done false), origin⟩
        | some ancestor => reading program tree ancestor := by
  obtain ⟨member, execution⟩ := inverse_family_runs program tree origin
  obtain ⟨used, bounded, lifted⟩ := run_to_boundary (upBase program tree) (machine program tree) Control.ascending
    anyAnswer? (RootResetMixedLocalFragment.classify_absorbs _) (ascending_step program tree) _
    (RootResetPatternFragment.initial (upCode program tree) origin) (by rw [execution]; rfl)
  rw [execution] at lifted
  refine ⟨used, Nat.le_trans bounded (Nat.add_le_add_right (RootResetInverseEdgeSpine.familyTicks_bound _ _) 1), ?_⟩
  change run (machine program tree) (used + 1) (liftConfiguration Control.ascending (RootResetPatternFragment.initial (upCode program tree) origin)) = _
  rw [run_add, lifted]
  generalize foundEq : RootResetInverseEdgeSpine.familyResult (rows program tree) origin = found at *
  cases found <;> rfl

theorem reading_runs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) :
    ∃ used, used ≤ liveBound ∧ run (machine program tree) (used + 1) (reading program tree origin) =
      if isLive origin.focus then ⟨some (.done true), origin⟩ else ascending program tree origin := by
  obtain ⟨member, execution⟩ := live_runs origin
  obtain ⟨used, bounded, lifted⟩ := run_to_boundary (RootResetPatternFragment.machine liveCode) (machine program tree) Control.reading
    anyAnswer? (RootResetMixedLocalFragment.classify_absorbs _) (reading_step program tree) _
    (RootResetPatternFragment.initial liveCode origin) (by rw [execution]; rfl)
  rw [execution] at lifted
  refine ⟨used, Nat.le_trans bounded (RootResetCompletedLocalFragment.familyTicks_bound _ _), ?_⟩
  change run (machine program tree) (used + 1) (liftConfiguration Control.reading (RootResetPatternFragment.initial liveCode origin)) = _
  rw [run_add, lifted]
  dsimp (config := { instances := true }) only [isLive]
  generalize liveEq : RootResetCarrierNonemptyAgreement.isLive? origin.focus = live at *
  cases live <;> rfl

def pickCurrent (origin : Cursor) : Option Cursor → Option Cursor
  | some endpoint => some endpoint
  | none => if isLive origin.focus then some origin else none

def returned (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin : Cursor) : Option Cursor → Configuration (Control program tree)
  | none => ascending program tree origin
  | some endpoint => ⟨some (.done true), endpoint⟩

inductive Picked (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Cursor → Option Cursor → Prop where
  | done (origin : Cursor) (missed : RootResetEdgeFragment.select (rows program tree) origin.focus = none) :
      Picked program tree origin none
  | next (origin after : Cursor) (row : EdgeRow)
      (selected : RootResetEdgeFragment.select (rows program tree) origin.focus = some row)
      (followed : RootResetEdgeFragment.follow row.address origin = some after)
      {result : Option Cursor} (rest : Picked program tree after result) :
      Picked program tree origin (pickCurrent origin result)

def upCost (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  RootResetInverseEdgeSpine.familyBound (rows program tree) + liveBound + 3

theorem unwind {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {origin endpoint : Cursor} (walk : RootResetEdgeSpine.Walks (rows program tree) origin endpoint) :
    ∃ ticks result, ticks + upCost program tree * endpoint.focus.size ≤ upCost program tree * origin.focus.size ∧
      run (machine program tree) ticks (ascending program tree endpoint) = returned program tree origin result ∧
      Picked program tree origin result := by
  induction walk with
  | done origin missed => exact ⟨0, none, by rw [Nat.zero_add]; exact Nat.le_refl _, rfl, .done origin missed⟩
  | @next origin after row selected followed finish rest ih =>
      obtain ⟨member, matched⟩ := RootResetEdgeFragment.select_sound _ origin.focus row selected
      have smaller := RootResetEdgeFragment.follow_size_lt row.address origin after
        (RootResetCompleteCarrierRows.valid program tree row member).1 followed
      obtain ⟨restTicks, result, restBound, restRun, restPick⟩ := ih
      cases result with
      | some chosen =>
          refine ⟨restTicks, some chosen, Nat.le_trans restBound (Nat.mul_le_mul_left _ (Nat.le_of_lt smaller)), restRun, ?_⟩
          exact .next origin after row selected followed restPick
      | none =>
          have found := RootResetCompleteCarrierRows.inverts program tree row member origin after matched followed
          obtain ⟨upUsed, upBound, upRun⟩ := ascending_runs program tree after
          rw [found] at upRun
          obtain ⟨readUsed, readBound, readRun⟩ := reading_runs program tree origin
          have edgeBound : upUsed + 1 + (readUsed + 1) ≤ upCost program tree := by
            have total := Nat.add_le_add_right (Nat.add_le_add upBound readBound) 2
            have numeric (n : Nat) : 1 + (2 + n) = 3 + n := by rw [← Nat.add_assoc]
            simpa only [upCost, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm, numeric] using total
          refine ⟨restTicks + (upUsed + 1 + (readUsed + 1)), pickCurrent origin none, ?_, ?_,
            .next origin after row selected followed restPick⟩
          · calc
              _ = (restTicks + upCost program tree * finish.focus.size) + (upUsed + 1 + (readUsed + 1)) := by
                simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
              _ ≤ upCost program tree * after.focus.size + upCost program tree := Nat.add_le_add restBound edgeBound
              _ = upCost program tree * (after.focus.size + 1) := by rw [Nat.mul_succ]
              _ ≤ upCost program tree * origin.focus.size := Nat.mul_le_mul_left _ smaller
          · have edgeRun : run (machine program tree) (upUsed + 1 + (readUsed + 1)) (ascending program tree after) =
                returned program tree origin (pickCurrent origin none) := by
              rw [run_add, upRun, readRun]
              cases live : isLive origin.focus <;> simp only [pickCurrent, live, Bool.false_eq_true, ↓reduceIte, returned]
            rw [run_add, restRun]
            exact edgeRun

theorem picked_live {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {origin : Cursor} {result : Option Cursor} (picked : Picked program tree origin result) :
    ∀ endpoint, result = some endpoint → isLive endpoint.focus = true := by
  induction picked with
  | done origin missed => intro endpoint equal; cases equal
  | @next origin after row selected followed result rest ih =>
      intro endpoint equal
      cases result with
      | some chosen => exact ih endpoint equal
      | none =>
          cases live : isLive origin.focus with
          | false => simp only [pickCurrent, live, Bool.false_eq_true, ↓reduceIte] at equal; cases equal
          | true =>
              have same : origin = endpoint := Option.some.inj (by simpa only [pickCurrent, live, ↓reduceIte] using equal)
              exact same ▸ live

theorem live_redex (origin : Cursor) (live : isLive origin.focus = true) : origin.rdx?.isSome = true := by
  have byBit (bit : Bool) (matched : (RootResetCarrierNonemptyAgreement.livePattern bit).matchesBool origin.focus = true) :
      origin.rdx?.isSome = true := by
    obtain ⟨predecessor, shape⟩ := RootResetCellSpineRows.live_sound bit origin.focus matched
    rcases origin with ⟨focus, parents⟩
    change focus = _ at shape
    subst focus
    rfl
  cases zero : (RootResetCarrierNonemptyAgreement.livePattern false).matchesBool origin.focus with
  | true => exact byBit false zero
  | false => exact byBit true (by simpa only [isLive, RootResetCarrierNonemptyAgreement.isLive?, zero, Bool.false_or] using live)

def coefficient (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  RootResetEdgeSpine.coefficient (rows program tree) + upCost program tree + upCost program tree + 1

def final (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin : Cursor) : Option Cursor → Configuration (Control program tree)
  | none => ⟨some (.done false), origin⟩
  | some endpoint => ⟨some (.done true), endpoint⟩

theorem selects (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin : Cursor) (boundary : RootResetCompleteCarrierRows.Boundary origin) :
    ∃ ticks result, ticks ≤ coefficient program tree * origin.focus.size ∧
      run (machine program tree) ticks (initial program tree origin) = final program tree origin result ∧
      Picked program tree origin result := by
  obtain ⟨downTicks, endpoint, member, downBound, downRun, walk⟩ :=
    RootResetEdgeSpine.scan_within (rows program tree) (RootResetCompleteCarrierRows.valid program tree) origin
  obtain ⟨downUsed, downUsedBound, downActual⟩ := descending_runs program tree origin endpoint downTicks member downRun
  obtain ⟨upTicks, result, upBound, upRun, picked⟩ := unwind walk
  have unwindBound : upTicks ≤ upCost program tree * origin.focus.size := Nat.le_trans (Nat.le_add_right _ _) upBound
  have cost (suffix : Nat) (suffixBound : suffix ≤ upCost program tree) :
      downUsed + 1 + upTicks + suffix ≤ coefficient program tree * origin.focus.size := by
    have constant (value : Nat) : value ≤ value * origin.focus.size := by
      simpa only [Nat.mul_one] using Nat.mul_le_mul_left value (Term.size_pos origin.focus)
    have total := Nat.add_le_add (Nat.add_le_add (Nat.add_le_add (Nat.le_trans downUsedBound downBound)
      (Term.size_pos origin.focus)) unwindBound) (Nat.le_trans suffixBound (constant _))
    simpa only [coefficient, Nat.add_mul, Nat.one_mul, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using total
  have prefixRun : run (machine program tree) (downUsed + 1 + upTicks) (initial program tree origin) = returned program tree origin result := by
    rw [run_add, downActual]
    exact upRun
  cases result with
  | some chosen =>
      exact ⟨downUsed + 1 + upTicks, some chosen, by simpa only [Nat.add_zero] using cost 0 (Nat.zero_le _), prefixRun, picked⟩
  | none =>
      obtain ⟨used, bounded, actual⟩ := ascending_runs program tree origin
      rw [RootResetCompleteCarrierRows.boundary_misses program tree origin boundary] at actual
      have endBound : used + 1 ≤ upCost program tree := by
        apply Nat.le_trans (Nat.add_le_add_right bounded 1)
        change RootResetInverseEdgeSpine.familyBound (rows program tree) + 1 + 1 ≤
          RootResetInverseEdgeSpine.familyBound (rows program tree) + liveBound + 3
        exact Nat.le_trans (by simpa only [Nat.add_assoc] using Nat.add_le_add_left (Nat.le_add_left 2 liveBound) _)
          (Nat.le_succ _)
      refine ⟨downUsed + 1 + upTicks + (used + 1), none, cost _ endBound, ?_, picked⟩
      rw [run_add, prefixRun]
      exact actual

theorem all_input (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin : Cursor) (boundary : RootResetCompleteCarrierRows.Boundary origin) :
    ∃ ticks ready endpoint, ticks ≤ coefficient program tree * origin.focus.size ∧
      run (machine program tree) ticks (initial program tree origin) = ⟨some (.done ready), endpoint⟩ ∧
      (if ready then endpoint.rdx?.isSome = true else endpoint = origin) := by
  obtain ⟨ticks, result, bounded, execution, picked⟩ := selects program tree origin boundary
  cases result with
  | none => exact ⟨ticks, false, origin, bounded, execution, rfl⟩
  | some endpoint => exact ⟨ticks, true, endpoint, bounded, execution, live_redex endpoint (picked_live picked endpoint rfl)⟩

theorem mutationCount_zero (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (configuration : Configuration (Control program tree)) : mutationCount (machine program tree) configuration = 0 := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      rw [← commandCount_eq_mutationCount]
      cases state with
      | done _ => rfl
      | descending pc =>
          rcases pc with ⟨code, member⟩
          have zero := RootResetEdgeSpine.mutationCount_zero (rows program tree) ⟨some ⟨code, member⟩, cursor⟩
          cases code <;> try { rename_i result; cases result <;> rfl }
          all_goals
            simp only [machine, transition, commandCount_map]
            rw [commandCount_eq_mutationCount]
            exact zero
      | ascending pc =>
          rcases pc with ⟨code, member⟩
          have zero := RootResetPatternFragment.mutationCount_zero (upCode program tree)
            (RootResetInverseEdgeSpine.family_readOnly _) ⟨some ⟨code, member⟩, cursor⟩
          cases code <;> try { rename_i result; cases result <;> rfl }
          all_goals
            simp only [machine, transition, commandCount_map]
            rw [commandCount_eq_mutationCount]
            exact zero
      | reading pc =>
          rcases pc with ⟨code, member⟩
          have safe : liveCode.NoRdx := RootResetCompletedLocalFragment.family_readOnly livePatterns (.answer true) (.answer false) True.intro True.intro
          have zero := RootResetPatternFragment.mutationCount_zero liveCode safe ⟨some ⟨code, member⟩, cursor⟩
          cases code <;> try { rename_i result; cases result <;> rfl }
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
    (ready : Bool) (origin : Cursor) (ticks : Nat) :
    run (machine program tree) ticks ⟨some (.done ready), origin⟩ = ⟨some (.done ready), origin⟩ := by
  induction ticks with
  | zero => rfl
  | succ ticks ih => exact ih

end PureSFormal.Research.RootResetCarrierOldestLiveProbe
