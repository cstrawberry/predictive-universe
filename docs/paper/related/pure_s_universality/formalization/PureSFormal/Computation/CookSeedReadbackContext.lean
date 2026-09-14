import PureSFormal.Computation.RogozhinProgramReadback
import PureSFormal.Computation.DeterministicTapeCookTrajectoryReadback

/-!
# Seed-derived context for literal tape readback

The immutable seed supplies the printed program frames. Their final exponents
recover the unary alphabet weights; the frame count supplies the numerical
alphabet width. Source-state boundaries use the compiler's fixed right-tested
counter codec, so their readback does not require the original instruction table.

The boundary theorem gives forward completeness. Global acceptance reflection
and recognition of final rows require additional phase invariants.
-/

namespace PureSFormal.Computation.CookSeedReadbackContext

open RogozhinTagInput RogozhinProgramReadback RogozhinT2Simulation
open PureSFormal.Research.ProtectedTrieDeterministicCompiler
open DeterministicTapeThreeCounterCompiler DeterministicTapeCounterCompiler

def frameWeight (frame : List Nat) : Nat :=
  match frame.reverse with
  | gap :: maximum :: _ => maximum - gap
  | _ => 0

theorem frameWeight_productionExponents (program : Program) (label : Label)
    (bounded : label ≤ distinguished program) :
    frameWeight (productionExponents program label) = weight program label := by
  unfold frameWeight productionExponents
  rw [List.reverse_append]
  change weight program (distinguished program) -
    (weight program (distinguished program) - weight program label) = weight program label
  exact Nat.sub_sub_self (weight_mono program bounded)

structure Context where
  frames : List (List Nat)
  deriving DecidableEq, Repr

def Context.symbolCount (context : Context) : Nat := context.frames.length

def Context.nonhaltingWeight (context : Context) (label : Nat) : Nat :=
  frameWeight (context.frames.reverse.getD label [])

def Context.weight (context : Context) (label : Nat) : Nat :=
  if label < context.symbolCount then context.nonhaltingWeight label
  else context.nonhaltingWeight (context.symbolCount - 1) + 4

def contextOf (program : Program) : Context := ⟨programFrames program⟩

theorem contextOf_symbolCount (program : Program) :
    (contextOf program).symbolCount = symbolCount program := by
  simp only [contextOf, Context.symbolCount, programFrames, List.length_map,
    List.length_reverse, List.length_range]

theorem contextOf_reverse_frames (program : Program) :
    (contextOf program).frames.reverse =
      (List.range (symbolCount program)).map (productionExponents program) := by
  simp only [contextOf, programFrames, List.map_reverse, List.reverse_reverse]

theorem getD_map_range {alpha : Type} (f : Nat → alpha) (default : alpha)
    (count label : Nat) (bounded : label < count) :
    ((List.range count).map f).getD label default = f label := by
  change (((List.range count).map f)[label]?).getD default = _
  rw [getElem?_map_structural, List.getElem?_range bounded]
  rfl

theorem contextOf_nonhaltingWeight (program : Program) (label : Nat)
    (bounded : label < symbolCount program) :
    (contextOf program).nonhaltingWeight label = weight program label := by
  unfold Context.nonhaltingWeight
  rw [contextOf_reverse_frames, getD_map_range _ _ _ _ bounded]
  exact frameWeight_productionExponents program label (Nat.le_pred_of_lt bounded)

theorem weight_halt_eq_distinguished_add_four (program : Program) (isT2 : IsT2 program) :
    weight program (haltLabel program) = weight program (distinguished program) + 4 := by
  have successor : distinguished program + 1 = haltLabel program :=
    Nat.sub_add_cancel isT2.1
  rw [← successor, weight]
  rw [isT2.2.1]
  rfl

theorem contextOf_weight (program : Program) (isT2 : IsT2 program) (label : Nat)
    (bounded : label ≤ haltLabel program) :
    (contextOf program).weight label = weight program label := by
  unfold Context.weight
  rw [contextOf_symbolCount]
  by_cases live : label < symbolCount program
  · rw [if_pos live, contextOf_nonhaltingWeight program label live]
  · rw [if_neg live]
    have labelEq : label = haltLabel program := Nat.le_antisymm bounded (Nat.le_of_not_gt live)
    rw [labelEq, weight_halt_eq_distinguished_add_four program isT2,
      contextOf_nonhaltingWeight program (symbolCount program - 1)
        (Nat.sub_lt isT2.1 (by decide))]
    rfl

/-- The sole runtime input is the literal immutable seed bitword. -/
def decodeContext? (seed : List Bool) : Option Context :=
  (parseSeedFrames? seed).map Context.mk

theorem decodeContext?_encodeBits (job : Job) :
    decodeContext? (RogozhinT2Cook.encodeBits job) = some (contextOf job.program) := by
  rw [decodeContext?, parseSeedFrames?_encodeBits]
  rfl

def Context.labelForWeight (context : Context) : Nat → Nat → Nat
  | 0, _ => 0
  | limit + 1, width =>
      if context.weight limit = width then limit else context.labelForWeight limit width

theorem contextOf_labelForWeight (program : Program) (isT2 : IsT2 program)
    (limit width : Nat) (bounded : limit ≤ haltLabel program + 1) :
    (contextOf program).labelForWeight limit width =
      RogozhinT2BoundaryReadback.labelForWeight program limit width := by
  induction limit with
  | zero => rfl
  | succ limit ih =>
      rw [Context.labelForWeight, RogozhinT2BoundaryReadback.labelForWeight,
        contextOf_weight program isT2 limit (Nat.le_of_succ_le_succ bounded),
        ih (Nat.le_trans (Nat.le_succ limit) bounded)]

theorem contextOf_labelForWeight_weight (program : Program) (isT2 : IsT2 program)
    (label : Nat) (bounded : label ≤ haltLabel program) :
    (contextOf program).labelForWeight ((contextOf program).symbolCount + 1)
      (weight program label) = label := by
  rw [contextOf_symbolCount]
  change (contextOf program).labelForWeight (haltLabel program + 1) (weight program label) = _
  rw [contextOf_labelForWeight program isT2 _ _ (Nat.le_refl _)]
  exact RogozhinT2BoundaryReadback.labelForWeight_weight program isT2 _ (Nat.le_refl _)
    label (Nat.lt_succ_of_le bounded)

def Context.dataTail (context : Context) : List Label → List Rogozhin46.Symbol
  | [] => []
  | label :: rest => .s5 :: (ones (context.weight label) ++ context.dataTail rest)

def Context.dataCode (context : Context) : List Label → List Rogozhin46.Symbol
  | [] => []
  | label :: rest => ones (context.weight label) ++ context.dataTail rest

theorem contextOf_dataTail (program : Program) (isT2 : IsT2 program)
    (word : List Label) (valid : LabelsValid program word) :
    (contextOf program).dataTail word = dataTail program word := by
  induction word with
  | nil => rfl
  | cons first rest ih =>
      rw [Context.dataTail, dataTail,
        contextOf_weight program isT2 first (valid first (List.Mem.head _)),
        ih (WellFormed.labelsValid_tail valid)]

theorem contextOf_dataCode (program : Program) (isT2 : IsT2 program)
    (word : List Label) (valid : LabelsValid program word) :
    (contextOf program).dataCode word = dataCode program word := by
  cases word with
  | nil => rfl
  | cons first rest =>
      rw [Context.dataCode, dataCode,
        contextOf_weight program isT2 first (valid first (List.Mem.head _)),
        contextOf_dataTail program isT2 rest (WellFormed.labelsValid_tail valid)]

theorem contextOf_labels_map_weights (program : Program) (isT2 : IsT2 program)
    (word : List Label) (valid : LabelsValid program word) :
    (word.map (weight program)).map
      ((contextOf program).labelForWeight ((contextOf program).symbolCount + 1)) = word := by
  induction word with
  | nil => rfl
  | cons first rest ih =>
      rw [List.map_cons, List.map_cons,
        contextOf_labelForWeight_weight program isT2 first (valid first (List.Mem.head _)),
        ih (WellFormed.labelsValid_tail valid)]

def Context.decodeData? (context : Context) (cells : List Rogozhin46.Symbol) :
    Option (List Label) :=
  if cells = [] then some [] else
    let candidate := (RogozhinT2BoundaryReadback.readWidthsAux 0 cells).map
      (context.labelForWeight (context.symbolCount + 1))
    if context.dataCode candidate = cells then some candidate else none

theorem contextOf_decodeData? (program : Program) (isT2 : IsT2 program)
    (word : List Label) (valid : LabelsValid program word) :
    (contextOf program).decodeData? (dataCode program word) = some word := by
  cases word with
  | nil => rfl
  | cons first rest =>
      rw [Context.decodeData?,
        if_neg (RogozhinT2BoundaryReadback.dataCode_cons_ne_nil program first rest),
        RogozhinT2BoundaryReadback.readWidthsAux_dataCode,
        contextOf_labels_map_weights program isT2 _ valid]
      dsimp only
      rw [contextOf_dataCode program isT2 _ valid]
      exact if_pos rfl

def Context.programCode (context : Context) : List Rogozhin46.Symbol :=
  .s3 :: .s1 :: framesCode context.frames

theorem contextOf_programCode (program : Program) :
    (contextOf program).programCode = programCode program :=
  (programCode_frames program).symm

def stripAudit : List Rogozhin46.Symbol → List Rogozhin46.Symbol
  | .s0 :: rest => stripAudit rest
  | rest => rest

theorem stripAudit_replicate (padding : Nat) (rest : List Rogozhin46.Symbol) :
    stripAudit (List.replicate padding .s0 ++ rest) = stripAudit rest := by
  induction padding with
  | zero => rfl
  | succ padding ih => exact ih

theorem stripAudit_programCode_reverse (program : Program) :
    stripAudit (programCode program).reverse = (programCode program).reverse := by
  unfold programCode separatorCode
  rw [List.reverse_append]
  rfl

/-- The seed also validates the unchanged left program region after removing
only its unary audit prefix. This guard is additional to the data-code check. -/
def Context.decodeBoundary? (context : Context) (configuration : Rogozhin46.Config) :
    Option (List Label) :=
  if configuration.state = .A ∧
      stripAudit configuration.left = context.programCode.reverse then
    if configuration.current = .s4 then
      if configuration.right = [] then some [] else none
    else context.decodeData? (configuration.current :: configuration.right)
  else none

theorem contextOf_decodeBoundary? (program : Program) (isT2 : IsT2 program)
    (padding : Nat) (word : List Label) (valid : LabelsValid program word) :
    (contextOf program).decodeBoundary? (compileWithPadding program padding word) = some word := by
  cases word with
  | nil =>
      change (contextOf program).decodeBoundary?
        ⟨.A, .s4, List.replicate padding .s0 ++ (programCode program).reverse, []⟩ = some []
      unfold Context.decodeBoundary?
      rw [contextOf_programCode, stripAudit_replicate, stripAudit_programCode_reverse]
      rw [if_pos (And.intro rfl rfl)]
      rfl
  | cons first rest =>
      rw [compileWithPadding_nonempty]
      unfold Context.decodeBoundary?
      rw [contextOf_programCode, stripAudit_replicate, stripAudit_programCode_reverse]
      rw [if_pos (And.intro rfl rfl)]
      change (contextOf program).decodeData?
        (.s0 :: (List.replicate (weight program first - 1) .s0 ++ dataTail program rest)) = _
      have cells :
          .s0 :: (List.replicate (weight program first - 1) .s0 ++ dataTail program rest) =
          dataCode program (first :: rest) := by
        obtain ⟨predecessor, positive⟩ := weight_is_succ program first
        simp only [dataCode, ones, positive, Nat.add_sub_cancel,
          List.replicate_succ, List.cons_append]
      rw [cells]
      exact contextOf_decodeData? program isT2 _ valid

def Context.ordinaryShape (context : Context) : Program :=
  ⟨List.replicate (context.symbolCount - 1) []⟩

def Context.primitiveLength (context : Context) : Nat :=
  ((context.symbolCount - 1 - 2) / 10) / 3

/-- This table is only a canonical readback codec; it is never executed. -/
def Context.counterShape (context : Context) : ThreeCounter.Program :=
  List.replicate context.primitiveLength (.decrementJump .right 0 0)

theorem contextOf_ordinaryShape_count (program : Program) :
    symbolCount (contextOf (DeletionTwoT2Normalizer.normalizeProgram program)).ordinaryShape =
      symbolCount program := by
  unfold Context.ordinaryShape symbolCount
  rw [List.length_replicate, contextOf_symbolCount,
    DeletionTwoT2Normalizer.normalize_symbolCount, Nat.add_sub_cancel]
  rfl

theorem contextOf_primitiveLength (program : ThreeCounter.Program) :
    (contextOf (DeletionTwoT2Normalizer.normalizeProgram
      (ThreeCounterTag.Numeric.ordinaryProgram program))).primitiveLength = program.length := by
  unfold Context.primitiveLength
  rw [contextOf_symbolCount, DeletionTwoT2Normalizer.normalize_symbolCount,
    ThreeCounterTag.Numeric.ordinaryProgram_symbolCount]
  unfold ThreeCounterTag.Numeric.ordinaryCount CounterMachineTag.Numeric.ordinaryCount
  rw [ThreeCounterTag.Numeric.enumerationProgram_length]
  change (((10 * (3 * program.length) + 2 + 1 - 1 - 2) / 10) / 3) = program.length
  rw [Nat.add_sub_cancel, Nat.add_sub_cancel,
    Nat.mul_div_cancel_left _ (by decide), Nat.mul_div_cancel_left _ (by decide)]

theorem contextOf_counterShape_length (program : ThreeCounter.Program) :
    (contextOf (DeletionTwoT2Normalizer.normalizeProgram
      (ThreeCounterTag.Numeric.ordinaryProgram program))).counterShape.length = program.length := by
  rw [Context.counterShape, List.length_replicate, contextOf_primitiveLength]

theorem decodeLabel_sameCount (first second : Program)
    (same : symbolCount first = symbolCount second) (label : Label) :
    DeletionTwoT2Readback.decodeLabel first label =
      DeletionTwoT2Readback.decodeLabel second label := by
  unfold DeletionTwoT2Readback.decodeLabel DeletionTwoT2Normalizer.targetHaltLabel haltLabel
  rw [same]

theorem decodeAligned?_sameCount_pair (first second : Program)
    (same : symbolCount first = symbolCount second) (word : List Label) :
    (DeletionTwoT2Readback.decodeAligned? first word =
      DeletionTwoT2Readback.decodeAligned? second word) ∧
    (DeletionTwoT2Readback.decodeAligned? first word.tail =
      DeletionTwoT2Readback.decodeAligned? second word.tail) := by
  induction word with
  | nil => exact ⟨rfl, rfl⟩
  | cons head rest ih =>
      refine ⟨?_, ih.1⟩
      rw [DeletionTwoT2Readback.decodeAligned?_cons,
        DeletionTwoT2Readback.decodeAligned?_cons]
      have delayEq : DeletionTwoT2Normalizer.delayLabel first =
          DeletionTwoT2Normalizer.delayLabel second := same
      have haltEq : DeletionTwoT2Normalizer.targetHaltLabel first =
          DeletionTwoT2Normalizer.targetHaltLabel second := congrArg (fun n => n + 1) same
      rw [delayEq, haltEq, decodeLabel_sameCount first second same head]
      by_cases delay : head = DeletionTwoT2Normalizer.delayLabel second
      · rw [if_pos delay, if_pos delay]
        cases rest with
        | nil => rfl
        | cons next tail =>
            dsimp only
            by_cases nextDelay : next = DeletionTwoT2Normalizer.delayLabel second
            · rw [if_pos nextDelay, if_pos nextDelay]
              exact ih.2
            · rw [if_neg nextDelay, if_neg nextDelay]
      · rw [if_neg delay, if_neg delay,
          ih.1]

theorem decodeAligned?_sameCount (first second : Program)
    (same : symbolCount first = symbolCount second) (word : List Label) :
    DeletionTwoT2Readback.decodeAligned? first word =
      DeletionTwoT2Readback.decodeAligned? second word :=
  (decodeAligned?_sameCount_pair first second same word).1

theorem decodeWord?_sameCount (first second : Program)
    (same : symbolCount first = symbolCount second) (word : List Label) :
    DeletionTwoT2Readback.decodeWord? first word =
      DeletionTwoT2Readback.decodeWord? second word := by
  rw [DeletionTwoT2Readback.decodeWord?.eq_def,
    DeletionTwoT2Readback.decodeWord?.eq_def,
    decodeAligned?_sameCount first second same word]
  cases decoded : DeletionTwoT2Readback.decodeAligned? second word with
  | some result => rfl
  | none =>
      cases word with
      | nil => rfl
      | cons head rest =>
          change (if head = DeletionTwoT2Normalizer.delayLabel first then
            (DeletionTwoT2Readback.decodeAligned? first rest).map List.tail else none) =
            (if head = DeletionTwoT2Normalizer.delayLabel second then
            (DeletionTwoT2Readback.decodeAligned? second rest).map List.tail else none)
          rw [show DeletionTwoT2Normalizer.delayLabel first =
              DeletionTwoT2Normalizer.delayLabel second from same,
            decodeAligned?_sameCount first second same rest]

theorem instructionAt_replicate (count control : Nat) (instruction : ThreeCounter.Instruction)
    (bounded : control < count) :
    ThreeCounter.instructionAt (List.replicate count instruction) control = instruction := by
  induction count generalizing control with
  | zero => exact False.elim (Nat.not_lt_zero _ bounded)
  | succ count ih =>
      cases control with
      | zero => rfl
      | succ control => exact ih control (Nat.lt_of_succ_lt_succ bounded)

theorem header_of_live (program : ThreeCounter.Program) (control : Nat)
    (live : ThreeCounterTag.instructionLive (ThreeCounter.instructionAt program control) = true) :
    ThreeCounterTag.header program control = [.head control, .filler control] := by
  cases instructionEq : ThreeCounter.instructionAt program control with
  | halt => simp only [instructionEq, ThreeCounterTag.instructionLive, Bool.false_eq_true] at live
  | increment register next => rw [ThreeCounterTag.header, instructionEq]
  | decrementJump register positive zeroNext => rw [ThreeCounterTag.header, instructionEq]

theorem encodeState_same_tested (first second : ThreeCounter.Program)
    (state : ThreeCounter.State) (running : state.status = .running)
    (firstLive : ThreeCounterTag.instructionLive
      (ThreeCounter.instructionAt first state.control) = true)
    (secondLive : ThreeCounterTag.instructionLive
      (ThreeCounter.instructionAt second state.control) = true)
    (tested : ThreeCounterTag.instructionTested? (ThreeCounter.instructionAt first state.control) =
      ThreeCounterTag.instructionTested? (ThreeCounter.instructionAt second state.control)) :
    ThreeCounterTag.encodeState first state = ThreeCounterTag.encodeState second state := by
  have blockEq (register : ThreeCounter.Register) (value : Nat) :
      ThreeCounterTag.dataBlock first state.control register value =
        ThreeCounterTag.dataBlock second state.control register value := by
    unfold ThreeCounterTag.dataBlock
    rw [if_pos firstLive, if_pos secondLive]
    unfold ThreeCounterTag.scale
    rw [tested]
  unfold ThreeCounterTag.encodeState
  rw [running]
  unfold ThreeCounterTag.canonical
  rw [header_of_live first state.control firstLive,
    header_of_live second state.control secondLive,
    blockEq .left state.left, blockEq .right state.right, blockEq .scratch state.scratch]

theorem encodeSymbol_sameLength (first second : ThreeCounter.Program)
    (same : first.length = second.length) (symbol : ThreeCounterTag.Symbol) :
    ThreeCounterTag.Numeric.encodeSymbol first symbol =
      ThreeCounterTag.Numeric.encodeSymbol second symbol := by
  have enumerations : ThreeCounterTag.Numeric.enumerationProgram first =
      ThreeCounterTag.Numeric.enumerationProgram second :=
    congrArg (fun length => List.replicate (3 * length) CounterMachine.Instruction.reject) same
  exact congrArg (fun program => CounterMachineTag.Numeric.encodeSymbol program symbol) enumerations

theorem encodeWord_sameLength (first second : ThreeCounter.Program)
    (same : first.length = second.length) (word : List ThreeCounterTag.Symbol) :
    ThreeCounterTag.Numeric.encodeWord first word = ThreeCounterTag.Numeric.encodeWord second word := by
  induction word with
  | nil => rfl
  | cons head rest ih =>
      change ThreeCounterTag.Numeric.encodeSymbol first head ::
        ThreeCounterTag.Numeric.encodeWord first rest =
        ThreeCounterTag.Numeric.encodeSymbol second head ::
        ThreeCounterTag.Numeric.encodeWord second rest
      rw [encodeSymbol_sameLength first second same head, ih]

theorem contextOf_decodeCounterWord? (program : ThreeCounter.Program)
    (state : ThreeCounter.State) (running : state.status = .running)
    (live : ThreeCounterTag.instructionLive (ThreeCounter.instructionAt program state.control) = true)
    (tested : ThreeCounterTag.instructionTested? (ThreeCounter.instructionAt program state.control) =
      some .right) :
    ThreeCounterCookReadback.decodeCounterWord?
      (contextOf (DeletionTwoT2Normalizer.normalizeProgram
        (ThreeCounterTag.Numeric.ordinaryProgram program))).counterShape
      (ThreeCounterTag.Numeric.encodeWord program (ThreeCounterTag.encodeState program state)) =
      some state := by
  let context := contextOf (DeletionTwoT2Normalizer.normalizeProgram
    (ThreeCounterTag.Numeric.ordinaryProgram program))
  have sameLength : context.counterShape.length = program.length := contextOf_counterShape_length program
  have bounded : state.control < context.primitiveLength := by
    rw [contextOf_primitiveLength]
    exact ThreeCounterTag.Numeric.index_lt_of_instructionLive live
  have instruction : ThreeCounter.instructionAt context.counterShape state.control =
      .decrementJump .right 0 0 := instructionAt_replicate _ _ _ bounded
  have dummyLive : ThreeCounterTag.instructionLive
      (ThreeCounter.instructionAt context.counterShape state.control) = true := by
    rw [instruction]
    rfl
  have sameTest : ThreeCounterTag.instructionTested? (ThreeCounter.instructionAt program state.control) =
      ThreeCounterTag.instructionTested? (ThreeCounter.instructionAt context.counterShape state.control) := by
    rw [tested, instruction]
    rfl
  rw [encodeWord_sameLength program context.counterShape sameLength.symm,
    encodeState_same_tested program context.counterShape state running live dummyLive sameTest]
  exact ThreeCounterCookReadback.decodeCounterWord?_encodeState context.counterShape state running dummyLive

/-- Read the normalized word with the seed's program-region check. -/
def Context.decodeTag? (context : Context)
    (snapshot : CTS.Config Cook.rogozhinCookProgram) : Option (List Label) :=
  (CookRegisteredReadback.decodeSnapshot? snapshot).bind context.decodeBoundary?

def Context.decodeCounter? (context : Context)
    (snapshot : CTS.Config Cook.rogozhinCookProgram) : Option ThreeCounter.State := do
  let normalized ← context.decodeTag? snapshot
  let ordinary ← DeletionTwoT2Readback.decodeWord? context.ordinaryShape normalized
  ThreeCounterCookReadback.decodeCounterWord? context.counterShape ordinary

/-- The immutable seed and current snapshot are the only runtime inputs. -/
def decodeTape? (seed : List Bool)
    (snapshot : CTS.Config Cook.rogozhinCookProgram) : Option DeterministicTape.Row := do
  let context ← decodeContext? seed
  let state ← context.decodeCounter? snapshot
  DeterministicTapeTrajectoryDecoder.decodeTapeBoundary? state

theorem exists_contextOf_decodeTag?_iterate {program : Program} {word : List Label}
    (wellFormed : WellFormed program word) (horizon : Nat)
    (before : NonhaltingBefore program word horizon) :
    ∃ ticks,
      (contextOf program).decodeTag?
        (CTS.iterate Cook.rogozhinCookProgram ticks
          (CTS.initial Cook.rogozhinCookProgram
            (RogozhinT2Cook.encodeBits ⟨program, word⟩))) =
        some (RogozhinTagInput.iterate program horizon word) := by
  have safe := safeThrough_compileWithPadding_nonhaltingRun wellFormed horizon before
  obtain ⟨ticks, decoded⟩ := CookRegisteredReadback.exists_decodeSnapshot?_iterate
    (compile ⟨program, word⟩) (boundaryTime program word horizon)
    (fun earlier earlierLt => safe earlier (Nat.le_of_lt earlierLt))
  refine ⟨ticks, ?_⟩
  change ((CookRegisteredReadback.decodeSnapshot?
    (CTS.iterate Cook.rogozhinCookProgram ticks
      (CTS.initial Cook.rogozhinCookProgram
        (Cook.encodeWord (Cook.PassClassification.canonicalWord (compile ⟨program, word⟩)))))).bind
    (contextOf program).decodeBoundary?) = _
  rw [decoded, iterate_compileWithPadding_nonhaltingRun wellFormed horizon before]
  exact contextOf_decodeBoundary? program wellFormed.isT2 _ _
    (wellFormed.iterate horizon).labels

/-- Completeness on every running, live right-tested primitive endpoint.
The hypothesis identifies the codec used at source tape boundaries. -/
theorem exists_contextOf_decodeCounter?_iterate (program : ThreeCounter.Program)
    (initial : ThreeCounter.State) (primitiveFuel : Nat)
    (running : (ThreeCounter.run program primitiveFuel initial).status = .running)
    (live : ThreeCounterTag.instructionLive (ThreeCounter.instructionAt program
      (ThreeCounter.run program primitiveFuel initial).control) = true)
    (tested : ThreeCounterTag.instructionTested? (ThreeCounter.instructionAt program
      (ThreeCounter.run program primitiveFuel initial).control) = some .right) :
    ∃ ticks,
      (contextOf (ThreeCounterTag.Numeric.compileT2 program initial).program).decodeCounter?
        (CTS.iterate Cook.rogozhinCookProgram ticks
          (CTS.initial Cook.rogozhinCookProgram
            (RogozhinT2Cook.encodeBits (ThreeCounterTag.Numeric.compileT2 program initial)))) =
        some (ThreeCounter.run program primitiveFuel initial) := by
  open DeterministicTapeCookTrajectoryReadback ThreeCounterTag ThreeCounterTag.Numeric in
  obtain ⟨ordinaryFuel, ordinaryRun⟩ := ordinary_encodeState_run program initial primitiveFuel
  have ordinaryLive : ¬ Halted (ThreeCounterTag.Numeric.ordinaryProgram program)
      (RogozhinTagInput.iterate (ThreeCounterTag.Numeric.ordinaryProgram program) ordinaryFuel
        (ThreeCounterTag.Numeric.encodeWord program (ThreeCounterTag.encodeState program initial))) := by
    rw [ordinaryRun]
    exact DeterministicTapeCookTrajectoryReadback.ordinary_encodeState_notHalted
      program _ running live
  obtain ⟨targetHorizon, before, aligned⟩ :=
    DeterministicTapeCookTrajectoryReadback.exists_normalized_decoded_boundary
      (ThreeCounterTag.Numeric.ordinaryProgram program)
      (ThreeCounterTag.Numeric.encodeWord program (ThreeCounterTag.encodeState program initial))
      (ThreeCounterTag.Numeric.ordinaryProgram_productionLabelsValid program)
      (fun horizon => ThreeCounterTag.Numeric.ordinaryTrajectory_boundary program horizon initial)
      (ThreeCounterTag.Numeric.compileT2_wellFormed program initial) ordinaryFuel ordinaryLive
  obtain ⟨ticks, decoded⟩ := exists_contextOf_decodeTag?_iterate
    (ThreeCounterTag.Numeric.compileT2_wellFormed program initial) targetHorizon before
  refine ⟨ticks, ?_⟩
  unfold Context.decodeCounter?
  change ((contextOf (ThreeCounterTag.Numeric.compileT2 program initial).program).decodeTag?
    (CTS.iterate Cook.rogozhinCookProgram ticks
      (CTS.initial Cook.rogozhinCookProgram
        (RogozhinT2Cook.encodeBits (ThreeCounterTag.Numeric.compileT2 program initial))))).bind _ = _
  rw [decoded]
  change (DeletionTwoT2Readback.decodeWord?
    (contextOf (DeletionTwoT2Normalizer.normalizeProgram
      (ThreeCounterTag.Numeric.ordinaryProgram program))).ordinaryShape
    (RogozhinTagInput.iterate (DeletionTwoT2Normalizer.normalizeProgram
      (ThreeCounterTag.Numeric.ordinaryProgram program)) targetHorizon
      (ThreeCounterTag.Numeric.compileT2 program initial).word)).bind
      (ThreeCounterCookReadback.decodeCounterWord?
        (contextOf (ThreeCounterTag.Numeric.compileT2 program initial).program).counterShape) = _
  rw [decodeWord?_sameCount _ _
    (contextOf_ordinaryShape_count (ThreeCounterTag.Numeric.ordinaryProgram program))]
  exact (congrArg (fun value => value.bind
    (ThreeCounterCookReadback.decodeCounterWord?
      (contextOf (ThreeCounterTag.Numeric.compileT2 program initial).program).counterShape))
    (aligned.trans (congrArg some ordinaryRun))).trans
      (contextOf_decodeCounterWord? program _ running live tested)

/-- Every defined source prefix has an actual CTS checkpoint decoded from
the immutable input seed and that snapshot alone. This is forward completeness;
it does not classify every accepted intermediate snapshot as a source boundary. -/
theorem exists_literalRow_at_actualCTS (source : DeterministicTape.Instance)
    (sourceFuel : Nat) (row : DeterministicTape.Row)
    (run : DeterministicTape.runFor? source.machine
      (DeterministicTape.initialRow source) sourceFuel = some row) :
    ∃ ticks,
      decodeTape? (DeterministicTapeCook.encodeBits (DeterministicTapeStatePadding.pad source))
        (CTS.iterate Cook.rogozhinCookProgram ticks
          (CTS.initial Cook.rogozhinCookProgram
            (DeterministicTapeCook.encodeBits (DeterministicTapeStatePadding.pad source)))) =
        some row := by
  obtain ⟨primitiveFuel, decoded, running, live⟩ :=
    DeterministicTapeStatePadding.exists_live_decodedPrimitiveBoundary source sourceFuel row run
  have tested : ThreeCounterTag.instructionTested?
      (ThreeCounter.instructionAt (Compiler.compileMachine (DeterministicTapeStatePadding.pad source).machine)
        (ThreeCounter.run (Compiler.compileMachine (DeterministicTapeStatePadding.pad source).machine)
          primitiveFuel (Execution.compileInitial (DeterministicTapeStatePadding.pad source))).control) =
      some .right := by
    obtain ⟨state, left, right, _, candidateEq, rowEq⟩ :=
      DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?_sound decoded
    have stateEq : row.state = state := congrArg (fun result : DeterministicTape.Row => result.state) rowEq
    have bounded : state < (DeterministicTapeStatePadding.pad source).machine.states.length := by
      rw [← stateEq]
      exact DeterministicTapeStatePadding.runFor?_state_lt_padded_length source sourceFuel row run
    rw [candidateEq]
    change ThreeCounterTag.instructionTested?
      (ThreeCounter.instructionAt (Compiler.compileMachine (DeterministicTapeStatePadding.pad source).machine)
        (Layout.address state (.right .start))) = some .right
    rw [Compiler.instructionAt_compileMachine bounded]
    rfl
  obtain ⟨ticks, counterDecoded⟩ := exists_contextOf_decodeCounter?_iterate
    (Compiler.compileMachine (DeterministicTapeStatePadding.pad source).machine)
    (Execution.compileInitial (DeterministicTapeStatePadding.pad source))
    primitiveFuel running live tested
  refine ⟨ticks, ?_⟩
  unfold decodeTape?
  change (decodeContext? (RogozhinT2Cook.encodeBits
    (ThreeCounterTag.Numeric.compileT2
      (Compiler.compileMachine (DeterministicTapeStatePadding.pad source).machine)
      (Execution.compileInitial (DeterministicTapeStatePadding.pad source))))).bind _ = _
  rw [decodeContext?_encodeBits]
  change ((contextOf
    (ThreeCounterTag.Numeric.compileT2
      (Compiler.compileMachine (DeterministicTapeStatePadding.pad source).machine)
      (Execution.compileInitial (DeterministicTapeStatePadding.pad source))).program).decodeCounter?
    (CTS.iterate Cook.rogozhinCookProgram ticks
      (CTS.initial Cook.rogozhinCookProgram
        (DeterministicTapeCook.encodeBits (DeterministicTapeStatePadding.pad source))))).bind
    DeterministicTapeTrajectoryDecoder.decodeTapeBoundary? = _
  exact (congrArg (fun value => value.bind
    DeterministicTapeTrajectoryDecoder.decodeTapeBoundary?) counterDecoded).trans decoded


end PureSFormal.Computation.CookSeedReadbackContext

