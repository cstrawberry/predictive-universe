import PureSFormal.Research.RootResetWholeStageClassifier
import PureSFormal.PureS.SchedulerInvariant

/-!
# Whole-term clock and fuel stage placement

This module reconstructs the clock and fuel coordinates of the scheduler from
the current bare term.  The parser first follows the canonical prefix of
completed marked `Local` shells.  At its active endpoint it recognizes the
diagonal clock-growth spine, an exposed clock-launch spine, or one of the
literal fuel-script rows below zero or more pending frames.

No clock counter, fuel counter, cursor, or stage role is an input.  Clock
coordinates are decoded from unary `C` syntax and the literal wrapper spine;
fuel coordinates are decoded from unary `C` syntax and pending-frame depth.
The environment, continuation, and historical payloads are returned as fields,
not compared with one another.  A final carrier-entry row is a handoff to the
existing carrier/frame grammar; this module does not assert whole scheduler
closure.
-/

namespace PureSFormal.Research.RootResetClockFuelStages

open PureSFormal.PureS
open RootResetReachableStageGrammar
open SchedulerInvariant

def decodeC? (term : Term) : Option Nat :=
  RootResetStageRegistry.parseC? term

@[simp] theorem decodeC?_s : decodeC? (.s : Term) = none := by
  simp [decodeC?, RootResetStageRegistry.parseC?]

@[simp] theorem decodeC?_C (number : Nat) :
    decodeC? (C number) = some number := by
  exact RootResetStageRegistry.parseC?_C number

/-! ## Addresses and pending contexts -/

/-- `count` successive right-child moves. -/
def rights : Nat → Address
  | 0 => []
  | count + 1 => .right :: rights count

@[simp] theorem rights_zero : rights 0 = [] := rfl
@[simp] theorem rights_succ (count : Nat) :
    rights (count + 1) = .right :: rights count := rfl

@[simp] theorem rights_length (count : Nat) : (rights count).length = count := by
  induction count with
  | zero => rfl
  | succ count ih => simp [rights, ih]

/-- One pending-frame layer, with both runtime fields kept independent. -/
structure PendingLayer where
  environment : Term
  continuation : Term
  seedPayload : Term
  deriving BEq, DecidableEq, Repr

/-- Context contributed by an outer-to-inner list of pending frames. -/
def pendingContext : List PendingLayer → Context
  | [] => .hole
  | layer :: layers =>
      .appRight (.app layer.environment layer.continuation)
        (pendingContext layers)

@[simp] theorem pendingContext_nil : pendingContext [] = .hole := rfl
@[simp] theorem pendingContext_cons (layer : PendingLayer)
    (layers : List PendingLayer) :
    pendingContext (layer :: layers) =
      .appRight (.app layer.environment layer.continuation)
        (pendingContext layers) := rfl

@[simp] theorem pendingContext_address (layers : List PendingLayer) :
    RootResetSelectorContract.contextAddress (pendingContext layers) =
      rights layers.length := by
  induction layers with
  | nil => rfl
  | cons layer layers ih =>
      simp [pendingContext, RootResetSelectorContract.contextAddress,
        rights, ih]

/-! ## Clock-growth cores -/

/-- Syntax-derived coordinates of one unfinished diagonal clock core. -/
structure ClockCoreView where
  stage : Nat
  wrappers : Nat
  residual : Nat
  deriving BEq, DecidableEq, Repr

def ClockCoreView.term (view : ClockCoreView) : Term :=
  clockGrowthCore view.stage view.wrappers view.residual

/-- Parse the repeated `S C_stage [-]` wrappers down to a residual `C_r C_stage`. -/
def parseClockCore? : Term → Option ClockCoreView
  | .s => none
  | .app left right =>
      match left with
      | .s =>
          match decodeC? left, decodeC? right with
          | some residual, some stage => some ⟨stage, 0, residual⟩
          | _, _ => none
      | .app leftLeft leftRight =>
          match leftLeft with
          | .s =>
              match decodeC? leftRight, parseClockCore? right with
              | some stage, some view =>
                  if view.stage = stage then
                    some ⟨stage, view.wrappers + 1, view.residual⟩
                  else none
              | _, _ => none
          | .app _ _ =>
              match decodeC? left, decodeC? right with
              | some residual, some stage => some ⟨stage, 0, residual⟩
              | _, _ => none

@[simp]
theorem parseClockCore?_generated
    (stage wrappers residual : Nat) :
    parseClockCore? (clockGrowthCore stage wrappers residual) =
      some ⟨stage, wrappers, residual⟩ := by
  induction wrappers with
  | zero =>
      cases residual <;>
        simp [clockGrowthCore, clockWrap, parseClockCore?, C, b,
          decodeC?, RootResetStageRegistry.parseC?]
  | succ wrappers ih =>
      change parseClockCore?
          (.app (.app .s (C stage))
            (clockGrowthCore stage wrappers residual)) = _
      simp [parseClockCore?, ih]

/-- Successful core parsing reconstructs the exact wrapper/residual term. -/
theorem parseClockCore?_sound
    {term : Term} {view : ClockCoreView}
    (h : parseClockCore? term = some view) : term = view.term := by
  induction term generalizing view with
  | s => simp [parseClockCore?] at h
  | app left right leftIH rightIH =>
      cases left with
      | s => simp [parseClockCore?] at h
      | app leftLeft leftRight =>
          cases leftLeft with
          | s =>
            generalize hstage : decodeC? leftRight = stageResult
            generalize hinner : parseClockCore? right = innerResult
            cases stageResult with
            | none => simp [parseClockCore?, hstage] at h
            | some stage =>
                cases innerResult with
                | none => simp [parseClockCore?, hstage, hinner] at h
                | some innerView =>
                    by_cases heq : innerView.stage = stage
                    · simp [parseClockCore?, hstage, hinner, heq] at h
                      subst view
                      have innerEq := rightIH hinner
                      have stageEq := RootResetStageRegistry.parseC?_sound hstage
                      subst leftRight
                      rw [innerEq]
                      simp [ClockCoreView.term, clockGrowthCore, clockWrap, heq]
                    · simp [parseClockCore?, hstage, hinner, heq] at h
          | app leftLeftLeft leftLeftRight =>
            simp only [parseClockCore?] at h
            generalize hl : decodeC?
              (.app (.app leftLeftLeft leftLeftRight) leftRight) = leftResult at h
            generalize hr : decodeC? right = rightResult at h
            cases leftResult with
            | none => contradiction
            | some residual =>
                cases rightResult with
                | none => contradiction
                | some stage =>
                    have hview := Option.some.inj h
                    subst view
                    rw [RootResetStageRegistry.parseC?_sound hl,
                      RootResetStageRegistry.parseC?_sound hr]
                    rfl

/-! ## Fully exposed clock spines -/

/-- Coordinates of a completed clock wrapper spine. -/
structure ClockExitCoreView where
  stage : Nat
  remaining : Nat
  deriving BEq, DecidableEq, Repr

def ClockExitCoreView.term (view : ClockExitCoreView) : Term :=
  clockWrappers view.stage view.remaining

/-- Parse `clockWrappers stage remaining` without a supplied stage. -/
def parseClockExitCore? : Term → Option ClockExitCoreView
  | .s => none
  | .app left right =>
      match left with
      | .s =>
          match decodeC? left, decodeC? right with
          | some (stageLeft + 1), some (stageRight + 1) =>
              if stageLeft = stageRight then some ⟨stageLeft, 0⟩ else none
          | _, _ => none
      | .app leftLeft leftRight =>
          match leftLeft with
          | .s =>
              match decodeC? leftRight, parseClockExitCore? right with
              | some stage, some view =>
                  if view.stage = stage then
                    some ⟨stage, view.remaining + 1⟩
                  else none
              | _, _ => none
          | .app _ _ =>
              match decodeC? left, decodeC? right with
              | some (stageLeft + 1), some (stageRight + 1) =>
                  if stageLeft = stageRight then some ⟨stageLeft, 0⟩ else none
              | _, _ => none

@[simp]
theorem parseClockExitCore?_generated (stage remaining : Nat) :
    parseClockExitCore? (clockWrappers stage remaining) =
      some ⟨stage, remaining⟩ := by
  induction remaining with
  | zero =>
      simp [clockWrappers, clockBase, parseClockExitCore?, C, b,
        decodeC?, RootResetStageRegistry.parseC?]
  | succ remaining ih =>
      change parseClockExitCore?
          (.app (.app .s (C stage)) (clockWrappers stage remaining)) = _
      simp [parseClockExitCore?, ih]

/-- Successful exit parsing reconstructs the exact completed wrapper spine. -/
theorem parseClockExitCore?_sound
    {term : Term} {view : ClockExitCoreView}
    (h : parseClockExitCore? term = some view) : term = view.term := by
  induction term generalizing view with
  | s => simp [parseClockExitCore?] at h
  | app left right leftIH rightIH =>
      cases left with
      | s => simp [parseClockExitCore?] at h
      | app leftLeft leftRight =>
          cases leftLeft with
          | s =>
            generalize hstage : decodeC? leftRight = stageResult
            generalize hinner : parseClockExitCore? right = innerResult
            cases stageResult with
            | none => simp [parseClockExitCore?, hstage] at h
            | some stage =>
                cases innerResult with
                | none => simp [parseClockExitCore?, hstage, hinner] at h
                | some innerView =>
                    by_cases heq : innerView.stage = stage
                    · simp [parseClockExitCore?, hstage, hinner, heq] at h
                      subst view
                      have innerEq := rightIH hinner
                      have stageEq := RootResetStageRegistry.parseC?_sound hstage
                      subst leftRight
                      rw [innerEq]
                      simp [ClockExitCoreView.term, clockWrappers, heq]
                    · simp [parseClockExitCore?, hstage, hinner, heq] at h
          | app leftLeftLeft leftLeftRight =>
            simp only [parseClockExitCore?] at h
            generalize hl : decodeC?
              (.app (.app leftLeftLeft leftLeftRight) leftRight) = leftResult at h
            generalize hr : decodeC? right = rightResult at h
            cases leftResult with
            | none => contradiction
            | some leftNumber =>
                cases leftNumber with
                | zero => contradiction
                | succ stageLeft =>
                    cases rightResult with
                    | none => contradiction
                    | some rightNumber =>
                        cases rightNumber with
                        | zero => contradiction
                        | succ stageRight =>
                            by_cases heq : stageLeft = stageRight
                            · simp [heq] at h
                              subst view
                              subst stageRight
                              rw [RootResetStageRegistry.parseC?_sound hl,
                                RootResetStageRegistry.parseC?_sound hr]
                              rfl
                            · simp [heq] at h

/-! ## Role-free clock rows -/

/-- The three actionable clock rows. -/
inductive ClockStage where
  | growPositive
  | growZero
  | launch
  deriving BEq, DecidableEq, Inhabited, Repr

structure ClockView where
  stage : ClockStage
  horizon : Nat
  wrappers : Nat
  residual : Nat
  environment : Term
  deriving BEq, DecidableEq, Repr

/-- Exact active-endpoint term represented by a clock view. -/
def ClockView.term (view : ClockView) : Term :=
  match view.stage with
  | .growPositive | .growZero =>
      .app (clockGrowthCore view.horizon view.wrappers view.residual)
        view.environment
  | .launch => Dovetail.clockExit view.horizon view.residual view.environment

/-- Address of the next clock contraction relative to the active endpoint. -/
def ClockView.focusAddress (view : ClockView) : Address :=
  match view.stage with
  | .growPositive | .growZero => .left :: rights view.wrappers
  | .launch => []

/-- Exact selected clock occurrence. -/
def ClockView.focus (view : ClockView) : Term :=
  match view.stage with
  | .growPositive => .app (C view.residual) (C view.horizon)
  | .growZero => .app (C view.residual) (C view.horizon)
  | .launch => view.term

/-- Contractum of the selected clock occurrence. -/
def ClockView.replacement (view : ClockView) : Term :=
  match view.stage with
  | .growPositive | .growZero =>
      match view.residual with
      | 0 => clockBase view.horizon
      | residual + 1 =>
          .app (.app .s (C view.horizon))
            (.app (C residual) (C view.horizon))
  | .launch =>
      Dovetail.jobSource view.horizon (view.residual - 1) view.environment

/-- Infer growth versus launch solely from the active endpoint syntax. -/
def parseClock? (term : Term) : Option ClockView :=
  match term with
  | .app core environment =>
      match parseClockCore? core with
      | some coreView =>
          if coreView.wrappers + coreView.residual = coreView.stage then
            match coreView.residual with
            | 0 => some ⟨.growZero, coreView.stage, coreView.wrappers, 0,
                environment⟩
            | residual + 1 =>
                some ⟨.growPositive, coreView.stage, coreView.wrappers,
                  residual + 1, environment⟩
          else none
      | none =>
          match parseClockExitCore? core with
          | some exitView =>
              match exitView.remaining with
              | 0 => none
              | remaining + 1 =>
                  if remaining + 1 ≤ exitView.stage then
                    some ⟨.launch, exitView.stage, 0, remaining + 1,
                      environment⟩
                  else none
          | none => none
  | .s => none

/-- A successful clock parse reconstructs the complete active endpoint. -/
theorem parseClock?_sound
    {term : Term} {view : ClockView}
    (h : parseClock? term = some view) : term = view.term := by
  cases term with
  | s => simp [parseClock?] at h
  | app core environment =>
      generalize hgrowth : parseClockCore? core = growthResult
      cases growthResult with
      | some coreView =>
          by_cases hbalance :
              coreView.wrappers + coreView.residual = coreView.stage
          ·
            cases hresidual : coreView.residual with
            | zero =>
                simp [parseClock?, hgrowth, hbalance, hresidual] at h
                have hview := h.2
                subst view
                rw [parseClockCore?_sound hgrowth]
                simp [ClockCoreView.term, ClockView.term, hresidual]
            | succ residual =>
                simp [parseClock?, hgrowth, hbalance, hresidual] at h
                have hview := h.2
                subst view
                rw [parseClockCore?_sound hgrowth]
                simp [ClockCoreView.term, ClockView.term, hresidual]
          · simp [parseClock?, hgrowth, hbalance] at h
      | none =>
          generalize hexit : parseClockExitCore? core = exitResult
          cases exitResult with
          | none => simp [parseClock?, hgrowth, hexit] at h
          | some exitView =>
              cases hremaining : exitView.remaining with
              | zero => simp [parseClock?, hgrowth, hexit, hremaining] at h
              | succ remaining =>
                  by_cases hbound : remaining + 1 ≤ exitView.stage
                  · simp [parseClock?, hgrowth, hexit, hremaining, hbound] at h
                    subst view
                    rw [parseClockExitCore?_sound hexit]
                    simp [ClockExitCoreView.term, ClockView.term,
                      Dovetail.clockExit, hremaining]
                  · simp [parseClock?, hgrowth, hexit, hremaining, hbound] at h

@[simp]
theorem parseClock?_generated_positive
    (stage wrappers remaining : Nat) (environment : Term)
    (balance : wrappers + (remaining + 1) = stage) :
    parseClock?
        (.app (clockGrowthCore stage wrappers (remaining + 1)) environment) =
      some ⟨.growPositive, stage, wrappers, remaining + 1, environment⟩ := by
  simp [parseClock?, parseClockCore?_generated, balance]

@[simp]
theorem parseClock?_generated_zero
    (stage wrappers : Nat) (environment : Term)
    (balance : wrappers = stage) :
    parseClock? (.app (clockGrowthCore stage wrappers 0) environment) =
      some ⟨.growZero, stage, wrappers, 0, environment⟩ := by
  simp [parseClock?, parseClockCore?_generated, balance]

/-- A nonempty completed wrapper spine is not an unfinished growth core. -/
@[simp]
theorem parseClockCore?_clockWrappers_succ_none
    (stage remaining : Nat) :
    parseClockCore? (clockWrappers stage (remaining + 1)) = none := by
  induction remaining with
  | zero =>
      have hbase := parseClockCore?_generated (stage + 1) 0 (stage + 1)
      change parseClockCore? (clockBase stage) =
        some ⟨stage + 1, 0, stage + 1⟩ at hbase
      change parseClockCore?
        (.app (.app .s (C stage)) (clockBase stage)) = none
      rw [parseClockCore?, decodeC?_C, hbase]
      exact if_neg (Nat.succ_ne_self stage)
  | succ remaining ih =>
      rw [show clockWrappers stage (remaining + 1 + 1) =
          .app (.app .s (C stage))
            (clockWrappers stage (remaining + 1)) by rfl]
      rw [parseClockCore?]
      rw [decodeC?_C, ih]

@[simp]
theorem parseClock?_generated_launch
    (stage remaining : Nat) (environment : Term)
    (bound : remaining + 1 ≤ stage) :
    parseClock? (Dovetail.clockExit stage (remaining + 1) environment) =
      some ⟨.launch, stage, 0, remaining + 1, environment⟩ := by
  change parseClock?
      (.app (clockWrappers stage (remaining + 1)) environment) = _
  simp only [parseClock?]
  rw [parseClockCore?_clockWrappers_succ_none,
    parseClockExitCore?_generated]
  simp [bound]

/-! ## Literal fuel-script rows -/

/-- The six actionable shapes encountered by the positive and zero scripts. -/
inductive FuelStage where
  | callPositive
  | callZero
  | positiveHalf
  | zeroFirst
  | zeroSecond
  | zeroThird
  | zeroFourth
  deriving BEq, DecidableEq, Inhabited, Repr

/--
Runtime fields of a fuel row.  Repeated environment and continuation copies
are separate constructor fields.  Thus the grammar never tests equality of
opaque copies merely because an `S` contraction duplicated them.
-/
inductive FuelRow where
  | call (fuel : Nat) (environment continuation : Term)
  | positiveHalf (residual : Nat)
      (leftEnvironment rightEnvironment continuation : Term)
  | zeroFirst (leftEnvironment rightEnvironment continuation : Term)
  | zeroSecond (leftArgument function rightArgument continuation : Term)
  | zeroThird (environment leftContinuation function rightArgument
      rightContinuation : Term)
  | zeroFourth (leftContinuation environment rightContinuation alpha : Term)
  deriving BEq, DecidableEq, Repr

def FuelRow.stage : FuelRow → FuelStage
  | .call 0 .. => .callZero
  | .call (_ + 1) .. => .callPositive
  | .positiveHalf .. => .positiveHalf
  | .zeroFirst .. => .zeroFirst
  | .zeroSecond .. => .zeroSecond
  | .zeroThird .. => .zeroThird
  | .zeroFourth .. => .zeroFourth

/-- Residual fuel represented by the row before the next completed layer. -/
def FuelRow.residual : FuelRow → Nat
  | .call fuel .. => fuel
  | .positiveHalf residual .. => residual + 1
  | .zeroFirst .. | .zeroSecond .. | .zeroThird .. | .zeroFourth .. => 0

def FuelRow.term : FuelRow → Term
  | .call fuel environment continuation =>
      .app (.app (C fuel) environment) continuation
  | .positiveHalf residual leftEnvironment rightEnvironment continuation =>
      .app
        (.app (.app .s leftEnvironment)
          (.app (C residual) rightEnvironment))
        continuation
  | .zeroFirst leftEnvironment rightEnvironment continuation =>
      .app
        (.app (.app b leftEnvironment) (.app b rightEnvironment))
        continuation
  | .zeroSecond leftArgument function rightArgument continuation =>
      .app
        (.app (.app .s leftArgument) (.app function rightArgument))
        continuation
  | .zeroThird environment leftContinuation function rightArgument
      rightContinuation =>
      .app (.app (.app b environment) leftContinuation)
        (.app (.app function rightArgument) rightContinuation)
  | .zeroFourth leftContinuation environment rightContinuation alpha =>
      .app
        (.app (.app .s leftContinuation)
          (.app environment rightContinuation))
        alpha

def FuelRow.localAddress : FuelRow → Address
  | .call .. => [.left]
  | .positiveHalf .. => []
  | .zeroFirst .. => [.left]
  | .zeroSecond .. => []
  | .zeroThird .. => [.left]
  | .zeroFourth .. => []

def FuelRow.focus : FuelRow → Term
  | .call fuel environment _ => .app (C fuel) environment
  | row@(.positiveHalf ..) => row.term
  | .zeroFirst leftEnvironment rightEnvironment _ =>
      .app (.app b leftEnvironment) (.app b rightEnvironment)
  | row@(.zeroSecond ..) => row.term
  | .zeroThird environment leftContinuation _ _ _ =>
      .app (.app b environment) leftContinuation
  | row@(.zeroFourth ..) => row.term

def FuelRow.replacement : FuelRow → Term
  | .call 0 environment _ =>
      .app (.app b environment) (.app b environment)
  | .call (fuel + 1) environment _ =>
      .app (.app .s environment) (.app (C fuel) environment)
  | .positiveHalf residual leftEnvironment rightEnvironment continuation =>
      frame leftEnvironment continuation
        (.app (.app (C residual) rightEnvironment) continuation)
  | .zeroFirst leftEnvironment rightEnvironment _ =>
      let argument := .app b rightEnvironment
      .app (.app .s argument) (.app leftEnvironment argument)
  | .zeroSecond leftArgument function rightArgument continuation =>
      .app (.app leftArgument continuation)
        (.app (.app function rightArgument) continuation)
  | .zeroThird environment leftContinuation _ _ _ =>
      .app (.app .s leftContinuation) (.app environment leftContinuation)
  | .zeroFourth leftContinuation environment rightContinuation alpha =>
      .app (.app leftContinuation alpha)
        (.app (.app environment rightContinuation) alpha)

/-- Whole local row after replacing its selected occurrence. -/
def FuelRow.target (row : FuelRow) : Term :=
  (row.term.replace? row.localAddress row.replacement).getD row.term

/-- Parse the initial `C_n E B` row. -/
def parseFuelCall? : Term → Option FuelRow
  | .app (.app code environment) continuation =>
      (decodeC? code).map fun fuel => .call fuel environment continuation
  | _ => none

/-- Parse the row after the first positive-fuel contraction. -/
def parsePositiveHalf? : Term → Option FuelRow
  | .app
      (.app (.app .s leftEnvironment) (.app code rightEnvironment))
      continuation =>
      (decodeC? code).map fun residual =>
        .positiveHalf residual leftEnvironment rightEnvironment continuation
  | _ => none

/-- Parse the row after the first zero-fuel contraction. -/
def parseZeroFirst? : Term → Option FuelRow
  | .app
      (.app (.app firstB leftEnvironment) (.app secondB rightEnvironment))
      continuation =>
      if firstB = b ∧ secondB = b then
        some (.zeroFirst leftEnvironment rightEnvironment continuation)
      else none
  | _ => none

/-- Parse the row after the second zero-fuel contraction. -/
def parseZeroSecond? : Term → Option FuelRow
  | .app
      (.app (.app .s leftArgument) (.app function rightArgument))
      continuation =>
      some (.zeroSecond leftArgument function rightArgument continuation)
  | _ => none

/-- Parse the row after the third zero-fuel contraction. -/
def parseZeroThird? : Term → Option FuelRow
  | .app (.app (.app firstB environment) leftContinuation)
      (.app (.app function rightArgument) rightContinuation) =>
      if firstB = b then
        some (.zeroThird environment leftContinuation function rightArgument
          rightContinuation)
      else none
  | _ => none

/-- Parse the row after the fourth zero-fuel contraction. -/
def parseZeroFourth? : Term → Option FuelRow
  | .app
      (.app (.app .s leftContinuation)
        (.app environment rightContinuation)) alpha =>
      some (.zeroFourth leftContinuation environment rightContinuation alpha)
  | _ => none

/--
The second and fourth zero-script rows have the same outer application
pattern.  On scheduler-reachable rows their left field separates them by a
bounded probe: `b E` has head arity two at the second row, while the retained
admissible continuation has head arity three or four at the fourth row.
No equality between runtime fields is tested.
 -/
def parseCanonicalZeroRoot? : Term → Option FuelRow
  | .app
      (.app (.app .s left) (.app function right)) continuation =>
      if Term.exactHeadArity left 2 then
        some (.zeroSecond left function right continuation)
      else if Term.exactHeadArity left 3 ||
          Term.exactHeadArity left 4 then
        some (.zeroFourth left function right continuation)
      else none
  | _ => none

/-- A guarded zero-root result reconstructs its exact source row. -/
theorem parseCanonicalZeroRoot?_sound
    {term : Term} {row : FuelRow}
    (h : parseCanonicalZeroRoot? term = some row) :
    term = row.term := by
  unfold parseCanonicalZeroRoot? at h
  split at h <;> try contradiction
  next left function right continuation =>
    split at h
    · simp at h
      subst row
      rfl
    · split at h
      · simp at h
        subst row
        rfl
      · contradiction

/-- The canonical second row is recognized from the arity-two `b E` field. -/
@[simp]
theorem parseCanonicalZeroRoot?_second
    (environment continuation : Term) :
    parseCanonicalZeroRoot?
        ((FuelRow.zeroSecond (.app b environment) environment
          (.app b environment) continuation).term) =
      some (.zeroSecond (.app b environment) environment
        (.app b environment) continuation) := by
  simp [parseCanonicalZeroRoot?, FuelRow.term, Term.exactHeadArity, b]

/-- An admissible retained continuation identifies the canonical fourth row. -/
theorem parseCanonicalZeroRoot?_fourth
    (leftContinuation environment rightContinuation alpha : Term)
    (admissible : Carrier.Admissible leftContinuation) :
    parseCanonicalZeroRoot?
        ((FuelRow.zeroFourth leftContinuation environment rightContinuation
          alpha).term) =
      some (.zeroFourth leftContinuation environment rightContinuation
        alpha) := by
  rcases admissible with h | h
  · simp [parseCanonicalZeroRoot?, FuelRow.term, Term.exactHeadArity, h]
  · simp [parseCanonicalZeroRoot?, FuelRow.term, Term.exactHeadArity, h]

/-- The two guarded canonical zero-root alternatives have distinct stages. -/
theorem parseCanonicalZeroRoot?_stage
    {term : Term} {row : FuelRow}
    (h : parseCanonicalZeroRoot? term = some row) :
    row.stage = .zeroSecond ∨ row.stage = .zeroFourth := by
  unfold parseCanonicalZeroRoot? at h
  split at h <;> try contradiction
  next left function right continuation =>
    split at h
    · simp at h
      subst row
      simp [FuelRow.stage]
    · split at h
      · simp at h
        subst row
        simp [FuelRow.stage]
      · contradiction

/--
Role-free local classification.  Specific call, positive, and first-zero rows
precede the bounded guarded root classifier; the structurally distinct third
zero row is the final alternative.
-/
def parseFuelRow? (term : Term) : Option FuelRow :=
  match parseFuelCall? term with
  | some row => some row
  | none =>
      match parsePositiveHalf? term with
      | some row => some row
      | none =>
          match parseZeroFirst? term with
          | some row => some row
          | none =>
              match parseCanonicalZeroRoot? term with
              | some row => some row
              | none => parseZeroThird? term

/-! ### Local parser soundness and generated rows -/

theorem parseFuelCall?_sound
    {term : Term} {row : FuelRow} (h : parseFuelCall? term = some row) :
    term = row.term := by
  cases term with
  | s => simp [parseFuelCall?] at h
  | app fn continuation =>
      cases fn with
      | s => simp [parseFuelCall?] at h
      | app code environment =>
          simp only [parseFuelCall?] at h
          generalize hc : decodeC? code = result at h
          cases result with
          | none => simp at h
          | some fuel =>
              simp at h
              subst row
              rw [RootResetStageRegistry.parseC?_sound hc]
              rfl

@[simp] theorem parseFuelCall?_generated
    (fuel : Nat) (environment continuation : Term) :
    parseFuelCall? (.app (.app (C fuel) environment) continuation) =
      some (.call fuel environment continuation) := by
  simp [parseFuelCall?]

theorem parsePositiveHalf?_sound
    {term : Term} {row : FuelRow} (h : parsePositiveHalf? term = some row) :
    term = row.term := by
  unfold parsePositiveHalf? at h
  split at h <;> try contradiction
  next source leftEnvironment code rightEnvironment continuation =>
    generalize hc : decodeC? code = result at h
    cases result with
    | none => simp at h
    | some residual =>
        simp at h
        subst row
        rw [RootResetStageRegistry.parseC?_sound hc]
        rfl

@[simp] theorem parsePositiveHalf?_generated
    (residual : Nat) (leftEnvironment rightEnvironment continuation : Term) :
    parsePositiveHalf?
        (.app
          (.app (.app .s leftEnvironment)
            (.app (C residual) rightEnvironment)) continuation) =
      some (.positiveHalf residual leftEnvironment rightEnvironment
        continuation) := by
  simp [parsePositiveHalf?]

theorem parseZeroFirst?_sound
    {term : Term} {row : FuelRow} (h : parseZeroFirst? term = some row) :
    term = row.term := by
  unfold parseZeroFirst? at h
  split at h <;> try contradiction
  next source firstB leftEnvironment secondB rightEnvironment continuation =>
    split at h
    next fixed =>
      rcases fixed with ⟨rfl, rfl⟩
      simp at h
      subst row
      rfl
    next => contradiction

@[simp] theorem parseZeroFirst?_generated
    (leftEnvironment rightEnvironment continuation : Term) :
    parseZeroFirst?
        (.app (.app (.app b leftEnvironment) (.app b rightEnvironment))
          continuation) =
      some (.zeroFirst leftEnvironment rightEnvironment continuation) := by
  simp [parseZeroFirst?]

theorem parseZeroSecond?_sound
    {term : Term} {row : FuelRow} (h : parseZeroSecond? term = some row) :
    term = row.term := by
  unfold parseZeroSecond? at h
  split at h <;> try contradiction
  next source leftArgument function rightArgument continuation =>
    simp at h
    subst row
    rfl

@[simp] theorem parseZeroSecond?_generated
    (leftArgument function rightArgument continuation : Term) :
    parseZeroSecond?
        (.app (.app (.app .s leftArgument) (.app function rightArgument))
          continuation) =
      some (.zeroSecond leftArgument function rightArgument continuation) := by
  rfl

theorem parseZeroThird?_sound
    {term : Term} {row : FuelRow} (h : parseZeroThird? term = some row) :
    term = row.term := by
  unfold parseZeroThird? at h
  split at h <;> try contradiction
  next source firstB environment leftContinuation function rightArgument
      rightContinuation =>
    split at h
    next fixed =>
      subst firstB
      simp at h
      subst row
      rfl
    next => contradiction

@[simp] theorem parseZeroThird?_generated
    (environment leftContinuation function rightArgument rightContinuation :
      Term) :
    parseZeroThird?
        (.app (.app (.app b environment) leftContinuation)
          (.app (.app function rightArgument) rightContinuation)) =
      some (.zeroThird environment leftContinuation function rightArgument
        rightContinuation) := by
  simp [parseZeroThird?]

theorem parseZeroFourth?_sound
    {term : Term} {row : FuelRow} (h : parseZeroFourth? term = some row) :
    term = row.term := by
  unfold parseZeroFourth? at h
  split at h <;> try contradiction
  next source leftContinuation environment rightContinuation alpha =>
    simp at h
    subst row
    rfl

@[simp] theorem parseZeroFourth?_generated
    (leftContinuation environment rightContinuation alpha : Term) :
    parseZeroFourth?
        (.app
          (.app (.app .s leftContinuation)
            (.app environment rightContinuation)) alpha) =
      some (.zeroFourth leftContinuation environment rightContinuation alpha) :=
  rfl

/-- Every successful local classification reconstructs its exact row. -/
theorem parseFuelRow?_sound
    {term : Term} {row : FuelRow} (h : parseFuelRow? term = some row) :
    term = row.term := by
  unfold parseFuelRow? at h
  generalize hcall : parseFuelCall? term = callResult at h
  cases callResult with
  | some found =>
      have eq := Option.some.inj h
      subst row
      exact parseFuelCall?_sound hcall
  | none =>
      generalize hpositive : parsePositiveHalf? term = positiveResult at h
      cases positiveResult with
      | some found =>
          have eq := Option.some.inj h
          subst row
          exact parsePositiveHalf?_sound hpositive
      | none =>
          generalize hfirst : parseZeroFirst? term = firstResult at h
          cases firstResult with
          | some found =>
              have eq := Option.some.inj h
              subst row
              exact parseZeroFirst?_sound hfirst
          | none =>
              generalize hcanonical : parseCanonicalZeroRoot? term =
                canonicalResult at h
              cases canonicalResult with
              | some found =>
                  have eq := Option.some.inj h
                  subst row
                  exact parseCanonicalZeroRoot?_sound hcanonical
              | none => exact parseZeroThird?_sound h

/-- Every classified fuel row has root head arity at most four. -/
theorem FuelRow.term_headArity_le_four (row : FuelRow) :
    row.term.headArity ≤ 4 := by
  cases row with
  | call fuel environment continuation =>
      cases fuel <;> simp [FuelRow.term, C, b]
  | positiveHalf residual leftEnvironment rightEnvironment continuation =>
      simp [FuelRow.term]
  | zeroFirst leftEnvironment rightEnvironment continuation =>
      simp [FuelRow.term, b]
  | zeroSecond leftArgument function rightArgument continuation =>
      simp [FuelRow.term]
  | zeroThird environment leftContinuation function rightArgument
      rightContinuation =>
      simp [FuelRow.term, b]
  | zeroFourth leftContinuation environment rightContinuation alpha =>
      simp [FuelRow.term]

/-- No fuel-row parser can accept a term whose root head arity exceeds four. -/
theorem parseFuelRow?_none_of_four_lt_headArity
    {term : Term} (large : 4 < term.headArity) :
    parseFuelRow? term = none := by
  cases hrow : parseFuelRow? term with
  | none => rfl
  | some row =>
      have source := parseFuelRow?_sound hrow
      rw [source] at large
      exact False.elim
        ((Nat.not_lt_of_ge row.term_headArity_le_four) large)

/-! ### Canonical generated fuel rows -/

/-- A fixed open-environment wrapper is not a unary carrier numeral. -/
@[simp]
theorem decodeC?_openEnvironment_none (actions seedPayload : Term) :
    decodeC? (CheckpointDecoder.openEnvironment actions seedPayload) = none := by
  simp [decodeC?, RootResetStageRegistry.parseC?,
    CheckpointDecoder.openEnvironment, C, b]

/-- The post-first-contraction positive row wins the role-free classifier. -/
@[simp]
theorem parseFuelRow?_generated_positiveHalf
    (residual : Nat)
    (leftEnvironment rightEnvironment continuation : Term) :
    parseFuelRow?
        ((FuelRow.positiveHalf residual leftEnvironment rightEnvironment
          continuation).term) =
      some (.positiveHalf residual leftEnvironment rightEnvironment
        continuation) := by
  simp [parseFuelRow?, parseFuelCall?, parsePositiveHalf?, FuelRow.term,
    decodeC?, RootResetStageRegistry.parseC?, C, b]

/-- The first zero-fuel sample is recognized with independent environments. -/
@[simp]
theorem parseFuelRow?_generated_zeroFirst
    (actions leftSeed rightSeed continuation : Term) :
    let leftEnvironment :=
      CheckpointDecoder.openEnvironment actions leftSeed
    let rightEnvironment :=
      CheckpointDecoder.openEnvironment actions rightSeed
    parseFuelRow?
        ((FuelRow.zeroFirst leftEnvironment rightEnvironment
          continuation).term) =
      some (.zeroFirst leftEnvironment rightEnvironment continuation) := by
  simp [parseFuelRow?, parseFuelCall?, parsePositiveHalf?, parseZeroFirst?,
    FuelRow.term, decodeC?, RootResetStageRegistry.parseC?,
    CheckpointDecoder.openEnvironment, C, b]

/-- The second zero-fuel sample is selected by its arity-two left argument. -/
@[simp]
theorem parseFuelRow?_generated_zeroSecond
    (actions leftSeed functionSeed rightSeed continuation : Term) :
    let leftEnvironment :=
      CheckpointDecoder.openEnvironment actions leftSeed
    let function := CheckpointDecoder.openEnvironment actions functionSeed
    let rightEnvironment :=
      CheckpointDecoder.openEnvironment actions rightSeed
    parseFuelRow?
        ((FuelRow.zeroSecond (.app b leftEnvironment) function
          (.app b rightEnvironment) continuation).term) =
      some (.zeroSecond (.app b leftEnvironment) function
        (.app b rightEnvironment) continuation) := by
  simp [parseFuelRow?, parseFuelCall?, parsePositiveHalf?, parseZeroFirst?,
    parseCanonicalZeroRoot?, FuelRow.term, decodeC?,
    RootResetStageRegistry.parseC?, CheckpointDecoder.openEnvironment,
    Term.exactHeadArity, C, b]

/--
An admissible retained continuation cannot be the arity-two `b E` field of
the first zero row.
-/
theorem zeroFirst_term_ne_zeroThird_term
    (leftEnvironment rightEnvironment zeroFirstContinuation environment
      continuation function rightArgument rightContinuation : Term)
    (admissible : Carrier.Admissible continuation) :
    (FuelRow.zeroFirst leftEnvironment rightEnvironment
      zeroFirstContinuation).term ≠
      (FuelRow.zeroThird environment continuation function rightArgument
        rightContinuation).term := by
  intro equal
  have fieldEqual := congrArg
    (fun term => term.subterm? [.left, .right]) equal
  have continuationEqual : .app b rightEnvironment = continuation := by
    simpa [FuelRow.term, Term.subterm?] using fieldEqual
  have arityEqual := congrArg Term.headArity continuationEqual
  rcases admissible with h | h
  · simp [b, h] at arityEqual
  · simp [b, h] at arityEqual

/-- An admissible continuation prevents a third row from matching first-row syntax. -/
theorem parseZeroFirst?_zeroThird_none_of_admissible
    (environment continuation function rightArgument rightContinuation : Term)
    (admissible : Carrier.Admissible continuation) :
    parseZeroFirst?
        ((FuelRow.zeroThird environment continuation function rightArgument
          rightContinuation).term) = none := by
  cases continuation with
  | s =>
      rcases admissible with h | h <;> simp at h
  | app continuationFunction continuationArgument =>
      by_cases fixed : continuationFunction = b
      · subst continuationFunction
        rcases admissible with h | h <;> simp [b] at h
      · have notFixed : continuationFunction ≠ .app .s .s := by
          simpa [b] using fixed
        simp [FuelRow.term, parseZeroFirst?, fixed, notFixed]

/-- The third zero-fuel sample wins after the arity-two first row is excluded. -/
theorem parseFuelRow?_generated_zeroThird
    (actions environmentSeed functionSeed argumentSeed : Term)
    (leftContinuation rightContinuation : Term)
    (admissible : Carrier.Admissible leftContinuation) :
    let environment :=
      CheckpointDecoder.openEnvironment actions environmentSeed
    let function := CheckpointDecoder.openEnvironment actions functionSeed
    let argumentEnvironment :=
      CheckpointDecoder.openEnvironment actions argumentSeed
    parseFuelRow?
        ((FuelRow.zeroThird environment leftContinuation function
          (.app b argumentEnvironment) rightContinuation).term) =
      some (.zeroThird environment leftContinuation function
        (.app b argumentEnvironment) rightContinuation) := by
  dsimp only
  let environment :=
    CheckpointDecoder.openEnvironment actions environmentSeed
  let function := CheckpointDecoder.openEnvironment actions functionSeed
  let argumentEnvironment :=
    CheckpointDecoder.openEnvironment actions argumentSeed
  let row := FuelRow.zeroThird environment leftContinuation function
    (.app b argumentEnvironment) rightContinuation
  change parseFuelRow? row.term = some row
  have hcall : parseFuelCall? row.term = none := by
    simp [row, environment, function, argumentEnvironment, parseFuelCall?,
      FuelRow.term, decodeC?, RootResetStageRegistry.parseC?,
      CheckpointDecoder.openEnvironment, C, b]
  have hpositive : parsePositiveHalf? row.term = none := by
    simp [row, environment, function, argumentEnvironment,
      parsePositiveHalf?, FuelRow.term, b]
  have hfirst : parseZeroFirst? row.term = none := by
    exact parseZeroFirst?_zeroThird_none_of_admissible _ _ _ _ _ admissible
  have hcanonical : parseCanonicalZeroRoot? row.term = none := by
    simp [row, environment, function, argumentEnvironment,
      parseCanonicalZeroRoot?, FuelRow.term, b]
  rw [parseFuelRow?, hcall, hpositive, hfirst, hcanonical]
  exact parseZeroThird?_generated _ _ _ _ _

/--
Canonical second and fourth rows are disjoint because their exposed left
fields have head arity two versus three or four.
-/
theorem zeroSecond_term_ne_zeroFourth_term
    (leftEnvironment function rightEnvironment continuation environment
      rightContinuation secondAlpha fourthAlpha : Term)
    (admissible : Carrier.Admissible continuation) :
    (FuelRow.zeroSecond (.app b leftEnvironment) function
      (.app b rightEnvironment) secondAlpha).term ≠
      (FuelRow.zeroFourth continuation environment rightContinuation
        fourthAlpha).term := by
  intro equal
  have fieldEqual := congrArg
    (fun term => term.subterm? [.left, .left, .right]) equal
  have continuationEqual : .app b leftEnvironment = continuation := by
    simpa [FuelRow.term, Term.subterm?] using fieldEqual
  have arityEqual := congrArg Term.headArity continuationEqual
  rcases admissible with h | h
  · simp [b, h] at arityEqual
  · simp [b, h] at arityEqual

/-- The fourth zero-fuel sample is selected by its admissible continuation. -/
theorem parseFuelRow?_generated_zeroFourth
    (actions environmentSeed : Term)
    (leftContinuation rightContinuation alpha : Term)
    (admissible : Carrier.Admissible leftContinuation) :
    let environment :=
      CheckpointDecoder.openEnvironment actions environmentSeed
    parseFuelRow?
        ((FuelRow.zeroFourth leftContinuation environment rightContinuation
          alpha).term) =
      some (.zeroFourth leftContinuation environment rightContinuation
        alpha) := by
  rcases admissible with h | h
  · simp [parseFuelRow?, parseFuelCall?, parsePositiveHalf?, parseZeroFirst?,
      parseCanonicalZeroRoot?, FuelRow.term, decodeC?,
      RootResetStageRegistry.parseC?, CheckpointDecoder.openEnvironment,
      Term.exactHeadArity, h, C, b]
  · simp [parseFuelRow?, parseFuelCall?, parsePositiveHalf?, parseZeroFirst?,
      parseCanonicalZeroRoot?, FuelRow.term, decodeC?,
      RootResetStageRegistry.parseC?, CheckpointDecoder.openEnvironment,
      Term.exactHeadArity, h, C, b]

/-- The selected occurrence of every local fuel row is literal. -/
theorem FuelRow.focus_subterm (row : FuelRow) :
    row.term.subterm? row.localAddress = some row.focus := by
  cases row with
  | call fuel environment continuation => rfl
  | positiveHalf residual leftEnvironment rightEnvironment continuation => rfl
  | zeroFirst leftEnvironment rightEnvironment continuation => rfl
  | zeroSecond leftArgument function rightArgument continuation => rfl
  | zeroThird environment leftContinuation function rightArgument
      rightContinuation => rfl
  | zeroFourth leftContinuation environment rightContinuation alpha => rfl

/-- Every local fuel row names an actual saturated `S` redex. -/
theorem FuelRow.contractAt?_eq (row : FuelRow) :
    row.term.contractAt? row.localAddress =
      row.term.replace? row.localAddress row.replacement := by
  cases row with
  | call fuel environment continuation =>
      cases fuel <;>
        simp [FuelRow.term, FuelRow.localAddress, FuelRow.replacement,
          Term.contractAt?, Term.contractRoot?, Term.redex, Term.contractum,
          C, b, Term.subterm?, Term.replace?]
  | positiveHalf residual leftEnvironment rightEnvironment continuation =>
      simp [FuelRow.term, FuelRow.localAddress, FuelRow.replacement,
        Term.contractAt?, Term.contractRoot?, Term.redex, Term.contractum,
        frame, Term.subterm?, Term.replace?]
  | zeroFirst leftEnvironment rightEnvironment continuation =>
      simp [FuelRow.term, FuelRow.localAddress, FuelRow.replacement,
        Term.contractAt?, Term.contractRoot?, Term.redex, Term.contractum,
        b, Term.subterm?, Term.replace?]
  | zeroSecond leftArgument function rightArgument continuation =>
      simp [FuelRow.term, FuelRow.localAddress, FuelRow.replacement,
        Term.contractAt?, Term.contractRoot?, Term.redex, Term.contractum,
        Term.subterm?, Term.replace?]
  | zeroThird environment leftContinuation function rightArgument
      rightContinuation =>
      simp [FuelRow.term, FuelRow.localAddress, FuelRow.replacement,
        Term.contractAt?, Term.contractRoot?, Term.redex, Term.contractum,
        b, Term.subterm?, Term.replace?]
  | zeroFourth leftContinuation environment rightContinuation alpha =>
      simp [FuelRow.term, FuelRow.localAddress, FuelRow.replacement,
        Term.contractAt?, Term.contractRoot?, Term.redex, Term.contractum,
        Term.subterm?, Term.replace?]

/-- The local replacement operation produces the displayed whole-row target. -/
theorem FuelRow.replace?_eq_some_target (row : FuelRow) :
    row.term.replace? row.localAddress row.replacement = some row.target := by
  cases row with
  | call fuel environment continuation =>
      cases fuel <;>
        simp [FuelRow.target, FuelRow.term, FuelRow.localAddress,
          FuelRow.replacement, Term.replace?, C, b]
  | positiveHalf residual leftEnvironment rightEnvironment continuation =>
      simp [FuelRow.target, FuelRow.term, FuelRow.localAddress,
        FuelRow.replacement, Term.replace?, frame]
  | zeroFirst leftEnvironment rightEnvironment continuation =>
      simp [FuelRow.target, FuelRow.term, FuelRow.localAddress,
        FuelRow.replacement, Term.replace?, b]
  | zeroSecond leftArgument function rightArgument continuation =>
      simp [FuelRow.target, FuelRow.term, FuelRow.localAddress,
        FuelRow.replacement, Term.replace?]
  | zeroThird environment leftContinuation function rightArgument
      rightContinuation =>
      simp [FuelRow.target, FuelRow.term, FuelRow.localAddress,
        FuelRow.replacement, Term.replace?, b]
  | zeroFourth leftContinuation environment rightContinuation alpha =>
      simp [FuelRow.target, FuelRow.term, FuelRow.localAddress,
        FuelRow.replacement, Term.replace?]

/-- Every local fuel row contracts to its exact displayed whole-row target. -/
theorem FuelRow.contractAt?_eq_some_target (row : FuelRow) :
    row.term.contractAt? row.localAddress = some row.target := by
  rw [row.contractAt?_eq, row.replace?_eq_some_target]

/-! ## Independent-field Base boundary -/

/--
Fields exposed by the open Base handoff.  The two continuation occurrences
remain separate, so classification never compares arbitrary continuation
subterms.
-/
structure OpenBaseView where
  queue : Term
  outerContinuation : Term
  innerContinuation : Term
  seedPayload : Term
  beta : Term
  deriving BEq, DecidableEq, Repr

def OpenBaseView.term (actions : Term) (view : OpenBaseView) : Term :=
  .app
    (.app view.outerContinuation
      (.app
        (.app
          (CheckpointDecoder.openEnvironment actions view.queue)
          (.app b
            (CheckpointDecoder.openEnvironment actions view.seedPayload)))
        view.innerContinuation))
    view.beta

/--
Parse the fixed open-Base wrapper while retaining both continuation fields.
Only the fixed `b` marker and fixed action wrappers are checked.
-/
def parseOpenBase? (actions : Term) : Term → Option OpenBaseView
  | .app
      (.app outerContinuation
        (.app
          (.app activeEnvironment (.app foundB dormantEnvironment))
          innerContinuation))
      beta =>
      if foundB = b then
        match CheckpointDecoder.parseEnvironment? actions activeEnvironment,
            CheckpointDecoder.parseEnvironment? actions dormantEnvironment with
        | some queue, some seedPayload =>
            some ⟨queue, outerContinuation, innerContinuation, seedPayload,
              beta⟩
        | _, _ => none
      else none
  | _ => none

/-- Successful independent-field Base parsing reconstructs the whole term. -/
theorem parseOpenBase?_sound
    {actions term : Term} {view : OpenBaseView}
    (h : parseOpenBase? actions term = some view) :
    term = view.term actions := by
  unfold parseOpenBase? at h
  split at h <;> try contradiction
  next outerContinuation activeEnvironment foundB dormantEnvironment
      innerContinuation beta =>
    split at h
    next hb =>
      generalize hactive :
        CheckpointDecoder.parseEnvironment? actions activeEnvironment =
          activeResult at h
      generalize hdormant :
        CheckpointDecoder.parseEnvironment? actions dormantEnvironment =
          dormantResult at h
      cases activeResult with
      | none => contradiction
      | some queue =>
          cases dormantResult with
          | none => contradiction
          | some seedPayload =>
              have hview := Option.some.inj h
              subst view
              subst foundB
              rw [CheckpointDecoder.parseEnvironment?_sound hactive,
                CheckpointDecoder.parseEnvironment?_sound hdormant]
              rfl
    next => contradiction

/-- Every independently represented open Base is accepted exactly. -/
@[simp]
theorem parseOpenBase?_generated
    (actions outerContinuation innerContinuation queue seedPayload beta :
      Term) :
    parseOpenBase? actions
        (OpenBaseView.term actions
          ⟨queue, outerContinuation, innerContinuation, seedPayload, beta⟩) =
      some ⟨queue, outerContinuation, innerContinuation, seedPayload,
        beta⟩ := by
  simp [parseOpenBase?, OpenBaseView.term,
    CheckpointDecoder.parseEnvironment?_open]

/-- A canonical Base is the equal-continuation instance of the open grammar. -/
theorem openBase_eq_independent
    (actions continuation queue seedPayload beta : Term) :
    CheckpointDecoder.openBase actions continuation queue seedPayload beta =
      OpenBaseView.term actions
        ⟨queue, continuation, continuation, seedPayload, beta⟩ :=
  rfl

/-- An independent open Base inherits two root arguments from its outer continuation. -/
theorem OpenBaseView.term_headArity (actions : Term) (view : OpenBaseView) :
    (view.term actions).headArity = view.outerContinuation.headArity + 2 :=
  rfl

/-! ## Pending-frame lift and carrier entry -/

/-- The active endpoint below the accumulated pending frames. -/
inductive FuelEndpoint where
  | row (value : FuelRow)
  | carrier (value : OpenBaseView)
  deriving BEq, DecidableEq, Repr

def FuelEndpoint.term (actions : Term) (endpoint : FuelEndpoint) : Term :=
  match endpoint with
  | FuelEndpoint.row value => FuelRow.term value
  | FuelEndpoint.carrier view => view.term actions

def FuelEndpoint.canonicalChild (endpoint : FuelEndpoint) : Term :=
  match endpoint with
  | FuelEndpoint.row value => value.focus
  | FuelEndpoint.carrier view => view.queue

def FuelEndpoint.childAddress (endpoint : FuelEndpoint) : Address :=
  match endpoint with
  | FuelEndpoint.row value => value.localAddress
  | FuelEndpoint.carrier _ => BasePath.wordAddress

def FuelEndpoint.selectedAddress? (endpoint : FuelEndpoint) : Option Address :=
  match endpoint with
  | FuelEndpoint.row value => some value.localAddress
  | FuelEndpoint.carrier _ => none

def FuelEndpoint.residual (endpoint : FuelEndpoint) : Nat :=
  match endpoint with
  | FuelEndpoint.row value => value.residual
  | FuelEndpoint.carrier _ => 0

/-- Complete syntax-derived state below the marked-history prefix. -/
structure FuelView where
  layers : List PendingLayer
  endpoint : FuelEndpoint
  deriving BEq, DecidableEq, Repr

def FuelView.term (actions : Term) (view : FuelView) : Term :=
  (pendingContext view.layers).plug (view.endpoint.term actions)

def FuelView.horizon (view : FuelView) : Nat :=
  view.layers.length + view.endpoint.residual

def FuelView.canonicalChildAddress (view : FuelView) : Address :=
  rights view.layers.length ++ view.endpoint.childAddress

def FuelView.selectedAddress? (view : FuelView) : Option Address :=
  view.endpoint.selectedAddress?.map
    (fun address => rights view.layers.length ++ address)

/-- Parse a local fuel row or the open Base boundary. -/
def parseFuelEndpoint? (actions term : Term) : Option FuelEndpoint :=
  match parseFuelRow? term with
  | some row => some (.row row)
  | none => (parseOpenBase? actions term).map .carrier

/--
Descend through literal pending frames whose environment wrapper is verified.
The seed payload is returned but never inspected.  Recursion is only into the
strict right child.
-/
def parseFuelActive? (actions : Term) : Term → Option FuelView
  | term@(.app (.app environment continuation) child) =>
      match CheckpointDecoder.parseEnvironment? actions environment with
      | some seedPayload =>
          match parseFuelActive? actions child with
          | some inner =>
              some ⟨⟨environment, continuation, seedPayload⟩ :: inner.layers,
                inner.endpoint⟩
          | none => parseFuelEndpoint? actions term |>.map fun endpoint =>
              ⟨[], endpoint⟩
      | none => parseFuelEndpoint? actions term |>.map fun endpoint =>
          ⟨[], endpoint⟩
  | term => parseFuelEndpoint? actions term |>.map fun endpoint =>
      ⟨[], endpoint⟩
termination_by term => term.size
decreasing_by
  exact Nat.lt_succ_of_le
    (Nat.le_add_left child.size (Term.app environment continuation).size)

/-- Successful endpoint parsing reconstructs the exact local boundary. -/
theorem parseFuelEndpoint?_sound
    {actions term : Term} {endpoint : FuelEndpoint}
    (h : parseFuelEndpoint? actions term = some endpoint) :
    term = endpoint.term actions := by
  unfold parseFuelEndpoint? at h
  generalize hrow : parseFuelRow? term = rowResult at h
  cases rowResult with
  | some row =>
      simp at h
      subst endpoint
      simpa [FuelEndpoint.term] using parseFuelRow?_sound hrow
  | none =>
      generalize hbase : parseOpenBase? actions term = baseResult at h
      cases baseResult with
      | none => simp at h
      | some base =>
          simp at h
          subst endpoint
          simpa [FuelEndpoint.term] using
            parseOpenBase?_sound hbase

/-- Successful recursive parsing reconstructs every pending context exactly. -/
theorem parseFuelActive?_sound
    {actions term : Term} {view : FuelView}
    (h : parseFuelActive? actions term = some view) :
    term = view.term actions := by
  induction term generalizing view with
  | s =>
      simp only [parseFuelActive?] at h
      rcases RootResetStageRegistry.optionMap_eq_some h with
        ⟨endpoint, hendpoint, hview⟩
      rw [← hview]
      simpa [FuelView.term] using parseFuelEndpoint?_sound hendpoint
  | app fn child fnIH childIH =>
      cases fn with
      | s =>
          simp only [parseFuelActive?] at h
          rcases RootResetStageRegistry.optionMap_eq_some h with
            ⟨endpoint, hendpoint, hview⟩
          rw [← hview]
          simpa [FuelView.term] using parseFuelEndpoint?_sound hendpoint
      | app environment continuation =>
          generalize henv : CheckpointDecoder.parseEnvironment? actions
            environment = environmentResult
          cases environmentResult with
          | none =>
              rw [parseFuelActive?, henv] at h
              rcases RootResetStageRegistry.optionMap_eq_some h with
                ⟨endpoint, hendpoint, hview⟩
              rw [← hview]
              simpa [FuelView.term] using parseFuelEndpoint?_sound hendpoint
          | some seedPayload =>
              generalize hinner : parseFuelActive? actions child = innerResult
              cases innerResult with
              | some inner =>
                  rw [parseFuelActive?, henv, hinner] at h
                  have hview := Option.some.inj h
                  rw [← hview]
                  have childEq := childIH hinner
                  simp [FuelView.term, pendingContext, childEq]
              | none =>
                  rw [parseFuelActive?, henv, hinner] at h
                  rcases RootResetStageRegistry.optionMap_eq_some h with
                    ⟨endpoint, hendpoint, hview⟩
                  rw [← hview]
                  simpa [FuelView.term] using parseFuelEndpoint?_sound hendpoint

/-- Every local row is an endpoint parse when it wins the role-free priority. -/
theorem parseFuelEndpoint?_row
    (actions : Term) (row : FuelRow)
    (hrow : parseFuelRow? row.term = some row) :
    parseFuelEndpoint? actions row.term = some (.row row) := by
  simp [parseFuelEndpoint?, hrow]

/-- Every open Base boundary is a carrier-entry endpoint when no fuel row wins. -/
theorem parseFuelEndpoint?_carrier
    (actions : Term) (view : OpenBaseView)
    (hrow : parseFuelRow?
      (FuelEndpoint.term actions (.carrier view)) = none) :
    parseFuelEndpoint? actions (FuelEndpoint.term actions (.carrier view)) =
      some (.carrier view) := by
  rcases view with
    ⟨queue, outerContinuation, innerContinuation, seedPayload, beta⟩
  rw [parseFuelEndpoint?]
  rw [hrow]
  simp [FuelEndpoint.term, parseOpenBase?_generated]

/-- A canonical equal-continuation Base reaches the independent carrier view. -/
theorem parseFuelEndpoint?_canonicalCarrier
    (actions continuation queue seedPayload beta : Term)
    (admissible : Carrier.Admissible continuation) :
    let view : OpenBaseView :=
      ⟨queue, continuation, continuation, seedPayload, beta⟩
    parseFuelEndpoint? actions
        (CheckpointDecoder.openBase actions continuation queue seedPayload
          beta) =
      some (.carrier view) := by
  dsimp only
  rw [openBase_eq_independent]
  apply parseFuelEndpoint?_carrier
  apply parseFuelRow?_none_of_four_lt_headArity
  simp only [FuelEndpoint.term]
  rw [OpenBaseView.term_headArity]
  rcases admissible with h | h
  · rw [h]
    decide
  · rw [h]
    decide

/-- An admissible continuation cannot be an open-environment wrapper. -/
theorem parseEnvironment?_none_of_admissible
    (actions continuation : Term)
    (admissible : Carrier.Admissible continuation) :
    CheckpointDecoder.parseEnvironment? actions continuation = none := by
  cases hparse : CheckpointDecoder.parseEnvironment? actions continuation with
  | none => rfl
  | some seedPayload =>
      have source := CheckpointDecoder.parseEnvironment?_sound hparse
      have arity := congrArg Term.headArity source
      rcases admissible with h | h
      · simp [CheckpointDecoder.openEnvironment, h] at arity
      · simp [CheckpointDecoder.openEnvironment, h] at arity

/-- The fifth zero-fuel sample enters the independent Base handoff. -/
theorem parseFuelActive?_canonicalCarrier
    (actions continuation queue seedPayload beta : Term)
    (admissible : Carrier.Admissible continuation) :
    let view : OpenBaseView :=
      ⟨queue, continuation, continuation, seedPayload, beta⟩
    parseFuelActive? actions
        (CheckpointDecoder.openBase actions continuation queue seedPayload
          beta) =
      some ⟨[], .carrier view⟩ := by
  dsimp only
  rw [show CheckpointDecoder.openBase actions continuation queue seedPayload
      beta =
      .app
        (.app continuation
          (.app
            (.app (CheckpointDecoder.openEnvironment actions queue)
              (.app b
                (CheckpointDecoder.openEnvironment actions seedPayload)))
            continuation))
        beta by rfl]
  rw [parseFuelActive?,
    parseEnvironment?_none_of_admissible actions continuation admissible]
  simp only
  have endpointParse := parseFuelEndpoint?_canonicalCarrier actions
    continuation queue seedPayload beta admissible
  change parseFuelEndpoint? actions
      (.app
        (.app continuation
          (.app
            (.app (CheckpointDecoder.openEnvironment actions queue)
              (.app b
                (CheckpointDecoder.openEnvironment actions seedPayload)))
            continuation))
        beta) =
      some (.carrier
        ⟨queue, continuation, continuation, seedPayload, beta⟩) at endpointParse
  rw [endpointParse]
  rfl

/-- Each registered pending layer contains a verified open environment. -/
def PendingLayersValid (actions : Term) : List PendingLayer → Prop
  | [] => True
  | layer :: layers =>
      layer.environment =
        CheckpointDecoder.openEnvironment actions layer.seedPayload ∧
      PendingLayersValid actions layers

/-- Valid outer pending layers parse completely around an accepted endpoint. -/
theorem parseFuelActive?_complete
    (actions : Term) (layers : List PendingLayer) (endpoint : FuelEndpoint)
    (valid : PendingLayersValid actions layers)
    (endpointParse : parseFuelActive? actions (endpoint.term actions) =
      some ⟨[], endpoint⟩) :
    parseFuelActive? actions
        ((pendingContext layers).plug (endpoint.term actions)) =
      some ⟨layers, endpoint⟩ := by
  induction layers with
  | nil => exact endpointParse
  | cons layer layers ih =>
      rcases layer with ⟨environment, continuation, seedPayload⟩
      rcases valid with ⟨henvironment, hvalid⟩
      simp only [PendingLayer.environment, PendingLayer.continuation,
        PendingLayer.seedPayload] at henvironment ⊢
      subst environment
      rw [pendingContext, Context.plug]
      have inner := ih hvalid
      simp [parseFuelActive?,
        CheckpointDecoder.parseEnvironment?_open, inner]

/-- The recursive address reaches the exact canonical child. -/
theorem FuelView.canonicalChild_subterm
    {actions term : Term} {view : FuelView}
    (h : parseFuelActive? actions term = some view) :
    term.subterm? view.canonicalChildAddress =
      some view.endpoint.canonicalChild := by
  rw [parseFuelActive?_sound h]
  unfold FuelView.canonicalChildAddress FuelView.term
  rw [← pendingContext_address]
  rw [RootResetWholeStageClassifier.subterm?_plug_contextAddress_append]
  cases hendpoint : view.endpoint with
  | row row =>
      simpa [FuelEndpoint.term, FuelEndpoint.childAddress,
        FuelEndpoint.canonicalChild, hendpoint] using row.focus_subterm
  | carrier carrier =>
      simp only [FuelEndpoint.term, FuelEndpoint.childAddress,
        FuelEndpoint.canonicalChild]
      simp [OpenBaseView.term, CheckpointDecoder.openEnvironment,
        BasePath.wordAddress, Term.subterm?]

/--
A selected pending-lifted fuel row contracts to the exact context lift of its
displayed local target.
-/
theorem FuelView.selected_contracts_exact
    {actions term : Term} {view : FuelView} {address : Address}
    (h : parseFuelActive? actions term = some view)
    (hselected : view.selectedAddress? = some address) :
    ∃ row, view.endpoint = .row row ∧
      term.contractAt? address =
        some ((pendingContext view.layers).plug row.target) := by
  cases hendpoint : view.endpoint with
  | carrier carrier =>
      simp [FuelView.selectedAddress?, FuelEndpoint.selectedAddress?,
        hendpoint] at hselected
  | row row =>
      have source := parseFuelActive?_sound h
      have lifted := RootResetWholeStageClassifier.contractAt?_plug_append
        (pendingContext view.layers) row.localAddress
          row.contractAt?_eq_some_target
      have addressEq : address = rights view.layers.length ++ row.localAddress := by
        simp [FuelView.selectedAddress?, FuelEndpoint.selectedAddress?, hendpoint]
          at hselected
        exact hselected.symm
      have sourceRow : term = (pendingContext view.layers).plug row.term := by
        rw [source]
        simp [FuelView.term, FuelEndpoint.term, hendpoint]
      refine ⟨row, rfl, ?_⟩
      rw [sourceRow, addressEq]
      simpa [pendingContext_address] using lifted

/-- A selected fuel address always has a verified target contraction. -/
theorem FuelView.selected_contracts
    {actions term : Term} {view : FuelView} {address : Address}
    (h : parseFuelActive? actions term = some view)
    (hselected : view.selectedAddress? = some address) :
    ∃ target, term.contractAt? address = some target := by
  obtain ⟨row, _, contract⟩ := view.selected_contracts_exact h hselected
  exact ⟨(pendingContext view.layers).plug row.target, contract⟩

/-- Entering a nonempty pending spine is a strict structural descent. -/
theorem FuelView.endpoint_size_lt_of_layers_ne_nil
    {actions term : Term} {view : FuelView}
    (h : parseFuelActive? actions term = some view)
    (hne : view.layers ≠ []) :
    (view.endpoint.term actions).size < term.size := by
  have source := parseFuelActive?_sound h
  have lookup : term.subterm? (rights view.layers.length) =
      some (view.endpoint.term actions) := by
    rw [source]
    have lifted :=
      RootResetWholeStageClassifier.subterm?_plug_contextAddress_append
        (pendingContext view.layers) (view.endpoint.term actions) []
    simpa [FuelView.term, pendingContext_address] using lifted
  cases haddress : rights view.layers.length with
  | nil =>
      have : view.layers.length = 0 := by
        have lengths := congrArg List.length haddress
        simpa using lengths
      exact False.elim (hne (List.length_eq_zero_iff.mp this))
  | cons direction rest =>
      rw [haddress] at lookup
      exact CarrierDecoder.subterm_size_lt lookup

/-! ## Clock occurrence facts -/

/-- Wrapper descent reaches the residual carrier pair. -/
theorem clockGrowthCore_subterm
    (stage wrappers residual : Nat) :
    (clockGrowthCore stage wrappers residual).subterm? (rights wrappers) =
      some (.app (C residual) (C stage)) := by
  induction wrappers with
  | zero => rfl
  | succ wrappers ih =>
      change
        (Term.app (Term.app Term.s (C stage))
          (clockGrowthCore stage wrappers residual)).subterm?
            (.right :: rights wrappers) = _
      exact ih

/-- The parsed clock address reaches the exact current clock redex. -/
theorem ClockView.focus_subterm
    {term : Term} {view : ClockView}
    (h : parseClock? term = some view) :
    term.subterm? view.focusAddress = some view.focus := by
  rw [parseClock?_sound h]
  cases hstage : view.stage with
  | growPositive =>
      simp [ClockView.term, ClockView.focusAddress, ClockView.focus, hstage,
        Term.subterm?, clockGrowthCore_subterm]
  | growZero =>
      simp [ClockView.term, ClockView.focusAddress, ClockView.focus, hstage,
        Term.subterm?, clockGrowthCore_subterm]
  | launch =>
      simp [ClockView.focusAddress, ClockView.focus, hstage, Term.subterm?]

/-- A parsed launch row has at least one remaining wrapper. -/
theorem ClockView.residual_pos_of_launch
    {term : Term} {view : ClockView}
    (h : parseClock? term = some view) (hstage : view.stage = .launch) :
    0 < view.residual := by
  cases term with
  | s => simp [parseClock?] at h
  | app core environment =>
      generalize hgrowth : parseClockCore? core = growthResult
      cases growthResult with
      | some growth =>
          by_cases hbalance : growth.wrappers + growth.residual = growth.stage
          · cases hresidual : growth.residual with
            | zero =>
                simp [parseClock?, hgrowth, hbalance, hresidual] at h
                have hview := h.2
                subst view
                simp at hstage
            | succ residual =>
                simp [parseClock?, hgrowth, hbalance, hresidual] at h
                have hview := h.2
                rw [← hview] at hstage
                simp at hstage
          · simp [parseClock?, hgrowth, hbalance] at h
      | none =>
          generalize hexit : parseClockExitCore? core = exitResult
          cases exitResult with
          | none => simp [parseClock?, hgrowth, hexit] at h
          | some exit =>
              cases hremaining : exit.remaining with
              | zero =>
                  simp [parseClock?, hgrowth, hexit, hremaining] at h
              | succ remaining =>
                  by_cases hbound : remaining + 1 ≤ exit.stage
                  · simp [parseClock?, hgrowth, hexit, hremaining, hbound] at h
                    subst view
                    exact Nat.zero_lt_succ remaining
                  · simp [parseClock?, hgrowth, hexit, hremaining, hbound] at h

/-- The focused clock redex contracts to the displayed local replacement. -/
theorem ClockView.focus_contractRoot?_eq
    {term : Term} {view : ClockView}
    (h : parseClock? term = some view) :
    view.focus.contractRoot? = some view.replacement := by
  cases hstage : view.stage with
  | growPositive =>
      cases hresidual : view.residual with
      | zero =>
          simp [ClockView.focus, ClockView.replacement, hstage, hresidual,
            clockBase, C, b, Term.contractRoot?, Term.redex,
            Term.contractum]
      | succ residual =>
          simp [ClockView.focus, ClockView.replacement, hstage, hresidual,
            C, b, Term.contractRoot?, Term.redex, Term.contractum]
  | growZero =>
      cases hresidual : view.residual with
      | zero =>
          simp [ClockView.focus, ClockView.replacement, hstage, hresidual,
            clockBase, C, b, Term.contractRoot?, Term.redex,
            Term.contractum]
      | succ residual =>
          simp [ClockView.focus, ClockView.replacement, hstage, hresidual,
            C, b, Term.contractRoot?, Term.redex, Term.contractum]
  | launch =>
      have positive := view.residual_pos_of_launch h hstage
      cases hresidual : view.residual with
      | zero => simp [hresidual] at positive
      | succ residual =>
          simp [ClockView.focus, ClockView.term, ClockView.replacement, hstage,
            hresidual, Dovetail.clockExit, Dovetail.jobSource, clockWrappers,
            Term.contractRoot?, Term.redex, Term.contractum]

/-- Exact clock contraction at the syntax-derived focus address. -/
theorem ClockView.contractAt?_eq
    {term : Term} {view : ClockView}
    (h : parseClock? term = some view) :
    term.contractAt? view.focusAddress =
      term.replace? view.focusAddress view.replacement := by
  simp only [Term.contractAt?, view.focus_subterm h,
    view.focus_contractRoot?_eq h]

/-- Every parsed clock row selects an actual saturated `S` redex. -/
theorem ClockView.selected_contracts
    {term : Term} {view : ClockView}
    (h : parseClock? term = some view) :
    ∃ target, term.contractAt? view.focusAddress = some target := by
  have focus := view.focus_subterm h
  have rootContracts : ∃ replacement,
      view.focus.contractRoot? = some replacement := by
    cases hstage : view.stage with
    | growPositive =>
        cases hresidual : view.residual with
        | zero =>
            refine ⟨Term.contractum b b (C view.horizon), ?_⟩
            simp [ClockView.focus, hstage, hresidual, C, b,
              Term.contractRoot?, Term.redex, Term.contractum]
        | succ residual =>
            refine ⟨Term.contractum .s (C residual) (C view.horizon), ?_⟩
            simp [ClockView.focus, hstage, hresidual, C, b,
              Term.contractRoot?, Term.redex, Term.contractum]
    | growZero =>
        cases hresidual : view.residual with
        | zero =>
            refine ⟨Term.contractum b b (C view.horizon), ?_⟩
            simp [ClockView.focus, hstage, hresidual, C, b,
              Term.contractRoot?, Term.redex, Term.contractum]
        | succ residual =>
            refine ⟨Term.contractum .s (C residual) (C view.horizon), ?_⟩
            simp [ClockView.focus, hstage, hresidual, C, b,
              Term.contractRoot?, Term.redex, Term.contractum]
    | launch =>
        have positive := view.residual_pos_of_launch h hstage
        cases hremaining : view.residual with
        | zero => simp [hremaining] at positive
        | succ remaining =>
            refine ⟨Term.contractum (C view.horizon)
              (clockWrappers view.horizon remaining) view.environment, ?_⟩
            simp [ClockView.focus, ClockView.term, hstage, hremaining,
              Dovetail.clockExit, clockWrappers, Term.contractRoot?,
              Term.redex, Term.contractum]
  obtain ⟨replacement, hroot⟩ := rootContracts
  obtain ⟨context, plug, replace⟩ := Term.context_of_subterm focus
  refine ⟨context.plug replacement, ?_⟩
  simp only [Term.contractAt?, focus, hroot]
  exact replace replacement

/-! ## Unified active and bare-root parsers -/

/-- Clock, fuel, and carrier-entry alternatives at the active endpoint. -/
inductive Active where
  | clock (view : ClockView)
  | fuel (view : FuelView)
  deriving BEq, DecidableEq, Repr

def Active.term (actions : Term) : Active → Term
  | .clock view => view.term
  | .fuel view => view.term actions

def Active.horizon : Active → Nat
  | .clock view => view.horizon
  | .fuel view => view.horizon

def Active.canonicalChild : Active → Term
  | .clock view => view.focus
  | .fuel view => view.endpoint.canonicalChild

def Active.canonicalChildAddress : Active → Address
  | .clock view => view.focusAddress
  | .fuel view => view.canonicalChildAddress

def Active.selectedAddress? : Active → Option Address
  | .clock view => some view.focusAddress
  | .fuel view => view.selectedAddress?

/-- Clock priority is structural and does not receive a role parameter. -/
def parseActive? (actions term : Term) : Option Active :=
  match parseClock? term with
  | some view => some (.clock view)
  | none => (parseFuelActive? actions term).map .fuel

theorem parseActive?_sound
    {actions term : Term} {active : Active}
    (h : parseActive? actions term = some active) :
    term = active.term actions := by
  unfold parseActive? at h
  generalize hclock : parseClock? term = clockResult at h
  cases clockResult with
  | some clock =>
      simp at h
      subst active
      simpa [Active.term] using parseClock?_sound hclock
  | none =>
      rcases RootResetStageRegistry.optionMap_eq_some h with
        ⟨fuel, hfuel, hactive⟩
      rw [← hactive]
      simpa [Active.term] using parseFuelActive?_sound hfuel

/-- Result of a parser invocation that starts at the whole bare root. -/
structure View (program : CTS.Program) where
  activeTerm : Term
  context : Context
  history : List (CheckpointDecoder.LocalView program)
  active : Active
  deriving BEq, DecidableEq, Repr

def View.phase {program : CTS.Program} (view : View program) :
    CTS.Phase program :=
  RootResetWholeStageClassifier.historyPhase program view.history

def View.horizon {program : CTS.Program} (view : View program) : Nat :=
  view.active.horizon

def View.canonicalChildAddress {program : CTS.Program}
    (view : View program) : Address :=
  RootResetSelectorContract.contextAddress view.context ++
    view.active.canonicalChildAddress

def View.selectedAddress? {program : CTS.Program}
    (view : View program) : Option Address :=
  view.active.selectedAddress?.map fun address =>
    RootResetSelectorContract.contextAddress view.context ++ address

/-- Total bare-root parser; program and dispatcher are fixed static inputs. -/
def parse?
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (term : Term) : Option (View program) :=
  let decomposition := peelMarked program tree term
  match parseActive? (compileActions program tree) decomposition.active with
  | none => none
  | some active =>
      some ⟨decomposition.active, decomposition.context,
        decomposition.history, active⟩

/-- Declarative whole placement through the canonical marked history. -/
structure WholeShape
    (program : CTS.Program)
    (tree : Dispatcher.Tree (ActionLabel program))
    (view : View program) (term : Term) : Prop where
  markedPrefix :
    MarkedPrefix program tree term view.activeTerm view.context view.history
  activeParse :
    parseActive? (compileActions program tree) view.activeTerm = some view.active
  activeSource :
    view.activeTerm = view.active.term (compileActions program tree)

theorem parse?_sound
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program}
    (h : parse? program tree term = some view) :
    WholeShape program tree view term := by
  dsimp [parse?] at h
  generalize hactive : parseActive? (compileActions program tree)
    (peelMarked program tree term).active = result at h
  cases result with
  | none => simp at h
  | some active =>
      simp at h
      subst view
      exact ⟨peelMarked_sound program tree term,
        hactive, parseActive?_sound hactive⟩

/-- Every declaratively placed registered clock/fuel row is accepted exactly. -/
theorem parse?_complete
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program}
    (shape : WholeShape program tree view term) :
    parse? program tree term = some view := by
  have unique := markedPrefix_eq_peelMarked shape.markedPrefix
  rcases view with ⟨activeTerm, context, history, active⟩
  simp only at unique shape ⊢
  rcases unique with ⟨activeEq, contextEq, historyEq⟩
  subst activeTerm
  subst context
  subst history
  simp only [parse?]
  rw [shape.activeParse]

theorem parse?_unique
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {first second : View program}
    (hfirst : parse? program tree term = some first)
    (hsecond : parse? program tree term = some second) :
    first = second := by
  rw [hfirst] at hsecond
  exact Option.some.inj hsecond

/-- Historical Locals surrounding every registered row are complete and marked. -/
theorem parse?_history_marked
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program}
    (h : parse? program tree term = some view) :
    MarkedHistory program view.history :=
  (parse?_sound h).markedPrefix.historical_views_marked

theorem WholeShape.clock_parse
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program} {clock : ClockView}
    (shape : WholeShape program tree view term)
    (hactive : view.active = .clock clock) :
    parseClock? view.activeTerm = some clock := by
  have parsed := shape.activeParse
  rw [hactive] at parsed
  unfold parseActive? at parsed
  generalize hclock : parseClock? view.activeTerm = result at parsed
  cases result with
  | some found =>
      have hfound : found = clock := by
        exact Active.clock.inj (Option.some.inj parsed)
      subst found
      rfl
  | none =>
      generalize hfuel : parseFuelActive? (compileActions program tree)
        view.activeTerm = fuelResult at parsed
      cases fuelResult <;> simp at parsed

theorem WholeShape.fuel_parse
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program} {fuel : FuelView}
    (shape : WholeShape program tree view term)
    (hactive : view.active = .fuel fuel) :
    parseFuelActive? (compileActions program tree) view.activeTerm = some fuel := by
  have parsed := shape.activeParse
  rw [hactive] at parsed
  unfold parseActive? at parsed
  generalize hclock : parseClock? view.activeTerm = result at parsed
  cases result with
  | some found => simp at parsed
  | none =>
      rcases RootResetStageRegistry.optionMap_eq_some parsed with
        ⟨found, hfound, heq⟩
      have : found = fuel := Active.fuel.inj heq
      subst found
      exact hfound

/-- Whole root-relative lookup reaches the reconstructed canonical child. -/
theorem View.canonicalChild_subterm
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program}
    (h : parse? program tree term = some view) :
    term.subterm? view.canonicalChildAddress =
      some view.active.canonicalChild := by
  have shape := parse?_sound h
  rw [← shape.markedPrefix.source_eq]
  unfold View.canonicalChildAddress
  rw [RootResetWholeStageClassifier.subterm?_plug_contextAddress_append]
  cases hactive : view.active with
  | clock clock =>
      have parsed := shape.clock_parse hactive
      simpa [Active.canonicalChild, Active.canonicalChildAddress, hactive]
        using clock.focus_subterm parsed
  | fuel fuel =>
      have parsedFuel := shape.fuel_parse hactive
      simpa [Active.canonicalChild, Active.canonicalChildAddress, hactive]
        using fuel.canonicalChild_subterm parsedFuel

/-- Every selected whole clock/fuel address is a verified contraction. -/
theorem View.selected_contracts
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program} {address : Address}
    (h : parse? program tree term = some view)
    (hselected : view.selectedAddress? = some address) :
    ∃ target, term.contractAt? address = some target := by
  have shape := parse?_sound h
  cases hactive : view.active with
  | clock clock =>
      have localSelected : address =
          RootResetSelectorContract.contextAddress view.context ++
            clock.focusAddress := by
        simp [View.selectedAddress?, Active.selectedAddress?, hactive]
          at hselected
        exact hselected.symm
      have parsedClock := shape.clock_parse hactive
      obtain ⟨localTarget, localContract⟩ := clock.selected_contracts parsedClock
      have lifted := RootResetWholeStageClassifier.contractAt?_plug_append
        view.context clock.focusAddress localContract
      rw [← shape.markedPrefix.source_eq, localSelected]
      exact ⟨view.context.plug localTarget, lifted⟩
  | fuel fuel =>
      have hlocal : ∃ localAddress,
          fuel.selectedAddress? = some localAddress ∧
          address = RootResetSelectorContract.contextAddress view.context ++
            localAddress := by
        unfold View.selectedAddress? at hselected
        rw [hactive] at hselected
        rcases RootResetStageRegistry.optionMap_eq_some hselected with
          ⟨localAddress, hlocal, haddress⟩
        exact ⟨localAddress, hlocal, haddress.symm⟩
      obtain ⟨localAddress, hlocal, haddress⟩ := hlocal
      have parsedFuel := shape.fuel_parse hactive
      obtain ⟨localTarget, localContract⟩ :=
        fuel.selected_contracts parsedFuel hlocal
      have lifted := RootResetWholeStageClassifier.contractAt?_plug_append
        view.context localAddress localContract
      rw [← shape.markedPrefix.source_eq, haddress]
      exact ⟨view.context.plug localTarget, lifted⟩

/-! ## Disjointness and payload opacity -/

/-- Clock and fuel results are disjoint registered alternatives. -/
theorem Active.clock_ne_fuel (clock : ClockView) (fuel : FuelView) :
    Active.clock clock ≠ Active.fuel fuel := by
  intro h
  cases h

/-- Same-input active classification has one unique stage and coordinate tuple. -/
theorem parseActive?_unique
    {actions term : Term} {first second : Active}
    (hfirst : parseActive? actions term = some first)
    (hsecond : parseActive? actions term = some second) :
    first = second := by
  rw [hfirst] at hsecond
  exact Option.some.inj hsecond

/-- Fuel-call rows win the local classifier for arbitrary opaque runtime fields. -/
@[simp]
theorem parseFuelRow?_generated_call
    (fuel : Nat) (environment continuation : Term) :
    parseFuelRow? (.app (.app (C fuel) environment) continuation) =
      some (.call fuel environment continuation) := by
  simp [parseFuelRow?, parseFuelCall?_generated]

/-- Row and carrier-entry endpoints are disjoint registered alternatives. -/
theorem FuelEndpoint.row_ne_carrier
    (row : FuelRow) (carrier : OpenBaseView) :
    FuelEndpoint.row row ≠ FuelEndpoint.carrier carrier := by
  intro h
  cases h

/-- Pending depth plus residual is the literal reconstructed fuel horizon. -/
theorem FuelView.horizon_eq
    (layers : List PendingLayer) (endpoint : FuelEndpoint) :
    FuelView.horizon ⟨layers, endpoint⟩ =
      layers.length + endpoint.residual :=
  rfl

/-- At a residual call, completed frame depth plus unary fuel is the horizon. -/
@[simp]
theorem FuelView.horizon_call
    (layers : List PendingLayer) (fuel : Nat)
    (environment continuation : Term) :
    FuelView.horizon ⟨layers,
      .row (.call fuel environment continuation)⟩ =
      layers.length + fuel :=
  rfl

/-- The whole source is recovered by returning through its marked context. -/
theorem View.source_eq
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program}
    (h : parse? program tree term = some view) :
    view.context.plug view.activeTerm = term :=
  (parse?_sound h).markedPrefix.source_eq

/-- A non-root canonical child is a strict structural descendant. -/
theorem View.canonicalChild_size_lt_of_address_cons
    {program : CTS.Program}
    {tree : Dispatcher.Tree (ActionLabel program)}
    {term : Term} {view : View program}
    (h : parse? program tree term = some view)
    {direction : Direction} {rest : Address}
    (haddress : view.canonicalChildAddress = direction :: rest) :
    view.active.canonicalChild.size < term.size := by
  have lookup := view.canonicalChild_subterm h
  rw [haddress] at lookup
  exact CarrierDecoder.subterm_size_lt lookup

/-- A pending wrapper exposes its payload without inspecting it. -/
theorem parseFuelActive?_pending
    (actions seedPayload continuation child : Term)
    {inner : FuelView}
    (hinner : parseFuelActive? actions child = some inner) :
    parseFuelActive? actions
        (frame (CheckpointDecoder.openEnvironment actions seedPayload)
          continuation child) =
      some ⟨⟨CheckpointDecoder.openEnvironment actions seedPayload,
        continuation, seedPayload⟩ :: inner.layers, inner.endpoint⟩ := by
  simp [frame, parseFuelActive?,
    CheckpointDecoder.parseEnvironment?_open, hinner]

/-- Pending-frame payload changes preserve depth, horizon, and endpoint. -/
theorem pending_payload_opaque
    (actions firstPayload secondPayload continuation child : Term)
    {inner : FuelView}
    (hinner : parseFuelActive? actions child = some inner) :
    let first : FuelView := ⟨⟨CheckpointDecoder.openEnvironment actions firstPayload,
      continuation, firstPayload⟩ :: inner.layers, inner.endpoint⟩
    let second : FuelView := ⟨⟨CheckpointDecoder.openEnvironment actions secondPayload,
      continuation, secondPayload⟩ :: inner.layers, inner.endpoint⟩
    parseFuelActive? actions
        (frame (CheckpointDecoder.openEnvironment actions firstPayload)
          continuation child) = some first ∧
      parseFuelActive? actions
        (frame (CheckpointDecoder.openEnvironment actions secondPayload)
          continuation child) = some second ∧
      first.horizon = second.horizon ∧
      first.endpoint = second.endpoint ∧
      first.canonicalChildAddress = second.canonicalChildAddress := by
  dsimp only
  refine ⟨parseFuelActive?_pending actions firstPayload continuation child hinner,
    parseFuelActive?_pending actions secondPayload continuation child hinner, ?_⟩
  simp [FuelView.horizon, FuelView.canonicalChildAddress]

end PureSFormal.Research.RootResetClockFuelStages
