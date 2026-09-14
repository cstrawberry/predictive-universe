import PureSFormal.WeakPathUniversality
import PureSFormal.Research.RootResetPersistentResponseSelector
import PureSFormal.Research.RootResetTermOnlyTransfer
import PureSFormal.Research.RootResetExactTraceAgreement

/-!
# Exact-trajectory transfer after root-reset agreement

The remaining construction-specific premise is stated at precisely one
contraction sample.  Once it is proved for the seven scheduler families, the
definitions below transfer the existing uniform CTS realization and identify
literal selector iteration with the persistent contraction path.
-/

namespace PureSFormal.Research.RootResetTermOnlyUniversalityTransfer

open PureSFormal.PureS

/-- Canonical bare-term selector for one fixed finite CTS program. -/
def selector (program : CTS.Program) : Term → Option Term :=
  RootResetPersistentResponseSelector.selectStep? program
    (WeakPathUniversality.canonicalDispatcher program)

/-- The sole construction-specific equality required by the transfer. -/
def AgreesOnEverySample (program : CTS.Program) : Prop :=
  ∀ word index,
    selector program
        (((WeakPathUniversality.finiteCTSWeakPathUniversality program).path word).term
          index) =
      some
        (((WeakPathUniversality.finiteCTSWeakPathUniversality program).path word).term
          (index + 1))

/--
Selector certificates on arbitrarily long exact scheduler prefixes imply the
single global agreement proposition used by the term-only transfer.  This
bridge keeps the proof attached to the construction's exact mutation chains,
rather than to the weaker family grammar admitted by `SampledState`.
-/
theorem agreesOnEverySample_of_certifiedStages
    (program : CTS.Program)
    (certified : ∀ (word : List Bool) (offset : Nat),
      Nonempty
        (RootResetExactTraceAgreement.CertifiedPositiveStages program
          (WeakPathUniversality.canonicalDispatcher program) word
          (selector program) (offset + 1))) :
    AgreesOnEverySample program := by
  intro word index
  have selected :=
    RootResetExactTraceAgreement.selectsEveryContractionRun program
      (WeakPathUniversality.canonicalDispatcher program) (selector program)
      certified word index
  simpa [selector, WeakPathUniversality.finiteCTSWeakPathUniversality,
    WeakPathUniversality.finiteCTSUniformCertificate,
    PureS.ControllerProjection.UniformCertificate.uniformRealizes,
    PureS.ControllerProjection.Certificate.realizes,
    PureS.SchedulerInvariant.SampledGood.uniformCertificate] using! selected

/--
The construction-specific local obligation, expressed directly on the
seven-family invariant carried by every contraction sample.  Its conclusion
uses the same executable bounded-search successor as the persistent
controller; only the source bare term is supplied to `selector`.
-/
def AgreesOnSampledGood (program : CTS.Program) : Prop :=
  let dispatcher := WeakPathUniversality.canonicalDispatcher program
  let bound := PureS.SchedulerBound.bound program dispatcher
  ∀ (word : List Bool) (sampleIndex : Nat)
      (configuration : PureS.SchedulerInvariant.Configuration program dispatcher),
    PureS.SchedulerInvariant.SampledGood program dispatcher word sampleIndex
        bound configuration →
      selector program configuration.cursor.erase =
        some
          (PureS.FiniteController.advance
            (PureS.SchedulerControl.machine program dispatcher) bound
            configuration).cursor.erase

/--
Fuel-independent local form of the seven-family obligation.  A
`SampledState` supplies the family grammar; `seekMutation` supplies the
literal next contraction reached by the persistent controller.  The theorem
to be proved for the seven constructors says the bare-term selector returns
that same target.
-/
def AgreesOnSampledState (program : CTS.Program) : Prop :=
  let dispatcher := WeakPathUniversality.canonicalDispatcher program
  ∀ (word : List Bool) (sampleIndex fuel : Nat)
      (before after : PureS.SchedulerInvariant.Configuration program dispatcher),
    PureS.SchedulerInvariant.SampledState program dispatcher word sampleIndex before →
    PureS.FiniteController.seekMutation
        (PureS.SchedulerControl.machine program dispatcher) fuel before = some after →
      selector program before.cursor.erase = some after.cursor.erase

/-- One of the seven exhaustive scheduler-family obligations. -/
def AgreesForFamily (program : CTS.Program)
    (family : PureS.SchedulerControl.Family) : Prop :=
  let dispatcher := WeakPathUniversality.canonicalDispatcher program
  ∀ (word : List Bool) (sampleIndex fuel : Nat)
      (before after : PureS.SchedulerInvariant.Configuration program dispatcher)
      (control : PureS.SchedulerControl.Control program dispatcher),
    before.control = some control →
    control.family = family →
    PureS.SchedulerInvariant.SampledState program dispatcher word sampleIndex before →
    PureS.FiniteController.seekMutation
        (PureS.SchedulerControl.machine program dispatcher) fuel before = some after →
      selector program before.cursor.erase = some after.cursor.erase

/-- The exact seven cases required for a complete sampled-state agreement. -/
structure SevenFamilyAgreement (program : CTS.Program) : Prop where
  clock : AgreesForFamily program .clock
  fuel : AgreesForFamily program .fuel
  down : AgreesForFamily program .down
  up : AgreesForFamily program .up
  frameDispatch : AgreesForFamily program .frameDispatch
  returnFamily : AgreesForFamily program .return
  empty : AgreesForFamily program .empty

/-- Exhaustiveness of the family tag combines the seven local theorems. -/
theorem agreesOnSampledState_of_sevenFamilies
    (program : CTS.Program) (families : SevenFamilyAgreement program) :
    AgreesOnSampledState program := by
  intro word sampleIndex fuel before after sampled found
  rcases sampled.holds.components with
    ⟨control, _phase, _scanned, _emptyMode, controlEq, _registers,
      _position, _evidence⟩
  cases familyEq : control.family with
  | clock =>
      exact families.clock word sampleIndex fuel before after control
        controlEq familyEq sampled found
  | fuel =>
      exact families.fuel word sampleIndex fuel before after control
        controlEq familyEq sampled found
  | down =>
      exact families.down word sampleIndex fuel before after control
        controlEq familyEq sampled found
  | up =>
      exact families.up word sampleIndex fuel before after control
        controlEq familyEq sampled found
  | frameDispatch =>
      exact families.frameDispatch word sampleIndex fuel before after control
        controlEq familyEq sampled found
  | «return» =>
      exact families.returnFamily word sampleIndex fuel before after control
        controlEq familyEq sampled found
  | empty =>
      exact families.empty word sampleIndex fuel before after control
        controlEq familyEq sampled found

/-- The local sampled-state statement discharges the sampled-good statement. -/
theorem agreesOnSampledGood_of_sampledState
    (program : CTS.Program) (oneStep : AgreesOnSampledState program) :
    AgreesOnSampledGood program := by
  intro word sampleIndex configuration good
  obtain ⟨after, found⟩ := good.finds
  have selected := oneStep word sampleIndex
    (PureS.SchedulerBound.bound program
      (WeakPathUniversality.canonicalDispatcher program) configuration)
    configuration after good.current found
  have advanced :
      PureS.FiniteController.advance
          (PureS.SchedulerControl.machine program
            (WeakPathUniversality.canonicalDispatcher program))
          (PureS.SchedulerBound.bound program
            (WeakPathUniversality.canonicalDispatcher program)) configuration = after :=
    PureS.FiniteController.advance_eq_of_seekMutation _ _ found
  simpa [advanced] using selected

/--
One local theorem over `SampledGood` implies agreement at every index of the
literal contraction-sampled run.  This is the global induction step: closure
of `SampledGood` is already built into the productive system.
-/
theorem agreesOnEverySample_of_sampledGood
    (program : CTS.Program) (oneStep : AgreesOnSampledGood program) :
    AgreesOnEverySample program := by
  intro word index
  let dispatcher := WeakPathUniversality.canonicalDispatcher program
  let bound := PureS.SchedulerBound.bound program dispatcher
  let initial := PureS.SchedulerControl.initialConfiguration program dispatcher word
  let initialGood := PureS.SchedulerRecurrence.initialGood program dispatcher word
  let system := PureS.SchedulerInvariant.SampledGood.productiveSystem program
    dispatcher word bound initial initialGood
  have good : PureS.SchedulerInvariant.SampledGood program dispatcher word index
      bound (system.contractionRun index) :=
    PureS.SchedulerInvariant.SampledGood.contractionRun_sampledGood program
      dispatcher word bound initial initialGood index
  have selected := oneStep word index (system.contractionRun index) good
  change selector program (system.contractionRun index).cursor.erase =
    some (system.contractionRun (index + 1)).cursor.erase
  simpa [system, PureS.FiniteController.ProductiveSystem.next] using! selected

/-- The term-only exact-trajectory theorem obtained from global one-step agreement. -/
def finiteCTSTermOnlyUniversalityOfAgreement
    (program : CTS.Program) (agreement : AgreesOnEverySample program) :
    WeakPath.UniformRealizes program
      (RootResetTermOnlyTransfer.Projects (selector program))
      (selector program)
      (PublicDecoder.decode program
        (WeakPathUniversality.canonicalDispatcher program).tree) :=
  RootResetTermOnlyTransfer.transferUniform
    (WeakPathUniversality.finiteCTSWeakPathUniversality program)
    (selector program) agreement

/-- The transferred path is literally the existing contraction-sampled path. -/
@[simp]
theorem transferred_path_eq
    (program : CTS.Program) (agreement : AgreesOnEverySample program)
    (word : List Bool) :
    (finiteCTSTermOnlyUniversalityOfAgreement program agreement).path word =
      (WeakPathUniversality.finiteCTSWeakPathUniversality program).path word :=
  rfl

/-- Fresh-root selector iteration and the persistent path agree at every index. -/
theorem termOnlyPath_eq_persistentPath_of_agreement
    (program : CTS.Program) (agreement : AgreesOnEverySample program)
    (word : List Bool) (index : Nat) :
    RootResetTermOnlyTransfer.run (selector program) index
        ((WeakPathUniversality.finiteCTSWeakPathUniversality program).encode word) =
      ((WeakPathUniversality.finiteCTSWeakPathUniversality program).path word).term
        index := by
  exact RootResetTermOnlyTransfer.transferUniform_run_eq
    (WeakPathUniversality.finiteCTSWeakPathUniversality program)
    (selector program) agreement word index

end PureSFormal.Research.RootResetTermOnlyUniversalityTransfer
