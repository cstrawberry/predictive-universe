import PureSFormal.PureS.PublicDecoderPrimitive
import PureSFormal.PureS.TermEventPrimitive
import PureSFormal.PureS.CheckpointSeedReadbackPrimitive

/-!
# Primitive operation certificates for the bare-term interfaces

Each certificate combines agreement with the executable interface and its
all-input operation bound. The fixed grammar is prepared before the term is
provided. Costs use immutable tree/list references and unary naturals;
contractions, binary arithmetic, and wall-clock time are different measures.
-/

namespace PureSFormal.PureS.PrimitiveInterfaceCertificates

theorem primitivePublicDecoder_resource_certificate
    (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (term : Term) :
    (PublicDecoderPrimitive.decode program tree term).value = PublicDecoder.decode program tree term ∧
      (PublicDecoderPrimitive.decode program tree term).operations ≤
        PublicDecoderPrimitive.coefficient program tree * (term.size + 1) ^ 2 :=
  ⟨PublicDecoderPrimitive.decode_value program tree term,
    PublicDecoderPrimitive.decode_operations_le program tree term⟩

theorem primitiveMarkedDetector_resource_certificate
    (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (term : Term) :
    (TermEventPrimitive.observesMarkedCheckpoint program tree term).value =
        TermEvent.observesMarkedCheckpoint? program tree term ∧
      (TermEventPrimitive.observesMarkedCheckpoint program tree term).operations ≤
        TermEventPrimitive.coefficient program tree * (term.size + 1) ^ 2 :=
  ⟨TermEventPrimitive.observesMarkedCheckpoint_value program tree term,
    TermEventPrimitive.observesMarkedCheckpoint_operations_le program tree term⟩

theorem primitiveSeedReadback_resource_certificate
    (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (term : Term) :
    (CheckpointSeedReadbackPrimitive.decode program tree term).value =
        CheckpointSeedReadback.decode? program tree term ∧
      (CheckpointSeedReadbackPrimitive.decode program tree term).operations ≤
        CheckpointSeedReadbackPrimitive.coefficient program tree * (term.size + 1) ^ 2 :=
  ⟨CheckpointSeedReadbackPrimitive.decode_value program tree term,
    CheckpointSeedReadbackPrimitive.decode_operations_le program tree term⟩

end PureSFormal.PureS.PrimitiveInterfaceCertificates
