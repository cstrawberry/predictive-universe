import PureSFormal.Computation.SourceChronologyRogozhin
import PureSFormal.Computation.CookSeedPassReadback

set_option backward.isDefEq.respectTransparency false

/-!
# Coherent registered-path clocks through Cook

Registered paths are constructed recursively from the actual transition
command. This construction requires only a proof that the requested machine
prefix runs; it does not choose witnesses from an existential theorem.
-/

namespace PureSFormal.Computation.SourceChronologyCook

open Cook Cook.PassClassification
open SourceChronologyNormalizedTag SourceChronologyRogozhin
open PureSFormal.Research.ProtectedTrieDeterministicCompiler
open ThreeCounterTag ThreeCounterTag.Numeric

def RunningBefore (initial : MachineConfig) (horizon : Nat) : Prop :=
  ∀ earlier, earlier < horizon → ¬ Rogozhin46.Halted (Rogozhin46.iterate earlier initial)

/-- A proof-indexed structural construction of the actual registered path. -/
def registeredPath (initial : MachineConfig) (initialBoundary : RegisteredBoundary initial) :
    (horizon : Nat) → RunningBefore initial horizon → RegisteredPath initial initialBoundary horizon
  | 0, _ => RegisteredPath.zero initial initialBoundary
  | horizon + 1, running =>
      let prior := registeredPath initial initialBoundary horizon
        (fun earlier bounded => running earlier (Nat.lt_trans bounded (Nat.lt_succ_self horizon)))
      match command : Rogozhin46.transition prior.config.state prior.config.current with
      | .halt => False.elim (by
          have live : ¬ Rogozhin46.Halted prior.config := by
            rw [prior.config_eq]
            exact running horizon (Nat.lt_succ_self horizon)
          exact live command)
      | .step next written move => prior.extend next written move command

theorem registeredPath_tagSteps_lt_succ (initial : MachineConfig)
    (boundary : RegisteredBoundary initial) (horizon : Nat)
    (before : RunningBefore initial horizon) (running : RunningBefore initial (horizon + 1)) :
    (registeredPath initial boundary horizon before).tagSteps <
      (registeredPath initial boundary (horizon + 1) running).tagSteps := by
  let prior := registeredPath initial boundary horizon before
  have live : ¬ Rogozhin46.Halted prior.config := by
    rw [prior.config_eq]
    exact running horizon (Nat.lt_succ_self horizon)
  conv => rhs; rw [registeredPath]
  split
  next command => exact (live command).elim
  next next written move command =>
    change prior.tagSteps < (prior.extend next written move command).tagSteps
    exact Nat.lt_add_of_pos_left
      (registeredMachineStep_of_command prior.config prior.boundary next written move command).arrival.steps_pos

theorem registeredPath_tagSteps_strict (initial : MachineConfig)
    (boundary : RegisteredBoundary initial) (first second : Nat)
    (before : RunningBefore initial first) (running : RunningBefore initial second)
    (ordered : first < second) :
    (registeredPath initial boundary first before).tagSteps <
      (registeredPath initial boundary second running).tagSteps := by
  induction second with
  | zero => exact False.elim (Nat.not_lt_zero first ordered)
  | succ second ih =>
      have middle : RunningBefore initial second :=
        fun earlier bounded => running earlier (Nat.lt_trans bounded (Nat.lt_succ_self second))
      have nextLt := registeredPath_tagSteps_lt_succ initial boundary second middle running
      cases Nat.eq_or_lt_of_le (Nat.le_of_lt_succ ordered) with
      | inl same => subst first; exact nextLt
      | inr earlier => exact Nat.lt_trans (ih middle earlier) nextLt

/-- Total finite-horizon clock. Values after `horizon` are deliberately
unspecified for simulation and set to zero. -/
def ctsTime (initial : MachineConfig) (horizon : Nat) (running : RunningBefore initial horizon)
    (index : Nat) : Nat :=
  if bounded : index ≤ horizon then
    ctsPeriod * (registeredPath initial .canonical index
      (fun earlier ordered => running earlier (Nat.lt_of_lt_of_le ordered bounded))).tagSteps
  else 0

theorem ctsTime_zero (initial : MachineConfig) (horizon : Nat) (running : RunningBefore initial horizon) :
    ctsTime initial horizon running 0 = 0 := by
  simp only [ctsTime, Nat.zero_le, dif_pos, registeredPath, RegisteredPath.zero, Nat.mul_zero]

theorem ctsTime_strict (initial : MachineConfig) (horizon : Nat) (running : RunningBefore initial horizon)
    (first second : Nat) (ordered : first < second) (bounded : second ≤ horizon) :
    ctsTime initial horizon running first < ctsTime initial horizon running second := by
  have firstBound := Nat.le_trans (Nat.le_of_lt ordered) bounded
  simp only [ctsTime, firstBound, bounded, dif_pos]
  exact Nat.mul_lt_mul_of_pos_left
    (registeredPath_tagSteps_strict initial .canonical first second _ _ ordered) (by decide : 0 < ctsPeriod)

theorem registeredPath_passDecode (initial : MachineConfig) (horizon : Nat)
    (running : RunningBefore initial horizon) :
    let path := registeredPath initial .canonical horizon running
    passDecode? (ctsPeriod * path.tagSteps)
      (CTS.initial rogozhinCookProgram (encodeWord (registeredWord path.config path.boundary))) =
      some path.config := by
  cases horizon with
  | zero => exact passDecode?_canonical initial
  | succ horizon =>
      let prior := registeredPath initial .canonical horizon
        (fun earlier bounded => running earlier (Nat.lt_trans bounded (Nat.lt_succ_self horizon)))
      have live : ¬ Rogozhin46.Halted prior.config := by
        rw [prior.config_eq]
        exact running horizon (Nat.lt_succ_self horizon)
      dsimp only
      rw [registeredPath]
      split
      next command => exact (live command).elim
      next next written move command =>
        have positive := (registeredMachineStep_of_command prior.config prior.boundary next written move command).arrival.steps_pos
        have totalPositive := Nat.mul_pos (by decide : 0 < ctsPeriod) (Nat.add_pos_left positive prior.tagSteps)
        exact CookArrivalReflection.passDecode?_successor prior.config next written move _ totalPositive

theorem ctsTime_decodes (initial : MachineConfig) (horizon : Nat) (running : RunningBefore initial horizon)
    (index : Nat) (bounded : index ≤ horizon) :
    passDecode? (ctsTime initial horizon running index)
      (CTS.iterate rogozhinCookProgram (ctsTime initial horizon running index)
        (CTS.initial rogozhinCookProgram (encodeWord (canonicalWord initial)))) =
      some (Rogozhin46.iterate index initial) := by
  simp only [ctsTime, bounded, dif_pos]
  let path := registeredPath initial .canonical index
    (fun earlier ordered => running earlier (Nat.lt_of_lt_of_le ordered bounded))
  have trace := path.tagTrace.toCTS
  change CTS.iterate rogozhinCookProgram (ctsPeriod * path.tagSteps)
    (CTS.initial rogozhinCookProgram (encodeWord (canonicalWord initial))) = _ at trace
  rw [trace, registeredPath_passDecode]
  exact congrArg some path.config_eq

end PureSFormal.Computation.SourceChronologyCook
