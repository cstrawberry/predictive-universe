import PureSFormal.Computation.RogozhinT2Correctness
import PureSFormal.Cook.PassClassification

/-!
# Restricted-T2 jobs at the fixed Cook CTS endpoint

The executable restricted-T2 compiler is first interpreted by the exact fixed
Rogozhin machine and then passed through Cook's canonical one-hot encoding.
-/

namespace PureSFormal.Computation

namespace RogozhinT2Cook

/-- Literal initial bit word for the fixed period-912 Cook cyclic tag system. -/
def encodeBits (job : RogozhinTagInput.Job) : List Bool :=
  Cook.encodeWord
    (Cook.PassClassification.canonicalWord
      (RogozhinTagInput.compile job))

/--
Unconditional source-halting equivalence with eventual emptiness of the fixed
period-912 Cook cyclic tag system.
-/
theorem eventuallyHalts_iff_fixedCookEmpty
    (job : RogozhinTagInput.Job)
    (wellFormed : RogozhinTagInput.WellFormed job.program job.word) :
    RogozhinTagInput.EventuallyHalts job ↔
      ∃ horizon,
        (CTS.iterate Cook.rogozhinCookProgram horizon
          (CTS.initial Cook.rogozhinCookProgram
            (encodeBits job))).data = [] :=
  (RogozhinT2Simulation.eventuallyHalts_compile_iff wellFormed).trans
    (Cook.PassClassification.canonical_eventuallyHalts_iff_exists_cts_empty
      (RogozhinTagInput.compile job))

end RogozhinT2Cook

end PureSFormal.Computation
