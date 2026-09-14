import PureSFormal.Research.RootResetCarrierInverseBoundary
/-!
# Exact reversal and origin restoration for the carrier probe

The reverse Local accumulator addresses are self-delimiting: history Ls,
route side/R pairs, and the final RLL shell delimiter have a unique endpoint.
The final parent function distinguishes Local edges from Base and tombstone
edges. The proof-only decoder below therefore identifies the same previous
carrier cursor for every successful inverse row, regardless of row order.
Combined with the actual inverse boundary theorem, this closes exact origin
restoration of the finite down/live/up probe. Its generated fresh-Local
answer is exactly the public fresh admission Boolean. The decoder supplies
proof evidence only; it is not a runtime control register or parser oracle.
-/

namespace PureSFormal.Research.RootResetCarrierInverseUnique
open PureSFormal.PureS
open RootResetCarrierEdgePatterns
open RootResetCompletedLocalPatterns

def routeEnd : Address → Option Address
  | .left :: .right :: rest => routeEnd rest
  | .right :: .right :: rest => routeEnd rest
  | .right :: .left :: .left :: rest => some rest
  | _ => none

def historyEnd : Address → Option Address
  | .left :: rest => historyEnd rest
  | .right :: rest => routeEnd rest
  | _ => none

def localEnd : Address → Option Address
  | .right :: rest => historyEnd rest
  | _ => none

def localAddress (route : Dispatcher.Route) (count : Nat) : Address :=
  [.left, .left, .right] ++ RootResetReachableStageGrammar.routeResponseAddress route ++
    ActionParser.accumulatorAddress count

theorem prefixLeft_eq (count : Nat) (suffix : Address) :
    ActionParser.prefixLeft count suffix = List.replicate count .left ++ suffix := by
  induction count generalizing suffix with
  | zero => rfl
  | succ count ih =>
      rw [ActionParser.prefixLeft, ih]
      simp only [List.replicate_succ, List.cons_append]
      rw [← ih (.left :: suffix), ActionParser.prefixLeft_left, ih]


theorem historyEnd_lefts (count : Nat) (suffix : Address) :
    historyEnd (List.replicate count .left ++ suffix) = historyEnd suffix := by
  induction count with
  | zero => rfl
  | succ count ih => exact ih

theorem routeEnd_route (route : Dispatcher.Route) (suffix : Address) :
    historyEnd ((RootResetReachableStageGrammar.routeResponseAddress route).reverse ++ suffix) = routeEnd suffix := by
  induction route generalizing suffix with
  | nil => rfl
  | cons side rest ih =>
      cases side <;>
        simp only [RootResetReachableStageGrammar.routeResponseAddress, List.reverse_append,
          List.reverse_cons, List.reverse_nil, List.nil_append, List.append_assoc, List.cons_append]
      all_goals
        rw [ih]
        rfl

theorem localEnd_encoded (route : Dispatcher.Route) (count : Nat) (suffix : Address) :
    localEnd ((localAddress route count).reverse ++ suffix) = some suffix := by
  simp only [localAddress, List.reverse_append, ActionParser.accumulatorAddress, prefixLeft_eq,
    List.reverse_cons, List.reverse_nil, List.nil_append, List.reverse_replicate,
    List.append_assoc, List.cons_append, localEnd]
  rw [historyEnd_lefts]
  rw [routeEnd_route]
  rfl


def sides (cursor : Cursor) : Address := cursor.parents.map ParentFrame.side

theorem follow_sides (address : Address) (origin endpoint : Cursor)
    (followed : RootResetEdgeFragment.follow address origin = some endpoint) :
    sides endpoint = address.reverse ++ sides origin := by
  induction address generalizing origin with
  | nil =>
      have equal : origin = endpoint := Option.some.inj followed
      subst origin
      rfl
  | cons side rest ih =>
      rcases origin with ⟨focus, parents⟩
      cases focus with
      | s => cases side <;> cases followed
      | app fn arg =>
          cases side with
          | left =>
              have inner := ih ⟨fn, .left arg :: parents⟩ followed
              simpa only [sides, List.map_cons, ParentFrame.side, List.reverse_cons, List.append_assoc,
                List.singleton_append] using inner
          | right =>
              have inner := ih ⟨arg, .right fn :: parents⟩ followed
              simpa only [sides, List.map_cons, ParentFrame.side, List.reverse_cons, List.append_assoc,
                List.singleton_append] using inner

def climb : Nat → Cursor → Option Cursor
  | 0, origin => some origin
  | count + 1, origin => origin.up?.bind (climb count)

theorem back_climb (address : Address) (pattern : Pattern) (origin ancestor : Cursor)
    (found : RootResetInverseEdgeFragment.backResult address pattern origin = some ancestor) :
    climb address.length origin = some ancestor := by
  induction address generalizing origin with
  | nil =>
      cases matched : pattern.matchesBool origin.focus with
      | false => simp only [RootResetInverseEdgeFragment.backResult, matched, Bool.false_eq_true, ↓reduceIte] at found; cases found
      | true => simpa only [RootResetInverseEdgeFragment.backResult, matched, ↓reduceIte] using! found
  | cons side rest ih =>
      rcases origin with ⟨focus, parents⟩
      cases parents with
      | nil => cases side <;> cases found
      | cons frame parents =>
          cases frame with
          | left sibling => cases side with
            | left => exact ih ⟨.app focus sibling, parents⟩ found
            | right => cases found
          | right sibling => cases side with
            | left => cases found
            | right => exact ih ⟨.app sibling focus, parents⟩ found

theorem local_inverse_unique (route firstRoute : Dispatcher.Route) (count firstCount : Nat)
    (pattern firstPattern : Pattern) (origin ancestor endpoint : Cursor)
    (actual : RootResetInverseEdgeFragment.backResult (localAddress route count).reverse pattern endpoint = some origin)
    (candidate : RootResetInverseEdgeFragment.backResult (localAddress firstRoute firstCount).reverse firstPattern endpoint = some ancestor) :
    ancestor = origin := by
  have actualForward := RootResetInverseEdgeFragment.backResult_follow _ _ endpoint origin actual
  have candidateForward := RootResetInverseEdgeFragment.backResult_follow _ _ endpoint ancestor candidate
  rw [List.reverse_reverse] at actualForward candidateForward
  have actualSides := follow_sides _ _ _ actualForward
  have candidateSides := follow_sides _ _ _ candidateForward
  have tailEqual : sides ancestor = sides origin := by
    have one := localEnd_encoded route count (sides origin)
    have two := localEnd_encoded firstRoute firstCount (sides ancestor)
    rw [← actualSides] at one
    rw [← candidateSides] at two
    exact Option.some.inj (two.symm.trans one)
  have depthEqual : ancestor.parents.length = origin.parents.length := by
    have lengths := congrArg List.length tailEqual
    simpa only [sides, List.length_map] using lengths
  have actualDepth := RootResetInverseEdgeFragment.backResult_depth _ _ endpoint origin actual
  have candidateDepth := RootResetInverseEdgeFragment.backResult_depth _ _ endpoint ancestor candidate
  have pathLengths : (localAddress firstRoute firstCount).reverse.length = (localAddress route count).reverse.length := by
    rw [depthEqual] at candidateDepth
    exact Nat.add_right_cancel (candidateDepth.symm.trans actualDepth)
  have firstClimb := back_climb _ _ endpoint ancestor candidate
  have secondClimb := back_climb _ _ endpoint origin actual
  rw [pathLengths] at firstClimb
  exact Option.some.inj (firstClimb.symm.trans secondClimb)


def parentFunction (cursor : Cursor) : Option Term :=
  match cursor.parents with
  | .right function :: _ => some function
  | _ => none

inductive AtParent (function : Term) : Pattern → Address → Prop where
  | here (argument : Pattern) : AtParent function (.app (literal function) argument) [.right]
  | left {fn : Pattern} {address : Address} (arg : Pattern) :
      AtParent function fn address → AtParent function (.app fn arg) (.left :: address)
  | right {arg : Pattern} {address : Address} (fn : Pattern) :
      AtParent function arg address → AtParent function (.app fn arg) (.right :: address)

theorem atParent_follow {function : Term} {pattern : Pattern} {address : Address}
    (anchored : AtParent function pattern address) (origin endpoint : Cursor)
    (matched : pattern.matchesBool origin.focus = true)
    (followed : RootResetEdgeFragment.follow address origin = some endpoint) :
    parentFunction endpoint = some function := by
  induction anchored generalizing origin with
  | here argument =>
      rcases origin with ⟨source, parents⟩
      obtain ⟨fn, arg, sourceEq, fnMatch, _⟩ := app_matches matched
      have fnEq : fn = function := (literal_matches _ _).mp fnMatch
      change source = _ at sourceEq
      subst source
      subst fn
      have endpointEq : ⟨arg, ParentFrame.right function :: parents⟩ = endpoint := Option.some.inj followed
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

theorem extend_atParent (base : Pattern) (address : Address) (count : Nat)
    (anchored : AtParent p base address) :
    AtParent p (extend base count) (ActionParser.prefixLeft count address) := by
  induction count generalizing base address with
  | zero => exact anchored
  | succ count ih => exact ih (.app base .hole) (.left :: address) (.left .hole anchored)

theorem action_atParent (count : Nat) : AtParent p (actionPattern count) (ActionParser.accumulatorAddress count) :=
  extend_atParent _ _ count (.here .hole)

theorem dispatch_atParent (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (row : DispatchRow program) (member : row ∈ dispatchRows program tree) :
    AtParent p row.pattern (RootResetReachableStageGrammar.routeResponseAddress row.route ++
      ActionParser.accumulatorAddress (ActionParser.historyCount program row.label)) := by
  induction tree generalizing row with
  | leaf label =>
      have equal := List.mem_singleton.mp member
      subst row
      exact .right _ (action_atParent _)
  | node left right ihLeft ihRight =>
      rcases List.mem_append.mp member with inLeft | inRight
      · obtain ⟨inner, innerMember, equal⟩ := map_member_inverse _ _ _ inLeft
        subst row
        exact .right _ (.left _ (ihLeft inner innerMember))
      · obtain ⟨inner, innerMember, equal⟩ := map_member_inverse _ _ _ inRight
        subst row
        exact .right _ (.right _ (ihRight inner innerMember))

theorem local_atParent (status : CheckpointDecoder.HaltStatus) (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (row : EdgeRow) (member : row ∈ localRows status program tree) :
    AtParent p row.pattern row.address ∧ ∃ route count, row.address = localAddress route count := by
  obtain ⟨dispatch, dispatchMember, equal⟩ := map_member_inverse _ _ _ member
  subst row
  exact ⟨.left _ (.left _ (.right _ (dispatch_atParent program tree dispatch dispatchMember))),
    dispatch.route, ActionParser.historyCount program dispatch.label, rfl⟩

def plainEnd : Address → Option Address
  | .right :: .left :: rest => some rest
  | .right :: .right :: .right :: .left :: .left :: .right :: .left :: rest => some rest
  | _ => none

def edgeEnd (function : Option Term) (address : Address) : Option Address :=
  if function = some p then localEnd address
  else if function = some .s then plainEnd address else none

theorem edgeEnd_p (address : Address) : edgeEnd (some p) address = localEnd address := by
  simp only [edgeEnd, ↓reduceIte]

theorem edgeEnd_s (address : Address) : edgeEnd (some .s) address = plainEnd address := by
  have different : (some Term.s : Option Term) ≠ some p := by intro h; cases h
  simp only [edgeEnd, different, ↓reduceIte]

theorem local_edgeEnd (status : CheckpointDecoder.HaltStatus) (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (row : EdgeRow) (member : row ∈ localRows status program tree)
    (origin endpoint : Cursor) (matched : row.pattern.matchesBool origin.focus = true)
    (followed : RootResetEdgeFragment.follow row.address origin = some endpoint) :
    edgeEnd (parentFunction endpoint) (sides endpoint) = some (sides origin) := by
  obtain ⟨anchored, route, count, addressEq⟩ := local_atParent status program tree row member
  rw [atParent_follow anchored origin endpoint matched followed, edgeEnd_p,
    follow_sides row.address origin endpoint followed, addressEq]
  exact localEnd_encoded route count (sides origin)

theorem row_edgeEnd (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (row : EdgeRow) (member : row ∈ RootResetCarrierNonemptyRows.rows program tree)
    (origin endpoint : Cursor) (matched : row.pattern.matchesBool origin.focus = true)
    (followed : RootResetEdgeFragment.follow row.address origin = some endpoint) :
    edgeEnd (parentFunction endpoint) (sides endpoint) = some (sides origin) := by
  rcases List.mem_cons.mp member with first | later
  · subst row
    have anchored : AtParent .s (RootResetCarrierNonemptyRows.baseRow (compileActions program tree)).pattern
        (RootResetCarrierNonemptyRows.baseRow (compileActions program tree)).address :=
      .left _ (.right _ (.left _ (.left _ (.right _ (.right _ (.here .hole))))))
    rw [atParent_follow anchored origin endpoint matched followed, edgeEnd_s,
      follow_sides _ origin endpoint followed]
    rfl
  · rcases RootResetCarrierNonemptyAgreement.tail_member program tree row later with fresh | marked | zero | one
    · exact local_edgeEnd .fresh program tree row fresh origin endpoint matched followed
    · exact local_edgeEnd .marked program tree row marked origin endpoint matched followed
    · subst row
      have anchored : AtParent .s (RootResetCarrierNonemptyRows.tombstoneRow false).pattern
          (RootResetCarrierNonemptyRows.tombstoneRow false).address := .left _ (.here .hole)
      rw [atParent_follow anchored origin endpoint matched followed, edgeEnd_s,
        follow_sides _ origin endpoint followed]
      rfl
    · subst row
      have anchored : AtParent .s (RootResetCarrierNonemptyRows.tombstoneRow true).pattern
          (RootResetCarrierNonemptyRows.tombstoneRow true).address := .left _ (.here .hole)
      rw [atParent_follow anchored origin endpoint matched followed, edgeEnd_s,
        follow_sides _ origin endpoint followed]
      rfl

theorem inverse_unique (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (row candidate : EdgeRow)
    (member : row ∈ RootResetCarrierNonemptyRows.rows program tree)
    (candidateMember : candidate ∈ RootResetCarrierNonemptyRows.rows program tree)
    (origin ancestor endpoint : Cursor)
    (actual : RootResetInverseEdgeFragment.backResult row.address.reverse row.pattern endpoint = some origin)
    (other : RootResetInverseEdgeFragment.backResult candidate.address.reverse candidate.pattern endpoint = some ancestor) :
    ancestor = origin := by
  have actualForward := RootResetInverseEdgeFragment.backResult_follow _ _ endpoint origin actual
  have candidateForward := RootResetInverseEdgeFragment.backResult_follow _ _ endpoint ancestor other
  rw [List.reverse_reverse] at actualForward candidateForward
  have one := row_edgeEnd program tree row member origin endpoint
    (RootResetInverseEdgeFragment.backResult_matches _ _ endpoint origin actual) actualForward
  have two := row_edgeEnd program tree candidate candidateMember ancestor endpoint
    (RootResetInverseEdgeFragment.backResult_matches _ _ endpoint ancestor other) candidateForward
  have tailEqual : sides ancestor = sides origin := Option.some.inj (two.symm.trans one)
  have depthEqual : ancestor.parents.length = origin.parents.length := by
    have lengths := congrArg List.length tailEqual
    simpa only [sides, List.length_map] using lengths
  have actualDepth := RootResetInverseEdgeFragment.backResult_depth _ _ endpoint origin actual
  have candidateDepth := RootResetInverseEdgeFragment.backResult_depth _ _ endpoint ancestor other
  have pathLengths : candidate.address.reverse.length = row.address.reverse.length := by
    rw [depthEqual] at candidateDepth
    exact Nat.add_right_cancel (candidateDepth.symm.trans actualDepth)
  have firstClimb := back_climb _ _ endpoint ancestor other
  have secondClimb := back_climb _ _ endpoint origin actual
  rw [pathLengths] at firstClimb
  exact Option.some.inj (firstClimb.symm.trans secondClimb)


theorem family_exists (rows : List EdgeRow) (row : EdgeRow) (member : row ∈ rows)
    (endpoint origin : Cursor)
    (actual : RootResetInverseEdgeFragment.backResult row.address.reverse row.pattern endpoint = some origin) :
    ∃ ancestor, RootResetInverseEdgeSpine.familyResult rows endpoint = some ancestor := by
  induction rows with
  | nil => cases member
  | cons first rest ih =>
      cases head : RootResetInverseEdgeFragment.backResult first.address.reverse first.pattern endpoint with
      | some ancestor => exact ⟨ancestor, by rw [RootResetInverseEdgeSpine.familyResult, head]⟩
      | none =>
          rcases List.mem_cons.mp member with equal | later
          · subst first
            rw [actual] at head
            contradiction
          · obtain ⟨ancestor, selected⟩ := ih later
            exact ⟨ancestor, by rw [RootResetInverseEdgeSpine.familyResult, head]; exact selected⟩

theorem family_inverts (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (row : EdgeRow) (member : row ∈ RootResetCarrierNonemptyRows.rows program tree)
    (origin endpoint : Cursor) (matched : row.pattern.matchesBool origin.focus = true)
    (followed : RootResetEdgeFragment.follow row.address origin = some endpoint) :
    RootResetInverseEdgeSpine.familyResult (RootResetCarrierNonemptyRows.rows program tree) endpoint = some origin := by
  have actual := RootResetInverseEdgeFragment.backResult_complete row.address.reverse row.pattern origin endpoint
    (by simpa only [List.reverse_reverse] using followed) matched
  obtain ⟨ancestor, found⟩ := family_exists _ row member endpoint origin actual
  obtain ⟨candidate, candidateMember, other⟩ := RootResetInverseEdgeSpine.familyResult_sound _ endpoint ancestor found
  have equal := inverse_unique program tree row candidate member candidateMember origin ancestor endpoint actual other
  exact equal ▸ found

inductive Backs (rows : List EdgeRow) : Cursor → Cursor → Prop where
  | refl (origin : Cursor) : Backs rows origin origin
  | next (origin ancestor : Cursor) (found : RootResetInverseEdgeSpine.familyResult rows origin = some ancestor)
      {endpoint : Cursor} (rest : Backs rows ancestor endpoint) : Backs rows origin endpoint

theorem Backs.trans {rows : List EdgeRow} {first middle last : Cursor}
    (before : Backs rows first middle) (after : Backs rows middle last) : Backs rows first last := by
  induction before with
  | refl origin => exact after
  | next origin ancestor found rest ih => exact .next origin ancestor found (ih after)

theorem walks_backs (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    {origin endpoint : Cursor} (walk : RootResetEdgeSpine.Walks (RootResetCarrierNonemptyRows.rows program tree) origin endpoint) :
    Backs (RootResetCarrierNonemptyRows.rows program tree) endpoint origin := by
  induction walk with
  | done origin missed => exact .refl origin
  | next origin after row selected followed rest ih =>
      obtain ⟨member, matched⟩ := RootResetEdgeFragment.select_sound _ origin.focus row selected
      exact ih.trans (.next after origin (family_inverts program tree row member origin after matched followed) (.refl origin))

theorem Backs.stops_at {rows : List EdgeRow} {first boundary endpoint : Cursor}
    (path : Backs rows first boundary)
    (missed : RootResetInverseEdgeSpine.familyResult rows boundary = none)
    (walk : RootResetInverseEdgeSpine.Walks rows first endpoint) : endpoint = boundary := by
  induction path with
  | refl origin =>
      cases walk with
      | done origin _ => rfl
      | next origin ancestor found rest => rw [missed] at found; contradiction
  | next origin ancestor found rest ih =>
      cases walk with
      | done origin absent => rw [absent] at found; contradiction
      | next origin other otherFound tail =>
          have equal : other = ancestor := Option.some.inj (otherFound.symm.trans found)
          subst other
          exact ih missed tail

theorem returned_eq_origin (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    {origin descended returned : Cursor}
    (boundary : RootResetCarrierScanParentBoundary.carrierParent? origin.parents.head? = false)
    (down : RootResetEdgeSpine.Walks (RootResetCarrierNonemptyRows.rows program tree) origin descended)
    (up : RootResetInverseEdgeSpine.Walks (RootResetCarrierNonemptyRows.rows program tree) descended returned) :
    returned = origin :=
  (walks_backs program tree down).stops_at (RootResetCarrierInverseBoundary.boundary_misses program tree origin boundary) up

theorem all_input_restores (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (origin : Cursor) (boundary : RootResetCarrierScanParentBoundary.carrierParent? origin.parents.head? = false) :
    ∃ ticks descended, ticks ≤ RootResetCarrierNonemptyProbe.budget program tree origin ∧
      FiniteController.run (RootResetCarrierNonemptyProbe.machine program tree) ticks
        (RootResetCarrierNonemptyProbe.initial program tree origin) =
        ⟨some (.done (RootResetCarrierNonemptyAgreement.isLive? descended.focus)), origin⟩ ∧
      RootResetEdgeSpine.Walks (RootResetCarrierNonemptyRows.rows program tree) origin descended := by
  obtain ⟨ticks, descended, returned, bounded, execution, down, up, erased⟩ :=
    RootResetCarrierNonemptyProbe.all_input program tree origin
  have equal := returned_eq_origin program tree boundary down up
  subst returned
  exact ⟨ticks, descended, bounded, execution, down⟩

theorem fresh_admission_restores
    {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {bits decoded : List Bool} {continuation source : Term}
    {view : CheckpointDecoder.LocalView program}
    (admissible : Carrier.Admissible continuation)
    (parsed : CheckpointDecoder.parseLocal? program tree source = some view)
    (fresh : view.status = .fresh)
    (path : CarrierDecoder.PathDecodes program tree bits continuation view.accumulator decoded)
    (origin : Cursor) (atSource : origin.focus = source)
    (boundary : RootResetCarrierScanParentBoundary.carrierParent? origin.parents.head? = false) :
    ∃ ticks, ticks ≤ RootResetCarrierNonemptyProbe.budget program tree origin ∧
      FiniteController.run (RootResetCarrierNonemptyProbe.machine program tree) ticks
        (RootResetCarrierNonemptyProbe.initial program tree origin) =
        ⟨some (.done ((RootResetPersistentRouteA.parseFreshNonempty? program tree source).isSome)), origin⟩ := by
  obtain ⟨ticks, descended, bounded, execution, down⟩ := all_input_restores program tree origin boundary
  have values := RootResetCarrierNonemptyAgreement.ReadValue.local parsed
    (RootResetCarrierNonemptyAgreement.ReadValue.path admissible path)
  have answer := values.walks down atSource
  have carrier := CheckpointRun.pathDecodes_to_termOnly admissible path
  have admission := RootResetCarrierImmediateLive.carrierHasLive?_fresh_admission parsed fresh carrier
  rw [RootResetCarrierImmediateLive.carrierHasLive?_decode carrier] at admission
  rw [answer, admission] at execution
  exact ⟨ticks, bounded, execution⟩

end PureSFormal.Research.RootResetCarrierInverseUnique

