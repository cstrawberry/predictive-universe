import PureSFormal.PureS.ParserChainPrimitive
import PureSFormal.PureS.ParserPhasePrimitive
import PureSFormal.PureS.ParserLocalPrimitive

/-!
# Primitive positive-checkpoint decoding

Continuation-chain parsing supplies a terminal horizon and the last local
accumulator. Both are bounded by the original input tree. Unary phase
computation, recursive carrier decoding, and the final halt-marker comparison
therefore have explicit bounds on every input, including rejected terms.
-/

namespace PureSFormal.PureS.ParserPositivePrimitive

open ParserPrimitiveMachine
open ParserRoutePrimitive (andThen charge andThen_value andThen_operations_le)

variable {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}

theorem terminal_horizon_le {actions term : Term} {view : CheckpointDecoder.TerminalView}
    (found : CheckpointDecoder.parseTerminal? actions term = some view) :
    view.horizon ≤ term.size := by
  have shape := (CheckpointDecoder.parseTerminal?_sound found).1
  rw [shape]
  have count := ParserTerminalPrimitive.carrier_count_size (view.horizon + 1)
  have carrierBound : (C (view.horizon + 1)).size ≤
      (Dovetail.clockExit view.horizon 0
        (CheckpointDecoder.openEnvironment actions view.seedPayload)).size := by
    dsimp only [Dovetail.clockExit, clockWrappers, clockBase, Term.size]
    simp only [Nat.succ_eq_add_one]
    exact Nat.le_trans (Nat.le_add_right _ _)
      (Nat.le_trans (Nat.le_add_right _ _)
        (Nat.le_trans (Nat.le_add_right _ _) (Nat.le_add_right _ _)))
  exact Nat.le_trans (Nat.le_succ view.horizon) (Nat.le_trans count carrierBound)

def TailBounds (term : Term) : CheckpointDecoder.ChainTail program → Prop
  | .terminal view => view.horizon ≤ term.size
  | .completed view => view.terminal.horizon ≤ term.size ∧ view.last.accumulator.size < term.size

theorem chainShape_bounds {term : Term} {tail : CheckpointDecoder.ChainTail program}
    (shape : CheckpointDecoder.ChainShape program tree term tail) : TailBounds term tail := by
  induction shape with
  | terminal view notLocal boundary => exact terminal_horizon_le boundary
  | @«local» term view tail boundary inner ih =>
      have continuation := CheckpointDecoder.parseLocal?_continuation_size_lt boundary
      cases tail with
      | terminal terminal =>
          exact ⟨Nat.le_trans ih (Nat.le_of_lt continuation),
            CheckpointDecoder.parseLocal?_accumulator_size_lt boundary⟩
      | completed completed =>
          exact ⟨Nat.le_trans ih.1 (Nat.le_of_lt continuation), Nat.lt_trans ih.2 continuation⟩

theorem chain_bounds (context : ParserCarrierPrimitive.Context program tree)
    {term : Term} {chain : CheckpointDecoder.ChainView program}
    (found : (ParserChainPrimitive.parse context term).value = some chain) :
    chain.terminal.horizon ≤ term.size ∧ chain.last.accumulator.size < term.size :=
  chainShape_bounds (CheckpointDecoder.parseChain?_sound
    ((ParserChainPrimitive.parse_value context term).symm.trans found))

def marker : CheckpointDecoder.HaltStatus → List Bool → Result Bool
  | .fresh, [] => ⟨false, 2⟩
  | .fresh, _ :: _ => ⟨true, 2⟩
  | .marked, [] => ⟨true, 2⟩
  | .marked, _ :: _ => ⟨false, 2⟩

theorem marker_value (status : CheckpointDecoder.HaltStatus) (queue : List Bool) :
    (marker status queue).value = CheckpointDecoder.markerCompatible status queue := by
  cases status <;> cases queue <;> rfl

theorem marker_operations (status : CheckpointDecoder.HaltStatus) (queue : List Bool) :
    (marker status queue).operations = 2 := by
  cases status <;> cases queue <;> rfl

def finish (chain : CheckpointDecoder.ChainView program) (queue : List Bool) :
    Result (Option (CheckpointDecoder.PositiveView program)) :=
  let last := chain.last
  let terminal := chain.terminal
  let compatible := marker last.status queue
  if compatible.value then
    ⟨some ⟨terminal.horizon, last.route, last.label, queue⟩, compatible.operations + 9⟩
  else
    ⟨none, compatible.operations + 5⟩

theorem finish_value (chain : CheckpointDecoder.ChainView program) (queue : List Bool) :
    (finish chain queue).value =
      if CheckpointDecoder.markerCompatible chain.last.status queue then
        some ⟨chain.terminal.horizon, chain.last.route, chain.last.label, queue⟩ else none := by
  unfold finish
  dsimp only
  rw [marker_value]
  split <;> rfl

theorem finish_operations_le (chain : CheckpointDecoder.ChainView program) (queue : List Bool) :
    (finish chain queue).operations ≤ 11 := by
  unfold finish
  dsimp only
  split
  · rw [marker_operations]
    exact Nat.le_refl _
  · rw [marker_operations]
    exact (by decide : 2 + 5 ≤ 11)

def afterPhase (context : ParserCarrierPrimitive.Context program tree)
    (chain : CheckpointDecoder.ChainView program) :
    Result (Option (CheckpointDecoder.PositiveView program)) :=
  charge 2 (andThen (ParserCarrierPrimitive.decode context chain.last.accumulator) (finish chain))

theorem afterPhase_value (context : ParserCarrierPrimitive.Context program tree)
    (chain : CheckpointDecoder.ChainView program) :
    (afterPhase context chain).value =
      (CheckpointDecoder.decodeCarrier? program tree chain.last.accumulator).bind fun queue =>
        if CheckpointDecoder.markerCompatible chain.last.status queue then
          some ⟨chain.terminal.horizon, chain.last.route, chain.last.label, queue⟩ else none := by
  change (andThen _ _).value = _
  rw [andThen_value, ParserCarrierPrimitive.decode_value]
  cases CheckpointDecoder.decodeCarrier? program tree chain.last.accumulator with
  | none => rfl
  | some queue => exact finish_value chain queue

theorem afterPhase_operations_le (context : ParserCarrierPrimitive.Context program tree)
    (chain : CheckpointDecoder.ChainView program) :
    (afterPhase context chain).operations ≤
      (ParserCarrierPrimitive.decode context chain.last.accumulator).operations + 15 := by
  have bound := Nat.add_le_add_left (andThen_operations_le
    (ParserCarrierPrimitive.decode context chain.last.accumulator) (finish chain) 11
    (fun queue _ => finish_operations_le chain queue)) 2
  simpa only [show 15 = 2 + 2 + 11 by rfl, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using! bound

def validate (context : ParserCarrierPrimitive.Context program tree)
    (chain : CheckpointDecoder.ChainView program) :
    Result (Option (CheckpointDecoder.PositiveView program)) :=
  let phase := ParserPhasePrimitive.check program.period chain.terminal.horizon chain.last.label.1.val
  if phase.value then
    let output := afterPhase context chain
    ⟨output.value, phase.operations + 7 + output.operations⟩
  else
    ⟨none, phase.operations + 8⟩

theorem phase_check (chain : CheckpointDecoder.ChainView program) :
    (ParserPhasePrimitive.check program.period chain.terminal.horizon chain.last.label.1.val).value = true ↔
      chain.last.label.1 = CheckpointDecoder.expectedPhase program chain.terminal.horizon := by
  rw [ParserPhasePrimitive.check_value program.period program.period_pos]
  exact ⟨fun equal => Fin.ext equal, fun equal => congrArg Fin.val equal⟩

theorem validate_value (context : ParserCarrierPrimitive.Context program tree)
    (chain : CheckpointDecoder.ChainView program) :
    (validate context chain).value =
      if chain.last.label.1 = CheckpointDecoder.expectedPhase program chain.terminal.horizon then
        (CheckpointDecoder.decodeCarrier? program tree chain.last.accumulator).bind fun queue =>
          if CheckpointDecoder.markerCompatible chain.last.status queue then
            some ⟨chain.terminal.horizon, chain.last.route, chain.last.label, queue⟩ else none
      else none := by
  unfold validate
  dsimp only
  by_cases same : chain.last.label.1 = CheckpointDecoder.expectedPhase program chain.terminal.horizon
  · rw [if_pos ((phase_check chain).mpr same), if_pos same]
    exact afterPhase_value context chain
  · rw [if_neg (fun accepted => same ((phase_check chain).mp accepted)), if_neg same]

theorem validate_operations_le (context : ParserCarrierPrimitive.Context program tree)
    (chain : CheckpointDecoder.ChainView program) :
    (validate context chain).operations ≤
      (ParserPhasePrimitive.check program.period chain.terminal.horizon chain.last.label.1.val).operations +
      (ParserCarrierPrimitive.decode context chain.last.accumulator).operations + 22 := by
  unfold validate
  dsimp only
  split
  · have bound := Nat.add_le_add_left (afterPhase_operations_le context chain)
      ((ParserPhasePrimitive.check program.period chain.terminal.horizon chain.last.label.1.val).operations + 7)
    simpa only [show 22 = 7 + 15 by rfl, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound
  · exact Nat.le_trans (Nat.add_le_add_left (by decide : 8 ≤ 22) _)
      (Nat.add_le_add_right (Nat.le_add_right _ _) 22)

def parse (context : ParserCarrierPrimitive.Context program tree) (term : Term) :
    Result (Option (CheckpointDecoder.PositiveView program)) :=
  andThen (ParserChainPrimitive.parse context term) (validate context)

theorem parse_value (context : ParserCarrierPrimitive.Context program tree) (term : Term) :
    (parse context term).value = CheckpointDecoder.parsePositive? program tree term := by
  unfold parse
  rw [andThen_value, ParserChainPrimitive.parse_value]
  unfold CheckpointDecoder.parsePositive?
  cases CheckpointDecoder.parseChain? program tree term with
  | none => rfl
  | some chain =>
      dsimp only [Option.bind]
      rw [validate_value]
      split
      · cases CheckpointDecoder.decodeCarrier? program tree chain.last.accumulator <;> rfl
      · rfl

def coefficient (context : ParserCarrierPrimitive.Context program tree) (localCoefficient : Nat) : Nat :=
  ParserChainPrimitive.coefficient context localCoefficient +
    ParserCarrierPrimitive.coefficient context localCoefficient + (4 * program.period + 12) + 29

theorem square_mono {first second : Nat} (bound : first ≤ second) :
    (first + 1) ^ 2 ≤ (second + 1) ^ 2 :=
  Nat.pow_le_pow_left (Nat.add_le_add_right bound 1) 2

theorem constant_le_square (constant size : Nat) : constant ≤ constant * (size + 1) ^ 2 :=
  Nat.le_trans (ParserRoutePrimitive.constant_le_scale constant size)
    (ParserCarrierPrimitive.linear_le_square constant size)

theorem parse_operations_le (context : ParserCarrierPrimitive.Context program tree)
    (localCoefficient : Nat)
    (localBound : ∀ term, (context.localParser term).operations ≤ localCoefficient * (term.size + 1))
    (term : Term) :
    (parse context term).operations ≤ coefficient context localCoefficient * (term.size + 1) ^ 2 := by
  let phaseCoefficient := 4 * program.period + 12
  let carrierCoefficient := ParserCarrierPrimitive.coefficient context localCoefficient
  let chainCoefficient := ParserChainPrimitive.coefficient context localCoefficient
  have validateBound (chain : CheckpointDecoder.ChainView program)
      (found : (ParserChainPrimitive.parse context term).value = some chain) :
      (validate context chain).operations ≤
        phaseCoefficient * (term.size + 1) ^ 2 + carrierCoefficient * (term.size + 1) ^ 2 + 22 := by
    obtain ⟨horizonBound, accumulatorBound⟩ := chain_bounds context found
    have phase := Nat.le_trans
      (ParserPhasePrimitive.check_operations_le program.period program.period_pos
        chain.terminal.horizon chain.last.label.1.val)
      (Nat.le_trans (Nat.mul_le_mul_left phaseCoefficient (Nat.add_le_add_right horizonBound 1))
        (ParserCarrierPrimitive.linear_le_square phaseCoefficient term.size))
    have carrier := Nat.le_trans
      (ParserCarrierPrimitive.decode_operations_le context localCoefficient localBound chain.last.accumulator)
      (Nat.mul_le_mul_left carrierCoefficient (square_mono (Nat.le_of_lt accumulatorBound)))
    exact Nat.le_trans (validate_operations_le context chain)
      (Nat.add_le_add_right (Nat.add_le_add phase carrier) 22)
  have counted := andThen_operations_le (ParserChainPrimitive.parse context term) (validate context)
    (phaseCoefficient * (term.size + 1) ^ 2 + carrierCoefficient * (term.size + 1) ^ 2 + 22)
    validateBound
  have first := Nat.le_trans counted (Nat.add_le_add_right
    (Nat.add_le_add_right (ParserChainPrimitive.parse_operations_le context localCoefficient localBound term) 2) _)
  have second := Nat.add_le_add_left (constant_le_square 29 term.size)
    (chainCoefficient * (term.size + 1) ^ 2 + phaseCoefficient * (term.size + 1) ^ 2 +
      carrierCoefficient * (term.size + 1) ^ 2)
  exact Nat.le_trans first (by simpa only [coefficient, phaseCoefficient, carrierCoefficient,
    chainCoefficient, show 29 = 5 + 2 + 22 by rfl, Nat.add_mul,
    Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using second)

end PureSFormal.PureS.ParserPositivePrimitive
