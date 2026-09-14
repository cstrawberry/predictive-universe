import PureSFormal.PureS.CheckpointSeedReadbackPrimitive
import PureSFormal.PureS.CheckpointSeedReflection
import PureSFormal.PureS.EncoderSize

/-!
# All-input field bounds for bare-term output composition

Every accepted immutable seed, horizon, and current dataword is bounded by the
size of the literal input tree. These are syntactic grammar results, requiring
no reachability assumption. The measured observer composition charges its field
reads and both option branches before applying an independently measured reader.
-/

namespace PureSFormal.Computation.BareTermReadbackFields

open PureS PureS.ParserPrimitiveMachine PureS.ParserRoutePrimitive

theorem generator_length_le (actions : Term) (bits : List Bool) :
    bits.length ≤ (generator actions bits).size := by
  have length := ParserWordPrimitive.parsed_length_le
    ((ParserWordPrimitive.parse_value (word bits)).trans (CheckpointDecoder.parseWord?_word bits))
  rw [size_generator_exact]
  exact Nat.le_trans length (Nat.le_add_left _ _)

theorem public_fields (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) (checkpoint : WeakPath.DecodedCheckpoint program)
    (found : PublicDecoder.decode program tree term = some checkpoint) :
    checkpoint.1 ≤ term.size ∧ checkpoint.2.data.length ≤ term.size := by
  unfold PublicDecoder.decode at found
  cases parsed : CheckpointDecoder.decode? program tree term with
  | none => rw [parsed] at found; cases found
  | some result =>
      rw [parsed] at found
      cases found
      have shape := CheckpointDecoder.decode?_sound program tree parsed
      cases shape with
      | zero bits termEq =>
          subst term
          exact ⟨Nat.zero_le _, generator_length_le _ bits⟩
      | positive view notZero positive =>
          obtain ⟨chain, shape, phase, carrier, marker, same⟩ := positive
          have horizon := (ParserPositivePrimitive.chainShape_bounds shape).1
          have queue := Nat.le_trans (ParserCarrierPrimitive.decoded_length_le carrier)
            (Nat.le_of_lt (ParserPositivePrimitive.chainShape_bounds shape).2)
          exact ⟨Nat.le_trans (Nat.le_of_eq (congrArg CheckpointDecoder.PositiveView.horizon same)) horizon, queue⟩

theorem seed_length_le (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) (bits : List Bool)
    (found : CheckpointSeedReadback.seed? program tree term = some bits) : bits.length ≤ term.size := by
  unfold CheckpointSeedReadback.seed? at found
  cases initial : CheckpointDecoder.parseGenerator? (compileActions program tree) term with
  | some original =>
      rw [initial] at found
      cases found
      rw [CheckpointDecoder.parseGenerator?_sound initial]
      exact generator_length_le _ _
  | none =>
      rw [initial] at found
      cases parsed : CheckpointDecoder.parseChain? program tree term with
      | none => rw [parsed] at found; cases found
      | some chain =>
          rw [parsed] at found
          have wordBound := ParserWordPrimitive.parsed_length_le
            ((ParserWordPrimitive.parse_value chain.terminal.seedPayload).trans found)
          exact Nat.le_trans wordBound (CheckpointSeedReadbackPrimitive.chainShape_payload_le
            (CheckpointDecoder.parseChain?_sound parsed))

theorem decode_fields (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) (bits : List Bool) (checkpoint : WeakPath.DecodedCheckpoint program)
    (found : (CheckpointSeedReadbackPrimitive.decode program tree term).value = some (bits, checkpoint)) :
    bits.length ≤ term.size ∧ checkpoint.1 ≤ term.size ∧ checkpoint.2.data.length ≤ term.size := by
  rw [CheckpointSeedReadbackPrimitive.decode_value] at found
  have publicBound := public_fields program tree term checkpoint (CheckpointSeedReadback.decode?_public found)
  have seedFound : CheckpointSeedReadback.seed? program tree term = some bits := by
    unfold CheckpointSeedReadback.decode? at found
    cases current : PublicDecoder.decode program tree term with
    | none => rw [current] at found; cases found
    | some current =>
        rw [current] at found
        cases original : CheckpointSeedReadback.seed? program tree term with
        | none => rw [original] at found; cases found
        | some original =>
            rw [original] at found
            have same := congrArg Prod.fst (Option.some.inj found)
            exact congrArg some same
  exact ⟨seed_length_le program tree term bits seedFound, publicBound⟩

def observe {α : Type} (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (read : List Bool → Nat → CTS.Config program → Result (Option α)) (term : Term) : Result (Option α) :=
  andThen (CheckpointSeedReadbackPrimitive.decode program tree term) fun decoded =>
    let checkpoint := decoded.2
    charge 6 (read decoded.1 checkpoint.1 checkpoint.2)

theorem observe_value {α : Type} (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (read : List Bool → Nat → CTS.Config program → Result (Option α)) (term : Term) :
    (observe program tree read term).value =
      CheckpointSeedReflection.observe program tree
        (fun bits horizon snapshot => (read bits horizon snapshot).value) term := by
  rw [observe, andThen_value, CheckpointSeedReadbackPrimitive.decode_value]
  unfold CheckpointSeedReflection.observe
  cases CheckpointSeedReadback.decode? program tree term with
  | none => rfl
  | some decoded => rfl

theorem observe_operations_le {α : Type} (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (read : List Bool → Nat → CTS.Config program → Result (Option α)) (term : Term) (budget : Nat)
    (readBound : ∀ bits horizon snapshot, bits.length ≤ term.size → snapshot.data.length ≤ term.size →
      (read bits horizon snapshot).operations ≤ budget) :
    (observe program tree read term).operations ≤
      CheckpointSeedReadbackPrimitive.coefficient program tree * (term.size + 1)^2 + budget + 8 := by
  have continuation (decoded : List Bool × WeakPath.DecodedCheckpoint program)
      (found : (CheckpointSeedReadbackPrimitive.decode program tree term).value = some decoded) :
      (charge 6 (read decoded.1 decoded.2.1 decoded.2.2)).operations ≤ 6 + budget := by
    have fields := decode_fields program tree term decoded.1 decoded.2 found
    exact Nat.add_le_add_left (readBound decoded.1 decoded.2.1 decoded.2.2 fields.1 fields.2.2) 6
  have bound := andThen_operations_le (CheckpointSeedReadbackPrimitive.decode program tree term) _
    (6 + budget) continuation
  have bounded := Nat.le_trans bound (Nat.add_le_add_right (Nat.add_le_add_right
    (CheckpointSeedReadbackPrimitive.decode_operations_le program tree term) 2) (6 + budget))
  simpa only [observe, show 8 = 2 + 6 by rfl, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bounded

end PureSFormal.Computation.BareTermReadbackFields
