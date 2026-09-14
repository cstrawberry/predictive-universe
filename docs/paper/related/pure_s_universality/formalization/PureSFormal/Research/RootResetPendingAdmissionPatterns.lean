import PureSFormal.Research.RootResetCompletedLocalPatterns
import PureSFormal.Research.RootResetNestedFramePatterns
import PureSFormal.Research.RootResetPendingAdmissionFuelPatterns

/-! Fixed structural admission rows for pending children. The covered child
families are another pending shell, fresh response shells, completed Local,
canonical fuel prefixes, and the two FRAME heads. Fresh-shell admission enters only the pending R edge;
the separate fresh Local continuation probe retains its nonempty guard.
Seed payloads are independent holes; exact all-syntax registry equivalence is
not asserted. Generated carrier/front provenance remains part of assembly. -/
namespace PureSFormal.Research.RootResetPendingAdmissionPatterns
open PureSFormal.PureS
open RootResetCompletedLocalPatterns RootResetCarrierEdgePatterns

def environmentPattern (actions : Term) : Pattern :=
  .app .s (.app (.app .s (literal (actCode actions))) (.app .s .hole))

def pendingPattern (actions : Term) (child : Pattern) : Pattern :=
  .app (.app (environmentPattern actions) .hole) child

theorem environment_matches (actions payload : Term) :
    (environmentPattern actions).matchesBool (CheckpointDecoder.openEnvironment actions payload) = true := by
  simp only [environmentPattern, CheckpointDecoder.openEnvironment, Pattern.matchesBool,
    literal_self, Bool.true_and, Bool.and_true]

theorem environment_sound (actions source : Term)
    (matched : (environmentPattern actions).matchesBool source = true) :
    ∃ payload, source = CheckpointDecoder.openEnvironment actions payload := by
  obtain ⟨head, dispatch, sourceEq, hm, dm⟩ := app_matches matched
  obtain ⟨fn, seed, dispatchEq, fm, sm⟩ := app_matches dm
  obtain ⟨middle, action, fnEq, mm, am⟩ := app_matches fm
  obtain ⟨last, payload, seedEq, lm, _⟩ := app_matches sm
  have headEq : head = .s := (Pattern.matches_s_iff head).mp (Pattern.matchesBool_sound hm)
  have middleEq : middle = .s := (Pattern.matches_s_iff middle).mp (Pattern.matchesBool_sound mm)
  have lastEq : last = .s := (Pattern.matches_s_iff last).mp (Pattern.matchesBool_sound lm)
  have actionEq := (literal_matches (actCode actions) action).mp am
  exact ⟨payload, by rw [sourceEq, dispatchEq, fnEq, seedEq, headEq, middleEq, lastEq, actionEq]; rfl⟩

theorem pending_matches (actions payload continuation child : Term) (pattern : Pattern)
    (matched : pattern.matchesBool child = true) :
    (pendingPattern actions pattern).matchesBool
      (.app (.app (CheckpointDecoder.openEnvironment actions payload) continuation) child) = true := by
  simp only [pendingPattern, Pattern.matchesBool, environment_matches, Bool.and_true,
    Bool.true_and, matched]

theorem pending_sound (actions source : Term) (pattern : Pattern)
    (matched : (pendingPattern actions pattern).matchesBool source = true) :
    ∃ payload continuation child,
      source = .app (.app (CheckpointDecoder.openEnvironment actions payload) continuation) child ∧
      pattern.matchesBool child = true := by
  obtain ⟨fn, child, sourceEq, fm, cm⟩ := app_matches matched
  obtain ⟨environment, continuation, fnEq, em, _⟩ := app_matches fm
  obtain ⟨payload, envEq⟩ := environment_sound actions environment em
  exact ⟨payload, continuation, child, by rw [sourceEq, fnEq, envEq], cm⟩

def childPatterns (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : List Pattern :=
  [pendingPattern (compileActions program tree) .hole,
    localPattern .fresh .hole, RootResetNestedFramePatterns.firstPattern,
    RootResetNestedFramePatterns.secondPattern] ++
    RootResetPendingAdmissionFuelPatterns.patterns (environmentPattern (compileActions program tree)) ++
    localPatterns .marked program tree ++ localPatterns .fresh program tree

def rows (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) : List EdgeRow :=
  (childPatterns program tree).map fun child =>
    ⟨pendingPattern (compileActions program tree) child, [.right]⟩

def childAdmitted (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) (child : Term) : Bool :=
  (childPatterns program tree).any (fun pattern => pattern.matchesBool child)

theorem rows_valid (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program)) :
    RootResetEdgeFragment.Valid (rows program tree) := by
  intro row member
  obtain ⟨pattern, _, equal⟩ := map_member_inverse _ _ _ member
  subst row
  refine ⟨(by intro h; cases h), ?_⟩
  intro source matched
  obtain ⟨payload, continuation, child, shape, _⟩ := pending_sound _ _ _ matched
  exact ⟨child, by rw [shape]; cases child <;> rfl⟩

theorem selected_sound (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (source : Term) (row : EdgeRow)
    (selected : RootResetEdgeFragment.select (rows program tree) source = some row) :
    ∃ payload continuation child,
      source = .app (.app (CheckpointDecoder.openEnvironment (compileActions program tree) payload) continuation) child ∧
      row.address = [.right] ∧ childAdmitted program tree child = true := by
  obtain ⟨member, matched⟩ := RootResetEdgeFragment.select_sound _ _ _ selected
  obtain ⟨pattern, patternMember, equal⟩ := map_member_inverse _ _ _ member
  subst row
  obtain ⟨payload, continuation, child, shape, matched⟩ := pending_sound _ _ _ matched
  exact ⟨payload, continuation, child, shape, rfl, any_of_member _ _ _ patternMember matched⟩

theorem select_of_child (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (payload continuation child : Term) (admitted : childAdmitted program tree child = true) :
    ∃ row, RootResetEdgeFragment.select (rows program tree)
      (.app (.app (CheckpointDecoder.openEnvironment (compileActions program tree) payload) continuation) child) = some row := by
  obtain ⟨pattern, member, matched⟩ := member_of_any _ _ admitted
  have rowMember := map_member (fun pattern =>
    (⟨pendingPattern (compileActions program tree) pattern, [.right]⟩ : EdgeRow)) member
  have rowMatched := pending_matches (compileActions program tree) payload continuation child pattern matched
  have exists_of_member : ∀ (items : List EdgeRow) (row : EdgeRow), row ∈ items →
      row.pattern.matchesBool (.app (.app (CheckpointDecoder.openEnvironment (compileActions program tree) payload) continuation) child) = true →
      ∃ found, RootResetEdgeFragment.select items
        (.app (.app (CheckpointDecoder.openEnvironment (compileActions program tree) payload) continuation) child) = some found := by
    intro items
    induction items with
    | nil => intro row member; cases member
    | cons first rest ih =>
        intro row member matched
        cases firstMatch : first.pattern.matchesBool
            (.app (.app (CheckpointDecoder.openEnvironment (compileActions program tree) payload) continuation) child) with
        | true => exact ⟨first, by simp only [RootResetEdgeFragment.select, firstMatch, ↓reduceIte]⟩
        | false =>
            rcases List.mem_cons.mp member with equal | later
            · subst row; rw [firstMatch] at matched; cases matched
            · obtain ⟨found, foundEq⟩ := ih row later matched
              exact ⟨found, by simp only [RootResetEdgeFragment.select, firstMatch, Bool.false_eq_true, ↓reduceIte, foundEq]⟩
  exact exists_of_member _ _ rowMember rowMatched

theorem childAdmitted_pending (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (payload continuation child : Term) :
    childAdmitted program tree
      (.app (.app (CheckpointDecoder.openEnvironment (compileActions program tree) payload) continuation) child) = true := by
  apply any_of_member _ _ (pendingPattern (compileActions program tree) .hole)
  · exact List.mem_append.mpr (Or.inl (List.mem_append.mpr (Or.inl
      (List.mem_append.mpr (Or.inl (List.Mem.head _))))))
  · exact pending_matches _ _ _ _ _ rfl

theorem childAdmitted_local {program : CTS.Program} {tree : Dispatcher.Tree (ActionLabel program)}
    {source : Term} {view : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program tree source = some view) :
    childAdmitted program tree source = true := by
  obtain ⟨pattern, member, matched⟩ := local_matches (CheckpointDecoder.parseLocal?_sound parsed)
  apply any_of_member _ _ pattern _ matched
  cases status : view.status with
  | marked =>
      rw [status] at member
      exact List.mem_append.mpr (Or.inl (List.mem_append.mpr (Or.inr member)))
  | fresh =>
      rw [status] at member
      exact List.mem_append.mpr (Or.inr member)

theorem childAdmitted_freshShell (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (haltAudit dispatcher seedPayload seedAudit continuation continuationAudit : Term) :
    childAdmitted program tree (CheckpointDecoder.openShell (freshHField haltAudit)
      dispatcher seedPayload seedAudit continuation continuationAudit) = true := by
  apply any_of_member _ _ (localPattern .fresh .hole)
  · exact List.mem_append.mpr (Or.inl (List.mem_append.mpr (Or.inl
      (List.mem_append.mpr (Or.inl (List.Mem.tail _ (List.Mem.head _)))))))
  · simp only [localPattern, haltPattern, CheckpointDecoder.openShell, freshHField,
      Pattern.matchesBool, literal_self, Bool.true_and, Bool.and_true]

theorem childAdmitted_canonicalFuel (program : CTS.Program) (tree : Dispatcher.Tree (ActionLabel program))
    (row : RootResetClockFuelStages.FuelRow)
    (canonical : RootResetClockFuelCanonicalGrammar.CanonicalFuelRow (compileActions program tree) row) :
    childAdmitted program tree row.term = true := by
  obtain ⟨pattern, member, matched⟩ := RootResetPendingAdmissionFuelPatterns.canonical_matches
    (compileActions program tree) (environmentPattern (compileActions program tree))
    (environment_matches (compileActions program tree)) row canonical
  apply any_of_member _ _ pattern _ matched
  exact List.mem_append.mpr (Or.inl (List.mem_append.mpr (Or.inl (List.mem_append.mpr (Or.inr member)))))

theorem admitted_parent_boundary (actions payload continuation : Term) :
    RootResetCarrierScanParentBoundary.carrierParent?
      (some (.right (.app (CheckpointDecoder.openEnvironment actions payload) continuation))) = false := by
  simp [RootResetCarrierScanParentBoundary.carrierParent?, RootResetCarrierScanParentBoundary.carrierFunction?,
    CheckpointDecoder.openEnvironment, actCode, haltCode, haltTag, p, live, b, valueTag, v0, v1]

end PureSFormal.Research.RootResetPendingAdmissionPatterns
