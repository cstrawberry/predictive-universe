import PureSFormal.PureS.ParserCarrierPrimitive
import PureSFormal.PureS.ParserTerminalPrimitive

/-!
# Primitive continuation-chain parsing

Each successful local parse selects its continuation reference. The first
non-local input is checked by the primitive terminal parser. Chain-layer
counts are immutable unary naturals: adding an outer local allocates one
successor and shares the old layer count. Every failed lookup and terminal
check remains in the operation total.
-/

namespace PureSFormal.PureS.ParserChainPrimitive

open ParserPrimitiveMachine ParserCarrierPrimitive

variable {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}

def prepend (outer : CheckpointDecoder.LocalView program) :
    CheckpointDecoder.ChainTail program → Result (CheckpointDecoder.ChainTail program)
  | .terminal terminal => ⟨.completed ⟨1, terminal, outer⟩, 6⟩
  | .completed inner => ⟨.completed ⟨.succ inner.layers, inner.terminal, inner.last⟩, 8⟩

theorem prepend_value (outer : CheckpointDecoder.LocalView program)
    (tail : CheckpointDecoder.ChainTail program) :
    (prepend outer tail).value = CheckpointDecoder.prependLocal outer tail := by
  cases tail <;> rfl

theorem prepend_operations_le (outer : CheckpointDecoder.LocalView program)
    (tail : CheckpointDecoder.ChainTail program) : (prepend outer tail).operations ≤ 8 := by
  cases tail with
  | terminal terminal => exact (by decide : 6 ≤ 8)
  | completed inner => exact Nat.le_refl _

def prependOption (outer : CheckpointDecoder.LocalView program)
    (parsed : Result (Option (CheckpointDecoder.ChainTail program))) :
    Result (Option (CheckpointDecoder.ChainTail program)) :=
  match parsed.value with
  | none => ⟨none, parsed.operations + 2⟩
  | some tail =>
      let result := prepend outer tail
      ⟨some result.value, parsed.operations + 3 + result.operations⟩

theorem prependOption_value (outer : CheckpointDecoder.LocalView program)
    (parsed : Result (Option (CheckpointDecoder.ChainTail program))) :
    (prependOption outer parsed).value = parsed.value.map (CheckpointDecoder.prependLocal outer) := by
  unfold prependOption
  cases found : parsed.value with
  | none => rfl
  | some tail =>
      dsimp only
      rw [prepend_value]
      rfl

theorem prependOption_operations_le (outer : CheckpointDecoder.LocalView program)
    (parsed : Result (Option (CheckpointDecoder.ChainTail program))) :
    (prependOption outer parsed).operations ≤ parsed.operations + 11 := by
  unfold prependOption
  split
  · exact Nat.add_le_add_left (by decide : 2 ≤ 11) _
  · next tail found =>
      simpa only [show 11 = 3 + 8 by rfl, Nat.add_assoc] using
        Nat.add_le_add_left (prepend_operations_le outer tail) (parsed.operations + 3)

def terminalOption (parsed : Result (Option CheckpointDecoder.TerminalView)) :
    Result (Option (CheckpointDecoder.ChainTail program)) :=
  match parsed.value with
  | none => ⟨none, parsed.operations + 2⟩
  | some terminal => ⟨some (.terminal terminal), parsed.operations + 4⟩

theorem terminalOption_value (parsed : Result (Option CheckpointDecoder.TerminalView)) :
    (terminalOption (program := program) parsed).value =
      parsed.value.map CheckpointDecoder.ChainTail.terminal := by
  unfold terminalOption
  cases parsed.value <;> rfl

theorem terminalOption_operations_le (parsed : Result (Option CheckpointDecoder.TerminalView)) :
    (terminalOption (program := program) parsed).operations ≤ parsed.operations + 4 := by
  unfold terminalOption
  split
  · exact Nat.add_le_add_left (by decide : 2 ≤ 4) _
  · exact Nat.le_refl _

theorem continuation_lt (context : ParserCarrierPrimitive.Context program tree)
    {term : Term} {view : CheckpointDecoder.LocalView program}
    (found : (context.localParser term).value = some view) : view.continuation.size < term.size :=
  CheckpointDecoder.parseLocal?_continuation_size_lt ((context.local_value term).symm.trans found)

def traverse (context : ParserCarrierPrimitive.Context program tree) (term : Term) :
    Result (Option (CheckpointDecoder.ChainTail program)) :=
  let localResult := context.localParser term
  match hlocal : localResult.value with
  | some view =>
      let inner := traverse context view.continuation
      let output := prependOption view inner
      ⟨output.value, localResult.operations + 3 + output.operations⟩
  | none =>
      let terminal := ParserTerminalPrimitive.parse context.expectedAct term
      let output := terminalOption terminal
      ⟨output.value, localResult.operations + 1 + output.operations⟩
termination_by term.size
decreasing_by exact continuation_lt context hlocal

theorem traverse_value (context : ParserCarrierPrimitive.Context program tree) (term : Term) :
    (traverse context term).value = CheckpointDecoder.parseChainTail? program tree term := by
  induction term using WellFounded.induction (measure Term.size).wf with
  | h term ih =>
      rw [traverse, CheckpointDecoder.parseChainTail?]
      rw [← context.local_value]
      cases found : (context.localParser term).value with
      | none =>
          dsimp only
          rw [terminalOption_value, context.expectedAct_eq, ParserTerminalPrimitive.parse_value]
      | some view =>
          dsimp only
          rw [prependOption_value, ih view.continuation (continuation_lt context found)]

def coefficient (context : ParserCarrierPrimitive.Context program tree) (localCoefficient : Nat) : Nat :=
  localCoefficient + 4 * context.expectedAct.size + 128

theorem terminal_overhead_le (context : ParserCarrierPrimitive.Context program tree) (term : Term) :
    (ParserTerminalPrimitive.parse context.expectedAct term).operations + 5 ≤
      (4 * context.expectedAct.size + 128) * (term.size + 1) := by
  have bound := Nat.add_le_add_right (ParserTerminalPrimitive.parse_operations_le context.expectedAct term) 5
  have first : (ParserTerminalPrimitive.parse context.expectedAct term).operations + 5 ≤
      56 * term.size + (4 * context.expectedAct.size + 95) := by
    simpa only [show 95 = 90 + 5 by rfl, Nat.add_assoc] using bound
  exact Nat.le_trans first (linear_bound
    (Nat.le_trans (by decide : 56 ≤ 128) (Nat.le_add_left _ _))
    (Nat.add_le_add_left (by decide : 95 ≤ 128) _) term.size)

theorem local_overhead_le (context : ParserCarrierPrimitive.Context program tree) (localCoefficient : Nat)
    (localBound : ∀ term, (context.localParser term).operations ≤ localCoefficient * (term.size + 1))
    (term : Term) :
    (context.localParser term).operations + 14 ≤ coefficient context localCoefficient * (term.size + 1) := by
  have constant : 14 ≤ 14 * (term.size + 1) := by
    simpa only [Nat.mul_one] using Nat.mul_le_mul_left 14 (Nat.le_add_left 1 term.size)
  have first := Nat.add_le_add (localBound term) constant
  have coefficients : localCoefficient + 14 ≤ coefficient context localCoefficient := by
    have extra : 14 ≤ 4 * context.expectedAct.size + 128 :=
      Nat.le_trans (by decide : 14 ≤ 128) (Nat.le_add_left _ _)
    simpa only [coefficient, Nat.add_assoc] using Nat.add_le_add_left extra localCoefficient
  exact Nat.le_trans (by simpa only [Nat.add_mul] using first)
    (Nat.mul_le_mul_right (term.size + 1) coefficients)

theorem traverse_operations_le (context : ParserCarrierPrimitive.Context program tree) (localCoefficient : Nat)
    (localBound : ∀ term, (context.localParser term).operations ≤ localCoefficient * (term.size + 1))
    (term : Term) :
    (traverse context term).operations ≤ coefficient context localCoefficient * (term.size + 1) ^ 2 := by
  induction term using WellFounded.induction (measure Term.size).wf with
  | h term ih =>
      rw [traverse]
      split
      · next view found =>
          have smaller := continuation_lt context found
          have inner := ih view.continuation smaller
          have prependBound := prependOption_operations_le view (traverse context view.continuation)
          have first := Nat.add_le_add_left prependBound ((context.localParser term).operations + 3)
          have combined := combine_descent smaller
            (local_overhead_le context localCoefficient localBound term) inner
          exact Nat.le_trans first (by simpa only [show 14 = 3 + 11 by rfl,
            Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using combined)
      · have wrapped := terminalOption_operations_le (program := program)
          (ParserTerminalPrimitive.parse context.expectedAct term)
        have first := Nat.add_le_add_left wrapped ((context.localParser term).operations + 1)
        have combined := Nat.add_le_add (localBound term) (terminal_overhead_le context term)
        have bound : (context.localParser term).operations + 1 +
            ((ParserTerminalPrimitive.parse context.expectedAct term).operations + 4) ≤
              coefficient context localCoefficient * (term.size + 1) := by
          simpa only [coefficient, Nat.add_mul, show 5 = 1 + 4 by rfl,
            Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using combined
        exact Nat.le_trans first (Nat.le_trans bound (linear_le_square _ term.size))

def parse (context : ParserCarrierPrimitive.Context program tree) (term : Term) :
    Result (Option (CheckpointDecoder.ChainView program)) :=
  let tail := traverse context term
  match tail.value with
  | none => ⟨none, tail.operations + 2⟩
  | some (.terminal _) => ⟨none, tail.operations + 4⟩
  | some (.completed view) => ⟨some view, tail.operations + 5⟩

theorem parse_value (context : ParserCarrierPrimitive.Context program tree) (term : Term) :
    (parse context term).value = CheckpointDecoder.parseChain? program tree term := by
  unfold parse CheckpointDecoder.parseChain?
  dsimp only
  rw [traverse_value]
  cases CheckpointDecoder.parseChainTail? program tree term with
  | none => rfl
  | some tail => cases tail <;> rfl

theorem parse_operations_le (context : ParserCarrierPrimitive.Context program tree) (localCoefficient : Nat)
    (localBound : ∀ term, (context.localParser term).operations ≤ localCoefficient * (term.size + 1))
    (term : Term) :
    (parse context term).operations ≤ coefficient context localCoefficient * (term.size + 1) ^ 2 + 5 := by
  have bound := Nat.add_le_add_right (traverse_operations_le context localCoefficient localBound term) 5
  unfold parse
  dsimp only
  split
  · exact Nat.le_trans (Nat.add_le_add_left (by decide : 2 ≤ 5) _) bound
  · exact Nat.le_trans (Nat.add_le_add_left (by decide : 4 ≤ 5) _) bound
  · exact bound

end PureSFormal.PureS.ParserChainPrimitive
