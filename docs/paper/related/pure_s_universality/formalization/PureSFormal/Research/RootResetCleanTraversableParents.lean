import PureSFormal.Research.RootResetCarrierChronologyPreservation

/-!
# Generated completed parents with clear response priorities

Fresh historical Locals retain both the literal nonempty decoder result and
rejection by the progress-transaction classifier. Marked historical Locals
need neither premise. This is proof data about the actual generated syntax.
-/

namespace PureSFormal.Research.RootResetCleanTraversableParents

open PureSFormal.PureS
open RootResetTraversableCompletedParents

inductive CleanParents
    (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    List ParentFrame → Nat → Prop where
  | root : CleanParents program dispatcher [] 0
  | fresh {parents : List ParentFrame} {layers : Nat}
      (outer : CleanParents program dispatcher parents layers)
      (registers : SchedulerControl.Registers program) (bit : Bool)
      (bits : List Bool) (carrier : Term)
      (nonempty : ∃ first rest,
        CheckpointDecoder.decodeCarrier? program dispatcher.tree
          (actionAccumulator program (registers.phase, bit) carrier) =
          some (first :: rest))
      (classifierNone : RootResetAccumulatorClassifier.classify?
        (actionAccumulator program (registers.phase, bit) carrier) = none) :
      CleanParents program dispatcher
        (SchedulerRootContinuation.freshContinuationParents program dispatcher
          registers bit bits carrier parents) (layers + 1)
  | marked {parents : List ParentFrame} {layers : Nat}
      (outer : CleanParents program dispatcher parents layers)
      (registers : SchedulerControl.Registers program) (bit : Bool)
      (bits : List Bool) (carrier : Term) :
      CleanParents program dispatcher
        (SchedulerRootContinuation.markedContinuationParents program dispatcher
          registers bit bits carrier parents) (layers + 1)

theorem CleanParents.toTraversable
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {parents : List ParentFrame} {layers : Nat}
    (outer : CleanParents program dispatcher parents layers) :
    TraversableParents program dispatcher parents layers := by
  induction outer with
  | root => exact .root
  | fresh previous registers bit bits carrier nonempty classifierNone ih =>
      exact .fresh ih registers bit bits carrier nonempty
  | marked previous registers bit bits carrier ih =>
      exact .marked ih registers bit bits carrier

theorem CleanParents.toCompleted
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {parents : List ParentFrame} {layers : Nat}
    (outer : CleanParents program dispatcher parents layers) :
    SchedulerCompletedContext.CompletedParents program dispatcher parents layers :=
  outer.toTraversable.toCompleted

theorem CleanParents.empty
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {parents : List ParentFrame} {layers : Nat}
    (outer : CleanParents program dispatcher parents layers)
    (registers : SchedulerControl.Registers program)
    (bits : List Bool) (carrier : Term) :
    CleanParents program dispatcher
      (SchedulerRootContinuation.emptyContinuationParents program dispatcher
        registers bits carrier parents) (layers + 1) := by
  simpa [SchedulerRootContinuation.emptyContinuationParents,
    SchedulerRootContinuation.markedContinuationParents] using
    CleanParents.marked outer registers false bits carrier

theorem CleanParents.selectedResponseTrace_fresh
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {seedBits : List Bool} {continuation source : Term}
    {admissible : Carrier.Admissible continuation}
    {registers : SchedulerControl.Registers program} {bit : Bool} {suffix : List Bool}
    {outerContext fullContext innerContext targetContext : Context}
    {parents : List ParentFrame} {ticks layers : Nat}
    (outer : CleanParents program dispatcher parents layers)
    (trace : SchedulerCycle.SelectedResponseTrace program dispatcher seedBits
      continuation source admissible registers bit suffix outerContext fullContext
      innerContext targetContext parents ticks)
    (nonempty : (CTS.absorbingStep program ⟨registers.phase, bit :: suffix⟩).data ≠ []) :
    CleanParents program dispatcher
      (SchedulerRootContinuation.freshContinuationParents program dispatcher
        (SchedulerCycle.scannedRegisters registers bit suffix) bit seedBits
        (SchedulerCycle.deletedCarrier bit outerContext innerContext) parents)
      (layers + 1) := by
  have facts := RootResetCarrierChronologyPreservation.selectedResponseTrace_freshFacts
    trace nonempty
  exact .fresh outer _ _ _ _ facts.1 facts.2

end PureSFormal.Research.RootResetCleanTraversableParents
