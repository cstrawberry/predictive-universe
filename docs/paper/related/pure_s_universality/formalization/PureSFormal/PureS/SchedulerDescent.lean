import PureSFormal.PureS.CanonicalTraversal
import PureSFormal.PureS.ContextCursor
import PureSFormal.PureS.SchedulerExecution

/-!
# Operational descent through a canonical carrier

The proof-level `CanonicalTraversal.Descent` relation records the unique
registered route from a carrier root to its terminal `omega`.  This module
shows that the literal finite scheduler follows that route.  The controller
uses only its fixed probes and scripts; the context and decoded word occur
only in the proof.
-/

namespace PureSFormal.PureS

namespace SchedulerDescent

open FiniteController SchedulerControl CanonicalTraversal

abbrev Configuration (program : CTS.Program)
    (dispatcher : ActionDispatcher program) :=
  FiniteController.Configuration (SchedulerControl.Control program dispatcher)

/-- The fixed pattern of a closed term accepts exactly that term. -/
theorem matchesBool_exactPattern_eq_true_iff (expected term : Term) :
    Pattern.matchesBool (exactPattern expected) term = true ↔ term = expected := by
  constructor
  · intro matched
    have structural := Pattern.matchesBool_sound matched
    induction expected generalizing term with
    | s =>
        cases structural
        rfl
    | app expectedFn expectedArg fnIH argIH =>
        cases structural with
        | app fnMatch argMatch =>
            have fnEq := fnIH _ (Pattern.matchesBool_complete fnMatch) fnMatch
            have argEq := argIH _ (Pattern.matchesBool_complete argMatch) argMatch
            cases fnEq
            cases argEq
            rfl
  · intro termEq
    subst term
    induction expected with
    | s => rfl
    | app expectedFn expectedArg fnIH argIH =>
        simp only [exactPattern, Pattern.matchesBool, fnIH, argIH,
          Bool.true_and]

/-- A head-arity mismatch rejects an exact closed-term pattern. -/
theorem matchesBool_exactPattern_eq_false_of_headArity_ne
    (expected term : Term)
    (different : term.headArity ≠ expected.headArity) :
    Pattern.matchesBool (exactPattern expected) term = false := by
  cases matched : Pattern.matchesBool (exactPattern expected) term with
  | false => rfl
  | true =>
      have termEq :=
        (matchesBool_exactPattern_eq_true_iff expected term).1 matched
      exact (different (congrArg Term.headArity termEq)).elim

/-- The finite arity pattern recognizes exactly the requested head arity. -/
@[simp] theorem matchesBool_headArityPattern_eq_true_iff
    (arity : Nat) (term : Term) :
    Pattern.matchesBool (headArityPattern arity) term = true ↔
      term.headArity = arity := by
  induction arity generalizing term with
  | zero =>
      cases term with
      | s =>
          constructor <;> intro _ <;> rfl
      | app fn arg =>
          constructor
          · intro impossible
            cases impossible
          · intro impossible
            cases impossible
  | succ arity ih =>
      cases term with
      | s =>
          constructor
          · intro impossible
            cases impossible
          · intro impossible
            cases impossible
      | app fn arg =>
          change
            (Pattern.matchesBool (headArityPattern arity) fn && true = true) ↔
              Nat.succ fn.headArity = Nat.succ arity
          constructor
          · intro matched
            have fnMatched :
                Pattern.matchesBool (headArityPattern arity) fn = true := by
              have parts :
                  Pattern.matchesBool (headArityPattern arity) fn = true ∧
                    decide (true = true) = true := by
                simpa only [Bool.and_eq_true] using matched
              exact parts.1
            exact congrArg Nat.succ ((ih fn).1 fnMatched)
          · intro arityEq
            have fnArity : fn.headArity = arity := Nat.succ.inj arityEq
            have fnMatched := (ih fn).2 fnArity
            have parts :
                Pattern.matchesBool (headArityPattern arity) fn = true ∧
                  decide (true = true) = true := ⟨fnMatched, rfl⟩
            simpa only [Bool.and_eq_true] using parts

theorem matchesBool_headArityPattern_eq_false_of_ne
    (arity : Nat) (term : Term) (different : term.headArity ≠ arity) :
    Pattern.matchesBool (headArityPattern arity) term = false := by
  cases matched : Pattern.matchesBool (headArityPattern arity) term with
  | false => rfl
  | true =>
      exact (different
        ((matchesBool_headArityPattern_eq_true_iff arity term).1 matched)).elim

/-- A finite controller segment with no pure-S contraction. -/
structure ZeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (ticks : Nat) (before after : Configuration program dispatcher) : Prop where
  run_eq : FiniteController.run (SchedulerControl.machine program dispatcher)
      ticks before = after
  count_eq : FiniteController.runMutationCount
      (SchedulerControl.machine program dispatcher) ticks before = 0

namespace ZeroRun

theorem refl
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (configuration : Configuration program dispatcher) :
    ZeroRun program dispatcher 0 configuration configuration :=
  ⟨rfl, rfl⟩

theorem trans
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {firstTicks secondTicks : Nat}
    {before middle after : Configuration program dispatcher}
    (first : ZeroRun program dispatcher firstTicks before middle)
    (second : ZeroRun program dispatcher secondTicks middle after) :
    ZeroRun program dispatcher (firstTicks + secondTicks) before after := by
  constructor
  · rw [FiniteController.run_add, first.run_eq, second.run_eq]
  · rw [FiniteController.runMutationCount_add, first.count_eq,
      first.run_eq, second.count_eq]

/-- Package a compiled local probe, including its Boolean answer row. -/
theorem localProbe
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    (kind : ProbeKind program dispatcher) (registers : Registers program)
    (origin : Cursor) (localSite : probeSite kind = .local) :
    ZeroRun program dispatcher
      (compiledProbeCost program dispatcher kind origin)
      ⟨some (startProbe kind registers), origin⟩
      (SchedulerExecution.commandResult
        (probeAnswer program dispatcher kind
          (compiledProbeAnswer program dispatcher kind origin) registers)
        origin) := by
  constructor
  · exact SchedulerExecution.run_localProbe program dispatcher kind registers
      origin localSite
  · exact SchedulerExecution.runMutationCount_localProbe program dispatcher
      kind registers origin localSite

/-- Package a successful cursor-only fixed script and its epsilon exit row. -/
theorem script
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    (job : ScriptJob program) (registers : Registers program)
    (before after : Cursor)
    (executes : Script.run (jobScript program dispatcher job) before =
      some after)
    (cursorOnly : Script.rdxCount (jobScript program dispatcher job) = 0) :
    ZeroRun program dispatcher ((jobScript program dispatcher job).length + 1)
      ⟨some (startScript (dispatcher := dispatcher) job registers), before⟩
      ⟨some (afterScript program dispatcher job registers), after⟩ := by
  constructor
  · exact SchedulerExecution.run_script program dispatcher job registers
      before after executes
  · rw [SchedulerExecution.runMutationCount_script program dispatcher job
      registers before after executes, cursorOnly]

end ZeroRun

/-- The public DOWN family enters its first fixed shape probe in one row. -/
theorem startDown
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (cursor : Cursor) :
    ZeroRun program dispatcher 1
      ⟨some (.macro (.family .down) registers), cursor⟩
      ⟨some (startProbe .downLiveZero registers), cursor⟩ := by
  constructor
  · rfl
  · rfl

/-- Specialize a compiled local probe whose answer row is a stay command. -/
theorem localProbeStay
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    (kind : ProbeKind program dispatcher) (registers : Registers program)
    (origin : Cursor) (next : Control program dispatcher)
    (localSite : probeSite kind = .local)
    (answer : compiledProbeAnswer program dispatcher kind origin = accepted)
    (continuation : probeAnswer program dispatcher kind accepted registers =
      .stay next) :
    ZeroRun program dispatcher
      (compiledProbeCost program dispatcher kind origin)
      ⟨some (startProbe kind registers), origin⟩
      ⟨some next, origin⟩ := by
  have run := ZeroRun.localProbe kind registers origin localSite
  simpa [answer, continuation, SchedulerExecution.commandResult] using run

/-- Finish DOWN at the unique terminal `omega`, changing only finite control. -/
theorem finishOmega
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (parents : List ParentFrame) :
    ∃ ticks,
      ZeroRun program dispatcher ticks
        ⟨some (.macro (.family .down) registers), ⟨omega, parents⟩⟩
        ⟨some (.macro (.family .up) registers), ⟨omega, parents⟩⟩ := by
  let origin : Cursor := ⟨omega, parents⟩
  have first := startDown program dispatcher registers origin
  have liveZero : ZeroRun program dispatcher
      (compiledProbeCost program dispatcher .downLiveZero origin)
      ⟨some (startProbe .downLiveZero registers), origin⟩
      ⟨some (startProbe .downLiveOne registers), origin⟩ := by
    apply localProbeStay .downLiveZero registers origin
      (startProbe .downLiveOne registers) rfl (accepted := false)
    · rfl
    · rfl
  have liveOne : ZeroRun program dispatcher
      (compiledProbeCost program dispatcher .downLiveOne origin)
      ⟨some (startProbe .downLiveOne registers), origin⟩
      ⟨some (startProbe .downTombstoneZero registers), origin⟩ := by
    apply localProbeStay .downLiveOne registers origin
      (startProbe .downTombstoneZero registers) rfl (accepted := false)
    · rfl
    · rfl
  have tombZero : ZeroRun program dispatcher
      (compiledProbeCost program dispatcher .downTombstoneZero origin)
      ⟨some (startProbe .downTombstoneZero registers), origin⟩
      ⟨some (startProbe .downTombstoneOne registers), origin⟩ := by
    apply localProbeStay .downTombstoneZero registers origin
      (startProbe .downTombstoneOne registers) rfl (accepted := false)
    · rfl
    · rfl
  have tombOne : ZeroRun program dispatcher
      (compiledProbeCost program dispatcher .downTombstoneOne origin)
      ⟨some (startProbe .downTombstoneOne registers), origin⟩
      ⟨some (startProbe .downLocal registers), origin⟩ := by
    apply localProbeStay .downTombstoneOne registers origin
      (startProbe .downLocal registers) rfl (accepted := false)
    · rfl
    · rfl
  have localRun : ZeroRun program dispatcher
      (compiledProbeCost program dispatcher .downLocal origin)
      ⟨some (startProbe .downLocal registers), origin⟩
      ⟨some (startProbe .downBase registers), origin⟩ := by
    apply localProbeStay .downLocal registers origin
      (startProbe .downBase registers) rfl (accepted := false)
    · rfl
    · rfl
  have base : ZeroRun program dispatcher
      (compiledProbeCost program dispatcher .downBase origin)
      ⟨some (startProbe .downBase registers), origin⟩
      ⟨some (.macro .downOmega registers), origin⟩ := by
    apply localProbeStay .downBase registers origin
      (.macro .downOmega registers) rfl (accepted := false)
    · rfl
    · rfl
  have final : ZeroRun program dispatcher 1
      ⟨some (.macro .downOmega registers), origin⟩
      ⟨some (.macro (.family .up) registers), origin⟩ := by
    constructor <;> rfl
  let result := ZeroRun.trans
    (ZeroRun.trans
      (ZeroRun.trans
        (ZeroRun.trans
          (ZeroRun.trans
            (ZeroRun.trans first liveZero) liveOne) tombZero) tombOne) localRun)
      (ZeroRun.trans base final)
  exact ⟨_, result⟩

/-- One registered live wrapper is traversed by the DOWN classifier and script. -/
theorem descendLive
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (tail : Term)
    (parents : List ParentFrame) :
    ∃ ticks,
      ZeroRun program dispatcher ticks
        ⟨some (.macro (.family .down) registers),
          ⟨.app (live bit) tail, parents⟩⟩
        ⟨some (.macro (.family .down) registers),
          ⟨tail, .right (live bit) :: parents⟩⟩ := by
  let origin : Cursor := ⟨.app (live bit) tail, parents⟩
  let endpoint : Cursor := ⟨tail, .right (live bit) :: parents⟩
  have first := startDown program dispatcher registers origin
  cases bit with
  | false =>
      have accepted : ZeroRun program dispatcher
          (compiledProbeCost program dispatcher .downLiveZero origin)
          ⟨some (startProbe .downLiveZero registers), origin⟩
          ⟨some (startScript .downLive registers), origin⟩ := by
        apply localProbeStay .downLiveZero registers origin
          (startScript .downLive registers) rfl (accepted := true)
        · rfl
        · rfl
      have moved : ZeroRun program dispatcher
          ((jobScript program dispatcher .downLive).length + 1)
          ⟨some (startScript .downLive registers), origin⟩
          ⟨some (.macro (.family .down) registers), endpoint⟩ := by
        apply ZeroRun.script .downLive registers origin endpoint
        · rfl
        · rfl
      exact ⟨_, ZeroRun.trans (ZeroRun.trans first accepted) moved⟩
  | true =>
      have rejected : ZeroRun program dispatcher
          (compiledProbeCost program dispatcher .downLiveZero origin)
          ⟨some (startProbe .downLiveZero registers), origin⟩
          ⟨some (startProbe .downLiveOne registers), origin⟩ := by
        apply localProbeStay .downLiveZero registers origin
          (startProbe .downLiveOne registers) rfl (accepted := false)
        · rfl
        · rfl
      have accepted : ZeroRun program dispatcher
          (compiledProbeCost program dispatcher .downLiveOne origin)
          ⟨some (startProbe .downLiveOne registers), origin⟩
          ⟨some (startScript .downLive registers), origin⟩ := by
        apply localProbeStay .downLiveOne registers origin
          (startScript .downLive registers) rfl (accepted := true)
        · rfl
        · rfl
      have moved : ZeroRun program dispatcher
          ((jobScript program dispatcher .downLive).length + 1)
          ⟨some (startScript .downLive registers), origin⟩
          ⟨some (.macro (.family .down) registers), endpoint⟩ := by
        apply ZeroRun.script .downLive registers origin endpoint
        · rfl
        · rfl
      exact ⟨_, ZeroRun.trans
        (ZeroRun.trans (ZeroRun.trans first rejected) accepted) moved⟩

/-- One registered tombstone wrapper is traversed without entering its audit. -/
theorem descendTombstone
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (predecessor audit : Term)
    (parents : List ParentFrame) :
    ∃ ticks,
      ZeroRun program dispatcher ticks
        ⟨some (.macro (.family .down) registers),
          ⟨Carrier.tombstone bit predecessor audit, parents⟩⟩
        ⟨some (.macro (.family .down) registers),
          ⟨predecessor,
            .right .s :: .left (.app (valueTag bit) audit) :: parents⟩⟩ := by
  let origin : Cursor :=
    ⟨Carrier.tombstone bit predecessor audit, parents⟩
  let endpoint : Cursor :=
    ⟨predecessor,
      .right .s :: .left (.app (valueTag bit) audit) :: parents⟩
  have first := startDown program dispatcher registers origin
  have liveZero : ZeroRun program dispatcher
      (compiledProbeCost program dispatcher .downLiveZero origin)
      ⟨some (startProbe .downLiveZero registers), origin⟩
      ⟨some (startProbe .downLiveOne registers), origin⟩ := by
    apply localProbeStay .downLiveZero registers origin
      (startProbe .downLiveOne registers) rfl (accepted := false)
    · cases bit <;> rfl
    · rfl
  have liveOne : ZeroRun program dispatcher
      (compiledProbeCost program dispatcher .downLiveOne origin)
      ⟨some (startProbe .downLiveOne registers), origin⟩
      ⟨some (startProbe .downTombstoneZero registers), origin⟩ := by
    apply localProbeStay .downLiveOne registers origin
      (startProbe .downTombstoneZero registers) rfl (accepted := false)
    · cases bit <;> rfl
    · rfl
  cases bit with
  | false =>
      have accepted : ZeroRun program dispatcher
          (compiledProbeCost program dispatcher .downTombstoneZero origin)
          ⟨some (startProbe .downTombstoneZero registers), origin⟩
          ⟨some (startScript .downTombstone registers), origin⟩ := by
        apply localProbeStay .downTombstoneZero registers origin
          (startScript .downTombstone registers) rfl (accepted := true)
        · rfl
        · rfl
      have moved : ZeroRun program dispatcher
          ((jobScript program dispatcher .downTombstone).length + 1)
          ⟨some (startScript .downTombstone registers), origin⟩
          ⟨some (.macro (.family .down) registers), endpoint⟩ := by
        apply ZeroRun.script .downTombstone registers origin endpoint
        · rfl
        · rfl
      exact ⟨_, ZeroRun.trans
        (ZeroRun.trans (ZeroRun.trans first liveZero) liveOne |>.trans accepted)
        moved⟩
  | true =>
      have tombZero : ZeroRun program dispatcher
          (compiledProbeCost program dispatcher .downTombstoneZero origin)
          ⟨some (startProbe .downTombstoneZero registers), origin⟩
          ⟨some (startProbe .downTombstoneOne registers), origin⟩ := by
        apply localProbeStay .downTombstoneZero registers origin
          (startProbe .downTombstoneOne registers) rfl (accepted := false)
        · rfl
        · rfl
      have accepted : ZeroRun program dispatcher
          (compiledProbeCost program dispatcher .downTombstoneOne origin)
          ⟨some (startProbe .downTombstoneOne registers), origin⟩
          ⟨some (startScript .downTombstone registers), origin⟩ := by
        apply localProbeStay .downTombstoneOne registers origin
          (startScript .downTombstone registers) rfl (accepted := true)
        · rfl
        · rfl
      have moved : ZeroRun program dispatcher
          ((jobScript program dispatcher .downTombstone).length + 1)
          ⟨some (startScript .downTombstone registers), origin⟩
          ⟨some (.macro (.family .down) registers), endpoint⟩ := by
        apply ZeroRun.script .downTombstone registers origin endpoint
        · rfl
        · rfl
      exact ⟨_, ZeroRun.trans
        (ZeroRun.trans
          (ZeroRun.trans (ZeroRun.trans first liveZero) liveOne) tombZero
          |>.trans accepted) moved⟩

/-- DOWN traverses an arbitrary registered queue context and never its audits. -/
theorem descendQueue
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    (registers : Registers program)
    {context : Context} {decoded : List Bool}
    (queue : QueueContext context decoded) (endpoint : Term)
    (parents : List ParentFrame) :
    ∃ ticks,
      ZeroRun program dispatcher ticks
        ⟨some (.macro (.family .down) registers),
          ⟨context.plug endpoint, parents⟩⟩
        ⟨some (.macro (.family .down) registers),
          ⟨endpoint, ContextCursor.frames context endpoint parents⟩⟩ := by
  induction queue generalizing parents with
  | hole => exact ⟨0, ZeroRun.refl program dispatcher _⟩
  | @live innerContext innerDecoded bit inner ih =>
      obtain ⟨firstTicks, first⟩ := descendLive program dispatcher registers bit
        (innerContext.plug endpoint) parents
      obtain ⟨restTicks, rest⟩ := ih (.right (live bit) :: parents)
      refine ⟨firstTicks + restTicks, ?_⟩
      simpa only [Context.plug, ContextCursor.frames] using
        ZeroRun.trans first rest
  | @tombstone innerContext innerDecoded bit audit inner ih =>
      obtain ⟨firstTicks, first⟩ := descendTombstone program dispatcher registers
        bit (innerContext.plug endpoint) audit parents
      obtain ⟨restTicks, rest⟩ := ih
        (.right .s :: .left (.app (valueTag bit) audit) :: parents)
      refine ⟨firstTicks + restTicks, ?_⟩
      simpa only [CellDeletion.tombstoneContext, Context.plug,
        ContextCursor.frames] using! ZeroRun.trans first rest

/-- The six ordered DOWN guards classify a mutable Base by its public shape. -/
theorem mutableBase_probeAnswers
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (actions : Term) (bits : List Bool) (continuation queue : Term)
    (parents : List ParentFrame) :
    let origin : Cursor :=
      ⟨MutableBase.mutableBase actions bits continuation queue, parents⟩
    compiledProbeAnswer program dispatcher .downLiveZero origin = false ∧
      compiledProbeAnswer program dispatcher .downLiveOne origin = false ∧
      compiledProbeAnswer program dispatcher .downTombstoneZero origin = false ∧
      compiledProbeAnswer program dispatcher .downTombstoneOne origin = false ∧
      compiledProbeAnswer program dispatcher .downLocal origin = false ∧
      compiledProbeAnswer program dispatcher .downBase origin = true := by
  simp [compiledProbeAnswer, probeSite, probePattern, livePattern,
    tombstonePattern, localPattern, basePattern, exactPattern,
    headArityPattern, Pattern.matchesBool, MutableBase.mutableBase,
    MutableBase.base, MutableBase.activeAlpha, MutableBase.activeEnvironment,
    MutableBase.activeDispatcher, MutableBase.activeSeed,
    PureSFormal.PureS.live, Carrier.tombstone, baseBeta, baseAlpha,
    environmentCode, PendingFrame.envelope, PendingFrame.envelopeSlot,
    haltCode, b, p, valueTag, v0, v1, C]

/-- The fixed Base address reaches exactly its one mutable queue occurrence. -/
theorem descendBase
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (continuation queue : Term) (parents : List ParentFrame) :
    let actions := compileActions program dispatcher.tree
    let baseContext := MutableBase.queueContext actions bits continuation
      (baseBeta (environmentCode actions bits) continuation)
    ∃ ticks,
      ZeroRun program dispatcher ticks
        ⟨some (.macro (.family .down) registers),
          ⟨MutableBase.mutableBase actions bits continuation queue, parents⟩⟩
        ⟨some (.macro (.family .down) registers),
          ⟨queue, ContextCursor.frames baseContext queue parents⟩⟩ := by
  dsimp only
  let actions := compileActions program dispatcher.tree
  let baseContext := MutableBase.queueContext actions bits continuation
    (baseBeta (environmentCode actions bits) continuation)
  let origin : Cursor :=
    ⟨MutableBase.mutableBase actions bits continuation queue, parents⟩
  let endpoint : Cursor :=
    ⟨queue, ContextCursor.frames baseContext queue parents⟩
  have answers := mutableBase_probeAnswers program dispatcher actions bits
    continuation queue parents
  have first := startDown program dispatcher registers origin
  have liveZero : ZeroRun program dispatcher
      (compiledProbeCost program dispatcher .downLiveZero origin)
      ⟨some (startProbe .downLiveZero registers), origin⟩
      ⟨some (startProbe .downLiveOne registers), origin⟩ := by
    apply localProbeStay .downLiveZero registers origin
      (startProbe .downLiveOne registers) rfl (accepted := false)
    · simpa [origin] using answers.1
    · rfl
  have liveOne : ZeroRun program dispatcher
      (compiledProbeCost program dispatcher .downLiveOne origin)
      ⟨some (startProbe .downLiveOne registers), origin⟩
      ⟨some (startProbe .downTombstoneZero registers), origin⟩ := by
    apply localProbeStay .downLiveOne registers origin
      (startProbe .downTombstoneZero registers) rfl (accepted := false)
    · simpa [origin] using answers.2.1
    · rfl
  have tombZero : ZeroRun program dispatcher
      (compiledProbeCost program dispatcher .downTombstoneZero origin)
      ⟨some (startProbe .downTombstoneZero registers), origin⟩
      ⟨some (startProbe .downTombstoneOne registers), origin⟩ := by
    apply localProbeStay .downTombstoneZero registers origin
      (startProbe .downTombstoneOne registers) rfl (accepted := false)
    · simpa [origin] using answers.2.2.1
    · rfl
  have tombOne : ZeroRun program dispatcher
      (compiledProbeCost program dispatcher .downTombstoneOne origin)
      ⟨some (startProbe .downTombstoneOne registers), origin⟩
      ⟨some (startProbe .downLocal registers), origin⟩ := by
    apply localProbeStay .downTombstoneOne registers origin
      (startProbe .downLocal registers) rfl (accepted := false)
    · simpa [origin] using answers.2.2.2.1
    · rfl
  have notLocal : ZeroRun program dispatcher
      (compiledProbeCost program dispatcher .downLocal origin)
      ⟨some (startProbe .downLocal registers), origin⟩
      ⟨some (startProbe .downBase registers), origin⟩ := by
    apply localProbeStay .downLocal registers origin
      (startProbe .downBase registers) rfl (accepted := false)
    · simpa [origin] using answers.2.2.2.2.1
    · rfl
  have accepted : ZeroRun program dispatcher
      (compiledProbeCost program dispatcher .downBase origin)
      ⟨some (startProbe .downBase registers), origin⟩
      ⟨some (startScript .downBase registers), origin⟩ := by
    apply localProbeStay .downBase registers origin
      (startScript .downBase registers) rfl (accepted := true)
    · simpa [origin] using answers.2.2.2.2.2
    · rfl
  have scriptRun : Script.run (jobScript program dispatcher .downBase) origin =
      some endpoint := by
    have exactRun := ContextCursor.run_down baseContext queue parents
    simpa [origin, endpoint, baseContext, actions, jobScript, addressScript,
      BasePath.wordAddress, MutableBase.mutableBase] using! exactRun
  have moved : ZeroRun program dispatcher
      ((jobScript program dispatcher .downBase).length + 1)
      ⟨some (startScript .downBase registers), origin⟩
      ⟨some (.macro (.family .down) registers), endpoint⟩ := by
    apply ZeroRun.script .downBase registers origin endpoint scriptRun
    rfl
  exact ⟨_, ZeroRun.trans
    (ZeroRun.trans
      (ZeroRun.trans
        (ZeroRun.trans
          (ZeroRun.trans
            (ZeroRun.trans first liveZero) liveOne) tombZero) tombOne) notLocal
      |>.trans accepted) moved⟩

/-- The ordered DOWN guards recognize either reachable Local-shell state. -/
theorem activeShell_probeAnswers
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation snapshot dispatcherTerm : Term)
    (status : ReachableAudit.HaltState) (parents : List ParentFrame) :
    let origin : Cursor :=
      ⟨Carrier.activeShell bits continuation
        (ReachableAudit.haltField status snapshot) dispatcherTerm snapshot
        snapshot, parents⟩
    compiledProbeAnswer program dispatcher .downLiveZero origin = false ∧
      compiledProbeAnswer program dispatcher .downLiveOne origin = false ∧
      compiledProbeAnswer program dispatcher .downTombstoneZero origin = false ∧
      compiledProbeAnswer program dispatcher .downTombstoneOne origin = false ∧
      compiledProbeAnswer program dispatcher .downLocal origin = true := by
  cases status <;>
    simp [compiledProbeAnswer, probeSite, probePattern, livePattern,
      tombstonePattern, localPattern, exactPattern, headArityPattern,
      Pattern.matchesBool, Carrier.activeShell, Carrier.shell,
      ReachableAudit.haltField, freshHField, Carrier.markedHField, markH,
      haltCode, haltTag, b, p, seedCode, word, valueTag, v0, v1, C] <;>
    constructor <;>
      apply matchesBool_exactPattern_eq_false_of_headArity_ne <;>
      simp [Term.headArity, PureSFormal.PureS.live, b, valueTag, v0, v1, C]

/-- The Local classifier and fixed three-edge script reach its dispatcher. -/
theorem descendLocalDispatcher
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bits : List Bool)
    (continuation snapshot dispatcherTerm : Term)
    (status : ReachableAudit.HaltState) (parents : List ParentFrame) :
    let localShell := CanonicalTraversal.localDispatcherContext bits continuation
      (ReachableAudit.haltField status snapshot) snapshot snapshot
    ∃ ticks,
      ZeroRun program dispatcher ticks
        ⟨some (.macro (.family .down) registers),
          ⟨localShell.plug dispatcherTerm, parents⟩⟩
        ⟨some (.macro (.routeDown (rootCodeNode dispatcher)) registers),
          ⟨dispatcherTerm,
            ContextCursor.frames localShell dispatcherTerm parents⟩⟩ := by
  dsimp only
  let localShell := CanonicalTraversal.localDispatcherContext bits continuation
    (ReachableAudit.haltField status snapshot) snapshot snapshot
  let origin : Cursor := ⟨localShell.plug dispatcherTerm, parents⟩
  let endpoint : Cursor :=
    ⟨dispatcherTerm, ContextCursor.frames localShell dispatcherTerm parents⟩
  have answers := activeShell_probeAnswers program dispatcher bits continuation
    snapshot dispatcherTerm status parents
  have first := startDown program dispatcher registers origin
  have liveZero : ZeroRun program dispatcher
      (compiledProbeCost program dispatcher .downLiveZero origin)
      ⟨some (startProbe .downLiveZero registers), origin⟩
      ⟨some (startProbe .downLiveOne registers), origin⟩ := by
    apply localProbeStay .downLiveZero registers origin
      (startProbe .downLiveOne registers) rfl (accepted := false)
    · simpa [origin, localShell] using answers.1
    · rfl
  have liveOne : ZeroRun program dispatcher
      (compiledProbeCost program dispatcher .downLiveOne origin)
      ⟨some (startProbe .downLiveOne registers), origin⟩
      ⟨some (startProbe .downTombstoneZero registers), origin⟩ := by
    apply localProbeStay .downLiveOne registers origin
      (startProbe .downTombstoneZero registers) rfl (accepted := false)
    · simpa [origin, localShell] using answers.2.1
    · rfl
  have tombZero : ZeroRun program dispatcher
      (compiledProbeCost program dispatcher .downTombstoneZero origin)
      ⟨some (startProbe .downTombstoneZero registers), origin⟩
      ⟨some (startProbe .downTombstoneOne registers), origin⟩ := by
    apply localProbeStay .downTombstoneZero registers origin
      (startProbe .downTombstoneOne registers) rfl (accepted := false)
    · simpa [origin, localShell] using answers.2.2.1
    · rfl
  have tombOne : ZeroRun program dispatcher
      (compiledProbeCost program dispatcher .downTombstoneOne origin)
      ⟨some (startProbe .downTombstoneOne registers), origin⟩
      ⟨some (startProbe .downLocal registers), origin⟩ := by
    apply localProbeStay .downTombstoneOne registers origin
      (startProbe .downLocal registers) rfl (accepted := false)
    · simpa [origin, localShell] using answers.2.2.2.1
    · rfl
  have accepted : ZeroRun program dispatcher
      (compiledProbeCost program dispatcher .downLocal origin)
      ⟨some (startProbe .downLocal registers), origin⟩
      ⟨some (startScript .downLocal registers), origin⟩ := by
    apply localProbeStay .downLocal registers origin
      (startScript .downLocal registers) rfl (accepted := true)
    · simpa [origin, localShell] using answers.2.2.2.2
    · rfl
  have scriptRun : Script.run (jobScript program dispatcher .downLocal) origin =
      some endpoint := by
    have exactRun := ContextCursor.run_down localShell dispatcherTerm parents
    simpa [origin, endpoint, localShell, jobScript, ContextCursor.down] using!
      exactRun
  have moved : ZeroRun program dispatcher
      ((jobScript program dispatcher .downLocal).length + 1)
      ⟨some (startScript .downLocal registers), origin⟩
      ⟨some (.macro (.routeDown (rootCodeNode dispatcher)) registers),
        endpoint⟩ := by
    apply ZeroRun.script .downLocal registers origin endpoint scriptRun
    rfl
  exact ⟨_, ZeroRun.trans
    (ZeroRun.trans
      (ZeroRun.trans
        (ZeroRun.trans (ZeroRun.trans first liveZero) liveOne) tombZero) tombOne
      |>.trans accepted) moved⟩

/-- The finite route controller follows an exact selected route to its leaf. -/
theorem descendRoute
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    (registers : Registers program) (snapshot response : Term)
    {tree : Dispatcher.Tree (ActionLabel program)}
    {route : Dispatcher.Route} {label : ActionLabel program}
    {routeContext : Context}
    (selected : RouteContext (selectedAction program) snapshot tree route label
      routeContext)
    (treeMember : tree ∈ treeNodes dispatcher.tree)
    (parents : List ParentFrame) :
    ∃ ticks,
      ZeroRun program dispatcher ticks
        ⟨some (.macro (.routeDown ⟨tree, treeMember⟩) registers),
          ⟨routeContext.plug response, parents⟩⟩
        ⟨some (startScript (.accumulator label) registers),
          ⟨response, ContextCursor.frames routeContext response parents⟩⟩ := by
  induction selected generalizing parents with
  | leaf label =>
      refine ⟨1, ?_⟩
      constructor <;> rfl
  | @left left right route label innerContext inner ih =>
      let node : CodeNode dispatcher := ⟨.node left right, treeMember⟩
      have leftInNode : left ∈ treeNodes (.node left right) := by
        exact List.Mem.tail _
          (mem_append_left_clean (self_mem_treeNodes left))
      have leftMember : left ∈ treeNodes dispatcher.tree :=
        treeNodes_closed treeMember leftInNode
      let child : CodeNode dispatcher := ⟨left, leftMember⟩
      let dormant : Term := RouteGrammar.compiledCall (selectedAction program) right
        snapshot
      let active : Term := innerContext.plug response
      let fork : Term := .app active dormant
      let routeParents : List ParentFrame := .right (.app .s snapshot) :: parents
      let childParents : List ParentFrame := .left dormant :: routeParents
      have activeArity : active.headArity = 2 := by
        exact (inner.snapshotRoute response).toActivatedRoute.result_headArity
      have dormantArity : dormant.headArity = 3 := by
        exact RouteGrammar.compiledCall_headArity _ _ _
      have enter : ZeroRun program dispatcher 1
          ⟨some (.macro (.routeDown node) registers),
            ⟨(selectedLeftContext snapshot dormant innerContext).plug response,
              parents⟩⟩
          ⟨some (startProbe (.routeLeft node) registers),
            ⟨fork, routeParents⟩⟩ := by
        constructor <;>
          simp [node, dormant, active, fork, routeParents, selectedLeftContext,
            RouteGrammar.selectedLeft, chosen, FiniteController.run,
            FiniteController.runMutationCount, FiniteController.step,
            FiniteController.mutationCount, machine, transition, codeLabel?,
            Primitive.exec, Cursor.right?]
      have answer : compiledProbeAnswer program dispatcher (.routeLeft node)
          ⟨fork, routeParents⟩ = true := by
        have activeMatch : Pattern.matchesBool (headArityPattern 2) active =
            true :=
          (matchesBool_headArityPattern_eq_true_iff 2 active).2 activeArity
        have dormantMatch : Pattern.matchesBool (headArityPattern 3) dormant =
            true :=
          (matchesBool_headArityPattern_eq_true_iff 3 dormant).2 dormantArity
        simp [compiledProbeAnswer, probeSite, probePattern,
          selectedLeftPattern, fork, Pattern.matchesBool, activeMatch,
          dormantMatch]
      have probed : ZeroRun program dispatcher
          (compiledProbeCost program dispatcher (.routeLeft node)
            ⟨fork, routeParents⟩)
          ⟨some (startProbe (.routeLeft node) registers),
            ⟨fork, routeParents⟩⟩
          ⟨some (.macro (.routeChoice node .left) registers),
            ⟨fork, routeParents⟩⟩ := by
        apply localProbeStay (.routeLeft node) registers ⟨fork, routeParents⟩
          (.macro (.routeChoice node .left) registers) rfl (accepted := true)
        · exact answer
        · rfl
      have chosenChild : ZeroRun program dispatcher 1
          ⟨some (.macro (.routeChoice node .left) registers),
            ⟨fork, routeParents⟩⟩
          ⟨some (.macro (.routeDown child) registers),
            ⟨active, childParents⟩⟩ := by
        constructor <;>
          simp [node, child, fork, active, childParents, routeParents,
            codeLeft?, FiniteController.run, FiniteController.runMutationCount,
            FiniteController.step, FiniteController.mutationCount, machine,
            transition, Primitive.exec, Cursor.left?]
      obtain ⟨restTicks, rest⟩ := ih leftMember childParents
      refine ⟨(1 + compiledProbeCost program dispatcher (.routeLeft node)
          ⟨fork, routeParents⟩ + 1) + restTicks, ?_⟩
      simpa [node, child, dormant, active, fork, routeParents, childParents,
        ContextCursor.frames] using!
        ZeroRun.trans (ZeroRun.trans (ZeroRun.trans enter probed) chosenChild)
          rest
  | @right left right route label innerContext inner ih =>
      let node : CodeNode dispatcher := ⟨.node left right, treeMember⟩
      have rightInNode : right ∈ treeNodes (.node left right) := by
        exact List.Mem.tail _
          (mem_append_right_clean (treeNodes left) (self_mem_treeNodes right))
      have rightMember : right ∈ treeNodes dispatcher.tree :=
        treeNodes_closed treeMember rightInNode
      let child : CodeNode dispatcher := ⟨right, rightMember⟩
      let dormant : Term := RouteGrammar.compiledCall (selectedAction program) left
        snapshot
      let active : Term := innerContext.plug response
      let fork : Term := .app dormant active
      let routeParents : List ParentFrame := .right (.app .s snapshot) :: parents
      let childParents : List ParentFrame := .right dormant :: routeParents
      have activeArity : active.headArity = 2 := by
        exact (inner.snapshotRoute response).toActivatedRoute.result_headArity
      have dormantArity : dormant.headArity = 3 := by
        exact RouteGrammar.compiledCall_headArity _ _ _
      have enter : ZeroRun program dispatcher 1
          ⟨some (.macro (.routeDown node) registers),
            ⟨(selectedRightContext snapshot dormant innerContext).plug response,
              parents⟩⟩
          ⟨some (startProbe (.routeLeft node) registers),
            ⟨fork, routeParents⟩⟩ := by
        constructor <;>
          simp [node, dormant, active, fork, routeParents,
            selectedRightContext, RouteGrammar.selectedRight, chosen,
            FiniteController.run, FiniteController.runMutationCount,
            FiniteController.step, FiniteController.mutationCount, machine,
            transition, codeLabel?, Primitive.exec, Cursor.right?]
      have leftAnswer : compiledProbeAnswer program dispatcher (.routeLeft node)
          ⟨fork, routeParents⟩ = false := by
        have dormantNotTwo : dormant.headArity ≠ 2 := by
          rw [dormantArity]
          decide
        have dormantMismatch :
            Pattern.matchesBool (headArityPattern 2) dormant = false :=
          matchesBool_headArityPattern_eq_false_of_ne 2 dormant dormantNotTwo
        simp [compiledProbeAnswer, probeSite, probePattern,
          selectedLeftPattern, fork, Pattern.matchesBool, dormantMismatch]
      have leftProbe : ZeroRun program dispatcher
          (compiledProbeCost program dispatcher (.routeLeft node)
            ⟨fork, routeParents⟩)
          ⟨some (startProbe (.routeLeft node) registers),
            ⟨fork, routeParents⟩⟩
          ⟨some (startProbe (.routeRight node) registers),
            ⟨fork, routeParents⟩⟩ := by
        apply localProbeStay (.routeLeft node) registers ⟨fork, routeParents⟩
          (startProbe (.routeRight node) registers) rfl (accepted := false)
        · exact leftAnswer
        · rfl
      have rightAnswer : compiledProbeAnswer program dispatcher (.routeRight node)
          ⟨fork, routeParents⟩ = true := by
        have dormantMatch : Pattern.matchesBool (headArityPattern 3) dormant =
            true :=
          (matchesBool_headArityPattern_eq_true_iff 3 dormant).2 dormantArity
        have activeMatch : Pattern.matchesBool (headArityPattern 2) active =
            true :=
          (matchesBool_headArityPattern_eq_true_iff 2 active).2 activeArity
        simp [compiledProbeAnswer, probeSite, probePattern,
          selectedRightPattern, fork, Pattern.matchesBool, dormantMatch,
          activeMatch]
      have rightProbe : ZeroRun program dispatcher
          (compiledProbeCost program dispatcher (.routeRight node)
            ⟨fork, routeParents⟩)
          ⟨some (startProbe (.routeRight node) registers),
            ⟨fork, routeParents⟩⟩
          ⟨some (.macro (.routeChoice node .right) registers),
            ⟨fork, routeParents⟩⟩ := by
        apply localProbeStay (.routeRight node) registers
          ⟨fork, routeParents⟩
          (.macro (.routeChoice node .right) registers) rfl (accepted := true)
        · exact rightAnswer
        · rfl
      have chosenChild : ZeroRun program dispatcher 1
          ⟨some (.macro (.routeChoice node .right) registers),
            ⟨fork, routeParents⟩⟩
          ⟨some (.macro (.routeDown child) registers),
            ⟨active, childParents⟩⟩ := by
        constructor <;>
          simp [node, child, fork, active, childParents, routeParents,
            codeRight?, FiniteController.run,
            FiniteController.runMutationCount, FiniteController.step,
            FiniteController.mutationCount, machine, transition,
            Primitive.exec, Cursor.right?]
      obtain ⟨restTicks, rest⟩ := ih rightMember childParents
      refine ⟨(((1 + compiledProbeCost program dispatcher (.routeLeft node)
          ⟨fork, routeParents⟩) +
          compiledProbeCost program dispatcher (.routeRight node)
            ⟨fork, routeParents⟩) + 1) + restTicks, ?_⟩
      simpa [node, child, dormant, active, fork, routeParents, childParents,
        ContextCursor.frames] using!
        ZeroRun.trans
          (ZeroRun.trans
            (ZeroRun.trans (ZeroRun.trans enter leftProbe) rightProbe)
            chosenChild) rest

/-- Moving one repeated symbol past an equally valued repeated prefix. -/
theorem replicate_append_cons_self
    (value : α) (count : Nat) (tail : List α) :
    List.replicate count value ++ value :: tail =
      value :: (List.replicate count value ++ tail) := by
  induction count with
  | zero => rfl
  | succ count ih =>
      simp only [List.replicate_succ, List.cons_append]
      rw [ih]

/-- Descent through a retained left-associated argument spine. -/
theorem down_applyArgsContext
    (context : Context) (arguments : List Term) :
    ContextCursor.down (applyArgsContext context arguments) =
      List.replicate arguments.length .L ++ ContextCursor.down context := by
  induction arguments generalizing context with
  | nil => rfl
  | cons argument arguments ih =>
      rw [applyArgsContext, ih]
      simp only [ContextCursor.down, List.length_cons, List.replicate_succ]
      exact replicate_append_cons_self .L arguments.length
        (ContextCursor.down context)

/-- The action's semantic history list has the controller's fixed length. -/
theorem actionHistories_length_emitted
    (program : CTS.Program) (label : ActionLabel program) (snapshot : Term) :
    (actionHistories program label snapshot).length =
      (PrimitiveLocalResponse.emitted program label).length := by
  rw [ActionParser.actionHistories_length]
  rcases label with ⟨phase, bit⟩
  cases bit <;> rfl

/-- The leaf-selected accumulator script reaches the literal accumulator. -/
theorem descendAction
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (label : ActionLabel program)
    (snapshot accumulator : Term) (parents : List ParentFrame) :
    let histories := actionHistories program label snapshot
    let action := actionContext histories
    ∃ ticks,
      ZeroRun program dispatcher ticks
        ⟨some (startScript (.accumulator label) registers),
          ⟨ReachableAudit.actionResponse program label snapshot accumulator,
            parents⟩⟩
        ⟨some (.macro (.family .down) registers),
          ⟨accumulator, ContextCursor.frames action accumulator parents⟩⟩ := by
  dsimp only
  let histories := actionHistories program label snapshot
  let action := actionContext histories
  let origin : Cursor :=
    ⟨ReachableAudit.actionResponse program label snapshot accumulator,
      parents⟩
  let endpoint : Cursor :=
    ⟨accumulator, ContextCursor.frames action accumulator parents⟩
  have scriptEq : jobScript program dispatcher (.accumulator label) =
      ContextCursor.down action := by
    change List.replicate (PrimitiveLocalResponse.emitted program label).length
      .L ++ [.R] = ContextCursor.down action
    rw [← actionHistories_length_emitted program label snapshot]
    rw [show action = actionContext (actionHistories program label snapshot) by
      rfl]
    unfold actionContext
    rw [down_applyArgsContext]
    rfl
  have executes : Script.run (jobScript program dispatcher (.accumulator label))
      origin = some endpoint := by
    rw [scriptEq]
    have exactRun := ContextCursor.run_down action accumulator parents
    simpa [origin, endpoint, action, histories,
      ReachableAudit.actionResponse] using exactRun
  have cursorOnly :
      Script.rdxCount (jobScript program dispatcher (.accumulator label)) = 0 := by
    rw [scriptEq]
    exact ContextCursor.down_rdxCount action
  exact ⟨_, ZeroRun.script (.accumulator label) registers origin endpoint
    executes cursorOnly⟩

/-- Zipper frames compose in the same outer-to-inner order as contexts. -/
theorem contextFrames_comp
    (outer inner : Context) (term : Term) (parents : List ParentFrame) :
    ContextCursor.frames (outer.comp inner) term parents =
      ContextCursor.frames inner term
        (ContextCursor.frames outer (inner.plug term) parents) := by
  induction outer generalizing parents with
  | hole => rfl
  | appLeft outer argument ih => exact ih (.left argument :: parents)
  | appRight function outer ih => exact ih (.right function :: parents)

/--
The literal DOWN controller follows every canonical carrier descent to its
unique `omega`, then enters UP.  The whole segment is cursor-only.
-/
theorem run_downDescent
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    (registers : Registers program) {bits : List Bool} {continuation source : Term}
    {decoded : List Bool} {context : Context}
    (descent : Descent program dispatcher.tree bits continuation source decoded
      context)
    (parents : List ParentFrame) :
    ∃ ticks,
      ZeroRun program dispatcher ticks
        ⟨some (.macro (.family .down) registers), ⟨source, parents⟩⟩
        ⟨some (.macro (.family .up) registers),
          ⟨omega, ContextCursor.frames context omega parents⟩⟩ := by
  induction descent generalizing parents with
  | @base queueContext decoded queue =>
      let actions := compileActions program dispatcher.tree
      let baseContext := MutableBase.queueContext actions bits continuation
        (baseBeta (environmentCode actions bits) continuation)
      let queueTerm := queueContext.plug omega
      obtain ⟨baseTicks, baseRun⟩ := descendBase program dispatcher registers bits
        continuation queueTerm parents
      obtain ⟨queueTicks, queueRun⟩ := descendQueue registers queue omega
        (ContextCursor.frames baseContext queueTerm parents)
      obtain ⟨finishTicks, finish⟩ := finishOmega program dispatcher registers
        (ContextCursor.frames queueContext omega
          (ContextCursor.frames baseContext queueTerm parents))
      refine ⟨(baseTicks + queueTicks) + finishTicks, ?_⟩
      simpa [actions, baseContext, queueTerm, contextFrames_comp] using
        ZeroRun.trans (ZeroRun.trans baseRun queueRun) finish
  | @«local» snapshot currentContext segmentContext routeContext currentWord
      appended status route label snapshotInv current segment selected ih =>
      let currentRoot := currentContext.plug omega
      let accumulator := segmentContext.plug currentRoot
      let histories := actionHistories program label snapshot
      let action := actionContext histories
      let response := ReachableAudit.actionResponse program label snapshot
        accumulator
      let dispatcherTerm := routeContext.plug response
      let localShell := localDispatcherContext bits continuation
        (ReachableAudit.haltField status snapshot) snapshot snapshot
      let localParents := ContextCursor.frames localShell dispatcherTerm parents
      obtain ⟨localTicks, localRun⟩ := descendLocalDispatcher program dispatcher
        registers bits continuation snapshot dispatcherTerm status parents
      obtain ⟨routeTicks, routeRun⟩ := descendRoute registers snapshot response
        selected (self_mem_treeNodes dispatcher.tree) localParents
      let routeParents := ContextCursor.frames routeContext response localParents
      obtain ⟨actionTicks, actionRun⟩ := descendAction program dispatcher
        registers label snapshot accumulator routeParents
      let actionParents := ContextCursor.frames action accumulator routeParents
      obtain ⟨segmentTicks, segmentRun⟩ := descendQueue registers segment
        currentRoot actionParents
      let currentParents := ContextCursor.frames segmentContext currentRoot
        actionParents
      obtain ⟨currentTicks, currentRun⟩ := ih currentParents
      refine ⟨((((localTicks + routeTicks) + actionTicks) + segmentTicks) +
        currentTicks), ?_⟩
      simpa [currentRoot, accumulator, histories, action, response,
        dispatcherTerm, localShell, localParents, routeParents, actionParents,
        currentParents, localContext, dispatcherContext, accumulatorContext,
        Context.plug_comp, contextFrames_comp] using!
        ZeroRun.trans
          (ZeroRun.trans
            (ZeroRun.trans (ZeroRun.trans localRun routeRun) actionRun)
            segmentRun) currentRun

end SchedulerDescent

end PureSFormal.PureS
