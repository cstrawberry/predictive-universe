import PureSFormal.Research.RootResetClockEulerSelector

/-!
# Linear certificate for the finite clock/Euler selector

Every root invocation of the clock parity probe completes within
`5 * (source.size + 1)` microinstructions. Its composition with the complete
Euler fallback completes within `34 * (source.size + 1)` microinstructions.

A fixed proof-level stopping time pads the absorbing halt and gives a
constructive `RootResetSelectorContract.Contract` for the existing 137-state
transition table. This component certificate does not supply the separate
agreement and phase-dispatch proof for the complete simulator.
-/

namespace PureSFormal.Research.RootResetClockEulerBound

open PureSFormal.PureS
open PureSFormal.PureS.FiniteController
open PureSFormal.PureS.SchedulerInvariant
open RootResetClockParityWalker

set_option maxHeartbeats 2000000

def WorkerWithin (pass : Pass) (bit : Bool) (term : Term)
    (parents : List ParentFrame) : Prop :=
  ∃ ticks final, ticks ≤ 2 * term.size + parents.length ∧
    run machine ticks ⟨some (.work .scan pass bit), ⟨term, parents⟩⟩ = final ∧
    WorkerAnswer pass bit ⟨term, parents⟩ final

theorem worker_mismatch_within (pass : Pass) (bit : Bool) (term : Term)
    (parents : List ParentFrame) (ticks depth : Nat)
    (failed : (run machine ticks ⟨some (.work .scan pass bit), ⟨term, parents⟩⟩).control =
      some .abort)
    (depthEq : (run machine ticks ⟨some (.work .scan pass bit),
      ⟨term, parents⟩⟩).cursor.parents.length = parents.length + depth)
    (budget : ticks + depth + 1 ≤ 2 * term.size) :
    WorkerWithin pass bit term parents := by
  let origin : Configuration Control := ⟨some (.work .scan pass bit), ⟨term, parents⟩⟩
  let after := run machine ticks origin
  have afterEq : after = ⟨some .abort, after.cursor⟩ :=
    congrArg (fun control => Configuration.mk control after.cursor) failed
  refine ⟨ticks + (after.cursor.parents.length + 1),
    ⟨some .miss, Cursor.atRoot origin.cursor.erase⟩, ?_, ?_, Or.inr rfl⟩
  · change ticks + ((run machine ticks origin).cursor.parents.length + 1) ≤ _
    rw [show (run machine ticks origin).cursor.parents.length = parents.length + depth
      from depthEq]
    simpa only [Nat.succ_eq_add_one, Nat.mul_add, Nat.add_mul, Nat.mul_one, Nat.zero_mul, Nat.zero_add, Nat.add_zero, Nat.add_assoc, Nat.add_left_comm, Nat.add_comm] using Nat.add_le_add_right budget parents.length
  · rw [run_add]
    change run machine (after.cursor.parents.length + 1) after = _
    rw [afterEq, run_abort]
    have preserved : after.cursor.erase = origin.cursor.erase := erase_run ticks origin
    rw [preserved]

theorem worker_within (pass : Pass) (bit : Bool) (term : Term)
    (parents : List ParentFrame) : WorkerWithin pass bit term parents := by
  induction term generalizing bit parents with
  | s =>
      exact worker_mismatch_within pass bit .s parents 1 0 rfl rfl (by decide)
  | app fn tail fnIH tailIH =>
      cases fn with
      | s =>
          apply worker_mismatch_within pass bit (.app .s tail) parents 2 1 rfl rfl
          simp only [Term.size]
          apply Nat.le.intro (k := 2 * tail.size)
          (try simp only [Nat.succ_eq_add_one, Nat.mul_add, Nat.add_mul, Nat.mul_one]) <;>
            (try simp only [Nat.succ_mul, Nat.zero_mul, Nat.zero_add, Nat.add_zero]) <;>
            (try simp only [Nat.add_assoc, Nat.add_left_comm, Nat.add_comm]) <;>
            (try simp only [Nat.succ_add, Nat.add_succ, Nat.zero_add, Nat.add_zero])
      | app head first =>
          cases head with
          | app left right =>
              apply worker_mismatch_within pass bit
                _ parents 3 2 rfl rfl
              simp only [Term.size]
              apply Nat.le.intro (k := 2 * (left.size + right.size + first.size + tail.size))
              (try simp only [Nat.succ_eq_add_one, Nat.mul_add, Nat.add_mul, Nat.mul_one]) <;>
                (try simp only [Nat.succ_mul, Nat.zero_mul, Nat.zero_add, Nat.add_zero]) <;>
                (try simp only [Nat.add_assoc, Nat.add_left_comm, Nat.add_comm]) <;>
                (try simp only [Nat.succ_add, Nat.add_succ, Nat.zero_add, Nat.add_zero])
          | s =>
              cases first with
              | s =>
                  obtain ⟨ticks, final, bound, execution, answer⟩ :=
                    tailIH (!bit) (.right b :: parents)
                  refine ⟨7 + ticks, final, ?_, ?_, ?_⟩
                  · simp only [Term.size, List.length_cons] at *
                    dsimp [b] at bound ⊢
                    have calculated := Nat.add_le_add_left bound 7; simp only [Nat.succ_eq_add_one, Nat.mul_add, Nat.add_mul, Nat.mul_one, Nat.zero_mul, Nat.zero_add, Nat.add_zero, Nat.add_assoc, Nat.add_left_comm, Nat.add_comm] at calculated ⊢; simpa only [Nat.succ_add, Nat.add_succ, Nat.zero_add, Nat.add_zero] using calculated
                  · rw [run_add]
                    exact execution
                  · rcases answer with ⟨number, sourceEq, finalEq⟩ | mismatch
                    · refine Or.inl ⟨number + 1, ?_, ?_⟩
                      · change .app (.app .s .s) tail = C (number + 1)
                        rw [show tail = C number from sourceEq]
                        rfl
                      · rw [finalEq, xor_flip]
                        rfl
                    · exact Or.inr mismatch
              | app left right =>
                  cases left with
                  | app leftFn leftArg =>
                      apply worker_mismatch_within pass bit _ parents 6 3 rfl rfl
                      simp only [Term.size]
                      apply Nat.le.intro (k := 2 * (leftFn.size + leftArg.size + right.size + tail.size))
                      (try simp only [Nat.succ_eq_add_one, Nat.mul_add, Nat.add_mul, Nat.mul_one]) <;>
                        (try simp only [Nat.succ_mul, Nat.zero_mul, Nat.zero_add, Nat.add_zero]) <;>
                        (try simp only [Nat.add_assoc, Nat.add_left_comm, Nat.add_comm]) <;>
                        (try simp only [Nat.succ_add, Nat.add_succ, Nat.zero_add, Nat.add_zero])
                  | s =>
                      cases right with
                      | app rightFn rightArg =>
                          apply worker_mismatch_within pass bit _ parents 8 3 rfl rfl
                          simp only [Term.size]
                          apply Nat.le.intro (k := 2 * (rightFn.size + rightArg.size + tail.size))
                          (try simp only [Nat.succ_eq_add_one, Nat.mul_add, Nat.add_mul, Nat.mul_one]) <;>
                            (try simp only [Nat.succ_mul, Nat.zero_mul, Nat.zero_add, Nat.add_zero]) <;>
                            (try simp only [Nat.add_assoc, Nat.add_left_comm, Nat.add_comm]) <;>
                            (try simp only [Nat.succ_add, Nat.add_succ, Nat.zero_add, Nat.add_zero])
                      | s =>
                          cases tail with
                          | s =>
                              apply worker_mismatch_within pass bit _ parents 12 1
                              · simp only [run, step, machine, transition, b, Probe.observeNode,
                                  Primitive.exec, Cursor.left?, Cursor.right?, Cursor.up?,
                                  ParentFrame.fill]
                              · simp only [run, step, machine, transition, b, Probe.observeNode,
                                  Primitive.exec, Cursor.left?, Cursor.right?, Cursor.up?,
                                  ParentFrame.fill, List.length_cons]
                              · decide
                          | app left right =>
                              cases left with
                              | app leftFn leftArg =>
                                  apply worker_mismatch_within pass bit _ parents 13 2
                                  · simp only [run, step, machine, transition, b, Probe.observeNode,
                                      Primitive.exec, Cursor.left?, Cursor.right?, Cursor.up?,
                                      ParentFrame.fill]
                                  · simp only [run, step, machine, transition, b, Probe.observeNode,
                                      Primitive.exec, Cursor.left?, Cursor.right?, Cursor.up?,
                                      ParentFrame.fill, List.length_cons]
                                  · (try simp only [Term.size])
                                    apply Nat.le.intro (k := 2 * (leftFn.size + leftArg.size + right.size))
                                    (try simp only [Nat.succ_eq_add_one, Nat.mul_add, Nat.add_mul, Nat.mul_one]) <;>
                                      (try simp only [Nat.succ_mul, Nat.zero_mul, Nat.zero_add, Nat.add_zero]) <;>
                                      (try simp only [Nat.add_assoc, Nat.add_left_comm, Nat.add_comm]) <;>
                                      (try simp only [Nat.succ_add, Nat.add_succ, Nat.zero_add, Nat.add_zero])
                              | s =>
                                  cases right with
                                  | app rightFn rightArg =>
                                      apply worker_mismatch_within pass bit _ parents 15 2
                                      · simp only [run, step, machine, transition, b, Probe.observeNode,
                                          Primitive.exec, Cursor.left?, Cursor.right?, Cursor.up?,
                                          ParentFrame.fill]
                                      · simp only [run, step, machine, transition, b, Probe.observeNode,
                                          Primitive.exec, Cursor.left?, Cursor.right?, Cursor.up?,
                                          ParentFrame.fill, List.length_cons]
                                      · (try simp only [Term.size])
                                        apply Nat.le.intro (k := 2 * (rightFn.size + rightArg.size))
                                        (try simp only [Nat.succ_eq_add_one, Nat.mul_add, Nat.add_mul, Nat.mul_one]) <;>
                                          (try simp only [Nat.succ_mul, Nat.zero_mul, Nat.zero_add, Nat.add_zero]) <;>
                                          (try simp only [Nat.add_assoc, Nat.add_left_comm, Nat.add_comm]) <;>
                                          (try simp only [Nat.succ_add, Nat.add_succ, Nat.zero_add, Nat.add_zero])
                                  | s =>
                                      refine ⟨numeralTicks 0 parents.length,
                                        ⟨some (.done pass (RootResetClockParityWalker.xor bit (parity 0))),
                                          Cursor.atRoot (Cursor.rebuild parents (C 0))⟩,
                                        ?_, run_numeral pass bit 0 parents,
                                        Or.inl ⟨0, rfl, rfl⟩⟩
                                      simp [numeralTicks, C, b, Term.size]
                                      apply Nat.le.intro (k := 1)
                                      (try simp only [Nat.succ_eq_add_one, Nat.mul_add, Nat.add_mul, Nat.mul_one]) <;>
                                        (try simp only [Nat.succ_mul, Nat.zero_mul, Nat.zero_add, Nat.add_zero]) <;>
                                        (try simp only [Nat.add_assoc, Nat.add_left_comm, Nat.add_comm]) <;>
                                        (try simp only [Nat.succ_add, Nat.add_succ, Nat.zero_add, Nat.add_zero])

def FindWithin (bit : Bool) (term : Term) (parents : List ParentFrame) : Prop :=
  ∃ ticks final, ticks ≤ 2 * term.size + parents.length ∧
    run machine ticks ⟨some (.find .scan bit), ⟨term, parents⟩⟩ = final ∧
    ((∃ result, final = ⟨some (.done .second result),
        Cursor.atRoot (Cursor.rebuild parents term)⟩) ∨
      final = ⟨some .miss, Cursor.atRoot (Cursor.rebuild parents term)⟩)

theorem find_within (bit : Bool) (term : Term) (parents : List ParentFrame) :
    FindWithin bit term parents := by
  induction term generalizing parents with
  | s =>
      refine ⟨1 + (parents.length + 1),
        ⟨some .miss, Cursor.atRoot (Cursor.rebuild parents .s)⟩,
        ?_, ?_, Or.inr rfl⟩
      · simp [Term.size]
        apply Nat.le.intro (k := 0)
        (try simp only [Nat.succ_eq_add_one, Nat.mul_add, Nat.add_mul, Nat.mul_one]) <;>
          (try simp only [Nat.succ_mul, Nat.zero_mul, Nat.zero_add, Nat.add_zero]) <;>
          (try simp only [Nat.add_assoc, Nat.add_left_comm, Nat.add_comm]) <;>
          (try simp only [Nat.succ_add, Nat.add_succ, Nat.zero_add, Nat.add_zero])
      · rw [run_add]; exact run_abort ⟨.s, parents⟩
  | app fn arg fnIH argIH =>
      cases fn with
      | s =>
          refine ⟨2 + ((.left arg :: parents).length + 1),
            ⟨some .miss, Cursor.atRoot (Cursor.rebuild parents (.app .s arg))⟩,
            ?_, ?_, Or.inr rfl⟩
          · (try simp only [Term.size, List.length_cons])
            apply Nat.le.intro (k := 2 * arg.size)
            (try simp only [Nat.succ_eq_add_one, Nat.mul_add, Nat.add_mul, Nat.mul_one]) <;>
              (try simp only [Nat.succ_mul, Nat.zero_mul, Nat.zero_add, Nat.add_zero]) <;>
              (try simp only [Nat.add_assoc, Nat.add_left_comm, Nat.add_comm]) <;>
              (try simp only [Nat.succ_add, Nat.add_succ, Nat.zero_add, Nat.add_zero])
          · rw [run_add]; exact run_abort ⟨.s, .left arg :: parents⟩
      | app head field =>
          cases head with
          | s =>
              obtain ⟨ticks, final, bound, execution, answer⟩ :=
                argIH (.right (.app .s field) :: parents)
              refine ⟨5 + ticks, final, ?_, ?_, answer⟩
              · have positive := Term.size_pos field
                simp only [Term.size, List.length_cons] at *
                apply Nat.le_trans (Nat.add_le_add_left bound 5)
                apply Nat.le.intro (k := 2 * field.size)
                (try simp only [Nat.succ_eq_add_one, Nat.mul_add, Nat.add_mul, Nat.mul_one]) <;>
                  (try simp only [Nat.succ_mul, Nat.zero_mul, Nat.zero_add, Nat.add_zero]) <;>
                  (try simp only [Nat.add_assoc, Nat.add_left_comm, Nat.add_comm]) <;>
                  (try simp only [Nat.succ_add, Nat.add_succ, Nat.zero_add, Nat.add_zero])
              · rw [run_add, run_find_wrapper, execution]
          | app left right =>
              obtain ⟨ticks, final, bound, execution, answer⟩ :=
                worker_within .second bit arg
                  (.right (.app (.app left right) field) :: parents)
              refine ⟨5 + ticks, final, ?_, ?_, ?_⟩
              · simp only [Term.size, List.length_cons] at *
                apply Nat.le_trans (Nat.add_le_add_left bound 5)
                apply Nat.le.intro (k := 2 * (left.size + right.size + field.size))
                (try simp only [Nat.succ_eq_add_one, Nat.mul_add, Nat.add_mul, Nat.mul_one]) <;>
                  (try simp only [Nat.succ_mul, Nat.zero_mul, Nat.zero_add, Nat.add_zero]) <;>
                  (try simp only [Nat.add_assoc, Nat.add_left_comm, Nat.add_comm]) <;>
                  (try simp only [Nat.succ_add, Nat.add_succ, Nat.zero_add, Nat.add_zero])
              · rw [run_add]; exact execution
              · rcases answer with ⟨number, _, result⟩ | missed
                · exact Or.inl ⟨RootResetClockParityWalker.xor bit (parity number), result⟩
                · exact Or.inr missed

namespace G
abbrev Control := RootResetClockGrowthWalker.Control
abbrev machine := RootResetClockGrowthWalker.machine
abbrev initial := RootResetClockGrowthWalker.initial
abbrev Ready := RootResetClockGrowthWalker.Ready
end G

def GrowthWithin (term : Term) (parents : List ParentFrame) : Prop :=
  ∃ ticks final, ticks ≤ 2 * term.size + parents.length ∧
    run G.machine ticks ⟨some .scan, ⟨term, parents⟩⟩ = final ∧
    (G.Ready final ∨ final = ⟨some .miss, Cursor.atRoot (Cursor.rebuild parents term)⟩)

theorem growth_mismatch_within (term : Term) (parents : List ParentFrame) (ticks depth : Nat)
    (failed : (run G.machine ticks ⟨some .scan, ⟨term, parents⟩⟩).control = some .abort)
    (depthEq : (run G.machine ticks ⟨some .scan,
      ⟨term, parents⟩⟩).cursor.parents.length = parents.length + depth)
    (budget : ticks + depth + 1 ≤ 2 * term.size) : GrowthWithin term parents := by
  let origin : Configuration G.Control := ⟨some .scan, ⟨term, parents⟩⟩
  let after := run G.machine ticks origin
  have afterEq : after = ⟨some .abort, after.cursor⟩ :=
    congrArg (fun control => Configuration.mk control after.cursor) failed
  refine ⟨ticks + (after.cursor.parents.length + 1),
    ⟨some .miss, Cursor.atRoot origin.cursor.erase⟩, ?_, ?_, Or.inr rfl⟩
  · change ticks + ((run G.machine ticks origin).cursor.parents.length + 1) ≤ _
    rw [show (run G.machine ticks origin).cursor.parents.length = parents.length + depth
      from depthEq]
    simpa only [Nat.succ_eq_add_one, Nat.mul_add, Nat.add_mul, Nat.mul_one, Nat.zero_mul, Nat.zero_add, Nat.add_zero, Nat.add_assoc, Nat.add_left_comm, Nat.add_comm] using Nat.add_le_add_right budget parents.length
  · rw [run_add]
    change run G.machine (after.cursor.parents.length + 1) after = _
    rw [afterEq, RootResetClockGrowthWalker.run_abort]
    have preserved : after.cursor.erase = origin.cursor.erase :=
      RootResetClockGrowthWalker.erase_run ticks origin
    rw [preserved]

theorem growth_scan_within (term : Term) (parents : List ParentFrame) :
    GrowthWithin term parents := by
  induction term generalizing parents with
  | s => exact growth_mismatch_within .s parents 1 0 rfl rfl (by decide)
  | app fn arg fnIH argIH =>
      cases fn with
      | s =>
          apply growth_mismatch_within _ parents 2 1 rfl rfl
          (try simp only [Term.size])
          apply Nat.le.intro (k := 2 * arg.size)
          (try simp only [Nat.succ_eq_add_one, Nat.mul_add, Nat.add_mul, Nat.mul_one]) <;>
            (try simp only [Nat.succ_mul, Nat.zero_mul, Nat.zero_add, Nat.add_zero]) <;>
            (try simp only [Nat.add_assoc, Nat.add_left_comm, Nat.add_comm]) <;>
            (try simp only [Nat.succ_add, Nat.add_succ, Nat.zero_add, Nat.add_zero])
      | app middle second =>
          cases middle with
          | s =>
              obtain ⟨ticks, final, bound, execution, answer⟩ :=
                argIH (.right (.app .s second) :: parents)
              refine ⟨5 + ticks, final, ?_, ?_, answer⟩
              · have positive := Term.size_pos second
                simp only [Term.size, List.length_cons] at *
                apply Nat.le_trans (Nat.add_le_add_left bound 5)
                apply Nat.le.intro (k := 2 * second.size)
                (try simp only [Nat.succ_eq_add_one, Nat.mul_add, Nat.add_mul, Nat.mul_one]) <;>
                  (try simp only [Nat.succ_mul, Nat.zero_mul, Nat.zero_add, Nat.add_zero]) <;>
                  (try simp only [Nat.add_assoc, Nat.add_left_comm, Nat.add_comm]) <;>
                  (try simp only [Nat.succ_add, Nat.add_succ, Nat.zero_add, Nat.add_zero])
              · rw [run_add, RootResetClockGrowthWalker.run_wrapper, execution]
          | app head first =>
              cases head with
              | s =>
                  cases first with
                  | s =>
                      refine ⟨8, ⟨some .positive, ⟨Term.redex .s second arg, parents⟩⟩,
                        ?_, RootResetClockGrowthWalker.run_leaf_redex second arg parents,
                        Or.inl ⟨Or.inr rfl, .s, second, arg, rfl⟩⟩
                      have positive := Term.size_pos second
                      (try simp only [Term.size])
                      apply Nat.le.intro (k := 2 + 2 * (second.size + arg.size) + parents.length)
                      (try simp only [Nat.succ_eq_add_one, Nat.mul_add, Nat.add_mul, Nat.mul_one]) <;>
                        (try simp only [Nat.succ_mul, Nat.zero_mul, Nat.zero_add, Nat.add_zero]) <;>
                        (try simp only [Nat.add_assoc, Nat.add_left_comm, Nat.add_comm]) <;>
                        (try simp only [Nat.succ_add, Nat.add_succ, Nat.zero_add, Nat.add_zero])
                  | app left right =>
                      refine ⟨8, ⟨some .zero,
                          ⟨Term.redex (.app left right) second arg, parents⟩⟩,
                        ?_, RootResetClockGrowthWalker.run_app_redex left right second arg parents,
                        Or.inl ⟨Or.inl rfl, .app left right, second, arg, rfl⟩⟩
                      (try simp only [Term.size])
                      apply Nat.le.intro (k := 2 + 2 * (left.size + right.size + second.size + arg.size) + parents.length)
                      (try simp only [Nat.succ_eq_add_one, Nat.mul_add, Nat.add_mul, Nat.mul_one]) <;>
                        (try simp only [Nat.succ_mul, Nat.zero_mul, Nat.zero_add, Nat.add_zero]) <;>
                        (try simp only [Nat.add_assoc, Nat.add_left_comm, Nat.add_comm]) <;>
                        (try simp only [Nat.succ_add, Nat.add_succ, Nat.zero_add, Nat.add_zero])
              | app left right =>
                  apply growth_mismatch_within _ parents 4 3 rfl rfl
                  (try simp only [Term.size])
                  apply Nat.le.intro (k := 2 * (left.size + right.size + first.size + second.size + arg.size))
                  (try simp only [Nat.succ_eq_add_one, Nat.mul_add, Nat.add_mul, Nat.mul_one]) <;>
                    (try simp only [Nat.succ_mul, Nat.zero_mul, Nat.zero_add, Nat.add_zero]) <;>
                    (try simp only [Nat.add_assoc, Nat.add_left_comm, Nat.add_comm]) <;>
                    (try simp only [Nat.succ_add, Nat.add_succ, Nat.zero_add, Nat.add_zero])

theorem growth_probe_within (source : Term) :
    ∃ ticks final, ticks ≤ 2 * source.size ∧ run G.machine ticks (G.initial source) = final ∧
      (G.Ready final ∨ final = ⟨some .miss, Cursor.atRoot source⟩) := by
  cases source with
  | s => exact ⟨2, ⟨some .miss, Cursor.atRoot .s⟩, Nat.le_refl _, rfl, Or.inr rfl⟩
  | app core environment =>
      obtain ⟨ticks, final, bound, execution, answer⟩ :=
        growth_scan_within core [.left environment]
      refine ⟨1 + ticks, final, ?_, ?_, answer⟩
      · simp only [Term.size, List.length_cons, List.length_nil] at *
        apply Nat.le_trans (Nat.add_le_add_left bound 1)
        apply Nat.le.intro (k := 2 * environment.size)
        (try simp only [Nat.succ_eq_add_one, Nat.mul_add, Nat.add_mul, Nat.mul_one]) <;>
          (try simp only [Nat.succ_mul, Nat.zero_mul, Nat.zero_add, Nat.add_zero]) <;>
          (try simp only [Nat.add_assoc, Nat.add_left_comm, Nat.add_comm]) <;>
          (try simp only [Nat.succ_add, Nat.add_succ, Nat.zero_add, Nat.add_zero])
      · rw [run_add, RootResetClockGrowthWalker.run_enter, execution]

theorem lifted_growth_within (source : Term) :
    ∃ ticks final, ticks ≤ 2 * source.size ∧
      run machine ticks ⟨some (.growth .enter), Cursor.atRoot source⟩ = final ∧
      RootResetClockParityTotality.Answer source final := by
  obtain ⟨ticks, final, bound, execution, answer⟩ := growth_probe_within source
  refine ⟨ticks, liftGrowthConfiguration final, bound, ?_, ?_⟩
  · change run machine ticks (liftGrowthConfiguration (G.initial source)) = _
    rw [run_liftGrowth, execution]
  · rcases answer with ⟨accepted, redex⟩ | missed
    · apply Or.inl
      refine ⟨?_, redex⟩
      rcases accepted with zero | positive
      · exact Or.inl (congrArg liftGrowthRuntime zero)
      · exact Or.inr (Or.inl (congrArg liftGrowthRuntime positive))
    · rw [missed]
      exact Or.inr ⟨Or.inr rfl, rfl⟩


theorem second_within (bit : Bool) (first second third : Term) :
    ∃ ticks final, ticks ≤ 2 * second.size + 9 + 2 * (Term.redex first second third).size ∧
      run machine ticks ⟨some (.find .enter bit),
        Cursor.atRoot (Term.redex first second third)⟩ = final ∧
      RootResetClockParityTotality.Answer (Term.redex first second third) final := by
  obtain ⟨ticks, after, bound, execution, answer⟩ :=
    find_within bit second [.right (.app .s first), .left third]
  have prefixRun : run machine (6 + ticks)
      ⟨some (.find .enter bit), Cursor.atRoot (Term.redex first second third)⟩ = after := by
    change run machine ((1 + 5) + ticks) _ = _
    rw [Nat.add_assoc, run_add]
    change run machine (5 + ticks)
      ⟨some (.find .scan bit), ⟨.app (.app .s first) second, [.left third]⟩⟩ = _
    rw [run_add, run_find_wrapper, execution]
  rcases answer with ⟨result, finished⟩ | missed
  · cases result with
    | false =>
        obtain ⟨suffix, final, suffixBound, suffixRun, answer⟩ :=
          lifted_growth_within (Term.redex first second third)
        refine ⟨(6 + ticks) + (1 + suffix), final, ?_, ?_, answer⟩
        · simp only [List.length_cons, List.length_nil] at bound; have calculated := Nat.add_le_add (Nat.add_le_add_left bound 6) (Nat.add_le_add_left suffixBound 1); simp only [Nat.succ_eq_add_one, Nat.mul_add, Nat.add_mul, Nat.mul_one, Nat.zero_mul, Nat.zero_add, Nat.add_zero, Nat.add_assoc, Nat.add_left_comm, Nat.add_comm] at calculated ⊢; simpa only [Nat.succ_add, Nat.add_succ, Nat.zero_add, Nat.add_zero] using calculated
        · rw [run_add, prefixRun, finished, run_add]
          exact suffixRun
    | true =>
        refine ⟨(6 + ticks) + 1,
          ⟨some .launch, Cursor.atRoot (Term.redex first second third)⟩,
          ?_, ?_, Or.inl ⟨Or.inr (Or.inr rfl), first, second, third, rfl⟩⟩
        · simp only [List.length_cons, List.length_nil] at bound
          apply Nat.le_trans (Nat.add_le_add_right (Nat.add_le_add_left bound 6) 1)
          apply Nat.le.intro (k := 2 * (Term.redex first second third).size)
          (try simp only [Nat.succ_eq_add_one, Nat.mul_add, Nat.add_mul, Nat.mul_one]) <;>
            (try simp only [Nat.succ_mul, Nat.zero_mul, Nat.zero_add, Nat.add_zero]) <;>
            (try simp only [Nat.add_assoc, Nat.add_left_comm, Nat.add_comm]) <;>
            (try simp only [Nat.succ_add, Nat.add_succ, Nat.zero_add, Nat.add_zero])
        · rw [run_add, prefixRun, finished]; rfl
  · refine ⟨6 + ticks, after, ?_, prefixRun, ?_⟩
    · simp only [List.length_cons, List.length_nil] at bound
      apply Nat.le_trans (Nat.add_le_add_left bound 6)
      apply Nat.le.intro (k := 1 + 2 * (Term.redex first second third).size)
      (try simp only [Nat.succ_eq_add_one, Nat.mul_add, Nat.add_mul, Nat.mul_one]) <;>
        (try simp only [Nat.succ_mul, Nat.zero_mul, Nat.zero_add, Nat.add_zero]) <;>
        (try simp only [Nat.add_assoc, Nat.add_left_comm, Nat.add_comm]) <;>
        (try simp only [Nat.succ_add, Nat.add_succ, Nat.zero_add, Nat.add_zero])
    · rw [missed]; exact Or.inr ⟨Or.inl rfl, rfl⟩

namespace Arith
set_option maxHeartbeats 100000

theorem five (a b c t u : Nat) (ha : 0 < a) (h : t ≤ 2*a+3)
    (hu : u ≤ 2*b+9+2*(a+b+c+4)) : 5+t+(1+u) ≤ 5*(a+b+c+5) := by
  apply Nat.le_trans (Nat.add_le_add (Nat.add_le_add_left h 5) (Nat.add_le_add_left hu 1))
  obtain ⟨x,hx⟩ := Nat.exists_eq_add_of_le ha
  rw [hx]
  apply Nat.le.intro (k := x+b+3*c)
  (try simp only [Nat.succ_eq_add_one, Nat.mul_add, Nat.add_mul, Nat.mul_one]) <;>
    (try simp only [Nat.succ_mul, Nat.zero_mul, Nat.zero_add, Nat.add_zero]) <;>
    (try simp only [Nat.add_assoc, Nat.add_left_comm, Nat.add_comm]) <;>
    simp only [Nat.succ_add, Nat.add_succ, Nat.zero_add, Nat.add_zero]

theorem restart (n t : Nat) (bound : t ≤ 2*(n+4)) : 4+(4+t) ≤ 5*(n+5) := by
  apply Nat.le_trans (Nat.add_le_add_left (Nat.add_le_add_left bound 4) 4)
  apply Nat.le.intro (k := 3*n+9)
  (try simp only [Nat.succ_eq_add_one, Nat.mul_add, Nat.add_mul, Nat.mul_one]) <;>
    (try simp only [Nat.succ_mul, Nat.zero_mul, Nat.zero_add, Nat.add_zero]) <;>
    (try simp only [Nat.add_assoc, Nat.add_left_comm, Nat.add_comm]) <;>
    simp only [Nat.succ_add, Nat.add_succ, Nat.zero_add, Nat.add_zero]

theorem missed (a b c t : Nat) (bound : t ≤ 2*a+3) : 5+t ≤ 5*(a+b+c+5) := by
  apply Nat.le_trans (Nat.add_le_add_left bound 5)
  apply Nat.le.intro (k := 3*a+5*(b+c)+17)
  (try simp only [Nat.succ_eq_add_one, Nat.mul_add, Nat.add_mul, Nat.mul_one]) <;>
    (try simp only [Nat.succ_mul, Nat.zero_mul, Nat.zero_add, Nat.add_zero]) <;>
    (try simp only [Nat.add_assoc, Nat.add_left_comm, Nat.add_comm]) <;>
    simp only [Nat.succ_add, Nat.add_succ, Nat.zero_add, Nat.add_zero]

theorem composeSuccess (n t : Nat) (bound : t ≤ 5*(n+1)) : t+2 ≤ 34*(n+1) := by
  have room : 2 ≤ 29*(n+1) := Nat.le_trans (by decide : 2 ≤ 29)
    (by simpa only [Nat.mul_one] using Nat.mul_le_mul_left 29 (Nat.le_add_left 1 n))
  simpa only [← Nat.add_mul] using Nat.add_le_add bound room

theorem composeFallback (n t u : Nat) (bound : t ≤ 5*(n+1)) (euler : u ≤ 28*(n+1)) :
    t+(1+u) ≤ 34*(n+1) := by
  have room : 1 ≤ n+1 := Nat.le_add_left 1 n
  have combined := Nat.add_le_add bound (Nat.add_le_add room euler)
  calc
    t+(1+u) ≤ 5*(n+1)+((n+1)+28*(n+1)) := combined
    _ = 34*(n+1) := by
      rw [Nat.add_comm (n+1) (28*(n+1)), ← Nat.succ_mul, ← Nat.add_mul]
end Arith


theorem probe_within (source : Term) :
    ∃ ticks final, ticks ≤ 5 * (source.size + 1) ∧
      run machine ticks (initial source) = final ∧
        RootResetClockParityTotality.Answer source final := by
  cases source with
  | s =>
      exact ⟨2, ⟨some .miss, Cursor.atRoot .s⟩, by decide, rfl,
        Or.inr ⟨Or.inl rfl, rfl⟩⟩
  | app core environment =>
      cases core with
      | s =>
          refine ⟨4, ⟨some .miss, Cursor.atRoot (.app .s environment)⟩,
            ?_, rfl, Or.inr ⟨Or.inl rfl, rfl⟩⟩
          (try simp only [Term.size])
          apply Nat.le.intro (k := 5 * environment.size + 11)
          (try simp only [Nat.succ_eq_add_one, Nat.mul_add, Nat.add_mul, Nat.mul_one]) <;>
            (try simp only [Nat.succ_mul, Nat.zero_mul, Nat.zero_add, Nat.add_zero]) <;>
            (try simp only [Nat.add_assoc, Nat.add_left_comm, Nat.add_comm]) <;>
            (try simp only [Nat.succ_add, Nat.add_succ, Nat.zero_add, Nat.add_zero])
      | app fn body =>
          cases fn with
          | s =>
              refine ⟨6, ⟨some .miss, Cursor.atRoot (.app (.app .s body) environment)⟩,
                ?_, rfl, Or.inr ⟨Or.inl rfl, rfl⟩⟩
              (try simp only [Term.size])
              apply Nat.le.intro (k := 5 * (body.size + environment.size) + 14)
              (try simp only [Nat.succ_eq_add_one, Nat.mul_add, Nat.add_mul, Nat.mul_one]) <;>
                (try simp only [Nat.succ_mul, Nat.zero_mul, Nat.zero_add, Nat.add_zero]) <;>
                (try simp only [Nat.add_assoc, Nat.add_left_comm, Nat.add_comm]) <;>
                (try simp only [Nat.succ_add, Nat.add_succ, Nat.zero_add, Nat.add_zero])
          | app head field =>
              cases head with
              | app left right =>
                  let source : Term := .app (.app (.app (.app left right) field) body) environment
                  let cursor : Cursor :=
                    ⟨.app left right, [.left field, .left body, .left environment]⟩
                  obtain ⟨ticks, final, bound, execution, answer⟩ := lifted_growth_within source
                  refine ⟨4 + ((cursor.parents.length + 1) + ticks), final, ?_, ?_, answer⟩
                  · dsimp [cursor, source] at *
                    have reducedBound : ticks ≤ 2 * (left.size + right.size + field.size + body.size + environment.size + 4) := by
                      have normalized := bound
                      simp only [Nat.succ_eq_add_one, Nat.add_assoc, Nat.add_left_comm, Nat.add_comm] at normalized ⊢
                      simpa only [Nat.succ_add, Nat.add_succ, Nat.zero_add, Nat.add_zero] using normalized
                    have normalized := Arith.restart (left.size + right.size + field.size + body.size + environment.size) ticks reducedBound
                    simp only [Nat.succ_eq_add_one, Nat.add_assoc, Nat.add_left_comm, Nat.add_comm] at normalized ⊢
                    simpa only [Nat.succ_add, Nat.add_succ, Nat.zero_add, Nat.add_zero] using normalized
                  · rw [run_add]
                    change run machine ((cursor.parents.length + 1) + ticks)
                      ⟨some .restartGrowth, cursor⟩ = final
                    rw [run_add, RootResetClockParityTotality.run_restartGrowth]
                    exact execution
              | s =>
                  obtain ⟨ticks, after, bound, execution, answer⟩ :=
                    worker_within .first false field
                      [.right .s, .left body, .left environment]
                  have prefixRun : run machine (5 + ticks)
                      (initial (Term.redex field body environment)) = after := by
                    rw [run_add]; exact execution
                  rcases answer with ⟨number, _, finished⟩ | missed
                  · obtain ⟨suffix, final, suffixBound, suffixRun, finalAnswer⟩ :=
                      second_within (RootResetClockParityWalker.xor false (parity number))
                        field body environment
                    refine ⟨(5 + ticks) + (1 + suffix), final, ?_, ?_, finalAnswer⟩
                    · have fp := Term.size_pos field
                      have bp := Term.size_pos body
                      have ep := Term.size_pos environment
                      simp only [Term.redex, Term.size, List.length_cons, List.length_nil] at *
                      have reducedSuffix : suffix ≤ 2 * body.size + 9 + 2 * (field.size + body.size + environment.size + 4) := by
                        have normalized := suffixBound
                        simp only [Nat.succ_eq_add_one, Nat.add_assoc, Nat.add_left_comm, Nat.add_comm] at normalized ⊢
                        simpa only [Nat.succ_add, Nat.add_succ, Nat.zero_add, Nat.add_zero] using normalized
                      have normalized := Arith.five field.size body.size environment.size ticks suffix fp bound reducedSuffix
                      simp only [Nat.succ_eq_add_one, Nat.add_assoc, Nat.add_left_comm, Nat.add_comm] at normalized ⊢
                      simpa only [Nat.succ_add, Nat.add_succ, Nat.zero_add, Nat.add_zero] using normalized
                    · change run machine ((5 + ticks) + (1 + suffix))
                        (initial (Term.redex field body environment)) = final
                      rw [run_add, prefixRun, finished, run_add]; exact suffixRun
                  · refine ⟨5 + ticks, after, ?_, prefixRun, ?_⟩
                    · simp only [Term.redex, Term.size, List.length_cons, List.length_nil] at *
                      have normalized := Arith.missed field.size body.size environment.size ticks bound
                      simp only [Nat.succ_eq_add_one, Nat.add_assoc, Nat.add_left_comm, Nat.add_comm] at normalized ⊢
                      simpa only [Nat.succ_add, Nat.add_succ, Nat.zero_add, Nat.add_zero] using normalized
                    · rw [missed]; exact Or.inr ⟨Or.inl rfl, rfl⟩

namespace Composed
open RootResetClockEulerSelector
open RootResetSelectorContract

local instance terminalDecidable (configuration : Configuration Parity.Control) :
    Decidable (RootResetClockParityTotality.Terminal configuration) := by
  unfold RootResetClockParityTotality.Terminal
  infer_instance

theorem reaches_boundary_within (ticks : Nat) (origin : Configuration Parity.Control)
    (finished : RootResetClockParityTotality.Terminal (run Parity.machine ticks origin)) :
    ∃ count, count ≤ ticks ∧
      RootResetClockParityTotality.Terminal (run Parity.machine count origin) ∧
      run RootResetClockEulerSelector.machine count (liftConfiguration .probe origin) =
        liftConfiguration .probe (run Parity.machine count origin) ∧
      runMutationCount RootResetClockEulerSelector.machine count (liftConfiguration .probe origin) = 0 := by
  induction ticks generalizing origin with
  | zero => exact ⟨0, Nat.le_refl _, finished, rfl, rfl⟩
  | succ ticks ih =>
      by_cases terminal : RootResetClockParityTotality.Terminal origin
      · exact ⟨0, Nat.zero_le _, terminal, rfl, rfl⟩
      · obtain ⟨count, bound, terminal, execution, mutations⟩ :=
          ih (step Parity.machine origin) finished
        refine ⟨count + 1, Nat.succ_le_succ bound, terminal, ?_, ?_⟩
        · rw [run_succ, step_liftProbe origin ‹_›, execution]; rfl
        · rw [runMutationCount, mutationCount_probe, step_liftProbe origin ‹_›,
            mutations, Nat.zero_add]
theorem invocation_within (source : Term) :
    ∃ ticks final, ticks ≤ 34 * (source.size + 1) ∧ run RootResetClockEulerSelector.machine ticks (RootResetClockEulerSelector.initial source) = final ∧ Result source ticks final := by
  obtain ⟨doneTicks, done, doneBound, execution, answer⟩ :=
    probe_within source
  have completed : RootResetClockParityTotality.Terminal
      (run Parity.machine doneTicks (Parity.initial source)) := by
    rw [execution]
    exact answer.terminal
  obtain ⟨ticks, tickBound, terminal, prefixRun, prefixMutations⟩ :=
    reaches_boundary_within doneTicks (Parity.initial source) completed
  let after := run Parity.machine ticks (Parity.initial source)
  have afterAnswer : RootResetClockParityTotality.Answer source after :=
    RootResetClockParityTotality.terminal_answer source ticks terminal
  have prefixExecution : run RootResetClockEulerSelector.machine ticks (RootResetClockEulerSelector.initial source) =
      liftConfiguration .probe after := prefixRun
  have prefixZero : runMutationCount RootResetClockEulerSelector.machine ticks (RootResetClockEulerSelector.initial source) = 0 := prefixMutations
  rcases afterAnswer with ⟨accepted, first, second, third, focusEq⟩ | ⟨missed, restored⟩
  · have selected : ∃ state, after.control = some state ∧ handoff state = some .contract := by
      rcases accepted with h | h | h
      · exact ⟨.growth .zero, h, rfl⟩
      · exact ⟨.growth .positive, h, rfl⟩
      · exact ⟨.launch, h, rfl⟩
    obtain ⟨state, stateEq, boundary⟩ := selected
    have afterEq : liftConfiguration .probe after =
        ⟨some (.probe state), ⟨Term.redex first second third, after.cursor.parents⟩⟩ := by
      rcases after with ⟨control, ⟨focus, parents⟩⟩
      simp_all [liftConfiguration]
    let final : Configuration RootResetClockEulerSelector.Control :=
      ⟨some (.euler .doneRedex),
        ⟨Term.contractum first second third, after.cursor.parents⟩⟩
    refine ⟨ticks + 2, final, ?_, ?_, Or.inr ⟨rfl, ?_, ?_⟩⟩
    · exact Arith.composeSuccess source.size ticks (Nat.le_trans tickBound doneBound)
    · rw [run_add, prefixExecution, afterEq, success_suffix state boundary]
    · have preserved : after.cursor.erase = source := by
        exact RootResetClockParityWalker.erase_run ticks (Parity.initial source)
      have contracts := contractAt?_cursorAddress after.cursor
      rw [focusEq, Term.contractRoot?_redex, preserved] at contracts
      exact contracts
    · rw [runMutationCount_add, prefixZero, prefixExecution, afterEq,
        success_suffix_mutations state boundary, Nat.zero_add]
  · have selected : ∃ state, after.control = some state ∧ handoff state = some .visit := by
      rcases missed with h | h
      · exact ⟨.miss, h, rfl⟩
      · exact ⟨.growth .miss, h, rfl⟩
    obtain ⟨state, stateEq, boundary⟩ := selected
    have afterEq : liftConfiguration .probe after =
        ⟨some (.probe state), Cursor.atRoot source⟩ := by
      simp [liftConfiguration, stateEq, restored]
    let suffix := 1 + (RootResetEulerWalker.rootExecution source).ticks
    let final := liftConfiguration .euler (RootResetEulerWalker.rootExecution source).final
    have countEq : runMutationCount RootResetClockEulerSelector.machine (ticks + suffix) (RootResetClockEulerSelector.initial source) =
        RootResetEulerWalker.terminalMutationCount
          (RootResetEulerWalker.rootExecution source).final.control := by
      rw [runMutationCount_add, prefixZero, prefixExecution, afterEq, Nat.zero_add]
      exact failure_suffix_mutations state boundary source
    refine ⟨ticks + suffix, final, ?_, ?_, ?_⟩
    · have eulerBound := RootResetEulerWalker.rootExecution_ticks_le source
      exact Arith.composeFallback source.size ticks _ (Nat.le_trans tickBound doneBound) eulerBound
    · rw [run_add, prefixExecution, afterEq]
      exact failure_suffix state boundary source
    · rcases RootResetEulerWalker.rootExecution_certificate source with
        ⟨normal, normalProof, preserved⟩ | ⟨redex, contracts⟩
      · refine Or.inl ⟨?_, normalProof, preserved, ?_⟩
        · exact congrArg (Option.map Control.euler) normal
        · rw [countEq, normal]
          rfl
      · refine Or.inr ⟨?_, contracts, ?_⟩
        · exact congrArg (Option.map Control.euler) redex
        · rw [countEq, redex]
          rfl



abbrev composedMachine := RootResetClockEulerSelector.machine
abbrev composedInitial := RootResetClockEulerSelector.initial
abbrev ComposedControl := RootResetClockEulerSelector.Control

def haltKind : ComposedControl → Option HaltKind
  | .euler .doneNF => some .nf
  | .euler .doneRedex => some .redex
  | _ => none

theorem terminal_absorbing (state : ComposedControl) (node : Probe.NodeKind)
    (incoming : Probe.Incoming) (halted : (haltKind state).isSome = true) :
    composedMachine.transition state node incoming = .stay state := by
  cases state with
  | probe state => cases halted
  | euler state => cases state <;> first | rfl | cases halted

theorem terminal_run (ticks : Nat) (configuration : Configuration ComposedControl)
    (terminal : configuration.control = some (.euler .doneNF) ∨
      configuration.control = some (.euler .doneRedex)) :
    run composedMachine ticks configuration = configuration := by
  rcases configuration with ⟨control, cursor⟩
  rcases terminal with h | h <;> change control = _ at h <;> subst control <;>
    induction ticks with
    | zero => rfl
    | succ ticks ih => exact ih

theorem terminal_mutations (ticks : Nat) (configuration : Configuration ComposedControl)
    (terminal : configuration.control = some (.euler .doneNF) ∨
      configuration.control = some (.euler .doneRedex)) :
    runMutationCount composedMachine ticks configuration = 0 := by
  rcases configuration with ⟨control, cursor⟩
  rcases terminal with h | h <;> change control = _ at h <;> subst control <;>
    induction ticks with
    | zero => rfl
    | succ ticks ih => change 0 + _ = 0; rw [Nat.zero_add]; exact ih

def stoppingTime (source : Term) : Nat := 34 * (source.size + 1)
def final (source : Term) : Configuration ComposedControl :=
  run composedMachine (stoppingTime source) (composedInitial source)

theorem final_certificate (source : Term) : Result source (stoppingTime source) (final source) := by
  obtain ⟨ticks, after, bound, execution, result⟩ := invocation_within source
  obtain ⟨extra, budgetEq⟩ := Nat.exists_eq_add_of_le bound
  have terminal : after.control = some (.euler .doneNF) ∨
      after.control = some (.euler .doneRedex) := by
    rcases result with h | h
    · exact Or.inl h.1
    · exact Or.inr h.1
  have finalEq : final source = after := by
    unfold final stoppingTime
    rw [budgetEq, run_add, execution, terminal_run extra after terminal]
  rw [finalEq]
  have countEq : runMutationCount composedMachine (stoppingTime source) (composedInitial source) =
      runMutationCount composedMachine ticks (composedInitial source) := by
    unfold stoppingTime
    rw [budgetEq, runMutationCount_add, execution, terminal_mutations extra after terminal,
      Nat.add_zero]
  rcases result with ⟨normal, normalProof, preserved, mutations⟩ | ⟨redex, contracts, mutations⟩
  · exact Or.inl ⟨normal, normalProof, preserved, countEq.trans mutations⟩
  · exact Or.inr ⟨redex, contracts, countEq.trans mutations⟩

theorem final_terminal (source : Term) :
    (final source).control = some (.euler .doneNF) ∨
      (final source).control = some (.euler .doneRedex) := by
  rcases final_certificate source with h | h
  · exact Or.inl h.1
  · exact Or.inr h.1

theorem final_nf (source : Term) (halted : (final source).control = some (.euler .doneNF)) :
    AddressNormal source ∧ (final source).cursor.erase = source ∧
      runMutationCount composedMachine (stoppingTime source) (composedInitial source) = 0 := by
  rcases final_certificate source with h | h
  · exact h.2
  · rw [halted] at h
    cases Option.some.inj h.1

theorem final_redex (source : Term)
    (halted : (final source).control = some (.euler .doneRedex)) :
    source.contractAt? (cursorAddress (final source).cursor) = some (final source).cursor.erase ∧
      runMutationCount composedMachine (stoppingTime source) (composedInitial source) = 1 := by
  rcases final_certificate source with h | h
  · rw [halted] at h
    cases Option.some.inj h.1
  · exact h.2

def outcome (source : Term) : Outcome source :=
  if halted : (final source).control = some (.euler .doneNF) then
    .nf (final_nf source halted).1
  else
    have redexHalt : (final source).control = some (.euler .doneRedex) := by
      rcases final_terminal source with normal | redex
      · exact False.elim (halted normal)
      · exact redex
    .redex (cursorAddress (final source).cursor) (final source).cursor.erase
      (final_redex source redexHalt).1

theorem outcome_agrees (source : Term) :
    match outcome source with
    | .nf _ => runtimeHaltKind haltKind (final source).control = some .nf ∧
        (final source).cursor.erase = source
    | .redex address target _ => runtimeHaltKind haltKind (final source).control = some .redex ∧
        cursorAddress (final source).cursor = address ∧ (final source).cursor.erase = target := by
  by_cases halted : (final source).control = some (.euler .doneNF)
  · simp only [outcome, halted, dite_true]
    exact ⟨by simp [runtimeHaltKind, haltKind, halted], (final_nf source halted).2.1⟩
  · have redexHalt : (final source).control = some (.euler .doneRedex) := by
      rcases final_terminal source with normal | redex
      · exact False.elim (halted normal)
      · exact redex
    simp only [outcome, halted, dite_false]
    simp [runtimeHaltKind, haltKind, redexHalt]

theorem outcome_mutations (source : Term) :
    match outcome source with
    | .nf _ => runMutationCount composedMachine (stoppingTime source) (composedInitial source) = 0
    | .redex _ _ _ =>
        runMutationCount composedMachine (stoppingTime source) (composedInitial source) = 1 := by
  by_cases halted : (final source).control = some (.euler .doneNF)
  · simp only [outcome, halted, dite_true]
    exact (final_nf source halted).2.2
  · have redexHalt : (final source).control = some (.euler .doneRedex) := by
      rcases final_terminal source with normal | redex
      · exact False.elim (halted normal)
      · exact redex
    simp only [outcome, halted, dite_false]
    exact (final_redex source redexHalt).2

def selectorContract : RootResetSelectorContract.Contract where
  Control := ComposedControl
  machine := composedMachine
  start := .probe (.first .enter)
  haltKind := haltKind
  coefficient := 34
  coefficient_pos := by decide
  stoppingTime := stoppingTime
  outcome := outcome
  stoppingTime_le := fun _ => Nat.le_refl _
  terminal := by
    intro source
    change (runtimeHaltKind haltKind (final source).control).isSome = true
    rcases final_terminal source with h | h <;> simp [runtimeHaltKind, haltKind, h]
  terminal_absorbing := terminal_absorbing
  outcome_agrees := outcome_agrees
  mutationCount_agrees := outcome_mutations

end Composed
end PureSFormal.Research.RootResetClockEulerBound
