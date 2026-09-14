import PureSFormal.Research.RootResetCarrierInverseUnique
import PureSFormal.Research.RootResetFrameCarrierGuard

namespace PureSFormal.Research.RootResetNestedFramePatterns
open PureSFormal.PureS
open RootResetCarrierEdgePatterns
open RootResetCompletedLocalPatterns

def pendingPattern : Pattern := .app (.app (.app .s .hole) .hole) .hole
def pendingRow : EdgeRow := ⟨pendingPattern, [.right]⟩
def pendingRows : List EdgeRow := [pendingRow]

def firstPattern : Pattern :=
  .app (.app (.app (.app .s (.app (.app .s (literal haltCode)) .hole)) .hole) .hole) .hole

def secondPattern : Pattern :=
  .app (.app (.app (.app (.app .s (literal haltCode)) .hole) .hole) .hole) .hole

def firstRow : EdgeRow := ⟨firstPattern, [.left]⟩
def secondRow : EdgeRow := ⟨secondPattern, [.left, .left]⟩
def headRows : List EdgeRow := [firstRow, secondRow]

theorem pending_valid : RootResetEdgeFragment.Valid pendingRows := by
  intro row member
  have equal := List.mem_singleton.mp member
  subst row
  exact ⟨(by intro h; cases h), RootResetCarrierNonemptyRows.supports_subterm _ _ rfl⟩

theorem heads_valid : RootResetEdgeFragment.Valid headRows := by
  intro row member
  rcases List.mem_cons.mp member with first | second
  · subst row
    exact ⟨(by intro h; cases h), RootResetCarrierNonemptyRows.supports_subterm _ _ rfl⟩
  · have equal := List.mem_singleton.mp second
    subst row
    exact ⟨(by intro h; cases h), RootResetCarrierNonemptyRows.supports_subterm _ _ rfl⟩

theorem first_matches (actions : Term) (bits : List Bool) (continuation carrier : Term) :
    firstPattern.matchesBool (SchedulerResponseInvariant.frameFirstRoot actions bits continuation carrier) = true := by
  simp only [firstPattern, SchedulerResponseInvariant.frameFirstRoot, dispatcherCode, actCode,
    Pattern.matchesBool, literal_self, Bool.true_and, Bool.and_true]

theorem second_matches (actions : Term) (bits : List Bool) (continuation carrier : Term) :
    secondPattern.matchesBool (SchedulerResponseInvariant.frameSecondRoot actions bits continuation carrier) = true := by
  simp only [secondPattern, SchedulerResponseInvariant.frameSecondRoot, actCode,
    Pattern.matchesBool, literal_self, Bool.true_and, Bool.and_true]

theorem pending_matches (field continuation body : Term) :
    pendingPattern.matchesBool (frame (.app .s field) continuation body) = true := rfl

theorem first_reaches_redex (source : Term) (matched : firstPattern.matchesBool source = true) :
    ∃ x y z tail, source = .app (Term.redex x y z) tail := by
  obtain ⟨a, tail, sourceEq, am, _⟩ := app_matches matched
  obtain ⟨b, z, aEq, bm, _⟩ := app_matches am
  obtain ⟨c, y, bEq, cm, _⟩ := app_matches bm
  obtain ⟨head, x, cEq, sm, _⟩ := app_matches cm
  have equal : head = .s := (Pattern.matches_s_iff head).mp (Pattern.matchesBool_sound sm)
  exact ⟨x, y, z, tail, by rw [sourceEq, aEq, bEq, cEq, equal]; rfl⟩

theorem second_reaches_redex (source : Term) (matched : secondPattern.matchesBool source = true) :
    ∃ x y z firstTail lastTail, source = .app (.app (Term.redex x y z) firstTail) lastTail := by
  obtain ⟨a, lastTail, sourceEq, am, _⟩ := app_matches matched
  obtain ⟨b, firstTail, aEq, bm, _⟩ := app_matches am
  obtain ⟨c, z, bEq, cm, _⟩ := app_matches bm
  obtain ⟨d, y, cEq, dm, _⟩ := app_matches cm
  obtain ⟨head, x, dEq, sm, _⟩ := app_matches dm
  have equal : head = .s := (Pattern.matches_s_iff head).mp (Pattern.matchesBool_sound sm)
  exact ⟨x, y, z, firstTail, lastTail, by rw [sourceEq, aEq, bEq, cEq, dEq, equal]; rfl⟩

theorem selected_redex (source endpoint : Cursor) (row : EdgeRow)
    (selected : RootResetEdgeFragment.select headRows source.focus = some row)
    (followed : RootResetEdgeFragment.follow row.address source = some endpoint) : endpoint.rdx?.isSome = true := by
  obtain ⟨member, matched⟩ := RootResetEdgeFragment.select_sound headRows source.focus row selected
  rcases List.mem_cons.mp member with first | second
  · subst row
    obtain ⟨x, y, z, tail, shape⟩ := first_reaches_redex source.focus matched
    rcases source with ⟨focus, parents⟩
    change focus = _ at shape
    subst focus
    have equal : ⟨Term.redex x y z, ParentFrame.left tail :: parents⟩ = endpoint := Option.some.inj followed
    subst endpoint
    rfl
  · have equal := List.mem_singleton.mp second
    subst row
    obtain ⟨x, y, z, firstTail, lastTail, shape⟩ := second_reaches_redex source.focus matched
    rcases source with ⟨focus, parents⟩
    change focus = _ at shape
    subst focus
    have equal : ⟨Term.redex x y z, ParentFrame.left firstTail :: ParentFrame.left lastTail :: parents⟩ = endpoint := Option.some.inj followed
    subst endpoint
    rfl

def rightParent? (cursor : Cursor) : Bool :=
  match cursor.parents with
  | .right _ :: _ => true
  | _ => false

theorem inverse_boundary (origin : Cursor) (boundary : rightParent? origin = false) :
    RootResetInverseEdgeSpine.familyResult pendingRows origin = none := by
  rcases origin with ⟨focus, parents⟩
  cases parents with
  | nil => rfl
  | cons frame rest => cases frame with
    | left sibling => rfl
    | right sibling => cases boundary

theorem inverse_edge (origin after : Cursor) (row : EdgeRow)
    (selected : RootResetEdgeFragment.select pendingRows origin.focus = some row)
    (followed : RootResetEdgeFragment.follow row.address origin = some after) :
    RootResetInverseEdgeSpine.familyResult pendingRows after = some origin := by
  obtain ⟨member, matched⟩ := RootResetEdgeFragment.select_sound pendingRows origin.focus row selected
  have equal := List.mem_singleton.mp member
  subst row
  have back := RootResetInverseEdgeFragment.backResult_complete pendingRow.address.reverse pendingRow.pattern origin after
    (by simpa only [List.reverse_reverse] using followed) matched
  change (match RootResetInverseEdgeFragment.backResult pendingRow.address.reverse pendingRow.pattern after with
    | some ancestor => some ancestor
    | none => none) = some origin
  rw [back]


theorem literal_bool (wanted source : Term) : (literal wanted).matchesBool source = decide (source = wanted) := by
  by_cases equal : source = wanted
  · subst source
    simp only [literal_self, decide_true]
  · have miss : (literal wanted).matchesBool source = false := by
      cases matched : (literal wanted).matchesBool source with
      | false => rfl
      | true => exact False.elim (equal ((literal_matches _ _).mp matched))
    simp only [miss, equal, decide_false]

theorem frame_guard_eq (source : Term) :
    (firstPattern.matchesBool source || secondPattern.matchesBool source) = RootResetFrameCarrierGuard.frameHeadGuard source := by
  cases source with
  | s => rfl
  | app a x4 =>
      cases a with
      | s => rfl
      | app b x3 =>
          cases b with
          | s => rfl
          | app c x2 =>
              cases c with
              | s => rfl
              | app d x1 =>
                  cases d with
                  | s =>
                      cases x1 with
                      | s => rfl
                      | app z actions =>
                          cases z with
                          | s => rfl
                          | app head halt =>
                              cases head with
                              | s => simp only [firstPattern, secondPattern, RootResetFrameCarrierGuard.frameHeadGuard,
                                  Pattern.matchesBool, literal_bool, Bool.true_and, Bool.and_true, Bool.or_false]
                              | app e f => rfl
                  | app e leading =>
                      cases e with
                      | s => simp only [firstPattern, secondPattern, RootResetFrameCarrierGuard.frameHeadGuard,
                          Pattern.matchesBool, literal_bool, Bool.true_and, Bool.and_true, Bool.false_or, Bool.false_and]
                      | app f g => rfl

end PureSFormal.Research.RootResetNestedFramePatterns

