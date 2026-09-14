import PureSFormal.PureS.ParserCheckpointPrimitive
import PureSFormal.PureS.PublicDecoder

/-!
# Primitive public decoder

The public horizon/configuration pair is constructed from the literal
checkpoint result. Its CTS phase is computed by the unary remainder machine;
the decoded queue is shared. No source transition is executed. Prepared
checkpoint grammar is fixed before the bare input term is supplied.
-/

namespace PureSFormal.PureS.PublicDecoderPrimitive

open ParserPrimitiveMachine
open ParserRoutePrimitive (andThen andThen_value andThen_operations_le)

def phase (program : CTS.Program) (horizon : Nat) : Result (CTS.Phase program) :=
  let computed := ParserPhasePrimitive.remainder program.period horizon
  ⟨⟨computed.value, ParserPhasePrimitive.remainder_lt program.period program.period_pos horizon⟩,
    computed.operations + 1⟩

theorem phase_value (program : CTS.Program) (horizon : Nat) :
    (phase program horizon).value = CTS.iteratePhase program horizon (CTS.zeroPhase program) := by
  apply Fin.ext
  change (ParserPhasePrimitive.remainder program.period horizon).value = _
  rw [ParserPhasePrimitive.remainder_value program.period program.period_pos, CTS.iteratePhase_val]
  exact congrArg (fun count => count % program.period) (Nat.zero_add horizon).symm

def config (program : CTS.Program) (horizon : Nat) (queue : List Bool) : Result (CTS.Config program) :=
  let current := phase program horizon
  ⟨⟨current.value, queue⟩, current.operations + 1⟩

theorem config_value (program : CTS.Program) (horizon : Nat) (queue : List Bool) :
    (config program horizon queue).value = PublicDecoder.decodedConfig program horizon queue := by
  change CTS.Config.mk (phase program horizon).value queue = _
  rw [phase_value]
  rfl

def repack (program : CTS.Program) :
    CheckpointDecoder.Result program → Result (WeakPath.DecodedCheckpoint program)
  | .zero bits =>
      let current := config program 0 bits
      ⟨(0, current.value), current.operations + 4⟩
  | .positive view =>
      let current := config program view.horizon view.queue
      ⟨(view.horizon, current.value), current.operations + 5⟩

theorem repack_value (program : CTS.Program) (result : CheckpointDecoder.Result program) :
    (repack program result).value = PublicDecoder.repack program result := by
  cases result with
  | zero bits => rfl
  | positive view =>
      change (view.horizon, (config program view.horizon view.queue).value) = _
      rw [config_value]
      rfl

def horizon : CheckpointDecoder.Result program → Nat
  | .zero _ => 0
  | .positive view => view.horizon

theorem repack_operations_le (program : CTS.Program) (result : CheckpointDecoder.Result program) :
    (repack program result).operations ≤ (4 * program.period + 7) * horizon result + 9 := by
  cases result with
  | zero bits => exact (by decide : 8 ≤ 9)
  | positive view =>
      have bound := Nat.add_le_add_right
        (ParserPhasePrimitive.remainder_operations_le program.period program.period_pos view.horizon) 7
      simpa only [repack, config, phase, horizon, show 9 = 2 + 7 by rfl,
        show 7 = 1 + 1 + 5 by rfl, Nat.add_assoc] using bound

theorem positive_horizon_le {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : CheckpointDecoder.PositiveView program}
    (found : CheckpointDecoder.parsePositive? program tree term = some view) : view.horizon ≤ term.size := by
  obtain ⟨chain, shape, phase, carrier, marker, same⟩ := CheckpointDecoder.parsePositive?_sound found
  rw [congrArg CheckpointDecoder.PositiveView.horizon same]
  exact (ParserPositivePrimitive.chainShape_bounds shape).1

theorem horizon_le {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {result : CheckpointDecoder.Result program}
    (found : (ParserCheckpointPrimitive.decode program tree term).value = some result) :
    horizon result ≤ term.size := by
  rw [ParserCheckpointPrimitive.decode_value] at found
  unfold CheckpointDecoder.decode? at found
  cases initial : CheckpointDecoder.parseGenerator? (compileActions program tree) term with
  | some bits =>
      rw [initial] at found
      cases found
      exact Nat.zero_le _
  | none =>
      rw [initial] at found
      cases positive : CheckpointDecoder.parsePositive? program tree term with
      | none => rw [positive] at found; cases found
      | some view =>
          rw [positive] at found
          cases found
          exact positive_horizon_le positive

def wrap (program : CTS.Program) (result : CheckpointDecoder.Result program) :
    Result (Option (WeakPath.DecodedCheckpoint program)) :=
  let packed := repack program result
  ⟨some packed.value, packed.operations + 1⟩

def decode (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :
    Term → Result (Option (WeakPath.DecodedCheckpoint program)) :=
  let context := ParserLocalPrimitive.context program tree
  fun term => andThen (ParserCheckpointPrimitive.decodePrepared context term) (wrap program)

theorem decode_value (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (term : Term) :
    (decode program tree term).value = PublicDecoder.decode program tree term := by
  change (andThen _ _).value = _
  rw [andThen_value, ParserCheckpointPrimitive.decodePrepared_value]
  unfold PublicDecoder.decode
  cases CheckpointDecoder.decode? program tree term with
  | none => rfl
  | some result =>
      change some (repack program result).value = some (PublicDecoder.repack program result)
      rw [repack_value]

def coefficient (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  ParserCheckpointPrimitive.coefficient program tree + (4 * program.period + 7) + 12

theorem decode_operations_le (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : (decode program tree term).operations ≤ coefficient program tree * (term.size + 1) ^ 2 := by
  have wrapBound (result : CheckpointDecoder.Result program)
      (found : (ParserCheckpointPrimitive.decode program tree term).value = some result) :
      (wrap program result).operations ≤ (4 * program.period + 7) * term.size + 10 := by
    have first := Nat.add_le_add_right (repack_operations_le program result) 1
    have second := Nat.add_le_add_right (Nat.mul_le_mul_left (4 * program.period + 7) (horizon_le found)) 10
    exact Nat.le_trans (by simpa only [show 10 = 9 + 1 by rfl, Nat.add_assoc] using! first) second
  have counted := andThen_operations_le (ParserCheckpointPrimitive.decode program tree term) (wrap program)
    ((4 * program.period + 7) * term.size + 10) wrapBound
  have first := Nat.le_trans counted (Nat.add_le_add_right
    (Nat.add_le_add_right (ParserCheckpointPrimitive.decode_operations_le program tree term) 2) _)
  have phaseBound := Nat.le_trans
    (Nat.mul_le_mul_left (4 * program.period + 7) (Nat.le_succ term.size))
    (ParserCarrierPrimitive.linear_le_square (4 * program.period + 7) term.size)
  have second := Nat.add_le_add_left
    (Nat.add_le_add phaseBound (ParserPositivePrimitive.constant_le_square 12 term.size))
    (ParserCheckpointPrimitive.coefficient program tree * (term.size + 1) ^ 2)
  exact Nat.le_trans first (by simpa only [coefficient, show 12 = 2 + 10 by rfl,
    Nat.add_mul, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using second)

end PureSFormal.PureS.PublicDecoderPrimitive
