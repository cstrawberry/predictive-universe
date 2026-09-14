import PureSFormal.Research.RootResetWholeDispatcherStages
import PureSFormal.Research.RootResetWholeAppenderStages
import PureSFormal.Research.RootResetResponseBoundaryStages
import PureSFormal.Research.RootResetClockFuelCanonicalGrammar

/-!
# Composite registered root-reset stage classifier

The registry is the union of four declarative whole-term languages:
dispatcher-node rows, Push rows, complete-response boundaries, and canonical
clock/fuel rows.  Classification starts at the current bare root and receives
only the fixed program and dispatcher layout.

The raw family languages may overlap.  `RegisteredShape` resolves those
overlaps by semantic non-membership in every earlier declarative language.
Its constructors contain no composite-parser premise, so completeness is
stated against an independent grammar.  Canonical clock and canonical fuel
languages are term-disjoint without a priority premise.

Canonical fuel checking verifies fixed environment wrappers and admissible
continuation arities.  It never compares two opaque continuation copies.
The registered union carries no scheduler-reachability, selected-step closure,
or complete-walker premise.  Frame R0/R1/R2, activated-route,
selected-action, pending-frame, accumulator-clean, accumulator-close, and
commit-ready tags from `RootResetWholeStageClassifier` lie outside this
eighteen-stage union.
-/

namespace PureSFormal.Research.RootResetCompositeStageRegistry

open PureSFormal.PureS
open RootResetReachableStageGrammar
open RootResetClockFuelStages
open RootResetClockFuelCanonicalGrammar

namespace DispatcherStage

abbrev View := RootResetWholeDispatcherStages.View
abbrev WholeShape := RootResetWholeDispatcherStages.WholeShape

end DispatcherStage

namespace AppenderStage

abbrev View := RootResetWholeAppenderStages.View
abbrev WholeShape := RootResetWholeAppenderStages.WholeShape

end AppenderStage

namespace ResponseStage

abbrev View := RootResetResponseBoundaryStages.View
abbrev WholeShape := RootResetResponseBoundaryStages.WholeShape

end ResponseStage

/-! ## Canonical recursive fuel parser -/

/-- Fixed-field check on the final canonical fuel endpoint. -/
def canonicalFuelEndpointFields (actions : Term) : FuelEndpoint → Bool
  | .row row => canonicalFuelRowFields actions row
  | .carrier base =>
      admissibleField base.outerContinuation &&
        admissibleField base.innerContinuation

/--
The recursive syntax parser checks every pending environment wrapper.
`canonicalFuelViewFields` checks each independent continuation field and the
final endpoint fields.
-/
def canonicalFuelViewFields (actions : Term) (view : FuelView) : Bool :=
  view.layers.all (fun layer => admissibleField layer.continuation) &&
    canonicalFuelEndpointFields actions view.endpoint

/-- Successful recursive fuel parsing certifies every pending wrapper. -/
theorem parseFuelActive?_pendingLayersValid
    {actions term : Term} {view : FuelView}
    (h : parseFuelActive? actions term = some view) :
    PendingLayersValid actions view.layers := by
  induction term generalizing view with
  | s =>
      simp only [parseFuelActive?] at h
      rcases RootResetStageRegistry.optionMap_eq_some h with
        ⟨endpoint, _endpointParse, viewEq⟩
      rw [← viewEq]
      trivial
  | app fn child fnIH childIH =>
      cases fn with
      | s =>
          simp only [parseFuelActive?] at h
          rcases RootResetStageRegistry.optionMap_eq_some h with
            ⟨endpoint, _endpointParse, viewEq⟩
          rw [← viewEq]
          trivial
      | app environment continuation =>
          generalize environmentEq :
            CheckpointDecoder.parseEnvironment? actions environment =
              environmentResult
          cases environmentResult with
          | none =>
              rw [parseFuelActive?, environmentEq] at h
              rcases RootResetStageRegistry.optionMap_eq_some h with
                ⟨endpoint, _endpointParse, viewEq⟩
              rw [← viewEq]
              trivial
          | some seedPayload =>
              generalize childEq : parseFuelActive? actions child = childResult
              cases childResult with
              | none =>
                  rw [parseFuelActive?, environmentEq, childEq] at h
                  rcases RootResetStageRegistry.optionMap_eq_some h with
                    ⟨endpoint, _endpointParse, viewEq⟩
                  rw [← viewEq]
                  trivial
              | some inner =>
                  rw [parseFuelActive?, environmentEq, childEq] at h
                  have viewEq := Option.some.inj h
                  rw [← viewEq]
                  exact ⟨CheckpointDecoder.parseEnvironment?_sound environmentEq,
                    childIH childEq⟩

/-- Boolean pending-continuation checks are exactly their semantic predicate. -/
theorem canonicalPendingLayers_of_valid
    {actions : Term} {layers : List PendingLayer}
    (valid : PendingLayersValid actions layers)
    (fields : layers.all
      (fun layer => admissibleField layer.continuation) = true) :
    CanonicalPendingLayers actions layers := by
  induction layers with
  | nil => trivial
  | cons layer layers ih =>
      rcases valid with ⟨environment, tailValid⟩
      simp only [List.all_cons, Bool.and_eq_true] at fields
      exact ⟨⟨environment,
          (admissibleField_eq_true_iff layer.continuation).mp fields.1⟩,
        ih tailValid fields.2⟩

/-- Semantic pending layers satisfy the independent continuation checks. -/
theorem canonicalPendingLayers_fields
    {actions : Term} {layers : List PendingLayer}
    (canonical : CanonicalPendingLayers actions layers) :
    layers.all (fun layer => admissibleField layer.continuation) = true := by
  induction layers with
  | nil => rfl
  | cons layer layers ih =>
      simp only [CanonicalPendingLayers] at canonical
      simp only [List.all_cons, Bool.and_eq_true]
      exact ⟨(admissibleField_eq_true_iff layer.continuation).mpr
          canonical.1.2,
        ih canonical.2⟩

/-- Endpoint field checks are exactly the endpoint part of the canonical grammar. -/
theorem canonicalFuelEndpointFields_eq_true_iff
    (actions : Term) (endpoint : FuelEndpoint) :
    canonicalFuelEndpointFields actions endpoint = true ↔
      match endpoint with
      | .row row => CanonicalFuelRow actions row
      | .carrier base => CanonicalOpenBase base := by
  cases endpoint with
  | row row =>
      exact canonicalFuelRowFields_eq_true_iff actions row
  | carrier base =>
      simp [canonicalFuelEndpointFields, CanonicalOpenBase,
        Bool.and_eq_true, admissibleField_eq_true_iff]

/-- A successful raw parse plus the Boolean check yields the semantic grammar. -/
theorem canonicalFuelViewFields_sound
    {actions term : Term} {view : FuelView}
    (parsed : parseFuelActive? actions term = some view)
    (fields : canonicalFuelViewFields actions view = true) :
    CanonicalFuelView actions view := by
  simp only [canonicalFuelViewFields, Bool.and_eq_true] at fields
  exact ⟨canonicalPendingLayers_of_valid
      (parseFuelActive?_pendingLayersValid parsed) fields.1,
    (canonicalFuelEndpointFields_eq_true_iff actions view.endpoint).mp
      fields.2⟩

/-- Every semantic canonical fuel view satisfies the executable field check. -/
theorem canonicalFuelViewFields_complete
    {actions : Term} {view : FuelView}
    (canonical : CanonicalFuelView actions view) :
    canonicalFuelViewFields actions view = true := by
  simp only [canonicalFuelViewFields, Bool.and_eq_true]
  exact ⟨canonicalPendingLayers_fields canonical.layers,
    (canonicalFuelEndpointFields_eq_true_iff actions view.endpoint).mpr
      canonical.endpoint⟩

/-- Recursive role-free parsing followed by the canonical field check. -/
def parseCanonicalFuelActive? (actions term : Term) : Option FuelView :=
  match parseFuelActive? actions term with
  | none => none
  | some view =>
      if canonicalFuelViewFields actions view then some view else none

/-- The strict recursive parser reconstructs a semantic canonical fuel view. -/
theorem parseCanonicalFuelActive?_sound
    {actions term : Term} {view : FuelView}
    (h : parseCanonicalFuelActive? actions term = some view) :
    term = view.term actions ∧ CanonicalFuelView actions view := by
  unfold parseCanonicalFuelActive? at h
  generalize rawEq : parseFuelActive? actions term = rawResult at h
  cases rawResult with
  | none => simp at h
  | some found =>
      by_cases fields : canonicalFuelViewFields actions found = true
      · simp [fields] at h
        subst found
        exact ⟨parseFuelActive?_sound rawEq,
          canonicalFuelViewFields_sound rawEq fields⟩
      · simp [fields] at h

/-- The strict recursive parser is complete on the semantic canonical grammar. -/
theorem parseCanonicalFuelActive?_complete
    {actions term : Term} {view : FuelView}
    (source : term = view.term actions)
    (canonical : CanonicalFuelView actions view) :
    parseCanonicalFuelActive? actions term = some view := by
  subst term
  rw [parseCanonicalFuelActive?, canonical.parseFuelActive]
  simp [canonicalFuelViewFields_complete canonical]

/-! ## Canonical clock/fuel union -/

/-- The two strict clock/fuel families retained by the composite registry. -/
inductive ClockFuelActive where
  | clock (view : ClockView)
  | fuel (view : FuelView)
  deriving BEq, DecidableEq, Repr

def ClockFuelActive.term (actions : Term) : ClockFuelActive → Term
  | .clock view => view.term
  | .fuel view => view.term actions

def ClockFuelActive.canonicalChildAddress : ClockFuelActive → Address
  | .clock view => view.focusAddress
  | .fuel view => view.canonicalChildAddress

def ClockFuelActive.selectedAddress? : ClockFuelActive → Option Address
  | .clock view => some view.focusAddress
  | .fuel view => view.selectedAddress?

/-- Independent semantic grammar for the disjoint canonical local union. -/
inductive ClockFuelActiveShape
    (actions : Term) : ClockFuelActive → Term → Prop where
  | clock (view : ClockView) (term : Term)
      (source : term = view.term)
      (canonical : CanonicalClock actions view) :
      ClockFuelActiveShape actions (.clock view) term
  | fuel (view : FuelView) (term : Term)
      (source : term = view.term actions)
      (canonical : CanonicalFuelView actions view) :
      ClockFuelActiveShape actions (.fuel view) term

/-- Fixed-wrapper clocks have priority over canonical fuel views. -/
def parseCanonicalClockFuelActive?
    (actions term : Term) : Option ClockFuelActive :=
  match parseCanonicalClock? actions term with
  | some view => some (.clock view)
  | none => (parseCanonicalFuelActive? actions term).map .fuel

/-- Successful strict local parsing supplies the independent priority grammar. -/
theorem parseCanonicalClockFuelActive?_sound
    {actions term : Term} {active : ClockFuelActive}
    (h : parseCanonicalClockFuelActive? actions term = some active) :
    ClockFuelActiveShape actions active term := by
  unfold parseCanonicalClockFuelActive? at h
  generalize clockEq : parseCanonicalClock? actions term = clockResult at h
  cases clockResult with
  | some clock =>
      simp at h
      subst active
      have sound := parseCanonicalClock?_sound clockEq
      exact .clock clock term sound.1 sound.2
  | none =>
      rcases RootResetStageRegistry.optionMap_eq_some h with
        ⟨fuel, fuelEq, activeEq⟩
      rw [← activeEq]
      have fuelSound := parseCanonicalFuelActive?_sound fuelEq
      exact .fuel fuel term fuelSound.1 fuelSound.2

/-- Every independent priority shape is accepted by the strict local parser. -/
theorem parseCanonicalClockFuelActive?_complete
    {actions term : Term} {active : ClockFuelActive}
    (shape : ClockFuelActiveShape actions active term) :
    parseCanonicalClockFuelActive? actions term = some active := by
  cases shape with
  | clock view term source canonical =>
      simp [parseCanonicalClockFuelActive?,
        parseCanonicalClock?_complete source canonical]
  | fuel view term source canonical =>
      have clockNone : parseCanonicalClock? actions term = none := by
        unfold parseCanonicalClock?
        rw [source, canonical.parseClock_none]
      simp [parseCanonicalClockFuelActive?, clockNone,
        parseCanonicalFuelActive?_complete source canonical]

/-- Strict local classification is unique on the current bare endpoint. -/
theorem parseCanonicalClockFuelActive?_unique
    {actions term : Term} {first second : ClockFuelActive}
    (firstParsed :
      parseCanonicalClockFuelActive? actions term = some first)
    (secondParsed :
      parseCanonicalClockFuelActive? actions term = some second) :
    first = second := by
  rw [firstParsed] at secondParsed
  exact Option.some.inj secondParsed

/-- A semantic clock alternative is accepted by the underlying clock parser. -/
theorem ClockFuelActiveShape.clock_parse
    {actions term : Term} {clock : ClockView}
    (shape : ClockFuelActiveShape actions (.clock clock) term) :
    parseClock? term = some clock := by
  cases shape with
  | clock view term source canonical =>
      rw [source]
      exact canonical.parseClock

/-- A semantic fuel alternative is accepted by the underlying fuel parser. -/
theorem ClockFuelActiveShape.fuel_parse
    {actions term : Term} {fuel : FuelView}
    (shape : ClockFuelActiveShape actions (.fuel fuel) term) :
    parseFuelActive? actions term = some fuel := by
  cases shape with
  | fuel view term source canonical =>
      rw [source]
      exact canonical.parseFuelActive

/-! ## Strict whole clock/fuel placement -/

/-- Whole-root result for the strict clock/fuel family. -/
structure ClockFuelView (program : CTS.Program) where
  activeTerm : Term
  context : Context
  history : List (CheckpointDecoder.LocalView program)
  active : ClockFuelActive
  deriving BEq, DecidableEq, Repr

def ClockFuelView.currentAddress {program : CTS.Program}
    (view : ClockFuelView program) : Address :=
  RootResetSelectorContract.contextAddress view.context ++
    view.active.canonicalChildAddress

def ClockFuelView.selectedAddress? {program : CTS.Program}
    (view : ClockFuelView program) : Option Address :=
  view.active.selectedAddress?.map fun address =>
    RootResetSelectorContract.contextAddress view.context ++ address

/-- Independent whole grammar: canonical marked prefix plus strict active row. -/
structure ClockFuelWholeShape
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (view : ClockFuelView program) (term : Term) : Prop where
  markedPrefix :
    MarkedPrefix program tree term view.activeTerm view.context view.history
  activeShape :
    ClockFuelActiveShape (compileActions program tree) view.active
      view.activeTerm

/-- Strict clock/fuel parsing starts from the whole bare root. -/
def parseClockFuel?
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Option (ClockFuelView program) :=
  let decomposition := peelMarked program tree term
  match parseCanonicalClockFuelActive? (compileActions program tree)
      decomposition.active with
  | none => none
  | some active =>
      some ⟨decomposition.active, decomposition.context,
        decomposition.history, active⟩

/-- Successful strict whole parsing supplies the independent whole grammar. -/
theorem parseClockFuel?_sound
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : ClockFuelView program}
    (h : parseClockFuel? program tree term = some view) :
    ClockFuelWholeShape program tree view term := by
  dsimp [parseClockFuel?] at h
  generalize activeEq :
    parseCanonicalClockFuelActive? (compileActions program tree)
      (peelMarked program tree term).active = activeResult at h
  cases activeResult with
  | none => simp at h
  | some active =>
      simp at h
      subst view
      exact ⟨peelMarked_sound program tree term,
        parseCanonicalClockFuelActive?_sound activeEq⟩

/-- Every strict whole grammar instance is accepted exactly. -/
theorem parseClockFuel?_complete
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : ClockFuelView program}
    (shape : ClockFuelWholeShape program tree view term) :
    parseClockFuel? program tree term = some view := by
  have unique := markedPrefix_eq_peelMarked shape.markedPrefix
  rcases view with ⟨activeTerm, context, history, active⟩
  simp only at unique shape ⊢
  rcases unique with ⟨activeEq, contextEq, historyEq⟩
  subst activeTerm
  subst context
  subst history
  simp only [parseClockFuel?]
  rw [parseCanonicalClockFuelActive?_complete shape.activeShape]

/-- Whole strict clock/fuel parsing is a function of the current term. -/
theorem parseClockFuel?_unique
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {first second : ClockFuelView program}
    (firstParsed : parseClockFuel? program tree term = some first)
    (secondParsed : parseClockFuel? program tree term = some second) :
    first = second := by
  rw [firstParsed] at secondParsed
  exact Option.some.inj secondParsed

/-- Historical Locals around every strict clock/fuel row are marked. -/
theorem parseClockFuel?_history_marked
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : ClockFuelView program}
    (h : parseClockFuel? program tree term = some view) :
    MarkedHistory program view.history :=
  (parseClockFuel?_sound h).markedPrefix.historical_views_marked

/-! ## Composite stage coordinates -/

/-- The eighteen detailed alternatives in this registered union. -/
inductive Stage where
  | dispatcherExposed
  | dispatcherForked
  | pushFirst
  | pushSecondNonfinal
  | pushSecondFinal
  | completeOpen
  | completeClean
  | clockGrowPositive
  | clockGrowZero
  | clockLaunch
  | fuelCallPositive
  | fuelCallZero
  | fuelPositiveHalf
  | fuelZeroFirst
  | fuelZeroSecond
  | fuelZeroThird
  | fuelZeroFourth
  | fuelCarrier
  deriving BEq, DecidableEq, Inhabited, Repr

def stages : List Stage :=
  [.dispatcherExposed, .dispatcherForked,
    .pushFirst, .pushSecondNonfinal, .pushSecondFinal,
    .completeOpen, .completeClean,
    .clockGrowPositive, .clockGrowZero, .clockLaunch,
    .fuelCallPositive, .fuelCallZero, .fuelPositiveHalf,
    .fuelZeroFirst, .fuelZeroSecond, .fuelZeroThird, .fuelZeroFourth,
    .fuelCarrier]

theorem stages_length : stages.length = 18 := by
  decide

theorem stages_nodup : stages.Nodup := by
  decide

theorem mem_stages (stage : Stage) : stage ∈ stages := by
  cases stage <;> simp [stages]

/-- One classified family result. -/
inductive View (program : CTS.Program) where
  | dispatcher (view : DispatcherStage.View program)
  | appender (view : AppenderStage.View program)
  | response (view : ResponseStage.View program)
  | clockFuel (view : ClockFuelView program)
  deriving Repr

def View.activeTerm {program : CTS.Program} : View program → Term
  | .dispatcher view => view.active
  | .appender view => view.active
  | .response view => view.active
  | .clockFuel view => view.activeTerm

def View.context {program : CTS.Program} : View program → Context
  | .dispatcher view => view.context
  | .appender view => view.context
  | .response view => view.context
  | .clockFuel view => view.context

def View.history {program : CTS.Program} :
    View program → List (CheckpointDecoder.LocalView program)
  | .dispatcher view => view.history
  | .appender view => view.history
  | .response view => view.history
  | .clockFuel view => view.history

def clockFuelStage : ClockFuelActive → Stage
  | ClockFuelActive.clock clock =>
      match clock.stage with
      | .growPositive => .clockGrowPositive
      | .growZero => .clockGrowZero
      | .launch => .clockLaunch
  | ClockFuelActive.fuel fuel =>
      match fuel.endpoint with
      | .carrier _ => .fuelCarrier
      | .row row =>
          match row.stage with
          | .callPositive => .fuelCallPositive
          | .callZero => .fuelCallZero
          | .positiveHalf => .fuelPositiveHalf
          | .zeroFirst => .fuelZeroFirst
          | .zeroSecond => .fuelZeroSecond
          | .zeroThird => .fuelZeroThird
          | .zeroFourth => .fuelZeroFourth

def View.stage {program : CTS.Program} : View program → Stage
  | .dispatcher view =>
      match view.stage with
      | .exposed _ => .dispatcherExposed
      | .forked _ => .dispatcherForked
  | .appender view =>
      match view.stage with
      | .first => .pushFirst
      | .secondNonfinal => .pushSecondNonfinal
      | .secondFinal => .pushSecondFinal
  | .response view =>
      match view.endpoint.stage with
      | .completeOpen _ => .completeOpen
      | .completeClean => .completeClean
  | .clockFuel view => clockFuelStage view.active

/-- Root-relative current focus, including noncontracting handoff focuses. -/
def View.currentAddress {program : CTS.Program} : View program → Address
  | .dispatcher view => view.redexAddress
  | .appender view => view.focusAddress
  | .response view =>
      match view.endpoint.stage with
      | .completeOpen address => view.accumulatorAddress ++ address
      | .completeClean => view.commitAddress
  | .clockFuel view => view.currentAddress

/-- Address selected unconditionally by the registered local theorem. -/
def View.selectedAddress? {program : CTS.Program} :
    View program → Option Address
  | .dispatcher view => some view.redexAddress
  | .appender view => view.selectedAddress
  | .response view =>
      match view.endpoint.stage with
      | .completeOpen _ => view.closeAddress?
      | .completeClean => some view.commitAddress
  | .clockFuel view => view.selectedAddress?

structure Coordinates where
  stage : Stage
  currentAddress : Address
  selectedAddress? : Option Address
  deriving BEq, DecidableEq, Repr

def View.coordinates {program : CTS.Program} (view : View program) :
    Coordinates :=
  ⟨view.stage, view.currentAddress, view.selectedAddress?⟩

/-! ## Independent registered priority grammar -/

/--
The composite grammar uses semantic exclusion from earlier declarative
languages.  These premises mention no composite parser.
-/
inductive RegisteredShape
    (program : CTS.Program)
    (layout : ActionDispatcher program) :
    View program → Term → Prop where
  | dispatcher {view term}
      (shape : DispatcherStage.WholeShape program layout view term) :
      RegisteredShape program layout (.dispatcher view) term
  | appender {view term}
      (dispatcherExcluded :
        ∀ earlier,
          ¬ DispatcherStage.WholeShape program layout earlier term)
      (shape : AppenderStage.WholeShape program layout.tree view term) :
      RegisteredShape program layout (.appender view) term
  | response {view term}
      (dispatcherExcluded :
        ∀ earlier,
          ¬ DispatcherStage.WholeShape program layout earlier term)
      (appenderExcluded :
        ∀ earlier,
          ¬ AppenderStage.WholeShape program layout.tree earlier term)
      (shape : ResponseStage.WholeShape program layout.tree view term) :
      RegisteredShape program layout (.response view) term
  | clockFuel {view term}
      (dispatcherExcluded :
        ∀ earlier,
          ¬ DispatcherStage.WholeShape program layout earlier term)
      (appenderExcluded :
        ∀ earlier,
          ¬ AppenderStage.WholeShape program layout.tree earlier term)
      (responseExcluded :
        ∀ earlier,
          ¬ ResponseStage.WholeShape program layout.tree earlier term)
      (shape : ClockFuelWholeShape program layout.tree view term) :
      RegisteredShape program layout (.clockFuel view) term

/-- One root-starting classifier for the registered union. -/
def parse?
    (program : CTS.Program)
    (layout : ActionDispatcher program)
    (term : Term) : Option (View program) :=
  match RootResetWholeDispatcherStages.parse? program layout term with
  | some view => some (.dispatcher view)
  | none =>
      match RootResetWholeAppenderStages.parse? program layout.tree term with
      | some view => some (.appender view)
      | none =>
          match RootResetResponseBoundaryStages.parse? program layout.tree term with
          | some view => some (.response view)
          | none =>
              (parseClockFuel? program layout.tree term).map .clockFuel

/-- Successful composite parsing supplies the independent registered grammar. -/
theorem parse?_sound
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {view : View program}
    (h : parse? program layout term = some view) :
    RegisteredShape program layout view term := by
  unfold parse? at h
  generalize dispatcherEq :
    RootResetWholeDispatcherStages.parse? program layout term =
      dispatcherResult at h
  cases dispatcherResult with
  | some dispatcher =>
      simp at h
      subst view
      exact .dispatcher
        (RootResetWholeDispatcherStages.parse?_sound dispatcherEq)
  | none =>
      generalize appenderEq :
        RootResetWholeAppenderStages.parse? program layout.tree term =
          appenderResult at h
      cases appenderResult with
      | some appender =>
          simp at h
          subst view
          refine .appender ?_
            (RootResetWholeAppenderStages.parse?_sound appenderEq)
          intro earlier shape
          have accepted :=
            RootResetWholeDispatcherStages.parse?_complete shape
          rw [dispatcherEq] at accepted
          contradiction
      | none =>
          generalize responseEq :
            RootResetResponseBoundaryStages.parse? program layout.tree term =
              responseResult at h
          cases responseResult with
          | some response =>
              simp at h
              subst view
              refine .response ?_ ?_
                (RootResetResponseBoundaryStages.parse?_sound responseEq)
              · intro earlier shape
                have accepted :=
                  RootResetWholeDispatcherStages.parse?_complete shape
                rw [dispatcherEq] at accepted
                contradiction
              · intro earlier shape
                have accepted :=
                  RootResetWholeAppenderStages.parse?_complete shape
                rw [appenderEq] at accepted
                contradiction
          | none =>
              rcases RootResetStageRegistry.optionMap_eq_some h with
                ⟨clockFuel, clockFuelEq, viewEq⟩
              rw [← viewEq]
              refine .clockFuel ?_ ?_ ?_ (parseClockFuel?_sound clockFuelEq)
              · intro earlier shape
                have accepted :=
                  RootResetWholeDispatcherStages.parse?_complete shape
                rw [dispatcherEq] at accepted
                contradiction
              · intro earlier shape
                have accepted :=
                  RootResetWholeAppenderStages.parse?_complete shape
                rw [appenderEq] at accepted
                contradiction
              · intro earlier shape
                have accepted :=
                  RootResetResponseBoundaryStages.parse?_complete shape
                rw [responseEq] at accepted
                contradiction

/-- Every independent registered shape is accepted exactly. -/
theorem parse?_complete
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {view : View program}
    (shape : RegisteredShape program layout view term) :
    parse? program layout term = some view := by
  cases shape with
  | dispatcher dispatcherShape =>
      simp [parse?,
        RootResetWholeDispatcherStages.parse?_complete dispatcherShape]
  | appender dispatcherExcluded appenderShape =>
      have dispatcherNone :
          RootResetWholeDispatcherStages.parse? program layout term = none := by
        cases parsed :
            RootResetWholeDispatcherStages.parse? program layout term with
        | none => rfl
        | some earlier =>
            exact False.elim (dispatcherExcluded earlier
              (RootResetWholeDispatcherStages.parse?_sound parsed))
      simp [parse?, dispatcherNone,
        RootResetWholeAppenderStages.parse?_complete appenderShape]
  | response dispatcherExcluded appenderExcluded responseShape =>
      have dispatcherNone :
          RootResetWholeDispatcherStages.parse? program layout term = none := by
        cases parsed :
            RootResetWholeDispatcherStages.parse? program layout term with
        | none => rfl
        | some earlier =>
            exact False.elim (dispatcherExcluded earlier
              (RootResetWholeDispatcherStages.parse?_sound parsed))
      have appenderNone :
          RootResetWholeAppenderStages.parse? program layout.tree term = none := by
        cases parsed :
            RootResetWholeAppenderStages.parse? program layout.tree term with
        | none => rfl
        | some earlier =>
            exact False.elim (appenderExcluded earlier
              (RootResetWholeAppenderStages.parse?_sound parsed))
      simp [parse?, dispatcherNone, appenderNone,
        RootResetResponseBoundaryStages.parse?_complete responseShape]
  | clockFuel dispatcherExcluded appenderExcluded responseExcluded
      clockFuelShape =>
      have dispatcherNone :
          RootResetWholeDispatcherStages.parse? program layout term = none := by
        cases parsed :
            RootResetWholeDispatcherStages.parse? program layout term with
        | none => rfl
        | some earlier =>
            exact False.elim (dispatcherExcluded earlier
              (RootResetWholeDispatcherStages.parse?_sound parsed))
      have appenderNone :
          RootResetWholeAppenderStages.parse? program layout.tree term = none := by
        cases parsed :
            RootResetWholeAppenderStages.parse? program layout.tree term with
        | none => rfl
        | some earlier =>
            exact False.elim (appenderExcluded earlier
              (RootResetWholeAppenderStages.parse?_sound parsed))
      have responseNone :
          RootResetResponseBoundaryStages.parse? program layout.tree term =
            none := by
        cases parsed :
            RootResetResponseBoundaryStages.parse? program layout.tree term with
        | none => rfl
        | some earlier =>
            exact False.elim (responseExcluded earlier
              (RootResetResponseBoundaryStages.parse?_sound parsed))
      simp [parse?, dispatcherNone, appenderNone, responseNone,
        parseClockFuel?_complete clockFuelShape]

/-- Identical current bare terms produce identical composite classifications. -/
theorem identical_current_terms_same_classification
    (program : CTS.Program) (layout : ActionDispatcher program)
    (term : Term) :
    parse? program layout term = parse? program layout term :=
  rfl

/-- Composite parsing has one unique family, detailed stage, and field tuple. -/
theorem parse?_unique
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {first second : View program}
    (firstParsed : parse? program layout term = some first)
    (secondParsed : parse? program layout term = some second) :
    first = second := by
  rw [firstParsed] at secondParsed
  exact Option.some.inj secondParsed

/-- Independently registered descriptions of one term are jointly unique. -/
theorem RegisteredShape.deterministic
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {first second : View program}
    (firstShape : RegisteredShape program layout first term)
    (secondShape : RegisteredShape program layout second term) :
    first = second :=
  parse?_unique (parse?_complete firstShape) (parse?_complete secondShape)

/-- Every registered view reconstructs the whole bare source from its hole. -/
theorem RegisteredShape.source_eq
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {view : View program}
    (shape : RegisteredShape program layout view term) :
    view.context.plug view.activeTerm = term := by
  cases shape with
  | dispatcher dispatcherShape =>
      exact dispatcherShape.markedPrefix.source_eq
  | appender _ appenderShape =>
      exact appenderShape.markedPrefix.source_eq
  | response _ _ responseShape =>
      exact responseShape.markedPrefix.source_eq
  | clockFuel _ _ _ clockFuelShape =>
      exact clockFuelShape.markedPrefix.source_eq

/-- Distinct detailed stage tags cannot describe one registered current term. -/
theorem registered_stage_disjoint
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {first second : View program}
    (firstShape : RegisteredShape program layout first term)
    (secondShape : RegisteredShape program layout second term)
    (different : first.stage ≠ second.stage) : False := by
  apply different
  exact congrArg View.stage (firstShape.deterministic secondShape)

/-- The active term, hole context, and marked history are jointly unique. -/
theorem unique_active_hole_decomposition
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {first second : View program}
    (firstShape : RegisteredShape program layout first term)
    (secondShape : RegisteredShape program layout second term) :
    first.activeTerm = second.activeTerm ∧
      first.context = second.context ∧
      first.history = second.history := by
  have equal := firstShape.deterministic secondShape
  subst second
  exact ⟨rfl, rfl, rfl⟩

/-- The detailed stage, current focus, and unconditional selection agree. -/
theorem unique_stage_focus_selection
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {first second : View program}
    (firstShape : RegisteredShape program layout first term)
    (secondShape : RegisteredShape program layout second term) :
    first.stage = second.stage ∧
      first.currentAddress = second.currentAddress ∧
      first.selectedAddress? = second.selectedAddress? := by
  have equal := firstShape.deterministic secondShape
  subst second
  exact ⟨rfl, rfl, rfl⟩

/-- A classified term has one unique registered view. -/
theorem existsUnique_registeredView
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {view : View program}
    (parsed : parse? program layout term = some view) :
    ∃ candidate,
      RegisteredShape program layout candidate term ∧
      ∀ other, RegisteredShape program layout other term →
        other = candidate := by
  exact ⟨view, parse?_sound parsed, fun other shape =>
    parse?_unique (parse?_complete shape) parsed⟩

/-- Detailed stage and current-focus coordinates are unique on a parsed term. -/
theorem unique_stage_currentAddress
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {view : View program}
    (parsed : parse? program layout term = some view) :
    ∃ coordinates,
      coordinates = view.coordinates ∧
      ∀ other,
        (∃ otherView,
          RegisteredShape program layout otherView term ∧
          other = otherView.coordinates) →
        other = coordinates := by
  refine ⟨view.coordinates, rfl, ?_⟩
  intro other described
  rcases described with ⟨otherView, otherShape, rfl⟩
  have equal :=
    parse?_unique (parse?_complete otherShape) parsed
  subst otherView
  rfl

/-- Every parsed family inherits the canonical marked historical prefix. -/
theorem parse?_history_marked
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {view : View program}
    (parsed : parse? program layout term = some view) :
    match view with
    | .dispatcher endpoint => MarkedHistory program endpoint.history
    | .appender endpoint => MarkedHistory program endpoint.history
    | .response endpoint => MarkedHistory program endpoint.history
    | .clockFuel endpoint => MarkedHistory program endpoint.history := by
  have shape := parse?_sound parsed
  cases shape with
  | dispatcher dispatcherShape =>
      exact dispatcherShape.markedPrefix.historical_views_marked
  | appender _ appenderShape =>
      exact appenderShape.markedPrefix.historical_views_marked
  | response _ _ responseShape =>
      exact responseShape.cleanHistory.toMarkedHistory
  | clockFuel _ _ _ clockFuelShape =>
      exact clockFuelShape.markedPrefix.historical_views_marked

/-! ## Exact selected-contraction interfaces -/

/--
Every unconditionally selected composite address is an actual contraction.
For a clean response, this includes COMMIT itself; classifying the target
handoff may require an additional continuation-history premise, but the
fresh-halt contraction does not.
-/
theorem View.selected_contracts
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {view : View program} {address : Address}
    (parsed : parse? program layout term = some view)
    (selected : view.selectedAddress? = some address) :
    ∃ target, term.contractAt? address = some target := by
  have shape := parse?_sound parsed
  cases view with
  | dispatcher dispatcher =>
      cases shape with
      | dispatcher dispatcherShape =>
          have dispatcherParsed :=
            RootResetWholeDispatcherStages.parse?_complete dispatcherShape
          obtain ⟨target, _replaced, contracted⟩ :=
            RootResetWholeDispatcherStages.View.contracts dispatcherParsed
          have addressEq : dispatcher.redexAddress = address := by
            exact Option.some.inj selected
          subst address
          exact ⟨target, contracted⟩
  | appender appender =>
      cases shape with
      | appender _ appenderShape =>
          have appenderParsed :=
            RootResetWholeAppenderStages.parse?_complete appenderShape
          cases rowEq : appender.endpoint.row with
          | first position bit rest accumulator duplicate histories =>
              let replacement :=
                RootResetAppenderStages.firstTarget bit rest accumulator
                  duplicate
              have replacementEq : appender.endpoint.row.replacement? =
                  some replacement := by
                simp [rowEq, replacement,
                  RootResetWholeAppenderStages.Row.replacement?]
              obtain ⟨target, selectedEq, _replaced, contracted⟩ :=
                RootResetWholeAppenderStages.View.selected_contracts
                  appenderParsed replacementEq
              have addressEq : appender.focusAddress = address := by
                change appender.selectedAddress = some address at selected
                rw [selectedEq] at selected
                exact Option.some.inj selected
              subst address
              exact ⟨target, contracted⟩
          | secondNonfinal position bit next tail accumulator currentHistory
              histories =>
              let replacement :=
                RootResetAppenderStages.firstRow next tail accumulator
                  accumulator
              have replacementEq : appender.endpoint.row.replacement? =
                  some replacement := by
                simp [rowEq, replacement,
                  RootResetWholeAppenderStages.Row.replacement?]
              obtain ⟨target, selectedEq, _replaced, contracted⟩ :=
                RootResetWholeAppenderStages.View.selected_contracts
                  appenderParsed replacementEq
              have addressEq : appender.focusAddress = address := by
                change appender.selectedAddress = some address at selected
                rw [selectedEq] at selected
                exact Option.some.inj selected
              subst address
              exact ⟨target, contracted⟩
          | secondFinal position bit accumulator currentHistory histories =>
              have selectedNone : appender.selectedAddress = none :=
                RootResetWholeAppenderStages.View.selectedAddress_none_of_final
                  (by simp [rowEq,
                    RootResetWholeAppenderStages.Row.stage])
              change appender.selectedAddress = some address at selected
              rw [selectedNone] at selected
              contradiction
  | response response =>
      cases shape with
      | response _ _ responseShape =>
          have responseParsed :=
            RootResetResponseBoundaryStages.parse?_complete responseShape
          cases stageEq : response.endpoint.stage with
          | completeOpen openAddress =>
              obtain ⟨target, _targetView, selectedEq, contracted,
                  _targetParsed, _targetStage, _phase, _bit, _label,
                  _queue⟩ :=
                RootResetResponseBoundaryStages.View.close_exact
                  responseParsed stageEq
              have addressEq :
                  response.accumulatorAddress ++ openAddress = address := by
                have responseSelected : response.closeAddress? = some address := by
                  simpa [View.selectedAddress?, stageEq] using selected
                rw [selectedEq] at responseSelected
                exact Option.some.inj responseSelected
              subst address
              exact ⟨target, contracted⟩
          | completeClean =>
              obtain ⟨target, contracted⟩ :=
                RootResetResponseBoundaryStages.View.commit_contracts
                  responseParsed stageEq
              have addressEq : response.commitAddress = address := by
                simpa [View.selectedAddress?, stageEq] using selected
              subst address
              exact ⟨target, contracted⟩
  | clockFuel clockFuel =>
      cases shape with
      | clockFuel _ _ _ clockFuelShape =>
          simp only [View.selectedAddress?,
            ClockFuelView.selectedAddress?] at selected
          cases activeEq : clockFuel.active with
          | clock clock =>
              have localParsed :
                  parseClock? clockFuel.activeTerm = some clock := by
                have activeShape := clockFuelShape.activeShape
                rw [activeEq] at activeShape
                exact activeShape.clock_parse
              have localSelected : address =
                  RootResetSelectorContract.contextAddress clockFuel.context ++
                    clock.focusAddress := by
                simp [ClockFuelActive.selectedAddress?, activeEq] at selected
                exact selected.symm
              obtain ⟨localTarget, localContract⟩ :=
                clock.selected_contracts localParsed
              have lifted :=
                RootResetWholeStageClassifier.contractAt?_plug_append
                  clockFuel.context clock.focusAddress localContract
              rw [← clockFuelShape.markedPrefix.source_eq, localSelected]
              exact ⟨clockFuel.context.plug localTarget, lifted⟩
          | fuel fuel =>
              have localParsed :
                  parseFuelActive? (compileActions program layout.tree)
                      clockFuel.activeTerm = some fuel := by
                have activeShape := clockFuelShape.activeShape
                rw [activeEq] at activeShape
                exact activeShape.fuel_parse
              have localWitness : ∃ localAddress,
                  fuel.selectedAddress? = some localAddress ∧
                  address =
                    RootResetSelectorContract.contextAddress
                        clockFuel.context ++ localAddress := by
                rw [activeEq] at selected
                rcases RootResetStageRegistry.optionMap_eq_some selected with
                  ⟨localAddress, localSelected, addressEq⟩
                exact ⟨localAddress, localSelected, addressEq.symm⟩
              rcases localWitness with
                ⟨localAddress, localSelected, addressEq⟩
              obtain ⟨localTarget, localContract⟩ :=
                fuel.selected_contracts localParsed localSelected
              have lifted :=
                RootResetWholeStageClassifier.contractAt?_plug_append
                  clockFuel.context localAddress localContract
              rw [← clockFuelShape.markedPrefix.source_eq, addressEq]
              exact ⟨clockFuel.context.plug localTarget, lifted⟩

/--
Canonical clock terms and canonical local fuel-row terms are genuinely
disjoint before composite priority is applied.
-/
theorem canonical_clock_localFuel_disjoint
    {actions term : Term} {clock : ClockView} {fuel : FuelRow}
    (clockSource : term = clock.term)
    (clockCanonical : CanonicalClock actions clock)
    (fuelSource : term = fuel.term)
    (fuelCanonical : CanonicalFuelRow actions fuel) : False :=
  canonicalClock_fuelRow_disjoint clockSource clockCanonical fuelSource
    fuelCanonical

/-- Canonical clock and full pending-lifted fuel languages are disjoint. -/
theorem canonical_clock_fuel_disjoint
    {actions term : Term} {clock : ClockView} {fuel : FuelView}
    (clockSource : term = clock.term)
    (clockCanonical : CanonicalClock actions clock)
    (fuelSource : term = fuel.term actions)
    (fuelCanonical : CanonicalFuelView actions fuel) : False :=
  canonicalClock_fuel_disjoint clockSource clockCanonical fuelSource
    fuelCanonical

end PureSFormal.Research.RootResetCompositeStageRegistry
