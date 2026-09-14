import PureSFormal.Computation.RogozhinT2Simulation

/-!
# Iterating the exact Rogozhin T2 macro

This module lifts the single deletion-two macro certificate to every finite
source prefix before the halting label reaches the head.  Both the accumulated
machine time and the unary audit padding are executable functions of the
literal source trajectory.
-/

namespace PureSFormal.Computation

namespace RogozhinT2Simulation

/-- No source boundary strictly before `horizon` is halted. -/
def NonhaltingBefore (program : RogozhinTagInput.Program)
    (word : List RogozhinTagInput.Label) (horizon : Nat) : Prop :=
  ∀ index, index < horizon →
    ¬ RogozhinTagInput.Halted program
      (RogozhinTagInput.iterate program index word)

/-- Unary audit padding present at the `horizon`-th compiled boundary. -/
def boundaryPadding (program : RogozhinTagInput.Program)
    (word : List RogozhinTagInput.Label) : Nat → Nat
  | 0 => 0
  | horizon + 1 =>
      let padding := boundaryPadding program word horizon
      match RogozhinTagInput.iterate program horizon word with
      | first :: second :: _rest =>
          RogozhinTagInput.weight program first + padding + 1 +
            RogozhinTagInput.weight program second + 1
      | _ => padding

/-- Exact fixed-machine time of the first `horizon` source macros. -/
def boundaryTime (program : RogozhinTagInput.Program)
    (word : List RogozhinTagInput.Label) : Nat → Nat
  | 0 => 0
  | horizon + 1 =>
      let elapsed := boundaryTime program word horizon
      let padding := boundaryPadding program word horizon
      match RogozhinTagInput.iterate program horizon word with
      | first :: second :: rest =>
          nonhaltingMacroFuel program padding first second rest + elapsed
      | _ => elapsed

theorem nonhaltingBefore_mono
    {program : RogozhinTagInput.Program}
    {word : List RogozhinTagInput.Label}
    {earlier later : Nat}
    (run : NonhaltingBefore program word later)
    (le : earlier ≤ later) :
    NonhaltingBefore program word earlier := by
  intro index indexLt
  exact run index (Nat.lt_of_lt_of_le indexLt le)

/-- Every complete nonhalting macro contains at least one machine step. -/
theorem nonhaltingMacroFuel_positive
    (program : RogozhinTagInput.Program)
    (padding : Nat)
    (first second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) :
    0 < nonhaltingMacroFuel program padding first second rest := by
  unfold nonhaltingMacroFuel thirdSweepFuelWithCarry
  exact Nat.add_pos_left (Nat.zero_lt_succ _) _

/-- Exact compiled boundary after every finite nonhalting source prefix. -/
theorem iterate_compileWithPadding_nonhaltingRun
    {program : RogozhinTagInput.Program}
    {word : List RogozhinTagInput.Label}
    (wellFormed : RogozhinTagInput.WellFormed program word) :
    ∀ horizon,
      NonhaltingBefore program word horizon →
      Rogozhin46.iterate (boundaryTime program word horizon)
          (RogozhinTagInput.compile ⟨program, word⟩) =
        compileWithPadding program (boundaryPadding program word horizon)
          (RogozhinTagInput.iterate program horizon word)
  | 0, _ => by
      simp only [boundaryTime, boundaryPadding,
        Rogozhin46.iterate_zero, RogozhinTagInput.iterate_zero]
      exact (compileWithPadding_zero program word).symm
  | horizon + 1, run => by
      let current := RogozhinTagInput.iterate program horizon word
      have currentWellFormed := wellFormed.iterate horizon
      obtain ⟨first, second, rest, currentEq⟩ :=
        RogozhinTagInput.exists_two_prefix currentWellFormed.lengthTwo
      have prefixRun : NonhaltingBefore program word horizon :=
        nonhaltingBefore_mono run (Nat.le_succ horizon)
      have prior := iterate_compileWithPadding_nonhaltingRun
        wellFormed horizon prefixRun
      have currentNotHalted : ¬ RogozhinTagInput.Halted program current := by
        exact run horizon (Nat.lt_succ_self horizon)
      have firstNotHalt : first ≠ RogozhinTagInput.haltLabel program := by
        intro firstHalt
        apply currentNotHalted
        change RogozhinTagInput.Halted program
          (RogozhinTagInput.iterate program horizon word)
        rw [currentEq]
        unfold RogozhinTagInput.Halted RogozhinTagInput.step?
        simp [firstHalt]
      have firstLe : first ≤ RogozhinTagInput.haltLabel program := by
        exact currentWellFormed.labels first (by
          rw [currentEq]
          exact List.Mem.head _)
      have firstLt : first < RogozhinTagInput.symbolCount program := by
        unfold RogozhinTagInput.haltLabel at firstLe firstNotHalt
        exact Nat.lt_of_le_of_ne firstLe firstNotHalt
      have sourceStep := RogozhinTagInput.WellFormed.absorbingStep_eq
        (second := second) (rest := rest) firstNotHalt
      have hmacro := iterate_compileWithPadding_nonhaltingMacro
        program wellFormed.isT2
        (boundaryPadding program word horizon) first second rest firstLt
      dsimp only at hmacro
      calc
        Rogozhin46.iterate (boundaryTime program word (horizon + 1))
            (RogozhinTagInput.compile ⟨program, word⟩) =
          Rogozhin46.iterate
            (nonhaltingMacroFuel program
              (boundaryPadding program word horizon) first second rest)
            (Rogozhin46.iterate (boundaryTime program word horizon)
              (RogozhinTagInput.compile ⟨program, word⟩)) := by
                rw [boundaryTime, currentEq]
                exact Rogozhin46.iterate_add _ _ _
        _ = Rogozhin46.iterate
            (nonhaltingMacroFuel program
              (boundaryPadding program word horizon) first second rest)
            (compileWithPadding program
              (boundaryPadding program word horizon)
              (first :: second :: rest)) := by rw [prior, currentEq]
        _ = compileWithPadding program
            (RogozhinTagInput.weight program first +
                boundaryPadding program word horizon + 1 +
              RogozhinTagInput.weight program second + 1)
            (rest ++ RogozhinTagInput.productionAt program first) := hmacro
        _ = compileWithPadding program
            (boundaryPadding program word (horizon + 1))
            (RogozhinTagInput.iterate program (horizon + 1) word) := by
              rw [boundaryPadding, currentEq,
                RogozhinTagInput.iterate_succ, currentEq, sourceStep]

/-- Accumulated exact machine time dominates the number of source macros. -/
theorem horizon_le_boundaryTime
    {program : RogozhinTagInput.Program}
    {word : List RogozhinTagInput.Label}
    (wellFormed : RogozhinTagInput.WellFormed program word) :
    ∀ horizon,
      horizon ≤ boundaryTime program word horizon
  | 0 => Nat.zero_le _
  | horizon + 1 => by
      let current := RogozhinTagInput.iterate program horizon word
      have currentWellFormed := wellFormed.iterate horizon
      obtain ⟨first, second, rest, currentEq⟩ :=
        RogozhinTagInput.exists_two_prefix currentWellFormed.lengthTwo
      have prior := horizon_le_boundaryTime wellFormed horizon
      have macroPositive := nonhaltingMacroFuel_positive program
        (boundaryPadding program word horizon) first second rest
      have oneLeMacro :
          1 ≤ nonhaltingMacroFuel program
            (boundaryPadding program word horizon) first second rest :=
        macroPositive
      unfold boundaryTime
      rw [show RogozhinTagInput.iterate program horizon word =
          first :: second :: rest from currentEq]
      have combined := Nat.add_le_add prior oneLeMacro
      simpa only [Nat.add_comm] using combined

/-- The whole machine prefix through a simulated nonhalting source run is safe. -/
theorem safeThrough_compileWithPadding_nonhaltingRun
    {program : RogozhinTagInput.Program}
    {word : List RogozhinTagInput.Label}
    (wellFormed : RogozhinTagInput.WellFormed program word)
    (horizon : Nat)
    (run : NonhaltingBefore program word horizon) :
    SafeThrough (boundaryTime program word horizon)
      (RogozhinTagInput.compile ⟨program, word⟩) := by
  apply safeThrough_of_endpoint_not_halted
    (endpoint := compileWithPadding program
      (boundaryPadding program word horizon)
      (RogozhinTagInput.iterate program horizon word))
  · exact iterate_compileWithPadding_nonhaltingRun wellFormed horizon run
  · exact compileWithPadding_not_halted _ _ _

end RogozhinT2Simulation

end PureSFormal.Computation
