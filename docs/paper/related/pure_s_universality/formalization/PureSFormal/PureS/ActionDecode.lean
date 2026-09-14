import PureSFormal.PureS.ActionParser
import PureSFormal.PureS.CellSpine

/-!
# Semantic decoding of selected accumulators

The selected action changes only the registered accumulator.  This module
connects its literal live-cell construction to the binary CTS data update;
the retained history fields remain outside the decoded spine.
-/

namespace PureSFormal.PureS

namespace ActionDecode

/-- The dataword produced by a known phase/bit action after front deletion. -/
def outputData (program : CTS.Program) :
    ActionLabel program → List Bool → List Bool
  | (_, false), tail => tail
  | (phase, true), tail => tail ++ program.appendant phase

@[simp] theorem outputData_zero (program : CTS.Program)
    (phase : CTS.Phase program) (tail : List Bool) :
    outputData program (phase, false) tail = tail :=
  rfl

@[simp] theorem outputData_one (program : CTS.Program)
    (phase : CTS.Phase program) (tail : List Bool) :
    outputData program (phase, true) tail =
      tail ++ program.appendant phase :=
  rfl

/-- The term appender's canonical accumulator appends exactly its bit list. -/
theorem decode_appenderAccumulator
    (appendant : List Bool) {initial : Term} {tail : List Bool}
    (h : CellSpine.decode? initial = some tail) :
    CellSpine.decode? (appenderAccumulator appendant initial) =
      some (tail ++ appendant) := by
  simpa [appenderAccumulator, extendAccumulator] using
    CellSpine.decode?_foldlLive appendant h

/-- Both selected-action branches decode to the exact CTS data update. -/
theorem decode_actionAccumulator
    (program : CTS.Program) (label : ActionLabel program)
    {initial : Term} {tail : List Bool}
    (h : CellSpine.decode? initial = some tail) :
    CellSpine.decode? (actionAccumulator program label initial) =
      some (outputData program label tail) := by
  rcases label with ⟨phase, bit⟩
  cases bit with
  | false => exact h
  | true =>
      exact decode_appenderAccumulator (program.appendant phase) h

/-- The same update stated for the declarative cell-spine decoder. -/
theorem actionAccumulator_decodes
    (program : CTS.Program) (label : ActionLabel program)
    {initial : Term} {tail : List Bool}
    (h : CellSpine.Decodes initial tail) :
    CellSpine.Decodes (actionAccumulator program label initial)
      (outputData program label tail) := by
  apply CellSpine.decode?_sound
  exact decode_actionAccumulator program label (CellSpine.decode?_complete h)

/-- The term-level output is definitionally the ordinary CTS successor data. -/
theorem outputData_eq_ordinaryStep_data
    (program : CTS.Program) (phase : CTS.Phase program)
    (bit : Bool) (tail : List Bool) :
    outputData program (phase, bit) tail =
      (CTS.absorbingStep program ⟨phase, bit :: tail⟩).data := by
  cases bit <;> rfl

/--
Combining the preceding results: a decoded post-deletion accumulator executes
the exact data component of one nonempty absorbing CTS transition.
-/
theorem decode_actionAccumulator_eq_CTS
    (program : CTS.Program) (phase : CTS.Phase program)
    (bit : Bool) {initial : Term} {tail : List Bool}
    (h : CellSpine.decode? initial = some tail) :
    CellSpine.decode?
        (actionAccumulator program (phase, bit) initial) =
      some ((CTS.absorbingStep program ⟨phase, bit :: tail⟩).data) := by
  rw [← outputData_eq_ordinaryStep_data]
  exact decode_actionAccumulator program (phase, bit) h

end ActionDecode

end PureSFormal.PureS
