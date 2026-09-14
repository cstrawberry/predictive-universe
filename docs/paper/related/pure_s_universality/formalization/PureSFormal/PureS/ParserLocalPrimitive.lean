import PureSFormal.PureS.ParserLocalShellPrimitive
import PureSFormal.PureS.DispatchParserPrimitive
import PureSFormal.PureS.ParserCarrierPrimitive

/-!
# Complete primitive local parsing

The fixed program and dispatcher tree prepare the route grammar, unary history
counts, and action wrapper. Parsing then uses those stored references through
the dispatch and shell evaluators. Grammar preparation is separate from the
per-input operation bound. The resulting context supplies the exact local
parser required by the recursive carrier and continuation-chain parsers.
-/

namespace PureSFormal.PureS.ParserLocalPrimitive

open ParserPrimitiveMachine

def parse (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Result (Option (CheckpointDecoder.LocalView program)) :=
  ParserLocalShellPrimitive.localWith program (DispatchParserPrimitive.parse program tree) term

theorem parse_value (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : (parse program tree term).value = CheckpointDecoder.parseLocal? program tree term :=
  ParserLocalShellPrimitive.localWith_value program tree _
    (DispatchParserPrimitive.parse_value program tree) term

def coefficient (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  DispatchParserPrimitive.coefficient
    (ParserRoutePrimitive.prepare (selectedAction program) tree)
    (DispatchParserPrimitive.prepareCounts (ActionParser.historyCount program) tree) + 102

theorem parse_operations_le (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : (parse program tree term).operations ≤ coefficient program tree * (term.size + 1) := by
  let dispatchCoefficient := DispatchParserPrimitive.coefficient
    (ParserRoutePrimitive.prepare (selectedAction program) tree)
    (DispatchParserPrimitive.prepareCounts (ActionParser.historyCount program) tree)
  have dispatchBound (field : Term) (sizeBound : field.size ≤ term.size) :
      (DispatchParserPrimitive.parse program tree field).operations ≤ dispatchCoefficient * (term.size + 1) :=
    Nat.le_trans (DispatchParserPrimitive.parse_operations_le program tree field)
      (Nat.mul_le_mul_left dispatchCoefficient (Nat.add_le_add_right sizeBound 1))
  have first := ParserLocalShellPrimitive.localWith_operations_le program
    (DispatchParserPrimitive.parse program tree) term (dispatchCoefficient * (term.size + 1)) dispatchBound
  have shell : 8 * term.size + 102 ≤ 102 * (term.size + 1) :=
    ParserCarrierPrimitive.linear_bound (by decide : 8 ≤ 102) (Nat.le_refl 102) term.size
  have second := Nat.add_le_add_left shell (dispatchCoefficient * (term.size + 1))
  exact Nat.le_trans first (by simpa only [coefficient, dispatchCoefficient, Nat.add_mul,
    Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using second)

def context (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :
    ParserCarrierPrimitive.Context program tree :=
  let grammar := ParserRoutePrimitive.prepare (selectedAction program) tree
  let counts := DispatchParserPrimitive.prepareCounts (ActionParser.historyCount program) tree
  let wrapper := actCode (compileActions program tree)
  { expectedAct := wrapper
    expectedAct_eq := rfl
    localParser := ParserLocalShellPrimitive.localWith program
      (DispatchParserPrimitive.parsePrepared program grammar counts)
    local_value := parse_value program tree }

theorem context_operations_le (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : ((context program tree).localParser term).operations ≤
      coefficient program tree * (term.size + 1) :=
  parse_operations_le program tree term

end PureSFormal.PureS.ParserLocalPrimitive
