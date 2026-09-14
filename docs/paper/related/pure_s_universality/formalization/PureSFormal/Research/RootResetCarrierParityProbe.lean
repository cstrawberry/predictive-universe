import PureSFormal.Research.RootResetCarrierOldestLiveProbe

/-! One finite parity bit over a restored complete carrier path. -/
namespace PureSFormal.Research.RootResetCarrierParityProbe
open PureSFormal.PureS
open FiniteController RootResetPatternFragment RootResetCarrierNonemptyProbe
open RootResetCarrierEdgePatterns

abbrev edges := RootResetCompleteCarrierRows.rows
def patterns (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : List Pattern :=
  (RootResetCarrierEdgePatterns.localRows .fresh program tree ++
    RootResetCarrierEdgePatterns.localRows .marked program tree ++
    [RootResetCarrierNonemptyRows.tombstoneRow false, RootResetCarrierNonemptyRows.tombstoneRow true]).map EdgeRow.pattern
def tag (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (source : Term) : Bool :=
  (patterns program tree).any (fun pattern => pattern.matchesBool source)
abbrev readCode (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :=
  RootResetCompletedLocalFragment.familyCode (patterns program tree) (.answer true) (.answer false)
abbrev upCode := RootResetCarrierOldestLiveProbe.upCode
abbrev upBase := RootResetCarrierOldestLiveProbe.upBase

inductive Control (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) where
  | descending (bit : Bool) (pc : RootResetEdgeSpine.Control (edges program tree))
  | ascending (bit : Bool) (pc : PC (upCode program tree))
  | reading (bit : Bool) (pc : PC (readCode program tree))
  | done (bit : Bool)

def both {α β : Type} (states : List α) (inject : Bool → α → β) : List β :=
  states.map (inject false) ++ states.map (inject true)
theorem both_mem {α β : Type} (states : List α) (inject : Bool → α → β) (bit : Bool) (state : α)
    (member : state ∈ states) : inject bit state ∈ both states inject := by
  apply List.mem_append.mpr
  cases bit with
  | false => exact Or.inl (RootResetCompletedLocalPatterns.map_member _ member)
  | true => exact Or.inr (RootResetCompletedLocalPatterns.map_member _ member)

def cover (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : List (Control program tree) :=
  [.done false, .done true] ++ both (RootResetEdgeSpine.machine (edges program tree)).states .descending ++
    both (upBase program tree).states .ascending ++ both (RootResetPatternFragment.machine (readCode program tree)).states .reading
theorem covers (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (state : Control program tree) : state ∈ cover program tree := by
  simp only [cover, List.mem_append]
  cases state with
  | done bit =>
      apply Or.inl; apply Or.inl; apply Or.inl
      cases bit <;> simp only [List.mem_cons, List.mem_singleton, or_true, true_or]
  | descending bit pc => exact Or.inl (Or.inl (Or.inr (both_mem _ _ bit pc ((RootResetEdgeSpine.machine (edges program tree)).covers pc))))
  | ascending bit pc => exact Or.inl (Or.inr (both_mem _ _ bit pc ((upBase program tree).covers pc)))
  | reading bit pc => exact Or.inr (both_mem _ _ bit pc ((RootResetPatternFragment.machine (readCode program tree)).covers pc))

def transition (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (state : Control program tree) (node : Probe.NodeKind) (incoming : Probe.Incoming) : Command (Control program tree) :=
  match state with
  | .descending bit pc => match pc.val with
    | .answer false => .stay (.ascending bit ⟨upCode program tree, ProbeCompiler.Control.self_mem_nodes _⟩)
    | _ => mapCommand (.descending bit) ((RootResetEdgeSpine.machine (edges program tree)).transition pc node incoming)
  | .ascending bit pc => match pc.val with
    | .answer false => .stay (.done bit)
    | .answer true => .stay (.reading bit ⟨readCode program tree, ProbeCompiler.Control.self_mem_nodes _⟩)
    | _ => mapCommand (.ascending bit) ((upBase program tree).transition pc node incoming)
  | .reading bit pc => match pc.val with
    | .answer toggled => .stay (.ascending (Bool.xor bit toggled) ⟨upCode program tree, ProbeCompiler.Control.self_mem_nodes _⟩)
    | _ => mapCommand (.reading bit) ((RootResetPatternFragment.machine (readCode program tree)).transition pc node incoming)
  | .done bit => .stay (.done bit)

def machine (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Machine (Control program tree) :=
  ⟨fun _ => cover program tree, covers program tree, transition program tree⟩
def initial (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (bit : Bool) (origin : Cursor) : Configuration (Control program tree) :=
  liftConfiguration (.descending bit) (RootResetEdgeSpine.initial (edges program tree) origin)
def ascending (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (bit : Bool) (origin : Cursor) : Configuration (Control program tree) :=
  liftConfiguration (.ascending bit) (RootResetPatternFragment.initial (upCode program tree) origin)
def reading (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (bit : Bool) (origin : Cursor) : Configuration (Control program tree) :=
  liftConfiguration (.reading bit) (RootResetPatternFragment.initial (readCode program tree) origin)

theorem descending_step (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (bit : Bool)
    (configuration : Configuration (RootResetEdgeSpine.Control (edges program tree))) (running : falseAnswer? configuration = false) :
    step (machine program tree) (liftConfiguration (Control.descending bit) configuration) =
      liftConfiguration (Control.descending bit) (step (RootResetEdgeSpine.machine (edges program tree)) configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := current
  subst runtime
  rcases state with ⟨code, member⟩
  cases code with
  | answer result => cases result with
    | false => cases running
    | true => rfl
  | observeNode _ _ | observeIncoming _ _ _ | move _ _ => rfl

theorem ascending_step (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (bit : Bool)
    (configuration : Configuration (PC (upCode program tree))) (running : anyAnswer? configuration = false) :
    step (machine program tree) (liftConfiguration (Control.ascending bit) configuration) =
      liftConfiguration (Control.ascending bit) (step (upBase program tree) configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := current
  subst runtime
  rcases state with ⟨code, member⟩
  cases code with
  | answer _ => cases running
  | observeNode _ _ | observeIncoming _ _ _ | move _ _ => rfl

theorem reading_step (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (bit : Bool)
    (configuration : Configuration (PC (readCode program tree))) (running : anyAnswer? configuration = false) :
    step (machine program tree) (liftConfiguration (Control.reading bit) configuration) =
      liftConfiguration (Control.reading bit) (step (RootResetPatternFragment.machine (readCode program tree)) configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := current
  subst runtime
  rcases state with ⟨code, member⟩
  cases code with
  | answer _ => cases running
  | observeNode _ _ | observeIncoming _ _ _ | move _ _ => rfl

theorem descending_runs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (bit : Bool)
    (origin endpoint : Cursor) (ticks : Nat)
    (member : ProbeCompiler.Control.answer false ∈ (RootResetEdgeSpine.whole (edges program tree)).nodes)
    (execution : run (RootResetEdgeSpine.machine (edges program tree)) ticks (RootResetEdgeSpine.initial (edges program tree) origin) =
      ⟨some ⟨.answer false, member⟩, endpoint⟩) :
    ∃ used, used ≤ ticks ∧ run (machine program tree) (used + 1) (initial program tree bit origin) = ascending program tree bit endpoint := by
  obtain ⟨used, bounded, lifted⟩ := run_to_boundary (RootResetEdgeSpine.machine (edges program tree)) (machine program tree) (Control.descending bit)
    falseAnswer? (false_terminal_absorbs _ _ (fun member cursor ticks => RootResetEdgeSpine.false_absorbs _ ticks member cursor))
    (descending_step program tree bit) ticks (RootResetEdgeSpine.initial (edges program tree) origin) (by rw [execution]; rfl)
  rw [execution] at lifted
  refine ⟨used, bounded, ?_⟩
  change run (machine program tree) (used + 1) (liftConfiguration (Control.descending bit) (RootResetEdgeSpine.initial (edges program tree) origin)) = _
  rw [run_add, lifted]
  rfl

theorem ascending_runs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (bit : Bool) (origin : Cursor) :
    ∃ used, used ≤ RootResetInverseEdgeSpine.familyBound (edges program tree) + 1 ∧
      run (machine program tree) (used + 1) (ascending program tree bit origin) =
        match RootResetInverseEdgeSpine.familyResult (edges program tree) origin with
        | none => ⟨some (.done bit), origin⟩
        | some ancestor => reading program tree bit ancestor := by
  obtain ⟨member, execution⟩ := RootResetCarrierOldestLiveProbe.inverse_family_runs program tree origin
  obtain ⟨used, bounded, lifted⟩ := run_to_boundary (upBase program tree) (machine program tree) (Control.ascending bit)
    anyAnswer? (RootResetMixedLocalFragment.classify_absorbs _) (ascending_step program tree bit) _
    (RootResetPatternFragment.initial (upCode program tree) origin) (by rw [execution]; rfl)
  rw [execution] at lifted
  refine ⟨used, Nat.le_trans bounded (Nat.add_le_add_right (RootResetInverseEdgeSpine.familyTicks_bound _ _) 1), ?_⟩
  change run (machine program tree) (used + 1) (liftConfiguration (Control.ascending bit) (RootResetPatternFragment.initial (upCode program tree) origin)) = _
  rw [run_add, lifted]
  generalize foundEq : RootResetInverseEdgeSpine.familyResult (edges program tree) origin = found at *
  cases found <;> rfl

theorem reading_runs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (bit : Bool) (origin : Cursor) :
    ∃ used, used ≤ RootResetCompletedLocalFragment.familyBound (patterns program tree) ∧
      run (machine program tree) (used + 1) (reading program tree bit origin) = ascending program tree (Bool.xor bit (tag program tree origin.focus)) origin := by
  obtain ⟨member, execution⟩ := RootResetCompletedLocalFragment.family_runs (patterns program tree) (.answer true) (.answer false)
    (readCode program tree) origin (fun _ h => h)
  change run (RootResetPatternFragment.machine (readCode program tree))
    (RootResetCompletedLocalFragment.familyTicks (patterns program tree) origin.focus)
    (RootResetPatternFragment.initial (readCode program tree) origin) = _ at execution
  obtain ⟨used, bounded, lifted⟩ := run_to_boundary (RootResetPatternFragment.machine (readCode program tree)) (machine program tree) (Control.reading bit)
    anyAnswer? (RootResetMixedLocalFragment.classify_absorbs _) (reading_step program tree bit)
    (RootResetCompletedLocalFragment.familyTicks (patterns program tree) origin.focus)
    (RootResetPatternFragment.initial (readCode program tree) origin) (by
      rw [execution]
      generalize tagEq : (patterns program tree).any (fun p => p.matchesBool origin.focus) = toggled at *
      cases toggled <;> rfl)
  rw [execution] at lifted
  refine ⟨used, Nat.le_trans bounded (RootResetCompletedLocalFragment.familyTicks_bound _ _), ?_⟩
  change run (machine program tree) (used + 1) (liftConfiguration (Control.reading bit) (RootResetPatternFragment.initial (readCode program tree) origin)) = _
  rw [run_add, lifted]
  dsimp only [tag]
  generalize tagEq : (patterns program tree).any (fun p => p.matchesBool origin.focus) = toggled at *
  cases toggled <;> rfl

def upCost (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  RootResetInverseEdgeSpine.familyBound (edges program tree) + RootResetCompletedLocalFragment.familyBound (patterns program tree) + 3

inductive Reads (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Cursor → Bool → Cursor → Bool → Prop where
  | done (origin : Cursor) (bit : Bool) (missed : RootResetInverseEdgeSpine.familyResult (edges program tree) origin = none) :
      Reads program tree origin bit origin bit
  | next (origin ancestor : Cursor) (bit : Bool)
      (found : RootResetInverseEdgeSpine.familyResult (edges program tree) origin = some ancestor)
      {endpoint : Cursor} {result : Bool}
      (rest : Reads program tree ancestor (Bool.xor bit (tag program tree ancestor.focus)) endpoint result) :
      Reads program tree origin bit endpoint result

theorem reverse_within {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {origin endpoint : Cursor} (walk : RootResetInverseEdgeSpine.Walks (edges program tree) origin endpoint) (bit : Bool) :
    ∃ ticks result, ticks ≤ upCost program tree * (origin.parents.length + 1) ∧
      run (machine program tree) ticks (ascending program tree bit origin) = ⟨some (.done result), endpoint⟩ ∧
      Reads program tree origin bit endpoint result := by
  induction walk generalizing bit with
  | done origin missed =>
      obtain ⟨used, bounded, execution⟩ := ascending_runs program tree bit origin
      rw [missed] at execution
      refine ⟨used + 1, bit, ?_, execution, .done origin bit missed⟩
      apply Nat.le_trans (Nat.add_le_add_right bounded 1)
      apply Nat.le_trans (show RootResetInverseEdgeSpine.familyBound (edges program tree) + 1 + 1 ≤ upCost program tree from ?_)
      · simpa only [Nat.mul_one] using Nat.mul_le_mul_left (upCost program tree) (Nat.succ_le_succ (Nat.zero_le origin.parents.length))
      · change _ ≤ RootResetInverseEdgeSpine.familyBound (edges program tree) + RootResetCompletedLocalFragment.familyBound (patterns program tree) + 3
        have enlarged := Nat.add_le_add_left (Nat.le_add_left 2 (RootResetCompletedLocalFragment.familyBound (patterns program tree))) (RootResetInverseEdgeSpine.familyBound (edges program tree))
        exact Nat.le_trans (by simpa only [Nat.add_assoc] using enlarged) (Nat.le_succ _)
  | next origin ancestor found rest ih =>
      obtain ⟨up, upBound, upRun⟩ := ascending_runs program tree bit origin
      rw [found] at upRun
      obtain ⟨read, readBound, readRun⟩ := reading_runs program tree bit ancestor
      obtain ⟨after, result, afterBound, afterRun, reads⟩ := ih (Bool.xor bit (tag program tree ancestor.focus))
      have firstBound : up + 1 + (read + 1) ≤ upCost program tree := by
        have total := Nat.add_le_add_right (Nat.add_le_add upBound readBound) 2
        have numeric (n : Nat) : 1 + (2 + n) = 3 + n := by rw [← Nat.add_assoc]
        simpa only [upCost, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm, numeric] using total
      have smaller := RootResetInverseEdgeSpine.familyResult_depth_lt (edges program tree)
        (fun row member => (RootResetCompleteCarrierRows.valid program tree row member).1) origin ancestor found
      refine ⟨up + 1 + (read + 1) + after, result, ?_, ?_, .next origin ancestor bit found reads⟩
      · calc
          _ ≤ upCost program tree + upCost program tree * (ancestor.parents.length + 1) := Nat.add_le_add firstBound afterBound
          _ = upCost program tree * (ancestor.parents.length + 1 + 1) := by
            simp only [Nat.mul_add, Nat.mul_one, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
          _ ≤ upCost program tree * (origin.parents.length + 1) := Nat.mul_le_mul_left _ (Nat.add_le_add_right smaller 1)
      · have firstRun : run (machine program tree) (up + 1 + (read + 1)) (ascending program tree bit origin) =
            ascending program tree (Bool.xor bit (tag program tree ancestor.focus)) ancestor := by
          rw [run_add, upRun]
          exact readRun
        rw [run_add, firstRun]
        exact afterRun

def coefficient (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  RootResetEdgeSpine.coefficient (edges program tree) + upCost program tree + 1

theorem all_input (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (bit : Bool)
    (origin : Cursor) (boundary : RootResetCompleteCarrierRows.Boundary origin) :
    ∃ ticks result descended, ticks ≤ coefficient program tree * origin.erase.size ∧
      run (machine program tree) ticks (initial program tree bit origin) = ⟨some (.done result), origin⟩ ∧
      RootResetEdgeSpine.Walks (edges program tree) origin descended ∧ Reads program tree descended bit origin result := by
  obtain ⟨downTicks, descended, downMember, downBound, downRun, down⟩ :=
    RootResetEdgeSpine.scan_within (edges program tree) (RootResetCompleteCarrierRows.valid program tree) origin
  obtain ⟨used, usedBound, actualDown⟩ := descending_runs program tree bit origin descended downTicks downMember downRun
  obtain ⟨_, returned, _, _, _, up⟩ := RootResetInverseEdgeSpine.scan_within (edges program tree)
    (fun row member => (RootResetCompleteCarrierRows.valid program tree row member).1) descended
  have restored := (RootResetLabelledEdgeProbe.walks_backs (edges program tree) (RootResetCompleteCarrierRows.inverts program tree) down).stops_at
    (RootResetCompleteCarrierRows.boundary_misses program tree origin boundary) up
  subst returned
  obtain ⟨upTicks, result, upBound, actualUp, reads⟩ := reverse_within up bit
  have erased := RootResetEdgeSpine.Walks.erase (edges program tree) down
  have focusBound : origin.focus.size ≤ origin.erase.size :=
    Nat.le_trans (Nat.le_add_left _ _) (RootResetProgressTotality.depth_add_focus_size_le_erase_size origin.focus origin.parents)
  have depthBound : descended.parents.length + 1 ≤ origin.erase.size := by
    rw [← erased]
    exact RootResetProgressTotality.depth_succ_le_erase_size descended.focus descended.parents
  have total := Nat.add_le_add (Nat.add_le_add (Nat.le_trans (Nat.le_trans usedBound downBound)
    (Nat.mul_le_mul_left _ focusBound)) (Term.size_pos origin.erase)) (Nat.le_trans upBound (Nat.mul_le_mul_left _ depthBound))
  refine ⟨used + 1 + upTicks, result, descended, ?_, ?_, down, reads⟩
  · simpa only [coefficient, Nat.add_mul, Nat.one_mul, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using total
  · rw [run_add, actualDown]
    exact actualUp

theorem mutationCount_zero (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (configuration : Configuration (Control program tree)) : mutationCount (machine program tree) configuration = 0 := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      rw [← commandCount_eq_mutationCount]
      cases state with
      | done _ => rfl
      | descending bit pc =>
          rcases pc with ⟨code, member⟩
          have zero := RootResetEdgeSpine.mutationCount_zero (edges program tree) ⟨some ⟨code, member⟩, cursor⟩
          cases code <;> try { rename_i result; cases result <;> rfl }
          all_goals
            simp only [machine, transition, commandCount_map]
            rw [commandCount_eq_mutationCount]
            exact zero
      | ascending bit pc =>
          rcases pc with ⟨code, member⟩
          have zero := RootResetPatternFragment.mutationCount_zero (upCode program tree)
            (RootResetInverseEdgeSpine.family_readOnly _) ⟨some ⟨code, member⟩, cursor⟩
          cases code <;> try { rename_i result; cases result <;> rfl }
          all_goals
            simp only [machine, transition, commandCount_map]
            rw [commandCount_eq_mutationCount]
            exact zero
      | reading bit pc =>
          rcases pc with ⟨code, member⟩
          have safe : (readCode program tree).NoRdx := RootResetCompletedLocalFragment.family_readOnly (patterns program tree) (.answer true) (.answer false) True.intro True.intro
          have zero := RootResetPatternFragment.mutationCount_zero (readCode program tree) safe ⟨some ⟨code, member⟩, cursor⟩
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
    (bit : Bool) (origin : Cursor) (ticks : Nat) :
    run (machine program tree) ticks ⟨some (.done bit), origin⟩ = ⟨some (.done bit), origin⟩ := by
  induction ticks with
  | zero => rfl
  | succ ticks ih => exact ih

end PureSFormal.Research.RootResetCarrierParityProbe
