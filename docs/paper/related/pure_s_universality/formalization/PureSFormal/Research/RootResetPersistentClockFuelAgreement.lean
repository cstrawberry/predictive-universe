import PureSFormal.Research.RootResetPersistentRouteA
import PureSFormal.Research.RootResetClockFuelStages
import PureSFormal.Research.RootResetPersistentFuelCarrier
import PureSFormal.Research.RootResetPersistentInitialBridge
import PureSFormal.Research.RootResetPersistentSelector
import PureSFormal.Research.RootResetExactTraceAgreement

/-!
# Clock/fuel agreement for persistent route A

This module relates the syntax-only route-A classifier to the explicit clock
and fuel mutation rows used by the persistent scheduler.  It is isolated from
the public surface: the results below cover only the registered clock/fuel
families and do not assert closure of the complete scheduler cycle.
-/

namespace PureSFormal.Research.RootResetPersistentClockFuelAgreement

open PureSFormal.PureS
open PureSFormal.PureS.SchedulerInvariant
open RootResetReachableStageGrammar
open RootResetClockFuelStages
open RootResetClockFuelCanonicalGrammar
open RootResetCompositeStageRegistry

namespace RouteA

abbrev Classification := RootResetPersistentRouteA.Classification
abbrev RegistryView := RootResetTwentySevenStageRegistry.View

/-- Exact address and contractum returned by the route-A classifier. -/
def Selects (program : CTS.Program) (layout : ActionDispatcher program)
    (source target : Term) (address : Address) : Prop :=
  (RootResetPersistentRouteA.classify program layout source).selectedAddress? =
      some address ∧
    source.contractAt? address = some target

/-- At a root endpoint, an accepted verified candidate is returned literally. -/
theorem selects_of_root
    {program : CTS.Program} {layout : ActionDispatcher program}
    {source target : Term} {view : RegistryView program} {address : Address}
    (stop : RootResetPersistentRouteA.next? program layout source = none)
    (parsed : RootResetTwentySevenStageRegistry.parse? program layout source =
      some view)
    (candidate : RootResetPersistentRouteA.endpointCandidate?
      program layout.tree source view = some address)
    (contracts : source.contractAt? address = some target) :
    Selects program layout source target address := by
  constructor
  · unfold RootResetPersistentRouteA.classify
    dsimp only
    rw [RootResetPersistentRouteA.activeContext, stop]
    simp only
    rw [parsed]
    simp [RootResetPersistentRouteA.verifiedCandidate?, candidate, contracts]
  · exact contracts

end RouteA

/-! ## Lower-level clock mutation rows -/

/-- The positive-clock runtime cursor identifies the exact bare-term redex and contractum. -/
theorem positiveClockSource_contractAt_cursorAddress
    (program : CTS.Program) (layout : ActionDispatcher program)
    (registers : SchedulerControl.Registers program)
    (stage wrappers remaining : Nat) (parents : List ParentFrame) :
    let source := positiveClockSourceConfiguration program layout registers
      stage wrappers remaining parents
    let target := positiveClockMutationConfiguration program layout registers
      stage wrappers remaining parents
    source.cursor.erase.contractAt?
        (RootResetSelectorContract.cursorAddress source.cursor) =
      some target.cursor.erase := by
  dsimp only
  rw [RootResetSelectorContract.contractAt?_cursorAddress]
  simp [positiveClockSourceConfiguration,
    positiveClockMutationConfiguration, C, b, Term.contractRoot?,
    Term.redex, Term.contractum, Cursor.erase]

/-- The zero-clock runtime cursor identifies the exact bare-term redex and contractum. -/
theorem zeroClockSource_contractAt_cursorAddress
    (program : CTS.Program) (layout : ActionDispatcher program)
    (registers : SchedulerControl.Registers program)
    (stage wrappers : Nat) (parents : List ParentFrame) :
    let source := zeroClockSourceConfiguration program layout registers
      stage wrappers parents
    let target := zeroClockMutationConfiguration program layout registers
      stage wrappers parents
    source.cursor.erase.contractAt?
        (RootResetSelectorContract.cursorAddress source.cursor) =
      some target.cursor.erase := by
  dsimp only
  rw [RootResetSelectorContract.contractAt?_cursorAddress]
  simp [zeroClockSourceConfiguration, zeroClockMutationConfiguration,
    clockBase, C, b, Term.contractRoot?, Term.redex, Term.contractum,
    Cursor.erase]

/-! ## Bare-root clock rows -/

/-- Bare term left by one positive clock mutation at the public environment root. -/
def clockPostPositiveTerm
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage wrappers remaining : Nat) (bits : List Bool) : Term :=
  .app (clockGrowthCore stage (wrappers + 1) remaining)
    (environmentCode (compileActions program layout.tree) bits)

/-- Exact role-free view of that post-mutation clock row. -/
def clockPostPositiveView
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage wrappers remaining : Nat) (bits : List Bool) : ClockView :=
  match remaining with
  | 0 => ⟨.growZero, stage, wrappers + 1, 0,
      environmentCode (compileActions program layout.tree) bits⟩
  | remaining + 1 => ⟨.growPositive, stage, wrappers + 1, remaining + 1,
      environmentCode (compileActions program layout.tree) bits⟩

/-- A post-positive row satisfying the clock balance is parsed exactly. -/
theorem parseClock?_clockPostPositive
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage wrappers remaining : Nat) (bits : List Bool)
    (balance : wrappers + 1 + remaining = stage) :
    parseClock? (clockPostPositiveTerm program layout stage wrappers remaining bits) =
      some (clockPostPositiveView program layout stage wrappers remaining bits) := by
  cases remaining with
  | zero =>
      simpa [clockPostPositiveTerm, clockPostPositiveView] using
        parseClock?_generated_zero stage (wrappers + 1)
          (environmentCode (compileActions program layout.tree) bits) balance
  | succ remaining =>
      simpa [clockPostPositiveTerm, clockPostPositiveView] using
        parseClock?_generated_positive stage (wrappers + 1) remaining
          (environmentCode (compileActions program layout.tree) bits) balance

/-- Post-positive clock roots cannot be completed Local shells. -/
theorem parseLocal?_clockPostPositive_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage wrappers remaining : Nat) (bits : List Bool) :
    CheckpointDecoder.parseLocal? program layout.tree
      (clockPostPositiveTerm program layout stage wrappers remaining bits) = none := by
  apply CheckpointDecoder.parseLocal?_none_of_headArity
  · simp [clockPostPositiveTerm, clockGrowthCore, clockWrap]
  · simp [clockPostPositiveTerm, clockGrowthCore, clockWrap]

/-- Route-A has no completed-Local descent at a post-positive clock root. -/
theorem parseMarkedLocal?_clockPostPositive_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage wrappers remaining : Nat) (bits : List Bool) :
    parseMarkedLocal? program layout.tree
      (clockPostPositiveTerm program layout stage wrappers remaining bits) = none := by
  simp [parseMarkedLocal?, parseLocal?_clockPostPositive_none]

/-- Marked-prefix parsing stops at a post-positive clock root. -/
theorem peelMarked_clockPostPositive
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage wrappers remaining : Nat) (bits : List Bool) :
    peelMarked program layout.tree
        (clockPostPositiveTerm program layout stage wrappers remaining bits) =
      ⟨clockPostPositiveTerm program layout stage wrappers remaining bits,
        .hole, []⟩ := by
  have components := markedPrefix_eq_peelMarked
    (.here (parseMarkedLocal?_clockPostPositive_none program layout stage
      wrappers remaining bits))
  generalize decompositionEq : peelMarked program layout.tree
    (clockPostPositiveTerm program layout stage wrappers remaining bits) =
      decomposition at components ⊢
  rcases decomposition with ⟨active, context, history⟩
  simp only at components ⊢
  rcases components with ⟨activeEq, contextEq, historyEq⟩
  subst active
  subst context
  subst history
  rfl

/-- Whole clock/fuel view reconstructed from a post-positive sample. -/
def clockPostPositiveClockFuelView
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage wrappers remaining : Nat) (bits : List Bool) :
    ClockFuelView program :=
  ⟨clockPostPositiveTerm program layout stage wrappers remaining bits,
    .hole, [],
    .clock (clockPostPositiveView program layout stage wrappers remaining bits)⟩

/-- The canonical whole parser recognizes every balanced post-positive sample. -/
theorem parseClockFuel?_clockPostPositive
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage wrappers remaining : Nat) (bits : List Bool)
    (balance : wrappers + 1 + remaining = stage) :
    parseClockFuel? program layout.tree
        (clockPostPositiveTerm program layout stage wrappers remaining bits) =
      some (clockPostPositiveClockFuelView program layout stage wrappers
        remaining bits) := by
  apply parseClockFuel?_complete
  constructor
  · exact .here (parseMarkedLocal?_clockPostPositive_none program layout stage
      wrappers remaining bits)
  · apply ClockFuelActiveShape.clock
    · cases remaining <;>
        simp [clockPostPositiveClockFuelView, clockPostPositiveTerm,
          clockPostPositiveView, ClockView.term]
    · constructor
      · cases remaining with
        | zero => exact ⟨rfl, balance⟩
        | succ remaining => exact ⟨Nat.zero_lt_succ remaining, balance⟩
      · cases remaining <;>
          exact ⟨word bits,
            CheckpointDecoder.openEnvironment_word _ _ |>.symm⟩

/-- A clock root cannot have the five-argument fresh-shell form of a dispatcher row. -/
theorem dispatcher_active_clockPostPositive_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage wrappers remaining : Nat) (bits : List Bool) :
    RootResetWholeDispatcherStages.parseActive? program layout []
        (clockPostPositiveTerm program layout stage wrappers remaining bits) = none := by
  cases parsed : RootResetWholeDispatcherStages.parseActive? program layout []
      (clockPostPositiveTerm program layout stage wrappers remaining bits) with
  | none => rfl
  | some view =>
      have shape := RootResetWholeDispatcherStages.parseActive?_sound parsed
      cases shape with
      | intro haltField dispatcherTerm seedAudit continuationAudit halt phaseEq
          frontBitEq routeEq routeShape sourceEq =>
          cases halt with
          | fresh haltAudit =>
              have arity := congrArg Term.headArity sourceEq
              simp [clockPostPositiveTerm, clockGrowthCore, clockWrap,
                CheckpointDecoder.openShell, freshHField] at arity

/-- The same root cannot have the fresh-shell form of an appender row. -/
theorem appender_active_clockPostPositive_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage wrappers remaining : Nat) (bits : List Bool) :
    RootResetWholeAppenderStages.parseActive? program layout.tree
        (clockPostPositiveTerm program layout stage wrappers remaining bits) = none := by
  cases parsed : RootResetWholeAppenderStages.parseActive? program layout.tree
      (clockPostPositiveTerm program layout stage wrappers remaining bits) with
  | none => rfl
  | some view =>
      have shape := RootResetWholeAppenderStages.parseActive?_sound parsed
      rcases shape.source_eq with
        ⟨haltField, dispatcher, seedAudit, continuationAudit, halt, route,
          sourceEq⟩
      cases halt with
      | fresh haltAudit =>
          have arity := congrArg Term.headArity sourceEq
          simp [clockPostPositiveTerm, clockGrowthCore, clockWrap,
            CheckpointDecoder.openShell, freshHField] at arity

/-- Earlier registered families reject every balanced post-positive clock sample. -/
theorem dispatcher_parse_clockPostPositive_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage wrappers remaining : Nat) (bits : List Bool) :
    RootResetWholeDispatcherStages.parse? program layout
        (clockPostPositiveTerm program layout stage wrappers remaining bits) = none := by
  rw [RootResetWholeDispatcherStages.parse?,
    peelMarked_clockPostPositive]
  simp [dispatcher_active_clockPostPositive_none]

theorem appender_parse_clockPostPositive_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage wrappers remaining : Nat) (bits : List Bool) :
    RootResetWholeAppenderStages.parse? program layout.tree
        (clockPostPositiveTerm program layout stage wrappers remaining bits) = none := by
  rw [RootResetWholeAppenderStages.parse?,
    peelMarked_clockPostPositive]
  simp [appender_active_clockPostPositive_none]

theorem response_parse_clockPostPositive_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage wrappers remaining : Nat) (bits : List Bool) :
    RootResetResponseBoundaryStages.parse? program layout.tree
        (clockPostPositiveTerm program layout stage wrappers remaining bits) = none := by
  rw [RootResetResponseBoundaryStages.parse?,
    peelMarked_clockPostPositive]
  simp [RootResetResponseBoundaryStages.parseActive?,
    RootResetResponseBoundaryStages.parseCleanMarkedHistory?,
    parseLocal?_clockPostPositive_none]

/-- A stage numeral under one `S` is not the fixed open-environment wrapper. -/
theorem parseEnvironment?_appS_C_none (actions : Term) (stage : Nat) :
    CheckpointDecoder.parseEnvironment? actions (.app .s (C stage)) = none := by
  cases stage with
  | zero => rfl
  | succ stage =>
      have carrierNotUnary : ∀ seed, C stage ≠ .app .s seed := by
        intro seed equal
        have arity : 2 = 1 := by
          simpa only [carrierC_headArity, Term.headArity] using
            congrArg Term.headArity equal
        contradiction
      simp only [CheckpointDecoder.parseEnvironment?, C, b]
      split
      · next leftHead foundAct seedPayload shape =>
          have rightEq : C stage = .app .s seedPayload := by
            injection shape with _ outerEq
            injection outerEq with _ rightEq
          exact (carrierNotUnary seedPayload rightEq).elim
      · rfl

/-- Consequently a post-positive clock root is not an enclosing pending frame. -/
theorem parseFrameR0?_clockPostPositive_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage wrappers remaining : Nat) (bits : List Bool) :
    parseFrameR0? (compileActions program layout.tree)
      (clockPostPositiveTerm program layout stage wrappers remaining bits) = none := by
  simp [clockPostPositiveTerm, clockGrowthCore, clockWrap, parseFrameR0?,
    parseEnvironment?_appS_C_none]

theorem parseFreshNonempty?_clockPostPositive_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage wrappers remaining : Nat) (bits : List Bool) :
    RootResetPersistentRouteA.parseFreshNonempty? program layout.tree
      (clockPostPositiveTerm program layout stage wrappers remaining bits) = none := by
  simp only [RootResetPersistentRouteA.parseFreshNonempty?,
    parseLocal?_clockPostPositive_none]

theorem parsePendingActive?_clockPostPositive_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage wrappers remaining : Nat) (bits : List Bool) :
    RootResetPersistentRouteA.parsePendingActive? program layout
      (clockPostPositiveTerm program layout stage wrappers remaining bits) = none := by
  simp only [RootResetPersistentRouteA.parsePendingActive?,
    parseFrameR0?_clockPostPositive_none]

/-- Route-A performs no outer descent before classifying the clock endpoint. -/
theorem next?_clockPostPositive_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage wrappers remaining : Nat) (bits : List Bool) :
    RootResetPersistentRouteA.next? program layout
      (clockPostPositiveTerm program layout stage wrappers remaining bits) = none := by
  simp only [RootResetPersistentRouteA.next?,
    parseMarkedLocal?_clockPostPositive_none,
    parseFreshNonempty?_clockPostPositive_none,
    parsePendingActive?_clockPostPositive_none, Option.map]

/-- Exact eighteen-stage view of a balanced post-positive sample. -/
def clockPostPositiveCompositeView
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage wrappers remaining : Nat) (bits : List Bool) :
    RootResetCompositeStageRegistry.View program :=
  .clockFuel (clockPostPositiveClockFuelView program layout stage wrappers
    remaining bits)

theorem parseComposite?_clockPostPositive
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage wrappers remaining : Nat) (bits : List Bool)
    (balance : wrappers + 1 + remaining = stage) :
    RootResetCompositeStageRegistry.parse? program layout
        (clockPostPositiveTerm program layout stage wrappers remaining bits) =
      some (clockPostPositiveCompositeView program layout stage wrappers
        remaining bits) := by
  rw [RootResetCompositeStageRegistry.parse?]
  rw [dispatcher_parse_clockPostPositive_none,
    appender_parse_clockPostPositive_none,
    response_parse_clockPostPositive_none,
    parseClockFuel?_clockPostPositive _ _ _ _ _ _ balance]
  rfl

/-- Exact twenty-seven-stage view of a balanced post-positive sample. -/
def clockPostPositiveRegisteredView
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage wrappers remaining : Nat) (bits : List Bool) :
    RouteA.RegistryView program :=
  .registered (clockPostPositiveCompositeView program layout stage wrappers
    remaining bits)

theorem parseTwentySeven?_clockPostPositive
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage wrappers remaining : Nat) (bits : List Bool)
    (balance : wrappers + 1 + remaining = stage) :
    RootResetTwentySevenStageRegistry.parse? program layout
        (clockPostPositiveTerm program layout stage wrappers remaining bits) =
      some (clockPostPositiveRegisteredView program layout stage wrappers
        remaining bits) := by
  rw [RootResetTwentySevenStageRegistry.parse?,
    parseComposite?_clockPostPositive _ _ _ _ _ _ balance]
  rfl

/-- The registered endpoint returns the literal next residual-pair address. -/
theorem endpointCandidate?_clockPostPositive
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage wrappers remaining : Nat) (bits : List Bool) :
    RootResetPersistentRouteA.endpointCandidate? program layout.tree
        (clockPostPositiveTerm program layout stage wrappers remaining bits)
        (clockPostPositiveRegisteredView program layout stage wrappers
          remaining bits) =
      some (.left :: rights (wrappers + 1)) := by
  cases remaining <;>
    rfl

/-- The nearest-parent-first clock zipper denotes the same root path as `rights`. -/
theorem addressFromParents_wrapperParents
    (stage wrappers : Nat) (parents : List ParentFrame) :
    RootResetSelectorContract.addressFromParents
        (PrimitiveClock.wrapperParents stage wrappers parents) =
      RootResetSelectorContract.addressFromParents parents ++ rights wrappers := by
  induction wrappers generalizing parents with
  | zero => simp [PrimitiveClock.wrapperParents]
  | succ wrappers ih =>
      rw [PrimitiveClock.wrapperParents, ih]
      simp [RootResetSelectorContract.addressFromParents, rights,
        List.append_assoc]

theorem cursorAddress_positiveClockSource
    (program : CTS.Program) (layout : ActionDispatcher program)
    (registers : SchedulerControl.Registers program)
    (stage wrappers remaining : Nat) (environment : Term) :
    RootResetSelectorContract.cursorAddress
        (positiveClockSourceConfiguration program layout registers stage wrappers
          remaining [.left environment]).cursor =
      .left :: rights wrappers := by
  simp [positiveClockSourceConfiguration,
    RootResetSelectorContract.cursorAddress,
    addressFromParents_wrapperParents,
    RootResetSelectorContract.addressFromParents]

theorem cursorAddress_zeroClockSource
    (program : CTS.Program) (layout : ActionDispatcher program)
    (registers : SchedulerControl.Registers program)
    (stage wrappers : Nat) (environment : Term) :
    RootResetSelectorContract.cursorAddress
        (zeroClockSourceConfiguration program layout registers stage wrappers
          [.left environment]).cursor =
      .left :: rights wrappers := by
  simp [zeroClockSourceConfiguration,
    RootResetSelectorContract.cursorAddress,
    addressFromParents_wrapperParents,
    RootResetSelectorContract.addressFromParents]

/-- Every positive residual post-state selects the scheduler's next positive row. -/
theorem clockPostPositive_selects_nextPositive
    (program : CTS.Program) (layout : ActionDispatcher program)
    (registers : SchedulerControl.Registers program)
    (stage wrappers remaining : Nat) (bits : List Bool)
    (balance : wrappers + 1 + (remaining + 1) = stage) :
    let source := clockPostPositiveTerm program layout stage wrappers
      (remaining + 1) bits
    let nextSource := positiveClockSourceConfiguration program layout registers
      stage (wrappers + 1) remaining
      [.left (environmentCode (compileActions program layout.tree) bits)]
    let target := positiveClockMutationConfiguration program layout registers
      stage (wrappers + 1) remaining
      [.left (environmentCode (compileActions program layout.tree) bits)]
    RouteA.Selects program layout source target.cursor.erase
      (RootResetSelectorContract.cursorAddress nextSource.cursor) := by
  dsimp only
  apply RouteA.selects_of_root
      (next?_clockPostPositive_none program layout stage wrappers
        (remaining + 1) bits)
      (parseTwentySeven?_clockPostPositive program layout stage wrappers
        (remaining + 1) bits balance)
  · rw [cursorAddress_positiveClockSource]
    exact endpointCandidate?_clockPostPositive program layout stage wrappers
      (remaining + 1) bits
  · have sourceEq :
        (positiveClockSourceConfiguration program layout registers stage
          (wrappers + 1) remaining
          [.left (environmentCode
            (compileActions program layout.tree) bits)]).cursor.erase =
          clockPostPositiveTerm program layout stage wrappers
            (remaining + 1) bits := by
        simpa [positiveClockSourceConfiguration, clockPostPositiveTerm] using!
          SchedulerInvariant.erase_clockGrowth_before stage (wrappers + 1)
            remaining [.left (environmentCode
              (compileActions program layout.tree) bits)]
    rw [← sourceEq]
    exact positiveClockSource_contractAt_cursorAddress program layout registers
      stage (wrappers + 1) remaining
      [.left (environmentCode (compileActions program layout.tree) bits)]

/-- A zero residual post-state selects the scheduler's closing-zero row. -/
theorem clockPostPositive_selects_closingZero
    (program : CTS.Program) (layout : ActionDispatcher program)
    (registers : SchedulerControl.Registers program)
    (stage wrappers : Nat) (bits : List Bool)
    (balance : wrappers + 1 = stage) :
    let source := clockPostPositiveTerm program layout stage wrappers 0 bits
    let nextSource := zeroClockSourceConfiguration program layout registers
      stage (wrappers + 1)
      [.left (environmentCode (compileActions program layout.tree) bits)]
    let target := zeroClockMutationConfiguration program layout registers
      stage (wrappers + 1)
      [.left (environmentCode (compileActions program layout.tree) bits)]
    RouteA.Selects program layout source target.cursor.erase
      (RootResetSelectorContract.cursorAddress nextSource.cursor) := by
  dsimp only
  apply RouteA.selects_of_root
      (next?_clockPostPositive_none program layout stage wrappers 0 bits)
      (parseTwentySeven?_clockPostPositive program layout stage wrappers 0 bits
        balance)
  · rw [cursorAddress_zeroClockSource]
    exact endpointCandidate?_clockPostPositive program layout stage wrappers 0 bits
  · have sourceEq :
        (zeroClockSourceConfiguration program layout registers stage
          (wrappers + 1)
          [.left (environmentCode
            (compileActions program layout.tree) bits)]).cursor.erase =
          clockPostPositiveTerm program layout stage wrappers 0 bits := by
        simpa [zeroClockSourceConfiguration, clockPostPositiveTerm] using!
          SchedulerInvariant.rebuild_wrapperParents stage (wrappers + 1)
            (.app (C 0) (C stage))
            [.left (environmentCode
              (compileActions program layout.tree) bits)]
    rw [← sourceEq]
    exact zeroClockSource_contractAt_cursorAddress program layout registers stage
      (wrappers + 1)
      [.left (environmentCode (compileActions program layout.tree) bits)]

/-! ## Completed positive-stage clock rows -/

/-- Fully exposed positive clock stage, immediately before its launch contraction. -/
def clockLaunchTerm
    (program : CTS.Program) (layout : ActionDispatcher program)
    (fuel : Nat) (bits : List Bool) : Term :=
  Dovetail.clockExit (fuel + 1) (fuel + 1)
    (environmentCode (compileActions program layout.tree) bits)

def clockLaunchView
    (program : CTS.Program) (layout : ActionDispatcher program)
    (fuel : Nat) (bits : List Bool) : ClockView :=
  ⟨.launch, fuel + 1, 0, fuel + 1,
    environmentCode (compileActions program layout.tree) bits⟩

def clockLaunchClockFuelView
    (program : CTS.Program) (layout : ActionDispatcher program)
    (fuel : Nat) (bits : List Bool) : ClockFuelView program :=
  ⟨clockLaunchTerm program layout fuel bits, .hole, [],
    .clock (clockLaunchView program layout fuel bits)⟩

theorem parseLocal?_clockLaunch_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (fuel : Nat) (bits : List Bool) :
    CheckpointDecoder.parseLocal? program layout.tree
      (clockLaunchTerm program layout fuel bits) = none := by
  simpa [clockLaunchTerm] using
    CheckpointDecoder.parseLocal?_nonterminalExit_none program layout.tree
      (fuel + 1) fuel
      (environmentCode (compileActions program layout.tree) bits)

theorem parseMarkedLocal?_clockLaunch_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (fuel : Nat) (bits : List Bool) :
    parseMarkedLocal? program layout.tree
      (clockLaunchTerm program layout fuel bits) = none := by
  simp [parseMarkedLocal?, parseLocal?_clockLaunch_none]

theorem peelMarked_clockLaunch
    (program : CTS.Program) (layout : ActionDispatcher program)
    (fuel : Nat) (bits : List Bool) :
    peelMarked program layout.tree (clockLaunchTerm program layout fuel bits) =
      ⟨clockLaunchTerm program layout fuel bits, .hole, []⟩ := by
  have components := markedPrefix_eq_peelMarked
    (.here (parseMarkedLocal?_clockLaunch_none program layout fuel bits))
  generalize decompositionEq : peelMarked program layout.tree
    (clockLaunchTerm program layout fuel bits) = decomposition at components ⊢
  rcases decomposition with ⟨active, context, history⟩
  simp only at components ⊢
  rcases components with ⟨activeEq, contextEq, historyEq⟩
  subst active
  subst context
  subst history
  rfl

theorem parseClockFuel?_clockLaunch
    (program : CTS.Program) (layout : ActionDispatcher program)
    (fuel : Nat) (bits : List Bool) :
    parseClockFuel? program layout.tree
        (clockLaunchTerm program layout fuel bits) =
      some (clockLaunchClockFuelView program layout fuel bits) := by
  apply parseClockFuel?_complete
  constructor
  · exact .here (parseMarkedLocal?_clockLaunch_none program layout fuel bits)
  · apply ClockFuelActiveShape.clock
    · rfl
    · constructor
      · exact ⟨rfl, Nat.zero_lt_succ fuel, Nat.le_refl _⟩
      · exact ⟨word bits,
          CheckpointDecoder.openEnvironment_word _ _ |>.symm⟩

theorem dispatcher_active_clockLaunch_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (fuel : Nat) (bits : List Bool) :
    RootResetWholeDispatcherStages.parseActive? program layout []
      (clockLaunchTerm program layout fuel bits) = none := by
  cases parsed : RootResetWholeDispatcherStages.parseActive? program layout []
      (clockLaunchTerm program layout fuel bits) with
  | none => rfl
  | some view =>
      have shape := RootResetWholeDispatcherStages.parseActive?_sound parsed
      cases shape with
      | intro haltField dispatcherTerm seedAudit continuationAudit halt phaseEq
          frontBitEq routeEq routeShape sourceEq =>
          cases halt with
          | fresh haltAudit =>
              have arity := congrArg Term.headArity sourceEq
              have sourceArity :
                  (clockLaunchTerm program layout fuel bits).headArity = 3 := by
                exact Dovetail.headArity_clockExit_succ (fuel + 1) fuel _
              have shellArity :
                  (CheckpointDecoder.openShell (freshHField haltAudit)
                    dispatcherTerm (word view.bits) seedAudit view.continuation
                    continuationAudit).headArity = 6 := by
                rfl
              rw [sourceArity, shellArity] at arity
              contradiction

theorem appender_active_clockLaunch_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (fuel : Nat) (bits : List Bool) :
    RootResetWholeAppenderStages.parseActive? program layout.tree
      (clockLaunchTerm program layout fuel bits) = none := by
  cases parsed : RootResetWholeAppenderStages.parseActive? program layout.tree
      (clockLaunchTerm program layout fuel bits) with
  | none => rfl
  | some view =>
      have shape := RootResetWholeAppenderStages.parseActive?_sound parsed
      rcases shape.source_eq with
        ⟨haltField, dispatcher, seedAudit, continuationAudit, halt, route,
          sourceEq⟩
      cases halt with
          | fresh haltAudit =>
              have arity := congrArg Term.headArity sourceEq
              have sourceArity :
                  (clockLaunchTerm program layout fuel bits).headArity = 3 := by
                exact Dovetail.headArity_clockExit_succ (fuel + 1) fuel _
              have shellArity :
                  (CheckpointDecoder.openShell (freshHField haltAudit) dispatcher
                    (word view.bits) seedAudit view.continuation
                    continuationAudit).headArity = 6 := by
                rfl
              rw [sourceArity, shellArity] at arity
              contradiction

theorem dispatcher_parse_clockLaunch_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (fuel : Nat) (bits : List Bool) :
    RootResetWholeDispatcherStages.parse? program layout
      (clockLaunchTerm program layout fuel bits) = none := by
  rw [RootResetWholeDispatcherStages.parse?, peelMarked_clockLaunch,
    dispatcher_active_clockLaunch_none]

theorem appender_parse_clockLaunch_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (fuel : Nat) (bits : List Bool) :
    RootResetWholeAppenderStages.parse? program layout.tree
      (clockLaunchTerm program layout fuel bits) = none := by
  rw [RootResetWholeAppenderStages.parse?, peelMarked_clockLaunch,
    appender_active_clockLaunch_none]

theorem response_active_clockLaunch_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (fuel : Nat) (bits : List Bool) :
    RootResetResponseBoundaryStages.parseActive? program layout.tree
      (clockLaunchTerm program layout fuel bits) = none := by
  simp only [RootResetResponseBoundaryStages.parseActive?,
    parseLocal?_clockLaunch_none]

theorem response_parse_clockLaunch_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (fuel : Nat) (bits : List Bool) :
    RootResetResponseBoundaryStages.parse? program layout.tree
      (clockLaunchTerm program layout fuel bits) = none := by
  rw [RootResetResponseBoundaryStages.parse?, peelMarked_clockLaunch]
  simp only [RootResetResponseBoundaryStages.parseCleanMarkedHistory?,
    response_active_clockLaunch_none]

theorem parseComposite?_clockLaunch
    (program : CTS.Program) (layout : ActionDispatcher program)
    (fuel : Nat) (bits : List Bool) :
    RootResetCompositeStageRegistry.parse? program layout
        (clockLaunchTerm program layout fuel bits) =
      some (.clockFuel (clockLaunchClockFuelView program layout fuel bits)) := by
  rw [RootResetCompositeStageRegistry.parse?,
    dispatcher_parse_clockLaunch_none,
    appender_parse_clockLaunch_none,
    response_parse_clockLaunch_none,
    parseClockFuel?_clockLaunch]
  rfl

def clockLaunchRegisteredView
    (program : CTS.Program) (layout : ActionDispatcher program)
    (fuel : Nat) (bits : List Bool) : RouteA.RegistryView program :=
  .registered (.clockFuel (clockLaunchClockFuelView program layout fuel bits))

theorem parseTwentySeven?_clockLaunch
    (program : CTS.Program) (layout : ActionDispatcher program)
    (fuel : Nat) (bits : List Bool) :
    RootResetTwentySevenStageRegistry.parse? program layout
        (clockLaunchTerm program layout fuel bits) =
      some (clockLaunchRegisteredView program layout fuel bits) := by
  rw [RootResetTwentySevenStageRegistry.parse?,
    parseComposite?_clockLaunch]
  rfl

theorem parseFrameR0?_clockLaunch_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (fuel : Nat) (bits : List Bool) :
    parseFrameR0? (compileActions program layout.tree)
      (clockLaunchTerm program layout fuel bits) = none := by
  simp [clockLaunchTerm, Dovetail.clockExit, clockWrappers, parseFrameR0?,
    parseEnvironment?_appS_C_none]

theorem parseFreshNonempty?_clockLaunch_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (fuel : Nat) (bits : List Bool) :
    RootResetPersistentRouteA.parseFreshNonempty? program layout.tree
      (clockLaunchTerm program layout fuel bits) = none := by
  simp only [RootResetPersistentRouteA.parseFreshNonempty?,
    parseLocal?_clockLaunch_none]

theorem parsePendingActive?_clockLaunch_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (fuel : Nat) (bits : List Bool) :
    RootResetPersistentRouteA.parsePendingActive? program layout
      (clockLaunchTerm program layout fuel bits) = none := by
  simp only [RootResetPersistentRouteA.parsePendingActive?,
    parseFrameR0?_clockLaunch_none]

theorem next?_clockLaunch_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (fuel : Nat) (bits : List Bool) :
    RootResetPersistentRouteA.next? program layout
      (clockLaunchTerm program layout fuel bits) = none := by
  simp only [RootResetPersistentRouteA.next?,
    parseMarkedLocal?_clockLaunch_none,
    parseFreshNonempty?_clockLaunch_none,
    parsePendingActive?_clockLaunch_none, Option.map]

theorem positiveStageArity_contractAt_root
    (program : CTS.Program) (layout : ActionDispatcher program)
    (registers : SchedulerControl.Registers program)
    (fuel : Nat) (environment : Term) :
    (positiveStageArityConfiguration program layout registers (fuel + 1)
      environment).cursor.erase.contractAt? [] =
      some (positiveStageLaunchConfiguration program layout fuel
        environment).cursor.erase := by
  rfl

/-- The completed positive clock stage selects exactly the launch sample. -/
theorem clockLaunch_selects_persistentLaunch
    (program : CTS.Program) (layout : ActionDispatcher program)
    (registers : SchedulerControl.Registers program)
    (fuel : Nat) (bits : List Bool) :
    let environment := environmentCode
      (compileActions program layout.tree) bits
    RouteA.Selects program layout
      (clockLaunchTerm program layout fuel bits)
      (positiveStageLaunchConfiguration program layout fuel environment).cursor.erase
      [] := by
  dsimp only
  apply RouteA.selects_of_root
    (next?_clockLaunch_none program layout fuel bits)
    (parseTwentySeven?_clockLaunch program layout fuel bits)
  · rfl
  · simpa [clockLaunchTerm, positiveStageArityConfiguration,
      positiveStageRootCursor] using!
      positiveStageArity_contractAt_root program layout registers fuel
        (environmentCode (compileActions program layout.tree) bits)

/-- A completed positive clock zipper erases to the registered launch term. -/
theorem zeroClockMutation_erase_eq_clockLaunchTerm
    (program : CTS.Program) (layout : ActionDispatcher program)
    (registers : SchedulerControl.Registers program)
    (fuel : Nat) (bits : List Bool) :
    (zeroClockMutationConfiguration program layout registers (fuel + 1)
      (fuel + 1)
      [.left (environmentCode
        (compileActions program layout.tree) bits)]).cursor.erase =
      clockLaunchTerm program layout fuel bits := by
  rw [SchedulerInvariant.zeroClockMutation_erase,
    SchedulerInvariant.clockWrap_clockBase_eq_clockWrappers]
  rfl

/-- Thus the completed-zero sample of every positive phase selects its launch. -/
theorem zeroClockMutation_selects_launch
    (program : CTS.Program) (layout : ActionDispatcher program)
    (registers : SchedulerControl.Registers program)
    (fuel : Nat) (bits : List Bool) :
    RouteA.Selects program layout
      (zeroClockMutationConfiguration program layout registers (fuel + 1)
        (fuel + 1)
        [.left (environmentCode
          (compileActions program layout.tree) bits)]).cursor.erase
      (positiveStageLaunchConfiguration program layout fuel
        (environmentCode (compileActions program layout.tree) bits)).cursor.erase
      [] := by
  rw [zeroClockMutation_erase_eq_clockLaunchTerm]
  exact clockLaunch_selects_persistentLaunch program layout registers fuel bits

/-- The stage-zero closing sample exposes the first positive row of stage one. -/
theorem zeroStageClosing_selects_stageOnePositive
    (program : CTS.Program) (layout : ActionDispatcher program)
    (registers : SchedulerControl.Registers program) (bits : List Bool) :
    RouteA.Selects program layout
      (zeroClockMutationConfiguration program layout registers 0 0
        [.left (environmentCode
          (compileActions program layout.tree) bits)]).cursor.erase
      (positiveClockMutationConfiguration program layout registers 1 0 0
        [.left (environmentCode
          (compileActions program layout.tree) bits)]).cursor.erase
      [.left] := by
  let source := RootResetPersistentInitialBridge.firstSampleTerm
    program layout bits
  let view := RootResetPersistentInitialBridge.firstSampleRegisteredView
    program layout bits
  have sourceEq :
      (zeroClockMutationConfiguration program layout registers 0 0
        [.left (environmentCode
          (compileActions program layout.tree) bits)]).cursor.erase = source := by
    rfl
  rw [sourceEq]
  apply RouteA.selects_of_root
  · have localNone : CheckpointDecoder.parseLocal? program layout.tree source =
        none := by
        simpa [source,
          RootResetPersistentInitialBridge.firstSampleTerm] using
          CheckpointDecoder.parseLocal?_terminal_none program layout.tree 0
            (environmentCode (compileActions program layout.tree) bits)
    have frameNone : parseFrameR0? (compileActions program layout.tree) source =
        none := by
      simp [source, RootResetPersistentInitialBridge.firstSampleTerm,
        parseFrameR0?, clockBase, C, b,
        CheckpointDecoder.parseEnvironment?, actCode, haltCode]
    simp [RootResetPersistentRouteA.next?,
      RootResetPersistentRouteA.parseFreshNonempty?,
      RootResetPersistentRouteA.parsePendingActive?,
      RootResetReachableStageGrammar.parseMarkedLocal?, localNone, frameNone]
  · exact RootResetPersistentInitialBridge.parseTwentySeven?_firstSample
      program layout bits
  · rfl
  · rfl

/-! ## Agreement packaged over the indexed clock trace -/

/-- Erasure of every positive clock sample is the balanced bare-root row above. -/
theorem positiveClockMutation_erase_eq_clockPostPositiveTerm
    (program : CTS.Program) (layout : ActionDispatcher program)
    (registers : SchedulerControl.Registers program)
    (stage wrappers remaining : Nat) (bits : List Bool) :
    (positiveClockMutationConfiguration program layout registers stage wrappers
      remaining
      [.left (environmentCode
        (compileActions program layout.tree) bits)]).cursor.erase =
      clockPostPositiveTerm program layout stage wrappers remaining bits := by
  rw [show
    (positiveClockMutationConfiguration program layout registers stage wrappers
      remaining
      [.left (environmentCode
        (compileActions program layout.tree) bits)]).cursor.erase =
      Cursor.rebuild
        [.left (environmentCode
          (compileActions program layout.tree) bits)]
        (clockGrowthCore stage (wrappers + 1) remaining) by
          exact SchedulerInvariant.erase_clockGrowth_after stage wrappers
            remaining _]
  rfl

/-- Target term after the contraction selected from a positive clock sample. -/
def positiveClockSampleNextTerm
    (program : CTS.Program) (layout : ActionDispatcher program)
    (registers : SchedulerControl.Registers program)
    (stage wrappers remaining : Nat) (bits : List Bool) : Term :=
  match remaining with
  | 0 =>
      (zeroClockMutationConfiguration program layout registers stage
        (wrappers + 1)
        [.left (environmentCode
          (compileActions program layout.tree) bits)]).cursor.erase
  | remaining + 1 =>
      (positiveClockMutationConfiguration program layout registers stage
        (wrappers + 1) remaining
        [.left (environmentCode
          (compileActions program layout.tree) bits)]).cursor.erase

/-- Root-relative persistent focus for the same next clock sample. -/
def positiveClockSampleNextAddress
    (program : CTS.Program) (layout : ActionDispatcher program)
    (registers : SchedulerControl.Registers program)
    (stage wrappers remaining : Nat) (bits : List Bool) : Address :=
  match remaining with
  | 0 => RootResetSelectorContract.cursorAddress
      (zeroClockSourceConfiguration program layout registers stage
        (wrappers + 1)
        [.left (environmentCode
          (compileActions program layout.tree) bits)]).cursor
  | remaining + 1 => RootResetSelectorContract.cursorAddress
      (positiveClockSourceConfiguration program layout registers stage
        (wrappers + 1) remaining
        [.left (environmentCode
          (compileActions program layout.tree) bits)]).cursor

/-- One balanced positive sample agrees with the next persistent clock sample. -/
theorem positiveClockSample_routeA
    (program : CTS.Program) (layout : ActionDispatcher program)
    (registers : SchedulerControl.Registers program)
    (stage wrappers remaining : Nat) (bits : List Bool)
    (balance : wrappers + remaining + 1 = stage) :
    RouteA.Selects program layout
      (positiveClockMutationConfiguration program layout registers stage wrappers
        remaining
        [.left (environmentCode
          (compileActions program layout.tree) bits)]).cursor.erase
      (positiveClockSampleNextTerm program layout registers stage wrappers
        remaining bits)
      (positiveClockSampleNextAddress program layout registers stage wrappers
        remaining bits) := by
  rw [positiveClockMutation_erase_eq_clockPostPositiveTerm]
  cases remaining with
  | zero =>
      simpa [positiveClockSampleNextTerm, positiveClockSampleNextAddress,
        Nat.add_assoc] using
        clockPostPositive_selects_closingZero program layout registers stage
          wrappers bits (by simpa only [Nat.add_zero] using balance)
  | succ remaining =>
      simpa [positiveClockSampleNextTerm, positiveClockSampleNextAddress,
        Nat.add_assoc] using
        clockPostPositive_selects_nextPositive program layout registers stage
          wrappers remaining bits (by
            calc
              wrappers + 1 + (remaining + 1) =
                  wrappers + (1 + (remaining + 1)) :=
                    Nat.add_assoc wrappers 1 (remaining + 1)
              _ = wrappers + ((remaining + 1) + 1) := by
                    rw [Nat.add_comm 1 (remaining + 1)]
              _ = wrappers + (remaining + 1) + 1 :=
                    (Nat.add_assoc wrappers (remaining + 1) 1).symm
              _ = stage := balance)

/-- Route-A facts for every remaining sample in one positive clock tail. -/
inductive ClockTailRouteAgreement
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (stage : Nat) : Nat → Nat → Nat → Prop where
  | zero (sampleIndex wrappers : Nat)
      (current : RouteA.Selects program layout
        (zeroClockMutationConfiguration program layout registers stage
          (wrappers + 1)
          [.left (environmentCode
            (compileActions program layout.tree) bits)]).cursor.erase
        (positiveStageLaunchConfiguration program layout wrappers
          (environmentCode
            (compileActions program layout.tree) bits)).cursor.erase
        []) :
      ClockTailRouteAgreement program layout bits registers stage sampleIndex
        wrappers 0
  | succ (sampleIndex wrappers remaining : Nat)
      (current : RouteA.Selects program layout
        (positiveClockMutationConfiguration program layout registers stage
          (wrappers + 1) remaining
          [.left (environmentCode
            (compileActions program layout.tree) bits)]).cursor.erase
        (positiveClockSampleNextTerm program layout registers stage
          (wrappers + 1) remaining bits)
        (positiveClockSampleNextAddress program layout registers stage
          (wrappers + 1) remaining bits))
      (tail : ClockTailRouteAgreement program layout bits registers stage
        (sampleIndex + 1) (wrappers + 1) remaining) :
      ClockTailRouteAgreement program layout bits registers stage sampleIndex
        wrappers (remaining + 1)

/-- The indexed persistent tail supplies exactly those route-A facts. -/
theorem clockRootTailSampled_routeA
    {program : CTS.Program} {layout : ActionDispatcher program}
    {bits : List Bool} {registers : SchedulerControl.Registers program}
    {phase : CTS.Phase program} {scanned : List Bool} {emptyMode : Bool}
    {coherent : RegistersCoherent registers phase scanned emptyMode}
    {stage sampleIndex wrappers remaining : Nat}
    (sampled : ClockRootTailSampled program layout bits registers phase scanned
      emptyMode coherent stage sampleIndex wrappers remaining)
    (balance : wrappers + remaining + 1 = stage) :
    ClockTailRouteAgreement program layout bits registers stage sampleIndex
      wrappers remaining := by
  induction sampled with
  | zero sampleIndex wrappers closing =>
      have stageEq : stage = wrappers + 1 := by
        simpa only [Nat.add_zero] using balance.symm
      subst stage
      exact .zero sampleIndex wrappers
        (zeroClockMutation_selects_launch program layout registers wrappers bits)
  | succ sampleIndex wrappers remaining next tail ih =>
      apply ClockTailRouteAgreement.succ sampleIndex wrappers remaining
      · exact positiveClockSample_routeA program layout registers stage
          (wrappers + 1) remaining bits (by
            calc
              wrappers + 1 + remaining + 1 =
                  (wrappers + (1 + remaining)) + 1 := by
                    rw [Nat.add_assoc wrappers 1 remaining]
              _ = (wrappers + (remaining + 1)) + 1 := by
                    rw [Nat.add_comm 1 remaining]
              _ = wrappers + (remaining + 1) + 1 := rfl
              _ = stage := balance)
      · exact ih (by
          calc
            wrappers + 1 + remaining + 1 =
                (wrappers + (1 + remaining)) + 1 := by
                  rw [Nat.add_assoc wrappers 1 remaining]
            _ = (wrappers + (remaining + 1)) + 1 := by
                  rw [Nat.add_comm 1 remaining]
            _ = wrappers + (remaining + 1) + 1 := rfl
            _ = stage := balance)

/-- Route-A facts for the complete indexed clock phase. -/
inductive ClockPhaseRouteAgreement
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program) :
    Nat → Nat → Prop where
  | zero (sampleIndex : Nat)
      (current : RouteA.Selects program layout
        (zeroClockMutationConfiguration program layout registers 0 0
          [.left (environmentCode
            (compileActions program layout.tree) bits)]).cursor.erase
        (positiveClockMutationConfiguration program layout registers 1 0 0
          [.left (environmentCode
            (compileActions program layout.tree) bits)]).cursor.erase
        [.left]) :
      ClockPhaseRouteAgreement program layout bits registers sampleIndex 0
  | succ (sampleIndex stage : Nat)
      (first : RouteA.Selects program layout
        (positiveClockMutationConfiguration program layout registers (stage + 1)
          0 stage
          [.left (environmentCode
            (compileActions program layout.tree) bits)]).cursor.erase
        (positiveClockSampleNextTerm program layout registers (stage + 1)
          0 stage bits)
        (positiveClockSampleNextAddress program layout registers (stage + 1)
          0 stage bits))
      (tail : ClockTailRouteAgreement program layout bits registers (stage + 1)
        (sampleIndex + 1) 0 stage) :
      ClockPhaseRouteAgreement program layout bits registers sampleIndex
        (stage + 1)

/-- Every constructor of the persistent indexed clock phase agrees with route A. -/
theorem clockRootPhaseSampled_routeA
    {program : CTS.Program} {layout : ActionDispatcher program}
    {bits : List Bool} {registers : SchedulerControl.Registers program}
    {phase : CTS.Phase program} {scanned : List Bool} {emptyMode : Bool}
    {coherent : RegistersCoherent registers phase scanned emptyMode}
    {sampleIndex stage : Nat}
    (sampled : ClockRootPhaseSampled program layout bits registers phase scanned
      emptyMode coherent sampleIndex stage) :
    ClockPhaseRouteAgreement program layout bits registers sampleIndex stage := by
  cases sampled with
  | zero closing =>
      exact .zero sampleIndex
        (zeroStageClosing_selects_stageOnePositive program layout registers bits)
  | succ stage first tail =>
      exact .succ sampleIndex stage
        (positiveClockSample_routeA program layout registers (stage + 1) 0 stage
          bits (by simp))
        (clockRootTailSampled_routeA tail (by simp))

/-- The construction-facing clock invariant retains the witness needed for route A. -/
theorem clockRootPhaseInvariant_routeA
    {program : CTS.Program} {layout : ActionDispatcher program}
    {bits : List Bool} {registers : SchedulerControl.Registers program}
    {phase : CTS.Phase program} {scanned : List Bool} {emptyMode : Bool}
    {coherent : RegistersCoherent registers phase scanned emptyMode}
    {sampleIndex stage : Nat}
    (invariant : ClockRootPhaseInvariant program layout bits registers phase scanned
      emptyMode coherent sampleIndex stage) :
    ClockPhaseRouteAgreement program layout bits registers sampleIndex stage :=
  clockRootPhaseSampled_routeA invariant.invariant

/-- The clock component of a complete positive-stage trace agrees with route A. -/
theorem positiveStagePhaseTrace_clock_routeA
    {program : CTS.Program} {layout : ActionDispatcher program}
    {bits : List Bool} {registers : SchedulerControl.Registers program}
    {phase : CTS.Phase program} {scanned : List Bool} {emptyMode : Bool}
    {coherent : RegistersCoherent registers phase scanned emptyMode}
    {sampleIndex fuel : Nat}
    (trace : PositiveStagePhaseTrace program layout bits registers phase scanned
      emptyMode coherent sampleIndex fuel) :
    ClockPhaseRouteAgreement program layout bits registers sampleIndex (fuel + 1) :=
  clockRootPhaseInvariant_routeA trace.clock

/-- The canonical root-clock construction agrees with route A at every public stage. -/
theorem clockRootPhase_routeA
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (sampleIndex stage : Nat) :
    ClockPhaseRouteAgreement program layout bits registers sampleIndex stage :=
  clockRootPhaseSampled_routeA
    (clockRootPhaseSampled program layout bits registers phase scanned emptyMode
      coherent sampleIndex stage)

/-! ## Canonical local fuel rows -/

def fuelRowClockFuelView
    (program : CTS.Program) (row : FuelRow) : ClockFuelView program :=
  ⟨row.term, .hole, [], .fuel ⟨[], .row row⟩⟩

def fuelRowCompositeView
    (program : CTS.Program) (row : FuelRow) :
    RootResetCompositeStageRegistry.View program :=
  .clockFuel (fuelRowClockFuelView program row)

def fuelRowRegisteredView
    (program : CTS.Program) (row : FuelRow) : RouteA.RegistryView program :=
  .registered (fuelRowCompositeView program row)

theorem parseLocal?_canonicalFuelRow_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (row : FuelRow)
    (canonical : CanonicalFuelRow (compileActions program layout.tree) row) :
    CheckpointDecoder.parseLocal? program layout.tree row.term = none := by
  apply CheckpointDecoder.parseLocal?_none_of_headArity
  · intro equal
    have bound := row.term_headArity_le_four
    rw [equal] at bound
    contradiction
  · intro equal
    have bound := row.term_headArity_le_four
    rw [equal] at bound
    contradiction

theorem parseMarkedLocal?_canonicalFuelRow_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (row : FuelRow)
    (canonical : CanonicalFuelRow (compileActions program layout.tree) row) :
    parseMarkedLocal? program layout.tree row.term = none := by
  simp [parseMarkedLocal?,
    parseLocal?_canonicalFuelRow_none program layout row canonical]

theorem peelMarked_canonicalFuelRow
    (program : CTS.Program) (layout : ActionDispatcher program)
    (row : FuelRow)
    (canonical : CanonicalFuelRow (compileActions program layout.tree) row) :
    peelMarked program layout.tree row.term = ⟨row.term, .hole, []⟩ := by
  have components := markedPrefix_eq_peelMarked
    (.here (parseMarkedLocal?_canonicalFuelRow_none program layout row
      canonical))
  generalize decompositionEq : peelMarked program layout.tree row.term =
    decomposition at components ⊢
  rcases decomposition with ⟨active, context, history⟩
  simp only at components ⊢
  rcases components with ⟨activeEq, contextEq, historyEq⟩
  subst active
  subst context
  subst history
  rfl

theorem parseClockFuel?_canonicalFuelRow
    (program : CTS.Program) (layout : ActionDispatcher program)
    (row : FuelRow)
    (canonical : CanonicalFuelRow (compileActions program layout.tree) row) :
    parseClockFuel? program layout.tree row.term =
      some (fuelRowClockFuelView program row) := by
  apply parseClockFuel?_complete
  constructor
  · exact .here (parseMarkedLocal?_canonicalFuelRow_none program layout row
      canonical)
  · apply ClockFuelActiveShape.fuel
    · rfl
    · exact ⟨trivial, canonical⟩

theorem dispatcher_active_canonicalFuelRow_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (row : FuelRow)
    (canonical : CanonicalFuelRow (compileActions program layout.tree) row) :
    RootResetWholeDispatcherStages.parseActive? program layout [] row.term = none := by
  cases parsed : RootResetWholeDispatcherStages.parseActive? program layout []
      row.term with
  | none => rfl
  | some view =>
      have shape := RootResetWholeDispatcherStages.parseActive?_sound parsed
      cases shape with
      | intro haltField dispatcherTerm seedAudit continuationAudit halt phaseEq
          frontBitEq routeEq routeShape sourceEq =>
          cases halt with
          | fresh haltAudit =>
              have arity := congrArg Term.headArity sourceEq
              have shellArity :
                  (CheckpointDecoder.openShell (freshHField haltAudit)
                    dispatcherTerm (word view.bits) seedAudit view.continuation
                    continuationAudit).headArity = 6 := by
                simp [CheckpointDecoder.openShell, freshHField]
              rw [shellArity] at arity
              have bound := row.term_headArity_le_four
              rw [arity] at bound
              exfalso
              exact (by decide : ¬ 6 ≤ 4) bound

theorem appender_active_canonicalFuelRow_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (row : FuelRow)
    (canonical : CanonicalFuelRow (compileActions program layout.tree) row) :
    RootResetWholeAppenderStages.parseActive? program layout.tree row.term = none := by
  cases parsed : RootResetWholeAppenderStages.parseActive? program layout.tree
      row.term with
  | none => rfl
  | some view =>
      have shape := RootResetWholeAppenderStages.parseActive?_sound parsed
      rcases shape.source_eq with
        ⟨haltField, dispatcher, seedAudit, continuationAudit, halt, route,
          sourceEq⟩
      cases halt with
      | fresh haltAudit =>
          have arity := congrArg Term.headArity sourceEq
          have shellArity :
              (CheckpointDecoder.openShell (freshHField haltAudit) dispatcher
                (word view.bits) seedAudit view.continuation
                continuationAudit).headArity = 6 := by
            simp [CheckpointDecoder.openShell, freshHField]
          rw [shellArity] at arity
          have bound := row.term_headArity_le_four
          rw [arity] at bound
          exfalso
          exact (by decide : ¬ 6 ≤ 4) bound

theorem dispatcher_parse_canonicalFuelRow_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (row : FuelRow)
    (canonical : CanonicalFuelRow (compileActions program layout.tree) row) :
    RootResetWholeDispatcherStages.parse? program layout row.term = none := by
  rw [RootResetWholeDispatcherStages.parse?,
    peelMarked_canonicalFuelRow program layout row canonical,
    dispatcher_active_canonicalFuelRow_none program layout row canonical]

theorem appender_parse_canonicalFuelRow_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (row : FuelRow)
    (canonical : CanonicalFuelRow (compileActions program layout.tree) row) :
    RootResetWholeAppenderStages.parse? program layout.tree row.term = none := by
  rw [RootResetWholeAppenderStages.parse?,
    peelMarked_canonicalFuelRow program layout row canonical,
    appender_active_canonicalFuelRow_none program layout row canonical]

theorem response_active_canonicalFuelRow_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (row : FuelRow)
    (canonical : CanonicalFuelRow (compileActions program layout.tree) row) :
    RootResetResponseBoundaryStages.parseActive? program layout.tree row.term = none := by
  simp only [RootResetResponseBoundaryStages.parseActive?,
    parseLocal?_canonicalFuelRow_none program layout row canonical]

theorem response_parse_canonicalFuelRow_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (row : FuelRow)
    (canonical : CanonicalFuelRow (compileActions program layout.tree) row) :
    RootResetResponseBoundaryStages.parse? program layout.tree row.term = none := by
  rw [RootResetResponseBoundaryStages.parse?,
    peelMarked_canonicalFuelRow program layout row canonical]
  simp only [RootResetResponseBoundaryStages.parseCleanMarkedHistory?,
    response_active_canonicalFuelRow_none program layout row canonical]

theorem parseComposite?_canonicalFuelRow
    (program : CTS.Program) (layout : ActionDispatcher program)
    (row : FuelRow)
    (canonical : CanonicalFuelRow (compileActions program layout.tree) row) :
    RootResetCompositeStageRegistry.parse? program layout row.term =
      some (fuelRowCompositeView program row) := by
  rw [RootResetCompositeStageRegistry.parse?,
    dispatcher_parse_canonicalFuelRow_none program layout row canonical,
    appender_parse_canonicalFuelRow_none program layout row canonical,
    response_parse_canonicalFuelRow_none program layout row canonical,
    parseClockFuel?_canonicalFuelRow program layout row canonical]
  rfl

theorem parseTwentySeven?_canonicalFuelRow
    (program : CTS.Program) (layout : ActionDispatcher program)
    (row : FuelRow)
    (canonical : CanonicalFuelRow (compileActions program layout.tree) row) :
    RootResetTwentySevenStageRegistry.parse? program layout row.term =
      some (fuelRowRegisteredView program row) := by
  rw [RootResetTwentySevenStageRegistry.parse?,
    parseComposite?_canonicalFuelRow _ _ _ canonical]
  rfl

/-- No canonical local fuel row is mistaken for an enclosing pending frame. -/
theorem parseFrameR0?_canonicalFuelRow_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (row : FuelRow)
    (canonical : CanonicalFuelRow (compileActions program layout.tree) row) :
    parseFrameR0? (compileActions program layout.tree) row.term = none := by
  let actions := compileActions program layout.tree
  cases row with
  | call fuel environment continuation =>
      rcases canonical.1 with ⟨seedPayload, rfl⟩
      simp [FuelRow.term, parseFrameR0?,
        parseEnvironment?_none_of_headArity_ne_one, carrierC_headArity]
  | positiveHalf residual leftEnvironment rightEnvironment continuation =>
      rcases canonical.1 with ⟨leftSeed, rfl⟩
      simp [FuelRow.term, parseFrameR0?,
        parseEnvironment?_appS_none_of_headArity_ne_two,
        CheckpointDecoder.openEnvironment]
  | zeroFirst leftEnvironment rightEnvironment continuation =>
      rcases canonical.1 with ⟨leftSeed, rfl⟩
      simp [FuelRow.term, parseFrameR0?,
        parseEnvironment?_none_of_headArity_ne_one, b]
  | zeroSecond leftArgument function rightArgument continuation =>
      rcases canonical.1 with ⟨leftSeed, rfl⟩
      simp [FuelRow.term, parseFrameR0?, CheckpointDecoder.parseEnvironment?,
        CheckpointDecoder.openEnvironment, actCode, haltCode, b]
  | zeroThird environment leftContinuation function rightArgument
      rightContinuation =>
      rcases canonical.1 with ⟨environmentSeed, rfl⟩
      simp [FuelRow.term, parseFrameR0?,
        parseEnvironment?_none_of_headArity_ne_one, b]
  | zeroFourth leftContinuation environment rightContinuation alpha =>
      rcases canonical.2.1 with ⟨environmentSeed, rfl⟩
      have different : leftContinuation.headArity ≠ 2 := by
        rcases canonical.1 with arity | arity <;> simp [arity]
      have rejected := parseEnvironment?_appS_none_of_headArity_ne_two
        (compileActions program layout.tree) leftContinuation different
      simp [FuelRow.term, parseFrameR0?, rejected]

theorem next?_canonicalFuelRow_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (row : FuelRow)
    (canonical : CanonicalFuelRow (compileActions program layout.tree) row) :
    RootResetPersistentRouteA.next? program layout row.term = none := by
  simp [RootResetPersistentRouteA.next?,
    RootResetPersistentRouteA.parseFreshNonempty?,
    RootResetPersistentRouteA.parsePendingActive?,
    parseMarkedLocal?_canonicalFuelRow_none _ _ _ canonical,
    parseLocal?_canonicalFuelRow_none _ _ _ canonical,
    parseFrameR0?_canonicalFuelRow_none _ _ _ canonical]

theorem endpointCandidate?_canonicalFuelRow
    (program : CTS.Program) (layout : ActionDispatcher program)
    (row : FuelRow) :
    RootResetPersistentRouteA.endpointCandidate? program layout.tree row.term
        (fuelRowRegisteredView program row) = some row.localAddress := by
  cases row <;> rfl

/-- At zero pending depth route A selects every canonical fuel-script row exactly. -/
theorem canonicalFuelRow_selects
    (program : CTS.Program) (layout : ActionDispatcher program)
    (row : FuelRow)
    (canonical : CanonicalFuelRow (compileActions program layout.tree) row) :
    RouteA.Selects program layout row.term row.target row.localAddress := by
  exact RouteA.selects_of_root
    (next?_canonicalFuelRow_none program layout row canonical)
    (parseTwentySeven?_canonicalFuelRow program layout row canonical)
    (endpointCandidate?_canonicalFuelRow program layout row)
    row.contractAt?_eq_some_target

/-! ## Canonical fuel rows below arbitrary pending-frame parents -/

def pendingFuelRowView (layers : List PendingLayer) (row : FuelRow) : FuelView :=
  ⟨layers, .row row⟩

def pendingFuelRowTerm
    (actions : Term) (layers : List PendingLayer) (row : FuelRow) : Term :=
  (pendingFuelRowView layers row).term actions

def pendingFuelRowClockFuelView
    (program : CTS.Program) (layout : ActionDispatcher program)
    (layers : List PendingLayer) (row : FuelRow) : ClockFuelView program :=
  ⟨pendingFuelRowTerm (compileActions program layout.tree) layers row,
    .hole, [], .fuel (pendingFuelRowView layers row)⟩

def pendingFuelRowCompositeView
    (program : CTS.Program) (layout : ActionDispatcher program)
    (layers : List PendingLayer) (row : FuelRow) :
    RootResetCompositeStageRegistry.View program :=
  .clockFuel (pendingFuelRowClockFuelView program layout layers row)

def pendingFuelRowRegisteredView
    (program : CTS.Program) (layout : ActionDispatcher program)
    (layers : List PendingLayer) (row : FuelRow) : RouteA.RegistryView program :=
  .registered (pendingFuelRowCompositeView program layout layers row)

def literalPendingLayer
    (actions : Term) (bits : List Bool) (continuation : Term) : PendingLayer :=
  ⟨environmentCode actions bits, continuation, word bits⟩

@[simp]
theorem pendingFuelRowTerm_cons
    (actions : Term) (bits : List Bool) (continuation : Term)
    (layers : List PendingLayer) (row : FuelRow) :
    pendingFuelRowTerm actions
        (literalPendingLayer actions bits continuation :: layers) row =
      frame (environmentCode actions bits) continuation
        (pendingFuelRowTerm actions layers row) :=
  rfl

/-- Pending parents whose environment is a literal encoded word. -/
inductive RoutePendingLayers (actions : Term) : List PendingLayer → Prop where
  | nil : RoutePendingLayers actions []
  | cons (bits : List Bool) (continuation : Term) {layers : List PendingLayer}
      (admissible : Carrier.Admissible continuation)
      (tail : RoutePendingLayers actions layers) :
      RoutePendingLayers actions
        (literalPendingLayer actions bits continuation :: layers)

theorem RoutePendingLayers.canonical
    {actions : Term} {layers : List PendingLayer}
    (route : RoutePendingLayers actions layers) :
    CanonicalPendingLayers actions layers := by
  induction route with
  | nil => trivial
  | cons bits continuation admissible tail ih =>
      exact ⟨⟨rfl, admissible⟩, ih⟩

theorem pendingFuelRowTerm_headArity_le_four
    (actions : Term) (layers : List PendingLayer) (row : FuelRow)
    (canonical : CanonicalPendingLayers actions layers) :
    (pendingFuelRowTerm actions layers row).headArity ≤ 4 := by
  cases layers with
  | nil =>
      simpa [pendingFuelRowTerm, pendingFuelRowView, FuelView.term,
        FuelEndpoint.term] using row.term_headArity_le_four
  | cons layer layers =>
      simp [pendingFuelRowTerm, pendingFuelRowView, FuelView.term,
        pendingContext, canonical.1.1, CheckpointDecoder.openEnvironment]

theorem parseLocal?_canonicalPendingFuelRow_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (layers : List PendingLayer) (row : FuelRow)
    (canonicalLayers : CanonicalPendingLayers
      (compileActions program layout.tree) layers) :
    CheckpointDecoder.parseLocal? program layout.tree
      (pendingFuelRowTerm (compileActions program layout.tree) layers row) = none := by
  apply CheckpointDecoder.parseLocal?_none_of_headArity
  · intro equal
    have bound := pendingFuelRowTerm_headArity_le_four
      (compileActions program layout.tree) layers row canonicalLayers
    rw [equal] at bound
    exact (by decide : ¬ 5 ≤ 4) bound
  · intro equal
    have bound := pendingFuelRowTerm_headArity_le_four
      (compileActions program layout.tree) layers row canonicalLayers
    rw [equal] at bound
    exact (by decide : ¬ 6 ≤ 4) bound

theorem parseMarkedLocal?_canonicalPendingFuelRow_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (layers : List PendingLayer) (row : FuelRow)
    (canonicalLayers : CanonicalPendingLayers
      (compileActions program layout.tree) layers) :
    parseMarkedLocal? program layout.tree
      (pendingFuelRowTerm (compileActions program layout.tree) layers row) = none := by
  simp only [parseMarkedLocal?,
    parseLocal?_canonicalPendingFuelRow_none program layout layers row canonicalLayers]

theorem peelMarked_canonicalPendingFuelRow
    (program : CTS.Program) (layout : ActionDispatcher program)
    (layers : List PendingLayer) (row : FuelRow)
    (canonicalLayers : CanonicalPendingLayers
      (compileActions program layout.tree) layers) :
    peelMarked program layout.tree
        (pendingFuelRowTerm (compileActions program layout.tree) layers row) =
      ⟨pendingFuelRowTerm (compileActions program layout.tree) layers row,
        .hole, []⟩ := by
  have components := markedPrefix_eq_peelMarked
    (.here (parseMarkedLocal?_canonicalPendingFuelRow_none program layout layers row
      canonicalLayers))
  generalize decompositionEq : peelMarked program layout.tree
      (pendingFuelRowTerm (compileActions program layout.tree) layers row) =
    decomposition at components ⊢
  rcases decomposition with ⟨active, context, history⟩
  simp only at components ⊢
  rcases components with ⟨activeEq, contextEq, historyEq⟩
  subst active
  subst context
  subst history
  rfl

theorem parseClockFuel?_canonicalPendingFuelRow
    (program : CTS.Program) (layout : ActionDispatcher program)
    (layers : List PendingLayer) (row : FuelRow)
    (canonicalLayers : CanonicalPendingLayers
      (compileActions program layout.tree) layers)
    (canonicalRow : CanonicalFuelRow (compileActions program layout.tree) row) :
    parseClockFuel? program layout.tree
        (pendingFuelRowTerm (compileActions program layout.tree) layers row) =
      some (pendingFuelRowClockFuelView program layout layers row) := by
  apply parseClockFuel?_complete
  constructor
  · exact .here (parseMarkedLocal?_canonicalPendingFuelRow_none program layout
      layers row canonicalLayers)
  · apply ClockFuelActiveShape.fuel
    · rfl
    · exact ⟨canonicalLayers, canonicalRow⟩

theorem dispatcher_active_canonicalPendingFuelRow_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (layers : List PendingLayer) (row : FuelRow)
    (canonicalLayers : CanonicalPendingLayers
      (compileActions program layout.tree) layers) :
    RootResetWholeDispatcherStages.parseActive? program layout []
      (pendingFuelRowTerm (compileActions program layout.tree) layers row) = none := by
  cases parsed : RootResetWholeDispatcherStages.parseActive? program layout []
      (pendingFuelRowTerm (compileActions program layout.tree) layers row) with
  | none => rfl
  | some view =>
      have shape := RootResetWholeDispatcherStages.parseActive?_sound parsed
      cases shape with
      | intro haltField dispatcherTerm seedAudit continuationAudit halt phaseEq
          frontBitEq routeEq routeShape sourceEq =>
          cases halt with
          | fresh haltAudit =>
              have arity := congrArg Term.headArity sourceEq
              have shellArity :
                  (CheckpointDecoder.openShell (freshHField haltAudit)
                    dispatcherTerm (word view.bits) seedAudit view.continuation
                    continuationAudit).headArity = 6 := by
                rfl
              rw [shellArity] at arity
              have bound := pendingFuelRowTerm_headArity_le_four
                (compileActions program layout.tree) layers row canonicalLayers
              rw [arity] at bound
              exfalso
              exact (by decide : ¬ 6 ≤ 4) bound

theorem appender_active_canonicalPendingFuelRow_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (layers : List PendingLayer) (row : FuelRow)
    (canonicalLayers : CanonicalPendingLayers
      (compileActions program layout.tree) layers) :
    RootResetWholeAppenderStages.parseActive? program layout.tree
      (pendingFuelRowTerm (compileActions program layout.tree) layers row) = none := by
  cases parsed : RootResetWholeAppenderStages.parseActive? program layout.tree
      (pendingFuelRowTerm (compileActions program layout.tree) layers row) with
  | none => rfl
  | some view =>
      have shape := RootResetWholeAppenderStages.parseActive?_sound parsed
      rcases shape.source_eq with
        ⟨haltField, dispatcher, seedAudit, continuationAudit, halt, route,
          sourceEq⟩
      cases halt with
      | fresh haltAudit =>
          have arity := congrArg Term.headArity sourceEq
          have shellArity :
              (CheckpointDecoder.openShell (freshHField haltAudit) dispatcher
                (word view.bits) seedAudit view.continuation
                continuationAudit).headArity = 6 := by
            rfl
          rw [shellArity] at arity
          have bound := pendingFuelRowTerm_headArity_le_four
            (compileActions program layout.tree) layers row canonicalLayers
          rw [arity] at bound
          exfalso
          exact (by decide : ¬ 6 ≤ 4) bound

theorem dispatcher_parse_canonicalPendingFuelRow_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (layers : List PendingLayer) (row : FuelRow)
    (canonicalLayers : CanonicalPendingLayers
      (compileActions program layout.tree) layers) :
    RootResetWholeDispatcherStages.parse? program layout
      (pendingFuelRowTerm (compileActions program layout.tree) layers row) = none := by
  rw [RootResetWholeDispatcherStages.parse?,
    peelMarked_canonicalPendingFuelRow program layout layers row canonicalLayers,
    dispatcher_active_canonicalPendingFuelRow_none program layout layers row
      canonicalLayers]

theorem appender_parse_canonicalPendingFuelRow_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (layers : List PendingLayer) (row : FuelRow)
    (canonicalLayers : CanonicalPendingLayers
      (compileActions program layout.tree) layers) :
    RootResetWholeAppenderStages.parse? program layout.tree
      (pendingFuelRowTerm (compileActions program layout.tree) layers row) = none := by
  rw [RootResetWholeAppenderStages.parse?,
    peelMarked_canonicalPendingFuelRow program layout layers row canonicalLayers,
    appender_active_canonicalPendingFuelRow_none program layout layers row
      canonicalLayers]

theorem response_active_canonicalPendingFuelRow_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (layers : List PendingLayer) (row : FuelRow)
    (canonicalLayers : CanonicalPendingLayers
      (compileActions program layout.tree) layers) :
    RootResetResponseBoundaryStages.parseActive? program layout.tree
      (pendingFuelRowTerm (compileActions program layout.tree) layers row) = none := by
  simp only [RootResetResponseBoundaryStages.parseActive?,
    parseLocal?_canonicalPendingFuelRow_none program layout layers row canonicalLayers]

theorem response_parse_canonicalPendingFuelRow_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (layers : List PendingLayer) (row : FuelRow)
    (canonicalLayers : CanonicalPendingLayers
      (compileActions program layout.tree) layers) :
    RootResetResponseBoundaryStages.parse? program layout.tree
      (pendingFuelRowTerm (compileActions program layout.tree) layers row) = none := by
  rw [RootResetResponseBoundaryStages.parse?,
    peelMarked_canonicalPendingFuelRow program layout layers row canonicalLayers]
  simp only [RootResetResponseBoundaryStages.parseCleanMarkedHistory?,
    response_active_canonicalPendingFuelRow_none program layout layers row
      canonicalLayers]

theorem parseComposite?_canonicalPendingFuelRow
    (program : CTS.Program) (layout : ActionDispatcher program)
    (layers : List PendingLayer) (row : FuelRow)
    (canonicalLayers : CanonicalPendingLayers
      (compileActions program layout.tree) layers)
    (canonicalRow : CanonicalFuelRow (compileActions program layout.tree) row) :
    RootResetCompositeStageRegistry.parse? program layout
        (pendingFuelRowTerm (compileActions program layout.tree) layers row) =
      some (pendingFuelRowCompositeView program layout layers row) := by
  rw [RootResetCompositeStageRegistry.parse?,
    dispatcher_parse_canonicalPendingFuelRow_none program layout layers row
      canonicalLayers,
    appender_parse_canonicalPendingFuelRow_none program layout layers row
      canonicalLayers,
    response_parse_canonicalPendingFuelRow_none program layout layers row
      canonicalLayers,
    parseClockFuel?_canonicalPendingFuelRow program layout layers row canonicalLayers
      canonicalRow]
  rfl

theorem parseTwentySeven?_canonicalPendingFuelRow
    (program : CTS.Program) (layout : ActionDispatcher program)
    (layers : List PendingLayer) (row : FuelRow)
    (canonicalLayers : CanonicalPendingLayers
      (compileActions program layout.tree) layers)
    (canonicalRow : CanonicalFuelRow (compileActions program layout.tree) row) :
    RootResetTwentySevenStageRegistry.parse? program layout
        (pendingFuelRowTerm (compileActions program layout.tree) layers row) =
      some (pendingFuelRowRegisteredView program layout layers row) := by
  rw [RootResetTwentySevenStageRegistry.parse?,
    parseComposite?_canonicalPendingFuelRow program layout layers row canonicalLayers
      canonicalRow]
  rfl

def pendingFuelRowPendingView
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (continuation : Term) (layers : List PendingLayer)
    (row : FuelRow) : RootResetPersistentRouteA.PendingView program :=
  ⟨⟨bits, continuation,
      pendingFuelRowTerm (compileActions program layout.tree) layers row⟩,
    pendingFuelRowRegisteredView program layout layers row⟩

theorem parsePendingActive?_pendingFuelRow_cons
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (continuation : Term) (layers : List PendingLayer)
    (row : FuelRow)
    (canonicalLayers : CanonicalPendingLayers
      (compileActions program layout.tree) layers)
    (canonicalRow : CanonicalFuelRow (compileActions program layout.tree) row) :
    RootResetPersistentRouteA.parsePendingActive? program layout
        (pendingFuelRowTerm (compileActions program layout.tree)
          (literalPendingLayer (compileActions program layout.tree) bits continuation ::
            layers) row) =
      some (pendingFuelRowPendingView program layout bits continuation layers row) := by
  rw [pendingFuelRowTerm_cons]
  unfold RootResetPersistentRouteA.parsePendingActive?
  rw [parseFrameR0?_generated]
  simp only
  rw [parseTwentySeven?_canonicalPendingFuelRow program layout layers row
    canonicalLayers canonicalRow]
  rfl

theorem parseFreshNonempty?_canonicalPendingFuelRow_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (layers : List PendingLayer) (row : FuelRow)
    (canonicalLayers : CanonicalPendingLayers
      (compileActions program layout.tree) layers) :
    RootResetPersistentRouteA.parseFreshNonempty? program layout.tree
      (pendingFuelRowTerm (compileActions program layout.tree) layers row) = none := by
  simp only [RootResetPersistentRouteA.parseFreshNonempty?,
    parseLocal?_canonicalPendingFuelRow_none program layout layers row canonicalLayers]

theorem next?_pendingFuelRow_cons
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (continuation : Term) (layers : List PendingLayer)
    (row : FuelRow)
    (canonicalLayers : CanonicalPendingLayers
      (compileActions program layout.tree) layers)
    (canonicalRow : CanonicalFuelRow (compileActions program layout.tree) row)
    (admissible : Carrier.Admissible continuation) :
    let outerLayers :=
      literalPendingLayer (compileActions program layout.tree) bits continuation :: layers
    let source := pendingFuelRowTerm (compileActions program layout.tree)
      outerLayers row
    let pending := pendingFuelRowPendingView program layout bits continuation layers row
    RootResetPersistentRouteA.next? program layout source =
      some (RootResetPersistentRouteA.pendingStep source pending) := by
  dsimp only
  have outerCanonical : CanonicalPendingLayers
      (compileActions program layout.tree)
      (literalPendingLayer (compileActions program layout.tree) bits continuation ::
        layers) := by
    change CanonicalPendingLayer (compileActions program layout.tree)
        (literalPendingLayer (compileActions program layout.tree) bits continuation) ∧
      CanonicalPendingLayers (compileActions program layout.tree) layers
    exact ⟨⟨rfl, admissible⟩, canonicalLayers⟩
  unfold RootResetPersistentRouteA.next?
  rw [parseMarkedLocal?_canonicalPendingFuelRow_none program layout _ row
    outerCanonical]
  rw [parseFreshNonempty?_canonicalPendingFuelRow_none program layout _ row
    outerCanonical]
  rw [parsePendingActive?_pendingFuelRow_cons program layout bits continuation layers
    row canonicalLayers canonicalRow]
  rfl

def pendingFuelRowActiveContext
    (program : CTS.Program) (layers : List PendingLayer) (row : FuelRow) :
    RootResetPersistentRouteA.ActiveContext program :=
  ⟨row.term, pendingContext layers, rights layers.length,
    List.replicate layers.length .pendingFrameChild, []⟩

/-- Route A peels every literal pending parent and stops exactly at the local fuel row. -/
theorem activeContext_pendingFuelRow
    (program : CTS.Program) (layout : ActionDispatcher program)
    {layers : List PendingLayer}
    (route : RoutePendingLayers (compileActions program layout.tree) layers)
    (row : FuelRow)
    (canonicalRow : CanonicalFuelRow (compileActions program layout.tree) row) :
    RootResetPersistentRouteA.activeContext program layout
        (pendingFuelRowTerm (compileActions program layout.tree) layers row) =
      pendingFuelRowActiveContext program layers row := by
  induction route with
  | nil =>
      change RootResetPersistentRouteA.activeContext program layout row.term =
        ⟨row.term, .hole, [], [], []⟩
      rw [RootResetPersistentRouteA.activeContext]
      rw [next?_canonicalFuelRow_none program layout row canonicalRow]
  | cons bits continuation admissible tail ih =>
      rw [RootResetPersistentRouteA.activeContext]
      rw [next?_pendingFuelRow_cons program layout bits continuation _ row
        tail.canonical canonicalRow admissible]
      simp only
      dsimp only [RootResetPersistentRouteA.pendingStep,
        pendingFuelRowPendingView]
      rw [ih]
      rfl

/-- Local fuel contraction lifted through every pending-frame parent. -/
theorem pendingFuelRow_contractAt
    (program : CTS.Program) (layout : ActionDispatcher program)
    (layers : List PendingLayer) (row : FuelRow) :
    (pendingFuelRowTerm (compileActions program layout.tree) layers row).contractAt?
        (rights layers.length ++ row.localAddress) =
      some ((pendingContext layers).plug row.target) := by
  have lifted := RootResetWholeStageClassifier.contractAt?_plug_append
    (pendingContext layers) row.localAddress row.contractAt?_eq_some_target
  simpa [pendingFuelRowTerm, pendingFuelRowView, FuelView.term,
    FuelEndpoint.term, pendingContext_address] using lifted

/-- Every canonical local fuel row is selected exactly below arbitrary pending parents. -/
theorem pendingFuelRow_selects
    (program : CTS.Program) (layout : ActionDispatcher program)
    {layers : List PendingLayer}
    (route : RoutePendingLayers (compileActions program layout.tree) layers)
    (row : FuelRow)
    (canonicalRow : CanonicalFuelRow (compileActions program layout.tree) row) :
    RouteA.Selects program layout
      (pendingFuelRowTerm (compileActions program layout.tree) layers row)
      ((pendingContext layers).plug row.target)
      (rights layers.length ++ row.localAddress) := by
  constructor
  · unfold RootResetPersistentRouteA.classify
    rw [activeContext_pendingFuelRow program layout route row canonicalRow]
    dsimp only [pendingFuelRowActiveContext]
    rw [parseTwentySeven?_canonicalFuelRow program layout row canonicalRow]
    change
      (RootResetPersistentRouteA.verifiedCandidate? row.term
        (RootResetPersistentRouteA.endpointCandidate? program layout.tree row.term
          (fuelRowRegisteredView program row))).map
          (fun address => rights layers.length ++ address) =
        some (rights layers.length ++ row.localAddress)
    rw [endpointCandidate?_canonicalFuelRow program layout row]
    change
      Option.map (fun address => rights layers.length ++ address)
          (Option.map (fun _ => row.localAddress)
            (row.term.contractAt? row.localAddress)) =
        some (rights layers.length ++ row.localAddress)
    rw [row.contractAt?_eq_some_target]
    rfl
  · exact pendingFuelRow_contractAt program layout layers row

/-! ## Handoff-aware selection for canonical fuel rows -/

/-- The carrier-handoff parser deliberately rejects a canonical fuel-script
row, even below pending-frame parents: its accepted language contains only
the pre-C4 and post-C4 carrier endpoints. -/
theorem parseFuelHandoff?_canonicalPendingFuelRow_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (layers : List PendingLayer) (row : FuelRow)
    (canonicalLayers : CanonicalPendingLayers
      (compileActions program layout.tree) layers)
    (canonicalRow : CanonicalFuelRow (compileActions program layout.tree) row) :
    RootResetPersistentFuelCarrier.parse?
        (compileActions program layout.tree)
        (pendingFuelRowTerm (compileActions program layout.tree) layers row) =
      none := by
  have parsed : parseCanonicalFuelActive?
      (compileActions program layout.tree)
      (pendingFuelRowTerm (compileActions program layout.tree) layers row) =
        some (pendingFuelRowView layers row) :=
    parseCanonicalFuelActive?_complete rfl ⟨canonicalLayers, canonicalRow⟩
  simp [RootResetPersistentFuelCarrier.parse?, parsed,
    pendingFuelRowView]

/-- The handoff-aware traversal peels the same literal pending stack and
stops exactly at a canonical local fuel row. -/
theorem fuelActiveContext_pendingFuelRow
    (program : CTS.Program) (layout : ActionDispatcher program)
    {layers : List PendingLayer}
    (route : RoutePendingLayers (compileActions program layout.tree) layers)
    (row : FuelRow)
    (canonicalRow : CanonicalFuelRow (compileActions program layout.tree) row) :
    RootResetPersistentRouteAFuel.fuelActiveContext program layout
        (pendingFuelRowTerm (compileActions program layout.tree) layers row) =
      pendingFuelRowActiveContext program layers row := by
  induction route with
  | nil =>
      change RootResetPersistentRouteAFuel.fuelActiveContext program layout
          row.term = ⟨row.term, .hole, [], [], []⟩
      rw [RootResetPersistentRouteAFuel.fuelActiveContext]
      rw [show RootResetPersistentFuelCarrier.parse?
          (compileActions program layout.tree) row.term = none by
        simpa [pendingFuelRowTerm, pendingFuelRowView, FuelView.term,
          FuelEndpoint.term] using
          (parseFuelHandoff?_canonicalPendingFuelRow_none program layout [] row
            (by trivial) canonicalRow)]
      rw [next?_canonicalFuelRow_none program layout row canonicalRow]
  | cons bits continuation admissible tail ih =>
      have outerCanonical : CanonicalPendingLayers
          (compileActions program layout.tree)
          (literalPendingLayer (compileActions program layout.tree) bits continuation ::
            _) := ⟨⟨rfl, admissible⟩, tail.canonical⟩
      rw [RootResetPersistentRouteAFuel.fuelActiveContext]
      rw [parseFuelHandoff?_canonicalPendingFuelRow_none program layout _ row
        outerCanonical canonicalRow]
      rw [next?_pendingFuelRow_cons program layout bits continuation _ row
        tail.canonical canonicalRow admissible]
      simp only
      dsimp only [RootResetPersistentRouteA.pendingStep,
        pendingFuelRowPendingView, RootResetPersistentRouteA.wrapOuter]
      rw [ih]
      rfl

/-- The final handoff-aware classifier preserves the exact Route-A selection
for every canonical fuel row below arbitrary literal pending parents. -/
theorem pendingFuelRow_handoff_selected
    (program : CTS.Program) (layout : ActionDispatcher program)
    {layers : List PendingLayer}
    (route : RoutePendingLayers (compileActions program layout.tree) layers)
    (row : FuelRow)
    (canonicalRow : CanonicalFuelRow (compileActions program layout.tree) row) :
    (RootResetPersistentRouteAFuel.classifyHandoff program layout
      (pendingFuelRowTerm (compileActions program layout.tree) layers row)).selected? =
      some
        ⟨rights layers.length ++ row.localAddress,
          (pendingContext layers).plug row.target⟩ := by
  have routeSelected := pendingFuelRow_selects program layout route row canonicalRow
  unfold RootResetPersistentRouteAFuel.classifyHandoff
  dsimp only
  rw [fuelActiveContext_pendingFuelRow program layout route row canonicalRow]
  simp only [pendingFuelRowActiveContext]
  rw [show RootResetPersistentFuelCarrier.parse?
      (compileActions program layout.tree) row.term = none by
    simpa [pendingFuelRowTerm, pendingFuelRowView, FuelView.term,
      FuelEndpoint.term] using
      (parseFuelHandoff?_canonicalPendingFuelRow_none program layout [] row
        (by trivial) canonicalRow)]
  rw [routeSelected.1]
  simp [RootResetPersistentRouteAFuel.checkedSelection?, routeSelected.2]

/-- The public isolated bare-term selector returns the scheduler's exact
fuel-row contractum at every pending depth. -/
theorem pendingFuelRow_selectStep?
    (program : CTS.Program) (layout : ActionDispatcher program)
    {layers : List PendingLayer}
    (route : RoutePendingLayers (compileActions program layout.tree) layers)
    (row : FuelRow)
    (canonicalRow : CanonicalFuelRow (compileActions program layout.tree) row) :
    RootResetPersistentSelector.selectStep? program layout
        (pendingFuelRowTerm (compileActions program layout.tree) layers row) =
      some ((pendingContext layers).plug row.target) := by
  unfold RootResetPersistentSelector.selectStep?
  unfold RootResetPersistentSelector.selection?
  rw [pendingFuelRow_handoff_selected program layout route row canonicalRow]
  rfl

/-! ## Generated pending stacks and scheduler fuel configurations -/

/-- The pending layers installed by the fuel script, in outer-to-inner order. -/
def generatedPendingLayers
    (actions : Term) (bits : List Bool) (continuation : Term) (depth : Nat) :
    List PendingLayer :=
  List.replicate depth (literalPendingLayer actions bits continuation)

/-- Every generated pending stack is accepted by the role-sensitive route grammar. -/
theorem generatedPendingLayers_route
    (actions : Term) (bits : List Bool) (continuation : Term)
    (admissible : Carrier.Admissible continuation) :
    ∀ depth, RoutePendingLayers actions
      (generatedPendingLayers actions bits continuation depth)
  | 0 => .nil
  | depth + 1 => by
      rw [generatedPendingLayers, List.replicate_succ]
      exact .cons bits continuation admissible
        (generatedPendingLayers_route actions bits continuation admissible depth)

/-- Rebuilding the persistent pending-parent stack is definitionally the
same operation as plugging below the generated pending layers. -/
theorem rebuild_pendingParents_eq_generatedPendingContext
    (actions : Term) (bits : List Bool) (continuation : Term)
    (depth : Nat) (body : Term) :
    Cursor.rebuild
        (PrimitiveFuel.pendingParents
          (environmentCode actions bits) continuation depth []) body =
      (pendingContext
        (generatedPendingLayers actions bits continuation depth)).plug body := by
  rw [PrimitiveFuel.rebuild_pendingParents]
  change Nat.rec body
      (fun _ inner => frame (environmentCode actions bits) continuation inner)
      depth =
    (pendingContext
      (generatedPendingLayers actions bits continuation depth)).plug body
  induction depth with
  | zero => rfl
  | succ depth ih =>
      rw [generatedPendingLayers, List.replicate_succ]
      change frame (environmentCode actions bits) continuation
          (Nat.rec body
            (fun _ inner => frame (environmentCode actions bits) continuation inner)
            depth) =
        frame (environmentCode actions bits) continuation
          ((pendingContext
            (generatedPendingLayers actions bits continuation depth)).plug body)
      exact congrArg (frame (environmentCode actions bits) continuation) ih

/-- Row-specialized form of the pending-context reconstruction theorem. -/
theorem rebuild_pendingParents_eq_pendingFuelRowTerm
    (actions : Term) (bits : List Bool) (continuation : Term)
    (depth : Nat) (row : FuelRow) :
    Cursor.rebuild
        (PrimitiveFuel.pendingParents
          (environmentCode actions bits) continuation depth []) row.term =
      pendingFuelRowTerm actions
        (generatedPendingLayers actions bits continuation depth) row := by
  simpa [pendingFuelRowTerm, pendingFuelRowView, FuelView.term,
    FuelEndpoint.term] using
    (rebuild_pendingParents_eq_generatedPendingContext actions bits continuation
      depth row.term)

/-- The literal generated environment satisfies the canonical open-field role. -/
theorem environmentCode_openField
    (actions : Term) (bits : List Bool) :
    OpenField actions (environmentCode actions bits) :=
  ⟨word bits, (CheckpointDecoder.openEnvironment_word actions bits).symm⟩

/-- Every generated call row is canonical. -/
theorem generatedCallRow_canonical
    (actions : Term) (bits : List Bool) (continuation : Term)
    (admissible : Carrier.Admissible continuation) (fuel : Nat) :
    CanonicalFuelRow actions
      (.call fuel (environmentCode actions bits) continuation) :=
  ⟨environmentCode_openField actions bits, admissible⟩

/-- Every generated positive-half row is canonical. -/
theorem generatedPositiveHalfRow_canonical
    (actions : Term) (bits : List Bool) (continuation : Term)
    (admissible : Carrier.Admissible continuation) (fuel : Nat) :
    CanonicalFuelRow actions
      (.positiveHalf fuel (environmentCode actions bits)
        (environmentCode actions bits) continuation) :=
  ⟨environmentCode_openField actions bits,
    environmentCode_openField actions bits, admissible⟩

/-- Every generated zero-script row is canonical. -/
theorem generatedZeroRow_canonical
    (actions : Term) (bits : List Bool) (continuation : Term)
    (admissible : Carrier.Admissible continuation)
    (position : ZeroPosition) :
    CanonicalFuelRow actions
      (position.row actions (word bits) continuation) :=
  position.row_canonical actions (word bits) continuation admissible

/-- A scheduler cursor whose focus is a local fuel row and whose parents are
the generated pending stack erases to the parser's exact whole-row term. -/
theorem fuelRowCursor_erase
    (actions : Term) (bits : List Bool) (continuation : Term)
    (depth : Nat) (row : FuelRow) :
    (Cursor.mk row.term
      (PrimitiveFuel.pendingParents
        (environmentCode actions bits) continuation depth [])).erase =
      pendingFuelRowTerm actions
        (generatedPendingLayers actions bits continuation depth) row := by
  exact rebuild_pendingParents_eq_pendingFuelRowTerm
    actions bits continuation depth row

/-- Generic exact selector bridge for any generated canonical fuel row. -/
theorem generatedFuelRow_selectStep?
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (continuation : Term)
    (admissible : Carrier.Admissible continuation)
    (depth : Nat) (row : FuelRow)
    (canonicalRow : CanonicalFuelRow (compileActions program layout.tree) row) :
    RootResetPersistentSelector.selectStep? program layout
        (Cursor.mk row.term
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth [])).erase =
      some
        (Cursor.rebuild
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth []) row.target) := by
  let actions := compileActions program layout.tree
  let layers := generatedPendingLayers actions bits continuation depth
  have route : RoutePendingLayers actions layers :=
    generatedPendingLayers_route actions bits continuation admissible depth
  have selected := pendingFuelRow_selectStep? program layout route row canonicalRow
  rw [fuelRowCursor_erase actions bits continuation depth row]
  rw [rebuild_pendingParents_eq_generatedPendingContext]
  exact selected

/-! ## Route-A fallback through the handoff-aware selector -/

/-- The special carrier-handoff parser rejects every canonical clock term. -/
theorem parseFuelHandoff?_canonicalClock_none
    {actions term : Term} {clock : ClockView}
    (source : term = clock.term)
    (canonical : CanonicalClock actions clock) :
    RootResetPersistentFuelCarrier.parse? actions term = none := by
  cases parsed : RootResetPersistentFuelCarrier.parse? actions term with
  | none => rfl
  | some fuel =>
      have valid := RootResetPersistentFuelCarrier.parse?_sound parsed
      have fuelSource : term = fuel.fuelView.term actions := by
        simpa [RootResetPersistentFuelCarrier.View.source] using valid.source
      exact False.elim
        (canonicalClock_fuel_disjoint source canonical fuelSource valid.canonical)

/-- If the carrier parser and outer descent both reject a Route-A endpoint,
the final handoff-aware selector returns Route A's verified target unchanged. -/
theorem RouteA.Selects.to_selectStep?_of_root
    {program : CTS.Program} {layout : ActionDispatcher program}
    {source target : Term} {address : Address}
    (selected : RouteA.Selects program layout source target address)
    (handoffNone : RootResetPersistentFuelCarrier.parse?
      (compileActions program layout.tree) source = none)
    (stop : RootResetPersistentRouteA.next? program layout source = none) :
    RootResetPersistentSelector.selectStep? program layout source = some target := by
  unfold RootResetPersistentSelector.selectStep?
  unfold RootResetPersistentSelector.selection?
  unfold RootResetPersistentRouteAFuel.classifyHandoff
  dsimp only
  rw [RootResetPersistentRouteAFuel.fuelActiveContext, handoffNone, stop]
  simp only
  rw [handoffNone, selected.1]
  simp [RootResetPersistentRouteAFuel.checkedSelection?, selected.2]

/-- Every balanced post-positive clock row is a canonical clock endpoint. -/
theorem clockPostPositive_canonical
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage wrappers remaining : Nat) (bits : List Bool)
    (balance : wrappers + 1 + remaining = stage) :
    CanonicalClock (compileActions program layout.tree)
      (clockPostPositiveView program layout stage wrappers remaining bits) := by
  cases remaining with
  | zero =>
      exact ⟨⟨rfl, by simpa only [Nat.add_zero] using! balance⟩,
        environmentCode_openField (compileActions program layout.tree) bits⟩
  | succ remaining =>
      exact ⟨⟨Nat.zero_lt_succ remaining, balance⟩,
        environmentCode_openField (compileActions program layout.tree) bits⟩

/-- The completed clock-launch row is a canonical clock endpoint. -/
theorem clockLaunch_canonical
    (program : CTS.Program) (layout : ActionDispatcher program)
    (fuel : Nat) (bits : List Bool) :
    CanonicalClock (compileActions program layout.tree)
      (clockLaunchView program layout fuel bits) := by
  exact ⟨⟨rfl, Nat.zero_lt_succ fuel, Nat.le_refl _⟩,
    environmentCode_openField (compileActions program layout.tree) bits⟩

/-! ### First positive clock row -/

/-- Bare term at the first positive clock source of stage `stage + 1`. -/
def clockFirstTerm
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage : Nat) (bits : List Bool) : Term :=
  .app (clockGrowthCore (stage + 1) 0 (stage + 1))
    (environmentCode (compileActions program layout.tree) bits)

def clockFirstView
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage : Nat) (bits : List Bool) : ClockView :=
  ⟨.growPositive, stage + 1, 0, stage + 1,
    environmentCode (compileActions program layout.tree) bits⟩

theorem clockFirstView_canonical
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage : Nat) (bits : List Bool) :
    CanonicalClock (compileActions program layout.tree)
      (clockFirstView program layout stage bits) :=
  ⟨⟨Nat.zero_lt_succ stage, by simp [clockFirstView]⟩,
    environmentCode_openField (compileActions program layout.tree) bits⟩

theorem parseLocal?_clockFirst_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage : Nat) (bits : List Bool) :
    CheckpointDecoder.parseLocal? program layout.tree
      (clockFirstTerm program layout stage bits) = none := by
  apply CheckpointDecoder.parseLocal?_none_of_headArity
  · simp [clockFirstTerm, clockGrowthCore, clockWrap, C, b]
  · simp [clockFirstTerm, clockGrowthCore, clockWrap, C, b]

theorem parseMarkedLocal?_clockFirst_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage : Nat) (bits : List Bool) :
    parseMarkedLocal? program layout.tree
      (clockFirstTerm program layout stage bits) = none := by
  simp [parseMarkedLocal?, parseLocal?_clockFirst_none]

theorem peelMarked_clockFirst
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage : Nat) (bits : List Bool) :
    peelMarked program layout.tree (clockFirstTerm program layout stage bits) =
      ⟨clockFirstTerm program layout stage bits, .hole, []⟩ := by
  have components := markedPrefix_eq_peelMarked
    (.here (parseMarkedLocal?_clockFirst_none program layout stage bits))
  generalize decompositionEq : peelMarked program layout.tree
    (clockFirstTerm program layout stage bits) = decomposition at components ⊢
  rcases decomposition with ⟨active, context, history⟩
  simp only at components ⊢
  rcases components with ⟨activeEq, contextEq, historyEq⟩
  subst active
  subst context
  subst history
  rfl

def clockFirstClockFuelView
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage : Nat) (bits : List Bool) : ClockFuelView program :=
  ⟨clockFirstTerm program layout stage bits, .hole, [],
    .clock (clockFirstView program layout stage bits)⟩

theorem parseClockFuel?_clockFirst
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage : Nat) (bits : List Bool) :
    parseClockFuel? program layout.tree (clockFirstTerm program layout stage bits) =
      some (clockFirstClockFuelView program layout stage bits) := by
  apply parseClockFuel?_complete
  constructor
  · exact .here (parseMarkedLocal?_clockFirst_none program layout stage bits)
  · apply ClockFuelActiveShape.clock
    · rfl
    · exact clockFirstView_canonical program layout stage bits

theorem dispatcher_active_clockFirst_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage : Nat) (bits : List Bool) :
    RootResetWholeDispatcherStages.parseActive? program layout []
      (clockFirstTerm program layout stage bits) = none := by
  cases parsed : RootResetWholeDispatcherStages.parseActive? program layout []
      (clockFirstTerm program layout stage bits) with
  | none => rfl
  | some view =>
      have shape := RootResetWholeDispatcherStages.parseActive?_sound parsed
      cases shape with
      | intro haltField dispatcherTerm seedAudit continuationAudit halt phaseEq
          frontBitEq routeEq routeShape sourceEq =>
          cases halt with
          | fresh haltAudit =>
              have arity := congrArg Term.headArity sourceEq
              have sourceArity :
                  (clockFirstTerm program layout stage bits).headArity = 4 := by
                simp [clockFirstTerm, clockGrowthCore, clockWrap, C, b]
              have shellArity :
                  (CheckpointDecoder.openShell (freshHField haltAudit)
                    dispatcherTerm (word view.bits) seedAudit view.continuation
                    continuationAudit).headArity = 6 := by
                rfl
              rw [sourceArity, shellArity] at arity
              contradiction

theorem appender_active_clockFirst_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage : Nat) (bits : List Bool) :
    RootResetWholeAppenderStages.parseActive? program layout.tree
      (clockFirstTerm program layout stage bits) = none := by
  cases parsed : RootResetWholeAppenderStages.parseActive? program layout.tree
      (clockFirstTerm program layout stage bits) with
  | none => rfl
  | some view =>
      have shape := RootResetWholeAppenderStages.parseActive?_sound parsed
      rcases shape.source_eq with
        ⟨haltField, dispatcher, seedAudit, continuationAudit, halt, route,
          sourceEq⟩
      cases halt with
      | fresh haltAudit =>
          have arity := congrArg Term.headArity sourceEq
          have sourceArity :
              (clockFirstTerm program layout stage bits).headArity = 4 := by
            simp [clockFirstTerm, clockGrowthCore, clockWrap, C, b]
          have shellArity :
              (CheckpointDecoder.openShell (freshHField haltAudit) dispatcher
                (word view.bits) seedAudit view.continuation
                continuationAudit).headArity = 6 := by
            rfl
          rw [sourceArity, shellArity] at arity
          contradiction

theorem dispatcher_parse_clockFirst_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage : Nat) (bits : List Bool) :
    RootResetWholeDispatcherStages.parse? program layout
      (clockFirstTerm program layout stage bits) = none := by
  rw [RootResetWholeDispatcherStages.parse?, peelMarked_clockFirst,
    dispatcher_active_clockFirst_none]

theorem appender_parse_clockFirst_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage : Nat) (bits : List Bool) :
    RootResetWholeAppenderStages.parse? program layout.tree
      (clockFirstTerm program layout stage bits) = none := by
  rw [RootResetWholeAppenderStages.parse?, peelMarked_clockFirst,
    appender_active_clockFirst_none]

theorem response_parse_clockFirst_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage : Nat) (bits : List Bool) :
    RootResetResponseBoundaryStages.parse? program layout.tree
      (clockFirstTerm program layout stage bits) = none := by
  rw [RootResetResponseBoundaryStages.parse?, peelMarked_clockFirst]
  simp [RootResetResponseBoundaryStages.parseActive?,
    RootResetResponseBoundaryStages.parseCleanMarkedHistory?,
    parseLocal?_clockFirst_none]

def clockFirstCompositeView
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage : Nat) (bits : List Bool) :
    RootResetCompositeStageRegistry.View program :=
  .clockFuel (clockFirstClockFuelView program layout stage bits)

theorem parseComposite?_clockFirst
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage : Nat) (bits : List Bool) :
    RootResetCompositeStageRegistry.parse? program layout
        (clockFirstTerm program layout stage bits) =
      some (clockFirstCompositeView program layout stage bits) := by
  rw [RootResetCompositeStageRegistry.parse?,
    dispatcher_parse_clockFirst_none, appender_parse_clockFirst_none,
    response_parse_clockFirst_none, parseClockFuel?_clockFirst]
  rfl

def clockFirstRegisteredView
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage : Nat) (bits : List Bool) : RouteA.RegistryView program :=
  .registered (clockFirstCompositeView program layout stage bits)

theorem parseTwentySeven?_clockFirst
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage : Nat) (bits : List Bool) :
    RootResetTwentySevenStageRegistry.parse? program layout
        (clockFirstTerm program layout stage bits) =
      some (clockFirstRegisteredView program layout stage bits) := by
  rw [RootResetTwentySevenStageRegistry.parse?, parseComposite?_clockFirst]
  rfl

theorem parseEnvironment?_carrierC_succ_none
    (actions : Term) (stage : Nat) :
    CheckpointDecoder.parseEnvironment? actions (C (stage + 1)) = none := by
  apply parseEnvironment?_none_of_headArity_ne_one
  simp [carrierC_headArity]

theorem parseFrameR0?_clockFirst_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage : Nat) (bits : List Bool) :
    parseFrameR0? (compileActions program layout.tree)
      (clockFirstTerm program layout stage bits) = none := by
  simp [clockFirstTerm, clockGrowthCore, clockWrap, parseFrameR0?,
    parseEnvironment?_carrierC_succ_none]

theorem parseFreshNonempty?_clockFirst_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage : Nat) (bits : List Bool) :
    RootResetPersistentRouteA.parseFreshNonempty? program layout.tree
      (clockFirstTerm program layout stage bits) = none := by
  simp [RootResetPersistentRouteA.parseFreshNonempty?,
    parseLocal?_clockFirst_none]

theorem parsePendingActive?_clockFirst_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage : Nat) (bits : List Bool) :
    RootResetPersistentRouteA.parsePendingActive? program layout
      (clockFirstTerm program layout stage bits) = none := by
  simp [RootResetPersistentRouteA.parsePendingActive?,
    parseFrameR0?_clockFirst_none]

theorem next?_clockFirst_none
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage : Nat) (bits : List Bool) :
    RootResetPersistentRouteA.next? program layout
      (clockFirstTerm program layout stage bits) = none := by
  simp [RootResetPersistentRouteA.next?, parseMarkedLocal?_clockFirst_none,
    parseFreshNonempty?_clockFirst_none, parsePendingActive?_clockFirst_none]

theorem clockFirst_selects_firstMutation
    (program : CTS.Program) (layout : ActionDispatcher program)
    (registers : SchedulerControl.Registers program)
    (stage : Nat) (bits : List Bool) :
    RouteA.Selects program layout
      (clockFirstTerm program layout stage bits)
      (positiveClockMutationConfiguration program layout registers (stage + 1)
        0 stage
        [.left (environmentCode
          (compileActions program layout.tree) bits)]).cursor.erase
      [.left] := by
  apply RouteA.selects_of_root
    (next?_clockFirst_none program layout stage bits)
    (parseTwentySeven?_clockFirst program layout stage bits)
  · rfl
  · have contracts := positiveClockSource_contractAt_cursorAddress program
      layout registers (stage + 1) 0 stage
      [.left (environmentCode (compileActions program layout.tree) bits)]
    dsimp only at contracts
    have sourceEq :
        (positiveClockSourceConfiguration program layout registers (stage + 1)
          0 stage
          [.left (environmentCode
            (compileActions program layout.tree) bits)]).cursor.erase =
          clockFirstTerm program layout stage bits := by
      rfl
    have addressEq :
        RootResetSelectorContract.cursorAddress
          (positiveClockSourceConfiguration program layout registers (stage + 1)
            0 stage
            [.left (environmentCode
              (compileActions program layout.tree) bits)]).cursor = [.left] := by
      rfl
    rw [sourceEq, addressEq] at contracts
    exact contracts

/-- The handoff-aware selector finds the first clock contraction directly
from the bare root. -/
theorem clockFirst_selectStep?
    (program : CTS.Program) (layout : ActionDispatcher program)
    (registers : SchedulerControl.Registers program)
    (stage : Nat) (bits : List Bool) :
    RootResetPersistentSelector.selectStep? program layout
        (clockFirstTerm program layout stage bits) =
      some
        (positiveClockMutationConfiguration program layout registers (stage + 1)
          0 stage
          [.left (environmentCode
            (compileActions program layout.tree) bits)]).cursor.erase := by
  have selected := clockFirst_selects_firstMutation program layout registers
    stage bits
  apply selected.to_selectStep?_of_root
  · exact parseFuelHandoff?_canonicalClock_none rfl
      (clockFirstView_canonical program layout stage bits)
  · exact next?_clockFirst_none program layout stage bits

/-- Handoff-aware selection agrees with Route A on every balanced
post-positive clock row. -/
theorem clockPostPositive_selectStep?
    (program : CTS.Program) (layout : ActionDispatcher program)
    (stage wrappers remaining : Nat) (bits : List Bool)
    (balance : wrappers + 1 + remaining = stage)
    {target : Term} {address : Address}
    (selected : RouteA.Selects program layout
      (clockPostPositiveTerm program layout stage wrappers remaining bits)
      target address) :
    RootResetPersistentSelector.selectStep? program layout
        (clockPostPositiveTerm program layout stage wrappers remaining bits) =
      some target := by
  apply selected.to_selectStep?_of_root
  · exact parseFuelHandoff?_canonicalClock_none
      (by cases remaining <;> rfl)
      (clockPostPositive_canonical program layout stage wrappers remaining bits
        balance)
  · exact next?_clockPostPositive_none program layout stage wrappers remaining bits

/-- Handoff-aware selection agrees with Route A on the completed clock launch. -/
theorem clockLaunch_selectStep?
    (program : CTS.Program) (layout : ActionDispatcher program)
    (registers : SchedulerControl.Registers program)
    (fuel : Nat) (bits : List Bool) :
    RootResetPersistentSelector.selectStep? program layout
        (clockLaunchTerm program layout fuel bits) =
      some
        (positiveStageLaunchConfiguration program layout fuel
          (environmentCode (compileActions program layout.tree) bits)).cursor.erase := by
  have selected := clockLaunch_selects_persistentLaunch program layout registers
    fuel bits
  apply selected.to_selectStep?_of_root
  · exact parseFuelHandoff?_canonicalClock_none rfl
      (clockLaunch_canonical program layout fuel bits)
  · exact next?_clockLaunch_none program layout fuel bits

/-- Every post-positive clock sample selects the exact next persistent
clock sample (positive or closing zero). -/
theorem positiveClockMutation_selects_next
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (stage wrappers remaining : Nat)
    (balance : wrappers + remaining + 1 = stage) :
    RootResetPersistentSelector.selectStep? program layout
        (positiveClockMutationConfiguration program layout registers stage
          wrappers remaining
          [.left (environmentCode
            (compileActions program layout.tree) bits)]).cursor.erase =
      some (positiveClockSampleNextTerm program layout registers stage wrappers
        remaining bits) := by
  rw [positiveClockMutation_erase_eq_clockPostPositiveTerm]
  have postBalance : wrappers + 1 + remaining = stage := by
    calc
      wrappers + 1 + remaining = wrappers + (1 + remaining) :=
        Nat.add_assoc wrappers 1 remaining
      _ = wrappers + (remaining + 1) := by rw [Nat.add_comm 1 remaining]
      _ = wrappers + remaining + 1 := (Nat.add_assoc wrappers remaining 1).symm
      _ = stage := balance
  have routeSelected := positiveClockSample_routeA program layout registers stage
    wrappers remaining bits balance
  rw [positiveClockMutation_erase_eq_clockPostPositiveTerm] at routeSelected
  exact clockPostPositive_selectStep? program layout stage wrappers remaining bits
    postBalance routeSelected

/-- The complete positive-clock tail has a selector certificate aligned with
its literal exact-mutation sample list. -/
theorem clockTailSelectorChain
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (stage : Nat) : ∀ wrappers remaining,
    wrappers + remaining + 1 = stage →
      RootResetExactTraceAgreement.SelectorChain
        (RootResetPersistentSelector.selectStep? program layout)
        (positiveClockMutationConfiguration program layout registers stage
          wrappers remaining
          [.left (environmentCode
            (compileActions program layout.tree) bits)])
        (SchedulerNestedPhase.clockTailConfigurationsAt program layout bits
          registers stage [] wrappers remaining)
  | wrappers, 0, balance => by
      let closing := zeroClockMutationConfiguration program layout registers stage
        (wrappers + 1)
        [.left (environmentCode (compileActions program layout.tree) bits)]
      have selected := positiveClockMutation_selects_next program layout bits
        registers stage wrappers 0 (by simpa only [Nat.add_zero] using balance)
      have selected' : RootResetPersistentSelector.selectStep? program layout
          (positiveClockMutationConfiguration program layout registers stage
            wrappers 0
            [.left (environmentCode
              (compileActions program layout.tree) bits)]).cursor.erase =
        some closing.cursor.erase := by
        simpa [positiveClockSampleNextTerm, closing] using selected
      simpa [SchedulerNestedPhase.clockTailConfigurationsAt, closing] using
        (RootResetExactTraceAgreement.SelectorChain.next selected'
          (RootResetExactTraceAgreement.SelectorChain.done closing))
  | wrappers, remaining + 1, balance => by
      let next := positiveClockMutationConfiguration program layout registers stage
        (wrappers + 1) remaining
        [.left (environmentCode (compileActions program layout.tree) bits)]
      have selected := positiveClockMutation_selects_next program layout bits
        registers stage wrappers (remaining + 1) balance
      have selected' : RootResetPersistentSelector.selectStep? program layout
          (positiveClockMutationConfiguration program layout registers stage
            wrappers (remaining + 1)
            [.left (environmentCode
              (compileActions program layout.tree) bits)]).cursor.erase =
        some next.cursor.erase := by
        simpa [positiveClockSampleNextTerm, next] using selected
      have tailBalance : wrappers + 1 + remaining + 1 = stage := by
        calc
          wrappers + 1 + remaining + 1 =
              (wrappers + (1 + remaining)) + 1 := by
                rw [Nat.add_assoc wrappers 1 remaining]
          _ = (wrappers + (remaining + 1)) + 1 := by
                rw [Nat.add_comm 1 remaining]
          _ = wrappers + (remaining + 1) + 1 := rfl
          _ = stage := balance
      have tail := clockTailSelectorChain program layout bits registers stage
        (wrappers + 1) remaining tailBalance
      simpa [SchedulerNestedPhase.clockTailConfigurationsAt, next] using
        (RootResetExactTraceAgreement.SelectorChain.next selected' tail)

/-- The complete canonical positive-clock phase has a selector certificate
aligned with `clockExactMutationChainAt` when no completed outer response
shell surrounds the stage. -/
theorem clockSelectorChain
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (stage : Nat) :
    RootResetExactTraceAgreement.SelectorChain
      (RootResetPersistentSelector.selectStep? program layout)
      (clockPhaseSourceConfiguration program layout registers
        [.left (environmentCode (compileActions program layout.tree) bits)]
        (stage + 1))
      (SchedulerNestedPhase.clockConfigurationsAt program layout bits registers
        [] stage) := by
  let first := positiveClockMutationConfiguration program layout registers
    (stage + 1) 0 stage
    [.left (environmentCode (compileActions program layout.tree) bits)]
  have selected := clockFirst_selectStep? program layout registers stage bits
  have selected' : RootResetPersistentSelector.selectStep? program layout
        (clockPhaseSourceConfiguration program layout registers
          [.left (environmentCode
            (compileActions program layout.tree) bits)] (stage + 1)).cursor.erase =
      some first.cursor.erase := by
    simpa [clockPhaseSourceConfiguration, positiveClockSourceConfiguration,
      clockFirstTerm, first] using! selected
  have tail := clockTailSelectorChain program layout bits registers (stage + 1)
    0 stage (by simp)
  simpa [SchedulerNestedPhase.clockConfigurationsAt, first] using
    (RootResetExactTraceAgreement.SelectorChain.next selected' tail)

/-! ## Exact generated fuel-script transitions -/

/-- The positive fuel-script source selects its first sampled contractum. -/
theorem fuelPositiveScriptSource_selects_first
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (fuel depth : Nat) (continuation : Term)
    (admissible : Carrier.Admissible continuation) :
    RootResetPersistentSelector.selectStep? program layout
        (fuelPositiveScriptSourceConfiguration program layout registers fuel
          (environmentCode (compileActions program layout.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth [])).cursor.erase =
      some
        (fuelPositiveFirstMutationConfiguration program layout registers fuel
          (environmentCode (compileActions program layout.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth [])).cursor.erase := by
  let actions := compileActions program layout.tree
  have selected := generatedFuelRow_selectStep? program layout bits continuation
    admissible depth
    (.call (fuel + 1) (environmentCode actions bits) continuation)
    (generatedCallRow_canonical actions bits continuation admissible (fuel + 1))
  simpa [fuelPositiveScriptSourceConfiguration,
    fuelPositiveFirstMutationConfiguration, Cursor.erase, FuelRow.term,
    FuelRow.target, FuelRow.localAddress, FuelRow.replacement, Term.replace?,
    C, b, actions] using! selected

/-- The first positive-fuel sample selects the second sample. -/
theorem fuelPositiveFirst_selects_second
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (fuel depth : Nat) (continuation : Term)
    (admissible : Carrier.Admissible continuation) :
    RootResetPersistentSelector.selectStep? program layout
        (fuelPositiveFirstMutationConfiguration program layout registers fuel
          (environmentCode (compileActions program layout.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth [])).cursor.erase =
      some
        (fuelPositiveSecondMutationConfiguration program layout registers fuel
          (environmentCode (compileActions program layout.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth [])).cursor.erase := by
  let actions := compileActions program layout.tree
  have selected := generatedFuelRow_selectStep? program layout bits continuation
    admissible depth
    (.positiveHalf fuel (environmentCode actions bits)
      (environmentCode actions bits) continuation)
    (generatedPositiveHalfRow_canonical actions bits continuation admissible fuel)
  simpa [fuelPositiveFirstMutationConfiguration,
    fuelPositiveSecondMutationConfiguration, Cursor.erase, FuelRow.term,
    FuelRow.target, FuelRow.localAddress, FuelRow.replacement, Term.replace?,
    frame, actions] using! selected

/-- The zero fuel-script source selects its first sampled contractum. -/
theorem fuelZeroScriptSource_selects_first
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (depth : Nat) (continuation : Term)
    (admissible : Carrier.Admissible continuation) :
    RootResetPersistentSelector.selectStep? program layout
        (fuelZeroScriptSourceConfiguration program layout registers
          (environmentCode (compileActions program layout.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth [])).cursor.erase =
      some
        (fuelZeroFirstMutationConfiguration program layout registers
          (environmentCode (compileActions program layout.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth [])).cursor.erase := by
  let actions := compileActions program layout.tree
  have selected := generatedFuelRow_selectStep? program layout bits continuation
    admissible depth
    ((ZeroPosition.call).row actions (word bits) continuation)
    (generatedZeroRow_canonical actions bits continuation admissible .call)
  simpa [fuelZeroScriptSourceConfiguration,
    fuelZeroFirstMutationConfiguration, Cursor.erase, ZeroPosition.row,
    zeroEnvironment, CheckpointDecoder.openEnvironment_word, FuelRow.term,
    FuelRow.target, FuelRow.localAddress, FuelRow.replacement, Term.replace?,
    C, b, actions] using! selected

/-- The first zero-fuel sample selects the second sample. -/
theorem fuelZeroFirst_selects_second
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (depth : Nat) (continuation : Term)
    (admissible : Carrier.Admissible continuation) :
    RootResetPersistentSelector.selectStep? program layout
        (fuelZeroFirstMutationConfiguration program layout registers
          (environmentCode (compileActions program layout.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth [])).cursor.erase =
      some
        (fuelZeroSecondMutationConfiguration program layout registers
          (environmentCode (compileActions program layout.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth [])).cursor.erase := by
  let actions := compileActions program layout.tree
  have selected := generatedFuelRow_selectStep? program layout bits continuation
    admissible depth
    ((ZeroPosition.first).row actions (word bits) continuation)
    (generatedZeroRow_canonical actions bits continuation admissible .first)
  simpa [fuelZeroFirstMutationConfiguration,
    fuelZeroSecondMutationConfiguration, Cursor.erase, ZeroPosition.row,
    zeroEnvironment, CheckpointDecoder.openEnvironment_word, FuelRow.term,
    FuelRow.target, FuelRow.localAddress, FuelRow.replacement, Term.replace?,
    C, b, actions] using! selected

/-- The second zero-fuel sample selects the third sample. -/
theorem fuelZeroSecond_selects_third
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (depth : Nat) (continuation : Term)
    (admissible : Carrier.Admissible continuation) :
    RootResetPersistentSelector.selectStep? program layout
        (fuelZeroSecondMutationConfiguration program layout registers
          (environmentCode (compileActions program layout.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth [])).cursor.erase =
      some
        (fuelZeroThirdMutationConfiguration program layout registers
          (environmentCode (compileActions program layout.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth [])).cursor.erase := by
  let actions := compileActions program layout.tree
  have selected := generatedFuelRow_selectStep? program layout bits continuation
    admissible depth
    ((ZeroPosition.second).row actions (word bits) continuation)
    (generatedZeroRow_canonical actions bits continuation admissible .second)
  simpa [fuelZeroSecondMutationConfiguration,
    fuelZeroThirdMutationConfiguration, Cursor.erase, ZeroPosition.row,
    zeroEnvironment, zeroAlpha, baseAlpha,
    CheckpointDecoder.openEnvironment_word, FuelRow.term, FuelRow.target,
    FuelRow.localAddress, FuelRow.replacement, Term.replace?, C, b, actions]
    using! selected

/-- The third zero-fuel sample selects the fourth sample. -/
theorem fuelZeroThird_selects_fourth
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (depth : Nat) (continuation : Term)
    (admissible : Carrier.Admissible continuation) :
    RootResetPersistentSelector.selectStep? program layout
        (fuelZeroThirdMutationConfiguration program layout registers
          (environmentCode (compileActions program layout.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth [])).cursor.erase =
      some
        (fuelZeroFourthMutationConfiguration program layout registers
          (environmentCode (compileActions program layout.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth [])).cursor.erase := by
  let actions := compileActions program layout.tree
  have selected := generatedFuelRow_selectStep? program layout bits continuation
    admissible depth
    ((ZeroPosition.third).row actions (word bits) continuation)
    (generatedZeroRow_canonical actions bits continuation admissible .third)
  simpa [fuelZeroThirdMutationConfiguration,
    fuelZeroFourthMutationConfiguration, Cursor.erase, ZeroPosition.row,
    zeroEnvironment, zeroAlpha, baseAlpha,
    CheckpointDecoder.openEnvironment_word, FuelRow.term, FuelRow.target,
    FuelRow.localAddress, FuelRow.replacement, Term.replace?, C, b, actions]
    using! selected

/-- The fourth zero-fuel sample selects the Base-producing fifth sample. -/
theorem fuelZeroFourth_selects_fifth
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (depth : Nat) (continuation : Term)
    (admissible : Carrier.Admissible continuation) :
    RootResetPersistentSelector.selectStep? program layout
        (fuelZeroFourthMutationConfiguration program layout registers
          (environmentCode (compileActions program layout.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth [])).cursor.erase =
      some
        (fuelZeroFifthMutationConfiguration program layout registers
          (environmentCode (compileActions program layout.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth [])).cursor.erase := by
  let actions := compileActions program layout.tree
  have selected := generatedFuelRow_selectStep? program layout bits continuation
    admissible depth
    ((ZeroPosition.fourth).row actions (word bits) continuation)
    (generatedZeroRow_canonical actions bits continuation admissible .fourth)
  simpa [fuelZeroFourthMutationConfiguration,
    fuelZeroFifthMutationConfiguration, Cursor.erase, ZeroPosition.row,
    zeroEnvironment, zeroAlpha, baseAlpha, baseCarrier, baseBeta,
    CheckpointDecoder.openEnvironment_word, FuelRow.term, FuelRow.target,
    FuelRow.localAddress, FuelRow.replacement, Term.replace?, C, b, actions]
    using! selected

/-! ## Exact fuel-family selector chain -/

/-- Every contraction edge in the canonical recursive fuel phase is selected
from the bare term alone.  The proof follows the same fuel recursion as
`fuelExactMutationChainAt`; its positive-step suffix is mutation-free and is
therefore absorbed by `SelectorChain.prepend`. -/
theorem fuelSelectorChain
    (program : CTS.Program) (layout : ActionDispatcher program)
    (bits : List Bool) (registers : SchedulerControl.Registers program)
    (continuation : Term) (admissible : Carrier.Admissible continuation) :
    ∀ fuel depth,
      RootResetExactTraceAgreement.SelectorChain
        (RootResetPersistentSelector.selectStep? program layout)
        (fuelPhaseSourceConfiguration program layout registers fuel
          (environmentCode (compileActions program layout.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program layout.tree) bits)
            continuation depth []))
        (SchedulerNestedPhase.fuelConfigurationsAt program layout bits registers
          continuation [] fuel depth)
  | 0, depth => by
      let environment :=
        environmentCode (compileActions program layout.tree) bits
      let parents :=
        PrimitiveFuel.pendingParents environment continuation depth []
      let first := fuelZeroFirstMutationConfiguration program layout registers
        environment continuation parents
      let second := fuelZeroSecondMutationConfiguration program layout registers
        environment continuation parents
      let third := fuelZeroThirdMutationConfiguration program layout registers
        environment continuation parents
      let fourth := fuelZeroFourthMutationConfiguration program layout registers
        environment continuation parents
      let fifth := fuelZeroFifthMutationConfiguration program layout registers
        environment continuation parents
      have sourceFirst := fuelZeroScriptSource_selects_first program layout bits
        registers depth continuation admissible
      have phaseSourceFirst :
          RootResetPersistentSelector.selectStep? program layout
              (fuelPhaseSourceConfiguration program layout registers 0
                environment continuation parents).cursor.erase =
            some first.cursor.erase := by
        simpa [fuelPhaseSourceConfiguration, fuelZeroScriptSourceConfiguration,
          environment, parents, first] using sourceFirst
      have firstSecond := fuelZeroFirst_selects_second program layout bits
        registers depth continuation admissible
      have secondThird := fuelZeroSecond_selects_third program layout bits
        registers depth continuation admissible
      have thirdFourth := fuelZeroThird_selects_fourth program layout bits
        registers depth continuation admissible
      have fourthFifth := fuelZeroFourth_selects_fifth program layout bits
        registers depth continuation admissible
      have chain : RootResetExactTraceAgreement.SelectorChain
          (RootResetPersistentSelector.selectStep? program layout)
          (fuelPhaseSourceConfiguration program layout registers 0
            environment continuation parents)
          [first, second, third, fourth, fifth] :=
        .next phaseSourceFirst
          (.next firstSecond
            (.next secondThird
              (.next thirdFourth
                (.next fourthFifth (.done fifth)))))
      simpa [SchedulerNestedPhase.fuelConfigurationsAt,
        fuelPhaseSourceConfiguration, fuelZeroScriptSourceConfiguration,
        environment, parents, first, second, third, fourth, fifth] using chain
  | fuel + 1, depth => by
      let environment :=
        environmentCode (compileActions program layout.tree) bits
      let parents :=
        PrimitiveFuel.pendingParents environment continuation depth []
      let nextParents :=
        PrimitiveFuel.pendingParents environment continuation (depth + 1) []
      let source := fuelPhaseSourceConfiguration program layout registers
        (fuel + 1) environment continuation parents
      let first := fuelPositiveFirstMutationConfiguration program layout registers
        fuel environment continuation parents
      let second := fuelPositiveSecondMutationConfiguration program layout registers
        fuel environment continuation parents
      let nextSource := fuelPhaseSourceConfiguration program layout registers fuel
        environment continuation nextParents
      have sourceFirst := fuelPositiveScriptSource_selects_first program layout
        bits registers fuel depth continuation admissible
      have phaseSourceFirst :
          RootResetPersistentSelector.selectStep? program layout
              (fuelPhaseSourceConfiguration program layout registers (fuel + 1)
                environment continuation parents).cursor.erase =
            some first.cursor.erase := by
        simpa [fuelPhaseSourceConfiguration,
          fuelPositiveScriptSourceConfiguration, environment, parents, first]
          using sourceFirst
      have firstSecond := fuelPositiveFirst_selects_second program layout bits
        registers fuel depth continuation admissible
      have suffixRaw := fuelPositiveSampleSuffix_zeroRun program layout registers
        fuel environment continuation parents
      have parentEq :
          .right (.app environment continuation) :: parents = nextParents := by
        simpa [parents, nextParents] using
          (SchedulerCycle.pendingParents_succ_cons environment continuation depth
            []).symm
      rw [parentEq] at suffixRaw
      have suffix : ZeroMutationRun (SchedulerControl.machine program layout) 2
          second nextSource := by
        simpa [second, nextSource] using suffixRaw
      have tail := fuelSelectorChain program layout bits registers continuation
        admissible fuel (depth + 1)
      have linked := RootResetExactTraceAgreement.SelectorChain.prepend suffix tail
      have chain : RootResetExactTraceAgreement.SelectorChain
          (RootResetPersistentSelector.selectStep? program layout) source
          (first :: second ::
            SchedulerNestedPhase.fuelConfigurationsAt program layout bits
              registers continuation [] fuel (depth + 1)) :=
        .next phaseSourceFirst (.next firstSecond linked)
      simpa [SchedulerNestedPhase.fuelConfigurationsAt,
        fuelPhaseSourceConfiguration, source,
        fuelPositiveScriptSourceConfiguration, first, second, environment,
        parents, nextParents] using chain

end PureSFormal.Research.RootResetPersistentClockFuelAgreement
