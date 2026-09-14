import PureSFormal.Research.RootResetCompletedLocalPatterns
import PureSFormal.Research.RootResetClockFuelCanonicalGrammar

/-! Fixed finite prefixes for the seven canonical fuel child positions. Every
environment occurrence retains the fixed action wrapper; mutable copies and
residual numeral tails are independent holes. These are admission prefixes,
not a replacement for the full canonical fuel parser or its priority proof. -/
namespace PureSFormal.Research.RootResetPendingAdmissionFuelPatterns
open PureSFormal.PureS
open RootResetCompletedLocalPatterns
open RootResetClockFuelStages RootResetClockFuelCanonicalGrammar

inductive Kind where
  | callZero | callPositive | positiveHalf | zeroFirst | zeroSecond | zeroThird | zeroFourth
  deriving DecidableEq, Repr

def kinds : List Kind := [.callZero, .callPositive, .positiveHalf, .zeroFirst, .zeroSecond, .zeroThird, .zeroFourth]

theorem kind_member (kind : Kind) : kind ∈ kinds := by cases kind <;> decide

def pattern (environment : Pattern) : Kind → Pattern
  | .callZero => .app (.app (literal (C 0)) environment) .hole
  | .callPositive => .app (.app (.app (literal b) .hole) environment) .hole
  | .positiveHalf => .app (.app (.app .s environment) (.app .hole environment)) .hole
  | .zeroFirst => .app (.app (.app (literal b) environment) (.app (literal b) environment)) .hole
  | .zeroSecond => .app (.app (.app .s (.app (literal b) environment))
      (.app environment (.app (literal b) environment))) .hole
  | .zeroThird => .app (.app (.app (literal b) environment) .hole)
      (.app (.app environment (.app (literal b) environment)) .hole)
  | .zeroFourth => .app (.app (.app .s .hole) (.app environment .hole)) .hole

def patterns (environment : Pattern) : List Pattern := kinds.map (pattern environment)

theorem canonical_matches (actions : Term) (environment : Pattern)
    (environmentMatches : ∀ payload, environment.matchesBool (CheckpointDecoder.openEnvironment actions payload) = true)
    (row : FuelRow) (canonical : CanonicalFuelRow actions row) :
    ∃ found ∈ patterns environment, found.matchesBool row.term = true := by
  have member (kind : Kind) : pattern environment kind ∈ patterns environment :=
    map_member _ (kind_member kind)
  cases row with
  | call fuel field continuation =>
      obtain ⟨⟨payload, rfl⟩, admissible⟩ := canonical
      cases fuel with
      | zero =>
          refine ⟨pattern environment .callZero, member _, ?_⟩
          simp only [pattern, FuelRow.term, Pattern.matchesBool, literal_self,
            environmentMatches, Bool.true_and, Bool.and_true]
      | succ fuel =>
          refine ⟨pattern environment .callPositive, member _, ?_⟩
          simp only [pattern, FuelRow.term, C, Pattern.matchesBool, literal_self,
            environmentMatches, Bool.true_and, Bool.and_true]
  | positiveHalf residual leftEnvironment rightEnvironment continuation =>
      obtain ⟨⟨leftPayload, rfl⟩, ⟨rightPayload, rfl⟩, admissible⟩ := canonical
      refine ⟨pattern environment .positiveHalf, member _, ?_⟩
      simp only [pattern, FuelRow.term, Pattern.matchesBool, literal_self,
        environmentMatches, Bool.true_and, Bool.and_true]
  | zeroFirst leftEnvironment rightEnvironment continuation =>
      obtain ⟨⟨leftPayload, rfl⟩, ⟨rightPayload, rfl⟩, admissible⟩ := canonical
      refine ⟨pattern environment .zeroFirst, member _, ?_⟩
      simp only [pattern, FuelRow.term, Pattern.matchesBool, literal_self,
        environmentMatches, Bool.true_and, Bool.and_true]
  | zeroSecond leftArgument function rightArgument continuation =>
      obtain ⟨⟨leftPayload, rfl⟩, ⟨functionPayload, rfl⟩, ⟨rightPayload, rfl⟩, admissible⟩ := canonical
      refine ⟨pattern environment .zeroSecond, member _, ?_⟩
      simp only [pattern, FuelRow.term, Pattern.matchesBool, literal_self,
        environmentMatches, Bool.true_and, Bool.and_true]
  | zeroThird field leftContinuation function rightArgument rightContinuation =>
      obtain ⟨⟨payload, rfl⟩, leftAdmissible, ⟨functionPayload, rfl⟩, ⟨rightPayload, rfl⟩, rightAdmissible⟩ := canonical
      refine ⟨pattern environment .zeroThird, member _, ?_⟩
      simp only [pattern, FuelRow.term, Pattern.matchesBool, literal_self,
        environmentMatches, Bool.true_and, Bool.and_true]
  | zeroFourth leftContinuation field rightContinuation alpha =>
      obtain ⟨leftAdmissible, ⟨payload, rfl⟩, rightAdmissible⟩ := canonical
      refine ⟨pattern environment .zeroFourth, member _, ?_⟩
      simp only [pattern, FuelRow.term, Pattern.matchesBool, literal_self,
        environmentMatches, Bool.true_and, Bool.and_true]

end PureSFormal.Research.RootResetPendingAdmissionFuelPatterns
