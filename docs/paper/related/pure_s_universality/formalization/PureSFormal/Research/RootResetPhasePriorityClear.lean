import PureSFormal.Research.RootResetActiveEndpointExecution
import PureSFormal.Research.RootResetFreshHistoryRejection

/-! Concrete CLOCK and FUEL roots cannot be completed Local candidates,
including the intermediate cursor after one upward audit edge. -/
namespace PureSFormal.Research.RootResetPhasePriorityClear
open PureSFormal.PureS
open SchedulerInvariant
open RootResetClockFuelStages RootResetClockFuelCanonicalGrammar
open RootResetCompletedLocalPatterns

theorem rejects_of_patterns (status : CheckpointDecoder.HaltStatus) (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (source : Term)
    (refused : ∀ dispatch, (localPattern status dispatch).matchesBool source = false) :
    accepts status program tree source = false := by
  cases accepted : accepts status program tree source with
  | false => rfl
  | true =>
      obtain ⟨pattern, member, matched⟩ := member_of_any _ _ accepted
      obtain ⟨dispatch, dispatchMember, patternEq⟩ := map_member_inverse _ _ _ member
      rw [← patternEq, refused] at matched
      cases matched

theorem numeral_tag (number : Nat) :
    (((Pattern.s.app .s).app .s).app .hole).matchesBool (C number) = false := by
  cases number <;> rfl

theorem clock_patterns (status : CheckpointDecoder.HaltStatus) (dispatch : Pattern)
    (stage wrappers left right : Nat) (environment : Term) :
    (localPattern status dispatch).matchesBool (.app (clockWrap stage wrappers (.app (C left) (C right))) environment) = false ∧
    ∀ audit, (localPattern status dispatch).matchesBool (.app (.app (clockWrap stage wrappers (.app (C left) (C right))) environment) audit) = false := by
  constructor
  all_goals try intro audit
  all_goals cases status <;> cases wrappers <;> cases left <;> cases right <;> cases stage <;>
    simp [localPattern, haltPattern, literal, Pattern.matchesBool, clockWrap, C, b, haltCode, haltTag, numeral_tag]

theorem clock_clear (status : CheckpointDecoder.HaltStatus) (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (stage wrappers left right : Nat) (environment : Term) :
    accepts status program tree (.app (clockWrap stage wrappers (.app (C left) (C right))) environment) = false ∧
    ∀ audit, accepts status program tree (.app (.app (clockWrap stage wrappers (.app (C left) (C right))) environment) audit) = false := by
  exact ⟨rejects_of_patterns status program tree _ (fun dispatch => (clock_patterns status dispatch stage wrappers left right environment).1),
    fun audit => rejects_of_patterns status program tree _ (fun dispatch => (clock_patterns status dispatch stage wrappers left right environment).2 audit)⟩

theorem fuel_call_patterns (status : CheckpointDecoder.HaltStatus) (dispatch : Pattern)
    (number : Nat) (environment continuation : Term) :
    (localPattern status dispatch).matchesBool (FuelRow.call number environment continuation).term = false ∧
    ∀ audit, (localPattern status dispatch).matchesBool (.app (FuelRow.call number environment continuation).term audit) = false := by
  constructor
  all_goals try intro audit
  all_goals cases status <;> cases number with
  | zero => simp [localPattern, haltPattern, literal, Pattern.matchesBool, FuelRow.term, C, b, haltCode, haltTag]
  | succ number => cases number <;>
    simp [localPattern, haltPattern, literal, Pattern.matchesBool, FuelRow.term, C, b, haltCode, haltTag]

theorem positiveHalf_patterns (status : CheckpointDecoder.HaltStatus) (dispatch : Pattern)
    (number : Nat) (left right continuation : Term) :
    (localPattern status dispatch).matchesBool (FuelRow.positiveHalf number left right continuation).term = false ∧
    ∀ audit, (localPattern status dispatch).matchesBool (.app (FuelRow.positiveHalf number left right continuation).term audit) = false := by
  constructor
  all_goals try intro audit
  all_goals cases status <;> rfl

theorem zero_patterns (status : CheckpointDecoder.HaltStatus) (dispatch : Pattern)
    (position : ZeroPosition) (actions payload continuation : Term) :
    (localPattern status dispatch).matchesBool (position.row actions payload continuation).term = false ∧
    ∀ audit, (localPattern status dispatch).matchesBool (.app (position.row actions payload continuation).term audit) = false := by
  constructor
  all_goals try intro audit
  all_goals cases status <;> cases position <;> rfl

theorem call_clear (status : CheckpointDecoder.HaltStatus) (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (number : Nat) (environment continuation : Term) :
    accepts status program tree (FuelRow.call number environment continuation).term = false ∧
    ∀ audit, accepts status program tree (.app (FuelRow.call number environment continuation).term audit) = false :=
  ⟨rejects_of_patterns status program tree _ (fun dispatch => (fuel_call_patterns status dispatch number environment continuation).1),
    fun audit => rejects_of_patterns status program tree _ (fun dispatch => (fuel_call_patterns status dispatch number environment continuation).2 audit)⟩

theorem positiveHalf_clear (status : CheckpointDecoder.HaltStatus) (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (number : Nat) (left right continuation : Term) :
    accepts status program tree (FuelRow.positiveHalf number left right continuation).term = false ∧
    ∀ audit, accepts status program tree (.app (FuelRow.positiveHalf number left right continuation).term audit) = false :=
  ⟨rejects_of_patterns status program tree _ (fun dispatch => (positiveHalf_patterns status dispatch number left right continuation).1),
    fun audit => rejects_of_patterns status program tree _ (fun dispatch => (positiveHalf_patterns status dispatch number left right continuation).2 audit)⟩

theorem zero_clear (status : CheckpointDecoder.HaltStatus) (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (position : ZeroPosition) (actions payload continuation : Term) :
    accepts status program tree (position.row actions payload continuation).term = false ∧
    ∀ audit, accepts status program tree (.app (position.row actions payload continuation).term audit) = false :=
  ⟨rejects_of_patterns status program tree _ (fun dispatch => (zero_patterns status dispatch position actions payload continuation).1),
    fun audit => rejects_of_patterns status program tree _ (fun dispatch => (zero_patterns status dispatch position actions payload continuation).2 audit)⟩

theorem growth_clear (status : CheckpointDecoder.HaltStatus) (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (stage wrappers residual : Nat) (environment : Term) :
    accepts status program tree (.app (clockGrowthCore stage wrappers residual) environment) = false ∧
    ∀ audit, accepts status program tree (.app (.app (clockGrowthCore stage wrappers residual) environment) audit) = false :=
  clock_clear status program tree stage wrappers residual stage environment

theorem launch_clear (status : CheckpointDecoder.HaltStatus) (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (stage wrappers : Nat) (environment : Term) :
    accepts status program tree (.app (clockWrappers stage (wrappers + 1)) environment) = false ∧
    ∀ audit, accepts status program tree (.app (.app (clockWrappers stage (wrappers + 1)) environment) audit) = false := by
  rw [RootResetClockParityWalker.clockWrappers_eq_clockWrap]
  exact clock_clear status program tree stage (wrappers + 1) (stage + 1) (stage + 1) environment

end PureSFormal.Research.RootResetPhasePriorityClear
