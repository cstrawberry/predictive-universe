import PureSFormal.PureS.PhysicalMarkerJobs

namespace PureSFormal.PureS.PhysicalMarkerExclusion
open SchedulerControl SchedulerInvariant SchedulerNestedPhase

theorem numeral_ne_haltTag (n : Nat) : C n ≠ haltTag := by
  cases n with
  | zero => intro impossible; cases impossible
  | succ n =>
    intro equal
    have impossible : C n = .s := (Term.app.inj equal).2
    cases n <;> cases impossible

theorem numeral_chosen_safe (payload argument : Term) (n : Nat)
    (parents : List ParentFrame) :
    CursorSafe ⟨chosen payload (.app (C n) argument), parents⟩ :=
  chosen_safe payload _ argument parents (numeral_ne_haltTag n)

theorem base_safe (environment continuation : Term) (parents : List ParentFrame)
    (admissible : Carrier.Admissible continuation) :
    CursorSafe ⟨baseCarrier environment continuation, parents⟩ := by
  cases continuation with
  | s => simp [Carrier.Admissible, Term.headArity] at admissible
  | app left right => rfl

theorem clockTail_noPostMarkers
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program) (stage : Nat)
    (parents : List ParentFrame) : ∀ wrappers remaining,
    NoPostMarkers program dispatcher
      (clockTailConfigurationsAt program dispatcher bits registers stage parents wrappers remaining)
  | _, 0 => noPostMarkers_cons rfl (noPostMarkers_nil program dispatcher)
  | wrappers, remaining + 1 => noPostMarkers_cons (numeral_chosen_safe _ _ _ _)
      (clockTail_noPostMarkers program dispatcher bits registers stage parents (wrappers + 1) remaining)

theorem clock_noPostMarkers
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (parents : List ParentFrame) (stage : Nat) :
    NoPostMarkers program dispatcher
      (clockConfigurationsAt program dispatcher bits registers parents stage) := by
  exact noPostMarkers_cons (numeral_chosen_safe _ _ _ _)
    (clockTail_noPostMarkers program dispatcher bits registers (stage + 1) parents 0 stage)

theorem fuel_noPostMarkers
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program) (continuation : Term)
    (admissible : Carrier.Admissible continuation)
    (parents : List ParentFrame) : ∀ fuel depth,
    NoPostMarkers program dispatcher
      (fuelConfigurationsAt program dispatcher bits registers continuation parents fuel depth)
  | 0, _ => noPostMarkers_cons rfl (noPostMarkers_cons rfl (noPostMarkers_cons rfl
      (noPostMarkers_cons rfl (noPostMarkers_cons (base_safe _ _ _ admissible)
        (noPostMarkers_nil program dispatcher)))))
  | fuel + 1, depth => noPostMarkers_cons (numeral_chosen_safe _ _ _ _) (noPostMarkers_cons rfl
      (fuel_noPostMarkers program dispatcher bits registers continuation admissible parents fuel (depth + 1)))

theorem positivePhase_noPostMarkers
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (parents : List ParentFrame) (fuel : Nat) :
    NoPostMarkers program dispatcher
      (positiveStageConfigurationsAt program dispatcher bits registers parents fuel) := by
  exact noPostMarkers_append (clock_noPostMarkers program dispatcher bits registers parents fuel)
    (noPostMarkers_cons rfl (fuel_noPostMarkers program dispatcher bits (Registers.newJob program)
      _ (Dovetail.clockExit_admissible _ _ _) parents (fuel + 1) 0))

theorem handoffFuel_noPostMarkers
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (fuel remaining : Nat) (parents : List ParentFrame) :
    NoPostMarkers program dispatcher
      (SchedulerJobHandoff.handoffFuelConfigurationsAt program dispatcher bits fuel remaining parents) := by
  exact noPostMarkers_cons rfl
    (fuel_noPostMarkers program dispatcher bits (Registers.newJob program) _
      (Dovetail.clockExit_admissible _ _ _) parents (fuel + 1) 0)

theorem initialPrelude_noPostMarkers
    (program : CTS.Program) (dispatcher : ActionDispatcher program) (bits : List Bool) :
    NoPostMarkers program dispatcher
      (SchedulerRecurrence.initialPreludeConfigurations program dispatcher bits) := by
  exact noPostMarkers_cons rfl (noPostMarkers_nil program dispatcher)

end PureSFormal.PureS.PhysicalMarkerExclusion
