import PureSFormal.Research.RootResetFrontNonemptyAgreement
import PureSFormal.Research.RootResetCompletedFrontPreservation
import PureSFormal.Research.RootResetCarrierEdgePatterns

/-!
# Immediate live stops on generated designated carrier paths

A live cell already certifies nonemptiness; only tombstones, Base queues,
and completed Local accumulators need descent. The decoder proves this
scan agrees with fresh continuation admission, and registered Local edge
matches reach the precise parsed accumulator without a reachability premise.
-/

namespace PureSFormal.Research.RootResetCarrierImmediateLive
open PureSFormal.PureS

/-- A live cell proves nonemptiness immediately; tombstones follow LR. -/
def spineHasLive? (term : Term) : Bool :=
  if term = omega then false else
    match parsed : CanonicalStep.parseCell? term with
    | some (.live _ _) => true
    | some (.tombstone _ predecessor) => spineHasLive? predecessor
    | none => false
termination_by term.size
decreasing_by exact CheckpointDecoder.parsedCell_size_lt parsed rfl

/-- Only designated carrier edges are traversed, with an immediate live stop. -/
def carrierHasLive? (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (term : Term) : Bool :=
  match baseEq : CheckpointDecoder.parseBase? (compileActions program tree) term with
  | some view => spineHasLive? view.queue
  | none =>
    match localEq : CheckpointDecoder.parseLocal? program tree term with
    | some view => carrierHasLive? program tree view.accumulator
    | none =>
      match cellEq : CanonicalStep.parseCell? term with
      | some (.live _ _) => true
      | some (.tombstone _ predecessor) => carrierHasLive? program tree predecessor
      | none => false
termination_by term.size
decreasing_by
  · exact CheckpointDecoder.parseLocal?_accumulator_size_lt localEq
  · exact CheckpointDecoder.parsedCell_size_lt cellEq rfl

theorem spineHasLive?_decode {term : Term} {decoded : List Bool}
    (path : CellSpine.Decodes term decoded) : spineHasLive? term = !decoded.isEmpty := by
  induction path with
  | omega => simp [spineHasLive?]
  | live bit inner ih =>
      rw [spineHasLive?, if_neg (Carrier.omega_ne_liveCell bit _).symm, CanonicalStep.parseCell?_live]
      simp
  | tombstone bit audit inner ih =>
      rw [spineHasLive?, if_neg (Carrier.omega_ne_tombstone bit _ audit).symm, CanonicalStep.parseCell?_tombstone]
      exact ih

theorem carrierHasLive?_decode {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {decoded : List Bool}
    (path : CheckpointDecoder.CarrierDecodes program tree term decoded) :
    carrierHasLive? program tree term = !decoded.isEmpty := by
  induction path with
  | base view boundary queue =>
      rw [carrierHasLive?, boundary]
      exact spineHasLive?_decode queue
  | «local» view notBase boundary inner ih =>
      rw [carrierHasLive?, notBase, boundary]
      exact ih
  | live bit notBase notLocal boundary inner ih =>
      rw [carrierHasLive?, notBase, notLocal, boundary]
      simp
  | tombstone bit notBase notLocal boundary inner ih =>
      rw [carrierHasLive?, notBase, notLocal, boundary]
      exact ih

theorem carrierHasLive?_fresh_admission
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : CheckpointDecoder.LocalView program} {decoded : List Bool}
    (parsed : CheckpointDecoder.parseLocal? program tree term = some view)
    (fresh : view.status = .fresh)
    (carrier : CheckpointDecoder.CarrierDecodes program tree view.accumulator decoded) :
    carrierHasLive? program tree view.accumulator =
      (RootResetPersistentRouteA.parseFreshNonempty? program tree term).isSome := by
  rw [RootResetFrontNonemptyAgreement.fresh_admission_eq_front parsed fresh carrier,
    RootResetFrontNonemptyAgreement.carrier_nonempty carrier, carrierHasLive?_decode carrier]

theorem localRow_subterm
    (status : CheckpointDecoder.HaltStatus) (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (row : RootResetCarrierEdgePatterns.DispatchRow program)
    (member : row ∈ RootResetCarrierEdgePatterns.dispatchRows program tree) (source : Term)
    (matched : (RootResetCarrierEdgePatterns.localRow status program row).pattern.matchesBool source = true) :
    ∃ view : CheckpointDecoder.LocalView program,
      view.status = status ∧ CheckpointDecoder.parseLocal? program tree source = some view ∧
      source.subterm? (RootResetCarrierEdgePatterns.localRow status program row).address = some view.accumulator := by
  obtain ⟨view, statusEq, parsed, addressEq⟩ := RootResetCarrierEdgePatterns.localRow_sound status program tree row member source matched
  refine ⟨view, statusEq, parsed, ?_⟩
  rw [addressEq]
  exact RootResetCompletedFrontPreservation.localParsed_accumulator_subterm parsed

end PureSFormal.Research.RootResetCarrierImmediateLive
