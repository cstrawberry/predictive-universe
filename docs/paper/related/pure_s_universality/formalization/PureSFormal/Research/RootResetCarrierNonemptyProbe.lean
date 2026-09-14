import PureSFormal.Research.RootResetInverseEdgeSpine
import PureSFormal.Research.RootResetCarrierNonemptyAgreement
import PureSFormal.Research.RootResetProgressTotality

/-!
# One finite carrier nonempty probe

The controller composes carrier descent, two fixed live-pattern tests,
and inverse-carrier ascent. The answer is retained in a finite control
bit. Every input terminates within a fixed linear bound at root; every
run is read-only. Generated carrier paths produce the exact nonempty
answer, and a parsed fresh Local produces the public fresh-admission
Boolean. Exact return to the initial cursor is proved separately in
RootResetCarrierInverseUnique using the finite inverse boundary and
structural address uniqueness; this module establishes term preservation.
-/

namespace PureSFormal.Research.RootResetCarrierNonemptyProbe
open PureSFormal.PureS
open FiniteController
open RootResetPatternFragment

def liftConfiguration {α β : Type} (embed : α → β) (configuration : Configuration α) : Configuration β :=
  ⟨configuration.control.map embed, configuration.cursor⟩

def mapCommand {α β : Type} (embed : α → β) : Command α → Command β
  | .stay next => .stay (embed next)
  | .exec operation next => .exec operation (embed next)
  | .reject => .reject

theorem step_lift {α β : Type} (source : Machine α) (target : Machine β) (embed : α → β)
    (configuration : Configuration α)
    (commands : ∀ state, configuration.control = some state →
      target.transition (embed state) (Probe.observeNode configuration.cursor) (Probe.observeIncoming configuration.cursor) =
        mapCommand embed (source.transition state (Probe.observeNode configuration.cursor) (Probe.observeIncoming configuration.cursor))) :
    step target (liftConfiguration embed configuration) = liftConfiguration embed (step source configuration) := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      have same := commands state rfl
      change ((match target.transition (embed state) (Probe.observeNode cursor) (Probe.observeIncoming cursor) with
        | .stay next => ⟨some next, cursor⟩
        | .reject => ⟨none, cursor⟩
        | .exec operation next => match operation.exec cursor with
          | none => ⟨none, cursor⟩
          | some after => ⟨some next, after⟩) : Configuration β) = _
      rw [same]
      cases commandEq : source.transition state (Probe.observeNode cursor) (Probe.observeIncoming cursor) with
      | stay next => simp only [step, commandEq, mapCommand, liftConfiguration, Option.map_some]
      | reject => simp only [step, commandEq, mapCommand, liftConfiguration, Option.map_none]
      | exec operation next =>
          cases moved : operation.exec cursor <;>
            simp only [step, commandEq, mapCommand, liftConfiguration, moved, Option.map_some, Option.map_none] <;> rfl

theorem run_to_boundary {α β : Type} (source : Machine α) (target : Machine β) (embed : α → β)
    (terminal : Configuration α → Bool)
    (absorbs : ∀ configuration, terminal configuration = true → ∀ ticks, run source ticks configuration = configuration)
    (steps : ∀ configuration, terminal configuration = false →
      step target (liftConfiguration embed configuration) = liftConfiguration embed (step source configuration))
    (ticks : Nat) (configuration : Configuration α) (ended : terminal (run source ticks configuration) = true) :
    ∃ used, used ≤ ticks ∧ run target used (liftConfiguration embed configuration) =
      liftConfiguration embed (run source ticks configuration) := by
  induction ticks generalizing configuration with
  | zero => exact ⟨0, Nat.le_refl _, rfl⟩
  | succ ticks ih =>
      cases initialDone : terminal configuration with
      | true =>
          rw [absorbs configuration initialDone] at ended ⊢
          exact ⟨0, Nat.zero_le _, rfl⟩
      | false =>
          obtain ⟨used, bound, execution⟩ := ih (step source configuration) ended
          refine ⟨used + 1, Nat.succ_le_succ bound, ?_⟩
          rw [run_succ, steps configuration initialDone]
          exact execution

def falseAnswer? {whole : Code} (configuration : Configuration (PC whole)) : Bool :=
  match configuration.control with
  | some ⟨.answer false, _⟩ => true
  | _ => false

def anyAnswer? {whole : Code} (configuration : Configuration (PC whole)) : Bool :=
  match configuration.control with
  | some ⟨.answer _, _⟩ => true
  | _ => false

def livePatterns : List Pattern := [RootResetCarrierNonemptyAgreement.livePattern false,
  RootResetCarrierNonemptyAgreement.livePattern true]

def liveCode : Code := RootResetCompletedLocalFragment.familyCode livePatterns (.answer true) (.answer false)

abbrev edges (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :=
  RootResetCarrierNonemptyRows.rows program tree

inductive Control (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) where
  | descending (state : RootResetEdgeSpine.Control (edges program tree))
  | reading (state : PC liveCode)
  | ascending (result : Bool) (state : RootResetInverseEdgeSpine.Control (edges program tree))
  | done (result : Bool)

def cover (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : List (Control program tree) :=
  [.done false, .done true] ++
    (RootResetEdgeSpine.machine (edges program tree)).states.map Control.descending ++
    (RootResetPatternFragment.machine liveCode).states.map Control.reading ++
    (RootResetInverseEdgeSpine.machine (edges program tree)).states.map (Control.ascending false) ++
    (RootResetInverseEdgeSpine.machine (edges program tree)).states.map (Control.ascending true)

theorem covers (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (state : Control program tree) : state ∈ cover program tree := by
  cases state with
  | done result =>
      simp only [cover, List.mem_append]
      apply Or.inl ∘ Or.inl ∘ Or.inl ∘ Or.inl
      cases result with
      | false => exact List.Mem.head _
      | true => exact List.Mem.tail _ (List.Mem.head _)
  | descending state =>
      have member := RootResetCompletedLocalPatterns.map_member Control.descending
        ((RootResetEdgeSpine.machine (edges program tree)).covers state)
      simp only [cover, List.mem_append]
      exact Or.inl (Or.inl (Or.inl (Or.inr member)))
  | reading state =>
      have member := RootResetCompletedLocalPatterns.map_member (Control.reading (program := program) (tree := tree))
        ((RootResetPatternFragment.machine liveCode).covers state)
      simp only [cover, List.mem_append]
      exact Or.inl (Or.inl (Or.inr member))
  | ascending result state =>
      have member := RootResetCompletedLocalPatterns.map_member (Control.ascending result)
        ((RootResetInverseEdgeSpine.machine (edges program tree)).covers state)
      cases result with
      | false =>
          simp only [cover, List.mem_append]
          exact Or.inl (Or.inr member)
      | true =>
          simp only [cover, List.mem_append]
          exact Or.inr member

def transition (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (state : Control program tree) (node : Probe.NodeKind) (incoming : Probe.Incoming) : Command (Control program tree) :=
  match state with
  | .descending scan =>
      match scan.val with
      | .answer false => .stay (.reading ⟨liveCode, ProbeCompiler.Control.self_mem_nodes _⟩)
      | _ => mapCommand Control.descending ((RootResetEdgeSpine.machine (edges program tree)).transition scan node incoming)
  | .reading scan =>
      match scan.val with
      | .answer result => .stay (.ascending result ⟨RootResetInverseEdgeSpine.whole (edges program tree), ProbeCompiler.Control.self_mem_nodes _⟩)
      | _ => mapCommand Control.reading ((RootResetPatternFragment.machine liveCode).transition scan node incoming)
  | .ascending result scan =>
      match scan.val with
      | .answer false => .stay (.done result)
      | _ => mapCommand (Control.ascending result) ((RootResetInverseEdgeSpine.machine (edges program tree)).transition scan node incoming)
  | .done result => .stay (.done result)

def machine (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Machine (Control program tree) :=
  ⟨fun _ => cover program tree, covers program tree, transition program tree⟩

def initial (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) :
    Configuration (Control program tree) := liftConfiguration Control.descending (RootResetEdgeSpine.initial (edges program tree) origin)

theorem false_terminal_absorbs (whole : Code) (source : Machine (PC whole))
    (absorbs : ∀ member cursor ticks,
      run source ticks ⟨some ⟨ProbeCompiler.Control.answer false, member⟩, cursor⟩ =
        ⟨some ⟨.answer false, member⟩, cursor⟩)
    (configuration : Configuration (PC whole)) (ended : falseAnswer? configuration = true) (ticks : Nat) :
    run source ticks configuration = configuration := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => cases ended
  | some state =>
      rcases state with ⟨code, member⟩
      cases code with
      | answer result => cases result with
        | false => exact absorbs member cursor ticks
        | true => cases ended
      | observeNode onS onApp => cases ended
      | observeIncoming onRoot onLeft onRight => cases ended
      | move operation next => cases ended

theorem live_terminal_absorbs (configuration : Configuration (PC liveCode))
    (ended : anyAnswer? configuration = true) (ticks : Nat) :
    run (RootResetPatternFragment.machine liveCode) ticks configuration = configuration := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => cases ended
  | some state =>
      rcases state with ⟨code, member⟩
      cases code with
      | answer result => exact RootResetPatternFragment.answer_absorbing liveCode result member cursor ticks
      | observeNode onS onApp => cases ended
      | observeIncoming onRoot onLeft onRight => cases ended
      | move operation next => cases ended

theorem descending_step (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (configuration : Configuration (RootResetEdgeSpine.Control (edges program tree)))
    (running : falseAnswer? configuration = false) :
    step (machine program tree) (liftConfiguration Control.descending configuration) =
      liftConfiguration Control.descending (step (RootResetEdgeSpine.machine (edges program tree)) configuration) := by
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
  | observeNode onS onApp => rfl
  | observeIncoming onRoot onLeft onRight => rfl
  | move operation next => rfl

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
  | answer result => cases running
  | observeNode onS onApp => rfl
  | observeIncoming onRoot onLeft onRight => rfl
  | move operation next => rfl

theorem ascending_step (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (result : Bool)
    (configuration : Configuration (RootResetInverseEdgeSpine.Control (edges program tree)))
    (running : falseAnswer? configuration = false) :
    step (machine program tree) (liftConfiguration (Control.ascending result) configuration) =
      liftConfiguration (Control.ascending result) (step (RootResetInverseEdgeSpine.machine (edges program tree)) configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := current
  subst runtime
  rcases state with ⟨code, member⟩
  cases code with
  | answer bit => cases bit with
    | false => cases running
    | true => rfl
  | observeNode onS onApp => rfl
  | observeIncoming onRoot onLeft onRight => rfl
  | move operation next => rfl

def liveTicks (source : Term) : Nat := RootResetCompletedLocalFragment.familyTicks livePatterns source
def liveBound : Nat := RootResetCompletedLocalFragment.familyBound livePatterns

theorem live_runs (origin : Cursor) :
    ∃ member : ProbeCompiler.Control.answer (RootResetCarrierNonemptyAgreement.isLive? origin.focus) ∈ liveCode.nodes,
      run (RootResetPatternFragment.machine liveCode) (liveTicks origin.focus)
        (RootResetPatternFragment.initial liveCode origin) =
        ⟨some ⟨.answer (RootResetCarrierNonemptyAgreement.isLive? origin.focus), member⟩, origin⟩ := by
  obtain ⟨member, execution⟩ := RootResetCompletedLocalFragment.family_runs livePatterns (.answer true) (.answer false)
    liveCode origin (fun _ h => h)
  have anyEq : livePatterns.any (fun pattern => pattern.matchesBool origin.focus) =
      RootResetCarrierNonemptyAgreement.isLive? origin.focus := by
    simp only [livePatterns, List.any_cons, List.any_nil, Bool.or_false, RootResetCarrierNonemptyAgreement.isLive?]
  simp only [anyEq] at member execution
  cases result : RootResetCarrierNonemptyAgreement.isLive? origin.focus <;>
    simp only [result, Bool.false_eq_true, ↓reduceIte] at member execution ⊢ <;>
    exact ⟨member, execution⟩

theorem descending_runs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin endpoint : Cursor) (ticks : Nat)
    (member : ProbeCompiler.Control.answer false ∈ (RootResetEdgeSpine.whole (edges program tree)).nodes)
    (execution : run (RootResetEdgeSpine.machine (edges program tree)) ticks
      (RootResetEdgeSpine.initial (edges program tree) origin) = ⟨some ⟨.answer false, member⟩, endpoint⟩) :
    ∃ used, used ≤ ticks ∧ run (machine program tree) (used + 1) (initial program tree origin) =
      liftConfiguration Control.reading (RootResetPatternFragment.initial liveCode endpoint) := by
  obtain ⟨used, usedBound, actualRun⟩ := run_to_boundary (RootResetEdgeSpine.machine (edges program tree))
    (machine program tree) Control.descending falseAnswer?
    (false_terminal_absorbs _ _ (fun member cursor ticks => RootResetEdgeSpine.false_absorbs _ ticks member cursor))
    (descending_step program tree) ticks (RootResetEdgeSpine.initial (edges program tree) origin)
    (by rw [execution]; rfl)
  rw [execution] at actualRun
  refine ⟨used, usedBound, ?_⟩
  change run (machine program tree) (used + 1)
    (liftConfiguration Control.descending (RootResetEdgeSpine.initial (edges program tree) origin)) = _
  rw [run_add, actualRun]
  rfl

theorem reading_runs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) :
    ∃ used, used ≤ liveBound ∧ run (machine program tree) (used + 1)
      (liftConfiguration Control.reading (RootResetPatternFragment.initial liveCode origin)) =
      liftConfiguration (Control.ascending (RootResetCarrierNonemptyAgreement.isLive? origin.focus))
        (RootResetInverseEdgeSpine.initial (edges program tree) origin) := by
  obtain ⟨member, execution⟩ := live_runs origin
  obtain ⟨used, usedBound, actualRun⟩ := run_to_boundary (RootResetPatternFragment.machine liveCode)
    (machine program tree) Control.reading anyAnswer? live_terminal_absorbs
    (reading_step program tree) (liveTicks origin.focus) (RootResetPatternFragment.initial liveCode origin)
    (by rw [execution]; rfl)
  rw [execution] at actualRun
  refine ⟨used, Nat.le_trans usedBound (RootResetCompletedLocalFragment.familyTicks_bound livePatterns origin.focus), ?_⟩
  rw [run_add, actualRun]
  rfl

theorem ascending_runs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (result : Bool)
    (origin endpoint : Cursor) (ticks : Nat)
    (member : ProbeCompiler.Control.answer false ∈ (RootResetInverseEdgeSpine.whole (edges program tree)).nodes)
    (execution : run (RootResetInverseEdgeSpine.machine (edges program tree)) ticks
      (RootResetInverseEdgeSpine.initial (edges program tree) origin) = ⟨some ⟨.answer false, member⟩, endpoint⟩) :
    ∃ used, used ≤ ticks ∧ run (machine program tree) (used + 1)
      (liftConfiguration (Control.ascending result) (RootResetInverseEdgeSpine.initial (edges program tree) origin)) =
      ⟨some (.done result), endpoint⟩ := by
  obtain ⟨used, usedBound, actualRun⟩ := run_to_boundary (RootResetInverseEdgeSpine.machine (edges program tree))
    (machine program tree) (Control.ascending result) falseAnswer?
    (false_terminal_absorbs _ _ (fun member cursor ticks => RootResetInverseEdgeSpine.false_absorbs _ ticks member cursor))
    (ascending_step program tree result) ticks (RootResetInverseEdgeSpine.initial (edges program tree) origin)
    (by rw [execution]; rfl)
  rw [execution] at actualRun
  refine ⟨used, usedBound, ?_⟩
  rw [run_add, actualRun]
  rfl

def budget (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) : Nat :=
  RootResetEdgeSpine.coefficient (edges program tree) * origin.focus.size + liveBound +
    RootResetInverseEdgeSpine.coefficient (edges program tree) * origin.erase.size + 3

theorem combined_bound (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin descended : Cursor) (down read up : Nat)
    (downBound : down ≤ RootResetEdgeSpine.coefficient (edges program tree) * origin.focus.size)
    (readBound : read ≤ liveBound)
    (upBound : up ≤ RootResetInverseEdgeSpine.coefficient (edges program tree) * (descended.parents.length + 1))
    (erase : descended.erase = origin.erase) :
    down + 1 + (read + 1) + (up + 1) ≤ budget program tree origin := by
  have depthBound := RootResetProgressTotality.depth_succ_le_erase_size descended.focus descended.parents
  have toWhole : descended.parents.length + 1 ≤ origin.erase.size := by simpa only [erase] using depthBound
  have finalUp := Nat.le_trans upBound (Nat.mul_le_mul_left _ toWhole)
  have combined := Nat.add_le_add_right (Nat.add_le_add (Nat.add_le_add downBound readBound) finalUp) 3
  simpa only [budget, show 3 = 1 + 1 + 1 by rfl, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using combined

theorem all_input (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (origin : Cursor) :
    ∃ ticks descended returned,
      ticks ≤ budget program tree origin ∧
      run (machine program tree) ticks (initial program tree origin) =
        ⟨some (.done (RootResetCarrierNonemptyAgreement.isLive? descended.focus)), returned⟩ ∧
      RootResetEdgeSpine.Walks (edges program tree) origin descended ∧
      RootResetInverseEdgeSpine.Walks (edges program tree) descended returned ∧
      returned.erase = origin.erase := by
  have valid := RootResetCarrierNonemptyRows.valid program tree
  obtain ⟨downTicks, descended, downMember, downBound, downExecution, downWalks⟩ :=
    RootResetEdgeSpine.scan_within (edges program tree) valid origin
  obtain ⟨downUsed, downUsedBound, actualDown⟩ := descending_runs program tree origin descended downTicks downMember downExecution
  obtain ⟨readUsed, readBound, actualRead⟩ := reading_runs program tree descended
  have proper : RootResetInverseEdgeSpine.Proper (edges program tree) := fun row member => (valid row member).1
  obtain ⟨upTicks, returned, upMember, upBound, upExecution, upWalks⟩ :=
    RootResetInverseEdgeSpine.scan_within (edges program tree) proper descended
  obtain ⟨upUsed, upUsedBound, actualUp⟩ := ascending_runs program tree
    (RootResetCarrierNonemptyAgreement.isLive? descended.focus) descended returned upTicks upMember upExecution
  have downErase := RootResetEdgeSpine.Walks.erase (edges program tree) downWalks
  refine ⟨downUsed + 1 + (readUsed + 1) + (upUsed + 1), descended, returned,
    combined_bound program tree origin descended downUsed readUsed upUsed
      (Nat.le_trans downUsedBound downBound) readBound (Nat.le_trans upUsedBound upBound) downErase,
    ?_, downWalks, upWalks, (RootResetInverseEdgeSpine.Walks.erase (edges program tree) upWalks).trans downErase⟩
  have firstCombined : run (machine program tree) (downUsed + 1 + (readUsed + 1)) (initial program tree origin) =
      liftConfiguration (Control.ascending (RootResetCarrierNonemptyAgreement.isLive? descended.focus))
        (RootResetInverseEdgeSpine.initial (edges program tree) descended) := by
    rw [run_add, actualDown]
    exact actualRead
  rw [run_add, firstCombined]
  exact actualUp

def coefficient (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  RootResetEdgeSpine.coefficient (edges program tree) + liveBound +
    RootResetInverseEdgeSpine.coefficient (edges program tree) + 3

theorem root_budget (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (source : Term) :
    budget program tree (Cursor.atRoot source) ≤ coefficient program tree * source.size := by
  have middle := Nat.mul_le_mul_left liveBound (Term.size_pos source)
  have last := Nat.mul_le_mul_left 3 (Term.size_pos source)
  have combined := Nat.add_le_add
    (Nat.add_le_add_right (Nat.add_le_add_left (by simpa only [Nat.mul_one] using middle)
      (RootResetEdgeSpine.coefficient (edges program tree) * source.size))
      (RootResetInverseEdgeSpine.coefficient (edges program tree) * source.size))
    (by simpa only [Nat.mul_one] using last)
  simpa only [budget, coefficient, Cursor.atRoot, Cursor.erase_atRoot, Nat.add_mul] using! combined

theorem all_input_atRoot (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (source : Term) :
    ∃ ticks descended returned,
      ticks ≤ coefficient program tree * source.size ∧
      run (machine program tree) ticks (initial program tree (Cursor.atRoot source)) =
        ⟨some (.done (RootResetCarrierNonemptyAgreement.isLive? descended.focus)), returned⟩ ∧
      RootResetEdgeSpine.Walks (edges program tree) (Cursor.atRoot source) descended ∧
      RootResetInverseEdgeSpine.Walks (edges program tree) descended returned ∧ returned.erase = source := by
  obtain ⟨ticks, descended, returned, bounded, execution, down, up, erased⟩ := all_input program tree (Cursor.atRoot source)
  exact ⟨ticks, descended, returned, Nat.le_trans bounded (root_budget program tree source), execution, down, up, erased⟩

def commandCount {α : Type} (cursor : Cursor) : Command α → Nat
  | .exec .Rdx _ => if cursor.rdx?.isSome then 1 else 0
  | _ => 0

theorem commandCount_map {α β : Type} (embed : α → β) (cursor : Cursor) (command : Command α) :
    commandCount cursor (mapCommand embed command) = commandCount cursor command := by
  cases command with
  | stay next => rfl
  | reject => rfl
  | exec operation next => cases operation <;> rfl

theorem commandCount_eq_mutationCount {α : Type} (source : Machine α) (state : α) (cursor : Cursor) :
    commandCount cursor (source.transition state (Probe.observeNode cursor) (Probe.observeIncoming cursor)) =
      mutationCount source ⟨some state, cursor⟩ := by
  cases commandEq : source.transition state (Probe.observeNode cursor) (Probe.observeIncoming cursor) with
  | stay next => simp only [mutationCount, commandEq, commandCount]
  | reject => simp only [mutationCount, commandEq, commandCount]
  | exec operation next =>
      cases operation <;> simp only [mutationCount, commandEq, commandCount]
      cases cursor.rdx? <;> rfl

theorem mutationCount_zero (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (configuration : Configuration (Control program tree)) : mutationCount (machine program tree) configuration = 0 := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      rw [← commandCount_eq_mutationCount]
      cases state with
      | done result => rfl
      | descending scan =>
          rcases scan with ⟨code, member⟩
          have zero := RootResetEdgeSpine.mutationCount_zero (edges program tree) ⟨some ⟨code, member⟩, cursor⟩
          cases code <;> try { rename_i result; cases result <;> rfl }
          all_goals
            simp only [machine, transition, commandCount_map]
            rw [commandCount_eq_mutationCount]
            exact zero
      | reading scan =>
          rcases scan with ⟨code, member⟩
          have safe : liveCode.NoRdx := RootResetCompletedLocalFragment.family_readOnly livePatterns (.answer true) (.answer false) True.intro True.intro
          have zero := RootResetPatternFragment.mutationCount_zero liveCode safe ⟨some ⟨code, member⟩, cursor⟩
          cases code <;> try { rename_i result; cases result <;> rfl }
          all_goals
            simp only [machine, transition, commandCount_map]
            rw [commandCount_eq_mutationCount]
            exact zero
      | ascending result scan =>
          rcases scan with ⟨code, member⟩
          have zero := RootResetInverseEdgeSpine.mutationCount_zero (edges program tree) ⟨some ⟨code, member⟩, cursor⟩
          cases code <;> try { rename_i bit; cases bit <;> rfl }
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
    (result : Bool) (origin : Cursor) (ticks : Nat) :
    run (machine program tree) ticks ⟨some (.done result), origin⟩ = ⟨some (.done result), origin⟩ := by
  induction ticks with
  | zero => rfl
  | succ ticks ih => exact ih


theorem generated_answer
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits decoded : List Bool} {continuation source : Term}
    (admissible : Carrier.Admissible continuation)
    (path : CarrierDecoder.PathDecodes program tree bits continuation source decoded)
    (origin : Cursor) (atSource : origin.focus = source) :
    ∃ ticks returned, ticks ≤ budget program tree origin ∧
      run (machine program tree) ticks (initial program tree origin) =
        ⟨some (.done (!decoded.isEmpty)), returned⟩ ∧
      returned.erase = origin.erase := by
  obtain ⟨ticks, descended, returned, bounded, execution, down, up, erased⟩ := all_input program tree origin
  have answer := RootResetCarrierNonemptyAgreement.walks_nonempty admissible path atSource down
  rw [answer] at execution
  exact ⟨ticks, returned, bounded, execution, erased⟩

theorem fresh_answer
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits decoded : List Bool} {continuation source : Term}
    {view : CheckpointDecoder.LocalView program}
    (admissible : Carrier.Admissible continuation)
    (parsed : CheckpointDecoder.parseLocal? program tree source = some view)
    (fresh : view.status = .fresh)
    (path : CarrierDecoder.PathDecodes program tree bits continuation view.accumulator decoded)
    (origin : Cursor) (atSource : origin.focus = source) :
    ∃ ticks returned, ticks ≤ budget program tree origin ∧
      run (machine program tree) ticks (initial program tree origin) =
        ⟨some (.done ((RootResetPersistentRouteA.parseFreshNonempty? program tree source).isSome)), returned⟩ ∧
      returned.erase = origin.erase := by
  obtain ⟨ticks, descended, returned, bounded, execution, down, up, erased⟩ := all_input program tree origin
  have values := RootResetCarrierNonemptyAgreement.ReadValue.local parsed
    (RootResetCarrierNonemptyAgreement.ReadValue.path admissible path)
  have answer := values.walks down atSource
  have carrier := CheckpointRun.pathDecodes_to_termOnly admissible path
  have admission := RootResetCarrierImmediateLive.carrierHasLive?_fresh_admission parsed fresh carrier
  rw [RootResetCarrierImmediateLive.carrierHasLive?_decode carrier] at admission
  rw [answer, admission] at execution
  exact ⟨ticks, returned, bounded, execution, erased⟩

end PureSFormal.Research.RootResetCarrierNonemptyProbe
