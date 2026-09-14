import PureSFormal.PureS.CheckedTransition

/-!
# Correctness of a finite fuel-bounded job

`nestedFrames E B n` contains exactly `n` pending frames around a fresh Base.
The scheduler handles the innermost frame first.  This module proves by an
all-horizon structural induction that the completed outer shell represents
exactly `n` absorbing cyclic-tag transitions and still contains the literal
continuation `B`.
-/

namespace PureSFormal.PureS

namespace BoundedJob

/-- The exact one-hole context around `B` in a fresh completed response. -/
def completedContinuationContext
    (bits : List Bool) (carrier completedRoute : Term) : Context :=
  .appRight
    (.app
      (.app (freshHField carrier) completedRoute)
      (.app (seedCode bits) carrier))
    (.appLeft .hole carrier)

/-- The exact one-hole context around `B` in a marked completed response. -/
def markedContinuationContext
    (bits : List Bool) (carrier completedRoute : Term) : Context :=
  .appRight
    (.app
      (.app (Carrier.markedHField carrier carrier) completedRoute)
      (.app (seedCode bits) carrier))
    (.appLeft .hole carrier)

@[simp]
theorem completedContinuationContext_plug
    (bits : List Bool) (continuation carrier completedRoute : Term) :
    (completedContinuationContext bits carrier completedRoute).plug
        continuation =
      LocalResponse.completed bits continuation carrier completedRoute :=
  rfl

@[simp]
theorem markedContinuationContext_plug
    (bits : List Bool) (continuation carrier completedRoute : Term) :
    (markedContinuationContext bits carrier completedRoute).plug continuation =
      LocalResponse.markedCompleted bits continuation carrier completedRoute :=
  rfl

@[simp]
theorem contextAddress_completedContinuationContext
    (bits : List Bool) (carrier completedRoute : Term) :
    CanonicalTraversal.contextAddress
        (completedContinuationContext bits carrier completedRoute) =
      LocalResponse.continuationAddress :=
  rfl

@[simp]
theorem contextAddress_markedContinuationContext
    (bits : List Bool) (carrier completedRoute : Term) :
    CanonicalTraversal.contextAddress
        (markedContinuationContext bits carrier completedRoute) =
      LocalResponse.continuationAddress :=
  rfl

/-- Exact checked provenance of the outermost transition of a positive job. -/
def FinalTransition
    (program : CTS.Program) (actions : ActionDispatcher program)
    (seedBits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation)
    (fuel : Nat) (result : Term) : Prop :=
  ∃ previousFuel previousResult,
    fuel = previousFuel + 1 ∧
    CheckedTransition.Result program actions
      (CTS.iterate program previousFuel
        (CTS.initial program seedBits)).phase
      seedBits continuation hadmissible previousResult
      (CTS.iterate program previousFuel
        (CTS.initial program seedBits)).data
      result
      (CheckedTransition.totalCost program actions
        (CTS.iterate program previousFuel
          (CTS.initial program seedBits)).phase
        (CTS.iterate program previousFuel
          (CTS.initial program seedBits)).data)
      (CheckedTransition.outputStatus
        (CheckedTransition.outputData program
          (CTS.iterate program previousFuel
            (CTS.initial program seedBits)).phase
          (CTS.iterate program previousFuel
            (CTS.initial program seedBits)).data))

/-- Complete semantic and counted-reduction certificate for one bounded job. -/
structure Completion
    (program : CTS.Program) (actions : ActionDispatcher program)
    (seedBits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation) (fuel : Nat)
    (result : Term) (contractions : Nat) : Prop where
  steps : StepsN contractions
    (nestedFrames
      (environmentCode (compileActions program actions.tree) seedBits)
      continuation fuel)
    result
  holds : ReachableAudit.Holds program actions.tree seedBits continuation result
  decodes : CarrierDecoder.decode? program actions.tree seedBits continuation
      hadmissible result =
    some ((CTS.iterate program fuel (CTS.initial program seedBits)).data)
  exposesContinuation : fuel ≠ 0 →
    ∃ context : Context,
      context.plug continuation = result ∧
      (CanonicalTraversal.contextAddress context).length = 2
  finalTransition : fuel ≠ 0 →
    FinalTransition program actions seedBits continuation hadmissible fuel result

/-- A successful lookup supplies a context whose hole has exactly that
address, not merely some extensionally suitable context. -/
theorem context_of_subterm_exact
    {result found : Term} {address : Address}
    (h : result.subterm? address = some found) :
    ∃ context : Context,
      context.plug found = result ∧
      CanonicalTraversal.contextAddress context = address := by
  induction address generalizing result with
  | nil =>
      simp only [Term.subterm?] at h
      have hresult : result = found := Option.some.inj h
      subst result
      exact ⟨.hole, rfl, rfl⟩
  | cons direction rest ih =>
      cases result with
      | s => cases direction <;> simp [Term.subterm?] at h
      | app fn arg =>
          cases direction with
          | left =>
              have hchild : fn.subterm? rest = some found := by
                simpa only [Term.subterm?] using h
              obtain ⟨inner, hplug, haddress⟩ := ih hchild
              exact ⟨.appLeft inner arg, by simp [hplug], by
                simp [CanonicalTraversal.contextAddress, haddress]⟩
          | right =>
              have hchild : arg.subterm? rest = some found := by
                simpa only [Term.subterm?] using h
              obtain ⟨inner, hplug, haddress⟩ := ih hchild
              exact ⟨.appRight fn inner, by simp [hplug], by
                simp [CanonicalTraversal.contextAddress, haddress]⟩

/-- The registered `RL` lookup therefore supplies a depth-two context. -/
theorem continuation_context
    {result continuation : Term}
    (h : result.subterm? LocalResponse.continuationAddress =
      some continuation) :
    ∃ context : Context,
      context.plug continuation = result ∧
      (CanonicalTraversal.contextAddress context).length = 2 := by
  obtain ⟨context, hplug, haddress⟩ := context_of_subterm_exact h
  exact ⟨context, hplug, by rw [haddress]; rfl⟩

/--
Every finite fuel value completes.  Each successor case uses the uniform
halt-consistent transition, including its exact zero-or-one marker decision.
-/
theorem complete
    (program : CTS.Program) (actions : ActionDispatcher program)
    (seedBits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation) :
    ∀ fuel, ∃ result contractions,
      Completion program actions seedBits continuation hadmissible fuel result
        contractions
  | 0 => by
      let result := baseCarrier
        (environmentCode (compileActions program actions.tree) seedBits)
        continuation
      refine ⟨result, 0, ?_⟩
      refine
        { steps := ?_
          holds := ?_
          decodes := ?_
          exposesContinuation := ?_
          finalTransition := ?_ }
      · exact StepsN.refl result
      · exact ReachableAudit.Holds.initial program actions.tree seedBits
          continuation
      · exact CarrierDecoder.decode?_initial program actions.tree seedBits
          continuation hadmissible
      · intro hzero
        exact (hzero rfl).elim
      · intro hzero
        exact (hzero rfl).elim
  | fuel + 1 => by
      let environment :=
        environmentCode (compileActions program actions.tree) seedBits
      obtain ⟨previousResult, previousContractions, previous⟩ :=
        complete program actions seedBits continuation hadmissible fuel
      let currentConfig := CTS.iterate program fuel
        (CTS.initial program seedBits)
      have insideSteps : StepsN previousContractions
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
      have allSteps : StepsN (previousContractions + responseCost)
          (nestedFrames environment continuation (fuel + 1)) result := by
        simpa [environment, responseCost] using
          StepsN.trans insideSteps checked.steps
      refine ⟨result, previousContractions + responseCost, ?_⟩
      refine
        { steps := allSteps
          holds := checked.holds
          decodes := ?_
          exposesContinuation := ?_
          finalTransition := ?_ }
      · rw [CTS.iterate_succ]
        change CarrierDecoder.decode? program actions.tree seedBits continuation
            hadmissible result =
          some (CheckedTransition.outputData program currentConfig.phase
            currentConfig.data)
        exact checked.decodes
      · intro _
        exact continuation_context checked.exposesContinuation
      · intro _
        exact ⟨fuel, previousResult, rfl, checked⟩

/-- The completed result exists with a finite exact contraction count. -/
theorem exists_completion
    (program : CTS.Program) (actions : ActionDispatcher program)
    (seedBits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation) (fuel : Nat) :
    ∃ result contractions,
      StepsN contractions
        (nestedFrames
          (environmentCode (compileActions program actions.tree) seedBits)
          continuation fuel)
        result ∧
      ReachableAudit.Holds program actions.tree seedBits continuation result ∧
      CarrierDecoder.decode? program actions.tree seedBits continuation
          hadmissible result =
        some ((CTS.iterate program fuel
          (CTS.initial program seedBits)).data) := by
  obtain ⟨result, contractions, completion⟩ :=
    complete program actions seedBits continuation hadmissible fuel
  exact ⟨result, contractions, completion.steps, completion.holds,
    completion.decodes⟩

end BoundedJob

end PureSFormal.PureS
