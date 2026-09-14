import PureSFormal.Research.RootResetNestedUnaryParity
import PureSFormal.Research.RootResetNestedClockGrowthAgreement

/-! The second clock-parity pass restores its exact entry cursor. -/
namespace PureSFormal.Research.RootResetNestedClockSecondPass
open PureSFormal.PureS
open FiniteController RootResetCarrierNonemptyProbe
open RootResetPatternFragment
open RootResetNestedClockPatterns (pendingRows)

namespace Core
abbrev Control := RootResetNestedClockCoreProbe.Control
abbrev machine := RootResetNestedClockCoreProbe.machine
abbrev initial := RootResetNestedClockCoreProbe.initial
end Core

inductive Control where
  | enter (bit : Bool)
  | core (bit : Bool) (state : Core.Control)
  | unary (state : RootResetNestedUnaryParity.Control)
  | ascending (ready bit : Bool) (state : RootResetInverseEdgeSpine.Control pendingRows)
  | done (ready bit : Bool)

def cover : List Control :=
  [.enter false, .enter true, .done false false, .done false true, .done true false, .done true true] ++
  Core.machine.states.map (.core false) ++ Core.machine.states.map (.core true) ++
  RootResetNestedUnaryParity.machine.states.map .unary ++
  (RootResetInverseEdgeSpine.machine pendingRows).states.map (.ascending false false) ++
  (RootResetInverseEdgeSpine.machine pendingRows).states.map (.ascending false true) ++
  (RootResetInverseEdgeSpine.machine pendingRows).states.map (.ascending true false) ++
  (RootResetInverseEdgeSpine.machine pendingRows).states.map (.ascending true true)

theorem covers (state : Control) : state ∈ cover := by
  simp only [cover, List.mem_append]
  cases state with
  | enter bit =>
      have member : Control.enter bit ∈ [.enter false, .enter true, .done false false, .done false true, .done true false, .done true true] := by
        cases bit <;> simp only [List.mem_cons, List.mem_singleton, or_true, true_or]
      exact Or.inl (Or.inl (Or.inl (Or.inl (Or.inl (Or.inl (Or.inl member))))))
  | done ready bit =>
      have member : Control.done ready bit ∈ [.enter false, .enter true, .done false false, .done false true, .done true false, .done true true] := by
        cases ready <;> cases bit <;> simp only [List.mem_cons, List.mem_singleton, or_true, true_or]
      exact Or.inl (Or.inl (Or.inl (Or.inl (Or.inl (Or.inl (Or.inl member))))))
  | core bit state =>
      have member := RootResetCompletedLocalPatterns.map_member (Control.core bit) (Core.machine.covers state)
      cases bit with
      | false => exact Or.inl (Or.inl (Or.inl (Or.inl (Or.inl (Or.inl (Or.inr member))))))
      | true => exact Or.inl (Or.inl (Or.inl (Or.inl (Or.inl (Or.inr member)))))
  | unary state => exact Or.inl (Or.inl (Or.inl (Or.inl (Or.inr
      (RootResetCompletedLocalPatterns.map_member _ (RootResetNestedUnaryParity.machine.covers state))))))
  | ascending ready bit state =>
      have member := RootResetCompletedLocalPatterns.map_member (Control.ascending ready bit)
        ((RootResetInverseEdgeSpine.machine pendingRows).covers state)
      cases ready <;> cases bit
      · exact Or.inl (Or.inl (Or.inl (Or.inr member)))
      · exact Or.inl (Or.inl (Or.inr member))
      · exact Or.inl (Or.inr member)
      · exact Or.inr member

def transition : Control → Probe.NodeKind → Probe.Incoming → Command Control
  | .enter bit, .s, _ => .stay (.done false bit)
  | .enter bit, .app, _ => .exec .L (.core bit (.descending ⟨RootResetEdgeSpine.whole pendingRows,
      ProbeCompiler.Control.self_mem_nodes _⟩))
  | .core bit (.done false), _, _ => .exec .U (.done false bit)
  | .core bit (.done true), _, _ => .exec .R (.unary (.descending (.scan bit
      ⟨RootResetEdgeFragment.familyCode RootResetNestedUnaryScan.rows, ProbeCompiler.Control.self_mem_nodes _⟩)))
  | .core bit state, node, incoming => mapCommand (.core bit) (Core.machine.transition state node incoming)
  | .unary (.done ready bit), _, _ => .exec .U (.ascending ready bit
      ⟨RootResetInverseEdgeSpine.whole pendingRows, ProbeCompiler.Control.self_mem_nodes _⟩)
  | .unary state, node, incoming => mapCommand .unary (RootResetNestedUnaryParity.machine.transition state node incoming)
  | .ascending ready bit state, node, incoming => match state.val with
    | .answer false => .exec .U (.done ready bit)
    | _ => mapCommand (.ascending ready bit) ((RootResetInverseEdgeSpine.machine pendingRows).transition state node incoming)
  | .done ready bit, _, _ => .stay (.done ready bit)

def machine : Machine Control := ⟨fun _ => cover, covers, transition⟩
def initial (bit : Bool) (origin : Cursor) : Configuration Control := ⟨some (.enter bit), origin⟩
def working (bit : Bool) (origin : Cursor) : Configuration Control := liftConfiguration (.core bit) (Core.initial origin)
def counting (bit : Bool) (origin : Cursor) : Configuration Control := liftConfiguration .unary (RootResetNestedUnaryParity.initial bit origin)
def ascending (ready bit : Bool) (origin : Cursor) : Configuration Control :=
  liftConfiguration (.ascending ready bit) (RootResetInverseEdgeSpine.initial pendingRows origin)

def coreDone? (configuration : Configuration Core.Control) : Bool :=
  match configuration.control with
  | some (.done _) => true
  | _ => false

theorem core_absorbs (configuration : Configuration Core.Control) (ended : coreDone? configuration = true)
    (ticks : Nat) : run Core.machine ticks configuration = configuration := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => cases ended
  | some state => cases state with
    | done ready => exact RootResetNestedClockCoreProbe.done_absorbs ready cursor ticks
    | descending _ => cases ended
    | reading _ => cases ended
    | ascending _ => cases ended

theorem core_step (bit : Bool) (configuration : Configuration Core.Control) (running : coreDone? configuration = false) :
    step machine (liftConfiguration (Control.core bit) configuration) =
      liftConfiguration (Control.core bit) (step Core.machine configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := current
  subst runtime
  cases state with
  | done ready => cases running
  | descending _ => rfl
  | reading _ => rfl
  | ascending _ => rfl

theorem core_runs (bit : Bool) (origin endpoint : Cursor) (ticks : Nat) (ready : Bool)
    (execution : run Core.machine ticks (Core.initial origin) = ⟨some (.done ready), endpoint⟩) :
    ∃ used, used ≤ ticks ∧ run machine used (working bit origin) = ⟨some (.core bit (.done ready)), endpoint⟩ := by
  obtain ⟨used, bounded, lifted⟩ := run_to_boundary Core.machine machine (Control.core bit) coreDone?
    core_absorbs (core_step bit) ticks (Core.initial origin) (by rw [execution]; rfl)
  rw [execution] at lifted
  exact ⟨used, bounded, lifted⟩


def unaryDone? (configuration : Configuration RootResetNestedUnaryParity.Control) : Bool :=
  match configuration.control with
  | some (.done _ _) => true
  | _ => false

theorem unary_absorbs (configuration : Configuration RootResetNestedUnaryParity.Control)
    (ended : unaryDone? configuration = true) (ticks : Nat) :
    run RootResetNestedUnaryParity.machine ticks configuration = configuration := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => cases ended
  | some state => cases state with
    | done ready bit => exact RootResetNestedUnaryParity.done_absorbs ready bit cursor ticks
    | descending _ | reading _ _ | ascending _ _ _ => cases ended

theorem unary_step (configuration : Configuration RootResetNestedUnaryParity.Control)
    (running : unaryDone? configuration = false) :
    step machine (liftConfiguration Control.unary configuration) =
      liftConfiguration Control.unary (step RootResetNestedUnaryParity.machine configuration) := by
  apply step_lift
  intro state current
  rcases configuration with ⟨runtime, cursor⟩
  have equal : runtime = some state := current
  subst runtime
  cases state with
  | done ready bit => cases running
  | descending _ | reading _ _ | ascending _ _ _ => rfl

theorem unary_runs (bit ready result : Bool) (origin : Cursor) (ticks : Nat)
    (execution : run RootResetNestedUnaryParity.machine ticks (RootResetNestedUnaryParity.initial bit origin) =
      ⟨some (.done ready result), origin⟩) :
    ∃ used, used ≤ ticks ∧ run machine used (counting bit origin) = ⟨some (.unary (.done ready result)), origin⟩ := by
  obtain ⟨used, bounded, actual⟩ := run_to_boundary RootResetNestedUnaryParity.machine machine Control.unary unaryDone?
    unary_absorbs unary_step ticks (RootResetNestedUnaryParity.initial bit origin) (by rw [execution]; rfl)
  rw [execution] at actual
  exact ⟨used, bounded, actual⟩

theorem ascending_step (ready bit : Bool) (configuration : Configuration (RootResetInverseEdgeSpine.Control pendingRows))
    (running : falseAnswer? configuration = false) :
    step machine (liftConfiguration (Control.ascending ready bit) configuration) =
      liftConfiguration (Control.ascending ready bit) (step (RootResetInverseEdgeSpine.machine pendingRows) configuration) := by
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

theorem ascending_runs (ready bit : Bool) (origin endpoint : Cursor) (ticks : Nat)
    (member : ProbeCompiler.Control.answer false ∈ (RootResetInverseEdgeSpine.whole pendingRows).nodes)
    (execution : run (RootResetInverseEdgeSpine.machine pendingRows) ticks (RootResetInverseEdgeSpine.initial pendingRows origin) =
      ⟨some ⟨.answer false, member⟩, endpoint⟩) :
    ∃ used, used ≤ ticks ∧ run machine used (ascending ready bit origin) = ⟨some (.ascending ready bit ⟨.answer false, member⟩), endpoint⟩ := by
  obtain ⟨used, bounded, actual⟩ := run_to_boundary (RootResetInverseEdgeSpine.machine pendingRows) machine (Control.ascending ready bit)
    falseAnswer? (false_terminal_absorbs _ _ (fun member cursor ticks => RootResetInverseEdgeSpine.false_absorbs _ ticks member cursor))
    (ascending_step ready bit) ticks (RootResetInverseEdgeSpine.initial pendingRows origin) (by rw [execution]; rfl)
  rw [execution] at actual
  exact ⟨used, bounded, actual⟩

theorem walk_size {origin endpoint : Cursor}
    (walk : RootResetEdgeSpine.Walks pendingRows origin endpoint) : endpoint.focus.size ≤ origin.focus.size := by
  induction walk with
  | done origin missed => exact Nat.le_refl _
  | next origin after row selected followed rest ih =>
      have member := (RootResetEdgeFragment.select_sound pendingRows origin.focus row selected).1
      exact Nat.le_trans ih (Nat.le_of_lt (RootResetEdgeFragment.follow_size_lt row.address origin after
        (RootResetNestedClockPatterns.pending_valid row member).1 followed))

theorem redex_fields (origin : Cursor) (ready : origin.rdx?.isSome = true) :
    ∃ x y z, origin.focus = Term.redex x y z := by
  rcases origin with ⟨source, parents⟩
  cases source with
  | s => cases ready
  | app function z => cases function with
    | s => cases ready
    | app function y => cases function with
      | s => cases ready
      | app head x => cases head with
        | s => exact ⟨x, y, z, rfl⟩
        | app _ _ => cases ready

abbrev upCost := RootResetNestedClockCoreProbe.upCost
def coefficient : Nat := RootResetNestedClockCoreProbe.coefficient + RootResetNestedUnaryParity.coefficient + upCost + upCost + 4

theorem combined_bound (source : Term) (down numeral up : Nat)
    (downBound : down ≤ RootResetNestedClockCoreProbe.coefficient * source.size)
    (numeralBound : numeral ≤ RootResetNestedUnaryParity.coefficient * source.size)
    (upBound : up ≤ upCost * source.size + upCost) :
    1 + (down + 1) + (numeral + 1) + (up + 1) ≤ coefficient * source.size := by
  have constant (value : Nat) : value ≤ value * source.size := by
    simpa only [Nat.mul_one] using Nat.mul_le_mul_left value (Term.size_pos source)
  have sumBound := Nat.add_le_add_right (Nat.add_le_add (Nat.add_le_add downBound numeralBound) upBound) 4
  have enlarged := Nat.add_le_add (Nat.add_le_add_left
    (Nat.add_le_add_left (constant upCost) (upCost * source.size))
    (RootResetNestedClockCoreProbe.coefficient * source.size + RootResetNestedUnaryParity.coefficient * source.size)) (constant 4)
  exact Nat.le_trans (by simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using sumBound)
    (by simpa only [coefficient, Nat.add_mul, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using enlarged)

theorem all_input (bit : Bool) (origin : Cursor) :
    ∃ (ticks : Nat) (ready result : Bool), ticks ≤ coefficient * origin.focus.size ∧
      run machine ticks (initial bit origin) = ⟨some (.done ready result), origin⟩ := by
  rcases origin with ⟨source, parents⟩
  cases source with
  | s => exact ⟨1, false, bit, by simp [coefficient, Term.size], rfl⟩
  | app core environment =>
      let inside : Cursor := ⟨core, .left environment :: parents⟩
      have sourceSize : core.size ≤ (Term.app core environment).size := by
        change core.size ≤ core.size + environment.size + 1
        exact Nat.le_trans (Nat.le_add_right _ _) (Nat.le_succ _)
      obtain ⟨coreTicks, ready, endpoint, coreBound, coreRun, answer⟩ :=
        RootResetNestedClockCoreProbe.all_input_with_walk inside rfl
      obtain ⟨coreUsed, coreUsedBound, coreActual⟩ := core_runs bit inside endpoint coreTicks ready coreRun
      have downBound : coreUsed ≤ RootResetNestedClockCoreProbe.coefficient * (Term.app core environment).size :=
        Nat.le_trans (Nat.le_trans coreUsedBound coreBound) (Nat.mul_le_mul_left _ sourceSize)
      cases ready with
      | false =>
          change endpoint = inside at answer
          subst endpoint
          refine ⟨1 + (coreUsed + 1), false, bit, ?_, ?_⟩
          · exact Nat.le_trans (Nat.le_trans (Nat.le_add_right _ 1) (Nat.le_add_right _ 1))
              (combined_bound (.app core environment) coreUsed 0 0 downBound (Nat.zero_le _) (Nat.zero_le _))
          · rw [run_add]
            change run machine (coreUsed + 1) (working bit inside) = _
            rw [run_add, coreActual]
            rfl
      | true =>
          obtain ⟨redex, walk⟩ := answer
          obtain ⟨x, y, z, shape⟩ := redex_fields endpoint redex
          rcases endpoint with ⟨focus, context⟩
          change focus = _ at shape
          subst focus
          let numeralOrigin : Cursor := ⟨z, .right (.app (.app .s x) y) :: context⟩
          have boundary : RootResetInverseEdgeSpine.familyResult RootResetNestedUnaryScan.rows numeralOrigin = none := rfl
          obtain ⟨numeralTicks, count, tail, numeralBound, numeralRun, _, _⟩ :=
            RootResetNestedUnaryParity.all_input bit numeralOrigin boundary
          let accepted := RootResetNestedUnaryParity.zero? tail.focus
          let result := RootResetClockParityWalker.xor bit (RootResetClockParityWalker.parity count)
          obtain ⟨numeralUsed, numeralUsedBound, numeralActual⟩ := unary_runs bit accepted result numeralOrigin numeralTicks numeralRun
          have numeralSize : z.size ≤ (Term.app core environment).size := by
            have childSize : z.size ≤ (Term.redex x y z).size :=
              Nat.le_trans (Nat.le_add_left _ _) (Nat.le_succ _)
            exact Nat.le_trans childSize (Nat.le_trans (walk_size walk) sourceSize)
          have numBound : numeralUsed ≤ RootResetNestedUnaryParity.coefficient * (Term.app core environment).size :=
            Nat.le_trans (Nat.le_trans numeralUsedBound numeralBound) (Nat.mul_le_mul_left _ numeralSize)
          obtain ⟨reverseTicks, reverseBound, reverseRun⟩ := RootResetNestedClockCoreProbe.reverse_runs walk
          have reverseSmall : reverseTicks ≤ upCost * (Term.app core environment).size :=
            Nat.le_trans (Nat.le_trans (Nat.le_add_right _ _) reverseBound) (Nat.mul_le_mul_left _ sourceSize)
          obtain ⟨member, finalRun⟩ := RootResetInverseEdgeSpine.missed_runs pendingRows inside
            (RootResetNestedClockPatterns.inverse_boundary inside rfl)
          have fullUp : run (RootResetInverseEdgeSpine.machine pendingRows)
              (reverseTicks + RootResetInverseEdgeSpine.familyTicks pendingRows inside)
              (RootResetInverseEdgeSpine.initial pendingRows ⟨Term.redex x y z, context⟩) =
              ⟨some ⟨.answer false, member⟩, inside⟩ := by
            rw [run_add, reverseRun]
            exact finalRun
          obtain ⟨upUsed, upUsedBound, upActual⟩ := ascending_runs accepted result ⟨Term.redex x y z, context⟩ inside _ member fullUp
          have upBound : upUsed ≤ upCost * (Term.app core environment).size + upCost :=
            Nat.le_trans upUsedBound (Nat.add_le_add reverseSmall
              (Nat.le_trans (RootResetInverseEdgeSpine.familyTicks_bound _ _) (Nat.le_add_right _ 2)))
          refine ⟨1 + (coreUsed + 1) + (numeralUsed + 1) + (upUsed + 1), accepted, result,
            combined_bound (.app core environment) coreUsed numeralUsed upUsed downBound numBound upBound, ?_⟩
          have entered : run machine (1 + (coreUsed + 1)) (initial bit ⟨.app core environment, parents⟩) =
              counting bit numeralOrigin := by
            rw [run_add]
            change run machine (coreUsed + 1) (working bit inside) = _
            rw [run_add, coreActual]
            rfl
          have counted : run machine (1 + (coreUsed + 1) + (numeralUsed + 1)) (initial bit ⟨.app core environment, parents⟩) =
              ascending accepted result ⟨Term.redex x y z, context⟩ := by
            rw [run_add, entered, run_add, numeralActual]
            rfl
          rw [run_add, counted, run_add, upActual]
          rfl

theorem clock_pair_walk (stage wrappers leftNumber rightNumber : Nat) (parents : List ParentFrame) :
    RootResetEdgeSpine.Walks pendingRows
      ⟨SchedulerInvariant.clockWrap stage wrappers (.app (C leftNumber) (C rightNumber)), parents⟩
      ⟨.app (C leftNumber) (C rightNumber), RootResetClockGrowthWalker.clockParents stage wrappers parents⟩ := by
  induction wrappers generalizing parents with
  | zero => exact .done _ (RootResetNestedClockGrowthAgreement.pair_stops leftNumber rightNumber)
  | succ wrappers ih =>
      exact .next _ _ RootResetNestedClockPatterns.pendingRow rfl rfl
        (ih (.right (.app .s (C stage)) :: parents))

theorem generated (bit : Bool) (stage wrappers leftNumber rightNumber : Nat)
    (environment : Term) (parents : List ParentFrame) :
    let source := Term.app (SchedulerInvariant.clockWrap stage wrappers (.app (C leftNumber) (C rightNumber))) environment
    ∃ ticks, ticks ≤ coefficient * source.size ∧
      run machine ticks (initial bit ⟨source, parents⟩) =
        ⟨some (.done true (RootResetClockParityWalker.xor bit (RootResetClockParityWalker.parity rightNumber))), ⟨source, parents⟩⟩ := by
  dsimp only
  let core := SchedulerInvariant.clockWrap stage wrappers (.app (C leftNumber) (C rightNumber))
  let inside : Cursor := ⟨core, .left environment :: parents⟩
  let context := RootResetClockGrowthWalker.clockParents stage wrappers (.left environment :: parents)
  let endpoint : Cursor := ⟨.app (C leftNumber) (C rightNumber), context⟩
  let numeralOrigin : Cursor := ⟨C rightNumber, .right (C leftNumber) :: context⟩
  let result := RootResetClockParityWalker.xor bit (RootResetClockParityWalker.parity rightNumber)
  have sourceSize : core.size ≤ (Term.app core environment).size := by
    change core.size ≤ core.size + environment.size + 1
    exact Nat.le_trans (Nat.le_add_right _ _) (Nat.le_succ _)
  obtain ⟨coreTicks, coreBound, coreRun⟩ := RootResetNestedClockGrowthAgreement.core_pair_generated
    stage wrappers leftNumber rightNumber (.left environment :: parents)
  obtain ⟨coreUsed, coreUsedBound, coreActual⟩ := core_runs bit inside endpoint coreTicks true coreRun
  have downBound : coreUsed ≤ RootResetNestedClockCoreProbe.coefficient * (Term.app core environment).size :=
    Nat.le_trans (Nat.le_trans coreUsedBound coreBound) (Nat.mul_le_mul_left _ sourceSize)
  have walk : RootResetEdgeSpine.Walks pendingRows inside endpoint := clock_pair_walk stage wrappers leftNumber rightNumber _
  obtain ⟨numeralTicks, numeralBound, numeralRun⟩ := RootResetNestedUnaryParity.generated bit rightNumber numeralOrigin.parents
    (RootResetNestedUnaryParity.second_pass_boundary (C rightNumber) leftNumber context)
  obtain ⟨numeralUsed, numeralUsedBound, numeralActual⟩ := unary_runs bit true result numeralOrigin numeralTicks numeralRun
  have numeralSize : (C rightNumber).size ≤ (Term.app core environment).size := by
    have childSize : (C rightNumber).size ≤ (Term.app (C leftNumber) (C rightNumber)).size :=
      Nat.le_trans (Nat.le_add_left _ _) (Nat.le_succ _)
    exact Nat.le_trans childSize (Nat.le_trans (walk_size walk) sourceSize)
  have numBound : numeralUsed ≤ RootResetNestedUnaryParity.coefficient * (Term.app core environment).size :=
    Nat.le_trans (Nat.le_trans numeralUsedBound numeralBound) (Nat.mul_le_mul_left _ numeralSize)
  obtain ⟨reverseTicks, reverseBound, reverseRun⟩ := RootResetNestedClockCoreProbe.reverse_runs walk
  have reverseSmall : reverseTicks ≤ upCost * (Term.app core environment).size :=
    Nat.le_trans (Nat.le_trans (Nat.le_add_right _ _) reverseBound) (Nat.mul_le_mul_left _ sourceSize)
  obtain ⟨member, finalRun⟩ := RootResetInverseEdgeSpine.missed_runs pendingRows inside
    (RootResetNestedClockPatterns.inverse_boundary inside rfl)
  have fullUp : run (RootResetInverseEdgeSpine.machine pendingRows)
      (reverseTicks + RootResetInverseEdgeSpine.familyTicks pendingRows inside)
      (RootResetInverseEdgeSpine.initial pendingRows endpoint) = ⟨some ⟨.answer false, member⟩, inside⟩ := by
    rw [run_add, reverseRun]
    exact finalRun
  obtain ⟨upUsed, upUsedBound, upActual⟩ := ascending_runs true result endpoint inside _ member fullUp
  have upBound : upUsed ≤ upCost * (Term.app core environment).size + upCost :=
    Nat.le_trans upUsedBound (Nat.add_le_add reverseSmall
      (Nat.le_trans (RootResetInverseEdgeSpine.familyTicks_bound _ _) (Nat.le_add_right _ 2)))
  refine ⟨1 + (coreUsed + 1) + (numeralUsed + 1) + (upUsed + 1),
    combined_bound (.app core environment) coreUsed numeralUsed upUsed downBound numBound upBound, ?_⟩
  have entered : run machine (1 + (coreUsed + 1)) (initial bit ⟨.app core environment, parents⟩) = counting bit numeralOrigin := by
    rw [run_add]
    change run machine (coreUsed + 1) (working bit inside) = _
    rw [run_add, coreActual]
    rfl
  have counted : run machine (1 + (coreUsed + 1) + (numeralUsed + 1)) (initial bit ⟨.app core environment, parents⟩) =
      ascending true result endpoint := by
    rw [run_add, entered, run_add, numeralActual]
    rfl
  rw [run_add, counted, run_add, upActual]
  rfl

theorem mutationCount_zero (configuration : Configuration Control) : mutationCount machine configuration = 0 := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      rw [← commandCount_eq_mutationCount]
      cases state with
      | enter bit => cases nodeEq : Probe.observeNode cursor <;> simp only [machine, transition, nodeEq, commandCount]
      | done ready bit => rfl
      | core bit state =>
          have zero := RootResetNestedClockCoreProbe.mutationCount_zero ⟨some state, cursor⟩
          cases state with
          | done ready => cases ready <;> rfl
          | descending _ | reading _ | ascending _ =>
              simp only [machine, transition, commandCount_map]
              rw [commandCount_eq_mutationCount]
              exact zero
      | unary state =>
          have zero := RootResetNestedUnaryParity.mutationCount_zero ⟨some state, cursor⟩
          cases state with
          | done ready bit => rfl
          | descending _ | reading _ _ | ascending _ _ _ =>
              simp only [machine, transition, commandCount_map]
              rw [commandCount_eq_mutationCount]
              exact zero
      | ascending ready bit pc =>
          rcases pc with ⟨code, member⟩
          have zero := RootResetInverseEdgeSpine.mutationCount_zero pendingRows ⟨some ⟨code, member⟩, cursor⟩
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

end PureSFormal.Research.RootResetNestedClockSecondPass
