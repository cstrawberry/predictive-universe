import PureSFormal.PureS.ProbeCompiler
import PureSFormal.PureS.FiniteController
import PureSFormal.PureS.PrimitiveClock
import PureSFormal.PureS.PrimitiveFuel
import PureSFormal.PureS.ContextCursor
import PureSFormal.PureS.PrimitiveLocalResponse
import PureSFormal.PureS.ActionTree
import PureSFormal.PureS.PendingFrame

/-!
# The finite scheduler controller

This module compiles the seven scheduler families to the one-cursor machine
of `FiniteController`.  Runtime control contains only finite tags, CTS phase
and Boolean registers, positions in fixed scripts, nodes of the fixed
dispatcher, and PCs certified to occur in a fixed compiled probe.  In
particular, it contains no unbounded counter, route, script, term, address,
cursor stack, or audit history.

The operational controller is intentionally separated from its semantic
reachability invariant.  Invalid observations and failed primitive moves all
enter the single rejecting value `none`.  The final section records the exact
invariant interface still required to prove that configurations arising from
the encoder never take those rejecting branches.
-/

namespace PureSFormal.PureS

namespace SchedulerControl

open FiniteController

/-! ## Quotient-free finite-list proof helpers -/

theorem mem_append_left_clean {value : α} {left right : List α}
    (h : value ∈ left) : value ∈ left ++ right := by
  induction h with
  | head tail => exact List.Mem.head _
  | tail first h ih => exact List.Mem.tail _ ih

theorem mem_append_right_clean (left : List α) {value : α} {right : List α}
    (h : value ∈ right) : value ∈ left ++ right := by
  induction left with
  | nil => exact h
  | cons first rest ih => exact List.Mem.tail _ ih

theorem mem_map_clean (function : α → β) {value : α} {values : List α}
    (h : value ∈ values) : function value ∈ values.map function := by
  induction h with
  | head tail => exact List.Mem.head _
  | tail first h ih => exact List.Mem.tail _ ih

theorem mem_flatMap_clean (function : α → List β)
    {value : α} {values : List α} (hvalue : value ∈ values)
    {result : β} (hresult : result ∈ function value) :
    result ∈ values.flatMap function := by
  induction hvalue with
  | head tail => exact mem_append_left_clean hresult
  | tail first h ih => exact mem_append_right_clean (function first) ih

/-- Constructively attach membership proofs without using quotient-backed list lemmas. -/
def boundedAttach : (values : List α) → List { value : α // value ∈ values }
  | [] => []
  | first :: rest =>
      ⟨first, List.Mem.head rest⟩ ::
        (boundedAttach rest).map fun value =>
          ⟨value.val, List.Mem.tail first value.property⟩

theorem mem_boundedAttach : ∀ (values : List α)
    (value : { value : α // value ∈ values }),
    value ∈ boundedAttach values
  | [], value => nomatch value.property
  | first :: rest, ⟨value, membership⟩ => by
      cases membership with
      | head => exact List.Mem.head _
      | tail _ membership =>
          apply List.Mem.tail
          exact mem_map_clean
            (fun item : { item : α // item ∈ rest } =>
              (⟨item.val, List.Mem.tail first item.property⟩ :
                { item : α // item ∈ first :: rest }))
            (mem_boundedAttach rest ⟨value, membership⟩)

/-! ## Finite public registers and seven macro families -/

/-- The seven top-level families of Appendix A. -/
inductive Family where
  | clock
  | fuel
  | down
  | up
  | frameDispatch
  | return
  | empty
  deriving BEq, DecidableEq, Repr

/-- The complete finite register bank. -/
structure Registers (program : CTS.Program) where
  phase : CTS.Phase program
  bit : Option Bool
  seen : Bool
  tail : Bool
  empty : Bool
  deriving BEq, DecidableEq, Repr

/-- Initial phase and cleared transient registers. -/
def Registers.initial (program : CTS.Program) : Registers program :=
  ⟨CTS.zeroPhase program, none, false, false, false⟩

/-- Clear scan registers while retaining the current phase and empty mode. -/
def Registers.clearScan (registers : Registers program) : Registers program :=
  { registers with bit := none, seen := false, tail := false }

/-- Advance the fixed cyclic phase and clear all transient registers. -/
def Registers.advance (registers : Registers program) : Registers program :=
  ⟨CTS.nextPhase program registers.phase, none, false, false, false⟩

/-- Reset at a newly launched job. -/
def Registers.newJob (program : CTS.Program) : Registers program :=
  Registers.initial program

/-- The literal finite enumeration of the seven families. -/
def familyStates : List Family :=
  [.clock, .fuel, .down, .up, .frameDispatch, .return, .empty]

theorem mem_familyStates (family : Family) : family ∈ familyStates := by
  cases family <;> simp [familyStates]

/-- Finite Boolean values, used to materialize the register cover. -/
def boolStates : List Bool := [false, true]

/-- Finite optional-bit values, used to materialize the register cover. -/
def optionBitStates : List (Option Bool) := [none, some false, some true]

theorem mem_boolStates (value : Bool) : value ∈ boolStates := by
  cases value with
  | false => exact List.Mem.head _
  | true => exact List.Mem.tail _ (List.Mem.head _)

theorem mem_optionBitStates (value : Option Bool) :
    value ∈ optionBitStates := by
  cases value with
  | none => exact List.Mem.head _
  | some value =>
      cases value with
      | false => exact List.Mem.tail _ (List.Mem.head _)
      | true => exact List.Mem.tail _ (List.Mem.tail _ (List.Mem.head _))

/-- Constructive finite cover of the complete register bank. -/
def registerStates (program : CTS.Program) : List (Registers program) :=
  (List.finRange program.period).flatMap fun phase =>
    optionBitStates.flatMap fun bit =>
      boolStates.flatMap fun seen =>
        boolStates.flatMap fun tail =>
          boolStates.map fun empty =>
            ⟨phase, bit, seen, tail, empty⟩

theorem mem_registerStates (registers : Registers program) :
    registers ∈ registerStates program := by
  rcases registers with ⟨phase, bit, seen, tail, empty⟩
  exact mem_flatMap_clean _ (phase_mem_finRange phase)
    (mem_flatMap_clean _ (mem_optionBitStates bit)
      (mem_flatMap_clean _ (mem_boolStates seen)
        (mem_flatMap_clean _ (mem_boolStates tail)
          (mem_map_clean _ (mem_boolStates empty)))))

/-! ## Fixed dispatcher nodes -/

/-- Every subtree of a fixed dispatcher, including its root. -/
def treeNodes : Dispatcher.Tree Label → List (Dispatcher.Tree Label)
  | tree@(.leaf _) => [tree]
  | tree@(.node left right) =>
      tree :: (treeNodes left ++ treeNodes right)

@[simp]
theorem self_mem_treeNodes (tree : Dispatcher.Tree Label) :
    tree ∈ treeNodes tree := by
  cases tree <;> simp [treeNodes]

theorem treeNodes_closed
    {root node child : Dispatcher.Tree Label}
    (hnode : node ∈ treeNodes root)
    (hchild : child ∈ treeNodes node) :
    child ∈ treeNodes root := by
  induction root generalizing node child with
  | leaf label =>
      simp only [treeNodes, List.mem_singleton] at hnode
      subst node
      exact hchild
  | node left right leftIH rightIH =>
      simp only [treeNodes, List.mem_cons, List.mem_append] at hnode ⊢
      rcases hnode with rfl | hleft | hright
      · simpa [treeNodes] using hchild
      · exact Or.inr (Or.inl (leftIH hleft hchild))
      · exact Or.inr (Or.inr (rightIH hright hchild))

/-- A runtime dispatcher-node identifier certified to belong to fixed code. -/
abbrev CodeNode (dispatcher : ActionDispatcher program) :=
  { node : Dispatcher.Tree (ActionLabel program) //
    node ∈ treeNodes dispatcher.tree }

/-- Materialized finite cover of fixed dispatcher-node identifiers. -/
def codeNodeStates (dispatcher : ActionDispatcher program) :
    List (CodeNode dispatcher) :=
  boundedAttach (treeNodes dispatcher.tree)

theorem mem_codeNodeStates (node : CodeNode dispatcher) :
    node ∈ codeNodeStates dispatcher := by
  exact mem_boundedAttach _ node

/-- Distinguished root identifier of the fixed dispatcher. -/
def rootCodeNode (dispatcher : ActionDispatcher program) :
    CodeNode dispatcher :=
  ⟨dispatcher.tree, self_mem_treeNodes dispatcher.tree⟩

/-- A child identifier remains in the finite fixed-code cover. -/
def childCodeNode {program : CTS.Program}
    {dispatcher : ActionDispatcher program} (node : CodeNode dispatcher)
    {child : Dispatcher.Tree (ActionLabel program)}
    (hchild : child ∈ treeNodes node.val) : CodeNode dispatcher :=
  ⟨child, treeNodes_closed node.property hchild⟩

/-! ## Fixed script compilation -/

/-- Finite script names.  Label payloads range over the fixed finite action alphabet. -/
inductive ScriptJob (program : CTS.Program) where
  | clockEnter
  | clockPositive
  | clockZero
  | fuelPositive
  | fuelZero
  | downLive
  | downTombstone
  | downLocal
  | downBase
  | accumulator (label : ActionLabel program)
  | normalResponse (label : ActionLabel program)
  | emptyResponse (label : ActionLabel program)
  | markNormal
  | markEmpty
  | continuation
  deriving BEq, DecidableEq, Repr

/-- Compile a fixed address to primitive cursor moves. -/
def directionPrimitive : Direction → Primitive
  | .left => .L
  | .right => .R

def addressScript (address : Address) : Script :=
  address.map directionPrimitive

/-- Enter the accumulator below a completed fixed-label action spine. -/
def accumulatorScript (program : CTS.Program)
    (label : ActionLabel program) : Script :=
  List.replicate (PrimitiveLocalResponse.emitted program label).length .L ++ [.R]

/-- Literal primitive program denoted by a finite script job. -/
def jobScript (program : CTS.Program)
    (dispatcher : ActionDispatcher program) : ScriptJob program → Script
  | .clockEnter => [.L]
  | .clockPositive => [.Rdx, .R]
  | .clockZero => [.Rdx]
  | .fuelPositive => PrimitiveScripts.fuelPositive
  | .fuelZero => PrimitiveScripts.fuelZero
  | .downLive => [.R]
  | .downTombstone => [.L, .R]
  | .downLocal => [.L, .L, .R]
  | .downBase => addressScript BasePath.wordAddress
  | .accumulator label => accumulatorScript program label
  | .normalResponse label =>
      PrimitiveLocalResponse.execute program (dispatcher.route label) label
  | .emptyResponse label =>
      PrimitiveLocalResponse.execute program (dispatcher.route label) label
  | .markNormal => PrimitiveScripts.mark
  | .markEmpty => PrimitiveScripts.mark
  | .continuation => [.R, .L]

/-- Every fixed script name, with no route or script stored in the name. -/
def scriptJobStates (program : CTS.Program) : List (ScriptJob program) :=
  [.clockEnter, .clockPositive, .clockZero, .fuelPositive, .fuelZero,
    .downLive, .downTombstone, .downLocal, .downBase, .markNormal,
    .markEmpty, .continuation] ++
  (allActionLabels program).flatMap fun label =>
    [.accumulator label, .normalResponse label, .emptyResponse label]

theorem mem_scriptJobStates (job : ScriptJob program) :
    job ∈ scriptJobStates program := by
  cases job with
  | clockEnter =>
      apply mem_append_left_clean
      apply List.mem_of_getElem (i := 0) (h := by
        change 0 < 12
        decide)
      rfl
  | clockPositive =>
      apply mem_append_left_clean
      apply List.mem_of_getElem (i := 1) (h := by
        change 1 < 12
        decide)
      rfl
  | clockZero =>
      apply mem_append_left_clean
      apply List.mem_of_getElem (i := 2) (h := by
        change 2 < 12
        decide)
      rfl
  | fuelPositive =>
      apply mem_append_left_clean
      apply List.mem_of_getElem (i := 3) (h := by
        change 3 < 12
        decide)
      rfl
  | fuelZero =>
      apply mem_append_left_clean
      apply List.mem_of_getElem (i := 4) (h := by
        change 4 < 12
        decide)
      rfl
  | downLive =>
      apply mem_append_left_clean
      apply List.mem_of_getElem (i := 5) (h := by
        change 5 < 12
        decide)
      rfl
  | downTombstone =>
      apply mem_append_left_clean
      apply List.mem_of_getElem (i := 6) (h := by
        change 6 < 12
        decide)
      rfl
  | downLocal =>
      apply mem_append_left_clean
      apply List.mem_of_getElem (i := 7) (h := by
        change 7 < 12
        decide)
      rfl
  | downBase =>
      apply mem_append_left_clean
      apply List.mem_of_getElem (i := 8) (h := by
        change 8 < 12
        decide)
      rfl
  | markNormal =>
      apply mem_append_left_clean
      apply List.mem_of_getElem (i := 9) (h := by
        change 9 < 12
        decide)
      rfl
  | markEmpty =>
      apply mem_append_left_clean
      apply List.mem_of_getElem (i := 10) (h := by
        change 10 < 12
        decide)
      rfl
  | continuation =>
      apply mem_append_left_clean
      apply List.mem_of_getElem (i := 11) (h := by
        change 11 < 12
        decide)
      rfl
  | accumulator label =>
      unfold scriptJobStates
      apply mem_append_right_clean
      apply mem_flatMap_clean _ (mem_allActionLabels program label)
      exact List.Mem.head _
  | normalResponse label =>
      unfold scriptJobStates
      apply mem_append_right_clean
      apply mem_flatMap_clean _ (mem_allActionLabels program label)
      exact List.Mem.tail _ (List.Mem.head _)
  | emptyResponse label =>
      unfold scriptJobStates
      apply mem_append_right_clean
      apply mem_flatMap_clean _ (mem_allActionLabels program label)
      exact List.Mem.tail _ (List.Mem.tail _ (List.Mem.head _))

/-- A bounded PC in a fixed script; the final PC performs an epsilon mode change. -/
abbrev ScriptPC (program : CTS.Program)
    (dispatcher : ActionDispatcher program) (job : ScriptJob program) :=
  Fin ((jobScript program dispatcher job).length + 1)

/-- Initial PC of every compiled fixed script. -/
def firstScriptPC (program : CTS.Program)
    (dispatcher : ActionDispatcher program) (job : ScriptJob program) :
    ScriptPC program dispatcher job :=
  ⟨0, Nat.zero_lt_succ _⟩

/-- The primitive at a nonterminal bounded PC. -/
def scriptOperation (program : CTS.Program)
    (dispatcher : ActionDispatcher program) (job : ScriptJob program)
    (pc : ScriptPC program dispatcher job) : Option Primitive :=
  if h : pc.val < (jobScript program dispatcher job).length then
    some ((jobScript program dispatcher job).get ⟨pc.val, h⟩)
  else
    none

/-- The next bounded PC after a successful nonterminal script row. -/
def nextScriptPC (program : CTS.Program)
    (dispatcher : ActionDispatcher program) (job : ScriptJob program)
    (pc : ScriptPC program dispatcher job)
    (h : pc.val < (jobScript program dispatcher job).length) :
    ScriptPC program dispatcher job :=
  ⟨pc.val + 1, Nat.succ_lt_succ h⟩

/-- Explicit finite PC enumeration for a fixed script. -/
def scriptPCStates (program : CTS.Program)
    (dispatcher : ActionDispatcher program) (job : ScriptJob program) :
    List (ScriptPC program dispatcher job) :=
  List.finRange ((jobScript program dispatcher job).length + 1)

theorem mem_scriptPCStates
    (pc : ScriptPC program dispatcher job) :
    pc ∈ scriptPCStates program dispatcher job := by
  exact phase_mem_finRange pc

/-! ## Fixed structural guard probes -/

/-- Turn a fixed closed term into its exact finite pattern. -/
def exactPattern : Term → Pattern
  | .s => .s
  | .app fn arg => .app (exactPattern fn) (exactPattern arg)

/-- Exact `S`-head arity with independent argument holes. -/
def headArityPattern : Nat → Pattern
  | 0 => .s
  | arity + 1 => .app (headArityPattern arity) .hole

/-- Fixed successor carrier call `C_(n+1) X`, with `n` and `X` opaque. -/
def successorCallPattern : Pattern :=
  .app (.app (exactPattern b) .hole) .hole

/-- Fixed zero carrier call `C_0 X`. -/
def zeroCallPattern : Pattern :=
  .app (exactPattern (C 0)) .hole

/-- Fixed positive fuel call `C_(n+1) E B`. -/
def successorFuelPattern : Pattern :=
  .app (.app (.app (exactPattern b) .hole) .hole) .hole

/-- Fixed zero fuel call `C_0 E B`. -/
def zeroFuelPattern : Pattern :=
  .app (.app (exactPattern (C 0)) .hole) .hole

/-- Registered live-cell shape for a fixed bit. -/
def livePattern (bit : Bool) : Pattern :=
  .app (exactPattern (live bit)) .hole

/-- Registered tombstone shape for a fixed bit. -/
def tombstonePattern (bit : Bool) : Pattern :=
  .app (.app .s .hole) (.app (exactPattern (valueTag bit)) .hole)

/-- Public Local boundary: its `LR` seed call has exact head arity two. -/
def localPattern : Pattern :=
  .app (.app (.app .hole .hole) (headArityPattern 2)) .hole

/-- Public Base boundary: its direct `LR` alpha field has exact arity three. -/
def basePattern : Pattern :=
  .app (.app .hole (headArityPattern 3)) .hole

/-- Activated left route child: selected/dormant arities `(2,3)`. -/
def selectedLeftPattern : Pattern :=
  .app (headArityPattern 2) (headArityPattern 3)

/-- Activated right route child: dormant/selected arities `(3,2)`. -/
def selectedRightPattern : Pattern :=
  .app (headArityPattern 3) (headArityPattern 2)

/--
The bounded public filter used after the two live-cell tests during ascent.
Reachability supplies the stronger fact that such an application is one of
the registered Local/Route/action/tombstone/Base parents; that semantic fact
is deliberately not encoded as an unbounded runtime tag.
-/
def registeredAncestorPattern : Pattern := .app .hole .hole

/-- Whether a probe starts at the current occurrence or at a tested parent. -/
inductive ProbeSite where
  | local
  | parent (side : Direction)
  deriving BEq, DecidableEq, Repr

/-- The three call sites of the origin-restoring pending-parent probe. -/
inductive PendingUse where
  | scan
  | normalReturn
  | emptyReturn
  deriving BEq, DecidableEq, Repr

/-- The two continuation tables sharing the arity-three/four probes. -/
inductive ArityUse where
  | growth
  | continuation (empty : Bool)
  deriving BEq, DecidableEq, Repr

/-- Every bounded guard used by the seven macro families. -/
inductive ProbeKind (program : CTS.Program)
    (dispatcher : ActionDispatcher program) where
  | clockSuccessor
  | clockZero
  | fuelSuccessor
  | fuelZero
  | downLiveZero
  | downLiveOne
  | downTombstoneZero
  | downTombstoneOne
  | downLocal
  | downBase
  | routeLeft (node : CodeNode dispatcher)
  | routeRight (node : CodeNode dispatcher)
  | pending (use : PendingUse)
  | growWrapper
  | growEnvelope
  | upLiveZero (side : Direction)
  | upLiveOne (side : Direction)
  | upRegistered (side : Direction)
  | arityThree (use : ArityUse)
  | arityFour (use : ArityUse)
  deriving DecidableEq

/-- The fixed pattern belonging to a guard tag. -/
def probePattern (program : CTS.Program)
    (dispatcher : ActionDispatcher program) :
    ProbeKind program dispatcher → Pattern
  | .clockSuccessor => successorCallPattern
  | .clockZero => zeroCallPattern
  | .fuelSuccessor => successorFuelPattern
  | .fuelZero => zeroFuelPattern
  | .downLiveZero => livePattern false
  | .downLiveOne => livePattern true
  | .downTombstoneZero => tombstonePattern false
  | .downTombstoneOne => tombstonePattern true
  | .downLocal => localPattern
  | .downBase => basePattern
  | .routeLeft _ => selectedLeftPattern
  | .routeRight _ => selectedRightPattern
  | .pending _ => PendingFrame.pendingPattern
  | .growWrapper => headArityPattern 2
  | .growEnvelope => .app .hole PendingFrame.envelopePattern
  | .upLiveZero _ => livePattern false
  | .upLiveOne _ => livePattern true
  | .upRegistered _ => registeredAncestorPattern
  | .arityThree _ => headArityPattern 3
  | .arityFour _ => headArityPattern 4

/-- The cursor site at which a guard is compiled. -/
def probeSite (kind : ProbeKind program dispatcher) : ProbeSite :=
  match kind with
  | .pending _ => .parent .right
  | .growWrapper => .parent .right
  | .growEnvelope => .parent .left
  | _ => .local

/-- Closed probe-control syntax generated by `ProbeCompiler`. -/
def probeControl (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (kind : ProbeKind program dispatcher) : ProbeCompiler.Control :=
  match probeSite kind with
  | .local => ProbeCompiler.patternControl (probePattern program dispatcher kind)
  | .parent side =>
      ProbeCompiler.parentControl side (probePattern program dispatcher kind)

/-- A runtime probe PC certified to occur in one fixed compiled probe. -/
abbrev ProbePC (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (kind : ProbeKind program dispatcher) :=
  { pc : ProbeCompiler.Control //
    pc ∈ (probeControl program dispatcher kind).nodes }

/-- Materialized finite cover of the PCs of one fixed probe. -/
def probePCStates (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (kind : ProbeKind program dispatcher) :
    List (ProbePC program dispatcher kind) :=
  boundedAttach (probeControl program dispatcher kind).nodes

theorem mem_probePCStates
    (pc : ProbePC program dispatcher kind) :
    pc ∈ probePCStates program dispatcher kind := by
  exact mem_boundedAttach _ pc

/-- Root PC of one fixed compiled probe. -/
def firstProbePC (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (kind : ProbeKind program dispatcher) :
    ProbePC program dispatcher kind :=
  ⟨probeControl program dispatcher kind,
    ProbeCompiler.Control.self_mem_nodes _⟩

theorem probeNodes_closed
    {root node child : ProbeCompiler.Control}
    (hnode : node ∈ root.nodes) (hchild : child ∈ node.nodes) :
    child ∈ root.nodes := by
  induction root generalizing node child with
  | answer accepted =>
      simp only [ProbeCompiler.Control.nodes, List.mem_singleton] at hnode
      subst node
      exact hchild
  | observeNode onS onApp ihS ihApp =>
      simp only [ProbeCompiler.Control.nodes, List.mem_cons,
        List.mem_append] at hnode ⊢
      rcases hnode with rfl | hS | hApp
      · simpa [ProbeCompiler.Control.nodes] using hchild
      · exact Or.inr (Or.inl (ihS hS hchild))
      · exact Or.inr (Or.inr (ihApp hApp hchild))
  | observeIncoming onRoot onLeft onRight ihRoot ihLeft ihRight =>
      simp only [ProbeCompiler.Control.nodes, List.mem_cons] at hnode ⊢
      rcases hnode with hself | hrest
      · subst node
        simpa only [ProbeCompiler.Control.nodes, List.mem_cons] using hchild
      · apply Or.inr
        rcases List.mem_append.mp hrest with hRootLeft | hRight
        · rcases List.mem_append.mp hRootLeft with hRoot | hLeft
          · exact List.mem_append.mpr
              (Or.inl (List.mem_append.mpr (Or.inl (ihRoot hRoot hchild))))
          · exact List.mem_append.mpr
              (Or.inl (List.mem_append.mpr (Or.inr (ihLeft hLeft hchild))))
        · exact List.mem_append.mpr (Or.inr (ihRight hRight hchild))
  | move operation next ih =>
      simp only [ProbeCompiler.Control.nodes, List.mem_cons] at hnode ⊢
      rcases hnode with rfl | hnext
      · simpa [ProbeCompiler.Control.nodes] using hchild
      · exact Or.inr (ih hnext hchild)

/-- Lift a syntactic successor PC into the same fixed probe's finite cover. -/
def childProbePC
    (pc : ProbePC program dispatcher kind)
    {child : ProbeCompiler.Control} (hchild : child ∈ pc.val.nodes) :
    ProbePC program dispatcher kind :=
  ⟨child, probeNodes_closed pc.property hchild⟩

/-- Explicit finite enumeration of every guard tag. -/
def probeKindStates (program : CTS.Program)
    (dispatcher : ActionDispatcher program) :
    List (ProbeKind program dispatcher) :=
  [.clockSuccessor, .clockZero, .fuelSuccessor, .fuelZero,
    .downLiveZero, .downLiveOne, .downTombstoneZero,
    .downTombstoneOne, .downLocal, .downBase, .pending .scan,
    .pending .normalReturn, .pending .emptyReturn,
    .growWrapper, .growEnvelope, .upLiveZero .left,
    .upLiveZero .right, .upLiveOne .left, .upLiveOne .right,
    .upRegistered .left, .upRegistered .right,
    .arityThree .growth, .arityFour .growth,
    .arityThree (.continuation false), .arityFour (.continuation false),
    .arityThree (.continuation true), .arityFour (.continuation true)] ++
  (codeNodeStates dispatcher).flatMap fun node =>
    [.routeLeft node, .routeRight node]

theorem mem_probeKindStates (kind : ProbeKind program dispatcher) :
    kind ∈ probeKindStates program dispatcher := by
  cases kind with
  | clockSuccessor =>
      apply mem_append_left_clean
      apply List.mem_of_getElem (i := 0) (h := by
        change 0 < 27
        decide)
      rfl
  | clockZero =>
      apply mem_append_left_clean
      apply List.mem_of_getElem (i := 1) (h := by
        change 1 < 27
        decide)
      rfl
  | fuelSuccessor =>
      apply mem_append_left_clean
      apply List.mem_of_getElem (i := 2) (h := by
        change 2 < 27
        decide)
      rfl
  | fuelZero =>
      apply mem_append_left_clean
      apply List.mem_of_getElem (i := 3) (h := by
        change 3 < 27
        decide)
      rfl
  | downLiveZero =>
      apply mem_append_left_clean
      apply List.mem_of_getElem (i := 4) (h := by
        change 4 < 27
        decide)
      rfl
  | downLiveOne =>
      apply mem_append_left_clean
      apply List.mem_of_getElem (i := 5) (h := by
        change 5 < 27
        decide)
      rfl
  | downTombstoneZero =>
      apply mem_append_left_clean
      apply List.mem_of_getElem (i := 6) (h := by
        change 6 < 27
        decide)
      rfl
  | downTombstoneOne =>
      apply mem_append_left_clean
      apply List.mem_of_getElem (i := 7) (h := by
        change 7 < 27
        decide)
      rfl
  | downLocal =>
      apply mem_append_left_clean
      apply List.mem_of_getElem (i := 8) (h := by
        change 8 < 27
        decide)
      rfl
  | downBase =>
      apply mem_append_left_clean
      apply List.mem_of_getElem (i := 9) (h := by
        change 9 < 27
        decide)
      rfl
  | pending use =>
      cases use with
      | scan =>
          apply mem_append_left_clean
          apply List.mem_of_getElem (i := 10) (h := by
            change 10 < 27
            decide)
          rfl
      | normalReturn =>
          apply mem_append_left_clean
          apply List.mem_of_getElem (i := 11) (h := by
            change 11 < 27
            decide)
          rfl
      | emptyReturn =>
          apply mem_append_left_clean
          apply List.mem_of_getElem (i := 12) (h := by
            change 12 < 27
            decide)
          rfl
  | growWrapper =>
      apply mem_append_left_clean
      apply List.mem_of_getElem (i := 13) (h := by
        change 13 < 27
        decide)
      rfl
  | growEnvelope =>
      apply mem_append_left_clean
      apply List.mem_of_getElem (i := 14) (h := by
        change 14 < 27
        decide)
      rfl
  | upLiveZero side =>
      cases side with
      | left =>
          apply mem_append_left_clean
          apply List.mem_of_getElem (i := 15) (h := by
            change 15 < 27
            decide)
          rfl
      | right =>
          apply mem_append_left_clean
          apply List.mem_of_getElem (i := 16) (h := by
            change 16 < 27
            decide)
          rfl
  | upLiveOne side =>
      cases side with
      | left =>
          apply mem_append_left_clean
          apply List.mem_of_getElem (i := 17) (h := by
            change 17 < 27
            decide)
          rfl
      | right =>
          apply mem_append_left_clean
          apply List.mem_of_getElem (i := 18) (h := by
            change 18 < 27
            decide)
          rfl
  | upRegistered side =>
      cases side with
      | left =>
          apply mem_append_left_clean
          apply List.mem_of_getElem (i := 19) (h := by
            change 19 < 27
            decide)
          rfl
      | right =>
          apply mem_append_left_clean
          apply List.mem_of_getElem (i := 20) (h := by
            change 20 < 27
            decide)
          rfl
  | arityThree use =>
      cases use with
      | growth =>
          apply mem_append_left_clean
          apply List.mem_of_getElem (i := 21) (h := by
            change 21 < 27
            decide)
          rfl
      | continuation empty =>
          cases empty with
          | false =>
              apply mem_append_left_clean
              apply List.mem_of_getElem (i := 23) (h := by
                change 23 < 27
                decide)
              rfl
          | true =>
              apply mem_append_left_clean
              apply List.mem_of_getElem (i := 25) (h := by
                change 25 < 27
                decide)
              rfl
  | arityFour use =>
      cases use with
      | growth =>
          apply mem_append_left_clean
          apply List.mem_of_getElem (i := 22) (h := by
            change 22 < 27
            decide)
          rfl
      | continuation empty =>
          cases empty with
          | false =>
              apply mem_append_left_clean
              apply List.mem_of_getElem (i := 24) (h := by
                change 24 < 27
                decide)
              rfl
          | true =>
              apply mem_append_left_clean
              apply List.mem_of_getElem (i := 26) (h := by
                change 26 < 27
                decide)
              rfl
  | routeLeft node =>
      unfold probeKindStates
      apply mem_append_right_clean
      apply mem_flatMap_clean _ (mem_codeNodeStates node)
      exact List.Mem.head _
  | routeRight node =>
      unfold probeKindStates
      apply mem_append_right_clean
      apply mem_flatMap_clean _ (mem_codeNodeStates node)
      exact List.Mem.tail _ (List.Mem.head _)

/-! ## Seven-family control graph -/

/-- Finite subordinate modes.  Every constructor belongs to one top family. -/
inductive Macro (program : CTS.Program)
    (dispatcher : ActionDispatcher program) where
  | family (family : Family)
  | clockGrow
  | growUp
  | growMoveUp
  | growMoveEndpoint
  | growEndpoint
  | downOmega
  | routeDown (node : CodeNode dispatcher)
  | routeChoice (node : CodeNode dispatcher) (direction : Direction)
  | upMove
  | upAncestor (side : Direction)
  | upLiveFound (bit : Bool)
  | pendingDecision (use : PendingUse)
  | continuationCheck (empty : Bool)
  | arityDecision (use : ArityUse) (arityThree : Bool)
  deriving DecidableEq

/-- Top-level family containing a subordinate mode. -/
def Macro.familyOf : Macro program dispatcher → Family
  | Macro.family selected => selected
  | .clockGrow | .growUp | .growMoveUp | .growMoveEndpoint |
      .growEndpoint => .clock
  | .downOmega | .routeDown _ | .routeChoice _ _ => .down
  | .upMove | .upAncestor _ | .upLiveFound _ | .pendingDecision .scan => .up
  | .pendingDecision .normalReturn | .continuationCheck false |
      .arityDecision (.continuation false) _ => .return
  | .pendingDecision .emptyReturn | .continuationCheck true |
      .arityDecision (.continuation true) _ => .empty
  | .arityDecision .growth _ => .clock

/-- Explicit finite enumeration of every subordinate mode. -/
def macroStates (program : CTS.Program)
    (dispatcher : ActionDispatcher program) :
    List (Macro program dispatcher) :=
  [.family .clock, .family .fuel, .family .down, .family .up,
    .family .frameDispatch, .family .return, .family .empty,
    .clockGrow, .growUp, .growMoveUp, .growMoveEndpoint, .growEndpoint,
    .downOmega, .upMove, .upAncestor .left, .upAncestor .right,
    .upLiveFound false, .upLiveFound true,
    .pendingDecision .scan, .pendingDecision .normalReturn,
    .pendingDecision .emptyReturn,
    .continuationCheck false, .continuationCheck true,
    .arityDecision .growth false, .arityDecision .growth true,
    .arityDecision (.continuation false) false,
    .arityDecision (.continuation false) true,
    .arityDecision (.continuation true) false,
    .arityDecision (.continuation true) true] ++
  (codeNodeStates dispatcher).flatMap fun node =>
    [.routeDown node, .routeChoice node .left, .routeChoice node .right]

theorem mem_macroStates (mode : Macro program dispatcher) :
    mode ∈ macroStates program dispatcher := by
  cases mode with
  | family family =>
      cases family with
      | clock =>
          apply mem_append_left_clean
          apply List.mem_of_getElem (i := 0) (h := by
            change 0 < 29
            decide)
          rfl
      | fuel =>
          apply mem_append_left_clean
          apply List.mem_of_getElem (i := 1) (h := by
            change 1 < 29
            decide)
          rfl
      | down =>
          apply mem_append_left_clean
          apply List.mem_of_getElem (i := 2) (h := by
            change 2 < 29
            decide)
          rfl
      | up =>
          apply mem_append_left_clean
          apply List.mem_of_getElem (i := 3) (h := by
            change 3 < 29
            decide)
          rfl
      | frameDispatch =>
          apply mem_append_left_clean
          apply List.mem_of_getElem (i := 4) (h := by
            change 4 < 29
            decide)
          rfl
      | «return» =>
          apply mem_append_left_clean
          apply List.mem_of_getElem (i := 5) (h := by
            change 5 < 29
            decide)
          rfl
      | empty =>
          apply mem_append_left_clean
          apply List.mem_of_getElem (i := 6) (h := by
            change 6 < 29
            decide)
          rfl
  | clockGrow =>
      apply mem_append_left_clean
      apply List.mem_of_getElem (i := 7) (h := by
        change 7 < 29
        decide)
      rfl
  | growUp =>
      apply mem_append_left_clean
      apply List.mem_of_getElem (i := 8) (h := by
        change 8 < 29
        decide)
      rfl
  | growMoveUp =>
      apply mem_append_left_clean
      apply List.mem_of_getElem (i := 9) (h := by
        change 9 < 29
        decide)
      rfl
  | growMoveEndpoint =>
      apply mem_append_left_clean
      apply List.mem_of_getElem (i := 10) (h := by
        change 10 < 29
        decide)
      rfl
  | growEndpoint =>
      apply mem_append_left_clean
      apply List.mem_of_getElem (i := 11) (h := by
        change 11 < 29
        decide)
      rfl
  | downOmega =>
      apply mem_append_left_clean
      apply List.mem_of_getElem (i := 12) (h := by
        change 12 < 29
        decide)
      rfl
  | upMove =>
      apply mem_append_left_clean
      apply List.mem_of_getElem (i := 13) (h := by
        change 13 < 29
        decide)
      rfl
  | upAncestor side =>
      cases side with
      | left =>
          apply mem_append_left_clean
          apply List.mem_of_getElem (i := 14) (h := by
            change 14 < 29
            decide)
          rfl
      | right =>
          apply mem_append_left_clean
          apply List.mem_of_getElem (i := 15) (h := by
            change 15 < 29
            decide)
          rfl
  | upLiveFound bit =>
      cases bit with
      | false =>
          apply mem_append_left_clean
          apply List.mem_of_getElem (i := 16) (h := by
            change 16 < 29
            decide)
          rfl
      | true =>
          apply mem_append_left_clean
          apply List.mem_of_getElem (i := 17) (h := by
            change 17 < 29
            decide)
          rfl
  | pendingDecision use =>
      cases use with
      | scan =>
          apply mem_append_left_clean
          apply List.mem_of_getElem (i := 18) (h := by
            change 18 < 29
            decide)
          rfl
      | normalReturn =>
          apply mem_append_left_clean
          apply List.mem_of_getElem (i := 19) (h := by
            change 19 < 29
            decide)
          rfl
      | emptyReturn =>
          apply mem_append_left_clean
          apply List.mem_of_getElem (i := 20) (h := by
            change 20 < 29
            decide)
          rfl
  | continuationCheck empty =>
      cases empty with
      | false =>
          apply mem_append_left_clean
          apply List.mem_of_getElem (i := 21) (h := by
            change 21 < 29
            decide)
          rfl
      | true =>
          apply mem_append_left_clean
          apply List.mem_of_getElem (i := 22) (h := by
            change 22 < 29
            decide)
          rfl
  | arityDecision use arityThree =>
      cases use with
      | growth =>
          cases arityThree with
          | false =>
              apply mem_append_left_clean
              apply List.mem_of_getElem (i := 23) (h := by
                change 23 < 29
                decide)
              rfl
          | true =>
              apply mem_append_left_clean
              apply List.mem_of_getElem (i := 24) (h := by
                change 24 < 29
                decide)
              rfl
      | continuation empty =>
          cases empty with
          | false =>
              cases arityThree with
              | false =>
                  apply mem_append_left_clean
                  apply List.mem_of_getElem (i := 25) (h := by
                    change 25 < 29
                    decide)
                  rfl
              | true =>
                  apply mem_append_left_clean
                  apply List.mem_of_getElem (i := 26) (h := by
                    change 26 < 29
                    decide)
                  rfl
          | true =>
              cases arityThree with
              | false =>
                  apply mem_append_left_clean
                  apply List.mem_of_getElem (i := 27) (h := by
                    change 27 < 29
                    decide)
                  rfl
              | true =>
                  apply mem_append_left_clean
                  apply List.mem_of_getElem (i := 28) (h := by
                    change 28 < 29
                    decide)
                  rfl
  | routeDown node =>
      unfold macroStates
      apply mem_append_right_clean
      apply mem_flatMap_clean _ (mem_codeNodeStates node)
      exact List.Mem.head _
  | routeChoice node direction =>
      cases direction with
      | left =>
          unfold macroStates
          apply mem_append_right_clean
          apply mem_flatMap_clean _ (mem_codeNodeStates node)
          exact List.Mem.tail _ (List.Mem.head _)
      | right =>
          unfold macroStates
          apply mem_append_right_clean
          apply mem_flatMap_clean _ (mem_codeNodeStates node)
          exact List.Mem.tail _ (List.Mem.tail _ (List.Mem.head _))

/--
Actual scheduler control.  Script PCs are bounded by a fixed script length;
probe PCs and dispatcher nodes are explicitly finite subtypes.
-/
inductive Control (program : CTS.Program)
    (dispatcher : ActionDispatcher program) where
  | macro (mode : Macro program dispatcher) (registers : Registers program)
  | script (job : ScriptJob program)
      (pc : ScriptPC program dispatcher job) (registers : Registers program)
  | probe (kind : ProbeKind program dispatcher)
      (pc : ProbePC program dispatcher kind) (registers : Registers program)
  deriving DecidableEq

/-- The top-level family of every ordinary control value. -/
def Control.family : Control program dispatcher → Family
  | .macro mode _ => mode.familyOf
  | .script job _ _ =>
      match job with
      | .clockEnter | .clockPositive | .clockZero => .clock
      | .fuelPositive | .fuelZero => .fuel
      | .downLive | .downTombstone | .downLocal | .downBase |
          .accumulator _ => .down
      | .normalResponse _ => .frameDispatch
      | .emptyResponse _ | .markEmpty => .empty
      | .markNormal | .continuation => .return
  | .probe kind _ _ =>
      match kind with
      | .clockSuccessor | .clockZero | .growWrapper | .growEnvelope |
          .arityThree .growth | .arityFour .growth => .clock
      | .fuelSuccessor | .fuelZero => .fuel
      | .downLiveZero | .downLiveOne | .downTombstoneZero |
          .downTombstoneOne | .downLocal | .downBase |
          .routeLeft _ | .routeRight _ => .down
      | .pending .scan | .upLiveZero _ | .upLiveOne _ |
          .upRegistered _ => .up
      | .pending .normalReturn |
          .arityThree (.continuation false) |
          .arityFour (.continuation false) => .return
      | .pending .emptyReturn |
          .arityThree (.continuation true) |
          .arityFour (.continuation true) => .empty

/-- Start one fixed script at its zero PC. -/
def startScript (job : ScriptJob program) (registers : Registers program) :
    Control program dispatcher :=
  .script job (firstScriptPC program dispatcher job) registers

/-- Start one fixed compiled probe at its root PC. -/
def startProbe (kind : ProbeKind program dispatcher)
    (registers : Registers program) : Control program dispatcher :=
  .probe kind (firstProbePC program dispatcher kind) registers

/-- Left child of a fixed-code node, when the node is internal. -/
def codeLeft? : CodeNode dispatcher → Option (CodeNode dispatcher)
  | ⟨.node left right, hnode⟩ =>
      some ⟨left, treeNodes_closed hnode (by simp [treeNodes])⟩
  | ⟨.leaf _, _⟩ => none

/-- Right child of a fixed-code node, when the node is internal. -/
def codeRight? : CodeNode dispatcher → Option (CodeNode dispatcher)
  | ⟨.node left right, hnode⟩ =>
      some ⟨right, treeNodes_closed hnode (by simp [treeNodes])⟩
  | ⟨.leaf _, _⟩ => none

/-- Label stored by a fixed-code leaf. -/
def codeLabel? {program : CTS.Program}
    {dispatcher : ActionDispatcher program} :
    CodeNode dispatcher → Option (ActionLabel program)
  | ⟨.leaf label, _⟩ => some label
  | ⟨.node _ _, _⟩ => none

/-- Fixed appendant emptiness is a compile-time Boolean lookup. -/
def appendantEmpty (program : CTS.Program) (phase : CTS.Phase program) : Bool :=
  match program.appendant phase with
  | [] => true
  | _ :: _ => false

/-- Formula (14a), evaluated only after a scanned bit has been recorded. -/
def outputEmpty (program : CTS.Program) (registers : Registers program)
    (bit : Bool) : Bool :=
  !registers.tail && (!bit || appendantEmpty program registers.phase)

/-- Record the first live ancestor, or only the existence of a later one. -/
def Registers.observeLive (registers : Registers program) (bit : Bool) :
    Registers program :=
  if registers.seen then
    { registers with tail := true }
  else
    { registers with bit := some bit, seen := true }

/-- Advance a phase while retaining the absorbing-empty mode. -/
def Registers.advanceEmpty (registers : Registers program) : Registers program :=
  ⟨CTS.nextPhase program registers.phase, none, false, false, true⟩

/-- Control reached after the final epsilon row of a fixed script. -/
def afterScript (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (job : ScriptJob program) (registers : Registers program) :
    Control program dispatcher :=
  match job with
  | .clockEnter => .macro .clockGrow registers
  | .clockPositive => .macro .clockGrow registers
  | .clockZero => .macro .growUp registers
  | .fuelPositive => .macro (.family .fuel) registers
  | .fuelZero => .macro (.family .down) registers.clearScan
  | .downLive => .macro (.family .down) registers
  | .downTombstone => .macro (.family .down) registers
  | .downLocal => .macro (.routeDown (rootCodeNode dispatcher)) registers
  | .downBase => .macro (.family .down) registers
  | .accumulator _ => .macro (.family .down) registers
  | .normalResponse _ => .macro (.family .return) registers
  | .emptyResponse _ => startScript .markEmpty registers
  | .markNormal => startProbe (.pending .normalReturn) registers.advance
  | .markEmpty => startProbe (.pending .emptyReturn) registers.advanceEmpty
  | .continuation => .macro (.continuationCheck registers.empty) registers

/-- Branch selected by the terminal Boolean row of one compiled probe. -/
def probeAnswer (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (kind : ProbeKind program dispatcher) (accepted : Bool)
    (registers : Registers program) :
    FiniteController.Command (Control program dispatcher) :=
  match kind with
  | .clockSuccessor =>
      if accepted then .stay (startScript .clockPositive registers)
      else .stay (startProbe .clockZero registers)
  | .clockZero =>
      if accepted then .stay (startScript .clockZero registers) else .reject
  | .fuelSuccessor =>
      if accepted then .stay (startScript .fuelPositive registers)
      else .stay (startProbe .fuelZero registers)
  | .fuelZero =>
      if accepted then .stay (startScript .fuelZero registers) else .reject
  | .downLiveZero =>
      if accepted then .stay (startScript .downLive registers)
      else .stay (startProbe .downLiveOne registers)
  | .downLiveOne =>
      if accepted then .stay (startScript .downLive registers)
      else .stay (startProbe .downTombstoneZero registers)
  | .downTombstoneZero =>
      if accepted then .stay (startScript .downTombstone registers)
      else .stay (startProbe .downTombstoneOne registers)
  | .downTombstoneOne =>
      if accepted then .stay (startScript .downTombstone registers)
      else .stay (startProbe .downLocal registers)
  | .downLocal =>
      if accepted then .stay (startScript .downLocal registers)
      else .stay (startProbe .downBase registers)
  | .downBase =>
      if accepted then .stay (startScript .downBase registers)
      else .stay (.macro .downOmega registers)
  | .routeLeft node =>
      if accepted then .stay (.macro (.routeChoice node .left) registers)
      else .stay (startProbe (.routeRight node) registers)
  | .routeRight node =>
      if accepted then .stay (.macro (.routeChoice node .right) registers)
      else .reject
  | .pending use =>
      if accepted then .stay (.macro (.pendingDecision use) registers)
      else
        match use with
        | .scan => .stay (.macro .upMove registers)
        | .normalReturn => .stay (startScript .continuation registers)
        | .emptyReturn => .stay (startScript .continuation registers)
  | .growWrapper =>
      if accepted then .stay (.macro .growMoveUp registers)
      else .stay (startProbe .growEnvelope registers)
  | .growEnvelope =>
      if accepted then .stay (.macro .growMoveEndpoint registers) else .reject
  | .upLiveZero side =>
      if accepted then .stay (.macro (.upLiveFound false) registers)
      else .stay (startProbe (.upLiveOne side) registers)
  | .upLiveOne side =>
      if accepted then .stay (.macro (.upLiveFound true) registers)
      else .stay (startProbe (.upRegistered side) registers)
  | .upRegistered _ =>
      if accepted then .stay (.macro (.family .up) registers) else .reject
  | .arityThree use =>
      if accepted then .stay (.macro (.arityDecision use true) registers)
      else .stay (startProbe (.arityFour use) registers)
  | .arityFour use =>
      if accepted then .stay (.macro (.arityDecision use false) registers)
      else .reject

/-- One row of a fixed compiled probe, embedded in scheduler control. -/
def probeTransition (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (kind : ProbeKind program dispatcher)
    (pc : ProbePC program dispatcher kind) (registers : Registers program)
    (node : Probe.NodeKind) (incoming : Probe.Incoming) :
    FiniteController.Command (Control program dispatcher) :=
  match pc with
  | ⟨raw, hraw⟩ =>
      match raw with
      | .answer accepted =>
          probeAnswer program dispatcher kind accepted registers
      | .observeNode onS onApp =>
          match node with
          | .s => .stay (.probe kind
              ⟨onS, probeNodes_closed hraw (by
                simp [ProbeCompiler.Control.nodes])⟩ registers)
          | .app => .stay (.probe kind
              ⟨onApp, probeNodes_closed hraw (by
                simp [ProbeCompiler.Control.nodes])⟩ registers)
      | .observeIncoming onRoot onLeft onRight =>
          match incoming with
          | .root => .stay (.probe kind
              ⟨onRoot, probeNodes_closed hraw (by
                simp [ProbeCompiler.Control.nodes])⟩ registers)
          | .left => .stay (.probe kind
              ⟨onLeft, probeNodes_closed hraw (by
                simp [ProbeCompiler.Control.nodes])⟩ registers)
          | .right => .stay (.probe kind
              ⟨onRight, probeNodes_closed hraw (by
                simp [ProbeCompiler.Control.nodes])⟩ registers)
      | .move operation next =>
          .exec operation (.probe kind
            ⟨next, probeNodes_closed hraw (by
              simp [ProbeCompiler.Control.nodes])⟩ registers)

/-- One deterministic operational row of the seven-family scheduler. -/
def transition (program : CTS.Program)
    (dispatcher : ActionDispatcher program) :
    Control program dispatcher → Probe.NodeKind → Probe.Incoming →
      FiniteController.Command (Control program dispatcher)
  | .script job pc registers, _, _ =>
      if h : pc.val < (jobScript program dispatcher job).length then
        .exec ((jobScript program dispatcher job).get ⟨pc.val, h⟩)
          (.script job (nextScriptPC program dispatcher job pc h) registers)
      else
        .stay (afterScript program dispatcher job registers)
  | .probe kind pc registers, node, incoming =>
      probeTransition program dispatcher kind pc registers node incoming
  | .macro (.family .clock) registers, _, _ =>
      .stay (startScript .clockEnter registers)
  | .macro .clockGrow registers, _, _ =>
      .stay (startProbe .clockSuccessor registers)
  | .macro .growUp registers, _, _ =>
      .stay (startProbe .growWrapper registers)
  | .macro .growMoveUp registers, _, _ =>
      .exec .U (.macro .growUp registers)
  | .macro .growMoveEndpoint registers, _, _ =>
      .exec .U (.macro .growEndpoint registers)
  | .macro .growEndpoint registers, _, _ =>
      .stay (startProbe (.arityThree .growth) registers)
  | .macro (.family .fuel) registers, _, _ =>
      .stay (startProbe .fuelSuccessor registers)
  | .macro (.family .down) registers, _, _ =>
      .stay (startProbe .downLiveZero registers)
  | .macro .downOmega registers, node, _ =>
      match node with
      | .s => .stay (.macro (.family .up) registers)
      | .app => .reject
  | .macro (.routeDown codeNode) registers, _, _ =>
      match codeLabel? codeNode with
      | some label =>
          .exec .R (startScript (.accumulator label) registers)
      | none =>
          .exec .R (startProbe (.routeLeft codeNode) registers)
  | .macro (.routeChoice codeNode direction) registers, _, _ =>
      match direction with
      | .left =>
          match codeLeft? codeNode with
          | some child => .exec .L (.macro (.routeDown child) registers)
          | none => .reject
      | .right =>
          match codeRight? codeNode with
          | some child => .exec .R (.macro (.routeDown child) registers)
          | none => .reject
  | .macro (.family .up) registers, _, _ =>
      .stay (startProbe (.pending .scan) registers)
  | .macro .upMove registers, _, incoming =>
      match incoming with
      | .root => .reject
      | .left => .exec .U (.macro (.upAncestor .left) registers)
      | .right => .exec .U (.macro (.upAncestor .right) registers)
  | .macro (.upAncestor side) registers, _, _ =>
      .stay (startProbe (.upLiveZero side) registers)
  | .macro (.upLiveFound bit) registers, _, _ =>
      if registers.seen then
        .stay (.macro (.family .up) (registers.observeLive bit))
      else
        .exec .Rdx (.macro (.family .up) (registers.observeLive bit))
  | .macro (.pendingDecision use) registers, _, _ =>
      match use with
      | .scan =>
          if registers.seen then
            .exec .U (.macro (.family .frameDispatch) registers)
          else
            .exec .U (.macro (.family .empty) { registers with empty := true })
      | .normalReturn => .stay (.macro (.family .down) registers)
      | .emptyReturn => .exec .U (.macro (.family .empty) registers)
  | .macro (.family .frameDispatch) registers, _, _ =>
      match registers.bit with
      | none => .reject
      | some bit =>
          .stay (startScript (.normalResponse (registers.phase, bit)) registers)
  | .macro (.family .return) registers, _, _ =>
      match registers.bit with
      | none => .reject
      | some bit =>
          if outputEmpty program registers bit then
            .stay (startScript .markNormal registers)
          else
            .stay (startProbe (.pending .normalReturn) registers.advance)
  | .macro (.family .empty) registers, _, _ =>
      .stay (startScript (.emptyResponse (registers.phase, false)) registers)
  | .macro (.continuationCheck empty) registers, _, _ =>
      .stay (startProbe (.arityThree (.continuation empty)) registers)
  | .macro (.arityDecision use arityThree) registers, _, _ =>
      if arityThree then
        .exec .Rdx
          (.macro (.family .fuel) (Registers.newJob program))
      else
        .exec .L (.macro .clockGrow (Registers.newJob program))

/-! ## Constructive finite-state cover -/

/-- Every ordinary control value materialized as a finite list. -/
def controlStates (program : CTS.Program)
    (dispatcher : ActionDispatcher program) :
    List (Control program dispatcher) :=
  ((macroStates program dispatcher).flatMap fun mode =>
    (registerStates program).map fun registers =>
      Control.macro mode registers) ++
  ((scriptJobStates program).flatMap fun job =>
    (scriptPCStates program dispatcher job).flatMap fun pc =>
      (registerStates program).map fun registers =>
        Control.script job pc registers) ++
  ((probeKindStates program dispatcher).flatMap fun kind =>
    (probePCStates program dispatcher kind).flatMap fun pc =>
      (registerStates program).map fun registers =>
        Control.probe kind pc registers)

theorem control_mem_states (control : Control program dispatcher) :
    control ∈ controlStates program dispatcher := by
  cases control with
  | «macro» mode registers =>
      apply mem_append_left_clean
      apply mem_append_left_clean
      apply mem_flatMap_clean _ (mem_macroStates mode)
      exact mem_map_clean _ (mem_registerStates registers)
  | script job pc registers =>
      apply mem_append_left_clean
      apply mem_append_right_clean
      apply mem_flatMap_clean _ (mem_scriptJobStates job)
      apply mem_flatMap_clean _ (mem_scriptPCStates pc)
      exact mem_map_clean _ (mem_registerStates registers)
  | probe kind pc registers =>
      apply mem_append_right_clean
      apply mem_flatMap_clean _ (mem_probeKindStates kind)
      apply mem_flatMap_clean _ (mem_probePCStates pc)
      exact mem_map_clean _ (mem_registerStates registers)

/-!
Probe-control trees share identical terminal and continuation subcontrols, so
the structurally generated `controlStates` cover can contain duplicates.  The
machine uses the following proof-producing deduplication.  This makes its
published state list a canonical enumeration; the larger raw-cover length and
the smaller symbolic primitive-row count remain different quantities.
-/

private def deduplicate [DecidableEq α] : List α → List α
  | [] => []
  | first :: rest =>
      if first ∈ rest then deduplicate rest
      else first :: deduplicate rest

private theorem mem_deduplicate [DecidableEq α] (value : α) :
    (values : List α) → value ∈ deduplicate values ↔ value ∈ values
  | [] => by simp [deduplicate]
  | first :: rest => by
      by_cases hfirst : first ∈ rest
      · simp only [deduplicate, if_pos hfirst, mem_deduplicate, List.mem_cons]
        constructor
        · exact Or.inr
        · intro hmem
          rcases hmem with heq | hmem
          · exact heq ▸ hfirst
          · exact hmem
      · simp only [deduplicate, if_neg hfirst, List.mem_cons, mem_deduplicate]

private theorem deduplicate_nodup [DecidableEq α] :
    (values : List α) → (deduplicate values).Nodup
  | [] => by simp [deduplicate]
  | first :: rest => by
      by_cases hfirst : first ∈ rest
      · simpa [deduplicate, hfirst] using deduplicate_nodup rest
      · rw [deduplicate, if_neg hfirst, List.nodup_cons]
        exact ⟨by
          intro hmem
          exact hfirst ((mem_deduplicate first rest).mp hmem),
          deduplicate_nodup rest⟩

/-- Canonical duplicate-free enumeration of every ordinary control value. -/
def canonicalControlStates (program : CTS.Program)
    (dispatcher : ActionDispatcher program) :
    List (Control program dispatcher) :=
  deduplicate (controlStates program dispatcher)

/-- The canonical ordinary-state enumeration contains no repeated control. -/
theorem canonicalControlStates_nodup (program : CTS.Program)
    (dispatcher : ActionDispatcher program) :
    (canonicalControlStates program dispatcher).Nodup :=
  deduplicate_nodup _

/-- Every ordinary scheduler control occurs in the canonical enumeration. -/
theorem control_mem_canonicalStates
    (control : Control program dispatcher) :
    control ∈ canonicalControlStates program dispatcher := by
  exact (mem_deduplicate control _).mpr (control_mem_states control)

/-- Cardinality of the duplicate-free ordinary scheduler-control type. -/
def canonicalControlStateCount (program : CTS.Program)
    (dispatcher : ActionDispatcher program) : Nat :=
  (canonicalControlStates program dispatcher).length

/-- The compiled deterministic finite one-cursor machine. -/
def machine (program : CTS.Program)
    (dispatcher : ActionDispatcher program) :
    FiniteController.Machine (Control program dispatcher) where
  stateCover := fun _ => canonicalControlStates program dispatcher
  covers := control_mem_canonicalStates
  transition := transition program dispatcher

/-- The machine's published ordinary-state list is duplicate-free. -/
theorem machine_states_nodup (program : CTS.Program)
    (dispatcher : ActionDispatcher program) :
    (machine program dispatcher).states.Nodup :=
  canonicalControlStates_nodup program dispatcher

/-- The machine-state-list length is the canonical control cardinality. -/
theorem machine_states_length (program : CTS.Program)
    (dispatcher : ActionDispatcher program) :
    (machine program dispatcher).states.length =
      canonicalControlStateCount program dispatcher :=
  rfl

/-- Public form of the machine's constructive finite-state cover. -/
theorem machine_covers (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (control : Control program dispatcher) :
    control ∈ (machine program dispatcher).states :=
  (machine program dispatcher).covers control

/-- Concrete initial control at the whole encoder root. -/
def initialControl (program : CTS.Program)
    (dispatcher : ActionDispatcher program) : Control program dispatcher :=
  .macro (.family .clock) (Registers.initial program)

/-- Concrete initial one-cursor configuration for the encoded dataword. -/
def initialConfiguration (program : CTS.Program)
    (dispatcher : ActionDispatcher program) (bits : List Bool) :
    FiniteController.Configuration (Control program dispatcher) :=
  ⟨some (initialControl program dispatcher),
    ⟨generator (compileActions program dispatcher.tree) bits, []⟩⟩

@[simp]
theorem initialConfiguration_erase (program : CTS.Program)
    (dispatcher : ActionDispatcher program) (bits : List Bool) :
    (initialConfiguration program dispatcher bits).cursor.erase =
      generator (compileActions program dispatcher.tree) bits :=
  rfl

/-! ## Operational guarantees and compiler refinement -/

/-- The explicit ordinary-state cover is nonempty. -/
theorem controlStates_length_pos (program : CTS.Program)
    (dispatcher : ActionDispatcher program) :
    0 < (controlStates program dispatcher).length := by
  have hmem := control_mem_states (initialControl program dispatcher)
  generalize hstates : controlStates program dispatcher = states at hmem ⊢
  cases states with
  | nil => cases hmem
  | cons head tail => exact Nat.zero_lt_succ _

/-- The transition table is functional at every row and observation pair. -/
theorem transition_deterministic
    {control : Control program dispatcher}
    {node : Probe.NodeKind} {incoming : Probe.Incoming}
    {first second : FiniteController.Command (Control program dispatcher)}
    (hfirst : transition program dispatcher control node incoming = first)
    (hsecond : transition program dispatcher control node incoming = second) :
    first = second :=
  hfirst.symm.trans hsecond

/-- Every nonterminal fixed-script PC emits exactly its indexed primitive. -/
theorem transition_script_step
    (job : ScriptJob program) (pc : ScriptPC program dispatcher job)
    (registers : Registers program) (node : Probe.NodeKind)
    (incoming : Probe.Incoming)
    (hpc : pc.val < (jobScript program dispatcher job).length) :
    transition program dispatcher (.script job pc registers) node incoming =
      .exec ((jobScript program dispatcher job).get ⟨pc.val, hpc⟩)
        (.script job (nextScriptPC program dispatcher job pc hpc) registers) := by
  simp [transition, hpc]

/-- The unique final PC performs only its prescribed finite mode change. -/
theorem transition_script_done
    (job : ScriptJob program) (pc : ScriptPC program dispatcher job)
    (registers : Registers program) (node : Probe.NodeKind)
    (incoming : Probe.Incoming)
    (hpc : ¬ pc.val < (jobScript program dispatcher job).length) :
    transition program dispatcher (.script job pc registers) node incoming =
      .stay (afterScript program dispatcher job registers) := by
  simp [transition, hpc]

@[simp]
theorem jobScript_fuelPositive (program : CTS.Program)
    (dispatcher : ActionDispatcher program) :
    jobScript program dispatcher .fuelPositive =
      PrimitiveScripts.fuelPositive :=
  rfl

@[simp]
theorem jobScript_fuelZero (program : CTS.Program)
    (dispatcher : ActionDispatcher program) :
    jobScript program dispatcher .fuelZero = PrimitiveScripts.fuelZero :=
  rfl

@[simp]
theorem jobScript_normalResponse
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (label : ActionLabel program) :
    jobScript program dispatcher (.normalResponse label) =
      PrimitiveLocalResponse.execute program (dispatcher.route label) label :=
  rfl

@[simp]
theorem jobScript_emptyResponse
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (label : ActionLabel program) :
    jobScript program dispatcher (.emptyResponse label) =
      PrimitiveLocalResponse.execute program (dispatcher.route label) label :=
  rfl

@[simp]
theorem jobScript_accumulator
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (label : ActionLabel program) :
    jobScript program dispatcher (.accumulator label) =
      List.replicate (PrimitiveLocalResponse.emitted program label).length .L ++
        [.R] :=
  rfl

/--
The scheduler's normal-response job is exactly the already verified frame,
route, appender, and return script, at the fixed dispatcher's selected route.
-/
theorem run_normalResponse
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (label : ActionLabel program) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    Script.run
        (jobScript program dispatcher (.normalResponse label))
        ⟨frame
          (environmentCode (compileActions program dispatcher.tree) bits)
          continuation carrier, parents⟩ =
      some ⟨LocalResponse.completed bits continuation carrier
          (PrimitiveLocalResponse.completedRoute program dispatcher.tree
            (dispatcher.route label) label carrier), parents⟩ := by
  exact PrimitiveLocalResponse.run_execute program
    (dispatcher.route_valid label) bits continuation carrier parents

/-- Empty-family response uses the same exact zero-label response compiler. -/
theorem run_emptyResponse
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (phase : CTS.Phase program) (bits : List Bool)
    (continuation carrier : Term) (parents : List ParentFrame) :
    Script.run
        (jobScript program dispatcher (.emptyResponse (phase, false)))
        ⟨frame
          (environmentCode (compileActions program dispatcher.tree) bits)
          continuation carrier, parents⟩ =
      some ⟨LocalResponse.completed bits continuation carrier
          (PrimitiveLocalResponse.completedRoute program dispatcher.tree
            (dispatcher.route (phase, false)) (phase, false) carrier),
        parents⟩ := by
  exact PrimitiveLocalResponse.run_execute program
    (dispatcher.route_valid (phase, false)) bits continuation carrier parents

/-- Fuel jobs refine the literal syntax-driven Appendix-A scripts. -/
theorem run_fuelPositive_job
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (n : Nat) (environment continuation : Term)
    (parents : List ParentFrame) :
    Script.run (jobScript program dispatcher .fuelPositive)
      ⟨.app (.app (C (n + 1)) environment) continuation, parents⟩ =
      some ⟨.app (.app (C n) environment) continuation,
        .right (.app environment continuation) :: parents⟩ :=
  PrimitiveScripts.run_fuelPositive n environment continuation parents

theorem run_fuelZero_job
    (program : CTS.Program) (dispatcher : ActionDispatcher program)
    (environment continuation : Term) (parents : List ParentFrame) :
    Script.run (jobScript program dispatcher .fuelZero)
      ⟨.app (.app (C 0) environment) continuation, parents⟩ =
      some ⟨baseCarrier environment continuation, parents⟩ :=
  PrimitiveScripts.run_fuelZero environment continuation parents

/-- Table used by the scheduler for one fixed probe tag. -/
def compiledProbeTable (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (kind : ProbeKind program dispatcher) : ProbeCompiler.Table :=
  ProbeCompiler.Table.ofControl (probeControl program dispatcher kind)

/-- Exact number of rows taken by a scheduler probe on one cursor. -/
def compiledProbeCost (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (kind : ProbeKind program dispatcher) (origin : Cursor) : Nat :=
  match probeSite kind with
  | .local =>
      ProbeCompiler.probeCost (probePattern program dispatcher kind) origin.focus + 1
  | .parent side =>
      ProbeCompiler.parentCost side (probePattern program dispatcher kind) origin

/-- Boolean returned by a scheduler probe on one cursor. -/
def compiledProbeAnswer (program : CTS.Program)
    (dispatcher : ActionDispatcher program)
    (kind : ProbeKind program dispatcher) (origin : Cursor) : Bool :=
  match probeSite kind with
  | .local => Pattern.matchesBool (probePattern program dispatcher kind) origin.focus
  | .parent side =>
      Probe.parentMatches side (probePattern program dispatcher kind) origin

/-- Every scheduler probe is cursor-only: its generated table contains no `Rdx`. -/
theorem probeControl_noRdx (kind : ProbeKind program dispatcher) :
    (probeControl program dispatcher kind).NoRdx := by
  unfold probeControl
  cases hsite : probeSite kind with
  | «local» =>
      simpa [hsite] using ProbeCompiler.patternControl_noRdx
        (probePattern program dispatcher kind)
  | parent side =>
      simpa [hsite] using ProbeCompiler.parentControl_noRdx side
        (probePattern program dispatcher kind)

/--
The actual code root stored by a scheduler probe runs to its Boolean answer,
never rejects, and restores the exact input cursor.
-/
theorem compiledProbe_run
    (kind : ProbeKind program dispatcher) (origin : Cursor) :
    (compiledProbeTable program dispatcher kind).run
        (compiledProbeCost program dispatcher kind origin)
        (.running (probeControl program dispatcher kind) origin) =
      .done (compiledProbeAnswer program dispatcher kind origin) origin := by
  unfold compiledProbeTable compiledProbeCost compiledProbeAnswer probeControl
  cases hsite : probeSite kind with
  | «local» =>
      simpa [hsite, ProbeCompiler.patternTable] using
        ProbeCompiler.pattern_run (probePattern program dispatcher kind) origin
  | parent side =>
      simpa [hsite, ProbeCompiler.parentTable] using
        ProbeCompiler.parent_run side (probePattern program dispatcher kind) origin

theorem compiledProbe_never_rejects
    (kind : ProbeKind program dispatcher) (origin : Cursor) :
    ∀ fuel,
      (compiledProbeTable program dispatcher kind).run fuel
          (.running (probeControl program dispatcher kind) origin) ≠
        .reject := by
  exact ProbeCompiler.Table.neverRejects_of_run_done
    (compiledProbe_run kind origin)

/-- A counted scheduler mutation can only arise from a successful `Rdx` row. -/
theorem mutationCount_one_exposes_rdx
    (configuration :
      FiniteController.Configuration (Control program dispatcher))
    (hcount : FiniteController.mutationCount
      (machine program dispatcher) configuration = 1) :
    ∃ control next after,
      configuration.control = some control ∧
      transition program dispatcher control
          (Probe.observeNode configuration.cursor)
          (Probe.observeIncoming configuration.cursor) =
        .exec .Rdx next ∧
      configuration.cursor.rdx? = some after := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => simp [FiniteController.mutationCount, machine] at hcount
  | some control =>
      generalize hcommand : transition program dispatcher control
        (Probe.observeNode cursor) (Probe.observeIncoming cursor) = command
      cases command with
      | stay next =>
          simp [FiniteController.mutationCount, machine, hcommand] at hcount
      | reject =>
          simp [FiniteController.mutationCount, machine, hcommand] at hcount
      | exec primitive next =>
          cases primitive with
          | L => simp [FiniteController.mutationCount, machine, hcommand] at hcount
          | R => simp [FiniteController.mutationCount, machine, hcommand] at hcount
          | U => simp [FiniteController.mutationCount, machine, hcommand] at hcount
          | Rdx =>
              generalize hrdx : cursor.rdx? = result
              cases result with
              | none =>
                  simp [FiniteController.mutationCount, machine, hcommand,
                    hrdx] at hcount
              | some after =>
                  exact ⟨control, next, after, rfl, hcommand, rfl⟩

/-- Every successful scheduler mutation projects to one pure-`S` contraction. -/
theorem mutationCount_one_step
    (configuration :
      FiniteController.Configuration (Control program dispatcher))
    (hcount : FiniteController.mutationCount
      (machine program dispatcher) configuration = 1) :
    Step configuration.cursor.erase
      (FiniteController.step (machine program dispatcher) configuration).cursor.erase :=
  FiniteController.mutationCount_one_sound _ _ hcount

/-- Constructive first-contraction extraction from any positive finite run. -/
theorem exists_first_mutation
    {fuel : Nat}
    {configuration :
      FiniteController.Configuration (Control program dispatcher)}
    (hpositive : 0 < FiniteController.runMutationCount
      (machine program dispatcher) fuel configuration) :
    ∃ after,
      FiniteController.seekMutation (machine program dispatcher) fuel
        configuration = some after :=
  FiniteController.exists_seekMutation_of_runMutationCount_pos _ hpositive

/-!
`compiledProbe_run` proves that bounded probes themselves never reject.
Global scheduler non-rejection additionally requires a semantic mode
invariant connecting each reachable `(Control, Cursor)` pair to its exact
clock/fuel/canonical-path/route/action/continuation shape.  In particular its
UP clause must strengthen `registeredAncestorPattern` from the bounded public
application filter to the reachable-audit union, with the saved incoming side;
its DOWN clause must prove the ordered Local/Base/live/tombstone/Omega guards
exhaustive; and every script clause must supply the corresponding successful
`Script.run` equation.  Those are logical proofs, not runtime fields.
-/

end SchedulerControl

end PureSFormal.PureS
