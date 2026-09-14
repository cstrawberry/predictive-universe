import PureSFormal.PureS.Activation

/-!
# Exact head-arity tests

Route parsing distinguishes the two child subtrees of a displayed dispatcher
fork by inspecting each child at that exact subtree boundary.  The activated
child has S-head arity two; the dormant wrapped call has arity three.  All
payloads below are universally quantified, so these facts perform no payload
comparison.
-/

namespace PureSFormal.PureS

namespace Term

/-- Applying one additional argument increments head arity by exactly one. -/
@[simp]
theorem headArity_app_eq (fn arg : Term) :
    (Term.app fn arg).headArity = fn.headArity + 1 := rfl

/-- Applying a finite argument list adds its length to head arity. -/
theorem headArity_applyArgs (fn : Term) (args : List Term) :
    (applyArgs fn args).headArity = fn.headArity + args.length := by
  induction args generalizing fn with
  | nil =>
      simp only [applyArgs, List.length_nil, Nat.add_zero]
  | cons arg rest ih =>
      simp only [applyArgs, ih, headArity, List.length_cons, Nat.succ_add,
        Nat.add_succ]

/-- Applying arguments appends them to the existing head-spine arguments. -/
theorem spineArgs_applyArgs (fn : Term) (args : List Term) :
    (applyArgs fn args).spineArgs = fn.spineArgs ++ args := by
  induction args generalizing fn with
  | nil =>
      simp only [applyArgs, List.append_nil]
  | cons arg rest ih =>
      simp only [applyArgs, ih, spineArgs, List.append_assoc,
        List.singleton_append]

/-- Boolean test of one supplied subtree's exact head arity. -/
def exactHeadArity (subtree : Term) (expected : Nat) : Bool :=
  decide (subtree.headArity = expected)

@[simp]
theorem exactHeadArity_eq_true_iff (subtree : Term) (expected : Nat) :
    exactHeadArity subtree expected = true ↔ subtree.headArity = expected := by
  simp only [exactHeadArity, decide_eq_true_eq]

end Term

/-- A wrapped code body `b Q = S S Q`. -/
def wrappedCode (body : Term) : Term :=
  .app b body

/-- A wrapped dispatcher code applied to an arbitrary payload. -/
def dormantCall (body payload : Term) : Term :=
  .app (wrappedCode body) payload

@[simp]
theorem headArity_b : b.headArity = 1 := rfl

/-- Activated children have exact S-head arity two at their child boundary. -/
@[simp]
theorem headArity_chosen (audit payload : Term) :
    (chosen audit payload).headArity = 2 := rfl

/-- Every wrapped code has arity two before receiving its payload. -/
@[simp]
theorem headArity_wrappedCode (body : Term) :
    (wrappedCode body).headArity = 2 := rfl

/-- A wrapped leaf code has arity two before application. -/
@[simp]
theorem headArity_leafCode (action : Term) :
    (leafCode action).headArity = 2 := rfl

/-- The unwrapped fork itself has arity two. -/
@[simp]
theorem headArity_forkCode (left right : Term) :
    (fork left right).headArity = 2 := rfl

/-- A wrapped internal-node code has arity two before application. -/
@[simp]
theorem headArity_nodeCode (left right : Term) :
    (nodeCode left right).headArity = 2 := rfl

/-- Dormant wrapped calls have exact S-head arity three. -/
@[simp]
theorem headArity_dormantCall (body payload : Term) :
    (dormantCall body payload).headArity = 3 := rfl

@[simp]
theorem exactHeadArity_chosen (audit payload : Term) :
    Term.exactHeadArity (chosen audit payload) 2 = true := by
  simp only [Term.exactHeadArity_eq_true_iff, headArity_chosen]

@[simp]
theorem exactHeadArity_dormantCall (body payload : Term) :
    Term.exactHeadArity (dormantCall body payload) 3 = true := by
  simp only [Term.exactHeadArity_eq_true_iff, headArity_dormantCall]

/-- Further arguments increase the activated wrapper's arity predictably. -/
theorem headArity_chosen_applyArgs
    (audit payload : Term) (further : List Term) :
    (Term.applyArgs (chosen audit payload) further).headArity =
      2 + further.length := by
  simpa only [headArity_chosen] using
    Term.headArity_applyArgs (chosen audit payload) further

/-- Further arguments increase a dormant call's arity predictably. -/
theorem headArity_dormant_applyArgs
    (body payload : Term) (further : List Term) :
    (Term.applyArgs (dormantCall body payload) further).headArity =
      3 + further.length := by
  simpa only [headArity_dormantCall] using
    Term.headArity_applyArgs (dormantCall body payload) further

/-- Chosen-wrapper arity is independent of both supplied payload terms. -/
theorem chosen_arity_payload_independent
    (audit₁ payload₁ audit₂ payload₂ : Term) :
    (chosen audit₁ payload₁).headArity =
      (chosen audit₂ payload₂).headArity := by
  simp only [headArity_chosen]

/-- Dormant-call arity is independent of both supplied payload terms. -/
theorem dormant_arity_payload_independent
    (body₁ payload₁ body₂ payload₂ : Term) :
    (dormantCall body₁ payload₁).headArity =
      (dormantCall body₂ payload₂).headArity := by
  simp only [headArity_dormantCall]

/--
At an exact fork-child boundary, an activated child cannot equal a dormant
wrapped call; their arities are two and three without inspecting payloads.
-/
theorem chosen_ne_dormantCall
    (audit activePayload body dormantPayload : Term) :
    chosen audit activePayload ≠ dormantCall body dormantPayload := by
  intro h
  have harity := congrArg Term.headArity h
  simp only [headArity_chosen, headArity_dormantCall] at harity
  cases harity

end PureSFormal.PureS
