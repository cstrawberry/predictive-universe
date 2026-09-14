import PureSFormal.Research.RootResetCarrierNonemptyProbe
import PureSFormal.Research.RootResetCarrierScanParentBoundary

/-!
# Exact stopping boundaries for the finite inverse carrier scan

Every successful inverse row requires an immediate carrier parent at its
starting cursor. This condition is derived for the actual Base, Local,
and tombstone rows from their literal patterns and addresses. Consequently
the inverse family stops at a root, a completed-continuation origin, or a
pending-FRAME origin. No additional guard or semantic parser is inserted
into the finite machine. Interior-edge inverse uniqueness is proved in RootResetCarrierInverseUnique.
-/

namespace PureSFormal.Research.RootResetCarrierInverseBoundary
open PureSFormal.PureS
open RootResetCarrierEdgePatterns
open RootResetCompletedLocalPatterns
open RootResetCarrierScanParentBoundary

inductive Anchored : Pattern → Address → Prop where
  | s (argument : Pattern) : Anchored (.app .s argument) [.right]
  | p (argument : Pattern) : Anchored (.app (literal PureS.p) argument) [.right]
  | left {fn : Pattern} {address : Address} (arg : Pattern) :
      Anchored fn address → Anchored (.app fn arg) (.left :: address)
  | right {arg : Pattern} {address : Address} (fn : Pattern) :
      Anchored arg address → Anchored (.app fn arg) (.right :: address)

theorem anchored_follow {pattern : Pattern} {address : Address}
    (anchored : Anchored pattern address) (origin endpoint : Cursor)
    (matched : pattern.matchesBool origin.focus = true)
    (followed : RootResetEdgeFragment.follow address origin = some endpoint) :
    carrierParent? endpoint.parents.head? = true := by
  induction anchored generalizing origin with
  | s argument =>
      rcases origin with ⟨source, parents⟩
      obtain ⟨fn, arg, sourceEq, fnMatch, _⟩ := app_matches matched
      have fnEq : fn = .s := (Pattern.matches_s_iff fn).mp (Pattern.matchesBool_sound fnMatch)
      change source = _ at sourceEq
      subst source
      subst fn
      have endpointEq : ⟨arg, ParentFrame.right Term.s :: parents⟩ = endpoint := Option.some.inj followed
      subst endpoint
      rfl
  | p argument =>
      rcases origin with ⟨source, parents⟩
      obtain ⟨fn, arg, sourceEq, fnMatch, _⟩ := app_matches matched
      have fnEq : fn = PureS.p := (literal_matches _ _).mp fnMatch
      change source = _ at sourceEq
      subst source
      subst fn
      have endpointEq : ⟨arg, ParentFrame.right PureS.p :: parents⟩ = endpoint := Option.some.inj followed
      subst endpoint
      rfl
  | left argument anchored ih =>
      rcases origin with ⟨source, parents⟩
      obtain ⟨fn, arg, sourceEq, fnMatch, _⟩ := app_matches matched
      change source = _ at sourceEq
      subst source
      exact ih ⟨fn, .left arg :: parents⟩ fnMatch followed
  | right fnPattern anchored ih =>
      rcases origin with ⟨source, parents⟩
      obtain ⟨fn, arg, sourceEq, _, argMatch⟩ := app_matches matched
      change source = _ at sourceEq
      subst source
      exact ih ⟨arg, .right fn :: parents⟩ argMatch followed

theorem extend_anchored (base : Pattern) (address : Address) (count : Nat)
    (anchored : Anchored base address) :
    Anchored (extend base count) (ActionParser.prefixLeft count address) := by
  induction count generalizing base address with
  | zero => exact anchored
  | succ count ih => exact ih (.app base .hole) (.left :: address) (.left .hole anchored)

theorem action_anchored (count : Nat) : Anchored (actionPattern count) (ActionParser.accumulatorAddress count) :=
  extend_anchored _ _ count (.p .hole)

theorem dispatch_anchored (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (row : DispatchRow program) (member : row ∈ dispatchRows program tree) :
    Anchored row.pattern (RootResetReachableStageGrammar.routeResponseAddress row.route ++
      ActionParser.accumulatorAddress (ActionParser.historyCount program row.label)) := by
  induction tree generalizing row with
  | leaf label =>
      have equal := List.mem_singleton.mp member
      subst row
      exact .right _ (action_anchored _)
  | node left right ihLeft ihRight =>
      rcases List.mem_append.mp member with inLeft | inRight
      · obtain ⟨inner, innerMember, equal⟩ := map_member_inverse _ _ _ inLeft
        subst row
        exact .right _ (.left _ (ihLeft inner innerMember))
      · obtain ⟨inner, innerMember, equal⟩ := map_member_inverse _ _ _ inRight
        subst row
        exact .right _ (.right _ (ihRight inner innerMember))

theorem local_anchored (status : CheckpointDecoder.HaltStatus) (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (row : EdgeRow) (member : row ∈ localRows status program tree) :
    Anchored row.pattern row.address := by
  obtain ⟨dispatch, dispatchMember, equal⟩ := map_member_inverse _ _ _ member
  subst row
  exact .left _ (.left _ (.right _ (dispatch_anchored program tree dispatch dispatchMember)))

theorem rows_anchored (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (row : EdgeRow) (member : row ∈ RootResetCarrierNonemptyRows.rows program tree) :
    Anchored row.pattern row.address := by
  rcases List.mem_cons.mp member with first | later
  · subst row
    exact .left _ (.right _ (.left _ (.left _ (.right _ (.right _ (.s .hole))))))
  · rcases RootResetCarrierNonemptyAgreement.tail_member program tree row later with fresh | marked | zero | one
    · exact local_anchored .fresh program tree row fresh
    · exact local_anchored .marked program tree row marked
    · subst row
      exact .left _ (.s .hole)
    · subst row
      exact .left _ (.s .hole)

theorem inverse_requires_parent (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin ancestor : Cursor)
    (found : RootResetInverseEdgeSpine.familyResult (RootResetCarrierNonemptyRows.rows program tree) origin = some ancestor) :
    carrierParent? origin.parents.head? = true := by
  obtain ⟨row, member, back⟩ := RootResetInverseEdgeSpine.familyResult_sound _ origin ancestor found
  have forward := RootResetInverseEdgeFragment.backResult_follow _ _ origin ancestor back
  rw [List.reverse_reverse] at forward
  exact anchored_follow (rows_anchored program tree row member) ancestor origin
    (RootResetInverseEdgeFragment.backResult_matches _ _ origin ancestor back) forward

theorem boundary_misses (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin : Cursor) (boundary : carrierParent? origin.parents.head? = false) :
    RootResetInverseEdgeSpine.familyResult (RootResetCarrierNonemptyRows.rows program tree) origin = none := by
  cases result : RootResetInverseEdgeSpine.familyResult (RootResetCarrierNonemptyRows.rows program tree) origin with
  | none => rfl
  | some ancestor =>
      have required := inverse_requires_parent program tree origin ancestor result
      rw [boundary] at required
      contradiction

theorem root_misses (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (source : Term) :
    RootResetInverseEdgeSpine.familyResult (RootResetCarrierNonemptyRows.rows program tree) (Cursor.atRoot source) = none :=
  boundary_misses program tree _ rfl


theorem completedContinuation_misses
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program tree source = some view)
    (parents : List ParentFrame) :
    RootResetInverseEdgeSpine.familyResult (RootResetCarrierNonemptyRows.rows program tree)
      ⟨view.continuation, ContextCursor.frames
        (RootResetReachableStageGrammar.localContinuationContext source) view.continuation parents⟩ = none :=
  boundary_misses program tree _ (carrierParent_completedContinuation parsed parents)

theorem pendingParents_misses (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (actions : Term) (bits : List Bool) (continuation source : Term) (count : Nat)
    (parents : List ParentFrame) :
    RootResetInverseEdgeSpine.familyResult (RootResetCarrierNonemptyRows.rows program tree)
      ⟨source, PrimitiveFuel.pendingParents (environmentCode actions bits) continuation (count + 1) parents⟩ = none :=
  boundary_misses program tree _ (carrierParent_pendingParents actions bits continuation count parents)

end PureSFormal.Research.RootResetCarrierInverseBoundary
