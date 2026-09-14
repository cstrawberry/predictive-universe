import PureSFormal.Research.RootResetPersistentRouteA
import PureSFormal.Research.RootResetPersistentFuelCarrier

/-!
# Route-A selection with the ordinary persistent fuel-carrier handoff

The maximal term-derived active context is computed first.  At that active
endpoint, the ordinary fifth-sample fuel-carrier parser has priority.  Its
pre-C4 result selects the immutable seed's canonical front; its post-C4
result selects R0 at the innermost pending frame.  If the carrier parser does
not apply, the existing verified 27-stage route-A result is used unchanged.

Every returned record contains both a whole-root address and its exact
contractum.  This module proves selection soundness and completeness under a
declared term-derived outer context.  It remains an isolated research
composition: it does not assert global scheduler closure or path identity.
-/

namespace PureSFormal.Research.RootResetPersistentRouteAFuel

open PureSFormal.PureS

namespace Route

abbrev ActiveContext := RootResetPersistentRouteA.ActiveContext
abbrev OuterStep := RootResetPersistentRouteA.OuterStep
abbrev Describes := RootResetPersistentRouteA.Describes
abbrev Classification := RootResetPersistentRouteA.Classification

end Route

namespace Fuel

abbrev View := RootResetPersistentFuelCarrier.View
abbrev SeedFront := RootResetPersistentFuelCarrier.SeedFront

end Fuel

/-- Exact result of one whole-root contraction selection. -/
structure Selection where
  address : Address
  target : Term

/-- Lift a carrier-local result through the term-derived outer context. -/
def fuelSelection
    {program : CTS.Program}
    (tree : Dispatcher.Tree (ActionLabel program))
    (outer : Route.ActiveContext program) (fuel : Fuel.View) : Selection :=
  ⟨outer.address ++ fuel.selectedAddress,
    outer.context.plug
      (fuel.target (compileActions program tree))⟩

/-- Verify and retain the target belonging to a fallback route-A address. -/
def checkedSelection? (term : Term) : Option Address → Option Selection
  | none => none
  | some address =>
      match term.contractAt? address with
      | none => none
      | some target => some ⟨address, target⟩

/-- A checked fallback selection carries its exact address-level contractum. -/
theorem checkedSelection?_sound
    {term : Term} {candidate : Option Address} {selection : Selection}
    (accepted : checkedSelection? term candidate = some selection) :
    term.contractAt? selection.address = some selection.target := by
  cases candidate with
  | none => simp [checkedSelection?] at accepted
  | some address =>
      generalize contractEq : term.contractAt? address = contractResult at accepted
      cases contractResult with
      | none => simp [checkedSelection?, contractEq] at accepted
      | some target =>
          have selectionEq : Selection.mk address target = selection := by
            exact Option.some.inj
              (by simpa [checkedSelection?, contractEq] using accepted)
          rw [← selectionEq]
          exact contractEq

/-- Composite result retaining the existing route-A classification. -/
structure Classification (program : CTS.Program) where
  route : Route.Classification program
  fuel : Option Fuel.View
  selected? : Option Selection

/--
Total composite selector.  The carrier handoff has priority only after the
same maximal active-context reconstruction used by persistent route A.
-/
def classify
    (program : CTS.Program)
    (layout : ActionDispatcher program)
    (term : Term) : Classification program :=
  let route := RootResetPersistentRouteA.classify program layout term
  match RootResetPersistentFuelCarrier.parse?
      (compileActions program layout.tree) route.outer.active with
  | some fuel =>
      ⟨route, some fuel, some (fuelSelection layout.tree route.outer fuel)⟩
  | none =>
      ⟨route, none, checkedSelection? term route.selectedAddress?⟩

/-- The carrier extension never changes the term-derived Route-A context. -/
@[simp]
theorem classify_route
    (program : CTS.Program) (layout : ActionDispatcher program) (term : Term) :
    (classify program layout term).route =
      RootResetPersistentRouteA.classify program layout term := by
  unfold classify
  dsimp only
  generalize parsedEq : RootResetPersistentFuelCarrier.parse?
    (compileActions program layout.tree)
    (RootResetPersistentRouteA.classify program layout term).outer.active = parsed
  cases parsed <;> rfl

/-- Definitional equation for the composite selection projection. -/
theorem classify_selected?_eq
    (program : CTS.Program) (layout : ActionDispatcher program) (term : Term) :
    (classify program layout term).selected? =
      match RootResetPersistentFuelCarrier.parse?
          (compileActions program layout.tree)
          (RootResetPersistentRouteA.classify program layout term).outer.active with
      | some fuel =>
          some (fuelSelection layout.tree
            (RootResetPersistentRouteA.classify program layout term).outer fuel)
      | none => checkedSelection? term
          (RootResetPersistentRouteA.classify program layout term).selectedAddress? := by
  unfold classify
  dsimp only
  generalize parsedEq : RootResetPersistentFuelCarrier.parse?
    (compileActions program layout.tree)
    (RootResetPersistentRouteA.classify program layout term).outer.active = parsed
  cases parsed <;> rfl

/-- The embedded route retains the exact source reconstruction and hole address. -/
theorem classify_source_and_address
    (program : CTS.Program) (layout : ActionDispatcher program) (term : Term) :
    (classify program layout term).route.outer.context.plug
          (classify program layout term).route.outer.active = term ∧
      RootResetSelectorContract.contextAddress
          (classify program layout term).route.outer.context =
        (classify program layout term).route.outer.address := by
  simpa only [classify_route] using
    RootResetPersistentRouteA.classify_source_and_address program layout term

/-- Carrier priority returns the literal lifted address and target. -/
theorem classify_fuel_priority
    {program : CTS.Program} {layout : ActionDispatcher program} {term : Term}
    {fuel : Fuel.View}
    (accepted : RootResetPersistentFuelCarrier.parse?
      (compileActions program layout.tree)
      (RootResetPersistentRouteA.classify program layout term).outer.active =
        some fuel) :
    (classify program layout term).fuel = some fuel ∧
      (classify program layout term).selected? =
        some (fuelSelection layout.tree
          (RootResetPersistentRouteA.classify program layout term).outer fuel) := by
  simp [classify, accepted]

/-- Every composite result is one exact contextual pure-S contraction. -/
theorem classify_selected_contracts
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {selection : Selection}
    (accepted : (classify program layout term).selected? = some selection) :
    term.contractAt? selection.address = some selection.target := by
  rw [classify_selected?_eq] at accepted
  let route := RootResetPersistentRouteA.classify program layout term
  generalize fuelEq : RootResetPersistentFuelCarrier.parse?
    (compileActions program layout.tree) route.outer.active = fuelResult at accepted
  cases fuelResult with
  | none =>
      exact checkedSelection?_sound accepted
  | some fuel =>
      have selectionEq : fuelSelection layout.tree route.outer fuel = selection :=
        Option.some.inj accepted
      rw [← selectionEq]
      have localContract := fuel.selected_contracts fuelEq
      have lifted := RootResetWholeStageClassifier.contractAt?_plug_append
        route.outer.context fuel.selectedAddress localContract
      have sourceAddress :=
        RootResetPersistentRouteA.classify_source_and_address
          program layout term
      have sourceAddress' :
          route.outer.context.plug route.outer.active = term ∧
            RootResetSelectorContract.contextAddress route.outer.context =
              route.outer.address := by
        simpa [route] using sourceAddress
      rw [sourceAddress'.1, sourceAddress'.2] at lifted
      simpa [fuelSelection] using lifted

/-- Every returned selection also denotes one `Step`. -/
theorem classify_selected_step
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {selection : Selection}
    (accepted : (classify program layout term).selected? = some selection) :
    Step term selection.target :=
  Term.contractAt?_sound (classify_selected_contracts accepted)

/-! ## Completeness below any declared outer context -/

/-- A carrier parse at a declaratively recovered endpoint wins the composite
classifier with the exact outer lift. -/
theorem classify_fuel_of_describes
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {outer : Route.ActiveContext program} {fuel : Fuel.View}
    (shape : Route.Describes program layout term outer)
    (parsed : RootResetPersistentFuelCarrier.parse?
      (compileActions program layout.tree) outer.active = some fuel) :
    (classify program layout term).fuel = some fuel ∧
      (classify program layout term).selected? =
        some (fuelSelection layout.tree outer fuel) := by
  have outerEq :=
    RootResetPersistentRouteA.describes_eq_activeContext shape
  have routeOuter :
      (RootResetPersistentRouteA.classify program layout term).outer = outer := by
    simpa [RootResetPersistentRouteA.classify] using outerEq.symm
  have parsedAtRoute : RootResetPersistentFuelCarrier.parse?
      (compileActions program layout.tree)
      (RootResetPersistentRouteA.classify program layout term).outer.active =
        some fuel := by
    simpa [routeOuter] using parsed
  have priority := classify_fuel_priority parsedAtRoute
  simpa [routeOuter] using priority

/-- Marked Local syntax has first priority in one outer descent. -/
theorem next?_marked
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {view : CheckpointDecoder.LocalView program}
    (marked : RootResetReachableStageGrammar.parseMarkedLocal?
      program layout.tree term = some view) :
    RootResetPersistentRouteA.next? program layout term =
      some (RootResetPersistentRouteA.markedStep term view) := by
  simp [RootResetPersistentRouteA.next?, marked]

/-- A fresh nonempty Local is selected after marked parsing has failed. -/
theorem next?_freshNonempty
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {view : CheckpointDecoder.LocalView program}
    (notMarked : RootResetReachableStageGrammar.parseMarkedLocal?
      program layout.tree term = none)
    (fresh : RootResetPersistentRouteA.parseFreshNonempty?
      program layout.tree term = some view) :
    RootResetPersistentRouteA.next? program layout term =
      some (RootResetPersistentRouteA.freshStep term view) := by
  simp [RootResetPersistentRouteA.next?, notMarked, fresh]

/-- A carrier selected below any marked Local continuation is lifted through
that Local by the same term-derived context. -/
theorem classify_fuel_under_marked
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {localView : CheckpointDecoder.LocalView program}
    {inner : Route.ActiveContext program} {fuel : Fuel.View}
    (marked : RootResetReachableStageGrammar.parseMarkedLocal?
      program layout.tree term = some localView)
    (innerShape : Route.Describes program layout localView.continuation inner)
    (parsed : RootResetPersistentFuelCarrier.parse?
      (compileActions program layout.tree) inner.active = some fuel) :
    let outer := RootResetPersistentRouteA.wrapOuter
      (RootResetPersistentRouteA.markedStep term localView) inner
    (classify program layout term).fuel = some fuel ∧
      (classify program layout term).selected? =
        some (fuelSelection layout.tree outer fuel) := by
  dsimp only
  apply classify_fuel_of_describes
    (RootResetPersistentRouteA.Describes.descend (next?_marked marked) innerShape)
    parsed

/-- A carrier selected below any fresh nonempty Local continuation is lifted
through that Local after the marked alternative is rejected. -/
theorem classify_fuel_under_freshNonempty
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {localView : CheckpointDecoder.LocalView program}
    {inner : Route.ActiveContext program} {fuel : Fuel.View}
    (notMarked : RootResetReachableStageGrammar.parseMarkedLocal?
      program layout.tree term = none)
    (fresh : RootResetPersistentRouteA.parseFreshNonempty?
      program layout.tree term = some localView)
    (innerShape : Route.Describes program layout localView.continuation inner)
    (parsed : RootResetPersistentFuelCarrier.parse?
      (compileActions program layout.tree) inner.active = some fuel) :
    let outer := RootResetPersistentRouteA.wrapOuter
      (RootResetPersistentRouteA.freshStep term localView) inner
    (classify program layout term).fuel = some fuel ∧
      (classify program layout term).selected? =
        some (fuelSelection layout.tree outer fuel) := by
  dsimp only
  apply classify_fuel_of_describes
    (RootResetPersistentRouteA.Describes.descend
      (next?_freshNonempty notMarked fresh) innerShape)
    parsed

/-! ## Generated fifth-sample completeness through a recovered context -/

/-- The generated pre-C4 fifth sample is selected exactly after any already
recovered fresh/marked outer continuation context. -/
theorem exists_generatedFifthSample_preC4_of_describes
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {outer : Route.ActiveContext program}
    (shape : Route.Describes program layout term outer)
    (bit : Bool) (suffix : List Bool) (continuation : Term)
    (admissible : Carrier.Admissible continuation) (depth : Nat)
    (activeEq :
      outer.active =
        let actions := compileActions program layout.tree
        let bits := bit :: suffix
        let layer := RootResetPersistentFuelCarrier.generatedLayer
          actions bits continuation
        let layers := List.replicate depth layer ++ [layer]
        let base := RootResetClockFuelCanonicalGrammar.generatedBaseView
          actions (word bits) continuation
        RootResetClockFuelStages.FuelView.term actions
          ⟨layers, .carrier base⟩) :
    ∃ fuel selection,
      (classify program layout term).fuel = some fuel ∧
        (classify program layout term).selected? = some selection ∧
        ∃ seed, fuel.stage = .preC4 seed ∧
          selection = fuelSelection layout.tree outer fuel := by
  let actions := compileActions program layout.tree
  obtain ⟨fuel, parsed, seed, stageEq, addressEq, contracts⟩ :=
    RootResetPersistentFuelCarrier.exists_preC4_of_generatedFifthSample
      actions bit suffix continuation admissible depth
  have parsedAtOuter : RootResetPersistentFuelCarrier.parse?
      actions outer.active = some fuel := by
    rw [activeEq]
    exact parsed
  have selected := classify_fuel_of_describes shape parsedAtOuter
  refine ⟨fuel, fuelSelection layout.tree outer fuel,
    selected.1, selected.2, seed, stageEq, rfl⟩

/-- The generated post-C4 fifth sample hands off to the innermost pending
frame R0 after any already recovered fresh/marked outer continuation context. -/
theorem exists_generatedFifthSample_postC4_of_describes
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {outer : Route.ActiveContext program}
    (shape : Route.Describes program layout term outer)
    (bit : Bool) (suffix : List Bool) (continuation : Term)
    (admissible : Carrier.Admissible continuation) (depth : Nat)
    (activeEq :
      ∃ seed,
        RootResetPersistentFuelCarrier.parseSeedFront?
            (word (bit :: suffix)) = some seed ∧
          outer.active =
            let actions := compileActions program layout.tree
            let bits := bit :: suffix
            let layer := RootResetPersistentFuelCarrier.generatedLayer
              actions bits continuation
            let layers := List.replicate depth layer ++ [layer]
            let base := RootResetClockFuelCanonicalGrammar.generatedBaseView
              actions (word bits) continuation
            RootResetClockFuelStages.FuelView.term actions
              ⟨layers, .carrier
                (RootResetPersistentFuelCarrier.withQueue
                  base seed.front.endpoint)⟩) :
    ∃ fuel selection seed,
      (classify program layout term).fuel = some fuel ∧
        (classify program layout term).selected? = some selection ∧
        fuel.stage = .postC4 seed
          ⟨List.replicate depth
              (RootResetPersistentFuelCarrier.generatedLayer
                (compileActions program layout.tree) (bit :: suffix)
                continuation),
            RootResetPersistentFuelCarrier.generatedLayer
              (compileActions program layout.tree) (bit :: suffix)
              continuation⟩ ∧
        fuel.selectedAddress = RootResetClockFuelStages.rights depth ∧
        selection = fuelSelection layout.tree outer fuel := by
  obtain ⟨seed, seedParsed, outerActive⟩ := activeEq
  let actions := compileActions program layout.tree
  obtain ⟨returnedSeed, fuel, returnedSeedParsed, parsed, stageEq,
      addressEq, contracts⟩ :=
    RootResetPersistentFuelCarrier.exists_postC4_handoff_of_generatedFifthSample
      actions bit suffix continuation admissible depth
  have seedEq : returnedSeed = seed := by
    exact Option.some.inj (returnedSeedParsed.symm.trans seedParsed)
  subst returnedSeed
  have parsedAtOuter : RootResetPersistentFuelCarrier.parse?
      actions outer.active = some fuel := by
    rw [outerActive]
    exact parsed
  have selected := classify_fuel_of_describes shape parsedAtOuter
  refine ⟨fuel, fuelSelection layout.tree outer fuel, seed,
    selected.1, selected.2, ?_, addressEq, rfl⟩
  simpa [actions] using stageEq

/-! ## Fuel-aware active-context traversal

The maximal Route-A traversal deliberately descends through the innermost
pending frame once C4 has changed its Base child.  For the handoff contraction
the frame itself is the active endpoint.  The traversal below is still wholly
term-derived: it uses the same Route-A outer steps, but stops as soon as the
ordinary fuel parser recognizes the current subtree. -/

/-- Follow Route-A outer edges only until the fuel carrier becomes
recognizable.  No scheduler state or cursor is an input. -/
def fuelActiveContext
    (program : CTS.Program)
    (layout : ActionDispatcher program)
    (term : Term) : Route.ActiveContext program :=
  match RootResetPersistentFuelCarrier.parse?
      (compileActions program layout.tree) term with
  | some _ => ⟨term, .hole, [], [], []⟩
  | none =>
      match found : RootResetPersistentRouteA.next? program layout term with
      | none => ⟨term, .hole, [], [], []⟩
      | some step =>
          RootResetPersistentRouteA.wrapOuter step
            (fuelActiveContext program layout step.child)
termination_by term.size
decreasing_by
  exact (RootResetPersistentRouteA.next?_valid (by assumption)).child_size_lt

/-- The fuel-aware traversal reconstructs its source and its root-relative
hole address exactly. -/
theorem fuelActiveContext_source_and_address
    (program : CTS.Program) (layout : ActionDispatcher program) (term : Term) :
    let outer := fuelActiveContext program layout term
    outer.context.plug outer.active = term ∧
      RootResetSelectorContract.contextAddress outer.context = outer.address := by
  rw [fuelActiveContext]
  split
  next _ => exact ⟨rfl, rfl⟩
  next _ =>
    split
    next _ => exact ⟨rfl, rfl⟩
    next step found =>
      have inner := fuelActiveContext_source_and_address
        program layout step.child
      have stepFacts := RootResetPersistentRouteA.next?_valid found
      exact ⟨by
          simp only [RootResetPersistentRouteA.wrapOuter, Context.plug_comp]
          rw [inner.1, stepFacts.source_eq],
        by
          simp only [RootResetPersistentRouteA.wrapOuter,
            RootResetSelectorContract.contextAddress_comp]
          rw [stepFacts.address_eq, inner.2]⟩
termination_by term.size
decreasing_by
  exact (RootResetPersistentRouteA.next?_valid (by assumption)).child_size_lt

/-- Handoff-aware classification.  Its fallback is exactly the existing
Route-A classification; only a successful fuel parse uses the earlier
fuel-aware stopping point. -/
structure HandoffClassification (program : CTS.Program) where
  route : Route.Classification program
  fuelOuter : Route.ActiveContext program
  fuel : Option Fuel.View
  selected? : Option Selection

/-- Total handoff-aware selector over the current bare term. -/
def classifyHandoff
    (program : CTS.Program)
    (layout : ActionDispatcher program)
    (term : Term) : HandoffClassification program :=
  let route := RootResetPersistentRouteA.classify program layout term
  let fuelOuter := fuelActiveContext program layout term
  match RootResetPersistentFuelCarrier.parse?
      (compileActions program layout.tree) fuelOuter.active with
  | some fuel =>
      ⟨route, fuelOuter, some fuel,
        some (fuelSelection layout.tree fuelOuter fuel)⟩
  | none =>
      ⟨route, fuelOuter, none,
        checkedSelection? term route.selectedAddress?⟩

/-- Every handoff-aware result is the exact contraction at its returned
whole-root address. -/
theorem classifyHandoff_selected_contracts
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {selection : Selection}
    (accepted :
      (classifyHandoff program layout term).selected? = some selection) :
    term.contractAt? selection.address = some selection.target := by
  unfold classifyHandoff at accepted
  dsimp only at accepted
  generalize fuelEq : RootResetPersistentFuelCarrier.parse?
      (compileActions program layout.tree)
      (fuelActiveContext program layout term).active = fuelResult at accepted
  cases fuelResult with
  | none =>
      exact checkedSelection?_sound accepted
  | some fuel =>
      have selectionEq :
          fuelSelection layout.tree (fuelActiveContext program layout term)
            fuel = selection :=
        Option.some.inj accepted
      rw [← selectionEq]
      have localContract := fuel.selected_contracts fuelEq
      have lifted := RootResetWholeStageClassifier.contractAt?_plug_append
        (fuelActiveContext program layout term).context
        fuel.selectedAddress localContract
      have outerFacts := fuelActiveContext_source_and_address
        program layout term
      rw [outerFacts.1, outerFacts.2] at lifted
      simpa [fuelSelection] using lifted

/-- Every handoff-aware successor is one contextual pure-S step. -/
theorem classifyHandoff_selected_step
    {program : CTS.Program} {layout : ActionDispatcher program}
    {term : Term} {selection : Selection}
    (accepted :
      (classifyHandoff program layout term).selected? = some selection) :
    Step term selection.target :=
  Term.contractAt?_sound (classifyHandoff_selected_contracts accepted)

/-- A fuel parse at the fuel-aware endpoint has priority over Route A's
fallback candidate. -/
theorem classifyHandoff_fuel_priority
    {program : CTS.Program} {layout : ActionDispatcher program} {term : Term}
    {fuel : Fuel.View}
    (accepted : RootResetPersistentFuelCarrier.parse?
      (compileActions program layout.tree)
      (fuelActiveContext program layout term).active = some fuel) :
    (classifyHandoff program layout term).fuel = some fuel ∧
      (classifyHandoff program layout term).selected? =
        some (fuelSelection layout.tree
          (fuelActiveContext program layout term) fuel) := by
  simp [classifyHandoff, accepted]

end PureSFormal.Research.RootResetPersistentRouteAFuel
