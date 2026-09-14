import PureSFormal.WeakPathUniversality

/-!
# Fixed Rogozhin trajectory composition

This module composes three already checked layers:

* accumulated registered Cook tag trajectories;
* their exact 912-phase CTS lifts;
* the exact bare pure-`S` checkpoint theorem and direct `Pass_R` decoder.

It starts from an initialized Rogozhin configuration.  It does not construct
the external compiler from an arbitrary deterministic Turing machine into
that configuration.  Periodic arrival words omit fields, but every
`RegisteredBoundary.arrival` carries `BoundaryValid`; consequently the
normalization performed by `passDecode?` is the identity in the exact-value
theorems below.

The results prove the forward/value half of equations (20)--(21) at every
registered arrival through the first halt (or forever on a nonhalting run).
They do not claim the global reverse/exclusion half at every intervening CTS
horizon or pure-`S` contraction.
-/

namespace PureSFormal.WeakPathUniversality

open PureS
open Cook.PassClassification

/-- The fixed balanced dispatcher used by the Rogozhin trajectory terms. -/
abbrev trajectoryDispatcher : ActionDispatcher Cook.rogozhinCookProgram :=
  canonicalDispatcher Cook.rogozhinCookProgram

/-- Canonical Cook boundary followed by the literal 114-bit one-hot code. -/
def fixedRogozhinCanonicalBits (initial : MachineConfig) : List Bool :=
  Cook.encodeWord (canonicalWord initial)

/-- The productive pure-`S` scheduler system for one canonical input. -/
def fixedRogozhinCheckpointSystem (initial : MachineConfig) :=
  SchedulerInvariant.SampledGood.productiveSystem
    Cook.rogozhinCookProgram trajectoryDispatcher
    (fixedRogozhinCanonicalBits initial)
    (SchedulerBound.bound Cook.rogozhinCookProgram trajectoryDispatcher)
    (SchedulerControl.initialConfiguration Cook.rogozhinCookProgram
      trajectoryDispatcher (fixedRogozhinCanonicalBits initial))
    (SchedulerRecurrence.initialGood Cook.rogozhinCookProgram
      trajectoryDispatcher (fixedRogozhinCanonicalBits initial))

/-- The literal bare term at the scheduler checkpoint for one CTS horizon. -/
def fixedRogozhinCheckpointTerm (initial : MachineConfig)
    (horizon : Nat) : Term :=
  ((fixedRogozhinCheckpointSystem initial).contractionRun
    (ExactCheckpointRun.checkpointTime Cook.rogozhinCookProgram
      trajectoryDispatcher (fixedRogozhinCanonicalBits initial)
      horizon)).cursor.erase

/-- Every named trajectory term is the exact public CTS checkpoint. -/
theorem fixedRogozhinCheckpointTerm_decode
    (initial : MachineConfig) (horizon : Nat) :
    PublicDecoder.decode Cook.rogozhinCookProgram trajectoryDispatcher.tree
        (fixedRogozhinCheckpointTerm initial horizon) =
      some (horizon,
        CTS.iterate Cook.rogozhinCookProgram horizon
          (CTS.initial Cook.rogozhinCookProgram
            (fixedRogozhinCanonicalBits initial))) := by
  simpa only [fixedRogozhinCheckpointTerm,
    fixedRogozhinCheckpointSystem] using
    (SchedulerRecurrence.exactCheckpoint Cook.rogozhinCookProgram
      trajectoryDispatcher (fixedRogozhinCanonicalBits initial) horizon)

/-- At every actual scheduler checkpoint, the bare-term decoder is exactly
`Pass_R` applied to the corresponding fixed-CTS iterate. -/
theorem fixedRogozhinBareTermDecoder_checkpoint_eq_pass
    (initial : MachineConfig) (horizon : Nat) :
    fixedRogozhinBareTermDecoder
        (fixedRogozhinCheckpointTerm initial horizon) =
      fixedRogozhinPassDecoder horizon
        (CTS.iterate Cook.rogozhinCookProgram horizon
          (CTS.initial Cook.rogozhinCookProgram
            (fixedRogozhinCanonicalBits initial))) := by
  rw [fixedRogozhinBareTermDecoder_eq,
    fixedRogozhinCheckpointTerm_decode]
  rfl

/-- An accumulated positive registered path is decoded at its actual fixed-CTS
arrival horizon.  `BoundaryValid` makes periodic normalization exact. -/
theorem fixedRogozhinPassDecoder_registeredPath_arrival
    {initial : MachineConfig} {machineSteps : Nat}
    (path : RegisteredPath initial (.canonical) machineSteps)
    (hmachineSteps : 0 < machineSteps)
    (direction : ArrivalDirection) (origin : ArrivalOrigin)
    (valid : BoundaryValid direction origin path.config)
    (hboundary : path.boundary = .arrival direction origin valid) :
    fixedRogozhinPassDecoder (Cook.ctsPeriod * path.tagSteps)
        (CTS.iterate Cook.rogozhinCookProgram
          (Cook.ctsPeriod * path.tagSteps)
          (CTS.initial Cook.rogozhinCookProgram
            (fixedRogozhinCanonicalBits initial))) =
      some path.config := by
  have htagSteps : 0 < path.tagSteps :=
    Nat.lt_of_lt_of_le hmachineSteps path.tagSteps_ge
  have hhorizon : 0 < Cook.ctsPeriod * path.tagSteps :=
    Nat.mul_pos (by decide : 0 < Cook.ctsPeriod) htagSteps
  unfold fixedRogozhinCanonicalBits
  change
    fixedRogozhinPassDecoder (Cook.ctsPeriod * path.tagSteps)
        (CTS.iterate Cook.rogozhinCookProgram
          (Cook.ctsPeriod * path.tagSteps)
          (CTS.initial Cook.rogozhinCookProgram
            (Cook.encodeWord
              (registeredWord initial (.canonical))))) = _
  rw [path.tagTrace.toCTS, hboundary]
  exact Cook.passDecode?_validArrival
    (Cook.ctsPeriod * path.tagSteps) hhorizon direction origin path.config valid

/-- The registered arrival observed on the literal pure-`S`
contraction trajectory by the fixed total bare-term decoder. -/
theorem fixedRogozhinBareTermDecoder_registeredPath_arrival
    {initial : MachineConfig} {machineSteps : Nat}
    (path : RegisteredPath initial (.canonical) machineSteps)
    (hmachineSteps : 0 < machineSteps)
    (direction : ArrivalDirection) (origin : ArrivalOrigin)
    (valid : BoundaryValid direction origin path.config)
    (hboundary : path.boundary = .arrival direction origin valid) :
    fixedRogozhinBareTermDecoder
        (fixedRogozhinCheckpointTerm initial
          (Cook.ctsPeriod * path.tagSteps)) =
      some path.config := by
  rw [fixedRogozhinBareTermDecoder_checkpoint_eq_pass]
  exact fixedRogozhinPassDecoder_registeredPath_arrival path hmachineSteps
    direction origin valid hboundary

/-- Every positive machine horizon whose earlier configurations are running
has an accumulated registered path ending in a valid arrival boundary. -/
theorem exists_registeredPath_arrival_of_running
    (initial : MachineConfig) :
    ∀ machineSteps : Nat,
      0 < machineSteps →
      (∀ earlier, earlier < machineSteps →
        ¬ Rogozhin46.Halted (Rogozhin46.iterate earlier initial)) →
      ∃ path : RegisteredPath initial (.canonical) machineSteps,
        ∃ direction : ArrivalDirection, ∃ origin : ArrivalOrigin,
          ∃ valid : BoundaryValid direction origin path.config,
            path.boundary = .arrival direction origin valid := by
  intro machineSteps hpositive running
  cases machineSteps with
  | zero => exact (Nat.lt_irrefl 0 hpositive).elim
  | succ previous =>
      have runningPrefix : ∀ earlier, earlier < previous →
          ¬ Rogozhin46.Halted (Rogozhin46.iterate earlier initial) := by
        intro earlier hearlier
        exact running earlier
          (Nat.lt_trans hearlier (Nat.lt_succ_self previous))
      obtain ⟨priorPath⟩ := exists_registeredPath_of_running initial
        (.canonical) previous runningPrefix
      have hnot : ¬ Rogozhin46.Halted priorPath.config := by
        rw [priorPath.config_eq]
        exact running previous (Nat.lt_succ_self previous)
      cases hcommand : Rogozhin46.transition priorPath.config.state
          priorPath.config.current with
      | halt => exact (hnot hcommand).elim
      | step next written move =>
          cases move with
          | left =>
              exact ⟨priorPath.extend next written .left hcommand,
                .left, leftOrigin priorPath.config,
                applyTransition_boundaryValid priorPath.config next written
                  .left,
                rfl⟩
          | right =>
              exact ⟨priorPath.extend next written .right hcommand,
                .right, rightOrigin priorPath.config,
                applyTransition_boundaryValid priorPath.config next written
                  .right,
                rfl⟩

/-- The initialized canonical configuration is decoded at checkpoint zero. -/
@[simp]
theorem fixedRogozhinBareTermDecoder_canonicalCheckpoint
    (initial : MachineConfig) :
    fixedRogozhinBareTermDecoder
        (fixedRogozhinCheckpointTerm initial 0) = some initial := by
  rw [fixedRogozhinBareTermDecoder_checkpoint_eq_pass]
  change Cook.passDecode? 0
    (CTS.initial Cook.rogozhinCookProgram
      (Cook.encodeWord (canonicalWord initial))) = some initial
  exact Cook.passDecode?_canonical initial

/-- Forward/value part of (20)--(21) at every positive member of `I_c`: an
actual CTS horizon and its actual pure-`S` checkpoint decode to the exact
absorbing Rogozhin iterate. -/
theorem exists_fixedRogozhinDecodedArrivalCheckpoint_of_running
    (initial : MachineConfig) (machineSteps : Nat)
    (hpositive : 0 < machineSteps)
    (running : ∀ earlier, earlier < machineSteps →
      ¬ Rogozhin46.Halted (Rogozhin46.iterate earlier initial)) :
    ∃ tagSteps : Nat,
      machineSteps ≤ tagSteps ∧
      fixedRogozhinBareTermDecoder
          (fixedRogozhinCheckpointTerm initial
            (Cook.ctsPeriod * tagSteps)) =
        some (Rogozhin46.iterate machineSteps initial) := by
  obtain ⟨path, direction, origin, valid, hboundary⟩ :=
    exists_registeredPath_arrival_of_running initial machineSteps hpositive
      running
  refine ⟨path.tagSteps, path.tagSteps_ge, ?_⟩
  rw [← path.config_eq]
  exact fixedRogozhinBareTermDecoder_registeredPath_arrival path hpositive
    direction origin valid hboundary

/-- Forward/value part including `r = 0`.  The running premise is exactly the
finite-prefix membership condition used by the manuscript's `I_c`; hence the
first halted configuration is included, while later absorbing repetitions
are excluded. -/
theorem exists_fixedRogozhinDecodedCheckpoint_of_running
    (initial : MachineConfig) (machineSteps : Nat)
    (running : ∀ earlier, earlier < machineSteps →
      ¬ Rogozhin46.Halted (Rogozhin46.iterate earlier initial)) :
    ∃ tagSteps : Nat,
      machineSteps ≤ tagSteps ∧
      fixedRogozhinBareTermDecoder
          (fixedRogozhinCheckpointTerm initial
            (Cook.ctsPeriod * tagSteps)) =
        some (Rogozhin46.iterate machineSteps initial) := by
  cases machineSteps with
  | zero =>
      exact ⟨0, Nat.zero_le 0,
        fixedRogozhinBareTermDecoder_canonicalCheckpoint initial⟩
  | succ previous =>
      exact exists_fixedRogozhinDecodedArrivalCheckpoint_of_running initial
        (previous + 1) (Nat.zero_lt_succ previous) running

end PureSFormal.WeakPathUniversality
