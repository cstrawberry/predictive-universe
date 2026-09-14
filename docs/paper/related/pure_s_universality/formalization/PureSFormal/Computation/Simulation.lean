import PureSFormal.Rogozhin.Machine
import PureSFormal.WeakPath.Interface

/-!
# Exact effective source-machine simulation interface

This is the typed boundary that a source-to-Rogozhin compiler proof must
satisfy.  No compiler theorem is imported or assumed here.  The compiler,
decoder, and accepted boundary indices are explicit parameters, not
existentially selected functions.  The decoder receives only a Rogozhin
configuration and returns a packed source instance, horizon, and snapshot, so
it cannot depend on an external input parameter.
-/

namespace PureSFormal.Computation

/-- A deterministic source formalism with a specified family of instances. -/
structure SourceModel where
  Instance : Type
  Snapshot : Type
  initial : Instance → Snapshot
  step : Snapshot → Snapshot
  halted : Snapshot → Prop

namespace SourceModel

/-- Total iteration of the deterministic source transition. -/
def iterate (source : SourceModel) : Nat → source.Snapshot → source.Snapshot
  | 0, snapshot => snapshot
  | horizon + 1, snapshot => source.step (iterate source horizon snapshot)

@[simp]
theorem iterate_zero (source : SourceModel) (snapshot : source.Snapshot) :
    source.iterate 0 snapshot = snapshot :=
  rfl

@[simp]
theorem iterate_succ (source : SourceModel) (horizon : Nat)
    (snapshot : source.Snapshot) :
    source.iterate (horizon + 1) snapshot =
      source.step (source.iterate horizon snapshot) :=
  rfl

/-- Source-level trajectory halting for one packed instance. -/
def EventuallyHalts (source : SourceModel) (input : source.Instance) : Prop :=
  ∃ horizon, source.halted (source.iterate horizon (source.initial input))

/--
The horizons through the first halted snapshot.  Once an absorbing source has
halted, later numerical horizons no longer denote new observable boundaries.
-/
def ActiveHorizon (source : SourceModel) (input : source.Instance)
    (horizon : Nat) : Prop :=
  ∀ earlier, earlier < horizon →
    ¬source.halted (source.iterate earlier (source.initial input))

/-- Horizon zero is active for every source instance. -/
theorem activeHorizon_zero (source : SourceModel) (input : source.Instance) :
    source.ActiveHorizon input 0 := by
  intro earlier himpossible
  exact (Nat.not_lt_zero earlier himpossible).elim

end SourceModel

/-- A history-free decoded boundary carries its own source-instance identity. -/
abbrev PackedSnapshot (source : SourceModel) :=
  source.Instance × Nat × source.Snapshot

/--
Exact, nonstuttering simulation of a source model by the fixed Rogozhin
machine. Exact boundaries are required through the first halted source
snapshot. Post-halt numerical iterates are deliberately excluded: both
machines absorb there, so a history-free decoder cannot assign distinct
horizon numbers to the same repeated halted configuration.
-/
structure ExactEffectiveSimulation
    (source : SourceModel)
    (compile : source.Instance → Rogozhin46.Config)
    (decode : Rogozhin46.Config → Option (PackedSnapshot source))
    (boundaryTime : source.Instance → Nat → Nat) : Prop where
  boundaryZero : ∀ input, boundaryTime input 0 = 0
  boundariesIncrease : ∀ input,
    WeakPath.StrictlyIncreasing (boundaryTime input)
  exactBoundary : ∀ input horizon,
    source.ActiveHorizon input horizon →
    decode (Rogozhin46.iterate (boundaryTime input horizon)
      (compile input)) =
      some (input, horizon,
        source.iterate horizon (source.initial input))
  acceptsOnly : ∀ input index decodedInstance horizon snapshot,
    decode (Rogozhin46.iterate index (compile input)) =
      some (decodedInstance, horizon, snapshot) →
    decodedInstance = input ∧
      index = boundaryTime input horizon ∧
      snapshot = source.iterate horizon (source.initial input) ∧
      source.ActiveHorizon input horizon
  haltsIff : ∀ input,
    source.EventuallyHalts input ↔
      Rogozhin46.EventuallyHalts (compile input)

namespace ExactEffectiveSimulation

/-- The compiled machine's initial boundary decodes without taking a step. -/
theorem decode_compiled
    {source : SourceModel}
    {compile : source.Instance → Rogozhin46.Config}
    {decode : Rogozhin46.Config → Option (PackedSnapshot source)}
    {boundaryTime : source.Instance → Nat → Nat}
    (simulation : ExactEffectiveSimulation source compile decode boundaryTime)
    (input : source.Instance) :
    decode (compile input) =
      some (input, 0, source.initial input) := by
  have exact := simulation.exactBoundary input 0
    (source.activeHorizon_zero input)
  simpa [simulation.boundaryZero input] using exact

/-- Every Rogozhin index outside the accepted boundary sequence is rejected. -/
theorem rejectsOther
    {source : SourceModel}
    {compile : source.Instance → Rogozhin46.Config}
    {decode : Rogozhin46.Config → Option (PackedSnapshot source)}
    {boundaryTime : source.Instance → Nat → Nat}
    (simulation : ExactEffectiveSimulation source compile decode boundaryTime)
    (input : source.Instance) (index : Nat)
    (hindex : ¬WeakPath.IsCheckpoint (boundaryTime input) index) :
    decode (Rogozhin46.iterate index (compile input)) = none := by
  cases hdecode : decode (Rogozhin46.iterate index (compile input)) with
  | none => rfl
  | some packed =>
      rcases packed with ⟨decodedInstance, horizon, snapshot⟩
      have accepted := simulation.acceptsOnly input index decodedInstance
        horizon snapshot hdecode
      exact False.elim (hindex ⟨horizon, accepted.2.1.symm⟩)

/-- Accepted source snapshots are unique at a fixed Rogozhin boundary. -/
theorem decoded_unique
    {source : SourceModel}
    {compile : source.Instance → Rogozhin46.Config}
    {decode : Rogozhin46.Config → Option (PackedSnapshot source)}
    {boundaryTime : source.Instance → Nat → Nat}
    (_simulation : ExactEffectiveSimulation source compile decode boundaryTime)
    {input : source.Instance} {index firstHorizon secondHorizon : Nat}
    {firstSnapshot secondSnapshot : source.Snapshot}
    (hfirst : decode (Rogozhin46.iterate index (compile input)) =
      some (input, firstHorizon, firstSnapshot))
    (hsecond : decode (Rogozhin46.iterate index (compile input)) =
      some (input, secondHorizon, secondSnapshot)) :
    firstHorizon = secondHorizon ∧ firstSnapshot = secondSnapshot := by
  have packed :
      (input, firstHorizon, firstSnapshot) =
        (input, secondHorizon, secondSnapshot) := by
    exact Option.some.inj (hfirst.symm.trans hsecond)
  exact ⟨(Prod.mk.inj (Prod.mk.inj packed).2).1,
    (Prod.mk.inj (Prod.mk.inj packed).2).2⟩

end ExactEffectiveSimulation

end PureSFormal.Computation
