import PureSFormal.Research.RootResetMixedLocalFragment

/-!
# Finite nonempty reading from every successful public carrier decode

The loose Base pattern does not compare duplicated continuation payloads.
Nevertheless its fixed inner boundary rejects a tombstone over any decoded
carrier, including a Base with an arbitrary continuation. This strengthens
the finite nonempty agreement to the public decoder grammar and supplies
the exact premise retained by historical clean fresh parents.
-/
namespace PureSFormal.Research.RootResetDecodedCarrierNonemptyAgreement
open PureSFormal.PureS
open RootResetCarrierNonemptyRows
open RootResetCarrierNonemptyAgreement

theorem base_misses_tombstone_openBase (actions : Term) (bit : Bool)
    (continuation queue seed beta audit : Term) :
    (basePattern actions).matchesBool (Carrier.tombstone bit
      (CheckpointDecoder.openBase actions continuation queue seed beta) audit) = false := by
  simp only [basePattern, Carrier.tombstone, CheckpointDecoder.openBase, Pattern.matchesBool,
    environmentPattern, CheckpointDecoder.openEnvironment, RootResetCompletedLocalPatterns.literal,
    b, Bool.and_false, Bool.false_and]

theorem base_misses_tombstone_decoded {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {predecessor : Term} {decoded : List Bool}
    (carrier : CheckpointDecoder.CarrierDecodes program tree predecessor decoded)
    (bit : Bool) (audit : Term) :
    (basePattern (compileActions program tree)).matchesBool (Carrier.tombstone bit predecessor audit) = false := by
  cases carrier with
  | base view parsed queue =>
      rw [CheckpointDecoder.parseBase?_sound parsed]
      exact base_misses_tombstone_openBase _ bit _ _ _ _ audit
  | «local» view notBase parsed inner =>
      apply base_misses_tombstone_of_arity
      rcases CheckpointDecoder.parseLocal?_headArity parsed with five | six
      · rw [five]; decide
      · rw [six]; decide
  | live innerBit notBase notLocal parsed inner =>
      cases CanonicalStep.parseCell?_sound parsed with
      | live => exact base_misses_tombstone_live _ bit innerBit _ audit
  | tombstone innerBit notBase notLocal parsed inner =>
      cases CanonicalStep.parseCell?_sound parsed with
      | tombstone =>
          apply base_misses_tombstone_of_arity
          rw [Carrier.headArity_tombstone]
          decide

theorem decoded_value {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} {decoded : List Bool}
    (carrier : CheckpointDecoder.CarrierDecodes program tree source decoded) :
    ReadValue (rows program tree) source (!decoded.isEmpty) := by
  induction carrier with
  | base view parsed queue =>
      rw [CheckpointDecoder.parseBase?_sound parsed]
      exact .next _ view.queue (baseRow (compileActions program tree))
        (select_base program tree view.continuation view.queue view.seedPayload view.beta)
        (by cases view.queue <;> rfl) (ReadValue.spine program tree queue)
  | «local» view notBase parsed inner ih => exact .local parsed ih
  | live bit notBase notLocal parsed inner ih =>
      cases CanonicalStep.parseCell?_sound parsed with
      | live =>
          rw [append_singleton_nonempty]
          simpa only [isLive?_live] using ReadValue.done _ (select_live program tree bit _)
  | tombstone bit notBase notLocal parsed inner ih =>
      cases CanonicalStep.parseCell?_sound parsed with
      | tombstone =>
          rename_i audit
          exact .tombstone program tree bit _ audit (base_misses_tombstone_decoded inner bit audit) ih

theorem fresh_admission_restores {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} {decoded : List Bool} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program tree source = some view) (fresh : view.status = .fresh)
    (carrier : CheckpointDecoder.CarrierDecodes program tree view.accumulator decoded)
    (origin : Cursor) (atSource : origin.focus = source)
    (boundary : RootResetCarrierScanParentBoundary.carrierParent? origin.parents.head? = false) :
    ∃ ticks, ticks ≤ RootResetCarrierNonemptyProbe.budget program tree origin ∧
      FiniteController.run (RootResetCarrierNonemptyProbe.machine program tree) ticks
        (RootResetCarrierNonemptyProbe.initial program tree origin) =
          ⟨some (.done ((RootResetPersistentRouteA.parseFreshNonempty? program tree source).isSome)), origin⟩ := by
  obtain ⟨ticks, descended, bounded, execution, down⟩ := RootResetCarrierInverseUnique.all_input_restores program tree origin boundary
  have values := ReadValue.local parsed (decoded_value carrier)
  have answer := values.walks down atSource
  have admission := RootResetCarrierImmediateLive.carrierHasLive?_fresh_admission parsed fresh carrier
  rw [RootResetCarrierImmediateLive.carrierHasLive?_decode carrier] at admission
  rw [answer, admission] at execution
  exact ⟨ticks, bounded, execution⟩

open FiniteController RootResetMixedLocalFragment

theorem decoded_fresh_runs
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {decoded : List Bool} {source : Term}
    {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program tree source = some view)
    (fresh : view.status = .fresh)
    (carrier : CheckpointDecoder.CarrierDecodes program tree view.accumulator decoded)
    (origin : Cursor) (atSource : origin.focus = source)
    (boundary : RootResetCarrierScanParentBoundary.carrierParent? origin.parents.head? = false) :
    ∃ ticks left audit, ticks ≤ budget program tree origin ∧
      source = .app left (.app view.continuation audit) ∧
      run (RootResetMixedLocalFragment.machine program tree) ticks (RootResetMixedLocalFragment.initial program tree origin) =
        if (RootResetPersistentRouteA.parseFreshNonempty? program tree source).isSome
        then ⟨some (.done true), ⟨view.continuation, .left audit :: .right left :: origin.parents⟩⟩
        else ⟨some (.done false), origin⟩ := by
  obtain ⟨left, audit, shape⟩ := parsed_shape parsed
  obtain ⟨m, mb, mr⟩ := marked_runs program tree origin
  have markNo : RootResetCompletedLocalPatterns.accepts .marked program tree origin.focus = false :=
    atSource ▸ marked_misses_fresh parsed fresh
  simp only [markNo, Bool.false_eq_true, ↓reduceIte] at mr
  obtain ⟨f, fb, fr⟩ := fresh_runs program tree origin
  have freshYes : RootResetCompletedLocalPatterns.accepts .fresh program tree origin.focus = true := by
    rw [atSource]
    exact (RootResetCompletedLocalPatterns.accepts_iff_parse .fresh program tree source).mpr ⟨view, fresh, parsed⟩
  simp only [freshYes, ↓reduceIte] at fr
  obtain ⟨p, pb, pr⟩ := fresh_admission_restores parsed fresh carrier origin atSource boundary
  obtain ⟨used, ub, ur⟩ := probing_runs program tree origin _ p pr
  have bounded := full_bound program tree origin m f used mb fb (Nat.le_trans ub pb)
  have firstTwo : run (RootResetMixedLocalFragment.machine program tree) (m + 1 + (f + 1)) (RootResetMixedLocalFragment.initial program tree origin) = probeInitial program tree origin := by
    rw [run_add, mr]
    exact fr
  have prefixRun : run (RootResetMixedLocalFragment.machine program tree) (m + 1 + (f + 1) + (used + 1)) (RootResetMixedLocalFragment.initial program tree origin) =
      if (RootResetPersistentRouteA.parseFreshNonempty? program tree source).isSome
      then ⟨some .enterRight, origin⟩ else ⟨some (.done false), origin⟩ := by
    rw [run_add, firstTwo]
    exact ur
  cases answer : (RootResetPersistentRouteA.parseFreshNonempty? program tree source).isSome with
  | false =>
      simp only [answer, Bool.false_eq_true, ↓reduceIte] at prefixRun
      refine ⟨_, left, audit, Nat.le_trans (Nat.le_add_right _ 2) bounded, shape, ?_⟩
      simpa only [answer, Bool.false_eq_true, ↓reduceIte] using prefixRun
  | true =>
      simp only [answer, ↓reduceIte] at prefixRun
      refine ⟨_ + 2, left, audit, bounded, shape, ?_⟩
      simp only [answer, ↓reduceIte]
      rw [run_add, prefixRun]
      rcases origin with ⟨source', parents⟩
      change source' = source at atSource
      subst source'
      rw [shape]
      exact enter_runs program tree left _ audit parents

end PureSFormal.Research.RootResetDecodedCarrierNonemptyAgreement
