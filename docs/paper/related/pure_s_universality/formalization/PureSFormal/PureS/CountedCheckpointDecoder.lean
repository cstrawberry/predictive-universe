import PureSFormal.PureS.PublicDecoder
import PureSFormal.PureS.TermEvent

/-!
# Counted bare-term checkpoint decoding

This module gives the weak-path checkpoint decoder and marked-checkpoint
detector an explicit structural cost semantics.  A `scanTick` is a charged
full structural scan of the current candidate subtree against the fixed
program/dispatcher grammar.  Its allowance is quadratic in the root term and
linear in the fixed compiled grammar.  The recursive carrier and continuation
passes count every charged scan at every strict descendant.  Consequently the
complete decoder has a cubic all-input bound.

The counted functions return exactly the values of `CheckpointDecoder.decode?`,
`PublicDecoder.decode`, and `TermEvent.observesMarkedCheckpoint?`; they do not
assume that their input is reachable or well formed.
-/

namespace PureSFormal.PureS

namespace CountedCheckpointDecoder

/-- A value paired with the number of structural scan ticks used to obtain it. -/
structure Meter (α : Type) where
  value : α
  ticks : Nat
  deriving DecidableEq, Repr

/-- Size of the fixed grammar consulted by the checkpoint parser. -/
def staticWeight (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  (compileActions program tree).size + 32

/-- Allowance for one complete scan below an input-size cap. -/
def scanTick (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (cap : Nat) : Nat :=
  staticWeight program tree * (cap + 1) ^ 2

/-! ## Counted primitive parser calls -/

def parseGeneratorM? (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (cap : Nat)
    (term : Term) : Meter (Option (List Bool)) :=
  ⟨CheckpointDecoder.parseGenerator? (compileActions program tree) term,
    scanTick program tree cap⟩

@[simp] theorem parseGeneratorM?_value (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (cap : Nat)
    (term : Term) :
    (parseGeneratorM? program tree cap term).value =
      CheckpointDecoder.parseGenerator? (compileActions program tree) term :=
  rfl

def parseBaseM? (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (cap : Nat)
    (term : Term) : Meter (Option CheckpointDecoder.BaseView) :=
  ⟨CheckpointDecoder.parseBase? (compileActions program tree) term,
    scanTick program tree cap⟩

@[simp] theorem parseBaseM?_value (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (cap : Nat)
    (term : Term) :
    (parseBaseM? program tree cap term).value =
      CheckpointDecoder.parseBase? (compileActions program tree) term :=
  rfl

def parseLocalM? (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (cap : Nat)
    (term : Term) : Meter (Option (CheckpointDecoder.LocalView program)) :=
  ⟨CheckpointDecoder.parseLocal? program tree term,
    scanTick program tree cap⟩

@[simp] theorem parseLocalM?_value (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (cap : Nat)
    (term : Term) :
    (parseLocalM? program tree cap term).value =
      CheckpointDecoder.parseLocal? program tree term :=
  rfl

def parseTerminalM? (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (cap : Nat)
    (term : Term) : Meter (Option CheckpointDecoder.TerminalView) :=
  ⟨CheckpointDecoder.parseTerminal? (compileActions program tree) term,
    scanTick program tree cap⟩

@[simp] theorem parseTerminalM?_value (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (cap : Nat)
    (term : Term) :
    (parseTerminalM? program tree cap term).value =
      CheckpointDecoder.parseTerminal? (compileActions program tree) term :=
  rfl

def parseCellM? (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (cap : Nat)
    (term : Term) : Meter (Option CanonicalStep.CellResult) :=
  ⟨CanonicalStep.parseCell? term, scanTick program tree cap⟩

@[simp] theorem parseCellM?_value (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (cap : Nat)
    (term : Term) :
    (parseCellM? program tree cap term).value =
      CanonicalStep.parseCell? term :=
  rfl

def decodeSpineM? (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (cap : Nat)
    (term : Term) : Meter (Option (List Bool)) :=
  ⟨CellSpine.decode? term, scanTick program tree cap⟩

@[simp] theorem decodeSpineM?_value (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (cap : Nat)
    (term : Term) :
    (decodeSpineM? program tree cap term).value = CellSpine.decode? term :=
  rfl

/-! ## Counted recursive carrier traversal -/

private theorem liveCell_predecessor_size_lt
    {term predecessor : Term} {bit : Bool}
    (h : CanonicalStep.parseCell? term = some (.live bit predecessor)) :
    predecessor.size < term.size :=
  CheckpointDecoder.parsedCell_size_lt h rfl

private theorem tombstoneCell_predecessor_size_lt
    {term predecessor : Term} {bit : Bool}
    (h : CanonicalStep.parseCell? term = some (.tombstone bit predecessor)) :
    predecessor.size < term.size :=
  CheckpointDecoder.parsedCell_size_lt h rfl

set_option linter.unusedVariables false in
def decodeCarrierAuxM? (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (cap : Nat)
    (term : Term) : Meter (Option (List Bool)) :=
  match hbase : CheckpointDecoder.parseBase?
      (compileActions program tree) term with
  | some view =>
      ⟨CellSpine.decode? view.queue, 2 * scanTick program tree cap⟩
  | none =>
      match hlocal : CheckpointDecoder.parseLocal? program tree term with
      | some view =>
          let inner := decodeCarrierAuxM? program tree cap view.accumulator
          ⟨inner.value, 2 * scanTick program tree cap + inner.ticks⟩
      | none =>
          match hcell : CanonicalStep.parseCell? term with
          | some (.live bit predecessor) =>
              let inner := decodeCarrierAuxM? program tree cap predecessor
              ⟨inner.value.map (fun decoded => decoded ++ [bit]),
                3 * scanTick program tree cap + inner.ticks⟩
          | some (.tombstone _ predecessor) =>
              let inner := decodeCarrierAuxM? program tree cap predecessor
              ⟨inner.value, 3 * scanTick program tree cap + inner.ticks⟩
          | none =>
              ⟨none, 3 * scanTick program tree cap⟩
termination_by term.size
decreasing_by
  · exact CheckpointDecoder.parseLocal?_accumulator_size_lt hlocal
  · exact liveCell_predecessor_size_lt hcell
  · exact tombstoneCell_predecessor_size_lt hcell

theorem decodeCarrierAuxM?_value (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (cap : Nat)
    (term : Term) :
    (decodeCarrierAuxM? program tree cap term).value =
      CheckpointDecoder.decodeCarrier? program tree term := by
  rw [decodeCarrierAuxM?, CheckpointDecoder.decodeCarrier?]
  generalize hbase :
      CheckpointDecoder.parseBase? (compileActions program tree) term = base
  cases base with
  | some view => simp [hbase]
  | none =>
      simp only [hbase]
      generalize hlocal :
          CheckpointDecoder.parseLocal? program tree term = localResult
      cases localResult with
      | some view =>
          simp only [hlocal, Meter.value]
          exact decodeCarrierAuxM?_value program tree cap view.accumulator
      | none =>
          simp only [hlocal]
          generalize hcell : CanonicalStep.parseCell? term = cell
          cases cell with
          | none => simp [hcell]
          | some result =>
              cases result with
              | live bit predecessor =>
                  simp only [hcell, Meter.value]
                  rw [decodeCarrierAuxM?_value]
              | tombstone bit predecessor =>
                  simp only [hcell, Meter.value]
                  exact decodeCarrierAuxM?_value program tree cap predecessor
termination_by term.size
decreasing_by
  all_goals
    first
    | apply CheckpointDecoder.parseLocal?_accumulator_size_lt <;> assumption
    | apply liveCell_predecessor_size_lt <;> assumption
    | apply tombstoneCell_predecessor_size_lt <;> assumption

/-! ## Counted continuation traversal -/

set_option linter.unusedVariables false in
def parseChainTailAuxM? (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (cap : Nat)
    (term : Term) : Meter (Option (CheckpointDecoder.ChainTail program)) :=
  match hlocal : CheckpointDecoder.parseLocal? program tree term with
  | some view =>
      let inner := parseChainTailAuxM? program tree cap view.continuation
      ⟨inner.value.map (CheckpointDecoder.prependLocal view),
        scanTick program tree cap + inner.ticks⟩
  | none =>
      ⟨(CheckpointDecoder.parseTerminal? (compileActions program tree) term).map
          CheckpointDecoder.ChainTail.terminal,
        2 * scanTick program tree cap⟩
termination_by term.size
decreasing_by
  exact CheckpointDecoder.parseLocal?_continuation_size_lt hlocal

theorem parseChainTailAuxM?_value (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (cap : Nat)
    (term : Term) :
    (parseChainTailAuxM? program tree cap term).value =
      CheckpointDecoder.parseChainTail? program tree term := by
  rw [parseChainTailAuxM?, CheckpointDecoder.parseChainTail?]
  generalize hlocal :
      CheckpointDecoder.parseLocal? program tree term = localResult
  cases localResult with
  | none => simp [hlocal]
  | some view =>
      simp only [hlocal, Meter.value]
      rw [parseChainTailAuxM?_value]
termination_by term.size
decreasing_by
  exact CheckpointDecoder.parseLocal?_continuation_size_lt hlocal

def parseChainM? (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (cap : Nat)
    (term : Term) : Meter (Option (CheckpointDecoder.ChainView program)) :=
  ⟨match (parseChainTailAuxM? program tree cap term).value with
    | some (.completed view) => some view
    | _ => none,
   (parseChainTailAuxM? program tree cap term).ticks⟩

@[simp] theorem parseChainM?_value (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (cap : Nat)
    (term : Term) :
    (parseChainM? program tree cap term).value =
      CheckpointDecoder.parseChain? program tree term := by
  change (match (parseChainTailAuxM? program tree cap term).value with
      | some (.completed view) => some view
      | _ => none) =
    (match CheckpointDecoder.parseChainTail? program tree term with
      | some (.completed view) => some view
      | _ => none)
  rw [parseChainTailAuxM?_value]

/-! ## Counted positive and total decoding -/

def parsePositiveM? (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (cap : Nat)
    (term : Term) : Meter (Option (CheckpointDecoder.PositiveView program)) :=
  match CheckpointDecoder.parseChain? program tree term with
  | none =>
      ⟨none, (parseChainM? program tree cap term).ticks +
        scanTick program tree cap⟩
  | some chainView =>
      if chainView.last.label.1 =
          CheckpointDecoder.expectedPhase program chainView.terminal.horizon then
        match CheckpointDecoder.decodeCarrier? program tree
            chainView.last.accumulator with
        | none =>
            ⟨none, (parseChainM? program tree cap term).ticks +
              scanTick program tree cap +
              (decodeCarrierAuxM? program tree cap
                chainView.last.accumulator).ticks⟩
        | some bits =>
            if CheckpointDecoder.markerCompatible chainView.last.status bits then
              ⟨some ⟨chainView.terminal.horizon, chainView.last.route,
                  chainView.last.label, bits⟩,
                (parseChainM? program tree cap term).ticks +
                  2 * scanTick program tree cap +
                  (decodeCarrierAuxM? program tree cap
                    chainView.last.accumulator).ticks⟩
            else
              ⟨none, (parseChainM? program tree cap term).ticks +
                2 * scanTick program tree cap +
                (decodeCarrierAuxM? program tree cap
                  chainView.last.accumulator).ticks⟩
      else
        ⟨none, (parseChainM? program tree cap term).ticks +
          scanTick program tree cap⟩

@[simp] theorem parsePositiveM?_value (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (cap : Nat)
    (term : Term) :
    (parsePositiveM? program tree cap term).value =
      CheckpointDecoder.parsePositive? program tree term := by
  unfold parsePositiveM? CheckpointDecoder.parsePositive?
  cases hchain : CheckpointDecoder.parseChain? program tree term with
  | none => simp [hchain]
  | some chain =>
      simp only [hchain]
      split
      next hphase =>
        cases hqueue : CheckpointDecoder.decodeCarrier? program tree
            chain.last.accumulator with
        | none => simp [hqueue]
        | some queue =>
            simp only [hqueue]
            split <;> rfl
      next hphase => simp [hphase]

def decodeInternalM? (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (term : Term) :
    Meter (Option (CheckpointDecoder.Result program)) :=
  match CheckpointDecoder.parseGenerator?
      (compileActions program tree) term with
  | some bits =>
      ⟨some (.zero bits), 2 * scanTick program tree term.size⟩
  | none =>
      ⟨(CheckpointDecoder.parsePositive? program tree term).map
          CheckpointDecoder.Result.positive,
        2 * scanTick program tree term.size +
          (parsePositiveM? program tree term.size term).ticks⟩

@[simp] theorem decodeInternalM?_value (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (term : Term) :
    (decodeInternalM? program tree term).value =
      CheckpointDecoder.decode? program tree term := by
  unfold decodeInternalM? CheckpointDecoder.decode?
  cases hzero : CheckpointDecoder.parseGenerator?
      (compileActions program tree) term with
  | none =>
      simp only [hzero, Meter.value]
  | some bits => simp [hzero]

/-- The counted public decoder has exactly the production decoder's value. -/
def countedDecode (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (term : Term) :
    Meter (Option (WeakPath.DecodedCheckpoint program)) :=
  ⟨(decodeInternalM? program tree term).value.map
      (PublicDecoder.repack program),
    (decodeInternalM? program tree term).ticks⟩

@[simp] theorem countedDecode_value (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (term : Term) :
    (countedDecode program tree term).value =
      PublicDecoder.decode program tree term := by
  simp [countedDecode, PublicDecoder.decode]

/-! ## Resource bounds -/

private theorem add_scaled_succ
    (scale child whole : Nat) (h : child + 1 ≤ whole) :
    scale + scale * child ≤ scale * whole := by
  calc
    scale + scale * child = scale * (child + 1) := by
      rw [Nat.mul_succ, Nat.add_comm]
    _ ≤ scale * whole := Nat.mul_le_mul_left scale h

theorem decodeCarrierAuxM?_ticks_le (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (cap : Nat)
    (term : Term) :
    (decodeCarrierAuxM? program tree cap term).ticks ≤
      (3 * scanTick program tree cap) * term.size := by
  rw [decodeCarrierAuxM?]
  generalize hbase :
      CheckpointDecoder.parseBase? (compileActions program tree) term = base
  cases base with
  | some view =>
      simp only [hbase, Meter.ticks]
      have hpos : 1 ≤ term.size := Term.size_pos term
      calc
        2 * scanTick program tree cap ≤
            3 * scanTick program tree cap :=
          Nat.mul_le_mul_right _ (by decide : 2 ≤ 3)
        _ ≤ (3 * scanTick program tree cap) * term.size :=
          by simpa using
            (Nat.mul_le_mul_left (3 * scanTick program tree cap) hpos)
  | none =>
      simp only [hbase]
      generalize hlocal :
          CheckpointDecoder.parseLocal? program tree term = localResult
      cases localResult with
      | some view =>
          simp only [hlocal, Meter.ticks]
          have ih := decodeCarrierAuxM?_ticks_le program tree cap
            view.accumulator
          have hchild : view.accumulator.size + 1 ≤ term.size :=
            Nat.succ_le_of_lt
              (CheckpointDecoder.parseLocal?_accumulator_size_lt hlocal)
          calc
            2 * scanTick program tree cap +
                (decodeCarrierAuxM? program tree cap view.accumulator).ticks ≤
              3 * scanTick program tree cap +
                (3 * scanTick program tree cap) * view.accumulator.size := by
                  exact Nat.add_le_add
                    (Nat.mul_le_mul_right _ (by decide : 2 ≤ 3)) ih
            _ ≤ (3 * scanTick program tree cap) * term.size :=
              add_scaled_succ _ _ _ hchild
      | none =>
          simp only [hlocal]
          generalize hcell : CanonicalStep.parseCell? term = cell
          cases cell with
          | none =>
              simp only [hcell, Meter.ticks]
              have hpos : 1 ≤ term.size := Term.size_pos term
              simpa using
                (Nat.mul_le_mul_left (3 * scanTick program tree cap) hpos)
          | some result =>
              cases result with
              | live bit predecessor =>
                  simp only [hcell, Meter.ticks]
                  have ih := decodeCarrierAuxM?_ticks_le program tree cap
                    predecessor
                  have hchild : predecessor.size + 1 ≤ term.size :=
                    Nat.succ_le_of_lt
                      (CheckpointDecoder.parsedCell_size_lt hcell rfl)
                  exact Nat.le_trans (Nat.add_le_add_left ih _)
                    (add_scaled_succ _ _ _ hchild)
              | tombstone bit predecessor =>
                  simp only [hcell, Meter.ticks]
                  have ih := decodeCarrierAuxM?_ticks_le program tree cap
                    predecessor
                  have hchild : predecessor.size + 1 ≤ term.size :=
                    Nat.succ_le_of_lt
                      (CheckpointDecoder.parsedCell_size_lt hcell rfl)
                  exact Nat.le_trans (Nat.add_le_add_left ih _)
                    (add_scaled_succ _ _ _ hchild)
termination_by term.size
decreasing_by
  all_goals
    first
    | apply CheckpointDecoder.parseLocal?_accumulator_size_lt <;> assumption
    | apply liveCell_predecessor_size_lt <;> assumption
    | apply tombstoneCell_predecessor_size_lt <;> assumption

theorem parseChainTailAuxM?_ticks_le (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (cap : Nat)
    (term : Term) :
    (parseChainTailAuxM? program tree cap term).ticks ≤
      (2 * scanTick program tree cap) * term.size := by
  rw [parseChainTailAuxM?]
  generalize hlocal :
      CheckpointDecoder.parseLocal? program tree term = localResult
  cases localResult with
  | none =>
      simp only [hlocal, Meter.ticks]
      simpa using Nat.mul_le_mul_left (2 * scanTick program tree cap)
        (Term.size_pos term)
  | some view =>
      simp only [hlocal, Meter.ticks]
      have ih := parseChainTailAuxM?_ticks_le program tree cap view.continuation
      have hchild : view.continuation.size + 1 ≤ term.size :=
        Nat.succ_le_of_lt
          (CheckpointDecoder.parseLocal?_continuation_size_lt hlocal)
      calc
        scanTick program tree cap +
            (parseChainTailAuxM? program tree cap view.continuation).ticks ≤
          2 * scanTick program tree cap +
            (2 * scanTick program tree cap) * view.continuation.size := by
              apply Nat.add_le_add
              · simpa using Nat.mul_le_mul_right
                  (scanTick program tree cap) (by decide : 1 ≤ 2)
              · exact ih
        _ ≤ (2 * scanTick program tree cap) * term.size :=
          add_scaled_succ _ _ _ hchild
termination_by term.size
decreasing_by
  exact CheckpointDecoder.parseLocal?_continuation_size_lt hlocal

theorem parseChainM?_ticks_le (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (cap : Nat)
    (term : Term) :
    (parseChainM? program tree cap term).ticks ≤
      (2 * scanTick program tree cap) * term.size := by
  change (parseChainTailAuxM? program tree cap term).ticks ≤ _
  exact parseChainTailAuxM?_ticks_le program tree cap term

private theorem chainShape_last_accumulator_size_lt
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {tail : CheckpointDecoder.ChainTail program}
    (shape : CheckpointDecoder.ChainShape program tree term tail) :
    match tail with
    | .terminal _ => True
    | .completed chain => chain.last.accumulator.size < term.size := by
  induction shape with
  | terminal view notLocal boundary => trivial
  | @«local» current view tail boundary inner ih =>
      cases tail with
      | terminal terminal =>
          exact CheckpointDecoder.parseLocal?_accumulator_size_lt boundary
      | completed innerChain =>
          exact Nat.lt_trans ih
            (CheckpointDecoder.parseLocal?_continuation_size_lt boundary)

/-- A successful chain parse exposes its last accumulator below the root. -/
theorem parseChain?_last_accumulator_size_lt
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {chain : CheckpointDecoder.ChainView program}
    (h : CheckpointDecoder.parseChain? program tree term = some chain) :
    chain.last.accumulator.size < term.size :=
  chainShape_last_accumulator_size_lt
    (CheckpointDecoder.parseChain?_sound h)

theorem parsePositiveM?_ticks_le (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (cap : Nat)
    (term : Term) (_hcap : term.size ≤ cap) :
    (parsePositiveM? program tree cap term).ticks ≤
      (7 * scanTick program tree cap) * term.size := by
  let unit := scanTick program tree cap
  rw [parsePositiveM?]
  split
  next hchain =>
      simp only [Meter.ticks]
      have hchainTicks := parseChainM?_ticks_le program tree cap term
      have hpos : 1 ≤ term.size := Term.size_pos term
      have hunit : unit ≤ unit * term.size := by
        simpa using Nat.mul_le_mul_left unit hpos
      calc
        (parseChainM? program tree cap term).ticks + unit ≤
            (2 * unit) * term.size + unit :=
          Nat.add_le_add_right hchainTicks unit
        _ ≤ (2 * unit) * term.size + unit * term.size :=
          Nat.add_le_add_left hunit _
        _ = (2 * unit + unit) * term.size :=
          (Nat.add_mul _ _ _).symm
        _ ≤ (7 * unit) * term.size :=
          Nat.mul_le_mul_right term.size (by
            calc
              2 * unit + unit = (2 + 1) * unit :=
                by simpa only [Nat.one_mul] using
                  (Nat.add_mul 2 1 unit).symm
              _ ≤ 7 * unit :=
                Nat.mul_le_mul_right unit (by decide : 2 + 1 ≤ 7))
  next chain hchain =>
      split
      next hphase =>
        split
        next hqueue =>
            simp only [Meter.ticks]
            have hchainTicks := parseChainM?_ticks_le program tree cap term
            have hcarrierTicks := decodeCarrierAuxM?_ticks_le program tree cap
              chain.last.accumulator
            have hacc : chain.last.accumulator.size < term.size :=
              parseChain?_last_accumulator_size_lt hchain
            have haccSucc : chain.last.accumulator.size + 1 ≤ term.size :=
              Nat.succ_le_of_lt hacc
            have hlocalCarrier :
                unit +
                    (decodeCarrierAuxM? program tree cap
                      chain.last.accumulator).ticks ≤
                  (3 * unit) * term.size := by
              calc
                unit +
                    (decodeCarrierAuxM? program tree cap
                      chain.last.accumulator).ticks ≤
                    3 * unit +
                      (3 * unit) * chain.last.accumulator.size :=
                  Nat.add_le_add
                    (by simpa using
                      Nat.mul_le_mul_right unit (by decide : 1 ≤ 3))
                    hcarrierTicks
                _ ≤ (3 * unit) * term.size :=
                  add_scaled_succ _ _ _ haccSucc
            calc
              (parseChainM? program tree cap term).ticks + unit +
                  (decodeCarrierAuxM? program tree cap
                    chain.last.accumulator).ticks =
                  (parseChainM? program tree cap term).ticks +
                    (unit + (decodeCarrierAuxM? program tree cap
                      chain.last.accumulator).ticks) := by
                    rw [Nat.add_assoc]
              _ ≤ (2 * unit) * term.size + (3 * unit) * term.size :=
                Nat.add_le_add hchainTicks hlocalCarrier
              _ = (2 * unit + 3 * unit) * term.size :=
                (Nat.add_mul _ _ _).symm
              _ ≤ (7 * unit) * term.size :=
                Nat.mul_le_mul_right term.size (by
                  calc
                    2 * unit + 3 * unit = (2 + 3) * unit :=
                      (Nat.add_mul _ _ _).symm
                    _ ≤ 7 * unit := Nat.mul_le_mul_right unit
                      (by decide : 2 + 3 ≤ 7))
        next queue hqueue =>
            have hchainTicks := parseChainM?_ticks_le program tree cap term
            have hcarrierTicks := decodeCarrierAuxM?_ticks_le program tree cap
              chain.last.accumulator
            have hacc : chain.last.accumulator.size < term.size :=
              parseChain?_last_accumulator_size_lt hchain
            have haccSucc : chain.last.accumulator.size + 1 ≤ term.size :=
              Nat.succ_le_of_lt hacc
            have hlocalCarrier :
                2 * unit +
                    (decodeCarrierAuxM? program tree cap
                      chain.last.accumulator).ticks ≤
                  (3 * unit) * term.size := by
              calc
                2 * unit +
                    (decodeCarrierAuxM? program tree cap
                      chain.last.accumulator).ticks ≤
                    3 * unit +
                      (3 * unit) * chain.last.accumulator.size :=
                  Nat.add_le_add
                    (Nat.mul_le_mul_right unit (by decide : 2 ≤ 3))
                    hcarrierTicks
                _ ≤ (3 * unit) * term.size :=
                  add_scaled_succ _ _ _ haccSucc
            split <;>
              calc
                (parseChainM? program tree cap term).ticks + 2 * unit +
                    (decodeCarrierAuxM? program tree cap
                      chain.last.accumulator).ticks =
                    (parseChainM? program tree cap term).ticks +
                      (2 * unit + (decodeCarrierAuxM? program tree cap
                        chain.last.accumulator).ticks) := by
                      rw [Nat.add_assoc]
                _ ≤ (2 * unit) * term.size + (3 * unit) * term.size :=
                  Nat.add_le_add hchainTicks hlocalCarrier
                _ = (2 * unit + 3 * unit) * term.size :=
                  (Nat.add_mul _ _ _).symm
                _ ≤ (7 * unit) * term.size :=
                  Nat.mul_le_mul_right term.size (by
                    calc
                      2 * unit + 3 * unit = (2 + 3) * unit :=
                        (Nat.add_mul _ _ _).symm
                      _ ≤ 7 * unit := Nat.mul_le_mul_right unit
                        (by decide : 2 + 3 ≤ 7))
      next hphase =>
        simp only [Meter.ticks]
        have hchainTicks := parseChainM?_ticks_le program tree cap term
        have hpos : 1 ≤ term.size := Term.size_pos term
        have hunit : unit ≤ unit * term.size := by
          simpa using Nat.mul_le_mul_left unit hpos
        calc
          (parseChainM? program tree cap term).ticks + unit ≤
              (2 * unit) * term.size + unit :=
            Nat.add_le_add_right hchainTicks unit
          _ ≤ (2 * unit) * term.size + unit * term.size :=
            Nat.add_le_add_left hunit _
          _ = (2 * unit + unit) * term.size :=
            (Nat.add_mul _ _ _).symm
          _ ≤ (7 * unit) * term.size :=
            Nat.mul_le_mul_right term.size (by
              calc
                2 * unit + unit = (2 + 1) * unit :=
                  by simpa only [Nat.one_mul] using
                    (Nat.add_mul 2 1 unit).symm
                _ ≤ 7 * unit := Nat.mul_le_mul_right unit
                  (by decide : 2 + 1 ≤ 7))

theorem decodeInternalM?_ticks_le (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (term : Term) :
    (decodeInternalM? program tree term).ticks ≤
      (9 * scanTick program tree term.size) * term.size := by
  unfold decodeInternalM?
  let unit := scanTick program tree term.size
  generalize hzero : CheckpointDecoder.parseGenerator?
      (compileActions program tree) term = zeroResult
  cases zeroResult with
  | some bits =>
      simp only [hzero, Meter.ticks]
      have hpos : 1 ≤ term.size := Term.size_pos term
      calc
        2 * unit ≤ (2 * unit) * term.size := by
          simpa using Nat.mul_le_mul_left (2 * unit) hpos
        _ ≤ (9 * unit) * term.size :=
          Nat.mul_le_mul_right term.size
            (Nat.mul_le_mul_right unit (by decide : 2 ≤ 9))
  | none =>
      simp only [hzero, Meter.ticks]
      have hpositive := parsePositiveM?_ticks_le program tree term.size term
        (Nat.le_refl _)
      have hpos : 1 ≤ term.size := Term.size_pos term
      have htwo : 2 * unit ≤ (2 * unit) * term.size := by
        simpa using Nat.mul_le_mul_left (2 * unit) hpos
      calc
        2 * unit + (parsePositiveM? program tree term.size term).ticks ≤
            (2 * unit) * term.size + (7 * unit) * term.size :=
          Nat.add_le_add htwo hpositive
        _ = (2 * unit + 7 * unit) * term.size :=
          (Nat.add_mul _ _ _).symm
        _ = (9 * unit) * term.size := by
          rw [← Nat.add_mul]

/-- Explicit cubic coefficient for the public decoder. -/
def decoderCoefficient (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  9 * staticWeight program tree

/-- The counted decoder is cubic on every finite bare term. -/
theorem countedDecode_ticks_le (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (term : Term) :
    (countedDecode program tree term).ticks ≤
      decoderCoefficient program tree * (term.size + 1) ^ 3 := by
  unfold countedDecode
  have h := decodeInternalM?_ticks_le program tree term
  apply Nat.le_trans h
  unfold decoderCoefficient scanTick
  have hsize : term.size ≤ term.size + 1 := Nat.le_succ _
  have hscaled := Nat.mul_le_mul_left
    (9 * staticWeight program tree * (term.size + 1) ^ 2) hsize
  simpa [Nat.mul_assoc, Nat.pow_succ] using hscaled

/-- Public value agreement and all-input cubic resource certificate. -/
theorem publicDecoder_resource_certificate (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (term : Term) :
    (countedDecode program tree term).value =
        PublicDecoder.decode program tree term ∧
      (countedDecode program tree term).ticks ≤
        decoderCoefficient program tree * (term.size + 1) ^ 3 :=
  ⟨countedDecode_value program tree term,
    countedDecode_ticks_le program tree term⟩

end CountedCheckpointDecoder

namespace CountedTermEvent

open CountedCheckpointDecoder

/-- Counted marked-checkpoint detection reuses the counted internal parser. -/
def countedObservesMarkedCheckpoint? (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (term : Term) :
    Meter Bool :=
  ⟨match (decodeInternalM? program tree term).value with
    | some (.positive view) => view.queue.isEmpty
    | _ => false,
   (decodeInternalM? program tree term).ticks + 1⟩

@[simp] theorem countedObservesMarkedCheckpoint?_value
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (term : Term) :
    (countedObservesMarkedCheckpoint? program tree term).value =
      TermEvent.observesMarkedCheckpoint? program tree term := by
  unfold countedObservesMarkedCheckpoint? TermEvent.observesMarkedCheckpoint?
  simp only [Meter.value, decodeInternalM?_value]
  cases decoded : CheckpointDecoder.decode? program tree term with
  | none => rfl
  | some result =>
      cases result with
      | zero bits => rfl
      | positive view =>
          rcases view with ⟨horizon, route, label, queue⟩
          cases queue <;> rfl

theorem countedObservesMarkedCheckpoint?_ticks
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (term : Term) :
    (countedObservesMarkedCheckpoint? program tree term).ticks =
      (decodeInternalM? program tree term).ticks + 1 :=
  rfl

/-- Explicit cubic coefficient for marked-checkpoint detection. -/
def detectorCoefficient (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) : Nat :=
  10 * staticWeight program tree

theorem countedObservesMarkedCheckpoint?_ticks_le
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (term : Term) :
    (countedObservesMarkedCheckpoint? program tree term).ticks ≤
      detectorCoefficient program tree * (term.size + 1) ^ 3 := by
  rw [countedObservesMarkedCheckpoint?_ticks]
  unfold detectorCoefficient
  have h := CountedCheckpointDecoder.decodeInternalM?_ticks_le program tree term
  have hpos : 1 ≤ staticWeight program tree * (term.size + 1) ^ 3 := by
    have hstatic : 0 < staticWeight program tree := by
      unfold staticWeight
      exact Nat.add_pos_right _ (by decide : 0 < 32)
    have hcube : 0 < (term.size + 1) ^ 3 :=
      Nat.pow_pos (Nat.succ_pos term.size)
    exact Nat.mul_pos hstatic hcube
  calc
    (decodeInternalM? program tree term).ticks + 1 ≤
        (9 * scanTick program tree term.size) * term.size + 1 :=
      Nat.add_le_add_right h 1
    _ ≤ 10 * staticWeight program tree * (term.size + 1) ^ 3 := by
      unfold scanTick
      have hsize : term.size ≤ term.size + 1 := Nat.le_succ _
      have hscaled := Nat.mul_le_mul_left
        (9 * staticWeight program tree * (term.size + 1) ^ 2) hsize
      have hbase :
          9 * staticWeight program tree * (term.size + 1) ^ 3 + 1 ≤
            10 * staticWeight program tree * (term.size + 1) ^ 3 := by
        let base := staticWeight program tree * (term.size + 1) ^ 3
        have : 9 * base + 1 ≤ 10 * base := by
          calc
            9 * base + 1 ≤ 9 * base + base :=
              Nat.add_le_add_left hpos _
            _ = 9 * base + 1 * base := by rw [Nat.one_mul]
            _ = (9 + 1) * base := (Nat.add_mul _ _ _).symm
            _ = 10 * base := rfl
        simpa [base, Nat.mul_assoc] using this
      exact Nat.le_trans (by
        simpa [Nat.mul_assoc, Nat.pow_succ] using Nat.add_le_add_right hscaled 1)
        hbase

/-- Public detector value agreement and all-input cubic resource certificate. -/
theorem detector_resource_certificate (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (term : Term) :
    (countedObservesMarkedCheckpoint? program tree term).value =
        TermEvent.observesMarkedCheckpoint? program tree term ∧
      (countedObservesMarkedCheckpoint? program tree term).ticks ≤
        detectorCoefficient program tree * (term.size + 1) ^ 3 :=
  ⟨countedObservesMarkedCheckpoint?_value program tree term,
    countedObservesMarkedCheckpoint?_ticks_le program tree term⟩

end CountedTermEvent

end PureSFormal.PureS
