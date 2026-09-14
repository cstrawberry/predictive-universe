import PureSFormal.Research.RootResetCarrierInverseUnique
import PureSFormal.Research.RootResetClockGrowthWalker

/-! Finite local patterns for clock-core wrappers and saturated endpoints. -/
namespace PureSFormal.Research.RootResetNestedClockPatterns
open PureSFormal.PureS
open RootResetCarrierEdgePatterns RootResetCompletedLocalPatterns

def pendingPattern : Pattern := .app (.app .s .hole) .hole
def pendingRow : EdgeRow := ⟨pendingPattern, [.right]⟩
def pendingRows : List EdgeRow := [pendingRow]
def headPattern : Pattern := .app (.app (.app .s .hole) .hole) .hole
def headRow : EdgeRow := ⟨headPattern, []⟩
def headRows : List EdgeRow := [headRow]

theorem pending_valid : RootResetEdgeFragment.Valid pendingRows := by
  intro row member
  have equal := List.mem_singleton.mp member
  subst row
  exact ⟨(by intro h; cases h), RootResetCarrierNonemptyRows.supports_subterm _ _ rfl⟩

theorem heads_subterm (row : EdgeRow) (member : row ∈ headRows)
    (source : Term) (matched : row.pattern.matchesBool source = true) :
    ∃ target, source.subterm? row.address = some target := by
  have equal := List.mem_singleton.mp member
  subst row
  exact ⟨source, by cases source <;> rfl⟩

theorem pending_matches (field body : Term) :
    pendingPattern.matchesBool (.app (.app .s field) body) = true := rfl

theorem head_matches (x y z : Term) : headPattern.matchesBool (Term.redex x y z) = true := rfl

theorem head_reaches_redex (source : Term) (matched : headPattern.matchesBool source = true) :
    ∃ x y z, source = Term.redex x y z := by
  obtain ⟨a, z, sourceEq, am, _⟩ := app_matches matched
  obtain ⟨b, y, aEq, bm, _⟩ := app_matches am
  obtain ⟨head, x, bEq, sm, _⟩ := app_matches bm
  have equal : head = .s := (Pattern.matches_s_iff head).mp (Pattern.matchesBool_sound sm)
  exact ⟨x, y, z, by rw [sourceEq, aEq, bEq, equal]; rfl⟩

theorem selected_redex (source endpoint : Cursor) (row : EdgeRow)
    (selected : RootResetEdgeFragment.select headRows source.focus = some row)
    (followed : RootResetEdgeFragment.follow row.address source = some endpoint) : endpoint.rdx?.isSome = true := by
  obtain ⟨member, matched⟩ := RootResetEdgeFragment.select_sound headRows source.focus row selected
  have equal := List.mem_singleton.mp member
  subst row
  have same : source = endpoint := Option.some.inj followed
  subst endpoint
  obtain ⟨x, y, z, shape⟩ := head_reaches_redex source.focus matched
  rcases source with ⟨focus, parents⟩
  change focus = _ at shape
  subst focus
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

end PureSFormal.Research.RootResetNestedClockPatterns
