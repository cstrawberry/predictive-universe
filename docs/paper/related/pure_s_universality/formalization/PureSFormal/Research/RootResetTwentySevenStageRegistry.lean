import PureSFormal.Research.RootResetCompositeStageRegistry
import PureSFormal.Research.RootResetWholeStageClassifier

/-!
# Twenty-seven-tag registered root-reset stage union

The stage union contains the eighteen dispatcher, Push, response-boundary,
clock, and fuel tags from `RootResetCompositeStageRegistry`, followed by the
nine non-`unregistered` tags of `RootResetWholeStageClassifier`.

The eighteen-tag grammar has priority.  A core alternative therefore carries
semantic non-membership in that earlier declarative grammar.  The core grammar
uses `EndpointDecomposition.Describes`: a marked-prefix relation and the
term-derived active classification.  It contains no premise about the parser
defined in this file.

The union has no scheduler-reachability, selected-step closure, phase-sequence,
CTS-simulation, or decoding premise.  Accumulator CLOSE is the only
unconditionally selected core contraction.  Clean response COMMIT is exposed
separately under its continuation-history condition.
-/

namespace PureSFormal.Research.RootResetTwentySevenStageRegistry

open PureSFormal.PureS
open RootResetReachableStageGrammar

namespace Base

abbrev Stage := RootResetCompositeStageRegistry.Stage
abbrev View := RootResetCompositeStageRegistry.View
abbrev RegisteredShape := RootResetCompositeStageRegistry.RegisteredShape

end Base

namespace Core

abbrev WholeStage := RootResetWholeStageClassifier.Stage
abbrev ActiveView := RootResetWholeStageClassifier.ActiveView
abbrev Decomposition := RootResetWholeStageClassifier.EndpointDecomposition

end Core

/-! ## The nine registered core tags -/

inductive CoreStage where
  | commitReady
  | frameR0
  | frameR1
  | frameR2
  | activatedRoute
  | selectedAction
  | pendingFrame
  | accumulatorClean
  | accumulatorClose
  deriving BEq, DecidableEq, Inhabited, Repr

def CoreStage.toWholeStage : CoreStage → Core.WholeStage
  | .commitReady => .commitReady
  | .frameR0 => .frameR0
  | .frameR1 => .frameR1
  | .frameR2 => .frameR2
  | .activatedRoute => .activatedRoute
  | .selectedAction => .selectedAction
  | .pendingFrame => .pendingFrame
  | .accumulatorClean => .accumulatorClean
  | .accumulatorClose => .accumulatorClose

def coreStage? : Core.WholeStage → Option CoreStage
  | .commitReady => some .commitReady
  | .frameR0 => some .frameR0
  | .frameR1 => some .frameR1
  | .frameR2 => some .frameR2
  | .activatedRoute => some .activatedRoute
  | .selectedAction => some .selectedAction
  | .pendingFrame => some .pendingFrame
  | .accumulatorClean => some .accumulatorClean
  | .accumulatorClose => some .accumulatorClose
  | .unregistered => none

@[simp]
theorem coreStage?_toWholeStage (stage : CoreStage) :
    coreStage? stage.toWholeStage = some stage := by
  cases stage <;> rfl

theorem coreStage?_sound
    {wholeStage : Core.WholeStage} {stage : CoreStage}
    (h : coreStage? wholeStage = some stage) :
    wholeStage = stage.toWholeStage := by
  cases wholeStage <;> simp [coreStage?] at h
  all_goals subst stage <;> rfl

theorem coreStage?_none_iff (stage : Core.WholeStage) :
    coreStage? stage = none ↔ stage = .unregistered := by
  cases stage <;> simp [coreStage?]

/-! ## Core whole-term grammar and parser -/

/-- One non-`unregistered` endpoint decomposition. -/
structure CoreView (program : CTS.Program) where
  decomposition : Core.Decomposition program
  stage : CoreStage
  deriving BEq, DecidableEq, Repr

def CoreView.active {program : CTS.Program} (view : CoreView program) : Term :=
  view.decomposition.active

def CoreView.context {program : CTS.Program} (view : CoreView program) : Context :=
  view.decomposition.context

def CoreView.history {program : CTS.Program}
    (view : CoreView program) :
    List (CheckpointDecoder.LocalView program) :=
  view.decomposition.history

def CoreView.endpoint {program : CTS.Program}
    (view : CoreView program) : Core.ActiveView program :=
  view.decomposition.endpoint

/-- Root-relative canonical focus when the core tag supplies one. -/
def CoreView.currentAddress? {program : CTS.Program}
    (view : CoreView program) : Option Address :=
  view.endpoint.canonicalChildAddress.map fun address =>
    RootResetSelectorContract.contextAddress view.context ++ address

/-- Only accumulator CLOSE has an unconditional core selection. -/
def CoreView.selectedAddress? {program : CTS.Program}
    (view : CoreView program) : Option Address :=
  match view.stage with
  | .accumulatorClose =>
      view.endpoint.selectedAddress.map fun address =>
        RootResetSelectorContract.contextAddress view.context ++ address
  | _ => none

/--
Independent registered-core description.  `Describes` is the declarative
marked-prefix/active-endpoint relation of the core classifier; `stageEq`
excludes its total classifier's `unregistered` result.
-/
structure CoreWholeShape
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (view : CoreView program) (term : Term) : Prop where
  describes : view.decomposition.Describes program tree term
  stageEq : view.endpoint.stage = view.stage.toWholeStage

/-- Parse a core tag from the bare root, rejecting `unregistered`. -/
def parseCore?
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Option (CoreView program) :=
  let decomposition :=
    RootResetWholeStageClassifier.endpointDecomposition program tree term
  (coreStage? decomposition.endpoint.stage).map fun stage =>
    ⟨decomposition, stage⟩

/-- Core parser success supplies the independent registered-core relation. -/
theorem parseCore?_sound
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : CoreView program}
    (h : parseCore? program tree term = some view) :
    CoreWholeShape program tree view term := by
  unfold parseCore? at h
  rcases RootResetStageRegistry.optionMap_eq_some h with
    ⟨stage, stageParsed, viewEq⟩
  rw [← viewEq]
  exact ⟨RootResetWholeStageClassifier.endpointDecomposition_describes
      program tree term,
    coreStage?_sound stageParsed⟩

/-- Every registered-core description is accepted exactly. -/
theorem parseCore?_complete
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : CoreView program}
    (shape : CoreWholeShape program tree view term) :
    parseCore? program tree term = some view := by
  have decompositionEq : view.decomposition =
      RootResetWholeStageClassifier.endpointDecomposition program tree term :=
    RootResetWholeStageClassifier.endpointDecomposition_deterministic
      shape.describes
      (RootResetWholeStageClassifier.endpointDecomposition_describes
        program tree term)
  rcases view with ⟨decomposition, stage⟩
  simp only at decompositionEq shape ⊢
  subst decomposition
  simp only [parseCore?]
  have endpointStage := shape.stageEq
  change
    (RootResetWholeStageClassifier.endpointDecomposition program tree term).endpoint.stage =
      stage.toWholeStage at endpointStage
  rw [endpointStage, coreStage?_toWholeStage]
  rfl

/-- Core parsing is a function of the current bare term. -/
theorem parseCore?_unique
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {first second : CoreView program}
    (firstParsed : parseCore? program tree term = some first)
    (secondParsed : parseCore? program tree term = some second) :
    first = second := by
  rw [firstParsed] at secondParsed
  exact Option.some.inj secondParsed

/-- Independently described core decompositions are jointly unique. -/
theorem CoreWholeShape.deterministic
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {first second : CoreView program}
    (firstShape : CoreWholeShape program tree first term)
    (secondShape : CoreWholeShape program tree second term) :
    first = second :=
  parseCore?_unique (parseCore?_complete firstShape)
    (parseCore?_complete secondShape)

/-- The core hole context and active term reconstruct the whole source. -/
theorem CoreWholeShape.source_eq
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : CoreView program}
    (shape : CoreWholeShape program tree view term) :
    view.context.plug view.active = term :=
  shape.describes.1.source_eq

/-- Every core historical Local is marked and complete. -/
theorem CoreWholeShape.history_marked
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : CoreView program}
    (shape : CoreWholeShape program tree view term) :
    MarkedHistory program view.history :=
  shape.describes.1.historical_views_marked

/-- A core COMMIT endpoint exposed after peeling is fresh. -/
theorem CoreWholeShape.commit_active_fresh
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : CoreView program}
    (shape : CoreWholeShape program tree view term)
    (_commit : view.stage = .commitReady)
    {localView : CheckpointDecoder.LocalView program}
    (parsed : CheckpointDecoder.parseLocal? program tree view.active =
      some localView) :
    localView.status = .fresh := by
  exact shape.describes.1.active_local_is_fresh parsed

/-- A core accumulator-CLOSE tag exposes its local transaction classification. -/
theorem CoreWholeShape.accumulatorClose_evidence
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : CoreView program}
    (shape : CoreWholeShape program tree view term)
    (closeStage : view.stage = .accumulatorClose) :
    ∃ bits relativeAddress,
      RootResetAccumulatorClassifier.classify? view.active =
          some ⟨bits, .close relativeAddress⟩ ∧
        view.endpoint.selectedAddress = some relativeAddress := by
  have endpointStage : view.endpoint.stage =
      RootResetWholeStageClassifier.Stage.accumulatorClose := by
    rw [shape.stageEq, closeStage]
    rfl
  have classifierAgreement := shape.describes.2
  change view.endpoint =
    RootResetWholeStageClassifier.classifyActive program tree view.history
      view.active at classifierAgreement
  have classifiedStage :
      (RootResetWholeStageClassifier.classifyActive program tree view.history
        view.active).stage = .accumulatorClose := by
    rw [← classifierAgreement]
    exact endpointStage
  generalize localEq : CheckpointDecoder.parseLocal? program tree view.active =
    localResult at classifiedStage
  cases localResult with
  | some parsedLocal =>
      simp [RootResetWholeStageClassifier.classifyActive, localEq]
        at classifiedStage
  | none =>
      generalize endpointEq :
        RootResetReachableStageGrammar.classifyEndpoint
          (compileActions program tree) view.active = endpointResult
            at classifiedStage
      rcases endpointResult with ⟨endpointTag, child, endpointBits⟩
      cases endpointTag with
      | frameR0 =>
          cases endpointBits <;>
            simp [RootResetWholeStageClassifier.classifyActive, localEq,
              endpointEq] at classifiedStage
      | frameR1 =>
          cases endpointBits <;>
            simp [RootResetWholeStageClassifier.classifyActive, localEq,
              endpointEq] at classifiedStage
      | frameR2 =>
          cases endpointBits <;>
            simp [RootResetWholeStageClassifier.classifyActive, localEq,
              endpointEq] at classifiedStage
      | pendingFrame =>
          simp [RootResetWholeStageClassifier.classifyActive, localEq,
            endpointEq] at classifiedStage
      | unregistered =>
          generalize routeEq : DispatchParser.parseRouteDetailed
            (selectedAction program) tree view.active = routeResult
              at classifiedStage
          cases routeResult with
          | some route =>
              generalize actionEq : ActionParser.parse program route.label
                route.response = actionResult at classifiedStage
              cases actionResult <;>
                simp [RootResetWholeStageClassifier.classifyActive, localEq,
                  endpointEq, routeEq, actionEq] at classifiedStage
          | none =>
              generalize accumulatorEq :
                RootResetAccumulatorClassifier.classify? view.active =
                  accumulatorResult at classifiedStage
              cases accumulatorResult with
              | none =>
                  simp [RootResetWholeStageClassifier.classifyActive, localEq,
                    endpointEq, routeEq, accumulatorEq] at classifiedStage
              | some transaction =>
                  rcases transaction with ⟨bits, transactionStage⟩
                  cases transactionStage with
                  | clean =>
                      simp [RootResetWholeStageClassifier.classifyActive,
                        localEq, endpointEq, routeEq, accumulatorEq]
                        at classifiedStage
                  | close relativeAddress =>
                      refine ⟨bits, relativeAddress, ?_, ?_⟩
                      · rfl
                      rw [classifierAgreement]
                      simp [RootResetWholeStageClassifier.classifyActive,
                        localEq, endpointEq, routeEq, accumulatorEq]

/-- Core selected addresses are exact accumulator-CLOSE contractions. -/
theorem CoreView.selected_contracts
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : CoreView program} {address : Address}
    (shape : CoreWholeShape program tree view term)
    (selected : view.selectedAddress? = some address) :
    ∃ target, term.contractAt? address = some target := by
  cases stageEq : view.stage with
  | accumulatorClose =>
      obtain ⟨bits, relativeAddress, accumulatorEq, endpointSelected⟩ :=
        shape.accumulatorClose_evidence stageEq
      obtain ⟨localTarget, localContracts⟩ :=
        RootResetAccumulatorClassifier.classify?_close_sound accumulatorEq
      have addressEq : address =
          RootResetSelectorContract.contextAddress view.context ++
            relativeAddress := by
        simp [CoreView.selectedAddress?, stageEq, endpointSelected] at selected
        exact selected.symm
      have lifted := RootResetWholeStageClassifier.contractAt?_plug_append
        view.context relativeAddress localContracts
      rw [← shape.source_eq, addressEq]
      exact ⟨view.context.plug localTarget, lifted⟩
  | commitReady | frameR0 | frameR1 | frameR2 | activatedRoute |
      selectedAction | pendingFrame | accumulatorClean =>
      simp [CoreView.selectedAddress?, stageEq] at selected

/-! ## Twenty-seven detailed tags -/

inductive Stage where
  | registered (stage : Base.Stage)
  | coreCommitReady
  | coreFrameR0
  | coreFrameR1
  | coreFrameR2
  | coreActivatedRoute
  | coreSelectedAction
  | corePendingFrame
  | coreAccumulatorClean
  | coreAccumulatorClose
  deriving BEq, DecidableEq, Inhabited, Repr

def CoreStage.toStage : CoreStage → Stage
  | .commitReady => .coreCommitReady
  | .frameR0 => .coreFrameR0
  | .frameR1 => .coreFrameR1
  | .frameR2 => .coreFrameR2
  | .activatedRoute => .coreActivatedRoute
  | .selectedAction => .coreSelectedAction
  | .pendingFrame => .corePendingFrame
  | .accumulatorClean => .coreAccumulatorClean
  | .accumulatorClose => .coreAccumulatorClose

def stages : List Stage :=
  [.registered .dispatcherExposed,
    .registered .dispatcherForked,
    .registered .pushFirst,
    .registered .pushSecondNonfinal,
    .registered .pushSecondFinal,
    .registered .completeOpen,
    .registered .completeClean,
    .registered .clockGrowPositive,
    .registered .clockGrowZero,
    .registered .clockLaunch,
    .registered .fuelCallPositive,
    .registered .fuelCallZero,
    .registered .fuelPositiveHalf,
    .registered .fuelZeroFirst,
    .registered .fuelZeroSecond,
    .registered .fuelZeroThird,
    .registered .fuelZeroFourth,
    .registered .fuelCarrier,
    .coreCommitReady,
    .coreFrameR0,
    .coreFrameR1,
    .coreFrameR2,
    .coreActivatedRoute,
    .coreSelectedAction,
    .corePendingFrame,
    .coreAccumulatorClean,
    .coreAccumulatorClose]

theorem stages_length : stages.length = 27 := by
  rfl

theorem stages_nodup : stages.Nodup := by
  decide

theorem mem_stages (stage : Stage) : stage ∈ stages := by
  cases stage with
  | registered baseStage =>
      cases baseStage <;> simp [stages]
  | coreCommitReady | coreFrameR0 | coreFrameR1 | coreFrameR2 |
      coreActivatedRoute | coreSelectedAction | corePendingFrame |
      coreAccumulatorClean | coreAccumulatorClose => simp [stages]

/-! ## Final priority-explicit union -/

inductive View (program : CTS.Program) where
  | registered (view : Base.View program)
  | core (view : CoreView program)
  deriving Repr

def View.stage {program : CTS.Program} : View program → Stage
  | .registered view => .registered view.stage
  | .core view => view.stage.toStage

def View.active {program : CTS.Program} : View program → Term
  | .registered view => view.activeTerm
  | .core view => view.active

def View.context {program : CTS.Program} : View program → Context
  | .registered view => view.context
  | .core view => view.context

def View.history {program : CTS.Program} :
    View program → List (CheckpointDecoder.LocalView program)
  | .registered view => view.history
  | .core view => view.history

def View.currentAddress? {program : CTS.Program} :
    View program → Option Address
  | .registered view => some view.currentAddress
  | .core view => view.currentAddress?

def View.selectedAddress? {program : CTS.Program} :
    View program → Option Address
  | .registered view => view.selectedAddress?
  | .core view => view.selectedAddress?

structure Coordinates where
  stage : Stage
  currentAddress? : Option Address
  selectedAddress? : Option Address
  deriving BEq, DecidableEq, Repr

def View.coordinates {program : CTS.Program} (view : View program) :
    Coordinates :=
  ⟨view.stage, view.currentAddress?, view.selectedAddress?⟩

/--
The earlier eighteen-tag grammar has priority.  The core constructor states
semantic exclusion from that grammar and an independent core description.
-/
inductive RegisteredShape
    (program : CTS.Program)
    (layout : ActionDispatcher program) :
    View program → Term → Prop where
  | registered {view term}
      (shape : Base.RegisteredShape program layout view term) :
      RegisteredShape program layout (.registered view) term
  | core {view term}
      (registeredExcluded :
        ∀ earlier, ¬ Base.RegisteredShape program layout earlier term)
      (shape : CoreWholeShape program layout.tree view term) :
      RegisteredShape program layout (.core view) term

/-- Bare-root classifier for the twenty-seven-tag registered union. -/
def parse?
    (program : CTS.Program)
    (layout : ActionDispatcher program)
    (term : Term) : Option (View program) :=
  match RootResetCompositeStageRegistry.parse? program layout term with
  | some view => some (.registered view)
  | none => (parseCore? program layout.tree term).map .core

/-- Successful parsing supplies the independent priority grammar. -/
theorem parse?_sound
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {view : View program}
    (h : parse? program layout term = some view) :
    RegisteredShape program layout view term := by
  unfold parse? at h
  generalize registeredEq :
    RootResetCompositeStageRegistry.parse? program layout term = result at h
  cases result with
  | some registered =>
      simp at h
      subst view
      exact .registered
        (RootResetCompositeStageRegistry.parse?_sound registeredEq)
  | none =>
      rcases RootResetStageRegistry.optionMap_eq_some h with
        ⟨core, coreEq, viewEq⟩
      rw [← viewEq]
      refine .core ?_ (parseCore?_sound coreEq)
      intro earlier shape
      have accepted := RootResetCompositeStageRegistry.parse?_complete shape
      rw [registeredEq] at accepted
      contradiction

/-- Every independently registered union shape is accepted exactly. -/
theorem parse?_complete
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {view : View program}
    (shape : RegisteredShape program layout view term) :
    parse? program layout term = some view := by
  cases shape with
  | registered registeredShape =>
      simp [parse?,
        RootResetCompositeStageRegistry.parse?_complete registeredShape]
  | core registeredExcluded coreShape =>
      have registeredNone :
          RootResetCompositeStageRegistry.parse? program layout term = none := by
        cases parsed :
            RootResetCompositeStageRegistry.parse? program layout term with
        | none => rfl
        | some earlier =>
            exact False.elim (registeredExcluded earlier
              (RootResetCompositeStageRegistry.parse?_sound parsed))
      simp [parse?, registeredNone, parseCore?_complete coreShape]

/-- The final classifier is a function of the current bare term. -/
theorem parse?_unique
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {first second : View program}
    (firstParsed : parse? program layout term = some first)
    (secondParsed : parse? program layout term = some second) :
    first = second := by
  rw [firstParsed] at secondParsed
  exact Option.some.inj secondParsed

/-- Registered descriptions of one current term are jointly unique. -/
theorem RegisteredShape.deterministic
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {first second : View program}
    (firstShape : RegisteredShape program layout first term)
    (secondShape : RegisteredShape program layout second term) :
    first = second :=
  parse?_unique (parse?_complete firstShape) (parse?_complete secondShape)

/-- Every registered view reconstructs its whole source from one active hole. -/
theorem RegisteredShape.source_eq
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {view : View program}
    (shape : RegisteredShape program layout view term) :
    view.context.plug view.active = term := by
  cases shape with
  | registered registeredShape => exact registeredShape.source_eq
  | core _ coreShape => exact coreShape.source_eq

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

/-- Active term, hole context, and marked history are jointly unique. -/
theorem unique_active_hole_decomposition
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {first second : View program}
    (firstShape : RegisteredShape program layout first term)
    (secondShape : RegisteredShape program layout second term) :
    first.active = second.active ∧
      first.context = second.context ∧
      first.history = second.history := by
  have equal := firstShape.deterministic secondShape
  subst second
  exact ⟨rfl, rfl, rfl⟩

/-- Stage, current focus, and unconditional selection are jointly unique. -/
theorem unique_stage_focus_selection
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {first second : View program}
    (firstShape : RegisteredShape program layout first term)
    (secondShape : RegisteredShape program layout second term) :
    first.stage = second.stage ∧
      first.currentAddress? = second.currentAddress? ∧
      first.selectedAddress? = second.selectedAddress? := by
  have equal := firstShape.deterministic secondShape
  subst second
  exact ⟨rfl, rfl, rfl⟩

/-- Distinct detailed tags cannot describe one registered current term. -/
theorem registered_stage_disjoint
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {first second : View program}
    (firstShape : RegisteredShape program layout first term)
    (secondShape : RegisteredShape program layout second term)
    (different : first.stage ≠ second.stage) : False := by
  apply different
  exact congrArg View.stage (firstShape.deterministic secondShape)

/-- Every Local in the outer registered history is marked and complete. -/
theorem parse?_history_marked
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {view : View program}
    (parsed : parse? program layout term = some view) :
    MarkedHistory program view.history := by
  have shape := parse?_sound parsed
  cases shape with
  | registered registeredShape =>
      cases registeredShape with
      | dispatcher dispatcherShape =>
          exact dispatcherShape.markedPrefix.historical_views_marked
      | appender _ appenderShape =>
          exact appenderShape.markedPrefix.historical_views_marked
      | response _ _ responseShape =>
          exact responseShape.cleanHistory.toMarkedHistory
      | clockFuel _ _ _ clockFuelShape =>
          exact clockFuelShape.markedPrefix.historical_views_marked
  | core _ coreShape => exact coreShape.history_marked

/-- Every unconditionally selected address is an actual contraction. -/
theorem View.selected_contracts
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {view : View program} {address : Address}
    (parsed : parse? program layout term = some view)
    (selected : view.selectedAddress? = some address) :
    ∃ target, term.contractAt? address = some target := by
  have shape := parse?_sound parsed
  cases shape with
  | registered registeredShape =>
      exact RootResetCompositeStageRegistry.View.selected_contracts
        (RootResetCompositeStageRegistry.parse?_complete registeredShape)
        selected
  | core _ coreShape => exact CoreView.selected_contracts coreShape selected

/-! ## Term-only registered selection -/

/--
The root-derived address selected by the registered stage parser.  Failure
means either that the term is outside the registered grammar or that its
recognized stage has no unconditional contraction in the present registry.
-/
def selectAddress?
    (program : CTS.Program) (layout : ActionDispatcher program)
    (term : Term) : Option Address :=
  (parse? program layout term).bind View.selectedAddress?

/-- Contract the root-derived registered address, when both parses succeed. -/
def selectStep?
    (program : CTS.Program) (layout : ActionDispatcher program)
    (term : Term) : Option Term :=
  (selectAddress? program layout term).bind term.contractAt?

/-- Every emitted registered address admits its verified contractum. -/
theorem selectAddress?_contracts
    {program : CTS.Program} {layout : ActionDispatcher program}
    {source : Term} {address : Address}
    (selected : selectAddress? program layout source = some address) :
    ∃ target, source.contractAt? address = some target := by
  cases parsed : parse? program layout source with
  | none => simp [selectAddress?, parsed] at selected
  | some view =>
      have viewSelected : view.selectedAddress? = some address := by
        simpa [selectAddress?, parsed] using selected
      exact View.selected_contracts parsed viewSelected

/-- An emitted registered address therefore makes the term-only step succeed. -/
theorem exists_selectStep?_of_selectAddress?
    {program : CTS.Program} {layout : ActionDispatcher program}
    {source : Term} {address : Address}
    (selected : selectAddress? program layout source = some address) :
    ∃ target, selectStep? program layout source = some target := by
  obtain ⟨target, contracts⟩ := selectAddress?_contracts selected
  exact ⟨target, by simp [selectStep?, selected, contracts]⟩

/-- Every successful registered term-only selection is one strict pure-S step. -/
theorem selectStep?_sound
    {program : CTS.Program} {layout : ActionDispatcher program}
    {source target : Term}
    (selected : selectStep? program layout source = some target) :
    Step source target := by
  cases parsedEq : parse? program layout source with
  | none => simp [selectStep?, selectAddress?, parsedEq] at selected
  | some view =>
      cases addressEq : view.selectedAddress? with
      | none =>
          simp [selectStep?, selectAddress?, parsedEq, addressEq] at selected
      | some address =>
          have contracts : source.contractAt? address = some target := by
            simpa [selectStep?, selectAddress?, parsedEq, addressEq] using selected
          exact Term.contractAt?_sound contracts

/--
Successful registered selection exposes the unique parsed view, its selected
root-relative address, and the exact verified contraction at that address.
-/
theorem selectStep?_eq_some_iff
    {program : CTS.Program} {layout : ActionDispatcher program}
    {source target : Term} :
    selectStep? program layout source = some target ↔
      ∃ view address,
        parse? program layout source = some view ∧
        view.selectedAddress? = some address ∧
        source.contractAt? address = some target := by
  constructor
  · intro selected
    cases parsedEq : parse? program layout source with
    | none => simp [selectStep?, selectAddress?, parsedEq] at selected
    | some view =>
        cases addressEq : view.selectedAddress? with
        | none =>
            simp [selectStep?, selectAddress?, parsedEq, addressEq] at selected
        | some address =>
            have contracts : source.contractAt? address = some target := by
              simpa [selectStep?, selectAddress?, parsedEq, addressEq] using selected
            exact ⟨view, address, rfl, addressEq, contracts⟩
  · rintro ⟨view, address, parsed, selected, contracts⟩
    simp [selectStep?, selectAddress?, parsed, selected, contracts]

/-! ## Conditional clean-response COMMIT -/

/--
Clean-response COMMIT with a clean marked prefix at the literal continuation.
The resulting marked Local and the handoff-active endpoint are exposed.
-/
theorem response_commit_exact_with_handoff_active
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {response : RootResetResponseBoundaryStages.View program}
    {continuationQueues : List (List Bool)}
    (parsed : parse? program layout term =
      some (.registered (.response response)))
    (stageEq : response.endpoint.stage = .completeClean)
    (continuationClean :
      RootResetResponseBoundaryStages.parseCleanMarkedHistory?
          (peelMarked program layout.tree
            response.endpoint.localView.continuation).history =
        some continuationQueues) :
    ∃ target handoff targetActive committedView,
      term.contractAt? response.commitAddress = some target ∧
      RootResetResponseBoundaryStages.parseHandoff? program layout.tree target =
        some handoff ∧
      target.subterm? response.activeAddress = some targetActive ∧
      parseMarkedLocal? program layout.tree targetActive = some committedView ∧
      committedView.continuation =
        response.endpoint.localView.continuation ∧
      committedView.accumulator = response.endpoint.localView.accumulator ∧
      committedView.label = response.label ∧
      RootResetAccumulatorClassifier.classify? committedView.accumulator =
        some ⟨response.queue, .clean⟩ ∧
      handoff.active =
        (peelMarked program layout.tree
          response.endpoint.localView.continuation).active := by
  have unionShape := parse?_sound parsed
  cases unionShape with
  | registered baseShape =>
      cases baseShape with
      | response _ _ responseShape =>
          exact response.commit_exact_with_handoff_active
            (RootResetResponseBoundaryStages.parse?_complete responseShape)
            stageEq continuationClean

/--
Clean-response COMMIT when the literal continuation is not a marked Local.
This condition implies the empty clean continuation prefix and fixes the
handoff-active endpoint to the literal continuation.
-/
theorem response_commit_exact_to_unmarked_continuation
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {response : RootResetResponseBoundaryStages.View program}
    (parsed : parse? program layout term =
      some (.registered (.response response)))
    (stageEq : response.endpoint.stage = .completeClean)
    (continuationStop : parseMarkedLocal? program layout.tree
      response.endpoint.localView.continuation = none) :
    ∃ target handoff targetActive committedView,
      term.contractAt? response.commitAddress = some target ∧
      RootResetResponseBoundaryStages.parseHandoff? program layout.tree target =
        some handoff ∧
      target.subterm? response.activeAddress = some targetActive ∧
      parseMarkedLocal? program layout.tree targetActive = some committedView ∧
      committedView.continuation =
        response.endpoint.localView.continuation ∧
      committedView.accumulator = response.endpoint.localView.accumulator ∧
      committedView.label = response.label ∧
      RootResetAccumulatorClassifier.classify? committedView.accumulator =
        some ⟨response.queue, .clean⟩ ∧
      handoff.active = response.endpoint.localView.continuation := by
  have unionShape := parse?_sound parsed
  cases unionShape with
  | registered baseShape =>
      cases baseShape with
      | response _ _ responseShape =>
          exact response.commit_exact_to_unmarked_continuation_with_handoff_active
            (RootResetResponseBoundaryStages.parse?_complete responseShape)
            stageEq continuationStop

end PureSFormal.Research.RootResetTwentySevenStageRegistry
