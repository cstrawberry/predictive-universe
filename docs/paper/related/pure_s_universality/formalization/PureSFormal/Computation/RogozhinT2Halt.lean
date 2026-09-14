import PureSFormal.Computation.RogozhinT2Iteration

/-!
# The exact halt-label route of Rogozhin's T2 simulation

The printed sentinel is the left-marked program symbol followed by `b`.
After the ordinary first sweep, carried second sweep, and selector, the head is
in state `B` on that `b` with the left-marked symbol immediately to its left.
One further transition enters the literal halting table cell `(C, b-left)`.
-/

namespace PureSFormal.Computation

namespace RogozhinT2Simulation

open Rogozhin46

/-- The far-left sentinel is the two-cell left-marked halt code. -/
theorem upperProgramCode_haltLabel
    (program : RogozhinTagInput.Program) :
    upperProgramCode program (RogozhinTagInput.haltLabel program) =
      [.s3, .s1] := by
  simp [upperProgramCode, RogozhinTagInput.haltLabel,
    RogozhinTagInput.haltingCode]

/-- Nearest-first form exposed after selecting the halting label. -/
theorem upperProgramCode_haltLabel_reverse
    (program : RogozhinTagInput.Program) :
    (upperProgramCode program
      (RogozhinTagInput.haltLabel program)).reverse = [.s1, .s3] := by
  rw [upperProgramCode_haltLabel]
  rfl

/-- Time through the three pre-halt phases, stopping on `B/b`. -/
def haltPrefixFuel (program : RogozhinTagInput.Program)
    (padding : Nat) (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) : Nat :=
  let halt := RogozhinTagInput.haltLabel program
  let carried := RogozhinTagInput.weight program halt + padding
  let extraOnes := carried + 1
  concreteSelectorTimeWithCarry program halt second rest extraOnes +
    (secondSweepToProgramFuelWithCarry program carried second rest +
      firstSweepFuel [] (paddedProgramGaps program halt padding))

/-- Complete time to the first halting table cell. -/
def haltMacroFuel (program : RogozhinTagInput.Program)
    (padding : Nat) (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) : Nat :=
  1 + haltPrefixFuel program padding second rest

/-- Literal selector endpoint immediately before the halting transition. -/
def haltPrefixEndpoint (program : RogozhinTagInput.Program)
    (padding : Nat) (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) : Config :=
  let halt := RogozhinTagInput.haltLabel program
  let carried := RogozhinTagInput.weight program halt + padding
  let extraOnes := carried + 1
  ⟨.B, .s1, [.s3],
    programRightCode (selectedProgramRight program halt) ++
      List.replicate extraOnes .s0 ++
      RogozhinTagInput.dataCode program (second :: rest) ++ [.s5] ++
      List.replicate (RogozhinTagInput.weight program halt) .s0⟩

/-- Literal first halting configuration reached from the selector endpoint. -/
def haltEndpoint (program : RogozhinTagInput.Program)
    (padding : Nat) (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) : Config :=
  let before := haltPrefixEndpoint program padding second rest
  ⟨.C, .s3, [], .s2 :: before.right⟩

/-- Exact unbounded composition through all three pre-halt phases. -/
theorem iterate_compileWithPadding_haltPrefix
    (program : RogozhinTagInput.Program)
    (hT2 : RogozhinTagInput.IsT2 program)
    (padding : Nat)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) :
    iterate (haltPrefixFuel program padding second rest)
        (compileWithPadding program padding
          (RogozhinTagInput.haltLabel program :: second :: rest)) =
      haltPrefixEndpoint program padding second rest := by
  let halt := RogozhinTagInput.haltLabel program
  let carried := RogozhinTagInput.weight program halt + padding
  let extraOnes := carried + 1
  have haltLe : halt ≤ RogozhinTagInput.symbolCount program := by
    unfold halt RogozhinTagInput.haltLabel
    exact Nat.le_refl _
  have firstSweep := iterate_compileWithPadding_firstSweep
    program hT2 padding halt second rest haltLe
  have firstSweep' :
      iterate
          (firstSweepFuel [] (paddedProgramGaps program halt padding))
          (compileWithPadding program padding (halt :: second :: rest)) =
        ⟨.A, .s5,
          List.replicate carried .s4 ++
            markedNear (programGaps program halt) ++
            (upperProgramCode program halt).reverse,
          followingData program second rest⟩ := by
    simpa [carried, List.replicate_append_replicate,
      List.append_assoc] using firstSweep
  have secondSweep := iterate_secondSweep_toProgram_withCarry
    program halt second rest carried
  obtain ⟨next, farLeft, upperShape, selector⟩ :=
    iterate_concreteSelector_withCarry program hT2 halt second rest
      extraOnes haltLe
  have sentinelShape : (upperProgramCode program halt).reverse =
      [.s1, .s3] := by
    simpa [halt] using upperProgramCode_haltLabel_reverse program
  rw [sentinelShape] at upperShape
  have nextEq : next = .s1 := (List.cons.inj upperShape).1.symm
  have farLeftEq : farLeft = [.s3] :=
    (List.cons.inj upperShape).2.symm
  subst next
  subst farLeft
  unfold haltPrefixFuel
  dsimp only
  rw [iterate_add, iterate_add, firstSweep', secondSweep]
  simpa [haltPrefixEndpoint, halt, carried, extraOnes] using selector

/-- The single sentinel transition enters `(C, b-left)` exactly. -/
theorem iterate_haltPrefixEndpoint_one
    (program : RogozhinTagInput.Program)
    (padding : Nat) (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) :
    iterate 1 (haltPrefixEndpoint program padding second rest) =
      haltEndpoint program padding second rest := by
  rfl

/-- Exact first halting configuration from every padded halt-head boundary. -/
theorem iterate_compileWithPadding_halt
    (program : RogozhinTagInput.Program)
    (hT2 : RogozhinTagInput.IsT2 program)
    (padding : Nat)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) :
    iterate (haltMacroFuel program padding second rest)
        (compileWithPadding program padding
          (RogozhinTagInput.haltLabel program :: second :: rest)) =
      haltEndpoint program padding second rest := by
  unfold haltMacroFuel
  rw [iterate_add, iterate_compileWithPadding_haltPrefix]
  exact iterate_haltPrefixEndpoint_one program padding second rest
  exact hT2

/-- The explicit endpoint is one of the two literal halting table cells. -/
theorem haltEndpoint_halted
    (program : RogozhinTagInput.Program)
    (padding : Nat) (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) :
    Halted (haltEndpoint program padding second rest) := by
  rw [halted_iff]
  exact Or.inl ⟨rfl, rfl⟩

/-- Every strict prefix of the halt macro is nonhalting. -/
theorem safeBefore_compileWithPadding_halt
    (program : RogozhinTagInput.Program)
    (hT2 : RogozhinTagInput.IsT2 program)
    (padding : Nat)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) :
    ∀ index, index < haltMacroFuel program padding second rest →
      ¬ Halted
        (iterate index
          (compileWithPadding program padding
            (RogozhinTagInput.haltLabel program :: second :: rest))) := by
  have prefixRun := iterate_compileWithPadding_haltPrefix
    program hT2 padding second rest
  have prefixSafe := safeThrough_of_endpoint_not_halted
    (haltPrefixFuel program padding second rest)
    (compileWithPadding program padding
      (RogozhinTagInput.haltLabel program :: second :: rest))
    (haltPrefixEndpoint program padding second rest)
    prefixRun (stateB_not_halted _ _ _)
  intro index indexLt
  apply prefixSafe index
  unfold haltMacroFuel at indexLt
  have indexLt' :
      index < haltPrefixFuel program padding second rest + 1 := by
    simpa only [Nat.add_comm] using indexLt
  exact Nat.lt_succ_iff.mp indexLt'

/-- A halt-head source boundary reaches the fixed machine's trajectory event. -/
theorem eventuallyHalts_compileWithPadding_halt
    (program : RogozhinTagInput.Program)
    (hT2 : RogozhinTagInput.IsT2 program)
    (padding : Nat)
    (second : RogozhinTagInput.Label)
    (rest : List RogozhinTagInput.Label) :
    Rogozhin46.EventuallyHalts
      (compileWithPadding program padding
        (RogozhinTagInput.haltLabel program :: second :: rest)) := by
  refine ⟨haltMacroFuel program padding second rest, ?_⟩
  rw [iterate_compileWithPadding_halt program hT2]
  exact haltEndpoint_halted program padding second rest

end RogozhinT2Simulation

end PureSFormal.Computation
