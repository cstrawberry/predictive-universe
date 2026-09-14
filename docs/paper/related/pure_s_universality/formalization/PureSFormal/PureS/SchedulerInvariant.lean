import PureSFormal.PureS.CheckpointExclusion
import PureSFormal.PureS.ExactCheckpointRun
import PureSFormal.PureS.SchedulerControl
import PureSFormal.PureS.SchedulerExecution
import PureSFormal.PureS.SchedulerDescent

/-!
# Reachable scheduler invariants

This module states the scheduler invariant over the actual finite controller,
its one occurrence-tree cursor, and the seven public mode families.  The
logical witness is deliberately separate from runtime control: it records the
CTS phase, the finite scan-register interpretation, the exact public decoder
shape of the erased term, and (when the current work contains an active
carrier) the recursive same-snapshot audit invariant.

The final section proves the concrete encoder state, its exact checkpoint
classification, and the first productive controller segment.  It also gives
the one-microstep safety lemma used by the simultaneous mode induction: a
nonrejecting row whose primitive is defined cannot enter the rejecting sink.
-/

namespace PureSFormal.PureS

namespace SchedulerInvariant

open FiniteController SchedulerControl

abbrev Configuration (program : CTS.Program)
    (dispatcher : ActionDispatcher program) :=
  FiniteController.Configuration (SchedulerControl.Control program dispatcher)

/-! ## Register interpretation -/

/-- The first live bit encountered by an upward scan. -/
def scanBit? : List Bool → Option Bool
  | [] => none
  | bit :: _ => some bit

/-- Whether an upward scan has encountered a live cell. -/
def scanSeen : List Bool → Bool
  | [] => false
  | _ :: _ => true

/-- Whether a scan contains a live cell after its first one. -/
def scanTail : List Bool → Bool
  | [] | [_] => false
  | _ :: _ :: _ => true

/--
Logical meaning of the finite scheduler register bank.  `scanned` is proof
data only; the runtime bank still stores just one optional bit and two
Booleans.  The `emptyMode` equation also prevents normal and absorbing-empty
returns from being conflated.
-/
structure RegistersCoherent
    (registers : Registers program)
    (phase : CTS.Phase program)
    (scanned : List Bool) (emptyMode : Bool) : Prop where
  phase_eq : registers.phase = phase
  bit_eq : registers.bit = scanBit? scanned
  seen_eq : registers.seen = scanSeen scanned
  tail_eq : registers.tail = scanTail scanned
  empty_eq : registers.empty = emptyMode

namespace RegistersCoherent

theorem initial (program : CTS.Program) :
    RegistersCoherent (Registers.initial program)
      (CTS.zeroPhase program) [] false := by
  exact ⟨rfl, rfl, rfl, rfl, rfl⟩

theorem clearScan
    {registers : Registers program} {phase : CTS.Phase program}
    {scanned : List Bool} {emptyMode : Bool}
    (h : RegistersCoherent registers phase scanned emptyMode) :
    RegistersCoherent registers.clearScan phase [] emptyMode := by
  exact ⟨h.phase_eq, rfl, rfl, rfl, h.empty_eq⟩

theorem advance
    {registers : Registers program} {phase : CTS.Phase program}
    {scanned : List Bool} {emptyMode : Bool}
    (h : RegistersCoherent registers phase scanned emptyMode) :
    RegistersCoherent registers.advance (CTS.nextPhase program phase) [] false := by
  exact ⟨congrArg (CTS.nextPhase program) h.phase_eq, rfl, rfl, rfl, rfl⟩

theorem advanceEmpty
    {registers : Registers program} {phase : CTS.Phase program}
    {scanned : List Bool} {emptyMode : Bool}
    (h : RegistersCoherent registers phase scanned emptyMode) :
    RegistersCoherent registers.advanceEmpty
      (CTS.nextPhase program phase) [] true := by
  exact ⟨congrArg (CTS.nextPhase program) h.phase_eq, rfl, rfl, rfl, rfl⟩

end RegistersCoherent

/-! ## Exact carrier occurrences -/

/--
An exact strong-audit carrier occurring in the bare term.  The context and
the whole root are logical witnesses; no address or snapshot is added to the
finite controller state.
-/
inductive AuditedOccurrence
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Prop where
  | intro
      (bits : List Bool) (continuation root : Term) (outer : Context)
      (invariant : ReachableAudit.Holds program tree bits continuation root)
      (source_eq : term = outer.plug root) :
      AuditedOccurrence program tree term

namespace AuditedOccurrence

/-- The exact initial Base is a strong-audit occurrence at the context hole. -/
theorem initialBase
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (bits : List Bool) (continuation : Term) :
    AuditedOccurrence program tree
      (baseCarrier
        (environmentCode (compileActions program tree) bits)
        continuation) := by
  exact .intro bits continuation _ .hole
    (ReachableAudit.Holds.initial program tree bits continuation) rfl

/-- Every audited occurrence exposes an exact registered whole carrier. -/
theorem rootPath
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)} {term : Term}
    (h : AuditedOccurrence program tree term) :
    ∃ bits : List Bool, ∃ continuation root : Term, ∃ outer : Context,
      RootPath.Root program tree bits continuation root ∧
        term = outer.plug root := by
  cases h with
  | intro bits continuation root outer invariant source_eq =>
      exact ⟨bits, continuation, root, outer, invariant.toRoot, source_eq⟩

/-- Admissibility gives the registered arity-five/six whole-root audit. -/
theorem wholeCarrier
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)} {term : Term}
    (h : AuditedOccurrence program tree term) :
    ∃ continuation root : Term, ∃ outer : Context,
      term = outer.plug root ∧
      (Carrier.Admissible continuation →
        PendingFrame.WholeCarrierAudit root) := by
  cases h with
  | intro _ continuation root outer invariant source_eq =>
      exact ⟨continuation, root, outer, source_eq,
        fun hadmissible => invariant.wholeCarrierAudit hadmissible⟩

end AuditedOccurrence

/-! ## Seven-family semantic cases -/

/-- Apply a fixed number of literal stage-clock wrappers to one endpoint. -/
def clockWrap (stage : Nat) : Nat → Term → Term
  | 0, endpoint => endpoint
  | wrappers + 1, endpoint =>
      .app (.app .s (C stage)) (clockWrap stage wrappers endpoint)

/--
An unfinished clock expansion with `wrappers` already exposed and a residual
carrier pair at its unique active endpoint.
-/
def clockGrowthCore (stage wrappers remaining : Nat) : Term :=
  clockWrap stage wrappers (.app (C remaining) (C stage))

@[simp]
theorem clockWrap_zero (stage : Nat) (endpoint : Term) :
    clockWrap stage 0 endpoint = endpoint :=
  rfl

@[simp]
theorem clockWrap_succ (stage wrappers : Nat) (endpoint : Term) :
    clockWrap stage (wrappers + 1) endpoint =
      .app (.app .s (C stage)) (clockWrap stage wrappers endpoint) :=
  rfl

/-- Identical wrappers commute with adding one wrapper at the endpoint. -/
theorem clockWrap_push
    (stage wrappers : Nat) (endpoint : Term) :
    clockWrap stage wrappers (.app (.app .s (C stage)) endpoint) =
      clockWrap stage (wrappers + 1) endpoint := by
  induction wrappers with
  | zero => rfl
  | succ wrappers ih =>
      change
        Term.app (Term.app Term.s (C stage))
            (clockWrap stage wrappers
              (Term.app (Term.app Term.s (C stage)) endpoint)) =
          Term.app (Term.app Term.s (C stage))
            (clockWrap stage (wrappers + 1) endpoint)
      exact congrArg
        (fun term => Term.app (Term.app Term.s (C stage)) term) ih

@[simp]
theorem headArity_clockGrowthCore_succ
    (stage wrappers remaining : Nat) :
    (clockGrowthCore stage (wrappers + 1) remaining).headArity = 2 := by
  simp [clockGrowthCore, clockWrap, Term.headArity_app_eq]

/-- One positive carrier contraction advances the unfinished clock spine. -/
theorem clockGrowthCore_step
    (stage wrappers remaining : Nat) :
    Step (clockGrowthCore stage wrappers (remaining + 1))
      (clockGrowthCore stage (wrappers + 1) remaining) := by
  have rootStep : Step (.app (C (remaining + 1)) (C stage))
      (.app (.app .s (C stage)) (.app (C remaining) (C stage))) := by
    simpa [C, b, Term.redex, Term.contractum] using
      Step.root (.s : Term) (C remaining) (C stage)
  have wrapped : Step
      (clockWrap stage wrappers (.app (C (remaining + 1)) (C stage)))
      (clockWrap stage wrappers
        (.app (.app .s (C stage)) (.app (C remaining) (C stage)))) := by
    induction wrappers with
    | zero => exact rootStep
    | succ wrappers ih =>
        exact Step.appRight (.app .s (C stage)) ih
  simpa only [clockGrowthCore, clockWrap_push] using wrapped

/-- The clock zipper stack rebuilds to the corresponding literal wrapper spine. -/
theorem rebuild_wrapperParents
    (stage wrappers : Nat) (endpoint : Term)
    (parents : List ParentFrame) :
    Cursor.rebuild (PrimitiveClock.wrapperParents stage wrappers parents)
        endpoint =
      Cursor.rebuild parents (clockWrap stage wrappers endpoint) := by
  induction wrappers generalizing parents with
  | zero => rfl
  | succ wrappers ih =>
      rw [PrimitiveClock.wrapperParents]
      rw [ih]
      rfl

/-- Pushing the next identical wrapper frame increments the wrapper count. -/
theorem wrapperParents_push
    (stage wrappers : Nat) (parents : List ParentFrame) :
    .right (.app .s (C stage)) ::
        PrimitiveClock.wrapperParents stage wrappers parents =
      PrimitiveClock.wrapperParents stage (wrappers + 1) parents := by
  induction wrappers generalizing parents with
  | zero => rfl
  | succ wrappers ih =>
      change
        .right (.app .s (C stage)) ::
            PrimitiveClock.wrapperParents stage wrappers
              (.right (.app .s (C stage)) :: parents) =
          PrimitiveClock.wrapperParents stage wrappers
            (.right (.app .s (C stage)) ::
              .right (.app .s (C stage)) :: parents)
      exact ih (.right (.app .s (C stage)) :: parents)

/-- Exact zipper contraction at the unique residual positive clock pair. -/
theorem rdx_clockGrowth
    (stage wrappers remaining : Nat) (parents : List ParentFrame) :
    (⟨.app (C (remaining + 1)) (C stage),
        PrimitiveClock.wrapperParents stage wrappers parents⟩ : Cursor).rdx? =
      some ⟨.app (.app .s (C stage))
          (.app (C remaining) (C stage)),
        PrimitiveClock.wrapperParents stage wrappers parents⟩ := by
  rfl

/-- Erasure before the clock contraction is the exact unfinished spine. -/
theorem erase_clockGrowth_before
    (stage wrappers remaining : Nat) (parents : List ParentFrame) :
    (⟨.app (C (remaining + 1)) (C stage),
        PrimitiveClock.wrapperParents stage wrappers parents⟩ : Cursor).erase =
      Cursor.rebuild parents
        (clockGrowthCore stage wrappers (remaining + 1)) := by
  exact rebuild_wrapperParents stage wrappers _ parents

/-- Erasure after the clock contraction has exactly one additional wrapper. -/
theorem erase_clockGrowth_after
    (stage wrappers remaining : Nat) (parents : List ParentFrame) :
    (⟨.app (.app .s (C stage)) (.app (C remaining) (C stage)),
        PrimitiveClock.wrapperParents stage wrappers parents⟩ : Cursor).erase =
      Cursor.rebuild parents
        (clockGrowthCore stage (wrappers + 1) remaining) := by
  rw [show
    (⟨.app (.app .s (C stage)) (.app (C remaining) (C stage)),
      PrimitiveClock.wrapperParents stage wrappers parents⟩ : Cursor).erase =
        Cursor.rebuild
          (PrimitiveClock.wrapperParents stage wrappers parents)
          (.app (.app .s (C stage))
            (.app (C remaining) (C stage))) by rfl]
  rw [rebuild_wrapperParents, clockWrap_push]
  rfl

/--
Construction-specific witnesses for silent sampled states.  The public
checkpoint table covers its named endpoints; the clock-growth constructor
covers the genuine intermediate terms created one contraction at a time.
Further controller families can add equally explicit constructors without
weakening the decoder statement to an unstructured assertion.
-/
inductive SilentState
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) :
    SchedulerControl.Family → Term → Prop where
  | «public»
      {family : SchedulerControl.Family} {term : Term}
      (shape : CheckpointExclusion.Noncheckpoint program tree family term) :
      SilentState program tree family term
  | endpointFailure
      {family : SchedulerControl.Family} {term endpoint : Term} {layers : Nat}
      (outer : CheckpointExclusion.CompletedPrefix
        program tree term endpoint layers)
      (failure : CheckpointExclusion.EndpointFailure program tree endpoint) :
      SilentState program tree family term
  | clockGrowth
      {term endpoint : Term} {layers : Nat}
      (outer : CheckpointExclusion.CompletedPrefix
        program tree term endpoint layers)
      (stage wrappers remaining : Nat) (seedPayload : Term)
      (endpoint_eq : endpoint =
        .app (clockGrowthCore stage (wrappers + 1) remaining)
          (CheckpointDecoder.openEnvironment
            (compileActions program tree) seedPayload)) :
      SilentState program tree .clock term
  | clockCompleteWrapped
      {term endpoint : Term} {layers : Nat}
      (outer : CheckpointExclusion.CompletedPrefix
        program tree term endpoint layers)
      (stage wrappers : Nat) (seedPayload : Term)
      (endpoint_eq : endpoint =
        .app (clockWrap stage (wrappers + 1) (clockBase stage))
          (CheckpointDecoder.openEnvironment
            (compileActions program tree) seedPayload)) :
      SilentState program tree .clock term

namespace SilentState

/-- Every construction-specific silent state is rejected by the decoder. -/
theorem decode?_none
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {family : SchedulerControl.Family} {term : Term}
    (h : SilentState program tree family term) :
    CheckpointDecoder.decode? program tree term = none := by
  cases h with
  | «public» shape => exact shape.decode?_none
  | endpointFailure outer failure => exact outer.decode?_none failure
  | clockGrowth outer stage wrappers remaining seedPayload endpoint_eq =>
      apply outer.decode?_none
      apply CheckpointExclusion.EndpointFailure.ofHeadArity
      all_goals
        rw [endpoint_eq]
        simp [clockGrowthCore, Term.headArity_app_eq]
  | clockCompleteWrapped outer stage wrappers seedPayload endpoint_eq =>
      apply outer.decode?_none
      apply CheckpointExclusion.EndpointFailure.ofHeadArity
      all_goals
        rw [endpoint_eq]
        simp [clockWrap, Term.headArity_app_eq]

end SilentState

/-- A semantic silent-state witness paired with its direct decoder equation. -/
structure SilentEvidence
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (family : SchedulerControl.Family) (term : Term) : Prop where
  state : SilentState program tree family term
  rejected : CheckpointDecoder.decode? program tree term = none

namespace SilentEvidence

theorem ofState
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {family : SchedulerControl.Family} {term : Term}
    (state : SilentState program tree family term) :
    SilentEvidence program tree family term :=
  ⟨state, state.decode?_none⟩

theorem ofPublic
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {family : SchedulerControl.Family} {term : Term}
    (shape : CheckpointExclusion.Noncheckpoint program tree family term) :
    SilentEvidence program tree family term :=
  ofState (.public shape)

/-- A directly verified endpoint failure is a silent state at the trivial prefix. -/
theorem ofEndpointFailure
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {family : SchedulerControl.Family} {term : Term}
    (failure : CheckpointExclusion.EndpointFailure program tree term) :
    SilentEvidence program tree family term :=
  ofState (.endpointFailure (.here term) failure)

end SilentEvidence

/-- Decoder-facing evidence, including genuine intermediate silent states. -/
inductive DecoderEvidence
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) :
    SchedulerControl.Family → Term → Prop where
  | «public»
      {family : SchedulerControl.Family} {term : Term}
      (shape : CheckpointExclusion.FamilyShape program tree family term) :
      DecoderEvidence program tree family term
  | silent
      {family : SchedulerControl.Family} {term : Term}
      (evidence : SilentEvidence program tree family term) :
      DecoderEvidence program tree family term

namespace DecoderEvidence

/-- Exact acceptance interface for both public and intermediate states. -/
theorem acceptsOnly
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {family : SchedulerControl.Family} {term : Term}
    (h : DecoderEvidence program tree family term)
    (result : CheckpointDecoder.Result program) :
    CheckpointDecoder.decode? program tree term = some result ↔
      CheckpointExclusion.Accepted program tree family term result := by
  cases h with
  | «public» shape => exact shape.acceptsOnly result
  | silent evidence =>
      constructor
      · intro decoded
        rw [evidence.rejected] at decoded
        contradiction
      · intro accepted
        have decoded := accepted.decode?
        rw [evidence.rejected] at decoded
        contradiction

end DecoderEvidence

/--
Construction-specific evidence attached to each public family.  Clock and
fuel cases expose their literal outer syntax.  DOWN/UP cases additionally
carry the recursive reachable-audit witness.  FRAME/RETURN/EMPTY retain the
same witness for the carrier from which the current Local response was
created.  This relation contains all seven families explicitly.
-/
inductive FamilyEvidence
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) :
    SchedulerControl.Family → Term → Prop where
  | clock
      {term : Term}
      (decoder : DecoderEvidence program tree .clock term) :
      FamilyEvidence program tree .clock term
  | fuel
      {term : Term}
      (decoder : DecoderEvidence program tree .fuel term) :
      FamilyEvidence program tree .fuel term
  | down
      {term : Term}
      (decoder : DecoderEvidence program tree .down term)
      (audit : AuditedOccurrence program tree term) :
      FamilyEvidence program tree .down term
  | up
      {term : Term}
      (decoder : DecoderEvidence program tree .up term)
      (audit : AuditedOccurrence program tree term) :
      FamilyEvidence program tree .up term
  | frameDispatch
      {term : Term}
      (decoder : DecoderEvidence program tree .frameDispatch term)
      (audit : AuditedOccurrence program tree term) :
      FamilyEvidence program tree .frameDispatch term
  | «return»
      {term : Term}
      (decoder : DecoderEvidence program tree .return term)
      (audit : AuditedOccurrence program tree term) :
      FamilyEvidence program tree .return term
  | empty
      {term : Term}
      (decoder : DecoderEvidence program tree .empty term)
      (audit : AuditedOccurrence program tree term) :
      FamilyEvidence program tree .empty term

namespace FamilyEvidence

/-- Forget the stronger audit layer and retain the exact decoder interface. -/
theorem decoder
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {family : SchedulerControl.Family} {term : Term}
    (h : FamilyEvidence program tree family term) :
    DecoderEvidence program tree family term := by
  cases h with
  | clock decoder => exact decoder
  | fuel decoder => exact decoder
  | down decoder audit => exact decoder
  | up decoder audit => exact decoder
  | frameDispatch decoder audit => exact decoder
  | «return» decoder audit => exact decoder
  | empty decoder audit => exact decoder

end FamilyEvidence

/-- Extract the register bank without inspecting any term or cursor field. -/
def controlRegisters : SchedulerControl.Control program dispatcher →
    SchedulerControl.Registers program
  | .macro _ registers => registers
  | .script _ _ registers => registers
  | .probe _ _ registers => registers

/-- A primitive command is safe at a cursor when its move is defined. -/
def CommandSafe
    (cursor : Cursor) :
    FiniteController.Command (SchedulerControl.Control program dispatcher) → Prop
  | .stay _ => True
  | .reject => False
  | .exec primitive _ => ∃ after, primitive.exec cursor = some after

/-! ## Exact cursor and subordinate-PC position -/

/-- Exact zipper representation of a cursor under a proof-level context. -/
structure CursorAtContext (cursor : Cursor) (context : Context)
    (focus : Term) : Prop where
  focus_eq : cursor.focus = focus
  parents_eq : cursor.parents = ContextCursor.frames context focus []

namespace CursorAtContext

/-- Erasure of the exact zipper is precisely plugging its focus in the context. -/
theorem erase_eq
    {cursor : Cursor} {context : Context} {focus : Term}
    (h : CursorAtContext cursor context focus) :
    cursor.erase = context.plug focus := by
  have rebuild_frames : ∀ (inner : Context) (term : Term)
      (parents : List ParentFrame),
      Cursor.rebuild (ContextCursor.frames inner term parents) term =
        Cursor.rebuild parents (inner.plug term) := by
    intro inner
    induction inner with
    | hole => intro term parents; rfl
    | appLeft inner argument ih =>
        intro term parents
        exact ih term (.left argument :: parents)
    | appRight function inner ih =>
        intro term parents
        exact ih term (.right function :: parents)
  rcases cursor with ⟨cursorFocus, parents⟩
  cases h with
  | mk focus_eq parents_eq =>
      simp only at focus_eq parents_eq
      change Cursor.rebuild parents cursorFocus = _
      rw [focus_eq, parents_eq]
      exact rebuild_frames context focus []

end CursorAtContext

/-- The one-hole context represented by an arbitrary outer zipper stack. -/
def contextOfParents : List ParentFrame → Context
  | [] => .hole
  | .left argument :: parents =>
      (contextOfParents parents).comp (.appLeft .hole argument)
  | .right function :: parents =>
      (contextOfParents parents).comp (.appRight function .hole)

/-- Plugging the represented outer context agrees with cursor rebuilding. -/
theorem contextOfParents_plug : ∀ (parents : List ParentFrame) (focus : Term),
    (contextOfParents parents).plug focus = Cursor.rebuild parents focus
  | [], focus => rfl
  | .left argument :: parents, focus => by
      rw [contextOfParents, Context.plug_comp]
      change (contextOfParents parents).plug (.app focus argument) =
        Cursor.rebuild parents (.app focus argument)
      exact contextOfParents_plug parents (.app focus argument)
  | .right function :: parents, focus => by
      rw [contextOfParents, Context.plug_comp]
      change (contextOfParents parents).plug (.app function focus) =
        Cursor.rebuild parents (.app function focus)
      exact contextOfParents_plug parents (.app function focus)

/-- Context frames recover exactly the represented parent stack. -/
theorem contextOfParents_frames : ∀ (parents : List ParentFrame) (focus : Term),
    ContextCursor.frames (contextOfParents parents) focus [] = parents
  | [], focus => rfl
  | .left argument :: parents, focus => by
      rw [contextOfParents, SchedulerDescent.contextFrames_comp]
      change .left argument ::
          ContextCursor.frames (contextOfParents parents)
            (.app focus argument) [] = .left argument :: parents
      rw [contextOfParents_frames parents (.app focus argument)]
  | .right function :: parents, focus => by
      rw [contextOfParents, SchedulerDescent.contextFrames_comp]
      change .right function ::
          ContextCursor.frames (contextOfParents parents)
            (.app function focus) [] = .right function :: parents
      rw [contextOfParents_frames parents (.app function focus)]

/-- Every concrete zipper has an exact proof-level one-hole context. -/
theorem cursorAtContextOfParents (focus : Term) (parents : List ParentFrame) :
    CursorAtContext ⟨focus, parents⟩ (contextOfParents parents) focus :=
  ⟨rfl, (contextOfParents_frames parents focus).symm⟩

/-- Rebuilding the zipper at a context hole restores the context root. -/
theorem rebuild_contextFrames
    (context : Context) (focus : Term) (parents : List ParentFrame) :
    Cursor.rebuild (ContextCursor.frames context focus parents) focus =
      Cursor.rebuild parents (context.plug focus) := by
  induction context generalizing parents with
  | hole => rfl
  | appLeft context argument ih =>
      exact ih (.left argument :: parents)
  | appRight function context ih =>
      exact ih (.right function :: parents)

/--
Exact location evidence for every controller form.  Script PCs are tied to
the successful prefix and suffix of their literal fixed script.  Probe PCs
are tied to an actual prefix and suffix of the compiled origin-restoring
probe table.  Thus no arbitrary PC/cursor pair can enter the invariant.
-/
inductive ControlPosition
    (program : CTS.Program) (dispatcher : ActionDispatcher program) :
    SchedulerControl.Control program dispatcher → Cursor → Prop where
  | macro
      {mode : SchedulerControl.Macro program dispatcher}
      {registers : SchedulerControl.Registers program}
      {cursor : Cursor} {context : Context} {focus : Term}
      (located : CursorAtContext cursor context focus)
      (safe : CommandSafe cursor
        (SchedulerControl.transition program dispatcher (.macro mode registers)
          (Probe.observeNode cursor) (Probe.observeIncoming cursor))) :
      ControlPosition program dispatcher (.macro mode registers) cursor
  | script
      {job : SchedulerControl.ScriptJob program}
      {pc : SchedulerControl.ScriptPC program dispatcher job}
      {registers : SchedulerControl.Registers program}
      {cursor origin endpoint : Cursor}
      (prefixRun : Script.run
          (List.take pc.val (SchedulerControl.jobScript program dispatcher job))
          origin = some cursor)
      (suffixRun : Script.run
          (List.drop pc.val (SchedulerControl.jobScript program dispatcher job))
          cursor = some endpoint)
      (safe : CommandSafe cursor
        (SchedulerControl.transition program dispatcher (.script job pc registers)
          (Probe.observeNode cursor) (Probe.observeIncoming cursor))) :
      ControlPosition program dispatcher (.script job pc registers) cursor
  | probe
      {kind : SchedulerControl.ProbeKind program dispatcher}
      {pc : SchedulerControl.ProbePC program dispatcher kind}
      {registers : SchedulerControl.Registers program}
      {cursor origin : Cursor} {answer : Bool}
      {prefixTicks suffixTicks : Nat}
      (before :
        (SchedulerControl.compiledProbeTable program dispatcher kind).run prefixTicks
          (.running (SchedulerControl.probeControl program dispatcher kind)
            origin) = .running pc.val cursor)
      (after :
        (SchedulerControl.compiledProbeTable program dispatcher kind).run suffixTicks
          (.running pc.val cursor) = .done answer origin)
      (safe : CommandSafe cursor
        (SchedulerControl.transition program dispatcher (.probe kind pc registers)
          (Probe.observeNode cursor) (Probe.observeIncoming cursor))) :
      ControlPosition program dispatcher (.probe kind pc registers) cursor

namespace ControlPosition

/-- Every exact subordinate-position witness excludes reject and failed moves. -/
theorem commandSafe
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {control : SchedulerControl.Control program dispatcher} {cursor : Cursor}
    (h : ControlPosition program dispatcher control cursor) :
    CommandSafe cursor
      (SchedulerControl.transition program dispatcher control
        (Probe.observeNode cursor) (Probe.observeIncoming cursor)) := by
  cases h with
  | «macro» located safe => exact safe
  | script prefixRun suffixRun safe => exact safe
  | probe before after safe => exact safe

end ControlPosition

/--
The simultaneous reachable-mode invariant at an actual controller
configuration.  It ties the runtime family and register bank to the erased
cursor term and to the decoder-facing seven-family syntax.
-/
inductive Holds
    (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (configuration : Configuration program dispatcher) : Prop where
  | intro
      (control : SchedulerControl.Control program dispatcher)
      (control_eq : configuration.control = some control)
      (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
      (registers : RegistersCoherent (controlRegisters control)
        phase scanned emptyMode)
      (position : ControlPosition program dispatcher control configuration.cursor)
      (evidence : FamilyEvidence program dispatcher.tree control.family
        configuration.cursor.erase) :
      Holds program dispatcher configuration

namespace Holds

/-- All logical components of the simultaneous invariant, with exact runtime indices. -/
theorem components
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {configuration : Configuration program dispatcher}
    (h : Holds program dispatcher configuration) :
    ∃ control : SchedulerControl.Control program dispatcher,
      ∃ phase : CTS.Phase program, ∃ scanned : List Bool,
      ∃ emptyMode : Bool,
        configuration.control = some control ∧
        RegistersCoherent (controlRegisters control) phase scanned emptyMode ∧
        ControlPosition program dispatcher control configuration.cursor ∧
        FamilyEvidence program dispatcher.tree control.family
          configuration.cursor.erase := by
  cases h with
  | intro control control_eq phase scanned emptyMode registers position evidence =>
      exact ⟨control, phase, scanned, emptyMode, control_eq, registers,
        position, evidence⟩

/-- Reachable configurations cannot themselves be the rejecting sink. -/
theorem control_ne_none
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {configuration : Configuration program dispatcher}
    (h : Holds program dispatcher configuration) :
    configuration.control ≠ none := by
  cases h with
  | intro control control_eq phase scanned emptyMode registers position evidence =>
      rw [control_eq]
      simp

/-- The exact decoder classification attached to the current family. -/
theorem decoderEvidence
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {configuration : Configuration program dispatcher}
    (h : Holds program dispatcher configuration) :
    ∃ control : SchedulerControl.Control program dispatcher,
      configuration.control = some control ∧
      DecoderEvidence program dispatcher.tree control.family
        configuration.cursor.erase := by
  cases h with
  | intro control control_eq phase scanned emptyMode registers position evidence =>
      exact ⟨control, control_eq, evidence.decoder⟩

/-- Decoder acceptance is exactly one of the family-indexed checkpoint cases. -/
theorem acceptsOnly
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {configuration : Configuration program dispatcher}
    (h : Holds program dispatcher configuration)
    (result : CheckpointDecoder.Result program) :
    CheckpointDecoder.decode? program dispatcher.tree
        configuration.cursor.erase = some result ↔
      ∃ control : SchedulerControl.Control program dispatcher,
        configuration.control = some control ∧
        CheckpointExclusion.Accepted program dispatcher.tree control.family
          configuration.cursor.erase result := by
  constructor
  · intro decoded
    rcases h.decoderEvidence with ⟨control, control_eq, evidence⟩
    exact ⟨control, control_eq, (evidence.acceptsOnly result).mp decoded⟩
  · rintro ⟨acceptedControl, acceptedControl_eq, accepted⟩
    rcases h.decoderEvidence with ⟨control, control_eq, evidence⟩
    have controls_eq : acceptedControl = control := by
      exact Option.some.inj (acceptedControl_eq.symm.trans control_eq)
    subst acceptedControl
    exact (evidence.acceptsOnly result).mpr accepted

end Holds

/-!
An exact zero-mutation micro-run followed by one mutating row determines the
result of executable `seekMutation`; no minimization or choice is involved.
-/
theorem seekMutation_after_zero_prefix
    {Control : Type} (machine : FiniteController.Machine Control) :
    ∀ (ticks : Nat) (configuration : FiniteController.Configuration Control),
      FiniteController.runMutationCount machine ticks configuration = 0 →
      FiniteController.mutationCount machine
          (FiniteController.run machine ticks configuration) = 1 →
      FiniteController.seekMutation machine (ticks + 1) configuration =
        some (FiniteController.step machine
          (FiniteController.run machine ticks configuration))
  | 0, configuration, _zeroPrefix, finalCount => by
      have count : FiniteController.mutationCount machine configuration = 1 := by
        simpa only [FiniteController.run_zero] using finalCount
      simp [FiniteController.seekMutation, count]
  | ticks + 1, configuration, zeroPrefix, finalCount => by
      have countZero :
          FiniteController.mutationCount machine configuration = 0 :=
        Nat.eq_zero_of_add_eq_zero_right zeroPrefix
      have tailZero :
          FiniteController.runMutationCount machine ticks
              (FiniteController.step machine configuration) = 0 :=
        Nat.eq_zero_of_add_eq_zero_left zeroPrefix
      have countNotOne :
          FiniteController.mutationCount machine configuration ≠ 1 := by
        rw [countZero]
        exact Nat.zero_ne_add_one 0
      have tailFinal :
          FiniteController.mutationCount machine
              (FiniteController.run machine ticks
                (FiniteController.step machine configuration)) = 1 := by
        simpa only [FiniteController.run_succ] using finalCount
      have tail := seekMutation_after_zero_prefix machine ticks
        (FiniteController.step machine configuration) tailZero tailFinal
      simpa only [FiniteController.seekMutation, countNotOne,
        ↓reduceIte, Nat.add_assoc, Nat.add_comm 1 ticks,
        FiniteController.run_succ] using tail

/--
An exact controller segment containing no term mutation.  This packages the
endpoint and the mutation count together so compiled scripts and probes can
be composed without losing the intermediate zipper state.
-/
structure ZeroMutationRun {Control : Type}
    (machine : FiniteController.Machine Control)
    (ticks : Nat)
    (before after : FiniteController.Configuration Control) : Prop where
  run_eq : FiniteController.run machine ticks before = after
  count_eq : FiniteController.runMutationCount machine ticks before = 0

namespace ZeroMutationRun

/-- Concatenating two mutation-free controller segments remains mutation-free. -/
theorem trans
    {Control : Type} {machine : FiniteController.Machine Control}
    {firstTicks secondTicks : Nat}
    {before middle after : FiniteController.Configuration Control}
    (first : ZeroMutationRun machine firstTicks before middle)
    (second : ZeroMutationRun machine secondTicks middle after) :
    ZeroMutationRun machine (firstTicks + secondTicks) before after := by
  constructor
  · rw [FiniteController.run_add, first.run_eq, second.run_eq]
  · rw [FiniteController.runMutationCount_add, first.count_eq,
      first.run_eq, second.count_eq]

/--
Prepending an exact mutation-free controller run does not change the first
mutation found by the executable bounded search.
-/
theorem seekMutation_prepend
    {Control : Type} {machine : FiniteController.Machine Control}
    {prefixTicks searchTicks : Nat}
    {before middle after : FiniteController.Configuration Control}
    (segment : ZeroMutationRun machine prefixTicks before middle)
    (found : FiniteController.seekMutation machine searchTicks middle =
      some after) :
    FiniteController.seekMutation machine (prefixTicks + searchTicks) before =
      some after := by
  revert before
  induction prefixTicks with
  | zero =>
      intro before segment
      have before_eq : before = middle := by
        simpa only [FiniteController.run_zero] using segment.run_eq
      subst before
      simpa only [Nat.zero_add] using found
  | succ prefixTicks ih =>
      intro before segment
      have first_zero :
          FiniteController.mutationCount machine before = 0 :=
        Nat.eq_zero_of_add_eq_zero_right segment.count_eq
      have tail_zero :
          FiniteController.runMutationCount machine prefixTicks
              (FiniteController.step machine before) = 0 :=
        Nat.eq_zero_of_add_eq_zero_left segment.count_eq
      have tail_run :
          FiniteController.run machine prefixTicks
              (FiniteController.step machine before) = middle := by
        simpa only [FiniteController.run_succ] using segment.run_eq
      have tail : ZeroMutationRun machine prefixTicks
          (FiniteController.step machine before) middle :=
        ⟨tail_run, tail_zero⟩
      have recurse := ih tail
      simpa only [Nat.succ_add, FiniteController.seekMutation, first_zero,
        ↓reduceIte] using! recurse

/-- A complete local structural probe is an exact mutation-free segment. -/
theorem localProbe
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (kind : SchedulerControl.ProbeKind program dispatcher)
    (registers : Registers program) (origin : Cursor)
    (localSite : SchedulerControl.probeSite kind = .local) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher kind origin)
      ⟨some (SchedulerControl.startProbe kind registers), origin⟩
      (SchedulerExecution.commandResult
        (SchedulerControl.probeAnswer program dispatcher kind
          (SchedulerControl.compiledProbeAnswer program dispatcher kind origin)
          registers) origin) :=
  ⟨SchedulerExecution.run_localProbe program dispatcher kind registers origin
      localSite,
    SchedulerExecution.runMutationCount_localProbe program dispatcher kind
      registers origin localSite⟩

/-- A complete parent-site structural probe is mutation-free and restores origin. -/
theorem parentProbe
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (kind : SchedulerControl.ProbeKind program dispatcher)
    (registers : Registers program) (origin : Cursor) (side : Direction)
    (parentSite : SchedulerControl.probeSite kind = .parent side) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher kind origin)
      ⟨some (SchedulerControl.startProbe kind registers), origin⟩
      (SchedulerExecution.commandResult
        (SchedulerControl.probeAnswer program dispatcher kind
          (SchedulerControl.compiledProbeAnswer program dispatcher kind origin)
          registers) origin) :=
  ⟨SchedulerExecution.run_parentProbe program dispatcher kind registers origin
      side parentSite,
    SchedulerExecution.runMutationCount_parentProbe program dispatcher kind
      registers origin side parentSite⟩

/-- A cursor-only fixed script and its epsilon exit form one zero-mutation run. -/
theorem script
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (job : SchedulerControl.ScriptJob program) (registers : Registers program)
    (before after : Cursor)
    (executes : Script.run
      (SchedulerControl.jobScript program dispatcher job) before = some after)
    (noMutation : Script.rdxCount
      (SchedulerControl.jobScript program dispatcher job) = 0) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher)
      ((SchedulerControl.jobScript program dispatcher job).length + 1)
      ⟨some (SchedulerControl.startScript (dispatcher := dispatcher) job
        registers), before⟩
      ⟨some (SchedulerControl.afterScript program dispatcher job registers),
        after⟩ := by
  exact ⟨SchedulerExecution.run_script program dispatcher job registers before
      after executes,
    by
      rw [SchedulerExecution.runMutationCount_script program dispatcher job
        registers before after executes, noMutation]⟩

end ZeroMutationRun

/-- Exact controller endpoint together with its exact number of term mutations. -/
structure CountedRun {Control : Type}
    (machine : FiniteController.Machine Control)
    (ticks mutations : Nat)
    (before after : FiniteController.Configuration Control) : Prop where
  run_eq : FiniteController.run machine ticks before = after
  count_eq : FiniteController.runMutationCount machine ticks before = mutations

namespace CountedRun

/-- Exact counted controller segments compose additively. -/
theorem trans
    {Control : Type} {machine : FiniteController.Machine Control}
    {firstTicks secondTicks firstMutations secondMutations : Nat}
    {before middle after : FiniteController.Configuration Control}
    (first : CountedRun machine firstTicks firstMutations before middle)
    (second : CountedRun machine secondTicks secondMutations middle after) :
    CountedRun machine (firstTicks + secondTicks)
      (firstMutations + secondMutations) before after := by
  constructor
  · rw [FiniteController.run_add, first.run_eq, second.run_eq]
  · rw [FiniteController.runMutationCount_add, first.count_eq,
      first.run_eq, second.count_eq]

end CountedRun

/-- A mutation-free segment is an exact counted segment of count zero. -/
theorem ZeroMutationRun.toCounted
    {Control : Type} {machine : FiniteController.Machine Control}
    {ticks : Nat} {before after : FiniteController.Configuration Control}
    (run : ZeroMutationRun machine ticks before after) :
    CountedRun machine ticks 0 before after :=
  ⟨run.run_eq, run.count_eq⟩

/-! ## Concrete encoder state -/

/-- Actual controller configuration after a finite number of initial ticks. -/
def initialRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (ticks : Nat) : Configuration program dispatcher :=
  FiniteController.run (SchedulerControl.machine program dispatcher) ticks
    (SchedulerControl.initialConfiguration program dispatcher bits)

/-- The actual encoder root satisfies the clock-family reachable invariant. -/
theorem initial
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    Holds program dispatcher
      (SchedulerControl.initialConfiguration program dispatcher bits) := by
  exact .intro
    (SchedulerControl.initialControl program dispatcher) rfl
    (CTS.zeroPhase program) [] false
    (RegistersCoherent.initial program)
    (ControlPosition.macro (context := .hole)
      (focus := generator (compileActions program dispatcher.tree) bits)
      ⟨rfl, rfl⟩ (by trivial))
    (.clock (.public (.timeZero bits)))

/-- The initial invariant carries the exact horizon-zero checkpoint. -/
theorem initial_decode
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    CheckpointDecoder.decode? program dispatcher.tree
        (SchedulerControl.initialConfiguration program dispatcher bits).cursor.erase =
      some (.zero bits) := by
  simpa using CheckpointRun.decode?_timeZero program dispatcher bits

/-- The first controller row enters the fixed clock-entry script safely. -/
theorem afterInitial
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    Holds program dispatcher
      (FiniteController.step (SchedulerControl.machine program dispatcher)
        (SchedulerControl.initialConfiguration program dispatcher bits)) := by
  let environment := environmentCode
    (compileActions program dispatcher.tree) bits
  let initialCursor : Cursor := ⟨generator
    (compileActions program dispatcher.tree) bits, []⟩
  let enteredCursor : Cursor := ⟨.app (C 0) (C 0), [.left environment]⟩
  exact .intro
    (SchedulerControl.startScript .clockEnter (Registers.initial program)) rfl
    (CTS.zeroPhase program) [] false
    (RegistersCoherent.initial program)
    (ControlPosition.script
      (origin := initialCursor) (endpoint := enteredCursor)
      rfl rfl ⟨enteredCursor, rfl⟩)
    (.clock (.public (.timeZero bits)))

/-- The clock-entry move reaches the exact `C₀ C₀` zipper occurrence. -/
theorem afterClockEnter
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    Holds program dispatcher (initialRun program dispatcher bits 2) := by
  let environment := environmentCode
    (compileActions program dispatcher.tree) bits
  let initialCursor : Cursor := ⟨generator
    (compileActions program dispatcher.tree) bits, []⟩
  let enteredCursor : Cursor := ⟨.app (C 0) (C 0), [.left environment]⟩
  let first := SchedulerControl.firstScriptPC program dispatcher
    SchedulerControl.ScriptJob.clockEnter
  let second := SchedulerControl.nextScriptPC program dispatcher
    SchedulerControl.ScriptJob.clockEnter first (by
      change 0 < 1
      exact Nat.zero_lt_succ 0)
  exact .intro
    (.script .clockEnter second (Registers.initial program)) rfl
    (CTS.zeroPhase program) [] false
    (RegistersCoherent.initial program)
    (ControlPosition.script
      (origin := initialCursor) (endpoint := enteredCursor)
      rfl rfl (by trivial))
    (.clock (.public (.timeZero bits)))

/-- The terminal clock-entry PC changes only finite control. -/
theorem afterClockEnterDone
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    Holds program dispatcher (initialRun program dispatcher bits 3) := by
  let environment := environmentCode
    (compileActions program dispatcher.tree) bits
  exact .intro
    (.macro .clockGrow (Registers.initial program)) rfl
    (CTS.zeroPhase program) [] false
    (RegistersCoherent.initial program)
    (ControlPosition.macro
      (context := .appLeft .hole environment)
      (focus := .app (C 0) (C 0)) ⟨rfl, rfl⟩ (by trivial))
    (.clock (.public (.timeZero bits)))

/-- The successor guard starts at the root of its fixed compiled probe. -/
theorem afterClockGrow
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    Holds program dispatcher (initialRun program dispatcher bits 4) := by
  let environment := environmentCode
    (compileActions program dispatcher.tree) bits
  let enteredCursor : Cursor := ⟨.app (C 0) (C 0), [.left environment]⟩
  let kind : SchedulerControl.ProbeKind program dispatcher :=
    .clockSuccessor
  exact .intro
    (SchedulerControl.startProbe kind (Registers.initial program)) rfl
    (CTS.zeroPhase program) [] false
    (RegistersCoherent.initial program)
    (ControlPosition.probe
      (origin := enteredCursor)
      (answer := SchedulerControl.compiledProbeAnswer program dispatcher kind
        enteredCursor)
      (prefixTicks := 0)
      (suffixTicks := SchedulerControl.compiledProbeCost program dispatcher kind
        enteredCursor)
      rfl (SchedulerControl.compiledProbe_run kind enteredCursor) (by trivial))
    (.clock (.public (.timeZero bits)))

/-- Cursor at which both initial clock discriminators are executed. -/
def initialClockCursor
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) : Cursor :=
  ⟨.app (C 0) (C 0),
    [.left (environmentCode
      (compileActions program dispatcher.tree) bits)]⟩

/-- Exact zero-mutation prefix length before the generator contraction. -/
def firstMutationPrefixTicks
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) : Nat :=
  4 +
    SchedulerControl.compiledProbeCost program dispatcher .clockSuccessor
      (initialClockCursor program dispatcher bits) +
    SchedulerControl.compiledProbeCost program dispatcher .clockZero
      (initialClockCursor program dispatcher bits)

/-- Four fixed entry rows reach the first compiled guard root. -/
theorem initialRun_four
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    initialRun program dispatcher bits 4 =
      ⟨some (SchedulerControl.startProbe .clockSuccessor
          (Registers.initial program)),
        initialClockCursor program dispatcher bits⟩ := by
  rfl

/-- The four fixed entry rows perform no contraction. -/
theorem initialRun_four_mutationCount
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    FiniteController.runMutationCount
        (SchedulerControl.machine program dispatcher) 4
        (SchedulerControl.initialConfiguration program dispatcher bits) = 0 := by
  rfl

/-- The successor discriminator rejects the literal `C₀ C₀` pair. -/
theorem initial_clockSuccessor_answer
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    SchedulerControl.compiledProbeAnswer program dispatcher .clockSuccessor
      (initialClockCursor program dispatcher bits) = false := by
  rfl

/-- The zero discriminator accepts the literal `C₀ C₀` pair. -/
theorem initial_clockZero_answer
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    SchedulerControl.compiledProbeAnswer program dispatcher .clockZero
      (initialClockCursor program dispatcher bits) = true := by
  rfl

/-- Exact execution of the initial successor discriminator. -/
theorem run_initialClockSuccessor
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    FiniteController.run (SchedulerControl.machine program dispatcher)
        (SchedulerControl.compiledProbeCost program dispatcher .clockSuccessor
          (initialClockCursor program dispatcher bits))
        ⟨some (SchedulerControl.startProbe .clockSuccessor
            (Registers.initial program)),
          initialClockCursor program dispatcher bits⟩ =
      ⟨some (SchedulerControl.startProbe .clockZero
          (Registers.initial program)),
        initialClockCursor program dispatcher bits⟩ := by
  have run := SchedulerExecution.run_localProbe program dispatcher
    (.clockSuccessor) (Registers.initial program)
    (initialClockCursor program dispatcher bits) rfl
  simpa [initial_clockSuccessor_answer] using! run

/-- Exact execution of the initial zero discriminator. -/
theorem run_initialClockZero
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    FiniteController.run (SchedulerControl.machine program dispatcher)
        (SchedulerControl.compiledProbeCost program dispatcher .clockZero
          (initialClockCursor program dispatcher bits))
        ⟨some (SchedulerControl.startProbe .clockZero
            (Registers.initial program)),
          initialClockCursor program dispatcher bits⟩ =
      ⟨some (SchedulerControl.startScript .clockZero
          (Registers.initial program)),
        initialClockCursor program dispatcher bits⟩ := by
  have run := SchedulerExecution.run_localProbe program dispatcher
    (.clockZero) (Registers.initial program)
    (initialClockCursor program dispatcher bits) rfl
  simpa [initial_clockZero_answer] using! run

/-- The configuration immediately following the generator's first contraction. -/
def firstMutationConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) : Configuration program dispatcher :=
  let environment := environmentCode
    (compileActions program dispatcher.tree) bits
  let enteredCursor : Cursor := ⟨.app (C 0) (C 0), [.left environment]⟩
  let first := SchedulerControl.firstScriptPC program dispatcher
    SchedulerControl.ScriptJob.clockZero
  let final := SchedulerControl.nextScriptPC program dispatcher
    SchedulerControl.ScriptJob.clockZero first (by
      change 0 < 1
      exact Nat.zero_lt_succ 0)
  ⟨some (.script .clockZero final (Registers.initial program)),
    ⟨clockBase 0, enteredCursor.parents⟩⟩

/-- Exact scheduler state just before the generator's first contraction. -/
def firstMutationSourceConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) : Configuration program dispatcher :=
  let environment := environmentCode
    (compileActions program dispatcher.tree) bits
  ⟨some (SchedulerControl.startScript .clockZero (Registers.initial program)),
    ⟨.app (C 0) (C 0), [.left environment]⟩⟩

/-- The complete initial nonmutating prefix reaches the exact clock-zero row. -/
theorem run_toFirstMutationSource
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    FiniteController.run (SchedulerControl.machine program dispatcher)
        (firstMutationPrefixTicks program dispatcher bits)
        (SchedulerControl.initialConfiguration program dispatcher bits) =
      firstMutationSourceConfiguration program dispatcher bits := by
  unfold firstMutationPrefixTicks
  rw [FiniteController.run_add, FiniteController.run_add]
  rw [show
    FiniteController.run (SchedulerControl.machine program dispatcher) 4
        (SchedulerControl.initialConfiguration program dispatcher bits) =
      ⟨some (SchedulerControl.startProbe .clockSuccessor
          (Registers.initial program)),
        initialClockCursor program dispatcher bits⟩ by
      exact initialRun_four program dispatcher bits]
  rw [run_initialClockSuccessor, run_initialClockZero]
  rfl

/-- Every row before the generator contraction is mutation-free. -/
theorem runMutationCount_toFirstMutationSource
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    FiniteController.runMutationCount
        (SchedulerControl.machine program dispatcher)
        (firstMutationPrefixTicks program dispatcher bits)
        (SchedulerControl.initialConfiguration program dispatcher bits) = 0 := by
  have four :
      FiniteController.run (SchedulerControl.machine program dispatcher) 4
          (SchedulerControl.initialConfiguration program dispatcher bits) =
        ⟨some (SchedulerControl.startProbe .clockSuccessor
            (Registers.initial program)),
          initialClockCursor program dispatcher bits⟩ :=
    initialRun_four program dispatcher bits
  have throughSuccessor :
      FiniteController.run (SchedulerControl.machine program dispatcher)
          (4 + SchedulerControl.compiledProbeCost program dispatcher
            .clockSuccessor (initialClockCursor program dispatcher bits))
          (SchedulerControl.initialConfiguration program dispatcher bits) =
        ⟨some (SchedulerControl.startProbe .clockZero
            (Registers.initial program)),
          initialClockCursor program dispatcher bits⟩ := by
    rw [FiniteController.run_add, four, run_initialClockSuccessor]
  unfold firstMutationPrefixTicks
  rw [FiniteController.runMutationCount_add,
    FiniteController.runMutationCount_add]
  rw [initialRun_four_mutationCount, four]
  rw [SchedulerExecution.runMutationCount_localProbe program dispatcher
    (.clockSuccessor) (Registers.initial program)
    (initialClockCursor program dispatcher bits) rfl]
  rw [throughSuccessor]
  rw [SchedulerExecution.runMutationCount_localProbe program dispatcher
    (.clockZero) (Registers.initial program)
    (initialClockCursor program dispatcher bits) rfl]

/-- The clock-zero script row implements the generator contraction literally. -/
theorem firstMutation_step
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    FiniteController.step (SchedulerControl.machine program dispatcher)
        (firstMutationSourceConfiguration program dispatcher bits) =
      firstMutationConfiguration program dispatcher bits := by
  rfl

/-- The generator row contributes exactly one mutation. -/
theorem firstMutation_count
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    FiniteController.mutationCount (SchedulerControl.machine program dispatcher)
        (firstMutationSourceConfiguration program dispatcher bits) = 1 := by
  rfl

/-- One unit of executable search returns the exact first post-mutation state. -/
theorem firstMutation_seek
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    FiniteController.seekMutation (SchedulerControl.machine program dispatcher) 1
        (firstMutationSourceConfiguration program dispatcher bits) =
      some (firstMutationConfiguration program dispatcher bits) := by
  simp [FiniteController.seekMutation, firstMutation_count,
    firstMutation_step]

/-- Executable search from the encoder returns its exact first sampled state. -/
theorem initial_seekFirstMutation
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    FiniteController.seekMutation (SchedulerControl.machine program dispatcher)
        (firstMutationPrefixTicks program dispatcher bits + 1)
        (SchedulerControl.initialConfiguration program dispatcher bits) =
      some (firstMutationConfiguration program dispatcher bits) := by
  have found := seekMutation_after_zero_prefix
    (SchedulerControl.machine program dispatcher)
    (firstMutationPrefixTicks program dispatcher bits)
    (SchedulerControl.initialConfiguration program dispatcher bits)
    (runMutationCount_toFirstMutationSource program dispatcher bits)
    (by
      rw [run_toFirstMutationSource]
      exact firstMutation_count program dispatcher bits)
  rw [run_toFirstMutationSource, firstMutation_step] at found
  exact found

/-- The compiled controller reaches the exact first sampled contraction. -/
theorem run_toFirstMutation
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    FiniteController.run (SchedulerControl.machine program dispatcher)
        (firstMutationPrefixTicks program dispatcher bits + 1)
        (SchedulerControl.initialConfiguration program dispatcher bits) =
      firstMutationConfiguration program dispatcher bits := by
  rw [FiniteController.run_add, run_toFirstMutationSource]
  change FiniteController.step (SchedulerControl.machine program dispatcher)
      (firstMutationSourceConfiguration program dispatcher bits) = _
  exact firstMutation_step program dispatcher bits

/-- The first post-contraction state is the exact rejected staging checkpoint. -/
theorem firstMutation_holds
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    Holds program dispatcher
      (firstMutationConfiguration program dispatcher bits) := by
  let environment := environmentCode
    (compileActions program dispatcher.tree) bits
  let enteredCursor : Cursor := ⟨.app (C 0) (C 0), [.left environment]⟩
  let first := SchedulerControl.firstScriptPC program dispatcher
    SchedulerControl.ScriptJob.clockZero
  let final := SchedulerControl.nextScriptPC program dispatcher
    SchedulerControl.ScriptJob.clockZero first (by
      change 0 < 1
      exact Nat.zero_lt_succ 0)
  let stagingCursor : Cursor := ⟨clockBase 0, [.left environment]⟩
  exact .intro
    (.script .clockZero final (Registers.initial program)) rfl
    (CTS.zeroPhase program) [] false
    (RegistersCoherent.initial program)
    (ControlPosition.script
      (origin := enteredCursor) (endpoint := stagingCursor)
      rfl rfl (by trivial))
    (.clock (.public (.rejected (.clockStaging (.here _)
      ⟨word bits, by
        simp [firstMutationConfiguration, stagingCursor, enteredCursor,
          environment,
          CheckpointDecoder.openEnvironment_word]
        rfl⟩))))

/-- The first scheduler contraction is decoder-rejected, as required. -/
theorem firstMutation_decode_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    CheckpointDecoder.decode? program dispatcher.tree
        (firstMutationConfiguration program dispatcher bits).cursor.erase = none := by
  apply CheckpointExclusion.Noncheckpoint.decode?_none
  exact .clockStaging (.here _)
    ⟨word bits, by
      simp [firstMutationConfiguration,
        CheckpointDecoder.openEnvironment_word]
      rfl⟩

/-- Exact scheduler state just before the stage-one positive clock row. -/
def secondMutationSourceConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) : Configuration program dispatcher :=
  let environment := environmentCode
    (compileActions program dispatcher.tree) bits
  ⟨some (SchedulerControl.startScript .clockPositive
      (Registers.initial program)),
    ⟨clockBase 0, [.left environment]⟩⟩

/-- Configuration immediately after exposing the first stage-one wrapper. -/
def secondMutationConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) : Configuration program dispatcher :=
  let environment := environmentCode
    (compileActions program dispatcher.tree) bits
  let first := SchedulerControl.firstScriptPC program dispatcher
    SchedulerControl.ScriptJob.clockPositive
  let next := SchedulerControl.nextScriptPC program dispatcher
    SchedulerControl.ScriptJob.clockPositive first (by
      change 0 < 2
      exact Nat.zero_lt_succ 1)
  ⟨some (.script .clockPositive next (Registers.initial program)),
    ⟨clockGrowthCore 1 1 0, [.left environment]⟩⟩

/-- The positive clock row exposes one wrapper by exactly one `Rdx`. -/
theorem secondMutation_step
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    FiniteController.step (SchedulerControl.machine program dispatcher)
        (secondMutationSourceConfiguration program dispatcher bits) =
      secondMutationConfiguration program dispatcher bits := by
  rfl

/-- The positive clock row contributes exactly one mutation. -/
theorem secondMutation_count
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    FiniteController.mutationCount (SchedulerControl.machine program dispatcher)
        (secondMutationSourceConfiguration program dispatcher bits) = 1 := by
  rfl

/-- One unit of bounded search returns the first partial clock expansion. -/
theorem secondMutation_seek
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    FiniteController.seekMutation (SchedulerControl.machine program dispatcher) 1
        (secondMutationSourceConfiguration program dispatcher bits) =
      some (secondMutationConfiguration program dispatcher bits) := by
  simp [FiniteController.seekMutation, secondMutation_count,
    secondMutation_step]

/-- The partial stage-one clock expansion satisfies the strengthened invariant. -/
theorem secondMutation_holds
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    Holds program dispatcher
      (secondMutationConfiguration program dispatcher bits) := by
  let environment := environmentCode
    (compileActions program dispatcher.tree) bits
  let origin : Cursor := ⟨clockBase 0, [.left environment]⟩
  let current : Cursor := ⟨clockGrowthCore 1 1 0, [.left environment]⟩
  let endpoint : Cursor :=
    ⟨.app (C 0) (C 1),
      .right (.app .s (C 1)) :: [.left environment]⟩
  let first := SchedulerControl.firstScriptPC program dispatcher
    SchedulerControl.ScriptJob.clockPositive
  let next := SchedulerControl.nextScriptPC program dispatcher
    SchedulerControl.ScriptJob.clockPositive first (by
      change 0 < 2
      exact Nat.zero_lt_succ 1)
  exact .intro
    (.script .clockPositive next (Registers.initial program)) rfl
    (CTS.zeroPhase program) [] false
    (RegistersCoherent.initial program)
    (ControlPosition.script
      (origin := origin) (endpoint := endpoint)
      rfl rfl ⟨endpoint, rfl⟩)
    (.clock (.silent (.ofState (.clockGrowth (.here _)
      1 0 0 (word bits) (by
        simp [secondMutationConfiguration, current, environment,
          CheckpointDecoder.openEnvironment_word]
        rfl)))))

/-- The first partial stage-one clock term is decoder-silent. -/
theorem secondMutation_decode_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    CheckpointDecoder.decode? program dispatcher.tree
        (secondMutationConfiguration program dispatcher bits).cursor.erase = none := by
  apply SilentState.decode?_none
  exact .clockGrowth (.here _) 1 0 0 (word bits) (by
    simp [secondMutationConfiguration,
      CheckpointDecoder.openEnvironment_word]
    rfl)

/-! ### Exact bridge between the first two sampled contractions -/

/-- Root zipper of the stage-one staging term after the generator contraction. -/
def firstMutationRootCursor
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) : Cursor :=
  ⟨(firstMutationConfiguration program dispatcher bits).cursor.erase, []⟩

/-- The first growth-parent test does not mistake the staging endpoint for a wrapper. -/
theorem firstMutation_growWrapper_answer
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    SchedulerControl.compiledProbeAnswer program dispatcher .growWrapper
      (firstMutationConfiguration program dispatcher bits).cursor = false := by
  rfl

/-- The staging endpoint has the registered environment-envelope parent. -/
theorem firstMutation_growEnvelope_answer
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    SchedulerControl.compiledProbeAnswer program dispatcher .growEnvelope
      (firstMutationConfiguration program dispatcher bits).cursor = true := by
  rfl

/-- The stage-one staging root is not an arity-three continuation. -/
theorem firstMutation_arityThree_answer
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    SchedulerControl.compiledProbeAnswer program dispatcher
      (.arityThree .growth) (firstMutationRootCursor program dispatcher bits) =
        false := by
  rfl

/-- The stage-one staging root is the registered arity-four growth endpoint. -/
theorem firstMutation_arityFour_answer
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    SchedulerControl.compiledProbeAnswer program dispatcher
      (.arityFour .growth) (firstMutationRootCursor program dispatcher bits) =
        true := by
  rfl

/-- Descending from the growth endpoint exposes a positive clock call. -/
theorem firstMutation_clockSuccessor_answer
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    SchedulerControl.compiledProbeAnswer program dispatcher .clockSuccessor
      (secondMutationSourceConfiguration program dispatcher bits).cursor = true := by
  rfl

/-- Exact execution of the failed wrapper-parent test. -/
theorem run_firstMutationGrowWrapper
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    FiniteController.run (SchedulerControl.machine program dispatcher)
        (SchedulerControl.compiledProbeCost program dispatcher .growWrapper
          (firstMutationConfiguration program dispatcher bits).cursor)
        ⟨some (SchedulerControl.startProbe .growWrapper
            (Registers.initial program)),
          (firstMutationConfiguration program dispatcher bits).cursor⟩ =
      ⟨some (SchedulerControl.startProbe .growEnvelope
          (Registers.initial program)),
        (firstMutationConfiguration program dispatcher bits).cursor⟩ := by
  have run := SchedulerExecution.run_parentProbe program dispatcher
    (.growWrapper) (Registers.initial program)
    (firstMutationConfiguration program dispatcher bits).cursor .right rfl
  simpa using! run

/-- Exact execution of the successful envelope-parent test. -/
theorem run_firstMutationGrowEnvelope
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    FiniteController.run (SchedulerControl.machine program dispatcher)
        (SchedulerControl.compiledProbeCost program dispatcher .growEnvelope
          (firstMutationConfiguration program dispatcher bits).cursor)
        ⟨some (SchedulerControl.startProbe .growEnvelope
            (Registers.initial program)),
          (firstMutationConfiguration program dispatcher bits).cursor⟩ =
      ⟨some (.macro .growMoveEndpoint (Registers.initial program)),
        (firstMutationConfiguration program dispatcher bits).cursor⟩ := by
  have run := SchedulerExecution.run_parentProbe program dispatcher
    (.growEnvelope) (Registers.initial program)
    (firstMutationConfiguration program dispatcher bits).cursor .left rfl
  simpa using! run

/-- Exact execution of the failed arity-three growth test. -/
theorem run_firstMutationArityThree
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    FiniteController.run (SchedulerControl.machine program dispatcher)
        (SchedulerControl.compiledProbeCost program dispatcher
          (.arityThree .growth)
          (firstMutationRootCursor program dispatcher bits))
        ⟨some (SchedulerControl.startProbe (.arityThree .growth)
            (Registers.initial program)),
          firstMutationRootCursor program dispatcher bits⟩ =
      ⟨some (SchedulerControl.startProbe (.arityFour .growth)
          (Registers.initial program)),
        firstMutationRootCursor program dispatcher bits⟩ := by
  have run := SchedulerExecution.run_localProbe program dispatcher
    (.arityThree .growth) (Registers.initial program)
    (firstMutationRootCursor program dispatcher bits) rfl
  simpa using! run

/-- Exact execution of the successful arity-four growth test. -/
theorem run_firstMutationArityFour
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    FiniteController.run (SchedulerControl.machine program dispatcher)
        (SchedulerControl.compiledProbeCost program dispatcher
          (.arityFour .growth)
          (firstMutationRootCursor program dispatcher bits))
        ⟨some (SchedulerControl.startProbe (.arityFour .growth)
            (Registers.initial program)),
          firstMutationRootCursor program dispatcher bits⟩ =
      ⟨some (.macro (.arityDecision .growth false)
          (Registers.initial program)),
        firstMutationRootCursor program dispatcher bits⟩ := by
  have run := SchedulerExecution.run_localProbe program dispatcher
    (.arityFour .growth) (Registers.initial program)
    (firstMutationRootCursor program dispatcher bits) rfl
  simpa using! run

/-- Exact execution of the positive clock-call test at stage one. -/
theorem run_firstMutationClockSuccessor
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    FiniteController.run (SchedulerControl.machine program dispatcher)
        (SchedulerControl.compiledProbeCost program dispatcher .clockSuccessor
          (secondMutationSourceConfiguration program dispatcher bits).cursor)
        ⟨some (SchedulerControl.startProbe .clockSuccessor
            (Registers.initial program)),
          (secondMutationSourceConfiguration program dispatcher bits).cursor⟩ =
      secondMutationSourceConfiguration program dispatcher bits := by
  have run := SchedulerExecution.run_localProbe program dispatcher
    (.clockSuccessor) (Registers.initial program)
    (secondMutationSourceConfiguration program dispatcher bits).cursor rfl
  simpa using! run

/-- Exact number of nonmutating rows between the first and second contractions. -/
def firstToSecondMutationPrefixTicks
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) : Nat :=
  ((((((2 + SchedulerControl.compiledProbeCost program dispatcher .growWrapper
      (firstMutationConfiguration program dispatcher bits).cursor) +
    SchedulerControl.compiledProbeCost program dispatcher .growEnvelope
      (firstMutationConfiguration program dispatcher bits).cursor) + 2) +
    SchedulerControl.compiledProbeCost program dispatcher (.arityThree .growth)
      (firstMutationRootCursor program dispatcher bits)) +
    SchedulerControl.compiledProbeCost program dispatcher (.arityFour .growth)
      (firstMutationRootCursor program dispatcher bits)) + 2) +
    SchedulerControl.compiledProbeCost program dispatcher .clockSuccessor
      (secondMutationSourceConfiguration program dispatcher bits).cursor

/--
Every row between the first contraction and the source of the second is
proved mutation-free, with the exact intermediate zipper restored after each
compiled parent or local probe.
-/
theorem firstToSecondMutation_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (firstToSecondMutationPrefixTicks program dispatcher bits)
      (firstMutationConfiguration program dispatcher bits)
      (secondMutationSourceConfiguration program dispatcher bits) := by
  let root := firstMutationRootCursor program dispatcher bits
  let staging := (firstMutationConfiguration program dispatcher bits).cursor
  let registers := Registers.initial program
  let wrapperStart : Configuration program dispatcher :=
    ⟨some (SchedulerControl.startProbe .growWrapper registers), staging⟩
  let envelopeStart : Configuration program dispatcher :=
    ⟨some (SchedulerControl.startProbe .growEnvelope registers), staging⟩
  let endpointMove : Configuration program dispatcher :=
    ⟨some (.macro .growMoveEndpoint registers), staging⟩
  let arityThreeStart : Configuration program dispatcher :=
    ⟨some (SchedulerControl.startProbe (.arityThree .growth) registers), root⟩
  let arityFourStart : Configuration program dispatcher :=
    ⟨some (SchedulerControl.startProbe (.arityFour .growth) registers), root⟩
  let arityDecision : Configuration program dispatcher :=
    ⟨some (.macro (.arityDecision .growth false) registers), root⟩
  let successorStart : Configuration program dispatcher :=
    ⟨some (SchedulerControl.startProbe .clockSuccessor registers),
      (secondMutationSourceConfiguration program dispatcher bits).cursor⟩
  have entry : ZeroMutationRun
      (SchedulerControl.machine program dispatcher) 2
      (firstMutationConfiguration program dispatcher bits) wrapperStart := by
    exact ⟨rfl, rfl⟩
  have wrapper : ZeroMutationRun
      (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher .growWrapper staging)
      wrapperStart envelopeStart := by
    exact ⟨run_firstMutationGrowWrapper program dispatcher bits,
      SchedulerExecution.runMutationCount_parentProbe program dispatcher
        (.growWrapper) registers staging .right rfl⟩
  have envelope : ZeroMutationRun
      (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher .growEnvelope staging)
      envelopeStart endpointMove := by
    exact ⟨run_firstMutationGrowEnvelope program dispatcher bits,
      SchedulerExecution.runMutationCount_parentProbe program dispatcher
        (.growEnvelope) registers staging .left rfl⟩
  have moveEndpoint : ZeroMutationRun
      (SchedulerControl.machine program dispatcher) 2
      endpointMove arityThreeStart := by
    exact ⟨rfl, rfl⟩
  have arityThree : ZeroMutationRun
      (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher
        (.arityThree .growth) root)
      arityThreeStart arityFourStart := by
    exact ⟨run_firstMutationArityThree program dispatcher bits,
      SchedulerExecution.runMutationCount_localProbe program dispatcher
        (.arityThree .growth) registers root rfl⟩
  have arityFour : ZeroMutationRun
      (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher
        (.arityFour .growth) root)
      arityFourStart arityDecision := by
    exact ⟨run_firstMutationArityFour program dispatcher bits,
      SchedulerExecution.runMutationCount_localProbe program dispatcher
        (.arityFour .growth) registers root rfl⟩
  have descend : ZeroMutationRun
      (SchedulerControl.machine program dispatcher) 2
      arityDecision successorStart := by
    exact ⟨rfl, rfl⟩
  have successor : ZeroMutationRun
      (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher .clockSuccessor
        (secondMutationSourceConfiguration program dispatcher bits).cursor)
      successorStart
      (secondMutationSourceConfiguration program dispatcher bits) := by
    exact ⟨run_firstMutationClockSuccessor program dispatcher bits,
      SchedulerExecution.runMutationCount_localProbe program dispatcher
        (.clockSuccessor) registers
        (secondMutationSourceConfiguration program dispatcher bits).cursor rfl⟩
  simpa [firstToSecondMutationPrefixTicks, staging, root] using
    (((((((entry.trans wrapper).trans envelope).trans moveEndpoint).trans
      arityThree).trans arityFour).trans descend).trans successor)

/-- The first sampled state reaches the exact source of the second contraction. -/
theorem run_toSecondMutationSource
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    FiniteController.run (SchedulerControl.machine program dispatcher)
        (firstToSecondMutationPrefixTicks program dispatcher bits)
        (firstMutationConfiguration program dispatcher bits) =
      secondMutationSourceConfiguration program dispatcher bits :=
  (firstToSecondMutation_zeroRun program dispatcher bits).run_eq

/-- No contraction occurs before the exact second clock row. -/
theorem runMutationCount_toSecondMutationSource
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    FiniteController.runMutationCount
        (SchedulerControl.machine program dispatcher)
        (firstToSecondMutationPrefixTicks program dispatcher bits)
        (firstMutationConfiguration program dispatcher bits) = 0 :=
  (firstToSecondMutation_zeroRun program dispatcher bits).count_eq

/-- Executable sampling from the first mutation returns the exact second mutation. -/
theorem firstMutation_seekSecondMutation
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    FiniteController.seekMutation (SchedulerControl.machine program dispatcher)
        (firstToSecondMutationPrefixTicks program dispatcher bits + 1)
        (firstMutationConfiguration program dispatcher bits) =
      some (secondMutationConfiguration program dispatcher bits) := by
  have found := seekMutation_after_zero_prefix
    (SchedulerControl.machine program dispatcher)
    (firstToSecondMutationPrefixTicks program dispatcher bits)
    (firstMutationConfiguration program dispatcher bits)
    (runMutationCount_toSecondMutationSource program dispatcher bits)
    (by
      rw [run_toSecondMutationSource]
      exact secondMutation_count program dispatcher bits)
  rw [run_toSecondMutationSource, secondMutation_step] at found
  exact found

/-- The complete micro-run from the first sample reaches the second sample. -/
theorem run_firstToSecondMutation
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    FiniteController.run (SchedulerControl.machine program dispatcher)
        (firstToSecondMutationPrefixTicks program dispatcher bits + 1)
        (firstMutationConfiguration program dispatcher bits) =
      secondMutationConfiguration program dispatcher bits := by
  rw [FiniteController.run_add, run_toSecondMutationSource]
  change FiniteController.step (SchedulerControl.machine program dispatcher)
      (secondMutationSourceConfiguration program dispatcher bits) = _
  exact secondMutation_step program dispatcher bits

/-! ### Uniform positive-clock mutation row -/

/-- Any positive residual clock pair at its exact wrapper zipper. -/
def positiveClockSourceConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program)
    (stage wrappers remaining : Nat) (parents : List ParentFrame) :
    Configuration program dispatcher :=
  ⟨some (SchedulerControl.startScript .clockPositive registers),
    ⟨.app (C (remaining + 1)) (C stage),
      PrimitiveClock.wrapperParents stage wrappers parents⟩⟩

/-- Post-`Rdx` state of a uniform positive residual clock pair. -/
def positiveClockMutationConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program)
    (stage wrappers remaining : Nat) (parents : List ParentFrame) :
    Configuration program dispatcher :=
  let first := SchedulerControl.firstScriptPC program dispatcher
    SchedulerControl.ScriptJob.clockPositive
  let next := SchedulerControl.nextScriptPC program dispatcher
    SchedulerControl.ScriptJob.clockPositive first (by
      change 0 < 2
      exact Nat.zero_lt_succ 1)
  ⟨some (.script .clockPositive next registers),
    ⟨.app (.app .s (C stage)) (.app (C remaining) (C stage)),
      PrimitiveClock.wrapperParents stage wrappers parents⟩⟩

/-- Every positive clock row is the exact local `Rdx` certified above. -/
theorem positiveClockMutation_step
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program)
    (stage wrappers remaining : Nat) (parents : List ParentFrame) :
    FiniteController.step (SchedulerControl.machine program dispatcher)
        (positiveClockSourceConfiguration program dispatcher registers
          stage wrappers remaining parents) =
      positiveClockMutationConfiguration program dispatcher registers
        stage wrappers remaining parents := by
  rfl

/-- Every positive clock row contributes one and only one mutation. -/
theorem positiveClockMutation_count
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program)
    (stage wrappers remaining : Nat) (parents : List ParentFrame) :
    FiniteController.mutationCount (SchedulerControl.machine program dispatcher)
        (positiveClockSourceConfiguration program dispatcher registers
          stage wrappers remaining parents) = 1 := by
  rfl

/-- Executable bounded search finds a uniform positive clock mutation in one row. -/
theorem positiveClockMutation_seek
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program)
    (stage wrappers remaining : Nat) (parents : List ParentFrame) :
    FiniteController.seekMutation (SchedulerControl.machine program dispatcher) 1
        (positiveClockSourceConfiguration program dispatcher registers
          stage wrappers remaining parents) =
      some (positiveClockMutationConfiguration program dispatcher registers
        stage wrappers remaining parents) := by
  simp [FiniteController.seekMutation, positiveClockMutation_count,
    positiveClockMutation_step]

/-- Root-level positive clock mutations have a derived exact silence certificate. -/
theorem positiveClockMutation_silentRoot
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (stage wrappers remaining : Nat) :
    SilentEvidence program dispatcher.tree .clock
      (positiveClockMutationConfiguration program dispatcher registers
        stage wrappers remaining
        [.left (environmentCode
          (compileActions program dispatcher.tree) bits)]).cursor.erase := by
  apply SilentEvidence.ofState
  apply SilentState.clockGrowth (.here _)
    stage wrappers remaining (word bits)
  rw [show
    (positiveClockMutationConfiguration program dispatcher registers
      stage wrappers remaining
      [.left (environmentCode
        (compileActions program dispatcher.tree) bits)]).cursor.erase =
      Cursor.rebuild
        [.left (environmentCode
          (compileActions program dispatcher.tree) bits)]
        (clockGrowthCore stage (wrappers + 1) remaining) by
          exact erase_clockGrowth_after stage wrappers remaining _]
  simp [CheckpointDecoder.openEnvironment_word]
  rfl

/--
The uniform positive clock post-state carries the exact script PC, zipper,
register interpretation, and direct decoder-silence certificate.
-/
theorem positiveClockMutation_holds
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (stage wrappers remaining : Nat) (parents : List ParentFrame)
    (registersCoherent :
      RegistersCoherent registers phase scanned emptyMode)
    (silent : SilentEvidence program dispatcher.tree .clock
      (positiveClockMutationConfiguration program dispatcher registers
        stage wrappers remaining parents).cursor.erase) :
    Holds program dispatcher
      (positiveClockMutationConfiguration program dispatcher registers
        stage wrappers remaining parents) := by
  let origin : Cursor :=
    ⟨.app (C (remaining + 1)) (C stage),
      PrimitiveClock.wrapperParents stage wrappers parents⟩
  let current : Cursor :=
    ⟨.app (.app .s (C stage)) (.app (C remaining) (C stage)),
      PrimitiveClock.wrapperParents stage wrappers parents⟩
  let endpoint : Cursor :=
    ⟨.app (C remaining) (C stage),
      .right (.app .s (C stage)) ::
        PrimitiveClock.wrapperParents stage wrappers parents⟩
  let first := SchedulerControl.firstScriptPC program dispatcher
    SchedulerControl.ScriptJob.clockPositive
  let next := SchedulerControl.nextScriptPC program dispatcher
    SchedulerControl.ScriptJob.clockPositive first (by
      change 0 < 2
      exact Nat.zero_lt_succ 1)
  exact .intro (.script .clockPositive next registers) rfl
    phase scanned emptyMode registersCoherent
    (ControlPosition.script
      (origin := origin) (endpoint := endpoint)
      rfl rfl ⟨endpoint, rfl⟩)
    (.clock (.silent silent))

/-- Cursor on the residual clock pair after the positive script's final `R`. -/
def clockResidualCursor
    (stage wrappers remaining : Nat) (parents : List ParentFrame) : Cursor :=
  ⟨.app (C remaining) (C stage),
    PrimitiveClock.wrapperParents stage wrappers parents⟩

/-- The remaining `R` and epsilon row restore the clock-growth macro mode. -/
theorem run_positiveClockSuffix
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program)
    (stage wrappers remaining : Nat) (parents : List ParentFrame) :
    FiniteController.run (SchedulerControl.machine program dispatcher) 2
        (positiveClockMutationConfiguration program dispatcher registers
          stage wrappers remaining parents) =
      ⟨some (.macro .clockGrow registers),
        clockResidualCursor stage (wrappers + 1) remaining parents⟩ := by
  let first := SchedulerControl.firstScriptPC program dispatcher
    SchedulerControl.ScriptJob.clockPositive
  let next := SchedulerControl.nextScriptPC program dispatcher
    SchedulerControl.ScriptJob.clockPositive first (by
      change 0 < 2
      exact Nat.zero_lt_succ 1)
  let before : Cursor :=
    ⟨.app (.app .s (C stage)) (.app (C remaining) (C stage)),
      PrimitiveClock.wrapperParents stage wrappers parents⟩
  let after : Cursor :=
    ⟨.app (C remaining) (C stage),
      .right (.app .s (C stage)) ::
        PrimitiveClock.wrapperParents stage wrappers parents⟩
  have run := SchedulerExecution.run_script_suffix program dispatcher
    .clockPositive registers next 1 before after rfl rfl
  simpa [positiveClockMutationConfiguration, clockResidualCursor,
    before, after, wrapperParents_push] using! run

/-- The post-contraction `R` and script-exit rows contain no further mutation. -/
theorem runMutationCount_positiveClockSuffix
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program)
    (stage wrappers remaining : Nat) (parents : List ParentFrame) :
    FiniteController.runMutationCount
        (SchedulerControl.machine program dispatcher) 2
        (positiveClockMutationConfiguration program dispatcher registers
          stage wrappers remaining parents) = 0 := by
  let first := SchedulerControl.firstScriptPC program dispatcher
    SchedulerControl.ScriptJob.clockPositive
  let next := SchedulerControl.nextScriptPC program dispatcher
    SchedulerControl.ScriptJob.clockPositive first (by
      change 0 < 2
      exact Nat.zero_lt_succ 1)
  let before : Cursor :=
    ⟨.app (.app .s (C stage)) (.app (C remaining) (C stage)),
      PrimitiveClock.wrapperParents stage wrappers parents⟩
  let after : Cursor :=
    ⟨.app (C remaining) (C stage),
      .right (.app .s (C stage)) ::
        PrimitiveClock.wrapperParents stage wrappers parents⟩
  have count := SchedulerExecution.runMutationCount_script_suffix
    program dispatcher .clockPositive registers next 1 before after rfl rfl
  simpa [positiveClockMutationConfiguration, before, after] using! count

/-- The clock-growth macro row starts the successor guard without moving. -/
theorem step_clockResidual_startProbe
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program)
    (stage wrappers remaining : Nat) (parents : List ParentFrame) :
    FiniteController.step (SchedulerControl.machine program dispatcher)
        ⟨some (.macro .clockGrow registers),
          clockResidualCursor stage wrappers remaining parents⟩ =
      ⟨some (SchedulerControl.startProbe .clockSuccessor registers),
        clockResidualCursor stage wrappers remaining parents⟩ := by
  rfl

/-- A positive residual pair satisfies the successor guard literally. -/
theorem clockResidual_successorAnswer
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (stage wrappers remaining : Nat) (parents : List ParentFrame) :
    SchedulerControl.compiledProbeAnswer program dispatcher .clockSuccessor
      (clockResidualCursor stage wrappers (remaining + 1) parents) = true := by
  rfl

/-- The compiled successor guard reaches the next positive clock script. -/
theorem run_clockResidual_successor
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program)
    (stage wrappers remaining : Nat) (parents : List ParentFrame) :
    FiniteController.run (SchedulerControl.machine program dispatcher)
        (SchedulerControl.compiledProbeCost program dispatcher .clockSuccessor
          (clockResidualCursor stage wrappers (remaining + 1) parents))
        ⟨some (SchedulerControl.startProbe .clockSuccessor registers),
          clockResidualCursor stage wrappers (remaining + 1) parents⟩ =
      positiveClockSourceConfiguration program dispatcher registers
        stage wrappers remaining parents := by
  have run := SchedulerExecution.run_localProbe program dispatcher
    (.clockSuccessor) registers
    (clockResidualCursor stage wrappers (remaining + 1) parents) rfl
  simpa [clockResidual_successorAnswer,
    positiveClockSourceConfiguration, clockResidualCursor] using! run

/-- Computable nonmutating-prefix bound between consecutive positive clock rows. -/
def positiveClockNextPrefixTicks
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (stage wrappers remaining : Nat) (parents : List ParentFrame) : Nat :=
  3 + SchedulerControl.compiledProbeCost program dispatcher .clockSuccessor
    (clockResidualCursor stage (wrappers + 1) (remaining + 1) parents)

/-- A positive clock sample with positive residual fuel reaches the next `Rdx` row. -/
theorem run_positiveClockToNextSource
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program)
    (stage wrappers remaining : Nat) (parents : List ParentFrame) :
    FiniteController.run (SchedulerControl.machine program dispatcher)
        (positiveClockNextPrefixTicks program dispatcher
          stage wrappers remaining parents)
        (positiveClockMutationConfiguration program dispatcher registers
          stage wrappers (remaining + 1) parents) =
      positiveClockSourceConfiguration program dispatcher registers
        stage (wrappers + 1) remaining parents := by
  unfold positiveClockNextPrefixTicks
  rw [show 3 + SchedulerControl.compiledProbeCost program dispatcher
      .clockSuccessor
      (clockResidualCursor stage (wrappers + 1) (remaining + 1) parents) =
      (2 + 1) + SchedulerControl.compiledProbeCost program dispatcher
        .clockSuccessor
        (clockResidualCursor stage (wrappers + 1) (remaining + 1) parents) by
    rfl]
  rw [FiniteController.run_add, FiniteController.run_add]
  rw [run_positiveClockSuffix]
  change FiniteController.run (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher .clockSuccessor
        (clockResidualCursor stage (wrappers + 1) (remaining + 1) parents))
      (FiniteController.step (SchedulerControl.machine program dispatcher)
        ⟨some (.macro .clockGrow registers),
          clockResidualCursor stage (wrappers + 1) (remaining + 1) parents⟩) = _
  rw [step_clockResidual_startProbe]
  exact run_clockResidual_successor program dispatcher registers
    stage (wrappers + 1) remaining parents

/-- The exact inter-contraction path for a positive residual is mutation-free. -/
theorem positiveClockToNext_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program)
    (stage wrappers remaining : Nat) (parents : List ParentFrame) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (positiveClockNextPrefixTicks program dispatcher
        stage wrappers remaining parents)
      (positiveClockMutationConfiguration program dispatcher registers
        stage wrappers (remaining + 1) parents)
      (positiveClockSourceConfiguration program dispatcher registers
        stage (wrappers + 1) remaining parents) := by
  let residual := clockResidualCursor stage (wrappers + 1)
    (remaining + 1) parents
  let grow : Configuration program dispatcher :=
    ⟨some (.macro .clockGrow registers), residual⟩
  let probe : Configuration program dispatcher :=
    ⟨some (SchedulerControl.startProbe .clockSuccessor registers), residual⟩
  have suffix : ZeroMutationRun
      (SchedulerControl.machine program dispatcher) 2
      (positiveClockMutationConfiguration program dispatcher registers
        stage wrappers (remaining + 1) parents) grow := by
    exact ⟨run_positiveClockSuffix program dispatcher registers
        stage wrappers (remaining + 1) parents,
      runMutationCount_positiveClockSuffix program dispatcher registers
        stage wrappers (remaining + 1) parents⟩
  have startProbe : ZeroMutationRun
      (SchedulerControl.machine program dispatcher) 1 grow probe := by
    exact ⟨step_clockResidual_startProbe program dispatcher registers
        stage (wrappers + 1) (remaining + 1) parents,
      rfl⟩
  have probeRun : ZeroMutationRun
      (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher .clockSuccessor
        residual)
      probe
      (positiveClockSourceConfiguration program dispatcher registers
        stage (wrappers + 1) remaining parents) := by
    exact ⟨run_clockResidual_successor program dispatcher registers
        stage (wrappers + 1) remaining parents,
      SchedulerExecution.runMutationCount_localProbe program dispatcher
        (.clockSuccessor) registers residual rfl⟩
  simpa [positiveClockNextPrefixTicks, residual] using
    ((suffix.trans startProbe).trans probeRun)

/-- The positive residual's next mutating row is found by executable search. -/
theorem positiveClockMutation_seekNext
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program)
    (stage wrappers remaining : Nat) (parents : List ParentFrame) :
    FiniteController.seekMutation (SchedulerControl.machine program dispatcher)
        (positiveClockNextPrefixTicks program dispatcher
          stage wrappers remaining parents + 1)
        (positiveClockMutationConfiguration program dispatcher registers
          stage wrappers (remaining + 1) parents) =
      some (positiveClockMutationConfiguration program dispatcher registers
        stage (wrappers + 1) remaining parents) := by
  have found := seekMutation_after_zero_prefix
    (SchedulerControl.machine program dispatcher)
    (positiveClockNextPrefixTicks program dispatcher
      stage wrappers remaining parents)
    (positiveClockMutationConfiguration program dispatcher registers
      stage wrappers (remaining + 1) parents)
    (positiveClockToNext_zeroRun program dispatcher registers
      stage wrappers remaining parents).count_eq
    (by
      rw [(positiveClockToNext_zeroRun program dispatcher registers
        stage wrappers remaining parents).run_eq]
      exact positiveClockMutation_count program dispatcher registers
        stage (wrappers + 1) remaining parents)
  rw [(positiveClockToNext_zeroRun program dispatcher registers
      stage wrappers remaining parents).run_eq,
    positiveClockMutation_step] at found
  exact found

/-- Consecutive positive clock samples are linked by one exact final mutation. -/
theorem run_positiveClockToNextMutation
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program)
    (stage wrappers remaining : Nat) (parents : List ParentFrame) :
    FiniteController.run (SchedulerControl.machine program dispatcher)
        (positiveClockNextPrefixTicks program dispatcher
          stage wrappers remaining parents + 1)
        (positiveClockMutationConfiguration program dispatcher registers
          stage wrappers (remaining + 1) parents) =
      positiveClockMutationConfiguration program dispatcher registers
        stage (wrappers + 1) remaining parents := by
  rw [FiniteController.run_add, run_positiveClockToNextSource]
  change FiniteController.step (SchedulerControl.machine program dispatcher)
      (positiveClockSourceConfiguration program dispatcher registers
        stage (wrappers + 1) remaining parents) = _
  exact positiveClockMutation_step program dispatcher registers
    stage (wrappers + 1) remaining parents

/-! ### Uniform zero-clock mutation row -/

/-- The unique zero residual pair at the bottom of an exact wrapper zipper. -/
def zeroClockSourceConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program)
    (stage wrappers : Nat) (parents : List ParentFrame) :
    Configuration program dispatcher :=
  ⟨some (SchedulerControl.startScript .clockZero registers),
    ⟨.app (C 0) (C stage),
      PrimitiveClock.wrapperParents stage wrappers parents⟩⟩

/-- Post-`Rdx` state after closing the residual zero clock pair. -/
def zeroClockMutationConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program)
    (stage wrappers : Nat) (parents : List ParentFrame) :
    Configuration program dispatcher :=
  let first := SchedulerControl.firstScriptPC program dispatcher
    SchedulerControl.ScriptJob.clockZero
  let final := SchedulerControl.nextScriptPC program dispatcher
    SchedulerControl.ScriptJob.clockZero first (by
      change 0 < 1
      exact Nat.zero_lt_succ 0)
  ⟨some (.script .clockZero final registers),
    ⟨clockBase stage,
      PrimitiveClock.wrapperParents stage wrappers parents⟩⟩

/-- A zero residual pair fails the successor guard literally. -/
theorem clockResidual_notSuccessorAnswer
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (stage wrappers : Nat) (parents : List ParentFrame) :
    SchedulerControl.compiledProbeAnswer program dispatcher .clockSuccessor
      (clockResidualCursor stage wrappers 0 parents) = false := by
  rfl

/-- The same zero residual pair satisfies the exact zero guard. -/
theorem clockResidual_zeroAnswer
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (stage wrappers : Nat) (parents : List ParentFrame) :
    SchedulerControl.compiledProbeAnswer program dispatcher .clockZero
      (clockResidualCursor stage wrappers 0 parents) = true := by
  rfl

/-- The failed successor guard transfers to the zero guard root. -/
theorem run_clockResidual_notSuccessor
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program)
    (stage wrappers : Nat) (parents : List ParentFrame) :
    FiniteController.run (SchedulerControl.machine program dispatcher)
        (SchedulerControl.compiledProbeCost program dispatcher .clockSuccessor
          (clockResidualCursor stage wrappers 0 parents))
        ⟨some (SchedulerControl.startProbe .clockSuccessor registers),
          clockResidualCursor stage wrappers 0 parents⟩ =
      ⟨some (SchedulerControl.startProbe .clockZero registers),
        clockResidualCursor stage wrappers 0 parents⟩ := by
  have run := SchedulerExecution.run_localProbe program dispatcher
    (.clockSuccessor) registers
    (clockResidualCursor stage wrappers 0 parents) rfl
  simpa [clockResidual_notSuccessorAnswer] using! run

/-- The compiled zero guard reaches the closing clock script. -/
theorem run_clockResidual_zero
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program)
    (stage wrappers : Nat) (parents : List ParentFrame) :
    FiniteController.run (SchedulerControl.machine program dispatcher)
        (SchedulerControl.compiledProbeCost program dispatcher .clockZero
          (clockResidualCursor stage wrappers 0 parents))
        ⟨some (SchedulerControl.startProbe .clockZero registers),
          clockResidualCursor stage wrappers 0 parents⟩ =
      zeroClockSourceConfiguration program dispatcher registers
        stage wrappers parents := by
  have run := SchedulerExecution.run_localProbe program dispatcher
    (.clockZero) registers
    (clockResidualCursor stage wrappers 0 parents) rfl
  simpa [clockResidual_zeroAnswer, zeroClockSourceConfiguration,
    clockResidualCursor] using! run

/-- Computable prefix bound from the last positive row to the closing zero row. -/
def positiveClockToZeroPrefixTicks
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (stage wrappers : Nat) (parents : List ParentFrame) : Nat :=
  3 + SchedulerControl.compiledProbeCost program dispatcher .clockSuccessor
      (clockResidualCursor stage (wrappers + 1) 0 parents) +
    SchedulerControl.compiledProbeCost program dispatcher .clockZero
      (clockResidualCursor stage (wrappers + 1) 0 parents)

/-- The last positive clock sample reaches the exact closing-zero source row. -/
theorem run_positiveClockToZeroSource
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program)
    (stage wrappers : Nat) (parents : List ParentFrame) :
    FiniteController.run (SchedulerControl.machine program dispatcher)
        (positiveClockToZeroPrefixTicks program dispatcher
          stage wrappers parents)
        (positiveClockMutationConfiguration program dispatcher registers
          stage wrappers 0 parents) =
      zeroClockSourceConfiguration program dispatcher registers
        stage (wrappers + 1) parents := by
  unfold positiveClockToZeroPrefixTicks
  rw [show
    3 + SchedulerControl.compiledProbeCost program dispatcher .clockSuccessor
        (clockResidualCursor stage (wrappers + 1) 0 parents) +
        SchedulerControl.compiledProbeCost program dispatcher .clockZero
          (clockResidualCursor stage (wrappers + 1) 0 parents) =
      ((2 + 1) + SchedulerControl.compiledProbeCost program dispatcher
        .clockSuccessor
        (clockResidualCursor stage (wrappers + 1) 0 parents)) +
        SchedulerControl.compiledProbeCost program dispatcher .clockZero
          (clockResidualCursor stage (wrappers + 1) 0 parents) by rfl]
  rw [FiniteController.run_add, FiniteController.run_add,
    FiniteController.run_add]
  rw [run_positiveClockSuffix]
  change FiniteController.run (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher .clockZero
        (clockResidualCursor stage (wrappers + 1) 0 parents))
      (FiniteController.run (SchedulerControl.machine program dispatcher)
        (SchedulerControl.compiledProbeCost program dispatcher .clockSuccessor
          (clockResidualCursor stage (wrappers + 1) 0 parents))
        (FiniteController.step (SchedulerControl.machine program dispatcher)
          ⟨some (.macro .clockGrow registers),
            clockResidualCursor stage (wrappers + 1) 0 parents⟩)) = _
  rw [step_clockResidual_startProbe, run_clockResidual_notSuccessor,
    run_clockResidual_zero]

/-- The exact path from the last positive row to the closing source is mutation-free. -/
theorem positiveClockToZero_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program)
    (stage wrappers : Nat) (parents : List ParentFrame) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (positiveClockToZeroPrefixTicks program dispatcher stage wrappers parents)
      (positiveClockMutationConfiguration program dispatcher registers
        stage wrappers 0 parents)
      (zeroClockSourceConfiguration program dispatcher registers
        stage (wrappers + 1) parents) := by
  let residual := clockResidualCursor stage (wrappers + 1) 0 parents
  let grow : Configuration program dispatcher :=
    ⟨some (.macro .clockGrow registers), residual⟩
  let successorProbe : Configuration program dispatcher :=
    ⟨some (SchedulerControl.startProbe .clockSuccessor registers), residual⟩
  let zeroProbe : Configuration program dispatcher :=
    ⟨some (SchedulerControl.startProbe .clockZero registers), residual⟩
  have suffix : ZeroMutationRun
      (SchedulerControl.machine program dispatcher) 2
      (positiveClockMutationConfiguration program dispatcher registers
        stage wrappers 0 parents) grow := by
    exact ⟨run_positiveClockSuffix program dispatcher registers
        stage wrappers 0 parents,
      runMutationCount_positiveClockSuffix program dispatcher registers
        stage wrappers 0 parents⟩
  have startProbe : ZeroMutationRun
      (SchedulerControl.machine program dispatcher) 1 grow successorProbe := by
    exact ⟨step_clockResidual_startProbe program dispatcher registers
        stage (wrappers + 1) 0 parents,
      rfl⟩
  have successor : ZeroMutationRun
      (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher .clockSuccessor
        residual)
      successorProbe zeroProbe := by
    exact ⟨run_clockResidual_notSuccessor program dispatcher registers
        stage (wrappers + 1) parents,
      SchedulerExecution.runMutationCount_localProbe program dispatcher
        (.clockSuccessor) registers residual rfl⟩
  have zero : ZeroMutationRun
      (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher .clockZero residual)
      zeroProbe
      (zeroClockSourceConfiguration program dispatcher registers
        stage (wrappers + 1) parents) := by
    exact ⟨run_clockResidual_zero program dispatcher registers
        stage (wrappers + 1) parents,
      SchedulerExecution.runMutationCount_localProbe program dispatcher
        (.clockZero) registers residual rfl⟩
  simpa [positiveClockToZeroPrefixTicks, residual] using
    (((suffix.trans startProbe).trans successor).trans zero)

/-- The last positive clock sample reaches the exact closing mutation. -/
theorem run_positiveClockToZeroMutation
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program)
    (stage wrappers : Nat) (parents : List ParentFrame) :
    FiniteController.run (SchedulerControl.machine program dispatcher)
        (positiveClockToZeroPrefixTicks program dispatcher
          stage wrappers parents + 1)
        (positiveClockMutationConfiguration program dispatcher registers
          stage wrappers 0 parents) =
      zeroClockMutationConfiguration program dispatcher registers
        stage (wrappers + 1) parents := by
  rw [FiniteController.run_add, run_positiveClockToZeroSource]
  change FiniteController.step (SchedulerControl.machine program dispatcher)
      (zeroClockSourceConfiguration program dispatcher registers
        stage (wrappers + 1) parents) = _
  rfl

/-- The zero clock row is exactly its closing `Rdx`. -/
theorem zeroClockMutation_step
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program)
    (stage wrappers : Nat) (parents : List ParentFrame) :
    FiniteController.step (SchedulerControl.machine program dispatcher)
        (zeroClockSourceConfiguration program dispatcher registers
          stage wrappers parents) =
      zeroClockMutationConfiguration program dispatcher registers
        stage wrappers parents := by
  rfl

/-- Closing the residual zero clock pair contributes one mutation. -/
theorem zeroClockMutation_count
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program)
    (stage wrappers : Nat) (parents : List ParentFrame) :
    FiniteController.mutationCount (SchedulerControl.machine program dispatcher)
        (zeroClockSourceConfiguration program dispatcher registers
          stage wrappers parents) = 1 := by
  rfl

/-- Executable bounded search finds the closing clock mutation in one row. -/
theorem zeroClockMutation_seek
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program)
    (stage wrappers : Nat) (parents : List ParentFrame) :
    FiniteController.seekMutation (SchedulerControl.machine program dispatcher) 1
        (zeroClockSourceConfiguration program dispatcher registers
          stage wrappers parents) =
      some (zeroClockMutationConfiguration program dispatcher registers
        stage wrappers parents) := by
  simp [FiniteController.seekMutation, zeroClockMutation_count,
    zeroClockMutation_step]

/-- Executable search finds the closing zero-clock contraction exactly. -/
theorem positiveClockMutation_seekZero
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program)
    (stage wrappers : Nat) (parents : List ParentFrame) :
    FiniteController.seekMutation (SchedulerControl.machine program dispatcher)
        (positiveClockToZeroPrefixTicks program dispatcher
          stage wrappers parents + 1)
        (positiveClockMutationConfiguration program dispatcher registers
          stage wrappers 0 parents) =
      some (zeroClockMutationConfiguration program dispatcher registers
        stage (wrappers + 1) parents) := by
  have found := seekMutation_after_zero_prefix
    (SchedulerControl.machine program dispatcher)
    (positiveClockToZeroPrefixTicks program dispatcher stage wrappers parents)
    (positiveClockMutationConfiguration program dispatcher registers
      stage wrappers 0 parents)
    (positiveClockToZero_zeroRun program dispatcher registers
      stage wrappers parents).count_eq
    (by
      rw [(positiveClockToZero_zeroRun program dispatcher registers
        stage wrappers parents).run_eq]
      exact zeroClockMutation_count program dispatcher registers
        stage (wrappers + 1) parents)
  rw [(positiveClockToZero_zeroRun program dispatcher registers
      stage wrappers parents).run_eq,
    zeroClockMutation_step] at found
  exact found

/-- One complete positive-to-positive sample segment contains exactly one mutation. -/
theorem runMutationCount_positiveClockToNextMutation
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program)
    (stage wrappers remaining : Nat) (parents : List ParentFrame) :
    FiniteController.runMutationCount
        (SchedulerControl.machine program dispatcher)
        (positiveClockNextPrefixTicks program dispatcher
          stage wrappers remaining parents + 1)
        (positiveClockMutationConfiguration program dispatcher registers
          stage wrappers (remaining + 1) parents) = 1 := by
  rw [FiniteController.runMutationCount_add,
    (positiveClockToNext_zeroRun program dispatcher registers
      stage wrappers remaining parents).count_eq,
    (positiveClockToNext_zeroRun program dispatcher registers
      stage wrappers remaining parents).run_eq]
  simp only [Nat.zero_add, FiniteController.runMutationCount]
  rw [positiveClockMutation_count]

/-- One complete positive-to-zero sample segment contains exactly one mutation. -/
theorem runMutationCount_positiveClockToZeroMutation
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program)
    (stage wrappers : Nat) (parents : List ParentFrame) :
    FiniteController.runMutationCount
        (SchedulerControl.machine program dispatcher)
        (positiveClockToZeroPrefixTicks program dispatcher
          stage wrappers parents + 1)
        (positiveClockMutationConfiguration program dispatcher registers
          stage wrappers 0 parents) = 1 := by
  rw [FiniteController.runMutationCount_add,
    (positiveClockToZero_zeroRun program dispatcher registers
      stage wrappers parents).count_eq,
    (positiveClockToZero_zeroRun program dispatcher registers
      stage wrappers parents).run_eq]
  simp only [Nat.zero_add, FiniteController.runMutationCount]
  rw [zeroClockMutation_count]

/-! ### Recursive clock-phase certificate -/

/-- Exact microtick cost from one positive clock sample through its closing row. -/
def clockTailTicks
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (stage wrappers : Nat) (parents : List ParentFrame) : Nat → Nat
  | 0 => positiveClockToZeroPrefixTicks program dispatcher
      stage wrappers parents + 1
  | remaining + 1 =>
      positiveClockNextPrefixTicks program dispatcher
          stage wrappers remaining parents + 1 +
        clockTailTicks program dispatcher stage (wrappers + 1) parents remaining

/-- The recursive positive-clock tail reaches its exact completed wrapper depth. -/
theorem run_clockTail
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (stage : Nat)
    (parents : List ParentFrame) :
    ∀ wrappers remaining,
      FiniteController.run (SchedulerControl.machine program dispatcher)
          (clockTailTicks program dispatcher stage wrappers parents remaining)
          (positiveClockMutationConfiguration program dispatcher registers
            stage wrappers remaining parents) =
        zeroClockMutationConfiguration program dispatcher registers
          stage (wrappers + remaining + 1) parents
  | wrappers, 0 => by
      simpa [clockTailTicks] using
        run_positiveClockToZeroMutation program dispatcher registers
          stage wrappers parents
  | wrappers, remaining + 1 => by
      rw [clockTailTicks, FiniteController.run_add,
        run_positiveClockToNextMutation]
      have tail := run_clockTail program dispatcher registers stage parents
        (wrappers + 1) remaining
      simpa [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm] using tail

/-- The recursive positive-clock tail performs exactly one mutation per residual. -/
theorem runMutationCount_clockTail
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (stage : Nat)
    (parents : List ParentFrame) :
    ∀ wrappers remaining,
      FiniteController.runMutationCount
          (SchedulerControl.machine program dispatcher)
          (clockTailTicks program dispatcher stage wrappers parents remaining)
          (positiveClockMutationConfiguration program dispatcher registers
            stage wrappers remaining parents) = remaining + 1
  | wrappers, 0 => by
      simpa [clockTailTicks] using
        runMutationCount_positiveClockToZeroMutation program dispatcher registers
          stage wrappers parents
  | wrappers, remaining + 1 => by
      rw [clockTailTicks, FiniteController.runMutationCount_add,
        runMutationCount_positiveClockToNextMutation,
        run_positiveClockToNextMutation]
      rw [runMutationCount_clockTail program dispatcher registers stage parents
        (wrappers + 1) remaining]
      exact Nat.add_comm 1 (remaining + 1)

/-- Exact scheduler source selected for a clock stage. -/
def clockPhaseSourceConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (parents : List ParentFrame) :
    (stage : Nat) → Configuration program dispatcher
  | 0 => zeroClockSourceConfiguration program dispatcher registers 0 0 parents
  | stage + 1 => positiveClockSourceConfiguration program dispatcher registers
      (stage + 1) 0 stage parents

/-- Exact completed clock state, with one wrapper for each positive carrier row. -/
def clockPhaseCompletedConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (stage : Nat)
    (parents : List ParentFrame) : Configuration program dispatcher :=
  zeroClockMutationConfiguration program dispatcher registers
    stage stage parents

/-- Computable microtick cost of the complete syntax-directed clock phase. -/
def clockPhaseTicks
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (parents : List ParentFrame) : Nat → Nat
  | 0 => 1
  | stage + 1 => 1 + clockTailTicks program dispatcher
      (stage + 1) 0 parents stage

/-- The finite controller executes every clock stage to its exact wrapper spine. -/
theorem executeClock_run
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (parents : List ParentFrame) :
    ∀ stage,
      FiniteController.run (SchedulerControl.machine program dispatcher)
          (clockPhaseTicks program dispatcher parents stage)
          (clockPhaseSourceConfiguration program dispatcher registers
            parents stage) =
        clockPhaseCompletedConfiguration program dispatcher registers
          stage parents
  | 0 => by
      rfl
  | stage + 1 => by
      rw [clockPhaseTicks, FiniteController.run_add]
      change FiniteController.run (SchedulerControl.machine program dispatcher)
          (clockTailTicks program dispatcher (stage + 1) 0 parents stage)
          (FiniteController.step (SchedulerControl.machine program dispatcher)
            (positiveClockSourceConfiguration program dispatcher registers
              (stage + 1) 0 stage parents)) = _
      rw [positiveClockMutation_step]
      have tail := run_clockTail program dispatcher registers (stage + 1)
        parents 0 stage
      simpa [clockPhaseCompletedConfiguration] using tail

/-- The complete clock phase has exactly the structural count `stage + 1`. -/
theorem executeClock_mutationCount
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (parents : List ParentFrame) :
    ∀ stage,
      FiniteController.runMutationCount
          (SchedulerControl.machine program dispatcher)
          (clockPhaseTicks program dispatcher parents stage)
          (clockPhaseSourceConfiguration program dispatcher registers
            parents stage) = stage + 1
  | 0 => by
      rfl
  | stage + 1 => by
      rw [clockPhaseTicks, FiniteController.runMutationCount_add]
      change FiniteController.runMutationCount
          (SchedulerControl.machine program dispatcher) 1
          (positiveClockSourceConfiguration program dispatcher registers
            (stage + 1) 0 stage parents) +
        FiniteController.runMutationCount
          (SchedulerControl.machine program dispatcher)
          (clockTailTicks program dispatcher (stage + 1) 0 parents stage)
          (FiniteController.run (SchedulerControl.machine program dispatcher) 1
            (positiveClockSourceConfiguration program dispatcher registers
              (stage + 1) 0 stage parents)) = stage + 1 + 1
      simp only [FiniteController.runMutationCount,
        positiveClockMutation_count, Nat.add_zero]
      rw [show FiniteController.run (SchedulerControl.machine program dispatcher) 1
          (positiveClockSourceConfiguration program dispatcher registers
            (stage + 1) 0 stage parents) =
        positiveClockMutationConfiguration program dispatcher registers
          (stage + 1) 0 stage parents by
          change FiniteController.step
            (SchedulerControl.machine program dispatcher)
            (positiveClockSourceConfiguration program dispatcher registers
              (stage + 1) 0 stage parents) = _
          exact positiveClockMutation_step program dispatcher registers
            (stage + 1) 0 stage parents,
        runMutationCount_clockTail program dispatcher registers (stage + 1)
          parents 0 stage]
      exact Nat.add_comm 1 (stage + 1)

/--
Contraction-sampled trace of a residual positive clock.  Each constructor
contains the executable bounded-search result for its next sample; the tail
therefore supplies productivity without choosing an abstract reduction.
-/
inductive ClockTailSamples
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (stage : Nat)
    (parents : List ParentFrame) : Nat → Nat → Prop where
  | zero (wrappers : Nat)
      (found : FiniteController.seekMutation
        (SchedulerControl.machine program dispatcher)
        (positiveClockToZeroPrefixTicks program dispatcher
          stage wrappers parents + 1)
        (positiveClockMutationConfiguration program dispatcher registers
          stage wrappers 0 parents) =
        some (zeroClockMutationConfiguration program dispatcher registers
          stage (wrappers + 1) parents)) :
      ClockTailSamples program dispatcher registers stage parents wrappers 0
  | succ (wrappers remaining : Nat)
      (found : FiniteController.seekMutation
        (SchedulerControl.machine program dispatcher)
        (positiveClockNextPrefixTicks program dispatcher
          stage wrappers remaining parents + 1)
        (positiveClockMutationConfiguration program dispatcher registers
          stage wrappers (remaining + 1) parents) =
        some (positiveClockMutationConfiguration program dispatcher registers
          stage (wrappers + 1) remaining parents))
      (tail : ClockTailSamples program dispatcher registers stage parents
        (wrappers + 1) remaining) :
      ClockTailSamples program dispatcher registers stage parents
        wrappers (remaining + 1)

/-- Every residual positive clock has a finite exact sampled trace to closure. -/
theorem clockTailSamples
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (stage : Nat)
    (parents : List ParentFrame) :
    ∀ wrappers remaining,
      ClockTailSamples program dispatcher registers stage parents
        wrappers remaining
  | wrappers, 0 =>
      .zero wrappers
        (positiveClockMutation_seekZero program dispatcher registers
          stage wrappers parents)
  | wrappers, remaining + 1 =>
      .succ wrappers remaining
        (positiveClockMutation_seekNext program dispatcher registers
          stage wrappers remaining parents)
        (clockTailSamples program dispatcher registers stage parents
          (wrappers + 1) remaining)

/-- Sample trace of a whole clock phase, including its first contraction. -/
inductive ClockPhaseSamples
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (parents : List ParentFrame) : Nat → Prop where
  | zero
      (found : FiniteController.seekMutation
        (SchedulerControl.machine program dispatcher) 1
        (zeroClockSourceConfiguration program dispatcher registers 0 0 parents) =
        some (zeroClockMutationConfiguration program dispatcher registers
          0 0 parents)) :
      ClockPhaseSamples program dispatcher registers parents 0
  | succ (stage : Nat)
      (found : FiniteController.seekMutation
        (SchedulerControl.machine program dispatcher) 1
        (positiveClockSourceConfiguration program dispatcher registers
          (stage + 1) 0 stage parents) =
        some (positiveClockMutationConfiguration program dispatcher registers
          (stage + 1) 0 stage parents))
      (tail : ClockTailSamples program dispatcher registers (stage + 1)
        parents 0 stage) :
      ClockPhaseSamples program dispatcher registers parents (stage + 1)

/-- The complete clock execution exposes every one of its exact sampled states. -/
theorem executeClock_samples
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (parents : List ParentFrame) :
    ∀ stage, ClockPhaseSamples program dispatcher registers parents stage
  | 0 => .zero (zeroClockMutation_seek program dispatcher registers 0 0 parents)
  | stage + 1 =>
      .succ stage
        (positiveClockMutation_seek program dispatcher registers
          (stage + 1) 0 stage parents)
        (clockTailSamples program dispatcher registers (stage + 1) parents
          0 stage)

/--
Load-bearing clock-phase certificate: exact controller endpoint, exact
contraction delta, every executable contraction sample, and the induced
pure-S reduction of the erased occurrence tree.
-/
structure ClockExecution
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (stage : Nat)
    (parents : List ParentFrame) : Prop where
  run_eq : FiniteController.run (SchedulerControl.machine program dispatcher)
      (clockPhaseTicks program dispatcher parents stage)
      (clockPhaseSourceConfiguration program dispatcher registers parents stage) =
    clockPhaseCompletedConfiguration program dispatcher registers stage parents
  mutationCount_eq : FiniteController.runMutationCount
      (SchedulerControl.machine program dispatcher)
      (clockPhaseTicks program dispatcher parents stage)
      (clockPhaseSourceConfiguration program dispatcher registers parents stage) =
    stage + 1
  samples : ClockPhaseSamples program dispatcher registers parents stage
  reduction : StepsN (stage + 1)
      (clockPhaseSourceConfiguration program dispatcher registers
        parents stage).cursor.erase
      (clockPhaseCompletedConfiguration program dispatcher registers
        stage parents).cursor.erase

/-- Construct the complete clock-phase certificate for every stage and context. -/
theorem executeClock
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (stage : Nat)
    (parents : List ParentFrame) :
    ClockExecution program dispatcher registers stage parents := by
  have runEq := executeClock_run program dispatcher registers parents stage
  have countEq := executeClock_mutationCount program dispatcher registers
    parents stage
  have projected := FiniteController.run_projects_stepsN
    (SchedulerControl.machine program dispatcher)
    (clockPhaseTicks program dispatcher parents stage)
    (clockPhaseSourceConfiguration program dispatcher registers parents stage)
  rw [countEq, runEq] at projected
  exact ⟨runEq, countEq,
    executeClock_samples program dispatcher registers parents stage,
    projected⟩

/-- Erasure after the zero row is the exact completed wrapper spine. -/
theorem zeroClockMutation_erase
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program)
    (stage wrappers : Nat) (parents : List ParentFrame) :
    (zeroClockMutationConfiguration program dispatcher registers
        stage wrappers parents).cursor.erase =
      Cursor.rebuild parents (clockWrap stage wrappers (clockBase stage)) := by
  exact rebuild_wrapperParents stage wrappers (clockBase stage) parents

/-- The scheduler's endpoint-first wrapper notation is the public clock spine. -/
theorem clockWrap_clockBase_eq_clockWrappers
    (stage wrappers : Nat) :
    clockWrap stage wrappers (clockBase stage) =
      clockWrappers stage wrappers := by
  induction wrappers with
  | zero => rfl
  | succ wrappers ih =>
      change Term.app (Term.app Term.s (C stage))
          (clockWrap stage wrappers (clockBase stage)) =
        Term.app (Term.app Term.s (C stage)) (clockWrappers stage wrappers)
      exact congrArg
        (fun term => Term.app (Term.app Term.s (C stage)) term) ih

/-- Erasure of a clock-phase source is the exact diagonal carrier occurrence. -/
theorem clockPhaseSource_erase
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (parents : List ParentFrame) :
    ∀ stage,
      (clockPhaseSourceConfiguration program dispatcher registers
        parents stage).cursor.erase =
      Cursor.rebuild parents (.app (C stage) (C stage))
  | 0 => rfl
  | _ + 1 => rfl

/-- Erasure of the completed phase is the exact public wrapper spine. -/
theorem clockPhaseCompleted_erase
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (stage : Nat)
    (parents : List ParentFrame) :
    (clockPhaseCompletedConfiguration program dispatcher registers
      stage parents).cursor.erase =
      Cursor.rebuild parents (clockWrappers stage stage) := by
  rw [show clockPhaseCompletedConfiguration program dispatcher registers
      stage parents =
    zeroClockMutationConfiguration program dispatcher registers
      stage stage parents by rfl]
  rw [zeroClockMutation_erase, clockWrap_clockBase_eq_clockWrappers]

/-- The controller clock certificate projects to equation (17) in any context. -/
theorem executeClock_structural
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (stage : Nat)
    (parents : List ParentFrame) :
    StepsN (stage + 1)
      (Cursor.rebuild parents (.app (C stage) (C stage)))
      (Cursor.rebuild parents (clockWrappers stage stage)) := by
  have reduction :=
    (executeClock program dispatcher registers stage parents).reduction
  rw [clockPhaseSource_erase, clockPhaseCompleted_erase] at reduction
  exact reduction

/-- At the outer environment, the controller realizes the exact dovetail stage expansion. -/
theorem executeClock_stageExpansion
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (stage : Nat) (environment : Term) :
    StepsN (stage + 1)
      (Dovetail.stageSource stage environment)
      (Dovetail.stageExpanded stage environment) := by
  simpa [Dovetail.stageSource, Dovetail.stageExpanded, Dovetail.clockExit]
    using! executeClock_structural program dispatcher registers stage
      [.left environment]

/-- A completed nonempty wrapper spine is a construction-specific silent state. -/
theorem zeroClockMutation_silentWrappedRoot
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (stage wrappers : Nat) :
    SilentEvidence program dispatcher.tree .clock
      (zeroClockMutationConfiguration program dispatcher registers
        stage (wrappers + 1)
        [.left (environmentCode
          (compileActions program dispatcher.tree) bits)]).cursor.erase := by
  apply SilentEvidence.ofState
  apply SilentState.clockCompleteWrapped (.here _)
    stage wrappers (word bits)
  rw [zeroClockMutation_erase]
  simp [CheckpointDecoder.openEnvironment_word]
  rfl

/-- Stage zero closes to the named public staging endpoint. -/
theorem zeroClockMutation_silentStaging
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program) :
    SilentEvidence program dispatcher.tree .clock
      (zeroClockMutationConfiguration program dispatcher registers
        0 0 [.left (environmentCode
          (compileActions program dispatcher.tree) bits)]).cursor.erase := by
  apply SilentEvidence.ofPublic
  apply CheckpointExclusion.Noncheckpoint.clockStaging (.here _)
  exact ⟨word bits, by
    rw [zeroClockMutation_erase]
    simp [clockWrap, Dovetail.clockExit,
      CheckpointDecoder.openEnvironment_word]
    rfl⟩

/-- A positive stage with no wrappers is the named raw terminal endpoint. -/
theorem zeroClockMutation_silentRawTerminal
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (horizon : Nat) :
    SilentEvidence program dispatcher.tree .clock
      (zeroClockMutationConfiguration program dispatcher registers
        (horizon + 1) 0 [.left (environmentCode
          (compileActions program dispatcher.tree) bits)]).cursor.erase := by
  apply SilentEvidence.ofPublic
  apply CheckpointExclusion.Noncheckpoint.clockRawTerminal
  exact ⟨horizon, word bits, by
    rw [zeroClockMutation_erase]
    simp [clockWrap, Dovetail.clockExit,
      CheckpointDecoder.openEnvironment_word]
    rfl⟩

/--
The closing zero-clock post-state carries its terminal script PC, exact
zipper, coherent registers, and supplied construction-specific silence proof.
-/
theorem zeroClockMutation_holds
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (stage wrappers : Nat) (parents : List ParentFrame)
    (registersCoherent :
      RegistersCoherent registers phase scanned emptyMode)
    (silent : SilentEvidence program dispatcher.tree .clock
      (zeroClockMutationConfiguration program dispatcher registers
        stage wrappers parents).cursor.erase) :
    Holds program dispatcher
      (zeroClockMutationConfiguration program dispatcher registers
        stage wrappers parents) := by
  let origin : Cursor :=
    ⟨.app (C 0) (C stage),
      PrimitiveClock.wrapperParents stage wrappers parents⟩
  let current : Cursor :=
    ⟨clockBase stage,
      PrimitiveClock.wrapperParents stage wrappers parents⟩
  let first := SchedulerControl.firstScriptPC program dispatcher
    SchedulerControl.ScriptJob.clockZero
  let final := SchedulerControl.nextScriptPC program dispatcher
    SchedulerControl.ScriptJob.clockZero first (by
      change 0 < 1
      exact Nat.zero_lt_succ 0)
  exact .intro (.script .clockZero final registers) rfl
    phase scanned emptyMode registersCoherent
    (ControlPosition.script
      (origin := origin) (endpoint := current)
      rfl rfl (by trivial))
    (.clock (.silent silent))

/-! ## Recursive fuel-expansion phase -/

/-- Exact cursor at one residual unary fuel call. -/
def fuelCursor (fuel : Nat) (environment continuation : Term)
    (parents : List ParentFrame) : Cursor :=
  ⟨.app (.app (C fuel) environment) continuation, parents⟩

/-- The fuel-family macro state at one residual unary carrier. -/
def fuelPhaseSourceConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (fuel : Nat)
    (environment continuation : Term) (parents : List ParentFrame) :
    Configuration program dispatcher :=
  ⟨some (.macro (.family .fuel) registers),
    fuelCursor fuel environment continuation parents⟩

/-- Exact Base-entry state after all unary fuel layers have been expanded. -/
def fuelPhaseCompletedConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (fuel : Nat)
    (environment continuation : Term) (parents : List ParentFrame) :
    Configuration program dispatcher :=
  ⟨some (.macro (.family .down) registers.clearScan),
    ⟨baseCarrier environment continuation,
      PrimitiveFuel.pendingParents environment continuation fuel parents⟩⟩

/-! ### Exact clock-to-fuel launch bridge -/

/-- One successful wrapper-parent test followed by its literal `U`. -/
def growWrapperStepTicks
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (stage : Nat) (focus : Term) (parents : List ParentFrame) : Nat :=
  (1 + SchedulerControl.compiledProbeCost program dispatcher .growWrapper
    ⟨focus, .right (.app .s (C stage)) :: parents⟩) + 1

/-- A registered clock-wrapper parent satisfies the fixed parent probe. -/
theorem growWrapper_answer
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (stage : Nat) (focus : Term) (parents : List ParentFrame) :
    SchedulerControl.compiledProbeAnswer program dispatcher .growWrapper
      ⟨focus, .right (.app .s (C stage)) :: parents⟩ = true := by
  rfl

/-- The controller ascends one registered clock wrapper without mutation. -/
theorem growWrapperStep_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (stage : Nat) (focus : Term)
    (parents : List ParentFrame) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (growWrapperStepTicks program dispatcher stage focus parents)
      ⟨some (.macro .growUp registers),
        ⟨focus, .right (.app .s (C stage)) :: parents⟩⟩
      ⟨some (.macro .growUp registers),
        ⟨.app (.app .s (C stage)) focus, parents⟩⟩ := by
  let origin : Cursor :=
    ⟨focus, .right (.app .s (C stage)) :: parents⟩
  let probeStart : Configuration program dispatcher :=
    ⟨some (SchedulerControl.startProbe .growWrapper registers), origin⟩
  let moveUp : Configuration program dispatcher :=
    ⟨some (.macro .growMoveUp registers), origin⟩
  let endpoint : Configuration program dispatcher :=
    ⟨some (.macro .growUp registers),
      ⟨.app (.app .s (C stage)) focus, parents⟩⟩
  have enter : ZeroMutationRun (SchedulerControl.machine program dispatcher) 1
      ⟨some (.macro .growUp registers), origin⟩ probeStart :=
    ⟨rfl, rfl⟩
  have probeRun := ZeroMutationRun.parentProbe program dispatcher .growWrapper
    registers origin .right rfl
  have probe : ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher .growWrapper origin)
      probeStart moveUp := by
    simpa [probeStart, moveUp, origin, SchedulerExecution.commandResult,
      SchedulerControl.probeAnswer, growWrapper_answer] using probeRun
  have ascend : ZeroMutationRun (SchedulerControl.machine program dispatcher) 1
      moveUp endpoint := ⟨rfl, rfl⟩
  simpa [growWrapperStepTicks, origin, endpoint] using
    (enter.trans probe).trans ascend

/-- Computable microtick count for returning over all generated wrappers. -/
def growWrappersTicks
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (stage : Nat) : Nat → Term → List ParentFrame → Nat
  | 0, _, _ => 0
  | remaining + 1, focus, parents =>
      growWrapperStepTicks program dispatcher stage focus
          (PrimitiveClock.wrapperParents stage remaining parents) +
        growWrappersTicks program dispatcher stage remaining
          (.app (.app .s (C stage)) focus) parents

/-- The finite controller returns over every generated clock wrapper exactly. -/
theorem growWrappers_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (stage : Nat) :
    ∀ remaining focus parents,
      ZeroMutationRun (SchedulerControl.machine program dispatcher)
        (growWrappersTicks program dispatcher stage remaining focus parents)
        ⟨some (.macro .growUp registers),
          ⟨focus,
            PrimitiveClock.wrapperParents stage remaining parents⟩⟩
        ⟨some (.macro .growUp registers),
          ⟨clockWrap stage remaining focus, parents⟩⟩
  | 0, focus, parents => ⟨rfl, rfl⟩
  | remaining + 1, focus, parents => by
      have first := growWrapperStep_zeroRun program dispatcher registers stage
        focus (PrimitiveClock.wrapperParents stage remaining parents)
      have tail := growWrappers_zeroRun program dispatcher registers stage
        remaining (.app (.app .s (C stage)) focus) parents
      simpa [growWrappersTicks, wrapperParents_push, clockWrap_push] using
        first.trans tail

/-- Root cursor of a fully exposed positive-stage clock exit. -/
def positiveStageRootCursor (stage : Nat) (environment : Term) : Cursor :=
  ⟨Dovetail.clockExit stage stage environment, []⟩

/-- Controller state immediately before the positive-stage launch contraction. -/
def positiveStageArityConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (stage : Nat) (environment : Term) :
    Configuration program dispatcher :=
  ⟨some (.macro (.arityDecision .growth true) registers),
    positiveStageRootCursor stage environment⟩

/-- The non-wrapper parent at the environment boundary fails the wrapper probe. -/
theorem growExit_wrapperAnswer
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (stage : Nat) (environment : Term) :
    SchedulerControl.compiledProbeAnswer program dispatcher .growWrapper
      ⟨clockWrappers stage stage, [.left environment]⟩ = false := by
  rfl

/-- The same boundary satisfies the registered environment-envelope probe. -/
theorem growExit_envelopeAnswer
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (stage : Nat) (bits : List Bool) :
    SchedulerControl.compiledProbeAnswer program dispatcher .growEnvelope
      ⟨clockWrappers stage stage,
        [.left (environmentCode
          (compileActions program dispatcher.tree) bits)]⟩ = true := by
  rfl

/-- Every positive fully exposed clock exit has arity three. -/
theorem growExit_arityThreeAnswer
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (fuel : Nat) (environment : Term) :
    SchedulerControl.compiledProbeAnswer program dispatcher
      (.arityThree .growth)
      (positiveStageRootCursor (fuel + 1) environment) = true := by
  rfl

/-- Exact mutation-free cost from the exposed wrapper root to launch control. -/
def growExitTicks
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (stage : Nat) (environment : Term) : Nat :=
  ((1 + SchedulerControl.compiledProbeCost program dispatcher .growWrapper
      ⟨clockWrappers stage stage, [.left environment]⟩) +
    SchedulerControl.compiledProbeCost program dispatcher .growEnvelope
      ⟨clockWrappers stage stage, [.left environment]⟩) + 1 + 1 +
    SchedulerControl.compiledProbeCost program dispatcher
      (.arityThree .growth) (positiveStageRootCursor stage environment)

/-- A positive exposed clock exit reaches its true arity decision without mutation. -/
theorem growExit_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (fuel : Nat) (bits : List Bool) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (growExitTicks program dispatcher (fuel + 1) environment)
      ⟨some (.macro .growUp registers),
        ⟨clockWrappers (fuel + 1) (fuel + 1), [.left environment]⟩⟩
      (positiveStageArityConfiguration program dispatcher registers
        (fuel + 1) environment) := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let stage := fuel + 1
  let boundary : Cursor :=
    ⟨clockWrappers stage stage, [.left environment]⟩
  let root := positiveStageRootCursor stage environment
  let wrapperStart : Configuration program dispatcher :=
    ⟨some (SchedulerControl.startProbe .growWrapper registers), boundary⟩
  let envelopeStart : Configuration program dispatcher :=
    ⟨some (SchedulerControl.startProbe .growEnvelope registers), boundary⟩
  let moveEndpoint : Configuration program dispatcher :=
    ⟨some (.macro .growMoveEndpoint registers), boundary⟩
  let endpoint : Configuration program dispatcher :=
    ⟨some (.macro .growEndpoint registers), root⟩
  let arityStart : Configuration program dispatcher :=
    ⟨some (SchedulerControl.startProbe (.arityThree .growth) registers), root⟩
  have enter : ZeroMutationRun (SchedulerControl.machine program dispatcher) 1
      ⟨some (.macro .growUp registers), boundary⟩ wrapperStart :=
    ⟨rfl, rfl⟩
  have wrapperProbe := ZeroMutationRun.parentProbe program dispatcher
    .growWrapper registers boundary .right rfl
  have wrapper : ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher .growWrapper boundary)
      wrapperStart envelopeStart := by
    simpa [wrapperStart, envelopeStart, boundary,
      SchedulerExecution.commandResult, SchedulerControl.probeAnswer,
      growExit_wrapperAnswer] using wrapperProbe
  have envelopeProbe := ZeroMutationRun.parentProbe program dispatcher
    .growEnvelope registers boundary .left rfl
  have envelope : ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher .growEnvelope boundary)
      envelopeStart moveEndpoint := by
    simpa [envelopeStart, moveEndpoint, boundary,
      SchedulerExecution.commandResult, SchedulerControl.probeAnswer,
      growExit_envelopeAnswer] using! envelopeProbe
  have move : ZeroMutationRun (SchedulerControl.machine program dispatcher) 1
      moveEndpoint endpoint := ⟨rfl, rfl⟩
  have startArity : ZeroMutationRun (SchedulerControl.machine program dispatcher) 1
      endpoint arityStart := ⟨rfl, rfl⟩
  have arityProbe := ZeroMutationRun.localProbe program dispatcher
    (.arityThree .growth) registers root rfl
  have arity : ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher
        (.arityThree .growth) root)
      arityStart
      (positiveStageArityConfiguration program dispatcher registers stage
        environment) := by
    simpa [arityStart, positiveStageArityConfiguration, root, stage,
      SchedulerExecution.commandResult, SchedulerControl.probeAnswer,
      growExit_arityThreeAnswer] using arityProbe
  simpa [growExitTicks, boundary, root, stage] using!
    ((((enter.trans wrapper).trans envelope).trans move).trans startArity).trans
      arity

/-- Exact zero-prefix cost from clock closure to the launch row. -/
def clockCompletedToLaunchTicks
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (stage : Nat) (environment : Term) : Nat :=
  (1 + growWrappersTicks program dispatcher stage stage (clockBase stage)
      [.left environment]) +
    growExitTicks program dispatcher stage environment

/-- Clock closure returns to the root and reaches the positive launch row. -/
theorem clockCompletedToLaunch_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (fuel : Nat) (bits : List Bool) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (clockCompletedToLaunchTicks program dispatcher (fuel + 1) environment)
      (clockPhaseCompletedConfiguration program dispatcher registers (fuel + 1)
        [.left environment])
      (positiveStageArityConfiguration program dispatcher registers (fuel + 1)
        environment) := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let stage := fuel + 1
  let start : Configuration program dispatcher :=
    ⟨some (.macro .growUp registers),
      ⟨clockBase stage,
        PrimitiveClock.wrapperParents stage stage [.left environment]⟩⟩
  let exposed : Configuration program dispatcher :=
    ⟨some (.macro .growUp registers),
      ⟨clockWrappers stage stage, [.left environment]⟩⟩
  have leaveScript : ZeroMutationRun
      (SchedulerControl.machine program dispatcher) 1
      (clockPhaseCompletedConfiguration program dispatcher registers stage
        [.left environment]) start := ⟨rfl, rfl⟩
  have wrappers := growWrappers_zeroRun program dispatcher registers stage stage
    (clockBase stage) [.left environment]
  have wrapperRun : ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (growWrappersTicks program dispatcher stage stage (clockBase stage)
        [.left environment]) start exposed := by
    simpa [start, exposed, clockWrap_clockBase_eq_clockWrappers] using wrappers
  have exitRun := growExit_zeroRun program dispatcher registers fuel bits
  simpa [clockCompletedToLaunchTicks, stage, start, exposed] using!
    (leaveScript.trans wrapperRun).trans exitRun

/-- The exact post-launch fuel-family configuration for a positive stage. -/
def positiveStageLaunchConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (fuel : Nat) (environment : Term) : Configuration program dispatcher :=
  fuelPhaseSourceConfiguration program dispatcher (Registers.newJob program)
    (fuel + 1) environment (Dovetail.clockExit (fuel + 1) fuel environment) []

/-- The arity-three decision performs exactly the public launch contraction. -/
theorem positiveStageLaunch_step
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (fuel : Nat) (environment : Term) :
    FiniteController.step (SchedulerControl.machine program dispatcher)
      (positiveStageArityConfiguration program dispatcher registers (fuel + 1)
        environment) =
      positiveStageLaunchConfiguration program dispatcher fuel environment := by
  rfl

/-- The launch row contributes exactly one pure-S contraction. -/
theorem positiveStageLaunch_count
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (fuel : Nat) (environment : Term) :
    FiniteController.mutationCount (SchedulerControl.machine program dispatcher)
      (positiveStageArityConfiguration program dispatcher registers (fuel + 1)
        environment) = 1 := by
  rfl

/-- Executable sampling finds the launch contraction from completed clock state. -/
theorem clockCompleted_seekLaunch
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (fuel : Nat) (bits : List Bool) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    FiniteController.seekMutation (SchedulerControl.machine program dispatcher)
      (clockCompletedToLaunchTicks program dispatcher (fuel + 1) environment + 1)
      (clockPhaseCompletedConfiguration program dispatcher registers (fuel + 1)
        [.left environment]) =
      some (positiveStageLaunchConfiguration program dispatcher fuel
        environment) := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  exact (clockCompletedToLaunch_zeroRun program dispatcher registers fuel
    bits).seekMutation_prepend (by
      simpa [FiniteController.seekMutation, positiveStageLaunch_count,
        positiveStageLaunch_step])

/-! ### Exact post-contraction PCs inside the fixed fuel scripts -/

def fuelPositiveScriptSourceConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (fuel : Nat)
    (environment continuation : Term) (parents : List ParentFrame) :
    Configuration program dispatcher :=
  ⟨some (SchedulerControl.startScript .fuelPositive registers),
    fuelCursor (fuel + 1) environment continuation parents⟩

def fuelPositiveFirstMutationConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (fuel : Nat)
    (environment continuation : Term) (parents : List ParentFrame) :
    Configuration program dispatcher :=
  ⟨some (.script .fuelPositive ⟨2, by
      change 2 < 6
      decide⟩ registers),
    ⟨.app (.app .s environment) (.app (C fuel) environment),
      .left continuation :: parents⟩⟩

def fuelPositiveSecondMutationConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (fuel : Nat)
    (environment continuation : Term) (parents : List ParentFrame) :
    Configuration program dispatcher :=
  ⟨some (.script .fuelPositive ⟨4, by
      change 4 < 6
      decide⟩ registers),
    ⟨frame environment continuation
        (.app (.app (C fuel) environment) continuation), parents⟩⟩

/-- The two literal positive-fuel contractions are consecutive executable samples. -/
theorem fuelPositive_seekFirst
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (fuel : Nat)
    (environment continuation : Term) (parents : List ParentFrame) :
    FiniteController.seekMutation (SchedulerControl.machine program dispatcher) 2
        (fuelPositiveScriptSourceConfiguration program dispatcher registers fuel
          environment continuation parents) =
      some (fuelPositiveFirstMutationConfiguration program dispatcher registers
        fuel environment continuation parents) := by
  rfl

theorem fuelPositive_seekSecond
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (fuel : Nat)
    (environment continuation : Term) (parents : List ParentFrame) :
    FiniteController.seekMutation (SchedulerControl.machine program dispatcher) 2
        (fuelPositiveFirstMutationConfiguration program dispatcher registers fuel
          environment continuation parents) =
      some (fuelPositiveSecondMutationConfiguration program dispatcher registers
        fuel environment continuation parents) := by
  rfl

/-- The final cursor move and epsilon row restore the next fuel-family macro state. -/
theorem run_fuelPositiveSampleSuffix
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (fuel : Nat)
    (environment continuation : Term) (parents : List ParentFrame) :
    FiniteController.run (SchedulerControl.machine program dispatcher) 2
        (fuelPositiveSecondMutationConfiguration program dispatcher registers
          fuel environment continuation parents) =
      fuelPhaseSourceConfiguration program dispatcher registers fuel
        environment continuation
        (.right (.app environment continuation) :: parents) := by
  rfl

theorem runMutationCount_fuelPositiveSampleSuffix
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (fuel : Nat)
    (environment continuation : Term) (parents : List ParentFrame) :
    FiniteController.runMutationCount
        (SchedulerControl.machine program dispatcher) 2
        (fuelPositiveSecondMutationConfiguration program dispatcher registers
          fuel environment continuation parents) = 0 := by
  rfl

def fuelZeroScriptSourceConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (environment continuation : Term)
    (parents : List ParentFrame) : Configuration program dispatcher :=
  ⟨some (SchedulerControl.startScript .fuelZero registers),
    fuelCursor 0 environment continuation parents⟩

def fuelZeroFirstMutationConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (environment continuation : Term)
    (parents : List ParentFrame) : Configuration program dispatcher :=
  ⟨some (.script .fuelZero ⟨2, by
      change 2 < 12
      decide⟩ registers),
    ⟨.app (.app b environment) (.app b environment),
      .left continuation :: parents⟩⟩

def fuelZeroSecondMutationConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (environment continuation : Term)
    (parents : List ParentFrame) : Configuration program dispatcher :=
  ⟨some (.script .fuelZero ⟨5, by
      change 5 < 12
      decide⟩ registers),
    ⟨.app (.app .s (.app b environment))
        (.app environment (.app b environment)),
      .left continuation :: parents⟩⟩

def fuelZeroThirdMutationConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (environment continuation : Term)
    (parents : List ParentFrame) : Configuration program dispatcher :=
  let alpha := .app (.app environment (.app b environment)) continuation
  ⟨some (.script .fuelZero ⟨7, by
      change 7 < 12
      decide⟩ registers),
    ⟨.app (.app (.app b environment) continuation) alpha, parents⟩⟩

def fuelZeroFourthMutationConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (environment continuation : Term)
    (parents : List ParentFrame) : Configuration program dispatcher :=
  let alpha := .app (.app environment (.app b environment)) continuation
  ⟨some (.script .fuelZero ⟨9, by
      change 9 < 12
      decide⟩ registers),
    ⟨.app (.app .s continuation) (.app environment continuation),
      .left alpha :: parents⟩⟩

def fuelZeroFifthMutationConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (environment continuation : Term)
    (parents : List ParentFrame) : Configuration program dispatcher :=
  ⟨some (.script .fuelZero ⟨11, by
      change 11 < 12
      decide⟩ registers),
    ⟨baseCarrier environment continuation, parents⟩⟩

/-- All five zero-fuel contractions are exact executable samples. -/
theorem fuelZero_seekFirst
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (environment continuation : Term)
    (parents : List ParentFrame) :
    FiniteController.seekMutation (SchedulerControl.machine program dispatcher) 2
        (fuelZeroScriptSourceConfiguration program dispatcher registers
          environment continuation parents) =
      some (fuelZeroFirstMutationConfiguration program dispatcher registers
        environment continuation parents) := by
  rfl

theorem fuelZero_seekSecond
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (environment continuation : Term)
    (parents : List ParentFrame) :
    FiniteController.seekMutation (SchedulerControl.machine program dispatcher) 3
        (fuelZeroFirstMutationConfiguration program dispatcher registers
          environment continuation parents) =
      some (fuelZeroSecondMutationConfiguration program dispatcher registers
        environment continuation parents) := by
  rfl

theorem fuelZero_seekThird
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (environment continuation : Term)
    (parents : List ParentFrame) :
    FiniteController.seekMutation (SchedulerControl.machine program dispatcher) 2
        (fuelZeroSecondMutationConfiguration program dispatcher registers
          environment continuation parents) =
      some (fuelZeroThirdMutationConfiguration program dispatcher registers
        environment continuation parents) := by
  rfl

theorem fuelZero_seekFourth
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (environment continuation : Term)
    (parents : List ParentFrame) :
    FiniteController.seekMutation (SchedulerControl.machine program dispatcher) 2
        (fuelZeroThirdMutationConfiguration program dispatcher registers
          environment continuation parents) =
      some (fuelZeroFourthMutationConfiguration program dispatcher registers
        environment continuation parents) := by
  rfl

theorem fuelZero_seekFifth
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (environment continuation : Term)
    (parents : List ParentFrame) :
    FiniteController.seekMutation (SchedulerControl.machine program dispatcher) 2
        (fuelZeroFourthMutationConfiguration program dispatcher registers
          environment continuation parents) =
      some (fuelZeroFifthMutationConfiguration program dispatcher registers
        environment continuation parents) := by
  rfl

/-- The terminal zero-fuel PC changes only control and enters DOWN at Base. -/
theorem run_fuelZeroSampleSuffix
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (environment continuation : Term)
    (parents : List ParentFrame) :
    FiniteController.run (SchedulerControl.machine program dispatcher) 1
        (fuelZeroFifthMutationConfiguration program dispatcher registers
          environment continuation parents) =
      fuelPhaseCompletedConfiguration program dispatcher registers 0
        environment continuation parents := by
  rfl

theorem runMutationCount_fuelZeroSampleSuffix
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (environment continuation : Term)
    (parents : List ParentFrame) :
    FiniteController.runMutationCount
        (SchedulerControl.machine program dispatcher) 1
        (fuelZeroFifthMutationConfiguration program dispatcher registers
          environment continuation parents) = 0 := by
  rfl

/-! ### Decoder silence of every root-level fuel-script sample -/

theorem fuelPositiveFirst_failureRoot
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program) (fuel : Nat)
    (continuation : Term) :
    CheckpointExclusion.EndpointFailure program dispatcher.tree
      (fuelPositiveFirstMutationConfiguration program dispatcher registers fuel
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation []).cursor.erase := by
  apply CheckpointExclusion.EndpointFailure.ofHeadArity
  all_goals
    simp [fuelPositiveFirstMutationConfiguration,
      Term.headArity_app_eq, Cursor.erase, Cursor.rebuild, ParentFrame.fill]

theorem fuelPositiveSecond_failureRoot
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program) (fuel : Nat)
    (continuation : Term) :
    CheckpointExclusion.EndpointFailure program dispatcher.tree
      (fuelPositiveSecondMutationConfiguration program dispatcher registers fuel
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation []).cursor.erase := by
  apply (CheckpointExclusion.PreFrameShape.mk (word bits) continuation
    (.app (.app (C fuel)
      (environmentCode (compileActions program dispatcher.tree) bits))
      continuation) ?_).failure
  simp [fuelPositiveSecondMutationConfiguration, Cursor.erase, Cursor.rebuild,
    ParentFrame.fill, CheckpointDecoder.openEnvironment_word]

theorem fuelZeroFirst_failureRoot
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (continuation : Term) :
    CheckpointExclusion.EndpointFailure program dispatcher.tree
      (fuelZeroFirstMutationConfiguration program dispatcher registers
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation []).cursor.erase := by
  constructor
  · simp [fuelZeroFirstMutationConfiguration,
      CheckpointDecoder.parseGenerator?, CheckpointDecoder.parseCarrier?,
      CheckpointDecoder.openEnvironment_word, Cursor.erase, Cursor.rebuild,
      ParentFrame.fill, b, PendingFrame.envelope, PendingFrame.envelopeSlot]
  · apply CheckpointDecoder.parseLocal?_none_of_headArity
    · simp [fuelZeroFirstMutationConfiguration, Cursor.erase, Cursor.rebuild,
        ParentFrame.fill]
    · simp [fuelZeroFirstMutationConfiguration, Cursor.erase, Cursor.rebuild,
        ParentFrame.fill]
  · simp [fuelZeroFirstMutationConfiguration,
      CheckpointDecoder.parseTerminal?, CheckpointDecoder.parseCarrier?,
      CheckpointDecoder.openEnvironment_word, Cursor.erase, Cursor.rebuild,
      ParentFrame.fill, b, PendingFrame.envelope, PendingFrame.envelopeSlot]

theorem fuelZeroSecond_failureRoot
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (continuation : Term) :
    CheckpointExclusion.EndpointFailure program dispatcher.tree
      (fuelZeroSecondMutationConfiguration program dispatcher registers
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation []).cursor.erase := by
  apply CheckpointExclusion.EndpointFailure.ofHeadArity
  all_goals
    simp [fuelZeroSecondMutationConfiguration,
      Term.headArity_app_eq, Cursor.erase, Cursor.rebuild, ParentFrame.fill]

theorem fuelZeroThird_failureRoot
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (continuation : Term) :
    CheckpointExclusion.EndpointFailure program dispatcher.tree
      (fuelZeroThirdMutationConfiguration program dispatcher registers
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation []).cursor.erase := by
  constructor
  · simp [fuelZeroThirdMutationConfiguration,
      CheckpointDecoder.parseGenerator?, CheckpointDecoder.parseCarrier?,
      CheckpointDecoder.openEnvironment_word, Cursor.erase, Cursor.rebuild,
      ParentFrame.fill, b, PendingFrame.envelope, PendingFrame.envelopeSlot]
  · apply CheckpointDecoder.parseLocal?_none_of_headArity
    · simp [fuelZeroThirdMutationConfiguration, Cursor.erase, Cursor.rebuild,
        ParentFrame.fill]
    · simp [fuelZeroThirdMutationConfiguration, Cursor.erase, Cursor.rebuild,
        ParentFrame.fill]
  · simp [fuelZeroThirdMutationConfiguration,
      CheckpointDecoder.parseTerminal?, CheckpointDecoder.parseCarrier?,
      CheckpointDecoder.openEnvironment_word, Cursor.erase, Cursor.rebuild,
      ParentFrame.fill, b, PendingFrame.envelope, PendingFrame.envelopeSlot]

theorem fuelZeroFourth_failureRoot
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (continuation : Term) :
    CheckpointExclusion.EndpointFailure program dispatcher.tree
      (fuelZeroFourthMutationConfiguration program dispatcher registers
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation []).cursor.erase := by
  apply CheckpointExclusion.EndpointFailure.ofHeadArity
  all_goals
    simp [fuelZeroFourthMutationConfiguration,
      Term.headArity_app_eq, Cursor.erase, Cursor.rebuild, ParentFrame.fill]

theorem fuelZeroFifth_failureRoot
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (continuation : Term) (hadmissible : Carrier.Admissible continuation) :
    CheckpointExclusion.EndpointFailure program dispatcher.tree
      (fuelZeroFifthMutationConfiguration program dispatcher registers
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation []).cursor.erase := by
  apply CheckpointExclusion.BaseShape.failure
  refine
    { bits := bits
      continuation := continuation
      queue := word bits
      beta := baseBeta
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation
      admissible := hadmissible
      source_eq := ?_ }
  change baseCarrier
      (environmentCode (compileActions program dispatcher.tree) bits)
      continuation =
    MutableBase.base (compileActions program dispatcher.tree) bits continuation
      (word bits)
      (baseBeta (environmentCode
        (compileActions program dispatcher.tree) bits) continuation)
  exact (MutableBase.initial_eq_baseCarrier
    (compileActions program dispatcher.tree) bits continuation).symm

/-- Each named root fuel sample carries direct decoder-silence evidence. -/
theorem fuelPositiveFirst_silentRoot
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program) (fuel : Nat)
    (continuation : Term) :
    SilentEvidence program dispatcher.tree .fuel
      (fuelPositiveFirstMutationConfiguration program dispatcher registers fuel
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation []).cursor.erase :=
  SilentEvidence.ofEndpointFailure
    (fuelPositiveFirst_failureRoot program dispatcher bits registers fuel
      continuation)

theorem fuelPositiveSecond_silentRoot
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program) (fuel : Nat)
    (continuation : Term) :
    SilentEvidence program dispatcher.tree .fuel
      (fuelPositiveSecondMutationConfiguration program dispatcher registers fuel
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation []).cursor.erase :=
  SilentEvidence.ofEndpointFailure
    (fuelPositiveSecond_failureRoot program dispatcher bits registers fuel
      continuation)

theorem fuelZeroFirst_silentRoot
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program) (continuation : Term) :
    SilentEvidence program dispatcher.tree .fuel
      (fuelZeroFirstMutationConfiguration program dispatcher registers
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation []).cursor.erase :=
  SilentEvidence.ofEndpointFailure
    (fuelZeroFirst_failureRoot program dispatcher bits registers continuation)

theorem fuelZeroSecond_silentRoot
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program) (continuation : Term) :
    SilentEvidence program dispatcher.tree .fuel
      (fuelZeroSecondMutationConfiguration program dispatcher registers
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation []).cursor.erase :=
  SilentEvidence.ofEndpointFailure
    (fuelZeroSecond_failureRoot program dispatcher bits registers continuation)

theorem fuelZeroThird_silentRoot
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program) (continuation : Term) :
    SilentEvidence program dispatcher.tree .fuel
      (fuelZeroThirdMutationConfiguration program dispatcher registers
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation []).cursor.erase :=
  SilentEvidence.ofEndpointFailure
    (fuelZeroThird_failureRoot program dispatcher bits registers continuation)

theorem fuelZeroFourth_silentRoot
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program) (continuation : Term) :
    SilentEvidence program dispatcher.tree .fuel
      (fuelZeroFourthMutationConfiguration program dispatcher registers
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation []).cursor.erase :=
  SilentEvidence.ofEndpointFailure
    (fuelZeroFourth_failureRoot program dispatcher bits registers continuation)

theorem fuelZeroFifth_silentRoot
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation) :
    SilentEvidence program dispatcher.tree .fuel
      (fuelZeroFifthMutationConfiguration program dispatcher registers
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation []).cursor.erase :=
  SilentEvidence.ofEndpointFailure
    (fuelZeroFifth_failureRoot program dispatcher bits registers continuation
      hadmissible)

/-- Rebuilding an inner zipper prefix and then an outer suffix is associative. -/
theorem rebuild_append
    (inner outer : List ParentFrame) (focus : Term) :
    Cursor.rebuild (inner ++ outer) focus =
      Cursor.rebuild outer (Cursor.rebuild inner focus) := by
  induction inner generalizing focus with
  | nil => rfl
  | cons frame inner ih =>
      change Cursor.rebuild (inner ++ outer) (frame.fill focus) = _
      exact ih (frame.fill focus)

/-- Any positive stack of literal pending parents is a decoder-failing endpoint. -/
theorem pendingParents_failure
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation body : Term) (depth : Nat)
    (positive : depth ≠ 0) :
    CheckpointExclusion.EndpointFailure program dispatcher.tree
      (Cursor.rebuild
        (PrimitiveFuel.pendingParents
          (environmentCode (compileActions program dispatcher.tree) bits)
          continuation depth []) body) := by
  cases depth with
  | zero => exact (positive rfl).elim
  | succ depth =>
      rw [PrimitiveFuel.rebuild_pendingParents]
      apply CheckpointExclusion.EndpointFailure.ofHeadArity
      all_goals simp [frame, Cursor.rebuild]

/-- Local cursor frames beneath a positive pending stack remain decoder-silent. -/
theorem pendingParents_silent
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (continuation focus : Term)
    (localParents : List ParentFrame) (depth : Nat)
    (positive : depth ≠ 0) :
    SilentEvidence program dispatcher.tree .fuel
      (Cursor.mk focus
        (localParents ++ PrimitiveFuel.pendingParents
          (environmentCode (compileActions program dispatcher.tree) bits)
          continuation depth [])).erase := by
  apply SilentEvidence.ofEndpointFailure
  rw [Cursor.erase, rebuild_append]
  exact pendingParents_failure program dispatcher bits continuation
    (Cursor.rebuild localParents focus) depth positive

/-- Exact silence certificates for both positive-script post-`Rdx` PCs. -/
structure FuelPositiveSampleEvidence
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program) (fuel depth : Nat)
    (continuation : Term) : Prop where
  first : SilentEvidence program dispatcher.tree .fuel
    (fuelPositiveFirstMutationConfiguration program dispatcher registers fuel
      (environmentCode (compileActions program dispatcher.tree) bits)
      continuation
      (PrimitiveFuel.pendingParents
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation depth [])).cursor.erase
  second : SilentEvidence program dispatcher.tree .fuel
    (fuelPositiveSecondMutationConfiguration program dispatcher registers fuel
      (environmentCode (compileActions program dispatcher.tree) bits)
      continuation
      (PrimitiveFuel.pendingParents
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation depth [])).cursor.erase

/-- Construct the positive-script evidence at every exact pending depth. -/
theorem fuelPositiveSampleEvidence
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program) (fuel depth : Nat)
    (continuation : Term) :
    FuelPositiveSampleEvidence program dispatcher bits registers fuel depth
      continuation := by
  cases depth with
  | zero =>
      exact ⟨fuelPositiveFirst_silentRoot program dispatcher bits registers
          fuel continuation,
        fuelPositiveSecond_silentRoot program dispatcher bits registers
          fuel continuation⟩
  | succ depth =>
      let environment :=
        environmentCode (compileActions program dispatcher.tree) bits
      have positive : depth + 1 ≠ 0 := Nat.succ_ne_zero depth
      constructor
      · simpa [fuelPositiveFirstMutationConfiguration, environment,
          Cursor.erase] using
          pendingParents_silent program dispatcher bits continuation
            (.app (.app .s environment) (.app (C fuel) environment))
            [.left continuation] (depth + 1) positive
      · simpa [fuelPositiveSecondMutationConfiguration, environment,
          Cursor.erase] using
          pendingParents_silent program dispatcher bits continuation
            (frame environment continuation
              (.app (.app (C fuel) environment) continuation))
            [] (depth + 1) positive

/-- Exact silence certificates for all five zero-script post-`Rdx` PCs. -/
structure FuelZeroSampleEvidence
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program) (depth : Nat)
    (continuation : Term) : Prop where
  first : SilentEvidence program dispatcher.tree .fuel
    (fuelZeroFirstMutationConfiguration program dispatcher registers
      (environmentCode (compileActions program dispatcher.tree) bits)
      continuation
      (PrimitiveFuel.pendingParents
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation depth [])).cursor.erase
  second : SilentEvidence program dispatcher.tree .fuel
    (fuelZeroSecondMutationConfiguration program dispatcher registers
      (environmentCode (compileActions program dispatcher.tree) bits)
      continuation
      (PrimitiveFuel.pendingParents
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation depth [])).cursor.erase
  third : SilentEvidence program dispatcher.tree .fuel
    (fuelZeroThirdMutationConfiguration program dispatcher registers
      (environmentCode (compileActions program dispatcher.tree) bits)
      continuation
      (PrimitiveFuel.pendingParents
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation depth [])).cursor.erase
  fourth : SilentEvidence program dispatcher.tree .fuel
    (fuelZeroFourthMutationConfiguration program dispatcher registers
      (environmentCode (compileActions program dispatcher.tree) bits)
      continuation
      (PrimitiveFuel.pendingParents
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation depth [])).cursor.erase
  fifth : SilentEvidence program dispatcher.tree .fuel
    (fuelZeroFifthMutationConfiguration program dispatcher registers
      (environmentCode (compileActions program dispatcher.tree) bits)
      continuation
      (PrimitiveFuel.pendingParents
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation depth [])).cursor.erase

/-- Construct all zero-script evidence at every pending depth. -/
theorem fuelZeroSampleEvidence
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program) (depth : Nat)
    (continuation : Term) (hadmissible : Carrier.Admissible continuation) :
    FuelZeroSampleEvidence program dispatcher bits registers depth
      continuation := by
  cases depth with
  | zero =>
      exact ⟨fuelZeroFirst_silentRoot program dispatcher bits registers
          continuation,
        fuelZeroSecond_silentRoot program dispatcher bits registers continuation,
        fuelZeroThird_silentRoot program dispatcher bits registers continuation,
        fuelZeroFourth_silentRoot program dispatcher bits registers continuation,
        fuelZeroFifth_silentRoot program dispatcher bits registers continuation
          hadmissible⟩
  | succ depth =>
      let environment :=
        environmentCode (compileActions program dispatcher.tree) bits
      let alpha : Term :=
        Term.app (Term.app environment (Term.app b environment)) continuation
      have positive : depth + 1 ≠ 0 := Nat.succ_ne_zero depth
      constructor
      · simpa [fuelZeroFirstMutationConfiguration, environment, Cursor.erase]
          using pendingParents_silent program dispatcher bits continuation
            (.app (.app b environment) (.app b environment))
            [.left continuation] (depth + 1) positive
      · simpa [fuelZeroSecondMutationConfiguration, environment, Cursor.erase]
          using pendingParents_silent program dispatcher bits continuation
            (.app (.app .s (.app b environment))
              (.app environment (.app b environment)))
            [.left continuation] (depth + 1) positive
      · simpa [fuelZeroThirdMutationConfiguration, environment, alpha,
          Cursor.erase] using
          pendingParents_silent program dispatcher bits continuation
            (.app (.app (.app b environment) continuation) alpha)
            [] (depth + 1) positive
      · simpa [fuelZeroFourthMutationConfiguration, environment, alpha,
          Cursor.erase] using
          pendingParents_silent program dispatcher bits continuation
            (.app (.app .s continuation) (.app environment continuation))
            [.left alpha] (depth + 1) positive
      · simpa [fuelZeroFifthMutationConfiguration, environment, Cursor.erase]
          using pendingParents_silent program dispatcher bits continuation
            (baseCarrier environment continuation) [] (depth + 1) positive

/-! ### Full invariant witnesses at every sampled fuel PC -/

/-- The first positive-fuel contraction has its exact script position. -/
theorem fuelPositiveFirstMutation_holds
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (fuel : Nat) (environment continuation : Term)
    (parents : List ParentFrame)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (silent : SilentEvidence program dispatcher.tree .fuel
      (fuelPositiveFirstMutationConfiguration program dispatcher registers fuel
        environment continuation parents).cursor.erase) :
    Holds program dispatcher
      (fuelPositiveFirstMutationConfiguration program dispatcher registers fuel
        environment continuation parents) := by
  let origin : Cursor := fuelCursor (fuel + 1) environment continuation parents
  let endpoint : Cursor :=
    ⟨.app (.app (C fuel) environment) continuation,
      .right (.app environment continuation) :: parents⟩
  exact .intro (.script .fuelPositive ⟨2, by
      change 2 < 6
      decide⟩ registers) rfl phase scanned emptyMode coherent
    (ControlPosition.script (origin := origin) (endpoint := endpoint)
      rfl rfl ⟨_, rfl⟩)
    (.fuel (.silent silent))

/-- The second positive-fuel contraction has its exact script position. -/
theorem fuelPositiveSecondMutation_holds
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (fuel : Nat) (environment continuation : Term)
    (parents : List ParentFrame)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (silent : SilentEvidence program dispatcher.tree .fuel
      (fuelPositiveSecondMutationConfiguration program dispatcher registers fuel
        environment continuation parents).cursor.erase) :
    Holds program dispatcher
      (fuelPositiveSecondMutationConfiguration program dispatcher registers fuel
        environment continuation parents) := by
  let origin : Cursor := fuelCursor (fuel + 1) environment continuation parents
  let endpoint : Cursor :=
    ⟨.app (.app (C fuel) environment) continuation,
      .right (.app environment continuation) :: parents⟩
  exact .intro (.script .fuelPositive ⟨4, by
      change 4 < 6
      decide⟩ registers) rfl phase scanned emptyMode coherent
    (ControlPosition.script (origin := origin) (endpoint := endpoint)
      rfl rfl ⟨_, rfl⟩)
    (.fuel (.silent silent))

/-- The first zero-fuel contraction has its exact script position. -/
theorem fuelZeroFirstMutation_holds
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (environment continuation : Term) (parents : List ParentFrame)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (silent : SilentEvidence program dispatcher.tree .fuel
      (fuelZeroFirstMutationConfiguration program dispatcher registers
        environment continuation parents).cursor.erase) :
    Holds program dispatcher
      (fuelZeroFirstMutationConfiguration program dispatcher registers
        environment continuation parents) := by
  let origin : Cursor := fuelCursor 0 environment continuation parents
  let endpoint : Cursor := ⟨baseCarrier environment continuation, parents⟩
  exact .intro (.script .fuelZero ⟨2, by
      change 2 < 12
      decide⟩ registers) rfl phase scanned emptyMode coherent
    (ControlPosition.script (origin := origin) (endpoint := endpoint)
      rfl rfl ⟨_, rfl⟩)
    (.fuel (.silent silent))

/-- The second zero-fuel contraction has its exact script position. -/
theorem fuelZeroSecondMutation_holds
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (environment continuation : Term) (parents : List ParentFrame)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (silent : SilentEvidence program dispatcher.tree .fuel
      (fuelZeroSecondMutationConfiguration program dispatcher registers
        environment continuation parents).cursor.erase) :
    Holds program dispatcher
      (fuelZeroSecondMutationConfiguration program dispatcher registers
        environment continuation parents) := by
  let origin : Cursor := fuelCursor 0 environment continuation parents
  let endpoint : Cursor := ⟨baseCarrier environment continuation, parents⟩
  exact .intro (.script .fuelZero ⟨5, by
      change 5 < 12
      decide⟩ registers) rfl phase scanned emptyMode coherent
    (ControlPosition.script (origin := origin) (endpoint := endpoint)
      rfl rfl ⟨_, rfl⟩)
    (.fuel (.silent silent))

/-- The third zero-fuel contraction has its exact script position. -/
theorem fuelZeroThirdMutation_holds
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (environment continuation : Term) (parents : List ParentFrame)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (silent : SilentEvidence program dispatcher.tree .fuel
      (fuelZeroThirdMutationConfiguration program dispatcher registers
        environment continuation parents).cursor.erase) :
    Holds program dispatcher
      (fuelZeroThirdMutationConfiguration program dispatcher registers
        environment continuation parents) := by
  let origin : Cursor := fuelCursor 0 environment continuation parents
  let endpoint : Cursor := ⟨baseCarrier environment continuation, parents⟩
  exact .intro (.script .fuelZero ⟨7, by
      change 7 < 12
      decide⟩ registers) rfl phase scanned emptyMode coherent
    (ControlPosition.script (origin := origin) (endpoint := endpoint)
      rfl rfl ⟨_, rfl⟩)
    (.fuel (.silent silent))

/-- The fourth zero-fuel contraction has its exact script position. -/
theorem fuelZeroFourthMutation_holds
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (environment continuation : Term) (parents : List ParentFrame)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (silent : SilentEvidence program dispatcher.tree .fuel
      (fuelZeroFourthMutationConfiguration program dispatcher registers
        environment continuation parents).cursor.erase) :
    Holds program dispatcher
      (fuelZeroFourthMutationConfiguration program dispatcher registers
        environment continuation parents) := by
  let origin : Cursor := fuelCursor 0 environment continuation parents
  let endpoint : Cursor := ⟨baseCarrier environment continuation, parents⟩
  exact .intro (.script .fuelZero ⟨9, by
      change 9 < 12
      decide⟩ registers) rfl phase scanned emptyMode coherent
    (ControlPosition.script (origin := origin) (endpoint := endpoint)
      rfl rfl ⟨_, rfl⟩)
    (.fuel (.silent silent))

/-- The fifth zero-fuel contraction is the exact terminal script PC. -/
theorem fuelZeroFifthMutation_holds
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (environment continuation : Term) (parents : List ParentFrame)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (silent : SilentEvidence program dispatcher.tree .fuel
      (fuelZeroFifthMutationConfiguration program dispatcher registers
        environment continuation parents).cursor.erase) :
    Holds program dispatcher
      (fuelZeroFifthMutationConfiguration program dispatcher registers
        environment continuation parents) := by
  let origin : Cursor := fuelCursor 0 environment continuation parents
  let endpoint : Cursor := ⟨baseCarrier environment continuation, parents⟩
  exact .intro (.script .fuelZero ⟨11, by
      change 11 < 12
      decide⟩ registers) rfl phase scanned emptyMode coherent
    (ControlPosition.script (origin := origin) (endpoint := endpoint)
      rfl rfl (by trivial))
    (.fuel (.silent silent))

/-- Both positive-fuel samples satisfy the simultaneous scheduler invariant. -/
structure FuelPositiveSampleHolds
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (fuel depth : Nat) (continuation : Term) : Prop where
  first : Holds program dispatcher
    (fuelPositiveFirstMutationConfiguration program dispatcher registers fuel
      (environmentCode (compileActions program dispatcher.tree) bits)
      continuation
      (PrimitiveFuel.pendingParents
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation depth []))
  second : Holds program dispatcher
    (fuelPositiveSecondMutationConfiguration program dispatcher registers fuel
      (environmentCode (compileActions program dispatcher.tree) bits)
      continuation
      (PrimitiveFuel.pendingParents
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation depth []))

/-- Construct both positive-fuel invariant witnesses at an arbitrary depth. -/
theorem fuelPositiveSampleHolds
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (fuel depth : Nat) (continuation : Term)
    (coherent : RegistersCoherent registers phase scanned emptyMode) :
    FuelPositiveSampleHolds program dispatcher bits registers phase scanned
      emptyMode fuel depth continuation := by
  have evidence := fuelPositiveSampleEvidence program dispatcher bits registers
    fuel depth continuation
  exact ⟨fuelPositiveFirstMutation_holds program dispatcher registers phase
      scanned emptyMode fuel _ continuation _ coherent evidence.first,
    fuelPositiveSecondMutation_holds program dispatcher registers phase scanned
      emptyMode fuel _ continuation _ coherent evidence.second⟩

/-- All five zero-fuel samples satisfy the simultaneous scheduler invariant. -/
structure FuelZeroSampleHolds
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (depth : Nat) (continuation : Term) : Prop where
  first : Holds program dispatcher
    (fuelZeroFirstMutationConfiguration program dispatcher registers
      (environmentCode (compileActions program dispatcher.tree) bits)
      continuation
      (PrimitiveFuel.pendingParents
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation depth []))
  second : Holds program dispatcher
    (fuelZeroSecondMutationConfiguration program dispatcher registers
      (environmentCode (compileActions program dispatcher.tree) bits)
      continuation
      (PrimitiveFuel.pendingParents
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation depth []))
  third : Holds program dispatcher
    (fuelZeroThirdMutationConfiguration program dispatcher registers
      (environmentCode (compileActions program dispatcher.tree) bits)
      continuation
      (PrimitiveFuel.pendingParents
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation depth []))
  fourth : Holds program dispatcher
    (fuelZeroFourthMutationConfiguration program dispatcher registers
      (environmentCode (compileActions program dispatcher.tree) bits)
      continuation
      (PrimitiveFuel.pendingParents
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation depth []))
  fifth : Holds program dispatcher
    (fuelZeroFifthMutationConfiguration program dispatcher registers
      (environmentCode (compileActions program dispatcher.tree) bits)
      continuation
      (PrimitiveFuel.pendingParents
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation depth []))

/-- Construct all five zero-fuel invariant witnesses at an arbitrary depth. -/
theorem fuelZeroSampleHolds
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (depth : Nat) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation)
    (coherent : RegistersCoherent registers phase scanned emptyMode) :
    FuelZeroSampleHolds program dispatcher bits registers phase scanned emptyMode
      depth continuation := by
  have evidence := fuelZeroSampleEvidence program dispatcher bits registers depth
    continuation hadmissible
  exact ⟨fuelZeroFirstMutation_holds program dispatcher registers phase scanned
      emptyMode _ continuation _ coherent evidence.first,
    fuelZeroSecondMutation_holds program dispatcher registers phase scanned
      emptyMode _ continuation _ coherent evidence.second,
    fuelZeroThirdMutation_holds program dispatcher registers phase scanned
      emptyMode _ continuation _ coherent evidence.third,
    fuelZeroFourthMutation_holds program dispatcher registers phase scanned
      emptyMode _ continuation _ coherent evidence.fourth,
    fuelZeroFifthMutation_holds program dispatcher registers phase scanned
      emptyMode _ continuation _ coherent evidence.fifth⟩

/--
The simultaneous invariant at every contraction sample in a recursive fuel
phase.  The depth parameter is the exact number of installed pending frames.
-/
inductive FuelScriptHolds
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (continuation : Term) (hadmissible : Carrier.Admissible continuation)
    (coherent : RegistersCoherent registers phase scanned emptyMode) :
    Nat → Nat → Prop where
  | zero (depth : Nat)
      (states : FuelZeroSampleHolds program dispatcher bits registers phase
        scanned emptyMode depth continuation) :
      FuelScriptHolds program dispatcher bits registers phase scanned emptyMode
        continuation hadmissible coherent 0 depth
  | succ (fuel depth : Nat)
      (states : FuelPositiveSampleHolds program dispatcher bits registers phase
        scanned emptyMode fuel depth continuation)
      (tail : FuelScriptHolds program dispatcher bits registers phase scanned
        emptyMode continuation hadmissible coherent fuel (depth + 1)) :
      FuelScriptHolds program dispatcher bits registers phase scanned emptyMode
        continuation hadmissible coherent (fuel + 1) depth

/-- Construct the simultaneous fuel invariant by structural fuel induction. -/
theorem fuelScriptHolds
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (continuation : Term) (hadmissible : Carrier.Admissible continuation)
    (coherent : RegistersCoherent registers phase scanned emptyMode) :
    ∀ fuel depth,
      FuelScriptHolds program dispatcher bits registers phase scanned emptyMode
        continuation hadmissible coherent fuel depth
  | 0, depth =>
      .zero depth (fuelZeroSampleHolds program dispatcher bits registers phase
        scanned emptyMode depth continuation hadmissible coherent)
  | fuel + 1, depth =>
      .succ fuel depth
        (fuelPositiveSampleHolds program dispatcher bits registers phase scanned
          emptyMode fuel depth continuation coherent)
        (fuelScriptHolds program dispatcher bits registers phase scanned emptyMode
          continuation hadmissible coherent fuel (depth + 1))

/--
Complete contraction-sampled trace inside the recursive fuel scripts.  The
depth index is the exact number of pending parents already installed.
-/
inductive FuelScriptSamples
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (continuation : Term) (hadmissible : Carrier.Admissible continuation) :
    Nat → Nat → Prop where
  | zero (depth : Nat)
      (evidence : FuelZeroSampleEvidence program dispatcher bits registers
        depth continuation)
      (first : FiniteController.seekMutation
        (SchedulerControl.machine program dispatcher) 2
        (fuelZeroScriptSourceConfiguration program dispatcher registers
          (environmentCode (compileActions program dispatcher.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program dispatcher.tree) bits)
            continuation depth [])) =
        some (fuelZeroFirstMutationConfiguration program dispatcher registers
          (environmentCode (compileActions program dispatcher.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program dispatcher.tree) bits)
            continuation depth [])))
      (second : FiniteController.seekMutation
        (SchedulerControl.machine program dispatcher) 3
        (fuelZeroFirstMutationConfiguration program dispatcher registers
          (environmentCode (compileActions program dispatcher.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program dispatcher.tree) bits)
            continuation depth [])) =
        some (fuelZeroSecondMutationConfiguration program dispatcher registers
          (environmentCode (compileActions program dispatcher.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program dispatcher.tree) bits)
            continuation depth [])))
      (third : FiniteController.seekMutation
        (SchedulerControl.machine program dispatcher) 2
        (fuelZeroSecondMutationConfiguration program dispatcher registers
          (environmentCode (compileActions program dispatcher.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program dispatcher.tree) bits)
            continuation depth [])) =
        some (fuelZeroThirdMutationConfiguration program dispatcher registers
          (environmentCode (compileActions program dispatcher.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program dispatcher.tree) bits)
            continuation depth [])))
      (fourth : FiniteController.seekMutation
        (SchedulerControl.machine program dispatcher) 2
        (fuelZeroThirdMutationConfiguration program dispatcher registers
          (environmentCode (compileActions program dispatcher.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program dispatcher.tree) bits)
            continuation depth [])) =
        some (fuelZeroFourthMutationConfiguration program dispatcher registers
          (environmentCode (compileActions program dispatcher.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program dispatcher.tree) bits)
            continuation depth [])))
      (fifth : FiniteController.seekMutation
        (SchedulerControl.machine program dispatcher) 2
        (fuelZeroFourthMutationConfiguration program dispatcher registers
          (environmentCode (compileActions program dispatcher.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program dispatcher.tree) bits)
            continuation depth [])) =
        some (fuelZeroFifthMutationConfiguration program dispatcher registers
          (environmentCode (compileActions program dispatcher.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program dispatcher.tree) bits)
            continuation depth []))) :
      FuelScriptSamples program dispatcher bits registers continuation
        hadmissible 0 depth
  | succ (fuel depth : Nat)
      (evidence : FuelPositiveSampleEvidence program dispatcher bits registers
        fuel depth continuation)
      (first : FiniteController.seekMutation
        (SchedulerControl.machine program dispatcher) 2
        (fuelPositiveScriptSourceConfiguration program dispatcher registers fuel
          (environmentCode (compileActions program dispatcher.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program dispatcher.tree) bits)
            continuation depth [])) =
        some (fuelPositiveFirstMutationConfiguration program dispatcher registers
          fuel (environmentCode
            (compileActions program dispatcher.tree) bits) continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program dispatcher.tree) bits)
            continuation depth [])))
      (second : FiniteController.seekMutation
        (SchedulerControl.machine program dispatcher) 2
        (fuelPositiveFirstMutationConfiguration program dispatcher registers fuel
          (environmentCode (compileActions program dispatcher.tree) bits)
          continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program dispatcher.tree) bits)
            continuation depth [])) =
        some (fuelPositiveSecondMutationConfiguration program dispatcher registers
          fuel (environmentCode
            (compileActions program dispatcher.tree) bits) continuation
          (PrimitiveFuel.pendingParents
            (environmentCode (compileActions program dispatcher.tree) bits)
            continuation depth [])))
      (tail : FuelScriptSamples program dispatcher bits registers continuation
        hadmissible fuel (depth + 1)) :
      FuelScriptSamples program dispatcher bits registers continuation
        hadmissible (fuel + 1) depth

/-- Construct the full sampled fuel-script trace by unary-fuel induction. -/
theorem fuelScriptSamples
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (continuation : Term) (hadmissible : Carrier.Admissible continuation) :
    ∀ fuel depth,
      FuelScriptSamples program dispatcher bits registers continuation
        hadmissible fuel depth
  | 0, depth =>
      .zero depth
        (fuelZeroSampleEvidence program dispatcher bits registers depth
          continuation hadmissible)
        (fuelZero_seekFirst program dispatcher registers _ continuation _)
        (fuelZero_seekSecond program dispatcher registers _ continuation _)
        (fuelZero_seekThird program dispatcher registers _ continuation _)
        (fuelZero_seekFourth program dispatcher registers _ continuation _)
        (fuelZero_seekFifth program dispatcher registers _ continuation _)
  | fuel + 1, depth =>
      .succ fuel depth
        (fuelPositiveSampleEvidence program dispatcher bits registers fuel depth
          continuation)
        (fuelPositive_seekFirst program dispatcher registers fuel _ continuation _)
        (fuelPositive_seekSecond program dispatcher registers fuel _ continuation _)
        (fuelScriptSamples program dispatcher bits registers continuation
          hadmissible fuel (depth + 1))

/-- Every positive residual fuel call satisfies its syntactic successor test. -/
theorem fuelPositive_successorAnswer
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (fuel : Nat) (environment continuation : Term)
    (parents : List ParentFrame) :
    SchedulerControl.compiledProbeAnswer program dispatcher .fuelSuccessor
      (fuelCursor (fuel + 1) environment continuation parents) = true := by
  rfl

/-- The zero fuel call fails the successor test and satisfies the zero test. -/
theorem fuelZero_probeAnswers
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (environment continuation : Term) (parents : List ParentFrame) :
    SchedulerControl.compiledProbeAnswer program dispatcher .fuelSuccessor
        (fuelCursor 0 environment continuation parents) = false ∧
      SchedulerControl.compiledProbeAnswer program dispatcher .fuelZero
        (fuelCursor 0 environment continuation parents) = true := by
  exact ⟨rfl, rfl⟩

/-- Exact mutation-free cost from a positive fuel macro row to its script PC. -/
def fuelPositiveGuardTicks
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (fuel : Nat) (environment continuation : Term)
    (parents : List ParentFrame) : Nat :=
  1 + SchedulerControl.compiledProbeCost program dispatcher .fuelSuccessor
    (fuelCursor (fuel + 1) environment continuation parents)

/-- The positive fuel guard restores the cursor and selects its fixed script. -/
theorem fuelPositiveGuard_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (fuel : Nat)
    (environment continuation : Term) (parents : List ParentFrame) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (fuelPositiveGuardTicks program dispatcher fuel environment continuation
        parents)
      (fuelPhaseSourceConfiguration program dispatcher registers (fuel + 1)
        environment continuation parents)
      (fuelPositiveScriptSourceConfiguration program dispatcher registers fuel
        environment continuation parents) := by
  let origin := fuelCursor (fuel + 1) environment continuation parents
  let probeStart : Configuration program dispatcher :=
    ⟨some (SchedulerControl.startProbe .fuelSuccessor registers), origin⟩
  have enter : ZeroMutationRun (SchedulerControl.machine program dispatcher) 1
      (fuelPhaseSourceConfiguration program dispatcher registers (fuel + 1)
        environment continuation parents) probeStart := by
    exact ⟨rfl, rfl⟩
  have probe : ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher .fuelSuccessor
        origin)
      probeStart
      (fuelPositiveScriptSourceConfiguration program dispatcher registers fuel
        environment continuation parents) := by
    have run := SchedulerExecution.run_localProbe program dispatcher
      .fuelSuccessor registers origin rfl
    exact ⟨by
      simpa [origin, fuelPositive_successorAnswer,
        fuelPositiveScriptSourceConfiguration] using! run,
      SchedulerExecution.runMutationCount_localProbe program dispatcher
        .fuelSuccessor registers origin rfl⟩
  simpa [fuelPositiveGuardTicks, origin] using enter.trans probe

/-- Exact mutation-free cost from a zero fuel macro row to its script PC. -/
def fuelZeroGuardTicks
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (environment continuation : Term) (parents : List ParentFrame) : Nat :=
  1 + SchedulerControl.compiledProbeCost program dispatcher .fuelSuccessor
      (fuelCursor 0 environment continuation parents) +
    SchedulerControl.compiledProbeCost program dispatcher .fuelZero
      (fuelCursor 0 environment continuation parents)

/-- The two zero-fuel guards restore the cursor and select the Base script. -/
theorem fuelZeroGuard_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (environment continuation : Term)
    (parents : List ParentFrame) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (fuelZeroGuardTicks program dispatcher environment continuation parents)
      (fuelPhaseSourceConfiguration program dispatcher registers 0
        environment continuation parents)
      (fuelZeroScriptSourceConfiguration program dispatcher registers
        environment continuation parents) := by
  let origin := fuelCursor 0 environment continuation parents
  let successorStart : Configuration program dispatcher :=
    ⟨some (SchedulerControl.startProbe .fuelSuccessor registers), origin⟩
  let zeroStart : Configuration program dispatcher :=
    ⟨some (SchedulerControl.startProbe .fuelZero registers), origin⟩
  have enter : ZeroMutationRun (SchedulerControl.machine program dispatcher) 1
      (fuelPhaseSourceConfiguration program dispatcher registers 0
        environment continuation parents) successorStart := by
    exact ⟨rfl, rfl⟩
  have successor : ZeroMutationRun
      (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher .fuelSuccessor
        origin)
      successorStart zeroStart := by
    have run := SchedulerExecution.run_localProbe program dispatcher
      .fuelSuccessor registers origin rfl
    exact ⟨by simpa [origin, fuelZero_probeAnswers] using! run,
      SchedulerExecution.runMutationCount_localProbe program dispatcher
        .fuelSuccessor registers origin rfl⟩
  have zero : ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher .fuelZero origin)
      zeroStart
      (fuelZeroScriptSourceConfiguration program dispatcher registers
        environment continuation parents) := by
    have run := SchedulerExecution.run_localProbe program dispatcher
      .fuelZero registers origin rfl
    exact ⟨by
      simpa [origin, fuelZero_probeAnswers, fuelZeroScriptSourceConfiguration]
        using! run,
      SchedulerExecution.runMutationCount_localProbe program dispatcher
        .fuelZero registers origin rfl⟩
  simpa [fuelZeroGuardTicks, origin] using (enter.trans successor).trans zero

/-- The first positive-fuel contraction is found from the family macro state. -/
theorem fuelPositive_seekFirstFromPhase
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (fuel : Nat)
    (environment continuation : Term) (parents : List ParentFrame) :
    FiniteController.seekMutation (SchedulerControl.machine program dispatcher)
        (fuelPositiveGuardTicks program dispatcher fuel environment continuation
          parents + 2)
        (fuelPhaseSourceConfiguration program dispatcher registers (fuel + 1)
          environment continuation parents) =
      some (fuelPositiveFirstMutationConfiguration program dispatcher registers
        fuel environment continuation parents) :=
  (fuelPositiveGuard_zeroRun program dispatcher registers fuel environment
    continuation parents).seekMutation_prepend
      (fuelPositive_seekFirst program dispatcher registers fuel environment
        continuation parents)

/-- The first zero-fuel contraction is found from the family macro state. -/
theorem fuelZero_seekFirstFromPhase
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (environment continuation : Term)
    (parents : List ParentFrame) :
    FiniteController.seekMutation (SchedulerControl.machine program dispatcher)
        (fuelZeroGuardTicks program dispatcher environment continuation parents +
          2)
        (fuelPhaseSourceConfiguration program dispatcher registers 0
          environment continuation parents) =
      some (fuelZeroFirstMutationConfiguration program dispatcher registers
        environment continuation parents) :=
  (fuelZeroGuard_zeroRun program dispatcher registers environment continuation
    parents).seekMutation_prepend
      (fuelZero_seekFirst program dispatcher registers environment continuation
        parents)

/-- The positive script's terminal cursor moves contain no hidden contraction. -/
theorem fuelPositiveSampleSuffix_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (fuel : Nat)
    (environment continuation : Term) (parents : List ParentFrame) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher) 2
      (fuelPositiveSecondMutationConfiguration program dispatcher registers fuel
        environment continuation parents)
      (fuelPhaseSourceConfiguration program dispatcher registers fuel
        environment continuation
        (.right (.app environment continuation) :: parents)) :=
  ⟨run_fuelPositiveSampleSuffix program dispatcher registers fuel environment
      continuation parents,
    runMutationCount_fuelPositiveSampleSuffix program dispatcher registers fuel
      environment continuation parents⟩

/-- The zero script's terminal epsilon row contains no hidden contraction. -/
theorem fuelZeroSampleSuffix_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (environment continuation : Term)
    (parents : List ParentFrame) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher) 1
      (fuelZeroFifthMutationConfiguration program dispatcher registers
        environment continuation parents)
      (fuelPhaseCompletedConfiguration program dispatcher registers 0
        environment continuation parents) :=
  ⟨run_fuelZeroSampleSuffix program dispatcher registers environment
      continuation parents,
    runMutationCount_fuelZeroSampleSuffix program dispatcher registers
      environment continuation parents⟩

/-- Consecutive positive fuel layers are linked by an exact first-mutation search. -/
theorem fuelPositive_seekNextPositive
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (fuel : Nat)
    (environment continuation : Term) (parents : List ParentFrame) :
    let nextParents := .right (.app environment continuation) :: parents
    FiniteController.seekMutation (SchedulerControl.machine program dispatcher)
        (2 + (fuelPositiveGuardTicks program dispatcher fuel environment
          continuation nextParents + 2))
        (fuelPositiveSecondMutationConfiguration program dispatcher registers
          (fuel + 1) environment continuation parents) =
      some (fuelPositiveFirstMutationConfiguration program dispatcher registers
        fuel environment continuation nextParents) := by
  let nextParents := .right (.app environment continuation) :: parents
  exact
    (fuelPositiveSampleSuffix_zeroRun program dispatcher registers (fuel + 1)
      environment continuation parents).seekMutation_prepend
      (fuelPositive_seekFirstFromPhase program dispatcher registers fuel
        environment continuation nextParents)

/-- The last positive layer is linked exactly to the first zero-script sample. -/
theorem fuelPositive_seekNextZero
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (environment continuation : Term)
    (parents : List ParentFrame) :
    let nextParents := .right (.app environment continuation) :: parents
    FiniteController.seekMutation (SchedulerControl.machine program dispatcher)
        (2 + (fuelZeroGuardTicks program dispatcher environment continuation
          nextParents + 2))
        (fuelPositiveSecondMutationConfiguration program dispatcher registers 0
          environment continuation parents) =
      some (fuelZeroFirstMutationConfiguration program dispatcher registers
        environment continuation nextParents) := by
  let nextParents := .right (.app environment continuation) :: parents
  exact
    (fuelPositiveSampleSuffix_zeroRun program dispatcher registers 0 environment
      continuation parents).seekMutation_prepend
      (fuelZero_seekFirstFromPhase program dispatcher registers environment
        continuation nextParents)

/--
The complete fuel sample certificate, rooted at the family macro rather than
at an already selected script.  Its `scripts` field classifies every post-Rdx
PC, while `starts` identifies the first contraction from the exact macro
zipper at the current pending depth.
-/
inductive FuelPhaseSamples
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (continuation : Term) (hadmissible : Carrier.Admissible continuation) :
    Nat → Nat → Prop where
  | zero (depth : Nat)
      (scripts : FuelScriptSamples program dispatcher bits registers
        continuation hadmissible 0 depth)
      (starts :
        let environment :=
          environmentCode (compileActions program dispatcher.tree) bits
        let parents := PrimitiveFuel.pendingParents environment continuation
          depth []
        FiniteController.seekMutation
            (SchedulerControl.machine program dispatcher)
            (fuelZeroGuardTicks program dispatcher environment continuation
              parents + 2)
            (fuelPhaseSourceConfiguration program dispatcher registers 0
              environment continuation parents) =
          some (fuelZeroFirstMutationConfiguration program dispatcher registers
            environment continuation parents)) :
      FuelPhaseSamples program dispatcher bits registers continuation
        hadmissible 0 depth
  | succ (fuel depth : Nat)
      (scripts : FuelScriptSamples program dispatcher bits registers
        continuation hadmissible (fuel + 1) depth)
      (starts :
        let environment :=
          environmentCode (compileActions program dispatcher.tree) bits
        let parents := PrimitiveFuel.pendingParents environment continuation
          depth []
        FiniteController.seekMutation
            (SchedulerControl.machine program dispatcher)
            (fuelPositiveGuardTicks program dispatcher fuel environment
              continuation parents + 2)
            (fuelPhaseSourceConfiguration program dispatcher registers
              (fuel + 1) environment continuation parents) =
          some (fuelPositiveFirstMutationConfiguration program dispatcher
            registers fuel environment continuation parents)) :
      FuelPhaseSamples program dispatcher bits registers continuation
        hadmissible (fuel + 1) depth

/-- Construct the exact macro-rooted sampled fuel trace at every depth. -/
theorem fuelPhaseSamples
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (continuation : Term) (hadmissible : Carrier.Admissible continuation) :
    ∀ fuel depth,
      FuelPhaseSamples program dispatcher bits registers continuation
        hadmissible fuel depth
  | 0, depth => by
      let environment :=
        environmentCode (compileActions program dispatcher.tree) bits
      let parents := PrimitiveFuel.pendingParents environment continuation
        depth []
      exact .zero depth
        (fuelScriptSamples program dispatcher bits registers continuation
          hadmissible 0 depth)
        (fuelZero_seekFirstFromPhase program dispatcher registers environment
          continuation parents)
  | fuel + 1, depth => by
      let environment :=
        environmentCode (compileActions program dispatcher.tree) bits
      let parents := PrimitiveFuel.pendingParents environment continuation
        depth []
      exact .succ fuel depth
        (fuelScriptSamples program dispatcher bits registers continuation
          hadmissible (fuel + 1) depth)
        (fuelPositive_seekFirstFromPhase program dispatcher registers fuel
          environment continuation parents)

/-- Exact microtick cost of one positive fuel layer, including its guard. -/
def fuelPositiveSegmentTicks
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (fuel : Nat) (environment continuation : Term)
    (parents : List ParentFrame) : Nat :=
  1 + SchedulerControl.compiledProbeCost program dispatcher .fuelSuccessor
      (fuelCursor (fuel + 1) environment continuation parents) + 6

/-- One guarded positive fuel script reaches the next exact residual call. -/
theorem fuelPositiveSegment
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (fuel : Nat)
    (environment continuation : Term) (parents : List ParentFrame) :
    CountedRun (SchedulerControl.machine program dispatcher)
      (fuelPositiveSegmentTicks program dispatcher fuel environment continuation
        parents) 2
      (fuelPhaseSourceConfiguration program dispatcher registers (fuel + 1)
        environment continuation parents)
      (fuelPhaseSourceConfiguration program dispatcher registers fuel
        environment continuation
        (.right (.app environment continuation) :: parents)) := by
  let origin := fuelCursor (fuel + 1) environment continuation parents
  let after := fuelCursor fuel environment continuation
    (.right (.app environment continuation) :: parents)
  let probeStart : Configuration program dispatcher :=
    ⟨some (SchedulerControl.startProbe .fuelSuccessor registers), origin⟩
  let scriptStart : Configuration program dispatcher :=
    ⟨some (SchedulerControl.startScript .fuelPositive registers), origin⟩
  have enter : ZeroMutationRun (SchedulerControl.machine program dispatcher) 1
      (fuelPhaseSourceConfiguration program dispatcher registers (fuel + 1)
        environment continuation parents) probeStart := by
    exact ⟨rfl, rfl⟩
  have probe : ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher .fuelSuccessor origin)
      probeStart scriptStart := by
    have run := SchedulerExecution.run_localProbe program dispatcher
      (.fuelSuccessor) registers origin rfl
    exact ⟨by simpa [origin, fuelPositive_successorAnswer] using! run,
      SchedulerExecution.runMutationCount_localProbe program dispatcher
        (.fuelSuccessor) registers origin rfl⟩
  have script : CountedRun (SchedulerControl.machine program dispatcher) 6 2
      scriptStart
      (fuelPhaseSourceConfiguration program dispatcher registers fuel
        environment continuation
        (.right (.app environment continuation) :: parents)) := by
    have run := SchedulerExecution.run_script program dispatcher .fuelPositive
      registers origin after
      (SchedulerControl.run_fuelPositive_job program dispatcher fuel
        environment continuation parents)
    have count := SchedulerExecution.runMutationCount_script program dispatcher
      .fuelPositive registers origin after
      (SchedulerControl.run_fuelPositive_job program dispatcher fuel
        environment continuation parents)
    exact ⟨by simpa [origin, after, fuelPhaseSourceConfiguration, fuelCursor]
        using! run,
      by simpa [origin, after] using! count⟩
  simpa [fuelPositiveSegmentTicks, origin] using
    ((enter.trans probe).toCounted.trans script)

/-- Exact microtick cost of the zero fuel guard and Base-producing script. -/
def fuelZeroSegmentTicks
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (environment continuation : Term) (parents : List ParentFrame) : Nat :=
  1 + SchedulerControl.compiledProbeCost program dispatcher .fuelSuccessor
      (fuelCursor 0 environment continuation parents) +
    SchedulerControl.compiledProbeCost program dispatcher .fuelZero
      (fuelCursor 0 environment continuation parents) + 12

/-- The guarded zero-fuel script reaches the literal Base in exactly five mutations. -/
theorem fuelZeroSegment
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (environment continuation : Term)
    (parents : List ParentFrame) :
    CountedRun (SchedulerControl.machine program dispatcher)
      (fuelZeroSegmentTicks program dispatcher environment continuation parents) 5
      (fuelPhaseSourceConfiguration program dispatcher registers 0
        environment continuation parents)
      (fuelPhaseCompletedConfiguration program dispatcher registers 0
        environment continuation parents) := by
  let origin := fuelCursor 0 environment continuation parents
  let successorStart : Configuration program dispatcher :=
    ⟨some (SchedulerControl.startProbe .fuelSuccessor registers), origin⟩
  let zeroStart : Configuration program dispatcher :=
    ⟨some (SchedulerControl.startProbe .fuelZero registers), origin⟩
  let scriptStart : Configuration program dispatcher :=
    ⟨some (SchedulerControl.startScript .fuelZero registers), origin⟩
  let after : Cursor := ⟨baseCarrier environment continuation, parents⟩
  have enter : ZeroMutationRun (SchedulerControl.machine program dispatcher) 1
      (fuelPhaseSourceConfiguration program dispatcher registers 0
        environment continuation parents) successorStart := by
    exact ⟨rfl, rfl⟩
  have successor : ZeroMutationRun
      (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher .fuelSuccessor origin)
      successorStart zeroStart := by
    have run := SchedulerExecution.run_localProbe program dispatcher
      (.fuelSuccessor) registers origin rfl
    exact ⟨by simpa [origin, fuelZero_probeAnswers] using! run,
      SchedulerExecution.runMutationCount_localProbe program dispatcher
        (.fuelSuccessor) registers origin rfl⟩
  have zero : ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher .fuelZero origin)
      zeroStart scriptStart := by
    have run := SchedulerExecution.run_localProbe program dispatcher
      (.fuelZero) registers origin rfl
    exact ⟨by simpa [origin, fuelZero_probeAnswers] using! run,
      SchedulerExecution.runMutationCount_localProbe program dispatcher
        (.fuelZero) registers origin rfl⟩
  have script : CountedRun (SchedulerControl.machine program dispatcher) 12 5
      scriptStart
      (fuelPhaseCompletedConfiguration program dispatcher registers 0
        environment continuation parents) := by
    have run := SchedulerExecution.run_script program dispatcher .fuelZero
      registers origin after
      (SchedulerControl.run_fuelZero_job program dispatcher environment
        continuation parents)
    have count := SchedulerExecution.runMutationCount_script program dispatcher
      .fuelZero registers origin after
      (SchedulerControl.run_fuelZero_job program dispatcher environment
        continuation parents)
    exact ⟨by simpa [origin, after, fuelPhaseCompletedConfiguration]
        using! run,
      by simpa [origin, after] using! count⟩
  simpa [fuelZeroSegmentTicks, origin] using
    (((enter.trans successor).trans zero).toCounted.trans script)

/-- Computable microtick cost of the complete syntax-directed fuel phase. -/
def fuelPhaseTicks
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (environment continuation : Term) :
    Nat → List ParentFrame → Nat
  | 0, parents =>
      fuelZeroSegmentTicks program dispatcher environment continuation parents
  | fuel + 1, parents =>
      fuelPositiveSegmentTicks program dispatcher fuel environment continuation
          parents +
        fuelPhaseTicks program dispatcher environment continuation fuel
          (.right (.app environment continuation) :: parents)

/-- The full fuel loop reaches Base beneath exactly the recorded pending frames. -/
theorem executeFuel_run
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (environment continuation : Term) :
    ∀ fuel parents,
      FiniteController.run (SchedulerControl.machine program dispatcher)
          (fuelPhaseTicks program dispatcher environment continuation fuel parents)
          (fuelPhaseSourceConfiguration program dispatcher registers fuel
            environment continuation parents) =
        fuelPhaseCompletedConfiguration program dispatcher registers fuel
          environment continuation parents
  | 0, parents => (fuelZeroSegment program dispatcher registers
      environment continuation parents).run_eq
  | fuel + 1, parents => by
      rw [fuelPhaseTicks, FiniteController.run_add,
        (fuelPositiveSegment program dispatcher registers fuel environment
          continuation parents).run_eq]
      have tail := executeFuel_run program dispatcher registers environment
        continuation fuel (.right (.app environment continuation) :: parents)
      simpa [fuelPhaseCompletedConfiguration, PrimitiveFuel.pendingParents]
        using tail

/-- The full fuel loop has exactly the public `2 * fuel + 5` contraction count. -/
theorem executeFuel_mutationCount
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (environment continuation : Term) :
    ∀ fuel parents,
      FiniteController.runMutationCount
          (SchedulerControl.machine program dispatcher)
          (fuelPhaseTicks program dispatcher environment continuation fuel parents)
          (fuelPhaseSourceConfiguration program dispatcher registers fuel
            environment continuation parents) = 2 * fuel + 5
  | 0, parents => (fuelZeroSegment program dispatcher registers
      environment continuation parents).count_eq
  | fuel + 1, parents => by
      rw [fuelPhaseTicks, FiniteController.runMutationCount_add,
        (fuelPositiveSegment program dispatcher registers fuel environment
          continuation parents).count_eq,
        (fuelPositiveSegment program dispatcher registers fuel environment
          continuation parents).run_eq,
        executeFuel_mutationCount program dispatcher registers environment
          continuation fuel (.right (.app environment continuation) :: parents)]
      simp only [Nat.mul_succ]
      calc
        2 + (2 * fuel + 5) = (2 + 2 * fuel) + 5 := by
          rw [Nat.add_assoc]
        _ = (2 * fuel + 2) + 5 := by
          rw [Nat.add_comm 2 (2 * fuel)]
        _ = 2 * fuel + (2 + 5) := by
          rw [Nat.add_assoc]

/-- Load-bearing exact endpoint/count certificate for unary fuel expansion. -/
structure FuelExecution
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (fuel : Nat)
    (environment continuation : Term) (parents : List ParentFrame) : Prop where
  run_eq : FiniteController.run (SchedulerControl.machine program dispatcher)
      (fuelPhaseTicks program dispatcher environment continuation fuel parents)
      (fuelPhaseSourceConfiguration program dispatcher registers fuel
        environment continuation parents) =
    fuelPhaseCompletedConfiguration program dispatcher registers fuel
      environment continuation parents
  mutationCount_eq : FiniteController.runMutationCount
      (SchedulerControl.machine program dispatcher)
      (fuelPhaseTicks program dispatcher environment continuation fuel parents)
      (fuelPhaseSourceConfiguration program dispatcher registers fuel
        environment continuation parents) = 2 * fuel + 5
  reduction : StepsN (2 * fuel + 5)
      (fuelPhaseSourceConfiguration program dispatcher registers fuel
        environment continuation parents).cursor.erase
      (fuelPhaseCompletedConfiguration program dispatcher registers fuel
        environment continuation parents).cursor.erase

/-- Construct the complete controller fuel certificate in every outer context. -/
theorem executeFuel
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (fuel : Nat)
    (environment continuation : Term) (parents : List ParentFrame) :
    FuelExecution program dispatcher registers fuel environment continuation
      parents := by
  have runEq := executeFuel_run program dispatcher registers environment
    continuation fuel parents
  have countEq := executeFuel_mutationCount program dispatcher registers
    environment continuation fuel parents
  have projected := FiniteController.run_projects_stepsN
    (SchedulerControl.machine program dispatcher)
    (fuelPhaseTicks program dispatcher environment continuation fuel parents)
    (fuelPhaseSourceConfiguration program dispatcher registers fuel environment
      continuation parents)
  rw [countEq, runEq] at projected
  exact ⟨runEq, countEq, projected⟩

/-! ## Canonical DOWN queue traversal -/

/-- DOWN-family macro configuration at an exact focus and zipper suffix. -/
def downConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (focus : Term)
    (parents : List ParentFrame) : Configuration program dispatcher :=
  ⟨some (.macro (.family .down) registers), ⟨focus, parents⟩⟩

/-- Script-entry configuration after a live queue cell has been recognized. -/
def downLiveScriptConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (tail : Term)
    (parents : List ParentFrame) : Configuration program dispatcher :=
  ⟨some (SchedulerControl.startScript .downLive registers),
    ⟨.app (PureSFormal.PureS.live bit) tail, parents⟩⟩

/-- Exact guard cost for either Boolean live-cell constructor. -/
def downLiveGuardTicks
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (tail : Term) (parents : List ParentFrame) : Nat :=
  let origin : Cursor :=
    ⟨.app (PureSFormal.PureS.live bit) tail, parents⟩
  1 + SchedulerControl.compiledProbeCost program dispatcher .downLiveZero
      origin +
    if bit then
      SchedulerControl.compiledProbeCost program dispatcher .downLiveOne origin
    else 0

theorem downLiveZero_false_answer
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (tail : Term) (parents : List ParentFrame) :
    SchedulerControl.compiledProbeAnswer program dispatcher .downLiveZero
      ⟨.app (PureSFormal.PureS.live false) tail, parents⟩ = true :=
  rfl

theorem downLiveZero_true_answer
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (tail : Term) (parents : List ParentFrame) :
    SchedulerControl.compiledProbeAnswer program dispatcher .downLiveZero
      ⟨.app (PureSFormal.PureS.live true) tail, parents⟩ = false :=
  rfl

theorem downLiveOne_true_answer
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (tail : Term) (parents : List ParentFrame) :
    SchedulerControl.compiledProbeAnswer program dispatcher .downLiveOne
      ⟨.app (PureSFormal.PureS.live true) tail, parents⟩ = true :=
  rfl

/-- The ordered live guards select the fixed one-edge descent script. -/
theorem downLiveGuard_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (tail : Term)
    (parents : List ParentFrame) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (downLiveGuardTicks program dispatcher bit tail parents)
      (downConfiguration program dispatcher registers
        (.app (PureSFormal.PureS.live bit) tail) parents)
      (downLiveScriptConfiguration program dispatcher registers bit tail
        parents) := by
  let origin : Cursor :=
    ⟨.app (PureSFormal.PureS.live bit) tail, parents⟩
  let firstStart : Configuration program dispatcher :=
    ⟨some (SchedulerControl.startProbe .downLiveZero registers), origin⟩
  have enter : ZeroMutationRun (SchedulerControl.machine program dispatcher) 1
      (downConfiguration program dispatcher registers
        (.app (PureSFormal.PureS.live bit) tail) parents)
      firstStart := by
    exact ⟨rfl, rfl⟩
  cases bit with
  | false =>
      have first := ZeroMutationRun.localProbe program dispatcher
        .downLiveZero registers origin rfl
      have selected : ZeroMutationRun
          (SchedulerControl.machine program dispatcher)
          (SchedulerControl.compiledProbeCost program dispatcher .downLiveZero
            origin)
          firstStart
          (downLiveScriptConfiguration program dispatcher registers false tail
            parents) := by
        simpa [firstStart, origin, downLiveScriptConfiguration,
          SchedulerExecution.commandResult, SchedulerControl.probeAnswer,
          downLiveZero_false_answer] using first
      simpa [downLiveGuardTicks, origin] using enter.trans selected
  | true =>
      let secondStart : Configuration program dispatcher :=
        ⟨some (SchedulerControl.startProbe .downLiveOne registers), origin⟩
      have first := ZeroMutationRun.localProbe program dispatcher
        .downLiveZero registers origin rfl
      have rejectedFirst : ZeroMutationRun
          (SchedulerControl.machine program dispatcher)
          (SchedulerControl.compiledProbeCost program dispatcher .downLiveZero
            origin)
          firstStart secondStart := by
        simpa [firstStart, secondStart, origin,
          SchedulerExecution.commandResult, SchedulerControl.probeAnswer,
          downLiveZero_true_answer] using first
      have second := ZeroMutationRun.localProbe program dispatcher
        .downLiveOne registers origin rfl
      have selected : ZeroMutationRun
          (SchedulerControl.machine program dispatcher)
          (SchedulerControl.compiledProbeCost program dispatcher .downLiveOne
            origin)
          secondStart
          (downLiveScriptConfiguration program dispatcher registers true tail
            parents) := by
        simpa [secondStart, origin, downLiveScriptConfiguration,
          SchedulerExecution.commandResult, SchedulerControl.probeAnswer,
          downLiveOne_true_answer] using second
      simpa [downLiveGuardTicks, origin] using
        (enter.trans rejectedFirst).trans selected

/-- The live-cell script follows the registered queue child without mutation. -/
theorem downLiveScript_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (tail : Term)
    (parents : List ParentFrame) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher) 2
      (downLiveScriptConfiguration program dispatcher registers bit tail parents)
      (downConfiguration program dispatcher registers tail
        (.right (PureSFormal.PureS.live bit) :: parents)) := by
  have executed : Script.run
      (SchedulerControl.jobScript program dispatcher .downLive)
      ⟨.app (PureSFormal.PureS.live bit) tail, parents⟩ =
      some ⟨tail,
        .right (PureSFormal.PureS.live bit) :: parents⟩ := by
    rfl
  have script := ZeroMutationRun.script program dispatcher .downLive registers
    ⟨.app (PureSFormal.PureS.live bit) tail, parents⟩
    ⟨tail, .right (PureSFormal.PureS.live bit) :: parents⟩
    executed rfl
  simpa [downLiveScriptConfiguration, downConfiguration] using! script

/-- One complete live-cell DOWN iteration has an exact endpoint and zero Rdx. -/
theorem downLive_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (tail : Term)
    (parents : List ParentFrame) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (downLiveGuardTicks program dispatcher bit tail parents + 2)
      (downConfiguration program dispatcher registers
        (.app (PureSFormal.PureS.live bit) tail) parents)
      (downConfiguration program dispatcher registers tail
        (.right (PureSFormal.PureS.live bit) :: parents)) :=
  (downLiveGuard_zeroRun program dispatcher registers bit tail parents).trans
    (downLiveScript_zeroRun program dispatcher registers bit tail parents)

/-- Script-entry configuration after a tombstone has been recognized. -/
def downTombstoneScriptConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (predecessor audit : Term)
    (parents : List ParentFrame) : Configuration program dispatcher :=
  ⟨some (SchedulerControl.startScript .downTombstone registers),
    ⟨Carrier.tombstone bit predecessor audit, parents⟩⟩

/-- Exact ordered-guard cost for either Boolean tombstone constructor. -/
def downTombstoneGuardTicks
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (predecessor audit : Term)
    (parents : List ParentFrame) : Nat :=
  let origin : Cursor :=
    ⟨Carrier.tombstone bit predecessor audit, parents⟩
  (((1 + SchedulerControl.compiledProbeCost program dispatcher .downLiveZero
      origin) +
    SchedulerControl.compiledProbeCost program dispatcher .downLiveOne origin) +
    SchedulerControl.compiledProbeCost program dispatcher .downTombstoneZero
      origin) +
    if bit then
      SchedulerControl.compiledProbeCost program dispatcher .downTombstoneOne
        origin
    else 0

theorem downTombstone_liveZero_answer
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (predecessor audit : Term) (parents : List ParentFrame) :
    SchedulerControl.compiledProbeAnswer program dispatcher .downLiveZero
      ⟨Carrier.tombstone bit predecessor audit, parents⟩ = false := by
  cases bit <;> rfl

theorem downTombstone_liveOne_answer
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bit : Bool) (predecessor audit : Term) (parents : List ParentFrame) :
    SchedulerControl.compiledProbeAnswer program dispatcher .downLiveOne
      ⟨Carrier.tombstone bit predecessor audit, parents⟩ = false := by
  cases bit <;> rfl

theorem downTombstoneZero_false_answer
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (predecessor audit : Term) (parents : List ParentFrame) :
    SchedulerControl.compiledProbeAnswer program dispatcher .downTombstoneZero
      ⟨Carrier.tombstone false predecessor audit, parents⟩ = true :=
  rfl

theorem downTombstoneZero_true_answer
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (predecessor audit : Term) (parents : List ParentFrame) :
    SchedulerControl.compiledProbeAnswer program dispatcher .downTombstoneZero
      ⟨Carrier.tombstone true predecessor audit, parents⟩ = false :=
  rfl

theorem downTombstoneOne_true_answer
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (predecessor audit : Term) (parents : List ParentFrame) :
    SchedulerControl.compiledProbeAnswer program dispatcher .downTombstoneOne
      ⟨Carrier.tombstone true predecessor audit, parents⟩ = true :=
  rfl

/-- The ordered live/tombstone guards select the two-edge predecessor script. -/
theorem downTombstoneGuard_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (predecessor audit : Term)
    (parents : List ParentFrame) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (downTombstoneGuardTicks program dispatcher bit predecessor audit parents)
      (downConfiguration program dispatcher registers
        (Carrier.tombstone bit predecessor audit) parents)
      (downTombstoneScriptConfiguration program dispatcher registers bit
        predecessor audit parents) := by
  let origin : Cursor :=
    ⟨Carrier.tombstone bit predecessor audit, parents⟩
  let liveZeroStart : Configuration program dispatcher :=
    ⟨some (SchedulerControl.startProbe .downLiveZero registers), origin⟩
  let liveOneStart : Configuration program dispatcher :=
    ⟨some (SchedulerControl.startProbe .downLiveOne registers), origin⟩
  let tombstoneZeroStart : Configuration program dispatcher :=
    ⟨some (SchedulerControl.startProbe .downTombstoneZero registers), origin⟩
  have enter : ZeroMutationRun (SchedulerControl.machine program dispatcher) 1
      (downConfiguration program dispatcher registers
        (Carrier.tombstone bit predecessor audit) parents)
      liveZeroStart := by
    exact ⟨rfl, rfl⟩
  have liveZeroProbe := ZeroMutationRun.localProbe program dispatcher
    .downLiveZero registers origin rfl
  have liveZero : ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher .downLiveZero
        origin) liveZeroStart liveOneStart := by
    cases bit <;>
      simpa [liveZeroStart, liveOneStart, origin,
        SchedulerExecution.commandResult, SchedulerControl.probeAnswer,
        downTombstone_liveZero_answer]
        using liveZeroProbe
  have liveOneProbe := ZeroMutationRun.localProbe program dispatcher
    .downLiveOne registers origin rfl
  have liveOne : ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher .downLiveOne origin)
      liveOneStart tombstoneZeroStart := by
    cases bit <;>
      simpa [liveOneStart, tombstoneZeroStart, origin,
        SchedulerExecution.commandResult, SchedulerControl.probeAnswer,
        downTombstone_liveOne_answer]
        using liveOneProbe
  cases bit with
  | false =>
      have tombstoneZeroProbe := ZeroMutationRun.localProbe program dispatcher
        .downTombstoneZero registers origin rfl
      have selected : ZeroMutationRun
          (SchedulerControl.machine program dispatcher)
          (SchedulerControl.compiledProbeCost program dispatcher
            .downTombstoneZero origin)
          tombstoneZeroStart
          (downTombstoneScriptConfiguration program dispatcher registers false
            predecessor audit parents) := by
        simpa [tombstoneZeroStart, origin,
          downTombstoneScriptConfiguration,
          SchedulerExecution.commandResult, SchedulerControl.probeAnswer,
          downTombstoneZero_false_answer]
          using tombstoneZeroProbe
      simpa [downTombstoneGuardTicks, origin] using
        ((enter.trans liveZero).trans liveOne).trans selected
  | true =>
      let tombstoneOneStart : Configuration program dispatcher :=
        ⟨some (SchedulerControl.startProbe .downTombstoneOne registers), origin⟩
      have tombstoneZeroProbe := ZeroMutationRun.localProbe program dispatcher
        .downTombstoneZero registers origin rfl
      have tombstoneZero : ZeroMutationRun
          (SchedulerControl.machine program dispatcher)
          (SchedulerControl.compiledProbeCost program dispatcher
            .downTombstoneZero origin)
          tombstoneZeroStart tombstoneOneStart := by
        simpa [tombstoneZeroStart, tombstoneOneStart, origin,
          SchedulerExecution.commandResult, SchedulerControl.probeAnswer,
          downTombstoneZero_true_answer]
          using tombstoneZeroProbe
      have tombstoneOneProbe := ZeroMutationRun.localProbe program dispatcher
        .downTombstoneOne registers origin rfl
      have selected : ZeroMutationRun
          (SchedulerControl.machine program dispatcher)
          (SchedulerControl.compiledProbeCost program dispatcher
            .downTombstoneOne origin)
          tombstoneOneStart
          (downTombstoneScriptConfiguration program dispatcher registers true
            predecessor audit parents) := by
        simpa [tombstoneOneStart, origin,
          downTombstoneScriptConfiguration,
          SchedulerExecution.commandResult, SchedulerControl.probeAnswer,
          downTombstoneOne_true_answer]
          using tombstoneOneProbe
      simpa [downTombstoneGuardTicks, origin] using
        (((enter.trans liveZero).trans liveOne).trans tombstoneZero).trans
          selected

/-- The tombstone script follows its registered predecessor without mutation. -/
theorem downTombstoneScript_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (predecessor audit : Term)
    (parents : List ParentFrame) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher) 3
      (downTombstoneScriptConfiguration program dispatcher registers bit
        predecessor audit parents)
      (downConfiguration program dispatcher registers predecessor
        (.right .s :: .left (.app (valueTag bit) audit) :: parents)) := by
  have executed : Script.run
      (SchedulerControl.jobScript program dispatcher .downTombstone)
      ⟨Carrier.tombstone bit predecessor audit, parents⟩ =
      some ⟨predecessor,
        .right .s :: .left (.app (valueTag bit) audit) :: parents⟩ := by
    rfl
  have script := ZeroMutationRun.script program dispatcher .downTombstone
    registers ⟨Carrier.tombstone bit predecessor audit, parents⟩
    ⟨predecessor,
      .right .s :: .left (.app (valueTag bit) audit) :: parents⟩
    executed rfl
  simpa [downTombstoneScriptConfiguration, downConfiguration] using! script

/-- One complete tombstone DOWN iteration has an exact endpoint and zero Rdx. -/
theorem downTombstone_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (bit : Bool) (predecessor audit : Term)
    (parents : List ParentFrame) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (downTombstoneGuardTicks program dispatcher bit predecessor audit parents +
        3)
      (downConfiguration program dispatcher registers
        (Carrier.tombstone bit predecessor audit) parents)
      (downConfiguration program dispatcher registers predecessor
        (.right .s :: .left (.app (valueTag bit) audit) :: parents)) :=
  (downTombstoneGuard_zeroRun program dispatcher registers bit predecessor audit
    parents).trans
    (downTombstoneScript_zeroRun program dispatcher registers bit predecessor
      audit parents)

/-- The six ordered DOWN guards classify every exact mutable Base literally. -/
theorem downBase_probeAnswers
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (actions : Term) (bits : List Bool) (continuation queue : Term)
    (parents : List ParentFrame) :
    let origin : Cursor :=
      ⟨MutableBase.mutableBase actions bits continuation queue, parents⟩
    SchedulerControl.compiledProbeAnswer program dispatcher .downLiveZero
        origin = false ∧
      SchedulerControl.compiledProbeAnswer program dispatcher .downLiveOne
        origin = false ∧
      SchedulerControl.compiledProbeAnswer program dispatcher .downTombstoneZero
        origin = false ∧
      SchedulerControl.compiledProbeAnswer program dispatcher .downTombstoneOne
        origin = false ∧
      SchedulerControl.compiledProbeAnswer program dispatcher .downLocal
        origin = false ∧
      SchedulerControl.compiledProbeAnswer program dispatcher .downBase
        origin = true := by
  simp [SchedulerControl.compiledProbeAnswer,
    SchedulerControl.probeSite, SchedulerControl.probePattern,
    SchedulerControl.livePattern, SchedulerControl.tombstonePattern,
    SchedulerControl.localPattern, SchedulerControl.basePattern,
    SchedulerControl.exactPattern, SchedulerControl.headArityPattern,
    Pattern.matchesBool, MutableBase.mutableBase, MutableBase.base,
    MutableBase.activeAlpha, MutableBase.activeEnvironment,
    MutableBase.activeDispatcher, MutableBase.activeSeed,
    PureSFormal.PureS.live, Carrier.tombstone, baseBeta, baseAlpha,
    environmentCode, PendingFrame.envelope, PendingFrame.envelopeSlot,
    haltCode, b, p, valueTag, v0, v1, C]

/-- Script-entry configuration after an exact mutable Base is recognized. -/
def downBaseScriptConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (actions : Term) (bits : List Bool)
    (continuation queue : Term) (parents : List ParentFrame) :
    Configuration program dispatcher :=
  ⟨some (SchedulerControl.startScript .downBase registers),
    ⟨MutableBase.mutableBase actions bits continuation queue, parents⟩⟩

/-- Exact ordered-guard cost for a mutation-closed Base boundary. -/
def downBaseGuardTicks
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (actions : Term) (bits : List Bool) (continuation queue : Term)
    (parents : List ParentFrame) : Nat :=
  let origin : Cursor :=
    ⟨MutableBase.mutableBase actions bits continuation queue, parents⟩
  (((((1 + SchedulerControl.compiledProbeCost program dispatcher
      .downLiveZero origin) +
    SchedulerControl.compiledProbeCost program dispatcher .downLiveOne origin) +
    SchedulerControl.compiledProbeCost program dispatcher .downTombstoneZero
      origin) +
    SchedulerControl.compiledProbeCost program dispatcher .downTombstoneOne
      origin) +
    SchedulerControl.compiledProbeCost program dispatcher .downLocal origin) +
    SchedulerControl.compiledProbeCost program dispatcher .downBase origin

/-- The ordered DOWN guards select the exact Base address script. -/
theorem downBaseGuard_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (actions : Term) (bits : List Bool)
    (continuation queue : Term) (parents : List ParentFrame) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (downBaseGuardTicks program dispatcher actions bits continuation queue
        parents)
      (downConfiguration program dispatcher registers
        (MutableBase.mutableBase actions bits continuation queue) parents)
      (downBaseScriptConfiguration program dispatcher registers actions bits
        continuation queue parents) := by
  let origin : Cursor :=
    ⟨MutableBase.mutableBase actions bits continuation queue, parents⟩
  let liveZeroStart : Configuration program dispatcher :=
    ⟨some (SchedulerControl.startProbe .downLiveZero registers), origin⟩
  let liveOneStart : Configuration program dispatcher :=
    ⟨some (SchedulerControl.startProbe .downLiveOne registers), origin⟩
  let tombstoneZeroStart : Configuration program dispatcher :=
    ⟨some (SchedulerControl.startProbe .downTombstoneZero registers), origin⟩
  let tombstoneOneStart : Configuration program dispatcher :=
    ⟨some (SchedulerControl.startProbe .downTombstoneOne registers), origin⟩
  let localStart : Configuration program dispatcher :=
    ⟨some (SchedulerControl.startProbe .downLocal registers), origin⟩
  let baseStart : Configuration program dispatcher :=
    ⟨some (SchedulerControl.startProbe .downBase registers), origin⟩
  have enter : ZeroMutationRun (SchedulerControl.machine program dispatcher) 1
      (downConfiguration program dispatcher registers
        (MutableBase.mutableBase actions bits continuation queue) parents)
      liveZeroStart := by
    exact ⟨rfl, rfl⟩
  have liveZeroProbe := ZeroMutationRun.localProbe program dispatcher
    .downLiveZero registers origin rfl
  have liveZero : ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher .downLiveZero
        origin) liveZeroStart liveOneStart := by
    simpa [liveZeroStart, liveOneStart, origin,
      SchedulerExecution.commandResult, SchedulerControl.probeAnswer,
      downBase_probeAnswers] using liveZeroProbe
  have liveOneProbe := ZeroMutationRun.localProbe program dispatcher
    .downLiveOne registers origin rfl
  have liveOne : ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher .downLiveOne origin)
      liveOneStart tombstoneZeroStart := by
    simpa [liveOneStart, tombstoneZeroStart, origin,
      SchedulerExecution.commandResult, SchedulerControl.probeAnswer,
      downBase_probeAnswers] using liveOneProbe
  have tombstoneZeroProbe := ZeroMutationRun.localProbe program dispatcher
    .downTombstoneZero registers origin rfl
  have tombstoneZero : ZeroMutationRun
      (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher .downTombstoneZero
        origin) tombstoneZeroStart tombstoneOneStart := by
    simpa [tombstoneZeroStart, tombstoneOneStart, origin,
      SchedulerExecution.commandResult, SchedulerControl.probeAnswer,
      downBase_probeAnswers] using tombstoneZeroProbe
  have tombstoneOneProbe := ZeroMutationRun.localProbe program dispatcher
    .downTombstoneOne registers origin rfl
  have tombstoneOne : ZeroMutationRun
      (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher .downTombstoneOne
        origin) tombstoneOneStart localStart := by
    simpa [tombstoneOneStart, localStart, origin,
      SchedulerExecution.commandResult, SchedulerControl.probeAnswer,
      downBase_probeAnswers] using tombstoneOneProbe
  have localProbeRun := ZeroMutationRun.localProbe program dispatcher .downLocal
    registers origin rfl
  have localSegment : ZeroMutationRun
      (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher .downLocal origin)
      localStart baseStart := by
    simpa [localStart, baseStart, origin,
      SchedulerExecution.commandResult, SchedulerControl.probeAnswer,
      downBase_probeAnswers] using localProbeRun
  have baseProbe := ZeroMutationRun.localProbe program dispatcher .downBase
    registers origin rfl
  have selected : ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher .downBase origin)
      baseStart
      (downBaseScriptConfiguration program dispatcher registers actions bits
        continuation queue parents) := by
    simpa [baseStart, origin, downBaseScriptConfiguration,
      SchedulerExecution.commandResult, SchedulerControl.probeAnswer,
      downBase_probeAnswers] using baseProbe
  simpa [downBaseGuardTicks, origin] using
    (((((enter.trans liveZero).trans liveOne).trans tombstoneZero).trans
      tombstoneOne).trans localSegment).trans selected

/-- The fixed Base script reaches the exact active queue occurrence. -/
theorem downBaseScript_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (actions : Term) (bits : List Bool)
    (continuation queue : Term) (parents : List ParentFrame) :
    let baseContext := MutableBase.queueContext actions bits continuation
      (baseBeta (environmentCode actions bits) continuation)
    ZeroMutationRun (SchedulerControl.machine program dispatcher)
      ((SchedulerControl.jobScript program dispatcher .downBase).length + 1)
      (downBaseScriptConfiguration program dispatcher registers actions bits
        continuation queue parents)
      (downConfiguration program dispatcher registers queue
        (ContextCursor.frames baseContext queue parents)) := by
  let baseContext := MutableBase.queueContext actions bits continuation
    (baseBeta (environmentCode actions bits) continuation)
  have executed : Script.run
      (SchedulerControl.jobScript program dispatcher .downBase)
      ⟨MutableBase.mutableBase actions bits continuation queue, parents⟩ =
      some ⟨queue, ContextCursor.frames baseContext queue parents⟩ := by
    simpa [baseContext, SchedulerControl.jobScript,
      SchedulerControl.addressScript, BasePath.wordAddress,
      ContextCursor.down, MutableBase.mutableBase] using!
      ContextCursor.run_down baseContext queue parents
  have script := ZeroMutationRun.script program dispatcher .downBase registers
    ⟨MutableBase.mutableBase actions bits continuation queue, parents⟩
    ⟨queue, ContextCursor.frames baseContext queue parents⟩ executed (by rfl)
  simpa [baseContext, downBaseScriptConfiguration, downConfiguration] using! script

/-- Complete exact Base descent, still before recursively traversing its queue. -/
theorem downBase_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (actions : Term) (bits : List Bool)
    (continuation queue : Term) (parents : List ParentFrame) :
    let baseContext := MutableBase.queueContext actions bits continuation
      (baseBeta (environmentCode actions bits) continuation)
    ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (downBaseGuardTicks program dispatcher actions bits continuation queue
          parents +
        (SchedulerControl.jobScript program dispatcher .downBase).length + 1)
      (downConfiguration program dispatcher registers
        (MutableBase.mutableBase actions bits continuation queue) parents)
      (downConfiguration program dispatcher registers queue
        (ContextCursor.frames baseContext queue parents)) := by
  simpa only [Nat.add_assoc] using
    (downBaseGuard_zeroRun program dispatcher registers actions bits continuation
      queue parents).trans
      (downBaseScript_zeroRun program dispatcher registers actions bits
        continuation queue parents)

/-- UP-family macro configuration at an exact focus and zipper suffix. -/
def upConfiguration
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (focus : Term)
    (parents : List ParentFrame) : Configuration program dispatcher :=
  ⟨some (.macro (.family .up) registers), ⟨focus, parents⟩⟩

/-- Exact cost of rejecting every DOWN constructor at the queue sentinel. -/
def downOmegaTicks
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (parents : List ParentFrame) : Nat :=
  let origin : Cursor := ⟨omega, parents⟩
  ((((((1 + SchedulerControl.compiledProbeCost program dispatcher
      .downLiveZero origin) +
    SchedulerControl.compiledProbeCost program dispatcher .downLiveOne origin) +
    SchedulerControl.compiledProbeCost program dispatcher .downTombstoneZero
      origin) +
    SchedulerControl.compiledProbeCost program dispatcher .downTombstoneOne
      origin) +
    SchedulerControl.compiledProbeCost program dispatcher .downLocal origin) +
    SchedulerControl.compiledProbeCost program dispatcher .downBase origin) + 1

theorem downOmega_probeAnswers
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (parents : List ParentFrame) :
    let origin : Cursor := ⟨omega, parents⟩
    SchedulerControl.compiledProbeAnswer program dispatcher .downLiveZero
        origin = false ∧
      SchedulerControl.compiledProbeAnswer program dispatcher .downLiveOne
        origin = false ∧
      SchedulerControl.compiledProbeAnswer program dispatcher .downTombstoneZero
        origin = false ∧
      SchedulerControl.compiledProbeAnswer program dispatcher .downTombstoneOne
        origin = false ∧
      SchedulerControl.compiledProbeAnswer program dispatcher .downLocal
        origin = false ∧
      SchedulerControl.compiledProbeAnswer program dispatcher .downBase
        origin = false := by
  exact ⟨rfl, rfl, rfl, rfl, rfl, rfl⟩

/-- At literal `omega`, the complete ordered guard chain enters UP exactly. -/
theorem downOmega_zeroRun
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (parents : List ParentFrame) :
    ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (downOmegaTicks program dispatcher parents)
      (downConfiguration program dispatcher registers omega parents)
      (upConfiguration program dispatcher registers omega parents) := by
  let origin : Cursor := ⟨omega, parents⟩
  let liveZeroStart : Configuration program dispatcher :=
    ⟨some (SchedulerControl.startProbe .downLiveZero registers), origin⟩
  let liveOneStart : Configuration program dispatcher :=
    ⟨some (SchedulerControl.startProbe .downLiveOne registers), origin⟩
  let tombstoneZeroStart : Configuration program dispatcher :=
    ⟨some (SchedulerControl.startProbe .downTombstoneZero registers), origin⟩
  let tombstoneOneStart : Configuration program dispatcher :=
    ⟨some (SchedulerControl.startProbe .downTombstoneOne registers), origin⟩
  let localStart : Configuration program dispatcher :=
    ⟨some (SchedulerControl.startProbe .downLocal registers), origin⟩
  let baseStart : Configuration program dispatcher :=
    ⟨some (SchedulerControl.startProbe .downBase registers), origin⟩
  let omegaState : Configuration program dispatcher :=
    ⟨some (.macro .downOmega registers), origin⟩
  have enter : ZeroMutationRun (SchedulerControl.machine program dispatcher) 1
      (downConfiguration program dispatcher registers omega parents)
      liveZeroStart := by
    exact ⟨rfl, rfl⟩
  have liveZeroProbe := ZeroMutationRun.localProbe program dispatcher
    .downLiveZero registers origin rfl
  have liveZero : ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher .downLiveZero
        origin) liveZeroStart liveOneStart := by
    simpa [liveZeroStart, liveOneStart, origin,
      SchedulerExecution.commandResult, SchedulerControl.probeAnswer,
      downOmega_probeAnswers]
      using liveZeroProbe
  have liveOneProbe := ZeroMutationRun.localProbe program dispatcher
    .downLiveOne registers origin rfl
  have liveOne : ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher .downLiveOne origin)
      liveOneStart tombstoneZeroStart := by
    simpa [liveOneStart, tombstoneZeroStart, origin,
      SchedulerExecution.commandResult, SchedulerControl.probeAnswer,
      downOmega_probeAnswers]
      using liveOneProbe
  have tombstoneZeroProbe := ZeroMutationRun.localProbe program dispatcher
    .downTombstoneZero registers origin rfl
  have tombstoneZero : ZeroMutationRun
      (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher .downTombstoneZero
        origin) tombstoneZeroStart tombstoneOneStart := by
    simpa [tombstoneZeroStart, tombstoneOneStart, origin,
      SchedulerExecution.commandResult, SchedulerControl.probeAnswer,
      downOmega_probeAnswers]
      using tombstoneZeroProbe
  have tombstoneOneProbe := ZeroMutationRun.localProbe program dispatcher
    .downTombstoneOne registers origin rfl
  have tombstoneOne : ZeroMutationRun
      (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher .downTombstoneOne
        origin) tombstoneOneStart localStart := by
    simpa [tombstoneOneStart, localStart, origin,
      SchedulerExecution.commandResult, SchedulerControl.probeAnswer,
      downOmega_probeAnswers]
      using tombstoneOneProbe
  have localProbeRun := ZeroMutationRun.localProbe program dispatcher .downLocal
    registers origin rfl
  have localSegment : ZeroMutationRun
      (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher .downLocal origin)
      localStart baseStart := by
    simpa [localStart, baseStart, origin,
      SchedulerExecution.commandResult, SchedulerControl.probeAnswer,
      downOmega_probeAnswers] using localProbeRun
  have baseProbe := ZeroMutationRun.localProbe program dispatcher .downBase
    registers origin rfl
  have base : ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (SchedulerControl.compiledProbeCost program dispatcher .downBase origin)
      baseStart omegaState := by
    simpa [baseStart, omegaState, origin,
      SchedulerExecution.commandResult, SchedulerControl.probeAnswer,
      downOmega_probeAnswers] using baseProbe
  have finish : ZeroMutationRun (SchedulerControl.machine program dispatcher) 1
      omegaState (upConfiguration program dispatcher registers omega parents) := by
    exact ⟨rfl, rfl⟩
  simpa [downOmegaTicks, origin] using
    ((((((enter.trans liveZero).trans liveOne).trans tombstoneZero).trans
      tombstoneOne).trans localSegment).trans base).trans finish

/-- Zipper frames of composed contexts are accumulated outer-first. -/
theorem contextFrames_comp
    (outer inner : Context) (term : Term) (parents : List ParentFrame) :
    ContextCursor.frames (outer.comp inner) term parents =
      ContextCursor.frames inner term
        (ContextCursor.frames outer (inner.plug term) parents) := by
  induction outer generalizing parents with
  | hole => rfl
  | appLeft outer argument ih =>
      exact ih (.left argument :: parents)
  | appRight function outer ih =>
      exact ih (.right function :: parents)

/--
The concrete DOWN controller follows every exact queue context to its literal
`omega` endpoint.  The returned zipper is definitionally the one computed by
the declarative context address, and the entire descent is mutation-free.
-/
theorem run_downQueueContext
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program)
    {context : Context} {decoded : List Bool}
    (shape : CanonicalTraversal.QueueContext context decoded)
    (parents : List ParentFrame) :
    ∃ ticks,
      ZeroMutationRun (SchedulerControl.machine program dispatcher) ticks
        (downConfiguration program dispatcher registers
          (context.plug omega) parents)
        (upConfiguration program dispatcher registers omega
          (ContextCursor.frames context omega parents)) := by
  induction shape generalizing parents with
  | hole =>
      exact ⟨downOmegaTicks program dispatcher parents, by
        simpa [Context.plug, ContextCursor.frames] using
          downOmega_zeroRun program dispatcher registers parents⟩
  | @live context decoded bit inner ih =>
      obtain ⟨tailTicks, tailRun⟩ :=
        ih (.right (PureSFormal.PureS.live bit) :: parents)
      have headRun := downLive_zeroRun program dispatcher registers bit
        (context.plug omega) parents
      exact ⟨downLiveGuardTicks program dispatcher bit
          (context.plug omega) parents + 2 + tailTicks,
        by
          simpa [Context.plug, ContextCursor.frames] using
            headRun.trans tailRun⟩
  | @tombstone context decoded bit audit inner ih =>
      obtain ⟨tailTicks, tailRun⟩ :=
        ih (.right .s :: .left (.app (valueTag bit) audit) :: parents)
      have headRun := downTombstone_zeroRun program dispatcher registers bit
        (context.plug omega) audit parents
      exact ⟨downTombstoneGuardTicks program dispatcher bit
          (context.plug omega) audit parents + 3 + tailTicks,
        by
          simpa [CellDeletion.tombstoneContext, Context.plug,
            ContextCursor.frames] using! headRun.trans tailRun⟩

/-- A reachable mutable Base and its exact queue context descend to `omega`. -/
theorem run_downBaseQueue
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (registers : Registers program) (actions : Term) (bits : List Bool)
    (continuation : Term) {queueContext : Context} {decoded : List Bool}
    (queueShape : CanonicalTraversal.QueueContext queueContext decoded)
    (parents : List ParentFrame) :
    let baseContext := MutableBase.queueContext actions bits continuation
      (baseBeta (environmentCode actions bits) continuation)
    ∃ ticks,
      ZeroMutationRun (SchedulerControl.machine program dispatcher) ticks
        (downConfiguration program dispatcher registers
          (MutableBase.mutableBase actions bits continuation
            (queueContext.plug omega)) parents)
        (upConfiguration program dispatcher registers omega
          (ContextCursor.frames (baseContext.comp queueContext) omega parents)) := by
  let baseContext := MutableBase.queueContext actions bits continuation
    (baseBeta (environmentCode actions bits) continuation)
  have baseRun := downBase_zeroRun program dispatcher registers actions bits
    continuation (queueContext.plug omega) parents
  obtain ⟨queueTicks, queueRun⟩ := run_downQueueContext program dispatcher
    registers queueShape
      (ContextCursor.frames baseContext (queueContext.plug omega) parents)
  refine ⟨(downBaseGuardTicks program dispatcher actions bits continuation
      (queueContext.plug omega) parents +
        (SchedulerControl.jobScript program dispatcher .downBase).length + 1) +
      queueTicks, ?_⟩
  simpa [baseContext, contextFrames_comp] using baseRun.trans queueRun

/-! ### Full canonical-descent bridge -/

/-- The standalone canonical descent executor is the invariant's zero-run. -/
theorem run_downDescent
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    (registers : Registers program) {bits : List Bool}
    {continuation source : Term} {decoded : List Bool} {context : Context}
    (descent : CanonicalTraversal.Descent program dispatcher.tree bits
      continuation source decoded context)
    (parents : List ParentFrame) :
    ∃ ticks,
      ZeroMutationRun (SchedulerControl.machine program dispatcher) ticks
        (downConfiguration program dispatcher registers source parents)
        (upConfiguration program dispatcher registers omega
          (ContextCursor.frames context omega parents)) := by
  obtain ⟨ticks, execution⟩ := SchedulerDescent.run_downDescent registers
    descent parents
  exact ⟨ticks, ⟨execution.run_eq, execution.count_eq⟩⟩

/-- A canonical descent supplies the recursive audit at its source zipper. -/
theorem auditedOccurrence_downDescent
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {bits : List Bool} {continuation source : Term}
    {decoded : List Bool} {context : Context}
    (descent : CanonicalTraversal.Descent program dispatcher.tree bits
      continuation source decoded context)
    (parents : List ParentFrame) :
    AuditedOccurrence program dispatcher.tree
      (Cursor.mk source parents).erase := by
  refine .intro bits continuation source (contextOfParents parents)
    descent.holds ?_
  change Cursor.rebuild parents source = (contextOfParents parents).plug source
  exact (contextOfParents_plug parents source).symm

/-- Cursor-only descent preserves the same audited whole occurrence at omega. -/
theorem auditedOccurrence_upDescent
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {bits : List Bool} {continuation source : Term}
    {decoded : List Bool} {context : Context}
    (descent : CanonicalTraversal.Descent program dispatcher.tree bits
      continuation source decoded context)
    (parents : List ParentFrame) :
    AuditedOccurrence program dispatcher.tree
      (Cursor.mk omega (ContextCursor.frames context omega parents)).erase := by
  refine .intro bits continuation source (contextOfParents parents)
    descent.holds ?_
  change Cursor.rebuild (ContextCursor.frames context omega parents) omega =
    (contextOfParents parents).plug source
  rw [rebuild_contextFrames, descent.source_eq,
    contextOfParents_plug]

/-- Exact proof-level location of the DOWN source zipper. -/
theorem downDescent_cursorAt
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {bits : List Bool} {continuation source : Term}
    {decoded : List Bool} {context : Context}
    (descent : CanonicalTraversal.Descent program dispatcher.tree bits
      continuation source decoded context)
    (parents : List ParentFrame) :
    CursorAtContext
      (downConfiguration program dispatcher (Registers.initial program)
        source parents).cursor
      (contextOfParents parents) source := by
  exact cursorAtContextOfParents source parents

/-- Exact proof-level location of the UP omega zipper. -/
theorem upDescent_cursorAt
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {bits : List Bool} {continuation source : Term}
    {decoded : List Bool} {context : Context}
    (descent : CanonicalTraversal.Descent program dispatcher.tree bits
      continuation source decoded context)
    (parents : List ParentFrame) :
    CursorAtContext
      ⟨omega, ContextCursor.frames context omega parents⟩
      ((contextOfParents parents).comp context) omega := by
  constructor
  · rfl
  · rw [SchedulerDescent.contextFrames_comp,
      contextOfParents_frames]

/-- The exact DOWN macro state satisfies the simultaneous invariant. -/
theorem downDescent_holds
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    (registers : Registers program)
    {phase : CTS.Phase program} {scanned : List Bool} {emptyMode : Bool}
    {bits : List Bool} {continuation source : Term}
    {decoded : List Bool} {context : Context}
    (descent : CanonicalTraversal.Descent program dispatcher.tree bits
      continuation source decoded context)
    (parents : List ParentFrame)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (silent : SilentEvidence program dispatcher.tree .down
      (downConfiguration program dispatcher registers source parents).cursor.erase) :
    Holds program dispatcher
      (downConfiguration program dispatcher registers source parents) := by
  exact .intro (.macro (.family .down) registers) rfl phase scanned emptyMode
    coherent
    (ControlPosition.macro (context := contextOfParents parents)
      (focus := source) (cursorAtContextOfParents source parents) (by trivial))
    (.down (.silent silent)
      (auditedOccurrence_downDescent descent parents))

/-- The exact UP omega state satisfies the simultaneous invariant. -/
theorem upDescent_holds
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    (registers : Registers program)
    {phase : CTS.Phase program} {scanned : List Bool} {emptyMode : Bool}
    {bits : List Bool} {continuation source : Term}
    {decoded : List Bool} {context : Context}
    (descent : CanonicalTraversal.Descent program dispatcher.tree bits
      continuation source decoded context)
    (parents : List ParentFrame)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (silent : SilentEvidence program dispatcher.tree .up
      (upConfiguration program dispatcher registers omega
        (ContextCursor.frames context omega parents)).cursor.erase) :
    Holds program dispatcher
      (upConfiguration program dispatcher registers omega
        (ContextCursor.frames context omega parents)) := by
  exact .intro (.macro (.family .up) registers) rfl phase scanned emptyMode
    coherent
    (ControlPosition.macro
      (context := (contextOfParents parents).comp context) (focus := omega)
      (upDescent_cursorAt descent parents) (by trivial))
    (.up (.silent silent)
      (auditedOccurrence_upDescent descent parents))

/--
Full zero-mutation DOWN certificate with invariant witnesses at both exact
macro endpoints.  Decoder classification remains construction-specific and
is supplied directly for the shared erased term.
-/
structure DownDescentInvariant
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    (registers : Registers program)
    {bits : List Bool} {continuation source : Term}
    {decoded : List Bool} {context : Context}
    (descent : CanonicalTraversal.Descent program dispatcher.tree bits
      continuation source decoded context)
    (parents : List ParentFrame) (ticks : Nat) : Prop where
  execution : ZeroMutationRun (SchedulerControl.machine program dispatcher)
    ticks (downConfiguration program dispatcher registers source parents)
    (upConfiguration program dispatcher registers omega
      (ContextCursor.frames context omega parents))
  source_holds : Holds program dispatcher
    (downConfiguration program dispatcher registers source parents)
  endpoint_holds : Holds program dispatcher
    (upConfiguration program dispatcher registers omega
      (ContextCursor.frames context omega parents))

/-- Construct the executable, audited DOWN invariant certificate. -/
theorem downDescentInvariant
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    (registers : Registers program)
    {phase : CTS.Phase program} {scanned : List Bool} {emptyMode : Bool}
    {bits : List Bool} {continuation source : Term}
    {decoded : List Bool} {context : Context}
    (descent : CanonicalTraversal.Descent program dispatcher.tree bits
      continuation source decoded context)
    (parents : List ParentFrame)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (downSilent : SilentEvidence program dispatcher.tree .down
      (downConfiguration program dispatcher registers source parents).cursor.erase)
    (upSilent : SilentEvidence program dispatcher.tree .up
      (upConfiguration program dispatcher registers omega
        (ContextCursor.frames context omega parents)).cursor.erase) :
    ∃ ticks, DownDescentInvariant registers descent parents ticks := by
  obtain ⟨ticks, execution⟩ := run_downDescent registers descent parents
  exact ⟨ticks, execution,
    downDescent_holds registers descent parents coherent downSilent,
    upDescent_holds registers descent parents coherent upSilent⟩

/-! ## One-row operational safety -/

/--
One actual controller row preserves ordinary control whenever its selected
command is safe.  This is the microstep closure lemma used separately in all
seven family cases.
-/
theorem step_control_eq_some_of_safe
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {configuration : Configuration program dispatcher}
    (control : SchedulerControl.Control program dispatcher)
    (control_eq : configuration.control = some control)
    (safe : CommandSafe configuration.cursor
      (SchedulerControl.transition program dispatcher control
        (Probe.observeNode configuration.cursor)
        (Probe.observeIncoming configuration.cursor))) :
    ∃ next,
      (FiniteController.step (SchedulerControl.machine program dispatcher)
        configuration).control = some next := by
  rcases configuration with ⟨runtime, cursor⟩
  change runtime = some control at control_eq
  subst runtime
  unfold FiniteController.step SchedulerControl.machine
  simp only
  generalize hcommand : SchedulerControl.transition program dispatcher control
    (Probe.observeNode cursor) (Probe.observeIncoming cursor) = command
  change CommandSafe cursor
    (SchedulerControl.transition program dispatcher control
      (Probe.observeNode cursor) (Probe.observeIncoming cursor)) at safe
  rw [hcommand] at safe
  cases command with
  | stay next => exact ⟨next, rfl⟩
  | reject => exact safe.elim
  | exec primitive next =>
      rcases safe with ⟨after, hafter⟩
      exact ⟨next, by simp [hafter]⟩

/-- A safe row cannot take the controller to its unique rejecting sink. -/
theorem step_control_ne_none_of_safe
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {configuration : Configuration program dispatcher}
    (control : SchedulerControl.Control program dispatcher)
    (control_eq : configuration.control = some control)
    (safe : CommandSafe configuration.cursor
      (SchedulerControl.transition program dispatcher control
        (Probe.observeNode configuration.cursor)
        (Probe.observeIncoming configuration.cursor))) :
    (FiniteController.step (SchedulerControl.machine program dispatcher)
      configuration).control ≠ none := by
  obtain ⟨next, hnext⟩ :=
    step_control_eq_some_of_safe control control_eq safe
  rw [hnext]
  simp

/-- One actual microstep from an invariant state cannot enter Reject. -/
theorem Holds.step_control_ne_none
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {configuration : Configuration program dispatcher}
    (h : Holds program dispatcher configuration) :
    (FiniteController.step (SchedulerControl.machine program dispatcher)
      configuration).control ≠ none := by
  rcases h.components with
    ⟨control, phase, scanned, emptyMode, control_eq, registers, position,
      evidence⟩
  exact step_control_ne_none_of_safe control control_eq position.commandSafe

/-- The concrete encoder cannot reject on its first controller row. -/
theorem initial_step_control_ne_none
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    (FiniteController.step (SchedulerControl.machine program dispatcher)
      (SchedulerControl.initialConfiguration program dispatcher bits)).control ≠
        none :=
  (initial program dispatcher bits).step_control_ne_none

/-! ## Contraction-sampled invariant and constructive productivity -/

/--
Exact semantic classification required at every contraction-sampled state.
The positive constructor stores the actual `CheckpointRun.PositivePrefix`,
not merely a term that happens to pass the public decoder.
-/
inductive EventEvidence
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) : Nat → SchedulerControl.Family → Term → Prop where
  | timeZero :
      EventEvidence program dispatcher bits 0 .clock
        (generator (compileActions program dispatcher.tree) bits)
  | silent
      {family : SchedulerControl.Family} {term : Term}
      (evidence : SilentEvidence
        program dispatcher.tree family term) :
      EventEvidence program dispatcher bits sampleIndex family term
  | positive
      (offset : Nat) {term : Term}
      {activeContext : Context}
      {chain : CheckpointDecoder.ChainView program}
      (certificate : CheckpointRun.PositivePrefix program dispatcher bits
        (offset + 1) term
          (ExactCheckpointRun.checkpointTime program dispatcher bits
            (offset + 1)) activeContext chain)
      (index_eq : sampleIndex =
        ExactCheckpointRun.checkpointTime program dispatcher bits
          (offset + 1)) :
      EventEvidence program dispatcher bits sampleIndex family term

namespace EventEvidence

/-- A named silent event is rejected by the public decoder. -/
theorem decode_silent
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {bits : List Bool} {family : SchedulerControl.Family} {term : Term}
    (evidence : SilentEvidence
      program dispatcher.tree family term) :
    CheckpointDecoder.decode? program dispatcher.tree term = none :=
  evidence.rejected

/-- A stored positive prefix decodes to its exact CTS horizon and value. -/
theorem decode_positive
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {bits : List Bool} {family : SchedulerControl.Family} {term : Term}
    {offset : Nat} {contractions : Nat} {activeContext : Context}
    {chain : CheckpointDecoder.ChainView program}
    (certificate : CheckpointRun.PositivePrefix program dispatcher bits
      (offset + 1) term contractions activeContext chain) :
    CheckpointDecoder.decode? program dispatcher.tree term =
      some (.positive
        ⟨offset + 1, chain.last.route, chain.last.label,
          (CTS.iterate program (offset + 1)
            (CTS.initial program bits)).data⟩) :=
  certificate.decode

end EventEvidence

/--
The full invariant at one contraction sample, including its exact semantic
checkpoint classification and the actual runtime family carrying that case.
-/
structure SampledState
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (sampleIndex : Nat)
    (configuration : Configuration program dispatcher) : Prop where
  holds : Holds program dispatcher configuration
  classification :
    ∃ control : SchedulerControl.Control program dispatcher,
      configuration.control = some control ∧
      EventEvidence program dispatcher bits sampleIndex control.family
        configuration.cursor.erase

namespace SampledState

/-- The unreduced encoder is the exact horizon-zero sampled state. -/
theorem initial
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    SampledState program dispatcher bits 0
      (SchedulerControl.initialConfiguration program dispatcher bits) := by
  exact ⟨SchedulerInvariant.initial program dispatcher bits,
    ⟨SchedulerControl.initialControl program dispatcher, rfl, .timeZero⟩⟩

/-- The generator's first contraction is an exact silent staging sample. -/
theorem firstMutation
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    SampledState program dispatcher bits 1
      (firstMutationConfiguration program dispatcher bits) := by
  let first := SchedulerControl.firstScriptPC program dispatcher
    SchedulerControl.ScriptJob.clockZero
  let final := SchedulerControl.nextScriptPC program dispatcher
    SchedulerControl.ScriptJob.clockZero first (by
      change 0 < 1
      exact Nat.zero_lt_succ 0)
  refine ⟨firstMutation_holds program dispatcher bits,
    ⟨.script .clockZero final (Registers.initial program), rfl, ?_⟩⟩
  exact .silent (.ofPublic (.clockStaging (.here _)
    ⟨word bits, by
      simp [firstMutationConfiguration,
        CheckpointDecoder.openEnvironment_word]
      rfl⟩))

/-- The next sampled clock contraction has its exact intermediate witness. -/
theorem secondMutation
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    SampledState program dispatcher bits 2
      (secondMutationConfiguration program dispatcher bits) := by
  let first := SchedulerControl.firstScriptPC program dispatcher
    SchedulerControl.ScriptJob.clockPositive
  let next := SchedulerControl.nextScriptPC program dispatcher
    SchedulerControl.ScriptJob.clockPositive first (by
      change 0 < 2
      exact Nat.zero_lt_succ 1)
  refine ⟨secondMutation_holds program dispatcher bits,
    ⟨.script .clockPositive next (Registers.initial program), rfl, ?_⟩⟩
  exact .silent (.ofState (.clockGrowth (.here _) 1 0 0 (word bits) (by
    simp [secondMutationConfiguration,
      CheckpointDecoder.openEnvironment_word]
    rfl)))

/-- Semantic sampled-state wrapper for every positive clock mutation. -/
theorem positiveClockMutation
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (sampleIndex : Nat) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (stage wrappers remaining : Nat) (parents : List ParentFrame)
    (registersCoherent :
      RegistersCoherent registers phase scanned emptyMode)
    (silent : SilentEvidence program dispatcher.tree .clock
      (positiveClockMutationConfiguration program dispatcher registers
        stage wrappers remaining parents).cursor.erase) :
    SampledState program dispatcher bits sampleIndex
      (positiveClockMutationConfiguration program dispatcher registers
        stage wrappers remaining parents) := by
  let first := SchedulerControl.firstScriptPC program dispatcher
    SchedulerControl.ScriptJob.clockPositive
  let next := SchedulerControl.nextScriptPC program dispatcher
    SchedulerControl.ScriptJob.clockPositive first (by
      change 0 < 2
      exact Nat.zero_lt_succ 1)
  refine ⟨positiveClockMutation_holds program dispatcher bits registers
      phase scanned emptyMode stage wrappers remaining parents
      registersCoherent silent,
    ⟨.script .clockPositive next registers, rfl, .silent silent⟩⟩

/-- Semantic sampled-state wrapper for every closing zero-clock mutation. -/
theorem zeroClockMutation
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (sampleIndex : Nat) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (stage wrappers : Nat) (parents : List ParentFrame)
    (registersCoherent :
      RegistersCoherent registers phase scanned emptyMode)
    (silent : SilentEvidence program dispatcher.tree .clock
      (zeroClockMutationConfiguration program dispatcher registers
        stage wrappers parents).cursor.erase) :
    SampledState program dispatcher bits sampleIndex
      (zeroClockMutationConfiguration program dispatcher registers
        stage wrappers parents) := by
  let first := SchedulerControl.firstScriptPC program dispatcher
    SchedulerControl.ScriptJob.clockZero
  let final := SchedulerControl.nextScriptPC program dispatcher
    SchedulerControl.ScriptJob.clockZero first (by
      change 0 < 1
      exact Nat.zero_lt_succ 0)
  refine ⟨zeroClockMutation_holds program dispatcher bits registers
      phase scanned emptyMode stage wrappers parents registersCoherent silent,
    ⟨.script .clockZero final registers, rfl, .silent silent⟩⟩

/-- Package any invariant state with its direct silent-event classification. -/
theorem ofSilent
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {bits : List Bool} {sampleIndex : Nat}
    {configuration : Configuration program dispatcher}
    (control : SchedulerControl.Control program dispatcher)
    (holds : Holds program dispatcher configuration)
    (control_eq : configuration.control = some control)
    (silent : SilentEvidence program dispatcher.tree control.family
      configuration.cursor.erase) :
    SampledState program dispatcher bits sampleIndex configuration :=
  ⟨holds, ⟨control, control_eq, .silent silent⟩⟩

/-- Indexed sampled-state wrapper for the first positive-fuel contraction. -/
theorem fuelPositiveFirstMutation
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (sampleIndex : Nat) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (fuel : Nat) (environment continuation : Term)
    (parents : List ParentFrame)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (silent : SilentEvidence program dispatcher.tree .fuel
      (fuelPositiveFirstMutationConfiguration program dispatcher registers fuel
        environment continuation parents).cursor.erase) :
    SampledState program dispatcher bits sampleIndex
      (fuelPositiveFirstMutationConfiguration program dispatcher registers fuel
        environment continuation parents) :=
  ofSilent (.script .fuelPositive ⟨2, by
      change 2 < 6
      decide⟩ registers)
    (fuelPositiveFirstMutation_holds program dispatcher registers phase scanned
      emptyMode fuel environment continuation parents coherent silent)
    rfl silent

/-- Indexed sampled-state wrapper for the second positive-fuel contraction. -/
theorem fuelPositiveSecondMutation
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (sampleIndex : Nat) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (fuel : Nat) (environment continuation : Term)
    (parents : List ParentFrame)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (silent : SilentEvidence program dispatcher.tree .fuel
      (fuelPositiveSecondMutationConfiguration program dispatcher registers fuel
        environment continuation parents).cursor.erase) :
    SampledState program dispatcher bits sampleIndex
      (fuelPositiveSecondMutationConfiguration program dispatcher registers fuel
        environment continuation parents) :=
  ofSilent (.script .fuelPositive ⟨4, by
      change 4 < 6
      decide⟩ registers)
    (fuelPositiveSecondMutation_holds program dispatcher registers phase scanned
      emptyMode fuel environment continuation parents coherent silent)
    rfl silent

/-- Indexed sampled-state wrappers for the five zero-fuel contractions. -/
theorem fuelZeroFirstMutation
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (sampleIndex : Nat) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (environment continuation : Term) (parents : List ParentFrame)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (silent : SilentEvidence program dispatcher.tree .fuel
      (fuelZeroFirstMutationConfiguration program dispatcher registers
        environment continuation parents).cursor.erase) :
    SampledState program dispatcher bits sampleIndex
      (fuelZeroFirstMutationConfiguration program dispatcher registers
        environment continuation parents) :=
  ofSilent (.script .fuelZero ⟨2, by
      change 2 < 12
      decide⟩ registers)
    (fuelZeroFirstMutation_holds program dispatcher registers phase scanned
      emptyMode environment continuation parents coherent silent) rfl silent

theorem fuelZeroSecondMutation
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (sampleIndex : Nat) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (environment continuation : Term) (parents : List ParentFrame)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (silent : SilentEvidence program dispatcher.tree .fuel
      (fuelZeroSecondMutationConfiguration program dispatcher registers
        environment continuation parents).cursor.erase) :
    SampledState program dispatcher bits sampleIndex
      (fuelZeroSecondMutationConfiguration program dispatcher registers
        environment continuation parents) :=
  ofSilent (.script .fuelZero ⟨5, by
      change 5 < 12
      decide⟩ registers)
    (fuelZeroSecondMutation_holds program dispatcher registers phase scanned
      emptyMode environment continuation parents coherent silent) rfl silent

theorem fuelZeroThirdMutation
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (sampleIndex : Nat) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (environment continuation : Term) (parents : List ParentFrame)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (silent : SilentEvidence program dispatcher.tree .fuel
      (fuelZeroThirdMutationConfiguration program dispatcher registers
        environment continuation parents).cursor.erase) :
    SampledState program dispatcher bits sampleIndex
      (fuelZeroThirdMutationConfiguration program dispatcher registers
        environment continuation parents) :=
  ofSilent (.script .fuelZero ⟨7, by
      change 7 < 12
      decide⟩ registers)
    (fuelZeroThirdMutation_holds program dispatcher registers phase scanned
      emptyMode environment continuation parents coherent silent) rfl silent

theorem fuelZeroFourthMutation
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (sampleIndex : Nat) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (environment continuation : Term) (parents : List ParentFrame)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (silent : SilentEvidence program dispatcher.tree .fuel
      (fuelZeroFourthMutationConfiguration program dispatcher registers
        environment continuation parents).cursor.erase) :
    SampledState program dispatcher bits sampleIndex
      (fuelZeroFourthMutationConfiguration program dispatcher registers
        environment continuation parents) :=
  ofSilent (.script .fuelZero ⟨9, by
      change 9 < 12
      decide⟩ registers)
    (fuelZeroFourthMutation_holds program dispatcher registers phase scanned
      emptyMode environment continuation parents coherent silent) rfl silent

theorem fuelZeroFifthMutation
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (sampleIndex : Nat) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (environment continuation : Term) (parents : List ParentFrame)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (silent : SilentEvidence program dispatcher.tree .fuel
      (fuelZeroFifthMutationConfiguration program dispatcher registers
        environment continuation parents).cursor.erase) :
    SampledState program dispatcher bits sampleIndex
      (fuelZeroFifthMutationConfiguration program dispatcher registers
        environment continuation parents) :=
  ofSilent (.script .fuelZero ⟨11, by
      change 11 < 12
      decide⟩ registers)
    (fuelZeroFifthMutation_holds program dispatcher registers phase scanned
      emptyMode environment continuation parents coherent silent) rfl silent

end SampledState

/-! ### Indexed clock samples at the public environment root -/

/--
Every contraction after a current positive clock sample, with exact relative
indices and the literal outer environment zipper retained.
-/
inductive ClockRootTailSampled
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (stage : Nat) : Nat → Nat → Nat → Prop where
  | zero (sampleIndex wrappers : Nat)
      (closing : SampledState program dispatcher bits (sampleIndex + 1)
        (zeroClockMutationConfiguration program dispatcher registers stage
          (wrappers + 1)
          [.left (environmentCode
            (compileActions program dispatcher.tree) bits)])) :
      ClockRootTailSampled program dispatcher bits registers phase scanned
        emptyMode coherent stage sampleIndex wrappers 0
  | succ (sampleIndex wrappers remaining : Nat)
      (next : SampledState program dispatcher bits (sampleIndex + 1)
        (positiveClockMutationConfiguration program dispatcher registers stage
          (wrappers + 1) remaining
          [.left (environmentCode
            (compileActions program dispatcher.tree) bits)]))
      (tail : ClockRootTailSampled program dispatcher bits registers phase
        scanned emptyMode coherent stage (sampleIndex + 1) (wrappers + 1)
        remaining) :
      ClockRootTailSampled program dispatcher bits registers phase scanned
        emptyMode coherent stage sampleIndex wrappers (remaining + 1)

/-- Construct the complete indexed positive-clock tail at the environment root. -/
theorem clockRootTailSampled
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (stage : Nat) : ∀ sampleIndex wrappers remaining,
      ClockRootTailSampled program dispatcher bits registers phase scanned
        emptyMode coherent stage sampleIndex wrappers remaining
  | sampleIndex, wrappers, 0 =>
      .zero sampleIndex wrappers
        (SampledState.zeroClockMutation program dispatcher bits
          (sampleIndex + 1) registers phase scanned emptyMode stage
          (wrappers + 1)
          [.left (environmentCode
            (compileActions program dispatcher.tree) bits)] coherent
          (zeroClockMutation_silentWrappedRoot program dispatcher bits registers
            stage wrappers))
  | sampleIndex, wrappers, remaining + 1 =>
      .succ sampleIndex wrappers remaining
        (SampledState.positiveClockMutation program dispatcher bits
          (sampleIndex + 1) registers phase scanned emptyMode stage
          (wrappers + 1) remaining
          [.left (environmentCode
            (compileActions program dispatcher.tree) bits)] coherent
          (positiveClockMutation_silentRoot program dispatcher bits registers
            stage (wrappers + 1) remaining))
        (clockRootTailSampled program dispatcher bits registers phase scanned
          emptyMode coherent stage (sampleIndex + 1) (wrappers + 1) remaining)

/-- Exact contraction-sampled invariant for a complete root clock phase. -/
inductive ClockRootPhaseSampled
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (coherent : RegistersCoherent registers phase scanned emptyMode) :
    Nat → Nat → Prop where
  | zero (sampleIndex : Nat)
      (closing : SampledState program dispatcher bits (sampleIndex + 1)
        (zeroClockMutationConfiguration program dispatcher registers 0 0
          [.left (environmentCode
            (compileActions program dispatcher.tree) bits)])) :
      ClockRootPhaseSampled program dispatcher bits registers phase scanned
        emptyMode coherent sampleIndex 0
  | succ (sampleIndex stage : Nat)
      (first : SampledState program dispatcher bits (sampleIndex + 1)
        (positiveClockMutationConfiguration program dispatcher registers
          (stage + 1) 0 stage
          [.left (environmentCode
            (compileActions program dispatcher.tree) bits)]))
      (tail : ClockRootTailSampled program dispatcher bits registers phase
        scanned emptyMode coherent (stage + 1) (sampleIndex + 1) 0 stage) :
      ClockRootPhaseSampled program dispatcher bits registers phase scanned
        emptyMode coherent sampleIndex (stage + 1)

/-- Construct the complete indexed clock phase for every public stage. -/
theorem clockRootPhaseSampled
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (coherent : RegistersCoherent registers phase scanned emptyMode) :
    ∀ sampleIndex stage,
      ClockRootPhaseSampled program dispatcher bits registers phase scanned
        emptyMode coherent sampleIndex stage
  | sampleIndex, 0 =>
      .zero sampleIndex
        (SampledState.zeroClockMutation program dispatcher bits
          (sampleIndex + 1) registers phase scanned emptyMode 0 0
          [.left (environmentCode
            (compileActions program dispatcher.tree) bits)] coherent
          (zeroClockMutation_silentStaging program dispatcher bits registers))
  | sampleIndex, stage + 1 =>
      .succ sampleIndex stage
        (SampledState.positiveClockMutation program dispatcher bits
          (sampleIndex + 1) registers phase scanned emptyMode (stage + 1) 0 stage
          [.left (environmentCode
            (compileActions program dispatcher.tree) bits)] coherent
          (positiveClockMutation_silentRoot program dispatcher bits registers
            (stage + 1) 0 stage))
        (clockRootTailSampled program dispatcher bits registers phase scanned
          emptyMode coherent (stage + 1) (sampleIndex + 1) 0 stage)

/-- Executable searches and indexed invariants for the same root clock phase. -/
structure ClockRootPhaseInvariant
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (sampleIndex stage : Nat) : Prop where
  execution : ClockPhaseSamples program dispatcher registers
    [.left (environmentCode (compileActions program dispatcher.tree) bits)] stage
  invariant : ClockRootPhaseSampled program dispatcher bits registers phase
    scanned emptyMode coherent sampleIndex stage

/-- Construct the executable and semantic root clock certificate. -/
theorem clockRootPhaseInvariant
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (sampleIndex stage : Nat) :
    ClockRootPhaseInvariant program dispatcher bits registers phase scanned
      emptyMode coherent sampleIndex stage :=
  ⟨executeClock_samples program dispatcher registers
      [.left (environmentCode
        (compileActions program dispatcher.tree) bits)] stage,
    clockRootPhaseSampled program dispatcher bits registers phase scanned
      emptyMode coherent sampleIndex stage⟩

/-- Exact relative contraction indices for the two positive-fuel samples. -/
structure FuelPositiveSampledStates
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (sampleIndex fuel depth : Nat) (continuation : Term) : Prop where
  first : SampledState program dispatcher bits (sampleIndex + 1)
    (fuelPositiveFirstMutationConfiguration program dispatcher registers fuel
      (environmentCode (compileActions program dispatcher.tree) bits)
      continuation
      (PrimitiveFuel.pendingParents
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation depth []))
  second : SampledState program dispatcher bits (sampleIndex + 2)
    (fuelPositiveSecondMutationConfiguration program dispatcher registers fuel
      (environmentCode (compileActions program dispatcher.tree) bits)
      continuation
      (PrimitiveFuel.pendingParents
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation depth []))

/-- Construct both indexed positive-fuel sampled states. -/
theorem fuelPositiveSampledStates
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (sampleIndex fuel depth : Nat) (continuation : Term)
    (coherent : RegistersCoherent registers phase scanned emptyMode) :
    FuelPositiveSampledStates program dispatcher bits registers phase scanned
      emptyMode sampleIndex fuel depth continuation := by
  have evidence := fuelPositiveSampleEvidence program dispatcher bits registers
    fuel depth continuation
  exact ⟨SampledState.fuelPositiveFirstMutation program dispatcher bits
      (sampleIndex + 1) registers phase scanned emptyMode fuel _ continuation _
      coherent evidence.first,
    SampledState.fuelPositiveSecondMutation program dispatcher bits
      (sampleIndex + 2) registers phase scanned emptyMode fuel _ continuation _
      coherent evidence.second⟩

/-- Exact relative contraction indices for all five zero-fuel samples. -/
structure FuelZeroSampledStates
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (sampleIndex depth : Nat) (continuation : Term) : Prop where
  first : SampledState program dispatcher bits (sampleIndex + 1)
    (fuelZeroFirstMutationConfiguration program dispatcher registers
      (environmentCode (compileActions program dispatcher.tree) bits)
      continuation
      (PrimitiveFuel.pendingParents
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation depth []))
  second : SampledState program dispatcher bits (sampleIndex + 2)
    (fuelZeroSecondMutationConfiguration program dispatcher registers
      (environmentCode (compileActions program dispatcher.tree) bits)
      continuation
      (PrimitiveFuel.pendingParents
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation depth []))
  third : SampledState program dispatcher bits (sampleIndex + 3)
    (fuelZeroThirdMutationConfiguration program dispatcher registers
      (environmentCode (compileActions program dispatcher.tree) bits)
      continuation
      (PrimitiveFuel.pendingParents
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation depth []))
  fourth : SampledState program dispatcher bits (sampleIndex + 4)
    (fuelZeroFourthMutationConfiguration program dispatcher registers
      (environmentCode (compileActions program dispatcher.tree) bits)
      continuation
      (PrimitiveFuel.pendingParents
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation depth []))
  fifth : SampledState program dispatcher bits (sampleIndex + 5)
    (fuelZeroFifthMutationConfiguration program dispatcher registers
      (environmentCode (compileActions program dispatcher.tree) bits)
      continuation
      (PrimitiveFuel.pendingParents
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation depth []))

/-- Construct all five indexed zero-fuel sampled states. -/
theorem fuelZeroSampledStates
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (sampleIndex depth : Nat) (continuation : Term)
    (hadmissible : Carrier.Admissible continuation)
    (coherent : RegistersCoherent registers phase scanned emptyMode) :
    FuelZeroSampledStates program dispatcher bits registers phase scanned
      emptyMode sampleIndex depth continuation := by
  have evidence := fuelZeroSampleEvidence program dispatcher bits registers depth
    continuation hadmissible
  exact ⟨SampledState.fuelZeroFirstMutation program dispatcher bits
      (sampleIndex + 1) registers phase scanned emptyMode _ continuation _
      coherent evidence.first,
    SampledState.fuelZeroSecondMutation program dispatcher bits
      (sampleIndex + 2) registers phase scanned emptyMode _ continuation _
      coherent evidence.second,
    SampledState.fuelZeroThirdMutation program dispatcher bits
      (sampleIndex + 3) registers phase scanned emptyMode _ continuation _
      coherent evidence.third,
    SampledState.fuelZeroFourthMutation program dispatcher bits
      (sampleIndex + 4) registers phase scanned emptyMode _ continuation _
      coherent evidence.fourth,
    SampledState.fuelZeroFifthMutation program dispatcher bits
      (sampleIndex + 5) registers phase scanned emptyMode _ continuation _
      coherent evidence.fifth⟩

/--
Every contraction in a fuel phase, indexed relative to the contraction count
at its macro entry.  Each positive layer contributes two samples; the final
zero layer contributes five.
-/
inductive FuelSampledTrace
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (continuation : Term) (hadmissible : Carrier.Admissible continuation)
    (coherent : RegistersCoherent registers phase scanned emptyMode) :
    Nat → Nat → Nat → Prop where
  | zero (sampleIndex depth : Nat)
      (states : FuelZeroSampledStates program dispatcher bits registers phase
        scanned emptyMode sampleIndex depth continuation) :
      FuelSampledTrace program dispatcher bits registers phase scanned emptyMode
        continuation hadmissible coherent sampleIndex 0 depth
  | succ (sampleIndex fuel depth : Nat)
      (states : FuelPositiveSampledStates program dispatcher bits registers phase
        scanned emptyMode sampleIndex fuel depth continuation)
      (tail : FuelSampledTrace program dispatcher bits registers phase scanned
        emptyMode continuation hadmissible coherent (sampleIndex + 2) fuel
        (depth + 1)) :
      FuelSampledTrace program dispatcher bits registers phase scanned emptyMode
        continuation hadmissible coherent sampleIndex (fuel + 1) depth

/-- Construct the exact indexed fuel trace by structural fuel induction. -/
theorem fuelSampledTrace
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (continuation : Term) (hadmissible : Carrier.Admissible continuation)
    (coherent : RegistersCoherent registers phase scanned emptyMode) :
    ∀ sampleIndex fuel depth,
      FuelSampledTrace program dispatcher bits registers phase scanned emptyMode
        continuation hadmissible coherent sampleIndex fuel depth
  | sampleIndex, 0, depth =>
      .zero sampleIndex depth
        (fuelZeroSampledStates program dispatcher bits registers phase scanned
          emptyMode sampleIndex depth continuation hadmissible coherent)
  | sampleIndex, fuel + 1, depth =>
      .succ sampleIndex fuel depth
        (fuelPositiveSampledStates program dispatcher bits registers phase
          scanned emptyMode sampleIndex fuel depth continuation coherent)
        (fuelSampledTrace program dispatcher bits registers phase scanned
          emptyMode continuation hadmissible coherent (sampleIndex + 2) fuel
          (depth + 1))

/-- Accumulated contraction index after all fuel samples. -/
def fuelSampleEndIndex : Nat → Nat → Nat
  | sampleIndex, 0 => sampleIndex + 5
  | sampleIndex, fuel + 1 => fuelSampleEndIndex (sampleIndex + 2) fuel

/-- Accumulated pending depth after all positive fuel layers. -/
def fuelSampleEndDepth : Nat → Nat → Nat
  | depth, 0 => depth
  | depth, fuel + 1 => fuelSampleEndDepth (depth + 1) fuel

/-- Closed form for the contraction index at the terminal Base sample. -/
theorem fuelSampleEndIndex_eq : ∀ sampleIndex fuel,
    fuelSampleEndIndex sampleIndex fuel = sampleIndex + (2 * fuel + 5)
  | sampleIndex, 0 => rfl
  | sampleIndex, fuel + 1 => by
      rw [fuelSampleEndIndex, fuelSampleEndIndex_eq, Nat.mul_succ]
      exact calc
        (sampleIndex + 2) + (2 * fuel + 5) =
            sampleIndex + (2 + (2 * fuel + 5)) :=
          Nat.add_assoc sampleIndex 2 (2 * fuel + 5)
        _ = sampleIndex + ((2 * fuel + 2) + 5) := by
          rw [← Nat.add_assoc 2 (2 * fuel) 5,
            Nat.add_comm 2 (2 * fuel)]

/-- Closed form for the installed pending-frame depth. -/
theorem fuelSampleEndDepth_eq : ∀ depth fuel,
    fuelSampleEndDepth depth fuel = depth + fuel
  | depth, 0 => by rw [fuelSampleEndDepth, Nat.add_zero]
  | depth, fuel + 1 => by
      rw [fuelSampleEndDepth, fuelSampleEndDepth_eq]
      exact calc
        (depth + 1) + fuel = depth + (1 + fuel) :=
          Nat.add_assoc depth 1 fuel
        _ = depth + (fuel + 1) := by rw [Nat.add_comm 1 fuel]

namespace FuelSampledTrace

/-- The indexed fuel trace ends at its fifth Base-producing contraction. -/
theorem final
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {bits : List Bool} {registers : Registers program}
    {phase : CTS.Phase program} {scanned : List Bool} {emptyMode : Bool}
    {continuation : Term} {hadmissible : Carrier.Admissible continuation}
    {coherent : RegistersCoherent registers phase scanned emptyMode}
    {sampleIndex fuel depth : Nat}
    (trace : FuelSampledTrace program dispatcher bits registers phase scanned
      emptyMode continuation hadmissible coherent sampleIndex fuel depth) :
    SampledState program dispatcher bits
      (fuelSampleEndIndex sampleIndex fuel)
      (fuelZeroFifthMutationConfiguration program dispatcher registers
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation
        (PrimitiveFuel.pendingParents
          (environmentCode (compileActions program dispatcher.tree) bits)
          continuation (fuelSampleEndDepth depth fuel) [])) := by
  induction trace with
  | zero sampleIndex depth states => exact states.fifth
  | succ sampleIndex fuel depth states tail ih => exact ih

/-- Terminal fuel sample at the public closed-form contraction count. -/
theorem final_exact
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {bits : List Bool} {registers : Registers program}
    {phase : CTS.Phase program} {scanned : List Bool} {emptyMode : Bool}
    {continuation : Term} {hadmissible : Carrier.Admissible continuation}
    {coherent : RegistersCoherent registers phase scanned emptyMode}
    {sampleIndex fuel depth : Nat}
    (trace : FuelSampledTrace program dispatcher bits registers phase scanned
      emptyMode continuation hadmissible coherent sampleIndex fuel depth) :
    SampledState program dispatcher bits (sampleIndex + (2 * fuel + 5))
      (fuelZeroFifthMutationConfiguration program dispatcher registers
        (environmentCode (compileActions program dispatcher.tree) bits)
        continuation
        (PrimitiveFuel.pendingParents
          (environmentCode (compileActions program dispatcher.tree) bits)
          continuation (depth + fuel) [])) := by
  simpa only [fuelSampleEndIndex_eq, fuelSampleEndDepth_eq] using trace.final

end FuelSampledTrace

/-- Executable seeks and indexed invariants for the same complete fuel phase. -/
structure FuelPhaseInvariant
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (continuation : Term) (hadmissible : Carrier.Admissible continuation)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (sampleIndex fuel depth : Nat) : Prop where
  execution : FuelPhaseSamples program dispatcher bits registers continuation
    hadmissible fuel depth
  invariant : FuelSampledTrace program dispatcher bits registers phase scanned
    emptyMode continuation hadmissible coherent sampleIndex fuel depth

/-- Construct the complete executable and semantic fuel certificate. -/
theorem fuelPhaseInvariant
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (registers : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (continuation : Term) (hadmissible : Carrier.Admissible continuation)
    (coherent : RegistersCoherent registers phase scanned emptyMode)
    (sampleIndex fuel depth : Nat) :
    FuelPhaseInvariant program dispatcher bits registers phase scanned emptyMode
      continuation hadmissible coherent sampleIndex fuel depth :=
  ⟨fuelPhaseSamples program dispatcher bits registers continuation hadmissible
      fuel depth,
    fuelSampledTrace program dispatcher bits registers phase scanned emptyMode
      continuation hadmissible coherent sampleIndex fuel depth⟩

/-! ### Construction-facing positive clock-and-fuel phase -/

/-- Contraction index of the launch immediately after positive clock closure. -/
def positiveStageLaunchIndex (sampleIndex fuel : Nat) : Nat :=
  sampleIndex + ((fuel + 1) + 1) + 1

/-- Contraction index of the Base-producing final fuel sample. -/
def positiveStageEndIndex (sampleIndex fuel : Nat) : Nat :=
  positiveStageLaunchIndex sampleIndex fuel + (2 * (fuel + 1) + 5)

/-- The literal launched fuel source is decoder-silent. -/
theorem positiveStageLaunch_silent
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (fuel : Nat) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    SilentEvidence program dispatcher.tree .fuel
      (positiveStageLaunchConfiguration program dispatcher fuel
        environment).cursor.erase := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  apply SilentEvidence.ofPublic
  apply CheckpointExclusion.Noncheckpoint.fuelSource (.here _)
  refine ⟨fuel, word bits,
    Dovetail.clockExit (fuel + 1) fuel environment, ?_⟩
  simp [positiveStageLaunchConfiguration, fuelPhaseSourceConfiguration,
    fuelCursor, Cursor.erase, environment,
    CheckpointDecoder.openEnvironment_word]
  rfl

/-- The post-launch configuration has exact macro position and fresh registers. -/
theorem positiveStageLaunch_holds
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (fuel : Nat) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    Holds program dispatcher
      (positiveStageLaunchConfiguration program dispatcher fuel environment) := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit (fuel + 1) fuel environment
  let focus : Term := .app (.app (C (fuel + 1)) environment) continuation
  have silent := positiveStageLaunch_silent program dispatcher bits fuel
  exact .intro (.macro (.family .fuel) (Registers.newJob program)) rfl
    (CTS.zeroPhase program) [] false (RegistersCoherent.initial program)
    (ControlPosition.macro (context := .hole) (focus := focus)
      ⟨rfl, rfl⟩ (by trivial))
    (.fuel (.silent (by simpa [environment, continuation, focus] using silent)))

/-- The launch contraction is an exact indexed sampled state. -/
theorem positiveStageLaunch_sampled
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (sampleIndex fuel : Nat) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    SampledState program dispatcher bits
      (positiveStageLaunchIndex sampleIndex fuel)
      (positiveStageLaunchConfiguration program dispatcher fuel environment) := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  have silent := positiveStageLaunch_silent program dispatcher bits fuel
  exact SampledState.ofSilent
    (.macro (.family .fuel) (Registers.newJob program))
    (positiveStageLaunch_holds program dispatcher bits fuel) rfl silent

/-- The completed positive fuel expansion is silent in DOWN mode. -/
theorem positiveStageDown_silent
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (fuel : Nat) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    let continuation := Dovetail.clockExit (fuel + 1) fuel environment
    SilentEvidence program dispatcher.tree .down
      (fuelPhaseCompletedConfiguration program dispatcher
        (Registers.newJob program) (fuel + 1) environment continuation []).cursor.erase := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit (fuel + 1) fuel environment
  apply SilentEvidence.ofEndpointFailure
  simpa [fuelPhaseCompletedConfiguration, Cursor.erase, environment,
    continuation] using
    pendingParents_failure program dispatcher bits continuation
      (baseCarrier environment continuation) (fuel + 1)
      (Nat.succ_ne_zero fuel)

/-- The launched Base has its exact canonical descent decoding the seed word. -/
theorem positiveStageBaseDescent
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (fuel : Nat) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    let continuation := Dovetail.clockExit (fuel + 1) fuel environment
    ∃ context,
      CanonicalTraversal.Descent program dispatcher.tree bits continuation
        (baseCarrier environment continuation) bits context := by
  let actions := compileActions program dispatcher.tree
  let environment := environmentCode actions bits
  let continuation := Dovetail.clockExit (fuel + 1) fuel environment
  obtain ⟨queueContext, queueShape, queueEq⟩ :=
    CanonicalTraversal.QueueContext.ofDecodes (CellSpine.decodes_word bits)
  let baseContext := MutableBase.queueContext actions bits continuation
    (baseBeta environment continuation)
  refine ⟨baseContext.comp queueContext, ?_⟩
  have descent : CanonicalTraversal.Descent program dispatcher.tree bits
      continuation
      (MutableBase.mutableBase actions bits continuation
        (queueContext.plug omega)) bits (baseContext.comp queueContext) :=
    .base queueShape
  simpa [actions, environment, continuation, queueEq] using descent

/-- The explicit post-fuel DOWN source satisfies the simultaneous invariant. -/
theorem positiveStageDown_holds
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (fuel : Nat) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    let continuation := Dovetail.clockExit (fuel + 1) fuel environment
    Holds program dispatcher
      (fuelPhaseCompletedConfiguration program dispatcher
        (Registers.newJob program) (fuel + 1) environment continuation []) := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit (fuel + 1) fuel environment
  obtain ⟨context, descent⟩ :=
    positiveStageBaseDescent program dispatcher bits fuel
  have coherent := (RegistersCoherent.initial program).clearScan
  have silent := positiveStageDown_silent program dispatcher bits fuel
  have holds := downDescent_holds (Registers.newJob program).clearScan descent
    (PrimitiveFuel.pendingParents environment continuation (fuel + 1) [])
    coherent silent
  simpa [fuelPhaseCompletedConfiguration, downConfiguration, environment,
    continuation] using holds

/--
One complete positive stage from its root clock source through the launch and
all fuel contractions to the explicit DOWN source.  Every contraction is
both executable and indexed by its global count relative to `sampleIndex`.
-/
structure PositiveStagePhaseTrace
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (clockRegisters : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (clockCoherent : RegistersCoherent clockRegisters phase scanned emptyMode)
    (sampleIndex fuel : Nat) : Prop where
  clock : ClockRootPhaseInvariant program dispatcher bits clockRegisters phase
    scanned emptyMode clockCoherent sampleIndex (fuel + 1)
  launch_seek :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    FiniteController.seekMutation (SchedulerControl.machine program dispatcher)
      (clockCompletedToLaunchTicks program dispatcher (fuel + 1) environment + 1)
      (clockPhaseCompletedConfiguration program dispatcher clockRegisters
        (fuel + 1) [.left environment]) =
      some (positiveStageLaunchConfiguration program dispatcher fuel environment)
  launch :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    SampledState program dispatcher bits
      (positiveStageLaunchIndex sampleIndex fuel)
      (positiveStageLaunchConfiguration program dispatcher fuel environment)
  fuelTrace :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    let continuation := Dovetail.clockExit (fuel + 1) fuel environment
    FuelPhaseInvariant program dispatcher bits (Registers.newJob program)
      (CTS.zeroPhase program) [] false continuation
      (Dovetail.clockExit_admissible (fuel + 1) fuel environment)
      (RegistersCoherent.initial program)
      (positiveStageLaunchIndex sampleIndex fuel) (fuel + 1) 0
  finalSample :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    let continuation := Dovetail.clockExit (fuel + 1) fuel environment
    SampledState program dispatcher bits (positiveStageEndIndex sampleIndex fuel)
      (fuelZeroFifthMutationConfiguration program dispatcher
        (Registers.newJob program) environment continuation
        (PrimitiveFuel.pendingParents environment continuation (fuel + 1) []))
  final_to_down :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    let continuation := Dovetail.clockExit (fuel + 1) fuel environment
    ZeroMutationRun (SchedulerControl.machine program dispatcher) 1
      (fuelZeroFifthMutationConfiguration program dispatcher
        (Registers.newJob program) environment continuation
        (PrimitiveFuel.pendingParents environment continuation (fuel + 1) []))
      (fuelPhaseCompletedConfiguration program dispatcher
        (Registers.newJob program) (fuel + 1) environment continuation [])
  down :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    let continuation := Dovetail.clockExit (fuel + 1) fuel environment
    Holds program dispatcher
      (fuelPhaseCompletedConfiguration program dispatcher
        (Registers.newJob program) (fuel + 1) environment continuation [])

/-- Construct the complete positive-stage controller/invariant trace. -/
theorem positiveStagePhaseTrace
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (clockRegisters : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (clockCoherent : RegistersCoherent clockRegisters phase scanned emptyMode)
    (sampleIndex fuel : Nat) :
    PositiveStagePhaseTrace program dispatcher bits clockRegisters phase scanned
      emptyMode clockCoherent sampleIndex fuel := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit (fuel + 1) fuel environment
  have clock := clockRootPhaseInvariant program dispatcher bits clockRegisters
    phase scanned emptyMode clockCoherent sampleIndex (fuel + 1)
  have launchSeek := clockCompleted_seekLaunch program dispatcher clockRegisters
    fuel bits
  have launch := positiveStageLaunch_sampled program dispatcher bits sampleIndex
    fuel
  have fuelTrace := fuelPhaseInvariant program dispatcher bits
    (Registers.newJob program) (CTS.zeroPhase program) [] false continuation
    (Dovetail.clockExit_admissible (fuel + 1) fuel environment)
    (RegistersCoherent.initial program)
    (positiveStageLaunchIndex sampleIndex fuel) (fuel + 1) 0
  have finalSample := fuelTrace.invariant.final_exact
  have finalRun := fuelZeroSampleSuffix_zeroRun program dispatcher
    (Registers.newJob program) environment continuation
    (PrimitiveFuel.pendingParents environment continuation (fuel + 1) [])
  refine ⟨clock, launchSeek, launch, fuelTrace, ?_, ?_,
    positiveStageDown_holds program dispatcher bits fuel⟩
  · simpa [positiveStageEndIndex, environment, continuation] using finalSample
  · simpa [fuelPhaseCompletedConfiguration, environment, continuation] using!
      finalRun

/-! ### Canonical Base descent after a positive stage -/

/--
The omega endpoint of the canonical Base descent has the same directly
verified decoder failure as the post-fuel DOWN source.  This statement uses
the literal context returned by `positiveStageBaseDescent`, so it also fixes
the endpoint zipper rather than merely classifying the erased root.
-/
theorem positiveStageUp_silent
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (fuel : Nat) {context : Context}
    (descent :
      let environment :=
        environmentCode (compileActions program dispatcher.tree) bits
      let continuation := Dovetail.clockExit (fuel + 1) fuel environment
      CanonicalTraversal.Descent program dispatcher.tree bits continuation
        (baseCarrier environment continuation) bits context) :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    let continuation := Dovetail.clockExit (fuel + 1) fuel environment
    let parents :=
      PrimitiveFuel.pendingParents environment continuation (fuel + 1) []
    SilentEvidence program dispatcher.tree .up
      (upConfiguration program dispatcher
        (Registers.newJob program).clearScan omega
        (ContextCursor.frames context omega parents)).cursor.erase := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit (fuel + 1) fuel environment
  let parents :=
    PrimitiveFuel.pendingParents environment continuation (fuel + 1) []
  apply SilentEvidence.ofEndpointFailure
  change CheckpointExclusion.EndpointFailure program dispatcher.tree
    (Cursor.rebuild (ContextCursor.frames context omega parents) omega)
  rw [rebuild_contextFrames, descent.source_eq]
  exact pendingParents_failure program dispatcher bits continuation
    (baseCarrier environment continuation) (fuel + 1) (Nat.succ_ne_zero fuel)

/--
Construction-facing continuation of `PositiveStagePhaseTrace`: the exact Base
source descends, without another contraction, to the exact UP/omega zipper.
The endpoint therefore remains at `positiveStageEndIndex sampleIndex fuel`.
-/
structure PositiveStageDownUpTrace
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (clockRegisters : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (clockCoherent : RegistersCoherent clockRegisters phase scanned emptyMode)
    (sampleIndex fuel : Nat) (context : Context) (descentTicks : Nat) : Prop where
  phaseTrace : PositiveStagePhaseTrace program dispatcher bits clockRegisters
    phase scanned emptyMode clockCoherent sampleIndex fuel
  descent :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    let continuation := Dovetail.clockExit (fuel + 1) fuel environment
    CanonicalTraversal.Descent program dispatcher.tree bits continuation
      (baseCarrier environment continuation) bits context
  descentRun :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    let continuation := Dovetail.clockExit (fuel + 1) fuel environment
    let parents :=
      PrimitiveFuel.pendingParents environment continuation (fuel + 1) []
    ZeroMutationRun (SchedulerControl.machine program dispatcher) descentTicks
      (fuelPhaseCompletedConfiguration program dispatcher
        (Registers.newJob program) (fuel + 1) environment continuation [])
      (upConfiguration program dispatcher
        (Registers.newJob program).clearScan omega
        (ContextCursor.frames context omega parents))
  up :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    let continuation := Dovetail.clockExit (fuel + 1) fuel environment
    let parents :=
      PrimitiveFuel.pendingParents environment continuation (fuel + 1) []
    Holds program dispatcher
      (upConfiguration program dispatcher
        (Registers.newJob program).clearScan omega
        (ContextCursor.frames context omega parents))
  finalSample_to_up :
    let environment :=
      environmentCode (compileActions program dispatcher.tree) bits
    let continuation := Dovetail.clockExit (fuel + 1) fuel environment
    let parents :=
      PrimitiveFuel.pendingParents environment continuation (fuel + 1) []
    ZeroMutationRun (SchedulerControl.machine program dispatcher)
      (1 + descentTicks)
      (fuelZeroFifthMutationConfiguration program dispatcher
        (Registers.newJob program) environment continuation parents)
      (upConfiguration program dispatcher
        (Registers.newJob program).clearScan omega
        (ContextCursor.frames context omega parents))

/--
Execute the complete positive clock/fuel phase and its canonical Base descent.
All decoder-silence obligations at DOWN and UP are proved from the positive
pending-frame envelope; no construction-specific premise is exposed.
-/
theorem positiveStageDownUpTrace
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (clockRegisters : Registers program)
    (phase : CTS.Phase program) (scanned : List Bool) (emptyMode : Bool)
    (clockCoherent : RegistersCoherent clockRegisters phase scanned emptyMode)
    (sampleIndex fuel : Nat) :
    ∃ context descentTicks,
      PositiveStageDownUpTrace program dispatcher bits clockRegisters phase
        scanned emptyMode clockCoherent sampleIndex fuel context descentTicks := by
  let environment :=
    environmentCode (compileActions program dispatcher.tree) bits
  let continuation := Dovetail.clockExit (fuel + 1) fuel environment
  let parents :=
    PrimitiveFuel.pendingParents environment continuation (fuel + 1) []
  have phaseTrace := positiveStagePhaseTrace program dispatcher bits
    clockRegisters phase scanned emptyMode clockCoherent sampleIndex fuel
  obtain ⟨context, descent⟩ :=
    positiveStageBaseDescent program dispatcher bits fuel
  obtain ⟨descentTicks, descentRun⟩ := run_downDescent
    (registers := (Registers.newJob program).clearScan) descent parents
  have upSilent := positiveStageUp_silent program dispatcher bits fuel descent
  have coherent := (RegistersCoherent.initial program).clearScan
  have upHolds := upDescent_holds (Registers.newJob program).clearScan descent
    parents coherent upSilent
  have finalToUp := phaseTrace.final_to_down.trans descentRun
  refine ⟨context, descentTicks, phaseTrace, descent, ?_, upHolds, ?_⟩
  · simpa [fuelPhaseCompletedConfiguration, downConfiguration, environment,
      continuation, parents] using descentRun
  · simpa [environment, continuation, parents, Nat.add_assoc] using finalToUp

/-! ### Concrete initial stage -/

/-- The first positive launch is the fourth contraction of the concrete run. -/
theorem initialPositiveStageLaunchIndex :
    positiveStageLaunchIndex 1 0 = 4 := by
  rfl

/-- The first Base-producing fuel endpoint is contraction eleven. -/
theorem initialPositiveStageEndIndex :
    positiveStageEndIndex 1 0 = 11 := by
  rfl

/--
Exact construction-facing trace from the unreduced public generator through
the first positive stage and its canonical Base descent.  The two explicit
sampling equations connect the concrete controller initialization to the
uniform stage theorem; the stage endpoint is the DOWN/UP pair at contraction
index eleven.
-/
structure InitialPositiveStageTrace
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (context : Context) (descentTicks : Nat) : Prop where
  initial : SampledState program dispatcher bits 0
    (SchedulerControl.initialConfiguration program dispatcher bits)
  initial_seek_first :
    FiniteController.seekMutation (SchedulerControl.machine program dispatcher)
      (firstMutationPrefixTicks program dispatcher bits + 1)
      (SchedulerControl.initialConfiguration program dispatcher bits) =
    some (firstMutationConfiguration program dispatcher bits)
  first : SampledState program dispatcher bits 1
    (firstMutationConfiguration program dispatcher bits)
  first_seek_clock :
    FiniteController.seekMutation (SchedulerControl.machine program dispatcher)
      (firstToSecondMutationPrefixTicks program dispatcher bits + 1)
      (firstMutationConfiguration program dispatcher bits) =
    some (secondMutationConfiguration program dispatcher bits)
  stage : PositiveStageDownUpTrace program dispatcher bits
    (Registers.initial program) (CTS.zeroPhase program) [] false
    (RegistersCoherent.initial program) 1 0 context descentTicks

/--
Construct the literal initial finite trace.  Its final Base sample has global
contraction index eleven, while the following DOWN and UP movement has zero
additional mutations.
-/
theorem initialPositiveStageTrace
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) :
    ∃ context descentTicks,
      InitialPositiveStageTrace program dispatcher bits context descentTicks := by
  obtain ⟨context, descentTicks, stage⟩ := positiveStageDownUpTrace program
    dispatcher bits (Registers.initial program) (CTS.zeroPhase program) [] false
    (RegistersCoherent.initial program) 1 0
  exact ⟨context, descentTicks,
    SampledState.initial program dispatcher bits,
    initial_seekFirstMutation program dispatcher bits,
    SampledState.firstMutation program dispatcher bits,
    firstMutation_seekSecondMutation program dispatcher bits,
    stage⟩

/--
An exact finite certificate for `remaining` successive contraction events.
Every event is found by executable bounded search, and every returned state
again carries the full seven-family/cursor/register invariant.
-/
def CanAdvance
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool)
    (bound : Configuration program dispatcher → Nat) :
    Nat → Nat → Configuration program dispatcher → Prop
  | _, 0, _ => True
  | sampleIndex, remaining + 1, configuration =>
      ∃ after,
        FiniteController.seekMutation
            (SchedulerControl.machine program dispatcher)
            (bound configuration) configuration = some after ∧
          SampledState program dispatcher bits (sampleIndex + 1) after ∧
          CanAdvance program dispatcher bits bound (sampleIndex + 1)
            remaining after

/--
The invariant required only at contraction-sampled states.  Arbitrarily long
finite certificates avoid every choice principle: the first successor is
unique because `seekMutation` is a function, and the tail certificate is
recovered from the certificate of length `n+1`.
-/
structure SampledGood
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool) (sampleIndex : Nat)
    (bound : Configuration program dispatcher → Nat)
    (configuration : Configuration program dispatcher) : Prop where
  current : SampledState program dispatcher bits sampleIndex configuration
  future : ∀ remaining,
    CanAdvance program dispatcher bits bound sampleIndex remaining configuration

namespace SampledGood

/-- A sampled-good state has a concrete next contraction within its bound. -/
theorem finds
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {bits : List Bool} {sampleIndex : Nat}
    {bound : Configuration program dispatcher → Nat}
    {configuration : Configuration program dispatcher}
    (good : SampledGood program dispatcher bits sampleIndex bound configuration) :
    ∃ after,
      FiniteController.seekMutation
          (SchedulerControl.machine program dispatcher)
          (bound configuration) configuration = some after := by
  rcases good.future 1 with ⟨after, found, afterHolds, tail⟩
  exact ⟨after, found⟩

/-- Bounded search returns another sampled-good state. -/
theorem closed
    {program : CTS.Program} {dispatcher : ActionDispatcher program}
    {bits : List Bool} {sampleIndex : Nat}
    {bound : Configuration program dispatcher → Nat}
    {configuration after : Configuration program dispatcher}
    (good : SampledGood program dispatcher bits sampleIndex bound configuration)
    (found : FiniteController.seekMutation
        (SchedulerControl.machine program dispatcher)
        (bound configuration) configuration = some after) :
    SampledGood program dispatcher bits (sampleIndex + 1) bound after := by
  have one := good.future 1
  rcases one with ⟨first, firstFound, firstHolds, firstTail⟩
  have first_eq : first = after := by
    exact Option.some.inj (firstFound.symm.trans found)
  subst first
  refine ⟨firstHolds, ?_⟩
  intro remaining
  rcases good.future (remaining + 1) with
    ⟨first, firstFound, firstHoldsAgain, tail⟩
  have first_eq : first = after := by
    exact Option.some.inj (firstFound.symm.trans found)
  subst first
  exact tail

/--
Choice-free productive-system adapter for the sampled invariant.  Its
explicit construction-specific premise `initialGood` must be established by
the simultaneous seven-family induction; this declaration does not infer it
from finite macro reductions.
-/
def productiveSystem
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool)
    (bound : Configuration program dispatcher → Nat)
    (initialConfiguration : Configuration program dispatcher)
    (initialGood : SampledGood program dispatcher bits 0 bound
      initialConfiguration) :
    FiniteController.ProductiveSystem
      (SchedulerControl.machine program dispatcher) where
  bound := bound
  good := fun configuration =>
    ∃ sampleIndex,
      SampledGood program dispatcher bits sampleIndex bound configuration
  initial := initialConfiguration
  initial_good := ⟨0, initialGood⟩
  finds := by
    intro configuration good
    rcases good with ⟨sampleIndex, indexed⟩
    exact indexed.finds
  closed := by
    intro configuration after good found
    rcases good with ⟨sampleIndex, indexed⟩
    exact ⟨sampleIndex + 1, indexed.closed found⟩

/-- The `n`th executable sample carries the invariant indexed by exactly `n`. -/
theorem contractionRun_sampledGood
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool)
    (bound : Configuration program dispatcher → Nat)
    (initialConfiguration : Configuration program dispatcher)
    (initialGood : SampledGood program dispatcher bits 0 bound
      initialConfiguration) :
    ∀ index,
      SampledGood program dispatcher bits index bound
        ((productiveSystem program dispatcher bits bound initialConfiguration
          initialGood).contractionRun index)
  | 0 => by
      simpa [productiveSystem] using initialGood
  | index + 1 => by
      let system := productiveSystem program dispatcher bits bound
        initialConfiguration initialGood
      have previous := contractionRun_sampledGood program dispatcher bits bound
        initialConfiguration initialGood index
      rcases previous.future 1 with
        ⟨after, found, afterState, tail⟩
      have next_eq : system.next (system.contractionRun index) = after := by
        exact FiniteController.advance_eq_of_seekMutation
          (SchedulerControl.machine program dispatcher) bound found
      rw [show system.contractionRun (index + 1) =
        system.next (system.contractionRun index) by rfl, next_eq]
      exact previous.closed found

/-- Every contraction-sampled controller state retains the full mode invariant. -/
theorem contractionRun_holds
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool)
    (bound : Configuration program dispatcher → Nat)
    (initialConfiguration : Configuration program dispatcher)
    (initialGood : SampledGood program dispatcher bits 0 bound
      initialConfiguration)
    (index : Nat) :
    Holds program dispatcher
      ((productiveSystem program dispatcher bits bound initialConfiguration
        initialGood).contractionRun index) := by
  exact (contractionRun_sampledGood program dispatcher bits bound
    initialConfiguration initialGood index).current.holds

/-- Every sampled contraction has an exact zero/silent/positive certificate. -/
theorem contractionRun_event
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool)
    (bound : Configuration program dispatcher → Nat)
    (initialConfiguration : Configuration program dispatcher)
    (initialGood : SampledGood program dispatcher bits 0 bound
      initialConfiguration)
    (index : Nat) :
    let system := productiveSystem program dispatcher bits bound
      initialConfiguration initialGood
    let configuration := system.contractionRun index
    ∃ control : SchedulerControl.Control program dispatcher,
      configuration.control = some control ∧
      EventEvidence program dispatcher bits index control.family
        configuration.cursor.erase := by
  dsimp only
  exact (contractionRun_sampledGood program dispatcher bits bound
    initialConfiguration initialGood index).current.classification

/-- Exact family-indexed decoder classification at every sampled contraction. -/
theorem contractionRun_acceptsOnly
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (bits : List Bool)
    (bound : Configuration program dispatcher → Nat)
    (initialConfiguration : Configuration program dispatcher)
    (initialGood : SampledGood program dispatcher bits 0 bound
      initialConfiguration)
    (index : Nat) (result : CheckpointDecoder.Result program) :
    let system := productiveSystem program dispatcher bits bound initialConfiguration
      initialGood
    let configuration := system.contractionRun index
    CheckpointDecoder.decode? program dispatcher.tree
        configuration.cursor.erase = some result ↔
      ∃ control : SchedulerControl.Control program dispatcher,
        configuration.control = some control ∧
        CheckpointExclusion.Accepted program dispatcher.tree control.family
          configuration.cursor.erase result := by
  dsimp only
  exact (contractionRun_holds program dispatcher bits bound initialConfiguration
    initialGood index).acceptsOnly result

end SampledGood

end SchedulerInvariant

end PureSFormal.PureS
