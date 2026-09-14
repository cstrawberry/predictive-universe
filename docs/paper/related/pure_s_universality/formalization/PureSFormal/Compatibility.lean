import PureSFormal.WeakPathUniversality

/-!
# Opt-in compatibility names

This module is absent from `PureSFormal.lean` and from the public theorem
and axiom inventories.  It provides aliases to clients that explicitly
import `PureSFormal.Compatibility`.  Each alias refers to the declaration
on its right-hand side; defining modules also expose those names directly.
-/

namespace PureSFormal

namespace WeakPathUniversality

abbrev universalAccepts_iff_fixedPureSTermEvent :=
  universalAccepts_iff_fixedPureSMarkedSnapshotTermEvent

abbrev fixedPureSTermEvent_sigmaOneComplete :=
  fixedPureSMarkedSnapshotTermEvent_exponentialCounterBoundedRunComplete

abbrev fixedPureSMarkedSnapshotTermEvent_sigmaOneComplete :=
  fixedPureSMarkedSnapshotTermEvent_exponentialCounterBoundedRunComplete

abbrev encodedSigmaOneFormula_iff_fixedPureSMarkedSnapshotTermEvent :=
  encodedBoundedWitnessFormula_iff_fixedPureSMarkedSnapshotTermEvent

abbrev fixedPureSMarkedSnapshotTermEvent_encodedBoundedWitnessComplete :=
  fixedPureSMarkedSnapshotTermEvent_exponentialCounterBoundedRunComplete

abbrev fixedPureSMarkedSnapshotTermEvent_counterMachineComplete :=
  fixedPureSMarkedSnapshotTermEvent_directInputCounterComplete

abbrev fixedPureSMarkedSnapshotNatLanguage_encodedBoundedWitnessComplete :=
  fixedPureSMarkedSnapshotNatLanguage_exponentialCounterBoundedRunComplete

abbrev fixedPureSMarkedSnapshotNatLanguage_counterMachineComplete :=
  fixedPureSMarkedSnapshotNatLanguage_directInputCounterComplete

end WeakPathUniversality

end PureSFormal
