import PureSFormal.PureS.CheckpointRun
import PureSFormal.PureS.SchedulerControl

/-!
# Scheduler-family checkpoint exclusion

This module isolates the syntactic half of the checkpoint-uniqueness argument.
It does not assert that the scheduler reaches any of the shapes below.  Instead
it gives a compact seven-family interface for a reachable-mode
invariant: when that invariant supplies a `FamilyShape`, the bare-term decoder
is either rejected, is the exact time-zero generator, or is a completed,
halt-consistent positive terminal.

Already-completed jobs from earlier stages are represented by
`CompletedPrefix`.  Its constructors follow only literal completed-Local
continuation children.  The endpoint shapes below therefore describe the
current scheduler work beneath an arbitrary cumulative outer chain.
-/

namespace PureSFormal.PureS

namespace CheckpointExclusion

open CheckpointDecoder

/-! ## The seven scheduler families -/

/-- The exclusion theorem is indexed by the controller's actual family tag. -/
abbrev Family := SchedulerControl.Family

/-! ## Parser facts used by every endpoint exclusion -/

/-- Successful generator parsing fixes root arity four. -/
theorem parseGenerator?_headArity
    {actions term : Term} {bits : List Bool}
    (h : parseGenerator? actions term = some bits) :
    term.headArity = 4 := by
  rw [parseGenerator?_sound h]
  exact CheckpointRun.headArity_generator actions bits

/-- Successful positive-terminal parsing fixes root arity four. -/
theorem parseTerminal?_headArity
    {actions term : Term} {view : TerminalView}
    (h : parseTerminal? actions term = some view) :
    term.headArity = 4 := by
  rcases parseTerminal?_sound h with ⟨sourceEq, positive⟩
  rw [sourceEq]
  exact Dovetail.headArity_clockExit_zero view.horizon
    (openEnvironment actions view.seedPayload)

theorem parseGenerator?_none_of_headArity
    (actions term : Term) (hne : term.headArity ≠ 4) :
    parseGenerator? actions term = none := by
  cases h : parseGenerator? actions term with
  | none => rfl
  | some bits => exact (hne (parseGenerator?_headArity h)).elim

theorem parseTerminal?_none_of_headArity
    (actions term : Term) (hne : term.headArity ≠ 4) :
    parseTerminal? actions term = none := by
  cases h : parseTerminal? actions term with
  | none => rfl
  | some view => exact (hne (parseTerminal?_headArity h)).elim

/-- A completed Local cannot also be the exact time-zero generator. -/
theorem parseGenerator?_none_of_parseLocal
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : LocalView program}
    (hlocal : parseLocal? program tree term = some view) :
    parseGenerator? (compileActions program tree) term = none := by
  cases hzero : parseGenerator? (compileActions program tree) term with
  | none => rfl
  | some bits =>
      have hfour : term.headArity = 4 := parseGenerator?_headArity hzero
      rcases parseLocal?_headArity hlocal with hfive | hsix
      · rw [hfour] at hfive
        cases hfive
      · rw [hfour] at hsix
        cases hsix

/-- The three failed endpoint tests needed below a completed prefix. -/
structure EndpointFailure
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Prop where
  generator : parseGenerator? (compileActions program tree) term = none
  localBoundary : parseLocal? program tree term = none
  terminal :
    parseTerminal? (compileActions program tree) term = none

/-- Root arity outside `4/5/6` fails every checkpoint boundary production. -/
theorem EndpointFailure.ofHeadArity
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term)
    (hneFour : term.headArity ≠ 4)
    (hneFive : term.headArity ≠ 5)
    (hneSix : term.headArity ≠ 6) :
    EndpointFailure program tree term := by
  exact ⟨
    parseGenerator?_none_of_headArity _ _ hneFour,
    parseLocal?_none_of_headArity program tree term hneFive hneSix,
    parseTerminal?_none_of_headArity _ _ hneFour⟩

/-! ## Completed outer prefixes -/

/--
Zero or more already-completed Local shells above a current endpoint.
The stored views come from the executable public parser, so the induction
follows exactly the decoder's literal `RL` continuation traversal.
-/
inductive CompletedPrefix
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) :
    Term → Term → Nat → Prop where
  | here (endpoint : Term) :
      CompletedPrefix program tree endpoint endpoint 0
  | local
      {term endpoint : Term} {layers : Nat}
      (view : LocalView program)
      (boundary : parseLocal? program tree term = some view)
      (inner : CompletedPrefix program tree view.continuation endpoint layers) :
      CompletedPrefix program tree term endpoint (layers + 1)

namespace CompletedPrefix

/-- A failed endpoint remains failed after every completed outer shell. -/
theorem parseChainTail?_none
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term endpoint : Term} {layers : Nat}
    (chainPrefix : CompletedPrefix program tree term endpoint layers)
    (endpointLocal : parseLocal? program tree endpoint = none)
    (endpointTerminal :
      parseTerminal? (compileActions program tree) endpoint = none) :
    parseChainTail? program tree term = none := by
  induction chainPrefix with
  | here =>
      rw [parseChainTail?, endpointLocal, endpointTerminal]
      rfl
  | «local» view boundary inner ih =>
      rw [parseChainTail?, boundary]
      simp only
      rw [ih endpointLocal endpointTerminal]
      rfl

theorem parseChain?_none
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term endpoint : Term} {layers : Nat}
    (chainPrefix : CompletedPrefix program tree term endpoint layers)
    (endpointLocal : parseLocal? program tree endpoint = none)
    (endpointTerminal :
      parseTerminal? (compileActions program tree) endpoint = none) :
    parseChain? program tree term = none := by
  unfold parseChain?
  rw [chainPrefix.parseChainTail?_none endpointLocal endpointTerminal]

theorem parseGenerator?_none
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term endpoint : Term} {layers : Nat}
    (chainPrefix : CompletedPrefix program tree term endpoint layers)
    (endpointGenerator :
      parseGenerator? (compileActions program tree) endpoint = none) :
    parseGenerator? (compileActions program tree) term = none := by
  induction chainPrefix with
  | here => exact endpointGenerator
  | «local» view boundary inner ih =>
      exact parseGenerator?_none_of_parseLocal boundary

/-- Master rejection lemma for an unfinished endpoint under any old shells. -/
theorem decode?_none
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term endpoint : Term} {layers : Nat}
    (chainPrefix : CompletedPrefix program tree term endpoint layers)
    (failure : EndpointFailure program tree endpoint) :
    decode? program tree term = none := by
  rw [decode?, chainPrefix.parseGenerator?_none failure.generator]
  rw [parsePositive?,
    chainPrefix.parseChain?_none failure.localBoundary failure.terminal]
  rfl

end CompletedPrefix

/-! ## Explicit unfinished endpoint shapes -/

/-- The arity-four `C₁ C₁` staging endpoint, with no completed job. -/
structure StagingShape
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) where
  seedPayload : Term
  source_eq : term =
    Dovetail.clockExit 0 0
      (openEnvironment (compileActions program tree) seedPayload)

theorem StagingShape.failure
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} (shape : StagingShape program tree term) :
    EndpointFailure program tree term := by
  rcases shape with ⟨seedPayload, rfl⟩
  exact ⟨
    parseGenerator?_staging _ seedPayload,
    parseLocal?_terminal_none program tree 0 _,
    parseTerminal?_staging _ seedPayload⟩

/-- An uncontracted positive-fuel call `C_(m+1) E B`. -/
structure FuelShape
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) where
  fuel : Nat
  seedPayload : Term
  continuation : Term
  source_eq : term =
    .app
      (.app (C (fuel + 1))
        (openEnvironment (compileActions program tree) seedPayload))
      continuation

theorem FuelShape.failure
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} (shape : FuelShape program tree term) :
    EndpointFailure program tree term := by
  rcases shape with ⟨fuel, seedPayload, continuation, rfl⟩
  constructor
  · simp [parseGenerator?, parseCarrier?, openEnvironment]
  · apply parseLocal?_none_of_headArity program tree
    · simp [C]
    · simp [C]
  · simp [parseTerminal?, parseCarrier?, openEnvironment]

/-- A literal shallow pending frame, with every payload independent. -/
structure PendingShape (term : Term) where
  hole₀ : Term
  hole₁ : Term
  hole₂ : Term
  continuation : Term
  child : Term
  source_eq : term = PendingFrame.pending hole₀ hole₁ hole₂
    continuation child

theorem PendingShape.failure
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    {term : Term} (shape : PendingShape term) :
    EndpointFailure program tree term := by
  rcases shape with ⟨hole₀, hole₁, hole₂, continuation, child, rfl⟩
  apply EndpointFailure.ofHeadArity
  all_goals simp

/-- A frame before its response has replaced the pending parent. -/
structure PreFrameShape
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) where
  seedPayload : Term
  continuation : Term
  child : Term
  source_eq : term = frame
    (openEnvironment (compileActions program tree) seedPayload)
    continuation child

theorem PreFrameShape.failure
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} (shape : PreFrameShape program tree term) :
    EndpointFailure program tree term := by
  rcases shape with ⟨seedPayload, continuation, child, rfl⟩
  apply EndpointFailure.ofHeadArity
  all_goals simp [frame, openEnvironment]

/-- A registered arity-three clock wrapper still remains. -/
structure WrapperShape (term : Term) where
  stage : Nat
  remaining : Nat
  environment : Term
  source_eq : term =
    Dovetail.clockExit stage (remaining + 1) environment

theorem WrapperShape.failure
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    {term : Term} (shape : WrapperShape term) :
    EndpointFailure program tree term := by
  rcases shape with ⟨stage, remaining, environment, rfl⟩
  exact ⟨
    parseGenerator?_nonterminalExit _ _ _ _,
    parseLocal?_nonterminalExit_none program tree _ _ _,
    parseTerminal?_nonterminalExit _ _ _ _⟩

/-! ## Base and active-carrier shapes -/

/-- An exact mutation-closed Base before its enclosing frame is completed. -/
structure BaseShape
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) where
  bits : List Bool
  continuation : Term
  queue : Term
  beta : Term
  admissible : Carrier.Admissible continuation
  source_eq : term = MutableBase.base
    (compileActions program tree) bits continuation queue beta

theorem BaseShape.failure
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} (shape : BaseShape program tree term) :
    EndpointFailure program tree term := by
  rcases shape with
    ⟨bits, continuation, queue, beta, admissible, rfl⟩
  let source := MutableBase.base (compileActions program tree) bits
    continuation queue beta
  have harity : source.headArity = 5 ∨ source.headArity = 6 :=
    MutableBase.root_headArity _ bits admissible queue beta
  have hnotFour : source.headArity ≠ 4 := by
    intro hfour
    rcases harity with hfive | hsix
    · rw [hfour] at hfive
      cases hfive
    · rw [hfour] at hsix
      cases hsix
  have hbase : parseBase? (compileActions program tree) source =
      some ⟨queue, continuation, word bits, beta⟩ :=
    parseBase?_mutableBase _ bits continuation queue beta
  have hlocal : parseLocal? program tree source = none := by
    cases found : parseLocal? program tree source with
    | none => rfl
    | some view =>
        have impossible := CheckpointRun.parseBase?_none_of_localShape
          (parseLocal?_sound found)
        rw [hbase] at impossible
        contradiction
  exact ⟨
    parseGenerator?_none_of_headArity _ _ hnotFour,
    hlocal,
    parseTerminal?_none_of_headArity _ _ hnotFour⟩

/-- A canonical live/tombstone/root path still inside its pending frame. -/
structure ActiveCarrierShape
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) where
  bits : List Bool
  continuation : Term
  carrier : Term
  hole₀ : Term
  hole₁ : Term
  hole₂ : Term
  active : RootPath.Path program tree bits continuation carrier
  source_eq : term = PendingFrame.pending hole₀ hole₁ hole₂
    continuation carrier

theorem ActiveCarrierShape.failure
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} (shape : ActiveCarrierShape program tree term) :
    EndpointFailure program tree term := by
  exact (PendingShape.mk shape.hole₀ shape.hole₁ shape.hole₂
    shape.continuation shape.carrier shape.source_eq).failure program tree

/-! ## Incomplete dispatcher/action fields -/

/-- A Local-layout boundary whose halt field is valid but response is unfinished. -/
structure OpenLocalShape
    (program : CTS.Program)
    (term : Term) where
  status : HaltStatus
  haltField : Term
  dispatcher : Term
  seedPayload : Term
  seedAudit : Term
  continuation : Term
  continuationAudit : Term
  halt : HaltShape status haltField
  source_eq : term = openShell haltField dispatcher seedPayload seedAudit
    continuation continuationAudit

theorem OpenLocalShape.headArity
    {program : CTS.Program} {term : Term}
    (shape : OpenLocalShape program term) :
    term.headArity = 5 ∨ term.headArity = 6 := by
  rw [shape.source_eq]
  rcases shape.halt.headArity with htwo | hthree
  · left
    simp [openShell, htwo]
  · right
    simp [openShell, hthree]

theorem OpenLocalShape.parseLocal?_none
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} (shape : OpenLocalShape program term)
    (dispatchNone : DispatchParser.parse program tree shape.dispatcher = none) :
    parseLocal? program tree term = none := by
  rcases shape with
    ⟨status, haltField, dispatcher, seedPayload, seedAudit, continuation,
      continuationAudit, halt, rfl⟩
  cases halt with
  | fresh audit =>
      simp [parseLocal?, openShell, checkHalt?, freshHField, dispatchNone]
  | marked leftAudit rightAudit =>
      simp [parseLocal?, openShell, checkHalt?, Carrier.markedHField,
        haltCode, b, dispatchNone]

theorem OpenLocalShape.failure
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} (shape : OpenLocalShape program term)
    (dispatchNone : DispatchParser.parse program tree shape.dispatcher = none) :
    EndpointFailure program tree term := by
  have harity := shape.headArity
  have hnotFour : term.headArity ≠ 4 := by
    intro hfour
    rcases harity with hfive | hsix
    · rw [hfour] at hfive
      cases hfive
    · rw [hfour] at hsix
      cases hsix
  exact ⟨
    parseGenerator?_none_of_headArity _ _ hnotFour,
    shape.parseLocal?_none dispatchNone,
    parseTerminal?_none_of_headArity _ _ hnotFour⟩

/-- Route parsing has not yet produced a completed dispatcher field. -/
structure PreDispatchShape
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) where
  shell : OpenLocalShape program term
  routeNone : DispatchParser.parseRouteDetailed (selectedAction program) tree
    shell.dispatcher = none

theorem PreDispatchShape.dispatch_none
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} (shape : PreDispatchShape program tree term) :
    DispatchParser.parse program tree shape.shell.dispatcher = none := by
  simp [DispatchParser.parse, shape.routeNone]

theorem PreDispatchShape.failure
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} (shape : PreDispatchShape program tree term) :
    EndpointFailure program tree term :=
  shape.shell.failure shape.dispatch_none

/-- The route is complete, but equation-(8b) action parsing is not. -/
structure PreActionShape
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) where
  shell : OpenLocalShape program term
  route : DispatchParser.DetailedRoute (ActionLabel program)
  route_eq : DispatchParser.parseRouteDetailed (selectedAction program) tree
    shell.dispatcher = some route
  actionNone : ActionParser.parse program route.label route.response = none

theorem PreActionShape.dispatch_none
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} (shape : PreActionShape program tree term) :
    DispatchParser.parse program tree shape.shell.dispatcher = none := by
  simp [DispatchParser.parse, shape.route_eq, shape.actionNone]

theorem PreActionShape.failure
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} (shape : PreActionShape program tree term) :
    EndpointFailure program tree term :=
  shape.shell.failure shape.dispatch_none

/-! ## Return/empty boundary shapes -/

/-- A completed Local still has an uncontracted pending parent above it. -/
structure PendingCompletedLocalShape
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) where
  view : LocalView program
  completed : Term
  hole₀ : Term
  hole₁ : Term
  hole₂ : Term
  continuation : Term
  childLocal : parseLocal? program tree completed = some view
  source_eq : term = PendingFrame.pending hole₀ hole₁ hole₂
    continuation completed

theorem PendingCompletedLocalShape.failure
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} (shape : PendingCompletedLocalShape program tree term) :
    EndpointFailure program tree term := by
  exact (PendingShape.mk shape.hole₀ shape.hole₁ shape.hole₂
    shape.continuation shape.completed shape.source_eq).failure program tree

/--
The empty result immediately before the required halt-field contraction:
the continuation chain is terminal and the final Local is still fresh.
-/
structure PreMarkerEmptyShape
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) where
  chain : ChainView program
  chainShape : ChainShape program tree term (.completed chain)
  fresh : chain.last.status = .fresh
  empty : CarrierDecodes program tree chain.last.accumulator []

theorem PreMarkerEmptyShape.decode?_none
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} (shape : PreMarkerEmptyShape program tree term) :
    decode? program tree term = none := by
  have hchain : parseChain? program tree term = some shape.chain :=
    parseChain?_complete shape.chainShape
  have hqueue : decodeCarrier? program tree shape.chain.last.accumulator =
      some [] := decodeCarrier?_complete program tree shape.empty
  have hpositive : parsePositive? program tree term = none :=
    parsePositive?_fresh_empty program tree term shape.chain hchain shape.fresh
      hqueue
  have hzero := CheckpointRun.parseGenerator?_none_of_completedChain
    shape.chainShape
  rw [decode?, hzero, hpositive]
  rfl

/-! ## Halt-consistent terminal checkpoints -/

/--
A completed positive chain with an explicitly exposed final halt status.
This is `PositiveShape` with its witness fields available to mode proofs.
-/
structure TerminalCheckpointShape
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (status : HaltStatus)
    (result : PositiveView program)
    (term : Term) where
  chain : ChainView program
  chainShape : ChainShape program tree term (.completed chain)
  phase : chain.last.label.1 = expectedPhase program chain.terminal.horizon
  carrier : CarrierDecodes program tree chain.last.accumulator result.queue
  marker : markerCompatible chain.last.status result.queue = true
  result_eq : result =
    ⟨chain.terminal.horizon, chain.last.route, chain.last.label, result.queue⟩
  status_eq : chain.last.status = status

namespace TerminalCheckpointShape

theorem positive
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {status : HaltStatus} {result : PositiveView program} {term : Term}
    (shape : TerminalCheckpointShape program tree status result term) :
    PositiveShape program tree result term := by
  exact ⟨shape.chain, shape.chainShape, shape.phase, shape.carrier,
    shape.marker, shape.result_eq⟩

theorem terminal_headArity
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {status : HaltStatus} {result : PositiveView program} {term : Term}
    (shape : TerminalCheckpointShape program tree status result term) :
    (Dovetail.clockExit shape.chain.terminal.horizon 0
      (openEnvironment (compileActions program tree)
        shape.chain.terminal.seedPayload)).headArity = 4 := by
  simp

theorem decode?
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {status : HaltStatus} {result : PositiveView program} {term : Term}
    (shape : TerminalCheckpointShape program tree status result term) :
    CheckpointDecoder.decode? program tree term =
      some (.positive result) := by
  apply decode?_complete
  exact .positive result
    (CheckpointRun.parseGenerator?_none_of_completedChain shape.chainShape)
    shape.positive

theorem fresh_queue_nonempty
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {result : PositiveView program} {term : Term}
    (shape : TerminalCheckpointShape program tree .fresh result term) :
    result.queue ≠ [] := by
  have compatibility :=
    (markerCompatible_eq_true_iff shape.chain.last.status result.queue).mp
      shape.marker
  rw [shape.status_eq] at compatibility
  intro hempty
  have : HaltStatus.fresh = .marked := compatibility.mpr hempty
  cases this

theorem marked_queue_empty
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {result : PositiveView program} {term : Term}
    (shape : TerminalCheckpointShape program tree .marked result term) :
    result.queue = [] := by
  have compatibility :=
    (markerCompatible_eq_true_iff shape.chain.last.status result.queue).mp
      shape.marker
  rw [shape.status_eq] at compatibility
  exact compatibility.mp rfl

end TerminalCheckpointShape

/-! ## A raw arity-four terminal without a completed Local -/

/-- A positive clock terminal at the root, with no completed Local above it. -/
structure RawTerminalShape
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) where
  horizon : Nat
  seedPayload : Term
  source_eq : term = Dovetail.clockExit (horizon + 1) 0
    (openEnvironment (compileActions program tree) seedPayload)

theorem RawTerminalShape.decode?_none
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} (shape : RawTerminalShape program tree term) :
    decode? program tree term = none := by
  rcases shape with ⟨horizon, seedPayload, rfl⟩
  let endpoint := Dovetail.clockExit (horizon + 1) 0
    (openEnvironment (compileActions program tree) seedPayload)
  have hlocal : parseLocal? program tree endpoint = none :=
    parseLocal?_terminal_none program tree _ _
  have hterminal : parseTerminal? (compileActions program tree) endpoint =
      some ⟨horizon + 1, seedPayload⟩ :=
    parseTerminal?_clockExit _ seedPayload horizon
  have hchain : parseChain? program tree endpoint = none := by
    unfold parseChain?
    rw [parseChainTail?, hlocal, hterminal]
    rfl
  have hzero : parseGenerator? (compileActions program tree) endpoint = none := by
    simp [endpoint, parseGenerator?, Dovetail.clockExit, clockBase,
      parseCarrier?_C]
  rw [decode?, hzero, parsePositive?, hchain]
  rfl

/-! ## Family-indexed exclusion and acceptance -/

/-- A pending completed Local known to carry the marked halt field. -/
structure PendingMarkedLocalShape
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) where
  pending : PendingCompletedLocalShape program tree term
  marked : pending.view.status = .marked

/--
Every named noncheckpoint form from the seven scheduler-family table.

The endpoint constructors are closed under an arbitrary `CompletedPrefix`.
Thus this relation remains applicable after earlier dovetail stages have left
completed shells around the currently active job.
-/
inductive Noncheckpoint
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) :
    Family → Term → Prop where
  | clockStaging
      {term endpoint : Term} {layers : Nat}
      (outer : CompletedPrefix program tree term endpoint layers)
      (endpointShape : StagingShape program tree endpoint) :
      Noncheckpoint program tree .clock term
  | clockRawTerminal
      {term : Term} (shape : RawTerminalShape program tree term) :
      Noncheckpoint program tree .clock term
  | fuelSource
      {term endpoint : Term} {layers : Nat}
      (outer : CompletedPrefix program tree term endpoint layers)
      (endpointShape : FuelShape program tree endpoint) :
      Noncheckpoint program tree .fuel term
  | fuelPending
      {term endpoint : Term} {layers : Nat}
      (outer : CompletedPrefix program tree term endpoint layers)
      (endpointShape : PendingShape endpoint) :
      Noncheckpoint program tree .fuel term
  | fuelBase
      {term endpoint : Term} {layers : Nat}
      (outer : CompletedPrefix program tree term endpoint layers)
      (endpointShape : BaseShape program tree endpoint) :
      Noncheckpoint program tree .fuel term
  | downActive
      {term endpoint : Term} {layers : Nat}
      (outer : CompletedPrefix program tree term endpoint layers)
      (endpointShape : ActiveCarrierShape program tree endpoint) :
      Noncheckpoint program tree .down term
  | upActive
      {term endpoint : Term} {layers : Nat}
      (outer : CompletedPrefix program tree term endpoint layers)
      (endpointShape : ActiveCarrierShape program tree endpoint) :
      Noncheckpoint program tree .up term
  | upPending
      {term endpoint : Term} {layers : Nat}
      (outer : CompletedPrefix program tree term endpoint layers)
      (endpointShape : PendingShape endpoint) :
      Noncheckpoint program tree .up term
  | framePending
      {term endpoint : Term} {layers : Nat}
      (outer : CompletedPrefix program tree term endpoint layers)
      (endpointShape : PreFrameShape program tree endpoint) :
      Noncheckpoint program tree .frameDispatch term
  | dispatchIncomplete
      {term endpoint : Term} {layers : Nat}
      (outer : CompletedPrefix program tree term endpoint layers)
      (endpointShape : PreDispatchShape program tree endpoint) :
      Noncheckpoint program tree .frameDispatch term
  | actionIncomplete
      {term endpoint : Term} {layers : Nat}
      (outer : CompletedPrefix program tree term endpoint layers)
      (endpointShape : PreActionShape program tree endpoint) :
      Noncheckpoint program tree .frameDispatch term
  | returnPending
      {term endpoint : Term} {layers : Nat}
      (outer : CompletedPrefix program tree term endpoint layers)
      (endpointShape : PendingCompletedLocalShape program tree endpoint) :
      Noncheckpoint program tree .return term
  | returnPreMarker
      {term : Term} (shape : PreMarkerEmptyShape program tree term) :
      Noncheckpoint program tree .return term
  | framePreMarker
      {term : Term} (shape : PreMarkerEmptyShape program tree term) :
      Noncheckpoint program tree .frameDispatch term
  | emptyPreMarker
      {term : Term} (shape : PreMarkerEmptyShape program tree term) :
      Noncheckpoint program tree .empty term
  | returnWrapper
      {term endpoint : Term} {layers : Nat}
      (outer : CompletedPrefix program tree term endpoint layers)
      (endpointShape : WrapperShape endpoint) :
      Noncheckpoint program tree .return term
  | emptyPending
      {term endpoint : Term} {layers : Nat}
      (outer : CompletedPrefix program tree term endpoint layers)
      (endpointShape : PendingMarkedLocalShape program tree endpoint) :
      Noncheckpoint program tree .empty term
  | emptyWrapper
      {term endpoint : Term} {layers : Nat}
      (outer : CompletedPrefix program tree term endpoint layers)
      (endpointShape : WrapperShape endpoint) :
      Noncheckpoint program tree .empty term

namespace Noncheckpoint

/-- Every listed noncheckpoint scheduler shape is rejected by the decoder. -/
theorem decode?_none
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {family : Family} {term : Term}
    (shape : Noncheckpoint program tree family term) :
    CheckpointDecoder.decode? program tree term = none := by
  cases shape with
  | clockStaging outer endpointShape =>
      exact outer.decode?_none endpointShape.failure
  | clockRawTerminal shape => exact shape.decode?_none
  | fuelSource outer endpointShape =>
      exact outer.decode?_none endpointShape.failure
  | fuelPending outer endpointShape =>
      exact outer.decode?_none (endpointShape.failure program tree)
  | fuelBase outer endpointShape =>
      exact outer.decode?_none endpointShape.failure
  | downActive outer endpointShape =>
      exact outer.decode?_none endpointShape.failure
  | upActive outer endpointShape =>
      exact outer.decode?_none endpointShape.failure
  | upPending outer endpointShape =>
      exact outer.decode?_none (endpointShape.failure program tree)
  | framePending outer endpointShape =>
      exact outer.decode?_none endpointShape.failure
  | dispatchIncomplete outer endpointShape =>
      exact outer.decode?_none endpointShape.failure
  | actionIncomplete outer endpointShape =>
      exact outer.decode?_none endpointShape.failure
  | returnPending outer endpointShape =>
      exact outer.decode?_none endpointShape.failure
  | returnPreMarker shape => exact shape.decode?_none
  | framePreMarker shape => exact shape.decode?_none
  | emptyPreMarker shape => exact shape.decode?_none
  | returnWrapper outer endpointShape =>
      exact outer.decode?_none (endpointShape.failure program tree)
  | emptyPending outer endpointShape =>
      exact outer.decode?_none endpointShape.pending.failure
  | emptyWrapper outer endpointShape =>
      exact outer.decode?_none (endpointShape.failure program tree)

end Noncheckpoint

/--
All term shapes exposed by the scheduler-family checkpoint interface.
Only three constructors are accepting: the exact generator, a fresh terminal
response, and a marked terminal response.
-/
inductive FamilyShape
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) :
    Family → Term → Prop where
  | rejected
      {family : Family} {term : Term}
      (shape : Noncheckpoint program tree family term) :
      FamilyShape program tree family term
  | timeZero
      (bits : List Bool) :
      FamilyShape program tree .clock
        (generator (compileActions program tree) bits)
  | frameTerminal
      {term : Term} {result : PositiveView program}
      (shape : TerminalCheckpointShape program tree .fresh result term) :
      FamilyShape program tree .frameDispatch term
  | returnTerminal
      {term : Term} {result : PositiveView program}
      (shape : TerminalCheckpointShape program tree .fresh result term) :
      FamilyShape program tree .return term
  | returnMarkedTerminal
      {term : Term} {result : PositiveView program}
      (shape : TerminalCheckpointShape program tree .marked result term) :
      FamilyShape program tree .return term
  | emptyTerminal
      {term : Term} {result : PositiveView program}
      (shape : TerminalCheckpointShape program tree .marked result term) :
      FamilyShape program tree .empty term

/-- The accepting subrelation of `FamilyShape`. -/
inductive Accepted
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) :
    Family → Term → Result program → Prop where
  | timeZero (bits : List Bool) :
      Accepted program tree .clock
        (generator (compileActions program tree) bits) (.zero bits)
  | frameReturned
      {term : Term} {result : PositiveView program}
      (shape : TerminalCheckpointShape program tree .fresh result term) :
      Accepted program tree .frameDispatch term (.positive result)
  | returned
      {term : Term} {result : PositiveView program}
      (shape : TerminalCheckpointShape program tree .fresh result term) :
      Accepted program tree .return term (.positive result)
  | returnedMarked
      {term : Term} {result : PositiveView program}
      (shape : TerminalCheckpointShape program tree .marked result term) :
      Accepted program tree .return term (.positive result)
  | emptied
      {term : Term} {result : PositiveView program}
      (shape : TerminalCheckpointShape program tree .marked result term) :
      Accepted program tree .empty term (.positive result)

namespace Accepted

theorem decode?
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {family : Family} {term : Term} {result : Result program}
    (accepted : Accepted program tree family term result) :
    CheckpointDecoder.decode? program tree term = some result := by
  cases accepted with
  | timeZero bits => exact decode?_generator program tree bits
  | frameReturned shape => exact shape.decode?
  | returned shape => exact shape.decode?
  | returnedMarked shape => exact shape.decode?
  | emptied shape => exact shape.decode?

end Accepted

/-- A fresh completed response whose decoded queue is empty remains rejected
until the registered marker contraction, even though its runtime family is
`RETURN`. -/
theorem returnPreMarker_notAccepted
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term}
    (shape : PreMarkerEmptyShape program tree term)
    (result : Result program) :
    ¬ Accepted program tree .return term result := by
  intro accepted
  have decoded := accepted.decode?
  rw [shape.decode?_none] at decoded
  contradiction

namespace FamilyShape

/--
Exact family-local acceptance theorem.  It is an iff, so a controller
projection can use it directly after supplying the current `FamilyShape`.
-/
theorem acceptsOnly
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {family : Family} {term : Term}
    (shape : FamilyShape program tree family term)
    (result : Result program) :
    CheckpointDecoder.decode? program tree term = some result ↔
      Accepted program tree family term result := by
  constructor
  · intro hdecode
    cases shape with
    | rejected rejected =>
        rw [rejected.decode?_none] at hdecode
        contradiction
    | timeZero bits =>
        have same : (some (.zero bits) : Option (Result program)) =
            some result :=
          (decode?_generator program tree bits).symm.trans hdecode
        have resultEq : Result.zero bits = result := Option.some.inj same
        subst result
        exact .timeZero bits
    | frameTerminal terminal =>
        have same := terminal.decode?.symm.trans hdecode
        have resultEq := Option.some.inj same
        cases resultEq
        exact .frameReturned terminal
    | returnTerminal terminal =>
        have same := terminal.decode?.symm.trans hdecode
        have resultEq := Option.some.inj same
        cases resultEq
        exact .returned terminal
    | returnMarkedTerminal terminal =>
        have same := terminal.decode?.symm.trans hdecode
        have resultEq := Option.some.inj same
        cases resultEq
        exact .returnedMarked terminal
    | emptyTerminal terminal =>
        have same := terminal.decode?.symm.trans hdecode
        have resultEq := Option.some.inj same
        cases resultEq
        exact .emptied terminal
  · exact Accepted.decode?

end FamilyShape

/-! ## Family-independent public interface and uniqueness -/

/-- Forget the controller family while retaining the exact accepting syntax. -/
inductive AcceptedCheckpoint
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program)) :
    Term → Result program → Prop where
  | timeZero (bits : List Bool) :
      AcceptedCheckpoint program tree
        (generator (compileActions program tree) bits) (.zero bits)
  | positive
      {term : Term} {result : PositiveView program} (status : HaltStatus)
      (shape : TerminalCheckpointShape program tree status result term) :
      AcceptedCheckpoint program tree term (.positive result)

namespace AcceptedCheckpoint

theorem decode?
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {result : Result program}
    (accepted : AcceptedCheckpoint program tree term result) :
    CheckpointDecoder.decode? program tree term = some result := by
  cases accepted with
  | timeZero bits => exact decode?_generator program tree bits
  | positive status shape => exact shape.decode?

/-- Time-zero and positive terminal witnesses determine a unique result. -/
theorem deterministic
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {first second : Result program}
    (hfirst : AcceptedCheckpoint program tree term first)
    (hsecond : AcceptedCheckpoint program tree term second) :
    first = second := by
  have same : (some first : Option (Result program)) = some second :=
    hfirst.decode?.symm.trans hsecond.decode?
  exact Option.some.inj same

/-- Two halt-consistent positive terminal witnesses have the same view. -/
theorem positive_unique
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {first second : PositiveView program}
    {firstStatus secondStatus : HaltStatus}
    (hfirst : TerminalCheckpointShape program tree firstStatus first term)
    (hsecond : TerminalCheckpointShape program tree secondStatus second term) :
    first = second := by
  have same :
      (some (.positive first) : Option (Result program)) =
        some (.positive second) := hfirst.decode?.symm.trans hsecond.decode?
  have resultEq : Result.positive first = Result.positive second :=
    Option.some.inj same
  cases resultEq
  rfl

end AcceptedCheckpoint

/-- Convert a family-specific acceptance witness to the public syntax. -/
theorem Accepted.toAcceptedCheckpoint
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {family : Family} {term : Term} {result : Result program}
    (accepted : Accepted program tree family term result) :
    AcceptedCheckpoint program tree term result := by
  cases accepted with
  | timeZero bits => exact .timeZero bits
  | frameReturned shape => exact .positive .fresh shape
  | returned shape => exact .positive .fresh shape
  | returnedMarked shape => exact .positive .marked shape
  | emptied shape => exact .positive .marked shape

/--
Standalone mode-family exclusion theorem.  A reachable-mode invariant
provides one `FamilyShape`; successful decoding is then equivalent
to the exact time-zero or halt-consistent completed-terminal syntax.
-/
theorem acceptsOnly
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {result : Result program}
    (covered : ∃ family, FamilyShape program tree family term) :
    CheckpointDecoder.decode? program tree term = some result ↔
      AcceptedCheckpoint program tree term result := by
  constructor
  · intro hdecode
    rcases covered with ⟨family, familyShape⟩
    exact (familyShape.acceptsOnly result).mp hdecode
      |>.toAcceptedCheckpoint
  · exact AcceptedCheckpoint.decode?

/-- A covered noncheckpoint contraction has no decoder result at all. -/
theorem rejectsNoncheckpoint
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {family : Family} {term : Term}
    (shape : Noncheckpoint program tree family term) :
    ∀ result, CheckpointDecoder.decode? program tree term ≠ some result := by
  intro result accepted
  rw [shape.decode?_none] at accepted
  contradiction

end CheckpointExclusion

end PureSFormal.PureS
