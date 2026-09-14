import PureSFormal.Research.ProtectedTrieCertificateEnumeration

/-!
# Permanent binary-prefix generator calibration

The persistence, exact finite-range, and cofinal-recovery clauses have an
abstract formulation independent of pure-`S` syntax.  A generator supplies a
rooted reachability relation, a finite ancestor-closed projection, validity of
every projected history, and monotonicity along reachable extensions.  These
data imply an actual finite run of genuine persistent frontier additions.
Exact finite range and cofinal insertion are stated as separate capabilities.

The pure-`S` protected trie instantiates this interface.  Its literal checked
observer, source-transition agreement, address-complete adjacent-step path,
and directed subdivision are the additional concrete conclusions packaged by
`protectedPersistentCertificateEnumeration`.
-/

namespace PureSFormal.Research.ProtectedPrefixGeneratorCalibration

open PureSFormal.PureS
open PureSFormal.Research.ProtectedTrieCertificates
open PureSFormal.Research.ProtectedTrieMachine
open PureSFormal.Research.ProtectedTrieProjection
open PureSFormal.Research.ProtectedTrieSeed
open PureSFormal.Research.ProtectedTrieStrong
open PureSFormal.Research.ProtectedTrieStrongTheorem
open PureSFormal.Research.ProtectedTrieTableau
open PureSFormal.Research.ProtectedTrieCertificateEnumeration

/-- Every represented member of a finite ideal satisfies `Valid`. -/
def IdealValid (Valid : BitWord -> Prop) (ideal : HistoryIdeal) : Prop :=
  forall history, ideal.Contains history -> Valid history

/-- Abstract permanent generator of finite valid binary-prefix ideals. -/
structure PermanentBinaryPrefixGenerator (State : Type) where
  root : State
  Reach : State -> State -> Prop
  projection : State -> HistoryIdeal
  Valid : BitWord -> Prop

  reach_trans : forall {first middle last},
    Reach first middle -> Reach middle last -> Reach first last

  projection_mono : forall {before after},
    Reach root before -> Reach before after ->
      (projection before).LE (projection after)

  projection_sound : forall {state history},
    Reach root state -> (projection state).Contains history -> Valid history

namespace PermanentBinaryPrefixGenerator

/-- Independent capability to build every finite valid ideal exactly. -/
def ExactFiniteRange
    {State : Type} (generator : PermanentBinaryPrefixGenerator State) : Prop :=
  forall ideal, IdealValid generator.Valid ideal ->
    exists checkpoint,
      generator.Reach generator.root checkpoint /\
      (generator.projection checkpoint).Equivalent ideal

/-- Independent capability to insert any finite valid ideal above a reduct. -/
def CofinalRecovery
    {State : Type} (generator : PermanentBinaryPrefixGenerator State) : Prop :=
  forall {reduct}, generator.Reach generator.root reduct ->
    forall ideal, IdealValid generator.Valid ideal ->
      exists join,
        generator.Reach reduct join /\
        (generator.projection reduct).LE (generator.projection join) /\
        ideal.LE (generator.projection join)

/-- Every reachable generator extension is a finite persistent-history run. -/
theorem allReductPermanence
    {State : Type} (generator : PermanentBinaryPrefixGenerator State)
    {before after : State}
    (hbefore : generator.Reach generator.root before)
    (hafter : generator.Reach before after) :
    PersistentReaches generator.Valid
      (generator.projection before) (generator.projection after) := by
  apply persistentSteps_of_le
  · exact generator.projection_mono hbefore hafter
  · intro history hcontains
    exact generator.projection_sound
      (generator.reach_trans hbefore hafter) hcontains

/-- Derived permanence together with supplied exact-range and cofinal-recovery
capabilities, with all quantifiers exposed. -/
theorem persistence_range_cofinality
    {State : Type} (generator : PermanentBinaryPrefixGenerator State)
    (exactRange : generator.ExactFiniteRange)
    (cofinality : generator.CofinalRecovery) :
    (forall {before after : State},
      generator.Reach generator.root before ->
      generator.Reach before after ->
        PersistentReaches generator.Valid
          (generator.projection before) (generator.projection after)) /\
    (forall ideal, IdealValid generator.Valid ideal ->
      exists checkpoint,
        generator.Reach generator.root checkpoint /\
        (generator.projection checkpoint).Equivalent ideal) /\
    (forall {reduct}, generator.Reach generator.root reduct ->
      forall ideal, IdealValid generator.Valid ideal ->
        exists join,
          generator.Reach reduct join /\
          (generator.projection reduct).LE (generator.projection join) /\
          ideal.LE (generator.projection join)) := by
  refine ⟨?_, exactRange, cofinality⟩
  intro before after hbefore hafter
  exact generator.allReductPermanence hbefore hafter

end PermanentBinaryPrefixGenerator

/-- The protected pure-`S` encoder as a permanent binary-prefix generator. -/
def pureSGenerator (source : Instance) :
    PermanentBinaryPrefixGenerator Term where
  root := strongEncoder source
  Reach := Steps
  projection := strongProjection
  Valid := ValidHistory source
  reach_trans := Steps.trans
  projection_mono := by
    intro before after hbefore hafter history hcontains
    obtain ⟨result, hpersistent, hequivalent⟩ :=
      strongProjection_steps_reaches source hbefore hafter
    exact (hequivalent history).mp
      (PersistentSteps.le hpersistent history hcontains)
  projection_sound := by
    intro state history hreach hcontains
    exact strongProjection_contains_valid_on_cone source hreach hcontains

/-- Pure-`S` inherits the generic persistence, range, and cofinality theorem. -/
theorem pureS_persistence_range_cofinality (source : Instance) :
    (forall {before after : Term},
      Steps (strongEncoder source) before -> Steps before after ->
        PersistentReaches (ValidHistory source)
          (strongProjection before) (strongProjection after)) /\
    (forall ideal, SourceIdealValid source ideal ->
      exists checkpoint,
        Steps (strongEncoder source) checkpoint /\
        (strongProjection checkpoint).Equivalent ideal) /\
    (forall {reduct}, Steps (strongEncoder source) reduct ->
      forall ideal, SourceIdealValid source ideal ->
        exists join,
          Steps reduct join /\
          (strongProjection reduct).LE (strongProjection join) /\
          ideal.LE (strongProjection join)) := by
  apply (pureSGenerator source).persistence_range_cofinality
  · intro ideal hideal
    refine ⟨strongCheckpoint source ideal [], ?_, ?_⟩
    · exact strongEncoder_steps_checkpoint source ideal []
    · exact strongCheckpoint_exact source ideal hideal []
  · intro reduct hreach ideal hideal
    exact strong_cofinal_complete source hreach ideal hideal

end PureSFormal.Research.ProtectedPrefixGeneratorCalibration
