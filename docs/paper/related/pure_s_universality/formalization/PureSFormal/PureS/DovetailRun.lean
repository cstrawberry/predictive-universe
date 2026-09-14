import PureSFormal.PureS.StageRun

/-!
# Finite prefixes of the single dovetailed reduction

The horizon-zero term first contracts to the stage-one source.  Thereafter,
stage `n` is reduced only inside the continuation context accumulated by all
earlier jobs.  The exact continuation depth after stages `1,...,n` is
`n(n+1)`, making the unbounded inward drift explicit at the macro level.
-/

namespace PureSFormal.PureS

namespace DovetailRun

/-- Prefix ending after stages `1,...,horizon`; horizon zero is the unique
staging endpoint immediately after the generator's first contraction. -/
structure Prefix
    (program : CTS.Program) (actions : ActionDispatcher program)
    (seedBits : List Bool) (horizon : Nat)
    (result : Term) (contractions : Nat) (activeContext : Context) : Prop where
  steps : StepsN contractions (generator (compileActions program actions.tree)
    seedBits) result
  plugsNextStage : activeContext.plug
      (Dovetail.stageSource (horizon + 1)
        (environmentCode (compileActions program actions.tree) seedBits)) =
    result
  contextDepth :
    (CanonicalTraversal.contextAddress activeContext).length =
      horizon * (horizon + 1)

/-- Every finite dovetail-stage prefix exists with an exact contraction count
and explicit active continuation context. -/
theorem completePrefix
    (program : CTS.Program) (actions : ActionDispatcher program)
    (seedBits : List Bool) :
    ∀ horizon, ∃ result contractions activeContext,
      Prefix program actions seedBits horizon result contractions activeContext
  | 0 => by
      let environment :=
        environmentCode (compileActions program actions.tree) seedBits
      refine ⟨Dovetail.stageSource 1 environment, 1, .hole, ?_, rfl, rfl⟩
      simpa [environment] using!
        Dovetail.generator_to_staging (compileActions program actions.tree)
          seedBits
  | horizon + 1 => by
      let environment :=
        environmentCode (compileActions program actions.tree) seedBits
      obtain ⟨previousResult, previousContractions, previousContext, previous⟩ :=
        completePrefix program actions seedBits horizon
      let stage := horizon + 1
      have hstage : stage ≠ 0 := Nat.succ_ne_zero horizon
      obtain ⟨stageResult, stageContractions, stageContext, stageRun,
          stagePlug, stageDepth⟩ :=
        StageRun.completeStage program actions seedBits stage hstage
      have previousToHole : StepsN previousContractions
          (generator (compileActions program actions.tree) seedBits)
          (previousContext.plug (Dovetail.stageSource stage environment)) := by
        rw [previous.plugsNextStage]
        exact previous.steps
      have stageInside : StepsN stageContractions
          (previousContext.plug (Dovetail.stageSource stage environment))
          (previousContext.plug stageResult) := by
        exact stageRun.inContext previousContext
      let result := previousContext.plug stageResult
      let contractions := previousContractions + stageContractions
      let activeContext := previousContext.comp stageContext
      have allSteps : StepsN contractions
          (generator (compileActions program actions.tree) seedBits) result :=
        StepsN.trans previousToHole stageInside
      have nextPlug : activeContext.plug
          (Dovetail.stageSource (horizon + 1 + 1) environment) = result := by
        dsimp [activeContext, result]
        rw [Context.plug_comp]
        change previousContext.plug
            (stageContext.plug
              (Dovetail.stageSource (stage + 1) environment)) =
          previousContext.plug stageResult
        rw [stagePlug]
      have depth :
          (CanonicalTraversal.contextAddress activeContext).length =
            (horizon + 1) * (horizon + 1 + 1) := by
        rw [show CanonicalTraversal.contextAddress activeContext =
          CanonicalTraversal.contextAddress previousContext ++
            CanonicalTraversal.contextAddress stageContext by
          exact CanonicalTraversal.contextAddress_comp previousContext
            stageContext]
        rw [List.length_append, previous.contextDepth, stageDepth]
        change horizon * (horizon + 1) + 2 * (horizon + 1) =
          (horizon + 1) * (horizon + 2)
        calc
          horizon * (horizon + 1) + 2 * (horizon + 1) =
              (horizon + 2) * (horizon + 1) := by
                rw [← Nat.add_mul]
          _ = (horizon + 1) * (horizon + 2) := Nat.mul_comm _ _
      exact ⟨result, contractions, activeContext, allSteps, nextPlug, depth⟩

/-- The checkpoint after every positive stage occurs at a finite contraction
index and contains the next stage source at its exact accumulated depth. -/
theorem positiveStage_finite
    (program : CTS.Program) (actions : ActionDispatcher program)
    (seedBits : List Bool) (horizon : Nat) :
    ∃ result contractions activeContext,
      Prefix program actions seedBits (horizon + 1) result contractions
        activeContext :=
  completePrefix program actions seedBits (horizon + 1)

/-- The active continuation depth is unbounded over finite prefixes. -/
theorem contextDepth_ge_horizon
    {program : CTS.Program} {actions : ActionDispatcher program}
    {seedBits : List Bool} {horizon : Nat}
    {result : Term} {contractions : Nat} {activeContext : Context}
    (certificate : Prefix program actions seedBits horizon result contractions
      activeContext) :
    horizon ≤ (CanonicalTraversal.contextAddress activeContext).length := by
  rw [certificate.contextDepth]
  cases horizon with
  | zero => exact Nat.zero_le _
  | succ horizon =>
      calc
        horizon + 1 = (horizon + 1) * 1 := by simp
        _ ≤ (horizon + 1) * (horizon + 1 + 1) :=
          Nat.mul_le_mul_left _ (Nat.succ_le_succ (Nat.zero_le _))

end DovetailRun

end PureSFormal.PureS
