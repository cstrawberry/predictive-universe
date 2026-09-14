import PureSFormal.Research.RootResetProgressRoles
import PureSFormal.Research.RootResetProgressLocalParser
import PureSFormal.Research.RootResetAccumulatorClassifier

/-!
# Complete registered progress-path parser

This module joins the independent-hole progress cells to the two completed
carrier boundaries used by the pure-S construction.  Starting at a bare
carrier root, the parser follows exactly one registered child at every layer:

* the active queue of a completed Base;
* the selected action accumulator of a completed Local;
* `R` through an Armed cell; and
* `LR` through an Open or Closed cell.

It stops only at the literal endpoint `S`.  Dispatcher routes and completed
progress actions are checked by `RootResetProgressLocalParser`; their audits
and histories, as well as every progress-cell audit, are opaque to the
recursive walk.  The executable result records the complete root-relative
endpoint address, the logical queue, the number and exact positions of
canonical Open cells, the front Armed-cell address, and the role sequence.
-/

namespace PureSFormal.Research.RootResetFullProgressPath

open PureSFormal.PureS
open RootResetProgressRoles

/-- The finite role alphabet of a registered complete progress path. -/
inductive Role where
  | endpoint
  | base
  | local
  | armed (bit : Bool)
  | opened (bit : Bool)
  | closed (bit : Bool)
  deriving BEq, DecidableEq, Repr

/-- Information recovered from one complete registered progress path. -/
structure View where
  bits : List Bool
  openCount : Nat
  /-- Root-relative address of the innermost Armed cell, when one exists. -/
  frontArmedAddress : Option Address
  /-- Root-relative addresses of all literal Open right-child redexes. -/
  openAddresses : List Address
  endpointAddress : Address
  roles : List Role
  deriving BEq, DecidableEq, Repr

/-- Prefix an address to an optional registered occurrence. -/
def prefixAddress? (addressPrefix : Address) :
    Option Address → Option Address :=
  Option.map (addressPrefix ++ ·)

/-- Prefix an address to every registered occurrence in a finite list. -/
def prefixAddresses (addressPrefix : Address) (addresses : List Address) :
    List Address :=
  addresses.map (addressPrefix ++ ·)

/-- The current Armed root is the front exactly when its predecessor contains
no Armed cell; otherwise the predecessor's front is retained and prefixed. -/
def armedFront (inner : Option Address) : Option Address :=
  match inner with
  | none => some []
  | some address => some (.right :: address)

/-- The active queue has this fixed address in a term-only open Base. -/
def baseQueueAddress : Address :=
  [.left, .right, .left, .left, .right, .right, .right]

/-- Minimal view of an Armed cell, without a diagonal-audit requirement. -/
structure ArmedView where
  bit : Bool
  predecessor : Term
  deriving BEq, DecidableEq, Repr

/-- Recognize an Armed role and recover only its registered predecessor. -/
def parseArmed? : Term → Option ArmedView
  | .app (.app (.app .s .s) constructor) predecessor =>
      (RootResetDeletionGadget.parseLiveConstructor? constructor).map
        (fun bit => ⟨bit, predecessor⟩)
  | _ => none

@[simp]
theorem parseArmed?_source (bit : Bool) (predecessor : Term) :
    parseArmed? (RootResetProgressRoles.Gadget.source bit predecessor) =
      some ⟨bit, predecessor⟩ := by
  change
    (RootResetDeletionGadget.parseLiveConstructor? (live bit)).map
      (fun found => ArmedView.mk found predecessor) =
        some (ArmedView.mk bit predecessor)
  rw [RootResetDeletionGadget.parseLiveConstructor?_live]
  rfl

/-- An Armed parse reconstructs the whole accepted role. -/
theorem parseArmed?_sound {term : Term} {view : ArmedView}
    (h : parseArmed? term = some view) :
    term = RootResetProgressRoles.Gadget.source view.bit view.predecessor := by
  cases term with
  | s => simp [parseArmed?] at h
  | app fn predecessor =>
      cases fn with
      | s => simp [parseArmed?] at h
      | app fn constructor =>
          cases fn with
          | s => simp [parseArmed?] at h
          | app head fixed =>
              cases head with
              | app _ _ => simp [parseArmed?] at h
              | s =>
                  cases fixed with
                  | app _ _ => simp [parseArmed?] at h
                  | s =>
                      simp only [parseArmed?] at h
                      generalize hc :
                        RootResetDeletionGadget.parseLiveConstructor?
                          constructor = parsed at h
                      cases parsed with
                      | none => simp at h
                      | some bit =>
                          cases h
                          have constructorEq :=
                            RootResetDeletionGadget.parseLiveConstructor?_sound hc
                          simp [RootResetProgressRoles.Gadget.source,
                            RootResetDeletionGadget.source,
                            RootResetDeletionGadget.progressLive, constructorEq,
                            b]

/-! ## Progress-aware completed Local parsing -/

/-- Local names for the dedicated progress-aware completed-boundary parser. -/
abbrev ProgressLocalView := RootResetProgressLocalParser.View
abbrev ProgressLocalShape := RootResetProgressLocalParser.Shape
abbrev parseProgressLocal? := RootResetProgressLocalParser.parse?
abbrev localAccumulatorAddress :=
  @RootResetProgressLocalParser.accumulatorAddress

/-! ## Strict registered children -/

/-- Successful Base parsing exposes its queue at the fixed registered path. -/
theorem parseBase?_queue_subterm
    {actions term : Term} {view : CheckpointDecoder.BaseView}
    (h : CheckpointDecoder.parseBase? actions term = some view) :
    term.subterm? baseQueueAddress = some view.queue := by
  rw [CheckpointDecoder.parseBase?_sound h]
  simp [baseQueueAddress, CheckpointDecoder.openBase,
    CheckpointDecoder.openEnvironment, Term.subterm?]

/-- The Base queue is a strict syntactic descendant. -/
theorem parseBase?_queue_size_lt
    {actions term : Term} {view : CheckpointDecoder.BaseView}
    (h : CheckpointDecoder.parseBase? actions term = some view) :
    view.queue.size < term.size :=
  CarrierDecoder.subterm_size_lt (parseBase?_queue_subterm h)

/-- Successful Local parsing exposes the selected action accumulator at the
address reconstructed from its checked route and action label. -/
theorem parseProgressLocal?_accumulator_subterm
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : ProgressLocalView program}
    (h : parseProgressLocal? program tree term = some view) :
    term.subterm? (localAccumulatorAddress view) = some view.accumulator :=
  RootResetProgressLocalParser.parse?_accumulator_subterm h

/-- The selected accumulator of a progress Local is a strict descendant. -/
theorem parseProgressLocal?_accumulator_size_lt
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : ProgressLocalView program}
    (h : parseProgressLocal? program tree term = some view) :
    view.accumulator.size < term.size :=
  RootResetProgressLocalParser.parse?_accumulator_size_lt h

/-- An Armed predecessor is a strict descendant. -/
theorem parseArmed?_predecessor_size_lt
    {term : Term} {view : ArmedView} (h : parseArmed? term = some view) :
    view.predecessor.size < term.size := by
  rw [parseArmed?_sound h]
  exact CarrierDecoder.size_app_right_lt _ _

/-- An Open predecessor is a strict descendant. -/
theorem parseOpen?_predecessor_size_lt
    {term : Term} {view : OpenView} (h : parseOpen? term = some view) :
    view.predecessor.size < term.size := by
  rw [parseOpen?_sound h]
  exact Nat.lt_trans
    (CarrierDecoder.size_app_right_lt .s view.predecessor)
    (CarrierDecoder.size_app_left_lt (.app .s view.predecessor)
      (.app (live view.bit) view.audit))

/-- A Closed predecessor is a strict descendant. -/
theorem parseClosed?_predecessor_size_lt
    {term : Term} {view : ClosedView} (h : parseClosed? term = some view) :
    view.predecessor.size < term.size := by
  rw [parseClosed?_sound h]
  exact Nat.lt_trans
    (CarrierDecoder.size_app_right_lt .s view.predecessor)
    (CarrierDecoder.size_app_left_lt (.app .s view.predecessor)
      (.app (.app .s view.leftAudit)
        (.app (valueTag view.bit) view.rightAudit)))

/-! ## Exact role-indexed grammar -/

/--
Declarative counterpart of the ordered executable parser.  Negative premises
record its role priority.  They prevent a malformed outer term from being
reinterpreted at a later role; no premise compares audit or history fields.
-/
inductive Decodes
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) :
    Term → List Bool → Nat → Option Address → List Address → Address →
      List Role → Prop where
  | endpoint : Decodes program tree .s [] 0 none [] [] [.endpoint]
  | base
      {term : Term} (boundary : CheckpointDecoder.BaseView)
      {bits : List Bool} {opens : Nat} {front : Option Address}
      {openAddresses : List Address} {address : Address} {roles : List Role}
      (parsed : CheckpointDecoder.parseBase?
        (RootResetProgressProgramCode.progressCompileActions program tree) term =
          some boundary)
      (inner : Decodes program tree boundary.queue bits opens front
        openAddresses address roles) :
      Decodes program tree term bits opens
        (prefixAddress? baseQueueAddress front)
        (prefixAddresses baseQueueAddress openAddresses)
        (baseQueueAddress ++ address) (.base :: roles)
  | local
      {term : Term} (notBase : CheckpointDecoder.parseBase?
        (RootResetProgressProgramCode.progressCompileActions program tree) term =
          none)
      (boundary : ProgressLocalView program)
      {bits : List Bool} {opens : Nat} {front : Option Address}
      {openAddresses : List Address} {address : Address} {roles : List Role}
      (parsed : parseProgressLocal? program tree term = some boundary)
      (inner : Decodes program tree boundary.accumulator bits opens front
        openAddresses address roles) :
      Decodes program tree term bits opens
        (prefixAddress? (localAccumulatorAddress boundary) front)
        (prefixAddresses (localAccumulatorAddress boundary) openAddresses)
        (localAccumulatorAddress boundary ++ address) (.local :: roles)
  | armed
      {term : Term}
      (notBase : CheckpointDecoder.parseBase?
        (RootResetProgressProgramCode.progressCompileActions program tree) term =
          none)
      (notLocal : parseProgressLocal? program tree term = none)
      (boundary : ArmedView)
      {bits : List Bool} {opens : Nat} {front : Option Address}
      {openAddresses : List Address} {address : Address} {roles : List Role}
      (parsed : parseArmed? term = some boundary)
      (inner : Decodes program tree boundary.predecessor bits opens front
        openAddresses address roles) :
      Decodes program tree term (bits ++ [boundary.bit]) opens
        (armedFront front)
        (prefixAddresses [.right] openAddresses)
        (.right :: address) (.armed boundary.bit :: roles)
  | opened
      {term : Term}
      (notBase : CheckpointDecoder.parseBase?
        (RootResetProgressProgramCode.progressCompileActions program tree) term =
          none)
      (notLocal : parseProgressLocal? program tree term = none)
      (notArmed : parseArmed? term = none)
      (boundary : OpenView)
      {bits : List Bool} {opens : Nat} {front : Option Address}
      {openAddresses : List Address} {address : Address} {roles : List Role}
      (parsed : parseOpen? term = some boundary)
      (inner : Decodes program tree boundary.predecessor bits opens front
        openAddresses address roles) :
      Decodes program tree term bits (opens + 1)
        (prefixAddress? [.left, .right] front)
        ([.right] :: prefixAddresses [.left, .right] openAddresses)
        (.left :: .right :: address) (.opened boundary.bit :: roles)
  | closed
      {term : Term}
      (notBase : CheckpointDecoder.parseBase?
        (RootResetProgressProgramCode.progressCompileActions program tree) term =
          none)
      (notLocal : parseProgressLocal? program tree term = none)
      (notArmed : parseArmed? term = none)
      (notOpen : parseOpen? term = none)
      (boundary : ClosedView)
      {bits : List Bool} {opens : Nat} {front : Option Address}
      {openAddresses : List Address} {address : Address} {roles : List Role}
      (parsed : parseClosed? term = some boundary)
      (inner : Decodes program tree boundary.predecessor bits opens front
        openAddresses address roles) :
      Decodes program tree term bits opens
        (prefixAddress? [.left, .right] front)
        (prefixAddresses [.left, .right] openAddresses)
        (.left :: .right :: address) (.closed boundary.bit :: roles)

/-- Prefix a registered role and address while retaining the inner result. -/
def prepend (role : Role) (addressPrefix : Address) (inner : View) : View :=
  { inner with
    frontArmedAddress := prefixAddress? addressPrefix inner.frontArmedAddress
    openAddresses := prefixAddresses addressPrefix inner.openAddresses
    endpointAddress := addressPrefix ++ inner.endpointAddress
    roles := role :: inner.roles }

/-- Total full progress-path parser. -/
def parse?
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Option View :=
  if _hendpoint : term = .s then
    some ⟨[], 0, none, [], [], [.endpoint]⟩
  else
      match _hbase : CheckpointDecoder.parseBase?
          (RootResetProgressProgramCode.progressCompileActions program tree)
          term with
      | some boundary =>
          match parse? program tree boundary.queue with
          | none => none
          | some inner =>
              some (prepend .base baseQueueAddress inner)
      | none =>
          match _hlocal : parseProgressLocal? program tree term with
          | some boundary =>
              match parse? program tree boundary.accumulator with
              | none => none
              | some inner =>
                  some (prepend .local (localAccumulatorAddress boundary) inner)
          | none =>
              match _harmed : parseArmed? term with
              | some boundary =>
                  match parse? program tree boundary.predecessor with
                  | none => none
                  | some inner =>
                      some
                        { bits := inner.bits ++ [boundary.bit]
                          openCount := inner.openCount
                          frontArmedAddress :=
                            armedFront inner.frontArmedAddress
                          openAddresses :=
                            prefixAddresses [.right] inner.openAddresses
                          endpointAddress := .right :: inner.endpointAddress
                          roles := .armed boundary.bit :: inner.roles }
              | none =>
                  match _hopen : parseOpen? term with
                  | some boundary =>
                      match parse? program tree boundary.predecessor with
                      | none => none
                      | some inner =>
                          some
                            { bits := inner.bits
                              openCount := inner.openCount + 1
                              frontArmedAddress :=
                                prefixAddress? [.left, .right]
                                  inner.frontArmedAddress
                              openAddresses := [.right] ::
                                prefixAddresses [.left, .right]
                                  inner.openAddresses
                              endpointAddress :=
                                .left :: .right :: inner.endpointAddress
                              roles := .opened boundary.bit :: inner.roles }
                  | none =>
                      match _hclosed : parseClosed? term with
                      | none => none
                      | some boundary =>
                          match parse? program tree
                              boundary.predecessor with
                          | none => none
                          | some inner =>
                              some
                                { bits := inner.bits
                                  openCount := inner.openCount
                                  frontArmedAddress :=
                                    prefixAddress? [.left, .right]
                                      inner.frontArmedAddress
                                  openAddresses :=
                                    prefixAddresses [.left, .right]
                                      inner.openAddresses
                                  endpointAddress :=
                                    .left :: .right ::
                                      inner.endpointAddress
                                  roles :=
                                    .closed boundary.bit :: inner.roles }
termination_by term.size
decreasing_by
  all_goals
    first
    | exact parseBase?_queue_size_lt (by assumption)
    | exact parseProgressLocal?_accumulator_size_lt (by assumption)
    | exact parseArmed?_predecessor_size_lt (by assumption)
    | exact parseOpen?_predecessor_size_lt (by assumption)
    | exact parseClosed?_predecessor_size_lt (by assumption)

/-- Every successful parse has an exact role-indexed derivation. -/
theorem parse?_sound
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View}
    (h : parse? program tree term = some view) :
    Decodes program tree term view.bits view.openCount view.frontArmedAddress
      view.openAddresses view.endpointAddress view.roles := by
  rw [parse?] at h
  split at h
  next hendpoint =>
    have viewEq :
        ⟨[], 0, none, [], [], [.endpoint]⟩ = view := Option.some.inj h
    subst view
    exact hendpoint ▸ .endpoint
  next hendpoint =>
    generalize hbase : CheckpointDecoder.parseBase?
      (RootResetProgressProgramCode.progressCompileActions program tree) term =
        baseResult at h
    cases baseResult with
    | some boundary =>
        generalize hinner : parse? program tree boundary.queue = innerResult at h
        cases innerResult with
        | none => simp [hbase, hinner] at h
        | some inner =>
            have viewEq : prepend .base baseQueueAddress inner = view :=
              by simpa [hbase, hinner] using h
            subst view
            exact .base boundary hbase (parse?_sound hinner)
    | none =>
        generalize hlocal : parseProgressLocal? program tree term = localResult
          at h
        cases localResult with
        | some boundary =>
            generalize hinner : parse? program tree boundary.accumulator =
              innerResult at h
            cases innerResult with
            | none => simp [hbase, hlocal, hinner] at h
            | some inner =>
                have viewEq :
                    prepend .local (localAccumulatorAddress boundary) inner =
                      view := by simpa [hbase, hlocal, hinner] using h
                subst view
                exact .local hbase boundary hlocal (parse?_sound hinner)
        | none =>
            generalize harmed : parseArmed? term = armedResult at h
            cases armedResult with
            | some boundary =>
                generalize hinner : parse? program tree boundary.predecessor =
                  innerResult at h
                cases innerResult with
                | none => simp [hbase, hlocal, harmed, hinner] at h
                | some inner =>
                    have viewEq :
                        { bits := inner.bits ++ [boundary.bit]
                          openCount := inner.openCount
                          frontArmedAddress := armedFront inner.frontArmedAddress
                          openAddresses :=
                            prefixAddresses [.right] inner.openAddresses
                          endpointAddress := .right :: inner.endpointAddress
                          roles := .armed boundary.bit :: inner.roles } = view :=
                      by simpa [hbase, hlocal, harmed, hinner] using h
                    subst view
                    exact .armed hbase hlocal boundary harmed
                      (parse?_sound hinner)
            | none =>
                generalize hopen : parseOpen? term = openResult at h
                cases openResult with
                | some boundary =>
                    generalize hinner : parse? program tree
                      boundary.predecessor = innerResult at h
                    cases innerResult with
                    | none =>
                        simp [hbase, hlocal, harmed, hopen, hinner] at h
                    | some inner =>
                        have viewEq :
                            { bits := inner.bits
                              openCount := inner.openCount + 1
                              frontArmedAddress :=
                                prefixAddress? [.left, .right]
                                  inner.frontArmedAddress
                              openAddresses := [.right] ::
                                prefixAddresses [.left, .right]
                                  inner.openAddresses
                              endpointAddress := .left :: .right ::
                                inner.endpointAddress
                              roles := .opened boundary.bit :: inner.roles } =
                            view := by
                              simpa [hbase, hlocal, harmed, hopen, hinner]
                                using h
                        subst view
                        exact .opened hbase hlocal harmed boundary hopen
                          (parse?_sound hinner)
                | none =>
                    generalize hclosed : parseClosed? term = closedResult at h
                    cases closedResult with
                    | none => simp at h
                    | some boundary =>
                        generalize hinner : parse? program tree
                          boundary.predecessor = innerResult at h
                        cases innerResult with
                        | none =>
                            simp [hbase, hlocal, harmed, hopen, hclosed,
                              hinner] at h
                        | some inner =>
                            have viewEq :
                                { bits := inner.bits
                                  openCount := inner.openCount
                                  frontArmedAddress :=
                                    prefixAddress? [.left, .right]
                                      inner.frontArmedAddress
                                  openAddresses :=
                                    prefixAddresses [.left, .right]
                                      inner.openAddresses
                                  endpointAddress := .left :: .right ::
                                    inner.endpointAddress
                                  roles := .closed boundary.bit :: inner.roles } =
                                view := by
                                  simpa [hbase, hlocal, harmed, hopen, hclosed,
                                    hinner] using h
                            subst view
                            exact .closed hbase hlocal harmed hopen boundary
                              hclosed (parse?_sound hinner)
termination_by term.size
decreasing_by
  all_goals
    first
    | exact parseBase?_queue_size_lt (by assumption)
    | exact parseProgressLocal?_accumulator_size_lt (by assumption)
    | exact parseArmed?_predecessor_size_lt (by assumption)
    | exact parseOpen?_predecessor_size_lt (by assumption)
    | exact parseClosed?_predecessor_size_lt (by assumption)

/-- Every declarative full progress path is accepted with all of its exact
indices. -/
theorem parse?_complete
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {bits : List Bool} {opens : Nat}
    {front : Option Address} {openAddresses : List Address}
    {address : Address} {roles : List Role}
    (h : Decodes program tree term bits opens front openAddresses address
      roles) :
    parse? program tree term =
      some ⟨bits, opens, front, openAddresses, address, roles⟩ := by
  induction h with
  | endpoint => simp [parse?]
  | @base term boundary bits opens front openAddresses address roles
      parsed inner ih =>
      have termNe : term ≠ .s := by
        intro termEq
        subst term
        simp [CheckpointDecoder.parseBase?] at parsed
      rw [parse?]
      simp only [termNe, ↓reduceDIte]
      rw [parsed]
      simp only
      rw [ih]
      rfl
  | @«local» term notBase boundary bits opens front openAddresses address
      roles parsed inner ih =>
      have termNe : term ≠ .s := by
        intro termEq
        subst term
        change RootResetProgressLocalParser.parse? program tree .s =
          some boundary at parsed
        simp [RootResetProgressLocalParser.parse?] at parsed
      rw [parse?]
      simp only [termNe, ↓reduceDIte]
      rw [notBase]
      simp only
      rw [parsed]
      simp only
      rw [ih]
      rfl
  | @armed term notBase notLocal boundary bits opens front openAddresses address
      roles parsed inner ih =>
      have termNe : term ≠ .s := by
        intro termEq
        subst term
        simp [parseArmed?] at parsed
      rw [parse?]
      simp only [termNe, ↓reduceDIte]
      rw [notBase]
      simp only
      rw [notLocal]
      simp only
      rw [parsed]
      simp only
      rw [ih]
  | @opened term notBase notLocal notArmed boundary bits opens front
      openAddresses address roles parsed inner ih =>
      have termNe : term ≠ .s := by
        intro termEq
        subst term
        simp [parseOpen?] at parsed
      rw [parse?]
      simp only [termNe, ↓reduceDIte]
      rw [notBase]
      simp only
      rw [notLocal]
      simp only
      rw [notArmed]
      simp only
      rw [parsed]
      simp only
      rw [ih]
  | @closed term notBase notLocal notArmed notOpen boundary bits opens front
      openAddresses address roles parsed inner ih =>
      have termNe : term ≠ .s := by
        intro termEq
        subst term
        simp [parseClosed?] at parsed
      rw [parse?]
      simp only [termNe, ↓reduceDIte]
      rw [notBase]
      simp only
      rw [notLocal]
      simp only
      rw [notArmed]
      simp only
      rw [notOpen]
      simp only
      rw [parsed]
      simp only
      rw [ih]

/-- Executable parsing and the complete role-indexed grammar coincide. -/
theorem parse?_eq_some_iff
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) (view : View) :
    parse? program tree term = some view ↔
      Decodes program tree term view.bits view.openCount view.frontArmedAddress
        view.openAddresses view.endpointAddress view.roles :=
  ⟨parse?_sound, parse?_complete⟩

/-! ## Functional path facts -/

/-- A successful derivation reaches the literal registered endpoint. -/
theorem Decodes.endpoint_subterm
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {bits : List Bool} {opens : Nat}
    {front : Option Address} {openAddresses : List Address}
    {address : Address} {roles : List Role}
    (h : Decodes program tree term bits opens front openAddresses address roles) :
    term.subterm? address = some .s := by
  induction h with
  | endpoint => rfl
  | base boundary parsed inner ih =>
      rw [CarrierDecoder.subterm?_append, parseBase?_queue_subterm parsed]
      simpa using ih
  | «local» notBase boundary parsed inner ih =>
      rw [CarrierDecoder.subterm?_append,
        parseProgressLocal?_accumulator_subterm parsed]
      simpa using ih
  | armed notBase notLocal boundary parsed inner ih =>
      rw [parseArmed?_sound parsed]
      simpa [Term.subterm?] using! ih
  | opened notBase notLocal notArmed boundary parsed inner ih =>
      rw [parseOpen?_sound parsed]
      simpa [openCell, Term.subterm?] using! ih
  | closed notBase notLocal notArmed notOpen boundary parsed inner ih =>
      rw [parseClosed?_sound parsed]
      simpa [closedCell, Term.subterm?] using! ih

/-- Prefixing preserves the number of recorded occurrences. -/
@[simp]
theorem prefixAddresses_length (pathPrefix : Address)
    (addresses : List Address) :
    (prefixAddresses pathPrefix addresses).length = addresses.length := by
  simp [prefixAddresses]

/-- The numerical Open count and the explicit Open-address list agree. -/
theorem Decodes.openCount_eq_openAddresses_length
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {bits : List Bool} {opens : Nat}
    {front : Option Address} {openAddresses : List Address}
    {address : Address} {roles : List Role}
    (h : Decodes program tree term bits opens front openAddresses address roles) :
    opens = openAddresses.length := by
  induction h with
  | endpoint => rfl
  | base boundary parsed inner ih => simpa using ih
  | «local» notBase boundary parsed inner ih => simpa using ih
  | armed notBase notLocal boundary parsed inner ih => simpa using ih
  | opened notBase notLocal notArmed boundary parsed inner ih =>
      simp [ih, Nat.add_comm]
  | closed notBase notLocal notArmed notOpen boundary parsed inner ih =>
      simpa using ih

/-- Compose two successful literal subtree lookups. -/
theorem subterm?_prefix
    {outer inner found : Term} {pathPrefix suffix : Address}
    (houter : outer.subterm? pathPrefix = some inner)
    (hinner : inner.subterm? suffix = some found) :
    outer.subterm? (pathPrefix ++ suffix) = some found := by
  rw [CarrierDecoder.subterm?_append, houter]
  exact hinner

/-- Invert membership after adding one common address prefix. -/
theorem exists_of_mem_prefixAddresses
    {pathPrefix address : Address} {addresses : List Address}
    (member : address ∈ prefixAddresses pathPrefix addresses) :
    ∃ inner, inner ∈ addresses ∧ pathPrefix ++ inner = address := by
  unfold prefixAddresses at member
  simpa only using
    RootResetAccumulatorClassifier.exists_of_mem_map
      (fun inner : Address => pathPrefix ++ inner) member

/-- The recorded front address denotes an actual Armed role. -/
theorem Decodes.frontArmedAddress_subterm
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {bits : List Bool} {opens : Nat}
    {front : Option Address} {openAddresses : List Address}
    {endpoint : Address} {roles : List Role}
    (shape : Decodes program tree term bits opens front openAddresses endpoint
      roles)
    {address : Address} (frontEq : front = some address) :
    ∃ bit predecessor,
      term.subterm? address =
        some (RootResetProgressRoles.Gadget.source bit predecessor) := by
  induction shape generalizing address with
  | endpoint => simp at frontEq
  | @base term boundary bits opens innerFront innerOpenAddresses endpoint roles
      parsed inner ih =>
      cases innerFront with
      | none => simp [prefixAddress?] at frontEq
      | some innerAddress =>
          simp [prefixAddress?] at frontEq
          subst address
          obtain ⟨bit, predecessor, found⟩ := ih rfl
          exact ⟨bit, predecessor,
            subterm?_prefix (parseBase?_queue_subterm parsed) found⟩
  | @«local» term notBase boundary bits opens innerFront innerOpenAddresses
      endpoint roles parsed inner ih =>
      cases innerFront with
      | none => simp [prefixAddress?] at frontEq
      | some innerAddress =>
          simp [prefixAddress?] at frontEq
          subst address
          obtain ⟨bit, predecessor, found⟩ := ih rfl
          exact ⟨bit, predecessor,
            subterm?_prefix
              (parseProgressLocal?_accumulator_subterm parsed) found⟩
  | @armed term notBase notLocal boundary bits opens innerFront
      innerOpenAddresses endpoint roles parsed inner ih =>
      cases innerFront with
      | none =>
          simp [armedFront] at frontEq
          subst address
          exact ⟨boundary.bit, boundary.predecessor, by
            rw [parseArmed?_sound parsed]
            rfl⟩
      | some innerAddress =>
          simp [armedFront] at frontEq
          subst address
          obtain ⟨bit, predecessor, found⟩ := ih rfl
          refine ⟨bit, predecessor, ?_⟩
          rw [parseArmed?_sound parsed]
          simpa [RootResetProgressRoles.Gadget.source,
            RootResetDeletionGadget.source, Term.subterm?] using found
  | @opened term notBase notLocal notArmed boundary bits opens innerFront
      innerOpenAddresses endpoint roles parsed inner ih =>
      cases innerFront with
      | none => simp [prefixAddress?] at frontEq
      | some innerAddress =>
          simp [prefixAddress?] at frontEq
          subst address
          obtain ⟨bit, predecessor, found⟩ := ih rfl
          refine ⟨bit, predecessor, ?_⟩
          rw [parseOpen?_sound parsed]
          simpa [openCell, Term.subterm?] using! found
  | @closed term notBase notLocal notArmed notOpen boundary bits opens
      innerFront innerOpenAddresses endpoint roles parsed inner ih =>
      cases innerFront with
      | none => simp [prefixAddress?] at frontEq
      | some innerAddress =>
          simp [prefixAddress?] at frontEq
          subst address
          obtain ⟨bit, predecessor, found⟩ := ih rfl
          refine ⟨bit, predecessor, ?_⟩
          rw [parseClosed?_sound parsed]
          simpa [closedCell, Term.subterm?] using! found

/-- Every recorded Open address is the literal right-child redex of an Open
role; no audit equality is used. -/
theorem Decodes.openAddress_subterm
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {bits : List Bool} {opens : Nat}
    {front : Option Address} {openAddresses : List Address}
    {endpoint : Address} {roles : List Role}
    (shape : Decodes program tree term bits opens front openAddresses endpoint
      roles)
    {address : Address} (member : address ∈ openAddresses) :
    ∃ bit audit,
      term.subterm? address = some (.app (live bit) audit) := by
  induction shape generalizing address with
  | endpoint => simp at member
  | base boundary parsed inner ih =>
      obtain ⟨innerAddress, innerMember, addressEq⟩ :=
        exists_of_mem_prefixAddresses member
      subst address
      obtain ⟨bit, audit, found⟩ := ih innerMember
      exact ⟨bit, audit, subterm?_prefix
        (parseBase?_queue_subterm parsed) found⟩
  | «local» notBase boundary parsed inner ih =>
      obtain ⟨innerAddress, innerMember, addressEq⟩ :=
        exists_of_mem_prefixAddresses member
      subst address
      obtain ⟨bit, audit, found⟩ := ih innerMember
      exact ⟨bit, audit, subterm?_prefix
        (parseProgressLocal?_accumulator_subterm parsed) found⟩
  | armed notBase notLocal boundary parsed inner ih =>
      obtain ⟨innerAddress, innerMember, addressEq⟩ :=
        exists_of_mem_prefixAddresses member
      subst address
      obtain ⟨bit, audit, found⟩ := ih innerMember
      refine ⟨bit, audit, ?_⟩
      rw [parseArmed?_sound parsed]
      simpa [RootResetProgressRoles.Gadget.source,
        RootResetDeletionGadget.source, Term.subterm?] using found
  | opened notBase notLocal notArmed boundary parsed inner ih =>
      simp only [List.mem_cons] at member
      rcases member with current | descendant
      · subst address
        exact ⟨boundary.bit, boundary.audit, by
          rw [parseOpen?_sound parsed]
          exact openCell_right_subterm _ _ _⟩
      · obtain ⟨innerAddress, innerMember, addressEq⟩ :=
          exists_of_mem_prefixAddresses descendant
        subst address
        obtain ⟨bit, audit, found⟩ := ih innerMember
        refine ⟨bit, audit, ?_⟩
        rw [parseOpen?_sound parsed]
        simpa [openCell, Term.subterm?] using! found
  | closed notBase notLocal notArmed notOpen boundary parsed inner ih =>
      obtain ⟨innerAddress, innerMember, addressEq⟩ :=
        exists_of_mem_prefixAddresses member
      subst address
      obtain ⟨bit, audit, found⟩ := ih innerMember
      refine ⟨bit, audit, ?_⟩
      rw [parseClosed?_sound parsed]
      simpa [closedCell, Term.subterm?] using! found

/-- A literal redex found at an address admits an executable contraction at
that exact address. -/
theorem contractAt?_exists_of_subterm_contractRoot?
    {term selected replacement : Term} {address : Address}
    (selectedAt : term.subterm? address = some selected)
    (contractsAtRoot : selected.contractRoot? = some replacement) :
    ∃ target, term.contractAt? address = some target := by
  obtain ⟨context, _sourceEq, replaceEq⟩ :=
    Term.context_of_subterm selectedAt
  refine ⟨context.plug replacement, ?_⟩
  unfold Term.contractAt?
  rw [selectedAt]
  simp only
  rw [contractsAtRoot]
  simp only
  exact replaceEq replacement

/-- The exact front address selected by a derivation contracts an Armed cell. -/
theorem Decodes.frontArmedAddress_contracts
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {bits : List Bool} {opens : Nat}
    {front : Option Address} {openAddresses : List Address}
    {endpoint : Address} {roles : List Role}
    (shape : Decodes program tree term bits opens front openAddresses endpoint
      roles)
    {address : Address} (frontEq : front = some address) :
    ∃ target, term.contractAt? address = some target := by
  obtain ⟨bit, predecessor, selectedAt⟩ :=
    shape.frontArmedAddress_subterm frontEq
  apply contractAt?_exists_of_subterm_contractRoot? selectedAt
  rfl

/-- Every exact front address supplies one genuine contextual pure-S step. -/
theorem Decodes.frontArmedAddress_contracts_and_step
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {bits : List Bool} {opens : Nat}
    {front : Option Address} {openAddresses : List Address}
    {endpoint : Address} {roles : List Role}
    (shape : Decodes program tree term bits opens front openAddresses endpoint
      roles)
    {address : Address} (frontEq : front = some address) :
    ∃ target, term.contractAt? address = some target ∧ Step term target := by
  obtain ⟨target, contracts⟩ := shape.frontArmedAddress_contracts frontEq
  exact ⟨target, contracts, Term.contractAt?_sound contracts⟩

/-- Every recorded CLOSE address admits an executable contraction. -/
theorem Decodes.openAddress_contracts
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {bits : List Bool} {opens : Nat}
    {front : Option Address} {openAddresses : List Address}
    {endpoint : Address} {roles : List Role}
    (shape : Decodes program tree term bits opens front openAddresses endpoint
      roles)
    {address : Address} (member : address ∈ openAddresses) :
    ∃ target, term.contractAt? address = some target := by
  obtain ⟨bit, audit, selectedAt⟩ := shape.openAddress_subterm member
  apply contractAt?_exists_of_subterm_contractRoot? selectedAt
  rfl

/-- Every recorded CLOSE address supplies one genuine contextual pure-S step. -/
theorem Decodes.openAddress_contracts_and_step
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {bits : List Bool} {opens : Nat}
    {front : Option Address} {openAddresses : List Address}
    {endpoint : Address} {roles : List Role}
    (shape : Decodes program tree term bits opens front openAddresses endpoint
      roles)
    {address : Address} (member : address ∈ openAddresses) :
    ∃ target, term.contractAt? address = some target ∧ Step term target := by
  obtain ⟨target, contracts⟩ := shape.openAddress_contracts member
  exact ⟨target, contracts, Term.contractAt?_sound contracts⟩

/-- A clean nonempty registered path has a term-resident front Armed address. -/
theorem Decodes.frontArmedAddress_exists_of_clean_nonempty
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {bits : List Bool} {opens : Nat}
    {front : Option Address} {openAddresses : List Address}
    {endpoint : Address} {roles : List Role}
    (shape : Decodes program tree term bits opens front openAddresses endpoint
      roles)
    (clean : opens = 0) (nonempty : bits ≠ []) :
    ∃ address, front = some address := by
  induction shape with
  | endpoint => exact False.elim (nonempty rfl)
  | base boundary parsed inner ih =>
      obtain ⟨innerAddress, innerFront⟩ := ih clean nonempty
      exact ⟨baseQueueAddress ++ innerAddress, by
        simp [prefixAddress?, innerFront]⟩
  | «local» notBase boundary parsed inner ih =>
      obtain ⟨innerAddress, innerFront⟩ := ih clean nonempty
      exact ⟨localAccumulatorAddress boundary ++ innerAddress, by
        simp [prefixAddress?, innerFront]⟩
  | @armed term notBase notLocal boundary innerBits innerOpens innerFront
      innerOpenAddresses innerEndpoint innerRoles parsed inner ih =>
      cases innerFront with
      | none => exact ⟨[], rfl⟩
      | some innerAddress => exact ⟨.right :: innerAddress, rfl⟩
  | opened notBase notLocal notArmed boundary parsed inner ih =>
      simp at clean
  | closed notBase notLocal notArmed notOpen boundary parsed inner ih =>
      obtain ⟨innerAddress, innerFront⟩ := ih clean nonempty
      exact ⟨[.left, .right] ++ innerAddress, by
        simp [prefixAddress?, innerFront]⟩

/-- Exactly one Open count yields exactly one literal CLOSE address. -/
theorem Decodes.openAddresses_eq_singleton_of_open
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {bits : List Bool} {opens : Nat}
    {front : Option Address} {openAddresses : List Address}
    {endpoint : Address} {roles : List Role}
    (shape : Decodes program tree term bits opens front openAddresses endpoint
      roles)
    (isOpen : opens = 1) :
    ∃ address, openAddresses = [address] := by
  have lengthOne : openAddresses.length = 1 := by
    rw [← shape.openCount_eq_openAddresses_length, isOpen]
  cases openAddresses with
  | nil =>
      change 0 = Nat.succ 0 at lengthOne
      exact False.elim (Nat.noConfusion lengthOne)
  | cons address rest =>
      cases rest with
      | nil => exact ⟨address, rfl⟩
      | cons second tail =>
          change Nat.succ (Nat.succ tail.length) = Nat.succ 0 at lengthOne
          have impossible : Nat.succ tail.length = 0 :=
            Nat.succ.inj lengthOne
          exact False.elim (Nat.noConfusion impossible)

/-- The clean/nonempty parser result carries a verified front contraction. -/
theorem parse?_clean_nonempty_front_contracts
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View}
    (parsed : parse? program tree term = some view)
    (clean : view.openCount = 0) (nonempty : view.bits ≠ []) :
    ∃ address target,
      view.frontArmedAddress = some address ∧
      term.contractAt? address = some target := by
  let shape := parse?_sound parsed
  obtain ⟨address, frontEq⟩ :=
    shape.frontArmedAddress_exists_of_clean_nonempty clean nonempty
  obtain ⟨target, contracts⟩ := shape.frontArmedAddress_contracts frontEq
  exact ⟨address, target, frontEq, contracts⟩

/-- The one-Open parser result carries its unique verified CLOSE contraction. -/
theorem parse?_open_close_contracts
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View}
    (parsed : parse? program tree term = some view)
    (isOpen : view.openCount = 1) :
    ∃ address target,
      view.openAddresses = [address] ∧
      term.contractAt? address = some target := by
  let shape := parse?_sound parsed
  obtain ⟨address, singleton⟩ :=
    shape.openAddresses_eq_singleton_of_open isOpen
  have member : address ∈ view.openAddresses := by simp [singleton]
  obtain ⟨target, contracts⟩ := shape.openAddress_contracts member
  exact ⟨address, target, singleton, contracts⟩

/-- Any address reaching a subtree is shorter than the containing tree. -/
theorem address_length_lt_size_of_subterm
    {term found : Term} {address : Address}
    (h : term.subterm? address = some found) : address.length < term.size := by
  induction address generalizing term with
  | nil => exact term.size_pos
  | cons direction rest ih =>
      cases term with
      | s => cases direction <;> simp [Term.subterm?] at h
      | app fn arg =>
          cases direction with
          | left =>
              have child : fn.subterm? rest = some found := by
                simpa only [Term.subterm?] using h
              exact Nat.lt_of_lt_of_le (Nat.succ_lt_succ (ih child))
                (by simp [Term.size])
          | right =>
              have child : arg.subterm? rest = some found := by
                simpa only [Term.subterm?] using h
              exact Nat.lt_of_lt_of_le (Nat.succ_lt_succ (ih child))
                (by simp [Term.size])

/-- The complete registered path is finite and linearly bounded by syntax. -/
theorem Decodes.endpointAddress_length_lt_size
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {bits : List Bool} {opens : Nat}
    {front : Option Address} {openAddresses : List Address}
    {address : Address} {roles : List Role}
    (h : Decodes program tree term bits opens front openAddresses address roles) :
    address.length < term.size :=
  address_length_lt_size_of_subterm h.endpoint_subterm

/-- Every decoded role list is nonempty. -/
theorem Decodes.roles_length_pos
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {bits : List Bool} {opens : Nat}
    {front : Option Address} {openAddresses : List Address}
    {address : Address} {roles : List Role}
    (h : Decodes program tree term bits opens front openAddresses address roles) :
    0 < roles.length := by
  cases h <;> simp

/-- A bare term has at most one full parsed view. -/
theorem parse?_unique
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {first second : View}
    (hfirst : parse? program tree term = some first)
    (hsecond : parse? program tree term = some second) : first = second := by
  rw [hfirst] at hsecond
  exact Option.some.inj hsecond

/-- Two declarative derivations for the same term have identical decoded
queue, Open count, endpoint address, and role path. -/
theorem Decodes.deterministic
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term}
    {firstBits secondBits : List Bool}
    {firstOpens secondOpens : Nat}
    {firstFront secondFront : Option Address}
    {firstOpenAddresses secondOpenAddresses : List Address}
    {firstAddress secondAddress : Address}
    {firstRoles secondRoles : List Role}
    (first : Decodes program tree term firstBits firstOpens firstFront
      firstOpenAddresses firstAddress firstRoles)
    (second : Decodes program tree term secondBits secondOpens secondFront
      secondOpenAddresses secondAddress secondRoles) :
    firstBits = secondBits ∧ firstOpens = secondOpens ∧
      firstFront = secondFront ∧
      firstOpenAddresses = secondOpenAddresses ∧
      firstAddress = secondAddress ∧ firstRoles = secondRoles := by
  have equality :
      View.mk firstBits firstOpens firstFront firstOpenAddresses firstAddress
          firstRoles =
        View.mk secondBits secondOpens secondFront secondOpenAddresses
          secondAddress secondRoles :=
    parse?_unique (parse?_complete first) (parse?_complete second)
  exact ⟨congrArg View.bits equality,
    congrArg View.openCount equality,
    congrArg View.frontArmedAddress equality,
    congrArg View.openAddresses equality,
    congrArg View.endpointAddress equality,
    congrArg View.roles equality⟩

/-! ## Queue and transaction projections -/

/-- Logical queue decoded from the whole registered path. -/
def queue?
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Option (List Bool) :=
  (parse? program tree term).map View.bits

/-- Number of canonical Open cells on the whole registered path. -/
def openCount?
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Option Nat :=
  (parse? program tree term).map View.openCount

/-- Successful full parsing returns the exact logical queue projection. -/
@[simp]
theorem queue?_eq_some_of_parse
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View}
    (parsed : parse? program tree term = some view) :
    queue? program tree term = some view.bits := by
  simp [queue?, parsed]

/-- Successful full parsing returns the exact Open-count projection. -/
@[simp]
theorem openCount?_eq_some_of_parse
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View}
    (parsed : parse? program tree term = some view) :
    openCount? program tree term = some view.openCount := by
  simp [openCount?, parsed]

/-- On every successful parse, clean is equivalent to having no recorded
CLOSE address. -/
theorem parse?_clean_iff_openAddresses_nil
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View}
    (parsed : parse? program tree term = some view) :
    view.openCount = 0 ↔ view.openAddresses = [] := by
  have count := (parse?_sound parsed).openCount_eq_openAddresses_length
  constructor
  · intro clean
    apply List.length_eq_zero_iff.mp
    rw [← count, clean]
  · intro noAddresses
    rw [count, noAddresses]
    rfl

/-- On every successful parse, transaction-open is equivalent to having one
and only one recorded CLOSE address. -/
theorem parse?_open_iff_openAddresses_singleton
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View}
    (parsed : parse? program tree term = some view) :
    view.openCount = 1 ↔ ∃ address, view.openAddresses = [address] := by
  let shape := parse?_sound parsed
  constructor
  · exact shape.openAddresses_eq_singleton_of_open
  · rintro ⟨address, singleton⟩
    rw [shape.openCount_eq_openAddresses_length, singleton]
    rfl

/-- A complete path is clean exactly when its executable Open count is zero. -/
theorem clean_iff_openCount?_eq_zero
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (term : Term) :
    (∃ bits front openAddresses address roles,
      Decodes program tree term bits 0 front openAddresses address roles ∧
        parse? program tree term =
          some ⟨bits, 0, front, openAddresses, address, roles⟩) ↔
      openCount? program tree term = some 0 := by
  constructor
  · rintro ⟨bits, front, openAddresses, address, roles, shape, parsed⟩
    simp [openCount?, parsed]
  · intro h
    unfold openCount? at h
    generalize hp : parse? program tree term = parsed at h
    cases parsed with
    | none => simp at h
    | some view =>
        have hopen : view.openCount = 0 := Option.some.inj h
        rcases view with ⟨bits, opens, front, openAddresses, address, roles⟩
        simp only at hopen
        subst opens
        exact ⟨bits, front, openAddresses, address, roles,
          parse?_sound hp, rfl⟩

/-- A complete path is transaction-open exactly when it has one canonical
Open role. -/
theorem open_iff_openCount?_eq_one
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) (term : Term) :
    (∃ bits front openAddresses address roles,
      Decodes program tree term bits 1 front openAddresses address roles ∧
        parse? program tree term =
          some ⟨bits, 1, front, openAddresses, address, roles⟩) ↔
      openCount? program tree term = some 1 := by
  constructor
  · rintro ⟨bits, front, openAddresses, address, roles, shape, parsed⟩
    simp [openCount?, parsed]
  · intro h
    unfold openCount? at h
    generalize hp : parse? program tree term = parsed at h
    cases parsed with
    | none => simp at h
    | some view =>
        have hopen : view.openCount = 1 := Option.some.inj h
        rcases view with ⟨bits, opens, front, openAddresses, address, roles⟩
        simp only at hopen
        subst opens
        exact ⟨bits, front, openAddresses, address, roles,
          parse?_sound hp, rfl⟩

end PureSFormal.Research.RootResetFullProgressPath
