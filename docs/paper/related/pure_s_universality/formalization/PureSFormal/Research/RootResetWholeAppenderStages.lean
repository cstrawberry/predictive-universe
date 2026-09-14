import PureSFormal.Research.RootResetAppenderStages
import PureSFormal.Research.RootResetWholeStageClassifier

/-!
# Whole-term placement of Push/appender stages

This module lifts the local Push parsers through the three literal contexts
present on an encoded response: the selected response of an activated route,
the dispatcher field of a fresh Local shell, and the canonical outer prefix
of completed marked Locals.  The resulting parser starts at the bare whole
term.  It recovers the CTS label, phase, front bit, zero-based appendant
position, and the current first, nonfinal-second, or final-second Push row.

The selected address is root-relative.  On the first and nonfinal-second rows
it reaches a saturated `S` redex and contracts to the exact whole-term
replacement.  On the final-second row the same construction names only the
registered would-be next-Push occurrence; that occurrence is noncontractible.
No whole-term normal-form conclusion is drawn.

The halt, seed-audit, continuation-audit, route-audit, dormant-call, action
accumulator, and retained-history fields remain independent holes.  The
parser checks only the fresh halt prefix, the literal seed word, the fixed
dispatcher program, the selected route, and the fixed appender/live codes.
-/

namespace PureSFormal.Research.RootResetWholeAppenderStages

open PureSFormal.PureS
open RootResetReachableStageGrammar
open RootResetAppenderStages

/-! ## Exact local row data -/

/-- The three registered Push rows at an action-field response. -/
inductive Stage where
  | first
  | secondNonfinal
  | secondFinal
  deriving BEq, DecidableEq, Inhabited, Repr

/--
All runtime fields of one Push row.  Constructors make final and nonfinal
second rows disjoint without comparing any opaque term fields.
-/
inductive Row where
  | first
      (position : Nat) (bit : Bool) (rest : List Bool)
      (accumulator duplicate : Term) (histories : List Term)
  | secondNonfinal
      (position : Nat) (bit next : Bool) (tail : List Bool)
      (accumulator currentHistory : Term) (histories : List Term)
  | secondFinal
      (position : Nat) (bit : Bool)
      (accumulator currentHistory : Term) (histories : List Term)
  deriving BEq, DecidableEq, Repr

def Row.stage : Row → Stage
  | .first .. => .first
  | .secondNonfinal .. => .secondNonfinal
  | .secondFinal .. => .secondFinal

def Row.position : Row → Nat
  | .first position .. => position
  | .secondNonfinal position .. => position
  | .secondFinal position .. => position

def Row.bit : Row → Bool
  | .first _ bit .. => bit
  | .secondNonfinal _ bit .. => bit
  | .secondFinal _ bit .. => bit

def Row.remaining : Row → List Bool
  | .first _ _ rest .. => rest
  | .secondNonfinal _ _ next tail .. => next :: tail
  | .secondFinal .. => []

def Row.histories : Row → List Term
  | .first _ _ _ _ _ histories => histories
  | .secondNonfinal _ _ _ _ _ _ histories => histories
  | .secondFinal _ _ _ _ histories => histories

/-- Literal current action-field row reconstructed by a parse. -/
def Row.term : Row → Term
  | .first _ bit rest accumulator duplicate histories =>
      Term.applyArgs (firstRow bit rest accumulator duplicate) histories
  | .secondNonfinal _ _ next tail accumulator currentHistory histories =>
      Term.applyArgs
        (secondRow (next :: tail) accumulator currentHistory) histories
  | .secondFinal _ _ accumulator currentHistory histories =>
      Term.applyArgs (secondRow [] accumulator currentHistory) histories

/-- Address local to the selected action response. -/
def Row.localAddress : Row → Address
  | .first _ _ _ _ _ histories => historyPrefixAddress histories []
  | .secondNonfinal _ _ _ _ _ _ histories =>
      historyPrefixAddress histories [.left]
  | .secondFinal _ _ _ _ histories =>
      historyPrefixAddress histories [.left]

/-- The exact occurrence reached by `localAddress`. -/
def Row.focus : Row → Term
  | .first _ bit rest accumulator duplicate _ =>
      firstRow bit rest accumulator duplicate
  | .secondNonfinal _ _ next tail accumulator _ _ =>
      .app (appender (next :: tail)) accumulator
  | .secondFinal _ _ accumulator _ _ =>
      .app (appender []) accumulator

/-- Exact local action-field target, absent only at the completed final row. -/
def Row.target? : Row → Option Term
  | .first _ bit rest accumulator duplicate histories =>
      some (Term.applyArgs
        (firstTarget bit rest accumulator duplicate) histories)
  | .secondNonfinal _ _ next tail accumulator currentHistory histories =>
      some (Term.applyArgs
        (firstRow next tail accumulator accumulator)
        (currentHistory :: histories))
  | .secondFinal .. => none

/-- Contractum of the selected focus, absent only at the final row. -/
def Row.replacement? : Row → Option Term
  | .first _ bit rest accumulator duplicate _ =>
      some (firstTarget bit rest accumulator duplicate)
  | .secondNonfinal _ _ next tail accumulator _ _ =>
      some (firstRow next tail accumulator accumulator)
  | .secondFinal .. => none

/-- Suffix and position facts certified by the local term-only parsers. -/
def Row.Valid (emitted : List Bool) : Row → Prop
  | .first position bit rest _ _ histories =>
      emitted.drop position = bit :: rest ∧ histories.length = position
  | .secondNonfinal position bit next tail _ _ histories =>
      emitted.drop position = bit :: next :: tail ∧
        histories.length = position
  | .secondFinal position bit _ _ histories =>
      emitted.drop position = [bit] ∧ histories.length = position

/-- Parse one first/nonfinal-second/final-second response row. -/
def parseRow? (program : CTS.Program) (label : ActionLabel program)
    (term : Term) : Option Row :=
  match parseFirst? program label term with
  | some view =>
      some (.first view.position view.bit view.rest view.accumulator
        view.duplicate view.histories)
  | none =>
      match parseSecond? program label term with
      | none => none
      | some view =>
          match view.rest with
          | [] =>
              some (.secondFinal view.position view.bit view.accumulator
                view.currentHistory view.histories)
          | next :: tail =>
              some (.secondNonfinal view.position view.bit next tail
                view.accumulator view.currentHistory view.histories)

/-- Successful row parsing reconstructs the exact term and emitted suffix. -/
theorem parseRow?_sound
    {program : CTS.Program} {label : ActionLabel program}
    {term : Term} {row : Row}
    (h : parseRow? program label term = some row) :
    Row.Valid (PrimitiveLocalResponse.emitted program label) row ∧
      term = row.term := by
  unfold parseRow? at h
  generalize hfirst : parseFirst? program label term = firstResult at h
  cases firstResult with
  | some view =>
      have hrow := Option.some.inj h
      subst row
      have sound := parseFirst?_sound hfirst
      exact ⟨⟨sound.1, sound.2.1⟩, sound.2.2⟩
  | none =>
      generalize hsecond : parseSecond? program label term = secondResult at h
      cases secondResult with
      | none => contradiction
      | some view =>
          have sound := parseSecond?_sound hsecond
          cases hrest : view.rest with
          | nil =>
              simp only [hrest] at h
              have hrow := Option.some.inj h
              subst row
              refine ⟨⟨?_, sound.2.1⟩, ?_⟩
              · simpa [hrest] using sound.1
              · simpa [Row.term, hrest] using sound.2.2
          | cons next tail =>
              simp only [hrest] at h
              have hrow := Option.some.inj h
              subst row
              refine ⟨⟨?_, sound.2.1⟩, ?_⟩
              · simpa [hrest] using sound.1
              · simpa [Row.term, hrest] using sound.2.2

/-- Every valid row is accepted exactly. -/
theorem parseRow?_complete
    {program : CTS.Program} {label : ActionLabel program}
    {row : Row}
    (valid : Row.Valid (PrimitiveLocalResponse.emitted program label) row) :
    parseRow? program label row.term = some row := by
  cases row with
  | first position bit rest accumulator duplicate histories =>
      rcases valid with ⟨hdrop, hlength⟩
      have hfirst : parseFirst? program label
          (Term.applyArgs (firstRow bit rest accumulator duplicate) histories) =
        some ⟨histories.length, bit, rest, accumulator, duplicate, histories⟩ :=
        parseFirstWord?_complete
          (PrimitiveLocalResponse.emitted program label) bit rest accumulator
          duplicate histories (by simpa [hlength] using hdrop)
      simp [parseRow?, Row.term, hfirst, hlength]
  | secondNonfinal position bit next tail accumulator currentHistory histories =>
      rcases valid with ⟨hdrop, hlength⟩
      have hsecond : parseSecond? program label
          (Term.applyArgs
            (secondRow (next :: tail) accumulator currentHistory) histories) =
        some ⟨histories.length, bit, next :: tail, accumulator,
          currentHistory, histories⟩ :=
        parseSecondWord?_complete_nonfinal
          (PrimitiveLocalResponse.emitted program label) bit next tail
          accumulator currentHistory histories (by simpa [hlength] using hdrop)
      have hfirst : parseFirst? program label
          (Term.applyArgs
            (secondRow (next :: tail) accumulator currentHistory) histories) =
          none :=
        parseFirstWord?_none_of_parseSecondWord?_some hsecond
      simp [parseRow?, Row.term, hfirst, hsecond, hlength]
  | secondFinal position bit accumulator currentHistory histories =>
      rcases valid with ⟨hdrop, hlength⟩
      have hsecond : parseSecond? program label
          (Term.applyArgs (secondRow [] accumulator currentHistory) histories) =
        some ⟨histories.length, bit, [], accumulator, currentHistory,
          histories⟩ :=
        parseSecondWord?_complete_final
          (PrimitiveLocalResponse.emitted program label) bit accumulator
          currentHistory histories (by simpa [hlength] using hdrop)
      have hfirst : parseFirst? program label
          (Term.applyArgs (secondRow [] accumulator currentHistory) histories) =
          none :=
        parseFirstWord?_none_of_parseSecondWord?_some hsecond
      simp [parseRow?, Row.term, hfirst, hsecond, hlength]

/-- Every parsed row has a genuine zero-based appendant position. -/
theorem Row.position_lt_emitted_length
    {program : CTS.Program} {label : ActionLabel program}
    {term : Term} {row : Row}
    (h : parseRow? program label term = some row) :
    row.position < (PrimitiveLocalResponse.emitted program label).length := by
  have valid := (parseRow?_sound h).1
  cases row with
  | first position bit rest accumulator duplicate histories =>
      rcases valid with ⟨hdrop, _⟩
      apply Nat.lt_of_not_ge
      intro hle
      simp only [Row.position] at hle
      have hempty := List.drop_eq_nil_of_le hle
      rw [hempty] at hdrop
      contradiction
  | secondNonfinal position bit next tail accumulator currentHistory histories =>
      rcases valid with ⟨hdrop, _⟩
      apply Nat.lt_of_not_ge
      intro hle
      simp only [Row.position] at hle
      have hempty := List.drop_eq_nil_of_le hle
      rw [hempty] at hdrop
      contradiction
  | secondFinal position bit accumulator currentHistory histories =>
      rcases valid with ⟨hdrop, _⟩
      apply Nat.lt_of_not_ge
      intro hle
      simp only [Row.position] at hle
      have hempty := List.drop_eq_nil_of_le hle
      rw [hempty] at hdrop
      contradiction

/-- A valid row's local address reaches exactly its registered focus. -/
theorem Row.focus_subterm
    {emitted : List Bool} {row : Row}
    (valid : row.Valid emitted) :
    row.term.subterm? row.localAddress = some row.focus := by
  cases row with
  | first position bit rest accumulator duplicate histories =>
      rcases valid with ⟨hdrop, hlength⟩
      have parsed := parseFirstWord?_complete emitted bit rest accumulator
        duplicate histories (by simpa [hlength] using hdrop)
      simpa [Row.term, Row.localAddress, Row.focus] using
        FirstView.redex_subterm parsed
  | secondNonfinal position bit next tail accumulator currentHistory histories =>
      rcases valid with ⟨hdrop, hlength⟩
      have parsed := parseSecondWord?_complete_nonfinal emitted bit next tail
        accumulator currentHistory histories (by simpa [hlength] using hdrop)
      simpa [Row.term, Row.localAddress, Row.focus] using
        SecondView.nonfinal_redex_subterm parsed (by rfl)
  | secondFinal position bit accumulator currentHistory histories =>
      simp only [Row.term, Row.localAddress, Row.focus]
      unfold historyPrefixAddress
      rw [ActionParser.subterm?_applyArgs_prefixLeft]
      rfl

/-- First and nonfinal rows contract to their exact local target. -/
theorem Row.contracts_of_target?_eq_some
    {emitted : List Bool} {row : Row} {target : Term}
    (valid : row.Valid emitted) (htarget : row.target? = some target) :
    row.term.contractAt? row.localAddress = some target := by
  cases row with
  | first position bit rest accumulator duplicate histories =>
      rcases valid with ⟨hdrop, hlength⟩
      simp only [Row.target?, Option.some.injEq] at htarget
      subst target
      have parsed := parseFirstWord?_complete emitted bit rest accumulator
        duplicate histories (by simpa [hlength] using hdrop)
      simpa [Row.term, Row.localAddress] using FirstView.contracts parsed
  | secondNonfinal position bit next tail accumulator currentHistory histories =>
      rcases valid with ⟨hdrop, hlength⟩
      simp only [Row.target?, Option.some.injEq] at htarget
      subst target
      have parsed := parseSecondWord?_complete_nonfinal emitted bit next tail
        accumulator currentHistory histories (by simpa [hlength] using hdrop)
      simpa [Row.term, Row.localAddress] using
        SecondView.nonfinal_contracts parsed (by rfl)
  | secondFinal position bit accumulator currentHistory histories =>
      simp [Row.target?] at htarget

/-- The registered focus contracts to the exact selected replacement. -/
theorem Row.focus_contractRoot?_of_replacement?_eq_some
    {row : Row} {replacement : Term}
    (h : row.replacement? = some replacement) :
    row.focus.contractRoot? = some replacement := by
  cases row with
  | first position bit rest accumulator duplicate histories =>
      simp only [Row.replacement?, Option.some.injEq] at h
      subst replacement
      rfl
  | secondNonfinal position bit next tail accumulator currentHistory histories =>
      simp only [Row.replacement?, Option.some.injEq] at h
      subst replacement
      rfl
  | secondFinal position bit accumulator currentHistory histories =>
      simp [Row.replacement?] at h

/-- The final row's would-be next-Push address is locally noncontractible. -/
theorem Row.final_contractAt?_none
    (position : Nat) (bit : Bool) (accumulator currentHistory : Term)
    (histories : List Term) :
    (Row.secondFinal position bit accumulator currentHistory histories).term.contractAt?
        (Row.secondFinal position bit accumulator currentHistory
          histories).localAddress = none := by
  simpa [Row.term, Row.localAddress] using
    contractAt?_secondRow_final_none accumulator currentHistory histories

/-! ## Fresh Local shell and route placement -/

/-- The literal dispatcher-field address in a Local shell. -/
def shellDispatcherAddress : Address := [.left, .left, .right]

/-- Information recovered at one active fresh Local endpoint. -/
structure ActiveView (program : CTS.Program) where
  bits : List Bool
  continuation : Term
  route : Dispatcher.Route
  label : ActionLabel program
  row : Row
  deriving BEq, DecidableEq, Repr

def ActiveView.phase {program : CTS.Program} (view : ActiveView program) :
    CTS.Phase program :=
  view.label.1

def ActiveView.frontBit {program : CTS.Program} (view : ActiveView program) : Bool :=
  view.label.2

/-- Address of the Push focus relative to the active Local root. -/
def ActiveView.focusAddress {program : CTS.Program} (view : ActiveView program) :
    Address :=
  shellDispatcherAddress ++
    (routeResponseAddress view.route ++ view.row.localAddress)

/-- Declarative independent-hole shape certified by an active parse. -/
inductive ActiveShape
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (view : ActiveView program) (term : Term) : Prop where
  | intro
      (haltField dispatcher seedAudit continuationAudit : Term)
      (halt : CheckpointDecoder.HaltShape .fresh haltField)
      (routeShape : RouteGrammar.ActivatedRoute (selectedAction program) tree
        view.route view.label view.row.term dispatcher)
      (rowValid : view.row.Valid
        (PrimitiveLocalResponse.emitted program view.label))
      (source_eq : term = CheckpointDecoder.openShell haltField dispatcher
        (word view.bits) seedAudit view.continuation continuationAudit) :
      ActiveShape program tree view term

theorem ActiveShape.rowValid
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {view : ActiveView program} {term : Term}
    (shape : ActiveShape program tree view term) :
    view.row.Valid (PrimitiveLocalResponse.emitted program view.label) := by
  cases shape with
  | intro haltField dispatcher seedAudit continuationAudit halt route valid source =>
      exact valid

theorem ActiveShape.source_eq
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {view : ActiveView program} {term : Term}
    (shape : ActiveShape program tree view term) :
    ∃ haltField dispatcher seedAudit continuationAudit,
      CheckpointDecoder.HaltShape .fresh haltField ∧
      RouteGrammar.ActivatedRoute (selectedAction program) tree
        view.route view.label view.row.term dispatcher ∧
      term = CheckpointDecoder.openShell haltField dispatcher
        (word view.bits) seedAudit view.continuation continuationAudit := by
  cases shape with
  | intro haltField dispatcher seedAudit continuationAudit halt route valid source =>
      exact ⟨haltField, dispatcher, seedAudit, continuationAudit,
        halt, route, source⟩

/-- Recognize the fresh halt prefix while leaving its audit opaque. -/
def parseFreshHalt? : Term → Option Term
  | .app fn audit => if fn = haltCode then some audit else none
  | .s => none

/-- Fresh-halt success reconstructs the exact independent-audit field. -/
theorem parseFreshHalt?_sound
    {field audit : Term} (h : parseFreshHalt? field = some audit) :
    field = freshHField audit := by
  cases field with
  | s => simp [parseFreshHalt?] at h
  | app fn foundAudit =>
      simp only [parseFreshHalt?] at h
      split at h
      next hfn =>
        have haudit := Option.some.inj h
        subst audit
        subst fn
        rfl
      next => contradiction

@[simp]
theorem parseFreshHalt?_fresh (audit : Term) :
    parseFreshHalt? (freshHField audit) = some audit := by
  simp [parseFreshHalt?, freshHField]

/-- Parse a fresh Local shell, its completed route, and its current Push row. -/
def parseActive?
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Option (ActiveView program) :=
  match term with
  | .app
      (.app
        (.app haltField dispatcher)
        (.app (.app .s seedPayload) _seedAudit))
      (.app continuation _continuationAudit) =>
      match parseFreshHalt? haltField with
      | none => none
      | some _haltAudit =>
          match CheckpointDecoder.parseWord? seedPayload with
          | none => none
          | some bits =>
              match DispatchParser.parseRouteDetailed
                  (selectedAction program) tree dispatcher with
              | none => none
              | some route =>
                  match parseRow? program route.label route.response with
                  | none => none
                  | some row =>
                      some ⟨bits, continuation, route.route, route.label, row⟩
  | _ => none

/-- Active parsing is sound for the exact fresh-shell/route/row grammar. -/
theorem parseActive?_sound
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : ActiveView program}
    (h : parseActive? program tree term = some view) :
    ActiveShape program tree view term := by
  unfold parseActive? at h
  split at h <;> try contradiction
  next source haltField dispatcher seedPayload seedAudit continuation
      continuationAudit =>
    generalize hhalt : parseFreshHalt? haltField = haltResult at h
    cases haltResult with
    | none => contradiction
    | some haltAudit =>
        simp only at h
        generalize hword : CheckpointDecoder.parseWord? seedPayload =
          wordResult at h
        cases wordResult with
        | none => simp [hword] at h
        | some bits =>
            simp only at h
            generalize hroute : DispatchParser.parseRouteDetailed
              (selectedAction program) tree dispatcher = routeResult at h
            cases routeResult with
            | none => simp [hroute] at h
            | some route =>
                simp only at h
                generalize hrow : parseRow? program route.label
                  route.response = rowResult at h
                cases rowResult with
                | none => simp [hrow] at h
                | some row =>
                    simp only at h
                    have hview := Option.some.inj h
                    subst view
                    have rowSound := parseRow?_sound hrow
                    have haltEq := parseFreshHalt?_sound hhalt
                    refine ⟨haltField, dispatcher, seedAudit,
                      continuationAudit, ?_, ?_, rowSound.1, ?_⟩
                    · rw [haltEq]
                      exact .fresh haltAudit
                    · have routeShape :=
                        DispatchParser.parseRouteDetailed_sound hroute
                      simpa [rowSound.2] using routeShape
                    · rw [CheckpointDecoder.parseWord?_sound hword]
                      rfl

/-- Every exact fresh-shell/route/valid-row shape is parsed completely. -/
theorem parseActive?_complete
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : ActiveView program}
    (shape : ActiveShape program tree view term) :
    parseActive? program tree term = some view := by
  rcases shape with
    ⟨haltField, dispatcher, seedAudit, continuationAudit, halt, routeShape,
      rowValid, rfl⟩
  cases halt with
  | fresh haltAudit =>
      have hroute : DispatchParser.parseRouteDetailed
          (selectedAction program) tree dispatcher =
          some ⟨view.route, view.label, view.row.term⟩ :=
        DispatchParser.parseRouteDetailed_complete routeShape
      have hrow := parseRow?_complete rowValid
      simp [parseActive?, CheckpointDecoder.openShell, parseFreshHalt?,
        freshHField, seedCode, CheckpointDecoder.parseWord?_word, hroute, hrow]

/-- A parsed active row's position is bounded by its selected appendant. -/
theorem ActiveView.position_lt_emitted_length
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : ActiveView program}
    (h : parseActive? program tree term = some view) :
    view.row.position <
      (PrimitiveLocalResponse.emitted program view.label).length := by
  have valid := (parseActive?_sound h).rowValid
  have parsed := parseRow?_complete valid
  exact Row.position_lt_emitted_length parsed

/-- The composed active-root address reaches the registered Push focus. -/
theorem ActiveShape.focus_subterm
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : ActiveView program}
    (shape : ActiveShape program tree view term) :
    term.subterm? view.focusAddress = some view.row.focus := by
  rcases shape.source_eq with
    ⟨haltField, dispatcher, seedAudit, continuationAudit, halt,
      routeShape, source⟩
  rw [source, CheckpointDecoder.openShell_word]
  unfold ActiveView.focusAddress shellDispatcherAddress
  rw [CarrierDecoder.subterm?_append]
  rw [Carrier.shell_dispatcher_subterm]
  change dispatcher.subterm?
    (routeResponseAddress view.route ++ view.row.localAddress) =
      some view.row.focus
  rw [CarrierDecoder.subterm?_append]
  rw [routeResponseAddress_subterm routeShape]
  exact Row.focus_subterm shape.rowValid

/-- Shell audit holes do not affect the recovered active header or row. -/
theorem parseActive?_shell_audits_opaque
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation dispatcher : Term)
    (firstHaltAudit firstSeedAudit firstContinuationAudit
      secondHaltAudit secondSeedAudit secondContinuationAudit : Term) :
    parseActive? program tree
        (Carrier.activeShell bits continuation (freshHField firstHaltAudit)
          dispatcher firstSeedAudit firstContinuationAudit) =
      parseActive? program tree
        (Carrier.activeShell bits continuation (freshHField secondHaltAudit)
          dispatcher secondSeedAudit secondContinuationAudit) := by
  simp [parseActive?, Carrier.activeShell, Carrier.shell,
    parseFreshHalt?, freshHField, seedCode,
    CheckpointDecoder.parseWord?_word]

/-! ## Bare whole-term parser -/

/-- Result of one root-starting whole-term Push classification. -/
structure View (program : CTS.Program) where
  active : Term
  context : Context
  history : List (CheckpointDecoder.LocalView program)
  endpoint : ActiveView program
  deriving BEq, DecidableEq, Repr

/-- Root-relative occurrence of the current or would-be next Push focus. -/
def View.focusAddress {program : CTS.Program} (view : View program) : Address :=
  RootResetSelectorContract.contextAddress view.context ++
    view.endpoint.focusAddress

def View.stage {program : CTS.Program} (view : View program) : Stage :=
  view.endpoint.row.stage

def View.phase {program : CTS.Program} (view : View program) :
    CTS.Phase program :=
  view.endpoint.phase

def View.frontBit {program : CTS.Program} (view : View program) : Bool :=
  view.endpoint.frontBit

def View.label {program : CTS.Program} (view : View program) :
    ActionLabel program :=
  view.endpoint.label

def View.position {program : CTS.Program} (view : View program) : Nat :=
  view.endpoint.row.position

/-- A selected contraction exists on exactly the first and nonfinal rows. -/
def View.selectedAddress {program : CTS.Program} (view : View program) :
    Option Address :=
  match view.endpoint.row.stage with
  | .first | .secondNonfinal => some view.focusAddress
  | .secondFinal => none

/-- Parse the current bare term from its root with no supplied role or cursor. -/
def parse?
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Option (View program) :=
  let decomposition := peelMarked program tree term
  match parseActive? program tree decomposition.active with
  | none => none
  | some endpoint =>
      some ⟨decomposition.active, decomposition.context,
        decomposition.history, endpoint⟩

/-- Declarative whole placement: unique marked prefix plus active Push shape. -/
structure WholeShape
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (view : View program) (term : Term) : Prop where
  markedPrefix :
    MarkedPrefix program tree term view.active view.context view.history
  activeShape : ActiveShape program tree view.endpoint view.active

/-- Whole-parser success supplies the complete placement grammar. -/
theorem parse?_sound
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program}
    (h : parse? program tree term = some view) :
    WholeShape program tree view term := by
  dsimp [parse?] at h
  generalize hactive : parseActive? program tree
    (peelMarked program tree term).active = activeResult at h
  cases activeResult with
  | none => simp [hactive] at h
  | some endpoint =>
      simp only at h
      have hview := Option.some.inj h
      subst view
      exact ⟨peelMarked_sound program tree term, parseActive?_sound hactive⟩

/-- Every declaratively placed whole Push row is accepted exactly. -/
theorem parse?_complete
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program}
    (shape : WholeShape program tree view term) :
    parse? program tree term = some view := by
  have unique := markedPrefix_eq_peelMarked shape.markedPrefix
  rcases view with ⟨active, context, history, endpoint⟩
  simp only at unique shape ⊢
  rcases unique with ⟨activeEq, contextEq, historyEq⟩
  subst active
  subst context
  subst history
  simp only [parse?]
  rw [parseActive?_complete shape.activeShape]

/-- Whole parsing is definitionally a function of the current bare term. -/
theorem parse?_unique
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {first second : View program}
    (hfirst : parse? program tree term = some first)
    (hsecond : parse? program tree term = some second) :
    first = second := by
  rw [hfirst] at hsecond
  exact Option.some.inj hsecond

/-- Historical Locals outside a parsed Push row are complete and marked. -/
theorem parse?_history_marked
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program}
    (h : parse? program tree term = some view) :
    MarkedHistory program view.history :=
  (parse?_sound h).markedPrefix.historical_views_marked

/-- The whole root-relative address reaches the exact current Push focus. -/
theorem View.focus_subterm
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program}
    (h : parse? program tree term = some view) :
    term.subterm? view.focusAddress = some view.endpoint.row.focus := by
  have shape := parse?_sound h
  rw [← shape.markedPrefix.source_eq]
  unfold View.focusAddress
  rw [RootResetWholeStageClassifier.subterm?_plug_contextAddress_append]
  exact shape.activeShape.focus_subterm

/--
For a first or nonfinal row, whole contraction is exactly replacement of the
registered focus by the local target.
-/
theorem View.contracts_of_replacement?_eq_some
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program} {replacement : Term}
    (h : parse? program tree term = some view)
    (hreplacement : view.endpoint.row.replacement? = some replacement) :
    ∃ target,
      term.replace? view.focusAddress replacement = some target ∧
      term.contractAt? view.focusAddress = some target := by
  have wholeFocus := view.focus_subterm h
  have hroot :=
    Row.focus_contractRoot?_of_replacement?_eq_some hreplacement
  obtain ⟨context, plug, replace⟩ := Term.context_of_subterm wholeFocus
  refine ⟨context.plug replacement, replace replacement, ?_⟩
  unfold Term.contractAt?
  rw [wholeFocus]
  simp only
  rw [hroot]
  exact replace replacement

/-- A present local replacement produces the same root-relative selected address. -/
theorem View.selectedAddress_eq_some_of_replacement?_eq_some
    {program : CTS.Program} {view : View program} {replacement : Term}
    (h : view.endpoint.row.replacement? = some replacement) :
    view.selectedAddress = some view.focusAddress := by
  cases hrow : view.endpoint.row with
  | first position bit rest accumulator duplicate histories =>
      simp [View.selectedAddress, hrow, Row.stage]
  | secondNonfinal position bit next tail accumulator currentHistory histories =>
      simp [View.selectedAddress, hrow, Row.stage]
  | secondFinal position bit accumulator currentHistory histories =>
      simp [Row.replacement?, hrow] at h

/-- Every selected whole Push address is certified by an exact contraction. -/
theorem View.selected_contracts
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program} {replacement : Term}
    (h : parse? program tree term = some view)
    (hreplacement : view.endpoint.row.replacement? = some replacement) :
    ∃ target,
      view.selectedAddress = some view.focusAddress ∧
      term.replace? view.focusAddress replacement = some target ∧
      term.contractAt? view.focusAddress = some target := by
  obtain ⟨target, replaced, contracts⟩ :=
    view.contracts_of_replacement?_eq_some h hreplacement
  exact ⟨target,
    view.selectedAddress_eq_some_of_replacement?_eq_some hreplacement,
    replaced, contracts⟩

/-- The final row's whole registered next-Push address is noncontractible. -/
theorem View.final_contractAt?_none
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program}
    (h : parse? program tree term = some view)
    (hfinal : view.endpoint.row.stage = .secondFinal) :
    term.contractAt? view.focusAddress = none := by
  have shape := parse?_sound h
  have focus := view.focus_subterm h
  cases hrow : view.endpoint.row with
  | first position bit rest accumulator duplicate histories =>
      simp [Row.stage, hrow] at hfinal
  | secondNonfinal position bit next tail accumulator currentHistory histories =>
      simp [Row.stage, hrow] at hfinal
  | secondFinal position bit accumulator currentHistory histories =>
      rw [hrow] at focus
      unfold Term.contractAt?
      rw [focus]
      rfl

/-- A final row has no selected Push contraction, while retaining its focus address. -/
theorem View.selectedAddress_none_of_final
    {program : CTS.Program} {view : View program}
    (hfinal : view.endpoint.row.stage = .secondFinal) :
    view.selectedAddress = none := by
  cases hrow : view.endpoint.row with
  | first position bit rest accumulator duplicate histories =>
      simp [Row.stage, hrow] at hfinal
  | secondNonfinal position bit next tail accumulator currentHistory histories =>
      simp [Row.stage, hrow] at hfinal
  | secondFinal position bit accumulator currentHistory histories =>
      simp [View.selectedAddress, hrow, Row.stage]

/-! ## Generated response-row completeness -/

/-- Exact active Local containing one generated response row. -/
def generatedActive
    {program : CTS.Program}
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation haltAudit seedAudit continuationAudit : Term)
    (route : Dispatcher.Route) (carrier response : Term) : Term :=
  Carrier.activeShell bits continuation (freshHField haltAudit)
    (PrimitiveRoute.withResponse (selectedAction program) tree route carrier
      response)
    seedAudit continuationAudit

/-- Every generated first Push row is recovered at its exact position. -/
theorem parseActive?_generated_first
    (program : CTS.Program)
    {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    (path : Dispatcher.HasRoute tree route label)
    (bits : List Bool) (continuation haltAudit seedAudit continuationAudit : Term)
    (carrier : Term) (position : Nat) (bit : Bool) (rest : List Bool)
    (accumulator duplicate : Term) (histories : List Term)
    (hlength : histories.length = position)
    (hdrop : (PrimitiveLocalResponse.emitted program label).drop position =
      bit :: rest) :
    parseActive? program tree
        (generatedActive tree bits continuation haltAudit seedAudit
          continuationAudit route carrier
          (Term.applyArgs (firstRow bit rest accumulator duplicate) histories)) =
      some ⟨bits, continuation, route, label,
        .first position bit rest accumulator duplicate histories⟩ := by
  apply parseActive?_complete
  refine ⟨freshHField haltAudit,
    PrimitiveRoute.withResponse (selectedAction program) tree route carrier
      (Term.applyArgs (firstRow bit rest accumulator duplicate) histories),
    seedAudit, continuationAudit, .fresh haltAudit, ?_, ?_, rfl⟩
  · exact PrimitiveRoute.withResponse_activated path carrier _
  · exact ⟨hdrop, hlength⟩

/-- Every generated nonfinal second row is recovered at its exact position. -/
theorem parseActive?_generated_second_nonfinal
    (program : CTS.Program)
    {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    (path : Dispatcher.HasRoute tree route label)
    (bits : List Bool) (continuation haltAudit seedAudit continuationAudit : Term)
    (carrier : Term) (position : Nat) (bit next : Bool) (tail : List Bool)
    (accumulator currentHistory : Term) (histories : List Term)
    (hlength : histories.length = position)
    (hdrop : (PrimitiveLocalResponse.emitted program label).drop position =
      bit :: next :: tail) :
    parseActive? program tree
        (generatedActive tree bits continuation haltAudit seedAudit
          continuationAudit route carrier
          (Term.applyArgs
            (secondRow (next :: tail) accumulator currentHistory) histories)) =
      some ⟨bits, continuation, route, label,
        .secondNonfinal position bit next tail accumulator currentHistory
          histories⟩ := by
  apply parseActive?_complete
  refine ⟨freshHField haltAudit,
    PrimitiveRoute.withResponse (selectedAction program) tree route carrier
      (Term.applyArgs
        (secondRow (next :: tail) accumulator currentHistory) histories),
    seedAudit, continuationAudit, .fresh haltAudit, ?_, ?_, rfl⟩
  · exact PrimitiveRoute.withResponse_activated path carrier _
  · exact ⟨hdrop, hlength⟩

/-- Every generated final second row is recovered at its exact position. -/
theorem parseActive?_generated_second_final
    (program : CTS.Program)
    {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    (path : Dispatcher.HasRoute tree route label)
    (bits : List Bool) (continuation haltAudit seedAudit continuationAudit : Term)
    (carrier : Term) (position : Nat) (bit : Bool)
    (accumulator currentHistory : Term) (histories : List Term)
    (hlength : histories.length = position)
    (hdrop : (PrimitiveLocalResponse.emitted program label).drop position =
      [bit]) :
    parseActive? program tree
        (generatedActive tree bits continuation haltAudit seedAudit
          continuationAudit route carrier
          (Term.applyArgs (secondRow [] accumulator currentHistory) histories)) =
      some ⟨bits, continuation, route, label,
        .secondFinal position bit accumulator currentHistory histories⟩ := by
  apply parseActive?_complete
  refine ⟨freshHField haltAudit,
    PrimitiveRoute.withResponse (selectedAction program) tree route carrier
      (Term.applyArgs (secondRow [] accumulator currentHistory) histories),
    seedAudit, continuationAudit, .fresh haltAudit, ?_, ?_, rfl⟩
  · exact PrimitiveRoute.withResponse_activated path carrier _
  · exact ⟨hdrop, hlength⟩

/-- Generated active rows lift through any canonical marked-history prefix. -/
theorem parse?_of_markedPrefix_generated
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term active : Term} {context : Context}
    {history : List (CheckpointDecoder.LocalView program)}
    {endpoint : ActiveView program}
    (marked : MarkedPrefix program tree term active context history)
    (activeShape : ActiveShape program tree endpoint active) :
    parse? program tree term = some ⟨active, context, history, endpoint⟩ := by
  apply parse?_complete
  exact ⟨marked, activeShape⟩

/-! ## Registered-stage disjointness -/

theorem Stage.first_ne_secondNonfinal : Stage.first ≠ Stage.secondNonfinal := by
  decide

theorem Stage.first_ne_secondFinal : Stage.first ≠ Stage.secondFinal := by
  decide

theorem Stage.secondNonfinal_ne_secondFinal :
    Stage.secondNonfinal ≠ Stage.secondFinal := by
  decide

/-- First-row success forces rejection by the complete second-row parser. -/
theorem parseSecond?_none_of_parseRow?_first
    {program : CTS.Program} {label : ActionLabel program}
    {term : Term} {position : Nat} {bit : Bool} {rest : List Bool}
    {accumulator duplicate : Term} {histories : List Term}
    (h : parseRow? program label term = some
      (.first position bit rest accumulator duplicate histories)) :
    parseSecond? program label term = none := by
  unfold parseRow? at h
  split at h
  next view hfirst =>
    exact parseSecondWord?_none_of_parseFirstWord?_some hfirst
  next hfirst =>
    split at h <;> try contradiction
    next view hsecond =>
      cases hrest : view.rest with
      | nil =>
          simp only [hrest] at h
          have equal := Option.some.inj h
          cases equal
      | cons next tail =>
          simp only [hrest] at h
          have equal := Option.some.inj h
          cases equal

/-- Any second-row success forces rejection by the first-row parser. -/
theorem parseFirst?_none_of_parseRow?_second
    {program : CTS.Program} {label : ActionLabel program}
    {term : Term} {row : Row}
    (h : parseRow? program label term = some row)
    (hsecond : row.stage ≠ .first) :
    parseFirst? program label term = none := by
  unfold parseRow? at h
  split at h
  next view hfirst =>
    have hrow := Option.some.inj h
    subst row
    exact False.elim (hsecond rfl)
  next hfirst => exact hfirst

end PureSFormal.Research.RootResetWholeAppenderStages
