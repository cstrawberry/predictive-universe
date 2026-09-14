import PureSFormal.Research.RootResetTraversableCompletedParents

namespace PureSFormal.Research.CarrierParserExamples

open PureSFormal PureSFormal.PureS PureSFormal.Research

def tiny : CTS.Program :=
  { period := 1, period_pos := by decide, appendant := fun _ => [] }

def tinyTree : Dispatcher.Tree (ActionLabel tiny) :=
  .leaf ((⟨0, by decide⟩ : CTS.Phase tiny), false)

#eval RootResetAccumulatorClassifier.classify?
  (Carrier.tombstone false (.s : Term) .s)

#eval CheckpointDecoder.decodeCarrier?
  tiny tinyTree
  (Carrier.tombstone false (.s : Term) .s)

#eval RootResetAccumulatorClassifier.classify?
  (.app (live true) (Carrier.tombstone false (.s : Term) .s))

#eval CheckpointDecoder.decodeCarrier?
  tiny tinyTree
  (.app (live true) (Carrier.tombstone false (.s : Term) .s))

end PureSFormal.Research.CarrierParserExamples
