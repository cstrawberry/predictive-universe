import PureSFormal.Research.RootResetNestedUnaryScan

/-! Unary parity with finite recognition and exact inverse-edge return. -/
namespace PureSFormal.Research.RootResetNestedUnaryParity
open PureSFormal.PureS
open FiniteController RootResetPatternFragment RootResetCarrierNonemptyProbe
open RootResetCarrierEdgePatterns RootResetCompletedLocalPatterns
open RootResetNestedUnaryScan (rows successorRow wrap)
open RootResetClockParityWalker (parity numeralParents)

def zeroRows : List EdgeRow := [⟨literal (C 0), []⟩]
def zero? (source : Term) : Bool := (literal (C 0)).matchesBool source

inductive Control where
  | descending (state : RootResetNestedUnaryScan.Control)
  | reading (bit : Bool) (state : RootResetEdgeFragment.Control zeroRows)
  | ascending (ready bit : Bool) (state : RootResetInverseEdgeSpine.Control rows)
  | done (ready bit : Bool)

def cover : List Control :=
  [.done false false, .done false true, .done true false, .done true true] ++
  RootResetNestedUnaryScan.machine.states.map .descending ++
  (RootResetEdgeFragment.machine zeroRows).states.map (.reading false) ++
  (RootResetEdgeFragment.machine zeroRows).states.map (.reading true) ++
  (RootResetInverseEdgeSpine.machine rows).states.map (.ascending false false) ++
  (RootResetInverseEdgeSpine.machine rows).states.map (.ascending false true) ++
  (RootResetInverseEdgeSpine.machine rows).states.map (.ascending true false) ++
  (RootResetInverseEdgeSpine.machine rows).states.map (.ascending true true)

theorem covers (state : Control) : state ∈ cover := by
  simp only [cover, List.mem_append]
  cases state with
  | done ready bit =>
      have member : Control.done ready bit ∈ [.done false false, .done false true, .done true false, .done true true] := by
        cases ready <;> cases bit <;> simp only [List.mem_cons, List.mem_singleton, or_true, true_or]
      exact Or.inl (Or.inl (Or.inl (Or.inl (Or.inl (Or.inl (Or.inl member))))))
  | descending state =>
      exact Or.inl (Or.inl (Or.inl (Or.inl (Or.inl (Or.inl (Or.inr
        (RootResetCompletedLocalPatterns.map_member _ (RootResetNestedUnaryScan.machine.covers state))))))))
  | reading bit state =>
      have member := RootResetCompletedLocalPatterns.map_member (Control.reading bit)
        ((RootResetEdgeFragment.machine zeroRows).covers state)
      cases bit with
      | false => exact Or.inl (Or.inl (Or.inl (Or.inl (Or.inl (Or.inr member)))))
      | true => exact Or.inl (Or.inl (Or.inl (Or.inl (Or.inr member))))
  | ascending ready bit state =>
      have member := RootResetCompletedLocalPatterns.map_member (Control.ascending ready bit)
        ((RootResetInverseEdgeSpine.machine rows).covers state)
      cases ready <;> cases bit
      · exact Or.inl (Or.inl (Or.inl (Or.inr member)))
      · exact Or.inl (Or.inl (Or.inr member))
      · exact Or.inl (Or.inr member)
      · exact Or.inr member

def transition (state : Control) (node : Probe.NodeKind) (incoming : Probe.Incoming) : Command Control :=
  match state with
  | .descending (.done bit) => .stay (.reading bit ⟨RootResetEdgeFragment.familyCode zeroRows, ProbeCompiler.Control.self_mem_nodes _⟩)
  | .descending state => mapCommand .descending (RootResetNestedUnaryScan.machine.transition state node incoming)
  | .reading bit state => match state.val with
    | .answer ready => .stay (.ascending ready bit ⟨RootResetInverseEdgeSpine.whole rows, ProbeCompiler.Control.self_mem_nodes _⟩)
    | _ => mapCommand (.reading bit) ((RootResetEdgeFragment.machine zeroRows).transition state node incoming)
  | .ascending ready bit state => match state.val with
    | .answer false => .stay (.done ready bit)
    | _ => mapCommand (.ascending ready bit) ((RootResetInverseEdgeSpine.machine rows).transition state node incoming)
  | .done ready bit => .stay (.done ready bit)

def machine : Machine Control := ⟨fun _ => cover, covers, transition⟩
def initial (bit : Bool) (origin : Cursor) : Configuration Control :=
  liftConfiguration .descending (RootResetNestedUnaryScan.initial bit origin)
def reading (bit : Bool) (origin : Cursor) : Configuration Control :=
  liftConfiguration (.reading bit) (RootResetEdgeFragment.initial zeroRows origin)
def ascending (ready bit : Bool) (origin : Cursor) : Configuration Control :=
  liftConfiguration (.ascending ready bit) (RootResetInverseEdgeSpine.initial rows origin)

def scanDone? (configuration : Configuration RootResetNestedUnaryScan.Control) : Bool :=
  match configuration.control with
  | some (.done _) => true
  | _ => false

theorem scan_absorbs (configuration : Configuration RootResetNestedUnaryScan.Control)
    (ended : scanDone? configuration = true) (ticks : Nat) :
    run RootResetNestedUnaryScan.machine ticks configuration = configuration := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => cases ended
  | some state => cases state with
    | done bit => exact RootResetNestedUnaryScan.done_absorbs bit cursor ticks
    | scan _ _ => cases ended

theorem descending_step (configuration : Configuration RootResetNestedUnaryScan.Control)
    (running : scanDone? configuration = false) :
    step machine (liftConfiguration Control.descending configuration) =
      liftConfiguration Control.descending (step RootResetNestedUnaryScan.machine configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := current
  subst runtime
  cases state with
  | done bit => cases running
  | scan _ _ => rfl

theorem reading_step (bit : Bool) (configuration : Configuration (RootResetEdgeFragment.Control zeroRows))
    (running : anyAnswer? configuration = false) :
    step machine (liftConfiguration (Control.reading bit) configuration) =
      liftConfiguration (Control.reading bit) (step (RootResetEdgeFragment.machine zeroRows) configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := current
  subst runtime
  rcases state with ⟨code, member⟩
  cases code with
  | answer result => cases running
  | observeNode _ _ | observeIncoming _ _ _ | move _ _ => rfl

theorem ascending_step (ready bit : Bool) (configuration : Configuration (RootResetInverseEdgeSpine.Control rows))
    (running : falseAnswer? configuration = false) :
    step machine (liftConfiguration (Control.ascending ready bit) configuration) =
      liftConfiguration (Control.ascending ready bit) (step (RootResetInverseEdgeSpine.machine rows) configuration) := by
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

theorem descending_runs (bit result : Bool) (origin endpoint : Cursor) (ticks : Nat)
    (execution : run RootResetNestedUnaryScan.machine ticks (RootResetNestedUnaryScan.initial bit origin) =
      ⟨some (.done result), endpoint⟩) :
    ∃ used, used ≤ ticks ∧ run machine (used + 1) (initial bit origin) = reading result endpoint := by
  obtain ⟨used, bounded, actual⟩ := run_to_boundary RootResetNestedUnaryScan.machine machine Control.descending scanDone?
    scan_absorbs descending_step ticks (RootResetNestedUnaryScan.initial bit origin) (by rw [execution]; rfl)
  rw [execution] at actual
  refine ⟨used, bounded, ?_⟩
  change run machine (used + 1) (liftConfiguration .descending (RootResetNestedUnaryScan.initial bit origin)) = _
  rw [run_add, actual]
  rfl

theorem zero_runs (origin : Cursor) :
    ∃ member, run (RootResetEdgeFragment.machine zeroRows) (RootResetEdgeFragment.ticks zeroRows origin.focus)
      (RootResetEdgeFragment.initial zeroRows origin) = ⟨some ⟨.answer (zero? origin.focus), member⟩, origin⟩ := by
  cases matched : zero? origin.focus with
  | false =>
      have missed : RootResetEdgeFragment.select zeroRows origin.focus = none := by
        change (if zero? origin.focus then _ else _) = _
        rw [matched]; rfl
      exact RootResetEdgeFragment.missed_runs zeroRows origin missed
  | true =>
      have selected : RootResetEdgeFragment.select zeroRows origin.focus = some ⟨literal (C 0), []⟩ := by
        change (if zero? origin.focus then _ else _) = _
        rw [matched]; rfl
      exact RootResetEdgeFragment.selected_runs zeroRows origin origin _ selected rfl

theorem reading_runs (bit : Bool) (origin : Cursor) :
    ∃ used, used ≤ RootResetEdgeFragment.bound zeroRows ∧
      run machine (used + 1) (reading bit origin) = ascending (zero? origin.focus) bit origin := by
  obtain ⟨member, execution⟩ := zero_runs origin
  obtain ⟨used, bounded, actual⟩ := run_to_boundary (RootResetEdgeFragment.machine zeroRows) machine (Control.reading bit)
    anyAnswer? (RootResetMixedLocalFragment.classify_absorbs _) (reading_step bit) _
    (RootResetEdgeFragment.initial zeroRows origin) (by rw [execution]; rfl)
  rw [execution] at actual
  refine ⟨used, Nat.le_trans bounded (RootResetEdgeFragment.ticks_bound _ _), ?_⟩
  change run machine (used + 1) (liftConfiguration (Control.reading bit) (RootResetEdgeFragment.initial zeroRows origin)) = _
  rw [run_add, actual]
  rfl

theorem ascending_runs (ready bit : Bool) (origin endpoint : Cursor) (ticks : Nat)
    (member : ProbeCompiler.Control.answer false ∈ (RootResetInverseEdgeSpine.whole rows).nodes)
    (execution : run (RootResetInverseEdgeSpine.machine rows) ticks (RootResetInverseEdgeSpine.initial rows origin) =
      ⟨some ⟨.answer false, member⟩, endpoint⟩) :
    ∃ used, used ≤ ticks ∧ run machine (used + 1) (ascending ready bit origin) = ⟨some (.done ready bit), endpoint⟩ := by
  obtain ⟨used, bounded, actual⟩ := run_to_boundary (RootResetInverseEdgeSpine.machine rows) machine (Control.ascending ready bit)
    falseAnswer? (false_terminal_absorbs _ _ (fun member cursor ticks => RootResetInverseEdgeSpine.false_absorbs _ ticks member cursor))
    (ascending_step ready bit) ticks (RootResetInverseEdgeSpine.initial rows origin) (by rw [execution]; rfl)
  rw [execution] at actual
  refine ⟨used, bounded, ?_⟩
  change run machine (used + 1) (liftConfiguration (Control.ascending ready bit) (RootResetInverseEdgeSpine.initial rows origin)) = _
  rw [run_add, actual]
  rfl

theorem inverse_successor (tail : Term) (parents : List ParentFrame) :
    RootResetInverseEdgeSpine.familyResult rows ⟨tail, .right b :: parents⟩ = some ⟨.app b tail, parents⟩ := by
  have back := RootResetInverseEdgeFragment.backResult_complete successorRow.address.reverse successorRow.pattern
    ⟨.app b tail, parents⟩ ⟨tail, .right b :: parents⟩ rfl rfl
  change (match RootResetInverseEdgeFragment.backResult successorRow.address.reverse successorRow.pattern ⟨tail, .right b :: parents⟩ with
    | some ancestor => some ancestor
    | none => none) = _
  rw [back]

abbrev upCost := RootResetInverseEdgeSpine.coefficient rows

theorem reverse_prefix (count : Nat) (tail : Term) (parents : List ParentFrame) :
    ∃ ticks, ticks ≤ upCost * count ∧
      run (RootResetInverseEdgeSpine.machine rows) ticks
        (RootResetInverseEdgeSpine.initial rows ⟨tail, numeralParents count parents⟩) =
        RootResetInverseEdgeSpine.initial rows ⟨wrap count tail, parents⟩ := by
  induction count generalizing parents with
  | zero => exact ⟨0, Nat.le_refl _, rfl⟩
  | succ count ih =>
      obtain ⟨ticks, bounded, execution⟩ := ih (.right b :: parents)
      have final := RootResetInverseEdgeSpine.selected_runs rows ⟨wrap count tail, .right b :: parents⟩
        ⟨.app b (wrap count tail), parents⟩ (inverse_successor _ _)
      refine ⟨ticks + (RootResetInverseEdgeSpine.familyTicks rows ⟨wrap count tail, .right b :: parents⟩ + 2), ?_, ?_⟩
      · have bound := Nat.add_le_add bounded (Nat.add_le_add_right
          (RootResetInverseEdgeSpine.familyTicks_bound rows ⟨wrap count tail, .right b :: parents⟩) 2)
        simpa only [Nat.mul_succ] using! bound
      · rw [numeralParents, run_add, execution]
        exact final

theorem count_le_wrap_size (count : Nat) (tail : Term) : count ≤ (wrap count tail).size := by
  induction count with
  | zero => exact Nat.zero_le _
  | succ count ih =>
      exact Nat.le_trans (Nat.succ_le_succ ih) (Nat.add_le_add_right (Nat.le_add_left _ _) 1)

def coefficient : Nat := RootResetNestedUnaryScan.coefficient + RootResetEdgeFragment.bound zeroRows + upCost + upCost + 3

theorem all_input (bit : Bool) (origin : Cursor)
    (boundary : RootResetInverseEdgeSpine.familyResult rows origin = none) :
    ∃ (ticks count : Nat) (endpoint : Cursor),
      ticks ≤ coefficient * origin.focus.size ∧
      run machine ticks (initial bit origin) =
        ⟨some (.done (zero? endpoint.focus) (RootResetClockParityWalker.xor bit (parity count))), origin⟩ ∧
      origin.focus = wrap count endpoint.focus ∧
      RootResetEdgeFragment.select rows endpoint.focus = none := by
  obtain ⟨downTicks, count, endpoint, downBound, downRun, sourceEq, parentEq, missed⟩ :=
    RootResetNestedUnaryScan.scan_within bit origin
  let result := RootResetClockParityWalker.xor bit (parity count)
  obtain ⟨downUsed, downUsedBound, downActual⟩ := descending_runs bit result origin endpoint downTicks downRun
  obtain ⟨readUsed, readBound, readActual⟩ := reading_runs result endpoint
  obtain ⟨upTicks, upBound, upRun⟩ := reverse_prefix count endpoint.focus origin.parents
  have reverseRun : run (RootResetInverseEdgeSpine.machine rows) upTicks
      (RootResetInverseEdgeSpine.initial rows endpoint) = RootResetInverseEdgeSpine.initial rows origin := by
    rw [← parentEq] at upRun
    rw [← sourceEq] at upRun
    exact upRun
  obtain ⟨member, finalRun⟩ := RootResetInverseEdgeSpine.missed_runs rows origin boundary
  have fullUp : run (RootResetInverseEdgeSpine.machine rows) (upTicks + RootResetInverseEdgeSpine.familyTicks rows origin)
      (RootResetInverseEdgeSpine.initial rows endpoint) = ⟨some ⟨.answer false, member⟩, origin⟩ := by
    rw [run_add, reverseRun]
    exact finalRun
  obtain ⟨upUsed, upUsedBound, upActual⟩ := ascending_runs (zero? endpoint.focus) result endpoint origin _ member fullUp
  refine ⟨downUsed + 1 + (readUsed + 1) + (upUsed + 1), count, endpoint, ?_, ?_, sourceEq, missed⟩
  · have constant (value : Nat) : value ≤ value * origin.focus.size := by
      simpa only [Nat.mul_one] using Nat.mul_le_mul_left value (Term.size_pos origin.focus)
    have countBound : count ≤ origin.focus.size := by rw [sourceEq]; exact count_le_wrap_size _ _
    have upTotal : upUsed ≤ upCost * origin.focus.size + upCost :=
      Nat.le_trans upUsedBound (Nat.add_le_add (Nat.le_trans upBound (Nat.mul_le_mul_left upCost countBound))
        (Nat.le_trans (RootResetInverseEdgeSpine.familyTicks_bound _ _) (Nat.le_add_right _ 2)))
    have sumBound := Nat.add_le_add_right (Nat.add_le_add
      (Nat.add_le_add (Nat.le_trans downUsedBound downBound) (Nat.le_trans readBound (constant _))) upTotal) 3
    have enlarged := Nat.add_le_add (Nat.add_le_add_left
      (Nat.add_le_add_left (constant upCost) (upCost * origin.focus.size))
      (RootResetNestedUnaryScan.coefficient * origin.focus.size + RootResetEdgeFragment.bound zeroRows * origin.focus.size)) (constant 3)
    exact Nat.le_trans (by simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using sumBound)
      (by simpa only [coefficient, Nat.add_mul, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using enlarged)
  · have firstTwo : run machine (downUsed + 1 + (readUsed + 1)) (initial bit origin) = ascending (zero? endpoint.focus) result endpoint := by
      rw [run_add, downActual]
      exact readActual
    rw [run_add, firstTwo]
    exact upActual

theorem wrap_eq_numeral (count number : Nat) (tail : Term)
    (equal : wrap count tail = C number) (missed : RootResetEdgeFragment.select rows tail = none) :
    count = number ∧ tail = C 0 := by
  induction count generalizing number with
  | zero =>
      cases number with
      | zero => exact ⟨rfl, equal⟩
      | succ number =>
          change tail = C (number + 1) at equal
          subst tail
          cases missed
  | succ count ih =>
      cases number with
      | zero =>
          simp only [wrap, C, b, Term.app.injEq] at equal
          cases equal.1.2
      | succ number =>
          have tailEq : wrap count tail = C number := (Term.app.inj equal).2
          obtain ⟨countEq, tailEq⟩ := ih number tailEq
          exact ⟨congrArg Nat.succ countEq, tailEq⟩

theorem generated (bit : Bool) (number : Nat) (parents : List ParentFrame)
    (boundary : RootResetInverseEdgeSpine.familyResult rows ⟨C number, parents⟩ = none) :
    ∃ ticks, ticks ≤ coefficient * (C number).size ∧
      run machine ticks (initial bit ⟨C number, parents⟩) =
        ⟨some (.done true (RootResetClockParityWalker.xor bit (parity number))), ⟨C number, parents⟩⟩ := by
  obtain ⟨ticks, count, endpoint, bounded, execution, sourceEq, missed⟩ := all_input bit ⟨C number, parents⟩ boundary
  obtain ⟨countEq, endpointEq⟩ := wrap_eq_numeral count number endpoint.focus sourceEq.symm missed
  rw [countEq, zero?, endpointEq, literal_self] at execution
  exact ⟨ticks, bounded, execution⟩

theorem first_pass_boundary (source body environment : Term) (parents : List ParentFrame) :
    RootResetInverseEdgeSpine.familyResult rows
      ⟨source, .right .s :: .left body :: .left environment :: parents⟩ = none := rfl

theorem second_pass_boundary (source : Term) (number : Nat) (parents : List ParentFrame) :
    RootResetInverseEdgeSpine.familyResult rows ⟨source, .right (C number) :: parents⟩ = none := by
  cases number <;> rfl

theorem mutationCount_zero (configuration : Configuration Control) : mutationCount machine configuration = 0 := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      rw [← commandCount_eq_mutationCount]
      cases state with
      | done ready bit => rfl
      | descending state =>
          have zero := RootResetNestedUnaryScan.mutationCount_zero ⟨some state, cursor⟩
          cases state with
          | done bit => rfl
          | scan bit pc =>
              simp only [machine, transition, commandCount_map]
              rw [commandCount_eq_mutationCount]
              exact zero
      | reading bit pc =>
          rcases pc with ⟨code, member⟩
          have zero := RootResetPatternFragment.mutationCount_zero _ (RootResetEdgeFragment.family_readOnly zeroRows)
            ⟨some ⟨code, member⟩, cursor⟩
          cases code <;> try { rename_i result; cases result <;> rfl }
          all_goals
            simp only [machine, transition, commandCount_map]
            rw [commandCount_eq_mutationCount]
            exact zero
      | ascending ready bit pc =>
          rcases pc with ⟨code, member⟩
          have zero := RootResetInverseEdgeSpine.mutationCount_zero rows ⟨some ⟨code, member⟩, cursor⟩
          cases code <;> try { rename_i result; cases result <;> rfl }
          all_goals
            simp only [machine, transition, commandCount_map]
            rw [commandCount_eq_mutationCount]
            exact zero

theorem runMutationCount_zero (ticks : Nat) (configuration : Configuration Control) :
    runMutationCount machine ticks configuration = 0 := by
  induction ticks generalizing configuration with
  | zero => rfl
  | succ ticks ih => rw [runMutationCount, mutationCount_zero, ih, Nat.zero_add]

theorem erase_run (ticks : Nat) (configuration : Configuration Control) :
    (run machine ticks configuration).cursor.erase = configuration.cursor.erase := by
  have projected := run_projects_stepsN machine ticks configuration
  rw [runMutationCount_zero] at projected
  exact (StepsN.eq_of_zero projected).symm

theorem done_absorbs (ready bit : Bool) (origin : Cursor) (ticks : Nat) :
    run machine ticks ⟨some (.done ready bit), origin⟩ = ⟨some (.done ready bit), origin⟩ := by
  induction ticks with
  | zero => rfl
  | succ ticks ih => exact ih

end PureSFormal.Research.RootResetNestedUnaryParity
