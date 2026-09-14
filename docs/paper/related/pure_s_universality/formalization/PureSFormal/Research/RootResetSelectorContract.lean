import PureSFormal.PureS.FiniteController
import PureSFormal.PureS.CarrierDecoder

/-!
# Term-only root-reset selector contract

The contract fixes one finite controller and restarts it at the root in one
distinguished control state for every invocation.  Its operational transition
table receives exactly the current node kind and incoming side.  The table can
stay in place, move through one left, right, or parent edge, issue the verified
focused contraction primitive, or reject.

The interpreter may use the certified stopping time to define a total Lean
function.  During an invocation the controller configuration contains its
finite control and one occurrence-tree cursor.  No cursor, address, stopping
counter, fuel, phase, or control datum survives between invocations: every
invocation receives only the current bare term and constructs a fresh cursor
at its root.  A successful result carries an address at which
`Term.contractAt?` succeeds.  An `nf` result carries the address-wise
normal-form proposition.
-/

namespace PureSFormal.Research.RootResetSelectorContract

open PureSFormal.PureS
open PureSFormal.PureS.FiniteController

/-- No occurrence address of `term` admits a pure-S contraction. -/
def AddressNormal (term : Term) : Prop :=
  ∀ address : Address, term.contractAt? address = none

/-- A total selector answer, indexed by the current bare term. -/
inductive Outcome (term : Term) where
  | nf (normal : AddressNormal term)
  | redex (address : Address) (target : Term)
      (contracts : term.contractAt? address = some target)

/-- The two terminal meanings of a selector controller. -/
inductive HaltKind where
  | nf
  | redex
  deriving BEq, DecidableEq, Inhabited, Repr

/-- Root-relative address represented by a nearest-parent-first zipper stack. -/
def addressFromParents : List ParentFrame → Address
  | [] => []
  | frame :: parents => addressFromParents parents ++ [frame.side]

/-- Root-relative address of the focused occurrence. -/
def cursorAddress (cursor : Cursor) : Address :=
  addressFromParents cursor.parents

/-- Lookup through the address represented by a zipper reaches its focus. -/
theorem subterm?_erase_cursorAddress : ∀ (cursor : Cursor),
    cursor.erase.subterm? (cursorAddress cursor) = some cursor.focus := by
  intro cursor
  rcases cursor with ⟨focus, parents⟩
  induction parents generalizing focus with
  | nil => simp [Cursor.erase, Cursor.rebuild, cursorAddress,
      addressFromParents, Term.subterm?]
  | cons frame parents ih =>
      change (Cursor.rebuild parents (frame.fill focus)).subterm?
          (addressFromParents parents ++ [frame.side]) = some focus
      rw [CarrierDecoder.subterm?_append]
      have parentLookup := ih (frame.fill focus)
      have parentLookup' :
          (Cursor.rebuild parents (frame.fill focus)).subterm?
              (addressFromParents parents) = some (frame.fill focus) := by
        simpa [Cursor.erase, cursorAddress] using parentLookup
      rw [parentLookup']
      cases frame <;>
        simp [ParentFrame.fill, ParentFrame.side, Term.subterm?]

/-! ## Cursor-address contraction -/

/-- Root-relative address of the hole in an ordinary one-hole context. -/
def contextAddress : Context → Address
  | .hole => []
  | .appLeft context _ => .left :: contextAddress context
  | .appRight _ context => .right :: contextAddress context

/-- Replacing the hole occurrence fills the same context. -/
theorem context_replace?_plug (context : Context) (source replacement : Term) :
    (context.plug source).replace? (contextAddress context) replacement =
      some (context.plug replacement) := by
  induction context with
  | hole => simp [contextAddress, Term.replace?]
  | appLeft context right ih =>
      simp [Context.plug, contextAddress, Term.replace?, ih]
  | appRight left context ih =>
      simp [Context.plug, contextAddress, Term.replace?, ih]

/-- Context surrounding a zipper focus. -/
def surroundingContext : List ParentFrame → Context
  | [] => .hole
  | .left rightSibling :: parents =>
      (surroundingContext parents).comp (.appLeft .hole rightSibling)
  | .right leftSibling :: parents =>
      (surroundingContext parents).comp (.appRight leftSibling .hole)

@[simp]
theorem surroundingContext_plug (parents : List ParentFrame) (focus : Term) :
    (surroundingContext parents).plug focus = Cursor.rebuild parents focus := by
  induction parents generalizing focus with
  | nil => rfl
  | cons frame parents ih =>
      cases frame <;>
        simp [surroundingContext, Context.plug_comp, Cursor.rebuild, ih]

/-- Hole addresses compose by list append. -/
theorem contextAddress_comp (outer inner : Context) :
    contextAddress (outer.comp inner) =
      contextAddress outer ++ contextAddress inner := by
  induction outer with
  | hole => rfl
  | appLeft context right ih =>
      simp [Context.comp, contextAddress, ih]
  | appRight left context ih =>
      simp [Context.comp, contextAddress, ih]

@[simp]
theorem surroundingContext_address (parents : List ParentFrame) :
    contextAddress (surroundingContext parents) = addressFromParents parents := by
  induction parents with
  | nil => rfl
  | cons frame parents ih =>
      cases frame <;>
        simp [surroundingContext, contextAddress_comp, contextAddress,
          addressFromParents, ih]

/-- Address replacement through a cursor rebuild changes exactly its focus. -/
theorem replace?_erase_cursorAddress (cursor : Cursor) (replacement : Term) :
    cursor.erase.replace? (cursorAddress cursor) replacement =
      some (Cursor.rebuild cursor.parents replacement) := by
  rcases cursor with ⟨focus, parents⟩
  change (Cursor.rebuild parents focus).replace?
      (addressFromParents parents) replacement =
    some (Cursor.rebuild parents replacement)
  rw [← surroundingContext_plug parents focus,
    ← surroundingContext_address parents]
  simpa only [surroundingContext_plug] using
    context_replace?_plug (surroundingContext parents) focus replacement

/-- Contracting at a cursor address is exactly focused root contraction. -/
theorem contractAt?_cursorAddress (cursor : Cursor) :
    cursor.erase.contractAt? (cursorAddress cursor) =
      cursor.focus.contractRoot?.map
        (fun replacement => Cursor.rebuild cursor.parents replacement) := by
  unfold Term.contractAt?
  simp only [subterm?_erase_cursorAddress]
  cases hroot : cursor.focus.contractRoot? with
  | none => simp [hroot]
  | some replacement =>
      simp [hroot, replace?_erase_cursorAddress]

/-- One microinstruction's number of issued `L`, `R`, or `U` movement attempts. -/
def moveCount (machine : Machine Control)
    (configuration : Configuration Control) : Nat :=
  match configuration.control with
  | none => 0
  | some control =>
      match machine.transition control
          (Probe.observeNode configuration.cursor)
          (Probe.observeIncoming configuration.cursor) with
      | .exec .L _ | .exec .R _ | .exec .U _ => 1
      | .exec .Rdx _ | .stay _ | .reject => 0

/-- Movement instructions issued by the first `ticks` controller microinstructions. -/
def runMoveCount (machine : Machine Control) :
    Nat → Configuration Control → Nat
  | 0, _ => 0
  | ticks + 1, configuration =>
      moveCount machine configuration +
        runMoveCount machine ticks
          (FiniteController.step machine configuration)

@[simp]
theorem runMoveCount_zero (machine : Machine Control)
    (configuration : Configuration Control) :
    runMoveCount machine 0 configuration = 0 :=
  rfl

@[simp]
theorem runMoveCount_succ (machine : Machine Control) (ticks : Nat)
    (configuration : Configuration Control) :
    runMoveCount machine (ticks + 1) configuration =
      moveCount machine configuration +
        runMoveCount machine ticks
          (FiniteController.step machine configuration) :=
  rfl

/-- Every microinstruction issues at most one movement instruction. -/
theorem moveCount_le_one (machine : Machine Control)
    (configuration : Configuration Control) :
    moveCount machine configuration ≤ 1 := by
  rcases configuration with ⟨control, cursor⟩
  cases control with
  | none => exact Nat.zero_le 1
  | some control =>
      generalize hcommand : machine.transition control
        (Probe.observeNode cursor) (Probe.observeIncoming cursor) = command
      cases command with
      | stay next => simp [moveCount, hcommand]
      | reject => simp [moveCount, hcommand]
      | exec primitive next => cases primitive <;> simp [moveCount, hcommand]

/-- Issued movement instructions are bounded by executed microinstructions. -/
theorem runMoveCount_le_ticks (machine : Machine Control) :
    ∀ (ticks : Nat) (configuration : Configuration Control),
      runMoveCount machine ticks configuration ≤ ticks := by
  intro ticks
  induction ticks with
  | zero => intro configuration; exact Nat.le_refl 0
  | succ ticks ih =>
      intro configuration
      simp only [runMoveCount_succ]
      simpa [Nat.add_comm] using
        Nat.add_le_add (moveCount_le_one machine configuration)
          (ih (FiniteController.step machine configuration))

/-! ## Successful occurrence-tree traversal count -/

/--
One microinstruction's number of successful one-edge occurrence-tree
traversals.  An issued `L`, `R`, or `U` contributes one exactly when its
`Primitive.exec` call succeeds.  `Rdx`, stationary instructions, rejection,
and movement failures contribute zero.
-/
def successfulEdgeMoveCount (machine : Machine Control)
    (configuration : Configuration Control) : Nat :=
  match configuration.control with
  | none => 0
  | some control =>
      match machine.transition control
          (Probe.observeNode configuration.cursor)
          (Probe.observeIncoming configuration.cursor) with
      | .exec primitive _ =>
          match primitive with
          | .L | .R | .U =>
              match primitive.exec configuration.cursor with
              | some _ => 1
              | none => 0
          | .Rdx => 0
      | .stay _ | .reject => 0

/-- Successful edge traversals made during the first `ticks` microinstructions. -/
def runSuccessfulEdgeMoveCount (machine : Machine Control) :
    Nat → Configuration Control → Nat
  | 0, _ => 0
  | ticks + 1, configuration =>
      successfulEdgeMoveCount machine configuration +
        runSuccessfulEdgeMoveCount machine ticks
          (FiniteController.step machine configuration)

@[simp]
theorem runSuccessfulEdgeMoveCount_zero (machine : Machine Control)
    (configuration : Configuration Control) :
    runSuccessfulEdgeMoveCount machine 0 configuration = 0 :=
  rfl

@[simp]
theorem runSuccessfulEdgeMoveCount_succ (machine : Machine Control)
    (ticks : Nat) (configuration : Configuration Control) :
    runSuccessfulEdgeMoveCount machine (ticks + 1) configuration =
      successfulEdgeMoveCount machine configuration +
        runSuccessfulEdgeMoveCount machine ticks
          (FiniteController.step machine configuration) :=
  rfl

/--
The one-step count is one exactly for a successfully executed `L`, `R`, or
`U` instruction.
-/
theorem successfulEdgeMoveCount_eq_one_iff (machine : Machine Control)
    (configuration : Configuration Control) :
    successfulEdgeMoveCount machine configuration = 1 ↔
      ∃ control next primitive target,
        configuration.control = some control ∧
        machine.transition control
            (Probe.observeNode configuration.cursor)
            (Probe.observeIncoming configuration.cursor) =
          .exec primitive next ∧
        (primitive = .L ∨ primitive = .R ∨ primitive = .U) ∧
        primitive.exec configuration.cursor = some target := by
  rcases configuration with ⟨runtime, cursor⟩
  change successfulEdgeMoveCount machine ⟨runtime, cursor⟩ = 1 ↔
    ∃ control next primitive target,
      runtime = some control ∧
      machine.transition control (Probe.observeNode cursor)
          (Probe.observeIncoming cursor) = .exec primitive next ∧
      (primitive = .L ∨ primitive = .R ∨ primitive = .U) ∧
      primitive.exec cursor = some target
  constructor
  · intro counted
    cases runtime with
    | none =>
        change 0 = 1 at counted
        exact Nat.noConfusion counted
    | some control =>
        generalize hcommand : machine.transition control
          (Probe.observeNode cursor) (Probe.observeIncoming cursor) = command
        unfold successfulEdgeMoveCount at counted
        dsimp only [Configuration.control, Configuration.cursor] at counted
        rw [hcommand] at counted
        cases command with
        | stay next =>
            change 0 = 1 at counted
            exact Nat.noConfusion counted
        | reject =>
            change 0 = 1 at counted
            exact Nat.noConfusion counted
        | exec primitive next =>
            cases primitive with
            | L =>
                change (match Primitive.L.exec cursor with
                  | some _ => 1
                  | none => 0) = 1 at counted
                cases hmove : Primitive.L.exec cursor with
                | none =>
                    rw [hmove] at counted
                    exact Nat.noConfusion counted
                | some target =>
                    exact ⟨control, next, .L, target, rfl, hcommand,
                      Or.inl rfl, hmove⟩
            | R =>
                change (match Primitive.R.exec cursor with
                  | some _ => 1
                  | none => 0) = 1 at counted
                cases hmove : Primitive.R.exec cursor with
                | none =>
                    rw [hmove] at counted
                    exact Nat.noConfusion counted
                | some target =>
                    exact ⟨control, next, .R, target, rfl, hcommand,
                      Or.inr (Or.inl rfl), hmove⟩
            | U =>
                change (match Primitive.U.exec cursor with
                  | some _ => 1
                  | none => 0) = 1 at counted
                cases hmove : Primitive.U.exec cursor with
                | none =>
                    rw [hmove] at counted
                    exact Nat.noConfusion counted
                | some target =>
                    exact ⟨control, next, .U, target, rfl, hcommand,
                      Or.inr (Or.inr rfl), hmove⟩
            | Rdx =>
                change 0 = 1 at counted
                exact Nat.noConfusion counted
  · rintro ⟨control, next, primitive, target, runtimeEq, commandEq,
      movement, moved⟩
    cases runtime with
    | none => cases runtimeEq
    | some actual =>
        have controlEq : actual = control := Option.some.inj runtimeEq
        subst control
        rcases movement with left | rightOrUp
        · subst primitive
          unfold successfulEdgeMoveCount
          dsimp only [Configuration.control, Configuration.cursor]
          rw [commandEq]
          change (match Primitive.L.exec cursor with
            | some _ => 1
            | none => 0) = 1
          rw [moved]
        · rcases rightOrUp with right | up
          · subst primitive
            unfold successfulEdgeMoveCount
            dsimp only [Configuration.control, Configuration.cursor]
            rw [commandEq]
            change (match Primitive.R.exec cursor with
              | some _ => 1
              | none => 0) = 1
            rw [moved]
          · subst primitive
            unfold successfulEdgeMoveCount
            dsimp only [Configuration.control, Configuration.cursor]
            rw [commandEq]
            change (match Primitive.U.exec cursor with
              | some _ => 1
              | none => 0) = 1
            rw [moved]

/-- A successful traversal is charged only by an issued movement instruction. -/
theorem successfulEdgeMoveCount_le_moveCount (machine : Machine Control)
    (configuration : Configuration Control) :
    successfulEdgeMoveCount machine configuration ≤
      moveCount machine configuration := by
  rcases configuration with ⟨control, cursor⟩
  cases control with
  | none => exact Nat.le_refl 0
  | some control =>
      generalize hcommand : machine.transition control
        (Probe.observeNode cursor) (Probe.observeIncoming cursor) = command
      cases command with
      | stay next => simp [successfulEdgeMoveCount, moveCount, hcommand]
      | reject => simp [successfulEdgeMoveCount, moveCount, hcommand]
      | exec primitive next =>
          cases primitive with
          | L =>
              cases hmove : Primitive.L.exec cursor <;>
                simp [successfulEdgeMoveCount, moveCount, hcommand, hmove]
          | R =>
              cases hmove : Primitive.R.exec cursor <;>
                simp [successfulEdgeMoveCount, moveCount, hcommand, hmove]
          | U =>
              cases hmove : Primitive.U.exec cursor <;>
                simp [successfulEdgeMoveCount, moveCount, hcommand, hmove]
          | Rdx => simp [successfulEdgeMoveCount, moveCount, hcommand]

/-- Per microstep, successful traversals are bounded by attempts, then by one. -/
theorem successfulEdgeMoveCount_le_moveCount_le_one
    (machine : Machine Control) (configuration : Configuration Control) :
    successfulEdgeMoveCount machine configuration ≤
        moveCount machine configuration ∧
      moveCount machine configuration ≤ 1 :=
  ⟨successfulEdgeMoveCount_le_moveCount machine configuration,
    moveCount_le_one machine configuration⟩

/-- Successful traversals in a run are bounded by issued movement instructions. -/
theorem runSuccessfulEdgeMoveCount_le_runMoveCount
    (machine : Machine Control) :
    ∀ (ticks : Nat) (configuration : Configuration Control),
      runSuccessfulEdgeMoveCount machine ticks configuration ≤
        runMoveCount machine ticks configuration := by
  intro ticks
  induction ticks with
  | zero => intro configuration; exact Nat.le_refl 0
  | succ ticks ih =>
      intro configuration
      simp only [runSuccessfulEdgeMoveCount_succ, runMoveCount_succ]
      exact Nat.add_le_add
        (successfulEdgeMoveCount_le_moveCount machine configuration)
        (ih (FiniteController.step machine configuration))

/--
For every finite run, successful traversals are bounded by issued movement
instructions, which in turn are bounded by the run's microinstruction count.
-/
theorem runSuccessfulEdgeMoveCount_le_runMoveCount_le_ticks
    (machine : Machine Control) (ticks : Nat)
    (configuration : Configuration Control) :
    runSuccessfulEdgeMoveCount machine ticks configuration ≤
        runMoveCount machine ticks configuration ∧
      runMoveCount machine ticks configuration ≤ ticks :=
  ⟨runSuccessfulEdgeMoveCount_le_runMoveCount machine ticks configuration,
    runMoveCount_le_ticks machine ticks configuration⟩

/-- Successful one-edge traversals are bounded by executed microinstructions. -/
theorem runSuccessfulEdgeMoveCount_le_ticks (machine : Machine Control)
    (ticks : Nat) (configuration : Configuration Control) :
    runSuccessfulEdgeMoveCount machine ticks configuration ≤ ticks :=
  Nat.le_trans
    (runSuccessfulEdgeMoveCount_le_runMoveCount machine ticks configuration)
    (runMoveCount_le_ticks machine ticks configuration)

/-- Runtime terminal tag attached only to an ordinary finite-control state. -/
def runtimeHaltKind (haltKind : Control → Option HaltKind) :
    RuntimeControl Control → Option HaltKind
  | none => none
  | some control => haltKind control

/--
One fixed term-only root-reset selector with an all-input linear certificate.
The proof-level stopping time defines execution but is absent from the
controller configuration and transition function.
-/
structure Contract where
  Control : Type
  machine : Machine Control
  start : Control
  haltKind : Control → Option HaltKind
  coefficient : Nat
  coefficient_pos : 0 < coefficient
  stoppingTime : Term → Nat
  outcome : (term : Term) → Outcome term
  stoppingTime_le : ∀ term,
    stoppingTime term ≤ coefficient * (term.size + 1)
  terminal : ∀ term,
    let final := FiniteController.run machine (stoppingTime term)
      ⟨some start, Cursor.atRoot term⟩
    (runtimeHaltKind haltKind final.control).isSome = true
  terminal_absorbing : ∀ control node incoming,
    (haltKind control).isSome = true →
      machine.transition control node incoming = .stay control
  outcome_agrees : ∀ term,
    let final := FiniteController.run machine (stoppingTime term)
      ⟨some start, Cursor.atRoot term⟩
    match outcome term with
    | .nf _ =>
        runtimeHaltKind haltKind final.control = some .nf ∧
          final.cursor.erase = term
    | .redex address target _ =>
        runtimeHaltKind haltKind final.control = some .redex ∧
          cursorAddress final.cursor = address ∧
          final.cursor.erase = target
  mutationCount_agrees : ∀ term,
    match outcome term with
    | .nf _ =>
        FiniteController.runMutationCount machine (stoppingTime term)
          ⟨some start, Cursor.atRoot term⟩ = 0
    | .redex _ _ _ =>
        FiniteController.runMutationCount machine (stoppingTime term)
          ⟨some start, Cursor.atRoot term⟩ = 1

namespace Contract

/-- Every invocation has the identical finite control and root position. -/
def initial (contract : Contract) (term : Term) :
    Configuration contract.Control :=
  ⟨some contract.start, Cursor.atRoot term⟩

/-- No runtime datum crosses an invocation boundary. -/
abbrev InterInvocationState (_contract : Contract) := Unit

/-- Full concrete run of one fresh invocation; the boundary value is erased. -/
def invokeRun (contract : Contract)
    (_boundary : contract.InterInvocationState) (term : Term) :
    Configuration contract.Control :=
  FiniteController.run contract.machine (contract.stoppingTime term)
    (contract.initial term)

/-- Dependent answer of one fresh invocation; the boundary value is erased. -/
def invoke (contract : Contract)
    (_boundary : contract.InterInvocationState) (term : Term) : Outcome term :=
  contract.outcome term

/-- The selector is definitionally a function of the current bare term. -/
def select (contract : Contract) (term : Term) : Outcome term :=
  contract.outcome term

/-- Identical bare terms receive identical selector results. -/
theorem select_congr (contract : Contract) {first second : Term}
    (h : first = second) : HEq (contract.select first) (contract.select second) := by
  subst second
  rfl

/-- Every selector answer exposes its defining normality or contraction fact. -/
theorem select_spec (contract : Contract) (term : Term) :
    match contract.select term with
    | .nf _normal => AddressNormal term
    | .redex address target _ =>
        term.contractAt? address = some target := by
  cases h : contract.select term with
  | nf normal => exact normal
  | redex address target contracts => exact contracts

/-- Terminal controls remain unchanged for every cursor observation. -/
theorem terminal_step_absorbing (contract : Contract) {control : contract.Control}
    (cursor : Cursor) (halted : (contract.haltKind control).isSome = true) :
    FiniteController.step contract.machine ⟨some control, cursor⟩ =
      ⟨some control, cursor⟩ := by
  simp only [FiniteController.step]
  rw [contract.terminal_absorbing control
    (Probe.observeNode cursor) (Probe.observeIncoming cursor) halted]

/-- No between-invocation value can affect the full concrete run. -/
theorem invokeRun_state_independent (contract : Contract)
    (first second : contract.InterInvocationState) (term : Term) :
    contract.invokeRun first term = contract.invokeRun second term := by
  cases first
  cases second
  rfl

/-- No between-invocation value can affect the dependent selector answer. -/
theorem invoke_state_independent (contract : Contract)
    (first second : contract.InterInvocationState) (term : Term) :
    contract.invoke first term = contract.invoke second term := by
  cases first
  cases second
  rfl

/-- The certified run performs exactly the mutation count of its answer case. -/
theorem exact_mutation_count (contract : Contract) (term : Term) :
    match contract.select term with
    | .nf _ =>
        FiniteController.runMutationCount contract.machine
          (contract.stoppingTime term) (contract.initial term) = 0
    | .redex _ _ _ =>
        FiniteController.runMutationCount contract.machine
          (contract.stoppingTime term) (contract.initial term) = 1 := by
  simpa only [select, initial] using contract.mutationCount_agrees term

/-- The certified invocation halts within the declared linear microstep bound. -/
theorem halts_within (contract : Contract) (term : Term) :
    ∃ ticks ≤ contract.coefficient * (term.size + 1),
      let final := FiniteController.run contract.machine ticks
        (contract.initial term)
      (runtimeHaltKind contract.haltKind final.control).isSome = true := by
  exact ⟨contract.stoppingTime term, contract.stoppingTime_le term,
    contract.terminal term⟩

/-- The invocation's issued movement-instruction count satisfies the linear bound. -/
theorem moves_le (contract : Contract) (term : Term) :
    runMoveCount contract.machine (contract.stoppingTime term)
        (contract.initial term) ≤
      contract.coefficient * (term.size + 1) :=
  Nat.le_trans
    (runMoveCount_le_ticks contract.machine _ (contract.initial term))
    (contract.stoppingTime_le term)

/-- The invocation's successful one-edge traversals satisfy the linear bound. -/
theorem successfulEdgeMoves_le (contract : Contract) (term : Term) :
    runSuccessfulEdgeMoveCount contract.machine (contract.stoppingTime term)
        (contract.initial term) ≤
      contract.coefficient * (term.size + 1) :=
  Nat.le_trans
    (runSuccessfulEdgeMoveCount_le_runMoveCount contract.machine _
      (contract.initial term))
    (contract.moves_le term)

/-- An unchanged normal term has the same run and answer after any reset. -/
theorem restart_nf (contract : Contract) {term : Term}
    {normal : AddressNormal term}
    (first second : contract.InterInvocationState)
    (h : contract.select term = .nf normal) :
    contract.invokeRun first term = contract.invokeRun second term ∧
      contract.invoke second term = .nf normal := by
  refine ⟨contract.invokeRun_state_independent first second term, ?_⟩
  simpa only [invoke] using! h

end Contract

end PureSFormal.Research.RootResetSelectorContract
