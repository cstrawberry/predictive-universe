import PureSFormal.PureS.BasePath
import PureSFormal.PureS.ActionParser
import PureSFormal.PureS.RouteGrammar
import PureSFormal.PureS.Pattern

/-!
# Shallow pending-frame guard

This is the static noncollision layer of Lemma 4.2.  It formalizes (10f),
including the requirement that the candidate body be the immediate right
child of its parent.  Pattern holes are independent wildcards; the guard
never compares any pair of captured subtrees.

The marked-Local exclusion is intentionally separate.  Its outer halt field
has the same arity as a pending-frame function, so that one theorem requires
the reachable-audit hypothesis that the marked field's first audit is a
whole carrier of arity five or six.  No reachability induction is claimed
here.
-/

namespace PureSFormal.PureS

namespace PendingFrame

/-! ## Equation (10f) and an executable guard -/

/-- The arity-two dispatcher-shaped slot `S (S h₀ h₁) (S h₂)`. -/
def envelopeSlot (hole₀ hole₁ hole₂ : Term) : Term :=
  .app
    (.app .s (.app (.app .s hole₀) hole₁))
    (.app .s hole₂)

/-- The shallow envelope `S (S (S h₀ h₁) (S h₂))`. -/
def envelope (hole₀ hole₁ hole₂ : Term) : Term :=
  .app .s (envelopeSlot hole₀ hole₁ hole₂)

/-- The immediate function `EEnv B` of a pending frame. -/
def frameFunction (hole₀ hole₁ hole₂ continuation : Term) : Term :=
  .app (envelope hole₀ hole₁ hole₂) continuation

/-- The complete shallow pending parent `(EEnv B) child`. -/
def pending
    (hole₀ hole₁ hole₂ continuation child : Term) : Term :=
  .app (frameFunction hole₀ hole₁ hole₂ continuation) child

@[simp]
theorem headArity_envelopeSlot (hole₀ hole₁ hole₂ : Term) :
    (envelopeSlot hole₀ hole₁ hole₂).headArity = 2 :=
  rfl

@[simp]
theorem headArity_envelope (hole₀ hole₁ hole₂ : Term) :
    (envelope hole₀ hole₁ hole₂).headArity = 1 :=
  rfl

@[simp]
theorem headArity_frameFunction
    (hole₀ hole₁ hole₂ continuation : Term) :
    (frameFunction hole₀ hole₁ hole₂ continuation).headArity = 2 :=
  rfl

@[simp]
theorem headArity_pending
    (hole₀ hole₁ hole₂ continuation child : Term) :
    (pending hole₀ hole₁ hole₂ continuation child).headArity = 3 :=
  rfl

/-- Exact fixed code is one diagonal instance of the shallow envelope. -/
@[simp]
theorem environmentCode_eq_envelope (actions : Term) (bits : List Bool) :
    environmentCode actions bits = envelope haltCode actions (word bits) :=
  rfl

/-- An exact pending frame is a diagonal instance of (10f). -/
@[simp]
theorem frame_eq_pending (actions : Term) (bits : List Bool)
    (continuation child : Term) :
    frame (environmentCode actions bits) continuation child =
      pending haltCode actions (word bits) continuation child :=
  rfl

/-- Independent-hole pattern for `S h₀ h₁`. -/
def pairPattern : Pattern :=
  .app (.app .s .hole) .hole

/-- Independent-hole pattern for `S (S h₀ h₁) (S h₂)`. -/
def envelopeSlotPattern : Pattern :=
  .app (.app .s pairPattern) (.app .s .hole)

/-- Independent-hole pattern for `EEnv`. -/
def envelopePattern : Pattern :=
  .app .s envelopeSlotPattern

/-- Independent continuation hole in `EEnv B`. -/
def frameFunctionPattern : Pattern :=
  .app envelopePattern .hole

/-- Independent body hole in `(EEnv B) child`. -/
def pendingPattern : Pattern :=
  .app frameFunctionPattern .hole

/--
Declarative success: the parent has the shallow pattern, `child` is the
subterm at the tested address, and that address is exactly the immediate
right child.
-/
def AtPendingChild (parent : Term) (position : Address) (child : Term) : Prop :=
  position = [.right] ∧
    Pattern.Matches pendingPattern parent ∧
    parent.subterm? position = some child

/--
Executable shallow guard.  It returns the current child only when both the
independent-hole pattern and the exact right-child position succeed.
-/
def guard? (parent : Term) (position : Address) : Option Term :=
  if position = [.right] then
    if Pattern.matchesBool pendingPattern parent then
      parent.subterm? position
    else
      none
  else
    none

theorem guard?_sound
    {parent : Term} {position : Address} {child : Term}
    (h : guard? parent position = some child) :
    AtPendingChild parent position child := by
  unfold guard? at h
  split at h
  next hposition =>
    split at h
    next hmatches =>
      exact ⟨hposition, Pattern.matchesBool_sound hmatches, h⟩
    next => contradiction
  next => contradiction

theorem guard?_complete
    {parent : Term} {position : Address} {child : Term}
    (h : AtPendingChild parent position child) :
    guard? parent position = some child := by
  rcases h with ⟨hposition, hmatches, hsubterm⟩
  unfold guard?
  rw [if_pos hposition]
  rw [if_pos (Pattern.matchesBool_complete hmatches)]
  exact hsubterm

theorem guard?_eq_some_iff
    (parent : Term) (position : Address) (child : Term) :
    guard? parent position = some child ↔
      AtPendingChild parent position child :=
  ⟨guard?_sound, guard?_complete⟩

@[simp]
theorem matchesBool_pending
    (hole₀ hole₁ hole₂ continuation child : Term) :
    Pattern.matchesBool pendingPattern
      (pending hole₀ hole₁ hole₂ continuation child) = true :=
  rfl

@[simp]
theorem guard?_pending
    (hole₀ hole₁ hole₂ continuation child : Term) :
    guard? (pending hole₀ hole₁ hole₂ continuation child) [.right] =
      some child := by
  simp [guard?, pending, pendingPattern, frameFunctionPattern,
    envelopePattern, envelopeSlotPattern, pairPattern, frameFunction,
    envelope, envelopeSlot, Pattern.matchesBool, Term.subterm?]

theorem guard?_wrongPosition
    (parent : Term) {position : Address}
    (hposition : position ≠ [.right]) :
    guard? parent position = none := by
  simp [guard?, hposition]

/-! ## General arity discriminator -/

theorem envelopeSlotPattern_headArity
    {term : Term} (h : Pattern.Matches envelopeSlotPattern term) :
    term.headArity = 2 := by
  change Pattern.Matches (.app (.app .s pairPattern) (.app .s .hole)) term at h
  cases h with
  | app hfn harg =>
      cases hfn with
      | app hs hpair =>
          cases hs
          rfl

theorem frameFunctionPattern_headArity
    {term : Term} (h : Pattern.Matches frameFunctionPattern term) :
    term.headArity = 2 := by
  change Pattern.Matches (.app envelopePattern .hole) term at h
  cases h with
  | app henvelope hcontinuation =>
      change Pattern.Matches (.app .s envelopeSlotPattern) _ at henvelope
      cases henvelope with
      | app hs hslot =>
          cases hs
          rfl

namespace AtPendingChild

theorem function_matches
    {fn argument : Term} {position : Address} {child : Term}
    (h : AtPendingChild (.app fn argument) position child) :
    Pattern.Matches frameFunctionPattern fn := by
  rcases h with ⟨hposition, hmatches, hsubterm⟩
  change Pattern.Matches (.app frameFunctionPattern .hole)
    (.app fn argument) at hmatches
  cases hmatches with
  | app hfn harg => exact hfn

theorem function_headArity
    {fn argument : Term} {position : Address} {child : Term}
    (h : AtPendingChild (.app fn argument) position child) :
    fn.headArity = 2 :=
  frameFunctionPattern_headArity h.function_matches

end AtPendingChild

/-- Any immediate function whose arity is not two cannot pass the guard. -/
theorem guard?_none_of_function_headArity_ne_two
    (fn child : Term) (hne : fn.headArity ≠ 2) :
    guard? (.app fn child) [.right] = none := by
  generalize hresult : guard? (.app fn child) [.right] = result
  cases result with
  | none => rfl
  | some found =>
      have hat := guard?_sound hresult
      exact (hne hat.function_headArity).elim

/-! ## Lemma 4.2 static noncollision table -/

@[simp]
theorem guard?_omega (position : Address) :
    guard? omega position = none := by
  by_cases hposition : position = [.right]
  · subst position
    rfl
  · exact guard?_wrongPosition omega hposition

/-- A live prefix `S,S,vᵢ` cannot match the envelope's dispatcher slot. -/
@[simp]
theorem guard?_liveCell (bit : Bool) (tail : Term) :
    guard? (.app (live bit) tail) [.right] = none := by
  rfl

/-- At the tombstone root the predecessor is at `LR`, not at `R`. -/
@[simp]
theorem guard?_tombstone_root
    (bit : Bool) (predecessor audit : Term) :
    guard? (Carrier.tombstone bit predecessor audit) [.left, .right] = none := by
  exact guard?_wrongPosition _ (by decide)

/-- At its immediate parent, a tombstone predecessor is under the leaf `S`. -/
@[simp]
theorem guard?_tombstone_predecessor (predecessor : Term) :
    guard? (.app .s predecessor) [.right] = none := by
  apply guard?_none_of_function_headArity_ne_two
  intro h
  cases h

/--
The substantive tombstone ascent fact: `LR` reaches the predecessor through
the intermediate parent `S predecessor`; that immediate parent rejects the
pending guard by arity, and the same predecessor is the canonical QueueStep
target.  The history audit is never inspected.
-/
theorem tombstone_predecessor_noncollision
    (bit : Bool) (predecessor audit : Term) :
    (Carrier.tombstone bit predecessor audit).subterm? [.left] =
        some (.app .s predecessor) ∧
      (Term.app .s predecessor).subterm? [.right] = some predecessor ∧
      guard? (.app .s predecessor) [.right] = none ∧
      Carrier.QueueStep (Carrier.tombstone bit predecessor audit)
        predecessor := by
  exact ⟨by simp [Carrier.tombstone, Term.subterm?],
    by simp [Term.subterm?],
    guard?_tombstone_predecessor predecessor,
    .tombstone bit predecessor audit⟩

/-- The selected action accumulator is under `p`, whose arity is one. -/
@[simp]
theorem guard?_actionPrefix (accumulator : Term) :
    guard? (.app p accumulator) [.right] = none := by
  apply guard?_none_of_function_headArity_ne_two
  intro h
  change 1 = 2 at h
  cases h

/-!
`ActionAscent` enumerates immediate parents, rather than treating the
multi-edge accumulator address as a single guard probe.  Its first index is
the address of the parent in the complete action spine.  The second address
is the one-edge position of the active child inside that parent.
-/

/--
Every immediate parent met while ascending from an equation-(8b)
accumulator.  The innermost parent is `p accumulator`, with the accumulator
at `R`.  A history constructor indexed by a split
`before ++ history :: suffix` records the parent made by that history; its
active prefix is at `L`, and the parent itself lies below one `L` per member
of `suffix` in the complete spine.
-/
inductive ActionAscent (accumulator : Term) (histories : List Term) :
    Address → Term → Address → Term → Prop where
  | innermost :
      ActionAscent accumulator histories
        (ActionParser.prefixLeft histories.length [])
        (.app p accumulator) [.right] accumulator
  | history
      (before : List Term) (history : Term) (suffix : List Term)
      (split : histories = before ++ history :: suffix) :
      ActionAscent accumulator histories
        (ActionParser.prefixLeft suffix.length [])
        (.app (Term.applyArgs (.app p accumulator) before) history)
        [.left]
        (Term.applyArgs (.app p accumulator) before)

namespace ActionAscent

/-- Each enumerated parent occurs at its indexed address in the full spine. -/
theorem parent_subterm
    {accumulator : Term} {histories : List Term}
    {parentAddress : Address} {parent : Term}
    {childPosition : Address} {child : Term}
    (h : ActionAscent accumulator histories parentAddress parent
      childPosition child) :
    (Term.applyArgs (.app p accumulator) histories).subterm? parentAddress =
      some parent := by
  cases h with
  | innermost =>
      simpa using
        ActionParser.subterm?_applyArgs_prefixLeft
          (.app p accumulator) histories []
  | history before history suffix split =>
      subst histories
      rw [Term.applyArgs_append]
      change
        (Term.applyArgs
          (.app (Term.applyArgs (.app p accumulator) before) history)
          suffix).subterm?
            (ActionParser.prefixLeft suffix.length []) =
          some (.app (Term.applyArgs (.app p accumulator) before) history)
      simpa using
        ActionParser.subterm?_applyArgs_prefixLeft
          (.app (Term.applyArgs (.app p accumulator) before) history)
          suffix []

/-- The indexed child position is genuinely one edge inside its parent. -/
theorem child_subterm
    {accumulator : Term} {histories : List Term}
    {parentAddress : Address} {parent : Term}
    {childPosition : Address} {child : Term}
    (h : ActionAscent accumulator histories parentAddress parent
      childPosition child) :
    parent.subterm? childPosition = some child := by
  cases h <;> simp [Term.subterm?]

/--
The enumeration has exactly the two manuscript cases: the innermost `p`
parent at `R`, or an outer history parent whose active child is at `L`.
-/
theorem innermost_or_history
    {accumulator : Term} {histories : List Term}
    {parentAddress : Address} {parent : Term}
    {childPosition : Address} {child : Term}
    (h : ActionAscent accumulator histories parentAddress parent
      childPosition child) :
    (parent = .app p accumulator ∧ childPosition = [.right] ∧
        child = accumulator) ∨
      childPosition = [.left] := by
  cases h with
  | innermost => exact Or.inl ⟨rfl, rfl, rfl⟩
  | history => exact Or.inr rfl

/--
Every immediate action-ascent parent rejects (10f): `p accumulator` by
function arity, and every history parent by its left-child position.
-/
theorem rejects_guard
    {accumulator : Term} {histories : List Term}
    {parentAddress : Address} {parent : Term}
    {childPosition : Address} {child : Term}
    (h : ActionAscent accumulator histories parentAddress parent
      childPosition child) :
    guard? parent childPosition = none := by
  cases h with
  | innermost => exact guard?_actionPrefix accumulator
  | history => exact guard?_wrongPosition _ (by decide)

end ActionAscent

/--
Strong action noncollision theorem.  For every enumerated immediate parent,
the parent occurs in the parsed action result, contains the stated active
child at one edge, and rejects the pending guard for the constructor-specific
reason captured by `ActionAscent`.
-/
theorem actionShape_ascent_noncollision
    {program : CTS.Program} {label : ActionLabel program}
    {accumulator : Term} {histories : List Term} {result : Term}
    (shape : ActionParser.ActionShape program label accumulator histories result)
    {parentAddress : Address} {parent : Term}
    {childPosition : Address} {child : Term}
    (ascent : ActionAscent accumulator histories parentAddress parent
      childPosition child) :
    result.subterm? parentAddress = some parent ∧
      parent.subterm? childPosition = some child ∧
      guard? parent childPosition = none := by
  rcases shape with ⟨historyLength, rfl⟩
  exact ⟨ascent.parent_subterm, ascent.child_subterm, ascent.rejects_guard⟩

/-- A weaker whole-spine corollary retained for direct parser use. -/
theorem guard?_actionSpine
    (accumulator : Term) (histories : List Term) :
    guard? (Term.applyArgs (.app p accumulator) histories)
        (ActionParser.accumulatorAddress histories.length) = none := by
  cases histories with
  | nil => exact guard?_actionPrefix accumulator
  | cons history histories =>
      apply guard?_wrongPosition
      simp

theorem guard?_actionShape
    {program : CTS.Program} {label : ActionLabel program}
    {accumulator : Term} {histories : List Term} {result : Term}
    (h : ActionParser.ActionShape program label accumulator histories result) :
    guard? result
        (ActionParser.accumulatorAddress (ActionParser.historyCount program label)) =
      none := by
  rcases h with ⟨hlength, rfl⟩
  rw [← hlength]
  exact guard?_actionSpine accumulator histories

/-- A selected response is under `S audit`, whose arity is one. -/
@[simp]
theorem guard?_chosenResponse (audit response : Term) :
    guard? (chosen audit response) [.right] = none := by
  apply guard?_none_of_function_headArity_ne_two
  intro h
  change 1 = 2 at h
  cases h

/-- In a selected-left fork, the active route is the function child. -/
@[simp]
theorem guard?_selectedLeftFork (active dormant : Term) :
    guard? (.app active dormant) [.left] = none := by
  exact guard?_wrongPosition _ (by decide)

/-- In a selected-right fork, the immediate function is a dormant arity-three call. -/
@[simp]
theorem guard?_selectedRightFork
    {Label : Type u} (encode : Label → Term)
    (tree : Dispatcher.Tree Label) (audit active : Term) :
    guard? (.app (RouteGrammar.compiledCall encode tree audit) active) [.right] =
      none := by
  apply guard?_none_of_function_headArity_ne_two
  intro h
  rw [RouteGrammar.compiledCall_headArity] at h
  cases h

/-- A fresh Local dispatcher field is under a halt field of arity three. -/
@[simp]
theorem guard?_freshLocalDispatcher (audit dispatcher : Term) :
    guard? (.app (freshHField audit) dispatcher) [.right] = none := by
  apply guard?_none_of_function_headArity_ne_two
  intro h
  rw [headArity_freshHField] at h
  cases h

/-- The exact arity fact supplied by the reachable whole-carrier invariant. -/
def WholeCarrierAudit (audit : Term) : Prop :=
  audit.headArity = 5 ∨ audit.headArity = 6

namespace WholeCarrierAudit

theorem ne_two {audit : Term} (h : WholeCarrierAudit audit) :
    audit.headArity ≠ 2 := by
  intro htwo
  rcases h with hfive | hsix
  · rw [hfive] at htwo
    cases htwo
  · rw [hsix] at htwo
    cases htwo

end WholeCarrierAudit

/--
If a marked halt field matched `EEnv B`, its first audit would have to match
the arity-two dispatcher slot of the shallow envelope.
-/
theorem marked_function_match_forces_audit_arity_two
    {leftAudit rightAudit : Term}
    (h : Pattern.Matches frameFunctionPattern
      (Carrier.markedHField leftAudit rightAudit)) :
    leftAudit.headArity = 2 := by
  change Pattern.Matches (.app envelopePattern .hole)
    (.app (.app .s leftAudit) (.app haltTag rightAudit)) at h
  cases h with
  | app henvelope hcontinuation =>
      change Pattern.Matches (.app .s envelopeSlotPattern)
        (.app .s leftAudit) at henvelope
      cases henvelope with
      | app hs hslot =>
          exact envelopeSlotPattern_headArity hslot

/--
Marked-Local exclusion.  Unlike the fresh case, this explicitly uses the
reachable-audit arity-five-or-six hypothesis on the first marked audit.
-/
theorem guard?_markedLocalDispatcher
    {leftAudit : Term} (rightAudit dispatcher : Term)
    (hAudit : WholeCarrierAudit leftAudit) :
    guard? (.app (Carrier.markedHField leftAudit rightAudit) dispatcher)
        [.right] = none := by
  generalize hresult :
    guard? (.app (Carrier.markedHField leftAudit rightAudit) dispatcher)
      [.right] = result
  cases result with
  | none => rfl
  | some found =>
      have hat := guard?_sound hresult
      have htwo :=
        marked_function_match_forces_audit_arity_two hat.function_matches
      exact (hAudit.ne_two htwo).elim

/-- An admissible Base continuation has arity three or four, never two. -/
theorem guard?_baseDirectAlpha
    (actions : Term) (bits : List Bool) {continuation : Term}
    (hcontinuation : Carrier.Admissible continuation) :
    guard?
        (.app continuation
          (baseAlpha (environmentCode actions bits) continuation))
        [.right] = none := by
  apply guard?_none_of_function_headArity_ne_two
  intro htwo
  rcases hcontinuation with hthree | hfour
  · rw [hthree] at htwo
    cases htwo
  · rw [hfour] at htwo
    cases htwo

/-! ## Immediate parents along the fixed BasePath descent -/

/-- Alpha enters `E*` through a function child, not a right argument. -/
@[simp]
theorem guard?_alphaToEnvironment
    (actions : Term) (bits : List Bool) :
    guard?
        (.app (environmentCode actions bits)
          (.app b (environmentCode actions bits)))
        [.left] = none := by
  exact guard?_wrongPosition _ (by decide)

/-- `E* = S D*`: the dispatcher child is under arity-zero `S`. -/
@[simp]
theorem guard?_environmentToDispatcher (actions : Term) (bits : List Bool) :
    guard? (environmentCode actions bits) [.right] = none := by
  apply guard?_none_of_function_headArity_ne_two
  intro h
  cases h

/-- `D* = S Act* Seed`: the seed child is under an arity-one function. -/
@[simp]
theorem guard?_dispatcherToSeed (actions : Term) (bits : List Bool) :
    guard? (dispatcherCode actions bits) [.right] = none := by
  apply guard?_none_of_function_headArity_ne_two
  intro h
  change 1 = 2 at h
  cases h

/-- `Seed_w = S Word(w)`: the literal word is under arity-zero `S`. -/
@[simp]
theorem guard?_seedToWord (bits : List Bool) :
    guard? (seedCode bits) [.right] = none := by
  apply guard?_none_of_function_headArity_ne_two
  intro h
  cases h

/--
All immediate parents encountered before the cell spine on the exact
`BasePath.wordAddress` descent reject the shallow pending guard.
-/
theorem fixedBasePath_noncollision
    (actions : Term) (bits : List Bool) {continuation : Term}
    (hcontinuation : Carrier.Admissible continuation) :
    guard?
        (.app continuation
          (baseAlpha (environmentCode actions bits) continuation))
        [.right] = none ∧
      guard?
        (.app (environmentCode actions bits)
          (.app b (environmentCode actions bits)))
        [.left] = none ∧
      guard? (environmentCode actions bits) [.right] = none ∧
      guard? (dispatcherCode actions bits) [.right] = none ∧
      guard? (seedCode bits) [.right] = none := by
  exact ⟨guard?_baseDirectAlpha actions bits hcontinuation,
    guard?_alphaToEnvironment actions bits,
    guard?_environmentToDispatcher actions bits,
    guard?_dispatcherToSeed actions bits,
    guard?_seedToWord bits⟩

end PendingFrame

end PureSFormal.PureS
