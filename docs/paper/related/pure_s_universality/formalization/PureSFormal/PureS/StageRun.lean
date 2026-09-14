import PureSFormal.PureS.BoundedJob
import PureSFormal.PureS.Dovetail

/-!
# Finite execution of one dovetail stage

At stage `n > 0`, the clock exposes `n` wrappers.  Each wrapper launches a
fresh bound-`n` job, and the completed job retains the remaining wrapper exit
at its literal `RL` continuation.  This module composes those finite proofs
under ordinary one-hole contexts and records the exact depth accumulated by
the continuation chain.
-/

namespace PureSFormal.PureS

namespace StageRun

/-- Execution certificate for `jobs` successive bound-`fuel` launches. -/
structure JobsCompletion
    (program : CTS.Program) (actions : ActionDispatcher program)
    (seedBits : List Bool) (fuel jobs : Nat)
    (result : Term) (contractions : Nat) (continuationContext : Context) : Prop
    where
  steps : StepsN contractions
    (Dovetail.clockExit fuel jobs
      (environmentCode (compileActions program actions.tree) seedBits))
    result
  plugsTerminal : continuationContext.plug
      (Dovetail.clockExit fuel 0
        (environmentCode (compileActions program actions.tree) seedBits)) =
    result
  contextDepth :
    (CanonicalTraversal.contextAddress continuationContext).length = 2 * jobs

/-- Every finite suffix of a positive stage completes and exposes its terminal
clock exit through exactly two continuation edges per completed job. -/
theorem completeJobs
    (program : CTS.Program) (actions : ActionDispatcher program)
    (seedBits : List Bool) (fuel : Nat) (hfuel : fuel ≠ 0) :
    ∀ jobs, ∃ result contractions continuationContext,
      JobsCompletion program actions seedBits fuel jobs result contractions
        continuationContext
  | 0 => by
      let environment :=
        environmentCode (compileActions program actions.tree) seedBits
      exact ⟨Dovetail.clockExit fuel 0 environment, 0, .hole,
        StepsN.refl _, rfl, rfl⟩
  | jobs + 1 => by
      let environment :=
        environmentCode (compileActions program actions.tree) seedBits
      let nextExit := Dovetail.clockExit fuel jobs environment
      have hadmissible : Carrier.Admissible nextExit :=
        Dovetail.clockExit_admissible fuel jobs environment
      obtain ⟨jobResult, jobContractions, job⟩ :=
        BoundedJob.complete program actions seedBits nextExit hadmissible fuel
      obtain ⟨jobContext, jobPlug, jobDepth⟩ :=
        job.exposesContinuation hfuel
      obtain ⟨laterResult, laterContractions, laterContext, later⟩ :=
        completeJobs program actions seedBits fuel hfuel jobs
      have launchSteps : StepsN (2 * fuel + 6)
          (Dovetail.clockExit fuel (jobs + 1) environment)
          (nestedFrames environment nextExit fuel) := by
        exact Dovetail.launch_expandJob fuel jobs environment
      have firstPart : StepsN ((2 * fuel + 6) + jobContractions)
          (Dovetail.clockExit fuel (jobs + 1) environment) jobResult :=
        StepsN.trans launchSteps job.steps
      have firstToHole : StepsN ((2 * fuel + 6) + jobContractions)
          (Dovetail.clockExit fuel (jobs + 1) environment)
          (jobContext.plug nextExit) := by
        rw [jobPlug]
        exact firstPart
      have laterInside : StepsN laterContractions
          (jobContext.plug nextExit) (jobContext.plug laterResult) := by
        exact later.steps.inContext jobContext
      let result := jobContext.plug laterResult
      let total := ((2 * fuel + 6) + jobContractions) + laterContractions
      let continuationContext := jobContext.comp laterContext
      have allSteps : StepsN total
          (Dovetail.clockExit fuel (jobs + 1) environment) result := by
        exact StepsN.trans firstToHole laterInside
      have terminalPlug : continuationContext.plug
          (Dovetail.clockExit fuel 0 environment) = result := by
        dsimp [continuationContext, result]
        rw [Context.plug_comp]
        change jobContext.plug
            (laterContext.plug (Dovetail.clockExit fuel 0 environment)) =
          jobContext.plug laterResult
        rw [later.plugsTerminal]
      have depth :
          (CanonicalTraversal.contextAddress continuationContext).length =
            2 * (jobs + 1) := by
        rw [show CanonicalTraversal.contextAddress continuationContext =
          CanonicalTraversal.contextAddress jobContext ++
            CanonicalTraversal.contextAddress laterContext by
          exact CanonicalTraversal.contextAddress_comp jobContext laterContext]
        rw [List.length_append, jobDepth, later.contextDepth]
        simp [Nat.mul_succ, Nat.add_comm]
      exact ⟨result, total, continuationContext, allSteps, terminalPlug, depth⟩

/-- Full stage execution, from its expanded `n`-wrapper clock spine. -/
theorem completeExpandedStage
    (program : CTS.Program) (actions : ActionDispatcher program)
    (seedBits : List Bool) (stage : Nat) (hstage : stage ≠ 0) :
    ∃ result contractions continuationContext,
      JobsCompletion program actions seedBits stage stage result contractions
        continuationContext :=
  completeJobs program actions seedBits stage hstage stage

/--
Full stage execution including equation (17).  The endpoint contains the
literal source of stage `n+1`, and its continuation-chain depth is exactly
`2n` below the current stage root.
-/
theorem completeStage
    (program : CTS.Program) (actions : ActionDispatcher program)
    (seedBits : List Bool) (stage : Nat) (hstage : stage ≠ 0) :
    ∃ result contractions continuationContext,
      StepsN contractions
        (Dovetail.stageSource stage
          (environmentCode (compileActions program actions.tree) seedBits))
        result ∧
      continuationContext.plug
          (Dovetail.stageSource (stage + 1)
            (environmentCode (compileActions program actions.tree) seedBits)) =
        result ∧
      (CanonicalTraversal.contextAddress continuationContext).length =
        2 * stage := by
  let environment :=
    environmentCode (compileActions program actions.tree) seedBits
  obtain ⟨result, jobContractions, continuationContext, jobs⟩ :=
    completeExpandedStage program actions seedBits stage hstage
  have expansion := Dovetail.stage_expand stage environment
  have allSteps := StepsN.trans expansion jobs.steps
  refine ⟨result, (stage + 1) + jobContractions, continuationContext, ?_, ?_,
    jobs.contextDepth⟩
  · simpa [environment] using allSteps
  · simpa [environment] using! jobs.plugsTerminal

end StageRun

end PureSFormal.PureS
