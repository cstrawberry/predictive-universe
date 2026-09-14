import PureSFormal.Research.RootResetMixedLocalFragment
import PureSFormal.Research.RootResetCarrierProbeLocalBound

/-!
# Linear amortized cost of each mixed continuation admission

A successful Local entry pays for its own finite execution, one feedback
tick, and the remaining continuation using a single fixed coefficient.
The fresh probe is charged to the disjoint accumulator branch. A stopped
input consumes at most that coefficient times its current subtree size.
These bounds apply to every finite input at an entry boundary, including
malformed accumulators, and compose by simple induction on syntax size.
-/

namespace PureSFormal.Research.RootResetMixedLocalAmortized
open PureSFormal.PureS
open FiniteController
open RootResetMixedLocalFragment

def coefficient (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  classifyBound .marked program tree + classifyBound .fresh program tree +
    RootResetCarrierProbeLocalBound.coefficient program tree + 6

theorem full_bound (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (m f p size : Nat) (mb : m ≤ classifyBound .marked program tree)
    (fb : f ≤ classifyBound .fresh program tree)
    (pb : p ≤ RootResetCarrierProbeLocalBound.coefficient program tree * (size + 1)) :
    m + 1 + (f + 1) + (p + 1) + 2 + 1 ≤ coefficient program tree * (size + 1) := by
  have constant (value : Nat) : value ≤ value * (size + 1) := by
    simpa only [Nat.mul_one] using Nat.mul_le_mul_left value (Nat.succ_le_succ (Nat.zero_le size))
  have combined := Nat.add_le_add (Nat.add_le_add
    (Nat.add_le_add (Nat.le_trans mb (constant _)) (Nat.le_trans fb (constant _))) pb) (constant 6)
  simpa only [coefficient, Nat.add_mul, show 6 = 1 + 1 + 1 + 2 + 1 by rfl,
    Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using combined

theorem continuation_gap {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program tree source = some view) :
    view.continuation.size + 1 ≤ source.size := by
  obtain ⟨left, audit, shape⟩ := parsed_shape parsed
  have subterm : source.subterm? [.right, .left] = some view.continuation := by rw [shape]; cases view.continuation <;> rfl
  exact CarrierDecoder.subterm_size_lt subterm

def Paid (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin : Cursor) (ticks : Nat) (entered : Bool) (after : Cursor) : Prop :=
  ticks + (if entered then 1 + coefficient program tree * after.focus.size else 0) ≤
    coefficient program tree * origin.focus.size

theorem constant_stop (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin : Cursor) (ticks : Nat) (bounded : ticks ≤ coefficient program tree) : Paid program tree origin ticks false origin := by
  apply Nat.le_trans (by simpa only [Paid, Bool.false_eq_true, ↓reduceIte, Nat.add_zero] using bounded)
  simpa only [Nat.mul_one] using Nat.mul_le_mul_left (coefficient program tree) (Term.size_pos origin.focus)

theorem paid_entry (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin after : Cursor) (ticks allowance : Nat)
    (time : ticks + 1 ≤ coefficient program tree * allowance)
    (space : allowance + after.focus.size ≤ origin.focus.size) : Paid program tree origin ticks true after := by
  change ticks + (1 + coefficient program tree * after.focus.size) ≤ _
  rw [← Nat.add_assoc]
  apply Nat.le_trans (Nat.add_le_add_right time _)
  rw [← Nat.mul_add]
  exact Nat.mul_le_mul_left _ space

theorem all_input (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin : Cursor) (boundary : RootResetCarrierScanParentBoundary.carrierParent? origin.parents.head? = false) :
    ∃ ticks entered after, Paid program tree origin ticks entered after ∧
      run (machine program tree) ticks (initial program tree origin) = ⟨some (.done entered), after⟩ ∧
      Outcome program tree origin entered after := by
  obtain ⟨m, mb, mr⟩ := marked_runs program tree origin
  cases marked : RootResetCompletedLocalPatterns.accepts .marked program tree origin.focus with
  | true =>
      rw [marked] at mr
      obtain ⟨view, _, parsed⟩ := (RootResetCompletedLocalPatterns.accepts_iff_parse .marked program tree origin.focus).mp marked
      obtain ⟨left, audit, shape⟩ := parsed_shape parsed
      refine ⟨m + 1 + 2, true, _, ?_, ?_, .entered view parsed left audit shape⟩
      · apply paid_entry program tree origin _ _ 1
        · have bound := full_bound program tree m 0 0 0 mb (Nat.zero_le _) (Nat.zero_le _)
          have increase : m + 1 + 2 + 1 ≤ m + 1 + (0 + 1) + (0 + 1) + 2 + 1 := by
            have extra := Nat.le_add_right (m + 1 + 2 + 1) 2
            simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using extra
          simpa only [Nat.zero_add] using Nat.le_trans increase bound
        · simpa only [Nat.add_comm] using continuation_gap parsed
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
          · apply constant_stop program tree origin _
            have bound := full_bound program tree m f 0 0 mb fb (Nat.zero_le _)
            exact Nat.le_trans (Nat.le_add_right _ 4)
              (by simpa only [Nat.zero_add, Nat.mul_one, Nat.add_assoc] using bound)
          · rw [run_add, mr]
            exact fr
      | true =>
          simp only [fresh, ↓reduceIte] at fr
          obtain ⟨view, _, parsed⟩ := (RootResetCompletedLocalPatterns.accepts_iff_parse .fresh program tree origin.focus).mp fresh
          obtain ⟨left, audit, shape⟩ := parsed_shape parsed
          obtain ⟨p, answer, pb, pr⟩ := RootResetCarrierProbeLocalBound.parsed_local program tree origin view parsed boundary
          obtain ⟨used, ub, ur⟩ := probing_runs program tree origin answer p pr
          have bounded := full_bound program tree m f used view.accumulator.size mb fb (Nat.le_trans ub pb)
          have firstTwo : run (machine program tree) (m + 1 + (f + 1)) (initial program tree origin) = probeInitial program tree origin := by
            rw [run_add, mr]
            exact fr
          have prefixRun : run (machine program tree) (m + 1 + (f + 1) + (used + 1)) (initial program tree origin) =
              if answer then ⟨some .enterRight, origin⟩ else ⟨some (.done false), origin⟩ := by
            rw [run_add, firstTwo]
            exact ur
          have space := RootResetCarrierProbeLocalBound.accumulator_disjoint parsed
          cases answer with
          | false =>
              simp only [Bool.false_eq_true, ↓reduceIte] at prefixRun
              refine ⟨_, false, origin, ?_, prefixRun, .stopped⟩
              change _ + 0 ≤ _
              rw [Nat.add_zero]
              apply Nat.le_trans (Nat.le_trans (Nat.le_add_right _ 3) (by simpa only [Nat.add_assoc] using bounded))
              exact Nat.mul_le_mul_left _ (Nat.le_trans (Nat.le_add_right _ _) space)
          | true =>
              simp only [↓reduceIte] at prefixRun
              refine ⟨_ + 2, true, _, paid_entry program tree origin _ _ (view.accumulator.size + 1) bounded space, ?_,
                .entered view parsed left audit shape⟩
              rw [run_add, prefixRun]
              rcases origin with ⟨source, parents⟩
              change source = _ at shape
              subst source
              exact enter_runs program tree left _ audit parents

end PureSFormal.Research.RootResetMixedLocalAmortized
