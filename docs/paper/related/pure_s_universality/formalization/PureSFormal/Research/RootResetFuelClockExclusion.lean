import PureSFormal.Research.RootResetFuelFiniteRows
import PureSFormal.Research.RootResetNestedClockProbeAgreement

/-! Fixed fuel probes reject the actual generated CLOCK sources. -/
namespace PureSFormal.Research.RootResetFuelClockExclusion
open PureSFormal.PureS
open SchedulerInvariant RootResetCompletedLocalPatterns
open RootResetPendingAdmissionFuelPatterns (Kind pattern)
open RootResetFuelFiniteRows

theorem environment_C_missed (actions : Term) (number : Nat) :
    (RootResetPendingAdmissionPatterns.environmentPattern actions).matchesBool (C number) = false := by
  cases number <;> rfl

theorem pattern_clock_pair_missed (actions : Term) (kind : Kind) (stage wrappers left right : Nat)
    (environment : Term) :
    (row actions kind).pattern.matchesBool
      (.app (clockWrap stage wrappers (.app (C left) (C right))) environment) = false := by
  cases wrappers with
  | zero =>
      cases kind <;> cases left <;> cases right <;> cases stage
      all_goals simp only [row, pattern, clockWrap, C, b, Pattern.matchesBool,
        environment_C_missed, Bool.false_and, Bool.and_false]
      all_goals simp only [RootResetPendingAdmissionPatterns.environmentPattern,
        literal, actCode, Pattern.matchesBool, Bool.false_and, Bool.and_false]
  | succ wrappers =>
      cases wrappers <;> cases kind <;> cases left <;> cases right <;> cases stage
      all_goals simp only [row, pattern, clockWrap, C, b, Pattern.matchesBool,
        environment_C_missed, Bool.false_and, Bool.and_false]
      all_goals simp only [RootResetPendingAdmissionPatterns.environmentPattern,
        literal, actCode, Pattern.matchesBool, Bool.false_and, Bool.and_false]

theorem clock_pair_missed (actions : Term) (stage wrappers left right : Nat) (environment : Term) :
    RootResetEdgeFragment.select (rows actions)
      (.app (clockWrap stage wrappers (.app (C left) (C right))) environment) = none := by
  cases selected : RootResetEdgeFragment.select (rows actions)
      (.app (clockWrap stage wrappers (.app (C left) (C right))) environment) with
  | none => rfl
  | some edge =>
      obtain ⟨member, matched⟩ := RootResetEdgeFragment.select_sound _ _ _ selected
      obtain ⟨kind, _, equal⟩ := map_member_inverse _ _ _ member
      subst edge
      rw [pattern_clock_pair_missed] at matched
      cases matched

theorem growth_missed (actions : Term) (stage wrappers residual : Nat) (environment : Term) :
    RootResetEdgeFragment.select (rows actions) (.app (clockGrowthCore stage wrappers residual) environment) = none :=
  clock_pair_missed actions stage wrappers residual stage environment

theorem launch_missed (actions : Term) (stage wrappers : Nat) (environment : Term) :
    RootResetEdgeFragment.select (rows actions) (.app (clockWrappers stage (wrappers + 1)) environment) = none := by
  rw [RootResetClockParityWalker.clockWrappers_eq_clockWrap]
  exact clock_pair_missed actions stage (wrappers + 1) (stage + 1) (stage + 1) environment

end PureSFormal.Research.RootResetFuelClockExclusion
