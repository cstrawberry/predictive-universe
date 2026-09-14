import PureSFormal.Research.RootResetClockGrowthWalker
import PureSFormal.PureS.SchedulerJobHandoff

/-!
# Finite parity discrimination of generated clock growth and launch

The first pass reads the first wrapper's unary label and returns to the
whole-term root. The second pass reads the terminal pair's right numeral,
combines their parity bits, and returns to root again. Equal parity enters
the growth walker; unequal parity selects the saturated launch root.

Unary decoding uses local node observations and one-edge moves. The parity
bit and pass identifier are finite control. No numeral, counter, address, or
return path is stored in control. Worker success returns to the whole-term
root; when its input cursor is already at root this is its exact origin.
The `done` row is a continuation boundary: its next microstep starts the next
pass. The clock-choice theorems apply to the displayed generated families;
entering this component from a general simulation still requires that phase
invariant.
-/

namespace PureSFormal.Research.RootResetClockParityWalker

open PureSFormal.PureS
open PureSFormal.PureS.FiniteController
open PureSFormal.PureS.SchedulerInvariant
open RootResetSelectorContract

namespace Growth
abbrev Control := RootResetClockGrowthWalker.Control
abbrev machine := RootResetClockGrowthWalker.machine
end Growth

inductive Pass where | first | second
  deriving DecidableEq, Repr

inductive Work where
  | scan | left | head | branchParent | branch | positiveUp | positiveRoot
  | zeroFirstLeft | zeroFirstParent | zeroFirstRight | zeroFirstUp1 | zeroFirstUp2
  | zeroFirstRoot | zeroSecond | zeroSecondLeft | zeroSecondParent | zeroSecondRight
  | zeroSecondUp | returning
  deriving DecidableEq, Repr

inductive First where | enter | core | left | head | back
  deriving DecidableEq, Repr

inductive Find where | enter | scan | left | head | wrapperUp | wrapperRoot
  | endpointUp | endpointRoot
  deriving DecidableEq, Repr

inductive Control where
  | work (stage : Work) (pass : Pass) (bit : Bool)
  | done (pass : Pass) (bit : Bool)
  | first (stage : First)
  | find (stage : Find) (bit : Bool)
  | growth (stage : Growth.Control)
  | restartGrowth | launch | abort | miss
  deriving DecidableEq, Repr

def liftGrowthCommand : Command Growth.Control → Command Control
  | .stay next => .stay (.growth next)
  | .exec primitive next => .exec primitive (.growth next)
  | .reject => .reject

def transition : Control → Probe.NodeKind → Probe.Incoming → Command Control
  | .work .scan pass bit, .app, _ => .exec .L (.work .left pass bit)
  | .work .left pass bit, .app, _ => .exec .L (.work .head pass bit)
  | .work .head pass bit, .s, _ => .exec .U (.work .branchParent pass bit)
  | .work .branchParent pass bit, _, _ => .exec .R (.work .branch pass bit)
  | .work .branch pass bit, .s, _ => .exec .U (.work .positiveUp pass bit)
  | .work .positiveUp pass bit, _, _ => .exec .U (.work .positiveRoot pass bit)
  | .work .positiveRoot pass bit, _, _ => .exec .R (.work .scan pass (!bit))
  | .work .branch pass bit, .app, _ => .exec .L (.work .zeroFirstLeft pass bit)
  | .work .zeroFirstLeft pass bit, .s, _ => .exec .U (.work .zeroFirstParent pass bit)
  | .work .zeroFirstParent pass bit, _, _ => .exec .R (.work .zeroFirstRight pass bit)
  | .work .zeroFirstRight pass bit, .s, _ => .exec .U (.work .zeroFirstUp1 pass bit)
  | .work .zeroFirstUp1 pass bit, _, _ => .exec .U (.work .zeroFirstUp2 pass bit)
  | .work .zeroFirstUp2 pass bit, _, _ => .exec .U (.work .zeroFirstRoot pass bit)
  | .work .zeroFirstRoot pass bit, _, _ => .exec .R (.work .zeroSecond pass bit)
  | .work .zeroSecond pass bit, .app, _ => .exec .L (.work .zeroSecondLeft pass bit)
  | .work .zeroSecondLeft pass bit, .s, _ => .exec .U (.work .zeroSecondParent pass bit)
  | .work .zeroSecondParent pass bit, _, _ => .exec .R (.work .zeroSecondRight pass bit)
  | .work .zeroSecondRight pass bit, .s, _ => .exec .U (.work .zeroSecondUp pass bit)
  | .work .zeroSecondUp pass bit, _, _ => .exec .U (.work .returning pass bit)
  | .work .returning pass bit, _, .root => .stay (.done pass bit)
  | .work .returning pass bit, _, .left => .exec .U (.work .returning pass bit)
  | .work .returning pass bit, _, .right => .exec .U (.work .returning pass bit)
  | .work _ _ _, _, _ => .stay .abort
  | .done .first bit, _, _ => .stay (.find .enter bit)
  | .done .second false, _, _ => .stay (.growth .enter)
  | .done .second true, _, _ => .stay .launch
  | .first .enter, .app, _ => .exec .L (.first .core)
  | .first .core, .app, _ => .exec .L (.first .left)
  | .first .left, .app, _ => .exec .L (.first .head)
  | .first .head, .s, _ => .exec .U (.first .back)
  | .first .head, .app, _ => .stay .restartGrowth
  | .first .back, _, _ => .exec .R (.work .scan .first false)
  | .first _, _, _ => .stay .abort
  | .find .enter bit, .app, _ => .exec .L (.find .scan bit)
  | .find .scan bit, .app, _ => .exec .L (.find .left bit)
  | .find .left bit, .app, _ => .exec .L (.find .head bit)
  | .find .head bit, .s, _ => .exec .U (.find .wrapperUp bit)
  | .find .wrapperUp bit, _, _ => .exec .U (.find .wrapperRoot bit)
  | .find .wrapperRoot bit, _, _ => .exec .R (.find .scan bit)
  | .find .head bit, .app, _ => .exec .U (.find .endpointUp bit)
  | .find .endpointUp bit, _, _ => .exec .U (.find .endpointRoot bit)
  | .find .endpointRoot bit, _, _ => .exec .R (.work .scan .second bit)
  | .find _ _, _, _ => .stay .abort
  | .growth stage, node, incoming =>
      liftGrowthCommand (Growth.machine.transition stage node incoming)
  | .restartGrowth, _, .root => .stay (.growth .enter)
  | .restartGrowth, _, .left => .exec .U .restartGrowth
  | .restartGrowth, _, .right => .exec .U .restartGrowth
  | .abort, _, .root => .stay .miss
  | .abort, _, .left => .exec .U .abort
  | .abort, _, .right => .exec .U .abort
  | .launch, _, _ => .stay .launch
  | .miss, _, _ => .stay .miss

def workStates : List Work :=
  [.scan, .left, .head, .branchParent, .branch, .positiveUp, .positiveRoot,
    .zeroFirstLeft, .zeroFirstParent, .zeroFirstRight, .zeroFirstUp1, .zeroFirstUp2,
    .zeroFirstRoot, .zeroSecond, .zeroSecondLeft, .zeroSecondParent, .zeroSecondRight,
    .zeroSecondUp, .returning]

def states : List Control :=
  workStates.flatMap (fun stage =>
    [.work stage .first false, .work stage .first true,
      .work stage .second false, .work stage .second true]) ++
  [.done .first false, .done .first true, .done .second false, .done .second true,
    .first .enter, .first .core, .first .left, .first .head, .first .back,
    .find .enter false, .find .enter true, .find .scan false, .find .scan true,
    .find .left false, .find .left true, .find .head false, .find .head true,
    .find .wrapperUp false, .find .wrapperUp true,
    .find .wrapperRoot false, .find .wrapperRoot true,
    .find .endpointUp false, .find .endpointUp true,
    .find .endpointRoot false, .find .endpointRoot true,
    .restartGrowth, .launch, .abort, .miss] ++
  RootResetClockGrowthWalker.states.map .growth

theorem mem_states (state : Control) : state ∈ states := by
  cases state with
  | work stage pass bit => cases stage <;> cases pass <;> cases bit <;> decide
  | done pass bit => cases pass <;> cases bit <;> decide
  | first stage => cases stage <;> decide
  | find stage bit => cases stage <;> cases bit <;> decide
  | growth stage => cases stage <;> decide
  | restartGrowth => decide
  | launch => decide
  | abort => decide
  | miss => decide

def machine : Machine Control := ⟨fun _ => states, mem_states, transition⟩

theorem states_length : machine.states.length = 122 := rfl

def initial (term : Term) : Configuration Control :=
  ⟨some (.first .enter), Cursor.atRoot term⟩

/-- Proof-level specification of the one parity bit. -/
def parity : Nat → Bool
  | 0 => false
  | number + 1 => !(parity number)

def xor (left right : Bool) : Bool := if right then !left else left

theorem xor_self (bit : Bool) : xor bit bit = false := by cases bit <;> rfl
theorem xor_complement (bit : Bool) : xor bit (!bit) = true := by cases bit <;> rfl
theorem xor_flip (left right : Bool) : xor (!left) right = xor left (!right) := by
  cases left <;> cases right <;> rfl
theorem xor_false (bit : Bool) : xor false bit = bit := by cases bit <;> rfl

def numeralParents : Nat → List ParentFrame → List ParentFrame
  | 0, parents => parents
  | number + 1, parents => numeralParents number (.right b :: parents)

theorem numeralParents_length (number : Nat) (parents : List ParentFrame) :
    (numeralParents number parents).length = number + parents.length := by
  induction number generalizing parents with
  | zero => exact (Nat.zero_add parents.length).symm
  | succ number ih =>
      rw [numeralParents, ih]
      exact (Nat.succ_add number parents.length).symm

theorem rebuild_numeralParents (number : Nat) (parents : List ParentFrame) :
    Cursor.rebuild (numeralParents number parents) (C 0) =
      Cursor.rebuild parents (C number) := by
  induction number generalizing parents with
  | zero => rfl
  | succ number ih =>
      rw [numeralParents, ih]
      rfl

theorem run_numeral_succ (pass : Pass) (bit : Bool) (number : Nat)
    (parents : List ParentFrame) :
    run machine 7 ⟨some (.work .scan pass bit), ⟨C (number + 1), parents⟩⟩ =
      ⟨some (.work .scan pass (!bit)), ⟨C number, .right b :: parents⟩⟩ := rfl

theorem run_numeral_zero (pass : Pass) (bit : Bool) (parents : List ParentFrame) :
    run machine 16 ⟨some (.work .scan pass bit), ⟨C 0, parents⟩⟩ =
      ⟨some (.work .returning pass bit), ⟨C 0, parents⟩⟩ := by
  simp only [run, step, machine, transition, C, b, Probe.observeNode,
    Primitive.exec, Cursor.left?, Cursor.right?, Cursor.up?, ParentFrame.fill]

theorem run_numeral_descent (pass : Pass) (bit : Bool) (number : Nat)
    (parents : List ParentFrame) :
    run machine (7 * number) ⟨some (.work .scan pass bit), ⟨C number, parents⟩⟩ =
      ⟨some (.work .scan pass (xor bit (parity number))),
        ⟨C 0, numeralParents number parents⟩⟩ := by
  induction number generalizing bit parents with
  | zero => cases bit <;> rfl
  | succ number ih =>
      rw [Nat.mul_succ, Nat.add_comm (7 * number) 7, run_add, run_numeral_succ, ih]
      rw [xor_flip]
      rfl

theorem run_returning (pass : Pass) (bit : Bool) (cursor : Cursor) :
    run machine (cursor.parents.length + 1) ⟨some (.work .returning pass bit), cursor⟩ =
      ⟨some (.done pass bit), Cursor.atRoot cursor.erase⟩ := by
  rcases cursor with ⟨focus, parents⟩
  induction parents generalizing focus with
  | nil => rfl
  | cons parent parents ih =>
      cases parent with
      | left sibling =>
          change run machine ((parents.length + 1) + 1)
            ⟨some (.work .returning pass bit), ⟨focus, .left sibling :: parents⟩⟩ = _
          rw [run_succ]
          exact ih (.app focus sibling)
      | right sibling =>
          change run machine ((parents.length + 1) + 1)
            ⟨some (.work .returning pass bit), ⟨focus, .right sibling :: parents⟩⟩ = _
          rw [run_succ]
          exact ih (.app sibling focus)

def numeralTicks (number depth : Nat) : Nat := 7 * number + (16 + (number + depth + 1))

/-- Exact unary parity and whole-root restoration for every containing cursor. -/
theorem run_numeral (pass : Pass) (bit : Bool) (number : Nat)
    (parents : List ParentFrame) :
    run machine (numeralTicks number parents.length)
        ⟨some (.work .scan pass bit), ⟨C number, parents⟩⟩ =
      ⟨some (.done pass (xor bit (parity number))),
        Cursor.atRoot (Cursor.rebuild parents (C number))⟩ := by
  rw [numeralTicks, run_add, run_numeral_descent, run_add, run_numeral_zero]
  rw [← numeralParents_length number parents]
  rw [run_returning pass (xor bit (parity number))
    ⟨C 0, numeralParents number parents⟩]
  change Configuration.mk _ (Cursor.atRoot
    (Cursor.rebuild (numeralParents number parents) (C 0))) = _
  rw [rebuild_numeralParents]

theorem run_numeral_atRoot (pass : Pass) (number : Nat) :
    run machine (numeralTicks number 0)
        ⟨some (.work .scan pass false), Cursor.atRoot (C number)⟩ =
      ⟨some (.done pass (parity number)), Cursor.atRoot (C number)⟩ := by
  simpa only [List.length_nil, xor_false, Cursor.rebuild] using!
    run_numeral pass false number []

/-- Every worker mismatch has an explicit root-restoring continuation. -/
theorem run_abort (cursor : Cursor) :
    run machine (cursor.parents.length + 1) ⟨some .abort, cursor⟩ =
      ⟨some .miss, Cursor.atRoot cursor.erase⟩ := by
  rcases cursor with ⟨focus, parents⟩
  induction parents generalizing focus with
  | nil => rfl
  | cons parent parents ih =>
      cases parent with
      | left sibling =>
          change run machine ((parents.length + 1) + 1)
            ⟨some .abort, ⟨focus, .left sibling :: parents⟩⟩ = _
          rw [run_succ]
          exact ih (.app focus sibling)
      | right sibling =>
          change run machine ((parents.length + 1) + 1)
            ⟨some .abort, ⟨focus, .right sibling :: parents⟩⟩ = _
          rw [run_succ]
          exact ih (.app sibling focus)

def liftGrowthRuntime : RuntimeControl Growth.Control → RuntimeControl Control
  | none => none
  | some state => some (.growth state)

def liftGrowthConfiguration (configuration : Configuration Growth.Control) :
    Configuration Control := ⟨liftGrowthRuntime configuration.control, configuration.cursor⟩

theorem transition_growth (state : Growth.Control) (node : Probe.NodeKind)
    (incoming : Probe.Incoming) :
    machine.transition (.growth state) node incoming =
      liftGrowthCommand (Growth.machine.transition state node incoming) := rfl

theorem step_liftGrowth (configuration : Configuration Growth.Control) :
    step machine (liftGrowthConfiguration configuration) =
      liftGrowthConfiguration (step Growth.machine configuration) := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      simp only [step, liftGrowthConfiguration, liftGrowthRuntime, transition_growth]
      generalize commandEq : Growth.machine.transition state
        (Probe.observeNode cursor) (Probe.observeIncoming cursor) = command
      cases command with
      | stay next => simp [liftGrowthCommand, liftGrowthRuntime]
      | reject => simp [liftGrowthCommand, liftGrowthRuntime]
      | exec primitive next =>
          cases moved : primitive.exec cursor <;>
            simp [liftGrowthCommand, liftGrowthRuntime, moved]

theorem run_liftGrowth (ticks : Nat) (configuration : Configuration Growth.Control) :
    run machine ticks (liftGrowthConfiguration configuration) =
      liftGrowthConfiguration (run Growth.machine ticks configuration) := by
  induction ticks generalizing configuration with
  | zero => rfl
  | succ ticks ih =>
      rw [run_succ, step_liftGrowth, ih]
      rfl

theorem mutationCount_zero (configuration : Configuration Control) :
    mutationCount machine configuration = 0 := by
  rcases configuration with ⟨runtime, cursor⟩
  cases runtime with
  | none => rfl
  | some state =>
      cases state with
      | work stage pass bit =>
          cases stage <;>
            cases nodeEq : Probe.observeNode cursor <;>
            cases incomingEq : Probe.observeIncoming cursor <;>
            simp only [mutationCount, machine, transition, nodeEq, incomingEq]
      | done pass bit =>
          cases pass <;> cases bit <;> rfl
      | first stage =>
          cases stage <;> cases nodeEq : Probe.observeNode cursor <;>
            simp only [mutationCount, machine, transition, nodeEq]
      | find stage bit =>
          cases stage <;> cases nodeEq : Probe.observeNode cursor <;>
            simp only [mutationCount, machine, transition, nodeEq]
      | growth stage =>
          cases stage <;> cases nodeEq : Probe.observeNode cursor <;>
            cases incomingEq : Probe.observeIncoming cursor <;>
            simp only [mutationCount, machine, transition, Growth.machine,
              RootResetClockGrowthWalker.machine, RootResetClockGrowthWalker.transition,
              liftGrowthCommand, nodeEq, incomingEq]
      | restartGrowth =>
          cases incomingEq : Probe.observeIncoming cursor <;>
            simp only [mutationCount, machine, transition, incomingEq]
      | launch => rfl
      | abort =>
          cases incomingEq : Probe.observeIncoming cursor <;>
            simp only [mutationCount, machine, transition, incomingEq]
      | miss => rfl

theorem runMutationCount_zero (ticks : Nat) (configuration : Configuration Control) :
    runMutationCount machine ticks configuration = 0 := by
  induction ticks generalizing configuration with
  | zero => rfl
  | succ ticks ih => rw [runMutationCount, mutationCount_zero, ih, Nat.zero_add]

theorem erase_run (ticks : Nat) (configuration : Configuration Control) :
    (run machine ticks configuration).cursor.erase = configuration.cursor.erase := by
  have projected := run_projects_stepsN machine ticks configuration
  rw [runMutationCount_zero] at projected
  exact (StepsN.eq_of_zero projected).symm

/-- A unary invocation either decodes its exact numeral or returns ordinary mismatch. -/
def WorkerAnswer (pass : Pass) (bit : Bool) (origin : Cursor)
    (final : Configuration Control) : Prop :=
  (∃ number, origin.focus = C number ∧
    final = ⟨some (.done pass (xor bit (parity number))), Cursor.atRoot origin.erase⟩) ∨
  final = ⟨some .miss, Cursor.atRoot origin.erase⟩

theorem worker_mismatch (pass : Pass) (bit : Bool) (origin : Cursor) (ticks : Nat)
    (failed : (run machine ticks ⟨some (.work .scan pass bit), origin⟩).control =
      some .abort) :
    ∃ total final,
      run machine total ⟨some (.work .scan pass bit), origin⟩ = final ∧
        WorkerAnswer pass bit origin final := by
  let after := run machine ticks ⟨some (.work .scan pass bit), origin⟩
  have afterEq : after = ⟨some .abort, after.cursor⟩ :=
    congrArg (fun control => Configuration.mk control after.cursor) failed
  refine ⟨ticks + (after.cursor.parents.length + 1),
    ⟨some .miss, Cursor.atRoot origin.erase⟩, ?_, Or.inr rfl⟩
  rw [run_add]
  change run machine (after.cursor.parents.length + 1) after = _
  rw [afterEq, run_abort]
  have preserved : after.cursor.erase = origin.erase := erase_run ticks _
  rw [preserved]

/-- Total literal unary recognition, including every malformed input tree. -/
theorem worker_complete (pass : Pass) (bit : Bool) (term : Term)
    (parents : List ParentFrame) :
    ∃ ticks final,
      run machine ticks ⟨some (.work .scan pass bit), ⟨term, parents⟩⟩ = final ∧
        WorkerAnswer pass bit ⟨term, parents⟩ final := by
  induction term generalizing bit parents with
  | s => exact worker_mismatch pass bit ⟨.s, parents⟩ 1 rfl
  | app fn tail fnIH tailIH =>
      cases fn with
      | s => exact worker_mismatch pass bit ⟨.app .s tail, parents⟩ 2 rfl
      | app head first =>
          cases head with
          | app left right =>
              exact worker_mismatch pass bit
                ⟨.app (.app (.app left right) first) tail, parents⟩ 3 rfl
          | s =>
              cases first with
              | s =>
                  obtain ⟨ticks, final, execution, answer⟩ :=
                    tailIH (!bit) (.right b :: parents)
                  refine ⟨7 + ticks, final, ?_, ?_⟩
                  · rw [run_add]
                    have enter : run machine 7
                        ⟨some (.work .scan pass bit), ⟨.app (.app .s .s) tail, parents⟩⟩ =
                        ⟨some (.work .scan pass (!bit)), ⟨tail, .right b :: parents⟩⟩ := rfl
                    rw [enter, execution]
                  · rcases answer with ⟨number, sourceEq, finalEq⟩ | mismatch
                    · refine Or.inl ⟨number + 1, ?_, ?_⟩
                      · change .app (.app .s .s) tail = C (number + 1)
                        rw [show tail = C number from sourceEq]
                        rfl
                      · rw [finalEq, xor_flip]
                        rfl
                    · exact Or.inr mismatch
              | app left right =>
                  cases left with
                  | app leftFn leftArg =>
                      apply worker_mismatch pass bit
                        ⟨.app (.app .s (.app (.app leftFn leftArg) right)) tail, parents⟩ 6
                      rfl
                  | s =>
                      cases right with
                      | app rightFn rightArg =>
                          apply worker_mismatch pass bit
                            ⟨.app (.app .s (.app .s (.app rightFn rightArg))) tail, parents⟩ 8
                          rfl
                      | s =>
                          cases tail with
                          | s =>
                              apply worker_mismatch pass bit ⟨.app (.app .s b) .s, parents⟩ 12
                              simp only [run, step, machine, transition, b, Probe.observeNode,
                                Primitive.exec, Cursor.left?, Cursor.right?, Cursor.up?,
                                ParentFrame.fill]
                          | app left right =>
                              cases left with
                              | app leftFn leftArg =>
                                  apply worker_mismatch pass bit
                                    ⟨.app (.app .s b) (.app (.app leftFn leftArg) right), parents⟩ 13
                                  simp only [run, step, machine, transition, b, Probe.observeNode,
                                    Primitive.exec, Cursor.left?, Cursor.right?, Cursor.up?,
                                    ParentFrame.fill]
                              | s =>
                                  cases right with
                                  | app rightFn rightArg =>
                                      apply worker_mismatch pass bit
                                        ⟨.app (.app .s b) (.app .s (.app rightFn rightArg)), parents⟩ 15
                                      simp only [run, step, machine, transition, b, Probe.observeNode,
                                        Primitive.exec, Cursor.left?, Cursor.right?, Cursor.up?,
                                        ParentFrame.fill]
                                  | s =>
                                      exact ⟨numeralTicks 0 parents.length,
                                        ⟨some (.done pass (xor bit (parity 0))),
                                          Cursor.atRoot (Cursor.rebuild parents (C 0))⟩,
                                        run_numeral pass bit 0 parents,
                                        Or.inl ⟨0, rfl, rfl⟩⟩

/-- Every non-numeral restores the exact original whole term on mismatch. -/
theorem malformed_numeral_restores (pass : Pass) (bit : Bool) (origin : Cursor)
    (malformed : ∀ number, origin.focus ≠ C number) :
    ∃ ticks, run machine ticks ⟨some (.work .scan pass bit), origin⟩ =
      ⟨some .miss, Cursor.atRoot origin.erase⟩ := by
  obtain ⟨ticks, final, execution, answer⟩ :=
    worker_complete pass bit origin.focus origin.parents
  rcases answer with ⟨number, sourceEq, _⟩ | mismatch
  · exact False.elim (malformed number sourceEq)
  · exact ⟨ticks, execution.trans mismatch⟩

def firstPassTicks (stage : Nat) : Nat := 5 + numeralTicks stage 3

theorem run_firstPass (stage : Nat) (body environment : Term) :
    run machine (firstPassTicks stage)
        (initial (.app (.app (.app .s (C stage)) body) environment)) =
      ⟨some (.done .first (parity stage)),
        Cursor.atRoot (.app (.app (.app .s (C stage)) body) environment)⟩ := by
  rw [firstPassTicks, run_add]
  have enter : run machine 5
      (initial (.app (.app (.app .s (C stage)) body) environment)) =
        ⟨some (.work .scan .first false),
          ⟨C stage, [.right .s, .left body, .left environment]⟩⟩ := rfl
  rw [enter]
  simpa only [List.length_cons, List.length_nil, xor_false,
    Cursor.rebuild, ParentFrame.fill] using
    run_numeral .first false stage [.right .s, .left body, .left environment]

theorem run_find_wrapper (bit : Bool) (field body : Term) (parents : List ParentFrame) :
    run machine 5 ⟨some (.find .scan bit), ⟨.app (.app .s field) body, parents⟩⟩ =
      ⟨some (.find .scan bit), ⟨body, .right (.app .s field) :: parents⟩⟩ := rfl

theorem run_find_clockWrap (bit : Bool) (stage wrappers : Nat) (endpoint : Term)
    (parents : List ParentFrame) :
    run machine (5 * wrappers)
        ⟨some (.find .scan bit), ⟨clockWrap stage wrappers endpoint, parents⟩⟩ =
      ⟨some (.find .scan bit),
        ⟨endpoint, RootResetClockGrowthWalker.clockParents stage wrappers parents⟩⟩ := by
  induction wrappers generalizing parents with
  | zero => rfl
  | succ wrappers ih =>
      rw [Nat.mul_succ, Nat.add_comm (5 * wrappers) 5, run_add,
        clockWrap, run_find_wrapper]
      exact ih _

theorem run_find_pair (bit : Bool) (number : Nat) (right : Term)
    (parents : List ParentFrame) :
    run machine 5 ⟨some (.find .scan bit), ⟨.app (C number) right, parents⟩⟩ =
      ⟨some (.work .scan .second bit), ⟨right, .right (C number) :: parents⟩⟩ := by
  cases number <;> rfl

theorem clockParents_length (stage wrappers : Nat) (parents : List ParentFrame) :
    (RootResetClockGrowthWalker.clockParents stage wrappers parents).length =
      wrappers + parents.length := by
  induction wrappers generalizing parents with
  | zero => exact (Nat.zero_add parents.length).symm
  | succ wrappers ih =>
      rw [RootResetClockGrowthWalker.clockParents, ih]
      exact (Nat.succ_add wrappers parents.length).symm

theorem rebuild_clockParents (stage wrappers : Nat) (body : Term)
    (parents : List ParentFrame) :
    Cursor.rebuild (RootResetClockGrowthWalker.clockParents stage wrappers parents) body =
      Cursor.rebuild parents (clockWrap stage wrappers body) := by
  induction wrappers generalizing parents with
  | zero => rfl
  | succ wrappers ih =>
      rw [RootResetClockGrowthWalker.clockParents, ih]
      rfl

def secondPassTicks (number wrappers : Nat) : Nat :=
  1 + (5 * wrappers + (5 + numeralTicks number (wrappers + 2)))

theorem run_secondPass (bit : Bool) (stage wrappers leftNumber rightNumber : Nat)
    (environment : Term) :
    run machine (secondPassTicks rightNumber wrappers)
        ⟨some (.find .enter bit),
          Cursor.atRoot (.app (clockWrap stage wrappers
            (.app (C leftNumber) (C rightNumber))) environment)⟩ =
      ⟨some (.done .second (xor bit (parity rightNumber))),
        Cursor.atRoot (.app (clockWrap stage wrappers
          (.app (C leftNumber) (C rightNumber))) environment)⟩ := by
  rw [secondPassTicks, run_add]
  have enter : run machine 1
      ⟨some (.find .enter bit),
        Cursor.atRoot (.app (clockWrap stage wrappers
          (.app (C leftNumber) (C rightNumber))) environment)⟩ =
      ⟨some (.find .scan bit),
        ⟨clockWrap stage wrappers (.app (C leftNumber) (C rightNumber)),
          [.left environment]⟩⟩ := rfl
  rw [enter, run_add, run_find_clockWrap, run_add, run_find_pair]
  have depthEq :
      (.right (C leftNumber) ::
        RootResetClockGrowthWalker.clockParents stage wrappers [.left environment]).length =
        wrappers + 2 := by
    rw [List.length_cons, clockParents_length]
    rfl
  rw [← depthEq, run_numeral]
  change Configuration.mk _ (Cursor.atRoot
    (Cursor.rebuild (RootResetClockGrowthWalker.clockParents stage wrappers
      [.left environment]) (.app (C leftNumber) (C rightNumber)))) = _
  rw [rebuild_clockParents]
  rfl

def growthControl : Nat → Growth.Control
  | 0 => .zero
  | _ + 1 => .positive

theorem run_growth_generated (stage wrappers residual : Nat) (environment : Term) :
    run machine (1 + (5 * wrappers + 8))
        ⟨some (.growth .enter),
          Cursor.atRoot (.app (clockGrowthCore stage wrappers residual) environment)⟩ =
      ⟨some (.growth (growthControl residual)),
        ⟨.app (C residual) (C stage),
          RootResetClockGrowthWalker.clockParents stage wrappers [.left environment]⟩⟩ := by
  change run machine (1 + (5 * wrappers + 8))
    (liftGrowthConfiguration (RootResetClockGrowthWalker.initial
      (.app (clockGrowthCore stage wrappers residual) environment))) = _
  rw [run_liftGrowth]
  cases residual with
  | zero => rw [RootResetClockGrowthWalker.run_generated_zero]; rfl
  | succ residual => rw [RootResetClockGrowthWalker.run_generated_positive]; rfl

def growthTicks (stage wrappers : Nat) : Nat :=
  firstPassTicks stage +
    (1 + (secondPassTicks stage wrappers + (1 + (1 + (5 * wrappers + 8)))))

/-- Constructor-level parity equality selects growth at every positive wrapper depth. -/
theorem run_generated_growth (stage wrappers residual : Nat) (environment : Term) :
    run machine (growthTicks stage (wrappers + 1))
        (initial (.app (clockGrowthCore stage (wrappers + 1) residual) environment)) =
      ⟨some (.growth (growthControl residual)),
        ⟨.app (C residual) (C stage),
          RootResetClockGrowthWalker.clockParents stage (wrappers + 1)
            [.left environment]⟩⟩ := by
  rw [growthTicks, run_add]
  change run machine (1 + (secondPassTicks stage (wrappers + 1) +
    (1 + (1 + (5 * (wrappers + 1) + 8)))))
    (run machine (firstPassTicks stage)
      (initial (.app (.app (.app .s (C stage))
        (clockWrap stage wrappers (.app (C residual) (C stage)))) environment))) = _
  rw [run_firstPass, run_add]
  change run machine (secondPassTicks stage (wrappers + 1) +
      (1 + (1 + (5 * (wrappers + 1) + 8))))
    ⟨some (.find .enter (parity stage)), Cursor.atRoot
      (.app (clockWrap stage (wrappers + 1) (.app (C residual) (C stage))) environment)⟩ = _
  rw [run_add, run_secondPass, xor_self, run_add]
  exact run_growth_generated stage (wrappers + 1) residual environment

theorem clockWrappers_eq_clockWrap (stage wrappers : Nat) :
    clockWrappers stage wrappers = clockWrap stage wrappers (clockBase stage) := by
  induction wrappers with
  | zero => rfl
  | succ wrappers ih => rw [clockWrappers, clockWrap, ih]

def launchTicks (stage wrappers : Nat) : Nat :=
  firstPassTicks stage + (1 + (secondPassTicks (stage + 1) wrappers + 1))

/-- Successor parity selects the launch root on every generated launch term. -/
theorem run_generated_launch (stage wrappers : Nat) (environment : Term) :
    run machine (launchTicks stage (wrappers + 1))
        (initial (.app (clockWrappers stage (wrappers + 1)) environment)) =
      ⟨some .launch,
        Cursor.atRoot (.app (clockWrappers stage (wrappers + 1)) environment)⟩ := by
  rw [launchTicks, run_add]
  change run machine (1 + (secondPassTicks (stage + 1) (wrappers + 1) + 1))
    (run machine (firstPassTicks stage)
      (initial (.app (.app (.app .s (C stage))
        (clockWrappers stage wrappers)) environment))) = _
  rw [run_firstPass, run_add]
  change run machine (secondPassTicks (stage + 1) (wrappers + 1) + 1)
    ⟨some (.find .enter (parity stage)),
      Cursor.atRoot (.app (clockWrappers stage (wrappers + 1)) environment)⟩ = _
  rw [clockWrappers_eq_clockWrap]
  change run machine (secondPassTicks (stage + 1) (wrappers + 1) + 1)
    ⟨some (.find .enter (parity stage)), Cursor.atRoot
      (.app (clockWrap stage (wrappers + 1)
        (.app (C (stage + 1)) (C (stage + 1)))) environment)⟩ = _
  rw [run_add, run_secondPass, parity, xor_complement]
  rfl

theorem generated_growth_address (stage wrappers residual : Nat) (environment : Term) :
    cursorAddress (run machine (growthTicks stage (wrappers + 1))
      (initial (.app (clockGrowthCore stage (wrappers + 1) residual) environment))).cursor =
      .left :: RootResetClockFuelStages.rights (wrappers + 1) := by
  rw [run_generated_growth]
  change addressFromParents
    (RootResetClockGrowthWalker.clockParents stage (wrappers + 1) [.left environment]) = _
  rw [RootResetClockGrowthWalker.clockParents_address]
  rfl

theorem generated_launch_address (stage wrappers : Nat) (environment : Term) :
    cursorAddress (run machine (launchTicks stage (wrappers + 1))
      (initial (.app (clockWrappers stage (wrappers + 1)) environment))).cursor = [] := by
  rw [run_generated_launch]
  rfl

theorem generated_growth_contracts (stage wrappers residual : Nat) (environment : Term) :
    ∃ target, (run machine (growthTicks stage (wrappers + 1))
      (initial (.app (clockGrowthCore stage (wrappers + 1) residual) environment))).cursor.rdx? =
      some target := by
  rw [run_generated_growth]
  cases residual with
  | zero => exact ⟨_, rfl⟩
  | succ residual => exact ⟨_, rfl⟩

theorem generated_launch_contracts (stage wrappers : Nat) (environment : Term) :
    (run machine (launchTicks stage (wrappers + 1))
      (initial (.app (clockWrappers stage (wrappers + 1)) environment))).cursor.rdx? =
      some (Cursor.atRoot (.app (.app (C stage) environment)
        (.app (clockWrappers stage wrappers) environment))) := by
  rw [run_generated_launch]
  rfl

theorem clockParents_eq_wrapperParents (stage wrappers : Nat)
    (parents : List ParentFrame) :
    RootResetClockGrowthWalker.clockParents stage wrappers parents =
      PrimitiveClock.wrapperParents stage wrappers parents := by
  induction wrappers generalizing parents with
  | zero => rfl
  | succ wrappers ih =>
      rw [RootResetClockGrowthWalker.clockParents, PrimitiveClock.wrapperParents]
      exact ih _

/-- The selected positive cursor is the persistent scheduler's exact source cursor. -/
theorem generated_positive_schedulerCursor (program : CTS.Program)
    (dispatcher : ActionDispatcher program) (registers : SchedulerControl.Registers program)
    (stage wrappers remaining : Nat) (environment : Term) :
    (run machine (growthTicks stage (wrappers + 1))
      (initial (.app (clockGrowthCore stage (wrappers + 1) (remaining + 1)) environment))).cursor =
      (positiveClockSourceConfiguration program dispatcher registers
        stage (wrappers + 1) remaining [.left environment]).cursor := by
  rw [run_generated_growth]
  change Cursor.mk _ (RootResetClockGrowthWalker.clockParents
    stage (wrappers + 1) [.left environment]) = _
  rw [clockParents_eq_wrapperParents]
  rfl

theorem generated_zero_schedulerCursor (program : CTS.Program)
    (dispatcher : ActionDispatcher program) (registers : SchedulerControl.Registers program)
    (stage wrappers : Nat) (environment : Term) :
    (run machine (growthTicks stage (wrappers + 1))
      (initial (.app (clockGrowthCore stage (wrappers + 1) 0) environment))).cursor =
      (zeroClockSourceConfiguration program dispatcher registers
        stage (wrappers + 1) [.left environment]).cursor := by
  rw [run_generated_growth]
  change Cursor.mk _ (RootResetClockGrowthWalker.clockParents
    stage (wrappers + 1) [.left environment]) = _
  rw [clockParents_eq_wrapperParents]
  rfl

theorem generated_launch_schedulerCursor (stage wrappers : Nat) (environment : Term) :
    (run machine (launchTicks stage (wrappers + 1))
      (initial (.app (clockWrappers stage (wrappers + 1)) environment))).cursor =
      SchedulerJobHandoff.continuationCursorAt stage wrappers environment [] := by
  rw [run_generated_launch]
  rfl

theorem generated_launch_schedulerTarget (program : CTS.Program)
    (dispatcher : ActionDispatcher program) (stage wrappers : Nat) (environment : Term) :
    (run machine (launchTicks stage (wrappers + 1))
      (initial (.app (clockWrappers stage (wrappers + 1)) environment))).cursor.rdx? =
      some (SchedulerJobHandoff.launchConfigurationAt program dispatcher
        stage wrappers environment []).cursor := by
  rw [generated_launch_contracts]
  rfl

end PureSFormal.Research.RootResetClockParityWalker
