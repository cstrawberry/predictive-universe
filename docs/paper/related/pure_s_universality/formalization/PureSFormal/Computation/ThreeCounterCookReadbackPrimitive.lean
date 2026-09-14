import PureSFormal.Computation.ThreeCounterLiveReadbackPrimitive
import PureSFormal.Computation.CookSeedTerminalPrimitive

/-!
# Exact primitive counter-word readback

The input numeric word is decoded with the actual numeric symbol inverse,
including the separate halting label, then passed through measured live-state
reconstruction and complete canonical validation. All bounds include malformed
numeric words, and no counter or source transition is executed.
-/
namespace PureSFormal.Computation.ThreeCounterCookReadbackPrimitive

open PureSFormal.PureS
open PureSFormal.PureS.ParserPrimitiveMachine (Result)
open CounterMachineTag (Symbol)
open ThreeCounter (Program State)
open ThreeCounterTagTypedConstructionMachine (symbolPayload)
open CookSeedReadbackContext (Context)

def symbol (width haltLabel label : Nat) : Result Symbol :=
  let halting := ParserTerminalPrimitive.equalIndex haltLabel label
  if halting.value then ⟨.halt, halting.operations + 3⟩
  else
    let output := ThreeCounterTagNumericConstructionMachine.decodeSymbol width label
    ⟨output.value, halting.operations + output.operations + 3⟩

theorem ordinaryCount_eq (program : Program) : ThreeCounterTag.Numeric.ordinaryCount program = 30 * program.length + 2 := by
  unfold ThreeCounterTag.Numeric.ordinaryCount CounterMachineTag.Numeric.ordinaryCount
  rw [ThreeCounterTag.Numeric.enumerationProgram_length, ← Nat.mul_assoc]

theorem symbol_value (program : Program) (label : Nat) :
    (symbol (3 * program.length) (30 * program.length + 2) label).value = ThreeCounterCookReadback.decodeSymbol program label := by
  simp only [symbol, ThreeCounterCookReadback.decodeSymbol, ordinaryCount_eq]
  by_cases equal : label = 30 * program.length + 2
  · rw [if_pos equal, if_pos ((ParserTerminalPrimitive.equalIndex_value _ _).mpr equal.symm)]
  · rw [if_neg equal, if_neg (fun yes => equal ((ParserTerminalPrimitive.equalIndex_value _ _).mp yes).symm)]
    exact ThreeCounterTagNumericConstructionMachine.decodeSymbol_value _ _

def symbolBudget (width haltLabel : Nat) : Nat :=
  (4 * haltLabel + 2) + ThreeCounterTagNumericConstructionMachine.decodeBudget width + 3

theorem symbol_operations_le (width haltLabel label : Nat) :
    (symbol width haltLabel label).operations ≤ symbolBudget width haltLabel := by
  have bound := Nat.add_le_add_right (Nat.add_le_add
    (ParserTerminalPrimitive.equalIndex_operations_le haltLabel label)
    (ThreeCounterTagNumericConstructionMachine.decodeSymbol_operations_le width label)) 3
  simp only [symbol]
  split
  · exact Nat.le_trans (Nat.add_le_add_right (Nat.le_add_right _ _) 3) bound
  · exact bound

theorem symbol_payload_le (width haltLabel label : Nat) : symbolPayload (symbol width haltLabel label).value ≤ label := by
  simp only [symbol]
  split
  · exact Nat.zero_le _
  · exact ThreeCounterTagNumericConstructionMachine.decodeSymbol_payload_le _ _

def labelsMass : List Nat → Nat
  | [] => 0
  | label :: rest => label + labelsMass rest

def symbols (width haltLabel : Nat) : List Nat → Result (List Symbol)
  | [] => ⟨[], 2⟩
  | label :: rest =>
      let current := symbol width haltLabel label
      let following := symbols width haltLabel rest
      ⟨current.value :: following.value, current.operations + following.operations + 5⟩

theorem symbols_value (program : Program) (word : List Nat) :
    (symbols (3 * program.length) (30 * program.length + 2) word).value = word.map (ThreeCounterCookReadback.decodeSymbol program) := by
  induction word with
  | nil => rfl
  | cons label rest ih => simp only [symbols, symbol_value, ih, List.map_cons]

theorem symbols_length (width haltLabel : Nat) (word : List Nat) : (symbols width haltLabel word).value.length = word.length := by
  induction word with
  | nil => rfl
  | cons label rest ih => exact congrArg Nat.succ ih

theorem symbols_mass_le (width haltLabel : Nat) (word : List Nat) :
    ThreeCounterSymbolReadbackPrimitive.mass (symbols width haltLabel word).value ≤ labelsMass word := by
  induction word with
  | nil => exact Nat.le_refl _
  | cons label rest ih => exact Nat.add_le_add (symbol_payload_le _ _ _) ih

theorem symbols_operations_le (width haltLabel : Nat) (word : List Nat) :
    (symbols width haltLabel word).operations ≤ word.length * (symbolBudget width haltLabel + 5) + 2 := by
  induction word with
  | nil => simp only [symbols, List.length_nil, Nat.zero_mul, Nat.zero_add, Nat.le_refl]
  | cons label rest ih =>
      have bound := Nat.add_le_add_right (Nat.add_le_add (symbol_operations_le width haltLabel label) ih) 5
      simpa only [symbols, List.length_cons, Nat.add_mul, Nat.one_mul,
        Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using bound

def decode (program : Program) (word : List Nat) : Result (Option State) :=
  let prepared := ThreeCounterTagProgramConstructionMachine.prepare program
  let typed := symbols prepared.value.1 prepared.value.2 word
  let output := ThreeCounterLiveReadbackPrimitive.decode program typed.value
  ⟨output.value, prepared.operations + typed.operations + output.operations + 6⟩

theorem decode_value (program : Program) (word : List Nat) :
    (decode program word).value = ThreeCounterCookReadback.decodeCounterWord? program word := by
  simp only [decode, ThreeCounterLiveReadbackPrimitive.decode_value,
    ThreeCounterTagProgramConstructionMachine.prepare_value, symbols_value, ThreeCounterCookReadback.decodeCounterWord?]

theorem decode_fields (program : Program) (word : List Nat) (output : State)
    (found : (decode program word).value = some output) :
    output.control ≤ labelsMass word ∧ output.left ≤ word.length + 1 ∧
      output.right ≤ word.length + 1 ∧ output.scratch ≤ word.length + 1 ∧ output.status = .running := by
  have fields := ThreeCounterLiveReadbackPrimitive.decode_fields program
    (symbols (ThreeCounterTagProgramConstructionMachine.prepare program).value.1
      (ThreeCounterTagProgramConstructionMachine.prepare program).value.2 word).value output found
  rw [symbols_length] at fields
  exact ⟨Nat.le_trans fields.1 (symbols_mass_le _ _ _), fields.2⟩

def decodeBudget (programSize wordMass cells : Nat) : Nat :=
  (164 * programSize + 16) +
    (cells * (symbolBudget (3 * programSize) (30 * programSize + 2) + 5) + 2) +
    ThreeCounterLiveReadbackPrimitive.decodeBudget programSize wordMass cells + 6

theorem decode_operations_le (program : Program) (word : List Nat) :
    (decode program word).operations ≤ decodeBudget program.length (labelsMass word) word.length := by
  have liveBound := Nat.le_trans (ThreeCounterLiveReadbackPrimitive.decode_operations_le program
    (symbols (3 * program.length) (30 * program.length + 2) word).value)
    (ThreeCounterLiveReadbackPrimitive.decodeBudget_mono (Nat.le_refl _)
      (symbols_mass_le _ _ _) (Nat.le_of_eq (symbols_length _ _ _)))
  have bound := Nat.add_le_add_right (Nat.add_le_add
    (Nat.add_le_add_left (symbols_operations_le (3 * program.length) (30 * program.length + 2) word)
      (164 * program.length + 16)) liveBound) 6
  simpa only [decode, decodeBudget, ThreeCounterTagProgramConstructionMachine.prepare_value,
    ThreeCounterTagProgramConstructionMachine.prepare_operations] using bound

theorem symbolBudget_mono {width widthBound haltLabel haltBound : Nat}
    (widthLe : width ≤ widthBound) (haltLe : haltLabel ≤ haltBound) :
    symbolBudget width haltLabel ≤ symbolBudget widthBound haltBound := by
  unfold symbolBudget ThreeCounterTagNumericConstructionMachine.decodeBudget ThreeCounterTagNumericConstructionMachine.blockBudget
  exact Nat.add_le_add_right (Nat.add_le_add (Nat.add_le_add_right (Nat.mul_le_mul_left 4 haltLe) 2)
    (Nat.add_le_add_right (Nat.add_le_add
      (Nat.mul_le_mul_right 10 (Nat.add_le_add_right (Nat.add_le_add_right (Nat.mul_le_mul_left 180 widthLe) 20) 3))
      (Nat.add_le_add_right (Nat.mul_le_mul_left 87 widthLe) 5)) 1)) 3

theorem decodeBudget_mono {programSize programBound wordMass massBound cells cellsBound : Nat}
    (programLe : programSize ≤ programBound) (massLe : wordMass ≤ massBound) (cellsLe : cells ≤ cellsBound) :
    decodeBudget programSize wordMass cells ≤ decodeBudget programBound massBound cellsBound := by
  unfold decodeBudget
  exact Nat.add_le_add_right (Nat.add_le_add
    (Nat.add_le_add (Nat.add_le_add_right (Nat.mul_le_mul_left 164 programLe) 16)
      (Nat.add_le_add_right (Nat.mul_le_mul cellsLe (Nat.add_le_add_right
        (symbolBudget_mono (Nat.mul_le_mul_left 3 programLe) (Nat.add_le_add_right (Nat.mul_le_mul_left 30 programLe) 2)) 5)) 2))
    (ThreeCounterLiveReadbackPrimitive.decodeBudget_mono programLe massLe cellsLe)) 6

def fromContext (context : CookSeedReadbackContext.Context) (word : List Nat) : Result (Option State) :=
  let prepared := CookSeedTerminalPrimitive.prepare context
  let shape := CookWordConstructionMachine.replicateOnto (ThreeCounter.Instruction.decrementJump .right 0 0) prepared.value.2 []
  let output := decode shape.value word
  ⟨output.value, prepared.operations + shape.operations + output.operations + 4⟩

theorem fromContext_value (context : CookSeedReadbackContext.Context) (word : List Nat) :
    (fromContext context word).value = ThreeCounterCookReadback.decodeCounterWord? context.counterShape word := by
  simp only [fromContext, decode_value, CookSeedTerminalPrimitive.prepare_value,
    CookWordConstructionMachine.replicateOnto_value, List.append_nil, CookSeedReadbackContext.Context.counterShape]

theorem fromContext_fields (context : CookSeedReadbackContext.Context) (word : List Nat) (output : State)
    (found : (fromContext context word).value = some output) :
    output.control ≤ labelsMass word ∧ output.left ≤ word.length + 1 ∧
      output.right ≤ word.length + 1 ∧ output.scratch ≤ word.length + 1 ∧ output.status = .running :=
  decode_fields (CookWordConstructionMachine.replicateOnto
    (ThreeCounter.Instruction.decrementJump .right 0 0) (CookSeedTerminalPrimitive.prepare context).value.2 []).value
    word output found

theorem labelsMass_le (word : List Nat) (bound : Nat) (bounded : ∀ label ∈ word, label ≤ bound) :
    labelsMass word ≤ bound * word.length := by
  induction word with
  | nil => exact Nat.le_refl _
  | cons label rest ih =>
      have head := bounded label (List.Mem.head _)
      have tail := ih (fun item member => bounded item (List.Mem.tail label member))
      simpa only [labelsMass, List.length_cons, Nat.mul_succ, Nat.add_comm] using Nat.add_le_add head tail

def contextBudget (contextSize wordMass cells : Nat) : Nat :=
  (84 * contextSize + 34) + (4 * contextSize + 1) + decodeBudget contextSize wordMass cells + 4

theorem fromContext_operations_le (context : CookSeedReadbackContext.Context) (word : List Nat) :
    (fromContext context word).operations ≤ contextBudget (RogozhinFramePrimitiveSize.contextSize context.frames) (labelsMass word) word.length := by
  have shapeSize : (CookWordConstructionMachine.replicateOnto
      (ThreeCounter.Instruction.decrementJump .right 0 0) (CookSeedTerminalPrimitive.prepare context).value.2 []).value.length ≤
        RogozhinFramePrimitiveSize.contextSize context.frames := by
    rw [CookWordConstructionMachine.replicateOnto_value, List.append_nil, List.length_replicate]
    exact CookSeedTerminalPrimitive.primitive_le context
  have outputBound := Nat.le_trans (decode_operations_le _ word)
    (decodeBudget_mono shapeSize (Nat.le_refl _) (Nat.le_refl _))
  have shapeBound := Nat.add_le_add_right (Nat.mul_le_mul_left 4 (CookSeedTerminalPrimitive.primitive_le context)) 1
  rw [← CookWordConstructionMachine.replicateOnto_operations (ThreeCounter.Instruction.decrementJump .right 0 0)
    (CookSeedTerminalPrimitive.prepare context).value.2 []] at shapeBound
  exact Nat.add_le_add_right (Nat.add_le_add (Nat.add_le_add (CookSeedTerminalPrimitive.prepare_operations_le context) shapeBound) outputBound) 4

theorem contextBudget_mono {contextSize contextBound wordMass massBound cells cellsBound : Nat}
    (contextLe : contextSize ≤ contextBound) (massLe : wordMass ≤ massBound) (cellsLe : cells ≤ cellsBound) :
    contextBudget contextSize wordMass cells ≤ contextBudget contextBound massBound cellsBound := by
  unfold contextBudget
  exact Nat.add_le_add_right (Nat.add_le_add
    (Nat.add_le_add (Nat.add_le_add_right (Nat.mul_le_mul_left 84 contextLe) 34)
      (Nat.add_le_add_right (Nat.mul_le_mul_left 4 contextLe) 1))
    (decodeBudget_mono contextLe massLe cellsLe)) 4

inductive SymbolExecution (width haltLabel label : Nat) : Symbol → Nat → Prop where
  | halt (same : (ParserTerminalPrimitive.equalIndex haltLabel label).value = true) :
      SymbolExecution width haltLabel label .halt ((ParserTerminalPrimitive.equalIndex haltLabel label).operations + 3)
  | ordinary {output : Symbol} {operations : Nat}
      (different : (ParserTerminalPrimitive.equalIndex haltLabel label).value ≠ true)
      (decoded : ThreeCounterTagNumericConstructionMachine.DecodeLayersExecution width label
        ThreeCounterTagNumericConstructionMachine.families output operations) :
      SymbolExecution width haltLabel label output ((ParserTerminalPrimitive.equalIndex haltLabel label).operations + operations + 3)

theorem symbol_execution (width haltLabel label : Nat) :
    SymbolExecution width haltLabel label (symbol width haltLabel label).value (symbol width haltLabel label).operations := by
  simp only [symbol]
  split
  next same => exact .halt same
  next different => exact .ordinary different (ThreeCounterTagNumericConstructionMachine.decodeSymbol_execution _ _)

inductive SymbolsExecution (width haltLabel : Nat) : List Nat → List Symbol → Nat → Prop where
  | nil : SymbolsExecution width haltLabel [] [] 2
  | cons {label : Nat} {rest : List Nat} {current : Symbol} {following : List Symbol} {currentOperations restOperations : Nat}
      (head : SymbolExecution width haltLabel label current currentOperations)
      (tail : SymbolsExecution width haltLabel rest following restOperations) :
      SymbolsExecution width haltLabel (label :: rest) (current :: following) (currentOperations + restOperations + 5)

theorem symbols_execution (width haltLabel : Nat) (word : List Nat) :
    SymbolsExecution width haltLabel word (symbols width haltLabel word).value (symbols width haltLabel word).operations := by
  induction word with
  | nil => exact .nil
  | cons label rest ih => exact .cons (symbol_execution _ _ _) ih

inductive DecodeExecution (program : Program) (word : List Nat) : Option State → Nat → Prop where
  | construct {typed : List Symbol} {output : Option State} {typedOperations outputOperations : Nat}
      (numeric : SymbolsExecution (ThreeCounterTagProgramConstructionMachine.prepare program).value.1
        (ThreeCounterTagProgramConstructionMachine.prepare program).value.2 word typed typedOperations)
      (live : ThreeCounterLiveReadbackPrimitive.DecodeExecution program typed output outputOperations) :
      DecodeExecution program word output ((ThreeCounterTagProgramConstructionMachine.prepare program).operations + typedOperations + outputOperations + 6)

theorem decode_execution (program : Program) (word : List Nat) :
    DecodeExecution program word (decode program word).value (decode program word).operations :=
  .construct (symbols_execution _ _ _) (ThreeCounterLiveReadbackPrimitive.decode_execution _ _)

inductive ContextExecution (context : CookSeedReadbackContext.Context) (word : List Nat) : Option State → Nat → Prop where
  | construct {shape : Program} {output : Option State} {shapeOperations outputOperations : Nat}
      (allocation : CookWordConstructionMachine.ReplicateExecution (ThreeCounter.Instruction.decrementJump .right 0 0)
        (CookSeedTerminalPrimitive.prepare context).value.2 [] shape shapeOperations)
      (readback : DecodeExecution shape word output outputOperations) :
      ContextExecution context word output ((CookSeedTerminalPrimitive.prepare context).operations + shapeOperations + outputOperations + 4)

theorem fromContext_execution (context : CookSeedReadbackContext.Context) (word : List Nat) :
    ContextExecution context word (fromContext context word).value (fromContext context word).operations := by
  exact ContextExecution.construct
    (shape := (CookWordConstructionMachine.replicateOnto (ThreeCounter.Instruction.decrementJump .right 0 0)
      (CookSeedTerminalPrimitive.prepare context).value.2 []).value)
    (shapeOperations := (CookWordConstructionMachine.replicateOnto (ThreeCounter.Instruction.decrementJump .right 0 0)
      (CookSeedTerminalPrimitive.prepare context).value.2 []).operations)
    (CookWordConstructionMachine.replicateOnto_execution _ _ _) (decode_execution _ _)

end PureSFormal.Computation.ThreeCounterCookReadbackPrimitive

