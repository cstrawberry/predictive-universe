import PureSFormal.Research.RootResetDeletionGadget

/-!
# Independent-hole progress-cell roles

This module generalizes the two diagonal endpoints of
`RootResetDeletionGadget` to the role-indexed Open and Closed forms used by
the delayed-close root-reset research protocol.  The parsers recover the
predecessor and audit fields independently.  They never compare one hole with
another.

The results remain local: no declaration here supplies the all-stage
root-reset walker, its reachable residual grammar, or its move bound.
-/

namespace PureSFormal.Research.RootResetProgressRoles

open PureSFormal.PureS

namespace Gadget

abbrev progressLive := RootResetDeletionGadget.progressLive
abbrev source := RootResetDeletionGadget.source

end Gadget

/-- `Open_i(X; H) = S X (L_i H)`, with independent predecessor and audit. -/
def openCell (bit : Bool) (predecessor audit : Term) : Term :=
  .app (.app .s predecessor) (.app (live bit) audit)

/-- `Closed_i(X; H₁, H₂) = S X (S H₁ (v_i H₂))`. -/
def closedCell (bit : Bool) (predecessor leftAudit rightAudit : Term) : Term :=
  .app (.app .s predecessor)
    (.app (.app .s leftAudit) (.app (valueTag bit) rightAudit))

@[simp]
theorem openCell_diagonal (bit : Bool) (predecessor : Term) :
    openCell bit predecessor predecessor =
      RootResetDeletionGadget.fresh bit predecessor :=
  rfl

@[simp]
theorem closedCell_diagonal (bit : Bool) (predecessor : Term) :
    closedCell bit predecessor predecessor predecessor =
      RootResetDeletionGadget.stable bit predecessor :=
  rfl

/-- The armed source opens with a diagonal audit in one root contraction. -/
@[simp]
theorem contractAt?_source_root (bit : Bool) (predecessor : Term) :
    (Gadget.source bit predecessor).contractAt? [] =
      some (openCell bit predecessor predecessor) :=
  rfl

/-- The registered right child of an Open cell is the live-cell redex. -/
@[simp]
theorem openCell_right_subterm
    (bit : Bool) (predecessor audit : Term) :
    (openCell bit predecessor audit).subterm? [.right] =
      some (.app (live bit) audit) :=
  rfl

/-- Closing duplicates only the Open cell's audit argument. -/
@[simp]
theorem contractAt?_openCell_right
    (bit : Bool) (predecessor audit : Term) :
    (openCell bit predecessor audit).contractAt? [.right] =
      some (closedCell bit predecessor audit audit) :=
  rfl

/-- The opening mutation is one contextual pure-S contraction. -/
theorem source_step_openCell (bit : Bool) (predecessor : Term) :
    Step (Gadget.source bit predecessor)
      (openCell bit predecessor predecessor) :=
  Term.contractAt?_sound (contractAt?_source_root bit predecessor)

/-- The closing mutation is one contextual pure-S contraction. -/
theorem openCell_step_closedCell
    (bit : Bool) (predecessor audit : Term) :
    Step (openCell bit predecessor audit)
      (closedCell bit predecessor audit audit) :=
  Term.contractAt?_sound
    (contractAt?_openCell_right bit predecessor audit)

/-- Data recovered from an Open role without comparing its holes. -/
structure OpenView where
  bit : Bool
  predecessor : Term
  audit : Term
  deriving BEq, DecidableEq, Repr

/-- Data recovered from a Closed role without comparing its holes. -/
structure ClosedView where
  bit : Bool
  predecessor : Term
  leftAudit : Term
  rightAudit : Term
  deriving BEq, DecidableEq, Repr

def OpenView.term (view : OpenView) : Term :=
  openCell view.bit view.predecessor view.audit

def ClosedView.term (view : ClosedView) : Term :=
  closedCell view.bit view.predecessor view.leftAudit view.rightAudit

/-- Parse an Open role and retain its two holes independently. -/
def parseOpen? : Term → Option OpenView
  | .app (.app .s predecessor) (.app constructor audit) =>
      (RootResetDeletionGadget.parseLiveConstructor? constructor).map
        (fun bit => ⟨bit, predecessor, audit⟩)
  | _ => none

/-- Parse a Closed role and retain its three holes independently. -/
def parseClosed? : Term → Option ClosedView
  | .app (.app .s predecessor)
      (.app (.app .s leftAudit) (.app tag rightAudit)) =>
      (RootResetDeletionGadget.parseValueTag? tag).map
        (fun bit => ⟨bit, predecessor, leftAudit, rightAudit⟩)
  | _ => none

@[simp]
theorem parseOpen?_openCell
    (bit : Bool) (predecessor audit : Term) :
    parseOpen? (openCell bit predecessor audit) =
      some ⟨bit, predecessor, audit⟩ := by
  simp [parseOpen?, openCell]

@[simp]
theorem parseClosed?_closedCell
    (bit : Bool) (predecessor leftAudit rightAudit : Term) :
    parseClosed? (closedCell bit predecessor leftAudit rightAudit) =
      some ⟨bit, predecessor, leftAudit, rightAudit⟩ := by
  simp [parseClosed?, closedCell]

/-- Every successful Open parse reconstructs the exact accepted role. -/
theorem parseOpen?_sound {term : Term} {view : OpenView}
    (h : parseOpen? term = some view) : term = view.term := by
  cases term with
  | s => simp [parseOpen?] at h
  | app fn right =>
      cases fn with
      | s => simp [parseOpen?] at h
      | app head predecessor =>
          cases head with
          | app _ _ => simp [parseOpen?] at h
          | s =>
              cases right with
              | s => simp [parseOpen?] at h
              | app constructor audit =>
                  simp only [parseOpen?] at h
                  generalize hp :
                    RootResetDeletionGadget.parseLiveConstructor? constructor =
                      parsed at h
                  cases parsed with
                  | none => simp at h
                  | some bit =>
                      cases h
                      have hc :=
                        RootResetDeletionGadget.parseLiveConstructor?_sound hp
                      simp [OpenView.term, openCell, hc]

/-- Every successful Closed parse reconstructs the exact accepted role. -/
theorem parseClosed?_sound {term : Term} {view : ClosedView}
    (h : parseClosed? term = some view) : term = view.term := by
  cases term with
  | s => simp [parseClosed?] at h
  | app fn right =>
      cases fn with
      | s => simp [parseClosed?] at h
      | app head predecessor =>
          cases head with
          | app _ _ => simp [parseClosed?] at h
          | s =>
              cases right with
              | s => simp [parseClosed?] at h
              | app rightFn rightArg =>
                  cases rightFn with
                  | s => simp [parseClosed?] at h
                  | app rightHead leftAudit =>
                      cases rightHead with
                      | app _ _ => simp [parseClosed?] at h
                      | s =>
                          cases rightArg with
                          | s => simp [parseClosed?] at h
                          | app tag rightAudit =>
                              simp only [parseClosed?] at h
                              generalize hp :
                                RootResetDeletionGadget.parseValueTag? tag =
                                  parsed at h
                              cases parsed with
                              | none => simp at h
                              | some bit =>
                                  cases h
                                  have ht :=
                                    RootResetDeletionGadget.parseValueTag?_sound hp
                                  simp [ClosedView.term, closedCell, ht]

/-- The Open role's outer head arity is always two. -/
@[simp]
theorem headArity_openCell
    (bit : Bool) (predecessor audit : Term) :
    (openCell bit predecessor audit).headArity = 2 :=
  rfl

/-- The Closed role's outer head arity is always two. -/
@[simp]
theorem headArity_closedCell
    (bit : Bool) (predecessor leftAudit rightAudit : Term) :
    (closedCell bit predecessor leftAudit rightAudit).headArity = 2 :=
  rfl

/-- Open right fields have arity three. -/
@[simp]
theorem openCell_right_headArity
    (bit : Bool) (predecessor audit : Term) :
    (match openCell bit predecessor audit with
      | .app _ right => right.headArity
      | .s => 0) = 3 :=
  rfl

/-- Closed right fields have arity two. -/
@[simp]
theorem closedCell_right_headArity
    (bit : Bool) (predecessor leftAudit rightAudit : Term) :
    (match closedCell bit predecessor leftAudit rightAudit with
      | .app _ right => right.headArity
      | .s => 0) = 2 :=
  rfl

/-- Open and Closed roles are disjoint without inspecting their holes. -/
theorem openCell_ne_closedCell
    (openBit closedBit : Bool)
    (openPredecessor openAudit closedPredecessor leftAudit rightAudit : Term) :
    openCell openBit openPredecessor openAudit ≠
      closedCell closedBit closedPredecessor leftAudit rightAudit := by
  intro h
  have hright := congrArg
    (fun term => match term with
      | .app _ right => right.headArity
      | .s => 0) h
  simp only [openCell_right_headArity, closedCell_right_headArity] at hright
  cases hright

end PureSFormal.Research.RootResetProgressRoles
