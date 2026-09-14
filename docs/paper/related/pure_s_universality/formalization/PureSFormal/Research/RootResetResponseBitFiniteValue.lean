import PureSFormal.Research.RootResetDeletedBitAgreement
import PureSFormal.Research.RootResetEmptyResponseSelectorChain

/-!
# The finite front-bit value on generated response carriers

The finite entry guard returns false on a marked root and otherwise reads
the first deleted bit, defaulting to false when there is none. This agrees
with the chronology-sensitive public response-bit parser on normal carriers
with one excess tombstone, every marked response, and the initial empty Base.
Only the proofs use the natural-number chronology facts; no counter belongs
to the finite value or its implementing scanner.
-/
namespace PureSFormal.Research.RootResetResponseBitFiniteValue
open PureSFormal.PureS
open RootResetPersistentResponseSelector

def value (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (source : Term) : Bool :=
  if RootResetCompletedLocalPatterns.accepts .marked program tree source then false
  else (deletedFrontBit? program tree source).getD false

theorem marked {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program tree source = some view) (status : view.status = .marked) :
    value program tree source = false := by
  have accepted := (RootResetCompletedLocalPatterns.accepts_iff_parse .marked program tree source).mpr
    ⟨view, status, parsed⟩
  rw [value, accepted]
  rfl

theorem marked_none {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} (parsed : CheckpointDecoder.parseLocal? program tree source = none) :
    RootResetCompletedLocalPatterns.accepts .marked program tree source = false := by
  cases accepted : RootResetCompletedLocalPatterns.accepts .marked program tree source with
  | false => rfl
  | true =>
      obtain ⟨view, _, found⟩ := (RootResetCompletedLocalPatterns.accepts_iff_parse .marked program tree source).mp accepted
      rw [parsed] at found
      contradiction

theorem different_counts (count : Nat) (decoded : Option (List Bool)) (deleted : Option Bool) :
    (match some count, some (count + 1), decoded with
    | some localCount, some tombstoneCount, some [] =>
        if localCount = tombstoneCount then some false else deleted
    | _, _, _ => deleted) = deleted := by
  cases decoded with
  | none => rfl
  | some bits => cases bits with
    | nil => exact if_neg (Nat.ne_of_lt (Nat.lt_succ_self count))
    | cons bit rest => rfl

theorem response_at_counts {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} (count : Nat)
    (localCount : carrierLocalCount? program tree source = some count)
    (tombstoneCount : carrierTombstoneCount? program tree source = some (count + 1)) :
    carrierResponseBit? program tree source =
      if RootResetCompletedLocalPatterns.accepts .marked program tree source then some false
      else deletedFrontBit? program tree source := by
  rw [carrierResponseBit?, localCount, tombstoneCount]
  cases parsed : CheckpointDecoder.parseLocal? program tree source with
  | none =>
      dsimp only
      rw [marked_none parsed]
      exact different_counts count _ _
  | some view =>
      dsimp only
      cases status : view.status with
      | fresh =>
          rw [RootResetMixedLocalFragment.marked_misses_fresh parsed status]
          exact different_counts count _ _
      | marked =>
          have accepted := (RootResetCompletedLocalPatterns.accepts_iff_parse .marked program tree source).mpr
            ⟨view, status, parsed⟩
          rw [accepted]
          rfl

theorem normal_counts {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} (count : Nat) (bit : Bool)
    (localCount : carrierLocalCount? program tree source = some count)
    (tombstoneCount : carrierTombstoneCount? program tree source = some (count + 1))
    (responseBit : carrierResponseBit? program tree source = some bit) : value program tree source = bit := by
  rw [response_at_counts count localCount tombstoneCount] at responseBit
  rw [value]
  cases accepted : RootResetCompletedLocalPatterns.accepts .marked program tree source with
  | true =>
      simp only [accepted, ↓reduceIte] at responseBit ⊢
      exact Option.some.inj responseBit
  | false =>
      simp only [accepted, Bool.false_eq_true, ↓reduceIte] at responseBit ⊢
      rw [responseBit]
      rfl

theorem empty_base (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (continuation seed beta : Term) :
    value program tree (CheckpointDecoder.openBase (compileActions program tree) continuation omega seed beta) = false := by
  have parsed := CheckpointDecoder.parseBase?_open (compileActions program tree) continuation omega seed beta
  have noLocal : CheckpointDecoder.parseLocal? program tree
      (CheckpointDecoder.openBase (compileActions program tree) continuation omega seed beta) = none := by
    cases found : CheckpointDecoder.parseLocal? program tree
      (CheckpointDecoder.openBase (compileActions program tree) continuation omega seed beta) with
    | none => rfl
    | some view =>
        have noBase := CheckpointRun.parseBase?_none_of_localShape (CheckpointDecoder.parseLocal?_sound found)
        rw [parsed] at noBase
        contradiction
  rw [value, marked_none noLocal]
  simp only [Bool.false_eq_true, ↓reduceIte]
  rw [deletedFrontBit?, parsed]
  change (deletedFrontBitInSpine? omega).getD false = false
  rw [deletedFrontBitInSpine?]
  rfl

theorem marked_completed (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bit : Bool) (bits : List Bool)
    (continuation carrier : Term) :
    value program dispatcher.tree (LocalResponse.markedCompleted bits continuation carrier
      (SchedulerResponse.completedRoute program dispatcher registers bit carrier)) = false := by
  have dispatch := SchedulerResponse.completedRoute_snapshotDispatch program dispatcher registers bit carrier
  exact marked (CheckpointDecoder.parseLocal?_markedCompleted (continuation := continuation) bits dispatch) rfl

theorem empty_sweep (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation : Term) (count : Nat) (registers : SchedulerControl.Registers program)
    (carrier : Term) (initialValue : value program dispatcher.tree carrier = false) :
    value program dispatcher.tree (SchedulerCycle.emptySweepCarrier program dispatcher bits continuation count registers carrier) = false := by
  induction count generalizing registers carrier with
  | zero => exact initialValue
  | succ count ih => exact ih registers.advanceEmpty _ (marked_completed program dispatcher registers false bits continuation carrier)

theorem initial_empty_sweep (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (continuation : Term) (count : Nat) :
    value program dispatcher.tree (SchedulerCycle.emptySweepCarrier program dispatcher [] continuation count
      (SchedulerNestedEmpty.initialEmptyRegisters program)
      (baseCarrier (environmentCode (compileActions program dispatcher.tree) []) continuation)) = false :=
  empty_sweep program dispatcher [] continuation count _ _ (empty_base program dispatcher.tree continuation _ _)

end PureSFormal.Research.RootResetResponseBitFiniteValue
