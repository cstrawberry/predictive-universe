import PureSFormal.PureS.PublicDecoderPrimitive
import PureSFormal.PureS.CheckpointSeedReadback

/-!
# Primitive immutable-seed readback

The parser reads the initial generator or follows the literal continuation
chain to its terminal seed payload. That payload is an input subtree, so the
word parser's cost is bounded by the original term size. Pairing the seed with
the measured public decoder preserves its rejection priority and performs no
source execution. Program-dependent grammar is prepared before input parsing.
-/

namespace PureSFormal.PureS.CheckpointSeedReadbackPrimitive

open ParserPrimitiveMachine
open ParserRoutePrimitive (andThen charge andThen_value andThen_operations_le)

variable {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}

theorem terminal_payload_le {actions term : Term} {view : CheckpointDecoder.TerminalView}
    (found : CheckpointDecoder.parseTerminal? actions term = some view) :
    view.seedPayload.size ≤ term.size := by
  rw [(CheckpointDecoder.parseTerminal?_sound found).1]
  apply CarrierDecoder.subterm_size_le
    (address := [.right, .right, .right, .right])
  change view.seedPayload.subterm? [] = some view.seedPayload
  exact Term.subterm?_root view.seedPayload

def tailPayload : CheckpointDecoder.ChainTail program → Term
  | .terminal view => view.seedPayload
  | .completed view => view.terminal.seedPayload

theorem chainShape_payload_le {term : Term} {tail : CheckpointDecoder.ChainTail program}
    (shape : CheckpointDecoder.ChainShape program tree term tail) :
    (tailPayload tail).size ≤ term.size := by
  induction shape with
  | terminal view notLocal boundary => exact terminal_payload_le boundary
  | @«local» term view tail boundary inner ih =>
      have continuation := CheckpointDecoder.parseLocal?_continuation_size_lt boundary
      cases tail <;> exact Nat.le_trans ih (Nat.le_of_lt continuation)

theorem chain_payload_le (context : ParserCarrierPrimitive.Context program tree)
    {term : Term} {chain : CheckpointDecoder.ChainView program}
    (found : (ParserChainPrimitive.parse context term).value = some chain) :
    chain.terminal.seedPayload.size ≤ term.size :=
  chainShape_payload_le (CheckpointDecoder.parseChain?_sound
    ((ParserChainPrimitive.parse_value context term).symm.trans found))

def terminalWord (context : ParserCarrierPrimitive.Context program tree) (term : Term) :
    Result (Option (List Bool)) :=
  andThen (ParserChainPrimitive.parse context term) fun chain =>
    charge 2 (ParserWordPrimitive.parse chain.terminal.seedPayload)

theorem terminalWord_value (context : ParserCarrierPrimitive.Context program tree) (term : Term) :
    (terminalWord context term).value =
      (CheckpointDecoder.parseChain? program tree term).bind fun chain =>
        CheckpointDecoder.parseWord? chain.terminal.seedPayload := by
  unfold terminalWord
  rw [andThen_value, ParserChainPrimitive.parse_value]
  cases CheckpointDecoder.parseChain? program tree term with
  | none => rfl
  | some chain => exact ParserWordPrimitive.parse_value chain.terminal.seedPayload

theorem terminalWord_operations_le (context : ParserCarrierPrimitive.Context program tree)
    (localCoefficient : Nat)
    (localBound : ∀ term, (context.localParser term).operations ≤ localCoefficient * (term.size + 1))
    (term : Term) :
    (terminalWord context term).operations ≤
      (ParserChainPrimitive.coefficient context localCoefficient + 128) * (term.size + 1) ^ 2 + 9 := by
  have wordBound (chain : CheckpointDecoder.ChainView program)
      (found : (ParserChainPrimitive.parse context term).value = some chain) :
      (charge 2 (ParserWordPrimitive.parse chain.terminal.seedPayload)).operations ≤
        2 + 128 * (term.size + 1) ^ 2 := by
    exact Nat.add_le_add_left
      (Nat.le_trans (ParserWordPrimitive.parse_operations_le chain.terminal.seedPayload)
        (Nat.mul_le_mul_left 128 (ParserPositivePrimitive.square_mono (chain_payload_le context found)))) 2
  have counted := andThen_operations_le (ParserChainPrimitive.parse context term) _
    (2 + 128 * (term.size + 1) ^ 2) wordBound
  have bound := Nat.le_trans counted (Nat.add_le_add_right
    (Nat.add_le_add_right (ParserChainPrimitive.parse_operations_le context localCoefficient localBound term) 2) _)
  simpa only [show 9 = 5 + 2 + 2 by rfl, Nat.add_mul,
    Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using! bound

def seedPrepared (context : ParserCarrierPrimitive.Context program tree) (term : Term) :
    Result (Option (List Bool)) :=
  let initial := ParserEnvelopePrimitive.generator context.expectedAct term
  match initial.value with
  | some bits => ⟨some bits, initial.operations + 3⟩
  | none =>
      let terminal := terminalWord context term
      ⟨terminal.value, initial.operations + 1 + terminal.operations⟩

theorem seedPrepared_value (context : ParserCarrierPrimitive.Context program tree) (term : Term) :
    (seedPrepared context term).value = CheckpointSeedReadback.seed? program tree term := by
  unfold seedPrepared
  dsimp only
  rw [context.expectedAct_eq, ParserEnvelopePrimitive.generator_value]
  unfold CheckpointSeedReadback.seed?
  cases CheckpointDecoder.parseGenerator? (compileActions program tree) term with
  | some bits => rfl
  | none =>
      dsimp only
      rw [terminalWord_value]
      cases CheckpointDecoder.parseChain? program tree term <;> rfl

def seedCoefficient (context : ParserCarrierPrimitive.Context program tree) (localCoefficient : Nat) : Nat :=
  ParserCheckpointPrimitive.generatorCoefficient context.expectedAct +
    ParserChainPrimitive.coefficient context localCoefficient + 140

theorem seedPrepared_operations_le (context : ParserCarrierPrimitive.Context program tree)
    (localCoefficient : Nat)
    (localBound : ∀ term, (context.localParser term).operations ≤ localCoefficient * (term.size + 1))
    (term : Term) :
    (seedPrepared context term).operations ≤ seedCoefficient context localCoefficient * (term.size + 1) ^ 2 := by
  have overhead : (seedPrepared context term).operations ≤
      (ParserEnvelopePrimitive.generator context.expectedAct term).operations +
        (terminalWord context term).operations + 3 := by
    unfold seedPrepared
    dsimp only
    split
    · exact Nat.add_le_add_right (Nat.le_add_right _ _) 3
    · simpa only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using
        Nat.add_le_add_left (by decide : 1 ≤ 3)
          ((ParserEnvelopePrimitive.generator context.expectedAct term).operations +
            (terminalWord context term).operations)
  have first := Nat.add_le_add_right
    (Nat.add_le_add (ParserCheckpointPrimitive.generator_operations_le context.expectedAct term)
      (terminalWord_operations_le context localCoefficient localBound term)) 3
  have second := Nat.add_le_add_left (ParserPositivePrimitive.constant_le_square 12 term.size)
    (ParserCheckpointPrimitive.generatorCoefficient context.expectedAct * (term.size + 1) ^ 2 +
      (ParserChainPrimitive.coefficient context localCoefficient + 128) * (term.size + 1) ^ 2)
  exact Nat.le_trans overhead (Nat.le_trans first (by
    simpa only [seedCoefficient, show 140 = 128 + 12 by rfl, show 12 = 9 + 3 by rfl,
      Nat.add_mul, Nat.add_assoc] using second))

def seed (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :
    Term → Result (Option (List Bool)) :=
  let context := ParserLocalPrimitive.context program tree
  seedPrepared context

theorem seed_value (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (term : Term) :
    (seed program tree term).value = CheckpointSeedReadback.seed? program tree term :=
  seedPrepared_value (ParserLocalPrimitive.context program tree) term

theorem seed_operations_le (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) :
    (seed program tree term).operations ≤ seedCoefficient (ParserLocalPrimitive.context program tree)
      (ParserLocalPrimitive.coefficient program tree) * (term.size + 1) ^ 2 :=
  seedPrepared_operations_le (ParserLocalPrimitive.context program tree) _
    (ParserLocalPrimitive.context_operations_le program tree) term

def decode (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :
    Term → Result (Option (List Bool × WeakPath.DecodedCheckpoint program)) :=
  let publicParser := PublicDecoderPrimitive.decode program tree
  let seedParser := seed program tree
  fun term => andThen (publicParser term) fun checkpoint =>
    andThen (seedParser term) fun bits => ⟨some (bits, checkpoint), 2⟩

theorem decode_value (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (term : Term) :
    (decode program tree term).value = CheckpointSeedReadback.decode? program tree term := by
  change (andThen _ _).value = _
  rw [andThen_value, PublicDecoderPrimitive.decode_value]
  unfold CheckpointSeedReadback.decode?
  cases PublicDecoder.decode program tree term with
  | none => rfl
  | some checkpoint =>
      dsimp only [Option.bind]
      rw [andThen_value, seed_value]
      cases CheckpointSeedReadback.seed? program tree term <;> rfl

def coefficient (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  PublicDecoderPrimitive.coefficient program tree +
    seedCoefficient (ParserLocalPrimitive.context program tree) (ParserLocalPrimitive.coefficient program tree) + 6

theorem decode_operations_le (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : (decode program tree term).operations ≤ coefficient program tree * (term.size + 1) ^ 2 := by
  have continuationBound (checkpoint : WeakPath.DecodedCheckpoint program) :
      (andThen (seed program tree term) fun bits => ⟨some (bits, checkpoint), 2⟩).operations ≤
        (seed program tree term).operations + 4 := by
    have bound := andThen_operations_le (seed program tree term)
      (fun bits => ⟨some (bits, checkpoint), 2⟩) 2 (fun _ _ => Nat.le_refl _)
    simpa only [show 4 = 2 + 2 by rfl, Nat.add_assoc] using bound
  have counted := andThen_operations_le (PublicDecoderPrimitive.decode program tree term)
    (fun checkpoint => andThen (seed program tree term) fun bits => ⟨some (bits, checkpoint), 2⟩)
    ((seed program tree term).operations + 4) (fun checkpoint _ => continuationBound checkpoint)
  have bounded := Nat.add_le_add
    (PublicDecoderPrimitive.decode_operations_le program tree term) (seed_operations_le program tree term)
  have first := Nat.add_le_add_right bounded 6
  have second := Nat.add_le_add_left (ParserPositivePrimitive.constant_le_square 6 term.size)
    (PublicDecoderPrimitive.coefficient program tree * (term.size + 1) ^ 2 +
      seedCoefficient (ParserLocalPrimitive.context program tree) (ParserLocalPrimitive.coefficient program tree) *
        (term.size + 1) ^ 2)
  exact Nat.le_trans counted (Nat.le_trans
    (by simpa only [show 6 = 2 + 4 by rfl, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using first)
    (by simpa only [coefficient, show 6 = 2 + 4 by rfl, Nat.add_mul,
      Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using second))

end PureSFormal.PureS.CheckpointSeedReadbackPrimitive
