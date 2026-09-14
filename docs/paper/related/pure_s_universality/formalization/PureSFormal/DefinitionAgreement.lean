import PureSFormal.PureS.Reduction
import PureSFormal.PureS.FiniteController
import PureSFormal.CTS.Core
import PureSFormal.Rogozhin.Table

/-!
# Independent definition agreements

This module pins four small semantic interfaces to definitions written a
second way.  The comparison definitions below do not call the functions or
relations whose agreement they state.
-/

namespace PureSFormal.PureS

/-! ## Contextual pure-S contraction -/

/--
The textbook inductive contextual closure of the single pure-S contraction.
This definition uses the raw term constructors and congruence rules rather
than `Context` or `PureS.Step`.
-/
inductive TextbookStep : Term → Term → Prop where
  | contract (x y z : Term) :
      TextbookStep
        (.app (.app (.app .s x) y) z)
        (.app (.app x z) (.app y z))
  | appLeft {source target : Term} :
      TextbookStep source target →
      (right : Term) →
      TextbookStep (.app source right) (.app target right)
  | appRight (left : Term) {source target : Term} :
      TextbookStep source target →
      TextbookStep (.app left source) (.app left target)

namespace TextbookStep

/-- The inductive textbook relation is closed under every one-hole context. -/
theorem inContext {source target : Term}
    (step : TextbookStep source target) (ctx : Context) :
    TextbookStep (ctx.plug source) (ctx.plug target) := by
  induction ctx with
  | hole => exact step
  | appLeft ctx right ih => exact .appLeft ih right
  | appRight left ctx ih => exact .appRight left ih

end TextbookStep

/--
Agreement of `Step` with the independently inductive textbook contextual
closure, pointwise on source and target terms.
-/
theorem step_iff_textbookStep (source target : Term) :
    Step source target ↔ TextbookStep source target := by
  constructor
  · rintro ⟨ctx, x, y, z, rfl, rfl⟩
    exact (TextbookStep.contract x y z).inContext ctx
  · intro step
    induction step with
    | contract x y z => exact Step.root x y z
    | appLeft step right ih => exact ih.appLeft right
    | appRight left step ih => exact ih.appRight left

end PureSFormal.PureS

namespace PureSFormal.CTS

/-! ## Absorbing cyclic-tag transition -/

namespace Textbook

/-- Phase successor, transcribed without calling `CTS.nextPhase`. -/
def nextPhase (P : Program) (phase : Phase P) : Phase P :=
  ⟨(phase.val + 1) % P.period, Nat.mod_lt _ P.period_pos⟩

/--
The two-clause textbook absorbing CTS transition.  The empty word advances
only the phase.  A nonempty word deletes its first bit and appends the current
appendant exactly when that bit is one.
-/
def absorbingStep (P : Program) : Config P → Config P
  | ⟨phase, []⟩ => ⟨nextPhase P phase, []⟩
  | ⟨phase, bit :: tail⟩ =>
      ⟨nextPhase P phase,
        tail ++ if bit then P.appendant phase else []⟩

end Textbook

/-- The independent textbook phase successor equals the executable one. -/
theorem nextPhase_eq_textbook (P : Program) (phase : Phase P) :
    nextPhase P phase = Textbook.nextPhase P phase := by
  rfl

/--
The executable absorbing CTS transition equals the independent two-clause
textbook transition on every configuration.
-/
theorem absorbingStep_eq_textbook (P : Program) (config : Config P) :
    absorbingStep P config = Textbook.absorbingStep P config := by
  cases config with
  | mk phase data =>
      cases data with
      | nil => rfl
      | cons bit tail =>
          cases bit <;> simp [absorbingStep, ordinaryStep, advance,
            Textbook.absorbingStep, Textbook.nextPhase, nextPhase]

end PureSFormal.CTS

namespace PureSFormal.PureS.FiniteController

/-! ## Deterministic tree-walker representation -/

namespace Textbook

/-- The two node labels of the pure-S binary application tree. -/
inductive Label where
  | leaf
  | branch
  deriving DecidableEq, Repr

/-- The edge by which the head reached its current node, including the root. -/
inductive Arrival where
  | root
  | fromLeft
  | fromRight
  deriving DecidableEq, Repr

/-- Standard read-only motions of a deterministic tree-walking head. -/
inductive Move where
  | stay
  | left
  | right
  | up
  deriving DecidableEq, Repr

/--
A textbook tree-walker instruction, extended by the one extra instruction
`contract` for rewriting the focused pure-S redex.
-/
inductive Instruction (Control : Type) where
  | move (motion : Move) (next : Control)
  | contract (next : Control)
  | reject

/--
A deterministic finite tree-walking automaton with the extra focused
contraction instruction.  Its transition depends only on state, node label,
and incoming edge.
-/
structure Machine (Control : Type) where
  states : List Control
  covers : ∀ control, control ∈ states
  transition : Control → Label → Arrival → Instruction Control

end Textbook

/-- Translate the scheduler's node observation into the textbook label. -/
def textbookLabel : Probe.NodeKind → Textbook.Label
  | .s => .leaf
  | .app => .branch

/-- Translate the textbook label into the scheduler's node observation. -/
def nodeKindOfTextbook : Textbook.Label → Probe.NodeKind
  | .leaf => .s
  | .branch => .app

/-- Translate the scheduler's incoming-edge observation. -/
def textbookArrival : Probe.Incoming → Textbook.Arrival
  | .root => .root
  | .left => .fromLeft
  | .right => .fromRight

/-- Translate the textbook incoming-edge observation. -/
def incomingOfTextbook : Textbook.Arrival → Probe.Incoming
  | .root => .root
  | .fromLeft => .left
  | .fromRight => .right

/-- Translate a scheduler command into a textbook walker instruction. -/
def textbookInstruction : Command Control → Textbook.Instruction Control
  | .stay next => .move .stay next
  | .exec .L next => .move .left next
  | .exec .R next => .move .right next
  | .exec .U next => .move .up next
  | .exec .Rdx next => .contract next
  | .reject => .reject

/-- Translate a textbook walker instruction into a scheduler command. -/
def commandOfTextbook : Textbook.Instruction Control → Command Control
  | .move .stay next => .stay next
  | .move .left next => .exec .L next
  | .move .right next => .exec .R next
  | .move .up next => .exec .U next
  | .contract next => .exec .Rdx next
  | .reject => .reject

@[simp]
theorem nodeKindOfTextbook_textbookLabel (kind : Probe.NodeKind) :
    nodeKindOfTextbook (textbookLabel kind) = kind := by
  cases kind <;> rfl

@[simp]
theorem textbookLabel_nodeKindOfTextbook (label : Textbook.Label) :
    textbookLabel (nodeKindOfTextbook label) = label := by
  cases label <;> rfl

@[simp]
theorem incomingOfTextbook_textbookArrival (incoming : Probe.Incoming) :
    incomingOfTextbook (textbookArrival incoming) = incoming := by
  cases incoming <;> rfl

@[simp]
theorem textbookArrival_incomingOfTextbook (arrival : Textbook.Arrival) :
    textbookArrival (incomingOfTextbook arrival) = arrival := by
  cases arrival <;> rfl

@[simp]
theorem commandOfTextbook_textbookInstruction (command : Command Control) :
    commandOfTextbook (textbookInstruction command) = command := by
  cases command with
  | stay next => rfl
  | reject => rfl
  | exec primitive next => cases primitive <;> rfl

@[simp]
theorem textbookInstruction_commandOfTextbook
    (instruction : Textbook.Instruction Control) :
    textbookInstruction (commandOfTextbook instruction) = instruction := by
  cases instruction with
  | reject => rfl
  | contract next => rfl
  | move motion next => cases motion <;> rfl

/-- Re-express a scheduler machine as a textbook tree walker with contraction. -/
def toTextbook (machine : Machine Control) : Textbook.Machine Control where
  states := machine.states
  covers := machine.covers
  transition := fun control label arrival =>
    textbookInstruction
      (machine.transition control
        (nodeKindOfTextbook label) (incomingOfTextbook arrival))

/-- Re-express a textbook tree walker with contraction as a scheduler machine. -/
def ofTextbook (machine : Textbook.Machine Control) : Machine Control where
  stateCover := fun _ => machine.states
  covers := machine.covers
  transition := fun control kind incoming =>
    commandOfTextbook
      (machine.transition control
        (textbookLabel kind) (textbookArrival incoming))

/-- Scheduler-to-textbook roundtrip preserves the finite state cover list. -/
theorem ofTextbook_toTextbook_states (machine : Machine Control) :
    (ofTextbook (toTextbook machine)).states = machine.states :=
  rfl

/-- Scheduler-to-textbook roundtrip preserves every transition-table cell. -/
theorem ofTextbook_toTextbook_transition (machine : Machine Control)
    (control : Control) (kind : Probe.NodeKind) (incoming : Probe.Incoming) :
    (ofTextbook (toTextbook machine)).transition control kind incoming =
      machine.transition control kind incoming := by
  cases kind <;> cases incoming <;>
    exact commandOfTextbook_textbookInstruction _

/-- Textbook-to-scheduler roundtrip preserves the finite state cover list. -/
theorem toTextbook_ofTextbook_states (machine : Textbook.Machine Control) :
    (toTextbook (ofTextbook machine)).states = machine.states :=
  rfl

/-- Textbook-to-scheduler roundtrip preserves every transition-table cell. -/
theorem toTextbook_ofTextbook_transition (machine : Textbook.Machine Control)
    (control : Control) (label : Textbook.Label) (arrival : Textbook.Arrival) :
    (toTextbook (ofTextbook machine)).transition control label arrival =
      machine.transition control label arrival := by
  cases label <;> cases arrival <;>
    exact textbookInstruction_commandOfTextbook _

/--
The computational representation of `FiniteController.Machine` is equivalent
to the independently presented deterministic finite tree walker with one
extra focused-contraction instruction.
-/
structure RepresentationEquivalence (Control : Type) where
  forward : Machine Control → Textbook.Machine Control
  backward : Textbook.Machine Control → Machine Control
  backwardForwardStates : ∀ machine,
    (backward (forward machine)).states = machine.states
  backwardForwardTransition : ∀ machine control kind incoming,
    (backward (forward machine)).transition control kind incoming =
      machine.transition control kind incoming
  forwardBackwardStates : ∀ machine,
    (forward (backward machine)).states = machine.states
  forwardBackwardTransition : ∀ machine control label arrival,
    (forward (backward machine)).transition control label arrival =
      machine.transition control label arrival

/-- The two machine representations, packaged with both computational inverse laws. -/
def machineEquivTextbook (Control : Type) :
    RepresentationEquivalence Control where
  forward := toTextbook
  backward := ofTextbook
  backwardForwardStates := ofTextbook_toTextbook_states
  backwardForwardTransition := ofTextbook_toTextbook_transition
  forwardBackwardStates := toTextbook_ofTextbook_states
  forwardBackwardTransition := toTextbook_ofTextbook_transition

end PureSFormal.PureS.FiniteController

namespace PureSFormal.Rogozhin46

/-! ## Independent transcription of Rogozhin's printed table -/

namespace ScanTranscription

/-- Printed state names, in the scan's column order. -/
inductive State where
  | q1 | q2 | q3 | q4
  deriving DecidableEq, Repr

/-- Printed symbol names, in the scan's row order. -/
inductive Symbol where
  | one | b | bLeft | bRight | zero | c
  deriving DecidableEq, Repr

/-- Printed head-move letters. -/
inductive Direction where
  | L | R
  deriving DecidableEq, Repr

/--
Printed command order is write, move, next state; a dash in the scan is
transcribed as `halt`.
-/
inductive Transition where
  | step (write : Symbol) (move : Direction) (next : State)
  | halt
  deriving DecidableEq, Repr

/--
Second transcription of the 24 cells printed in Rogozhin, Section 8, p. 232.
The function is symbol-first so its equations follow scan rows and columns.
-/
def transition : Symbol → State → Transition
  | .one, .q1 => .step .bRight .L .q1
  | .one, .q2 => .step .zero .R .q2
  | .one, .q3 => .step .one .R .q3
  | .one, .q4 => .step .zero .R .q4
  | .b, .q1 => .step .bLeft .R .q1
  | .b, .q2 => .step .bLeft .L .q3
  | .b, .q3 => .step .bRight .R .q4
  | .b, .q4 => .step .c .L .q2
  | .bLeft, .q1 => .step .b .L .q1
  | .bLeft, .q2 => .step .bRight .R .q2
  | .bLeft, .q3 => .step .b .R .q3
  | .bLeft, .q4 => .step .bRight .R .q4
  | .bRight, .q1 => .step .zero .R .q1
  | .bRight, .q2 => .step .bLeft .L .q2
  | .bRight, .q3 => .halt
  | .bRight, .q4 => .halt
  | .zero, .q1 => .step .bRight .L .q1
  | .zero, .q2 => .step .one .L .q2
  | .zero, .q3 => .step .c .R .q1
  | .zero, .q4 => .step .c .L .q2
  | .c, .q1 => .step .zero .R .q4
  | .c, .q2 => .step .b .R .q2
  | .c, .q3 => .step .one .R .q1
  | .c, .q4 => .step .b .R .q4

/-- Normalize the scan's state names to the executable table names. -/
def normalizeState : State → Rogozhin46.State
  | .q1 => .A
  | .q2 => .B
  | .q3 => .C
  | .q4 => .D

/-- Normalize the scan's symbols in the stated row order. -/
def normalizeSymbol : Symbol → Rogozhin46.Symbol
  | .one => .s0
  | .b => .s1
  | .bLeft => .s2
  | .bRight => .s3
  | .zero => .s4
  | .c => .s5

/-- Normalize the printed move letter. -/
def normalizeDirection : Direction → Rogozhin46.Direction
  | .L => .left
  | .R => .right

/-- Normalize printed write/move/next command order to executable order. -/
def normalizeTransition : Transition → Rogozhin46.Transition
  | .step write move next =>
      .step (normalizeState next) (normalizeSymbol write)
        (normalizeDirection move)
  | .halt => .halt

/-- Inverse state-name map used to compare every normalized lookup input. -/
def printedState : Rogozhin46.State → State
  | .A => .q1
  | .B => .q2
  | .C => .q3
  | .D => .q4

/-- Inverse symbol-name map used to compare every normalized lookup input. -/
def printedSymbol : Rogozhin46.Symbol → Symbol
  | .s0 => .one
  | .s1 => .b
  | .s2 => .bLeft
  | .s3 => .bRight
  | .s4 => .zero
  | .s5 => .c

@[simp]
theorem normalizeState_printedState (state : Rogozhin46.State) :
    normalizeState (printedState state) = state := by
  cases state <;> rfl

@[simp]
theorem normalizeSymbol_printedSymbol (symbol : Rogozhin46.Symbol) :
    normalizeSymbol (printedSymbol symbol) = symbol := by
  cases symbol <;> rfl

/-- The scan transcription, normalized to the executable lookup signature. -/
def normalizedTransition
    (state : Rogozhin46.State) (read : Rogozhin46.Symbol) :
    Rogozhin46.Transition :=
  normalizeTransition (transition (printedSymbol read) (printedState state))

end ScanTranscription

/--
Every executable Rogozhin table cell equals the independently typed and
normalized p. 232 scan transcription.
-/
theorem transition_eq_scanTranscription (state : State) (read : Symbol) :
    transition state read = ScanTranscription.normalizedTransition state read := by
  cases state <;> cases read <;> rfl

end PureSFormal.Rogozhin46
