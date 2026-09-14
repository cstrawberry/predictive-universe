import PureSFormal.Research.RootResetGeneratedFrontParserAgreement

/-!
# Front-search characterization of fresh continuation admission

On the public carrier grammar, front-search success is exactly nonempty
decoded data. This characterizes the fresh Local continuation decision using
the designated carrier path without constructing the decoded Boolean list.
-/

namespace PureSFormal.Research.RootResetFrontNonemptyAgreement
open PureSFormal.PureS
open RootResetPersistentResponseSelector

theorem map_isSome (value : Option Address) (f : Address → Address) :
    (value.map f).isSome = value.isSome := by
  cases value <;> rfl

theorem spine_nonempty {term : Term} {decoded : List Bool}
    (path : CellSpine.Decodes term decoded) :
    (spineFirstLiveAddress? term).isSome = !decoded.isEmpty := by
  induction path with
  | omega => simp [spineFirstLiveAddress?]
  | live bit inner ih =>
      rw [spineFirstLiveAddress?, if_neg (Carrier.omega_ne_liveCell bit _).symm,
        CanonicalStep.parseCell?_live]
      dsimp only
      split <;> simp
  | tombstone bit audit inner ih =>
      rw [spineFirstLiveAddress?, if_neg (Carrier.omega_ne_tombstone bit _ audit).symm,
        CanonicalStep.parseCell?_tombstone]
      dsimp only
      simpa only [map_isSome] using ih

theorem carrier_nonempty {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {decoded : List Bool}
    (path : CheckpointDecoder.CarrierDecodes program tree term decoded) :
    (carrierFirstLiveAddress? program tree term).isSome = !decoded.isEmpty := by
  induction path with
  | base view boundary queue =>
      rw [carrierFirstLiveAddress?, boundary]
      dsimp only
      simpa only [map_isSome] using spine_nonempty queue
  | «local» view notBase boundary inner ih =>
      rw [carrierFirstLiveAddress?, notBase, boundary]
      dsimp only
      simpa only [map_isSome] using ih
  | live bit notBase notLocal boundary inner ih =>
      rw [carrierFirstLiveAddress?, notBase, notLocal, boundary]
      dsimp only
      split <;> simp
  | tombstone bit notBase notLocal boundary inner ih =>
      rw [carrierFirstLiveAddress?, notBase, notLocal, boundary]
      dsimp only
      simpa only [map_isSome] using ih

theorem generated_front_nonempty
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation term : Term} {decoded : List Bool}
    (admissible : Carrier.Admissible continuation)
    (path : CarrierDecoder.PathDecodes program tree bits continuation term decoded) :
    (RootResetSelectedFrontParserAgreement.firstLiveAddress? program tree term).isSome = !decoded.isEmpty := by
  rw [← RootResetGeneratedFrontParserAgreement.first_eq_of_path admissible path]
  exact carrier_nonempty (CheckpointRun.pathDecodes_to_termOnly admissible path)

theorem fresh_admission_eq_front
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : CheckpointDecoder.LocalView program} {decoded : List Bool}
    (parsed : CheckpointDecoder.parseLocal? program tree term = some view)
    (fresh : view.status = .fresh)
    (carrier : CheckpointDecoder.CarrierDecodes program tree view.accumulator decoded) :
    (RootResetPersistentRouteA.parseFreshNonempty? program tree term).isSome =
      (carrierFirstLiveAddress? program tree view.accumulator).isSome := by
  rw [carrier_nonempty carrier, RootResetPersistentRouteA.parseFreshNonempty?, parsed]
  dsimp only
  rw [fresh, CheckpointDecoder.decodeCarrier?_complete program tree carrier]
  cases decoded <;> rfl

end PureSFormal.Research.RootResetFrontNonemptyAgreement
