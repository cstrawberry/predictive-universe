import PureSFormal.Computation.SourceChronologySourceCTS
import PureSFormal.Computation.DeterministicTapeRootResetOutput

/-!
# Ordered finite source sampling on the actual fresh-root pure-S path

For each defined finite source prefix, one strictly increasing clock samples
the existing padded encoder, existing fixed root-reset selector, and existing
bare-term row observer. No global clock or classification of all accepted
observations is asserted by this finite-prefix theorem.
-/

namespace PureSFormal.Computation.SourceChronologyRootReset

open PureS
open PureSFormal.Research.ProtectedTrieDeterministicCompiler
open SourceChronologySourceCTS

def checkpoint (source : DeterministicTape.Instance) (ticks : Nat) : Nat :=
  ExactCheckpointRun.checkpointTime Cook.rogozhinCookProgram
    DeterministicTapePureSOutput.dispatcher (DeterministicTapePureSOutput.seed source) ticks

theorem checkpoint_zero (source : DeterministicTape.Instance) : checkpoint source 0 = 0 := rfl

theorem checkpoint_strict (source : DeterministicTape.Instance) (first second : Nat)
    (ordered : first < second) : checkpoint source first < checkpoint source second :=
  ExactCheckpointRun.checkpointTime_strictlyIncreasing Cook.rogozhinCookProgram
    DeterministicTapePureSOutput.dispatcher (DeterministicTapePureSOutput.seed source) ordered

theorem checkpoint_decodes (source : DeterministicTape.Instance) (ticks : Nat) :
    DeterministicTapePureSOutput.decodeRow?
      (DeterministicTapeRootResetOutput.termAt source (checkpoint source ticks)) =
      CookSeedPassReadback.decodeTape? (DeterministicTapePureSOutput.seed source) ticks
        (CTS.iterate Cook.rogozhinCookProgram ticks
          (CTS.initial Cook.rogozhinCookProgram (DeterministicTapePureSOutput.seed source))) := by
  rw [DeterministicTapeRootResetOutput.termAt_eq_persistent]
  exact CheckpointSeedReflection.observe_at_checkpoint Cook.rogozhinCookProgram
    DeterministicTapePureSOutput.dispatcher CookSeedPassReadback.decodeTape?
    (DeterministicTapePureSOutput.seed source) ticks

/-- For every defined finite source prefix, one simultaneous strictly
increasing sequence of actual pure-S contraction indices exposes exactly
the corresponding source rows under the fixed bare-term observer. -/
theorem exists_sourceClock (source : DeterministicTape.Instance) (horizon : Nat)
    (endpoint : DeterministicTape.Row)
    (endpointRun : DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) horizon = some endpoint) :
    ∃ clock : Nat → Nat, clock 0 = 0 ∧
      (∀ first second, first < second → second ≤ horizon → clock first < clock second) ∧
      (∀ fuel, fuel ≤ horizon →
        DeterministicTapePureSOutput.decodeRow? (DeterministicTapeRootResetOutput.termAt source (clock fuel)) =
          DeterministicTape.runFor? source.machine (DeterministicTape.initialRow source) fuel) := by
  obtain ⟨ticks, initial, strict, decoded⟩ := exists_sourceCTSClock source horizon endpoint endpointRun
  refine ⟨fun fuel => checkpoint source (ticks fuel), ?_, ?_, ?_⟩
  · change checkpoint source (ticks 0) = 0
    rw [initial, checkpoint_zero]
  · intro first second ordered bounded
    exact checkpoint_strict source _ _ (strict first second ordered bounded)
  · intro fuel bounded
    obtain ⟨row, sourceRun⟩ := DeterministicTapePrimitiveChronology.source_prefix_defined
      source.machine (DeterministicTape.initialRow source) endpoint horizon endpointRun fuel bounded
    rw [checkpoint_decodes, sourceRun]
    exact decoded fuel bounded row sourceRun

end PureSFormal.Computation.SourceChronologyRootReset
