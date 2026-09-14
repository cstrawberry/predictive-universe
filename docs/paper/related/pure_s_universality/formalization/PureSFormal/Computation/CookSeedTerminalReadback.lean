import PureSFormal.Computation.CookSeedReadbackContext

/-!
# Static terminal-rule lookup in the immutable seed

Printed production frames retain the zero-branch header needed to decide
whether an allocated source row has an undefined rule. The lookup reads the
seed context and candidate row; it does not execute the source program.
Correct recognition on source rows is separate from reflection of arbitrary
accepted execution snapshots to source rows.
-/

namespace PureSFormal.Computation.CookSeedTerminalReadback

open RogozhinTagInput RogozhinProgramReadback CookSeedReadbackContext
open PureSFormal.Research.ProtectedTrieDeterministicCompiler
open DeterministicTapeThreeCounterCompiler

def frameAt (context : Context) (label : Nat) : List Nat :=
  context.frames.reverse.getD label []

theorem frameAt_contextOf (program : Program) (label : Nat)
    (bounded : label < symbolCount program) :
    frameAt (contextOf program) label = productionExponents program label := by
  unfold frameAt
  rw [contextOf_reverse_frames]
  exact getD_map_range (productionExponents program) [] _ _ bounded

def payloadWeights (context : Context) (label : Nat) : List Nat :=
  (frameAt context label).reverse.drop 2

theorem payloadWeights_contextOf (program : Program) (label : Nat)
    (bounded : label < symbolCount program) :
    payloadWeights (contextOf program) label =
      ((productionAt program label).drop 2).map (weight program) := by
  rw [payloadWeights, frameAt_contextOf program label bounded, productionExponents,
    List.reverse_append]
  change (((productionAt program label).drop 2).reverse.map (weight program)).reverse = _
  rw [← List.map_reverse, List.reverse_reverse]

def payloadLabels (context : Context) (label : Nat) : List Label :=
  (payloadWeights context label).map (context.labelForWeight (context.symbolCount + 1))

theorem payloadLabels_contextOf (program : Program) (isT2 : IsT2 program)
    (label : Nat) (bounded : label < symbolCount program) :
    payloadLabels (contextOf program) label = (productionAt program label).drop 2 := by
  rw [payloadLabels, payloadWeights_contextOf program label bounded]
  apply contextOf_labels_map_weights program isT2
  intro value membership
  exact production_labelsValid isT2 bounded value (List.mem_of_mem_drop membership)

def ordinaryRhs (context : Context) (label : Nat) : List Label :=
  (payloadLabels context label).map (DeletionTwoT2Readback.decodeLabel context.ordinaryShape)

theorem decodeLabel_map_encodeLabel (program : Program) (word : List Label)
    (valid : LabelsValid program word) :
    (word.map (DeletionTwoT2Normalizer.encodeLabel program)).map
      (DeletionTwoT2Readback.decodeLabel program) = word := by
  induction word with
  | nil => rfl
  | cons first rest ih =>
      rw [List.map_cons, List.map_cons,
        DeletionTwoT2Readback.decodeLabel_encodeLabel program first (valid first (List.Mem.head _)),
        ih (WellFormed.labelsValid_tail valid)]

theorem decodeLabel_map_sameCount (first second : Program)
    (same : symbolCount first = symbolCount second) (word : List Label) :
    word.map (DeletionTwoT2Readback.decodeLabel first) =
      word.map (DeletionTwoT2Readback.decodeLabel second) := by
  induction word with
  | nil => rfl
  | cons head rest ih =>
      rw [List.map_cons, List.map_cons, decodeLabel_sameCount first second same head, ih]

/-- Nonempty ordinary productions are preserved literally by the seed
context inverse. Empty productions use the normalizer's padding convention. -/
theorem ordinaryRhs_contextOf (program : Program)
    (isT2 : IsT2 (DeletionTwoT2Normalizer.normalizeProgram program))
    (label : Nat) (bounded : label < symbolCount program)
    (nonempty : productionAt program label ≠ [])
    (valid : LabelsValid program (productionAt program label)) :
    ordinaryRhs (contextOf (DeletionTwoT2Normalizer.normalizeProgram program)) label =
      productionAt program label := by
  unfold ordinaryRhs
  rw [payloadLabels_contextOf _ isT2 _ (by
    rw [DeletionTwoT2Normalizer.normalize_symbolCount]
    exact Nat.lt_succ_of_lt bounded),
    DeletionTwoT2Normalizer.productionAt_normalize_old program bounded,
    DeletionTwoT2Normalizer.normalizedRhs, if_neg nonempty]
  change (DeletionTwoT2Normalizer.encodeWord program (productionAt program label)).map
    (DeletionTwoT2Readback.decodeLabel
      (contextOf (DeletionTwoT2Normalizer.normalizeProgram program)).ordinaryShape) = _
  rw [decodeLabel_map_sameCount _ _ (contextOf_ordinaryShape_count program)]
  exact decodeLabel_map_encodeLabel program _ valid

def zeroSelectorIndex (context : Context) (control : Nat) : Nat :=
  5 * (3 * context.primitiveLength) + control

def zeroNextHalts (context : Context) (control : Nat) : Bool :=
  decide ((ordinaryRhs context (zeroSelectorIndex context control))[1]? =
    some (context.symbolCount - 1))

theorem zeroSelectorIndex_contextOf (program : ThreeCounter.Program) (control : Nat) :
    zeroSelectorIndex (contextOf (DeletionTwoT2Normalizer.normalizeProgram
      (ThreeCounterTag.Numeric.ordinaryProgram program))) control =
      ThreeCounterTag.Numeric.encodeSymbol program (.selectZero control) := by
  unfold zeroSelectorIndex
  rw [contextOf_primitiveLength]
  change 5 * (3 * program.length) + control =
    5 * (ThreeCounterTag.Numeric.enumerationProgram program).length + control
  rw [ThreeCounterTag.Numeric.enumerationProgram_length]

theorem ordinaryRhs_selectZero (program : ThreeCounter.Program) (control : Nat)
    (bounded : control < program.length) :
    ordinaryRhs (contextOf (DeletionTwoT2Normalizer.normalizeProgram
      (ThreeCounterTag.Numeric.ordinaryProgram program)))
      (zeroSelectorIndex (contextOf (DeletionTwoT2Normalizer.normalizeProgram
        (ThreeCounterTag.Numeric.ordinaryProgram program))) control) =
      ThreeCounterTag.Numeric.numericRhs program (.selectZero control) := by
  have symbolBound : ThreeCounterTag.Numeric.Bounded program (.selectZero control) :=
    ThreeCounterTag.Numeric.control_bounded bounded
  have labelBound := ThreeCounterTag.Numeric.encodeSymbol_lt_count_of_ne_halt symbolBound
    (by intro equal; cases equal)
  have productionEq := ThreeCounterTag.Numeric.productionAt_encode symbolBound
    (by intro equal; cases equal)
  rw [zeroSelectorIndex_contextOf, ordinaryRhs_contextOf _
    (ThreeCounterTag.Numeric.compileT2_wellFormed program ⟨0, 0, 0, 0, .running⟩).isT2 _
    (by rw [ThreeCounterTag.Numeric.ordinaryProgram_symbolCount]; exact labelBound)]
  · exact productionEq
  · rw [productionEq]
    simp only [ThreeCounterTag.Numeric.numericRhs, ThreeCounterTag.production,
      List.map_cons, List.cons_ne_nil, not_false_eq_true]
    intro equal
    cases equal
  · exact ThreeCounterTag.Numeric.ordinaryProgram_productionLabelsValid program _ (by
      rw [ThreeCounterTag.Numeric.ordinaryProgram_symbolCount]
      exact labelBound)

theorem zeroNextHalts_contextOf (program : ThreeCounter.Program) (control : Nat)
    (bounded : control < program.length) :
    zeroNextHalts (contextOf (DeletionTwoT2Normalizer.normalizeProgram
      (ThreeCounterTag.Numeric.ordinaryProgram program))) control = true ↔
      ThreeCounter.instructionAt program
        (ThreeCounterTag.branchNext (ThreeCounter.instructionAt program control) false) = .halt := by
  rw [zeroNextHalts, ordinaryRhs_selectZero program control bounded,
    contextOf_symbolCount, DeletionTwoT2Normalizer.normalize_symbolCount,
    Nat.add_sub_cancel, ThreeCounterTag.Numeric.ordinaryProgram_symbolCount]
  unfold ThreeCounterTag.Numeric.numericRhs
  rw [ThreeCounterTag.production]
  cases nextEq : ThreeCounter.instructionAt program
      (ThreeCounterTag.branchNext (ThreeCounter.instructionAt program control) false) with
  | halt =>
      simp only [ThreeCounterTag.header, nextEq, List.map_cons, List.map_nil,
        List.getElem?_cons_zero, List.getElem?_cons_succ, decide_eq_true_eq, Option.some.injEq]
      exact ⟨fun _ => True.intro, fun _ => rfl⟩
  | increment register next =>
      have nextBound := ThreeCounterTag.Numeric.index_lt_of_instructionLive
        (program := program) (by rw [nextEq]; rfl)
      have encodedNe := Nat.ne_of_lt (ThreeCounterTag.Numeric.encodeSymbol_lt_count_of_ne_halt
        (ThreeCounterTag.Numeric.control_bounded nextBound) (by intro equal; cases equal))
      simp only [ThreeCounterTag.header, nextEq, List.map_cons, List.map_nil,
        List.getElem?_cons_zero, List.getElem?_cons_succ, decide_eq_true_eq, Option.some.injEq,
        encodedNe, ThreeCounter.Instruction.noConfusion, iff_self]
      exact ⟨False.elim, fun equal => nomatch equal⟩
  | decrementJump register positive zeroNext =>
      have nextBound := ThreeCounterTag.Numeric.index_lt_of_instructionLive
        (program := program) (by rw [nextEq]; rfl)
      have encodedNe := Nat.ne_of_lt (ThreeCounterTag.Numeric.encodeSymbol_lt_count_of_ne_halt
        (ThreeCounterTag.Numeric.control_bounded nextBound) (by intro equal; cases equal))
      simp only [ThreeCounterTag.header, nextEq, List.map_cons, List.map_nil,
        List.getElem?_cons_zero, List.getElem?_cons_succ, decide_eq_true_eq, Option.some.injEq,
        encodedNe, ThreeCounter.Instruction.noConfusion, iff_self]
      exact ⟨False.elim, fun equal => nomatch equal⟩

def ruleUndefined (context : Context) (state : Nat) (symbol : Bool) : Bool :=
  zeroNextHalts context (Layout.address state (.right (.restoreCheck symbol)))

/-- The selected static frame distinguishes an undefined source rule from
every defined move at the same literal source-state identifier. -/
theorem ruleUndefined_contextOf (machine : DeterministicTape.Machine)
    (state : Nat) (symbol : Bool) (bounded : state < machine.states.length) :
    ruleUndefined (contextOf (DeletionTwoT2Normalizer.normalizeProgram
      (ThreeCounterTag.Numeric.ordinaryProgram (Compiler.compileMachine machine)))) state symbol = true ↔
      DeterministicTape.ruleAt? machine state symbol = none := by
  rw [ruleUndefined, zeroNextHalts_contextOf _ _ (by
    rw [Compiler.compileMachine_length]
    exact Compiler.address_lt_haltAddress bounded _),
    Compiler.instructionAt_compileMachine bounded]
  change ThreeCounter.instructionAt (Compiler.compileMachine machine)
    (Layout.address state (.dispatch symbol true)) = .halt ↔ _
  rw [Compiler.instructionAt_compileMachine bounded]
  simp only [Compiler.instructionFor, Compiler.ruleFor]
  cases selected : DeterministicTape.ruleAt? machine state symbol with
  | none => exact ⟨fun _ => rfl, fun _ => rfl⟩
  | some rule =>
      cases moveEq : rule.move <;> simp only [moveEq, Compiler.zeroGoto] <;>
        exact ⟨(fun equal => nomatch equal), (fun equal => nomatch equal)⟩

def terminalRow (context : Context) (row : DeterministicTape.Row) : Bool :=
  match PureSFormal.Research.ProtectedTrieMachine.scanned? row with
  | none => true
  | some symbol => ruleUndefined context row.state symbol

theorem terminalRow_rowOf (machine : DeterministicTape.Machine)
    (state : Nat) (left tail : List Bool) (symbol : Bool)
    (bounded : state < machine.states.length) :
    terminalRow (contextOf (DeletionTwoT2Normalizer.normalizeProgram
      (ThreeCounterTag.Numeric.ordinaryProgram (Compiler.compileMachine machine))))
      (DeterministicTapeCounterCompiler.rowOf state left (symbol :: tail)) = true ↔
      DeterministicTape.step? machine
        (DeterministicTapeCounterCompiler.rowOf state left (symbol :: tail)) = none := by
  rw [terminalRow, DeterministicTapeCounterCompiler.scanned?_rowOf]
  change ruleUndefined _ state symbol = true ↔ _
  rw [ruleUndefined_contextOf machine state symbol bounded]
  cases selected : DeterministicTape.ruleAt? machine state symbol with
  | none =>
      rw [DeterministicTapeCounterCompiler.source_step?_rowOf_none machine state left tail symbol selected]
      exact ⟨fun _ => rfl, fun _ => rfl⟩
  | some rule =>
      rw [DeterministicTapeCounterCompiler.source_step?_rowOf machine state left tail symbol rule selected]
      exact ⟨(fun equal => nomatch equal), (fun equal => nomatch equal)⟩

theorem terminalRow_of_decodedBoundary (machine : DeterministicTape.Machine)
    (candidate : ThreeCounter.State) (row : DeterministicTape.Row)
    (decoded : DeterministicTapeTrajectoryDecoder.decodeTapeBoundary? candidate = some row)
    (bounded : row.state < machine.states.length) :
    terminalRow (contextOf (DeletionTwoT2Normalizer.normalizeProgram
      (ThreeCounterTag.Numeric.ordinaryProgram (Compiler.compileMachine machine)))) row = true ↔
      DeterministicTape.step? machine row = none := by
  obtain ⟨state, left, right, nonempty, _, rowEq⟩ :=
    DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?_sound decoded
  rw [rowEq] at bounded ⊢
  cases right with
  | nil => exact False.elim (nonempty rfl)
  | cons symbol tail => exact terminalRow_rowOf machine state left tail symbol bounded

/-- The seed supplies both readback context and terminal-rule recognition. -/
def decodeTerminalTape? (seed : List Bool)
    (snapshot : CTS.Config Cook.rogozhinCookProgram) : Option DeterministicTape.Row := do
  let context ← decodeContext? seed
  let row ← decodeTape? seed snapshot
  if terminalRow context row then some row else none

/-- A halting source has an actual CTS checkpoint at which the input-only
terminal observer returns its literal final row. This completeness theorem
does not assert that all accepted intermediate snapshots are final rows. -/
theorem exists_terminalRow_of_runFor? (source : DeterministicTape.Instance)
    (sourceFuel : Nat) (row : DeterministicTape.Row)
    (run : DeterministicTape.runFor? source.machine
      (DeterministicTape.initialRow source) sourceFuel = some row)
    (halted : DeterministicTape.step? source.machine row = none) :
    ∃ ticks,
      decodeTerminalTape?
        (DeterministicTapeCook.encodeBits (DeterministicTapeStatePadding.pad source))
        (CTS.iterate Cook.rogozhinCookProgram ticks
          (CTS.initial Cook.rogozhinCookProgram
            (DeterministicTapeCook.encodeBits (DeterministicTapeStatePadding.pad source)))) =
        some row := by
  obtain ⟨ticks, rowDecoded⟩ := CookSeedReadbackContext.exists_literalRow_at_actualCTS
    source sourceFuel row run
  obtain ⟨primitiveFuel, primitiveDecoded, _, _⟩ :=
    DeterministicTapeStatePadding.exists_live_decodedPrimitiveBoundary source sourceFuel row run
  have terminal := (terminalRow_of_decodedBoundary
    (DeterministicTapeStatePadding.pad source).machine _ row primitiveDecoded
    (DeterministicTapeStatePadding.runFor?_state_lt_padded_length source sourceFuel row run)).mpr
      (show DeterministicTape.step? (DeterministicTapeStatePadding.pad source).machine row = none by
        rw [DeterministicTapeStatePadding.step?_pad]
        exact halted)
  refine ⟨ticks, ?_⟩
  unfold decodeTerminalTape?
  change (decodeContext? (RogozhinT2Cook.encodeBits
    (ThreeCounterTag.Numeric.compileT2
      (Compiler.compileMachine (DeterministicTapeStatePadding.pad source).machine)
      (Execution.compileInitial (DeterministicTapeStatePadding.pad source))))).bind _ = _
  rw [decodeContext?_encodeBits]
  change (decodeTape?
    (DeterministicTapeCook.encodeBits (DeterministicTapeStatePadding.pad source))
    (CTS.iterate Cook.rogozhinCookProgram ticks
      (CTS.initial Cook.rogozhinCookProgram
        (DeterministicTapeCook.encodeBits (DeterministicTapeStatePadding.pad source))))).bind
    (fun result => if terminalRow (contextOf (DeletionTwoT2Normalizer.normalizeProgram
      (ThreeCounterTag.Numeric.ordinaryProgram
        (Compiler.compileMachine (DeterministicTapeStatePadding.pad source).machine)))) result
      then some result else none) = _
  rw [rowDecoded]
  exact if_pos terminal

theorem exists_terminalRow_at_actualCTS (source : DeterministicTape.Instance)
    (halts : DeterministicTape.Halts source) :
    ∃ ticks row,
      decodeTerminalTape?
        (DeterministicTapeCook.encodeBits (DeterministicTapeStatePadding.pad source))
        (CTS.iterate Cook.rogozhinCookProgram ticks
          (CTS.initial Cook.rogozhinCookProgram
            (DeterministicTapeCook.encodeBits (DeterministicTapeStatePadding.pad source)))) =
        some row ∧ DeterministicTape.step? source.machine row = none := by
  obtain ⟨sourceFuel, row, run, halted⟩ := halts
  obtain ⟨ticks, decoded⟩ := exists_terminalRow_of_runFor? source sourceFuel row run halted
  exact ⟨ticks, row, decoded, halted⟩


end PureSFormal.Computation.CookSeedTerminalReadback
