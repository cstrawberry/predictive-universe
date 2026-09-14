import PureSFormal.Computation.DeterministicTapeThreeCounterCompiler
import PureSFormal.Computation.ThreeCounterTag
import PureSFormal.Computation.RogozhinT2Cook
import PureSFormal.Computation.Enumerable

/-!
# Deterministic tape halting at the fixed Cook cyclic-tag endpoint

This module composes three fully explicit compilers:

1. a finite deterministic Boolean-tape machine is implemented by a finite
   primitive three-counter program;
2. that initialized three-counter program is compiled to a well-formed
   restricted deletion-two tag job; and
3. the tag job is encoded for Cook's literal period-912 cyclic tag system.

No source-simulation premise occurs in the final theorem.
-/

namespace PureSFormal.Computation

namespace DeterministicTapeCook

open PureSFormal.Research.ProtectedTrieDeterministicCompiler

abbrev SourceInstance := DeterministicTape.Instance
abbrev SourceHalts : SourceInstance -> Prop := DeterministicTape.Halts

/-- The literal initialized primitive three-counter job assigned to a source. -/
def compileThreeCounterJob (source : SourceInstance) : ThreeCounter.Job :=
  { program :=
      DeterministicTapeThreeCounterCompiler.Compiler.compileMachine
        source.machine
    initial :=
      DeterministicTapeThreeCounterCompiler.Execution.compileInitial source }

/-- The literal restricted deletion-two job assigned to a source. -/
def compileT2Job (source : SourceInstance) : RogozhinTagInput.Job :=
  ThreeCounterTag.Numeric.compileJob (compileThreeCounterJob source)

/-- The literal bitword supplied to Cook's fixed period-912 cyclic tag system. -/
def encodeBits (source : SourceInstance) : List Bool :=
  RogozhinT2Cook.encodeBits (compileT2Job source)

/-- Eventual emptiness for the literal fixed Cook program. -/
def EventuallyEmpty (bits : List Bool) : Prop :=
  exists horizon,
    (CTS.iterate Cook.rogozhinCookProgram horizon
      (CTS.initial Cook.rogozhinCookProgram bits)).data = []

/-- The compiled deletion-two job satisfies the exact syntactic restriction
expected by the fixed Rogozhin interpreter. -/
theorem compileT2Job_isT2 (source : SourceInstance) :
    RogozhinTagInput.IsT2 (compileT2Job source).program :=
  ThreeCounterTag.Numeric.compileJob_isT2 (compileThreeCounterJob source)

/-- The compiled deletion-two job and its initial word are well formed. -/
theorem compileT2Job_wellFormed (source : SourceInstance) :
    RogozhinTagInput.WellFormed (compileT2Job source).program
      (compileT2Job source).word :=
  ThreeCounterTag.Numeric.compileJob_wellFormed
    (compileThreeCounterJob source)

/-- Deterministic-tape halting is exactly primitive three-counter halting for
the transparent initialized job above. -/
theorem halts_iff_threeCounterJob (source : SourceInstance) :
    SourceHalts source <->
      ThreeCounter.UniversalHalts (compileThreeCounterJob source) := by
  exact
    DeterministicTapeThreeCounterCompiler.Execution.halts_iff_threeCounterHalts
      source

/-- Deterministic-tape halting is exactly halting of the compiled restricted
deletion-two tag job. -/
theorem halts_iff_t2Job (source : SourceInstance) :
    SourceHalts source <->
      RogozhinTagInput.EventuallyHalts (compileT2Job source) := by
  exact (halts_iff_threeCounterJob source).trans
    (ThreeCounterTag.Numeric.universalHalts_iff_compileJob
      (compileThreeCounterJob source))

/-- Premise-free endpoint: conventional deterministic-tape halting is exactly
eventual dataword emptiness in Cook's fixed period-912 cyclic tag system. -/
theorem halts_iff_fixedCookEmpty (source : SourceInstance) :
    SourceHalts source <-> EventuallyEmpty (encodeBits source) := by
  exact (halts_iff_t2Job source).trans
    (RogozhinT2Cook.eventuallyHalts_iff_fixedCookEmpty
      (compileT2Job source) (compileT2Job_wellFormed source))

/-- Fully expanded spelling of the fixed-Cook endpoint. -/
theorem halts_iff_exists_fixedCookEmpty (source : SourceInstance) :
    DeterministicTape.Halts source <->
      exists horizon,
        (CTS.iterate Cook.rogozhinCookProgram horizon
          (CTS.initial Cook.rogozhinCookProgram
            (encodeBits source))).data = [] :=
  halts_iff_fixedCookEmpty source

/-- The named structural bitword encoder is a pointwise reduction. -/
theorem encodeBits_reducesVia :
    ReducesVia encodeBits DeterministicTape.Halts EventuallyEmpty :=
  halts_iff_fixedCookEmpty

/-- The same transparent encoder witnesses the corresponding extensional
many-one reduction. -/
theorem halts_manyOneReduces_fixedCookEmpty :
    ManyOneReduces DeterministicTape.Halts EventuallyEmpty :=
  ReducesVia.manyOne encodeBits_reducesVia

end DeterministicTapeCook

end PureSFormal.Computation
