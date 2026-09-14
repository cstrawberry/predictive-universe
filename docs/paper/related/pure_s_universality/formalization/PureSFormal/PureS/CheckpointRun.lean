import PureSFormal.PureS.CheckpointConstructors
import PureSFormal.PureS.BoundedJob
import PureSFormal.PureS.StageRun
import PureSFormal.PureS.DovetailRun

/-!
# Checkpoint correctness for finite dovetail prefixes

This module connects the reduction certificates for bounded jobs and dovetail
stages to the term-only checkpoint decoder.  The horizon comes from the final
clock terminal.  The surrounding Local-layer count is accumulated separately
and is deliberately not equated with that horizon.
-/

namespace PureSFormal.PureS

namespace CheckpointRun

/-! ## Bridge to the term-only carrier grammar -/

/-- A public Base boundary and a public Local boundary are disjoint at `LR`. -/
theorem parseBase?_none_of_localShape
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : CheckpointDecoder.LocalView program}
    (localShape : CheckpointDecoder.LocalShape program tree view term) :
    CheckpointDecoder.parseBase? (compileActions program tree) term = none := by
  cases hbase : CheckpointDecoder.parseBase?
      (compileActions program tree) term with
  | none => rfl
  | some baseView =>
      have baseEq := CheckpointDecoder.parseBase?_sound hbase
      rcases localShape with
        ⟨haltField, dispatcher, seedAudit, continuationAudit, halt,
          dispatch, localEq⟩
      have boundaryEq :
          CheckpointDecoder.openBase (compileActions program tree)
              baseView.continuation baseView.queue baseView.seedPayload
                baseView.beta =
            CheckpointDecoder.openShell haltField dispatcher view.seedPayload
              seedAudit view.continuation continuationAudit :=
        baseEq.symm.trans localEq
      have childEq := congrArg
        (fun source =>
          (source.subterm? [.left, .right]).map Term.headArity)
        boundaryEq
      simp [CheckpointDecoder.openBase, CheckpointDecoder.openShell,
        CheckpointDecoder.openEnvironment, Term.subterm?] at childEq

/-- The open Base parser rejects every exact live-cell boundary. -/
@[simp]
theorem parseBase?_live_none
    (actions : Term) (bit : Bool) (predecessor : Term) :
    CheckpointDecoder.parseBase? actions (.app (live bit) predecessor) = none := by
  cases bit <;>
    simp [CheckpointDecoder.parseBase?, live, b, valueTag, v0, v1]

/-- A tombstone cannot be an open Base when its predecessor is not arity three. -/
theorem parseBase?_tombstone_none_of_headArity_ne_three
    (actions : Term) (bit : Bool) (predecessor audit : Term)
    (hne : predecessor.headArity ≠ 3) :
    CheckpointDecoder.parseBase? actions
        (Carrier.tombstone bit predecessor audit) = none := by
  cases hbase : CheckpointDecoder.parseBase? actions
      (Carrier.tombstone bit predecessor audit) with
  | none => rfl
  | some view =>
      have baseEq := CheckpointDecoder.parseBase?_sound hbase
      have childEq := congrArg
        (fun source =>
          (source.subterm? [.left, .right]).map Term.headArity)
        baseEq
      have harity : predecessor.headArity = 3 := by
        simpa [Carrier.tombstone, CheckpointDecoder.openBase,
          CheckpointDecoder.openEnvironment, Term.subterm?] using childEq
      exact (hne harity).elim

/-- A tombstone around an exact live predecessor is not an open Base. -/
theorem parseBase?_tombstone_live_none
    (actions : Term) (outerBit innerBit : Bool) (tail audit : Term) :
    CheckpointDecoder.parseBase? actions
        (Carrier.tombstone outerBit (.app (live innerBit) tail) audit) = none := by
  cases outerBit <;> cases innerBit <;>
    simp [CheckpointDecoder.parseBase?, CheckpointDecoder.parseEnvironment?,
      Carrier.tombstone, live, b, valueTag, v0, v1, actCode, haltCode,
      haltTag]

/-- The completed-Local parser rejects every exact live-cell boundary. -/
@[simp]
theorem parseLocal?_live_none
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bit : Bool) (predecessor : Term) :
    CheckpointDecoder.parseLocal? program tree
        (.app (live bit) predecessor) = none := by
  apply CheckpointDecoder.parseLocal?_none_of_headArity program tree
  · simp only [Carrier.headArity_liveCell]
    decide
  · simp only [Carrier.headArity_liveCell]
    decide

/-- The completed-Local parser rejects every exact tombstone boundary. -/
@[simp]
theorem parseLocal?_tombstone_none
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bit : Bool) (predecessor audit : Term) :
    CheckpointDecoder.parseLocal? program tree
        (Carrier.tombstone bit predecessor audit) = none := by
  apply CheckpointDecoder.parseLocal?_none_of_headArity program tree
  · simp
  · simp

/-- Parameterized whole roots retain the registered arity-five/six boundary. -/
theorem rootDecodes_headArity
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation term : Term} {decoded : List Bool}
    (hadmissible : Carrier.Admissible continuation)
    (root : CarrierDecoder.RootDecodes program tree bits continuation term
      decoded) :
    term.headArity = 5 ∨ term.headArity = 6 := by
  cases root with
  | base queue beta queueComplete =>
      exact MutableBase.root_headArity (compileActions program tree) bits
        hadmissible queue beta
  | «local» inner dispatch shell =>
      exact shell.result_headArity

/-- A tombstone over a parameterized public path is rejected by open Base. -/
theorem parseBase?_tombstone_path_none
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation predecessor : Term}
    {decoded : List Bool}
    (hadmissible : Carrier.Admissible continuation)
    (path : CarrierDecoder.PathDecodes program tree bits continuation predecessor
      decoded)
    (bit : Bool) (audit : Term) :
    CheckpointDecoder.parseBase? (compileActions program tree)
        (Carrier.tombstone bit predecessor audit) = none := by
  cases path with
  | root rootShape =>
      rcases rootDecodes_headArity hadmissible rootShape with hfive | hsix
      · apply parseBase?_tombstone_none_of_headArity_ne_three
        intro hthree
        rw [hfive] at hthree
        cases hthree
      · apply parseBase?_tombstone_none_of_headArity_ne_three
        intro hthree
        rw [hsix] at hthree
        cases hthree
  | live innerBit inner =>
      exact parseBase?_tombstone_live_none _ bit innerBit _ audit
  | tombstone innerBit innerAudit inner =>
      apply parseBase?_tombstone_none_of_headArity_ne_three
      intro hthree
      rw [Carrier.headArity_tombstone] at hthree
      cases hthree

/--
For generated public carriers, the parameterized carrier grammar forgets to
the wholly term-only grammar.  The target no longer mentions seed bits,
continuation, or admissibility.
-/
theorem pathDecodes_to_termOnly
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {continuation term : Term} {decoded : List Bool}
    (hadmissible : Carrier.Admissible continuation)
    (path : CarrierDecoder.PathDecodes program tree bits continuation term
      decoded) :
    CheckpointDecoder.CarrierDecodes program tree term decoded := by
  apply CarrierDecoder.PathDecodes.rec
    (program := program) (tree := tree) (bits := bits)
    (continuation := continuation) (t := path)
    (motive_1 := fun term decoded _ =>
      CheckpointDecoder.CarrierDecodes program tree term decoded)
    (motive_2 := fun term decoded _ =>
      CheckpointDecoder.CarrierDecodes program tree term decoded)
  ·
    intro queue beta decoded queueComplete
    exact .base
      ⟨queue, continuation, word bits, beta⟩
      (CheckpointDecoder.parseBase?_mutableBase
        (compileActions program tree) bits continuation queue beta)
      queueComplete
  ·
    intro accumulator dispatcher result decoded inner dispatch shell
      innerTermOnly
    obtain ⟨route, label, dispatchShape⟩ := dispatch
    cases shell with
    | fresh haltAudit seedAudit continuationAudit =>
        let view : CheckpointDecoder.LocalView program :=
          ⟨.fresh, route, label, accumulator, word bits, continuation⟩
        have localShape : CheckpointDecoder.LocalShape program tree view
            (Carrier.activeShell bits continuation
              (freshHField haltAudit) dispatcher seedAudit
                continuationAudit) := by
          exact ⟨freshHField haltAudit, dispatcher, seedAudit,
            continuationAudit, .fresh haltAudit, dispatchShape, rfl⟩
        exact .local view (parseBase?_none_of_localShape localShape)
          (CheckpointDecoder.parseLocal?_complete localShape) innerTermOnly
    | marked leftAudit rightAudit seedAudit continuationAudit =>
        let view : CheckpointDecoder.LocalView program :=
          ⟨.marked, route, label, accumulator, word bits, continuation⟩
        have localShape : CheckpointDecoder.LocalShape program tree view
            (Carrier.activeShell bits continuation
              (Carrier.markedHField leftAudit rightAudit) dispatcher
                seedAudit continuationAudit) := by
          exact ⟨Carrier.markedHField leftAudit rightAudit, dispatcher,
            seedAudit, continuationAudit, .marked leftAudit rightAudit,
            dispatchShape, rfl⟩
        exact .local view (parseBase?_none_of_localShape localShape)
          (CheckpointDecoder.parseLocal?_complete localShape) innerTermOnly
  ·
    intro root decoded inner innerTermOnly
    exact innerTermOnly
  ·
    intro tail decoded bit inner innerTermOnly
    exact .live bit (parseBase?_live_none _ bit _)
      (parseLocal?_live_none program tree bit _)
      (CanonicalStep.parseCell?_live bit _) innerTermOnly
  ·
    intro predecessor decoded bit audit inner innerTermOnly
    exact .tombstone bit
      (parseBase?_tombstone_path_none (continuation := continuation)
        (tree := tree) (bits := bits) (program := program) hadmissible inner
        bit audit)
      (parseLocal?_tombstone_none program tree bit _ audit)
      (CanonicalStep.parseCell?_tombstone bit _ audit) innerTermOnly

/-- Any successful generated carrier decode is accepted by the term-only one. -/
theorem decodeCarrier?_of_decode
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation)
    {term : Term} {decoded : List Bool}
    (h : CarrierDecoder.decode? program tree bits continuation hadmissible term =
      some decoded) :
    CheckpointDecoder.decodeCarrier? program tree term = some decoded := by
  exact CheckpointDecoder.decodeCarrier?_complete program tree
    (pathDecodes_to_termOnly
      hadmissible
      (CarrierDecoder.decode?_sound program tree bits continuation hadmissible h))

/-! ## The final checked layer of one positive bounded job -/

/-- Retarget only the public continuation recovered from a Local shell. -/
def retarget (view : CheckpointDecoder.LocalView program)
    (continuation : Term) : CheckpointDecoder.LocalView program :=
  { view with continuation := continuation }

@[simp] theorem retarget_status
    (view : CheckpointDecoder.LocalView program) (continuation : Term) :
    (retarget view continuation).status = view.status :=
  rfl

@[simp] theorem retarget_route
    (view : CheckpointDecoder.LocalView program) (continuation : Term) :
    (retarget view continuation).route = view.route :=
  rfl

@[simp] theorem retarget_label
    (view : CheckpointDecoder.LocalView program) (continuation : Term) :
    (retarget view continuation).label = view.label :=
  rfl

@[simp] theorem retarget_accumulator
    (view : CheckpointDecoder.LocalView program) (continuation : Term) :
    (retarget view continuation).accumulator = view.accumulator :=
  rfl

@[simp] theorem retarget_seedPayload
    (view : CheckpointDecoder.LocalView program) (continuation : Term) :
    (retarget view continuation).seedPayload = view.seedPayload :=
  rfl

@[simp] theorem retarget_continuation
    (view : CheckpointDecoder.LocalView program) (continuation : Term) :
    (retarget view continuation).continuation = continuation :=
  rfl

/-- Checked transition data is exactly the absorbing CTS successor data. -/
theorem outputData_eq_absorbingStep_data
    (program : CTS.Program) (phase : CTS.Phase program) (input : List Bool) :
    CheckedTransition.outputData program phase input =
      (CTS.absorbingStep program ⟨phase, input⟩).data := by
  cases input with
  | nil => rfl
  | cons bit suffix => cases bit <;> rfl

/-- The selected action label always retains the supplied phase. -/
@[simp]
theorem label_fst
    (program : CTS.Program) (phase : CTS.Phase program) (input : List Bool) :
    (CheckedTransition.label program phase input).1 = phase := by
  cases input <;> rfl

/-- The phase before transition `n+1` is the decoder's phase for horizon `n+1`. -/
theorem iterate_phase_eq_expectedPhase
    (program : CTS.Program) (bits : List Bool) (n : Nat) :
    (CTS.iterate program n (CTS.initial program bits)).phase =
      CheckpointDecoder.expectedPhase program (n + 1) := by
  apply Fin.ext
  simp [CheckpointDecoder.expectedPhase, CTS.zeroPhase]

/-- Facts about the final Local view of a bound-`fuel` job. -/
def ViewSpec
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (fuel : Nat)
    (view : CheckpointDecoder.LocalView program) : Prop :=
  view.label.1 = CheckpointDecoder.expectedPhase program fuel ∧
    CheckpointDecoder.CarrierDecodes program tree view.accumulator
      (CTS.iterate program fuel (CTS.initial program bits)).data ∧
    CheckpointDecoder.markerCompatible view.status
      (CTS.iterate program fuel (CTS.initial program bits)).data = true

/--
Exact final-transition provenance yields a depth-two continuation context that
can be retargeted to any later stage suffix.  The final view already carries
the term-only output and the halt marker dictated by that output.
-/
theorem finalTransition_layer
    {program : CTS.Program} {actions : ActionDispatcher program}
    {bits : List Bool} {continuation result : Term}
    {hadmissible : Carrier.Admissible continuation} {fuel : Nat}
    (final : BoundedJob.FinalTransition program actions bits continuation
      hadmissible fuel result) :
    ∃ context view,
      context.plug continuation = result ∧
      (CanonicalTraversal.contextAddress context).length = 2 ∧
      view.continuation = continuation ∧
      (∀ replacement,
        CheckpointDecoder.LocalShape program actions.tree
          (retarget view replacement) (context.plug replacement)) ∧
      ViewSpec program actions.tree bits fuel view := by
  rcases final with ⟨previousFuel, previousResult, hfuel, checked⟩
  subst fuel
  rcases checked.provenance with
    ⟨snapshot, dispatcher, prepared, dispatch, marking, layer⟩
  have accumulatorDecode :
      CarrierDecoder.decode? program actions.tree bits continuation hadmissible
          (actionAccumulator program
            (CheckedTransition.label program
              (CTS.iterate program previousFuel
                (CTS.initial program bits)).phase
              (CTS.iterate program previousFuel
                (CTS.initial program bits)).data)
            snapshot) =
        some (CheckedTransition.outputData program
          (CTS.iterate program previousFuel
            (CTS.initial program bits)).phase
          (CTS.iterate program previousFuel
            (CTS.initial program bits)).data) := by
    have decoded := CarrierActionDecode.decode_actionAccumulator program
      actions.tree bits continuation hadmissible
      (CheckedTransition.label program
        (CTS.iterate program previousFuel
          (CTS.initial program bits)).phase
        (CTS.iterate program previousFuel
          (CTS.initial program bits)).data)
      prepared.snapshot_decode
    simpa [CheckedTransition.action_output_eq] using decoded
  have publicDecode := decodeCarrier?_of_decode program actions.tree bits
    continuation hadmissible accumulatorDecode
  have publicShape := CheckpointDecoder.decodeCarrier?_sound program
    actions.tree publicDecode
  have outputEq :
      CheckedTransition.outputData program
          (CTS.iterate program previousFuel
            (CTS.initial program bits)).phase
          (CTS.iterate program previousFuel
            (CTS.initial program bits)).data =
        (CTS.iterate program (previousFuel + 1)
          (CTS.initial program bits)).data := by
    rw [CTS.iterate_succ]
    exact outputData_eq_absorbingStep_data program _ _
  rw [outputEq] at publicShape
  have phaseEq :
      (CheckedTransition.label program
        (CTS.iterate program previousFuel
          (CTS.initial program bits)).phase
        (CTS.iterate program previousFuel
          (CTS.initial program bits)).data).1 =
        CheckpointDecoder.expectedPhase program (previousFuel + 1) := by
    rw [label_fst]
    exact iterate_phase_eq_expectedPhase program bits previousFuel
  cases houtput : CheckedTransition.outputData program
      (CTS.iterate program previousFuel
        (CTS.initial program bits)).phase
      (CTS.iterate program previousFuel
        (CTS.initial program bits)).data with
  | nil =>
      have marking' : CheckedTransition.Marking bits continuation snapshot
          dispatcher [] result (CheckedTransition.markerCost [])
            (CheckedTransition.outputStatus []) := by
        simpa only [houtput, CheckedTransition.markerCost_empty,
          CheckedTransition.outputStatus_empty] using marking
      have hiterate :
          (CTS.iterate program (previousFuel + 1)
            (CTS.initial program bits)).data = [] :=
        outputEq.symm.trans houtput
      clear marking layer checked prepared
      cases marking' with
      | marked =>
        let view := CheckpointDecoder.markedCompletedView program
          (actions.route
            (CheckedTransition.label program
              (CTS.iterate program previousFuel
                (CTS.initial program bits)).phase
              (CTS.iterate program previousFuel
                (CTS.initial program bits)).data))
          (CheckedTransition.label program
            (CTS.iterate program previousFuel
              (CTS.initial program bits)).phase
            (CTS.iterate program previousFuel
              (CTS.initial program bits)).data)
          (actionAccumulator program
            (CheckedTransition.label program
              (CTS.iterate program previousFuel
                (CTS.initial program bits)).phase
              (CTS.iterate program previousFuel
                (CTS.initial program bits)).data)
            snapshot)
          bits continuation
        let context := BoundedJob.markedContinuationContext bits snapshot
          dispatcher
        refine ⟨context, view, rfl, rfl, rfl, ?_, ?_⟩
        · intro replacement
          change CheckpointDecoder.LocalShape program actions.tree
            (CheckpointDecoder.markedCompletedView program _ _ _ bits
              replacement)
            (LocalResponse.markedCompleted bits replacement snapshot dispatcher)
          exact CheckpointDecoder.localShape_markedCompleted bits dispatch
        · refine ⟨phaseEq, publicShape, ?_⟩
          rw [hiterate]
          rfl
  | cons outputBit outputSuffix =>
      have marking' : CheckedTransition.Marking bits continuation snapshot
          dispatcher (outputBit :: outputSuffix) result
            (CheckedTransition.markerCost (outputBit :: outputSuffix))
            (CheckedTransition.outputStatus (outputBit :: outputSuffix)) := by
        simpa only [houtput, CheckedTransition.markerCost_cons,
          CheckedTransition.outputStatus_cons] using marking
      have hiterate :
          (CTS.iterate program (previousFuel + 1)
            (CTS.initial program bits)).data = outputBit :: outputSuffix :=
        outputEq.symm.trans houtput
      clear marking layer checked prepared
      cases marking' with
      | fresh =>
        let view := CheckpointDecoder.completedView program
          (actions.route
            (CheckedTransition.label program
              (CTS.iterate program previousFuel
                (CTS.initial program bits)).phase
              (CTS.iterate program previousFuel
                (CTS.initial program bits)).data))
          (CheckedTransition.label program
            (CTS.iterate program previousFuel
              (CTS.initial program bits)).phase
            (CTS.iterate program previousFuel
              (CTS.initial program bits)).data)
          (actionAccumulator program
            (CheckedTransition.label program
              (CTS.iterate program previousFuel
                (CTS.initial program bits)).phase
              (CTS.iterate program previousFuel
                (CTS.initial program bits)).data)
            snapshot)
          bits continuation
        let context := BoundedJob.completedContinuationContext bits snapshot
          dispatcher
        refine ⟨context, view, rfl, rfl, rfl, ?_, ?_⟩
        · intro replacement
          change CheckpointDecoder.LocalShape program actions.tree
            (CheckpointDecoder.completedView program _ _ _ bits replacement)
            (LocalResponse.completed bits replacement snapshot dispatcher)
          exact CheckpointDecoder.localShape_completed bits dispatch
        · refine ⟨phaseEq, publicShape, ?_⟩
          rw [hiterate]
          rfl

/-! ## One stage with exact continuation-chain grammar -/

/-- The terminal view selected by the end of a positive fuel-`n` stage. -/
def terminalView (fuel : Nat) (bits : List Bool) :
    CheckpointDecoder.TerminalView :=
  ⟨fuel, word bits⟩

/-- Add a known number of surrounding Local layers to a completed chain. -/
def addLayers (count : Nat) (chain : CheckpointDecoder.ChainView program) :
    CheckpointDecoder.ChainView program :=
  ⟨chain.layers + count, chain.terminal, chain.last⟩

/-- Exact syntactic indices for `jobs` completed jobs of one fixed stage. -/
def TailSpec
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (fuel : Nat) :
    Nat → CheckpointDecoder.ChainTail program → Prop
  | 0, .terminal terminal => terminal = terminalView fuel bits
  | 0, .completed _ => False
  | _jobs + 1, .terminal _ => False
  | jobs + 1, .completed chain =>
      chain.layers = jobs + 1 ∧
      chain.terminal = terminalView fuel bits ∧
      ViewSpec program tree bits fuel chain.last

namespace TailSpec

/-- Prepending a checked Local increments the independent layer count. -/
theorem prepend
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {fuel jobs : Nat}
    {tail : CheckpointDecoder.ChainTail program}
    {view : CheckpointDecoder.LocalView program}
    (inner : TailSpec program tree bits fuel jobs tail)
    (outer : ViewSpec program tree bits fuel view) :
    TailSpec program tree bits fuel (jobs + 1)
      (CheckpointDecoder.prependLocal view tail) := by
  cases jobs with
  | zero =>
      cases tail with
      | terminal terminal =>
          change terminal = terminalView fuel bits at inner
          subst terminal
          exact ⟨rfl, rfl, outer⟩
      | completed chain =>
          exact inner.elim
  | succ jobs =>
      cases tail with
      | terminal terminal =>
          exact inner.elim
      | completed chain =>
          rcases inner with ⟨hlayers, hterminal, hlast⟩
          change chain.layers + 1 = jobs + 1 + 1 ∧
            chain.terminal = terminalView fuel bits ∧
            ViewSpec program tree bits fuel chain.last
          exact ⟨congrArg (fun count => count + 1) hlayers, hterminal,
            hlast⟩

/-- A positive job count necessarily has a completed-chain view. -/
theorem completed
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {bits : List Bool} {fuel jobs : Nat}
    {tail : CheckpointDecoder.ChainTail program}
    (spec : TailSpec program tree bits fuel (jobs + 1) tail) :
    ∃ chain,
      tail = .completed chain ∧
      chain.layers = jobs + 1 ∧
      chain.terminal = terminalView fuel bits ∧
      ViewSpec program tree bits fuel chain.last := by
  cases tail with
  | terminal terminal => exact spec.elim
  | completed chain => exact ⟨chain, rfl, spec⟩

end TailSpec

/--
An additive strengthening of `StageRun.JobsCompletion`: besides reductions
and the exact continuation context, it carries the executable chain grammar
and a theorem for filling that context with any already-completed inner chain.
-/
structure JobsCompletion
    (program : CTS.Program) (actions : ActionDispatcher program)
    (bits : List Bool) (fuel jobs : Nat)
    (result : Term) (contractions : Nat) (continuationContext : Context)
    (tail : CheckpointDecoder.ChainTail program) : Prop where
  run : StageRun.JobsCompletion program actions bits fuel jobs result
    contractions continuationContext
  chain : CheckpointDecoder.ChainShape program actions.tree result tail
  tailSpec : TailSpec program actions.tree bits fuel jobs tail
  wrapsCompleted :
    ∀ {innerTerm : Term} {innerChain : CheckpointDecoder.ChainView program},
      CheckpointDecoder.ChainShape program actions.tree innerTerm
          (.completed innerChain) →
        CheckpointDecoder.ChainShape program actions.tree
          (continuationContext.plug innerTerm)
          (.completed (addLayers jobs innerChain))

/-- Every finite suffix of a positive stage has exact parsed-chain provenance. -/
theorem completeJobs
    (program : CTS.Program) (actions : ActionDispatcher program)
    (bits : List Bool) (fuel : Nat) (hfuel : fuel ≠ 0) :
    ∀ jobs, ∃ result contractions continuationContext tail,
      JobsCompletion program actions bits fuel jobs result contractions
        continuationContext tail
  | 0 => by
      let environment :=
        environmentCode (compileActions program actions.tree) bits
      let result := Dovetail.clockExit fuel 0 environment
      let terminal := terminalView fuel bits
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
      refine ⟨result, 0, .hole, .terminal terminal, ?_⟩
      refine
        { run := ?_
          chain := terminalShape
          tailSpec := rfl
          wrapsCompleted := ?_ }
      · exact ⟨StepsN.refl result, rfl, rfl⟩
      · intro innerTerm innerChain inner
        simpa [addLayers]
  | jobs + 1 => by
      let environment :=
        environmentCode (compileActions program actions.tree) bits
      let nextExit := Dovetail.clockExit fuel jobs environment
      have hadmissible : Carrier.Admissible nextExit :=
        Dovetail.clockExit_admissible fuel jobs environment
      obtain ⟨jobResult, jobContractions, job⟩ :=
        BoundedJob.complete program actions bits nextExit hadmissible fuel
      obtain ⟨jobContext, view, jobPlug, jobDepth, viewContinuation,
          replacementShape, viewSpec⟩ :=
        finalTransition_layer (job.finalTransition hfuel)
      obtain ⟨laterResult, laterContractions, laterContext, laterTail,
          later⟩ :=
        completeJobs program actions bits fuel hfuel jobs
      have launchSteps : StepsN (2 * fuel + 6)
          (Dovetail.clockExit fuel (jobs + 1) environment)
          (nestedFrames environment nextExit fuel) :=
        Dovetail.launch_expandJob fuel jobs environment
      have firstPart : StepsN ((2 * fuel + 6) + jobContractions)
          (Dovetail.clockExit fuel (jobs + 1) environment) jobResult :=
        StepsN.trans launchSteps job.steps
      have firstToHole : StepsN ((2 * fuel + 6) + jobContractions)
          (Dovetail.clockExit fuel (jobs + 1) environment)
          (jobContext.plug nextExit) := by
        rw [jobPlug]
        exact firstPart
      have laterInside : StepsN laterContractions
          (jobContext.plug nextExit) (jobContext.plug laterResult) :=
        later.run.steps.inContext jobContext
      let result := jobContext.plug laterResult
      let total := ((2 * fuel + 6) + jobContractions) + laterContractions
      let continuationContext := jobContext.comp laterContext
      let outerView := retarget view laterResult
      let tail := CheckpointDecoder.prependLocal outerView laterTail
      have allSteps : StepsN total
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
      have outerSpec : ViewSpec program actions.tree bits fuel outerView := by
        simpa [outerView, ViewSpec] using viewSpec
      have chainShape : CheckpointDecoder.ChainShape program actions.tree result
          tail := by
        dsimp [result, tail, outerView]
        exact CheckpointDecoder.ChainShape.prepend
          (replacementShape laterResult) later.chain
      have tailShape : TailSpec program actions.tree bits fuel (jobs + 1) tail :=
        TailSpec.prepend later.tailSpec outerSpec
      refine ⟨result, total, continuationContext, tail, ?_⟩
      refine
        { run := ⟨allSteps, terminalPlug, depth⟩
          chain := chainShape
          tailSpec := tailShape
          wrapsCompleted := ?_ }
      intro innerTerm innerChain innerShape
      have laterWrapped := later.wrapsCompleted innerShape
      have outerShape := replacementShape (laterContext.plug innerTerm)
      have combined := CheckpointDecoder.ChainShape.prepend outerShape
        laterWrapped
      simpa [continuationContext, addLayers, CheckpointDecoder.prependLocal,
        Context.plug_comp, Nat.add_assoc] using combined

/-- Exact checkpoint grammar at the end of one positive stage. -/
structure StageCompletion
    (program : CTS.Program) (actions : ActionDispatcher program)
    (bits : List Bool) (stage : Nat)
    (result : Term) (contractions : Nat) (continuationContext : Context)
    (chain : CheckpointDecoder.ChainView program) : Prop where
  steps : StepsN contractions
    (Dovetail.stageSource stage
      (environmentCode (compileActions program actions.tree) bits))
    result
  plugsNextStage : continuationContext.plug
      (Dovetail.stageSource (stage + 1)
        (environmentCode (compileActions program actions.tree) bits)) =
    result
  contextDepth :
    (CanonicalTraversal.contextAddress continuationContext).length = 2 * stage
  chainShape : CheckpointDecoder.ChainShape program actions.tree result
    (.completed chain)
  layers : chain.layers = stage
  terminal : chain.terminal = terminalView stage bits
  last : ViewSpec program actions.tree bits stage chain.last
  wrapsCompleted :
    ∀ {innerTerm : Term} {innerChain : CheckpointDecoder.ChainView program},
      CheckpointDecoder.ChainShape program actions.tree innerTerm
          (.completed innerChain) →
        CheckpointDecoder.ChainShape program actions.tree
          (continuationContext.plug innerTerm)
          (.completed (addLayers stage innerChain))

/-- A positive stage completes with its exact term-only checkpoint chain. -/
theorem completeStage
    (program : CTS.Program) (actions : ActionDispatcher program)
    (bits : List Bool) (stage : Nat) (hstage : stage ≠ 0) :
    ∃ result contractions continuationContext chain,
      StageCompletion program actions bits stage result contractions
        continuationContext chain := by
  cases stage with
  | zero => exact (hstage rfl).elim
  | succ n =>
      let stage := n + 1
      let environment :=
        environmentCode (compileActions program actions.tree) bits
      obtain ⟨result, jobContractions, continuationContext, tail, jobs⟩ :=
        completeJobs program actions bits stage (Nat.succ_ne_zero n) stage
      obtain ⟨chain, htail, hlayers, hterminal, hlast⟩ :=
        TailSpec.completed jobs.tailSpec
      subst tail
      have expansion := Dovetail.stage_expand stage environment
      have allSteps := StepsN.trans expansion jobs.run.steps
      refine ⟨result, (stage + 1) + jobContractions, continuationContext,
        chain, ?_⟩
      refine
        { steps := ?_
          plugsNextStage := ?_
          contextDepth := jobs.run.contextDepth
          chainShape := jobs.chain
          layers := hlayers
          terminal := hterminal
          last := hlast
          wrapsCompleted := jobs.wrapsCompleted }
      · simpa [stage, environment] using allSteps
      · simpa [stage, environment] using! jobs.run.plugsTerminal

/-! ## Finite prefixes of the single dovetail -/

/-- Number of completed job shells after stages `1,...,horizon`. -/
def cumulativeLayers : Nat → Nat
  | 0 => 0
  | horizon + 1 => cumulativeLayers horizon + (horizon + 1)

@[simp] theorem cumulativeLayers_zero : cumulativeLayers 0 = 0 :=
  rfl

@[simp] theorem cumulativeLayers_succ (horizon : Nat) :
    cumulativeLayers (horizon + 1) =
      cumulativeLayers horizon + (horizon + 1) :=
  rfl

@[simp] theorem cumulativeLayers_one : cumulativeLayers 1 = 1 :=
  rfl

/-- Stage two already exhibits the layer/horizon distinction: `3 ≠ 2`. -/
@[simp] theorem cumulativeLayers_two : cumulativeLayers 2 = 3 :=
  rfl

/--
The reduction prefix after a positive horizon, strengthened with the complete
term-only checkpoint chain.  `layers` is cumulative and intentionally differs
from `horizon` after stage one.
-/
structure PositivePrefix
    (program : CTS.Program) (actions : ActionDispatcher program)
    (bits : List Bool) (horizon : Nat)
    (result : Term) (contractions : Nat) (activeContext : Context)
    (chain : CheckpointDecoder.ChainView program) : Prop where
  run : DovetailRun.Prefix program actions bits horizon result contractions
    activeContext
  chainShape : CheckpointDecoder.ChainShape program actions.tree result
    (.completed chain)
  layers : chain.layers = cumulativeLayers horizon
  terminal : chain.terminal = terminalView horizon bits
  last : ViewSpec program actions.tree bits horizon chain.last
  wrapsCompleted :
    ∀ {innerTerm : Term} {innerChain : CheckpointDecoder.ChainView program},
      CheckpointDecoder.ChainShape program actions.tree innerTerm
          (.completed innerChain) →
        CheckpointDecoder.ChainShape program actions.tree
          (activeContext.plug innerTerm)
          (.completed (addLayers (cumulativeLayers horizon) innerChain))

/-- Every positive finite dovetail prefix has exact checkpoint provenance. -/
theorem completePositivePrefix
    (program : CTS.Program) (actions : ActionDispatcher program)
    (bits : List Bool) :
    ∀ offset, ∃ result contractions activeContext chain,
      PositivePrefix program actions bits (offset + 1) result contractions
        activeContext chain
  | 0 => by
      let environment :=
        environmentCode (compileActions program actions.tree) bits
      obtain ⟨result, stageContractions, activeContext, chain, stage⟩ :=
        completeStage program actions bits 1 (by decide)
      have staging : StepsN 1
          (generator (compileActions program actions.tree) bits)
          (Dovetail.stageSource 1 environment) := by
        simpa [environment] using!
          Dovetail.generator_to_staging
            (compileActions program actions.tree) bits
      have allSteps : StepsN (1 + stageContractions)
          (generator (compileActions program actions.tree) bits) result :=
        StepsN.trans staging stage.steps
      refine ⟨result, 1 + stageContractions, activeContext, chain, ?_⟩
      refine
        { run := ?_
          chainShape := stage.chainShape
          layers := ?_
          terminal := stage.terminal
          last := stage.last
          wrapsCompleted := ?_ }
      · refine ⟨allSteps, ?_, ?_⟩
        · simpa [environment] using stage.plugsNextStage
        · simpa using stage.contextDepth
      · simpa [cumulativeLayers] using stage.layers
      · intro innerTerm innerChain innerShape
        simpa [cumulativeLayers] using stage.wrapsCompleted innerShape
  | offset + 1 => by
      let horizon := offset + 1
      let stageIndex := horizon + 1
      let environment :=
        environmentCode (compileActions program actions.tree) bits
      obtain ⟨previousResult, previousContractions, previousContext,
          previousChain, previous⟩ :=
        completePositivePrefix program actions bits offset
      obtain ⟨stageResult, stageContractions, stageContext, stageChain,
          stage⟩ :=
        completeStage program actions bits stageIndex (by
          dsimp [stageIndex, horizon]
          exact Nat.succ_ne_zero _)
      have previousToHole : StepsN previousContractions
          (generator (compileActions program actions.tree) bits)
          (previousContext.plug
            (Dovetail.stageSource stageIndex environment)) := by
        rw [previous.run.plugsNextStage]
        exact previous.run.steps
      have stageInside : StepsN stageContractions
          (previousContext.plug
            (Dovetail.stageSource stageIndex environment))
          (previousContext.plug stageResult) :=
        stage.steps.inContext previousContext
      let result := previousContext.plug stageResult
      let contractions := previousContractions + stageContractions
      let activeContext := previousContext.comp stageContext
      let chain := addLayers (cumulativeLayers horizon) stageChain
      have allSteps : StepsN contractions
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
              (horizon + 2) * (horizon + 1) := by
                rw [← Nat.add_mul]
          _ = (horizon + 1) * (horizon + 2) := Nat.mul_comm _ _
      have chainShape : CheckpointDecoder.ChainShape program actions.tree result
          (.completed chain) := by
        dsimp [result, chain]
        exact previous.wrapsCompleted stage.chainShape
      refine ⟨result, contractions, activeContext, chain, ?_⟩
      refine
        { run := ⟨allSteps, ?_, depth⟩
          chainShape := chainShape
          layers := ?_
          terminal := ?_
          last := ?_
          wrapsCompleted := ?_ }
      · simpa [stageIndex, horizon, environment] using nextPlug
      · dsimp [chain, addLayers]
        rw [stage.layers]
        change stageIndex + cumulativeLayers horizon =
          cumulativeLayers (horizon + 1)
        rw [cumulativeLayers_succ]
        dsimp [stageIndex]
        exact Nat.add_comm _ _
      · simpa [chain, addLayers, stageIndex, horizon] using stage.terminal
      · simpa [chain, addLayers, stageIndex, horizon] using stage.last
      · intro innerTerm innerChain innerShape
        have stageWrapped := stage.wrapsCompleted innerShape
        have allWrapped := previous.wrapsCompleted stageWrapped
        simpa [activeContext, addLayers, Context.plug_comp, cumulativeLayers,
          stageIndex, horizon, Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
          using allWrapped

/-! ## Exact checkpoint-decoder results -/

@[simp]
theorem headArity_generator (actions : Term) (bits : List Bool) :
    (generator actions bits).headArity = 4 :=
  rfl

/-- A nonempty completed chain cannot be mistaken for the time-zero generator. -/
theorem parseGenerator?_none_of_completedChain
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {chain : CheckpointDecoder.ChainView program}
    (shape : CheckpointDecoder.ChainShape program tree term
      (.completed chain)) :
    CheckpointDecoder.parseGenerator? (compileActions program tree) term =
      none := by
  have parsedChain := CheckpointDecoder.parseChain?_complete shape
  cases hlocal : CheckpointDecoder.parseLocal? program tree term with
  | none =>
      unfold CheckpointDecoder.parseChain? at parsedChain
      rw [CheckpointDecoder.parseChainTail?, hlocal] at parsedChain
      cases hterminal : CheckpointDecoder.parseTerminal?
          (compileActions program tree) term <;>
        simp [hterminal] at parsedChain
  | some view =>
      cases hgenerator : CheckpointDecoder.parseGenerator?
          (compileActions program tree) term with
      | none => rfl
      | some bits =>
          have sourceEq := CheckpointDecoder.parseGenerator?_sound hgenerator
          rcases CheckpointDecoder.parseLocal?_headArity hlocal with
            hfive | hsix
          · rw [sourceEq, headArity_generator] at hfive
            cases hfive
          · rw [sourceEq, headArity_generator] at hsix
            cases hsix

namespace PositivePrefix

theorem final_phase
    {program : CTS.Program} {actions : ActionDispatcher program}
    {bits : List Bool} {horizon : Nat}
    {result : Term} {contractions : Nat} {activeContext : Context}
    {chain : CheckpointDecoder.ChainView program}
    (certificate : PositivePrefix program actions bits horizon result contractions
      activeContext chain) :
    chain.last.label.1 = CheckpointDecoder.expectedPhase program horizon :=
  certificate.last.1

/-- Numeric form of the final-job phase required by the checkpoint parser. -/
theorem final_phase_val
    {program : CTS.Program} {actions : ActionDispatcher program}
    {bits : List Bool} {horizon : Nat}
    {result : Term} {contractions : Nat} {activeContext : Context}
    {chain : CheckpointDecoder.ChainView program}
    (certificate : PositivePrefix program actions bits horizon result contractions
      activeContext chain) :
    chain.last.label.1.val = (horizon - 1) % program.period := by
  have phaseEq := congrArg Fin.val certificate.final_phase
  exact phaseEq

/-- Concrete regression: a stage-two checkpoint has three surrounding jobs. -/
theorem layers_at_two
    {program : CTS.Program} {actions : ActionDispatcher program}
    {bits : List Bool}
    {result : Term} {contractions : Nat} {activeContext : Context}
    {chain : CheckpointDecoder.ChainView program}
    (certificate : PositivePrefix program actions bits 2 result contractions
      activeContext chain) :
    chain.layers = 3 := by
  simpa using certificate.layers

theorem final_queue
    {program : CTS.Program} {actions : ActionDispatcher program}
    {bits : List Bool} {horizon : Nat}
    {result : Term} {contractions : Nat} {activeContext : Context}
    {chain : CheckpointDecoder.ChainView program}
    (certificate : PositivePrefix program actions bits horizon result contractions
      activeContext chain) :
    CheckpointDecoder.CarrierDecodes program actions.tree
      chain.last.accumulator
      (CTS.iterate program horizon (CTS.initial program bits)).data :=
  certificate.last.2.1

theorem marker_compatible
    {program : CTS.Program} {actions : ActionDispatcher program}
    {bits : List Bool} {horizon : Nat}
    {result : Term} {contractions : Nat} {activeContext : Context}
    {chain : CheckpointDecoder.ChainView program}
    (certificate : PositivePrefix program actions bits horizon result contractions
      activeContext chain) :
    CheckpointDecoder.markerCompatible chain.last.status
      (CTS.iterate program horizon (CTS.initial program bits)).data = true :=
  certificate.last.2.2

/-- A completed positive prefix satisfies the decoder's declarative shape. -/
theorem positiveShape
    {program : CTS.Program} {actions : ActionDispatcher program}
    {bits : List Bool} {horizon : Nat}
    {result : Term} {contractions : Nat} {activeContext : Context}
    {chain : CheckpointDecoder.ChainView program}
    (certificate : PositivePrefix program actions bits horizon result contractions
      activeContext chain) :
    CheckpointDecoder.PositiveShape program actions.tree
      ⟨horizon, chain.last.route, chain.last.label,
        (CTS.iterate program horizon (CTS.initial program bits)).data⟩
      result := by
  refine ⟨chain, certificate.chainShape, ?_, certificate.final_queue,
    certificate.marker_compatible, ?_⟩
  · rw [certificate.terminal]
    exact certificate.final_phase
  · rw [certificate.terminal]
    simp [terminalView]

/-- The executable bare-term decoder returns the exact positive CTS output. -/
theorem decode
    {program : CTS.Program} {actions : ActionDispatcher program}
    {bits : List Bool} {horizon : Nat}
    {result : Term} {contractions : Nat} {activeContext : Context}
    {chain : CheckpointDecoder.ChainView program}
    (certificate : PositivePrefix program actions bits horizon result contractions
      activeContext chain) :
    CheckpointDecoder.decode? program actions.tree result =
      some (.positive
        ⟨horizon, chain.last.route, chain.last.label,
          (CTS.iterate program horizon (CTS.initial program bits)).data⟩) := by
  rw [CheckpointDecoder.decode?,
    parseGenerator?_none_of_completedChain certificate.chainShape,
    CheckpointDecoder.parsePositive?_complete certificate.positiveShape]
  rfl

end PositivePrefix

/-- The term-only decoder recognizes the unreduced horizon-zero generator. -/
@[simp]
theorem decode?_timeZero
    (program : CTS.Program) (actions : ActionDispatcher program)
    (bits : List Bool) :
    CheckpointDecoder.decode? program actions.tree
        (generator (compileActions program actions.tree) bits) =
      some (.zero bits) :=
  CheckpointDecoder.decode?_generator program actions.tree bits

/--
Every positive horizon occurs at a finite contraction index and has the exact
bare-term decoder result.  The returned chain exposes its independent
cumulative layer count through `PositivePrefix.layers`.
-/
theorem exists_decoded_positivePrefix
    (program : CTS.Program) (actions : ActionDispatcher program)
    (bits : List Bool) (offset : Nat) :
    ∃ result contractions activeContext chain,
      PositivePrefix program actions bits (offset + 1) result contractions
          activeContext chain ∧
      CheckpointDecoder.decode? program actions.tree result =
        some (.positive
          ⟨offset + 1, chain.last.route, chain.last.label,
            (CTS.iterate program (offset + 1)
              (CTS.initial program bits)).data⟩) := by
  obtain ⟨result, contractions, activeContext, chain, certificate⟩ :=
    completePositivePrefix program actions bits offset
  exact ⟨result, contractions, activeContext, chain, certificate,
    certificate.decode⟩

end CheckpointRun

end PureSFormal.PureS
