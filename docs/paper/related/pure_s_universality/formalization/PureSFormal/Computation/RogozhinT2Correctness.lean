import PureSFormal.Computation.RogozhinT2Halt

/-!
# Unconditional correctness of the restricted-T2 compiler

This module combines the nonhalting macro iteration and the exact halt-label
route.  The result is a direct halting equivalence between every well-formed
restricted two-tag job and the exact fixed Rogozhin `UTM(4,6)` configuration
emitted by the executable compiler.
-/

namespace PureSFormal.Computation

namespace RogozhinT2Simulation

/-- Source iteration may be reassociated by taking the first step first. -/
theorem tagIterate_succ_from
    (program : RogozhinTagInput.Program)
    (horizon : Nat) (word : List RogozhinTagInput.Label) :
    RogozhinTagInput.iterate program (horizon + 1) word =
      RogozhinTagInput.iterate program horizon
        (RogozhinTagInput.absorbingStep program word) := by
  induction horizon with
  | zero => rfl
  | succ horizon ih =>
      change RogozhinTagInput.absorbingStep program
          (RogozhinTagInput.iterate program (horizon + 1) word) =
        RogozhinTagInput.absorbingStep program
          (RogozhinTagInput.iterate program horizon
            (RogozhinTagInput.absorbingStep program word))
      exact congrArg (RogozhinTagInput.absorbingStep program) ih

/-- Eventual halting transports backwards across any exact finite run. -/
theorem eventuallyHalts_of_iterate_eq
    (fuel : Nat) (start endpoint : Rogozhin46.Config)
    (run : Rogozhin46.iterate fuel start = endpoint)
    (later : Rogozhin46.EventuallyHalts endpoint) :
    Rogozhin46.EventuallyHalts start := by
  obtain ⟨horizon, halted⟩ := later
  refine ⟨horizon + fuel, ?_⟩
  rw [Rogozhin46.iterate_add, run]
  exact halted

/-- A well-formed source boundary halted now has the literal halt head. -/
theorem eventuallyHalts_compileWithPadding_of_halted
    {program : RogozhinTagInput.Program}
    {word : List RogozhinTagInput.Label}
    (wellFormed : RogozhinTagInput.WellFormed program word)
    (halted : RogozhinTagInput.Halted program word)
    (padding : Nat) :
    Rogozhin46.EventuallyHalts
      (compileWithPadding program padding word) := by
  obtain ⟨first, second, rest, wordEq⟩ :=
    RogozhinTagInput.exists_two_prefix wellFormed.lengthTwo
  have haltHead := wellFormed.halted_iff_head.mp halted
  rw [wordEq] at haltHead
  simp only [List.head?_cons, Option.some.injEq] at haltHead
  subst first
  rw [wordEq]
  exact eventuallyHalts_compileWithPadding_halt program
    wellFormed.isT2 padding second rest

/-- Any finite source halt witness gives a fixed-machine halt witness. -/
theorem eventuallyHalts_compileWithPadding_of_sourceWitness
    {program : RogozhinTagInput.Program}
    {word : List RogozhinTagInput.Label}
    (wellFormed : RogozhinTagInput.WellFormed program word) :
    ∀ horizon,
      RogozhinTagInput.Halted program
          (RogozhinTagInput.iterate program horizon word) →
      ∀ padding,
        Rogozhin46.EventuallyHalts
          (compileWithPadding program padding word)
  | 0, halted, padding =>
      eventuallyHalts_compileWithPadding_of_halted
        wellFormed halted padding
  | horizon + 1, haltedLater, padding => by
      by_cases haltedNow : RogozhinTagInput.Halted program word
      · exact eventuallyHalts_compileWithPadding_of_halted
          wellFormed haltedNow padding
      · obtain ⟨first, second, rest, wordEq⟩ :=
          RogozhinTagInput.exists_two_prefix wellFormed.lengthTwo
        have firstNotHalt :
            first ≠ RogozhinTagInput.haltLabel program := by
          intro firstEq
          apply haltedNow
          rw [wordEq]
          unfold RogozhinTagInput.Halted RogozhinTagInput.step?
          simp [firstEq]
        have firstLe : first ≤ RogozhinTagInput.haltLabel program := by
          exact wellFormed.labels first (by
            rw [wordEq]
            exact List.Mem.head _)
        have firstLt : first < RogozhinTagInput.symbolCount program := by
          unfold RogozhinTagInput.haltLabel at firstLe firstNotHalt
          exact Nat.lt_of_le_of_ne firstLe firstNotHalt
        let nextWord := rest ++ RogozhinTagInput.productionAt program first
        let nextPadding :=
          RogozhinTagInput.weight program first + padding + 1 +
            RogozhinTagInput.weight program second + 1
        have sourceStep := RogozhinTagInput.WellFormed.absorbingStep_eq
          (second := second) (rest := rest) firstNotHalt
        have nextWellFormed := wellFormed.absorbingStep
        have nextWellFormed' :
            RogozhinTagInput.WellFormed program nextWord := by
          rw [wordEq, sourceStep] at nextWellFormed
          exact nextWellFormed
        have haltedNext :
            RogozhinTagInput.Halted program
              (RogozhinTagInput.iterate program horizon nextWord) := by
          rw [tagIterate_succ_from] at haltedLater
          rw [wordEq, sourceStep] at haltedLater
          exact haltedLater
        have later := eventuallyHalts_compileWithPadding_of_sourceWitness
          nextWellFormed' horizon haltedNext nextPadding
        have macroRun := iterate_compileWithPadding_nonhaltingMacro
          program wellFormed.isT2 padding first second rest firstLt
        dsimp only at macroRun
        rw [wordEq]
        apply eventuallyHalts_of_iterate_eq
          (nonhaltingMacroFuel program padding first second rest)
          (compileWithPadding program padding (first :: second :: rest))
          (compileWithPadding program nextPadding nextWord)
        · simpa [nextPadding, nextWord] using macroRun
        · exact later

/-- Source halting implies halting of the literal compiled Rogozhin job. -/
theorem sourceEventuallyHalts_implies_compiledEventuallyHalts
    {program : RogozhinTagInput.Program}
    {word : List RogozhinTagInput.Label}
    (wellFormed : RogozhinTagInput.WellFormed program word)
    (sourceHalts : RogozhinTagInput.EventuallyHalts ⟨program, word⟩) :
    Rogozhin46.EventuallyHalts
      (RogozhinTagInput.compile ⟨program, word⟩) := by
  obtain ⟨horizon, halted⟩ := sourceHalts
  have machineHalts := eventuallyHalts_compileWithPadding_of_sourceWitness
    wellFormed horizon halted 0
  rw [compileWithPadding_zero] at machineHalts
  exact machineHalts

/-- Constructive bounded alternative used for halting reflection. -/
theorem sourceEventuallyHalts_or_nonhaltingBefore
    (program : RogozhinTagInput.Program)
    (word : List RogozhinTagInput.Label) :
    ∀ horizon,
      RogozhinTagInput.EventuallyHalts ⟨program, word⟩ ∨
        NonhaltingBefore program word horizon
  | 0 => Or.inr (by
      intro index indexLt
      exact False.elim (Nat.not_lt_zero index indexLt))
  | horizon + 1 => by
      rcases sourceEventuallyHalts_or_nonhaltingBefore
          program word horizon with sourceHalts | prefixRun
      · exact Or.inl sourceHalts
      · by_cases haltedNow : RogozhinTagInput.Halted program
            (RogozhinTagInput.iterate program horizon word)
        · exact Or.inl ⟨horizon, haltedNow⟩
        · exact Or.inr (by
            intro index indexLt
            have indexLe : index ≤ horizon :=
              Nat.lt_succ_iff.mp indexLt
            rcases Nat.lt_or_eq_of_le indexLe with indexEarlier | indexEq
            · exact prefixRun index indexEarlier
            · subst index
              exact haltedNow)

/-- A machine halt is impossible if no source boundary ever halts. -/
theorem compiledEventuallyHalts_implies_sourceEventuallyHalts
    {program : RogozhinTagInput.Program}
    {word : List RogozhinTagInput.Label}
    (wellFormed : RogozhinTagInput.WellFormed program word)
    (machineHalts : Rogozhin46.EventuallyHalts
      (RogozhinTagInput.compile ⟨program, word⟩)) :
    RogozhinTagInput.EventuallyHalts ⟨program, word⟩ := by
  obtain ⟨machineHorizon, machineHalted⟩ := machineHalts
  rcases sourceEventuallyHalts_or_nonhaltingBefore
      program word machineHorizon with sourceHalts | sourceRun
  · exact sourceHalts
  · have safe := safeThrough_compileWithPadding_nonhaltingRun
      wellFormed machineHorizon sourceRun
    exact False.elim (safe machineHorizon
      (horizon_le_boundaryTime wellFormed machineHorizon)
      machineHalted)

/--
Unconditional halting correctness of the executable restricted-T2 compiler
into the exact fixed Rogozhin machine.
-/
theorem eventuallyHalts_compile_iff
    {program : RogozhinTagInput.Program}
    {word : List RogozhinTagInput.Label}
    (wellFormed : RogozhinTagInput.WellFormed program word) :
    RogozhinTagInput.EventuallyHalts ⟨program, word⟩ ↔
      Rogozhin46.EventuallyHalts
        (RogozhinTagInput.compile ⟨program, word⟩) := by
  constructor
  · exact sourceEventuallyHalts_implies_compiledEventuallyHalts wellFormed
  · exact compiledEventuallyHalts_implies_sourceEventuallyHalts wellFormed

end RogozhinT2Simulation

end PureSFormal.Computation
