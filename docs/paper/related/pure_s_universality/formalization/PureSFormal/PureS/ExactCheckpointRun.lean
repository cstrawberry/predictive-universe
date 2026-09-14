import PureSFormal.PureS.CheckpointRun
import PureSFormal.WeakPath.CheckpointTime

/-!
# Executable exact costs for the dovetail checkpoints

The structural checkpoint proofs carry exact finite reductions, but their
counts are existential outputs of the induction.  This module gives those
counts closed recursive definitions.  They can therefore be used as public
checkpoint indices without minimization or logical choice.
-/

namespace PureSFormal.PureS

namespace ExactCheckpointRun

/-- Exact contraction count of one fuel-bounded carrier job. -/
def jobCost (program : CTS.Program) (actions : ActionDispatcher program)
    (seedBits : List Bool) : Nat → Nat
  | 0 => 0
  | fuel + 1 =>
      let current := CTS.iterate program fuel (CTS.initial program seedBits)
      jobCost program actions seedBits fuel +
        CheckedTransition.totalCost program actions current.phase current.data

@[simp]
theorem jobCost_zero
    (program : CTS.Program) (actions : ActionDispatcher program)
    (seedBits : List Bool) :
    jobCost program actions seedBits 0 = 0 :=
  rfl

@[simp]
theorem jobCost_succ
    (program : CTS.Program) (actions : ActionDispatcher program)
    (seedBits : List Bool) (fuel : Nat) :
    jobCost program actions seedBits (fuel + 1) =
      jobCost program actions seedBits fuel +
        CheckedTransition.totalCost program actions
          (CTS.iterate program fuel
            (CTS.initial program seedBits)).phase
          (CTS.iterate program fuel
            (CTS.initial program seedBits)).data :=
  rfl

/-- The bounded-job construction realizes its executable recursive cost. -/
theorem completeJob
    (program : CTS.Program) (actions : ActionDispatcher program)
    (seedBits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation) :
    ∀ fuel, ∃ result,
      BoundedJob.Completion program actions seedBits continuation hadmissible
        fuel result (jobCost program actions seedBits fuel)
  | 0 => by
      let result := baseCarrier
        (environmentCode (compileActions program actions.tree) seedBits)
        continuation
      refine ⟨result, ?_⟩
      refine
        { steps := StepsN.refl result
          holds := ReachableAudit.Holds.initial program actions.tree seedBits
            continuation
          decodes := CarrierDecoder.decode?_initial program actions.tree
            seedBits continuation hadmissible
          exposesContinuation := ?_
          finalTransition := ?_ }
      · intro hzero
        exact (hzero rfl).elim
      · intro hzero
        exact (hzero rfl).elim
  | fuel + 1 => by
      let environment :=
        environmentCode (compileActions program actions.tree) seedBits
      obtain ⟨previousResult, previous⟩ :=
        completeJob program actions seedBits continuation hadmissible fuel
      let currentConfig := CTS.iterate program fuel
        (CTS.initial program seedBits)
      have insideSteps : StepsN (jobCost program actions seedBits fuel)
          (frame environment continuation
            (nestedFrames environment continuation fuel))
          (frame environment continuation previousResult) := by
        exact StepsN.appRight (.app environment continuation) previous.steps
      obtain ⟨result, checked⟩ :=
        CheckedTransition.executeExact program actions currentConfig.phase
          seedBits continuation previousResult hadmissible currentConfig.data
          previous.holds (by simpa [currentConfig] using previous.decodes)
      let responseCost := CheckedTransition.totalCost program actions
        currentConfig.phase currentConfig.data
      have allSteps : StepsN
          (jobCost program actions seedBits fuel + responseCost)
          (nestedFrames environment continuation (fuel + 1)) result := by
        simpa [environment, responseCost] using
          StepsN.trans insideSteps checked.steps
      refine ⟨result, ?_⟩
      refine
        { steps := ?_
          holds := checked.holds
          decodes := ?_
          exposesContinuation := ?_
          finalTransition := ?_ }
      · simpa [jobCost, currentConfig, responseCost] using! allSteps
      · rw [CTS.iterate_succ]
        change CarrierDecoder.decode? program actions.tree seedBits continuation
            hadmissible result =
          some (CheckedTransition.outputData program currentConfig.phase
            currentConfig.data)
        exact checked.decodes
      · intro _
        exact BoundedJob.continuation_context checked.exposesContinuation
      · intro _
        exact ⟨fuel, previousResult, rfl, checked⟩

/-- Exact cost of `jobs` consecutive launches at one fixed fuel. -/
def jobsCost (program : CTS.Program) (actions : ActionDispatcher program)
    (seedBits : List Bool) (fuel : Nat) : Nat → Nat
  | 0 => 0
  | jobs + 1 =>
      ((2 * fuel + 6) + jobCost program actions seedBits fuel) +
        jobsCost program actions seedBits fuel jobs

@[simp]
theorem jobsCost_zero
    (program : CTS.Program) (actions : ActionDispatcher program)
    (seedBits : List Bool) (fuel : Nat) :
    jobsCost program actions seedBits fuel 0 = 0 :=
  rfl

@[simp]
theorem jobsCost_succ
    (program : CTS.Program) (actions : ActionDispatcher program)
    (seedBits : List Bool) (fuel jobs : Nat) :
    jobsCost program actions seedBits fuel (jobs + 1) =
      ((2 * fuel + 6) + jobCost program actions seedBits fuel) +
        jobsCost program actions seedBits fuel jobs :=
  rfl

/-- Exact chain-carrying execution of a suffix of one positive stage. -/
theorem completeJobs
    (program : CTS.Program) (actions : ActionDispatcher program)
    (bits : List Bool) (fuel : Nat) (hfuel : fuel ≠ 0) :
    ∀ jobs, ∃ result continuationContext tail,
      CheckpointRun.JobsCompletion program actions bits fuel jobs result
        (jobsCost program actions bits fuel jobs) continuationContext tail
  | 0 => by
      let environment :=
        environmentCode (compileActions program actions.tree) bits
      let result := Dovetail.clockExit fuel 0 environment
      let terminal := CheckpointRun.terminalView fuel bits
      have terminalShape : CheckpointDecoder.ChainShape program actions.tree
          result (.terminal terminal) := by
        cases fuel with
        | zero => exact (hfuel rfl).elim
        | succ n =>
            apply CheckpointDecoder.ChainShape.terminal terminal
            · exact CheckpointDecoder.parseLocal?_terminal_none program
                actions.tree (n + 1) environment
            · simpa [result, terminal, environment] using!
                (CheckpointDecoder.parseTerminal?_clockExit
                  (compileActions program actions.tree) (word bits) n)
      refine ⟨result, .hole, .terminal terminal, ?_⟩
      refine
        { run := ?_
          chain := terminalShape
          tailSpec := rfl
          wrapsCompleted := ?_ }
      · exact ⟨StepsN.refl result, rfl, rfl⟩
      · intro innerTerm innerChain inner
        simpa [CheckpointRun.addLayers]
  | jobs + 1 => by
      let environment :=
        environmentCode (compileActions program actions.tree) bits
      let nextExit := Dovetail.clockExit fuel jobs environment
      have hadmissible : Carrier.Admissible nextExit :=
        Dovetail.clockExit_admissible fuel jobs environment
      obtain ⟨jobResult, job⟩ :=
        completeJob program actions bits nextExit hadmissible fuel
      obtain ⟨jobContext, view, jobPlug, jobDepth, viewContinuation,
          replacementShape, viewSpec⟩ :=
        CheckpointRun.finalTransition_layer (job.finalTransition hfuel)
      obtain ⟨laterResult, laterContext, laterTail, later⟩ :=
        completeJobs program actions bits fuel hfuel jobs
      have launchSteps : StepsN (2 * fuel + 6)
          (Dovetail.clockExit fuel (jobs + 1) environment)
          (nestedFrames environment nextExit fuel) :=
        Dovetail.launch_expandJob fuel jobs environment
      have firstPart : StepsN
          ((2 * fuel + 6) + jobCost program actions bits fuel)
          (Dovetail.clockExit fuel (jobs + 1) environment) jobResult :=
        StepsN.trans launchSteps job.steps
      have firstToHole : StepsN
          ((2 * fuel + 6) + jobCost program actions bits fuel)
          (Dovetail.clockExit fuel (jobs + 1) environment)
          (jobContext.plug nextExit) := by
        rw [jobPlug]
        exact firstPart
      have laterInside : StepsN
          (jobsCost program actions bits fuel jobs)
          (jobContext.plug nextExit) (jobContext.plug laterResult) :=
        later.run.steps.inContext jobContext
      let result := jobContext.plug laterResult
      let continuationContext := jobContext.comp laterContext
      let outerView := CheckpointRun.retarget view laterResult
      let tail := CheckpointDecoder.prependLocal outerView laterTail
      have allSteps : StepsN
          (((2 * fuel + 6) + jobCost program actions bits fuel) +
            jobsCost program actions bits fuel jobs)
          (Dovetail.clockExit fuel (jobs + 1) environment) result :=
        StepsN.trans firstToHole laterInside
      have terminalPlug : continuationContext.plug
          (Dovetail.clockExit fuel 0 environment) = result := by
        dsimp [continuationContext, result]
        rw [Context.plug_comp]
        change jobContext.plug
            (laterContext.plug (Dovetail.clockExit fuel 0 environment)) =
          jobContext.plug laterResult
        rw [later.run.plugsTerminal]
      have depth :
          (CanonicalTraversal.contextAddress continuationContext).length =
            2 * (jobs + 1) := by
        rw [show CanonicalTraversal.contextAddress continuationContext =
          CanonicalTraversal.contextAddress jobContext ++
            CanonicalTraversal.contextAddress laterContext by
          exact CanonicalTraversal.contextAddress_comp jobContext laterContext]
        rw [List.length_append, jobDepth, later.run.contextDepth]
        rw [Nat.mul_add]
        simp only [Nat.mul_one]
        exact Nat.add_comm _ _
      have outerSpec : CheckpointRun.ViewSpec program actions.tree bits fuel
          outerView := by
        simpa [outerView, CheckpointRun.ViewSpec] using viewSpec
      have chainShape : CheckpointDecoder.ChainShape program actions.tree result
          tail := by
        dsimp [result, tail, outerView]
        exact CheckpointDecoder.ChainShape.prepend
          (replacementShape laterResult) later.chain
      have tailShape : CheckpointRun.TailSpec program actions.tree bits fuel
          (jobs + 1) tail :=
        CheckpointRun.TailSpec.prepend later.tailSpec outerSpec
      refine ⟨result, continuationContext, tail, ?_⟩
      refine
        { run := ⟨?_, terminalPlug, depth⟩
          chain := chainShape
          tailSpec := tailShape
          wrapsCompleted := ?_ }
      · simpa [jobsCost] using! allSteps
      · intro innerTerm innerChain innerShape
        have laterWrapped := later.wrapsCompleted innerShape
        have outerShape := replacementShape (laterContext.plug innerTerm)
        have combined := CheckpointDecoder.ChainShape.prepend outerShape
          laterWrapped
        simpa [continuationContext, CheckpointRun.addLayers,
          CheckpointDecoder.prependLocal, Context.plug_comp, Nat.add_assoc]
          using combined

/-- Exact cost of one complete positive stage, including clock expansion. -/
def stageCost (program : CTS.Program) (actions : ActionDispatcher program)
    (bits : List Bool) (stage : Nat) : Nat :=
  (stage + 1) + jobsCost program actions bits stage stage

/-- A positive stage realizes `stageCost` and its complete checkpoint grammar. -/
theorem completeStage
    (program : CTS.Program) (actions : ActionDispatcher program)
    (bits : List Bool) (stage : Nat) (hstage : stage ≠ 0) :
    ∃ result continuationContext chain,
      CheckpointRun.StageCompletion program actions bits stage result
        (stageCost program actions bits stage) continuationContext chain := by
  cases stage with
  | zero => exact (hstage rfl).elim
  | succ n =>
      let stage := n + 1
      let environment :=
        environmentCode (compileActions program actions.tree) bits
      obtain ⟨result, continuationContext, tail, jobs⟩ :=
        completeJobs program actions bits stage (Nat.succ_ne_zero n) stage
      obtain ⟨chain, htail, hlayers, hterminal, hlast⟩ :=
        CheckpointRun.TailSpec.completed jobs.tailSpec
      subst tail
      have expansion := Dovetail.stage_expand stage environment
      have allSteps := StepsN.trans expansion jobs.run.steps
      refine ⟨result, continuationContext, chain, ?_⟩
      refine
        { steps := ?_
          plugsNextStage := ?_
          contextDepth := jobs.run.contextDepth
          chainShape := jobs.chain
          layers := hlayers
          terminal := hterminal
          last := hlast
          wrapsCompleted := jobs.wrapsCompleted }
      · simpa [stageCost, stage, environment] using allSteps
      · simpa [stage, environment] using! jobs.run.plugsTerminal

/-- Positive contraction gap from horizon `h` to horizon `h+1`. -/
def checkpointGap
    (program : CTS.Program) (actions : ActionDispatcher program)
    (bits : List Bool) : Nat → Nat
  | 0 => 1 + stageCost program actions bits 1
  | horizon + 1 => stageCost program actions bits (horizon + 2)

/-- Executable contraction index of every public checkpoint. -/
def checkpointTime
    (program : CTS.Program) (actions : ActionDispatcher program)
    (bits : List Bool) : Nat → Nat :=
  WeakPath.cumulativeTime (checkpointGap program actions bits)

@[simp]
theorem checkpointTime_zero
    (program : CTS.Program) (actions : ActionDispatcher program)
    (bits : List Bool) :
    checkpointTime program actions bits 0 = 0 :=
  rfl

@[simp]
theorem checkpointTime_one
    (program : CTS.Program) (actions : ActionDispatcher program)
    (bits : List Bool) :
    checkpointTime program actions bits 1 =
      1 + stageCost program actions bits 1 :=
  by simp [checkpointTime, checkpointGap]

@[simp]
theorem checkpointTime_positive_succ
    (program : CTS.Program) (actions : ActionDispatcher program)
    (bits : List Bool) (offset : Nat) :
    checkpointTime program actions bits (offset + 1 + 1) =
      checkpointTime program actions bits (offset + 1) +
        stageCost program actions bits (offset + 2) :=
  rfl

/-- Every checkpoint gap is strictly positive. -/
theorem checkpointGap_pos
    (program : CTS.Program) (actions : ActionDispatcher program)
    (bits : List Bool) (horizon : Nat) :
    0 < checkpointGap program actions bits horizon := by
  cases horizon with
  | zero => exact Nat.add_pos_left (by decide : 0 < 1) _
  | succ horizon =>
      unfold checkpointGap stageCost
      exact Nat.add_pos_left (Nat.zero_lt_succ _) _

/-- The executable checkpoint indices are strictly increasing. -/
theorem checkpointTime_strictlyIncreasing
    (program : CTS.Program) (actions : ActionDispatcher program)
    (bits : List Bool) :
    WeakPath.StrictlyIncreasing (checkpointTime program actions bits) := by
  exact WeakPath.cumulativeTime_strictlyIncreasing _
    (checkpointGap_pos program actions bits)

/-- Every positive-horizon checkpoint has positive contraction index. -/
theorem checkpointTime_positive
    (program : CTS.Program) (actions : ActionDispatcher program)
    (bits : List Bool) (offset : Nat) :
    0 < checkpointTime program actions bits (offset + 1) := by
  apply WeakPath.cumulativeTime_pos
    (checkpointGap program actions bits)
    (checkpointGap_pos program actions bits)
  exact Nat.succ_ne_zero offset

/-- Every positive horizon has its full checkpoint certificate at `checkpointTime`. -/
theorem completePositivePrefix
    (program : CTS.Program) (actions : ActionDispatcher program)
    (bits : List Bool) :
    ∀ offset, ∃ result activeContext chain,
      CheckpointRun.PositivePrefix program actions bits (offset + 1) result
        (checkpointTime program actions bits (offset + 1)) activeContext chain
  | 0 => by
      let environment :=
        environmentCode (compileActions program actions.tree) bits
      obtain ⟨result, activeContext, chain, stage⟩ :=
        completeStage program actions bits 1 (by decide)
      have staging : StepsN 1
          (generator (compileActions program actions.tree) bits)
          (Dovetail.stageSource 1 environment) := by
        simpa [environment] using!
          Dovetail.generator_to_staging
            (compileActions program actions.tree) bits
      have allSteps : StepsN (1 + stageCost program actions bits 1)
          (generator (compileActions program actions.tree) bits) result :=
        StepsN.trans staging stage.steps
      refine ⟨result, activeContext, chain, ?_⟩
      refine
        { run := ?_
          chainShape := stage.chainShape
          layers := ?_
          terminal := stage.terminal
          last := stage.last
          wrapsCompleted := ?_ }
      · refine ⟨?_, ?_, ?_⟩
        · simpa using allSteps
        · simpa [environment] using stage.plugsNextStage
        · simpa using stage.contextDepth
      · simpa [CheckpointRun.cumulativeLayers] using stage.layers
      · intro innerTerm innerChain innerShape
        simpa [CheckpointRun.cumulativeLayers] using
          stage.wrapsCompleted innerShape
  | offset + 1 => by
      let horizon := offset + 1
      let stageIndex := horizon + 1
      let environment :=
        environmentCode (compileActions program actions.tree) bits
      obtain ⟨previousResult, previousContext, previousChain, previous⟩ :=
        completePositivePrefix program actions bits offset
      obtain ⟨stageResult, stageContext, stageChain, stage⟩ :=
        completeStage program actions bits stageIndex (by
          dsimp [stageIndex, horizon]
          exact Nat.succ_ne_zero _)
      have previousToHole : StepsN
          (checkpointTime program actions bits (offset + 1))
          (generator (compileActions program actions.tree) bits)
          (previousContext.plug
            (Dovetail.stageSource stageIndex environment)) := by
        rw [previous.run.plugsNextStage]
        exact previous.run.steps
      have stageInside : StepsN
          (stageCost program actions bits stageIndex)
          (previousContext.plug
            (Dovetail.stageSource stageIndex environment))
          (previousContext.plug stageResult) :=
        stage.steps.inContext previousContext
      let result := previousContext.plug stageResult
      let activeContext := previousContext.comp stageContext
      let chain := CheckpointRun.addLayers
        (CheckpointRun.cumulativeLayers horizon) stageChain
      have allSteps : StepsN
          (checkpointTime program actions bits (offset + 1) +
            stageCost program actions bits stageIndex)
          (generator (compileActions program actions.tree) bits) result :=
        StepsN.trans previousToHole stageInside
      have nextPlug : activeContext.plug
          (Dovetail.stageSource (stageIndex + 1) environment) = result := by
        dsimp [activeContext, result]
        rw [Context.plug_comp]
        change previousContext.plug
            (stageContext.plug
              (Dovetail.stageSource (stageIndex + 1) environment)) =
          previousContext.plug stageResult
        rw [stage.plugsNextStage]
      have depth :
          (CanonicalTraversal.contextAddress activeContext).length =
            (horizon + 1) * (horizon + 1 + 1) := by
        rw [show CanonicalTraversal.contextAddress activeContext =
          CanonicalTraversal.contextAddress previousContext ++
            CanonicalTraversal.contextAddress stageContext by
          exact CanonicalTraversal.contextAddress_comp previousContext
            stageContext]
        rw [List.length_append, previous.run.contextDepth, stage.contextDepth]
        change horizon * (horizon + 1) + 2 * (horizon + 1) =
          (horizon + 1) * (horizon + 2)
        calc
          horizon * (horizon + 1) + 2 * (horizon + 1) =
              (horizon + 2) * (horizon + 1) := by rw [← Nat.add_mul]
          _ = (horizon + 1) * (horizon + 2) := Nat.mul_comm _ _
      have chainShape : CheckpointDecoder.ChainShape program actions.tree result
          (.completed chain) := by
        dsimp [result, chain]
        exact previous.wrapsCompleted stage.chainShape
      refine ⟨result, activeContext, chain, ?_⟩
      refine
        { run := ⟨?_, ?_, depth⟩
          chainShape := chainShape
          layers := ?_
          terminal := ?_
          last := ?_
          wrapsCompleted := ?_ }
      · simpa [stageIndex, horizon] using allSteps
      · simpa [stageIndex, horizon, environment] using nextPlug
      · dsimp [chain, CheckpointRun.addLayers]
        rw [stage.layers]
        change stageIndex + CheckpointRun.cumulativeLayers horizon =
          CheckpointRun.cumulativeLayers (horizon + 1)
        rw [CheckpointRun.cumulativeLayers_succ]
        dsimp [stageIndex]
        exact Nat.add_comm _ _
      · simpa [chain, CheckpointRun.addLayers, stageIndex, horizon] using
          stage.terminal
      · simpa [chain, CheckpointRun.addLayers, stageIndex, horizon] using
          stage.last
      · intro innerTerm innerChain innerShape
        have stageWrapped := stage.wrapsCompleted innerShape
        have allWrapped := previous.wrapsCompleted stageWrapped
        simpa [activeContext, CheckpointRun.addLayers, Context.plug_comp,
          CheckpointRun.cumulativeLayers, stageIndex, horizon, Nat.add_assoc,
          Nat.add_comm, Nat.add_left_comm] using allWrapped

end ExactCheckpointRun

end PureSFormal.PureS
