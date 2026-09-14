import PureSFormal.Computation.DeterministicTapeCook
import PureSFormal.Computation.PureSEvent
import PureSFormal.PureS.BalancedActionTree
import PureSFormal.PureS.SchedulerStageAssembly

/-!
# Deterministic tape halting at the fixed selected pure-S term event

The transparent source compiler is composed with the premise-free scheduler
recurrence for Cook's literal period-912 cyclic tag program.  The target
predicate is eventual decoder-recognized observation of a marked checkpoint
on the actual finite-controller trajectory initialized at the root of the
generated bare pure-S term.
-/

namespace PureSFormal.Computation

open PureSFormal.PureS

namespace DeterministicTapePureS

open PureSFormal.Research.ProtectedTrieDeterministicCompiler

abbrev SourceInstance := DeterministicTape.Instance
abbrev SourceHalts : SourceInstance -> Prop := DeterministicTape.Halts

/-- The fixed balanced dispatcher for Cook's literal period-912 program. -/
abbrev dispatcher : ActionDispatcher Cook.rogozhinCookProgram :=
  BalancedActionTree.dispatcher Cook.rogozhinCookProgram

/-- The fixed marked-snapshot predicate on bare pure-S terms. -/
abbrev FixedMarkedSnapshotTermEvent : Term -> Prop :=
  PureSMarkedSnapshotTermEvent Cook.rogozhinCookProgram dispatcher

/-- The bare pure-S term structurally assigned to a deterministic tape
instance. -/
def encodeTerm (source : SourceInstance) : Term :=
  generator (compileActions Cook.rogozhinCookProgram dispatcher.tree)
    (DeterministicTapeCook.encodeBits source)

/-- The initialized finite-controller configuration assigned to a source. -/
def encodeController (source : SourceInstance) :
    SchedulerInvariant.Configuration Cook.rogozhinCookProgram dispatcher :=
  SchedulerControl.initialConfiguration Cook.rogozhinCookProgram dispatcher
    (DeterministicTapeCook.encodeBits source)

/-- Root initialization of the named bare term is definitionally the named
controller input. -/
@[simp]
theorem initialTermConfiguration_encodeTerm (source : SourceInstance) :
    initialTermConfiguration Cook.rogozhinCookProgram dispatcher
        (encodeTerm source) = encodeController source :=
  rfl

/-- The fixed target language has the package's explicit bounded
semidecider. -/
theorem fixedMarkedSnapshotTermEvent_semidecidable :
    BoundedlySemidecidable FixedMarkedSnapshotTermEvent :=
  pureSMarkedSnapshotTermEvent_semidecidable Cook.rogozhinCookProgram
    dispatcher

/-- Premise-free controller-level endpoint on the literal microtick
trajectory, including every cursor movement and local probe. -/
theorem halts_iff_markedSnapshotControllerEvent (source : SourceInstance) :
    SourceHalts source <->
      PureSMarkedSnapshotControllerEvent Cook.rogozhinCookProgram dispatcher
        (encodeController source) := by
  exact (DeterministicTapeCook.halts_iff_fixedCookEmpty source).trans
    (TermEvent.eventuallyObservesMarkedCheckpointRaw_iff_eventuallyEmpty
      Cook.rogozhinCookProgram dispatcher
      (DeterministicTapeCook.encodeBits source)
      (SchedulerBound.bound Cook.rogozhinCookProgram dispatcher)
      (SchedulerRecurrence.initialGood Cook.rogozhinCookProgram dispatcher
        (DeterministicTapeCook.encodeBits source))
      (SchedulerRecurrence.exactCheckpoint Cook.rogozhinCookProgram dispatcher
        (DeterministicTapeCook.encodeBits source))).symm

/-- Premise-free bare-term endpoint: conventional deterministic-tape
halting is exactly eventual observation of a marked checkpoint on the selected
trajectory starting from the named bare pure-S term. -/
theorem halts_iff_markedSnapshotTermEvent (source : SourceInstance) :
    SourceHalts source <-> FixedMarkedSnapshotTermEvent (encodeTerm source) := by
  unfold FixedMarkedSnapshotTermEvent
  change SourceHalts source <->
    PureSMarkedSnapshotControllerEvent Cook.rogozhinCookProgram dispatcher
      (initialTermConfiguration Cook.rogozhinCookProgram dispatcher
        (encodeTerm source))
  rw [encodeTerm, initialTermConfiguration_generator]
  exact halts_iff_markedSnapshotControllerEvent source

/-- Fully expanded spelling of the fixed pure-S marked-snapshot endpoint. -/
theorem halts_iff_fixedPureSMarkedSnapshotTermEvent
    (source : SourceInstance) :
    DeterministicTape.Halts source <->
      PureSMarkedSnapshotTermEvent Cook.rogozhinCookProgram dispatcher
        (encodeTerm source) :=
  halts_iff_markedSnapshotTermEvent source

/-- The named source-to-term function is a pointwise reduction; the map is
not hidden behind an existential. -/
theorem encodeTerm_reducesVia :
    ReducesVia encodeTerm DeterministicTape.Halts
      (PureSMarkedSnapshotTermEvent Cook.rogozhinCookProgram dispatcher) :=
  halts_iff_markedSnapshotTermEvent

/-- The same transparent source-to-term function supplies the corresponding
extensional many-one reduction. -/
theorem halts_manyOneReduces_markedSnapshotTermEvent :
    ManyOneReduces DeterministicTape.Halts
      (PureSMarkedSnapshotTermEvent Cook.rogozhinCookProgram dispatcher) :=
  ReducesVia.manyOne encodeTerm_reducesVia

end DeterministicTapePureS

end PureSFormal.Computation
