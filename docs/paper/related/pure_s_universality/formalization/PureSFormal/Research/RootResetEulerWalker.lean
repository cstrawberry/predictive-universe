import PureSFormal.Research.RootResetSelectorContract

/-!
# Root-reset Euler redex walker

The controller performs a preorder scan of the current finite occurrence
tree.  At each application it probes the left spine to depth three, restores
the probe origin on both outcomes, and issues `Rdx` exactly after observing
the saturated `S` head.  A failed probe descends to the application's left
child.  Leaf returns follow parent links until the next right subtree or the
whole-term root is reached.
-/

namespace PureSFormal.Research.RootResetEulerWalker

open PureSFormal.PureS
open PureSFormal.PureS.FiniteController
open RootResetSelectorContract

/-- Finite program counters of the complete preorder redex scan. -/
inductive Control where
  | visit
  | probe1
  | probe2
  | probe3
  | descend
  | fail2
  | fail3a
  | fail3b
  | success3a
  | success3b
  | contract
  | afterLeft
  | ascend
  | doneNF
  | doneRedex
  deriving BEq, DecidableEq, Inhabited, Repr

/-- Duplicate-free explicit cover of the fifteen controller states. -/
def states : List Control :=
  [.visit, .probe1, .probe2, .probe3, .descend, .fail2, .fail3a,
   .fail3b, .success3a, .success3b, .contract, .afterLeft, .ascend,
   .doneNF, .doneRedex]

theorem mem_states (control : Control) : control ∈ states := by
  cases control <;> simp [states]

theorem states_nodup : states.Nodup := by
  decide

@[simp]
theorem states_length : states.length = 15 :=
  rfl

/-- Local transition table for the origin-restoring preorder scan. -/
def transition : Control → Probe.NodeKind → Probe.Incoming →
    Command Control
  | .visit, .app, _ => .exec .L .probe1
  | .visit, .s, .root => .stay .doneNF
  | .visit, .s, .left => .exec .U .afterLeft
  | .visit, .s, .right => .exec .U .ascend
  | .probe1, .s, _ => .exec .U .descend
  | .probe1, .app, _ => .exec .L .probe2
  | .probe2, .s, _ => .exec .U .fail2
  | .probe2, .app, _ => .exec .L .probe3
  | .probe3, .s, _ => .exec .U .success3a
  | .probe3, .app, _ => .exec .U .fail3a
  | .descend, .app, _ => .exec .L .visit
  | .descend, .s, _ => .reject
  | .fail2, _, _ => .exec .U .descend
  | .fail3a, _, _ => .exec .U .fail3b
  | .fail3b, _, _ => .exec .U .descend
  | .success3a, _, _ => .exec .U .success3b
  | .success3b, _, _ => .exec .U .contract
  | .contract, _, _ => .exec .Rdx .doneRedex
  | .afterLeft, .app, _ => .exec .R .visit
  | .afterLeft, .s, _ => .reject
  | .ascend, _, .root => .stay .doneNF
  | .ascend, _, .left => .exec .U .afterLeft
  | .ascend, _, .right => .exec .U .ascend
  | .doneNF, _, _ => .stay .doneNF
  | .doneRedex, _, _ => .stay .doneRedex

/-- One fixed finite-state machine for every finite pure-S term. -/
def machine : Machine Control where
  stateCover := fun _ => states
  covers := mem_states
  transition := transition

/-- Every invocation starts at the whole-term root in `visit`. -/
def initial (term : Term) : Configuration Control :=
  ⟨some .visit, Cursor.atRoot term⟩

/-- Terminal interpretation of the two distinguished halt controls. -/
def haltKind : Control → Option HaltKind
  | .doneNF => some .nf
  | .doneRedex => some .redex
  | _ => none

/-- Both declared terminal controls are absorbing for every local observation. -/
theorem terminal_controls_absorbing (control : Control)
    (node : Probe.NodeKind) (incoming : Probe.Incoming)
    (halted : (haltKind control).isSome = true) :
    machine.transition control node incoming = .stay control := by
  cases control <;> simp [haltKind] at halted
  all_goals cases node <;> cases incoming <;> rfl

/-- Any successful mutation returned by a bounded execution is genuine. -/
theorem seekMutation_sound {fuel : Nat} {source : Term}
    {after : Configuration Control}
    (h : FiniteController.seekMutation machine fuel (initial source) =
      some after) : Step source after.cursor.erase := by
  simpa [initial] using FiniteController.seekMutation_sound machine h

/-! ## Executable preorder specification -/

/-- First redex address in root-left-right preorder. -/
def firstRedexAddress? : Term → Option Address
  | .s => none
  | term@(.app fn arg) =>
      match term.contractRoot? with
      | some _ => some []
      | none =>
          match firstRedexAddress? fn with
          | some address => some (.left :: address)
          | none => (firstRedexAddress? arg).map (.right :: ·)

/-- Address contraction under an application's left edge. -/
theorem contractAt?_app_left (fn arg : Term) (address : Address) :
    (Term.app fn arg).contractAt? (.left :: address) =
      (fn.contractAt? address).map (fun target => .app target arg) := by
  unfold Term.contractAt?
  generalize hselected : fn.subterm? address = selected
  cases selected with
  | none => simp [Term.subterm?, hselected]
  | some selected =>
      generalize hroot : selected.contractRoot? = replacement
      cases replacement with
      | none => simp [Term.subterm?, hselected, hroot]
      | some replacement =>
          generalize hreplace : fn.replace? address replacement = target
          cases target <;>
            simp [Term.subterm?, Term.replace?, hselected, hroot, hreplace]

/-- Address contraction under an application's right edge. -/
theorem contractAt?_app_right (fn arg : Term) (address : Address) :
    (Term.app fn arg).contractAt? (.right :: address) =
      (arg.contractAt? address).map (fun target => .app fn target) := by
  unfold Term.contractAt?
  generalize hselected : arg.subterm? address = selected
  cases selected with
  | none => simp [Term.subterm?, hselected]
  | some selected =>
      generalize hroot : selected.contractRoot? = replacement
      cases replacement with
      | none => simp [Term.subterm?, hselected, hroot]
      | some replacement =>
          generalize hreplace : arg.replace? address replacement = target
          cases target <;>
            simp [Term.subterm?, Term.replace?, hselected, hroot, hreplace]

/-- A returned preorder address admits one exact address-level contraction. -/
theorem firstRedexAddress?_sound : ∀ {term : Term} {address : Address},
    firstRedexAddress? term = some address →
      ∃ target, term.contractAt? address = some target := by
  intro term
  induction term with
  | s =>
      intro address selected
      simp [firstRedexAddress?] at selected
  | app fn arg fnIH argIH =>
      intro address selected
      generalize hroot : (Term.app fn arg).contractRoot? = rootResult at selected
      cases rootResult with
      | some replacement =>
          simp only [firstRedexAddress?, hroot] at selected
          have addressEq : address = [] := Option.some.inj selected.symm
          subst address
          refine ⟨replacement, ?_⟩
          simp [Term.contractAt?, hroot]
      | none =>
          simp only [firstRedexAddress?, hroot] at selected
          generalize hleft : firstRedexAddress? fn = leftResult at selected
          cases leftResult with
          | some leftAddress =>
              simp only [hleft] at selected
              have addressEq : address = .left :: leftAddress :=
                Option.some.inj selected.symm
              subst address
              obtain ⟨leftTarget, contracts⟩ := fnIH hleft
              refine ⟨.app leftTarget arg, ?_⟩
              rw [contractAt?_app_left, contracts]
              rfl
          | none =>
              simp only [hleft] at selected
              generalize hright : firstRedexAddress? arg = rightResult at selected
              cases rightResult with
              | none => simp [hright] at selected
              | some rightAddress =>
                  simp only [hright, Option.map] at selected
                  have addressEq : address = .right :: rightAddress :=
                    Option.some.inj selected.symm
                  subst address
                  obtain ⟨rightTarget, contracts⟩ := argIH hright
                  refine ⟨.app fn rightTarget, ?_⟩
                  rw [contractAt?_app_right, contracts]
                  rfl

/-- Failure of the preorder search is exactly address-wise normality. -/
theorem firstRedexAddress?_none_addressNormal : ∀ {term : Term},
    firstRedexAddress? term = none → AddressNormal term := by
  intro term
  induction term with
  | s =>
      intro _ address
      cases address with
      | nil => rfl
      | cons direction rest => cases direction <;> rfl
  | app fn arg fnIH argIH =>
      intro absent
      generalize hroot : (Term.app fn arg).contractRoot? = rootResult at absent
      cases rootResult with
      | some replacement => simp [firstRedexAddress?, hroot] at absent
      | none =>
          simp only [firstRedexAddress?, hroot] at absent
          generalize hleft : firstRedexAddress? fn = leftResult at absent
          cases leftResult with
          | some leftAddress => simp [hleft] at absent
          | none =>
              simp only [hleft] at absent
              have hright : firstRedexAddress? arg = none := by
                simpa using absent
              have fnNormal := fnIH hleft
              have argNormal := argIH hright
              intro address
              cases address with
              | nil => simp [Term.contractAt?, hroot]
              | cons direction rest =>
                  cases direction with
                  | left => rw [contractAt?_app_left, fnNormal rest]; rfl
                  | right => rw [contractAt?_app_right, argNormal rest]; rfl

/-- Every address-normal term makes the preorder search return `none`. -/
theorem firstRedexAddress?_none_of_addressNormal : ∀ {term : Term},
    AddressNormal term → firstRedexAddress? term = none := by
  intro term normal
  cases selected : firstRedexAddress? term with
  | none => rfl
  | some address =>
      obtain ⟨target, contracts⟩ := firstRedexAddress?_sound selected
      rw [normal address] at contracts
      contradiction

/-- The preorder search returns `none` exactly on normal forms. -/
theorem firstRedexAddress?_eq_none_iff (term : Term) :
    firstRedexAddress? term = none ↔ AddressNormal term :=
  ⟨firstRedexAddress?_none_addressNormal,
    firstRedexAddress?_none_of_addressNormal⟩

/-! ## Fuel-free stopping-time recursion -/

/-- A completed finite controller execution. -/
structure Execution where
  ticks : Nat
  final : Configuration Control

/-- Logical entry modes used to compute the controller's stopping time. -/
inductive DriveInput where
  | scan (focus : Term) (parents : List ParentFrame)
  | ascend (focus : Term) (parents : List ParentFrame)

/-- Concrete controller configuration represented by a logical drive input. -/
def DriveInput.configuration : DriveInput → Configuration Control
  | .scan focus parents => ⟨some .visit, ⟨focus, parents⟩⟩
  | .ascend focus parents => ⟨some .ascend, ⟨focus, parents⟩⟩

/-- Sizes of all right subtrees still pending above the current focus. -/
def pendingSize : List ParentFrame → Nat
  | [] => 0
  | .left rightSibling :: parents => rightSibling.size + pendingSize parents
  | .right _ :: parents => pendingSize parents

/-- Unvisited-node count at a scan or ascent macro boundary. -/
def DriveInput.remaining : DriveInput → Nat
  | .scan focus parents => focus.size + pendingSize parents
  | .ascend _ parents => pendingSize parents

/-- Strict recursion measure for the two traversal modes. -/
def DriveInput.measure : DriveInput → Nat
  | input@(.scan _ parents) =>
      4 * input.remaining + 2 * parents.length
  | input@(.ascend _ parents) =>
      4 * input.remaining + 2 * parents.length + 1

/-- Failed origin-restoring probe length at an application root. -/
def probeFailureTicks : Term → Nat
  | .s => 3
  | .app .s _ => 5
  | .app (.app _ _) _ => 7

/--
Proof-level fuel recursion used to compute a stopping time.  The fuel is absent
from the finite-controller configuration and transition table.  The zero case
is unreachable in every certified invocation.
-/
def driveFuel : Nat → DriveInput → Execution
  | 0, input => ⟨0, ⟨none, input.configuration.cursor⟩⟩
  | _fuel + 1, .scan .s [] =>
      ⟨1, ⟨some .doneNF, Cursor.atRoot .s⟩⟩
  | fuel + 1, .scan .s (.left rightSibling :: parents) =>
      let tail := driveFuel fuel
        (.scan rightSibling (.right .s :: parents))
      ⟨2 + tail.ticks, tail.final⟩
  | fuel + 1, .scan .s (.right leftSibling :: parents) =>
      let tail := driveFuel fuel (.ascend (.app leftSibling .s) parents)
      ⟨1 + tail.ticks, tail.final⟩
  | fuel + 1, .scan term@(.app fn arg) parents =>
      match term.contractRoot? with
      | some replacement =>
          ⟨7, ⟨some .doneRedex, ⟨replacement, parents⟩⟩⟩
      | none =>
          let tail := driveFuel fuel (.scan fn (.left arg :: parents))
          ⟨probeFailureTicks fn + tail.ticks, tail.final⟩
  | _fuel + 1, .ascend focus [] =>
      ⟨1, ⟨some .doneNF, Cursor.atRoot focus⟩⟩
  | fuel + 1, .ascend focus (.left rightSibling :: parents) =>
      let tail := driveFuel fuel
        (.scan rightSibling (.right focus :: parents))
      ⟨2 + tail.ticks, tail.final⟩
  | fuel + 1, .ascend focus (.right leftSibling :: parents) =>
      let tail := driveFuel fuel (.ascend (.app leftSibling focus) parents)
      ⟨1 + tail.ticks, tail.final⟩

/-- Structurally budgeted stopping-time computation. -/
def drive (input : DriveInput) : Execution :=
  driveFuel (input.measure + 1) input

/--
Root invocation of the structurally bounded proof-level stopping-time
computation.  Its concrete controller configuration and transition table carry
no fuel.
-/
def rootExecution (term : Term) : Execution :=
  drive (.scan term [])

/-! ## Exact agreement with the finite controller -/

@[simp]
theorem run_scan_s_root :
    FiniteController.run machine 1
        (DriveInput.scan .s []).configuration =
      ⟨some .doneNF, Cursor.atRoot .s⟩ :=
  rfl

@[simp]
theorem run_scan_s_left (rightSibling : Term)
    (parents : List ParentFrame) :
    FiniteController.run machine 2
        (DriveInput.scan .s (.left rightSibling :: parents)).configuration =
      (DriveInput.scan rightSibling (.right .s :: parents)).configuration :=
  rfl

@[simp]
theorem run_scan_s_right (leftSibling : Term)
    (parents : List ParentFrame) :
    FiniteController.run machine 1
        (DriveInput.scan .s (.right leftSibling :: parents)).configuration =
      (DriveInput.ascend (.app leftSibling .s) parents).configuration :=
  rfl

@[simp]
theorem run_scan_redex (fn arg replacement : Term)
    (parents : List ParentFrame)
    (hroot : (Term.app fn arg).contractRoot? = some replacement) :
    FiniteController.run machine 7
        (DriveInput.scan (.app fn arg) parents).configuration =
      ⟨some .doneRedex, ⟨replacement, parents⟩⟩ := by
  cases fn with
  | s => simp [Term.contractRoot?] at hroot
  | app fn₂ y =>
      cases fn₂ with
      | s => simp [Term.contractRoot?] at hroot
      | app head x =>
          cases head with
          | s =>
              simp only [Term.contractRoot?, Option.some.injEq] at hroot
              subst replacement
              rfl
          | app headFn headArg => simp [Term.contractRoot?] at hroot

@[simp]
theorem run_failed_probe (fn arg : Term) (parents : List ParentFrame)
    (hroot : (Term.app fn arg).contractRoot? = none) :
    FiniteController.run machine (probeFailureTicks fn)
        (DriveInput.scan (.app fn arg) parents).configuration =
      (DriveInput.scan fn (.left arg :: parents)).configuration := by
  cases fn with
  | s => rfl
  | app fn₂ y =>
      cases fn₂ with
      | s => rfl
      | app head x =>
          cases head with
          | s => simp [Term.contractRoot?] at hroot
          | app headFn headArg => rfl

@[simp]
theorem run_ascend_root (focus : Term) :
    FiniteController.run machine 1
        (DriveInput.ascend focus []).configuration =
      ⟨some .doneNF, Cursor.atRoot focus⟩ :=
  rfl

@[simp]
theorem run_ascend_left (focus rightSibling : Term)
    (parents : List ParentFrame) :
    FiniteController.run machine 2
        (DriveInput.ascend focus (.left rightSibling :: parents)).configuration =
      (DriveInput.scan rightSibling (.right focus :: parents)).configuration :=
  rfl

@[simp]
theorem run_ascend_right (focus leftSibling : Term)
    (parents : List ParentFrame) :
    FiniteController.run machine 1
        (DriveInput.ascend focus (.right leftSibling :: parents)).configuration =
      (DriveInput.ascend (.app leftSibling focus) parents).configuration :=
  rfl

/-! ## Exact mutation counts of the traversal macros -/

/-- Terminal controls determine the intended total mutation count. -/
def terminalMutationCount : RuntimeControl Control → Nat
  | some .doneRedex => 1
  | _ => 0

@[simp]
theorem runMutationCount_scan_s_root :
    FiniteController.runMutationCount machine 1
      (DriveInput.scan .s []).configuration = 0 :=
  rfl

@[simp]
theorem runMutationCount_scan_s_left (rightSibling : Term)
    (parents : List ParentFrame) :
    FiniteController.runMutationCount machine 2
      (DriveInput.scan .s (.left rightSibling :: parents)).configuration = 0 :=
  rfl

@[simp]
theorem runMutationCount_scan_s_right (leftSibling : Term)
    (parents : List ParentFrame) :
    FiniteController.runMutationCount machine 1
      (DriveInput.scan .s (.right leftSibling :: parents)).configuration = 0 :=
  rfl

@[simp]
theorem runMutationCount_scan_redex (fn arg replacement : Term)
    (parents : List ParentFrame)
    (hroot : (Term.app fn arg).contractRoot? = some replacement) :
    FiniteController.runMutationCount machine 7
      (DriveInput.scan (.app fn arg) parents).configuration = 1 := by
  cases fn with
  | s => simp [Term.contractRoot?] at hroot
  | app fn₂ y =>
      cases fn₂ with
      | s => simp [Term.contractRoot?] at hroot
      | app head x =>
          cases head with
          | s =>
              simp only [Term.contractRoot?, Option.some.injEq] at hroot
              subst replacement
              rfl
          | app headFn headArg => simp [Term.contractRoot?] at hroot

@[simp]
theorem runMutationCount_failed_probe (fn arg : Term)
    (parents : List ParentFrame)
    (hroot : (Term.app fn arg).contractRoot? = none) :
    FiniteController.runMutationCount machine (probeFailureTicks fn)
      (DriveInput.scan (.app fn arg) parents).configuration = 0 := by
  cases fn with
  | s => rfl
  | app fn₂ y =>
      cases fn₂ with
      | s => rfl
      | app head x =>
          cases head with
          | s => simp [Term.contractRoot?] at hroot
          | app headFn headArg => rfl

@[simp]
theorem runMutationCount_ascend_root (focus : Term) :
    FiniteController.runMutationCount machine 1
      (DriveInput.ascend focus []).configuration = 0 :=
  rfl

@[simp]
theorem runMutationCount_ascend_left (focus rightSibling : Term)
    (parents : List ParentFrame) :
    FiniteController.runMutationCount machine 2
      (DriveInput.ascend focus (.left rightSibling :: parents)).configuration =
        0 :=
  rfl

@[simp]
theorem runMutationCount_ascend_right (focus leftSibling : Term)
    (parents : List ParentFrame) :
    FiniteController.runMutationCount machine 1
      (DriveInput.ascend focus (.right leftSibling :: parents)).configuration =
        0 :=
  rfl

/-! ## Structural stopping measure -/

/-- One recursive macro boundary strictly lowers the structural measure. -/
theorem measure_scan_s_left (rightSibling : Term)
    (parents : List ParentFrame) :
    (DriveInput.scan rightSibling (.right .s :: parents)).measure <
      (DriveInput.scan .s (.left rightSibling :: parents)).measure := by
  simp only [DriveInput.measure, DriveInput.remaining, pendingSize, Term.size,
    List.length_cons]
  apply Nat.add_lt_add_right
  apply Nat.mul_lt_mul_of_pos_left
  · simpa only [Nat.one_add] using
      Nat.lt_succ_self (rightSibling.size + pendingSize parents)
  · decide

theorem measure_scan_s_right (leftSibling : Term)
    (parents : List ParentFrame) :
    (DriveInput.ascend (.app leftSibling .s) parents).measure <
      (DriveInput.scan .s (.right leftSibling :: parents)).measure := by
  simp only [DriveInput.measure, DriveInput.remaining, pendingSize, Term.size,
    List.length_cons]
  let base := 4 * pendingSize parents + 2 * parents.length
  have leftEq :
      4 * pendingSize parents + 2 * parents.length + 1 = base + 1 := rfl
  have rightEq :
      4 * (1 + pendingSize parents) + 2 * (parents.length + 1) =
        (base + 4) + 2 := by
    dsimp [base]
    simp only [Nat.mul_add, Nat.mul_one, Nat.add_mul]
    simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
  rw [leftEq, rightEq]
  exact Nat.lt_of_lt_of_le
    (Nat.add_lt_add_left (by decide : 1 < 4) base)
    (Nat.le_add_right (base + 4) 2)

theorem measure_scan_app_left (fn arg : Term)
    (parents : List ParentFrame) :
    (DriveInput.scan fn (.left arg :: parents)).measure <
      (DriveInput.scan (.app fn arg) parents).measure := by
  simp only [DriveInput.measure, DriveInput.remaining, pendingSize, Term.size,
    List.length_cons]
  let base := 4 * fn.size + 4 * arg.size +
    4 * pendingSize parents + 2 * parents.length
  have leftEq :
      4 * (fn.size + (arg.size + pendingSize parents)) +
          2 * (parents.length + 1) = base + 2 := by
    dsimp [base]
    simp only [Nat.mul_add, Nat.mul_one]
    simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
  have rightEq :
      4 * (fn.size + arg.size + 1 + pendingSize parents) +
          2 * parents.length = base + 4 := by
    dsimp [base]
    simp only [Nat.mul_add, Nat.mul_one]
    simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
  rw [leftEq, rightEq]
  exact Nat.add_lt_add_left (by decide : 2 < 4) base

theorem measure_ascend_left (focus rightSibling : Term)
    (parents : List ParentFrame) :
    (DriveInput.scan rightSibling (.right focus :: parents)).measure <
      (DriveInput.ascend focus (.left rightSibling :: parents)).measure := by
  simp only [DriveInput.measure, DriveInput.remaining, pendingSize, Term.size,
    List.length_cons]
  exact Nat.lt_succ_self _

theorem measure_ascend_right (focus leftSibling : Term)
    (parents : List ParentFrame) :
    (DriveInput.ascend (.app leftSibling focus) parents).measure <
      (DriveInput.ascend focus (.right leftSibling :: parents)).measure := by
  simp only [DriveInput.measure, DriveInput.remaining, pendingSize, Term.size,
    List.length_cons, Nat.mul_add, Nat.mul_one]
  apply Nat.add_lt_add_right
  apply Nat.add_lt_add_left
  exact Nat.lt_add_of_pos_right (by decide : 0 < 2)

/-- Sufficient proof-level fuel computes the exact concrete controller run. -/
theorem driveFuel_run : ∀ (fuel : Nat) (input : DriveInput),
    input.measure < fuel →
    FiniteController.run machine (driveFuel fuel input).ticks
        input.configuration = (driveFuel fuel input).final := by
  intro fuel
  induction fuel with
  | zero =>
      intro input enough
      exact False.elim (Nat.not_lt_zero _ enough)
  | succ fuel ih =>
      intro input enough
      cases input with
      | scan focus parents =>
          cases focus with
          | s =>
              cases parents with
              | nil => exact run_scan_s_root
              | cons frame parents =>
                  cases frame with
                  | left rightSibling =>
                      have decrease := measure_scan_s_left rightSibling parents
                      have tailEnough :
                          (DriveInput.scan rightSibling
                            (.right .s :: parents)).measure < fuel := by
                        exact Nat.lt_of_lt_of_le decrease
                          (Nat.le_of_lt_succ enough)
                      have tailRun := ih _ tailEnough
                      simp only [driveFuel, Execution.ticks, Execution.final]
                      rw [FiniteController.run_add, run_scan_s_left]
                      exact tailRun
                  | right leftSibling =>
                      have decrease := measure_scan_s_right leftSibling parents
                      have tailEnough :
                          (DriveInput.ascend (.app leftSibling .s)
                            parents).measure < fuel := by
                        exact Nat.lt_of_lt_of_le decrease
                          (Nat.le_of_lt_succ enough)
                      have tailRun := ih _ tailEnough
                      simp only [driveFuel, Execution.ticks, Execution.final]
                      rw [FiniteController.run_add, run_scan_s_right]
                      exact tailRun
          | app fn arg =>
              cases hroot : (Term.app fn arg).contractRoot? with
              | some replacement =>
                  simpa only [driveFuel, hroot, Execution.ticks,
                    Execution.final] using
                      run_scan_redex fn arg replacement parents hroot
              | none =>
                  have decrease := measure_scan_app_left fn arg parents
                  have tailEnough :
                      (DriveInput.scan fn (.left arg :: parents)).measure <
                        fuel := by
                    exact Nat.lt_of_lt_of_le decrease
                      (Nat.le_of_lt_succ enough)
                  have tailRun := ih _ tailEnough
                  simp only [driveFuel, hroot, Execution.ticks,
                    Execution.final]
                  rw [FiniteController.run_add,
                    run_failed_probe fn arg parents hroot]
                  exact tailRun
      | ascend focus parents =>
          cases parents with
          | nil => exact run_ascend_root focus
          | cons frame parents =>
              cases frame with
              | left rightSibling =>
                  have decrease := measure_ascend_left focus rightSibling parents
                  have tailEnough :
                      (DriveInput.scan rightSibling
                        (.right focus :: parents)).measure < fuel := by
                    exact Nat.lt_of_lt_of_le decrease
                      (Nat.le_of_lt_succ enough)
                  have tailRun := ih _ tailEnough
                  simp only [driveFuel, Execution.ticks, Execution.final]
                  rw [FiniteController.run_add, run_ascend_left]
                  exact tailRun
              | right leftSibling =>
                  have decrease := measure_ascend_right focus leftSibling parents
                  have tailEnough :
                      (DriveInput.ascend (.app leftSibling focus)
                        parents).measure < fuel := by
                    exact Nat.lt_of_lt_of_le decrease
                      (Nat.le_of_lt_succ enough)
                  have tailRun := ih _ tailEnough
                  simp only [driveFuel, Execution.ticks, Execution.final]
                  rw [FiniteController.run_add, run_ascend_right]
                  exact tailRun

/--
Sufficient proof-level fuel executes no successful `Rdx` on an NF traversal
and exactly one successful `Rdx` on a redex traversal.
-/
theorem driveFuel_runMutationCount : ∀ (fuel : Nat) (input : DriveInput),
    input.measure < fuel →
    FiniteController.runMutationCount machine (driveFuel fuel input).ticks
        input.configuration =
      terminalMutationCount (driveFuel fuel input).final.control := by
  intro fuel
  induction fuel with
  | zero =>
      intro input enough
      exact False.elim (Nat.not_lt_zero _ enough)
  | succ fuel ih =>
      intro input enough
      cases input with
      | scan focus parents =>
          cases focus with
          | s =>
              cases parents with
              | nil => rfl
              | cons frame parents =>
                  cases frame with
                  | left rightSibling =>
                      have decrease := measure_scan_s_left rightSibling parents
                      have tailEnough :
                          (DriveInput.scan rightSibling
                            (.right .s :: parents)).measure < fuel := by
                        exact Nat.lt_of_lt_of_le decrease
                          (Nat.le_of_lt_succ enough)
                      have tailCount := ih _ tailEnough
                      simp only [driveFuel, Execution.ticks, Execution.final]
                      rw [FiniteController.runMutationCount_add,
                        runMutationCount_scan_s_left, Nat.zero_add,
                        run_scan_s_left]
                      exact tailCount
                  | right leftSibling =>
                      have decrease := measure_scan_s_right leftSibling parents
                      have tailEnough :
                          (DriveInput.ascend (.app leftSibling .s)
                            parents).measure < fuel := by
                        exact Nat.lt_of_lt_of_le decrease
                          (Nat.le_of_lt_succ enough)
                      have tailCount := ih _ tailEnough
                      simp only [driveFuel, Execution.ticks, Execution.final]
                      rw [FiniteController.runMutationCount_add,
                        runMutationCount_scan_s_right, Nat.zero_add,
                        run_scan_s_right]
                      exact tailCount
          | app fn arg =>
              cases hroot : (Term.app fn arg).contractRoot? with
              | some replacement =>
                  simpa only [driveFuel, hroot, Execution.ticks,
                    Execution.final, terminalMutationCount] using
                      runMutationCount_scan_redex fn arg replacement parents hroot
              | none =>
                  have decrease := measure_scan_app_left fn arg parents
                  have tailEnough :
                      (DriveInput.scan fn (.left arg :: parents)).measure <
                        fuel := by
                    exact Nat.lt_of_lt_of_le decrease
                      (Nat.le_of_lt_succ enough)
                  have tailCount := ih _ tailEnough
                  simp only [driveFuel, hroot, Execution.ticks,
                    Execution.final]
                  rw [FiniteController.runMutationCount_add,
                    runMutationCount_failed_probe fn arg parents hroot,
                    Nat.zero_add, run_failed_probe fn arg parents hroot]
                  exact tailCount
      | ascend focus parents =>
          cases parents with
          | nil => rfl
          | cons frame parents =>
              cases frame with
              | left rightSibling =>
                  have decrease := measure_ascend_left focus rightSibling parents
                  have tailEnough :
                      (DriveInput.scan rightSibling
                        (.right focus :: parents)).measure < fuel := by
                    exact Nat.lt_of_lt_of_le decrease
                      (Nat.le_of_lt_succ enough)
                  have tailCount := ih _ tailEnough
                  simp only [driveFuel, Execution.ticks, Execution.final]
                  rw [FiniteController.runMutationCount_add,
                    runMutationCount_ascend_left, Nat.zero_add,
                    run_ascend_left]
                  exact tailCount
              | right leftSibling =>
                  have decrease := measure_ascend_right focus leftSibling parents
                  have tailEnough :
                      (DriveInput.ascend (.app leftSibling focus)
                        parents).measure < fuel := by
                    exact Nat.lt_of_lt_of_le decrease
                      (Nat.le_of_lt_succ enough)
                  have tailCount := ih _ tailEnough
                  simp only [driveFuel, Execution.ticks, Execution.final]
                  rw [FiniteController.runMutationCount_add,
                    runMutationCount_ascend_right, Nat.zero_add,
                    run_ascend_right]
                  exact tailCount

/-- The structurally budgeted recursion agrees with the finite controller. -/
theorem drive_run (input : DriveInput) :
    FiniteController.run machine (drive input).ticks input.configuration =
      (drive input).final := by
  unfold drive
  exact driveFuel_run _ input (Nat.lt_succ_self input.measure)

/-- The structurally budgeted drive has its exact outcome-sensitive count. -/
theorem drive_runMutationCount (input : DriveInput) :
    FiniteController.runMutationCount machine (drive input).ticks
        input.configuration = terminalMutationCount (drive input).final.control := by
  unfold drive
  exact driveFuel_runMutationCount _ input (Nat.lt_succ_self input.measure)

/-! ## A uniform linear stopping bound -/

/-- Each origin-restoring root probe uses at most seven microinstructions. -/
theorem probeFailureTicks_le_seven (term : Term) :
    probeFailureTicks term ≤ 7 := by
  cases term with
  | s => decide
  | app fn arg => cases fn <;> simp [probeFailureTicks]

/-- A structural budget for every recursive drive boundary. -/
def DriveInput.tickBudget (input : DriveInput) : Nat :=
  7 * (input.measure + 1)

/-- Every structural budget pays for one full seven-tick probe. -/
theorem seven_le_tickBudget (input : DriveInput) : 7 ≤ input.tickBudget := by
  unfold DriveInput.tickBudget
  have positive : 1 ≤ input.measure + 1 :=
    Nat.succ_le_succ (Nat.zero_le input.measure)
  simpa only [Nat.mul_one] using Nat.mul_le_mul_left 7 positive

/-- A strict macro-measure decrease pays for any prefix of at most seven ticks. -/
theorem prefix_add_tickBudget_le {headTicks : Nat} {child parent : DriveInput}
    (prefixBound : headTicks ≤ 7) (decrease : child.measure < parent.measure) :
    headTicks + child.tickBudget ≤ parent.tickBudget := by
  unfold DriveInput.tickBudget
  have childSucc : child.measure + 1 ≤ parent.measure :=
    Nat.add_one_le_iff.mpr decrease
  have withNext : child.measure + 1 + 1 ≤ parent.measure + 1 :=
    Nat.add_le_add_right childSucc 1
  have scaled := Nat.mul_le_mul_left 7 withNext
  calc
    headTicks + 7 * (child.measure + 1) ≤
        7 + 7 * (child.measure + 1) :=
      Nat.add_le_add_right prefixBound _
    _ = 7 * (child.measure + 1 + 1) := by
      simp only [Nat.mul_add, Nat.mul_one]
      simp only [Nat.add_assoc, Nat.add_comm, Nat.add_left_comm]
    _ ≤ 7 * (parent.measure + 1) := scaled

/-- Sufficient proof-level fuel fits the explicit structural budget. -/
theorem driveFuel_ticks_le_tickBudget : ∀ (fuel : Nat)
    (input : DriveInput), input.measure < fuel →
      (driveFuel fuel input).ticks ≤ input.tickBudget := by
  intro fuel
  induction fuel with
  | zero =>
      intro input enough
      exact False.elim (Nat.not_lt_zero _ enough)
  | succ fuel ih =>
      intro input enough
      cases input with
      | scan focus parents =>
          cases focus with
          | s =>
              cases parents with
              | nil =>
                  exact Nat.le_trans (by decide : 1 ≤ 7)
                    (seven_le_tickBudget _)
              | cons frame parents =>
                  cases frame with
                  | left rightSibling =>
                      have decrease := measure_scan_s_left rightSibling parents
                      have tailEnough :
                          (DriveInput.scan rightSibling
                            (.right .s :: parents)).measure < fuel := by
                        exact Nat.lt_of_lt_of_le decrease
                          (Nat.le_of_lt_succ enough)
                      have tailBound := ih _ tailEnough
                      simp only [driveFuel, Execution.ticks]
                      exact Nat.le_trans
                        (Nat.add_le_add_left tailBound 2)
                        (prefix_add_tickBudget_le (by decide) decrease)
                  | right leftSibling =>
                      have decrease := measure_scan_s_right leftSibling parents
                      have tailEnough :
                          (DriveInput.ascend (.app leftSibling .s)
                            parents).measure < fuel := by
                        exact Nat.lt_of_lt_of_le decrease
                          (Nat.le_of_lt_succ enough)
                      have tailBound := ih _ tailEnough
                      simp only [driveFuel, Execution.ticks]
                      exact Nat.le_trans
                        (Nat.add_le_add_left tailBound 1)
                        (prefix_add_tickBudget_le (by decide) decrease)
          | app fn arg =>
              cases hroot : (Term.app fn arg).contractRoot? with
              | some replacement =>
                  simp only [driveFuel, hroot, Execution.ticks]
                  exact seven_le_tickBudget _
              | none =>
                  have decrease := measure_scan_app_left fn arg parents
                  have tailEnough :
                      (DriveInput.scan fn (.left arg :: parents)).measure <
                        fuel := by
                    exact Nat.lt_of_lt_of_le decrease
                      (Nat.le_of_lt_succ enough)
                  have tailBound := ih _ tailEnough
                  have probeBound := probeFailureTicks_le_seven fn
                  simp only [driveFuel, hroot, Execution.ticks]
                  exact Nat.le_trans
                    (Nat.add_le_add_left tailBound (probeFailureTicks fn))
                    (prefix_add_tickBudget_le probeBound decrease)
      | ascend focus parents =>
          cases parents with
          | nil =>
              exact Nat.le_trans (by decide : 1 ≤ 7)
                (seven_le_tickBudget _)
          | cons frame parents =>
              cases frame with
              | left rightSibling =>
                  have decrease := measure_ascend_left focus rightSibling parents
                  have tailEnough :
                      (DriveInput.scan rightSibling
                        (.right focus :: parents)).measure < fuel := by
                    exact Nat.lt_of_lt_of_le decrease
                      (Nat.le_of_lt_succ enough)
                  have tailBound := ih _ tailEnough
                  simp only [driveFuel, Execution.ticks]
                  exact Nat.le_trans
                    (Nat.add_le_add_left tailBound 2)
                    (prefix_add_tickBudget_le (by decide) decrease)
              | right leftSibling =>
                  have decrease := measure_ascend_right focus leftSibling parents
                  have tailEnough :
                      (DriveInput.ascend (.app leftSibling focus)
                        parents).measure < fuel := by
                    exact Nat.lt_of_lt_of_le decrease
                      (Nat.le_of_lt_succ enough)
                  have tailBound := ih _ tailEnough
                  simp only [driveFuel, Execution.ticks]
                  exact Nat.le_trans
                    (Nat.add_le_add_left tailBound 1)
                    (prefix_add_tickBudget_le (by decide) decrease)

/-- The structurally budgeted stopping time fits the traversal budget. -/
theorem drive_ticks_le_tickBudget (input : DriveInput) :
    (drive input).ticks ≤ input.tickBudget := by
  unfold drive
  exact driveFuel_ticks_le_tickBudget _ input
    (Nat.lt_succ_self input.measure)

/-- Every whole-term invocation halts within `28 (|T| + 1)` microticks. -/
theorem rootExecution_ticks_le (term : Term) :
    (rootExecution term).ticks ≤ 28 * (term.size + 1) := by
  change (drive (.scan term [])).ticks ≤ 28 * (term.size + 1)
  have bounded := drive_ticks_le_tickBudget (.scan term [])
  have inside : 4 * term.size + 1 ≤ 4 * (term.size + 1) := by
    rw [Nat.mul_add]
    exact Nat.add_le_add_left (by decide : 1 ≤ 4) (4 * term.size)
  have scaled := Nat.mul_le_mul_left 7 inside
  have scaled' :
      7 * (4 * term.size + 1) ≤ 28 * (term.size + 1) := by
    calc
      7 * (4 * term.size + 1) ≤ 7 * (4 * (term.size + 1)) := scaled
      _ = 28 * (term.size + 1) := by
        rw [← Nat.mul_assoc]
  exact Nat.le_trans bounded (by
    simpa [DriveInput.tickBudget, DriveInput.measure,
      DriveInput.remaining, pendingSize] using scaled')

/-- The issued `L`/`R`/`U` movement-instruction count has the same bound. -/
theorem rootExecution_moves_le (term : Term) :
    runMoveCount machine (rootExecution term).ticks (initial term) ≤
      28 * (term.size + 1) :=
  Nat.le_trans
    (runMoveCount_le_ticks machine _ (initial term))
    (rootExecution_ticks_le term)

/-! ## Semantic traversal invariant and certified outcomes -/

/-- The leaf `S` contains no address-level redex. -/
theorem addressNormal_s : AddressNormal .s := by
  intro address
  cases address with
  | nil => rfl
  | cons direction rest => cases direction <;> rfl

/-- A root-inert application of two normal terms is address-normal. -/
theorem addressNormal_app {fn arg : Term}
    (hroot : (Term.app fn arg).contractRoot? = none)
    (fnNormal : AddressNormal fn) (argNormal : AddressNormal arg) :
    AddressNormal (.app fn arg) := by
  intro address
  cases address with
  | nil => simp [Term.contractAt?, hroot]
  | cons direction rest =>
      cases direction with
      | left => rw [contractAt?_app_left, fnNormal rest]; rfl
      | right => rw [contractAt?_app_right, argNormal rest]; rfl

/--
Every pending frame records an inert ancestor root.  A right-child frame also
records that its already traversed left sibling is normal.
-/
def FramesReady (focus : Term) : List ParentFrame → Prop
  | [] => True
  | .left rightSibling :: parents =>
      (Term.app focus rightSibling).contractRoot? = none ∧
        FramesReady (.app focus rightSibling) parents
  | .right leftSibling :: parents =>
      AddressNormal leftSibling ∧
        (Term.app leftSibling focus).contractRoot? = none ∧
        FramesReady (.app leftSibling focus) parents

/-- Scan mode has ready ancestors; ascent additionally has a normal focus. -/
def DriveReady : DriveInput → Prop
  | .scan focus parents => FramesReady focus parents
  | .ascend focus parents => AddressNormal focus ∧ FramesReady focus parents

/-- Terminal certificate for one proof-level fuel and logical boundary. -/
def FuelCertificate (fuel : Nat) (input : DriveInput) : Prop :=
  let source := input.configuration.cursor.erase
  let final := (driveFuel fuel input).final
  (final.control = some .doneNF ∧
      AddressNormal source ∧ final.cursor.erase = source) ∨
    (final.control = some .doneRedex ∧
      source.contractAt? (cursorAddress final.cursor) =
        some final.cursor.erase)

/-- A ready boundary with sufficient fuel has an exact terminal certificate. -/
theorem driveFuel_certificate : ∀ (fuel : Nat) (input : DriveInput),
    input.measure < fuel → DriveReady input → FuelCertificate fuel input := by
  intro fuel
  induction fuel with
  | zero =>
      intro input enough ready
      exact False.elim (Nat.not_lt_zero _ enough)
  | succ fuel ih =>
      intro input enough ready
      cases input with
      | scan focus parents =>
          cases focus with
          | s =>
              cases parents with
              | nil =>
                  exact Or.inl ⟨rfl, addressNormal_s, rfl⟩
              | cons frame parents =>
                  cases frame with
                  | left rightSibling =>
                      have decrease := measure_scan_s_left rightSibling parents
                      have tailEnough :
                          (DriveInput.scan rightSibling
                            (.right .s :: parents)).measure < fuel := by
                        exact Nat.lt_of_lt_of_le decrease
                          (Nat.le_of_lt_succ enough)
                      rcases ready with ⟨hroot, outerReady⟩
                      have tailReady :
                          DriveReady (.scan rightSibling
                            (.right .s :: parents)) :=
                        ⟨addressNormal_s, hroot, outerReady⟩
                      have tailCertificate := ih _ tailEnough tailReady
                      simpa [FuelCertificate, driveFuel,
                        DriveInput.configuration, Cursor.erase] using!
                          tailCertificate
                  | right leftSibling =>
                      have decrease := measure_scan_s_right leftSibling parents
                      have tailEnough :
                          (DriveInput.ascend (.app leftSibling .s)
                            parents).measure < fuel := by
                        exact Nat.lt_of_lt_of_le decrease
                          (Nat.le_of_lt_succ enough)
                      rcases ready with ⟨leftNormal, hroot, outerReady⟩
                      have parentNormal : AddressNormal (.app leftSibling .s) :=
                        addressNormal_app hroot leftNormal addressNormal_s
                      have tailReady :
                          DriveReady (.ascend (.app leftSibling .s) parents) :=
                        ⟨parentNormal, outerReady⟩
                      have tailCertificate := ih _ tailEnough tailReady
                      simpa [FuelCertificate, driveFuel,
                        DriveInput.configuration, Cursor.erase] using!
                          tailCertificate
          | app fn arg =>
              cases hroot : (Term.app fn arg).contractRoot? with
              | some replacement =>
                  unfold FuelCertificate
                  simp only [driveFuel, hroot, Execution.final,
                    DriveInput.configuration]
                  refine Or.inr ⟨True.intro, ?_⟩
                  simpa [Cursor.erase, cursorAddress, hroot] using
                    contractAt?_cursorAddress
                      (Cursor.mk (.app fn arg) parents)
              | none =>
                  have decrease := measure_scan_app_left fn arg parents
                  have tailEnough :
                      (DriveInput.scan fn (.left arg :: parents)).measure <
                        fuel := by
                    exact Nat.lt_of_lt_of_le decrease
                      (Nat.le_of_lt_succ enough)
                  have tailReady :
                      DriveReady (.scan fn (.left arg :: parents)) :=
                    ⟨hroot, ready⟩
                  have tailCertificate := ih _ tailEnough tailReady
                  simpa [FuelCertificate, driveFuel, hroot,
                    DriveInput.configuration, Cursor.erase] using!
                      tailCertificate
      | ascend focus parents =>
          cases parents with
          | nil =>
              exact Or.inl ⟨rfl, ready.1, rfl⟩
          | cons frame parents =>
              cases frame with
              | left rightSibling =>
                  have decrease := measure_ascend_left focus rightSibling parents
                  have tailEnough :
                      (DriveInput.scan rightSibling
                        (.right focus :: parents)).measure < fuel := by
                    exact Nat.lt_of_lt_of_le decrease
                      (Nat.le_of_lt_succ enough)
                  rcases ready with ⟨focusNormal, hroot, outerReady⟩
                  have tailReady :
                      DriveReady (.scan rightSibling
                        (.right focus :: parents)) :=
                    ⟨focusNormal, hroot, outerReady⟩
                  have tailCertificate := ih _ tailEnough tailReady
                  simpa [FuelCertificate, driveFuel,
                    DriveInput.configuration, Cursor.erase] using!
                      tailCertificate
              | right leftSibling =>
                  have decrease := measure_ascend_right focus leftSibling parents
                  have tailEnough :
                      (DriveInput.ascend (.app leftSibling focus)
                        parents).measure < fuel := by
                    exact Nat.lt_of_lt_of_le decrease
                      (Nat.le_of_lt_succ enough)
                  rcases ready with
                    ⟨focusNormal, leftNormal, hroot, outerReady⟩
                  have parentNormal : AddressNormal (.app leftSibling focus) :=
                    addressNormal_app hroot leftNormal focusNormal
                  have tailReady :
                      DriveReady (.ascend (.app leftSibling focus) parents) :=
                    ⟨parentNormal, outerReady⟩
                  have tailCertificate := ih _ tailEnough tailReady
                  simpa [FuelCertificate, driveFuel,
                    DriveInput.configuration, Cursor.erase] using!
                      tailCertificate

/-- Terminal certificate expressed against the invocation's original term. -/
def DriveCertificate (input : DriveInput) : Prop :=
  FuelCertificate (input.measure + 1) input

/-- A ready logical boundary terminates with an exact NF or redex certificate. -/
theorem drive_certificate (input : DriveInput) (ready : DriveReady input) :
    DriveCertificate input :=
  driveFuel_certificate _ input (Nat.lt_succ_self input.measure) ready

/-- The root drive's logical readiness premise is vacuous. -/
theorem root_drive_ready (term : Term) : DriveReady (.scan term []) :=
  True.intro

/-- The proof-level stopping time agrees exactly with the root controller run. -/
theorem run_rootExecution_eq (term : Term) :
    FiniteController.run machine (rootExecution term).ticks (initial term) =
      (rootExecution term).final := by
  simpa only [rootExecution, initial, DriveInput.configuration] using!
    drive_run (.scan term [])

/-- The root invocation's successful mutation count is determined by its halt. -/
theorem rootExecution_runMutationCount (term : Term) :
    FiniteController.runMutationCount machine (rootExecution term).ticks
        (initial term) =
      terminalMutationCount (rootExecution term).final.control := by
  simpa only [rootExecution, initial, DriveInput.configuration] using!
    drive_runMutationCount (.scan term [])

/-- Every root invocation returns either an exact NF or exact redex result. -/
theorem rootExecution_certificate (term : Term) :
    let final := (rootExecution term).final
    (final.control = some .doneNF ∧
        AddressNormal term ∧ final.cursor.erase = term) ∨
      (final.control = some .doneRedex ∧
        term.contractAt? (cursorAddress final.cursor) =
          some final.cursor.erase) := by
  simpa [rootExecution, DriveCertificate, DriveInput.configuration,
    Cursor.erase] using!
      drive_certificate (.scan term []) (root_drive_ready term)

/-- The root execution always reaches one of the two halt controls. -/
theorem rootExecution_terminal_cases (term : Term) :
    (rootExecution term).final.control = some .doneNF ∨
      (rootExecution term).final.control = some .doneRedex := by
  rcases rootExecution_certificate term with normal | redex
  · exact Or.inl normal.1
  · exact Or.inr redex.1

/-- A reported NF control carries address-wise normality of the input. -/
theorem rootExecution_nf_normal (term : Term)
    (halted : (rootExecution term).final.control = some .doneNF) :
    AddressNormal term := by
  rcases rootExecution_certificate term with normal | redex
  · exact normal.2.1
  · have impossible : Control.doneNF = .doneRedex :=
      Option.some.inj (halted.symm.trans redex.1)
    cases impossible

/-- A reported NF control has preserved the bare input term. -/
theorem rootExecution_nf_erase (term : Term)
    (halted : (rootExecution term).final.control = some .doneNF) :
    (rootExecution term).final.cursor.erase = term := by
  rcases rootExecution_certificate term with normal | redex
  · exact normal.2.2
  · have impossible : Control.doneNF = .doneRedex :=
      Option.some.inj (halted.symm.trans redex.1)
    cases impossible

/-- A reported redex control carries the exact address contraction equation. -/
theorem rootExecution_redex_contracts (term : Term)
    (halted : (rootExecution term).final.control = some .doneRedex) :
    term.contractAt?
        (cursorAddress (rootExecution term).final.cursor) =
      some (rootExecution term).final.cursor.erase := by
  rcases rootExecution_certificate term with normal | redex
  · have impossible : Control.doneRedex = .doneNF :=
      Option.some.inj (halted.symm.trans normal.1)
    cases impossible
  · exact redex.2

/-- Constructive dependent answer returned by the root-reset walker. -/
def outcome (term : Term) : Outcome term :=
  let final := (rootExecution term).final
  if halted : final.control = some .doneNF then
    .nf (rootExecution_nf_normal term halted)
  else
    have redexHalt : final.control = some .doneRedex := by
      rcases rootExecution_terminal_cases term with normal | redex
      · exact False.elim (halted normal)
      · exact redex
    .redex (cursorAddress final.cursor) final.cursor.erase
      (rootExecution_redex_contracts term redexHalt)

/-- The root execution is terminal in the selector contract's runtime tag. -/
theorem rootExecution_terminal (term : Term) :
    (runtimeHaltKind haltKind
      (rootExecution term).final.control).isSome = true := by
  rcases rootExecution_terminal_cases term with normal | redex
  · simp [normal, runtimeHaltKind, haltKind]
  · simp [redex, runtimeHaltKind, haltKind]

/-- The dependent answer and concrete terminal configuration agree exactly. -/
theorem outcome_agrees (term : Term) :
    let final := (rootExecution term).final
    match outcome term with
    | .nf _ =>
        runtimeHaltKind haltKind final.control = some .nf ∧
          final.cursor.erase = term
    | .redex address target _ =>
        runtimeHaltKind haltKind final.control = some .redex ∧
          cursorAddress final.cursor = address ∧
          final.cursor.erase = target := by
  by_cases halted :
      (rootExecution term).final.control = some .doneNF
  · simp only [outcome, halted, dite_true]
    exact ⟨by simp [halted, runtimeHaltKind, haltKind],
      rootExecution_nf_erase term halted⟩
  · have redexHalt :
        (rootExecution term).final.control = some .doneRedex := by
      rcases rootExecution_terminal_cases term with normal | redex
      · exact False.elim (halted normal)
      · exact redex
    simp only [outcome, halted, dite_false]
    simp [redexHalt, runtimeHaltKind, haltKind]

/-- NF answers perform zero successful contractions; redex answers perform one. -/
theorem outcome_mutationCount_agrees (term : Term) :
    match outcome term with
    | .nf _ =>
        FiniteController.runMutationCount machine (rootExecution term).ticks
          (initial term) = 0
    | .redex _ _ _ =>
        FiniteController.runMutationCount machine (rootExecution term).ticks
          (initial term) = 1 := by
  by_cases halted :
      (rootExecution term).final.control = some .doneNF
  · simp only [outcome, halted, dite_true]
    rw [rootExecution_runMutationCount, halted]
    rfl
  · have redexHalt :
        (rootExecution term).final.control = some .doneRedex := by
      rcases rootExecution_terminal_cases term with normal | redex
      · exact False.elim (halted normal)
      · exact redex
    simp only [outcome, halted, dite_false]
    rw [rootExecution_runMutationCount, redexHalt]
    rfl

/-- Complete all-input root-reset selector instance with coefficient 28. -/
def selectorContract : RootResetSelectorContract.Contract where
  Control := Control
  machine := machine
  start := .visit
  haltKind := haltKind
  coefficient := 28
  coefficient_pos := by decide
  stoppingTime := fun term => (rootExecution term).ticks
  outcome := outcome
  stoppingTime_le := rootExecution_ticks_le
  terminal := by
    intro term
    have runEq :
        FiniteController.run machine (rootExecution term).ticks
            ⟨some .visit, Cursor.atRoot term⟩ =
          (rootExecution term).final := by
      simpa only [initial] using run_rootExecution_eq term
    rw [runEq]
    exact rootExecution_terminal term
  terminal_absorbing := terminal_controls_absorbing
  outcome_agrees := by
    intro term
    have runEq :
        FiniteController.run machine (rootExecution term).ticks
            ⟨some .visit, Cursor.atRoot term⟩ =
          (rootExecution term).final := by
      simpa only [initial] using run_rootExecution_eq term
    rw [runEq]
    exact outcome_agrees term
  mutationCount_agrees := by
    intro term
    simpa only [initial] using! outcome_mutationCount_agrees term

/-! ## Stateless root-reset boundary -/

/-- The compiled controller contains exactly fifteen ordinary control states. -/
theorem compiled_control_state_cardinality : machine.states.length = 15 :=
  states_length

/-- Every invocation begins in `visit`, independent of the input term. -/
@[simp]
theorem invocation_initial_control (term : Term) :
    (initial term).control = some .visit :=
  rfl

/-- Every invocation begins at the root of its current bare input term. -/
@[simp]
theorem invocation_initial_cursor (term : Term) :
    (initial term).cursor = Cursor.atRoot term :=
  rfl

/-- There is exactly one possible inter-invocation state value. -/
theorem interInvocationState_unique
    (first second :
      RootResetSelectorContract.Contract.InterInvocationState
        selectorContract) :
    first = second := by
  cases first
  cases second
  rfl

/-- Identical current bare terms produce identical dependent answers. -/
theorem identical_current_terms_same_selection {first second : Term}
    (equal : first = second) :
    HEq (selectorContract.select first) (selectorContract.select second) :=
  RootResetSelectorContract.Contract.select_congr selectorContract equal

/-- Any two boundary values induce the same full run on an unchanged term. -/
theorem unchanged_term_restart_same_run
    (first second :
      RootResetSelectorContract.Contract.InterInvocationState selectorContract)
    (term : Term) :
    selectorContract.invokeRun first term =
      selectorContract.invokeRun second term :=
  RootResetSelectorContract.Contract.invokeRun_state_independent
    selectorContract first second term

/-- Any two boundary values induce the same answer on an unchanged term. -/
theorem unchanged_term_restart_same_selection
    (first second :
      RootResetSelectorContract.Contract.InterInvocationState selectorContract)
    (term : Term) :
    selectorContract.invoke first term = selectorContract.invoke second term :=
  RootResetSelectorContract.Contract.invoke_state_independent
    selectorContract first second term

/-- An NF answer cannot accumulate progress across a root reset. -/
theorem nf_restart_no_accumulation {term : Term}
    {normal : AddressNormal term}
    (first second :
      RootResetSelectorContract.Contract.InterInvocationState selectorContract)
    (selected : selectorContract.select term = .nf normal) :
    selectorContract.invokeRun first term =
        selectorContract.invokeRun second term ∧
      selectorContract.invoke second term = .nf normal :=
  RootResetSelectorContract.Contract.restart_nf selectorContract
    first second selected

/-- The public selector's answer case determines an exact count of zero or one. -/
theorem selector_exact_mutation_count (term : Term) :
    match selectorContract.select term with
    | .nf _ =>
        FiniteController.runMutationCount machine (rootExecution term).ticks
          (initial term) = 0
    | .redex _ _ _ =>
        FiniteController.runMutationCount machine (rootExecution term).ticks
          (initial term) = 1 := by
  simpa [selectorContract, RootResetSelectorContract.Contract.initial] using!
    RootResetSelectorContract.Contract.exact_mutation_count selectorContract term

/-- Every invocation halts within the fixed coefficient-28 tick bound. -/
theorem selector_halts_linear (term : Term) :
    ∃ ticks ≤ 28 * (term.size + 1),
      let final := FiniteController.run machine ticks (initial term)
      (runtimeHaltKind haltKind final.control).isSome = true := by
  simpa [selectorContract, RootResetSelectorContract.Contract.initial] using!
    RootResetSelectorContract.Contract.halts_within selectorContract term

/-- Every invocation issues at most `28 (|T| + 1)` movement instructions. -/
theorem selector_moves_linear (term : Term) :
    runMoveCount machine (rootExecution term).ticks (initial term) ≤
      28 * (term.size + 1) :=
  rootExecution_moves_le term

end PureSFormal.Research.RootResetEulerWalker
