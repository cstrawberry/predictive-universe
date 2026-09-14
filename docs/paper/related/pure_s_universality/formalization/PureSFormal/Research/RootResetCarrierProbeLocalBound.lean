import PureSFormal.Research.RootResetCarrierInverseUnique

/-!
# A carrier probe cost charged only to its accumulator

The inverse run retraces exactly the selected forward edges, so outer
cursor depth does not contribute to its cost. For a parsed Local, the
first bounded edge enters the accumulator; the complete down/live/up
probe is bounded by coefficient * (accumulator.size + 1). The accumulator
and selected continuation occupy disjoint syntax branches, supplying the
amortized size decrease for linear mixed continuation traversal.
-/

namespace PureSFormal.Research.RootResetCarrierProbeLocalBound
open PureSFormal.PureS
open FiniteController
open RootResetCarrierNonemptyProbe

abbrev rows (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) := RootResetCarrierNonemptyRows.rows program tree
abbrev upCost (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) := RootResetInverseEdgeSpine.coefficient (rows program tree)
abbrev downCost (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) := RootResetEdgeSpine.coefficient (rows program tree)

theorem reverse_runs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    {origin endpoint : Cursor} (walk : RootResetEdgeSpine.Walks (rows program tree) origin endpoint) :
    ∃ ticks, ticks + upCost program tree * endpoint.focus.size ≤ upCost program tree * origin.focus.size ∧
      run (RootResetInverseEdgeSpine.machine (rows program tree)) ticks
        (RootResetInverseEdgeSpine.initial (rows program tree) endpoint) =
        RootResetInverseEdgeSpine.initial (rows program tree) origin := by
  induction walk with
  | done origin missed => exact ⟨0, by rw [Nat.zero_add]; exact Nat.le_refl _, rfl⟩
  | next origin after row selected followed rest ih =>
      obtain ⟨rowMember, matched⟩ := RootResetEdgeFragment.select_sound _ origin.focus row selected
      have found := RootResetCarrierInverseUnique.family_inverts program tree row rowMember origin after matched followed
      have smaller := RootResetEdgeFragment.follow_size_lt row.address origin after
        ((RootResetCarrierNonemptyRows.valid program tree row rowMember).1) followed
      obtain ⟨restTicks, restBound, restRun⟩ := ih
      have edgeBound : RootResetInverseEdgeSpine.familyTicks (rows program tree) after + 2 ≤ upCost program tree :=
        Nat.add_le_add_right (RootResetInverseEdgeSpine.familyTicks_bound _ _) 2
      refine ⟨restTicks + (RootResetInverseEdgeSpine.familyTicks (rows program tree) after + 2), ?_, ?_⟩
      · calc
          _ = (restTicks + upCost program tree * _) + (RootResetInverseEdgeSpine.familyTicks (rows program tree) after + 2) := by
            simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
          _ ≤ upCost program tree * after.focus.size + upCost program tree := Nat.add_le_add restBound edgeBound
          _ = upCost program tree * (after.focus.size + 1) := by rw [Nat.mul_add, Nat.mul_one]
          _ ≤ upCost program tree * origin.focus.size := Nat.mul_le_mul_left _ smaller
      · rw [run_add, restRun]
        exact RootResetInverseEdgeSpine.selected_runs _ after origin found

def localBudget (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (size : Nat) : Nat :=
  downCost program tree * (size + 1) + liveBound + upCost program tree * size +
    upCost program tree + upCost program tree + 3

theorem after_edge (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin after : Cursor) (row : RootResetCarrierEdgePatterns.EdgeRow)
    (selected : RootResetEdgeFragment.select (rows program tree) origin.focus = some row)
    (followed : RootResetEdgeFragment.follow row.address origin = some after)
    (boundary : RootResetCarrierScanParentBoundary.carrierParent? origin.parents.head? = false) :
    ∃ ticks descended, ticks ≤ localBudget program tree after.focus.size ∧
      run (RootResetCarrierNonemptyProbe.machine program tree) ticks
        (RootResetCarrierNonemptyProbe.initial program tree origin) =
        ⟨some (.done (RootResetCarrierNonemptyAgreement.isLive? descended.focus)), origin⟩ ∧
      RootResetEdgeSpine.Walks (rows program tree) after descended := by
  obtain ⟨rowMember, matched⟩ := RootResetEdgeFragment.select_sound _ origin.focus row selected
  have proper := (RootResetCarrierNonemptyRows.valid program tree row rowMember).1
  obtain ⟨downTicks, descended, noMember, downBound, downRun, downWalk⟩ :=
    RootResetEdgeSpine.scan_within (rows program tree) (RootResetCarrierNonemptyRows.valid program tree) after
  have downFirst := RootResetEdgeSpine.selected_runs (rows program tree) origin after row selected proper followed
  have downWhole : run (RootResetEdgeSpine.machine (rows program tree))
      (RootResetEdgeFragment.ticks (rows program tree) origin.focus + 1 + downTicks)
      (RootResetEdgeSpine.initial (rows program tree) origin) =
      ⟨some ⟨ProbeCompiler.Control.answer false, noMember⟩, descended⟩ := by
    rw [run_add, downFirst]
    exact downRun
  have wholeDownBound : RootResetEdgeFragment.ticks (rows program tree) origin.focus + 1 + downTicks ≤
      downCost program tree * (after.focus.size + 1) := by
    have combined := Nat.add_le_add (RootResetEdgeSpine.prefix_bound (rows program tree) origin.focus) downBound
    simpa only [Nat.mul_add, Nat.mul_one, Nat.add_comm] using combined
  obtain ⟨reverseTicks, reverseBound, reverseRun⟩ := reverse_runs program tree downWalk
  have reverseSmall : reverseTicks ≤ upCost program tree * after.focus.size :=
    Nat.le_trans (Nat.le_add_right _ _) reverseBound
  have back := RootResetCarrierInverseUnique.family_inverts program tree row rowMember origin after matched followed
  have backRun := RootResetInverseEdgeSpine.selected_runs (rows program tree) after origin back
  have missed := RootResetCarrierInverseBoundary.boundary_misses program tree origin boundary
  obtain ⟨upMember, finalRun⟩ := RootResetInverseEdgeSpine.missed_runs (rows program tree) origin missed
  have upWhole : run (RootResetInverseEdgeSpine.machine (rows program tree))
      (reverseTicks + (RootResetInverseEdgeSpine.familyTicks (rows program tree) after + 2) +
        RootResetInverseEdgeSpine.familyTicks (rows program tree) origin)
      (RootResetInverseEdgeSpine.initial (rows program tree) descended) =
      ⟨some ⟨ProbeCompiler.Control.answer false, upMember⟩, origin⟩ := by
    have firstTwo : run (RootResetInverseEdgeSpine.machine (rows program tree))
        (reverseTicks + (RootResetInverseEdgeSpine.familyTicks (rows program tree) after + 2))
        (RootResetInverseEdgeSpine.initial (rows program tree) descended) =
        RootResetInverseEdgeSpine.initial (rows program tree) origin := by
      rw [run_add, reverseRun]
      exact backRun
    rw [run_add, firstTwo]
    exact finalRun
  have wholeUpBound : reverseTicks + (RootResetInverseEdgeSpine.familyTicks (rows program tree) after + 2) +
      RootResetInverseEdgeSpine.familyTicks (rows program tree) origin ≤
      upCost program tree * after.focus.size + upCost program tree + upCost program tree := by
    apply Nat.add_le_add
    · exact Nat.add_le_add reverseSmall (Nat.add_le_add_right (RootResetInverseEdgeSpine.familyTicks_bound _ _) 2)
    · exact Nat.le_trans (RootResetInverseEdgeSpine.familyTicks_bound _ _) (Nat.le_add_right _ 2)
  obtain ⟨downUsed, downUsedBound, actualDown⟩ := RootResetCarrierNonemptyProbe.descending_runs program tree origin descended _ noMember downWhole
  obtain ⟨readUsed, readBound, actualRead⟩ := RootResetCarrierNonemptyProbe.reading_runs program tree descended
  obtain ⟨upUsed, upUsedBound, actualUp⟩ := RootResetCarrierNonemptyProbe.ascending_runs program tree _ descended origin _ upMember upWhole
  refine ⟨downUsed + 1 + (readUsed + 1) + (upUsed + 1), descended, ?_, ?_, downWalk⟩
  · have combined := Nat.add_le_add_right (Nat.add_le_add
        (Nat.add_le_add (Nat.le_trans downUsedBound wholeDownBound) readBound)
        (Nat.le_trans upUsedBound wholeUpBound)) 3
    simpa only [localBudget, show 3 = 1 + 1 + 1 by rfl, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using combined
  · have firstTwo : run (RootResetCarrierNonemptyProbe.machine program tree)
        (downUsed + 1 + (readUsed + 1)) (RootResetCarrierNonemptyProbe.initial program tree origin) =
        liftConfiguration (RootResetCarrierNonemptyProbe.Control.ascending (RootResetCarrierNonemptyAgreement.isLive? descended.focus))
          (RootResetInverseEdgeSpine.initial (edges program tree) descended) := by
      rw [run_add, actualDown]
      exact actualRead
    rw [run_add, firstTwo]
    exact actualUp


def coefficient (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  downCost program tree + liveBound + upCost program tree + upCost program tree + upCost program tree + 3

theorem localBudget_bound (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (size : Nat) :
    localBudget program tree size ≤ coefficient program tree * (size + 1) := by
  have constant (value : Nat) : value ≤ value * (size + 1) := by
    simpa only [Nat.mul_one] using Nat.mul_le_mul_left value (Nat.succ_le_succ (Nat.zero_le size))
  have combined := Nat.add_le_add
    (Nat.add_le_add (Nat.add_le_add
      (Nat.add_le_add (Nat.add_le_add (Nat.le_refl (downCost program tree * (size + 1))) (constant liveBound))
        (Nat.mul_le_mul_left (upCost program tree) (Nat.le_succ size))) (constant (upCost program tree)))
      (constant (upCost program tree))) (constant 3)
  simpa only [localBudget, coefficient, Nat.add_mul] using combined

theorem parsed_local (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin : Cursor) (view : CheckpointDecoder.LocalView program)
    (parsed : CheckpointDecoder.parseLocal? program tree origin.focus = some view)
    (boundary : RootResetCarrierScanParentBoundary.carrierParent? origin.parents.head? = false) :
    ∃ ticks answer, ticks ≤ coefficient program tree * (view.accumulator.size + 1) ∧
      run (RootResetCarrierNonemptyProbe.machine program tree) ticks
        (RootResetCarrierNonemptyProbe.initial program tree origin) = ⟨some (.done answer), origin⟩ := by
  obtain ⟨row, selected, addressEq⟩ := RootResetCarrierNonemptyAgreement.select_local parsed
  have subterm := RootResetCompletedFrontPreservation.localParsed_accumulator_subterm parsed
  rw [← addressEq] at subterm
  rcases origin with ⟨source, parents⟩
  obtain ⟨after, followed, focusEq⟩ := RootResetEdgeFragment.follow_exists row.address source view.accumulator subterm parents
  obtain ⟨ticks, descended, bounded, execution, down⟩ := after_edge program tree ⟨source, parents⟩ after row selected followed boundary
  have sizeBound := localBudget_bound program tree after.focus.size
  rw [focusEq] at sizeBound bounded
  exact ⟨ticks, _, Nat.le_trans bounded sizeBound, execution⟩

theorem accumulator_disjoint {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program tree source = some view) :
    view.accumulator.size + 1 + view.continuation.size ≤ source.size := by
  obtain ⟨halt, dispatcher, seedAudit, continuationAudit, _, _, shape⟩ := CheckpointDecoder.parseLocal?_sound parsed
  have subterm := RootResetCompletedFrontPreservation.localParsed_accumulator_subterm parsed
  rw [shape] at subterm ⊢
  change (Term.app (Term.app halt dispatcher) (Term.app (Term.app Term.s view.seedPayload) seedAudit)).subterm?
      ([.left, .right] ++ RootResetReachableStageGrammar.routeResponseAddress view.route ++
        ActionParser.accumulatorAddress (ActionParser.historyCount program view.label)) = some view.accumulator at subterm
  have leftBound := CarrierDecoder.subterm_size_le subterm
  have combined := Nat.add_le_add_right (Nat.add_le_add_right leftBound 1) view.continuation.size
  apply Nat.le_trans combined
  have extra := Nat.le_add_right
    ((Term.app (Term.app halt dispatcher) (Term.app (Term.app Term.s view.seedPayload) seedAudit)).size + 1 + view.continuation.size)
    (continuationAudit.size + 1)
  simpa only [CheckpointDecoder.openShell, Term.size, Nat.succ_eq_add_one, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using extra

end PureSFormal.Research.RootResetCarrierProbeLocalBound
