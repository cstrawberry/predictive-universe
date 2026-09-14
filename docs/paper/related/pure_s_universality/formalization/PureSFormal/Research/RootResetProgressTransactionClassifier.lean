import PureSFormal.Research.RootResetFullProgressPath
import PureSFormal.Research.RootResetProgressResponse

/-!
# Term-only progress transaction classifier

This module separates the two uses of the progress token.

* At a registered carrier, a clean nonempty queue selects only its front
  Armed cell.  A carrier already containing one Open cell is reported as an
  `openCarrier`; it is not closed before the frame, dispatcher, and action
  have run.
* At a completed fresh Local, only the selected action accumulator is
  inspected.  Its unique Open cell selects CLOSE.  A clean accumulator
  selects the Local's visible COMMIT field.  Multiple canonical Opens are
  rejected.

Every mutation result is obtained by running `contractAt?` at the recovered
root-relative address.  Consequently a successful selection contains its
exact target and proves one genuine contextual pure-S step.  The registered
path parsers never enter audit or history fields.
-/

namespace PureSFormal.Research.RootResetProgressTransactionClassifier

open PureSFormal.PureS

namespace FullPath

abbrev View := RootResetFullProgressPath.View
abbrev Decodes := RootResetFullProgressPath.Decodes
abbrev parse? := RootResetFullProgressPath.parse?

end FullPath

namespace Local

abbrev View := RootResetProgressLocalParser.View
abbrev Shape := RootResetProgressLocalParser.Shape
abbrev parse? := RootResetProgressLocalParser.parse?
abbrev accumulatorAddress :=
  @RootResetProgressLocalParser.accumulatorAddress

end Local

/-! ## Checked mutation selections -/

/-- The only transaction mutations selected by this classifier. -/
inductive Stage where
  | openFront
  | close
  | commit
  deriving BEq, DecidableEq, Repr

/-- A term-resident mutation command, including the exact reduct produced at
its selected address. -/
structure Selection where
  stage : Stage
  address : Address
  target : Term
  deriving BEq, DecidableEq, Repr

/-- Issue a selection only after the literal address has been checked by the
ordinary pure-S contraction function. -/
def checkedSelection? (term : Term) (stage : Stage) (address : Address) :
    Option Selection :=
  match term.contractAt? address with
  | none => none
  | some target => some ⟨stage, address, target⟩

@[simp]
theorem checkedSelection?_of_contract
    {term target : Term} {stage : Stage} {address : Address}
    (h : term.contractAt? address = some target) :
    checkedSelection? term stage address =
      some ⟨stage, address, target⟩ := by
  simp [checkedSelection?, h]

/-- Every checked command is exactly the contraction stored in the command. -/
theorem checkedSelection?_sound
    {term : Term} {stage : Stage} {address : Address} {selection : Selection}
    (h : checkedSelection? term stage address = some selection) :
    term.contractAt? selection.address = some selection.target ∧
      Step term selection.target := by
  unfold checkedSelection? at h
  generalize hcontract : term.contractAt? address = result at h
  cases result with
  | none => contradiction
  | some target =>
      have selectionEq : Selection.mk stage address target = selection :=
        Option.some.inj h
      subst selection
      exact ⟨hcontract, Term.contractAt?_sound hcontract⟩

/-- A checked command retains the requested stage and address literally. -/
theorem checkedSelection?_fields
    {term : Term} {stage : Stage} {address : Address} {selection : Selection}
    (h : checkedSelection? term stage address = some selection) :
    selection.stage = stage ∧ selection.address = address := by
  unfold checkedSelection? at h
  generalize hcontract : term.contractAt? address = result at h
  cases result with
  | none => contradiction
  | some target =>
      have selectionEq : Selection.mk stage address target = selection :=
        Option.some.inj h
      subst selection
      exact ⟨rfl, rfl⟩

/-! ## Registered carrier classification -/

/-- A carrier transaction state.  `openCarrier` is deliberately not a
mutation command: its Open token must survive the later response work. -/
inductive CarrierStage where
  | cleanEmpty
  | cleanNonempty (selection : Selection)
  | openCarrier (address : Address)
  deriving BEq, DecidableEq, Repr

/-- Queue data and its current carrier transaction state. -/
structure CarrierView where
  bits : List Bool
  stage : CarrierStage
  deriving BEq, DecidableEq, Repr

/-- Classify one registered carrier directly from its bare syntax.

The empty and nonempty clean cases are separated by the decoded queue.  A
singleton Open-address list is exposed as `openCarrier`; two or more Opens
are rejected. -/
def classifyCarrierView? (term : Term) (view : FullPath.View) :
    Option CarrierView :=
  match view.openAddresses with
  | [] =>
      if view.bits = [] then
        some ⟨view.bits, .cleanEmpty⟩
      else
        match view.frontArmedAddress with
        | none => none
        | some address =>
            (checkedSelection? term .openFront address).map
              (fun selection => ⟨view.bits, .cleanNonempty selection⟩)
  | [address] => some ⟨view.bits, .openCarrier address⟩
  | _ => none

/-- Parse and classify one registered carrier. -/
def classifyCarrier?
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Option CarrierView := do
  let view ← FullPath.parse? program tree term
  classifyCarrierView? term view

/-- A clean-nonempty carrier result contains an exact Armed contraction and
one genuine pure-S step. -/
theorem classifyCarrierView?_cleanNonempty_checked
    {term : Term} {view : FullPath.View} {bits : List Bool}
    {selection : Selection}
    (h : classifyCarrierView? term view =
      some ⟨bits, .cleanNonempty selection⟩) :
    ∃ address,
      checkedSelection? term .openFront address = some selection := by
  rcases view with ⟨viewBits, openCount, front, openAddresses, endpoint, roles⟩
  cases openAddresses with
  | nil =>
      by_cases hempty : viewBits = []
      · simp [classifyCarrierView?, hempty] at h
      · cases hfront : front with
        | none => simp [classifyCarrierView?, hempty, hfront] at h
        | some address =>
            generalize hchecked : checkedSelection? term .openFront address =
              checked
            cases checked with
            | none => simp [classifyCarrierView?, hempty, hfront, hchecked] at h
            | some found =>
                have resultEq : CarrierView.mk viewBits (.cleanNonempty found) =
                    CarrierView.mk bits (.cleanNonempty selection) := by
                  simpa [classifyCarrierView?, hempty, hfront, hchecked] using h
                have foundEq : found = selection := by cases resultEq; rfl
                subst found
                exact ⟨address, hchecked⟩
  | cons first rest =>
      cases rest with
      | nil => simp [classifyCarrierView?] at h
      | cons second tail => simp [classifyCarrierView?] at h

theorem classifyCarrier?_cleanNonempty_sound
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {bits : List Bool} {selection : Selection}
    (h : classifyCarrier? program tree term =
      some ⟨bits, .cleanNonempty selection⟩) :
    selection.stage = .openFront ∧
      term.contractAt? selection.address = some selection.target ∧
      Step term selection.target := by
  generalize hpath : FullPath.parse? program tree term = parsed
  cases parsed with
  | none => simp [classifyCarrier?, hpath] at h
  | some view =>
      have classified : classifyCarrierView? term view =
          some ⟨bits, .cleanNonempty selection⟩ := by
        simpa [classifyCarrier?, hpath] using h
      obtain ⟨address, checked⟩ :=
        classifyCarrierView?_cleanNonempty_checked classified
      have fields := checkedSelection?_fields checked
      have sound := checkedSelection?_sound checked
      exact ⟨fields.1, sound⟩

/-- An open-carrier result denotes the unique canonical Open redex, but the
classifier issues no mutation command for it. -/
theorem classifyCarrier?_openCarrier_sound
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {bits : List Bool} {address : Address}
    (h : classifyCarrier? program tree term =
      some ⟨bits, .openCarrier address⟩) :
    ∃ target, term.contractAt? address = some target ∧ Step term target := by
  generalize hpath : FullPath.parse? program tree term = parsed
  cases parsed with
  | none => simp [classifyCarrier?, hpath] at h
  | some view =>
      have classified : classifyCarrierView? term view =
          some ⟨bits, .openCarrier address⟩ := by
        simpa [classifyCarrier?, hpath] using h
      unfold classifyCarrierView? at classified
      rcases view with
        ⟨viewBits, openCount, front, openAddresses, endpoint, roles⟩
      cases openAddresses with
      | nil =>
          by_cases hempty : viewBits = []
          · simp [classifyCarrierView?, hempty] at classified
          · cases hfront : front with
            | none =>
                simp [classifyCarrierView?, hempty, hfront] at classified
            | some frontAddress =>
                cases hchecked :
                    checkedSelection? term .openFront frontAddress with
                | none =>
                    simp [classifyCarrierView?, hempty, hfront, hchecked]
                      at classified
                | some selection =>
                    simp [classifyCarrierView?, hempty, hfront, hchecked]
                      at classified
      | cons first rest =>
          cases rest with
          | nil =>
              have resultEq : CarrierView.mk viewBits (.openCarrier first) =
                  CarrierView.mk bits (.openCarrier address) :=
                by simpa [classifyCarrierView?] using classified
              have firstEq : first = address := by cases resultEq; rfl
              subst first
              have shape := RootResetFullProgressPath.parse?_sound hpath
              have member : address ∈ [address] := by simp
              exact shape.openAddress_contracts_and_step member
          | cons second tail => simp [classifyCarrierView?] at classified

/-! ## Carrier completeness on the declarative registered path -/

/-- Every declarative clean empty carrier is classified as clean empty. -/
theorem classifyCarrier?_complete_cleanEmpty
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {front : Option Address} {openAddresses : List Address}
    {endpoint : Address} {roles : List RootResetFullProgressPath.Role}
    (shape : FullPath.Decodes program tree term [] 0 front openAddresses
      endpoint roles) :
    classifyCarrier? program tree term = some ⟨[], .cleanEmpty⟩ := by
  have lengthZero : openAddresses.length = 0 := by
    rw [← shape.openCount_eq_openAddresses_length]
  have openEq : openAddresses = [] := List.length_eq_zero_iff.mp lengthZero
  subst openAddresses
  simp [classifyCarrier?, classifyCarrierView?,
    RootResetFullProgressPath.parse?_complete shape]

/-- Every declarative clean nonempty carrier selects the exact front Armed
cell and stores its exact target. -/
theorem classifyCarrier?_complete_cleanNonempty
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {bits : List Bool} {front : Option Address}
    {openAddresses : List Address} {endpoint : Address}
    {roles : List RootResetFullProgressPath.Role}
    (shape : FullPath.Decodes program tree term bits 0 front openAddresses
      endpoint roles)
    (nonempty : bits ≠ []) :
    ∃ address target,
      front = some address ∧
      classifyCarrier? program tree term =
        some ⟨bits, .cleanNonempty ⟨.openFront, address, target⟩⟩ ∧
      term.contractAt? address = some target ∧ Step term target := by
  have lengthZero : openAddresses.length = 0 := by
    rw [← shape.openCount_eq_openAddresses_length]
  have openEq : openAddresses = [] := List.length_eq_zero_iff.mp lengthZero
  obtain ⟨address, frontEq⟩ :=
    shape.frontArmedAddress_exists_of_clean_nonempty rfl nonempty
  obtain ⟨target, contracts, step⟩ :=
    shape.frontArmedAddress_contracts_and_step frontEq
  refine ⟨address, target, frontEq, ?_, contracts, step⟩
  subst openAddresses
  unfold classifyCarrier? FullPath.parse?
  rw [RootResetFullProgressPath.parse?_complete shape]
  change classifyCarrierView? term
    ⟨bits, 0, front, [], endpoint, roles⟩ = _
  unfold classifyCarrierView?
  simp only [nonempty, ↓reduceIte]
  rw [frontEq]
  dsimp only
  rw [checkedSelection?_of_contract (stage := .openFront) contracts]
  rfl

/-- Every declarative one-Open carrier is exposed as `openCarrier`; no CLOSE
selection is issued at the carrier boundary. -/
theorem classifyCarrier?_complete_openCarrier
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {bits : List Bool} {front : Option Address}
    {openAddresses : List Address} {endpoint : Address}
    {roles : List RootResetFullProgressPath.Role}
    (shape : FullPath.Decodes program tree term bits 1 front openAddresses
      endpoint roles) :
    ∃ address,
      openAddresses = [address] ∧
      classifyCarrier? program tree term =
        some ⟨bits, .openCarrier address⟩ := by
  obtain ⟨address, openEq⟩ :=
    shape.openAddresses_eq_singleton_of_open rfl
  refine ⟨address, openEq, ?_⟩
  simp [classifyCarrier?, classifyCarrierView?,
    RootResetFullProgressPath.parse?_complete shape, openEq]

/-- Two or more canonical Opens are never accepted as a carrier state. -/
theorem classifyCarrier?_rejects_multipleOpens
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : FullPath.View}
    (parsed : FullPath.parse? program tree term = some view)
    {first second : Address} {rest : List Address}
    (multiple : view.openAddresses = first :: second :: rest) :
    classifyCarrier? program tree term = none := by
  rcases view with
    ⟨bits, openCount, front, openAddresses, endpoint, roles⟩
  simp only at multiple
  subst openAddresses
  simp [classifyCarrier?, parsed, classifyCarrierView?]

/-! ## Completed fresh-response selection -/

/-- Decide CLOSE versus COMMIT after both completed-boundary parsers have
succeeded. -/
def selectCompletedPath? (term : Term) (localView : Local.View program)
    (path : FullPath.View) : Option Selection :=
  match path.openAddresses with
  | [] => checkedSelection? term .commit
      RootResetProgressResponse.statusAddress
  | [address] => checkedSelection? term .close
      (Local.accumulatorAddress localView ++ address)
  | _ => none

/-- Any command returned after the accumulator scan is already checked. -/
theorem selectCompletedPath?_sound
    {term : Term} {localView : Local.View program} {path : FullPath.View}
    {selection : Selection}
    (h : selectCompletedPath? term localView path = some selection) :
    term.contractAt? selection.address = some selection.target ∧
      Step term selection.target := by
  rcases path with
    ⟨bits, openCount, front, openAddresses, endpoint, roles⟩
  cases openAddresses with
  | nil => exact checkedSelection?_sound h
  | cons first rest =>
      cases rest with
      | nil => exact checkedSelection?_sound h
      | cons second tail => simp [selectCompletedPath?] at h

/-- Select CLOSE or COMMIT only after recognizing a completed fresh Local.
The canonical scan begins at that Local's selected action accumulator. -/
def selectCompletedResponse?
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Option Selection := do
  let localView ← Local.parse? program tree term
  if localView.status != .fresh then
    none
  else
    let path ← FullPath.parse? program tree localView.accumulator
    selectCompletedPath? term localView path

/-- Every returned completed-response command is its exact contraction and a
genuine contextual pure-S step. -/
theorem selectCompletedResponse?_sound
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {selection : Selection}
    (h : selectCompletedResponse? program tree term = some selection) :
    term.contractAt? selection.address = some selection.target ∧
      Step term selection.target := by
  unfold selectCompletedResponse? at h
  generalize hlocal : Local.parse? program tree term = localResult
  cases localResult with
  | none => rw [hlocal] at h; contradiction
  | some localView =>
      rw [hlocal] at h
      change
          (if localView.status != .fresh then none else do
            let path ← FullPath.parse? program tree localView.accumulator
            selectCompletedPath? term localView path) = some selection at h
      split at h
      next => contradiction
      next =>
        generalize hpath : FullPath.parse? program tree localView.accumulator =
          pathResult
        cases pathResult with
        | none => rw [hpath] at h; contradiction
        | some path =>
            rw [hpath] at h
            exact selectCompletedPath?_sound h

/-- A completed path containing at least two canonical Opens is rejected. -/
theorem selectCompletedResponse?_rejects_multipleOpens
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {localView : Local.View program} {path : FullPath.View}
    (localParsed : Local.parse? program tree term = some localView)
    (pathParsed : FullPath.parse? program tree localView.accumulator =
      some path)
    {first second : Address} {rest : List Address}
    (multiple : path.openAddresses = first :: second :: rest) :
    selectCompletedResponse? program tree term = none := by
  rcases path with
    ⟨bits, openCount, front, openAddresses, endpoint, roles⟩
  simp only at multiple
  subst openAddresses
  unfold selectCompletedResponse?
  rw [localParsed]
  dsimp only [Bind.bind, Option.bind]
  split
  · rfl
  · rw [pathParsed]
    rfl

/-- A marked completed Local cannot be selected as the current response. -/
theorem selectCompletedResponse?_marked_none
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {localView : Local.View program}
    (localParsed : Local.parse? program tree term = some localView)
    (marked : localView.status = .marked) :
    selectCompletedResponse? program tree term = none := by
  have markedCheck : (localView.status != .fresh) = true := by
    rw [marked]
    rfl
  unfold selectCompletedResponse?
  rw [localParsed]
  dsimp only [Bind.bind, Option.bind]
  rw [markedCheck]
  rfl

/-! ## Exact CLOSE and COMMIT addresses -/

/-- A completed Local parsed as fresh exposes a saturated status redex at the
fixed COMMIT address. -/
theorem freshLocal_status_contracts
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {localView : Local.View program}
    (parsed : Local.parse? program tree term = some localView)
    (fresh : localView.status = .fresh) :
    ∃ target,
      term.contractAt? RootResetProgressResponse.statusAddress = some target := by
  rcases localView with
    ⟨status, route, label, accumulator, seedPayload, continuation⟩
  cases status with
  | marked => cases fresh
  | fresh =>
      have localShape := RootResetProgressLocalParser.parse?_sound parsed
      rcases localShape with
        ⟨haltField, dispatcher, response, seedAudit, continuationAudit,
          histories, haltShape, routeShape, actionShape, sourceEq⟩
      cases haltShape with
      | fresh audit =>
          have statusSubterm :
              term.subterm? RootResetProgressResponse.statusAddress =
                some (freshHField audit) := by
            rw [sourceEq]
            simp [RootResetProgressResponse.statusAddress,
              CheckpointDecoder.openShell, Term.subterm?]
          apply
            RootResetFullProgressPath.contractAt?_exists_of_subterm_contractRoot?
              statusSubterm
          rfl

/-- A unique Open inside the selected action accumulator yields the exact
root-relative CLOSE contraction. -/
theorem freshResponse_close_contracts
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {localView : Local.View program}
    {bits : List Bool} {front : Option Address}
    {openAddresses : List Address} {endpoint : Address}
    {roles : List RootResetFullProgressPath.Role}
    (parsed : Local.parse? program tree term = some localView)
    (shape : FullPath.Decodes program tree localView.accumulator bits 1 front
      openAddresses endpoint roles) :
    ∃ address target,
      openAddresses = [address] ∧
      term.contractAt? (Local.accumulatorAddress localView ++ address) =
        some target := by
  obtain ⟨address, openEq⟩ :=
    shape.openAddresses_eq_singleton_of_open rfl
  have member : address ∈ openAddresses := by simp [openEq]
  obtain ⟨bit, audit, innerSubterm⟩ := shape.openAddress_subterm member
  have accumulatorSubterm :=
    RootResetProgressLocalParser.parse?_accumulator_subterm parsed
  have selectedSubterm :
      term.subterm? (Local.accumulatorAddress localView ++ address) =
        some (.app (live bit) audit) :=
    RootResetFullProgressPath.subterm?_prefix accumulatorSubterm innerSubterm
  obtain ⟨target, contracts⟩ :=
    RootResetFullProgressPath.contractAt?_exists_of_subterm_contractRoot?
      selectedSubterm (by rfl)
  exact ⟨address, target, openEq, contracts⟩

/-! ## Completed-response completeness on declarative cases -/

/-- A declarative completed fresh response with one canonical Open selects
only CLOSE, at the unique Open in its selected accumulator. -/
theorem selectCompletedResponse?_complete_open
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {localView : Local.View program}
    {bits : List Bool} {front : Option Address}
    {openAddresses : List Address} {endpoint : Address}
    {roles : List RootResetFullProgressPath.Role}
    (localShape : Local.Shape program tree localView term)
    (fresh : localView.status = .fresh)
    (pathShape : FullPath.Decodes program tree localView.accumulator bits 1 front
      openAddresses endpoint roles) :
    ∃ address target,
      openAddresses = [address] ∧
      selectCompletedResponse? program tree term =
        some ⟨.close, Local.accumulatorAddress localView ++ address, target⟩ ∧
      term.contractAt? (Local.accumulatorAddress localView ++ address) =
        some target ∧ Step term target := by
  have localParsed := RootResetProgressLocalParser.parse?_complete localShape
  obtain ⟨address, target, openEq, contracts⟩ :=
    freshResponse_close_contracts localParsed pathShape
  have freshCheck : (localView.status != .fresh) = false := by
    rw [fresh]
    rfl
  refine ⟨address, target, openEq, ?_, contracts,
    Term.contractAt?_sound contracts⟩
  unfold selectCompletedResponse? Local.parse?
  rw [localParsed]
  dsimp only [Bind.bind, Option.bind]
  rw [freshCheck]
  simp only [Bool.false_eq_true, ↓reduceIte]
  unfold FullPath.parse?
  rw [RootResetFullProgressPath.parse?_complete pathShape]
  unfold selectCompletedPath?
  dsimp only
  rw [openEq]
  exact checkedSelection?_of_contract contracts

/-- A declarative completed fresh response with a clean selected accumulator
selects only COMMIT at the Local status field. -/
theorem selectCompletedResponse?_complete_clean
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {localView : Local.View program}
    {bits : List Bool} {front : Option Address}
    {openAddresses : List Address} {endpoint : Address}
    {roles : List RootResetFullProgressPath.Role}
    (localShape : Local.Shape program tree localView term)
    (fresh : localView.status = .fresh)
    (pathShape : FullPath.Decodes program tree localView.accumulator bits 0 front
      openAddresses endpoint roles) :
    ∃ target,
      selectCompletedResponse? program tree term =
        some ⟨.commit, RootResetProgressResponse.statusAddress, target⟩ ∧
      term.contractAt? RootResetProgressResponse.statusAddress = some target ∧
      Step term target := by
  have localParsed := RootResetProgressLocalParser.parse?_complete localShape
  have lengthZero : openAddresses.length = 0 := by
    rw [← pathShape.openCount_eq_openAddresses_length]
  have openEq : openAddresses = [] := List.length_eq_zero_iff.mp lengthZero
  obtain ⟨target, contracts⟩ := freshLocal_status_contracts localParsed fresh
  have freshCheck : (localView.status != .fresh) = false := by
    rw [fresh]
    rfl
  refine ⟨target, ?_, contracts, Term.contractAt?_sound contracts⟩
  subst openAddresses
  unfold selectCompletedResponse? Local.parse?
  rw [localParsed]
  dsimp only [Bind.bind, Option.bind]
  rw [freshCheck]
  simp only [Bool.false_eq_true, ↓reduceIte]
  unfold FullPath.parse?
  rw [RootResetFullProgressPath.parse?_complete pathShape]
  exact checkedSelection?_of_contract contracts

end PureSFormal.Research.RootResetProgressTransactionClassifier
