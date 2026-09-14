import PureSFormal.Research.RootResetClockFuelCanonicalGrammar
import PureSFormal.PureS.CountedReduction

/-!
# Exact canonical zero-fuel transition sequence

The generated zero-fuel rows form a five-contraction local sequence from the
fuel call through the four program-counter rows to the generated open-Base
carrier.  Every address and target is stated on the current bare local term.
The local sequence also lifts through each supplied fixed marked-history
context.
-/

namespace PureSFormal.Research.RootResetClockFuelCanonicalTransitions

open PureSFormal.PureS
open RootResetClockFuelStages
open RootResetClockFuelCanonicalGrammar

variable (actions seedPayload continuation : Term)

/-- The zero-fuel call target is the first zero row. -/
theorem call_target_eq_first :
    (ZeroPosition.call.row actions seedPayload continuation).target =
      (ZeroPosition.first.row actions seedPayload continuation).term := by
  rfl

/-- The first zero-row target is the second zero row. -/
theorem first_target_eq_second :
    (ZeroPosition.first.row actions seedPayload continuation).target =
      (ZeroPosition.second.row actions seedPayload continuation).term := by
  rfl

/-- The second zero-row target is the third zero row. -/
theorem second_target_eq_third :
    (ZeroPosition.second.row actions seedPayload continuation).target =
      (ZeroPosition.third.row actions seedPayload continuation).term := by
  rfl

/-- The third zero-row target is the fourth zero row. -/
theorem third_target_eq_fourth :
    (ZeroPosition.third.row actions seedPayload continuation).target =
      (ZeroPosition.fourth.row actions seedPayload continuation).term := by
  rfl

/-- The fourth zero-row target is the generated open-Base carrier. -/
theorem fourth_target_eq_openBase :
    (ZeroPosition.fourth.row actions seedPayload continuation).target =
      (generatedBaseView actions seedPayload continuation).term actions := by
  rfl

/-- Exact addressed contraction from the zero call to the first row. -/
theorem call_contractAt_eq_first :
    (ZeroPosition.call.row actions seedPayload continuation).term.contractAt?
        (ZeroPosition.call.row actions seedPayload continuation).localAddress =
      some (ZeroPosition.first.row actions seedPayload continuation).term := by
  rw [FuelRow.contractAt?_eq_some_target, call_target_eq_first]

/-- Exact addressed contraction from the first row to the second row. -/
theorem first_contractAt_eq_second :
    (ZeroPosition.first.row actions seedPayload continuation).term.contractAt?
        (ZeroPosition.first.row actions seedPayload continuation).localAddress =
      some (ZeroPosition.second.row actions seedPayload continuation).term := by
  rw [FuelRow.contractAt?_eq_some_target, first_target_eq_second]

/-- Exact addressed contraction from the second row to the third row. -/
theorem second_contractAt_eq_third :
    (ZeroPosition.second.row actions seedPayload continuation).term.contractAt?
        (ZeroPosition.second.row actions seedPayload continuation).localAddress =
      some (ZeroPosition.third.row actions seedPayload continuation).term := by
  rw [FuelRow.contractAt?_eq_some_target, second_target_eq_third]

/-- Exact addressed contraction from the third row to the fourth row. -/
theorem third_contractAt_eq_fourth :
    (ZeroPosition.third.row actions seedPayload continuation).term.contractAt?
        (ZeroPosition.third.row actions seedPayload continuation).localAddress =
      some (ZeroPosition.fourth.row actions seedPayload continuation).term := by
  rw [FuelRow.contractAt?_eq_some_target, third_target_eq_fourth]

/-- Exact addressed contraction from the fourth row to open Base. -/
theorem fourth_contractAt_eq_openBase :
    (ZeroPosition.fourth.row actions seedPayload continuation).term.contractAt?
        (ZeroPosition.fourth.row actions seedPayload continuation).localAddress =
      some ((generatedBaseView actions seedPayload continuation).term actions) := by
  rw [FuelRow.contractAt?_eq_some_target, fourth_target_eq_openBase]

/-- Every generated target is accepted as its exact next canonical stage. -/
theorem zeroScript_parser_trace
    (admissible : Carrier.Admissible continuation) :
    parseCanonicalFuelRow? actions
        (ZeroPosition.call.row actions seedPayload continuation).target =
          some (ZeroPosition.first.row actions seedPayload continuation) ∧
    parseCanonicalFuelRow? actions
        (ZeroPosition.first.row actions seedPayload continuation).target =
          some (ZeroPosition.second.row actions seedPayload continuation) ∧
    parseCanonicalFuelRow? actions
        (ZeroPosition.second.row actions seedPayload continuation).target =
          some (ZeroPosition.third.row actions seedPayload continuation) ∧
    parseCanonicalFuelRow? actions
        (ZeroPosition.third.row actions seedPayload continuation).target =
          some (ZeroPosition.fourth.row actions seedPayload continuation) ∧
    parseOpenBase? actions
        (ZeroPosition.fourth.row actions seedPayload continuation).target =
          some (generatedBaseView actions seedPayload continuation) := by
  constructor
  · rw [call_target_eq_first]
    exact parseCanonicalFuelRow?_zero .first actions seedPayload continuation
      admissible
  constructor
  · rw [first_target_eq_second]
    exact parseCanonicalFuelRow?_zero .second actions seedPayload continuation
      admissible
  constructor
  · rw [second_target_eq_third]
    exact parseCanonicalFuelRow?_zero .third actions seedPayload continuation
      admissible
  constructor
  · rw [third_target_eq_fourth]
    exact parseCanonicalFuelRow?_zero .fourth actions seedPayload continuation
      admissible
  · rw [fourth_target_eq_openBase]
    exact parseOpenBase?_generatedBase actions seedPayload continuation

/-- The generated zero-fuel script has exactly five pure-S contractions. -/
theorem zeroScript_stepsN_five :
    StepsN 5
      (ZeroPosition.call.row actions seedPayload continuation).term
      ((generatedBaseView actions seedPayload continuation).term actions) := by
  have stepCall := Term.contractAt?_sound
    (call_contractAt_eq_first actions seedPayload continuation)
  have stepFirst := Term.contractAt?_sound
    (first_contractAt_eq_second actions seedPayload continuation)
  have stepSecond := Term.contractAt?_sound
    (second_contractAt_eq_third actions seedPayload continuation)
  have stepThird := Term.contractAt?_sound
    (third_contractAt_eq_fourth actions seedPayload continuation)
  have stepFourth := Term.contractAt?_sound
    (fourth_contractAt_eq_openBase actions seedPayload continuation)
  exact StepsN.tail
    (StepsN.tail
      (StepsN.tail
        (StepsN.tail (StepsN.single stepCall) stepFirst)
        stepSecond)
      stepThird)
    stepFourth

/-- The five-contraction endpoint is the literal Base carrier. -/
theorem zeroScript_stepsN_five_baseCarrier :
    StepsN 5
      (ZeroPosition.call.row actions seedPayload continuation).term
      (baseCarrier (zeroEnvironment actions seedPayload) continuation) := by
  simpa [generatedBaseView_term_eq] using
    zeroScript_stepsN_five actions seedPayload continuation

/-- A fixed marked-history context lifts the exact five-contraction script. -/
theorem markedPrefix_zeroScript_stepsN_five
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {context : Context}
    {history : List (CheckpointDecoder.LocalView program)}
    (markedPrefix : RootResetReachableStageGrammar.MarkedPrefix program tree term
      (ZeroPosition.call.row actions seedPayload continuation).term
      context history) :
    StepsN 5 term
      (context.plug
        ((generatedBaseView actions seedPayload continuation).term actions)) := by
  have lifted :=
    (zeroScript_stepsN_five actions seedPayload continuation).inContext context
  rw [markedPrefix.source_eq] at lifted
  exact lifted

/-- The lifted endpoint is the literal Base carrier in the same context. -/
theorem markedPrefix_zeroScript_stepsN_five_baseCarrier
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {context : Context}
    {history : List (CheckpointDecoder.LocalView program)}
    (markedPrefix : RootResetReachableStageGrammar.MarkedPrefix program tree term
      (ZeroPosition.call.row actions seedPayload continuation).term
      context history) :
    StepsN 5 term
      (context.plug
        (baseCarrier (zeroEnvironment actions seedPayload) continuation)) := by
  simpa [generatedBaseView_term_eq] using
    markedPrefix_zeroScript_stepsN_five actions seedPayload continuation markedPrefix

end PureSFormal.Research.RootResetClockFuelCanonicalTransitions
